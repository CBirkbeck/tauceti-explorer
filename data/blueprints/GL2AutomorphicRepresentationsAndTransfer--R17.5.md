# Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and transfer

Part R17.5, revision 2: *Automorphic induction and Langlands–Tunnell*. Agent: Codex, session codex-rDSlGM. Issue [#9766](https://github.com/CBirkbeck/tauceti-explorer/issues/9766).

This part continues [R17.3](GL2AutomorphicRepresentationsAndTransfer--R17.3.md), importing its quadratic induction, weak tetrahedral and octahedral automorphy, and classical weight-one comparison. It preserves the original fifteen declarations and the independent review’s corrections. Twenty-four foundation targets make explicit the idele extension, modular character comparison, strengthened Fong–Swan induction and finite-field descent needed by the two end results: matching solvable Artin representations at every place, and lifting an odd residual representation with its reduction and kernel preserved.

The pass is complete and coverage is **planned**. There are 39 declarations: 32 theorems, three lemmas, one definition, one construction and two applications; fourteen API items, eight unit tests and one planet. Every implementation remains unchecked. The local induction-constant product remains G2; the three ordinary-character refinements requested from InductionRestriction Part II remain G7. Neither R17.3’s GL₃ source-proof work nor its residual lifting gap is retired by this revision.

The [packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R17.5.json) and this document are definitive. The [suggested Lean file](../suggested/GL2AutomorphicRepresentationsAndTransfer--R17.5.lean) states only light definitions, milestones and examples whose carriers exist at the pins. Heavy automorphic and modular-character targets remain fully stated here. The accepted RS-21 basis extends `tauceti:TauCetiRoadmap/ModularForms`.

## Conventions

F is a number field, A_F its adele ring, C_F = F^×\A_F^× its idele class group and G_F an absolute Galois group. A continuous ρ: G_F → GL₂(C) has finite image. At a place v write ρ_v for its pullback to the local Weil group W_{F_v}. Finite global Artin reciprocity identifies finite Galois characters with finite-order Hecke characters, compatibly with norms. A quasi-character ω is twisted into the family ρ_v using local reciprocity; the notation ρ⊗ω does not require a global Weil group. Set U_v^0 = O_v^× and U_v^m = 1 + 𝔭_v^m for m ≥ 1; c(χ) is the least m on which χ is trivial.

π(ρ_v) uses the **unitary** correspondence rec of R16.3 with geometric reciprocity: a uniformiser maps to geometric Frobenius, standard factors are unshifted, and determinant corresponds to central character. The half Tate twist recᵀ = rec ⊗ ν⁻¹/² has different determinant and L-variable and is not used here. At infinity use AF.1. Local γ is ε(s,χ⊗π,ψ)L(1−s,χ⁻¹⊗π̃)/L(s,χ⊗π), with ψ a character of A_F/F. The global comparison uses the product of these raw local factors; undo R16.5's conductor factor A(π)^{s/2} before cancellation.

In the classical/residual applications Frobenius is **arithmetic**, as in Deligne–Serre. Therefore put π_arith(ρ)_v = π((ρ∨)_v). At an unramified place, geometric Frobenius on ρ∨ has the same eigenvalues as arithmetic Frobenius on ρ, and its local factor is det(1−ρ(Frob_arith)q⁻ˢ)⁻¹. Its central character is detρ under arithmetic reciprocity. Duality preserves the kernel, conductor and oddness. At a real place π(1,sgn) is Rogawski–Tunnell's π₁; a cuspidal representation over a totally real field has holomorphic parallel weight one in their adelic sense when every real component is π₁.

For a finite group Γ, a prime p and an algebraically closed field k of characteristic p, an element is p-regular if its order is prime to p. Brauer characters are taken with respect to a fixed isomorphism τ: μ_m(k) ≅ μ_m(C), m prime to p and divisible by the orders of the p-regular elements. For an arbitrary algebraically closed k, finite-field descent is up to isomorphism, not a claim that its displayed matrices have algebraic entries. A residual representation r̄: G_F → GL_n(F̄_p) is continuous for the discrete topology; a lift consists of a number field E, a prime λ of E above p, the localisation R = (O_E)_λ, a ring map f: R → F̄_p with kernel λR, a representation ρ: G_F → GL_n(R) and P ∈ GL_n(F̄_p) with r̄ = P·(f∘ρ)·P⁻¹. Here the reduction is r̄ itself, not only its semisimplification. Frobenius elements are arithmetic, as in Deligne–Serre. A two-dimensional representation is odd at a real place v if det of the image of complex conjugation c_v is −1, and totally odd if it is odd at every real place.

## Pinned-library boundary

The reviewed library audit AUDIT-14 classifies R17.5 as not built. The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Actual source statements were read before citation. The following are existing declarations, rather than proposed nodes:

- `mathlib:Group.IsSolvable` — The class of solvable groups (Group.IsSolvable; the root alias IsSolvable is deprecated at the pin); finite solvable groups are p-solvable for every p. Module: `Mathlib/GroupTheory/Solvable.lean`.
- `mathlib:IsDedekindDomain.HeightOneSpectrum` — Nonzero prime ideals of a Dedekind domain, used for the prime λ of O_E above p. Module: `Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean`.
- `mathlib:Localization.AtPrime` — The localisation of a commutative ring at a prime ideal; (O_E)_λ, a discrete valuation ring since O_E is Dedekind. Module: `Mathlib/RingTheory/Localization/AtPrime/Basic.lean`.
- `mathlib:Matrix.GeneralLinearGroup` — GL(n, R) as the unit group of n×n matrices over a semiring; the carrier of every matrix representation here. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.GeneralLinearGroup.det` — The determinant as a group homomorphism GL(n, R) → Rˣ for commutative R. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.GeneralLinearGroup.map` — A ring homomorphism R → S induces the group homomorphism GL(n, R) → GL(n, S); used for reduction of integral representations. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.charpoly` — The characteristic polynomial det(X·1 − M) of a square matrix; its roots with multiplicity are the eigenvalues summed in the Brauer character. Module: `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`.
- `mathlib:Representation.IsIrreducible` — Irreducibility of a representation as simplicity of its lattice of subrepresentations; applied to the k-linear representation of Γ on kⁿ. Module: `Mathlib/RepresentationTheory/Irreducible.lean`.
- `mathlib:rootsOfUnity` — The subgroup of units ζ with ζ^m = 1 of a commutative monoid; μ_m(k) and μ_m(C) in the Brauer character. Module: `Mathlib/RingTheory/RootsOfUnity/Basic.lean`.
- `mathlib:ContinuousMonoidHom` — Continuous group-homomorphism carrier used for unit-circle character extension. Module: `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean`.
- `mathlib:ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints` — Uniform density for a separating star subalgebra of complex continuous functions on a compact space. Module: `Mathlib/Topology/ContinuousMap/StoneWeierstrass.lean`.
- `mathlib:IsArtinianRing.isNilpotent_jacobson_bot` — Nilpotence of the radical of an Artinian ring, including noncommutative finite-dimensional algebras. Module: `Mathlib/RingTheory/Artinian/Ring.lean`.
- `mathlib:IsArtinianRing.isSemisimpleRing_iff_jacobson` — An Artinian ring is semisimple iff its Jacobson radical is zero. Module: `Mathlib/RingTheory/Artinian/Module.lean`.
- `mathlib:Circle` — The topological unit-circle group, with its complex coercion. Module: `Mathlib/Analysis/Complex/Circle.lean`.
- `mathlib:Nat.factorization` — Prime multiplicities and the ordCompl notation for the prime-to-p part of a finite group order. Module: `Mathlib/Data/Nat/Factorization/Defs.lean`.
- `mathlib:IntermediateField.adjoin` — The intermediate field generated by a set of complex roots of unity over Q. Module: `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean`.

The suggested file also uses the existing number-field idele class group and local completions, roots-of-unity constructors and the absolute Galois group with its Krull topology. Current Tau Ceti has no implementation of the Artin, automorphic or modular lifting targets of this part.

## Dependency and proof flow

The topology branch proves extension for open subgroups by divisibility, for Euclidean closed subgroups by a vector/lattice decomposition, and for compact abelian groups by the existing CompactGroups Peter–Weyl theorem. These combine over an open real-times-compact subgroup of the ideles. The isolation subgroup has a proper product embedding, so the prescribed character is continuous before it is extended.

The analytic branch is preliminary Brauer/Hecke functional equation → local epsilon existence → global induction-constant product → final twisted Artin functional equation. The preliminary prefix uses local L-induction and one-dimensional Hecke equations; it does not use higher-dimensional local epsilon factors. The supplier’s local existence proof must be pointed to that prefix when owners are integrated. G2 marks the missing product calculation. Conditional on that calculation, twist stability and the local converse isolate each finite place; the tetrahedral and octahedral cases supply their archimedean matching separately.

The modular branch imports finite-algebra projective covers from QuiverRepresentations and ordinary induction and cyclotomic splitting from InductionRestriction. New targets supply splitting and simple-module scalar extension, complete modular systems, projective lifting/vanishing, the projective Brauer Hom formula and the p-regular class count. Modular Clifford theory and mixed-character extension then provide Isaacs’s strengthened induction, including p-rationality and invariance under prime-to-p automorphisms. The finite-field descent is by conjugacy over any algebraically closed coefficient field. Fong–Swan plus Brauer recognition gives an integral lift; the elementary involution argument transfers oddness for p>2.

Current roadmaps were checked on main as well as against the atlas snapshot. InductionRestriction Layer 5 is ordinary Maschke Clifford theory; it cannot serve as modular Clifford correspondence. Its Layer 6 cyclotomic splitting is reused. SemisimpleAlgebras supplies its general Wedderburn block dictionary, while its central-simple Layer 6 splitting alone is insufficient. QuiverRepresentations Layer 3A already supplies covers for general finite-dimensional algebras. CompactGroups Layers 5–6 supply Peter–Weyl separation and Haar orthogonality; neither is re-planned. LocalFieldsRamification Layer 2 supplies the prescribed unramified residue extension.

## R17.5 targets

### Character extension and the isolation subgroup

<a id="r17-5-open-subgroup-character-extension"></a>

#### Unitary characters extend from open subgroups

**Declaration:** `TauCeti.GL2Transfer.open_subgroup_character_extension`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/open-subgroup-character-extension`.

If G is an abelian topological group and U is an open subgroup, every continuous homomorphism U → S¹ is the restriction of a continuous homomorphism G → S¹.

**Hypotheses.**

- G abelian; U open in G; the character has values in the unit circle. No compactness or finiteness is assumed.

**Proof or construction.**

1. Order extensions by inclusion of their domains and apply Zorn to compatible unions. At a maximal domain D, adjoining x amounts to choosing an n-th root of the prescribed value at xⁿ if a least positive n with xⁿ∈D exists; if no such n exists choose any value. Divisibility of S¹ provides the root, so maximality forces D=G (Dikranjan 2.1.10).
2. The extended homomorphism is continuous at 1 because its restriction to the open neighbourhood U is continuous. Translate to prove continuity everywhere.

**Direct prerequisites.** `mathlib:ContinuousMonoidHom`, `mathlib:Circle`.

**Acceptance checks.**

- For discrete G all subgroups are open.
- On 2Z⊂Z a value z at 2 extends by either square root at 1.
- Continuity of an algebraic extension is concluded from openness, not from an arbitrary closed domain.

**Sources.**

- [Dikran Dikranjan, Introduction to Topological Groups](https://users.dimi.uniud.it/~dikran.dikranjan/ITG.pdf), Theorem 2.1.10 and Corollary 2.1.11, pp. 3–4; Lemma 12.3.5(b), p. 90. Divisibility gives algebraic character extension; openness upgrades it to continuous extension.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-closed-euclidean-subgroup-structure"></a>

#### Closed subgroups of real vector groups

**Declaration:** `TauCeti.GL2Transfer.closed_euclidean_subgroup_structure`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/closed-euclidean-subgroup-structure`.

Every closed subgroup H of Rⁿ is V⊕D topologically, where V is a real vector subspace and D is generated over Z by linearly independent vectors in a complementary real subspace. Thus H≅Rˢ×Zᵗ and s+t≤n.

**Hypotheses.**

- Finite n, usual Euclidean topology; H is closed.

**Proof or construction.**

1. Take a maximal real vector subspace V contained in H and an orthogonal complement V⊥. Then H=V+(H∩V⊥), since subtracting the V-projection stays in H.
2. If H∩V⊥ were nondiscrete, choose nonzero h_j→0 with h_j/‖h_j‖→u on the compact sphere. For each real a, integers m_j with m_j‖h_j‖→a give m_j h_j→au. Closedness puts Ru in H∩V⊥, contradicting maximality of V.
3. A discrete subgroup of a finite-dimensional real vector space is a lattice in its real span: choose a maximal real-linearly independent family from it. Reducing modulo its generated lattice puts each coset in a compact fundamental parallelotope, whose intersection with the discrete subgroup is finite. Thus that lattice has finite index. The subgroup is finitely generated and torsion-free, and finite index preserves its Z-rank, which is the dimension of the real span. A Z-basis is consequently real-linearly independent. Addition V×D→H and its orthogonal projections give the topological product.

**Direct prerequisites.** `mathlib:ContinuousMonoidHom`.

**Acceptance checks.**

- H=Rⁿ has t=0.
- H=Zⁿ has s=0.
- A dense proper subgroup of R is outside the closed hypothesis.

**Sources.**

- [Dikran Dikranjan, Introduction to Topological Groups](https://users.dimi.uniud.it/~dikran.dikranjan/ITG.pdf), Theorem 8.1.2, pp. 51–52; second proof in §8.2, pp. 52–54. Closed real subgroups split as a vector space and a discrete lattice. The sketch uses the second proof’s small-vector argument.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-euclidean-character-extension"></a>

#### Unitary characters extend from closed real subgroups

**Declaration:** `TauCeti.GL2Transfer.euclidean_character_extension`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/euclidean-character-extension`.

Every continuous unitary character of a closed subgroup H≤Rⁿ extends to a continuous unitary character of Rⁿ.

**Hypotheses.**

- H closed in the finite-dimensional real additive group; target S¹.

**Proof or construction.**

1. Use closed-euclidean-subgroup-structure to write H=V⊕⊕Zj_i.
2. A continuous character on a real vector group is exp(2πiℓ) for a real linear functional ℓ: lift it through exp:R→S¹ on the simply connected vector space, normalize the lift at zero, and continuity makes the integral defect of additivity zero. On each j_i choose an angle for its prescribed value.
3. Extend ℓ from V together with those values on the real-linearly independent j_i to Rⁿ by a vector-space basis. Exponentiation gives the extension.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/closed-euclidean-subgroup-structure`, `mathlib:ContinuousMonoidHom`.

**Acceptance checks.**

- For H=Z the value at 1 may be any point of S¹.
- For H=Rⁿ the extension is the original character.
- Two choices of lattice angles can give different extensions.

**Sources.**

- [Dikran Dikranjan, Introduction to Topological Groups](https://users.dimi.uniud.it/~dikran.dikranjan/ITG.pdf), Theorem 8.1.2, pp. 51–52; Example 12.2.4, p. 87, using the lifting Lemma 8.0.7, pp. 50–51. The real subgroup structure and the character classification of R give the stated extension by choosing angles on lattice generators.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-compact-character-extension"></a>

#### Unitary characters extend from closed compact subgroups

**Declaration:** `TauCeti.GL2Transfer.compact_character_extension`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/compact-character-extension`.

If K is compact Hausdorff abelian and L≤K is closed, every continuous unitary character of L extends to K.

**Hypotheses.**

- K compact Hausdorff abelian; L closed, hence compact.

**Proof or construction.**

1. Import CompactGroups Layer 5: irreducible finite-dimensional complex representations of an abelian group are one-dimensional by Schur, and Peter–Weyl gives separation of points by their unitary characters. This separation is obtained after its analytic density proof.
2. The complex span of restrictions of characters of K is a unital star subalgebra of C(L,C) separating points. The pinned Stone–Weierstrass theorem makes it uniformly dense.
3. If a character η of L were different from every restricted character, Haar orthogonality would make f↦∫_L conjugate(η)f vanish on this dense span, hence on η itself. Its value on η is 1. Therefore η is a restriction. Use CompactGroups Layer 6 for the normalized Haar character pairing.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`, `mathlib:ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`, `mathlib:Circle`.

**Acceptance checks.**

- A character of a finite cyclic subgroup of S¹ extends by an integer power.
- For L={1} the trivial character extends.
- The separation input is Peter–Weyl, not an unsupported assumption about compact groups.

**Sources.**

- [Dikran Dikranjan, Introduction to Topological Groups](https://users.dimi.uniud.it/~dikran.dikranjan/ITG.pdf), Corollary 11.3.4, p. 76; Lemma 12.4.11(a), p. 94. Characters extend from compact subgroups. The proof here instead combines the existing Peter–Weyl owner with the pinned Stone–Weierstrass theorem.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-real-compact-open-character-extension"></a>

#### Extension in groups with a real and compact open subgroup

**Declaration:** `TauCeti.GL2Transfer.real_compact_open_character_extension`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/real-compact-open-character-extension`.

Let G be Hausdorff abelian with an open subgroup U topologically isomorphic to Rⁿ×K for compact Hausdorff abelian K. Every continuous unitary character of any closed subgroup H≤G extends to G.

**Hypotheses.**

- Finite n; specified topological group isomorphism U≅Rⁿ×K; H closed.

**Proof or construction.**

1. Set H₀=H∩U and L=H₀∩({0}×K). Extend the restriction to L by compact-character-extension and divide the given character by that extended K-character.
2. The resulting character kills L. Projection q:H₀→Rⁿ is closed because K is compact; its image B is closed and the induced H₀/L→B is a topological group isomorphism. Thus the character descends continuously to B. Apply euclidean-character-extension and multiply back by the K-character to extend from H₀ to U.
3. Glue on H+U using agreement on H∩U. It is an open subgroup and the glued homomorphism is continuous on U. Apply open-subgroup-character-extension to reach G.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/compact-character-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/euclidean-character-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/open-subgroup-character-extension`.

**Acceptance checks.**

- n=0 covers groups with a compact open subgroup.
- K={1} covers real vector groups and their discrete open extensions.
- The image of a closed subgroup under a noncompact-kernel projection can be nonclosed; compactness of K is used.

**Sources.**

- [Dikran Dikranjan, Introduction to Topological Groups](https://users.dimi.uniud.it/~dikran.dikranjan/ITG.pdf), Lemma 7.2.3, p. 47 (compact-kernel projection); Lemma 12.3.5(b), p. 90; Lemma 12.4.11(a), p. 94. Combining the closed compact projection with compact and open character extension proves the precise class of groups used here, without assuming general Pontryagin duality.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-idele-character-extension"></a>

#### Unitary characters extend from closed idele subgroups

**Declaration:** `TauCeti.GL2Transfer.idele_character_extension`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/idele-character-extension`.

For a number field F, every continuous unitary character of a closed subgroup H of A_F× extends to A_F×.

**Hypotheses.**

- F a number field; ideles carry the restricted product topology.

**Proof or construction.**

1. The open subgroup U=∏_{v|∞}F_v××∏_{v finite}O_v× is R^(r₁+r₂)×K under archimedean logarithmic absolute values and polar decomposition, with K={±1}^r₁×(S¹)^r₂×∏O_v× compact Hausdorff abelian. GlobalNumberFields supplies the local-unit restricted-product topology; each finite O_v× is profinite and the product is compact.
2. Apply real-compact-open-character-extension. A character trivial on the principal subgroup descends to the Hausdorff idele-class quotient.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/real-compact-open-character-extension`.

**Acceptance checks.**

- For F=Q the archimedean compact factor is {±1}.
- At a complex place use one real logarithmic factor and one circle.
- The resulting character can have infinite order.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), Lemma 12.5, pp. 210–211; Dikranjan’s extension results are expanded in the preceding nodes. The idele instance is exactly the character-extension step of the isolating-twist proof. Its proof now reaches the pinned analytic baseline and current compact-group owner.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-isolation-subgroup-topology"></a>

#### Topology of the isolation subgroup

**Declaration:** `TauCeti.GL2Transfer.isolation_subgroup_topology`; lemma; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/isolation-subgroup-topology`.

For F,S,v₀ and U_v^m as in isolating-twist-character, let A≤A_F× have component 1 outside S, arbitrary component at v₀ and component in U_v^m at the other v∈S. Multiplication F×_discrete×A→A_F× is a homeomorphism onto the closed subgroup F×A.

**Hypotheses.**

- S consists of finite places, is finite and contains v₀; U_v^0=O_v×.

**Proof or construction.**

1. F×∩A={1}, since a principal idele equal to 1 outside S is 1. Multiplication is consequently injective.
2. For any 0<ε≤1, A_ε={a∈A:ε≤|a|≤ε⁻¹} is compact. All non-v₀ components lie in compact unit groups; the valuation at v₀ takes only finitely many possible values.
3. The product of a closed discrete subgroup with a compact subset is closed. On a neighbourhood whose norm lies in [ε,ε⁻¹], F×A coincides with F×A_ε, since the principal norm is 1. This proves closedness locally.
4. For a compact C⊂A_F×, its norm bounds place every possible a in a fixed compact A_ε. Then t∈C A_ε⁻¹∩F×, a finite set because principal ideles form a closed discrete subgroup. The preimage of C is therefore a closed subset of a finite set times A_ε and is compact. Multiplication is a continuous injective proper map between locally compact Hausdorff spaces, hence an embedding onto its already closed image. This proves the required product topology.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`.

**Acceptance checks.**

- The arbitrary v₀ factor itself is not compact.
- Principal ideles have norm 1, which is essential to the slab argument.
- For m=0 every other local factor is O_v×.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), Lemma 12.5 proof, pp. 210–211. The norm-bounded compact subsets establish both closedness and the product topology needed to define the character continuously.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

### Global functional equations and the remaining product gap

<a id="r17-5-preliminary-artin-functional-equation"></a>

#### Preliminary functional equation before local constants

**Declaration:** `TauCeti.GL2Transfer.preliminary_artin_functional_equation`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/preliminary-artin-functional-equation`.

For finite-image complex ρ of G_F and a Hecke quasi-character ω, the product Λ(s,ρ⊗ω) of raw local L-factors continues meromorphically and satisfies Λ(s,ρ⊗ω)=E_pre(s,ρ,ω)Λ(1−s,ρ∨⊗ω⁻¹), where E_pre=A exp(Bs) with A≠0. The factor is multiplicative on virtual representations and E_pre,F(s,Ind_{G_K}^{G_F}σ,ω)=E_pre,K(s,σ,ω∘N_K/F). Its definition and proof use no higher-dimensional local epsilon factor.

**Hypotheses.**

- F a number field; finite-image ρ; ω any continuous quasi-character, interpreted locally through geometric reciprocity; raw archimedean factors included.

**Proof or construction.**

1. Factor through a finite Galois group and use InductionRestriction Layer 6 Brauer induction, writing [ρ]=Σa_i Ind θ_i. Finite global reciprocity makes θ_i Hecke characters η_i over the corresponding fields K_i.
2. The projection formula and local L-induction identify Λ with ∏Λ_Ki(s,η_i(ω∘N))^a_i; handle archimedean induction with the imported real/complex factor formulas.
3. Multiply the one-dimensional Hecke functional equations. Their nonzero exponential factors give E_pre. It is independent of the Brauer expression because the ratio of the two nonzero meromorphic L-functions is intrinsic. Multiplicativity and global induction follow from these ratios and local L-inductivity. Real norm powers shift s and cause no new global carrier.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1/finite-galois-factorisation`, `ArithmeticGaloisRepresentations:R01.2/local-factor-of-induced-representation`, `ArithmeticGaloisRepresentations:R01.2/local-euler-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Acceptance checks.**

- For ρ=1 this is Hecke theory.
- Negative Brauer coefficients require meromorphy, not holomorphy.
- No local-epsilon-factor or final Artin product formula appears among the prerequisites.

**Sources.**

- [Pierre Deligne, Les constantes des équations fonctionnelles des fonctions L](https://publications.ias.edu/sites/default/files/Number20.pdf), §3.12(A)–(D), pp. 533–534. Brauer induction gives meromorphy, the exponential functional-equation factor, additivity and global inductivity before §4 constructs local constants.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-global-induction-constant-product"></a>

#### Global product of local induction constants

**Declaration:** `TauCeti.GL2Transfer.global_induction_constant_product`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/global-induction-constant-product`.

Let K/F be a finite separable extension of number fields, ψ nontrivial on A_F/F, ψ_K=ψ∘Tr_K/F, and choose local additive measures whose products are the respective Tamagawa measures. Put λ_v(K/F,ψ)=ε_Fv(⊕_{w|v}Ind_{W_Kw}^{W_Fv}1,ψ_v,dx_v)/∏_{w|v}ε_Kw(1,ψ_K,w,dy_w). For these Deligne constants, ∏_v λ_v=1. Accordingly the product of local constants is globally inductive for arbitrary finite-image representations with Hecke quasi-character twists. The individual λ_v need not be 1.

**Hypotheses.**

- All places, including infinity; compatible trace characters and Tamagawa products; degree-zero local induction as in Deligne 4.1(3).

**Proof or construction.**

1. Subtract dim σ copies of the trivial representation before applying degree-zero local induction. Restoring them gives the displayed λ_v correction, raised to dim σ. Thus proving the product formula for these corrections suffices.
2. The outstanding calculation is ∏λ_v=1, not unrestricted local inductivity. Deligne 5.11 states the global product functional equation, but its proof paragraph invokes known arguments without giving this calculation. An identification of the induction correction with a scalar in a trace-pairing Fourier comparison has not been established in the sources read. Adelic Poisson alone does not justify it. This is the retained precise gap G2; the remaining steps below are conditional on that product formula.
3. Local additivity, Mackey restriction and the degree-zero axiom now prove global inductivity of ∏ε. Compare on the Brauer induction generators with the Hecke functional equation, hence with preliminary-artin-functional-equation. This identifies E_pre with ∏ε for every ρ and twist.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/preliminary-artin-functional-equation`, `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`, `ArithmeticGaloisRepresentations:R01.2/local-factor-of-induced-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

**Acceptance checks.**

- For K=F all λ_v are 1.
- For a quadratic extension retain the local quadratic induction constants, including infinity.
- Rescaling a single local measure changes λ_v; the product statement requires the Tamagawa product condition.

**Sources.**

- [Pierre Deligne, Les constantes des équations fonctionnelles des fonctions L](https://publications.ias.edu/sites/default/files/Number20.pdf), §3.11.3–3.11.4, p. 532; 4.1(3), p. 535; global construction 4.12, p. 544; 5.11 and its proof paragraph, p. 551. Deligne states the product functional equation; the λ-product is its induction consequence. The source’s short proof does not discharge the explicit λ-product calculation in this revision; it remains G2.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

### Modular splitting, projectives and character recognition

<a id="r17-5-finite-algebra-splitting-field"></a>

#### Finite splitting extensions for finite-dimensional algebras

**Declaration:** `TauCeti.GL2Transfer.finite_algebra_splitting_field`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-algebra-splitting-field`.

Every finite-dimensional algebra A over a field F admits a finite algebraic extension E/F such that every simple E⊗_F A-module is absolutely simple, equivalently its semisimple quotient is a finite product of full matrix algebras over E.

**Hypotheses.**

- A finite-dimensional, unital, possibly noncommutative F-algebra. No restriction on char F.

**Proof or construction.**

1. Over an algebraic closure F̄, there are finitely many simple modules and their endomorphism rings are F̄. Import the Wedderburn/simple-block dictionary from SemisimpleAlgebras and finite-algebra radical infrastructure from QuiverRepresentations.
2. Choose bases in these simple modules. Their finitely many action matrices for an F-basis of A involve finitely many elements algebraic over F. They are contained in a finite extension E.
3. Combine all action maps into A_E→∏End_E(S_i). Its extension to F̄ is onto by the semisimple block dictionary, so a finite matrix-rank calculation proves it onto over E. The kernel extends to J(A_F̄), hence is nilpotent and lies in J(A_E). The split semisimple quotient has zero radical, giving the opposite inclusion. This identifies A_E/J as the product of full matrix blocks and exhausts its simples. The descended modules are absolutely simple by the full matrix-span criterion (R01.1/absolutely-irreducible, whose density proof works for an algebra action).

**Direct prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness`, `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`, `ArithmeticGaloisRepresentations:R01.1/absolutely-irreducible`.

**Acceptance checks.**

- For F=F_p, E is a finite field.
- For A=M_n(F), E=F works.
- This is not an entrywise descent theorem for an arbitrary representation displayed over a transcendental extension.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), Theorem 9.2.6 and proof, p. 143; Proposition 9.2.5, p. 142. Finite-dimensional algebras have a splitting field finite over the original field; the proof descends a finite list of simple-module matrices from an algebraic closure.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-split-simple-scalar-extension"></a>

#### Simple modules of a split algebra after scalar extension

**Declaration:** `TauCeti.GL2Transfer.split_simple_scalar_extension`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/split-simple-scalar-extension`.

Let A be a finite-dimensional F-algebra with A/J(A)≅∏_{i=1}^r M_ni(F). For any field extension K/F, J(K⊗A)=K⊗J(A) and (K⊗A)/J≅∏M_ni(K). Scalar extension gives a bijection of simple-module isomorphism classes, taking the i-th column module F^ni to K^ni. In particular every simple K⊗A-module descends up to isomorphism to F.

**Hypotheses.**

- The split quotient hypothesis is explicit; K can be transcendental and need not be algebraically closed.

**Proof or construction.**

1. J(A) is nilpotent by the pinned Artinian theorem. Flatness of a field extension makes the scalar-extended quotient exact; the image K⊗J(A) remains nilpotent and is therefore contained in J(K⊗A).
2. The quotient is the indicated product of matrix algebras, hence semisimple and has zero radical. The radical upstairs maps to zero, proving the opposite inclusion.
3. A simple module is killed by the radical. Apply the imported Wedderburn simple-block dictionary: a matrix block has exactly its column module as a simple, and a product’s simples come from one block. The columns commute with scalar extension.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness`, `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`, `mathlib:IsArtinianRing.isNilpotent_jacobson_bot`, `mathlib:IsArtinianRing.isSemisimpleRing_iff_jacobson`.

**Acceptance checks.**

- A=M_n(F) has one simple of dimension n over every extension.
- A=F[ε]/(ε²) retains its one-dimensional simple and nonzero radical.
- Without the split hypothesis R→C for A=C gives two complex simples, so the hypothesis cannot be omitted.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.2, splitting-field definition p. 142 and remarks p. 144; §9.8, Exercises 4 and 8(a), pp. 165–166; Artin–Wedderburn Theorem 2.1.3, pp. 15–16. The split block description gives scalar-extension stability. The radical comparison here is proved under the split hypothesis and needs no general perfect-field radical theorem.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-finite-field-simple-descent"></a>

#### Descent of characteristic-p simples up to conjugacy

**Declaration:** `TauCeti.GL2Transfer.finite_field_simple_descent`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-field-simple-descent`.

For any finite group Γ and algebraically closed field k of characteristic p, every irreducible r:Γ→GL_n(k) has a finite subfield k₀⊂k, an irreducible r₀:Γ→GL_n(k₀), and P∈GL_n(k) with r(g)=P r₀(g)P⁻¹. The field k₀ can be chosen splitting for every subgroup of Γ. The matrices of r themselves need not lie in a finite field.

**Hypotheses.**

- Γ finite; k arbitrary algebraically closed of characteristic p; irreducible r.

**Proof or construction.**

1. Apply finite-algebra-splitting-field to the finite list of algebras F_pH for all subgroups H≤Γ and take their finite compositum. Embed this finite field k₀ in k.
2. Apply split-simple-scalar-extension to k₀Γ and k/k₀. The simple module of r is isomorphic to the scalar extension of a simple k₀Γ-module. Choose bases and write the isomorphism as P.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-algebra-splitting-field`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/split-simple-scalar-extension`, `mathlib:Matrix.GeneralLinearGroup.map`.

**Acceptance checks.**

- Conjugating a finite-field representation by a matrix with a transcendental entry is allowed.
- For Γ a p-group the only simple is the trivial rank-one module.
- The statement is about simple modules; it does not claim finite-field descent of all nonsemisimple modules.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), Theorem 9.2.6, p. 143; §9.2 remarks p. 144; §9.8, Exercises 4 and 8(a), pp. 165–166. The finite splitting extension and split scalar-extension classification imply descent of simples for arbitrary algebraically closed coefficients.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-complete-splitting-modular-system"></a>

#### Complete splitting modular systems exist

**Declaration:** `TauCeti.GL2Transfer.complete_splitting_modular_system`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/complete-splitting-modular-system`.

For finite Γ and prime p there is a complete DVR R of mixed characteristic (0,p), with fraction field E a finite extension of Q_p and finite residue field k₀, such that E and k₀ split every subgroup of Γ and E contains roots of unity of the full exponent e of Γ. Reduction identifies prime-to-p roots with their residue roots. Compatible complex values of these roots define ordinary and Brauer characters.

**Hypotheses.**

- Γ finite; prime p; complex root identification is algebraic, not a continuous embedding Q_p→C.

**Proof or construction.**

1. Choose a finite splitting field F_q for all subgroup algebras by finite-field-simple-descent. Take the unramified degree-f extension of Q_p with residue F_q, and then a finite compositum with Q_p(ζ_e). Its ring of integers is a complete DVR, its residue extends F_q and hence remains splitting by split-simple-scalar-extension.
2. The characteristic-zero cyclotomic splitting theorem in InductionRestriction Layer 6 makes E splitting for all subgroups. Reduction on μ_m, p∤m, is injective because m is a unit and surjective because all m roots remain distinct; these roots are integral units.
3. Choose an embedding of Q(ζ_e) in C; the values of finite-group characters lie in that field, so no topological embedding of the complete field is required.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-field-simple-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/split-simple-scalar-extension`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `ArithmeticGaloisRepresentations:R01.1/reduction-of-roots-of-unity`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Acceptance checks.**

- If p divides e, primitive e-th roots are required upstairs, not in k₀.
- For Γ={1}, Z_p suffices.
- Completeness is imposed for lifting projectives, and is not imposed on the number-field localisation in the end target.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.4, definition and existence of p-modular systems, pp. 148–149; Lemma 10.1.1, p. 170. Splitting modular systems are obtained by finite extensions and may be complete; only prime-to-p roots survive reduction.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-projective-modular-lift"></a>

#### Projectives lift over a complete DVR

**Declaration:** `TauCeti.GL2Transfer.projective_modular_lift`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/projective-modular-lift`.

Let R be a complete DVR with residue field k₀ and Γ finite. Every finitely generated projective k₀Γ-module P is the reduction of a projective RΓ-lattice P̂, unique up to isomorphism among RΓ-lattice lifts. For projective P̂,Q̂, Hom_RΓ(P̂,Q̂) is finite free over R and its reduction is Hom_k₀Γ(P,Q). The same Hom base-change holds with any RΓ-lattice as target.

**Hypotheses.**

- R complete; finite Γ; finite-rank free R-module targets; projectivity is over the group algebra.

**Proof or construction.**

1. Write P as the image of an idempotent in a matrix algebra over k₀Γ using the existing finite-algebra projective infrastructure. Lift the idempotent successively modulo πⁿ: at each step the kernel is square-zero. The polynomial correction to an almost-idempotent yields a lift; completeness gives the limiting idempotent and its image P̂.
2. For any lattice lift L, lift P̂→L of the residual isomorphism using projectivity. Nakayama gives surjectivity and equal R-ranks imply isomorphism. This proves uniqueness and that every lattice lift is projective.
3. Hom out of a projective summand is the corresponding idempotent summand of Hom from a finite free RΓ-module. As an R-module it is finite free, and taking that summand commutes with reduction. Orthogonal primitive idempotents and covers themselves are imported from QuiverRepresentations Layer 3; their complete-DVR lifts are the new content.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/complete-splitting-modular-system`.

**Acceptance checks.**

- The regular module lifts to RΓ.
- A lift of a projective cover need not have irreducible characteristic-zero generic fibre.
- The assertion is not made over Z or a noncomplete DVR.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), Propositions 9.4.3 and 9.4.5, pp. 149–152; projective Hom comparison in the proof of Proposition 10.2.1, p. 175. Completeness lifts idempotents and projectives; projective Hom reduction is an idempotent-summand argument.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-projective-character-vanishing"></a>

#### Projective characters vanish on p-singular elements

**Declaration:** `TauCeti.GL2Transfer.projective_character_vanishing`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/projective-character-vanishing`.

For a splitting p-modular system with R complete and a projective RΓ-lattice P̂, its ordinary character χ vanishes at every g whose order is divisible by p. Moreover the order of a Sylow p-subgroup divides χ(1).

**Hypotheses.**

- Finite Γ; χ valued through compatible cyclotomic roots; projectivity over RΓ.

**Proof or construction.**

1. Restriction to a subgroup preserves projectivity since RΓ is free over its subgroup algebra. For a Sylow p-subgroup, projectives over k₀P are free: the augmentation ideal is nilpotent and the group algebra is local. The unique projective lift is free over RP, yielding the dimension divisibility.
2. For g write ⟨g⟩=⟨s⟩×⟨t⟩ with s prime-to-p and t a nontrivial p-element. The modular indecomposable projectives are S⊗k₀⟨t⟩. The prime-to-p simple S lifts to an R⟨s⟩ projective by averaging, and induction gives its R⟨g⟩ lift.
3. By projective-modular-lift uniqueness all projective summands have this form. The induced-character formula is zero at g, since no conjugate of g lies in ⟨s⟩. Add the summands. The local p-group assertion follows by induction on its order using a central order-p element and its nilpotent (z−1) ideal.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/projective-modular-lift`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`.

**Acceptance checks.**

- For a nontrivial p-group the regular character is zero off 1.
- The trivial module of a p-group is not projective.
- p-singular here means order divisible by p, not only order a power of p.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), Theorem 8.1.1, Lemma 8.1.2 and Corollary 8.1.3, pp. 120–121; Lemma 9.6.2, pp. 163–164. A projective’s degree has the Sylow divisibility and its character is zero whenever the element’s order is divisible by p.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-projective-brauer-hom"></a>

#### Hom dimension as a projective Brauer pairing

**Declaration:** `TauCeti.GL2Transfer.projective_brauer_hom`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/projective-brauer-hom`.

For finite Γ, a splitting field k₀ of characteristic p, a finitely generated projective k₀Γ-module P and a finite-dimensional k₀Γ-module U, dim_k₀ Hom_k₀Γ(P,U)=|Γ|⁻¹Σ_{g p-regular}φ_P(g⁻¹)φ_U(g), for compatible Brauer characters. The same formula holds over an algebraically closed field k of characteristic p.

**Hypotheses.**

- P projective; U arbitrary, not assumed to lift or be semisimple. Choose a complete splitting system and compatible τ for the finite-field case.

**Proof or construction.**

1. P⊗U∨ with diagonal action is projective: tensor a free k₀Γ-module with U∨ and untwist the action on the second tensor factor to exhibit a free module; pass to summands. Current Tau Ceti already supplies the Hom formulation as `Representation.instProjectiveAsModuleLinHom` in `RepresentationTheory/LinHom.lean`; consume that helper when porting. This is a current-library observation, not a pinned-baseline citation.
2. Lift this projective module to Q̂. Projective-modular-lift with target the trivial lattice R shows dim Hom_k₀Γ(P⊗U∨,k₀)=rank Hom_RΓ(Q̂,R). The ordinary characteristic-zero character inner product computes that rank.
3. projective-character-vanishing deletes the p-singular terms. On p-regular elements the ordinary character of Q̂ is φ_P(g)φ_U(g⁻¹), by the root reduction and tensor/dual Brauer API. Replace g by g⁻¹ and use Hom(P⊗U∨,k₀)≅Hom(P,U).
4. For arbitrary algebraically closed k, projectives and simples are obtained by scalar extension from a finite splitting field. The formula is additive in U, by exactness of Hom(P,−) and the Brauer short-exact-sequence API. A composition series therefore reduces the calculation to simple U; use split-simple-scalar-extension and Hom base change. No arbitrary-k lift of U is asserted.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/projective-modular-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/projective-character-vanishing`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/split-simple-scalar-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-field-simple-descent`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`.

**Acceptance checks.**

- For P=k₀Γ, the sum is dim U.
- For P a projective cover and U simple the result is δ after invoking the separate split Hom contract.
- Without projectivity the formula is not asserted.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), Proposition 8.1.4, pp. 121–122; Proposition 10.2.1 and proof, pp. 174–175. The projective tensor-dual lifts even when U does not; characteristic-zero averaging and p-singular vanishing give the Hom formula.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-brauer-class-count"></a>

#### Brauer’s p-regular class-count theorem

**Declaration:** `TauCeti.GL2Transfer.brauer_class_count`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-class-count`.

For a finite group Γ and a splitting field k of characteristic p, the number of isomorphism classes of simple kΓ-modules equals the number of p-regular conjugacy classes.

**Hypotheses.**

- Finite Γ; split kΓ; no p-solvability or Maschke hypothesis.

**Proof or construction.**

1. Let A=kΓ, S the vector span of commutators ab−ba, and T={a:a^(pⁿ)∈S for some n}. Modulo S, taking p-th powers is additive and Frobenius-semilinear, so T is a vector subspace. S is not treated as an ideal.
2. The nilpotent radical J lies in T. Powering again kills a possible error in J, so T/J is exactly the analogous subspace in A/J. In each split matrix block, trace(a^(pⁿ))=trace(a)^(pⁿ), hence that subspace is the trace-zero hyperplane. Thus codim T is the number of simple blocks.
3. For g=st, with s p-regular and t of p-power order commuting with s, (g−s)^(pⁿ)=0 for sufficiently large n. Thus p-regular conjugacy representatives span A/T. For independence choose n sufficiently large, with pⁿ≡1 modulo the prime-to-p exponent; a relation powered into S has the same class representatives with nonzero coefficients raised to pⁿ. The description of S by zero coefficient-sum on each conjugacy class rules it out. Consequently codim T is the number of p-regular classes.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`, `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness`, `mathlib:IsArtinianRing.isNilpotent_jacobson_bot`.

**Acceptance checks.**

- A p-group has one simple and one p-regular class.
- If p∤|Γ| all classes are p-regular.
- For S₃ at p=2 there are two such classes, hence two simples.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), Lemmas 9.3.1–9.3.5 and Theorem 9.3.6, pp. 145–147. A commutator-span and p-power calculation equates the split semisimple block count with the p-regular class count.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

### p-rationality and the strengthened lifting induction

<a id="r17-5-p-rational-character"></a>

#### p-rational characters

**Declaration:** `TauCeti.GL2Transfer.isPRational`; definition; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-rational-character`.

For finite Γ and prime p, put r=|Γ|/p^{v_p(|Γ|)}. Define IsPRational(p,χ) by χ(g)∈Q(μ_r)⊂C for every g∈Γ. For ordinary characters, whose values already lie in Q(μ_|Γ|), this agrees with Isaacs’s condition that all values lie in some cyclotomic field of conductor prime to p. It is equivalently invariance under Gal(Q(μ_|Γ|)/Q(μ_r)). The light predicate is defined for any function Γ→C; the equivalences involving ordinary characters require that input.

**Hypotheses.**

- Γ finite; p prime; χ an ordinary character for the cyclotomic/Galois compatibility assertion.

**Proof or construction.**

1. Use the prime-to-p complement of |Γ| and the intermediate field generated by its complex roots of unity to define the value-membership predicate.
2. Ordinary character values lie in Q(μ_|Γ|) by finite-order eigenvalues. The cyclotomic fixed-field description gives the Galois characterisation; intersection with a field of prime-to-p conductor removes the p-power cyclotomic part. This exact character-field adapter is requested from InductionRestriction Part II.

**Direct prerequisites.** `mathlib:Nat.factorization`, `mathlib:IntermediateField.adjoin`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

**Uses.**

- `GL2AutomorphicRepresentationsAndTransfer:R17.5/coprime-index-lift-correspondence` — Galois invariance and uniqueness preserve the p-rational lift.
- `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-rational-p-group-extension` — The odd-p cyclotomic action selects the unique p-rational constituent.
- `GL2AutomorphicRepresentationsAndTransfer:R17.5/equivariant-fong-swan` — The induction constructs a p-rational ordinary lift for every prime.
- `GL2AutomorphicRepresentationsAndTransfer:R17.5/fong-swan` — Odd-p uniqueness compares p-rational lifts, including their normal-subgroup constituents.

**Planning API.**

- `TauCeti.GL2Transfer.isPRational` (data) — The predicate on functions Γ→C given by value membership in Q(μ_r), with r the prime-to-p part of |Γ|.
- `TauCeti.GL2Transfer.isPRational_iff_forall_mem` (characterisation) — IsPRational(p,χ) iff every χ(g) belongs to the indicated intermediate field; no irreducibility is required.
- `TauCeti.GL2Transfer.isPRational_iff_galois_fixed` (compatibility) — For an ordinary character, IsPRational iff every automorphism of Q(μ_|Γ|) fixing Q(μ_r) fixes every character value. The ordinary-character cyclotomic-value hypothesis is required.
- `TauCeti.GL2Transfer.isPRational_precomp_mulAut` (structure) — Precomposing χ with an automorphism of Γ preserves and reflects IsPRational.

**Unit tests.**

- `TauCeti.GL2Transfer.isPRational_trivial_test` (degenerate) — The constant rank-one trivial character is p-rational for every finite group and every prime.
- `TauCeti.GL2Transfer.isPRational_sign_two_test` (computation) — At p=2 both ordinary characters of C₂, including the sign character, are 2-rational: their values are rational. Thus p-rationality alone does not give unique lifts at p=2.
- `TauCeti.GL2Transfer.isPRational_odd_prime_test` (non-example) — For odd p a nontrivial linear character of C_p is not p-rational: its primitive p-th root value is not rational, whereas r=1.
- `TauCeti.GL2Transfer.isPRational_coprime_cyclic_test` (compatibility) — If ℓ is prime and ℓ≠p, every linear character of C_ℓ is p-rational, since r=ℓ and all values are ℓ-th roots.

**Acceptance checks.**

- The two C₂ characters are both admitted at p=2.
- At odd p only the trivial linear character of C_p is admitted.

**Sources.**

- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), Definition 1.1, p. 171; cyclotomic Galois notation in §4, p. 177. p-rational ordinary characters have values in a cyclotomic field of conductor prime to p. The fixed-field formulation is the one used by the extension and uniqueness proofs.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-modular-clifford-correspondence"></a>

#### Modular Clifford correspondence

**Declaration:** `TauCeti.GL2Transfer.modular_clifford_correspondence`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/modular-clifford-correspondence`.

Let N◁Γ be finite and k algebraically closed of arbitrary characteristic. If S is simple over kN and T its inertia group, induction gives a bijection from simple kT-modules whose N-restriction is S-isotypic to simple kΓ-modules whose N-restriction contains S. Restriction of a simple Γ-module to N is semisimple with equally repeated conjugate simples, and the T-module is its S-isotypic component.

**Hypotheses.**

- N normal; simple modules finite-dimensional; characteristic may divide |Γ|.

**Proof or construction.**

1. The N-socle of a simple Γ-module is nonzero and Γ-stable, so equals the whole module. Its isotypic summands are permuted transitively, with equal multiplicities; this restriction statement is already R01.1/clifford-isotypic-decomposition.
2. The S-isotypic component is T-stable. Translating it along Γ/T gives the direct sum of distinct isotypic components and identifies its induction with the original module.
3. Conversely restrict an induced S-isotypic T-simple to N: any Γ-submodule is a semisimple N-submodule and its isotypic components intersect the original T-summand. If nonzero, transitivity and T-simplicity force all summands. The two constructions are inverse. No average over Γ or Maschke argument is used.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1/clifford-isotypic-decomposition`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-0-the-functorial-core----transitivity-and-the-projection-formula`.

**Acceptance checks.**

- For N={1}, T=Γ and the correspondence is the identity.
- For N=Γ it is the identity on its chosen simple.
- The hypothesis p∤|Γ| is absent.

**Sources.**

- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), Lemma 5.1, pp. 178–179; §2 Clifford restriction usage, p. 173. The Brauer inertia correspondence is the module-theoretic Clifford correspondence without a semisimplicity hypothesis on kΓ.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-coprime-index-lift-correspondence"></a>

#### Lifting correspondence at prime-to-p index

**Declaration:** `TauCeti.GL2Transfer.coprime_index_lift_correspondence`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/coprime-index-lift-correspondence`.

Let N◁Γ with p∤[Γ:N]. Let θ be an irreducible ordinary character of N, with θ*=μ an irreducible Brauer character, and suppose μ^g=μ implies θ^g=θ. Then χ↦χ* is a bijection between ordinary irreducibles lying over θ and Brauer irreducibles lying over μ. If θ is p-rational, all those χ are p-rational.

**Hypotheses.**

- θ* denotes restriction to p-regular elements with fixed compatible root identification; inertia equality is required.

**Proof or construction.**

1. Induction of a simple N-module is semisimple at prime-to-p index: an N-equivariant splitting can be averaged over Γ/N and divided by its invertible order. This yields Frobenius reciprocity for the constituent multiplicities (Isaacs 2.2).
2. Expand θ^Γ and μ^Γ into constituents, using ordinary and modular Clifford equal multiplicities. Nonnegative decomposition numbers dχφ give bφ=Σχ aχdχφ and aχ=Σφ dχφbφ. Substitution forces each row to have exactly one nonzero entry equal to 1, with disjoint supports; all constituents over μ occur. Brauer independence used here is brauer-character-recognition.
3. If θ is p-rational, a Galois automorphism fixing the prime-to-p cyclotomic field leaves θ and every Brauer restriction fixed. Uniqueness in this bijection forces each χ to be fixed.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/modular-clifford-correspondence`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-rational-character`.

**Acceptance checks.**

- When N=Γ it returns θ and μ.
- Dropping inertia equality is not allowed.
- This is not the usual characteristic-zero Frobenius inner product for arbitrary modular induction.

**Sources.**

- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), Theorem 2.2, pp. 173–174; Theorem 3.1 and proof, pp. 174–175; Corollary 5.2, p. 179. Prime-to-p index and equality of inertia groups give the ordinary/Brauer bijection and the p-rational consequence.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-p-group-index-lift-comparison"></a>

#### Lift comparison across a p-group quotient

**Declaration:** `TauCeti.GL2Transfer.p_group_index_lift_comparison`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-group-index-lift-comparison`.

Let N◁Γ with Γ/N a p-group, θ∈Irr(N), T its inertia group, and η∈Irr(T) an extension of θ. Assume θ*=μ∈IBr(N) and μ^g=μ implies g∈T. Then (Ind_T^Γη)* is the unique irreducible Brauer character of Γ lying over μ.

**Hypotheses.**

- The quotient is a p-group, not just an index divisible by p; extendibility to T is an explicit hypothesis.

**Proof or construction.**

1. Ordinary Clifford identifies the induced ordinary irreducible and its restriction as the sum of distinct conjugates of θ. Modular Clifford gives restriction of any simple over μ as e times the same sum of conjugates of μ.
2. Every p-regular element of Γ lies in N, because its image in the p-group quotient is trivial. Thus the full Brauer character equals e times the restriction of the induced ordinary character.
3. The latter is itself a nonzero nonnegative integral combination of simple Brauer characters (reduce a stable lattice). Comparing multiplicities with a single simple forces e=1 and proves uniqueness.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/modular-clifford-correspondence`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

**Acceptance checks.**

- For N=Γ the comparison is immediate.
- For quotient C_p all p-regular elements are in N.
- Existence of the extension η is proved by the next targets, not assumed automatically.

**Sources.**

- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), Lemma 4.1 and proof, pp. 175–176. The p-group quotient places all p-regular elements in N and forces the induced lift’s restriction to be the single desired Brauer character.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-determinant-order-extension"></a>

#### Gallagher’s determinant-order extension

**Declaration:** `TauCeti.GL2Transfer.determinant_order_extension`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/determinant-order-extension`.

If N◁Γ, Γ/N is a p-group and θ∈Irr(N) is Γ-invariant with p∤θ(1) and p∤o(θ), then θ has a unique extension χ∈Irr(Γ) with p∤o(χ). Here o is the order of the determinant character. If θ is p-rational, so is χ.

**Hypotheses.**

- Finite Γ; invariant θ; both degree and determinant order prime to p. No odd-p hypothesis.

**Proof or construction.**

1. For index p, ordinary cyclic-quotient extension is an exact InductionRestriction Part II input: for an invariant irreducible of N and cyclic Γ/N, choose an intertwiner for a generator and rescale its central scalar using a root in C; this makes its power agree with the N-action. Let η be an extension and m=o(θ). The p-part of det η is killed by twisting η by a suitable power of (det η)^m, which factors through Γ/N. Choose b with θ(1)mb≡−1 mod p.
2. Any other extension is η times a linear character of the p-quotient; since its degree is prime to p, a nontrivial twist gives determinant with nontrivial p-part. This proves uniqueness.
3. For a larger p-quotient choose a central order-p subgroup, extend to its preimage and use uniqueness to retain Γ-invariance; induct on the quotient. Galois conjugation preserves determinant order, so uniqueness also proves p-rationality.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-rational-character`.

**Acceptance checks.**

- For θ=1 the normalized extension is 1.
- For p=2 the theorem still applies.
- A nontrivial linear twist of a p-quotient violates the determinant-order normalization.

**Sources.**

- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), Theorem 4.2, p. 176; Corollary 4.7, p. 178. The determinant normalization supplies the extension used in the all-prime strengthened induction.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-p-rational-p-group-extension"></a>

#### Unique p-rational constituents over p-group quotients

**Declaration:** `TauCeti.GL2Transfer.p_rational_p_group_extension`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-rational-p-group-extension`.

For odd p, N◁Γ with Γ/N a p-group and p-rational θ∈Irr(N), Ind_N^Γθ has exactly one p-rational irreducible constituent χ. If θ*=μ is irreducible and μ^g=μ implies θ^g=θ, then χ* is the unique irreducible Brauer character of Γ over μ. In particular an invariant θ has a unique p-rational extension.

**Hypotheses.**

- p odd; p-rational means values lie in Q(ζ_r), where r is the prime-to-p part of |Γ|; equivalently fixed by Gal(Q(ζ_|Γ|)/Q(ζ_r)).

**Proof or construction.**

1. In the invariant index-p case take an ordinary extension η. A generator σ of the p-power cyclotomic Galois group satisfies η^σ=λη for a quotient linear character λ. At odd p its action on μ_p is nontrivial. A power of λ therefore twists η to a σ-fixed extension. The same nontrivial action makes it unique.
2. Induct through a central order-p subgroup of Γ/N. In the general non-invariant case pass to the ordinary inertia group and use ordinary Clifford correspondence. Induction preserves p-rationality; for the converse in the correspondence both θ and the induced character are fixed by σ, so uniqueness of the inertia correspondent fixes it too.
3. Under the Brauer hypotheses apply p-group-index-lift-comparison. This target, together with the prime-to-p-index correspondence, supplies the restriction/uniqueness induction in Isaacs §6, not merely existence.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-group-index-lift-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-rational-character`.

**Acceptance checks.**

- At p=2 and Γ=C₂, both ordinary linear characters are 2-rational and reduce to the same Brauer character; uniqueness fails.
- N=Γ returns θ.
- No prime-to-p degree assumption is made in this odd-p target.

**Sources.**

- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), Theorem 4.3, pp. 177–178; Lemma 4.4 and Theorem 4.5, p. 178. Odd p allows the unique p-rational extension and unique p-rational constituent, with the Brauer comparison under its inertia hypotheses.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-equivariant-fong-swan"></a>

#### Automorphism-equivariant strengthened Fong–Swan theorem

**Declaration:** `TauCeti.GL2Transfer.equivariant_fong_swan`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/equivariant-fong-swan`.

For finite p-solvable Γ and φ∈IBr(Γ), there is a p-rational χ∈Irr(Γ) with χ*=φ and χ^a=χ for every a∈Aut(Γ) with φ^a=φ. If p divides φ(1), there exists a characteristic subgroup N of Γ for which the number of distinct simple constituents of φ_N is divisible by p.

**Hypotheses.**

- All primes p, including 2; p-solvable means a normal series with p-group or prime-to-p factors; χ and φ use compatible τ. The degree assertion is an implication, not its converse.

**Proof or construction.**

1. Induct simultaneously on the full stated assertion. If a characteristic N has a p-divisible number of constituents, modular Clifford passes to its proper inertia group. Induct there and induce the ordinary lift. An automorphism fixing φ permutes its N-constituents; compose it with an inner conjugation to fix the chosen constituent and inertia correspondent. The induction hypothesis then fixes the induced lift.
2. Otherwise every proper characteristic M has constituents μ of prime-to-p degree, by the strengthened inductive degree clause. Their chosen lifts θ are p-rational, equivariant, and have prime-to-p degree; the number of conjugates is prime to p.
3. If O^p(Γ)<Γ, use M=O^p(Γ). Its p-group quotient and the prime-to-p orbit make θ invariant. Since O^p(M)=M, M has no nontrivial p-group quotient; its determinant character has prime-to-p order. Apply determinant-order-extension and p-group-index-lift-comparison. Uniqueness gives equivariance and p-rationality.
4. Otherwise O^{p′}(Γ)<Γ by p-solvability. Use the coprime-index-lift-correspondence and its p-rational consequence. Its uniqueness gives equivariance after adjusting by conjugation. The ordinary Clifford relative-degree divisibility χ(1)/θ(1) | [Γ:M] gives prime-to-p degree; this ordinary theorem is an explicit InductionRestriction Part II request. Thus in this second case p∤φ(1), completing the degree implication.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/modular-clifford-correspondence`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/coprime-index-lift-correspondence`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-group-index-lift-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/determinant-order-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-rational-character`.

**Acceptance checks.**

- For a p-group φ=1 and χ=1 works even at p=2.
- If p divides the Brauer degree, the characteristic-subgroup clause must be retained.
- Equivariance requires the characteristic, rather than merely normal, choice of subgroup.

**Sources.**

- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), Theorem 5.4 and full proof, pp. 179–180. The induction preserves an automorphism stabilizer and the characteristic-subgroup degree alternative; these are necessary for its second case.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

### Every-place Artin comparison

<a id="r17-5-gl2-twist-stability"></a>

#### Stability of GL₂ factors under highly ramified twists

**Declaration:** `TauCeti.GL2Transfer.gl2_twist_stability`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/gl2-twist-stability`.

Let F be a nonarchimedean local field of characteristic zero, ψ a nontrivial additive character of F, and π an irreducible admissible representation of GL₂(F) with central character ω_π. For a quasi-character χ of F^× write c(χ) for its conductor exponent. (i) There is an integer m(π) such that L(s, χ⊗π) = L(s, χ⁻¹⊗π̃) = 1 whenever c(χ) > m(π). (ii) If π₁ and π₂ are irreducible admissible representations with the same central character, there is an integer m such that ε(s, χ⊗π₁, ψ) = ε(s, χ⊗π₂, ψ) whenever c(χ) > m; with (i) this gives γ(s, χ⊗π₁, ψ) = γ(s, χ⊗π₂, ψ) for such χ, where γ(s, χ⊗π, ψ) = ε(s, χ⊗π, ψ)L(1−s, χ⁻¹⊗π̃)/L(s, χ⊗π). (iii) More precisely, for any factorisation ω_π = μ₁μ₂ into quasi-characters, ε(s, χ⊗π, ψ) = ε(s, χμ₁, ψ)ε(s, χμ₂, ψ) once c(χ) is large compared with π, c(μ₁) and c(μ₂); the right side is a product of Tate's GL₁ constants and depends on π only through ω_π. The bound m depends on π₁, π₂ and ψ, not on χ.

**Hypotheses.**

- F is a finite extension of Q_p; ψ: F → C^× is a nontrivial continuous additive character.
- π, π₁, π₂ are irreducible admissible representations of GL₂(F); in (ii) ω_{π₁} = ω_{π₂}.
- The local factors L, ε and γ are those of Jacquet–Langlands §2–§3 (equivalently Godement–Jacquet for n = 2), in the normalisation fixed by R16.3.
- c(χ) is the conductor exponent of AL.1/local-quasicharacter-conductor; 'sufficiently ramified' means c(χ) larger than an explicit bound depending on π (and on ψ through its conductor).

**Proof or construction.**

1. One-dimensional and principal-series representations: L(s, χ⊗π(μ₁, μ₂)) = L(s, χμ₁)L(s, χμ₂) and ε(s, χ⊗π(μ₁, μ₂), ψ) = ε(s, χμ₁, ψ)ε(s, χμ₂, ψ) (R16.3/principal-series-parameter and the Jacquet–Langlands product formula); once c(χ) exceeds c(μ₁) and c(μ₂), both χμᵢ are ramified, so the L-factors are 1 (AL.1/ramified-local-theory) and the ε-factor is the stated product. Twists of Steinberg are constituents of a reducible principal series and have the same twisted factors as it for highly ramified χ (JL70 p. 58, reduction step).
2. Supercuspidal π: L(s, χ⊗π) = 1 for every χ (R16.2/local-classification and R16.3/supercuspidal-parameter). For the ε-factor, JL70 compute ε(s, χ⊗π, ψ) through the Kirillov model (R16.2/supercuspidal-kirillov): for c(χ) large the Mellin transform of a vector supported near 1 only sees the central character, which yields the product ε(s, χμ₁, ψ)ε(s, χμ₂, ψ) for any μ₁μ₂ = ω_π (JL70 Proposition 3.8, proof).
3. (ii) follows from (iii) applied to π₁ and π₂ with the same factorisation of the common central character, and (i).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors`, `AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor`.

**Acceptance checks.**

- For π = π(μ₁, μ₂) a ramified principal series and χ with c(χ) > max(c(μ₁), c(μ₂)), the twisted L-factor is 1 and ε(s, χ⊗π, ψ) is the product of the two Tate constants.
- Two supercuspidal representations with the same central character have equal twisted γ-factors for all sufficiently ramified χ, although they need not be isomorphic: stability alone never distinguishes them (non-example for using stability as a converse theorem).
- The hypothesis on central characters is necessary in (ii): for π an unramified principal series and η an unramified character with η² ≠ 1, the highly ramified ε-factors of χ⊗(π⊗η) and χ⊗π differ by the factor η²(ϖ)^{c(χ)+n(ψ)} (n(ψ) the conductor exponent of ψ), which is not 1 for suitable large c(χ).

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §3, Proposition 3.8 (i)–(iii), printed pp. 57–58 (PDF pp. 63–64 of the IAS edition). Jacquet–Langlands prove that for every irreducible π the twisted L-factors are 1 once the order of χ is large, that two representations with the same central character have equal twisted ε-factors for such χ, and the product formula for ε in terms of any factorisation of the central character; the statement here is theirs in the γ-factor form used by the isolation argument.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, proof of Theorem 12.2, printed p. 211 (PDF p. 217). The isolation argument invokes Proposition 3.8 exactly in this way: at the auxiliary places the highly ramified twist makes the L-factors trivial and the ε-factor depend only on the central character.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-gl2-local-converse"></a>

#### The GL₂ local converse theorem

**Declaration:** `TauCeti.GL2Transfer.gl2_local_converse`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/gl2-local-converse`.

Let F be a nonarchimedean local field of characteristic zero and ψ a nontrivial additive character. Let π and π′ be irreducible infinite-dimensional admissible representations of GL₂(F) with the same central character. Then π ≅ π′ if and only if γ(s, χ⊗π, ψ) = γ(s, χ⊗π′, ψ) for every quasi-character χ of F^×. Equivalently, without the central-character hypothesis, π ≅ π′ as soon as L(s, χ⊗π) = L(s, χ⊗π′) and ε(s, χ⊗π, ψ) = ε(s, χ⊗π′, ψ) for every character χ of F^× (Bushnell–Henniart's form, which also covers one-dimensional representations). It suffices to test χ of finite order with χ(ϖ) = 1 for a fixed uniformiser ϖ: every quasi-character is such a χ times |·|^t, and twisting by |·|^t replaces s by s + t in all three factors.

**Hypotheses.**

- F is a finite extension of Q_p, ψ a nontrivial additive character, ϖ a uniformiser.
- π, π′ are irreducible admissible infinite-dimensional (equivalently generic, R16.2/local-classification) representations of GL₂(F) with ω_π = ω_{π′}.
- γ(s, χ⊗π, ψ) = ε(s, χ⊗π, ψ)L(1−s, χ⁻¹⊗π̃)/L(s, χ⊗π) with the Jacquet–Langlands factors.

**Proof or construction.**

1. The implication from isomorphism to equality of factors is immediate.
2. Converse (JL70 Theorem 2.18 and Corollary 2.19): in the Kirillov model both representations are realised on spaces containing C_c^∞(F^×); the local functional equation of Theorem 2.18(iv) expresses the action of the Weyl element on C_c^∞(F^×) through the twisted γ-factors, by Mellin inversion over the characters of O_F^× and the variable s. Equal γ-factors and equal central characters therefore give the same action of the Borel subgroup and of the Weyl element on the common subspace, which generates; so π ≅ π′.
3. Reduction to finite-order twists with χ(ϖ) = 1: a quasi-character χ equals χ₀|·|^t with χ₀(ϖ) = 1 and χ₀ of finite order on O_F^× (it is continuous on a profinite group), and γ(s, χ₀|·|^t⊗π, ψ) = γ(s + t, χ₀⊗π, ψ).
4. Bushnell–Henniart prove the version with L and ε (27.1): by 27.2 a representation is cuspidal exactly when all its twisted L-factors are 1, so equal twisted factors separate cuspidal from non-cuspidal representations; non-cuspidal ones are then recovered from their principal-series parameters, and cuspidal ones from their types through Gauss sums (27.8).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors`.

**Acceptance checks.**

- For π = π(μ₁, μ₂) and π′ = π(μ₁′, μ₂′) irreducible principal series with equal central characters, equal twisted γ-factors force {μ₁, μ₂} = {μ₁′, μ₂′}: twist by χ = μ₁⁻¹ and compare the zero of 1/L(s, χ⊗π) at s = 0.
- For η the unramified quadratic character, π and π⊗η have the same central character and γ(s, χ⊗π⊗η, ψ) = γ(s + πi/log q, χ⊗π, ψ); the criterion says π ≅ π⊗η exactly when every twisted γ-factor is invariant under this shift of s, which holds for the supercuspidal representations induced from the unramified quadratic extension and fails for unramified principal series π(μ, ν) with {μη, νη} ≠ {μ, ν}.
- A one-dimensional representation χ∘det is excluded from the γ-form (not generic), but is covered by Bushnell–Henniart's L-and-ε form.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §2, Corollary 2.19, printed pp. 39–40 (PDF pp. 45–46). Jacquet and Langlands prove that, for infinite-dimensional irreducible representations sharing a central character, agreement of all character twists of the γ-factor forces equivalence; this node is that corollary.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §2, Theorem 2.18, printed p. 37 (PDF p. 43). The local functional equation in the Kirillov model on which the corollary rests.
- [Colin J. Bushnell and Guy Henniart, The Local Langlands Conjecture for GL(2)](https://doi.org/10.1007/3-540-31511-X), §27.1, Converse Theorem, printed p. 170; §27.2 Proposition, p. 170; §27.8, pp. 175–176. Bushnell and Henniart's converse theorem: irreducible smooth representations of GL₂(F) with the same twisted L- and ε-factors for every character are isomorphic; 27.2 identifies cuspidal representations as those all of whose twisted L-factors are trivial.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-isolating-twist-character"></a>

#### A global twist with one prescribed component and high ramification elsewhere

**Declaration:** `TauCeti.GL2Transfer.isolating_twist_character`; lemma; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/isolating-twist-character`.

Let F be a number field, S a finite set of finite places, v₀ ∈ S, χ₀ a quasi-character of F_{v₀}^×, and (m_v)_{v ∈ S∖{v₀}} nonnegative integers. There is a quasi-character ω of the idele class group C_F = F^×\A_F^× whose component at v₀ is χ₀ and whose component ω_v at each v ∈ S∖{v₀} is nontrivial on U_v^{m_v}, where U_v^0 = O_v^× and U_v^m = 1 + 𝔭_v^m for m ≥ 1, so that c(ω_v) > m_v. Nothing is imposed at the other places; ω has finite order on the units at every finite place but need not have finite order globally. This is Jacquet–Langlands's Lemma 12.5, which is the only global character input of the all-place upgrade; the finite-order prescription at several places (Chevalley's congruence theorem) is not needed for it.

**Hypotheses.**

- F is a number field; S is a finite set of finite places; v₀ ∈ S.
- χ₀: F_{v₀}^× → C^× is a continuous quasi-character; m_v ≥ 0 are integers for v ∈ S∖{v₀}.
- c(χ) is the least m ≥ 0 such that χ is trivial on U_v^m, with U_v^0 = O_v^× and U_v^m = 1 + 𝔭_v^m for m ≥ 1.

**Proof or construction.**

1. Reduce to a unitary χ₀: write χ₀ = |·|^r χ₀′ with χ₀′ unitary and multiply the character obtained for χ₀′ by |·|_A^r.
2. Use isolation-subgroup-topology to identify F×A with the closed topological product F×_discrete×A. The compact norm slabs A_ε control the inverse as well as closedness.
3. Choose a continuous unitary character of A equal to the unitary χ₀ at v₀ and nontrivial on each U_v^{m_v} at the other places. The latter compact groups have nontrivial finite quotients. Extend by 1 on F^×, using isolation-subgroup-topology, then extend this character from the closed subgroup F^×A to the idele group by idele-character-extension. The exact idele instance is proved through the real/compact/open extension targets, with CompactGroups supplying Peter–Weyl; GlobalNumberFields Layer 9 is not assigned an unstated extension theorem. The resulting character descends to C_F (JL70 p. 211). For the strict conductor bound in this statement one can also apply the printed Lemma 12.5 with bounds m_v+1.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/isolation-subgroup-topology`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/idele-character-extension`.

**Acceptance checks.**

- With S = {v₀} the lemma only asks for a Hecke character with prescribed component at one place.
- For F = Q, S = {p} and χ₀ unramified with χ₀(p) = −1, the unitary unramified character ω = |·|_A^{iπ/log p} is admissible; it has infinite order, so the lemma is not a statement about finite-order characters.
- For m_v = 0, nontriviality is on O_v^×; the set 1 + O_v is not used as a multiplicative subgroup. In the Lean witness, require both valuation(u)=1 and valuation(u−1)≤q_v^(-m_v).

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, Lemma 12.5 and its proof, printed pp. 210–211 (PDF pp. 216–217). Jacquet and Langlands construct a quasi-character of C_F with prescribed component at one place of S and conductor exponent greater than m_v at each of the others, by extending a character from the closed subgroup F^×A.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3, Lemma 3.2, DMA text p. 15 (PDF p. 18). Langlands records a variant prescribing approximate archimedean components as well, without proof; the archimedean variant is not used here because the all-place upgrade assumes archimedean matching.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-artin-twisted-functional-equation"></a>

#### Functional equation of twisted Artin L-functions

**Declaration:** `TauCeti.GL2Transfer.artin_twisted_functional_equation`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-twisted-functional-equation`.

Let F be a number field, ψ = ⊗ψ_v a nontrivial character of A_F/F, and dx = ∏dx_v the Tamagawa measure. Let ρ: G_F → GL_n(C) be continuous with finite image and ω a continuous quasi-character of C_F. At each place put V_v = ρ|_{W_{F_v}} ⊗ (ω_v ∘ Art_v⁻¹), where Art_v sends a uniformiser to geometric Frobenius and its inverse is read on the abelianisation. Define Λ(s,ρ⊗ω) by the product of these local L-factors, including the archimedean Γ-factors. It converges in a right half-plane, continues meromorphically, and satisfies Λ(s,ρ⊗ω) = ε(s,ρ⊗ω) Λ(1−s,ρ∨⊗ω⁻¹), with ε(s,ρ⊗ω) = ∏_v ε(s,V_v,ψ_v,dx_v). Almost all local constants equal 1, and the product is independent of the choice of ψ on A_F/F. No holomorphy is asserted. The notation ρ⊗ω denotes this compatible family of local twists, without requiring a global Weil group.

**Hypotheses.**

- F is a number field; ρ: G_F → GL_n(C) is a continuous homomorphism; ω: A_F^×/F^× → C^× is a continuous quasi-character.
- Local reciprocity uses geometric Frobenius. For each finite Galois extension K/F, finite global Artin reciprocity turns a finite Galois character of G_K into a finite-order Hecke character compatibly with the local maps and norms; invert the arithmetic Artin map if necessary.
- Local constants: Deligne's ε(V_v, ψ_v, dx_v) at finite places (R01.2/local-epsilon-factor) and the archimedean constants of AL.1 and R16.3/archimedean-factor-comparison.

**Proof or construction.**

1. ρ factors through G = Gal(L/F) for a finite Galois L/F (R01.1/finite-galois-factorisation). By Brauer's induction theorem (Tau Ceti InductionRestriction, Layer 6) the character of ρ is an integral combination Σ nᵢ Ind_{Hᵢ}^{G} θᵢ of characters induced from linear characters θᵢ of subgroups Hᵢ = Gal(L/Kᵢ).
2. For each θᵢ use finite global Artin reciprocity to obtain a finite-order Hecke character ηᵢ of C_{Kᵢ}, with the geometric convention. Twist ηᵢ by ω∘N_{Kᵢ/F}. The projection formula for finite-group induction, followed by local restriction and reciprocity, identifies the associated local virtual representations with the local twists of ρ. No induction between global Weil groups is used.
3. preliminary-artin-functional-equation gives meromorphy and the nonzero exponential functional-equation factor by Brauer and Hecke theory, independently of local epsilon existence. The finite Galois and norm-twist dictionaries use no global Weil group.
4. Use R01.2/local-epsilon-factor only after its global input is retargeted to preliminary-artin-functional-equation. Conditional on the recorded G2 product proof, global-induction-constant-product supplies the λ correction and identifies E_pre with the product of local constants via Brauer induction. Determinant and norm product formulas prove independence under ψ↦ψ(a·), a∈F×. The conductor-normalized automorphic completion is converted to raw local factors before cancellation.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1/finite-galois-factorisation`, `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`, `ArithmeticGaloisRepresentations:R01.2/local-factor-of-induced-representation`, `ArithmeticGaloisRepresentations:R01.2/local-euler-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/preliminary-artin-functional-equation`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/global-induction-constant-product`.

**Acceptance checks.**

- For ρ trivial of dimension one the statement is Hecke–Tate's functional equation for Λ(s, ω).
- For ρ = Ind_{G_K}^{G_F}1 and ω = 1 the completed function is the completed Dedekind zeta function of K, with poles at 0 and 1. Thus meromorphy cannot be strengthened to holomorphy. For a norm-power twist |·|^t these poles shift to −t and 1−t; arbitrary quasi-characters are not restricted to imaginary norm powers.
- For a two-dimensional dihedral ρ = Ind θ the equation coincides with that of the Hecke L-function of θ·(ω∘N), consistent with JL70 Proposition 12.1.

**Sources.**

- [Pierre Deligne, Les constantes des équations fonctionnelles des fonctions L](https://publications.ias.edu/sites/default/files/Number20.pdf), §3.12(A)–(C), printed p. 533 (PDF p. 33). Finite-image representations twisted by quasi-characters have continuation and a preliminary functional equation via Brauer induction and the one-dimensional case, before the local-constant theorem. This separates the global input used in local existence from the final product formula.
- [Pierre Deligne, Les constantes des équations fonctionnelles des fonctions L](https://publications.ias.edu/sites/default/files/Number20.pdf), §4, Théorème 4.1 (1)–(4), printed p. 535 (PDF p. 35). Existence and uniqueness of local constants that are multiplicative in exact sequences, scale with the measure, are inductive in degree zero and equal Tate's constants for characters.
- [Pierre Deligne, Les constantes des équations fonctionnelles des fonctions L](https://publications.ias.edu/sites/default/files/Number20.pdf), §5, 5.11 (5.11.1)–(5.11.3), printed p. 551 (PDF p. 51). For a representation of the global Weil group, the global L-function and the product of local constants satisfy the functional equation; Deligne derives it from the preceding local results and the classical arguments (Brauer induction, Hecke).
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, proof of Theorem 12.2, printed pp. 208–210 (PDF pp. 214–216). Jacquet and Langlands use this functional equation for ω⊗σ with σ a two-dimensional Weil-group representation, with ε given by the product of local constants, in the isolation argument.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-artin-all-place-upgrade"></a>

#### From weak Artin matching to matching at every place

**Declaration:** `TauCeti.GL2Transfer.artin_all_place_upgrade`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-all-place-upgrade`.

Let F be a number field, ρ: G_F → GL₂(C) continuous, restricted locally to W_{F_v}, and π a cuspidal automorphic representation of GL₂(A_F). For each place v let π(ρ_v) be the irreducible generic representation of GL₂(F_v) whose unitary R16.3 parameter rec (geometric reciprocity) (AF.1 at archimedean v) is ρ|_{W_{F_v}}. Suppose there is a finite set T of finite places such that π_v ≅ π(ρ_v) for every finite v ∉ T and for every archimedean v. Then π_v ≅ π(ρ_v) for every place v. In particular the central character of π is det ρ (read through geometric reciprocity), and for every quasi-character χ of C_F and every place v the local factors agree: L(s, π_v⊗χ_v) = L(s, ρ_v⊗χ_v) and ε(s, π_v⊗χ_v, ψ_v) = ε(s, ρ_v⊗χ_v, ψ_v); in particular L(s, π⊗χ) = L(s, ρ⊗χ) for the completed L-functions, which are therefore entire when ρ is irreducible. The archimedean hypothesis cannot be dropped from this argument: it is what lets the archimedean factors cancel (Langlands's unproved Lemma 3.2 would be needed otherwise).

**Hypotheses.**

- F is a number field; ρ: G_F → GL₂(C) is continuous (finite image); π is cuspidal automorphic on GL₂(A_F).
- π(ρ_v) uses the unitary correspondence rec of R16.3 (AF.1 at infinity), with geometric reciprocity, unshifted standard factors and det rec(π_v) corresponding to the central character. Do not use recᵀ = rec ⊗ ν⁻¹/² here: it shifts the L-variable and determinant. Since ρ_v has bounded image and N = 0, its unitary correspondent is tempered and generic.
- T is a finite set of finite places; π_v ≅ π(ρ_v) for all finite v ∉ T and all archimedean v.

**Proof or construction.**

1. Central characters. ω_π and det ρ (a quasi-character of C_F by reciprocity) agree at every v ∉ T, because the correspondence matches central characters with determinants. Their quotient is a Hecke character trivial on F_v^× for all v ∉ T; as F^× is dense in ∏_{v ∈ T}F_v^× (weak approximation), it is trivial. Hence ω_{π_v} = det ρ_v for every v, including v ∈ T.
2. Fix v₀ ∈ T and a quasi-character χ₀ of F_{v₀}^×. For each v ∈ T∖{v₀}, gl2-twist-stability applied to π_v and π(ρ_v), which have the same central character by the first step, gives a bound m_v. isolating-twist-character supplies ω on C_F with ω_{v₀} = χ₀ and c(ω_v) > m_v for v ∈ T∖{v₀}.
3. π⊗ω is cuspidal, so its completed L-function satisfies the functional equation of R16.5/global-epsilon-normalization with ε the product of local ε-factors (JL70 Theorem 11.1, p. 179); ρ⊗ω satisfies artin-twisted-functional-equation with the same additive character ψ. At every v ∉ T the local L- and ε-factors of π_v⊗ω_v and ρ_v⊗ω_v coincide (hypothesis and the factor compatibilities of R16.3, including R16.3/archimedean-factor-comparison at infinity). Dividing the two functional equations by the common partial L-functions gives ∏_{v ∈ T} γ(s, π_v⊗ω_v, ψ_v) = ∏_{v ∈ T} γ(s, ρ_v⊗ω_v, ψ_v) as meromorphic functions (JL70 p. 210). In R16.5 undo the conductor factor A(π⊗ω)^{s/2} in its completion before forming the product of the raw local constants. For nonunitary ω use the real norm-power shift; this also extends the unitary statement of AL.2/global-godement-jacquet.
4. For v ∈ T∖{v₀}, γ(s, ρ_v⊗ω_v, ψ_v) = γ(s, π(ρ_v)⊗ω_v, ψ_v) by R16.3, and this equals γ(s, π_v⊗ω_v, ψ_v) by gl2-twist-stability. Cancelling leaves γ(s, π_{v₀}⊗χ₀, ψ_{v₀}) = γ(s, π(ρ_{v₀})⊗χ₀, ψ_{v₀}) for the arbitrary χ₀.
5. π_{v₀} is infinite-dimensional (local components of cuspidal representations are generic: R16.4/global-whittaker-expansion), as is π(ρ_{v₀}); their central characters agree; gl2-local-converse gives π_{v₀} ≅ π(ρ_{v₀}). The factor identities follow from R16.3; the global identity follows, and for irreducible ρ the twisted L-functions are entire because L(s, π⊗χ) is the standard L-function of a cuspidal representation of GL₂ (AL.2/global-godement-jacquet).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/isolating-twist-character`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/gl2-twist-stability`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/gl2-local-converse`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-twisted-functional-equation`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/global-epsilon-normalization`, `AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`.

**Acceptance checks.**

- For a dihedral ρ = Ind_{G_K}^{G_F} θ the conclusion recovers the all-place local components of quadratic automorphic induction (JL70 Proposition 12.1), where T can be taken empty.
- With T = {v₀} the stability step is vacuous and the conclusion is the local converse theorem applied to the single quotient of functional equations.
- If the archimedean components were not known to match, the quotient of functional equations would contain archimedean γ-factors that highly ramified finite twists do not control; the hypothesis is used, not decorative.
- Weak matching at almost all places with π not cuspidal (π = π(μ, ν) isobaric, ρ = μ⊕ν) is outside the statement; that case is settled directly by Hecke characters.
- For an unramified character pair with Frobenius eigenvalues α,β, the local factor is ((1−αq⁻ˢ)(1−βq⁻ˢ))⁻¹ and the central character at a uniformiser is αβ. There is no extra q or half-integral shift.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, proof of Theorem 12.2 from the quotient of the two functional equations to (12.5.1), printed pp. 210–212 (PDF pp. 216–218). Jacquet and Langlands isolate the places of a finite set S one at a time by a twist with prescribed component at one place and high ramification at the others, use Proposition 3.8 and the corresponding Galois-side stability to cancel the other places, and conclude from the resulting identity of local factors; here the cuspidal representation is given and the Galois side is compared through the local correspondence, so only GL₂ stability is needed.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3 opening, DMA text pp. 15–16 (PDF pp. 18–19). Langlands states the two definitions of π(ρ) (matching everywhere, or isobaric and matching almost everywhere), asserts their equivalence using Callahan's results, an archimedean analogue of the local converse and his Lemma 3.2, whose proof he does not give.
- [Jerrold Tunnell, Artin's conjecture for representations of octahedral type](https://web.archive.org/web/20231206042832id_/https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), p. 173, second paragraph. Tunnell defines π = π(ρ) by matching at almost all places, which is the weak form this theorem upgrades.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-tetrahedral-artin-all-places"></a>

#### Tetrahedral Artin automorphy at every place

**Declaration:** `TauCeti.GL2Transfer.tetrahedral_artin_all_places`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin-all-places`.

Let F be a number field and ρ: G_F → GL₂(C) continuous, irreducible, with projective image A₄, and let π be the cuspidal representation of R17.5/tetrahedral-artin (the cubic descent of the dihedral π(ρ_E), with ω_π = det ρ). Then π_v ≅ π(ρ_v) at every place v of F, including the archimedean ones and the places dividing 2 where ρ_v may be primitive. In particular all twisted L- and ε-factors of π and ρ agree at every place. At an archimedean v the component is π(1, 1) if ρ(c_v) = 1, π(sgn, sgn) if ρ(c_v) = −1 and the weight-one limit π(1, sgn) if ρ(c_v) is a non-scalar involution; at a complex v it is π(1, 1).

**Hypotheses.**

- F is a number field; ρ: G_F → GL₂(C) is continuous and irreducible with projective image A₄.
- E/F is the cyclic cubic extension cut out by the preimage of the normal subgroup V₄ ⊂ A₄; P = ρ|_{W_E} is dihedral, and π(P) is its quadratic automorphic induction (R17.5/dihedral-artin).
- π is the cyclic descent of π(P) to F with ω_π = det ρ constructed in R17.5/tetrahedral-artin; it satisfies π_v ≅ π(ρ_v) for almost all v.

**Proof or construction.**

1. Archimedean places. Every archimedean v of F splits completely in E: the decomposition group at v has order at most 2 inside Gal(E/F) ≅ Z/3. For w | v, E_w = F_v, and R17.4/cyclic-base-change gives BC_{E/F}(π)_w ≅ π_v at the split place. By construction BC_{E/F}(π) ≅ π(P) (R17.4/cyclic-descent), and π(P)_w ≅ π(P_w) at every place by quadratic induction (R17.5/quadratic-induction, JL70 Proposition 12.1). As P_w = ρ|_{W_{E_w}} = ρ_v, π_v ≅ π(ρ_v).
2. The explicit archimedean components: ρ(W_C) is trivial (a connected group maps trivially to the profinite G_F), so ρ_v is a sum of characters of W_R/C^× ≅ {±1} determined by ρ(c_v), and AF.1/archimedean-llc-gln gives the listed principal series.
3. Finite places. R17.5/tetrahedral-artin gives π_v ≅ π(ρ_v) outside a finite set T of finite places. artin-all-place-upgrade, with the archimedean matching just proved, extends this to every place.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-all-place-upgrade`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`.

**Acceptance checks.**

- If the image of ρ is the binary tetrahedral group, whose only involution is −1, then ρ(c_v) is scalar at every real v and π_v is π(1, 1) or π(sgn, sgn); an odd tetrahedral ρ over Q (det ρ(c) = −1) has a non-scalar involution in its image and π_∞ is the weight-one limit π(1, sgn).
- At an unramified place inert in E, R17.5/tetrahedral-artin removes a cube-root-of-unity ambiguity in the Satake class by a group-theoretic argument; at the finitely many places that argument does not reach (places ramified for ρ, in particular those over 2 where ρ_v can be primitive) only artin-all-place-upgrade identifies π_v.
- Replacing π by π⊗η with η the cubic character of E/F gives a representation with the same base change to E but different central character; it is not π(ρ), so the determinant normalisation of R17.5/tetrahedral-artin is essential.

**Sources.**

- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3(i), tetrahedral type, DMA text pp. 16–19 (PDF pp. 19–22), Theorem 3.3. Langlands constructs the cubic descent of π(P) with the right central character and proves matching at almost all places; Theorem 3.3 records the consequence for the Artin L-function.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, properties A)–C) of global liftings, DMA text p. 14 (PDF p. 17). Langlands's global base change is a lifting at every place, so at a split place the local component of the lift is the local component of π.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, Proposition 12.1, printed p. 206 (PDF p. 212). Quadratic automorphic induction has local components π(σ_v) at every place.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-octahedral-artin-all-places"></a>

#### Octahedral Artin automorphy at every place

**Declaration:** `TauCeti.GL2Transfer.octahedral_artin_all_places`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin-all-places`.

Let F be a number field and ρ: G_F → GL₂(C) continuous, irreducible, with projective image S₄, and let π be the cuspidal representation of R17.5/octahedral-artin (Tunnell's choice among the two quadratic descents of the tetrahedral representation of ρ|_{G_E}, E/F the quadratic field of the preimage of A₄). Then π_v ≅ π(ρ_v) at every place v of F. At a real place v that is complex in E, ρ(c_v) is a non-scalar involution (its projective image is a transposition), ρ_v = 1⊕sgn and π_v is the weight-one limit π(1, sgn); at real places split in E and at complex places the component is read off from the tetrahedral representation over E.

**Hypotheses.**

- F is a number field; ρ: G_F → GL₂(C) is continuous and irreducible with projective image S₄.
- E/F is the quadratic extension cut out by the preimage of A₄; ρ_E = ρ|_{G_E} has projective image A₄; π_E is its tetrahedral cuspidal representation (tetrahedral-artin-all-places over E).
- π is the quadratic descent of π_E singled out by Tunnell's lemma in R17.5/octahedral-artin, with π_v ≅ π(ρ_v) for almost all v.

**Proof or construction.**

1. Central character. As in artin-all-place-upgrade, ω_π = det ρ, since both agree at almost all places.
2. Archimedean v split in E, and complex v: for w | v, E_w = F_v and BC_{E/F}(π)_w ≅ π_v (R17.4/cyclic-base-change); BC_{E/F}(π) ≅ π_E because π is a quadratic descent of π_E, which matches ρ_E at every place of E by tetrahedral-artin-all-places applied over E; so π_v ≅ π(ρ_v).
3. Real v with E_w = C: ρ(c_v) lies outside the preimage of A₄, so its projective image is an odd involution of S₄, a transposition; hence ρ(c_v) is a non-scalar involution, det ρ(c_v) = −1 and ρ_v = 1⊕sgn. By R17.4/local-compatibility the parameter φ of π_v restricts to W_C as the parameter of BC_{E/F}(π)_w = π_{E,w} = π(1, 1), so φ is trivial on C^× and φ ∈ {1⊕1, 1⊕sgn, sgn⊕sgn}. Its determinant is ω_{π_v} = det ρ_v, which is sgn; only 1⊕sgn has determinant sgn, so π_v ≅ π(1, sgn) = π(ρ_v).
4. Finite places: artin-all-place-upgrade with the archimedean matching just proved.
5. The weak octahedral input has been collated against Tunnell pp. 173–175 in the archived AMS scan with the original hash. The p. 174 lemma chooses between two quadratic descents by non-normal cubic base change, not by determinant matching. The p. 175 Satake calculation excludes projective order 6. The JPSS transfer remains imported from R17.3’s R17.4a/AL.3b supplier plan; source collation does not replace that analytic proof.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin-all-places`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-all-place-upgrade`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`.

**Acceptance checks.**

- For F = Q and ρ = s∘r̄ with r̄: G_Q → GL₂(F₃) odd and surjective (R17.5/octahedral-mod-three-application), E is the quadratic field cut out by det r̄, which is imaginary because det r̄(c) = −1; the real place is complex in E and π_∞ is the weight-one limit π(1, sgn).
- The two descents π₁ and π₂ = π₁⊗ω_{E/F} have the same central character and the same base change to E; at a real place complex in E they have the same archimedean component as well (twisting by ω_{E/F} sends π(1, sgn) to π(sgn, 1) ≅ π(1, sgn)), so archimedean matching does not choose between them: Tunnell's cubic comparison does.
- The archimedean step uses only the quadratic descent and the central character; Tunnell's cubic comparison and the upgrade are still needed at the finite places.

**Sources.**

- [Jerrold Tunnell, Artin's conjecture for representations of octahedral type](https://web.archive.org/web/20231206042832id_/https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), p. 174, Lemma and Theorem with their proofs; p. 175. Tunnell chooses one of the two descents of the tetrahedral representation by comparing cubic base changes and proves matching at almost all places.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3(ii), octahedral type, DMA text p. 19 (PDF p. 22). Langlands sets up the two candidates as quadratic descents of the tetrahedral representation over E.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, properties A)–C) of global liftings, DMA text p. 14 (PDF p. 17). Base change is a lifting at every place, including archimedean ones, which is the input of the archimedean comparison.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

### Brauer characters, integral lifts and modularity

<a id="r17-5-brauer-character"></a>

#### The Brauer character of a modular representation

**Declaration:** `TauCeti.GL2Transfer.brauerCharacter`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character`.

Let Γ be a finite group, p a prime, k an algebraically closed field of characteristic p, m ≥ 1 an integer prime to p that is divisible by the order of every p-regular element of Γ (for instance the prime-to-p part of the exponent of Γ), and τ: μ_m(k) → μ_m(C) a group isomorphism. For a representation r: Γ → GL_n(k) and a p-regular g ∈ Γ (order prime to p), r(g) is diagonalisable and its eigenvalues λ₁, …, λ_n, counted with algebraic multiplicity, lie in μ_m(k). The Brauer character of r is the complex-valued function on the p-regular elements φ_r(g) = τ(λ₁) + … + τ(λ_n). It depends on τ, is defined only on p-regular elements, and is not a lift of the trace of r(g) ∈ k (Webb's Example 10.1.2 has trace 1 and Brauer character −1). For a representation over a subfield k₀ ⊂ k (for example a finite field) one takes the Brauer character of its extension of scalars to k. The suggested matrix function is total on Γ: it sums the τ-lifts of characteristic-polynomial roots, assigning 0 to a root outside μ_m. Its restriction to p-regular elements is the Brauer character; all character-theoretic identities below are asserted on that restriction.

**Hypotheses.**

- Γ is a finite group and p is prime; k is algebraically closed of characteristic p.
- m is prime to p and divisible by the order of every p-regular element of Γ; τ: μ_m(k) ≅ μ_m(C) is an isomorphism of cyclic groups of order m.
- r: Γ → GL_n(k) is a group homomorphism (equivalently a finite-dimensional kΓ-module with a basis); φ_r is defined on {g ∈ Γ : gcd(ord g, p) = 1}.

**Proof or construction.**

1. For g p-regular, r(g)^{ord g} = 1 and ord g is prime to p, so X^{ord g} − 1 is separable over k; r(g) is diagonalisable with eigenvalues in μ_{ord g}(k) ⊂ μ_m(k) (Webb §10.1, before Example 10.1.2).
2. Define φ_r(g) as the sum of τ over the roots of the characteristic polynomial of r(g), with multiplicity; this is independent of any ordering and of the basis.
3. For a p-modular system (F, R, k) with F of characteristic zero containing μ_m, reduction modulo the maximal ideal is an isomorphism μ_m(R) → μ_m(k) (Webb Lemma 10.1.1; R01.1/reduction-of-roots-of-unity proves it for the algebraic closure of Q_p); choosing τ as the composite of its inverse with an embedding F → C makes the Brauer character of a reduced lattice equal to the ordinary character (API brauerCharacter_reduction).
4. The root-of-unity comparison for a general splitting p-modular system uses Webb Lemma 10.1.1: X^m−1 has distinct roots modulo p since p ∤ m. The R01.1/reduction-of-roots-of-unity node covers the p-adic algebraic-closure instance, not every domain in the comparison API.

**Direct prerequisites.** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.charpoly`, `mathlib:rootsOfUnity`, `ArithmeticGaloisRepresentations:R01.1/reduction-of-roots-of-unity`.

**Uses.**

- `Isaacs, Lifting Brauer characters of p-solvable groups, §1 and Theorem 5.4` — the Fong–Swan theorem is a statement about lifting irreducible Brauer characters to ordinary characters, χ* = φ
- `Webb, §10.2, Theorem 10.2.2 and Corollary 10.2.3` — simple Brauer characters are linearly independent, and equal Brauer characters mean equal composition factors
- `R17.5/solvable-integral-lift and R17.5/odd-solvable-residual-lift` — the reduction of a lattice in a lift of φ is identified with the residual representation by comparing Brauer characters
- `KTheoryFiniteLocalFields:L.1/brauer-character (Quillen's Brauer lift)` — the same notion over finite fields; that roadmap is not in the upstream chain of this one, so the definition moves down to here and that layer imports it

**Planning API.**

- `TauCeti.GL2Transfer.brauerCharacter` (data) — The function on p-regular elements g ↦ Σ τ(λᵢ), the sum over the eigenvalues of r(g) with algebraic multiplicity, for fixed p, m, τ.
- `TauCeti.GL2Transfer.brauerCharacter_spectrum` (characterisation) — If the characteristic polynomial of r(g) is ∏ᵢ (X − aᵢ) with aᵢ ∈ μ_m(k), then φ_r(g) = Σᵢ τ(aᵢ).
- `TauCeti.GL2Transfer.brauerCharacter_one` (simp) — φ_r(1) = n, the dimension, as a complex number (Webb 10.1.3(1)).
- `TauCeti.GL2Transfer.brauerCharacter_conjugate` (structure) — φ_r(xgx⁻¹) = φ_r(g) for all x ∈ Γ: a class function on p-regular classes (Webb 10.1.3(2)).
- `TauCeti.GL2Transfer.brauerCharacter_conj_equiv` (characterisation) — If r′(g) = P r(g) P⁻¹ for a fixed P ∈ GL_n(k), then φ_{r′} = φ_r: the Brauer character depends only on the isomorphism class.
- `TauCeti.GL2Transfer.brauerCharacter_inv` (relation) — φ_r(g⁻¹) is the complex conjugate of φ_r(g) and equals the Brauer character of the dual representation at g (Webb 10.1.3(3)).
- `TauCeti.GL2Transfer.brauerCharacter_tensor` (relation) — The Brauer character of the tensor product (Kronecker product of matrices) is the product φ_r·φ_{r′} (Webb 10.1.3(4)).
- `TauCeti.GL2Transfer.brauerCharacter_blockTriangular` (relation) — If r is block upper triangular with diagonal blocks r₁ and r₂, then φ_r = φ_{r₁} + φ_{r₂}; hence φ is additive in short exact sequences and depends only on composition factors with multiplicity (Webb 10.1.3(5)).
- `TauCeti.GL2Transfer.brauerCharacter_reduction` (compatibility) — Let R be a domain, f: R → k a ring map and σ: R → C an injective ring map with τ(f(ζ)) = σ(ζ) for every ζ ∈ μ_m(R). Assume that charpoly(ρ(g)) splits in R as ∏ᵢ(X−ζᵢ), ζᵢ ∈ μ_m(R). For ρ: Γ → GL_n(R) and p-regular g, the Brauer character of f∘ρ at g equals σ(tr ρ(g)), the ordinary character (Webb 10.1.3(6)). This splitting hypothesis is explicit in the Lean statement; a general domain need not contain these eigenvalues.
- `TauCeti.GL2Transfer.brauerCharacter_mapField` (compatibility) — For an embedding of algebraically closed fields k → k′ and τ′ restricting to τ, the Brauer character of the extended representation equals φ_r.

**Unit tests.**

- `TauCeti.GL2Transfer.brauerCharacter_rank_one_test` (computation) — For n = 1 and r(g) = a ∈ μ_m(k), φ_r(g) = τ(a).
- `TauCeti.GL2Transfer.brauerCharacter_cube_root_test` (non-example) — For g of order 3 acting with eigenvalues a and a² where τ(a) is a primitive cube root of unity (for instance the F₂-matrix with rows (0, 1) and (1, 1)), φ_r(g) = −1, although the trace of r(g) in characteristic 2 is 1; lifting the trace would give the wrong value.
- `TauCeti.GL2Transfer.brauerCharacter_identity_rank_p_test` (degenerate) — The trivial representation of rank p has φ(1) = p ≠ 0 in C, although its trace in k is 0: the Brauer character remembers the dimension.
- `TauCeti.GL2Transfer.brauerCharacter_sign_reduction_test` (compatibility) — For Γ of order 2, p = 3 and the sign representation over Z reduced to F₃, the Brauer character at the generator is −1, the value of the ordinary character.

**Acceptance checks.**

- The listed tests hold, and the API items listed above are consistent with Webb Proposition 10.1.3 (1)–(6).
- brauerCharacter agrees with the ordinary character of any integral lift on p-regular elements, which is the property used by brauer-character-recognition and fong-swan.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §10.1, definition of φ_U after Lemma 10.1.1, and Example 10.1.2, printed p. 170 (PDF p. 177). Webb defines the Brauer character by lifting the eigenvalues of a p-regular element through the reduction isomorphism of prime-to-p roots of unity and summing; his example over F₂ with a matrix of order 3 has trace 1 but Brauer character −1.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §10.1, Lemma 10.1.1, printed p. 170 (PDF p. 177). Reduction modulo the maximal ideal of a p-modular system is an isomorphism on prime-to-p roots of unity.
- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), §1, introduction and Definition 1.1, printed p. 171 (PDF p. 2). Isaacs's IBr(G) is the set of irreducible Brauer characters, defined after fixing a lift of the characteristic-p roots of unity of order prime to p to complex roots of unity; χ* denotes an ordinary character restricted to the p-regular elements.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-brauer-character-recognition"></a>

#### Brauer characters determine composition factors

**Declaration:** `TauCeti.GL2Transfer.brauerCharacter_recognition`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`.

Let Γ be finite, k algebraically closed of characteristic p, and φ the Brauer character for a fixed τ. (a) The Brauer characters of the simple kΓ-modules S₁, …, S_r are linearly independent over C and form a basis of the class functions on p-regular conjugacy classes; the Brauer characters of their projective covers P_{S₁}, …, P_{S_r} form the dual basis for the pairing ⟨α, β⟩ = |Γ|⁻¹ Σ_{g p-regular} α(g⁻¹)β(g), with ⟨φ_{P_{S_i}}, φ_{S_j}⟩ = δ_{ij}. (b) Two finite-dimensional kΓ-modules have the same Brauer character if and only if they have the same composition factors with the same multiplicities; in particular a module whose Brauer character equals that of a simple module S is isomorphic to S. (c) Let (F, R, k₀) be a p-modular system with F of characteristic zero containing the m-th roots of unity, uniformiser ϖ, k₀ ⊂ k, and τ compatible with reduction of roots of unity and an embedding F → C. For a full RΓ-lattice L in an FΓ-module V, the Brauer character of (L/ϖL) ⊗_{k₀} k is the ordinary character of V restricted to p-regular elements; different full lattices give reductions with the same composition factors (Brauer–Nesbitt).

**Hypotheses.**

- Γ finite; k algebraically closed of characteristic p (a splitting field for Γ); τ as in R17.5/brauer-character.
- In (c): R is a discrete valuation ring with uniformiser ϖ, fraction field F of characteristic zero containing μ_m, and residue field k₀ ⊂ k; τ(ζ mod ϖ) = σ(ζ) for ζ ∈ μ_m(R) and a fixed embedding σ: F → C.

**Proof or construction.**

1. (c) For p-regular g, the eigenvalues of g on V lie in μ_m(F) ⊂ R and reduce to the eigenvalues on L/ϖL, so the two sums agree under τ (Webb Proposition 10.1.3(6) with Lemma 10.1.1). Brauer–Nesbitt for lattices (Webb Theorem 9.4.8; R01.1/brauer-nesbitt for the characteristic-polynomial form) gives the independence of the lattice.
2. Projective covers come from QuiverRepresentations Layer 3. GrothendieckEulerForms Layer 4 gives dim Hom(P_S,T)=δ_ST in the split setting. projective-brauer-hom identifies this with the Brauer pairing. brauer-class-count gives equality between the number of simples and the dimension of p-regular class functions. Thus the two finite families are dual bases (Webb 10.2.2).
3. (b) Brauer characters are additive in short exact sequences (R17.5/brauer-character, API brauerCharacter_blockTriangular), so φ_U = Σ_S [U : S] φ_S; by (a) the multiplicities [U : S] are determined by φ_U (Webb Corollary 10.2.3(3)). If φ_U = φ_S for simple S, U has a single composition factor S and so U ≅ S.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt`, `ArithmeticGaloisRepresentations:R01.1/reduction-of-roots-of-unity`, `ArithmeticGaloisRepresentations:R01.1/semisimplification`, `tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-4-finite-dimensional-algebras-and-the-cartan-map`, `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/projective-brauer-hom`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-class-count`.

**Acceptance checks.**

- Webb's Example 10.1.2: the two-dimensional F₂C₃-module U (simple over F₂) becomes, over k, the sum of the two nontrivial characters; its Brauer character at the generator is −1, while two trivial factors give 2 and a trivial plus a nontrivial factor give 1 + ζ with ζ a primitive cube root of unity, so the composition factors are read off from the value.
- In characteristic p, the regular representation of a cyclic p-group has the same Brauer character (|Γ| at 1) as |Γ| copies of the trivial module but is not semisimple: (b) determines composition factors, not the module.
- (c) for Γ of order prime to p recovers the bijection between simple modules in characteristic zero and in characteristic p (Webb Theorem 9.4.11, p. 155).

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §10.1, Proposition 10.1.3 (5)–(6), printed pp. 170–171 (PDF pp. 177–178). Brauer characters are additive in short exact sequences, depend only on composition factors, and equal the ordinary character of a lift on p-regular elements.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §10.2, Theorem 10.2.2, printed p. 176 (PDF p. 183). With k a splitting field, the Brauer characters of the simple modules and of their projective covers form dual bases of the p-regular class functions.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §10.2, Corollary 10.2.3 (3), printed p. 177 (PDF p. 184). Two modules have the same composition factors exactly when their Brauer characters are equal.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.4, Theorem 9.4.8 (Brauer–Nesbitt), printed p. 153 (PDF p. 160). Reductions of two full lattices in the same FG-module have the same composition factors.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-fong-swan"></a>

#### The Fong–Swan theorem

**Declaration:** `TauCeti.GL2Transfer.fong_swan`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/fong-swan`.

Let Γ be a finite p-solvable group (in particular any finite solvable group), k an algebraically closed field of characteristic p, and τ as in R17.5/brauer-character. Every irreducible Brauer character φ of Γ is the restriction to p-regular elements of an irreducible ordinary character: there is a complex irreducible representation with character χ such that χ(g) = φ(g) for every p-regular g. Equivalently (module form): for any splitting p-modular system (F, R, k₀) for Γ, every simple k₀Γ-module is the reduction modulo π of an RΓ-lattice. Isaacs's proof gives a p-rational χ (values in a cyclotomic field of conductor prime to p); for p odd this p-rational lift is unique. The conclusion need not hold without p-solvability; the A₅ example below witnesses this, without asserting a converse characterisation of p-solvable groups.

**Hypotheses.**

- Γ is finite and p-solvable: it has a normal series whose factors are p-groups or p′-groups; finite solvable groups qualify.
- k is algebraically closed of characteristic p; Brauer characters are taken with respect to τ.
- Module form: (F, R, k₀) is a p-modular system in which F and k₀ are splitting fields for Γ (Webb §9.4).

**Proof or construction.**

1. equivariant-fong-swan supplies a p-rational ordinary lift for every prime. Its stronger stabilizer and degree assertion has an explicit induction with modular Clifford, coprime-index comparison and determinant-order extension.
2. For odd-p uniqueness use Isaacs Theorem 1.2, §6 proof pp. 180–181. Induct on group order while also proving that constituents on every normal subgroup of a p-rational χ with χ* simple are p-rational and have simple Brauer restriction. Pass to the combined conjugation/Galois stabilizer and ordinary inertia correspondent; if proper, apply the group induction. Otherwise the inertia group is normal, and modular Clifford forces it to be all of Γ, since an invariant simple inducing to a simple has index one. For the remaining restriction induction use a proper normal subgroup of N and either its O^p or O^{p′} quotient, applying p-rational-p-group-extension or coprime-index-lift-correspondence. These simultaneous restriction hypotheses justify the final maximal-normal-subgroup argument. Two lifts restrict to the same p-rational lift of a constituent, by induction, and the p-group or coprime-index correspondence then makes the lifts equal.
3. Module form from the character form: realise χ over F (a splitting field), take a full RΓ-lattice L in the realisation (Webb Corollary 9.4.7: span of the Γ-translates of a basis); by brauer-character-recognition (c) the Brauer character of L/πL is χ* = φ, and by (b) L/πL ≅ S.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`, `ArithmeticGaloisRepresentations:R01.1/clifford-isotypic-decomposition`, `mathlib:Group.IsSolvable`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/equivariant-fong-swan`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-rational-p-group-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/coprime-index-lift-correspondence`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-rational-character`.

**Acceptance checks.**

- The two-dimensional simple module of S₃ in characteristic 2 lifts to the reflection representation of S₃, although 2 divides |S₃|.
- For Γ of order prime to p the theorem is the classical bijection between simple modules in characteristic zero and characteristic p (Webb Theorem 9.4.11, p. 155), and every lift is unique.
- For a cyclic p-group the only irreducible Brauer character is trivial, and its lifts are all p-power-order characters; for p odd the p-rational one is the trivial character, illustrating Isaacs's uniqueness.
- p-solvability cannot be dropped: A₅ ≅ SL₂(F₄) has a two-dimensional irreducible Brauer character at p = 2 (its natural representation), but no irreducible complex character of degree 2.

**Sources.**

- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), §5, Theorem 5.4 and its proof, printed pp. 179–180 (PDF pp. 10–11). Isaacs proves by induction on the group order that every irreducible Brauer character of a p-solvable group has a p-rational ordinary lift, giving a proof of the Fong–Swan theorem valid for every prime, using his Lemma 5.1, Theorem 3.1, Lemma 4.1 and Gallagher's Theorem 4.2.
- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), §1, Theorem 1.2, printed p. 171 (PDF p. 2). For p ≠ 2 the p-rational lift is unique; Isaacs quotes the Fong–Swan theorem itself from Curtis–Reiner's book (their Theorem 72.1).
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.4, Theorem 9.4.12 (Fong, Swan, Rukolaine), printed p. 156 (PDF p. 163). Webb states the module form for a splitting p-modular system and a p-solvable group, without proof.
- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), §6, proof of Theorem 1.2 and Lemma 6.1, pp. 180–181. Odd-p uniqueness is proved together with the normal-subgroup restriction assertion, using the inertia/Galois stabilizer and the two quotient correspondences.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

**Planet:** Fong–Swan theorem. This is the only new planet; together with R17.3’s five existing R17.5 planets the layer stays within six.

<a id="r17-5-solvable-integral-lift"></a>

#### Integral lifts of representations of finite solvable groups

**Declaration:** `TauCeti.GL2Transfer.solvable_finite_image_integral_lift`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-integral-lift`.

Let p be prime, Γ a finite solvable group, k an algebraically closed field of characteristic p and r: Γ → GL_n(k) an irreducible representation. There exist a number field E, a height-one prime λ of O_E above p, the localisation R = (O_E)_λ (a discrete valuation ring), a ring homomorphism f: R → k with kernel λR, a group homomorphism ρ: Γ → GL_n(R) and P ∈ GL_n(k) such that r(g) = P·f(ρ(g))·P⁻¹ for every g ∈ Γ. One may take E to contain the e-th roots of unity, e the exponent of Γ. If r is injective so is ρ, and in general ker ρ = ker r. The reduction is isomorphic to r itself, not only after semisimplification; neither p ∤ |Γ| nor n = 2 is assumed.

**Hypotheses.**

- p is prime; Γ is a finite solvable group; k is algebraically closed of characteristic p.
- r: Γ → GL_n(k) is a homomorphism whose representation on kⁿ is irreducible (equivalently absolutely irreducible, as k is algebraically closed).

**Proof or construction.**

1. finite-field-simple-descent gives a finite splitting field k₀ and a simple k₀Γ-module S₀ whose extension to the arbitrary algebraically closed k is isomorphic to r. This descends the module up to conjugacy, never the displayed entries. split-simple-scalar-extension proves the needed quotient and radical comparison under the split hypothesis, so no additional radical base-change theorem over F_p is assumed. R01.1’s F̄_p-only descent is not used and Webb 9.2.7 is not modified in characteristic p.
2. Take E = Q(ζ_{e(q−1)}) and λ above p. The characteristic-zero cyclotomic splitting theorem (InductionRestriction Layer 6; Webb 9.2.7) makes E a splitting field for Γ. Reduction is an isomorphism on μ_{q−1}, so κ(λ) contains F_q. A field extension of a splitting field is splitting; hence (E,(O_E)_λ,κ(λ)) is a splitting p-modular system. Embed κ(λ) in k extending k₀. This uses finite-field embeddings and the Dedekind localisations already represented by the baseline.
3. fong-swan (module form) gives an RΓ-lattice L with L/λL ≅ S₀ ⊗_{k₀} κ(λ). L is finitely generated and torsion-free over the discrete valuation ring R, hence free of rank n (Webb Lemma 9.4.6, Corollary 9.4.7); a basis gives ρ: Γ → GL_n(R).
4. Choose f: R → κ(λ) → k extending the given inclusion k₀ ⊂ k (possible since k is algebraically closed and κ(λ) is a finite extension of k₀). Then f∘ρ ≅ S₀ ⊗ k ≅ r, which gives P. If ρ(g) = 1 then r(g) = P·P⁻¹ = 1, so ker ρ ⊂ ker r. Running the construction for the faithful representation of the solvable quotient Γ/ker r and composing with the quotient map gives ρ with ker ρ = ker r; in particular ρ is injective when r is.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/fong-swan`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`, `ArithmeticGaloisRepresentations:R01.1/absolutely-irreducible`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:Localization.AtPrime`, `mathlib:Matrix.GeneralLinearGroup.map`, `mathlib:Representation.IsIrreducible`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-field-simple-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/split-simple-scalar-extension`.

**Acceptance checks.**

- Γ = S₃, p = 2, r the two-dimensional simple module: the lift is the reflection representation over Z[ζ₃] localised at 2, whose reduction is r.
- Γ = GL₂(F₃), p = 3, r the identity representation over F₃ ⊂ F̄₃: a lift is the section into GL₂(Z[√−2]) of R17.5/octahedral-mod-three-application, with λ = (1 + √−2).
- For Γ of order prime to p and n = 1 the lift is the Teichmüller lift of a character (R01.1/teichmuller-lift-of-a-residual-character).
- Changing the basis of L changes P; entrywise equality r(g) = f(ρ(g)) is not part of the statement.
- Let k be an algebraic closure of F_p(t), and conjugate a finite-field simple representation by a matrix involving t. Its entries can generate an infinite field. The assertion still holds through conjugacy; the proof must not assert that those displayed entries generate a finite field.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.2, Theorem 9.2.6, p. 143 (PDF p. 150); splitting-field discussion p. 144 and §9.8 Exercises 4, 8(a), pp. 165–166; Theorem 9.2.7, p. 144, in characteristic zero only. A finite extension of any field splits a finite-dimensional algebra. Semisimple matrix-algebra descriptions explain descent of simple modules up to isomorphism; the cyclotomic criterion supplies the characteristic-zero splitting field. The explicit finite-algebra-splitting-field and split-simple-scalar-extension targets supply the algebra/base-change argument missing from the original residual-descent citation; G5 is resolved at target level.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.4, Lemma 9.4.6 and Corollary 9.4.7, printed pp. 152–153 (PDF pp. 159–160). A finitely generated R-submodule containing a basis is a full lattice, and every FG-module over a principal ideal domain has an RG-lattice that is an R-form.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.4, Theorem 9.4.12, printed p. 156 (PDF p. 163). Simple modules of p-solvable groups over a splitting p-modular system are reductions of lattices.
- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). Boxer–Calegari–Gee–Pilloni need a characteristic-zero lift with finite solvable image of a mod-p representation with solvable image; this theorem supplies it with a lattice and the actual reduction.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-involution-oddness-under-reduction"></a>

#### Reduction at an odd prime detects the determinant of an involution

**Declaration:** `TauCeti.GL2Transfer.involution_odd_of_residual_conjugacy`; lemma; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/involution-oddness-under-reduction`.

Let R be a commutative ring without zero divisors, k a field in which 2 ≠ 0, f: R → k a ring homomorphism and A ∈ GL₂(R) with A² = 1. If det f(A) = −1 then det A = −1. The same holds if only B = P·f(A)·P⁻¹ with det B = −1 is known, for some P ∈ GL₂(k). Consequently, for a homomorphism ρ: G → GL₂(R), an element c ∈ G with c² = 1 and a residual representation r̄ = P·(f∘ρ)·P⁻¹ with det r̄(c) = −1, one has det ρ(c) = −1. The hypothesis 2 ≠ 0 in k is necessary: in characteristic 2 the identity matrix has residual determinant 1 = −1 but integral determinant 1.

**Hypotheses.**

- R is a commutative ring with no zero divisors; k is a field with 2 ≠ 0; f: R → k is a ring homomorphism.
- A ∈ GL₂(R) satisfies A² = 1; P ∈ GL₂(k).

**Proof or construction.**

1. det(A)² = det(A²) = 1, so det A = ±1 in the domain R.
2. If det A = 1 then det f(A) = f(1) = 1, and 1 = −1 in k would force 2 = 0; hence det A = −1.
3. Conjugation by P does not change the determinant, which gives the residual-conjugacy form and the statement for ρ(c).

**Direct prerequisites.** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.map`, `mathlib:Matrix.GeneralLinearGroup.det`.

**Acceptance checks.**

- Over Z, diag(1, −1) reduced modulo 3 is odd, and the lemma recovers that its determinant is −1.
- The scalar matrix −I has determinant +1 in rank two, so a scalar involution is never odd.
- Modulo 2 the identity matrix has residual determinant −1 = 1 while its determinant over Z is 1: the lemma fails without 2 ≠ 0.

**Sources.**

- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). The proof requires the characteristic-zero lift of a totally odd residual representation to be totally odd; for p > 2 this is the present lemma at each complex conjugation.
- [Luis Dieulefait and Ariel Pacetti, A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), §1.1, proof of Theorem 1.3, p. 3. Dieulefait and Pacetti need the lift of an odd mod-p representation (p odd) to be odd.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-odd-solvable-residual-lift"></a>

#### Characteristic-zero lifts of residual representations with solvable image

**Declaration:** `TauCeti.GL2Transfer.odd_solvable_residual_lift`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-solvable-residual-lift`.

Let F be a number field, p a prime, k = F̄_p (or any algebraically closed field of characteristic p, with the discrete topology) and r̄: G_F → GL_n(k) a continuous absolutely irreducible representation whose image is solvable. There exist a number field E, a prime λ of E above p, R = (O_E)_λ, f: R → k with kernel λR, a homomorphism ρ: G_F → GL_n(R) with open kernel (so continuous for the discrete and for the λ-adic topology on GL_n(R)) and P ∈ GL_n(k) with r̄(g) = P·f(ρ(g))·P⁻¹ for all g ∈ G_F, such that: ker ρ = ker r̄ (so ρ has finite image isomorphic to that of r̄, cuts out the same field, and is unramified at every place where r̄ is); for every embedding E → C, ρ is irreducible over C; its image, and so its projective image, is solvable. If n = 2, p > 2 and r̄ is totally odd (det r̄(c_v) = −1 for every complex conjugation c_v at a real place v), then ρ is totally odd. This strengthens R17.5/odd-residual-lift: the reduction is r̄ itself, not only its semisimplification; F need not be totally real for the lifting part; and no projective lifting, Tate vanishing or Teichmüller twist is used. For p = 2 the oddness clause fails; the characteristic-two case is planned in layer R17.6 of this roadmap.

**Hypotheses.**

- F is a number field; p is prime; k is algebraically closed of characteristic p, with the discrete topology.
- r̄: G_F → GL_n(k) is continuous, absolutely irreducible, and r̄(G_F) is a solvable group.
- Oddness clause: n = 2, p > 2, and det r̄(c_v) = −1 for the complex conjugations c_v at all real places v.

**Proof or construction.**

1. Continuity with discrete coefficients means ker r̄ is open and Γ = r̄(G_F) is finite (R01.1/finite-coefficients-and-finite-quotients).
2. Apply solvable-integral-lift to the inclusion Γ ⊂ GL_n(k), irreducible because r̄ is: this gives E, λ, R, f, an injective ρ_Γ: Γ → GL_n(R) and P. Put ρ = ρ_Γ ∘ r̄; then ker ρ = ker r̄ is open, so ρ is continuous, and r̄ = P·(f∘ρ)·P⁻¹.
3. Irreducibility over C: if ρ ⊗ C had a proper invariant subspace W, its character would be χ_W + χ_{W′} with both summands characters of nonzero representations; realising them over a finite extension of E and reducing lattices, brauer-character-recognition (c) would give r̄ at least two composition factors, contradicting (b) and the simplicity of r̄.
4. Oddness: for each real v, c_v² = 1; involution-oddness-under-reduction with the residual comparison P gives det ρ(c_v) = −1.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-integral-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/involution-oddness-under-reduction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`, `ArithmeticGaloisRepresentations:R01.1/finite-coefficients-and-finite-quotients`, `ArithmeticGaloisRepresentations:R01.1/absolutely-irreducible`, `ArithmeticGaloisRepresentations:R01.1/artin-representations-have-finite-image`.

**Acceptance checks.**

- For p = 3 and r̄: G_Q → GL₂(F₃) surjective and odd, one admissible lift is s∘r̄ with the section s of R17.5/octahedral-mod-three-application; the theorem produces some lift with the same kernel, not necessarily that one.
- For p = 2 and r̄ with dihedral image the lifting part holds but the oddness clause does not: every characteristic-two residual representation has det r̄(c) = 1 = −1.
- A residual representation with nonsolvable image, for example r̄ onto GL₂(F₅) ⊃ SL₂(F₅), is outside the statement; its finite lifts need not exist with the same kernel.

**Sources.**

- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). The proof asserts the existence of a totally odd characteristic-zero lift with finite solvable image of a totally odd mod-p representation with solvable image, invoking the classification of finite subgroups and Tate's lifting theorem; E16 was rejected as an unestablished source-error allegation; Fong–Swan gives an explicit alternative proof input.
- [Luis Dieulefait and Ariel Pacetti, A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), §1.1, Theorem 1.3 and its proof, p. 3. Dieulefait and Pacetti state that an odd irreducible mod-p representation of G_Q with solvable image (p odd) lifts to an odd representation into GL₂(C); E17 was rejected: the source asserts an actual lift, not an arbitrary projective lift.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.4, Theorem 9.4.12, printed p. 156 (PDF p. 163). The lattice form of Fong–Swan used for the lift.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-solvable-residual-modularity"></a>

#### Residual representations with solvable image are automorphic of weight one

**Declaration:** `TauCeti.GL2Transfer.solvable_residual_modularity`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-residual-modularity`.

Let F be a number field, p an odd prime and r̄: G_F → GL₂(F̄_p) continuous and absolutely irreducible with solvable image, and let ρ, λ, f, P be the lift of R17.5/odd-solvable-residual-lift. There is a unique cuspidal automorphic representation π of GL₂(A_F) with π_v ≅ π((ρ∨)_v) at every place v; it is unramified at every finite place where r̄ is unramified, its central character is det ρ read by arithmetic reciprocity, and the reduction of ρ along the lattice R² is r̄ (after conjugation by P). If F is totally real and r̄ is totally odd, then π is holomorphic of parallel weight one in Rogawski–Tunnell's sense: π_v is the weight-one limit π(1, sgn) at every real place. This is the residual modularity input of the solvable case of Boxer–Calegari–Gee–Pilloni, Proposition 10.1.3; it is R17.5/residual-lt-application with its lifting step proved. No statement about the level, ordinarity or a weight-two form is made here.

**Hypotheses.**

- F is a number field; p is an odd prime.
- r̄: G_F → GL₂(F̄_p) is continuous, absolutely irreducible, with solvable image; ρ, E, λ, R, f, P are as produced by odd-solvable-residual-lift.
- Weight-one clause: F totally real and det r̄(c_v) = −1 at every real place v; 'holomorphic of parallel weight one' is Rogawski–Tunnell's definition (R17.5/tr-weight-one).

**Proof or construction.**

1. ρ is irreducible with finite solvable image (odd-solvable-residual-lift), and so is ρ∨. Apply R17.5/solvable-artin to ρ∨: it gives a cuspidal π matching ρ∨ in the geometric convention: in the dihedral case at every place (R17.5/dihedral-artin), in the tetrahedral and octahedral cases at every place by tetrahedral-artin-all-places and octahedral-artin-all-places. Uniqueness is strong multiplicity one (R16.4/strong-multiplicity-one).
2. Since ker ρ = ker r̄, ρ_v is unramified wherever r̄ is, so π_v is an unramified principal series there (R16.3/principal-series-parameter). Duality preserves the ramification kernel; geometric Frobenius on ρ∨ has the same eigenvalues as arithmetic Frobenius on ρ.
3. Weight one: at a real v, ρ(c_v) is an involution with det ρ(c_v) = −1 (oddness clause), hence non-scalar, ρ_v = 1⊕sgn and π_v ≅ π(1, sgn), which is Rogawski–Tunnell's π₁ (R17.5/tr-weight-one). Duality leaves the real involution unchanged. Since Art_arith = Art_geom⁻¹, the central character det(ρ∨)∘Art_geom is detρ∘Art_arith.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-solvable-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin-all-places`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin-all-places`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`.

**Acceptance checks.**

- In BCGP's situation (p = 3 or 5, F a totally real quadratic extension of the base field, r̄ = ϱ with determinant the inverse cyclotomic character, solvable image), the output is a parallel weight one cuspidal π with r̄ as residual representation; their subsequent passage to an ordinary weight-two form, which they take from Barnet-Lamb–Gee–Geraghty, is a separate input not supplied here.
- If r̄ is even at some real place, the construction still gives π but its component there is π(1, 1) or π(sgn, sgn), not of weight one.
- For p = 2 the theorem is not stated: the oddness clause fails, and the characteristic-two case is planned in layer R17.6 of this roadmap.

**Sources.**

- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). Boxer–Calegari–Gee–Pilloni deduce the modularity of a totally odd residual representation with solvable image over a totally real field from a finite odd lift and the theorems of Langlands and Tunnell.
- [J. D. Rogawski and J. B. Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf), §1, definition (ii) of π₁ and Definition of 'holomorphic of weight k', printed p. 4 (PDF p. 5). Rogawski and Tunnell's notion of weight one: at the real places (all of them, for GL₂) the local components are the induced representation π₁ attached to the sign of the upper-left entry; that is the notion used here.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

<a id="r17-5-q-solvable-residual-weight-one"></a>

#### Odd residual representations of G_Q with solvable image come from weight-one newforms

**Declaration:** `TauCeti.GL2Transfer.q_solvable_residual_weight_one`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-solvable-residual-weight-one`.

Let p be an odd prime and r̄: G_Q → GL₂(F̄_p) continuous, irreducible and odd (det r̄(c) = −1), with solvable image. Let ρ, λ, f, P be the lift of R17.5/odd-solvable-residual-lift (n = 2, F = Q). Then there is a normalised cuspidal newform g of weight one, level N = the Artin conductor of ρ and nebentypus det ρ (an odd Dirichlet character under reciprocity), with Galois representation ρ_g ≅ ρ; consequently the reduction of ρ_g along the lattice R² is isomorphic to r̄, and for every prime ℓ ∤ N, f(a_ℓ(g)) = tr r̄(Frob_ℓ) and f(det ρ(Frob_ℓ)) = det r̄(Frob_ℓ) (arithmetic Frobenius). The prime divisors of N are exactly the primes at which r̄ is ramified, p included when r̄ is ramified at p. This is Dieulefait–Pacetti's Theorem 1.3 (Langlands–Tunnell in odd characteristic), with the lifting step written out; N can exceed Serre's conductor of r̄, and no weight-two form is constructed here.

**Hypotheses.**

- p is an odd prime; r̄: G_Q → GL₂(F̄_p) is continuous and irreducible (hence absolutely irreducible, F̄_p being algebraically closed), odd, with solvable image.
- Frobenius elements are arithmetic, as in Deligne–Serre; det ρ is read as a Dirichlet character by class field theory.

**Proof or construction.**

1. odd-solvable-residual-lift gives ρ: G_Q → GL₂(R) ⊂ GL₂(C), irreducible, odd, with finite solvable image and ker ρ = ker r̄.
2. Apply R17.5/solvable-artin and the all-place refinements to ρ∨, obtaining π_v ≅ π((ρ∨)_v) in the geometric convention. At infinity π is the weight-one limit. At an unramified prime ℓ its standard factor is det(1−ρ(Frob_ℓ,arith)ℓ⁻ˢ)⁻¹, because geometric Frobenius is the inverse of arithmetic Frobenius and duality inverts the eigenvalues.
3. R17.5/q-weight-one (Weil–Langlands, Deligne–Serre Théorème 4.10) and R16.6/weight-one-classical-comparison give the normalised weight-one newform g of level N(ρ) and nebentypus det ρ with ρ_g ≅ ρ (Deligne–Serre Théorème 4.1 for the attached representation). In the arithmetic formulation of the classical dictionary, use the preceding factor identity, so the attached Galois representation is ρ, not ρ∨. Deligne–Serre Théorème 4.6 (p. 514) identifies the primitive level with the Artin conductor.
4. Reduction: ρ_g ≅ ρ and r̄ = P·(f∘ρ)·P⁻¹ give the trace and determinant congruences; as r̄ is absolutely irreducible, every stable lattice of ρ_g has reduction isomorphic to r̄ (R01.1/brauer-nesbitt). Ramification: ker ρ = ker r̄, and the Artin conductor exponent at ℓ is positive exactly when ρ is ramified at ℓ.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-solvable-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin-all-places`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin-all-places`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-one-classical-comparison`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

**Acceptance checks.**

- For p = 3 and r̄ surjective onto GL₂(F₃), the theorem specialises to R17.5/octahedral-mod-three-application with some lift, not necessarily the section s used there.
- For a dihedral r̄ induced from a character of an imaginary quadratic field, g is a theta series of that field.
- An even r̄ (det r̄(c) = 1) is excluded: its lifts are even and do not come from holomorphic weight-one forms.

**Sources.**

- [Luis Dieulefait and Ariel Pacetti, A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), §1.1, Theorem 1.3 and its proof, p. 3. Dieulefait and Pacetti state that an odd irreducible mod-p representation of G_Q with solvable image, p odd, is modular, by lifting to an odd complex representation and applying Hecke, Langlands and Tunnell, which provide a weight-one form.
- [Pierre Deligne and Jean-Pierre Serre, Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), §4, Théorème 4.1, pp. 513–514; Théorème 4.6, p. 514; Théorème 4.10, pp. 516–517, and Remark 4.11, p. 517. Deligne and Serre attach an odd two-dimensional Artin representation to a weight-one eigenform and, conversely, show that an odd irreducible representation with entire twisted L-functions comes from a primitive weight-one form of level its conductor and nebentypus its determinant.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`. Implementation: unchecked.

## Supplier contracts and ownership

The following are exact imports or Part II requests. They do not claim that missing APIs are already in the supplier. The packet records the same contracts:

- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters` — Hecke quasi-characters of C_F, their local components, conductor exponents, and decomposition into a unitary character times a real norm power. Character extension is supplied by this packet’s explicit idele-character-extension target. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/isolating-twist-character`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-twisted-functional-equation`.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary` — Congruence-unit subgroups U_v^0 = O_v^× and U_v^m = 1 + 𝔭_v^m for m ≥ 1, and their idele embeddings. The subgroup A is supported on S, not outside S; closedness of F^×A is proved in the isolation sketch, not attributed to this layer. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/isolating-twist-character`.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences` — Density of F^× in ∏_{v ∈ T} F_v^× for a finite set T of places, so that a Hecke character trivial on F_v^× for all v ∉ T is trivial. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-all-place-upgrade`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction` — Brauer's induction theorem: every complex character of a finite group is a Z-linear combination of characters induced from linear characters of (elementary) subgroups, with the projection formula for induction and twisting. Also use its characteristic-zero cyclotomic splitting theorem for Q(ζ_e), without asserting a prime-to-p splitting theorem in characteristic p. For p-rational-character, use character values in Q(ζ_|Γ|) and the finite cyclotomic Galois fixed-field description of Q(ζ_r), r the prime-to-p part of |Γ|. The character-field adapter is absent from current Layer 6 and remains the InductionRestriction Part II obligation G7. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-twisted-functional-equation`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-integral-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-rational-character`.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity` — Finite global Artin reciprocity for abelian extensions, compatible with local reciprocity and norms, to turn each finite Galois character θᵢ into a finite-order Hecke character. Use geometric reciprocity by inverting the arithmetic Artin maps. No global Weil group or identification C_F ≅ W_F^{ab} is requested. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-twisted-functional-equation`.
- `tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-4-finite-dimensional-algebras-and-the-cartan-map` — The projective–simple Hom pairing and Cartan map for split finite-dimensional algebras once the relevant projective covers and split module setting are supplied. The modular-character formula and class count are supplied by the separate targets projective-brauer-hom and brauer-class-count. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`.
- `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor` — Classical newform theory over Q in weight one: primitive forms, their level and nebentypus, normalised Hecke eigenvalues. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-solvable-residual-weight-one`.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles` — Local compactness of the ideles, continuity of the idele norm, the Hausdorff idele-class quotient and the principal subgroup input; combine these with the explicit norm-bounded compact sets A_ε in the isolation proof. Character extension is separately proved by idele-character-extension. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/isolating-twist-character`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem` — Use current Peter–Weyl representativeStarSubalgebra_separatesPoints. For compact abelian K, Schur makes irreducibles one-dimensional, giving separation by unitary characters. Do not rebuild Peter–Weyl. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/compact-character-extension`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups` — Use character_orthonormal and normalized Haar integration on closed compact L. The character-extension proof applies this to one-dimensional characters. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/compact-character-extension`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra` — Use the general finite-dimensional algebra targets of Layer 3A: primitive orthogonal idempotents, nilpotent radical, simple-block dictionary, semiperfectness and projective covers. The carrier is kΓ, not necessarily a path algebra. No projective-cover theory is duplicated here. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/projective-modular-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/projective-brauer-hom`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-class-count`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-algebra-splitting-field`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/split-simple-scalar-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness` — Use the finite-dimensional Wedderburn decomposition and simple-module/block dictionary, including split full matrix blocks; this is not the central-simple splitting extension theorem of Layer 6. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-algebra-splitting-field`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/split-simple-scalar-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-class-count`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup` — Use current characteristic-zero Clifford correspondence. Part II must supply cyclic-quotient extension over C (an invariant irreducible of N extends when Γ/N is cyclic, by rescaling the generator intertwiner), and the ordinary relative-degree theorem: if N◁Γ and θ∈Irr(N) occurs in χ_N, then χ(1)/θ(1) is an integer dividing [Γ:N]. The current Layer 5 supplies the correspondence; add cyclic-quotient extension and relative-degree divisibility as InductionRestriction, Part II, before the strengthened Fong–Swan induction. Modular Clifford is the explicit modular-clifford-correspondence node, never attributed to this Maschke layer. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/coprime-index-lift-correspondence`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-group-index-lift-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/determinant-order-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/p-rational-p-group-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/equivariant-fong-swan`.
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions` — Finite p-adic extensions with complete DVR rings of integers and finite residue fields; take finite cyclotomic composita. The prescribed unramified residue extension is imported separately from Layer 2. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/complete-splitting-modular-system`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-0-the-functorial-core----transitivity-and-the-projection-formula` — Induction of group-algebra modules, transitivity, the projection formula and the explicit direct sum over cosets, over any field. No Maschke condition is used for this carrier. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/modular-clifford-correspondence`.
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius` — The existing finite unramified extension of Q_p with prescribed finite residue degree; choose an embedding of its residue field before claiming uniqueness of an isomorphism. Consumers: `GL2AutomorphicRepresentationsAndTransfer:R17.5/complete-splitting-modular-system`.

Proposed owner changes preserve the present ids until the maintainer integrates them:

- RT-AREA-automorphic-1/1 (handed to this job): the tetrahedral and octahedral cases rest on GL₃ inputs (adjoint lift, cyclic cubic induction, GL₃ recognition, non-normal cubic base change) that R17.4's cyclic base change does not supply. R17.3's packet already proposes R17.4a for them and AL.3b for the GL_n converse; the R17.5 nodes of this packet add no GL₃ input: the all-place upgrade uses only GL₂ local theory, Hecke–Artin functional equations and Jacquet–Langlands's isolating twist. Keep R17.3's proposal: R17.4a 'Non-normal cubic base change and the Gelbart–Jacquet lift' between R17.4 and R17.5, holding R17.4/adjoint-lift, cubic-character-induction, gl3-recognition and nonnormal-cubic-base-change, requiring R17.4, AutomorphicLFunctionsAndLocalFactors:AL.3 and AL.3b, consumed by R17.5 (through R17.5/tetrahedral-artin and R17.5/octahedral-artin, hence through tetrahedral-artin-all-places and octahedral-artin-all-places here).
- R17.5/gl2-local-converse and R17.5/gl2-twist-stability are statements of local GL₂ theory (Jacquet–Langlands §§2–3). No packet plans them; R17.5 is their first consumer, so they are planned here. R17.4/adjoint-lift uses a GL₃ local converse theorem that no packet plans either. When the R16.1 packet (stage R16.3) is next revised, move both nodes to R16.3 unchanged and repoint R17.5/artin-all-place-upgrade; R16.3 is upstream of R17.5, so no cycle arises.
- R17.5/artin-twisted-functional-equation (continuation and functional equation of Artin L-functions twisted by Hecke quasi-characters, with Langlands–Deligne constants) is Galois-side L-function theory. ArithmeticGaloisRepresentations R01.2 (upstream tier 7) owns Deligne's local constants and the inductivity of local factors but no global functional equation. ArithmeticGaloisRepresentations R01.2 adopts the node as its global functional equation; GL2AutomorphicRepresentationsAndTransfer:R17.5 then cites it. Until then this packet owns it.
- Brauer characters are planned twice: KTheoryFiniteLocalFields:L.1/brauer-character (for Quillen's Brauer lift) and R17.5/brauer-character (for the Fong–Swan lift). KTheoryFiniteLocalFields is not among the roadmaps the upstream order places below this one (research/blueprint/upstream/CaraianiNewton.md), so the notion moves down here rather than being imported from there. KTheoryFiniteLocalFields:L.1 imports R17.5/brauer-character (finite-field coefficients by extension of scalars to an algebraic closure) and keeps its Green virtual-character and Brauer-lift ring homomorphism nodes.
- The idele extension and subgroup-topology targets are arithmetic instances. Their real/compact/open foundations are new; CompactGroups remains the existing owner of Peter–Weyl and character orthogonality. Move idele-character-extension and isolation-subgroup-topology to GlobalNumberFields, Part II, with the five real/compact/open targets as its foundation; preserve their CompactGroups imports. Current main does not contain character extension. Until integrated, the explicit targets remain here.
- G2 now has an independent preliminary prefix and an exact outstanding induction-constant product contract. Move preliminary-artin-functional-equation, global-induction-constant-product and artin-twisted-functional-equation to R01.2, in prefix → local-epsilon-factor → product → final order. Repoint the existing local existence input first; no supplier returns to the final theorem.
- Current ordinary Clifford theory does not supply modular inertia correspondence or the mixed-character lifting correspondences. InductionRestriction, Part II adopts modular-clifford-correspondence, coprime-index-lift-correspondence, p-group-index-lift-comparison, determinant-order-extension and p-rational-p-group-extension. Add ordinary relative-degree divisibility there. Keep equivariant-fong-swan and fong-swan together at their first consumer until the owner integrates them. Include the p-rational-character predicate, its cyclotomic fixed-field compatibility, and cyclic-quotient extension in that modular Part II.
- General finite-algebra splitting and split simple scalar-extension are missing extensions of the finite-dimensional-algebra owner. Projective covers and primitive idempotents already exist in its plan and are not re-planned. QuiverRepresentations, Part II adopts finite-algebra-splitting-field and split-simple-scalar-extension. The finite-field corollary, complete modular systems and projective character comparison remain the modular-representation consumer’s explicit targets. Do not substitute SemisimpleAlgebras Layer 6’s central-simple splitting theorem.

Consumer retargets:

- `ClassicalSerreModularity:R33.1/dp-target-and-the-weight-at-least-two-convention`, `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`, `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`, `ClassicalSerreModularity:R26.6/corollary-1-2-proof`, `EllipticCurveModularityWild3Adic:W3.6/wild-lifting-application` → `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-solvable-residual-weight-one`. Odd residual representations of G_Q with solvable image, p odd, come from weight-one newforms with the lift written out.
- `PotentialModularityAndCompatibleSystems:R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`, `PotentialModularityAndCompatibleSystems:R23.3/taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l`, `ModularityAndLanglandsExtensions:ML.1/totally-real-odd-artin` → `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-residual-modularity`. Residual modularity in weight one over number fields and totally real fields.
- `AutomorphicGaloisRepresentations:R19.2/carayol-cubic-base-change-of-extraordinary`, `AutomorphicGaloisRepresentations:R19.2/carayol-ordinary-cuspidal-places` → `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin-all-places`. Carayol's §12.2 needs tetrahedral and octahedral automorphy at the dyadic place itself, which is the all-place statement (also R17.5/octahedral-artin-all-places).
- `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor` → `GL2AutomorphicRepresentationsAndTransfer:R17.5/preliminary-artin-functional-equation`. Replace the unowned global-FE proof input by this preliminary Brauer/Hecke target. Its closure contains no local-epsilon-factor. When moving owners, preserve preliminary → local existence → induction-product → final FE; never point local existence at the final FE.

The declared incoming stage links are:

- `GL2AutomorphicRepresentationsAndTransfer:R16.3` → `GL2AutomorphicRepresentationsAndTransfer:R17.5`: R17.5/artin-all-place-upgrade compares local components through the rank-two local correspondence and its twisted factors (principal series, Steinberg, supercuspidal, archimedean).
- `GL2AutomorphicRepresentationsAndTransfer:R16.4` → `GL2AutomorphicRepresentationsAndTransfer:R17.5`: Generic local components of cuspidal representations and strong multiplicity one (R16.4/global-whittaker-expansion, R16.4/strong-multiplicity-one).
- `GL2AutomorphicRepresentationsAndTransfer:R16.5` → `GL2AutomorphicRepresentationsAndTransfer:R17.5`: RT-AREA-automorphic-1/11: the functional equation of twisted cuspidal L-functions in the global normalisation (R16.5/global-epsilon-normalization).
- `GL2AutomorphicRepresentationsAndTransfer:R16.6` → `GL2AutomorphicRepresentationsAndTransfer:R17.5`: RT-AREA-automorphic-1/11: the weight-one classical dictionary over Q (R16.6/weight-one-classical-comparison).

## Source collation and corrections

Each source was read in the edition listed below on 2026-10-14. Locators refer to printed pages of that edition; the IAS Jacquet–Langlands retypesetting and author prepublication versions are distinguished from later printings. Tunnell’s archived publisher PDF has the original recorded SHA-256 and all three pages were collated. The independent review history remains intact, including its earlier unavailable-source verdict; the revision supplies fresh evidence for the next independent review.

- Hervé Jacquet and Robert P. Langlands, *Automorphic forms on GL(2)*. Lecture Notes in Mathematics 114 (1970); IAS retypeset edition, whose printed page numbers are cited (PDF page = printed page + 6) [Source](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf). Read: §2, Theorem 2.18 and Corollary 2.19, pp. 37–40; §3, Proposition 3.8, pp. 57–58; §11, statement of Theorem 11.1, p. 179; §12, Proposition 12.1 through the end of the proof of Theorem 12.2 (Lemmas 12.3–12.5), pp. 206–212.
- Robert P. Langlands, *Base change for GL(2)*. Annals of Mathematics Studies 96 (1980); author's version at the Digital Mathematics Archive, cited by its own page numbers (PDF page = page + 3) [Source](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf). Read: §2, properties A)–F) of global liftings, p. 14; §3 opening, Lemmas 3.1–3.2 and property G), pp. 15–16; §3(i) tetrahedral type, pp. 16–19; §3(ii) octahedral type, p. 19.
- Pierre Deligne, *Les constantes des équations fonctionnelles des fonctions L*. Modular Functions of One Variable II, Lecture Notes in Mathematics 349 (1973), 501–597; IAS copy (PDF page = printed page − 500) [Source](https://publications.ias.edu/sites/default/files/Number20.pdf). Read: §3.12(A)–(C), p. 533; §4, Théorème 4.1, p. 535; §5, 5.11 and the demonstrations paragraph, p. 551; 3.11.3–4 p. 532; global construction 4.12 pp. 544–545; Full 3.12(A)–(D), pp. 533–534; 4.14, p. 545.
- Peter Webb, *A Course in Finite Group Representation Theory*. Cambridge Studies in Advanced Mathematics 161 (2016); the author's prepublication version of 23 February 2016, which he states has the same mathematical content (printed page = PDF page − 7) [Source](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf). Read: §9.2, Theorem 9.2.6 and proof, p. 143; scalar-extension remarks p. 144 and §9.8 Exercises 4, 8(a), pp. 165–166; Artin–Wedderburn 2.1.3, pp. 15–16; projective tensor product 8.1.4, pp. 121–122; §9.2, Theorem 9.2.7 and the following remarks, p. 144; §9.4, pp. 148–156 (Lemma 9.4.6 through Theorem 9.4.12, including 9.4.11); §10.2, Proposition 10.2.1, p. 174; §10.1, Lemma 10.1.1, Example 10.1.2 and Proposition 10.1.3, pp. 170–171; §10.2, Theorem 10.2.2 and Corollary 10.2.3, pp. 176–177; §9.3, Theorem 9.3.6 and proof, p. 147; 9.3.1–9.3.6 pp. 145–147; 9.4.3–9.4.5 pp. 149–152; 9.6.2 pp. 163–164; full 10.2.1 proof pp. 174–175.
- I. M. Isaacs, *Lifting Brauer characters of p-solvable groups*. Pacific Journal of Mathematics 53 (1974), no. 1, 171–188 (printed page = PDF page + 169) [Source](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf). Read: Definition 1.1, p. 171; cyclotomic Galois notation, §4, p. 177; §1, Definition 1.1, Theorems 1.2 and 1.4, pp. 171–172; statements of Theorem 3.1, Lemma 4.1, Theorem 4.2 and Lemma 5.1, pp. 174–179; §5, Theorem 5.4 and its proof, pp. 179–180; Proofs of 2.2, 3.1, 4.1–4.7, 5.4 and Theorem 1.2 in §6, pp. 173–181.
- Colin J. Bushnell and Guy Henniart, *The Local Langlands Conjecture for GL(2)*. Grundlehren der mathematischen Wissenschaften 335, Springer (2006); cited by printed page [Source](https://doi.org/10.1007/3-540-31511-X). Read: §27.1–27.2, p. 170; §27.8, pp. 175–176; §30.8 preliminary functional equation, pp. 197–198; §30.9 local existence discussion, pp. 198–199.
- George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*. Publications mathématiques de l'IHÉS 134 (2021), 153–501; published version [Source](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf). Read: §10.1, Proposition 10.1.3 and its proof, pp. 473–474.
- Pierre Deligne and Jean-Pierre Serre, *Formes modulaires de poids 1*. Annales scientifiques de l'ÉNS (4) 7 (1974), 507–530; Numdam [Source](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf). Read: §4, Théorème 4.1 and Corollaire 4.2, pp. 513–514; §4, 4.9–4.11 (Théorème 4.10, Weil–Langlands), pp. 516–517.
- Jerrold Tunnell, *Artin's conjecture for representations of octahedral type*. Bulletin of the AMS (N.S.) 5 (1981), no. 2, 173–175; AMS PDF [Source](https://web.archive.org/web/20231206042832id_/https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf). Read: pp. 173–175 (whole note).
- Luis Dieulefait and Ariel Pacetti, *A simplified proof of Serre's conjecture*. arXiv:2108.07577v2 [Source](https://arxiv.org/pdf/2108.07577v2). Read: §1.1, Theorems 1.2–1.3 and Remark 1, pp. 1–3.
- J. D. Rogawski and J. B. Tunnell, *On Artin L-functions associated to Hilbert modular forms of weight one*. Inventiones mathematicae 74 (1983), 1–42; GDZ scan without text layer, read as a page image [Source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf). Read: §1, the representations π_k, π₁ and the definition of holomorphic of weight k, p. 4.
- Dikran Dikranjan, *Introduction to Topological Groups*. Author lecture notes, version 26 February 2018, printed pagination [Source](https://users.dimi.uniud.it/~dikran.dikranjan/ITG.pdf). Read: Theorem 2.1.10 and Corollary 2.1.11, pp. 3–4; Lemma 7.2.3, p. 47; Theorem 8.1.2 and §8.2 proof, pp. 51–54; Example 12.2.4, p. 87, using the lifting Lemma 8.0.7, pp. 50–51; Lemma 12.3.5, p. 90; Corollary 11.3.4, p. 76; Lemma 12.4.11, pp. 94–95; Lemma 8.0.7, pp. 50–51.

All source findings are expressed in our own words. E16 and E17 remain rejected; the combined subgroup-classification/Tate argument and the projective wording respectively do not establish the alleged published errors. E18 is limited to Webb’s author prepublication remarks. New findings remain unreviewed and concern only the exact versions collated:

- **E16**, Proposition 10.1.3, proof, second paragraph (solvable case), printed p. 474 of the published IHÉS version: In the solvable case the proof obtains a totally odd lift to characteristic zero with finite solvable image of the representation ϱ of G_E (E a totally real quadratic extension of the base field), using only the list of finite subgroups of GL₂ over finite fields and Tate's projective lifting theorem (their reference Ser77, Theorem 4), and then invokes Langlands and Tunnell. Correction: Tate's theorem lifts a projective representation into PGL₂(C) to GL₂(C) but says nothing about reduction modulo a prime above p; the argument needs a lift whose reduction is ϱ itself. The Fong–Swan theorem for the finite solvable image of ϱ provides such a lift over the localisation of a number field at a prime above p, with the same kernel as ϱ, and total oddness follows because p > 2 (R17.5/solvable-integral-lift, R17.5/odd-solvable-residual-lift). Reason: Reduction of the Tate lift is defined only after embedding the finite projective image into PGL₂ of a p-adic ring compatibly with reduction, which the proof does not construct; for p dividing the order of the image (p = 3 with image A₄ or S₄, the case of the proposition with p = 3) no prime-to-p averaging argument is available. The conclusion of the proposition is correct. Independent verdict: rejected.
- **E17**, §1.1, proof of Theorem 1.3, p. 3 of arXiv:2108.07577v2: After the subgroup classification, the proof asserts without argument the existence of an odd complex lift of the residual representation in each solvable case, then appeals to Hecke, Langlands and Tunnell for a weight-one form. Correction: To conclude that the residual representation is modular one needs an odd complex lift whose reduction at a prime above p is the given residual representation; this is supplied by the Fong–Swan theorem (R17.5/odd-solvable-residual-lift), not by an arbitrary lift. Reason: A complex lift of the projective representation can have a reduction that differs from the residual representation, or no natural reduction at all, unless it is built from an integral model reducing to it. Independent verdict: rejected.
- **E18**, §9.2, remarks after Theorem 9.2.7, printed p. 144, and the paragraph introducing p-modular systems in §9.4, printed p. 148 (prepublication version of 23 February 2016): With m the exponent of G, the remarks treat the extension of F_p by a primitive m-th root of unity as a splitting field and require primitive n-th roots of unity in any splitting field of a cyclic group of order n; the p. 148 paragraph transfers primitive m-th roots of unity from F to the residue field. Correction: In characteristic p the exponent m must be replaced by its prime-to-p part m′ (and n by its prime-to-p part): F_p(ζ_{m′}) is a splitting field, the residue field contains the primitive m′-th roots of unity, and a cyclic p-group has the prime field as splitting field. Reason: In characteristic p, x^{p^a b} − 1 = (x^b − 1)^{p^a}, so every root of unity has order prime to p and no primitive m-th root exists when p divides m; the only simple module of a p-group in characteristic p is trivial. Theorem 9.2.7 itself is correct, its hypothesis being unsatisfiable in characteristic p when p divides the exponent. Independent verdict: confirmed.
- **E19**, Proposition 9.4.5(5), final equivalence, p. 151, author prepublication PDF dated 23 February 2016: The criterion for two projective RG-modules L₁,L₂ to be isomorphic compares the reduction of L₁ with itself. Correction: The right-hand reduction must be L₂/πL₂. Reason: As printed, the right-hand condition is always true, even for free RG-modules of different ranks. The preceding unique-lift assertion proves the intended comparison. No published correction was found in the recorded author-page searches; no later version is asserted to share the defect. Independent revision-2 verdict: confirmed.
- **E20**, Theorem 2.1.10 proof, p. 3, author notes version 26 February 2018: In adjoining x to the domain, the extension formula adds kx to g(h), although x is in the source group, and the subsequent multiple of l has its sign reversed. Correction: Choose ly=g(lx) in the divisible target and set the extension value to g(h)+ky. If h+kx=h′+k′x, use k′−k=sl, hence h−h′=slx. Reason: The target sum must lie in D. With the corrected sign, g(h)−g(h′)=(k′−k)y proves well-definedness. No published correction was found in the recorded author-page searches; no later version is asserted to share the defect. Independent revision-2 verdict: confirmed.
- **E21**, Corollary 8.1.5 proof, p. 52, author notes version 26 February 2018: The compact-product argument repeats V when listing the two compact factors. Correction: Both V and the lattice factor D are compact. Reason: Projection from the topological product makes each factor compact; this forces both its vector dimension and lattice rank to be zero. No published correction was found in the recorded author-page searches; no later version is asserted to share the defect. Independent revision-2 verdict: confirmed.
- **E22**, Lemma 8.2.1 proof, pigeonhole comparison on p. 53, author notes version 26 February 2018: One fractional-part tuple uses the basis vectors vᵢ instead of the coordinates hᵢ of the element under consideration. Correction: Compare the two tuples ({mh₁},…, {mh_n}) and ({lh₁},…, {lh_n}). Reason: Only these tuples yield a small nonzero vector (m−l)h−z in H, the contradiction used immediately after the comparison. No published correction was found in the recorded author-page searches; no later version is asserted to share the defect. Independent revision-2 verdict: confirmed.
- **E23**, Lemma 8.2.3 and Exercise 8.2.4 proofs, pp. 53–54, author notes version 26 February 2018: The cyclic intersection H₁=H∩L is written as H in the cyclicity assertion; the subsequent lift range runs to n rather than the number of projected generators. Correction: Use H₁ for the cyclic subgroup and index the lifted projected generators over their displayed generating family. Reason: A discrete H in Rⁿ can have rank greater than one; only its nonzero subgroup in the line L is cyclic. A lift exists for each displayed projected generator, not for extra ambient-coordinate indices. No published correction was found in the recorded author-page searches; no later version is asserted to share the defect. Independent revision-2 verdict: confirmed.
- **E24**, Lemma 8.2.5 proof, limit line in Case 2, p. 54, author notes version 26 February 2018: The approximating vector in the membership/limit line uses the limiting direction u₀ rather than the chosen direction u_n. Correction: Use k_n λ_n u_n∈H, with k_nλ_n→ξ and u_n→u₀; closedness then gives ξu₀∈H. Reason: Membership is known for λ_nu_n. Replacing its direction before taking the limit is not justified. The packet’s small-vector proof takes the limit of the actual elements of H. No published correction was found in the recorded author-page searches; no later version is asserted to share the defect. Independent revision-2 verdict: confirmed.
- **E25**, Lemma 8.0.7 proof, p. 51, author notes version 26 February 2018: The local lift ξ∘q is said to have open image before openness of q is assumed. In the final paragraph q(U₁) is placed in W₁, a subset of the source of the quotient map. Correction: Before the additional open-map hypothesis conclude only continuity and local additivity. In the open-map paragraph use q(U₁)⊆p(W₁). Reason: Take H=R, D=0 and q=0: the local lift has singleton image, which is not open. The lemma remains valid; openness is required only for its additional conclusion, where the quotient-domain notation must be respected. No published correction was found in the recorded author-page searches; no later version is asserted to share the defect. Independent revision-2 verdict: confirmed.

## Coverage and acceptance

- **G1** — The seven topology/extension nodes prove the exact idele instance needed by JL70; current CompactGroups supplies Peter–Weyl. No general LCA duality is silently requested.
- **G3** — Projective covers imported from QuiverRepresentations; explicit complete-system, lift, vanishing, Hom and class-count targets supply the modular character comparison.
- **G4** — The modular Clifford, comparison and extension targets make the full Isaacs strengthened induction explicit. Its additional ordinary-character Part II inputs remain G7.
- **G5** — Finite splitting and split scalar-extension classification prove arbitrary-k simple descent up to isomorphism.
- **G6** — All three Tunnell pages collated in archived AMS PDF, hash matching the original record. The weak descent and cubic supplier contract are verified.

- **Remaining G2: Product of local induction constants** — The preliminary Brauer/Hecke FE is now explicit and independent of local epsilon existence. What remains is a noncircular proof of ∏_v λ_v(K/F,ψ)=1 with trace characters, all archimedean places and Tamagawa measures, or a collated source proving the required local-to-global comparison. Deligne 5.11 p. 551 states the final product formula but its brief proof refers to known arguments; this revision has not established the induction-constant calculation from the cited Poisson target. Keep this exact R01.2 Part II obligation. Do not replace it by unrestricted local inductivity or use the final FE as its proof.

- **Remaining G7: Ordinary-character refinements in InductionRestriction Part II** — Current InductionRestriction Layer 5 supplies ordinary Clifford correspondence but does not state cyclic-quotient extension of an invariant complex irreducible or the relative-degree theorem χ(1)/θ(1) dividing [Γ:N]. Layer 6 supplies cyclotomic splitting but does not state the fixed-field/intersection adapter equating prime-to-p cyclotomic value membership with Isaacs p-rationality and Galois invariance. The exact statements are already in requests and the modular Part II owner proposal. Keep them as pending refinements, rather than attributing them to current Layers 5–6; the new modular targets and strengthened induction are conditional on these inputs.

The independent revision-2 review accepts this complete target-level pass with **planned**, rather than closed, coverage. Completing the end results requires the exact G2 product proof, the G7 owner refinements and integration of the supplier retargets. The inherited GL₃/JPSS, classical Hilbert weight-one and multi-place finite-order prescription obligations remain with their suppliers. The proposed supersessions of R17.3’s odd-residual-lift and residual-lt-application have pending status; `closesGaps` is empty.

The suggested file elaborated with only proof-placeholder warnings at the pinned libraries. Its real-bodied Brauer character and p-rational predicates have meaningful examples, and it retains the proved involution oddness argument. Where the full carrier is absent, the README target includes the complete signature and acceptance contract rather than a data placeholder. None of this is an implementation claim.

Independent review: Codex, session codex-sPeoxc, [#9767](https://github.com/CBirkbeck/tauceti-explorer/issues/9767). The [review report](../reviews/REV-GL2AutomorphicRepresentationsAndTransfer--R17.5~2.md) records all node verdicts, source collation, locator corrections and validation.
