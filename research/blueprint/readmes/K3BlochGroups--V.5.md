# Concrete K₃ calculations — V.5

This document completes the target-level planning pass for **K3BlochGroups:V.5**. It extends the accepted parent packet without changing its node identifiers or its files. The packet is **complete**, and this stage is **planned**: every target has an explicit supplier or a declaration with a source, proof route and prerequisite boundary. Five recorded gaps and three requests prevent a claim of closure. All implementation statuses remain unchecked.

The purpose is to make concrete degree-three classes usable across three models: Quillen K₃, its indecomposable quotient, and the precisely normalized Bloch group. The finite-field comparison must carry the actual stabilization and configuration maps, because HabiroNumberFields HB.2 uses their compatibility with field maps. Knowing that two groups are cyclic of the same order does not provide that comparison. The rational calculation must identify the Milnor image inside the order48 group; it is not a direct-product splitting. The Gaussian calculation must state what a free basis means without inventing a preferred generator or a regulator value.

## Conventions and the baseline

Quillen K-groups and their ring maps and products are supplied by GeneralAlgebraicKTheory. Milnor K-theory, Matsumoto’s comparison and the Bass–Tate signs theorem are supplied by K2SymbolsBrauer. The indecomposable group is the **cokernel** of the degree-three Milnor-to-Quillen map of parent V.2. Its decomposable subgroup is that map’s image. Calling the image a copy of Milnor K₃ uses the parent’s separate injectivity theorem; it is not part of the definition of a cokernel.

Write Bₛ(F) for the Suslin convention of parent V.3. Its pre-Bloch group Pₛ(F) has admissible generators [x] with x≠0,1 and the five-term relations; the parent’s equivalent presentation also records [1]=0. The boundary is [x]↦x⊗(1−x) into the **antisymmetric tensor quotient**, obtained by killing a⊗b+b⊗a. This quotient can retain diagonal two-torsion. Bₛ is its kernel in Pₛ, not a quotient and not the kernel of an exterior-square boundary silently substituted for it. The projective-line CGZ convention is compared through the parent V.3 map κ. This comparison is safe modulo odd n; it is not an integral identity of definitions.

For Fq, let ℓ denote the characteristic, and use p for the distinct odd prime in CGZ’s n=pᵐ. H₃ means Mathlib’s homology of the actual group with trivial coefficients. Its integral-to-localized map changes coefficients from ℤ to ℤ[1/ℓ]. An inclusion of groups induces homology in the forward direction; Hutchinson calls this homological map corestriction. It is not the opposite-direction transfer. The expression M⊗ℤ/n means the tensor quotient M/nM. It is kept distinct from homology of the group with ℤ/n coefficients, whose universal-coefficient sequence can have an additional degree-two term.

The baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The reviewed library audit calls V.5 not built. Pinned source searches found no Quillen/Milnor K-theory objects, Bloch groups or Rogers function in either library. The ten baseline entries were checked by reading their statements: groupHomology, its induced map, Rep.trivial, Matrix.SpecialLinearGroup and its ring map, Algebra.norm, LinearMap.toMatrix, TensorProduct.map, ZMod and AddCircle. These provide real carriers for the prototypes. They do not compute finite cyclic group homology, the unstable SL₂ comparison, or a configuration-complex Bloch map.

## Ownership and target closure

The stable computation K₃(Fq)=ℤ/(q²−1), restriction, transfer and Frobenius belong to **KTheoryFiniteLocalFields:L.1**. This part imports the exact nodes quillen-k-groups, finite-field-transfer-formulas and finite-field-galois-descent. It develops their transport through the indecomposable quotient and the finite Bloch comparison. The direct dependency L.1→V.5 is explicit rather than left hidden in the motivic ancestry.

The ambient groups K₃(ℤ), K₃(ℚ), and K₃(ℚ(i)) belong to **ArithmeticKTheory:N.5/N.8**. The N.5 real-case-modulo-eight and totally-imaginary-integral-structure nodes have exactly the degree-three statements needed here. N.7/w-invariant independently supplies w₂(ℚ)=24. V.5 owns the decomposable-image applications. The existing N.8/k-groups-of-the-integers and N.8/gaussian-and-imaginary-quadratic nodes still cite V.5 as their supplier. Importing those nodes back here would conceal a cycle. This packet therefore requests their ownership correction, records the Gaussian w₂ certificate boundary, and proposes N.8→V.5 only after removing the reverse dependency. It leaves those supplier files untouched.

The exact Bass–Tate supplier is **K2SymbolsBrauer:T.2:symbols/milnor-number-field**, for every degree at least3. V.5 uses it at degree3 and cites parent V.2/milnor-k3-number-field and milnor-k3-injective for the comparison. Total-sign surjectivity is already in the upstream Global Number Fields Layer1; this part consumes it to write a degree-three class as a product with −1. It does not re-plan real places, Hilbert symbols or weak approximation.

The parent general number-field theorem V.5/k3-number-field remains the supplier for K₃ⁱⁿᵈ(F)=ℤ^r₂⊕ℤ/w₂(F). The parent V.2 and V.3 constructions and V.4 enhanced Tor object remain unchanged. In particular, the finite refined configuration analysis supplements V.4’s infinite-field proof; finite P¹ is never declared acyclic by invoking its infinite-set theorem. The exact refinements of every original stage target appear in the packet’s targetCoverage table and in the declaration catalogue below.

## Source decisions that change the proof route

Hutchinson’s §3 gives H₃(SL₂(Fq),ℤ[1/ℓ])=ℤ/(q²−1). Integral H₃ additionally has characteristic torsion at q=2,3,4,5,8,9,27. At q=5 it has order120, whereas K₃ has order24. The integral stabilization therefore cannot be an isomorphism in that case. Both the published CGZ §4.2 and its arXiv v3 state the integral order q²−1 without that qualification. Finding E501 records the false statement, its exact correction and the versions searched. The odd-n comparison used in the paper survives: if n divides q+1 then ℓ is invertible modulo n, so this extra torsion disappears.

The norm-one Cartan C¹ has order q+1 and gives an actual injection into SL₂ after a basis choice. Its third homology is cyclic of that order, but identifying H₃(C¹,ℤ) with C¹ is not natural under all automorphisms. Inversion acts by +1 on third homology and by inversion on C¹. Finding E502 records the consequent correction to the canonical-identification language. We retain the homology map induced by the actual Cartan inclusion. A bar generator specified by a cyclic generator is legitimate data; an unnamed canonical generator is not.

There is a further distinction between a class in n-torsion and one generating a quotient modulo n. If n² divides q+1, inclusion of the subgroup of order n into C¹ sends a degree-three cyclic generator to (q+1)/n times a generator, whose image modulo n can be zero. A primitive n-th root must therefore not be promoted automatically to a generator of H₃(C¹)/n. The full Cartan inclusion still induces the required isomorphism modulo n, since its index in the prime-to-characteristic SL₂ homology is q−1 and gcd(n,q−1)=1 for odd n dividing q+1.

For the rational lower bound, the source is Suslin’s original §1, pp219–220, visually read in the public scan. Its positive pre-Bloch presentation maps onto Pₛ(ℝ) with kernel generated by6c′. The shifted interval function [x]′↦L(x)−L(1) sends c′ to−π²/6 and6c′ to−π². Thus the period for the detector is **π²**. Zagier’s real extension moduloπ²/2 is another useful normalization but detects only order3 of this class; it cannot prove the required order6. Polylogarithms P.1 owns the analytic Rogers function. V.5 specifies its application to the Suslin presentation and the exact period and evaluations.

## Declaration catalogue

Every identifier below has the prefix **K3BlochGroups:V.5/**. Identifiers from the accepted parent are imported, not reused for these refinements. Proposed API names are mathematical declaration names; executable signatures occur only in the accompanying suggested file.

### Finite-field indecomposable quotient

Identifier: **finite-indecomposable-specialization** (application).

For every finite field F of cardinality q, including q=2,3, the canonical quotient K₃(F)→K₃ⁱⁿᵈ(F) is an isomorphism. Its group has order q²−1, imported from L.1; no Quillen model or generator is constructed here.

The proof or construction follows this route:

1. Use the parent’s finite Milnor vanishing, whose proof reduces tensors to the exact finite K₂ vanishing at T.2, not to the unrelated T.5 stage.
2. The image of the degree-three Milnor map is zero; the cokernel quotient is therefore an isomorphism.
3. Apply L.1/quillen-k-groups with i=2.

Direct prerequisites: **K3BlochGroups:V.5/milnor-k3-finite-field**, **K3BlochGroups:V.2/k3-indecomposable**, **KTheoryFiniteLocalFields:L.1/quillen-k-groups**.

Acceptance: q=2 gives Z/3, q=3 gives Z/8, q=5 gives Z/24.

Source: The K-book, Chapter III, III.7.2(a), p61; The K-book, Chapter IV, IV.1.13, p10.

### Restriction and transfer on finite indecomposables

Identifier: **transfer-on-indecomposables** (application).

Transport L.1’s restriction, transfer and Frobenius along the canonical quotient isomorphisms. For Fq⊂Fqᵈ: restriction is injective with image the Gal-invariants, transfer is onto, tr∘res=d, res∘tr=(q²ᵈ−1)/(q²−1), and Frobenius acts by q². The same formulas hold on K₃ⁱⁿᵈ and do not specify generators.

The proof or construction follows this route:

1. Use the naturality of the V.2 quotient and its finite-field inverse.
2. Conjugate the supplier’s i=2 maps and identities by these isomorphisms.

Direct prerequisites: **K3BlochGroups:V.5/finite-indecomposable-specialization**, **KTheoryFiniteLocalFields:L.1/finite-field-transfer-formulas**, **KTheoryFiniteLocalFields:L.1/finite-field-galois-descent**.

Acceptance: d=1 gives identity maps. F₂⊂F₄: tr∘res=2, res∘tr=5 on Z/15; Frob₂ acts by4.

Source: The K-book, Chapter IV, IV.1.13, p10.

### Prime-to-characteristic third homology

Identifier: **localized-sl2-homology** (theorem).

Let F be finite of characteristic ℓ and cardinality q. H₃(SL₂(F),Z[1/ℓ]) is cyclic of order q²−1. For a subgroup C⊂SL₂(F) of order prime to ℓ the inclusion induces an injection on integral H₃ and H₃(C,Z) is cyclic of order |C|. GL₂(F) conjugation acts trivially on localized H₃. Integral H₃ is not asserted to have order q²−1.

The proof or construction follows this route:

1. Hutchinson §3 computes Sylow subgroups: away from ℓ they are cyclic, except the generalized quaternion 2-Sylow for odd q. Normalizers act by inversion on split and nonsplit cyclic Sylows.
2. Apply the stable-elements and periodic-homology facts quoted as Theorem 3.1 and Brown III.9–10 in the source. Their formal supplier is an explicit gap, not an assumed Mathlib theorem.
3. Combine primary factors to get q²−1. Injectivity for subgroups follows from periodic resolutions and stable elements; GL₂-conjugation becomes inner after passing to Fq², where restriction is injective.

Direct prerequisites: **mathlib:groupHomology**, **mathlib:Rep.trivial**, **mathlib:Matrix.SpecialLinearGroup**, **mathlib:groupHomology.map**.

Acceptance: q=5 localized order24, not120. The norm-one Cartan of order q+1 injects on H₃.

Source: A Bloch–Wigner complex for SL₂, §3, Corollaries 3.6–3.7 and Lemma 3.8, pp14–15.

### Characteristic torsion in third homology

Identifier: **sl2-characteristic-exceptions** (theorem).

For finite Fq of characteristic ℓ, the ℓ-primary summand of integral H₃(SL₂(Fq),Z) is Z/ℓ exactly for q∈{2,3,4,5,8,9,27}, and is zero otherwise. Thus integral H₃ is abstractly Z/(ℓ(q²−1)) in these exceptional cases, and Z/(q²−1) otherwise.

The proof or construction follows this route:

1. Use transfer from the unipotent Sylow subgroup with its torus action. Lemmas 3.11–3.13 reduce stable elements to invariant exterior and symmetric tensors.
2. The explicit invariant calculations in Lemma 3.14 give the seven nonzero cases; combine with the coprime cyclic factor of the preceding node. The elementary-abelian homology and stable-elements inputs remain in the same gap.

Direct prerequisites: **K3BlochGroups:V.5/localized-sl2-homology**.

Acceptance: H₃(SL₂(F₅),Z) has order120; H₃(SL₂(F₃),Z) has order24. H₃(SL₂(F₁₁),Z) has order120.

Source: A Bloch–Wigner complex for SL₂, §3, Lemma 3.14, pp17–18.

### Finite-field stabilization map

Identifier: **finite-stabilization-map** (construction).

Construct σF:H₃(SL₂(F),Z[1/ℓ])→K₃(F) from SL₂→SL∞ and the inverse stable Hurewicz identification K₃(F)/(−1·K₂(F))≅H₃(SL∞(F),Z). Finite K₂=0 and K₃ has no ℓ-primary torsion, so the integral map extends uniquely over localization. This is the actual stabilization map, not an arbitrary cyclic isomorphism.

The proof or construction follows this route:

1. Use V.1/k2-to-k3-h3-e and identify the stable elementary group over a field with SL∞ by elementary matrix generation. The algebraically closed unstable comparison needed for bijectivity is recorded as a gap.
2. Kill the −1·K₂ term using the exact T.2 finite theorem.
3. Extend along coefficient localization uniquely because ℓ acts invertibly on K₃ by L.1.

Direct prerequisites: **K3BlochGroups:V.5/finite-indecomposable-specialization**, **K3BlochGroups:V.1/k2-to-k3-h3-e**, **K2SymbolsBrauer:T.2/k2-finite-field**, **mathlib:groupHomology.map**.

Its consumers determine the interface: Hutchinson Corollary 3.9 uses it as follows: Supplies the natural comparison with stable K₃. CGZ Lemma 4.4 uses it as follows: Preserves field maps and hence the local comparison squares.

The proposed API is:

- **finiteStabilization** (constructor): The σF homomorphism with the specified stabilization composite.
- **finiteStabilization_natural** (functoriality): For an embedding F→L of finite fields, σL∘H₃(SL₂(f))=K₃(f)∘σF, with the same localized coefficient ring.
- **finiteStabilization_unique** (universal-property): A homomorphism on localized H₃ agreeing on all integral coefficient classes with stabilization equals σF.

The definition is tested by:

- **finiteStabilization_char_torsion** (non-example): The integral stabilization sends every characteristic-primary class to zero.
- **finiteStabilization_F2_F4** (compatibility): The F₂→F₄ square commutes for the actual entrywise inclusion.
- **finiteStabilization_not_integral_iso_F5** (non-example): Integral stabilization at F₅ has a nontrivial kernel; the localized map is bijective.

Acceptance: No identification is chosen by comparing two group orders.

Source: A Bloch–Wigner complex for SL₂, §3, proof of Corollary 3.9, p15.

### Finite-field stabilization comparison

Identifier: **finite-stabilization-equivalence** (comparison).

The map σF is bijective for every finite field, including F₂ and F₃. Consequently H₃(SL₂(F),Z[1/ℓ])≅K₃(F)≅K₃ⁱⁿᵈ(F) naturally in finite fields.

The proof or construction follows this route:

1. Pass to the algebraic closure. Hutchinson invokes Sah’s algebraically closed unstable-to-stable comparison; its exact supplier is a recorded gap.
2. Quillen restriction is injective and the homology inclusion is injective on all prime-to-characteristic factors. The commutative square proves injectivity of σF.
3. The source and target have equal finite orders q²−1, hence σF is onto.

Direct prerequisites: **K3BlochGroups:V.5/finite-stabilization-map**, **K3BlochGroups:V.5/localized-sl2-homology**, **KTheoryFiniteLocalFields:L.1/finite-field-galois-descent**.

Acceptance: q=2 and q=3 are covered for K₃, without introducing a small-field Bloch exact sequence.

Source: A Bloch–Wigner complex for SL₂, §3, Corollary 3.9, p15.

### Finite Bloch–Wigner map

Identifier: **finite-cross-ratio-map** (construction).

For finite F with q≥4 construct λF:H₃(SL₂(F),Z)→Bₛ(F), where Bₛ is precisely the V.3 Suslin kernel using the antisymmetric tensor quotient. Use Hutchinson’s refined configuration edge map followed by RB(F)→Bₛ(F). On a cyclic bar class represented by Σᵢ(1,t,tⁱ⁺¹,tⁱ⁺²), evaluate using the chain map βx,y of §6.3 and the refined cross-ratio map, then forget square classes. Degenerate tuples are handled by β, not by inserting inadmissible symbols.

The proof or construction follows this route:

1. Use the actual group action on P¹ and the refined square-class configuration complex. The infinite acyclicity theorem in V.4 is not applied to a finite set.
2. Hutchinson Theorem 4.3’s finite spectral-sequence analysis and Lemma 7.1 give the edge map into the ordinary Bloch kernel. The refined complex and exactness input are recorded as a gap.
3. Apply the explicit chain map β and cross ratio of §6 to cyclic generators; homotopies prove independence of x,y.

Direct prerequisites: **K3BlochGroups:V.3/bloch-group**, **K3BlochGroups:V.4/configuration-complex**, **K3BlochGroups:V.4/hyperhomology-map**, **K3BlochGroups:V.4/cross-ratio**, **mathlib:groupHomology.map**.

Its consumers determine the interface: Hutchinson §§6–7 uses it as follows: Computes cyclic and quaternion images and fixes the finite Bloch order. HabiroNumberFields:HB.2, CGZ §4.2 uses it as follows: Carries actual unstable homology classes to Bloch classes modulo odd n.

The proposed API is:

- **finiteBlochHom** (constructor): The homomorphism λF induced by the refined configuration edge map.
- **finiteBlochHom_natural** (functoriality): Bₛ(f)∘λF=λL∘H₃(SL₂(f)) for embeddings between finite fields of cardinality at least4.
- **finiteBlochHom_char_torsion** (simp): If ℓᵃz=0, λF(z)=0.
- **finiteBlochHom_cyclic_bar** (characterisation): For a cyclic subgroup and the specified bar generator, λ equals the sum of cr(βx,y(1,t,tⁱ⁺¹,tⁱ⁺²)) in Bₛ; the result is independent of x,y.

The definition is tested by:

- **finiteBlochHom_F5_kernel** (computation): The kernel for F₅ has order40, distinguishing integral H₃ from its order24 localization.
- **finiteBlochHom_F7_kernel** (computation): The kernel for F₇ has order12 and the target has order4.
- **finiteBlochHom_F4_kernel** (computation): The kernel for a field of cardinality4 has order6 and target order5.

Acceptance: At q=5 the map has kernel order40 and target order3.

Source: A Bloch–Wigner complex for SL₂, §4 Theorem 4.3; §6.3–6.4 pp30–33; §7 Lemma 7.1.

### Bloch groups of finite fields

Identifier: **finite-bloch-orders** (theorem).

For q≥4, Bₛ(Fq) is cyclic of order (q+1)/2 when q is odd, and q+1 when q is even. At q=2,3 the unmodified Suslin presentation instead gives Bₛ(F₂)=0 and Bₛ(F₃)=Z; these are separate presentation calculations, not instances of the finite exact sequence. The CGZ convention agrees modulo odd n through V.3/κ, not integrally.

The proof or construction follows this route:

1. In characteristic2 the square-class terms vanish and Theorem 4.3 gives order q+1.
2. For odd q the initial sequence allows q+1 or (q+1)/2. If q≡1 mod4, kill the generalized quaternion image with square angle-brackets; if q≡−1 mod4 kill the cyclic subgroup generated by w using 2{−1/y}=0.
3. For F₂ there are no admissible generators. For F₃ the pre-Bloch group has one generator [−1] and no admissible five-term pairs. Its antisymmetric tensor boundary is the nonzero generator of Z/2, so the Bloch kernel is 2Z≅Z, generated by2[−1]. This differs from the exterior-square kernel, which is all of Z. Parent small-field groups are used only as abstract groups, with this corrected embedding.

Direct prerequisites: **K3BlochGroups:V.5/finite-cross-ratio-map**, **K3BlochGroups:V.5/localized-sl2-homology**, **K3BlochGroups:V.3/angle-bracket-homomorphism**, **K3BlochGroups:V.3/cgz-convention-comparison**, **K3BlochGroups:V.3/pre-bloch-group**.

Acceptance: Bₛ(F₄)=Z/5, Bₛ(F₅)=Z/3, Bₛ(F₇)=Z/4, Bₛ(F₁₁)=Z/6.

Source: A Bloch–Wigner complex for SL₂, §7 Lemma 7.4 and preceding paragraph, pp34–35.

### Finite K₃-to-Bloch map

Identifier: **finite-k3-bloch-map** (construction).

For q≥4, factor λF through coefficient localization (its target has order prime to ℓ), obtaining λF,loc. Define bF=λF,loc∘σF⁻¹:K₃(F)→Bₛ(F). It is a natural surjection and satisfies bF∘σF∘localization=λF. The inverse of σ is canonical, so no cyclic generator enters the definition.

The proof or construction follows this route:

1. The target order from the preceding node is coprime to ℓ; localization therefore gives a unique extension.
2. Compose with the inverse of the actual bijective σF and inherit field-map naturality.
3. Surjectivity is supplied by the finite refined edge-map theorem, not inferred from existence of some group isomorphism.

Direct prerequisites: **K3BlochGroups:V.5/finite-cross-ratio-map**, **K3BlochGroups:V.5/finite-bloch-orders**, **K3BlochGroups:V.5/finite-stabilization-equivalence**.

Its consumers determine the interface: K3BlochGroups:V.5 odd-coefficient comparison uses it as follows: Constructs the map whose tensor is proved bijective. CGZ Lemma 4.4 uses it as follows: Gives the finite vertical comparison with field-map compatibility.

The proposed API is:

- **finiteK3Bloch** (constructor): bF is λF,loc∘σF⁻¹.
- **finiteK3Bloch_triangle** (compatibility): bF(σF(localization(z)))=λF(z).
- **finiteK3Bloch_natural** (functoriality): Bₛ(f)∘bF=bL∘K₃(f) for finite-field embeddings.
- **finiteK3Bloch_surjective** (characterisation): Every finite Bloch class is the image of an actual K₃ class.

The definition is tested by:

- **finiteK3Bloch_F5_kernel** (computation): Its kernel at F₅ has order8.
- **finiteK3Bloch_F7_kernel** (computation): Its kernel at F₇ has order12.
- **finiteK3Bloch_F4_kernel** (computation): Its kernel at cardinality4 has order3.

Acceptance: The triangle commutes before reducing modulo n.

Source: A Bloch–Wigner complex for SL₂, §7 Corollary 7.5 and proof, pp35–36.

### Finite Bloch–Wigner exact sequence

Identifier: **finite-enhanced-torsion-sequence** (theorem).

For q≥4, 0→T̃(Fq)→K₃(Fq)−bF→Bₛ(Fq)→0 is natural and exact; T̃ is exactly the enhanced Tor term of V.4. It is cyclic of order2(q−1) for odd q and q−1 for even q. The left arrow is the homological torsion map of Hutchinson Corollary 7.5. The statement does not identify this arrow with an untwisted roots-of-unity inclusion.

The proof or construction follows this route:

1. Apply the finite refined Bloch–Wigner sequence and the explicit 2-primary calculation of Lemma 7.4.
2. Transport through σF and RB≅B. Identify the kernel with enhanced Tor via the diagonal homology map used in the source. The compatibility of the parent monomial model with this map is recorded in the refined-comparison gap.
3. Use μ(Fq) of order q−1 and the V.4 enhanced Tor computation to obtain the two kernel orders.

Direct prerequisites: **K3BlochGroups:V.5/finite-k3-bloch-map**, **K3BlochGroups:V.4/enhanced-tor**, **K3BlochGroups:V.4/tor-form-comparison**, **K3BlochGroups:V.5/finite-bloch-orders**.

Acceptance: For q=5 orders8→24→3 multiply correctly; for q=4 orders3→15→5.

Source: A Bloch–Wigner complex for SL₂, §7 Corollary 7.5, p35.

### Odd-coefficient finite Bloch comparison

Identifier: **odd-coefficient-finite-comparison** (theorem).

Let q≥4 and n>0 be odd with gcd(n,q−1)=1. The actual map bF induces a bijection K₃(Fq)⊗Z/n→Bₛ(Fq)⊗Z/n. Both are cyclic of order gcd(n,q+1), and κ gives the same comparison with BCGZ. If n|q+1 they have order n. Without the gcd hypothesis this is false (q=7,n=3). These are tensor quotients of integral H₃/K₃, not group homology with Z/n coefficients.

The proof or construction follows this route:

1. Multiplication by n is bijective on the enhanced Tor kernel of order2(q−1) or q−1. The snake lemma for multiplication by n therefore makes the quotient map bijective modulo n, including its injectivity.
2. Compute cyclic quotients from L.1 and finite Bloch orders; κ has 2-primary kernel and cokernel, hence is bijective on odd quotients.
3. Use the finite triangle to give H₃(SL₂,Z)⊗Z/n the same map when n|q+1. Since gcd(n,ℓ)=1, characteristic-primary integral torsion disappears.

Direct prerequisites: **K3BlochGroups:V.5/finite-enhanced-torsion-sequence**, **K3BlochGroups:V.5/finite-indecomposable-specialization**, **K3BlochGroups:V.3/cgz-convention-comparison**, **mathlib:TensorProduct.map**, **mathlib:ZMod**.

Acceptance: q=5,n=3 gives Z/3; q=17,n=9 gives Z/9; q=8,n=9 gives Z/9. q=7,n=3 gives K₃/3=Z/3 but Bₛ/3=0.

Source: Bloch groups, algebraic K-theory, units, and Nahm’s Conjecture, §4.2 and Lemma 4.4, pp406–407; A Bloch–Wigner complex for SL₂, §7 Corollary 7.5, p35.

### Norm-one nonsplit Cartan embedding

Identifier: **norm-one-cartan-embedding** (construction).

For a quadratic extension E/F of finite fields and a basis e:Fin2→E, let C¹=ker(N:Eˣ→Fˣ). Construct ιe:C¹→SL₂(F) by the matrix in e of multiplication by u. Its determinant is N(u)=1 and it is injective. A basis change conjugates the matrices by the actual change-of-basis element of GL₂(F). The field norm and matrix carriers are Mathlib’s; no second norm or special-linear group is defined.

The proof or construction follows this route:

1. Restrict the multiplication representation of Eˣ to the norm-one subgroup.
2. The determinant-norm identity places each multiplication matrix in Mathlib SL₂. Evaluate multiplication at1 to prove injectivity.
3. Express the two representations through their basis equivalences; this yields the actual conjugation equation.

Direct prerequisites: **mathlib:Algebra.norm**, **mathlib:LinearMap.toMatrix**, **mathlib:Matrix.SpecialLinearGroup**.

Its consumers determine the interface: Hutchinson Lemma 3.5 uses it as follows: Computes the nonsplit Sylow normalizer. CGZ §4.2; HabiroNumberFields:HB.2 uses it as follows: Defines the actual homology map carrying Cartan classes into finite Bloch groups.

The proposed API is:

- **cartanEmbedding** (constructor): The multiplication-matrix homomorphism C¹→SL₂(F).
- **cartanEmbedding_toMatrix** (data): Its underlying matrix is LinearMap.toMatrix e e of multiplication by u.
- **cartanEmbedding_injective** (characterisation): Equality of matrices implies equality of units.
- **cartanEmbedding_changeBasis** (compatibility): If U=e′⁻¹∘e in coordinates then ιe′(u)=Uιe(u)U⁻¹.

The definition is tested by:

- **cartanEmbedding_one** (degenerate): The norm-one unit1 maps to the identity matrix.
- **cartanEmbedding_negOne** (computation): The norm-one unit−1 maps to the scalar matrix−I, including characteristic2.
- **cartanEmbedding_trace** (compatibility): For u∈C¹ the matrix trace is u+u⁻¹, viewed in E by algebraMap.

Acceptance: C¹ has order q+1 from surjectivity of the finite-field norm.

Source: A Bloch–Wigner complex for SL₂, §3 before Lemma 3.5, p13; Bloch groups, algebraic K-theory, units, and Nahm’s Conjecture, §4.2 p406.

### Nonsplit Cartan comparison modulo n

Identifier: **cartan-homology-modulo-n** (theorem).

Let Fq be finite with q≥4 odd, n>0 odd and n|q+1. The maps H₃(C¹,Z)⊗Z/n→H₃(SL₂(Fq),Z)⊗Z/n→K₃(Fq)⊗Z/n→Bₛ(Fq)⊗Z/n→BCGZ(Fq)⊗Z/n induced by ιe, stabilization, bF and κ are bijective. Their composite is independent of e because GL₂ conjugation acts trivially after inverting the characteristic. The result concerns H₃(C¹), not a claimed canonical identification H₃(C¹)=C¹.

The proof or construction follows this route:

1. C¹ is cyclic of order q+1 and its inclusion is injective on integral H₃ by Corollary 3.7. Its index in prime-to-characteristic H₃ is q−1. Since n is odd and n|q+1, this index is invertible modulo n.
2. Use coefficient localization and the already specified stabilization/Bloch maps.
3. Lemma 3.8 and the basis-change equation make the induced map independent of the basis. The generic cyclic-homology functor and stable-elements inputs are in the recorded gap.

Direct prerequisites: **K3BlochGroups:V.5/norm-one-cartan-embedding**, **K3BlochGroups:V.5/localized-sl2-homology**, **K3BlochGroups:V.5/odd-coefficient-finite-comparison**, **mathlib:groupHomology.map**.

Acceptance: q=11,n=3 has group order3 throughout. A subgroup μn⊂C¹ need not generate H₃(C¹)/n if n²|q+1: the cyclic inclusion multiplier is (q+1)/n. A primitive root must not be silently equated with a quotient generator.

Source: Bloch groups, algebraic K-theory, units, and Nahm’s Conjecture, §4.2 pp406–407.

### Number-field decomposable product image

Identifier: **number-field-product-image** (application).

For a number field F, the image of K₃ᴹ(F)→K₃(F) equals the image of multiplication by [−1]:K₂(F)→K₃(F). Via V.2 injectivity it is (Z/2)^r₁. In particular it vanishes for totally imaginary F. All degree-three Milnor signs are imported from T.2:symbols, not computed in V.5.

The proof or construction follows this route:

1. Matsumoto and multiplicativity put every product [−1]·K₂(F) in the degree-three Milnor image.
2. For an arbitrary Milnor3 class choose d∈Fˣ with negative signs precisely at the real places where that class has nonzero signature, using the upstream total-sign surjectivity. The symbol{−1,−1,d} has the same degree3 signs.
3. The imported Bass–Tate sign map is injective at degree3, so these classes are equal. This symbol is [−1] times the degree2 symbol{−1,d}.
4. Use the V.2 injection to identify the common image with the sign group.

Direct prerequisites: **K2SymbolsBrauer:T.2:symbols/milnor-number-field**, **K2SymbolsBrauer:T.2/matsumoto**, **K3BlochGroups:V.2/milnor-to-quillen-degree-three**, **K3BlochGroups:V.2/milnor-k3-injective**, **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences**.

Acceptance: OverQ the image is the nonzero order2 subgroup ofZ/48. OverQ(i) the image is zero.

Source: The K-book, Chapter III, III.7.2(c)–(d), pp61–62.

### Decomposable rational classes

Identifier: **rational-decomposable-subgroup** (theorem).

Import K₃(Z)→K₃(Q) as an isomorphism and K₃(Q)≅Z/48 from ArithmeticKTheory N.5/N.7 (with N.8 responsible for its certified example). Bass–Tate gives K₃ᴹ(Q)=Z/2 and the V.2 degree-three map is injective. Its image is the unique order2 subgroup generated by {−1,−1,−1}; under any cyclic coordinate it is {0,24}. Thus K₃ⁱⁿᵈ(Q)=Z/24. This quotient extension does not split.

The proof or construction follows this route:

1. Set r₁=1,r₂=0,w₂=24 in N.5’s degree3 row and use its ring-of-integers comparison.
2. Use the T.2 Bass–Tate sign isomorphism and V.2 injectivity; the real triple−1 symbol is nonzero.
3. The unique order2 subgroup of Z/48 is generated by24; its quotient is Z/24. A section would split Z/48 as Z/2⊕Z/24, whose exponent is24, contradiction.
4. N.8’s current certified-example node still points back to V.5; the ownership correction is requested and recorded as a gap rather than imported circularly.

Direct prerequisites: **ArithmeticKTheory:N.5/the-real-case-modulo-eight**, **ArithmeticKTheory:N.5/soule-theorem**, **ArithmeticKTheory:N.7/w-invariant**, **K2SymbolsBrauer:T.2:symbols/milnor-number-field**, **K3BlochGroups:V.2/milnor-k3-injective**, **K3BlochGroups:V.2/k3-indecomposable**, **K3BlochGroups:V.5/number-field-product-image**.

Acceptance: The decomposition is a short exact sequence, not a direct-product splitting.

Source: The K-book, Chapter VI, VI.2.1.2 p7; VI.5.3 p24; The K-book, Chapter III, III.7.2(d) p62.

### Gaussian indecomposable classes

Identifier: **gaussian-decomposable-vanishing** (application).

For F=Q(i), import K₃(F)≅Z⊕Z/24 from ArithmeticKTheory N.5 and its N.8 example. Bass–Tate gives K₃ᴹ(F)=0 since r₁=0; hence the quotient K₃(F)→K₃ⁱⁿᵈ(F) is an isomorphism. The rank1 free generator exists but is not canonical; choosing a basis is distinct from constructing a Bloch-symbol generator with certified index.

The proof or construction follows this route:

1. Use N.5 with r₁=0,r₂=1 and the value w₂=24 supplied by the N.8 certificate request; the certified w₂ example is a precise gap until its reverse V.5 dependency is removed.
2. Bass–Tate signs vanish, so the indecomposable quotient is canonically an isomorphism.
3. A group decomposition supplies existence of a free generator modulo torsion but no preferred class or regulator normalization.

Direct prerequisites: **ArithmeticKTheory:N.5/totally-imaginary-integral-structure**, **K2SymbolsBrauer:T.2:symbols/milnor-number-field**, **K3BlochGroups:V.2/k3-indecomposable**, **K3BlochGroups:V.5/number-field-product-image**.

Acceptance: Imaginary degree-three Milnor symbols have zero image. Both K₃ and K₃ⁱⁿᵈ have torsion order24 and rank1.

Source: The K-book, Chapter VI, VI.2.1.2 p7; VI.5.3 p24.

### Rogers homomorphism on the real pre-Bloch group

Identifier: **real-rogers-detector** (construction).

Using the interval Rogers function L from Polylogarithms P.1, construct ρ:Pₛ(R)→R/(π²Z). For an admissible real generator x, set ρ([x]) equal modulo π² to L(x)−π²/6 if 0<x<1, π²/6−L(1/x) if x>1, and L(1/(1−x))−π²/3 if x<0. This is the Suslin normalization. Restricting along Bₛ(R)⊂Pₛ(R) gives the Bloch detector. No analytic function is newly defined in V.5.

The proof or construction follows this route:

1. Suslin’s positive presentation P′(R) has generators0<x<1 and five-term relations restricted to0<y<x<1. The map P′→P is onto with kernel generated by6c′ (Lemma1.6), proved by the three-case inverse ψ on p219. This auxiliary presentation proof is recorded in a gap, rather than smuggling a missing Prop into an interface.
2. The shifted function L(x)−L(1) annihilates the restricted five-term relation since the unshifted relation equals L(1). It sends c′ to−π²/6 and6c′ to−π².
3. Descend moduloπ² and evaluate ψ to obtain the three formulas. Restrict to the V.3 Bloch kernel.

Direct prerequisites: **K3BlochGroups:V.3/pre-bloch-group**, **K3BlochGroups:V.3/bloch-group**, **K3BlochGroups:V.3/element-c**, **Polylogarithms:P.1**, **mathlib:AddCircle**.

Its consumers determine the interface: Suslin Proposition1.1 uses it as follows: Detects the order6 of the universal real class. K3BlochGroups:V.5, rational Bloch torsion uses it as follows: The Q→R map carries cQ to cR, giving the rational lower bound.

The proposed API is:

- **realRogersHom** (constructor): The homomorphism ρ on the exact Suslin real pre-Bloch presentation.
- **realRogersHom_pos** (simp): For0<x<1, ρ([x])=[L(x)−π²/6].
- **realRogersHom_gt_one** (simp): Forx>1, ρ([x])=[π²/6−L(1/x)].
- **realRogersHom_neg** (simp): Forx<0, ρ([x])=[L(1/(1−x))−π²/3].
- **realRogersHom_unique** (extensionality): A homomorphism agreeing on every admissible symbol with those three formulas equalsρ.

The definition is tested by:

- **realRogersHom_half** (computation): ρ([1/2])=[−π²/12].
- **realRogersHom_two** (computation): ρ([2])=[π²/12].
- **realRogersHom_neg_one** (computation): ρ([−1])=[−π²/4].

Acceptance: The period isπ², notπ²/2; c is sent to−π²/6.

Source: K₃ of a field, and the Bloch group, §1 Lemma 1.6 and proof, pp219–220; The Dilogarithm Function, II.1.A pp23–24.

### Universal real and rational Bloch torsion

Identifier: **universal-class-order-six** (theorem).

The universal class c has exact order6 in Bₛ(R) and Bₛ(Q). The real detector sends c=[2]+[−1] to−π²/6 moduloπ², an element of order6. Naturality under Q→R proves the rational lower bound; the V.3 relation6c=0 gives the upper bound in both fields. Through the infinite Suslin sequence, K₃ⁱⁿᵈ(Q)=Z/24 and T̃(Q) has order4, so Bₛ(Q)=Z/6 and c is a generator.

The proof or construction follows this route:

1. Evaluate the detector at2 and−1 and add. The additive-circle class−π²/6 has exact order6 becauseπ≠0.
2. Use6c=0 in the exact Suslin pre-Bloch presentation and naturality Q→R.
3. Apply V.4 for the infinite fieldQ: enhanced Tor order4 and indecomposable order24 give Bloch order6.

Direct prerequisites: **K3BlochGroups:V.5/real-rogers-detector**, **K3BlochGroups:V.5/rational-decomposable-subgroup**, **K3BlochGroups:V.3/element-c**, **K3BlochGroups:V.3/angle-bracket-homomorphism**, **K3BlochGroups:V.4/suslin-exact-sequence**, **K3BlochGroups:V.4/enhanced-tor**.

Acceptance: 3cQ≠0; the cQ generator maps to the order6 class in Bₛ(R).

Source: K₃ of a field, and the Bloch group, §1 Proposition1.1, p220; The K-book, Chapter VI, VI.5.2.1 p24.

## Supplier requests and refinement boundaries

The pass ends at target level. The following boundaries are explicit inputs to the implementation work, not evidence that a source theorem is false or that its statements are formalised.

### Finite-group stable elements and periodic homology supplier

Hutchinson §3 quotes Brown III.9–10 (homological stable elements via Sylow transfer) and Swan Theorems1–2 (cyclic/quaternion periods) and uses cyclic/elementary-abelian homology. None was found in the pinned libraries or as an exact atlas node. The source explicitly states the needed results, but its cited general proofs have not been read in this pass. A foundational owner must provide these results and cyclic subgroup inclusion maps; propose StableHomotopyKTheory PartII below. Do not misuse H.6’s K-spectrum coefficients as this theorem.

Consumers: **K3BlochGroups:V.5/localized-sl2-homology**, **K3BlochGroups:V.5/sl2-characteristic-exceptions**, **K3BlochGroups:V.5/cartan-homology-modulo-n**.

### Algebraically closed unstable comparison and stable-SL bridge

The exact stable Hurewicz sequence is V.1/k2-to-k3-h3-e. Identify its stable elementary group with SL∞ for a field and verify the induced natural map used in Hutchinson Cor3.9. That proof invokes Sah’s algebraically closed unstable-to-stable comparison (Homology of classical Lie groups made discrete III). The latter was not read or matched to a supplier node in this pass and remains an explicit input gap; it is not replaced by equality of cyclic orders.

Consumers: **K3BlochGroups:V.5/finite-stabilization-map**, **K3BlochGroups:V.5/finite-stabilization-equivalence**.

### Finite refined configuration complex and torsion-map identification

Hutchinson §§4,6,7 gives the finite spectral-sequence edge map, square-class refined RB→B and explicit β-cycle formulas. The parent V.4 provides ordinary configurations and infinite acyclicity, not this finite refined chain package. Refine the chain maps, their homotopies, Theorem4.3 finite exactness, and the identification of its kernel arrow with V.4’s monomial enhanced Tor. The full chain-level cyclic API is commented, not represented by a dummy condition, in the suggested file.

Consumers: **K3BlochGroups:V.5/finite-cross-ratio-map**, **K3BlochGroups:V.5/finite-bloch-orders**, **K3BlochGroups:V.5/finite-enhanced-torsion-sequence**.

### Rogers supplier and positive-presentation descent

The analytic interval Rogers package is requested from P.1. Suslin Lemma1.6 proves P′(R)/⟨6c′⟩≅P(R) by a three-case inverse; this presentation argument has been read on pp219–220 and specified here, but its auxiliary carrier and proof must be refined before implementation. The final detector and generator values are stated; the missing theorem is not encoded as a Prop-valued field.

Consumers: **K3BlochGroups:V.5/real-rogers-detector**, **K3BlochGroups:V.5/universal-class-order-six**.

### Arithmetic N.8 reverse ownership and Gaussian w₂ certificate

The current N.8/k-groups-of-the-integers and N.8/gaussian-and-imaginary-quadratic refer to V.5 as supplier. Importing these exact nodes into V.5 would be circular, contrary to RT-AREA-ktheory-2/22. N.5 and N.7 independently supply the rational ambient group. The Gaussian r₂=1,w₂=24 certificate is requested from N.8 together with removal of the reverse dependency; its direct edge is proposed, not falsely claimed already acyclic.

Consumers: **K3BlochGroups:V.5/rational-decomposable-subgroup**, **K3BlochGroups:V.5/gaussian-decomposable-vanishing**.

The three supplier requests are:

- **Polylogarithms:P.1**: Define interval Rogers L(x)=Σxⁿ/n²+(1/2)log(x)log(1−x), analytic for0<x<1, with L(0)=0,L(1)=π²/6,L(1/2)=π²/12, derivative−(1/2)(log(1−x)/x+log(x)/(1−x)), reflectionL(x)+L(1−x)=π²/6, and the ordered Suslin five-term expression=L(1) for0<y<x<1. Supply exact unshifted normalization, not only a Bloch–Wigner map or a quotient of periodπ²/2.
- **ArithmeticKTheory:N.8**: Correct the existing N.8 integer/Gaussian certificate nodes to import N.5, not V.5. Supply certified K₃(Z)→K₃(Q)≅Z/48 and K₃(Q(i))≅Z⊕Z/24, with r₁=0,r₂=1,w₂(Q(i))=24. Their group computations are owned by N.5/N.8; V.5 only consumes them to track Milnor images. Remove the reverse V.5 prerequisite before materialising the requested N.8→V.5 edge.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences**: Use the upstream total sign homomorphism on Fˣ and its surjectivity: for each prescribed ±1 pattern at the real places of a number field there is a nonzero element with exactly those signs. This is already in the upstream roadmap and is consumed without re-planning it.

The periodic homology gap proposes a foundational **StableHomotopyKTheory, Part II** for homological Sylow stable elements and cyclic/quaternion periodic resolutions. No present H.6 node is falsely cited as supplying them. The finite-field configuration gap remains inside this roadmap, because its SL₂ and Bloch-specific edge maps are the missing extension of V.4. The real positive-presentation descent has been read and its proof route specified; its auxiliary carrier and finite case analysis require refinement before implementation. The analytic theorem itself is the P.1 request.

## Prototype and acceptance matrix

The suggested file uses individual Mathlib imports and actual carriers for homology, SL₂, tensors, field norm, matrices and the additive circle. Supplier K-groups, Bloch groups, symbols and maps remain explicit parameters, as in the accepted parent prototype. Instantiating them with the suppliers is a mathematical obligation; successful elaboration does not prove these forms for arbitrary parameter values. The coefficient map is likewise the intended map on localized chains. There are no invented proposition-valued definitions or structures assuming a missing theorem.

All five construction signatures, their accessible API signatures and all fifteen tests occur there. **finiteBlochHom_cyclic_bar** is the one explicitly unstated API: the refined β-chain package has no available carrier/interface yet. Its exact equation is specified in the packet and the comment, rather than encoded with a dummy condition. The named finite homology, stabilization, exactness, odd-n, Cartan, product-image and arithmetic application statements are present. The order-six prototype is stated for the supplied universal class. This precise limitation belongs to the finite refined-configuration gap.

| Case | K₃ | Integral H₃(SL₂) | Bₛ | Comparison check |
| --- | --- | --- | --- | --- |
| q=2 | ℤ/3 | ℤ/6 | 0 | localized stabilization, no Bloch exact sequence |
| q=3 | ℤ/8 | ℤ/24 | 2ℤ⊂Pₛ=ℤ | localized stabilization, no Bloch exact sequence |
| q=4 | ℤ/15 | ℤ/30 | ℤ/5 | λ kernel6, b kernel3 |
| q=5 | ℤ/24 | ℤ/120 | ℤ/3 | λ kernel40, b kernel8; modulo3 comparison |
| q=7 | ℤ/48 | ℤ/48 | ℤ/4 | kernel12; modulo3 is not bijective |
| q=11 | ℤ/120 | ℤ/120 | ℤ/6 | Cartan comparison modulo3 |
| q=17 | ℤ/288 | ℤ/288 | ℤ/9 | odd-n comparison for n=9 |
| ℚ | ℤ/48 | finite-field theorem inapplicable | ℤ/6 | Milnor image{0,24}, indecomposable ℤ/24 |
| ℚ(i) | ℤ⊕ℤ/24 | finite-field theorem inapplicable | supplied by infinite Suslin sequence | Milnor3=0; free generator is a choice |

The six planets are **Finite-field SL₂ homology**, **Finite Bloch–Wigner map**, **Finite-field Bloch groups**, **Finite Bloch comparison modulo n**, **Rational indecomposable K₃**, and **Universal Bloch torsion**. Their names identify mathematical objects or named theorem packages, not locators or validation checks.

## Sources

The PDFs and extracted texts are not part of the repository. The packet records each downloaded file’s SHA-256 and access date. These are the public copies read in this pass:

- Kevin Hutchinson, [A Bloch–Wigner complex for SL₂](https://arxiv.org/pdf/1107.0264v2), arXiv:1107.0264v2; published JPAA 217 (2013), 2003–2035. Read: §3, especially Corollaries 3.6–3.9 and Lemma 3.14; §4 Theorem 4.3; §6.3–6.4 chain and cyclic formulas; §7 Lemmas 7.1–7.4 and Corollary 7.5.
- Frank Calegari, Stavros Garoufalidis, Don Zagier, [Bloch groups, algebraic K-theory, units, and Nahm’s Conjecture](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf), Ann. Sci. ENS 56 (2023), 383–426; printed author copy. Read: §4.2 pp406–407; §4.3 Lemma 4.4 p407; compare arXiv v3.
- Charles Weibel, [The K-book, Chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), Author’s public chapter, Higher K-Theory; Examples III.7.2. Read: III.7.2(a), (c), (d) pp61–62.
- Charles Weibel, [The K-book, Chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), Author’s public chapter; Corollary IV.1.13. Read: IV.1.13 and 1.13.1 p10.
- Charles Weibel, [The K-book, Chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), Author’s public chapter; Algebraic K-Theory of Fields. Read: VI.2.1.2 pp7–8; VI.5.1–5.3 pp23–25.
- A. A. Suslin, [K₃ of a field, and the Bloch group](https://www.maths.dur.ac.uk/users/herbert.gangl/Suslin_K3_Bloch_group.pdf), Proc. Steklov Inst. Math. 183 (1991), 217–239; scanned public copy. Read: §1 pp219–220, Lemmas 1.4–1.6 and Proposition 1.1; visually read scan pages3–4.
- Don Zagier, [The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf), Frontiers in Number Theory, Physics, and Geometry II (2007). Read: II.1.A pp23–24, Rogers normalization and real extension.

The upstream Algebraic Topology and Global Number Fields documents were read for the chain-map, carrier and ownership standard. The original Brown, Swan and Sah proofs remain unread boundaries recorded above. The K-book’s infinite-field Suslin proof is used only for ℚ and ℝ; Hutchinson supplies the finite-field theorem. The parent’s K-book finite-extension source issue is resolved here at q≥4 without editing or duplicating its sourceIssues entry.
