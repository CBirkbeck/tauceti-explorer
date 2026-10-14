# Classical arithmetic, sequences, polynomials and reciprocity — CA.1 (continuation): residues and reciprocity

**Summary.** This part completes layer CA.1 of the roadmap. Four groups of material are added. The first is the degree-n norm-residue symbol of a local field, (a, b)_v = Art_v(a)(ⁿ√b)/ⁿ√b, built on Class Field Theory's local and archimedean Artin maps, together with its basic theory. CA.1's tame formula, degree-n product formula and power reciprocity law are statements about this symbol. The second is biquadratic reciprocity in ℤ[i] with its three supplements. The third is the Gauss-sum machinery behind Eisenstein reciprocity: the element Φ(P) = g(P)^m, Stickelberger's relation, the unit factor of a primary element and the residue identity at a second prime. The fourth is the number-field quadratic reciprocity law with explicit dyadic and archimedean factors, with the periodicity of the completed symbol and the compatibility of power residue symbols with norms. Fourteen supporting lemmas state, separately, steps that the first-pass targets of CA.1 use: root counts in finite fields, the squarefree part of a rational, primary Eisenstein integers, the cubic Jacobi and Gauss sums, the three cases of cubic reciprocity and its extension to rational denominators, and the normalising root of unity of a cyclotomic integer. A count of the zeros of a binary quadratic form on ℙ¹(𝔽_p) completes the layer.

The first part of CA.1 is [ClassicalArithmeticCompletion.md, CA.1](ClassicalArithmeticCompletion.md#ca1-residues-and-reciprocity); its targets are cited here as "first pass" and are not restated. The [packet](../packets/ClassicalArithmeticCompletion--CA.1.json) carries the full baseline, requests, source ledger and source issues, and the [suggested Lean file](../suggested/ClassicalArithmeticCompletion--CA.1.lean) states the declarations that can be stated at Mathlib `082e2d3` and Tau Ceti `f790474`.

## How this part joins the first pass

- The three degree-n targets of the first pass (CA.1/tame-hilbert-symbol-formula, CA.1/hilbert-product-formula-of-degree-n, CA.1/power-reciprocity-law) take their symbol (a, b)_v from [CA.1/norm-residue-symbol-at-a-place](#CA-1-norm-residue-symbol-at-a-place). The tame formula is the API item `normResidueSymbol_tame` of [CA.1/local-norm-residue-symbol](#CA-1-local-norm-residue-symbol) read at a completion (Fesenko–Vostokov IV.5.3).
- The first pass's CA.1/eisenstein-reciprocity takes its steps 1–3 from [CA.1/stickelberger-relation](#CA-1-stickelberger-relation), [CA.1/stickelberger-unit-factor-of-a-primary-element](#CA-1-stickelberger-unit-factor-of-a-primary-element) and [CA.1/eisenstein-reciprocity-at-ideal-norms](#CA-1-eisenstein-reciprocity-at-ideal-norms).
- The quartic residue symbol is the first pass's power residue symbol with n = 4 in ℚ(i); the quartic nodes add the normalisation (primary elements) and the theorems.
- Each supporting lemma names the first-pass target it serves.

## Conventions

- **Orientation of the norm-residue symbol.** (a, b)_{F,n} = Art_F(a)(β)/β with β^n = b: the first argument goes through the Artin map, the second through an n-th root. This is the orientation of Fesenko–Vostokov (IV.5.1) and Shastri (§5). Milne's symbol (III.4, Remark 4.5; VIII.5.9) is the transpose, (a, b)_Milne = (b, a)_{F,n} = (a, b)_{F,n}⁻¹. Test: in ℚ_7 with n = 3, (7, 2) is the cube root of unity ≡ 4 (mod 7) and (2, 7) the one ≡ 2.
- **Frobenius.** Every Artin map is normalised by arithmetic Frobenius (Class Field Theory §2.6).
- **Power residue symbols.** (x/𝔄)_n is the first pass's `powerResidueSymbolIdeal`: the product over the prime factors of 𝔄 of the root of unity ≡ x^{(N𝔭−1)/n}, at ideals of norm prime to n. (x/β)_n means (x/β𝓞_K)_n. Primes dividing n are never passed through the congruence formula.
- **Primary elements.** In ℤ[ω] (cubic): π ≡ 2 (mod 3), the first pass's `IsPrimaryEisenstein`. In ℤ[i] (quartic): α ≡ 1 (mod (1 + i)^3), here `IsPrimaryGaussian`. In ℤ[ζ_l] (Eisenstein): prime to l and congruent to a rational integer modulo (1 − ζ_l)², the first pass's `IsEisensteinPrimary`. The predicates are congruences; nonunit hypotheses are carried by the theorems.
- **Gauss and Jacobi sums** are Mathlib's `gaussSum` and `jacobiSum`, with χ(0) = 0 for nontrivial χ. In Φ(P) = g(P)^m the character is χ_P = (·/P)_m⁻¹, the inverse of the residue symbol, and the additive character is ψ(t) = ζ_p^{Tr(t)}.
- **Stickelberger element.** γ = Σ_{1≤t<m, (t,m)=1} t σ_t⁻¹ with σ_t(ζ_m) = ζ_m^t, acting on ideals by P^{Σ a_σ σ} = ∏ σ(P)^{a_σ}.
- **Quadratic Hilbert factors.** μ₂(α, β) and μ_∞(α, β) are the products of the degree-2 norm-residue symbols over the dyadic and the infinite places; |α/β| = μ_∞(α, β)(α/β).
- **Binary quadratic forms.** Q = mx² + rxy + ny² has discriminant d = r² − 4mn, not the determinant of its symmetric matrix.

## The degree-n norm-residue symbol

The symbol is defined from the local Artin map of Class Field Theory, in the orientation (a, b)_v = Art_v(a)(ⁿ√b)/ⁿ√b, and is the symbol that CA.1's tame formula, degree-n product formula and power reciprocity law are stated with. It moves down here from K2SymbolsBrauer T.7, which imports it. Its basic theory is Fesenko–Vostokov IV.5: bimultiplicativity, the Steinberg relation, skew symmetry, the norm criterion in both arguments, nondegeneracy and functoriality. The comparison theorem identifies it with Class Field Theory's cohomological localSymbol up to one universal sign, and with the quadratic norm-equation symbol for n = 2.

<a id="CA-1-local-norm-residue-symbol"></a>

### The degree-n norm-residue symbol of a nonarchimedean local field

`ClassicalArithmeticCompletion:CA.1/local-norm-residue-symbol` · definition · planet: *Norm-residue symbol*

Let F be a nonarchimedean local field, n ≥ 1, and suppose F contains a primitive n-th root of unity ζ (so the characteristic of F does not divide n and μ_n(Fˢ) ⊆ F). For a, b ∈ Fˣ choose β in a separable closure Fˢ with β^n = b; L = F(β) is a finite abelian (Kummer) extension of F. The degree-n norm-residue (Hilbert) symbol is (a, b)_{F,n} := Art_F(a)(β) / β ∈ μ_n(F), where Art_F(a) is the image of a under the local Artin map of Class Field Theory (Layer 6, localArtinMap for L/F; equivalently Layer 7, the absolute map artinMap F restricted to L), normalised by arithmetic Frobenius. The value does not depend on the root β, on the embedding of L in Fˢ, or on a and b beyond their classes in Fˣ/(Fˣ)^n.

Hypotheses and conventions: n ≥ 1 and F contains a primitive n-th root of unity; this forces char F ∤ n, so X^n − b is separable for b ≠ 0. Orientation is pinned: the first argument enters through the Artin map, the second through an n-th root. This is the orientation of Fesenko–Vostokov IV.5.1 and of Shastri §5; Milne's symbol (III.4, Remark 4.5; VIII.5.9) is the transpose, (a, b)_Milne = (b, a)_{F,n} = (a, b)_{F,n}⁻¹. The Artin map is normalised by arithmetic Frobenius (Class Field Theory §2.6): a uniformiser acts on an unramified extension as x ↦ x^q on residues. The value is an element of μ_n(F); no coordinate ζ is used in the definition, only in the comparison with the cohomological symbol.

API:

- `normResidueSymbol` (constructor): For a nonarchimedean local field F containing a primitive n-th root of unity and a, b ∈ Fˣ, the symbol (a, b)_{F,n} ∈ μ_n(F).
- `normResidueSymbol_spec` (characterisation): For every β ∈ Fˢ with β^n = b, the absolute Artin symbol of a sends β to (a, b)_{F,n} · β; equivalently localArtinMap F F(β) ι a acts on β by (a, b)_{F,n}.
- `normResidueSymbol_mul_left` (relation): (a a', b) = (a, b)(a', b).
- `normResidueSymbol_mul_right` (relation): (a, b b') = (a, b)(a, b').
- `normResidueSymbol_one_sub_self` (relation): Steinberg relation: (1 − a, a) = 1 for a ≠ 0, 1; and (−a, a) = 1 for every a.
- `normResidueSymbol_swap` (relation): Skew symmetry: (b, a) = (a, b)⁻¹.
- `normResidueSymbol_eq_one_iff_mem_normGroup` (characterisation): (a, b) = 1 if and only if a is a norm from F(β), β^n = b; and if and only if b is a norm from F(α), α^n = a.
- `normResidueSymbol_eq_one_forall_iff` (characterisation): (a, b) = 1 for every b ∈ Fˣ if and only if a ∈ (Fˣ)^n: the pairing Fˣ/(Fˣ)^n × Fˣ/(Fˣ)^n → μ_n is perfect.
- `normResidueSymbol_pow_of_dvd` (functoriality): If F contains a primitive (nm)-th root of unity then (a, b)_{F,nm}^m = (a, b)_{F,n}.
- `normResidueSymbol_norm` (functoriality): For a finite separable extension L/F, a ∈ Lˣ and b ∈ Fˣ: (a, b)_{L,n} = (N_{L/F} a, b)_{F,n}.
- `normResidueSymbol_map_ringEquiv` (functoriality): A continuous field isomorphism e : F ≃ F' carries (a, b)_{F,n} to (e a, e b)_{F',n}.
- `normResidueSymbol_tame` (compatibility): If the residue characteristic does not divide n and q is the residue cardinality, (a, b)_{F,n} is the root of unity congruent to ((−1)^{v(a)v(b)} b^{v(a)} a^{−v(b)})^{(q−1)/n} modulo the maximal ideal (the tame formula; its global reading is CA.1/tame-hilbert-symbol-formula).
- `normResidueSymbol_two_eq_hilbertSymbol` (compatibility): For n = 2, (a, b)_{F,2} = −1 exactly when a is not a norm from F(√b), that is, it is the quadratic norm-equation Hilbert symbol of Quadratic Form Invariants 6C (Tau Ceti's hilbertSymbol, read in ±1).
- `normResidueSymbol_eq_localSymbol` (compatibility): Through the coordinate log_ζ = muNRepEquivZMod ζ and the invariant coordinate of H²(F, μ_n), log_ζ (a, b)_{F,n} = ε · localSymbol (kummerCupPairing ζ) (kummerClass a) (kummerClass b) for a sign ε ∈ {1, −1} independent of F, n, ζ, a and b (CA.1/norm-residue-symbol-and-the-cohomological-symbol).

Unit tests:

- `normResidueSymbol_test_one` (degenerate): For n = 1 the symbol is identically 1.
- `normResidueSymbol_test_pow_right` (degenerate): (a, c^n)_{F,n} = 1 for all a, c ∈ Fˣ.
- `normResidueSymbol_test_Q7_cube` (computation): In F = ℚ_7 with n = 3 (μ_3 ⊆ ℚ_7 since 7 ≡ 1 mod 3), (7, 2)_{F,3} is the cube root of unity congruent to 4 = 2^{(7−1)/3} modulo 7.
- `normResidueSymbol_test_Q7_swap` (non-example): In the same field, (2, 7)_{F,3} is the cube root of unity congruent to 2 modulo 7, the inverse of (7, 2)_{F,3}: a definition with the arguments transposed (Milne's orientation) fails the previous test.
- `normResidueSymbol_test_units` (computation): In ℚ_7 with n = 3, (2, 3)_{F,3} = 1: two units at a place prime to n pair trivially.
- `normResidueSymbol_test_Q2_quadratic` (compatibility): In F = ℚ_2 with n = 2, (−1, −1)_{F,2} = −1 = hilbertSymbol (−1) (−1), while (−1, 5)_{F,2} = 1.

Uses:

- CA.1/tame-hilbert-symbol-formula, CA.1/hilbert-product-formula-of-degree-n and CA.1/power-reciprocity-law: their degree-n Hilbert symbol (a, b)_v is this symbol at the completion K_v (through CA.1/norm-residue-symbol-at-a-place); the tame formula is its value at places prime to n
- Fesenko–Vostokov IV.5.1–5.3: properties (1)–(9) and the tame symbol formula are the API of the symbol
- Milne, Chapter VIII, Theorem 5.11: the power reciprocity law expresses (a/b)(b/a)⁻¹ as a product of these symbols at the places in S
- FIMR §2 and Koymans–Milovic Lemma 2.1: for n = 2 the local factors μ₂ and μ_∞ are products of these symbols at the dyadic and archimedean places
- K2SymbolsBrauer:T.7 (classical local symbols): imports this symbol as the Steinberg symbol K₂(F) → μ_n of a local field
- Fesenko–Vostokov VII.5, Exercises 1 and 4; HigherLocalFieldsAndHigherClassFieldTheory:HL.4: the Artin–Hasse and Vostokov formulas evaluate this symbol at the places above p of ℚ_p(ζ_{p^m}); HL.4 imports it

Acceptance checks:

- (7, 2)_{ℚ_7,3} is the cube root of unity of ℚ_7 congruent to 4 modulo 7, and (2, 7)_{ℚ_7,3} the one congruent to 2: the symbol is not symmetric, and the orientation is visible.
- For n = 2 and F = ℚ_2, (−1, −1)_{F,2} = −1, the value of the quadratic norm-equation symbol.
- For every a and every c, (a, c^n)_{F,n} = 1.

Proof sketch:

1. Separability and Kummer theory: X^n − b is separable (Polynomial.separable_X_pow_sub_C, n a unit in F); since μ_n ⊆ F, L = F(β) is the splitting field of X^n − b (isSplittingField_X_pow_sub_C_of_root_adjoin_eq_top), so L/F is Galois, and σ ↦ σ(β)/β embeds Gal(L/F) in μ_n(F) (autAdjoinRootXPowSubCEquiv when X^n − b is irreducible; in general the same cocycle computation), so L/F is abelian.
2. The Artin symbol: Art_F(a) ∈ Gal(L/F)^ab = Gal(L/F) is localArtinMap F L ι a (Class Field Theory Layer 6); by artinMap_restrict (Layer 7) it is the restriction of the absolute symbol, and by localArtinEquiv_eq_of_iota it does not depend on the embedding ι. Set (a, b)_{F,n} := Art_F(a)(β)/β; it is an n-th root of unity of L, hence lies in μ_n(F).
3. Independence of β: another root is β' = ξβ with ξ ∈ μ_n(F), and Art_F(a) fixes ξ, so Art_F(a)(β')/β' = Art_F(a)(β)/β.
4. Dependence on classes: replacing b by b c^n replaces β by βc with c ∈ F, which Art_F(a) fixes; replacing a by a c^n multiplies Art_F(a) by Art_F(c)^n, which is trivial on L because Gal(L/F) has exponent dividing n.

Direct prerequisites: `mathlib:Polynomial.separable_X_pow_sub_C`, `mathlib:autAdjoinRootXPowSubCEquiv`, `mathlib:isSplittingField_X_pow_sub_C_of_root_adjoin_eq_top`, `mathlib:IsNonarchimedeanLocalField`, `mathlib:rootsOfUnity`, `mathlib:Field.absoluteGaloisGroup`.

Tau Ceti roadmap layers used: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

Source: [I. B. Fesenko and S. V. Vostokov, *Local Fields and Their Extensions*](https://ivanfesenko.org/wp-content/uploads/2021/10/vol.pdf), Chapter IV, §5, (5.1), definition and the paragraph after it, p. 143. Defines the n-th Hilbert (norm-residue) symbol of a local field containing μ_n (with p ∤ n in characteristic p) as γ⁻¹Ψ_F(α)(γ) for γ^n = β, exactly the orientation pinned here, and checks independence of the root γ.

Source: [J. S. Milne, *Class Field Theory*](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter III, §4, Remark 4.5, p. 114; Chapter VIII, §5, 5.9, p. 247. Relates Milne's Hilbert symbol to the local Artin map: the Artin symbol of b acts on an n-th root of a by Milne's (a, b); so Milne's symbol is the transpose of the one defined here.

Source: [Parvati Shastri, *Reciprocity Laws: Artin–Hilbert*](https://www.bprim.org/sites/default/files/rlmain.pdf), §5, the definition of ⟨a, b⟩_n and Remark 2, pp. 178–179. The same symbol, χ_b of the local Artin symbol of a, with values in μ_n, in the same orientation, and its nondegeneracy.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §4, p. 68. The global power residue symbol that the local symbol refines at places prime to n (through the tame formula).

<a id="CA-1-archimedean-norm-residue-symbol"></a>

### The norm-residue symbol of ℝ and ℂ

`ClassicalArithmeticCompletion:CA.1/archimedean-norm-residue-symbol` · definition

Let F be ℝ or ℂ (the completion of a number field at an infinite place) and n ≥ 1 with μ_n ⊆ F (so n ≤ 2 when F = ℝ). For a, b ∈ Fˣ and β ∈ ℂ with β^n = b, (a, b)_{F,n} := Art_F(a)(β)/β ∈ μ_n(F), where Art_F is the archimedean Artin map of Class Field Theory Layer 10 (infiniteArtinAt): trivial for F = ℂ, and for F = ℝ the map sending a to complex conjugation when a < 0 and to the identity when a > 0. Explicitly (a, b)_{ℂ,n} = 1, and (a, b)_{ℝ,2} = −1 exactly when a < 0 and b < 0; (a, b)_{ℝ,1} = 1.

Hypotheses and conventions: F = ℝ or F = ℂ with its usual topology; μ_n ⊆ F. Same orientation as the nonarchimedean symbol: the first argument through the Artin map.

API:

- `archNormResidueSymbol` (constructor): For F = ℝ or ℂ with μ_n ⊆ F, the symbol (a, b)_{F,n} ∈ μ_n(F).
- `archNormResidueSymbol_complex` (simp): (a, b)_{ℂ,n} = 1.
- `archNormResidueSymbol_real` (characterisation): (a, b)_{ℝ,2} = −1 if and only if a < 0 and b < 0.
- `archNormResidueSymbol_spec` (characterisation): infiniteArtinAt sends β to (a, b)·β whenever β^n = b.
- `archNormResidueSymbol_eq_one_iff` (characterisation): (a, b) = 1 if and only if a is a norm from F(β).
- `archNormResidueSymbol_mul_left` (relation): Bimultiplicativity, as for the nonarchimedean symbol.
- `archNormResidueSymbol_two_compat` (compatibility): For F = ℝ and n = 2 it is the real norm-equation symbol of Global Quadratic Forms 4.4 and the sign form of Class Field Theory's infiniteHilbertInvariantAt.

Unit tests:

- `archNormResidueSymbol_test_neg_neg` (computation): (−1, −1)_{ℝ,2} = −1.
- `archNormResidueSymbol_test_complex` (degenerate): (a, b)_{ℂ,3} = 1 for all a, b ∈ ℂˣ.
- `archNormResidueSymbol_test_sign_product` (non-example): (2, −3)_{ℝ,2} = 1, although sign(2)·sign(−3) = −1: the symbol is not the product of the signs.
- `archNormResidueSymbol_test_n_one` (degenerate): (a, b)_{ℝ,1} = 1.

Uses:

- CA.1/hilbert-product-formula-of-degree-n: the factors at the infinite places, trivial for n ≥ 3
- CA.1/power-reciprocity-law and CA.1/quadratic-reciprocity-in-a-number-field: the archimedean factors μ_∞ of the reciprocity law
- FIMR (2.1): the completed quadratic residue symbol multiplies (α/β) by μ_∞(α, β)

Acceptance checks:

- (−1, −1)_{ℝ,2} = −1 and (−1, 1)_{ℝ,2} = (2, −3)_{ℝ,2} = 1.
- (a, b)_{ℂ,n} = 1 for all n.

Proof sketch:

1. Art_ℂ is trivial (infiniteArtinAt_eq_one_of_isComplex), so (a, b)_ℂ = 1.
2. Art_ℝ(a) is complex conjugation exactly when a < 0 (infiniteArtinAt_eq_one_iff_of_isReal); conjugation sends √b to −√b exactly when b < 0, so (a, b)_ℝ = −1 exactly when a < 0 and b < 0.
3. Bimultiplicativity, skew symmetry and the norm criterion follow from these values; for n = 2 the symbol agrees with the real quadratic norm-equation symbol of Global Quadratic Forms 4.4.

Direct prerequisites: `mathlib:NumberField.InfinitePlace`, `mathlib:NumberField.InfinitePlace.Completion`, `mathlib:NumberField.InfinitePlace.IsReal`, `mathlib:NumberField.InfinitePlace.IsComplex`.

Tau Ceti roadmap layers used: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`.

Source: [J. S. Milne, *Class Field Theory*](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter VIII, §5, the paragraph after Theorem 5.11, p. 248. States the archimedean values: trivial at complex places, and at a real place the symbol is 1 exactly when a > 0 or b > 0.

Source: [I. B. Fesenko and S. V. Vostokov, *Local Fields and Their Extensions*](https://ivanfesenko.org/wp-content/uploads/2021/10/vol.pdf), Chapter IV, §5, Exercise 4, p. 150. The real quadratic symbol: 1 when a > 0 or b > 0 and −1 otherwise, entering the product formula over ℚ.

<a id="CA-1-norm-residue-symbol-at-a-place"></a>

### The degree-n norm-residue symbol at a place of a number field

`ClassicalArithmeticCompletion:CA.1/norm-residue-symbol-at-a-place` · definition

Let K be a number field containing a primitive n-th root of unity ζ. For a place v of K and a, b ∈ Kˣ, (a, b)_v := (a, b)_{K_v,n}, the norm-residue symbol of the completion K_v at the images of a and b: the nonarchimedean symbol at a finite place v (K_v = v.adicCompletion K, which contains ζ) and the archimedean symbol at an infinite place (K_v ≅ ℝ or ℂ; for n ≥ 3 every infinite place is complex because ζ is not real). The value lies in μ_n(K_v) = μ_n(K), identified through ζ.

Hypotheses and conventions: K is a number field and ζ ∈ K is a primitive n-th root of unity, n ≥ 1. Places are Mathlib's: finite places are IsDedekindDomain.HeightOneSpectrum (𝓞 K), infinite places are NumberField.InfinitePlace K.

API:

- `hilbertSymbolAt` (constructor): (a, b)_v for a place v of K and a, b ∈ Kˣ, with values in μ_n(K).
- `hilbertSymbolAt_finite` (characterisation): At a finite place it is the local symbol of v.adicCompletion K.
- `hilbertSymbolAt_infinite` (characterisation): At an infinite place it is the archimedean symbol; it is 1 when n ≥ 3.
- `hilbertSymbolAt_tame` (compatibility): At a finite place not dividing n it is given by the tame formula (CA.1/tame-hilbert-symbol-formula).
- `hilbertSymbolAt_eq_one_of_unit` (simp): If v ∤ n is finite and a, b are v-adic units then (a, b)_v = 1; hence (a, b)_v = 1 for all but finitely many v.
- `hilbertSymbolAt_galois` (functoriality): For σ ∈ Aut(K), σ((a, b)_v) = (σa, σb)_{σv}.
- `hilbertSymbolAt_two` (compatibility): For n = 2 it is the quadratic Hilbert symbol (α, β / 𝔭) of FIMR §2 and the sign form of Class Field Theory's finiteHilbertInvariantAt and infiniteHilbertInvariantAt.

Unit tests:

- `hilbertSymbolAt_test_Q_odd` (computation): For K = ℚ, n = 2 and v = 7: (7, 3)_7 = legendreSym 7 3 = −1.
- `hilbertSymbolAt_test_infinite_cubic` (degenerate): For K = ℚ(ζ_3) and n = 3, (a, b)_w = 1 at the unique infinite place w.
- `hilbertSymbolAt_test_conjugate_places` (characterisation): For K = ℚ(ζ_3), n = 3 and the primes 𝔭, 𝔭̄ above 7, (7, 2)_𝔭 · (7, 2)_𝔭̄ = 1 while (7, 2)_𝔭 ≠ 1.
- `hilbertSymbolAt_test_Q_infinite` (non-example): For K = ℚ, n = 2: (−1, −1)_∞ = −1 while (−1, −1)_p = 1 for every odd p; the archimedean factor is not trivial for n = 2.

Uses:

- CA.1/hilbert-product-formula-of-degree-n: the product over all places of (a, b)_v
- CA.1/power-reciprocity-law: the correction factor ∏_{v | n∞} (a, b)_v
- CA.1/quadratic-reciprocity-in-a-number-field: μ₂ and μ_∞ for n = 2

Acceptance checks:

- For K = ℚ, n = 2 and an odd prime p, (p, u)_p = legendreSym p u for a p-adic unit u, the reading of CA.1/hilbert-symbol.
- For K = ℚ(ζ_3), n = 3 and the two primes 𝔭, 𝔭̄ above 7, (7, 2)_𝔭 (7, 2)_𝔭̄ = 1: complex conjugation exchanges the two places and inverts the value.

Proof sketch:

1. At a finite place, K_v is a nonarchimedean local field containing the image of ζ; apply the local symbol.
2. At an infinite place, K_v is ℝ or ℂ; apply the archimedean symbol. If n ≥ 3, ζ ∉ ℝ, so no infinite place is real and every archimedean factor is 1.
3. μ_n(K) maps isomorphically onto μ_n(K_v) for every v, so all values can be read in μ_n(K).

Direct prerequisites: [CA.1/local-norm-residue-symbol](#CA-1-local-norm-residue-symbol), [CA.1/archimedean-norm-residue-symbol](#CA-1-archimedean-norm-residue-symbol), `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletion`, `mathlib:NumberField.InfinitePlace`, `mathlib:NumberField.InfinitePlace.Completion`.

Source: [J. S. Milne, *Class Field Theory*](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter VIII, §5, 'The Hilbert symbol', 5.6–5.10, pp. 245–247. The Hilbert symbol (a, b)_v of a number field containing μ_n at all places, with its tame formula 5.8 and product formula 5.10.

Source: [Parvati Shastri, *Reciprocity Laws: Artin–Hilbert*](https://www.bprim.org/sites/default/files/rlmain.pdf), §§6–8, pp. 180–181. The global family of local symbols at all places of a number field containing μ_n, whose product formula is Shastri's Theorem 4.

<a id="CA-1-norm-residue-symbol-steinberg-and-skew-symmetry"></a>

### Bimultiplicativity, the Steinberg relation and skew symmetry of the norm-residue symbol

`ClassicalArithmeticCompletion:CA.1/norm-residue-symbol-steinberg-and-skew-symmetry` · theorem

Let F be a nonarchimedean local field containing a primitive n-th root of unity. For a, a', b, b' ∈ Fˣ: (a a', b) = (a, b)(a', b) and (a, b b') = (a, b)(a, b'); (1 − a, a) = 1 whenever a ≠ 1; (−a, a) = 1; and (b, a) = (a, b)⁻¹. The same identities hold for the archimedean symbol.

Hypotheses and conventions: F nonarchimedean local containing μ_n; a ≠ 0 throughout, and a ≠ 1 in the Steinberg relation. The identities are stated for the pinned orientation; they are invariant under transposition, so they hold verbatim for Milne's symbol.

Acceptance checks:

- In ℚ_7 with n = 3, (7, 2)(2, 7) = 1 (values congruent to 4 and 2 modulo 7).
- (a, −a) = 1 gives (a, a) = (a, −1), so (a, a) = 1 when n is odd.

Proof sketch:

1. Left multiplicativity: Art_F is a homomorphism and fixes μ_n(F) ∋ (a', b), so Art(aa')(β)/β = Art(a)(Art(a')(β))/β = (a, b)(a', b).
2. Right multiplicativity: with β₁^n = b, β₂^n = b', the product β₁β₂ is an n-th root of bb', and Art(a)(β₁β₂)/(β₁β₂) = (a, b)(a, b').
3. Steinberg: factor X^n − a = ∏ f_i into irreducibles over F; every root α_i generates the same field L = F(ⁿ√a) because the roots differ by elements of μ_n ⊆ F, so 1 − a = ∏ f_i(1) = ∏ N_{L/F}(1 − α_i) is a norm from L; by the norm criterion (second form) (1 − a, a) = 1.
4. (−a, a) = 1: −a = (1 − a)/(1 − a⁻¹), and (1 − a⁻¹, a) = (1 − a⁻¹, a⁻¹)⁻¹ = 1.
5. Skew symmetry: 1 = (ab, −ab) = (a, −a)(a, b)(b, a)(b, −b) = (a, b)(b, a).

Direct prerequisites: [CA.1/local-norm-residue-symbol](#CA-1-local-norm-residue-symbol), [CA.1/norm-residue-symbol-norm-criterion](#CA-1-norm-residue-symbol-norm-criterion).

Source: [I. B. Fesenko and S. V. Vostokov, *Local Fields and Their Extensions*](https://ivanfesenko.org/wp-content/uploads/2021/10/vol.pdf), Chapter IV, §5, (5.1) Proposition (1)–(4) and its proof, pp. 143–144. Bilinearity, the Steinberg property (1 − α, α) = 1, (−α, α) = 1 and skew symmetry, with the proofs followed in the steps.

Source: [Parvati Shastri, *Reciprocity Laws: Artin–Hilbert*](https://www.bprim.org/sites/default/files/rlmain.pdf), §5, Lemma 1 and its proof, pp. 179–180. Bimultiplicativity, the Steinberg relation and skew symmetry; the printed proof of the Steinberg relation treats only the case [K(ⁿ√a):K] = n (source issue E1108).

Source: [J. S. Milne, *Class Field Theory*](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter III, §4, Theorem 4.4 (a)–(b), p. 113. Bimultiplicativity and skew symmetry of the cup-product symbol.

<a id="CA-1-norm-residue-symbol-norm-criterion"></a>

### The norm criterion and nondegeneracy of the norm-residue symbol

`ClassicalArithmeticCompletion:CA.1/norm-residue-symbol-norm-criterion` · theorem

Let F be a nonarchimedean local field containing a primitive n-th root of unity, and a, b ∈ Fˣ. Then (a, b)_{F,n} = 1 if and only if a is a norm from F(β) (β^n = b), if and only if b is a norm from F(α) (α^n = a). Moreover (a, b)_{F,n} = 1 for every b if and only if a ∈ (Fˣ)^n, and (a, b)_{F,n} = 1 for every a if and only if b ∈ (Fˣ)^n; so the symbol induces a perfect pairing Fˣ/(Fˣ)^n × Fˣ/(Fˣ)^n → μ_n(F). For a subgroup A ⊇ (Fˣ)^n of Fˣ with orthogonal B = A^⊥, A is the norm group of F(ⁿ√B).

Hypotheses and conventions: F nonarchimedean local, μ_n ⊆ F. The second form uses skew symmetry (CA.1/norm-residue-symbol-steinberg-and-skew-symmetry).

Acceptance checks:

- For F = ℚ_p with p odd and n = 2, (p, u) = 1 exactly when u is a square modulo p, i.e. when p is a norm from ℚ_p(√u).
- In ℚ_7 with n = 3, (7, 2)_3 ≠ 1, so 7 is not a norm from ℚ_7(∛2), and 2 is not a cube in ℚ_7.

Proof sketch:

1. (a, b) = 1 exactly when Art_F(a) fixes β, i.e. acts trivially on L = F(β); by local reciprocity (Class Field Theory Layer 6: the kernel of localArtinMap F L is the norm group N_{L/F}(Lˣ)), exactly when a ∈ N_{L/F}(Lˣ).
2. By skew symmetry (b, a) = (a, b)⁻¹, so (a, b) = 1 exactly when b is a norm from F(α).
3. If (a, b) = 1 for all a then N_{L/F}(Lˣ) = Fˣ; the index of the norm group equals [L:F] for the abelian extension L/F (Layer 6), so L = F and b = β^n ∈ (Fˣ)^n. Symmetrically for a.
4. Both sides being the finite group Fˣ/(Fˣ)^n, the pairing is perfect; the orthogonality statement is Fesenko–Vostokov's Theorem (5.2), deduced from the perfectness by counting.

Direct prerequisites: [CA.1/local-norm-residue-symbol](#CA-1-local-norm-residue-symbol).

Tau Ceti roadmap layers used: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`.

Source: [I. B. Fesenko and S. V. Vostokov, *Local Fields and Their Extensions*](https://ivanfesenko.org/wp-content/uploads/2021/10/vol.pdf), Chapter IV, §5, (5.1) Proposition (5) and (6), Corollary, and (5.2) Theorem, pp. 143–145. The norm criterion in both arguments, nondegeneracy, the induced perfect pairing, and the description of norm groups as orthogonals.

Source: [J. S. Milne, *Class Field Theory*](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter III, §4, Theorem 4.4 (c)–(d), p. 113. Nondegeneracy and the norm criterion for Milne's (transposed) symbol.

<a id="CA-1-norm-residue-symbol-functoriality"></a>

### Functoriality of the norm-residue symbol in n, in the field and under isomorphisms

`ClassicalArithmeticCompletion:CA.1/norm-residue-symbol-functoriality` · theorem

Let F be a nonarchimedean local field containing a primitive n-th root of unity. (i) If F contains a primitive (nm)-th root of unity, then (a, b)_{F,nm}^m = (a, b)_{F,n}. (ii) For a finite separable extension L/F, a ∈ Lˣ and b ∈ Fˣ: (a, b)_{L,n} = (N_{L/F}(a), b)_{F,n}. (iii) For a continuous isomorphism of fields e : F ≃ F' (more generally σ ∈ Gal(Fˢ/F) with L ⊇ μ_n), e((a, b)_{F,n}) = (e a, e b)_{F',n}.

Hypotheses and conventions: μ_n ⊆ F in (i)–(iii); μ_{nm} ⊆ F in (i). In (ii) the symbol on the left is the symbol of L (which contains μ_n ⊆ F).

Acceptance checks:

- (i) with n = 1: (a, b)_{F,m}^m = 1.
- (ii) for a ∈ Fˣ ⊆ Lˣ and [L:F] = f: (a, b)_{L,n} = (a^f, b)_{F,n} = (a, b)_{F,n}^f, since N_{L/F}(a) = a^f.

Proof sketch:

1. (i): if γ^{nm} = b then γ^m is an n-th root of b, and (Art(a)(γ)/γ)^m = Art(a)(γ^m)/γ^m.
2. (ii): the norm functoriality of the absolute Artin map (Class Field Theory Layer 7, artinMap_norm): the Artin symbol of a ∈ Lˣ restricted to F(β) is the Artin symbol of N_{L/F} a.
3. (iii): naturality of the absolute Artin map under isomorphisms (artinMap_congr, Layer 7), applied to an n-th root of b.

Direct prerequisites: [CA.1/local-norm-residue-symbol](#CA-1-local-norm-residue-symbol).

Tau Ceti roadmap layers used: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

Source: [I. B. Fesenko and S. V. Vostokov, *Local Fields and Their Extensions*](https://ivanfesenko.org/wp-content/uploads/2021/10/vol.pdf), Chapter IV, §5, (5.1) Proposition (7)–(9) and their proofs, pp. 143–145. Power compatibility, norm compatibility along finite separable extensions via Theorem (4.2), and Galois transport.

<a id="CA-1-norm-residue-symbol-and-the-cohomological-symbol"></a>

### The norm-residue symbol and Class Field Theory's cohomological local symbol

`ClassicalArithmeticCompletion:CA.1/norm-residue-symbol-and-the-cohomological-symbol` · comparison

Let F be a nonarchimedean local field containing a primitive n-th root of unity ζ, and let tr : H²(F, μ_n) ≃ ℤ/n be the invariant coordinate of Class Field Theory Layer 5 (h2MuEquivZMod_mixed). There is a sign ε ∈ {1, −1}, depending only on the conventions of kummerClass, of the cup product and of tr (not on F, n, ζ, a, b), such that for all a, b ∈ Fˣ: log_ζ (a, b)_{F,n} = ε · localSymbol (kummerCupPairing ζ) tr (kummerClass n F a) (kummerClass n F b) in ℤ/n, where log_ζ = muNRepEquivZMod ζ. The sign is fixed by one computation: for F unramified over ℚ_p with residue field of q ≡ 1 (mod n) elements, a uniformiser π and a unit u, the left side is the exponent k with ζ^k ≡ u^{(q−1)/n} (tame formula). For n = 2 the sign is irrelevant and the statement reads: (a, b)_{F,2} = −1 if and only if localSymbol (kummerCupPairing (−1)) tr (kummerClass a) (kummerClass b) = 1, Tau Ceti's localArtinMap_quadratic_eq_hilbertSymbol.

Hypotheses and conventions: F nonarchimedean local, ζ ∈ F a primitive n-th root of unity; tr is the invariant coordinate, not an arbitrary isomorphism (localSymbol is stated in Class Field Theory with tr as a parameter; any other coordinate rescales the right side by a unit of ℤ/n). The comparison is with the named pairing kummerCupPairing ζ; the zero pairing would make the right side vanish.

Acceptance checks:

- For n = 2 and F = ℚ_2: (−1, −1) = −1 and the cohomological symbol of (kummerClass (−1), kummerClass (−1)) is 1 ∈ ℤ/2.
- The sign ε is the same for all local fields: it is fixed once, in the unramified case.

Proof sketch:

1. Milne (III.4, Remark 4.5) shows that the cup-product symbol of Kummer classes, read through the invariant, is the Artin-map symbol with its arguments transposed; by skew symmetry the transposition is the inverse, so the two symbols agree up to a sign of the coordinate.
2. Both sides are bimultiplicative and vanish exactly on norms (CA.1/norm-residue-symbol-norm-criterion; Class Field Theory's localSymbol_eq_zero_iff_mem_normGroup), and the sign is determined by the unramified computation, where the left side is the tame value and the right side is computed from the cyclic-algebra description of the cup of two Kummer classes (Layer 5, step 2 of the duality proof).
3. For n = 2 both sides are ±1-valued and the equivalence is Class Field Theory Layer 6's localArtinMap_quadratic_eq_hilbertSymbol.

Direct prerequisites: [CA.1/local-norm-residue-symbol](#CA-1-local-norm-residue-symbol), [CA.1/norm-residue-symbol-norm-criterion](#CA-1-norm-residue-symbol-norm-criterion).

Tau Ceti roadmap layers used: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

Source: [J. S. Milne, *Class Field Theory*](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter III, §4, the definition by cup product and Remark 4.5, pp. 112–114. Defines the Hilbert symbol by the cup product of Kummer classes followed by the invariant, and states its relation to the local Artin map, from which the comparison and its transposition are read.

Source: [I. B. Fesenko and S. V. Vostokov, *Local Fields and Their Extensions*](https://ivanfesenko.org/wp-content/uploads/2021/10/vol.pdf), Chapter IV, §5, (5.3) Theorem, pp. 145–146. The tame formula that fixes the sign in the unramified case.

## Quadratic reciprocity in a number field and norm compatibility

The case n = 2 of the power reciprocity law, with its dyadic and archimedean factors μ₂ and μ_∞ written out, the completed symbol |α/β| = μ_∞(α, β)(α/β) of Friedlander–Iwaniec–Mazur–Rubin and its periodicity modulo 8α, and the compatibility of power residue symbols with relative norms of ideals. These are the inputs Koymans–Milovic (Lemma 2.1 and §5) take from CA.1.

<a id="CA-1-completed-quadratic-residue-symbol"></a>

### The completed quadratic residue symbol |α/β| of a number field

`ClassicalArithmeticCompletion:CA.1/completed-quadratic-residue-symbol` · definition

Let K be a number field. For α, β ∈ 𝓞_K with α ≠ 0 and β odd (β𝓞_K prime to 2), put μ_∞(α, β) = ∏_{v | ∞} (α, β)_v and μ₂(α, β) = ∏_{v | 2} (α, β)_v, products of the degree-2 norm-residue symbols at the infinite and the dyadic places, μ(α, β) = μ₂(α, β) μ_∞(α, β), and define the completed quadratic residue symbol |α/β| := μ_∞(α, β) · (α/β), where (α/β) is the quadratic residue symbol at the ideal β𝓞_K (the power residue symbol with n = 2). If α or β is totally positive, or K is totally complex, then |α/β| = (α/β).

Hypotheses and conventions: K a number field; −1 is a primitive square root of unity in 𝓞_K, so the power residue symbol with n = 2 is defined at every odd ideal. α ≠ 0 so that the local symbols (α, β)_v are defined; |α/β| = 0 when α and β are not coprime. β odd: β𝓞_K is prime to 2. The plain symbol (α/β) depends only on the ideal β𝓞_K; μ_∞, and hence |α/β|, also depends on the signs of β at the real places.

API:

- `completedQuadSym` (constructor): |α/β| = μ_∞(α, β)(α/β) for α ≠ 0 and β odd, valued in {0, ±1}.
- `archQuadFactor` (data): μ_∞(α, β) = ∏_{v | ∞} (α, β)_v ∈ {±1}.
- `dyadicQuadFactor` (data): μ₂(α, β) = ∏_{v | 2} (α, β)_v ∈ {±1}.
- `completedQuadSym_of_totallyPositive` (simp): If α or β is totally positive, or K is totally complex, |α/β| = (α/β).
- `completedQuadSym_mul_left` (relation): |αα'/β| = |α/β| |α'/β|.
- `completedQuadSym_reciprocity` (relation): For coprime odd α, β: |α/β| = μ(α, β)|β/α| = μ₂(α, β)(β/α) (CA.1/quadratic-reciprocity-in-a-number-field).
- `completedQuadSym_periodic` (characterisation): |α/β| depends only on β modulo 8α (CA.1/completed-quadratic-residue-symbol-periodicity).
- `completedQuadSym_rat` (compatibility): For K = ℚ and odd b: |a/b| = (−1 if a < 0 and b < 0, else 1) · jacobiSym a |b|.

Unit tests:

- `completedQuadSym_test_neg_neg` (computation): For K = ℚ, |−1/−3| = 1.
- `completedQuadSym_test_neg_pos` (computation): For K = ℚ, |−1/3| = (−1/3) = −1.
- `completedQuadSym_test_unit` (degenerate): |α/1| = 1 for every α ≠ 0 (the empty product and positive denominator).
- `completedQuadSym_test_not_plain` (non-example): For K = ℚ, |−1/−3| ≠ (−1/−3): the archimedean factor is part of the symbol, and only the completed symbol is periodic in β.

Uses:

- FIMR, Proposition 2.2: periodicity of |α/β| in β modulo 8α, the property the spin sieve uses
- Koymans–Milovic, Lemma 2.1 and §§3–5: the spin symbol (w/σ(w)) and its reciprocity, through μ₂ and μ_∞
- CA.1/quadratic-reciprocity-in-a-number-field: the reciprocity law in the completed form |α/β| = μ₂(α, β)(β/α)

Acceptance checks:

- For K = ℚ: |−1/−3| = μ_∞(−1, −3)(−1/3) = (−1)(−1) = 1, while (−1/−3) = (−1/3) = −1.
- For K = ℚ and positive b, |a/b| is the Jacobi symbol (a/b).

Proof sketch:

1. (α/β) is the parent's power residue symbol of the ideal β𝓞_K with n = 2, valued in {0, ±1}.
2. μ_∞ and μ₂ are finite products of degree-2 norm-residue symbols at places (CA.1/norm-residue-symbol-at-a-place), each ±1.
3. If α or β is totally positive, every real factor (α, β)_v is 1 (the archimedean symbol is −1 only when both are negative), and a complex factor is always 1.

Direct prerequisites: [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/norm-residue-symbol-at-a-place](#CA-1-norm-residue-symbol-at-a-place), [CA.1/archimedean-norm-residue-symbol](#CA-1-archimedean-norm-residue-symbol).

Source: [John Friedlander, Henryk Iwaniec, Barry Mazur and Karl Rubin, *The spin of prime ideals*](https://arxiv.org/pdf/1110.6331v2), §2, the definitions of μ₂, μ_∞, μ and (2.1), arXiv v2 pp. 5–6. Defines the dyadic and archimedean products of quadratic Hilbert symbols and the completed symbol |α/β| = μ_∞(α, β)(α/β), noting that it equals (α/β) when α or β is totally positive.

Source: [Peter Koymans and Djordjo Milovic, *Joint distribution of spins*](https://arxiv.org/pdf/1809.09597v1), §2.1, p. 4. Uses the same μ₂, μ_∞ (after FIMR) and the symbol μ_∞(α, β)(α/β).

<a id="CA-1-quadratic-reciprocity-in-a-number-field"></a>

### Quadratic reciprocity in a number field with dyadic and archimedean factors

`ClassicalArithmeticCompletion:CA.1/quadratic-reciprocity-in-a-number-field` · theorem · planet: *Quadratic reciprocity in number fields*

Let K be a number field and α, β ∈ 𝓞_K nonzero, odd and coprime. Then (α/β) = μ(α, β) (β/α) with μ = μ₂ μ_∞, the products of the degree-2 norm-residue symbols over the dyadic and the infinite places; equivalently |α/β| = μ(α, β)|β/α| = μ₂(α, β)(β/α).

Hypotheses and conventions: α, β nonzero, odd (prime to 2), and coprime; the quadratic residue symbols are at the ideals β𝓞_K and α𝓞_K.

Acceptance checks:

- For K = ℚ and odd positive coprime a, b: μ_∞ = 1 and μ₂(a, b) = (a, b)_2 = (−1)^{((a−1)/2)((b−1)/2)}, which is jacobiSym.quadratic_reciprocity.
- For K = ℚ, α = −1, β = −3: (−1/−3) = −1, (−3/−1) = 1, μ₂ = (−1, −3)_2 = 1 and μ_∞ = (−1, −3)_∞ = −1, so the law holds with μ = −1.

Proof sketch:

1. Apply the power reciprocity law with n = 2 (−1 ∈ K is a primitive square root of unity): (α/β)(β/α)⁻¹ = ∏_{v | 2∞} (α, β)_v, since (α), (β) and (2) are pairwise coprime.
2. The values are ±1, so the inverse is the value itself, and the right side is μ₂(α, β)μ_∞(α, β).
3. The degree-2 symbol is symmetric ((β, α)_v = (α, β)_v⁻¹ = (α, β)_v), so μ_∞(β, α) = μ_∞(α, β); hence |α/β| = μ_∞(α, β)μ(α, β)(β/α) = μ₂(α, β)(β/α) = μ(α, β)|β/α|.

Direct prerequisites: [CA.1/power-reciprocity-law](ClassicalArithmeticCompletion.md#CA-1-power-reciprocity-law) (first pass), [CA.1/norm-residue-symbol-at-a-place](#CA-1-norm-residue-symbol-at-a-place), [CA.1/norm-residue-symbol-steinberg-and-skew-symmetry](#CA-1-norm-residue-symbol-steinberg-and-skew-symmetry), [CA.1/completed-quadratic-residue-symbol](#CA-1-completed-quadratic-residue-symbol), [CA.1/dyadic-hilbert-symbol-via-chi4-chi8](ClassicalArithmeticCompletion.md#CA-1-dyadic-hilbert-symbol-via-chi4-chi8) (first pass), `mathlib:jacobiSym.quadratic_reciprocity`.

Source: [John Friedlander, Henryk Iwaniec, Barry Mazur and Karl Rubin, *The spin of prime ideals*](https://arxiv.org/pdf/1110.6331v2), §2, Lemma 2.1, (2.2)–(2.3), arXiv v2 p. 6. States the number-field quadratic reciprocity law (α/β) = μ(α, β)(β/α) and its completed form, citing Hecke Chapter 8 and Neukirch VI.8 for the proof; the node derives it from the power reciprocity law.

Source: [Peter Koymans and Djordjo Milovic, *Joint distribution of spins*](https://arxiv.org/pdf/1809.09597v1), §2.1, Lemma 2.1, p. 4. States that for odd α, (α/β) = μ₂(α, β)μ_∞(α, β)(β/α), after FIMR (Koymans–Milovic item 3).

<a id="CA-1-dyadic-hilbert-factor-depends-on-residues-mod-eight"></a>

### The dyadic factor μ₂(α, β) depends only on α and β modulo 8

`ClassicalArithmeticCompletion:CA.1/dyadic-hilbert-factor-depends-on-residues-mod-eight` · lemma

Let K be a number field and α, β, α', β' ∈ 𝓞_K odd with α ≡ α' and β ≡ β' (mod 8𝓞_K). Then μ₂(α, β) = μ₂(α', β').

Hypotheses and conventions: α, β, α', β' odd; congruences modulo 8𝓞_K.

Acceptance checks:

- For K = ℚ: (a, b)_2 for odd a, b depends only on a, b mod 4 (it is (−1)^{((a−1)/2)((b−1)/2)}), a fortiori mod 8.
- 17 ≡ 1 (mod 8) is a square in ℚ_2, so μ₂(17α, β) = μ₂(α, β).

Proof sketch:

1. If η ∈ 𝓞_K and η ≡ 1 (mod 8), then η is a square in K_v for every dyadic place v: the binomial series √(1 + 8x) = 1 + Σ_{ℓ≥1} c_ℓ (4x)^ℓ/ℓ!, c_ℓ = ∏_{0≤k<ℓ}(1 − 2k), converges 2-adically because 4^ℓ/ℓ! has positive 2-adic valuation (alternatively Hensel's lemma).
2. Write α' = αη with η = α'/α ≡ 1 (mod 8) in 𝓞_{K_v} (α is a v-adic unit); then (α', β)_v = (α, β)_v(η, β)_v = (α, β)_v, since (η, β)_v = 1 for a square η (bimultiplicativity and (c², β) = 1). The same for β.

Direct prerequisites: [CA.1/completed-quadratic-residue-symbol](#CA-1-completed-quadratic-residue-symbol), [CA.1/norm-residue-symbol-steinberg-and-skew-symmetry](#CA-1-norm-residue-symbol-steinberg-and-skew-symmetry), [CA.1/norm-residue-symbol-at-a-place](#CA-1-norm-residue-symbol-at-a-place).

Source: [John Friedlander, Henryk Iwaniec, Barry Mazur and Karl Rubin, *The spin of prime ideals*](https://arxiv.org/pdf/1110.6331v2), §2, Lemma 2.3 and its proof, arXiv v2 p. 6. States that μ₂(α, β) depends only on α, β modulo 8 and proves it by the binomial series for √(1 + 8x).

<a id="CA-1-completed-quadratic-residue-symbol-periodicity"></a>

### Periodicity of the completed quadratic residue symbol modulo 8α

`ClassicalArithmeticCompletion:CA.1/completed-quadratic-residue-symbol-periodicity` · theorem

Let K be a number field and α ∈ 𝓞_K nonzero. For odd β, δ ∈ 𝓞_K with β ≡ δ (mod 8α), |α/β| = |α/δ|. If moreover β and δ are totally positive, (α/β) = (α/δ).

Hypotheses and conventions: α ≠ 0; β, δ odd; congruence modulo the ideal 8α𝓞_K. No coprimality is assumed: if α and β are not coprime then neither are α and δ, and both sides are 0.

Acceptance checks:

- For K = ℚ, |−1/b| = (−1)^{(b−1)/2} for every odd b, positive or negative: it depends only on b mod 4.
- Without the archimedean factor periodicity fails: for K = ℚ, −3 ≡ 5 (mod 8), but (−1/−3) = −1 ≠ 1 = (−1/5), while |−1/−3| = 1 = |−1/5|.

Proof sketch:

1. For odd α the statement follows from the reciprocity law, |α/β| = μ₂(α, β)(β/α), since (β/α) depends only on β mod α and μ₂ only on β mod 8 (FIMR Corollary 2.4).
2. For α with 1 + α odd, the auxiliary symbol [α/β] = μ₂(α, β)|α/β| = μ(α, β)(α/β) satisfies [α/β] = [α/δ] when β ≡ δ (mod 2α): choose γ with βγ ≡ 1 + α (mod 2α) and λ = (βγ − 1)/α, odd and prime to βγ; apply the reciprocity law to (α/β) = (−λ/β) and to (β/λ), (λ/γ), and collect the local factors, which reduce to (βγ, α)_v by the Steinberg relation (βγ, −αλ)_v = (βγ, 1 − βγ)_v = 1 (FIMR Lemma 2.5).
3. Apply this to 2 and to 2α (both have 1 + (·) odd): [2/β] = [2/δ] for β ≡ δ (mod 4) and [2α/β] = [2α/δ] for β ≡ δ (mod 4α); multiplying, and since 4 is a square, [α/β] = [α/δ] for β ≡ δ (mod 4α).
4. For β ≡ δ (mod 8α), μ₂(α, β) = μ₂(α, δ) by the previous lemma, so |α/β| = |α/δ|; for totally positive β, δ, |α/·| = (α/·).

Direct prerequisites: [CA.1/completed-quadratic-residue-symbol](#CA-1-completed-quadratic-residue-symbol), [CA.1/quadratic-reciprocity-in-a-number-field](#CA-1-quadratic-reciprocity-in-a-number-field), [CA.1/dyadic-hilbert-factor-depends-on-residues-mod-eight](#CA-1-dyadic-hilbert-factor-depends-on-residues-mod-eight), [CA.1/norm-residue-symbol-steinberg-and-skew-symmetry](#CA-1-norm-residue-symbol-steinberg-and-skew-symmetry).

Source: [John Friedlander, Henryk Iwaniec, Barry Mazur and Karl Rubin, *The spin of prime ideals*](https://arxiv.org/pdf/1110.6331v2), §2, Proposition 2.2, Corollary 2.4, (2.4), Lemma 2.5 and the end of the proof of Proposition 2.2, arXiv v2 pp. 6–8. States and proves the periodicity of |α/β| modulo 8α and of (α/β) for totally positive β, by the auxiliary symbol [α/β] and Lemma 2.5.

Source: [Peter Koymans and Djordjo Milovic, *Joint distribution of spins*](https://arxiv.org/pdf/1809.09597v1), §2.1, Lemma 2.1 (first assertion), p. 4. States that μ_∞(α, β)(α/β) depends only on β modulo 8α (Koymans–Milovic item 3).

<a id="CA-1-norm-compatibility-of-the-power-residue-symbol"></a>

### Norm compatibility of the power residue symbol in an extension

`ClassicalArithmeticCompletion:CA.1/norm-compatibility-of-the-power-residue-symbol` · theorem

Let L/K be a finite extension of number fields, n ≥ 1, and suppose 𝓞_K contains a primitive n-th root of unity. For x ∈ 𝓞_K and a nonzero ideal 𝔄 of 𝓞_L with N(𝔄) prime to n, (x/𝔄)_{L,n} = (x/N_{L/K}(𝔄))_{K,n}, where N_{L/K} is the relative norm of ideals (Mathlib's Ideal.relNorm) and both symbols are the parent's power residue symbols of ideals. In particular, for w ∈ 𝓞_L with N(w) prime to n, (x/w)_{L,n} = (x/N_{L/K}(w))_{K,n}.

Hypotheses and conventions: L/K any finite extension (no Galois hypothesis); μ_n ⊆ K, hence μ_n ⊆ L, with the same roots of unity used on both sides. N(𝔄) prime to n, so N_{L/K}(𝔄) is prime to n (Ideal.absNorm_relNorm).

Acceptance checks:

- K = ℚ, L = ℚ(i), n = 2, x = 3, 𝔄 = (−1 + 2i): (3/(−1 + 2i))_{L,2} = (3/5) = −1.
- If L/ℚ is Galois of even degree and p splits completely in L, then for a ∈ ℤ prime to p, (a/p𝓞_L)_{L,2} = (a/p)^{[L:ℚ]} = 1, although the Legendre symbol (a/p) may be −1 (FIMR §2, p. 5).

Proof sketch:

1. Both sides are multiplicative in 𝔄 (powerResidueSymbolIdeal_mul_right; relNorm is a monoid homomorphism), so reduce to a prime 𝔓 of 𝓞_L over 𝔭 of 𝓞_K, with residue degree f; then N_{L/K}(𝔓) = 𝔭^f (Ideal.relNorm_eq_pow_of_isMaximal) and N(𝔓) = N(𝔭)^f.
2. If x ∈ 𝔭 both sides are 0. Otherwise, modulo 𝔓, (x/𝔓)_L ≡ x^{(N𝔭^f − 1)/n} = (x^{(N𝔭 − 1)/n})^{1 + N𝔭 + ⋯ + N𝔭^{f−1}} ≡ ((x/𝔭)_K)^{f} because N𝔭 ≡ 1 (mod n) makes the exponent ≡ f (mod n).
3. ((x/𝔭)_K)^f = (x/𝔭^f)_K, and two n-th roots of unity congruent modulo 𝔓 are equal (CA.1/norm-of-a-prime-is-one-modulo-n in L).

Direct prerequisites: [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), [CA.1/norm-of-a-prime-is-one-modulo-n](ClassicalArithmeticCompletion.md#CA-1-norm-of-a-prime-is-one-modulo-n) (first pass), `mathlib:Ideal.relNorm`, `mathlib:Ideal.relNorm_eq_pow_of_isMaximal`, `mathlib:Ideal.spanNorm_singleton`, `mathlib:Ideal.inertiaDeg`, `mathlib:Ideal.absNorm_relNorm`.

Source: [Peter Koymans and Djordjo Milovic, *Joint distribution of spins*](https://arxiv.org/pdf/1809.09597v1), §5, the computation of ∏_{σ∈S} spin(σ, w), p. 22. Uses (x/w)_{K,2} = (x/N_{K/E}(w))_{E,2} for x ∈ 𝓞_E and odd w ∈ 𝓞_K in a Galois extension K/E (Koymans–Milovic item 4); the node proves it for every n with μ_n ⊆ E and any finite extension.

Source: [John Friedlander, Henryk Iwaniec, Barry Mazur and Karl Rubin, *The spin of prime ideals*](https://arxiv.org/pdf/1110.6331v2), §2, the remark after the definition of the quadratic residue symbol, arXiv v2 p. 5. Observes that (a/p) computed in K need not be the Legendre symbol, by the computation (a/p) = (a/q)(a/q^σ) = (a/q)² for split p, the special case of the node.

## Biquadratic reciprocity

The quartic residue symbol is the power residue symbol of CA.1 with n = 4 in K = ℚ(i), at ideals of odd norm; no new symbol is defined. The new definition is the normalisation of elements, primary meaning ≡ 1 modulo (1 + i)^3. The proof follows the cubic case: the Jacobi and Gauss sums of a primary prime, reciprocity with a rational denominator, reciprocity for elements with coprime coordinates, and the general law by the decomposition π = m(a + bi).

<a id="CA-1-primary-gaussian-integer"></a>

### Primary Gaussian integers

`ClassicalArithmeticCompletion:CA.1/primary-gaussian-integer` · definition

Let K = ℚ(i), given as a number field with IsCyclotomicExtension {4} ℚ K, and let i ∈ 𝓞_K be a primitive 4th root of unity, so that 𝓞_K = ℤ[i] with ℤ-basis {1, i}. An element α ∈ 𝓞_K is primary if α ≡ 1 (mod (1 + i)^3), that is, (1 + i)^3 divides α − 1 (the ideal ((1 + i)^3) = (2 + 2i) has norm 8). For α = a + bi with a, b ∈ ℤ this says: a ≡ 1 and b ≡ 0 (mod 4), or a ≡ 3 and b ≡ 2 (mod 4). If N(α) is odd (α prime to 1 + i), exactly one of α, iα, −α, −iα is primary. Primary elements are closed under products and complex conjugation; a rational integer is primary exactly when it is ≡ 1 (mod 4); a primary nonunit is a product of primary primes, which are the elements −q (q a rational prime ≡ 3 mod 4) and the primary elements of prime norm p ≡ 1 (mod 4); and for primary α = a + bi, (N(α) − 1)/4 ≡ (a − 1)/2 (mod 2). The predicate is stated for every element; the unit 1 satisfies it, so the reciprocity statements carry their nonunit hypotheses separately.

Hypotheses and conventions: K = ℚ(i) with IsCyclotomicExtension {4} ℚ K and i ∈ 𝓞_K a primitive 4th root of unity; the coordinates a, b are those of the basis {1, i} (integralPowerBasisOfPrimePow). Primary is the congruence modulo (1 + i)^3; it implies N(α) odd. Xu's Definition 5.4 adds 'nonunit' to the definition; here it is a hypothesis of the theorems, as for the parent's IsPrimaryEisenstein.

API:

- `IsPrimaryGaussian` (constructor): α is primary: (1 + i)^3 divides α − 1 in 𝓞_K.
- `isPrimaryGaussian_add_mul_iff` (characterisation): a + b i is primary if and only if (a ≡ 1 and b ≡ 0 mod 4) or (a ≡ 3 and b ≡ 2 mod 4).
- `exists_unique_unit_mul_isPrimaryGaussian` (structure): If N(α) is odd there is exactly one unit u ∈ {1, i, −1, −i} with uα primary.
- `IsPrimaryGaussian.mul` (relation): Products of primary elements are primary.
- `IsPrimaryGaussian.conj` (relation): The complex conjugate of a primary element is primary.
- `isPrimaryGaussian_intCast_iff` (compatibility): A rational integer m is primary exactly when m ≡ 1 (mod 4).
- `IsPrimaryGaussian.div_intCast` (relation): If α is primary, m ≡ 1 (mod 4) is a rational integer and m divides α, then α/m is primary.
- `IsPrimaryGaussian.norm_sub_one_div_four` (other): For primary α = a + b i: (N(α) − 1)/4 ≡ (a − 1)/2 (mod 2).
- `IsPrimaryGaussian.exists_prod_primary_primes` (structure): A primary nonunit is a finite product of primary primes.

Unit tests:

- `isPrimaryGaussian_test_neg_three` (computation): −3 is primary (a = −3 ≡ 1, b = 0 mod 4).
- `isPrimaryGaussian_test_norm_five` (computation): −1 + 2i, of norm 5, is primary; so is its conjugate −1 − 2i.
- `isPrimaryGaussian_test_one_add_two_i` (non-example): 1 + 2i is not primary although a is odd and b even: 'a odd and b even' is not the definition.
- `isPrimaryGaussian_test_three` (non-example): 3 is not primary; the primary associate of the prime 3 is −3.
- `isPrimaryGaussian_test_one_add_i` (degenerate): 1 + i has no primary associate: no element of even norm is primary.
- `isPrimaryGaussian_test_one` (degenerate): 1 satisfies the congruence: the nonunit hypothesis of the reciprocity law is carried separately.

Uses:

- Xu, Theorem 5.8; CA.1/quartic-reciprocity: biquadratic reciprocity is stated for coprime primary elements
- CA.1/quartic-supplement-for-i-and-minus-one and CA.1/quartic-supplement-for-one-plus-i: the supplements are formulas in the coordinates of a primary element
- CA.1/quartic-jacobi-sum-of-a-primary-prime: −χ(−1) J(χ, χ) is the primary generator of the prime
- Xu, proof of Theorem 5.8, p. 17: the decomposition π = m(a + bi) with m ≡ 1 mod 4 and gcd(a, b) = 1 into primary factors
- Relyea, Theorem 4.4 (parent source issues E203, E204): the corrected statement of biquadratic reciprocity needs this definition

Acceptance checks:

- −3, −1 + 2i (norm 5) and 3 + 2i (norm 13) are primary; 3, 1 + 2i and 1 + i are not.
- The two primary primes above 5 are −1 + 2i and −1 − 2i, conjugate to each other.
- (N(3 + 2i) − 1)/4 = 3 ≡ (3 − 1)/2 = 1 (mod 2).

Proof sketch:

1. Coordinates: (1 + i)^3 = −2 + 2i = i(2 + 2i), and 1 + (2 + 2i)(x + yi) = (1 + 2x − 2y) + 2(x + y)i; so α = a + bi is primary exactly when a − 1 and b are even and (a − 1)/2 ≡ b/2 (mod 2), which is the stated pair of congruences mod 4.
2. Unique primary associate: the units of ℤ[i] are ±1, ±i (Zsqrtd.isUnit_iff_norm_isUnit). The group (𝓞_K/(1 + i)^3)ˣ has order 4 and is represented by 1, i, −1, −i, which are pairwise incongruent; so for N(α) odd the class of α is the class of exactly one of them, u⁻¹, and uα is the unique primary associate.
3. Closure under products and conjugation: immediate from the congruence, since (1 + i)^3 𝓞_K is stable under conjugation (1 − i = −i(1 + i)).
4. Factorisation: each prime factor of a primary nonunit has a unique primary associate; the product of these associates is primary and differs from α by a unit u with u ≡ 1 mod (1 + i)^3, so u = 1. The primary primes: −q for q ≡ 3 mod 4 (GaussianInt.prime_iff_mod_four_eq_three_of_nat_prime) and the primary associates of the factors of p = ππ̄ ≡ 1 mod 4 (GaussianInt.sq_add_sq_of_nat_prime_of_not_irreducible).
5. Norm congruence: if a ≡ 1, b ≡ 0 (mod 4), then a² − 1 ≡ 0 (mod 8) and b² ≡ 0 (mod 16), so (N − 1)/4 ≡ (a² − 1)/4 ≡ (a − 1)/2 (mod 2); if a ≡ 3, b ≡ 2 (mod 4), then (a² − 1)/4 is even and b²/4 is odd, and (a − 1)/2 is odd.

Direct prerequisites: `mathlib:IsCyclotomicExtension`, `mathlib:IsPrimitiveRoot`, `mathlib:IsPrimitiveRoot.integralPowerBasisOfPrimePow`, `mathlib:Ideal.span`, `mathlib:Associated`, `mathlib:GaussianInt.prime_iff_mod_four_eq_three_of_nat_prime`, `mathlib:GaussianInt.sq_add_sq_of_nat_prime_of_not_irreducible`, `mathlib:Zsqrtd.isUnit_iff_norm_isUnit`.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §5, Proposition 5.1, Definitions 5.3–5.4 and Propositions 5.5–5.6, pp. 14–15. Defines primary nonunits of ℤ[i] as α ≡ 1 mod (1 + i)^3, states the coordinate criterion and the existence and uniqueness of the primary associate (deferring both proofs to Ireland–Rosen §9.7), and remarks that primary elements are products of primary irreducibles; the coordinate criterion is printed incompletely (source issue E1101).

Source: [Matias Carl Relyea, *On finite fields and higher reciprocity*](https://arxiv.org/pdf/2407.03559v3), §4.1, Definition 22 and Theorem 4.4, p. 45. Uses primary elements of ℤ[i] in the statement of biquadratic reciprocity without defining them (parent source issue E204); the definition here supplies what that statement needs.

<a id="CA-1-quartic-character-of-coprime-rational-integers"></a>

### The quartic symbol of a rational integer at a coprime rational integer is trivial

`ClassicalArithmeticCompletion:CA.1/quartic-character-of-coprime-rational-integers` · lemma

Let K = ℚ(i). For a rational integer a that is odd and not a unit, and a rational integer m coprime to a, the quartic residue symbol at the ideal a𝓞_K is trivial: (m / a)_4 = 1.

Hypotheses and conventions: a, m ∈ ℤ, a odd with |a| > 1, gcd(a, m) = 1. The symbol is the parent's power residue symbol with n = 4 at the ideal a𝓞_K, which is prime to 2.

Acceptance checks:

- (3 / (−1 + 2i))_4 = i and (3 / (−1 − 2i))_4 = −i, whose product (3/5)_4 is 1 (checked by direct computation in 𝔽_5): the factors are not trivial, only their product.
- (2/3)_4 = 1, since 2^{(9−1)/4} = 4 ≡ 1 (mod 3).

Proof sketch:

1. Reduce by multiplicativity in the ideal to a = p a prime.
2. If p ≡ 1 (mod 4), p = ππ̄ with π a Gaussian prime; by Galois equivariance under complex conjugation, (m/π̄)_4 = conj((m/π)_4) = (m/π)_4⁻¹, so (m/p)_4 = 1.
3. If p ≡ 3 (mod 4), p is prime in ℤ[i] with norm p²; (m/p)_4 ≡ m^{(p²−1)/4} = (m^{p−1})^{(p+1)/4} ≡ 1 (mod p) by Fermat, and the reduction of μ_4 modulo p is injective, so (m/p)_4 = 1.

Direct prerequisites: [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/power-residue-symbol-galois-equivariance](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-galois-equivariance) (first pass), [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), [CA.1/norm-of-a-prime-is-one-modulo-n](ClassicalArithmeticCompletion.md#CA-1-norm-of-a-prime-is-one-modulo-n) (first pass), `mathlib:GaussianInt.prime_iff_mod_four_eq_three_of_nat_prime`.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §5, Proposition 5.10 and its proof, p. 16. States and proves that χ_a(α) = 1 for coprime rational a, α with a odd and not a unit, by the split and inert cases.

<a id="CA-1-quartic-supplement-for-i-and-minus-one"></a>

### The supplementary laws for i and −1

`ClassicalArithmeticCompletion:CA.1/quartic-supplement-for-i-and-minus-one` · theorem

Let K = ℚ(i) and let λ = a + bi be primary with N(λ) odd. Then (i/λ)_4 = i^{−(a−1)/2} and (−1/λ)_4 = (−1)^{b/2} = (−1)^{(a−1)/2}, the symbols being taken at the ideal λ𝓞_K. In particular, for a rational integer n ≡ 1 (mod 4), (i/n)_4 = (−1)^{(n−1)/4} and (−1/n)_4 = 1.

Hypotheses and conventions: λ primary (possibly composite, possibly a rational integer); for λ = 1 both sides are 1. i is the primitive 4th root of unity fixed in the definition of primary; replacing i by −i changes both sides compatibly.

Acceptance checks:

- (i/(−3))_4 = i^2 = −1 = (−1)^{(−3−1)/4}; (i/(−1 + 2i))_4 = i, i^{−(−2)/2} = i.
- Checked by direct computation for every primary prime with |a|, |b| ≤ 12 and for 67 primary composites with |a|, |b| ≤ 30.

Proof sketch:

1. Prime case, split: for a primary prime π = a + bi of norm p ≡ 1 (mod 4), (i/π)_4 = i^{(p−1)/4} by the value of the power residue symbol at a root of unity (powerResidueSymbol_zeta); and (p − 1)/4 ≡ −(a − 1)/2 (mod 4) by the coordinate congruences of a primary element (a ≡ 1, b ≡ 0 or a ≡ 3, b ≡ 2 mod 4).
2. Prime case, inert: for π = −q with q ≡ 3 (mod 4), (i/q)_4 = i^{(q²−1)/4} and (q²−1)/4 ≡ (q + 1)/2 = −(a − 1)/2 (mod 4).
3. Multiplicativity: the left side is multiplicative in λ (powerResidueSymbolIdeal_mul_right); the right side α ↦ i^{−(a−1)/2} is multiplicative on primary elements, a congruence check on (a, b) modulo 8; primary nonunits are products of primary primes.
4. −1 = i², and (−1)^{(a−1)/2} = (−1)^{b/2} for primary a + bi.
5. For rational n ≡ 1 (mod 4): a = n, b = 0 gives (i/n)_4 = i^{−(n−1)/2} = (−1)^{(n−1)/4}, and (−1/n)_4 = (−1)^0 = 1.

Direct prerequisites: [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/primary-gaussian-integer](#CA-1-primary-gaussian-integer), [CA.1/norm-of-a-prime-is-one-modulo-n](ClassicalArithmeticCompletion.md#CA-1-norm-of-a-prime-is-one-modulo-n) (first pass).

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §5, Proposition 5.7 and its proof, p. 15. Proves (i/n)_4 = (−1)^{(n−1)/4} for rational n ≡ 1 mod 4 from the split and inert prime cases and multiplicativity; the node extends the same computation to all primary λ.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §5, Definition 5.2, p. 14. The quartic residue character χ_π(α) ≡ α^{(Nπ−1)/4} at a Gaussian prime, which gives the prime case.

<a id="CA-1-quartic-jacobi-sum-of-a-primary-prime"></a>

### The Jacobi sum of the quartic character of a primary prime

`ClassicalArithmeticCompletion:CA.1/quartic-jacobi-sum-of-a-primary-prime` · lemma

Let π be a primary prime of ℤ[i] of norm p ≡ 1 (mod 4), and χ = (·/π)_4 the quartic residue character of 𝓞_K/π ≅ 𝔽_p, with values in 𝓞_K. Then −χ(−1) J(χ, χ) = π; equivalently J(χ, χ) = −(−1)^{(p−1)/4} π.

Hypotheses and conventions: π prime, primary, of norm p ≡ 1 (mod 4); χ has order exactly 4 (orderOf_powerResidueSymbol). J is Mathlib's jacobiSum with χ(0) = 0.

Acceptance checks:

- For π = −1 + 2i (p = 5): χ(−1) = −1 and J(χ, χ) = −1 + 2i = π (direct computation).
- Checked by direct computation for every primary split prime with |a|, |b| ≤ 12.

Proof sketch:

1. Middle term and pairing: in J = Σ_t χ(t)χ(1 − t) the term t = 1/2 is χ(1/4) = χ(4)⁻¹ = χ(−1), because −4 = (1 + i)^4 is a 4th power; the remaining t ∉ {0, 1, 1/2} pair as t ↔ 1 − t, each pair contributing 2u with u a unit, and 2u ≡ 2 modulo (2 + 2i) = ((1 + i)^3).
2. Hence J ≡ χ(−1) + (p − 3) ≡ χ(−1) + 2 and −χ(−1)J ≡ −1 − 2 ≡ 1 modulo (1 + i)^3 (using 4 ∈ (1 + i)^3): −χ(−1)J is primary.
3. Norm: J(χ, χ) J(χ⁻¹, χ⁻¹) = p (jacobiSum_mul_jacobiSum_inv; χ, χ and χ² are nontrivial) and J(χ⁻¹, χ⁻¹) is the complex conjugate of J(χ, χ); so −χ(−1)J is a primary element of norm p, hence π or π̄.
4. Divisibility: modulo π, χ(t) ≡ t^k with k = (p − 1)/4, so J ≡ Σ_t t^k (1 − t)^k, a sum of power sums Σ_t t^j with 1 ≤ j ≤ 2k < p − 1, each zero (FiniteField.sum_pow_lt_card_sub_one); so π divides J, and since π and π̄ are not associate, −χ(−1)J = π.

Direct prerequisites: [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), [CA.1/primary-gaussian-integer](#CA-1-primary-gaussian-integer), `mathlib:jacobiSum`, `mathlib:jacobiSum_mul_jacobiSum_inv`, `mathlib:FiniteField.sum_pow_lt_card_sub_one`, [CA.1/norm-of-a-prime-is-one-modulo-n](ClassicalArithmeticCompletion.md#CA-1-norm-of-a-prime-is-one-modulo-n) (first pass).

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §5, Proposition 5.9, p. 15. States −χ_π(−1) J(χ_π, χ_π) = π for primary π (deferring the proof to Ireland–Rosen §9.9); the proof steps here follow the cubic argument of Xu Proposition 4.8 (p. 12).

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, Lemma 3.2 and its proof, pp. 62–64. The cubic analogue J(χ_π, χ_π) = π, whose method (primary congruence, norm, divisibility by π) the quartic proof follows.

<a id="CA-1-quartic-gauss-sum-fourth-power"></a>

### The fourth power of the quartic Gauss sum

`ClassicalArithmeticCompletion:CA.1/quartic-gauss-sum-fourth-power` · lemma

Let π be a primary prime of ℤ[i] of norm p ≡ 1 (mod 4) and χ = (·/π)_4, pushed along an injective ring homomorphism φ : 𝓞_K → R into an integral domain R, and ψ a primitive additive character of 𝓞_K/π ≅ 𝔽_p with values in R. Then g(χ, ψ)^4 = p · φ(J(χ, χ))^2 = φ(π)^3 φ(π̄).

Hypotheses and conventions: As in the Jacobi sum lemma; ψ primitive; R a domain (for example ℂ, or the ring of integers of ℚ(i, ζ_p), which the reciprocity proof uses for congruences modulo q).

Acceptance checks:

- |g(χ, ψ)|² = p in ℂ (gaussSum_mul_gaussSum_eq_card), consistent with |π³π̄| = p².
- For π = −1 + 2i: g^4 = 5(−1 + 2i)^2 = −15 − 20i.

Proof sketch:

1. g(χ)^2 = J(χ, χ) g(χ^2) (jacobiSum_mul_nontrivial with χ·χ = χ² ≠ 1).
2. χ² is the quadratic character of 𝔽_p and χ²(−1) = χ(−1)² = 1, so g(χ²)^2 = p (gaussSum_sq).
3. Hence g(χ)^4 = p J(χ, χ)^2, and J(χ, χ)^2 = π² by the Jacobi sum lemma; p = ππ̄. Transport along φ is termwise (MulChar.ringHomComp).

Direct prerequisites: [CA.1/quartic-jacobi-sum-of-a-primary-prime](#CA-1-quartic-jacobi-sum-of-a-primary-prime), `mathlib:gaussSum`, `mathlib:jacobiSum_mul_nontrivial`, `mathlib:gaussSum_sq`, `mathlib:gaussSum_mul_gaussSum_eq_card`, `mathlib:MulChar.ringHomComp`, `mathlib:AddChar.IsPrimitive`.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §5, Proposition 5.9, p. 15. States g(χ_π)^4 = p J(χ_π, χ_π)^2 and the consequence g(χ_π)^4 = π³π̄.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §3, Propositions 3.4 and 3.6, pp. 9–10. The Gauss–Jacobi relation g(χ)g(λ) = J(χ, λ)g(χλ) and g(χ)g(χ̄) = χ(−1)p used in the steps.

<a id="CA-1-quartic-reciprocity-with-a-rational-denominator"></a>

### Quartic reciprocity between a primary element and a rational integer

`ClassicalArithmeticCompletion:CA.1/quartic-reciprocity-with-a-rational-denominator` · lemma

Let K = ℚ(i). (a) For an odd rational prime q and a primary prime π of ℤ[i] of norm p ≡ 1 (mod 4) with p ≠ q: ((−1)^{(q−1)/2} q / π)_4 = (π / q)_4. (b) For a rational integer a ≡ 1 (mod 4) and a primary λ ∈ ℤ[i] coprime to a: (a / λ)_4 = (λ / a)_4.

Hypotheses and conventions: Symbols are the parent's power residue symbols with n = 4 at the principal ideals (π), (q), (λ), (a), all of odd norm. In (b), λ may be composite or rational; a may be negative.

Acceptance checks:

- ((−3)/(−1 + 2i))_4 = ((−1 + 2i)/3)_4 = −i, the instance of parent source issue E203 (direct computation).
- For q ≡ 1 (mod 4) the sign (−1)^{(q−1)/2} is +1: (5/(3 + 2i))_4 = ((3 + 2i)/5)_4.

Proof sketch:

1. (a), q ≡ 3 (mod 4): q is inert, 𝓞_K/q ≅ 𝔽_{q²} with Frobenius x ↦ x^q acting as complex conjugation, so π^q ≡ π̄ and (π/q)_4 ≡ π^{(q²−1)/4} = (π̄/π)^{(q+1)/4} (mod q). In R = 𝓞 of ℚ(i, ζ_p): g(χ_π)^q ≡ Σ χ(t)^q ψ(t)^q = Σ χ̄(t) ψ(qt) = χ(q) g(χ̄) (mod q) (gaussSum_frob, gaussSum_mulShift_eq), so g^{q+1} ≡ χ(q) g(χ)g(χ̄) = χ(q)χ(−1) p; and g^{q+1} = (π³π̄)^{(q+1)/4} = π^{q+1}(π̄/π)^{(q+1)/4} ≡ p (π/q)_4 (mod q). Cancel p and lift from congruence modulo q to equality of 4th roots of unity: (π/q)_4 = χ_π(−q).
2. (a), q ≡ 1 (mod 4): q = λλ̄; g^q ≡ χ(q)⁻¹ g (mod q), so g^{q−1} ≡ χ_π(q)⁻¹; also g^{q−1} = (π³π̄)^{(q−1)/4} ≡ (π³π̄ / λ)_4 (mod λ) and likewise modulo λ̄; combining with Galois equivariance (conjugation exchanges λ and λ̄ and inverts values) gives χ_π(q) = (π/λ)_4 (π/λ̄)_4 = (π/q)_4.
3. (b): write a = ∏ q_j* with q_j* = (−1)^{(q_j−1)/2} q_j (the product of these factors is ≡ 1 mod 4 and equals ±a, hence a); for each primary prime factor λ_k of λ that is split, (a/λ_k) = ∏_j (q_j*/λ_k) = ∏_j (λ_k/q_j) = (λ_k/a) by (a); for an inert factor −q both sides are 1 by the rational lemma; multiply over k.

Direct prerequisites: [CA.1/quartic-gauss-sum-fourth-power](#CA-1-quartic-gauss-sum-fourth-power), [CA.1/quartic-character-of-coprime-rational-integers](#CA-1-quartic-character-of-coprime-rational-integers), [CA.1/primary-gaussian-integer](#CA-1-primary-gaussian-integer), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/power-residue-symbol-galois-equivariance](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-galois-equivariance) (first pass), [CA.1/norm-of-a-prime-is-one-modulo-n](ClassicalArithmeticCompletion.md#CA-1-norm-of-a-prime-is-one-modulo-n) (first pass), `mathlib:gaussSum_frob`, `mathlib:gaussSum_mulShift_eq`, `mathlib:gaussSum_mul_gaussSum_eq_card`.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §5, Propositions 5.11–5.12, pp. 15–16. States (a) for an odd prime q (deferring the proof to Ireland–Rosen §9.9, which writes g^{q+1}, resp. g^{q+3}, in two ways) and proves (b) from (a) by multiplicativity; the steps here carry out the computation sketched there, as in the cubic case.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §4, proof of Theorem 4.6, Case 2, p. 13. The cubic model of the argument: raise g^3 = pπ to a power and compare with the Frobenius congruence for Gauss sums.

<a id="CA-1-quartic-reciprocity-for-coprime-coordinates"></a>

### Quartic reciprocity for primary elements with coprime coordinates

`ClassicalArithmeticCompletion:CA.1/quartic-reciprocity-for-coprime-coordinates` · lemma

Let π = a + bi and λ = c + di be coprime primary elements of ℤ[i] with gcd(a, b) = gcd(c, d) = 1. Then (λ/π)_4 = (π/λ)_4 · (−1)^{((a−1)/2)((c−1)/2)}.

Hypotheses and conventions: π, λ primary, coprime, nonunits or units; gcd(a, b) = gcd(c, d) = 1, so a, b, c, d are prime to π, λ as appropriate.

Acceptance checks:

- For π = −1 + 2i and λ = 3 + 2i: (a − 1)/2 = −1, (c − 1)/2 = 1, so (λ/π)_4 = −(π/λ)_4.
- For λ = −3 (d = 0, gcd(−3, 0) = 3 ≠ 1) the lemma does not apply directly; the general theorem handles it by the decomposition λ = m(c + di).

Proof sketch:

1. From c i ≡ d (mod λ): c π ≡ ac + bd (mod λ), so (c/λ)(π/λ) = ((ac + bd)/λ); from b i ≡ −a (mod π): a λ ≡ ac + bd (mod π), so (a/π)(λ/π) = ((ac + bd)/π).
2. Taking the complex conjugate of the second relation (Galois equivariance: conj((x/π)_4) = (x̄/π̄)_4) and combining it with the first expresses (π/λ)(λ/π)⁻¹ as a product of symbols whose numerators are the rational integers c, a and ac + bd; by the rational-denominator lemma each becomes a symbol with a rational denominator, and the congruences c + di ≡ di (mod c), a + bi ≡ bi (mod a) and π̄λ ≡ (ad − bc)i (mod ac + bd), with the rational lemma, reduce these to symbols of i.
3. Collecting, (λ/π)(π/λ)⁻¹ = (i / (ac + bd)ac)_4 = (−1)^{((ac+bd)ac − 1)/4} by the supplement for i, and ((ac + bd)ac − 1)/4 ≡ ((a − 1)/2)((c − 1)/2) (mod 2) for primary a + bi, c + di (casework mod 8; checked by machine for all primary pairs with |a|, …, |d| ≤ 21).
4. When a, c or ac + bd is ±1 the corresponding factor is 1 and the same computation applies.

Direct prerequisites: [CA.1/quartic-reciprocity-with-a-rational-denominator](#CA-1-quartic-reciprocity-with-a-rational-denominator), [CA.1/quartic-character-of-coprime-rational-integers](#CA-1-quartic-character-of-coprime-rational-integers), [CA.1/quartic-supplement-for-i-and-minus-one](#CA-1-quartic-supplement-for-i-and-minus-one), [CA.1/primary-gaussian-integer](#CA-1-primary-gaussian-integer), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/power-residue-symbol-galois-equivariance](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-galois-equivariance) (first pass).

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §5, Proposition 5.13 and its proof, pp. 16–17. States and proves this case from the two congruences, the rational lemmas and the supplement for i, with the final congruence left to casework.

<a id="CA-1-quartic-reciprocity"></a>

### The law of biquadratic (quartic) reciprocity

`ClassicalArithmeticCompletion:CA.1/quartic-reciprocity` · theorem · planet: *Quartic reciprocity*

Let K = ℚ(i) and let λ, π ∈ ℤ[i] be coprime primary elements (in particular of odd norm). Then (λ/π)_4 = (π/λ)_4 · (−1)^{((N(λ)−1)/4)((N(π)−1)/4)}, the symbols being the quartic power residue symbols at the principal ideals (π) and (λ).

Hypotheses and conventions: λ, π primary and coprime; for a unit (λ = 1) both sides are 1. The quotient (λ/π)(π/λ)⁻¹, not the product, is the sign: the product is not a sign in general (parent source issue E203).

Acceptance checks:

- π = −1 + 2i (norm 5) and λ = −3 (norm 9): (λ/π)_4 = (π/λ)_4 = −i, and the sign is (−1)^{1·2} = 1 (parent source issue E203).
- Checked by direct computation for 266 coprime pairs of primary composites with |a|, |b| ≤ 30.
- The sign is −1 exactly when N(λ) ≡ N(π) ≡ 5 (mod 8).

Proof sketch:

1. Write π = m(a + bi), λ = n(c + di) with m, n rational, m ≡ n ≡ 1 (mod 4), gcd(a, b) = gcd(c, d) = 1; then a + bi and c + di are primary (IsPrimaryGaussian.div_intCast).
2. By the rational-denominator lemma, (λ/m) = (m/λ) and (π/n) = (n/π); by the rational lemma (m/n) = (n/m) = 1.
3. Expand (λ/π) = (λ/m)(λ/(a + bi)) = (m/λ)(n/(a + bi))((c + di)/(a + bi)) and apply the coprime-coordinates lemma: (λ/π) = (π/λ)(−1)^{((a−1)/2)((c−1)/2)}.
4. Finally ((a − 1)/2)((c − 1)/2) ≡ ((N(π) − 1)/4)((N(λ) − 1)/4) (mod 2), from the norm congruence (N − 1)/4 ≡ (a − 1)/2 for primary elements and m² ≡ n² ≡ 1 (mod 8).

Direct prerequisites: [CA.1/quartic-reciprocity-for-coprime-coordinates](#CA-1-quartic-reciprocity-for-coprime-coordinates), [CA.1/quartic-reciprocity-with-a-rational-denominator](#CA-1-quartic-reciprocity-with-a-rational-denominator), [CA.1/quartic-character-of-coprime-rational-integers](#CA-1-quartic-character-of-coprime-rational-integers), [CA.1/primary-gaussian-integer](#CA-1-primary-gaussian-integer), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass).

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §5, Theorem 5.8 and its proof, pp. 15–17. States biquadratic reciprocity for relatively prime primary elements and proves it from Propositions 5.10–5.13 by the decomposition π = m(a + bi).

Source: [Matias Carl Relyea, *On finite fields and higher reciprocity*](https://arxiv.org/pdf/2407.03559v3), §4.1, Theorem 4.4, p. 45. States the law with the product of the two characters in place of their quotient (parent source issue E203) and without defining primary (E204); the node is the corrected statement.

<a id="CA-1-quartic-supplement-for-one-plus-i"></a>

### The supplementary law for 1 + i

`ClassicalArithmeticCompletion:CA.1/quartic-supplement-for-one-plus-i` · theorem

Let λ = a + bi ∈ ℤ[i] be primary. Then ((1 + i)/λ)_4 = i^{(a − b − b² − 1)/4}, the symbol being taken at the ideal λ𝓞_K. In particular, for a rational integer n ≡ 1 (mod 4), ((1 + i)/n)_4 = i^{(n−1)/4}.

Hypotheses and conventions: λ primary (composite allowed); a − b − b² − 1 is divisible by 4 for primary a + bi.

Acceptance checks:

- ((1 + i)/(−3))_4 = i^{(−3−0−0−1)/4} = i^{−1} = −i; ((1 + i)/(−1 + 2i))_4 = i^{(−1−2−4−1)/4} = i^{−2} = −1.
- Checked by direct computation for every primary prime with |a|, |b| ≤ 12 and for 67 primary composites with |a|, |b| ≤ 30.

Proof sketch:

1. Split prime π = a + bi, b ≠ 0: b i ≡ −a (mod π) gives b(1 + i) ≡ b − a (mod π), so ((1 + i)/π) = ((b − a)/π)(b/π)⁻¹. Write b = 2^k b' with b' odd and use (2/π) = (−i/π)((1 + i)/π)²; this gives ((1 + i)/π)^{1+2k} as a product of symbols of rational integers and of −i.
2. The rational symbols: for odd rational m with ±m ≡ 1 (mod 4), (m/π) = (±1/π)·(π/±m) (rational-denominator lemma); (π/b') = (a/b') = 1 since a + bi ≡ a (mod b'), and (π/(b − a)) = ((b(1 + i))/(b − a)) = ((1 + i)/(b − a)) since a ≡ b (mod b − a) and the rational lemma; ((1 + i)/q)_4 = (2i)^{(q² − 1)/8} modulo an inert q and ((1 + i)/p)_4 = i^{(p−1)/4} for split p = ρρ̄ (conjugation and 1 − i = −i(1 + i)).
3. Since 1 + 2k is odd, it is invertible modulo 4, which determines ((1 + i)/π); a congruence computation on a, b modulo 16 yields i^{(a − b − b² − 1)/4}. The inert primes π = −q are computed directly.
4. Both sides are multiplicative on primary elements (for the right side, a congruence check of α ↦ (a − b − b² − 1)/4 mod 4 on primary residues modulo 32, done by machine), and primary nonunits are products of primary primes.

Direct prerequisites: [CA.1/quartic-reciprocity-with-a-rational-denominator](#CA-1-quartic-reciprocity-with-a-rational-denominator), [CA.1/quartic-character-of-coprime-rational-integers](#CA-1-quartic-character-of-coprime-rational-integers), [CA.1/quartic-supplement-for-i-and-minus-one](#CA-1-quartic-supplement-for-i-and-minus-one), [CA.1/primary-gaussian-integer](#CA-1-primary-gaussian-integer), [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/power-residue-symbol-galois-equivariance](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-galois-equivariance) (first pass).

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §5, Definitions 5.2–5.4 and Propositions 5.10–5.12, pp. 14–16. The quartic symbol at composite primary elements and the rational-denominator reciprocity used in the reduction; Xu does not state the supplement for 1 + i, whose public proof is a recorded gap.

## The inputs of Eisenstein reciprocity

CA.1's Eisenstein reciprocity law rests on the element Φ(P) = g(P)^m, Stickelberger's factorisation of it, the unit factor of a primary element and the residue identity at a second prime. They are owned here, at the contracts of Adhikari's Propositions 4.2–4.6 and the relation before (25), and FiniteFieldsAndCharacterSums imports them.

<a id="CA-1-stickelberger-gauss-sum-power"></a>

### The Gauss sum power Φ(P) = g(P)^m of a prime of ℤ[ζ_m]

`ClassicalArithmeticCompletion:CA.1/stickelberger-gauss-sum-power` · construction

Let m ≥ 2, K = ℚ(ζ_m) with ζ_m a primitive m-th root of unity, and P a prime of 𝓞_K = ℤ[ζ_m] not dividing m, lying over the rational prime p, with N(P) = q = p^f. On F = 𝓞_K/P let χ_P(t) = (t/P)_m⁻¹ (the inverse of the m-th power residue character, χ_P(0) = 0) and ψ(t) = ζ_p^{Tr_{F/𝔽_p}(t)}, and let g(P) = g(χ_P, ψ) ∈ ℚ(ζ_m, ζ_p). Then Φ(P) := g(P)^m lies in 𝓞_K. Extend Φ multiplicatively to nonzero ideals A prime to m: Φ(A) = ∏ Φ(P_i) for A = P_1 ⋯ P_r, with Φ(𝓞_K) = 1, and write Φ(α) = Φ(α𝓞_K) for α prime to m.

Hypotheses and conventions: m ≥ 2; P ∤ m, equivalently p ∤ m; ζ_p ∈ ℚ(ζ_m, ζ_p) = ℚ(ζ_{mp}) a primitive p-th root of unity (for p = 2, ζ_2 = −1). The character is the inverse of the residue symbol: with (·/P)_m itself the ideal of Φ(P) would be P^{Σ t σ_t} instead of P^{Σ t σ_t⁻¹}.

API:

- `stickelbergerPhi` (constructor): Φ(A) ∈ 𝓞_K for a nonzero ideal A of ℤ[ζ_m] prime to m: the product of g(P)^m over the prime factors of A.
- `stickelbergerPhi_prime` (characterisation): For a prime P ∤ m, Φ(P) = g(χ_P, ψ)^m with χ_P = (·/P)_m⁻¹ and ψ the trace character, read in ℚ(ζ_{mp}).
- `stickelbergerPhi_mul` (relation): Φ(AB) = Φ(A) Φ(B) for ideals prime to m.
- `stickelbergerPhi_top` (simp): Φ(𝓞_K) = 1.
- `stickelbergerPhi_norm_sq` (other): In every complex embedding σ of K, |σ(Φ(A))|² = N(A)^m.
- `stickelbergerPhi_galois` (functoriality): σ(Φ(A)) = Φ(σA) for σ ∈ Gal(K/ℚ).
- `stickelbergerPhi_modEq` (other): For m = l an odd prime, Φ(P) ≡ −1 (mod l𝓞_K), so Φ(A) ≡ ±1 (mod l𝓞_K).
- `span_stickelbergerPhi` (characterisation): The ideal generated by Φ(A) is A^γ, γ = Σ_{1≤t<m, (t,m)=1} t σ_t⁻¹ (CA.1/stickelberger-relation).

Unit tests:

- `stickelbergerPhi_test_top` (degenerate): Φ(𝓞_K) = 1.
- `stickelbergerPhi_test_quadratic` (computation): For m = 2, K = ℚ and P = (5): Φ(P) = 5; for P = (3): Φ(P) = −3.
- `stickelbergerPhi_test_cubic` (computation): For m = 3 and P = (π), π = −1 − 3ω of norm 7: Φ(P) = 7π̄.
- `stickelbergerPhi_test_inverse_character` (non-example): In the cubic test, Φ(P) ≠ 7π: using (·/P)_m instead of its inverse would give 7π, whose ideal is P²P̄ rather than PP̄².

Uses:

- CA.1/eisenstein-reciprocity, steps 1–3: Φ(α) and its ideal factorisation are the bridge between (α/a)_l and (a/α)_l
- CA.1/stickelberger-relation: the ideal of Φ(P) is P^γ
- CA.1/gauss-sum-power-residue-identity: Φ(P) evaluated by the residue symbol at a second prime
- Katre §4 and Clausen lecture 16: Stickelberger's theorem on annihilation of class groups uses g(χ)^m and its powers by Stickelberger elements
- FiniteFieldsAndCharacterSums:FF.1: imports Φ and Stickelberger's relation once this lower-tier package exists

Acceptance checks:

- For m = 2, K = ℚ and P = (p) with p odd: χ_P is the Legendre character and Φ((p)) = g² = (−1/p) p = (−1)^{(p−1)/2} p.
- For m = 3 and P = (π) with π = −1 − 3ω primary of norm 7: Φ(P) = 7π̄ = π π̄², whose ideal is P^{1·σ_1⁻¹ + 2·σ_2⁻¹}.

Proof sketch:

1. g(P) is an algebraic integer of ℚ(ζ_{mp}), with g(P) times its complex conjugate equal to q (gaussSum_mul_gaussSum_eq_card) in every complex embedding.
2. For c ≡ 1 (mod m) prime to p, the automorphism ζ_{mp} ↦ ζ_{mp}^c fixes ℚ(ζ_m) and multiplies g(P) by χ_P(c)⁻¹, an m-th root of unity (gaussSum_mulShift_eq); hence it fixes g(P)^m, and these automorphisms are Gal(ℚ(ζ_{mp})/ℚ(ζ_m)), so Φ(P) ∈ 𝓞_K.
3. Multiplicativity in A by definition, through the factorisation of A in the Dedekind domain 𝓞_K.

Direct prerequisites: [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), `mathlib:gaussSum`, `mathlib:gaussSum_mul_gaussSum_eq_card`, `mathlib:gaussSum_mulShift_eq`, `mathlib:Algebra.trace`, `mathlib:Ideal.absNorm`, `mathlib:IsCyclotomicExtension`.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §4, the definitions of χ_P, ψ, g(P), Φ(P) and Proposition 4.2, pp. 70–71; the extension Φ(A) before Proposition 4.4, p. 72. Defines g(P) with χ_P = (·/P)_m⁻¹ and the trace character, proves Φ(P) ∈ ℚ(ζ_m) by the invariance argument of the second step, and extends Φ multiplicatively to ideals prime to m.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §6, the paragraph before Theorem 6.10 and Definition 6.11, pp. 20–21. The same construction, with the example m = 3: Φ(P) = π^{1 + 2σ}.

Source: [S. A. Katre, *Gauss–Jacobi Sums and Stickelberger's Theorem*](https://www.bprim.org/sites/default/files/jacn.pdf), §1, Definition 1 and Proposition 1 (b), (g), (h), pp. 75–77. Gauss sums of characters of order dividing m lie in ℚ(ζ_{mp}), have absolute value √q, and their m-th powers lie in ℚ(ζ_m); Katre's Gauss sums carry the opposite sign, which does not change the ideal of g^m.

<a id="CA-1-stickelberger-relation"></a>

### Stickelberger's relation: the prime factorisation of Φ(P)

`ClassicalArithmeticCompletion:CA.1/stickelberger-relation` · theorem · planet: *Stickelberger relation*

Let m ≥ 2, K = ℚ(ζ_m), and P a prime of ℤ[ζ_m] not dividing m. Then the principal ideal generated by Φ(P) = g(P)^m is P^γ, where γ = Σ_{1 ≤ t < m, gcd(t, m) = 1} t σ_t⁻¹ ∈ ℤ[Gal(K/ℚ)], σ_t(ζ_m) = ζ_m^t, and P^{Σ a_σ σ} := ∏ σ(P)^{a_σ}. Consequently (Φ(A)) = A^γ for every ideal A prime to m, and (Φ(α)) = (α^γ) for α prime to m.

Hypotheses and conventions: m ≥ 2; P ∤ m. The rational prime p below P may be 2 (when m is odd).

Acceptance checks:

- For m = 3 and P = (π) of norm 7: (Φ(P)) = (7π̄) = P P̄² = P^{σ_1⁻¹ + 2σ_2⁻¹}.
- For m = 2 and an odd prime p: (Φ((p))) = (p) = (p)^{1·σ_1⁻¹}, the case of the quadratic Gauss sum.
- γ has nonintegral counterpart θ = γ/m, the Stickelberger element; the relation says P^{mθ} is principal, generated by g(P)^m.

Proof sketch:

1. Teichmüller character: put q = N(P) = p^f and choose a prime 𝔓 of ℚ(ζ_{q−1}) above P; reduction modulo 𝔓 gives ω : 𝔽_qˣ → μ_{q−1}, and χ_P = ω^{−(q−1)/m} (Katre, after Proposition 2).
2. Valuation of Gauss sums: for the prime 𝔓̃ of ℚ(ζ_{q−1}, ζ_p) above 𝔓, v_𝔓̃(g(ω^{−α})) = s(α), the sum of the base-p digits of α ∈ [0, q − 1): from s(0) = 0, s(α + β) ≤ s(α) + s(β) and s(α + β) ≡ s(α) + s(β) (mod p − 1) (Jacobi sums are integral in ℚ(ζ_{q−1}) and 𝔓 = 𝔓̃^{p−1}), s(pα) = s(α), s(α) + s(q − 1 − α) = f(p − 1), and s(1) = 1 (g(ω⁻¹) ≡ ±(ζ_p − 1) modulo 𝔓̃², the sign depending on the sign convention for Gauss sums), by Katre's counting argument.
3. Galois conjugates of 𝔓̃ give the full factorisation of (g(χ_P)) in ℚ(ζ_m, ζ_p), and the digit-sum identity s(h) = (p − 1) Σ_{i<f} {p^i h/(q − 1)} turns m times it into the exponent Σ_{(t,m)=1, t<m} t σ_t⁻¹ on P = 𝔓̃^{p−1} ∩ 𝓞_K; unique factorisation descends the equality of ideals to 𝓞_K.
4. The prime p = 2 (possible when m is odd): Katre and Clausen take p odd. For p = 2, ζ_2 = −1, ℚ(ζ_m, ζ_2) = ℚ(ζ_m) and 𝔓̃ = 𝔓; with Tr(a) lifted to {0, 1}, (−1)^{Tr(a)} = 1 − 2 Tr(a), so g(ω⁻¹) = ±2 Σ ω⁻¹(a) Tr(a) and the sum is ≡ q − 1 ≢ 0 modulo 𝔓; since 2 is unramified in ℚ(ζ_{q−1}), s(1) = 1, and the rest of the argument is unchanged with p − 1 = 1 (source issue E1102).
5. Multiplicativity gives (Φ(A)) = A^γ; for A = α𝓞_K, A^γ = (α^γ) because σ(α𝓞_K) = σ(α)𝓞_K.

Direct prerequisites: [CA.1/stickelberger-gauss-sum-power](#CA-1-stickelberger-gauss-sum-power), [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), `mathlib:Ideal.relNorm_eq_pow_of_isMaximal`, `mathlib:Ideal.absNorm`, `mathlib:gaussSum_ne_zero_of_nontrivial`, `mathlib:IsCyclotomicExtension`.

Source: [S. A. Katre, *Gauss–Jacobi Sums and Stickelberger's Theorem*](https://www.bprim.org/sites/default/files/jacn.pdf), §3, Lemmas 2–3, Propositions 2, 3 and 3′, pp. 79–82; §4, Lemma 4 and Proposition 4 (i), pp. 82–84. Proves the digit-sum valuation of Gauss sums, their prime factorisation in ℚ(ζ_m, ζ_p), and (g(χ)^m) = ℘^{Σ a σ_a⁻¹} for χ the reciprocal of the m-th power residue character, for p odd (source issue E1102 records the case p = 2).

Source: [Dustin Clausen, *Cyclotomic fields, lectures 15 and 16: the maximal ideal factorization of Gauss sums; Stickelberger's theorem and Herbrand's theorem*](https://www.ihes.fr/~dustin/files/CyclotimicFields/Cyclo16.pdf), Lecture 15, Theorems 0.1, 0.5–0.7, pp. 1–5; lecture 16, Theorem 0.1 with x = ℓ, p. 1. The same valuation computation and the factorisation (G(χ)^ℓ) = P^{Σ a σ_a⁻¹} for m = ℓ an odd prime and p > 2.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §4, Proposition 4.3 and Proposition 4.4 (iii), pp. 71–72. States Stickelberger's relation (Φ(P)) = P^{Σ t σ_t⁻¹} (citing Ireland–Rosen and Katre for the proof) and its consequence (Φ(A)) = A^γ.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §6, Theorem 6.10, pp. 20–21. The same statement, with the cubic example.

<a id="CA-1-stickelberger-unit-factor-is-a-root-of-unity"></a>

### The unit Φ(α)/α^γ is a root of unity ±ζ_m^i

`ClassicalArithmeticCompletion:CA.1/stickelberger-unit-factor-is-a-root-of-unity` · lemma

Let m ≥ 2, K = ℚ(ζ_m) and α ∈ 𝓞_K prime to m. Then Φ(α) = ε(α) α^γ for a unit ε(α) of 𝓞_K, and ε(α) = ±ζ_m^i for some i.

Hypotheses and conventions: α nonzero and prime to m; α^γ := ∏_t σ_t⁻¹(α)^t.

Acceptance checks:

- For m = 3 and α = π primary of norm 7: Φ(π) = 7π̄ and π^γ = π · σ_2⁻¹(π)² = π π̄², so ε(π) = 7π̄/(ππ̄²) = 1.

Proof sketch:

1. By Stickelberger's relation (Φ(α)) = (α^γ), so ε(α) = Φ(α)/α^γ is a unit.
2. In every complex embedding, |Φ(α)|² = |N(α)|^m (stickelbergerPhi_norm_sq), and |α^γ|² = α^{γ(1 + σ_{−1})} = α^{m Σ_t σ_t⁻¹} = |N(α)|^m, since (1 + σ_{−1})γ = m Σ_t σ_t⁻¹; so |ε(α)| = 1.
3. Galois equivariance (σ(Φ(α)) = Φ(σα)) shows the same for every conjugate of ε(α); by Kronecker's theorem ε(α) is a root of unity, and the roots of unity of ℚ(ζ_m) are the ±ζ_m^i (torsionOrder_eq).

Direct prerequisites: [CA.1/stickelberger-relation](#CA-1-stickelberger-relation), [CA.1/stickelberger-gauss-sum-power](#CA-1-stickelberger-gauss-sum-power), `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one`, `mathlib:IsCyclotomicExtension.Rat.torsionOrder_eq`.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §4, Proposition 4.4 (iv) and Proposition 4.5 with the argument before it, p. 72. Φ(α) = ε(α)α^γ with ε(α) a unit, and ε(α) = ±ζ_m^i from |ε(α)^σ| = 1 for all σ.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §6, Lemmas 6.14–6.16 and Proposition 6.17 with its proof, pp. 22–23. The same, with the computation |α^γ|² = |Nα|^m written out.

<a id="CA-1-stickelberger-unit-factor-of-a-primary-element"></a>

### For primary α in ℤ[ζ_l], Φ(α) = ±α^γ

`ClassicalArithmeticCompletion:CA.1/stickelberger-unit-factor-of-a-primary-element` · lemma

Let l be an odd prime, K = ℚ(ζ_l), and α ∈ ℤ[ζ_l] primary (prime to l and congruent to a rational integer modulo (1 − ζ_l)²). Then ε(α) = ±1, that is Φ(α) = ±α^γ. Moreover Φ(P) ≡ −1 (mod l) for every prime P ∤ l, so Φ(A) ≡ ±1 (mod l) for every ideal A prime to l.

Hypotheses and conventions: l an odd prime; α primary in the sense of CA.1/primary-element-of-a-cyclotomic-ring.

Acceptance checks:

- For l = 3, (1 − ω)² = −3ω, so an element ≡ 2 (mod 3) such as π = −1 − 3ω (norm 7) is primary in this sense, and ε(π) = 1 by the computation Φ(π) = 7π̄ = π^γ.
- The primary hypothesis is needed: for α = ζ_l π, Φ(α) = Φ(π) but α^γ = ζ_l^{Σ t·t⁻¹}π^γ = ζ_l^{l−1}π^γ ≠ ±π^γ.

Proof sketch:

1. Φ(P) ≡ −1 (mod l): modulo l in ℤ[ζ_l, ζ_p], g(P)^l ≡ Σ_t χ_P(t)^l ψ(t)^l = Σ_{t ≠ 0} ψ(lt) = −1, since χ_P^l is trivial on 𝔽_qˣ and l is invertible in 𝔽_q; as Φ(P) ∈ 𝓞_K and l ℤ[ζ_l, ζ_p] ∩ 𝓞_K = l𝓞_K, Φ(P) ≡ −1 (mod l𝓞_K). Hence Φ(α) ≡ ±1 (mod l).
2. With λ = 1 − ζ_l and α ≡ x (mod λ²), x ∈ ℤ, every σ(α) ≡ x (mod λ²) because λ²𝓞_K is Galois stable; so α^γ ≡ x^{1 + 2 + ⋯ + (l−1)} = (x^{(l−1)/2})^l ≡ ±1 (mod λ²), using x^{(l−1)/2} ≡ ±1 (mod l) and l ∈ λ².
3. So ε(α) ≡ ±1 (mod λ²); by the previous lemma ε(α) = ±ζ_l^i, so ζ_l^i ≡ ±1 (mod λ²); the sign is + because ζ_l^i ≡ 1 (mod λ) and 2 ∉ λ, and then ζ_l^i ≡ 1 − iλ (mod λ²) forces l | i (the uniqueness of the normalising power, CA.1/normalising-root-of-unity-of-a-cyclotomic-integer). Hence ε(α) = ±1.

Direct prerequisites: [CA.1/stickelberger-unit-factor-is-a-root-of-unity](#CA-1-stickelberger-unit-factor-is-a-root-of-unity), [CA.1/stickelberger-gauss-sum-power](#CA-1-stickelberger-gauss-sum-power), [CA.1/primary-element-of-a-cyclotomic-ring](ClassicalArithmeticCompletion.md#CA-1-primary-element-of-a-cyclotomic-ring) (first pass), `mathlib:IsPrimitiveRoot.zeta_sub_one_prime'`.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §4, Proposition 4.6 and (24), pp. 72–73. States ε(α) = ±1 for primary α (citing Ireland–Rosen) and deduces (ε(α)/B)_l = 1 because −1 is an l-th power.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §6, Lemma 6.18 and Proposition 6.19 with their proofs, pp. 23–24. Proves Φ(P) ≡ −1 (mod l) and ε(α) = ±1 for primary α by the congruence modulo (1 − ζ_l)² and the uniqueness of the normalising root of unity.

<a id="CA-1-gauss-sum-power-residue-identity"></a>

### The residue symbol of Φ(P) at a second prime

`ClassicalArithmeticCompletion:CA.1/gauss-sum-power-residue-identity` · lemma

Let m ≥ 2, K = ℚ(ζ_m), and P, P' primes of ℤ[ζ_m] not dividing m with N(P) and N(P') coprime. Then (Φ(P)/P')_m = (N(P')/P)_m.

Hypotheses and conventions: P, P' ∤ m; gcd(N(P), N(P')) = 1, so P' does not divide Φ(P) (|Φ(P)|² = N(P)^m).

Acceptance checks:

- For m = 3, P = (π) with N(π) = 7 and P' = (2): (Φ(P)/2)_3 = (7π̄/2)_3 = (π̄/2)_3 and (N(2)/π)_3 = (4/π)_3 = (2/π)_3²; both equal ω: modulo 2, π̄ = 2 + 3ω ≡ ω and 7 ≡ 1, and the residue symbol at the inert prime 2 is x ↦ x^{(4−1)/3} = x; modulo π, ω ≡ 2 in 𝔽_7 and 4^{(7−1)/3} = 16 ≡ 2.

Proof sketch:

1. Let q' = N(P') = p'^{f'}, so q' ≡ 1 (mod m). Modulo p' in ℤ[ζ_m, ζ_p], the q'-th power map is additive, so g(P)^{q'} ≡ Σ_t χ_P(t)^{q'} ψ(t)^{q'} = Σ_t χ_P(t) ψ(q't) = χ_P(q')⁻¹ g(P) = (q'/P)_m g(P).
2. g(P) is invertible modulo p' (g(P) times its complex conjugate is N(P), which is prime to p'), so g(P)^{q'−1} ≡ (q'/P)_m (mod p').
3. On the other hand g(P)^{q'−1} = Φ(P)^{(q'−1)/m} ≡ (Φ(P)/P')_m modulo every prime above P' (defining congruence of the residue symbol).
4. Two m-th roots of unity congruent modulo a prime above p' ∤ m are equal (CA.1/norm-of-a-prime-is-one-modulo-n).

Direct prerequisites: [CA.1/stickelberger-gauss-sum-power](#CA-1-stickelberger-gauss-sum-power), [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/norm-of-a-prime-is-one-modulo-n](ClassicalArithmeticCompletion.md#CA-1-norm-of-a-prime-is-one-modulo-n) (first pass), `mathlib:gaussSum_frob`, `mathlib:gaussSum_mulShift_eq`, `mathlib:gaussSum_mul_gaussSum_eq_card`.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §6, Proposition 6.12 and its proof, p. 21. States and proves the identity by computing g(P)^{q'−1} in two ways; the printed proof writes g(P')^{q'−1} where g(P)^{q'−1} is meant (source issue E1103).

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §4, the relation (Φ(P)/P')_l = (N(P')/P)_l before (25), p. 73. States the identity for m = l (citing Ireland–Rosen).

<a id="CA-1-eisenstein-reciprocity-at-ideal-norms"></a>

### Eisenstein reciprocity at the norm of an ideal

`ClassicalArithmeticCompletion:CA.1/eisenstein-reciprocity-at-ideal-norms` · lemma

Let l be an odd prime, K = ℚ(ζ_l), α ∈ ℤ[ζ_l] a primary nonunit, and 𝔅 an ideal of ℤ[ζ_l] prime to l with N(𝔅) prime to α. Then (α/N(𝔅))_l = (N(𝔅)/α)_l, the symbols at the principal ideals N(𝔅)𝓞_K and α𝓞_K.

Hypotheses and conventions: l odd prime; α primary and not a unit; 𝔅 prime to l; N(𝔅) and α coprime.

Acceptance checks:

- For l = 3, α = π = −1 − 3ω (norm 7) and 𝔅 = (2) (N = 4): (π/4)_3 = (4/π)_3, i.e. (π/2)_3² = (2/π)_3², an instance of cubic reciprocity.

Proof sketch:

1. Reduce by multiplicativity to 𝔅 = P prime.
2. (Φ(α)/P) = ∏_i (Φ(P_i)/P) over the prime factors P_i of α, and by the residue identity each factor is (N(P)/P_i); so (Φ(α)/P) = (N(P)/α).
3. (α^γ/P) = ∏_t (σ_t⁻¹(α)/P)^t = ∏_t σ_t((σ_t⁻¹α/P)) = ∏_t (α/σ_t P) = (α/∏_t σ_t(P)) = (α/N(P)), by Galois equivariance (σ_t acts on μ_l by the t-th power) and ∏_σ σ(P) = N(P)𝓞_K.
4. Φ(α) = ±α^γ (previous lemma), and (−1/P)_l = 1 because −1 = (−1)^l is an l-th power; combining, (α/N(P)) = (N(P)/α).

Direct prerequisites: [CA.1/stickelberger-unit-factor-of-a-primary-element](#CA-1-stickelberger-unit-factor-of-a-primary-element), [CA.1/gauss-sum-power-residue-identity](#CA-1-gauss-sum-power-residue-identity), [CA.1/stickelberger-gauss-sum-power](#CA-1-stickelberger-gauss-sum-power), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/power-residue-symbol-galois-equivariance](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-galois-equivariance) (first pass).

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §4, the derivation of (25), p. 73. Deduces (α/N(B))_l = (N(B)/α)_l from Proposition 4.4 (iv), Proposition 4.1, the residue identity and (24).

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §6, Corollary 6.13 and the end of the proof of Theorem 6.9, pp. 21–24. The same derivation, with the computation (α^γ/P) = (α/N(P)) written out.

## Binary quadratic forms over a finite field

The Legendre-symbol count of zeros on the projective line, in the form that Calegari–Geraghty's Lemma 8.21 uses.

<a id="CA-1-projective-zeros-of-a-binary-quadratic-form"></a>

### The number of zeros of a binary quadratic form on ℙ¹(𝔽_p)

`ClassicalArithmeticCompletion:CA.1/projective-zeros-of-a-binary-quadratic-form` · theorem

Let p be an odd prime and Q(x, y) = m x² + r x y + n y² with m, r, n ∈ 𝔽_p not all zero. The number of points [x : y] ∈ ℙ¹(𝔽_p) with Q(x, y) = 0 is 1 + (d/p), where d = r² − 4mn is the discriminant and (·/p) is the Legendre symbol with (0/p) = 0: there are 0, 1 or 2 zeros according as d is a nonsquare, zero, or a nonzero square.

Hypotheses and conventions: p odd; Q is not the zero form (for the zero form every one of the p + 1 points is a zero). d = r² − 4mn is the discriminant of the form, which equals −4 det of the symmetric matrix (m, r/2; r/2, n); the determinant itself gives a different Legendre symbol when p ≡ 3 (mod 4).

Acceptance checks:

- Over 𝔽_3, x² + y² has no zeros (d = −4 ≡ 2 is a nonsquare); over 𝔽_5 it has two, [2 : 1] and [3 : 1] (d ≡ 1).
- xy has the two zeros [1 : 0], [0 : 1] (d = 1); y² has the single zero [1 : 0] (d = 0).
- Over 𝔽_3, x² + xy + y² (d = −3 ≡ 0) has the single zero [1 : 1].

Proof sketch:

1. Q(λx, λy) = λ²Q(x, y), so vanishing at [x : y] is well defined on ℙ¹(𝔽_p) = ℙ(𝔽_p²).
2. m ≠ 0: [1 : 0] is not a zero (Q(1, 0) = m); every other point is [x : 1], a zero exactly when m x² + r x + n = 0, i.e. when (2mx + r)² = d (quadratic_eq_zero_iff_discrim_eq_sq, 2 ≠ 0); x ↦ 2mx + r is a bijection of 𝔽_p, so the count is #{s : s² = d} = 1 + (d/p) (quadraticChar_card_sqrts, legendreSym.card_sqrts).
3. m = 0, r ≠ 0: [1 : 0] is a zero and [x : 1] is a zero exactly for x = −n/r; two zeros, and d = r² is a nonzero square.
4. m = 0, r = 0: then n ≠ 0, Q = n y² vanishes only at [1 : 0]; one zero, and d = 0.

Direct prerequisites: `mathlib:Projectivization`, `mathlib:Projectivization.mk`, `mathlib:quadratic_eq_zero_iff_discrim_eq_sq`, `mathlib:discrim`, `mathlib:quadraticChar_card_sqrts`, `mathlib:legendreSym.card_sqrts`, `mathlib:legendreSym`.

Source: [Frank Calegari and David Geraghty, *Minimal modularity lifting for nonregular symplectic representations*](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §8.7, Lemma 8.21 and its proof, printed pp. 872–873. The proof of Lemma 8.21 uses that a p-primitive binary quadratic form has 0, 1 or 2 zeros in ℙ¹(𝔽_p) according as the Legendre symbol of its discriminant is −1, 0 or 1; the node is that fact for every nonzero form over 𝔽_p, with the discriminant r² − 4mn.

## Supporting lemmas for the first-pass targets

Each of these is a lemma that a first-pass target of CA.1 uses in its proof and that the independent review asked to be stated separately; each is placed under the target it serves.

<a id="CA-1-nonzero-root-count-of-a-power-equation"></a>

### The number of n-th roots of an n-th power in a finite field

`ClassicalArithmeticCompletion:CA.1/nonzero-root-count-of-a-power-equation` · lemma · serves [CA.1/power-residue-criterion-in-a-finite-field](ClassicalArithmeticCompletion.md#CA-1-power-residue-criterion-in-a-finite-field) (first pass)

Let F be a finite field with q elements, n ∈ ℕ and a ∈ Fˣ an n-th power. Then the equation x^n = a has exactly gcd(q − 1, n) solutions x ∈ Fˣ. If n ≥ 1, every solution in F is nonzero, so x^n = a also has exactly gcd(q − 1, n) solutions in F. For n = 0 (where a must be 1) all q elements of F are solutions, one more than the gcd(q − 1, 0) = q − 1 solutions in Fˣ.

Hypotheses and conventions: F finite with q elements; a ≠ 0 and a is an n-th power. Root counts are taken in Fˣ; the count in F agrees for n ≥ 1 and differs by one (the root 0) for n = 0.

Acceptance checks:

- In 𝔽_7, x³ = 1 has three solutions (1, 2, 4) and x³ = 6 has three (3, 5, 6); x³ = 2 has none.
- In 𝔽_5 with n = 0 and a = 1: five solutions in F and four in Fˣ.

Proof sketch:

1. Fˣ is cyclic of order q − 1 (isCyclic_of_injective_ringHom, Nat.card_units).
2. If x₀^n = a, the solutions in Fˣ are x₀ times the kernel of the n-th power map, which has gcd(q − 1, n) elements (IsCyclic.card_powMonoidHom_ker).
3. For n ≥ 1, 0^n = 0 ≠ a, so no solution is zero; for n = 0, x^0 = 1 for every x ∈ F, including 0.

Direct prerequisites: [CA.1/power-residue-criterion-in-a-cyclic-group](ClassicalArithmeticCompletion.md#CA-1-power-residue-criterion-in-a-cyclic-group) (first pass), `mathlib:IsCyclic.card_powMonoidHom_ker`, `mathlib:Nat.card_units`, `mathlib:isCyclic_of_injective_ringHom`.

Source: [Matias Carl Relyea, *On finite fields and higher reciprocity*](https://arxiv.org/pdf/2407.03559v3), §1.2, Theorem 1.7 and its proof, pp. 11–13. For positive n and α ∈ Fˣ, x^n = α is solvable exactly when α^{(q−1)/d} = 1 (d = gcd(n, q − 1)), and then has exactly d solutions; the node pins the count in Fˣ and records the n = 0 boundary that the review flagged.

<a id="CA-1-squarefree-part-signed-uniqueness"></a>

### Uniqueness of the signed squarefree part of a rational square class

`ClassicalArithmeticCompletion:CA.1/squarefree-part-signed-uniqueness` · lemma · serves [CA.1/squarefree-part-of-a-rational](ClassicalArithmeticCompletion.md#CA-1-squarefree-part-of-a-rational) (first pass)

If d, d' ∈ ℤ are squarefree, c, c' ∈ ℚ are nonzero, and d c² = d' c'² ≠ 0, then d = d'.

Hypotheses and conventions: Squarefree is Mathlib's Squarefree on ℤ, so ±1 are squarefree and d may be negative. The common value d c² is nonzero, so d, d' ≠ 0.

Acceptance checks:

- 2 · (3/2)² = 18 · (1/2)², but 18 is not squarefree; with squarefree data, 2 · c² = 2 · c'² forces c = ±c' and nothing else.
- −3 · 2² = −12 = −3 · (−2)², while 3 · c² = −12 has no rational solution.

Proof sketch:

1. Signs: d c² and d' c'² have the signs of d and d', so d and d' have the same sign.
2. Valuations: for every prime p, v_p(d) + 2 v_p(c) = v_p(d') + 2 v_p(c') (padicValRat.mul, padicValRat.pow), and v_p(d), v_p(d') ∈ {0, 1} because d, d' are squarefree (Squarefree.natFactorization_le_one on |d|, |d'|); so v_p(d) = v_p(d').
3. Two nonzero integers with the same sign and the same valuation at every prime are equal (x = ±∏ p^{v_p(x)}).

Direct prerequisites: `mathlib:padicValRat`, `mathlib:padicValRat.mul`, `mathlib:padicValRat.pow`, `mathlib:Squarefree`, `mathlib:Squarefree.natFactorization_le_one`.

Source: [Victor Shoup, *A Computational Introduction to Number Theory and Algebra (Version 2)*](https://shoup.net/ntb/ntb-v2.pdf), Exercise 1.30 (b) and (d), printed p. 13. The valuation on ℚ is additive and every nonzero rational is ±∏ p^{ν_p(x)}, which are the two facts the uniqueness compares.

<a id="CA-1-squarefree-part-of-a-square-multiple"></a>

### The squarefree part is constant on square classes

`ClassicalArithmeticCompletion:CA.1/squarefree-part-of-a-square-multiple` · lemma · serves [CA.1/squarefree-part-of-a-rational](ClassicalArithmeticCompletion.md#CA-1-squarefree-part-of-a-rational) (first pass)

For nonzero rationals u and t, ratSquarefreePart(u t²) = ratSquarefreePart(u).

Hypotheses and conventions: u, t ≠ 0; ratSquarefreePart is the parent's definition (the unique squarefree d with u = d c², c ≠ 0).

Acceptance checks:

- ratSquarefreePart(8/9) = ratSquarefreePart(2 · (2/3)²) = 2.
- ratSquarefreePart(−12) = ratSquarefreePart(−3 · 2²) = −3.

Proof sketch:

1. Write u = d c² with d = ratSquarefreePart u squarefree and c ≠ 0 (Rat.exists_squarefree_int_mul_sq and the parent's characterisation).
2. Then u t² = d (ct)² with ct ≠ 0, so by the signed uniqueness lemma ratSquarefreePart(u t²) = d.

Direct prerequisites: [CA.1/squarefree-part-signed-uniqueness](#CA-1-squarefree-part-signed-uniqueness), `tauceti:Rat.exists_squarefree_int_mul_sq`.

Source: [Victor Shoup, *A Computational Introduction to Number Theory and Algebra (Version 2)*](https://shoup.net/ntb/ntb-v2.pdf), Exercise 1.30 (b) and (d), printed p. 13. The valuation calculus behind the invariance under multiplication by squares.

<a id="CA-1-prime-divides-squarefree-part-iff-odd-valuation"></a>

### A prime divides the squarefree part exactly when the valuation is odd

`ClassicalArithmeticCompletion:CA.1/prime-divides-squarefree-part-iff-odd-valuation` · lemma · serves [CA.1/squarefree-part-of-a-rational](ClassicalArithmeticCompletion.md#CA-1-squarefree-part-of-a-rational) (first pass)

For a nonzero rational u and a prime p, p divides ratSquarefreePart(u) if and only if padicValRat p u is odd.

Hypotheses and conventions: u ≠ 0; p prime.

Acceptance checks:

- For u = 8/9: v_2 = 3 is odd and 2 | 2; v_3 = −2 is even and 3 ∤ 2.
- For u = −12: v_3 = 1 is odd and 3 | −3; v_2 = 2 is even and 2 ∤ −3.

Proof sketch:

1. With u = d c², v_p(u) = v_p(d) + 2 v_p(c) (padicValRat.mul, padicValRat.pow), and v_p(d) ∈ {0, 1} because d is squarefree.
2. So v_p(u) is odd exactly when v_p(d) = 1, that is, when p divides d.

Direct prerequisites: [CA.1/squarefree-part-of-a-square-multiple](#CA-1-squarefree-part-of-a-square-multiple), `mathlib:padicValRat`, `mathlib:padicValRat.mul`, `mathlib:padicValRat.pow`, `mathlib:Squarefree.natFactorization_le_one`, `tauceti:Rat.exists_squarefree_int_mul_sq`.

Source: [Victor Shoup, *A Computational Introduction to Number Theory and Algebra (Version 2)*](https://shoup.net/ntb/ntb-v2.pdf), Exercise 1.30 (b) and (d), printed p. 13. Additivity of ν_p on ℚ, from which the parity statement is read off.

<a id="CA-1-primary-eisenstein-coordinate-criterion"></a>

### The coordinate criterion for primary Eisenstein integers

`ClassicalArithmeticCompletion:CA.1/primary-eisenstein-coordinate-criterion` · lemma · serves [CA.1/primary-eisenstein-integer](ClassicalArithmeticCompletion.md#CA-1-primary-eisenstein-integer) (first pass)

Let K be a number field with IsCyclotomicExtension {3} ℚ K and ω ∈ 𝓞_K a primitive cube root of unity. For a, b ∈ ℤ, a + bω is primary (≡ 2 mod 3𝓞_K) if and only if a ≡ 2 (mod 3) and b ≡ 0 (mod 3).

Hypotheses and conventions: The coordinates are those of the ℤ-basis {1, ω} of 𝓞_K.

Acceptance checks:

- −1 − 3ω is primary; 2 + ω and 3 + ω are not.
- −ω² = 1 + ω is not primary (a = 1).

Proof sketch:

1. {1, ω} is a ℤ-basis of 𝓞_K (integralPowerBasisOfPrimePow for 3 = 3^1, whose generator is ω and whose dimension is φ(3) = 2).
2. Hence 3𝓞_K = 3ℤ ⊕ 3ℤω, and a + bω − 2 ∈ 3𝓞_K exactly when 3 | a − 2 and 3 | b.

Direct prerequisites: [CA.1/primary-eisenstein-integer](ClassicalArithmeticCompletion.md#CA-1-primary-eisenstein-integer) (first pass), `mathlib:IsPrimitiveRoot.integralPowerBasisOfPrimePow`, `mathlib:IsCyclotomicExtension`, `mathlib:Ideal.span`.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, the definition of primary, p. 59. A prime a + bω is primary when a ≡ 2 and b ≡ 0 (mod 3), the coordinate form of π ≡ 2 (mod 3).

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §4, Definition 4.4 and Proposition 4.5, p. 11. π primary means π ≡ 2 (mod 3), read in the coordinates a + bζ_3.

<a id="CA-1-unique-primary-associate-of-an-eisenstein-prime"></a>

### Every Eisenstein prime of norm different from 3 has exactly one primary associate

`ClassicalArithmeticCompletion:CA.1/unique-primary-associate-of-an-eisenstein-prime` · lemma · serves [CA.1/primary-eisenstein-integer](ClassicalArithmeticCompletion.md#CA-1-primary-eisenstein-integer) (first pass)

Let K = ℚ(ζ_3) with 𝓞_K = ℤ[ω]. Every prime π of 𝓞_K with N(π) ≠ 3 has exactly one primary associate, among the six associates uπ, u ∈ {±1, ±ω, ±ω²}.

Hypotheses and conventions: π prime with N(π) ≠ 3, so π is prime to 1 − ω and N(π) ≡ 1 (mod 3).

Acceptance checks:

- The primary associate of 3 + ω (norm 7) is (a − b) + aω = 2 + 3ω, the complex conjugate of the primary prime −1 − 3ω.
- 2 is its own primary associate; 1 − ω (norm 3) has none.

Proof sketch:

1. The units of 𝓞_K are ±1, ±ω, ±ω² (IsCyclotomicExtension.Rat.Three.Units.mem).
2. Existence: for π = a + bω, a² − ab + b² = N(π) ≡ 1 (mod 3); the six associates a + bω, −b + (a − b)ω, (b − a) − aω, −a − bω, b + (b − a)ω, (a − b) + aω cover the cases 3 ∤ a or 3 ∤ b, and the coordinate criterion selects one with first coordinate ≡ 2 and second ≡ 0 (mod 3).
3. Uniqueness: if π and uπ are both ≡ 2 (mod 3), then (u − 1)π ∈ 3𝓞_K; π is prime to 3, so 3 | u − 1, and among the six units only u = 1 satisfies this (u − 1 is 0, a unit, or of norm 3 or 4).

Direct prerequisites: [CA.1/primary-eisenstein-coordinate-criterion](#CA-1-primary-eisenstein-coordinate-criterion), `mathlib:IsCyclotomicExtension.Rat.Three.Units.mem`, `mathlib:IsCyclotomicExtension.Rat.three_pid`, [CA.1/primary-eisenstein-integer](ClassicalArithmeticCompletion.md#CA-1-primary-eisenstein-integer) (first pass).

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §4, Proposition 4.5 and its proof, p. 11. Lists the six associates of a + bζ_3 and proves existence and uniqueness of the primary one when N(π) = p ≡ 1 (mod 3).

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, p. 59. States that every prime of norm different from 3 has exactly one primary associate.

<a id="CA-1-cubic-jacobi-sum-is-primary"></a>

### The cubic Jacobi sum of a primary prime is primary

`ClassicalArithmeticCompletion:CA.1/cubic-jacobi-sum-is-primary` · lemma · serves [CA.1/cubic-jacobi-sum-of-a-primary-prime](ClassicalArithmeticCompletion.md#CA-1-cubic-jacobi-sum-of-a-primary-prime) (first pass)

Let π be a primary prime of ℤ[ω] of norm p ≡ 1 (mod 3) and χ = (·/π)_3. Then J(χ, χ) ≡ 2 (mod 3𝓞_K).

Hypotheses and conventions: As in the parent's Jacobi sum lemma.

Acceptance checks:

- For π = −1 − 3ω: J = −1 − 3ω ≡ 2 (mod 3).

Proof sketch:

1. In the ring of integers R of ℚ(ω, ζ_p), g(χ)^3 = pJ(χ, χ) (the cubic Gauss sum identity).
2. Modulo 3R, cubing is additive: g(χ)^3 ≡ Σ_t χ(t)^3 ψ(t)^3 = Σ_{t ≠ 0} ψ(3t) = −1, since χ^3 = 1 on 𝔽_pˣ and 3 is invertible in 𝔽_p.
3. As p ≡ 1 (mod 3), J ≡ −1 ≡ 2 (mod 3R), and 3R ∩ 𝓞_K = 3𝓞_K (an element of K integral over ℤ lies in 𝓞_K).

Direct prerequisites: [CA.1/gauss-sum-cube-of-a-cubic-character](#CA-1-gauss-sum-cube-of-a-cubic-character), [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), [CA.1/primary-eisenstein-integer](ClassicalArithmeticCompletion.md#CA-1-primary-eisenstein-integer) (first pass), `mathlib:gaussSum_frob`, `mathlib:IsCyclotomicExtension`.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §4, Proposition 4.8 and its proof, p. 12. Shows J(χ_π, χ_π) ≡ −1 (mod 3) from g^3 = pJ and the congruence g^3 ≡ −1.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, Lemma 3.2 and its proof, pp. 62–64. The same congruence as the first part of the proof that J = π.

<a id="CA-1-cubic-jacobi-sum-norm-and-divisibility"></a>

### The cubic Jacobi sum has norm p and is divisible by π

`ClassicalArithmeticCompletion:CA.1/cubic-jacobi-sum-norm-and-divisibility` · lemma · serves [CA.1/cubic-jacobi-sum-of-a-primary-prime](ClassicalArithmeticCompletion.md#CA-1-cubic-jacobi-sum-of-a-primary-prime) (first pass)

Let π be a primary prime of ℤ[ω] of norm p ≡ 1 (mod 3) and χ = (·/π)_3. Then J(χ, χ) times its complex conjugate is p, and π divides J(χ, χ) in 𝓞_K. Consequently J(χ, χ) = π.

Hypotheses and conventions: As in the parent's Jacobi sum lemma; 𝓞_K = ℤ[ω] is a principal ideal domain.

Acceptance checks:

- For π = −1 − 3ω: J(χ, χ) = −1 − 3ω, and its conjugate 2 + 3ω satisfies (−1 − 3ω)(2 + 3ω) = 7.
- The non-primary associate −π gives the same character, so J = π, not −π.

Proof sketch:

1. J(χ, χ) J(χ⁻¹, χ⁻¹) = p (jacobiSum_mul_jacobiSum_inv; χ, χ and χ² are nontrivial), and J(χ⁻¹, χ⁻¹) = J(χ̄, χ̄) is the complex conjugate.
2. Modulo π, χ(t) ≡ t^{(p−1)/3}, so J ≡ Σ_t t^k(1 − t)^k with k = (p − 1)/3, a combination of power sums Σ_t t^j with 1 ≤ j ≤ 2k < p − 1, all zero (FiniteField.sum_pow_lt_card_sub_one); so π | J.
3. J has norm p and is divisible by π (norm p), so J is an associate of π (𝓞_K is a PID, three_pid); J is primary (previous lemma), and π has exactly one primary associate, so J = π.

Direct prerequisites: [CA.1/cubic-jacobi-sum-is-primary](#CA-1-cubic-jacobi-sum-is-primary), [CA.1/unique-primary-associate-of-an-eisenstein-prime](#CA-1-unique-primary-associate-of-an-eisenstein-prime), [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), `mathlib:jacobiSum`, `mathlib:jacobiSum_mul_jacobiSum_inv`, `mathlib:FiniteField.sum_pow_lt_card_sub_one`, `mathlib:IsCyclotomicExtension.Rat.three_pid`.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §4, Proposition 4.8 and its proof, p. 12. Shows J J̄ = p and J ≡ 0 (mod π) by the power-sum argument, and concludes J = π from primarity.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, Lemma 3.2 and its proof, pp. 62–64. The same three steps: primary congruence, norm p, divisibility by π.

<a id="CA-1-gauss-sum-cube-of-a-cubic-character"></a>

### The cube of the Gauss sum of a cubic character

`ClassicalArithmeticCompletion:CA.1/gauss-sum-cube-of-a-cubic-character` · lemma · serves [CA.1/cubic-gauss-sum-cube](ClassicalArithmeticCompletion.md#CA-1-cubic-gauss-sum-cube) (first pass)

Let F be a finite field with q elements, R an integral domain, χ : F → R a multiplicative character of order exactly 3 and ψ a primitive additive character of F with values in R. Then χ(−1) = 1 and g(χ, ψ)^3 = q · J(χ, χ).

Hypotheses and conventions: orderOf χ = 3; ψ primitive; R a domain (χ(−1) is then a root of unity of order dividing 2 and 3).

Acceptance checks:

- For χ = (·/π)_3 with π = −1 − 3ω of norm 7: g^3 = 7 J(χ, χ) = 7π.
- The identity fails for a quadratic character (order 2), where g² = χ(−1) q: the order hypothesis is used.

Proof sketch:

1. gaussSum_pow_eq_prod_jacobiSum with orderOf χ = 3 gives g(χ)^3 = χ(−1) · q · ∏_{i ∈ Ico 1 2} J(χ, χ^i) = χ(−1) · q · J(χ, χ).
2. χ(−1)² = χ(1) = 1 and χ(−1)³ = χ(−1)^{orderOf χ} = 1, so χ(−1) = 1.

Direct prerequisites: `mathlib:gaussSum_pow_eq_prod_jacobiSum`, `mathlib:jacobiSum`, `mathlib:gaussSum`, `mathlib:AddChar.IsPrimitive`.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §4, Proposition 4.7 and its proof, p. 12. g(χ_π)^3 = pJ(χ_π, χ_π) from the Gauss–Jacobi relation and χ_π(−1) = 1.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, Proposition 3.3, p. 61. The general identity g(χ)^m = χ(−1) p J(χ, χ) ⋯ J(χ, χ^{m−2}) for a character of order m, specialised here to m = 3.

<a id="CA-1-cubic-reciprocity-with-two-rational-primes"></a>

### The cubic symbol of a rational integer at a rational prime is trivial

`ClassicalArithmeticCompletion:CA.1/cubic-reciprocity-with-two-rational-primes` · lemma · serves [CA.1/cubic-reciprocity](ClassicalArithmeticCompletion.md#CA-1-cubic-reciprocity) (first pass)

Let q ≡ 2 (mod 3) be a rational prime (inert in ℤ[ω]) and n a rational integer prime to q. Then (n/q)_3 = 1. In particular cubic reciprocity holds trivially for two distinct rational primes q₁, q₂ ≡ 2 (mod 3).

Hypotheses and conventions: q ≡ 2 (mod 3) prime, so q is a primary prime of ℤ[ω] of norm q²; n ∈ ℤ prime to q.

Acceptance checks:

- (2/5)_3 = 1: 5 is inert in ℤ[ω] and 2^{(25−1)/3} = 2^8 = 256 ≡ 1 (mod 5).
- (7/2)_3 = 1: 7 ≡ 1 (mod 2).

Proof sketch:

1. Complex conjugation fixes n and q, so by Galois equivariance conj((n/q)_3) = (n/q)_3.
2. For a cube root of unity ζ, conj(ζ) = ζ² ; so (n/q)_3 = (n/q)_3², and (n/q)_3 = 1.

Direct prerequisites: [CA.1/power-residue-symbol-galois-equivariance](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-galois-equivariance) (first pass), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass).

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §4, proof of Theorem 4.6, Case 1, p. 13. Proves χ_p(n) = 1 for rational n prime to p from χ_π(ᾱ) = χ̄_π(α) and the fact that a cube root of unity's conjugate is its square.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, proof of Theorem 3.1, first case, p. 64. The case of two rational primes.

<a id="CA-1-cubic-reciprocity-rational-and-complex-prime"></a>

### Cubic reciprocity between a rational prime and a complex primary prime

`ClassicalArithmeticCompletion:CA.1/cubic-reciprocity-rational-and-complex-prime` · lemma · serves [CA.1/cubic-reciprocity](ClassicalArithmeticCompletion.md#CA-1-cubic-reciprocity) (first pass)

Let q ≡ 2 (mod 3) be a rational prime and π a primary prime of ℤ[ω] of norm p ≡ 1 (mod 3). Then (q/π)_3 = (π/q)_3.

Hypotheses and conventions: q ≠ p automatically (p ≡ 1, q ≡ 2 mod 3).

Acceptance checks:

- q = 2, π = −1 − 3ω: (2/π)_3 = ω² = (π/2)_3 (the parent's acceptance example).

Proof sketch:

1. In R = 𝓞 of ℚ(ω, ζ_p): g(χ_π)^3 = pπ (the cubic Gauss sum lemma). Raise to (q² − 1)/3 and reduce modulo q: g^{q²−1} ≡ (pπ)^{(q²−1)/3} ≡ (pπ/q)_3 = (π/q)_3, since (p/q)_3 = 1 by the previous lemma.
2. Also g^{q²} ≡ Σ_t χ_π(t)^{q²} ψ(t)^{q²} = Σ_t χ_π(t) ψ(q²t) = χ_π(q⁻²) g = χ_π(q) g (mod q), by the Frobenius congruence (gaussSum_frob), q² ≡ 1 (mod 3) and the shift formula (gaussSum_mulShift_eq).
3. g is invertible modulo q (g ḡ = p), so (π/q)_3 ≡ χ_π(q) (mod q); two cube roots of unity congruent modulo q are equal.

Direct prerequisites: [CA.1/cubic-gauss-sum-cube](ClassicalArithmeticCompletion.md#CA-1-cubic-gauss-sum-cube) (first pass), [CA.1/cubic-reciprocity-with-two-rational-primes](#CA-1-cubic-reciprocity-with-two-rational-primes), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), [CA.1/norm-of-a-prime-is-one-modulo-n](ClassicalArithmeticCompletion.md#CA-1-norm-of-a-prime-is-one-modulo-n) (first pass), `mathlib:gaussSum_frob`, `mathlib:gaussSum_mulShift_eq`, `mathlib:gaussSum_mul_gaussSum_eq_card`.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §4, proof of Theorem 4.6, Case 2, p. 13. Compares g^{q²−1} computed from g³ = pπ with g^{q²} computed by the Frobenius congruence.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, proof of Theorem 3.1, second case, pp. 64–65. The same comparison.

<a id="CA-1-cubic-reciprocity-two-complex-primes"></a>

### Cubic reciprocity between two complex primary primes

`ClassicalArithmeticCompletion:CA.1/cubic-reciprocity-two-complex-primes` · lemma · serves [CA.1/cubic-reciprocity](ClassicalArithmeticCompletion.md#CA-1-cubic-reciprocity) (first pass)

Let π₁, π₂ be primary primes of ℤ[ω] of norms p₁ ≠ p₂, both ≡ 1 (mod 3). Then (π₂/π₁)_3 = (π₁/π₂)_3.

Hypotheses and conventions: p₁ ≠ p₂, so π₁ and π₂ are coprime and neither divides the other's norm.

Acceptance checks:

- π₁ = −1 − 3ω (norm 7) and π₂ = −1 + 3ω (norm 13): modulo π₁, ω ≡ 2 and π₂ ≡ 5 with 5² ≡ 4 ≡ ω²; modulo π₂, ω ≡ 9 and π₁ ≡ 11 with 11⁴ ≡ 3 ≡ ω²; both symbols are ω².

Proof sketch:

1. As in the previous lemma, in the ring of integers of ℚ(ω, ζ_{p₁}) and modulo a prime above π₂: g(χ_{π₁})^{p₂} ≡ χ_{π₁}(p₂)⁻¹ g(χ_{π₁}) = χ_{π₁}(p₂²) g(χ_{π₁}), while g(χ_{π₁})^{p₂−1} = (p₁π₁)^{(p₂−1)/3} ≡ χ_{π₂}(p₁π₁); so χ_{π₁}(p₂²) = χ_{π₂}(p₁π₁). Symmetrically χ_{π₂}(p₁²) = χ_{π₁}(p₂π₂).
2. Write x = χ_{π₁}(π₂), y = χ_{π₂}(π₁), u = χ_{π₁}(π̄₂), v = χ_{π₂}(π̄₁), using p₁ = π₁π̄₁ and p₂ = π₂π̄₂: the two relations read x²u² = y²v and y²v² = x²u.
3. Multiplying them gives uv = 1; substituting v = u⁻¹ in the first gives x² u³ = y², and u³ = 1, so x² = y²; squaring is a bijection of μ_3, so x = y.

Direct prerequisites: [CA.1/cubic-gauss-sum-cube](ClassicalArithmeticCompletion.md#CA-1-cubic-gauss-sum-cube) (first pass), [CA.1/cubic-reciprocity-rational-and-complex-prime](#CA-1-cubic-reciprocity-rational-and-complex-prime), [CA.1/power-residue-symbol-galois-equivariance](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-galois-equivariance) (first pass), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/power-residue-symbol](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol) (first pass), [CA.1/norm-of-a-prime-is-one-modulo-n](ClassicalArithmeticCompletion.md#CA-1-norm-of-a-prime-is-one-modulo-n) (first pass), `mathlib:gaussSum_frob`, `mathlib:gaussSum_mulShift_eq`.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §4, proof of Theorem 4.6, Case 3, pp. 13–14. Derives the two congruences and combines them with χ_π(ᾱ) = conj(χ_π(α)).

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, proof of Theorem 3.1, third case, pp. 65–66. The same argument.

<a id="CA-1-cubic-reciprocity-with-a-rational-integer"></a>

### Cubic reciprocity between a primary prime and a rational integer

`ClassicalArithmeticCompletion:CA.1/cubic-reciprocity-with-a-rational-integer` · lemma · serves [CA.1/cubic-supplement-for-one-minus-zeta](ClassicalArithmeticCompletion.md#CA-1-cubic-supplement-for-one-minus-zeta) (first pass)

Let π be a primary prime of ℤ[ω] with N(π) ≠ 3, and A a rational integer prime to 3 and to π. Then (A/π)_3 = (π/A)_3, the right side being the cubic symbol at the ideal A ℤ[ω].

Hypotheses and conventions: A ∈ ℤ, 3 ∤ A, A prime to π; A may be negative or composite. (−1/·)_3 = 1 because −1 = (−1)³.

Acceptance checks:

- π = −1 − 3ω, A = 10 = 2·5: (10/π)_3 = (2/π)_3(5/π)_3 and (π/10)_3 = (π/2)_3(π/5)_3.

Proof sketch:

1. Both sides are unchanged by A ↦ −A, so take A > 0 and factor A into rational primes q ≡ 2 (mod 3), which are primary primes of ℤ[ω], and p ≡ 1 (mod 3) = ρρ̄ with ρ, ρ̄ primary primes of norm p (conjugation preserves π ≡ 2 mod 3).
2. (A/π) = ∏ (q/π) ∏ (ρ/π)(ρ̄/π) and (π/A) = ∏ (π/q) ∏ (π/ρ)(π/ρ̄) (multiplicativity in numerator and in the ideal).
3. Each factor pair agrees by cubic reciprocity: for a rational prime factor q (and π rational or complex) by the two previous lemmas; for ρ, ρ̄ by the two-complex-primes lemma, their norm p differing from N(π) because otherwise π would be associate to ρ or ρ̄ and divide A.

Direct prerequisites: [CA.1/cubic-reciprocity-with-two-rational-primes](#CA-1-cubic-reciprocity-with-two-rational-primes), [CA.1/cubic-reciprocity-rational-and-complex-prime](#CA-1-cubic-reciprocity-rational-and-complex-prime), [CA.1/cubic-reciprocity-two-complex-primes](#CA-1-cubic-reciprocity-two-complex-primes), [CA.1/cubic-reciprocity](ClassicalArithmeticCompletion.md#CA-1-cubic-reciprocity) (first pass), [CA.1/power-residue-symbol-of-an-ideal](ClassicalArithmeticCompletion.md#CA-1-power-residue-symbol-of-an-ideal) (first pass), [CA.1/primary-eisenstein-integer](ClassicalArithmeticCompletion.md#CA-1-primary-eisenstein-integer) (first pass), [CA.1/unique-primary-associate-of-an-eisenstein-prime](#CA-1-unique-primary-associate-of-an-eisenstein-prime).

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, Williams' proof of the supplement, pp. 66–67. Applies cubic reciprocity with the composite primary rational denominators a and a + b; the node is that multiplicative extension, which the review asked to be stated separately.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §4, Theorem 4.6, p. 11. Cubic reciprocity for primary primes of distinct norms, the input of the multiplicative extension.

<a id="CA-1-normalising-root-of-unity-of-a-cyclotomic-integer"></a>

### The unique root of unity making a cyclotomic integer primary

`ClassicalArithmeticCompletion:CA.1/normalising-root-of-unity-of-a-cyclotomic-integer` · lemma · serves [CA.1/primary-element-of-a-cyclotomic-ring](ClassicalArithmeticCompletion.md#CA-1-primary-element-of-a-cyclotomic-ring) (first pass)

Let l be an odd prime, K = ℚ(ζ_l), ζ = ζ_l ∈ 𝓞_K and λ = 1 − ζ. Then λ𝓞_K is a prime of residue degree 1 with 𝓞_K/λ ≅ 𝔽_l; every α ∈ 𝓞_K satisfies α ≡ a + bλ (mod λ²) for some a, b ∈ ℤ, unique modulo l; ζ^c ≡ 1 − cλ (mod λ²) for c ∈ ℤ; and for α prime to l there is exactly one c ∈ ℤ/l such that ζ^c α is primary (congruent to a rational integer modulo λ²).

Hypotheses and conventions: l odd prime; α prime to l means λ ∤ α.

Acceptance checks:

- For α = ζ = 1 − λ: a = 1, b = −1, and the unique c is −1 (ζ^{−1}ζ = 1).
- α = 2 is primary (c = 0); α = 1 − ζ is not prime to l.

Proof sketch:

1. λ is prime (IsPrimitiveRoot.zeta_sub_one_prime') of residue degree 1 (IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one), so α ≡ a (mod λ) for some a ∈ ℤ, and (α − a)/λ ≡ b (mod λ) for some b ∈ ℤ: α ≡ a + bλ (mod λ²).
2. ζ^c = (1 − λ)^c ≡ 1 − cλ (mod λ²), so ζ^c α ≡ a + (b − ac)λ (mod λ²).
3. If λ ∤ α then l ∤ a, so there is exactly one c modulo l with ac ≡ b (mod l), i.e. with ζ^c α ≡ a (mod λ²); uniqueness uses that a + eλ with e ∈ ℤ is congruent to a rational integer modulo λ² exactly when l | e (λ² ∩ ℤ = lℤ for l odd).

Direct prerequisites: [CA.1/primary-element-of-a-cyclotomic-ring](ClassicalArithmeticCompletion.md#CA-1-primary-element-of-a-cyclotomic-ring) (first pass), `mathlib:IsPrimitiveRoot.zeta_sub_one_prime'`, `mathlib:IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one`, `mathlib:IsCyclotomicExtension`.

Source: [Sukumar Das Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*](https://www.bprim.org/sites/default/files/recipro1.pdf), §4, (19)–(22) and the paragraph after them, p. 69. Proves α ≡ a + b(1 − ζ_l), ζ^d ≡ 1 − d(1 − ζ_l) modulo (1 − ζ_l)², and the existence and uniqueness of the normalising power.

Source: [Nancy Xu, *Reciprocity Laws*](http://math.uchicago.edu/~may/REU2021/REUPapers/Xu,Nancy.pdf), §6, Definition 6.7 and Proposition 6.8 with its proof, pp. 19–20. The same argument.

## Dependencies on other roadmaps

This part cites only Mathlib, Tau Ceti, the first pass of this roadmap and the Tau Ceti roadmaps below. No layer of a roadmap above this one in the upstream order is cited. The norm-residue symbol moves down here from K2SymbolsBrauer T.7, which imports it. Φ, Stickelberger's relation and the residue identity are imported by FiniteFieldsAndCharacterSums FF.1.

| Tau Ceti layer | What this part uses |
| --- | --- |
| Class Field Theory, Layer 5 | `localSymbol (kummerCupPairing ζ)` with the invariant coordinate `h2MuEquivZMod_mixed`, `localSymbol_eq_zero_iff_mem_normGroup`, `localSymbol_kummerClass_eq_zero_iff`, for the comparison theorem |
| Class Field Theory, Layer 6 | `localArtinMap`, `localArtinEquiv_eq_of_iota`, kernel = norm group of index [L:F], `localArtinMap_uniformizer`, `localArtinMap_quadratic_eq_hilbertSymbol` |
| Class Field Theory, Layer 7 | `artinMap`, `artinMap_restrict`, `artinMap_norm`, `artinMap_congr` |
| Class Field Theory, Layer 10 | `infiniteArtinAt`, `infiniteArtinAt_eq_one_of_isComplex`, `infiniteArtinAt_eq_one_iff_of_isReal` |
| Quadratic Form Invariants, 6C | the norm-equation Hilbert symbol `hilbertSymbol`, for n = 2 |

The current Tau Ceti library (after the pinned commit) already contains the absolute local Artin map `TauCeti.ClassFieldTheory.artinMap`, `localSymbol`, `kummerClass` and the quadratic comparison `localArtinMap_quadratic_eq_hilbertSymbol`. None of these is at the pin. The degree-n norm-residue symbol, its comparison for n > 2, and every target of this part are absent from both.

## Boundaries

- **Explicit reciprocity laws at the places above n (n > 2).** These are the Artin–Hasse and Artin–Hasse–Iwasawa formulas, and Kummer's, Shafarevich's and Vostokov's formulas for the wild symbol. They belong to HigherLocalFieldsAndHigherClassFieldTheory HL.4, whose explicit-formula targets contain the one-dimensional case. HL.4 imports [CA.1/local-norm-residue-symbol](#CA-1-local-norm-residue-symbol) as the symbol those formulas evaluate. Fesenko–Vostokov Chapter VII proves the Artin–Hasse formulas (as §5 Exercises 1 and 4) in the orientation pinned here. No target of CA.1 depends on them, because the power reciprocity law keeps the factors at the places above n as norm-residue symbols.
- **Hilbert reciprocity and global Artin reciprocity** are Class Field Theory's (Layers 11 and 14) and are not re-planned. Their application to the degree-n symbol is the first pass's product formula.
- **The quadratic norm-equation Hilbert symbol** is Quadratic Form Invariants 6C's. For n = 2 the degree-2 norm-residue symbol agrees with it, and the suggested file restates it only as a stand-in at the pin.

## Recorded gaps

- **No public proof of the supplement for 1 + i was read.** ((1 + i)/λ)_4 = i^{(a − b − b² − 1)/4} is checked by direct computation: every primary prime with |a|, |b| ≤ 12, 67 primary composites, and multiplicativity of the right side on all primary residues modulo 32. Its proof sketch reduces it to rational-denominator reciprocity and the supplement for i. Xu's paper does not state the supplement and Relyea's survey states only the main law. Gauss's second memoir on biquadratic residues (§§68–76), Lemmermeyer's *Reciprocity Laws* (Theorem 6.9) and Ireland–Rosen Chapter 9 were not read; the last two are not freely available.
- **The sign of the comparison with the cohomological symbol is fixed by a computation, not read from a source.** Milne III Remark 4.5 relates the cup-product symbol to the Artin map only for Milne's conventions. The node asserts agreement up to one universal sign ε and pins ε by the unramified computation.

## Continuation frontier

- **A public proof of the supplement for 1 + i**, compared with the reduction written in [CA.1/quartic-supplement-for-one-plus-i](#CA-1-quartic-supplement-for-one-plus-i).
- **The value of ε** in [CA.1/norm-residue-symbol-and-the-cohomological-symbol](#CA-1-norm-residue-symbol-and-the-cohomological-symbol), against the conventions of Class Field Theory's `kummerClass`, cup product and `h2MuEquivZMod_mixed`.

## Mistakes found in the sources

All are recorded in the packet under `sourceIssues`, E1101–E1109, with reasons and where corrections were looked for.

- Xu, Proposition 5.5 (p. 15): the coordinate criterion for primary Gaussian integers omits b ≡ 2 (mod 4) in its second case. As printed, 3 would be primary.
- Katre, §§1–4 (pp. 75–85): the factorisation of Gauss sums is proved for odd p, while Proposition 5 applies it at primes above 2. The argument extends to p = 2 (see [CA.1/stickelberger-relation](#CA-1-stickelberger-relation), step 4).
- Shastri, §5, Lemma 1 (p. 179): the proof of the Steinberg relation treats only the case [K(ⁿ√a):K] = n. The statement also omits a ≠ 1.
- Xu, Proposition 6.12 (p. 21): g(P') for g(P). Theorem 4.6 (p. 11): ℤ[i] for ℤ[ζ_3]. Proposition 5.9 (p. 15): χ_p for χ_π. Proposition 6.19 (p. 23): (α)^γ for Φ(α). Proposition 5.13 (p. 16): a gcd condition without its value 1.

## Planets and proposed sub-layers

This part marks four planets: *Norm-residue symbol*, *Quadratic reciprocity in number fields*, *Quartic reciprocity* and *Stickelberger relation*. With the six planets of the first pass that makes ten, against the atlas's limit of six per layer, so the packet proposes three sub-layers for the atlas:

- CA.1a, *Power residues and quadratic characters*: Units modulo a power of two, Quadratic character of a square class, Power residue symbol.
- CA.1b, *Norm-residue symbols and power reciprocity*: Norm-residue symbol, Power reciprocity law, Quadratic reciprocity in number fields.
- CA.1c, *Cubic, quartic and Eisenstein reciprocity*: Cubic reciprocity, Quartic reciprocity, Stickelberger relation, Eisenstein reciprocity.

## Sources

- N. Xu, *Reciprocity Laws*, University of Chicago REU 2021 paper: §§3–6.
- S. A. Katre, *Gauss–Jacobi Sums and Stickelberger's Theorem*, in *Cyclotomic Fields and Related Topics*, Bhaskaracharya Pratishthana, 2000, pp. 75–92.
- D. Clausen, *Cyclotomic fields*, lectures 15–16 (2014).
- I. B. Fesenko and S. V. Vostokov, *Local Fields and Their Extensions*, 2nd ed., AMS, 2002, Chapter IV §5 and Chapter VII §5.
- J. Friedlander, H. Iwaniec, B. Mazur and K. Rubin, *The spin of prime ideals*, Invent. Math. 193 (2013), arXiv:1110.6331v2, §2.
- P. Koymans and D. Milovic, *Joint distribution of spins*, Duke Math. J. 170 (2021), arXiv:1809.09597v1, §§2.1 and 5.
- F. Calegari and D. Geraghty, *Minimal modularity lifting for nonregular symplectic representations*, Duke Math. J. 169 (2020), §8.7.
- S. D. Adhikari, *The Early Reciprocity Laws: From Gauss to Eisenstein*, same proceedings, §§3–4.
- P. Shastri, *Reciprocity Laws: Artin–Hilbert*, same proceedings, §§5–9.
- M. C. Relyea, *On finite fields and higher reciprocity*, arXiv:2407.03559v3, §§1.2 and 4.1.
- J. S. Milne, *Class Field Theory*, version 4.03, Chapter III §4 and Chapter VIII §5.
- V. Shoup, *A Computational Introduction to Number Theory and Algebra*, version 2, Exercise 1.30.
