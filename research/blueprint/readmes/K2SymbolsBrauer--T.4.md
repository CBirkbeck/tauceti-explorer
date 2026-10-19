# Rational function fields, Milnor norms and reciprocity

This layer constructs the integral Milnor norm from the Bass–Tate sequence, proves that it is independent of a generating tower, and uses its compatibility with residues to prove reciprocity for the function field of a curve over any field. Its degree-two output is the normed tame-symbol product formula. Its disjoint-support specialization uses Tau Ceti’s existing divisor evaluation and agrees with the elliptic reciprocity milestone.

The stage is `K2SymbolsBrauer:T.4`. This is a target-complete continuation of the broad [T.3 packet](../packets/K2SymbolsBrauer--T.3.json), whose T.4 definitions and targets retain their public identifiers. The new packet imports those records and adds twelve proof-completion targets. It does not create a second Milnor group, residue map or norm. At package assembly, the proof map at the end of the packet merges these refinements into the retained target records. T.5–T.7 and their arithmetic/cohomological sources are outside this job.

Coverage is **planned**, with one explicit ownership-routing gap: complete discrete valuation fields with arbitrary residue need the four supplier contracts specified below. The proofs using those contracts remain conditional until their owner is registered and its exports accepted. Nothing here is claimed formalized or closed.

## Conventions and scope

Write Kᴹ₀(F)=ℤ, Kᴹ₁(F)=Fˣ and all higher groups additively, with integral coefficients. Symbols are multilinear and graded skew-commutative; a repeated entry satisfies {a,a}={a,−1} and need not vanish. The Milnor ring, its grading and field-induced restriction maps come from T.2. Higher residues, their finite support, specialization and product law come from T.3:symbols.

Use the **uniformizer-last** normalization

∂ᵥ{u₁,…,uₙ₋₁,π}={ū₁,…,ūₙ₋₁}.

Consequently in degree two, with a=ordᵥ f and b=ordᵥ g,

∂ᵥ{f,g}=(−1)^(ab) · resᵥ(f^b g^(−a)).

The argument of the residue has order ba−ab=0. In particular ∂{u,π}=ū and ∂{π,u}=ū⁻¹. The combined K-book draft’s Theorem III.7.3 uses the uniformizer-first residue ∂ᵂ=(−1)^(n−1)∂ on Kᴹₙ. Degree-two factors are inverted. A simple norm is unchanged, since both residues defining it on Kᴹ_(n+1)(F(t)) change by the same scalar. Suslin’s Lemma 1.3 already places the parameter last.

A concrete sign check is F=ℚ at 5: ∂{5,2}=2⁻¹=3 in 𝔽₅ˣ, whereas the first convention gives 2. This distinction must remain visible in the eventual comparison with Quillen localization.

Fields and residue fields may be imperfect. A one-variable function field is `TauCeti.IsFunctionField F K`; no assumption says F is the full field of constants. The proper regular model supplied by AlgebraicCurves may fail to be smooth over F. For a singular proper curve, use the closed points of its normalization, not the points of the singular curve.

## Existing owners and exact imports

| Input or output | Owner and required interface |
| --- | --- |
| Integral Milnor components and restrictions | `K2SymbolsBrauer:T.2/milnor-k-theory`, with its homogeneous quotient API in the T.2 continuation; the degree-two presentation is the specified Matsumoto comparison. |
| Higher residues, specialization, product signs, finite support | `K2SymbolsBrauer:T.3:symbols`, specifically `/higher-milnor-residues`, `/milnor-residue-product-formula`, `/serre-map-kernel`, `/finite-support`. |
| Rational places and infinity | AlgebraicCurves Layers0/1 and the pinned `Place.ratFuncEquiv`, polynomial residue-field equivalence, infinity order and uniformizer. |
| Finite normalization without separability | AlgebraicCurves Layer2: the integral closure of F[t] in any finite K/F(t) is finite, and likewise on the t⁻¹ chart and their localizations. |
| Completion after finite normalization | Request the exact finite-module completion corollary from AlgebraicCurves Layer2, with Layer5’s completion interfaces: E⊗F F̂≃∏Ê_w, unchanged residue fields and index1 for completion. The hypothesis is finite integral closure. |
| Regular model and place dictionary | AlgebraicCurves Layer12A/B/D: closed points↔places, residue F-algebra equivalences and matching degrees/orders, Weil divisors↔`Divisor F K`, principal divisors included. T.4 only transports the symbol and norm. |
| Prime-to-p field detector | Existing `LocalFieldsRamificationPartII:GF.0/maximal-p-extension`, applied to all primes other than p. T.4 proves the Milnor kernel detector, not the field-existence construction. |
| Complete DVR substrate with arbitrary residue | The distinct proposed `LocalFieldsPartIICompleteDiscreteValuations:DVR.0–DVR.3`, specified below. This is a recorded gap, not an existing supplier. |
| Elliptic disjoint-support milestone | EllipticCurves Layer2, with Layer0’s divisors and the pinned `Divisor.eval`; prove compatibility with the general theorem. |
| Quillen comparison | After this layer, T.3:localization-comparison imports these Milnor norms and GeneralAlgebraicKTheory’s transfers; it constructs neither again. |
| Norms/reciprocity for diagonal cycle maps | Export to MotivicEtaleKTheory M.4, for Nesterenko–Suslin/Totaro. HigherLocalFields HL.1 and elliptic K-theory also consume this output. They supply no premise here. |

Current read-only TauCetiRoadmap main was checked, including AlgebraicCurves and EllipticCurves README/Suggested files, and LocalFieldsRamification’s scope. The reviewed T.4 library audit records places/order/finite support as partial infrastructure, not Milnor transfers or reciprocity. Searches of the pinned and current Tau Ceti library found no implemented Milnor norm, Bass–Tate sequence or general function reciprocity theorem. Current isogeny-based Weil pairing work does not establish the divisor-evaluation milestone.

The name `LocalFieldsRamificationPartII` is already registered for the arbitrary-rank Temkin GF.0–GF.6 roadmap. Its header leaves the complete-DVR module separate. The former proposal to put DVR.0–DVR.3 under that same name would collide. The distinct proposed identifier above preserves the existing owner; it is a local-fields Part II module for maintainer routing, not a new direction within K₂.

The RS-28 and confirmed /12, /28, /32 obligations give the order T.3:symbols → T.4 → T.3:localization-comparison and the export T.4 → M.4. The existing AC-L39/40/41 imports remain; EllipticCurves Layer2 → T.4 is a compatibility input. No reverse edge to a consumer is proposed. K2SymbolsBrauer is not one of the 94 roadmaps tiered in CaraianiNewton; only the foundational GF.0 field-theory import is used, with no dependency on its later valued-field targets.

## Pinned library interfaces

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration recorded in the packet was opened and its actual statement read at those pins. Particularly relevant limitations are these:

- `Place.ratFuncEquiv` identifies `Option (HeightOneSpectrum F[X])` with the places of `RatFunc F`; `none` is infinity. The polynomial residue-field equivalence runs from F[X]/(p) to the place residue field; the infinity residue equivalence runs from F to its residue field.
- `Place.ord_infty` is minus rational-function degree, and `Place.isUniformizer_infty` uses X⁻¹. These supply leading-coefficient specialization.
- `Place.finite_setOf_ord_ne_zero` requires the explicit function-field hypothesis. A finite union over the entries of finitely many symbols gives finite support of residues.
- `Place.normResidue` is a determinant norm of an order-zero unit residue. `normResidueOrOne` is its total extension with value1 off the order-zero locus. In the product statement its argument is proved order-zero; the default is never used for that argument.
- `Place.degree` is `Module.finrank F P.ResidueField`. The function-field hypothesis ensures finite residue extensions; without finiteness both degree and norm have default values unsuitable for the classical formula.
- `Divisor.principal hF f` and `Divisor.eval` already use units, finitely supported integer divisors and normed residue values. `eval_eq_prod_normResidue` applies when f is a unit at the support, and `isUnitAtSupport_iff_disjoint` supplies exactly that condition.
- `Scheme.ord` and `Place.heightOneSpectrumEquiv` exist separately. Their global comparison is AlgebraicCurves Layer12’s target, not a pinned bridge.
- `Algebra.norm_norm` supplies transitivity of determinant norms. `norm_eq_prod_roots` includes root multiplicities and the relative degree; `Polynomial.resultant_eq_prod_eval` supplies the leading-coefficient factors needed for the degree-one simple norm calculation.
- `Ideal.sum_ramification_inertia_eq_finrank` is for a finite flat algebra and returns module rank. It does not itself construct a finite normalization or identify module rank with a field degree. The proposed DVR supplier supplies that lattice before applying it.
- `TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable` already supplies finite normalization for finite purely inseparable extensions of the fraction field of a finite-variable polynomial ring. AlgebraicCurves owns its use, together with separable finite normalization, for arbitrary finite K/F(t).

Current Tau Ceti, after the pin, also implements `TauCeti.Algebra.norm_quotient_mk` in `RingTheory/Norm/Quotient.lean`: determinant norm in a finite free commutative algebra commutes with reduction modulo an ideal. Its current commit is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The future DVR.2 supplier must reuse it. It is not treated as available in the pinned suggested file.

## Build order

First prove the polynomial filtration and Bass–Tate exactness. Define the simple norm by the negative infinity residue, then prove projection, degree, degree-one and arbitrary-constant simple base-change formulas. These precede Kato.

Next use prime-to-p detection to prove generator independence in normal prime degree. Prove its complete-DVR residue square by a four-case computation followed by finite descent. Import finite-normalization completion to get the constant-extension square, then obtain Kato’s commuting square and compare towers. Only after Kato prove general finite-extension base change with local Artinian lengths.

Finally prove the all-extension complete residue square by finite prime-to-p descent and the componentwise lattice-length contract; pass to general finite-normalization DVRs by completion. Push down from K/F(t) to obtain integral reciprocity, and transport its degree-two/disjoint-support forms to the existing curve interfaces.

## Polynomial filtration and Bass–Tate exactness

### Leading coefficients split K^M_n(F) off K^M_n F(t) (Example III.7.3.2)

Retained target `K2SymbolsBrauer:T.4/leading-coefficient-splitting` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

Let F be a field and, for nonzero f ∈ F(t), let lead(f) be the quotient of the leading coefficients of its numerator and denominator. Let λ: K^M_n F(t) → K^M_n(F) be the specialisation map of T.3/higher-milnor-residues at the place at infinity (order −deg, residue field F) with respect to the uniformiser t^{−1}. Then λ{f_1, …, f_n} = {lead(f_1), …, lead(f_n)}, λ is the identity on the image of K^M_n(F), so K^M_n(F) → K^M_n F(t) is a split injection in every degree, and the residue ∂_∞ vanishes on that image.

**Proof plan.**

Write a nonzero f as u·(t^{−1})^{i} with i = ord_∞(f) = −deg(f) and u a unit at infinity whose residue is lead(f), using the pinned order and uniformiser at infinity and the pinned identification of the residue field at infinity with F.

Apply the value of the specialisation on symbols, λ{u_1π^{i_1}, …, u_nπ^{i_n}} = {ū_1, …, ū_n} (T.3/higher-milnor-residues); no separate check of the Steinberg relation is needed, since λ is already a homomorphism on K^M_n F(t).

A constant c has lead(c) = c, so λ is a left inverse of the natural map.

Constants are units at infinity and the residue of a symbol of units vanishes, so ∂_∞ is zero on the image of K^M_n(F).

**Checks.**

- In degree one λ is the homomorphism f ↦ lead(f) from F(t)^× to F^×.
- In degree two λ is the leading-coefficient map of Example III.6.1.2, which the companion node K2SymbolsBrauer:T.2/rational-function-field plans for K_2; the author's errata list corrects that example's three-case check when lead(f) = 1, a case this route does not need.
- Non-example: over ℚ, with the uniformiser 2t^{−1} instead of t^{−1}, the specialisation sends {t} ∈ K^M_1 to 2 rather than 1, so the formula is tied to t^{−1} (compare the author's erratum to Exercise III.7.1: λ depends on the uniformiser).

**Source.** III.7.3.2, Example 7.3.2 (PDF p. 255; draft p. 247).

### Completion of the polynomial degree reduction

Target `K2SymbolsBrauer:T.4/degree-filtration-generation` (lemma).

For n≥1 and d≥1 let L_d be generated by n-symbols with nonzero polynomial entries of degree at most d. Then L_d/L_(d−1) is generated by symbols with exactly one monic irreducible degree-d entry and all other entries of degree <d. For distinct monic degree-d e₁,e₂, with h=e₁−e₂, {e₁,e₂}={h,e₂}−{h,e₁}+{e₁,−1}; for equal entries {e,e}={e,−1}.

**Inputs.** `K2SymbolsBrauer:T.2/milnor-k-theory`, `K2SymbolsBrauer:T.2/milnor-alternating`, `K2SymbolsBrauer:T.2/symbol-consequences`.

**Proof plan.**

Expand each polynomial into its leading coefficient and monic part by multilinearity. Retain the mixed symbols containing constants: a constant entry reduces the number of degree-d entries but does not itself put the whole symbol in L₀.

For distinct maximal-degree entries apply the Steinberg relation to h/e₁ and e₂/e₁, whose sum is 1. Expansion gives the displayed identity. Every resulting term has at most one of those two degree-d entries.

For a repeated maximal-degree entry use the diagonal identity {e,e}={e,−1}; this branch is necessary over integral coefficients. Induct on the number of degree-d entries, moving entries by graded skew symmetry.

When only one degree-d entry remains, factor it if reducible. Each factor has smaller degree and the whole symbol then belongs to L_(d−1). Otherwise move the irreducible entry to the last slot, recording the sign. This completes the inherited degree-reduction proof.

**Checks.**

- The repeated case is retained over ℝ(t); no exterior-algebra rule is assumed.
- For e₁=t,e₂=t−2 over ℚ, h=2; the identity gives the correct nontrivial residue 2 at t−2 in the uniformizer-last convention.
- For n=1 the assertion is polynomial factorization modulo constants; for d=1 the other entries are constants.

**Source.** Kbook.2013, III.6.1.4, combined PDF p.240/draft p.232; Ex.III.6.2, PDF p.251/draft p.243; III.7.4.2, PDF p.256/draft p.248. The linear case and the degree filtration; the proof above supplies both the repeated-entry branch and the corrected distinct-entry identity.

### The section h_π on the degree filtration (Lemma III.7.4.1)

Retained target `K2SymbolsBrauer:T.4/residue-section` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

Let π ∈ F[t] be monic irreducible of degree d ≥ 1, k_π = F[t]/(π), and L_d as in T.4/degree-reduction. There is a unique homomorphism h_π : K^M_{n−1}(k_π) → L_d/L_{d−1} sending {ā_1, …, ā_{n−1}} to the class of {a_1, …, a_{n−1}, π}, where a_i ∈ F[t] is the unique representative of ā_i of degree < d. The source's h_π puts π first; the two differ by the sign (−1)^{n−1}, the same sign by which Theorem III.7.3's residue ∂^{Wb} differs from the residue ∂ of T.3/higher-milnor-residues, so each is a section of its own residue.

**Proof plan.**

The steps below are written, as in the source, with π in the first slot; moving π to the last slot multiplies every symbol by (−1)^{n−1} and changes none of the arguments.

Representatives of degree < d exist and are unique: reduction modulo the monic π (pinned modByMonic and its degree bound).

Multiplicativity in ā_2: if ā_2 = ā′_2·ā″_2 and a_2 ≠ a′_2a″_2, write a_2 = a′_2a″_2 + fπ with f a nonzero polynomial of degree < d; the Steinberg relation {fπ/a_2, a′_2a″_2/a_2} = 0, multiplied by {a_3, …, a_n}, gives {π, a′_2a″_2/a_2, a_3, …, a_n} ≡ 0 modulo L_{d−1}, because the remaining terms of the expansion have all entries of degree < d. The same argument works in every slot.

Steinberg relation: if ā_i + ā_{i+1} = 1 in k_π then a_i + a_{i+1} − 1 has degree < d and is divisible by π, so a_i + a_{i+1} = 1 in F[t] (the source says 'in F') and the symbol vanishes.

The multilinear map descends through the presentation of K^M_{n−1}(k_π) (T.2/milnor-k-theory); uniqueness holds because the symbols generate.

**API.**

- `milnorResidueSection`: h_p:Kᴹ_(n−1)(k_p)→+L_d/L_(d−1), with the monic irreducible polynomial in the last slot.
- `milnorResidueSection_symbol`: On a symbol use the unique representatives of degree <d and append p.
- `milnorResidueSection_residue`: The p-residue composed with h_p is the identity; a distinct degree-d residue gives zero.
- `milnorResidueSection_unique`: The symbol equation determines h_p since symbols generate.

**Unit tests.** These specify future tests of the construction.

- `section_degree_one`: For n=1, h_p(1)=[{p}] and ∂_p{p}=1∈ℤ.
- `section_linear`: For p=t−b and n=2, h_p(c)=[{c,t−b}], whose last-convention residue is c.
- `section_sign`: Putting p first for n=2 gives c⁻¹ instead, so the slot choice is tested.
- `section_st-content`: Residue representatives of degree <d whose classes add to1 have polynomial sum1; the resulting Steinberg symbol vanishes.

**Uses.**

- `K2SymbolsBrauer:T.4/bass-tate-filtration-assembly`: These sections lift the highest-degree finite residues in descending filtration induction.

**Checks.**

- For n=1 the empty source symbol is1∈ℤ and h_p(1)=[{p}].
- For p=t−b and n=2 the section sends c to[{c,t−b}]; its p-residue is c. Moving p first would invert it.
- At p=X²+1 over ℚ, the representatives of i and −i multiply to1 modulo p. The multiplicativity argument uses the polynomial correction term rather than multiplying representatives as if they were constants.

**Source.** III.7.4.1, Lemma 7.4.1 and the paragraph before it (PDF p. 255; draft p. 247); III.7.4.1, proof of Lemma 7.4.1 (PDF p. 255; draft p. 247).

### The graded pieces of the degree filtration (Lemma III.7.4.2)

Retained target `K2SymbolsBrauer:T.4/filtration-quotients` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

For d ≥ 1 the maps h_π of T.4/residue-section, over the monic irreducible π of degree d, induce an isomorphism ⊕_{deg π = d} K^M_{n−1}(k_π) ≅ L_d/L_{d−1} whose inverse is induced by the residues ∂_π: each ∂_π with deg π = d vanishes on L_{d−1}, ∂_π ∘ h_π is the identity, and ∂_{π′} ∘ h_π = 0 for π′ ≠ π of degree d. Residues are those of T.3/higher-milnor-residues, ∂_π{u_1, …, u_{n−1}, π} = {ū_1, …, ū_{n−1}}, which in degree two is the roadmap's tame symbol; with Theorem III.7.3's ∂^{Wb} and the source's h_π (π first) the statement is the same.

**Proof plan.**

π divides no nonzero polynomial of degree < d, so every entry of a generator of L_{d−1} is a unit at π and ∂_π vanishes on L_{d−1}.

On h_π{ā_1, …} = [{a_1, …, π}]: ∂_π gives {ā_1, …} by the formula of T.3/higher-milnor-residues, and for π′ ≠ π of degree d every entry is a unit at π′.

So ⊕∂̄_π ∘ ⊕h_π is the identity, and ⊕h_π is onto by T.4/degree-reduction (ii).

**Checks.**

- For d = 1 and F algebraically closed, L_1/L_0 ≅ ⊕_{b ∈ F} K^M_{n−1}(F), which in degree two is Example III.6.1.7.
- In degree one (n = 1) it says that the monic irreducible polynomials of degree d form a basis of the free abelian group L_d/L_{d−1}.
- ∂_π vanishes on L_{d−1} but not on L_d, which is what drives the induction on d.

**Source.** III.7.4.2, Lemma 7.4.2 (PDF p. 255; draft p. 247); III.7.4.2, proof of Lemma 7.4.2 (PDF p. 256; draft p. 248).

### Bass–Tate exactness with the corrected filtration proof

Target `K2SymbolsBrauer:T.4/bass-tate-filtration-assembly` (theorem).

For every field F and n≥1, 0→Kᴹ_n(F)→Kᴹ_n(F(t))→⊕_(p monic irreducible)Kᴹ_(n−1)(F[t]/p)→0 is split exact. The last map uses uniformizer-last residues; its kernel is the constant image and leading-coefficient specialization retracts that image. Infinity is excluded from this direct sum.

**Inputs.** `K2SymbolsBrauer:T.4/degree-filtration-generation`, `K2SymbolsBrauer:T.4/residue-section`, `K2SymbolsBrauer:T.4/filtration-quotients`, `K2SymbolsBrauer:T.4/leading-coefficient-splitting`, `K2SymbolsBrauer:T.3/finite-support`.

**Proof plan.**

Reuse the existing residue-section h_p and filtration-quotient targets; their statements and representative proof are given in the reader. The preceding completed generation lemma supplies the surjectivity step of each quotient.

Every rational-function symbol expands into polynomial symbols by numerator/denominator factorization. Hence the union of L_d is all of Kᴹ_n(F(t)). L₀ is the constant image and injects by specialization at infinity.

Given finitely supported residues choose their maximal polynomial degree and lift their top-degree components by h_p. Repeating at lower degrees constructs a preimage. For a class with all finite residues zero the same descending induction puts it in L₀.

Changing from uniformizer-first to uniformizer-last multiplies both the degree-n residues and their sections by (−1)^(n−1); exactness and the transfer defined from this sequence are unchanged.

**Checks.**

- For n=1 this is the divisor factorization F(t)ˣ/Fˣ≃⊕_pℤ.
- For a constant c and g=t, the finite tame residue is c and the omitted infinity residue is c⁻¹.
- h_p uses the unique nonzero polynomial representatives of degree <deg p; the Steinberg check is an equality in F[t], not an assertion that those representatives are constants.

**Source.** Kbook.2013, III.7.3.2–7.4.2, PDF pp.255–256/draft pp.247–248. Milnor exactness and its two filtration lemmas, assembled using the corrected reduction.

## Simple norms and the pre-Kato identities

### The Milnor transfer of a simple extension (Definition III.7.5)

Retained target `K2SymbolsBrauer:T.4/simple-transfer` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

Let E = F(a) be a finite extension, π the minimal polynomial of a, and E ≅ F[t]/(π) by t ↦ a. Since ∂_∞ vanishes on K^M_{n+1}(F) and the residue sum is surjective with kernel K^M_{n+1}(F) (T.4/bass-tate-sequence), there are unique homomorphisms N_p : K^M_n(F[t]/p) → K^M_n(F), p over the monic irreducible polynomials, with −∂_∞ = Σ_p N_p ∘ ∂_p on K^M_{n+1}F(t). The transfer N_{a/F} : K^M_n(E) → K^M_n(F) is N_π transported to E; equivalently N_{a/F}(x) = −∂_∞(y) for any y with ∂_π(y) = x and ∂_p(y) = 0 for p ≠ π. In degree zero it is multiplication by [E : F]. The projection formula and the degree formula N_{a/F} ∘ res = [E : F] are T.4/milnor-projection-formula and T.4/restriction-transfer-degree. Between the roadmap's normalisation of the residues and Theorem III.7.3's, every residue on K^M_{n+1}F(t) changes by the same sign (−1)^n, so N_{a/F} is the same in both. Independence of the generator a is Kato's theorem (T.4/milnor-transfer-transitivity), not part of this definition.

**Proof plan.**

Existence and uniqueness of the N_p: −∂_∞ factors uniquely through the residue sum by exactness of T.4/bass-tate-sequence in degree n + 1 and the vanishing of ∂_∞ on K^M_{n+1}(F) (T.4/leading-coefficient-splitting).

Transport N_π to E along the pinned equivalence AdjoinRoot (minpoly F a) ≃ₐ[F] F⟮a⟯, the residue field of the place of π being F[t]/(π).

Computation formula: a y with ∂_π(y) = x and all other finite residues zero exists by surjectivity of the residue sum.

Degree zero: for x = 1 take y = π; then ∂_π(π) = 1, ∂_p(π) = 0 for p ≠ π and ∂_∞(π) = −deg π, so N_{a/F}(1) = [E : F].

**API.**

- `milnorTransferSimple`: For a integral over F: N_{a/F} : K^M_n(F⟮a⟯) →+ K^M_n(F), defined through the residue at infinity.
- `milnorTransferSimple_eq_neg_residueInfty`: If ∂_π(y) = x and ∂_p(y) = 0 for every monic irreducible p ≠ π, then N_{a/F}(x) = −∂_∞(y).
- `residueInfty_eq_neg_sum_transfer`: For y ∈ K^M_{n+1}F(t), −∂_∞(y) = Σ_p N_p(∂_p y), a finite sum (Weil's formula III.7.5.1).
- `milnorTransferSimple_degree_zero`: In degree zero N_{a/F}(m) = [F⟮a⟯ : F]·m.
- `milnorTransferSimple_of_mem`: If a ∈ F then N_{a/F} is the identity of K^M_n(F).
- `milnorTransferSimple_mul_restrict`: Projection formula: N_{a/F}(res(x)·y) = x·N_{a/F}(y) for x ∈ K^M_*(F) and y ∈ K^M_*(F⟮a⟯). (T.4/milnor-projection-formula)
- `milnorTransferSimple_restrict`: N_{a/F}(res x) = [F⟮a⟯ : F]·x for x ∈ K^M_n(F). (T.4/restriction-transfer-degree)
- `milnorTransferSimple_one_eq_norm`: In degree one N_{a/F} is Algebra.norm F on F⟮a⟯ˣ (proved in T.4/transfer-low-degrees).
- `milnorTransferSimple_kbook`: N_{a/F} is the same whether the residues are normalised as in the roadmap or as in Theorem III.7.3.

**Unit tests.** These specify future tests of the construction.

- `milnorTransferSimple_degree_zero_eq`: For [F⟮a⟯ : F] = d, N_{a/F}(1) = d in K^M_0(F) = ℤ, from y = π: ∂_π(π) = 1, the other finite residues vanish, and ∂_∞(π) = −d.
- `milnorTransferSimple_of_mem_eq_id`: If a ∈ F (π = t − a) then N_{a/F} = id: for x ∈ K^M_n(F), y = {x, t − a} has ∂_{t−a}(y) = x, no other finite residue, and ∂_∞(y) = −x.
- `milnorTransferSimple_one_eq_algebraNorm`: In degree one N_{a/F} = Algebra.norm F on F⟮a⟯ˣ; for ℚ(i)/ℚ, N(1 + i) = 2.
- `milnorTransferSimple_sign`: The sign is forced: the maps defined by +∂_∞ = Σ N_p ∂_p would give N_{a/F}(1) = −[F⟮a⟯ : F] in degree zero.
- `milnorTransferSimple_projection_linear`: For c ∈ F^× and d ∈ F, N_{a/F}{c, a − d} = {c, N(a − d)}, from the projection formula and the degree-one case (the formula of Corollary III.6.1.5 for a quadratic extension).

**Uses.**

- `T.4/milnor-transfer-transitivity`: the transfer of any finite extension is the composite of these along a chain of generators, and Kato's theorem makes it independent of the chain
- `T.4/milnor-projection-formula and T.4/restriction-transfer-degree`: the projection formula and the degree formula are proved for N_{a/F}
- `T.4/projective-line-reciprocity`: the defining identity −∂_∞ = Σ N_p ∂_p is Weil's formula for the projective line
- `T.3/transfer-and-norm-residue`: the norm-residue, projection and degree formulas for the general transfer start from the simple case
- `HigherLocalFieldsAndHigherClassFieldTheory HL.1`: Milnor norms of extensions of higher local fields are these transfers
- `MotivicEtaleKTheory M.4`: the norms N_{k(x)/F} in the inverse of the diagonal cycle map CH^n(F, n) → K^M_n(F) are Kato's norms built from these transfers

**Checks.**

- In degree zero it is multiplication by [E : F].
- If a ∈ F it is the identity.
- In degree one it is the field norm (T.4/transfer-low-degrees).

**Source.** III.7.5, paragraph before Definition 7.5 (PDF p. 256; draft p. 248); III.7.5, Definition 7.5 (PDF p. 256; draft p. 248); III.7.5, after Definition 7.5 (PDF p. 256; draft p. 248); III.7.5.2, Projection Formula 7.5.2 (PDF p. 256; draft p. 248); III.7.5.3, Corollary 7.5.3 (PDF p. 256; draft p. 248).

The API’s degree-one numerical test is N_(ℚ(i)/ℚ)(1+i)=2: in the basis 1,i, multiplication by1+i has matrix [[1,−1],[1,1]], with determinant2. In degree zero the same extension sends1 to2. For a linear defining polynomial the residue field is F itself and the simple norm is the identity. In characteristic p, a single radical extension sends a base unit c to c^p in degree one. These checks distinguish the transfer from restriction, from an embedding-only norm and from a degree-free identity map.

### The projection formula for the transfer

Retained target `K2SymbolsBrauer:T.4/milnor-projection-formula` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

For E = F(a), x ∈ K^M_*(F) and y ∈ K^M_*(E): N_{a/F}(res_{E/F}(x)·y) = x·N_{a/F}(y). By Definition III.7.6 and Kato's theorem the same holds for N_{E/F} for every finite E/F.

**Proof plan.**

For a constant Milnor class x and any finite place or infinity, the last-slot product law gives ∂_q(res(x)·z)=res(x)·∂_q(z): the entries of x have order zero.

Choose an isolated finite-residue lift z of y at p, whose residue at every other finite q is zero. The product res(x)·z is an isolated lift of res(x)·y. Its negative infinity residue is x·N(y), proving projection. Infinity is not included among the vanishing residues.

**Checks.**

- y = 1 ∈ K^M_0(E) gives N_{a/F}(res x) = [E : F]·x (T.4/restriction-transfer-degree).
- Degree one with y = 1: N_{E/F}(x) = x^{[E:F]} for x ∈ F^×, the field-norm identity.
- The formula holds in both normalisations of the residue.

**Source.** Projection Formula III.7.5.2 (PDF p. 256); Projection Formula III.7.5.2, proof (PDF p. 256).

### Restriction followed by transfer is multiplication by the degree

Retained target `K2SymbolsBrauer:T.4/restriction-transfer-degree` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

For E = F(a) of degree d, N_{a/F} ∘ res_{E/F} = d·id on K^M_*(F); hence the kernel of res_{E/F} : K^M_*(F) → K^M_*(E) is killed by d. By composition along a generating tower the same holds for N_{E/F} and every finite E/F, degrees multiplying.

**Proof plan.**

Apply T.4/milnor-projection-formula with y = 1 ∈ K^M_0(E): N(res x) = x·N(1).

N(1) = d by the degree-zero case of T.4/simple-transfer.

**Checks.**

- Degree one: N_{E/F}(x) = x^d for x ∈ F^×.
- Degree zero: the composite ℤ → ℤ → ℤ is multiplication by d.

**Source.** Corollary III.7.5.3 (PDF p. 256).

### The simple transfer in degree one is the field norm (Exercise III.7.5)

Retained target `K2SymbolsBrauer:T.4/transfer-low-degrees` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

For a finite extension E = F(a), the transfer N_{a/F} : K^M_1(E) = E^× → K^M_1(F) = F^× of T.4/simple-transfer is the field norm Algebra.norm F. (The degree-zero case, multiplication by [E : F], is part of T.4/simple-transfer.)

**Proof plan.**

Induct on d=deg π, the degree-one case being the identity. For b∈Eˣ choose the unique polynomial g of degree e<d with g(a)=b.

Use y={g,π} in the uniformizer-last convention. Its p=π residue is b. At a monic irreducible factor q of g its residue is (π mod q)^(−ord_q g). At infinity its residue is (−1)^(de)lead(g)^(−d), since π is monic.

The defining projective-line identity gives N_(a/F)(b)=(−1)^(de)lead(g)^d ∏_q N_q(π mod q)^(ord_q g). The other finite places have zero residue. Every factor q has degree <d, so induction identifies its transfer with the field norm.

The determinant norm of g(a) equals the product of g over the roots of π, with root multiplicities and the relative field degree retained. This is Res(π,g). The resultant formula gives (−1)^(de)lead(g)^d times the product of π over all roots of g with multiplicity. Group by irreducible q to obtain the same expression, also for inseparable π or g.

**Checks.**

- For ℚ(i)/ℚ, N(1 + i) = 2.
- For ℚ(∛2)/ℚ and b = ∛2 (g = t, d = 3, e = 1), the factor at q = t is π(0) = −2 and the sign (−1)^{de} = −1 gives the norm 2; without the sign the answer would be wrong.
- For a constant c ∈ F^×, N_{a/F}(c) = c^{[E:F]}, which is also the projection formula applied to c and 1.

**Source.** III, Exercise 7.5 (PDF p. 265; draft p. 257); III.7.5, after Definition 7.5 (PDF p. 256; draft p. 248).

### Base change of the simple transfer (Exercise III.7.7)

Retained target `K2SymbolsBrauer:T.4/transfer-base-change` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

Let E = F(a) be finite with minimal polynomial π, F′/F any field extension, π = ∏_i π_i^{e_i} in F′[t] with distinct monic irreducible π_i, and E_i = F′(a_i) with a_i a root of π_i. Then res_{F′/F} ∘ N_{a/F} = Σ_i e_i · N_{a_i/F′} ∘ res_i on K^M_n(E), where res_i is induced by the F-embedding E → E_i sending a to a_i.

**Proof plan.**

Choose y ∈ K^M_{n+1}F(t) with ∂_π(y) = x and no other finite residue (T.4/bass-tate-sequence).

Along the constant-extension embedding F(t) → F′(t), a finite place w with nontrivial restriction to F(t) lies over a finite π′ with positive index e_w; by the embedding-general higher ramification formula (T.3/higher-ramification-formula), its residue is e_w times the image of ∂_{π′}(y). Hence at each factor π_i of π it is e_i·res_i(x), and at other such finite places it is zero. A finite place w restricting trivially to F(t) makes every imported nonzero entry a unit, so ∂_w(y′) = 0 by milnorResidue_symbol_units and generation; no e = 0 residue-field map is used. Infinity has index 1 with residue embedding F → F′, so ∂_∞(y′) = res ∂_∞(y). This includes transcendental constant extensions and completions.

Apply the computation formula of T.4/simple-transfer over F′ to y′.

**Checks.**

- In degree zero it is deg π = Σ_i e_i·deg π_i.
- If π stays irreducible over F′, it says res ∘ N_{a/F} = N_{a/F′} ∘ res.
- For F′ = E and E/F normal it expresses res_{E/F} ∘ N_{a/F} as a sum over the conjugates of a, which is what Lemma III.7.6.2 uses.
- For F′ = F(u) transcendental and π = t²−2 over F = ℚ, π remains irreducible and the residue/transfer comparison is available without finite-dimensionality of F′(t)/F(t). The extra place t−u has trivial restriction and zero residue on imported classes.
- For F′ = F̂_v, use the e = 1 residue comparison for completion; F̂_v/F need not be finite. This preserves the completion input required by Exercise III.7.9 and sourceIssue E10.

**Source.** III, Exercise 7.7 (PDF p. 265; draft p. 257).

The simple base-change formula must allow arbitrary F′/F. A finite place of F′(t) whose restriction to F(t) is trivial contributes zero because every imported entry is a valuation unit. At other finite places the polynomial factor exponent is the positive ramification index. Infinity has index1. This is why the same proof covers transcendental constant extensions and later completion; no residue map for an index-zero restriction is introduced.

For any valued field embedding with positive normalized ramification index e, retain `K2SymbolsBrauer:T.3/higher-ramification-formula`:

∂_w res_(E/F)=e res_(κ(w)/κ(v)) ∂_v.

It needs no finiteness hypothesis on E/F. Expand entries into a uniformizer and units; repeated uniformizer factors reduce with {π,π}={π,−1}. The last-slot residue gives the displayed formula. The complete norm–residue formula has no corresponding extra factor e; its degree-one coefficient is instead the residue degree.

## Kato’s prime-degree ingredients

### Prime-to-p detection on Milnor groups

Target `K2SymbolsBrauer:T.4/prime-to-p-detection` (lemma).

Fix a prime p. Import from GF.0/maximal-p-extension a maximal algebraic extension F^(p)/F whose finite subextensions have degree prime to p (use the prime set consisting of all primes other than p). Every finite extension of F^(p) has p-power degree. Each element in ker(Kᴹ_n(F)→Kᴹ_n(F^(p))) is killed by an integer prime to p. In particular restriction is injective on p-primary torsion.

**Inputs.** `LocalFieldsRamificationPartII:GF.0/maximal-p-extension`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `K2SymbolsBrauer:T.2/milnor-k-theory`.

**Proof plan.**

The field-existence construction belongs to the existing arbitrary-rank Part II GF.0, not to K₂. Its maximal-P-extension and P-closed interface is imported. In a finite normal closure of a separable extension, the Sylow-p fixed field has prime-to-p degree, hence is the base. The Galois group is a p-group. A purely inseparable degree is a characteristic power; maximality forces it to be a p-power too.

The presentation of Milnor K-theory commutes with directed unions of fields: an element and a proof of zero use only finitely many unit entries and finitely many Steinberg relations. Descend those entries and relations to a finite F′⊂F^(p).

Compose the simple transfers along any generating tower of F′/F. No tower independence is needed: projection and degree formulas show this composite followed by restriction is [F′:F]. It annihilates the kernel element and is prime to p.

**Checks.**

- An element killed by p^a and by a prime-to-p integer is zero by Bézout.
- No normalized discrete valuation or completeness is asserted for the infinite field F^(p).
- The only imported GF stage is the foundational field-theory node GF.0; none of its later valued-field or analytic targets is needed.

**Source.** Kbook.2013, III.7.6.1–7.6.2, PDF p.257/draft p.249. Prime-to-p detection used by Kato; field existence is imported from its existing owner.

### Splitting-field comparison of arbitrary transfer towers

Target `K2SymbolsBrauer:T.4/tower-splitting-formula` (lemma).

Let E/F be finite, M/F a finite normal extension containing a normal hull of E, and N_τ any composite of simple Bass–Tate transfers along a generating tower τ of E/F. Then res_(M/F) N_τ=[E:F]_insep Σ_(σ:E↪_F M) σ_* on Kᴹ_n(E). Thus two towers differ by a map whose every value is killed by [M:F].

**Inputs.** `K2SymbolsBrauer:T.4/transfer-base-change`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `K2SymbolsBrauer:T.4/simple-transfer`.

**Proof plan.**

For a simple step apply the existing simple-extension base-change lemma over M. The minimal polynomial splits into linear factors, each with its inseparable multiplicity, and the simple norm of a degree-one extension is the identity.

Induct along the tower. Every embedding of an intermediate field into M extends to all the required roots because M is normal and contains the normal hull. The product of the inseparable multiplicities is [E:F]_insep, so the resulting sum is independent of τ.

If δ is the difference between two composites, its restriction to M is zero. Choose any tower of M/F and apply its composite transfer to this zero; the degree formula gives [M:F]δ=0.

Using M instead of E avoids assuming that a nonnormal extension E already splits every tower. The stronger claim that [E:F] kills the difference is unnecessary here.

**Checks.**

- For a separable nonnormal cubic E/ℚ use its normal closure, not E as a splitting field.
- For a purely inseparable extension of degree p^a the sum has one embedding with multiplicity p^a.
- No general transfer base-change theorem or Kato transitivity is used in this pre-Kato argument.

**Source.** Suslin.1980, §1, Corollary 1.10, printed p.594/PDF p.6. Integral splitting formula before the paper switches to torsion quotients; induction from simple base change.

### Generation by symbols with one entry outside the base (Exercise III.7.6)

Retained target `K2SymbolsBrauer:T.4/p-closed-generation` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

If every finite extension of F has p-power degree and E/F has degree p, then for n ≥ 1 the group K^M_n(E) is generated by the symbols {y, x_2, …, x_n} with y ∈ E^× and x_2, …, x_n ∈ F^×.

**Proof plan.**

Write E=F(u), with every element represented by a polynomial in u of degree <p. Each irreducible factor of such a polynomial has degree <p; since every finite extension of F has p-power degree, it has degree1. Hence entries factor into constants and linear polynomials in u.

Apply the linear Bass–Tate identity to any pair of nonconstant linear factors. If they are proportional, first remove the scalar and use the repeated-entry identity; otherwise apply the distinct linear identity. Each resulting symbol has fewer nonbase entries. Iterate, retaining signs, until only one entry lies outside Fˣ.

**Checks.**

- For F = ℝ and E = ℂ (p = 2), K^M_2(ℂ) is generated by the {r, z} with r ∈ ℝ^× and z ∈ ℂ^×, as in Example III.6.1.6.
- In degree one the statement is trivial.
- The hypothesis on F is used in the first step: over ℚ, with E = ℚ(∛2), the element 1 + ∛2 + ∛4 is a quadratic polynomial in ∛2 that does not split over ℚ, so the argument does not apply.

**Source.** III, Exercise 7.6 (PDF p. 265; draft p. 257); III.6.1.4, Lemma 6.1.4 and its proof (PDF p. 240; draft p. 232).

### Independence of the generator for a normal extension of prime degree (Lemma III.7.6.2)

Retained target `K2SymbolsBrauer:T.4/kato-prime-degree` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

If E/F is normal of prime degree p and E = F(a) = F(b), then N_{a/F} = N_{b/F} : K^M_*(E) → K^M_*(F).

**Proof plan.**

δ = N_{a/F} − N_{b/F} is annihilated by p: by T.4/transfer-base-change with F′ = E, res_{E/F} ∘ N_{a/F} and res_{E/F} ∘ N_{b/F} are the same sum over the F-automorphisms (with the inseparable multiplicity), so res_{E/F}∘δ = 0, and N_{a/F} ∘ res_{E/F} is multiplication by p (T.4/restriction-transfer-degree).

If δ(x) ≠ 0 it stays nonzero in K^M_n(F′) for the prime-to-p closure F′ of F (T.4/prime-to-p-closure), and δ is compatible with the base change to F′ (T.4/transfer-base-change; EF′/F′ is again of degree p).

Over F′, K^M_n(EF′) is generated by symbols {y, x_2, …, x_n} with x_i ∈ F′^× (T.4/p-closed-generation), and the projection formula (T.4/milnor-projection-formula) gives N{y, x_2, …} = {N(y), x_2, …} with N(y) the field norm (T.4/transfer-low-degrees), which does not depend on the generator; so δ vanishes over F′, a contradiction.

**Checks.**

- In degree one it is the independence of the field norm from the generator.
- In degree zero both transfers are multiplication by p.
- It is the base case of Kato's induction over maximal towers.

**Source.** III.7.6.2, Lemma 7.6.2 (PDF p. 257; draft p. 249); III.7.6.2, proof of Lemma 7.6.2 (PDF p. 257; draft p. 249).

### The four residue cases on a symbol with base-field entries

Retained target `K2SymbolsBrauer:T.4/prime-degree-residue-on-generated-symbols` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

For complete discretely valued F, normal E/F of prime degree p and α={a′,a₂,…,a_n} with a′∈E× and a_i∈F× for i≥2, one has ∂_F N_E/F α=N_l/k ∂_E α. The residue fields may be inseparable.

**Proof plan.**

For n=1 use ord_F N(y)=f ord_E(y). For n>1 use multilinearity, skew commutativity and {π,π}={π,−1} to make a₃,…,a_n units, and reduce a′ and a₂ separately to a unit or a uniformizer. Projection gives Nα={N(a′),a₂,…,a_n}. Compute first in the uniformizer-FIRST convention of K-book III.7.6.3; multiply both outputs by (−1)^(n−1) to recover this packet’s convention.

Both units: both residues are zero, since the norm of a unit is a unit. First uniformizer and a₂ unit: ord_F N(π′)=f and restriction fixes the base-unit residues, so both outputs are f{ā₂,…,ā_n}.

First unit and a₂=π: write π=u′(π′)^e. The upper residue is −e{ā′,ā₃,…}, its residue norm is −e{N_l/k(ā′),ā₃,…}; the lower residue is −{res N(a′),ā₃,…}. The determinant filtration identity res N(a′)=N_l/k(ā′)^e identifies them.

Both uniformizers: π=u′(π′)^e and N(π′)=uπ^f. The upper residue followed by norm is {(−1)^(ef)N_l/k(ū′),ā₃,…}; the lower is {(−1)^f ū⁻¹,ā₃,…}. Since ef=p, either e=1,f=p, where choose π′=π and u′=u=1, or e=p,f=1. In the latter choose π as the constant term of the Eisenstein minimal polynomial of π′, so u=(−1)^p and ū′=−1. The two expressions agree in both cases.

**Checks.**

- The both-uniformizers case retains the sign and unit correction, and uses ef=p.
- At n=2, negate the first-slot residue on both sides to obtain the roadmap tame-symbol identity.
- For n=1 the identity is ord_F N(y)=f ord_E(y); it uses the degree-zero residue norm.

**Source.** Derived four-case computation from K-book III.7.6.3, PDF p.257/draft p.249, using the explicitly requested DVR.2 determinant norm identities. No restricted-book proof is claimed to have been inspected.

The four-case calculation uses the arbitrary-residue DVR supplier’s norm identities, rather than any finite-residue local-field hypothesis. In the totally ramified case, the base uniformizer may be chosen to be the constant coefficient of the Eisenstein minimal polynomial of π′. Reducing that polynomial after dividing by π′^p gives res(π/π′^p)=−1, while N(π′)=(−1)^pπ. This is the sign check in the final two-uniformizer case. In the e=1 case choose π′=π; then N(π′)=π^p.

### Finite descent in the prime-degree complete residue square

Target `K2SymbolsBrauer:T.4/prime-degree-residue-descent` (lemma).

Let F be complete for a normalized discrete valuation, E/F normal of prime degree p, with residue extension l/k. The simple norm is generator-independent by the inherited kato-prime-degree lemma. For α∈Kᴹ_n(E), n≥1, δ=∂_F Nα−N_(l/k)∂_Eα is zero. This completes the inherited kato-complete-residue proof using finite complete extensions only.

**Inputs.** `K2SymbolsBrauer:T.4/kato-prime-degree`, `K2SymbolsBrauer:T.4/prime-degree-residue-on-generated-symbols`, `K2SymbolsBrauer:T.4/prime-to-p-detection`, `K2SymbolsBrauer:T.4/transfer-base-change`, `K2SymbolsBrauer:T.3/higher-ramification-formula`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`.

**Proof plan.**

Use routed arbitrary-residue complete-DVR contracts DVR.0–DVR.2: unique normalized extension, finite free integral closure and ef=p, normality of l/k and surjectivity of the residue Galois action, and determinant norm valuation/residue identities. They are specified in the support brief and remain an explicit supplier gap.

First prove pδ=0. If e=p,f=1 then l=k. Ramification and self-base-change yield p∂_F Nα=p∂_Eα: every automorphism acts trivially on the residue field, and the purely inseparable self-tensor has length p. If e=1,f=p, the same equations give res_(l/k)δ=0, since the residue action is exactly the normal-residue sum (with inseparable multiplicity). Apply the degree formula for l/k to obtain pδ=0.

Over F^(p), express the restricted α as a finite sum of symbols with all but one entry in the base using the inherited p-closed-generation lemma. Descend the finitely many entries and relations to a finite F′/F of degree d prime to p. E′=EF′ is still normal of degree p over F′; all these finite fields are complete DVR fields.

Apply the inherited generated-symbol computation termwise over F′. Its four cases use ord_F N(y)=f ord_E(y) and residue N(unit)=N_(l/k)(residue unit)^e; the totally ramified case chooses the constant coefficient of the Eisenstein minimal polynomial as base uniformizer. Both sides convert from first to last convention by (−1)^(n−1).

Write r=e(F′/F), s=e(E′/E), e=e(E/F), e₁=e(E′/F′). Then e₁r=se. Both e and e₁ are 1 or p; r and s divide d. Since p∤d, e₁=e and s=r. The tensor l⊗_k k′ is a single field of length1: [l:k] is 1 or p and [k′:k] divides d. This field equals l′, since both have degree f=p/e over k′. Thus the simple residue base-change formula has a single factor, and the two ramification/base-change squares give r res_(k′/k)δ=0.

Apply the residue transfer to this equality: dδ=r[k′:k]δ=0. Bézout with pδ=0 gives δ=0. No ramification index is canceled in a Milnor group.

**Checks.**

- The residue field may be infinite, imperfect, or inseparable over the base residue field.
- The argument keeps the inseparable self-tensor multiplicity p.
- Every valuation used after descent is on a finite extension; the infinite detector is used only for finite algebraic data.

**Source.** Kbook.2013, III.7.6.2–7.6.3, PDF p.257/draft p.249; Ex.III.7.6–7.8, PDF p.265/draft p.257. Kato prime-degree square and its generation/base-change ingredients; the displayed annihilator and index calculations fill out the abbreviated descent.

### Completion of the normal constant-extension residue identity

Target `K2SymbolsBrauer:T.4/constant-extension-completion` (comparison).

For E/F normal of prime degree p and any place v of F(t)/F, ∂_v N_(E(t)/F(t))=Σ_(w|v)N_(κ(w)/κ(v))∂_w. This is the inherited constant-extension-residue target with its finite-normalization and completion supply made explicit before Kato transitivity.

**Inputs.** `K2SymbolsBrauer:T.4/prime-degree-residue-descent`, `K2SymbolsBrauer:T.4/transfer-base-change`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`, `K2SymbolsBrauer:T.3/higher-ramification-formula`.

**Proof plan.**

Import AlgebraicCurves Layer2 finite normalization on both charts F[t] and F[t⁻¹], for arbitrary finite E(t)/F(t), and its finite-module completion contract. With R the DVR at v and S its finite normalization, completing S splits as the product of completed local S_w. Inverting a base uniformizer gives E(t)⊗_(F(t)) F(t)^∧_v≃∏_w E(t)^∧_w.

This tensor product is a product of fields under the finite-normalization contract, including the purely inseparable constant-extension case. Each multiplicity is 1. The residue fields are unchanged by these completions, and their ramification index over the original valued field is 1.

Apply simple base change for E(t)/F(t). Each complete field factor is normal of degree 1 or p over F(t)^∧_v. Apply the preceding prime-degree square and sum. The completion contract is an imported normalization result, not an unproved correspondence left inside Kato’s argument.

**Checks.**

- Infinity uses the t⁻¹ chart and is included.
- At a split place the sum has p degree-one terms; at a nonsplit place it has one degree-p term.
- This proof does not cite the general norm–residue theorem that will follow Kato transitivity.

**Source.** Kbook.2013, Ex.III.7.9, PDF p.266/draft p.258; III.7.6.4, PDF p.258/draft p.250. The normal constant-extension identity used in the commuting square; completion proof given here using the requested normalization contract. Stacks.20261019, Lemma 10.153.4 (04GH; Commutative Algebra PDF p. 414); Remark 15.116.1 (09EM; More on Algebra PDF pp. 342–343). Henselian finite-algebra splitting and normalization/base-change background; finite-module completion is requested from AlgebraicCurves.

### The commuting square before tower independence

Retain `K2SymbolsBrauer:T.4/kato-commuting-square`. If E/F is normal of prime degree, F′=F(a) and E′=E(a), the required equality is

N_(E/F) N_(a/E) = N_(a/F) N_(E′/F′).

Choose a Bass–Tate lift y over E(t) of x∈Kᴹ_n(E′), supported at the minimal polynomial of a over E. Apply the preceding constant-extension residue identity at every place of F(t). The only finite residue of N_(E(t)/F(t))y is N_(E′/F′)x at the minimal polynomial of a over F, and its infinity residue is N_(E/F)∂∞y. Two applications of the defining simple-norm formula give the square. If E⊂F′ the right vertical norm has degree1; the same argument applies. The isolated-lift calculation uses N_(a/E) in its last term, which is the only map with the appropriate domain.

**Checks.** The normal-prime-degree residue theorem used here is already proved before this square. The general norm–residue theorem and general transfer base change are not premises. The source is K-book III.7.6.4, combined PDF p.258/draft p.250, with the inherited E8 correction to its last simple-norm subscript.

### Completion of Kato’s generator-independence proof

Target `K2SymbolsBrauer:T.4/kato-tower-comparison` (theorem).

For every finite E/F, every degree n≥0 and every generating tower τ, the composite N_τ is independent of τ and of the simple generators. It defines N_(E/F):Kᴹ_n(E)→Kᴹ_n(F), is transitive in every finite intermediate tower, satisfies the projection and degree formulas, is field norm in degree one, and is multiplication by [E:F] in degree zero. This supplies the inherited milnor-transfer-transitivity target.

**Inputs.** `K2SymbolsBrauer:T.4/tower-splitting-formula`, `K2SymbolsBrauer:T.4/prime-to-p-detection`, `K2SymbolsBrauer:T.4/kato-prime-degree`, `K2SymbolsBrauer:T.4/constant-extension-completion`, `K2SymbolsBrauer:T.4/simple-transfer`, `K2SymbolsBrauer:T.4/transfer-low-degrees`, `mathlib:Algebra.norm_norm`.

**Proof plan.**

First establish the inherited kato-commuting-square by its isolated-residue lift in E(t): use constant-extension-completion on finite places and infinity, then the defining −∂∞ formula twice. The last simple norm is N_(a/E), not N_(a/F). This uses only normal prime-degree norms and simple norms.

Fix two towers and x. Their difference δ(x) is torsion by tower-splitting-formula over a finite normal hull. For each prime p dividing its annihilator, restriction to F^(p) detects the p-primary part. Expand each tower after this base change using repeated simple base change; this gives sums of tower norms in the Artinian residue fields with their lengths, without needing the general theorem yet.

Over F^(p), finite normal hulls have p-power degree. A finite p-group has a subnormal chain with index-p steps; separating purely inseparable radical steps gives a maximal tower of normal prime-degree extensions for each finite field involved. Prime-degree norms are already generator-independent.

Compare two maximal towers by induction on the total degree. If their first degree-p fields A and B differ, use their compositum AB⊂E. Its degree over F is p², and the commuting square interchanges the A/F and B/F steps. Induction compares the towers above AB and the towers inside E/A and E/B. Do not identify E with AB unless the total degree is p².

A simple step F⊂F(a) can be refined by a maximal tower: apply the commuting square to its first normal degree-p subfield and the generator a, then induct. Hence every simple-step composite agrees with the maximal-tower value over the detector field.

The two base-changed tower sums consequently agree, so res δ(x)=0. Prime-to-p detection kills its p-primary part for each prime divisor of the finite annihilator. Thus δ(x)=0 integrally. Concatenation of towers proves transitivity; projection and degree pass along the tower. Degree one follows from Algebra.norm_norm.

**Checks.**

- A nonnormal cubic uses a normal hull in the annihilator argument.
- A degree p³ extension with distinct first degree-p subfields is compared through AB and the remaining degree-p extension above it.
- Purely inseparable towers and all integral torsion are retained; no rationalization occurs.

**Source.** Kbook.2013, III.7.6.1–7.6.4, PDF pp.257–258/draft pp.249–250. Kato’s theorem and commuting-square proof, with the normal-hull and compositum inductions specified. Suslin.1980, Corollary 1.10, p.594/PDF p.6. The pre-Kato integral splitting formula supplies the finite annihilator, rather than incorrectly using a nonnormal E as its own splitting field.

The general norm is the same construction as the imported simple transfer, composed along a finite generating tower. Kato’s theorem makes that composite independent of choices. The retained public construction has the following interface.

**API.**

- `milnorNorm`: For finite E/F and n≥0, the tower-independent homomorphism N_(E/F):Kᴹ_n(E)→+Kᴹ_n(F).
- `milnorNorm_simple`: For E=F(a), identify the general norm with the existing simple transfer N_(a/F).
- `milnorNorm_trans`: For finite F⊂E⊂L, N_(L/F)=N_(E/F)∘N_(L/E).
- `milnorNorm_mul_restrict`: For homogeneous x over F and y over E, N(res x·y)=x·N(y).
- `milnorNorm_restrict`: N_(E/F)res_(E/F)=[E:F] on each homogeneous group.
- `milnorNorm_degree_zero`: Under Kᴹ₀=ℤ, the norm is multiplication by [E:F].
- `milnorNorm_degree_one_eq_norm`: Under Kᴹ₁(E)=Eˣ and Kᴹ₁(F)=Fˣ, the norm equals Algebra.normUnits F.
- `milnorNorm_algEquiv`: Transport along any F-algebra field equivalence E≃ₐ[F]E′ commutes with norms to F.

**Unit tests.** These specify future tests of the construction.

- `general_norm_identity`: For E=F the map is the identity in every degree.
- `general_norm_quadratic_tower`: In ℚ⊂ℚ(√2)⊂ℚ(√2,√3), the degree-zero norm sends 1 to 4, equal to the two steps multiplying by 2.
- `general_norm_radical_order`: For the independent two-radical extension of 𝔽_p(s,t), either generator order gives multiplication by p² in degree zero and the determinant norm in degree one.
- `general_norm_generator_change`: For ℚ(i), changing the generator i to −i leaves the degree-one norm of 1+i equal to 2.

**Uses.**

- `MotivicEtaleKTheory:M.4`: The simple-generator and transitivity equations make closed-point cycle norms independent of coordinates.
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1`: The projection and residue equations compose in towers of residue fields.

## General base change and norm–residue compatibility

### General finite-transfer base change with Artinian lengths

Target `K2SymbolsBrauer:T.4/finite-transfer-base-change` (theorem).

Let E/F be finite, F′/F arbitrary, and E⊗_F F′≃∏_i A_i its decomposition into local Artinian algebras. Put E_i=A_i/𝔪_i and m_i=length_(A_i)(A_i). For every n≥0, res_(F′/F)N_(E/F)=Σ_i m_i N_(E_i/F′)res_(E_i/E). The norms are Kato’s generator-independent norms.

**Inputs.** `K2SymbolsBrauer:T.4/kato-tower-comparison`, `K2SymbolsBrauer:T.4/transfer-base-change`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`.

**Proof plan.**

For a simple extension A_i is F′[X]/q_i^(m_i), and this is precisely the inherited simple-extension base-change identity, valid for arbitrary F′ including transcendental extensions and completions.

For a generating tower apply that identity one step at a time. Refine the finite-dimensional tensor algebras by composition series. Their simple factors are the final residue fields E_i, repeated length_(A_i)(A_i) times: length additivity, including multiplication by residue-extension dimensions when restricting scalars, identifies the total multiplicities.

Transitivity now identifies each composite of simple norms with N_(E_i/F′). This proof comes after Kato’s theorem; it is not fed into the pre-Kato square.

The coefficient is module composition length, not the nilpotence index of the maximal ideal. The two agree for the monogenic local factors in the simple lemma but need not agree for a nonsimple extension.

**Checks.**

- For E/F separable the tensor is reduced and every m_i=1.
- For E=𝔽_p(s^(1/p),t^(1/p)) over F=𝔽_p(s,t), base changing to E gives E[ε,η]/(ε^p,η^p): its length is p² and its maximal-ideal nilpotence index is 2p−1.
- In degree zero the formula is the vector-space identity [E:F]=Σ_i m_i[E_i:F′]; at p=2 the preceding example requires coefficient 4, not 3.

**Source.** Kbook.2013, Ex.III.7.7, PDF p.265/draft p.257; III.7.6.1, PDF p.257/draft p.249. Simple formula and transitivity; the general Artinian-length formula is derived by tower refinement here.

In the two-radical self-base-change example the monomials ε^iη^j, 0≤i,j<p, form a basis over E. Every composition factor is E, so length is p². The largest nonzero total degree in the maximal ideal is2(p−1), giving nilpotence index2p−1. At p=2 the values are4 and3. The Kᴹ₀ norm sends1 to4, which directly refutes the coefficient3 without needing any higher Milnor calculation. This rechecks the algebraic issue behind inherited E13 independently; it does not renew a certification of an uninspected book edition.

### Completion of the all-extension complete residue square

Target `K2SymbolsBrauer:T.4/complete-residue-descent` (theorem).

For any complete discretely valued F, any finite E/F, n≥1 and residue fields l/k, ∂_F N_(E/F)=N_(l/k)∂_E on integral Kᴹ_n(E). The residue fields are arbitrary and may be inseparable. This completes the inherited complete-norm-residue target, conditional on the routed DVR support contracts.

**Inputs.** `K2SymbolsBrauer:T.4/kato-tower-comparison`, `K2SymbolsBrauer:T.4/prime-degree-residue-descent`, `K2SymbolsBrauer:T.4/finite-transfer-base-change`, `K2SymbolsBrauer:T.4/prime-to-p-detection`, `K2SymbolsBrauer:T.3/higher-ramification-formula`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`.

**Proof plan.**

The purely inseparable branch is a tower of normal prime-radical extensions; the preceding prime-degree square and transitivity apply. For the separable branch fix a prime p and split E⊗_F F^(p) into fields, each admitting a normal prime-degree tower. Descend idempotents, polynomial coefficients, generators and normality witnesses to finite F′/F of degree d prime to p. All descended extensions are complete DVR fields. The prime-degree square proves the theorem for each field factor E_i/F′.

Use routed contract DVR.3 for the precise componentwise residue identity. Write r=e(F′/F), e=e(E/F), e_i=e(E_i/F′), e′_i=e(E_i/E), and l⊗_k k′=∏_j A_j with residue L_j and length t_j. Then Σ_(i over j)e_i[l_i:L_j]=e t_j and Σ_(i over j)e′_i[l_i:L_j]=r t_j. The residue compositum L_j need not exhaust l_i.

The second identity follows from the first by r e_i=e e′_i and cancellation of e in an equality of positive integer lengths. For the first, compare the full lattices B=S⊗_R R′⊂C=∏S_i. Their torsion quotient D has equal kernel and cokernel composition multiplicities for multiplication by a uniformizer π′. Hence B/π′B and C/π′C have the same L_j-multiplicities. Filtering S/πS gives e t_j on B; filtering each S_i/π′S_i gives e_i[l_i:L_j] on C. This is the source-backed support contract, not cancellation in a Milnor group.

For δ=∂_F Nα−N_(l/k)∂_Eα, apply general base change and residue ramification to the left term, then the proved E_i/F′ squares. The sum is Σ_j(Σ_(i over j)e′_i[l_i:L_j])N_(L_j/k′)res_(L_j/l)∂_Eα. The second length identity makes this r times the general residue-field base change of N_(l/k)∂_Eα. Thus r res_(k′/k)δ=0.

Apply the residue transfer: dδ=r[k′:k]δ=0. For every prime p there is such a d prime to p. One d makes δ torsion; testing each prime divisor of its order proves δ=0. No index is canceled in a possibly torsion Milnor group.

**Checks.**

- This does not silently assume finite or perfect residues.
- Even for separable E/F, the residue tensor can be nonreduced; its t_j must remain.
- Only finite stages carry discrete valuations. The same residue sign multiplies both sides by (−1)^(n−1) under a convention change.

**Source.** Kbook.2013, III.7.6.3, PDF p.257/draft p.249. Normal prime-degree input; the all-extension finite-descent argument is supplied here. Stacks.20261019, Lemma 10.121.8 (02MJ; Commutative Algebra PDF p. 295), Lemma 10.162.8 (032W; Commutative Algebra PDF pp. 446–447), Remark 15.116.1 (09EM; More on Algebra PDF pp. 342–343). Determinant/length norm background, finite complete normalization and the normalization base-change setup; exact lattice contract in the Part II brief.

### Completion of the finite-normalization norm–residue formula

Target `K2SymbolsBrauer:T.4/finite-normalization-residue` (theorem).

Let E/F be finite, v a discrete valuation on F, and assume its valuation ring R has finite integral closure S in E. For n≥1, ∂_v N_(E/F)=Σ_(w|v)N_(κ(w)/κ(v))∂_w on Kᴹ_n(E). The hypothesis holds for separable E/F, for complete F, and for finite extensions of one-variable function fields over any constant field by the AlgebraicCurves finite-normalization contract.

**Inputs.** `K2SymbolsBrauer:T.4/complete-residue-descent`, `K2SymbolsBrauer:T.4/finite-transfer-base-change`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`, `K2SymbolsBrauer:T.3/higher-ramification-formula`.

**Proof plan.**

Import finite-normalization completion: E⊗_F F^∧_v≃∏_(w|v) E^∧_w. The finite S/R hypothesis is essential; no blanket defectless statement is asserted for arbitrary DVRs and arbitrary inseparable E/F.

All factors are fields and have multiplicity 1. Apply finite-transfer-base-change to the completion, and the complete residue square to each factor.

Completion preserves the residue field and has relative ramification index 1; identify each completed residue with κ(w) and the completed base residue with κ(v). Add the equalities. This realizes the inherited T.3/transfer-and-norm-residue export, parented in T.4 before its Quillen comparison.

**Checks.**

- Degree one reads ord_v N(x)=Σ_w[κ(w):κ(v)]ord_w(x); no additional e_w multiplies the right hand side.
- For E=ℚ(i), v=5 and x=2+i, N(x)=5; the two places contribute 1 and 0.
- For a base uniformizer the formula recovers [E:F]=Σ_w e_w f_w, explaining why finite normalization cannot simply be omitted.

**Source.** Kbook.2013, Ex.III.7.9, PDF p.266/draft p.258. Pre-Kato constant-extension special case, extended here after transitivity. Stacks.20261019, Remark 15.116.1 (09EM; More on Algebra PDF pp. 342–343); Lemma 10.153.4 (04GH; Commutative Algebra PDF p. 414). Finite normalization and complete local decomposition background; completion supply explicitly requested from AlgebraicCurves.

## Reciprocity and the geometric adapters

### Weil reciprocity on the projective line (III.7.5.1 and III.6.5.3)

Retained target `K2SymbolsBrauer:T.4/projective-line-reciprocity` from [the predecessor packet](../packets/K2SymbolsBrauer--T.3.json).

For a field F and x ∈ K^M_{n+1}F(t): Σ_v N_v ∂_v(x) = 0 in K^M_n(F), the sum over all places v of F(t) trivial on F, where N_π = N_{t̄/F} is the simple transfer of F[t]/(π) = F(t̄) and N_∞ is the identity; only finitely many terms are nonzero. In degree two, for f, g ∈ F(t)^× and the roadmap's tame symbol, ∏_v N_{k(v)/F}(∂_v{f, g}) = 1 in F^× with N the field norm.

**Proof plan.**

The isolated-lift definition of the simple norms gives −∂∞=Σ_p N_p∂_p. Move the infinity term to obtain reciprocity on F(t), without using generator independence.

A symbol has nonzero residue only at infinity and at irreducible factors of the numerators or denominators of its entries. A finite sum of symbols therefore has finite support.

In degree two the transfer is the determinant field norm and the last-slot residue is the chosen tame symbol, so the additive relation becomes the multiplicative product formula. For {c,t−b}, the factors are c at t−b and c⁻¹ at infinity. They are the inverses of the K-book first-slot factors.

**Checks.**

- For {c,t−b}, the finite factor is c and the infinity factor is c⁻¹; all other factors are 1.
- For {2,t} over ℚ the factors are 2 at t and 1/2 at infinity. Omitting infinity fails the product formula.
- In degree one, n=0, the equality is Σ_v deg(v)ord_v(f)=0 for a rational function.
- At 5 over ℚ, ∂{2,5}=2 in 𝔽₅ˣ, whereas ∂{5,2}=3. The separately named first-slot comparison inverts these degree-two values.

**Source.** III.7.5.1, Weil Reciprocity Formula 7.5.1 (PDF p. 256; draft p. 248); III.6.5.3, Weil Reciprocity Formula 6.5.3 (PDF p. 244; draft p. 236); III.6.5.3, proof of the Weil Reciprocity Formula (PDF p. 244; draft p. 236).

### Transport through the existing regular-model dictionary

Retain `K2SymbolsBrauer:T.4/valuation-comparison` as an import-and-transport target. AlgebraicCurves Layer12 supplies the proper regular model, its closed-point/place bijection, matching residue F-algebra fields and degrees, Scheme.ord=Place.ord, and matching principal divisors. Use naturality of field norm and the unit-part formula to carry the tame symbol across those supplied equivalences. There is no new valuation, divisor group or gluing theorem in this layer.

**Checks.** On the affine F[t] chart the imported dictionary matches the prime (p), polynomial order and F[t]/p. On the t⁻¹ chart it matches infinity with order−degree and residue F. Over imperfect F use the regular normalization rather than replacing the model by an assumed smooth curve. These are checks of the transport and of supplier compatibility, not a second proof of Layer12.

### Integral all-degree reciprocity for any function field

Target `K2SymbolsBrauer:T.4/integral-curve-reciprocity` (theorem).

Let F be any field and K/F a one-variable function field. For n≥0 and x∈Kᴹ_(n+1)(K), only finitely many ∂_P x are nonzero and Σ_(P∈Place F K)N_(κ(P)/F)∂_P x=0 in Kᴹ_n(F). Equivalently sum over the closed points of the proper regular model, using Kato norms for every finite residue extension, including inseparable ones. The regular model need not be smooth and no exact-constant-field hypothesis is imposed.

**Inputs.** `K2SymbolsBrauer:T.4/finite-normalization-residue`, `K2SymbolsBrauer:T.4/kato-tower-comparison`, `K2SymbolsBrauer:T.4/projective-line-reciprocity`, `K2SymbolsBrauer:T.4/valuation-comparison`, `K2SymbolsBrauer:T.3/finite-support`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.

**Proof plan.**

Choose t∈K transcendental over F, with K finite over F(t). Import AlgebraicCurves Layer2 finite normalization on both charts for arbitrary finite K/F(t), and Layer12’s regular proper model, closed-point/place and residue-field dictionary. These existing geometric targets are not replanned here.

For each place v of F(t), apply finite-normalization-residue to x. Transfer its equality from κ(v) to F, using Kato transitivity to identify the composite residue norms.

Sum over v. Imported finite support justifies regrouping the finite set of nonzero terms by restriction of places. The result is the projective-line residue sum for N_(K/F(t))x, which is zero by the definition of the simple norms.

The integral assertion follows from the integral Kato norm and the preceding integral norm–residue square. Suslin’s 1980 §2 gives this pushdown argument after quotienting Milnor groups by torsion; it is historical motivation, not a citation of the full integral claim. The strengthening here keeps the torsion using the proved Kato ingredients.

**Checks.**

- For n=0 the equation is Σ_P[κ(P):F]ord_P(f)=0, the degree-zero principal-divisor formula.
- For n=1 write the sum multiplicatively to obtain the product of residue-field norms of tame symbols equal to 1.
- Over an imperfect field use the regular normalization and possibly inseparable κ(P)/F; smoothness and separability are not added as hidden hypotheses.

**Source.** Kbook.2013, III.7.5.1, PDF p.256/draft p.248; III.7.6.1, PDF p.257/draft p.249. Integral projective-line identity and generator-independent norms used in the derived pushdown. Suslin.1980, §2, Theorem 2.6 and proof, printed p.597/PDF p.9; torsion-quotient convention introduced p.594/PDF p.6. Historical pushdown proof; §2 is in the torsion quotient. The integral strengthening is derived explicitly from the preceding targets.

### Tame products and divisor evaluation use the existing curve interfaces

Target `K2SymbolsBrauer:T.4/reciprocity-evaluation-compatibility` (comparison).

For a proper regular curve with function field K/F and f,g∈Kˣ, the product over closed points of N_(κ(P)/F)((−1)^(a_P b_P)res_P(f^(b_P)g^(−a_P))) equals 1, where a_P=ord_P f and b_P=ord_P g. If principal divisors are disjoint this identity is (Divisor.principal hF g).eval f=(Divisor.principal hF f).eval g. On an elliptic Weierstrass function field this is exactly EllipticCurves Layer2’s milestone, using its existing divisor evaluation.

**Inputs.** `K2SymbolsBrauer:T.4/integral-curve-reciprocity`, `K2SymbolsBrauer:T.4/valuation-comparison`, `K2SymbolsBrauer:T.4/transfer-low-degrees`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `tauceti:TauCeti.Divisor.eval_eq_prod_normResidue`, `tauceti:TauCeti.Divisor.isUnitAtSupport_iff_disjoint`, `tauceti:TauCeti.Divisor.eval`, `tauceti:TauCeti.Divisor.principal`, `tauceti:TauCeti.Place.normResidue`, `tauceti:TauCeti.Place.normResidueOrOne`, `tauceti:TauCeti.Place.degree`.

**Proof plan.**

Take n=1 in integral-curve-reciprocity and use the existing degree-one identification of the transfer with the determinant field norm. The local argument f^b g^(−a) has order ab−ba=0, so its residue is a unit.

Transport the place formula to closed points with AlgebraicCurves Layer12. Its order, residue equivalence and divisor comparisons are inputs; the K₂ layer adds only naturality of the symbol and field norm across them.

At a place of div g, disjointness makes a=0; the factor is N(res f)^b. At a place of div f it is N(res g)^(−a). Elsewhere it is 1. Thus the product is f(div g)/g(div f). Tau Ceti’s eval_eq_prod_normResidue and isUnitAtSupport_iff_disjoint identify these exact products with its Divisor.eval.

Specialize to W.FunctionField with W elliptic using the existing function-field instance. Import the Layer2 elliptic milestone and prove compatibility of the two statements; do not derive general reciprocity from that special case. The same identity holds with the opposite tame convention because every local factor is inverted.

**Checks.**

- For f=t,g=t−2 over ℚ, the factors at 0,2,∞ are −1/2,2,−1, with product 1.
- For f=t/(t−1),g=(t−2)/(t−3), disjoint divisors give both evaluations 4/3.
- At the 5-adic place, ∂{5,2}=3∈𝔽₅ˣ; the opposite convention gives 2, so the sign/inversion choice is observable.

**Source.** Kbook.2013, III.7.3, PDF p.254/draft p.246; III.7.5.1, PDF p.256/draft p.248. Uniformizer-first source residue and projective-line formula; the displayed uniformizer-last factor and evaluation adapter are derived here.

For the worked rational example f=t, g=t−2, the finite factors are g(0)⁻¹=−1/2 and f(2)=2. At infinity both orders are−1 and f/g has residue1, so the sign contributes−1. Their product is1. Omitting infinity leaves−1 and fails.

For the disjoint-support example f=t/(t−1), g=(t−2)/(t−3), the divisors are [0]−[1] and [2]−[3]. Hence f(div g)=f(2)/f(3)=2/(3/2)=4/3, while g(div f)=g(0)/g(1)=(2/3)/(1/2)=4/3. All four points have residue degree1. On a nonrational point, the same evaluation uses the field norm of the residue rather than a chosen embedding or a value in an algebraic closure.

## The routed complete-DVR supplier contract

The following is the precise proposed extension brief, included to make the single gap reviewable. It does not register a roadmap or make its identifiers executable prerequisites. The existing local-fields roadmap keeps its finite-residue constructions. AlgebraicCurves keeps place completions and normalization geometry. K₂ keeps its norm/residue square. Native carrier reuse is mandatory: normalized `Valuation`, its valuation subring, `IsAdicComplete`, `integralClosure`, `IsLocalRing.ResidueField`, determinant norm and module length. Under a finite-residue local-field hypothesis, compare the general structures with the existing ones by valuation uniqueness.

The proposed module imports only the existing local-field direction’s basic structures and native library facts; finite residue or local compactness are not hypotheses of its targets. The spectral-norm statements used below were read at the pin: `spectralNorm.normedField`, `spectralNorm_unique` and `spectralNorm.completeSpace` require a complete nontrivially normed ultrametric base and an algebraic extension, with finite-dimensionality for completeness. Normalizing their value group and building the integral lattice are additional targets here, not claims already supplied by those names.

### DVR.0/finite-extension-valuation

For a field F with a surjective v:F→ℤᵐ⁰ and v-adically complete valuation ring R, and any finite E/F, construct the unique normalized discrete valuation w on E extending the valuation class of v. E is complete for w, and ord_w(x)=e ord_v(x) on F× for a positive integer e. No separability or residue-field finiteness hypothesis.

**Proof plan.**

Transport the π-adic completeness of R to the nontrivial real norm |x|=2^(−ord_v x) on F, with |0|=0. The valuation and norm topologies have the same powers-of-π neighborhood basis. Apply Mathlib’s existing spectral norm on E/F and its finite-dimensional completeness; no local compactness is used.

Distinct cosets of the value group of F in that of E give F-linearly independent elements: a linear relation would have a unique term of greatest norm, impossible by the ultrametric inequality. The index is therefore finite, at most [E:F]. A subgroup of ℝ containing ℤ with finite index is (1/e)ℤ for a unique e>0; normalize this group to ℤ and extend by the zero value.

An alternative normalized valuation with positive restriction index gives a real algebra norm extending |·| on F; spectralNorm_unique makes it the same norm. Surjectivity then identifies the normalized valuations and their ramification indices. Transport this uniqueness through field embeddings, isomorphisms and towers.

For a normal prime-degree E/F, the extension is Galois or purely inseparable. Lift a residue generator to an integral element and reduce its split minimal polynomial to see that the residue minimal polynomial splits in l. In the Galois case conjugates of that lift cover the distinct residue conjugates; restriction of automorphisms is onto the separable residue action. In the purely inseparable case the residue action has one embedding with its inseparable degree. Export this elementary normal-residue consequence for the prime-degree K₂ argument.

**API.**

- `finiteExtensionValuation`: The normalized Valuation E ℤᵐ⁰, with surjectivity, positive restriction index and no preinstalled valuation on E.
- `adicComplete_iff_complete_norm`: The native π-adic completeness and completeness for 2^(−ord) agree; the norm and valuation topologies agree.
- `finiteExtensionValuation_unique`: Any surjective discrete valuation on E with positive restriction index is this valuation; compatibility is a named equality, not a second global instance.
- `finiteExtensionValuation_tower`: Restriction indices multiply in a finite tower; compatible embeddings preserve units and induce the native local residue map.
- `finiteExtensionValuation_localField`: Under IsNonarchimedeanLocalField F, identify this construction with the existing Layer 0 valuation class and normalized valuation.
- `normal_prime_residue_action`: If E/F is normal of prime degree p, l/k is normal, its degree is 1 or p, and Gal(E/F)→Aut_k(l) is surjective; if e=1 the self-base-change sum on E induces exactly the residue norm’s embedding sum with inseparable multiplicity.

**Unit tests.** These specify future tests of the construction.

- `identity_extension`: E=F gives e=1, the original valuation and residue map, and the original topology.
- `infinite_residue_ramification`: F=ℚ((t)), E=ℚ((s)), t=s²: ord_E(s)=1, ord_E(t)=2 and e=2. No IsNonarchimedeanLocalField instance is assumed.
- `inseparable_residue_separable_field`: k=F₂(a), F=k((t)), E=F(α), α²+tα+a=0: E/F is separable, e=1, residue l=k(√a) has inseparable degree 2. Reject a separable-residue requirement.

**Uses.**

- `K2SymbolsBrauer:T.4/prime-degree-residue-descent`: Keep complete discrete valuations after finite prime-to-p descent, with ef and the norm/order and residue formulas needed for the four generated-symbol cases.
- `K2SymbolsBrauer:T.4/complete-residue-descent`: Compare all generic base-change factors with Artinian residue components without discarding ramification or multiplicity.

**Sources.** Stacks Lemma 10.162.8 (032W; Commutative Algebra PDF pp. 446–447), Lemma 10.153.4 (04GH; Commutative Algebra PDF p. 414), Remark 15.116.1 (09EM; More on Algebra PDF pp. 342–343) and Lemma 10.121.8 (02MJ; Commutative Algebra PDF p. 295), with the explicit derivations above. The norm-reduction step reuses the current Tau Ceti theorem; these tags are not claimed as a single existing theorem exporting the entire contract.

### DVR.1/integral-closure-lattice

For the preceding finite E/F, S=integralClosure R E is the valuation ring of w, a complete DVR and a finite free R-module of rank [E:F]=e[l:k], with l and k the native residue fields. Identify π_F S=𝔪_S^e, and the e successive quotients with l as k-vector spaces. Residue extensions may be inseparable.

**Proof plan.**

Fix an F-basis of E. Continuity of its coordinate maps in the finite-dimensional spectral norm bounds the closed unit ball S₀ inside π_F^(−N)R^d for one N. The ball is an R-submodule; R is a Noetherian PID, so S₀ is finite and torsion free, hence free. Scaling the chosen basis into S₀ shows that its rank is d=[E:F]. This bounded-lattice argument uses neither compactness nor a finite residue field.

The ball is a subring. Since it is a finite R-algebra, each of its elements is integral. Conversely the ultrametric monic-polynomial argument bounds every integral element by 1. Thus S₀=integralClosure R E. The normalized discrete valuation identifies its maximal ideal and makes it a DVR; the spectral norm gives completeness.

Write π_F=uπ_E^e. The quotient S/π_F S has dimension d over k by freeness, and its π_E-adic filtration has e quotients isomorphic to l as k-vector spaces. Therefore d=e[l:k]; this also proves finite residue degree without a perfectness assumption. Reuse TauCeti.residueFieldEquivMaximalIdealGradedOfUniformizer for the graded pieces and restrict scalars from l to k. The existing finite-flat Ideal.sum_ramification_inertia_eq_finrank supplies the rank formula once this finite free local lattice is constructed; the filtration identifies its terms with these native e and f.

If l=k and [E:F]=e, a uniformizer of E generates E/F: its value group forces degree at least e. Uniqueness of the extended valuation bounds the nonleading coefficients of its minimal polynomial, and the constant coefficient has F-order one. Export the resulting Eisenstein polynomial for the two-uniformizer computation.

**API.**

- `valuationSubring_equiv_integralClosure`: A named R-algebra equivalence identifying the ring, its maximal ideal, residue field and units.
- `integralClosure_finite_free`: Module.Finite R S and Module.Free R S; finrank F E equals the R-module rank of S.
- `ramification_mul_residueDegree`: e>0, [l:k]>0 and [E:F]=e[l:k], including purely inseparable E/F.
- `extension_uniformizer_filtration`: Identify π_F S=𝔪_S^e and the e-step quotient S/π_F S. Reuse TauCeti.residueFieldEquivMaximalIdealGradedOfUniformizer for each piece; export the compatibility with the k-vector-space filtration, not a second graded-piece construction.
- `uniformizer_minpoly_eisenstein`: If e=[E:F] and l=k, every uniformizer π_E generates E/F and its minimal polynomial over F is Eisenstein over R.

**Unit tests.** These specify future tests of the construction.

- `tame_lattice`: For t=s² over ℚ, S=ℚ[[s]] is R-free on 1,s; S/tS has two residue layers, each ℚ.
- `constant_lattice`: E=ℚ(i)((t)) over ℚ((t)) has e=1, [l:k]=2, basis 1,i; t remains a uniformizer.
- `fierce_lattice`: For α²+tα+a in characteristic 2, R[α] is free on 1,α, local with maximal ideal (t) and residue k(√a), hence a DVR and already the integral closure. It has e=1,f=2, not e=2,f=1.

**Uses.**

- `K2SymbolsBrauer:T.4/prime-degree-residue-descent`: Keep complete discrete valuations after finite prime-to-p descent, with ef and the norm/order and residue formulas needed for the four generated-symbol cases.
- `K2SymbolsBrauer:T.4/complete-residue-descent`: Compare all generic base-change factors with Artinian residue components without discarding ramification or multiplicity.

**Sources.** Stacks Lemma 10.162.8 (032W; Commutative Algebra PDF pp. 446–447), Lemma 10.153.4 (04GH; Commutative Algebra PDF p. 414), Remark 15.116.1 (09EM; More on Algebra PDF pp. 342–343) and Lemma 10.121.8 (02MJ; Commutative Algebra PDF p. 295), with the explicit derivations above. The norm-reduction step reuses the current Tau Ceti theorem; these tags are not claimed as a single existing theorem exporting the entire contract.

### DVR.2/norm-valuation-and-residue

For every finite extension E/F in DVR.0, ord_F(N_E/F y)=[l:k]ord_E(y) for y≠0. For u∈S×, N_E/F(u)∈R× and res_k(N_E/F u)=N_l/k(res_l u)^e. Here norms are the existing determinant norms, also for inseparable residue extensions.

**Proof plan.**

For integral nonzero y, the determinant of multiplication on the finite free R-lattice S has order length_R(S/yS). The π_E-filtration gives [l:k]ord_E(y). Write a general y as a quotient to extend the equality to E×.

For a unit u, reduce its multiplication matrix modulo π_F and filter S/π_F S by the e powers of π_E. On each quotient multiplication is by res_l u on l, with k-determinant N_l/k(res_l u). Multiplication of the e diagonal-block determinants gives the residue formula. This uses no embeddings or separability of l/k. The matrix-reduction step is already TauCeti.Algebra.norm_quotient_mk on current main (after the atlas pin); use it in the future supplier. Algebra.algebraMap_intNorm and Algebra.norm_norm are the existing integral/field and tower comparisons.

**API.**

- `ord_norm`: The valuation-of-norm identity for all nonzero elements, not just units.
- `residue_norm_unit`: The displayed exponent-e residue identity for S×→R×.
- `norm_integral_norm_unit`: Use the existing integral norm and Algebra.algebraMap_intNorm to restrict S→R, and restrict the homomorphism to units; do not define a second determinant norm.
- `norm_tower_and_localField`: Reuse Algebra.norm_norm for tower maps. Compare the new identities with existing LocalFieldsRamification Layer 3 norms through the DVR.0 uniqueness comparisons.

**Unit tests.** These specify future tests of the construction.

- `ramified_norm_sign`: For t=s² over ℚ, N(s)=−t and N(2)=4. Hence ord_F N(s)=1, and residue N(2)=2²: both the sign and exponent e=2 are visible.
- `constant_norm_degree`: For ℚ(i)((t))/ℚ((t)), N(t)=t² and N(1+i)=2; the valuation factor is f=2, not e=1.
- `inseparable_residue_norm`: For α²+tα+a, N(α)=a=N_l/k(√a), N(t)=t², e=1 and f=2. A norm defined as a product of distinct residue embeddings gives the wrong answer.

**Uses.**

- `K2SymbolsBrauer:T.4/prime-degree-residue-descent`: Keep complete discrete valuations after finite prime-to-p descent, with ef and the norm/order and residue formulas needed for the four generated-symbol cases.
- `K2SymbolsBrauer:T.4/complete-residue-descent`: Compare all generic base-change factors with Artinian residue components without discarding ramification or multiplicity.

**Sources.** Stacks Lemma 10.162.8 (032W; Commutative Algebra PDF pp. 446–447), Lemma 10.153.4 (04GH; Commutative Algebra PDF p. 414), Remark 15.116.1 (09EM; More on Algebra PDF pp. 342–343) and Lemma 10.121.8 (02MJ; Commutative Algebra PDF p. 295), with the explicit derivations above. The norm-reduction step reuses the current Tau Ceti theorem; these tags are not claimed as a single existing theorem exporting the entire contract.

### DVR.3/base-change-component-length

Let E/F be finite SEPARABLE and F′/F any finite extension of complete discretely valued fields. Let R,S,R′ be their valuation rings, k,l,k′ their residues, e=e(E/F), r=e(F′/F), E⊗F F′=∏E_i with valuation rings S_i and residues l_i. Write l⊗k k′=∏A_j, with L_j the residue of A_j and t_j=length_(A_j)(A_j). Put e_i=e(E_i/F′), e′_i=e(E_i/E). The natural residue maps assign each i to j and inject L_j into l_i. Then Σ_(i over j) e_i[l_i:L_j]=e t_j and Σ_(i over j) e′_i[l_i:L_j]=r t_j. No separability of l/k or equality l_i=L_j is assumed.

**Proof plan.**

Separability of E/F makes its tensor with F′ a product of fields. B=S⊗R R′ injects into that algebra by R-flatness of R′; C=∏S_i is its finite normalization and B⊂C are full R′-lattices. Their quotient D is finite torsion. The R′- and B-actions are retained in the following length computation.

For multiplication by π′ on D, length additivity gives equal composition multiplicities of its kernel and cokernel, component by component. The snake exact sequence therefore gives equal B-module composition multiplicities of B/π′B and C/π′C. The simple factors are the L_j; this is elementary finite-length module additivity, not K(B)=G(B).

Filter B/π′B=(S/π_F S)⊗k k′ into e copies of l⊗k k′: the j multiplicity is e t_j. The i component of C/π′C has e_i copies of l_i, hence j multiplicity e_i[l_i:L_j]. This proves the first identity. Tower compatibility gives r e_i=e e′_i. Multiply the first identity by r and cancel positive e in ℕ to get the second. No torsion K-group cancellation occurs.

**API.**

- `tensor_normalization_lattice`: The canonical inclusion B⊂∏S_i is finite, has the stated common fraction algebra, and has finite-length cokernel over R′.
- `residue_component_map`: The canonical A_j→l_i factors through an injective L_j→l_i, with complete assignment of factors and invariance under relabeling.
- `baseChange_component_length`: Both displayed componentwise identities, natural in finite towers and compatible with e e′_i=r e_i.
- `separable_scope`: Do not assert E⊗F F′ is reduced for inseparable E/F. Such E/F is handled by normal prime-degree towers in the K2 consumer; Artinian transfer lengths remain in the arbitrary-field base-change theorem.

**Unit tests.** These specify future tests of the construction.

- `ramified_self_base_change`: E=ℚ((s)), s²=t, F′=E: r=e=2; two E_i=E, each e_i=e′_i=1; l⊗k k′=ℚ has t_j=1, so the sum is 2.
- `larger_residue_than_compositum`: E=ℚ((s)), s²=t and F′=ℚ((u)), u²=2t: one E_i=ℚ(√2)((u)), e_i=e′_i=1 and [l_i:L_j]=2 with L_j=ℚ, t_j=1. The length sum is 2; replacing l_i by the residue compositum gives 1 and fails.
- `nonreduced_residue_tensor`: For α²+tα+a over F₂(a)((t)) and F′=E, the separable generic tensor is E×E but l⊗k l≅l[ε]/ε² has t_j=2. Here e=r=e_i=e′_i=1 and the two residue-degree terms are 1, giving 2=1·2. Using reduced residue factors with multiplicity 1 fails.

**Uses.**

- `K2SymbolsBrauer:T.4/prime-degree-residue-descent`: Keep complete discrete valuations after finite prime-to-p descent, with ef and the norm/order and residue formulas needed for the four generated-symbol cases.
- `K2SymbolsBrauer:T.4/complete-residue-descent`: Compare all generic base-change factors with Artinian residue components without discarding ramification or multiplicity.

**Sources.** Stacks Lemma 10.162.8 (032W; Commutative Algebra PDF pp. 446–447), Lemma 10.153.4 (04GH; Commutative Algebra PDF p. 414), Remark 15.116.1 (09EM; More on Algebra PDF pp. 342–343) and Lemma 10.121.8 (02MJ; Commutative Algebra PDF p. 295), with the explicit derivations above. The norm-reduction step reuses the current Tau Ceti theorem; these tags are not claimed as a single existing theorem exporting the entire contract.

The DVR.3 componentwise identities are needed even when the generic tensor product is reduced: residue tensors can remain nonreduced. In the characteristic-two example α²+tα+a, generic separability gives E⊗F E≃E×E, but its residue tensor is l[ε]/ε² of length2. For the distinct ramified quadratic base changes s²=t and u²=2t over ℚ((t)), the generic compositum has residue ℚ(√2), although both original residue fields and their compositum are ℚ. Thus both residue lengths and the degrees [lᵢ:Lⱼ] in the brief are necessary.

## Sources, corrections and attribution

The sources actually read for this continuation are:

- Charles A. Weibel, [The K-book, author-hosted combined draft of 29 August 2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.1.4, III.6.5.3, Ex.III.6.2, III.7.1–7.6.4 and Exercises III.7.1–7.10; combined PDF pp.240,244,251,253–258,265–266. The printed draft pagination is eight pages earlier. SHA-256 is `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. Read 19 October 2026. The published AMS book was not inspected.
- A. A. Suslin, [Reciprocity laws and the stable rank of polynomial rings](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=1759&what=fullteng), Math. USSR-Izvestija 15 (1980), no. 3, 589–623; §1–§2 through Theorem 2.6, printed pp.590–597/PDF pp.2–9. Read 19 October 2026. Corollary 1.10 is integral. After it, the paper passes to groups modulo torsion; Theorem 2.6 alone therefore does not justify this roadmap’s integral result.
- The Stacks Project, [02MJ](https://stacks.math.columbia.edu/tag/02MJ), [04GH](https://stacks.math.columbia.edu/tag/04GH), [032W](https://stacks.math.columbia.edu/tag/032W), [09E8](https://stacks.math.columbia.edu/tag/09E8) and [09EM](https://stacks.math.columbia.edu/tag/09EM), with the full section/lemma numbers and chapter PDF pages given above; read 19 October 2026. Commutative Algebra: 10.121.8 p.295, 10.153.4 p.414, 10.162.8 pp.446–447; More on Algebra: 15.113.6 p.334, 15.116.1 pp.342–343. The supplied proofs use determinant lengths, complete finite normalization and henselian decomposition. The componentwise lattice identities are explicitly derived in the brief.

The predecessor’s source findings remain at their original identifiers; no source passage or source review is copied here. Relevant corrections, in our own words, are these:

| Inherited finding | Public draft locator and use here |
| --- | --- |
| E5 | Ex.III.6.2, PDF p.251/draft p.243: a reduction permitting only the first maximal-degree entry is too restrictive. Use the displayed two-entry identity, plus the repeated case. At t−2 over ℚ, permitted symbols involving only t and constants cannot detect the needed residue. |
| E6 | III.7.4 proof, PDF p.255/draft p.247: the filtration generators must have the target group’s symbol length n. |
| E7 | III.7.4.1 proof, same page: equality of low-degree residue representatives summing to1 holds in F[t]; the representatives need not lie in F. |
| E8 | III.7.6.4, PDF p.258/draft p.250: the last simple norm has base E. Its domain forces N_(a/E), as the commuting square above records. The earlier review records an author erratum; that errata file was not freshly read here. |
| E10 | Ex.III.7.7, PDF p.265/draft p.257: its finite-constant-extension scope is insufficient for the completion used in Ex.III.7.9, PDF p.266/draft p.258. The same elementary argument is given for arbitrary F′/F. |
| E11 | Ex.III.7.10, PDF p.266/draft p.258: its product sign fits the last-slot convention, while Theorem III.7.3 uses the first slot. For x of degree i and y of degree j, our formula is ∂(xy)=λ(x)∂y+(−1)^j∂x ρ(y), where ρ{uπ^m}={(−1)^mū}. The map ρ differs from unit-part specialization λ: for x=y={π}, it retains ∂{π,π}={−1}. Converting residues gives the corresponding first-slot formula. |

These are inherited findings, not a fresh independent review. The Artinian-length test underlying E13 is recomputed above; this run does not cite an unofficial or uninspected copy of its book source. The new proof refinements spell out repeated entries, normal-hull annihilation, finite descent and compositum induction instead of attributing those elaborations to a source as if they were its literal statements.

## Suggested Lean and assembly

The [suggested file](../suggested/K2SymbolsBrauer--T.4.lean) is a compact collection of end signatures over existing pinned carriers. It states the normed tame-factor product and divisor-evaluation reciprocity. It includes a proved order-zero check for the local residue argument, native zero-divisor evaluation, the elliptic specialization, and numerical sign, evaluation and length checks. Integral Milnor carriers and heavy norm constructions are README targets, indexed in comments.

`lean-check` succeeds at the pins with exactly two admitted-proof warnings, one for each end reciprocity theorem. The six examples have no admissions of their own; the elliptic specialization applies the admitted general theorem. Elaborating these signatures is not a proof of reciprocity. The packet checker reports no errors or warnings. The four planets are Bass–Tate exact sequence, Kato’s theorem on Milnor norms, Milnor norm base change and Suslin reciprocity; the inherited simple-transfer construction keeps its existing identifier.

At assembly, retain the imported target identifiers and their single mathematical owners. Merge the new proof completions according to `continuation.proofMap`, especially the general norm–residue export whose historical ID lies under T.3 but whose parent is T.4. Apply the distinct supplier routing and confirm the finer upstream interfaces before reporting closed coverage. No T.5–T.7 files or upstream roadmap files are changed by this job.
