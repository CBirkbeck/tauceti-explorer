# Complex multiplication and explicit reciprocity, Part II

**Summary.** Starting from polarized CM types, lattices and reciprocity, construct the height comparisons needed for the averaged Colmez formula by two routes: total reflex families and orthogonal arithmetic intersections, and corrected quaternionic CM isogenies and adjunction. Use the common average to bound individual CM heights, derive primitive and arbitrary-center-order Galois-orbit bounds, and combine them with period-coordinate height bounds to obtain finiteness of CM points of bounded moduli degree. The individual Colmez conjecture is defined but is neither an assumption nor an endpoint.

The targets below form one roadmap. The two averaged-height proofs share their conclusion and metric adapter. Neither depends on the quantitative orbit argument. Each theorem states the required mathematical result; the proof gates identify precisely which comparisons and primary-source inputs must be verified before the result is regarded as established. All fourteen layers are planned, and none is proof-closed or claimed implemented.

## Conventions and endpoints

Write E/F for a CM field with maximal order O_E, F its maximal totally real subfield, and [F:Q]=g≥1. The involution is Mathlib’s canonical CM conjugation. D_E and D_F are positive absolute field discriminants, d_E/F=N_F/Q(δ_E/F), and χ=χ_E/F is the quadratic Hecke character. Thus D_E=D_F²d_E/F and D_E/D_F=D_Fd_E/F. Every type sum includes all 2^g CM types, including imprimitive ones; types are not identified under Galois conjugation.

Use finite L-functions L_f, with ell(s)=L_f′(s,χ)/L_f(s,χ). Completed L-functions enter only through their explicitly tracked conductor and gamma factors. Arithmetic Artin sends a uniformizer to arithmetic Frobenius. Consequently the Lubin–Tate character takes Art(π^r u) to u⁻¹. Conjugation of the global CM field is not an element that simultaneously exchanges every pair of p-adic embeddings in a local decomposition group.

The unscaled squared Faltings volume metric gives h_Falt. The Yuan–Zhang metric multiplies that squared metric by (2π)^(-g), giving

h_YZ(E,Φ)=h_Falt(E,Φ)+(g/2)log(2π).

Both heights are additive logarithmic heights. In these conventions the shared target is

2^(-g)Σ_Φ h_Falt(E,Φ)=−ell(0)/2−log(D_E/D_F)/4−(g/2)log(2π).

Its h_YZ version omits the last term. An extra metric conversion at an intermediate Hodge line would change the answer and is forbidden by this convention. An individual stable height may be negative; the uniform lower constant b_g is real, not necessarily positive.

Arithmetic degrees on the CM stack use stabilizer weights and are divided by the matching complex degree. CM component heights divide by [K:Q]. The quaternionic curve height divides by [F(P):F]; replacing it with [F(P):Q] changes the normalization. Every change of level or definition field must scale the degree and denominator together.

For a general principally polarized CM point x∈A_g, R_x is the entire center of its integral endomorphism ring. A repeated simple isotypic factor contributes one center field; nonisogenous factors retain separate fields even if those fields are abstractly isomorphic. Put D_x=|disc R_x| and J_x=[O_x:R_x], so D_x=J_x²∏D_Ki. This is the discriminant in the general orbit and lift-height targets. The orbit is the absolute Galois orbit of the polarized coarse point. Relative marked reciprocity orbits and fields defining the object require explicit bounded-degree adapters.

A period-coordinate height H_abs is the absolute multiplicative Weil height. The analytic quantity h₀(Z)=max(max|z_ij|,1/det Im Z) is used only in quantitative reduction. A bound on h₀ is not substituted for a bound on H_abs.

## Mathematical dependency structure

The total reflex route is CMH.0 → CMH.1 → CMH.2 → CMH.3 → CMH.4 → CMH.9. The corrected quaternionic route is CMH.0 → CMH.5 → CMH.6 → CMH.7 → CMH.8 → CMH.9. Both use the same generic CM, stable-height and metric inputs. Either completed proof of CMH.9 suffices mathematically. Listing both in the target prerequisites records both planned proofs rather than requiring both to use the theorem.

CMH.9 → CMH.10 → CMH.11 supplies the primitive orbit bound. CMH.12 imports the primitive input in every dimension h≤g and handles nonmaximal center orders and repeated factors. CMH.13 supplies the independent period-height estimate and combines it with the arbitrary-CM orbit bound for the Masser–Zannier finiteness consumer. No André–Oort, o-minimal counting, functional transcendence or Jacobian-isogeny-count theorem is planned here.

| Layer | Mathematical endpoint |
| --- | --- |
| CMH.0 | CM characters and height linearity |
| CMH.1 | Integral CM and total reflex families |
| CMH.2 | CM integral realizations |
| CMH.3 | The total reflex determinant |
| CMH.4 | The orthogonal averaged-height route |
| CMH.5 | Component heights and nearby types |
| CMH.6 | Corrected different-torsion comparison |
| CMH.7 | Quaternionic CM points and Hodge lines |
| CMH.8 | Quaternionic self-intersection and adjunction |
| CMH.9 | The shared averaged Colmez formula |
| CMH.10 | Individual height bounds and distant isogenies |
| CMH.11 | Primitive CM Galois orbits |
| CMH.12 | General CM orders and Galois orbits |
| CMH.13 | CM lift heights and bounded-degree finiteness |

## Existing library inputs and ownership

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declarations below are imported as existing results. A native CM field, its conjugation, class number, regulator or ideal count is never rebuilt as a roadmap definition.

- **mathlib:NumberField.IsCMField**, `Mathlib/NumberTheory/NumberField/CMField.lean`: The native CM-field class: characteristic zero, totally complex and quadratic over the maximal real subfield.
- **mathlib:NumberField.IsCMField.complexConj**, `Mathlib/NumberTheory/NumberField/CMField.lean`: Canonical CM involution on the actual field, with the integral-over-Q hypothesis of the declaration.
- **mathlib:NumberField.IsCMField.complexConj_apply_apply**, `Mathlib/NumberTheory/NumberField/CMField.lean`: The canonical CM involution squares to the identity.
- **mathlib:NumberField.IsCMField.regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv**, `Mathlib/NumberTheory/NumberField/CMField.lean`: R_E/R_F=2^rank(E)/indexRealUnits(E); it is not generally 1.
- **mathlib:NumberField.IsCMField.indexRealUnits_eq_one_or_two**, `Mathlib/NumberTheory/NumberField/CMField.lean`: The real-unit index is 1 or 2, hence the regulator ratio is dimension-bounded.
- **mathlib:NumberField.classNumber_pos**, `Mathlib/NumberTheory/NumberField/ClassNumber.lean`: The native number-field class number is positive.
- **mathlib:NumberField.exists_ideal_in_class_of_norm_le**, `Mathlib/NumberTheory/NumberField/ClassNumber.lean`: Every ideal class has a nonzero integral representative with the specified Minkowski norm bound.
- **tauceti:NumberField.card_ideal_absNorm_le**, `TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean`: For X≥1, the nonzero integral ideals with absNorm≤X are finite and number at most X²2^[K:Q]. This alone is too weak for the distant-isogeny exponent.
- **tauceti:NumberField.abs_discr_le_of_basis_isIntegral**, `TauCeti/NumberTheory/EffectiveBounds/Discriminant/Basic.lean`: For an integral rational basis b, |disc(K)|≤|disc_Q(b)|; the exact order index-square identity is a separate imported order theorem.

The current upstream additions, including completed EffectiveBounds and IntegralLattices and the OrthogonalSpinGroups roadmap, have separate ownership. Integral lattice duality and discriminant groups are available; quantitative hermitian balancing and Siegel reduction are additional inputs from the geometry-of-numbers owner. The existing ideal count is quadratic in X. The near-linear count required below is a refinement with its owner, not a replacement plan for the completed result. Orthogonal/Spin group algebra does not supply the big-CM arithmetic Hodge-height theorem.

Base CM.0 supplies CM types, primitive/induced types, trace reflex fields and reflex orders. CM.2 supplies polarized lattices, arbitrary-dimensional classification and the marked reciprocity/class-map interface. Their class fields, reduction theory and explicit reciprocity continuations are not replanned. Generic stable heights and component determinant lines remain in ArakelovGeometryAndAbelianHeights; generic geometric isogeny estimates remain in FaltingsFinitenessAndIsogenyTheoremsPartII.

The exact external stage contracts are collected after the layer targets. A request names a needed interface, not a claim that the supplier has proved it. In particular the GSpinSpecialDivisorHeights paper proposal has no accepted stage id: its missing arithmetic intersection and support-control interfaces remain explicit proof gates.


## CMH.0. CM characters and height linearity

**Inputs.** `AnalyticNumberTheory:AN.4`; `ArakelovGeometryAndAbelianHeights:R35.3`; `AutomorphicLFunctionsAndLocalFactors:AL.1`; `ComplexMultiplicationAndExplicitReciprocity:CM.0`; `ShimuraVarieties:V5`.

### CM class functions and analytic heights

**Definition — `CMHeights.cm_class_functions`.** For the profinite absolute Galois group Γ_Q, CM⁰ consists of rational-valued locally constant conjugation-invariant functions a for which a(σ)+a(cσ) is constant. For a CM algebra E and type Φ, put a_Φ(σ)=#(Φ∩σΦ) and a⁰_Φ equal to its conjugacy average, computed in any finite Galois quotient through which the action factors. Expand a in finite-image irreducible Artin characters and set Z̃(a)=−Σ_η a_η((L_f′/L_f)(0,η)+(log f_η)/2). Define h_Col(E,Φ)=Z̃(a⁰_Φ). Every nontrivial character occurring is totally odd; the trivial term uses ζ(0) and ζ′(0). Define H_CM⊂CM⁰ to be the Q-span, over all CM pairs, of a⁰_Φ. It is the domain determined by total Faltings heights. Every generator is invariant under σ↦σ⁻¹ and vanishes at complex conjugation c; consequently H_CM is a proper subspace of CM⁰, since the constant function 1 does not vanish at c.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Definition 9.1.1, (9.1.2), Definition 9.1.3, pp. 508–509.

**Dependencies.** `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`; `AutomorphicLFunctionsAndLocalFactors:AL.1`; `AnalyticNumberTheory:AN.4`.

**Proof or construction.** 1. Pass to a finite splitting Galois group and take its normalized conjugacy sum; prove independence under refinement. 2. Use the c-parity decomposition to exclude nontrivial even constituents and import regularity and nonvanishing at 0 for the remaining Artin characters. 3. Use conductor-compatible induction and the real structure to show Z̃(a) is real. General Artin holomorphy is not an input.

**Uses.** CMH.1 total reflex height and CMH.9 averaged formula: Convert finite CM-type combinatorics into an analytic logarithmic-derivative identity.

**API.**

- `CMHeights.cm_class_functions.overlap` (projection): Evaluate a_Φ on σ by the cardinality of the actual intersection.
- `CMHeights.cm_class_functions.conjugacy_average` (characterisation): a⁰_Φ is the normalized conjugacy average and is invariant under conjugation and finite-quotient refinement.
- `CMHeights.cm_class_functions.complement` (simp): a⁰_Φ(σ)+a⁰_Φ(cσ)=d.
- `CMHeights.cm_class_functions.analytic_height` (compatibility): h_Col is Z̃(a⁰_Φ), with finite conductors and finite L-functions.
- `CMHeights.cm_class_functions.height_span` (characterisation): H_CM is the Q-span of all overlap characters; every member is inversion-invariant and has value zero at c.

**Checks.**

1. For an imaginary quadratic field, a⁰ on {1,c} has values (1,0), hence equals (1+χ)/2.
2. For E=E₁×E₂ with product type, the overlap function is the sum of the two overlap functions.
3. A nontrivial even character of a finite quotient fails the CM⁰ constant-sum condition; the constant function passes.
4. The constant function 1 satisfies the CM⁰ constant-sum condition but is not in H_CM, because every overlap function vanishes at c.
5. For the cyclic CM Galois quotient C6 with c=r³, the class function with successive values (0,1,1,0,−1,−1) lies in CM⁰ but is not inversion-invariant and cannot lie in H_CM.

**Acceptance.** The complement identity for a⁰_Φ has constant d, and h_Col is additive on product CM pairs.

### CM-height invariance and Colmez linearity

**Theorem — `CMHeights.colmez_linearity`.** For a maximal-order CM pair (E,Φ), stable unscaled Faltings height depends only on that pair. For product CM algebras extend height additively. There is a unique Q-linear map ht_H:H_CM→R with ht_H(a⁰_Φ)=h_Falt(E,Φ). Inducing a field type to a CM overfield Ẽ multiplies a⁰ by [Ẽ:E]. Uniqueness here is only on the overlap span H_CM. Colmez’s period-normalized functional on all CM⁰ requires its component-period values and a sign/conductor/metric adapter; total heights alone do not specify that extension. The individual height conjecture on H_CM remains unproved and unused.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Theorem 9.1.5 and Remark 9.1.2, pp. 509–510; citing Colmez (1993), Theorem 0.3; [Pierre Colmez — Annals 138 (1993), 625–683; author-hosted scan](https://webusers.imj-prg.fr/~pierre.colmez/artin.pdf), Component generators, p. 630; Theorem 0.3(i)–(ii), p. 631.

**Dependencies.** **CM class functions and analytic heights**; `ArakelovGeometryAndAbelianHeights:R35.3/stable-faltings-height`; `ArakelovGeometryAndAbelianHeights:R35.3/stable-height-properties`; `ShimuraVarieties:V5`.

**Proof or construction.** 1. Import potential good reduction and model independence from the CM/height owners. 2. Use Colmez Theorem 0.3 on the component-character generators, whose period values specify the full functional, to establish compatibility of total-height linear relations after the sign/conductor/metric normalization. Restrict to H_CM; its spanning property gives uniqueness there. The complete period-comparison proof and normalization adapter remain G-Colmez. 3. Prove the induction scaling by counting extensions of embeddings, then extend products by additivity.

**Acceptance.** Conjugating the CM action preserves the height; no individual equality with h_Col is inferred. Evaluation at c annihilates H_CM and is nonzero on CM⁰. Adding any real multiple of that evaluation to an extension leaves its total-height values unchanged; reject unrestricted uniqueness from total heights alone.

### Average CM character

**Theorem — `CMHeights.average_character`.** For a CM field E/F with [F:Q]=d≥1 and χ=χ_E/F, (1/(2d))Σ_{Φ∈CM(E)}a⁰_Φ=2^(d−2)(1+(1/d)Ind_{Γ_F}^{Γ_Q}χ). Consequently 2^(−d)Σ_Φ h_Col(E,Φ)=−(L_f′/L_f)(0,χ)/2−log(D_E/D_F)/4−d log(2π)/2. The sums contain all 2^d types with multiplicity one.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 9.3.1, equation (9.3.1), p. 511.

**Dependencies.** **CM class functions and analytic heights**; `AutomorphicLFunctionsAndLocalFactors:AL.1`; `AnalyticNumberTheory:AN.4`.

**Proof or construction.** 1. Count types containing any specified embedding and pair of embeddings in the finite Galois closure; average conjugates. 2. Apply Z̃ and Artin induction to the quadratic Hecke character. 3. Use ζ′(0)/ζ(0)=log(2π) and conductor(Indχ)=D_F N_F/Q(d_E/F)=D_E/D_F.

**Acceptance.** For d=1 the character identity reads (1+χ)/2; for d=2 it reads 1+(Indχ)/2.

### The individual Colmez conjecture predicate

**Definition — `CMHeights.colmez_conjecture`.** On H_CM define IndividualColmez to mean ∀a∈H_CM, ht_H(a)=Z̃(a), equivalently the individual formula h_Falt(E,Φ)=h_Col(E,Φ) for every maximal-order CM pair. This is the total-height form of the conjecture. A formulation on all CM⁰ must instead use the additional component-period normalization of Colmez Theorem 0.3 and its adapter; it is not defined by extending ht_H arbitrarily. Neither formulation is proved or assumed here. CMH.9 proves equality only on each averaged character.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Conjecture 9.1.6, p. 510; [Pierre Colmez — Annals 138 (1993), 625–683; author-hosted scan](https://webusers.imj-prg.fr/~pierre.colmez/artin.pdf), Theorem 0.3, p. 631; Conjecture 0.4, p. 632.

**Dependencies.** **CM class functions and analytic heights**; **CM-height invariance and Colmez linearity**.

**Proof or construction.** 1. Compare the Q-linear height and analytic maps on their common domain H_CM; distinguish the full component-period formulation on CM⁰. 2. Specialize their equality to a⁰_Φ. 3. Keep the predicate separate from every averaged-height theorem.

**Uses.** CMH.9 and CMH.10: States precisely what the averaged theorem does and prevents accidental use of the individual conjecture.

**API.**

- `CMHeights.colmez_conjecture.unfold` (characterisation): The predicate is equality at every element of H_CM, equivalently at every spanning overlap character.
- `CMHeights.colmez_conjecture.type_specialization` (compatibility): The predicate implies the individual height formula for every maximal-order CM pair.
- `CMHeights.colmez_conjecture.linear_combination` (compatibility): Equality at a and b implies equality at each rational linear combination of a and b.

**Checks.**

1. For the zero class function both linear maps vanish, irrespective of whether the predicate holds.
2. For d=1 the averaged character is already the quadratic type character; the classical case supplies that equality.
3. For linear maps f(x,y)=x and g(x,y)=y on Q², equality at (1,1) does not imply equality of the maps; reject an API deriving IndividualColmez from one averaged equality.

**Acceptance.** No node or proof route has IndividualColmez as an assumption.

**Layer proof obligations.** G-Colmez: primary period/height-linearity proof and odd-character analytic interface; the individual conjecture remains a predicate.


## CMH.1. Integral CM and total reflex families

**Inputs.** `AbelianSchemesAndArithmeticModuli:A4`; `AbelianSchemesAndArithmeticModuli:A5`; `ArakelovGeometryAndAbelianHeights:R35.3`; `ComplexMultiplicationAndExplicitReciprocity:CM.0`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.0`; `NeronModelsAndSemistableAbelianVarieties:R11.5`; `ReductiveGroupsPartII:RG2.0a`; `ShimuraData:D3`; `ShimuraVarieties:V4`; `ShimuraVarieties:V5`; `ShimuraVarieties:V8`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.

### The CM height torus

**Construction — `CMHeights.height_torus`.** Given a CM field E/F of degree 2d and an embedding ι₀:E→C, form T=Res_E G_m/ker(N_F/Q) and T_so=ker(N_E/F). The map z↦z/z̄ identifies T/(Res_F G_m/ker N_F/Q) with T_so. The kernel subtorus is identified with G_m by N_F/Q; the diagonal G_m→T instead has kernel μ_d. Character vectors of T have a_ι+a_cι independent of ι. The distinguished cocharacter selects ι₀ and has reflex norm the quotient Res_E G_m→T.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1, (3.1.1)–(3.1.2), pp. 415–416.

**Dependencies.** `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`; `ShimuraVarieties:V4`; `ShimuraData:D3`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`; `ReductiveGroupsPartII:RG2.0a`; `mathlib:NumberField.IsCMField`; `mathlib:NumberField.IsCMField.complexConj`; `mathlib:NumberField.IsCMField.complexConj_apply_apply`.

**Proof or construction.** 1. Use the existing quotient-torus and character-lattice equivalence. 2. Compute the annihilator of ker N_F/Q and the quotient by Res_F G_m. 3. Pair the distinguished cocharacter with each embedding character to determine its reflex norm.

**Uses.** CMH.1–CMH.4: Supplies the representation category and the height line on the zero-dimensional CM stack.

**API.**

- `CMHeights.height_torus.characters` (characterisation): Characters are exactly the embedding vectors with constant conjugate-pair sum.
- `CMHeights.height_torus.quotient` (universal-property): Maps from Res_E G_m annihilating ker N_F/Q factor uniquely through T.
- `CMHeights.height_torus.reflex_norm` (compatibility): The reflex norm attached to ι₀ is the quotient map.

**Checks.**

1. For d=1, T=Res_E G_m and the diagonal has trivial kernel.
2. For d=2, the diagonal factors through squaring on the kernel G_m and has kernel μ₂.
3. For any d, the vector supported on one embedding alone is not a T-character when d>1, whereas each CM-type characteristic vector is.

**Acceptance.** The torus has dimension d+1 and T_so has dimension d; the scalar-kernel map is distinguished from the diagonal.

### The compact integral level

**Definition — `CMHeights.integral_level`.** For each p let K_so,p be the image of (O_E⊗Z_p)× in (E⊗Q_p)×/(F⊗Q_p)×=T_so(Q_p). Define K₀,p to be the largest compact subgroup of T(Q_p) above K_so,p, equivalently Z_p×·r((O_E⊗Z_p)×), with Z_p× in the kernel G_m through the norm identification. Put K₀=∏pK₀,p. This is a compact open subgroup and need not be the maximal compact of T(A_f).

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.2, (3.2.1) and Proposition 3.2.1, pp. 416–417, with the corrected subgroup.

**Dependencies.** **The CM height torus**; `ShimuraVarieties:V4`.

**Proof or construction.** 1. Use the kernel G_m valuation to select its unit subgroup in the inverse image. 2. Check the local exact sequence 1→Z_p×→K₀,p→K_so,p→1. 3. At unramified p identify K₀,p with integral points of the unramified torus model. 4. Any local cohomology cokernel uses the norm from the product F⊗Q_p, not the direct sum of the individual norm quotients.

**Uses.** CMH.1 integral-model theorem: Makes inertia act trivially on the finite CM stack, unlike an arbitrary level.

**API.**

- `CMHeights.integral_level.membership` (characterisation): Membership is compactness in the kernel direction together with image in K_so,p.
- `CMHeights.integral_level.exact_sequence` (structure): The unit kernel and integral-unit quotient form the stated exact sequence.
- `CMHeights.integral_level.unramified` (compatibility): At p unramified in E this level is T(Z_p).

**Checks.**

1. For d=1 recover the unit subgroup (O_E⊗Z_p)×.
2. For E_p/F_p ramified quadratic, the uniformizer class in E_p×/F_p× has order two but is not in the image of O_E,p×; reject it from K_so,p.
3. At an unramified place, compare the constructor to the integral-point subgroup, including p=2.

**Acceptance.** The definition uses integral unit images, not all compact elements in T_so(Q_p).

### Finite étale CM models

**Theorem — `CMHeights.integral_cm_model`.** For compact open K⊂T(A_f), import the canonical finite étale CM stack Y_K/E with its Artin reciprocity action, and normalize Spec O_E in it. At every p with K_p=K₀,p this normalization is finite étale over O_E⊗Z_p. In particular Y₀=Y_K₀ is finite étale over O_E. For smaller levels no unramifiedness assertion is made.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1 and Proposition 3.2.1, pp. 416–417.

**Dependencies.** **The compact integral level**; `ShimuraVarieties:V4`; `ShimuraVarieties:V8`.

**Proof or construction.** 1. Apply the fixed arithmetic Artin map to the distinguished reflex norm. 2. Show local inertia lands in the K₀,p unit image. 3. Descend from a neat finite étale cover to the finite-inertia stack.

**Acceptance.** A prime where K_p is smaller retains a potentially ramified normalization.

### Integral polarized CM families

**Theorem — `CMHeights.polarized_family`.** A faithful rational T-representation H of Hodge types (−1,0),(0,−1), with a polarizing T-equivariant alternating form valued in the norm character and a K-stable integral adelic lattice, gives a polarized abelian scheme A_H over the normalized integral CM model Y_K. Its generic fiber is the supplied canonical-model family and its ℓ-adic Tate module over Y_K[1/ℓ] is the chosen lattice.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 3.4.1, pp. 419–420.

**Dependencies.** **The CM height torus**; **Finite étale CM models**; `AbelianSchemesAndArithmeticModuli:A4`; `AbelianSchemesAndArithmeticModuli:A5`; `ShimuraVarieties:V5`; `NeronModelsAndSemistableAbelianVarieties:R11.5`.

**Proof or construction.** 1. Apply the existing Siegel moduli comparison on the generic fiber. 2. At each local model inertia acts trivially on the prime-to-p representation after passing to the field defined by Y_K. 3. Use Néron–Ogg–Shafarevich and extension uniqueness, then descend to the stack.

**Acceptance.** The conclusion is extension over the whole normalized model, not an assertion that every smaller-level model is étale.

### The total reflex CM pair

**Construction — `CMHeights.total_reflex_pair`.** Let E♯ be the finite étale Q-algebra whose embedding Γ_Q-set is CM(E). Complementing a type is its CM involution, so E♯ is a product of CM fields of total degree 2^d. For a chosen ι₀, Φ♯ consists of the types containing ι₀ and has size 2^(d−1). Its T-representation H♯=E♯ has character pullback [Φ]↦Σ_{ι∈Φ}[ι]. Choose ξ∈E♯× with ξ̄=−ξ and Im ι_Φ(ξ)>0 for Φ containing ι₀; Tr(ξxȳ) polarizes H♯, giving an abelian scheme A♯/Y₀ of dimension 2^(d−1). Its maximal-order lattice is O_E♯.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.4, Proposition 3.4.2, pp. 420–421; §9.2, p. 510.

**Dependencies.** **The CM height torus**; **Finite étale CM models**; **Integral polarized CM families**; `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`; `ComplexMultiplicationAndExplicitReciprocity:CM.0/trace-reflex-field`; `ShimuraVarieties:V5`; `AbelianSchemesAndArithmeticModuli:A5`.

**Proof or construction.** 1. Use finite étale Galois descent on the finite set of CM types. 2. Use complement and the half-set containing ι₀ to define the CM algebra and type. 3. Use the CM-type character vectors to descend the T-action; weak approximation supplies ξ. 4. Apply the polarized-CM family theorem and extend by the good-reduction criterion.

**Uses.** CMH.3 determinant section and CMH.0 average: Packages all types into one CM family, including imprimitive types.

**API.**

- `CMHeights.total_reflex_pair.embeddings` (equivalence): The embedding set is Γ_Q-equivariantly CM(E).
- `CMHeights.total_reflex_pair.type` (characterisation): An embedding lies in Φ♯ exactly when its associated type contains ι₀.
- `CMHeights.total_reflex_pair.norm_characters` (compatibility): The total reflex representation pulls back each embedding character to its type sum.
- `CMHeights.total_reflex_pair.polarization` (structure): The trace pairing is alternating, nondegenerate and positive for the specified Hodge type.

**Checks.**

1. For an imaginary quadratic E, E♯=E and A♯ is an elliptic CM family.
2. For E=Q(i,√2), its four CM types split into two Galois orbits, giving E♯≅Q(i)×Q(√−2), not a quartic field.
3. When d=3, verify degree 8 and abelian dimension 4, and reject a pure-imaginary ξ with the wrong sign at one selected embedding.

**Acceptance.** A nontransitive CM-type Γ_Q-set yields a product algebra, with no forced field instance.

### Total reflex characters and heights

**Theorem — `CMHeights.reflex_average`.** The total reflex pair decomposes as the product of reflex pairs indexed by Γ_Q-orbits of CM(E). Its class function satisfies a⁰_(E♯,Φ♯)=(1/(2d))Σ_Φ a⁰_(E,Φ), hence h_Falt(E♯,Φ♯)=(1/(2d))Σ_Φ h_Falt(E,Φ). The latter follows from Colmez linearity and product additivity, not the individual Colmez conjecture.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 9.2.1, Proposition 9.3.2 and Corollary 9.3.3, pp. 510–512.

**Dependencies.** **The total reflex CM pair**; **CM-height invariance and Colmez linearity**; `ComplexMultiplicationAndExplicitReciprocity:CM.0/reflex-type`; `ArakelovGeometryAndAbelianHeights:R35.3/stable-height-properties`.

**Proof or construction.** 1. Match each Galois orbit with the embeddings of the corresponding reflex field. 2. Lift both members of each reflex pair to a common CM Galois closure and count inverse embeddings. 3. Apply the induction scaling and linear ht, then sum over product factors.

**Acceptance.** The coefficient is 1/(2d), not 2^(−d); the two coincide only accidentally in small degrees.

**Layer proof obligations.** Supplier torus/model/polarization contracts, plus G-Colmez for the total-reflex height identity.


## CMH.2. CM integral realizations

**Inputs.** `AbelianSchemesAndArithmeticModuli:A6`; `AutomorphicBundles:B1`; `AutomorphicBundles:B2`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.1`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`; `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`; `ShimuraData:D1`; `ShimuraVarieties:V8`.

### Local CM representations are crystalline

**Theorem — `CMHeights.local_crystalline`.** At q|p of E and a geometric point y of Y_K, every K_p-stable lattice N_p in an algebraic T_Qp-representation N gives a crystalline Q_p-representation of Γ_y. The reciprocity character factors through the image T_q of Res_Eq/Qp G_m, and restricting to K_q=K_p∩T_q(Q_p) recovers the same representation functor.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 3.5.2 and Remark 3.5.3, pp. 422–424.

**Dependencies.** **Finite étale CM models**; `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Proof or construction.** 1. Identify the inertia character with the unit character of local reciprocity in the fixed Artin convention. 2. Use the Lubin–Tate character and tensor, dual and direct-summand stability of crystalline representations. 3. Retain the finite-index subgroup Γ_y and the image torus rather than identifying it with Res_Eq G_m.

**Acceptance.** The representation is N_p,y[1/p]; the undefined symbol Λ in the printed proposition is not a new lattice.

### CM Breuil–Kisin comparison

**Theorem — `CMHeights.integral_bk_comparison`.** For N_p as above, the integral Breuil–Kisin module M(N_p,y) is tensor-compatible. For a local Eisenstein polynomial E_q(u), its crystalline realization is φ*M/uφ*M and its de Rham realization is φ*M/E_q(u)φ*M. These have the B_cris and filtered B_dR comparisons to N_p,y, compatibly with duals, tensors and changing the local CM representation. The cohomological realization of an abelian scheme uses the dual of its Tate module.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Corollary 3.5.4, pp. 424–425.

**Dependencies.** **Local CM representations are crystalline**; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Proof or construction.** 1. Apply the integral classification with its variance fixed. 2. Compute the two specializations of the Frobenius pullback and transfer the Hodge filtration. 3. Use the period comparisons for each tensor operation, including at p=2.

**Acceptance.** Specializing M itself in place of φ*M must fail the comparison check.

### Integral CM tensor torsor

**Theorem — `CMHeights.integral_tensor_torsor`.** Let D contain primes ramified in E and primes with K_p≠K₀,p. For a faithful polarized H and integral tensors with stabilizer T over Z[1/D], the tensor-preserving isomorphisms O⊗H_Z→H_dR form a T-torsor over Y_K[1/D]. The extended de Rham tensors are horizontal and independent of the chosen faithful realization. Their p-adic comparison with étale tensors uses compatibility with absolute Hodge cycles, not algebraicity of arbitrary Hodge cycles.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proof of Proposition 3.5.5, pp. 426–427; citing Blasius (1994) and Kisin (2010), Corollary 1.4.3.

**Dependencies.** **Integral polarized CM families**; **CM Breuil–Kisin comparison**; `AutomorphicBundles:B1`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Proof or construction.** 1. Import the absolute-Hodge p-adic comparison under request B1. 2. Apply the integral tensor-stabilizer theorem at unramified maximal-level primes. 3. Compare two faithful realizations inside their direct sum to show independence.

**Acceptance.** G-AbsoluteHodge records the unread primary theorem; no absolute-Hodge comparison is assumed proved by canonical-model descent alone.

### CM bundles and crystals

**Theorem — `CMHeights.integral_realizations`.** The generic tensor functor from T-representations to filtered de Rham bundles extends to integral lattices on Y_K. Its completions at y are the de Rham modules of the CM Breuil–Kisin comparison. At q where Y_K is étale over O_E, it also gives a compatible F-crystal with these crystalline fibers. For a polarized weight-one H, the resulting H_dR is the dual of H¹_dR(A_H/Y_K), with its dual Hodge filtration, and the crystals agree with the corresponding Dieudonné realization. At a geometric point y with residue field kbar, the pointwise crystalline realization is over W(kbar), using that geometric PD thickening.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 3.5.5(1)–(5), pp. 425–427.

**Dependencies.** **CM Breuil–Kisin comparison**; **Integral polarized CM families**; `AutomorphicBundles:B1`; `AutomorphicBundles:B2`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; **Integral CM tensor torsor**.

**Proof or construction.** 1. Construct away from bad primes by the tensor-preserving torsor. 2. Glue the local integral lattices using their rational comparison and uniqueness. 3. Identify weight-one realizations with abelian de Rham and crystalline cohomology through the imported comparison.

**Acceptance.** The global F-crystal assertion is restricted to the étale locus; the filtered integral bundle is global.

### Integral Hecke and torus actions

**Theorem — `CMHeights.cm_actions`.** The T-action on A_H is a faithful rational action T→Aut⁰(A_H)=(End(A_H)⊗Q)×, and level-changing Hecke isogenies extend over the integral CM models with compatible de Rham and crystalline realization maps. Integral endomorphisms and rational quasi-isogenies are distinguished. For the tautological H₀=E, the torus T_E acts by multiplication and the lattice is O_E.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 3.5.6, pp. 427–428.

**Dependencies.** **Integral polarized CM families**; **CM bundles and crystals**; `AbelianSchemesAndArithmeticModuli:A6`; `ShimuraVarieties:V8`; `AutomorphicBundles:B2`.

**Proof or construction.** 1. Descend the generic homomorphisms using the canonical CM family. 2. Extend over the good-reduction models and compare Tate modules. 3. Use the realization comparison to identify the extended actions.

**Acceptance.** The faithful rational T-action is not promoted to an integral automorphism action for every rational point.

### The standard CM quadratic line

**Definition — `CMHeights.standard_line`.** For H₀=E, let V₀={f∈End_Q(E):f(ax)=āf(x)}. Write f_a(x)=a x̄; then f_a∘f_a is multiplication by aā. This gives a rank-one E-module with hermitian form ⟨f_a,f_b⟩=a b̄, rational quadratic form Q₀(f_a)=Tr_F/Q(aā), and an integral lattice from O_E. Its filtered realization has Hodge line ω₀=Fil¹V₀,dR on Y₀. Equip this line with ||z||²=|[z,z̄]₀|, where [,]₀ is the bilinear form of Q₀. The absolute value is essential at the selected real place, where the value is positive.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.6, pp. 427–428; §9.4, p. 513, with the metric correction.

**Dependencies.** **Finite étale CM models**; **CM bundles and crystals**; `ShimuraData:D1`.

**Proof or construction.** 1. Identify a semilinear endomorphism by its value at 1. 2. Compute composition and polarize the norm to obtain the hermitian and rational forms. 3. Take the selected filtration line and use its nonzero hermitian value to define a positive metric.

**Uses.** CMH.3 determinant and CMH.4 orthogonal comparison: Supplies the metrized line whose arithmetic degree controls the CM height.

**API.**

- `CMHeights.standard_line.evaluate_one` (equivalence): Evaluation at 1 identifies V₀ with E, with inverse a↦f_a.
- `CMHeights.standard_line.square` (simp): f_a² is multiplication by aā; Q₀(f_a)=Tr_F/Q(aā).
- `CMHeights.standard_line.hodge_metric` (compatibility): The ω₀ metric equals the absolute bilinear value and scales by |λ|².

**Checks.**

1. For E=Q(i), f₁ is conjugation, f₁²=1, Q₀(f₁)=1.
2. For E=Q(i), f_i²=1, whereas the complex-linear multiplication-by-i map has square −1 and is excluded.
3. At the distinguished real place the positive bilinear value gives a positive norm; the printed negative sign fails this test.

**Acceptance.** The squared norm is positive on every nonzero Hodge vector.

### Tautological CM crystal

**Theorem — `CMHeights.tautological_crystal`.** At a geometric y over q|p, with W the Witt vectors of its algebraically closed residue field, the cohomological tautological crystal decomposes by primes q′|p of E. The q-factor is the Dieudonné crystal of the Lubin–Tate O_Eq-module, with the dual-Tate convention fixed above; every q′≠q factor is W⊗Zp O_Eq′ with Frobenius Fr⊗1. Applying conjugate-semilinear endomorphisms gives the corresponding decomposition of V₀,cris by primes of F.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.6, pp. 428–429, preceding Proposition 3.6.1.

**Dependencies.** **CM Breuil–Kisin comparison**; **The standard CM quadratic line**; `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Proof or construction.** 1. Apply the local reciprocity character to the q-factor. 2. Show inertia is trivial on the other factors and identify their unramified Frobenius. 3. Apply the tensor-compatible realization to conjugate-semilinear Hom.

**Acceptance.** The local decomposition includes factors not above q, rather than treating the whole representation as one Lubin–Tate character.

### Nonsplit CM crystals and supersingularity

**Theorem — `CMHeights.newton_and_nonsplit`.** The Newton cocharacter of a geometric CM fiber factors through T. For the distinguished prime 𝔭 of F under q, the Frobenius invariants in V₀,cris,𝔭 span its rational crystal exactly when 𝔭 is nonsplit in E. The associated polarized weight-one fibers A_H are supersingular exactly in that nonsplit case, with the nonzero faithful realization understood.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 3.6.1, Remark 3.6.2, Lemma 3.6.3 and Corollary 3.6.4, pp. 429–431.

**Dependencies.** **Tautological CM crystal**; **Integral Hecke and torus actions**; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`.

**Proof or construction.** 1. Average the CM cocharacter along the decomposition group to compute the Newton cocharacter. 2. Compute invariants in the semilinear q-factor and distinguish split and nonsplit cases. 3. Read the weight-one slopes through the faithful representation; all slopes are 1/2 precisely in the nonsplit case.

**Acceptance.** A split quadratic local algebra must not satisfy the full-invariant-span or supersingularity conclusion.

**Layer proof obligations.** G-AbsoluteHodge and the all-prime tensor-compatible BK comparison, including the étale-locus restriction.


## CMH.3. The total reflex determinant

**Inputs.** `ArakelovGeometryAndAbelianHeights:R35.1`; `ArakelovGeometryAndAbelianHeights:R35.2`; `ArakelovGeometryAndAbelianHeights:R35.3`; `AutomorphicBundles:B2`; `AutomorphicLFunctionsAndLocalFactors:AL.1`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.0`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.1`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.2`.

### Total reflex determinant section

**Construction — `CMHeights.determinant_section`.** Put r=2^(d−1) and H=H♯_dR. Clifford-style composition of ω₀ on H gives ω₀⊗gr⁻¹H→Fil⁰H, generically an isomorphism of rank r bundles. Its determinant is a canonical nonzero section Δ of L=ω₀^(−r)⊗det Fil⁰H⊗(det gr⁻¹H)⁻¹. Its zero divisor is effective and measures the integral failure of that map to be an isomorphism.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §9.4, equation (9.4.3), pp. 513–514.

**Dependencies.** **The total reflex CM pair**; **The standard CM quadratic line**; **CM bundles and crystals**; `ArakelovGeometryAndAbelianHeights:R35.1/stack-weighted-degree`.

**Proof or construction.** 1. Construct the action on the total reflex representation by type-character sums. 2. Pass to the Hodge graded pieces and take the determinant. 3. Use the generic character decomposition to prove nonvanishing.

**Uses.** CMH.3 local lengths and metrized identity: Converts integral action cokernels into a vertical arithmetic divisor.

**API.**

- `CMHeights.determinant_section.line` (structure): L is the stated tensor product with exponent −r.
- `CMHeights.determinant_section.section` (characterisation): Δ is the determinant of the ω₀ action on the indicated graded pieces.
- `CMHeights.determinant_section.base_change` (compatibility): Δ and its divisor commute with flat base change and finite étale level pullback.

**Checks.**

1. For d=1 the action is a map of lines and its determinant has exponent 1.
2. For d=3 verify exponent 4 rather than 8.
3. Over the generic splitting field each type coordinate is nonzero; after swapping the two Hodge pieces the inverse line is detected.

**Acceptance.** The determinant exponent is the abelian dimension r, not the rational rank 2r.

### Partition quotient over a DVR

**Definition — `CMHeights.dvr_partition`.** Let A be a complete characteristic-zero DVR with perfect residue field, B a finite product of complete DVRs finite flat over A with separable fraction fields, C a complete DVR A-algebra with perfect residue field containing all embeddings Υ_all:B→C, and M an invertible B-module. For Υ⊂Υ_all let K_Υ(M) be the kernel of M⊗A C→∏_{η∈Υ}(M⊗B,η C). Set M(Υ)=(M⊗A C)/(K_Υ(M)+K_Υc(M)). The module has finite C-length. Work factorwise after the maximal unramified decomposition; no global monogenic generator is assumed.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §9.4, Lemma 9.4.4, pp. 516–518.

**Dependencies.** `ArakelovGeometryAndAbelianHeights:R35.1/stack-weighted-degree`.

**Proof or construction.** 1. Define the two evaluation kernels as native submodules. 2. Over the fraction field the partition gives complementary summands, so the quotient is torsion. 3. Use local freeness of M to show finite presentation and finite length.

**Uses.** CMH.3 Artin-length theorem: Computes integral intersections between type and complementary-type summands.

**API.**

- `CMHeights.dvr_partition.kernel` (characterisation): Membership in K_Υ means vanishing at each η∈Υ.
- `CMHeights.dvr_partition.complement` (equivalence): M(Υ) and M(Υc) are canonically the same quotient.
- `CMHeights.dvr_partition.invertible_twist` (compatibility): Its length is invariant under replacing B by an invertible B-module M.

**Checks.**

1. For an empty part the quotient is zero.
2. For B=A×A and the two singleton parts the quotient is zero.
3. For B=A[√π] over a DVR of odd residue characteristic and C containing √π, the singleton partition has length v_C(2√π)>0.

**Acceptance.** Υ=∅ and Υ=Υ_all both give the zero module.

### Local conductor functional

**Definition — `CMHeights.local_conductor`.** For a finite quotient of Γ_Qp, define μ_p on complex class functions by linear extension of the Artin conductor exponent on irreducible characters. Extend to locally constant functions by normalized conjugacy averaging, compatibly with refining the quotient. For K/Q_p finite étale and Υ⊂Hom(K,P), set a_Υ(σ)=#(Υ∩σΥ); also let a_ηη′ be the indicator σ∘η=η′. This is a functional on locally constant functions, with no claim of boundedness on all continuous functions.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §9.4, p. 518, before Proposition 9.4.5.

**Dependencies.** `AutomorphicLFunctionsAndLocalFactors:AL.1`.

**Proof or construction.** 1. Expand in the finite character basis. 2. Use inflation compatibility of conductors to pass between quotients. 3. Average general locally constant functions before evaluating.

**Uses.** CMH.3 conductor-length and local total reflex computation: Translates the partition resultant into conductor and different exponents.

**API.**

- `CMHeights.local_conductor.character` (simp): μ_p(χ) is the Artin conductor exponent.
- `CMHeights.local_conductor.refinement` (compatibility): Inflation to a finer finite quotient preserves μ_p.
- `CMHeights.local_conductor.pair_sum` (characterisation): a_Υ=Σ_{η,η′∈Υ}a_ηη′.

**Checks.**

1. A trivial finite representation has conductor zero.
2. For a tamely ramified nontrivial quadratic character the exponent is 1, with no logarithm factor.
3. An arbitrary continuous function with no finite quotient is excluded from the domain.

**Acceptance.** The trivial character has conductor exponent zero.

### Corrected partition length

**Theorem — `CMHeights.partition_length`.** For the partition quotient, after decomposing B into local monogenic factors with integral generator π, length_C M(Υ)=Σ_{η∈Υ,η′∉Υ}v_C(ηπ−η′π). Equivalently it is half the full discriminant valuation minus the sums over unordered pairs within Υ and within Υc. Contributions between distinct unramified factors vanish. The formula is nonnegative and is unchanged by an invertible B-module twist.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Lemma 9.4.4, pp. 516–518, corrected final formula.

**Dependencies.** **Partition quotient over a DVR**.

**Proof or construction.** 1. Use a local generator of M and the Vandermonde evaluation matrix on each unramified factor. 2. Compute the resultant between the two partition polynomials and identify the quotient length. 3. Split the full discriminant product into its two within-part products and the cross product; correct the signs in the printed display.

**Acceptance.** A ramified quadratic singleton partition has positive length, while the reversed printed sign gives a negative number.

### Metrized determinant and trace volume

**Theorem — `CMHeights.volume_and_metric`.** Use the unscaled squared Hodge metric, the ω₀ absolute-value metric, and the volume metric on det H♯_dR dual to integration on top cohomology. The canonical Δ has norm 1, so in arithmetic Picard groups det H♯_dR=Δ+rω₀−2Ω♯. The trace-one top de Rham class η has |∫η|=(2π)^r; multiplying η by a unit u multiplies that absolute period by |σu|. Consequently deĝ(det H♯_dR)/deg_C Y₀=2^d d log(2π).

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proof of Theorem 9.4.2, pp. 515–516; Lemma 9.4.3 with corrected generator and period.

**Dependencies.** **Total reflex determinant section**; **The standard CM quadratic line**; `ArakelovGeometryAndAbelianHeights:R35.1/stack-weighted-degree`; `ArakelovGeometryAndAbelianHeights:R35.2/normalization-adapter`; `AutomorphicBundles:B2`.

**Proof or construction.** 1. Compute the archimedean determinant norm using the corrected positive metric; G-Metric is the required complete isometry check. 2. Use the de Rham trace isomorphism to select η rather than an arbitrary generator. 3. Compare the trace to Betti integration with (2πi)^r; dualize the volume line and sum over all 2d complex embeddings with stack weights.

**Acceptance.** A nontrivial unit generator changes the individual archimedean period; the normalized arithmetic degree remains the stated positive multiple of log(2π).

### Conductor values and positive lengths

**Theorem — `CMHeights.conductor_length`.** For K/Q_p a local field with maximal unramified K₀, splitting field P and e_P=v_P(p), μ_p(a_ηη)=v_P(η(d_K/Qp))/e_P. If η≠η′ agree on K₀, μ_p(a_ηη′)=−v_P(ηπ−η′π)/e_P; if they disagree on K₀ it is zero. Thus length_C M(Υ)=(e_P/2)(μ_p(a_Υ)+μ_p(a_Υc)), when C=O_P and B=O_K. Extend by unramified-factor additivity.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 9.4.5 and equation (9.4.7), pp. 518–519.

**Dependencies.** **Local conductor functional**; **Corrected partition length**; `AutomorphicLFunctionsAndLocalFactors:AL.1`.

**Proof or construction.** 1. Use the ramification-group formula for conductors of the embedding permutation representation. 2. Identify diagonal terms with the different and off-diagonal terms with conjugate-uniformizer distances. 3. Sum over the partition; combine the two diagonal discriminant sums and the corrected resultant formula.

**Acceptance.** For Q₃(√3) split over itself, the singleton length is 1, not −1; cross-unramified terms and the empty partition give zero.

### Local total reflex comparison

**Theorem — `CMHeights.local_total_reflex`.** For 𝔭|p in F put d_𝔭=[F_𝔭:Q_p], E_𝔭=E⊗F F_𝔭, and form its total reflex algebra from the local CM-type Galois set. Restriction CM(E)→CM(E_𝔭) has fibers 2^(d−d_𝔭). Its local total reflex character equals 2^(d_𝔭−2)(1+d_𝔭⁻¹Ind χ_𝔭), including split χ_𝔭=1. With the integral filtered identification of the total reflex graded pieces, this comparison gives length_q(Δ)=2^(d−2)v_q(d_F/Q).

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proof of Proposition 9.4.1, equations (9.4.8)–(9.4.13), pp. 519–521.

**Dependencies.** **The total reflex CM pair**; **Average CM character**; **CM bundles and crystals**; **Conductor values and positive lengths**.

**Proof or construction.** 1. Count choices away from 𝔭 and identify the local embedding Galois set. 2. Apply conductor-discriminant induction to the local averaged character. 3. Identify the integral graded action quotient with the partition quotient before transferring the character calculation; G-IntegralReflex is the activation gate.

**Acceptance.** The split local algebra is retained and gives its appropriate conductor contribution; the ramification normalization uses v_q on the actual integral base.

### Total reflex height and the standard line

**Theorem — `CMHeights.reflex_height_bridge`.** With all preceding integral and metric gates established, deĝ(Δ)/deg_C Y₀=2^(d−1)log D_F and deĝ(Ω♯)/deg_C Y₀=Σ_Φ h_Falt(E,Φ). Hence 2^(−d)Σ_Φ h_Falt(E,Φ)=deĝ(ω₀)/(4 deg_C Y₀)+(log D_F)/4−d log(2π)/2. These normalized degrees are unchanged by finite étale change of level.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 9.4.1, Theorem 9.4.2 and (9.4.4), pp. 514–516, 521.

**Dependencies.** **Local total reflex comparison**; **Metrized determinant and trace volume**; **Total reflex characters and heights**; `ArakelovGeometryAndAbelianHeights:R35.1/stack-weighted-degree`; `ArakelovGeometryAndAbelianHeights:R35.3/stable-faltings-height`.

**Proof or construction.** 1. Sum the local divisor lengths over O_E with stack weights. 2. Apply the height definition over all 2d embeddings, together with the total reflex height identity. 3. Solve the metrized determinant relation for deĝ Ω♯ and divide by 2^d.

**Acceptance.** The factor 2d is present in the height-degree conversion; no extra log(2π) is introduced by a second metric conversion.

**Layer proof obligations.** G-Metric and G-IntegralReflex; verify the positive local-length signs and the integral-to-metrized comparison.


## CMH.4. The orthogonal averaged-height route

**Inputs.** `AnalyticNumberTheory:AN.4`; `ArakelovGeometryAndAbelianHeights:R35.1`; `ArakelovGeometryAndAbelianHeights:R35.2`; `ArakelovGeometryAndAbelianHeights:R35.3`; `AutomorphicBundles:B2`; `ComplexMultiplicationAndExplicitReciprocity:CM.2`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.0`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.2`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.3`; `GeometryOfNumbersAndQuadraticArithmetic:GN.2`; `MetaplecticAutomorphicForms:MP.7`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

### Orthogonal Hodge-line degree adapter

**Theorem — `CMHeights.orthogonal_line_adapter`.** For the auxiliary quadratic space V=(E,Tr_F/Q(ξ x x̄)) of signature (2d−2,2), its maximal lattice L and CM cycle Y, compare the restricted orthogonal Hodge line ω with ω₀ on the CM model. The required normalized difference deĝ(ω|Y)/deg_C Y−deĝ(ω₀)/deg_C Y₀ is the discriminant correction log D_F, up to the explicitly supported bad-prime logarithms in Proposition 9.5.1. The comparison must use the actual filtered Hodge sublattices, not a false equality of full V-lattices.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 9.5.1, proof pp. 522–523; the full-lattice scaling assertion is corrected.

**Dependencies.** **The standard CM quadratic line**; **Total reflex height and the standard line**; `AutomorphicBundles:B2`.

**Proof or construction.** 1. Compare rational CM quadratic representations and the archimedean Hodge metrics. 2. Compute the integral filtered-line indices at each prime and normalize by the same stack degree. 3. Prove the required correction on Hodge lines; G-OrthogonalAdapter records the missing repair of the printed full-lattice step.

**Acceptance.** A global rescaling by an element of F need not solve all full-lattice norm equations; only a proved filtered-line degree identity activates this node.

### Auxiliary CM quadratic data

**Definition — `CMHeights.good_auxiliary`.** An auxiliary pair is a fractional O_E-ideal a and ξ∈F× negative at the distinguished real embedding and positive at all others. It is good at p when ξ·Nm_E/F(a)·d_F/Q is the unit ideal after localizing at p. A compatible maximal Z-lattice L⊂(E,Tr_F/Q(ξx x̄)) is good at p in the integral quadratic sense of Definition 5.3.3. The field trace is Tr_F/Q, because its argument lies in F.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §9.5, before Lemma 9.5.3, p. 524; Definition 5.3.3, pp. 451–452.

**Dependencies.** `ComplexMultiplicationAndExplicitReciprocity:CM.2/polarized-cm-lattice-data`; `GeometryOfNumbersAndQuadraticArithmetic:GN.2`.

**Proof or construction.** 1. Form the norm ideal and its local valuations. 2. Use the existing maximal quadratic-lattice notion, including the dyadic integral convention. 3. Separate goodness of the pair from goodness of a chosen maximal lattice.

**Uses.** CMH.4 auxiliary choice and prime elimination: Permits independent control of the local vertical-error support.

**API.**

- `CMHeights.good_auxiliary.good_at` (characterisation): Goodness at p is the vanishing of every local valuation of ξ Nm(a) d_F/Q over p.
- `CMHeights.good_auxiliary.principal_change` (compatibility): Replacing a by ua and ξ by ξ/Nm(u) preserves goodness and the quadratic space up to isometry.
- `CMHeights.good_auxiliary.signature` (structure): The trace form has signature (2d−2,2).

**Checks.**

1. For d=1 and a=O_E, ξ=−1, the signature is (0,2).
2. At a place where ξ Nm(a)d_F has valuation 1, reject goodness.
3. A positive ξ at every real place gives a positive definite form and fails the auxiliary signature condition.

**Acceptance.** Goodness is a local unit condition and survives multiplying a by a principal ideal with the corresponding inverse norm change in ξ.

### The imaginary quadratic average

**Theorem — `CMHeights.quadratic_classical`.** For d=1, E imaginary quadratic and either CM type, h_Falt(E,Φ)=−(L_f′/L_f)(0,χ_E)/2−log D_E/4−log(2π)/2. This is the classical Chowla–Selberg case in the unscaled metric. It supplies the degree-one branch where the signature and positive-complement argument of §9 is unavailable.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §1.1, p. 392, remark preceding Theorem A; the classical input is cited there.

**Dependencies.** `ArakelovGeometryAndAbelianHeights:R35.3/stable-faltings-height`; `ArakelovGeometryAndAbelianHeights:R35.2/normalization-adapter`; **CM class functions and analytic heights**; `AnalyticNumberTheory:AN.4`.

**Proof or construction.** 1. Import the classical CM elliptic period formula with its exact normalization. 2. Convert to the stable height using the specified unscaled squared metric. 3. Use conjugation invariance to obtain the same value for both types.

**Acceptance.** G-Classical records the primary period-formula proof not read in this run; the d≥2 proof is not asserted for d=1.

### Average height error on the CM cycle

**Theorem — `CMHeights.orthogonal_error`.** For d≥2 and admissible auxiliary L, choose a weakly holomorphic vector-valued form f of weight 1−n⋄/2 with integral principal part, c_f(0,0)≠0 and the proper-intersection condition of Hypothesis 8.3.1. The normalized average of h_Falt−h_Col equals [Ê⋄(f):Y]/(4 c_f(0,0) deg_C Y), modulo rational multiples of log p at the specified bad primes. The coefficient and all metric conversions are those of the unscaled height.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Theorem 8.3.4, pp. 507–508; Proposition 9.5.1, (9.5.1)–(9.5.3), pp. 521–523.

**Dependencies.** **Orthogonal Hodge-line degree adapter**; **Total reflex height and the standard line**; **Average CM character**; `ArakelovGeometryAndAbelianHeights:R35.1/stack-weighted-degree`.

**Proof or construction.** 1. Import the big-CM arithmetic Hodge-height identity, Theorem 8.3.4, from its orthogonal-height owner under G-GSpin. 2. Insert the total reflex height and analytic character identities. 3. Track the vertical error support and the nonzero constant term through the normalized intersection.

**Acceptance.** A form with c_f(0,0)=0 is inadmissible; bad-prime error terms are retained.

### Good data avoiding any finite prime set

**Theorem — `CMHeights.auxiliary_choice`.** For every finite set S of rational primes, auxiliary (a,ξ) and a compatible maximal L can be chosen good at every p∈S. In particular there are two choices with coprime bad-prime products. The arithmetic input is: Nm Cl(E)→Cl⁺(F) is surjective if E/F ramifies at a finite place, and otherwise has image ker χ_E/F. In the everywhere-finite-unramified case d is even and χ_E/F(d_F)=(-1)^(d/2).

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 9.5.2, Lemma 9.5.3 and Theorem 9.5.4, pp. 523–525.

**Dependencies.** **Auxiliary CM quadratic data**; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `GeometryOfNumbersAndQuadraticArithmetic:GN.2`.

**Proof or construction.** 1. Apply the narrow-class norm image theorem supplied by class field theory. 2. Use the different-character identity of Armitage to satisfy the sign obstruction in the unramified case. 3. Choose ideal representatives avoiding S, solve the sign condition and glue the prescribed local lattices to a global maximal lattice.

**Acceptance.** G-Armitage records the unread primary proof; coprimality of bad sets alone does not remove every vertical contribution.

### Eliminate each bad-prime coefficient

**Theorem — `CMHeights.prime_elimination`.** For d≥2, the average height discrepancy is zero. First put it in the Q-span of log p using two auxiliary choices with coprime bad sets. Then for each p choose p-good data, an embedding L⊂L⋄ with L⋄ self-dual at p and rank-two positive complement Λ, and a form f with nonzero constant term and negative support avoiding numbers represented by Λ_Q. Its vertical error divisor avoids the p-fiber. Unique factorization makes the rational log-prime coefficients independent, so each coefficient vanishes.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Theorem 9.5.5 and Theorem 9.5.6, pp. 525–526.

**Dependencies.** **Average height error on the CM cycle**; **Good data avoiding any finite prime set**; `MetaplecticAutomorphicForms:MP.7`.

**Proof or construction.** 1. Compare the two supported expressions to get a global rational log-prime expansion. 2. Use classification of quadratic spaces to select the p-self-dual enlargement. 3. Apply prescribed-support Borcherds input and its good-prime divisor formula, then read off the p coefficient.

**Acceptance.** The proper-intersection and support hypotheses, p-self-duality, and c_f(0,0)≠0 are all necessary inputs; G-Borcherds leaves their supplier proof explicit.

**Layer proof obligations.** G-OrthogonalAdapter, G-GSpin, G-Armitage, G-Borcherds and G-Classical; the pending GSpin proposal has no accepted stage id.


## CMH.5. Component heights and nearby types

**Inputs.** `ArakelovGeometryAndAbelianHeights:R35.2`; `ArakelovGeometryAndAbelianHeights:R35.3`; `ArakelovGeometryAndAbelianHeights:R35.4`; `ComplexMultiplicationAndExplicitReciprocity:CM.0`; `ComplexMultiplicationAndExplicitReciprocity:CM.2`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.0`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

### CM component-height invariance

**Theorem — `CMHeights.component_invariance`.** For maximal-order CM abelian varieties A,B with the same field E and type Φ, h(A,τ)=h(B,τ) for each τ∈Φ, using the imported torsion-free determinant line and its Hodge metric. Thus write h(Φ,τ). The assertion includes isogenous integral lattices and conjugation of the type; it does not assert invariance of arbitrary non-CM partial heights.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Theorem 2.2, pp. 544–546.

**Dependencies.** `ArakelovGeometryAndAbelianHeights:R35.4/component-line-height`; `ArakelovGeometryAndAbelianHeights:R35.4/component-isogeny-formula`; `ComplexMultiplicationAndExplicitReciprocity:CM.2/arbitrary-dimensional-classification`; **CM-height invariance and Colmez linearity**; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Proof or construction.** 1. Connect the lattices by O_E-ideal isogenies and use the local rank-one CM p-divisible module. 2. Compute each local component cokernel for the isogeny and its dual. 3. Pair embeddings under complex conjugation in the sum over all p-adic embeddings; do not use a single conjugation element simultaneously at all p-adic places.

**Acceptance.** The determinant convention is unchanged from R35.4; local freeness required by its isogeny formula must be established, not inferred from a nonflat tensor quotient.

### CM height decomposition

**Theorem — `CMHeights.height_decomposition`.** For a CM type Φ, let E_Φ be its trace reflex field and d_Φ, d_Φc the absolute norms over E_Φ of the relative discriminants of the selected and complementary reflex orders. Then h_YZ(Φ)−Σ_{τ∈Φ}h(Φ,τ)=−log(d_Φ d_Φc)/(4[E_Φ:Q]). Taking all 2^g types, their averaged discriminant correction is −log D_F/4.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Theorem 2.3, pp. 546–548; proof of Corollary 2.6, pp. 548–549.

**Dependencies.** **CM component-height invariance**; `ComplexMultiplicationAndExplicitReciprocity:CM.0/reflex-order`; `ArakelovGeometryAndAbelianHeights:R35.4/cm-hodge-filtration-local`; `ArakelovGeometryAndAbelianHeights:R35.3/stable-faltings-height`; `ArakelovGeometryAndAbelianHeights:R35.2/normalization-adapter`.

**Proof or construction.** 1. Work over each actual local factor of O_E⊗O_σ and use the filtered rank-one CM module. 2. Compute the determinant of the embedding-evaluation map as a Vandermonde discriminant. 3. Sum local lengths and embeddings with the exact reflex degree; use the conjugate-pair discriminant factorization for the type average.

**Acceptance.** Local monogenic generators are chosen after the permitted unramified extension on each factor; O_E⊗Z_p is not assumed globally monogenic. G-CMHodge records the underlying primary comparison leaf.

### Nearby CM types and their height

**Definition — `CMHeights.nearby_height`.** Two types Φ₁,Φ₂ of a degree-2g CM field are nearby when their symmetric difference is {τ₁,τ₂}, with τ₂=cτ₁. For the unordered edge {Φ₁,Φ₂} set h_near=(h(Φ₁,τ₁)+h(Φ₂,τ₂))/2. Every type has g neighbors and the type cube has g·2^(g−1) unordered edges.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §2.2, p. 548; §1.2, p. 537.

**Dependencies.** `ComplexMultiplicationAndExplicitReciprocity:CM.0/cm-type`; **CM component-height invariance**.

**Proof or construction.** 1. Identify a type with one choice in each conjugate embedding pair. 2. Define adjacency by flipping precisely one pair. 3. Check swapping endpoints exchanges the two summands and preserves the value.

**Uses.** CMH.6 corrected isogeny comparison and CMH.7 quaternion bridge: Replaces the average of total heights by a sum of controlled neighboring component heights.

**API.**

- `CMHeights.nearby_height.distinguished_pair` (characterisation): Nearby endpoints have a unique changed conjugate pair.
- `CMHeights.nearby_height.swap` (simp): h_near is invariant under swapping endpoints.
- `CMHeights.nearby_height.edge_count` (structure): There are g·2^(g−1) unordered edges and degree g at each vertex.

**Checks.**

1. For g=1 the two complementary types form one edge.
2. For g=2 there are four vertices and four unordered edges, not eight.
3. For g=2 opposite vertices have symmetric difference of size four and fail adjacency.

**Acceptance.** Edges are counted once; nearby does not mean disjoint unless g=1.

### Average over nearby types

**Theorem — `CMHeights.cube_average`.** For g≥1, 2^(−g)Σ_Φ h_YZ(Φ)=2^(1−g)Σ_{unordered nearby edges}h_near−log D_F/4. Each component h(Φ,τ) occurs once as an endpoint contribution of an edge, and each edge height contains the factor 1/2.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Corollary 2.6, pp. 548–549.

**Dependencies.** **Nearby CM types and their height**; **CM height decomposition**.

**Proof or construction.** 1. Sum endpoint contributions over the type cube. 2. Use the discriminant correction in the height decomposition. 3. Divide by 2^g and check the endpoint factor two.

**Acceptance.** For g=1 the coefficient on its single edge is 1 and D_F=1.

**Layer proof obligations.** G-CMHodge and the ramified component convention; use the norm-product repair and factorwise monogenicity.


## CMH.6. Corrected different-torsion comparison

**Inputs.** `AbelianSchemesAndArithmeticModuli:A6`; `ArakelovGeometryAndAbelianHeights:R35.3`; `ArakelovGeometryAndAbelianHeights:R35.4`; `ComplexMultiplicationAndExplicitReciprocity:CM.2`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.5`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `HilbertModularVarietiesAndShimuraCurves:R18.1`; `HilbertModularVarietiesAndShimuraCurves:R18.5`; `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`.

### Different-torsion graph datum

**Definition — `CMHeights.different_graph_datum`.** For nearby types and a finite Galois number field K/Q containing the chosen E, take O_E-abelian varieties A₁,A₂,A with good reduction over O_K, A_i of type Φ_i. A different-graph datum is an O_E-isogeny f:A₁×A₂→A whose kernel is the graph of a specified O_E-isomorphism A₁[δ_E/F]→A₂[δ_E/F]. The different δ_E/F is an ideal, so ideal torsion is used without choosing a global generator.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Author revision dated 18 December 2022, 11 pages; journal erratum Annals 198 (2023), 867–878 not collated](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf), Erratum, §1, Theorem 1, pp. 1–2.

**Dependencies.** **Nearby CM types and their height**; `ComplexMultiplicationAndExplicitReciprocity:CM.2/arbitrary-dimensional-classification`; `AbelianSchemesAndArithmeticModuli:A6`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Proof or construction.** 1. Use the existing finite flat ideal-torsion and isogeny kernels. 2. Record the two injective projections and their images as part of the graph condition. 3. Distinguish the generic graph from its integral closure, whose extension is a theorem below.

**Uses.** CMH.6 corrected nearby identity: Pins the hypothesis that replaces the false unrestricted Theorem 2.7.

**API.**

- `CMHeights.different_graph_datum.kernel` (characterisation): Ker f equals the graph of the specified ideal-torsion isomorphism.
- `CMHeights.different_graph_datum.projections` (equivalence): Both kernel projections identify the kernel with the respective different-torsion group.
- `CMHeights.different_graph_datum.base_change` (functoriality): The datum pulls back to every finite extension preserving the O_E-actions.

**Checks.**

1. If δ_E/F is the unit ideal, both ideal-torsion groups and the graph kernel are zero.
2. An arbitrary nonzero multiplication-by-n kernel is rejected unless it equals the required graph.
3. At a ramified quadratic local place the two projection images equal δ⁻¹Λ_i/Λ_i, not all n-torsion for an unrelated n.

**Acceptance.** The datum is strictly stronger than merely requiring A to be O_E-isogenous to A₁×A₂.

### CM torsion comparison modulo the different

**Theorem — `CMHeights.cm_kisin_torsion`.** For CM types Θ₁,Θ₂, the rank-one CM Breuil–Kisin modules over S⊗O_E have Frobenius multipliers given by the complementary-type Eisenstein products. Modulo δ_E/F these multipliers agree when the type is changed by conjugate-pair flips, since x−x̄ lies in δ_E/F. The resulting different-torsion group schemes are O_E-isomorphic, and every O_E-linear automorphism of their constant generic fiber extends over the valuation ring. This is valid also at p=2.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Author revision dated 18 December 2022, 11 pages; journal erratum Annals 198 (2023), 867–878 not collated](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf), Erratum, §2, Theorem 2 and Propositions 4–5, pp. 3–9.

**Dependencies.** **Different-torsion graph datum**; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`.

**Proof or construction.** 1. Apply the CM Kisin description of Propositions 4 and 5 with its coefficient embeddings and Frobenius variance fixed. 2. Reduce the type factors modulo the different and construct the integral module isomorphism. 3. Lift unit automorphisms of O_E/δ by the integral module action; use the full finite-flat classification including dyadic places.

**Acceptance.** Existence of one integral isomorphism is insufficient: the specified generic graph requires the automorphism-extension assertion. G-CMKisin records the imported primary classification proof.

### The actual quaternionic graph kernel

**Theorem — `CMHeights.quaternion_graph`.** For B=E+Ej, jx=x̄j, a maximal O_B containing O_E and with no finite place ramified in both B and E, set Λ₁=O_E, Λ₂=Ej∩O_B and Λ₀=O_B. The induced isogeny from the two nearby CM complex tori to (V₁⊕V₂)/Λ₀ has kernel Λ₀/(Λ₁+Λ₂), with both projections identifying it with δ_E/F⁻¹Λ_i/Λ_i. At a division prime B, E/F is unramified and the kernel is zero. At a split prime the graph is generated by (π−π̄)⁻¹(1−j_p) after a compatible local presentation.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Author revision dated 18 December 2022, 11 pages; journal erratum Annals 198 (2023), 867–878 not collated](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf), Erratum, §1, pp. 2–3; citing Vignéras, Ch. II, Theorem 3.2, p. 44.

**Dependencies.** **Different-torsion graph datum**; `ComplexMultiplicationAndExplicitReciprocity:CM.2/polarized-cm-lattice-data`; `ComplexMultiplicationAndExplicitReciprocity:CM.2/arbitrary-dimensional-classification`; `HilbertModularVarietiesAndShimuraCurves:R18.1`; `HilbertModularVarietiesAndShimuraCurves:R18.5`.

**Proof or construction.** 1. At split places identify O_B with End_OF(O_E) using the integral order, not just a compact subgroup. 2. Calculate the intersection with E and Ej and the two quotient projections. 3. At division places use unramifiedness of E/F and δ=1 locally; assemble the finite ideal-torsion graph.

**Acceptance.** The calculation includes split dyadic residue-field-F₂ places; G-QuaternionOrders records the unread primary maximal-order input.

### Integral graph kernel and self-duality

**Theorem — `CMHeights.integral_graph`.** After enlarging K to make the relevant different torsion constant, the finite flat kernel Q of the extended graph isogeny has both projections isomorphic to the integral A_i[δ_E/F] at every finite place. Thus it is the integral graph of the specified generic isomorphism. It is O_E-linearly isomorphic to its Cartier dual; the O_E-action factors through O_E/δ_E/F, where conjugation is trivial.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Author revision dated 18 December 2022, 11 pages; journal erratum Annals 198 (2023), 867–878 not collated](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf), Erratum, §3, display (5) and proof, pp. 10–11.

**Dependencies.** **CM torsion comparison modulo the different**; **Different-torsion graph datum**; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; `AbelianSchemesAndArithmeticModuli:A6`.

**Proof or construction.** 1. Extend the generic isomorphism, using extension of its automorphism difference from a chosen integral one. 2. Identify the graph closure with the kernel by finite-flat uniqueness. 3. Apply the CM torsion comparison to A₁ and its dual, with conjugate type, to obtain self-duality.

**Acceptance.** No exact sequence of arbitrary Néron models is presumed from a generic isogeny.

### Ramified component determinant cancellation

**Theorem — `CMHeights.relative_determinant_cancellation`.** If f:A→B is an O_E-isogeny of good-reduction abelian varieties with kernel Q O_E-linearly self-dual and with conjugation acting trivially on its O_E-action, the desired equality is h(A,τ)=h(B,τ) for the relative O_F component determinant. At places ramified in F/Q this requires a comparison of the relative/image Hodge pieces and their determinant lengths with the paper’s raw τ-quotients. Self-duality alone does not make tensoring with O_K along τ exact or make those quotients locally free.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Author revision dated 18 December 2022, 11 pages; journal erratum Annals 198 (2023), 867–878 not collated](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf), Erratum, §3, Proposition 6 and proof, pp. 9–10; original Proposition 5.4, pp. 573–574.

**Dependencies.** **Integral graph kernel and self-duality**; `ArakelovGeometryAndAbelianHeights:R35.4/component-line-height`; `ArakelovGeometryAndAbelianHeights:R35.4/component-isogeny-formula`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Proof or construction.** 1. Apply the existing component-isogeny formula at places where all four quotients are locally free. 2. At ramified places construct the relative Dieudonné or Breuil–Kisin determinant comparison and prove its compatibility with Cartier duality. 3. Cancel the dual kernel lengths only after the comparison. G-RamifiedComponent is the unsupplied step in Proposition 6.

**Acceptance.** The target remains blocked by G-RamifiedComponent at ramified F/Q; no proof closure is claimed from the displayed tensor sequence.

### Corrected nearby-height identity

**Theorem — `CMHeights.corrected_nearby`.** For a different-graph datum, h_near(Φ₁,Φ₂)=(h(A₁,τ₁)+h(A₂,τ₂))/2=h(A,τ)/2, where A is viewed with its O_F-action and τ is the changed place of F. The target uses the integral graph and the proven relative determinant comparison at every finite place. It does not apply to a general O_E-isogenous A.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Author revision dated 18 December 2022, 11 pages; journal erratum Annals 198 (2023), 867–878 not collated](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf), Erratum, Theorem 1, p. 2; §3 proof, pp. 10–11.

**Dependencies.** **Different-torsion graph datum**; **Integral graph kernel and self-duality**; **Ramified component determinant cancellation**; **Nearby CM types and their height**; `ArakelovGeometryAndAbelianHeights:R35.3/stable-height-properties`.

**Proof or construction.** 1. Use product additivity to identify the component height on A₁×A₂. 2. Use the integral graph’s self-duality and conjugation-trivial action. 3. Apply the relative determinant cancellation, including its ramified comparison gate.

**Acceptance.** G-RamifiedComponent propagates here; the original Theorem 2.7 is explicitly excluded.

**Layer proof obligations.** G-CMKisin, G-RamifiedComponent, G-QuaternionOrders and G-ErratumEdition; prove the specified integral graph, not only existence of some torsion isomorphism.


## CMH.7. Quaternionic CM points and Hodge lines

**Inputs.** `AnalyticNumberTheory:AN.4`; `ArakelovGeometryAndAbelianHeights:R35.1`; `ArakelovGeometryAndAbelianHeights:R35.4`; `AutomorphicBundles:B4`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.5`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.6`; `HilbertModularVarietiesAndShimuraCurves:R18.1`; `HilbertModularVarietiesAndShimuraCurves:R18.2`; `HilbertModularVarietiesAndShimuraCurves:R18.5`; `PELModuli:M5`; `ShimuraVarieties:V4`.

### Existence of the auxiliary quaternion datum

**Theorem — `CMHeights.auxiliary_quaternion`.** For every CM E/F of degree 2g there is a totally definite incoherent quaternion algebra 𝔹/A_F admitting A_E→𝔹, with at least two ramified places, no finite place ramified in both E and 𝔹, and a maximal finite adelic order containing Ô_E. Choose finite inert S with g+|S| odd and ≥3: S=∅ for odd g≥3, |S|=1 for even g, and |S|=2 for g=1. Put U=Ô_𝔹×. For each real τ, switching its invariant gives the coherent curve algebra B(τ).

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §1.1–1.2, pp. 536–537; existence is implicit in the deduction of Theorem 1.1.

**Dependencies.** `HilbertModularVarietiesAndShimuraCurves:R18.1`; `HilbertModularVarietiesAndShimuraCurves:R18.2`; `AnalyticNumberTheory:AN.4`.

**Proof or construction.** 1. Use Chebotarev to choose enough inert primes outside the finite ramification set. 2. Use the local embedding criterion and odd parity to form the incoherent datum. 3. Embed the integral order locally into maximal orders and take their finite adelic product.

**Acceptance.** For g=1 two inert finite primes are necessary for this compact setup; containment of Ô_E in the order is stronger than containment of its unit group in a maximal compact.

### Quaternionic CM point and height

**Definition — `CMHeights.quaternion_point_height`.** For this datum let X=lim_U X_U with right 𝔹_f×-action. A CM point is P∈X fixed by E× through the chosen embedding. Its image P_U lies in X_U(E^ab). Restrict the metrized Hodge bundle L̄_U to the Zariski closure P̄_U in the integral curve model and put h_L(P_U)=deĝ(L̄_U|P̄_U)/[F(P_U):F]. The archimedean metric is ||dz||=2 Im z. The value is independent of P because the CM points form one reciprocity orbit.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §1.2–1.3, pp. 537–539; Theorem 4.7 for the Hodge line, pp. 566–568.

**Dependencies.** **Existence of the auxiliary quaternion datum**; `ShimuraVarieties:V4`; `HilbertModularVarietiesAndShimuraCurves:R18.2`; `ArakelovGeometryAndAbelianHeights:R35.1/stack-weighted-degree`; `AutomorphicBundles:B4`.

**Proof or construction.** 1. Use the integral curve and canonical CM-point orbit from the curve and reciprocity owners. 2. Restrict the actual Hodge line with its Petersson metric. 3. Use field-degree and arithmetic-degree functoriality to show level and Galois compatibilities.

**Uses.** CMH.7 height bridge and CMH.8 quaternionic height: Connects the corrected CM family comparison to arithmetic self-intersection.

**API.**

- `CMHeights.quaternion_point_height.reciprocity` (functoriality): The Galois action on P_U is the fixed Artin action on the actual CM-point orbit.
- `CMHeights.quaternion_point_height.degree` (characterisation): The height is the indicated degree divided by [F(P_U):F].
- `CMHeights.quaternion_point_height.metric` (compatibility): The analytic Hodge metric is ||dz||=2 Im z and pulls back along the permitted level maps.

**Checks.**

1. An extension of the field of definition multiplies both degree and denominator by the same amount.
2. When [F:Q]>1, replacing the denominator by [F(P_U):Q] changes the value by 1/[F:Q] and is rejected.
3. For z=i and local section dz the norm is 2, not 1.

**Acceptance.** The denominator is relative to F; absolute height conventions must be converted explicitly.

### CM and quaternionic Hodge lines

**Theorem — `CMHeights.quaternion_hodge_comparison`.** For the CM abelian variety A₀ over a good-reduction field K represented by the auxiliary PEL CM point, let N̄(A₀,τ) use the relative/image O_F Hodge determinants. Define N̄_U=L̄_U²(−d_𝔹). The target is an isometry N̄(A₀,τ)≅N̄_U|P̄_U⊗O_K. It includes the integral Kodaira–Spencer comparison at every prime and the complex Hodge/Petersson isometry; identifying raw ramified τ-quotients is a separate required theorem.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Proposition 5.7, p. 577; Proposition 5.5, pp. 574–576.

**Dependencies.** **Quaternionic CM point and height**; **Ramified component determinant cancellation**; `ArakelovGeometryAndAbelianHeights:R35.4/component-line-height`; `HilbertModularVarietiesAndShimuraCurves:R18.2`; `HilbertModularVarietiesAndShimuraCurves:R18.5`; `AutomorphicBundles:B4`; `PELModuli:M5`.

**Proof or construction.** 1. Use the PEL family and integral Kodaira–Spencer map. 2. Identify determinants at unramified places and prove the ramified relative/image comparison at the remaining places. 3. Compare the complex metric on dz and the determinant Hodge metric, tracking the finite discriminant twist.

**Acceptance.** G-IntegralKS records the ramified comparison missing from the printed quotient argument.

### Average height from the quaternionic point

**Theorem — `CMHeights.quaternion_height_bridge`.** For maximal order U containing Ô_E as above, 2^(−g)Σ_Φ h_YZ(Φ)=h_L(P_U)/2−log(d_𝔹 D_F)/4. This uses the corrected nearby theorem only on the actual quaternionic graph kernels and includes the integral relative Hodge-line gates.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Theorem 1.6, p. 537; proof §5.3, pp. 576–577, with Erratum Theorem 1 replacing Theorem 2.7.

**Dependencies.** **Average over nearby types**; **The actual quaternionic graph kernel**; **Corrected nearby-height identity**; **CM and quaternionic Hodge lines**.

**Proof or construction.** 1. For each nearby edge use its coherent B(τ) and the actual maximal-order graph. 2. Replace its nearby height by half the component height of the PEL family. 3. Use the Hodge-line isometry and sum over the g distinguished real places, then insert the cube-average correction.

**Acceptance.** G-RamifiedComponent and G-IntegralKS both propagate; an arbitrary isogenous A cannot replace the quaternionic family.

**Layer proof obligations.** G-IntegralKS and propagated G-RamifiedComponent/G-QuaternionOrders; establish the actual quaternionic family and line isometry.


## CMH.8. Quaternionic self-intersection and adjunction

**Inputs.** `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.7`; `GrossZagierAndArithmeticHeights:GZ.0`; `GrossZagierAndArithmeticHeights:GZ.2`; `GrossZagierAndArithmeticHeights:GZ.6`; `GrossZagierAndArithmeticHeights:GZ.7`; `HilbertModularVarietiesAndShimuraCurves:R18.5`.

### Modified CM self-intersection

**Theorem — `CMHeights.modified_self_intersection`.** For the compact maximal-order quaternionic datum, e=[O_E×:O_F×] and the precise modified arithmetic self-intersection i₀ of §8, i₀(P,P)/e=(L_f′/L_f)(0,χ_E/F)+(1/2)log(d_E/F/d_𝔹). The modification, Green function, finite local lengths and unit factors use the imported Gross–Zagier normalization; i₀ is not the raw intersection of a horizontal divisor with itself.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Theorem 9.1, pp. 624–628; §1.3, pp. 539–541 explains the kernel comparison.

**Dependencies.** **Quaternionic CM point and height**; `GrossZagierAndArithmeticHeights:GZ.0`; `GrossZagierAndArithmeticHeights:GZ.2`; `GrossZagierAndArithmeticHeights:GZ.6`; `GrossZagierAndArithmeticHeights:GZ.7`.

**Proof or construction.** 1. Import analytic derivative and geometric height kernels, with the degenerate terms retained in their test-function class. 2. Compare their pseudo-theta expansions and use automorphy to isolate the dimension-zero term. 3. Compute its local Whittaker and intersection terms, retaining e and both discriminants.

**Acceptance.** G-YZKernels records the precise primary-proof obligations for the noncuspidal/degenerate terms; a cuspidal Gross–Zagier formula alone is insufficient.

### Arithmetic adjunction for the CM point

**Theorem — `CMHeights.arithmetic_adjunction`.** For the same datum and the same i₀, i₀(P,P)/e=−h_L(P_U). Prove arithmetic adjunction on the actual integral curve model with the required vertical correction and invariant local lift at ramified CM places; neither global étaleness of the CM section nor absence of vertical terms is assumed.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Theorem 9.3 and §9.2, pp. 629–635; setup pp. 629–631.

**Dependencies.** **Quaternionic CM point and height**; `GrossZagierAndArithmeticHeights:GZ.2`; `GrossZagierAndArithmeticHeights:GZ.7`; `HilbertModularVarietiesAndShimuraCurves:R18.5`.

**Proof or construction.** 1. Use the imported admissible arithmetic pairing and the local conormal/different description. 2. Compute the archimedean adjunction isometry with ||dz||=2 Im z. 3. Compute finite and ramified vertical corrections and match the modified intersection, including the e factor.

**Acceptance.** G-Adjunction records unread detailed ramified calculations; the local CM closure can be ramified.

### Height of the quaternionic CM point

**Theorem — `CMHeights.quaternion_height`.** For the constructed compact maximal-order datum, h_L(P_U)=−(L_f′/L_f)(0,χ_E/F)+(1/2)log(d_𝔹/d_E/F). The value is independent of the chosen CM point and compatible with the integral Hodge-line convention above.

**Source.** [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Theorem 1.7, p. 539; Theorems 9.1 and 9.3, pp. 624–635.

**Dependencies.** **Modified CM self-intersection**; **Arithmetic adjunction for the CM point**.

**Proof or construction.** 1. Use adjunction to replace i₀/e by −h_L. 2. Substitute the modified self-intersection identity. 3. Reverse both signs and check the discriminant quotient.

**Acceptance.** For the height bridge the d_𝔹 terms cancel exactly, regardless of the chosen auxiliary finite inert set.

**Layer proof obligations.** G-YZKernels and G-Adjunction, with all noncuspidal, ramified and vertical correction terms.


## CMH.9. The shared averaged Colmez formula

**Inputs.** `ArakelovGeometryAndAbelianHeights:R35.2`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.0`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.4`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.7`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.8`.

### The averaged Colmez formula

**Theorem — `CMHeights.averaged_colmez`.** For every maximal-order CM field E/F with [F:Q]=g≥1, averaging over all 2^g types gives 2^(−g)Σ_Φ h_Falt(E,Φ)=−(L_f′/L_f)(0,χ_E/F)/2−log(D_E/D_F)/4−g log(2π)/2. Equivalently in the Yuan–Zhang metric the last term is absent. Imprimitive types are included. The individual Colmez conjecture is neither assumed nor proved.

**Source.** [Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera — Annals 187 (2018), 391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), AGHMP Theorem A, p. 392 and Theorem 9.5.5, pp. 525–526; Yuan–Zhang Theorem 1.1, p. 535; [Xinyi Yuan; Shou-Wu Zhang — Annals 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Theorem 1.1, p. 535; corrected proof with Erratum Theorem 1.

**Dependencies.** **Average CM character**; **Eliminate each bad-prime coefficient**; **The imaginary quadratic average**; **Average height from the quaternionic point**; **Height of the quaternionic CM point**; `ArakelovGeometryAndAbelianHeights:R35.2/normalization-adapter`.

**Proof or construction.** 1. Route A: for g≥2 use prime-by-prime error elimination and the analytic average; for g=1 use the classical case. 2. Route Y: insert the quaternionic height into its bridge, cancel d_𝔹 and use d_E/F·D_F=D_E/D_F. 3. Convert metrics once by h_YZ=h_Falt+g log(2π)/2. Either route proves the shared target; the graph records both planning obligations, not a need to prove both to use the result.

**Acceptance.** All types are counted; the logarithmic term has the unscaled-metric sign and factor. Source gates remain open on each proof route.

**Layer proof obligations.** Activate either complete proof route: orthogonal route gates from CMH.3–4 or corrected quaternionic route gates from CMH.5–8. Both are planned; neither is source-closed.


## CMH.10. Individual height bounds and distant isogenies

**Inputs.** `AnalyticNumberTheory:AN.4`; `ArakelovGeometryAndAbelianHeights:R35.6`; `AutomorphicLFunctionsAndLocalFactors:AL.1`; `ComplexMultiplicationAndExplicitReciprocity:CM.0`; `ComplexMultiplicationAndExplicitReciprocity:CM.2`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.0`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.9`.

### Relative CM class-number growth

**Theorem — `CMHeights.relative_class_number`.** For every g≥1 and ε>0 there is C_g,ε>0 such that h_E/h_F≥C_g,ε D_E^(1/4−ε) for all degree-2g CM fields E/F. Class numbers are those of maximal orders. The constants may be ineffective. The CM regulator ratio is bounded above and below in terms of g using the unit index 1 or 2; it is not generally 1.

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), §2.2, p. 382.

**Dependencies.** `AnalyticNumberTheory:AN.4`; `mathlib:NumberField.IsCMField.regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`; `mathlib:NumberField.classNumber_pos`; `mathlib:NumberField.IsCMField.indexRealUnits_eq_one_or_two`.

**Proof or construction.** 1. Apply the fixed-degree Brauer–Siegel bounds to h_E R_E and h_F R_F. 2. Cancel the regulators using the CM unit-index formula and bounded roots of unity. 3. Use D_E=D_F² N(d_E/F)≥D_F², select smaller error exponents and absorb the bounded range.

**Acceptance.** The exponent is every value below 1/4, with uniform dimension constants and no GRH.

### Quadratic Hecke logarithmic derivative bound

**Theorem — `CMHeights.quadratic_hecke_bound`.** For fixed g and every ε>0, the quadratic Hecke character χ_E/F of every degree-2g CM field satisfies |(L_f′/L_f)(1,χ)|≤C_g,ε D_E^ε. With Q=D_E/D_F, functional equation gives the unscaled average as (log Q)/4+(L_f′/L_f)(1,χ)/2−gγ/2−g log(2π). Hence the absolute value of the average is ≤C′_g,ε D_E^ε.

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Corollary 3.3 proof, pp. 383–384, repaired via the quadratic average; Yuan–Zhang Theorem 1.1, p. 535.

**Dependencies.** **The averaged Colmez formula**; `AnalyticNumberTheory:AN.4`; `AutomorphicLFunctionsAndLocalFactors:AL.1`.

**Proof or construction.** 1. Request a quadratic Hecke estimate uniform in the varying base field of fixed degree: a subpolynomial bound on L_f′ near 1 and an ineffective subpolynomial lower bound on L_f(1). 2. Use the Hecke functional equation with g odd archimedean characters and Q as its conductor. 3. Insert the explicit gamma derivatives at 0 and 1 and the elementary log-discriminant bound. General Artin holomorphy or convexity on a possibly meromorphic Artin circle is not assumed.

**Acceptance.** G-HeckeUniform records the primary analytic estimates not proved here; gamma constants distinguish the two metrics.

### Distant CM ideal isogenies

**Theorem — `CMHeights.distant_isogenies`.** For each primitive maximal-order CM type (E,Φ), every A in its unpolarized maximal-CM class and every ε>0 admit B in that class such that every complex isogeny A→B has degree≥c_g,ε D_E^(1/4−ε). Polarizations on B are not fixed in advance. Primitivity ensures the full endomorphism algebra is E, so Hom is described by ideals.

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Proposition 2.2 and preceding proof, p. 382.

**Dependencies.** **Relative CM class-number growth**; `ComplexMultiplicationAndExplicitReciprocity:CM.2/arbitrary-dimensional-classification`; `ComplexMultiplicationAndExplicitReciprocity:CM.0/induced-and-primitive-type`; `AnalyticNumberTheory:AN.4`; `tauceti:NumberField.card_ideal_absNorm_le`.

**Proof or construction.** 1. Identify the fixed-type class with the maximal-order ideal-class torsor. 2. Count degree≤X isogeny targets by integral ideals, using the uniform fixed-degree X^(1+ε) ideal-count bound requested from AN.4. 3. Compare with h_E/h_F and choose X of the required exponent; adjust the ε budget.

**Acceptance.** The quantifier fixes A first. The baseline coarse X² ideal count alone loses the required 1/4 exponent.

### Individual CM heights are subpolynomial

**Theorem — `CMHeights.individual_height`.** For all maximal-order CM types, including imprimitive ones, every g≥1 and ε>0 admit C_g,ε>0 with h_Falt(E,Φ)≤C_g,ε D_E^ε. If b_g∈R is the uniform lower bound on dimension-g stable heights, then h_Falt(E,Φ)≤2^g mean_Ψ h_Falt(E,Ψ)−(2^g−1)b_g. No positivity of b_g or absolute-value upper bound on each height is assumed.

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Corollary 3.3, pp. 383–384, with its averaging proof and corrected sign convention.

**Dependencies.** **Quadratic Hecke logarithmic derivative bound**; `ArakelovGeometryAndAbelianHeights:R35.6/faltings-height-lower-bound`; **CM-height invariance and Colmez linearity**.

**Proof or construction.** 1. Apply the lower bound to each of the other 2^g−1 heights. 2. Subtract those terms from the total average. 3. Use the quadratic Hecke estimate and absorb the real lower constant.

**Acceptance.** The proof must pass with a negative lower constant; primitivity is only needed in the later distant-isogeny step.

**Layer proof obligations.** G-HeckeUniform and the sharper degree-only X^(1+ε) ideal-count refinement; import the actual height lower bound and metric conventions.


## CMH.11. Primitive CM Galois orbits

**Inputs.** `AbelianSchemesAndArithmeticModuli:A6`; `ComplexMultiplicationAndExplicitReciprocity:CM.2`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.10`; `FaltingsFinitenessAndIsogenyTheoremsPartII:QI.5`; `PELModuli:M6`.

### A common polarized definition field

**Theorem — `CMHeights.common_definition_field`.** For a polarized dimension-g primitive maximal-CM A with polarized coarse moduli field F_A, there is F′_A/F_A of degree≤2·3^(4g²) defining A, its polarization, full 3-torsion and all O_E-endomorphisms. For B=A/T_I chosen by an ideal kernel over F′_A, choose n killing T_I and g₀:B→A with g₀f=[n]; equip B with g₀*λ_A. Then F_B⊂F′_A, and F′_A F′_B defines both with degree over F_A≤4·3^(8g²). The originally supplied polarization on an unrelated B is not retained.

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Lemma 4.1 and proof of Theorem 4.2, pp. 384–385, with polarized-moduli and quotient-polarization corrections.

**Dependencies.** `ComplexMultiplicationAndExplicitReciprocity:CM.2/arbitrary-dimensional-classification`; `AbelianSchemesAndArithmeticModuli:A6`; `PELModuli:M6`; `FaltingsFinitenessAndIsogenyTheoremsPartII:QI.5/geometric-isogeny-estimate`.

**Proof or construction.** 1. Rigidify the polarized moduli object by a full level-3 basis, adjoin μ₃ and descend the rigid object. 2. Use 3-torsion Hom rigidity to descend endomorphisms, then form the invariant ideal kernel and quotient. 3. Factor [n] through the quotient and pull back the polarization on A along g₀. 4. Apply the same rigidification bound to the new polarized B and take the compositum.

**Acceptance.** An unpolarized moduli field alone is not used as an unconditional fine moduli descent theorem.

### Primitive orbit exponent budget

**Theorem — `CMHeights.exponent_budget`.** Let κ_g>0 be the dimension-g geometric isogeny exponent. For every 0<δ<1/(4κ_g), the distant-isogeny lower bounds, individual height bounds and common-field bound imply [F_A:Q]≥c_g,δ D_E^δ. Choose δκ_g<a<1/4 and height exponent ε<a/κ_g. For sufficiently large D_E the term D_E^ε cannot account for a lower isogeny degree cD_E^a in the maximum max(1,h_Falt(A),[k:Q])^κ_g, forcing its field-degree term.

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Proof of Theorem 4.2, p. 385; explicit exponent and bounded-range adapter.

**Dependencies.** **Distant CM ideal isogenies**; **Individual CM heights are subpolynomial**; **A common polarized definition field**; `FaltingsFinitenessAndIsogenyTheoremsPartII:QI.5/geometric-isogeny-estimate`.

**Proof or construction.** 1. Choose a and ε in the stated order, allowing the constants to depend on them. 2. Apply the geometric isogeny theorem over the common field to the B chosen for the fixed A. 3. For large discriminant eliminate the constant and height terms; use the bounded field-degree ratio. 4. Reduce the positive lower constant to cover the bounded discriminant range using [F_A:Q]≥1.

**Acceptance.** The maximum contains 1; negative small Faltings heights cannot make it invalid.

### Primitive maximal-CM orbit bound

**Theorem — `CMHeights.primitive_orbit`.** For every g≥1 there are c_g,δ_g>0 such that a polarized dimension-g A with primitive O_E-CM and End(A_C)=O_E satisfies [F_A:Q]≥c_g D_E^δ_g. Here F_A is the field of its polarized coarse moduli point, so in characteristic zero its degree is the cardinality of the absolute Galois orbit of that point. The field need not itself define A.

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Theorem 1.2, p. 379 and Theorem 4.2, p. 385, interpreted through polarized coarse moduli.

**Dependencies.** **Primitive orbit exponent budget**; `PELModuli:M6`.

**Proof or construction.** 1. Take any fixed admissible δ in the exponent budget. 2. Use geometric simplicity and full endomorphisms from the primitive maximal-CM classification. 3. Identify the coarse-point degree with its Galois orbit, retaining the separate bounded definition-field extension.

**Acceptance.** The theorem makes no equality between moduli fields and fields of definition.

**Layer proof obligations.** Rigid polarized level descent and exact geometric isogeny input; inherit CMH.9–10 gates with a positive exponent chosen before the height ε.


## CMH.12. General CM orders and Galois orbits

**Inputs.** `AbelianSchemesAndArithmeticModuli:A6`; `ComplexMultiplicationAndExplicitReciprocity:CM.0`; `ComplexMultiplicationAndExplicitReciprocity:CM.2`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.11`; `PELModuli:M6`; `ShimuraVarieties:V4`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

### The center order of a CM point

**Definition — `CMHeights.centre_order`.** For a principally polarized CM point x∈A_g(Q̄), put R_x=Z(End(A_x)). After an isogeny decomposition A_x∼∏_i A_i^n_i into pairwise nonisogenous simple CM factors, R_x is a full order in E_x=∏_i K_i with maximal order O_x=∏_i O_Ki. A repeated isotypic power contributes its field once; nonisogenous factors with isomorphic abstract CM fields retain separate factors. Set D_x=|disc_Z R_x| using the trace form on E_x, and J_x=[O_x:R_x].

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), §5, p. 385; Tsimerman (2012), §7.1–7.2, preprint pp. 15–18.

**Dependencies.** `AbelianSchemesAndArithmeticModuli:A6`; `ComplexMultiplicationAndExplicitReciprocity:CM.0/induced-and-primitive-type`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

**Proof or construction.** 1. Use complete reducibility to identify End⁰ with a product of matrix algebras over CM fields. 2. Take its center and intersect the integral endomorphism order. 3. Use the native trace discriminant of the full Z-order, not the discriminant of one selected maximal field.

**Uses.** CMH.12 general orbit and CMH.13 period-height bounds: Supplies the order-sensitive discriminant needed for all nonsimple and nonmaximal CM points.

**API.**

- `CMHeights.centre_order.full_order` (structure): R_x has full rank in E_x and finite index in O_x.
- `CMHeights.centre_order.discriminant` (characterisation): D_x is the absolute determinant of the integral trace pairing on any Z-basis.
- `CMHeights.centre_order.isotypic` (compatibility): For a maximal-order simple A, the center of End(A^n) is O_E, with no n-fold field repetition.

**Checks.**

1. For a CM elliptic curve of conductor f in E, D_x=f²D_E.
2. For E₀^n with E₀ simple CM, the center is its one CM field rather than an n-fold product.
3. Two nonisogenous simple CM factors with isomorphic underlying fields still give two center factors.

**Acceptance.** The invariant is unchanged under geometric isomorphism and Galois conjugation.

### Primitive reciprocity image from the absolute orbit

**Theorem — `CMHeights.primitive_reciprocity_image`.** For a primitive degree-2h CM type, let r:Cl(E*)→Cl(E) be its reflex ideal map and r̃=r∘Nm_L/E* for a normal closure L. There are dimension-only factors comparing |im r| with the absolute polarized moduli orbit of a maximal-CM realization. The relative marked orbit over E* is Cl(E*)/H, with H⊂ker r and [ker r:H]≤2^h. Passing to the absolute unmarked point changes sizes by at most the reflex degree and the finite number of CM markings, both bounded in h. Therefore the primitive absolute orbit bound gives a power lower bound on |im r|.

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), §5, p. 386, with relative/absolute and marked/unmarked orbit corrections.

**Dependencies.** **Primitive maximal-CM orbit bound**; `ComplexMultiplicationAndExplicitReciprocity:CM.2/relative-moduli-orbit`; `ComplexMultiplicationAndExplicitReciprocity:CM.2/class-map-and-unit-obstruction`; `PELModuli:M6`.

**Proof or construction.** 1. Use the actual polarized reciprocity action and its unit obstruction. 2. Bound the forgetful fiber by the embeddings E→End⁰(A)=E, hence by |Aut_Q E|≤2h. 3. Compare relative and absolute point degrees via the compositum with E*, whose degree is bounded by (2h)!. 4. Choose a maximal-CM polarized realization and apply the primitive orbit lower bound.

**Acceptance.** The source’s direct equality [Q(A):Q]=|Cl(E*)/H| is not used.

### Center-order discriminant and index

**Theorem — `CMHeights.order_discriminant`.** For every CM point, D_x=J_x²∏_i D_Ki, with the factors indexed as in the center-order definition. This is the integral trace-pairing change-of-basis formula. The Mumford–Tate compact index is a different invariant and cannot replace J_x in this equality.

**Source.** [Jacob Tsimerman — arXiv:1103.5619v2; use preprint pagination, not JAMS pagination](https://arxiv.org/pdf/1103.5619v2), Tsimerman (2012), §7.2, preprint p. 18, with the corrected index; Pila–Tsimerman (2013), Lemma 3.2, preprint p. 4.

**Dependencies.** **The center order of a CM point**; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`; `tauceti:NumberField.abs_discr_le_of_basis_isIntegral`.

**Proof or construction.** 1. Choose an integral basis of the maximal product order and one of R_x. 2. Take the determinant of the integral change-of-basis matrix. 3. Use block diagonality of the product trace pairing and square the index determinant.

**Acceptance.** The elliptic conductor-f test yields f²D_E, independent of any chosen compact-level description.

### Class-group norm image index

**Theorem — `CMHeights.norm_image`.** For finite number-field extension L/K, [Cl(K):Nm_L/K Cl(L)]≤[L:K]. For K=E* inside the normal closure of a degree-2h CM field this is bounded in h. Hence |im(r∘Nm)|≥|im r|/[L:E*], so its primitive positive-power discriminant bound persists.

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), §5, p. 386; Tsimerman (2012), proof of Theorem 7.1, preprint p. 18.

**Dependencies.** **Primitive reciprocity image from the absolute orbit**; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Proof or construction.** 1. Identify the norm cokernel by the corresponding unramified class-field intersection using global reciprocity. 2. Bound the intersection degree by [L:K]. 3. Pass the index bound through the class-group homomorphism r.

**Acceptance.** Surjectivity is not asserted for arbitrary L/K; the bounded cokernel is sufficient.

### The CM compact-index comparison

**Theorem — `CMHeights.compact_index`.** Let T_x be the Mumford–Tate torus in its actual integral GSp representation, K_x=T_x(A_f)∩GSp_2g(Ẑ), and I_x=[T_x(Ẑ):K_x], with T_x(Ẑ) maximal compact. There exist c_g,d_g>0 with J_x≤I_x^c_g(∏_i D_Ki)^d_g. Keep the field-discriminant factor. The proof includes ramified primes and p=2; exponential arguments there start sufficiently deep in the p-adic filtration.

**Source.** [Jacob Tsimerman — arXiv:1103.5619v2; use preprint pagination, not JAMS pagination](https://arxiv.org/pdf/1103.5619v2), Tsimerman (2012), Lemmas 7.2–7.5, preprint pp. 18–20.

**Dependencies.** **The center order of a CM point**; `ShimuraVarieties:V4`; `AbelianSchemesAndArithmeticModuli:A6`.

**Proof or construction.** 1. Use inequivalence of the primitive isotypic CM types to show T_x(Q) generates the entire product center algebra. 2. Choose a local primitive element from the differential of reciprocity, controlling its index by bounded-degree local discriminants. 3. For a compact-index p-part p^n, take exp(p^Nα) with N≥n+C_g and N≥2 at p=2; its powers lie in the lattice stabilizer. 4. Use the Vandermonde determinant and Nakayama to bound the center-order local index, then multiply over primes. G-TorusIndex retains the unread local comparison inputs and the needed uniform constants.

**Acceptance.** A p-adic exponential is not assumed convergent on pZ_p when p=2.

### Reduction of general CM points to primitive fields

**Theorem — `CMHeights.general_orbit_reduction`.** Fix g. Suppose every primitive degree-2h type for each 1≤h≤g has |im r̃|≥c_h D_E^δ_h with δ_h>0. Then every principally polarized CM point x∈A_g has |Gal(Q̄/Q)·x|≥c_g D_x^δ_g for some c_g,δ_g>0. This includes nonmaximal center orders, imprimitive types and repeated simple factors; the smaller-dimensional primitive inputs are all required.

**Source.** [Jacob Tsimerman — arXiv:1103.5619v2; use preprint pagination, not JAMS pagination](https://arxiv.org/pdf/1103.5619v2), Tsimerman (2012), Theorem 7.1 and equations (4)–(5), preprint pp. 17–20; Tsimerman (2018), §5, pp. 385–386.

**Dependencies.** **Class-group norm image index**; **The CM compact-index comparison**; **Center-order discriminant and index**; `ShimuraVarieties:V4`; `PELModuli:M6`.

**Proof or construction.** 1. After a dimension-bounded rigid level change use injectivity of the torus orbit into the Siegel moduli orbit. 2. Project reciprocity to each primitive simple factor and use the bounded norm cokernel. 3. Use the torus orbit estimate with I_x and its B^(number of bad primes) factor; absorb that factor with arbitrarily small power losses. In the notation of G-TorusOrbit the lower bound is c_g B_g^(#S) I_x |im r_T| with 0<B_g≤1. 4. Combine the field-discriminant lower bound with the compact-index comparison and D_x=J_x²∏D_Ki. G-TorusOrbit records the exact input orbit inequality and injectivity proof.

**Acceptance.** No hypothesis is restricted to primitive types only in dimension exactly g; all h≤g are included.

### Galois-orbit bound for every CM point

**Theorem — `CMHeights.all_cm_orbit`.** For every g≥1 there are C_g,b_g>0 such that D_x≤C_g |Gal(Q̄/Q)·x|^b_g for every CM point x∈A_g(Q̄). Equivalently the absolute polarized coarse orbit has a uniform positive-power lower bound in the center-order discriminant. This is unconditional in all dimensions; it does not retain the older g≤6 or GRH restriction.

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Theorem 5.2, pp. 385–386; Pila–Tsimerman (2014), Conjecture 7.1, p. 673.

**Dependencies.** **Primitive maximal-CM orbit bound**; **Primitive reciprocity image from the absolute orbit**; **Class-group norm image index**; **Reduction of general CM points to primitive fields**.

**Proof or construction.** 1. Apply the primitive orbit theorem in every dimension h≤g. 2. Convert the primitive moduli orbit to the normal-closure reciprocity image. 3. Apply general orbit reduction and invert its positive exponent.

**Acceptance.** The discriminant is D_x for the full center order, not only D_E for a maximal primitive field.

**Layer proof obligations.** G-TorusIndex and G-TorusOrbit; compare relative/absolute and marked/unmarked orbits and retain the field-discriminant factor.


## CMH.13. CM lift heights and bounded-degree finiteness

**Inputs.** `AbelianSchemesAndArithmeticModuli:A6`; `ComplexMultiplicationAndExplicitReciprocity:CM.2`; `ComplexMultiplicationAndExplicitReciprocityPartII:CMH.12`; `GeometryOfNumbersAndQuadraticArithmetic:GN.0`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1`; `GeometryOfNumbersAndQuadraticArithmetic:GN.3`; `HeightsRationalPointsAndObstructions:RP.0`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.

### Uniform degree of CM period coordinates

**Theorem — `CMHeights.cm_coordinate_degree`.** For fixed g, the complex entries of a CM period matrix Z representing a point of A_g lie in a normal closure of the product center algebra, of degree at most (2g)!. The real and imaginary entries lie after adjoining i, so each has degree at most d_g=2·(2g)!. Integral symplectic fractional transformations preserve the complex field; taking real and imaginary parts is accounted for separately. This safe bound suffices, with no claim that each coordinate has degree≤2g.

**Source.** [Jacob Tsimerman — Annals 187 (2018), 379–390](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Tsimerman (2018), §6.2, p. 387; Pila–Tsimerman (2013), §3, preprint pp. 3–9; (2014), Lemma 7.4, p. 675.

**Dependencies.** **The center order of a CM point**; `ComplexMultiplicationAndExplicitReciprocity:CM.2/arbitrary-dimensional-classification`; `AbelianSchemesAndArithmeticModuli:A6`.

**Proof or construction.** 1. Express the polarized CM torus in rational homology coordinates using the product CM embedding matrices. 2. Take the compositum of the normal closures, whose Galois group acts on at most 2g center embeddings. 3. Compute the period matrix by linear algebra over that splitting field, then adjoin i for its real/imaginary coordinates.

**Acceptance.** For real/imaginary coordinates the field is enlarged by i; degree and height conventions are shared with the height theorem.

### A bounded basis for CM lattices

**Theorem — `CMHeights.bounded_cm_basis`.** Fix g. If I⊂O_E is a full Z-lattice for a degree-2g CM field, it admits a Z-basis whose conjugates are bounded by a polynomial in D_E[O_E:I]. If I has multiplier order R, first scale it by ν∈E× so that νI⊂O_E and [O_E:νI] is polynomially bounded in |disc R|. In the canonical C^g embedding, covolume(I)=2^(−g)√D_E[O_E:I]. Nonmaximal lattices need not be invertible O_E-ideals.

**Source.** [Jonathan Pila; Jacob Tsimerman — arXiv:1106.4023v1; Compositio 149 (2013), 204–216](https://arxiv.org/pdf/1106.4023v1), Pila–Tsimerman (2013), Lemmas 3.2–3.3, preprint pp. 3–5.

**Dependencies.** `ComplexMultiplicationAndExplicitReciprocity:CM.2/polarized-cm-lattice-data`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1`; `GeometryOfNumbersAndQuadraticArithmetic:GN.3`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`; `mathlib:NumberField.exists_ideal_in_class_of_norm_le`; `GeometryOfNumbersAndQuadraticArithmetic:GN.0`.

**Proof or construction.** 1. Apply the ideal-class bound to J=O_E I and use [O_E:R]J⊂I⊂J for scaling. 2. Use the corrected covolume and the norm lower bound for a nonzero integral vector. 3. Apply the owner’s successive-minima/bounded-basis theorem in fixed rank, then compare all archimedean conjugates.

**Acceptance.** For Q(i), O_E has covolume 1: 2⁻¹√4=1; the printed discriminant without its square root gives 4.

### CM period height under Siegel reduction

**Theorem — `CMHeights.cm_symplectic_reduction`.** Fix g and the chosen standard Siegel fundamental set F_g. Starting with the order-sensitive CM lattice and principal Riemann form, construct a symplectic period matrix whose coordinate heights, real sizes and reciprocal imaginary determinant are polynomial in D_x. A symplectic integral reduction into F_g preserves a polynomial bound on the algebraic coordinate heights. The reduction input uses h₀(Z)=max(max_ij|z_ij|,1/det Im Z); this analytic size is distinct from algebraic Weil height.

**Source.** [Jonathan Pila; Jacob Tsimerman — arXiv:1106.4023v1; Compositio 149 (2013), 204–216](https://arxiv.org/pdf/1106.4023v1), Pila–Tsimerman (2013), §3, Lemmas 3.4–3.7, preprint pp. 5–9.

**Dependencies.** **A bounded basis for CM lattices**; **Uniform degree of CM period coordinates**; `ComplexMultiplicationAndExplicitReciprocity:CM.2/arbitrary-dimensional-classification`; `GeometryOfNumbersAndQuadraticArithmetic:GN.3`; `AbelianSchemesAndArithmeticModuli:A6`.

**Proof or construction.** 1. Balance the positive polarization using a bounded totally imaginary element and the unit action, retaining its multiplier order. 2. For repeated simple factors reduce the hermitian matrix on the full isotypic lattice; glue distinct factors with the center-order index bound. 3. Use the owner’s Siegel reduction matrix estimate polynomial in h₀, together with algebraic height rules for sums, products and inverses. G-PeriodReduction records the general hermitian and reduction proof inputs.

**Acceptance.** For the general-lattice index argument use disc R, not the discriminant of the maximal algebra independent of its order.

### Polynomial height of CM lifts

**Theorem — `CMHeights.cm_lift_height`.** For every g≥1 there are C_g,a_g>0 such that each CM point x∈A_g has a representative Z∈F_g with max(1,max_ij H_abs(Z_ij),max_ij H_abs(Re Z_ij),max_ij H_abs(Im Z_ij))≤C_g D_x^a_g. H_abs is absolute multiplicative Weil height. Together with coordinate degree≤2·(2g)!, this is equivalent up to dimension-only powers to the naive algebraic-coordinate height convention needed for counting.

**Source.** [Jonathan Pila; Jacob Tsimerman — arXiv:1106.4023v1; Compositio 149 (2013), 204–216](https://arxiv.org/pdf/1106.4023v1), Pila–Tsimerman (2013), Theorem 3.1, preprint pp. 3–9; Tsimerman (2018), §6.2, p. 387.

**Dependencies.** **CM period height under Siegel reduction**; **Uniform degree of CM period coordinates**; `HeightsRationalPointsAndObstructions:RP.0`.

**Proof or construction.** 1. Apply bounded CM period construction and symplectic reduction. 2. Convert the complex-coordinate height to real and imaginary heights using conjugation and adjoining i. 3. Use the uniform degree bound to compare multiplicative Weil height with primitive integral minimal-polynomial coefficient height; absorb the fixed powers.

**Acceptance.** The same coordinate and height convention is used in the Northcott consumer; analytic h₀ is not substituted for H_abs.

### Finiteness of CM points of bounded moduli degree

**Theorem — `CMHeights.bounded_degree_cm`.** For every g≥1 and N≥1, only finitely many CM points x∈A_g(Q̄) satisfy [Q(x):Q]≤N. The field is the polarized coarse moduli field. The general orbit bound bounds D_x by C_g N^b_g, then the lift-height and coordinate-degree bounds put all chosen representatives in a finite Northcott set. Thus any family with uniformly bounded moduli degrees contains only boundedly many distinct CM points, as used by Masser–Zannier; no bound on multiplicities in a parameterization is asserted.

**Source.** [David Masser; Umberto Zannier — Annals 191 (2020), 635–674, public supplemental article PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), Masser–Zannier (2020), §5.4, p. 667; Pila–Tsimerman (2014), Lemma 7.4, p. 675; Tsimerman (2018), Theorem 5.2, pp. 385–386.

**Dependencies.** **Galois-orbit bound for every CM point**; **Polynomial height of CM lifts**; **Uniform degree of CM period coordinates**; `HeightsRationalPointsAndObstructions:RP.0`.

**Proof or construction.** 1. Identify the absolute orbit size with the coarse-point degree. 2. Bound the center-order discriminant and hence each real/imaginary coordinate height of a chosen lift. 3. Apply Northcott to the fixed finite number of coordinates of uniformly bounded degree; map the finite tuple set to A_g.

**Acceptance.** The conclusion is unconditional for all g using the 2018 orbit theorem; no Jacobian or isogeny-counting theorem is replanned.

**Layer proof obligations.** G-PeriodReduction and the bounded-degree Qbar Northcott interface; inherit the general orbit gates before asserting the bounded-degree CM consumer.

## Worked examples and failure checks

### Total heights determine only the overlap span

For every CM pair, a⁰_Φ(c)=0, whereas the constant class function 1 belongs to CM⁰ and takes value 1 at c. Thus H_CM, the Q-span of overlap functions, is proper. If an extension of ht_H to CM⁰ exists, adding t·ev_c for any real t preserves all of its total-height values. Those values cannot establish uniqueness on CM⁰. Colmez (1993), Theorem 0.3, p. 631 specifies component-period values on a larger generating family; these extra data must be retained for the full formulation.

There is another finite check. In Gal(Q(ζ₇)/Q)=C₆, write c=r³. The class function f with values (0,1,1,0,−1,−1) on 1,r,…,r⁵ satisfies f(s)+f(cs)=0, but f(r)≠f(r⁻¹). Every overlap character is invariant under inversion, including after conjugacy averaging and finite-quotient refinement. This independently distinguishes H_CM from CM⁰. The average and total-reflex arguments use only H_CM.

### A quadratic partition detects both length signs

Take A=Z₃, B=Z₃[π] with π²=3, and C=B. The two embeddings send π to π and −π. For the singleton partition the two evaluation kernels have sum generated by 2π, so the quotient is C/(2π), of C-length one. The different is generated by 2π and v_C(3)=2. Each singleton’s conductor functional is 1/2, so +(e_C/2)(1/2+1/2)=1. Both the reversed resultant sign and the negative conductor prefactor give −1 and fail. This is a local test; it does not by itself identify the total-reflex Hodge quotient with this module.

### The total reflex algebra can be a product

Let E=Q(i,√2), a biquadratic CM field. Its four types are choices in its two conjugate pairs. Under the Klein four Galois group they split into two orbits of size two: the two reflex fields are Q(i) and Q(√−2). Thus E♯≅Q(i)×Q(√−2), of degree four, and its CM abelian family has dimension two. A definition requiring E♯ to be a field fails this example. For an imaginary quadratic E the two-element type set instead recovers E itself.

### Integral unit image is smaller than maximal compact

For a ramified quadratic local field E_v/F_v, v_E(F_v×)=2Z. The class of an E_v-uniformizer has order two in E_v×/F_v× and is compact. It cannot be represented by a unit, since changing its representative by F_v× preserves odd valuation. The CM integral level uses the image of O_E,v×, excluding this class. It therefore cannot be defined as every compact element of the quotient.

### Ramified embedding quotients require a determinant comparison

Let F_p=Q_p(√p) with p odd and let O_L contain both embeddings. A free rank-one O_L-module on which √p acts by −√p, tensored along the embedding sending √p to +√p, becomes O_L/(2√p). This is nonzero torsion, not a locally free component of the expected rank. It blocks the inference from a generic tensor sequence to integral determinant cancellation. The relative/image Hodge comparison must prove precisely how this torsion is handled. The same issue reaches the quaternionic Kodaira–Spencer calculation.

At p=2 the degree-four CM field Q(√17,√−7) splits completely. Its integral local algebra is Z₂⁴; its reduction F₂⁴ has no single generator over F₂, since any such generator takes at most two distinct values. Factorwise local generators after suitable unramified extension are required in the Vandermonde calculation.

### From an average to an individual height

If m=2^g heights h_i satisfy h_i≥b_g and their mean is μ, then h_i=mμ−Σ_(j≠i)h_j≤mμ−(m−1)b_g. For m=2 and b_g=−1 this reads h_1≤2μ+1. Nothing requires b_g>0. Applying the subpolynomial bound on μ therefore gives the individual CM height bound even for imprimitive types. Primitivity first enters the full-endomorphism ideal-isogeny argument.

### Choose exponents before applying the isogeny estimate

For a geometric isogeny exponent κ=2, δ=1/16 satisfies δ<1/(4κ)=1/8. Choose a=3/16 and ε=1/32. Then δκ=1/8<a<1/4 and εκ=1/16<a. For large D, a lower degree cD^a cannot be accounted for by a height term bounded by D^ε in a maximum raised to κ. The definition-field term must dominate. The bounded range is covered by reducing the positive orbit constant, using the coarse-point degree≥1.

### The full center order changes the orbit invariant

For an elliptic CM order R=Z+fO_E, J=[O_E:R]=f and |disc R|=f²D_E. A discriminant defined using the maximal field alone misses arbitrary growth with f. For A=B^n with B simple, the center of End⁰(A)=M_n(E) is E once; counting it n times gives a different and incorrect invariant. These checks distinguish the full center-order definition from both common shortcuts.

### Coordinate bounds and the Northcott consumer

The embeddings of the product center algebra number at most 2g. Its normal closure therefore has degree≤(2g)!, and adjoining i bounds the degree of each real/imaginary coordinate by 2(2g)!. In dimensions one and two these safe real-coordinate bounds are 4 and 48. They need not be optimal. Given [Q(x):Q]≤N, the general orbit theorem bounds D_x. Polynomial coordinate height in D_x and these uniform coordinate degrees place each real/imaginary tuple in a finite Northcott set. This counts distinct moduli points, not repeated parameters mapping to the same point.

## Exact supplier contracts

An exact node import keeps that node’s stated hypotheses. In particular `ArakelovGeometryAndAbelianHeights:R35.4/component-isogeny-formula` requires the specified component quotients to be locally free; it does not validate raw ramified tensor quotients. `FaltingsFinitenessAndIsogenyTheoremsPartII:QI.5/geometric-isogeny-estimate` bounds a complex isogeny using the actual dimension, common definition-field degree and stable height. It is not a rational-isogeny bound with an unmentioned polarization hypothesis.

- **`AbelianSchemesAndArithmeticModuli:A4`.** Good-reduction abelian schemes, extension of morphisms and uniqueness over the normal CM base; use actual schemes and base change, not an abstract moduli placeholder.
- **`AbelianSchemesAndArithmeticModuli:A5`.** Polarizations and Tate-module symplectic realizations; identify a polarized CM Hodge lattice with the generic abelian family and retain nonprincipal polarizations.
- **`AbelianSchemesAndArithmeticModuli:A6`.** Hom rigidity, rational endomorphisms, complete reducibility, finite isogeny kernels and extension to good-reduction schemes; coarse polarized isomorphism is distinguished from an unpolarized isogeny.
- **`AnalyticNumberTheory:AN.4`.** Fixed-degree Brauer–Siegel (ineffective constants allowed), quadratic Hecke functional equation and uniform logarithmic-derivative bounds with varying real base field; conductor D_E/D_F. Also require the degree-only bound #{nonzero ideals of norm≤X}≤C(n,ε)X^(1+ε), stronger than the pinned EffectiveBounds X² estimate; its Euler-factor proof must be supplied with that owner. Chebotarev supplies arbitrarily many inert primes avoiding a finite set. The narrow-norm/different-character input is G-Armitage; general Artin holomorphy is excluded.
- **`AutomorphicBundles:B1`.** Canonical tensor realizations and absolute-Hodge comparisons; for this use explicitly supply the Blasius p-adic compatibility cited on AGHMP p. 426 and the Kisin integral tensor-stabilizer torsor. G-AbsoluteHodge remains open until the primary theorems are checked.
- **`AutomorphicBundles:B2`.** Filtered tensor functors and Hecke-compatible realization maps. Integral CM extensions and their BK completions are constructed here; the generic realization functor is imported.
- **`AutomorphicBundles:B4`.** Identify the curve Hodge weight with the Petersson line ||dz||=2 Im z, with actual level pullbacks. This generic bundle interface does not supply G-IntegralKS at ramified primes.
- **`AutomorphicLFunctionsAndLocalFactors:AL.1`.** Finite-image Artin characters, induction, conductor-discriminant compatibility, ramification-group conductor exponents and finite quadratic Hecke factors; regularity and nonvanishing at zero for the CM odd-character combination are required without assuming general Artin holomorphy.
- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.** Actual finite flat group schemes, ideal-torsion kernels, Cartier duality and variance-compatible Dieudonné modules.
- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.** All-prime integral Breuil–Kisin classification, Frobenius pullback specializations and period comparisons, including p=2. Supply the CM rank-one multipliers and reduction modulo the different with extension of unit automorphisms under G-CMKisin; tensor exactness at ramified component quotients is a separate gate.
- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`.** Newton cocharacters, slope decompositions and the slope-1/2 supersingularity criterion for the supplied CM abelian family.
- **`GeometryOfNumbersAndQuadraticArithmetic:GN.0`.** Canonical complex embeddings, trace covolumes and lattice indices; use covolume 2^(−g)√D_E[O_E:I], not D_E[O_E:I].
- **`GeometryOfNumbersAndQuadraticArithmetic:GN.1`.** Successive minima and a bounded integral basis in fixed dimension from covolume and the algebraic norm lower bound. Current IntegralLattices supplies dual/discriminant algebra, not this quantitative basis estimate.
- **`GeometryOfNumbersAndQuadraticArithmetic:GN.2`.** Local/global rank-one hermitian forms with specified real signs, finite integral lattices and dyadic cases; choose CM quadratic lattices good at a prescribed finite prime set.
- **`GeometryOfNumbersAndQuadraticArithmetic:GN.3`.** Quantitative Siegel fundamental-set reduction: an integral symplectic reducing matrix bounded polynomially in h₀(Z), and fixed-rank hermitian lattice reduction on repeated isotypic factors. This is the precise refinement behind G-PeriodReduction.
- **`GrossZagierAndArithmeticHeights:GZ.0`.** One common analytic/arithmetic normalization: arithmetic Artin, finite L-functions, Petersson metric, degree denominator [F(P):F], units e and all archimedean constants.
- **`GrossZagierAndArithmeticHeights:GZ.2`.** Admissible arithmetic curve pairings, Green functions and adjunction with vertical corrections on the integral model, including ramified horizontal CM closures.
- **`GrossZagierAndArithmeticHeights:GZ.6`.** Retain the noncuspidal/degenerate terms in the Yuan–Zhang analytic derivative and geometric height kernels; export their modified self-intersection rather than a formula only after cuspidal projection. Carry the existing paper E43/E44/E51/E52 audits into the comparison.
- **`GrossZagierAndArithmeticHeights:GZ.7`.** Whittaker/intersection lengths at all finite places, including the compensated S₂ normalization, dyadic and ramified CM adjunction terms, with exact unit and different factors.
- **`HeightsRationalPointsAndObstructions:RP.0`.** Absolute multiplicative Weil height on algebraic coordinates: sum/product/inverse/conjugation bounds, comparison with naive minimal-polynomial height at bounded degree, and Northcott for Qbar points of bounded absolute degree. Fixed-number-field Northcott alone is insufficient.
- **`HilbertModularVarietiesAndShimuraCurves:R18.1`.** Quaternion algebra local/global invariants, embedding E→B, maximal orders containing O_E, split/division order descriptions including the split dyadic residue-field-F₂ case. Primary Vignéras theorem remains G-QuaternionOrders.
- **`HilbertModularVarietiesAndShimuraCurves:R18.2`.** Actual quaternionic/PEL curve models and Hodge line, Petersson metric and finite-order level action. Require the integral Kodaira–Spencer comparison with the different twist in G-IntegralKS, not only its generic fiber.
- **`HilbertModularVarietiesAndShimuraCurves:R18.5`.** The formal bad-prime Shimura-curve model and descent datum used for vertical corrections and adjunction; no assumption that CM closures are étale.
- **`LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`.** The actual Lubin–Tate Tate character compared to arithmetic Artin (unit inverse), compatible rank-one torsion. The CM BK multiplier calculation is owned here over the R07.4 carrier; it is not asserted already supplied by LT.2.
- **`MetaplecticAutomorphicForms:MP.7`.** Rank-one metaplectic/half-integral-weight and Whittaker framework only. Support-controlled harmonic Maass/Borcherds existence is the pending GSpin supplier gap G-Borcherds, not a consequence of this stage alone.
- **`NeronModelsAndSemistableAbelianVarieties:R11.5`.** Néron–Ogg–Shafarevich and good-reduction extension for the CM family after the indicated inertia-trivial field extension, plus uniqueness and isogeny compatibility.
- **`PELModuli:M5`.** Siegel and relevant quaternionic/PEL moduli functors, full polarized lattice data and their Hodge bundles; no CM-specific height definitions are imported from the moduli owner.
- **`PELModuli:M6`.** Fine rigid level and descent over the polarized coarse residue field: degree≤3^(4g²) for level three, then a common field for A and B with transported polarization. Supply bounded-level injectivity of the torus orbit; unpolarized coarse descent is not an acceptable replacement.
- **`ReductiveGroupsPartII:RG2.0a`.** Weil restriction of finite étale field algebras and tori with character/cocharacter maps and norm morphisms, used before the quotient torus computation.
- **`ShimuraData:D1`.** Polarized rational Hodge structures, weight and Hodge filtration, and their Mumford–Tate tori in the actual symplectic representation.
- **`ShimuraData:D3`.** Shimura data for tori and the cocharacter/reflex-field dictionary, used to define the distinguished zero-dimensional CM datum.
- **`ShimuraVarieties:V4`.** Canonical models and the fixed arithmetic reciprocity action for tori; request the precise quantitative torus orbit inequality with compact-index and bad-prime factor under G-TorusOrbit. The basic canonical model does not itself prove that estimate. For T=T_x let Cl(T)=T(Q)\T(A_f)/T(Ẑ), I=[T(Ẑ):K_x], S={p:p|[O_x:R_x]}, and r_T:Cl(L)→Cl(T) the normal-closure reflex action. After a dimension-bounded rigid level change, require |Gal(Qbar/Q)·x|≥c_g B_g^(#S) I |im r_T| with c_g>0 and 0<B_g≤1, and compatible projections to each primitive factor. This is the inequality used in Tsimerman (2012), (4)–(5), pp. 17–18; its bad-prime loss must be absorbed, not dropped.
- **`ShimuraVarieties:V5`.** General main theorem of CM in every dimension with polarized moduli and Tate-module compatibility; type/lattice realizations and their potential good reduction use this interface.
- **`ShimuraVarieties:V8`.** Level towers, Hecke correspondences and compatibility of canonical realizations; extend their CM isogenies integrally here.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.** Class norm cokernel index≤[L:K] via the unramified class-field intersection, and the norm image Cl(E)→Cl⁺(F) with its sign character as in AGHMP (9.5.4); retain the narrow class group. This is an import/refinement of the existing norm/class-field direction.
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.** Full orders, their integral bases, multiplier rings and [O:R]² trace-discriminant relation; proper versus invertible ideals remain distinct. Apply the field-order interface componentwise to the CM center product.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.** The existing anti-equivalence between tori and Galois character lattices, quotient tori and exactness; compute only the CM-specific annihilator and diagonal μ_d kernel here.
- **`ArakelovGeometryAndAbelianHeights:R35.4/cm-hodge-filtration-local`.** Resolve the primary CM Hodge-filtration comparison already recorded at this supplier; specialize it to the factorwise Vandermonde length computation with image/torsion-free component determinants. G-CMHodge propagates here.

## Proof gates and source scope

Each gate below is a concrete prerequisite to proof closure. The targets and their APIs remain in the roadmap while these gates are open.

### G-Colmez: Primary height-linearity theorem

Colmez (1993), pp. 627–632 and Theorem 0.3 have now been read at statement level. The theorem specifies the full functional by component-period values, not by total heights alone. The underlying monomial period relations and local comparison proofs remain unread. Prove the exact sign/conductor/unscaled-metric adapter and linear-relation compatibility on H_CM, with maximal-order type invariance, products and induction. Do not infer uniqueness on all CM⁰ from overlap values.

**Needed for:** **CM-height invariance and Colmez linearity**. **Resolution:** Read the stated primary proof, prove the exact comparison, and pass its discriminating checks before claiming proof closure.

### G-AbsoluteHodge: Absolute-Hodge integral tensor comparison

Blasius (1994) p-adic comparison and Kisin (2010), Corollary 1.4.3 are quoted by AGHMP pp. 426–427 but their primary proofs have not been read here. Obtain the absolute-Hodge tensor compatibility and actual T-torsor with all unramified and maximal-level hypotheses; canonical-model descent alone is insufficient.

**Needed for:** **Integral CM tensor torsor**. **Resolution:** AutomorphicBundles:B1 and FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4

### G-Metric: Complete metrized determinant isometry

Check the determinant isometry with the repaired positive ω₀ metric and trace-normalized top period, not just the rational line identity. Verify the r=1 trace factor and base-change normalization.

**Needed for:** **Metrized determinant and trace volume**. **Resolution:** Read the stated primary proof, prove the exact comparison, and pass its discriminating checks before claiming proof closure.

### G-IntegralReflex: Integral total-reflex length identification

The combinatorial conductor computation does not identify its module with the integral Hodge graded-action quotient. Supply this identification at every ramified and dyadic prime, using the actual BK lattice, before transferring the length formula.

**Needed for:** **Local total reflex comparison**. **Resolution:** Read the stated primary proof, prove the exact comparison, and pass its discriminating checks before claiming proof closure.

### G-OrthogonalAdapter: Repair the orthogonal filtered-line lattice comparison

AGHMP (9.5.3), p. 523 has an invalid full-lattice scaling as recorded in the paper audit. A scalar satisfying a norm equation is not enough. Prove the required integral Hodge-line degree comparison, including different ideals and all local indices; do not use the printed full-lattice equality.

**Needed for:** **Orthogonal Hodge-line degree adapter**. **Resolution:** Read the stated primary proof, prove the exact comparison, and pass its discriminating checks before claiming proof closure.

### G-GSpin: Big-CM orthogonal arithmetic height input

Import the exact normalized Theorems 6.4.2 (p. 474) and 8.3.4 (p. 508), with vertical error supported at the declared bad primes. Their lengthy §§4–8 proofs have not been read here. Preserve the supplier paper audit, including dyadic local intersection, tensor, Green-function and Borcherds hypotheses.

**Needed for:** **Average height error on the CM cycle**. **Resolution:** Pending GSpinSpecialDivisorHeights proposal; no accepted stage id exists. Exact interface is recorded here and in upstreamNotes.

### G-Armitage: Different-character and narrow norm calculation

Read Armitage (1967), Theorem 3 and prove the quadratic CM different-character identity used in Lemma 9.5.4, p. 525. Supply the norm image in the narrow class group, including signs at real places, to choose lattices good at an arbitrary finite prime set.

**Needed for:** **Good data avoiding any finite prime set**. **Resolution:** ClassFieldTheory layer 13 and AnalyticNumberTheory:AN.4

### G-Borcherds: Support-controlled prime elimination

For each prime p, produce a good auxiliary CM lattice, p-self-dual ambient lattice and Borcherds input with nonzero constant coefficient and negative coefficients supported only where proper intersection holds. Eliminate the p-error rather than merely finding two coprime bad-prime sets. The supporting Borcherds existence proof is not read here.

**Needed for:** **Eliminate each bad-prime coefficient**. **Resolution:** GSpinSpecialDivisorHeights and MetaplecticAutomorphicForms:MP.7

### G-Classical: Imaginary quadratic period formula

The d=1 Chowla–Selberg input is named in AGHMP p. 392; a primary period-formula proof with this exact Faltings metric remains unread. It supplies the d=1 orthogonal route, without applying its d≥2 auxiliary argument outside its domain.

**Needed for:** **The imaginary quadratic average**. **Resolution:** Read the stated primary proof, prove the exact comparison, and pass its discriminating checks before claiming proof closure.

### G-CMHodge: Primary CM Hodge-filtration comparison

The local CM Hodge lattice theorem cited in Yuan–Zhang Theorem 2.3 must be supplied with factorwise monogenicity after unramified base extension, and compatible image/torsion-free component lines. Colmez II.1.2 is not read here; the generic supplier itself records this leaf.

**Needed for:** **CM height decomposition**. **Resolution:** ArakelovGeometryAndAbelianHeights:R35.4/cm-hodge-filtration-local

### G-CMKisin: All-prime CM Kisin classification proof

The revised author erratum pp. 3–9 is read; its underlying integral classification references are not. Obtain the actual all-prime rank-one CM BK construction, semilinear embedding permutation, reduction modulo the different, and extension of all generic unit automorphisms.

**Needed for:** **CM torsion comparison modulo the different**. **Resolution:** FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4

### G-RamifiedComponent: Ramified relative/image determinant comparison

Erratum Proposition 6 tensors a sequence along an embedding. This need not preserve exactness or local freeness when F/Q is ramified. For F_p=Q_p(√p), the opposite-eigenvalue quotient can be O_L/(2√p). Prove a relative/image determinant comparison and Cartier-duality cancellation, and compare its height with the component convention actually used. This is an unresolved proof gate, not a proof of the unrestricted tensor argument.

**Needed for:** **Ramified component determinant cancellation**; **Corrected nearby-height identity**. **Resolution:** ArakelovGeometryAndAbelianHeights:R35.4 with FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4

### G-QuaternionOrders: Integral maximal-order graph input

The author erratum cites Vignéras, Ch. II, Theorem 3.2, p. 44. That primary theorem is unread. Supply the split and division maximal-order classification with an embedded O_E, including split dyadic residue-field-F₂ cases; containment of units in a maximal compact alone does not suffice.

**Needed for:** **The actual quaternionic graph kernel**. **Resolution:** HilbertModularVarietiesAndShimuraCurves:R18.1

### G-IntegralKS: Ramified integral Kodaira–Spencer comparison

Yuan–Zhang Propositions 5.4–5.5 use raw component quotients whose local freeness is not automatic. Establish integral Kodaira–Spencer on relative/image Hodge lattices and its exact comparison with N(A,τ), including the different twist and archimedean metric. The determinant of an O_E-linear rank-two Hom is not the rank-one O_B-linear deformation condition.

**Needed for:** **CM and quaternionic Hodge lines**. **Resolution:** HilbertModularVarietiesAndShimuraCurves:R18.2 and ArakelovGeometryAndAbelianHeights:R35.4

### G-YZKernels: Noncuspidal arithmetic kernel comparison

Only the target and assembly of Theorem 9.1 have been read, not all §§6–8 local proofs. The supplier must retain degenerate terms, complementary-character pseudo-theta terms, the compensated S₂ Whittaker/intersection normalization and a nonzero (not necessarily positive) comparison constant. Carry the existing paper findings E43, E44, E51 and E52 into that verification.

**Needed for:** **Modified CM self-intersection**. **Resolution:** GrossZagierAndArithmeticHeights:GZ.6 and GZ.7

### G-Adjunction: Detailed ramified arithmetic adjunction

Theorem 9.3 and its setup are read but the full pp. 631–635 local proof is not. Verify the conormal/different calculation, invariant lift and vertical correction at ramified CM points on the actual integral model; an étale-section simplification is unavailable.

**Needed for:** **Arithmetic adjunction for the CM point**. **Resolution:** GrossZagierAndArithmeticHeights:GZ.2 and GZ.7

### G-HeckeUniform: Uniform quadratic Hecke analytic estimates

The quadratic Hecke L-function is entire and permits Cauchy bounds; a general Artin function is not assumed entire. Establish fixed-degree uniform lower bounds at 1 and bounds on L′(1,χ)/L(1,χ), with varying totally real base field and constants depending only on g and ε. The named primary analytic estimates are unread.

**Needed for:** **Quadratic Hecke logarithmic derivative bound**. **Resolution:** AnalyticNumberTheory:AN.4

### G-TorusIndex: Uniform compact-index local comparison

The source §7.2 is read, but the cited local torus estimates and their uniform constants remain to be established with ramification and a sufficiently deep dyadic exponential. Preserve J≤I^c(∏D_K)^d and do not remove its field factor.

**Needed for:** **The CM compact-index comparison**. **Resolution:** ShimuraVarieties:V4 quantitative refinement; CM-specific proof remains here

### G-TorusOrbit: Torus orbit inequality and moduli injectivity

Supply the precise reciprocity orbit inequality with compact index and its B^(number of bad primes) loss, together with bounded-level injectivity into polarized Siegel moduli. The external orbit estimate cited in Tsimerman (2012), §7.1 is not read in its primary source. Absolute unmarked orbit, relative marked orbit and normal-closure reciprocity image must be compared with bounded fibers. For T=T_x let Cl(T)=T(Q)\T(A_f)/T(Ẑ), I=[T(Ẑ):K_x], S={p:p|[O_x:R_x]}, and r_T:Cl(L)→Cl(T) the normal-closure reflex action. After a dimension-bounded rigid level change, require |Gal(Qbar/Q)·x|≥c_g B_g^(#S) I |im r_T| with c_g>0 and 0<B_g≤1, and compatible projections to each primitive factor. This is the inequality used in Tsimerman (2012), (4)–(5), pp. 17–18; its bad-prime loss must be absorbed, not dropped.

**Needed for:** **Reduction of general CM points to primitive fields**. **Resolution:** ShimuraVarieties:V4 and PELModuli:M6

### G-PeriodReduction: Quantitative hermitian and Siegel reduction

Pila–Tsimerman §3 is read; complete the cited reduction estimates in the supplier’s own proof, in all dimensions and for arbitrary center orders. Prove a symplectic reduction matrix bound polynomial in analytic h₀, balance each isotypic hermitian lattice and convert the bound to algebraic coordinate heights. Generic IntegralLattices duality does not supply this quantitative statement.

**Needed for:** **CM period height under Siegel reduction**. **Resolution:** GeometryOfNumbersAndQuadraticArithmetic:GN.1 and GN.3

### G-ErratumEdition: Journal/author erratum collation

The revised author erratum dated 18 December 2022 (11 pages) is read in full. The Annals 198 (2023), pp. 867–878 edition has not been collated against it. Keep author-version pagination explicit and reconcile all changed statements before a source-closed package.

**Needed for:** **Different-torsion graph datum**; **CM torsion comparison modulo the different**; **Ramified component determinant cancellation**. **Resolution:** Read the stated primary proof, prove the exact comparison, and pass its discriminating checks before claiming proof closure.

## Source corrections used by the targets

The descriptions below are our own mathematical statements. They distinguish a corrected assertion from a proof still requiring verification. Existing paper-audit identifiers preserve the prior attribution; this roadmap does not represent itself as an independent errata review.

### E1 — Lemma 9.4.4, pp. 517–518

**Issue (error; affects the proof).** The final length subtracts half the discriminant from the two within-part sums.

**Required form.** Reverse that subtraction: cross-resultant length equals half the discriminant minus the within-part sums.

**Reason.** For a ramified quadratic extension and singleton parts, the within-part sums vanish but the quotient has positive length.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E1; no separate published correction was established in the sources examined.

### E2 — Proposition 9.4.5, p. 519 and (9.4.13), p. 522

**Issue (error; affects the proof).** A negative factor multiplies the sum of the two conductor values.

**Required form.** Use +(e_P/2)(μ_p(a_Υ)+μ_p(a_Υc)); propagate the positive sign to the local reflex length.

**Reason.** For Q_3(√3), the two singleton conductor values are positive and the partition length is 1.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E2; no separate published correction was established in the sources examined.

### E3 — Lemma 9.4.3, p. 516

**Issue (error; affects the proof).** An arbitrary integral top de Rham generator is assigned a fixed absolute period, with an inverse power of 2π in the displayed conclusion.

**Required form.** Choose the algebraic de Rham trace-one generator, whose absolute period is (2π)^r for an abelian r-fold. An arbitrary unit multiple carries its archimedean absolute unit factor.

**Reason.** The trace comparison is Tr_dR(η)=(2πi)^(-r)∫η. For trace one this gives ∫η=(2πi)^r; scaling η scales the period.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E3; no separate published correction was established in the sources examined.

### E4 — Standard Hodge-line metric, p. 514

**Issue (error; affects the proof).** The displayed negative bilinear value is assigned as the squared norm.

**Required form.** Use the positive absolute bilinear value in the convention of V₀; recheck the full determinant isometry under G-Metric.

**Reason.** The selected standard CM Hodge vector has positive bilinear pairing with its conjugate in this convention; its negative is not a positive norm.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E4; no separate published correction was established in the sources examined.

### E5 — Equation (9.5.3), p. 523

**Issue (error; affects the proof).** A full orthogonal lattice is identified with the proposed scalar rescaling of the standard CM lattice.

**Required form.** Replace the full-lattice step by a proved comparison of the actual integral filtered Hodge lines; G-OrthogonalAdapter retains the missing argument.

**Reason.** The different-ideal scaling on the two lattices does not follow from the displayed scalar norm equation.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E6; no separate published correction was established in the sources examined.

### E6 — Equation (9.5.1), p. 523

**Issue (misprint; affects the proof).** The comparison omits the common complex-cycle degree normalization.

**Required form.** Normalize every arithmetic degree by the corresponding weighted complex degree.

**Reason.** A finite étale level change scales numerator and denominator equally; an unnormalized equality fails that check.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E7; no separate published correction was established in the sources examined.

### E7 — Proposition 3.5.2, p. 422

**Issue (misprint; affects nothing).** An undefined lattice symbol occurs in the crystalline-representation statement.

**Required form.** Use the previously fixed N_p lattice and its fiber N_p,y, then invert p.

**Reason.** The proposition introduces no second lattice; its functorial construction acts on N_p.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E11; no separate published correction was established in the sources examined.

### E8 — Proposition 3.6.1, p. 430

**Issue (misprint; affects nothing).** The nonsplit condition names the wrong intermediate field.

**Required form.** The quadratic extension E/F must be nonsplit at the selected place of F.

**Reason.** The endomorphism invariant-span calculation distinguishes split from field quadratic E_v/F_v.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E12; no separate published correction was established in the sources examined.

### E9 — Conductor functional, p. 518

**Issue (error; affects a stated result).** Finite-image irreducible characters are said to span all continuous complex class functions, and the extension is called a measure.

**Required form.** Use locally constant functions factoring through finite quotients and a quotient-compatible linear functional.

**Reason.** A continuous function on a profinite group need not factor through a finite quotient; character finite sums do, and a conductor functional need not be bounded.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E23; no separate published correction was established in the sources examined.

### E10 — Equation (9.5.5), p. 526

**Issue (misprint; affects the proof).** The intermediate Hodge-height relation is written as an exact equality.

**Required form.** Retain equality modulo rational logarithms at the declared bad primes until the prime-elimination step.

**Reason.** The imported Theorem 8.3.4 and Proposition 9.5.1 still carry precisely that ambiguity.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E24; no separate published correction was established in the sources examined.

### E11 — Support condition in the proof of Theorem 9.5.5, p. 526

**Issue (misprint; affects the proof).** The support restriction is applied to Fourier coefficients without restricting to negative indices.

**Required form.** Restrict the condition to principal-part coefficients c_f(−m,μ), m>0, while retaining c_f(0,0)≠0.

**Reason.** The constant coefficient supplies the nonzero Hodge-line multiple and cannot be eliminated by the negative-support condition.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E25; no separate published correction was established in the sources examined.

### E12 — Kernel identification in §3.1, p. 415

**Issue (error; affects a stated result).** The diagonal scalar G_m is treated as the kernel G_m without accounting for its isogeny.

**Required form.** Identify the quotient Res_F G_m/ker Nm_F/Q with G_m using the norm; the diagonal scalar map has kernel μ_d.

**Reason.** The norm of a rational scalar is its dth power.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E32; no separate published correction was established in the sources examined.

### E13 — Compact open K₀, §3.2, pp. 416–417

**Issue (error; affects a stated result).** The integral-unit-image subgroup is identified with the maximal compact.

**Required form.** Use K_so,p=im(O_E,p×) and its compact inverse image with unit scalar kernel; it need not be maximal compact.

**Reason.** At a ramified quadratic local place the uniformizer class has order two in E_v×/F_v× but has no unit representative.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E34; no separate published correction was established in the sources examined.

### E14 — Proposition 3.5.5, pp. 425–427

**Issue (gap; affects a stated result).** A single integral crystal is asserted without retaining the base étaleness restriction.

**Required form.** Extend the filtered de Rham bundle globally; assert the F-crystal on the locus étale over O_E and use pointwise BK fibers elsewhere.

**Reason.** The crystalline site over the indicated unramified base does not supply the same global construction on an arbitrary ramified normalization.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E35; no separate published correction was established in the sources examined.

### E15 — Original Theorem 2.7, pp. 549–550; revised erratum Theorem 1, pp. 1–2

**Issue (gap; affects the proof).** The nearby comparison is asserted for an arbitrary O_E-isogenous target and justified through an exact sequence of integral models.

**Required form.** Use the graph of a specified different-torsion isomorphism; prove its integral graph and relative determinant comparison before using the nearby identity.

**Reason.** Exactness on generic abelian varieties alone does not establish the required exact sequence of integral models.

**Correction status.** Author erratum revised 18 December 2022, §1, Theorem 1; published Annals 198 (2023), pp. 867–878. The author text is read; journal edition is not collated.

### E16 — Erratum, §3, p. 11, different-torsion isomorphism target

**Issue (misprint; affects nothing).** The target torsion symbol in the graph argument uses the wrong ideal.

**Required form.** The target is A₂[δ_E/F], matching A₁[δ_E/F].

**Reason.** Both projections of the graph are identified with the different-torsion group.

**Correction status.** Already recorded in PAPER-YUAN-ZHANG-18/E2; no separate published correction was established in the sources examined.

### E17 — Erratum Proposition 6, pp. 9–10

**Issue (gap; affects the proof).** The component tensor sequence and its determinant cancellation are treated as exact and locally free at ramified places.

**Required form.** Supply the relative/image Hodge determinant comparison G-RamifiedComponent with Cartier-duality compatibility.

**Reason.** For a ramified quadratic F_p/Q_p the opposite-eigenvalue quotient O_L/(2√p) is nonzero torsion; naive tensoring is not exact.

**Correction status.** Already recorded in PAPER-YUAN-ZHANG-18/E3; no separate published correction was established in the sources examined.

### E18 — Theorem 2.2 proof, pp. 545–546

**Issue (error; affects the proof).** One p-adic Galois element is used as complex conjugation on all embedding factors.

**Required form.** Pair the complete product of p-adic embeddings by the CM involution and use the norm product.

**Reason.** For E=Q(i) and p=5 the two completions are Q_5 and their local decomposition groups do not interchange them.

**Correction status.** Already recorded in PAPER-YUAN-ZHANG-18/E4; no separate published correction was established in the sources examined.

### E19 — Local monogenic reduction, p. 547

**Issue (gap; affects the proof).** The full O_E⊗Z_p algebra is treated as monogenic without qualification.

**Required form.** Enlarge the unramified coefficient residue field as needed, use its idempotent factors, and choose a local generator factorwise.

**Reason.** For E=Q(√17,√−7), p=2 splits completely and O_E⊗Z_2=Z_2^4; F_2^4 cannot be generated by one element over F_2.

**Correction status.** Already recorded in PAPER-YUAN-ZHANG-18/E5; no separate published correction was established in the sources examined.

### E20 — Component-height normalization in §1.2, p. 537

**Issue (misprint; affects the proof).** The introductory component degree omits the absolute field-degree denominator.

**Required form.** Use normalized arithmetic degree divided by [K:Q] for CM component heights, consistently with §2.2.

**Reason.** Without that division the value changes after extending K, contrary to type invariance.

**Correction status.** Already recorded in PAPER-YUAN-ZHANG-18/E6; no separate published correction was established in the sources examined.

### E21 — Proposition 5.4, pp. 573–575

**Issue (gap; affects the proof).** Raw τ-component quotients are used as if locally free over O_K.

**Required form.** Compare them with relative/image Hodge lattices and retain different-torsion lengths before taking determinants.

**Reason.** Ramified base change of an embedding quotient can contain torsion and fail the claimed rank.

**Correction status.** Already recorded in PAPER-YUAN-ZHANG-18/E31; no separate published correction was established in the sources examined.

### E22 — Erratum, p. 4, automorphism extension used on pp. 10–11

**Issue (gap; affects the proof).** Existence of an integral torsion isomorphism is used to extend a particular generic graph isomorphism.

**Required form.** Prove extension of every generic O_E-linear unit automorphism, then compose with the chosen integral isomorphism.

**Reason.** Two generic isomorphisms differ by an automorphism, and extending one does not by itself extend the other.

**Correction status.** Already recorded in PAPER-YUAN-ZHANG-18/E40; no separate published correction was established in the sources examined.

### E23 — Erratum CM Kisin formulas, pp. 7–9

**Issue (misprint; affects nothing).** The Frobenius multiplier notation suppresses the permutation of coefficient embeddings.

**Required form.** Write φ(e_ι)=a_ι e_(φ∘ι) with semilinear coefficients, or use the explicit linearized Frobenius pullback.

**Reason.** Frobenius acts nontrivially on unramified coefficient embeddings; a fixed-idempotent formula changes the module.

**Correction status.** Already recorded in PAPER-YUAN-ZHANG-18/E41; no separate published correction was established in the sources examined.

### E24 — Erratum Frobenius contraction, p. 7

**Issue (gap; affects the proof).** The asserted contraction is used at a starting exponent that can equal one.

**Required form.** Start sufficiently deep, in particular n≥2, so the Frobenius filtration strictly increases.

**Reason.** If the local ramification index is one, a bound n≥e_v alone does not ensure the claimed strict contraction.

**Correction status.** Already recorded in PAPER-YUAN-ZHANG-18/E42; no separate published correction was established in the sources examined.

### E25 — Corollary 3.3 proof, p. 384

**Issue (gap; affects the proof).** The Cauchy estimate appeals to general Artin L-functions as holomorphic on a disk.

**Required form.** Use the entire quadratic Hecke L-function in the averaged formula and the uniform varying-base estimates of G-HeckeUniform.

**Reason.** General Artin holomorphy is not an unconditional input; the quadratic Hecke route avoids that assumption.

**Correction status.** Already recorded in PAPER-TSIMERMAN-18/E9; no separate published correction was established in the sources examined.

### E26 — Lemma 4.1 and Theorem 4.2 proof, pp. 384–385

**Issue (gap; affects the proof).** Coarse descent and the common-field bound are used without consistently retaining the polarization transported to B.

**Required form.** Descend polarized objects with rigid level three; transport λ_A along the E-linear isogeny and use a common field of degree bounded by the product of the two polarized moduli degrees times dimension constants.

**Reason.** A polarization on B chosen independently need not be carried by the fixed E-linear isogeny, and unpolarized descent does not yield the stated comparison.

**Correction status.** Already recorded in PAPER-TSIMERMAN-18/E10; no separate published correction was established in the sources examined.

### E27 — Lower-bound constant in §3, pp. 383–384

**Issue (misprint; affects nothing).** The dimension-only lower bound for stable Faltings height is described with an unnecessary positive-sign convention.

**Required form.** Use a real lower bound b_g and the safe complexity max(1,h_F,[K:Q]).

**Reason.** Stable Faltings heights can be negative; positivity is not needed by the average-to-individual inequality.

**Correction status.** Already recorded in PAPER-TSIMERMAN-18/E11; no separate published correction was established in the sources examined.

### E28 — CM coordinate degree, §6.2, p. 387

**Issue (error; affects a stated result).** The displayed degree bound for the CM lift coordinates is too small in general.

**Required form.** Use the splitting-field bound (2g)! for complex entries and 2(2g)! for real/imaginary entries; bounded degree is all the argument needs.

**Reason.** The coordinates come from composita of CM embeddings, rather than necessarily a single degree-2g field.

**Correction status.** Already recorded in PAPER-TSIMERMAN-18/E12; no separate published correction was established in the sources examined.

### E29 — Equation (3.2.2), p. 417

**Issue (error; affects nothing).** The local cohomology cokernel is written as the direct sum of the individual local norm quotients.

**Required form.** Use Q_p×/Nm_((F⊗Q_p)/Q_p)((F⊗Q_p)×), quotienting by the product of the local norm groups.

**Reason.** The norm from a product algebra is the product of its norms. If one factor is Q_p its norm group is all of Q_p×, so the common quotient vanishes even when another factor has a nontrivial individual norm quotient.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E33; no separate published correction was established in the sources examined.

### E30 — Proposition 3.5.5(5), p. 425

**Issue (misprint; affects nothing).** The displayed Witt-vector thickening uses the finite residue field although the point is geometric.

**Required form.** At y with residue field kbar, evaluate on the PD thickening Spf W(kbar).

**Reason.** The fiber crystal in the local construction is defined over W(kbar), not over the finite-field ring without the geometric base change.

**Correction status.** Already recorded in PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/E36; no separate published correction was established in the sources examined.

### E31 — Deformation Hom comparison in §5.2, pp. 575–576

**Issue (error; affects the proof).** An O_E-linear deformation Hom is identified with the O_B-linear Hom and used as a universal deformation space.

**Required form.** Keep the extra quaternionic/polarization conditions. Derive the needed determinant isometry from the actual Hodge lattices and their canceled twists, subject to G-IntegralKS.

**Reason.** At the changed place the O_E-linear Hom has rank two while the O_B-linear Hom has rank one. The full O_E deformation problem moves two lines independently; its curve locus has extra conditions.

**Correction status.** Already recorded in PAPER-YUAN-ZHANG-18/E32; no separate published correction was established in the sources examined.

### E32 — Tsimerman (2012), arXiv:1103.5619v2, §7.2, preprint p. 18, after (4)

**Issue (error; affects a stated result).** The center-order discriminant is expressed using the square of the Mumford–Tate compact-subgroup index.

**Required form.** Use D_x=[O_x:R_x]²∏D_Ki; compare the order index with the compact index by Lemma 7.2 as a separate inequality.

**Reason.** The trace-form change-of-basis identity concerns an index of Z-orders, not an index of adelic compact subgroups.

**Correction status.** Already separated in PAPER-TSIMERMAN-18/cm-centre-order-discriminant. The 2012 journal/preprint notation has not been collated; this finding concerns the stated arXiv version.

### E33 — Pila–Tsimerman (2013), arXiv:1106.4023v1, Lemma 3.3, preprint p. 4

**Issue (misprint; affects the proof).** The standard complex-embedding covolume is written with the field discriminant rather than its square root and complex-place factor.

**Required form.** Use covolume(I)=2^(−g)√D_E[O_E:I] with ordinary real Lebesgue measure on C^g.

**Reason.** For Z[i]⊂C the covolume is one; 2^(-1)√4=1, whereas the displayed discriminant expression gives four. Polynomial dependence is unaffected.

**Correction status.** Already recorded in PAPER-TSIMERMAN-18/cm-lattice-bounded-basis; the cited preprint is the version read here.

### E34 — Pila–Tsimerman (2013), arXiv:1106.4023v1, Lemma 3.6 and its proof, preprint p. 8

**Issue (gap; affects the proof).** The product-decomposition isogeny and intermediate lattice index are bounded using only Disc(O_A).

**Required form.** Retain dependence on Disc(R), including e_R=[O_A:R], in this step and in the hermitian reduction argument.

**Reason.** The proof uses e_RJ⊂I⊂J. The resulting bound on [J:I] depends on e_R, which is not bounded by the maximal-algebra discriminant alone. The final theorem already uses Disc(R).

**Correction status.** Proof-dependence gap recorded in this planning pass for arXiv:1106.4023v1; no published correction established, and journal collation is not claimed.

### E35 — Theorem 9.1.5, p. 509, compared with Colmez (1993), Theorem 0.3, p. 631

**Issue (error; affects a stated result).** The full CM⁰ functional is asserted to be uniquely specified by its values on the total-height overlap functions.

**Required form.** State uniqueness on H_CM, their Q-span. For the full CM⁰ functional retain Colmez’s extra component-period values and prove the normalization adapter.

**Reason.** All a⁰_Φ(c)=0, while the constant function 1 belongs to CM⁰. Evaluation at c therefore gives a nonzero linear functional vanishing on every specified overlap. Also all overlaps are inversion-invariant, unlike general members of CM⁰. Colmez’s original theorem uses component characters, not just overlaps.

**Correction status.** Domain/uniqueness discrepancy identified in this planning pass by comparing the two primary statements. No separate published correction was established; the underlying existence and averaged-height results are not refuted by this counterexample.

## Source editions and reading boundaries

All primary sources below were accessed on 19 October 2026. Journal and preprint pagination are kept separate. The author erratum was read in full; its journal edition was identified through the publisher but not collated. Primary references quoted only by another paper remain proof gates rather than silently verified sources. Vignéras is not in the cleared reference index and no other copy was used.

- **[The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf)**, Jacob Tsimerman, Annals 187 (2018), 379–390. Read: Entire article, §§1–6, pp. 379–390.
- **[Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf)**, Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera, Annals 187 (2018), 391–531. Read: Introduction, pp. 391–396; §3, pp. 414–431; §9, pp. 508–526; statements of Theorems 6.4.2 and 8.3.4; local source repairs listed below.
- **[On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf)**, Xinyi Yuan; Shou-Wu Zhang, Annals 187 (2018), 533–638. Read: §1, pp. 534–541; §2.2, pp. 544–550; §5.2–5.3, pp. 573–577; §9.1–9.2 target statements and adjunction setup, pp. 624–631.
- **[Erratum to On the Averaged Colmez Conjecture](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf)**, Xinyi Yuan; Shou-Wu Zhang, Author revision dated 18 December 2022, 11 pages; journal erratum Annals 198 (2023), 867–878 not collated. Read: Entire revised author erratum, §§1–3, pp. 1–11.
- **[Brauer–Siegel for arithmetic tori and lower bounds for Galois orbits of special points](https://arxiv.org/pdf/1103.5619v2)**, Jacob Tsimerman, arXiv:1103.5619v2; use preprint pagination, not JAMS pagination. Read: §7.1–7.2, pp. 15–20.
- **[The André–Oort conjecture for the moduli space of Abelian surfaces](https://arxiv.org/pdf/1106.4023v1)**, Jonathan Pila; Jacob Tsimerman, arXiv:1106.4023v1; Compositio 149 (2013), 204–216. Read: §3: CM coordinates and height bounds; preprint pagination.
- **[Ax–Lindemann for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf)**, Jonathan Pila; Jacob Tsimerman, Annals 179 (2014), 659–681. Read: §7, Conjecture 7.1, p. 673 and Lemma 7.4, p. 675.
- **[Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf)**, David Masser; Umberto Zannier, Annals 191 (2020), 635–674, public supplemental article PDF. Read: §5.4, CM-point finiteness consumer.
- **[Périodes des variétés abéliennes à multiplication complexe](https://webusers.imj-prg.fr/~pierre.colmez/artin.pdf)**, Pierre Colmez, Annals 138 (1993), 625–683; author-hosted scan. Read: Introduction, definitions and statements, pp. 627–632, especially component generators on p. 630 and Theorem 0.3, p. 631; underlying period-relation proofs remain a gate.

## Suggested signatures

The suggested Lean file contains the finite type-cube counting statements, numerical adjunction/average/metric adapters, the native CM regulator input, relative class-number growth, the average-to-individual inequality and the primitive exponent budget, together with representative checks. These statements use the pinned carriers. They do not implement the mathematics.

The full definitions of CM class functions and the individual-conjecture predicate, height torus, compact integral level, total reflex pair, integral representations, standard metrized line, determinant section, DVR partition quotient, conductor functional, nearby height, different-graph datum, quaternionic CM height and center order are the targets above. Their API and at least three discriminating Checks remain here. No abstract placeholder for an integral model, Hodge line, moduli space, height function or arithmetic Chow group is introduced to force a signature into Lean.

The final averaged formula, CM isogeny comparisons, primitive and general polarized orbit theorems, period-height theorem and bounded-moduli-degree finiteness theorem require these mathematical carriers and are therefore stated in full in this document. Their dependency chains end at verified pinned inputs, exact imported targets, the supplier contracts, or the explicit proof gates above.
