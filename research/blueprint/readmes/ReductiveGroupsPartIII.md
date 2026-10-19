# Reductive algebraic groups, Part III: arithmetic conjugacy and tori

This continuation builds on Reductive algebraic groups and its Part II. It develops the arithmetic conjugacy and torus-transfer arguments used for Frobenius classes of abelian varieties and Hodge-type Shimura varieties. The group quotient is an affine scheme whose geometric points classify semisimple conjugacy classes; rational points of that quotient and rational elements of the group remain distinct objects throughout. Dense Weil points make comparisons of realization maps rigid, while torus cohomology controls real and finite-place compatibility.

All algebraic groups are affine of finite type. Reductive groups are smooth and geometrically connected; quotient and character results here use characteristic zero. The coordinate conjugation is left conjugation, with the conjugator in the first tensor factor. H¹ means cohomology: its Hodge types are (1,0),(0,1), its l-adic realization is the dual Tate module, and geometric Frobenius has eigenvalues of modulus √q and multiplier q. The scalar cocharacter is the inverse of the Hodge weight.

The existing reductive-group roadmaps supply group/Hopf carriers, representations, tori, root data, Weil restriction and local parahorics. ET.0 owns Galois cohomology, stable/rational conjugacy and the Kottwitz obstruction. ShimuraData owns Mumford–Tate groups, and MotivesAndAlgebraicCycles and AutomorphicBundles supply the tensor/absolute-Hodge inputs. Integral and modular representation theory, coadjoint invariant theory, sigma-dual homomorphisms, general Levi theory, arithmetic gerbs and punctured-disc purity have separate continuation owners. The reader document states all targets, APIs, checks, exact supplier contracts and source locators.

## Conventions and endpoints

Write C(O(G)) for the algebra of regular functions invariant on every algebra of points, Conj(G)=Spec C(O(G)) and χ_G for its quotient morphism. A point of Conj(G)(ℚ) specifies a Galois-invariant geometric semisimple class. It need not specify a rational element of G, and different rational conjugacy classes can have the same quotient point. Conj′ is the additional finite orthogonal outer quotient; its prime does not denote a derivative or the quotient by all outer automorphisms.

The main cohomological endpoint is as follows. For A/E over a number field with a fixed complex embedding, let G=MT(H¹_B(A)) and suppose all l-adic Galois representations factor through G. At a place v|p>2 of good reduction there is one γ_v∈Conj(G)(ℚ) realizing the semisimple geometric Frobenius class at every l≠p. This point admits a real elliptic representative. If G_der is simply connected and G is quasi-split at p, it also has rational representatives matching the prescribed local rational Frobenius classes away from at most one auxiliary prime. The exceptional prime ranges over a positive-density Chebotarev set and the rational representative can change with that prime. The geometric Hodge-type realization and common-class inputs are stated as separate exact contracts below.

Finite-place l-units impose no archimedean boundedness. Weil weights can be negative and can differ among the eigenvalues of a point. Neatness of a semisimple point is the existing representation-independent eigenvalue notion. It is equivalent to connectedness of its diagonalizable cyclic closure; semisimplicity is indispensable in this comparison. For cocharacters use the cocycle n⁻¹c(n), and transport the cocharacter as well as the torus. Quasi-split rational embedding, local transfer and global transfer are three different assertions.

## Existing interfaces

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The regular class-function algebra is an instance of `AlgHom.equalizer`. Tau Ceti's `TauCeti.HopfAlgebra.conjugationAlgHom` has source H and target H⊗H, with first factor the conjugator; `productMap_comp_conjugationAlgHom` evaluates it at g,x as gxg⁻¹. Its `tensorProduct_map_comp_conjugationAlgHom` gives pullback compatibility. Use the existing `TauCeti.reductiveCommHopfAlgProperty` and `TauCeti.HopfAlgebra.IsSemisimplePoint` carriers and predicates. Jordan's finite-group argument rests on `MulAction.sum_card_fixedBy_eq_card_orbits_mul_card_group`.

The underlying reductive-group roadmap supplies representations/comodules in Layer 1, subgroup and quotient theory in Layer 3, tori and Jordan decomposition in Layer 4, and root/normalizer theory in Layer 7. Current ReductiveGroupsPartII RG2.0, RG2.0a and RG2.3 respectively supply local point topology, Weil restriction and parahoric groups. The group quotient here is distinct from the Lie-algebra Chevalley quotient in ET.2b. Current Adelic Algebraic Groups §4.3 supplies neatness; the torus cyclic-closure comparison below uses that definition.

Current Tau Ceti already proves Chevalley’s line-stabilizer theorem as [`TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean#L101). For a Hopf ideal with finitely generated underlying ideal, it produces a line in a finite-dimensional exterior-power comodule whose stabilizer is the quotient subgroup on every commutative value algebra, including nonreduced algebras. Finite type over a field makes the defining ideal finitely generated. Import this theorem through the Layer 1 representation/comodule dictionary; it is not a new target here. This declaration was checked at Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; it postdates the fixed Tau Ceti pin. The suggested file continues to use only the fixed baseline. The current roadmap checkout was checked separately at 0d144d044dacebca17b654695b6f1ad58f159b27.

## Layer RG3.0: Regular class functions and group conjugacy quotients

For commutative Hopf algebras define the equalizer algebra of regular class functions and its conjugation/pullback API. For connected reductive groups in characteristic zero construct the affine conjugacy quotient and prove group Chevalley restriction C(O(G))≅O(T)^W, geometric semisimple-class classification, character separation and finiteness of the quotient map induced by a faithful representation. Import the existing scheme-theoretic line-stabilizer theorem from Tau Ceti, and prove the full character-lattice highest-weight character basis required for restriction. Construct the finite étale orthogonal Out′ action on actual SO factors and Conj′, excluding triality and Spin substitutions.

### Regular class functions

Target `RG3.0/class-functions` (definition).

For a commutative Hopf algebra H over a commutative ring k, define the subalgebra C(H) as the equalizer of the coordinate conjugation map c*:H→H⊗ₖH and the second-factor inclusion h↦1⊗h. For H=O(G), its elements are the regular functions invariant under conjugation on every k-algebra of points. Use the existing convolution point group and Hopf conjugation map.

**Hypotheses and conventions.** H is commutative; the universal definition makes no reductivity or characteristic assumption.

**Construction or proof.**

1. Use AlgHom.equalizer. The first tensor factor of c* is the conjugator, so comparison is with the second-factor inclusion.
2. Evaluate the equality with productMap at arbitrary algebra-valued points. Conversely evaluate at the two universal tensor-factor points.
3. Use naturality of c* to restrict coordinate pullback under a group homomorphism to these subalgebras.

**API.**

- `classFunctionSubalgebra.mem_iff` (characterisation): f∈C(H) iff c*(f)=1⊗f.
- `classFunctionSubalgebra.eval_conj` (compatibility): For every k-algebra A and g,x∈G(A), f(gxg⁻¹)=f(x).
- `classFunctionSubalgebra.algebraMap_mem` (simp): Every scalar is a regular class function; sums and products are closed.
- `classFunctionSubalgebra.pullback` (functoriality): A group morphism G→G′ induces C(O(G′))→C(O(G)); identity and composition agree with coordinate pullback.
- `classFunctionSubalgebra.commutative` (characterisation): For a commutative group scheme G the subalgebra is all O(G).

**Uses.** RG3.0/conjugacy-quotient: Its spectrum is the conjugacy quotient. RG3.1/inner-quotient-descent: Inner automorphisms act identically on this algebra.

**Worked checks.**

- `classFunctionSubalgebra.torus` (computation): For G=G_m, C(O(G))=k[t,t⁻¹], not its scalar subalgebra.
- `classFunctionSubalgebra.trivial` (degenerate): For the trivial group, C(k)=k.
- `classFunctionSubalgebra.gl2_entry` (non-example): Over ℚ the (1,1)-entry on GL₂ is not invariant: diag(2,3) and its coordinate-swap conjugate give 2 and 3.
- `classFunctionSubalgebra.trace` (compatibility): Trace and determinant on GL₂ belong to C(O(GL₂)); this uses conjugation rather than independent left and right translations.

**Check.** Invariance is pointwise equality, stronger than stability of a subring under conjugation.

**Dependencies.** `mathlib:AlgHom.equalizer`, `tauceti:TauCeti.HopfAlgebra.conjugationAlgHom`, `tauceti:TauCeti.HopfAlgebra.productMap_comp_conjugationAlgHom`, `tauceti:TauCeti.HopfAlgebra.tensorProduct_map_comp_conjugationAlgHom`.

**Sources.** [KZ25](#kz25), §5.1.3, p.47: The affine group conjugacy quotient uses the conjugation-invariant coordinate algebra; the equalizer gives its universal coordinate meaning.

### Highest-weight characters and orbit sums

Target `RG3.0/highest-weight-character-basis` (theorem).

For a connected split reductive group G over an algebraically closed characteristic-zero field k, with B⊃T and the associated positive roots, each dominant character λ∈X*(T) is the highest weight of a unique simple rational G-representation V(λ). Its highest weight space has dimension one and all other weights are λ minus a nonzero sum of positive simple roots. Its character is W-invariant. Consequently the irreducible characters form a k-basis of k[X*(T)]^W, by unitriangular comparison with Weyl orbit sums. The full character lattice, including central directions, is retained.

**Hypotheses and conventions.** Use dominant characters in X*(T), not all dominant weights of the simply connected covering group. The lattice/central-isogeny descent condition is part of the statement.

**Construction or proof.**

1. For existence, import Tau Ceti’s current Hopf-ideal line-stabilizer theorem through the requested Layer 1 dictionary and apply it to a parabolic subgroup to obtain positive multiples of fundamental weights. On the big Bruhat cell construct the B-equivariant regular function of a desired dominant weight; a positive power extends globally, and normality of G makes the original function extend.
2. The regular representation is locally finite. Its generated highest-weight module has one-dimensional highest weight and a unique simple quotient. The root subgroup expansion proves all remaining weights lie below the highest weight; the direct-sum highest-vector argument proves uniqueness.
3. Pass from a semisimple group times a torus through the central isogeny: a representation descends precisely when its highest character lies in X*(T). Normalizer representatives permute weight spaces, giving W-invariance.
4. Subtract leading orbit sums, within each central-character coset; the dominance intervals involved are finite. This proves the triangular character basis needed for restriction, without planning modular representations or the Lie-algebra Weyl character formula again.

**Check.** For PGL₂ only even SL₂ highest weights occur. For G_m all integers occur and the character basis is the Laurent monomial basis. Over ℂ for GL_n, SL_n, SO_n and Sp_n, identify this classification with ClassicalGroups Layer 3 by the unique simple highest-weight representation; do not reconstruct its classical carriers or Schur functors. The new theorem is the rational algebraic-group statement for arbitrary connected reductive G, not a second Lie-module classification.

**Dependencies.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-3-maximal-torus-weights-and-the-highest-weight-classification`.

**Sources.** [MilneAG](#milneag), Theorem 22.2, pp.464–465; §§22.11–22.12, p.466; §§22.17–22.27, pp.468–471: Gives and proves the rational group highest-weight classification and central-isogeny descent. [Steinberg65](#steinberg65), Theorem 6.1 and Lemma 6.3, pp.62–63: Uses highest weights and orbit-sum triangularity for the character basis.

### Group Chevalley restriction

Target `RG3.0/torus-weyl-comparison` (theorem).

For a connected reductive G over k of characteristic zero and a maximal k-torus T with Weyl group scheme W=N_G(T)/T, restriction is C(O(G))≅O(T)^W; thus Conj(G)≅T/W as affine schemes. Over an algebraic closure Ω, χ_G gives a bijection between geometric semisimple G(Ω)-conjugacy classes and Conj(G)(Ω).

**Hypotheses and conventions.** The quotient is for group elements, not the Lie algebra adjoint quotient. A maximal k-torus exists; W acts on T by conjugation.

**Construction or proof.**

1. Over an algebraically closed field, every semisimple element lies in a maximal torus, all maximal tori are conjugate, and intersection of a semisimple class with T is one Weyl orbit.
2. Extend Steinberg’s highest-weight triangular argument to the full character lattice of a reductive group: irreducible characters span the Weyl-invariant group algebra, including the central character coordinates. Do not infer polynomiality from the simply connected semisimple case.
3. Restrict to regular semisimple elements for injectivity; descend the restriction isomorphism and the finite Weyl quotient along field extension. Finite-group invariant algebra proves finite generation.

**Check.** For G_m the quotient retains the whole torus. The general reductive quotient need not be affine space.

**Dependencies.** `RG3.0/class-functions`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `RG3.0/highest-weight-character-basis`.

**Sources.** [Steinberg65](#steinberg65), §§6.1–6.6, pp.62–63: Proves the character and restriction statements for semisimple groups; the stated reductive extension uses the same highest-weight argument with central characters. [KZ25](#kz25), §5.1.3, p.47: Uses the maximal-torus quotient and the geometric semisimple-class description.

### The affine conjugacy quotient

Target `RG3.0/conjugacy-quotient` (construction).

For a connected reductive group G over a characteristic-zero field k, construct Conj(G)=Spec C(O(G)) and χ_G:G→Conj(G) from the subalgebra inclusion. It is the categorical quotient for conjugation among affine k-schemes: invariant maps G→Y factor uniquely through χ_G. The coordinate algebra is finitely generated. Formation commutes with extension of fields, and group homomorphisms induce quotient maps.

**Hypotheses and conventions.** G is smooth affine, geometrically connected and reductive; char k=0.

**Construction or proof.**

1. Construct Spec and its map contravariantly from the inclusion. The affine universal property follows from the equalizer.
2. Establish finite generation and field base change using the torus–Weyl comparison below; prove that comparison first on coordinate algebras, without relying on a pre-existing quotient.
3. An invariant morphism is tested as an equality on G×G, not only on k-rational points.

**API.**

- `Conj.chi` (projection): The canonical morphism G→Conj(G) pulls back to the class-function inclusion.
- `Conj.lift` (universal-property): An invariant map to any affine Y factors uniquely, with the expected composition with χ_G.
- `Conj.map` (functoriality): Every group morphism f induces Conj(f), with Conj(f)χ_G=χ_H f and identity/composition laws.
- `Conj.baseChange` (equivalence): For every field extension K/k, Conj(G)_K≅Conj(G_K), compatibly with χ and maps.
- `Conj.semisimplePart` (compatibility): A geometric point and its semisimple Jordan part have the same quotient image.

**Uses.** KZ25, Theorem 6.2.7: A common rational quotient point records geometric Frobenius classes. KMPS22, §2.1.8: A finite orthogonal outer action gives the coarser quotient Conj′.

**Worked checks.**

- `Conj.gm` (computation): Conj(G_m)=G_m and χ is the identity.
- `Conj.gl2` (computation): Conj(GL₂)=Spec k[s,d,d⁻¹], with χ(g)=(tr(g),det(g)); the determinant-zero locus is absent.
- `Conj.unipotent` (non-example): In GL₂ over ℚ, a nonidentity upper unipotent and the identity have the same quotient point, but are not conjugate.
- `Conj.sl2` (compatibility): Conj(SL₂)=A¹ via trace, agreeing with the determinant-one fibre of the GL₂ quotient.

**Check.** The universal property is among affine schemes; no claim that this is the set of rational conjugacy classes.

**Dependencies.** `RG3.0/class-functions`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCeti.reductiveCommHopfAlgProperty`, `RG3.0/torus-weyl-comparison`.

**Sources.** [KZ25](#kz25), §5.1.3, p.47: Defines Conj(G) as an affine quotient, with χ_G and its geometric semisimple-class interpretation. [Steinberg65](#steinberg65), §§6.1–6.4, pp.62–63: Restriction identifies the semisimple-group invariant coordinate algebra with torus Weyl invariants; the reductive extension is an explicit target here.

### Characters separate semisimple classes

Target `RG3.0/character-separation` (theorem).

For semisimple x,y∈G(Ω), where Ω is algebraically closed of characteristic zero, the following are equivalent: x and y are G(Ω)-conjugate; χ_G(x)=χ_G(y); every finite-dimensional algebraic representation has the same trace at x and y; every such representation has the same characteristic polynomial at x and y.

**Hypotheses and conventions.** G is connected reductive; both elements are semisimple.

**Construction or proof.**

1. Use group Chevalley restriction and the highest-weight spanning of invariant regular functions by characters.
2. Characteristic polynomials imply traces; equality of all traces gives equality of quotient points. Conjugacy implies equality of every characteristic polynomial.

**Check.** One faithful representation alone need not separate classes: t↦diag(t,t⁻¹) identifies 2 and 1/2 in G_m.

**Dependencies.** `RG3.0/torus-weyl-comparison`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

**Sources.** [Steinberg65](#steinberg65), Corollary 6.6, p.63: For semisimple groups equates conjugacy with equality of characters and representation classes; the reductive extension is supplied by group restriction. [KZ25](#kz25), Proposition 5.3.5, p.54: Applies all-representation character data to compare Frobenius quotient points.

### Finite faithful representation quotient

Target `RG3.0/faithful-quotient-finite` (theorem).

If ρ:G↪GL(V) is a closed faithful algebraic representation of a connected reductive group over a characteristic-zero field, the induced morphism Conj(G)→Conj(GL(V)) is finite. It is not asserted injective.

**Hypotheses and conventions.** Faithfulness means a closed immersion of algebraic groups, not injectivity on rational points. V is finite-dimensional.

**Construction or proof.**

1. Base change to an algebraic closure and choose a maximal torus T. Its representation weights generate X*(T), since the torus representation is a closed immersion.
2. Every weight value is integral over the characteristic-polynomial coefficients. Its inverse is integral after adjoining the inverse determinant, by the reciprocal characteristic polynomial. Hence O(T) is finite over the image coefficient algebra.
3. The Weyl invariants are a submodule of this finite module over a noetherian coefficient image, hence finite. Descend finiteness to k.

**Check.** For G_m↪GL₂ via t↦diag(t,t⁻¹), the map is finite of generic degree two, illustrating why finite is the required conclusion.

**Dependencies.** `RG3.0/torus-weyl-comparison`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

**Sources.** [KZ25](#kz25), §5.3.2, p.53: Uses the finite map induced by a faithful representation to obtain algebraicity of quotient points.

### Orthogonal outer automorphisms

Target `RG3.0/orthogonal-outer-action` (construction).

For connected reductive H over a characteristic-zero field F, write H_der over F̄ as an almost direct product of its actual almost simple normal factors H_i. Select those isomorphic to SO(2n_i), n_i≥4. The product of O(2n_i)/SO(2n_i) over these factors descends, with the Galois permutation action, to a finite étale group Out′(H). Construct its canonical action on Conj(H), set Conj′(H)=Conj(H)/Out′(H), and define Aut′(H) as its inverse image in Aut(H)→Out(H).

**Hypotheses and conventions.** Select actual SO factors, not every factor with a Dynkin diagram of type D. The order-two orthogonal action in type D₄ does not include triality.

**Construction or proof.**

1. An improper orthogonal conjugation acts on its SO factor, fixes its scalar centre, and hence extends through the almost direct product with the other factors and connected centre.
2. Changing an orthogonal realization changes the action only by inner conjugation, which acts trivially on Conj(H). The factor set and these actions are Galois stable, giving descent.
3. Take the finite affine quotient of the invariant algebra; establish base change and the relationship between Aut′-orbits and Conj′ points.

**API.**

- `OutPrime.factor` (data): Each selected SO factor supplies an order-two orthogonal quotient; Galois acts by permuting the factors.
- `OutPrime.act_conj` (structure): The descended finite étale group acts on Conj(H); every inner automorphism acts trivially.
- `ConjPrime.quotient` (universal-property): Conj→Conj′ is the finite affine categorical quotient, with quotient map and unique invariant factorization.
- `ConjPrime.baseChange` (compatibility): Formation commutes with field extension and is compatible with the geometric orbit relation.
- `AutPrime.mem_iff` (characterisation): An automorphism lies in Aut′ exactly when its outer class belongs to the selected orthogonal subgroup.

**Uses.** KMPS22, Proposition 2.2.13: Only Aut′-conjugacy follows for the common source embeddings. RG3.4/rational-torus-embedding: Absence of type D removes this outer ambiguity in the application.

**Worked checks.**

- `OutPrime.gl` (computation): For GL_n with derived group SL_n there are no selected SO factors, so Out′=1.
- `OutPrime.so8` (computation): For H=SO₈ the quotient has order two, not the full S₃ triality group.
- `OutPrime.spin8` (non-example): For H=Spin₈ there is no actual SO₈ simple normal factor, so this particular Out′ is trivial.
- `ConjPrime.identity` (degenerate): The identity quotient point is fixed by every orthogonal outer action.

**Check.** When the index set is empty Out′ is trivial and Conj′=Conj. Do not replace the definition by all diagram automorphisms.

**Dependencies.** `RG3.0/conjugacy-quotient`, `RG3.0/torus-weyl-comparison`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/inner-twist`.

**Sources.** [KMPS22](#kmps22), §2.1.8, p.24; §2.2.12, p.29: Specifies the actual SO factors, their orthogonal outer quotients and Aut′; refers to Noot §1.5 for the construction.

## Layer RG3.1: Arithmetic descent and quotient injections

Prove Jordan’s finite-subgroup conjugacy criterion and use Chebotarev to descend an algebraic point with a rational realization at almost every local prime. Prove algebraicity over a rational point under a finite affine morphism. Establish inner-twist descent of Conj and geometric quotient injections for the diagonal into a Weil-restriction subgroup and for an antidiagonal central product. Distinguish algebraicity, rational quotient points and rational conjugacy classes.

### Jordan’s conjugacy covering lemma

Target `RG3.1/jordan-subgroup` (theorem).

Let Γ be a finite group and Δ≤Γ. If every element of Γ is conjugate to an element of Δ, then Δ=Γ. Equivalently every proper subgroup misses a conjugacy class.

**Hypotheses and conventions.** No normality of Δ is assumed.

**Construction or proof.**

1. Act transitively on Γ/Δ. A conjugate of g belongs to Δ exactly when g fixes a coset.
2. Burnside’s formula makes the average number of fixed cosets one. If every element fixes a coset and [Γ:Δ]>1, the identity contributes more than one and every other element at least one, contradicting that average.

**Check.** For Γ=S₃ a point stabilizer misses the class of 3-cycles.

**Dependencies.** `mathlib:MulAction.sum_card_fixedBy_eq_card_orbits_mul_card_group`.

**Sources.** [KZ25](#kz25), Proof of Theorem 5.1.4, §5.3.6, p.55: The residue-field descent invokes Jordan’s finite-group lemma.

### Rational descent from local realizations

Target `RG3.1/degree-one-residue-descent` (theorem).

Let X be an affine finite-type ℚ-scheme and a∈X(ℚ̄). If, for all but finitely many rational primes ℓ, the geometric point obtained using a specified embedding ℚ̄↪ℚ̄_ℓ belongs to X(ℚ_ℓ), then a∈X(ℚ). The embeddings may vary with ℓ.

**Hypotheses and conventions.** The point is algebraic and the same ℚ̄-point is compared at every prime.

**Construction or proof.**

1. Let F be the residue field of the image closed point of a. Its realization in ℚ_ℓ gives a degree-one place of F over each allowed ℓ, after removing the finitely many ramified primes.
2. In a Galois closure L/ℚ with Γ=Gal(L/ℚ) and Δ=Gal(L/F), degree-one splitting means Frobenius fixes a coset of Δ, equivalently its class meets Δ.
3. Chebotarev and the finite exceptional set imply every conjugacy class meets Δ. Jordan gives Δ=Γ and F=ℚ.

**Check.** Having a degree-one prime is weaker than complete splitting; the proof does not make that invalid substitution.

**Dependencies.** `RG3.1/jordan-subgroup`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.** [KZ25](#kz25), Proof of Theorem 5.1.4, §5.3.6, p.55: Descends a common algebraic quotient point using degree-one primes, Chebotarev and Jordan.

### Algebraicity above rational invariants

Target `RG3.1/finite-fibre-algebraicity` (theorem).

For a finite morphism f:X→Y of affine finite-type ℚ-schemes, y∈Y(ℚ), and x∈X(ℚ_ℓ) above y, the residue field of x is finite over ℚ. After choosing an embedding of that residue field in ℚ̄ and then into ℚ̄_ℓ compatible with x, x is the realization of an algebraic point. In particular a Frobenius quotient point with rational characteristic polynomial is algebraic.

**Hypotheses and conventions.** Finiteness, rather than mere finite type, is essential.

**Construction or proof.**

1. The fibre has finite-dimensional coordinate algebra over ℚ. A map to ℚ_ℓ factors through a finite field quotient.
2. Apply the faithful quotient finiteness theorem to the rational characteristic-polynomial point. Equality of these algebraic points across primes is a separate input.

**Check.** For A¹→Spec ℚ, an arbitrary ℓ-adic coordinate need not be algebraic over ℚ; finite type is insufficient.

**Dependencies.** `RG3.0/faithful-quotient-finite`, `RG3.0/conjugacy-quotient`.

**Sources.** [KZ25](#kz25), §5.3.2, p.53; §5.3.6, p.55: The finite faithful quotient map first establishes algebraicity, before the common-point rationality argument.

### Conjugacy quotients of inner forms

Target `RG3.1/inner-quotient-descent` (theorem).

An inner twisting ψ:G_ℚ̄≅G′_ℚ̄ induces a ℚ-isomorphism Conj(G)≅Conj(G′). It depends only on the inner-twisting class: changing ψ by an inner automorphism has no effect. The isomorphism carries geometric semisimple classes and commutes with extension of scalars. The same assertion holds over any characteristic-zero field.

**Hypotheses and conventions.** The twist must be inner; a general outer twist can act nontrivially on the quotient.

**Construction or proof.**

1. The discrepancy between σψ and ψ is inner and therefore acts trivially on regular class functions. Apply affine Galois descent to their coordinate algebra map.
2. Identity, inverse and composition laws follow from the corresponding maps before descent and invariance under inner conjugation.

**Check.** This comparison identifies quotient points, not rational representatives or rational conjugacy classes.

**Dependencies.** `RG3.0/class-functions`, `RG3.0/conjugacy-quotient`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/inner-twist`.

**Sources.** [KZ25](#kz25), §6.1.2, p.55; Remark 6.2.8, p.59: An embedding change gives an inner twist and hence a canonical comparison of the conjugacy quotients.

### Diagonal restriction-of-scalars injection

Target `RG3.1/diagonal-quotient-injection` (theorem).

Let F/ℚ be a finite extension, G connected reductive, and H⊂Res_{F/ℚ}G_F a connected reductive ℚ-subgroup containing the diagonal copy of G. The induced map Conj(G)(ℚ̄)→Conj(H)(ℚ̄) is injective and Γ_ℚ-equivariant. In particular this applies to the common-multiplier fibre product H=(Res G_F)×_{Res G_m}G_m for a character ν:G→G_m.

**Hypotheses and conventions.** The inclusion into the Weil restriction is the stated diagonal embedding.

**Construction or proof.**

1. Over ℚ̄ the Weil restriction is a product of copies of G. If two diagonal semisimple points are H-conjugate, any component of a conjugator conjugates the original points in G.
2. Use the geometric quotient description and the fact that all maps are defined over ℚ.

**Check.** The proof asserts injectivity on geometric quotient points; it does not replace it by injectivity on G(ℚ).

**Dependencies.** `RG3.0/torus-weyl-comparison`, `ReductiveGroupsPartII:RG2.0a`.

**Sources.** [KZ25](#kz25), §6.1.6, pp.56–57; Lemma 6.2.6(2), pp.58–59: The common-multiplier auxiliary group embeds in the Weil restriction and preserves geometric conjugacy classes of the diagonal group.

### Central-product quotient injection

Target `RG3.1/central-product-injection` (theorem).

Let H be connected reductive over a characteristic-zero field and T a torus containing Z_H as a closed subgroup. For H₁=(H×T)/{(z,z⁻¹):z∈Z_H}, the embedding h↦[(h,1)] induces an injection Conj(H)(Ω)→Conj(H₁)(Ω) for algebraically closed Ω, equivariant for descent to the base field.

**Hypotheses and conventions.** T is commutative and the two centre embeddings use the displayed inverse.

**Construction or proof.**

1. Lift an H₁(Ω)-conjugator to (h,t) using surjectivity on algebraically closed points of the central quotient.
2. Its conjugation on [(x,1)] is [(hxh⁻¹,1)]. Equality with [(y,1)] forces the antidiagonal central element to have torus coordinate 1, hence to be 1; therefore hxh⁻¹=y.

**Check.** The torus coordinate is indispensable: quotienting H by its centre alone need not preserve distinct semisimple classes.

**Dependencies.** `RG3.0/torus-weyl-comparison`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Sources.** [KZ25](#kz25), Lemma 6.2.6(2), pp.58–59: The commutative torus factor of the central product introduces no new geometric conjugacies.

## Layer RG3.2: Global tori and real cocharacter adjustment

For a rational torus prescribe a real H¹-class while retaining trivial p-component by one auxiliary prime, using the exact torus localization map. Approximate finitely many local maximal-torus conjugacy types by a global torus, including real ellipticity. Construct the real Weyl cocycle n⁻¹c(n) for anisotropic T_sc, and globalize it to adjust a Shimura cocharacter while retaining p-adic torus conjugacy. Pin both the cocycle and the actual transported cocharacter.

### Global torus classes with prescribed real value

Target `RG3.2/auxiliary-torus-class` (theorem).

For every ℚ-torus T and rational prime p, the localization map ker[H¹(ℚ,T)→H¹(ℚ_p,T)]→H¹(ℝ,T) is surjective. More precisely, a prescribed real class can be realized by a global class trivial at p and at every finite place except one auxiliary ℓ≠p, chosen in a positive-density Chebotarev set outside any specified finite set.

**Hypotheses and conventions.** Use ordinary Galois H¹ of a torus and the Tate–Nakayama normalization imported from ET.0.

**Construction or proof.**

1. Choose a finite Galois splitting field and a complex-conjugation element c. At an unramified auxiliary ℓ with Frobenius conjugate to c, local coinvariant torsion maps to the same global coinvariant group as the real localization.
2. Choose its local class to cancel the prescribed real image. The torus local-to-global exact sequence lifts the tuple to H¹(ℚ,T). The p-component was set to zero.
3. Chebotarev supplies infinitely many admissible ℓ and permits avoiding a finite set. If the real cohomology is zero the trivial class suffices.

**Check.** For T=G_m every group H¹ here is zero. For the imaginary quadratic norm-one torus the nontrivial real class requires the auxiliary finite component.

**Dependencies.** `EndoscopicTransferAndUnitaryTraceComparison:ET.0/tate-nakayama-tori`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-duality`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.** [KMPS22](#kmps22), Lemma 1.2.1, pp.13–14: Constructs a global torus class with specified real value and trivial p-component. [Kottwitz86](#kottwitz86), Theorem 2.2, Corollary 2.5 and Proposition 2.6, pp.374–377: Identifies the global obstruction and exactness of the adelic localization sequence needed for the construction.

### Approximation of maximal tori

Target `RG3.2/maximal-torus-approximation` (theorem).

Let G be connected reductive over a number field F, S a finite set of places, and T_v⊂G_{F_v} maximal tori. There exists a maximal F-torus T⊂G such that T_{F_v} is G(F_v)-conjugate to T_v for every v∈S.

**Hypotheses and conventions.** S may include real places and a designated finite place. This is approximation of torus conjugacy types, not weak approximation for G(F).

**Construction or proof.**

1. Choose regular semisimple Lie elements whose connected centralizers are the prescribed tori. Local regular-semisimple conjugacy and the local inverse function theorem make each required centralizer type an open condition in Lie(G)(F_v).
2. Apply weak approximation to the F-vector space Lie(G); its chosen global point is regular semisimple because that condition holds at a place. Its centralizer is a maximal F-torus with the required local conjugacies.

**Check.** Taking S={p,∞} combines a prescribed p-adic torus with an elliptic real one. No approximation of a prescribed element of G(F_v) by G(F) is assumed.

**Dependencies.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ReductiveGroupsPartII:RG2.0`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`.

**Sources.** [KMPS22](#kmps22), Lemma 1.2.2, p.14: States simultaneous approximation of maximal tori, including archimedean places. [Borovoi98](#borovoi98), Lemma 5.6.3, p.37: Restates Harder’s maximal-torus approximation result with finite place set.

### Global tori with elliptic real fibre

Target `RG3.2/elliptic-maximal-torus` (application).

If G/ℚ has an elliptic maximal torus over ℝ and T_p⊂G_ℚp is any maximal torus, there is a maximal ℚ-torus T whose real fibre is elliptic and whose p-fibre is G(ℚ_p)-conjugate to T_p. Here elliptic means anisotropic modulo Z_G.

**Hypotheses and conventions.** Existence of an elliptic real maximal torus is a hypothesis, supplied for the relevant Shimura groups by their Cartan-involution theory.

**Construction or proof.**

1. Apply maximal-torus approximation to {∞,p}. Ellipticity is preserved by real conjugation.
2. For a basic Newton application use the existing BG1 elliptic-torus image theorem; do not define B(G) or basic classes again.

**Check.** For split GL₂ one may prescribe the imaginary quadratic real torus and any chosen quadratic or split torus at p.

**Dependencies.** `RG3.2/maximal-torus-approximation`, `BunGAndNewtonStrata:BG1/elliptic-torus-basic-image`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

**Sources.** [KMPS22](#kmps22), §1.2, pp.13–15, especially Proposition 1.2.5: Uses a global maximal torus with elliptic real fibre and the prescribed local Newton-torus behaviour.

### Real Weyl cocycles

Target `RG3.2/real-weyl-cocycle` (construction).

For G/ℚ reductive, a maximal ℚ-torus T with T_sc=(preimage of T in G_sc) anisotropic over ℝ, and a representative n∈N_{G_sc}(T_sc)(ℂ) of a real Galois-invariant Weyl element w, define a=n⁻¹c(n)∈T_sc(ℂ). It is a real 1-cocycle and its class is independent of n. Complex conjugation acts by −1 on X_*(T_sc), so every Weyl element is real Galois invariant.

**Hypotheses and conventions.** The formula is n⁻¹c(n) throughout; changing to c(n) n⁻¹ requires changing the twisting convention. Representatives are chosen over ℂ; membership in T follows from Galois invariance of w.

**Construction or proof.**

1. Calculate ac(a)=1 and show a∈T_sc because n and c(n) have the same Weyl image.
2. Replacing n by nt changes a by t⁻¹ac(t), hence by a coboundary. Anisotropy of the real torus gives c=−1 on its cocharacter lattice, which commutes with every Weyl element.

**API.**

- `realWeylCocycle.cocycle` (characterisation): ac(a)=1 and a∈T_sc(ℂ).
- `realWeylCocycle.changeRepresentative` (compatibility): n↦nt changes a by the torus coboundary t⁻¹ac(t).
- `realWeylCocycle.one` (simp): For w=1 choose n=1 and obtain the trivial class.
- `realWeylCocycle.image_sc` (compatibility): Its image in H¹(ℝ,G_sc) is trivial, trivialized by n.
- `realWeylCocycle.cocharacter` (relation): Under the corresponding torus twist the transported real cocharacter changes by the specified Weyl action, with conjugation orientation checked from n⁻¹c(n).

**Uses.** RG3.2/global-cocharacter-twist: The class is lifted globally with trivial p-component. KMPS22, Proposition 1.2.5: The twisted torus carries a cocharacter in the required real Shimura conjugacy class.

**Worked checks.**

- `realWeylCocycle.identity` (degenerate): w=1, n=1 gives a=1.
- `realWeylCocycle.su2` (computation): For the compact torus in split SL₂, a complex representative of the nontrivial Weyl element can have a=−1, the nontrivial H¹(ℝ,U(1)) class.
- `realWeylCocycle.coboundary` (compatibility): Changing n by t multiplies the displayed cocycle by exactly t⁻¹c(t) because T is commutative.
- `realWeylCocycle.split` (non-example): A split real torus has c=+1 rather than −1; the anisotropy assertion cannot be inferred merely from being a maximal torus.

**Check.** The cocycle represents the boundary of w for the normalizer extension; it is not generally the trivial torus class.

**Dependencies.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/inner-twist`.

**Sources.** [KMPS22](#kmps22), Proof of Proposition 1.2.5, pp.14–15: Uses the torus cocycle attached to a Weyl representative to alter the real cocharacter without changing the p-local type.

### Global adjustment of real cocharacters

Target `RG3.2/global-cocharacter-twist` (theorem).

Let G/ℚ be connected reductive, T a maximal ℚ-torus with T_sc anisotropic over ℝ, h:S→T_ℝ a real Hodge homomorphism and μ_h its complex Hodge cocharacter. Given μ∈X_*(T_ℚ̄) and w∈W(G,T)(ℂ) with wμ=μ_h, there exist g∈G_sc(ℚ̄), a maximal ℚ-torus T′=gTg⁻¹ and h′ in the G(ℝ)-conjugacy class of h factoring through T′_ℝ, such that μ_{h′}=gμg⁻¹. Moreover T′_ℚp is G_sc(ℚ_p)-conjugate to T_ℚp, and this identification transports μ to μ_{h′} up to T-conjugacy.

**Hypotheses and conventions.** Fix embeddings ℚ̄→ℂ and ℚ̄→ℚ̄_p and use the induced interpretation of μ. Choose n representing w and the cocycle a=n⁻¹ c(n). Its image in H¹(ℝ,G_sc) is trivial because it is a coboundary there.

**Construction or proof.**

1. Lift [a] to H¹(ℚ,T_sc) with zero p-component by the auxiliary-place theorem. Its image in H¹(ℚ,G_sc) is trivial at infinity, hence globally trivial by the simply connected Hasse theorem. Represent it by g⁻¹σ(g); then gTg⁻¹ descends to ℚ.
2. At infinity, write g⁻¹c(g)=t⁻¹n⁻¹c(n)c(t). Then u=gt⁻¹n⁻¹ is real, and Int(g)(μ)=Int(u)(wμ)=Int(u)(μ_h). Set h′=Int(u)h.
3. The zero p-component gives a local trivializer t_p with g t_p⁻¹∈G_sc(ℚ_p). This element conjugates T_ℚp to T′_ℚp and has the same action as g on its cocharacters, since t_p centralizes T.

**Check.** With the identity Weyl element use the trivial cocycle and g=1. Local conjugacy at p is retained, not an equality of chosen embeddings.

**Dependencies.** `RG3.2/auxiliary-torus-class`, `RG3.2/real-weyl-cocycle`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/abelianization-theorems`.

**Sources.** [KMPS22](#kmps22), Proposition 1.2.5, pp.14–15: Adjusts a global maximal torus and its cocharacter using a real Weyl cocycle, while preserving local conjugacy at p.

## Layer RG3.3: Serre tori, Weil points and rigidity

Define the Serre condition on a rational torus, finite-place l-units, l-Weil numbers of arbitrary integral weight and representation-independent Weil points. Compare existing neatness with connected semisimple cyclic closure. Prove the Serre l-unit/Weil criterion, dense neat l-Weil subgroups for tori split at l, and reduced separated finite-orbit rigidity. Include counterexamples detecting archimedean restrictions, noncommuting unit products, missing semisimplicity and missing scheme hypotheses.

### The Serre condition for tori

Target `RG3.3/serre-condition` (definition).

A ℚ-torus T satisfies the Serre condition when its maximal ℝ-split subtorus T_s⊂T_ℝ is the base change of a ℚ-split subtorus of T. Equivalently, for a finite Galois splitting field and a complex conjugation c, the +1 eigenspace of c on X_*(T)⊗ℚ is the Γ_ℚ-fixed subspace. This is descent of the actual maximal real split torus, not merely equality of numerical ranks.

**Hypotheses and conventions.** T is a torus over ℚ; an embedding ℚ̄↪ℂ is fixed.

**Construction or proof.**

1. Use the existing character/cocharacter description of tori. The maximal real split subtorus has the saturated cocharacter lattice in the +1 eigenspace.
2. The eigenspace equality makes the Γ action trivial on that lattice and hence descends it as a split subtorus. The converse follows by descent.
3. The −1 eigenspace is Galois invariant under this condition: c acts as +1 on the trivial summand and −1 on its complement in the semisimple rational Γ-module. This descends the maximal compact real subtorus T_c to ℚ, with T/T_c ℚ-split.

**API.**

- `Torus.serre_iff_cocharacters` (characterisation): The +1 eigenspace for c on rational cocharacters equals the Γ-fixed subspace.
- `Torus.serre_compactSubtorus` (data): The maximal compact real subtorus descends to a ℚ-subtorus T_c and T/T_c is ℚ-split.
- `Torus.serre_product` (structure): Products satisfy the condition iff both factors do; the real split subtorus is the product.
- `Torus.serre_isogeny` (compatibility): The condition is invariant under ℚ-isogeny, since it is determined on rational cocharacter modules.
- `Torus.serre_characterNorm` (relation): For every geometric character χ, χ+cχ is a ℚ-rational character factoring through T/T_c.

**Uses.** RG3.3/serre-unit-criterion: The character norm is rational and has one complex absolute value. RG3.3/weil-point-density: Prime-units become Weil points in the density argument.

**Worked checks.**

- `Torus.serre_split` (computation): G_m and every split torus satisfy the condition, with T_c=1.
- `Torus.serre_imaginary_normone` (computation): The norm-one torus of an imaginary quadratic field satisfies it: T_s=1 and T_c=T.
- `Torus.serre_real_normone` (non-example): The norm-one torus of ℚ(√2)/ℚ is split over ℝ but has no nontrivial ℚ-split subtorus; it fails the condition.
- `Torus.serre_trivial` (degenerate): The rank-zero torus satisfies the condition.

**Check.** A rank comparison without descent data is not a replacement for the condition.

**Dependencies.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Sources.** [KMPS22](#kmps22), §2.2.3 and proof of Lemma 2.2.4, pp.25–26: The Serre condition descends the real split and compact parts so characters have controlled absolute values.

### Prime-units in algebraic groups

Target `RG3.3/prime-unit` (definition).

For a number field F, a linear algebraic group H/F, a rational prime l and γ∈H(F), say γ is an l-unit when for every finite place v of F not dividing l, the cyclic subgroup {γⁿ:n∈ℤ} is bounded in H(F_v). Boundedness is the existing local algebraic-group notion, equivalently relatively compact in the local point topology. No condition is imposed at archimedean places.

**Hypotheses and conventions.** Use all integer powers, not only positive powers. A faithful closed algebraic embedding into GL_n can be used to test boundedness.

**Construction or proof.**

1. Transfer boundedness through closed algebraic embeddings using the local topology supplier.
2. For a semisimple torus point, diagonalize over a splitting field: boundedness of all positive and negative powers is equivalent to valuation zero for every eigencharacter.
3. Show functoriality under group morphisms, conjugacy invariance, and closure under multiplication for commuting points. Do not assert that all l-units of a noncommutative H form a subgroup.

**API.**

- `PrimeUnit.iff_characters` (characterisation): For a torus, γ is an l-unit iff every geometric character value has valuation zero at all finite places away from l.
- `PrimeUnit.map` (functoriality): Algebraic group morphisms preserve prime-units; a closed immersion also reflects them.
- `PrimeUnit.zpow` (simp): All integer powers of a prime-unit are prime-units; 1 is a prime-unit.
- `PrimeUnit.conj` (compatibility): Conjugacy preserves the condition.
- `PrimeUnit.mul_of_commute` (structure): Products and inverses of commuting prime-units are prime-units; in a torus they form a subgroup.

**Uses.** RG3.3/serre-unit-criterion: Converts local valuation conditions to Weil eigenvalues. RG3.3/weil-point-density: The torus subgroup of prime-units is produced by adelic class finiteness.

**Worked checks.**

- `PrimeUnit.rational_scalar` (computation): For H=G_m over ℚ, the l-units are precisely ±lⁿ, n∈ℤ.
- `PrimeUnit.inverse_needed` (non-example): For q≠l, the nonnegative powers of q have bounded images in the additive valued field ℚ_q, but they are not relatively compact in ℚ_q× (their only limit in ℚ_q is 0). The full cyclic subgroup is unbounded as well. Thus boundedness of entries in the ambient affine line is not the group boundedness used for l-units.
- `PrimeUnit.unipotent` (compatibility): For q≠l, the unipotent matrices [[1,1/q],[0,1]] are l-units: their integer powers have uniformly bounded entries at every finite place.
- `PrimeUnit.noncommuting_product` (non-example): For q≠l, a=[[1,1/q],[0,1]] and b=[[1,0],[1/q,1]] are each l-units, while ab has q-adically nonintegral trace 2+1/q² and is not an l-unit.

**Check.** The topology at real places plays no role in this definition.

**Dependencies.** `ReductiveGroupsPartII:RG2.0`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.

**Sources.** [KMPS22](#kmps22), §2.2.3, p.25: Defines the prime-unit condition using bounded cyclic subgroups away from the distinguished prime.

### Prime-Weil numbers

Target `RG3.3/weil-number` (definition).

For a rational prime l and integer w, an l-Weil number of weight w is α∈ℚ̄× such that α is a unit at every finite place away from l and |σ(α)|=l^(w/2) for every embedding σ:ℚ(α)↪ℂ. We allow negative weights and do not require α to be an algebraic integer at l.

**Hypotheses and conventions.** A nonzero algebraic number, the prime l and the integer weight are part of the data.

**Construction or proof.**

1. Express the finite-place condition on the number field ℚ(α); it is invariant under enlarging that field.
2. Absolute values under all embeddings make the condition Galois invariant. Multiplication adds weights and inversion negates weights.

**API.**

- `WeilNumber.weight_unique` (characterisation): If α has weights w and w′ for the same prime l, then w=w′.
- `WeilNumber.galois` (functoriality): Every Galois conjugate has the same weight.
- `WeilNumber.mul` (structure): The product of weights w and w′ has weight w+w′.
- `WeilNumber.inv` (simp): The inverse of a weight-w number has weight −w.
- `WeilNumber.rootOfUnity` (example): Every root of unity is an l-Weil number of weight zero.

**Uses.** RG3.3/weil-point: Eigenvalues in algebraic representations carry this condition. RG3.5/common-frobenius-class: Geometric Frobenius on H¹ has weight one with residue cardinality q, equivalently a p-Weil weight [k_v:ℱ_p].

**Worked checks.**

- `WeilNumber.l` (computation): l has weight 2 and l⁻¹ has weight −2.
- `WeilNumber.rootunity` (degenerate): 1 and −1 have weight 0 for every l.
- `WeilNumber.wrongprime` (non-example): For distinct rational primes q,l, q is not an l-Weil number because it is not a unit at q.
- `WeilNumber.all_embeddings` (non-example): The algebraic unit 2+√3 has conjugate 2−√3 of different absolute value, so it is not a weight-zero Weil number, despite being a unit at every finite place.

**Check.** An l-Weil number has a unique weight for fixed l. Roots of unity have weight zero.

**Dependencies.** `RG3.3/prime-unit`.

**Sources.** [KMPS22](#kmps22), §2.2.1, pp.24–25: Defines l-Weil numbers with prime-unit and all-complex-embedding absolute-value conditions.

### Weil points of algebraic groups

Target `RG3.3/weil-point` (definition).

For a linear algebraic group H/ℚ and rational prime l, γ∈H(ℚ) is an l-Weil point when, in one faithful finite-dimensional algebraic representation, all eigenvalues of γ are l-Weil numbers, allowing different eigenvalues to have different integral weights. A Weil point is an l-Weil point for some l. Eigenvalues are compared in algebraic closures using the algebraic action of the rational point.

**Hypotheses and conventions.** The representation is a closed algebraic immersion. Semisimplicity is not included; neat semisimple points impose it separately.

**Construction or proof.**

1. Every algebraic representation is a subquotient of a finite direct sum of tensor products of the faithful representation and its dual.
2. Tensor products multiply eigenvalues, duals invert them, and subquotients select eigenvalues. Apply the corresponding Weil-number closure rules.
3. This proves independence of the faithful representation and preservation under algebraic group morphisms, even when the point has a unipotent part.

**API.**

- `WeilPoint.iff_all_representations` (characterisation): The one-faithful-representation condition is equivalent to the condition in every algebraic representation.
- `WeilPoint.map` (functoriality): Algebraic group morphisms preserve l-Weil points, with identity/composition laws; closed immersions reflect the property.
- `WeilPoint.zpow` (simp): Every integer power is an l-Weil point; eigenvalue weights are multiplied by the exponent.
- `WeilPoint.conj` (compatibility): Conjugacy preserves l-Weil points.
- `WeilPoint.torus_iff_characters` (characterisation): For a torus, every geometric character value must be an l-Weil number.

**Uses.** KMPS22, Proposition 2.2.2: Neat Weil points have common Conj′ images across realizations. RG3.4/common-source-conjugacy: A dense subgroup of neat Weil points rigidifies a family of embeddings.

**Worked checks.**

- `WeilPoint.mixed_weights` (computation): diag(l,1)∈GL₂(ℚ) is an l-Weil point with eigenvalue weights 2 and 0.
- `WeilPoint.unipotent` (non-example): A nonidentity upper unipotent is a Weil point of eigenvalue weight 0 but is not semisimple; Weil does not imply neat semisimple.
- `WeilPoint.identity` (degenerate): The identity is an l-Weil point for every l, including for the trivial group.
- `WeilPoint.bad_scalar` (non-example): The scalar q∈G_m(ℚ) is not an l-Weil point when q and l are distinct primes.

**Check.** Different weights are permitted; a common weight requires an extra scalar/polarization argument in the geometric application.

**Dependencies.** `RG3.3/weil-number`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, `AdelicAlgebraicGroups:AA.4`.

**Sources.** [KMPS22](#kmps22), §2.2.1, pp.24–25: Defines Weil points and proves representation independence by tensor generation.

### Neatness and cyclic torus closures

Target `RG3.3/cyclic-torus-and-neatness` (comparison).

For a semisimple point γ∈H(F), F a number field with a fixed embedding in ℂ, the Zariski closure S of the cyclic subgroup generated by γ is diagonalizable. It is connected, hence a torus, exactly when the eigenvalues in a faithful F-representation generate a torsion-free subgroup of ℂ×. Thus neatness in the sense of KMPS is semisimplicity together with the existing adelic-groups notion of neatness. For a fixed ℚ-torus split by L, raising every rational point to n=#μ(L) makes its cyclic closure connected.

**Hypotheses and conventions.** The torus assertion requires semisimplicity. F-neatness is not neatness after restriction of scalars to ℚ; compare spectra with the same coefficient embedding.

**Construction or proof.**

1. Embed S in a split diagonal torus after scalar extension. Its character group is the quotient of a free lattice by the characters evaluating to 1 at γ. Torsion in that quotient corresponds exactly to roots of unity in the generated eigenvalue group.
2. For γ∈T(ℚ) and T split by L, all character values belong to L×. Torsion is killed by #μ(L); the cyclic closure of γⁿ is therefore connected.
3. Import the existing representation-independence theorem for neatness; do not introduce a second eigenvalue-neat predicate.

**Check.** 1 is neat; −1 is not. diag(2,4) has connected one-dimensional cyclic closure inside a two-dimensional torus. A nontrivial unipotent has connected closure G_a but not a torus.

**Dependencies.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`, `tauceti:TauCeti.HopfAlgebra.IsSemisimplePoint`, `AdelicAlgebraicGroups:AA.4`.

**Sources.** [KMPS22](#kmps22), §2.1.8, p.24; proof of Lemma 2.2.10, pp.28–29: Uses connected cyclic closure for semisimple neat points and a uniform power to obtain them.

### Weil points from the Serre condition

Target `RG3.3/serre-unit-criterion` (theorem).

For a ℚ-torus T satisfying the Serre condition and a rational prime l, γ∈T(ℚ) is an l-Weil point iff it is an l-unit. Consequently the l-Weil points form a subgroup. The same equivalence holds for semisimple rational points in a connected reductive ℚ-group all of whose maximal tori satisfy the Serre condition.

**Hypotheses and conventions.** No group closure assertion is made for arbitrary noncommuting points of a reductive group.

**Construction or proof.**

1. A Weil point has unit eigencharacters away from l, hence bounded cyclic subgroup at those places.
2. Conversely let T_c be the descended compact subtorus. For any character χ, χ+cχ factors through the split quotient and is rational. Its value at γ is positive and is a rational l-unit, hence l^w for an integer w.
3. The rationality of χ+cχ makes this value the same under every embedding of the character-value field. Thus |σχ(γ)|=l^(w/2) for all σ, proving the Weil condition.

**Check.** The real-quadratic norm-one torus shows the Serre hypothesis matters: 2+√3 is a prime-unit at every finite place but its two real absolute values differ.

**Dependencies.** `RG3.3/serre-condition`, `RG3.3/prime-unit`, `RG3.3/weil-point`.

**Sources.** [KMPS22](#kmps22), Lemma 2.2.4 and proof, pp.25–26: Character norms convert prime-unit conditions into Weil absolute values for Serre tori.

### Density of neat Weil points

Target `RG3.3/weil-point-density` (theorem).

If a ℚ-torus T satisfies the Serre condition and is split over ℚ_l, then T(ℚ) contains a Zariski-dense subgroup consisting of neat l-Weil points. One can take the n-th powers of its l-Weil subgroup, for n=#μ(L) with L a finite Galois splitting field.

**Hypotheses and conventions.** The distinguished prime l splits T; the finite adelic torus class number is imported.

**Construction or proof.**

1. By the unit criterion the l-Weil points form the torus subgroup of l-units. Suppose its Zariski closure is proper; a nonzero character of the quotient over ℚ_l detects a missing torus direction.
2. Choose an l-adic torus point on which that character has nonzero valuation. In the finite adelic class group modulo a compact open subgroup, some power of its idele is represented by a rational point times that compact open.
3. The rational point is a unit away from l and has nonzero detected valuation at l, contradicting triviality of the character on the closure.
4. Taking n-th powers preserves Zariski density because the power map of a torus is an isogeny; the cyclic-closure comparison makes all these points neat.

**Check.** For G_m, {l^(nm):m∈ℤ} is already a dense subgroup of neat l-Weil points. The statement does not say every individual point generates a dense subgroup of T.

**Dependencies.** `RG3.3/serre-unit-criterion`, `RG3.3/cyclic-torus-and-neatness`, `AdelicAlgebraicGroups:AA.3/class-number-finite`.

**Sources.** [KMPS22](#kmps22), Lemma 2.2.10 and proof, pp.28–29: Uses finite adelic class number and a split distinguished prime to prove density, then a uniform power to obtain neat points.

### Rigidity under a finite automorphism group

Target `RG3.3/finite-orbit-rigidity` (theorem).

Let S be a reduced irreducible separated finite-type scheme over k, Γ⊂S(k) a Zariski-dense subset, W≤Aut_k(S) finite, and σ∈Aut_k(S). If for each γ∈Γ there exists w∈W with σ(γ)=w(γ), then σ=w for a single w∈W.

**Hypotheses and conventions.** S is reduced, irreducible, separated and of finite type; Γ is dense in the underlying Zariski space.

**Construction or proof.**

1. For each w, the equalizer of σ and w is closed because S is separated. Their finite union contains Γ, so irreducibility forces one equalizer to have the entire underlying space.
2. The corresponding closed subscheme is all S because S is reduced; hence the morphisms are equal. This applies to algebraic tori.

**Check.** On Spec k[ε]/(ε²) in characteristic zero, ε↦2ε fixes the only rational point but is not the identity. On the affine line with doubled origin, swapping the origins fixes the dense common punctured line.

**Dependencies.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Sources.** [KMPS22](#kmps22), Lemma 2.2.11, p.29: The finite dense-set argument is valid for reduced separated schemes; the hypotheses stated here repair its scheme-level omission.

## Layer RG3.4: Common realization tori and inner-form transfer

From common connected-centralizer embeddings and dense common Conj′ values, prove conjugacy of the embedding maps. Descend their finite geometric torus-embedding orbit, obtain a rational embedding into a quasi-split inner form and transfer it globally under local transfer everywhere and anisotropy at one place. Apply this with explicit compactness modulo the ambient centre at infinity. Target odd unitary Hasse vanishing for arbitrary CM F/F⁺ of odd totally real degree. The F=F⁺E case has the explicit Shin parity proof; the general signed-permutation dual-centre calculation is a precise proof gap.

### Conjugacy of common-source realizations

Target `RG3.4/common-source-conjugacy` (theorem).

Let I,G be connected reductive ℚ-groups, Ω an algebraically closed characteristic-zero overfield with specified embeddings of all coefficient fields, and i_a:I_Ω→G_Ω a family of closed embeddings. Assume there is a central semisimple δ∈I(ℚ) such that i_a identifies I_Ω with Z_G(i_a(δ))°; all i_a(δ) lie in one Aut′(G)(Ω)-orbit. Assume a maximal ℚ-torus T⊂I has a Zariski-dense subset Γ⊂T(ℚ) such that, for each γ∈Γ, all i_a(γ) have the same Conj′(G) point. Then all i_a are conjugate by Aut′(G)(Ω). If Out′(G)=1 they are inner conjugate.

**Hypotheses and conventions.** The common overfield and embeddings are data; unrelated local fields are not silently identified. The centralizer-isomorphism hypotheses are essential, beyond equality of individual characteristic polynomials.

**Construction or proof.**

1. A connected semisimple centralizer has the same rank as G, so the images of T are maximal tori of G as well. Use Aut′ to make the images of δ agree, and conjugate the maximal tori of its connected centralizer to align all i_a(T). This uses only conjugacy of maximal tori in a connected reductive centralizer, not that the centralizer is a Levi subgroup.
2. For two aligned maps their ratio is an automorphism of I₀=Z_G(i_a(δ))°. On the aligned maximal torus, each point of the dense subset differs by an element of the finite automorphism group induced by the Aut′ normalizer.
3. Apply finite-orbit rigidity to obtain one normalizer automorphism agreeing on the torus. It fixes δ and hence preserves I₀. The difference from the original automorphism fixes the torus pointwise, so it is conjugation by an element of that torus.

**Check.** No-type-D is a sufficient condition for Out′=1 in the application, but the theorem uses the exact Out′ rather than all diagram automorphisms.

**Dependencies.** `RG3.0/orthogonal-outer-action`, `RG3.3/finite-orbit-rigidity`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Sources.** [KMPS22](#kmps22), §2.2.12 and Proposition 2.2.13, pp.29–30: The comparison proof is isolated here with its exact centralizer and dense-point inputs; no geometric realization theorem is assumed implicitly.

### Galois invariance from local embedding classes

Target `RG3.4/galois-class-descent` (theorem).

Let Γ_F act continuously on a finite set X and x∈X. If, for almost all finite places v, the orbit Γ_F·x contains a point fixed by a decomposition group at v, then x is Γ_F-fixed. Apply this to the finite orbit of a geometric conjugacy class of embeddings T_ℚ̄→G_ℚ̄, whose representative is defined over a finite extension.

**Hypotheses and conventions.** The orbit is finite; a chosen embedding morphism is of finite presentation and hence defined over a number field. Local existence supplies a fixed point in the same orbit, not necessarily the initially selected point.

**Construction or proof.**

1. Pass to the finite Galois quotient acting on the orbit. Every allowed Frobenius fixes a point, hence its conjugacy class meets the stabilizer of x.
2. Chebotarev and Jordan force that stabilizer to be the whole quotient.

**Check.** This proves invariance of a class. Choosing a rational representative is a distinct quasi-split embedding theorem.

**Dependencies.** `RG3.1/jordan-subgroup`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.** [KMPS22](#kmps22), Proof of Corollary 2.2.14, p.30: Promotes the locally defined common embedding class to a global Galois-invariant geometric class.

### Rational embeddings in quasi-split groups

Target `RG3.4/rational-torus-embedding` (theorem).

Let T be a ℚ-torus and G*/ℚ a quasi-split connected reductive group. Suppose a finite Galois orbit of geometric conjugacy classes of maximal-torus embeddings T_ℚ̄↪G*_ℚ̄ has the following property: at almost every finite place, a decomposition group fixes some class in that orbit. Then that orbit is a singleton and its class has a representative defined over ℚ. In particular, a common geometric maximal-torus embedding class with a local representative at every ℚ_l admits a rational representative. The general quasi-split embedding theorem is imported from ET.0; this target is its arithmetic descent application.

**Hypotheses and conventions.** The embeddings identify T with a maximal torus, not an arbitrary subtorus. The conclusion is the rationality of a maximal-torus embedding, not just of an element in the affine quotient.

**Construction or proof.**

1. Use Galois-class descent for the locally defined common class.
2. Apply the quasi-split maximal-torus embedding theorem, Kottwitz 1982 Corollary 2.2, through the exact ET.0 supplier contract.

**Check.** A rational Conj(G*) point is not itself a rational embedding of a prescribed torus.

**Dependencies.** `RG3.4/galois-class-descent`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/inner-twist`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

**Sources.** [KMPS22](#kmps22), Corollary 2.2.14 and proof, p.30: Invokes Kottwitz 1982, Corollary 2.2, to realize the invariant maximal-torus embedding class in the quasi-split inner form.

### Local-to-global transfer of maximal tori

Target `RG3.4/global-torus-transfer` (theorem).

Let G*/ℚ be quasi-split and ψ:G*_ℚ̄→G_ℚ̄ an inner twist. Let T*⊂G* be a maximal ℚ-torus whose geometric embedding transfers to G over every completion ℚ_v. If its image in G*_ad is anisotropic at at least one place, then the embedding transfers globally: there exists a maximal ℚ-torus T⊂G and a ℚ-isomorphism T*≅T geometrically conjugate to ψ|T*.

**Hypotheses and conventions.** Transfer means an isomorphism of embedded tori induced by an inner twist after geometric conjugation; use ET.0’s definition. The simply connected Hasse theorem is used in its modern form without an E₈ exclusion.

**Construction or proof.**

1. Use the torus-embedding obstruction theorem cited in LR87 Lemma 5.6: the obstruction lies in global Tate cohomology Ĥ⁻¹(Γ,X_*(T*_sc)) modulo the images of the local groups, with its natural localization maps.
2. At a place where T*_ad is anisotropic, the relevant norm-invariant lattice vanishes; the local-to-global map on that Tate cohomology is surjective. Thus the obstruction quotient vanishes.
3. Use the simply connected Hasse principle to pass from the vanishing obstruction to a global inner conjugation of the torus embedding.

**Check.** Local transfer at almost all places is insufficient for this statement: every place is required.

**Dependencies.** `EndoscopicTransferAndUnitaryTraceComparison:ET.0/inner-twist`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/abelianization-theorems`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/tate-nakayama-tori`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Sources.** [LR87](#lr87), Lemma 5.6 and proof, internal p.55: Proves global transfer from local transfer and anisotropy at one place, using Langlands Lemma 7.15 for the obstruction. [KMPS22](#kmps22), Proof of Corollary 2.2.14, p.30: Applies this theorem with ellipticity at the real place.

### Rational tori for common realizations

Target `RG3.4/common-realization-torus` (theorem).

In the common-source situation, suppose all maximal ℚ-tori of I satisfy the Serre condition, δ is a central neat Weil point, and every neat Weil point of I(ℚ) has a rational Conj′(G) image independent of the realization. Assume G_ad has no type-D factor and G_ℚp is quasi-split. The realization embeddings provide local transfer at every finite l≠p. At infinity assume there is a real embedding i_∞:I_ℝ→G_ℝ in their common geometric class, with i_∞(I_ℝ)/(i_∞(I_ℝ)∩Z_G) anisotropic, so its real points are compact. Then every maximal ℚ-torus T⊂I admits a ℚ-embedding into G geometrically conjugate to every i_a|T.

**Hypotheses and conventions.** Retain all centralizer-isomorphism and common-overfield hypotheses of common-source conjugacy. The real compactness modulo the ambient centre ensures the image of every T in G_ad is anisotropic. A compact Cartan alone would not ensure this. At p quasi-splitness supplies local transfer; the stipulated real embedding supplies it at infinity.

**Construction or proof.**

1. Choose a prime l splitting T. Density gives the required dense neat Weil subgroup; common-source conjugacy makes all restricted maps geometrically conjugate.
2. Descend their conjugacy class by Galois-class descent, realize it rationally in the quasi-split inner form, and check local transfer at every place.
3. Apply global torus transfer: the real embedding gives the required anisotropic image at infinity for this T. The resulting rational embedding is geometrically, not necessarily locally rationally, conjugate to the finite realization maps.

**Check.** This conclusion does not assert G(ℚ_l)-conjugacy for every l.

**Dependencies.** `RG3.3/weil-point-density`, `RG3.4/common-source-conjugacy`, `RG3.4/rational-torus-embedding`, `RG3.4/global-torus-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/inner-twist`.

**Sources.** [KMPS22](#kmps22), Corollary 2.2.14, p.30; Proposition 2.2.2, pp.25–28: Separates the reductive descent argument from the preceding geometric theorem for isogeny-group realizations.

### Odd unitary similitude Hasse principle

Target `RG3.4/odd-unitary-hasse` (theorem).

Let F/F⁺ be any CM quadratic extension, with F⁺ totally real of odd degree over ℚ. Let G be the unitary similitude ℚ-group of an odd-dimensional hermitian F-space with one common rational multiplier. Then ker¹(ℚ,G)=1. Use this to remove the residual Hasse obstruction for the locally trivial correction torsor in special-point lifting. Independently, the real-and-abelianized triviality criterion is the existing ET.0 cartesian H¹ theorem.

**Hypotheses and conventions.** The target allows arbitrary CM F/F⁺; no imaginary quadratic subfield is assumed. Derived G is simply connected. The Hasse assertion concerns torsors trivial at every completion.

**Construction or proof.**

1. For the special case F=F⁺E, with E/ℚ imaginary quadratic, use the common-multiplier dual-centre calculation in Shin §3.1. When n and d are odd, the parity relation λ²g^(nd)=1 is exhausted by the centre coboundaries, so the relevant obstruction vanishes.
2. For arbitrary CM F/F⁺, compute the signed-permutation Galois action on the dual centre and prove that its locally trivial cohomology kernel vanishes. This is the additional group-specific proof obligation; the F=F⁺E calculation by itself does not imply it.
3. ET.0 duality identifies the resulting dual obstruction with ker¹(ℚ,G). Use ET.0 abelianization for the separately needed real-and-abelianized torsor criterion.

**Check.** Odd dimension and odd totally real degree both enter the parity calculation; they are not dropped. The arbitrary-CM signed-permutation centre calculation must be supplied; neither an imaginary quadratic subfield nor its simpler action may be silently imposed.

**Dependencies.** `EndoscopicTransferAndUnitaryTraceComparison:ET.0/unitary-elliptic-endoscopic-data`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/abelianization-theorems`.

**Sources.** [Shin11](#shin11), §3.1, Lemma 3.1 and Remark 3.2, pp.12–14: Proves the dual-centre calculation in the special case F=F⁺E with E imaginary quadratic, odd d and an odd block; it does not by itself establish the arbitrary-CM assertion. [KMPS22](#kmps22), Remark 2.3.16, p.36: States the odd-dimensional unitary Hasse assertion for arbitrary CM F/F⁺ of odd totally real degree, and cites Shin’s proof. The extension of that proof is the recorded gap.

## Layer RG3.5: Mumford–Tate Frobenius classes and rational representatives

Use the existing Mumford–Tate group of H¹, Betti–étale comparison and absolute Hodge tensors to compare complex embeddings and obtain simultaneous l-adic factorization after one finite extension. State the residue-field-preserving auxiliary Hodge-type realization and geometric common-class inputs precisely. Deduce the unique rational Conj(G) Frobenius class for p>2 good reduction. Prove the real semisimple lifting theorem by positive scalar normalization in an elliptic torus, then obtain a real elliptic representative. With simply connected derived group and quasi-splitness at p, cancel the relative Kottwitz obstruction at one auxiliary prime to obtain rational representatives matching local Frobenius classes elsewhere.

### Cohomological Mumford–Tate conventions

Target `RG3.5/hodge-convention-bridge` (theorem).

For an abelian variety A/E, E⊂ℂ a number field, put V_B=H¹_B(A(ℂ),ℚ). Its pure Hodge types are (1,0),(0,1), and V_B⊗ℚ_l≅H¹_et(A_Ē,ℚ_l)≅(T_lA⊗ℚ_l)∨. Let G=MT(V_B) be the whole-Deligne-torus Mumford–Tate group imported from ShimuraData. The smallest ℚ-subgroup containing the complex Hodge cocharacter is the same G: its rationality forces it to contain the conjugate cocharacter and hence the full S-map. A polarization embeds G in GSp(V_B). The inverse Hodge weight is the scalar cocharacter w_s(z)=z·id and ν∘w_s(z)=z².

**Hypotheses and conventions.** The standard Hodge action is h(z) acting as z⁻ᵖ z̄⁻ᑫ on V^{p,q}; thus the Hodge weight acts by z⁻¹ on H¹, and w_s is its inverse. Geometric Frobenius on this cohomological realization has eigenvalues of absolute value √q and multiplier q.

**Construction or proof.**

1. Use the existing Betti/Hodge dictionary, the dual Tate-module comparison and polarizability. Import MT, connectedness and reductivity, without redefining them.
2. A subgroup over ℚ containing μ contains its complex conjugate; together the two cocharacters recover h_C. This proves equality of the two minimum-group conventions.
3. Use the alternating polarization with its Tate twist to obtain ν, and evaluate it on scalar matrices to fix νw_s=z². The Hodge Cartan involution supplies an elliptic maximal real torus and compact centre modulo the scalar weight.

**Check.** The negative types (−1,0),(0,−1) belong to homology, not the H¹ used here.

**Dependencies.** `ShimuraData:D1/mumford-tate-group`, `ShimuraData:D1/mumford-tate-connected`, `ShimuraData:D1/mumford-tate-reductive`, `AbelianSchemesAndArithmeticModuli:A4/all-degree-exterior-cohomology`, `AbelianSchemesAndArithmeticModuli:A5/analytic-families-and-comparison`, `AbelianSchemesAndArithmeticModuli:A4`, `ShimuraData:D1`.

**Sources.** [KZ25](#kz25), §§6.1.1–6.1.3, p.55; Lemma 6.3.3, p.60: Supplies the Mumford–Tate setting; the cohomological Hodge signs are corrected explicitly. [Deligne82](#deligne82), §§3.4–3.6, pp.24–25: Tensor and polarization descriptions of the Mumford–Tate group; the added Tate multiplier convention must be compared with the subgroup of GL(H¹).

### Absolute-Hodge comparison torsor

Target `RG3.5/absolute-hodge-isomorphism-torsor` (construction).

For embeddings τ,τ′:E↪ℂ of a number field and an abelian variety A/E, transport the neutral tensor category generated by H¹ and its absolute Hodge tensors from A^τ to A^{τ′}. The scheme P of tensor isomorphisms between the two Betti fibre functors is a torsor under G=MT(A^τ). The comparison identifies MT(A^{τ′}) with the inner form obtained by twisting G by P. Therefore it canonically identifies the two rational conjugacy quotients, independently of a geometric point chosen on P.

**Hypotheses and conventions.** All Hodge tensors on these abelian varieties are absolute Hodge, imported from AutomorphicBundles. Include duals and Tate twists with the cohomological convention; a torsor point is not declared rational. Fix the transport of the absolute-Hodge tensor category between the two complex embeddings; the quotient identification is independent of the tensor-isomorphism torsor point, relative to that transport.

**Construction or proof.**

1. Use absolute-Hodge transport to build the second fibre functor on the same tensor category. Apply the existing neutral Tannakian tensor-isomorphism torsor theorem.
2. The two automorphism groups act simply transitively on P, giving the twisting comparison. Changes of a geometric tensor isomorphism are inner, so the conjugacy-quotient comparison is canonical.
3. Use finite tensor generation to identify the Tannakian automorphism group with the imported MT subgroup, with the Tate multiplier realized as its polarization character.

**API.**

- `AbsoluteHodgeComparison.isomFunctor` (data): P(R) consists of R-linear tensor isomorphisms between the transported Betti fibre functors.
- `AbsoluteHodgeComparison.torsor` (structure): P is faithfully flat over ℚ and is a G-torsor; it has a point after scalar extension to an algebraic closure.
- `AbsoluteHodgeComparison.twist` (compatibility): The automorphism group of the second functor is the twist of G by P.
- `AbsoluteHodgeComparison.conjEquiv` (equivalence): There is a canonical rational isomorphism of the conjugacy quotients, independent of a trivialization of P.
- `AbsoluteHodgeComparison.compose` (functoriality): Transport through three embeddings composes the quotient isomorphisms; the identity embedding gives the identity.

**Uses.** RG3.5/common-frobenius-class: Embedding changes do not alter the common quotient class under its canonical identification. KZ25, Remark 6.2.8: Explains the embedding-independence of the Frobenius assertion.

**Worked checks.**

- `AbsoluteHodgeComparison.same_embedding` (degenerate): For τ=τ′, the identity tensor isomorphism is a rational point and the quotient comparison is the identity.
- `AbsoluteHodgeComparison.change_trivialization` (compatibility): Replacing a geometric isomorphism p by pg changes the group comparison by Int(g) and leaves every quotient point unchanged.
- `AbsoluteHodgeComparison.triple` (compatibility): For τ₁,τ₂,τ₃ the composite Conj(G₁)→Conj(G₂)→Conj(G₃) equals the direct comparison.
- `AbsoluteHodgeComparison.no_rational_section` (non-example): The torsor statement supplies no rational section for an arbitrary pair of embeddings; a rational group isomorphism is not part of the API.

**Check.** An inner isomorphism exists geometrically; canonicality is asserted only after passing to Conj.

**Dependencies.** `RG3.5/hodge-convention-bridge`, `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `AutomorphicBundles:B1/absolute-hodge-propagation`, `AutomorphicBundles:B1/finite-tensor-stabilizer`, `RG3.1/inner-quotient-descent`.

**Sources.** [KZ25](#kz25), §6.1.2, p.55; Remark 6.2.8, p.59: Changing the complex embedding gives an inner form via the tensor-isomorphism torsor. [Deligne82](#deligne82), Proof of Theorem 3.8, pp.26–27: Constructs and uses the comparison torsor of tensor-preserving isomorphisms for abelian Hodge structures.

### Simultaneous Galois factorization

Target `RG3.5/simultaneous-mt-factorization` (theorem).

For A/E with fixed complex embedding and G=MT(H¹_B(A)), the following condition on E is independent of l: the entire Galois representation ρ_l:Γ_E→GL(H¹_et(A_Ē,ℚ_l)) factors through G(ℚ_l) under Betti–étale comparison. There exists a single finite extension E′/E for which this condition holds for all primes l. Equality of the Galois image closure with G is not asserted.

**Hypotheses and conventions.** Use tensor stabilizers and absolute Hodge realizations, not the Mumford–Tate conjecture.

**Construction or proof.**

1. Choose finitely many rational Hodge tensors whose simultaneous scheme-theoretic stabilizer is G. Their absolute-Hodge realizations have algebraic de Rham components, hence are all defined over one finite extension E′.
2. For σ∈Γ_E, its transform of an absolute Hodge tensor is another such tensor. Equality of their realizations at one l implies equality of the rational tensor, by the comparison isomorphism and faithful scalar extension, and hence equality at every l.
3. Thus fixing the finite family at one prime is equivalent to fixing it at every prime. Over E′ every tensor is fixed, giving simultaneous factorization.

**Check.** The fixed-field condition concerns all Γ_E, not just its connected algebraic monodromy group.

**Dependencies.** `RG3.5/hodge-convention-bridge`, `AutomorphicBundles:B1/finite-tensor-stabilizer`, `AutomorphicBundles:B1/absolute-hodge-propagation`, `AbelianSchemesAndArithmeticModuli:A4`.

**Sources.** [KZ25](#kz25), §6.1.3 and Lemma 6.1.4, pp.55–56: The tensor argument gives l-independent factorization and a common finite extension. [Deligne82](#deligne82), Theorem 2.11, p.19; proof of Theorem 3.8, pp.26–27: Absolute Hodge tensors and their coherent comparison realizations support the finite tensor descent.

### Auxiliary groups for good-reduction descent

Target `RG3.5/auxiliary-hodge-embedding` (application).

Let A/E have good reduction at v|p>2 and all ρ_l factor through G=MT(H¹_B(A)). Construct a totally real F and the common-multiplier H⊂Res_{F/ℚ}G_F, followed by H₁=(H×T)/Z_H, so that the associated Hodge-type datum has a very special parahoric at p, connected-centre compatibility in the sense required by Kisin–Zhou, and a good-reduction point with the same residue field as v. The induced Conj(G)(ℚ̄)→Conj(H₁)(ℚ̄) is injective and Galois equivariant.

**Hypotheses and conventions.** The statement uses the exact strongly acceptable Hodge-type triple of Kisin–Zhou §5.1; it does not assert that every Hodge-type integral model has those properties. The finite field extension used to choose levels must preserve the residue field at v.

**Construction or proof.**

1. Use the p-adic compact image to choose a finite splitting extension over which the chosen Frobenius lift lies in a special parahoric; realize that local extension at all places above p of a totally real F.
2. Form the common-multiplier fibre product and its Serre-tensor abelian variety. Choose the centralizer torus and central product so its compact central quotient is induced at p. Use the strongly acceptable Hodge embedding and integral-model specialization contract with the same residue field.
3. Use the diagonal and central-product injection theorems for the quotient comparison, independently of the geometric input.

**Check.** The auxiliary extension does not replace q by q^m: residue-field preservation is necessary to compare the original Frobenius.

**Dependencies.** `RG3.1/diagonal-quotient-injection`, `RG3.1/central-product-injection`, `RG3.2/maximal-torus-approximation`, `RG3.5/simultaneous-mt-factorization`, `ReductiveGroupsPartII:RG2.0a`, `ReductiveGroupsPartII:RG2.3`.

**Sources.** [KZ25](#kz25), §6.1.6, pp.56–57; Proposition 6.2.4, pp.57–58; §6.2.5 and Lemma 6.2.6, p.58: Constructs the auxiliary common-multiplier and central-product groups and the Hodge-type very-special-parahoric reduction.

### Common rational Frobenius class

Target `RG3.5/common-frobenius-class` (theorem).

Let A/E, G and the fixed complex embedding be as above, assume every ρ_l factors through G(ℚ_l), and let v|p>2 be a place of good reduction with residue field ℱ_q. There is a unique γ_v∈Conj(G)(ℚ) whose realization in Conj(G)(ℚ_l) is χ_G(ρ_l(Fr_v)) for every l≠p, where Fr_v is geometric Frobenius. These elements are semisimple. The class is compatible with changing the complex embedding through the absolute-Hodge quotient isomorphism.

**Hypotheses and conventions.** This is a rational point of the affine quotient, not yet a rational element of G. Use the geometric companion-and-specialization theorem in Kisin–Zhou Theorem 5.1.4, with strongly acceptable Hodge-type triple and good-reduction point.

**Construction or proof.**

1. Apply auxiliary Hodge embedding and the geometric common-class theorem to H₁ at the good-reduction point.
2. The common H₁ class lies in the geometric image of Conj(G) because one realization comes from G; the injective Galois-equivariant quotient map gives a unique Galois-fixed preimage, hence a rational Conj(G) point.
3. The geometric theorem itself uses all-representation character comparison to get one common algebraic class, faithful finite-quotient algebraicity, and local-realization descent. Import only that theorem’s precise input, not an unsupported general compatible-system assertion.
4. Semisimplicity follows from abelian Frobenius semisimplicity. The absolute-Hodge torsor comparison gives embedding compatibility.

**Check.** The characteristic polynomial is monic integral of degree 2 dim A with all complex roots of modulus √q; this alone does not separate classes in G.

**Dependencies.** `RG3.5/auxiliary-hodge-embedding`, `RG3.1/finite-fibre-algebraicity`, `RG3.0/character-separation`, `RG3.1/degree-one-residue-descent`, `RG3.5/absolute-hodge-isomorphism-torsor`, `AbelianSchemesAndArithmeticModuli:A6/frobenius-semisimplicity`, `AbelianSchemesAndArithmeticModuliPartII:F0/frobenius-polynomial`.

**Sources.** [KZ25](#kz25), Theorem 6.2.7 and Remark 6.2.8, p.59; Theorem 5.1.4, pp.47–48: The auxiliary group reduces the abelian-variety result to the geometric Frobenius theorem, and quotient injection descends it.

### Real representatives in an elliptic torus

Target `RG3.5/compact-weight-reality` (theorem).

Let G/ℝ be connected reductive, w_s:G_m→Z_G a scalar cocharacter, ν:G→G_m with νw_s(z)=z², and ρ:G↪GL(V) faithful with ρw_s(z)=z·id. Let T⊂G be a maximal real torus with T/w_s(G_m) anisotropic. If a∈Conj(G)(ℂ) has ν(a)=r² for r>0 and every eigenvalue of ρ at its semisimple class has modulus r, then a has a representative t∈T(ℝ).

**Hypotheses and conventions.** The condition is on a semisimple representative; an arbitrary nonsemisimple lift is not used. The quotient torus is anisotropic over ℝ, a stronger pinned weight condition than a bare compact-form assertion.

**Construction or proof.**

1. Choose a semisimple lift in T(ℂ), and divide by w_s(r). All its faithful weights now have modulus one and ν=1. Since the weights generate X*(T), every character value has modulus one.
2. For a character χ write χw_s(z)=z^m. Complex conjugation c acts by −1 modulo the scalar direction, so χ+cχ=mν: both sides agree on w_s, and their difference is a real-invariant character of an anisotropic torus, hence zero.
3. For the normalized point t₀, χ(c(t₀))=overline((cχ)(t₀))=overline(ν(t₀)^m/χ(t₀))=χ(t₀). Thus t₀ is real. Multiply back by the specified w_s(r), retaining exactly the original conjugacy quotient point.

**Check.** For G_m, ν=t² and w_s=id, the normalized lift is ±1; restoring r gives ±r, not an arbitrary lift of the trivial central quotient.

**Dependencies.** `RG3.0/torus-weyl-comparison`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Sources.** [KZ25](#kz25), Lemma 6.3.3 and proof, p.60: The intended real elliptic lifting is proved here by a character calculation that supplies semisimplicity and preserves the scalar lift.

### Real elliptic Frobenius representative

Target `RG3.5/real-elliptic-frobenius` (theorem).

The common rational Frobenius class γ_v for A/E has a representative in G(ℝ) contained in an elliptic maximal real torus. Use V_B=H¹ and geometric Frobenius, so ν(γ_v)=q and all eigenvalues have modulus √q.

**Hypotheses and conventions.** The Mumford–Tate Hodge/polarization structure supplies an elliptic maximal T with T/w_s(G_m) anisotropic.

**Construction or proof.**

1. Import the Hodge Cartan theorem to choose such a torus. The centre modulo the scalar weight is anisotropic for a polarizable pure H¹ structure.
2. Apply the weight-normalization theorem with r=√q. The representative belongs to the chosen elliptic torus and has quotient point γ_v exactly.

**Check.** Elliptic means contained in a maximal torus anisotropic modulo Z_G, not that the entire connected centralizer modulo Z_G is compact.

**Dependencies.** `RG3.5/hodge-convention-bridge`, `RG3.5/common-frobenius-class`, `RG3.5/compact-weight-reality`, `ShimuraData:D1`.

**Sources.** [KZ25](#kz25), Lemma 6.3.3, p.60: States real elliptic lifting; the preceding target repairs the two missing choices in the printed proof.

### Rational representatives with one auxiliary place

Target `RG3.5/one-prime-patching` (theorem).

Let G/ℚ be connected reductive with simply connected derived group, quasi-split over ℚ_p. Let a∈Conj(G)(ℚ) be a semisimple class with an elliptic representative at infinity and specified semisimple representatives γ_l∈G(ℚ_l) for every l≠p, forming an adelic tuple after choosing a p-component. Then one can choose γ₀∈G(ℚ), elliptic at infinity, which is G(ℚ_l)-conjugate to γ_l for all l≠p except at most one auxiliary prime l₀. The allowable l₀ contain a positive-density Chebotarev set outside any fixed finite set; γ₀ may depend on l₀.

**Hypotheses and conventions.** The class is rational and has local representatives at all l≠p; quasi-splitness and the simply connected derived group provide a p-representative and a rational representative in the quasi-split inner form. An adelic representative tuple and its unramified behaviour are part of the input; arbitrary unrestricted local choices are not automatically adelic.

**Construction or proof.**

1. Choose a rational representative in the quasi-split inner form using ET.0’s semisimple rationality theorem. Form the relative Kottwitz obstruction for the transported adelic tuple, including the chosen real elliptic class.
2. The real elliptic condition makes the relevant global obstruction group inject into the local obstruction group at an auxiliary prime whose finite Galois action is conjugate to complex conjugation. Chebotarev supplies a positive-density set of such primes.
3. Duality makes the local modification map surjective onto the global obstruction. Change only the auxiliary local rational class to cancel it, using the local invariant parameterization and simply connected local H¹ vanishing.
4. Apply the relative form of Kottwitz’s global rationality theorem. The resulting rational representative has all the prescribed classes elsewhere, including the selected real elliptic class.

**Check.** The prime may be chosen from the argument’s positive-density set, not from every externally prescribed positive-density set.

**Dependencies.** `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/global-kottwitz-obstruction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/abelianization-theorems`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.** [Kottwitz90](#kottwitz90), §7, especially p.188 (context pp.186–189): Cancels the global obstruction by modifying one auxiliary local class selected by Chebotarev. [Kottwitz86](#kottwitz86), Theorem 6.6 and §§6.7–6.8, pp.382–384: The relative-inner-form obstruction criterion produces a global rational element after cancellation. [KZ25](#kz25), Corollary 6.3.4 and Remark 6.3.5(3), pp.60–61: Applies the argument and notes the positive-density choice of exceptional prime.

### Rational Frobenius representative

Target `RG3.5/rational-frobenius-representative` (theorem).

In the common Frobenius theorem, assume in addition that G_der is simply connected and G_ℚp is quasi-split. Then γ_v lifts to γ₀∈G(ℚ), elliptic over ℝ, such that γ₀ and ρ_l(Fr_v) are G(ℚ_l)-conjugate for all but at most one prime l≠p. The exceptional prime can be chosen from a positive-density Chebotarev set, and changing it may change γ₀.

**Hypotheses and conventions.** Retain p>2 and good reduction; no l=p crystalline assertion is included. The simply connected and quasi-split hypotheses are not removed.

**Construction or proof.**

1. The common rational quotient class and real elliptic representative provide the global patching inputs.
2. The compatible cohomological realizations supply the adelic local tuple, with integral unramified behaviour outside finitely many primes through the geometric auxiliary construction. Apply one-prime patching.

**Check.** Geometric conjugacy at all l≠p is stronger than characteristic-polynomial agreement, while rational conjugacy at almost all such primes is a separate refinement.

**Dependencies.** `RG3.5/common-frobenius-class`, `RG3.5/real-elliptic-frobenius`, `RG3.5/one-prime-patching`.

**Sources.** [KZ25](#kz25), Corollary 6.3.4 and Remark 6.3.5(1)–(3), pp.60–61: The rational representative conclusion has one possible exceptional prime and the stated extra group hypotheses.

## Exact imported contracts

The following statements specify the additional interfaces used from the named owners. They fix the mathematical dependency of each layer; an import of a broader subject name alone does not replace them.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules

The rational-representation/comodule dictionary, local finiteness of the regular representation and tensor generation from a closed faithful finite-dimensional representation, including duals and subquotients. No second construction is planned here. For the highest-weight existence argument, expose the current Hopf-ideal line-stabilizer theorem through this dictionary: finite type gives a noetherian coordinate algebra and hence a finitely generated defining ideal. Import the existing exterior-power theorem; no line-stabilizer proof is requested.

Consumers: `RG3.0/torus-weyl-comparison`, `RG3.0/character-separation`, `RG3.0/faithful-quotient-finite`, `RG3.3/prime-unit`, `RG3.3/weil-point`, `RG3.0/highest-weight-character-basis`.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components

Affine scheme/Hopf duality, scheme-theoretic closed subgroups and central quotients, normality of smooth connected groups, finite affine group quotients, and faithfully flat descent of affine algebra maps. The equalizer construction uses universal algebra-valued points.

Consumers: `RG3.0/conjugacy-quotient`, `RG3.0/orthogonal-outer-action`, `RG3.1/central-product-injection`, `RG3.3/finite-orbit-rigidity`.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori

The torus/character-lattice equivalence, diagonalizable cyclic closures, semisimple Jordan parts and compatibility with algebraic representations; base change and central isogenies use the existing carriers.

Consumers: `RG3.0/torus-weyl-comparison`, `RG3.2/real-weyl-cocycle`, `RG3.3/serre-condition`, `RG3.3/prime-unit`, `RG3.3/cyclic-torus-and-neatness`, `RG3.5/compact-weight-reality`, `RG3.0/highest-weight-character-basis`.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Root data and Weyl groups of reductive groups; conjugacy of maximal tori in every connected reductive group, including connected semisimple centralizers; regular semisimple Lie centralizers; and the characteristic-zero fact that an automorphism fixing a maximal torus pointwise is inner by an element of that torus. Supply the last fact by scaling root subgroups and torus-to-adjoint-torus surjectivity over an algebraic closure.

Consumers: `RG3.0/torus-weyl-comparison`, `RG3.0/orthogonal-outer-action`, `RG3.2/maximal-torus-approximation`, `RG3.2/real-weyl-cocycle`, `RG3.3/serre-condition`, `RG3.4/common-source-conjugacy`, `RG3.4/global-torus-transfer`, `RG3.5/compact-weight-reality`, `RG3.0/highest-weight-character-basis`.

### tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

Dirichlet-density Chebotarev for every conjugacy class of a finite Galois extension of number fields, with finite exceptional sets removable. Used both for the stabilizer argument and for auxiliary Frobenius conjugate to complex conjugation; natural density is not required.

Consumers: `RG3.1/degree-one-residue-descent`, `RG3.2/auxiliary-torus-class`, `RG3.4/galois-class-descent`, `RG3.5/one-prime-patching`.

### ReductiveGroupsPartII:RG2.0

The current upstream RG2.0 local point topology, bounded cyclic subgroups and field-extension comparisons; additionally the local openness of the map from G/T times the regular part of Lie(T) to Lie(G), so prescribed maximal-torus centralizer type is an open local condition. This precise local analytic lemma is needed by the vector-space weak-approximation proof.

Consumers: `RG3.2/maximal-torus-approximation`, `RG3.3/prime-unit`.

### ReductiveGroupsPartII:RG2.0a

Current upstream RG2.0a Weil restriction for affine finite-type schemes/groups, its finite-separable split product formula on geometric points, and the common-multiplier fibre product; no new Weil restriction is owned here.

Consumers: `RG3.1/diagonal-quotient-injection`, `RG3.5/auxiliary-hodge-embedding`.

### ReductiveGroupsPartII:RG2.3

Very special parahoric models of groups split over a finite local extension, their Weil-restriction products, and the intersection/central-product compatibility used in Kisin–Zhou Proposition 6.2.4 and §6.2.5. The general local models remain the existing owner; the Hodge embedding is a separate geometric gap.

Consumers: `RG3.5/auxiliary-hodge-embedding`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences

The current upstream Layer 1 Artin–Whaples dense diagonal map into finitely many mixed completions, applied coordinatewise to the finite-dimensional vector space Lie(G). No strong approximation is inferred.

Consumers: `RG3.2/maximal-torus-approximation`.

### AdelicAlgebraicGroups:AA.4

Current upstream §4.3, not just the older atlas level-map summary: algebraic tensor-subquotient eigenvalue generation, representation-independent F-neatness for one coefficient embedding, and the existing Neat.IsNeatAut interface. This roadmap adds only the semisimple cyclic-closure comparison.

Consumers: `RG3.3/weil-point`, `RG3.3/cyclic-torus-and-neatness`.

### AbelianSchemesAndArithmeticModuli:A4

For an individual abelian variety over a number field, the tensor-compatible Betti–étale comparison H¹_B⊗ℚ_l≅H¹_et≅(T_lA⊗ℚ_l)∨, including duals and Tate twists; absolute Hodge tensors have compatible algebraic de Rham components and equality at one l detects equality of rational absolute Hodge tensors. Their finite families are defined over one finite extension. The existing all-degree exterior node alone does not assert this entire comparison.

Consumers: `RG3.5/hodge-convention-bridge`, `RG3.5/simultaneous-mt-factorization`.

### ShimuraData:D1

For polarizable pure H¹, the Mumford–Tate Hodge Cartan involution is inner by h(i), its centre modulo the scalar inverse-weight cocharacter is anisotropic over ℝ, and there is an elliptic maximal real torus T with T/w_s(G_m) anisotropic. Use the existing MT definition, connectedness and reductivity nodes; do not move them here.

Consumers: `RG3.5/hodge-convention-bridge`, `RG3.5/real-elliptic-frobenius`.

### EndoscopicTransferAndUnitaryTraceComparison:ET.0

Three exact extensions of the already owned cohomological interfaces: (i) the Kottwitz 1982 Corollary 2.2 rational representative of a Galois-invariant class of maximal-torus embeddings into a quasi-split group; (ii) the relative-inner-form version of Kottwitz 1986 Theorem 6.6, with γ₀ in G* and an adelic tuple in its inner form G, including variation of its obstruction at one place; (iii) Steinberg H¹(ℚ̆_p,H)=1 for connected reductive H and its descent to a sufficiently large finite unramified level for each individual torsor. Existing ET.0 already supplies local/global H¹, abelianization, stable conjugacy and equal-form obstruction; no duplicate foundation is planned.

Consumers: `RG3.4/rational-torus-embedding`, `RG3.5/one-prime-patching`, `RG3.2/elliptic-maximal-torus`.

### EndoscopicTransferAndUnitaryTraceComparison:ET.0/tate-nakayama-tori

Expose the natural exact sequence H¹(ℚ,T)→⊕_v H¹(ℚ_v,T)→(X_*(T)_Γ)_tors, with real components and the sum of local coinvariant maps. Exactness at the middle follows from Kottwitz 1986 Proposition 2.6; no surjectivity of the last map is required. Use one consistent Tate–Nakayama sign.

Consumers: `RG3.2/auxiliary-torus-class`.

### tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-3-maximal-torus-weights-and-the-highest-weight-classification

The existing complex classical-group highest-weight classification, including GL_n central-character integrality. The general reductive algebraic-group theorem here must restrict to those very representations by highest-weight uniqueness, rather than constructing another classical representation family.

Consumers: `RG3.0/highest-weight-character-basis`.

## Geometric realization inputs

The RG3.4 common-realization application uses a rational reductive isogeny group I_s₀ and a central neat Frobenius power δ. At every realization it requires an isomorphism with the connected centralizer of the image of δ. Its real realization is compact modulo the ambient centre, not merely a group with a compact Cartan. Every neat Weil point must have one rational Conj′(G) image independent of the realization, as in KMPS Proposition 2.2.2. The Noot comparison inputs cited in KMPS §2.2.7 are Theorem 2.4, Lemmas 2.5–2.6 and §3, especially p.68 of the 2009 paper. These assertions form a geometric realization theorem; they are not built into the definition of the isogeny group.

For RG3.5, Kisin–Zhou Theorem 5.1.4 is the common-class input for a good-reduction point in a strongly acceptable Hodge-type triple. It supplies an algebraic semisimple class, independent of l≠p in every algebraic representation, whose rationality is obtained through RG3.1. The auxiliary realization of Proposition 6.2.4 and Lemma 6.2.6(1) must retain the original residue field, provide the very special parahoric and connected-centre hypotheses, and give the common-multiplier/central-product embedding used above. It must also supply an adelic tuple of local representatives with the integral behaviour needed by the relative Kottwitz argument. A characteristic polynomial for H¹ alone does not supply these group-valued comparison assertions. These inputs consume RG3.0–RG3.4 and are consumed only by RG3.5.

## Worked boundary examples

For G=G_m the conjugacy quotient is G_m. The faithful representation t↦diag(t,t⁻¹) induces a finite map to the GL₂ quotient, with 2 and 1/2 in the same fibre. This separates three claims: quotient finiteness, separation by all characters of G and separation by the one faithful characteristic polynomial. Only the first is implied by faithfulness. In GL₂ the identity and a nontrivial unipotent have the same quotient point, so the quotient's class interpretation requires semisimplicity.

For l-units take a prime q≠l and the rational matrices a=[[1,1/q],[0,1]], b=[[1,0],[1/q,1]]. Each cyclic subgroup is bounded at every finite place: integer multiples of a fixed entry remain locally bounded. But tr(ab)=2+1/q² is not q-integral, so ab is not an l-unit. This detects a false subgroup assertion in a noncommutative group. In a torus, commuting products and inverses do preserve the condition.

The norm-one torus of a real quadratic field fails the Serre condition: its real split direction does not descend as a rational split torus. In ℚ(√3), the unit 2+√3 is a finite-place unit, but its two real absolute values are unequal, so it is not a Weil number. For an imaginary quadratic norm-one torus, all complex character values of a rational point have modulus one, and the torus does satisfy the Serre condition.

The real lifting proof preserves the actual quotient class. In G_m with scalar cocharacter id and ν=t², division by the positive radius r gives a point of modulus one and square one, hence ±1. Restoring r gives ±r in the specified class. Picking an arbitrary real lift of the trivial quotient by the scalar torus would lose that class. The same issue is resolved for the general elliptic torus by χ+cχ=mν.

Finite-orbit rigidity needs both reducedness and separatedness. On Spec k[ε]/(ε²), the automorphism ε↦2ε fixes the unique, dense point. On the doubled affine line, exchanging the two origins fixes the dense common punctured line. These examples rule out the unrestricted irreducible-scheme statement while preserving the torus application.

## Bibliography and locator conventions

All results above are stated in the terminology of their targets. Page numbers refer to the particular public versions below; journal pagination is used only when stated. Kisin–Zhou locators use arXiv v2, rather than the Annals version of record. The KMPS locators use the 27 January 2021 author PDF. For Shin the author-version Lemma 3.1 is the statement cited as published Lemma 3.1.1.

<a id="kz25"></a>

- **KZ25.** Mark Kisin; Rong Zhou, [Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2). arXiv:2103.09945v2; locators use its printed pages, not Annals pagination. Relevant locators: §5.1.3 p.47; §5.3.2 and Proposition 5.3.5 pp.53–54; §5.3.6 p.55; §6.1 pp.55–57; Proposition 6.2.4 and Lemma 6.2.6 pp.57–59; Theorem 6.2.7 p.59; Lemma 6.3.3, Corollary 6.3.4 and Remark 6.3.5 pp.60–61.

<a id="kmps22"></a>

- **KMPS22.** Mark Kisin; Keerthi Madapusi Pera; Sug Woo Shin, [Honda–Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf). Author PDF dated 27 January 2021; 41 pages; published Duke Math. J. 171 (2022). Relevant locators: Lemmas 1.2.1–1.2.2 and Proposition 1.2.5 pp.13–15; §2.1.8 p.24; §2.2.1–2.2.14 pp.24–30; §2.3.10–2.3.16 pp.33–36.

<a id="steinberg65"></a>

- **Steinberg65.** Robert Steinberg, [Regular elements of semisimple algebraic groups](https://www.numdam.org/item/PMIHES_1965__25__49_0.pdf). Publications Mathématiques IHÉS 25 (1965), 49–80. Relevant locators: §§6.1–6.6, printed pp.62–63.

<a id="kottwitz86"></a>

- **Kottwitz86.** Robert E. Kottwitz, [Stable trace formula: elliptic singular terms](https://people.dm.unipi.it/maffei/didattica/seminario2020/Kottwitz1986.pdf). Mathematische Annalen 275 (1986), 365–399; scanned journal pages. Relevant locators: §§1–2, printed pp.369–377, especially Theorem 2.2 and Proposition 2.6; §6, printed pp.381–384, especially Theorem 6.6 and §§6.7–6.8.

<a id="kottwitz90"></a>

- **Kottwitz90.** Robert E. Kottwitz, [Shimura varieties and λ-adic representations](https://www.jmilne.org/math/Books/AA1988a.pdf). In Automorphic Forms, Shimura Varieties, and L-functions I; printed pp.161–209. Relevant locators: §7, printed pp.186–189, especially the auxiliary-prime argument on p.188.

<a id="lr87"></a>

- **LR87.** Robert P. Langlands; Michael Rapoport, [Shimuravarietäten und Gerben](https://publications.ias.edu/sites/default/files/shimuravarietaeten-und-gerben_rpl_0.pdf). Retyped author-hosted text of J. reine angew. Math. 378 (1987), 153–211; internal pagination. Relevant locators: Lemma 5.6, internal p.55, including its reference to Langlands Lemma 7.15.

<a id="borovoi98"></a>

- **Borovoi98.** Mikhail Borovoi, [Abelian Galois cohomology of reductive groups](https://www.tau.ac.il/~borovoi/papers/galofile.pdf). Author text of Memoirs AMS 132 (1998), no.626; internal pagination. Relevant locators: Lemma 5.6.3 p.37; Theorem 5.12 and its proof pp.40–41.

<a id="deligne82"></a>

- **Deligne82.** Pierre Deligne, [Hodge cycles on abelian varieties](https://www.jmilne.org/math/Documents/Deligne82.pdf). Author-hosted retypeset text with original section numbering and corrections; internal pagination. Relevant locators: Theorem 2.11 p.19; §§3.4–3.6 pp.24–25; Theorem 3.8 and proof pp.26–27.

<a id="shin11"></a>

- **Shin11.** Sug Woo Shin, [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf). 60-page author version; Lemma 3.1 here corresponds to the published citation Lemma 3.1.1. Relevant locators: §3.1, Lemma 3.1 and Remark 3.2, internal pp.12–14.

<a id="milneag"></a>

- **MilneAG.** J. S. Milne, [Algebraic Groups: the theory of group schemes of finite type over a field](https://www.jmilne.org/math/Books/iAG2022.pdf). Corrected 2022 author manuscript; printed book pagination. Relevant locators: Theorem 4.27 and Lemma 4.28, pp.94–95; Theorem 22.2 and §§22.8–22.12, pp.464–466; complete proof §§22.13–22.27, pp.466–471.

The exact original locators for the torus-embedding inputs are R. Kottwitz, *Rational conjugacy classes in reductive groups*, Duke Math. J. 49 (1982), 785–806, Corollary 2.2; R. Langlands, *Les débuts d’une formule des traces stable*, Lemma 7.15 (the input cited by LR87 Lemma 5.6); and G. Harder, *Über die Galoiskohomologie halbeinfacher Matrizengruppen II*, Math. Z. 92 (1966), 396–415, Lemma 5.5.3. The orthogonal convention and geometric comparisons use R. Noot, *Frobenius conjugacy classes and Mumford–Tate groups*, J. London Math. Soc. 79 (2009), 53–71, §1.5, Theorem 2.4, Lemmas 2.5–2.6 and §3 (p.68), as cited in KMPS §2.2.7, DOI [10.1112/jlms/jdn049](https://doi.org/10.1112/jlms/jdn049). The odd-unitary target includes arbitrary CM fields; its Shin specialization retains the exact F=F⁺E hypothesis of that proof.
