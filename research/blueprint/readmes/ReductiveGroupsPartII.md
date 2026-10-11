# Reductive algebraic groups, Part II: local structure and arithmetic models

This roadmap extends the Tau Ceti roadmap *Reductive algebraic groups*, its first prerequisite, to connected reductive groups over valued local fields and their integral models. It plans topologies on rational points, affine Weil restriction, valued root data, Bruhat–Tits buildings, parahoric schemes and depth filtrations, local decompositions, and integral Langlands dual groups. The unvalued theory is supplied by the anchor: the functor of points, Lie algebras, components and quotients, tori, unipotent radicals, reductivity, relative and absolute root data, parabolic subgroups and pinned Chevalley–Demazure groups.

The document is the mathematical specification. The accompanying suggested Lean file supplies unproved prototype signatures and discriminating examples. All targets await implementation. The plan has seven layers, with direct prerequisite chains ending in pinned library declarations or explicitly named lower-tier roadmap suppliers.

## Conventions and boundaries

The coefficient ring for affine group schemes is a commutative ring `R`; the coordinate object is a commutative Hopf `R`-algebra. Its `A`-points form Tau Ceti’s convolution group `WithConv (H →ₐ[R] A)`. Point topologies use evaluation maps and scheme charts. The topology of `G_m(R)` is the hyperbola topology, with continuity of inversion in the subspace unit topology imposed only where needed.

The valued field `K` is henselian, with a nontrivial discrete valuation and perfect residue field `κ`, unless a target imposes stronger hypotheses. The principal instances are a nonarchimedean local field `E` with residue cardinality `q`, and `Ĕ`, the completion of its maximal unramified extension, with arithmetic Frobenius `σ`. The additive valuation satisfies `ω(ϖ)=1`; `|ϖ|=q⁻¹` over `E`. Under field extension the valuation is compared with its ramification scaling. Residue characteristic zero and positive characteristic have separate tame conventions.

For a maximal `K`-split torus `S`, put `Z=Z_G(S)`, `N=N_G(S)`, `W₀=N(K)/Z(K)` and `V=X_*(S)⊗ℝ`. Relative roots may be nonreduced. The centralizer translation has sign `⟨χ,ν(z)⟩=−ω(χ(z))`; the Kottwitz homomorphism of `G_m` has sign `ω`. A metric requires a chosen Weyl-invariant positive form, including a form on the central directions.

The building is enlarged unless the reduced building is specified. A parahoric subgroup is the integral-point group of the connected Bruhat–Tits model. Fixer schemes and full stabilizers carry additional component data. The integral dual group is defined over ℤ; normalized Satake coefficient choices belong to its consumers.

Local-field arithmetic is imported from *Local fields and ramification*. General Coxeter combinatorics and finite chamber theory are imported from *Root systems*. Affine Weil restriction extends *Modular curves*, Layer 0F, and proves agreement with its finite-presentation case. General algebraic-space Weil restriction, Shimura-data classification, affine Grassmannian geometry and tame representation theory remain with their respective owners. Lang lifting and algebraic fundamental-group/Kottwitz inputs used by higher arithmetic roadmaps are supplied here.

## Layers

| Layer | Targets | Scope |
| --- | ---: | --- |
| [RG2.0](#rg2-0) | 16 | Topologies on rational points |
| [RG2.0a](#rg2-0a) | 15 | Affine Weil restriction and the Deligne torus |
| [RG2.1](#rg2-1) | 29 | Valued root data and apartments |
| [RG2.2](#rg2-2) | 25 | Buildings and classical lattice models |
| [RG2.3](#rg2-3) | 54 | Smooth models, parahorics and depth filtrations |
| [RG2.4](#rg2-4) | 28 | Iwahori–Weyl groups and local decompositions |
| [RG2.5](#rg2-5) | 12 | Integral dual groups and L-groups |

Prerequisites within each layer appear before their consumers. Every construction lists its user API and tests; each theorem lists a proof outline and concrete acceptance properties. Source page numbers refer to the editions in the bibliography.

<a id="rg2-0"></a>

## RG2.0. Topologies on rational points

The initial topology on affine points extends to scheme points over suitable local rings. Integral points, congruence quotients and completed unramified fields provide the topological and arithmetic inputs to the building and model layers.

<a id="RG2-0-affine-point-topology"></a>

### The topology on points of an affine algebra

Target `ReductiveGroupsPartII:RG2.0/affine-point-topology`. Definition; suggested declaration `PointTopology.topology`.

Let k be a commutative ring, A a commutative k-algebra and R a commutative k-algebra carrying a topology for which R is a topological ring. The point topology on X(R) = Hom_{k-alg}(A, R) is the coarsest topology for which every evaluation map ev_a : X(R) → R, f ↦ f(a), with a ∈ A, is continuous; equivalently it is the subspace topology of the injection X(R) ↪ R^A = ∏_{a∈A} R with the product topology. On the convolution carrier of the points of an affine group scheme (a commutative Hopf k-algebra H) it is transported along the identity of underlying maps.

**Hypotheses.** k a commutative ring; A a commutative k-algebra (no finiteness needed for the definition); R a commutative k-algebra which is a topological ring (no Hausdorff hypothesis).

**Prerequisites.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`; `mathlib:MvPolynomial.continuous_eval`.

**Uses.**

- AdelicAlgebraicGroups:AA.0 and AA.1 (request to RG2.0): topologizes G(R) for every Hausdorff topological ring R, including adele rings and local fields, before restricted products are formed.
- SmoothRepresentationsOfLocalGroups:SR.0: the locally profinite group G(E) on which smooth representations are defined.
- ShimuraData:D0 (request): the real points G(ℝ) and S(ℝ) with their real topology.
- Conrad, Weil and Grothendieck approaches, §2: the functorial topology on X(R) used to compare adelic points.
- ReductiveGroupsPartII:RG2.0/integral-points-compact-open: compares 𝒳(O) and X(E) inside this topology.

**API.**

- `PointTopology.topology` (constructor): The topology on Hom_k(A, R) generated by the evaluation maps.
- `PointTopology.continuous_eval` (characterisation): For every a ∈ A the evaluation f ↦ f(a) is continuous.
- `PointTopology.continuous_iff` (universal-property): A map g : Y → Hom_k(A, R) from a topological space is continuous iff y ↦ g(y)(a) is continuous for every a ∈ A.
- `PointTopology.isEmbedding_toPi` (characterisation): The map Hom_k(A, R) → (A → R), f ↦ ⇑f, is a topological embedding for the product topology.
- `PointTopology.instTopologicalSpaceWithConv` (instance): The topology on the convolution carrier WithConv (H →ₐ[k] R) is induced by ofConv.
- `PointTopology.continuous_ofConv` (coercion): ofConv : WithConv (H →ₐ[k] R) → (H →ₐ[k] R) is continuous (indeed an embedding).

**Unit tests.**

- `PointTopology.polynomial_homeomorph` (computation): For A = k[t], f ↦ f(t) is a homeomorphism Hom_k(k[t], R) ≅ R.
- `PointTopology.discrete_of_discrete` (degenerate): If R carries the discrete topology then so does Hom_k(A, R) for A of finite type.
- `PointTopology.units_hyperbola` (non-example): For R = ℚ_p the point topology on Hom(ℤ[t,t⁻¹], R) agrees with the subspace topology of ℚ_p^× ⊂ ℚ_p, while for a topological ring with discontinuous inversion on R^× (for example the adeles) the two differ; a definition by the subspace topology of R would be wrong.
- `PointTopology.pi_compat` (compatibility): Under ⇑ the topology is the subspace topology of Mathlib's Pi topology on A → R.

**Construction or proof.**

1. Take the initial topology generated jointly by the evaluations ev_a, for a ∈ A. This is the subspace topology of the map into R^A (Conrad, Proposition 2.1, p. 2).
2. Record continuity of each ev_a and the universal property of initial topologies: a map into X(R) is continuous iff all its composites with the ev_a are continuous.
3. For a commutative Hopf algebra H, use the same topology on the carrier WithConv (H →ₐ[k] R) of the Tau Ceti convolution group, transported by ofConv.

**Acceptance.**

- For A = k[t] the evaluation at t is a homeomorphism X(R) ≅ R.
- For A = k[t, t⁻¹] the map f ↦ (f(t), f(t⁻¹)) is an embedding onto the hyperbola xy = 1 in R², which differs from the subspace topology of R^× ⊂ R when inversion is not continuous (adeles).

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Proposition 2.1, p. 2. Characterizes the topology on X(R) for affine finite type X over a topological ring as the weakest one making the maps X(R) → R given by elements of the coordinate ring continuous, equivalently as the subspace topology of R^A; this is the definition adopted here (without a finiteness hypothesis for the definition itself).
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): §3, pp. 3–4. Explains that the unit group of a topological ring with the subspace topology need not be a topological group, which is why the hyperbola model of G_m is the right one.

Atlas planet: **Topology on rational points**.

<a id="RG2-0-completed-maximal-unramified-extension"></a>

### The completed maximal unramified extension Ĕ

Target `ReductiveGroupsPartII:RG2.0/completed-maximal-unramified-extension`. Construction; suggested declaration `MaxUnramifiedCompletion.Breve`.

Let E be a nonarchimedean local field with residue field κ of order q and E^ur ⊂ E^sep its maximal unramified extension (Tau Ceti LocalFieldsRamification, Layer 2). The valuation of E extends uniquely to E^ur; L = Ĕ is the completion of E^ur. Then L is a complete discretely valued field whose valuation restricts to ω_E (so a uniformizer ϖ of E is a uniformizer of L), its ring of integers O_L is the completion of O_{E^ur}, its residue field is an algebraic closure κ̄ of κ (in particular perfect), the arithmetic Frobenius of E^ur/E extends by continuity to a continuous automorphism σ of L with σ(x) ≡ x^q mod m_L on O_L, and L^σ = E, O_L^σ = O_E. In mixed characteristic, O_L ≅ W(κ̄) ⊗_{W(κ)} O_E. The field L has infinite transcendence degree over E.

**Hypotheses.** E a nonarchimedean local field (Mathlib IsNonarchimedeanLocalField); a fixed separable closure E^sep.

**Prerequisites.** `mathlib:UniformSpace.Completion`; `mathlib:IsNonarchimedeanLocalField`; `mathlib:WittVector.isDiscreteValuationRing`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

**Uses.**

- He, Cordial elements, §2.1; He, Cocenters I, §4.3: the coefficient field Ĕ with Frobenius σ over which Iwahori–Weyl groups and affine Deligne–Lusztig varieties are formed.
- Gleason–Lim–Xu, §§1.1–2: the base L = Q̆_p with arithmetic Frobenius φ and inertia I.
- ReductiveGroupsPartII:RG2.1/steinberg-quasi-split: Steinberg's theorem over L, which needs the residue field algebraically closed.
- ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism: the Kottwitz map is defined on G(L).
- BunGAndNewtonStrata:BG0: σ-conjugacy classes in G(L).

**API.**

- `MaxUnramifiedCompletion.Breve` (constructor): The field Ĕ attached to E.
- `MaxUnramifiedCompletion.frobenius` (data): The continuous arithmetic Frobenius σ ∈ Aut_E(Ĕ).
- `MaxUnramifiedCompletion.frobenius_congr` (characterisation): For x ∈ O_Ĕ: σ(x) − x^q ∈ m_Ĕ.
- `MaxUnramifiedCompletion.fixedPoints_frobenius` (characterisation): {x ∈ Ĕ : σ x = x} is the image of E.
- `MaxUnramifiedCompletion.residueField_isAlgClosed` (instance): The residue field of Ĕ is algebraically closed.
- `MaxUnramifiedCompletion.isUniformizer_algebraMap` (compatibility): The image of a uniformizer of E is a uniformizer of Ĕ.
- `MaxUnramifiedCompletion.completeSpace` (instance): Ĕ is complete for its valuation uniformity.
- `MaxUnramifiedCompletion.transcendenceDegree_infinite` (other): Ĕ has infinite transcendence degree over E.

**Unit tests.**

- `MaxUnramifiedCompletion.padic_witt` (compatibility): For E = ℚ_p the ring of integers of Ĕ is isomorphic to the Witt vectors W(F̄_p) compatibly with Frobenius.
- `MaxUnramifiedCompletion.ramificationIndex_one` (computation): The extension Ĕ/E has ramification index 1: the normalized valuation of Ĕ restricts to that of E.
- `MaxUnramifiedCompletion.not_algebraic` (non-example): Ĕ is not algebraic over E (so it is not E^ur itself).
- `MaxUnramifiedCompletion.frobenius_ne_one` (non-example): σ is not the identity of Ĕ (the residue Frobenius x ↦ x^q is nontrivial on κ̄); a construction returning E^ur completed with trivial Galois action would fail this.

**Construction or proof.**

1. Extend the valuation to E^ur (unique by Tau Ceti LFR Layer 0, finite extensions II, applied to each finite unramified subextension) and complete (Mathlib UniformSpace.Completion of the valued field).
2. Residue field: the residue field of E^ur is the union of the finite extensions κ_f, i.e. κ̄; completion does not change the residue field or the value group.
3. Frobenius: the arithmetic Frobenius of E^ur/E (LFR Layer 2) is an isometry, so it extends to L; fixed points: an element of L fixed by σ has σ-fixed residue expansion, hence lies in E (He 2018 §4.3, p. 12; He 2021 §2.1, p. 4).
4. Transcendence: L is uncountable while the algebraic closure of E in L is countable (Gleason–Lim–Xu Lemma 5.10 input).

**Acceptance.**

- For E = ℚ_p: L = W(F̄_p)[1/p], σ = Witt vector Frobenius, L^σ = ℚ_p.
- The image of ϖ_E in L is a uniformizer: e(L/E) = 1.

**Sources.**

- [Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2001.03325): §2.1, p. 4. Fixes Ĕ = completion of the maximal unramified extension, its Frobenius σ, and writes the rational group as the Frobenius fixed points.
- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §4.3, p. 12. Recalls Ĕ with valuation ring O_Ĕ, residue field κ̄ and Frobenius σ, and uses G = G(Ĕ)^σ.
- [Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2208.07195): Lemma 5.10 and proof, p. 40; input Chen Proposition 2.0.3 cited there. Uses infinite transcendence degree of Q̆_p to obtain a point of a flag variety over its generic point; the completion result here is the underlying field input, not that flag-variety conclusion.

Atlas planet: **Completed maximal unramified extension**.

<a id="RG2-0-affine-point-topology-embedding"></a>

### Presentations give embeddings into affine space

Target `ReductiveGroupsPartII:RG2.0/affine-point-topology-embedding`. Theorem; suggested declaration `PointTopology.isEmbedding_eval_generators`.

Let (a_i)_{i∈I} generate A as a k-algebra. Then x ↦ (x(a_i))_{i∈I} is a topological embedding of Hom_k(A, R) into R^I with the product topology. If R is a T1 topological ring and I is finite, its image is closed: it is the common zero locus of the polynomials in the kernel of k[t_i] ↠ A. In particular the topology is the subspace topology from any finite presentation, and it does not depend on the presentation. If R is moreover locally compact (and Hausdorff), X(R) is locally compact for A of finite type.

**Hypotheses.** (a_i) a generating family of the k-algebra A; for closedness: R is T1 and I is finite; for local compactness: R Hausdorff and locally compact, A of finite type.

**Prerequisites.** [The topology on points of an affine algebra](#RG2-0-affine-point-topology) (`ReductiveGroupsPartII:RG2.0/affine-point-topology`); `mathlib:MvPolynomial.continuous_eval`.

**Construction or proof.**

1. Every b ∈ A is a k-polynomial in the a_i, and polynomial maps R^I ⊇ finite coordinates → R are continuous (Mathlib MvPolynomial.continuous_eval), so each ev_b is continuous for the topology induced from R^I; conversely each coordinate is an ev_{a_i}. Hence the two initial topologies agree (Conrad, Prop. 2.1, proof, p. 2).
2. The image is {r ∈ R^I : f(r) = 0 for all f in the kernel ideal}; each f defines a continuous map R^I → R and {0} is closed when R is T1.
3. A closed subset of the locally compact Hausdorff space R^n is locally compact.

**Acceptance.**

- For A = k[x,y]/(xy − 1) the embedding into R² identifies X(R) with the hyperbola, closed when R is Hausdorff.

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Proposition 2.1 and its proof, p. 2. Shows that the topology defined through a closed immersion into affine n-space coincides with the subspace topology from R^A, is independent of the presentation, closed in R^n for Hausdorff R and locally compact for locally compact R.

<a id="RG2-0-affine-point-topology-functoriality"></a>

### Functoriality of the point topology

Target `ReductiveGroupsPartII:RG2.0/affine-point-topology-functoriality`. Theorem; suggested declaration `PointTopology.continuous_comap`.

(1) A k-algebra map B → A induces a continuous map Hom_k(A, R) → Hom_k(B, R); if B → A is surjective (a closed immersion Spec A ↪ Spec B) it is a topological embedding, closed when R is T1. (2) A continuous k-algebra map R → R' induces a continuous map Hom_k(A, R) → Hom_k(A, R'); if R → R' is a topological embedding (resp. an open, resp. a closed embedding) and A is of finite type, so is the induced map. (3) The canonical bijections Hom_k(A ⊗_k B, R) ≅ Hom_k(A, R) × Hom_k(B, R) and, for maps A ← C → B, Hom_k(A ⊗_C B, R) ≅ Hom(A,R) ×_{Hom(C,R)} Hom(B,R) are homeomorphisms. (4) For a ring map k → k' and a k'-algebra R, the bijection Hom_k(A, R) ≅ Hom_{k'}(k' ⊗_k A, R) is a homeomorphism.

**Hypotheses.** k-algebras A, B, C; topological k-algebras R, R'; finite type of A in (2) for the open/closed embedding claims.

**Prerequisites.** [The topology on points of an affine algebra](#RG2-0-affine-point-topology) (`ReductiveGroupsPartII:RG2.0/affine-point-topology`); [Presentations give embeddings into affine space](#RG2-0-affine-point-topology-embedding) (`ReductiveGroupsPartII:RG2.0/affine-point-topology-embedding`).

**Construction or proof.**

1. (1) Precomposition with B → A sends ev_b to ev_{image of b}, so it is continuous; for a surjection the evaluations at images of generators of B are evaluations generating A, so Prop. 2.1's embedding argument applies; closedness as in the presentation theorem (Conrad, Prop. 2.1, proof, p. 2).
2. (2) Postcomposition is continuous coordinatewise; for finite type, use a presentation and the fact that R^n → R'^n is an (open, closed) embedding (Conrad, Example 2.2, p. 3).
3. (3) Products: evaluations on a ⊗ 1 and 1 ⊗ b generate; fibre products: the fibre product is a closed subspace of the product cut out by the equalities on C (Conrad, Prop. 2.1, proof, pp. 2–3).
4. (4) The bijection matches evaluations at a and at 1 ⊗ a.

**Acceptance.**

- For E a local field with ring of integers O, the inclusion Hom(A, O) ⊂ Hom(A, E) is an open and closed embedding (Conrad, Example 2.3, p. 3).
- Hom_k(A ⊗ B, R) ≅ X(R) × Y(R) for X = Y = G_m gives the product topology on (R^×)².

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Proposition 2.1, pp. 2–3. Functoriality in X, compatibility with fibre products and the passage of closed immersions to (closed) embeddings.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Examples 2.2–2.3, p. 3. Continuity along continuous ring maps, embeddings, open and closed embeddings of rings, and the open and closed embedding of integral points in rational points for a discrete valuation ring.

<a id="RG2-0-affine-point-topology-open-immersion"></a>

### Localizations give open embeddings

Target `ReductiveGroupsPartII:RG2.0/affine-point-topology-open-immersion`. Theorem; suggested declaration `PointTopology.isOpenEmbedding_localization`.

Let R be a topological ring whose unit group R^× is open in R and on which inversion is continuous (every topological field, every ring of integers of a local field, every local field). Then for f ∈ A the restriction map Hom_k(A_f, R) → Hom_k(A, R) is an open embedding with image {x : x(f) ∈ R^×}. Without the two hypotheses the conclusion fails: for the adele ring the map Hom(k[t,t⁻¹], 𝔸) → Hom(k[t], 𝔸) is not an embedding.

**Hypotheses.** R^× open in R; inversion continuous on R^× for the subspace topology.

**Prerequisites.** [Functoriality of the point topology](#RG2-0-affine-point-topology-functoriality) (`ReductiveGroupsPartII:RG2.0/affine-point-topology-functoriality`).

**Construction or proof.**

1. The image is the preimage of the open set R^× under the continuous ev_f.
2. Write A_f = A[s]/(fs − 1); the inverse map from the image is x ↦ (x, x(f)^{-1}), continuous because inversion is continuous; reduce to A = k[t], f = t via the fibre square (Conrad, proof of Prop. 3.1, p. 4).
3. The adelic counterexample: units of the adele ring are not a topological group in the subspace topology (Conrad, §3, pp. 3–4).

**Acceptance.**

- For R = ℚ_p and A = ℤ[t], the image of G_m(ℚ_p) is ℚ_p^×, open, with the subspace topology.

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): §3 and proof of Proposition 3.1, pp. 3–4. Shows that basic open immersions induce open embeddings exactly when units are open with continuous inversion, and gives the adelic counterexample.

<a id="RG2-0-integral-points-compact-open"></a>

### Integral points of an affine model are compact open

Target `ReductiveGroupsPartII:RG2.0/integral-points-compact-open`. Theorem; suggested declaration `PointTopology.isOpenEmbedding_integralPoints`.

Let E be a nonarchimedean local field with O = 𝒪[E], A_O a finitely generated commutative O-algebra (an affine O-scheme 𝒳 of finite type) and X = Spec(A_O ⊗_O E). The map 𝒳(O) = Hom_O(A_O, O) → Hom_O(A_O, E) = X(E) is an open and closed embedding with compact image. If A_O is O-flat, its image consists of the E-points x with x(a) ∈ O for all a ∈ A_O, equivalently for a finite set of generators. For a commutative Hopf O-algebra of finite type, 𝒢(O) is a compact open subgroup of G(E).

**Hypotheses.** E a nonarchimedean local field; A_O a finitely generated O-algebra.

**Prerequisites.** [Functoriality of the point topology](#RG2-0-affine-point-topology-functoriality) (`ReductiveGroupsPartII:RG2.0/affine-point-topology-functoriality`); [Presentations give embeddings into affine space](#RG2-0-affine-point-topology-embedding) (`ReductiveGroupsPartII:RG2.0/affine-point-topology-embedding`); `mathlib:IsNonarchimedeanLocalField`; `mathlib:IsNonarchimedeanLocalField.isCompact_closedBall`.

**Construction or proof.**

1. O ⊂ E is an open and closed embedding of topological rings (the closed unit ball), so by RG2.0/affine-point-topology-functoriality (2) the map is an open and closed embedding (Conrad, Example 2.3, p. 3).
2. Compactness: a presentation embeds 𝒳(O) as a closed subset of the compact O^n (Mathlib CompactSpace 𝒪[K]).
3. Flatness gives A_O ⊂ A_O ⊗ E, so an E-point integral on generators is an O-point; group structure from RG2.0/points-topological-group.

**Acceptance.**

- GL_n(O) ⊂ GL_n(E) and O^× ⊂ E^× are compact open subgroups.
- For A_O = O[x]/(ϖx − 1), 𝒳(O) is empty while X(E) is a point: the image is open and closed but the model need not see every E-point.

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Example 2.3, p. 3. For an affine finite type scheme over a discrete valuation ring, the integral points are open and closed in the rational points.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Remark 3.2, p. 4. Compactness of integral points over a compact discrete valuation ring.

Atlas planet: **Compact open integral points**.

<a id="RG2-0-scheme-point-topology"></a>

### The topology on points of a scheme locally of finite type

Target `ReductiveGroupsPartII:RG2.0/scheme-point-topology`. Construction; suggested declaration `SchemePointTopology.topology`.

Let k be a commutative ring, X a k-scheme locally of finite type and R a local topological k-algebra (a topological ring which is a local ring) with R^× open and continuous inversion. Every R-point Spec R → X factors through every affine open containing the image of the closed point, so X(R) = ⋃_U U(R) over affine opens U. There is a unique topology on X(R) for which each U(R) ⊂ X(R) is open and carries the point topology of RG2.0/affine-point-topology; it is independent of the chosen affine cover, functorial in X, and agrees with the affine construction when X is affine.

**Hypotheses.** X locally of finite type over k (Mathlib scheme with a morphism to Spec k); R a local ring and a topological ring, R^× open, inversion continuous.

**Prerequisites.** [Localizations give open embeddings](#RG2-0-affine-point-topology-open-immersion) (`ReductiveGroupsPartII:RG2.0/affine-point-topology-open-immersion`); `mathlib:AlgebraicGeometry.Scheme`.

**Uses.**

- RG2.0 stage text: the topology on X(E) for finite-type E-schemes built from affine charts.
- ShimuraData:D0 (request): real and complex points of quasi-projective varieties attached to Shimura data.
- Conrad, Remark 3.2: local compactness of X(k) for locally finite type X over a local field.
- ReductiveGroupsPartII:RG2.0/points-locally-compact-hausdorff: Hausdorff and local compactness statements for separated schemes.

**API.**

- `SchemePointTopology.topology` (constructor): The topology on X(R) = Hom_k(Spec R, X) for X locally of finite type over k and R local with open units and continuous inversion.
- `SchemePointTopology.isOpenEmbedding_affineOpen` (characterisation): For every affine open U ⊂ X, the inclusion U(R) ⊂ X(R) is an open embedding when U(R) has the affine point topology.
- `SchemePointTopology.iUnion_affineOpens` (relation): X(R) is the union of the U(R) over affine opens U (uses that R is local).
- `SchemePointTopology.affine_eq` (compatibility): For X = Spec A the topology agrees with PointTopology.topology k A R under Γ-Spec adjunction.
- `SchemePointTopology.continuous_map` (functoriality): A k-morphism X → Y induces a continuous map X(R) → Y(R).
- `SchemePointTopology.isClosedEmbedding_of_isClosedImmersion` (functoriality): A closed immersion induces a closed embedding when R is Hausdorff.

**Unit tests.**

- `SchemePointTopology.projectiveLine_compactSpace` (computation): ℙ¹(E) is compact for E a nonarchimedean local field.
- `SchemePointTopology.affine_compat` (compatibility): For affine X the scheme topology equals the affine point topology.
- `SchemePointTopology.not_iUnion_of_nonlocal` (non-example): For R = E × E (not local) and X = ℙ¹ the R-points are not the union of the R-points of the two standard affine charts; the construction requires R local.
- `SchemePointTopology.emptyScheme` (degenerate): For the empty scheme X(R) is empty.

**Construction or proof.**

1. Locality of R: the only open subscheme of Spec R containing the closed point is Spec R, so X(R) = ⋃ U(R) for any affine open cover (Conrad, proof of Prop. 3.1, p. 4).
2. For affine opens V ⊂ U, the inclusion V(R) ⊂ U(R) is an open embedding: cover V by basic opens of U and apply RG2.0/affine-point-topology-open-immersion.
3. Glue: declare a set open iff its intersection with every U(R) is open; the previous step shows each U(R) is an open subspace with its own topology; independence of the cover by passing to a common refinement.

**Acceptance.**

- For X = ℙ¹ over E local, X(E) is the union of two copies of E glued along E^× by inversion, hence compact.
- For X affine the construction returns the affine point topology.

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Proposition 3.1, p. 4. Existence and uniqueness of a topology on X(R) for locally finite type X over a local topological ring with open units and continuous inversion, functorial, carrying open and closed immersions to open embeddings and embeddings, compatible with fibre products.

<a id="RG2-0-congruence-subgroup"></a>

### Congruence subgroups of an integral group model

Target `ReductiveGroupsPartII:RG2.0/congruence-subgroup`. Definition; suggested declaration `CongruenceSubgroup.subgroup`.

Let O be a complete discrete valuation ring with maximal ideal m (for E local: O = 𝒪[E]) and H a commutative Hopf O-algebra of finite type (an affine O-group scheme 𝒢). For n ≥ 0, the n-th congruence subgroup is 𝒢(O)_n := ker(𝒢(O) → 𝒢(O/m^n)), the kernel of reduction modulo m^n of the convolution group of points. It is a normal subgroup of 𝒢(O); the family is decreasing with 𝒢(O)_0 = 𝒢(O) and trivial intersection; for E local each 𝒢(O)_n is open and compact in G(E).

**Hypotheses.** O complete DVR (or 𝒪[E] for E local); H a commutative Hopf O-algebra of finite type; n a natural number.

**Prerequisites.** [Integral points of an affine model are compact open](#RG2-0-integral-points-compact-open) (`ReductiveGroupsPartII:RG2.0/integral-points-compact-open`); `tauceti:TauCeti.HopfAlgebra.pointsFunctor`; `tauceti:TauCeti.unitFiltration`.

**Uses.**

- HeckeStacksAndLocalShtukas (request to RG2.0): compact open pro-p subgroups forming a neighbourhood basis of the identity, finite indices between compact opens.
- GL2AutomorphicRepresentationsAndTransfer:R16.1 (request): openness of congruence kernels of GL_2(O_v).
- ReductiveGroupsPartII:RG2.3/positive-depth-filtration-basis: comparison with Moy–Prasad subgroups.
- He, Cocenters I, §4.2: the subgroups I_n of the Newton decomposition.

**API.**

- `CongruenceSubgroup.subgroup` (constructor): 𝒢(O)_n as a subgroup of the convolution group of O-points.
- `CongruenceSubgroup.mem_iff` (characterisation): x ∈ 𝒢(O)_n iff x reduces to the identity point modulo m^n.
- `CongruenceSubgroup.normal` (instance): 𝒢(O)_n is normal in 𝒢(O).
- `CongruenceSubgroup.antitone` (relation): n ≤ m implies 𝒢(O)_m ≤ 𝒢(O)_n.
- `CongruenceSubgroup.zero_eq_top` (simp): 𝒢(O)_0 = 𝒢(O).
- `CongruenceSubgroup.isOpen` (other): For E local, 𝒢(O)_n is open in the point topology.
- `CongruenceSubgroup.map` (functoriality): A Hopf map 𝒢 → 𝒢' sends 𝒢(O)_n into 𝒢'(O)_n.

**Unit tests.**

- `CongruenceSubgroup.generalLinear_eq` (computation): For GL_k over O, 𝒢(O)_n corresponds under pointsMulEquiv to {g ∈ GL_k(O) : g ≡ 1 mod ϖ^n}.
- `CongruenceSubgroup.multiplicative_eq_unitFiltration` (compatibility): For G_m over 𝒪[E] and n ≥ 1, 𝒢(O)_n corresponds to Tau Ceti's unitFiltration n.
- `CongruenceSubgroup.iInf_eq_bot` (degenerate): ⋂_n 𝒢(O)_n = 1.
- `CongruenceSubgroup.not_mem_of_det_nonunit` (non-example): diag(1 + ϖ, 1) ∈ 𝒢(O)_1 \ 𝒢(O)_2 for GL_2, so 𝒢(O)_1 ≠ 𝒢(O)_2.

**Construction or proof.**

1. Reduction O → O/m^n is a ring map, so it induces a group homomorphism of convolution groups (Tau Ceti pointsFunctor); its kernel is normal.
2. Openness: a point lies in 𝒢(O)_n iff the values of finitely many generators of the augmentation ideal lie in m^n, an open condition; trivial intersection because ⋂ m^n = 0 and the generators determine the point.

**Acceptance.**

- For GL_n, 𝒢(O)_k = 1 + ϖ^k M_n(O).
- For G_m, 𝒢(O)_k = 1 + m^k = the unit filtration U^{(k)} of Tau Ceti for k ≥ 1.

**Sources.**

- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §4.2, p. 12. Uses the integer-depth Moy–Prasad subgroups of an Iwahori as a fundamental system of open compact subgroups; the congruence subgroups here are their model-theoretic counterpart and are compared with them in RG2.3.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Example 2.3, p. 3. Openness of conditions on integral points inside rational points.

Atlas planet: **Congruence subgroups**.

<a id="RG2-0-scheme-point-topology-functoriality"></a>

### Chart independence and functoriality for schemes

Target `ReductiveGroupsPartII:RG2.0/scheme-point-topology-functoriality`. Theorem; suggested declaration `SchemePointTopology.continuous_map`.

For R as in RG2.0/scheme-point-topology and k-schemes locally of finite type: morphisms X → Y induce continuous maps X(R) → Y(R); open immersions induce open embeddings; closed immersions induce embeddings, closed when R is Hausdorff; (X ×_Z Y)(R) → X(R) ×_{Z(R)} Y(R) is a homeomorphism; if R is Hausdorff and X is separated, X(R) is Hausdorff.

**Hypotheses.** R local, topological, R^× open with continuous inversion; X, Y, Z locally of finite type over k.

**Prerequisites.** [The topology on points of a scheme locally of finite type](#RG2-0-scheme-point-topology) (`ReductiveGroupsPartII:RG2.0/scheme-point-topology`); [Functoriality of the point topology](#RG2-0-affine-point-topology-functoriality) (`ReductiveGroupsPartII:RG2.0/affine-point-topology-functoriality`).

**Construction or proof.**

1. Check each property on affine opens, where it is RG2.0/affine-point-topology-functoriality, and glue using the open covers U(R) (Conrad, Prop. 3.1, p. 4).
2. Separatedness: the diagonal X → X ×_k X is a closed immersion, so X(R) → (X ×_k X)(R) = X(R) × X(R) is a closed embedding when R is Hausdorff, i.e. X(R) is Hausdorff.

**Acceptance.**

- The diagonal of G_m over ℚ_p gives a closed embedding ℚ_p^× → (ℚ_p^×)².

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Proposition 3.1 and Remark 3.3, pp. 4–5. Functoriality, immersions to embeddings, fibre products, Hausdorffness for separated X; Remark 3.3 on the complement of a closed subscheme.

<a id="RG2-0-points-locally-compact-hausdorff"></a>

### Points over a local field are locally compact and Hausdorff

Target `ReductiveGroupsPartII:RG2.0/points-locally-compact-hausdorff`. Theorem; suggested declaration `SchemePointTopology.locallyCompactSpace_of_localField`.

Let E be a nonarchimedean local field. For X separated and locally of finite type over E, X(E) is Hausdorff, locally compact and totally disconnected; for X affine of finite type it is a closed subspace of E^n, hence also σ-compact and second countable. For a locally finite type scheme 𝒳 over O = 𝒪[E], 𝒳(O) is locally compact; for 𝒳 affine of finite type it is compact. The same statements hold for real and complex points, with total disconnectedness omitted.

**Hypotheses.** E a nonarchimedean local field (Mathlib IsNonarchimedeanLocalField); X separated, locally of finite type over E.

**Prerequisites.** [Chart independence and functoriality for schemes](#RG2-0-scheme-point-topology-functoriality) (`ReductiveGroupsPartII:RG2.0/scheme-point-topology-functoriality`); [Presentations give embeddings into affine space](#RG2-0-affine-point-topology-embedding) (`ReductiveGroupsPartII:RG2.0/affine-point-topology-embedding`); `mathlib:IsNonarchimedeanLocalField`; `mathlib:IsNonarchimedeanLocalField.isCompact_closedBall`.

**Construction or proof.**

1. E is a locally compact Hausdorff topological field with E^× open and continuous inversion (Mathlib local-field instances), so RG2.0/scheme-point-topology applies.
2. Affine charts embed X(E) as closed subsets of E^n (RG2.0/affine-point-topology-embedding); E^n is locally compact, σ-compact, second countable and totally disconnected.
3. Hausdorffness from separatedness (RG2.0/scheme-point-topology-functoriality); local compactness is local (Conrad, Remark 3.2, p. 4).
4. For 𝒳 affine over O: closed subsets of O^n, compact because 𝒪[E] is compact (Mathlib CompactSpace 𝒪[K]).

**Acceptance.**

- GL_n(E) is locally compact and totally disconnected; GL_n(O) is compact.
- ℙ^n(E) is compact.

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Remark 3.2, p. 4. Local compactness of X(k) for locally finite type schemes over a local field, and of X(O) for a compact discrete valuation ring.

<a id="RG2-0-points-topological-group"></a>

### The topological group of rational points

Target `ReductiveGroupsPartII:RG2.0/points-topological-group`. Theorem; suggested declaration `PointTopology.isTopologicalGroup`.

Let H be a commutative Hopf k-algebra (an affine group scheme G over k) and R a topological k-algebra. With the point topology, the Tau Ceti convolution group G(R) = WithConv (H →ₐ[k] R) is a topological group. A morphism of Hopf algebras H' → H induces a continuous homomorphism G(R) → G'(R), and a continuous k-algebra map R → R' induces a continuous homomorphism G(R) → G(R'). For E a nonarchimedean local field and H of finite type, G(E) is a Hausdorff, locally compact, totally disconnected topological group.

**Hypotheses.** H a commutative Hopf k-algebra; R a topological commutative k-algebra (no Hausdorff hypothesis for the group axioms).

**Prerequisites.** [Functoriality of the point topology](#RG2-0-affine-point-topology-functoriality) (`ReductiveGroupsPartII:RG2.0/affine-point-topology-functoriality`); [Points over a local field are locally compact and Hausdorff](#RG2-0-points-locally-compact-hausdorff) (`ReductiveGroupsPartII:RG2.0/points-locally-compact-hausdorff`); `tauceti:TauCeti.AlgHom.instGroup`; `tauceti:TauCeti.HopfAlgebra.pointsFunctor`.

**Construction or proof.**

1. Multiplication G(R) × G(R) → G(R) is the composite of the homeomorphism G(R) × G(R) ≅ (H ⊗ H)-points and precomposition with the comultiplication Δ : H → H ⊗ H, both continuous (RG2.0/affine-point-topology-functoriality); explicitly (fg)(h) = Σ f(h₁)g(h₂).
2. Inversion is precomposition with the antipode, continuous; the unit is the counit, a point.
3. Functoriality in H and R is RG2.0/affine-point-topology-functoriality; the local-field properties follow from RG2.0/points-locally-compact-hausdorff.

**Acceptance.**

- For H the coordinate ring of G_m, G(R) is R^× with the topology of the hyperbola, a topological group even when inversion on R^× is not continuous for the subspace topology of R.

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Proposition 2.1, discussion after the statement, p. 2. Compatibility with products makes X(R) a topological group when X is a group scheme.

Atlas planet: **Topological group of rational points**.

<a id="RG2-0-general-linear-points-homeomorphism"></a>

### GL_n: point topology equals the units topology

Target `ReductiveGroupsPartII:RG2.0/general-linear-points-homeomorphism`. Comparison; suggested declaration `PointTopology.generalLinearPointsHomeomorph`.

For every topological commutative ring R and n ≥ 0, the Tau Ceti isomorphism GeneralLinear.pointsMulEquiv between the convolution points of the GL_n coordinate Hopf algebra and the matrix group GL (Fin n) R is a homeomorphism when the source carries the point topology and the target carries Mathlib's topology on units of the topological monoid M_n(R) (induced by g ↦ (g, g^{-1}) into M_n(R) × M_n(R)^op). With R = O for a local field E: the integral points are GL_n(O) = {g ∈ M_n(O) : det g ∈ O^×}, a compact open subgroup of GL_n(E); a matrix with nonzero non-unit determinant, such as diag(ϖ, 1), is not an integral point.

**Hypotheses.** R a topological commutative ring; for the integral statement: E a nonarchimedean local field, O = 𝒪[E].

**Prerequisites.** [The topological group of rational points](#RG2-0-points-topological-group) (`ReductiveGroupsPartII:RG2.0/points-topological-group`); [Integral points of an affine model are compact open](#RG2-0-integral-points-compact-open) (`ReductiveGroupsPartII:RG2.0/integral-points-compact-open`); `tauceti:TauCeti.GeneralLinear.pointsMulEquiv`; `mathlib:Units.isEmbedding_embedProduct`; `mathlib:Matrix.isUnit_iff_isUnit_det`.

**Construction or proof.**

1. The coordinate ring is k[x_ij, det^{-1}]; under pointsMulEquiv the evaluation at x_ij is the (i,j) entry and the evaluation at det^{-1} is det(g)^{-1} = det(g^{-1}).
2. Entries of g^{-1} are polynomials in the entries of g and det(g)^{-1} (adjugate formula), so the two initial topologies coincide (Mathlib Units.isEmbedding_embedProduct).
3. Integral points: an O-algebra map from the coordinate ring sends det to a unit of O; Matrix.isUnit_iff_isUnit_det identifies these with invertible matrices over O. Compactness and openness come from RG2.0/integral-points-compact-open.

**Acceptance.**

- diag(ϖ, 1) ∈ GL_2(E) has entries in O and nonzero determinant but is not in GL_2(O).
- For R = ℝ the topology is the usual topology of GL_n(ℝ) ⊂ M_n(ℝ).

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): §3, p. 3 (G_m as the hyperbola xy = 1). The unit-group topology of a topological ring is the hyperbola topology, which is what the units topology of Mathlib encodes.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Example 2.3, p. 3. Integral points of an affine model over a discrete valuation ring are open and closed in the rational points.

<a id="RG2-0-congruence-neighbourhood-basis"></a>

### Congruence subgroups form a neighbourhood basis

Target `ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`. Theorem; suggested declaration `CongruenceSubgroup.hasBasis_nhds_one`.

Let E be a nonarchimedean local field, 𝒢 an affine O-group scheme of finite type with generic fibre G. The congruence subgroups 𝒢(O)_n, n ≥ 0, form a basis of neighbourhoods of 1 in G(E) consisting of compact open subgroups normal in 𝒢(O). Consequently G(E) is locally profinite (Hausdorff, locally compact, totally disconnected, with a basis of compact open subgroups at 1), every compact open subgroup K of G(E) contains some 𝒢(O)_n with finite index, and [K : K'] is finite for compact open K' ⊂ K. The same holds for G(E) with any finite type affine model of G over O.

**Hypotheses.** E nonarchimedean local field; 𝒢 an affine group scheme of finite type over O = 𝒪[E].

**Prerequisites.** [Congruence subgroups of an integral group model](#RG2-0-congruence-subgroup) (`ReductiveGroupsPartII:RG2.0/congruence-subgroup`); [The topological group of rational points](#RG2-0-points-topological-group) (`ReductiveGroupsPartII:RG2.0/points-topological-group`); [Presentations give embeddings into affine space](#RG2-0-affine-point-topology-embedding) (`ReductiveGroupsPartII:RG2.0/affine-point-topology-embedding`).

**Construction or proof.**

1. 𝒢(O) is a compact open neighbourhood of 1 in G(E) (RG2.0/integral-points-compact-open).
2. Generators of the augmentation ideal of 𝒢 give coordinates vanishing at 1; the sets where these coordinates lie in m^n are the 𝒢(O)_n and form a neighbourhood basis by RG2.0/affine-point-topology-embedding.
3. Compact open subgroups contain a basic neighbourhood, and a compact group is covered by finitely many cosets of an open subgroup.

**Acceptance.**

- For GL_2(ℚ_p), the subgroups 1 + p^n M_2(ℤ_p) are a neighbourhood basis; [GL_2(ℤ_p) : 1 + pM_2(ℤ_p)] = |GL_2(F_p)| = (p² − 1)(p² − p).

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Proposition 2.1 and Example 2.3, pp. 2–3. Coordinates on affine points give the topology; integral points are open.
- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §4.2, p. 12. The fact that the I_n form a fundamental system of open compact subgroups, used for the limit of Hecke algebras.

<a id="RG2-0-smooth-morphism-open-map"></a>

### Smooth morphisms are open on local points

Target `ReductiveGroupsPartII:RG2.0/smooth-morphism-open-map`. Theorem; suggested declaration `SchemePointTopology.isOpenMap_of_smooth`.

Let K be a field complete for a nontrivial absolute value (in particular a nonarchimedean local field E, or ℝ, ℂ) and f : X' → X a smooth morphism of K-schemes locally of finite type. Then f induces an open map X'(K) → X(K). In particular, for a smooth surjective homomorphism of affine K-group schemes of finite type G → G', the induced homomorphism G(K) → G'(K) is open, its image is an open subgroup, and the image of a compact open subgroup of G(E) is compact open in G'(E).

**Hypotheses.** K complete for a nontrivial absolute value; f smooth (for the group statement: smooth and surjective homomorphism).

**Prerequisites.** [Chart independence and functoriality for schemes](#RG2-0-scheme-point-topology-functoriality) (`ReductiveGroupsPartII:RG2.0/scheme-point-topology-functoriality`); [The topological group of rational points](#RG2-0-points-topological-group) (`ReductiveGroupsPartII:RG2.0/points-topological-group`).

**Construction or proof.**

1. Work Zariski-locally: a smooth morphism factors locally as an étale map to an affine space over X; étale maps are locally standard étale (EGA IV 17.11.4, 18.4.6), reducing to the continuity of simple roots of monic polynomials over K (Krasner-type lemma) (Conrad, §4 discussion before Theorem 4.5, p. 11).
2. For groups: the image is a subgroup containing an open neighbourhood of 1, hence open.

**Acceptance.**

- The determinant GL_n(E) → E^× is open, with image E^×.
- The squaring map G_m → G_m (char E ≠ 2) is étale but not surjective on E-points: its image (E^×)² is open of finite index, illustrating openness without surjectivity.

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): §4, paragraph before Theorem 4.5, pp. 11–12. Openness of the map on K-points induced by a smooth morphism, for K complete with respect to a nontrivial absolute value, proved by reduction to continuity of simple roots.

<a id="RG2-0-frobenius-fixed-points-of-points"></a>

### Rational points as Frobenius fixed points

Target `ReductiveGroupsPartII:RG2.0/frobenius-fixed-points-of-points`. Theorem; suggested declaration `MaxUnramifiedCompletion.points_eq_fixedPoints`.

Let E be a nonarchimedean local field, L = Ĕ with Frobenius σ, and A a commutative E-algebra of finite type (an affine E-scheme X). σ acts on X(L) = Hom_E(A, L) by x ↦ σ ∘ x; this action is continuous for the point topology and X(E) = X(L)^σ as a closed subspace. For an O_E-model 𝒳 (A_O of finite type), 𝒳(O_E) = 𝒳(O_L)^σ. For an affine group scheme, the identification G(E) = G(L)^σ is an isomorphism of topological groups and σ acts by continuous group automorphisms.

**Hypotheses.** E local, L = Ĕ; A of finite type over E (or A_O of finite type over O_E).

**Prerequisites.** [The completed maximal unramified extension Ĕ](#RG2-0-completed-maximal-unramified-extension) (`ReductiveGroupsPartII:RG2.0/completed-maximal-unramified-extension`); [Functoriality of the point topology](#RG2-0-affine-point-topology-functoriality) (`ReductiveGroupsPartII:RG2.0/affine-point-topology-functoriality`); [The topological group of rational points](#RG2-0-points-topological-group) (`ReductiveGroupsPartII:RG2.0/points-topological-group`).

**Construction or proof.**

1. σ is continuous on L, so postcomposition is continuous on points (RG2.0/affine-point-topology-functoriality (2)).
2. x is σ-fixed iff all its values lie in L^σ = E (RG2.0/completed-maximal-unramified-extension), i.e. x factors through E ⊂ L; closedness since E is closed in L and fixed loci of continuous maps into a Hausdorff space are closed.
3. For groups σ preserves convolution because it is a ring automorphism (He 2018 §4.3, p. 12).

**Acceptance.**

- For G = GL_n: GL_n(E) = GL_n(L)^σ with σ acting entrywise.
- For a σ-stable compact open subgroup Ĭ of G(L), I = Ĭ^σ is compact open in G(E).

**Sources.**

- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §4.3, p. 12. Writes G = G(Ĕ)^σ and compares Iwahori subgroups over E and Ĕ as σ-fixed points.
- [Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2208.07195): §1.1, pp. 2–3; §2.1, pp. 12–14. Uses Frobenius on the unramified-completion points; the fixed-point equality here is proved coordinatewise from the field equality.

<a id="RG2-0-smooth-model-congruence-quotients"></a>

### Reduction and congruence quotients of smooth models

Target `ReductiveGroupsPartII:RG2.0/smooth-model-congruence-quotients`. Theorem; suggested declaration `CongruenceSubgroup.quotientEquivLie`.

Let O be a complete discrete valuation ring with residue field κ and 𝒢 a smooth affine O-group scheme (a smooth finitely generated commutative Hopf O-algebra). Then (1) for every n ≥ 1 the reduction map 𝒢(O) → 𝒢(O/m^n) is surjective; (2) for n ≥ 1 there is a canonical isomorphism of abelian groups 𝒢(O)_n/𝒢(O)_{n+1} ≅ Lie(𝒢_κ) ⊗_κ m^n/m^{n+1}, the Lie algebra of the special fibre (anchor Layer 2) twisted by m^n/m^{n+1}; (3) if κ is finite of characteristic p with q elements, every 𝒢(O)_n/𝒢(O)_{n+1} (n ≥ 1) is an elementary abelian p-group of order q^{dim 𝒢_κ}, 𝒢(O)_1 is a pro-p group, and 𝒢(O)/𝒢(O)_1 ≅ 𝒢_κ(κ).

**Hypotheses.** O complete DVR (𝒪[E] adically complete by Mathlib's IsAdicComplete instance); 𝒢 smooth affine over O; for (3): κ finite.

**Prerequisites.** [Congruence subgroups form a neighbourhood basis](#RG2-0-congruence-neighbourhood-basis) (`ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`); `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`; `mathlib:IsNonarchimedeanLocalField`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`; `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`.

**Construction or proof.**

1. (1) Mathlib's Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete lifts any O-algebra map H → O/m^n to H → O, since O is m-adically complete and H is formally smooth.
2. (2) The kernel of 𝒢(O/m^{n+1}) → 𝒢(O/m^n) is the set of points 1 + ε·D with D a derivation of H at the counit with values in m^n/m^{n+1} (square-zero extension), i.e. Hom_κ(ω_{𝒢_κ}, m^n/m^{n+1}) = Lie(𝒢_κ) ⊗ m^n/m^{n+1}; the group law becomes addition because the ideal has square zero. Combine with (1).
3. (3) Count: m^n/m^{n+1} is one-dimensional over κ; the inverse limit of the finite p-groups 𝒢(O)_1/𝒢(O)_n is 𝒢(O)_1 (compactness, RG2.0/congruence-neighbourhood-basis).

**Acceptance.**

- For GL_d over ℤ_p: (1 + p^n M_d)/(1 + p^{n+1} M_d) ≅ M_d(F_p), of order p^{d²}.
- Smoothness is needed in (1): for the finite flat but non-smooth group scheme μ_p over ℤ_p (p odd), μ_p(ℤ_p) is trivial while μ_p(ℤ/p²) has p elements (all 1 + pt), so reduction is not surjective.

**Sources.**

- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §4.3, proof of Lemma 4.5, p. 13. Uses that the deeper congruence-type subgroups are pro-p and that fixed points of Frobenius on their quotients behave well; the graded structure here supplies those facts.
- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): §12.5, equation (65), p. 184; Proposition 12.27 and Corollary 12.29, pp. 191–192, Version 2.00. The tangent-kernel and square-zero-ideal calculations over a field supply the model for successive congruence kernels. The derivation argument at the special-fibre counit, formal-smooth lifting and completeness give the smooth DVR statements here; the DVR result is derived here rather than asserted to be the field statement of Proposition 12.27.

<a id="rg2-0a"></a>

## RG2.0a. Affine Weil restriction and the Deligne torus

Affine Weil restriction extends the finite-presentation representing objects of ModularCurves, Layer 0F. Its point functor, base change and character modules support norm tori, finite multiplicative-type quotients, the Deligne torus and integral descent.

<a id="RG2-0a-weil-restriction-functor"></a>

### The Weil restriction functor of an affine scheme

Target `ReductiveGroupsPartII:RG2.0a/weil-restriction-functor`. Definition; suggested declaration `WeilRestriction.functor`.

Let k → k' be a homomorphism of commutative rings and A' a commutative k'-algebra (an affine k'-scheme X' = Spec A'). The Weil restriction of X' is the functor on commutative k-algebras Res_{k'/k}(X') : R ↦ Hom_{k'-alg}(A', k' ⊗_k R) = X'(k' ⊗_k R), with the evident action of k-algebra maps R → S. It is functorial in A' (contravariantly) and, for k → k' finite locally free (k' a finitely generated projective k-module), representable by an affine k-scheme (RG2.0a/weil-restriction-representing-algebra). The functor is defined for every ring map; only representability needs finite local freeness.

**Hypotheses.** k → k' a homomorphism of commutative rings; A' a commutative k'-algebra (no finiteness assumed).

**Prerequisites.** `tauceti:TauCetiRoadmap/ModularCurves#0f-hom-schemes-and-closed-loci`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`; `mathlib:CommAlgCat`; `mathlib:Algebra.TensorProduct.map`.

**Uses.**

- AdelicAlgebraicGroups:AA.1 (request to RG2.0a): identifies Res_{E/F}G(𝔸_F) with G(𝔸_E) naturally in the value algebra.
- ShimuraData:D0–D1 (request): the Deligne torus and Hilbert groups Res_{F/ℚ} GL_2 as Weil restrictions.
- ShimuraVarieties:V0 (request): reflex norms and Weil-restricted tori.
- Kisin–Pappas 2018, §1.3.8; Kisin–Pappas–Zhou 2026, §2.1.2: integral Weil restriction Res_{Õ/O} of Bruhat–Tits group schemes.
- Česnavičius 2019, Lemma 2.1: Weil restriction along a finite locally free morphism of an S-affine group.

**API.**

- `WeilRestriction.functor` (constructor): The functor CommAlgCat k ⥤ Type, R ↦ (A' →ₐ[k'] k' ⊗[k] R).
- `WeilRestriction.functor_obj` (simp): (functor k k' A').obj R = (A' →ₐ[k'] k' ⊗[k] R) definitionally.
- `WeilRestriction.functor_map_apply` (simp): For f : R → S and x a point, (functor.map f) x = (id ⊗ f) ∘ x.
- `WeilRestriction.functorMap` (functoriality): A k'-algebra map B' → A' induces a natural transformation functor A' ⟶ functor B'.
- `WeilRestriction.functor_compat_modularCurves` (compatibility): For A' finitely presented and k' finite locally free, the functor is the functor of Z-morphisms of ModularCurves Layer 0F (Z = Spec k').
- `WeilRestriction.functorBaseChangeIso` (equivalence): For k → l, the functor of A' ⊗_{k'} (k' ⊗_k l) over l is the restriction of functor A' to l-algebras.

**Unit tests.**

- `WeilRestriction.functor_affineLine` (computation): For A' = k'[t], the points over R are in bijection with k' ⊗_k R via x ↦ x(t).
- `WeilRestriction.functor_trivial_extension` (degenerate): For k' = k, the functor is (naturally isomorphic to) R ↦ Hom_k(A', R), the functor of points of A'.
- `WeilRestriction.functor_units` (compatibility): For A′=k′[t,t⁻¹], the points over R identify with (k′⊗_k R)^× by the pinned Tau Ceti multiplicative-group points equivalence, evaluated at t.
- `WeilRestriction.functor_not_base_change` (non-example): For k = ℝ, k' = ℂ and A' = ℂ[t], the points over ℝ form a 2-dimensional real space ℂ, not the 1-dimensional space of points of the base change ℝ[t]: Weil restriction is not base change.

**Construction or proof.**

1. Define the object part R ↦ Hom_{k'}(A', k' ⊗_k R) and, for f : R → S, postcomposition with id ⊗ f : k' ⊗ R → k' ⊗ S (Mathlib Algebra.TensorProduct.map).
2. Functoriality in R holds because id ⊗ (g ∘ f) = (id ⊗ g) ∘ (id ⊗ f); functoriality in A' by precomposition (Stacks, Section 97.11, definition of Res_{Z/B}; BT II 1.5.2, p. 26).
3. On the level of schemes this is the functor of Z-morphisms T ×_S Z → X with Z = Spec k', the form used by Tau Ceti ModularCurves Layer 0F, which owns the representing scheme when A' is finitely presented.

**Acceptance.**

- For A' = k'[t] the functor is R ↦ k' ⊗_k R, the underlying additive group of the k-algebra k' ⊗ R.
- For A' = k'[t, t⁻¹] the functor is R ↦ (k' ⊗_k R)^×.

**Sources.**

- [The Stacks Project Authors, *The Stacks Project, Section 97.11 (Tag 05Y8, Restriction of scalars) and Tag 05YF*](https://stacks.math.columbia.edu/tag/05Y8): Section 97.11 (Tag 05Y8), definition of Res_{Z/B}(X). Defines the restriction-of-scalars functor of a morphism X → Z over Z → B as the functor of pairs (a, b) with b a Z-morphism T ×_B Z → X; for affine B = Spec k, Z = Spec k' this is the functor above.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 1.5.2, pp. 26–27. Defines the A-scheme obtained from a B-scheme by restriction of scalars as the representing object of R ↦ X(B ⊗ R), for B a finite projective A-algebra.
- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): 2.35–2.36, p. 50. Weil restriction as the functor R ↦ X(A ⊗ R) on k-algebras, for a finite k-algebra A.

Atlas planet: **Weil restriction**.

<a id="RG2-0a-weil-restriction-representing-algebra"></a>

### The representing algebra of a Weil restriction

Target `ReductiveGroupsPartII:RG2.0a/weil-restriction-representing-algebra`. Construction; suggested declaration `WeilRestriction.Res`.

Let k → k' be finite locally free (k' finitely generated projective as a k-module) and A' any commutative k'-algebra. There is a commutative k-algebra Res_{k'/k} A' with a k'-algebra map u : A' → k' ⊗_k Res_{k'/k}A' such that for every commutative k-algebra R, φ ↦ (id ⊗ φ) ∘ u is a bijection Hom_k(Res A', R) ≅ Hom_{k'}(A', k' ⊗_k R), natural in R; it is unique up to unique isomorphism. Construction (coordinate-free): write A' = Sym_{k'}(k' ⊗_k M)/I for a k-module M; set Res A' = Sym_k((k')^∨ ⊗_k M)/I^♮ where (k')^∨ = Hom_k(k', k) and I^♮ is generated by the elements (λ ⊗ id)(j(x)) for λ ∈ (k')^∨, x ∈ I, with j : Sym_{k'}(k' ⊗ M) → k' ⊗_k Sym_k((k')^∨ ⊗ M) the universal map. When k' is free with basis (e_1, …, e_d), Res A' for A' = k'[X_1, …, X_n]/(P_1, …, P_s) is the polynomial ring k[Y_{ij}] modulo the d·s coordinates of P_l(Σ_i e_i Y_{i1}, …, Σ_i e_i Y_{in}) in the basis. For A' finitely presented this is the coordinate ring of the representing scheme of ModularCurves Layer 0F.

**Hypotheses.** k → k' finite locally free (finite projective); A' a commutative k'-algebra, arbitrary (Česnavičius: arbitrary affine).

**Prerequisites.** [The Weil restriction functor of an affine scheme](#RG2-0a-weil-restriction-functor) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-functor`); `tauceti:TauCetiRoadmap/ModularCurves#0f-hom-schemes-and-closed-loci`; `mathlib:CategoryTheory.Functor.RepresentableBy`; `mathlib:Algebra.TensorProduct.basis`; `mathlib:Module.Dual`.

**Uses.**

- ReductiveGroupsPartII:RG2.0a/weil-restriction-group-scheme: the Hopf algebra structure is transported to Res.
- ReductiveGroupsPartII:RG2.0a/deligne-torus: S = Res_{ℂ/ℝ} G_m as an explicit ℝ-algebra.
- Harpaz–Wittenberg 2020, §1.1: Res_{E/k} A¹ and Res_{E/k} G_m.
- Česnavičius 2019, Lemma 2.1: representability of Res_{S'/S}(G_{S'}) by an S-affine scheme.

**API.**

- `WeilRestriction.Res` (constructor): The representing commutative k-algebra Res_{k'/k} A'.
- `WeilRestriction.universal` (data): The universal k'-algebra map u : A' → k' ⊗_k Res A'.
- `WeilRestriction.homEquiv` (universal-property): Hom_k(Res A', R) ≃ Hom_{k'}(A', k' ⊗_k R), φ ↦ (id ⊗ φ) ∘ u, natural in R.
- `WeilRestriction.homEquiv_naturality` (functoriality): homEquiv commutes with postcomposition by k-algebra maps R → S.
- `WeilRestriction.map` (functoriality): A k'-algebra map B' → A' induces a k-algebra map Res B' → Res A', with map_id and map_comp.
- `WeilRestriction.hom_ext` (extensionality): Two k-algebra maps Res A' → R agreeing after homEquiv are equal.
- `WeilRestriction.basisPresentation` (characterisation): For k' free with a basis and A' = k'[X]/(P), Res A' ≃ k[Y_{ij}]/(coordinates of the P_l).
- `WeilRestriction.res_compat_modularCurves` (compatibility): For A' finitely presented, Spec(Res A') is the representing scheme of ModularCurves Layer 0F.

**Unit tests.**

- `WeilRestriction.res_affineLine_free` (computation): For k' free of rank d with a basis, Res_{k'/k}(k'[t]) ≃ MvPolynomial (Fin d) k.
- `WeilRestriction.res_self` (compatibility): Res_{k/k} A′ ≃ A′ as k-algebras, with the universal point bijection equal to the identity under k⊗_k R ≃ R.
- `WeilRestriction.res_units_complex` (computation): Res_{ℂ/ℝ}(ℂ[t,t⁻¹]) ≃ ℝ[x, y, (x² + y²)^{-1}].
- `WeilRestriction.res_not_flat` (non-example): Let O=ℤ₃, O′=O[√3] and A′=O′[x]/(x²), flat over O′. Its restriction algebra is O[a,b]/(a²+3b²,2ab), where b³ is nonzero and killed by 3, so Res(A′) is not O-flat.

**Construction or proof.**

1. Free affine space: for E a k-module, Hom_{k'}(Sym_{k'}(k' ⊗ E), k' ⊗ R) = Hom_k(E, k' ⊗ R) ≅ Hom_k((k')^∨ ⊗ E, R) = Hom_k(Sym_k((k')^∨ ⊗ E), R), because k' is finite projective (BT II 1.5.6, pp. 27–28).
2. Relations: a point of the free algebra vanishes on I iff its transform vanishes on I^♮; this uses that k ↪ k' ⊗ R detects zero through the dual basis (BT II 1.5.1 and 1.5.7, pp. 26–28).
3. Basis description: with a basis of k' and the dual basis, I^♮ is generated by the coordinates of the P_l (BT II 1.5.10, p. 29); comparison with ModularCurves Layer 0F by uniqueness of representing objects (Yoneda, Mathlib RepresentableBy).
4. Stacks 05YF gives representability by an algebraic space in general; here the affine target makes the representing object affine.

**Acceptance.**

- For k = ℝ, k' = ℂ with basis (1, i) and A' = ℂ[t, t⁻¹] = ℂ[t, s]/(ts − 1): Res A' = ℝ[x, y, u, v]/(xu − yv − 1, xv + yu), isomorphic to ℝ[x, y, (x² + y²)^{-1}].
- For A' = k'[t], Res A' is the symmetric algebra of (k')^∨ (a polynomial ring in d variables when k' is free of rank d).

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 1.5.1–1.5.7 and 1.5.10, pp. 26–29. Explicit coordinate-free construction of the restriction of scalars of an affine scheme along a finite projective algebra: symmetric algebra of the dual tensored with generators, modulo the ideal generated by the dual-basis components of the relations; basis description for free B.
- [The Stacks Project Authors, *The Stacks Project, Section 97.11 (Tag 05Y8, Restriction of scalars) and Tag 05YF*](https://stacks.math.columbia.edu/tag/05Y8): Tag 05YF (Section 97.11, Proposition). Representability of Res_{Z/B}(X) by an algebraic space when Z → B is finite locally free; the affine case planned here gives an affine scheme.
- [Kęstutis Česnavičius, *Purity for the Brauer group*](https://arxiv.org/abs/1711.06456): Lemma 2.1, p. 3. Uses the Weil restriction of an S-affine group along a finite locally free S' → S, representable by an S-affine scheme, without finiteness assumptions on the group.
- [Yonatan Harpaz, Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://arxiv.org/abs/1802.09605): §1.1, p. 6, and §4, p. 15. Uses Res_{E/k} A¹ and Res_{E/k} G_m for finite étale E/k, identified with affine space and the complement of the norm hypersurface by a basis.

<a id="RG2-0a-weil-restriction-finiteness"></a>

### Finiteness and coordinates of a Weil restriction

Target `ReductiveGroupsPartII:RG2.0a/weil-restriction-finiteness`. Theorem; suggested declaration `WeilRestriction.finiteType_res`.

Let k → k' be finite locally free and A' a commutative k'-algebra. If A' is of finite type over k', then Res_{k'/k} A' is of finite type over k; if A' is finitely presented, so is Res A'; over a noetherian k finite type suffices for finite presentation. If k' is free of rank d, the choice of a basis identifies Res(k'[X_1, …, X_n]) with k[Y_{ij}] (1 ≤ i ≤ d, 1 ≤ j ≤ n), and a change of basis acts by the induced invertible linear substitution of the Y's; in particular Res(A^n_{k'}) ≅ A^{nd}_k. For k' a finite separable field extension of a field k, Res_{k'/k} G_m is the open complement in A^d_k of the zero set of the norm form, and Res_{k'/k} A¹ = A^d_k.

**Hypotheses.** k → k' finite locally free; for the coordinate statements: k' free of rank d with a chosen basis.

**Prerequisites.** [The representing algebra of a Weil restriction](#RG2-0a-weil-restriction-representing-algebra) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-representing-algebra`); `mathlib:Algebra.FiniteType`; `mathlib:Algebra.FinitePresentation`; `mathlib:Algebra.norm_eq_matrix_det`.

**Construction or proof.**

1. Choose a presentation with E free of finite rank (finite type) and I finitely generated (finite presentation); then (k')^∨ ⊗ E is a finite projective k-module and I^♮ is generated by finitely many elements (BT II 1.5.8, p. 28).
2. Basis change: the dual basis transforms contragrediently, so the coordinates Y transform by the transpose-inverse substitution (BT II 1.5.10, p. 29).
3. Units: a point x ∈ k' ⊗ R is a unit iff its norm is a unit (determinant of multiplication; Mathlib Algebra.norm_eq_matrix_det), giving the norm complement (Milne iAG, Lemma 14.38, p. 238; Harpaz–Wittenberg §1.1).

**Acceptance.**

- Res_{ℚ(√2)/ℚ} G_m = Spec ℚ[x, y, (x² − 2y²)^{-1}].
- Res_{ℂ/ℝ} A¹ = A²_ℝ.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 1.5.8 and 1.5.10, pp. 28–29. Finite type and finite presentation are inherited; explicit polynomial description in a basis.
- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): Lemma 14.38, p. 238. Res_{k'/k} G_m is the complement of the zero set of the norm polynomial in affine space.
- [Yonatan Harpaz, Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://arxiv.org/abs/1802.09605): §1.1, p. 6. Res_{E/k} A¹ and Res_{E/k} G_m identified with affine space and the norm-nonzero open set by a k-basis of E.

<a id="RG2-0a-weil-restriction-base-change"></a>

### Base change, composition and products of Weil restrictions

Target `ReductiveGroupsPartII:RG2.0a/weil-restriction-base-change`. Theorem; suggested declaration `WeilRestriction.baseChangeEquiv`.

For k → k' finite locally free and A' a commutative k'-algebra there are natural isomorphisms, compatible with the universal elements: (1) base change: for any k → l, (Res_{k'/k} A') ⊗_k l ≅ Res_{l'/l}(A' ⊗_{k'} l') with l' = k' ⊗_k l; (2) composition: for finite locally free k → k' → k'', Res_{k'/k} Res_{k''/k'} A'' ≅ Res_{k''/k} A''; (3) products: Res(A' ⊗_{k'} B') ≅ Res A' ⊗_k Res B' and Res(k') = k; more generally Res commutes with fibre products (finite limits) of affine schemes. These isomorphisms are coherent: the composition isomorphisms are associative for towers of three extensions, and base change commutes with composition and products.

**Hypotheses.** all ring maps finite locally free where Weil restriction is formed; l any commutative k-algebra.

**Prerequisites.** [The representing algebra of a Weil restriction](#RG2-0a-weil-restriction-representing-algebra) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-representing-algebra`); `mathlib:Algebra.TensorProduct.assoc`; `mathlib:Algebra.TensorProduct.cancelBaseChange`.

**Construction or proof.**

1. (1) Compare functors on l-algebras S: Hom_{l'}(A' ⊗ l', l' ⊗_l S) = Hom_{k'}(A', k' ⊗_k S) (Mathlib Algebra.TensorProduct.cancelBaseChange); conclude by Yoneda (BT II 1.5.3, p. 27).
2. (2) Hom_{k''}(A'', k'' ⊗_{k'} (k' ⊗_k R)) = Hom_{k''}(A'', k'' ⊗_k R) using associativity of tensor products (Mathlib Algebra.TensorProduct.assoc) (Milne iAG 2.39, p. 51; BT II 1.5.3).
3. (3) Res is a right adjoint (RG2.0a/weil-restriction-adjunction), hence preserves limits of affine schemes (Milne iAG 2.38, p. 51); coherence follows from uniqueness of the induced maps on functors.

**Acceptance.**

- Res_{ℂ/ℝ}(A') ⊗_ℝ ℂ ≅ Res_{ℂ⊗ℂ/ℂ}(A' ⊗_ℂ (ℂ ⊗_ℝ ℂ)) ≅ A' ⊗ A'^σ (two factors), the input of the separable splitting.
- Res_{ℚ(√2,√3)/ℚ} ≅ Res_{ℚ(√2)/ℚ} ∘ Res_{ℚ(√2,√3)/ℚ(√2)}.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 1.5.3–1.5.4, p. 27. Base change of restriction of scalars along A → A', transitivity for towers, functoriality and compatibility with products of schemes and group schemes.
- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): 2.38–2.39, p. 51. Weil restriction is right adjoint to base change, hence preserves products, fibre products and kernels; transitivity for towers.
- [Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*](https://arxiv.org/abs/1407.8519): §1.4.1, p. 426. Uses Res_{O/O_0} for a totally ramified extension of Witt vector rings and its compatibility with loop groups through W_O(R) = W(R) ⊗ O.
- [Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2208.07195): Remark 2.4, p. 16. Mentions restriction of scalars as the reduction from finite extensions of Q_p to Q_p; the base-change and coherence proofs come from BT II and the universal property, not this remark.

<a id="RG2-0a-weil-restriction-adjunction"></a>

### Weil restriction is right adjoint to base change

Target `ReductiveGroupsPartII:RG2.0a/weil-restriction-adjunction`. Theorem; suggested declaration `WeilRestriction.adjunction`.

For k → k' finite locally free, Res_{k'/k} is right adjoint to base change B ↦ k' ⊗_k B on commutative algebras (contravariantly: on affine schemes, base change ⊣ Weil restriction): Hom_{k'}(A', k' ⊗_k B) ≅ Hom_k(Res A', B), naturally in the k-algebra B and the k'-algebra A'. The counit is the evaluation map u : A' → k' ⊗_k Res A' (on schemes (Res X')_{k'} → X'); the unit is η_B : Res_{k'/k}(k' ⊗_k B) → B (on schemes the diagonal X → Res_{k'/k}(X_{k'}), on points R-points x ↦ 1 ⊗ x). The triangle identities hold. If k → k' is moreover faithfully flat (for instance a finite extension of fields or of discrete valuation rings), the unit X → Res(X_{k'}) is a closed immersion; for groups it is the diagonal embedding G → Res(G_{k'}) used for norm maps and reflex norms.

**Hypotheses.** k → k' finite locally free; for the closed-immersion statement: k → k' faithfully flat and X affine.

**Prerequisites.** [The representing algebra of a Weil restriction](#RG2-0a-weil-restriction-representing-algebra) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-representing-algebra`); `tauceti:TauCeti.AlgHom.faithfullyFlatDescentMulEquiv`.

**Construction or proof.**

1. The adjunction bijection is the defining universal property of RG2.0a/weil-restriction-representing-algebra read in the variable B; naturality in A' by functoriality.
2. Unit on points: R → k' ⊗ R, r ↦ 1 ⊗ r, induces X(R) → X(k' ⊗ R) = Res(X_{k'})(R) (Milne iAG 2.37, p. 50); triangle identities by evaluating on universal points.
3. Closed immersion: the map is a monomorphism of affine schemes whose image is the equalizer of the two maps Res(X_{k'}) ⇉ Res(X_{k'⊗k'}) (faithfully flat descent of points, Tau Ceti AlgHom.faithfullyFlatDescentMulEquiv), an intersection of closed conditions.

**Acceptance.**

- For G = G_m and k'/k a quadratic field extension the unit is the inclusion G_m → Res_{k'/k} G_m, x ↦ x ∈ (k' ⊗ R)^×, and composing with the norm gives x ↦ x².

**Sources.**

- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): 2.37–2.38, pp. 50–51. The homomorphism G → Res_{A/k}(G_A) and its universal property, i.e. the adjunction between base change and Weil restriction.
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.3.8, (1.3.10), p. 142. Uses the closed immersion of a Bruhat–Tits group scheme into the Weil restriction of its base change to a tame splitting field.

<a id="RG2-0a-weil-restriction-group-scheme"></a>

### Weil restriction of an affine group scheme

Target `ReductiveGroupsPartII:RG2.0a/weil-restriction-group-scheme`. Construction; suggested declaration `WeilRestriction.instHopfAlgebraRes`.

Let k → k' be finite locally free and H' a commutative Hopf k'-algebra (an affine k'-group scheme G'). Then Res_{k'/k} H' carries a unique commutative Hopf k-algebra structure such that the bijection of points Res(G')(R) ≅ G'(k' ⊗_k R) is a group isomorphism for every k-algebra R (the convolution group structures of Tau Ceti on both sides), naturally in R. A Hopf map H'_1 → H'_2 induces a Hopf map on Weil restrictions; the base-change, composition and product isomorphisms of RG2.0a/weil-restriction-base-change are Hopf isomorphisms; Res(G'_m) has points (k' ⊗ R)^×, Res(GL_n) has points GL_n(k' ⊗ R), Res(μ_n) has points μ_n(k' ⊗ R).

**Hypotheses.** k → k' finite locally free; H' a commutative Hopf k'-algebra.

**Prerequisites.** [Base change, composition and products of Weil restrictions](#RG2-0a-weil-restriction-base-change) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-base-change`); `tauceti:TauCeti.AlgHom.instGroup`; `mathlib:CommHopfAlgCat`; `tauceti:TauCeti.MultiplicativeGroup.pointsMulEquiv`; `tauceti:TauCeti.GeneralLinear.pointsMulEquiv`.

**Uses.**

- AdelicAlgebraicGroups:AA.1 (request): Res_{E/F}G(𝔸_F) ≅ G(𝔸_E) as groups, natural in continuous value-algebra maps.
- AutomorphicFormsOnReductiveGroups:AF.5 (request): identifies Res_{E/F}G(𝔸_F) with G(𝔸_E).
- HilbertModularVarietiesAndShimuraCurves:H0 (request): Res_{F/ℚ} GL_2 and Res B^× as group schemes.
- ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction: the L-group of a Weil restriction.
- Kaletha 2016, §3.1: Res_{E/F} μ_n and its diagonal quotient.

**API.**

- `WeilRestriction.instHopfAlgebraRes` (instance): Res_{k'/k} H' is a commutative Hopf k-algebra.
- `WeilRestriction.pointsMulEquiv` (equivalence): WithConv (Res H' →ₐ[k] R) ≃* WithConv (H' →ₐ[k'] k' ⊗_k R), natural in R.
- `WeilRestriction.pointsMulEquiv_naturality` (functoriality): pointsMulEquiv commutes with the maps induced by k-algebra maps R → S.
- `WeilRestriction.mapHopf` (functoriality): A Hopf map H'_1 → H'_2 induces a Hopf map Res H'_1 → Res H'_2, with identity and composition laws.
- `WeilRestriction.multiplicativeGroupPoints` (example): Points of Res_{k'/k} G_m over R are (k' ⊗_k R)^×.
- `WeilRestriction.generalLinearPoints` (example): Points of Res_{k'/k} GL_n over R are GL_n(k' ⊗_k R).
- `WeilRestriction.diagonal` (data): The diagonal homomorphism G → Res_{k'/k}(G_{k'}) (unit of the adjunction) as a Hopf map.

**Unit tests.**

- `WeilRestriction.res_multiplicative_complex_points` (computation): The ℝ-points of Res_{ℂ/ℝ} G_m are ℂ^× with its multiplication.
- `WeilRestriction.res_trivial_group` (degenerate): Res_{k'/k} of the trivial Hopf algebra k' is the trivial Hopf algebra k.
- `WeilRestriction.pointsMulEquiv_generalLinear` (compatibility): For H' the GL_n coordinate Hopf algebra, pointsMulEquiv composed with Tau Ceti GeneralLinear.pointsMulEquiv over k' ⊗ R is a group isomorphism onto GL_n(k' ⊗ R).
- `WeilRestriction.res_not_commutative_of_commutative_base` (non-example): Res_{ℂ/ℝ} GL_2 is not commutative: its ℝ-points GL_2(ℂ) are nonabelian (Weil restriction of a nonabelian group is nonabelian).

**Construction or proof.**

1. Res preserves finite products and the terminal object (RG2.0a/weil-restriction-base-change (3)), so it carries group objects to group objects (BT II 1.5.4, p. 27; Milne iAG 2.36, p. 50).
2. Identify the induced group law on points with convolution in G'(k' ⊗ R) by evaluating on the universal element.
3. Examples: compose with the Tau Ceti points identifications for G_m and GL_n (MultiplicativeGroup.pointsMulEquiv, GeneralLinear.pointsMulEquiv).

**Acceptance.**

- Res_{ℂ/ℝ} G_m(ℝ) = ℂ^× as a group.
- Res_{E/F} GL_n(R) = GL_n(E ⊗_F R) for every F-algebra R, compatibly with multiplication.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 1.5.4, p. 27. Restriction of scalars commutes with products, so a group scheme restricts to a group scheme.
- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): 2.36, p. 50. Res_{A/k} G is an algebraic group with Res(G)(R) = G(A ⊗ R).
- [Tasho Kaletha, *Rigid inner forms of real and p-adic groups*](https://arxiv.org/abs/1304.3292): §3.1, p. 10. Uses Res_{E/F} μ_n with its points and character module.

<a id="RG2-0a-weil-restriction-smoothness-and-immersions"></a>

### Weil restriction preserves smoothness and immersions

Target `ReductiveGroupsPartII:RG2.0a/weil-restriction-smoothness-and-immersions`. Theorem; suggested declaration `WeilRestriction.formallySmooth_res`.

Let k → k' be finite locally free. Then Res_{k'/k} carries: formally smooth k'-algebras to formally smooth k-algebras, smooth (finitely presented and formally smooth) to smooth, étale to étale, surjective k'-algebra maps (closed immersions) to surjective maps (closed immersions), and localizations A' → A'_f (basic open immersions) to open immersions. For a finite field extension k'/k and X' of finite type over k', dim Res_{k'/k} X' = [k' : k] dim X'. Flatness is not preserved in general (BT II 1.5.8).

**Hypotheses.** k → k' finite locally free; for dimension: k'/k a finite field extension.

**Prerequisites.** [The representing algebra of a Weil restriction](#RG2-0a-weil-restriction-representing-algebra) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-representing-algebra`); [Finiteness and coordinates of a Weil restriction](#RG2-0a-weil-restriction-finiteness) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-finiteness`); `mathlib:Algebra.FormallySmooth`; `mathlib:Algebra.Smooth`.

**Construction or proof.**

1. Formal smoothness: a lifting problem for Res A' against R → R/J (J nilpotent) is a lifting problem for A' against k' ⊗ R → k' ⊗ R/J, whose kernel k' ⊗ J is nilpotent (Mathlib Algebra.FormallySmooth definition); finite presentation from RG2.0a/weil-restriction-finiteness (BT II 1.5.8, p. 28, citing Demazure–Gabriel).
2. Closed immersions: the map I ↦ I^♮ is monotone (BT II 1.5.9, p. 28); open immersions: Res of A'_f is the localization of Res A' at the norm of f (BT II 1.5.12, p. 29).
3. Dimension: after a separable splitting (RG2.0a/weil-restriction-separable-splitting) or by counting coordinates for smooth X'; flatness counterexample BT II 1.5.8.

**Acceptance.**

- Res_{k'/k} of a smooth affine group is smooth (e.g. Res GL_n).
- Res_{O'/O} of the smooth model G_{m,O'} is smooth over O.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 1.5.8–1.5.12, pp. 28–29. Finite type/presentation preserved, smoothness preserved, flatness not preserved, closed and open subschemes correspond.
- [Kęstutis Česnavičius, *Purity for the Brauer group*](https://arxiv.org/abs/1711.06456): Lemma 2.1, p. 3. Uses that the Weil restriction (and a homogeneous space under it) is smooth when the group is smooth, along a finite locally free morphism.

<a id="RG2-0a-weil-restriction-separable-splitting"></a>

### Splitting of a Weil restriction over a separable extension

Target `ReductiveGroupsPartII:RG2.0a/weil-restriction-separable-splitting`. Theorem; suggested declaration `WeilRestriction.splittingEquiv`.

Let k'/k be a finite separable field extension, Ω a field containing k and a normal closure of k'/k (for example a separable closure), and A' a commutative k'-algebra. Then there is a canonical Ω-algebra isomorphism Ω ⊗_k Res_{k'/k} A' ≅ ⨂_{τ : k' → Ω} (Ω ⊗_{k',τ} A') (tensor product over Ω of the conjugates of A' along the [k' : k] embeddings τ over k), i.e. (Res X')_Ω ≅ ∏_τ X'_{τ,Ω}; for σ ∈ Aut(Ω/k) the semilinear action on the left corresponds to the action on the right that sends the τ-factor to the στ-factor via σ. For group schemes this is an isomorphism of group schemes, so (Res G')_Ω ≅ ∏_τ G'_τ with Galois permuting the factors; for k = ℝ, k' = ℂ, Ω = ℂ it gives (Res_{ℂ/ℝ} X')_ℂ ≅ X' × X'^c with complex conjugation swapping the factors.

**Hypotheses.** k'/k finite separable; Ω/k containing all k-embeddings of k' (normal closure inside Ω).

**Prerequisites.** [Base change, composition and products of Weil restrictions](#RG2-0a-weil-restriction-base-change) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-base-change`); `mathlib:Algebra.FormallyEtale.equivPiOfIsSepClosed`; `mathlib:AlgHom.card`.

**Construction or proof.**

1. Ω ⊗_k k' ≅ ∏_τ Ω by τ-components, since k'/k is étale and Ω splits it (Mathlib Algebra.FormallyEtale.equivPiOfIsSepClosed; AlgHom.card counts the embeddings).
2. Then Res X'(Ω ⊗ R) for Ω-algebras R becomes X'(∏_τ R_τ) = ∏_τ X'_τ(R) using base change RG2.0a/weil-restriction-base-change (1) and products (3).
3. Galois equivariance: σ permutes the idempotents of Ω ⊗ k' as it permutes embeddings (Milne iAG 2.h; Harpaz–Wittenberg §1.1).

**Acceptance.**

- (Res_{ℂ/ℝ} G_m)_ℂ ≅ G_m × G_m with z ↦ (z, z̄) on ℝ-points ℂ^×.
- For a totally real field F of degree d, (Res_{F/ℚ} GL_2)_ℝ ≅ GL_2^d indexed by the real embeddings.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 1.5.14–1.5.16, pp. 30–31. Restriction of scalars along a finite extension of fields, and its description after a Galois extension in terms of conjugates.
- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): 2.h, pp. 50–51, and Lemma 14.39, p. 238. Weil restriction for finite extensions; the character module of Res G_m is the permutation module on embeddings.
- [Yonatan Harpaz, Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://arxiv.org/abs/1802.09605): §1.1, p. 6. Finite étale algebras and their Weil restrictions, identified after splitting.

Atlas planet: **Splitting of a Weil restriction**.

<a id="RG2-0a-weil-restriction-descent-of-properties"></a>

### Weil restriction of reductive groups

Target `ReductiveGroupsPartII:RG2.0a/weil-restriction-descent-of-properties`. Theorem; suggested declaration `WeilRestriction.reductive_res_iff`.

Let k'/k be a finite separable field extension and G' an affine group scheme of finite type over k'. Then Res_{k'/k} G' is smooth, resp. geometrically connected, resp. reductive, resp. semisimple, resp. a torus, if and only if G' is; Z(Res G') = Res Z(G'), (Res G')^der = Res (G'^der); the relative root system of Res G' over k is that of G' over k' with multiplicities multiplied by [k' : k] when the maximal split tori correspond (S = maximal split subtorus of Res S'). The separability hypothesis is necessary: for k'/k purely inseparable of degree p, Res_{k'/k} G_m is smooth and connected but not reductive (its unipotent radical has dimension p − 1).

**Hypotheses.** k'/k finite separable for the equivalences; G' affine of finite type over k'.

**Prerequisites.** [Splitting of a Weil restriction over a separable extension](#RG2-0a-weil-restriction-separable-splitting) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-separable-splitting`); [Weil restriction preserves smoothness and immersions](#RG2-0a-weil-restriction-smoothness-and-immersions) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-smoothness-and-immersions`); `tauceti:TauCeti.reductiveCommHopfAlgProperty`; `tauceti:TauCeti.torusCommHopfAlgProperty`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. Each property is geometric and is tested after base change to Ω; by RG2.0a/weil-restriction-separable-splitting (Res G')_Ω ≅ ∏_τ G'_τ, and each property holds for a finite product iff for each factor iff for G' (reductivity: anchor Layer 6 predicate, Tau Ceti reductiveCommHopfAlgProperty; tori: Tau Ceti torusCommHopfAlgProperty).
2. Centre and derived group commute with products and descend.
3. Inseparable counterexample: the kernel of Res_{k'/k} G_m → G_m (norm) contains a nontrivial unipotent subgroup over k̄ (Milne iAG; Conrad–Gabber–Prasad pseudo-reductive example), so reductivity fails; smoothness and connectedness still hold (RG2.0a/weil-restriction-smoothness-and-immersions).

**Acceptance.**

- Res_{ℂ/ℝ} SL_2 is semisimple of real rank one with relative root system A_1 of multiplicity 2.
- Res_{F/ℚ} GL_2 is reductive for F a number field.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 1.5.14, pp. 30–31. Restriction of scalars along a finite extension of fields and the transport of properties of group schemes.
- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): 2.h, p. 50, and Lemma 14.38, p. 238. Weil restriction of algebraic groups along finite extensions; Res G_m for separable extensions.
- [Kęstutis Česnavičius, *Purity for the Brauer group*](https://arxiv.org/abs/1711.06456): §2, Lemma 2.1, p. 3. Weil restriction of smooth affine groups is smooth; no reductivity is asserted along inseparable maps.

Atlas planet: **Weil restriction of reductive groups**.

<a id="RG2-0a-weil-restriction-character-lattices"></a>

### Character lattices of Weil-restricted tori

Target `ReductiveGroupsPartII:RG2.0a/weil-restriction-character-lattices`. Theorem; suggested declaration `WeilRestriction.characterGroupEquivInduced`.

Let k'/k be finite separable with absolute Galois groups Γ_{k'} ⊂ Γ_k, and D' a k'-group of multiplicative type with character module M' (a Γ_{k'}-module, Tau Ceti geometric character group). Then Res_{k'/k} D' is of multiplicative type with character module the induced module Ind_{Γ_{k'}}^{Γ_k} M' = ℤ[Γ_k] ⊗_{ℤ[Γ_{k'}]} M' (as Γ_k-modules, finite index so induced = coinduced); for a torus T', X_*(Res T') ≅ Ind X_*(T') compatibly with the pairing. In particular X^*(Res_{k'/k} G_m) ≅ ℤ[Hom_k(k', k^sep)] (a permutation module) and X^*(Res_{k'/k} μ_n) ≅ (ℤ/n)[Hom_k(k', k^sep)] with Γ_k permuting the embeddings.

**Hypotheses.** k'/k finite separable; D' of multiplicative type over k' (finite type).

**Prerequisites.** [Splitting of a Weil restriction over a separable extension](#RG2-0a-weil-restriction-separable-splitting) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-separable-splitting`); `tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup`; `tauceti:TauCeti.DiagonalizableGroup.pairing`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.

**Construction or proof.**

1. After base change to k^sep, (Res D')_{k^sep} ≅ ∏_τ D'_τ (RG2.0a/weil-restriction-separable-splitting), whose characters are ⊕_τ M'_τ; the Galois action permutes the summands as it permutes embeddings, which is the induced module (Milne iAG Lemma 14.39, p. 238).
2. Cocharacters: dual statement, using that the pairing is the sum of the pairings on factors (Tau Ceti DiagonalizableGroup.pairing).

**Acceptance.**

- X^*(Res_{ℂ/ℝ} G_m) = ℤ² with complex conjugation swapping the basis vectors.
- For a cyclic extension of degree 3, X^*(Res G_m) = ℤ[ℤ/3] with the regular action.

**Sources.**

- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): Lemma 14.39, p. 238. The character group of Res_{k'/k} G_m for separable k'/k is the permutation module on the k-embeddings of k'.
- [Tasho Kaletha, *Rigid inner forms of real and p-adic groups*](https://arxiv.org/abs/1304.3292): §3.1, p. 10. The character module of Res_{E/F} μ_n is (ℤ/n)[Γ_{E/F}] with Γ acting by left multiplication.

<a id="RG2-0a-weil-restriction-points-topology"></a>

### Topology on points of a Weil restriction

Target `ReductiveGroupsPartII:RG2.0a/weil-restriction-points-topology`. Comparison; suggested declaration `WeilRestriction.pointsHomeomorph`.

Let k → k' be finite free with a basis (finite locally free with a chosen presentation), A' a commutative k'-algebra of finite type and R a topological k-algebra; give k' ⊗_k R the topology transported from R^d along a basis (independent of the basis). Then the bijection Res_{k'/k}(A')-points over R ≅ Hom_{k'}(A', k' ⊗_k R) is a homeomorphism for the point topologies (RG2.0/affine-point-topology). For a finite extension E'/E of nonarchimedean local fields, Res_{E'/E}(X')(E) ≅ X'(E') is a homeomorphism (E' with its valuation topology, which is the product topology on E ⊗ E' ≅ E'), an isomorphism of topological groups for group schemes; for ℂ/ℝ, S(ℝ) ≅ ℂ^× as topological groups.

**Hypotheses.** k → k' finite free (or finite locally free with the quotient topology from a presentation); R a topological k-algebra.

**Prerequisites.** [Weil restriction of an affine group scheme](#RG2-0a-weil-restriction-group-scheme) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-group-scheme`); [Functoriality of the point topology](#RG2-0-affine-point-topology-functoriality) (`ReductiveGroupsPartII:RG2.0/affine-point-topology-functoriality`); [The topological group of rational points](#RG2-0-points-topological-group) (`ReductiveGroupsPartII:RG2.0/points-topological-group`); `mathlib:IsModuleTopology`.

**Construction or proof.**

1. Reduce to A' a polynomial ring via a closed immersion (RG2.0/affine-point-topology-functoriality (1)) and the fact that Weil restriction preserves closed immersions (RG2.0a/weil-restriction-smoothness-and-immersions).
2. For A' = k'[t_1..t_n] both sides are (k' ⊗ R)^n = R^{nd} with the product topology, by the basis description (Conrad, Example 2.4, p. 3).
3. For E'/E local, the valuation topology of E' is the module topology over E (Mathlib IsModuleTopology), i.e. the product topology in a basis.

**Acceptance.**

- S(ℝ) = Res_{ℂ/ℝ} G_m(ℝ) ≅ ℂ^× with the usual topology.
- Res_{E'/E} GL_n(E) ≅ GL_n(E') as topological groups.

**Sources.**

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf): Example 2.4, p. 3. For a module-finite locally free ring extension R → R' with compatible topologies, the topology on X'(R') agrees with that on Res_{R'/R}(X')(R), via a reduction to affine space and a direct-summand argument.

<a id="RG2-0a-integral-weil-restriction"></a>

### Weil restriction of integral models

Target `ReductiveGroupsPartII:RG2.0a/integral-weil-restriction`. Theorem; suggested declaration `WeilRestriction.integralPointsEquiv`.

Let O → O' be a finite extension of complete discrete valuation rings (finite free), with fraction fields K ⊂ K', and 𝒳' an affine O'-scheme (A'_O commutative O'-algebra). Then Res_{O'/O} 𝒳' is an affine O-scheme with generic fibre Res_{K'/K}(𝒳'_{K'}) and O-points Res(𝒳')(O) = 𝒳'(O'); it is of finite type (smooth) if 𝒳' is; for group schemes it is a group scheme with Res(𝒢')(O) = 𝒢'(O') ⊂ G'(K') = Res(G')(K); it commutes with base change along O → O_L (completed maximal unramified extension) and along any étale O → O_1; for a finite Galois K'/K with group Γ acting O'-semilinearly on 𝒳', Γ acts on Res_{O'/O} 𝒳' by O-automorphisms.

**Hypotheses.** O → O' finite free extension of complete DVRs; 𝒳' affine over O'.

**Prerequisites.** [Base change, composition and products of Weil restrictions](#RG2-0a-weil-restriction-base-change) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-base-change`); [Weil restriction preserves smoothness and immersions](#RG2-0a-weil-restriction-smoothness-and-immersions) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-smoothness-and-immersions`); [The completed maximal unramified extension Ĕ](#RG2-0-completed-maximal-unramified-extension) (`ReductiveGroupsPartII:RG2.0/completed-maximal-unramified-extension`).

**Construction or proof.**

1. Apply RG2.0a/weil-restriction-representing-algebra over O, and base change O → K (RG2.0a/weil-restriction-base-change (1)): K ⊗_O O' = K'.
2. Points: Res(𝒳')(O) = 𝒳'(O' ⊗_O O) = 𝒳'(O'); finite type and smoothness from RG2.0a/weil-restriction-finiteness and smoothness-and-immersions.
3. Γ-action: a semilinear action is an action on the pair (O', A'_O) over O, transported functorially (Kisin–Pappas §1.3.8, p. 142).

**Acceptance.**

- Res_{O'/O} G_{m,O'} is a smooth affine O-group with generic fibre Res_{K'/K} G_m and O-points O'^×.
- For a totally ramified O'/W(k), Res_{O'/W(k)} 𝒢 has the same loop group as 𝒢 (Zhu §1.4.1).

**Sources.**

- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.3.8, (1.3.8)–(1.3.10), p. 142. Uses Res_{Õ/O} of a Bruhat–Tits group scheme over a tame splitting field with its semilinear Galois action, and the closed immersion of the K-scheme into it.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §2.1.2, arXiv v3 p. 10. Uses integral restriction of scalars and the identification of stabilizer models for a finite extension of local fields.
- [Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*](https://arxiv.org/abs/1407.8519): §1.4.1, p. 426. For O totally ramified over W(k), uses Res_{O/W(k)} G of an affine group scheme and the identity of loop groups.
- [Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2208.07195): Remark 2.4, p. 16. A consumer of restriction of scalars for changing the local field; the integral construction is supplied by the preceding algebraic targets.

<a id="RG2-0a-norm-torus"></a>

### Norm maps and norm-one tori

Target `ReductiveGroupsPartII:RG2.0a/norm-torus`. Construction; suggested declaration `NormTorus.norm`.

Let k → k' be finite locally free of constant rank d. The norm morphism Nm : Res_{k'/k} G_m → G_m is the homomorphism of group schemes whose effect on R-points is the algebra norm (k' ⊗_k R)^× → R^× (determinant of multiplication, Mathlib Algebra.norm). Its kernel R^1_{k'/k} G_m is the norm-one group. For k'/k a finite separable field extension, R^1_{k'/k} G_m is a torus of dimension d − 1 with character module the cokernel of the diagonal ℤ → ℤ[Hom_k(k', k^sep)] and cocharacter module the augmentation kernel; the composite G_m → Res G_m → G_m (unit then norm) is x ↦ x^d. Similarly Res_{k'/k} μ_n modulo the diagonal μ_n has character module the augmentation kernel of (ℤ/n)[Hom_k(k', k^sep)]. For ℂ/ℝ: R^1_{ℂ/ℝ} G_m = U(1) ≅ SO_2 with real points the unit circle. Here n>0 and the quotient is the fppf quotient, not a quotient of every set of rational points. For finite Galois E⊂L over F and n|m, the transition Res_{L/F}μ_m→Res_{E/F}μ_n sends a geometric tuple (z_b) to (∏_{b↦a}z_b^(m/n))_a. It preserves the diagonal subgroups and induces an fppf epimorphism u_{L/F,m}→u_{E/F,n}; the transitions compose. On characters the induced injection sends (c_a) to ((m/n)c_{b|E})_b in the augmentation-zero module modulo m.

**Hypotheses.** k → k' finite locally free of constant rank d; for the torus statements: k'/k a finite separable field extension.

**Prerequisites.** [Weil restriction of an affine group scheme](#RG2-0a-weil-restriction-group-scheme) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-group-scheme`); [Character lattices of Weil-restricted tori](#RG2-0a-weil-restriction-character-lattices) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-character-lattices`); `mathlib:Algebra.norm`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Uses.**

- ShimuraVarieties:V0 (request to RG2.0a): torus norms and reflex norms Res_{E/ℚ} G_m → Res_{F/ℚ} G_m.
- Česnavičius 2019, Remark 6.3: the real norm-one torus and its torsor over G_m.
- Kaletha 2016, §3.1: Res_{E/F} μ_n modulo the diagonal and its character module.
- ReductiveGroupsPartII:RG2.1/nonsplit-torus-example: the anisotropic norm-one torus as the basic nonsplit test case.
- ReductiveGroupsPartII:RG2.0a/deligne-torus: the norm character of the Deligne torus.

**API.**

- `NormTorus.norm` (constructor): The natural homomorphism on units of k′⊗R, represented by the norm morphism of affine group schemes; on coordinate rings its arrow is reversed.
- `NormTorus.norm_points` (simp): On R-points, Nm(x) = Algebra.norm R x for x ∈ (k' ⊗_k R)^×.
- `NormTorus.normOne` (constructor): The kernel subgroup on R-points, represented by the norm-one group scheme.
- `NormTorus.norm_comp_diagonal` (relation): Nm ∘ (diagonal) is the d-th power map of G_m.
- `NormTorus.normOne_isTorus` (other): For k'/k separable, R^1_{k'/k} G_m is a torus of dimension [k' : k] − 1.
- `NormTorus.characterGroup_normOne` (characterisation): X^*(R^1 G_m) ≅ ℤ[Hom_k(k', k^sep)]/ℤ·(Σ τ), Galois-equivariantly.
- `NormTorus.resRootsOfUnityQuotient` (constructor): Res_{k'/k} μ_n modulo the diagonal μ_n, with character module the augmentation kernel.
- `NormTorus.rootsQuotientCharacterEquiv` (characterisation): X*(u_{E/F,n}) is Galois-equivariantly the augmentation kernel of (ℤ/n)[Hom_F(E,F^sep)], n>0.
- `NormTorus.rootsQuotientTransition` (functoriality): For E⊂L finite Galois over F and n|m, the product-power formula induces u_{L/F,m}→u_{E/F,n}, an fppf epimorphism, compatible with tower composition.
- `NormTorus.rootsQuotientTransition_character` (relation): The pullback on characters repeats each coefficient along the restriction fibre and multiplies it by m/n modulo m.

**Unit tests.**

- `NormTorus.norm_complex` (computation): For ℂ/ℝ, Nm(x + iy) = x² + y² on ℝ-points.
- `NormTorus.norm_trivial_extension` (degenerate): For k' = k, Nm is the identity of G_m and R^1 G_m is trivial.
- `NormTorus.normOne_compat_specialOrthogonal` (compatibility): R^1_{ℂ/ℝ} G_m is isomorphic to Tau Ceti's SO_2 over ℝ (both tori with real points the circle).
- `NormTorus.norm_not_surjective_points` (non-example): For ℂ/ℝ, Nm : ℂ^× → ℝ^× is not surjective (negative reals are not norms), although Nm is a surjective morphism of tori.
- `NormTorus.rootsQuotient_trivial_extension` (degenerate): For E=F the diagonal μ_n quotient is trivial: its character module is zero.
- `NormTorus.rootsQuotient_quadratic_two` (computation): For a quadratic separable E/F and n=2 the character module has two elements, and the quotient has scheme-theoretic order two (geometric point count two only in characteristic ≠2).
- `NormTorus.rootsQuotient_not_normOne` (non-example): For quadratic E/F and n=2 this quotient is finite of dimension zero; the norm-one torus has dimension one. Their character groups ℤ/2 and ℤ differ.

**Construction or proof.**

1. Define Nm on points by Algebra.norm, natural in R because the norm commutes with base change of free modules (determinant of a base-changed matrix); representability by Yoneda.
2. After separable splitting, Nm is multiplication of the embedding coordinates. On characters its pullback is ℤ→ℤ[embeddings], 1↦Σ_τ[τ]; on cocharacters it is the augmentation map. Exactness gives the quotient character lattice and augmentation-zero cocharacter lattice of R¹G_m.
3. Real case: Nm(x + iy) = x² + y², kernel the circle; Tau Ceti proves SO_2 is a torus.
4. For u_{E/F,n}, dualize the diagonal μ_n inclusion: the character map (ℤ/n)[embeddings]→ℤ/n is augmentation, hence the quotient characters are its kernel. This uses the anchor anti-equivalence for multiplicative-type groups, including nonsmooth μ_n when char F divides n.
5. The transition formula is a product over restriction fibres followed by the m/n power. Its dual is the injective repeated-coefficient map modulo m; it preserves augmentation zero and composes in towers, so the group maps are fppf epimorphisms (Kaletha §3.1, equations (3.1)–(3.2), p. 10).

**Acceptance.**

- R^1_{ℂ/ℝ} G_m(ℝ) = {z ∈ ℂ : z z̄ = 1}, compact.
- For an unramified quadratic extension E'/E of local fields, the norm Nm : E'^× → E^× has image of index 2 (Tau Ceti LocalFieldsRamification Layer 2 norm group).

**Sources.**

- [Kęstutis Česnavičius, *Purity for the Brauer group*](https://arxiv.org/abs/1711.06456): Remark 6.3, display (6.3.3), p. 14. Defines the real norm-one torus as the kernel of the norm from Res_{ℂ/ℝ} G_m and the associated torsor over G_m ⊂ ℙ¹.
- [Tasho Kaletha, *Rigid inner forms of real and p-adic groups*](https://arxiv.org/abs/1304.3292): §3.1, equations (3.1)–(3.2), p. 10 (arXiv v5). The exact sequence 1 → μ_n → Res_{E/F} μ_n → u_{E/F,n} → 1 and its character modules (augmentation).
- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): Lemma 14.38, p. 238. Res G_m as the complement of the norm hypersurface.

<a id="RG2-0a-tame-fixed-points-of-weil-restriction"></a>

### Edixhoven's tame fixed-point theorem

Target `ReductiveGroupsPartII:RG2.0a/tame-fixed-points-of-weil-restriction`. Theorem; suggested declaration `WeilRestriction.smooth_fixedPoints`.

Let O be a henselian discrete valuation ring, K'/K a finite Galois extension with group Γ of order invertible in O (for example tamely ramified with p ∤ |Γ|), O' the integral closure of O in K', and X a smooth affine O'-scheme with an O'-semilinear action of Γ. Then the functor of Γ-fixed points of Res_{O'/O} X is represented by a closed subscheme (Res_{O'/O} X)^Γ, which is smooth over O; its generic fibre is the Galois descent of X_{K'} to K. For a split torus T' over K' with its Néron model and the induced semilinear action, the identity component of (Res_{O'/O} 𝒯')^Γ is the connected Néron model of the descended torus T over K.

**Hypotheses.** K'/K finite Galois with |Γ| invertible on O; X smooth affine over O' with semilinear Γ-action.

**Prerequisites.** [Weil restriction of integral models](#RG2-0a-integral-weil-restriction) (`ReductiveGroupsPartII:RG2.0a/integral-weil-restriction`); [Weil restriction preserves smoothness and immersions](#RG2-0a-weil-restriction-smoothness-and-immersions) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-smoothness-and-immersions`).

**Construction or proof.**

1. Fixed points of a finite group acting on an affine scheme are represented by a closed subscheme (Edixhoven, Prop. 3.1, p. 293).
2. Smoothness: the infinitesimal lifting criterion for the fixed locus reduces, by averaging over Γ (|Γ| invertible), to that of X (Edixhoven, Prop. 3.4, p. 294).
3. Néron models: Edixhoven §4 (Prop. 4.1, Thm 4.2, p. 295) identifies Γ-invariants of the Weil restriction of a Néron model with the Néron model in the tame case; Kisin–Pappas use it for tori.

**Acceptance.**

- For K'/K tame quadratic and X = G_{m,O'} with Γ acting through x ↦ σ(x)^{-1}, the identity component of (Res X)^Γ is the connected Néron model of the norm-one torus.
- The hypothesis |Γ| invertible is necessary: Edixhoven §4.3 gives a wildly ramified example where the conclusion fails.

**Sources.**

- [Bas Edixhoven, *Néron models and tame ramification*](http://www.numdam.org/item/CM_1992__81_3_291_0.pdf): Propositions 3.1 and 3.4, pp. 293–294; Proposition 4.1, Theorem 4.2 and Example 4.3, pp. 295–297. Fixed points of a finite group acting on a smooth scheme over a base where the group order is invertible form a smooth closed subscheme; application to Néron models under tame base change, and a wild counterexample.
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): proof of Proposition 1.1.4, p. 129; proof of Proposition 1.3.9, p. 143. Cites Edixhoven's result for the smoothness of tame fixed points of Weil restrictions and for connected Néron models of tori.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): proof of Proposition 2.2.2, p. 11; Remark 2.4.3(b), p. 15. Cites Edixhoven's lemma for the smoothness of (Res_{Õ/O} X)^Γ.

Atlas planet: **Edixhoven's tame fixed-point theorem**.

<a id="RG2-0a-deligne-torus"></a>

### The Deligne torus

Target `ReductiveGroupsPartII:RG2.0a/deligne-torus`. Construction; suggested declaration `DeligneTorus.S`.

S := Res_{ℂ/ℝ} G_m, the real torus with coordinate Hopf algebra ℝ[x, y, (x² + y²)^{-1}] (z = x + iy). Its points are S(R) = (ℂ ⊗_ℝ R)^× naturally in the ℝ-algebra R, with S(ℝ) = ℂ^× (topologically, RG2.0a/weil-restriction-points-topology). Over ℂ, S_ℂ ≅ G_m × G_m via the splitting of RG2.0a/weil-restriction-separable-splitting normalized so that the map S(ℝ) → S(ℂ) induced by ℝ ⊂ ℂ is z ↦ (z, z̄); complex conjugation acts on S(ℂ) = ℂ^× × ℂ^× by (z_1, z_2) ↦ (z̄_2, z̄_1) and on X^*(S) = ℤ² (characters (z_1, z_2) ↦ z_1^p z_2^q) by (p, q) ↦ (q, p). Pinned maps: the diagonal cocharacter d : G_m → S, d(r) = r on real points (ℝ^× ⊂ ℂ^×); the Deligne weight homomorphism w := d ∘ (r ↦ r^{-1}) (Deligne's normalization, w(r) = r^{-1}); the norm Nm : S → G_m, Nm(z) = z z̄ (RG2.0a/norm-torus), with Nm ∘ d = (r ↦ r²) and ker Nm = U(1); the cocharacter μ : G_{m,ℂ} → S_ℂ, μ(z) = (z, 1).

**Hypotheses.** the base field is ℝ with ℂ = ℝ(i) and the chosen square root i of −1.

**Prerequisites.** [Norm maps and norm-one tori](#RG2-0a-norm-torus) (`ReductiveGroupsPartII:RG2.0a/norm-torus`); [Splitting of a Weil restriction over a separable extension](#RG2-0a-weil-restriction-separable-splitting) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-separable-splitting`); [Topology on points of a Weil restriction](#RG2-0a-weil-restriction-points-topology) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-points-topology`); `tauceti:TauCeti.MultiplicativeGroup.pointsMulEquiv`; `tauceti:TauCeti.GL2NonSplitTorusHom`.

**Uses.**

- ShimuraData:D0–D1 (request to RG2.0a; RS-31 moved the construction here): Hodge structures as representations of S, the weight cocharacter and h(i); ShimuraData keeps the Hodge-sign comparisons.
- ShimuraData:D2: h : S → G_ℝ and its adjoint Hodge decomposition.
- AdelicAlgebraicGroups:AA.1: real points of Weil-restricted tori.
- Milne, Introduction to Shimura varieties, §2: S and its characters.

**API.**

- `DeligneTorus.S` (constructor): The commutative Hopf ℝ-algebra Res_{ℂ/ℝ}(ℂ[t, t⁻¹]).
- `DeligneTorus.pointsMulEquiv` (equivalence): Points of S over an ℝ-algebra R ≃* (ℂ ⊗_ℝ R)^×, natural in R.
- `DeligneTorus.realPointsMulEquiv` (equivalence): S(ℝ) ≃* ℂ^×, a homeomorphism for the point topology.
- `DeligneTorus.complexSplitting` (data): The isomorphism S_ℂ ≅ G_m × G_m with S(ℝ) → S(ℂ) given by z ↦ (z, z̄).
- `DeligneTorus.conj_swap` (relation): Complex conjugation on S(ℂ) corresponds to (z_1, z_2) ↦ (z̄_2, z̄_1).
- `DeligneTorus.diagonal` (data): The cocharacter d : G_m → S, r ↦ r on real points.
- `DeligneTorus.weight` (data): The weight cocharacter w = d ∘ inv (w(r) = r^{-1}), Deligne's normalization.
- `DeligneTorus.norm` (data): The character Nm : S → G_m, z ↦ z z̄, with Nm ∘ d = squaring.
- `DeligneTorus.mu` (data): The cocharacter μ : G_{m,ℂ} → S_ℂ, z ↦ (z, 1).
- `DeligneTorus.characterGroup` (characterisation): X^*(S) ≅ ℤ² with Gal(ℂ/ℝ) swapping the coordinates.

**Unit tests.**

- `DeligneTorus.norm_diagonal` (computation): Nm(d(r)) = r² for r ∈ ℝ^×.
- `DeligneTorus.weight_eq_inv_diagonal` (characterisation): w(r) = d(r)^{-1} for r ∈ ℝ^× (the sign convention is pinned).
- `DeligneTorus.realPoints_compat_GL2` (compatibility): Under S(ℝ)≃ℂ× the pinned multiplication representation has determinant Nm(z). Changing its chosen basis to (1,i) gives the matrix ((x,−y),(y,x)) for z=x+iy.
- `DeligneTorus.not_split` (non-example): S is not split over ℝ: Gal(ℂ/ℝ) acts on X^*(S) by swapping z and z̄, while a split torus has trivial Galois action on characters; correspondingly S(ℝ) = ℂ^× is connected whereas (ℝ^×)² is not.
- `DeligneTorus.kernel_norm_compact` (computation): The real points of ker(Nm) form the compact unit circle.

**Construction or proof.**

1. Define S as the Weil restriction of the G_m Hopf algebra along ℝ → ℂ (RG2.0a/weil-restriction-group-scheme); the basis (1, i) gives the coordinate ring (RG2.0a/weil-restriction-finiteness).
2. Splitting and conjugation from RG2.0a/weil-restriction-separable-splitting with the normalization z ↦ (z, z̄) (Milne, Introduction to Shimura varieties, p. 26); characters from RG2.0a/weil-restriction-character-lattices.
3. Diagonal, weight and norm maps from the adjunction unit and the norm (RG2.0a/weil-restriction-adjunction, RG2.0a/norm-torus); the sign of w follows Deligne 1979 as recorded by Milne (p. 26).

**Acceptance.**

- X^*(S) = ℤz ⊕ ℤz̄ with conjugation swapping z and z̄; X_*(S) = ℤ² with d = (1, 1) and μ = (1, 0).
- S(ℝ) = ℂ^× ⊃ U(1)(ℝ) = unit circle = ker(Nm on ℝ-points).

**Sources.**

- [J. S. Milne, *Introduction to Shimura Varieties*](https://www.jmilne.org/math/xnotes/svi.pdf): §2, 'Hodge structures as representations of S', p. 26. Defines S as the restriction of scalars of G_m from ℂ to ℝ, S(ℝ) = ℂ^×, S_ℂ ≅ G_m × G_m normalized by z ↦ (z, z̄), complex conjugation swapping the factors, the weight homomorphism r ↦ r^{-1} and the character group ℤ × ℤ with (p, q) ↦ (q, p).

Atlas planet: **Deligne torus**.

<a id="rg2-1"></a>

## RG2.1. Valued root data and apartments

The anchor supplies unvalued algebraic root data. This layer adds valuations, affine roots, apartments, normalizer actions and arithmetic invariants. Multipliable roots and central translations retain their own normalization data.

<a id="RG2-1-steinberg-quasi-split"></a>

### Steinberg's theorem over the completed unramified field

Target `ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`. Theorem; suggested declaration `BruhatTits.isQuasiSplit_of_residueField_isAlgClosed`.

Let L be henselian discretely valued with algebraically closed residue field. Every connected reductive L-group is quasi-split. If L is additionally perfect, Steinberg gives H¹(L,H)=1 for every connected smooth affine L-group H. Every finite tame Galois extension of L is totally ramified and cyclic of degree prime to the residue characteristic. The perfectness condition on L in the stated cohomology assertion cannot be replaced by perfectness of its residue field.

**Hypotheses.** L henselian discretely valued with algebraically closed residue field; G connected reductive over L; For the H¹ assertion: L perfect and H connected smooth affine.

**Prerequisites.** [The completed maximal unramified extension Ĕ](#RG2-0-completed-maximal-unramified-extension) (`ReductiveGroupsPartII:RG2.0/completed-maximal-unramified-extension`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

**Construction or proof.**

1. Use the strict-henselian quasi-splitness input exactly as in BT II 5.1.1, p. 145; the cohomology assertion under perfectness is Steinberg Theorem 1.9 and §10. Apply the cohomological-dimension bound for the henselian field from the ramification owner.
2. For perfect L, the variety of Borel subgroups is a homogeneous space covered by Steinberg Theorem 1.9(c) and Corollary 10.2(a); for arbitrary L use the reductive quasi-splitness result cited by BT II, not an assertion about arbitrary smooth affine groups.
3. Tame extensions: with algebraically closed residue field every finite extension is totally ramified, and the tame quotient of inertia is pro-cyclic of order prime to p (Tau Ceti LocalFieldsRamification Layer 3).

**Acceptance.**

- Every connected reductive group over Q̆_p has a Borel subgroup defined over Q̆_p; in particular a quaternion division algebra over Q_p splits over Q̆_p.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 5.1.1, p. 145. For a henselian valued field with perfect residue field and its strict henselization, quasi-splitness over the strict henselization holds by a theorem of Steinberg (cited as [32] and Borel–Springer 8.6), so the descent hypotheses are satisfied.
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): proof of Proposition 1.1.4, p. 128. Uses that over an algebraically closed residue field every connected reductive group is quasi-split (Steinberg) and that a tame Galois extension is totally ramified and cyclic of order prime to p.
- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): after Remark 4, p. 2. Uses Steinberg's theorem to say that the centralizer of a maximal split torus over a strictly henselian field is a torus.
- [Robert Steinberg, *Regular elements of semi-simple algebraic groups*](https://www.numdam.org/article/PMIHES_1965__25__49_0.pdf): Theorem 1.9, p. 51; Corollary 10.2 and proof of Theorem 1.9, pp. 78–79. The perfect-field cohomology theorem and Borel existence require perfectness of the ground field, a condition retained here.

<a id="RG2-1-root-datum-in-a-group"></a>

### Generating root datum in an abstract group

Target `ReductiveGroupsPartII:RG2.1/root-datum-in-a-group`. Definition; suggested declaration `BruhatTits.RootDatum`.

Let Φ be a (possibly non-reduced) root system in the dual V* of a finite-dimensional real vector space V, given as a root pairing. A root datum of type Φ in a group G (Bruhat–Tits) is a system (T, (U_a, M_a)_{a∈Φ}) where T ≤ G and each U_a ≤ G is a nontrivial subgroup, such that: (DR1) as stated; (DR2) for a, b that are not negatively proportional the commutator group [U_a, U_b] lies in the subgroup generated by the U_{pa+qb} with p, q positive integers and pa + qb ∈ Φ; (DR3) U_{2a} ⊂ U_a when 2a ∈ Φ; (DR4) M_a is a right coset of T and U_{−a} ∖ {1} ⊂ U_a M_a U_a; (DR5) for n ∈ M_a, n U_b n^{-1} = U_{s_a(b)}; (DR6) for a choice of positive roots, T U^+ ∩ U^− = {1}. It is generating if T and the U_a generate G. T normalizes each U_a.

**Hypotheses.** Φ a root system in V* (reduced or not), realized as a Mathlib root pairing over ℝ; G an abstract group.

**Prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`; `mathlib:RootPairing`.

**Uses.**

- Bruhat–Tits I, §6.2: the object that a valuation decorates.
- ReductiveGroupsPartII:RG2.1/rational-points-root-datum: the rational points of a reductive group with its maximal split torus give an instance.
- ReductiveGroupsPartII:RG2.2/building: the building of G(K) is built from a valued root datum.
- He 2018, §1.1: the local reductive datum with its relative root subgroups.

**API.**

- `BruhatTits.RootDatum` (constructor): The structure (T, (U_a)) of type Φ in G with the recorded axioms.
- `BruhatTits.RootDatum.le_normalizer` (projection): T normalizes each U_a.
- `BruhatTits.RootDatum.commutator_le` (projection): The commutator axiom DR2.
- `BruhatTits.RootDatum.le_of_root_eq_two_smul` (projection): U_{2a} ⊂ U_a.
- `BruhatTits.RootDatum.weylGroupEquiv` (equivalence): N/T ≃ W(Φ) where N is generated by T and the M_a.
- `BruhatTits.RootDatum.IsGenerating` (other): The predicate that T and the U_a generate G.

**Unit tests.**

- `BruhatTits.RootDatum.sl2` (computation): The diagonal torus and the two unipotent subgroups of SL_2(K) form a generating root datum of type A_1.
- `BruhatTits.RootDatum.rankZero` (degenerate): For Φ empty, a root datum is just a subgroup T (e.g. G = T a torus).
- `BruhatTits.RootDatum.unitary_BC1` (computation): For quasi-split SU_3, the subgroups U_{±a} ⊃ U_{±2a} give a root datum of type BC_1 (non-reduced).
- `BruhatTits.RootDatum.not_of_trivial_U` (non-example): Taking U_a = {1} for some root violates the nontriviality axiom DR1: the structure is not a root datum.
- `BruhatTits.RootDatum.normalizer_compat` (compatibility): For t∈T, conjugation by t carries each U_a onto itself; this agrees with Mathlib’s subgroup normalizer and subgroup-map constructions.

**Construction or proof.**

1. Record the axioms DR1–DR6 as in BT I 6.1.1 (p. 107), with Φ as a root pairing so that reflections s_a act on roots.
2. Derive the immediate consequences (BT I 6.1.2, pp. 107–110): the element m(u) ∈ M_a attached to u ∈ U_a ∖ {1}, T normalizing U_a, the subgroup N generated by T and the M_a with N/T ≅ W(Φ), and the Bruhat decomposition for the spherical Tits system (G, TU^+, N).

**Acceptance.**

- For G = SL_2(K), T the diagonal torus, U_± the upper and lower unipotent subgroups and M_a = T·(0 1; −1 0), the axioms hold with Φ of type A_1.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 6.1.1–6.1.2, pp. 107–110. Definition of a root datum of type Φ in a group by axioms DR1–DR6, generating data, and the first consequences (elements m(u), the group N, the Weyl group).

<a id="RG2-1-minuscule-coweight"></a>

### Minuscule coweights and the dominance order

Target `ReductiveGroupsPartII:RG2.1/minuscule-coweight`. Definition; suggested declaration `BruhatTits.IsMinuscule`.

Let Ψ = (X, Φ, Y, Φ^∨) be a root datum with a base Δ (Mathlib RootPairing over ℤ with a base). A cocharacter μ ∈ Y is dominant if ⟨a, μ⟩ ≥ 0 for all positive roots, and minuscule if ⟨a, μ⟩ ∈ {−1, 0, 1} for every root a. For dominant λ, μ write λ ≤ μ if μ − λ is a non-negative integral combination of simple coroots. ρ denotes half the sum of positive roots and ⟨2ρ, μ⟩ the associated dimension. For a geometric conjugacy class {μ} of cocharacters, μ_dom denotes its dominant representative.

**Hypotheses.** Ψ a reduced root datum with a base.

**Prerequisites.** `mathlib:RootPairing`; `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Uses.**

- ReductiveGroupsPartII:RG2.2/minuscule-toral-embedding: minuscule representations in Kisin–Pappas.
- ReductiveGroupsPartII:RG2.4/admissible-set: dominant representatives μ̄ and the order.
- GeometricSatakeAndFusion:GS0 (request): minuscule weights {−1, 0, 1} and ⟨2ρ, μ⟩.
- Zhu 2017, §0.5: coweight notation.

**API.**

- `BruhatTits.IsDominant` (other): ⟨a, μ⟩ ≥ 0 for all positive roots a.
- `BruhatTits.IsMinuscule` (other): ⟨a, μ⟩ ∈ {−1, 0, 1} for all roots a.
- `BruhatTits.dominanceLE` (relation): λ ≤ μ iff μ − λ ∈ ℕ-span of simple coroots.
- `BruhatTits.dominantRep` (data): μ_dom, the unique dominant element of the Weyl orbit.
- `BruhatTits.twoRhoPairing` (data): ⟨2ρ, μ⟩.

**Unit tests.**

- `BruhatTits.IsMinuscule.gl_n_standard` (computation): For GL_n, (1, 0, …, 0) is minuscule and ⟨2ρ, (1,0,…,0)⟩ = n − 1.
- `BruhatTits.IsMinuscule.zero` (degenerate): 0 is minuscule and dominant.
- `BruhatTits.IsMinuscule.not_double` (non-example): For GL_2, (2, 0) is dominant but not minuscule (⟨a, μ⟩ = 2).
- `BruhatTits.dominanceLE.gl2` (computation): For GL_2, (1, 1) ≤ (2, 0) since (2,0) − (1,1) = (1, −1) is the simple coroot.
- `BruhatTits.IsMinuscule.rootPairing_compat` (compatibility): The minuscule predicate agrees with the imported integral RootPairing: μ is minuscule iff every root–cocharacter pairing is −1, 0 or 1, retaining the actual cocharacter lattice.

**Construction or proof.**

1. Definitions on the Mathlib root pairing (pairings and coroots); dominance and order as in the Tau Ceti roadmap Root systems (Layer 4, chambers).
2. Each W-orbit in Y meets the dominant chamber exactly once (Root systems Layer 4), giving μ_dom.

**Acceptance.**

- For GL_n, μ = (1, …, 1, 0, …, 0) is minuscule; (2, 0, …, 0) is not.
- For SL_2, the minuscule coweights of the adjoint group PGL_2 are ±ϖ^∨_1, while SL_2 has none except 0.

**Sources.**

- [Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*](https://arxiv.org/abs/1407.8519): §0.5, p. 412. Notation for split reductive groups: coweight lattice, dominant coweights, the order λ ≤ μ by positive coroots, ρ, and ϖ^λ.
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.2 (minuscule representations), pp. 131–138. Uses minuscule (co)weights and their weight spaces being lines.

<a id="RG2-1-algebraic-fundamental-group"></a>

### The algebraic fundamental group

Target `ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`. Definition; suggested declaration `BruhatTits.AlgebraicFundamentalGroup`.

Let G be a connected reductive group over a field K, T a maximal torus of G_{K^sep} and Q^∨ ⊂ X_*(T) the coroot lattice. The algebraic fundamental group (Borovoi) is π₁(G) := X_*(T)/Q^∨, with the action of Γ_K obtained from the Galois action on the absolute root datum (anchor Layer 7); it is independent of T up to unique isomorphism (conjugation by G(K^sep) identifies the quotients and Weyl elements act trivially on X_*(T)/Q^∨). It is functorial in homomorphisms of reductive groups; π₁(T) = X_*(T) for a torus; π₁(GL_n) = ℤ via the determinant, π₁(SL_n) = 0, π₁(PGL_n) = ℤ/n; π₁(G) = 0 iff G is semisimple and simply connected; π₁(G_der) is finite and vanishes iff G_der is simply connected; a central extension 1 → Z → G̃ → G → 1 with Z a torus gives an exact sequence 0 → X_*(Z) → π₁(G̃) → π₁(G) → 0. For L = Ĕ with inertia I and Frobenius σ we use the coinvariants π₁(G)_I (with torsion), their σ-invariants (π₁(G)_I)^σ and π₁(G)_Γ. For a standard Levi M ⊂ G, ker(π₁(M) → π₁(G)) is the lattice spanned by the classes of the simple coroots of G not in M.

**Hypotheses.** G connected reductive over a field K.

**Prerequisites.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `mathlib:RootPairing`.

**Uses.**

- ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism: target of κ_G.
- ReductiveGroupsPartII:RG2.4/iwahori-weyl-exact-sequences: Ω ≅ π₁(G)_I.
- BunGAndNewtonStrata:BG1 (moved down from BG1/algebraic-fundamental-group): Kottwitz invariants of σ-conjugacy classes.
- Kisin–Pappas 2018, standing hypothesis p ∤ |π₁(G^der)|: tameness hypotheses for integral models.
- ReductiveGroupsPartII:RG2.5/dual-centre-and-fundamental-group: π₁(G) = X^*(Z(Ĝ)).

**API.**

- `BruhatTits.AlgebraicFundamentalGroup` (constructor): π₁(G) = X_*(T)/span(coroots).
- `BruhatTits.AlgebraicFundamentalGroup.galoisAction` (data): The Γ_K-action induced by the Galois action on the root datum.
- `BruhatTits.AlgebraicFundamentalGroup.map` (functoriality): A homomorphism of reductive groups (compatible tori) induces π₁(G) → π₁(G'), functorially.
- `BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants` (data): π₁(G)_I and its σ-action.
- `BruhatTits.AlgebraicFundamentalGroup.torus` (example): π₁(T) = X_*(T) for a torus.
- `BruhatTits.AlgebraicFundamentalGroup.exact_central` (relation): 0 → X_*(Z) → π₁(G̃) → π₁(G) → 0 for a central extension by a torus.
- `BruhatTits.AlgebraicFundamentalGroup.leviKernel` (relation): ker(π₁(M) → π₁(G)) is spanned by the simple coroots of G outside M.
- `BruhatTits.AlgebraicFundamentalGroup.weyl_invariant` (characterisation): Weyl group elements act trivially on X_*(T)/Q^∨ (Kaletha Lemma 4.2).

**Unit tests.**

- `BruhatTits.AlgebraicFundamentalGroup.gl_n` (computation): For GL_n with the diagonal torus, π₁ ≅ ℤ via (a_1, …, a_n) ↦ Σ a_i.
- `BruhatTits.AlgebraicFundamentalGroup.sl_n` (degenerate): For SL_n, π₁ = 0.
- `BruhatTits.AlgebraicFundamentalGroup.pgl_n` (computation): For PGL_n, π₁ ≅ ℤ/n.
- `BruhatTits.AlgebraicFundamentalGroup.not_cocharacters` (non-example): π₁(SL_2) = 0 although X_*(T) = ℤ: π₁ is not the cocharacter lattice for non-tori.
- `BruhatTits.AlgebraicFundamentalGroup.torus_compat` (compatibility): For an empty root system the Submodule quotient by the coroot span is canonically additively isomorphic to the cocharacter module itself, and its quotient map becomes the identity.

**Construction or proof.**

1. Define via the absolute root datum (Mathlib RootPairing over ℤ, AbsoluteRootData of the spine); independence of T by conjugacy of maximal tori and triviality of the Weyl action on X_*/Q^∨ (Kaletha 2016, Lemma 4.2).
2. Functoriality and exactness from the corresponding statements for cocharacter and coroot lattices (Pappas–Rapoport §2.a.2, pp. 10–11).
3. Levi kernel: the coroots of M are a subset of a base of Φ^∨ (van Hoften, proof of Prop. A.1.6).

**Acceptance.**

- π₁(GL_n) ≅ ℤ with trivial Galois action; π₁(U(n)) for the unitary group of an unramified quadratic extension is ℤ with σ acting by −1.
- π₁(G) is finite iff G is semisimple.

**Sources.**

- [Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag varieties*](https://arxiv.org/abs/math/0607130): §2.a.2, pp. 10–11. Recalls π₁(G) = P^∨/Q^∨ (Borovoi) with its inertia action and the Kottwitz homomorphism with values in π₁(G)_I.
- [Tasho Kaletha, *Rigid inner forms of real and p-adic groups*](https://arxiv.org/abs/1304.3292): Lemma 4.2 and proof, arXiv v5 pp. 16–17. For maximal tori S_1, S_2, conjugation identifies X_*(S_i)/Q^∨ independently of the conjugating element and Galois-equivariantly; homomorphisms induce compatible maps.
- [Pol van Hoften (Appendix A by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*](https://arxiv.org/abs/2010.10496): proof of Proposition A.1.6, p. 57. For a standard Levi, the kernel before coinvariants is generated by the simple coroot classes outside the Levi. After inertia coinvariants the corresponding kernel is generated by their images, by right exactness; no left exactness of coinvariants is used.

<a id="RG2-1-rational-maximal-unramified-split-torus"></a>

### A rational maximal L-split torus

Target `ReductiveGroupsPartII:RG2.1/rational-maximal-unramified-split-torus`. Theorem; suggested declaration `BruhatTits.exists_rational_maximalUnramifiedSplitTorus`.

Let G be a connected reductive group over a henselian discretely valued field K with perfect residue field (for example a local field E), with completed maximal unramified extension L and Frobenius σ. There exists a maximal L-split torus S_L of G_L which is defined over K and contains a maximal K-split torus S of G; T := Z_G(S_L) is a maximal torus of G defined over K; the apartment A(G_L, S_L) is σ-stable and contains a σ-stable alcove, and A(G, S, K) is identified with its σ-fixed points.

**Hypotheses.** K henselian, discretely valued, perfect residue field; G connected reductive over K.

**Prerequisites.** [Steinberg's theorem over the completed unramified field](#RG2-1-steinberg-quasi-split) (`ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. BT II 5.1.12 (Corollary, p. 150): a maximal K^sh-split torus defined over K and containing a maximal K-split torus exists; uses the Galois descent of the building (BT II 5.1.10–5.1.11) and the fixed-point theorem.
2. By Steinberg (RG2.1/steinberg-quasi-split) G_L is quasi-split, so Z_G(S_L) is a maximal torus.
3. σ-stable alcove: σ acts on the building of G_L with fixed points the building over K (BT II 5.1.25); a σ-stable facet of maximal dimension among σ-stable facets gives a σ-stable alcove after taking the facet of the building over L containing a generic σ-fixed point (He 2021 §2.1; Gleason–Lim–Xu §2.1).

**Acceptance.**

- For G = GL_n over E: S = S_L = the diagonal torus, T = S.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 5.1.10–5.1.13, pp. 149–150. Existence of a maximal K^sh-split torus defined over K and containing a given maximal K-split torus, and its uniqueness properties.
- [Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2001.03325): §2.1, p. 4. Fixes a maximal Ĕ-split torus defined over F containing a maximal F-split torus, T its centralizer, and a σ-stable alcove.
- [Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2208.07195): §2.1, pp. 12–14. Fixes the maximal unramified-split torus, its centralizer and the Frobenius-stable apartment and alcove; the existence theorem is BT II.

<a id="RG2-1-rational-points-root-datum"></a>

### Rational points carry a root datum

Target `ReductiveGroupsPartII:RG2.1/rational-points-root-datum`. Theorem; suggested declaration `BruhatTits.rationalPointsRootDatum`.

Let G be a connected reductive group over a field K, S a maximal K-split torus, Z = Z_G(S), N = N_G(S), Φ = Φ(G, S) the relative root system (possibly non-reduced) and U_a (a ∈ Φ) the relative root subgroups (anchor Layer 7, Borel–Tits). Then (Z(K), (U_a(K), M_a)_{a∈Φ}) with M_a = Z(K) m_a for the elements m_a ∈ N(K) of the rank-one subgroups is a root datum of type Φ in G(K), generating the subgroup G(K)^† generated by Z(K) and the U_a(K); N(K) normalizes it and N(K)/Z(K) = W_0 is the relative Weyl group.

**Hypotheses.** K a field; G connected reductive over K with maximal K-split torus S.

**Prerequisites.** [Generating root datum in an abstract group](#RG2-1-root-datum-in-a-group) (`ReductiveGroupsPartII:RG2.1/root-datum-in-a-group`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. Borel–Tits structure theory (anchor Layer 7): relative root groups, commutator relations, the rank-one elements m_a and the relative Bruhat decomposition.
2. Translate into the axioms of RG2.1/root-datum-in-a-group (BT I 6.1.3(c), pp. 108–110 and BT II 4.1.1–4.1.2 for the quasi-split description).

**Acceptance.**

- For G = GL_n over K: the diagonal torus and the root groups U_{ij} = 1 + K e_{ij} form a root datum of type A_{n−1} generating SL_n(K)·T(K).

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 6.1.3, pp. 108–110. Examples of root data, including the root datum of the rational points of a reductive group relative to a maximal split torus (Borel–Tits).
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.1.1–4.1.3, pp. 77–78. Recalls the relative root system, root subgroups and the quasi-split situation.

<a id="RG2-1-valuation-of-root-datum"></a>

### Valuation of a root datum

Target `ReductiveGroupsPartII:RG2.1/valuation-of-root-datum`. Definition; suggested declaration `BruhatTits.Valuation`.

A valuation of the root datum (T, (U_a, M_a)) is a family φ = (φ_a)_{a∈Φ} of maps φ_a : U_a → ℝ ∪ {∞} such that: (V0) each φ_a takes at least three values; (V1) for every a and k ∈ ℝ ∪ {∞} the set U_{a,k} := φ_a^{-1}([k, ∞]) is a subgroup, and U_{a,∞} = {1}; (V2) for m ∈ M_a the function u ↦ φ_{−a}(u) − φ_a(m u m^{-1}) is constant on U_{−a} ∖ {1}; (V3) for a, b that are not negatively proportional and k, l ∈ ℝ the commutator [U_{a,k}, U_{b,l}] lies in the group generated by the U_{pa+qb, pk+ql} (p, q ≥ 1, pa + qb ∈ Φ); (V4) if 2a ∈ Φ then φ_{2a} is the restriction of 2φ_a to U_{2a}; (V5) if u ∈ U_a ∖ {1} and u', u'' ∈ U_{−a} with u' u u'' ∈ M_a, then φ_{−a}(u') = −φ_a(u). For a reductive group over a field K with a nontrivial discrete valuation ω, a valuation is compatible with ω when, for z ∈ Z(K) and u ∈ U_a(K), φ_a(z u z^{-1}) = φ_a(u) + ω(a(z)) (Bruhat–Tits II 4.2.7–4.2.8; for a non-split Z with the extended character values).

**Hypotheses.** (T, (U_a, M_a)) a root datum of type Φ in a group G.

**Prerequisites.** [Generating root datum in an abstract group](#RG2-1-root-datum-in-a-group) (`ReductiveGroupsPartII:RG2.1/root-datum-in-a-group`).

**Uses.**

- ReductiveGroupsPartII:RG2.1/apartment: the apartment is the space of valuations equipollent to a given one.
- ReductiveGroupsPartII:RG2.2/building: filtrations U_{a,x} define the stabilizers P_x used to glue.
- BunGAndNewtonStrata:BG1 (via RG2.1): valued relative root data and comparisons.
- Bruhat–Tits I §§6–7: the central notion of the abstract theory.

**API.**

- `BruhatTits.Valuation` (constructor): The structure φ = (φ_a) satisfying V0–V5.
- `BruhatTits.Valuation.filtration` (data): The filtration subgroups U_{a,k} = φ_a^{-1}[k, ∞].
- `BruhatTits.Valuation.filtration_antitone` (relation): k ≤ l implies U_{a,l} ⊂ U_{a,k}.
- `BruhatTits.Valuation.valueSet` (data): Γ_a = φ_a(U_a ∖ {1}) ⊂ ℝ.
- `BruhatTits.Valuation.shift` (constructor): For v ∈ V, the equipollent valuation φ + v, (φ + v)_a = φ_a + a(v).
- `BruhatTits.Valuation.smul` (constructor): For n ∈ N, the transported valuation n·φ, (n·φ)_a(u) = φ_{w^{-1}a}(n^{-1} u n).
- `BruhatTits.Valuation.IsCompatible` (other): Compatibility with the valuation of the base field (z ∈ Z(K) shifts φ_a by +ω(a(z))).
- `BruhatTits.Valuation.IsDiscrete` (other): Each Γ_a is discrete in ℝ.

**Unit tests.**

- `BruhatTits.Valuation.sl2_standard` (computation): For SL_2(K) with x_+(u) = (1 u; 0 1), φ_+(x_+(u)) = ω(u) and φ_−(x_−(u)) = ω(u) define a valuation; V5 holds since x_−(−u^{-1}) x_+(u) x_−(−u^{-1}) ∈ M_a.
- `BruhatTits.Valuation.shift_zero` (degenerate): φ + 0 = φ.
- `BruhatTits.Valuation.not_valuation_wrong_sign` (non-example): For SL_2, φ_+(x_+(u)) = ω(u), φ_−(x_−(u)) = −ω(u) violates V5; it is not a valuation.
- `BruhatTits.Valuation.compatible_gl_n` (compatibility): For GL_n with root groups U_{ij}, φ_{ij}(1 + c e_{ij}) = ω(c) is compatible with ω: diag(t)·(1 + c e_{ij})·diag(t)^{-1} = 1 + t_i t_j^{-1} c e_{ij}.

**Construction or proof.**

1. Define the structure with the axioms V0–V5 as in BT I 6.2.1 (pp. 116–117).
2. Derived notions (BT I 6.2.2–6.2.4): Γ_a = φ_a(U_a ∖ {1}), Γ'_a = values at elements u with φ_a(u) = sup φ_a(u U_{2a}), discreteness, the filtration subgroups U_{a,k}.

**Acceptance.**

- For SL_2(K), φ_±(x_±(u)) = ω(u) is a valuation; Γ_a = ℤ.
- Rescaling φ by a positive constant λ gives an equivalent (not equipollent) valuation.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): Definition 6.2.1 and 6.2.2–6.2.4, pp. 116–120. Axioms V0–V5 of a valuation of a root datum and the first derived sets Γ_a, Γ'_a and filtrations.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.2.7–4.2.9, p. 91. Valuations compatible with the valuation of the field and their uniqueness up to equipollence.
- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §1.1, p. 6. The local reductive apartment data chosen from a maximal split torus, used throughout.

Atlas planet: **Valued root datum**.

<a id="RG2-1-z-extension"></a>

### z-extensions

Target `ReductiveGroupsPartII:RG2.1/z-extension`. Definition; suggested declaration `ZExtension.IsZExtension`.

Let G be a connected reductive group over a field K. A z-extension of G is a surjective homomorphism G̃ → G of connected reductive K-groups whose kernel Z is central and an induced torus (a finite product of Weil restrictions Res_{K_i/K} G_m along finite separable K_i/K) and such that the derived group of G̃ is simply connected.

**Hypotheses.** G connected reductive over a field K.

**Prerequisites.** [Character lattices of Weil-restricted tori](#RG2-0a-weil-restriction-character-lattices) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-character-lattices`); [The algebraic fundamental group](#RG2-1-algebraic-fundamental-group) (`ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

**Uses.**

- ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism: reduction of κ_G to the case of simply connected derived group.
- BunGAndNewtonStrata:BG1 and BG2 (requests for an RG2.6 owner): bounded lifting through z-extensions, central torus bundles.
- ExcursionOperatorsAndSpectralAction:ES5/ES6 (requests): z-extensions and dual maps.
- ReductiveGroupsPartII:RG2.5/dual-isogenies-and-products: the dual of a z-extension.

**API.**

- `ZExtension.IsZExtension` (other): The predicate on a homomorphism G̃ → G.
- `ZExtension.IsInducedTorus` (other): A torus is induced if its character module is a permutation Galois module.
- `ZExtension.surjective_points` (characterisation): For a z-extension and any field extension K'/K, G̃(K') → G(K') is surjective.
- `ZExtension.fundamentalGroup_torsionFree` (other): π₁(G̃) is torsion-free.
- `ZExtension.comp_isZExtension_of_iso` (functoriality): Composing a z-extension with an isomorphism is a z-extension.

**Unit tests.**

- `ZExtension.gl2_pgl2` (computation): GL_2 → PGL_2 is a z-extension with kernel the scalar G_m.
- `ZExtension.id_of_simplyConnected` (degenerate): If G_der is simply connected, the identity of G is a z-extension.
- `ZExtension.sl2_pgl2_not` (non-example): SL_2 → PGL_2 is not a z-extension: its kernel μ_2 is not a torus.
- `ZExtension.inducedTorus_compat` (compatibility): Res_{K'/K} G_m is an induced torus: its character module ℤ[Hom(K', K^sep)] is a permutation module (RG2.0a character lattices).

**Construction or proof.**

1. Definition with three conditions: central kernel, induced-torus kernel (RG2.0a/weil-restriction-character-lattices: permutation character module), simply connected derived group (anchor Layer 6 simply connected property).
2. Basic consequences: G̃(K') → G(K') surjective for all fields K' ⊃ K (Hilbert 90 for induced tori), and π₁(G̃) is torsion-free (Pappas–Rapoport §2.a.2 Step 4).

**Acceptance.**

- GL_n → GL_n is a z-extension (kernel trivial, derived group SL_n simply connected).
- GL_2 → PGL_2 is a z-extension with kernel G_m.

**Sources.**

- [Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag varieties*](https://arxiv.org/abs/math/0607130): §2.a.2, Step 4, p. 11. Uses a z-extension (central extension with simply connected derived group and induced torus kernel, Milne–Shih Prop. 3.1) to construct the Kottwitz homomorphism.

<a id="RG2-1-torus-valuation-map"></a>

### The valuation homomorphism of the minimal Levi

Target `ReductiveGroupsPartII:RG2.1/torus-valuation-map`. Construction; suggested declaration `BruhatTits.torusValuationMap`.

Let K be as in RG2.1 (henselian, discretely valued) and Z = Z_G(S) for a maximal K-split torus S, V = X_*(S) ⊗ ℝ. The restriction X^*_K(Z) → X^*(S) is injective with finite cokernel; define v : Z(K) → V by ⟨χ, v(z)⟩ = −ω(χ(z)) for χ ∈ X^*_K(Z) (extended ℝ-linearly through the finite-index inclusion). v is a homomorphism; its kernel Z(K)^1 is the unique maximal bounded subgroup of Z(K) (compact when K is a local field), and its image Λ is a lattice of full rank in V, so Z(K)/Z(K)^1 ≅ Λ ≅ ℤ^{dim S}. N(K) normalizes Z(K)^1, and n ∈ N(K) transports v by its image in W_0.

**Hypotheses.** K henselian discretely valued; G connected reductive, S maximal K-split torus, Z = Z_G(S).

**Prerequisites.** [Rational points carry a root datum](#RG2-1-rational-points-root-datum) (`ReductiveGroupsPartII:RG2.1/rational-points-root-datum`); `mathlib:Valuation`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Uses.**

- ReductiveGroupsPartII:RG2.1/apartment: z ∈ Z(K) acts on the apartment by translation by v(z).
- ReductiveGroupsPartII:RG2.4/iwahori-weyl-group: Z(K)/Z(K)_0 ⊃ Z(K)^1/Z(K)_0 finite and Z(K)/Z(K)^1 ≅ Λ.
- AdelicAlgebraicGroups:AA.3 (request to RG2.4): compactness of M(E) modulo A(E)·M(E)^1.
- He 2018, A8–A9: the translation lattice of the actual minimal Levi.

**API.**

- `BruhatTits.torusValuationMap` (constructor): The homomorphism v : Z(K) → V with ⟨χ, v(z)⟩ = −ω(χ(z)).
- `BruhatTits.torusValuationMap_apply_character` (characterisation): For χ ∈ X^*_K(Z): ⟨χ, v(z)⟩ = −ω(χ(z)).
- `BruhatTits.boundedPart` (data): Z(K)^1 := ker v, the maximal bounded subgroup.
- `BruhatTits.boundedPart_isCompact` (other): For K a local field, Z(K)^1 is compact open in Z(K).
- `BruhatTits.translationLattice` (data): Λ = image of v, a full lattice in V.
- `BruhatTits.torusValuationMap_conj` (relation): v(n z n^{-1}) = w(n)·v(z) for n ∈ N(K) with image w(n) ∈ W_0.

**Unit tests.**

- `BruhatTits.torusValuationMap_split` (computation): For S = G_m^2 and t = (ϖ, 1), v(t) = (−1, 0).
- `BruhatTits.torusValuationMap_anisotropic` (degenerate): If S = 1 then V = 0, v = 0 and Z(K)^1 = Z(K).
- `BruhatTits.torusValuationMap_gl_n_compat` (compatibility): For G = GL_n and Z the diagonal torus, v(diag(t_1, …, t_n)) = −(ω(t_i))_i, and ker v = diagonal matrices with unit entries = Z ∩ GL_n(O).
- `BruhatTits.torusValuationMap_not_injective_on_units` (non-example): v is not injective: every unit of O gives v = 0, so v cannot be used as a faithful coordinate on Z(K).

**Construction or proof.**

1. Restriction X^*_K(Z) → X^*(S) is injective with finite cokernel, because Z is the almost-direct product of S with an anisotropic group that has no nontrivial rational characters (anchor Layer 7, Borel–Tits).
2. For a local field, the minimal Levi is anisotropic modulo its maximal split central torus, and is compact modulo that split torus. Character valuations identify its maximal bounded subgroup with ker ν. BT II §4.2.19, pp. 96–97 proves the compatible boundedness statement for the torus coordinates; Richarz §1.1, arXiv p. 2 gives the maximal-compact formulation.
3. Image: v(S(K)) = X_*(S) (up to the sign convention) already has full rank; Λ ⊃ X_*(S) with finite index.

**Acceptance.**

- For the split torus S = G_m^r: v(t) = −(ω(t_1), …, ω(t_r)) ∈ ℝ^r, Λ = ℤ^r, S(K)^1 = (O^×)^r.
- For an anisotropic torus (S = 1): V = 0 and Z(K)^1 = Z(K).

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.2.5–4.2.7, pp. 90–91; 5.1.22, p. 154. The homomorphism ν from the centralizer of the maximal split torus to the vector space V defined by the valuations of rational characters, and its use for the apartment action.
- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §1.1, p. 6 (A8–A9 of the extraction, citing Tits 1979 §§1.2–1.3 and Richarz §1.1, p. 118). Uses the translation lattice ν(Z(F)). The finite kernel discussed there is the kernel of the Iwahori–Weyl group’s affine action, rather than the bounded, generally infinite kernel in N(F).
- [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635): §1.1, p. 118 (arXiv p. 2). Identifies the kernel of v as the maximal compact subgroup of Z(F) containing the parahoric of Z with finite index.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §4.2.19, pp. 96–97. The torus character-valuation criterion identifies bounded subsets and supplies the bounded-kernel argument used here.

<a id="RG2-1-quasi-split-root-group-coordinates"></a>

### Root-group coordinates in quasi-split groups

Target `ReductiveGroupsPartII:RG2.1/quasi-split-root-group-coordinates`. Construction; suggested declaration `BruhatTits.QuasiSplit.rootGroupCoord`.

Let G be quasi-split over K, S a maximal K-split torus, T = Z_G(S) (a maximal torus), and fix a Chevalley–Steinberg system (a K^sep-pinning compatible with Galois). For a ∈ Φ(G, S) let K_a be the field of definition of an absolute root restricting to a. (Case I, a not multipliable, 2a ∉ Φ) U_a ≅ Res_{K_a/K} G_a and x_a : K_a → U_a(K) is an isomorphism. (Case II, a multipliable) there is a separable quadratic extension K_a/K_{2a} and U_a ≅ Res_{K_{2a}/K} U_0 where U_0 is the unipotent radical of a Borel of SU_3(K_a/K_{2a}); its points are H_0(K_a, K_{2a}) = {(u, v) ∈ K_a² : v + v̄ = u ū}, with group law (u,v)(u',v') = (u + u', v + v' + ū u'), and x_a : H_0 → U_a(K) with x_a(0, v) ∈ U_{2a}. Rank-one subgroups: Res_{K_a/K} SL_2 (case I) or Res_{K_{2a}/K} SU_3 (case II); van Hoften's unitary coordinates u_i(c, d) = I + g with g_{−i,0} = −τ(c), g_{0,i} = c, g_{−i,i} = d, in SU_3 iff τ(c)c + d + τ(d) = 0. Change of Chevalley–Steinberg system changes x_a by multiplication with elements of K_a^× (resp. explicit transformations of H_0).

**Hypotheses.** G quasi-split over K; a Chevalley–Steinberg system fixed.

**Prerequisites.** [Rational points carry a root datum](#RG2-1-rational-points-root-datum) (`ReductiveGroupsPartII:RG2.1/rational-points-root-datum`); [Weil restriction of an affine group scheme](#RG2-0a-weil-restriction-group-scheme) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-group-scheme`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Uses.**

- ReductiveGroupsPartII:RG2.1/quasi-split-valuation: the valuation is defined through these coordinates.
- ReductiveGroupsPartII:RG2.1/unitary-rank-one-example: the SU_3 example.
- van Hoften 2024, App. A.3: rank-one subgroups for relative roots.
- ReductiveGroupsPartII:RG2.3/bruhat-tits-group-scheme: the schemes 𝔘_{a,k} are built from these coordinates.

**API.**

- `BruhatTits.QuasiSplit.rootGroupCoord` (constructor): x_a : K_a → U_a(K) (case I) or H_0(K_a, K_{2a}) → U_a(K) (case II), a group isomorphism.
- `BruhatTits.QuasiSplit.H0` (data): The group H_0(K', K) = {(u, v) : v + v̄ = u ū} with (u,v)(u',v') = (u+u', v+v'+ū u').
- `BruhatTits.QuasiSplit.rootField` (data): The field K_a (and K_{2a} in case II).
- `BruhatTits.QuasiSplit.rootGroupCoord_conj_torus` (relation): t x_a(u) t^{-1} = x_a(ã(t) u) for t ∈ T(K), with ã the absolute root (and the analogous formula in case II).
- `BruhatTits.QuasiSplit.rankOneSubgroup` (data): The rank-one subgroup generated by U_{±a}: Res SL_2 or Res SU_3.
- `BruhatTits.QuasiSplit.unitaryCoord` (example): van Hoften's u_i(c, d) = I + g with g_{−i,0} = −τ(c), g_{0,i} = c, g_{−i,i} = d.
- `BruhatTits.QuasiSplit.unitaryCoord_mem_iff` (characterisation): u_i(c, d) preserves the antidiagonal hermitian form iff τ(c)c + d + τ(d) = 0.

**Unit tests.**

- `BruhatTits.QuasiSplit.H0_mul_assoc` (computation): The law on H_0 is associative and (u,v)^{-1} = (−u, v̄) (check: v + v̄ = u ū implies the inverse satisfies the defining equation).
- `BruhatTits.QuasiSplit.split_case` (degenerate): If G is split, every K_a = K and every root is non-multipliable: x_a is the pinning of the split group.
- `BruhatTits.QuasiSplit.gl_n_compat` (compatibility): For GL_n, x_{e_i − e_j}(c) = 1 + c e_{ij} agrees with Tau Ceti GeneralLinear.rootSubgroupPoints.
- `BruhatTits.QuasiSplit.not_additive_multipliable` (non-example): For H₀, two valid points (u,v),(u′,v′) with v+v̄=uū and v′+v̄′=u′ū′ have commutator (0,ūu′−ū′u). Choose u,u′ for which this is nonzero: the multipliable root group is nonabelian and cannot be identified with the additive field.

**Construction or proof.**

1. Galois descent of the pinned root groups of G_{K^sep}: the orbit of an absolute root restricting to a determines K_a, and the root group is the Weil restriction (BT II 4.1.3–4.1.8, pp. 78–81).
2. Case II: the absolute roots restricting to a and 2a span a subsystem of type A_2 with a nontrivial Galois action, giving SU_3 (BT II 4.1.9–4.1.12, pp. 81–84).
3. Effect of choices (BT II 4.1.13, p. 84); van Hoften's coordinates are a matrix realization of H_0 (van Hoften App. A.3.6, pp. 60–61).

**Acceptance.**

- For SU_3 attached to an unramified quadratic K'/K: U_a(K) = H_0(K', K), U_{2a}(K) = {(0, v) : v + v̄ = 0} ≅ K'^{tr=0}.
- For Res_{K'/K} SL_2: Φ = {±a}, K_a = K', U_a(K) = K'.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.1.1–4.1.13, pp. 77–84. Structure of the root subgroups of a quasi-split group: Weil restrictions of the additive group in the non-multipliable case and of the SU_3 unipotent group H_0 in the multipliable case, with explicit coordinates and the effect of choices.
- [Pol van Hoften (Appendix A by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*](https://arxiv.org/abs/2010.10496): Appendix A.3.5–A.3.6, pp. 60–61. Chooses the short relative root above an échelonnage root; its rank-one subgroup is a restriction of scalars of SL_2 or SU_3, with explicit unitary coordinates.

<a id="RG2-1-z-extension-existence"></a>

### Existence of z-extensions

Target `ReductiveGroupsPartII:RG2.1/z-extension-existence`. Theorem; suggested declaration `ZExtension.exists_zExtension`.

Every connected reductive group G over a field K has a z-extension 1 → Z → G̃ → G → 1, which can be chosen split by any finite Galois extension K'/K splitting G. For any z-extension: (1) G̃(K') → G(K') is surjective for every field K' ⊃ K, by Hilbert 90 and Shapiro's lemma for the induced torus Z; (2) 0 → X_*(Z) → π₁(G̃) → π₁(G) → 0 is exact and Γ_K-equivariant; (3) π₁(G̃) is torsion-free; (4) every torus T over K is a quotient of an induced torus split by the splitting field of T.

**Hypotheses.** G connected reductive over a field K; K'/K a finite Galois splitting field of G.

**Prerequisites.** [z-extensions](#RG2-1-z-extension) (`ReductiveGroupsPartII:RG2.1/z-extension`); `mathlib:groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

**Construction or proof.**

1. Let G_sc → G_der be the simply connected cover with finite central kernel μ (anchor Layer 6). Embed the centre of G (a group of multiplicative type split by K') into an induced torus Z split by K' (character module a permutation module surjecting onto X^*(Z(G))), and form G̃ as the pushout of G_sc × Z(G) → G along the central subgroup ker(G_sc × Z(G) → G) ↪ G_sc × Z, the standard construction (Milne–Shih Prop. 3.1, as cited by Pappas–Rapoport §2.a.2).
2. (1) H^1(K', Z) = ∏ H^1(K'_i, G_m) = 0 by Shapiro and Hilbert 90 (Mathlib groupCohomology Hilbert 90).
3. (2)–(3) follow from the definition of π₁ via cocharacters of compatible maximal tori; (4) permutation modules surject onto any finitely generated Galois lattice split by K'.

**Acceptance.**

- For G = PGL_n: GL_n → PGL_n.
- For G = SO_3 = PGL_2 in characteristic ≠ 2: GL_2 → PGL_2.

**Sources.**

- [Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag varieties*](https://arxiv.org/abs/math/0607130): §2.a.2, Steps 2 and 4, p. 11. Resolutions of tori by induced tori and existence of z-extensions (citing Milne–Shih Prop. 3.1) used in the construction of the Kottwitz homomorphism.

<a id="RG2-1-apartment"></a>

### The apartment of a valued root datum

Target `ReductiveGroupsPartII:RG2.1/apartment`. Construction; suggested declaration `BruhatTits.Apartment`.

Let φ be a valuation of a generating root datum of type Φ. Put Vred = V/∩_{a∈Φ} ker(a). The valuations equipollent to φ form an affine space under Vred, with (φ+v)_a(u)=φ_a(u)+a(v); they do not retain the central direction. For a connected reductive K-group and maximal K-split torus S, the enlarged apartment Aᵉ(G,S,K) is an affine space under X_*(S)⊗ℝ whose projection to the reduced apartment has kernel VZ = X_*(A_G)⊗ℝ. A choice of compatible origin identifies it with Vred×VZ. The normalizer acts affinely with the relative Weyl linear part, and z∈Z_G(S)(K) translates by the character-valuation vector ν(z). At x, U_{a,x,r} consists of u with φ_a(u)+a(x−x₀)≥r; this expression is independent of the chosen presentation of x.

**Hypotheses.** φ a valuation of a root datum of type Φ in G (compatible with ω for the reductive-group statements).

**Prerequisites.** [Valuation of a root datum](#RG2-1-valuation-of-root-datum) (`ReductiveGroupsPartII:RG2.1/valuation-of-root-datum`); [The valuation homomorphism of the minimal Levi](#RG2-1-torus-valuation-map) (`ReductiveGroupsPartII:RG2.1/torus-valuation-map`).

**Uses.**

- ReductiveGroupsPartII:RG2.2/building: the building is glued from translates of the apartment.
- ReductiveGroupsPartII:RG2.1/affine-chamber-structure: walls, alcoves and facets live in A.
- He 2021, §2.1; He 2018, §1.1: the apartment with σ-stable alcove.
- Kisin–Zhou 2025, §2.1.2: the apartment based at a special vertex with its Frobenius action.

**API.**

- `BruhatTits.Apartment` (constructor): The enlarged apartment; its reduced projection is the orbit of equipollent valuations and it retains the split central direction.
- `BruhatTits.Apartment.instAddTorsor` (instance): The enlarged apartment is an AddTorsor under X_*(S)⊗ℝ; the valuation orbit is a torsor only under Vred.
- `BruhatTits.Apartment.vadd_def` (simp): (v +ᵥ ψ)_a = ψ_a + a(v).
- `BruhatTits.Apartment.action` (data): ν : N → Aff(A) (affine equivalences), a group homomorphism.
- `BruhatTits.Apartment.action_linear` (characterisation): The linear part of ν(n) is the action of the image of n in W(Φ) on V.
- `BruhatTits.Apartment.action_torus` (simp): For z ∈ Z(K), ν(z) is translation by v(z) (compatible valuations).
- `BruhatTits.Apartment.filtrationAt` (data): U_{a,x,r} for x ∈ A, a ∈ Φ, r ∈ ℝ.

**Unit tests.**

- `BruhatTits.Apartment.sl2_reflection` (computation): For SL_2 the Weyl element acts on A ≅ ℝ by the reflection fixing the base valuation.
- `BruhatTits.Apartment.rankZero_singleton` (degenerate): If Φ is empty and V = 0 then A is a single point.
- `BruhatTits.Apartment.addTorsor_compat` (compatibility): The AddTorsor structure is Mathlib's: vsub of two equipollent valuations is the unique v with ψ = φ + v (when Φ spans V*).
- `BruhatTits.Apartment.not_linear_space` (non-example): A has no canonical origin: different Chevalley–Steinberg pinnings give different base points, so A must not be identified with V without a choice of special point.
- `BruhatTits.Apartment.splitTorus_central` (non-example): For G=G_m the enlarged apartment is an affine line although its root system is empty and its reduced apartment is a point.

**Construction or proof.**

1. BT I 6.2.5–6.2.6 gives the affine space of equipollent valuations when roots span the dual. For a reductive group first take the quotient by the common kernel of roots, then adjoin the split central vector space (Tits §2.1, p. 44; Prasad 2017, introduction, p. 2).
2. N acts by transport of structure, and the formula n·(φ + v) = n·φ + w(n)v gives an affine action (BT I 6.2.5 (1), 6.2.10, pp. 120–123).
3. For reductive groups: compatibility with ω identifies the translation part of z ∈ Z(K) with v(z) (BT II 4.2.7–4.2.9, p. 91; He 2021 §2.1 for the apartment over Ĕ identified with X_*(T)_{Γ_0} ⊗ ℝ).

**Acceptance.**

- For SL_2(K), identify A with ℝ so that the coroot a^∨ is 1 (then a(x) = 2x and the walls are the points of ½ℤ): diag(t, t^{-1}) acts by translation by −ω(t), and (0 1; −1 0) acts by x ↦ −x.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 6.2.5–6.2.6 and 6.2.10, pp. 120–123. Equipollence of valuations, the apartment A as the affine space of valuations equipollent to φ, its affine roots and walls, and the action ν of N on A.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.2.3 and 4.2.9, pp. 89–91. The apartment of the quasi-split group and the identification of compatible valuations with points of the apartment.
- [Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2001.03325): §2.1, p. 4. The apartment of G over Ĕ attached to S, non-canonically isomorphic to X_*(T)_{Γ_0} ⊗ ℝ, with its Frobenius action.

Atlas planet: **Apartment**.

<a id="RG2-1-quasi-split-valuation"></a>

### The valuation of a quasi-split group

Target `ReductiveGroupsPartII:RG2.1/quasi-split-valuation`. Theorem; suggested declaration `BruhatTits.QuasiSplit.valuation`.

Let G be quasi-split over a henselian discretely valued K, with a Chevalley–Steinberg system and coordinates x_a. Let ω_a denote the unique extension of ω to K_a (normalized so that ω_a|_K = ω). Define φ_a(x_a(u)) = ω_a(u) in case I and φ_a(x_a(u, v)) = ½ ω_a(v) in case II (and φ_{2a}(x_a(0, v)) = ω_a(v)). Then φ = (φ_a) is a valuation of the root datum (T(K), (U_a(K))) compatible with ω; its value sets are Γ_a = ω_a(K_a^×) in case I and the explicit sets of BT II 4.2.21 in case II; changing the Chevalley–Steinberg system replaces φ by an equipollent valuation.

**Hypotheses.** G quasi-split over K henselian discretely valued; Chevalley–Steinberg system fixed.

**Prerequisites.** [Root-group coordinates in quasi-split groups](#RG2-1-quasi-split-root-group-coordinates) (`ReductiveGroupsPartII:RG2.1/quasi-split-root-group-coordinates`); [Valuation of a root datum](#RG2-1-valuation-of-root-datum) (`ReductiveGroupsPartII:RG2.1/valuation-of-root-datum`).

**Construction or proof.**

1. Verify V0–V5 using the commutation relations of the pinned split group over K^sep and descent (BT II 4.2.2–4.2.3, pp. 88–89).
2. Compatibility with ω: t ∈ T(K) acts on x_a(u) by the absolute root, whose valuation is ω of a rational character (BT II 4.2.7, p. 91).
3. Value sets: BT II 4.2.20–4.2.23 (pp. 97–99).

**Acceptance.**

- For GL_n: φ_{ij}(1 + c e_{ij}) = ω(c).

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.2.2–4.2.10, pp. 88–92. Construction of the valuation of the root datum of a quasi-split group from a Chevalley–Steinberg system, its compatibility with ω, and its independence up to equipollence.

<a id="RG2-1-kottwitz-homomorphism-torus"></a>

### The Kottwitz homomorphism of a torus

Target `ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism-torus`. Construction; suggested declaration `KottwitzMap.torus`.

Let L be a henselian discretely valued field with algebraically closed residue field (e.g. Ĕ), I = Gal(L^sep/L), and T a torus over L. There is a unique family of homomorphisms κ_T : T(L) → X_*(T)_I, functorial in T, such that κ_{G_m}(x) = ω(x) ∈ ℤ = X_*(G_m) (so κ(ϖ) = 1); for an induced torus Res_{L'/L} G_m, κ is the valuation of L' (normalized on L') onto ℤ = X_*(Res)_I; in general κ_T is defined through a resolution R → S → T → 1 by induced tori. κ_T is surjective; its kernel T(L)_0 is the group of O_L-points of the connected Néron model (RG2.3/neron-finite-type-and-connected-models), contained in the maximal bounded subgroup T(L)^1 with T(L)^1/T(L)_0 ≅ (X_*(T)_I)_tors. For T defined over E and L = Ĕ, κ_T is σ-equivariant and restricts to a surjection T(E) → (X_*(T)_I)^σ with kernel T(E)_0 := T(E) ∩ T(L)_0. Sign convention: Bruhat–Tits' v satisfies ⟨χ, v(t)⟩ = −ω(χ(t)), so v and κ differ by sign on split tori.

**Hypotheses.** L henselian discretely valued, algebraically closed residue field; T a torus over L (for the rational statements: T over E, L = Ĕ).

**Prerequisites.** [Existence of z-extensions](#RG2-1-z-extension-existence) (`ReductiveGroupsPartII:RG2.1/z-extension-existence`); [The completed maximal unramified extension Ĕ](#RG2-0-completed-maximal-unramified-extension) (`ReductiveGroupsPartII:RG2.0/completed-maximal-unramified-extension`); [The algebraic fundamental group](#RG2-1-algebraic-fundamental-group) (`ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`).

**Uses.**

- ReductiveGroupsPartII:RG2.4/iwahori-weyl-group: Z(L)_0 = T(L)_0 = ker κ_T defines W̃ = N(L)/T(L)_0.
- ReductiveGroupsPartII:RG2.3/neron-finite-type-and-connected-models: comparison with the connected Néron model.
- Kisin–Pappas 2018, proofs of Lemmas 4.3.2 and 4.3.5: T°(O_F) = ker κ_T for tori.
- BunGAndNewtonStrata:BG1 (torus-norm-description): B(T) ≅ X_*(T)_Γ.

**API.**

- `KottwitzMap.torus` (constructor): κ_T : T(L) →* X_*(T)_I.
- `KottwitzMap.torus_surjective` (other): κ_T is surjective.
- `KottwitzMap.torus_multiplicative` (simp): For G_m, κ = ω (κ(ϖ) = 1).
- `KottwitzMap.torus_natural` (functoriality): κ commutes with homomorphisms of tori.
- `KottwitzMap.torus_ker` (characterisation): ker κ_T is bounded, and every bounded subgroup maps into the torsion of X_*(T)_I; hence ker κ_T = T(L)_0 has finite index (the torsion order) in the maximal bounded subgroup T(L)^1.
- `KottwitzMap.IsBoundedPoints` (other): Bounded sets of L-points: every coordinate function has bounded valuation on the set.

**Unit tests.**

- `KottwitzMap.torus_gm` (compatibility): For G_m, identify inertia coinvariants with ℤ by the standard cocharacter and points with K^×. Then κ_T equals the pinned Tau Ceti normalized valuation, in particular κ_T(ϖ^n u)=n for an integral unit u.
- `KottwitzMap.torus_trivial` (degenerate): For the trivial torus κ is the zero map to 0.
- `KottwitzMap.torus_ramified_normOne` (computation): For T = R^1_{L'/L} G_m with L'/L ramified quadratic, X_*(T)_I = ℤ/2 and κ_T is onto ℤ/2.
- `KottwitzMap.torus_not_valuation_of_norm` (non-example): For T = Res_{L'/L} G_m with L'/L totally ramified of degree e, κ_T(x) is the normalized valuation of L' (ϖ_{L'} ↦ 1), so κ_T(ϖ_L) = e; the map x ↦ ω_L(Nm x) also equals ω_{L'}(x), but the map x ↦ ω_L(x) defined only on L^× ⊂ L'^× would miss the elements of valuation not divisible by e.

**Construction or proof.**

1. Induced tori: T(L) = L'^× for Res_{L'/L} G_m and κ = ω_{L'} (Pappas–Rapoport §2.a.2, Step 1, p. 10).
2. General tori: choose induced tori R → S → T → 1 (RG2.1/z-extension-existence (4)), giving π₁(R)_I → π₁(S)_I → π₁(T)_I → 1 exact; define κ_T on T(L) = S(L)/R(L) (surjective by Hilbert 90 over L, cd ≤ 1) (Pappas–Rapoport, Step 2, p. 11; Kottwitz 1997 §7.2).
3. Kernel and torsion: Haines–Rapoport, proof of Proposition 3 (a) and Lemma 5 (p. 2), citing Rapoport's guide for T(L)_1 = T°(O_L).
4. Rational points: σ-equivariance by functoriality; surjectivity onto σ-invariants by Lang's theorem for the connected Néron model (RG2.3/smooth-model-torsors).

**Acceptance.**

- For T = G_m: κ(x) = ω(x), kernel O_L^×.
- For the norm-one torus of a ramified quadratic extension: X_*(T)_I = ℤ/2, κ_T(T(L)) = ℤ/2 and T(L)_0 has index 2 in T(L) = T(L)^1.

**Sources.**

- [Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag varieties*](https://arxiv.org/abs/math/0607130): §2.a.2, Steps 1–2, pp. 10–11. Construction of the Kottwitz homomorphism for G_m, induced tori and general tori via resolutions by induced tori; surjectivity.
- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Proposition 3 proof (a), Lemma 5, pp. 2–3. For a torus, T(L)_1 = ker κ_T is the unique Iwahori subgroup and equals the O_L-points of the identity component of the lft Néron model.

<a id="RG2-1-affine-roots-and-filtrations"></a>

### Affine roots and root-group filtrations

Target `ReductiveGroupsPartII:RG2.1/affine-roots-and-filtrations`. Construction; suggested declaration `BruhatTits.AffineRoot`.

For a valuation φ with apartment A: the value set Γ_a = φ_a(U_a ∖ {1}) and Γ'_a = {φ_a(u) : u ∈ U_a ∖ {1}, φ_a(u) = sup φ_a(u U_{2a})}; the affine roots are the affine functions α = a + k on A (x ↦ a(x − φ) + k) with a ∈ Φ and k ∈ Γ'_a, their half-apartments {α ≥ 0} and walls {α = 0}; the root subgroup of α is U_α = U_{a,k} = φ_a^{-1}([k, ∞]), and for x ∈ A and r ∈ ℝ, U_{a,x,r} = U_{a, r − a(x−φ)}; U_{a,k+} := ⋃_{l>k} U_{a,l}. In the reductive case the value sets are the actual ones: for non-multipliable a, Γ_a = Γ'_a is a coset of a discrete subgroup determined by the ramification of the splitting field K_a of a (e.g. (1/e_a)ℤ under ω normalized on K); for multipliable a, Γ_a and Γ_{2a} are computed from the SU_3 coordinates, and Γ'_a ⊊ Γ_a can occur (ramified case). Consecutive quotients U_{a,x,r}/U_{a,x,r+} (modulo U_{2a}) are κ-vector spaces.

**Hypotheses.** φ a valuation (discrete in the reductive case).

**Prerequisites.** [The apartment of a valued root datum](#RG2-1-apartment) (`ReductiveGroupsPartII:RG2.1/apartment`); [The valuation of a quasi-split group](#RG2-1-quasi-split-valuation) (`ReductiveGroupsPartII:RG2.1/quasi-split-valuation`).

**Uses.**

- ReductiveGroupsPartII:RG2.1/affine-chamber-structure: walls of the affine roots define alcoves and facets.
- ReductiveGroupsPartII:RG2.3/moy-prasad-filtration: the filtration pieces U_{a,x,r} generate G_{x,r}.
- ReductiveGroupsPartII:RG2.4/iwahori-factorization: ordered products of affine root subgroups.
- Fintzen 2021, §3: valued root-group filtrations.
- He 2018, Lemma 16: root factorization at shifted depth.

**API.**

- `BruhatTits.AffineRoot` (constructor): An affine root a + k with a ∈ Φ, k ∈ Γ'_a, as an affine function on A.
- `BruhatTits.AffineRoot.gradient` (projection): The vector part a ∈ Φ of an affine root.
- `BruhatTits.AffineRoot.wall` (data): The wall {α = 0} ⊂ A.
- `BruhatTits.AffineRoot.rootSubgroup` (data): U_α = U_{a,k}.
- `BruhatTits.AffineRoot.rootSubgroup_mono` (relation): If α ≤ β pointwise on A (same gradient) then U_β ⊂ U_α.
- `BruhatTits.AffineRoot.valueSet` (data): Γ_a and Γ'_a.
- `BruhatTits.AffineRoot.filtrationAt_succ` (relation): U_{a,x,r+} ⊲ U_{a,x,r} with κ-vector-space quotient (modulo U_{2a}).

**Unit tests.**

- `BruhatTits.AffineRoot.sl2_affine_roots` (computation): For SL_2 the affine roots are ±a + n, n ∈ ℤ, and U_{a+n} = x_+(ϖ^n O).
- `BruhatTits.AffineRoot.rootSubgroup_top` (degenerate): U_{a,∞} = {1}.
- `BruhatTits.AffineRoot.gl_n_compat` (compatibility): For GL_n and the root e_i − e_j, U_{a+k} = 1 + ϖ^{⌈k⌉} O e_{ij}, matching Tau Ceti GeneralLinear.rootSubgroup on O-points.
- `BruhatTits.AffineRoot.not_all_values` (non-example): For a ramified unitary group, Γ'_a ≠ Γ_a: not every value of φ_a gives an affine root, so defining affine roots by Γ_a would add spurious walls.

**Construction or proof.**

1. Define the sets and functions following BT I 6.2.2–6.2.6 (pp. 117–120): affine roots, walls, U_α.
2. Compute Γ_a and Γ'_a in the quasi-split case from the root-group coordinates (BT II 4.2.21–4.2.23, pp. 98–99, and RG2.1/quasi-split-valuation).
3. Graded quotients are vector spaces over the residue field: in the coordinates x_a, U_{a,k}/U_{a,k+} is a subquotient of the additive group of K_a, namely ϖ_a^m O_{K_a}/ϖ_a^{m+1} O_{K_a} (case I), with the analogous statement for H_0 in case II (BT II 4.3, the schemes 𝔘_{a,k}).

**Acceptance.**

- For SL_2: affine roots ±a + n (n ∈ ℤ), U_{a+n} = x_+(ϖ^n O).
- For ramified quasi-split SU_3 the value set of the long root is shifted by 1/2 relative to the short one.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 6.2.2–6.2.6, pp. 117–120. Definitions of Γ_a, Γ'_a, affine roots, walls and the subgroups U_α.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.2.20–4.2.23, pp. 97–99. Explicit value sets in the quasi-split case, including the multipliable roots.
- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): proof of Lemma 16, pp. 17–18. Uses ordered products of affine root subgroups X_{α_a}, X_{β_a} and their shifts by integer depth to parametrize Ĭ and Ĭ ∩ ṡĬṡ^{-1}.

Atlas planet: **Affine roots and root-group filtrations**.

<a id="RG2-1-valued-root-datum-existence"></a>

### Existence of the valued root datum

Target `ReductiveGroupsPartII:RG2.1/valued-root-datum-existence`. Theorem; suggested declaration `BruhatTits.exists_valuation_compatible`.

Let K be a henselian discretely valued field with perfect residue field and G a connected reductive group over K, with maximal K-split torus S. Then the root datum (Z(K), (U_a(K))_{a∈Φ(G,S)}) of G(K) admits a valuation compatible with ω, and any two such valuations are equipollent (they differ by v ∈ V), hence unique up to equipollence; different maximal split tori give N(K)-/G(K)-conjugate data. For a nonarchimedean local field E and for Ĕ this applies to every connected reductive group.

**Hypotheses.** K henselian, discrete valuation, perfect residue field; G connected reductive over K.

**Prerequisites.** [The valuation of a quasi-split group](#RG2-1-quasi-split-valuation) (`ReductiveGroupsPartII:RG2.1/quasi-split-valuation`); [Steinberg's theorem over the completed unramified field](#RG2-1-steinberg-quasi-split) (`ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`); [A rational maximal L-split torus](#RG2-1-rational-maximal-unramified-split-torus) (`ReductiveGroupsPartII:RG2.1/rational-maximal-unramified-split-torus`); [The apartment of a valued root datum](#RG2-1-apartment) (`ReductiveGroupsPartII:RG2.1/apartment`).

**Construction or proof.**

1. Over the strict henselization K^sh (= the maximal unramified extension completed in the complete case) G is quasi-split (RG2.1/steinberg-quasi-split), so RG2.1/quasi-split-valuation gives a compatible valuation (BT II §4.2).
2. Étale descent: the Galois group of K^sh/K acts on the building over K^sh; condition (DE) holds for discrete valuations; the valuation descends to the root datum of G(K) relative to a maximal K-split torus contained in a K-rational maximal K^sh-split torus (RG2.1/rational-maximal-unramified-split-torus; BT II 5.1.20, p. 153).
3. Uniqueness up to equipollence: BT II 4.2.9 (p. 91) and 5.1.23 (p. 155).

**Acceptance.**

- For a quaternion division algebra D over E and G = D^×: the maximal split torus is the centre G_m, Φ is empty, the valuation is empty data, the enlarged apartment is X_*(G_m) ⊗ ℝ = ℝ and the reduced apartment is a point.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 5.1.1, 5.1.20 and 5.1.23, pp. 145–155. Main theorem: the valuation over the strict henselization descends to a valuation of the root datum of G(K), compatible with ω, unique up to equipollence; applicable to every connected reductive group over a henselian discretely valued field with perfect residue field.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): Introduction, p. 7. Summary: G(K) possesses a valued root datum compatible with the valuation, unique up to conjugation and equipollence.

Atlas planet: **Bruhat–Tits existence theorem**.

<a id="RG2-1-kottwitz-homomorphism"></a>

### The Kottwitz homomorphism

Target `ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism`. Construction; suggested declaration `KottwitzMap.kottwitz`.

Let G be a connected reductive group over L (henselian discretely valued with algebraically closed residue field, e.g. Ĕ). The Kottwitz homomorphism κ_G : G(L) → π₁(G)_I is the unique family of homomorphisms, functorial in G, which on tori is κ_T; it is constructed by: (i) for G with simply connected derived group, κ_G is the composite G(L) → D(L) → X_*(D)_I = π₁(G)_I with D = G/G_der; (ii) in general, via a z-extension G̃ → G, κ_G(g) := image of κ_{G̃}(g̃) for any lift g̃ (independent of choices). κ_G is surjective, σ-equivariant when G is defined over E, trivial on the image of G_sc(L) and on every unipotent element; its kernel G(L)_1 contains every parahoric subgroup. On E-points it restricts to κ_G : G(E) → (π₁(G)_I)^σ. Equivalently (Haines–Rapoport) with values in X^*(Ẑ(G)^I).

**Hypotheses.** L henselian, discretely valued, algebraically closed residue field; G connected reductive over L (or over E with L = Ĕ).

**Prerequisites.** [The Kottwitz homomorphism of a torus](#RG2-1-kottwitz-homomorphism-torus) (`ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism-torus`); [Existence of z-extensions](#RG2-1-z-extension-existence) (`ReductiveGroupsPartII:RG2.1/z-extension-existence`); [The algebraic fundamental group](#RG2-1-algebraic-fundamental-group) (`ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`); [Steinberg's theorem over the completed unramified field](#RG2-1-steinberg-quasi-split) (`ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`).

**Uses.**

- ReductiveGroupsPartII:RG2.3/parahoric-kottwitz-characterization: parahoric = fixer ∩ ker κ_G.
- ReductiveGroupsPartII:RG2.4/kottwitz-quotient: κ identifies G(L)/G(L)_1 with Ω.
- BunGAndNewtonStrata:BG1 (moved down from BG1/newton-and-kottwitz-maps): κ on B(G) via Frobenius coinvariants.
- Kisin–Pappas 2018, §1.1.2 (G01): connected parahoric as Kottwitz kernel in the fixer.
- Kisin 2017, §1.2: Cartan cosets and Kottwitz maps for unramified groups.

**API.**

- `KottwitzMap.kottwitz` (constructor): κ_G : G(L) →* π₁(G)_I.
- `KottwitzMap.kottwitz_surjective` (other): κ_G is surjective.
- `KottwitzMap.kottwitz_natural` (functoriality): κ commutes with homomorphisms of reductive groups.
- `KottwitzMap.kottwitz_torus` (compatibility): For a torus, κ_G = κ_T.
- `KottwitzMap.kottwitz_simplyConnected` (characterisation): For G_der simply connected, κ_G is κ_D ∘ (G → D) with D = G/G_der, under the identification π₁(G) = X_*(D).
- `KottwitzMap.kottwitz_sc_image` (relation): κ_G vanishes on the image of G_sc(L).
- `KottwitzMap.kernel` (data): G(L)_1 := ker κ_G.

**Unit tests.**

- `KottwitzMap.kottwitz_gl_n` (compatibility): For GL_n with n>0, identify inertia coinvariants with ℤ by determinant. Then κ(g)=ω(det g), using the pinned Tau Ceti normalized valuation and its existing GL point equivalence.
- `KottwitzMap.kottwitz_sl_n` (degenerate): For SL_n, π₁ = 0 and κ is trivial.
- `KottwitzMap.kottwitz_pgl2` (computation): For PGL_2, κ of the image of (0 1; ϖ 0) is the nonzero element of ℤ/2.
- `KottwitzMap.kottwitz_not_det_valuation` (non-example): For PGL_2, ω ∘ det is not well defined on PGL_2(L) (scalars change it by even integers); only its class mod 2 is: a definition by ω(det) is wrong.

**Construction or proof.**

1. Simply connected derived case: G(L) → D(L) is surjective since H^1(L, G_der) = 1 (Steinberg, RG2.1/steinberg-quasi-split); define via κ_D (Pappas–Rapoport §2.a.2, Step 3, p. 11).
2. General case via a z-extension (RG2.1/z-extension-existence); independence of the z-extension by comparing two z-extensions through their fibre product (Pappas–Rapoport Step 4, p. 11; Kottwitz 1997 §7.4).
3. Functoriality and agreement with κ_T on tori by construction; surjectivity since π₁(G̃)_I → π₁(G)_I is surjective and κ_{G̃} is (Pappas–Rapoport p. 11).
4. Parahorics lie in the kernel: Haines–Rapoport, Proposition 3 and Lemma 17 (pp. 1–2, 9).

**Acceptance.**

- For GL_n: κ(g) = ω(det g) ∈ ℤ.
- For PGL_2: κ(g) = ω(det g̃) mod 2 for any lift g̃ ∈ GL_2(L).

**Sources.**

- [Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag varieties*](https://arxiv.org/abs/math/0607130): §2.a.2, Steps 1–4, pp. 10–11. The four-step construction of the Kottwitz homomorphism G(K) → π₁(G)_I (tori, induced tori, simply connected derived group, z-extensions) and its surjectivity.
- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): introduction and (1), p. 1. Kottwitz's functorial surjective homomorphism κ_G : G(L) → X^*(Ẑ(G)^I) over a strictly henselian discretely valued field, used to define parahoric subgroups.
- [Mark Kisin, *Mod p points on Shimura varieties of abelian type*](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf): §§1.2.1–1.2.2, author copy p. 12. The map κ̃ : G(L) → π₁(G) for unramified groups, retaining the coroot quotient, and κ after Frobenius coinvariants.

Atlas planet: **Kottwitz homomorphism**.

<a id="RG2-1-nonsplit-torus-example"></a>

### Nonsplit tori: apartments and Kottwitz maps

Target `ReductiveGroupsPartII:RG2.1/nonsplit-torus-example`. Application; suggested declaration `KottwitzMap.Examples.normOne_ramified`.

Let E'/E be a separable quadratic extension of local fields and T = R^1_{E'/E} G_m the norm-one torus (RG2.0a/norm-torus). Then S = 1, V = 0, the reduced and enlarged apartments are a single point, T(E) is compact and equal to T(E)^1. X_*(T) = ℤ with Gal(E'/E) acting by −1. If E'/E is unramified: I acts trivially, X_*(T)_I = ℤ with σ acting by −1, (X_*(T)_I)^σ = 0, so κ_T is trivial on T(E) and T(E)_0 = T(E). If E'/E is ramified: X_*(T)_I = ℤ/2, (X_*(T)_I)^σ = ℤ/2, κ_T : T(E) → ℤ/2 is surjective, and T(E)_0 = ker κ_T has index 2 in T(E): it consists of the norm-one units congruent to 1 modulo the maximal ideal of O_{E'} (up to the sign class −1 ∉ T(E)_0 for p ≠ 2).

**Hypotheses.** E'/E separable quadratic; for the explicit description of T(E)_0: p ≠ 2.

**Prerequisites.** [The Kottwitz homomorphism of a torus](#RG2-1-kottwitz-homomorphism-torus) (`ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism-torus`); [Norm maps and norm-one tori](#RG2-0a-norm-torus) (`ReductiveGroupsPartII:RG2.0a/norm-torus`); [The valuation homomorphism of the minimal Levi](#RG2-1-torus-valuation-map) (`ReductiveGroupsPartII:RG2.1/torus-valuation-map`).

**Construction or proof.**

1. Characters and cocharacters from RG2.0a/norm-torus; apartment of a torus with S = 1 is a point (RG2.1/apartment).
2. Kottwitz map from RG2.1/kottwitz-homomorphism-torus: compute coinvariants of ℤ with the sign action (I trivial or of order 2).
3. Explicit kernel: compare with the connected Néron model (RG2.3/torus-parahoric-example).

**Acceptance.**

- −1 ∈ T(E) for ramified E'/E (p ≠ 2) has κ_T(−1) ≠ 0.

**Sources.**

- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Proposition 3 proof (a), p. 2. For a torus the kernel of κ_T is the unique parahoric (Iwahori) subgroup.
- [Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag varieties*](https://arxiv.org/abs/math/0607130): §2.a.2 and §3 (tori and groups of multiplicative type), pp. 10–13. Kottwitz maps of tori and examples of nonsplit tori.

<a id="RG2-1-valued-commutator-estimates"></a>

### Commutator estimates for valued root groups

Target `ReductiveGroupsPartII:RG2.1/valued-commutator-estimates`. Theorem; suggested declaration `BruhatTits.AffineRoot.commutator_le`.

Let φ be a valuation. (1) For roots a, b that are not negatively proportional and x ∈ A, r, s ∈ ℝ: [U_{a,x,r}, U_{b,x,s}] ⊂ ∏_{p,q ≥ 1, pa+qb∈Φ} U_{pa+qb, x, pr+qs} (any order). (2) For opposite roots (the rank-one lemmas of Bruhat–Tits I §6.3): if r + s > 0 then every product of an element of U_{a,x,r} and an element of U_{−a,x,s} can be rewritten as an element of U_{−a,x,s} times an element of the bounded part of the torus times an element of U_{a,x,r}, with the analogous statements for U_{2a} in the multipliable case. (3) Conjugation: for z ∈ Z(K), z U_{a,x,r} z^{-1} = U_{a, z·x, r}; for n ∈ N(K), n U_{a,x,r} n^{-1} = U_{w(a), ν(n)x, r}. In the reductive case these hold for G(K) with explicit constants given by the Chevalley commutator formula.

**Hypotheses.** φ a valuation of the root datum.

**Prerequisites.** [Affine roots and root-group filtrations](#RG2-1-affine-roots-and-filtrations) (`ReductiveGroupsPartII:RG2.1/affine-roots-and-filtrations`); `tauceti:TauCeti.GeneralLinear.commutatorElement_rootSubgroupPoints`.

**Construction or proof.**

1. (1) is axiom V3 rewritten at a point x (BT I 6.2.1 V3, 6.2.6).
2. (2) BT I 6.3 (pp. 128–132): rank-one lemmas from V2 and V5; for SU_3-type roots the explicit commutator relations (BT II Annexe, pp. 169–172).
3. (3) Transport of structure (BT I 6.2.5, 6.2.10).

**Acceptance.**

- For SL_3 and adjacent roots a, b: [x_a(s), x_b(t)] = x_{a+b}(±st), so [U_{a,x,r}, U_{b,x,s}] ⊂ U_{a+b,x,r+s}.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 6.2.1 (V3), 6.3.1–6.3.11, pp. 117, 128–132. The commutator axiom of a valuation and the lemmas in rank one.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): Annexe (Relations de commutation), pp. 169–172. Explicit commutation relations in the quasi-split groups, including the non-reduced case.

<a id="RG2-1-unramified-descent-of-valuation"></a>

### Valuations and apartments under unramified extension

Target `ReductiveGroupsPartII:RG2.1/unramified-descent-of-valuation`. Theorem; suggested declaration `BruhatTits.apartment_eq_fixedPoints`.

Let K be as above and K'/K an unramified Galois extension (finite, or the maximal one completed), with S ⊂ S' a maximal K-split torus inside a K-rational maximal K'-split torus. The compatible valuation φ of G(K) is the restriction (descent) of a Gal(K'/K)-invariant compatible valuation φ' of G(K'): for a ∈ Φ(G, S), U_a(K) is the Galois-fixed part of the product of the U_b(K') over the roots b of S' restricting to a, and φ_a is the infimum of the φ'_b. The apartment A(G, S, K) is identified with the affine subspace A(G, S', K')^{Gal(K'/K)}, compatibly with N(K) ⊂ N'(K') and with affine roots: the affine roots of A(G,S,K) are the restrictions of those of A(G,S',K') whose gradient is nonzero on X_*(S)⊗ℝ.

**Hypotheses.** K'/K unramified Galois; S ⊂ S' as above.

**Prerequisites.** [Existence of the valued root datum](#RG2-1-valued-root-datum-existence) (`ReductiveGroupsPartII:RG2.1/valued-root-datum-existence`); [A rational maximal L-split torus](#RG2-1-rational-maximal-unramified-split-torus) (`ReductiveGroupsPartII:RG2.1/rational-maximal-unramified-split-torus`).

**Construction or proof.**

1. BT II 5.1.16–5.1.20 (pp. 151–154): the descended family φ^♮ is a valuation; points of A^♮ correspond to Galois-fixed points of A.
2. Affine roots of the descended apartment (BT II 5.1.20 (iii), p. 154); descent theorem in the abstract setting BT I 9.2 (pp. 204–209).

**Acceptance.**

- For the quasi-split unitary group U_3 attached to an unramified quadratic extension: over Ĕ it becomes GL_3, σ acts on the apartment ℝ³ of GL_3 by (x_1, x_2, x_3) ↦ (−x_3, −x_2, −x_1), and the apartment over E is the fixed line {(x, 0, −x)}.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 5.1.16–5.1.21, pp. 151–154. Descent of the valuation from G(K^sh) to G(K), identification of the descended apartment with the Galois-fixed points and description of its affine roots and facets.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 9.2.1–9.2.14, pp. 204–209. Abstract descent theorem for valued root data under a group of automorphisms.

<a id="RG2-1-affine-chamber-structure"></a>

### Walls, alcoves and facets of the apartment

Target `ReductiveGroupsPartII:RG2.1/affine-chamber-structure`. Definition; suggested declaration `BruhatTits.Facet`.

For the apartment A of a valuation φ, the walls are the zero sets H_α of the affine roots α. An alcove (chamber) is a connected component of A ∖ ⋃ H_α; a facet is an equivalence class for the relation 'x and y lie on the same side of, or on, every wall' (i.e. α(x) and α(y) have the same sign, with sign 0, for all affine roots α); facets are relatively open convex polyhedra partially ordered by F ≤ F' iff F ⊂ closure(F'); vertices are minimal facets in the semisimple (reduced) apartment; a point x is special if for every root a ∈ Φ there is an affine root with gradient a (or a multiple in the échelonnage system) vanishing at x. In the enlarged apartment facets are products of facets of the reduced apartment with the central direction V_Z.

**Hypotheses.** φ a discrete valuation of a root datum (the affine roots form a locally finite family of hyperplanes).

**Prerequisites.** [Affine roots and root-group filtrations](#RG2-1-affine-roots-and-filtrations) (`ReductiveGroupsPartII:RG2.1/affine-roots-and-filtrations`); `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`.

**Uses.**

- ReductiveGroupsPartII:RG2.2/facets-and-special-points: facets of the building are translates of facets of apartments.
- ReductiveGroupsPartII:RG2.3/parahoric-subgroup: parahorics are attached to facets.
- ReductiveGroupsPartII:RG2.4/length-and-bruhat-order: length counts walls separating alcoves.
- He 2021, §2.1: base alcove and positive chamber conventions.

**API.**

- `BruhatTits.Facet` (constructor): Facets of the apartment as equivalence classes of points.
- `BruhatTits.Facet.wall` (data): The set of walls H_α.
- `BruhatTits.Facet.IsAlcove` (other): The predicate of being an alcove (open facet).
- `BruhatTits.Facet.le` (relation): The closure order F ≤ F': every affine root nonnegative on F' is nonnegative on F (equivalently F ⊂ closure(F')).
- `BruhatTits.Facet.le_iff` (characterisation): Facets are determined by their sign patterns: F ≤ F' and F' ≤ F iff F = F'.
- `BruhatTits.Facet.IsSpecial` (other): Special points: every root direction occurs among the walls through the point.
- `BruhatTits.Facet.locallyFinite` (other): Every bounded subset meets finitely many walls (discrete valuation).

**Unit tests.**

- `BruhatTits.Facet.sl2_alcoves` (computation): For SL_2 in the standard cocharacter coordinate x, the root is 2x and the walls are x=m/2 for m∈ℤ. The alcoves are precisely (m/2,(m+1)/2).
- `BruhatTits.Facet.rankZero` (degenerate): If Φ is empty the apartment has a single facet, itself an alcove.
- `BruhatTits.Facet.not_special_barycentre` (non-example): The barycentre of an alcove of SL_2 lies on no wall, so it is not special (not a vertex).
- `BruhatTits.Facet.pgl3_alcove_triangle` (computation): For PGL_3 every alcove has three vertices, all special.
- `BruhatTits.Facet.convex_compat` (compatibility): The carrier of a facet, expressed in the vector space by any apartment origin, is a convex set in Mathlib’s real-module sense; it is the intersection of the strict half-spaces and hyperplanes prescribed by its sign class.

**Construction or proof.**

1. Local finiteness of walls for discrete valuations (BT I 6.2.13–6.2.23, pp. 125–127).
2. Facet decomposition and closure order of a locally finite hyperplane arrangement with affine reflection group (BT I 1.3.1–1.3.7, pp. 19–22; 7.2, pp. 161–163).

**Acceptance.**

- For SL_2 with A = ℝ normalized as in the apartment (a^∨ = 1, walls ½ℤ): the alcoves are the open intervals (k/2, (k+1)/2), the vertices are the walls, and every vertex is special.
- For PGL_3 the alcoves are equilateral triangles.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 1.3.1–1.3.7, pp. 19–22. Affine Weyl groups acting on a real affine space: chambers, facets, walls, types and special points.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 7.2.1–7.2.7, pp. 161–163. Chambers and facets of the apartment of a valued root datum.
- [Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2001.03325): §2.1, p. 4. A σ-stable alcove of the apartment and its Iwahori subgroup.

<a id="RG2-1-transport-under-choices"></a>

### Independence of choices

Target `ReductiveGroupsPartII:RG2.1/transport-under-choices`. Theorem; suggested declaration `BruhatTits.Apartment.transport`.

The apartment with its affine structure, affine roots, walls, filtrations U_{a,x,r} and the N(K)-action is independent of the choices up to canonical isomorphism: (1) replacing φ by an equipollent valuation is a translation of A (identity on the affine-root structure); (2) replacing S by gSg^{-1} (g ∈ G(K)) transports everything by Int(g), and the resulting isomorphism depends only on g modulo N(K)-action; (3) two Chevalley–Steinberg systems give equipollent valuations; (4) compatible valuations of G(K) for different maximal split tori are G(K)-conjugate (unique up to conjugation and equipollence).

**Hypotheses.** G connected reductive over K as in RG2.1/valued-root-datum-existence.

**Prerequisites.** [Existence of the valued root datum](#RG2-1-valued-root-datum-existence) (`ReductiveGroupsPartII:RG2.1/valued-root-datum-existence`); [The apartment of a valued root datum](#RG2-1-apartment) (`ReductiveGroupsPartII:RG2.1/apartment`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. (1) BT I 6.2.5–6.2.6 (p. 120); (2) maximal split tori are G(K)-conjugate (anchor Layer 7, Borel–Tits); (3) BT II 4.1.13, 4.2.10 (pp. 84, 91); (4) BT II 4.2.9, 5.1.23 and BT I 6.2.12.

**Acceptance.**

- For GL_n, conjugating the diagonal torus by a permutation matrix permutes the coordinates of A ≅ ℝ^n.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 6.2.5–6.2.12, pp. 120–125. Equipollence and the N-action; uniqueness of the affine structure.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.1.13, 4.2.10 and 4.2.13, pp. 84, 91–93. Effect of the choices of Chevalley–Steinberg systems; independence of the building up to unique isomorphism.

<a id="RG2-1-echelonnage-root-system"></a>

### The échelonnage root system

Target `ReductiveGroupsPartII:RG2.1/echelonnage-root-system`. Construction; suggested declaration `BruhatTits.echelonnage`.

Given the affine roots of a discrete valuation (with Φ possibly non-reduced and value sets of different sizes), the gradients of the walls, rescaled by their spacing, form a reduced root system Σ in V* (the échelonnage root system of Bruhat–Tits): for each wall direction a, the walls with gradient proportional to a are the level sets {a = k} for k in a coset of ℤ·c_a, and Σ consists of the vectors a/c_a. The group generated by the reflections in the walls is the affine Weyl group W(Σ) ⋉ Q^∨(Σ) of Σ; For split groups Σ agrees with the reduced relative system in its standard normalization. For a non-split group it can have a different reduced type: a ramified quasi-split SU_{2n}, n≥3, has relative system C_n and échelonnage system B_n over the completed unramified field. For a possibly nonreduced Φ, indivisible roots (discarding 2a) and nonmultipliable roots (discarding a when 2a is a root) are distinguished explicitly; Φ_red alone is not used as an ambiguous convention. Dominance on X_*(T)_I uses the positive coroots of Σ: for dominant λ, λ' one has λ ≤ λ' iff λ' − λ is a non-negative integral combination of positive coroots of Σ (corrected order of van Hoften App. A.1).

**Hypotheses.** a discrete valuation with apartment A.

**Prerequisites.** [Walls, alcoves and facets of the apartment](#RG2-1-affine-chamber-structure) (`ReductiveGroupsPartII:RG2.1/affine-chamber-structure`); `mathlib:RootPairing`; `mathlib:RootPairing.IsReduced`.

**Uses.**

- ReductiveGroupsPartII:RG2.1/affine-weyl-group: W_a = W(Σ) ⋉ Q^∨(Σ).
- ReductiveGroupsPartII:RG2.4/dominant-coinvariant-cocharacters: dominance and ρ_Σ.
- ReductiveGroupsPartII:RG2.4/translation-length-formula: ℓ(t^λ) = ⟨λ, 2ρ_Σ⟩.
- van Hoften 2024, App. A.1; He 2021 §2.1: échelonnage data of very special vertices.

**API.**

- `BruhatTits.echelonnage` (constructor): The reduced root system Σ (a Mathlib root pairing over ℝ) attached to a discrete valuation.
- `BruhatTits.echelonnage_isReduced` (instance): Σ is reduced.
- `BruhatTits.echelonnage_proportional` (characterisation): Every element of Σ is a positive multiple of a root of Φ and conversely every root of Φ has a positive multiple in Σ.
- `BruhatTits.echelonnage_walls` (characterisation): Every wall of A is a level set {α(x − x₀) = k} with α ∈ Σ and k ∈ ℤ, for any special point x₀ as origin.
- `BruhatTits.echelonnage_split` (compatibility): For split G, Σ is the reduced relative root system.

**Unit tests.**

- `BruhatTits.echelonnage_sl2` (computation): For SL_2, Σ = {±a}.
- `BruhatTits.echelonnage_rank_zero` (degenerate): For Φ empty, Σ is empty.
- `BruhatTits.echelonnage_unramified_unitary` (computation): For the quasi-split unitary group in three variables over an unramified extension, Σ is of type A_1 (BC_1 non-reduced Φ gives a reduced Σ).
- `BruhatTits.echelonnage_ne_relative` (non-example): Over the completed unramified field, a quasi-split unitary group SU_6 for a ramified quadratic extension has relative system C_3 and échelonnage system B_3. They are not isomorphic root systems; taking the relative system as Σ gives the wrong affine Weyl translation lattice.
- `BruhatTits.echelonnage_split_compat` (compatibility): For a split group with standard normalization, the échelonnage RootPairing is equivalent to the imported relative RootPairing, including its coroots and reflection action.

**Construction or proof.**

1. BT I §1.4, pp. 25–28 supplies the wall-spacing root-system formalism; BT II §4.2.20–4.2.23, pp. 97–99 computes its discrete value sets and quasi-split types. Choose a special origin and rescale each wall direction by its spacing.
2. Haines 2018 (dualities) gives a uniform description of Σ for quasi-split groups in terms of the absolute root datum and inertia (Haines, Dualities, §§5–6).
3. Dominance order: van Hoften App. A.1 (p. 54) with the corrected order relation.

**Acceptance.**

- For split G, Σ = Φ (as reduced systems) with the standard affine Weyl group.
- For quasi-split SU_3, Φ = BC_1 is non-reduced and Σ is of type A_1.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 1.4.1–1.4.6, pp. 25–28. Échelonnages of root systems, their Dynkin diagrams and classification.
- [Thomas J. Haines, *Dualities for root systems with automorphisms and applications to non-split groups*](https://arxiv.org/abs/1604.01468): Theorem B, pp. 2–3; §3, pp. 5–7; §6.1, pp. 13–14 (arXiv v2). Identifies the échelonnage roots by restriction and modified norm under inertia and Frobenius; supplies the distinction from unscaled relative roots.
- [Pol van Hoften (Appendix A by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*](https://arxiv.org/abs/2010.10496): Appendix A.1, p. 54. For a very special vertex the reduced échelonnage root system Σ with W_aff = W(Σ) ⋉ Q^∨(Σ), and the dominance order on inertia coinvariants, with a corrected order relation.
- [Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2001.03325): §2.1, p. 4. Uses the reduced root system attached to the affine Weyl group, which need not be the relative root system.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §4.2.20–4.2.23, pp. 97–99. The value-set calculations and échelonnage classification supply the discrete wall spacing and the split, unramified and ramified examples.

<a id="RG2-1-frobenius-action-on-apartment"></a>

### Affine Frobenius action on the apartment over Ĕ

Target `ReductiveGroupsPartII:RG2.1/frobenius-action-on-apartment`. Construction; suggested declaration `BruhatTits.frobeniusOnApartment`.

Let G be connected reductive over E, S_L a maximal L-split torus defined over E (RG2.1/rational-maximal-unramified-split-torus) and A_L = A(G_L, S_L, L). The Frobenius σ acts on A_L by an affine automorphism (transport of the valuation by σ), whose linear part ς is the action of σ on X_*(T)_I ⊗ ℝ. Choosing a σ-stable alcove C and a special vertex x_0 of C, there is a unique w_0 ∈ W_0 such that σ_0 := w_0 ∘ ς preserves the dominant chamber defined by C at x_0; σ_0 is the Frobenius of the quasi-split inner form on the based root datum and is the action used to describe Frobenius on X_*(T)_I and on the Iwahori–Weyl group. The splitting W̃ = X_*(T)_I ⋊ W_0 determined by x_0 is in general not σ-equivariant; the gradient of the affine σ-action is ς.

**Hypotheses.** G over E, L = Ĕ, σ-stable alcove and special vertex chosen.

**Prerequisites.** [A rational maximal L-split torus](#RG2-1-rational-maximal-unramified-split-torus) (`ReductiveGroupsPartII:RG2.1/rational-maximal-unramified-split-torus`); [The apartment of a valued root datum](#RG2-1-apartment) (`ReductiveGroupsPartII:RG2.1/apartment`); [Valuations and apartments under unramified extension](#RG2-1-unramified-descent-of-valuation) (`ReductiveGroupsPartII:RG2.1/unramified-descent-of-valuation`).

**Uses.**

- Kisin–Zhou 2025, §2.1: Frobenius on the Iwahori–Weyl group and Newton points.
- Gleason–Lim–Xu 2026, §2.1: quasi-split Frobenius on based root data.
- ReductiveGroupsPartII:RG2.3/very-special-parahoric: σ-stable special vertices.
- BunGAndNewtonStrata:BG1: σ-conjugacy in W̃ and Newton maps.

**API.**

- `BruhatTits.frobeniusOnApartment` (constructor): The affine automorphism σ_A of A_L.
- `BruhatTits.frobeniusOnApartment_linear` (projection): Its linear part ς on X_*(T)_I ⊗ ℝ.
- `BruhatTits.frobeniusCorrection` (data): The element w_0 ∈ W_0 with σ_0 = w_0 ς preserving the dominant chamber.
- `BruhatTits.frobeniusOnApartment_fixed` (characterisation): Fixed points of σ_A are the apartment over E.
- `BruhatTits.frobeniusOnApartment_alcove` (relation): σ_A preserves the chosen σ-stable alcove.

**Unit tests.**

- `BruhatTits.frobeniusOnApartment_split` (degenerate): For G split over E, σ acts trivially on A_L.
- `BruhatTits.frobeniusOnApartment_unitary` (computation): For the unramified quasi-split U_3, ς acts on X_*(T) = ℤ³ by (a, b, c) ↦ (−c, −b, −a).
- `BruhatTits.frobeniusCorrection_quasiSplit` (compatibility): If the chosen special vertex and alcove are σ-stable and G is quasi-split, w_0 = 1.
- `BruhatTits.frobeniusSplitting_not_equivariant` (non-example): For a non-quasi-split inner form the decomposition W̃ = X_*(T)_I ⋊ W_0 is not σ-stable.

**Construction or proof.**

1. σ transports valuations of G(L) to valuations, preserving compatibility, hence acts on A_L by affine maps; σ-fixed points are A(G,S,E) (RG2.1/unramified-descent-of-valuation).
2. Correction by w_0: the image of ς on chambers is a chamber; the unique Weyl element returning it to the dominant one defines σ_0 (Kisin–Zhou 2.1.2–2.1.3; Gleason–Lim–Xu §2.1 (2.4)–(2.5)).

**Acceptance.**

- For G quasi-split and x_0 σ-stable special: w_0 = 1 and σ_0 = ς.
- For an inner form of GL_n given by a division algebra of invariant 1/n: σ acts on X_*(T) = ℤ^n by a cyclic permutation composed with a translation.

**Sources.**

- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): §§2.1.2–2.1.3, arXiv v2 pp. 6–7. Fixes the special vertex, apartment and Frobenius action under which translation and linear parts are compared.
- [Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2208.07195): §2.1, equations (2.4)–(2.5), pp. 13–14. Describes the affine Frobenius action and its inner-twist translation part relative to the chosen origin.

<a id="RG2-1-affine-weyl-group"></a>

### The affine Weyl group

Target `ReductiveGroupsPartII:RG2.1/affine-weyl-group`. Construction; suggested declaration `BruhatTits.AffineWeylGroup`.

W_a ⊂ Aff(A) is the group generated by the orthogonal reflections in the walls of A (for a W_0-invariant scalar product on V). It acts simply transitively on the set of alcoves; for an alcove C, the reflections S_aff in the walls of C generate W_a and (W_a, S_aff) is a Coxeter system whose Coxeter matrix is that of the affine Dynkin diagram of the échelonnage system; W_a = W(Σ) ⋉ Q^∨(Σ) after choosing a special point as origin. W_a is the image under ν of the subgroup of N(K) generated by the m(u), u ∈ U_a ∖ {1}, and is normal in ν(N(K)) with ν(N(K)) = W_a ⋊ Stab(C).

**Hypotheses.** a discrete valuation, so the wall arrangement is locally finite.

**Prerequisites.** [The échelonnage root system](#RG2-1-echelonnage-root-system) (`ReductiveGroupsPartII:RG2.1/echelonnage-root-system`); `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free`; `mathlib:CoxeterSystem`.

**Uses.**

- ReductiveGroupsPartII:RG2.4/iwahori-weyl-group: W̃ = W_a ⋊ Ω.
- ReductiveGroupsPartII:RG2.4/affine-tits-system: the Weyl group of the affine Tits system.
- ReductiveGroupsPartII:RG2.2/building: types of facets via W_a-orbits.
- He 2021, §2.1; Gleason–Lim–Xu §2.1: affine Weyl subgroup and length.

**API.**

- `BruhatTits.AffineWeylGroup` (constructor): The subgroup of affine automorphisms of A generated by wall reflections.
- `BruhatTits.AffineWeylGroup.simpleReflections` (data): S_aff for a chosen alcove C.
- `BruhatTits.AffineWeylGroup.coxeterSystem` (structure): A Mathlib CoxeterSystem structure on W_a with generators S_aff.
- `BruhatTits.AffineWeylGroup.simplyTransitive_alcoves` (characterisation): W_a acts simply transitively on alcoves.
- `BruhatTits.AffineWeylGroup.semidirect` (equivalence): W_a ≅ W(Σ) ⋉ Q^∨(Σ) given a special origin.
- `BruhatTits.AffineWeylGroup.normal_in_image` (relation): W_a is normal in ν(N(K)) and ν(N(K)) = W_a ⋊ Stab(C).

**Unit tests.**

- `BruhatTits.AffineWeylGroup.sl2_infinite_dihedral` (computation): For SL_2, W_a is infinite dihedral and s_0 s_1 is translation by a primitive coroot.
- `BruhatTits.AffineWeylGroup.rankZero_trivial` (degenerate): If Φ is empty, W_a is trivial.
- `BruhatTits.AffineWeylGroup.finite_quotient_compat` (compatibility): The linear parts of W_a form W(Σ), which equals the relative Weyl group W_0 (= Mathlib RootPairing.weylGroup of Φ).
- `BruhatTits.AffineWeylGroup.not_all_of_N` (non-example): For PGL_2, ν(N(K)) ⊋ W_a: diag(ϖ, 1) acts by a translation not in W_a (it does not preserve types of vertices).

**Construction or proof.**

1. Reflection groups of locally finite hyperplane arrangements invariant under their reflections are Coxeter groups generated by the reflections in the walls of a chamber, acting simply transitively on chambers (BT I 1.3.4–1.3.8, pp. 21–22; Bourbaki Lie V §3).
2. Identify W_a with ν of the group generated by the m(u) via V2/V5 (BT I 6.2.11, p. 123).
3. Semidirect product with the stabilizer of an alcove (BT I 6.2.11; Haines–Rapoport, Lemma 14).
4. Length and reduced words then come from the general Coxeter combinatorics owned by the Tau Ceti roadmap Root systems (Layer 3).

**Acceptance.**

- For SL_2: W_a is the infinite dihedral group generated by s_0, s_1, Coxeter matrix with m(s_0, s_1) = ∞.
- For GL_n: W_a = S_n ⋉ Q^∨(A_{n−1}) ⊂ S_n ⋉ ℤ^n.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 1.3.1–1.3.8, pp. 19–22. Affine Weyl groups: groups generated by reflections in a locally finite family of hyperplanes, chambers, Coxeter structure and the associated reduced root system.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 6.2.11, p. 123. The group W = ν(N) and its subgroup generated by reflections, an affine Weyl group.
- [Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2001.03325): §2.1, p. 4. W_a is the Coxeter group on the walls of the base alcove; W̃ = W_a ⋊ Ω.

Atlas planet: **Affine Weyl group**.

<a id="RG2-1-levi-of-apartment-vector"></a>

### The Levi subgroup centralizing a vector of the apartment

Target `ReductiveGroupsPartII:RG2.1/levi-of-apartment-vector`. Construction; suggested declaration `BruhatTits.leviOfVector`.

For v ∈ V_ℚ = X_*(S) ⊗ ℚ (over Ĕ: X_*(T)_I ⊗ ℚ), M_v is the subgroup of G generated by Z and the root subgroups U_a with ⟨a, v⟩ = 0; it is the Levi subgroup (centralizer) of the K-parabolic attached to v, M_v(K) is generated by Z(K) and the U_a(K) with ⟨a, v⟩ = 0, M_v = G iff v is central (⟨a, v⟩ = 0 for all a), Over Ĕ with a σ-stable torus/root datum, M_v descends to E precisely when its vanishing-root subsystem is Frobenius-stable, equivalently M_{ς(v)}=M_v. The condition ς(v)=v is sufficient. It is not necessary: positive rescalings and changes in central directions leave the Levi unchanged.

**Hypotheses.** v a rational vector of the apartment's vector space.

**Prerequisites.** [The apartment of a valued root datum](#RG2-1-apartment) (`ReductiveGroupsPartII:RG2.1/apartment`); [Affine Frobenius action on the apartment over Ĕ](#RG2-1-frobenius-action-on-apartment) (`ReductiveGroupsPartII:RG2.1/frobenius-action-on-apartment`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Uses.**

- BunGAndNewtonStrata:BG1: Newton centralizers M_ν of σ-conjugacy classes.
- He 2018, §6.1: Newton centralizer Levi.
- Kisin–Zhou 2025, 2.1.6: descent of M_v.
- ReductiveGroupsPartII:RG2.4/levi-kottwitz-kernel: proper rational Levis and π₁.

**API.**

- `BruhatTits.leviOfVector` (constructor): M_v as a subgroup of G(K) generated by Z(K) and the U_a(K), ⟨a, v⟩ = 0.
- `BruhatTits.leviOfVector_eq_top_iff` (characterisation): M_v = G iff ⟨a, v⟩ = 0 for every a ∈ Φ.
- `BruhatTits.leviOfVector_smul` (relation): M_{cv} = M_v for c ∈ ℚ_{>0}.
- `BruhatTits.leviOfVector_conj` (functoriality): n M_v n^{-1} = M_{w(n)v} for n ∈ N(K).
- `BruhatTits.leviOfVector_descends` (functoriality): An automorphism σ of G permuting the root datum compatibly with a linear map ς of V carries M_v to M_{ς(v)}; in particular M_v is σ-stable (and descends to E) when ς(v) = v.

**Unit tests.**

- `BruhatTits.leviOfVector_gl3` (computation): For GL_3 and v = (1, 1, 0), M_v is block-diagonal GL_2 × GL_1.
- `BruhatTits.leviOfVector_zero` (degenerate): M_0 = G.
- `BruhatTits.leviOfVector_regular` (compatibility): For a regular v, the rational subgroup M_v equals the anchor’s minimal Levi Z(K), represented by T in the rational root datum, rather than its parabolic enlargement.
- `BruhatTits.leviOfVector_not_parabolic` (non-example): M_v is not the parabolic attached to v: it omits the root groups with ⟨a, v⟩ > 0.

**Construction or proof.**

1. The centralizer of the image of a cocharacter nv (n with nv integral) is a Levi subgroup, with root system the roots vanishing on v (anchor Layer 7, dynamic parabolics: Tau Ceti Cocharacter.levi).
2. Frobenius carries the vanishing-root subgroup of v to that of ς(v), by its action on the root datum. Descent is therefore equivalent to stability of that subsystem. A fixed vector is sufficient; converse invariance of the vector is not asserted (Kisin–Zhou §2.1.6, p. 8; He §6.1, p. 21).

**Acceptance.**

- For GL_n and v = (1, 1, 0): M_v = GL_2 × GL_1.
- For a nonsplit torus all vectors are central and M_v=G descends, including vectors not fixed by the linear Frobenius action; this rejects the converse fixed-vector criterion.

**Sources.**

- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): §2.1.6, arXiv v2 p. 8. For an apartment vector, the vanishing roots and their subgroups give its Levi.
- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §6.1, p. 21. The Newton centralizer Levi M_ν with rational points generated by Z_G(A)(F) and the root subgroups of roots vanishing on v; M_ν = G iff v central.

<a id="RG2-1-unitary-rank-one-example"></a>

### The quasi-split unitary group in three variables

Target `ReductiveGroupsPartII:RG2.1/unitary-rank-one-example`. Application; suggested declaration `BruhatTits.Examples.unitary_valueSets`.

Let K'/K be a separable quadratic extension with conjugation u ↦ ū and G = SU_3(K'/K), quasi-split for the hermitian form with antidiagonal matrix. Then the maximal K-split torus S is one-dimensional, Φ = {±a, ±2a} is of type BC_1, U_a(K) = H_0(K', K) = {(u, v) ∈ K'² : v + v̄ = u ū}, U_{2a}(K) = {(0, v) : v + v̄ = 0}, and the Chevalley–Steinberg valuation is φ_a(x_a(u, v)) = ½ ω_{K'}(v) with φ_{2a} = 2φ_a on U_{2a}, ω_{K'} extending ω. The value sets Γ_a, Γ_{2a} and the sets Γ'_a of affine roots are those computed in BT II 4.2.21; they depend on whether K'/K is unramified or ramified, and Γ'_a ⊊ Γ_a, so not every value of φ_a gives a wall. The échelonnage system Σ is of type A_1. If K'/K is unramified, G is unramified and an alcove has a hyperspecial vertex; if K'/K is ramified, G has no hyperspecial vertex.

**Hypotheses.** K'/K separable quadratic; for the explicit value sets: p ≠ 2 in the ramified case.

**Prerequisites.** [The valuation of a quasi-split group](#RG2-1-quasi-split-valuation) (`ReductiveGroupsPartII:RG2.1/quasi-split-valuation`); [The échelonnage root system](#RG2-1-echelonnage-root-system) (`ReductiveGroupsPartII:RG2.1/echelonnage-root-system`).

**Construction or proof.**

1. Coordinates from RG2.1/quasi-split-root-group-coordinates (BT II 4.1.9–4.1.12, pp. 81–84).
2. Value sets from RG2.1/quasi-split-valuation (BT II 4.2.20–4.2.23), computing ω_{K'} on the sets {v : v + v̄ = u ū}.
3. Échelonnage and special vertices from RG2.1/echelonnage-root-system; hyperspecial vertices need G unramified (RG2.3/hyperspecial-vertices).

**Acceptance.**

- For K'/K unramified, G(O) for the reductive model given by the standard hermitian lattice is a hyperspecial vertex stabilizer.
- For K'/K ramified, no vertex of the apartment is hyperspecial.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.1.9–4.1.12 and 4.2.20–4.2.23, pp. 81–84, 97–99. Explicit structure and valuation of the root groups of SU_3 in the multipliable case, with value sets in the unramified and ramified cases.
- [Pol van Hoften (Appendix A by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*](https://arxiv.org/abs/2010.10496): Appendix A.3.6, pp. 60–61. Unitary root coordinates for the rank-one SU_3 subgroups.

<a id="RG2-1-apartment-action-kernel"></a>

### Kernel and image of the action on the apartment

Target `ReductiveGroupsPartII:RG2.1/apartment-action-kernel`. Theorem; suggested declaration `BruhatTits.Apartment.ker_action`.

The kernel of ν : N(K) → Aff(A) is Z(K)^1 = ker v (RG2.1/torus-valuation-map). ν(N(K)) ≅ N(K)/Z(K)^1 is an extension of W_0 by the translation lattice Λ = v(Z(K)), with no splitting asserted in general; it contains W_a as a normal subgroup, ν(N(K)) = W_a ⋊ Stab(C) for an alcove C, and the stabilizer Stab(C) is a finitely generated abelian group; for semisimple simply connected G, ν(N(K)) = W_a.

**Hypotheses.** φ a compatible discrete valuation of the rational root datum of G.

**Prerequisites.** [The apartment of a valued root datum](#RG2-1-apartment) (`ReductiveGroupsPartII:RG2.1/apartment`); [The affine Weyl group](#RG2-1-affine-weyl-group) (`ReductiveGroupsPartII:RG2.1/affine-weyl-group`); [The valuation homomorphism of the minimal Levi](#RG2-1-torus-valuation-map) (`ReductiveGroupsPartII:RG2.1/torus-valuation-map`).

**Construction or proof.**

1. A trivial apartment action has trivial relative Weyl image, by the faithful reflection action, so the element belongs to Z(K). Its translation is then ν(z), and the kernel is ker ν (BT I §6.2.10–6.2.11, pp. 122–123).
2. Image: N(K)/Z(K) = W_0 acts linearly and Z(K)/Z(K)^1 ≅ Λ (RG2.1/torus-valuation-map); He 2018 A8–A9 and Richarz §1.1 (p. 118).

**Acceptance.**

- For GL_n: N(K)/Z(K)^1 ≅ S_n ⋉ ℤ^n with the translation part acting through −ω on diagonal entries.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 6.2.10–6.2.11, pp. 122–123. The homomorphism ν of N into affine transformations of A, its kernel and the subgroup W.
- [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635): §1.1, p. 118 (arXiv p. 2). The action of N(F) on the apartment factors through N(F)/Z_c with Z_c the maximal compact subgroup of Z(F); the kernel of W̃ → Aff(A) is finite.

<a id="RG2-1-sl2-valued-root-datum"></a>

### The valued root datum of SL_2 and PGL_2

Target `ReductiveGroupsPartII:RG2.1/sl2-valued-root-datum`. Application; suggested declaration `BruhatTits.Examples.sl2_action_eq_affineWeyl`.

For G = SL_2 over K with diagonal torus T, root a(diag(t, t^{-1})) = t², U_a = {(1 x; 0 1)}, U_{−a} = {(1 0; x 1)}: φ_{±a}(x_±(x)) = ω(x) is a compatible valuation. Identify A with ℝ so that the coroot a^∨ (t ↦ diag(t, t^{-1})) is 1; then a(x) = 2x, the affine roots are ±a + k (k ∈ ℤ), the walls are the points of ½ℤ, diag(t, t^{-1}) acts by translation by −ω(t), the Weyl element by x ↦ −x, W_a is the infinite dihedral group generated by the reflections in 0 and ½ (with translation subgroup ℤ), and ν(N(K)) = W_a. For PGL_2 with the image of the diagonal torus, the same apartment and walls occur, but the image of diag(ϖ, 1) acts by translation by −½, one wall spacing, which is not in W_a; hence ν(N(K))/W_a ≅ ℤ/2, matching π₁(PGL_2) = ℤ/2 and π₁(SL_2) = 0.

**Hypotheses.** K henselian discretely valued; ω normalized, ω(ϖ) = 1.

**Prerequisites.** [The affine Weyl group](#RG2-1-affine-weyl-group) (`ReductiveGroupsPartII:RG2.1/affine-weyl-group`); [Kernel and image of the action on the apartment](#RG2-1-apartment-action-kernel) (`ReductiveGroupsPartII:RG2.1/apartment-action-kernel`); [The algebraic fundamental group](#RG2-1-algebraic-fundamental-group) (`ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`).

**Construction or proof.**

1. Direct verification of V0–V5 (RG2.1/valuation-of-root-datum) using x_−(x^{-1}) x_+(x) x_−(x^{-1}) ∈ M_a.
2. Compute ν on T(K) and N(K) (RG2.1/apartment, RG2.1/torus-valuation-map); compare with W_a (RG2.1/affine-weyl-group) and π₁ (RG2.1/algebraic-fundamental-group).

**Acceptance.**

- The quotient ν(N(K))/W_a is trivial for SL_2 and ℤ/2 for PGL_2, matching π₁(SL_2) = 0 and π₁(PGL_2) = ℤ/2.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 10.2 (Les groupes GL_n(K) et SL_n(K)), pp. 234–251. The valuations and apartments of GL_n and SL_n made explicit.

<a id="rg2-2"></a>

## RG2.2. Buildings and classical lattice models

Valued root data give the enlarged and reduced buildings, their metrics, facets and functorial maps. Lattice and norm models identify the constructions for classical groups and fix the rank-one counting conventions.

<a id="RG2-2-building"></a>

### Bruhat–Tits building

Target `ReductiveGroupsPartII:RG2.2/building`. Construction; suggested declaration `BruhatTits.Building`.

For G connected reductive over a complete discretely valued field K with perfect residue field, use its compatible valued root datum and enlarged apartment A. Define P_x = ⟨N_x,U_{a,x,0}:a∈Φ⟩, where N_x is the pointwise normalizer stabilizer. On G(K)×A impose (g,x)∼(h,y) iff some n∈N(K) satisfies y=ν(n)x and g⁻¹hn∈P_x. This is an equivalence relation. Its quotient Bᵉ(G,K) has the left G(K)-action and injective apartment map x↦[1,x]; apartments are its translates and every point is in an apartment. Root groups fix their prescribed half-apartments. The reduced construction drops the central vector factor.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For G connected reductive over a complete discretely valued field K with perfect residue field, use its compatible valued root datum and enlarged apartment A.

**Prerequisites.** [The apartment of a valued root datum](#RG2-1-apartment) (`ReductiveGroupsPartII:RG2.1/apartment`); [Affine roots and root-group filtrations](#RG2-1-affine-roots-and-filtrations) (`ReductiveGroupsPartII:RG2.1/affine-roots-and-filtrations`); [Existence of the valued root datum](#RG2-1-valued-root-datum-existence) (`ReductiveGroupsPartII:RG2.1/valued-root-datum-existence`).

**Uses.**

- RG2.3: Integral models are attached to points and facets of this space..
- He 2021, §2.1: The affine alcove and Frobenius action live here..

**API.**

- `BruhatTits.Building` (constructor): The quotient Bᵉ(G,K).
- `BruhatTits.apartmentEmbedding` (data): A→Bᵉ sends x to [1,x].
- `BruhatTits.Building.eq_iff` (characterisation): Equality of quotient classes is exactly the stated normalizer/fixer relation.
- `BruhatTits.Building.apartmentEmbedding_injective` (other): The apartment map is injective.
- `BruhatTits.Building.smul_mk` (simp): k·[g,x]=[kg,x].
- `BruhatTits.Building.rootGroup_fixes` (relation): U_α fixes the half-apartment α≥0 pointwise.

**Unit tests.**

- `BruhatTits.Building.splitTorus` (computation): Bᵉ(G_m,K) is an affine real line with t acting by −ω(t).
- `BruhatTits.Building.trivialGroup` (degenerate): The trivial group has a singleton building.
- `BruhatTits.Building.apartment_torsor_compat` (compatibility): Its apartment map embeds the affine space of RG2.1 with the same translation action.
- `BruhatTits.Building.central_direction` (non-example): The GL_2 enlarged building is not its reduced tree: scalar uniformizers act nontrivially on the central line.

**Construction or proof.**

1. Construct P_x from valued root groups and normalizer fixers; the valued root datum gives nP_xn⁻¹=P_{ν(n)x} and N∩P_x=N_x.
2. These identities prove reflexivity, symmetry and transitivity of the stated relation; descend left multiplication to the quotient.
3. Use N∩P_x=N_x to prove apartment injectivity and the half-apartment fixer formula.

**Acceptance.**

- For a split torus the quotient is its real cocharacter apartment, not a point.
- For semisimple rank one the reduced quotient is a tree.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 7.1.8, 7.4.1–7.4.5, pp. 159–160, 170–173. Construct P_x from valued root groups and normalizer fixers; the valued root datum gives nP_xn⁻¹=P_{ν(n)x} and N∩P_x=N_x. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Bruhat–Tits building**.

<a id="RG2-2-finite-group-fixed-points-reductive"></a>

### Reductivity of prime-to-characteristic fixed groups

Target `ReductiveGroupsPartII:RG2.2/finite-group-fixed-points-reductive`. Theorem; suggested declaration `BruhatTits.finite_group_fixed_points_reductive`.

If H is a connected reductive group over a field k and a finite group Θ of k-automorphisms has order invertible in k, then (H^Θ)° is smooth connected reductive. Over a henselian discretely valued field with separably closed residue field of characteristic p, assume p∤|Θ| and Bruhat–Tits theory for H; the enlarged fixed building Bᵉ(H,K)^Θ is the enlarged building of (H^Θ)°. A semilinear tame Galois action is treated through restriction of scalars. Without the invertibility assumption neither reductivity nor the building comparison is asserted.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; If H is a connected reductive group over a field k and a finite group Θ of k-automorphisms has order invertible in k, then (H^Θ)° is smooth connected reductive.

**Prerequisites.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`; [Edixhoven's tame fixed-point theorem](#RG2-0a-tame-fixed-points-of-weil-restriction) (`ReductiveGroupsPartII:RG2.0a/tame-fixed-points-of-weil-restriction`).

**Construction or proof.**

1. Average infinitesimal invariants to get smooth fixed points and use the prime-to-characteristic reductivity theorem.
2. Find invariant apartments and construct the fixed-point root charts as in Prasad §3.
3. Verify their valued-root and fixer properties; the resulting building is the fixed subspace.

**Acceptance.**

- A finite prime-to-p diagram automorphism has a reductive connected fixed group.

**Sources.**

- [Gopal Prasad, *Finite group actions on reductive groups and buildings and tamely-ramified descent in Bruhat–Tits theory*](https://arxiv.org/abs/1705.02906): Introduction, pp. 1–2; §2 and Theorem 3.17, pp. 7–17. Average infinitesimal invariants to get smooth fixed points and use the prime-to-characteristic reductivity theorem. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-building-apartment-axioms"></a>

### Apartments, transitions and retractions

Target `ReductiveGroupsPartII:RG2.2/building-apartment-axioms`. Theorem; suggested declaration `BruhatTits.building_apartment_axioms`.

Any two facets, and hence any two points, of Bᵉ lie in a common apartment. The intersection of two apartments is closed convex and a union of facets; an element of G(K) carries either apartment to the other fixing the intersection pointwise. Transition maps are affine and preserve affine roots. For an apartment and an alcove in it, construct the alcove-centered retraction, equal to the identity on that apartment. Its restriction to any apartment containing that alcove is the unique transition fixing the alcove.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; Any two facets, and hence any two points, of Bᵉ lie in a common apartment.

**Prerequisites.** [Bruhat–Tits building](#RG2-2-building) (`ReductiveGroupsPartII:RG2.2/building`).

**Construction or proof.**

1. Apply the valued Bruhat decompositions to place the chosen pair in a translate of the base apartment.
2. Use the normalizer/fixer intersection formula to obtain transitions agreeing pointwise on intersections.
3. Glue those transitions over apartments containing the alcove; the overlap identity gives a well-defined retraction.

**Acceptance.**

- In the SL_2 tree two vertices lie on a common bi-infinite apartment.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 7.4.8, 7.4.18–7.4.19, pp. 172–175. Apply the valued Bruhat decompositions to place the chosen pair in a translate of the base apartment. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-enlarged-and-reduced-building"></a>

### Reduced and enlarged buildings

Target `ReductiveGroupsPartII:RG2.2/enlarged-and-reduced-building`. Construction; suggested declaration `BruhatTits.ReducedBuilding`.

For G connected reductive over K, construct the reduced building Bʳ=B(Gad,K) and the affine central factor AZ under VZ=X_*(A_G)⊗ℝ. The enlarged building is Bᵉ≅Bʳ×AZ, with G(K) acting on AZ by the negative valuations of rational characters. Its projection to Bʳ is equivariant and identifies apartments and facets after quotienting the central translations. A choice of central origin writes AZ as VZ; this origin is not part of the canonical building. A central isogeny induces an isomorphism of reduced buildings, whereas a central torus extension can change the enlarged dimension.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For G connected reductive over K, construct the reduced building Bʳ=B(Gad,K) and the affine central factor AZ under VZ=X_*(A_G)⊗ℝ.

**Prerequisites.** [Bruhat–Tits building](#RG2-2-building) (`ReductiveGroupsPartII:RG2.2/building`); [The valuation homomorphism of the minimal Levi](#RG2-1-torus-valuation-map) (`ReductiveGroupsPartII:RG2.1/torus-valuation-map`).

**Uses.**

- Fintzen §3: Twisted-Levi embedding choices translate central factors..
- KPZ §2.1.1: Model fixers use the enlarged building..

**API.**

- `BruhatTits.ReducedBuilding` (constructor): The building of Gad.
- `BruhatTits.centralVectorSpace` (data): VZ=X_*(A_G)⊗ℝ.
- `BruhatTits.toReducedBuilding` (projection): Equivariant projection Bᵉ→Bʳ.
- `BruhatTits.enlargedProductEquiv` (equivalence): With a central origin, Bᵉ≃Bʳ×VZ.
- `BruhatTits.toReducedBuilding_smul` (simp): The projection commutes with the group action.
- `BruhatTits.central_smul` (relation): Central elements act trivially on Bʳ and by character valuations on the central affine factor.

**Unit tests.**

- `BruhatTits.ReducedBuilding.gl2` (computation): The projection for GL_2 has real-line fibers.
- `BruhatTits.ReducedBuilding.semisimple` (degenerate): For semisimple G the central vector space is zero and Bᵉ=Bʳ.
- `BruhatTits.ReducedBuilding.apartment_compat` (compatibility): The apartment projection is precisely the common-root-kernel quotient of RG2.1.
- `BruhatTits.ReducedBuilding.torus` (non-example): Bʳ(G_m) is a point while Bᵉ(G_m) is a line.

**Construction or proof.**

1. Glue the reduced apartments using the derived root system.
2. Rational-character valuations give the central affine translation action.
3. The enlarged gluing relation decomposes into the reduced relation and the central affine coordinate.

**Acceptance.**

- GL_2 has a tree times a line; PGL_2 has the tree alone.

**Sources.**

- [Gopal Prasad, *Finite group actions on reductive groups and buildings and tamely-ramified descent in Bruhat–Tits theory*](https://arxiv.org/abs/1705.02906): Introduction, p. 2. Glue the reduced apartments using the derived root system. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §2.1, p. 44. Glue the reduced apartments using the derived root system. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-building-independence-of-choices"></a>

### Transport under auxiliary choices

Target `ReductiveGroupsPartII:RG2.2/building-independence-of-choices`. Theorem; suggested declaration `BruhatTits.building_independence_of_choices`.

Changing the maximal split torus, root coordinates or compatible base valuation transports Bᵉ equivariantly by affine isomorphisms preserving apartments, facets and root fixers. Once an apartment transport and central origin transport are fixed, its extension to the building is unique. Equipollent valuations give translations, while rescaling the field valuation gives a homothety after rescaling the apartment metric. Unrestricted uniqueness of an equivariant isometry is false in the presence of a split central torus.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; Changing the maximal split torus, root coordinates or compatible base valuation transports Bᵉ equivariantly by affine isomorphisms preserving apartments, facets and root fixers.

**Prerequisites.** [Bruhat–Tits building](#RG2-2-building) (`ReductiveGroupsPartII:RG2.2/building`); [Independence of choices](#RG2-1-transport-under-choices) (`ReductiveGroupsPartII:RG2.1/transport-under-choices`).

**Construction or proof.**

1. Conjugate maximal split tori using imported unvalued structure theory.
2. The affine transport preserves the root filtration/fixer relation.
3. Send [g,x] to [g,f(x)] and check the quotient relation and its inverse.

**Acceptance.**

- Translating the GL_1 apartment produces many equivariant isometries, so uniqueness needs the chosen apartment transport.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 7.4.3, pp. 171–172. Conjugate maximal split tori using imported unvalued structure theory. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §1.2 and §2.1, pp. 31–32, 43–44. Conjugate maximal split tori using imported unvalued structure theory. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-unramified-descent-of-building"></a>

### Unramified descent of buildings

Target `ReductiveGroupsPartII:RG2.2/unramified-descent-of-building`. Theorem; suggested declaration `BruhatTits.unramified_descent_of_building`.

For a finite unramified Galois extension K′/K of complete discretely valued fields, the natural injection identifies Bᵉ(G,K) with Bᵉ(G,K′)^Gal(K′/K); likewise for reduced buildings. For E a local field and L its completed maximal unramified extension, Bᵉ(G,E)=Bᵉ(G,L)^σ. Apartment fixed loci agree with the apartment of the descended maximal split torus when an appropriate Galois-stable torus is chosen. Facets over K are obtained by intersections with the fixed locus; they need not be whole facets over K′.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For a finite unramified Galois extension K′/K of complete discretely valued fields, the natural injection identifies Bᵉ(G,K) with Bᵉ(G,K′)^Gal(K′/K); likewise for reduced buildings.

**Prerequisites.** [Bruhat–Tits building](#RG2-2-building) (`ReductiveGroupsPartII:RG2.2/building`); [Valuations and apartments under unramified extension](#RG2-1-unramified-descent-of-valuation) (`ReductiveGroupsPartII:RG2.1/unramified-descent-of-valuation`); [The completed maximal unramified extension Ĕ](#RG2-0-completed-maximal-unramified-extension) (`ReductiveGroupsPartII:RG2.0/completed-maximal-unramified-extension`).

**Construction or proof.**

1. Descend the valued root datum and invariant apartment using the strict henselian construction.
2. Descend fixer charts to show every Galois-fixed point belongs to a descended apartment.
3. Pass to completion and arithmetic Frobenius for L.

**Acceptance.**

- An anisotropic unramified norm-one torus has a point as the invariant part of a split line.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 5.1.25–5.1.28, pp. 155–158. Descend the valued root datum and invariant apartment using the strict henselian construction. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §2.6.1, pp. 47–48. Descend the valued root datum and invariant apartment using the strict henselian construction. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-weil-restriction-building"></a>

### Buildings of Weil restrictions

Target `ReductiveGroupsPartII:RG2.2/weil-restriction-building`. Theorem; suggested declaration `BruhatTits.weil_restriction_building`.

For K′/K finite separable and H connected reductive over K′, identify Bᵉ(Res_{K′/K}H,K) with Bᵉ(H,K′), equivariantly for (Res H)(K)=H(K′). Relative apartments, facets and fixers correspond. Metrics are compared only after specifying the apartment scalar products and valuation normalization; no universal degree factor is asserted. Integral stabilizer-model Weil restriction is the separate RG2.3 comparison.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For K′/K finite separable and H connected reductive over K′, identify Bᵉ(Res_{K′/K}H,K) with Bᵉ(H,K′), equivariantly for (Res H)(K)=H(K′).

**Prerequisites.** [Bruhat–Tits building](#RG2-2-building) (`ReductiveGroupsPartII:RG2.2/building`); [Weil restriction of an affine group scheme](#RG2-0a-weil-restriction-group-scheme) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-group-scheme`).

**Construction or proof.**

1. Identify rational root groups and norm-normalized character valuations through the Weil functor.
2. Transport the apartment and point-fixer quotient relation.
3. The quotient bijection preserves the action and affine charts.

**Acceptance.**

- The building for Res_{K′/K}G_m is an affine line, not [K′:K] independent split directions.

**Sources.**

- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §2.1.2, p. 11. Identify rational root groups and norm-normalized character valuations through the Weil functor. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §2.1, p. 44. Identify rational root groups and norm-normalized character valuations through the Weil functor. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-gl-building-lattice-chains"></a>

### GL building through additive norms and lattice chains

Target `ReductiveGroupsPartII:RG2.2/gl-building-lattice-chains`. Construction; suggested declaration `BruhatTits.LatticeBuilding.AdditiveNorm`.

For finite-dimensional V over complete discretely valued K, identify Bᵉ(GL(V),K) with splittable additive norms α:V→ℝ∪{∞}: α(v)=∞ iff v=0, α(v+w)≥min(α(v),α(w)), α(cv)=ω(c)+α(v), with α(Σc_ie_i)=min_i(ω(c_i)+r_i) in some basis. The corresponding lattice function Λ_α(r)={v:α(v)≥r} is decreasing, left-continuous and satisfies Λ(r+1)=ϖΛ(r). Its finitely many jumps per period give a graded periodic lattice chain. Quotienting norms by addition of a real constant gives the reduced building; its vertices are lattice homothety classes. Unweighted chains describe facets, not every point of the enlarged building.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For finite-dimensional V over complete discretely valued K, identify Bᵉ(GL(V),K) with splittable additive norms α:V→ℝ∪{∞}: α(v)=∞ iff v=0, α(v+w)≥min(α(v),α(w)), α(cv)=ω(c)+α(v), with α(Σc_ie_i)=min_i(ω(c_i)+r_i) in some basis.

**Prerequisites.** [Bruhat–Tits building](#RG2-2-building) (`ReductiveGroupsPartII:RG2.2/building`); `mathlib:Submodule.IsLattice`.

**Uses.**

- KPZ §2.3.6: A determining lattice-chain segment forms the total lattice..
- RG2.3/lattice-chain-stabilizer-schemes: Integral automorphisms preserve the graded chain..

**API.**

- `BruhatTits.LatticeBuilding.AdditiveNorm` (constructor): The splittable additive norm with its scalar and ultrametric laws.
- `BruhatTits.LatticeBuilding.latticeFunction` (data): Λ(r)={v:α(v)≥r} as an O-submodule.
- `BruhatTits.LatticeBuilding.periodic` (relation): Λ(r+1)=ϖΛ(r).
- `BruhatTits.LatticeBuilding.normBuildingEquiv` (equivalence): Additive norms identify with the enlarged GL building.
- `BruhatTits.LatticeBuilding.action` (functoriality): (gα)(v)=α(g⁻¹v).
- `BruhatTits.LatticeBuilding.stabilizer` (characterisation): The stabilizer preserves every lattice and its grading.

**Unit tests.**

- `BruhatTits.LatticeBuilding.standard` (computation): α(x_1,…,x_n)=min_i ω(x_i) has lattice Λ(0)=O^n.
- `BruhatTits.LatticeBuilding.dimension_one` (degenerate): In dimension one additive norms form a real affine line.
- `BruhatTits.LatticeBuilding.isLattice_compat` (compatibility): Each Λ(r) is a Mathlib Submodule.IsLattice over O spanning V.
- `BruhatTits.LatticeBuilding.grading_needed` (non-example): Adding a nonintegral real constant changes the norm and enlarged point even when the ungraded periodic chain is unchanged.

**Construction or proof.**

1. Associate lattices to a split norm and recover the norm from the filtration thresholds.
2. Smith normal form yields a common splitting basis for two lattice functions.
3. Identify the norm apartment action and root fixers with the building quotient.

**Acceptance.**

- The standard lattice norm has fixer GL(V)(O).

**Sources.**

- [François Bruhat, Jacques Tits, *Schémas en groupes et immeubles des groupes classiques sur un corps local*](http://www.numdam.org/item/10.24033/bsmf.2006.pdf): Proposition 1.8, printed p. 267; Theorem 2.11, p. 283. Associate lattices to a split norm and recover the norm from the filtration thresholds. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.1.9, pp. 125–126. Associate lattices to a split norm and recover the norm from the filtration thresholds. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **GL building and lattice chains**.

<a id="RG2-2-building-metric"></a>

### Complete nonpositively curved building metric

Target `ReductiveGroupsPartII:RG2.2/building-metric`. Theorem; suggested declaration `BruhatTits.building_metric`.

Choose a W₀-invariant positive definite scalar product on the enlarged apartment vector space. Apartment distances glue to a G(K)-invariant complete geodesic metric on Bᵉ. Geodesics are the apartment line segments and are unique. For a midpoint m of x,y, d(z,m)²≤(d(z,x)²+d(z,y)²)/2−d(x,y)²/4. Alcove-centered retractions are 1-Lipschitz. Completeness is asserted for the discretely valued fields in this roadmap; a dense abstract valued datum requires its separate completeness hypothesis. No scalar-product normalization is canonical for a general reductive group.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; Choose a W₀-invariant positive definite scalar product on the enlarged apartment vector space.

**Prerequisites.** [Apartments, transitions and retractions](#RG2-2-building-apartment-axioms) (`ReductiveGroupsPartII:RG2.2/building-apartment-axioms`).

**Construction or proof.**

1. Transitions preserve the scalar product, so distance is independent of the common apartment.
2. Retractions prove the triangle inequality and the midpoint inequality; apartment segments give unique geodesics.
3. Use local finiteness in the local-field case and the discrete-building completeness argument for the completed unramified case.

**Acceptance.**

- The rank-one metric is the usual path metric on the geometric tree.
- For a split torus it is the chosen Euclidean metric.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 2.5.1–2.5.16, 3.2.1, 7.4.20, pp. 55–65, 74, 175. Transitions preserve the scalar product, so distance is independent of the common apartment. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-facets-and-special-points"></a>

### Facets and special points

Target `ReductiveGroupsPartII:RG2.2/facets-and-special-points`. Definition; suggested declaration `BruhatTits.BuildingFacet`.

The facets of the reduced building are translates of apartment sign-pattern facets; apartment transitions identify intersecting facets. Order F≤F′ by F⊂closure(F′). Alcoves are maximal facets and vertices minimal facets. An enlarged facet is the inverse image of a reduced facet, including the whole central direction. Specialness is tested in any containing apartment by the affine-root criterion of RG2.1. The reduced building is polysimplicial; its barycentric subdivision is simplicial. Hyperspecialness is the integral-model condition of RG2.3, not a synonym for specialness.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; The facets of the reduced building are translates of apartment sign-pattern facets; apartment transitions identify intersecting facets.

**Prerequisites.** [Apartments, transitions and retractions](#RG2-2-building-apartment-axioms) (`ReductiveGroupsPartII:RG2.2/building-apartment-axioms`); [Walls, alcoves and facets of the apartment](#RG2-1-affine-chamber-structure) (`ReductiveGroupsPartII:RG2.1/affine-chamber-structure`).

**Uses.**

- RG2.3/parahoric-group-scheme: The connected model depends on the facet..
- RG2.4/parahoric-double-cosets: Facet Weyl subgroups index parahoric cosets..

**API.**

- `BruhatTits.BuildingFacet.carrier` (data): The underlying subset of the building.
- `BruhatTits.BuildingFacet.closureLE` (relation): F≤F′ iff F⊂closure(F′).
- `BruhatTits.BuildingFacet.IsAlcove` (characterisation): Maximality in the reduced facet order.
- `BruhatTits.BuildingFacet.IsVertex` (characterisation): Minimality in that order.
- `BruhatTits.BuildingFacet.IsSpecial` (characterisation): Apartment specialness, independent of apartment.
- `BruhatTits.BuildingFacet.transport` (functoriality): gF has the transported facet and specialness.

**Unit tests.**

- `BruhatTits.BuildingFacet.sl2_edge` (computation): An open edge has its two vertices in its closure.
- `BruhatTits.BuildingFacet.rankZero` (degenerate): A rank-zero reduced building has one facet.
- `BruhatTits.BuildingFacet.apartment_compat` (compatibility): Restriction to the base apartment equals the RG2.1 sign-pattern partition.
- `BruhatTits.BuildingFacet.central_line_not_vertex` (non-example): An enlarged GL_1 facet is a real line and is not a singleton vertex.

**Construction or proof.**

1. Transfer the apartment partition through the action.
2. Use transition agreement to prove the transferred relation is independent of apartment.
3. The closure order is the apartment closure order and gives the polysimplicial complex.

**Acceptance.**

- In the rank-one tree every vertex is special but ramified unitary groups have no hyperspecial vertices.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 7.4.12–7.4.14, pp. 173–174. Transfer the apartment partition through the action. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §2.2, §2.4, pp. 44–46. Transfer the apartment partition through the action. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-tame-descent-of-building"></a>

### Tame descent of buildings

Target `ReductiveGroupsPartII:RG2.2/tame-descent-of-building`. Theorem; suggested declaration `BruhatTits.tame_descent_of_building`.

For a finite tamely ramified Galois extension K̃/K of complete discretely valued fields with perfect residue field, Bᵉ(G,K) is the fixed subspace Bᵉ(G,K̃)^Gal(K̃/K), and similarly for reduced buildings. This holds without assuming G is split over K̃. With valuations separately normalized by ω_K(ϖ_K)=ω_K̃(ϖ_K̃)=1, apartment vectors and distances scale by e(K̃/K); extending ω_K instead removes that scale. Wild extensions yield only inclusion and can have extra fixed points.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For a finite tamely ramified Galois extension K̃/K of complete discretely valued fields with perfect residue field, Bᵉ(G,K) is the fixed subspace Bᵉ(G,K̃)^Gal(K̃/K), and similarly for reduced buildings.

**Prerequisites.** [Unramified descent of buildings](#RG2-2-unramified-descent-of-building) (`ReductiveGroupsPartII:RG2.2/unramified-descent-of-building`); [Reductivity of prime-to-characteristic fixed groups](#RG2-2-finite-group-fixed-points-reductive) (`ReductiveGroupsPartII:RG2.2/finite-group-fixed-points-reductive`).

**Construction or proof.**

1. First descend the unramified part.
2. For tame inertia use prime-to-p fixed-point models and invariant apartments over a strictly henselian base.
3. Descend the residual Galois action and compare normalization of valuations.

**Acceptance.**

- In a wildly ramified Q_2 extension, extra Galois-fixed branches of the split rank-one tree can occur (Tits §2.6.1).

**Sources.**

- [Gopal Prasad, *Finite group actions on reductive groups and buildings and tamely-ramified descent in Bruhat–Tits theory*](https://arxiv.org/abs/1705.02906): §4, Theorems 4.4–4.6, pp. 18–20. First descend the unramified part. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): (2.1.3), p. 11. First descend the unramified part. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Tame descent of buildings**.

<a id="RG2-2-building-functoriality-central-extensions"></a>

### Central morphisms and reduced buildings

Target `ReductiveGroupsPartII:RG2.2/building-functoriality-central-extensions`. Theorem; suggested declaration `BruhatTits.building_functoriality_central_extensions`.

A central isogeny G→G′ induces a canonical equivariant isomorphism of reduced buildings. More generally a surjection with central torus kernel identifies derived reduced buildings and induces toral affine maps on enlarged buildings; central coordinates follow the cocharacter linear map. Once compatible origins are fixed these maps commute with towers and Galois actions. A central torus extension need not give an isomorphism of enlarged buildings.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; A central isogeny G→G′ induces a canonical equivariant isomorphism of reduced buildings.

**Prerequisites.** [Reduced and enlarged buildings](#RG2-2-enlarged-and-reduced-building) (`ReductiveGroupsPartII:RG2.2/enlarged-and-reduced-building`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

**Construction or proof.**

1. Identify the root groups through the central morphism.
2. The root valuations give identical reduced apartment gluing.
3. Adjoin the induced map on central affine factors.

**Acceptance.**

- SL_2→PGL_2 identifies their reduced trees; GL_2→PGL_2 drops the central line.

**Sources.**

- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.2.2–1.2.3, pp. 129–130, citing Landvogt 2.1.8. Identify the root groups through the central morphism. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-building-products-and-levis"></a>

### Products and Levi building embeddings

Target `ReductiveGroupsPartII:RG2.2/building-products-and-levis`. Theorem; suggested declaration `BruhatTits.building_products_and_levis`.

Products of connected reductive groups have product enlarged buildings. For a K-Levi M of a K-parabolic in G, construct an M(K)-equivariant toral affine embedding Bᵉ(M,K)→Bᵉ(G,K); its possible choices form translations in the appropriate split central directions of M. Relative roots and filtrations in M are restrictions of those of G. For the block Levi ∏GL(V_i), the embedding is the direct-sum map of additive norms. No canonical embedding without normalization is asserted.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; Products of connected reductive groups have product enlarged buildings.

**Prerequisites.** [Bruhat–Tits building](#RG2-2-building) (`ReductiveGroupsPartII:RG2.2/building`); [Reduced and enlarged buildings](#RG2-2-enlarged-and-reduced-building) (`ReductiveGroupsPartII:RG2.2/enlarged-and-reduced-building`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Construction or proof.**

1. The root datum of a product is a disjoint product, giving the product quotient.
2. For a Levi choose compatible apartments and restrict the root-fixer relation.
3. Transport through all M-apartments and account for central translation freedom.

**Acceptance.**

- The GL_1×GL_1 building maps onto a GL_2 apartment by its two diagonal norm coordinates.

**Sources.**

- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.2.2, p. 129, citing Landvogt 2.1.5–2.1.6. The root datum of a product is a disjoint product, giving the product quotient. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-gsp-building-self-dual-chains"></a>

### Symplectic building and self-dual lattice chains

Target `ReductiveGroupsPartII:RG2.2/gsp-building-self-dual-chains`. Theorem; suggested declaration `BruhatTits.gsp_building_self_dual_chains`.

For a nondegenerate alternating K-form ψ on V (with the classical-group hypotheses of BT84 and p≠2 for the KP applications), realize Bᵉ(GSp(V,ψ),K) inside the GL norm building by norms self-dual up to an additive shift. Equivalently graded periodic chains are stable under Λ↦Λ∨, with c(Λ∨)=−c(Λ)+m for a fixed shift m. Choose the self-dual indexing of KP18 (1.1.12), a∈{0,1}, and construct its symplectic total lattice and integral perfect form by the direct-sum construction of §1.2.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For a nondegenerate alternating K-form ψ on V (with the classical-group hypotheses of BT84 and p≠2 for the KP applications), realize Bᵉ(GSp(V,ψ),K) inside the GL norm building by norms self-dual up to an additive shift.

**Prerequisites.** [GL building through additive norms and lattice chains](#RG2-2-gl-building-lattice-chains) (`ReductiveGroupsPartII:RG2.2/gl-building-lattice-chains`).

**Construction or proof.**

1. Dualize lattice functions by the alternating pairing.
2. Identify the self-dual norms through apartment weights of GSp.
3. Assemble dual pairs in the chain segment to make the integral total form.

**Acceptance.**

- A self-dual O-lattice gives the standard hyperspecial symplectic point; a chain missing its dual fails the criterion.

**Sources.**

- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.1.11–1.1.12 and §1.2.19, pp. 126–127, 137–138. Dualize lattice functions by the alternating pairing. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-division-algebra-building"></a>

### Division-algebra lattice building

Target `ReductiveGroupsPartII:RG2.2/division-algebra-building`. Theorem; suggested declaration `BruhatTits.division_algebra_building`.

For a finite-dimensional central division algebra D/K with its extended valuation and V=D^m a right D-vector space, identify the enlarged building of GL_D(V) with splittable additive D-norms. The lattice functions are right O_D-lattices periodic with a D-uniformizer, with period equal to its K-normalized valuation; their reduced homothety classes and graded chains give vertices and facets. This group is the inner form GL_m(D), not Res_{D/K}GL_m, since D is not a commutative field extension.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For a finite-dimensional central division algebra D/K with its extended valuation and V=D^m a right D-vector space, identify the enlarged building of GL_D(V) with splittable additive D-norms.

**Prerequisites.** [GL building through additive norms and lattice chains](#RG2-2-gl-building-lattice-chains) (`ReductiveGroupsPartII:RG2.2/gl-building-lattice-chains`).

**Construction or proof.**

1. Use the division-algebra valuation in the additive norm axioms.
2. Recover periodic O_D-lattices and simultaneous splitting bases.
3. Identify their apartments and fixer groups with the inner-form root valuations.

**Acceptance.**

- For m=1 the reduced building is a point and D× acts on the enlarged line through its valuation.

**Sources.**

- [François Bruhat, Jacques Tits, *Schémas en groupes et immeubles des groupes classiques sur un corps local*](http://www.numdam.org/item/10.24033/bsmf.2006.pdf): §1, Proposition 1.8, p. 267; §2, Theorem 2.11, p. 283 (right division-algebra norms). Use the division-algebra valuation in the additive norm axioms. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §2.9, p. 49. Use the division-algebra valuation in the additive norm axioms. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-building-of-tori-and-anisotropic-groups"></a>

### Torus and anisotropic building examples

Target `ReductiveGroupsPartII:RG2.2/building-of-tori-and-anisotropic-groups`. Application; suggested declaration `BruhatTits.building_of_tori_and_anisotropic_groups`.

For a K-torus T with maximal split subtorus S_T, the enlarged building is an affine space under X_*(S_T)⊗ℝ, acted on through the character-valuation translations; the reduced building is a point. For a connected reductive G anisotropic modulo its center, the reduced building is a point and G(E) is compact modulo its rational center. If G is anisotropic (including the center), its enlarged building is a point and G(E) is compact. An anisotropic norm-one torus is the basic example.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For a K-torus T with maximal split subtorus S_T, the enlarged building is an affine space under X_*(S_T)⊗ℝ, acted on through the character-valuation translations; the reduced building is a point.

**Prerequisites.** [Reduced and enlarged buildings](#RG2-2-enlarged-and-reduced-building) (`ReductiveGroupsPartII:RG2.2/enlarged-and-reduced-building`); [Nonsplit tori: apartments and Kottwitz maps](#RG2-1-nonsplit-torus-example) (`ReductiveGroupsPartII:RG2.1/nonsplit-torus-example`).

**Construction or proof.**

1. The empty-root reduced gluing gives a singleton.
2. Adjoin precisely the split central vector space.
3. Use the valuation map and anisotropic boundedness to compare compactness.

**Acceptance.**

- G_m(E) is not compact despite its one-point reduced building; an unramified norm-one torus is compact.

**Sources.**

- [Gopal Prasad, *Finite group actions on reductive groups and buildings and tamely-ramified descent in Bruhat–Tits theory*](https://arxiv.org/abs/1705.02906): Introduction, p. 2. The empty-root reduced gluing gives a singleton. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §2.1, p. 44. The empty-root reduced gluing gives a singleton. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-bruhat-tits-fixed-point-theorem"></a>

### Bruhat–Tits fixed point theorem

Target `ReductiveGroupsPartII:RG2.2/bruhat-tits-fixed-point-theorem`. Theorem; suggested declaration `BruhatTits.bruhat_tits_fixed_point_theorem`.

A group acting by isometries on Bᵉ with a bounded orbit fixes a point: the bounded orbit has a unique circumcenter. In particular, an algebraically bounded subgroup of G(K) fixes a point. For K a local field algebraic boundedness is relative compactness, so every compact subgroup fixes a point in the enlarged building. Conversely its point stabilizers are bounded and compact for a local field. A subgroup bounded only in the reduced building can translate the central direction and need not fix an enlarged point. For semisimple simply connected G, maximal bounded subgroups are exactly vertex stabilizers; for general G allow stabilizers of interior points such as edge barycenters.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; A group acting by isometries on Bᵉ with a bounded orbit fixes a point: the bounded orbit has a unique circumcenter.

**Prerequisites.** [Complete nonpositively curved building metric](#RG2-2-building-metric) (`ReductiveGroupsPartII:RG2.2/building-metric`); [The topological group of rational points](#RG2-0-points-topological-group) (`ReductiveGroupsPartII:RG2.0/points-topological-group`).

**Construction or proof.**

1. The midpoint inequality makes minimizing sequences for the radius of a bounded set Cauchy.
2. Completeness gives the unique center, preserved by every isometry preserving the set.
3. Compare algebraic boundedness and orbits using the root-chart action; over a local field use compactness.

**Acceptance.**

- GL_n(O) fixes its standard lattice norm.
- The powers of a scalar uniformizer fix the reduced GL_n building but have no enlarged fixed point.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 3.2.1–3.2.4, pp. 74–76. The midpoint inequality makes minimizing sequences for the radius of a bounded set Cauchy. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §2.3.1 and §3.2, pp. 45, 50–51. The midpoint inequality makes minimizing sequences for the radius of a bounded set Cauchy. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Bruhat–Tits fixed point theorem**.

<a id="RG2-2-stabilizers-and-fixers"></a>

### Pointwise fixers and setwise stabilizers

Target `ReductiveGroupsPartII:RG2.2/stabilizers-and-fixers`. Definition; suggested declaration `BruhatTits.pointwiseFixer`.

For a nonempty subset Ω of Bᵉ, Fix(Ω)={g:∀x∈Ω,gx=x} and Stab(Ω)={g:gΩ=Ω}; these are subgroups and Fix(Ω) is normal in Stab(Ω). For bounded Ω contained in an apartment, Fix(Ω) is generated by the normalizer fixer and root filtrations whose half-apartments contain Ω. Over a local field, pointwise fixers of bounded nonempty subsets of the enlarged building are compact open. Reduced pointwise fixers are compact modulo the full rational center. Fixing an open facet pointwise differs from stabilizing it as a set or fixing one nongeneric interior point.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For a nonempty subset Ω of Bᵉ, Fix(Ω)={g:∀x∈Ω,gx=x} and Stab(Ω)={g:gΩ=Ω}; these are subgroups and Fix(Ω) is normal in Stab(Ω).

**Prerequisites.** [Bruhat–Tits building](#RG2-2-building) (`ReductiveGroupsPartII:RG2.2/building`); [Facets and special points](#RG2-2-facets-and-special-points) (`ReductiveGroupsPartII:RG2.2/facets-and-special-points`); [The valuation homomorphism of the minimal Levi](#RG2-1-torus-valuation-map) (`ReductiveGroupsPartII:RG2.1/torus-valuation-map`).

**Uses.**

- van Hoften, Lemma 2.2.2: Full fixers are compared with Kottwitz kernels..
- KPZ §2.1.1: Stabilizer models use enlarged point stabilizers..

**API.**

- `BruhatTits.pointwiseFixer` (constructor): The subgroup of elements fixing every point of Ω.
- `BruhatTits.setwiseStabilizer` (constructor): The subgroup preserving Ω as a set.
- `BruhatTits.mem_pointwiseFixer` (simp): Membership iff every point is fixed.
- `BruhatTits.fixer_antitone` (relation): Ω⊂Ω′ implies Fix(Ω′)≤Fix(Ω).
- `BruhatTits.fixer_conj` (functoriality): Fix(gΩ)=gFix(Ω)g⁻¹.
- `BruhatTits.fixer_compactOpen` (other): For a local field and bounded apartment Ω, the enlarged fixer is compact open.

**Unit tests.**

- `BruhatTits.pointwiseFixer.gl2_lattice` (computation): The standard GL_2 lattice norm has fixer GL_2(O).
- `BruhatTits.pointwiseFixer.singleton` (degenerate): The pointwise fixer of {x} is the point stabilizer.
- `BruhatTits.pointwiseFixer.mulAction_compat` (compatibility): It is the intersection of Mathlib MulAction stabilizers of the points.
- `BruhatTits.pointwiseFixer.edge_inversion` (non-example): For PGL_2 the edge setwise stabilizer strictly contains its pointwise fixer.

**Construction or proof.**

1. Intersect point stabilizers to define Fix; preservation of the subset defines Stab.
2. The root-group fixer formula follows from the quotient and normalizer intersection.
3. For bounded subsets of an apartment, discrete affine roots give finitely many effective depth bounds; use integral compactness and open root filtrations.

**Acceptance.**

- PGL_2 has an element inverting an edge, which fixes its midpoint but does not fix the edge pointwise.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 7.1.8, 7.4.4, pp. 159–160, 172. Intersect point stabilizers to define Fix; preservation of the subset defines Stab. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §3.1–3.2, pp. 50–51. Intersect point stabilizers to define Fix; preservation of the subset defines Stab. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-building-cocompact-action"></a>

### Finite facet orbits and cocompactness

Target `ReductiveGroupsPartII:RG2.2/building-cocompact-action`. Theorem; suggested declaration `BruhatTits.building_cocompact_action`.

For a connected reductive group over a local field, the type-preserving subgroup acts transitively on alcoves of the reduced building, with closed base alcove a compact fundamental domain. There are finitely many orbits of reduced facets. On the enlarged building a compact fundamental domain also includes a fundamental parallelepiped for the rational-character translation lattice; equivalently one may first quotient the split central direction. Do not call an enlarged alcove closure compact when its central factor is nonzero.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For a connected reductive group over a local field, the type-preserving subgroup acts transitively on alcoves of the reduced building, with closed base alcove a compact fundamental domain.

**Prerequisites.** [Facets and special points](#RG2-2-facets-and-special-points) (`ReductiveGroupsPartII:RG2.2/facets-and-special-points`); [Reduced and enlarged buildings](#RG2-2-enlarged-and-reduced-building) (`ReductiveGroupsPartII:RG2.2/enlarged-and-reduced-building`); [The affine Weyl group](#RG2-1-affine-weyl-group) (`ReductiveGroupsPartII:RG2.1/affine-weyl-group`).

**Construction or proof.**

1. The affine Weyl subgroup is transitive on alcoves in an apartment.
2. Use apartment existence and root-group fixers to extend this to all alcoves.
3. The base alcove has finitely many face types; adjoin a compact translation parallelepiped in central directions.

**Acceptance.**

- SL_2 has two vertex types and one edge type.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 7.3.4, 7.4.18, pp. 168–169, 174–175. The affine Weyl subgroup is transitive on alcoves in an apartment. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §2.5, pp. 46–47. The affine Weyl subgroup is transitive on alcoves in an apartment. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-building-field-extension-embedding"></a>

### Building embeddings under field extensions

Target `ReductiveGroupsPartII:RG2.2/building-field-extension-embedding`. Theorem; suggested declaration `BruhatTits.building_field_extension_embedding`.

For finite separable extensions K′/K in a fixed algebraic closure construct a compatible family of G(K)-equivariant injective maps Bᵉ(G,K)→Bᵉ(G,K′), affine on apartments placed inside extension apartments. For Galois extensions the image is fixed by Gal(K′/K), with equality for tame extensions. Under separately integral-normalized valuations vectors scale by the ramification index. The maps commute with towers. A hyperspecial model base-changes to a reductive model and thus a hyperspecial point; that assertion belongs with RG2.3 hyperspecial models and is not used to construct the embeddings.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For finite separable extensions K′/K in a fixed algebraic closure construct a compatible family of G(K)-equivariant injective maps Bᵉ(G,K)→Bᵉ(G,K′), affine on apartments placed inside extension apartments.

**Prerequisites.** [Transport under auxiliary choices](#RG2-2-building-independence-of-choices) (`ReductiveGroupsPartII:RG2.2/building-independence-of-choices`); [Tame descent of buildings](#RG2-2-tame-descent-of-building) (`ReductiveGroupsPartII:RG2.2/tame-descent-of-building`).

**Construction or proof.**

1. Extend to a Galois closure and the canonical extension-building embedding.
2. Restrict to the intermediate field fixed loci and descend apartments.
3. Check tower coherence with the canonical affine apartment maps.

**Acceptance.**

- For split SL_2 an edge is subdivided into e edges after a ramified extension with the integral valuation convention.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 5.1.1–5.1.4, pp. 143–146. Extend to a Galois closure and the canonical extension-building embedding. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §2.6, pp. 47–48. Extend to a Galois closure and the canonical extension-building embedding. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-twisted-levi-subgroup"></a>

### Tame twisted Levi subgroups

Target `ReductiveGroupsPartII:RG2.2/twisted-levi-subgroup`. Definition; suggested declaration `BruhatTits.TwistedLevi.IsTwistedLevi`.

A twisted Levi subgroup M of G over K is a closed connected reductive K-subgroup which becomes a Levi subgroup after a finite separable extension. It is tame if such an extension can be chosen tame. For a tame twisted Levi, a normalized Levi embedding over a tame splitting extension descends to an M(K)-equivariant embedding of enlarged buildings. Its image as a subset is independent of allowed translations by the split center of M, although the pointwise embedding depends on normalization.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; A twisted Levi subgroup M of G over K is a closed connected reductive K-subgroup which becomes a Levi subgroup after a finite separable extension.

**Prerequisites.** [Products and Levi building embeddings](#RG2-2-building-products-and-levis) (`ReductiveGroupsPartII:RG2.2/building-products-and-levis`); [Tame descent of buildings](#RG2-2-tame-descent-of-building) (`ReductiveGroupsPartII:RG2.2/tame-descent-of-building`).

**Uses.**

- Fintzen §3, Definition 3.10: Mixed-depth groups use the embedded building..
- RG2.3/moy-prasad-isomorphism: Filtration intersection and equivariance are required..

**API.**

- `BruhatTits.TwistedLevi.IsTwistedLevi` (characterisation): Becomes a Levi after finite separable extension.
- `BruhatTits.TwistedLevi.IsTame` (characterisation): One such extension is tame.
- `BruhatTits.TwistedLevi.buildingEmbedding` (data): A normalized embedding Bᵉ(M)→Bᵉ(G).
- `BruhatTits.TwistedLevi.buildingEmbedding_equivariant` (relation): The map is M(K)-equivariant.
- `BruhatTits.TwistedLevi.image_independent` (other): The image is independent of compatible central translations.
- `BruhatTits.TwistedLevi.filtration_inter` (compatibility): M_{x,r}=M(K)∩G_{x,r} for x in its building image and group depths r≥0.

**Unit tests.**

- `BruhatTits.TwistedLevi.split_block` (computation): The block diagonal GL_a×GL_b is a split tame Levi of GL_{a+b}.
- `BruhatTits.TwistedLevi.self` (degenerate): G is a tame twisted Levi of itself with identity embedding.
- `BruhatTits.TwistedLevi.levi_compat` (compatibility): For a rational Levi the embedding agrees with the preceding Levi construction after the same normalization.
- `BruhatTits.TwistedLevi.unipotent_not_levi` (non-example): A nontrivial unipotent root group is not a twisted Levi.

**Construction or proof.**

1. Use the separable splitting extension to test the Levi condition.
2. For tame M choose compatible equivariant apartment embeddings.
3. Apply tame building descent; central translations change parametrization without changing the image.

**Acceptance.**

- A tamely split maximal torus is a tame twisted Levi.

**Sources.**

- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): Definition 3.3, Remark 3.9, pp. 11–13. Use the separable splitting extension to test the Levi condition. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-toral-embedding-into-gl-building"></a>

### Toral embeddings for faithful representations

Target `ReductiveGroupsPartII:RG2.2/toral-embedding-into-gl-building`. Theorem; suggested declaration `BruhatTits.toral_embedding_into_gl_building`.

For a faithful K-representation ρ:G→GL(V), construct, with chosen compatible apartment normalization, a G(K)-equivariant toral map Bᵉ(G,K)→Bᵉ(GL(V),K) carrying cocharacter affine coordinates through ρ. State injectivity and metric scaling against the representation and chosen scalar products, rather than a universal isometry. Over an unramified closure require the compatible base point and Galois-equivariant normalization for descent. For the irreducible minuscule representation in KP18, two such normalized maps differ by a constant translation of the target norm.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For a faithful K-representation ρ:G→GL(V), construct, with chosen compatible apartment normalization, a G(K)-equivariant toral map Bᵉ(G,K)→Bᵉ(GL(V),K) carrying cocharacter affine coordinates through ρ.

**Prerequisites.** [GL building through additive norms and lattice chains](#RG2-2-gl-building-lattice-chains) (`ReductiveGroupsPartII:RG2.2/gl-building-lattice-chains`); [Products and Levi building embeddings](#RG2-2-building-products-and-levis) (`ReductiveGroupsPartII:RG2.2/building-products-and-levis`).

**Construction or proof.**

1. Map a maximal split apartment through its weight decomposition in V.
2. Choose compatible target norms fixed by the root-chart groups and transport by G(K).
3. Apply the Landvogt uniqueness conditions used in KP18; record central translation freedom.

**Acceptance.**

- For a diagonal torus in GL_n, the map is the usual weight-coordinate apartment.

**Sources.**

- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.2.2 and Corollary 1.2.11, pp. 129, 134–135; Remark 1.2.7, p. 132. Map a maximal split apartment through its weight decomposition in V. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-sl2-tree"></a>

### Bruhat–Tits tree

Target `ReductiveGroupsPartII:RG2.2/sl2-tree`. Construction; suggested declaration `BruhatTits.sl2_tree`.

For a local field E with O, uniformizer ϖ and residue cardinality q, the reduced SL_2/PGL_2 building has vertices the homothety classes of O-lattices in E² and adjacent vertices when representatives satisfy ϖΛ⊊Λ′⊊Λ with Λ/Λ′ one-dimensional over the residue field. It is a connected acyclic (q+1)-regular graph; its geometric realization is the reduced metric building. SL_2(E) and PSL_2(E) have two vertex orbits and act without inversion. PGL_2(E) is vertex-transitive and contains edge inversions.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For a local field E with O, uniformizer ϖ and residue cardinality q, the reduced SL_2/PGL_2 building has vertices the homothety classes of O-lattices in E² and adjacent vertices when representatives satisfy ϖΛ⊊Λ′⊊Λ with Λ/Λ′ one-dimensional over the residue field.

**Prerequisites.** [GL building through additive norms and lattice chains](#RG2-2-gl-building-lattice-chains) (`ReductiveGroupsPartII:RG2.2/gl-building-lattice-chains`); [Complete nonpositively curved building metric](#RG2-2-building-metric) (`ReductiveGroupsPartII:RG2.2/building-metric`).

**Uses.**

- Calegari–Geraghty, Remark 9.7: Vertex and edge stabilizers give Ihara amalgamation..
- RG2.3/fixer-versus-parahoric: Edge inversions test the full-stabilizer distinction..

**API.**

- `BruhatTits.Tree.Vertex` (constructor): Homothety classes of O-lattices in E².
- `BruhatTits.Tree.adj` (relation): Adjacency is the stated length-one lattice inclusion.
- `BruhatTits.Tree.graph` (structure): The SimpleGraph on these classes.
- `BruhatTits.Tree.isTree` (other): The graph is connected and acyclic.
- `BruhatTits.Tree.neighborEquiv` (equivalence): Neighbors of [Λ] correspond to lines in Λ/ϖΛ.
- `BruhatTits.Tree.buildingEquiv` (equivalence): The geometric tree is the reduced rank-one building.

**Unit tests.**

- `BruhatTits.Tree.q_two` (computation): Over Q_2 each vertex has three neighbors.
- `BruhatTits.Tree.no_loops` (degenerate): A vertex is not adjacent to itself.
- `BruhatTits.Tree.lattice_compat` (compatibility): The standard vertex comes from the Mathlib O-submodule O², modulo homothety.
- `BruhatTits.Tree.sl2_not_transitive` (non-example): SL_2 has two vertex orbits although PGL_2 has one.

**Construction or proof.**

1. Represent vertices by homothety classes of lattices and flags in Λ/ϖΛ.
2. Elementary divisors give connectedness and the unique geodesic, proving acyclicity.
3. Determinant-valuation parity distinguishes the two SL_2 vertex orbits; diag(ϖ,1) in PGL_2 inverts a suitable edge after a permutation.

**Acceptance.**

- There are q+1 neighbors of the standard vertex.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): §10.2.1–10.2.9, printed pp. 234–239; building construction §7.4.2, p. 171. Represent vertices by homothety classes of lattices and flags in Λ/ϖΛ. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §2.7 and §2.9, pp. 48–49. Represent vertices by homothety classes of lattices and flags in Λ/ϖΛ. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Bruhat–Tits tree**.

<a id="RG2-2-minuscule-toral-embedding"></a>

### Minuscule toral embeddings and descent

Target `ReductiveGroupsPartII:RG2.2/minuscule-toral-embedding`. Theorem; suggested declaration `BruhatTits.minuscule_toral_embedding`.

Under KP18 §1.2 hypotheses (G split over a tame extension, ρ a faithful sum of minuscule representations, and the stated Galois-stable lattice choices), the toral representation map can be chosen Galois-equivariant over the maximal unramified extension and descends to K. For each split minuscule summand, choose a lattice stable under the split hyperspecial model, and transport its additive norm. The maps fit the tame restriction-of-scalars diagrams (1.3.11)–(1.3.12). The extension to a closed immersion of fixer models requires the additional smooth-closure arguments of RG2.3.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; Under KP18 §1.2 hypotheses (G split over a tame extension, ρ a faithful sum of minuscule representations, and the stated Galois-stable lattice choices), the toral representation map can be chosen Galois-equivariant over the maximal unramified extension and descends to K.

**Prerequisites.** [Toral embeddings for faithful representations](#RG2-2-toral-embedding-into-gl-building) (`ReductiveGroupsPartII:RG2.2/toral-embedding-into-gl-building`); [Tame descent of buildings](#RG2-2-tame-descent-of-building) (`ReductiveGroupsPartII:RG2.2/tame-descent-of-building`); [Minuscule coweights and the dominance order](#RG2-1-minuscule-coweight) (`ReductiveGroupsPartII:RG2.1/minuscule-coweight`).

**Construction or proof.**

1. Use minuscule weights and stable lattices to choose the split apartment maps.
2. Normalize the semilinear maps so they commute with Galois; check equality using minuscule uniqueness.
3. Descend via the tame fixed-building comparison and form the restriction-of-scalars diagram.

**Acceptance.**

- The standard GL_n representation gives the identity lattice-building map.

**Sources.**

- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): Proposition 1.2.3, Lemma 1.2.5, Proposition 1.2.21, §§1.2.22–1.2.26 and (1.3.11)–(1.3.12), pp. 130–140, 142–143. Use minuscule weights and stable lattices to choose the split apartment maps. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-2-ihara-amalgam"></a>

### Ihara amalgamation

Target `ReductiveGroupsPartII:RG2.2/ihara-amalgam`. Theorem; suggested declaration `BruhatTits.ihara_amalgam`.

For E a nonarchimedean local field, choose adjacent vertices v₀,v₁ in the rank-one tree. SL_2(E) is the amalgamated product of their stabilizers SL_2(O) and gSL_2(O)g⁻¹, g=diag(1,ϖ), over their intersection Γ₀(ϖ)={a∈SL_2(O):a₂₁∈ϖO}. The same statement holds for PSL_2 with the images of these groups. The quotient graph is an edge and the action has no inversions. PGL_2 does not admit this vertex-stabilizer amalgam because its action identifies the vertices and inverts edges.

**Hypotheses.** K is complete discretely valued with perfect residue field; G is connected reductive, with its compatible valued root data; For E a nonarchimedean local field, choose adjacent vertices v₀,v₁ in the rank-one tree.

**Prerequisites.** [Bruhat–Tits tree](#RG2-2-sl2-tree) (`ReductiveGroupsPartII:RG2.2/sl2-tree`); `mathlib:Monoid.PushoutI`.

**Construction or proof.**

1. Use the two vertex orbits and one edge orbit to obtain an edge fundamental domain.
2. The tree normal-form argument shows the vertex-stabilizer amalgam maps injectively and surjectively to SL_2(E).
3. Quotient by the common central subgroup for PSL_2 and compare with edge inversions in PGL_2.

**Acceptance.**

- The two stabilizers generate SL_2(E), whereas edge inversion cannot be generated in that amalgam action.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): §10.2.1–10.2.9, printed pp. 234–239, with the building construction §7.4.2, p. 171. The explicit SL₂ root datum and lattice fixers give the action on the rank-one tree. The amalgam conclusion follows from its edge fundamental domain and absence of inversions, using the elementary normal-form argument in the proof outline.
- [Frank Calegari and David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*](https://math.uchicago.edu/~fcale/papers/CG.pdf): Remark 9.7, author-hosted publisher PDF p. 122, citing Serre, Trees, II.1.4. Use the two vertex orbits and one edge orbit to obtain an edge fundamental domain. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Ihara amalgamation**.

<a id="rg2-3"></a>

## RG2.3. Smooth models, parahorics and depth filtrations

Smooth affine models, Néron tori, schematic closures and connected parahorics give integral realizations of the building. This layer also supplies reductive quotients, Moy–Prasad filtrations, mock exponentials and the Lang lifting statements used by arithmetic consumers.

<a id="RG2-3-lang-theorem"></a>

### Lang's theorem

Target `ReductiveGroupsPartII:RG2.3/lang-theorem`. Theorem; suggested declaration `Lang.lang_surjective`.

Let H be a smooth connected algebraic group over a finite field F_q (in particular any smooth connected affine F_q-group), with q-Frobenius F acting on H(F̄_q). (a) The Lang map L: H → H, g ↦ g^{−1}F(g), is surjective on F̄_q-points (and is a finite étale surjective morphism). (b) H^1(Gal(F̄_q/F_q), H(F̄_q)) = 1 (continuous cohomology for the discrete module); equivalently every H-torsor over F_q (étale or fppf) has an F_q-point. (c) For an exact sequence 1 → H′ → H → H″ → 1 of smooth algebraic F_q-groups with H′ connected, H(F_q) → H″(F_q) is surjective. Connectedness is necessary: for H = ℤ/2 the Lang map is g ↦ 0 and H^1(F_q, ℤ/2) = ℤ/2.

**Hypotheses.** F_q a finite field; H smooth and connected over F_q; (c): H′ connected.

**Prerequisites.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `mathlib:groupCohomology`; `mathlib:groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`.

**Construction or proof.**

1. (a): for x ∈ H(F̄_q) the orbit map g ↦ g^{−1} x F(g) has finite fibres because f(g) = xF(g)x^{−1} has finitely many fixed points (a power of F is a Frobenius fixing x); choose a closed orbit, which then has dimension dim H, hence is all of H as H is connected; so e lies in every orbit (Milne iAG Prop. 27.54, Müller 2003).
2. (b): a 1-cocycle is determined by its value a at the arithmetic Frobenius generator; write a = g^{−1}F(g) by (a); then the cocycle is the coboundary of g on the generator and by continuity on Ẑ (Milne iAG Cor. 27.56).
3. (c): the fibre over h″ ∈ H″(F_q) is an H′-torsor over F_q, trivial by (b) (Lipnowski–Tsimerman §5.4.2 use).

**Acceptance.**

- For H = G_m: every u ∈ F̄_q^× is v^{q−1} for some v (Hilbert 90 / Lang), and H^1(F_q, G_m) = 0.
- For H = GL_n: every F_q-form of the trivial torsor is trivial (all F_q-vector spaces of dimension n are isomorphic).
- Non-example: H = μ_2 over F_q (q odd) is étale but disconnected and H^1 ≠ 0.

**Sources.**

- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): Proposition 27.54, Corollaries 27.55–27.56 and Notes, v2.00 pp. 487–488. Proves that g ↦ g·F(g^{−1}) is surjective for a Steinberg endomorphism of a connected group variety (Müller's proof), deduces surjectivity for the Frobenius of a connected group variety over a finite field and vanishing of H^1, and notes failure for nonconnected groups.
- [Michael Lipnowski, Jacob Tsimerman, *How large is A_g(F_q)?*](https://arxiv.org/abs/1511.02212): §5.4.2, arXiv v1 pp. 28–29. Applies Lang's theorem to the connected group SU_σ to deduce exactness of 1 → SU_σ(k_v) → U_σ(k_v) → U_h(k_v) → 1.
- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): proofs of Lemma 5.2.5 and Corollary 5.2.7, arXiv v2 pp. 52–53. Applies Lang's theorem to smooth connected groups over finite fields to find Frobenius-fixed points in torsors.

Atlas planet: **Lang's theorem**.

<a id="RG2-3-smooth-affine-model"></a>

### Smooth affine integral models

Target `ReductiveGroupsPartII:RG2.3/smooth-affine-model`. Definition; suggested declaration `BruhatTits.SmoothModel`.

For O a henselian discrete valuation ring with fraction field K and G a connected reductive K-group, a smooth affine integral model is a smooth affine O-group of finite presentation equipped with an identification of its generic fibre with G. Morphisms respect that identification (or a specified generic homomorphism). Flatness injects O-points into G(K). Its fibrewise identity component is the open smooth subgroup with connected fibres and unchanged generic fibre; it remains affine in this setting. Connectedness of the generic fibre alone does not force connected special fibre.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For O a henselian discrete valuation ring with fraction field K and G a connected reductive K-group, a smooth affine integral model is a smooth affine O-group of finite presentation equipped with an identification of its generic fibre with G.

**Prerequisites.** [Integral points of an affine model are compact open](#RG2-0-integral-points-compact-open) (`ReductiveGroupsPartII:RG2.0/integral-points-compact-open`); `tauceti:TauCeti.smoothCommHopfAlgProperty`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Uses.**

- BT II §4.6: Root charts are glued into smooth models..
- KPZ Proposition 2.2.2: The extension criterion compares stabilizer models..

**API.**

- `BruhatTits.SmoothModel.coordinateAlgebra` (data): The finitely presented smooth Hopf O-algebra.
- `BruhatTits.SmoothModel.genericEquiv` (equivalence): The identified generic fibre.
- `BruhatTits.SmoothModel.pointsEmbedding` (data): Integral points inject into G(K).
- `BruhatTits.SmoothModel.identityComponent` (constructor): The open model with connected fibres.
- `BruhatTits.SmoothModel.map` (functoriality): A morphism of models induces compatible maps on integral and generic points.

**Unit tests.**

- `BruhatTits.SmoothModel.gl` (computation): GL_n,O is a smooth affine model of GL_n,K.
- `BruhatTits.SmoothModel.trivial` (degenerate): The trivial group has the trivial smooth model.
- `BruhatTits.SmoothModel.hopf_compat` (compatibility): Points use the convolution group of the coordinate Hopf algebra.
- `BruhatTits.SmoothModel.connected_generic_insufficient` (non-example): The finite-type Néron model of a ramified torus can have disconnected special fibre.

**Construction or proof.**

1. Encode an affine group as a Hopf O-algebra and its generic identification as a Hopf isomorphism after tensoring with K.
2. Flatness and O⊂K give injective points; form the open fibrewise identity component.

**Acceptance.**

- Generic-fibre and connected-special-fibre hypotheses are explicit.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §1.1.1–1.1.5, printed pp. 9–12; §1.2.1–1.2.4, p. 16. Encode an affine group as a Hopf O-algebra and its generic identification as a Hopf isomorphism after tensoring with K. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-quasi-tame-group"></a>

### Quasi-tame and essentially tame groups

Target `ReductiveGroupsPartII:RG2.3/quasi-tame-group`. Definition; suggested declaration `BruhatTits.QuasiTame.IsQuasiTame`.

A connected reductive K-group is quasi-tame if it is a product of Res_(K_i/K)H_i for finite separable K_i/K and H_i split over finite tame extensions of K_i. It is essentially tame if its adjoint group is quasi-tame. The extensions K_i/K themselves may be wild. Essentially tame is an adjoint condition and does not constrain a central torus. The classical and division-index hypotheses used in KPZ Proposition 2.2.2 are additional assumptions, not part of these definitions.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; A connected reductive K-group is quasi-tame if it is a product of Res_(K_i/K)H_i for finite separable K_i/K and H_i split over finite tame extensions of K_i.

**Prerequisites.** [Weil restriction of an affine group scheme](#RG2-0a-weil-restriction-group-scheme) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-group-scheme`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

**Uses.**

- KPZ §3.1: Integral local-model triples allow essentially tame groups..
- KPZ Proposition 2.1.5: R-smoothness of induced factors supports integral embeddings..

**API.**

- `BruhatTits.QuasiTame.IsQuasiTame` (characterisation): Exists the stated finite product presentation.
- `BruhatTits.QuasiTame.IsEssentiallyTame` (characterisation): The adjoint group is quasi-tame.
- `BruhatTits.QuasiTame.product` (functoriality): Finite products of quasi-tame groups are quasi-tame.
- `BruhatTits.QuasiTame.weilRestriction` (functoriality): Restriction of a tame group along any finite separable field extension is quasi-tame.
- `BruhatTits.QuasiTame.rSmooth` (relation): A quasi-tame group is R-smooth.

**Unit tests.**

- `BruhatTits.QuasiTame.splitGL` (computation): Split GL_n is quasi-tame.
- `BruhatTits.QuasiTame.torus_essential` (degenerate): Every torus is essentially tame because its adjoint group is trivial.
- `BruhatTits.QuasiTame.weil_compat` (compatibility): The Weil-restricted presentation uses the RG2.0a group.
- `BruhatTits.QuasiTame.wild_induced` (non-example): Res_(K′/K)G_m for wild K′/K is quasi-tame despite not being tamely split.

**Construction or proof.**

1. Record the finite separable restriction-of-scalars presentation.
2. Apply the same predicate to the adjoint group.

**Acceptance.**

- The definition must allow wild intermediate fields.

**Sources.**

- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): Definition 3.1.4, p. 17. Record the finite separable restriction-of-scalars presentation. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-lang-for-pro-algebraic-groups"></a>

### Lang's theorem for inverse limits and fixed cosets

Target `ReductiveGroupsPartII:RG2.3/lang-for-pro-algebraic-groups`. Theorem; suggested declaration `Lang.fixedCoset_bijective`.

(a) For an affine scheme X of finite type over F_q generated by n elements, X(F_q) is finite of cardinality ≤ q^n. (b) For an affine algebraic group H over F_q (finite type, not necessarily connected) and a ∈ H(F̄_q), the set S_a = {z ∈ H(F̄_q) : z^{−1}F(z) = a}, if nonempty, is a left H(F_q)-torsor, hence finite. (c) For an inverse system (H_j) over a nonempty directed set of smooth connected affine F_q-groups with F_q-homomorphisms as transition maps, the Lang map z ↦ z^{−1}F(z) is surjective on J = lim_j H_j(F̄_q). (d) For a group H with an automorphism σ and a σ-stable subgroup J (not necessarily normal) on which z ↦ z^{−1}σ(z) is surjective, the natural map H^σ/J^σ → (H/J)^σ is bijective.

**Hypotheses.** (c): smooth connected affine groups of finite type, directed nonempty index set; (d): σ-stable subgroup J with surjective Lang map.

**Prerequisites.** [Lang's theorem](#RG2-3-lang-theorem) (`ReductiveGroupsPartII:RG2.3/lang-theorem`); `mathlib:TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`.

**Construction or proof.**

1. (a): evaluation at generators injects X(F_q) into F_q^n.
2. (b): z, z′ ∈ S_a iff z′z^{−1} is F-fixed; apply (a).
3. (c): given (a_j) compatible, the solution sets S_{a_j} are nonempty (RG2.3/lang-theorem) finite and map to each other; an inverse limit of nonempty finite sets over a directed set is nonempty (compactness/König), giving a compatible solution.
4. (d): injectivity: h, h′ ∈ H^σ with hJ = h′J give h^{−1}h′ ∈ J ∩ H^σ = J^σ; surjectivity: if hJ is σ-fixed then j := h^{−1}σ(h) ∈ J, write j = z^{−1}σ(z) with z ∈ J, then hz^{−1} is σ-fixed and lies in hJ (He 2018 Lemma 15 interface).

**Acceptance.**

- (d) for H = GL_2(F̄_q), J = upper triangular Borel B(F̄_q), σ = Frobenius: GL_2(F_q)/B(F_q) ≅ P¹(F_q), which has q+1 points.
- (c) for the pro-unipotent group lim U(F̄_q[t]/t^n) (U upper unitriangular): Lang surjective at every level and in the limit.

**Sources.**

- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): Lemma 15 (arXiv v3 Lemma 4.5) and its proof, p. 13. Identifies Frobenius-fixed cosets of positive-level groups by lifting fixed cosets; the elementary torsor, inverse-limit and fixed-coset steps make that lifting precise.
- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): Proposition 27.54, v2.00 p. 487. The fibres of the orbit map for a Steinberg endomorphism are finite, giving finiteness of Lang fibres.

<a id="RG2-3-reductive-model"></a>

### Reductive integral models

Target `ReductiveGroupsPartII:RG2.3/reductive-model`. Definition; suggested declaration `BruhatTits.ReductiveModel.IsReductive`.

A reductive O-model is a smooth affine model whose geometric special fibre is connected reductive. Together with its connected reductive generic fibre this is a reductive group scheme over O. The condition uses geometric fibres, including after residue-field extension. Its integral points are hyperspecial; existence and the building characterization are proved in the hyperspecial-vertices target. A smooth parahoric model whose special fibre has a nontrivial unipotent radical fails this predicate.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; A reductive O-model is a smooth affine model whose geometric special fibre is connected reductive.

**Prerequisites.** [Smooth affine integral models](#RG2-3-smooth-affine-model) (`ReductiveGroupsPartII:RG2.3/smooth-affine-model`); `tauceti:TauCeti.reductiveCommHopfAlgProperty`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

**Uses.**

- Zhu §1: Mixed-characteristic affine Grassmannians use a reductive O-group..
- KZ Lemma 6.2.1: A compact element is placed in a reductive model after extension..

**API.**

- `BruhatTits.ReductiveModel.IsReductive` (characterisation): Geometric special fibre is connected reductive.
- `BruhatTits.ReductiveModel.baseChange` (functoriality): Reductive models remain reductive after extension of valuation rings.
- `BruhatTits.ReductiveModel.hyperspecialPoints` (relation): Its O-points form a hyperspecial subgroup.
- `BruhatTits.ReductiveModel.smoothModel` (projection): The underlying smooth affine model.

**Unit tests.**

- `BruhatTits.ReductiveModel.gl` (computation): GL_n,O has reductive special fibre GL_n,κ.
- `BruhatTits.ReductiveModel.splitTorus` (degenerate): Every split torus model G_m,O^d is reductive, including d=0.
- `BruhatTits.ReductiveModel.predicate_compat` (compatibility): The condition agrees with Tau Ceti reductiveCommHopfAlgProperty.
- `BruhatTits.ReductiveModel.iwahori` (non-example): The SL_2 Iwahori model has a nontrivial unipotent radical in its special fibre.

**Construction or proof.**

1. Use the anchor reductivity predicate on both geometric fibres.
2. Check compatibility with the pinned Hopf-algebra reductivity predicate and base change.

**Acceptance.**

- GL_n,O is reductive and an Iwahori model of SL_2 is not.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §4.6.31, printed p. 137. Use the anchor reductivity predicate on both geometric fibres. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §3.8.1, p. 55. Use the anchor reductivity predicate on both geometric fibres. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-schematic-closure"></a>

### Schematic closure in an affine model

Target `ReductiveGroupsPartII:RG2.3/schematic-closure`. Construction; suggested declaration `BruhatTits.SchematicClosure.ideal`.

For A flat over the DVR O and a closed generic subscheme defined by I⊂A⊗O K, its schematic closure is Spec(A/J), where J is the preimage of I under A→A⊗O K. Then A/J is torsion-free and hence flat, and the generic fibre is the prescribed subscheme. This is the unique flat closed subscheme with that generic fibre. A generic subgroup has Hopf ideal J and subgroup closure. For a flat O-algebra B, closure points are precisely ambient B-points whose B⊗O K-points lie in the generic subgroup. Schematic closure need not be smooth.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For A flat over the DVR O and a closed generic subscheme defined by I⊂A⊗O K, its schematic closure is Spec(A/J), where J is the preimage of I under A→A⊗O K.

**Prerequisites.** [Smooth affine integral models](#RG2-3-smooth-affine-model) (`ReductiveGroupsPartII:RG2.3/smooth-affine-model`); `tauceti:TauCeti.HopfIdeal`.

**Uses.**

- KP18 Proposition 1.3.3: The Hodge representation image is constructed as a closure..
- KZ Definition 2.4.3: R-smoothness tests smoothness of a torus closure..

**API.**

- `BruhatTits.SchematicClosure.ideal` (constructor): The contraction J of the generic ideal.
- `BruhatTits.SchematicClosure.genericFibre` (relation): J localizes to I.
- `BruhatTits.SchematicClosure.flat` (other): A/J is flat over the DVR.
- `BruhatTits.SchematicClosure.unique` (characterisation): The unique flat closed model in the ambient scheme.
- `BruhatTits.SchematicClosure.points_inter` (simp): Flat-algebra points are the ambient/generic intersection.
- `BruhatTits.SchematicClosure.hopfIdeal` (compatibility): A generic Hopf ideal contracts to a Hopf ideal.

**Unit tests.**

- `BruhatTits.SchematicClosure.diagonal` (computation): The diagonal torus in GL_n closes to the diagonal O-torus.
- `BruhatTits.SchematicClosure.whole` (degenerate): Closing the whole generic fibre in a flat model gives the whole model.
- `BruhatTits.SchematicClosure.hopf_compat` (compatibility): Subgroup closure uses TauCeti.HopfIdeal and agrees with generic base change.
- `BruhatTits.SchematicClosure.not_always_smooth` (non-example): The closure of μ_p⊂G_m over a mixed-characteristic DVR is μ_p and is not smooth.

**Construction or proof.**

1. Contract the generic ideal; test saturation by the uniformizer to prove torsion-freeness.
2. Use localization to recover I and show uniqueness among saturated ideals.
3. Convolution maps preserve J because they preserve I and the ambient algebras are flat.

**Acceptance.**

- The point formula is asserted for flat test algebras, with their localization injective.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §1.2.1–1.2.7, printed pp. 16–17. Contract the generic ideal; test saturation by the uniformizer to prove torsion-freeness. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.3.1, pp. 138–139. Contract the generic ideal; test saturation by the uniformizer to prove torsion-freeness. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-extension-principle"></a>

### Bruhat–Tits extension principle

Target `ReductiveGroupsPartII:RG2.3/extension-principle`. Theorem; suggested declaration `BruhatTits.extension_principle`.

Let O be a henselian DVR and O^sh its strict henselization. For a smooth affine O-scheme X of finite presentation and an affine O-scheme Y, a K-morphism X_K→Y_K extends uniquely to an O-morphism iff it carries X(O^sh) into Y(O^sh). The smooth source satisfies the integrality condition ET1 of BT II §1.7. Two smooth affine models of the same generic scheme with identical O^sh-point subsets are uniquely isomorphic by an isomorphism inducing the identity generically. For group models the extended morphism is a homomorphism. Testing only O-points over a finite residue field is insufficient.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; Let O be a henselian DVR and O^sh its strict henselization.

**Prerequisites.** [Smooth affine integral models](#RG2-3-smooth-affine-model) (`ReductiveGroupsPartII:RG2.3/smooth-affine-model`).

**Construction or proof.**

1. After strict henselization, smoothness gives dense residue points and ET1.
2. A generic regular function integral on all O^sh-points belongs to the integral coordinate ring by Proposition 1.7.6.
3. Apply this to the target coordinates, descend faithfully flat, and use generic density for uniqueness and the group laws.

**Acceptance.**

- Do not omit strict henselization or the source integrality hypothesis.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 1.7.1–1.7.6, pp. 37–39. After strict henselization, smoothness gives dense residue points and ET1. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Bruhat–Tits extension principle**.

<a id="RG2-3-quotients-over-a-dvr"></a>

### Representability of quotients over a DVR

Target `ReductiveGroupsPartII:RG2.3/quotients-over-a-dvr`. Theorem; suggested declaration `BruhatTits.quotients_over_a_dvr`.

Let S be locally noetherian of dimension at most one, G a separated group scheme locally of finite type over S, and H⊂G a closed subgroup flat over S. If G is of finite type over S, the fppf quotient G/H is represented by a separated S-scheme of finite type; if G is only locally of finite type, assume H is smooth or S is the spectrum of a field. For normal H the quotient has its group structure. Under smoothness of G and H the quotient is smooth. Affineness is an additional conclusion in the smooth-normal affine-group setup used by Kisin–Zhou; it is not inferred for arbitrary closed H (flag varieties give nonaffine homogeneous quotients).

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; Let S be locally noetherian of dimension at most one, G a separated group scheme locally of finite type over S, and H⊂G a closed subgroup flat over S.

**Prerequisites.** [Smooth affine integral models](#RG2-3-smooth-affine-model) (`ReductiveGroupsPartII:RG2.3/smooth-affine-model`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Construction or proof.**

1. Apply quotient representability over a one-dimensional regular base.
2. Normality descends the multiplication to the quotient.
3. Descend smoothness fpqc-locally; check affineness separately in every integral-model application.

**Acceptance.**

- The theorem is used for the smooth torus-model quotient in the R-smoothness proof.

**Sources.**

- [S. Anantharaman, *Schémas en groupes, espaces homogènes et espaces algébriques sur une base de dimension 1*](https://www.numdam.org/item/MSMF_1973__33__5_0.pdf): Theorem 4.C, printed p. 53, and quotient proof §4.2; Kisin–Zhou §2.1 quotient setup. Apply quotient representability over a one-dimensional regular base. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-neron-lft-model-of-torus"></a>

### Locally finite-type Néron models of tori

Target `ReductiveGroupsPartII:RG2.3/neron-lft-model-of-torus`. Construction; suggested declaration `BruhatTits.NeronTorus.lftModel`.

For a torus T over a complete discretely valued field K with perfect residue field, construct a smooth separated O-group scheme T^lft, locally of finite type, with generic fibre T and the Néron mapping property Hom_O(X,T^lft)=Hom_K(X_K,T) for every smooth O-scheme X. In particular its strictly unramified integral points recover T(K^sh). Over the completed unramified field L its component group is X_*(T)_I. The model need not be affine or of finite type globally. Weil restriction along finite valuation-ring extensions yields the lft model of the generic Weil-restricted torus.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For a torus T over a complete discretely valued field K with perfect residue field, construct a smooth separated O-group scheme T^lft, locally of finite type, with generic fibre T and the Néron mapping property Hom_O(X,T^lft)=Hom_K(X_K,T) for every smooth O-scheme X.

**Prerequisites.** [Smooth affine integral models](#RG2-3-smooth-affine-model) (`ReductiveGroupsPartII:RG2.3/smooth-affine-model`); [Weil restriction of integral models](#RG2-0a-integral-weil-restriction) (`ReductiveGroupsPartII:RG2.0a/integral-weil-restriction`); `mathlib:AlgebraicGeometry.Scheme`.

**Uses.**

- KZ §2.4: R-smoothness uses closure in a Weil-restricted lft model..
- HR Proposition 3: The connected torus model identifies the Kottwitz kernel..

**API.**

- `BruhatTits.NeronTorus.lftModel` (constructor): The smooth separated locally finite-type scheme model.
- `BruhatTits.NeronTorus.mappingEquiv` (equivalence): Maps from a smooth O-scheme correspond to generic maps.
- `BruhatTits.NeronTorus.points` (relation): T^lft(O^sh)=T(K^sh).
- `BruhatTits.NeronTorus.components` (data): Over L, π₀ is X_*(T)_I.
- `BruhatTits.NeronTorus.weilRestriction` (functoriality): The integral Weil restriction satisfies the same Néron property.

**Unit tests.**

- `BruhatTits.NeronTorus.gm_components` (computation): The G_m lft model has special-fibre components indexed by ℤ.
- `BruhatTits.NeronTorus.trivial` (degenerate): The trivial torus has the trivial model.
- `BruhatTits.NeronTorus.adjunction_compat` (compatibility): The Weil comparison uses the RG2.0a adjunction on every smooth test scheme.
- `BruhatTits.NeronTorus.gm_not_finiteType` (non-example): For G_m the whole lft model is not G_m,O and is not finite type.

**Construction or proof.**

1. Build the torus model from split torus components after splitting extension and smoothen/descend; it has the Néron mapping property.
2. Uniqueness follows by applying the mapping property in both directions.
3. The integral Weil adjunction verifies the Néron mapping property for a Weil restriction.

**Acceptance.**

- Keep this model scheme-valued; a single finite-type affine Hopf algebra cannot encode all of it.

**Sources.**

- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): §2.4.1–2.4.2, pp. 12–13. Build the torus model from split torus components after splitting extension and smoothen/descend; it has the Néron mapping property. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §4.4.8, pp. 107–108; BLR §10.1 via KZ. Build the torus model from split torus components after splitting extension and smoothen/descend; it has the Néron mapping property. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-smooth-model-torsors"></a>

### Torsors under smooth models with connected special fibre

Target `ReductiveGroupsPartII:RG2.3/smooth-model-torsors`. Theorem; suggested declaration `Lang.smoothModel_torsor_trivial`.

Let O be a complete discrete valuation ring with finite residue field κ = F_q (e.g. O_E) and 𝒢 a smooth affine O-group scheme whose special fibre 𝒢_κ is connected. (a) 𝒢(O) → 𝒢(κ) is surjective. (b) Every étale 𝒢-torsor over Spec O is trivial, i.e. H^1_ét(O, 𝒢) = 1. (c) For an fppf exact sequence 1 → 𝒢′ → 𝒢 → 𝒢″ → 1 of smooth affine O-groups with 𝒢′_κ connected, 𝒢(O) → 𝒢″(O) is surjective. (d) Over O_L = Ŏ with the Frobenius σ and a σ-semilinear structure from an O-model, the map g ↦ g^{−1}σ(g) on 𝒢(O_L) is surjective (Lang over O_L). Connectedness of the special fibre is essential: for a disconnected stabilizer scheme only quasi-parahoric-level statements with H^1(F_q, π_0(𝒢_κ)) = 0 survive.

**Hypotheses.** O complete DVR with finite residue field; 𝒢 smooth affine over O with connected special fibre.

**Prerequisites.** [Lang's theorem](#RG2-3-lang-theorem) (`ReductiveGroupsPartII:RG2.3/lang-theorem`); [Reduction and congruence quotients of smooth models](#RG2-0-smooth-model-congruence-quotients) (`ReductiveGroupsPartII:RG2.0/smooth-model-congruence-quotients`); [Lang's theorem for inverse limits and fixed cosets](#RG2-3-lang-for-pro-algebraic-groups) (`ReductiveGroupsPartII:RG2.3/lang-for-pro-algebraic-groups`); `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`.

**Construction or proof.**

1. (a): Hensel lifting for formally smooth algebras over adically complete rings (RG2.0/smooth-model-congruence-quotients, Mathlib exists_mkₐ_comp_eq_of_isAdicComplete).
2. (b): a torsor P is smooth (as 𝒢 is), P_κ is a 𝒢_κ-torsor, trivial by Lang (RG2.3/lang-theorem); a κ-point lifts to an O-point by (a) applied to P (Hensel), trivializing P.
3. (c): the fibre over h ∈ 𝒢″(O) is a 𝒢′-torsor, trivial by (b) (GLX Prop. 6.9 proof, arXiv v3 p. 49: smooth map with connected-fibre torsors).
4. (d): solve modulo m_L^n successively: at the first step Lang on 𝒢_κ̄ (RG2.3/lang-theorem), at the subsequent steps Lang on the vector groups Lie(𝒢_κ) ⊗ m^n/m^{n+1} (Artin–Schreier-type surjectivity of v ↦ σ(v) − v on κ̄-vector spaces), and pass to the limit by completeness (RG2.3/lang-for-pro-algebraic-groups (c)).

**Acceptance.**

- 𝒢 = GL_n over O: every rank-n vector bundle over Spec O is free.
- 𝒢 = the Iwahori group scheme of GL_2: torsors are trivial and 𝒢(O) → 𝒢(κ) (upper triangular matrices over κ) is surjective.
- Non-example: the smooth disconnected constant O-group ℤ/2 has H¹_ét(O,ℤ/2)≃H¹(F_q,ℤ/2)≃ℤ/2, represented by the unramified quadratic cover. Connectedness cannot be dropped.

**Sources.**

- [Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2208.07195): Lemma 6.5 and proof of Proposition 6.9, arXiv v3 pp. 44, 48–49. For the parahoric torus quotient, reduces surjectivity on Z_p-points to F_p-points by smoothness and uses Lang's theorem for the smooth connected special fibre of the derived parahoric to trivialize torsors.
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): Corollaries 4.2.12–4.2.13 and Remark 4.2.14, arXiv v3 pp. 56–57. Applies Lang's lemma to the special fibre of the stabilizer scheme to lift points; the argument needs a connected special fibre (corrected hypothesis recorded as ReductiveGroupsPartII/E46).
- [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf): Corollaries 27.55–27.56, v2.00 p. 488. Lang's theorem over finite fields.

<a id="RG2-3-big-cell-criteria"></a>

### Smoothness and isomorphisms from root big cells

Target `ReductiveGroupsPartII:RG2.3/big-cell-criteria`. Theorem; suggested declaration `BruhatTits.big_cell_criteria`.

A generic homomorphism of smooth affine models with connected fibres extends to an isomorphism if it identifies their fibrewise dense open big cells and their translated charts. For a flat affine subgroup closure in GL(Λ), if its torus and ordered positive and negative root-group closures are smooth and their product gives the BT II §2.2 big-cell charts, those charts and their translates prove the closure smooth. Smoothness of unrelated subgroups alone is not sufficient; the product-open and generic big-cell hypotheses are essential.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; A generic homomorphism of smooth affine models with connected fibres extends to an isomorphism if it identifies their fibrewise dense open big cells and their translated charts.

**Prerequisites.** [Schematic closure in an affine model](#RG2-3-schematic-closure) (`ReductiveGroupsPartII:RG2.3/schematic-closure`); [Bruhat–Tits extension principle](#RG2-3-extension-principle) (`ReductiveGroupsPartII:RG2.3/extension-principle`).

**Construction or proof.**

1. The ordered root product is an open immersion in the specified root-chart setup.
2. Translate that chart across every geometric fibre, using connectedness and density.
3. Glue the local morphisms and local inverses; generic equality proves overlap coherence.

**Acceptance.**

- In the split GL_n case this is the usual lower-unipotent × diagonal × upper-unipotent chart.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §1.2.13, printed p. 20; §2.2.3–2.2.5, pp. 44–45. The ordered root product is an open immersion in the specified root-chart setup. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-reductive-closed-immersion-criterion"></a>

### Prasad–Yu closed-immersion criterion

Target `ReductiveGroupsPartII:RG2.3/reductive-closed-immersion-criterion`. Theorem; suggested declaration `BruhatTits.reductive_closed_immersion_criterion`.

Let O be a DVR, H a reductive O-group, H′ an affine O-group scheme of finite type, and f:H→H′ a homomorphism that is a closed immersion on the generic fibre. If the residue characteristic differs from 2, or if H over an algebraic closure of the fraction field has no normal factor isomorphic to SO_(2n+1), then f is a closed immersion over O. The type-B exception in residue characteristic 2 cannot be discarded.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; Let O be a DVR, H a reductive O-group, H′ an affine O-group scheme of finite type, and f:H→H′ a homomorphism that is a closed immersion on the generic fibre.

**Prerequisites.** [Reductive integral models](#RG2-3-reductive-model) (`ReductiveGroupsPartII:RG2.3/reductive-model`); [Schematic closure in an affine model](#RG2-3-schematic-closure) (`ReductiveGroupsPartII:RG2.3/schematic-closure`).

**Construction or proof.**

1. Replace the target by the flat schematic image.
2. Apply the quasi-reductive smoothness theorem to the image under the residue-characteristic/type hypotheses.
3. The generic isomorphism and reductive uniqueness identify H with that image.

**Acceptance.**

- The residue-characteristic/type disjunction appears in the Lean signature.

**Sources.**

- [Gopal Prasad, Jiu-Kang Yu; appendix by Brian Conrad, *On quasi-reductive group schemes*](https://math.stanford.edu/~conrad/papers/qrg.pdf): Corollary 1.3, author-copy p. 2; Kisin–Zhou Proposition 2.1.3. Replace the target by the flat schematic image. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-faithful-representations-of-models"></a>

### Faithful representations with quasi-affine quotient

Target `ReductiveGroupsPartII:RG2.3/faithful-representations-of-models`. Theorem; suggested declaration `BruhatTits.faithful_representations_of_models`.

For a smooth affine finite-type group over a DVR, choose a finite free lattice Λ and a closed immersion into GL(Λ) with quasi-affine fppf quotient. For a reductive group scheme the quotient by any closed linear realization is affine by geometric reductivity. The construction here is restricted to DVRs, where finitely generated torsion-free modules are free; over a general Dedekind domain use finite projective modules, not a global free basis.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For a smooth affine finite-type group over a DVR, choose a finite free lattice Λ and a closed immersion into GL(Λ) with quasi-affine fppf quotient.

**Prerequisites.** [Smooth affine integral models](#RG2-3-smooth-affine-model) (`ReductiveGroupsPartII:RG2.3/smooth-affine-model`); [Representability of quotients over a DVR](#RG2-3-quotients-over-a-dvr) (`ReductiveGroupsPartII:RG2.3/quotients-over-a-dvr`).

**Construction or proof.**

1. Use a finite projective subcomodule of the regular representation that generates the coordinate algebra.
2. The stabilizer of its defining tensors gives the closed embedding and quasi-affine quotient.
3. For reductive models apply the geometric-reductivity affine-quotient theorem cited by Zhu.

**Acceptance.**

- Record projectivity vs freeness and the separate affine-quotient input.

**Sources.**

- [Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag varieties*](https://arxiv.org/abs/math/0607130): §1.b, Propositions 1.2–1.3, preprint pp. 7–8. Use a finite projective subcomodule of the regular representation that generates the coordinate algebra. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*](https://arxiv.org/abs/1407.8519): §1.2, pp. 13–14, citing Alper Corollary 9.7.7. Use a finite projective subcomodule of the regular representation that generates the coordinate algebra. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-neron-finite-type-and-connected-models"></a>

### Bounded and connected torus models

Target `ReductiveGroupsPartII:RG2.3/neron-finite-type-and-connected-models`. Construction; suggested declaration `BruhatTits.NeronTorus.finiteTypeModel`.

The finite-type Néron model T^ft is the open affine subgroup of T^lft retaining precisely torsion components of X_*(T)_I over L. Its O_L-points are the maximal bounded subgroup T(L)_b=κ_T^−1((X_*(T)_I)_tors). The identity component T° is smooth affine with T°(O_L)=ker κ_T. These constructions descend to O_E; their E-points are the corresponding intersections in T(L). The finite-type and connected models coincide exactly when the component torsion subgroup vanishes.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; The finite-type Néron model T^ft is the open affine subgroup of T^lft retaining precisely torsion components of X_*(T)_I over L.

**Prerequisites.** [Locally finite-type Néron models of tori](#RG2-3-neron-lft-model-of-torus) (`ReductiveGroupsPartII:RG2.3/neron-lft-model-of-torus`); [The Kottwitz homomorphism of a torus](#RG2-1-kottwitz-homomorphism-torus) (`ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism-torus`).

**Uses.**

- RG2.4/iwahori-weyl-group: The normalizer quotient uses the connected torus subgroup..
- BT II §4.6: Root-chart models use the bounded torus and its identity component..

**API.**

- `BruhatTits.NeronTorus.finiteTypeModel` (constructor): The open model retaining torsion components.
- `BruhatTits.NeronTorus.connectedModel` (constructor): The identity-component model.
- `BruhatTits.NeronTorus.finiteType_points` (simp): Integral points are the maximal bounded subgroup.
- `BruhatTits.NeronTorus.connected_points` (simp): Integral points are the Kottwitz kernel.
- `BruhatTits.NeronTorus.components_finiteType` (relation): Special-fibre components are the torsion inertia coinvariants.

**Unit tests.**

- `BruhatTits.NeronTorus.gm_bounded` (computation): G_m^ft=G_m°=G_m,O with points O×.
- `BruhatTits.NeronTorus.trivial_bounded` (degenerate): The trivial torus has equal lft, finite-type and connected models.
- `BruhatTits.NeronTorus.kottwitz_compat` (compatibility): The connected-points kernel is that of RG2.1 κ_T.
- `BruhatTits.NeronTorus.ramified_normOne` (non-example): For a quadratic ramified norm-one torus in odd residue characteristic, X_*(T)_I=ℤ/2 and the bounded subgroup strictly contains the connected subgroup.

**Construction or proof.**

1. Select the indicated open component subgroups of the lft model.
2. Use the component Kottwitz map and rational-character valuations to identify bounded points.
3. Descend the stable open subgroups under Frobenius.

**Acceptance.**

- Connected and maximal bounded torus subgroups must remain distinct when inertia coinvariants have torsion.

**Sources.**

- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): §2.4.1–2.4.2, pp. 12–13; Haines–Rapoport Remark 10–11, pp. 6–7. Select the indicated open component subgroups of the lft model. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-r-smooth-torus"></a>

### R-smooth tori and reductive groups

Target `ReductiveGroupsPartII:RG2.3/r-smooth-torus`. Definition; suggested declaration `BruhatTits.RSmooth.torus`.

Choose a finite Galois splitting field K̃/K of T and take its schematic closure T^c in Res_(Õ/O)(T_K̃^lft). T is R-smooth iff T^c is smooth. The closure and predicate are independent of splitting extension. When smooth, this closure is T^lft by its Néron mapping property. R-smoothness is invariant under completion of maximal unramified extension. A reductive K-group is R-smooth when the centralizer torus of a maximal L-split torus in G_L is R-smooth. This uses quasi-splitness over L; it does not assert that every rational minimal Levi is a torus.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; Choose a finite Galois splitting field K̃/K of T and take its schematic closure T^c in Res_(Õ/O)(T_K̃^lft).

**Prerequisites.** [Locally finite-type Néron models of tori](#RG2-3-neron-lft-model-of-torus) (`ReductiveGroupsPartII:RG2.3/neron-lft-model-of-torus`); [Schematic closure in an affine model](#RG2-3-schematic-closure) (`ReductiveGroupsPartII:RG2.3/schematic-closure`); [Steinberg's theorem over the completed unramified field](#RG2-1-steinberg-quasi-split) (`ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`).

**Uses.**

- KZ Lemma 2.4.4: R-smooth sources extend closed torus immersions..
- KPZ Proposition 2.1.5: Quasi-tame group factors are R-smooth..

**API.**

- `BruhatTits.RSmooth.torus` (characterisation): Smoothness of T^c.
- `BruhatTits.RSmooth.group` (characterisation): R-smoothness of the maximal-L-split centralizer torus.
- `BruhatTits.RSmooth.independent_splitting` (other): The predicate is independent of splitting field.
- `BruhatTits.RSmooth.neron_eq_closure` (relation): For R-smooth T, T^c=T^lft.
- `BruhatTits.RSmooth.unramified_iff` (compatibility): T is R-smooth iff T_L is R-smooth.

**Unit tests.**

- `BruhatTits.RSmooth.split` (computation): Every split torus is R-smooth.
- `BruhatTits.RSmooth.trivial` (degenerate): The trivial torus is R-smooth.
- `BruhatTits.RSmooth.closure_compat` (compatibility): The generic fibre of T^c recovers the original T embedding.
- `BruhatTits.RSmooth.wild_not_tame` (non-example): Res_(K′/K)G_m is R-smooth even for a wild K′/K; R-smooth is not equivalent to tamely split.

**Construction or proof.**

1. Apply closure locally on the lft model charts.
2. Compare splitting extensions by the integral Weil adjunction and the Néron mapping property.
3. Pass to the completed unramified field and its maximal-split centralizer.

**Acceptance.**

- The centralizer used for the group predicate is taken over L.

**Sources.**

- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): Definition 2.4.3, p. 13. Apply closure locally on the lft model charts. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §2.1.4, pp. 10–11. Apply closure locally on the lft model charts. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-neron-model-closed-immersions"></a>

### Closed immersions of torus Néron models

Target `ReductiveGroupsPartII:RG2.3/neron-model-closed-immersions`. Theorem; suggested declaration `BruhatTits.neron_model_closed_immersions`.

A closed immersion T₁→T₂ of K-tori with R-smooth T₁ extends to a closed immersion of lft Néron models and of finite-type Néron models. To obtain the latter, the map of inertia-coinvariant cocharacters has torsion kernel and the inverse image of the target torsion subgroup is the source torsion subgroup. Apply this to centralizer tori over L whenever the source group is R-smooth and the embedding identifies the relevant maximal split tori.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; A closed immersion T₁→T₂ of K-tori with R-smooth T₁ extends to a closed immersion of lft Néron models and of finite-type Néron models.

**Prerequisites.** [R-smooth tori and reductive groups](#RG2-3-r-smooth-torus) (`ReductiveGroupsPartII:RG2.3/r-smooth-torus`); [Bounded and connected torus models](#RG2-3-neron-finite-type-and-connected-models) (`ReductiveGroupsPartII:RG2.3/neron-finite-type-and-connected-models`).

**Construction or proof.**

1. Over a common splitting field the split torus lft models embed closed.
2. Apply Weil restriction; R-smoothness identifies the source closure with its lft model.
3. Use the torsion-component inverse-image computation for finite-type models.

**Acceptance.**

- An arbitrary non-R-smooth source is excluded.

**Sources.**

- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): Lemma 2.4.4, pp. 13–14. Over a common splitting field the split torus lft models embed closed. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-torus-models-exact-sequences"></a>

### Exact torus sequences and connected integral models

Target `ReductiveGroupsPartII:RG2.3/torus-models-exact-sequences`. Theorem; suggested declaration `BruhatTits.torus_models_exact_sequences`.

For an exact sequence 1→T₁→T₂→T₃→1 of tori over L with T₂ tamely split, the connected models fit into 1→S→T₂°→T₃°→1 as smooth fppf group schemes. The kernel S has identity component T₁° and its component group is a subgroup of the torsion of X_*(T₁)_I; hence S=T₁° when these coinvariants are torsion-free. At strictly positive depth, the corresponding torus filtrations give exact sequences, with surjectivity on local-field points under the tame norm/lifting hypotheses. Do not assert exactness of the sequence of connected models with T₁° as kernel without the torsion condition.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For an exact sequence 1→T₁→T₂→T₃→1 of tori over L with T₂ tamely split, the connected models fit into 1→S→T₂°→T₃°→1 as smooth fppf group schemes.

**Prerequisites.** [Bounded and connected torus models](#RG2-3-neron-finite-type-and-connected-models) (`ReductiveGroupsPartII:RG2.3/neron-finite-type-and-connected-models`); [Representability of quotients over a DVR](#RG2-3-quotients-over-a-dvr) (`ReductiveGroupsPartII:RG2.3/quotients-over-a-dvr`); [The Kottwitz homomorphism of a torus](#RG2-1-kottwitz-homomorphism-torus) (`ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism-torus`).

**Construction or proof.**

1. Compare the component sequences with coinvariant cocharacters.
2. Compute the identity component and possible torsion components of the kernel.
3. Use tame positive-depth lifting and norm exactness for depth r>0.

**Acceptance.**

- The depth-zero kernel may be disconnected.

**Sources.**

- [Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag varieties*](https://arxiv.org/abs/math/0607130): Lemma 6.7, preprint pp. 36–37. Compare the component sequences with coinvariant cocharacters. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): §3, p. 12, citing Kaletha Lemma 3.1.3. Compare the component sequences with coinvariant cocharacters. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-bruhat-tits-group-scheme"></a>

### Smooth models of bounded fixers

Target `ReductiveGroupsPartII:RG2.3/bruhat-tits-group-scheme`. Construction; suggested declaration `BruhatTits.groupScheme`.

For a nonempty bounded subset Ω in an enlarged apartment construct a smooth affine finite-type O-group G_Ω with generic fibre G and O^sh-points the pointwise fixer of the transported Ω in G(K^sh), with the bounded-character kernel as in BT II. Quasi-split construction glues the integral torus and valued root charts; general groups use unramified descent. The ordered negative-root × bounded-torus × positive-root chart is open. The model depends on the enclosure of Ω and transports by conjugation. This model can have disconnected special fibre; its identity component is the parahoric model.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For a nonempty bounded subset Ω in an enlarged apartment construct a smooth affine finite-type O-group G_Ω with generic fibre G and O^sh-points the pointwise fixer of the transported Ω in G(K^sh), with the bounded-character kernel as in BT II.

**Prerequisites.** [Bruhat–Tits extension principle](#RG2-3-extension-principle) (`ReductiveGroupsPartII:RG2.3/extension-principle`); [Smoothness and isomorphisms from root big cells](#RG2-3-big-cell-criteria) (`ReductiveGroupsPartII:RG2.3/big-cell-criteria`); [Bounded and connected torus models](#RG2-3-neron-finite-type-and-connected-models) (`ReductiveGroupsPartII:RG2.3/neron-finite-type-and-connected-models`); [Unramified descent of buildings](#RG2-2-unramified-descent-of-building) (`ReductiveGroupsPartII:RG2.2/unramified-descent-of-building`); [Pointwise fixers and setwise stabilizers](#RG2-2-stabilizers-and-fixers) (`ReductiveGroupsPartII:RG2.2/stabilizers-and-fixers`).

**Uses.**

- van Hoften §2.2: Connectedness of full fixers is tested..
- KPZ Proposition 2.2.2: Full stabilizers of generic facet points are tame fixed-point models..

**API.**

- `BruhatTits.groupScheme` (constructor): The smooth affine bounded-fixer model.
- `BruhatTits.groupScheme_generic` (equivalence): Generic fibre equals G.
- `BruhatTits.groupScheme_points` (characterisation): Strictly unramified points give the prescribed full fixer.
- `BruhatTits.groupScheme_bigCell` (data): The ordered root/torus product is an open chart.
- `BruhatTits.groupScheme_conj` (functoriality): Transport under g is conjugation of the model.
- `BruhatTits.groupScheme_enclosure` (relation): The model depends only on the enclosure.

**Unit tests.**

- `BruhatTits.groupScheme.gl_standard` (computation): The standard GL_n norm has model GL_n,O.
- `BruhatTits.groupScheme.torus` (degenerate): The torus full-fixer model is its finite-type Néron model.
- `BruhatTits.groupScheme.generic_compat` (compatibility): Generic-fibre points identify with the RG2.0 group-of-points carrier.
- `BruhatTits.groupScheme.component_needed` (non-example): The ramified quadratic norm-one torus full-fixer model can be disconnected.

**Construction or proof.**

1. Associate the concave depth function f_Ω(a)=sup_(x∈Ω)(−a(x)) and its effective discrete optimization.
2. Construct root charts and the bounded torus model; glue charts and translate by normalizer fixer components.
3. Use the extension principle to descend and prove enclosure invariance and conjugation.

**Acceptance.**

- Full fixer and connected model are separate objects.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §4.6.18–4.6.30, printed pp. 132–136; §5.1.8–5.1.9, pp. 147–149. Associate the concave depth function f_Ω(a)=sup_(x∈Ω)(−a(x)) and its effective discrete optimization. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-split-torus-bounded-model-smoothness"></a>

### Smoothness of a split-torus model with all bounded points

Target `ReductiveGroupsPartII:RG2.3/split-torus-bounded-model-smoothness`. Theorem; suggested declaration `BruhatTits.split_torus_bounded_model_smoothness`.

Let O be a strictly henselian DVR with algebraically closed residue field, K its fraction field, and T a split K-torus. If 𝒯 is an affine flat finite-type O-model of T and 𝒯(O) is the maximal bounded subgroup T(K)_b, then 𝒯 is smooth and is the split bounded torus model. The Néron lft model has all T(K) as its O-points and is a different object. For a torus closure inside a smooth fixer model, check flatness, finite type and the equality of bounded points before applying this criterion.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; Let O be a strictly henselian DVR with algebraically closed residue field, K its fraction field, and T a split K-torus.

**Prerequisites.** [Schematic closure in an affine model](#RG2-3-schematic-closure) (`ReductiveGroupsPartII:RG2.3/schematic-closure`); [Bounded and connected torus models](#RG2-3-neron-finite-type-and-connected-models) (`ReductiveGroupsPartII:RG2.3/neron-finite-type-and-connected-models`); [The valuation homomorphism of the minimal Levi](#RG2-1-torus-valuation-map) (`ReductiveGroupsPartII:RG2.1/torus-valuation-map`).

**Construction or proof.**

1. Compare the normalization of 𝒯 with the split bounded Néron model.
2. The reduction image of O-points is sufficiently large over the algebraically closed residue field.
3. The normalization is a torus and has the same character lattice; its map to 𝒯 is an isomorphism by the integral closure argument in Lemma 4.1.

**Acceptance.**

- For G_m the model is Spec O[t,t⁻¹], whereas the Néron lft model also represents nonzero valuation components.

**Sources.**

- [Gopal Prasad, Jiu-Kang Yu; appendix by Brian Conrad, *On quasi-reductive group schemes*](https://math.stanford.edu/~conrad/papers/qrg.pdf): Lemma 4.1 and proof, author-copy pp. 7–8. Compare the normalization of 𝒯 with the split bounded Néron model. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-lattice-chain-stabilizer-schemes"></a>

### Parahorics of GL and GSp as lattice-chain automorphism groups

Target `ReductiveGroupsPartII:RG2.3/lattice-chain-stabilizer-schemes`. Theorem; suggested declaration `KisinPappas.chainStabilizer_eq_closure`.

Let V be a finite-dimensional K-vector space and x ∈ B(GL(V),K) correspond to a graded periodic lattice chain ({Λ_i}, c) with determining segment ϖΛ_0 ⊂ Λ_{r−1} ⊂ ⋯ ⊂ Λ_0 (RG2.2/gl-building-lattice-chains). (a) The parahoric (= stabilizer, π₁(GL) torsion-free) group scheme 𝒢ℒ_x is the schematic closure of the diagonal GL(V) ↪ ∏_{i<r} GL(V) in ∏_{i<r} GL(Λ_i), and equals the smooth group scheme Aut(Λ_•) of automorphisms of the indexed chain. (b) With tot(L) := Λ_0 ⊕ ⋯ ⊕ Λ_{r−1} ⊂ V^r (the periodic endpoint ϖΛ_0 excluded), the diagonal representation extends to a closed immersion 𝒢ℒ_x → GL(tot(L)). (c) For V with a perfect alternating form ψ and x ∈ B(GSp(V),K) corresponding to an almost self-dual chain with (Λ^i)^∨ = Λ^{−i−a}, the parahoric 𝒢𝒮𝒫_x is the schematic closure of GSp(V) in ∏_{i=−(r−1)−a}^{r−1} GL(Λ^i), equals the group of similitude automorphisms of the polarized chain, and is the closure of the diagonal GSp(V) in GL(Λ′) for Λ′ = ⊕_i Λ^i in V′ = ⊕_i V with the orthogonal sum form ψ′; after scaling, Λ′ ⊂ Λ′^∨.

**Hypotheses.** V finite-dimensional over K; x a point of the GL (resp. GSp) building with its graded periodic chain; for (c): ψ perfect alternating, chain almost self-dual.

**Prerequisites.** `mathlib:Submodule.IsLattice`; [GL building through additive norms and lattice chains](#RG2-2-gl-building-lattice-chains) (`ReductiveGroupsPartII:RG2.2/gl-building-lattice-chains`); [Symplectic building and self-dual lattice chains](#RG2-2-gsp-building-self-dual-chains) (`ReductiveGroupsPartII:RG2.2/gsp-building-self-dual-chains`); [Division-algebra lattice building](#RG2-2-division-algebra-building) (`ReductiveGroupsPartII:RG2.2/division-algebra-building`); [Smooth affine integral models](#RG2-3-smooth-affine-model) (`ReductiveGroupsPartII:RG2.3/smooth-affine-model`); [Smooth models of bounded fixers](#RG2-3-bruhat-tits-group-scheme) (`ReductiveGroupsPartII:RG2.3/bruhat-tits-group-scheme`).

**Construction or proof.**

1. The O^sh-points of the closure and of Aut(Λ_•) both equal ∩_i GL(Λ_i ⊗ O^sh), the stabilizer of x (BT classiques 3.6 Theorem, printed p. 288; KP18 §1.1.9 arXiv p. 9).
2. Aut(Λ_•) is smooth (Rapoport–Zink, appendix to Ch. 3, cited in KP18 §1.1.9; BT classiques 3.7–3.8, printed pp. 288–289, big cell of the closure), so by the extension principle (RG2.3/extension-principle) the closure equals Aut(Λ_•) and equals the Bruhat–Tits scheme (RG2.3/bruhat-tits-group-scheme).
3. For (b), the diagonal map extends to Aut(Λ_•) → GL(tot(L)) and is a closed immersion because Aut(Λ_•) acts faithfully on ⊕Λ_i with schematic image the closure (BT classiques 3.8; KPZ Lemma 2.3.1, arXiv p. 14, citing Rapoport–Zink Prop. A.4).
4. For (c), the same argument with the self-dual indexing (1.1.12) and the block-diagonal closed subgroup ∏ GL(Λ^i) ⊂ GL(Λ′) (KP18 §1.1.11, arXiv pp. 9–10).

**Acceptance.**

- For the chain {ϖ^n O^n} (r = 1), 𝒢ℒ_x = GL_n over O and tot(L) = O^n.
- For the standard Iwahori chain O^n ⊃ O^{n−1} ⊕ ϖO ⊃ ⋯ ⊃ ϖO^n, 𝒢ℒ_x(O) is the subgroup of GL_n(O) upper triangular modulo ϖ.
- For GSp_4 and the self-dual lattice O^4, 𝒢𝒮𝒫_x = GSp_4 over O (hyperspecial).

**Sources.**

- [François Bruhat, Jacques Tits, *Schémas en groupes et immeubles des groupes classiques sur un corps local*](http://www.numdam.org/item/10.24033/bsmf.2006.pdf): 3.6 Théorème, 3.7 Corollaire, 3.8, printed pp. 288–289. For a point of the building with associated norm and lattice flag, the smooth connected group scheme of the point acts faithfully on the product of the lattices of the flag, the torus and root group schemes are the schematic closures, and a big cell exists; in the split case this identifies the scheme with the closure of the diagonal.
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.1.9 and §1.1.11, arXiv v3 pp. 8–10 (IHÉS pp. 130–131). Describes the GL and GSp buildings by graded periodic and almost self-dual chains, identifies the parahoric with the closure of the diagonal and with the automorphism group of the indexed (polarized) chain, and introduces the symplectic total lattice.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §2.3 and Lemma 2.3.1, arXiv v3 pp. 13–14. Introduces determining segments and the total lattice tot(L) excluding the periodic endpoint and states that the diagonal map extends to a closed immersion GL(L) → GL(tot(L)).

<a id="RG2-3-r-smoothness-criteria"></a>

### Tame and quasi-tame R-smoothness

Target `ReductiveGroupsPartII:RG2.3/r-smoothness-criteria`. Theorem; suggested declaration `BruhatTits.r_smoothness_criteria`.

Tamely split tori are R-smooth. Finite products of Res_(K_i/K)T_i are R-smooth when each T_i is tamely split over K_i, even when K_i/K is wild. An extension of an R-smooth torus by an R-smooth torus is R-smooth. Consequently quasi-tame reductive groups are R-smooth. These are sufficient criteria, not a classification of all R-smooth groups.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; Tamely split tori are R-smooth.

**Prerequisites.** [R-smooth tori and reductive groups](#RG2-3-r-smooth-torus) (`ReductiveGroupsPartII:RG2.3/r-smooth-torus`); [Edixhoven's tame fixed-point theorem](#RG2-0a-tame-fixed-points-of-weil-restriction) (`ReductiveGroupsPartII:RG2.0a/tame-fixed-points-of-weil-restriction`); [Closed immersions of torus Néron models](#RG2-3-neron-model-closed-immersions) (`ReductiveGroupsPartII:RG2.3/neron-model-closed-immersions`); [Representability of quotients over a DVR](#RG2-3-quotients-over-a-dvr) (`ReductiveGroupsPartII:RG2.3/quotients-over-a-dvr`); [Bruhat–Tits extension principle](#RG2-3-extension-principle) (`ReductiveGroupsPartII:RG2.3/extension-principle`); [Quasi-tame and essentially tame groups](#RG2-3-quasi-tame-group) (`ReductiveGroupsPartII:RG2.3/quasi-tame-group`).

**Construction or proof.**

1. Tame fixed-point smoothness identifies the split closure with the Néron model.
2. Use the lft Weil comparison and products for induced tori.
3. Extend the source torus as a closed Néron subgroup, identify the smooth quotient by the extension principle, and compare the exact splitting-field diagram.

**Acceptance.**

- Wild Weil restriction must remain permitted in the induced-torus clause.

**Sources.**

- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): §2.4.5 and Proposition 2.4.6, pp. 14–15. Tame fixed-point smoothness identifies the split closure with the Néron model. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): Proposition 2.1.5, p. 11. Tame fixed-point smoothness identifies the split closure with the Néron model. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-parahoric-group-scheme"></a>

### Connected parahoric group schemes

Target `ReductiveGroupsPartII:RG2.3/parahoric-group-scheme`. Construction; suggested declaration `BruhatTits.parahoricGroupScheme`.

For Ω as above set G_Ω° to the fibrewise identity component of the smooth fixer model. It is smooth affine finite type, has generic fibre G and connected special fibre, and is characterized by its connected-fixer O^sh-points. Replace the bounded torus chart by its connected Néron model. For a facet F the model is independent of the point chosen inside F; for an arbitrary Ω it depends on its enclosure. Connected generic fibre is part of the input, not a substitute for connected special fibre.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For Ω as above set G_Ω° to the fibrewise identity component of the smooth fixer model.

**Prerequisites.** [Smooth models of bounded fixers](#RG2-3-bruhat-tits-group-scheme) (`ReductiveGroupsPartII:RG2.3/bruhat-tits-group-scheme`); [Smooth affine integral models](#RG2-3-smooth-affine-model) (`ReductiveGroupsPartII:RG2.3/smooth-affine-model`).

**Uses.**

- Zhu §1: Parahoric affine flag varieties use these models..
- GLX §2.1: Their points define parahoric level subgroups..

**API.**

- `BruhatTits.parahoricGroupScheme` (constructor): The connected fixer model.
- `BruhatTits.parahoricGroupScheme_generic` (equivalence): Its generic fibre is G.
- `BruhatTits.parahoricGroupScheme_connected` (other): Its special fibre is geometrically connected.
- `BruhatTits.parahoricGroupScheme_points` (characterisation): Its O^sh-points are the connected fixer.
- `BruhatTits.parahoricGroupScheme_facet` (relation): All points of an open facet give the same connected model.

**Unit tests.**

- `BruhatTits.parahoricGroupScheme.gl_hyperspecial` (computation): At the standard GL_n vertex the model is GL_n,O.
- `BruhatTits.parahoricGroupScheme.torus` (degenerate): For a torus it is the connected Néron model.
- `BruhatTits.parahoricGroupScheme.identity_compat` (compatibility): It is the identity component of groupScheme.
- `BruhatTits.parahoricGroupScheme.not_full` (non-example): A ramified norm-one torus can have a strictly larger full-fixer model.

**Construction or proof.**

1. Take the identity component of the fixer model.
2. Root charts and the connected torus chart give its smooth affine big cell.
3. Use the extension principle and constancy of depth bounds inside a facet.

**Acceptance.**

- The connected model must differ from the full model in torsion-component examples.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §4.6.26–4.6.28, printed pp. 135–136; §5.2.6, p. 164. Take the identity component of the fixer model. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Parahoric group scheme**.

<a id="RG2-3-associated-parahorics"></a>

### Associated parahorics under adjoint identifications

Target `ReductiveGroupsPartII:RG2.3/associated-parahorics`. Construction; suggested declaration `BruhatTits.ParahoricExt.associatedParahoric`.

Let f: G → G′ be a homomorphism of connected reductive K-groups (K a henselian discretely valued field with perfect residue field) that induces an isomorphism of adjoint groups G^ad ≅ G′^ad, and let 𝒢 = 𝒢°_x be the parahoric group scheme of a point x of the enlarged building B(G,K). Choose any point x′ ∈ B(G′,K) whose image in the reduced building B(G′^ad,K) = B(G^ad,K) equals the image x̄ of x. The associated parahoric of G′ is 𝒢′ := 𝒢′°_{x′}, the parahoric group scheme of G′ at x′. It depends only on 𝒢 (not on the lift x′ in the central direction X_*(A_{G′})⊗ℝ, nor on the choice of x inside its fibre over x̄), and f extends uniquely to an O-homomorphism 𝒢 → 𝒢′.

**Hypotheses.** G, G′ connected reductive over K; f: G → G′ a K-homomorphism with f^ad: G^ad ≅ G′^ad; x ∈ B(G,K); x′ ∈ B(G′,K) any lift of x̄ ∈ B(G^ad,K).

**Prerequisites.** [Connected parahoric group schemes](#RG2-3-parahoric-group-scheme) (`ReductiveGroupsPartII:RG2.3/parahoric-group-scheme`); [Bruhat–Tits extension principle](#RG2-3-extension-principle) (`ReductiveGroupsPartII:RG2.3/extension-principle`); [Reduced and enlarged buildings](#RG2-2-enlarged-and-reduced-building) (`ReductiveGroupsPartII:RG2.2/enlarged-and-reduced-building`); [Central morphisms and reduced buildings](#RG2-2-building-functoriality-central-extensions) (`ReductiveGroupsPartII:RG2.2/building-functoriality-central-extensions`).

**Uses.**

- Kisin–Zhou 2025, §§2.3–2.4 and §4: transports the parahoric level of a Hodge-type group to the groups of an abelian-type Shimura datum with the same adjoint group.
- Kisin–Pappas–Zhou 2026, §§7.1–7.2: chooses the level of the auxiliary Hodge-type datum from the given parahoric of the abelian-type datum.
- BunGAndNewtonStrata:BG1 (requests to RG2.3): reduction of Kottwitz–Newton statements to the adjoint group with a fixed parahoric.

**API.**

- `BruhatTits.ParahoricExt.associatedParahoric` (constructor): Given f with adjoint isomorphism and the parahoric 𝒢°_x of G, the parahoric group scheme 𝒢′°_{x′} of G′ for any lift x′ of x̄.
- `BruhatTits.ParahoricExt.associatedParahoric_eq_of_lift` (characterisation): For two lifts x′, x″ of x̄ the associated parahorics coincide.
- `BruhatTits.ParahoricExt.associatedParahoric_hom` (functoriality): f extends uniquely to an O-group homomorphism 𝒢°_x → 𝒢′°_{x′}.
- `BruhatTits.ParahoricExt.associatedParahoric_id` (simp): For f = id the associated parahoric of 𝒢°_x is 𝒢°_x.
- `BruhatTits.ParahoricExt.associatedParahoric_comp` (functoriality): For composable maps with adjoint isomorphisms, the associated parahoric of the associated parahoric is the associated parahoric for the composite.

**Unit tests.**

- `BruhatTits.ParahoricExt.associatedParahoric_sl2_gl2` (computation): For SL_2 → GL_2 and the standard vertex, the associated parahoric is GL_2 over O, whose O-points are GL_2(O).
- `BruhatTits.ParahoricExt.associatedParahoric_self` (degenerate): For f = id_G the construction returns 𝒢°_x itself.
- `BruhatTits.ParahoricExt.associatedParahoric_not_stabilizer` (non-example): For GL_2 → PGL_2 and x the barycentre of an edge, the associated parahoric has O-points the image of the Iwahori subgroup, which is strictly smaller than the stabilizer of x̄ in PGL_2(K) (an element exchanging the two vertices fixes x̄).
- `BruhatTits.ParahoricExt.associatedParahoric_generic_fibre` (compatibility): The generic fibre of the associated parahoric is G′, and its O^sh-points are G′(K^sh)_{x̄} ∩ ker κ_{G′}.

**Construction or proof.**

1. Reduced buildings depend only on the adjoint group (RG2.2/enlarged-and-reduced-building), and f induces the canonical equivariant identification of reduced buildings (RG2.2/building-functoriality-central-extensions); so x̄ determines a point of B(G′^ad,K).
2. Two lifts x′, x″ of x̄ differ by a translation in the central direction; translations by V_{Z} change neither the affine-root filtrations nor the connected fixers, hence 𝒢′°_{x′} = 𝒢′°_{x″} (Haines–Rapoport, Prop. 3: the connected parahoric depends only on the image in the reduced building; KP18 §1.1.2 arXiv p. 7).
3. f maps G(K^sh)°_x into G′(K^sh)°_{x′} (f is compatible with the root subgroups and with the Kottwitz maps), so the Bruhat–Tits extension principle (RG2.3/extension-principle, BT II 1.7.6) extends f to 𝒢 → 𝒢′; KZ 2.3.1 arXiv p. 11.

**Acceptance.**

- For G = SL_2 → G′ = GL_2 and x the standard vertex, 𝒢′ = GL_2 over O.
- For G = GL_2 → G′ = PGL_2 and x a vertex, the associated parahoric is the image PGL_2 over O (hyperspecial), and for x the barycentre of an edge it is the Iwahori group scheme of PGL_2, not the full stabilizer of the barycentre.

**Sources.**

- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): §2.3.1, arXiv v2 p. 11. Sets up Bruhat–Tits stabilizer schemes and connected stabilizers for bounded subsets of an apartment and, for a map inducing an adjoint isomorphism, transfers the building point through the reduced building and calls the resulting parahoric of the target the associated one, noting independence of the central lift.
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.1.2, arXiv v3 p. 7 (IHÉS pp. 127–128). Records that the connected parahoric group scheme at x depends only on the image of x in the building of the adjoint group, through the Haines–Rapoport description by the Kottwitz kernel.
- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Proposition 3, Remark 4 and Remark 11, pp. 1–3, 7. The connected fixer equals the fixer of the image in the reduced building intersected with the kernel of the Kottwitz homomorphism, so it does not see the central component of the point.

<a id="RG2-3-central-extensions-of-parahorics"></a>

### Parahorics under central extensions

Target `ReductiveGroupsPartII:RG2.3/central-extensions-of-parahorics`. Theorem; suggested declaration `BruhatTits.ParahoricExt.centralExtension_exact`.

Let α: G → G̃ be a central extension of connected reductive K-groups with kernel Z, x ∈ B(G,K) and x̃ = α_*(x) its image under the canonical map of buildings. (a) α extends uniquely to O-homomorphisms 𝒢_x → 𝒢̃_x̃ and 𝒢°_x → 𝒢̃°_x̃. (b) If G splits over a tamely ramified extension and Z is a torus or a finite group of order prime to p, the schematic closure 𝒵 of Z in 𝒢°_x is smooth, and 1 → 𝒵 → 𝒢°_x → 𝒢̃°_x̃ → 1 is an fppf exact sequence of O-groups; if moreover Z is a torus that is a direct summand of an induced torus, 𝒵 is the connected Néron model of Z; the closure of Z in 𝒢_x is smooth and equals ker(𝒢_x → 𝒢̃_x̃), but 𝒢_x → 𝒢̃_x̃ is in general not fppf surjective. (c) If Z is an R-smooth torus (no tameness assumed), the schematic closure 𝒵 of Z in 𝒢°_x is smooth with component group ker(X_*(Z)_I → X_*(T)_I) (T the centralizer of a maximal Ĕ-split torus), and 1 → 𝒵 → 𝒢°_x → 𝒢̃°_x̃ → 1 is fppf exact.

**Hypotheses.** α: G → G̃ central with kernel Z (multiplicative type); x ∈ B(G,K), x̃ = α_*(x); (b): G tamely split; Z a torus or finite of order prime to p; (c): Z an R-smooth torus.

**Prerequisites.** [Steinberg's theorem over the completed unramified field](#RG2-1-steinberg-quasi-split) (`ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`); [Edixhoven's tame fixed-point theorem](#RG2-0a-tame-fixed-points-of-weil-restriction) (`ReductiveGroupsPartII:RG2.0a/tame-fixed-points-of-weil-restriction`); [Exact torus sequences and connected integral models](#RG2-3-torus-models-exact-sequences) (`ReductiveGroupsPartII:RG2.3/torus-models-exact-sequences`); [Connected parahoric group schemes](#RG2-3-parahoric-group-scheme) (`ReductiveGroupsPartII:RG2.3/parahoric-group-scheme`); [Bruhat–Tits extension principle](#RG2-3-extension-principle) (`ReductiveGroupsPartII:RG2.3/extension-principle`); [Central morphisms and reduced buildings](#RG2-2-building-functoriality-central-extensions) (`ReductiveGroupsPartII:RG2.2/building-functoriality-central-extensions`).

**Construction or proof.**

1. (a) α maps G(K^sh)_x into G̃(K^sh)_x̃ and the connected fixer into the connected fixer (compatibility of α_* with root subgroups and Kottwitz maps), so the extension principle (RG2.3/extension-principle) applies; KP18 §1.1.3, arXiv p. 7.
2. (b) Reduce to K strictly henselian; G quasi-split (RG2.1/steinberg-quasi-split); α maps the integral root subgroups 𝒰_a isomorphically onto 𝒰̃_a (BT II 4.2.15, 4.3.2), the closure of the maximal torus T is the connected Néron model; an fppf exact sequence 1 → 𝒵 → 𝒯° → 𝒯̃° → 1 (RG2.3/torus-models-exact-sequences, Pappas–Rapoport Lemma 6.7; for finite Z via Res and tame fixed points, Edixhoven) gives the quotient 𝒢°_x/𝒵 (representable, RG2.3/quotients-over-a-dvr), and the induced map to 𝒢̃°_x̃ is an isomorphism on the big cell, hence an isomorphism (BT II 1.2.13, RG2.3/big-cell-criteria); KP18 Prop. 1.1.4 and Rem. 1.1.8, arXiv pp. 7–8.
3. (c) For R-smooth Z, the closure of Z in the lft Néron model of T is the subgroup with components ker(X_*(Z)_I → X_*(T)_I) (RG2.3/neron-model-closed-immersions); its intersection with 𝒯° is 𝒵, smooth; then exactness on O_Ĕ-points and the extension principle give 𝒯°/𝒵 ≅ 𝒯′° and the argument of (b); KZ Prop. 2.4.13, arXiv pp. 17–18.

**Acceptance.**

- SL_2 → PGL_2 (Z = μ_2, p odd): 1 → μ_2 → 𝒢°_x → 𝒢̃°_x̃ → 1 at a vertex x is the reduction of SL_2 → PGL_2 over O.
- GL_n → PGL_n (Z = G_m induced): 𝒵 = G_{m,O} and GL_n(O)/O^× ≅ PGL_n(O) at the standard vertex.
- Remark 1.1.8 caveat: for GL_2 → PGL_2 at the barycentre of an edge, 𝒢_x → 𝒢̃_x̃ is not surjective on O^sh-points, since the edge-swapping element of PGL_2(K^sh) fixes x̃ but has odd Kottwitz invariant.

**Sources.**

- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.1.3, Proposition 1.1.4 and proof, Remark 1.1.8, arXiv v3 pp. 7–8 (IHÉS pp. 128–129). Extends a central extension to stabilizer and parahoric schemes by 1.7.6, and for tame groups with torus or prime-to-p finite kernel proves smoothness of the closure of the kernel and fppf exactness via big cells, Néron models of tori and Edixhoven's fixed points; the remark gives the full-fixer variant and the failure of surjectivity.
- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): §2.4.12, Proposition 2.4.13 and proof, arXiv v2 pp. 17–18. For an R-smooth torus kernel, identifies the closure of the kernel through the lft Néron model, computes its component group as a kernel of coinvariants and proves the fppf exact sequence of associated parahorics.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §1.2.13, p. 20; §1.7.6, p. 39; §4.2.15, p. 95; §4.6, pp. 123–138. Big-cell isomorphism and extension criteria, compatibility of central isogenies with root valuations, and the integral fixer-model construction.
- [Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag varieties*](https://arxiv.org/abs/math/0607130): Lemma 6.7 and proof, pp. 28–29. Controls the connected Néron-model sequence and its defect by the torsion in cocharacter coinvariants.

<a id="RG2-3-hodge-type-fixer-immersion"></a>

### Closed immersion of fixer schemes for minuscule embeddings

Target `ReductiveGroupsPartII:RG2.3/hodge-type-fixer-immersion`. Theorem; suggested declaration `KisinPappas.fixer_closedImmersion_of_minuscule`.

Let K be a p-adic field (characteristic 0), G connected reductive over K split over a tamely ramified Galois extension K̃/K, ρ: G ↪ GL(V) a faithful minuscule representation and ι: B(G,K) → B(GL(V),K) the G(K)-equivariant toral embedding of RG2.2/minuscule-toral-embedding. For every x ∈ B(G,K), ρ extends to a closed immersion of O-group schemes ρ_x: 𝒢_x → 𝒢ℒ_{ι(x)} from the Bruhat–Tits stabilizer scheme of G at x to the stabilizer of the lattice chain of ι(x). The same holds in equal characteristic K = k((π)) for ρ and ι as in KP18 §1.2.27 (with the separability hypotheses there). Ingredients: (i) for a bounded Ω ⊂ B(G,K) = B(G,K̃)^Γ, (Res_{Õ/O} 𝒢_{Ω,K̃})^Γ ≅ 𝒢_{Ω,K}, hence a closed immersion 𝒢_{Ω,K} ↪ Res_{Õ/O} 𝒢_{Ω,K̃} (K̃/K finite tame Galois); (ii) ρ_x is a closed immersion as soon as the schematic closure of G in 𝒢ℒ_{ι(x)} is smooth.

**Hypotheses.** char K = 0 (or the equal-characteristic data of KP18 §1.2.27); G split over a finite tame Galois K̃/K with group Γ; ρ faithful and minuscule; ι as in RG2.2/minuscule-toral-embedding.

**Prerequisites.** [Parahorics of GL and GSp as lattice-chain automorphism groups](#RG2-3-lattice-chain-stabilizer-schemes) (`ReductiveGroupsPartII:RG2.3/lattice-chain-stabilizer-schemes`); [Edixhoven's tame fixed-point theorem](#RG2-0a-tame-fixed-points-of-weil-restriction) (`ReductiveGroupsPartII:RG2.0a/tame-fixed-points-of-weil-restriction`); [Weil restriction of integral models](#RG2-0a-integral-weil-restriction) (`ReductiveGroupsPartII:RG2.0a/integral-weil-restriction`); [Minuscule toral embeddings and descent](#RG2-2-minuscule-toral-embedding) (`ReductiveGroupsPartII:RG2.2/minuscule-toral-embedding`); [Schematic closure in an affine model](#RG2-3-schematic-closure) (`ReductiveGroupsPartII:RG2.3/schematic-closure`); [Smoothness and isomorphisms from root big cells](#RG2-3-big-cell-criteria) (`ReductiveGroupsPartII:RG2.3/big-cell-criteria`); [Bruhat–Tits extension principle](#RG2-3-extension-principle) (`ReductiveGroupsPartII:RG2.3/extension-principle`); [Smoothness of a split-torus model with all bounded points](#RG2-3-split-torus-bounded-model-smoothness) (`ReductiveGroupsPartII:RG2.3/split-torus-bounded-model-smoothness`).

**Construction or proof.**

1. Since G(K^ur)_x = G(K^ur) ∩ GL(V ⊗ K^ur)_{ι(x)} (ι injective and equivariant), the extension principle gives ρ_x: 𝒢_x → 𝒢ℒ_{ι(x)}; its schematic image is the closure 𝒢′ of G, with the same O^ur-points as 𝒢_x, so ρ_x is a closed immersion iff 𝒢′ is smooth (KP18 proof of Prop. 1.3.3, opening, arXiv p. 17).
2. Split case: for a maximal split torus T with x ∈ A(G,T,K), the image chain splits into rank-one lattices on the (minuscule) weight lines (KP18 (1.3.5)–(1.3.6), arXiv p. 18; the printed display has the index misprint recorded as ReductiveGroupsPartII/E42); the closures of the root groups are smooth by the rank-one computation in a common apartment (BT classiques 3.6, 3.9(2); the closure of u ↦ (1 u; 0 1) is Spec O[ϖ^{−c}u]), the closure of T is smooth since its O^ur-points are the maximal bounded subgroup (Prasad–Yu, J. Algebraic Geom. 2006, Lemma 4.1 as cited), and the big-cell criterion (RG2.3/big-cell-criteria, BT II 2.2.3, 2.2.5) gives smoothness.
3. Tame case: use (i), proved from the extension principle after base change to O^ur and the smoothness of tame fixed points (RG2.0a/tame-fixed-points-of-weil-restriction, Edixhoven Prop. 3.4) with K̃/K taken finite (KP18 §1.3.8 and Prop. 1.3.9 take K̃ = K̃^ur, a gap recorded as ReductiveGroupsPartII/E41), and the commutative diagram (1.3.11)–(1.3.12) comparing ι with the split-field Levi embeddings and the closed immersion of Weil-restricted chain stabilizers (BT classiques 3.5, 3.9).
4. Equal characteristic: the same proof with the embedding of KP18 §1.2.27 (KP18 §1.3.13).

**Acceptance.**

- For G = GL(V) and ρ the identity, ρ_x is the identity of 𝒢ℒ_x.
- For G = GSp(V) ⊂ GL(V) (standard representation, minuscule), ρ_x is the closed immersion 𝒢𝒮𝒫_x ⊂ 𝒢ℒ_x of RG2.3/lattice-chain-stabilizer-schemes.
- Non-minuscule warning (KP18 Rem. 1.3.7): for the adjoint representation of SL_2 the image chain need not split into weight lines, and the argument does not apply.

**Sources.**

- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.3.1, Proposition 1.3.3 and proof, (1.3.5)–(1.3.12), §1.3.8, Proposition 1.3.9, §1.3.13, arXiv v3 pp. 16–20 (IHÉS pp. 139–143). States and proves that a faithful minuscule representation extends to closed immersions of stabilizer schemes into chain stabilizers: reduction to smoothness of a schematic closure, splitting of the image chain into weight lines, smooth root-group and torus closures, the tame fixed-point comparison of stabilizer schemes and the diagram with Levi embeddings, and the equal-characteristic variant.
- [François Bruhat, Jacques Tits, *Schémas en groupes et immeubles des groupes classiques sur un corps local*](http://www.numdam.org/item/10.24033/bsmf.2006.pdf): 3.5, 3.6, 3.9(2), printed pp. 287–289. Computes the schematic closures of root groups and tori acting on lattices of a common apartment and shows faithfulness, giving smoothness of the rank-one closures.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §§2.2.3–2.2.5, pp. 44–45. Uses the smooth torus and root closures in a big cell to obtain smoothness of the schematic closure.
- [Bas Edixhoven, *Néron models and tame ramification*](http://www.numdam.org/item/CM_1992__81_3_291_0.pdf): Proposition 3.4, printed p. 294. Fixed points of a tame finite group acting semilinearly on a smooth scheme are smooth.
- [Gopal Prasad, Jiu-Kang Yu; appendix by Brian Conrad, *On quasi-reductive group schemes*](https://math.stanford.edu/~conrad/papers/qrg.pdf): Lemma 4.1, author-copy pp. 7–8. The previously indirect input is now a directly read target in this layer, with its separate hypotheses.

<a id="RG2-3-parahoric-subgroup"></a>

### Parahoric, Iwahori and pro-p Iwahori subgroups

Target `ReductiveGroupsPartII:RG2.3/parahoric-subgroup`. Definition; suggested declaration `BruhatTits.parahoricSubgroup`.

A parahoric subgroup P_F⊂G(K) is G_F°(O) for a reduced facet F. An Iwahori is P_C for an alcove C. Define P_F^+ as the kernel of reduction to the maximal reductive special-fibre quotient; for a local field it is pro-p. Thus an Iwahori pro-p radical is I^+=P_C^+. Over E these subgroups are Frobenius-fixed points of their L counterparts. For semisimple buildings, maximal parahorics correspond to vertices; use reduced facets when a split centre is present. They are compact open over local fields and have finitely many conjugacy classes.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; A parahoric subgroup P_F⊂G(K) is G_F°(O) for a reduced facet F.

**Prerequisites.** [Connected parahoric group schemes](#RG2-3-parahoric-group-scheme) (`ReductiveGroupsPartII:RG2.3/parahoric-group-scheme`); [Integral points of an affine model are compact open](#RG2-0-integral-points-compact-open) (`ReductiveGroupsPartII:RG2.0/integral-points-compact-open`); [Facets and special points](#RG2-2-facets-and-special-points) (`ReductiveGroupsPartII:RG2.2/facets-and-special-points`).

**Uses.**

- He §1.1: Iwahori cells and positive-depth groups use I..
- RG2.4/parahoric-double-cosets: P_F and P_F′ define the double-coset quotients..

**API.**

- `BruhatTits.parahoricSubgroup` (constructor): The connected model O-points as a subgroup of G(K).
- `BruhatTits.iwahoriSubgroup` (constructor): The parahoric at an alcove.
- `BruhatTits.positiveRadical` (constructor): The reduction kernel to the reductive quotient.
- `BruhatTits.parahoricSubgroup_conj` (functoriality): P_(gF)=gP_Fg⁻¹.
- `BruhatTits.parahoricSubgroup_compactOpen` (other): Over a local field every P_F is compact open.
- `BruhatTits.iwahoriPositive_proP` (other): For local residue characteristic p, I^+ is pro-p.

**Unit tests.**

- `BruhatTits.parahoricSubgroup.sl2_iwahori` (computation): For SL_2, the standard Iwahori consists of integral matrices upper triangular modulo ϖ.
- `BruhatTits.parahoricSubgroup.splitTorus` (degenerate): For a split torus its only parahoric is T(O).
- `BruhatTits.parahoricSubgroup.points_compat` (compatibility): P_F equals the connected model integral-points image.
- `BruhatTits.parahoricSubgroup.edge_stabilizer` (non-example): The full PGL_2 edge stabilizer includes an inversion excluded from its Iwahori.

**Construction or proof.**

1. Embed integral points through the generic-fibre identification.
2. Use the alcove and reductive reduction definitions for I and its positive radical.
3. Descent, compact openness and finite facet types give the structural properties.

**Acceptance.**

- A maximal compact full stabilizer need not itself be a connected parahoric.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §5.2.6–5.2.8, printed pp. 164–165. Embed integral points through the generic-fibre identification. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Definition 1, p. 1. Embed integral points through the generic-fibre identification. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-parahoric-kottwitz-characterization"></a>

### Parahorics as fixers in the Kottwitz kernel

Target `ReductiveGroupsPartII:RG2.3/parahoric-kottwitz-characterization`. Theorem; suggested declaration `BruhatTits.parahoric_kottwitz_characterization`.

Over L, for Ω a nonempty bounded subset of an apartment, G_Ω°(O_L)=Fix_(G(L))(Ω)∩ker κ_G=Fix_(G(L))(Ω_red)∩ker κ_G. The connected fixer has finite abelian quotient in the full enlarged fixer, identified by κ with a subgroup of the torsion of π₁(G)_I. Taking Frobenius fixed points yields the corresponding E formula. The full enlarged fixer is the reduced fixer intersected with G(L)^1, where G(L)^1 is the kernel of κ followed by quotienting its target torsion; ker κ itself can be smaller.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; Over L, for Ω a nonempty bounded subset of an apartment, G_Ω°(O_L)=Fix_(G(L))(Ω)∩ker κ_G=Fix_(G(L))(Ω_red)∩ker κ_G.

**Prerequisites.** [Connected parahoric group schemes](#RG2-3-parahoric-group-scheme) (`ReductiveGroupsPartII:RG2.3/parahoric-group-scheme`); [The Kottwitz homomorphism](#RG2-1-kottwitz-homomorphism) (`ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism`).

**Construction or proof.**

1. Prove first for tori by the connected Néron model.
2. Use simply connected derived groups and their torus quotients.
3. Reduce the general case by a z-extension; its induced kernel torus has torsion-free coinvariants.

**Acceptance.**

- Distinguish G(L)^1 from G(L)_1=ker κ_G.

**Sources.**

- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Proposition 3, Remark 4 and Remark 11, pp. 1–3, 7. Prove first for tori by the connected Néron model. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Parahorics and the Kottwitz kernel**.

<a id="RG2-3-reductive-quotient-of-special-fibre"></a>

### Reductive special-fibre quotients

Target `ReductiveGroupsPartII:RG2.3/reductive-quotient-of-special-fibre`. Construction; suggested declaration `BruhatTits.ResidualGroup.group`.

For a parahoric model G_F° over O with perfect residue field κ, define Ḡ_F as its special fibre modulo its smooth connected unipotent radical. This is connected reductive. Its relative root datum comes from the effective affine root groups with nonzero reduction at F (and their opposites); over a split apartment their gradients are the roots of affine hyperplanes containing F. The connected torus chart reduces to its maximal torus. Reduction P_F→Ḡ_F(κ) is surjective for complete O when κ is finite or separably closed, and its kernel P_F^+ is the positive radical.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For a parahoric model G_F° over O with perfect residue field κ, define Ḡ_F as its special fibre modulo its smooth connected unipotent radical.

**Prerequisites.** [Connected parahoric group schemes](#RG2-3-parahoric-group-scheme) (`ReductiveGroupsPartII:RG2.3/parahoric-group-scheme`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`; [Reduction and congruence quotients of smooth models](#RG2-0-smooth-model-congruence-quotients) (`ReductiveGroupsPartII:RG2.0/smooth-model-congruence-quotients`).

**Uses.**

- Fintzen §3: The residual group acts on graded Moy–Prasad pieces..
- RG2.4/parahoric-double-cosets: Residual parabolics identify facet Weyl subgroups..

**API.**

- `BruhatTits.ResidualGroup.group` (constructor): The maximal reductive quotient Ḡ_F.
- `BruhatTits.ResidualGroup.reduction` (data): The reduction homomorphism P_F→Ḡ_F(κ).
- `BruhatTits.ResidualGroup.reduction_surjective` (other): Surjectivity under the stated complete/finite-or-separably-closed hypotheses.
- `BruhatTits.ResidualGroup.positiveRadical_eq_ker` (simp): P_F^+ is its kernel.
- `BruhatTits.ResidualGroup.rootDatum` (relation): Residual roots arise from effective affine root charts at F.

**Unit tests.**

- `BruhatTits.ResidualGroup.hyperspecialGL` (computation): At the standard GL_n vertex the quotient is GL_n,κ.
- `BruhatTits.ResidualGroup.iwahori` (degenerate): For a split Iwahori the reductive quotient is its split torus.
- `BruhatTits.ResidualGroup.quotient_compat` (compatibility): The group is the anchor quotient by the smooth unipotent radical.
- `BruhatTits.ResidualGroup.specialFibre_not_quotient` (non-example): The SL_2 Iwahori special fibre has dimension 3 whereas its reductive torus quotient has dimension 1.

**Construction or proof.**

1. Compute reduction of each root chart and its opposite; identify the residual root system.
2. Apply the anchor unipotent radical and quotient construction.
3. Hensel lift smooth points and use Lang for the unipotent torsors in finite residue characteristic.

**Acceptance.**

- Do not identify the whole parahoric special fibre with its reductive quotient.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.6.9–4.6.14, pp. 125–128; 5.1.31–5.1.32, pp. 158–159. Compute reduction of each root chart and its opposite; identify the residual root system. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Reductive special-fibre quotient**.

<a id="RG2-3-unramified-base-change-of-parahorics"></a>

### Unramified base change of connected models

Target `ReductiveGroupsPartII:RG2.3/unramified-base-change-of-parahorics`. Theorem; suggested declaration `BruhatTits.unramified_base_change_of_parahorics`.

For an unramified extension K′/K the base change G_F°⊗O O′ identifies with the connected fixer of the transported subset F in B(G,K′); it is the parahoric attached to the facet with those effective depth bounds. In the maximal-unramified comparison, an E-facet corresponds to an appropriate σ-stable L-facet and P_F(E)=P_F(L)^σ. The analogous statements hold for Iwahoris after choosing a σ-stable alcove. A general finite unramified extension need not carry every base facet to a facet of the same dimension if the relative split rank changes.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For an unramified extension K′/K the base change G_F°⊗O O′ identifies with the connected fixer of the transported subset F in B(G,K′); it is the parahoric attached to the facet with those effective depth bounds.

**Prerequisites.** [Connected parahoric group schemes](#RG2-3-parahoric-group-scheme) (`ReductiveGroupsPartII:RG2.3/parahoric-group-scheme`); [Unramified descent of buildings](#RG2-2-unramified-descent-of-building) (`ReductiveGroupsPartII:RG2.2/unramified-descent-of-building`).

**Construction or proof.**

1. Unramified root charts and connected torus models commute with base change.
2. Use the extension principle to identify the smooth models from strict-henselian points.
3. Take σ-fixed points and compare the descended facet.

**Acceptance.**

- Describe the transported subset rather than assuming unchanged facet dimension.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.6.20(b), p. 133; 5.1.9, 5.1.25, pp. 149, 155. Unramified root charts and connected torus models commute with base change. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Remark 9, pp. 5–6. Unramified root charts and connected torus models commute with base change. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-invariant-chain-direct-summand"></a>

### Direct summand from a tame invariant lattice chain

Target `ReductiveGroupsPartII:RG2.3/invariant-chain-direct-summand`. Theorem; suggested declaration `KisinPappas.invariant_chain_direct_summand`.

In the tame Γ-stable lattice setup of KPZ Lemma 2.3.3, pass to the maximal unramified base so that K̃/K is totally ramified of degree e prime to p and π̃^e∈O. Let Λ̃_i be the inertia eigensublattices of the stable Õ-lattice Λ̃, and Λ_i=π̃^iΛ̃_{−i mod e}⊂V. Multiplication by π̃^{−i} gives an O-module isomorphism ⊕_{i=0}^{e−1}Λ_i≃Λ̃. The total lattice tot(L), defined using the distinct members of a determining chain segment, is a direct summand; its complement is the sum of the repeated Λ_i. Retain all e inertia characters before deleting repeated chain entries.

**Hypotheses.** The field, group and other hypotheses in the statement apply throughout.

**Prerequisites.** [Parahorics of GL and GSp as lattice-chain automorphism groups](#RG2-3-lattice-chain-stabilizer-schemes) (`ReductiveGroupsPartII:RG2.3/lattice-chain-stabilizer-schemes`); [Edixhoven's tame fixed-point theorem](#RG2-0a-tame-fixed-points-of-weil-restriction) (`ReductiveGroupsPartII:RG2.0a/tame-fixed-points-of-weil-restriction`); [GL building through additive norms and lattice chains](#RG2-2-gl-building-lattice-chains) (`ReductiveGroupsPartII:RG2.2/gl-building-lattice-chains`).

**Construction or proof.**

1. Since e is invertible and the residue field is separably closed, inertia characters and their idempotent projectors split the O-module Λ̃.
2. Use π̃ powers to identify each eigensummand with the corresponding K-lattice in the periodic chain.
3. Choose one copy of each distinct lattice in the determining segment. The other copies give an explicit O-module complement, proving split injectivity.

**Acceptance.**

- If every adjacent chain entry is distinct, tot(L) is the full direct sum; repetitions make the inclusion proper.

**Sources.**

- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §2.3.6, equations (2.3.7)–(2.3.8), arXiv v3 p. 15. Direct summand from a tame invariant lattice chain: the cited result supplies the construction or argument with the hypotheses stated here.

<a id="RG2-3-r-smooth-fixer-immersions"></a>

### Closed immersions of fixers for R-smooth groups

Target `ReductiveGroupsPartII:RG2.3/r-smooth-fixer-immersions`. Theorem; suggested declaration `KisinPappas.fixer_closedImmersion_of_rSmooth`.

Let F be a finite extension of ℚ_p or of Q̆_p, G connected reductive over F and 𝒢̃ = 𝒢_x the Bruhat–Tits stabilizer scheme of x ∈ B(G,F). (a) (KZ Prop. 2.4.8) If β: G ↪ G′ is a closed immersion of reductive groups inducing G^der ≅ G′^der, x′ the induced point of B(G′,F) and the centralizer of some maximal F̆-split torus of G is R-smooth, then β extends to a closed immersion 𝒢_x → 𝒢′_{x′}. (b) (KZ Prop. 2.4.10) If p > 2, K/F is a finite extension and the centralizer of a maximal F̆-split torus of G is R-smooth, the natural map i: 𝒢_x → Res_{O_K/O_F} 𝒢_{x,K} into the Weil restriction of the stabilizer scheme over K is a closed immersion. (c) (KPZ Prop. 2.1.5(3)) Combining: for a finite extension K̃/F, a closed immersion G → G′ with G^der ≅ G′^der, p > 2 and G R-smooth, G → Res_{K̃/F} G′_{K̃} extends to a closed immersion 𝒢_x → Res_{Õ/O} 𝒢′_{x′} over K̃. (d) (KZ Lemma 2.4.11) For G = SL_2 the map of (b) is a closed immersion: for the root group, ϖ_F^n is a primitive vector of the O_F-module ϖ_K^{ne−k} O_K (0 ≤ k < e), so the diagonal G_a → Res G_a extends to the closed immersion A¹ → A^{[K:F]}, a ↦ (a,0,…,0).

**Hypotheses.** F p-adic (finite over ℚ_p or Q̆_p); R-smoothness of the centralizer of a maximal F̆-split torus; (b),(c): p > 2.

**Prerequisites.** [Weil restriction of integral models](#RG2-0a-integral-weil-restriction) (`ReductiveGroupsPartII:RG2.0a/integral-weil-restriction`); [Closed immersion of fixer schemes for minuscule embeddings](#RG2-3-hodge-type-fixer-immersion) (`ReductiveGroupsPartII:RG2.3/hodge-type-fixer-immersion`); [R-smooth tori and reductive groups](#RG2-3-r-smooth-torus) (`ReductiveGroupsPartII:RG2.3/r-smooth-torus`); [Closed immersions of torus Néron models](#RG2-3-neron-model-closed-immersions) (`ReductiveGroupsPartII:RG2.3/neron-model-closed-immersions`); [Schematic closure in an affine model](#RG2-3-schematic-closure) (`ReductiveGroupsPartII:RG2.3/schematic-closure`); [Smoothness and isomorphisms from root big cells](#RG2-3-big-cell-criteria) (`ReductiveGroupsPartII:RG2.3/big-cell-criteria`); [Smooth models of bounded fixers](#RG2-3-bruhat-tits-group-scheme) (`ReductiveGroupsPartII:RG2.3/bruhat-tits-group-scheme`).

**Construction or proof.**

1. Reduce to F = F̆ (stabilizer schemes commute with unramified base change); choose a maximal F̆-split S with x ∈ A(G,S,F̆) and T = Z_G(S); by R-smoothness T → T′ extends to a closed immersion of finite-type Néron models (RG2.3/neron-model-closed-immersions, KZ Lemma 2.4.4); root groups of G and G′ correspond since G^der ≅ G′^der; the closure of G in 𝒢′_{x′} has a big cell with smooth factors, hence is smooth and equals 𝒢_x by the extension principle (KZ Prop. 2.4.8 proof, arXiv p. 15).
2. For (b): reduce to G = G_α of the form Res_{L/F} H with H tamely split (possible as p > 2), then to the tame case via KP18 Prop. 1.3.9 (closed immersion 𝒢 → Res 𝒢_{K_t}) and to SL_2 root groups via (d) (KZ Prop. 2.4.10 proof, arXiv pp. 16–17).
3. For (d): explicit lattice computation in KZ Lemma 2.4.11 (arXiv p. 17); primitivity holds because ϖ_F^n has K-valuation ne < ne + e − k.
4. For (c): compose (a) over K̃ with (b) (KPZ proof of Prop. 2.1.5(3), arXiv p. 11).

**Acceptance.**

- For G = G′ = GL_n and K/F unramified, (b) is the closed immersion GL(Λ) → Res_{O_K/O_F} GL(Λ ⊗ O_K) given by the unit of the Weil restriction adjunction.
- (d) for K = F(ϖ_F^{1/2}) (e = 2) and k = 1: ϖ_F^n lies in ϖ_K^{2n−1}O_K and extends to the O_F-basis {ϖ_F^n, ϖ_K^{2n−1}}.

**Sources.**

- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): §2.4.7, Proposition 2.4.8, Proposition 2.4.10, Lemma 2.4.11, arXiv v2 pp. 15–17. Proves that closed immersions with equal derived groups extend to closed immersions of stabilizer schemes under R-smoothness, that the map into the Weil restriction of the stabilizer over an extension is a closed immersion for p > 2, and the rank-one lattice lemma.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §2.1.4 and Proposition 2.1.5(3) with proof, arXiv v3 p. 11. States the combined closed immersion into the Weil restriction of the target stabilizer over a finite extension, for R-smooth G and p > 2, from the Kisin–Zhou arguments and the closed immersion of finite-type Néron models.

<a id="RG2-3-moy-prasad-filtration"></a>

### The Moy–Prasad filtration

Target `ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`. Construction; suggested declaration `MoyPrasad.filtration`.

Let G be connected reductive over K (henselian, discretely valued, perfect residue field; E or Ĕ), x ∈ B^e(G,K) and r ∈ ℝ_{≥0}. Over K^sh, with S a maximal K^sh-split torus whose apartment contains x and T = Z_G(S) (a torus, G quasi-split over K^sh), put T(K^sh)_0 = 𝒯°(O^sh) (connected Néron model), T(K^sh)_r = {t ∈ T(K^sh)_0 : ω(χ(t) − 1) ≥ r for all χ ∈ X^*(T) over a splitting field, with the valuation extending the normalized one} for r > 0, and U_{a,x,r} = the root-group filtration subgroup of affine roots α with gradient a and α(x) ≥ r (RG2.1/affine-roots-and-filtrations). The Moy–Prasad subgroup G(K^sh)_{x,r} is the subgroup generated by T(K^sh)_r and all U_{a,x,r}; G(K)_{x,r} := G(K^sh)_{x,r} ∩ G(K) (Galois-fixed points). Put G_{x,r+} := ∪_{s>r} G_{x,s}. Then G_{x,0} is the parahoric subgroup 𝒢°_x(O) of x, the filtration is decreasing and left-continuous: for each r there is ε>0 with G_{x,r−ε}=G_{x,r} (at r=0 use the nonnegative domain), each G_{x,r} is normal in G_{x,0}, [G_{x,r}, G_{x,s}] ⊆ G_{x,r+s}, it is independent of S, equivariant (G_{gx,r} = gG_{x,r}g^{−1}), and constant in x along the central direction. No tameness or condition on p is needed for the definition (only for comparisons with extensions).

**Hypotheses.** G connected reductive over K; x ∈ B^e(G,K); r ≥ 0; valuation normalized on K.

**Prerequisites.** [Affine roots and root-group filtrations](#RG2-1-affine-roots-and-filtrations) (`ReductiveGroupsPartII:RG2.1/affine-roots-and-filtrations`); [Commutator estimates for valued root groups](#RG2-1-valued-commutator-estimates) (`ReductiveGroupsPartII:RG2.1/valued-commutator-estimates`); `tauceti:TauCeti.unitFiltration`; [Parahoric, Iwahori and pro-p Iwahori subgroups](#RG2-3-parahoric-subgroup) (`ReductiveGroupsPartII:RG2.3/parahoric-subgroup`); [Reductive special-fibre quotients](#RG2-3-reductive-quotient-of-special-fibre) (`ReductiveGroupsPartII:RG2.3/reductive-quotient-of-special-fibre`); [Bruhat–Tits building](#RG2-2-building) (`ReductiveGroupsPartII:RG2.2/building`).

**Uses.**

- Fintzen 2021, §§3–7: depth of representations, data contained in a representation, and the construction of types are all expressed through G_{x,r}, G_{x,r+}.
- He 2018, §4: the congruence levels I_n of the Iwahori used for Newton decompositions of Hecke algebras.
- SmoothRepresentationsOfLocalGroups:SR.0: every smooth representation has a vector fixed by some G_{x,r}; depth zero and positive depth.
- GeometricSatakeAndFusion:GS0 (congruence filtrations): graded pieces of the positive loop group filtration at a facet.

**API.**

- `MoyPrasad.filtration` (constructor): G_{x,r} ⊆ G(K) for x in the apartment (or building) and r ≥ 0.
- `MoyPrasad.filtrationPlus` (constructor): G_{x,r+} := the union (supremum) of G_{x,s} over s > r.
- `MoyPrasad.filtration_zero` (characterisation): G_{x,0} equals the parahoric subgroup of x.
- `MoyPrasad.filtration_antitone` (relation): r ≤ s implies G_{x,s} ⊆ G_{x,r}.
- `MoyPrasad.filtration_normal` (relation): For r ≥ 0, G_{x,r} is normal in G_{x,0}.
- `MoyPrasad.commutator_filtration_le` (relation): [G_{x,r}, G_{x,s}] ⊆ G_{x,r+s}.
- `MoyPrasad.filtration_conj` (functoriality): g G_{x,r} g^{−1} = G_{gx,r} for g ∈ G(K).
- `MoyPrasad.filtration_eq_closure_generators` (characterisation): At every r≥0, G_{x,r} is generated by T_r and the U_{a,x,r}; at r>0 their ordered root–torus product is bijective. At depth zero use big-cell charts and generation.

**Unit tests.**

- `MoyPrasad.filtration_GL_vertex` (computation): For GL_n, the standard vertex and an integer r ≥ 1, G_{x,r} = {g ∈ GL_n(O) : g ≡ 1 mod ϖ^r}.
- `MoyPrasad.filtration_split_torus` (compatibility): For the split torus G_m^n and r > 0, G_{x,r} = (1 + m^{⌈r⌉})^n, the n-th power of Tau Ceti's unit filtration subgroup at depth ⌈r⌉.
- `MoyPrasad.filtrationPlus_zero_eq_proUnipotent` (degenerate): G_{x,0+} is the pro-unipotent radical P_x^+ (kernel of reduction to the reductive quotient).
- `MoyPrasad.filtration_jump_nonexample` (non-example): For SL_2 at the standard vertex, G_{x,1/2} = G_{x,1} (no affine root takes a value in (1/2, 1)), so the filtration is not strictly decreasing in r; a definition indexed by ℕ with strict decrease at every step would be wrong.

**Construction or proof.**

1. Define at all nonnegative depths by subgroup generation. At r>0 the ordered product of negative root factors, torus factor and positive root factors is bijective, by valued commutator estimates and rank-one identities. At r=0 the analogous product is only the integral big cell; its translates generate the parahoric, not a global product decomposition. Discreteness gives left continuity.
2. Independence of S: two apartments containing x are conjugate by an element of the parahoric fixing x (RG2.2/building-apartment-axioms), which normalizes the generating sets.
3. Descent to K: the construction is Gal(K^sh/K)-equivariant (canonical), so take fixed points; for r = 0 this recovers the parahoric (RG2.3/parahoric-subgroup), for r > 0 the integer-depth groups at the barycentre of an alcove are He's I_n (He 2018 §4.2, arXiv v3 p. 12).
4. Normality and commutator relations follow from the commutator estimates and the torus action on root groups (V5).

**Acceptance.**

- For GL_n and x the standard vertex: G_{x,r} = 1 + ϖ^{⌈r⌉} M_n(O) for r > 0 and GL_n(O) for r = 0.
- For a split torus T = G_m^n and any x: T_{x,r} = (1 + m^{⌈r⌉})^n for r > 0 and (O^×)^n for r = 0 (Tau Ceti unit filtration).
- For SL_2 and x the barycentre of the standard edge, G_{x,1/2} is the pro-p Iwahori subgroup and G_{x,0} the Iwahori subgroup.

**Sources.**

- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): §3, arXiv v2 pp. 8–9. Fixes the notation G(E)_{x,r} for the Moy–Prasad subgroups of depth r ≥ 0 at points of the enlarged building, G_{x,r+} and G(E)_r, the Lie and dual lattices for every real r, the normalization by the valuation extending that of k, the tame comparison (g_E)_{x,r} ∩ g = g_{x,r}, the depth of a dual element, and the reductive quotient G_x with G_x(f_F) = G(F)_{x,0}/G(F)_{x,0+} acting on V_{x,r}.
- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §4.2 and §4.3, arXiv v3 p. 12. Uses the n-th Moy–Prasad subgroup I_n attached to the barycentre of the base alcove, a fundamental system of open compact subgroups, and compares it with the corresponding subgroup over Ĕ through Frobenius fixed points.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §4.6 (schémas 𝔊 attached to concave functions), printed pp. 123–145. Constructs smooth models attached to concave functions on the root system; the Moy–Prasad subgroups are the integral points of such models for the concave function r − a(x).

Atlas planet: **Moy–Prasad filtration**.

<a id="RG2-3-torus-parahoric-example"></a>

### Parahorics of nonsplit tori

Target `ReductiveGroupsPartII:RG2.3/torus-parahoric-example`. Application; suggested declaration `LevelSubgroups.normOneTorus_parahoric_index`.

Let E′/E be a separable quadratic extension and T = R^1_{E′/E} G_m the norm-one torus, so T(E) = {u ∈ E′^× : N(u) = 1} is compact and B(T,E) is a point. (a) If E′/E is unramified, X_*(T)_I = ℤ (inertia acts trivially) with σ acting by −1, (X_*(T)_I)^σ = 0 and (X_*(T)_I)_tors = 0: the finite-type and connected Néron models coincide and T(E)_0 = T(E). (b) If E′/E is ramified (p odd), inertia acts on X_*(T) = ℤ by −1, X_*(T)_I = ℤ/2: the connected Néron model has index-2 points T(E)_0 = ker(κ_T) ⊊ T(E) = 𝒯^ft(O), with T(E)/T(E)_0 ≅ ℤ/2 detected by u ↦ u mod ϖ_{E′} ∈ {±1}. So for tori the full fixer (the unique bounded stabilizer) and the parahoric differ exactly when (X_*(T)_I)_tors ≠ 0.

**Hypotheses.** E′/E separable quadratic; p odd in the ramified case.

**Prerequisites.** [Nonsplit tori: apartments and Kottwitz maps](#RG2-1-nonsplit-torus-example) (`ReductiveGroupsPartII:RG2.1/nonsplit-torus-example`); [The Kottwitz homomorphism of a torus](#RG2-1-kottwitz-homomorphism-torus) (`ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism-torus`); [Norm maps and norm-one tori](#RG2-0a-norm-torus) (`ReductiveGroupsPartII:RG2.0a/norm-torus`); [Bounded and connected torus models](#RG2-3-neron-finite-type-and-connected-models) (`ReductiveGroupsPartII:RG2.3/neron-finite-type-and-connected-models`); [Parahorics as fixers in the Kottwitz kernel](#RG2-3-parahoric-kottwitz-characterization) (`ReductiveGroupsPartII:RG2.3/parahoric-kottwitz-characterization`).

**Construction or proof.**

1. Compute X_*(T) = ℤ with the nontrivial Galois element acting by −1 (dual of the augmentation-cokernel description of RG2.0a/norm-torus); compute coinvariants.
2. Apply the identification of 𝒯^ft(O)/𝒯°(O) with (X_*(T)_I)_tors^σ and T(E)_0 = ker κ_T (RG2.3/neron-finite-type-and-connected-models, RG2.1/kottwitz-homomorphism-torus); in the ramified case u = −1 has norm 1 and reduction −1 ≠ 1, giving a nontrivial component.

**Acceptance.**

- Ramified example E = ℚ_3, E′ = ℚ_3(√3): −1 ∈ T(E) ∖ T(E)_0.
- Unramified example E′ = ℚ_9 over ℚ_3: T(E) = T(E)_0.

**Sources.**

- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): proof of Proposition 3 a) and the lemma on T(L) ∩ K_F, pp. 2–3. For tori, the Kottwitz map identifies T(L)/T(L)_1 with X_*(T)_I and the parahoric with its kernel, so the finite-type and connected models differ by the torsion of the coinvariants.
- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): §2.4.1, arXiv v2 p. 12. Introduces the lft, finite-type and connected Néron models of a torus with component groups X_*(T)_I and its torsion subgroup.

<a id="RG2-3-fixer-versus-parahoric"></a>

### When full fixers are connected

Target `ReductiveGroupsPartII:RG2.3/fixer-versus-parahoric`. Theorem; suggested declaration `BruhatTits.fixer_versus_parahoric`.

The full fixer model equals its connected model iff its special-fibre component group vanishes. In particular torsion-free π₁(G)_I forces connected full enlarged fixers. For semisimple simply connected G, facet pointwise fixers and facet setwise stabilizers coincide with parahorics since the action preserves types. If a facet fixer is connected, the fixer of a facet in its closure is connected under van Hoften Lemma 2.2.4. For a very special vertex, use KZ Lemma 4.2.4 with derived group a product of restrictions of split groups and torsion-free inertia coinvariants of the abelianized cocharacters. Neither arbitrary point stabilizers nor adjoint groups satisfy the simply connected claim.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; The full fixer model equals its connected model iff its special-fibre component group vanishes.

**Prerequisites.** [Parahorics as fixers in the Kottwitz kernel](#RG2-3-parahoric-kottwitz-characterization) (`ReductiveGroupsPartII:RG2.3/parahoric-kottwitz-characterization`); [Pointwise fixers and setwise stabilizers](#RG2-2-stabilizers-and-fixers) (`ReductiveGroupsPartII:RG2.2/stabilizers-and-fixers`).

**Construction or proof.**

1. Embed fixer components in torsion Kottwitz classes.
2. Apply type preservation for the simply connected case.
3. Use the residual parabolic and special-vertex component arguments in the cited lemmas.

**Acceptance.**

- The PGL_2 edge inversion is a counterexample to dropping simple connectedness.

**Sources.**

- [Pol van Hoften (Appendix A by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*](https://arxiv.org/abs/2010.10496): Lemmas 2.2.2 and 2.2.4, pp. 10–11. Embed fixer components in torsion Kottwitz classes. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): Lemma 4.2.4, pp. 34–35. Embed fixer components in torsion Kottwitz classes. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-pro-unipotent-radical-and-nested-facets"></a>

### Positive radicals and nested facets

Target `ReductiveGroupsPartII:RG2.3/pro-unipotent-radical-and-nested-facets`. Theorem; suggested declaration `BruhatTits.pro_unipotent_radical_and_nested_facets`.

For E local of residue characteristic p, P_F^+ is a normal pro-p subgroup and P_F/P_F^+=Ḡ_F(κ). If F⊂closure(F′), then P_F′⊂P_F and P_F^+⊂P_F′^+. The generic identity extends to G_F′°→G_F°. The image in Ḡ_F is the rational-point subgroup of a residual parabolic, with reductive Levi quotient Ḡ_F′. Facets having F in their closure correspond to residual parabolics in the link; restrict to the same apartment for the based-parabolic version.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For E local of residue characteristic p, P_F^+ is a normal pro-p subgroup and P_F/P_F^+=Ḡ_F(κ).

**Prerequisites.** [Reductive special-fibre quotients](#RG2-3-reductive-quotient-of-special-fibre) (`ReductiveGroupsPartII:RG2.3/reductive-quotient-of-special-fibre`); [Reduction and congruence quotients of smooth models](#RG2-0-smooth-model-congruence-quotients) (`ReductiveGroupsPartII:RG2.0/smooth-model-congruence-quotients`); [Bruhat–Tits extension principle](#RG2-3-extension-principle) (`ReductiveGroupsPartII:RG2.3/extension-principle`).

**Construction or proof.**

1. Effective affine-root depth bounds give the inclusions and generic-identity model map.
2. In the residual root system the additional facet inequalities select a parabolic and its Levi roots.
3. The reduction kernel is an inverse limit of finite unipotent p-group quotients.

**Acceptance.**

- The two inclusions for P and P^+ have opposite directions.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): 4.6.24–4.6.25, pp. 134–135; 5.1.32, p. 159. Effective affine-root depth bounds give the inclusions and generic-identity model map. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §3.5, pp. 53–54. Effective affine-root depth bounds give the inclusions and generic-identity model map. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-hyperspecial-vertices"></a>

### Hyperspecial points and reductive models

Target `ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`. Theorem; suggested declaration `BruhatTits.hyperspecial_vertices`.

A reduced vertex x is hyperspecial iff its connected fixer model is reductive; this is equivalent to the full enlarged point-fixer model being reductive and agrees with the BT specialness criterion after all unramified extensions. For a local field such vertices exist iff G is unramified, meaning quasi-split and split by an unramified extension. A reductive O-model supplies a hyperspecial point with its O-points as fixer. Hyperspecial points remain hyperspecial under finite extensions. For reductive groups speak of points projecting to such vertices, retaining their enlarged central coordinates.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; A reduced vertex x is hyperspecial iff its connected fixer model is reductive; this is equivalent to the full enlarged point-fixer model being reductive and agrees with the BT specialness criterion after all unramified extensions.

**Prerequisites.** [Reductive special-fibre quotients](#RG2-3-reductive-quotient-of-special-fibre) (`ReductiveGroupsPartII:RG2.3/reductive-quotient-of-special-fibre`); [Reductive integral models](#RG2-3-reductive-model) (`ReductiveGroupsPartII:RG2.3/reductive-model`); [Building embeddings under field extensions](#RG2-2-building-field-extension-embedding) (`ReductiveGroupsPartII:RG2.2/building-field-extension-embedding`).

**Construction or proof.**

1. Compare the integral root charts with a pinned split Chevalley model over strict henselization.
2. Descend the reductive model through unramified extension and identify its point.
3. Base change the reductive model to prove finite-extension preservation.

**Acceptance.**

- Ramified quasi-split SU_3 has special vertices but no hyperspecial vertex.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §4.6.31, printed p. 137. Compare the integral root charts with a pinned split Chevalley model over strict henselization. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §1.10, pp. 35–37 and §3.8, pp. 55–56. Compare the integral root charts with a pinned split Chevalley model over strict henselization. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): proof of Proposition 2.2.2, pp. 12–14. Compare the integral root charts with a pinned split Chevalley model over strict henselization. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-quasi-parahoric"></a>

### Quasi-parahoric group schemes

Target `ReductiveGroupsPartII:RG2.3/quasi-parahoric`. Definition; suggested declaration `BruhatTits.ParahoricExt.IsQuasiParahoric`.

Let G be connected reductive over K, where K is a finite extension of ℚ_p or of the completion of its maximal unramified extension (the source works with p > 2; the definition needs no condition on p). A quasi-parahoric group scheme for G is a smooth affine O-group scheme 𝒦 with generic fibre G for which there is a point x ∈ B(G,K) with 𝒦° = 𝒢°_x (the parahoric group scheme) and 𝒢°_x(Ŏ) ⊆ 𝒦(Ŏ) ⊆ 𝒢_x(Ŏ), where 𝒢_x is the Bruhat–Tits stabilizer (full fixer) scheme. Equivalently, 𝒦 corresponds to a subgroup of the finite abelian group 𝒢_x(Ŏ)/𝒢°_x(Ŏ) that is stable under Frobenius (over E). The parahoric and the full fixer are the two extreme quasi-parahorics.

**Hypotheses.** G connected reductive over K; x ∈ B(G,K).

**Prerequisites.** [Parahorics as fixers in the Kottwitz kernel](#RG2-3-parahoric-kottwitz-characterization) (`ReductiveGroupsPartII:RG2.3/parahoric-kottwitz-characterization`); [When full fixers are connected](#RG2-3-fixer-versus-parahoric) (`ReductiveGroupsPartII:RG2.3/fixer-versus-parahoric`).

**Uses.**

- Kisin–Pappas–Zhou 2026, Theorems 1.1.2 and 7.1.3: integral models are constructed for quasi-parahoric level, which interpolates between connected parahoric and stabilizer level.
- Kisin–Zhou 2025, §4.2: level subgroups between parahoric and stabilizer arise when passing between Hodge and abelian type.
- ShimuraVarieties consumers of parahoric level: a level K_p is required to be the Z_p-points of a quasi-parahoric.

**API.**

- `BruhatTits.ParahoricExt.IsQuasiParahoric` (constructor): The predicate on a smooth affine O-model 𝒦 of G: there is x with 𝒦° = 𝒢°_x and 𝒢°_x(Ŏ) ⊆ 𝒦(Ŏ) ⊆ 𝒢_x(Ŏ).
- `BruhatTits.ParahoricExt.isQuasiParahoric_parahoric` (example): Every parahoric group scheme 𝒢°_x is quasi-parahoric.
- `BruhatTits.ParahoricExt.isQuasiParahoric_fixer` (example): Every Bruhat–Tits stabilizer scheme 𝒢_x is quasi-parahoric.
- `BruhatTits.ParahoricExt.quasiParahoricEquivSubgroup` (equivalence): Quasi-parahorics with neutral component 𝒢°_x correspond bijectively to subgroups of 𝒢_x(Ŏ)/𝒢°_x(Ŏ) (σ-stable ones over E).
- `BruhatTits.ParahoricExt.IsQuasiParahoric.index_finite` (relation): For a quasi-parahoric 𝒦, [𝒦(Ŏ) : 𝒦°(Ŏ)] is finite and divides the order of (π₁(G)_I)_tors.

**Unit tests.**

- `BruhatTits.ParahoricExt.isQuasiParahoric_simplyConnected` (degenerate): If G is simply connected, a quasi-parahoric 𝒦 satisfies 𝒦 = 𝒦°.
- `BruhatTits.ParahoricExt.isQuasiParahoric_normTorus_count` (computation): For the ramified norm-one torus over E the quasi-parahorics are exactly the connected and the finite-type Néron models (two of them).
- `BruhatTits.ParahoricExt.not_isQuasiParahoric_stabilizer` (non-example): For GL_2 and a vertex x, the stabilizer in GL_2(K) of the image x̄ in the reduced building contains the unbounded group of scalars ϖ^ℤ, so it is not the group of O-points of any quasi-parahoric: quasi-parahoric points must lie in the fixer 𝒢_x(Ŏ) of x in the enlarged building.
- `BruhatTits.ParahoricExt.isQuasiParahoric_GL` (compatibility): For GL_n every quasi-parahoric is the stabilizer of a lattice chain (π₁(GL_n)_I = ℤ is torsion-free).

**Construction or proof.**

1. By the Haines–Rapoport description (RG2.3/fixer-versus-parahoric), 𝒢_x(Ŏ)/𝒢°_x(Ŏ) is a finite abelian group embedded in (π₁(G)_I)_tors.
2. Every intermediate subgroup Γ between 𝒢°_x(Ŏ) and 𝒢_x(Ŏ) is a union of cosets of the open subgroup 𝒢°_x(Ŏ), so the union of the corresponding open subschemes of 𝒢_x (connected components of the special fibre plus the generic fibre) is a smooth affine open subgroup scheme with these Ŏ-points; conversely the Ŏ-points determine 𝒦 by the extension principle (BT II 1.7.6, RG2.3/extension-principle).

**Acceptance.**

- For simply connected G every quasi-parahoric is parahoric.
- For the ramified norm-one torus R^1_{E′/E} G_m there are exactly two quasi-parahorics: the connected Néron model and the finite-type Néron model.

**Sources.**

- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §2.1.1, arXiv v3 pp. 10–11. Defines a quasi-parahoric group scheme as a smooth affine model whose neutral component is a parahoric and whose Ŏ-points lie between those of the parahoric and of the stabilizer, and notes the finite abelian quotients.
- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Proposition 3, Remark 4 and Remark 11, pp. 1–3, 7. The quotient of the fixer by the parahoric is identified inside the Kottwitz target, giving finiteness and commutativity.

<a id="RG2-3-very-special-parahoric"></a>

### Very special vertices and parahorics

Target `ReductiveGroupsPartII:RG2.3/very-special-parahoric`. Definition; suggested declaration `BruhatTits.ParahoricExt.IsVerySpecial`.

Let G be quasi-split over E with the Frobenius-stable apartment and base alcove a of RG2.1/frobenius-action-on-apartment, affine Weyl group W_a with simple reflections S̃ (reflections in the walls of a) and relative Weyl group W_0. A type K ⊂ S̃ (a facet in the closure of a) is very special if the parabolic subgroup W_K ⊂ W̃ maps isomorphically onto W_0 under W̃ → W_0; equivalently the corresponding vertex v_K is special in the apartment of Ĕ and remains special in every unramified extension. If K is σ-stable, the parahoric 𝒢_K(O_E) is a very special parahoric subgroup. A σ-stable very special type exists when G is quasi-split over E, and the Iwahori subgroup of a is then contained in the very special parahoric (not the reverse).

**Hypotheses.** G quasi-split connected reductive over E; σ-stable alcove a in the σ-stable apartment over Ĕ.

**Prerequisites.** [Affine Frobenius action on the apartment over Ĕ](#RG2-1-frobenius-action-on-apartment) (`ReductiveGroupsPartII:RG2.1/frobenius-action-on-apartment`); [The échelonnage root system](#RG2-1-echelonnage-root-system) (`ReductiveGroupsPartII:RG2.1/echelonnage-root-system`); [Hyperspecial points and reductive models](#RG2-3-hyperspecial-vertices) (`ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`); [Unramified descent of buildings](#RG2-2-unramified-descent-of-building) (`ReductiveGroupsPartII:RG2.2/unramified-descent-of-building`).

**Uses.**

- van Hoften 2024, §§2.2.5, 5–7: the uniformization and connected-component arguments are first proved at very special level and propagated to Iwahori and general parahoric level.
- Kisin–Zhou 2025, Lemma 4.2.4: for very special parahorics with G_der a product of restrictions of split groups and X_*(G_ab)_I torsion-free, the full fixer is connected.
- SmoothRepresentationsOfLocalGroups:SR.4: spherical Hecke algebras and the Satake isomorphism are taken at a very special maximal compact.

**API.**

- `BruhatTits.ParahoricExt.IsVerySpecial` (constructor): The predicate on a vertex (type) K of the base alcove: W_K → W_0 is bijective.
- `BruhatTits.ParahoricExt.isVerySpecial_iff_special_unramified` (characterisation): K is very special iff its vertex is special in the apartment over every unramified extension, equivalently over Ĕ.
- `BruhatTits.ParahoricExt.exists_isVerySpecial_sigmaStable` (other): For quasi-split G over E there is a σ-stable very special type in the closure of the σ-stable base alcove.
- `BruhatTits.ParahoricExt.iwahori_le_verySpecialParahoric` (relation): The Iwahori subgroup of the base alcove is contained in every parahoric of a vertex of its closure, in particular in a very special parahoric.
- `BruhatTits.ParahoricExt.IsVerySpecial.isSpecial` (relation): A very special vertex is special.

**Unit tests.**

- `BruhatTits.ParahoricExt.isVerySpecial_split_iff_hyperspecial` (compatibility): For split G a vertex is very special iff it is hyperspecial; for GL_n the very special parahorics are the conjugates of GL_n(O).
- `BruhatTits.ParahoricExt.isVerySpecial_SL2_both` (computation): For SL_2 both vertices of the base alcove are very special (W_K ≅ ℤ/2 = W_0 for each).
- `BruhatTits.ParahoricExt.not_isVerySpecial_iwahori` (degenerate): The empty type (the Iwahori) is never very special when W_0 is nontrivial.
- `BruhatTits.ParahoricExt.not_isVerySpecial_special_ramified` (non-example): For a quasi-split ramified group whose special vertices over E are not all special over Ĕ (e.g. a ramified unitary group in odd variables), a special vertex need not be very special.

**Construction or proof.**

1. Very special vertices are the vertices v of the closure of a whose stabilizer in W_a projects isomorphically onto W_0 (Haines–Richarz terminology 'extra special', van Hoften §2.2.5 citing [27, Lemma 1.3.42, Prop. 1.3.43]).
2. Existence of a σ-stable very special vertex in the closure of a σ-stable alcove for quasi-split G follows from the classification of the échelonnage root system and the quasi-split Frobenius action on the local Dynkin diagram (van Hoften §2.2.5 citing [27, Prop. 10.2.1]; RG2.1/echelonnage-root-system).
3. Since a lies in the closure star of v_K, the Iwahori fixer of a is contained in the parahoric of v_K (RG2.3/parahoric-subgroup); van Hoften prints the reverse inclusion, corrected in sourceIssue ReductiveGroupsPartII/E47.

**Acceptance.**

- For split G every hyperspecial vertex is very special, and the very special parahorics are the hyperspecial ones.
- For the ramified quasi-split SU_3 there is a very special vertex whose parahoric is not hyperspecial.

**Sources.**

- [Pol van Hoften (Appendix A by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*](https://arxiv.org/abs/2010.10496): §2.2.5, arXiv v4 p. 15. Defines very special types as those whose parabolic subgroup maps isomorphically onto the relative Weyl group, calls the parahorics of σ-stable very special types very special, and records existence for quasi-split groups; the relation with the Iwahori is printed in the wrong direction.
- [Thomas J. Haines, *Dualities for root systems with automorphisms and applications to non-split groups*](https://arxiv.org/abs/1604.01468): §6.1, arXiv v2 pp. 13–14. Defines very special vertices by specialness over the unramified completion, records quasi-split existence and identifies them with hyperspecial vertices in the unramified case.

<a id="RG2-3-similitude-and-derived-models"></a>

### Models of similitude, derived and adjoint groups

Target `ReductiveGroupsPartII:RG2.3/similitude-and-derived-models`. Theorem; suggested declaration `KisinPappas.similitude_smooth`.

(a) For a K-vector space V of even dimension 2n with a perfect symmetric form h, the orthogonal similitude group GO(V,h) (points: g with h(gv,gv′) = c(g)h(v,v′), c(g) a unit) has two components, and its neutral component GO^+(V) is cut out by c(g)^n = det g. (b) (KPZ Lemma 7.2.14) If p > 2, 𝒢 is a smooth ℤ_p-group with a closed immersion 𝒢 ↪ GSp(Λ), Λ = Λ^∨, and 𝒢 contains the central torus G_m ↪ GSp(Λ), then the similitude c: 𝒢 → G_m is smooth (hence its kernel is smooth). (c) (KPZ Lemma 7.2.13) In the setting of a very good local Hodge embedding (G′,μ′) → (GL(Λ),μ_d) with Λ_{ℚ_p} = V carrying a perfect alternating ψ, let G be the neutral component of G′ ∩ GSp(V), assume G R-smooth, G^der ≅ G′^der, Λ = Λ^∨ and that the scheme-theoretic intersection 𝒢′ ∩ GSp(Λ) is smooth; then (G,μ) → (GL(Λ),μ_d) is very good and the stabilizer scheme of G is a union of connected components of 𝒢′ ∩ GSp(Λ). (d) (KPZ Lemma 7.2.11, local part) If the centre Z_G is an R-smooth torus and G^ad is quasi-tame, then G is R-smooth. (e) (KP18 Lemma 4.6.2) For G tame with p ∤ |π₁(G^der)|: the closure of G^der in a parahoric 𝒢_{ℤ_(p)} of G is the stabilizer of the adjoint point x^ad, with identity component the parahoric of G^der; if Z_G is connected or Z_{G^der} has rank prime to p, the parahoric of G^ad is the identity component of 𝒢/𝒵 and there is a map 𝒢^{ad°} → 𝒢^{ad} extending the identity.

**Hypotheses.** (b),(c): p > 2; Λ self-dual; (d): Z_G R-smooth, G^ad quasi-tame; (e): G tame, p ∤ |π₁(G^der)|.

**Prerequisites.** [Parahorics under central extensions](#RG2-3-central-extensions-of-parahorics) (`ReductiveGroupsPartII:RG2.3/central-extensions-of-parahorics`); [Parahorics of GL and GSp as lattice-chain automorphism groups](#RG2-3-lattice-chain-stabilizer-schemes) (`ReductiveGroupsPartII:RG2.3/lattice-chain-stabilizer-schemes`); [Closed immersions of fixers for R-smooth groups](#RG2-3-r-smooth-fixer-immersions) (`ReductiveGroupsPartII:RG2.3/r-smooth-fixer-immersions`); [Schematic closure in an affine model](#RG2-3-schematic-closure) (`ReductiveGroupsPartII:RG2.3/schematic-closure`); [Smooth models of bounded fixers](#RG2-3-bruhat-tits-group-scheme) (`ReductiveGroupsPartII:RG2.3/bruhat-tits-group-scheme`); [Connected parahoric group schemes](#RG2-3-parahoric-group-scheme) (`ReductiveGroupsPartII:RG2.3/parahoric-group-scheme`).

**Construction or proof.**

1. (a): c^n/det is a character of GO(V) with values ±1 on points; its kernel is the neutral component (KPZ §6.2.1, arXiv p. 69).
2. (b): c∘diag = (λ ↦ λ²) so 1 → ker c → 𝒢 → G_m → 1 is fppf exact; pulling back along the étale squaring map splits it, and smoothness descends along the étale cover (KPZ Lemma 7.2.14 proof, arXiv p. 85).
3. (c): R-smoothness gives a closed immersion of stabilizer schemes 𝒢 ↪ 𝒢′ (RG2.3/r-smooth-fixer-immersions); GSp(Λ) is reductive and is the closure of GSp(V) in GL(Λ) (Λ self-dual), so the closure of G is contained in the smooth intersection and is a union of its components (KPZ Lemma 7.2.13 proof, arXiv pp. 84–85).
4. (d): 1 → Z_G → T → T^ad → 1 with T^ad quasi-tame hence R-smooth, and extensions of R-smooth tori are R-smooth (RG2.3/r-smoothness-criteria; KPZ Lemma 7.2.11, arXiv p. 84).
5. (e): by RG2.3/central-extensions-of-parahorics applied to G^der × Z → G and G → G^ad (KP18 Lemma 4.6.2, arXiv p. 64).

**Acceptance.**

- GO^+(V) for dim V = 2: GO(V) ≅ (K^× × K^×) ⋊ ℤ/2 for split h, and GO^+ is the torus.
- (b) for 𝒢 = GSp(Λ) itself: c is smooth with kernel Sp(Λ).

**Sources.**

- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §6.2.1, arXiv v3 p. 69. Defines the orthogonal similitude group of an even-dimensional quadratic space and its neutral component by the relation between multiplier and determinant.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): Lemmas 7.2.11, 7.2.13, 7.2.14 with proofs, arXiv v3 pp. 84–85. R-smoothness of G from R-smooth centre in the abelian-type cover construction; very goodness passing to the neutral component of the intersection with GSp; smoothness of the multiplier on a smooth group containing the central torus for odd p.
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): Lemma 4.6.2, arXiv v3 p. 64. Identifies the closure of the derived group in the parahoric with the stabilizer of the adjoint point and the adjoint parahoric with the identity component of the quotient.

<a id="RG2-3-moy-prasad-lie-lattices"></a>

### Moy–Prasad lattices in the Lie algebra and its dual

Target `ReductiveGroupsPartII:RG2.3/moy-prasad-lie-lattices`. Construction; suggested declaration `MoyPrasad.lieLattice`.

For G, K, x as above and every real r: g_{x,r} ⊂ g = Lie(G)(K) is the O-lattice generated (over K^sh, then Galois-fixed) by t_r := {X ∈ Lie(T)(K^sh) : ω(dχ(X)) ≥ r for χ ∈ X^*(T)} (torus part via the connected Néron model's Lie algebra filtration) and the root-space lattices g_{a,x,r} := {X ∈ g_a : affine-root value ≥ r}; g_{x,r+} := ∪_{s>r} g_{x,s}; dual lattices g*_{x,r} := {X ∈ g* : X(g_{x,(−r)+}) ⊆ m}, which also satisfy X(g_{x,−r}) ⊆ O; g_r := ∪_x g_{x,r}, g*_r := ∪_x g*_{x,r}. The depth of X ∈ g*∖{0} at x is d(x,X) := max{r : X ∈ g*_{x,r}} (d(x,0) = ∞) and d(X) := sup_x d(x,X). The lattices are decreasing, ϖ g_{x,r} = g_{x,r+1}, [g_{x,r}, g_{x,s}] ⊆ g_{x,r+s}, Ad(G_{x,s}) preserves g_{x,r}, they are semicontinuous (the jumps in r form a discrete subset of ℝ, and for each r there is ε > 0 with g_{x,r−ε} = g_{x,r}), and for y near x in a common apartment g_{x,r+} ⊆ g_{y,r} ⊆ g_{x,r−}. For a finite tame extension E/K with the valuation extending the normalized one, (g_E)_{x,r} ∩ g = g_{x,r} (Adler 1998, Prop. 1.4.1).

**Hypotheses.** G connected reductive over K; x ∈ B^e(G,K); r ∈ ℝ; tame comparison: E/K tamely ramified.

**Prerequisites.** [The Moy–Prasad filtration](#RG2-3-moy-prasad-filtration) (`ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`; [Affine roots and root-group filtrations](#RG2-1-affine-roots-and-filtrations) (`ReductiveGroupsPartII:RG2.1/affine-roots-and-filtrations`); [Commutator estimates for valued root groups](#RG2-1-valued-commutator-estimates) (`ReductiveGroupsPartII:RG2.1/valued-commutator-estimates`).

**Uses.**

- Fintzen 2021, §§3–6: depth of dual elements, generic and almost stable elements, and the data contained in representations.
- Fintzen 2021, Lemma 5.1: the map f_X between root spaces and dual lattices shifts depth by −r.
- SmoothRepresentationsOfLocalGroups (Part II types): unrefined minimal K-types are characters of G_{x,r}/G_{x,r+} ≅ g_{x,r}/g_{x,r+} given by dual cosets.

**API.**

- `MoyPrasad.lieLattice` (constructor): The O-lattice g_{x,r} ⊂ Lie(G)(K) for real r.
- `MoyPrasad.dualLattice` (constructor): The O-lattice g*_{x,r} = {X ∈ g* : X(g_{x,(−r)+}) ⊆ m}.
- `MoyPrasad.depth` (constructor): d(x,X) = max{r : X ∈ g*_{x,r}}, with d(x,0) = ⊤.
- `MoyPrasad.lieLattice_antitone` (relation): r ≤ s implies g_{x,s} ⊆ g_{x,r}.
- `MoyPrasad.lieLattice_add_one` (relation): ϖ · g_{x,r} = g_{x,r+1}.
- `MoyPrasad.lie_bracket_lieLattice_le` (relation): [g_{x,r}, g_{x,s}] ⊆ g_{x,r+s}.
- `MoyPrasad.lieLattice_tame_inter` (compatibility): For E/K tame with extended valuation, (g_E)_{x,r} ∩ g = g_{x,r}.
- `MoyPrasad.lieLattice_semicontinuous` (other): For every r there is ε > 0 with g_{x,r−ε} = g_{x,r} (left semicontinuity at jumps), and nearby points satisfy g_{x,r+} ⊆ g_{y,r}.

**Unit tests.**

- `MoyPrasad.lieLattice_GL_vertex` (computation): For gl_n at the standard vertex and integer r, g_{x,r} = ϖ^r M_n(O).
- `MoyPrasad.depth_zero_eq_top` (degenerate): d(x,0) = ⊤ (infinite depth).
- `MoyPrasad.dualLattice_trace_GL` (compatibility): For gl_n with the trace form, g*_{x,r} corresponds to g_{x,r} at the standard vertex (a self-dual identification that holds for GL_n without restriction on p).
- `MoyPrasad.lieLattice_not_power_of_m` (non-example): For SL_2 at the barycentre of an edge, g_{x,1/2} is not of the form ϖ^k sl_2(O) for any k: it is the Iwahori-type lattice with off-diagonal entries of different valuations.

**Construction or proof.**

1. Define via an apartment containing x and descend as for the group filtration; independence of the apartment by conjugation in G_{x,0} (Adjoint action preserves the lattices since root-group elements act unipotently with the estimates of RG2.1/valued-commutator-estimates).
2. Semicontinuity: affine root values at x form a discrete set and depend continuously on x in an apartment (Fintzen proof of Thm 6.1, arXiv pp. 22–23, uses 'the Moy–Prasad filtration is semi-continuous').
3. Tame comparison: G splits over a tame E, Galois descent of lattices; Adler 1998 Prop. 1.4.1 as cited in Fintzen §3 eq. (1).

**Acceptance.**

- For GL_n at the standard vertex: g_{x,r} = ϖ^{⌈r⌉} M_n(O) and g*_{x,r} ≅ ϖ^{⌈r⌉} M_n(O) under the trace pairing.
- Depth of a regular semisimple element diag(ϖ^{−1}, 0) of gl_2^* (trace pairing) at the standard vertex is −1.

**Sources.**

- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): §3, arXiv v2 pp. 8–9. Fixes the notation G(E)_{x,r} for the Moy–Prasad subgroups of depth r ≥ 0 at points of the enlarged building, G_{x,r+} and G(E)_r, the Lie and dual lattices for every real r, the normalization by the valuation extending that of k, the tame comparison (g_E)_{x,r} ∩ g = g_{x,r}, the depth of a dual element, and the reductive quotient G_x with G_x(f_F) = G(F)_{x,0}/G(F)_{x,0+} acting on V_{x,r}.
- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): proof of Theorem 6.1 and Lemma 6.1.1, arXiv v2 pp. 22–23. Uses semicontinuity of the Moy–Prasad filtration in r and its behaviour at nearby points to define the depth function on the building.
- [Jeffrey D. Adler, *Refined anisotropic K-types and supercuspidal representations*](https://msp.org/pjm/1998/185-1/pjm-v185-n1-p01-p.pdf): Proposition 1.4.1, pp. 9–10; §§1.5–1.6, pp. 11–17. Directly read the normalized field-intersection argument and the quotient construction, choice dependence, multiplicative and adjoint depth estimates.

<a id="RG2-3-yu-mixed-depth-groups"></a>

### Yu's mixed-depth groups

Target `ReductiveGroupsPartII:RG2.3/yu-mixed-depth-groups`. Construction; suggested declaration `MoyPrasad.yuGroup`.

Let G′ ⊂ G be a twisted Levi pair split over a tamely ramified extension of K (RG2.2/twisted-levi-subgroup), x ∈ B(G′,K) ⊂ B(G,K) and extended reals s ≥ t ≥ s/2 > 0. Choose a maximal torus T ⊂ G′ split over a finite tame E/K with x ∈ A(T,E). Define (G′,G)_{x,s,t} := G(K) ∩ ⟨T(E)_s, U_α(E)_{x,s} (α ∈ Φ(G′,T)), U_β(E)_{x,t} (β ∈ Φ(G,T) ∖ Φ(G′,T))⟩ and the Lie lattice (g′,g)_{x,s,t} analogously; for G′ = G it is G_{x,s}. These groups are independent of T and E (Yu 2001, pp. 585–586), satisfy G′_{x,s} ⊆ (G′,G)_{x,s,t} ⊆ G_{x,t}, (G′,G)_{x,s,t} ∩ G′(K) = G′_{x,s}, and are normalized by G′(K)_x. The derived-group variants H_{x,s,t} := H(K) ∩ (G′,G)_{x,s,t} for H = G^der (or G) are part of the construction; the datum-specific conventions of Fintzen §4 (H_1 = G_1 or G_1^der, r_{n+1} = 0) belong to the type theory that uses them, not here.

**Hypotheses.** G′ ⊂ G tame twisted Levi pair over K; x ∈ B(G′,K); s ≥ t ≥ s/2 > 0 extended reals.

**Prerequisites.** [The Moy–Prasad filtration](#RG2-3-moy-prasad-filtration) (`ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`); [Tame twisted Levi subgroups](#RG2-2-twisted-levi-subgroup) (`ReductiveGroupsPartII:RG2.2/twisted-levi-subgroup`); [Tame descent of buildings](#RG2-2-tame-descent-of-building) (`ReductiveGroupsPartII:RG2.2/tame-descent-of-building`).

**Uses.**

- Fintzen 2021, Definition 4.5 and Corollaries 5.2–5.4: the characters φ∘X_i of a datum live on (H_i)_{x,r_i,r_i/2+}.
- Fintzen 2021, §7 and Yu 2001: the compact open subgroups K^i and the Heisenberg–Weil construction of types.
- SmoothRepresentationsOfLocalGroups Part II (types, route 1 of the Fintzen extraction): imports Yu's groups for tame twisted Levi sequences.

**API.**

- `MoyPrasad.yuGroup` (constructor): (G′,G)_{x,s,t} for a tame twisted Levi pair and s ≥ t ≥ s/2 > 0.
- `MoyPrasad.yuLieLattice` (constructor): The Lie lattice (g′,g)_{x,s,t}.
- `MoyPrasad.yuGroup_self` (simp): For G′ = G, (G,G)_{x,s,t} = G_{x,s} (no complementary roots).
- `MoyPrasad.yuGroup_le` (relation): G′_{x,s} ⊆ (G′,G)_{x,s,t} ⊆ G_{x,t}.
- `MoyPrasad.yuGroup_inf_twistedLevi` (characterisation): (G′,G)_{x,s,t} ∩ G′(K) = G′_{x,s}.
- `MoyPrasad.yuGroup_independent` (other): The group does not depend on the torus T or the tame splitting field E.

**Unit tests.**

- `MoyPrasad.yuGroup_torus` (computation): For G′ = T a maximal torus split over a tame E, (T,G)_{x,s,t} = T(K)_s · ∏_β U_{β,x,t} (product over all roots).
- `MoyPrasad.yuGroup_eq_filtration_of_eq` (degenerate): For s = t, (G′,G)_{x,s,s} = G_{x,s}.
- `MoyPrasad.yuGroup_GL_block` (compatibility): For G′ = GL_1 × GL_1 ⊂ GL_2 diagonal and x the standard vertex, (G′,G)_{x,s,t} consists of matrices with diagonal entries in 1 + m^{⌈s⌉} and off-diagonal entries in m^{⌈t⌉}.
- `MoyPrasad.yuGroup_not_group_without_half` (non-example): If t < s/2 the generating set does not give a group of the stated shape: for GL_2 with G′ the diagonal torus, s = 3, t = 1, commutators of off-diagonal elements of depth 1 have diagonal parts of depth 2 < 3, so the set {diag in depth s, off-diagonal in depth t} is not closed under multiplication.

**Construction or proof.**

1. Over E, the subgroup is generated by filtration subgroups of root groups and the torus, so it is the group attached to the concave function f(α) = s on Φ(G′), t elsewhere, with t ≥ s/2 ensuring concavity (f(α+β) ≤ f(α) + f(β)); by BT/Yu it is the integral points of a smooth model and its group is determined by f (Yu 2001 §2).
2. Independence of T: two choices are conjugate under G′(E)_{x,0} (apartments of G′ through x), which normalizes the groups; independence of E by descent (Fintzen §4, arXiv v2 pp. 16–17).
3. Galois-fixed points give the K-group; equalities with G′_{x,s} and inclusions follow from the generators.

**Acceptance.**

- For G′ = T a maximal torus: (T,G)_{x,s,t} = T(K)_s · ∏_β U_{β,x,t} (all roots).
- For G′ = G: (G,G)_{x,s,t} = G_{x,s}.

**Sources.**

- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): §4 after Lemma 4.4, arXiv v2 pp. 16–17. Defines (G_i)_{x,r̃,r̃′} as the K-points of the group generated over a tame splitting field by the torus at depth r̃, the roots of the smaller twisted Levi at depth r̃ and the complementary roots at depth r̃′, its derived-group intersections and Lie analogues, and notes independence of the torus and field after Yu.
- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): §3, arXiv v2 pp. 8–9. Fixes the notation G(E)_{x,r} for the Moy–Prasad subgroups of depth r ≥ 0 at points of the enlarged building, G_{x,r+} and G(E)_r, the Lie and dual lattices for every real r, the normalization by the valuation extending that of k, the tame comparison (g_E)_{x,r} ∩ g = g_{x,r}, the depth of a dual element, and the reductive quotient G_x with G_x(f_F) = G(F)_{x,0}/G(F)_{x,0+} acting on V_{x,r}.

<a id="RG2-3-torus-generation-of-filtration"></a>

### Generation of Moy–Prasad subgroups by a torus and the derived group

Target `ReductiveGroupsPartII:RG2.3/torus-generation-of-filtration`. Theorem; suggested declaration `MoyPrasad.filtration_eq_sup_torus_derived`.

Let G′ be connected reductive over K and split over a tamely ramified extension, H′ = G′^der (or H′ = G′), T ⊂ G′ a maximal torus with x ∈ A(T,E) for a tame splitting field E, and r > 0. Then G′_{x,r} is generated by T(K)_r and H′_{x,r} := H′(K) ∩ G′_{x,r}. (General form of Fintzen Cor. 7.2, stated without the type datum, per RT-PAPER-FINTZEN-21/6.)

**Hypotheses.** G′ tamely split; T maximal torus with x in its apartment over a tame E; r > 0.

**Prerequisites.** [The Moy–Prasad filtration](#RG2-3-moy-prasad-filtration) (`ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`); [Exact torus sequences and connected integral models](#RG2-3-torus-models-exact-sequences) (`ReductiveGroupsPartII:RG2.3/torus-models-exact-sequences`); [Tame twisted Levi subgroups](#RG2-2-twisted-levi-subgroup) (`ReductiveGroupsPartII:RG2.2/twisted-levi-subgroup`).

**Construction or proof.**

1. T ∩ H′ is a maximal torus of H′ and G′/H′ ≅ T/(T ∩ H′) (Conrad, Example 2.2.6 as cited).
2. Positive-depth exactness of tame tori: 1 → (T∩H′)(K)_r → T(K)_r → (T/(T∩H′))(K)_r → 1 is exact (RG2.3/torus-models-exact-sequences, Kaletha 2019 Lemma 3.1.3 = Fintzen Lemma 7.1, arXiv v2 p. 26); so T(K)_r surjects onto the image of G′_{x,r} in (G′/H′)(K)_r, whose kernel is H′_{x,r} (Fintzen Cor. 7.2 proof).

**Acceptance.**

- For G′ = GL_n, H′ = SL_n, T the diagonal torus at the standard vertex and integer r: 1 + ϖ^r M_n(O) is generated by diagonal matrices in (1 + ϖ^r O)^n and SL_n ∩ (1 + ϖ^r M_n(O)).

**Sources.**

- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): Lemma 7.1 and Corollary 7.2 with proof, arXiv v2 p. 26. Quotes Kaletha's exactness of positive-depth filtrations of tame tori and deduces that (G_j)_{x,r} is generated by T(k)_r and (H_j)_{x,r}.

<a id="RG2-3-compact-elements-in-hyperspecial-subgroups"></a>

### Compact elements in reductive models after extension

Target `ReductiveGroupsPartII:RG2.3/compact-elements-in-hyperspecial-subgroups`. Theorem; suggested declaration `BruhatTits.compact_elements_in_hyperspecial_subgroups`.

For a connected reductive group G over Q_p and an element g contained in a compact subgroup of G(Q_p), there is a finite extension K/Q_p and a reductive O_K-model G_O_K of G_K whose integral points contain g. This target is KZ Lemma 6.2.1 for one compact element; do not replace it by a simultaneous arbitrary-compact-subgroup assertion without another argument. The proof chooses a rational nearby building point fixed by g and makes it hyperspecial after a sufficiently divisible splitting extension.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For a connected reductive group G over Q_p and an element g contained in a compact subgroup of G(Q_p), there is a finite extension K/Q_p and a reductive O_K-model G_O_K of G_K whose integral points contain g.

**Prerequisites.** [Bruhat–Tits fixed point theorem](#RG2-2-bruhat-tits-fixed-point-theorem) (`ReductiveGroupsPartII:RG2.2/bruhat-tits-fixed-point-theorem`); [Building embeddings under field extensions](#RG2-2-building-field-extension-embedding) (`ReductiveGroupsPartII:RG2.2/building-field-extension-embedding`); [Hyperspecial points and reductive models](#RG2-3-hyperspecial-vertices) (`ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`).

**Construction or proof.**

1. A compact cyclic closure fixes a building point.
2. Choose a fixed rational point in a suitable facet and split G over a finite extension.
3. Clear its apartment denominators by further ramification and apply the hyperspecial-model characterization.

**Acceptance.**

- Keep the asserted conclusion elementwise, as in the source.

**Sources.**

- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): Lemma 6.2.1 and proof, pp. 60–61. A compact cyclic closure fixes a building point. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-generic-points-and-connected-stabilizers"></a>

### Generic facet points and stabilizer models

Target `ReductiveGroupsPartII:RG2.3/generic-points-and-connected-stabilizers`. Theorem; suggested declaration `BruhatTits.generic_points_and_connected_stabilizers`.

Call a point x generic in its facet if its full stabilizer model is constant on some open neighbourhood of x in that facet. If G_x is connected, every generic point y of the smallest facet containing x has G_y=G_x. Thus connected parahorics can be represented by generic-point full stabilizer models. Use genericity for G itself in passing between derived and enlarged buildings: projection does not automatically preserve genericity. For unramified groups the corresponding connected stabilizer description in KP18 Remark 4.2.14(b) applies.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; Call a point x generic in its facet if its full stabilizer model is constant on some open neighbourhood of x in that facet.

**Prerequisites.** [When full fixers are connected](#RG2-3-fixer-versus-parahoric) (`ReductiveGroupsPartII:RG2.3/fixer-versus-parahoric`); [Hyperspecial points and reductive models](#RG2-3-hyperspecial-vertices) (`ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`); [Smooth models of bounded fixers](#RG2-3-bruhat-tits-group-scheme) (`ReductiveGroupsPartII:RG2.3/bruhat-tits-group-scheme`).

**Construction or proof.**

1. Within a facet the connected parahoric is constant; only extra normalizer symmetries change full stabilizers.
2. Avoid the finitely many symmetry-fixed affine subspaces to choose a generic point.
3. Connectedness excludes extra components; use the model extension principle to identify stabilizers.

**Acceptance.**

- The handoff records the derived-projection genericity repair in source issue E44.

**Sources.**

- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §2.2.2, footnote 3 and following paragraph, pp. 12–14. Within a facet the connected parahoric is constant; only extra normalizer symmetries change full stabilizers. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): Remark 4.2.14(b), pp. 190–191. Within a facet the connected parahoric is constant; only extra normalizer symmetries change full stabilizers. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-moy-prasad-isomorphism"></a>

### The Moy–Prasad isomorphism

Target `ReductiveGroupsPartII:RG2.3/moy-prasad-isomorphism`. Theorem; suggested declaration `MoyPrasad.groupLieGradedEquiv`.

For G, x as above: (a) for r > 0 the quotient G_{x,r}/G_{x,r+} is abelian and there is a canonical isomorphism G_{x,r}/G_{x,r+} ≅ g_{x,r}/g_{x,r+} of abelian groups (κ-vector spaces), equivariant for the action of the stabilizer of x by conjugation/adjoint action; (b) G_{x,0}/G_{x,0+} = 𝒢̄_x(κ), the κ-points of the reductive quotient of the special fibre of the parahoric (for K = E finite residue field, and over every unramified extension), and its action on V_{x,r} := g_{x,r}/g_{x,r+} is the κ-points of an algebraic representation of 𝒢̄_x on the finite-dimensional κ-vector space V_{x,r} (and on V_{x,r}^*); (c) for a tame twisted Levi pair G′ ⊂ G, x ∈ B(G′,K) and real r̃ ≥ r̃′ ≥ r̃/2 > 0, the quotient (G′,G)_{x,r̃,r̃′}/(G′,G)_{x,r̃+} is abelian and canonically isomorphic to (g′,g)_{x,r̃,r̃′}/(g′,g)_{x,r̃+}, equivariantly for the stabilizer of x in G′(K), and likewise for the derived-group variants; for G′ = G the mixed group is G_{x,r̃}, since there are no complementary roots.

**Hypotheses.** G connected reductive over K; (a): r > 0; (c): G′ ⊂ G tame twisted Levi pair, r̃ ≥ r̃′ ≥ r̃/2 > 0.

**Prerequisites.** [Moy–Prasad lattices in the Lie algebra and its dual](#RG2-3-moy-prasad-lie-lattices) (`ReductiveGroupsPartII:RG2.3/moy-prasad-lie-lattices`); [Yu's mixed-depth groups](#RG2-3-yu-mixed-depth-groups) (`ReductiveGroupsPartII:RG2.3/yu-mixed-depth-groups`); [The Moy–Prasad filtration](#RG2-3-moy-prasad-filtration) (`ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`); [Reductive special-fibre quotients](#RG2-3-reductive-quotient-of-special-fibre) (`ReductiveGroupsPartII:RG2.3/reductive-quotient-of-special-fibre`); [Parahoric, Iwahori and pro-p Iwahori subgroups](#RG2-3-parahoric-subgroup) (`ReductiveGroupsPartII:RG2.3/parahoric-subgroup`).

**Construction or proof.**

1. (a): in root coordinates over K^sh, the map ∏ x_a(u_a) · t ↦ Σ u_a X_a + log-type torus coordinate induces a bijection on the graded pieces since commutators of depth ≥ r, r land in depth ≥ 2r > r (commutator estimates); independence of coordinates and Galois descent give the canonical isomorphism (Moy–Prasad 1994 as cited in Fintzen §3 and Def. 4.5 p. 17).
2. (b): smooth reduction first maps 𝒢°_x(O^sh) onto its entire special fibre. Composing with the quotient by that fibre’s unipotent radical gives the map to 𝒢̄_x; its kernel is G_{x,0+}. The raw special-fibre reduction has the smaller congruence kernel. Lang trivializes the unipotent-radical torsors over finite residue fields. Adjoint root charts descend the action to the graded κ-vector spaces.
3. (c): Yu 2001 §2 (pp. 585–586) for the mixed groups (RG2.3/yu-mixed-depth-groups); the condition r̃′ ≥ r̃/2 makes commutators land in depth ≥ r̃+ (Fintzen Def. 4.5 p. 17 and Corollaries 5.2–5.4 pp. 19–21 use these isomorphisms; RT-PAPER-FINTZEN-21/20).

**Acceptance.**

- GL_n, standard vertex, integer r ≥ 1: (1 + ϖ^r M_n(O))/(1 + ϖ^{r+1} M_n(O)) ≅ M_n(κ) via 1 + ϖ^r X ↦ X mod ϖ, with GL_n(κ) acting by conjugation.
- Split torus: T_r/T_{r+} ≅ Lie(T)_r/Lie(T)_{r+} ≅ κ^n via 1 + ϖ^r u ↦ u mod ϖ.

**Sources.**

- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): §3, arXiv v2 pp. 8–9. Fixes the notation G(E)_{x,r} for the Moy–Prasad subgroups of depth r ≥ 0 at points of the enlarged building, G_{x,r+} and G(E)_r, the Lie and dual lattices for every real r, the normalization by the valuation extending that of k, the tame comparison (g_E)_{x,r} ∩ g = g_{x,r}, the depth of a dual element, and the reductive quotient G_x with G_x(f_F) = G(F)_{x,0}/G(F)_{x,0+} acting on V_{x,r}.
- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): §4 after Lemma 4.4, Definition 4.5, arXiv v2 pp. 16–17; Corollaries 5.2–5.4, pp. 19–21. Defines Yu's mixed-depth groups and uses the isomorphisms (H_i)_{x,r_i,r_i/2+}/(H_i)_{x,r_i+} ≅ (h_i)_{x,r_i,r_i/2+}/(h_i)_{x,r_i+} to let characters φ∘X_i act.
- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §4.3, Lemma 4.6 proof, arXiv v3 pp. 13–14. Uses the product decompositions of Ĭ_n by affine root subgroups shifted by n and T_n, i.e. the graded structure of the Moy–Prasad filtration at integer depths.

<a id="RG2-3-lifting-residual-cocharacters"></a>

### Lifting cocharacters of the reductive quotient

Target `ReductiveGroupsPartII:RG2.3/lifting-residual-cocharacters`. Theorem; suggested declaration `MoyPrasad.exists_lift_residualCocharacter`.

Let G be connected reductive over K, x ∈ B(G,K) and λ̄: G_m → 𝒢̄_x a κ-cocharacter of the reductive quotient. Then there is a K-split torus S ⊂ G whose closure 𝒮 in the parahoric 𝒢°_x is a split O-torus with special fibre mapping onto a maximal split torus of 𝒢̄_x containing λ̄(G_m), and, after fixing this lifted split torus and its residue identification, λ̄ lifts uniquely to a cocharacter λ: G_m → S; the apartment A(S) contains x, and for small ε > 0 the point x + ελ satisfies: for every affine root α, α(x+ελ) − α(x) = ε⟨grad α, λ⟩. Consequently, for X ∈ g*_{x,r} whose image in V*_{x,r} satisfies lim_{t→0} λ̄(t)·X̄ = 0, one has X ∈ g*_{x+ελ, r+} for small ε > 0. If G splits tamely and p does not divide the order of its full absolute Weyl group, a maximal torus containing this lift may be chosen tame; the stronger theorem that every torus is tame belongs to the arithmetic continuation (accepted Fintzen route). The lift itself does not require that stronger theorem.

**Hypotheses.** G connected reductive over K; x ∈ B(G,K); λ̄ a κ-cocharacter of 𝒢̄_x; For the final tame-torus consequence only: G splits tamely and p∤|W_abs|; uniqueness is relative to a chosen lifted split torus.

**Prerequisites.** [The Moy–Prasad filtration](#RG2-3-moy-prasad-filtration) (`ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`); [Moy–Prasad lattices in the Lie algebra and its dual](#RG2-3-moy-prasad-lie-lattices) (`ReductiveGroupsPartII:RG2.3/moy-prasad-lie-lattices`); [Reductive special-fibre quotients](#RG2-3-reductive-quotient-of-special-fibre) (`ReductiveGroupsPartII:RG2.3/reductive-quotient-of-special-fibre`); [Connected parahoric group schemes](#RG2-3-parahoric-group-scheme) (`ReductiveGroupsPartII:RG2.3/parahoric-group-scheme`).

**Construction or proof.**

1. Split tori of 𝒢̄_x lift to split O-tori of the smooth parahoric (Hensel for tori and the structure of the special fibre, BT II 4.6/5.1; RG2.3/reductive-quotient-of-special-fibre), so λ̄ lifts to λ into a K-split S whose apartment contains x (Fintzen Cor. 3.8 proof, arXiv v2 p. 11).
2. Moving x along λ changes affine root values linearly; weights of λ̄ on V*_{x,r} being positive for X̄ gives the depth increase (Fintzen Cor. 3.8 proof, Lemma 6.1.2 proof p. 24, Lemma 7.10 proof p. 32).

**Acceptance.**

- GL_2, x the standard vertex, λ̄(t) = diag(t,1) in GL_2(κ): λ(t) = diag(t,1), and x + ελ is the point of the edge towards the lattice O ⊕ ϖO at distance ε; the nilpotent dual element E_{12}^* (upper-right) increases in depth.

**Sources.**

- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): proof of Corollary 3.8, arXiv v2 p. 11; proofs of Lemma 6.1.2 (p. 24) and Lemma 7.10 (p. 32). Lifts a destabilizing cocharacter of the reductive quotient to a split torus in the parahoric group scheme and to a cocharacter of G whose apartment contains x, and moves x slightly along it to raise the depth.

<a id="RG2-3-tame-subdivision-to-hyperspecial"></a>

### Tame subdivision of a generic facet

Target `ReductiveGroupsPartII:RG2.3/tame-subdivision-to-hyperspecial`. Theorem; suggested declaration `BruhatTits.tame_subdivision_to_hyperspecial`.

For an absolutely simple simply connected tame group over a complete discretely valued field with algebraically closed residue field of characteristic p, assume p does not divide 2(n+1) in type A_n, p≠2 for other classical types, p∉{2,3} for nonclassical types other than E₈, and p∉{2,3,5} for E₈. A parahoric can be obtained by intersecting the rational group with a hyperspecial parahoric after a finite tame splitting extension; in the apartment proof a point generic for its fixer can be perturbed arbitrarily slightly to a point hyperspecial after such an extension, preserving that fixer. The sharper classical extension used in KPZ Proposition 2.2.2 replaces the type A restriction by prime-to-p division-algebra index and assumes p>2. Preserve these two versions separately. Tame subdivision cannot clear a denominator divisible by p.

**Hypotheses.** O is the henselian discrete valuation ring of K, with perfect residue field; G is connected reductive over K; For an absolutely simple simply connected tame group over a complete discretely valued field with algebraically closed residue field of characteristic p, assume p does not divide 2(n+1) in type A_n, p≠2 for other classical types, p∉{2,3} for nonclassical types other than E₈, and p∉{2,3,5} for E₈.

**Prerequisites.** [Tame descent of buildings](#RG2-2-tame-descent-of-building) (`ReductiveGroupsPartII:RG2.2/tame-descent-of-building`); [Generic facet points and stabilizer models](#RG2-3-generic-points-and-connected-stabilizers) (`ReductiveGroupsPartII:RG2.3/generic-points-and-connected-stabilizers`); [Hyperspecial points and reductive models](#RG2-3-hyperspecial-vertices) (`ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`).

**Construction or proof.**

1. First split over a tame extension and identify the affine Dynkin automorphism δ fixing the descended apartment.
2. Choose rational points whose new denominators are prime to p and whose δ-invariance is preserved; approximate within the neighborhood where the fixer is constant.
3. Increase the tame ramification degree to make these points hyperspecial, retaining the exact characteristic restrictions.
4. For classical adjoint factors use the KPZ refinement: type A denominators depend on division-algebra index; products and Weil restriction assemble the factors.

**Acceptance.**

- The theorem does not promise a tame hyperspecial realization for a type A inner form of division index divisible by p.

**Sources.**

- [Georgios Pappas, Michael Rapoport, *On tamely ramified G-bundles on curves*](https://api.algebraicgeometry.nl/Article/20757/2024-6-024.pdf): Propositions 2.7–2.8, Remark 2.9 and proofs, printed pp. 802–805. First split over a tame extension and identify the affine Dynkin automorphism δ fixing the descended apartment. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): Proposition 2.2.2 proof, pp. 12–13. First split over a tame extension and identify the affine Dynkin automorphism δ fixing the descended apartment. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-3-filtration-under-field-extension"></a>

### Moy–Prasad intersection under field extension

Target `ReductiveGroupsPartII:RG2.3/filtration-under-field-extension`. Theorem; suggested declaration `BruhatTits.filtration_under_field_extension`.

Let K′/K be a finite extension and use compatible building embeddings. With valuations extending the K-normalization, Lie lattices satisfy g(K′)_(x,r)∩g(K)=g(K)_(x,r) for every real r. Group filtrations satisfy G(K′)_(x,r)∩G(K)=G(K)_(x,r) for r>0; include r=0 for unramified base change of the connected parahoric; tameness alone does not suffice. With uniformizer-normalized valuation on K′, replace depth r by e(K′/K)r. In Adler’s setting these comparisons allow reduction of the mock-exponential quotient construction to split root coordinates.

**Hypotheses.** K nonarchimedean local; G connected reductive; K′/K finite; embeddings and depth normalizations compatible; r real for Lie lattices, r>0 for groups; r=0 only with unramified connected-parahoric base change.

**Prerequisites.** [The Moy–Prasad filtration](#RG2-3-moy-prasad-filtration) (`ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`); [Moy–Prasad lattices in the Lie algebra and its dual](#RG2-3-moy-prasad-lie-lattices) (`ReductiveGroupsPartII:RG2.3/moy-prasad-lie-lattices`); [Building embeddings under field extensions](#RG2-2-building-field-extension-embedding) (`ReductiveGroupsPartII:RG2.2/building-field-extension-embedding`); [Unramified base change of connected models](#RG2-3-unramified-base-change-of-parahorics) (`ReductiveGroupsPartII:RG2.3/unramified-base-change-of-parahorics`).

**Construction or proof.**

1. For tori test all characters after extension and keep the valuation scaling explicit.
2. For root groups intersect valuation inequalities; treat multipliable roots through the SU₃ coordinates, as in Proposition 1.4.1.
3. Reassemble positive-depth root factors; treat depth zero through the connected-model descent already proved.

**Acceptance.**

- Over GL_n at the standard vertex, valuation of each matrix coefficient gives the formula; changing uniformizer normalization multiplies depth by e.
- For a tamely ramified quadratic norm-one torus at odd residue characteristic, −1 is outside the connected parahoric over K but becomes a unit in the split parahoric over K′; reject depth-zero equality even for tame K′/K.

**Sources.**

- [Jeffrey D. Adler, *Refined anisotropic K-types and supercuspidal representations*](https://msp.org/pjm/1998/185-1/pjm-v185-n1-p01-p.pdf): Proposition 1.4.1 and proof, printed pp. 9–10; normalization in §1.1, pp. 4–5. The positive-depth group and all-depth Lie intersection proof supplies the comparison and its scaling. Its printed group claim at r=0 requires correction, recorded as E48.

<a id="RG2-3-tame-hyperspecial-realization"></a>

### Tame realization of stabilizers as fixed points of hyperspecial models

Target `ReductiveGroupsPartII:RG2.3/tame-hyperspecial-realization`. Theorem; suggested declaration `KisinPappas.fixer_eq_fixedPoints_hyperspecial`.

Let p > 2, K finite over ℚ_p or Q̆_p, and G a classical (no exceptional or triality factors in G^ad) tamely ramified reductive K-group; if G^ad has a factor Res_{L/K} PGL_m(D) with L/K tame, assume the index of D is prime to p. Let x ∈ B(G,K) be generic in its facet and 𝒢 = 𝒢_x. (1) There are x′ with 𝒢_x = 𝒢_{x′} and a finite tame Galois K̃/K with group Γ such that G_{K̃} is split and x′ is hyperspecial in B(G,K̃). (2) The stabilizer scheme 𝒢̃_{x′} over Õ is reductive, carries an Õ-semilinear Γ-action extending that on G_{K̃}, and 𝒢 ≅ (Res_{Õ/O} 𝒢̃_{x′})^Γ. (3) For a faithful representation ρ: G → GL(V) there is a Γ-stable Õ-lattice Λ̃ ⊂ V_{K̃} with a closed immersion 𝒢̃_{x′} ↪ GL(Λ̃) (no tameness needed for this step); taking Res and Γ-fixed points gives closed immersions 𝒢 = (Res 𝒢̃_{x′})^Γ ↪ (Res_{Õ/O} GL(Λ̃))^Γ ↪ GL(Λ̃), and (Res_{Õ/O} GL(Λ̃))^Γ = GL(L) is the automorphism group of the chain L = {(π̃^iΛ̃)^Γ}, whose total lattice is an O-direct summand of Λ̃ (after reducing to K̃/K totally ramified with π̃^e ∈ O). The common tame splitting-field choice uses F^t=F·ℚ_p^t supplied by LocalFieldsRamification Layer 3.

**Hypotheses.** p > 2; G classical, tamely ramified; division-algebra index condition; x generic in its facet (𝒢_x = 𝒢_y for y near x in the facet); (3): ρ faithful.

**Prerequisites.** [Edixhoven's tame fixed-point theorem](#RG2-0a-tame-fixed-points-of-weil-restriction) (`ReductiveGroupsPartII:RG2.0a/tame-fixed-points-of-weil-restriction`); [Parahorics of GL and GSp as lattice-chain automorphism groups](#RG2-3-lattice-chain-stabilizer-schemes) (`ReductiveGroupsPartII:RG2.3/lattice-chain-stabilizer-schemes`); [Weil restriction of integral models](#RG2-0a-integral-weil-restriction) (`ReductiveGroupsPartII:RG2.0a/integral-weil-restriction`); [Tame subdivision of a generic facet](#RG2-3-tame-subdivision-to-hyperspecial) (`ReductiveGroupsPartII:RG2.3/tame-subdivision-to-hyperspecial`); [Generic facet points and stabilizer models](#RG2-3-generic-points-and-connected-stabilizers) (`ReductiveGroupsPartII:RG2.3/generic-points-and-connected-stabilizers`); [Hyperspecial points and reductive models](#RG2-3-hyperspecial-vertices) (`ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`); [Bruhat–Tits extension principle](#RG2-3-extension-principle) (`ReductiveGroupsPartII:RG2.3/extension-principle`); [Tame descent of buildings](#RG2-2-tame-descent-of-building) (`ReductiveGroupsPartII:RG2.2/tame-descent-of-building`); `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`; [Direct summand from a tame invariant lattice chain](#RG2-3-invariant-chain-direct-summand) (`ReductiveGroupsPartII:RG2.3/invariant-chain-direct-summand`).

**Construction or proof.**

1. (1): for semisimple simply connected absolutely simple factors, Pappas–Rapoport's tame subdivision gives points x′ of the facet of x, arbitrarily close, that are hyperspecial over a tame extension; extend to reductive G via G^der and the centre (hyperspecial points stay hyperspecial under field extension, RG2.3/hyperspecial-vertices) and use genericity of x so that 𝒢_{x′} = 𝒢_x (KPZ proof of Prop. 2.2.2, arXiv pp. 12–14; the reduction from x to x′ needs the genericity-neighbourhood argument recorded as ReductiveGroupsPartII/E44).
2. (2): pass to the Galois closure (still tame), then 𝒢_x and (Res 𝒢̃_{x′})^Γ are smooth with the same Ŏ-points (tame descent of buildings RG2.2/tame-descent-of-building and Edixhoven RG2.0a/tame-fixed-points-of-weil-restriction), so the extension principle identifies them (the source prints 𝒢̃_x for 𝒢̃_{x′}, ReductiveGroupsPartII/E43).
3. (3): Kisin's invariant-lattice argument: over the maximal unramified extension M of K̃, the semidirect product 𝒢̃(O_M) ⋊ Gal(M/K) is bounded/compact, so the O_M-span of the orbit of a lattice is a Gal(M/K)-stable, ρ(𝒢̃(O_M))-stable lattice; descend to Õ; by the extension principle ρ extends to 𝒢̃ → GL(Λ̃), a closed immersion by Prasad–Yu (RG2.3/reductive-closed-immersion-criterion; KPZ Prop. 2.4.2, arXiv p. 16); Weil restriction and fixed points preserve closed immersions (KPZ Rem. 2.4.3, (2.4.5), misprints recorded as ReductiveGroupsPartII/E45); Lemma 2.3.3 and §2.3.6 (eigenspace decomposition under inertia) identify (Res GL(Λ̃))^Γ with GL(L) and show tot(L) is a direct summand.
4. (4): KPZ Lemma 6.1.2 (arXiv p. 65): F^ur = F·ℚ_p^ur, and every e-th root of a uniformizer of F (e prime to p) lies in F·ℚ_p^t by a Bézout computation on valuations.

**Acceptance.**

- For G = GL(V) and x the barycentre of the standard Iwahori facet, K̃ = K(ϖ^{1/n}) and x′ = x: the Iwahori group scheme is (Res_{Õ/O} GL(Λ̃))^Γ for Λ̃ = ⊕ π̃^{−i} O e_i.
- For G split and x hyperspecial, one may take K̃ = K and (2) is the identity.

**Sources.**

- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §2.2.1, Proposition 2.2.2 and proof, arXiv v3 pp. 12–14. Realizes stabilizer schemes of facet-generic points of classical tame groups as Galois fixed points of hyperspecial (reductive) group schemes over a tame extension, via tame subdivision and Edixhoven's lemma.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §2.3.2, Lemma 2.3.3, §2.3.6, Proposition 2.4.2, Remark 2.4.3, §2.4.4 (2.4.5), arXiv v3 pp. 14–17. Identifies the fixed points of the Weil restriction of GL of a Γ-stable lattice with the chain-automorphism group, shows the total lattice is a direct summand, produces a Γ-stable lattice with a closed immersion of the reductive model, and composes the closed immersions.
- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): Lemma 6.1.2, arXiv v3 p. 65. The maximal tame extension of a finite extension F of ℚ_p is F·ℚ_p^t.
- [Gopal Prasad, *Finite group actions on reductive groups and buildings and tamely-ramified descent in Bruhat–Tits theory*](https://arxiv.org/abs/1705.02906): Theorem 3.17, p. 23; §4, pp. 23–26 (arXiv v5). Constructs the fixed-point building and applies it to tame Galois descent; hyperspecial realization itself uses KPZ and PR24.
- [Georgios Pappas, Michael Rapoport, *On tamely ramified G-bundles on curves*](https://api.algebraicgeometry.nl/Article/20757/2024-6-024.pdf): Propositions 2.7–2.8 and Remark 2.9, pp. 802–805. The previously indirect input is now a directly read target in this layer, with its separate hypotheses.

<a id="RG2-3-positive-depth-filtration-basis"></a>

### Positive-depth subgroups are pro-p and cofinal

Target `ReductiveGroupsPartII:RG2.3/positive-depth-filtration-basis`. Theorem; suggested declaration `MoyPrasad.isProP_filtration`.

Let E be a nonarchimedean local field with residue characteristic p, G connected reductive over E and x ∈ B^e(G,E). (a) For r > 0, G_{x,r} is a compact open subgroup of G(E), normal in G_{x,0}, and pro-p; G_{x,0+} = P_x^+ is the pro-unipotent radical of the parahoric. (b) The G_{x,r}, r → ∞, form a neighbourhood basis of 1 in G(E); every compact open subgroup contains some G_{x,r} with finite index. (c) For the barycentre x_C of an alcove C and integers n ≥ 1, I_n := G_{x_C,n} are normal in the Iwahori I = G_{x_C,0}, stable under every automorphism θ of G(E) preserving C (and coming from an algebraic automorphism or Frobenius), decreasing and cofinal; the congruence subgroups 𝒢(O)_n of any smooth affine O-model (RG2.0/congruence-subgroup) and the G_{x,r} are mutually cofinal.

**Hypotheses.** E local field, residue characteristic p; G connected reductive over E; x ∈ B^e(G,E); r > 0.

**Prerequisites.** [The Moy–Prasad filtration](#RG2-3-moy-prasad-filtration) (`ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`); [Congruence subgroups form a neighbourhood basis](#RG2-0-congruence-neighbourhood-basis) (`ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`); `tauceti:TauCeti.IsProP`; [The Moy–Prasad isomorphism](#RG2-3-moy-prasad-isomorphism) (`ReductiveGroupsPartII:RG2.3/moy-prasad-isomorphism`); [Integral points of an affine model are compact open](#RG2-0-integral-points-compact-open) (`ReductiveGroupsPartII:RG2.0/integral-points-compact-open`); [Congruence subgroups of an integral group model](#RG2-0-congruence-subgroup) (`ReductiveGroupsPartII:RG2.0/congruence-subgroup`); [Positive radicals and nested facets](#RG2-3-pro-unipotent-radical-and-nested-facets) (`ReductiveGroupsPartII:RG2.3/pro-unipotent-radical-and-nested-facets`).

**Construction or proof.**

1. (a): G_{x,r} ⊆ G_{x,0} = 𝒢°_x(O) compact open (RG2.0/integral-points-compact-open, RG2.3/parahoric-subgroup); for r > 0 the successive quotients G_{x,s}/G_{x,s+} (s ≥ r) are finite κ-vector spaces by the Moy–Prasad isomorphism, hence p-groups, and the filtration is exhaustive with trivial intersection, so G_{x,r} is pro-p (tauceti IsProP: every open normal subgroup has p-power index).
2. (b): G_{x,n} ⊆ 𝒢°_x(O)_{⌈n⌉}-type congruence kernels and conversely 𝒢(O)_m ⊆ G_{x,r} for m large, by comparing generators with the congruence filtration of RG2.0/congruence-neighbourhood-basis (both are defined by valuations of coordinates in a big cell).
3. (c): normality in I from normality in G_{x_C,0}; θ-stability since θ fixes x_C and the construction is canonical; He 2018 §4.2 (arXiv v3 p. 12) uses exactly these properties.

**Acceptance.**

- For GL_n and the standard vertex, G_{x,n} = 1 + ϖ^n M_n(O) is pro-p with quotients M_n(κ).
- For SL_2 and the barycentre of the standard edge, G_{x,1/2} is the pro-p Iwahori: matrices in SL_2(O) unipotent upper triangular modulo ϖ.

**Sources.**

- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §4.2, arXiv v3 p. 12. Introduces I_n as the n-th Moy–Prasad subgroup at the barycentre of the base alcove and notes that they form a fundamental system of open compact subgroups.
- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): §3, arXiv v2 pp. 8–9. Fixes the notation G(E)_{x,r} for the Moy–Prasad subgroups of depth r ≥ 0 at points of the enlarged building, G_{x,r+} and G(E)_r, the Lie and dual lattices for every real r, the normalization by the valuation extending that of k, the tame comparison (g_E)_{x,r} ∩ g = g_{x,r}, the depth of a dual element, and the reductive quotient G_x with G_x(f_F) = G(F)_{x,0}/G(F)_{x,0+} acting on V_{x,r}.

<a id="RG2-3-mock-exponential"></a>

### The mock exponential

Target `ReductiveGroupsPartII:RG2.3/mock-exponential`. Construction; suggested declaration `MoyPrasad.mockExp`.

For G split over a tame extension and a point x, choose a filtration-compatible homeomorphism e_x:g_(x,0+)→G_(x,0+) with e_x(0)=1 as in Adler. Its restriction to depth s>0 induces choice-independent additive-to-multiplicative quotient isomorphisms g_(x,r)/g_(x,t)≃G_(x,r)/G_(x,t) for 0<r≤t≤2r; these agree with the graded Moy–Prasad isomorphism. Root coordinates give the ordered root product and torus coordinate map modulo depth 2s. The full homeomorphism depends on choices and need not be equivariant. For Y∈g_(x,s), Z∈g_(x,t), t real, Ad(e_x(Y))Z−Z−[Y,Z]∈g_(x,t+2s); multiplicative error has depth r+s and commutator error depth r+s+min(r,s) for positive r,s. Only the quotient maps are canonical and have the conjugation compatibility of Adler Proposition 1.6.7.

**Hypotheses.** G split over a tame E/K; Chevalley system chosen; s > 0.

**Prerequisites.** [The Moy–Prasad isomorphism](#RG2-3-moy-prasad-isomorphism) (`ReductiveGroupsPartII:RG2.3/moy-prasad-isomorphism`); [Moy–Prasad lattices in the Lie algebra and its dual](#RG2-3-moy-prasad-lie-lattices) (`ReductiveGroupsPartII:RG2.3/moy-prasad-lie-lattices`); [Commutator estimates for valued root groups](#RG2-1-valued-commutator-estimates) (`ReductiveGroupsPartII:RG2.1/valued-commutator-estimates`); [Moy–Prasad intersection under field extension](#RG2-3-filtration-under-field-extension) (`ReductiveGroupsPartII:RG2.3/filtration-under-field-extension`).

**Uses.**

- Fintzen 2021, Lemma 5.1(b): conjugating X + C back to X on g_{x,r} by g = e(−Y)^{−1}, which drives the existence of data in Corollaries 5.2–5.4.
- Kim–Murnaghan / Adler character expansions (SmoothRepresentationsOfLocalGroups Part II): transporting characters of G_{x,s}/G_{x,s+} to the Lie algebra.
- this layer, RG2.3/moy-prasad-isomorphism: an explicit inverse of the graded isomorphism.

**API.**

- `MoyPrasad.mockExp` (constructor): The positive-depth restriction of a chosen filtration-compatible homeomorphism e_x, with e_x(0)=1; only its quotient maps up to depth 2r are canonical.
- `MoyPrasad.mockExp_mem` (relation): e(g_{x,t}) ⊆ G_{x,t} for t ≥ s.
- `MoyPrasad.mockExp_graded` (compatibility): e induces the Moy–Prasad isomorphism g_{x,t}/g_{x,t+} ≅ G_{x,t}/G_{x,t+} for t ≥ s.
- `MoyPrasad.mockExp_ad` (relation): Ad(e(Y))Z − Z − [Y,Z] ∈ g_{x,t+2s} for Y ∈ g_{x,s}, Z ∈ g_{x,t}.
- `MoyPrasad.mockExp_ordering` (other): Changing the ordering of roots changes e(Y) by an element of G_{x,2s}.
- `MoyPrasad.mockExp_mul_error` (relation): For Y of depth r>0 and Z of depth s>0, e(Y)e(Z)e(Y+Z)⁻¹∈G_(x,r+s).
- `MoyPrasad.mockExp_comm_error` (relation): [e(Y),e(Z)]e([Y,Z])⁻¹∈G_(x,r+s+min(r,s)).
- `MoyPrasad.mockExp_quotient_equivariant` (compatibility): The depth-r/depth-t quotient maps are conjugation-compatible for 0<r≤t≤2r and X,Ad(g)X in g_(x,r), as in Adler 1.6.7.

**Unit tests.**

- `MoyPrasad.mockExp_zero` (degenerate): e(0) = 1.
- `MoyPrasad.mockExp_GL` (computation): For GL_n at the standard vertex, e(Y) ≡ 1 + Y modulo 1 + ϖ^{2s} M_n(O).
- `MoyPrasad.mockExp_not_hom` (non-example): e is not a group homomorphism from (g_{x,s}, +): for SL_2 and Y = X_α, Z = X_{−α} of depth s, e(Y+Z) and e(Y)e(Z) differ by an element of depth exactly 2s in general.
- `MoyPrasad.mockExp_torus` (compatibility): For a split torus T, e restricted to Lie(T)_s agrees modulo T_{2s} with u ↦ 1 + u in coordinates (Tau Ceti unit filtration).

**Construction or proof.**

1. Construct the split torus map with χ_i(e(H))=1+dχ_i(H); its quotient up to depth 2r is independent of the character basis.
2. Combine ordered root maps with the torus map. Commutator estimates remove ordering dependence on the depth-r/depth-t quotient for t≤2r.
3. Descend the quotient maps through a splitting field using normalized intersection. Choose compatible lifts through discrete jumps to obtain the noncanonical full homeomorphism.
4. Check Adler Propositions 1.6.2–1.6.3 for multiplication, commutator and adjoint errors; use 1.6.4–1.6.7 for conjugation on quotients.

**Acceptance.**

- For GL_n at the standard vertex, e(Y) = 1 + Y satisfies the defining congruence modulo 1 + ϖ^{2s} M_n(O) for Y ∈ ϖ^s M_n(O), and Ad(1+Y)Z ≡ Z + [Y,Z] modulo depth t+2s.

**Sources.**

- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): proof of Lemma 5.1, arXiv v2 pp. 18–19. Uses a mock exponential from g_{x,r−d−ε} to G_{x,r−d−ε} in the sense of Adler, congruent to the ordered root-group product modulo depth 2(r−d−ε), and its first-order adjoint congruence Ad(g^{−1})Z ≡ Z + [−Y,Z] modulo depth r′ + 2(r−d−ε).
- [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198): §3, arXiv v2 pp. 8–9. Fixes the notation G(E)_{x,r} for the Moy–Prasad subgroups of depth r ≥ 0 at points of the enlarged building, G_{x,r+} and G(E)_r, the Lie and dual lattices for every real r, the normalization by the valuation extending that of k, the tame comparison (g_E)_{x,r} ∩ g = g_{x,r}, the depth of a dual element, and the reductive quotient G_x with G_x(f_F) = G(F)_{x,0}/G(F)_{x,0+} acting on V_{x,r}.
- [Jeffrey D. Adler, *Refined anisotropic K-types and supercuspidal representations*](https://msp.org/pjm/1998/185-1/pjm-v185-n1-p01-p.pdf): Proposition 1.4.1, pp. 9–10; §§1.5–1.6, pp. 11–17. Directly read the normalized field-intersection argument and the quotient construction, choice dependence, multiplicative and adjoint depth estimates.

<a id="RG2-3-classical-hyperspecial-lattices"></a>

### Hyperspecial lattices for orthogonal and quaternionic groups

Target `ReductiveGroupsPartII:RG2.3/classical-hyperspecial-lattices`. Theorem; suggested declaration `KisinPappas.hyperspecial_orthogonal_selfDual`.

(a) Let K̃/K be tame Galois with group Γ (p > 2) and G′ = GO^+(V,h) split over K̃. If the stabilizer of a Γ-fixed point x ∈ B(G′,K̃) is hyperspecial, it is the stabilizer of a Γ-stable Õ-lattice Λ̃ ⊂ V_{K̃} self-dual up to homothety for h (Λ̃^∨ = π̃^a Λ̃); after adjoining a square root of π̃ (and passing to the Galois closure, still tame since p > 2) Λ̃ can be rescaled so that Λ̃^∨ = Λ̃, and the reductive model is GO^+(Λ̃,h). (b) Let D be a quaternion division algebra over a p-adic field K with its main involution. Every nondegenerate quaternionic hermitian form S on a right D-module T_0 ≅ D^s has a D-basis in which S((d_i),(d′_i)) = Σ d̄_i d′_i (Shimura 1963/1973 as cited). (c) Consequently the symplectic representations σ_{V_0} (orthogonal case) and σ_{T_0} (quaternionic case) of KPZ §6.2.2 are direct sums of copies of the basic ones.

**Hypotheses.** p > 2; (a): G′ = GO^+(V,h) split over a tame Galois K̃/K; x Γ-fixed with hyperspecial stabilizer; (b): D quaternion division over p-adic K.

**Prerequisites.** [Tame realization of stabilizers as fixed points of hyperspecial models](#RG2-3-tame-hyperspecial-realization) (`ReductiveGroupsPartII:RG2.3/tame-hyperspecial-realization`); [Parahorics of GL and GSp as lattice-chain automorphism groups](#RG2-3-lattice-chain-stabilizer-schemes) (`ReductiveGroupsPartII:RG2.3/lattice-chain-stabilizer-schemes`); [Division-algebra lattice building](#RG2-2-division-algebra-building) (`ReductiveGroupsPartII:RG2.2/division-algebra-building`); [Hyperspecial points and reductive models](#RG2-3-hyperspecial-vertices) (`ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`); `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

**Construction or proof.**

1. (a): a hyperspecial vertex of the split orthogonal similitude group corresponds to a lattice self-dual up to scaling (BT classiques description of buildings of classical groups by self-dual norms; KPZ proof of Thm 6.2.3 citing [BT87], [KaP23 15.2]); Γ-fixedness of x gives Γ-stability; adjoining π̃^{1/2} makes the homothety exponent even.
2. For (b), use the valued quaternion algebra: its residue field is quadratic, giving an unramified quadratic subfield by Hensel lifting, and a division-algebra uniformizer has reduced norm of K-valuation one. Norms of the unramified subfield give all O× (residue norm surjectivity followed by the unit filtration and completeness); the uniformizer then gives all valuations. Thus Nrd(D×)=K×. Gram–Schmidt diagonalizes a nondegenerate main-involution hermitian form with diagonal in K×; scale each basis vector using a reduced norm equal to the inverse diagonal entry. This supplies the standard-basis argument cited in KPZ §6.2.2(b), arXiv v3 p. 70, without reading an uncleared Shimura book.
3. (c): decompose W = V_0 ⊗ V (resp. T_0 ⊗_D T) using a Lagrangian basis of V_0 (resp. the standard basis of (b)) (KPZ §6.2.2, arXiv pp. 69–70).

**Acceptance.**

- For the split quadratic space K^{2n} with the hyperbolic form, the hyperspecial lattice is O^{2n}, self-dual.
- (b) for s = 1: every nondegenerate quaternionic hermitian form on D is a scalar multiple d̄ a d′ with a ∈ K^×, and rescaling the basis vector by d with N(d) = a^{-1} gives the standard form.
- Quaternionic Hermitian basis changes are right-D-linear; the argument uses the main involution and reduced norm, not arbitrary involutions.

**Sources.**

- [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): §6.2.2 and proof of Theorem 6.2.3, arXiv v3 pp. 69–71. Describes the two forms of type D^H (orthogonal similitudes and quaternionic unitary similitudes), the standard basis of quaternionic hermitian forms, and shows hyperspecial stabilizers over a tame splitting field are stabilizers of Γ-stable lattices self-dual up to homothety, made self-dual after adjoining a square root of the uniformizer.
- [François Bruhat, Jacques Tits, *Schémas en groupes et immeubles des groupes classiques sur un corps local*](http://www.numdam.org/item/10.24033/bsmf.2006.pdf): §§1–2 (norms on spaces with forms), printed pp. 259–286. Describes buildings of classical groups by norms (equivalently lattice chains) self-dual for the form, from which hyperspecial points correspond to self-dual lattices up to homothety.

<a id="RG2-3-frobenius-fixed-coset-lifting"></a>

### Frobenius-fixed coset lifting at positive level

Target `ReductiveGroupsPartII:RG2.3/frobenius-fixed-coset-lifting`. Theorem; suggested declaration `Lang.iwahoriLevel_fixedCoset_bijective`.

Let G be connected reductive over E with Iwahori I = Ĭ^σ (Ĭ ⊂ G(Ĕ) the Iwahori of the σ-stable alcove), I_n = Ĭ_n^σ the integer-depth Moy–Prasad subgroups at the barycentre (n ≥ 1), and g ∈ G(E). Then the natural map I_n/(I_n ∩ gI_ng^{−1}) → (Ĭ_n/(Ĭ_n ∩ gĬ_ng^{−1}))^σ is bijective; equivalently (Ĭ_n g Ĭ_n/Ĭ_n)^σ = I_n g I_n/I_n. The proof needs that Ĭ_n ∩ gĬ_ng^{−1} is the group of Ŏ-points of a connected (pro-unipotent) smooth group scheme whose truncations are smooth connected F̄_q-groups, so that Lang's theorem for inverse limits applies; being pro-p alone does not suffice (correction of the source, ReductiveGroupsPartII/E40).

**Hypotheses.** G connected reductive over E; n ≥ 1; g ∈ G(E).

**Prerequisites.** [Lang's theorem for inverse limits and fixed cosets](#RG2-3-lang-for-pro-algebraic-groups) (`ReductiveGroupsPartII:RG2.3/lang-for-pro-algebraic-groups`); [Positive-depth subgroups are pro-p and cofinal](#RG2-3-positive-depth-filtration-basis) (`ReductiveGroupsPartII:RG2.3/positive-depth-filtration-basis`); [The Moy–Prasad filtration](#RG2-3-moy-prasad-filtration) (`ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`); [Connected parahoric group schemes](#RG2-3-parahoric-group-scheme) (`ReductiveGroupsPartII:RG2.3/parahoric-group-scheme`); [Positive radicals and nested facets](#RG2-3-pro-unipotent-radical-and-nested-facets) (`ReductiveGroupsPartII:RG2.3/pro-unipotent-radical-and-nested-facets`).

**Construction or proof.**

1. Injectivity is formal (kernel I_n ∩ gI_ng^{−1}).
2. Ĭ_n ∩ gĬ_ng^{−1} is the Moy–Prasad-type group of a concave function (intersection of two such), i.e. Ŏ-points of a smooth connected O-model with pro-unipotent jet truncations (RG2.3/positive-depth-filtration-basis, RG2.3/unramified-base-change-of-parahorics); by RG2.3/lang-for-pro-algebraic-groups (c) the Lang map is surjective on it, and (d) gives surjectivity (He 2018 Lemma 15 = arXiv v3 Lemma 4.5, p. 13, with the gap filled).

**Acceptance.**

- For GL_n and g = 1 both sides are a single point; for g = diag(ϖ,1) in GL_2 and n = 1, both sides have q elements.

**Sources.**

- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §4.3 and Lemma 15 (arXiv v3 Lemma 4.5) with proof, pp. 12–13. Identifies the Frobenius-fixed points of Ĭ_n g Ĭ_n/Ĭ_n with I_n g I_n/I_n; the printed proof lifts fixed points using only that the intersection is pro-p, which needs Lang's theorem for connected pro-unipotent groups.

<a id="RG2-3-classical-level-subgroups"></a>

### Iwahori and congruence levels of classical groups

Target `ReductiveGroupsPartII:RG2.3/classical-level-subgroups`. Application; suggested declaration `LevelSubgroups.iwahori_isParahoric`.

Explicit parahoric and positive-depth level subgroups. (a) GL_n(E): the standard Iwahori I = {g ∈ GL_n(O) : g mod ϖ upper triangular}, the pro-p Iwahori I^+ = {g ∈ I : g mod ϖ unipotent upper triangular} = G_{x_C,0+}, the (1,n−1)-parahoric {g ∈ GL_n(O) : last row ≡ (0,…,0,∗) mod ϖ} (stabilizer of the chain O^n ⊃ O^{n−1} ⊕ ϖO), the principal congruence subgroups 1 + ϖ^m M_n(O) = G_{x_0,m}; their images in PGL_n(E) are the parahorics and pro-p radicals of PGL_n. (b) GSp_4(E) with ψ antidiagonal: the Iwahori Iw = stabilizer of the self-dual chain of the standard alcove, and Iw_1 = its pro-p radical; every g ∈ Iw_1 has characteristic polynomial ≡ (X − 1)^4 modulo ϖ (g is unipotent upper triangular modulo ϖ in a suitably ordered basis). (c) For a quaternion algebra B over a number field with maximal order O_B and N ≥ 1, the local factors (1 + N Ô_B)_v^× are compact open subgroups (principal congruence subgroups of the parahoric O_{B,v}^×, equal to G_{x,r} at split places), decreasing in N and with finite index in Ô_B^×; their effective scalar stabilizers are computed separately by the consumer. All are compact open, nested as stated, and the pro-p ones are pro-p.

**Hypotheses.** E local field with ring of integers O and uniformizer ϖ; B quaternion algebra over a number field (c).

**Prerequisites.** [Parahorics of GL and GSp as lattice-chain automorphism groups](#RG2-3-lattice-chain-stabilizer-schemes) (`ReductiveGroupsPartII:RG2.3/lattice-chain-stabilizer-schemes`); [Positive-depth subgroups are pro-p and cofinal](#RG2-3-positive-depth-filtration-basis) (`ReductiveGroupsPartII:RG2.3/positive-depth-filtration-basis`); [Integral points of an affine model are compact open](#RG2-0-integral-points-compact-open) (`ReductiveGroupsPartII:RG2.0/integral-points-compact-open`); `tauceti:TauCeti.GeneralLinear.pointsMulEquiv`; `mathlib:Matrix.isUnit_iff_isUnit_det`; [Parahoric, Iwahori and pro-p Iwahori subgroups](#RG2-3-parahoric-subgroup) (`ReductiveGroupsPartII:RG2.3/parahoric-subgroup`); [GL building through additive norms and lattice chains](#RG2-2-gl-building-lattice-chains) (`ReductiveGroupsPartII:RG2.2/gl-building-lattice-chains`); [Symplectic building and self-dual lattice chains](#RG2-2-gsp-building-self-dual-chains) (`ReductiveGroupsPartII:RG2.2/gsp-building-self-dual-chains`).

**Construction or proof.**

1. (a): GL_n parahorics are stabilizers of lattice chains (RG2.3/lattice-chain-stabilizer-schemes); reduction mod ϖ of Aut(Λ_•) is the parabolic of the flag Λ_0/ϖΛ_0 ⊃ Λ_i/ϖΛ_0; the pro-unipotent radical is the kernel to the Levi quotient (RG2.3/positive-depth-filtration-basis); principal congruence subgroups are Moy–Prasad groups at the vertex.
2. (b): GSp_4 parahorics are similitude automorphisms of almost self-dual chains; Iw_1 reduces into the unipotent radical of the Borel of GSp_4(κ), so its elements are unipotent mod ϖ and their characteristic polynomial is (X−1)^4 mod ϖ.
3. (c): at split places O_{B,v}^× ≅ GL_2(O_v) and 1 + N M_2(O_v) is the principal congruence subgroup; at ramified places O_{B,v}^× is the unique parahoric of D_v^× and 1 + N O_{B,v} a positive-depth Moy–Prasad subgroup; compact open by RG2.0/integral-points-compact-open.

**Acceptance.**

- [GL_2(O) : I] = q + 1; [I : I^+] = (q−1)^2; [GL_n(O) : 1 + ϖ M_n(O)] = |GL_n(κ)|.
- For GSp_4: [GSp_4(O) : Iw] = |GSp_4(κ)|/|B(κ)| = (q+1)^2(q^2+1), and Iw/Iw_1 ≅ T(κ) ≅ (κ^×)^3.

**Sources.**

- [François Bruhat, Jacques Tits, *Schémas en groupes et immeubles des groupes classiques sur un corps local*](http://www.numdam.org/item/10.24033/bsmf.2006.pdf): 3.6–3.12, printed pp. 288–290. Group schemes of points of the building of classical groups as automorphisms of lattice flags, their big cells and special fibres (radical and reductive quotient).
- [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.1.9 and §1.1.11, arXiv v3 pp. 8–10. GL and GSp parahorics as stabilizers of (almost self-dual) lattice chains.
- [W. Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf): §1.4.2–§1.4.4, draft 1995 pp. 12–15. Constructs normal congruence subgroups and their root-product decompositions, including Iwahori-compatible factors.

<a id="rg2-4"></a>

## RG2.4. Iwahori–Weyl groups and local decompositions

The model and building constructions yield Iwahori–Weyl combinatorics, rational quotient comparisons, Iwasawa and Cartan decompositions and positive-depth cell counts. The final adapters isolate the invariant-lattice and adjoint-coset inputs used in Shimura and affine Deligne–Lusztig arguments.

<a id="RG2-4-iwahori-weyl-group"></a>

### Iwahori–Weyl group

Target `ReductiveGroupsPartII:RG2.4/iwahori-weyl-group`. Definition; suggested declaration `BruhatTits.IwahoriWeylGroup`.

For a maximal K-split torus S, minimal Levi M=Z_G(S), normalizer N and the unique parahoric M₁ of M(K), define W̃_K=N(K)/M₁. The subgroup M₁ is normal in N(K). It acts on the enlarged apartment, but the action can have finite kernel; replacing M₁ by the maximal bounded subgroup loses torsion information. Over L, M=T is a torus and M₁=ker κ_T=T°(O_L). Over E, W̃_E identifies with W̃_L^σ for a compatible maximal-L-split torus containing S.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For a maximal K-split torus S, minimal Levi M=Z_G(S), normalizer N and the unique parahoric M₁ of M(K), define W̃_K=N(K)/M₁.

**Prerequisites.** [Kernel and image of the action on the apartment](#RG2-1-apartment-action-kernel) (`ReductiveGroupsPartII:RG2.1/apartment-action-kernel`); [Bounded and connected torus models](#RG2-3-neron-finite-type-and-connected-models) (`ReductiveGroupsPartII:RG2.3/neron-finite-type-and-connected-models`); [The affine Weyl group](#RG2-1-affine-weyl-group) (`ReductiveGroupsPartII:RG2.1/affine-weyl-group`); [Parahoric, Iwahori and pro-p Iwahori subgroups](#RG2-3-parahoric-subgroup) (`ReductiveGroupsPartII:RG2.3/parahoric-subgroup`).

**Uses.**

- He §1.1: Iwahori cells carry these labels..
- GLX §2.1: Admissible sets keep the full inertia-coinvariant lattice..

**API.**

- `BruhatTits.IwahoriWeylGroup` (constructor): N(K)/M₁.
- `BruhatTits.IwahoriWeylGroup.quotientMap` (data): The normalizer quotient homomorphism.
- `BruhatTits.IwahoriWeylGroup.apartmentAction` (data): The descended affine apartment action.
- `BruhatTits.IwahoriWeylGroup.affineWeylEmbedding` (relation): The affine Weyl subgroup embeds normally.
- `BruhatTits.IwahoriWeylGroup.frobeniusFixedEquiv` (equivalence): W̃_E≃W̃_L^σ.

**Unit tests.**

- `BruhatTits.IwahoriWeylGroup.gl` (computation): For split GL_n, W̃=ℤ^n⋊S_n.
- `BruhatTits.IwahoriWeylGroup.splitTorus` (degenerate): For G_m, W̃=ℤ and the affine Weyl subgroup is trivial.
- `BruhatTits.IwahoriWeylGroup.torus_kernel_compat` (compatibility): Over L the denominator equals the RG2.1 torus Kottwitz kernel.
- `BruhatTits.IwahoriWeylGroup.torsion_kernel` (non-example): A ramified quadratic norm-one torus has W̃=ℤ/2 but trivial apartment action.

**Construction or proof.**

1. The minimal Levi has a unique parahoric; conjugation by N preserves it.
2. Form the group quotient and descend the apartment action.
3. Lang lifting on the connected torus/minimal-Levi model compares Frobenius-fixed quotients.

**Acceptance.**

- The ramified norm-one torus retains its finite torsion quotient although its apartment is a point.

**Sources.**

- [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635): Definition 1.1 and Lemma 1.6, pp. 1, 3–4. The minimal Levi has a unique parahoric; conjugation by N preserves it. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Definition 7, p. 4. The minimal Levi has a unique parahoric; conjugation by N preserves it. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Iwahori–Weyl group**.

<a id="RG2-4-compact-double-coset-finiteness"></a>

### Finite coset count inside a compact double coset

Target `ReductiveGroupsPartII:RG2.4/compact-double-coset-finiteness`. Theorem; suggested declaration `BruhatTits.compact_double_coset_finiteness`.

For compact open subgroups P,Q of a locally compact Hausdorff group and g∈G, PgQ is the disjoint union of [P:P∩gQg⁻¹] right Q-cosets, and this index is finite. For a left Haar measure, μ(PgQ)=[P:P∩gQg⁻¹]μ(Q). The full double-coset set P\G/Q need not be finite, even when P=Q is hyperspecial. This elementary topological statement is the precise finiteness assertion needed by the roadmap.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For compact open subgroups P,Q of a locally compact Hausdorff group and g∈G, PgQ is the disjoint union of [P:P∩gQg⁻¹] right Q-cosets, and this index is finite.

**Prerequisites.** [Congruence subgroups form a neighbourhood basis](#RG2-0-congruence-neighbourhood-basis) (`ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`); `mathlib:Subgroup.index`; `mathlib:MeasureTheory.Measure.haarMeasure`.

**Construction or proof.**

1. The map P→PgQ/Q has fibres the cosets of P∩gQg⁻¹.
2. That subgroup is open in compact P, hence has finite index.
3. Use left invariance and finite disjoint additivity.

**Acceptance.**

- For G_m, O×\E×/O×=ℤ is infinite.

**Sources.**

- [W. Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf): §1.3, pp. 10–12 (compact open subgroups and Haar measures); direct coset-index argument. The map P→PgQ/Q has fibres the cosets of P∩gQg⁻¹. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-iwahori-factorization"></a>

### Iwahori and positive-depth root factorizations

Target `ReductiveGroupsPartII:RG2.4/iwahori-factorization`. Theorem; suggested declaration `BruhatTits.iwahori_factorization`.

For an Iwahori I attached to an alcove in an apartment and a parabolic Q=MU compatible with that apartment, multiplication (I∩U⁻)×(I∩M)×(I∩U)→I is bijective, with the other ordered variants obtained from the root charts. For r>0, G_(x,r) admits the corresponding factorization when x lies in the compatible Levi apartment. More general parahorics require residual-parabolic compatibility and do not all have this big-cell factorization: hyperspecial GL_2(O) contains the Weyl matrix outside the triangular big cell. Torus elements with the appropriate nonpositive valuation pairings contract the U factors.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For an Iwahori I attached to an alcove in an apartment and a parabolic Q=MU compatible with that apartment, multiplication (I∩U⁻)×(I∩M)×(I∩U)→I is bijective, with the other ordered variants obtained from the root charts.

**Prerequisites.** [The Moy–Prasad filtration](#RG2-3-moy-prasad-filtration) (`ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`); [Parahoric, Iwahori and pro-p Iwahori subgroups](#RG2-3-parahoric-subgroup) (`ReductiveGroupsPartII:RG2.3/parahoric-subgroup`); [Commutator estimates for valued root groups](#RG2-1-valued-commutator-estimates) (`ReductiveGroupsPartII:RG2.1/valued-commutator-estimates`).

**Construction or proof.**

1. Order nondivisible root groups and use the torus/root big cell.
2. The commutator depth estimates show reordered products remain in the prescribed factors.
3. Conjugation by a torus element shifts each depth by its root pairing.

**Acceptance.**

- Do not extend the bijection to arbitrary depth-zero parahorics.

**Sources.**

- [W. Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf): Proposition 1.4.4 and surrounding discussion, pp. 13–14; He18 Lemma 4.6 proof, pp. 13–14. Order nondivisible root groups and use the torus/root big cell. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-invariant-cocharacter-lifting"></a>

### Invariant cocharacters lift fundamental classes

Target `ReductiveGroupsPartII:RG2.4/invariant-cocharacter-lifting`. Theorem; suggested declaration `BruhatTits.invariant_cocharacter_lifting`.

Let 𝒢 be connected reductive over ℤ_p, G its generic fibre, S a maximal ℤ_p-split torus and T=Z_𝒢(S), a maximal torus. For Γ=Gal(F̄_p/F_p) acting on the geometric cocharacter and fundamental groups, X_*(T)^Γ→π₁(G)^Γ is surjective. Evaluation μ↦μ(p) is a section of the valuation map T(ℚ_p)→X_*(T)^Γ, so κ_G:G(ℚ_p)→π₁(G)^Γ is surjective. Inertia acts trivially in this unramified setup.

**Hypotheses.** The field, group and other hypotheses in the statement apply throughout.

**Prerequisites.** [The algebraic fundamental group](#RG2-1-algebraic-fundamental-group) (`ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`); [Rational points carry a root datum](#RG2-1-rational-points-root-datum) (`ReductiveGroupsPartII:RG2.1/rational-points-root-datum`); [Hyperspecial points and reductive models](#RG2-3-hyperspecial-vertices) (`ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`).

**Construction or proof.**

1. Choose a Γ-stable Borel containing T; the simple coroots form a Γ-permuted ℤ-basis of the coroot lattice.
2. The first cohomology of that permutation lattice is zero: a continuous cocycle of the procyclic Γ is determined in a finite quotient, and a finite cyclic group has H¹(Γ,ℤ)=0; apply the elementary induced-module argument to each orbit.
3. The long exact sequence of invariants for 0→Q∨→X_*(T)→π₁(G)→0 therefore proves surjectivity. Evaluate invariant cocharacters at p to obtain the section and the rational representative.

**Acceptance.**

- For GL_n a determinant class m is represented by diag(p^m,1,…,1).
- The invariant map is not asserted for an arbitrary ramified reductive model.

**Sources.**

- [Mark Kisin, *Mod p points on Shimura varieties of abelian type*](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf): Lemma 1.2.3, author copy p. 13. Invariant cocharacters lift fundamental classes: the cited result supplies the construction or argument with the hypotheses stated here.

<a id="RG2-4-iwahori-weyl-exact-sequences"></a>

### Iwahori–Weyl exact sequences and alcove components

Target `ReductiveGroupsPartII:RG2.4/iwahori-weyl-exact-sequences`. Theorem; suggested declaration `BruhatTits.iwahori_weyl_exact_sequences`.

There are exact sequences 1→M(K)/M₁→W̃_K→W₀→1 and 1→W_a→W̃_K→(π₁(G)_I)^σ→1 over E; over L omit σ. The stabilizer Ω of the base alcove maps isomorphically to the last target and W̃=W_a⋊Ω. Over L, M(L)/M₁=X_*(T)_I; a special vertex splits the first sequence and gives X_*(T)_I⋊W₀. Such a splitting need not be σ-equivariant. The apartment-action kernel is the torsion subgroup of the translation lattice, not an extra copy of all Ω.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; There are exact sequences 1→M(K)/M₁→W̃_K→W₀→1 and 1→W_a→W̃_K→(π₁(G)_I)^σ→1 over E; over L omit σ.

**Prerequisites.** [Iwahori–Weyl group](#RG2-4-iwahori-weyl-group) (`ReductiveGroupsPartII:RG2.4/iwahori-weyl-group`); [The Kottwitz homomorphism](#RG2-1-kottwitz-homomorphism) (`ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism`); [The algebraic fundamental group](#RG2-1-algebraic-fundamental-group) (`ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`).

**Construction or proof.**

1. The normalizer exact sequence gives W₀; torus Kottwitz identifies translations over L.
2. The simply connected normalizer image is W_a.
3. The alcove stabilizer splits the quotient; use Frobenius-fixed descent for E.

**Acceptance.**

- Separate the special-vertex splitting from the alcove-component splitting.

**Sources.**

- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Propositions 13 and 14, pp. 8–9. The normalizer exact sequence gives W₀; torus Kottwitz identifies translations over L. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635): (1.5)–(1.6), p. 2 and Corollary 1.7, p. 4. The normalizer exact sequence gives W₀; torus Kottwitz identifies translations over L. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-split-torus-coset-infinitude"></a>

### Infinite rational coset spaces from split tori

Target `ReductiveGroupsPartII:RG2.4/split-torus-coset-infinitude`. Theorem; suggested declaration `BruhatTits.split_torus_coset_infinitude`.

If G over Q_p contains a positive-dimensional split torus S and P⊂G(Q_p) is compact open, then λ↦λ(p)P injects X_*(S) into G(Q_p)/P and this quotient is infinite. Indeed S(Q_p)∩P is compact, so its torus valuation is zero; distinct uniformizer cocharacters cannot differ by an element of P. The compactness hypothesis cannot be replaced by openness.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; If G over Q_p contains a positive-dimensional split torus S and P⊂G(Q_p) is compact open, then λ↦λ(p)P injects X_*(S) into G(Q_p)/P and this quotient is infinite.

**Prerequisites.** [The valuation homomorphism of the minimal Levi](#RG2-1-torus-valuation-map) (`ReductiveGroupsPartII:RG2.1/torus-valuation-map`); [Finite coset count inside a compact double coset](#RG2-4-compact-double-coset-finiteness) (`ReductiveGroupsPartII:RG2.4/compact-double-coset-finiteness`).

**Construction or proof.**

1. The valuation image of a compact subgroup of a split torus is a finite subgroup of ℤ^d, hence zero.
2. Equality of P-cosets would put (λ−λ′)(p) in that compact torus subgroup.
3. Its valuation is λ−λ′, proving injectivity.

**Acceptance.**

- Taking P=G(Q_p) shows openness alone does not suffice.

**Sources.**

- [Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2208.07195): Theorem 4.11 proof, equation (4.13), arXiv v3 p. 26. The valuation image of a compact subgroup of a split torus is a finite subgroup of ℤ^d, hence zero. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-hyperspecial-generation"></a>

### Integral generation of a split reductive group

Target `ReductiveGroupsPartII:RG2.4/hyperspecial-generation`. Theorem; suggested declaration `BruhatTits.hyperspecial_generation`.

For a split connected reductive O-group with chosen split torus and root pinning over a henselian DVR, its O-points are generated by T(O) and all integral root subgroups U_α(O). Equivalently use the rank-one Levi integral points together with T(O). For semisimple simply connected groups the root generators suffice in the standard local setup. Rank zero requires the torus factor, so rank-one Levis alone cannot generate every reductive group.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For a split connected reductive O-group with chosen split torus and root pinning over a henselian DVR, its O-points are generated by T(O) and all integral root subgroups U_α(O).

**Prerequisites.** [Iwahori and positive-depth root factorizations](#RG2-4-iwahori-factorization) (`ReductiveGroupsPartII:RG2.4/iwahori-factorization`); [Hyperspecial points and reductive models](#RG2-3-hyperspecial-vertices) (`ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Reduce to the split special-fibre Bruhat decomposition.
2. Integral root-group lifts generate the Iwahori and rank-one Weyl representatives.
3. The hyperspecial finite Bruhat decomposition adds all residue Weyl cells.

**Acceptance.**

- For G_m the statement reduces to generation by T(O).

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §4.6.3–4.6.7, printed pp. 125–128; §4.6.15, p. 131. Reduce to the split special-fibre Bruhat decomposition. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-length-and-bruhat-order"></a>

### Length and Bruhat order

Target `ReductiveGroupsPartII:RG2.4/length-and-bruhat-order`. Definition; suggested declaration `BruhatTits.IwahoriWeylGroup.bruhatLE`.

Write w=vτ with v∈W_a, τ∈Ω. Define ℓ(w)=ℓ_Coxeter(v) and vτ≤v′τ′ iff τ=τ′ and v≤_Bruhat v′. Thus length zero is precisely Ω, including apartment-action torsion. Geometrically length counts the separating effective affine hyperplanes, once each, rather than residue-field root-group dimensions. For E distinguish its Coxeter length from the restricted length ℓ̆ on W̃_L; E-length additivity implies ℓ̆-additivity.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; Write w=vτ with v∈W_a, τ∈Ω.

**Prerequisites.** [Iwahori–Weyl exact sequences and alcove components](#RG2-4-iwahori-weyl-exact-sequences) (`ReductiveGroupsPartII:RG2.4/iwahori-weyl-exact-sequences`); `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free`.

**Uses.**

- GLX (2.3): Admissibility is defined by this order..
- He21 §2.2: Dominant normal forms and reduction use the length..

**API.**

- `BruhatTits.IwahoriWeylGroup.length` (data): The componentwise Coxeter length.
- `BruhatTits.IwahoriWeylGroup.bruhatLE` (relation): The componentwise subword order.
- `BruhatTits.IwahoriWeylGroup.length_zero_iff` (characterisation): Length zero iff w∈Ω.
- `BruhatTits.IwahoriWeylGroup.bruhatLE_component` (relation): Comparable elements have equal Ω projection.
- `BruhatTits.IwahoriWeylGroup.length_smul_simple` (relation): Left multiplication by a simple reflection changes length by ±1.
- `BruhatTits.IwahoriWeylGroup.unramified_length_add` (compatibility): E-length additivity implies L-length additivity.

**Unit tests.**

- `BruhatTits.IwahoriWeylGroup.a1_translation` (computation): The SL_2 translation diag(ϖ^n,ϖ^−n) has length 2|n|.
- `BruhatTits.IwahoriWeylGroup.torus_length` (degenerate): Every element for a torus has length zero.
- `BruhatTits.IwahoriWeylGroup.coxeter_compat` (compatibility): Restriction to W_a agrees with imported Coxeter length and order.
- `BruhatTits.IwahoriWeylGroup.different_components` (non-example): In GL_1 the elements 0 and 1 have length zero but are incomparable.

**Construction or proof.**

1. Import exchange, reduced expressions and subword Bruhat order for W_a.
2. Extend componentwise through Ω, whose conjugation preserves the simple generators.
3. Compare separating-root sets over E and L for additivity.

**Acceptance.**

- Bruhat comparison across distinct Ω-components is false even at length zero.

**Sources.**

- [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635): Proposition 1.11 and Sublemma 1.12, pp. 5–6; He18 §1.1, p. 4. Import exchange, reduced expressions and subword Bruhat order for W_a. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-affine-tits-system"></a>

### Affine Tits system of the Kottwitz kernel

Target `ReductiveGroupsPartII:RG2.4/affine-tits-system`. Theorem; suggested declaration `BruhatTits.affine_tits_system`.

Let G₁ be the subgroup generated by parahorics and N₁=N(K)∩G₁. Then G₁=ker κ_G with the rational Kottwitz target appropriate to K. For a base Iwahori I, (G₁,I,N₁,S_aff) is a double Tits system with Weyl group W_a. Construct the corresponding TauCeti.TitsSystem and apply its Bruhat covering theorem. Normalizer lifts of Ω normalize I and extend the decomposition to G(K); do not claim a splitting of the group extension G(K) itself from the splitting of W̃.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; Let G₁ be the subgroup generated by parahorics and N₁=N(K)∩G₁.

**Prerequisites.** [Parahorics as fixers in the Kottwitz kernel](#RG2-3-parahoric-kottwitz-characterization) (`ReductiveGroupsPartII:RG2.3/parahoric-kottwitz-characterization`); [The affine Weyl group](#RG2-1-affine-weyl-group) (`ReductiveGroupsPartII:RG2.1/affine-weyl-group`); [Iwahori–Weyl exact sequences and alcove components](#RG2-4-iwahori-weyl-exact-sequences) (`ReductiveGroupsPartII:RG2.4/iwahori-weyl-exact-sequences`); `tauceti:TauCeti.TitsSystem`; `tauceti:TauCeti.TitsSystem.bruhatCells_eq_univ`.

**Construction or proof.**

1. Valued rank-one decompositions verify the imported BN axioms and N₁∩I=M₁.
2. Identify the subgroup generated by parahorics with the Kottwitz kernel.
3. Use Tau Ceti Bruhat covering on G₁ and transport by Ω lifts.

**Acceptance.**

- No new abstract BN-pair or Bruhat covering theorem is planned here.

**Sources.**

- [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635): (1.2), Lemmas 1.2–1.3 and Theorem 1.4, pp. 1–2. Valued rank-one decompositions verify the imported BN axioms and N₁∩I=M₁. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf): §5.2.10–5.2.12, printed pp. 165–167. Valued rank-one decompositions verify the imported BN axioms and N₁∩I=M₁. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Affine Tits system**.

<a id="RG2-4-dominant-coinvariant-cocharacters"></a>

### Dominance in inertia-coinvariant cocharacters

Target `ReductiveGroupsPartII:RG2.4/dominant-coinvariant-cocharacters`. Definition; suggested declaration `BruhatTits.Dominance.IsDominant`.

Over L let Λ=X_*(T)_I, retaining torsion. Choose a special vertex and positive échelonnage roots Σ⁺. A class is dominant when its image in Λ⊗ℝ pairs nonnegatively with every simple root. Every finite Weyl orbit has a unique dominant representative in the full lattice with the induced Weyl action. Define integral dominance λ≤_ℤλ′ by λ′−λ in the nonnegative integral coroot monoid, and rational dominance by the nonnegative rational coroot cone; these are distinct. In a quasi-split σ-stable splitting define λ♦ as the finite σ-orbit average in Λ⊗ℚ.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; Over L let Λ=X_*(T)_I, retaining torsion.

**Prerequisites.** [Iwahori–Weyl exact sequences and alcove components](#RG2-4-iwahori-weyl-exact-sequences) (`ReductiveGroupsPartII:RG2.4/iwahori-weyl-exact-sequences`); [The échelonnage root system](#RG2-1-echelonnage-root-system) (`ReductiveGroupsPartII:RG2.1/echelonnage-root-system`); [Minuscule coweights and the dominance order](#RG2-1-minuscule-coweight) (`ReductiveGroupsPartII:RG2.1/minuscule-coweight`).

**Uses.**

- Zhu §1.3: Cartan strata carry dominant coweights..
- He21 §2.2: λ_w and λ♦ use these conventions..

**API.**

- `BruhatTits.Dominance.IsDominant` (characterisation): Simple échelonnage-root pairings are nonnegative.
- `BruhatTits.Dominance.dominantRepresentative` (data): The dominant element of a finite Weyl orbit.
- `BruhatTits.Dominance.integralLE` (relation): Difference lies in the nonnegative integral coroot monoid.
- `BruhatTits.Dominance.rationalLE` (relation): Difference lies in the nonnegative rational coroot cone.
- `BruhatTits.Dominance.sigmaAverage` (data): The finite orbit average in Λ⊗ℚ.
- `BruhatTits.Dominance.integralLE_implies_rationalLE` (relation): Integral dominance implies rational dominance.

**Unit tests.**

- `BruhatTits.Dominance.gl` (computation): For GL_n dominant tuples satisfy λ₁≥⋯≥λ_n in the usual Borel convention.
- `BruhatTits.Dominance.torus` (degenerate): For a torus every class is dominant and integral dominance is equality.
- `BruhatTits.Dominance.rootBase_compat` (compatibility): The inequalities use the chosen root base, and flip under the opposite base.
- `BruhatTits.Dominance.integral_vs_rational` (non-example): For PGL_2 the positive fundamental coweight is rationally above zero but is not an integral nonnegative multiple of the coroot.

**Construction or proof.**

1. Import the Weyl-chamber fundamental domain for the échelonnage datum.
2. Keep the integral lattice and its torsion, using tensoring only for inequalities.
3. Define the coroot monoid and rational cone separately and form the σ average when its linear action is available.

**Acceptance.**

- Two lattice points with the same rational image need not be equal.

**Sources.**

- [Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2001.03325): §2.1–2.2, pp. 4–6. Import the Weyl-chamber fundamental domain for the échelonnage datum. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): §2.1.1–2.1.5, pp. 5–6. Import the Weyl-chamber fundamental domain for the échelonnage datum. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-levi-kottwitz-kernel"></a>

### A proper Levi has a nontrivial Kottwitz kernel

Target `ReductiveGroupsPartII:RG2.4/levi-kottwitz-kernel`. Theorem; suggested declaration `BruhatTits.levi_kottwitz_kernel`.

For adjoint Q_p-simple G and a proper rational parabolic with Levi M, the map π₁(M)_I^σ→π₁(G)_I^σ is not injective. The split centre of M contributes a nonzero fixed cocharacter direction that disappears in the adjoint ambient group. Properness and rationality of the parabolic are essential; the result does not concern arbitrary anisotropic twisted Levis.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For adjoint Q_p-simple G and a proper rational parabolic with Levi M, the map π₁(M)_I^σ→π₁(G)_I^σ is not injective.

**Prerequisites.** [The algebraic fundamental group](#RG2-1-algebraic-fundamental-group) (`ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`); [Iwahori–Weyl exact sequences and alcove components](#RG2-4-iwahori-weyl-exact-sequences) (`ReductiveGroupsPartII:RG2.4/iwahori-weyl-exact-sequences`).

**Construction or proof.**

1. Use the centre of a rational proper Levi to obtain a nonzero split cocharacter.
2. Its image in ambient π₁ is torsion; multiply it to kill that image.
3. Its Levi class remains nonzero in fixed inertia coinvariants.

**Acceptance.**

- For PGL_2 and its split torus Levi, ℤ→ℤ/2 has nonzero kernel.

**Sources.**

- [Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2208.07195): Lemma 4.12 and proof, arXiv v3 pp. 26–27. Use the centre of a rational proper Levi to obtain a nonzero split cocharacter. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-iwahori-bruhat-decomposition"></a>

### Iwahori–Bruhat decomposition

Target `ReductiveGroupsPartII:RG2.4/iwahori-bruhat-decomposition`. Theorem; suggested declaration `BruhatTits.iwahori_bruhat_decomposition`.

The map W̃_K→I\G(K)/I sending w to IẇI is well-defined and bijective. Thus G(K) is the disjoint union of Iwahori double cosets indexed by W̃_K. Over a local field each such cell is compact open. Over E it agrees with the σ-fixed decomposition over L through connected-model Lang lifting. Full alcove stabilizers have a different quotient of labels when they exceed I.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; The map W̃_K→I\G(K)/I sending w to IẇI is well-defined and bijective.

**Prerequisites.** [Affine Tits system of the Kottwitz kernel](#RG2-4-affine-tits-system) (`ReductiveGroupsPartII:RG2.4/affine-tits-system`); [Iwahori–Weyl exact sequences and alcove components](#RG2-4-iwahori-weyl-exact-sequences) (`ReductiveGroupsPartII:RG2.4/iwahori-weyl-exact-sequences`); [Parahoric, Iwahori and pro-p Iwahori subgroups](#RG2-3-parahoric-subgroup) (`ReductiveGroupsPartII:RG2.3/parahoric-subgroup`); [Lang's theorem for inverse limits and fixed cosets](#RG2-3-lang-for-pro-algebraic-groups) (`ReductiveGroupsPartII:RG2.3/lang-for-pro-algebraic-groups`).

**Construction or proof.**

1. Apply the imported Bruhat theorem in the affine Tits system.
2. Use the Ω-component quotient to separate the remaining cells.
3. Compare representatives using N∩I=M₁; use Lang for rational descent.

**Acceptance.**

- Normalizers of I are not silently substituted for I.

**Sources.**

- [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635): Theorem 1.4, p. 2. Apply the imported Bruhat theorem in the affine Tits system. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Proposition 8 and Remark 9, pp. 4–6. Apply the imported Bruhat theorem in the affine Tits system. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Iwahori–Bruhat decomposition**.

<a id="RG2-4-translation-length-formula"></a>

### Translation length and the chamber convention

Target `ReductiveGroupsPartII:RG2.4/translation-length-formula`. Theorem; suggested declaration `BruhatTits.translation_length_formula`.

For λ∈Λ, ℓ(t^λ)=Σ_(α∈Σ⁺)|⟨α,λ⟩|=⟨2ρ_Σ,λ_dom⟩. Torsion translations have length zero. With He21’s convention that the dominant chamber is opposite the chamber containing the base alcove, ℓ(xt^λ)=ℓ(x)+ℓ(t^λ) for dominant λ and x∈W₀. With the usual dominant base alcove this additivity has the opposite-side/sign version. In He’s quasi-split setup η_σ(xt^λ)=x. The Newton interpretation of λ♦ is imported by BunGAndNewtonStrata, not constructed here.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For λ∈Λ, ℓ(t^λ)=Σ_(α∈Σ⁺)|⟨α,λ⟩|=⟨2ρ_Σ,λ_dom⟩.

**Prerequisites.** [Length and Bruhat order](#RG2-4-length-and-bruhat-order) (`ReductiveGroupsPartII:RG2.4/length-and-bruhat-order`); [Dominance in inertia-coinvariant cocharacters](#RG2-4-dominant-coinvariant-cocharacters) (`ReductiveGroupsPartII:RG2.4/dominant-coinvariant-cocharacters`).

**Construction or proof.**

1. Count crossed affine hyperplanes for each positive échelonnage root.
2. Use dominance to remove absolute values.
3. Check the base-alcove chamber orientation before applying the finite-Weyl length identity.

**Acceptance.**

- The SL_2 translation by n coroots has length 2|n|.

**Sources.**

- [Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2001.03325): §2.1, p. 5 and proof of Theorem 4.2, §4.3, p. 8. Count crossed affine hyperplanes for each positive échelonnage root. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945): §2.1.5, p. 6. Count crossed affine hyperplanes for each positive échelonnage root. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-admissible-set"></a>

### μ-admissible sets

Target `ReductiveGroupsPartII:RG2.4/admissible-set`. Definition; suggested declaration `BruhatTits.AdmissibleSet.admissible`.

For a geometric cocharacter conjugacy class {μ} with image μ̄∈Λ, define Adm({μ})={w:∃x∈W₀,w≤t^(xμ̄)}. Its component is κ(μ), it is finite and Bruhat downward closed. For a standard parahoric Weyl subgroup W_F define Adm^F=W_F Adm W_F and its image in W_F\W̃/W_F; distinguish the saturated subset from this quotient set. Replacing μ by a Weyl conjugate changes neither set.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For a geometric cocharacter conjugacy class {μ} with image μ̄∈Λ, define Adm({μ})={w:∃x∈W₀,w≤t^(xμ̄)}.

**Prerequisites.** [Length and Bruhat order](#RG2-4-length-and-bruhat-order) (`ReductiveGroupsPartII:RG2.4/length-and-bruhat-order`); [Dominance in inertia-coinvariant cocharacters](#RG2-4-dominant-coinvariant-cocharacters) (`ReductiveGroupsPartII:RG2.4/dominant-coinvariant-cocharacters`).

**Uses.**

- GLX §2.1: Parahoric affine Deligne–Lusztig unions use the quotient admissible set..
- KZ §2.3: The μ-ordinary lifting argument uses admissible translations..

**API.**

- `BruhatTits.AdmissibleSet.admissible` (constructor): The union of translation Bruhat intervals.
- `BruhatTits.AdmissibleSet.mem_iff` (simp): Membership iff bounded by some Weyl conjugate translation.
- `BruhatTits.AdmissibleSet.finite` (other): The set is finite.
- `BruhatTits.AdmissibleSet.downwardClosed` (relation): If v≤w and w∈Adm then v∈Adm.
- `BruhatTits.AdmissibleSet.weyl_invariant_mu` (functoriality): Weyl-conjugate μ give equal sets.
- `BruhatTits.AdmissibleSet.parahoricSaturation` (constructor): W_F Adm W_F, with its double-quotient image.

**Unit tests.**

- `BruhatTits.AdmissibleSet.gl2_minuscule` (computation): For GL_2 and μ=(1,0), Adm is the union of the two length-one translation intervals with their common length-zero component element.
- `BruhatTits.AdmissibleSet.zero` (degenerate): Adm(0)={1}.
- `BruhatTits.AdmissibleSet.bruhat_compat` (compatibility): Membership uses exactly the RG2.4 componentwise Bruhat relation.
- `BruhatTits.AdmissibleSet.component_not_ignored` (non-example): For GL_1 and μ=1, Adm={t¹} and does not contain 1.

**Construction or proof.**

1. Form the finite union of principal Bruhat intervals below the Weyl translations.
2. Coxeter subword intervals are finite and downward closed in their Ω component.
3. Saturate by the finite parahoric Weyl subgroup and project to its double quotient.

**Acceptance.**

- For μ=0 the Iwahori admissible set is {1}.

**Sources.**

- [Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2208.07195): §2.1, equation (2.3), pp. 7–8. Form the finite union of principal Bruhat intervals below the Weyl translations. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **μ-admissible set**.

<a id="RG2-4-kottwitz-quotient"></a>

### Kottwitz classes of Iwahori cells

Target `ReductiveGroupsPartII:RG2.4/kottwitz-quotient`. Theorem; suggested declaration `BruhatTits.kottwitz_quotient`.

The rational κ_G identifies G(K)/G₁ with Ω and is constant on IẇI, equal to the Ω projection of w. It is surjective and functorial for group automorphisms preserving the setup. For a compatible automorphism θ, κ(hgθ(h)⁻¹)=κ(g)+(1−θ)κ(h); therefore only its image in Ω_θ is invariant under θ-twisted conjugation. The target here is group-level Kottwitz data; Newton and B(G) classification remain with BunGAndNewtonStrata.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; The rational κ_G identifies G(K)/G₁ with Ω and is constant on IẇI, equal to the Ω projection of w.

**Prerequisites.** [Iwahori–Bruhat decomposition](#RG2-4-iwahori-bruhat-decomposition) (`ReductiveGroupsPartII:RG2.4/iwahori-bruhat-decomposition`); [The Kottwitz homomorphism](#RG2-1-kottwitz-homomorphism) (`ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism`).

**Construction or proof.**

1. All parahorics lie in ker κ and the normalizer quotient gives Ω.
2. Compute on the two I factors of a Bruhat cell.
3. Apply the homomorphism law to twisted conjugation.

**Acceptance.**

- Twisted-conjugacy invariance is asserted in coinvariants, not in Ω.

**Sources.**

- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §1.1 and §2.1, pp. 4–5, 7. All parahorics lie in ker κ and the normalizer quotient gives Ω. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635): Lemmas 1.2–1.3, p. 2. All parahorics lie in ker κ and the normalizer quotient gives Ω. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-parahoric-double-cosets"></a>

### Parahoric double-coset classification

Target `ReductiveGroupsPartII:RG2.4/parahoric-double-cosets`. Theorem; suggested declaration `BruhatTits.parahoric_double_cosets`.

For facets F,F′ in the closure of the chosen alcove and finite standard parabolic Weyl subgroups W_F,W_F′⊂W_a, normalizer representatives give P_F\G(K)/P_F′≃W_F\W̃_K/W_F′. Each Weyl double coset has a unique element minimal for the componentwise Coxeter length. The rational E comparison uses σ-stable facets and the induced fixed Coxeter datum. This classification is for connected parahorics, not arbitrary full setwise stabilizers.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For facets F,F′ in the closure of the chosen alcove and finite standard parabolic Weyl subgroups W_F,W_F′⊂W_a, normalizer representatives give P_F\G(K)/P_F′≃W_F\W̃_K/W_F′.

**Prerequisites.** [Iwahori–Bruhat decomposition](#RG2-4-iwahori-bruhat-decomposition) (`ReductiveGroupsPartII:RG2.4/iwahori-bruhat-decomposition`); [Length and Bruhat order](#RG2-4-length-and-bruhat-order) (`ReductiveGroupsPartII:RG2.4/length-and-bruhat-order`); [Reductive special-fibre quotients](#RG2-3-reductive-quotient-of-special-fibre) (`ReductiveGroupsPartII:RG2.3/reductive-quotient-of-special-fibre`).

**Construction or proof.**

1. Identify P_F/I with the finite residual Weyl Bruhat decomposition.
2. Group the Iwahori cells by left and right finite Weyl action.
3. Import uniqueness of minimal double-coset representatives and descend via σ.

**Acceptance.**

- For F=F′=C recover W̃ itself.

**Sources.**

- [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635): Theorem 1.4, p. 2. Identify P_F/I with the finite residual Weyl Bruhat decomposition. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Proposition 8 and Remark 9, pp. 4–6. Identify P_F/I with the finite residual Weyl Bruhat decomposition. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-simple-cell-multiplication"></a>

### Multiplication by simple Iwahori cells

Target `ReductiveGroupsPartII:RG2.4/simple-cell-multiplication`. Theorem; suggested declaration `BruhatTits.simple_cell_multiplication`.

For s a simple affine reflection and w∈W̃, (IṡI)(IẇI)=IṡẇI if ℓ(sw)=ℓ(w)+1, and equals the union IṡẇI∪IẇI if ℓ(sw)=ℓ(w)−1; likewise on the right. Length-additive products give a bijection from the iterated contracted product of cells modulo I onto the product cell modulo I. For normalized integer alcove-depth subgroups and length-additive w,w′, multiplication I_n gI_n×_{I_n}I_n g′I_n/I_n→I_n gg′I_n/I_n is bijective (n≥1). This requires a separate positive-depth root-coordinate argument.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For s a simple affine reflection and w∈W̃, (IṡI)(IẇI)=IṡẇI if ℓ(sw)=ℓ(w)+1, and equals the union IṡẇI∪IẇI if ℓ(sw)=ℓ(w)−1; likewise on the right.

**Prerequisites.** [Iwahori–Bruhat decomposition](#RG2-4-iwahori-bruhat-decomposition) (`ReductiveGroupsPartII:RG2.4/iwahori-bruhat-decomposition`); [Length and Bruhat order](#RG2-4-length-and-bruhat-order) (`ReductiveGroupsPartII:RG2.4/length-and-bruhat-order`); [Positive-depth subgroups are pro-p and cofinal](#RG2-3-positive-depth-filtration-basis) (`ReductiveGroupsPartII:RG2.3/positive-depth-filtration-basis`); [Frobenius-fixed coset lifting at positive level](#RG2-3-frobenius-fixed-coset-lifting) (`ReductiveGroupsPartII:RG2.3/frobenius-fixed-coset-lifting`).

**Construction or proof.**

1. Use the affine Tits rank-one relation and exchange axiom.
2. Apply the root-group coordinate chart to prove bijectivity in the length-additive case.
3. For the positive-depth bijection, prove the simple-cell affine-root quotient comparison after integer shifts, descend its coordinates by connected-model Lang lifting, and combine the inversion-set disjoint unions along a reduced expression. Length additivity over E implies additivity over L, so the source and target have the same finite size; the image contains the product cell.

**Acceptance.**

- Rank-one residue parameters enter cardinalities later, not this set identity.

**Sources.**

- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §2.1, pp. 7–8; Proposition 4.3 and proof, Lemmas 4.5–4.6, pp. 12–14 (arXiv v3). The level-zero Tits multiplication and the positive-depth Proposition 4.3 use different arguments; root coordinate counts and Lang descent supply the latter.

<a id="RG2-4-unramified-combinatorial-comparison"></a>

### Comparison of échelonnage data with an unramified group

Target `ReductiveGroupsPartII:RG2.4/unramified-combinatorial-comparison`. Theorem; suggested declaration `BruhatTits.unramified_combinatorial_comparison`.

For the adjoint root-data reduction used by van Hoften Appendix A, construct a quasi-split unramified comparison group with identified échelonnage based datum, Frobenius action and adjoint coweight lattice. These identifications preserve relative Levi subsets, dominance, affine Weyl length and the transported cocharacter/Kottwitz classes. Separately, for σ-stable lattices Q∨⊂Λ⊂P∨, compare the pairings and Coxeter combinatorics via their common rational space. This transports root combinatorics, not buildings or rational groups, and does not assert equality of arbitrary torsion Kottwitz targets.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For the adjoint root-data reduction used by van Hoften Appendix A, construct a quasi-split unramified comparison group with identified échelonnage based datum, Frobenius action and adjoint coweight lattice.

**Prerequisites.** [Dominance in inertia-coinvariant cocharacters](#RG2-4-dominant-coinvariant-cocharacters) (`ReductiveGroupsPartII:RG2.4/dominant-coinvariant-cocharacters`); [Translation length and the chamber convention](#RG2-4-translation-length-formula) (`ReductiveGroupsPartII:RG2.4/translation-length-formula`); [The échelonnage root system](#RG2-1-echelonnage-root-system) (`ReductiveGroupsPartII:RG2.1/echelonnage-root-system`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Build the split adjoint group of the échelonnage datum and descend through the finite based automorphism.
2. Identify the lattices and σ actions as in the adjoint reduction.
3. Check each transported inequality and length against the unchanged coroot arrangement.

**Acceptance.**

- The comparison cannot manufacture a wild or ramified group isomorphism.

**Sources.**

- [Pol van Hoften (Appendix A by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*](https://arxiv.org/abs/2010.10496): Appendix A.3.2, pp. 71–73. Build the split adjoint group of the échelonnage datum and descend through the finite based automorphism. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2001.03325): §§5.2–5.4 and 6.3, pp. 10–15. Build the split adjoint group of the échelonnage datum and descend through the finite based automorphism. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-kottwitz-rational-surjectivity"></a>

### Rational surjectivity and the simply connected image

Target `ReductiveGroupsPartII:RG2.4/kottwitz-rational-surjectivity`. Theorem; suggested declaration `BruhatTits.kottwitz_rational_surjectivity`.

For G connected reductive over E, κ_G:G(E)→(π₁(G)_I)^σ is surjective. For a parahoric P, the image of G_sc(E) times P is its kernel, giving G(E)/(image G_sc(E)·P)≃(π₁(G)_I)^σ. The unramified invariant-cocharacter and adjoint-coset refinements are separate targets below.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For G connected reductive over E, κ_G:G(E)→(π₁(G)_I)^σ is surjective.

**Prerequisites.** [Kottwitz classes of Iwahori cells](#RG2-4-kottwitz-quotient) (`ReductiveGroupsPartII:RG2.4/kottwitz-quotient`); [Iwahori–Weyl exact sequences and alcove components](#RG2-4-iwahori-weyl-exact-sequences) (`ReductiveGroupsPartII:RG2.4/iwahori-weyl-exact-sequences`); [Hyperspecial points and reductive models](#RG2-3-hyperspecial-vertices) (`ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`).

**Construction or proof.**

1. Represent a Kottwitz class by a rational normalizer lift.
2. The affine Weyl subgroup comes from the simply connected cover; Bruhat covering identifies the kernel.

**Acceptance.**

- Keep the additional unramified hypotheses in the Kisin adapter.

**Sources.**

- [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635): Lemma 1.3 and Remark 1.5, pp. 2–3. Identifies the Kottwitz quotient and the affine Weyl kernel through the simply connected image.
- [Pol van Hoften (Appendix A by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*](https://arxiv.org/abs/2010.10496): Lemma 3.4.2, pp. 23–24. States rational surjectivity with the Frobenius-fixed inertia-coinvariant target.

<a id="RG2-4-double-coset-cardinalities"></a>

### Root-parameter counts of Iwahori cells

Target `ReductiveGroupsPartII:RG2.4/double-coset-cardinalities`. Theorem; suggested declaration `BruhatTits.double_coset_cardinalities`.

Over E with finite residue field of size q, set q_s=[I:I∩ṡIṡ⁻¹] for each simple reflection. For a reduced expression w=s₁⋯s_dτ, |IẇI/I|=∏q_sᵢ, independent of expression, and Ω contributes 1. In the split case q_s=q and this is q^ℓ(w). In the He18 alcove-depth setup, with the unramified comparison giving q_s=q^ℓ̆(s), |I_n gI_n/I_n|=q^ℓ̆(w) for g∈IẇI and n≥1. Its proof requires connected-model Lang lifting; pro-p alone is insufficient. Do not use E Coxeter length in place of ℓ̆ or assume equal parameters for all nonsplit groups.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; Over E with finite residue field of size q, set q_s=[I:I∩ṡIṡ⁻¹] for each simple reflection.

**Prerequisites.** [Multiplication by simple Iwahori cells](#RG2-4-simple-cell-multiplication) (`ReductiveGroupsPartII:RG2.4/simple-cell-multiplication`); [Frobenius-fixed coset lifting at positive level](#RG2-3-frobenius-fixed-coset-lifting) (`ReductiveGroupsPartII:RG2.3/frobenius-fixed-coset-lifting`); [The Moy–Prasad filtration](#RG2-3-moy-prasad-filtration) (`ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`).

**Construction or proof.**

1. Compute the simple-cell root quotient by integral root charts, retaining the actual residue dimensions.
2. Use disjoint unions of inversion roots and their normalized shifted root quotients to prove the positive-depth reduced-word contracted-product bijection; it does not follow merely from the level-zero BN-pair. The rational simple quotient is a Frobenius form of an affine space of dimension ℓ̆(s), giving q^ℓ̆(s). Multiply the simple counts.
3. At positive depth shift root charts; descend fixed cosets by the repaired Lang argument of E40.

**Acceptance.**

- In unramified U_3 the rational simple parameters are q and q³, so q^ℓ_E is wrong.

**Sources.**

- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): Lemmas 4.5–4.6, pp. 13–14. Compute the simple-cell root quotient by integral root charts, retaining the actual residue dimensions. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635): Proposition 1.11 and Sublemma 1.12, pp. 5–6. Compute the simple-cell root quotient by integral root charts, retaining the actual residue dimensions. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-dominant-normal-form"></a>

### Dominant Weyl double-coset normal form

Target `ReductiveGroupsPartII:RG2.4/dominant-normal-form`. Theorem; suggested declaration `BruhatTits.dominant_normal_form`.

In He21’s opposite-base-alcove dominance convention, every w∈W̃ has a unique expression w=xt^λy with λ dominant, x,y∈W₀ and t^λy the minimal representative of its left W₀-coset. Then ℓ(w)=ℓ(x)+ℓ(t^λ)−ℓ(y), and η_σ(w)=σ⁻¹(y)x in the quasi-split σ-stable setup. The minimal-representative condition resolves singular λ stabilizers and is necessary for uniqueness.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; In He21’s opposite-base-alcove dominance convention, every w∈W̃ has a unique expression w=xt^λy with λ dominant, x,y∈W₀ and t^λy the minimal representative of its left W₀-coset.

**Prerequisites.** [Translation length and the chamber convention](#RG2-4-translation-length-formula) (`ReductiveGroupsPartII:RG2.4/translation-length-formula`); [Parahoric double-coset classification](#RG2-4-parahoric-double-cosets) (`ReductiveGroupsPartII:RG2.4/parahoric-double-cosets`).

**Construction or proof.**

1. Select λ by the finite Weyl double-coset orbit.
2. Use the unique minimal representative in W₀\W̃ and its parabolic stabilizer to select y.
3. Extract x and apply Coxeter length additivity.

**Acceptance.**

- Without the minimal condition λ=0 gives many factorizations 1=x·1·x⁻¹.

**Sources.**

- [Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2001.03325): §2.2, pp. 5–6. Select λ by the finite Weyl double-coset orbit. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-cartan-decomposition"></a>

### Cartan decomposition at special parahorics

Target `ReductiveGroupsPartII:RG2.4/cartan-decomposition`. Theorem; suggested declaration `BruhatTits.cartan_decomposition`.

Let x be a special reduced vertex and P_x its connected parahoric. Then G(K)=P_x M(K)P_x and P_x\G(K)/P_x identifies with W₀\W̃_K/W₀, hence with finite Weyl orbits in M(K)/M₁ using the special-vertex splitting. Over L these are dominant classes in X_*(T)_I. For split G and hyperspecial P=G(O), G(K)=⊔_(λ∈X_*(T)^+)Pλ(ϖ)P. The full Cartan set is generally infinite; finite torsion can remain for nonsplit connected parahorics.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; Let x be a special reduced vertex and P_x its connected parahoric.

**Prerequisites.** [Parahoric double-coset classification](#RG2-4-parahoric-double-cosets) (`ReductiveGroupsPartII:RG2.4/parahoric-double-cosets`); [Dominance in inertia-coinvariant cocharacters](#RG2-4-dominant-coinvariant-cocharacters) (`ReductiveGroupsPartII:RG2.4/dominant-coinvariant-cocharacters`).

**Construction or proof.**

1. Specialness identifies the facet Weyl subgroup with W₀.
2. Apply the parahoric double-coset theorem.
3. In the split case identify translations with cocharacters evaluated on ϖ.

**Acceptance.**

- For G_m the Cartan set is ℤ.

**Sources.**

- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): Proposition 13, p. 8, with Proposition 8. Specialness identifies the facet Weyl subgroup with W₀. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §3.3.3, pp. 51–52. Specialness identifies the facet Weyl subgroup with W₀. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*](https://arxiv.org/abs/1407.8519): Proposition 1.23, pp. 19–20. Specialness identifies the facet Weyl subgroup with W₀. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Cartan decomposition**.

<a id="RG2-4-iwasawa-decomposition"></a>

### Iwasawa decomposition

Target `ReductiveGroupsPartII:RG2.4/iwasawa-decomposition`. Theorem; suggested declaration `BruhatTits.iwasawa_decomposition`.

For a special-vertex parahoric P_x and a minimal K-parabolic Q=MU, G(K)=P_x Q(K)=Q(K)P_x. Thus every element is a product of a compact factor, minimal Levi and unipotent factor over a local field. In the split hyperspecial case the one-sided quotient by U is indexed by the appropriate translation/finite-Weyl cosets. Use the full bounded special fixer if employing Tits’s quotient N/T_b instead of the connected-parahoric quotient, and state which convention is used.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For a special-vertex parahoric P_x and a minimal K-parabolic Q=MU, G(K)=P_x Q(K)=Q(K)P_x.

**Prerequisites.** [Parahoric double-coset classification](#RG2-4-parahoric-double-cosets) (`ReductiveGroupsPartII:RG2.4/parahoric-double-cosets`); [Parahoric, Iwahori and pro-p Iwahori subgroups](#RG2-3-parahoric-subgroup) (`ReductiveGroupsPartII:RG2.3/parahoric-subgroup`); [The valuation homomorphism of the minimal Levi](#RG2-1-torus-valuation-map) (`ReductiveGroupsPartII:RG2.1/torus-valuation-map`).

**Construction or proof.**

1. Move apartments into the base apartment by the special fixer.
2. Use the minimal-parabolic root-group decomposition and its normalizer finite-Weyl representatives.
3. Reverse the product using inversion.

**Acceptance.**

- For GL_n this is the integral QR/Hermite decomposition against the upper-triangular Borel.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): 7.3.1, pp. 163–166. Move apartments into the base apartment by the special fixer. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §3.3.2, pp. 51–52. Move apartments into the base apartment by the special fixer. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [W. Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf): §1.4, pp. 12–13. Move apartments into the base apartment by the special fixer. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Iwasawa decomposition**.

<a id="RG2-4-simple-cell-adjacent-depth"></a>

### Adjacent-depth containment for a simple cell

Target `ReductiveGroupsPartII:RG2.4/simple-cell-adjacent-depth`. Theorem; suggested declaration `BruhatTits.simple_cell_adjacent_depth`.

Use He18 §4.2 normalized integer alcove-depth subgroups I_n (I₀=I), with their affine root shifts α↦α+n. If n≥1, s is an affine simple reflection, and g₁∈IṡI, then g₁⁻¹I_n g₁⊂I_{n−1} and I_n g₁ I_n⊂g₁I_{n−1}. For a character ω trivial on I_{n−1}, ω is constant with value ω(g₁) on this double coset. This assertion is not made for arbitrary real-depth Moy–Prasad groups.

**Hypotheses.** The field, group and other hypotheses in the statement apply throughout.

**Prerequisites.** [Multiplication by simple Iwahori cells](#RG2-4-simple-cell-multiplication) (`ReductiveGroupsPartII:RG2.4/simple-cell-multiplication`); [Positive-depth subgroups are pro-p and cofinal](#RG2-3-positive-depth-filtration-basis) (`ReductiveGroupsPartII:RG2.3/positive-depth-filtration-basis`); [The Moy–Prasad filtration](#RG2-3-moy-prasad-filtration) (`ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`).

**Construction or proof.**

1. Normality under I reduces g₁ to a chosen representative of s.
2. An affine simple reflection changes each root cutoff of the normalized alcove filtration by at most one. The torus cutoff is unchanged; use the positive-depth ordered root-product bijection to deduce conjugate containment.
3. Multiply by I_n⊂I_{n−1} on the right. Apply the character to g₁h with h∈I_{n−1}.

**Acceptance.**

- At n=1 the containing group is I₀=I; no depth −1 is introduced.

**Sources.**

- [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): §4.2 and proof of Lemma 4.7, arXiv v3 pp. 11–12 and 14. Adjacent-depth containment for a simple cell: the cited result supplies the construction or argument with the hypotheses stated here.

<a id="RG2-4-iwasawa-integration-and-unimodularity"></a>

### Unimodularity and Iwasawa integration

Target `ReductiveGroupsPartII:RG2.4/iwasawa-integration-and-unimodularity`. Theorem; suggested declaration `BruhatTits.iwasawa_integration_and_unimodularity`.

G(E) is unimodular. Normalize Haar measures compatibly with a special compact subgroup P and a minimal parabolic Q=MU. With δ_Q(m)=|det(Ad(m)|Lie U)|_E, the right-compact order formula for a compactly supported continuous f is ∫_G f(g)dg=∫_P∫_M∫_U f(umk)δ_Q(m)⁻¹ du dm dk. The scalar normalization of the product measures is fixed by the compact intersection Q∩P. Changing the order of U and M changes the modular factor; record the convention. Equivalently, in Levi–unipotent–compact order the density is 1: integrate f(muk) du dm dk.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; G(E) is unimodular.

**Prerequisites.** [Iwasawa decomposition](#RG2-4-iwasawa-decomposition) (`ReductiveGroupsPartII:RG2.4/iwasawa-decomposition`); [Finite coset count inside a compact double coset](#RG2-4-compact-double-coset-finiteness) (`ReductiveGroupsPartII:RG2.4/compact-double-coset-finiteness`); `mathlib:MeasureTheory.Measure.haarMeasure`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.

**Construction or proof.**

1. Compute the group modular character on compact subgroups, simple normalizer lifts and translations; opposite roots cancel for reductive G.
2. The adjoint determinant gives the parabolic modulus.
3. Push forward the product measure under Iwasawa multiplication and compare Haar invariance with the stated normalization.

**Acceptance.**

- For the GL_2 Borel, δ(diag(a,d))=|a/d|_E.

**Sources.**

- [W. Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf): Casselman §1.5, Lemma 1.5.1, p. 16 (parabolic modulus and compact-cell volume); Iwasawa §1.4, pp. 13–15; product-measure formula derived by Haar invariance and the conjugation Jacobian. Compute the group modular character on compact subgroups, simple normalizer lifts and translations; opposite roots cancel for reductive G. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-gl-n-decompositions"></a>

### GL_n decompositions and minuscule index

Target `ReductiveGroupsPartII:RG2.4/gl-n-decompositions`. Application; suggested declaration `BruhatTits.gl_n_decompositions`.

For GL_n(E), the hyperspecial Cartan labels are decreasing integer n-tuples; Smith normal form gives the unique tuple for every double coset. Iwasawa is GL_n(E)=GL_n(O)B(E), and Iwahori labels are ℤ^n⋊S_n. For λ=(1,0,…,0), |Pλ(ϖ)P/P|=(q^n−1)/(q−1), counting hyperplanes in κ^n. For n=1 this count is 1 but the Cartan set ℤ is infinite. Zhu’s Witt-vector lattice orbit description is this group-level computation; affine Grassmannian geometry stays with GeometricSatakeAndFusion.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For GL_n(E), the hyperspecial Cartan labels are decreasing integer n-tuples; Smith normal form gives the unique tuple for every double coset.

**Prerequisites.** [Cartan decomposition at special parahorics](#RG2-4-cartan-decomposition) (`ReductiveGroupsPartII:RG2.4/cartan-decomposition`); [Iwasawa decomposition](#RG2-4-iwasawa-decomposition) (`ReductiveGroupsPartII:RG2.4/iwasawa-decomposition`); `mathlib:Module.Basis.SmithNormalForm`.

**Construction or proof.**

1. Apply DVR Smith normal form to integral multiples of the matrix.
2. Use successive lattice basis selection for Iwasawa.
3. A minuscule neighbor lattice is determined by a codimension-one residue subspace.

**Acceptance.**

- For GL_2 the index is q+1.

**Sources.**

- [Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*](https://arxiv.org/abs/1407.8519): Lemma 1.8 and Proposition 1.23, pp. 10–11, 19–20. Apply DVR Smith normal form to integral multiples of the matrix. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-rank-one-and-nonsplit-examples"></a>

### Rank-one Cartan distances and unequal parameters

Target `ReductiveGroupsPartII:RG2.4/rank-one-and-nonsplit-examples`. Application; suggested declaration `BruhatTits.rank_one_and_nonsplit_examples`.

For PGL_2(E) at a vertex, Cartan distance n≥0 has right-coset count 1 for n=0 and (q+1)q^(n−1) for n>0, represented by diag(ϖ^n,1). For SL_2, diag(ϖ^m,ϖ^−m) travels distance 2m and has count (q+1)q^(2m−1) for m>0. Odd-distance translations occur for PGL_2 but not SL_2. For unramified quasi-split U_3 the rank-one tree has alternating valencies q³+1 and q+1, giving unequal Iwahori simple parameters q³,q; compute spheres by alternating those parameters rather than copying the split formula. Ramified SU_3 examples use their actual root-jump parameters and have no hyperspecial vertex.

**Hypotheses.** G is connected reductive over K; use connected parahorics, K-normalized valuation and the Iwahori–Weyl quotient retaining torsion; For PGL_2(E) at a vertex, Cartan distance n≥0 has right-coset count 1 for n=0 and (q+1)q^(n−1) for n>0, represented by diag(ϖ^n,1).

**Prerequisites.** [Cartan decomposition at special parahorics](#RG2-4-cartan-decomposition) (`ReductiveGroupsPartII:RG2.4/cartan-decomposition`); [The quasi-split unitary group in three variables](#RG2-1-unitary-rank-one-example) (`ReductiveGroupsPartII:RG2.1/unitary-rank-one-example`); [Root-parameter counts of Iwahori cells](#RG2-4-double-coset-cardinalities) (`ReductiveGroupsPartII:RG2.4/double-coset-cardinalities`); [Bruhat–Tits tree](#RG2-2-sl2-tree) (`ReductiveGroupsPartII:RG2.2/sl2-tree`).

**Construction or proof.**

1. Use lattice-tree distance and sphere counting for PGL_2.
2. Restrict to the determinant-one cocharacter lattice for SL_2.
3. Compute the U_3 root quotients and alternate their valencies in the biregular tree.

**Acceptance.**

- The two split indices have different exponents; n=0 is handled separately.

**Sources.**

- [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf): §10.2.1–10.2.9, printed pp. 234–239 (linear groups); §10.1, pp. 211–234 (classical groups). Use lattice-tree distance and sphere counting for PGL_2. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588): §1.15 and §3.8, pp. 41–42, 55–56. Use lattice-tree distance and sphere counting for PGL_2. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-4-adjoint-cartan-coset-lifting"></a>

### Lifting adjoint Cartan cosets

Target `ReductiveGroupsPartII:RG2.4/adjoint-cartan-coset-lifting`. Theorem; suggested declaration `BruhatTits.adjoint_cartan_coset_lifting`.

Let 𝒢 be connected reductive over ℤ_p, G its generic fibre, and g_ad∈G_ad(ℚ_p). If κ_{G_ad}(g_ad)∈π₁(G_ad)^Γ is the image of some c∈π₁(G)^Γ, then there is g∈G(ℚ_p) with g_ad∈image(g)·G_ad(ℤ_p). Equivalently that right hyperspecial coset is in the image of G(ℚ_p)/G(ℤ_p)→G_ad(ℚ_p)/G_ad(ℤ_p). This conclusion lifts a coset; it does not assert a lift of the chosen element.

**Hypotheses.** The field, group and other hypotheses in the statement apply throughout.

**Prerequisites.** [Invariant cocharacters lift fundamental classes](#RG2-4-invariant-cocharacter-lifting) (`ReductiveGroupsPartII:RG2.4/invariant-cocharacter-lifting`); [Cartan decomposition at special parahorics](#RG2-4-cartan-decomposition) (`ReductiveGroupsPartII:RG2.4/cartan-decomposition`); [The algebraic fundamental group](#RG2-1-algebraic-fundamental-group) (`ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`).

**Construction or proof.**

1. Choose g₀∈G(ℚ_p) with κ_G(g₀)=c and multiply the adjoint element to reduce its invariant to zero.
2. Use the hyperspecial Cartan decomposition to express the resulting coset by p^ε in a rational maximal torus.
3. Zero adjoint invariant puts ε in the coroot lattice, which lifts to G through the simply connected derived torus. Restore g₀ and retain the right integral factor.

**Acceptance.**

- For GL_n→PGL_n the integral coset lifts even when a prescribed rational representative has a central obstruction.

**Sources.**

- [Mark Kisin, *Mod p points on Shimura varieties of abelian type*](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf): Lemma 1.2.4 and proof, author copy p. 13. Lifting adjoint Cartan cosets: the cited result supplies the construction or argument with the hypotheses stated here.

<a id="rg2-5"></a>

## RG2.5. Integral dual groups and L-groups

Dual based root data and the anchor’s pinned integral Chevalley–Demazure groups give dual groups over ℤ. The finite-image pinned Galois action defines the finite Galois, absolute Galois and Weil forms of the L-group, with explicit lattice calculations in the examples.

<a id="RG2-5-dual-based-root-datum"></a>

### Dual based root datum

Target `ReductiveGroupsPartII:RG2.5/dual-based-root-datum`. Construction; suggested declaration `LanglandsDual.dualRootDatum`.

Import the absolute based root datum Ψ(G)=(X,Φ,Y,Φ∨,Δ) with its perfect pairing and finite-image Galois action from anchor Layer 7. Define Ψ∨=(Y,Φ∨,X,Φ,Δ∨) by RootPairing.flip and Base.flip. Dualize an automorphism by its two lattice maps, using the inverse transpose for the contravariant character map, so that the action remains a homomorphism. The resulting based action factors through any finite Galois splitting field used for the original action. Applying duality twice returns the original based datum and action.

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; Import the absolute based root datum Ψ(G)=(X,Φ,Y,Φ∨,Δ) with its perfect pairing and finite-image Galois action from anchor Layer 7.

**Prerequisites.** `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `mathlib:RootPairing.flip`; `mathlib:RootPairing.Base.flip`.

**Uses.**

- Kaletha §4.1: Dual central isogenies and centre components use the absolute datum..
- Zhu §2: Geometric Satake identifies the dual group from this datum..

**API.**

- `LanglandsDual.dualRootDatum` (constructor): The flip of the absolute based root datum.
- `LanglandsDual.dualBase` (data): The coroot base of the flip.
- `LanglandsDual.dualAutomorphism` (functoriality): The induced based automorphism with the inverse-transpose convention.
- `LanglandsDual.dualGaloisAction` (data): The transported finite-image Galois action.
- `LanglandsDual.dualRootDatum_flip_flip` (simp): Double duality returns Ψ.
- `LanglandsDual.pairing_compat` (relation): The dual perfect pairing is the transposed original pairing.

**Unit tests.**

- `LanglandsDual.sl2_pgl2` (computation): The simply connected A_1 datum dualizes to the adjoint datum.
- `LanglandsDual.torus` (degenerate): An empty root system dualizes by swapping its character and cocharacter lattices.
- `LanglandsDual.flip_compat` (compatibility): The underlying RootPairing and Base are exactly the Mathlib flips.
- `LanglandsDual.not_relative` (non-example): A ramified SU_3 uses its absolute A_2 datum with Galois action, not its nonreduced relative BC_1 system.

**Construction or proof.**

1. Use the existing flip constructions on pairing and base.
2. Swap the root/coroot lattice maps of every based automorphism and check composition against the perfect pairing.
3. Transport the finite-image Galois action without changing its kernel.

**Acceptance.**

- The inverse needed in contravariant duality cannot be dropped.

**Sources.**

- [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3): §2.1, pp. 4–5. Use the existing flip constructions on pairing and base. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Tasho Kaletha, *Rigid inner forms of real and p-adic groups*](https://arxiv.org/abs/1304.3292): §4.1, pp. 578–579. Use the existing flip constructions on pairing and base. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Dual based root datum**.

<a id="RG2-5-langlands-dual-group"></a>

### Pinned Langlands dual group over ℤ

Target `ReductiveGroupsPartII:RG2.5/langlands-dual-group`. Construction; suggested declaration `LanglandsDual.dualGroup`.

Apply the anchor Layer 9 pinned Chevalley–Demazure construction to Ψ∨ to obtain a split connected reductive group Ĝ over ℤ with pinning and based-datum identification. It has X*(T̂)=X_*(T), roots the original coroots, and coroots the original roots. Its base change to a commutative ring A is functorial. The pinning is structural data used to lift based automorphisms; no residue-cardinality square root or Satake normalization enters this definition.

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; Apply the anchor Layer 9 pinned Chevalley–Demazure construction to Ψ∨ to obtain a split connected reductive group Ĝ over ℤ with pinning and based-datum identification.

**Prerequisites.** [Dual based root datum](#RG2-5-dual-based-root-datum) (`ReductiveGroupsPartII:RG2.5/dual-based-root-datum`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Uses.**

- Zhu §2: The Satake Tannakian group compares with its base change..
- Buzzard–Gee §2: The L-group uses its pinned Galois action..

**API.**

- `LanglandsDual.dualGroup` (constructor): The pinned split reductive ℤ-group of Ψ∨.
- `LanglandsDual.pinning` (data): The torus, Borel and simple-root vectors.
- `LanglandsDual.basedDatumEquiv` (equivalence): Its based datum equals Ψ∨.
- `LanglandsDual.characterLatticeEquiv` (equivalence): X*(T̂)≃X_*(T).
- `LanglandsDual.pointsMap` (functoriality): Ring homomorphisms induce dual-group point homomorphisms.
- `LanglandsDual.baseChange` (relation): Base change preserves the pinned datum.

**Unit tests.**

- `LanglandsDual.dualGroup.gl` (computation): The dual of split GL_n is the standard pinned GL_n.
- `LanglandsDual.dualGroup.trivial` (degenerate): The dual of the trivial group is trivial.
- `LanglandsDual.dualGroup.chevalley_compat` (compatibility): The group is the anchor pinned Chevalley group of the Mathlib flip.
- `LanglandsDual.dualGroup.sl_not_self` (non-example): For n≥2, SL_n dualizes to PGL_n, so simply connected type is not preserved.

**Construction or proof.**

1. Invoke the imported pinned-group classification on the dual datum.
2. Retain the torus, Borel and simple-root vectors as a pinning.
3. Use base change of the Hopf algebra for the group functor.

**Acceptance.**

- The integral construction is imported, not a second Chevalley project.

**Sources.**

- [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3): §2.1, pp. 4–5, combined with the anchor integral Chevalley construction. Invoke the imported pinned-group classification on the dual datum. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Langlands dual group**.

<a id="RG2-5-pinned-automorphisms"></a>

### Based automorphisms lift through the pinning

Target `ReductiveGroupsPartII:RG2.5/pinned-automorphisms`. Theorem; suggested declaration `LanglandsDual.pinned_automorphisms`.

The anchor pinned isomorphism theorem identifies automorphisms of (Ĝ,pinning) with automorphisms of Ψ∨. Over an algebraically closed characteristic-zero field, Aut(Ĝ)=Inn(Ĝ)⋊Aut(Ĝ,pinning), with inner group Ĝ_ad. Equivalently use the automorphism group-scheme statement, without equating its R-points to conjugations by Ĝ(R) for arbitrary rings. Hence the finite-image based Galois action lifts uniquely to pinning-preserving group-scheme automorphisms over ℤ.

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; The anchor pinned isomorphism theorem identifies automorphisms of (Ĝ,pinning) with automorphisms of Ψ∨.

**Prerequisites.** [Pinned Langlands dual group over ℤ](#RG2-5-langlands-dual-group) (`ReductiveGroupsPartII:RG2.5/langlands-dual-group`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Apply the imported pinned isomorphism theorem to each based automorphism.
2. Uniqueness makes composition compatible.
3. For the characteristic-zero point statement conjugate a Borel and torus and normalize the simple-root vectors.

**Acceptance.**

- Inner automorphisms are measured by Ĝ_ad, not universally by Ĝ(R).

**Sources.**

- [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3): §2.1, p. 5, citing Springer p. 10; anchor pinned isomorphism theorem. Apply the imported pinned isomorphism theorem to each based automorphism. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-5-dual-centre-and-fundamental-group"></a>

### Dual centre and the algebraic fundamental group

Target `ReductiveGroupsPartII:RG2.5/dual-centre-and-fundamental-group`. Theorem; suggested declaration `LanglandsDual.dual_centre_and_fundamental_group`.

As Galois modules, X*(Z(Ĝ))≃π₁(G)=X_*(T)/ℤΦ∨. Scheme-theoretic inertia fixed points of the diagonalizable centre satisfy X*(Z(Ĝ)^I)≃π₁(G)_I, including torsion. Over an algebraically closed characteristic-zero field Z(Ĝ) is connected iff π₁(G) is torsion-free, equivalently G_der is simply connected. Over residue characteristics dividing the torsion, geometric connectedness of a nonsmooth diagonalizable group has a different criterion, so do not state that equivalence uniformly over ℤ.

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; As Galois modules, X*(Z(Ĝ))≃π₁(G)=X_*(T)/ℤΦ∨.

**Prerequisites.** [Pinned Langlands dual group over ℤ](#RG2-5-langlands-dual-group) (`ReductiveGroupsPartII:RG2.5/langlands-dual-group`); [The algebraic fundamental group](#RG2-1-algebraic-fundamental-group) (`ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.

**Construction or proof.**

1. The centre of the dual has characters equal to the dual character lattice modulo its root lattice.
2. Substitute original cocharacters and coroots.
3. Fixed subgroups of diagonalizable groups dualize to coinvariant modules; check connectedness in characteristic zero.

**Acceptance.**

- SL_n gives dual centre μ_n with character group ℤ/n.

**Sources.**

- [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf): equation (1) and Proposition 3, pp. 1–3. The centre of the dual has characters equal to the dual character lattice modulo its root lattice. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3): §2.1, pp. 4–5. The centre of the dual has characters equal to the dual character lattice modulo its root lattice. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-5-gsp4-self-dual"></a>

### Self-duality of GSp₄

Target `ReductiveGroupsPartII:RG2.5/gsp4-self-dual`. Theorem; suggested declaration `LanglandsDual.gsp4_self_dual`.

The character lattice is {(a₁,a₂;c)∈ℤ³ : c≡a₁+a₂ mod 2}, with e₁=(1,0;1), e₂=(0,1;1), e₃=(0,0;2). The cocharacter lattice is {(b₁,b₂;d)∈(½ℤ)³ : b₁+d,b₂+d∈ℤ}, paired by a₁b₁+a₂b₂+cd, with dual basis f₁=(1,0;0), f₂=(0,1;0), f₃=(−½,−½;½). In the integral bases e₁,e₂,e₃ and dual bases f₁,f₂,f₃ of the reviewed Pilloni GSp₄ datum, take simple roots α₁=e₂−e₁, α₂=−2e₂+e₃ and coroots α₁∨=f₂−f₁, α₂∨=−f₂. The integer matrix I=((1,1,1),(1,0,1),(1,1,2)) defines X→Y with determinant −1, sends α₁ to α₂∨ and α₂ to α₁∨, and its inverse transpose gives the compatible Y→X map on coroots. It is therefore a based-datum isomorphism Ψ≃Ψ∨ with the simple-root labels exchanged, giving GSp₄≃GSp₄^∧ over ℤ. This is a direct lattice computation with the corrected base of source issue PAPER-PILLONI-20/E20.

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; In the integral bases e₁,e₂,e₃ and dual bases f₁,f₂,f₃ of the reviewed Pilloni GSp₄ datum, take simple roots α₁=e₂−e₁, α₂=−2e₂+e₃ and coroots α₁∨=f₂−f₁, α₂∨=−f₂.

**Prerequisites.** [Pinned Langlands dual group over ℤ](#RG2-5-langlands-dual-group) (`ReductiveGroupsPartII:RG2.5/langlands-dual-group`); `mathlib:RootPairing.flip`.

**Construction or proof.**

1. Compute determinant −1 and Iα₁=α₂∨, Iα₂=α₁∨ over ℤ.
2. Check the inverse-transpose map carries coroots to the corresponding roots, preserving the perfect pairing.
3. Invoke the anchor pinned isomorphism theorem on the resulting based-datum isomorphism.

**Acceptance.**

- Verify both root and coroot maps, not just the determinant.

**Sources.**

- [Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*](https://doi.org/10.1215/00127094-2019-0075): §5.1.1, p. 20 in the reviewed author-copy extraction; corrected simple base, PAPER-PILLONI-20/E20; direct matrix computation. Compute determinant −1 and Iα₁=α₂∨, Iα₂=α₁∨ over ℤ. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **Self-duality of GSp₄**.

<a id="RG2-5-galois-action-on-dual-group"></a>

### Finite-image Galois action on the dual group

Target `ReductiveGroupsPartII:RG2.5/galois-action-on-dual-group`. Construction; suggested declaration `LanglandsDual.galoisAction`.

Transport the anchor based Galois action through duality and the pinning to Γ_K→Aut(Ĝ,pinning), with finite image and open kernel. It acts naturally on Ĝ(A) for every ℤ-algebra A by group automorphisms. The action is trivial precisely when G is an inner form of a split group, not precisely when G itself is split. Its Weil-group version is composition with W_K→Γ_K imported from ClassFieldTheory Layer 9.

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; Transport the anchor based Galois action through duality and the pinning to Γ_K→Aut(Ĝ,pinning), with finite image and open kernel.

**Prerequisites.** [Based automorphisms lift through the pinning](#RG2-5-pinned-automorphisms) (`ReductiveGroupsPartII:RG2.5/pinned-automorphisms`); `mathlib:Field.absoluteGaloisGroup`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Uses.**

- Kaletha §4: Inner twisting keeps this action and dual group..
- RG2.5/l-group: The semidirect product uses this specific action..

**API.**

- `LanglandsDual.galoisAction` (constructor): Γ_K→Aut(Ĝ,pinning).
- `LanglandsDual.galoisActionOnPoints` (data): The induced action by automorphisms of Ĝ(A).
- `LanglandsDual.galoisAction_finite` (other): Its image is finite.
- `LanglandsDual.galoisAction_openKernel` (other): Its kernel is open.
- `LanglandsDual.pointsMap_equivariant` (functoriality): Point maps induced by A→B commute with the action.
- `LanglandsDual.galoisAction_trivial_iff_innerSplit` (characterisation): Trivial pinned action iff G is an inner form of a split group.

**Unit tests.**

- `LanglandsDual.galoisAction.normOne` (computation): For a quadratic norm-one torus, the nontrivial Galois element acts on G_m by inversion.
- `LanglandsDual.galoisAction.split` (degenerate): For split G the action is trivial.
- `LanglandsDual.galoisAction.datum_compat` (compatibility): Its action on the dual character lattice is the imported action on original cocharacters.
- `LanglandsDual.galoisAction.inner_nonsplit` (non-example): GL_1(D) for a central division algebra D can be nonsplit while its pinned dual action is trivial.

**Construction or proof.**

1. Compose the finite based action with the unique pinned lift.
2. Define point actions through pullback on the coordinate Hopf algebra.
3. The splitting-field open kernel proves continuity; compare with the anchor inner-form criterion.

**Acceptance.**

- A nonsplit inner form of GL_n has trivial pinned dual action.

**Sources.**

- [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3): §2.1, pp. 4–5. Compose the finite based action with the unique pinned lift. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Tasho Kaletha, *Rigid inner forms of real and p-adic groups*](https://arxiv.org/abs/1304.3292): §4.1, pp. 578–579. Compose the finite based action with the unique pinned lift. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-5-l-group"></a>

### L-group as a semidirect-product functor

Target `ReductiveGroupsPartII:RG2.5/l-group`. Construction; suggested declaration `LanglandsDual.LGroup`.

For Γ equal to Γ_K, a finite splitting Galois quotient, or W_K with its induced action, define the L-group point functor A↦Ĝ(A)⋊Γ. Its multiplication is (g,γ)(h,δ)=(g·γ(h),γδ). It has projection to Γ, dual-group kernel and the pinned section γ↦(1,γ). Finite-Γ form is a finite-component ℤ-group scheme; infinite Γ forms are used as group functors/topological point groups, with topology specified on coefficients and Γ, rather than claimed finite-type algebraic groups. The absolute form is the pullback of a finite-quotient form along Γ_K→Gal(K′/K).

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; For Γ equal to Γ_K, a finite splitting Galois quotient, or W_K with its induced action, define the L-group point functor A↦Ĝ(A)⋊Γ.

**Prerequisites.** [Finite-image Galois action on the dual group](#RG2-5-galois-action-on-dual-group) (`ReductiveGroupsPartII:RG2.5/galois-action-on-dual-group`); `mathlib:SemidirectProduct`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Uses.**

- Kaletha §4.1: Parameters take values in this semidirect product..
- Buzzard–Gee §3: Coefficient-field L-group points receive Galois representations..

**API.**

- `LanglandsDual.LGroup` (constructor): The semidirect-product point functor.
- `LanglandsDual.LGroup.mul_formula` (simp): (g,γ)(h,δ)=(g·γ(h),γδ).
- `LanglandsDual.LGroup.projection` (data): The homomorphism to Γ.
- `LanglandsDual.LGroup.dualInclusion` (data): The normal dual-group inclusion.
- `LanglandsDual.LGroup.section` (data): The pinned splitting section.
- `LanglandsDual.LGroup.kernel_projection` (characterisation): The projection kernel is the dual-group image.
- `LanglandsDual.LGroup.pointsMap` (functoriality): Coefficient-ring homomorphisms induce maps over Γ.

**Unit tests.**

- `LanglandsDual.LGroup.split` (computation): With trivial pinned action it is the direct product Ĝ(A)×Γ.
- `LanglandsDual.LGroup.gamma_trivial` (degenerate): With Γ=1 it is Ĝ(A).
- `LanglandsDual.LGroup.semidirect_compat` (compatibility): Its carrier and multiplication use Mathlib SemidirectProduct with the same action.
- `LanglandsDual.LGroup.normOne_noncommutative` (non-example): For the quadratic norm-one torus, (1,σ)(z,1)=(z⁻¹,σ), so it is not a direct product when z²≠1.

**Construction or proof.**

1. Use Mathlib SemidirectProduct with the pinned point action.
2. Check multiplication, projection, inclusion and the exact sequence.
3. Lift coefficient-ring morphisms componentwise and compare finite and absolute forms by pullback.

**Acceptance.**

- An infinite absolute Galois component is not a finite-type group scheme.

**Sources.**

- [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3): §2.1, pp. 4–5 (Galois form); Weil form through the imported local Weil group. Use Mathlib SemidirectProduct with the pinned point action. The remaining conclusions are the explicitly indicated consequences in the proof outline.

Atlas planet: **L-group**.

<a id="RG2-5-l-group-change-of-pinning"></a>

### Transport under pinning and splitting choices

Target `ReductiveGroupsPartII:RG2.5/l-group-change-of-pinning`. Theorem; suggested declaration `LanglandsDual.l_group_change_of_pinning`.

Changing the absolute Borel–torus pair gives the canonical transport of based data; changing a dual pinning transports the pinned action by an inner automorphism and yields an isomorphism of L-group functors commuting with projection to Γ. Over an algebraically closed characteristic-zero coefficient field, choosing a conjugating element realizes that isomorphism by dual-group conjugation. Its choice has a central ambiguity; the resulting L-group is determined up to the usual dual-group conjugacy, not a unique pointwise isomorphism. Enlarging the splitting field compares finite forms by pullback.

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; Changing the absolute Borel–torus pair gives the canonical transport of based data; changing a dual pinning transports the pinned action by an inner automorphism and yields an isomorphism of L-group functors commuting with projection to Γ.

**Prerequisites.** [L-group as a semidirect-product functor](#RG2-5-l-group) (`ReductiveGroupsPartII:RG2.5/l-group`); [Based automorphisms lift through the pinning](#RG2-5-pinned-automorphisms) (`ReductiveGroupsPartII:RG2.5/pinned-automorphisms`).

**Construction or proof.**

1. Use anchor conjugacy to transport the based datum.
2. Conjugate the pinned lift and extend the same map to the semidirect product.
3. Check projection and point functoriality; track the central ambiguity.

**Acceptance.**

- Do not assert uniqueness of an arbitrary equivariant inner transport.

**Sources.**

- [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3): §2.1, pp. 4–5. Use anchor conjugacy to transport the based datum. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-5-l-group-levi-embedding"></a>

### L-group embeddings for rational Levi subgroups

Target `ReductiveGroupsPartII:RG2.5/l-group-levi-embedding`. Construction; suggested declaration `LanglandsDual.Levi.embedding`.

For a K-parabolic P with K-Levi M choose compatible absolute Borel, torus and pinning. The corresponding Γ-stable standard dual Levi M̂⊂Ĝ has the dual based datum of M, and its pinned Galois action is the restriction of that on Ĝ. This yields M̂(A)⋊Γ→Ĝ(A)⋊Γ, injective on each point group and commuting with Γ projection. Its compatible-choice conjugacy class is intrinsic. For a twisted Levi lacking a rational parabolic, an L-embedding requires additional data and is not supplied by this construction.

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; For a K-parabolic P with K-Levi M choose compatible absolute Borel, torus and pinning.

**Prerequisites.** [L-group as a semidirect-product functor](#RG2-5-l-group) (`ReductiveGroupsPartII:RG2.5/l-group`); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Uses.**

- Langlands parabolic induction: Parameters of a rational Levi map into the ambient L-group..
- Kaletha §4: Levi dual centres are compared in the compatible dual setup..

**API.**

- `LanglandsDual.Levi.dualLevi` (constructor): The Γ-stable standard dual Levi.
- `LanglandsDual.Levi.embedding` (data): The injective L-group map over Γ.
- `LanglandsDual.Levi.embedding_dual` (simp): Restriction to the dual-group kernel is the standard Levi inclusion.
- `LanglandsDual.Levi.embedding_projection` (relation): The Γ projection commutes.
- `LanglandsDual.Levi.conjugacy_independent` (functoriality): Compatible pinning choices give conjugate embeddings.

**Unit tests.**

- `LanglandsDual.Levi.gl_blocks` (computation): A block Levi ∏GL_nᵢ gives the corresponding dual block inclusion.
- `LanglandsDual.Levi.self` (degenerate): M=G gives the identity L-group map.
- `LanglandsDual.Levi.root_compat` (compatibility): Its dual roots are the coroots of the original Levi datum.
- `LanglandsDual.Levi.twisted_torus` (non-example): An anisotropic maximal torus in split SL_2 is a twisted Levi but no rational Borel Levi, so this target does not produce its L-embedding.

**Construction or proof.**

1. A rational parabolic gives a Galois-stable subset of simple roots.
2. Import the standard Levi root-datum realization in the pinned group.
3. Restrict the action and apply the functorial semidirect-product homomorphism.

**Acceptance.**

- The rational-parabolic hypothesis is essential.

**Sources.**

- [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3): §2.1, pp. 4–5 for based transport. The pinned based-root construction identifies a Γ-stable simple-root subset with the standard dual Levi. The L-embedding here is derived by restricting that pinned action; a twisted Levi with no rational parabolic needs additional choices.
- [Tasho Kaletha, *Rigid inner forms of real and p-adic groups*](https://arxiv.org/abs/1304.3292): §4.1, pp. 578–580 for pinned dual setup. The pinned based-root construction identifies a Γ-stable simple-root subset with the standard dual Levi. The L-embedding here is derived by restricting that pinned action; a twisted Levi with no rational parabolic needs additional choices.

<a id="RG2-5-dual-isogenies-and-products"></a>

### Dual central maps, products and z-extensions

Target `ReductiveGroupsPartII:RG2.5/dual-isogenies-and-products`. Theorem; suggested declaration `LanglandsDual.dual_isogenies_and_products`.

A central isogeny G→G′ dualizes contravariantly to a central isogeny Ĝ′→Ĝ, compatible with pinned Galois actions. Product duality gives (G×H)^∧=Ĝ×Ĥ and L(G×H)=LG×_Γ LH. A z-extension G̃→G dualizes to an embedding Ĝ→Ĝ̃ with torus quotient, compatible with Γ. The quotient torus need not be a central subgroup: GL_n/SL_n is a torus quotient but SL_n is not central in GL_n. Compatible pinned choices give the induced L-group maps.

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; A central isogeny G→G′ dualizes contravariantly to a central isogeny Ĝ′→Ĝ, compatible with pinned Galois actions.

**Prerequisites.** [L-group as a semidirect-product functor](#RG2-5-l-group) (`ReductiveGroupsPartII:RG2.5/l-group`); [z-extensions](#RG2-1-z-extension) (`ReductiveGroupsPartII:RG2.1/z-extension`).

**Construction or proof.**

1. Dualize the two lattice maps in the isogeny datum.
2. Use pinned classification to realize the maps of root data.
3. For z-extensions compute the character-lattice exact sequence and torus quotient.

**Acceptance.**

- The dual z-extension map is an inclusion, whereas a central isogeny reverses as an isogeny.

**Sources.**

- [Tasho Kaletha, *Rigid inner forms of real and p-adic groups*](https://arxiv.org/abs/1304.3292): §§4.1 and 5.3, pp. 578–580, 610–612. Dualize the two lattice maps in the isogeny datum. The remaining conclusions are the explicitly indicated consequences in the proof outline.
- [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3): §2.1, pp. 4–5. Dualize the two lattice maps in the isogeny datum. The remaining conclusions are the explicitly indicated consequences in the proof outline.

<a id="RG2-5-dual-of-weil-restriction"></a>

### Dual and L-groups of Weil restrictions

Target `ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction`. Theorem; suggested declaration `LanglandsDual.dual_of_weil_restriction`.

For K′/K finite separable and H/K′ connected reductive, the dual of Res_(K′/K)H is the product of copies of Ĥ indexed by Hom_K(K′,K^sep). Its Γ_K action permutes those factors with the original Γ_K′ pinned action through chosen coset representatives. Different representatives give canonically transported induced data. The L-group is the resulting semidirect product with Γ_K; it is not merely the product of the smaller L-groups, since there is one common Galois projection. For tori this is duality of induced character/cocharacter modules.

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; For K′/K finite separable and H/K′ connected reductive, the dual of Res_(K′/K)H is the product of copies of Ĥ indexed by Hom_K(K′,K^sep).

**Prerequisites.** [L-group as a semidirect-product functor](#RG2-5-l-group) (`ReductiveGroupsPartII:RG2.5/l-group`); [Character lattices of Weil-restricted tori](#RG2-0a-weil-restriction-character-lattices) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-character-lattices`); [Splitting of a Weil restriction over a separable extension](#RG2-0a-weil-restriction-separable-splitting) (`ReductiveGroupsPartII:RG2.0a/weil-restriction-separable-splitting`).

**Construction or proof.**

1. The separable Weil splitting identifies the absolute datum as a product over embeddings.
2. Dualize each factor and compute transport of the Galois permutation action.
3. Apply the pinned semidirect product; use induced modules for the torus comparison.

**Acceptance.**

- For Res_(K′/K)G_m the dual rank is [K′:K], though its K-building split rank is one.

**Sources.**

- [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3): §2.1, pp. 4–5 and §4.1, pp. 22–24 (induced torus Galois modules). The pinned dual construction in §2.1 and the induced torus-module convention in §4.1 supply the ingredients. Product duality for a general reductive Weil restriction is derived here from the separable decomposition of its absolute based root datum; it is not claimed to be a theorem stated in those sections.

<a id="RG2-5-torus-and-gl-dual-groups"></a>

### Dual groups of tori and general linear groups

Target `ReductiveGroupsPartII:RG2.5/torus-and-gl-dual-groups`. Application; suggested declaration `LanglandsDual.torus_and_gl_dual_groups`.

For a torus T, T̂ is the split diagonalizable ℤ-group with character lattice X_*(T), equipped with the original cocharacter Galois action. Split rank-d tori have dual G_m^d and trivial action. Split GL_n is self-dual with its standard pinning; SL_n and PGL_n are dual to one another. A quadratic norm-one torus has dual G_m with nontrivial Galois element acting by inversion. These computations retain the central lattice as well as the roots.

**Hypotheses.** G is connected reductive over K; its absolute based integral root datum and finite-image continuous Galois action are imported from the anchor; For a torus T, T̂ is the split diagonalizable ℤ-group with character lattice X_*(T), equipped with the original cocharacter Galois action.

**Prerequisites.** [L-group as a semidirect-product functor](#RG2-5-l-group) (`ReductiveGroupsPartII:RG2.5/l-group`); `tauceti:TauCeti.SplitTorus.pointsMulEquiv`.

**Construction or proof.**

1. Swap torus character and cocharacter lattices.
2. For GL_n use the standard basis pairing and roots e_i−e_j.
3. For SL_n/PGL_n compare weight and root lattices; for norm-one tori compute the sign action.

**Acceptance.**

- A root system alone would incorrectly identify SL_n and PGL_n.

**Sources.**

- [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3): §2.1, pp. 4–5 and §4.1, pp. 22–24. Swap torus character and cocharacter lattices. The remaining conclusions are the explicitly indicated consequences in the proof outline.

## Supplier contracts

The following imports specify the exact lower-tier input at each boundary. The stage identifiers are the owners; the consuming targets specify how the input is used.

- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary`: The convolution group structure of points of a commutative Hopf algebra (functor of points), used to topologize G(R) and identify GL_n points. Affine group schemes as commutative Hopf algebras and their convolution groups of points. Consumers: `ReductiveGroupsPartII:RG2.0/affine-point-topology`, `ReductiveGroupsPartII:RG2.0a/weil-restriction-functor`.

- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`: The Lie algebra of an affine group over a field as the kernel of points over the dual numbers, for the graded congruence quotients of a smooth model. The Lie algebra Lie(G) of an affine group scheme of finite type over a field with the adjoint representation Ad: G → GL(Lie G), and the Lie algebra of a smooth affine group over a ring (for the lattices g_{x,r} and the graded pieces V_{x,r}). Consumers: `ReductiveGroupsPartII:RG2.0/smooth-model-congruence-quotients`, `ReductiveGroupsPartII:RG2.3/moy-prasad-lie-lattices`, `ReductiveGroupsPartII:RG2.4/iwasawa-integration-and-unimodularity`.

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`: Unique extension of the valuation to finite (unramified) extensions of a local field, for the valuation on E^ur. Consumers: `ReductiveGroupsPartII:RG2.0/completed-maximal-unramified-extension`.

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`: The maximal unramified extension E^ur inside a fixed closure, its Galois group Ẑ and the arithmetic Frobenius, which Ĕ completes. Consumers: `ReductiveGroupsPartII:RG2.0/completed-maximal-unramified-extension`.

- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`: Pro-p groups (inverse limits of finite p-groups) for the statement that the first congruence subgroup of a smooth model is pro-p. Consumers: `ReductiveGroupsPartII:RG2.0/smooth-model-congruence-quotients`.

- `tauceti:TauCetiRoadmap/ModularCurves#0f-hom-schemes-and-closed-loci`: The affine finite-presentation representing scheme of the functor of Z-morphisms for Z → S finite locally free, with base change; RG2.0a extends it to arbitrary affine targets and proves compatibility (RT-AREA-algebraicgeometry/11 fix). Consumers: `ReductiveGroupsPartII:RG2.0a/weil-restriction-functor`, `ReductiveGroupsPartII:RG2.0a/weil-restriction-representing-algebra`.

- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`: Character modules of groups of multiplicative type with Galois action. Consumers: `ReductiveGroupsPartII:RG2.0a/weil-restriction-character-lattices`, `ReductiveGroupsPartII:RG2.5/dual-centre-and-fundamental-group`.

- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`: The reductivity and semisimplicity predicates over a field (anchor Layer 6). Simply connected covers of semisimple groups, central isogenies and the simply connected property, for z-extensions. Consumers: `ReductiveGroupsPartII:RG2.0a/weil-restriction-descent-of-properties`, `ReductiveGroupsPartII:RG2.1/z-extension`, `ReductiveGroupsPartII:RG2.1/z-extension-existence`, `ReductiveGroupsPartII:RG2.2/building-functoriality-central-extensions`, `ReductiveGroupsPartII:RG2.2/finite-group-fixed-points-reductive`, `ReductiveGroupsPartII:RG2.3/quasi-tame-group`, `ReductiveGroupsPartII:RG2.3/reductive-model`, `ReductiveGroupsPartII:RG2.3/reductive-quotient-of-special-fibre`.

- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`: Relative root systems and maximal split tori, to state the multiplicity statement for relative roots of a Weil restriction. Relative root system Φ(G,S) of a maximal K-split torus, relative Weyl group, relative root subgroups (Borel–Tits), absolute root datum with Galois action, parabolic and Levi subgroups (dynamic or root-theoretic), conjugacy of maximal split tori; imported per RS-31 and never re-planned. Consumers: `ReductiveGroupsPartII:RG2.0a/weil-restriction-descent-of-properties`, `ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`, `ReductiveGroupsPartII:RG2.1/levi-of-apartment-vector`, `ReductiveGroupsPartII:RG2.1/minuscule-coweight`, `ReductiveGroupsPartII:RG2.1/quasi-split-root-group-coordinates`, `ReductiveGroupsPartII:RG2.1/rational-maximal-unramified-split-torus`, `ReductiveGroupsPartII:RG2.1/rational-points-root-datum`, `ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`, `ReductiveGroupsPartII:RG2.1/torus-valuation-map`, `ReductiveGroupsPartII:RG2.1/transport-under-choices`, `ReductiveGroupsPartII:RG2.2/building-products-and-levis`, `ReductiveGroupsPartII:RG2.5/dual-based-root-datum`, `ReductiveGroupsPartII:RG2.5/l-group-levi-embedding`.

- `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free`: Coxeter combinatorics for a general Coxeter system (exchange, Matsumoto, Bruhat order), applied to the affine Weyl group. Consumers: `ReductiveGroupsPartII:RG2.1/affine-weyl-group`, `ReductiveGroupsPartII:RG2.4/length-and-bruhat-order`.

- `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`: Chambers, dominant chamber and fundamental domain for a finite root system, used for dominance and for the vector chambers of the apartment. Consumers: `ReductiveGroupsPartII:RG2.1/affine-chamber-structure`, `ReductiveGroupsPartII:RG2.1/minuscule-coweight`, `ReductiveGroupsPartII:RG2.1/root-datum-in-a-group`.

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`: Tame ramification: tame Galois extensions of a field with algebraically closed residue field are cyclic of order prime to p. For F/Q_p finite in a common algebraic closure, compatibility of maximal tame extensions F^t=F·Q_p^t (KPZ Lemma 6.1.2, arXiv v3 pp. 64–65). Consumers: `ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`, `ReductiveGroupsPartII:RG2.3/quasi-tame-group`, `ReductiveGroupsPartII:RG2.3/tame-hyperspecial-realization`.

- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`: Identity components and connectedness of smooth affine groups over a field, fppf quotients and exact sequences 1 → H′ → H → H″ → 1 of smooth groups (for the statement of Lang's theorem and its consequence on rational points). Consumers: `ReductiveGroupsPartII:RG2.3/lang-theorem`, `ReductiveGroupsPartII:RG2.3/quotients-over-a-dvr`, `ReductiveGroupsPartII:RG2.3/smooth-affine-model`.

- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`: Unipotent radicals and reductive quotients of smooth connected groups over a perfect field. Consumers: `ReductiveGroupsPartII:RG2.3/reductive-quotient-of-special-fibre`.

- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`: Pinned integral split reductive groups and their classification/isomorphism theorem by based root data; descent through finite based automorphisms. Consumers: `ReductiveGroupsPartII:RG2.4/hyperspecial-generation`, `ReductiveGroupsPartII:RG2.4/unramified-combinatorial-comparison`, `ReductiveGroupsPartII:RG2.5/langlands-dual-group`, `ReductiveGroupsPartII:RG2.5/pinned-automorphisms`.

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`: The local Weil group and its map to the absolute Galois group, for the Weil form of the L-group. Consumers: `ReductiveGroupsPartII:RG2.5/galois-action-on-dual-group`, `ReductiveGroupsPartII:RG2.5/l-group`.

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`: For an unramified quadratic extension of a local field, norm surjectivity on units, proved through the residue norm, successive unit quotients and completeness; used with the quaternion valued-algebra coordinates to obtain reduced-norm surjectivity. Consumers: `ReductiveGroupsPartII:RG2.3/classical-hyperspecial-lattices`.

## Pinned library boundary

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. A library declaration is used only with the statement and hypotheses at those commits; the extensions stated in the targets remain part of this roadmap.

- `mathlib:AlgHom.card`: The number of K-embeddings of a finite separable extension into an algebraically closed field is the degree.
- `mathlib:Algebra.FinitePresentation`: Finitely presented algebras.
- `mathlib:Algebra.FiniteType`: Finitely generated algebras.
- `mathlib:Algebra.FormallyEtale.equivPiOfIsSepClosed`: A formally étale essentially finite type algebra over a separably closed field is a product of copies of the field.
- `mathlib:Algebra.FormallySmooth`: Formally smooth algebras (lifting along nilpotent ideals).
- `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`: If A is formally smooth over R and S is I-adically complete, every R-algebra map A → S/I lifts to A → S (Hensel lifting of points of smooth models).
- `mathlib:Algebra.Smooth`: Smooth algebras: formally smooth and finitely presented.
- `mathlib:Algebra.TensorProduct.assoc`: Associativity of tensor products of algebras.
- `mathlib:Algebra.TensorProduct.basis`: The basis of A ⊗[R] M induced by a basis of M.
- `mathlib:Algebra.TensorProduct.cancelBaseChange`: Cancellation of a base change in iterated tensor products of algebras.
- `mathlib:Algebra.TensorProduct.map`: Tensor product of algebra maps.
- `mathlib:Algebra.norm`: The algebra norm S →* R of a finite free extension.
- `mathlib:Algebra.norm_eq_matrix_det`: The algebra norm is the determinant of the left multiplication matrix in a basis.
- `mathlib:AlgebraicGeometry.Scheme`: Schemes, used for the chart-glued topology.
- `mathlib:CategoryTheory.Functor.RepresentableBy`: Data of a representing object for a presheaf/copresheaf.
- `mathlib:CommAlgCat`: The category of commutative algebras over a commutative ring.
- `mathlib:CommHopfAlgCat`: The category of commutative Hopf algebras over a commutative ring.
- `mathlib:CoxeterSystem`: Coxeter systems: an isomorphism of a group with the presented Coxeter group of a Coxeter matrix.
- `mathlib:IsModuleTopology`: The canonical topology on a module over a topological ring.
- `mathlib:IsNonarchimedeanLocalField`: Nonarchimedean local fields (valuative topology, locally compact, nontrivial), with instances CompactSpace 𝒪[K], IsDiscreteValuationRing 𝒪[K], Finite 𝓀[K], IsAdicComplete 𝓂[K] 𝒪[K].
- `mathlib:IsNonarchimedeanLocalField.isCompact_closedBall`: Closed valuation balls of a nonarchimedean local field are compact.
- `mathlib:Matrix.isUnit_iff_isUnit_det`: A square matrix over a commutative ring is invertible iff its determinant is a unit; GL_n(𝒪) consists of integral matrices with unit determinant.
- `mathlib:Module.Dual`: The dual module Hom_R(M, R).
- `mathlib:MvPolynomial.continuous_eval`: Evaluation of a fixed multivariate polynomial is continuous on a topological semiring.
- `mathlib:RootPairing`: Root pairings (roots, coroots, reflection permutations) over a ring; RootDatum is the case over ℤ.
- `mathlib:RootPairing.IsReduced`: Reduced root pairings (no two roots positively proportional except equal).
- `mathlib:Submodule.IsLattice`: An R-submodule M of an A-module V is a lattice if it is finitely generated and spans V over A (R → A, e.g. 𝒪 → K): the carrier for the lattices Λ_i of a lattice chain.
- `mathlib:UniformSpace.Completion`: The Hausdorff completion of a uniform space (with its field structure for valued fields).
- `mathlib:Units.isEmbedding_embedProduct`: The units topology is induced by u ↦ (u, u⁻¹) into M × Mᵐᵒᵖ.
- `mathlib:Valuation`: Valuations on rings with values in linearly ordered commutative groups with zero.
- `mathlib:WittVector.isDiscreteValuationRing`: The Witt vectors of a perfect field of characteristic p form a discrete valuation ring.
- `mathlib:groupCohomology`: Group cohomology of a k-linear representation as the cohomology of its inhomogeneous cochain complex (abelian coefficients; the nonabelian H^1 of Lang's theorem is stated through cocycles and coboundaries).
- `mathlib:groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`: Hilbert 90 (Noether): for a finite field extension L/K every multiplicative 1-cocycle Gal(L/K) → Lˣ is a coboundary; the G_m case of Lang's theorem over finite fields.
- `tauceti:TauCeti.AlgHom.faithfullyFlatDescentMulEquiv`: Faithfully flat descent of points of a Hopf algebra.
- `tauceti:TauCeti.AlgHom.instGroup`: The convolution group structure on WithConv (H →ₐ[R] A).
- `tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup`: The geometric character group (group-like elements after base change to an algebraic closure) with its Galois action.
- `tauceti:TauCeti.DiagonalizableGroup.pairing`: The integer pairing between characters and cocharacters of a diagonalizable group.
- `tauceti:TauCeti.GL2NonSplitTorusHom`: For a quadratic extension E/F, the embedding E^× → GL_2(F) by left multiplication in a basis, with determinant the norm.
- `tauceti:TauCeti.GeneralLinear.commutatorElement_rootSubgroupPoints`: Chevalley commutator relation [x_ij(c), x_jl(d)] = x_il(cd) for GL_n root subgroups.
- `tauceti:TauCeti.GeneralLinear.pointsMulEquiv`: The convolution group of A-points of the GL_n coordinate Hopf algebra is isomorphic to Matrix.GeneralLinearGroup (Fin n) A, for every commutative R-algebra A (used with A = 𝒪 and A = K for the explicit GL_n levels).
- `tauceti:TauCeti.HopfAlgebra.pointsFunctor`: The functor CommAlgCat R ⥤ GrpCat of points of a Hopf algebra.
- `tauceti:TauCeti.IsProP`: A topological group is pro-p when every quotient by an open normal subgroup is a p-group.
- `tauceti:TauCeti.MultiplicativeGroup.pointsMulEquiv`: Points of the Laurent polynomial Hopf algebra ≃* units of the value algebra.
- `tauceti:TauCeti.reductiveCommHopfAlgProperty`: Reductivity of a finite-type commutative Hopf algebra over a field (smooth, geometrically connected, no geometric connected normal smooth unipotent subgroup).
- `tauceti:TauCeti.torusCommHopfAlgProperty`: Tori: finite-type commutative Hopf algebras that become split tori over an algebraic closure.
- `tauceti:TauCeti.unitFiltration`: For a nonarchimedean local field K and i : ℕ, the subgroup U(K,i) of Kˣ of units of 𝒪[K] congruent to 1 modulo 𝓂[K]^i (U(K,0) = image of 𝒪[K]ˣ): the Moy–Prasad filtration of the split torus G_m at integer depths.
- `mathlib:Monoid.PushoutI`: Indexed amalgamated free product of monoids, also the pushout in groups when its inputs are groups.
- `tauceti:TauCeti.smoothCommHopfAlgProperty`: Object property H ↦ Algebra.Smooth R H on commutative Hopf R-algebras.
- `tauceti:TauCeti.HopfIdeal`: Two-sided ideals stable under antipode, killed by counit and with coproduct in I⊗H+H⊗I.
- `tauceti:TauCeti.TitsSystem`: BN data with generation, normal intersection, simple quotient generators, rank-one double-coset relation and nontriviality axioms.
- `tauceti:TauCeti.TitsSystem.bruhatCells_eq_univ`: The union of all Bruhat cells of a Tits system covers the ambient group.
- `mathlib:Subgroup.index`: Natural-number index Nat.card (G/H), zero when the quotient is infinite; use only after proving finite index.
- `mathlib:MeasureTheory.Measure.haarMeasure`: Left Haar measure normalized to give a specified positive compact set measure one.
- `mathlib:Module.Basis.SmithNormalForm`: Bases of a submodule and its ambient module, an injection of basis indices and diagonal scalars satisfying the diagonal inclusion relation.
- `mathlib:RootPairing.flip`: Swaps roots and coroots and transposes the bilinear pairing, with the same reflection permutation.
- `mathlib:RootPairing.Base.flip`: Base of the flipped root pairing, with the same support and exchanged root/coroot span and sign conditions.
- `mathlib:Field.absoluteGaloisGroup`: Automorphisms of AlgebraicClosure K as a K-algebra, with its profinite topology.
- `mathlib:SemidirectProduct`: Product carrier for a homomorphism Γ→MulAut N, with multiplication (n,γ)(m,δ)=(n·γ(m),γδ).
- `tauceti:TauCeti.SplitTorus.pointsMulEquiv`: Convolution points of the split torus indexed by σ are multiplicatively equivalent to σ→Aˣ.
- `mathlib:TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`: A cofiltered limit of nonempty compact Hausdorff spaces is nonempty; apply to the discrete finite Lang solution torsors.

## Corrections used in the mathematical statements

The targets incorporate these source corrections. Each description below is an independent mathematical explanation; the packet records the correction searches and affected claims.

### ReductiveGroupsPartII/E40: gap

[Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791): Lemma 15 and its proof (arXiv v3: Lemma 4.5, p. 13), and its use in the count of Lemma 16 (arXiv v3 Lemma 4.6, pp. 13–14).

The lifting needs the Lang map z ↦ z^{-1}σ(z) to be surjective on Ĭ_n ∩ gĬ_ng^{-1}; this holds because that intersection is the group of Ŏ-points of a smooth connected pro-unipotent model whose truncations are smooth connected groups over F̄_q, by Lang's theorem for inverse limits (RG2.3/lang-for-pro-algebraic-groups, RG2.3/frobenius-fixed-coset-lifting). The statement of Lemma 15 is then correct.

A pro-p group with a Frobenius-type automorphism need not have surjective Lang map: for the finite p-group ℤ/p with the identity as σ, z ↦ z^{-1}σ(z) is trivial and fixed cosets of the trivial subgroup in a quotient by a σ-stable subgroup need not lift; surjectivity is a property of connected algebraic groups (Lang), not of pro-p groups.

Correction status: new.

### ReductiveGroupsPartII/E41: gap

[Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): §1.3.8 and Proposition 1.3.9, arXiv v3 p. 19 (IHÉS pp. 142–143).

Take K̃/K finite tame Galois splitting G, so that the Weil restriction is of finite type; obtain the Γ-action after base change to O^ur (where 1.7.6 applies) and descend, or prove the statement over Ŏ with the finite inertia group and descend the closed-immersion property along O → Ŏ.

For K̃ = K̃^ur the extension K̃/K is infinite, the Weil restriction is not a scheme of finite type, and Edixhoven's fixed-point theorem (finite tame group acting on a smooth scheme of finite type) does not apply as stated.

Correction status: new.

### ReductiveGroupsPartII/E42: misprint

[Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): proof of Proposition 1.3.3, display after 'It decomposes as follows', arXiv v3 p. 17 (IHÉS p. 140), repeated for V_j on the next page.

V_[λ] = ⊕_{λ′=λ+ka} V_{λ′} (and V_{j,[λ]} = ⊕_{λ′=λ+ka} V_{j,λ′}).

The class [λ] collects the weights λ′ in the a-string through λ; summing V_λ over λ′ repeats a single weight space.

Correction status: new.

### ReductiveGroupsPartII/E43: misprint

[Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): Proposition 2.2.2(2), arXiv v3 p. 12.

Both occurrences should be 𝒢̃_{x′}, the stabilizer of the point x′ of part (1), which is hyperspecial over K̃: 𝒢 = 𝒢_x = 𝒢_{x′} ≅ (Res_{Õ/O}𝒢̃_{x′})^Γ.

Reductivity over Õ is established for x′ (hyperspecial in B(G,K̃)), not for the original point x, which need not be hyperspecial over K̃.

Correction status: new.

### ReductiveGroupsPartII/E44: gap

[Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): proof of Proposition 2.2.2, reductive case, arXiv v3 pp. 12–14.

Either deduce 𝒢_x = 𝒢_{x′} directly: (∗) for G^der gives x′_der in the facet of x̄ arbitrarily close to it, and its lift x′ with the central component of x lies in the genericity neighbourhood of x; or first replace x by a point of its genericity neighbourhood whose derived image is generic.

Genericity of x in B(G,K) does not by itself imply genericity of its image in B(G^der,K): the genericity neighbourhood is defined by equality of stabilizer schemes of G, which also involve the central component.

Correction status: new.

### ReductiveGroupsPartII/E45: misprint

[Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689): Remark 2.4.3(a) and display (2.4.5), arXiv v3 pp. 16–17.

(Res_{Õ/O}𝒢̃)^Γ ↪ (Res_{Õ/O}GL(Λ̃))^Γ in both places, followed by the closed immersion into GL(Λ̃).

The Weil restriction is from Õ to O; restriction from Õ to Õ is the identity and the Γ-fixed points must be taken after restriction.

Correction status: new.

### ReductiveGroupsPartII/E46: gap

[Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149): Corollaries 4.2.12 (second sentence) and 4.2.13 with proof, arXiv v3 p. 56 (IHÉS p. 188).

Assume that the stabilizer group scheme 𝒢_x has connected special fibre (𝒢 = 𝒢°); then Lang's theorem applies over every F_q (RG2.3/smooth-model-torsors). For the lifting alone it suffices that H^1(F_q, π_0(𝒢_{F_q})) = 0.

Equality of the level with the parahoric subgroup does not make the special fibre of the stabilizer scheme connected; Lang's theorem fails for disconnected groups (H^1(F_q, ℤ/2) ≠ 0).

Correction status: Kisin–Pappas–Zhou 2026, §1.3 and Theorem 7.1.3(3) work under the connected-special-fibre hypothesis.

### ReductiveGroupsPartII/E47: misprint

[Pol van Hoften (Appendix A by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*](https://arxiv.org/abs/2010.10496): §2.2.5, arXiv v4 p. 15 (published p. 12).

The standard Iwahori subgroup is contained in a very special parahoric subgroup (the parahoric of a σ-stable very special vertex in the closure of the base alcove).

Parahorics of facets in the closure of an alcove contain the Iwahori of the alcove; a very special parahoric is a maximal parahoric and is strictly larger than the Iwahori when W_0 ≠ 1.

Correction status: new.

### ReductiveGroupsPartII/E48: error

[Jeffrey D. Adler, *Refined anisotropic K-types and supercuspidal representations*](https://msp.org/pjm/1998/185-1/pjm-v185-n1-p01-p.pdf): Proposition 1.4.1, printed p. 9; proof on p. 10.

Keep the identity for r>0. At r=0 assert it for unramified extension of connected parahorics, or add a condition that excludes extra component classes after extension. Keep the Lie-lattice identity for all real depths.

At odd residue characteristic take the ramified quadratic norm-one torus T. Its K-parahoric T(K)₀ has index two in T(K), and −1 is outside it. Over the ramified splitting field K′ the torus is G_m and −1 belongs to O_{K′}^×, its depth-zero parahoric. Thus intersection at depth zero contains −1. The proof on p. 10 checks the torus only for r>0.

Correction status: new.

## Bibliography and editions

The target citations use these editions and their stated pagination. Public links identify the sources; access restrictions and the reviewed-extraction basis of the Pilloni example are explicit.

- **`bt-classiques`.** [François Bruhat, Jacques Tits, *Schémas en groupes et immeubles des groupes classiques sur un corps local*](http://www.numdam.org/item/10.24033/bsmf.2006.pdf). Bulletin de la Société Mathématique de France 112 (1984), 259–301 (Numdam scan). Locators used: §3.6–§3.12 (printed pp. 288–290); §1, Proposition 1.8, p. 267; §2, Theorem 2.11, p. 283.

- **`bt1`.** [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*](http://www.numdam.org/item/10.1007/BF02715544.pdf). Publications mathématiques de l’IHÉS 41 (1972), 5–251 (Numdam scan). Locators used: 1.3–1.4 (pp. 19–28); 6.1–6.3 (pp. 107–132); 7.2 (pp. 161–163); 9.2 (pp. 204–209); 10.2 (pp. 234–251, skimmed); §7.4.1–7.4.21, printed pp. 170–176; §10.2.1–10.2.9, pp. 234–239.

- **`bt2`.** [François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*](http://www.numdam.org/item/10.1007/BF02700560.pdf). Publications mathématiques de l’IHÉS 60 (1984), 5–184 (Numdam scan). Locators used: 1.5.1–1.5.16 (pp. 26–31); 4.1 (pp. 77–88); 4.2.1–4.2.23 (pp. 88–100); 5.1.1–5.1.25 (pp. 145–155); Annexe (pp. 169–172); §1.2.1–1.2.13, printed pp. 16–20; §1.7.1–1.7.6, pp. 37–39; §2.2.1–2.2.7, pp. 44–46; §4.4.12–4.4.18, pp. 110–114; §4.6.1–4.6.3, pp. 123–125; §4.6.12–4.6.33, pp. 129–138; §5.2.1–5.2.11, pp. 162–166.

- **`casselman`.** [W. Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf). Draft of 1 May 1995 (notes revised by the Séminaire Paul Sally); author copy. Locators used: sections cited at the node locators.

- **`cesnavicius-19`.** [Kęstutis Česnavičius, *Purity for the Brauer group*](https://arxiv.org/abs/1711.06456). arXiv:1711.06456v4 (2018); Duke Mathematical Journal 168 (2019), no. 8, 1461–1486. Locators used: Lemma 2.1 (p. 3); Remark 6.3 (p. 14).

- **`conrad-adelic`.** [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf). L’Enseignement Mathématique 58 (2012), 61–97; author copy. Locators used: §2 Proposition 2.1, Examples 2.2–2.4 (pp. 2–3); §3 Proposition 3.1, Remarks 3.2–3.3 (pp. 3–5); §4 discussion before Theorem 4.5 (pp. 11–12); Example 2.4 (p. 3).

- **`edixhoven-92`.** [Bas Edixhoven, *Néron models and tame ramification*](http://www.numdam.org/item/CM_1992__81_3_291_0.pdf). Compositio Mathematica 81 (1992), 291–306 (Numdam scan). Locators used: §3 (pp. 293–294); §4 (pp. 295–297); Proposition 3.4 (printed p. 294).

- **`fintzen-21`.** [Jessica Fintzen, *Types for tame p-adic groups*](https://arxiv.org/abs/1810.04198). arXiv:1810.04198v2 (3 November 2020); Annals of Mathematics 193 (2021), no. 1, 303–346. Locators used: §3 (arXiv v2 pp. 8–12); §4 Lemma 4.4–Def. 4.5 (pp. 16–17); Lemma 5.1 and proof (pp. 18–19); Thm 6.1 proof start (p. 22); Lemma 7.1, Cor. 7.2 (p. 26).

- **`gleason-lim-xu-26`.** [Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2208.07195). arXiv:2208.07195v3; Inventiones mathematicae 243 (2026), 805–861. Locators used: §§1.1–2 set-up; Lemma 5.10 input (as recorded in the reviewed extraction); §2.1; Lemma 6.5 (arXiv v3 p. 44); Prop. 6.9 and proof (pp. 48–49); Lemma 4.12, arXiv v3 pp. 26–27; Theorem 4.11 proof and (4.13), p. 26.

- **`haines-dualities`.** [Thomas J. Haines, *Dualities for root systems with automorphisms and applications to non-split groups*](https://arxiv.org/abs/1604.01468). arXiv:1604.01468v2 (2018); Representation Theory 22 (2018), 1–26. Locators used: Theorems A–B, pp. 2–3; §3, pp. 5–7; §5, pp. 11–13; §6.1, pp. 13–14 (arXiv v2).

- **`haines-rapoport`.** [Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*](https://www.math.umd.edu/~tjh/HRParahoric3.pdf). Appendix to G. Pappas and M. Rapoport, Twisted loop groups and their affine flag varieties, Advances in Mathematics 219 (2008), 118–198; author copy. Locators used: introduction, Proposition 3, Lemmas 5–6, Definition 7, Proposition 8 (pp. 1–4); Prop. 3 and proof, Rem. 4, Prop. 8, Rem. 11, Lemmas 14 and 17 (pp. 1–9).

- **`harpaz-wittenberg-20`.** [Yonatan Harpaz, Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://arxiv.org/abs/1802.09605). arXiv:1802.09605v2 (2019); Journal of the American Mathematical Society 33 (2020), no. 3, 775–805. Locators used: §1.1 (p. 6), §4 (p. 15) as recorded in the reviewed extraction.

- **`he-18`.** [Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*](https://arxiv.org/abs/1610.04791). arXiv:1610.04791v3 (2018); Forum of Mathematics, Pi 6 (2018), e2. Locators used: §4.2–4.3 (pp. 11–13); §1.1, §6.1, Lemma 16; §4.1–§4.4, Lemmas 4.5–4.7 (arXiv v3 pp. 11–14).

- **`he-21`.** [Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*](https://arxiv.org/abs/2001.03325). arXiv:2001.03325v1 (2020); Forum of Mathematics, Pi 9 (2021), e9. Locators used: §2.1 (p. 4); §2.1.

- **`kaletha-16`.** [Tasho Kaletha, *Rigid inner forms of real and p-adic groups*](https://arxiv.org/abs/1304.3292). arXiv:1304.3292v5 (2015); Annals of Mathematics 184 (2016), no. 2, 559–632. Locators used: §3.1, equations (3.1)–(3.2), arXiv v5 p. 10; Lemma 4.2 and its proof, arXiv v5 pp. 16–17.

- **`kisin-17`.** [Mark Kisin, *Mod p points on Shimura varieties of abelian type*](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf). Journal of the American Mathematical Society 30 (2017), 819–914; 99-page author copy, whose page numbering is used here. Locators used: §1.2.1–§1.2.4, author copy pp. 12–13 (read via public author PDF).

- **`kisin-pappas-18`.** [Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*](https://arxiv.org/abs/1512.01149). arXiv:1512.01149v3 (2018); Publications mathématiques de l’IHÉS 128 (2018), 121–218. Locators used: §1.3.8 (p. 142); §§1.1.2–1.1.11 (arXiv v3 pp. 6–10); §1.3 incl. Prop. 1.3.3, 1.3.8–1.3.13 (pp. 16–20); Cor. 4.2.12–4.2.13, Rem. 4.2.14 (pp. 56–57); Lemma 4.6.2 (p. 64).

- **`kisin-pappas-zhou-26`.** [Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*](https://arxiv.org/abs/2409.03689). arXiv:2409.03689v3; Forum of Mathematics, Pi 14 (2026), e14. Locators used: §2.1–§2.4 (arXiv v3 pp. 10–17); Lemma 6.1.2 (p. 65); §6.2.1–Thm 6.2.3 (pp. 69–71); Lemmas 7.2.11–7.2.14 (pp. 84–85).

- **`kisin-zhou-25`.** [Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*](https://arxiv.org/abs/2103.09945). arXiv:2103.09945v2 (2024); Annals of Mathematics 202 (2025), no. 3, 1077–1156. Locators used: §2.1 (as recorded in the reviewed extraction; arXiv text available); §2.3.1 (arXiv v2 p. 11); §2.4.1 (p. 12); §2.4.7–Prop. 2.4.13 (pp. 15–18); Lemma 5.2.5, Cor. 5.2.7 (pp. 52–53).

- **`lipnowski-tsimerman-18`.** [Michael Lipnowski, Jacob Tsimerman, *How large is A_g(F_q)?*](https://arxiv.org/abs/1511.02212). arXiv:1511.02212v1 (2015); Duke Mathematical Journal 167 (2018), no. 18, 3403–3453. Locators used: §5.4.2 (arXiv v1 pp. 28–29).

- **`milne-iag`.** [J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*](https://www.jmilne.org/math/CourseNotes/iAG200.pdf). Version 2.00 (20 December 2015), preliminary version of the book (Cambridge University Press, 2017); numbering differs from the book. Locators used: §12.5, equation (65), p. 184; Proposition 12.27 and Corollary 12.29, pp. 191–192 (v2.00); §2.h, 2.35–2.39 (pp. 50–51); Lemmas 14.38–14.39 (p. 238); §27 Finite fields: Prop. 27.54, Cor. 27.55–27.56 and Notes (v2.00 pp. 487–488).

- **`milne-isv`.** [J. S. Milne, *Introduction to Shimura Varieties*](https://www.jmilne.org/math/xnotes/svi.pdf). Revised 16 September 2017 (numbering as in the published version, Clay Math. Proc. 4 (2005)). Locators used: §2, p. 26.

- **`pappas-rapoport-twisted`.** [Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag varieties*](https://arxiv.org/abs/math/0607130). arXiv:math/0607130v2 (2008); Advances in Mathematics 219 (2008), 118–198. Locators used: §2.a (pp. 10–11).

- **`prasad-17`.** [Gopal Prasad, *Finite group actions on reductive groups and buildings and tamely-ramified descent in Bruhat–Tits theory*](https://arxiv.org/abs/1705.02906). arXiv:1705.02906v5 (2018); American Journal of Mathematics 142 (2020), 1239–1267. Locators used: sections cited at the node locators.

- **`richarz`.** [Timo Richarz, *On the Iwahori–Weyl group*](https://arxiv.org/abs/1310.4635). arXiv:1310.4635v1 (2013); Bulletin de la Société Mathématique de France 144 (2016), 117–124. Locators used: §1.1.

- **`stacks`.** [The Stacks Project Authors, *The Stacks Project, Section 97.11 (Tag 05Y8, Restriction of scalars) and Tag 05YF*](https://stacks.math.columbia.edu/tag/05Y8). online, read 2026-10-09. Locators used: Section 97.11 (Tag 05Y8), Tag 05YF.

- **`vanhoften-24`.** [Pol van Hoften (Appendix A by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*](https://arxiv.org/abs/2010.10496). arXiv:2010.10496v4 (2024); Forum of Mathematics, Pi 12 (2024), e20. Locators used: App. A.1, A.3; §§2.2.1–2.2.6 (arXiv v4 pp. 13–15).

- **`zhu-17`.** [Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*](https://arxiv.org/abs/1407.8519). arXiv:1407.8519v3 (2016); Annals of Mathematics 185 (2017), no. 2, 403–492. Locators used: §1.4.1 (p. 426); §0.5.

- **`anantharaman-73`.** [S. Anantharaman, *Schémas en groupes, espaces homogènes et espaces algébriques sur une base de dimension 1*](https://www.numdam.org/item/MSMF_1973__33__5_0.pdf). Mémoires de la SMF 33 (1973), 5–79; published Numdam scan. Locators used: §4, Theorems 4.A–4.D, printed pp. 53–54; quotient argument §4.2.

- **`prasad-yu-06`.** [Gopal Prasad, Jiu-Kang Yu; appendix by Brian Conrad, *On quasi-reductive group schemes*](https://math.stanford.edu/~conrad/papers/qrg.pdf). Author copy of J. Algebraic Geom. 15 (2006), 507–549; author-copy pagination and numbering used. Locators used: Corollary 1.3, author-copy p. 2; Lemma 4.1 and proof, pp. 7–8.

- **`pappas-rapoport-24`.** [Georgios Pappas, Michael Rapoport, *On tamely ramified G-bundles on curves*](https://api.algebraicgeometry.nl/Article/20757/2024-6-024.pdf). Algebraic Geometry 11 (2024), no. 6, 796–829; published PDF. Locators used: Propositions 2.7–2.8, Remark 2.9 and proofs, printed pp. 802–805.

- **`adler-98`.** [Jeffrey D. Adler, *Refined anisotropic K-types and supercuspidal representations*](https://msp.org/pjm/1998/185-1/pjm-v185-n1-p01-p.pdf). Pacific J. Math. 185 (1998), no. 1, 1–32; published PDF. Locators used: §1.1, pp. 4–5; §1.4, pp. 9–11; §§1.5–1.6, pp. 11–17.

- **`buzzard-gee`.** [Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*](https://arxiv.org/pdf/1009.0785v3). arXiv:1009.0785v3 (2015); pagination of this version. Locators used: §2.1, arXiv v3 pp. 4–5; §4.1, pp. 22–24.

- **`pilloni-20`.** [Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*](https://doi.org/10.1215/00127094-2019-0075). Duke Math. J. 169 (2020), no. 9, 1647–1807; §5.1.1 author-copy p. 20 inspected through reviewed extraction, matrix checked directly. Locators used: §5.1.1, author-copy p. 20: reviewed extraction PAPER-PILLONI-20/gsp4-self-dual-root-datum and its E20; direct integral matrix verification here.

- **`tits-79`.** [Jacques Tits, *Reductive groups over local fields*](https://doi.org/10.1090/pspum/033.1/546588). Proc. Sympos. Pure Math. 33, Part 1 (1979), 29–69; maintainer-cleared copy read without extracting or reproducing passages. Locators used: §1.10, printed pp. 35–37 (hyperspecial points and extension).

- **`steinberg-65`.** [Robert Steinberg, *Regular elements of semi-simple algebraic groups*](https://www.numdam.org/article/PMIHES_1965__25__49_0.pdf). Publications Mathématiques de l’IHÉS 25 (1965), 49–80; published Numdam scan. Locators used: Theorem 1.9, p. 51; §10, pp. 78–79.

- **`calegari-geraghty-18`.** [Frank Calegari and David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*](https://math.uchicago.edu/~fcale/papers/CG.pdf). Inventiones Mathematicae 211 (2018), 297–433; author-hosted publisher PDF. Locators used: Remark 9.7 and preceding tree/amalgam discussion, publisher PDF pp. 121–122.
