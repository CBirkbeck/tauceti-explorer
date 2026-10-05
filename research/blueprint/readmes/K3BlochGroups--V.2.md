# V.2 — Decomposable and indecomposable parts

This is the target-level continuation of the accepted [K₃ and Bloch-groups plan](K3BlochGroups.md), scoped solely to `K3BlochGroups:V.2`. The [packet](../packets/K3BlochGroups--V.2.json) records eight new consumer nodes and ten inherited nodes. The [suggested file](../suggested/K3BlochGroups--V.2.lean) supplies the new signatures. The planning pass is complete and the stage is **planned**. Foundational supplier refinements remain explicit; this document certifies neither a closed prerequisite graph nor implemented higher K-theory.

## Objects and conventions

Let F be a field. Milnor K-theory is imported from `K2SymbolsBrauer:T.2/milnor-k-theory`: the graded tensor algebra of the multiplicative units, written additively, modulo the homogeneous Steinberg ideal. Quillen K-theory and its products come from `GeneralAlgebraicKTheory:K.2:plus` and `K.7`. The ordered product of three unit classes is the degree-three component m₃ of the natural graded comparison. Its exact supplier is `K2SymbolsBrauer:T.2/graded-map-degree-three`; the graded construction is `T.2/graded-map`. The inherited V.2 degree-three node is a consumer alias of these declarations. V.2 supplies no second tensor presentation or graded product map.

Define D(F)=im(m₃), with its inclusion into K₃(F). The inherited `K3ind` is the actual additive quotient K₃(F)/D(F), with its surjection q_F. The defining right-exact sequence is

\[
K_3^M(F)\xrightarrow{m_3}K_3(F)\xrightarrow{q_F}K_3^{\mathrm{ind}}(F)\longrightarrow0.
\]

Exactness means that an element maps to zero precisely when it is in the preceding image. It does not assert injectivity of m₃. The integral injectivity theorem, inherited as `V.2/milnor-k3-injective`, supplies that extra assertion for every field. Once it is proved, the sequence is short exact and Milnor K₃ is isomorphic to the actual subgroup D(F). This identification cannot be built into the definition of D or assumed merely from the degree-two Matsumoto comparison.

All three constructions are natural under field homomorphisms. A map on the quotient is induced by a map on K₃ preserving the image subgroup. A homomorphism out of the quotient is specified by a homomorphism out of K₃ killing that subgroup; equality can be checked on representatives. The closest existing object is Mathlib's additive quotient group, with its quotient map, lift and lift equivalence. The API below preserves that universal property and the actual maps, rather than selecting abstract group isomorphisms from orders.

For a number field F, R(F) is the finite subtype of real infinite places, with cardinality r₁; the complex-place subtype has cardinality r₂. Use the pinned `NumberField.InfinitePlace` definitions, not all complex embeddings counted twice. At a real place v the signature of {a,b,c} is the additive element 1 of Z/2 precisely when all three entries are negative under the associated real embedding. Thus the signature is additive, while negativity is evaluated in the multiplicative units. The Bass–Tate isomorphism σ_F:K₃ᴹ(F)≃(R(F)→Z/2) is the n=3 specialization of `K2SymbolsBrauer:T.2:symbols/milnor-number-field`. Its n≥3 statement remains owned there.

## Source route and real-place generators

The primary source is Bass and Tate, *The Milnor ring of a global field*, in Lecture Notes in Mathematics 342 (1973). The public volume scan contains Chapter II §§1–2 on printed pages 393–402. Theorem (2.1)(3) proves the general global-field calculation for n≥3; its proof on pages 398–402 was read, rather than inferred from Weibel's summary. Its auxiliary finiteness result uses the global tame kernel and finite-field residue groups. Reduction modulo a prime uses prime-to-p restriction and transfer to adjoin roots of unity, Tate's K₂ norm-residue comparison, local invariants and reciprocity, and global Brauer injectivity. The character computation then uses idelic orthogonality and Kummer theory to eliminate finite-place contributions. Only the real-place contribution at p=2 remains.

The final paragraph chooses u_v negative at v and positive at all other real places. These choices exist by weak approximation. To use Mathlib's existing density statement, impose a nonempty open sign interval at each real place and arbitrary nonempty open conditions at the complex places. Pick a diagonal field element in that box. Its negative value at v forces it to be nonzero, so it determines a unit. The coordinate generator can then be written

\[
b_v=\{u_v,u_v,u_v\}=\{-1,-1,u_v\}.
\]

The repeated-entry equality uses the supplier Milnor identities; alternatively the second expression is determined directly by its signatures. Define b_v canonically as σ_F⁻¹(δ_v). This separates the mathematical generator from the choice of its representative. Another unit with the same signs represents the same b_v. Distinct places give different generators; the all-minus-one triple is the sum of all b_v, rather than an individual coordinate when r₁>1. Every class is the finite sum over its nonzero coordinates. Restriction along F→L pulls signatures back along R(L)→R(F), so b_v restricts to the sum of coordinate generators over real places above v. A real place can have no real place above it, in which case this sum is zero.

The original proof gives the source route for the supplier's existing Bass–Tate gap, but its Moore, Tate and Weil citations and the finiteness proofs in Chapter II §§3–5 were not independently read. The general theorem is therefore imported with its existing proof gap, accompanied by the exact source and refinement request. This consumer packet does not certify that supplier as source-decomposed. Its arithmetic inputs belong to `MotivicEtaleKTheory:M.2` and the Hilbert-symbol comparison in `K2SymbolsBrauer:T.7`, together with their own prerequisites.

Each b_v is the product of {−1} with {−1,u_v}. Consequently multiplication by {−1} from Milnor K₂ onto Milnor K₃ is surjective for a number field. Matsumoto's isomorphism and the graded product comparison then identify the image of [−1]·K₂(F) in K₃(F) with D(F). This is the precise product identity needed by the inherited stable Hurewicz sequence. It is proved from real-place generators, without using a later numerical K₃ calculation. For a general field the Hurewicz kernel is only the image of {−1}·K₂ᴹ; no all-fields surjectivity of that product is asserted.

## Integral injectivity and its foundational inputs

The inspected author chapter gives the low-degree motivic sequence in VI.4.3.1:

\[
K_4(F)\longrightarrow H^0(F,\mathbb Z(2))
\xrightarrow{d_2}K_3^M(F)\xrightarrow{m_3}K_3(F)
\xrightarrow{e_F}H^1(F,\mathbb Z(2))\longrightarrow0.
\]

`MotivicEtaleKTheory:M.6` supplies the multiplicative spectral sequence and the filtered K-theory mechanism. `M.4` supplies motivic complexes, vanishing and the diagonal Milnor identification. The inherited V.2 extraction specifies the low-degree row and matches its edge map to the exact graded supplier. Its integral coefficient ring and indexing are part of the statement. The finite-coefficient row is a separate sequence and can have a nonzero differential.

The kernel of m₃ has exponent two. The precise normalization comes from V.11.13: the composite of m_i with the diagonal motivic Chern operation is multiplication by (−1)^{i−1}(i−1)!. At i=3 the multiplier is **+2**. V.11.3 derives it from the integral product rule and the first Chern operation on units; V.11.11 constructs the motivic Chern operations using projective bundles on simplicial classifying spaces, localization, Whitney sums and splitting. These passages and their proofs were inspected. The referenced motivic projective-bundle foundations, Bloch's primary construction and the product-rule exercise were not independently decomposed here. An integral operation with this normalization requires a foundational Motivic–Étale K-theory Part II over M.4/M.6 and the higher-Chern direction of Scheme K-theory S.7. The regulator stage M.8 does not supply it: importing M.8 would lead back through V.4. Rational Chern characters cannot establish this integral torsion bound.

In characteristic two, Izhboldin's theorem says that Milnor K_n has no characteristic-prime torsion. Together with the exponent-two bound, it forces the degree-three kernel to vanish. K-book III.7.8 includes a proof using the Bloch–Kato–Gabber differential-symbol theorem, divisibility of the characteristic-prime torsion subgroup, transfer through Artin–Schreier extensions, and an induction with its auxiliary P(E)=I(E) statement. This is a general Milnor-theory theorem and is requested as a Part II of its owner. It is not silently substituted by the scope of M.5d. The underlying Bloch–Kato/Izhboldin primary references remain recorded inputs requiring supplier work.

In characteristic different from two, the new obstruction theorem states that H⁰(F,Z(2))/2=0. The exponent-two bound first makes d₂ factor through this quotient. The coefficient triangle injects it into H⁰(F,Z/2(2)). The required **degree-zero, weight-two motivic-to-étale comparison** identifies the latter with H⁰_et(F,μ₂⊗²)=Z/2. This comparison is an extension beyond M.5's diagonal Milnor norm-residue theorem. Naturality matters: restriction on the constant étale groups from F to an algebraic closure is the identity, so the quotient injects into the corresponding quotient over that algebraic closure.

Over the algebraic closure, Milnor K₃ is uniquely divisible and hence has no two-torsion. The exponent-two bound therefore makes d₂ zero there. Only after this step does exactness make K₄ map surjectively onto H⁰(Z(2)). Divisibility of K₄ makes the latter divisible, so its quotient by two vanishes. This proves vanishing over F by the natural injection. No subgroup of a divisible group is being assumed divisible. For K₄, characteristic zero uses VI.1.6, while positive characteristic uses VI.1.3.1(i); the parent's source issue `K3BlochGroups/E6` already records the overly broad citation to VI.1.6. Milnor unique divisibility is imported only in degrees n≥2. M.7 is asked for the K₄ specialization with rigidity, coefficient universal coefficients and the characteristic-prime case explicit.

Integral injectivity gives 0→K₃ᴹ→K₃→K₃^ind→0 for every field. It does not give injectivity of Milnor K₃/m into finite-coefficient K₃. VI.4.3 provides Q and modulus eight as a failure case. That numerical example is a source sanity check requiring downstream arithmetic computations, not an incoming edge from V.5 in this plan.

## Arithmetic and quotient interfaces

The decomposable signature transports σ_F through the inverse of the injective corestriction K₃ᴹ(F)→D(F). It gives |D(F)|=2^{r₁}, exponent two, and naturality on the actual embedded subgroup. In particular D(F) is contained in the torsion subgroup, but the indecomposable quotient is not a torsion-free quotient. Numerical torsion orders belong to V.5 and N.5/N.8; the current constructions require none of those later calculations.

If r₁=0, D(F)=0 and the quotient map itself is an additive equivalence K₃(F)≃K₃^ind(F). Its inverse returns the unique ambient class representing a quotient class. The hypothesis applies to Q(i), without choosing a generator of its free summand or importing its numerical K₃ answer. It fails for Q: the unique all-negative Milnor class is nonzero and its image remains nonzero by integral injectivity. Naturality is asserted for embeddings between totally imaginary number fields.

For a number field the inherited stable Hurewicz map K₃(F)→H₃(SL(F),Z) is surjective, with kernel im(m₃({−1}·K₂ᴹ)). The product identity makes that kernel D(F), so the quotient universal property produces the stable homology equivalence. Its evaluation is h_F(x) on q_F(x), and its inverse takes h_F(x) to q_F(x). Here SL(F) is stable. The unstable SL₂ homology and the Suslin sequence are different downstream constructions. Neither is used to construct this equivalence.

The motivic edge equivalence is available for every field, directly from the rightmost exactness of the low-degree sequence. It identifies K₃^ind(F) with H¹(F,Z(2)), with evaluation e_F(x) on q_F(x). It does not need m₃ to be injective: equality of the edge kernel with the image subgroup and edge surjectivity already suffice. This gives a useful independent check that the domain is the image quotient, and that no rationalisation has been inserted into the integral comparison.

The inherited Borel-rank node requires finite generation of K₃(O_F) from `ArithmeticKTheory:N.3:finite-generation`, rank r₂ from `N.3:ranks` and the independent BorelRegulators R.3 node, and the canonical localization isomorphism K₃(O_F)→K₃(F) from `N.5`. Merely quoting Borel for orders does not provide the field comparison. The finite subgroup D(F) leaves the free rank unchanged in the quotient. Flat rational tensoring yields the inherited equivalence K₃(F)⊗Q≃K₃^ind(F)⊗Q and annihilates Milnor K₃. It also annihilates the other torsion in the indecomposable group: rank data cannot recover the integral extension or finite-regulator data. No second regulator or general rank theorem is owned by V.2.

## Declaration and test catalogue

The following inherited nodes retain their IDs and contracts. Their API is reproduced for the two inherited constructions so that the reader can use the stage without reconstructing the parent. Tests using numerical V.5 answers are outgoing integration tests, not proof inputs to this stage.

### Inherited: The degree-three part of the graded Milnor-to-Quillen map

`K3BlochGroups:V.2/milnor-to-quillen-degree-three`. Specialise the graded ring map K^M_*(F) -> K_*(F) imported from K2SymbolsBrauer T.2:graded-map to degree three, obtaining a homomorphism K_3^M(F) -> K_3(F) determined by the product of three units. Nothing about this map is asserted in degrees other than three, and its degree-two case, an isomorphism by Matsumoto's theorem, is not a model for degree three.

API:

- **milnorToQuillen3** — The homomorphism K_3^M(F) → K_3(F).
- **milnorToQuillen3_symbol** — It sends the Milnor symbol {a,b,c} to the product [a]·[b]·[c] of K_1 classes, in this order.
- **milnorToQuillen3_symbol_eq_mul** — milnorToQuillen3 {a,b,c} = [a]·m({b,c}) under the product K_1(F) ⊗ K_2(F) → K_3(F), where m is Matsumoto's isomorphism K_2^M(F) ≅ K_2(F).
- **milnorToQuillen3_map** — It is natural in the field for every field homomorphism.
- **milnorToQuillen3_map_id** — The naturality square for the identity of F is the identity.
- **milnorToQuillen3_map_comp** — The naturality squares compose along composites of field homomorphisms.
- **milnorToQuillen3_graded** — It is the degree-three component of the imported graded ring map.

Tests:

- **finite_field_source_zero** (degenerate) — For a finite field the source vanishes, so the map is zero.
- **symbol_of_minus_ones** (computation) — For F = Q the symbol {−1,−1,−1} has nonzero image, of order two.
- **natural_in_F** (compatibility) — For Q inside R the square with the induced maps commutes.
- **not_surjective** (non-example) — For a number field with r_2 > 0 the map is not surjective, since the target has positive rank and the source is torsion.
- **symbol_eq_triple_product** (characterisation) — For units a, b, c of F, milnorToQuillen3 {a,b,c} = [a]·[b]·[c] in K_3(F), with the product taken in this order.

### Inherited: The indecomposable K_3 of a field

`K3BlochGroups:V.2/k3-indecomposable`. Define K_3^ind(F) as the cokernel of the degree-three Milnor-to-Quillen map, together with the quotient map K_3(F) -> K_3^ind(F). The decomposable part is by definition the image of that map; it is a subgroup of K_3(F) isomorphic to K_3^M(F) only once injectivity has been proved, which is a separate theorem.

API:

- **K3ind** — The abelian group K_3^ind(F).
- **K3ind.mk** — The surjection K_3(F) → K_3^ind(F).
- **K3ind.mk_surjective** — K3ind.mk is surjective.
- **K3ind.mk_eq_zero_iff** — A class dies in the quotient exactly when it lies in the image of the degree-three map.
- **K3ind.mk_milnorToQuillen3** — K3ind.mk (milnorToQuillen3 x) = 0 for every x in K_3^M(F).
- **K3ind.lift** — A homomorphism f : K_3(F) → M with f ∘ milnorToQuillen3 = 0 descends to K3ind F → M.
- **K3ind.lift_mk** — K3ind.lift f (K3ind.mk x) = f x.
- **K3ind.ext** — Two homomorphisms out of K_3^ind(F) agree when their composites with the quotient map agree.
- **K3ind.map** — A field homomorphism induces a map of indecomposable quotients, compatibly with the quotient maps.
- **K3ind.map_id** — The map induced by the identity is the identity.
- **K3ind.map_comp** — The map induced by a composite is the composite of the induced maps.
- **K3ind.map_mk** — K3ind.map φ (K3ind.mk x) = K3ind.mk (K_3(φ) x).
- **K3ind.equivQuotient** — K3ind F is isomorphic to the quotient of K_3(F) by the range of milnorToQuillen3, as a Mathlib QuotientAddGroup.
- **K3ind.decomposable** — The decomposable subgroup, defined as the image, with its inclusion.

Tests:

- **finite_field** (degenerate) — For a finite field the quotient map is an isomorphism (K_3^M(F_q) = 0).
- **rational_numbers** (computation) — For Q the quotient is cyclic of order 24 while K_3 is cyclic of order 48.
- **rank_r2** (computation) — For a number field the quotient has free rank r_2.
- **not_torsion_quotient** (non-example) — K_3(Q) modulo its torsion subgroup is 0, but K_3^ind(Q) ≅ Z/24: the indecomposable quotient is not the torsion-free quotient.

### Inherited: Exactness and functoriality of the decomposable-indecomposable sequence

`K3BlochGroups:V.2/decomposable-exactness`. The sequence K_3^M(F) -> K_3(F) -> K_3^ind(F) -> 0 is exact and natural in F. Exactness on the left is not asserted here; it is the content of the injectivity theorem.

### Inherited: Milnor K_3 of a field injects into Quillen K_3

`K3BlochGroups:V.2/milnor-k3-injective`. For every field F the degree-three map K_3^M(F) -> K_3(F) is injective. Consequently the decomposable part is isomorphic to K_3^M(F) and the sequence of the previous lemma is short exact.

### Inherited: Milnor K_3 of a number field is elementary abelian of rank the number of real places

`K3BlochGroups:V.2/milnor-k3-number-field`. For a number field F with r_1 real places, the signature map K_3^M(F) → ⊕_{v real} K_3^M(F_v)_tors ≅ (Z/2)^{r_1}, sending {a,b,c} to −1 at v exactly when a, b and c are all negative at v (K-book III.7.2(c)), is an isomorphism. In particular K_3^M(F) is torsion, is detected at the real places, and vanishes exactly when F is totally imaginary.

### Inherited: The rank of K_3 of a number field is the number of complex places

`K3BlochGroups:V.2/k3-rank-borel`. For a number field F, K_3(F) is finitely generated and its free rank is r_2, the number of complex places. The same holds for the indecomposable quotient, since the kernel of the quotient map is torsion by the previous node.

### Inherited: What rationalisation destroys

`K3BlochGroups:V.2/rationalisation-loss`. For a number field F, the quotient map induces an isomorphism K_3(F) ⊗_Z Q ≅ K_3^ind(F) ⊗_Z Q of rational vector spaces of dimension r_2, and K_3^M(F) ⊗_Z Q = 0.

### Inherited: K_3 of a field onto H_3 of the special linear group

`K3BlochGroups:V.2/k3-to-h3-sl-field`. For a field F, the Hurewicz map K_3(F) → H_3(SL(F), Z) is surjective, and its kernel is the image under milnorToQuillen3 of the subgroup {−1}·K_2^M(F) of K_3^M(F) generated by the symbols {−1, a, b}. Once V.2/milnor-k3-injective is available, the kernel is that subgroup itself.

### Inherited: Low-degree sequence of the motivic spectral sequence of a field

`K3BlochGroups:V.2/motivic-low-degree-sequence`. For a field k, the motivic spectral sequence E_2^{p,q} = H^{p−q}(k, Z(−q)) ⇒ K_{−p−q}(k) yields an exact sequence K_4(k) → H^0(k, Z(2)) → K_3^M(k) → K_3(k) → H^1(k, Z(2)) → 0, in which the middle map is milnorToQuillen3 under the Nesterenko–Suslin–Totaro isomorphism K_3^M(k) ≅ H^3(k, Z(3)), and the map into K_3^M(k) is the differential d_2.

### Inherited: The kernel of the degree-three Milnor-to-Quillen map has exponent two

`K3BlochGroups:V.2/milnor-k3-kernel-exponent-two`. For every field F, twice every element of the kernel of K_3^M(F) → K_3(F) is zero.

### Real-place basis of Milnor K₃

`K3BlochGroups:V.2/real-place-basis`. Let R(F) be the finite subtype of real infinite places and σ_F:K₃ᴹ(F)≃⊕_{v∈R(F)} Z/2 the imported Bass–Tate signature, written additively with 1 for an all-negative triple. Define b_v=σ_F⁻¹(δ_v), where δ_v is 1 at v and 0 elsewhere. This is canonical; choosing a sign-isolating unit is not part of its data.

Proof route: Use the supplier isomorphism, not a fresh presentation of Milnor K-theory. Transport the coordinate generators and their finite expansion through σ_F. Naturality of signatures transports restriction: a basis class at v maps to the sum of basis classes over real places lying above v. If no real place lies above v the sum is zero.

API:

- **realBasis** — b_v=σ_F⁻¹(δ_v).
- **realBasis_signature** — σ_F(b_v)(w) equals 1 if w=v and 0 otherwise.
- **realBasis_nonzero** — b_v≠0 for each real place v.
- **realBasis_two_nsmul** — 2b_v=0.
- **realBasis_expand** — Every x is the sum of b_v over the real places with σ_F(x)(v)=1.
- **realBasis_map** — For an embedding F→L of number fields, restriction sends b_v to the sum over real places w of L restricting to v.

Tests:

- **realBasis_single** (computation) — With the single real coordinate of Q, σ_Q(b)=1.
- **realBasis_empty** (degenerate) — When R(F) is empty every x∈K₃ᴹ(F) equals zero.
- **realBasis_distinct** (non-example) — For two distinct real places v,w, b_v≠b_w. Defining every generator as {−1,−1,−1} fails this test.

Sources: BT1973 Chapter II §2, Theorem (2.1)(3), proof, printed pp.401–402.

### Symbol representatives of the real-place basis

`K3BlochGroups:V.2/real-basis-symbol-representatives`. For each real place v of a number field F, there exists u_v∈F× negative at v and positive at every other real place. For every such u_v, b_v={−1,−1,u_v}. Thus the symbol is independent of the chosen sign-isolating unit.

Proof route: Use weak approximation on a nonempty open sign box, including arbitrary open constraints at the complex places. The chosen element is nonzero because it has negative value at v. Evaluate {−1,−1,u_v} under σ_F: it has exactly the v coordinate equal to 1. Apply injectivity of σ_F. Alternatively Bass–Tate rewrites {u_v,u_v,u_v} as {−1,−1,u_v} using the Milnor repeated-entry identity.

Acceptance: For Q choose u=−1. Changing u without changing its signs does not change the class.

Sources: BT1973 Chapter II §2, Theorem (2.1)(3), proof, printed pp.401–402.

### Surjectivity of the product with −1

`K3BlochGroups:V.2/minus-one-product-surjective`. For a number field F the additive homomorphism p_F:K₂ᴹ(F)→K₃ᴹ(F), x↦{−1}·x, is surjective. Under Matsumoto and the imported graded comparison, the image of K₂(F) --[−1]·→ K₃(F) equals the decomposable subgroup D(F)=im(m₃). This statement is about number fields; no all-fields equality of these two images is asserted.

Proof route: Each b_v has preimage {−1,u_v} under p_F. Finite coordinate expansion therefore proves surjectivity. The natural product square p_F,m₂,m₃ and [−1]· commutes by the graded comparison, with m₂ an isomorphism. Equality of images follows. Combining with the inherited stable Hurewicz kernel identifies that kernel with D(F).

Acceptance: For Q the all-minus-one triple is in the image. For a totally imaginary number field both images are zero. No Quillen K₃ order calculation is used to prove surjectivity.

Sources: BT1973 Chapter II §2, Theorem (2.1)(3), proof, printed pp.401–402.

### Signature of the decomposable subgroup

`K3BlochGroups:V.2/decomposable-signature`. For a number field F, let D(F)=im(m₃)⊆K₃(F), the inherited decomposable subgroup. Integral injectivity gives j:K₃ᴹ(F)≃D(F). Construct s_D:D(F)≃⊕_{v real} Z/2 as σ_F∘j⁻¹. In particular |D(F)|=2^{r₁} and every element of D(F) is killed by 2; do not identify D(F) with all torsion in K₃(F).

Proof route: Use injectivity to corestrict m₃ to an isomorphism onto its actual range. Compose its inverse with the supplier signature isomorphism. Count the finite product and transport exponent two; functoriality is the naturality of m₃ and signatures.

API:

- **decomposableSignature** — The additive equivalence s_D:D(F)≃(R(F)→Z/2).
- **decomposableSignature_apply** — s_D(m₃(x), membership in its range)=σ_F(x).
- **decomposableSignature_symm** — s_D⁻¹(t) has ambient K₃ class m₃(σ_F⁻¹(t)).
- **decomposableSignature_two_nsmul** — 2d=0 for d∈D(F).
- **decomposableSignature_card** — The finite cardinality of D(F) equals 2^{r₁}.
- **decomposableSignature_map** — Restriction of D(F)→D(L) corresponds to pulling back sign functions along R(L)→R(F).

Tests:

- **decomposableSignature_zero** (compatibility) — The signature of m₃(0) is the zero function.
- **decomposableSignature_one_real** (computation) — A class mapping to the unique coordinate 1 is nonzero, so D(Q) is not zero.
- **decomposableSignature_empty** (degenerate) — With an empty real-place type every ambient decomposable class is zero.

Sources: KVI VI.4.3.1–4.3.2, chapter PDF pp.17–18; VI.5 opening, p.23, BT1973 Chapter II §2, Theorem (2.1)(3), proof, printed pp.401–402.

### Indecomposable quotient for totally imaginary number fields

`K3BlochGroups:V.2/totally-imaginary-quotient-equivalence`. If F is a number field with r₁=0, the inherited quotient q_F:K₃(F)→K₃^ind(F) is an additive equivalence e_F. Construct it from q_F and D(F)=0; its inverse is the unique lift of a quotient class. It is natural for embeddings between totally imaginary number fields.

Proof route: The supplier Bass–Tate signature makes K₃ᴹ(F)=0, hence the image subgroup is zero. The quotient map is surjective and has zero kernel, hence bijective. Use uniqueness of the inverse to prove its evaluation, inverse laws and naturality.

API:

- **totallyImaginaryQuotientEquiv** — e_F:K₃(F)≃+K₃^ind(F).
- **totallyImaginaryQuotientEquiv_apply** — e_F(x)=q_F(x).
- **totallyImaginaryQuotientEquiv_symm_apply** — e_F⁻¹(q_F(x))=x.
- **totallyImaginaryQuotientEquiv_map** — For an embedding of totally imaginary number fields, e_L∘K₃(f)=K₃^ind(f)∘e_F.

Tests:

- **totallyImaginaryQuotient_zero** (degenerate) — The equivalence takes zero to the zero quotient class.
- **totallyImaginaryQuotient_representative** (compatibility) — Applying the inverse to the quotient class of x recovers x.
- **totallyImaginaryQuotient_injective** (characterisation) — q_F(x)=q_F(y) iff x=y under D(F)=0.

Sources: BT1973 Chapter II §2, Theorem (2.1)(3), proof, printed pp.401–402, KVI VI.4.3.1–4.3.2, chapter PDF pp.17–18; VI.5 opening, p.23.

### Stable homology and indecomposable K₃ of a number field

`K3BlochGroups:V.2/number-field-stable-hurewicz-equivalence`. For a number field F the inherited stable Hurewicz map h_F:K₃(F)→H₃(SL(F),Z) factors uniquely through an additive equivalence e_h:K₃^ind(F)≃H₃(SL(F),Z). Here SL(F) is the stable special linear group, not SL₂(F). The equivalence is natural under embeddings of number fields.

Proof route: The inherited Hurewicz map is surjective, with kernel im(m₃∘p_F). The product theorem makes that kernel D(F). Apply the baseline quotient equivalence with its evaluation on representatives; naturality follows from surjectivity of q_F.

API:

- **stableHurewiczQuotientEquiv** — e_h:K₃^ind(F)≃+H₃(SL(F),Z).
- **stableHurewiczQuotientEquiv_apply** — e_h(q_F(x))=h_F(x).
- **stableHurewiczQuotientEquiv_symm_apply** — e_h⁻¹(h_F(x))=q_F(x).
- **stableHurewiczQuotientEquiv_unique** — Every additive homomorphism with this evaluation on q_F equals e_h.
- **stableHurewiczQuotientEquiv_map** — e_h commutes with K₃^ind(f) and stable H₃(SL(f),Z).

Tests:

- **stableHurewiczQuotient_zero** (degenerate) — The equivalence sends the zero class to zero.
- **stableHurewiczQuotient_decomposable** (compatibility) — e_h(q_F(m₃(x)))=0 for every Milnor class x.
- **stableHurewiczQuotient_kernel** (characterisation) — h_F(x)=0 iff q_F(x)=0.

Sources: BT1973 Chapter II §2, Theorem (2.1)(3), proof, printed pp.401–402, KVI VI.4.3.1–4.3.2, chapter PDF pp.17–18; VI.5 opening, p.23.

### Vanishing of the integral weight-two mod-two obstruction

`K3BlochGroups:V.2/weight-two-mod-two-obstruction-zero`. For every field F of characteristic different from 2, H⁰(F,Z(2))/2=0. Consequently the integral differential d₂:H⁰(F,Z(2))→K₃ᴹ(F) in the inherited low-degree sequence is zero. This theorem refines the characteristic-not-two branch of the inherited injectivity proof; it does not use that injectivity theorem as an input.

Proof route: The exponent-two kernel bound makes d₂ factor through H(F)=H⁰(F,Z(2))/2. The coefficient exact sequence injects H(F) into H⁰(F,Z/2(2)). The natural motivic-to-étale comparison in degree zero, weight two identifies the latter with H⁰_et(F,μ₂⊗²)=Z/2. The map on these constant groups for F→Fbar is the identity, hence H(F)→H(Fbar) is injective. Over Fbar, Milnor K₃ is uniquely divisible, hence has no 2-torsion. The exponent-two bound first forces d₂=0 there. Exactness then makes K₄(Fbar)→H⁰(Fbar,Z(2)) surjective. Divisibility of K₄ therefore makes H⁰ divisible. Thus H(Fbar)=0 and H(F)=0. Use the corrected characteristic scope of the divisibility supplier: VI.1.6 in characteristic zero; VI.1.3.1(i) in positive characteristic. Do not use rational Chern characters to deduce the integral exponent-two bound.

Acceptance: The argument applies to Q and to fields of odd positive characteristic. Characteristic two instead requires Izhboldin’s no-2-torsion theorem and the inherited kernel bound. The coefficient spectral-sequence differential may still be nonzero.

Sources: KVI VI.4.3.1–4.3.2, chapter PDF pp.17–18; VI.5 opening, p.23, KV V.11.3, V.11.11, Lemma 11.13, chapter PDF pp.81–82,85–87.

### Motivic edge description of indecomposable K₃

`K3BlochGroups:V.2/indecomposable-motivic-edge-equivalence`. For every field F the edge map e_F:K₃(F)→H¹(F,Z(2)) in the inherited low-degree integral sequence induces a natural additive equivalence e_m:K₃^ind(F)≃H¹(F,Z(2)), characterized by e_m(q_F(x))=e_F(x). This is a quotient assertion; it uses right exactness of the sequence and does not need injectivity of m₃.

Proof route: Right exactness identifies ker(e_F)=D(F) and gives surjectivity of the edge map. Apply QuotientAddGroup.liftEquiv; prove uniqueness by surjectivity of q_F. Use naturality of the low-degree sequence to prove the field-map square.

API:

- **motivicEdgeQuotientEquiv** — e_m:K₃^ind(F)≃+H¹(F,Z(2)).
- **motivicEdgeQuotientEquiv_apply** — e_m(q_F(x))=e_F(x).
- **motivicEdgeQuotientEquiv_symm_apply** — e_m⁻¹(e_F(x))=q_F(x).
- **motivicEdgeQuotientEquiv_unique** — Every additive homomorphism with this evaluation on representatives equals e_m.
- **motivicEdgeQuotientEquiv_map** — The equivalence commutes with maps induced by every field homomorphism.

Tests:

- **motivicEdgeQuotient_zero** (degenerate) — The equivalence takes the zero quotient class to zero.
- **motivicEdgeQuotient_symbol** (compatibility) — e_m(q_F(m₃(x)))=0 for every Milnor class x.
- **motivicEdgeQuotient_lift** (characterisation) — The inverse of the edge image e_F(x) is exactly q_F(x).

Sources: KVI VI.4.3.1–4.3.2, chapter PDF pp.17–18; VI.5 opening, p.23.

## Baseline, supplier closure and atlas display

The reviewed AUDIT-29 record marks this layer not built at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Source searches at those commits distinguish higher field K-theory from exact-category/K₀ files and graph-theory K3 names. The pinned Mathlib supplies additive quotients, exactness, torsion subgroups, finite coefficient groups and number-field infinite places. All nine cited baseline statements were read. Five additive names are generated by the source declarations' displayed additive-translation attributes; the packet cites the indexable source declaration and records the generated additive name separately. The suggested file elaborates those exact additive names. No missing higher K-group or motivic group is supplied by a private dummy definition.

The prototypes are general additive-carrier forms with explicit imported hypotheses, so their assertions are mathematically valid before the supplier objects exist. For example the stable comparison takes the supplied Hurewicz map and its proved kernel and surjectivity as hypotheses, then constructs the quotient equivalence; it does not assume the equivalence. The motivic obstruction theorem cannot yet be stated against actual motivic complexes and is recorded as an exact mathematical comment identifying the missing objects. The parent suggested file retains the inherited node forms. Elaboration verifies signatures and API/test agreement, not the placeholder proofs.

The three inherited planets are Indecomposable K₃, Injectivity of Milnor K3, and Borel rank of K3. The continuation adds Real-place basis of Milnor K₃, Product with −1, and Stable Hurewicz quotient. The assembled layer thus has six planets, without counting aliases of supplier results. No layer restructuring is proposed.

The packet contains ten precise supplier requests, including requests addressed to existing theorem nodes when their statements exist but their proofs retain gaps. G-Chern, G-Izhboldin, G-comparison and G-supplier-proofs prevent a closed coverage claim. An assembly must preserve these obligations and the exact import resolutions; it must not replace them with a single vague motivic or arithmetic input. Refinement belongs at the supplier, with a fine node returned to this consumer. Every target of the original V.2 stage is planned, so this completed pass is ready for independent review.

## Inspected sources

- **BT1973**: Hyman Bass and John Tate, [The Milnor ring of a global field](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf). LNM 342 (1973), entire volume scan; only the recorded paper sections were read. Read: Chapter II §§1–2, printed pp.393–402, especially Theorem (2.1)(3) and its complete proof; finiteness input at Corollary (1.2). Accessed 2026-10-05; SHA-256 `cb73e6fc75fe941510b8999176b1c952d0d088b4f599d16d0b9b77ba8de15b55`.
- **KIII**: Charles A. Weibel, [The K-book, chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf). Separately hosted author chapter; checksum fixes the inspected version and chapter-PDF pagination. Read: III.7.1–7.3, chapter PDF pp.61–62; III.7.7–7.8, pp.66–68 including the proof of Izhboldin’s theorem. Accessed 2026-10-05; SHA-256 `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307`.
- **KV**: Charles A. Weibel, [The K-book, chapter V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf). Separately hosted author chapter; checksum fixes the inspected version and chapter-PDF pagination. Read: V.11.3 and its proof, pp.81–82; V.11.11, V.11.13 and proof of V.11.11, pp.85–87. Accessed 2026-10-05; SHA-256 `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8`.
- **KVI**: Charles A. Weibel, [The K-book, chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf). Separately hosted author chapter; checksum fixes the inspected version and chapter-PDF pagination. Read: VI.1.1–1.6, pp.1–5, rigidity, comparison and algebraically closed fields; VI.4.1–4.3.2, pp.15–18, including the integral injectivity proof; VI.5 opening and Lemma 5.3, pp.23–24. Accessed 2026-10-05; SHA-256 `efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1`.
