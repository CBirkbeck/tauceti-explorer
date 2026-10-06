# Even groups and arithmetic cohomology — N.6

This is the target-level follow-up of the accepted [N.1 packet](../packets/ArithmeticKTheory--N.1.json) for **ArithmeticKTheory:N.6**. It completes the planning pass for the four items in that packet’s remaining list: the even two-ranks, the use of local norm groups, the finite-coefficient and cohomological kernels, and the proof architecture of Weibel’s divisibility comparison. The definitive mathematical plan is this document together with [its packet](../packets/ArithmeticKTheory--N.6.json). All declarations have implementation status **unchecked**.

The pass is **planned**, not closed. Two exact proof obligations remain: the comparison with the full higher completion kernel, and the corrected cyclotomic localisation argument described below. They are mathematical boundaries of the plan, not assertions supplied by a type parameter. The numerical function in the suggested file and the generic map constructors do not implement a higher K-group or an étale comparison.

## Scope, carriers and ownership

Let F be a number field, S a finite set of finite primes, and O_{F,S} its S-integer ring. Use the parent’s carrier, Mathlib’s `Set.integer`, throughout. The higher K-groups, coefficient groups, twists and cohomology are the actual carriers supplied by the foundational roadmaps. This part does not define them a second time. Write A{ℓ} for the ℓ-primary subgroup of an abelian group A, and A[m] for its m-torsion subgroup. The notation A/m means the integral quotient A/mA; A with coefficients Z/m is a different object.

The parent’s following N.6 nodes remain authoritative imports: `even-groups-at-odd-primes`, `the-two-primary-corrections`, `even-groups-of-a-totally-imaginary-field`, `even-groups-modulo-l`, `l-rank-from-class-group-data`, `signature-defect`, `order-ratio-for-totally-real-fields`, `divisible-subgroup`, `tame-and-wild-kernels`, `order-certificate` and `certificate-driven-computation`. Its Keune injection is a separate arithmetic route with its own recorded source gap; the present divisibility proof does not depend on that injection. Soulé’s theorem, finiteness, the localisation sequence and the S-unit/class-group row are also imported by node id. The tame kernel and its symbol presentation belong to K2SymbolsBrauer T.5. There is no replacement definition here.

For a real field set r₁ equal to its number of real places and r₂ equal to its number of complex places. In the dyadic rank calculation, S contains every dyadic prime, so 1/2 is a unit of R=O_{F,S}. Set s=|S|, t=dim Pic(R)/2, u=dim Pic⁺(R)/2 and j=u−t. The parent defines j by the signs of **Selmer square classes**: classes in Fˣ/Fˣ² with even valuations outside S. These classes include the contribution from Pic(R)[2]. Restricting only the S-unit signature map changes the invariant in general. Weibel’s wild-kernel paper §6.6 also uses a unit-sign defect in its positive Picard sequence. That quantity must have a separate name; it is not substituted for j in the K-book’s rank formula. The parameter ρ in the integral 8k+4 row is separate again.

There are two wild kernels. The parent’s WK^raw is the intersection of kernels of the maps into the **full** K-groups of the completions, including real places. The new WK^sym is the kernel of their finite symbol quotients and the applicable real symbols, exactly the object of Weibel’s Definition 0.2. Both names persist until their equality is proved. Degree two has a proved comparison; higher degree has the precise extra condition G1.

For finite local symbol targets use D_i(F_v)=⊕_ℓ H²(F_v,Z_ℓ(i+1)). This finite cyclic quotient has order w_i(F_v). The global target D_i(F) is the Pontryagin dual of H⁰(F,Q/Z(−i)), also of order w_i(F). The paper writes these targets as twisted roots. Their cyclic orders agree, but the duality maps and a chosen cyclic identification are part of the interface. Identifying the groups with cyclic groups of known orders does not specify their restriction, invariant or corestriction maps. In particular, a cohomological corestriction map is not automatically the ordinary norm on a root module.

## Baseline and supplier boundaries

The library audit for N.6 reports the arithmetic higher K/cohomology descriptions as absent. The supplied baseline source trees were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Existing number fields, S-integers, ordinary/narrow class groups, two-ranks, signatures, elementary two-quotients, determinant norms and local unit filtrations are reused. They do not provide the missing higher K-groups or arithmetic étale comparisons.

The existing ordinary-unit theorem `NumberField.twoRank_units` concerns S empty. It is a useful check on the Dirichlet input, but does not alone supply the additional s dimensions for S-units. The imported N.2 S-unit/class-group row and its finite-generation/rank input provide that extension. The existing class-group two-rank is the dimension of the elementary square quotient, rather than a cardinality chosen to fit an analytic formula.

Seven direct baseline declarations are recorded in this part. `Algebra.norm` is the determinant norm, a multiplicative homomorphism; applying `Units.map` gives the actual multiplicative-group norm. `FiniteField.unitsMap_norm_surjective` proves surjectivity on the whole finite-field unit group. `FiniteField.algebraMap_norm_eq_pow` gives its power formula. Neither proves surjectivity after restriction to a root-twist subgroup. Tau Ceti’s `unitFiltration`, `unitFiltration_zero` and `unitFiltration_one` give congruence subgroups, valuation units and principal units, respectively. `ZMod` supplies the numerical coefficient ring. Their statements were read at the pins, rather than inferred from their names.

M.7 owns the generic dyadic spectral-sequence calculation. N.6 consumes its coefficient filtrations and integral comparison maps, then evaluates their arithmetic dimensions and finite orders. M.2 owns their arithmetic cohomology comparison diagrams; ArithmeticGaloisDuality supplies the already planned finite Kummer sequence, Poitou–Tate theorem and continuous inverse-limit theorem. L.6 owns the local integral and completed structures, while L.7 owns completion, restriction, transfer, boundary and Chern-class compatibility. I.1 supplies cyclotomic actions and decomposition groups, I.2 supplies the finite class-group systems, and SelmerIwasawaCohomology L2 supplies generic local conditions and Selmer carriers. The existing ClassFieldTheory roadmap supplies local reciprocity’s norm-kernel criterion. These requests concern precise missing interfaces and do not create second proof owners.

## Arithmetic ranks and finite-coefficient divisibility

The first seven declarations extract arithmetic information from the imported coefficient theory. The order of a mod-two coefficient group is used through its exact filtration. It is not given a vector-space structure merely because the coefficient modulus is two: an extension of elementary two-groups can contain elements of order four. For the positive even degree n, the universal coefficient sequence relates this order to K_n(R)/2 and K_{n−1}(R)[2]. The preceding odd torsion group supplies the subtraction; for n=2 that group is K₁ and must be calculated from the units.

The function `evenTwoRank` is a total numerical aid. Its zero value at odd arguments is a convention, and its degree-zero branch has no theorem about K₀ attached to it. The arithmetic theorem is stated only for positive even degrees. All three distinctions—rank versus order, degree zero versus positive degree, and coefficient K-theory versus an integral quotient—are acceptance conditions.

### Arithmetic mod-two cohomology dimensions

**TauCeti.ArithmeticKTheory.N6.arithmeticModTwoDimensions** (`ArithmeticKTheory:N.6/arithmetic-mod-two-dimensions`, application).

Let R=O_{F,S} contain 1/2 and let r₁>0, r₂, s=|S|, t=dim Pic(R)/2 and u=dim Pic⁺(R)/2. With j=u−t the imported Selmer signature defect, dim H¹_et(R,F₂)=r₁+r₂+s+t, dim H²_et(R,F₂)=r₁+s+t−1, the image of restriction α¹ to the r₁ real places has dimension r₁−j, and α² is surjective. Here S consists of the finite primes inverted in R, not the finite primes remaining in Spec R.

Proof or construction. Use the S-unit Kummer sequence, Dirichlet’s S-unit rank and the finite class-group equality |Pic[2]|=|Pic/2|. The existing unit two-rank theorem covers only S empty; the S-unit extension is supplied by the imported N.2 row. Use the Kummer sequence in degree two and the Brauer invariant sum over S and the real places to get r₁+s−1 dimensions in Br(R)[2]. These Brauer and real-restriction maps are requested from M.2. Use the sign restriction interpretation and j=u−t from the parent signature-defect node, rather than the defect of the signs of units alone.

Direct inputs: `ArithmeticKTheory:N.6/signature-defect`, `ArithmeticGaloisDuality:R02.3/s-unit-kummer-sequence`, `MotivicEtaleKTheory:M.2`, `ArithmeticKTheory:N.2/S-unit-and-class-group-sequence`.

Source: K-book VI.9.6–9.6.2, book pp. 520–521, PDF pp. 528–529.

Acceptance: R=Z[1/2]: dimensions H¹=2, H²=1, j=0. The condition 1/2∈R is required; the étale description fails in this form over Z.

### Modified mod-two cohomology dimensions

**TauCeti.ArithmeticKTheory.N6.modifiedModTwoDimensions** (`ArithmeticKTheory:N.6/modified-mod-two-dimensions`, application).

In the preceding setting define H̃¹ and H̃² using M.2’s real-restriction kernels and its exact sequence, as in VI.9.6.3. Then dim H̃¹_et(R,F₂)=r₂+s+u=r₂+s+t+j and dim H̃²_et(R,F₂)=s+t−1. These are modified groups, not totally positive Hⁿ₊ and not ordinary Hⁿ.

Proof or construction. Take kernel dimensions of α¹ and α² in the exact sequence of VI.9.6.2, using the preceding image and surjectivity statements. Substitute u=t+j; preserve the real-place map so the modified groups remain functorial.

Direct inputs: `ArithmeticKTheory:N.6/arithmetic-mod-two-dimensions`, `MotivicEtaleKTheory:M.2`.

Source: K-book Lemma VI.9.6.3, book p. 521, PDF p. 529.

Acceptance: Z[1/2] gives modified dimensions 1 and 0. The second expression is nonnegative since S contains a dyadic prime.

### Orders in the mod-two coefficient table

**TauCeti.ArithmeticKTheory.N6.modTwoCoefficientOrders** (`ArithmeticKTheory:N.6/mod-two-coefficient-orders`, comparison).

For n>0, R as above, let a=r₁+r₂+s+t, b=r₁+s+t−1, c=r₂+s+t+j, d=s+t−1. The finite group K_n(R;Z/2) has order 2^e, with e=d+1,a,b+1,r₁−1+a,j+b,r₁−1+c,j+d,c in residues n≡0,1,2,3,4,5,6,7 modulo 8 respectively. Keep the filtrations and the stated splittings of VI.9.7 in the M.7 supplier. An extension of elementary 2-groups need not be elementary; e is a log₂ cardinality, not necessarily an F₂ dimension.

Proof or construction. Import the eight exact filtrations of VI.9.7 from the unique M.7 owner, including the extra Z/2 in residues 0 and 2. Multiply finite-group orders in each short exact sequence, applying the two dimension nodes. Do not infer a splitting in residues 2,3,4,5.

Direct inputs: `ArithmeticKTheory:N.6/arithmetic-mod-two-dimensions`, `ArithmeticKTheory:N.6/modified-mod-two-dimensions`, `MotivicEtaleKTheory:M.7`.

Source: K-book Theorem VI.9.7, book pp. 521–522, PDF pp. 529–530.

Acceptance: For Z[1/2] the exponents in residues 0 through 7 are 1,2,2,2,1,1,0,1. The prototype must not give K_n(;Z/2) a vector-space structure merely from its coefficient modulus.

### The even two-rank table

**TauCeti.ArithmeticKTheory.N6.evenTwoRank** (`ArithmeticKTheory:N.6/even-two-rank-function`, construction).

For nonnegative integers r,s,t,j,n define evenTwoRank(r,s,t,j,n) by r+s+t−1 if n≡2 mod 8, j+s+t−1 if n≡4 or 6 mod 8, and s+t−1 if n≡0 mod 8. It is a numerical function, with value zero on odd residues as a totalisation convention; no K-theoretic meaning is assigned at odd n or n=0. The arithmetic application requires n>0, n even, r=r₁>0, S containing the dyadic primes, t the ordinary class-group two-rank and j the Selmer signature defect.

Proof or construction. Read the four branches of Corollary VI.9.9. Define the function by n modulo 8; natural subtraction agrees with the integer expression on arithmetic inputs because s≥1.

Direct inputs: `mathlib:ZMod`.

Source: K-book Corollary VI.9.9, book p. 523, PDF p. 531.

Its public API follows its uses: VI.9.9 and ArithmeticKTheory:N.8: Select the numerical rank expected from certified class-group and signature data. ArithmeticKTheory:N.7: Check the dyadic rank before constructing an order certificate.

- **evenTwoRank_residue_two** (simp): If n mod 8=2, the value is r+s+t−1.
- **evenTwoRank_residue_four** (simp): If n mod 8=4, the value is j+s+t−1.
- **evenTwoRank_residue_six** (simp): If n mod 8=6, the value is j+s+t−1.
- **evenTwoRank_residue_zero** (simp): If n mod 8=0, the value is s+t−1.
- **evenTwoRank_periodic** (compatibility): evenTwoRank(r,s,t,j,n+8)=evenTwoRank(r,s,t,j,n).

Discriminating unit tests:

- **rankTable_rational** (computation): For (r,s,t,j)=(1,1,0,0), the values at n=2,4,6,8 are 1,0,0,0.
- **rankTable_real_defect** (computation): For (2,1,0,1), the values at n=2,4,6,8 are 2,1,1,0.
- **rankTable_extra_prime** (compatibility): For s≥1 and even n, replacing s by s+1 increases the value by one.
- **rankTable_odd_totalisation** (degenerate): The value at n=1 is zero by the totalisation convention, with no claim about K₁.

Acceptance: The numerical function alone is not evidence for the order or exponent of a K-group.

### Even K-group two-ranks from arithmetic data

**TauCeti.ArithmeticKTheory.N6.evenTwoRanks** (`ArithmeticKTheory:N.6/even-two-ranks-from-arithmetic`, theorem).

For R=O_{F,S} containing 1/2, r₁>0 and every positive even n, dim_F₂ K_n(R)/2 = evenTwoRank(r₁,|S|,t,j,n). Thus the ranks are r₁+s+t−1, j+s+t−1, j+s+t−1, s+t−1 in residues 2,4,6,0 mod 8. This gives the number of dyadic cyclic factors, not their orders. The theorem is independent of the undetermined extension rank ρ in the integral 8k+4 row.

Proof or construction. Use the universal coefficient short exact sequence 0→K_n(R)/2→K_n(R;Z/2)→K_{n−1}(R)[2]→0 requested from H.6. Subtract the log₂ order of the preceding odd-degree two-torsion from the coefficient-order table. For n=2, use the S-unit square classes, not the n≥2 odd table. Use the parent odd integral table for n≥4 and cancel r₂. Do not substitute ρ for j.

Direct inputs: `ArithmeticKTheory:N.6/even-two-rank-function`, `ArithmeticKTheory:N.6/mod-two-coefficient-orders`, `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `StableHomotopyKTheory:H.6`.

Source: K-book Corollary VI.9.9 and its proof, book p. 523, PDF p. 531.

Acceptance: Z[1/2] has ranks 1,0,0,0 in degrees 2,4,6,8. The source examples Q(√2) and Q(√7) have (r₁,s,t,j)=(2,1,0,0) and (2,1,0,1), giving 2,0,0,0 and 2,1,1,0. Degree zero is excluded.

### Divisible elements and finite-coefficient localisation

**TauCeti.ArithmeticKTheory.N6.finiteCoefficientDivisibilityKernel** (`ArithmeticKTheory:N.6/finite-coefficient-divisibility-kernel`, comparison).

Let R=O_{F,S}, n>0 even, T=K_n(R) embedded in K_n(F) by Soulé, and m≥2 annihilate the finite group T. Under the universal coefficient injection T=T/m→K_n(R;Z/m), the kernel of K_n(R;Z/m)→K_n(F;Z/m) is exactly div K_n(F). In particular this kernel is contained in the integral subgroup T. The modulus m is an annihilator, not an arbitrary prime; the statement does not identify every finite-coefficient K-group with an integral quotient.

Proof or construction. In the universal coefficient diagram, integral Soulé injectivity in the preceding odd degree forces the coefficient kernel into T/m. Use the separately imported Soulé finite-coefficient boundary surjectivity for the coefficient-localisation argument. An element divisible in K_n(F) maps to zero in each quotient K_n(F)/m and hence into the stated kernel. For the converse use the finite-field boundary groups and multiplication diagram of V.6.8.2, with mT=0; retain the source’s annihilator hypothesis.

Direct inputs: `ArithmeticKTheory:N.6/divisible-subgroup`, `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `StableHomotopyKTheory:H.6`, `KTheoryFiniteLocalFields:L.1/quillen-k-groups`, `ArithmeticKTheory:N.5/soule-mod-l-surjectivity`.

Source: K-book V.6.8.2, book pp. 412–413, PDF pp. 420–421.

Acceptance: Removing mT=0 changes the domain from T to T/m and cannot give the stated subgroup identification. The result says div in the ambient field can be nonzero even though div T=0 for finite T.

### Stabilisation of primary divisibility kernels

**TauCeti.ArithmeticKTheory.N6.primaryKernelsStabilise** (`ArithmeticKTheory:N.6/stabilisation-of-primary-kernels`, application).

For a prime ℓ, let T=K_{2i}(O_F){ℓ} embedded in K_{2i}(F). The subgroups N_ν=ker(T→K_{2i}(F)/ℓ^ν) decrease and eventually stabilise. Their intersection and stable value equal (div K_{2i}(F)){ℓ}. This gives a finite stopping statement, but not a computable bound for ν solely from |T|.

Proof or construction. Finite T has no infinite strictly descending chain. Prime-to-ℓ multiplication is an automorphism on an ℓ-primary element, so divisibility by every ℓ power is equivalent to divisibility by every positive integer. Use Soulé and the finite residue groups to put all divisible elements into K_{2i}(O_F).

Direct inputs: `ArithmeticKTheory:N.6/divisible-subgroup`, `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.6/finite-coefficient-divisibility-kernel`.

Source: Weibel author preprint Corollary 4.6 and proof, preprint p. 13.

Acceptance: A long plateau does not by itself certify that the stable value has been reached; an independent identification is required.

## Symbols, local norms and cohomological kernels

The positive K-subgroup removes the real finite symbols when i is one modulo four. The global Moore sequence then uses only finite places. Its version on the full integral group keeps the real symbols explicitly. The two primary S-integer versions are equivalent; mixing their middle group and local terms gives an incorrect factor of 2^{r₁}. S consists exactly of primes above ℓ for the stated invariance of the ℓ-primary even group. Arbitrary extra inverted primes can contribute ℓ-primary residue groups.

The local norm input is an arithmetic application of existing local reciprocity, not a definition of another norm subgroup. For K₂, a Hilbert-symbol equation is equivalent to membership in a particular Kummer norm group. The norm of a uniformiser and the norm of a unit are checked separately; deeper unit-filtration computations retain the ramification conditions of their supplier. For higher degree the local conditions use twists and cohomology, with no unsupported replacement by a classical quadratic norm equation.

### The positive even K-subgroup

**TauCeti.ArithmeticKTheory.N6.positiveEvenK** (`ArithmeticKTheory:N.6/positive-even-k-subgroup`, definition).

Define K⁺_{2i}(F) as the kernel of the map to the finite real symbol groups (Z/2)^{r₁} when i≡1 mod 4, and as K_{2i}(F) otherwise. Define K⁺_{2i}(O_{F,S}) by inverse image under the field map. This is the paper’s positive K-group, not positive étale cohomology.

Proof or construction. Use the real comparison maps supplied by M.7, zero outside i≡1 mod 4. Form their joint kernel and pull back along O_S→F.

Direct inputs: `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `MotivicEtaleKTheory:M.7`.

Source: Weibel author preprint Notation after Definition 0.2, preprint p. 2.

Its public API follows its uses: Weibel Lemma 0.3 and Corollary 0.4: Supply the middle group of the real-corrected Moore sequence. ArithmeticKTheory:N.8: Distinguish the real-sign obstruction from finite-place computations.

- **positiveEvenK_mem** (characterisation): x∈K⁺ iff all real symbols of x vanish.
- **positiveEvenK_of_no_real_places** (simp): For a totally imaginary field K⁺=K.
- **positiveEvenK_ring_comap** (compatibility): The ring positive subgroup is the comap of the field positive subgroup.
- **positiveEvenK_of_other_residue** (simp): If i mod 4≠1, K⁺=K.

Discriminating unit tests:

- **positiveK_rational_symbol** (non-example): The class {−1,−1} in K₂(Q) is outside K₂⁺(Q).
- **positiveK_imaginary** (degenerate): K₂⁺(Q(i))=K₂(Q(i)).
- **positiveK_degree_four** (compatibility): K₄⁺(F)=K₄(F), including fields with real places.

Acceptance: Positive means the real symbol vanishes, rather than every element of F being positive.

### The finite local symbol family

**TauCeti.ArithmeticKTheory.N6.localSymbolFamily** (`ArithmeticKTheory:N.6/local-symbol-family`, construction).

For each finite place v construct λ_{i,v}:K_{2i}(F)→K_{2i}(F_v)→D_i(F_v), where D_i(F_v)=⊕_ℓ H²(F_v,Z_ℓ(i+1)) is the finite local quotient. Its order is w_i(F_v); the paper writes it as μ^{⊗i}(F_v) after cyclic-group identifications. Add the real Z/2 symbols only for i≡1 mod 4. The joint map initially lands in a product over all places; on K⁺ its finite support is a theorem of the Moore sequence. Cohomological corestriction is not silently equated with the ordinary norm on a twisted root module.

Proof or construction. Compose completion with the finite-component comparison for every prime ℓ, including residue characteristic. Identify cyclic targets through local duality, not an unspecified canonical generator. Combine the maps with the real comparison. The kernel definition uses the product so it does not assume finite support before proving it.

Direct inputs: `KTheoryFiniteLocalFields:L.7/completion-map`, `KTheoryFiniteLocalFields:L.7/etale-chern-class-completion`, `KTheoryFiniteLocalFields:L.6/even-integral-k-groups`, `KTheoryFiniteLocalFields:L.6/even-completed-k-groups-are-h2`, `ArithmeticKTheory:N.4/the-w-invariant`, `MotivicEtaleKTheory:M.7`.

Source: Weibel author preprint Dwyer–Friedlander maps preceding Definition 0.2, preprint p. 2.

Its public API follows its uses: Weibel Definition 0.2: Define the symbol wild kernel. Weibel Lemma 0.3: Construct the global Moore sequence with exact invariant maps. ArithmeticKTheory:N.8: Bind local calculations to the maps used by the certificate.

- **localSymbolFamily_apply** (projection): The v-component is the completion map followed by the local finite quotient.
- **localSymbolFamily_restriction** (functoriality): Restriction to E/F commutes with each local component at w|v.
- **localSymbolFamily_transfer** (functoriality): The v-component of transfer equals the sum of the local corestrictions over w|v.
- **localSymbolFamily_degree_two** (compatibility): At i=1 this is the full Hilbert-symbol map after Matsumoto’s identification.

Discriminating unit tests:

- **localSymbols_rational_minus_one** (computation): At the real place and at 2 the symbol of {−1,−1} is nonzero.
- **localSymbols_no_real_term** (degenerate): For i=2 the real finite symbol target is zero.
- **localSymbols_unramified_residue** (compatibility): Away from ℓ, the ℓ-primary finite component is the Soulé boundary followed by the finite-field identification.

Acceptance: For i=1 the map agrees with the full norm-residue symbol of L.7. Over Q₂ the degree-four finite quotient has order 8, whereas the degree-two quotient has order 2.

### The higher symbol wild kernel

**TauCeti.ArithmeticKTheory.N6.symbolWildKernel** (`ArithmeticKTheory:N.6/symbol-wild-kernel`, definition).

Define WK^sym_{2i}(F)=ker λ_i, where λ_i is the product of the finite local symbols and the applicable real symbols. It is a subgroup of K⁺_{2i}(F). This is Weibel Definition 0.2. The parent tame-and-wild-kernels node defines WK^raw by vanishing in the full completion K-groups; keep both names until the comparison is proved.

Proof or construction. Take the additive-homomorphism kernel of the joint symbol map. Expose membership as simultaneous vanishing; functoriality follows from the restriction and transfer formulas of the symbol family.

Direct inputs: `ArithmeticKTheory:N.6/local-symbol-family`, `ArithmeticKTheory:N.6/positive-even-k-subgroup`.

Source: Weibel author preprint Definition 0.2, preprint p. 2.

Its public API follows its uses: Weibel Theorem A: Its wild kernel is the symbol kernel. ArithmeticKTheory:N.8: Test generators against local and real maps. IntegralIwasawaTheory:I.10: Match the finite kernel with the chosen cohomological local conditions.

- **symbolWildKernel_mem** (characterisation): x belongs iff every finite and real symbol vanishes.
- **symbolWildKernel_le_positive** (structure): WK^sym≤K⁺.
- **symbolWildKernel_restriction** (functoriality): Restriction carries WK^sym(F) into WK^sym(E).
- **symbolWildKernel_transfer** (functoriality): Transfer carries WK^sym(E) into WK^sym(F).
- **symbolWildKernel_degree_two** (compatibility): WK₂^sym(F)=WK₂^raw(F).

Discriminating unit tests:

- **symbolWild_rational** (computation): WK₂^sym(Q)=0.
- **symbolWild_tame_nonexample** (non-example): K₂(Z) has the nonzero class {−1,−1}, while WK₂^sym(Q) does not.
- **symbolWild_special_minus_fourteen** (non-example): For F=Q(√−14), {−1,−1} lies in WK₂^sym(F) and is outside div K₂(F).

Acceptance: In degree two it agrees with the parent raw kernel; in higher degree equality requires the separate comparison node.

### The higher global Moore sequence

**TauCeti.ArithmeticKTheory.N6.globalMooreSequence** (`ArithmeticKTheory:N.6/global-moore-sequence`, theorem).

For i≥1 there is an exact sequence 0→WK^sym_{2i}(F)→K⁺_{2i}(F)→⊕_{v finite}D_i(F_v)→D_i(F)→0. Here D_i(F)=H⁰(F,Q/Z(−i))^D, a finite cyclic group of order w_i(F), and the last map is the sum of local invariant/corestriction maps. K⁺ can be replaced by K when F is totally imaginary or i mod 4≠1. The finite local symbols of each element have finite support.

Proof or construction. Prime by prime pass the final Poitou–Tate terms to continuous coefficients and then to the union of finite S; justify the limit using finite cohomology and Mittag–Leffler. Use M.7’s surjectivity onto H² for ℓ odd, and its modified/positive real-corrected map for ℓ=2. Read finite support from the S-integer localisation diagram and collect the primary sequences; the final dual group is identified with the paper’s cyclic root target only after specifying the identifications.

Direct inputs: `ArithmeticKTheory:N.6/symbol-wild-kernel`, `ArithmeticKTheory:N.6/positive-even-k-subgroup`, `ArithmeticKTheory:N.6/local-symbol-family`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `MotivicEtaleKTheory:M.2`, `MotivicEtaleKTheory:M.7`.

Source: Weibel author preprint Lemma 0.3 and proof, preprint pp. 2–3.

Acceptance: The real symbols cannot be omitted when i≡1 mod 4. The right-hand map is surjective; it is not an arbitrary sum of identifications with Z/w.

### The primary S-integer Moore sequence

**TauCeti.ArithmeticKTheory.N6.primarySIntegerMooreSequence** (`ArithmeticKTheory:N.6/primary-s-integer-moore-sequence`, theorem).

Let ℓ be prime. There is an exact sequence 0→WK^sym_{2i}(F){ℓ}→K⁺_{2i}(O_F){ℓ}→⊕_{v|ℓ}D_i(F_v){ℓ}→D_i(F){ℓ}→0. Equivalently write K_{2i}(O_F){ℓ} in the middle and include the real symbol groups (only if ℓ=2 and i≡1 mod 4) among the local terms. Replacing O_F by O_{F,S}, with S consisting of the primes above ℓ, preserves its ℓ-primary even K-group. Enlarging S beyond those primes introduces extra residue terms and is not claimed to preserve it.

Proof or construction. Compare the Moore sequence with Soulé’s even localisation sequence. Away from ℓ, the finite-field group K_{2i−1}(k(v)){ℓ} matches the local finite symbol target and its boundary; cancel these identical terms. At v|ℓ the residue cardinality is a power of ℓ, so q_v^i−1 has no ℓ-primary part. Keep real terms using either of the two equivalent formulations.

Direct inputs: `ArithmeticKTheory:N.6/global-moore-sequence`, `ArithmeticKTheory:N.5/soule-theorem`, `KTheoryFiniteLocalFields:L.7/boundary-completion-compatibility`, `KTheoryFiniteLocalFields:L.7/unramified-chern-class-reduction`, `KTheoryFiniteLocalFields:L.1/quillen-k-groups`.

Source: Weibel author preprint Corollary 0.4 and proof, preprint pp. 2–3.

Acceptance: For Q, i=1, ℓ=2, K₂(Z){2} maps nontrivially to the real and dyadic symbols and the kernel is zero.

### Orders of symbol wild kernels

**TauCeti.ArithmeticKTheory.N6.symbolWildOrder** (`ArithmeticKTheory:N.6/orders-of-symbol-wild-kernels`, application).

In the preceding sequence all groups are finite. The cardinality identity is |WK^sym{ℓ}|·∏_{v|ℓ}|D_i(F_v){ℓ}|=|K⁺_{2i}(O_F){ℓ}|·|D_i(F){ℓ}|. In the alternative formulation use K_{2i}(O_F){ℓ} and multiply the local product by 2^{r₁} exactly when ℓ=2 and i≡1 mod 4. Thus the order comes from an exact arithmetic diagram, not from imposing an analytic value.

Proof or construction. Multiply cardinalities of the two short exact sequences obtained from the Moore sequence. Use N.4 root orders and the integral K-group order certificate as independent inputs; include the real term in the alternative formula.

Direct inputs: `ArithmeticKTheory:N.6/primary-s-integer-moore-sequence`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.6/certificate-driven-computation`.

Source: Weibel author preprint Corollary 0.4; index formula in its proof, preprint p. 3.

Acceptance: The positive and full-group versions give the same answer. Use multiplicative equality to avoid unchecked division of natural numbers.

### The arithmetic cohomological wild kernel

**TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel** (`ArithmeticKTheory:N.6/cohomological-wild-kernel`, definition).

For ℓ prime and S containing the places above ℓ, define Sha²_{i,ℓ}(F)=ker(H²_et(O_{F,S},Z_ℓ(i+1))→∏_{v∈S∪S∞}H²(F_v,Z_ℓ(i+1))). Define finite-level kernels with μ_{ℓ^ν}^{⊗(i+1)} separately. This is the specialisation of SelmerIwasawaCohomology L2’s kernel construction, with strict zero local conditions. It is independent of S after the unramified comparisons are proved. Passage from the finite kernels to the continuous kernel uses the supplied finite-cohomology inverse-limit theorem; ordinary, modified and positive H² are distinct carriers.

Proof or construction. Specialise the existing strict Selmer local-condition construction, using actual cohomology restriction maps. Take continuous coefficients only after proving the limit identification; use the unramified degree-two residue diagrams to compare S.

Direct inputs: `SelmerIwasawaCohomology:L2`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `MotivicEtaleKTheory:M.2`.

Source: Weibel author preprint Equation (0.5), notation (0.6) and discussion, preprint p. 3.

Its public API follows its uses: Weibel Proposition 8.1 and Theorem B: Compare symbol wild and divisible kernels with cohomological local conditions. IntegralIwasawaTheory:I.10: Export precise twists and real-place conventions for finite arithmetic specialisations.

- **cohomologicalWildKernel_mem** (characterisation): A class belongs iff every specified localisation vanishes.
- **cohomologicalWildKernel_change_S** (equivalence): Enlarging S gives the canonical identification via unramified localisation.
- **cohomologicalWildKernel_inverse_limit** (compatibility): Sha² with continuous coefficients identifies with the inverse limit of the compatible finite-level kernels under the proved finiteness/limit hypotheses.
- **cohomologicalWildKernel_selmer** (compatibility): It is the L2 strict Selmer kernel in degree two for the twist Z_ℓ(i+1).

Discriminating unit tests:

- **cohomWild_no_real_odd_prime** (degenerate): For ℓ odd, omitting the archimedean factors does not change the kernel.
- **cohomWild_real_odd_i** (compatibility): For ℓ=2 and i odd, the ordinary real H² terms are Z/2 at each real place.
- **cohomWild_real_even_i** (compatibility): For ℓ=2 and i even, the ordinary real H² terms with Z₂(i+1) are zero, even though finite-level real terms can occur.

Acceptance: The archimedean factor vanishes for ℓ odd; the dyadic real term depends on twist parity.

### Symbol and cohomological wild-kernel comparison

**TauCeti.ArithmeticKTheory.N6.symbolCohomologicalComparison** (`ArithmeticKTheory:N.6/symbol-cohomological-comparison`, comparison).

For every odd prime ℓ, and for ℓ=2 when F is totally imaginary or i mod 4≠2, the arithmetic comparison induces WK^sym_{2i}(F){ℓ}≅Sha²_{i,ℓ}(F). For ℓ=2, F real and i≡2 mod 4, it instead induces an exact sequence 0→C_{F,i}→WK^sym{2}→Sha²_{i,2}(F)→0, where C_{F,i} is the kernel of K_{2i}(O_S){2}→H²_et(O_S,Z₂(i+1)) and has order 2^ρ as in the parent integral table. The map and kernel must be retained.

Proof or construction. Compare the primary Moore and continuous Poitou–Tate sequences using the same local comparison maps. For odd i use the positive group to remove real signs; for i≡3 mod 4 identify the relevant modified H². For i≡2 mod 4 keep the kernel C in (8.2), obtaining the exact sequence by a diagram chase rather than discarding it.

Direct inputs: `ArithmeticKTheory:N.6/primary-s-integer-moore-sequence`, `ArithmeticKTheory:N.6/cohomological-wild-kernel`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.6/the-two-primary-corrections`, `MotivicEtaleKTheory:M.2`, `MotivicEtaleKTheory:M.7`.

Source: Weibel author preprint Proposition 8.1, equation (8.2), and final diagram, preprint pp. 20–21.

Acceptance: Degree four over a real field is an extension by C, not an unconditional isomorphism with Sha².

### Special number fields

**TauCeti.ArithmeticKTheory.N6.SpecialAtTwo** (`ArithmeticKTheory:N.6/special-number-fields`, definition).

A number field F is special if it is exceptional in the parent N.4 sense and for every dyadic prime v there is a 2-primary root of unity ζ, in compatible algebraic closures, with ζ+ζ⁻¹∈F_v but ζ+ζ⁻¹∉F. Equivalently the maximal dyadic roots of F_v(√−1) properly exceed those of F(√−1). The witnesses may depend on v. Exceptionality alone is insufficient.

Proof or construction. Use the exceptional predicate and compatible cyclotomic/root embeddings from N.4 and I.1. Express the extra local root condition at every dyadic place; prove equivalence of the real-root and adjoining-√−1 formulations using ζ²−(ζ+ζ⁻¹)ζ+1=0.

Direct inputs: `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `IntegralIwasawaTheory:I.1`.

Source: Weibel author preprint Definition 5.2 and Remark 5.2.1, preprint p. 14.

Its public API follows its uses: Weibel Theorem 5.5 and Proposition 7.8: Choose equality or the index-two obstruction. ArithmeticKTheory:N.8: Select the correct expected wild-kernel order before issuing a certificate.

- **specialAtTwo_exceptional** (projection): A special field is exceptional.
- **specialAtTwo_local_witness** (projection): At every dyadic prime a root witness exists.
- **specialAtTwo_iff_decomposition** (characterisation): For all sufficiently large 2-power m and odd i, special is equivalent to every dyadic decomposition subgroup being proper in Gal(F(μ_m^{⊗i})/F).
- **specialAtTwo_transport** (functoriality): The predicate is preserved and reflected by a number-field isomorphism.

Discriminating unit tests:

- **specialAtTwo_rational** (non-example): Q is exceptional but is not special.
- **specialAtTwo_gaussian** (degenerate): Q(i) is nonexceptional and is not special.
- **specialAtTwo_minus_fourteen** (computation): Q(√−14) is special.
- **specialAtTwo_quadratic** (characterisation): For square-free d≠0,1, Q(√d) is special iff d≡−1 mod 8 with d≠−1, or d≡±2 mod 16 with d≠±2.

Acceptance: The property is invariant under isomorphisms of number fields and under the compatible closure choices.

## Cyclotomic descent and the divisibility proof

The special-field predicate records a local gain in dyadic roots at **every** dyadic place. A field can be exceptional without being special, as Q demonstrates. At sufficiently large finite cyclotomic level the condition is exactly that every dyadic decomposition subgroup is proper. The finite group homology map ρ₁ measures the defect. Its target is Z/2 in the exceptional odd-twist case, and the map is zero for special fields and split onto for nonspecial fields.

The proof of Theorem A needs the key results of all eight sections of the paper. The imaginary case uses twisted Picard coinvariants, finite-coefficient localisation and stabilisation. The real case requires **totally positive** cohomology and the motivic localisation comparison. The degree congruent to four modulo eight requires a further theorem: the hidden K-kernel lies in the subgroup of elements divisible in the ambient field. This is not a statement that the finite hidden kernel is itself a divisible group.

The node-level argument is stated below with exact supplier interfaces. The exceptional odd dyadic branch of cyclotomic localisation remains conditional on G2; the odd-prime, even-twist and nonexceptional branches use the surjective residue norm and do not invoke the prime-selection lemma. The plan does not use the false unrestricted lemma as a proved fact. This records a specific proof repair, while retaining the paper’s Theorem A as the mathematical target.

### The dyadic decomposition criterion

**TauCeti.ArithmeticKTheory.N6.specialDyadicDecomposition** (`ArithmeticKTheory:N.6/special-dyadic-decomposition`, theorem).

Let i be odd, F exceptional and m=2^ν sufficiently large so E=F(μ_m^{⊗i}) is nontrivial and contains √−1. Put G=Gal(E/F), M=μ_m^{⊗i}, and Z_v the decomposition group at v|2. F is special iff every Z_v is proper in G. In that case ρ₁:⊕_{v|2}H₁(Z_v,M)→H₁(G,M)≅Z/2 is zero. If F is not special, some Z_v=G and ρ₁ is a split surjection. This is the obstruction map in the symbol-kernel comparison.

Proof or construction. Read the cyclotomic decomposition groups using the local-root criterion. Import the faithful cyclic-module homology calculation of §§3.2,3.6,3.7 from the general cohomology supplier. Apply Shapiro to the semilocal sum; each proper subgroup gives zero on H₁, while an equal subgroup gives a split identity summand.

Direct inputs: `ArithmeticKTheory:N.6/special-number-fields`, `IntegralIwasawaTheory:I.1`, `MotivicEtaleKTheory:M.2`.

Source: Weibel author preprint Remark 5.2.1, Lemma 5.4, and Corollary 3.7, preprint pp. 10, 14.

Acceptance: The real places do not enter the special-field definition; all dyadic places do.

### The twisted residue norm test

**TauCeti.ArithmeticKTheory.N6.twistedResidueNormTest** (`ArithmeticKTheory:N.6/twisted-residue-norm-test`, application).

Let k=F_q, m=2^ν≥4 with q odd and i≥1, E=k(μ_m^{⊗i}), G cyclic generated by Frobenius acting on M=μ_m^{⊗i} as multiplication by q^i. The norm M_G→M^G is an isomorphism exactly when q^i≢−1 mod m; when q^i≡−1 it is zero and the invariant target has order two. For odd prime powers m the norm on this faithful cyclic module is always onto. This tests a norm on a root-twist module, not surjectivity of Eˣ→kˣ.

Proof or construction. Import the cyclic resolution norm calculation for a faithful action on Z/m; compute Frobenius by q^i. When the action is inversion, 1+Frobenius=0 and the invariant group is Z/2. Otherwise the cyclic-module norm is an isomorphism, as in Lemma 3.2. Compare with Mathlib’s full finite-field unit norm; its surjectivity does not imply surjectivity on the root-twist subgroup.

Direct inputs: `mathlib:FiniteField.unitsMap_norm_surjective`, `mathlib:FiniteField.algebraMap_norm_eq_pow`, `MotivicEtaleKTheory:M.2`.

Source: Weibel author preprint Lemma 3.2, Lemma 3.4, and Remark 3.4.1, preprint p. 9.

Acceptance: k=F₃, m=4, i=1: norm on μ₄(F₉) is zero, although the full unit norm F₉ˣ→F₃ˣ is onto. An even i excludes q^i≡−1 for m≥4.

### Local norm tests for degree-two certificates

**TauCeti.ArithmeticKTheory.N6.hilbertLocalNormCertification** (`ArithmeticKTheory:N.6/hilbert-local-norm-certification`, application).

Let L=F_v be a finite completion and m≥2 with μ_m⊂L. For a,b∈Lˣ the Hilbert symbol (a,b)_{L,m}=1 iff b lies in N_{L(a^{1/m})/L}(L(a^{1/m})ˣ). Thus a proposed K₂ symbol class has trivial finite local m-component exactly when these local norm conditions hold. Norm membership uses the range of Units.map(Algebra.norm L), with uniformiser valuation and the unit filtration checked separately. Include the real sign test at real places. Higher K-groups use their twist-cohomology local conditions, rather than an unproved analogous Hilbert-symbol formula.

Proof or construction. Use local reciprocity’s norm-kernel criterion for the Kummer extension and the classical Hilbert-symbol convention from T.7. Realise the norm subgroup through the existing determinant norm, not by defining a second norm. Compute unit membership against U(L,0), U(L,1), and deeper filtration steps supplied by LocalFieldsRamification. For a finite presentation, test every supplied symbol relation and generator image through these same maps; real symbols remain part of the certificate.

Direct inputs: `K2SymbolsBrauer:T.7/classical-local-symbols`, `KTheoryFiniteLocalFields:L.7/hilbert-symbol-completion`, `mathlib:Algebra.norm`, `tauceti:TauCeti.unitFiltration`, `tauceti:TauCeti.unitFiltration_zero`, `tauceti:TauCeti.unitFiltration_one`, `ArithmeticKTheory:N.6/local-symbol-family`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`.

Source: K-book Example III.6.2.3 and Theorem III.6.2.4, book pp. 232–233, PDF pp. 240–241.

Acceptance: For Q₂, (−1,−1) is nontrivial: −1 is not a norm from Q₂(i). For odd p, (−1,−1)_{Q_p,2}=1. For R, the quadratic norm subgroup from C consists of the positive elements.

### Cyclotomic class-group descent diagrams

**TauCeti.ArithmeticKTheory.N6.cyclotomicClassGroupDescent** (`ArithmeticKTheory:N.6/cyclotomic-class-group-descent`, comparison).

Let m be a prime power, E=F(μ_m^{⊗i}), G=Gal(E/F), and T contain the primes above m. Over totally imaginary E, where the twist is trivial and m≠2, the Kummer/Brauer sequence is 0→Pic(O_{E,T})⊗μ_m^{⊗i}→H²(O_{E,T},μ_m^{⊗(i+1)})→M⁰→0, where M⁰ is the kernel of the sum of the local invariant targets to the global target. Its coinvariant long exact sequence has segment H₁(G,M⁰)→(Pic(O_{E,T})(i)/m)_G→H²(O_{F,S},μ_m^{⊗(i+1)})→M⁰_G→0 when the H² descent hypothesis holds. For real fields use Pic⁺ and totally positive H²₊ instead, as in §§6.8–6.9, and retain the comparison to ordinary H².

Proof or construction. Use M.2’s Kummer/Brauer and totally positive variants on actual twisted coefficient modules. Use top-degree corestriction descent, with its cd≤2 or positive-cohomology hypothesis, and the long exact sequence for coinvariants. Evaluate H₁(G,M⁰) with the faithful cyclotomic action and decomposition-group formulas; do not replace coinvariants by invariants without the norm theorem.

Direct inputs: `MotivicEtaleKTheory:M.2`, `IntegralIwasawaTheory:I.1`, `IntegralIwasawaTheory:I.2`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `ArithmeticKTheory:N.6/special-dyadic-decomposition`.

Source: Weibel author preprint Proposition 4.1, Application 4.2, Proposition 6.8, equation (6.9), preprint pp. 11, 16.

Acceptance: The ordinary H² coinvariant descent fails for real fields with odd i; positive H²₊ corrects it. The paper’s unit-sign defect in §6.6 is a separate invariant from the parent j=u−t used in VI.9.9.

### The cyclotomic class-group image of divisible elements

**TauCeti.ArithmeticKTheory.N6.cyclotomicDivisibleImage** (`ArithmeticKTheory:N.6/cyclotomic-divisible-image`, theorem).

For m=ℓ^ν sufficiently large, E=F(μ_m^{⊗i}), the image of the twisted Picard coinvariants (Pic(O_E[1/ℓ])(i)/m)_G in K_{2i}(O_F){ℓ} is (div K_{2i}(F)){ℓ} in the cohomological-dimension-two cases (ℓ odd, or ℓ=2 and F totally imaginary). For real dyadic fields its image in H²_M(F,Z_(2)(i+1)) is div of that motivic group, using the ordinary Picard localisation diagram. The exceptional odd dyadic case is conditional on the corrected cyclotomic localisation input recorded as gap G2; unrestricted Lemma 4.4 is not an admissible prerequisite.

Proof or construction. Compare ring-to-field finite-coefficient localisation in E and F, with corestriction, as in Theorems 4.5 and 6.11. For odd ℓ, even i or nonexceptional F, the residue norms are onto and no prime-selection lemma is needed. In the remaining exceptional odd dyadic case use only prime-selection statements compatible with the cyclotomic and ideal-class conditions; the unrestricted source lemma has the explicit counterexample in E1. The required correction is G2. Identify the finite-coefficient kernel with the class-group image, then use stabilisation. For real fields first use the motivic ring-to-field injection and finite cohomology supplied by M.7 (§7.4).

Direct inputs: `ArithmeticKTheory:N.6/stabilisation-of-primary-kernels`, `ArithmeticKTheory:N.6/cyclotomic-class-group-descent`, `MotivicEtaleKTheory:M.2`, `MotivicEtaleKTheory:M.7`.

Source: Weibel author preprint Theorem 4.5, Corollary 4.6, Theorem 6.11 and Corollary 7.5, preprint pp. 12–13, 17–18.

Acceptance: An effective exponent bound must be proved separately; “sufficiently large” is a theorem quantifier. No use of the false unrestricted prime-selection lemma is allowed.

### The imaginary equality cases

**TauCeti.ArithmeticKTheory.N6.imaginaryEqualityCases** (`ArithmeticKTheory:N.6/imaginary-nonexceptional-comparison`, theorem).

If F is totally imaginary and either i is even or F is not special, div K_{2i}(F)=WK^sym_{2i}(F). At odd primes this equality holds for every number field. The odd-prime argument is the same finite cyclotomic class-group image argument; it does not require a separately assumed Schneider theorem.

Proof or construction. For even i or nonexceptional F the faithful cyclic norm calculation makes the coinvariant local sequence exact, identifying the wild kernel with the twisted Picard quotient. For exceptional odd i use a dyadic full decomposition group when F is nonspecial; ρ₁ is split onto and the same exactness holds. Identify that image with div using the preceding node. Repeat at odd primes with the cyclic odd-primary calculation.

Direct inputs: `ArithmeticKTheory:N.6/cyclotomic-divisible-image`, `ArithmeticKTheory:N.6/cyclotomic-class-group-descent`, `ArithmeticKTheory:N.6/primary-s-integer-moore-sequence`, `ArithmeticKTheory:N.6/special-dyadic-decomposition`, `ArithmeticKTheory:N.6/twisted-residue-norm-test`.

Source: Weibel author preprint Proposition 4.7, Theorem 5.5(1), Remarks 4.3.1 and 4.6.1, preprint pp. 11, 13–14.

Acceptance: Q(i) belongs to the nonexceptional case. Q(√−14) and odd i are excluded from the equality case.

### The imaginary special-field obstruction

**TauCeti.ArithmeticKTheory.N6.imaginarySpecialObstruction** (`ArithmeticKTheory:N.6/imaginary-special-obstruction`, theorem).

If F is totally imaginary and special and i is odd, there is an exact sequence 0→div K_{2i}(F)→WK^sym_{2i}(F)→Z/2→0. The last map is the cyclotomic homology obstruction induced by ρ₁=0 and H₁(G,M)=Z/2; it is surjective. A splitting is not asserted in general.

Proof or construction. Compare the two coinvariant exact sequences (3.1.1) and (4.2) with the Moore sequence. With every dyadic decomposition group proper, ρ₁ vanishes; the sole defect is H₁(G,M)≅Z/2. The class-group image is div by the preceding localisation/stabilisation node, so the induced defect quotient is Z/2.

Direct inputs: `ArithmeticKTheory:N.6/cyclotomic-divisible-image`, `ArithmeticKTheory:N.6/cyclotomic-class-group-descent`, `ArithmeticKTheory:N.6/special-dyadic-decomposition`, `ArithmeticKTheory:N.6/primary-s-integer-moore-sequence`.

Source: Weibel author preprint Lemma 5.4 and Theorem 5.5(2), preprint p. 14.

Acceptance: For Q(√−14) and i=1, the class {−1,−1} maps to the nonzero defect and is outside div.

### The real motivic divisibility obstruction

**TauCeti.ArithmeticKTheory.N6.realMotivicObstruction** (`ArithmeticKTheory:N.6/real-motivic-obstruction`, theorem).

Let F have real places and i≥1. In H²_M(F,Z_(2)(i+1)), the subgroup div is contained in Sha²_{i,2}(F), using the finite S-integer injection and the motivic/continuous comparison. The quotient is zero if i is even or F is nonspecial, and is Z/2 if i is odd and F is special. In the even case retain the exact real-corrected sequence of Proposition 7.6; in the odd case the quotient is the homology defect of (7.7).

Proof or construction. Import totally positive cohomology, its descent and Kummer sequences (§6), and the finite-motivic/étale comparison and localisation injection (§7.1–7.4). Use the class-group image description of div from §7.5. For even i the cyclic homology vanishes and gives exactness; for odd i the dyadic decomposition map gives zero or one-dimensional homology, exactly as in the imaginary case.

Direct inputs: `ArithmeticKTheory:N.6/cohomological-wild-kernel`, `ArithmeticKTheory:N.6/cyclotomic-divisible-image`, `ArithmeticKTheory:N.6/cyclotomic-class-group-descent`, `ArithmeticKTheory:N.6/special-dyadic-decomposition`, `MotivicEtaleKTheory:M.2`, `MotivicEtaleKTheory:M.7`.

Source: Weibel author preprint Theorem B and Propositions 7.6, 7.8, preprint pp. 3, 19.

Acceptance: The positive-cohomology supplier uses a real-place mapping cone, not the kernel H̃² of ordinary restriction. The theorem does not assume all real fields are totally real.

### Hidden real K-classes are divisible

**TauCeti.ArithmeticKTheory.N6.hiddenRealClassesDivisible** (`ArithmeticKTheory:N.6/hidden-real-k-classes-are-divisible`, theorem).

For F with real places and i≡2 mod 4, the kernel C_{F,i} of K_{2i}(O_S){2}→H²_et(O_S,Z₂(i+1)), of order 2^ρ, lies in div K_{2i}(F). In particular the image of K⁽M⁾₄(F) in K₄(F) is divisible in the ambient field group. No claim is made that the finite subgroup C itself is a divisible group.

Proof or construction. Use M.7’s motivic spectral edge sequence (8.3). After the cyclotomic extension E the relevant d₂ is onto, so the H⁴ edge classes vanish modulo each sufficiently large 2-power. Use the induced real-embedding module comparison of Lemma 8.6 to lift each class in C to such an edge class over E. Transfer its m-divisibility back to F, then intersect over all powers of two; odd divisibility is automatic on the two-primary subgroup.

Direct inputs: `ArithmeticKTheory:N.6/the-two-primary-corrections`, `ArithmeticKTheory:N.6/stabilisation-of-primary-kernels`, `MotivicEtaleKTheory:M.7`, `IntegralIwasawaTheory:I.1`.

Source: Weibel author preprint Proposition 8.4, Lemmas 8.5–8.6, Theorem 8.7, preprint pp. 20–21.

Acceptance: A finite nonzero subgroup may consist of elements divisible in a larger group. This input prevents the degree-four invisible kernel from being discarded when comparing wild groups.

### Weibel’s symbol-kernel divisibility theorem

**TauCeti.ArithmeticKTheory.N6.weibelSymbolDivisibility** (`ArithmeticKTheory:N.6/weibel-symbol-divisibility-theorem`, theorem).

For every number field F and i≥1, div K_{2i}(F)⊆WK^sym_{2i}(F) with quotient Z/2 if F is special and i is odd, and zero otherwise. This assembles Theorem A for the paper’s symbol kernel. Its proof depends on the corrected localisation input G2; the parent’s raw completion-kernel version further depends on G1.

Proof or construction. Separate odd primes and the totally imaginary dyadic case, using the two imaginary comparison nodes. For real F and i mod 4≠2 compare the symbol kernel with Sha² and apply the real motivic defect theorem. For i≡2 mod 4 use the final diagram on p.21: the same kernel C lies in div and in the symbol wild kernel; quotient comparisons and the five lemma give equality. Collect the primary components of the finite wild kernel.

Direct inputs: `ArithmeticKTheory:N.6/imaginary-nonexceptional-comparison`, `ArithmeticKTheory:N.6/imaginary-special-obstruction`, `ArithmeticKTheory:N.6/real-motivic-obstruction`, `ArithmeticKTheory:N.6/symbol-cohomological-comparison`, `ArithmeticKTheory:N.6/hidden-real-k-classes-are-divisible`.

Source: Weibel author preprint Theorem A, preprint p. 1; proof §§4–8, pp. 11–21.

Acceptance: Special and odd i gives index exactly two, not merely at most two. Equality for even i includes the real degree-four correction via C.

### The completion-kernel comparison boundary

**TauCeti.ArithmeticKTheory.N6.rawSymbolKernelBoundary** (`ArithmeticKTheory:N.6/raw-and-symbol-kernel-boundary`, comparison).

Always WK^raw_{2i}(F)⊆WK^sym_{2i}(F), since symbols factor through completion. Equality holds at i=1, by torsion of K₂(F) and Moore’s uniquely divisible local kernel, including the real comparison. For higher i, equality follows if every global torsion class with zero local finite symbols has zero image in the divisible part of every completion, and the analogous real finite-part detection holds. The existing local structure allows divisible residue-characteristic torsion, so global torsion alone does not prove this hypothesis. The unqualified higher equality remains G1.

Proof or construction. Inclusion is functorial factorisation of the local symbols. In degree two, the image is torsion and the finite-symbol kernel is uniquely divisible; their intersection is zero. Use the real finite-symbol detection separately. In higher degree, retain D_i’s possible Q_p/Z_p summands. State the additional annihilation condition exactly and request its proof; do not turn a finite quotient theorem into injectivity on torsion.

Direct inputs: `ArithmeticKTheory:N.6/tame-and-wild-kernels`, `ArithmeticKTheory:N.6/symbol-wild-kernel`, `KTheoryFiniteLocalFields:L.3/moore-theorem`, `KTheoryFiniteLocalFields:L.6/even-integral-k-groups`, `KTheoryFiniteLocalFields:L.7/hilbert-symbol-completion`, `MotivicEtaleKTheory:M.7`.

Source: K-book V.6.8.2, book p. 413, PDF p. 421; VI.7.3 and Warning VI.7.5, book pp. 509–510, PDF pp. 517–518.

Acceptance: Any proposed proof using only “K_{2i}(F) is torsion” must fail the test D_i containing p-divisible torsion. The parent raw-kernel Theorem A is not certified by the symbol theorem until G1 is discharged.

## Certificates and consumers

The certificate engine is already owned by the parent N.6 packet. This part binds additional arithmetic evidence to it. A finite presentation supplies an upper bound through a proved surjection, and a separately proved arithmetic computation supplies the lower bound. Equality certifies an isomorphism. An order suggested by a zeta value is admitted only through an exact theorem with all its hypotheses and correction factors. A rank formula alone never certifies the exponent of a finite group.

N.7 uses the arithmetic data for regular-prime consequences. N.8 instantiates the presentation and local checks for concrete fields. IntegralIwasawaTheory I.10 consumes the finite cohomological kernels and their twists, duality and real-place conventions. The aggregate KU-arithmeticstructure stage consumes these outputs without becoming a second mathematics owner.

### Arithmetic evidence for finite-order certificates

**TauCeti.ArithmeticKTheory.N6.arithmeticCertificateEvidence** (`ArithmeticKTheory:N.6/arithmetic-evidence-for-certificates`, application).

Instantiate the parent order-certificate and certificate-driven-computation nodes using the arithmetic cohomology tables, exact local maps and class-group data above. A finite presentation supplies a proved surjection P→K_{2i}(O_S), while the cohomological and local computations supply an independently proved lower bound. Their matching cardinalities certify an isomorphism. Two-rank data certify only the number of two-primary factors; full order requires the complete H² data and, for real n≡4 mod 8, ρ and the actual extension. A wild-kernel certificate uses the symbol maps and the Moore exact sequence; a higher raw-kernel certificate requires G1.

Proof or construction. Bind all presentation generators and relations to the actual K-group maps used by the parent certificate. Use arithmetic computations through exact comparison theorems to obtain the lower bound; local norm calculations are used in degree two and local twist-cohomology calculations in higher degrees. Require equality of independent bounds and retain extension data. Export the evidence to N.8 and I.10 without using a zeta value as an imposed group order.

Direct inputs: `ArithmeticKTheory:N.6/order-certificate`, `ArithmeticKTheory:N.6/certificate-driven-computation`, `ArithmeticKTheory:N.6/even-two-ranks-from-arithmetic`, `ArithmeticKTheory:N.6/orders-of-symbol-wild-kernels`, `ArithmeticKTheory:N.6/hilbert-local-norm-certification`, `ArithmeticKTheory:N.6/raw-and-symbol-kernel-boundary`.

Source: K-book VI.9.9–9.11, book pp. 523–525, PDF pp. 531–533.

Acceptance: Z/2 and Z/4 both have two-rank one, so a rank alone cannot certify either order. The certificate engine is imported, not redefined.

## Proof obligations and source checking

**G1 — full completion versus finite symbols.** The local L.6 structure theorem states that the divisible part of a higher even K-group can contain residue-characteristic divisible torsion. Moore’s K₂ theorem gives a uniquely divisible kernel, but that special fact does not extend just by changing the degree. The additional condition needed here is that the image of every global torsion class with all finite symbols zero vanishes in these divisible local parts, together with the corresponding real detection statement. Until proved, only inclusion of the raw kernel in the symbol kernel and the degree-two equality are established. In particular the parent’s higher raw-kernel Theorem A needs this boundary resolved, or its wording corrected to the symbol statement. G1 is not a claim that the equality is false.

**G2 — compatible cyclotomic localisation.** The read author preprint’s Lemma 4.4 prescribes an arbitrary ideal class and an arbitrary norm residue independently. Take F=Q(i), modulus four, and residue three. A prime of odd residue characteristic either lies above a split rational prime congruent to one modulo four, or has squared norm, again congruent to one. The dyadic prime has norm two. Thus no prime has norm three modulo four. Simultaneous Frobenius conditions must agree on the intersection of the relevant class and cyclotomic fields. The proof of Theorem 4.5 invokes this lemma; Theorem 6.11 repeats that proof with positive cohomology. A corrected restricted prime-selection argument must prove precisely the needed compatibility, or an independently verified localisation image theorem must replace this step. The finding does not assert that either target theorem is false.

The second finding, `ArithmeticKTheory/E-N6-2`, corrects the definition of the signature defect in the paragraph after (8.2), preprint p.20: use the dimension of the real-restriction cokernel. For Q and Z[1/2] that map has a kernel of dimension one and a cokernel of dimension zero. The printed kernel convention combined with j≤ρ<r₁ would force 1≤ρ<1. The corrected convention gives j=ρ=0 and agrees with the parent and K-book VI.9.6.1. All nodes use this corrected convention.

Both findings are scoped to the 23 July 2004 author preprint. The publication’s DOI returned a forbidden-access response; its text was not read or collated. The author archive and searches for the title with a corrigendum, Lemma 4.4 or signature correction produced no verified correction. The K-book’s errata link returned a missing-file response. These access facts do not identify the preprint with the version of record. The parent’s previously recorded error in the K-book’s unrestricted divisibility claim is retained through the parent import, rather than independently rediscovered or overwritten here.

The public sources read were [Weibel’s combined K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), dated 29 August 2013, and [the author’s wild-kernel preprint](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), dated 23 July 2004. The source list and version records retain their hashes and the access date 6 October 2026. K-book locators give book and PDF pages; preprint locators never claim journal pagination. The old font encoding prevents reliable extraction of the preprint’s text, so its rendered pages were read directly. The full proof input, §§1–8, was checked; secondary citations inside it that are not proved there remain the specifically named supplier interfaces.

## Atlas selection and acceptance

The parent already selects four N.6 planets: even groups at primes of cohomological dimension two, two-primary groups of real fields, the wild kernel, and the signature defect. This follow-up adds **Even K-group two-ranks** and **Weibel divisibility theorem**, yielding six planets for the assembled layer. The symbol definition, special-field predicate and Moore sequence remain visible in the detailed declaration graph. No change to the atlas data or the parent packet is made.

Accept the mathematical pass only if the reader, packet and suggested signatures agree on the dyadic inversion hypothesis, positive degree, Selmer signature defect, rank/order distinction, finite-coefficient distinction, real correction, twist duality and kernel convention. The exact sequence must use the same local maps as the certificate, not maps reconstructed only from group orders. Every definition or construction has a named API derived from a use and at least three tests. Every supplier-stage dependency has a request and the internal graph is acyclic.

The suggested file contains elaborating numerical signatures and generic map constructors, and explicit mathematical signature comments where the actual imported K/cohomology carriers are missing. Such comments record every remaining declaration, API name and test; they are not Lean declarations or claimed implementations. The handoff records the exact compiled portion and the outcome of checking. Completion of this target-level pass means **planned** coverage with G1, G2 and the seven supplier requests retained; closure requires their mathematical discharge.
