# Reductive algebraic groups, Part II: local structure and arithmetic models

A root datum alone gives neither a building nor a parahoric group scheme. This roadmap takes a connected reductive group over a nonarchimedean local field `E` (and over the completion `Ĕ` of its maximal unramified extension) and builds the structures that local representation theory, Shimura varieties with parahoric level, local shtukas and geometric Satake need: the topology on rational points, Weil restriction and the Deligne torus, valued root data and apartments, the Bruhat–Tits building with its group action, integral models (Bruhat–Tits, parahoric, Néron, hyperspecial), the Iwasawa, Cartan and Iwahori–Bruhat decompositions with their double-coset combinatorics, and the integral dual group with its L-group. It extends the [Reductive groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md), which remains the owner of everything unvalued: group schemes as Hopf algebras and their functors of points, representations, Lie algebras, subgroups and quotients, tori and diagonalizable groups, unipotent radicals, reductivity, the structure theory of layer 7 (maximal split tori, relative and absolute root data with Galois action, root subgroups, parabolic and Levi subgroups, Bruhat decomposition and BN-pairs) and the pinned Chevalley–Demazure groups over `ℤ` of layer 9. Nothing in those layers is rebuilt here; every target below that needs them cites the layer.

The layers are:

| Layer | Material |
| --- | --- |
| RG2.0 | Topologies on rational points; integral points, congruence subgroups; the completed maximal unramified extension `Ĕ` |
| RG2.0a | Weil restriction of affine schemes and groups along finite locally free maps; norm tori; the Deligne torus |
| RG2.1 | Root data in a group, valuations, apartments, affine roots, the affine Weyl group; `π₁(G)`, z-extensions, the Kottwitz homomorphism |
| RG2.2 | The Bruhat–Tits building: axioms, metric, fixed points, facets and fixers, descent and functoriality, lattice-chain models, the tree of `SL_2` |
| RG2.3 | Smooth affine and reductive models, Néron models of tori, Bruhat–Tits and parahoric group schemes, hyperspecial vertices, Moy–Prasad filtrations, Lang's theorem, level subgroups |
| RG2.4 | The Iwahori–Weyl group; Iwahori–Bruhat, Cartan and Iwasawa decompositions; double cosets, indices and admissible sets; unimodularity |
| RG2.5 | The dual based root datum, the Langlands dual group over `ℤ`, its Galois action, the L-group and its functoriality |

[Suggested.lean](Suggested.lean) proposes signatures in the existing Lean vocabulary. This document specifies the mathematics; the suggested forms are aids to choosing names and interfaces, not an exhaustive checklist. Every object below comes with the API lemmas its consumers need and with unit tests that a wrong definition would fail; every theorem is stated with its exact hypotheses, its source by theorem, section and page, and its prerequisites in Mathlib, in Tau Ceti, in an earlier target of this roadmap, or in a layer of a Tau Ceti roadmap. In a target's "Requires" line a backticked name is a Mathlib or Tau Ceti declaration (Tau Ceti names begin with `TauCeti.`), an italicized slug is an earlier target (of the same layer when no layer is given), and "ReductiveGroups layer 7" names a layer of the roadmap of that name. API and test names are given relative to the namespace in parentheses; where a definition has more than three unit tests in Suggested.lean, three are printed.

## Scope and prerequisites

Mathlib supplies nonarchimedean local fields with their valuative relation and the compactness of closed balls, henselian rings, topological groups and open subgroups, module topologies, uniform completions, root pairings with their Weyl groups, bases and flips, Coxeter systems with length, double cosets, semidirect products, amalgamated products, Haar measures, lattices in modules over a DVR, smooth and étale algebras, absolute Galois groups, Hilbert 90, and schemes with their morphism properties. Tau Ceti supplies commutative Hopf algebras as affine group schemes with their convolution groups of points and points functors, the general linear and multiplicative groups with their point comparisons, split tori and diagonalizable groups with their character lattices and pairings, Hopf ideals, smoothness and reductivity predicates, the unipotent radical, the centre, faithfully flat descent of points, the normalized valuation and unit filtration of a local field, and pro-p groups. Tau Ceti also already has the maximal unramified extension of a local field with its Frobenius (`TauCeti.maximalUnramifiedExtension`, `TauCeti.maximalUnramifiedFrobenius`), pinnings of split groups (`TauCeti.Pinning`), Borel subgroups (`TauCeti.IsBorel`), dynamic parabolic subgroups with their Levi decompositions (`TauCeti.Dynamic.parabolic`, `TauCeti.Dynamic.levi`), central isogenies (`TauCeti.IsCentralIsogeny`), simply connected semisimple groups, root-datum isogenies (`TauCeti.RootPairingIsogeny`), the flip of a based root pairing (`RootPairing.Base.flipSupportEquiv`) and Tits systems with the Bruhat decomposition (`TauCeti.TitsSystem`). This roadmap extends those objects; it never redefines them, and no target below restates one of them.

Five Tau Ceti roadmaps are cited by layer. The [Reductive groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md) supplies the functor of points and the three-way dictionary (layer 0), Lie algebras and the adjoint representation (layer 2), identity components, quotients and exact sequences (layer 3), character modules of groups of multiplicative type with Galois action (layer 4), unipotent radicals (layer 5), reductivity and semisimplicity with simply connected covers and central isogenies (layer 6), the structure theory (layer 7) and the pinned Chevalley–Demazure group schemes over `ℤ` with their isomorphism theorem (layer 9). The [Local fields and ramification roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalFieldsRamification/README.md) supplies finite extensions and the extension of the valuation (layer 0), the maximal unramified extension with its Frobenius (layer 2), and tame ramification (layer 3). The [Modular curves roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md), layer 0F, supplies the affine finitely presented Hom scheme along a finite locally free map, which RG2.0a extends to arbitrary affine targets and records compatibility with. The [Root systems roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/RootSystems/README.md) supplies Coxeter combinatorics for a general Coxeter system (layer 3) and chambers with the fundamental domain (layer 4). The [Profinite and pro-p groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ProfiniteProPGroups/README.md), layer 3, supplies pro-p groups, and the [Class field theory roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md), layer 9, the local Weil group for the Weil form of the L-group.

Boundaries. RG2.0 owns the point topology on `X(R)` for every topological ring `R` and every scheme locally of finite type, including the adelic case used by AdelicAlgebraicGroups; it does not own adeles, Haar measures on restricted products or arithmetic quotients. RG2.0a owns restriction of scalars for affine schemes along finite locally free maps and its field specialization, with affine representability only; non-affine Weil restrictions, projective parameter spaces and algebraic spaces lie outside this roadmap. RG2.1 owns valued structure only; the unvalued relative root system and the absolute root datum with Galois action are the Reductive groups roadmap's. RG2.3 is the single owner in Tau Ceti of Lang's theorem for connected smooth groups over finite fields, of the Moy–Prasad filtrations and of the parahoric group schemes; it does not own affine Grassmannians, local models or Schubert varieties. RG2.4 owns the decompositions of `G(E)` and the Iwahori–Weyl combinatorics up to admissible sets; the Hecke algebras, Satake isomorphism and smooth representations built on them belong to the representation-theoretic roadmaps that cite this one. RG2.5 owns the dual group, its Galois action and the L-group as group functors with their functoriality; spaces of Langlands parameters, Weil–Deligne parameters and the moduli of L-parameters are not part of this roadmap. Types for tame groups (Adler–Roche forms, tameness of tori), z-embeddings and central pushouts `G ×_Z T`, and the identification of the affine Grassmannian embeddings of Zhu, are deliberately not here; they belong to later roadmaps which cite RG2.2–RG2.5.

## Conventions

Let `K` be a field complete (or henselian) for a nontrivial discrete valuation `ω`, normalized by `ω(ϖ) = 1` for a uniformizer `ϖ`, with valuation ring `O`, maximal ideal `m` and perfect residue field `κ`. The two instances used throughout are a nonarchimedean local field `E` (`κ` finite of order `q`, `|ϖ| = q^{-1}`, `p = char κ`) and `L = Ĕ`, the completion of the maximal unramified extension of `E` (residue field an algebraic closure of `κ`), with arithmetic Frobenius `σ` and `E = L^σ`. `O^sh` is the strict henselization of `O`, `K^sh` its fraction field; `I` is the inertia group. Mixed characteristic is assumed only where stated.

An affine group scheme over a commutative ring `R` is a commutative Hopf `R`-algebra `H`; its points over an `R`-algebra `A` form the Tau Ceti convolution group `WithConv (H →ₐ[R] A)`, written `G(A)`. Smoothness, connectedness and reductivity are hypotheses where stated, never assumptions on every affine group. "Connected reductive over a field" is the predicate of the Reductive groups roadmap, layer 6.

For a connected reductive `K`-group `G`: `S` is a maximal `K`-split torus, `Z = Z_G(S)` its centralizer (the minimal Levi; a torus iff `G` is quasi-split), `N = N_G(S)`, `W_0 = N(K)/Z(K)` the relative Weyl group, `Φ = Φ(G,S)` the relative root system (possibly non-reduced; `a` is multipliable when `2a ∈ Φ`), `U_a` the root subgroups, and `V = X_*(S) ⊗ ℝ`. The apartment `A = A(G,S,K)` is an affine space under `V`; its reduced version is the quotient by `V_Z = X_*(A_G) ⊗ ℝ`, where `A_G` is the maximal split central torus. The torus valuation map is normalized by `⟨χ, v(z)⟩ = −ω(χ(z))` for `χ ∈ X^*_K(Z)` and `z ∈ Z(K)`, and `z` acts on `A` by the translation `v(z)`; the Kottwitz homomorphism of `G_m` is `ω` itself, so the two differ by a sign on split tori. A valuation of a root datum is a family `φ = (φ_a)_{a ∈ Φ}` of functions `U_a(K) → ℝ ∪ {∞}` in the sense of Bruhat–Tits; affine roots are the functions `a + k`; `U_{a,x}` is the filtration subgroup at `x ∈ A`.

The building `B(G,K)` is the enlarged building unless the reduced one is named; apartments are the `G(K)`-translates of `A`. A parahoric subgroup is the group of integral points of the *connected* Bruhat–Tits group scheme `𝒢°_F` of a facet `F` (over `E`: the `σ`-fixed points of the parahoric over `L`); the fixer scheme `𝒢_F` and the stabilizer of `F` can be larger. Hyperspecial subgroups exist only for unramified groups. Over `L`, `π₁(G) = X_*(T)/Q^∨` (Borovoi), `κ_G : G(L) → π₁(G)_I` is the Kottwitz homomorphism, and the Iwahori–Weyl group is `W̃ = N(K)/Z(K)_0` with `Z(K)_0` the unique parahoric subgroup of `Z(K)`. The length function on `W̃` is zero exactly on the stabilizer `Ω` of the base alcove.

The dual group `Ĝ` is the pinned split reductive group over `ℤ` whose based root datum is the flip of that of `G`, and `ᴸG = Ĝ ⋊ Γ` with `Γ` acting through pinned automorphisms with finite image. No square root of `q` is part of the integral dual data; the normalizations of Satake transforms are coefficient choices of the consumers.

Source locators give the theorem or section and the page; for arXiv versions the page numbers are those of the stated arXiv version, for Numdam scans those printed in the journal. Derivations from a source's special case are identified as such.

## RG2.0 — Topologies on rational points

The point topology on `X(R)` is defined for every topological ring `R` and every affine `R`-scheme as the coarsest topology making all coordinate evaluations continuous, then glued over affine charts for schemes locally of finite type. For a nonarchimedean local field `E` it makes `G(E)` a locally compact, Hausdorff, second countable topological group, makes the integral points of an affine model a compact open subgroup, and makes the congruence kernels of a smooth model a neighbourhood basis of the identity. The layer also constructs the completion `Ĕ` of the maximal unramified extension with its Frobenius. AdelicAlgebraicGroups AA.0–AA.1 and the smooth-representation and Shimura-level consumers import exactly these objects under these names: the evaluation topology on `WithConv (H →ₐ[E] R)` (`PointTopology.instTopologicalSpaceWithConv`), the instances `T2Space`, `LocallyCompactSpace` and `SecondCountableTopology` on the local points of a finite-type Hopf algebra, `PointTopology.isTopologicalGroup`, the compact open integral points (`PointTopology.isOpenEmbedding_integralPoints`, `compactSpace_integralPoints`) and the congruence subgroups `CongruenceSubgroup.subgroup`. Two traps are built into the tests: the unit group of a topological ring with the subspace topology need not be a topological group (the adeles), so `G_m` carries the hyperbola topology; and `GL_n(O)` is the group of matrices with unit determinant, not the integral matrices with nonzero determinant.

### RG2.0.1 — The point topology

- **The topology on points of an affine algebra.** A a commutative k-algebra, R a topological k-algebra (no finiteness, no Hausdorff): point topology on X(R) = Hom_k(A, R) = coarsest with all ev_a : f ↦ f(a) continuous = subspace topology from R^A; on WithConv (H →ₐ R) transported along the identity.

  API (in `PointTopology`): `topology` — initial topology of all ev_a on Hom_k(A, R); `continuous_eval` — ev_a : f ↦ f(a) continuous for every a ∈ A; `continuous_iff` — g continuous iff every ev_a ∘ g is; `isEmbedding_toPi` — f ↦ ⇑f : Hom_k(A, R) → (A → R) an embedding; `instTopologicalSpaceWithConv` — topology on WithConv induced by ofConv; `continuous_ofConv` — ofConv a continuous embedding.

  Tests: `polynomial_homeomorph` — A = k[t]: f ↦ f(t) is a homeomorphism Hom_k(k[t], R) ≅ R; `discrete_of_discrete` — R discrete, A of finite type: Hom_k(A, R) discrete; `units_hyperbola` (non-example) — Hom(ℤ[t,t⁻¹], ℚ_p) = ℚ_p^× ⊂ ℚ_p as subspace; fails over adeles (inversion discontinuous).

  Sources: [Conrad], Prop. 2.1, p. 2; [Conrad], §3, pp. 3–4. Requires: ReductiveGroups layer 0; `MvPolynomial.continuous_eval`.

- **Presentations give embeddings into affine space.** (a_i)_{i∈I} generating A: x ↦ (x(a_i)) embeds Hom_k(A, R) in R^I; R T1, I finite: image closed (zero locus of ker(k[t_i] ↠ A)), so topology = that of any finite presentation; R T2 loc. compact, A finite type: X(R) loc. compact.

  Sources: [Conrad], Prop. 2.1 and its proof, p. 2. Requires: *affine-point-topology*; `MvPolynomial.continuous_eval`.

- **Functoriality of the point topology.** (1) B → A: continuous Hom(A,R) → Hom(B,R); embedding if onto, closed if R T1. (2) continuous R → R': continuous Hom(A,R) → Hom(A,R'); (open/closed) embedding if R → R' is, A finite type. (3) homeomorphisms Hom(A ⊗_k B, R) ≅ product, Hom(A ⊗_C B, R) ≅ fibre product, Hom_k(A,R) ≅ Hom_{k'}(k' ⊗_k A, R), R over k'.

  Sources: [Conrad], Prop. 2.1, pp. 2–3; [Conrad], Examples 2.2–2.3, p. 3. Requires: *affine-point-topology*; *affine-point-topology-embedding*.

- **Localizations give open embeddings.** R^× open, inversion continuous on R^×, f ∈ A: Hom_k(A_f, R) → Hom_k(A, R) open embedding, image {x : x(f) ∈ R^×}. Both hypotheses needed: Hom(k[t,t⁻¹], 𝔸) → Hom(k[t], 𝔸) is no embedding.

  Sources: [Conrad], §3 and proof of Prop. 3.1, pp. 3–4. Requires: *affine-point-topology-functoriality*.

- **The topology on points of a scheme locally of finite type.** X loc. finite type/k; R local, R^× open, inv. cont.: R-points land in affine opens U containing the closed point's image, so X(R) = ⋃_U U(R); unique topology with each U(R) open in its affine point topology: cover-independent, functorial, affine-compatible.

  API (in `SchemePointTopology`): `topology` — X(R) topology: R local, R^× open, inv cont; `isOpenEmbedding_affineOpen` — U(R) → X(R) open embedding, U affine open; `iUnion_affineOpens` — X(R) = ⋃ U(R) over affine opens U (R local); `affine_eq` — X = Spec A: the affine point topology; `continuous_map` — X → Y induces continuous X(R) → Y(R); `isClosedEmbedding_of_isClosedImmersion` — closed immersion ⇒ closed embedding (R T2).

  Tests: `projectiveLine_compactSpace` — ℙ¹(E) is compact for E a nonarchimedean local field; `affine_compat` — For affine X the scheme topology equals the affine point topology; `not_iUnion_of_nonlocal` (non-example) — R = E × E (not local): ℙ¹(R) is not the union of the two standard charts' R-points.

  Sources: [Conrad], Prop. 3.1, p. 4. Requires: *affine-point-topology-open-immersion*; `AlgebraicGeometry.Scheme`.

- **Chart independence and functoriality for schemes.** Same R: maps ↦ continuous; open immersions ↦ open embeddings, closed ↦ embeddings (closed, R T2); fibre products preserved; X separated, R T2: X(R) T2.

  Sources: [Conrad], Prop. 3.1 and Rem. 3.3, pp. 4–5. Requires: *scheme-point-topology*; *affine-point-topology-functoriality*.

### RG2.0.2 — Local fields: the topological group of points

- **Points over a local field are locally compact and Hausdorff.** X separated loc. f.t./E: X(E) T2, loc. compact, tot. disconnected; affine f.t.: closed in E^n, σ-compact, 2nd countable. 𝒳 loc. f.t./O: 𝒳(O) loc. compact; affine f.t.: compact. ℝ, ℂ: all but tot. disc.

  Sources: [Conrad], Rem. 3.2, p. 4. Requires: *scheme-point-topology-functoriality*; *affine-point-topology-embedding*; `IsNonarchimedeanLocalField`; `IsNonarchimedeanLocalField.isCompact_closedBall`.

- **The topological group of rational points.** R a topological k-algebra (no Hausdorff): G(R) is a topological group; Hopf H' → H and continuous R → R' give continuous homomorphisms G(R) → G'(R), G(R) → G(R'); H finite type: G(E) T2, locally compact, totally disconnected.

  Sources: [Conrad], Prop. 2.1, discussion after the statement, p. 2. Requires: *affine-point-topology-functoriality*; *points-locally-compact-hausdorff*; `TauCeti.AlgHom.instGroup`; `TauCeti.HopfAlgebra.pointsFunctor`.

- **GL_n: point topology equals the units topology.** R a topological commutative ring, n ≥ 0: GeneralLinear.pointsMulEquiv, GL_n points (point topology) → GL (Fin n) R (units topology of M_n(R), g ↦ (g, g^{-1})), is a homeomorphism. Over O: GL_n(O) = {g ∈ M_n(O) : det g ∈ O^×}, compact open in GL_n(E); diag(ϖ, 1) not integral.

  Sources: [Conrad], §3, p. 3 (G_m as the hyperbola xy = 1); [Conrad], Ex. 2.3, p. 3. Requires: *points-topological-group*; *integral-points-compact-open*; `TauCeti.GeneralLinear.pointsMulEquiv`; `Units.isEmbedding_embedProduct`; `Matrix.isUnit_iff_isUnit_det`.

- **Smooth morphisms are open on local points.** K complete (nontrivial abs. value), X' → X smooth, loc. finite type: X'(K) → X(K) open. Smooth surjective G → G' (affine finite type/K): G(K) → G'(K) open, open image, compact open subgroups of G(E) ↦ compact open.

  Sources: [Conrad], §4, paragraph before Thm 4.5, pp. 11–12. Requires: *scheme-point-topology-functoriality*; *points-topological-group*.

### RG2.0.3 — Integral points and congruence subgroups

- **Integral points of an affine model are compact open.** A_O finitely generated/O, 𝒳 = Spec A_O, X = Spec(A_O ⊗_O E): 𝒳(O) → X(E) open and closed embedding, compact image; A_O flat: image {x : x(a) ∈ O ∀ a} (or generators). 𝒢 affine finite type/O: 𝒢(O) compact open in G(E).

  Sources: [Conrad], Ex. 2.3, p. 3; [Conrad], Rem. 3.2, p. 4. Requires: *affine-point-topology-functoriality*; *affine-point-topology-embedding*; `IsNonarchimedeanLocalField`; `IsNonarchimedeanLocalField.isCompact_closedBall`.

- **Congruence subgroups of an integral group model.** O complete DVR, maximal ideal m, 𝒢 affine O-group of finite type: 𝒢(O)_n := ker(𝒢(O) → 𝒢(O/m^n)), n ≥ 0; normal in 𝒢(O), decreasing, 𝒢(O)_0 = 𝒢(O), ⋂_n 𝒢(O)_n = 1; O = 𝒪[E]: each compact open in G(E).

  API (in `CongruenceSubgroup`): `subgroup` — 𝒢(O)_n as a subgroup of 𝒢(O); `mem_iff` — x ∈ 𝒢(O)_n iff x ≡ 1 mod m^n; `normal` — 𝒢(O)_n is normal in 𝒢(O); `antitone` — n ≤ m implies 𝒢(O)_m ≤ 𝒢(O)_n; `zero_eq_top` — 𝒢(O)_0 = 𝒢(O); `isOpen` — 𝒢(O)_n open in G(E), E local; `map` — Hopf 𝒢 → 𝒢' maps 𝒢(O)_n into 𝒢'(O)_n.

  Tests: `generalLinear_eq` — GL_k over O: 𝒢(O)_n ↔ {g ∈ GL_k(O) : g ≡ 1 mod ϖ^n} under pointsMulEquiv; `multiplicative_eq_unitFiltration` — G_m over 𝒪[E], n ≥ 1: 𝒢(O)_n ↔ Tau Ceti's unitFiltration n; `not_mem_of_det_nonunit` (non-example) — diag(1 + ϖ, 1) ∈ 𝒢(O)_1 \ 𝒢(O)_2 for GL_2, so 𝒢(O)_1 ≠ 𝒢(O)_2.

  Sources: [He 2018], §4.2, p. 12; [Conrad], Ex. 2.3, p. 3. Requires: *integral-points-compact-open*; `TauCeti.HopfAlgebra.pointsFunctor`; `TauCeti.unitFiltration`.

- **Congruence subgroups form a neighbourhood basis.** 𝒢 affine finite type/O, generic fibre G: 𝒢(O)_n compact open, normal in 𝒢(O), a basis at 1 in G(E); so G(E) locally profinite, every compact open K ⊂ G(E) contains some 𝒢(O)_n of finite index, [K : K'] < ∞ for compact open K' ⊂ K; any such O-model works.

  Sources: [Conrad], Prop. 2.1 and Ex. 2.3, pp. 2–3; [He 2018], §4.2, p. 12. Requires: *congruence-subgroup*; *points-topological-group*; *affine-point-topology-embedding*.

- **Reduction and congruence quotients of smooth models.** O complete DVR, residue field κ, 𝒢 smooth affine O-group: (1) 𝒢(O) → 𝒢(O/m^n) onto, n ≥ 1; (2) 𝒢(O)_n/𝒢(O)_{n+1} ≅ Lie(𝒢_κ) ⊗_κ m^n/m^{n+1}, n ≥ 1; (3) κ finite, order q, char p: these quotients elementary abelian of order q^{dim 𝒢_κ}, 𝒢(O)_1 pro-p, 𝒢(O)/𝒢(O)_1 ≅ 𝒢_κ(κ).

  Sources: [He 2018], §4.3, proof of Lem. 4.5, p. 13; [Milne AG], §10 and §12 (Lie algebras of algebraic groups), Version 2.00. Requires: *congruence-neighbourhood-basis*; `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`; `IsNonarchimedeanLocalField`; ReductiveGroups layer 2; ProfiniteProPGroups layer 3.

### RG2.0.4 — The completed maximal unramified extension

- **The completed maximal unramified extension Ĕ.** L = Ĕ = completion of E^ur ⊂ E^sep (unique valuation): complete, discretely valued by ω_E (ϖ stays a uniformizer), O_L = completion of O_{E^ur}, residue field an algebraic closure κ̄ of κ; Frobenius extends to continuous σ ∈ Aut(L), σ(x) ≡ x^q mod m_L on O_L, L^σ = E, O_L^σ = O_E; mixed char: O_L ≅ W(κ̄) ⊗_{W(κ)} O_E; trdeg_E L = ∞.

  API (in `MaxUnramifiedCompletion`): `Breve` — the field Ĕ attached to E; `frobenius` — continuous arithmetic Frobenius σ ∈ Aut_E(Ĕ); `frobenius_congr` — x ∈ O_Ĕ: σ(x) − x^q ∈ m_Ĕ; `fixedPoints_frobenius` — {x ∈ Ĕ : σ x = x} = image of E; `residueField_isAlgClosed` — residue field of Ĕ algebraically closed; `isUniformizer_algebraMap` — a uniformizer of E is one of Ĕ; `completeSpace` — Ĕ complete for its valuation uniformity; `transcendenceDegree_infinite` — Ĕ of infinite transcendence degree over E.

  Tests: `padic_witt` — E = ℚ_p: O_Ĕ ≅ W(F̄_p) compatibly with Frobenius; `ramificationIndex_one` — Ĕ/E has ramification index 1: normalized valuation of Ĕ restricts to that of E; `not_algebraic` (non-example) — Ĕ not algebraic over E (so not E^ur itself).

  Sources: [He 2021], §2.1, p. 4; [He 2018], §4.3, p. 12; [Gleason–Lim–Xu], Lem. 5.10 and its input (Chen, Prop. 2.0.3), §5. Requires: `UniformSpace.Completion`; `IsNonarchimedeanLocalField`; `WittVector.isDiscreteValuationRing`; LocalFieldsRamification layer 2; LocalFieldsRamification layer 0; `TauCeti.maximalUnramifiedExtension`; `TauCeti.maximalUnramifiedFrobenius`.

- **Rational points as Frobenius fixed points.** X = Spec A, A finite type/E: σ acts continuously on X(L) = Hom_E(A, L), x ↦ σ ∘ x; X(E) = X(L)^σ closed; finite type O-model 𝒳: 𝒳(O) = 𝒳(O_L)^σ; groups: G(E) = G(L)^σ topologically, σ acting continuously.

  Sources: [He 2018], §4.3, p. 12; [Gleason–Lim–Xu], §§1.1–2 (local reductive datum). Requires: *completed-maximal-unramified-extension*; *affine-point-topology-functoriality*; *points-topological-group*.

## RG2.0a — Weil restriction and the Deligne torus

Restriction of scalars along a finite locally free ring map `k → k'` is defined on affine `k'`-schemes by its functor of points `R ↦ Hom_{k'}(A', k' ⊗_k R)`, represented by an explicit `k`-algebra built from a basis of `k'` over `k` (finite type and finite presentation are inherited; no projective or non-affine Weil restriction is asserted anywhere in this roadmap). The layer proves the adjunction with base change, compatibility with products, composition and base change, transport of Hopf structures, the splitting over a separable extension, the descent of smoothness, connectedness, reductivity and the torus property for finite separable field extensions, the character lattices of Weil-restricted tori, norm-one tori, the compatibility of the point topology with RG2.0, Weil restriction of integral models, Edixhoven's tame fixed-point theorem, and the Deligne torus `S = Res_{C/R} G_m` with its weight and norm conventions. AdelicAlgebraicGroups AA.1 and the Shimura-datum consumers import the functor `WeilRestriction.functor`, the representing algebra `WeilRestriction.Res`, the point adjunction `WeilRestriction.homEquiv`, the Hopf structure `WeilRestriction.instHopfAlgebraRes` with its point comparison `WeilRestriction.pointsMulEquiv` and the Deligne torus from here.

### RG2.0a.1 — The functor and its representing algebra

- **The Weil restriction functor of an affine scheme.** k → k' a ring map, A' a k'-algebra, X' = Spec A': Res_{k'/k}(X') is the functor R ↦ Hom_{k'}(A', k' ⊗_k R) = X'(k' ⊗_k R) on commutative k-algebras, contravariant in A'; representable by an affine k-scheme if k → k' is finite locally free (needed only there).

  API (in `WeilRestriction`): `functor` — CommAlgCat k ⥤ Type, R ↦ A' →ₐ[k'] k' ⊗[k] R; `functor_obj` — obj R = (A' →ₐ[k'] k' ⊗[k] R) definitionally; `functor_map_apply` — (map f) x = (id ⊗ f) ∘ x; `functorMap` — B' → A' induces functor A' ⟶ functor B'; `functor_compat_modularCurves` — A' f.p.: the ModularCurves 0F functor over k'; `functorBaseChangeIso` — on l-algebras: functor(A' ⊗_{k'} (k' ⊗_k l)).

  Tests: `functor_affineLine` — A' = k'[t]: points over R ↔ k' ⊗_k R via x ↦ x(t); `functor_trivial_extension` — k' = k: naturally isomorphic to the functor of points R ↦ Hom_k(A', R); `functor_not_base_change` (non-example) — k = ℝ, k' = ℂ, A' = ℂ[t]: ℝ-points are ℂ, not ℝ (those of ℝ[t]); Res ≠ base change.

  Sources: [Stacks], § 97.11 (Tag 05Y8), definition of Res_{Z/B}(X); [Bruhat–Tits II], 1.5.2, pp. 26–27; [Milne AG], 2.35–2.36, p. 50. Requires: ModularCurves layer 0F; ReductiveGroups layer 0; `CommAlgCat`; `Algebra.TensorProduct.map`.

- **The representing algebra of a Weil restriction.** For any A': a k-algebra Res_{k'/k} A' with k'-map u : A' → k' ⊗_k Res A', φ ↦ (id ⊗ φ) ∘ u a bijection Hom_k(Res A', R) ≅ Hom_{k'}(A', k' ⊗_k R) natural in R (unique up to unique iso). Build: A' = Sym_{k'}(k' ⊗_k M)/I, M a k-module; Res A' = Sym_k((k')^∨ ⊗_k M)/I^♮, (k')^∨ = Hom_k(k', k), I^♮ = ((λ ⊗ id)(j(x)) : λ ∈ (k')^∨, x ∈ I), j : Sym_{k'}(k' ⊗ M) → k' ⊗_k Sym_k((k')^∨ ⊗ M) universal. A' f.p.: Spec(Res A') = ModularCurves 0F scheme.

  API (in `WeilRestriction`): `Res` — the representing k-algebra Res_{k'/k} A'; `universal` — universal k'-map u : A' → k' ⊗_k Res A'; `homEquiv` — Hom_k(Res A', R) ≃ Hom_{k'}(A', k' ⊗_k R); `homEquiv_naturality` — homEquiv natural in R; `map` — B' → A' induces Res B' → Res A', functorially; `hom_ext` — maps Res A' → R equal if equal via homEquiv; `basisPresentation` — k' free: Res k'[X]/(P) ≃ k[Y_{ij}]/(coords P); `res_compat_modularCurves` — f.p.: Spec Res A' = ModularCurves 0F scheme.

  Tests: `res_affineLine_free` — k' free of rank d with basis: Res_{k'/k}(k'[t]) ≃ MvPolynomial (Fin d) k; `res_self` — Res_{k/k} A' ≃ A'; `res_not_flat` (non-example) — flat affine O'-scheme, O' finite free over a complete DVR O, may have non-flat Res.

  Sources: [Bruhat–Tits II], 1.5.1–1.5.7 and 1.5.10, pp. 26–29; [Stacks], Tag 05YF (§ 97.11, Proposition); [Česnavičius], Lem. 2.1, p. 3. Requires: *weil-restriction-functor*; ModularCurves layer 0F; `CategoryTheory.Functor.RepresentableBy`; `Algebra.TensorProduct.basis`; `Module.Dual`.

- **Finiteness and coordinates of a Weil restriction.** A' finite type (f.p.) ⇒ Res A' too; k noetherian: finite type suffices. k' free of rank d with basis: Res k'[X_1..X_n] = k[Y_{ij}] (i ≤ d, j ≤ n), basis change = invertible linear substitution, so Res A^n_{k'} ≅ A^{nd}_k. k'/k finite separable: Res A¹ = A^d, Res G_m = A^d ∖ {norm form = 0}.

  Sources: [Bruhat–Tits II], 1.5.8 and 1.5.10, pp. 28–29; [Milne AG], Lem. 14.38, p. 238; [Harpaz–Wittenberg], §1.1, p. 6. Requires: *weil-restriction-representing-algebra*; `Algebra.FiniteType`; `Algebra.FinitePresentation`; `Algebra.norm_eq_matrix_det`.

- **Base change, composition and products of Weil restrictions.** Natural isos respecting universal maps: (1) (Res A') ⊗_k l ≅ Res_{l'/l}(A' ⊗_{k'} l'), l' = k' ⊗_k l; (2) Res_{k'/k} ∘ Res_{k''/k'} = Res_{k''/k} (k'' f.l.f./k'); (3) Res(A' ⊗_{k'} B') ≅ Res A' ⊗_k Res B', Res k' = k, Res preserves fibre products. (2) associative; (1) commutes with (2), (3).

  Sources: [Bruhat–Tits II], 1.5.3–1.5.4, p. 27; [Milne AG], 2.38–2.39, p. 51; [Zhu], §1.4.1, p. 426. Requires: *weil-restriction-representing-algebra*; `Algebra.TensorProduct.assoc`; `Algebra.TensorProduct.cancelBaseChange`.

- **Weil restriction is right adjoint to base change.** Res is right adjoint to k' ⊗_k − (schemes: base change ⊣ Res): Hom_{k'}(A', k' ⊗_k B) ≅ Hom_k(Res A', B) natural in A', B; counit u ((Res X')_{k'} → X'), unit Res(k' ⊗_k B) → B (diagonal X → Res X_{k'}, x ↦ 1 ⊗ x); triangle identities. k' faithfully flat/k: unit a closed immersion; for groups the diagonal G → Res G_{k'} behind norm, reflex norm.

  Sources: [Milne AG], 2.37–2.38, pp. 50–51; [Kisin–Pappas], §1.3.8, (1.3.10), p. 142. Requires: *weil-restriction-representing-algebra*; `TauCeti.AlgHom.faithfullyFlatDescentMulEquiv`.

### RG2.0a.2 — Weil restriction of group schemes

- **Weil restriction of an affine group scheme.** H' commutative Hopf/k' (G'): Res_{k'/k} H' is uniquely a commutative Hopf k-algebra with Res(G')(R) ≅ G'(k' ⊗_k R) a group iso natural in R; Hopf maps induce Hopf maps; base-change, composition, product isos are Hopf; points of Res G_m, GL_n, μ_n: (k' ⊗ R)^×, GL_n(k' ⊗ R), μ_n(k' ⊗ R).

  API (in `WeilRestriction`): `instHopfAlgebraRes` — Res_{k'/k} H' a commutative Hopf k-algebra; `pointsMulEquiv` — Res(G')(R) ≃* G'(k' ⊗_k R), natural in R; `pointsMulEquiv_naturality` — pointsMulEquiv natural in R; `mapHopf` — functorial Hopf map Res H'_1 → Res H'_2; `multiplicativeGroupPoints` — (Res G_m)(R) = (k' ⊗_k R)^×; `generalLinearPoints` — (Res GL_n)(R) = GL_n(k' ⊗_k R); `diagonal` — Hopf map G → Res_{k'/k}(G_{k'}), the unit.

  Tests: `res_multiplicative_complex_points` — ℝ-points of Res_{ℂ/ℝ} G_m are ℂ^× with its multiplication; `res_trivial_group` — Res_{k'/k} of the trivial Hopf algebra k' is the trivial Hopf algebra k; `res_not_commutative_of_commutative_base` (non-example) — Res_{ℂ/ℝ} GL_2 not commutative: its ℝ-points GL_2(ℂ) are nonabelian.

  Sources: [Bruhat–Tits II], 1.5.4, p. 27; [Milne AG], 2.36, p. 50; [Kaletha], §3.1, p. 10. Requires: *weil-restriction-base-change*; `TauCeti.AlgHom.instGroup`; `CommHopfAlgCat`; `TauCeti.MultiplicativeGroup.pointsMulEquiv`; `TauCeti.GeneralLinear.pointsMulEquiv`.

- **Weil restriction preserves smoothness and immersions.** Res_{k'/k} preserves formally smooth, smooth, étale, surjective (closed immersions); localizations A' → A'_f ↦ open immersions; k'/k finite field extension, X' finite type: dim Res X' = [k' : k] dim X'; flatness not preserved.

  Sources: [Bruhat–Tits II], 1.5.8–1.5.12, pp. 28–29; [Česnavičius], Lem. 2.1, p. 3. Requires: *weil-restriction-representing-algebra*; *weil-restriction-finiteness*; `Algebra.FormallySmooth`; `Algebra.Smooth`.

- **Splitting of a Weil restriction over a separable extension.** k'/k finite separable, Ω ⊃ normal closure of k'/k: Ω ⊗_k Res_{k'/k} A' ≅ ⨂_{τ : k' → Ω} (Ω ⊗_{k',τ} A') over Ω (τ over k), i.e. (Res X')_Ω ≅ ∏_τ X'_{τ,Ω}; σ ∈ Aut(Ω/k), semilinear on the left, maps τ-factor to στ-factor via σ. Groups: iso of group schemes, Galois permuting factors; ℂ/ℝ: (Res X')_ℂ ≅ X' × X'^c, conjugation swapping.

  Sources: [Bruhat–Tits II], 1.5.14–1.5.16, pp. 30–31; [Milne AG], 2.h, pp. 50–51, and Lem. 14.39, p. 238; [Harpaz–Wittenberg], §1.1, p. 6. Requires: *weil-restriction-base-change*; `Algebra.FormallyEtale.equivPiOfIsSepClosed`; `AlgHom.card`.

- **Weil restriction of reductive groups.** k'/k separable, G' affine finite type: Res G' smooth/geom. connected/reductive/semisimple/torus iff G' is; Z, der. group commute with Res; relative roots = G'’s, multiplicities × [k' : k] (S = split part of Res S'). Insep. degree p: Res G_m smooth, connected, not reductive (R_u of dim p − 1).

  Sources: [Bruhat–Tits II], 1.5.14, pp. 30–31; [Milne AG], 2.h, p. 50, and Lem. 14.38, p. 238; [Česnavičius], §2, Lem. 2.1, p. 3. Requires: *weil-restriction-separable-splitting*; *weil-restriction-smoothness-and-immersions*; `TauCeti.reductiveCommHopfAlgProperty`; `TauCeti.torusCommHopfAlgProperty`; ReductiveGroups layer 6; ReductiveGroups layer 7.

- **Character lattices of Weil-restricted tori.** k'/k separable; D' mult. type/k', X^* = M': Res D' mult. type, X^* = Ind_{Γ_{k'}}^{Γ_k} M' = ℤ[Γ_k] ⊗_{ℤ[Γ_{k'}]} M' (= coinduced); tori: X_*(Res T') ≅ Ind X_*(T'), pairing-compatible. So X^*(Res G_m) = ℤ[Hom_k(k', k^sep)], X^*(Res μ_n) = (ℤ/n)[same] (permutation modules).

  Sources: [Milne AG], Lem. 14.39, p. 238; [Kaletha], §3.1, p. 10. Requires: *weil-restriction-separable-splitting*; `TauCeti.CommHopfAlgCat.geometricCharacterGroup`; `TauCeti.DiagonalizableGroup.pairing`; ReductiveGroups layer 4.

- **Norm maps and norm-one tori.** k → k' rank d: Nm : Res_{k'/k} G_m → G_m = algebra norm (k' ⊗_k R)^× → R^× on points; kernel R^1 G_m (norm-one group). k'/k finite separable: R^1 G_m a torus of dim d − 1, X^* = coker(diag ℤ → ℤ[Hom_k(k', k^sep)]), X_* = augmentation kernel; Nm ∘ unit = x ↦ x^d on G_m; Res μ_n / diag μ_n has X^* = augmentation kernel of (ℤ/n)[Hom_k(k', k^sep)].

  API (in `NormTorus`): `norm` — Hopf map inducing Algebra.norm on points; `norm_points` — Nm(x) = Algebra.norm R x, x ∈ (k' ⊗_k R)^×; `normOne` — R^1_{k'/k} G_m, the kernel Hopf ideal of Nm; `norm_comp_diagonal` — Nm ∘ diagonal = d-th power on G_m; `normOne_isTorus` — k'/k separable: R^1 G_m a torus of dim d − 1; `characterGroup_normOne` — X^*(R^1 G_m) = ℤ[Hom(k',k^sep)]/ℤΣτ, Γ-equiv; `resRootsOfUnityQuotient` — Res μ_n / diag μ_n; X^* = augmentation kernel.

  Tests: `norm_complex` — ℂ/ℝ: Nm(x + iy) = x² + y² on ℝ-points; `norm_trivial_extension` — k' = k: Nm = id of G_m, R^1 G_m trivial; `norm_not_surjective_points` (non-example) — ℂ/ℝ: Nm : ℂ^× → ℝ^× not surjective (no negatives), though surjective as a map of tori.

  Sources: [Česnavičius], Rem. 6.3, display (6.3.3), p. 14; [Kaletha], §3.1, (3.1), p. 10; [Milne AG], Lem. 14.38, p. 238. Requires: *weil-restriction-group-scheme*; *weil-restriction-character-lattices*; `Algebra.norm`.

- **Topology on points of a Weil restriction.** k' free with basis/k (or locally free via a presentation), A' finite type, R topological, k' ⊗_k R ≅ R^d via any basis: Res(A')(R) ≅ X'(k' ⊗_k R) a homeomorphism (point topologies). E'/E finite: Res X'(E) ≅ X'(E') homeomorphism (valuation topology on E' = product topology), of topological groups for groups.

  Sources: [Conrad], Ex. 2.4, p. 3. Requires: *weil-restriction-group-scheme*; RG2.0/*affine-point-topology-functoriality*; RG2.0/*points-topological-group*; `IsModuleTopology`.

- **Weil restriction of integral models.** O ⊂ O' finite free complete DVRs, K ⊂ K', 𝒳' affine/O': Res 𝒳' affine/O, gen. fibre Res_{K'/K} 𝒳'_{K'}, O-points 𝒳'(O'); f.t./smooth if 𝒳' is; groups: 𝒢'(O') ⊂ G'(K') = Res(G')(K); base change to O_L, étale O_1 commute; O'-semilinear Gal(K'/K)-actions on 𝒳' give O-linear ones on Res.

  Sources: [Kisin–Pappas], §1.3.8, (1.3.8)–(1.3.10), p. 142; [Kisin–Pappas–Zhou], §2.1.2; [Zhu], §1.4.1, p. 426. Requires: *weil-restriction-base-change*; *weil-restriction-smoothness-and-immersions*; RG2.0/*completed-maximal-unramified-extension*.

- **Edixhoven's tame fixed-point theorem.** O henselian, K'/K finite Galois, |Γ| ∈ O^×, O' int. closure, X smooth affine/O' with semilinear Γ-action: (Res_{O'/O} X)^Γ is a closed subscheme, smooth/O, generic fibre = descent of X_{K'}. T' split K'-torus, 𝒯' its Néron model: ((Res 𝒯')^Γ)^0 = connected Néron model of the descent.

  Sources: [Edixhoven], Props. 3.1 and 3.4, pp. 293–294; Prop. 4.1, Thm 4.2 and Ex. 4.3, pp. 295–297; [Kisin–Pappas], proof of Prop. 1.1.4, p. 129; proof of Prop. 1.3.9, p. 143; [Kisin–Pappas–Zhou], proof of Prop. 2.2.2, p. 11; Rem. 2.4.3(b), p. 15. Requires: *integral-weil-restriction*; *weil-restriction-smoothness-and-immersions*.

### RG2.0a.3 — The Deligne torus

- **The Deligne torus.** S := Res_{ℂ/ℝ} G_m = Spec ℝ[x,y,(x²+y²)^{-1}], z = x+iy; S(R) = (ℂ ⊗_ℝ R)^×, S(ℝ) = ℂ^× topologically. S_ℂ ≅ G_m × G_m (splitting) with S(ℝ) → S(ℂ) z ↦ (z,z̄); conj.: (z_1,z_2) ↦ (z̄_2,z̄_1) on S(ℂ), (p,q) ↦ (q,p) on X^*(S) = ℤ² (z_1^p z_2^q). Pinned: d : G_m → S, r ↦ r; w := d ∘ inv (Deligne), r ↦ r^{-1}; Nm : S → G_m, z ↦ z z̄, Nm ∘ d = squaring, ker Nm = U(1); μ : G_{m,ℂ} → S_ℂ, z ↦ (z,1).

  API (in `DeligneTorus`): `S` — Hopf ℝ-algebra Res_{ℂ/ℝ} ℂ[t, t⁻¹]; `pointsMulEquiv` — S(R) ≃* (ℂ ⊗_ℝ R)^×, natural in R; `realPointsMulEquiv` — S(ℝ) ≃* ℂ^×, a homeomorphism; `complexSplitting` — S_ℂ ≅ G_m × G_m with S(ℝ) → S(ℂ), z ↦ (z, z̄); `conj_swap` — conjugation on S(ℂ): (z_1,z_2) ↦ (z̄_2,z̄_1); `diagonal` — cocharacter d : G_m → S, d(r) = r on ℝ^×; `weight` — w = d ∘ inv, w(r) = r^{-1} (Deligne); `norm` — Nm : S → G_m, z ↦ z z̄; Nm ∘ d = squaring; `mu` — cocharacter μ : G_{m,ℂ} → S_ℂ, z ↦ (z, 1); `characterGroup` — X^*(S) ≅ ℤ², Gal(ℂ/ℝ) swapping coordinates.

  Tests: `norm_diagonal` — Nm(d(r)) = r² for r ∈ ℝ^×; `weight_eq_inv_diagonal` — w(r) = d(r)^{-1} for r ∈ ℝ^× (sign convention pinned); `not_split` (non-example) — not split: Gal(ℂ/ℝ) acts nontrivially on X^*(S); S(ℝ) = ℂ^× connected, (ℝ^×)² not.

  Sources: [Milne ISV], §2, 'Hodge structures as representations of S', p. 26. Requires: *norm-torus*; *weil-restriction-separable-splitting*; *weil-restriction-points-topology*; `TauCeti.MultiplicativeGroup.pointsMulEquiv`; `TauCeti.GL2NonSplitTorusHom`.

## RG2.1 — Relative roots and valued root data

Over a henselian discretely valued field `K` with perfect residue field, the rational points of a connected reductive group carry a generating root datum `(Z(K), (U_a(K))_{a ∈ Φ(G,S)})` in the sense of Bruhat–Tits, indexed by the relative roots of a maximal `K`-split torus `S` (the unvalued data: `S`, `Z = Z_G(S)`, `N`, `Φ(G,S)`, the root subgroups, parabolics and the absolute root datum with its Galois action are imported from the Reductive groups roadmap, layer 7). This layer defines valuations of such root data, their apartments (affine spaces under `V = X_*(S) ⊗ ℝ`), affine roots and root-group filtrations, proves the commutator estimates and the existence of a valuation compatible with the valuation of `K` (quasi-split groups by root-group coordinates, the general case by unramified descent from `Ĕ` using Steinberg's theorem), and builds the affine structure of the apartment: walls, alcoves and facets, the échelonnage root system, the affine Weyl group, the kernel and image of the action of `N(K)`, the Frobenius action over `Ĕ`, independence of choices, minuscule coweights. It also owns the arithmetic invariants used by every later layer: the algebraic fundamental group `π₁(G)`, z-extensions and their existence, and the Kottwitz homomorphisms `κ_T` and `κ_G : G(Ĕ) → π₁(G)_I`. The sign convention is fixed once: `z ∈ Z(K)` acts on the apartment by the translation `v(z)` with `⟨χ, v(z)⟩ = −ω(χ(z))`, while the Kottwitz homomorphism of `G_m` is `ω` itself.

### RG2.1.1 — Quasi-split forms and rational tori over Ĕ

- **Steinberg's theorem over the completed unramified field.** κ_L algebraically closed: H^1(L, H) = 1 (H connected smooth affine), reductive L-groups quasi-split, finite tame Galois L-extensions totally ramified cyclic, p ∤ order.

  Sources: [Bruhat–Tits II], 5.1.1, p. 145; [Kisin–Pappas], proof of Prop. 1.1.4, p. 128; [Haines–Rapoport], after Rem. 4, p. 2. Requires: RG2.0/*completed-maximal-unramified-extension*; ReductiveGroups layer 7; LocalFieldsRamification layer 3.

- **A rational maximal L-split torus.** G reductive over K: a K-rational maximal L-split torus S_L ⊃ S (maximal K-split) exists; T := Z_G(S_L) is a maximal K-torus; A(G_L, S_L) is σ-stable with a σ-stable alcove, A(G, S, K) = A(G_L, S_L)^σ.

  Sources: [Bruhat–Tits II], 5.1.10–5.1.13, pp. 149–150; [He 2021], §2.1, p. 4; [Gleason–Lim–Xu], §§1.1–2.1. Requires: *steinberg-quasi-split*; ReductiveGroups layer 7.

### RG2.1.2 — Root data in a group and their valuations

- **Generating root datum in an abstract group.** Φ a root system in V*, possibly non-reduced. Root datum of type Φ in G: T ≤ G, nontrivial U_a ≤ G, M_a ⊂ G with (DR1)–(DR6): [U_a, U_b] ⊂ ⟨U_{pa+qb} : p, q ≥ 1⟩ (a ∦ b); U_{2a} ⊂ U_a; M_a a right T-coset, U_{−a} ∖ 1 ⊂ U_a M_a U_a, M_a U_b M_a^{-1} = U_{s_a b}; T U^+ ∩ U^− = {1}. Generating: ⟨T, U_a⟩ = G. T normalizes U_a.

  API (in `BruhatTits`): `RootDatum` — (T, (U_a, M_a)_{a∈Φ}) with (DR1)–(DR6); `RootDatum.le_normalizer` — T normalizes each U_a; `RootDatum.commutator_le` — [U_a, U_b] ⊂ ⟨U_{pa+qb} : p, q ≥ 1⟩ (DR2); `RootDatum.le_of_root_eq_two_smul` — U_{2a} ⊂ U_a; `RootDatum.weylGroupEquiv` — N/T ≃ W(Φ), N := ⟨T, M_a⟩; `RootDatum.IsGenerating` — ⟨T, U_a : a ∈ Φ⟩ = G.

  Tests: `RootDatum.sl2` — Diagonal torus and both unipotent subgroups of SL_2(K): generating root datum of type A_1; `RootDatum.rankZero` — Φ = ∅: a root datum is just a subgroup T (e.g. G = T a torus); `RootDatum.not_of_trivial_U` (non-example) — U_a = {1} for some a violates (DR1): not a root datum.

  Sources: [Bruhat–Tits I], 6.1.1–6.1.2, pp. 107–110. Requires: RootSystems layer 4; `RootPairing`.

- **Rational points carry a root datum.** G reductive over a field K, Φ possibly non-reduced, m_a ∈ N(K) from the rank-one subgroups: (Z(K), (U_a(K), Z(K) m_a)) is a root datum of type Φ in G(K) generating G(K)^† := ⟨Z(K), U_a(K)⟩; N(K) normalizes it, N(K)/Z(K) = W_0.

  Sources: [Bruhat–Tits I], 6.1.3, pp. 108–110; [Bruhat–Tits II], 4.1.1–4.1.3, pp. 77–78. Requires: *root-datum-in-a-group*; ReductiveGroups layer 7.

- **Valuation of a root datum.** φ = (φ_a : U_a → ℝ ∪ {∞}) is a valuation if (V0)–(V5): |φ_a(U_a)| ≥ 3; U_{a,k} := φ_a^{-1}[k, ∞] ≤ U_a, U_{a,∞} = 1; u ↦ φ_{−a}(u) − φ_a(mum^{-1}) constant on U_{−a} ∖ 1, m ∈ M_a; [U_{a,k}, U_{b,l}] ⊂ ⟨U_{pa+qb,pk+ql} : p, q ≥ 1⟩ (a ∦ b); φ_{2a} = 2φ_a|U_{2a}; u'uu'' ∈ M_a (u ∈ U_a ∖ 1, u', u'' ∈ U_{−a}) ⇒ φ_{−a}(u') = −φ_a(u). ω-compatible: φ_a(zuz^{-1}) = φ_a(u) − ω(a(z)), z ∈ Z(K) (a extended, Z non-split).

  API (in `BruhatTits`): `Valuation` — φ = (φ_a : U_a → ℝ ∪ {∞}) with (V0)–(V5); `Valuation.filtration` — U_{a,k} = φ_a^{-1}[k, ∞]; `Valuation.filtration_antitone` — k ≤ l ⇒ U_{a,l} ⊂ U_{a,k}; `Valuation.valueSet` — Γ_a = φ_a(U_a ∖ {1}) ⊂ ℝ; `Valuation.shift` — (φ + v)_a = φ_a + a(v), v ∈ V; `Valuation.smul` — (n·φ)_a(u) = φ_{w^{-1}a}(n^{-1}un); `Valuation.IsCompatible` — φ_a(zuz^{-1}) = φ_a(u) − ω(a(z)), z ∈ Z(K); `Valuation.IsDiscrete` — each Γ_a discrete in ℝ.

  Tests: `Valuation.sl2_standard` — SL_2(K): φ_±(x_±(u)) = ω(u) is a valuation; (V5) from x_−(u^{-1})x_+(u)x_−(u^{-1}) ∈ M_a; `Valuation.shift_zero` — φ + 0 = φ; `Valuation.not_valuation_wrong_sign` (non-example) — SL_2: φ_+(x_+(u)) = ω(u), φ_−(x_−(u)) = −ω(u) violates (V5): not a valuation.

  Sources: [Bruhat–Tits I], Def. 6.2.1 and 6.2.2–6.2.4, pp. 116–120; [Bruhat–Tits II], 4.2.7–4.2.9, p. 91; [He 2018], §1.1, p. 6. Requires: *root-datum-in-a-group*.

- **The valuation homomorphism of the minimal Levi.** X^*_K(Z) ↪ X^*(S), finite cokernel: ⟨χ, v(z)⟩ = −ω(χ(z)), χ ∈ X^*_K(Z), gives a homomorphism v : Z(K) → V; ker v = Z(K)^1 = maximal bounded subgroup (compact, K local); im v = Λ, full lattice, Z(K)/Z(K)^1 ≅ ℤ^{dim S}; N(K) normalizes Z(K)^1, moves v by W_0.

  API (in `BruhatTits`): `torusValuationMap` — v : Z(K) → V, ⟨χ, v(z)⟩ = −ω(χ(z)); `torusValuationMap_apply_character` — ⟨χ, v(z)⟩ = −ω(χ(z)), χ ∈ X^*_K(Z); `boundedPart` — Z(K)^1 := ker v, maximal bounded; `boundedPart_isCompact` — K local ⇒ Z(K)^1 compact open in Z(K); `translationLattice` — Λ := v(Z(K)), a full lattice in V; `torusValuationMap_conj` — v(nzn^{-1}) = w(n)·v(z), n ∈ N(K).

  Tests: `torusValuationMap_split` — S = G_m^2, t = (ϖ, 1): v(t) = (−1, 0); `torusValuationMap_anisotropic` — S = 1: V = 0, v = 0, Z(K)^1 = Z(K); `torusValuationMap_not_injective_on_units` (non-example) — v is not injective: units of O give v = 0, so v is no faithful coordinate on Z(K).

  Sources: [Bruhat–Tits II], 4.2.5–4.2.7, pp. 90–91; 5.1.22, p. 154; [He 2018], §1.1, p. 6 (A8–A9 of the extraction, citing Tits 1979 §§1.2–1.3 and Richarz §1.1, p. 118); [Richarz], §1.1, p. 118 (arXiv p. 2). Requires: *rational-points-root-datum*; `Valuation`; ReductiveGroups layer 7.

- **The apartment of a valued root datum.** φ a valuation, Φ ⊂ V*: A(φ) := {φ + v : v ∈ V}, (φ + v)_a = φ_a + a(v), an affine space under V. ν : N → Aff(A), (n·φ)_a(u) = φ_{w^{-1}a}(n^{-1}un), has linear part the W(Φ)-action. For G(K), φ ω-compatible: Z(K) ∋ z translates by v(z); A = A(G, S, K), the enlarged apartment. U_{a,x,r} := {u : φ_a(u) + a(x − φ) ≥ r}, x ∈ A.

  API (in `BruhatTits`): `Apartment` — A(φ) = {φ + v : v ∈ V}; `Apartment.instAddTorsor` — A is an AddTorsor under V; `Apartment.vadd_def` — (v +ᵥ ψ)_a = ψ_a + a(v); `Apartment.action` — ν : N →* Aff(A); `Apartment.action_linear` — linear part of ν(n) = image of n in W(Φ); `Apartment.action_torus` — ν(z) = translation by v(z), z ∈ Z(K); `Apartment.filtrationAt` — U_{a,x,r}, x ∈ A, a ∈ Φ, r ∈ ℝ.

  Tests: `Apartment.sl2_reflection` — SL_2: the Weyl element acts on A ≅ ℝ by the reflection fixing the base valuation; `Apartment.rankZero_singleton` — Φ = ∅, V = 0: A is a point; `Apartment.not_linear_space` (non-example) — No canonical origin: pinnings give different base points; A ≅ V needs a special point.

  Sources: [Bruhat–Tits I], 6.2.5–6.2.6 and 6.2.10, pp. 120–123; [Bruhat–Tits II], 4.2.3 and 4.2.9, pp. 89–91; [He 2021], §2.1, p. 4. Requires: *valuation-of-root-datum*; *torus-valuation-map*.

- **Affine roots and root-group filtrations.** Γ_a := φ_a(U_a ∖ 1), Γ'_a := {φ_a(u) max on uU_{2a}}; affine roots α = a + k : x ↦ a(x − φ) + k, k ∈ Γ'_a; half-apartments {α ≥ 0}, walls {α = 0}; U_α := U_{a,k}, U_{a,k+} := ⋃_{l>k} U_{a,l}. Reductive: Γ_a = Γ'_a a coset of a discrete group (K_a's ramification) for a non-multipliable; else from SU_3, with Γ'_a ⊊ Γ_a possible (ramified). U_{a,x,r}/U_{a,x,r+} mod U_{2a} are κ-spaces.

  API (in `BruhatTits`): `AffineRoot` — α = a + k, a ∈ Φ, k ∈ Γ'_a, as a map on A; `AffineRoot.gradient` — the vector part a ∈ Φ of α; `AffineRoot.wall` — {α = 0} ⊂ A; `AffineRoot.rootSubgroup` — U_α = U_{a,k}; `AffineRoot.rootSubgroup_mono` — α ≤ β on A, same gradient ⇒ U_β ⊂ U_α; `AffineRoot.valueSet` — Γ_a and Γ'_a; `AffineRoot.filtrationAt_succ` — U_{a,x,r}/U_{a,x,r+} a κ-space (mod U_{2a}).

  Tests: `AffineRoot.sl2_affine_roots` — SL_2: affine roots ±a + n, n ∈ ℤ, and U_{a+n} = x_+(ϖ^n O); `AffineRoot.rootSubgroup_top` — U_{a,∞} = {1}; `AffineRoot.not_all_values` (non-example) — Ramified SU_3: Γ'_a ≠ Γ_a; using Γ_a as affine-root values adds spurious walls.

  Sources: [Bruhat–Tits I], 6.2.2–6.2.6, pp. 117–120; [Bruhat–Tits II], 4.2.20–4.2.23, pp. 97–99; [He 2018], proof of Lem. 16, pp. 17–18. Requires: *apartment*; *quasi-split-valuation*.

- **Commutator estimates for valued root groups.** (1) a ∦ b: [U_{a,x,r}, U_{b,x,s}] ⊂ ∏_{p,q≥1} U_{pa+qb,x,pr+qs}, any order. (2) r + s > 0: U_{a,x,r} U_{−a,x,s} ⊂ U_{−a,x,s} T^1 U_{a,x,r} (T^1 bounded torus part), also for U_{2a}. (3) z ∈ Z(K), n ∈ N(K): zU_{a,x,r}z^{-1} = U_{a,z·x,r}, nU_{a,x,r}n^{-1} = U_{w(a),ν(n)x,r}. Reductive: explicit Chevalley constants in G(K).

  Sources: [Bruhat–Tits I], 6.2.1 (V3), 6.3.1–6.3.11, pp. 117, 128–132; [Bruhat–Tits II], Annexe (Relations de commutation), pp. 169–172. Requires: *affine-roots-and-filtrations*; `TauCeti.GeneralLinear.commutatorElement_rootSubgroupPoints`.

### RG2.1.3 — Existence of the valued root datum

- **Root-group coordinates in quasi-split groups.** G quasi-split, Chevalley–Steinberg system fixed, K_a the splitting field of a. Case I (2a ∉ Φ): U_a ≅ Res_{K_a/K} G_a, x_a : K_a ≅ U_a(K). Case II (2a ∈ Φ): K_a/K_{2a} separable quadratic, U_a ≅ Res_{K_{2a}/K} U_0, U_0 ⊂ SU_3(K_a/K_{2a}) a Borel's unipotent radical, U_0(K_{2a}) = H_0 := {(u, v) : v + v̄ = uū}, x_a : H_0 ≅ U_a(K), x_a(0, v) ∈ U_{2a}. Rank-one: Res_{K_a/K} SL_2 resp. Res_{K_{2a}/K} SU_3. Other systems rescale x_a by K_a^× (II: explicit H_0 maps).

  API (in `BruhatTits.QuasiSplit`): `rootGroupCoord` — x_a : K_a ≅ U_a(K) (I) or H_0 ≅ U_a(K) (II); `H0` — H_0 = {v + v̄ = uū}, law (u+u', v+v'+ūu'); `rootField` — K_a (and K_{2a} in case II); `rootGroupCoord_conj_torus` — t x_a(u) t^{-1} = x_a(ã(t)u), t ∈ T(K); `rankOneSubgroup` — ⟨U_a, U_{−a}⟩: Res SL_2 (I) or Res SU_3 (II); `unitaryCoord` — I + c e_{0i} + d e_{−i,i} − τ(c) e_{−i,0}; `unitaryCoord_mem_iff` — u_i(c, d) ∈ SU_3 iff τ(c)c + d + τ(d) = 0.

  Tests: `H0_mul_assoc` — H_0 law is associative; (u,v)^{-1} = (−u, v̄), which again satisfies v̄ + v = uū; `split_case` — G split: every K_a = K, no root multipliable, x_a is the pinning of the split group; `not_additive_multipliable` (non-example) — H_0 non-commutative: (u,0), (u',0) commute only up to (0, ūu' − ū'u) ∈ U_{2a}, often ≠ 0.

  Sources: [Bruhat–Tits II], 4.1.1–4.1.13, pp. 77–84; [van Hoften], Appendix A.3.5–A.3.6, pp. 60–61. Requires: *rational-points-root-datum*; RG2.0a/*weil-restriction-group-scheme*; ReductiveGroups layer 7.

- **The valuation of a quasi-split group.** G quasi-split with coordinates x_a, ω_a extending ω to K_a: φ_a(x_a(u)) = ω_a(u) (I); φ_a(x_a(u, v)) = ½ω_a(v), φ_{2a}(x_a(0, v)) = ω_a(v) (II) give an ω-compatible valuation φ; Γ_a = ω_a(K_a^×) (I), explicit (II); other systems: equipollent valuations.

  Sources: [Bruhat–Tits II], 4.2.2–4.2.10, pp. 88–92. Requires: *quasi-split-root-group-coordinates*; *valuation-of-root-datum*.

- **Existence of the valued root datum.** G reductive over K: the root datum (Z(K), (U_a(K))) of G(K) has an ω-compatible valuation, unique up to equipollence (two differ by v ∈ V); other maximal split tori give G(K)-conjugate data. Holds for all G over E and Ĕ.

  Sources: [Bruhat–Tits II], 5.1.1, 5.1.20 and 5.1.23, pp. 145–155; [Bruhat–Tits II], Introduction, p. 7. Requires: *quasi-split-valuation*; *steinberg-quasi-split*; *rational-maximal-unramified-split-torus*; *apartment*.

- **Valuations and apartments under unramified extension.** K'/K unramified Galois (finite or completed maximal), S ⊂ S', K-rational maximal K'-split: φ on G(K) restricts from a Gal-invariant compatible φ' on G(K'): U_a(K) = (∏_{b↦a} U_b(K'))^{Gal}, φ_a = inf φ'_b; A(G, S, K) = A(G, S', K')^{Gal}, N(K) ⊂ N'(K') compatibly; affine roots = restrictions with gradient ≠ 0 on V.

  Sources: [Bruhat–Tits II], 5.1.16–5.1.21, pp. 151–154; [Bruhat–Tits I], 9.2.1–9.2.14, pp. 204–209. Requires: *valued-root-datum-existence*; *rational-maximal-unramified-split-torus*.

### RG2.1.4 — The affine structure of the apartment

- **Walls, alcoves and facets of the apartment.** φ discrete: walls H_α := {α = 0}, α affine roots; alcoves: components of A ∖ ⋃H_α; facets = classes of 'sgn α(x) = sgn α(y) ∀α' (0 allowed), relatively open convex polyhedra, F ≤ F' iff F ⊂ F̄'; vertices = minimal facets (reduced A); x special iff each a ∈ Φ (Σ-scaled) is a wall gradient at x. Enlarged facets = reduced ones × V_Z.

  API (in `BruhatTits`): `Facet` — facets of A as classes of points; `Facet.wall` — the set of walls H_α; `Facet.IsAlcove` — F is an alcove (open facet); `Facet.le` — F ≤ F' iff F ⊂ closure(F'); `Facet.le_iff` — F ≤ F' ≤ F iff F = F' (sign patterns); `Facet.IsSpecial` — every root direction is a wall direction at x; `Facet.locallyFinite` — bounded sets meet finitely many walls.

  Tests: `Facet.sl2_alcoves` — SL_2: alcoves are the open intervals between consecutive walls; `Facet.rankZero` — Φ = ∅: A has a single facet, itself an alcove; `Facet.not_special_barycentre` (non-example) — SL_2: the barycentre of an alcove lies on no wall, so it is neither special nor a vertex.

  Sources: [Bruhat–Tits I], 1.3.1–1.3.7, pp. 19–22; [Bruhat–Tits I], 7.2.1–7.2.7, pp. 161–163; [He 2021], §2.1, p. 4. Requires: *affine-roots-and-filtrations*; RootSystems layer 4.

- **The échelonnage root system.** φ discrete, Φ possibly non-reduced: wall gradients, rescaled by spacing, form a reduced root system Σ ⊂ V* (échelonnage): walls with gradient ∝ a are {a = k}, k in a ℤc_a-coset; Σ = {a/c_a}. Wall reflections generate W(Σ) ⋉ Q^∨(Σ). Σ ∝ Φ_red if G split, else maybe not (C_n vs B_n, BC_n). Dominant λ, λ' ∈ X_*(T)_I: λ ≤ λ' iff λ' − λ ∈ ℕ-span of Σ's positive coroots.

  API (in `BruhatTits`): `echelonnage` — Σ ⊂ V*, reduced root pairing of a discrete φ; `echelonnage_isReduced` — Σ is reduced; `echelonnage_proportional` — each α ∈ Σ ∝ some a ∈ Φ, and conversely; `echelonnage_walls` — x₀ special: walls = {α(x − x₀) ∈ ℤ}, α ∈ Σ; `echelonnage_split` — G split ⇒ Σ = Φ_red.

  Tests: `echelonnage_sl2` — SL_2: Σ = {±a}; `echelonnage_rank_zero` — Φ = ∅: Σ = ∅; `echelonnage_ne_relative` (non-example) — Ramified quasi-split U_{2n+1}: Σ is B_n, Φ_red is C_n; Σ := Φ_red gives the wrong W_a.

  Sources: [Bruhat–Tits I], 1.4.1–1.4.6, pp. 25–28; [Haines], §§1–2 and §5 (Bruhat–Tits échelonnage root system), arXiv v2; [van Hoften], Appendix A.1, p. 54. Requires: *affine-chamber-structure*; `RootPairing`; `RootPairing.IsReduced`.

- **The affine Weyl group.** W_a := ⟨wall reflections⟩ ⊂ Aff(A) (W_0-invariant metric), simply transitive on alcoves; (W_a, S_aff) Coxeter, type Σ_aff, S_aff = wall reflections of an alcove C; special origin: W_a = W(Σ) ⋉ Q^∨(Σ); W_a = ν⟨m(u) : 1 ≠ u ∈ U_a⟩ ⊲ ν(N(K)) = W_a ⋊ Stab(C).

  API (in `BruhatTits`): `AffineWeylGroup` — W_a = ⟨wall reflections⟩ ≤ Aff(A); `AffineWeylGroup.simpleReflections` — S_aff for a chosen alcove C; `AffineWeylGroup.coxeterSystem` — CoxeterSystem on W_a with generators S_aff; `AffineWeylGroup.simplyTransitive_alcoves` — W_a acts simply transitively on alcoves; `AffineWeylGroup.semidirect` — W_a ≅ W(Σ) ⋉ Q^∨(Σ) at a special origin; `AffineWeylGroup.normal_in_image` — W_a ⊲ ν(N(K)) = W_a ⋊ Stab(C).

  Tests: `AffineWeylGroup.sl2_infinite_dihedral` — SL_2: W_a infinite dihedral, s_0s_1 = translation by a primitive coroot; `AffineWeylGroup.rankZero_trivial` — Φ = ∅: W_a = 1; `AffineWeylGroup.not_all_of_N` (non-example) — PGL_2: ν(N(K)) ⊋ W_a, as diag(ϖ, 1) translates by a half-step, swapping vertex types.

  Sources: [Bruhat–Tits I], 1.3.1–1.3.8, pp. 19–22; [Bruhat–Tits I], 6.2.11, p. 123; [He 2021], §2.1, p. 4. Requires: *echelonnage-root-system*; RootSystems layer 3; `CoxeterSystem`.

- **Kernel and image of the action on the apartment.** ker ν = Z(K)^1; ν(N(K)) ≅ N(K)/Z(K)^1 extends W_0 by Λ (no splitting claimed); W_a ⊲ ν(N(K)) = W_a ⋊ Stab(C), C an alcove, Stab(C) f.g. abelian; = W_a for G s.c. semisimple.

  Sources: [Bruhat–Tits I], 6.2.10–6.2.11, pp. 122–123; [Richarz], §1.1, p. 118 (arXiv p. 2). Requires: *apartment*; *affine-weyl-group*; *torus-valuation-map*.

- **The Levi subgroup centralizing a vector of the apartment.** v ∈ V_ℚ (X_*(T)_I ⊗ ℚ over Ĕ): M_v := ⟨Z, U_a : ⟨a, v⟩ = 0⟩, Levi of v's K-parabolic; M_v = G iff v central; over Ĕ: E-rational iff ς(v) = v, ς the linear Frobenius.

  API (in `BruhatTits`): `leviOfVector` — M_v = ⟨Z(K), U_a(K) : ⟨a, v⟩ = 0⟩; `leviOfVector_eq_top_iff` — M_v = G iff ⟨a, v⟩ = 0 ∀ a ∈ Φ; `leviOfVector_smul` — M_{cv} = M_v, c ∈ ℚ_{>0}; `leviOfVector_conj` — nM_vn^{-1} = M_{w(n)v}, n ∈ N(K); `leviOfVector_descends` — σ(M_v) = M_{ς(v)}; σ-stable if ς(v) = v.

  Tests: `leviOfVector_gl3` — GL_3, v = (1, 1, 0): M_v = block-diagonal GL_2 × GL_1; `leviOfVector_zero` — M_0 = G; `leviOfVector_not_parabolic` (non-example) — M_v is not the parabolic of v: it omits the root groups with ⟨a, v⟩ > 0.

  Sources: [Kisin–Zhou], 2.1.6; [He 2018], §6.1, p. 21. Requires: *apartment*; *frobenius-action-on-apartment*; ReductiveGroups layer 7.

- **Affine Frobenius action on the apartment over Ĕ.** G over E, S_L E-rational maximal L-split: σ acts affinely on A_L := A(G_L, S_L, L), linear part ς = σ|X_*(T)_I ⊗ ℝ. σ-stable alcove C, special vertex x_0 ∈ C̄: unique w_0 ∈ W_0: σ_0 := w_0ς preserves C's dominant chamber at x_0; σ_0 is the quasi-split inner form's Frobenius. The x_0-splitting W̃ = X_*(T)_I ⋊ W_0 need not be σ-stable.

  API (in `BruhatTits`): `frobeniusOnApartment` — σ_A, the affine automorphism of A_L; `frobeniusOnApartment_linear` — linear part ς of σ_A on X_*(T)_I ⊗ ℝ; `frobeniusCorrection` — w_0 ∈ W_0: w_0ς keeps the dominant chamber; `frobeniusOnApartment_fixed` — A_L^{σ_A} = the apartment over E; `frobeniusOnApartment_alcove` — σ_A preserves the chosen σ-stable alcove.

  Tests: `frobeniusOnApartment_split` — G split over E: σ acts trivially on A_L; `frobeniusOnApartment_unitary` — Unramified quasi-split U_3: ς acts on X_*(T) = ℤ³ by (a, b, c) ↦ (−c, −b, −a); `frobeniusSplitting_not_equivariant` (non-example) — Non-quasi-split inner form: W̃ = X_*(T)_I ⋊ W_0 is not σ-stable.

  Sources: [Kisin–Zhou], 2.1.2–2.1.3; [Gleason–Lim–Xu], §2.1, (2.4)–(2.5). Requires: *rational-maximal-unramified-split-torus*; *apartment*; *unramified-descent-of-valuation*.

- **Independence of choices.** A, affine roots, walls, U_{a,x,r}, ν: canonically choice-free; (1) equipollent φ: translation of A, affine roots fixed; (2) S ↦ gSg^{-1}: Int(g), depends only on g mod N(K); (3) Chevalley–Steinberg systems: equipollent φ; (4) other S: G(K)-conjugate compatible φ.

  Sources: [Bruhat–Tits I], 6.2.5–6.2.12, pp. 120–125; [Bruhat–Tits II], 4.1.13, 4.2.10 and 4.2.13, pp. 84, 91–93. Requires: *valued-root-datum-existence*; *apartment*; ReductiveGroups layer 7.

- **Minuscule coweights and the dominance order.** Root datum Ψ with base: μ ∈ Y dominant: ⟨a, μ⟩ ≥ 0, a > 0; minuscule if ⟨a, μ⟩ ∈ {−1, 0, 1} ∀a; dominant λ ≤ μ iff μ − λ ∈ ℕ⟨simple coroots⟩; ρ := ½Σ_{a>0} a, ⟨2ρ, μ⟩ the dimension; μ_dom := dominant member of {μ}.

  API (in `BruhatTits`): `IsDominant` — ⟨a, μ⟩ ≥ 0 for all positive roots a; `IsMinuscule` — ⟨a, μ⟩ ∈ {−1, 0, 1} for all roots a; `dominanceLE` — λ ≤ μ iff μ − λ ∈ ℕ-span of simple coroots; `dominantRep` — μ_dom, the dominant element of W·μ; `twoRhoPairing` — ⟨2ρ, μ⟩.

  Tests: `IsMinuscule.gl_n_standard` — GL_n: (1, 0, …, 0) is minuscule, ⟨2ρ, (1,0,…,0)⟩ = n − 1; `IsMinuscule.zero` — 0 is minuscule and dominant; `IsMinuscule.not_double` (non-example) — GL_2: (2, 0) is dominant, not minuscule (⟨a, μ⟩ = 2).

  Sources: [Zhu], §0.5, p. 412; [Kisin–Pappas], §1.2 (minuscule representations), pp. 131–138. Requires: `RootPairing`; RootSystems layer 4; ReductiveGroups layer 7.

### RG2.1.5 — Arithmetic invariants: π₁, z-extensions and the Kottwitz homomorphism

- **The algebraic fundamental group.** G reductive over a field K, T ⊂ G_{K^sep} a maximal torus: π₁(G) := X_*(T)/Q^∨ (Q^∨ coroots), Γ_K acting via the absolute root datum; T-independent up to unique iso (Weyl acts trivially), functorial. π₁(G) = 0 iff G s.s. simply connected; π₁(G_der) finite, 0 iff G_der s.c.; central extension G̃ ↠ G by a torus Z: 0 → X_*(Z) → π₁(G̃) → π₁(G) → 0 exact. Over Ĕ: π₁(G)_I (with torsion), (π₁(G)_I)^σ, π₁(G)_Γ. Standard Levi M: ker(π₁(M) → π₁(G)) = span of G's simple coroots ∉ M.

  API (in `BruhatTits`): `AlgebraicFundamentalGroup` — π₁(G) = X_*(T)/Q^∨; `AlgebraicFundamentalGroup.galoisAction` — Γ_K-action from the absolute root datum; `AlgebraicFundamentalGroup.map` — G → G' with compatible tori ⇒ π₁(G) → π₁(G'); `AlgebraicFundamentalGroup.inertiaCoinvariants` — π₁(G)_I with its σ-action; `AlgebraicFundamentalGroup.torus` — π₁(T) = X_*(T) for a torus T; `AlgebraicFundamentalGroup.exact_central` — 0 → X_*(Z) → π₁(G̃) → π₁(G) → 0 (Z a torus); `AlgebraicFundamentalGroup.leviKernel` — ker(π₁(M) → π₁(G)) = ⟨simple coroots ∉ M⟩; `AlgebraicFundamentalGroup.weyl_invariant` — W acts trivially on X_*(T)/Q^∨.

  Tests: `AlgebraicFundamentalGroup.gl_n` — GL_n, diagonal torus: π₁ ≅ ℤ via (a_1, …, a_n) ↦ Σa_i; `AlgebraicFundamentalGroup.sl_n` — SL_n: π₁ = 0; `AlgebraicFundamentalGroup.not_cocharacters` (non-example) — π₁(SL_2) = 0 although X_*(T) = ℤ: π₁ is not the cocharacter lattice.

  Sources: [Pappas–Rapoport], §2.a.2, pp. 10–11; [Kaletha], Lem. 4.2; [van Hoften], proof of Prop. A.1.6, p. 57. Requires: ReductiveGroups layer 7; `RootPairing`.

- **z-extensions.** z-extension of G over a field K: G̃ ↠ G of reductive K-groups, central kernel an induced torus ∏ Res_{K_i/K} G_m, G̃_der simply connected.

  API (in `ZExtension`): `IsZExtension` — predicate on a homomorphism G̃ → G; `IsInducedTorus` — character module a permutation Γ_K-module; `surjective_points` — G̃(K') ↠ G(K') for every field K'/K; `fundamentalGroup_torsionFree` — π₁(G̃) is torsion-free; `comp_isZExtension_of_iso` — z-extension ∘ isomorphism is a z-extension.

  Tests: `gl2_pgl2` — GL_2 → PGL_2 is a z-extension with kernel the scalar G_m; `id_of_simplyConnected` — G_der simply connected: id_G is a z-extension; `sl2_pgl2_not` (non-example) — SL_2 → PGL_2 is not a z-extension: kernel μ_2 is not a torus.

  Sources: [Pappas–Rapoport], §2.a.2, Step 4, p. 11. Requires: RG2.0a/*weil-restriction-character-lattices*; *algebraic-fundamental-group*; ReductiveGroups layer 6; `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`; `TauCeti.IsCentralIsogeny`.

- **Existence of z-extensions.** G over a field K has a z-extension split by any finite Galois splitting K'/K; any z-extension, kernel Z: G̃(K') ↠ G(K') ∀K', 0 → X_*(Z) → π₁(G̃) → π₁(G) → 0 Γ_K-exact, π₁(G̃) torsion-free; K-tori: quotients of induced tori, same splitting field.

  Sources: [Pappas–Rapoport], §2.a.2, Steps 2 and 4, p. 11. Requires: *z-extension*; `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`; ReductiveGroups layer 6.

- **The Kottwitz homomorphism of a torus.** T an L-torus, κ_L algebraically closed: unique functorial κ_T : T(L) → X_*(T)_I, κ_{G_m} = ω, κ(ϖ) = 1; on Res_{L'/L} G_m, κ = ω_{L'} (L'-normalized); general T via induced resolutions. κ_T onto, ker = T(L)_0 := connected Néron model's O_L-points ⊂ T(L)^1 (max. bounded), T(L)^1/T(L)_0 ≅ (X_*(T)_I)_tors. T over E: κ_T σ-equivariant, T(E) ↠ (X_*(T)_I)^σ, kernel T(E)_0 := T(E) ∩ T(L)_0. Sign: v = −κ on split tori.

  API (in `KottwitzMap`): `torus` — κ_T : T(L) →* X_*(T)_I; `torus_surjective` — κ_T is surjective; `torus_multiplicative` — G_m: κ = ω, κ(ϖ) = 1; `torus_natural` — κ commutes with homomorphisms of tori; `torus_ker` — T(L)_0 ⊂ T(L)^1, quotient (X_*(T)_I)_tors; `IsBoundedPoints` — bounded: all coordinates of bounded valuation.

  Tests: `torus_gm` — κ_{G_m}(ϖ^n u) = n for u ∈ O_L^×; `torus_trivial` — T = 1: κ is the zero map; `torus_not_valuation_of_norm` (non-example) — T = Res_{L'/L} G_m, L'/L totally ramified, degree e: κ_T(ϖ_L) = e; κ_T(L^×) ⊂ eℤ ≠ ℤ.

  Sources: [Pappas–Rapoport], §2.a.2, Steps 1–2, pp. 10–11; [Haines–Rapoport], Prop. 3 proof (a), Lem. 5, pp. 2–3. Requires: *z-extension-existence*; RG2.0/*completed-maximal-unramified-extension*; *algebraic-fundamental-group*.

- **The Kottwitz homomorphism.** G reductive over L, κ_L algebraically closed: κ_G : G(L) → π₁(G)_I unique functorial, = κ_T on tori; G_der s.c.: κ_G = κ_D ∘ (G ↠ D := G/G_der); else κ_G(g) := image of κ_{G̃}(g̃), g̃ a z-extension lift. Onto; σ-equivariant over E; 0 on im G_sc(L) and on unipotents; G(L)_1 := ker κ_G ⊃ all parahorics; κ_G(G(E)) ⊂ (π₁(G)_I)^σ; or into X^*(Ẑ(G)^I).

  API (in `KottwitzMap`): `kottwitz` — κ_G : G(L) →* π₁(G)_I; `kottwitz_surjective` — κ_G is surjective; `kottwitz_natural` — κ is natural in reductive-group maps; `kottwitz_torus` — T a torus: κ_G = κ_T; `kottwitz_simplyConnected` — G_der s.c.: κ_G = κ_D ∘ (G → D), D = G/G_der; `kottwitz_sc_image` — κ_G = 0 on the image of G_sc(L); `kernel` — G(L)_1 := ker κ_G.

  Tests: `kottwitz_gl_n` — GL_n: κ(g) = ω(det g); `kottwitz_sl_n` — SL_n: π₁ = 0, κ trivial; `kottwitz_not_det_valuation` (non-example) — PGL_2: scalars shift ω∘det by 2ℤ, so only its class mod 2 is defined on PGL_2(L).

  Sources: [Pappas–Rapoport], §2.a.2, Steps 1–4, pp. 10–11; [Haines–Rapoport], introduction and (1), p. 1; [Kisin], §§1.2.1–1.2.2. Requires: *kottwitz-homomorphism-torus*; *z-extension-existence*; *algebraic-fundamental-group*; *steinberg-quasi-split*.

### RG2.1.6 — Examples

- **The valued root datum of SL_2 and PGL_2.** SL_2, T diagonal, a(diag(t, t^{-1})) = t²: φ_{±a}(x_±(x)) = ω(x) compatible. A ≅ ℝ, a^∨ ↦ 1: a(x) = 2x, affine roots ±a + ℤ, walls ½ℤ, diag(t, t^{-1}) acts by −ω(t), Weyl element by −1, W_a = ⟨reflections at 0, ½⟩ (infinite dihedral) = ν(N(K)). PGL_2: same A, walls; diag(ϖ, 1) acts by ½ ∉ W_a, ν(N(K))/W_a ≅ ℤ/2 = π₁(PGL_2) (π₁(SL_2) = 0).

  Sources: [Bruhat–Tits I], 10.2 (Les groupes GL_n(K) et SL_n(K)), pp. 234–251; [Casselman], §1 (SL_2 and the tree, as recalled in the notes). Requires: *affine-weyl-group*; *apartment-action-kernel*; *algebraic-fundamental-group*.

- **The quasi-split unitary group in three variables.** K'/K separable quadratic, G = SU_3(K'/K), antidiagonal form: dim S = 1, Φ = {±a, ±2a} (BC_1), U_a(K) = H_0(K', K), U_{2a}(K) = {(0, v)}, φ_a(x_a(u, v)) = ½ω_{K'}(v), φ_{2a} = 2φ_a|U_{2a}; Γ_a, Γ_{2a}, Γ'_a explicit, ramification-dependent, Γ'_a ⊊ Γ_a: some values of φ_a give no wall. Σ = A_1. K'/K unramified ⇒ G unramified with hyperspecial vertex; ramified ⇒ none.

  Sources: [Bruhat–Tits II], 4.1.9–4.1.12 and 4.2.20–4.2.23, pp. 81–84, 97–99; [van Hoften], Appendix A.3.6, pp. 60–61. Requires: *quasi-split-valuation*; *echelonnage-root-system*.

- **Nonsplit tori: apartments and Kottwitz maps.** E'/E separable quadratic, T = R^1_{E'/E}G_m: S = 1, V = 0, A = point, T(E) = T(E)^1 compact, X_*(T) = ℤ, Gal = −1. Unramified: X_*(T)_I = ℤ, σ = −1, invariants 0, κ_T = 0 on T(E) = T(E)_0. Ramified: X_*(T)_I = ℤ/2, σ-fixed, κ_T|T(E) onto, ker T(E)_0, index 2: units ≡ 1 (m_{E'}) (p ≠ 2; −1 ∉ T(E)_0).

  Sources: [Haines–Rapoport], Prop. 3 proof (a), p. 2; [Pappas–Rapoport], §2.a.2 and §3 (tori and groups of multiplicative type), pp. 10–13. Requires: *kottwitz-homomorphism-torus*; RG2.0a/*norm-torus*; *torus-valuation-map*.

## RG2.2 — Buildings and group action

The enlarged Bruhat–Tits building `B(G,K) = G(K) × A / ∼` is glued from the apartment of RG2.1 by the Bruhat–Tits equivalence relation. The layer proves the building axioms (common apartments, intersections of apartments, stabilizer of an apartment, retractions), equips the building with its complete CAT(0) metric, proves the fixed-point theorem for bounded subgroups, defines facets, chambers, special points, pointwise fixers and stabilizers, relates the enlarged and reduced buildings and proves cocompactness and independence of all choices. It then establishes the functorial behaviour of buildings under unramified and tame descent, finite separable extensions, Weil restriction, central extensions and quotients, products and Levi subgroups, twisted Levi subgroups, and toral embeddings into the building of `GL(V)` (including the Kisin–Pappas minuscule embeddings), and finishes with the concrete models: norms and periodic lattice chains for `GL(V)`, self-dual chains for `GSp(V)`, `GL_m` over a division algebra, the tree of `SL_2` with Ihara's amalgam, and the buildings of tori and anisotropic groups.

### RG2.2.1 — The building and its axioms

- **The Bruhat–Tits building.** φ a compatible valuation of (Z(K), (U_a(K))_{a∈Φ}), A its apartment, ν : N(K) → Aff(A); P_x := ⟨N(K)_x, U_{a,x,0} (a ∈ Φ)⟩ ⊂ G(K), N(K)_x := {n : ν(n)x = x}. B(G,K) := G(K) × A / ∼, (g,x) ∼ (h,y) iff ∃ n ∈ N(K): y = ν(n)x, g⁻¹hn ∈ P_x. g·[h,x] = [gh,x]; x ↦ [1,x] embeds A; every point is g·x, x ∈ A; n·x = ν(n)x. B depends only on the equipollence class of φ. The central part of Z(K) translates V (enlarged building); the quotient by the central directions is the reduced building.

  API (in `BruhatTits`): `Building` — G(K) × A / ∼ for a compatible valuation φ; `Building.mk` — [g, x], the class of (g, x); `Building.mk_eq_mk_iff` — [g,x] = [h,y] iff ∃ n: y = ν(n)x, g⁻¹hn ∈ P_x; `Building.smul_mk` — g·[h,x] = [gh,x]; `apartmentEmbedding` — j : A → B(G,K), x ↦ [1, x]; `Building.apartmentEmbedding_injective` — j is injective; `Building.normalizer_smul_apartmentEmbedding` — n·j(x) = j(ν(n)x) for n ∈ N(K); `Building.exists_smul_apartmentEmbedding` — every point is g·j(x), g ∈ G(K), x ∈ A.

  Tests: `Building.sl2_tree` — SL_2, |κ| = q: the facet complex of the reduced building is the (q+1)-regular tree; `Building.rankZero` — Φ(G,S) = ∅ (anisotropic mod centre): B(G,K) = j(A); the reduced building is a point; `Building.not_product` (non-example) — ≠ G(K) × A: for SL_2, [g,x] = [gu,x] ∀u ∈ U_{a,x}; the quotient map is far from injective.

  Sources: [Bruhat–Tits I], 7.4.1–7.4.3, pp. 170–171; [Bruhat–Tits II], 4.2.12–4.2.16, pp. 92–94; [He 2021], §2.1, p. 4. Requires: RG2.1/*apartment*; RG2.1/*affine-roots-and-filtrations*; RG2.1/*valued-root-datum-existence*.

- **Apartments and the building axioms.** Apartments: g·j(A) ↔ maximal split tori gSg⁻¹. (1) Two points, two facets, or a facet and sector germ share an apartment. (2) A ∩ g⁻¹A is enclosed, g acting on it as an n ∈ N(K); so some g fixes A' ∩ A'' with g·A' = A''. (3) Stab(A) = N(K) via ν; fixer Z(K)¹ = ker v. (4) Chamber C ⊂ A': unique retraction ρ_{A',C} : B → A', b⁻¹· on apartments ∋ C, b fixing C. (affine-building axioms).

  Sources: [Bruhat–Tits I], Prop. 7.4.4, Prop. 7.4.8, Cors. 7.4.9–7.4.10, Thm 7.4.18, Thm 7.4.19, pp. 172–175. Requires: *building*.

- **The building is a complete CAT(0) space.** W_0-invariant scalar product on V; unique d on B(G,K) Euclidean on apartments: G(K)-invariant, complete, uniquely geodesic (segments in apartments), contractible, CAT(0) d(z,m)² + d(x,y)²/4 ≤ (d(z,x)²+d(z,y)²)/2, m the midpoint of [x,y]; chamber retractions 1-Lipschitz. Normalization (E tame splitting field): d = d_E|, d_E G(E)-invariant, |α(x − y)| ≤ d_E(x,y), α a root, x, y in an E-apartment

  Sources: [Bruhat–Tits I], Prop. 7.4.20 (with 2.5.1–2.5.16), pp. 43–46 and 175; [Bruhat–Tits I], 2.5.12 and 7.5.1, pp. 45 and 180; [Fintzen], §3, p. 12 (before Prop. 3.12). Requires: *building-apartment-axioms*.

- **The Bruhat–Tits fixed point theorem.** (1) An isometry group with a bounded orbit fixes the circumcentre, in the closed convex hull. (2) Bounded (E local: compact) subgroups fix a point of B_red, and of B if in G(E)¹ := ⋂_{χ ∈ X^*_K(G)} ker(ω∘χ). (3) Maximal bounded subgroups of G(K)¹ = point stabilizers; G simply connected semisimple: maximal parahorics, classes ↔ chamber vertex types mod G(K)-diagram automorphisms. (4) Fixed points of compact H ⊂ G(E) persist in B(G,E'), E'/E finite.

  Sources: [Bruhat–Tits I], 3.2.1–3.2.4 and Thm 3.3.1 with Cors. 3.3.2–3.3.3, pp. 63–65; [Bruhat–Tits I], Prop. 8.2.1, p. 194; [Garrett], §§14.6–14.8, pp. 229–235. Requires: *building-metric*.

### RG2.2.2 — Facets, fixers and the reduced building

- **Facets, chambers and special points of the building.** Facets of B(G,K): G(K)-translates g·j(F) of facets F of A, a partition, G(K)-invariant closure order F ≤ F' (F ⊂ closure F'). Chambers (alcoves) = maximal facets; vertices = minimal facets of B_red; special point: special in some (so every) apartment ∋ it. Polysimplicial G(K)-complex; a facet's type = its orbit under the type-preserving subgroup (⊃ ⟨parahorics⟩). ε_F : Stab(F) → {±1}: sign of the permutation of F's vertices.

  API (in `BruhatTits`): `BuildingFacet` — G(K)-translates of the facets of A; `BuildingFacet.mem_unique` — each point lies in exactly one facet; `BuildingFacet.le_iff` — F ≤ F' iff F ⊂ closure(F'); `BuildingFacet.smul` — G(K) acts on facets, preserving ≤; `BuildingFacet.IsChamber` — maximal facets (alcoves); `BuildingFacet.IsVertex` — minimal facets of the reduced building; `BuildingFacet.IsSpecial` — special in some (so every) apartment ∋ x; `BuildingFacet.orientationCharacter` — ε_F : Stab(F) → {±1}, vertex-permutation sign.

  Tests: `BuildingFacet.tree_facets` — SL_2 tree: the facets are the vertices and the open edges; `BuildingFacet.rankZero_single` — Φ = ∅: the reduced building has one facet, at once a chamber and a vertex; `BuildingFacet.not_special_barycentre` (non-example) — the midpoint of a tree edge is not special, though fixed by the edge stabilizer.

  Sources: [Bruhat–Tits I], Définition 7.4.12, Prop. 7.4.13, Cor. 7.4.14, pp. 173–174; [Bruhat–Tits I], 1.3.4–1.3.7, pp. 21–22; [He 2021], §2.1, p. 4. Requires: *building*; RG2.1/*affine-chamber-structure*.

- **Stabilizers and pointwise fixers in the building.** Ω ⊂ B(G,K) nonempty: fixer G(K)_Ω := {g : g·x = x ∀x ∈ Ω} ⊂ Stab(Ω) := {g : g·Ω = Ω}, equal for points. Ω in an apartment: G(K)_Ω = ⟨N(K) ∩ G(K)_Ω, U_{a,Ω}⟩. E local, Ω bounded: G(E)_Ω is compact open, inside G(E)¹ (enlarged); B_red point stabilizers are open, compact mod Z_G(E). A facet's fixer = fixer of its closure = ⋂ of its vertices' fixers (reduced, type-preserving); its stabilizer may be larger (permuting vertices).

  API (in `BruhatTits.Fixer`): `pointwise` — G(K)_Ω, the pointwise fixer of Ω; `stabilizer` — Stab(Ω), the setwise stabilizer; `pointwise_le_stabilizer` — G(K)_Ω ≤ Stab(Ω); `pointwise_smul` — G(K)_{g·Ω} = g G(K)_Ω g⁻¹; `pointwise_antitone` — Ω ⊂ Ω' ⟹ G(K)_{Ω'} ≤ G(K)_Ω; `isCompact_pointwise` — E local, Ω bounded: G(E)_Ω is compact; `isOpen_pointwise` — E local, Ω bounded: G(E)_Ω is open; `stabilizer_compactModCentre` — B_red point stabilizers: compact mod centre.

  Tests: `gl2_vertex` — GL_2(E), vertex [O²] of the enlarged building: the fixer is GL_2(O); `singleton_eq` — Ω a single point: fixer = stabilizer; `pgl2_edge_stabilizer_ne_fixer` (non-example) — PGL_2(E), edge F of the tree: (0 1; ϖ 0) ∈ Stab(F) ∖ G(E)_F.

  Sources: [Bruhat–Tits I], 7.1.1–7.1.11 and Prop. 7.4.4, pp. 156–160 and 172; [Bruhat–Tits II], 4.2.14 and 4.2.16, pp. 93–94; [Haines–Rapoport], Rem. 11, p. 7. Requires: *building*; *facets-and-special-points*.

- **Reduced versus enlarged building.** V¹ := Hom(X^*_K(G), ℝ), θ : G(K) → V¹, ⟨θ(g), χ⟩ = −ω(χ(g)). B_red(G,K): apartment A/V_Z, V_Z := X_*(A_G) ⊗ ℝ; = B(G_der,K) = B(G^ad,K) as G(K)-sets; Z_G(K) acts trivially. B(G,K) ≅ B_red(G,K) × V¹, g·(x,v) = (g·x, v + θ(g)), apartments, facets, metric as products; canonical only up to V¹-translation.

  API (in `BruhatTits`): `ReducedBuilding` — B_red(G,K), the reduced building; `ReducedBuilding.centralVector` — θ : G(K) → V¹, ⟨θ(g), χ⟩ = −ω(χ(g)); `ReducedBuilding.prodEquiv` — B ≃ B_red × V¹, g·(x,v) = (g·x, v+θ(g)); `ReducedBuilding.centre_smul` — Z_G(K) acts trivially on B_red; `ReducedBuilding.adjointEquiv` — B_red(G,K) ≃ B_red(G^ad,K), equivariantly.

  Tests: `ReducedBuilding.gl_n_centralVector` — GL_n: θ(g) = −ω(det g) under V¹ ≅ ℝ; `ReducedBuilding.torus_point` — G a torus: B_red is a single point; `ReducedBuilding.prodEquiv_not_unique` (non-example) — B(GL_n) ≅ B_red × ℝ is not unique: an ℝ-translation gives another equivariant one.

  Sources: [Bruhat–Tits II], 4.2.14–4.2.16, pp. 93–94; [Prasad], Introduction, p. 2. Requires: *building*; RG2.1/*torus-valuation-map*.

- **Cocompact action and fundamental domain.** E local. The closure of a chamber of B_red is a fundamental domain for G(E)⁰ := ⟨parahorics⟩; so G(E) has finitely many facet orbits and parahoric classes and acts cocompactly on B_red(G,E), and on B(G,E) as θ(G(E)) is a lattice in V¹. Same for a tame twisted Levi G' ⊂ G under G'(E).

  Sources: [Bruhat–Tits I], Théorème 7.4.18 and Remarque 7.4.22, pp. 174–176; 2.2.3–2.2.8, pp. 35–36; [Fintzen], proof of Thm 6.1, after Lem. 6.1.1, p. 23; [Bruhat–Tits II], 4.2.16, p. 94. Requires: *facets-and-special-points*; *enlarged-and-reduced-building*; RG2.1/*affine-weyl-group*.

- **Independence of the building from choices.** B(G,K) (action, apartments, facets, affine structure) is independent of S, φ (up to equipollence), the Chevalley–Steinberg system: unique G(K)-equivariant, segment-affine, apartment-preserving bijection; metric: only on the scalar product. Enlarged: up to V¹-shift. σ-isomorphisms (valued fields + groups) transport buildings uniquely

  Sources: [Bruhat–Tits II], 4.2.12–4.2.13, pp. 92–93; [Bruhat–Tits I], Prop. 7.4.3 and Cor. 7.4.32, pp. 171 and 179. Requires: *building*; RG2.1/*transport-under-choices*.

### RG2.2.3 — Descent and functoriality

- **Unramified descent of the building.** K^sh strict henselization (Ĕ, σ for E local), Σ := Gal(K^sh/K). The G(K)-equivariant isometry j : B(G,K) → B(G,K^sh) has image the Σ-fixed points: B(G,K) = B(G,K^sh)^Σ = G(K)·A(G,S,K); so B(G,E) = B(G,Ĕ)^σ. E-facets = fixed parts of σ-stable Ĕ-facets; alcoves ↔ maximal σ-stable facets; Z centralizer of a maximal K^sh-split torus defined over K: Σ has a unique fixed point on B_red(Z).

  Sources: [Bruhat–Tits II], 5.1.24–5.1.27, pp. 155–156; [Bruhat–Tits I], 9.2.14–9.2.15, pp. 209–210; [He 2018], §4.3, p. 12. Requires: *building*; RG2.1/*unramified-descent-of-valuation*; RG2.1/*rational-maximal-unramified-split-torus*.

- **Fixed points of finite groups of invertible order.** H connected reductive over k, Θ finite ⊂ Aut_k(H), |Θ| prime to char k (resp. residue char.). Then (H^Θ)° is smooth connected reductive. Over K, Θ acts on B(H,K) by isometries, H(K)-compatibly; for Θ-stable bounded Ω ⊂ A, (𝓗_Ω)^Θ is a closed smooth O-subgroup scheme with generic fibre H^Θ.

  Sources: [Prasad], §2.4 and §2.5(i), p. 6; [Edixhoven], Props. 3.1 and 3.4, pp. 293–294. Requires: ReductiveGroups layer 6.

- **Tame descent of buildings.** K̃/K finite tame Galois, group Γ (or tame, finite inertia). Γ acts on B(G,K̃) by isometries; B(G,K) → B(G,K̃) is injective, image B(G,K̃)^Γ, both buildings (metric scaled by e(K̃/K), valuations normalized). I ⊂ Γ inertia: B(G,K̃)^I = B(G,K̃^I). T a maximal K-torus split over K̃: A(T,K̃) meets B(G,K). G_{K̃} ≅ H_{K̃}, H pinned Chevalley: G(K) = H(K̃)^Γ for γ·h = c(γ)γ(h), c a cocycle in H^ad(K̃) ⋊ Ξ (Ξ pinned automorphisms), B(G,K) = B(H,K̃)^Γ likewise.

  Sources: [Prasad], Thm 3.17, p. 23; §4.5, p. 27; introduction, p. 2; [Kisin–Pappas], §1.2.14, pp. 135–136; §1.2.22, p. 138; §1.3.8, p. 142; [Kisin–Pappas–Zhou], §2.1.2, display (2.1.3), p. 10. Requires: *unramified-descent-of-building*; *finite-group-fixed-points-reductive*; *weil-restriction-building*; RG2.1/*steinberg-quasi-split*; LocalFieldsRamification layer 3.

- **Buildings under finite field extensions.** K'/K finite separable: canonical injective G(K)-equivariant i_{K,K'} : B(G,K) → B(G,K'), affine A(G,S,K) → A(G,S',K') S ⊂ S' maximal split (distances scaled by e(K'/K)), transitive in towers, Galois-equivariant if K'/K is Galois, image ⊂ fixed points (= if tame). Hyperspecial stays so. G unramified: hyperspecial vertices of B_red(G,K) = B(G^ad,K) form one G^ad(K)-orbit.

  Sources: [Bruhat–Tits II], 5.1.41, pp. 161–162 (with 4.2.24, pp. 99–100); [Kisin–Pappas–Zhou], proof of Prop. 2.2.2, pp. 11–12. Requires: *tame-descent-of-building*; *building-independence-of-choices*; *unramified-descent-of-building*.

- **Buildings of Weil restrictions.** K'/K finite separable, G' connected reductive over K', H := Res_{K'/K} G'. Unique H(K)-equivariant bijection B(H,K) ≅ B(G',K'), affine on apartments (max. split torus of H = split part of Res S'), isometric up to the normalized-valuation ratio. Stabilizer models: for H over O_K, Res_{O_{K'}/O_K} of that for G'.

  Sources: [Kisin–Pappas–Zhou], §2.1.2, p. 10; [Bruhat–Tits II], 4.2.12 and 4.2.9, pp. 91–93. Requires: *building*; RG2.0a/*weil-restriction-group-scheme*; *building-independence-of-choices*.

- **Buildings under central extensions and quotients.** α : G → G' surjective, central kernel (K = k((π)): α separable on root subgroups). Canonical G(K)-equivariant toral α_* : B(G,K) → B(G',K): affine A(S) onto A(α(S)), isometry B_red(G,K) ≅ B_red(G',K), Galois-equivariant over K^ur, hyperspecial-preserving; α(G(K^ur)_x) ⊂ G'(K^ur)_{α_*(x)} (enlarged), hence maps of Bruhat–Tits schemes.

  Sources: [Bruhat–Tits II], 4.2.15, pp. 93–94; [Kisin–Pappas], §1.1.3, p. 128; proof of Prop. 1.2.3 and Lem. 1.2.5, p. 132; §1.2.27, p. 139. Requires: *building*; *enlarged-and-reduced-building*.

- **Products and Levi subgroups.** (1) B(∏G_i,K) = ∏B(G_i,K) equivariantly, apartments, facets, metrics as products. (2) M ⊃ S a Levi of a K-parabolic: M(K)-equivariant toral injection B(M,K) → B(G,K), A(S) onto A(S), unique up to X_*(A_M) ⊗ ℝ ⊂ V_M¹; image M(K)·A canonical. (3) Block Levi ∏GL(V_i) ⊂ GL(⊕V_i): (α_i) ↦ α, α(Σx_i) = min α_i(x_i); graded chains (Λ_i, c_i + t_i) ↦ direct-sum chain.

  Sources: [Bruhat–Tits I], Définition 7.6.1, Props. 7.6.3–7.6.4, Cor. 7.6.5, pp. 184–187; [Kisin–Pappas], proof of Prop. 1.2.3 after (1.2.6), p. 133; §1.2.25, p. 138. Requires: *building*; *enlarged-and-reduced-building*.

- **Twisted Levi subgroups and their buildings.** Smooth closed G' ⊂ G: twisted Levi if G'_{K'} is a Levi of G_{K'}, K'/K finite (tame: K' tame); connected reductive (e.g. torus centralizers). G' tame, K'/K tame Galois, G'_{K'} Levi: Galois-equivariant Levi embeddings B(G',K') → B(G,K') descend to a toral G'(K)-equivariant B(G',K) ↪ B(G,K), unique up to G'-central translations: canonical K'-independent image.

  API (in `TwistedLevi`): `IsTwistedLevi` — Levi of a parabolic after a finite extension; `IsTame` — the extension can be chosen tame; `of_isLevi` — a Levi over K is a twisted Levi; `centralizer_torus` — centralizer of a K-torus is a twisted Levi; `baseChange` — twisted Levis are stable under base change; `buildingImage` — the canonical image of B(G',K) in B(G,K); `buildingImage_eq` — image of every equivariant toral injection.

  Tests: `maximalTorus` — every maximal K-torus of G is a twisted Levi; `whole_group` — G is a twisted Levi of itself; `elliptic_not_levi` (non-example) — E'/E quadratic: E'^× ⊂ GL_2(E) is a twisted Levi but a Levi of no E-parabolic.

  Sources: [Fintzen], Def. 3.3, p. 9; [Fintzen], Rem. 3.9, p. 11. Requires: *building-products-and-levis*; *tame-descent-of-building*; ReductiveGroups layer 7.

- **Equivariant toral embeddings into the GL building.** ρ : G → GL(V) faithful. (1) G(K^ur)-equivariant toral isometric ι : B(G,K^ur) → B(GL(V),K^ur) exist (toral: A(S) affine into an apartment of a torus ⊃ ρ(S)); one value fixes ι; x, y with Landvogt's (TOR), (STAB), (CENT): exactly one has ι(x) = y, Galois-equivariant if y is. (2) t + ι (all gradings +t, t ∈ ℝ) is again equivariant toral, same stabilizers. (3) G split, ρ irreducible minuscule, char K = 0: any two differ by a shift ι' = t + ι

  Sources: [Kisin–Pappas], §1.2.1, p. 131; Rem. 1.2.7, pp. 133–134; Cor. 1.2.11, pp. 134–135. Requires: *gl-building-lattice-chains*; *building-products-and-levis*; *building-independence-of-choices*.

- **Kisin–Pappas minuscule building embeddings.** (1) G split, reductive model G_O, hyperspecial x_o; ρ = ⊕ρ_i : G → GL(⊕V_i), ρ_i irreducible via a_i : G ↠ G_i split (K = k((π)): a_i separable on root subgroups); O-lattices Λ_i ⊂ V_i with ρ_i(G_O(O^ur)) ⊂ GL(Λ_i ⊗ O^ur). Then a Galois- and G(K^ur)-equivariant toral ι : B(G,K^ur) → B(GL(V),K^ur), ι(x_o) = [(⊕Λ_i) ⊗ O^ur], exists; isometric, unique if ρ faithful. (2) G split over tame K̃ ⊃ K^ur, ρ minuscule: the split map for G_{K̃} is twisted-Galois-equivariant; inertia fixed points give such a map for G, compatible with Levi factorizations.

  Sources: [Kisin–Pappas], Prop. 1.2.3 and Lem. 1.2.5, pp. 132–133; §1.2.14, pp. 135–136; Prop. 1.2.21 and §§1.2.22–1.2.26, pp. 137–138; (1.3.11)–(1.3.12), p. 143. Requires: *toral-embedding-into-gl-building*; *tame-descent-of-building*; RG2.1/*minuscule-coweight*; *building-functoriality-central-extensions*.

### RG2.2.4 — Classical groups, the tree and examples

- **The building of GL(V) via norms and lattice chains.** K complete, dim V = n. Norm α : V → ℝ ∪ {∞}: α(tx) = α(x)+ω(t), α(x+y) ≥ min(α(x),α(y)), α⁻¹(∞) = 0; splittable if α(Σx_i e_i) = min(ω(x_i)+α(e_i)) in some basis (always); Periodic chain 𝓛: nonempty K^×-stable chain of lattices; grading: strictly decreasing c : 𝓛 → ℝ, c(ϖΛ) = c(Λ)+1. Splittable norms ↔ graded chains (balls {α ≥ r}, c_α(Λ) = inf α(Λ)) ↔ B(GL(V),K), equivariant, affine, v ∈ V¹ = ℝ acting as α − v. Period r ≤ n: determining segment ϖΛ^0 ⊊ Λ^{r−1} ⊊ ⋯ ⊊ Λ^0, 𝓛 = {ϖ^mΛ^i}; tot(𝓛) := Λ^0⊕⋯⊕Λ^{r−1} ⊂ V^r. GL(V)_x = ⋂GL(Λ^i); B_red: vertices = classes [Λ], facets = ungraded chains

  API (in `GLBuilding`): `SplittableNorm` — splittable norms α : V → ℝ ∪ {∞}; `GradedLatticeChain` — periodic chains with grading c(ϖΛ) = c(Λ)+1; `normEquivChain` — splittable norms ≃ graded periodic chains; `buildingEquiv` — B(GL(V),K) ≃ splittable norms; v ↦ α − v; `smul_apply` — (g·α)(x) = α(g⁻¹x); `period` — the period r of a chain, 1 ≤ r ≤ dim V; `totalLattice` — tot(𝓛) = Λ^0 ⊕ ⋯ ⊕ Λ^{r−1} ⊂ V^r; `stabilizer_eq` — stabilizer of a graded chain = ⋂_i GL(Λ^i).

  Tests: `dim_one` — dim V = 1: the norms are x ↦ ω(x/x_0) + c; the building is a line; `standard_norm` — min_i ω(x_i): unit ball O^n, chain {ϖ^m O^n} with c(ϖ^m O^n) = m; `not_grading` (non-example) — c(ϖΛ) = c(Λ) + 2 is no grading (other normalization): it defines no point of B(GL(V),K).

  Sources: [Bruhat–Tits 1984], 1.1, 1.7–1.8, pp. 262, 266–267; [Bruhat–Tits 1984], 2.1–2.16, pp. 279–285; [Kisin–Pappas], §1.1.9, p. 130. Requires: *building*; `Submodule.IsLattice`.

- **The building of GSp(V) via self-dual chains.** ψ perfect alternating, Λ^∨ := {ψ(·,Λ) ⊂ O}; B(GSp(V),K) = almost-self-dual graded chains (∨-stable, c(Λ^∨) = m−c(Λ), m ∈ ℤ) = Fix(ψ-involution|B(GL(V),K)). Segment Λ^{r−1} ⊂ ⋯ ⊂ Λ^0 ⊂ (Λ^0)^∨ ⊂ ⋯ ⊂ ϖ⁻¹Λ^{r−1}, (Λ^i)^∨ = Λ^{−i−a}, a ∈ {0,1}; stabilizer GSp∩GL(V)_x; GSp(V) ↪ GSp(⊕_iV, ⊥-sum ψ') diag., ψ' integral on rescaled ⊕Λ^i

  Sources: [Kisin–Pappas], §1.1.11, pp. 130–131. Requires: *gl-building-lattice-chains*; *tame-descent-of-building*.

- **Buildings of GL_m over a division algebra.** D central division over K, O_D maximal order, V = D^m. B(GL_D(V)) (enlarged) ≅ D-norms on V (α(xt) = α(x)+ω_D(t)) ≅ graded periodic right O_D-chains (c(Λϖ_D) = c(Λ)+ω_D(ϖ_D)), equivariantly; stabilizer scheme = Aut_{O_D}(chain). Res_{K/ℚ_p} GL_m(D): same building; an unramified extension splitting D embeds it in B(GL_{md}).

  Sources: [Bruhat–Tits 1984], 1.1–1.8, 2.11, 3.6 and 4.7, pp. 262–294; [Kisin–Pappas–Zhou], §6.3.1, p. 70. Requires: *gl-building-lattice-chains*; RG2.0a/*weil-restriction-group-scheme*; *weil-restriction-building*.

- **The Bruhat–Tits tree of SL_2.** K complete, residue field κ. T_K: graph on lattice classes [Λ] ⊂ K², adjacent iff ϖΛ ⊊ Λ' ⊊ Λ. A tree, (q+1)-regular (|κ| = q): neighbours of [Λ] ↔ lines in Λ/ϖΛ ≅ κ². T_K = B_red facet complex of GL_2, PGL_2, SL_2; building metric = path metric, edge length 1. PGL_2(K) (so GL_2(K)) acts; type[Λ] := ω(det Λ) mod 2 shifts by ω(det g): SL_2(K) keeps types (no inversion, 2 orbits); PGL_2(K) is vertex-, edge-transitive, inverting: (0 1; ϖ 0) swaps [O²], [O⊕ϖO]

  API (in `BTTree`): `Vertex` — homothety classes of O-lattices in K²; `Adj` — ϖΛ ⊊ Λ' ⊊ Λ for some representatives; `tree` — the simple graph (Vertex, Adj); `isTree` — BTTree.tree is a tree; `neighborEquiv` — neighbours of [Λ] ≃ ℙ¹(κ); degree q + 1; `smul` — GL_2(K) acts via PGL_2(K) by automorphisms; `type` — type[Λ] := ω(det Λ) mod 2; shifts by ω(det g); `sl2_preserves_type` — SL_2(K) keeps types; no inversion.

  Tests: `degree_Q2` — K = ℚ_2: every vertex has degree 3; `adj_standard` — [O²] and [O ⊕ ϖO] are adjacent; `pgl2_inversion` (non-example) — (0 1; ϖ 0) ∈ PGL_2(K) swaps [O²] and [O ⊕ ϖO]: an inversion; types not preserved.

  Sources: [Garrett], §14.1, p. 222 and §§19.1–19.3, pp. 322–329; [Bruhat–Tits I], 10.2, pp. 234–251; [Calegari–Geraghty], Rem. 9.7, pp. 89–90 (arXiv v2). Requires: *gl-building-lattice-chains*; `SimpleGraph.IsTree`; `Submodule.IsLattice`.

- **Ihara's theorem: SL_2 as an amalgam.** x_0 = [O²], x_1 = [O⊕ϖO] adjacent; in SL_2(K), K_0 = SL_2(O) = Stab(x_0), K_1 = gSL_2(O)g⁻¹ = Stab(x_1), g = diag(1,ϖ); I = K_0 ∩ K_1 Iwahori. Then K_0 *_I K_1 ≅ SL_2(K), also PSL_2(K). PGL_2(K) ≠ amalgam of the x_0-, x_1-stabilizers over their intersection (edge inversions); use the edge stabilizer, or PGL_2(K)^{ev} (ω(det) even), inversion-free

  Sources: [Calegari–Geraghty], §9.3, Rem. 9.7, pp. 89–90 (arXiv v2; p. 418 of the published version); [Garrett], §14.1, p. 222. Requires: *sl2-tree*; *building-cocompact-action*; `Monoid.PushoutI`.

- **Buildings of tori and anisotropic groups.** (1) Torus T, split part S_T: B_red a point, B(T,K) = V¹ = X_*(S_T)⊗ℝ, T(K) translating by θ, stabilizers = max bounded T(K)¹. (2) G anisotropic mod centre: B_red a G(K)-fixed point, G(E)/Z_G(E) compact; G anisotropic: G(K) bounded (E: compact), B(G,K) a Gal(K^sh/K)-fixed point. (3) R¹_{E'/E}G_m: buildings points, T(E) compact

  Sources: [Bruhat–Tits II], 5.1.26–5.1.27, p. 156; [Bruhat–Tits II], 4.2.16, p. 94. Requires: *enlarged-and-reduced-building*; RG2.1/*nonsplit-torus-example*; *bruhat-tits-fixed-point-theorem*; *unramified-descent-of-building*.

## RG2.3 — Parahoric and congruence group schemes

This layer builds the integral models. It starts with smooth affine models over the valuation ring `O`, reductive models (whose `O`-points are the hyperspecial subgroups), schematic closures, the Bruhat–Tits extension principle (a smooth affine model is determined by its points over the strict henselization), the big-cell criteria, quotients over a Dedekind base, the Prasad–Yu closed-immersion criterion and faithful representations of models; then the Néron models of tori (locally of finite type, finite type, identity component) with R-smoothness and quasi-tameness; then the Bruhat–Tits group scheme `𝒢_Ω` of a bounded subset of an apartment, its identity component `𝒢°_Ω` (the parahoric group scheme), parahoric, Iwahori and pro-p Iwahori subgroups, the Haines–Rapoport characterization of parahorics as fixers inside the Kottwitz kernel, the reductive quotient of the special fibre with its pro-unipotent radical and the behaviour under nested facets and unramified base change, hyperspecial vertices, and generic points. The second half treats associated, quasi- and very special parahorics, parahorics under central extensions, the integral models of stabilizers for classical and Hodge-type groups (lattice chains, closed immersions of fixers, tame realization as fixed points of hyperspecial models), the Moy–Prasad filtrations with their Lie-algebra lattices, mixed-depth groups and mock exponential, Lang's theorem (single owner in Tau Ceti of this statement) with its pro-algebraic and coset-lifting forms, torsors under smooth models with connected special fibre, and explicit level subgroups. A parahoric subgroup is always the group of integral points of the connected group scheme; the fixer and the stabilizer of a facet can be larger.

### RG2.3.1 — Smooth affine models and their closures

- **Smooth affine integral models.** Smooth affine O-model of an affine finite-type K-group G (Hopf algebra H): smooth commutative Hopf O-algebra A with Hopf iso K ⊗_O A ≅ H. Flatness: A ⊂ K ⊗_O A, 𝒢(R) = Hom_O(A, R) ⊂ G(K ⊗ R) for O-flat R; 𝒢(O) ≤ G(K), 𝒢(O^sh) ≤ G(K^sh). Morphisms: Hopf O-maps over generic fibres. 𝒢° (open subgroup, special fibre (𝒢_κ)°) is a smooth affine model; connected fibres iff 𝒢 = 𝒢°.

  API (in `IntegralModel`): `SmoothModel` — smooth Hopf O-algebra A, K ⊗_O A ≅ H; `SmoothModel.integralPoints` — 𝒢(O) = Hom_O(A, O) ≤ G(K); `SmoothModel.mem_integralPoints_iff` — g ∈ 𝒢(O) ⟺ g(a) ∈ O ∀a ∈ A; `SmoothModel.Hom` — Hopf O-maps over the generic fibres; unique; `SmoothModel.HasConnectedFibres` — κ ⊗_O A geometrically connected; `SmoothModel.identityComponent` — 𝒢°: smooth model with connected fibres; `SmoothModel.integralPoints_identityComponent_le` — 𝒢°(O) ≤ 𝒢(O), finite index if κ finite.

  Tests: `SmoothModel.generalLinear` — GL_n over O is a smooth model; 𝒢(O) = GL_n(O); `SmoothModel.trivial` — trivial group: unique model O, 𝒢(O) trivial; `SmoothModel.not_smooth_rootsOfUnity` (non-example) — ℤ_p[x]/(x^p − 1): flat Hopf, generic fibre μ_p, not smooth, so not a model.

  Sources: [Bruhat–Tits II], 1.2.2–1.2.5 and 1.2.12, pp. 17–20; [Bruhat–Tits II], 2.2.5 (iii), p. 45; [Zhu], §0.5, arXiv pp. 6–7 (Annals p. 412). Requires: RG2.0/*integral-points-compact-open*; `TauCeti.smoothCommHopfAlgProperty`; `TauCeti.GeneralLinear.instSmoothCoordinateHopfAlgebra`; ReductiveGroups layer 3.

- **Reductive models over O and hyperspecial subgroups.** Reductive O-model of G: smooth affine O-model 𝒢 with connected reductive special fibre κ ⊗_O A (= reductive O-group scheme); then 𝒢(O) ⊂ G(K) is hyperspecial. Exists iff G is unramified; they are then the parahoric group schemes of hyperspecial vertices, stable under base change to unramified extensions and O^sh.

  API (in `IntegralModel`): `SmoothModel.IsReductive` — κ ⊗_O A connected reductive; `IsHyperspecialSubgroup` — P = 𝒢(O) for some reductive model 𝒢; `SmoothModel.isReductive_iff_fibres` — 𝒢 reductive ⟺ reductive O-group scheme; `SmoothModel.IsReductive.hasConnectedFibres` — reductive ⇒ connected fibres; `SmoothModel.generalLinear_isReductive` — GL_{n,O} is a reductive model.

  Tests: `SmoothModel.generalLinear_isReductive_test` — GL_n over O reductive; GL_n(O) hyperspecial in GL_n(K); `SmoothModel.splitTorus_isReductive` — G_m^r over O reductive; (O^×)^r its unique hyperspecial subgroup; `SmoothModel.iwahori_not_reductive` (non-example) — Iwahori scheme of GL_2: smooth, special fibre has unipotent radical ≠ 1, not reductive.

  Sources: [Zhu], §0.5, arXiv pp. 6–7 (Annals p. 412); [Bruhat–Tits II], 4.6.31, pp. 136–137; [Prasad–Yu], Lem. 4.2, p. 7. Requires: *smooth-affine-model*; `TauCeti.reductiveCommHopfAlgProperty`; `TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`; ReductiveGroups layer 6.

- **Schematic closure in an integral model.** A a flat O-algebra, 𝒳 = Spec A, I ⊂ K ⊗_O A, Y := V(I) ⊂ 𝒳_K: Ȳ := Spec(A/I^♮), I^♮ := A ∩ I, is the unique O-flat closed subscheme of 𝒳 with generic fibre Y. 𝒳 a group scheme, Y a closed subgroup ⇒ I^♮ a Hopf ideal. Ȳ(O') = Y(K ⊗ O') ∩ 𝒳(O'), O' O-flat domain; closure commutes with flat base change.

  API (in `SchematicClosure`): `closureIdeal` — I^♮ = A ∩ I, preimage of I in A; `closure` — A ⧸ I^♮, coordinate ring of Ȳ; `closure_flat` — A ⧸ I^♮ is O-flat; `closure_genericFibre` — K ⊗_O (A ⧸ I^♮) ≅ (K ⊗_O A) ⧸ I; `closure_unique` — A ⧸ J flat, K ⊗ J = I ⇒ J = I^♮; `closureIdeal_isHopfIdeal` — I Hopf ideal ⇒ I^♮ Hopf ideal of A; `mem_closure_points` — O' flat domain: x kills I^♮ ⟺ K ⊗ x kills I.

  Tests: `closure_diagonalTorus` — GL_n over O: closure of the diagonal-torus ideal is generated by off-diagonal entries; `closureIdeal_bot` — A flat: closure of the zero ideal is zero (𝒳 is the closure of 𝒳_K); `closure_nonIntegralPoint` (non-example) — A = O[x], I = (x − ϖ^{-1}): A ⧸ I^♮ = O[x]/(ϖx − 1), empty special fibre, no section.

  Sources: [Bruhat–Tits II], 1.2.5–1.2.7, pp. 17–18; [Kisin–Pappas], proof of Prop. 1.3.3, opening paragraph, arXiv pp. 15–16. Requires: *smooth-affine-model*; `TauCeti.HopfIdeal`; `Ideal.comap`.

- **The Bruhat–Tits extension principle.** For O henselian and 𝒢, 𝒢' smooth affine O-group schemes with generic fibres G, G': (1) O[𝒢] = {f ∈ K[G] : f(𝒢(O^sh)) ⊂ O^sh}; (2) a K-homomorphism f : G → G' extends (uniquely) to 𝒢 → 𝒢' iff f(𝒢(O^sh)) ⊂ 𝒢'(O^sh); (3) hence a smooth affine model of G is determined up to unique iso by 𝒢(O^sh) ⊂ G(K^sh).

  Sources: [Bruhat–Tits II], 1.7.1–1.7.6, pp. 37–39; [Kisin–Pappas], §1.1.2, arXiv pp. 6–7; [Kisin–Pappas–Zhou], §2.3, proof of Lem. 2.3.3 and of Prop. 2.4.2, arXiv pp. 12–14. Requires: *smooth-affine-model*.

- **Big-cell criteria.** O DVR. (1) 𝒢 → 𝒢' morphism of smooth affine O-groups, connected fibres, generically iso, open immersion on fibrewise dense open U ∋ 1 ⇒ open immersion, iso if 𝒢' has connected fibres; maps on U extend uniquely. (2) 𝒢 = closure of G (schematic root datum) in a smooth affine O-group; 𝒢 flat, closures 𝒯, 𝒰_a of torus/root groups smooth ⇒ ∏_{a<0}𝒰_a × 𝒯 × ∏_{a>0}𝒰_a ↪ 𝒢 open dense big cell, 𝒢 smooth, 𝒢° affine.

  Sources: [Bruhat–Tits II], 1.2.13–1.2.14, pp. 20–21; [Bruhat–Tits II], 2.2.3–2.2.5, pp. 44–45; [Kisin–Pappas], proof of Prop. 1.1.4 (arXiv p. 8) and step 1) of the proof of Prop. 1.3.3 (arXiv pp. 16–17). Requires: *schematic-closure*; *smooth-affine-model*.

- **Quotients of group schemes over a DVR.** S locally noetherian, dim S ≤ 1, 𝒢 an lft S-group scheme, ℋ ⊂ 𝒢 a closed S-flat subgroup: the fppf quotient 𝒢/ℋ is a scheme (type (FA)) and the categorical quotient, 𝒢 → 𝒢/ℋ faithfully flat; a group scheme if ℋ ⊲ 𝒢, smooth if 𝒢 is.

  Sources: [Anantharaman], Chapitre IV, 4.0, Théorèmes 4.A–4.D, pp. 53–54; [Kisin–Pappas], proof of Prop. 1.1.4, arXiv p. 8. Requires: *smooth-affine-model*; ReductiveGroups layer 3; `AlgebraicGeometry.Scheme`.

- **Prasad–Yu closed-immersion criterion.** 𝒢 reductive O-model of G, ℋ affine finite-type O-group, φ : 𝒢 → ℋ, φ_K closed immersion; char κ ≠ 2 or no normal SO_{2n+1} (n ≥ 1) in G_{K̄} ⇒ φ closed immersion (fails: SO_{2n+1}, char 2). So faithful G → GL(V), 𝒢(O^sh) ⊂ GL(Λ)(O^sh) ⇒ 𝒢 ↪ GL(Λ) closed immersion.

  Sources: [Prasad–Yu], Thm 1.2 and Cor. 1.3, pp. 1–2 (arXiv math/0405381; published as Cor. 5.2); [Kisin–Pappas–Zhou], proof of Prop. 2.4.2, arXiv p. 14; §3.3. Requires: *reductive-model*; *extension-principle*.

- **Faithful representations of integral models.** O Dedekind, 𝒢 smooth affine O-group: ∃ closed immersion 𝒢 ↪ GL_{n,O}, GL_{n,O}/𝒢 quasi-affine (affine if 𝒢 reductive); so every smooth affine model = closure of G in some GL_{n,O}, G ↪ GL_n.

  Sources: [Zhu], §1.4.1, arXiv p. 17 (Annals p. 426). Requires: *smooth-affine-model*; *quotients-over-a-dvr*; *reductive-model*; `TauCeti.GeneralLinear.pointsMulEquiv`.

### RG2.3.2 — Néron models of tori and R-smoothness

- **The lft Néron model of a torus.** O excellent henselian, T a K-torus: 𝒯^lft is a smooth separated lft O-group scheme with generic fibre T and Hom_O(X, 𝒯^lft) ≅ Hom_K(X_K, T) for smooth O-schemes X; so 𝒯^lft(O^sh) = T(K^sh), 𝒯^lft(O) = T(K). Finite type iff T anisotropic. K'/K finite separable, integers O': Res_{O'/O} of the lft model of a K'-torus T' is the lft model of Res_{K'/K} T'. O^sh-components of the special fibre: indexed by X_*(T)_I.

  API (in `NeronModel`): `lft` — 𝒯^lft, a scheme over Spec O; `lftStructure` — structure map 𝒯^lft → Spec O; `lft_smooth` — 𝒯^lft smooth over O; `lftMappingProperty` — B smooth: O-maps Spec B → 𝒯^lft ↔ H → K ⊗_O B; `lft_integralPoints` — 𝒯^lft(O) = T(K); `lft_weilRestriction` — Res_{O'/O} 𝒯'^lft = lft model of Res T'; `lft_components` — O^sh-components indexed by X_*(T)_I via κ_T.

  Tests: `lft_multiplicative_points` — T = G_m: 𝒯^lft(O) = K^×, while G_{m,O}(O) = O^×; `lft_trivialTorus` — trivial torus: 𝒯^lft = Spec O; `lft_not_affine` (non-example) — T = G_m: infinitely many special-fibre components, so not affine, not G_{m,O}.

  Sources: [Kisin–Zhou], 2.4.1–2.4.2, arXiv pp. 12–13; [Kisin–Pappas–Zhou], 2.1.4, arXiv p. 11; [Bruhat–Tits II], 4.4.1–4.4.14, pp. 107–112. Requires: *smooth-affine-model*; RG2.0a/*integral-weil-restriction*; RG2.1/*kottwitz-homomorphism-torus*; `AlgebraicGeometry.Scheme`.

- **Finite-type and connected Néron models of tori.** 𝒯^ft ⊂ 𝒯^lft: open subgroup scheme on O^sh-components in (X_*(T)_I)_tors; smooth affine model; 𝒯^ft(O^sh) = T(K^sh)^1 = {t : ω(χ(t)) = 0 ∀χ}, max. bounded; 𝒯^ft(O) = T(K)^1. 𝒯° := (𝒯^ft)°; L = Ĕ, K^sh: 𝒯°(O_L) = T(L)_0 = ker κ_T, 𝒯^ft/𝒯°(O_L) ≅ (X_*(T)_I)_tors; 𝒯°(O_E) = T(E) ∩ ker κ_T. T ⊂ G max. torus, x ∈ A(T) ⇒ T°(O) ⊂ P°_x.

  API (in `NeronModel`): `ft` — 𝒯^ft, smooth affine model of T; `connected` — 𝒯° = (𝒯^ft)°; `mem_ft_integralPoints_iff` — t ∈ 𝒯^ft(O) ⟺ χ(t) ∈ O^× ∀χ ∈ X^*_K(T); `connected_integralPoints_le_ft` — 𝒯°(O) ≤ 𝒯^ft(O), finite index; `connected_integralPoints_eq_ker_kottwitz` — 𝒯°(O_Ĕ) = ker κ_T; 𝒯°(O_E) = T(E) ∩ ker κ_T; `ft_isOpen_in_lft` — 𝒯^ft, 𝒯° open subgroup schemes of 𝒯^lft; `connected_le_parahoric` — x ∈ A(T) ⇒ T°(O) ≤ P°_x.

  Tests: `ft_multiplicative` — G_m: 𝒯^ft = 𝒯° = G_{m,O}, points O^×; `ft_trivial` — trivial torus: 𝒯^ft = 𝒯° = Spec O; `connected_ne_ft_ramified` (non-example) — norm-one torus of a ramified quadratic extension, p odd: −1 ∈ 𝒯^ft(O) \ 𝒯°(O).

  Sources: [Bruhat–Tits II], 4.4.2, p. 107; 4.4.12–4.4.14, pp. 110–112; 4.6.4, p. 125; [Kisin–Zhou], 2.4.1, arXiv pp. 12–13; [Haines–Rapoport], proof of Prop. 3 (a), Lem. 5, p. 2. Requires: *neron-lft-model-of-torus*; RG2.1/*kottwitz-homomorphism-torus*; RG2.1/*torus-valuation-map*; *smooth-affine-model*.

- **R-smooth tori and groups.** T K-torus split by finite Galois K̃/K (integers Õ); T_c := closure of T ⊂ Res_{K̃/K} T_{K̃} in Res_{Õ/O} 𝒯̃^lft. T R-smooth :⟺ T_c smooth; independent of K̃, iff T_Ĕ R-smooth, and then T_c ≅ 𝒯^lft. G R-smooth :⟺ the centralizer of one (so every) maximal Ĕ-split torus is.

  API (in `NeronModel`): `rSmoothClosure` — T_c ⊂ Res_{Õ/O} 𝒯̃^lft, closure of T; `IsRSmooth` — T_c smooth over O; `isRSmooth_iff_independent` — R-smoothness independent of K̃; `rSmoothClosure_eq_lft` — T R-smooth ⇒ T_c = 𝒯^lft; `isRSmooth_baseChange_breve` — T R-smooth ⟺ T_Ĕ R-smooth; `IsRSmoothGroup` — Z(S) R-smooth, S maximal Ĕ-split.

  Tests: `isRSmooth_split` — G_m^r is R-smooth (K̃ = K); `isRSmooth_trivial` — trivial torus is R-smooth; `isRSmooth_closure_not_lft_in_general` (non-example) — not '𝒯^lft is smooth' (always true): T_c can be non-smooth for a wild torus.

  Sources: [Kisin–Zhou], 2.4.2 and Def. 2.4.3, arXiv p. 13; [Kisin–Pappas–Zhou], 2.1.4, arXiv p. 11 (footnote 2); [Bruhat–Tits II], 4.4.6–4.4.8, pp. 109–110. Requires: *neron-lft-model-of-torus*; *schematic-closure*; RG2.0a/*integral-weil-restriction*.

- **Criteria for R-smoothness.** R-smooth: (1) tamely split tori; (2) quasi-tame tori ∏ Res_{K_i/K} S_i, S_i tamely split; (3) R-smooth extensions of R-smooth; so quasi-tame G, essentially tame G with minimal-Levi torus a quasi-tame extension.

  Sources: [Kisin–Zhou], 2.4.5 and Prop. 2.4.6, arXiv p. 14; [Kisin–Pappas–Zhou], Prop. 2.1.5 (1)–(2), arXiv p. 11; [Edixhoven], Thm 4.2 and its proof, p. 296. Requires: *r-smooth-torus*; RG2.0a/*tame-fixed-points-of-weil-restriction*; *quasi-tame-group*; RG2.0a/*integral-weil-restriction*.

- **Closed immersions of Néron models.** T_1 ↪ T_2 K-tori, T_1 R-smooth ⇒ closed immersions 𝒯_1^lft ↪ 𝒯_2^lft, 𝒯_{1,ft} ↪ 𝒯_{2,ft} (e.g. centralizers of compatible maximal Ĕ-split tori in G ⊂ G', G R-smooth).

  Sources: [Kisin–Zhou], Lem. 2.4.4, arXiv p. 13; [Kisin–Pappas–Zhou], proof of Prop. 2.1.5 (3), arXiv p. 11. Requires: *r-smooth-torus*; *neron-finite-type-and-connected-models*; RG2.0a/*weil-restriction-smoothness-and-immersions*.

- **Quasi-tame and essentially tame groups.** quasi-tame :⟺ G ≅ ∏ Res_{K_i/K} H_i, K_i/K finite separable, H_i connected reductive tamely split; essentially tame :⟺ G^ad quasi-tame; tamely ramified :⟺ split by finite tame Galois K̃/K (π̃^{e(K̃/K)} ∈ K^ur, π̃ uniformizer, after unramified extension).

  API (in `IntegralModel`): `QuasiTameDecomposition` — G ≅ ∏ Res_{K_i/K} H_i with tame splittings; `IsQuasiTame` — a quasi-tame decomposition exists; `IsEssentiallyTame` — G^ad quasi-tame; `IsTamelyRamified` — G split by a finite tame Galois extension; `IsTamelyRamified.isQuasiTame` — tamely ramified ⇒ quasi-tame; `IsQuasiTame.weilRestriction` — Res_{K'/K} of quasi-tame is quasi-tame.

  Tests: `IsQuasiTame.split` — split G: quasi-tame with r = 1, K_1 = K, trivial splitting extension; `IsQuasiTame.resGm` — Res_{K'/K} G_m quasi-tame for every finite separable K'/K, even wild; `IsQuasiTame.not_wild_unitary` (non-example) — norm-one torus of a wild quadratic extension of ℚ_2: not a product of Res of tame tori.

  Sources: [Kisin–Pappas–Zhou], Def. 3.1.4 (1)–(2), arXiv p. 16; [Kisin–Pappas–Zhou], 2.2.1, arXiv p. 12. Requires: RG2.0a/*weil-restriction-group-scheme*; LocalFieldsRamification layer 3.

- **Exact sequences of tori and their models.** 1 → T' → T → T'' → 1 exact K-tori, T tamely split ⇒ fppf-exact 1 → 𝒮' → 𝒯° → 𝒯''° → 1 of smooth O-groups over it, 𝒮'° = 𝒯'°, π_0(𝒮'_κ) ⊂ (X_*(T')_I)_tors, 𝒮' = 𝒯'° if X_*(T')_I torsion-free. E local, r > 0 ⇒ 1 → T'(E)_r → T(E)_r → T''(E)_r → 1 exact.

  Sources: [Pappas–Rapoport], Lem. 6.7 and its proof, arXiv pp. 28–29; [Fintzen], Lem. 7.1, arXiv p. 26; [Kisin–Pappas], proof of Prop. 1.1.4 (Z a torus), arXiv p. 8. Requires: *neron-finite-type-and-connected-models*; *quotients-over-a-dvr*; RG2.0a/*tame-fixed-points-of-weil-restriction*.

### RG2.3.3 — Bruhat–Tits and parahoric group schemes

- **The Bruhat–Tits group scheme of a bounded subset.** Ω ⊂ A nonempty bounded: 𝒢_Ω is a smooth affine O-model of G with 𝒢_Ω(O^sh) = Fix(Ω) ∩ G(K^sh)^1, 𝒢_Ω(O) = Fix(Ω) ∩ G(K)^1; depends only on the enclosure of Ω, not on A; 𝒢_{gΩ} = g𝒢_Ωg^{-1}. Over K^sh (quasi-split), from the schematic root datum: closures 𝒰_{a,Ω}, 𝒰_{a,Ω}(O^sh) = U_{a,f_Ω(a)}, Néron-type 𝒵 of Z, open big cell ∏_{a<0}𝒰_{a,Ω} × 𝒵 × ∏_{a>0}𝒰_{a,Ω}; in general by étale descent (Galois-stable when Ω is). Z a torus ⇒ its closure in 𝒢_Ω is 𝒵^ft.

  API (in `BruhatTits`): `groupScheme` — 𝒢_Ω as a commutative Hopf O-algebra; `GroupScheme.toSmoothModel` — 𝒢_Ω as a smooth affine model of G; `GroupScheme.integralPoints_eq_fixer` — 𝒢_Ω(O) = Fix(Ω) ∩ G(K)^1; `GroupScheme.groupScheme_conj` — 𝒢_{gΩ} = g𝒢_Ωg^{-1}, g ∈ G(K); `GroupScheme.eq_of_enclosure_eq` — same enclosure ⇒ 𝒢_Ω = 𝒢_{Ω'}; `GroupScheme.bigCell` — ∏𝒰_{a,Ω} × 𝒵 × ∏𝒰_{a,Ω} ↪ 𝒢_Ω open; `GroupScheme.torusClosure_eq_ft` — Z torus ⇒ closure of Z in 𝒢_Ω is 𝒵^ft.

  Tests: `GroupScheme.gl_n_vertex` — GL_n, vertex of the lattice O^n: 𝒢_x(O) = GL_n(O); `GroupScheme.torus` — G = T torus (Φ = ∅): 𝒢_Ω = 𝒯^ft for every Ω; `GroupScheme.pgl2_edge_disconnected` (non-example) — PGL_2, x edge barycentre: (0 1; ϖ 0) ∈ 𝒢_x(O) is not in the parahoric, 𝒢_x ≠ 𝒢°_x.

  Sources: [Bruhat–Tits II], 4.6.1–4.6.2 and 4.6.26–4.6.30, pp. 123–136; [Bruhat–Tits II], 5.1.8–5.1.9 and 5.1.30, pp. 148, 157; [Haines–Rapoport], Rem. 11, p. 7. Requires: *extension-principle*; *big-cell-criteria*; *neron-finite-type-and-connected-models*; RG2.2/*unramified-descent-of-building*; RG2.2/*stabilizers-and-fixers*; RG2.1/*affine-roots-and-filtrations*; RG2.1/*valued-root-datum-existence*.

- **Parahoric group schemes.** Ω ⊂ A nonempty bounded: 𝒢°_Ω := (𝒢_Ω)°, smooth affine model, connected special fibre, 𝒢°_Ω(O^sh) = P°_Ω (connected fixer); big cell ∏_{a<0}𝒰_{a,Ω} × 𝒵° × ∏_{a>0}𝒰_{a,Ω}. Facet F: 𝒢°_F = 𝒢°_x (x ∈ F), the parahoric group scheme of F, depends only on its image in the reduced building. 𝒢°_Ω ⊂ 𝒢_Ω open, generic iso, equal iff (𝒢_Ω)_κ connected.

  API (in `BruhatTits`): `parahoricGroupScheme` — 𝒢°_Ω as a commutative Hopf O-algebra; `GroupScheme.parahoricModel` — 𝒢°_Ω, smooth model with connected fibres; `GroupScheme.parahoric_hasConnectedFibres` — (𝒢°_Ω)_κ connected; `GroupScheme.toParahoric` — Hopf map 𝒢_Ω → 𝒢°_Ω, iso on generic fibres; `GroupScheme.parahoric_integralPoints` — 𝒢°_Ω(O) = P°_Ω, the connected fixer; `GroupScheme.parahoric_eq_of_sameFacet` — x, y ∈ F ⇒ 𝒢°_x = 𝒢°_y; `GroupScheme.parahoric_eq_groupScheme_of_simplyConnected` — G simply connected, Ω ⊂ facet ⇒ 𝒢°_Ω = 𝒢_Ω.

  Tests: `GroupScheme.parahoric_gl_n_vertex` — GL_n, standard vertex: 𝒢°_x = GL_{n,O}; `GroupScheme.parahoric_torus` — G = T torus: 𝒢°_Ω = 𝒯°; `GroupScheme.parahoric_ne_groupScheme_pgl2` (non-example) — PGL_2, edge barycentre: 𝒢°_x ≠ 𝒢_x; the parahoric is the Iwahori, index 2 in the fixer.

  Sources: [Bruhat–Tits II], 4.6.28 and 4.6.32, pp. 135–137; [Bruhat–Tits II], 5.2.6, p. 164; [Kisin–Pappas], §1.1.2, arXiv pp. 6–7. Requires: *bruhat-tits-group-scheme*; *neron-finite-type-and-connected-models*; *extension-principle*.

- **Parahoric, Iwahori and pro-p Iwahori subgroups.** P ⊂ G(K) parahoric :⟺ P = 𝒢°_x(O) = P°_x, x ∈ B(G, K); over E: P°_F(Ĕ)^σ = 𝒢°_F(O_E), F σ-stable facet of B(G, Ĕ). Iwahoris (alcove parahorics): minimal, G(K)-conjugate; I^+ := pro-unipotent radical of I (pro-p). E local: compact open, finitely many conjugacy classes; maximal ↔ reduced-building vertices; standard (⊃ fixed Iwahori) ↔ σ-stable finite-type sets of affine simple reflections; N(P°_F) ⊃ Stab(F).

  API (in `BruhatTits.Parahoric`): `IsParahoric` — P = P°_x for some x in the building; `IsIwahori` — P = P°_C, C an alcove (minimal parahoric); `isParahoric_conj` — P°_{gx} = g P°_x g^{-1}; `isCompact_parahoric` — E local: parahorics compact open in G(E); `iwahori_conj` — Iwahoris are G(K)-conjugate; `parahoric_le_stabilizer` — P°_x ≤ Fix(x) ≤ Stab(x); `finite_conjClasses` — E local: finitely many conjugacy classes.

  Tests: `gl_n_maximal` — GL_n(O) is a maximal parahoric of GL_n(K); `torus_unique` — torus: unique parahoric T(K)_0 (anisotropic groups likewise); `stabilizer_not_parahoric_pgl2` (non-example) — PGL_2: stabilizer of an edge (∋ (0 1; ϖ 0)) strictly contains the Iwahori, not parahoric.

  Sources: [Bruhat–Tits II], 5.2.6–5.2.8, pp. 164–165; [Haines–Rapoport], Def. 1 and Rem. 2, p. 1; [He 2021], §2.1, p. 4. Requires: *parahoric-group-scheme*; RG2.0/*integral-points-compact-open*; RG2.2/*building-cocompact-action*; RG2.2/*facets-and-special-points*.

- **Parahorics as fixers in the Kottwitz kernel.** L strictly henselian discretely valued, κ perfect; G(L)_1 := ker κ_G; Ω ⊂ apartment (reduced/enlarged) bounded nonempty: P°_Ω = Fix(Ω) ∩ G(L)_1 = Fix(Ω̄) ∩ G(L)_1, Ω̄ its reduced image. So 𝒢_Ω/𝒢°_Ω(O_L) ↪ (π₁(G)_I)_tors; G(L)_x = G(L)_{x̄} ∩ G(L)^1, G(L)^1 := κ_G^{-1}((π₁(G)_I)_tors). Over E: P°_Ω = Fix_{G(E)}(Ω) ∩ ker κ_G; 𝒢°_x depends only on x̄ ∈ B(G^ad, E).

  Sources: [Haines–Rapoport], Def. 1, Prop. 3 and its proof, Rem. 4, pp. 1–3; Rem. 11, p. 7; Lem. 17, p. 9; [Kisin–Pappas], §1.1.2, arXiv pp. 6–7; [Kisin–Pappas–Zhou], 2.1.1, arXiv pp. 10–11. Requires: *parahoric-group-scheme*; RG2.1/*kottwitz-homomorphism*; *neron-finite-type-and-connected-models*; RG2.1/*z-extension-existence*; RG2.2/*enlarged-and-reduced-building*.

- **Full fixers versus connected parahorics.** x ∈ B(G, Ĕ), G over E. (1) 𝒢_x = 𝒢°_x iff κ_G(𝒢_x(O_Ĕ)) = 1; π_0((𝒢_x)_κ) ⊂ (π₁(G)_I)_tors. (2) π₁(G)_I torsion-free ⇒ 𝒢_x = 𝒢°_x ∀x. (3) Types J ⊂ K, K-parahoric connected ⇒ J-parahoric connected. (4) G simply connected: fixer = connected fixer = type-preserving facet stabilizer. (5) G_der a product of Res of split groups, X_*(G_ab)_I torsion-free, x very special ⇒ 𝒢_x = 𝒢°_x. (6) PGL_2, edge barycentre x: Fix(x) = Stab(edge) = N(I) ⊋ I = P°_x, index 2.

  Sources: [van Hoften], §2.2.1, Lem. 2.2.2 and Lem. 2.2.4, arXiv pp. 13–15; [Kisin–Zhou], Lem. 4.2.4, arXiv p. 34; [Bruhat–Tits II], 4.6.32, p. 137. Requires: *parahoric-kottwitz-characterization*; RG2.1/*algebraic-fundamental-group*; RG2.2/*stabilizers-and-fixers*.

- **The reductive quotient of the special fibre.** Facet F (or point x): 𝒢̄_F := 𝒢°_{F,κ}/R_u(𝒢°_{F,κ}) (also G_x) is connected reductive over κ. The closure of a maximal split torus S, F ⊂ A(S), maps onto a maximal split torus of 𝒢̄_F; relative roots = gradients a of affine roots a + k vanishing on F (non-multipliable ones over κ̄); Weyl group W_F = Fix(F) ⊂ W_aff. κ finite or alg. closed ⇒ P°_F/P_F^+ ≅ 𝒢̄_F(κ), P_F^+ the pro-unipotent radical.

  API (in `BruhatTits.Parahoric`): `reductiveQuotient` — 𝒢̄_F as a finite-type Hopf κ-algebra; `reductiveQuotient_isReductive` — 𝒢̄_F connected reductive over κ; `reductiveQuotientMap` — injective Hopf map κ[𝒢̄_F] → κ ⊗_O A; `reductiveQuotient_rootSystem` — Φ(𝒢̄_F) = gradients of affine roots zero on F; `reductiveQuotient_weylGroup` — W(𝒢̄_F) = W_F = Fix(F) ⊂ W_aff; `parahoricQuotientEquiv` — κ finite/alg. closed: P°_F/P_F^+ ≃ 𝒢̄_F(κ).

  Tests: `reductiveQuotient_gl_n_vertex` — GL_n, standard vertex: 𝒢̄_x ≅ GL_{n,κ}; `reductiveQuotient_torus` — torus T: 𝒢̄ = reductive quotient of 𝒯°_κ, a κ-torus; `reductiveQuotient_not_specialFibre` (non-example) — Iwahori of GL_2: special fibre has unipotent radical ≠ 1, so 𝒢̄_C is a proper quotient.

  Sources: [Bruhat–Tits II], 4.6.12, p. 129; 5.1.31, p. 158; [Haines–Rapoport], Prop. 12, p. 7; [Fintzen], §3, arXiv pp. 8–9. Requires: *parahoric-group-scheme*; ReductiveGroups layer 5; ReductiveGroups layer 6; ReductiveGroups layer 3; `TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadical`; `TauCeti.reductiveCommHopfAlgProperty`.

- **Pro-unipotent radicals, reduction and nested facets.** Facet F: P_F^+ := ker(P°_F → 𝒢̄_F(κ)), pro-unipotent radical (G_{x,0+}). (1) P_F^+ ⊲ P°_F, pro-p if κ finite, char p. (2) P°_F ↠ 𝒢°_F(κ) ↠ 𝒢̄_F(κ) (κ finite/alg. closed). (3) F ⊂ F̄': 𝒢°_{F'} → 𝒢°_F extending id; P°_{F'} ⊂ P°_F, P_F^+ ⊂ P_{F'}^+; P°_{F'} = preimage of p(F')(κ), p(F') ⊂ 𝒢̄_F κ-parabolic, Levi 𝒢̄_{F'}; F' ↦ p(F') order-reversing bijection onto κ-parabolics.

  Sources: [Bruhat–Tits II], 4.6.33, pp. 137–138; 5.1.32, p. 158; [van Hoften], §2.2.3, arXiv p. 14. Requires: *reductive-quotient-of-special-fibre*; RG2.0/*smooth-model-congruence-quotients*; *extension-principle*; ReductiveGroups layer 7.

- **Parahorics under unramified base change.** K'/K unramified Galois (finite, K^sh, Ĕ), integers O', Ω bounded in an apartment of B(G, K) ⊂ B(G, K'): 𝒢_Ω ⊗_O O' ≅ 𝒢'_Ω, 𝒢°_Ω ⊗_O O' ≅ 𝒢'°_Ω Gal-equivariantly; P°_Ω(K) = P°_Ω(K') ∩ G(K) = P°_Ω(K')^{Gal(K'/K)}; E-parahorics of σ-stable facets of B(G, Ĕ) = σ-fixed Ĕ-parahorics.

  Sources: [Bruhat–Tits II], 5.1.8–5.1.9 and 5.1.30–5.1.31, pp. 148, 157–158; 5.2.6–5.2.8, pp. 164–165; [He 2018], §4.3, p. 12; [van Hoften], §2.2.3, arXiv p. 14. Requires: *parahoric-group-scheme*; RG2.2/*unramified-descent-of-building*; *extension-principle*.

- **Hyperspecial vertices.** x ∈ B(G, K), equivalent: (a) 𝒢°_x reductive model; (b) 𝒢_x reductive (so 𝒢_x = 𝒢°_x); (c) x hyperspecial: special in B(G, K') ∀ finite unramified K'/K. Exist iff G unramified; then reductive O-models ↔ reduced-building hyperspecial vertices (𝒢 = 𝒢_x), hyperspecial subgroups = the 𝒢_x(O), one G^ad(K)-orbit, stable under finite extensions. Ramified quasi-split G: special, no hyperspecial vertices.

  Sources: [Bruhat–Tits II], 4.6.15 and 4.6.31, pp. 130, 136–137; [Bruhat–Tits II], 4.6.26, p. 135; [Prasad–Yu], Lem. 4.2, p. 7. Requires: *reductive-quotient-of-special-fibre*; *reductive-model*; *extension-principle*; RG2.2/*building-field-extension-embedding*; RG2.2/*facets-and-special-points*.

- **Compact subgroups lie in hyperspecial subgroups after extension.** E/ℚ_p finite. (1) g ∈ G(E) in a compact open subgroup ⇒ for a finite F/E splitting G and a maximal torus ∋ g_s, g ∈ parahoric of a hyperspecial vertex of B(G, F). (2) Compact C ⊂ G(E) fixes a rational point of B(G, E); for finite F/E splitting G with e(F/E) clearing the denominators its image x ∈ B(G, F) is hyperspecial, so C ⊂ 𝒢_x(O_F).

  Sources: [Kisin–Zhou], Lem. 6.2.1 and its proof, arXiv p. 57. Requires: RG2.2/*bruhat-tits-fixed-point-theorem*; RG2.2/*building-field-extension-embedding*; *hyperspecial-vertices*; *neron-finite-type-and-connected-models*; ReductiveGroups layer 7.

- **Generic points of facets and connected stabilizers.** x ∈ facet F ⊂ B(G, K) generic :⟺ 𝒢_x = 𝒢_{x'} for x' near x in F (open dense; then 𝒢_x = 𝒢_F). (1) 𝒢_x = 𝒢°_x, y generic in x's facet ⇒ 𝒢_y = 𝒢_x; so parahoric schemes are 𝒢_y's, y generic. (2) G unramified over ℚ_p, 𝒢°_x(ℤ_p) ⊂ hyperspecial ⇒ 𝒢°_x = 𝒢_{x'}, x' generic in x's facet.

  Sources: [Kisin–Pappas–Zhou], footnote 3 to Prop. 2.2.2 and the paragraph after it, arXiv p. 12; [Kisin–Pappas], Rem. 4.2.14 b), arXiv p. 57. Requires: *fixer-versus-parahoric*; *hyperspecial-vertices*; *parahoric-group-scheme*.

### RG2.3.4 — Associated, quasi- and very special parahorics

- **Associated parahorics under adjoint identifications.** K henselian discretely valued, perfect κ; f: G → G′, f^ad: G^ad ≅ G′^ad; x ∈ B(G,K), x̄ its image in B(G^ad,K) = B(G′^ad,K), x′ ∈ B(G′,K) a lift of x̄. Associated parahoric of 𝒢°_x: 𝒢′°_{x′}. Independent of x′ (central direction) and of x over x̄; f extends uniquely to an O-hom 𝒢°_x → 𝒢′°_{x′}.

  API (in `BruhatTits.ParahoricExt`): `associatedParahoric` — 𝒢′°_{x′}, x′ any lift of x̄, f^ad an iso; `associatedParahoric_eq_of_lift` — 𝒢′°_{x′} = 𝒢′°_{x″} for lifts x′, x″ of x̄; `associatedParahoric_hom` — unique O-hom 𝒢°_x → 𝒢′°_{x′} extending f; `associatedParahoric_id` — f = id: associated parahoric = 𝒢°_x; `associatedParahoric_comp` — associated of associated = that of f′∘f.

  Tests: `associatedParahoric_sl2_gl2` — SL_2 → GL_2, standard vertex: associated parahoric GL_2/O, O-points GL_2(O); `associatedParahoric_self` — f = id_G: returns 𝒢°_x itself; `associatedParahoric_not_stabilizer` (non-example) — GL_2 → PGL_2, x edge barycentre: O-points = Iwahori image ⊊ stabilizer of x̄ in PGL_2(K).

  Sources: [Kisin–Zhou], §2.3.1, arXiv v2 p. 11; [Kisin–Pappas], §1.1.2, arXiv v3 p. 7 (IHÉS pp. 127–128); [Haines–Rapoport], Prop. 3, Rem. 4 and Rem. 11, pp. 1–3, 7. Requires: *parahoric-group-scheme*; *extension-principle*; RG2.2/*enlarged-and-reduced-building*; RG2.2/*building-functoriality-central-extensions*.

- **Quasi-parahoric group schemes.** K finite over ℚ_p or Q̆_p; no condition on p (source: p > 2). Quasi-parahoric for G: smooth affine O-group 𝒦, generic fibre G, with 𝒦° = 𝒢°_x and 𝒢°_x(Ŏ) ⊆ 𝒦(Ŏ) ⊆ 𝒢_x(Ŏ) for some x ∈ B(G,K); equivalently a σ-stable subgroup of the finite abelian 𝒢_x(Ŏ)/𝒢°_x(Ŏ). Extremes: 𝒢°_x and 𝒢_x.

  API (in `BruhatTits.ParahoricExt`): `IsQuasiParahoric` — 𝒦° = 𝒢°_x, 𝒢°_x(Ŏ) ⊆ 𝒦(Ŏ) ⊆ 𝒢_x(Ŏ); `isQuasiParahoric_parahoric` — 𝒢°_x is quasi-parahoric; `isQuasiParahoric_fixer` — 𝒢_x is quasi-parahoric; `quasiParahoricEquivSubgroup` — 𝒦 ↔ σ-stable subgroups of 𝒢_x(Ŏ)/𝒢°_x(Ŏ); `IsQuasiParahoric.index_finite` — [𝒦(Ŏ) : 𝒦°(Ŏ)] | |(π₁(G)_I)_tors|, finite.

  Tests: `isQuasiParahoric_simplyConnected` — G simply connected: every quasi-parahoric 𝒦 has 𝒦 = 𝒦°; `isQuasiParahoric_normTorus_count` — Ramified norm-one torus over E: exactly two quasi-parahorics, 𝒯° and 𝒯^ft; `not_isQuasiParahoric_stabilizer` (non-example) — GL_2, vertex x: stabilizer of x̄ in GL_2(K) ∋ ϖ ∉ 𝒢_x(Ŏ); not a quasi-parahoric's points.

  Sources: [Kisin–Pappas–Zhou], §2.1.1, arXiv v3 pp. 10–11; [Haines–Rapoport], Prop. 3, Rem. 4 and Rem. 11, pp. 1–3, 7. Requires: *parahoric-group-scheme*; *extension-principle*; *fixer-versus-parahoric*.

- **Very special vertices and parahorics.** G quasi-split over E; σ-stable apartment and base alcove a over Ĕ; W_a, S̃ = reflections in walls of a, W_0 relative Weyl group. K ⊂ S̃ very special: W_K ⊂ W̃ ≅ W_0 via W̃ → W_0, i.e. v_K special over Ĕ and all unramified extensions. K σ-stable ⇒ 𝒢_K(O_E) very special parahoric; such K exists, containing the Iwahori of a (not conversely).

  API (in `BruhatTits.ParahoricExt`): `IsVerySpecial` — K ⊂ S̃ with W_K → W_0 bijective; `isVerySpecial_iff_special_unramified` — ⇔ v_K special over every unramified ext; `exists_isVerySpecial_sigmaStable` — quasi-split G: ∃ σ-stable very special K; `iwahori_le_verySpecialParahoric` — Iwahori of a ≤ parahoric of any vertex of ā; `IsVerySpecial.isSpecial` — very special ⇒ special.

  Tests: `isVerySpecial_split_iff_hyperspecial` — Split G: very special ⇔ hyperspecial; for GL_n the conjugates of GL_n(O); `isVerySpecial_SL2_both` — SL_2: both vertices of the base alcove are very special (W_K ≅ ℤ/2 = W_0); `not_isVerySpecial_special_ramified` (non-example) — Odd ramified unitary G: a vertex special over E but not over Ĕ is not very special.

  Sources: [van Hoften], §2.2.5, arXiv v4 p. 15; [Haines], §§1–3. Requires: *parahoric-subgroup*; *hyperspecial-vertices*; RG2.1/*frobenius-action-on-apartment*; RG2.1/*echelonnage-root-system*.

- **Parahorics under central extensions.** α: G → G̃ central, kernel Z; x̃ = α_*(x); 𝒵 ⊂ 𝒢°_x, 𝒵′ ⊂ 𝒢_x closures of Z. (a) α extends uniquely to 𝒢_x → 𝒢̃_x̃, 𝒢°_x → 𝒢̃°_x̃. (b) G tamely split, Z torus or finite, p ∤ |Z|: 𝒵 smooth, 𝒢°_x/𝒵 ≅ 𝒢̃°_x̃ (fppf); Z summand of an induced torus ⇒ 𝒵 = Néron°(Z); 𝒵′ smooth = ker(𝒢_x → 𝒢̃_x̃), yet 𝒢_x → 𝒢̃_x̃ may fail fppf surjectivity. (c) Z R-smooth torus, no tameness: 𝒵 smooth, π_0(𝒵) = ker(X_*(Z)_I → X_*(T)_I) (T = Z_G(S), S max Ĕ-split), 𝒢°_x/𝒵 ≅ 𝒢̃°_x̃ (fppf).

  Sources: [Kisin–Pappas], §1.1.3, Prop. 1.1.4 and proof, Rem. 1.1.8, arXiv v3 pp. 7–8 (IHÉS pp. 128–129); [Kisin–Zhou], §2.4.12, Prop. 2.4.13 and proof, arXiv v2 pp. 17–18; [Bruhat–Tits II], 1.2.13, 1.7.6, 4.2.15, §4.6. Requires: *parahoric-group-scheme*; *extension-principle*; *big-cell-criteria*; *quotients-over-a-dvr*; *neron-model-closed-immersions*; *torus-models-exact-sequences*; RG2.2/*building-functoriality-central-extensions*; RG2.1/*steinberg-quasi-split*; RG2.0a/*tame-fixed-points-of-weil-restriction*.

### RG2.3.5 — Integral models of stabilizers for classical and Hodge-type groups

- **Parahorics of GL and GSp as lattice-chain automorphism groups.** dim V < ∞; x ∈ B(GL(V),K) ↔ graded periodic (Λ_•, c), ϖΛ_0 ⊂ Λ_{r−1} ⊂ ⋯ ⊂ Λ_0. (a) 𝒢ℒ_x = fixer = closure of GL(V) in ∏_{i<r} GL(Λ_i) = Aut(Λ_•), smooth. (b) tot(L) := ⊕_{i<r} Λ_i ⊂ V^r (no ϖΛ_0): 𝒢ℒ_x ↪ GL(tot(L)) closed. (c) ψ perfect alternating, x ∈ B(GSp(V),K) ↔ almost self-dual, (Λ^i)^∨ = Λ^{−i−a}: 𝒢𝒮𝒫_x = closure of GSp(V) in ∏_{−(r−1)−a≤i<r} GL(Λ^i) = similitude automorphisms of Λ^• = closure in GL(Λ′), Λ′ = ⊕_i Λ^i ⊂ ⊕_i V, ψ′ = ⊕ψ; scaled, Λ′ ⊂ Λ′^∨.

  Sources: [Bruhat–Tits 1984], 3.6 Théorème, 3.7 Corollaire, 3.8, printed pp. 288–289; [Kisin–Pappas], §1.1.9 and §1.1.11, arXiv v3 pp. 8–10 (IHÉS pp. 130–131); [Kisin–Pappas–Zhou], §2.3 and Lem. 2.3.1, arXiv v3 pp. 13–14. Requires: RG2.2/*gl-building-lattice-chains*; RG2.2/*gsp-building-self-dual-chains*; *bruhat-tits-group-scheme*; *extension-principle*; `Submodule.IsLattice`.

- **Closed immersion of fixer schemes for minuscule embeddings.** K p-adic, char 0 (or k((π)), separability assumed); G split over finite tame Galois K̃/K, group Γ; ρ: G ↪ GL(V) faithful minuscule; ι: B(G,K) → B(GL(V),K) toral. ∀x: ρ extends to a closed immersion ρ_x: 𝒢_x → 𝒢ℒ_{ι(x)}. (i) bounded Ω ⊂ B(G,K) = B(G,K̃)^Γ: 𝒢_{Ω,K} ≅ (Res_{Õ/O} 𝒢_{Ω,K̃})^Γ, closed in Res_{Õ/O} 𝒢_{Ω,K̃}; (ii) ρ_x closed if G's closure in 𝒢ℒ_{ι(x)} is smooth.

  Sources: [Kisin–Pappas], §1.3.1, Prop. 1.3.3 and proof, (1.3.5)–(1.3.12), §1.3.8, Prop. 1.3.9, §1.3.13, arXiv v3 pp. 16–20 (IHÉS pp. 139–143); [Bruhat–Tits 1984], 3.5, 3.6, 3.9(2), printed pp. 287–289; [Bruhat–Tits II], 2.2.3, 2.2.5. Requires: RG2.2/*minuscule-toral-embedding*; *lattice-chain-stabilizer-schemes*; *bruhat-tits-group-scheme*; *schematic-closure*; *big-cell-criteria*; RG2.0a/*tame-fixed-points-of-weil-restriction*; RG2.0a/*integral-weil-restriction*.

- **Closed immersions of fixers for R-smooth groups.** F/ℚ_p or F/Q̆_p finite; G/F, centralizer of a maximal F̆-split torus R-smooth; 𝒢_x fixer of x ∈ B(G,F). (a) β: G ↪ G′ closed, G^der ≅ G′^der, x′ induced: β extends to a closed 𝒢_x ↪ 𝒢′_{x′}. (b) p > 2, K/F finite: 𝒢_x ↪ Res_{O_K/O_F} 𝒢_{x,K} closed. (c) p > 2, K̃/F finite, G R-smooth, β as in (a): G → Res_{K̃/F} G′_{K̃} extends to a closed 𝒢_x ↪ Res_{Õ/O} 𝒢′_{x′}. (d) SL_2 satisfies (b): ϖ_F^n primitive in ϖ_K^{ne−k}O_K over O_F (0 ≤ k < e), so G_a → Res G_a extends to A¹ ↪ A^{[K:F]}, a ↦ (a,0,…,0).

  Sources: [Kisin–Zhou], §2.4.7, Prop. 2.4.8, Prop. 2.4.10, Lem. 2.4.11, arXiv v2 pp. 15–17; [Kisin–Pappas–Zhou], §2.1.4 and Prop. 2.1.5(3) with proof, arXiv v3 p. 11. Requires: *r-smooth-torus*; *neron-model-closed-immersions*; *bruhat-tits-group-scheme*; RG2.0a/*integral-weil-restriction*; *hodge-type-fixer-immersion*.

- **Tame realization of stabilizers as fixed points of hyperspecial models.** p > 2; K finite over ℚ_p or Q̆_p; G tame classical (G^ad: no exceptional/triality factors; factors Res_{L/K} PGL_m(D) with p ∤ ind D); x ∈ B(G,K) generic in its facet; 𝒢 = 𝒢_x; R := Res_{Õ/O}. (1) ∃x′, 𝒢_{x′} = 𝒢_x, and K̃/K finite tame Galois (Γ) with G_{K̃} split, x′ hyperspecial over K̃. (2) 𝒢̃_{x′}/Õ reductive, Γ acting Õ-semilinearly (extending G_{K̃}); 𝒢 ≅ (R𝒢̃_{x′})^Γ. (3) ρ: G ↪ GL(V): ∃ Γ-stable Õ-lattice Λ̃ ⊂ V_{K̃}, 𝒢̃_{x′} ↪ GL(Λ̃) closed (tameness not needed), 𝒢 ↪ (R GL(Λ̃))^Γ ↪ GL(Λ̃) closed; (R GL(Λ̃))^Γ = GL(L), L = {(π̃^iΛ̃)^Γ}, tot(L) an O-direct summand of Λ̃. (4) F/ℚ_p finite in Q̄_p: F^t = F·ℚ_p^t.

  Sources: [Kisin–Pappas–Zhou], §2.2.1, Prop. 2.2.2 and proof, arXiv v3 pp. 12–14; [Kisin–Pappas–Zhou], §2.3.2, Lem. 2.3.3, §2.3.6, Prop. 2.4.2, Rem. 2.4.3, §2.4.4 (2.4.5), arXiv v3 pp. 14–17; [Kisin–Pappas–Zhou], Lem. 6.1.2, arXiv v3 p. 65. Requires: *hyperspecial-vertices*; *reductive-closed-immersion-criterion*; RG2.0a/*tame-fixed-points-of-weil-restriction*; *lattice-chain-stabilizer-schemes*; RG2.2/*tame-descent-of-building*; RG2.0a/*integral-weil-restriction*.

- **Models of similitude, derived and adjoint groups.** (a) dim V = 2n, h perfect symmetric: GO(V,h) = {g : h(gv,gv′) = c(g)h(v,v′)} has two components; GO^+(V): c(g)^n = det g. (b) p > 2, 𝒢/ℤ_p smooth, 𝒢 ↪ GSp(Λ) closed, Λ = Λ^∨, central G_m ⊂ 𝒢: c: 𝒢 → G_m and ker c smooth. (c) (G′,μ′) → (GL(Λ),μ_d) very good local Hodge embedding, ψ perfect alternating on V = Λ_{ℚ_p}, Λ = Λ^∨, G := (G′ ∩ GSp(V))° R-smooth, G^der ≅ G′^der, H := 𝒢′ ∩ GSp(Λ) smooth: (G,μ) → (GL(Λ),μ_d) very good, fixer of G = union of components of H. (d) Z_G R-smooth torus, G^ad quasi-tame ⇒ G R-smooth. (e) G tame, p ∤ |π₁(G^der)|: closure of G^der in a parahoric 𝒢_{ℤ_(p)} of G = fixer of x^ad, its identity component the parahoric of G^der; Z_G connected or p ∤ rk Z_{G^der} ⇒ parahoric of G^ad = (𝒢/𝒵)°, 𝒢^{ad°} → 𝒢^{ad} extends id.

  Sources: [Kisin–Pappas–Zhou], §6.2.1, arXiv v3 p. 69; [Kisin–Pappas–Zhou], Lems. 7.2.11, 7.2.13, 7.2.14 with proofs, arXiv v3 pp. 84–85; [Kisin–Pappas], Lem. 4.6.2, arXiv v3 p. 64. Requires: *parahoric-group-scheme*; *r-smoothness-criteria*; *central-extensions-of-parahorics*; *lattice-chain-stabilizer-schemes*; *r-smooth-fixer-immersions*.

- **Hyperspecial lattices for orthogonal and quaternionic groups.** p > 2. (a) K̃/K tame Galois (Γ), G′ = GO^+(V,h) split over K̃, x ∈ B(G′,K̃) Γ-fixed with hyperspecial fixer: it is the fixer of a Γ-stable Õ-lattice Λ̃ ⊂ V_{K̃}, Λ̃^∨ = π̃^aΛ̃; after √π̃ and the (still tame) Galois closure, rescale to Λ̃^∨ = Λ̃; model GO^+(Λ̃,h). (b) D quaternion division/K, main involution: any nondegenerate quaternionic hermitian S on T_0 ≅ D^s has a D-basis with S = Σ d̄_i d′_i. (c) Hence σ_{V_0}, σ_{T_0} are sums of basic symplectic representations.

  Sources: [Kisin–Pappas–Zhou], §6.2.2 and proof of Thm 6.2.3, arXiv v3 pp. 69–71; [Bruhat–Tits 1984], §§1–2 (norms on spaces with forms), printed pp. 259–286. Requires: *reductive-model*; *hyperspecial-vertices*; *tame-hyperspecial-realization*; *lattice-chain-stabilizer-schemes*.

### RG2.3.6 — Moy–Prasad filtrations

- **The Moy–Prasad filtration.** K henselian d.v., perfect κ; x ∈ B^e(G,K); r ≥ 0. Over K^sh: S maximal split, x ∈ A(S), T = Z_G(S); T(K^sh)_0 = 𝒯°(O^sh), T(K^sh)_r = {t ∈ T(K^sh)_0 : ω(χ(t) − 1) ≥ r ∀χ ∈ X^*(T)} (r > 0; ω extends the normalized valuation); U_{a,x,r}: affine α, gradient a, α(x) ≥ r. G(K^sh)_{x,r} := ⟨T(K^sh)_r, U_{a,x,r}⟩, G_{x,r} := G(K) ∩ G(K^sh)_{x,r}, G_{x,r+} := ∪_{s>r} G_{x,s}. G_{x,0} = 𝒢°_x(O); decreasing, right-continuous at jumps; G_{x,r} ⊴ G_{x,0}; [G_{x,r}, G_{x,s}] ⊆ G_{x,r+s}; independent of S; G_{gx,r} = gG_{x,r}g^{−1}; constant in the central direction; no tameness or condition on p.

  API (in `MoyPrasad`): `filtration` — G_{x,r} ⊆ G(K), x ∈ B^e(G,K), r ≥ 0; `filtrationPlus` — G_{x,r+} := ∪_{s>r} G_{x,s}; `filtration_zero` — G_{x,0} = 𝒢°_x(O); `filtration_antitone` — r ≤ s ⇒ G_{x,s} ⊆ G_{x,r}; `filtration_normal` — G_{x,r} ⊴ G_{x,0}; `commutator_filtration_le` — [G_{x,r}, G_{x,s}] ⊆ G_{x,r+s}; `filtration_conj` — gG_{x,r}g^{−1} = G_{gx,r}; `filtration_eq_closure_generators` — G_{x,r} = T(K)_r·∏_a U_{a,x,r} (bijectively).

  Tests: `filtration_GL_vertex` — GL_n, standard vertex, integer r ≥ 1: G_{x,r} = {g ∈ GL_n(O) : g ≡ 1 mod ϖ^r}; `filtration_split_torus` — Split torus G_m^n, r > 0: G_{x,r} = (1 + m^{⌈r⌉})^n, the unit filtration; `filtration_jump_nonexample` (non-example) — SL_2, standard vertex: G_{x,1/2} = G_{x,1}; not strictly decreasing in r.

  Sources: [Fintzen], §3, arXiv v2 pp. 8–9; [He 2018], §4.2 and §4.3, arXiv v3 p. 12; [Bruhat–Tits II], §4.6 (schémas 𝔊 attached to concave functions), printed pp. 123–145. Requires: *parahoric-subgroup*; *reductive-quotient-of-special-fibre*; RG2.1/*affine-roots-and-filtrations*; RG2.1/*valued-commutator-estimates*; RG2.2/*building*; RG2.2/*building-apartment-axioms*; RG2.2/*facets-and-special-points*; `TauCeti.unitFiltration`.

- **Moy–Prasad lattices in the Lie algebra and its dual.** r ∈ ℝ. g_{x,r} ⊂ g := Lie(G)(K): O-lattice spanned (over K^sh, Galois-fixed) by t_r := {X ∈ Lie(T)(K^sh) : ω(dχ(X)) ≥ r ∀χ ∈ X^*(T)} and g_{a,x,r} := {X ∈ g_a : affine-root value ≥ r}; g_{x,r+} := ∪_{s>r} g_{x,s}; g*_{x,r} := {X ∈ g* : X(g_{x,(−r)+}) ⊆ m}; g_r := ∪_x g_{x,r}, g*_r likewise. Depth d(x,X) := max{r : X ∈ g*_{x,r}} (d(x,0) = ∞), d(X) := sup_x d(x,X). Decreasing; ϖg_{x,r} = g_{x,r+1}; [g_{x,r}, g_{x,s}] ⊆ g_{x,r+s}; Ad(G_{x,s})-stable; jumps discrete, g_{x,r−ε} = g_{x,r} (ε small); y near x in one apartment ⇒ g_{x,r+} ⊆ g_{y,r} ⊆ g_{x,r−}; E/K finite tame ⇒ (g_E)_{x,r} ∩ g = g_{x,r}.

  API (in `MoyPrasad`): `lieLattice` — O-lattice g_{x,r} ⊂ Lie(G)(K), r ∈ ℝ; `dualLattice` — g*_{x,r} = {X ∈ g* : X(g_{x,(−r)+}) ⊆ m}; `depth` — d(x,X) = max{r : X ∈ g*_{x,r}}, d(x,0) = ⊤; `lieLattice_antitone` — r ≤ s ⇒ g_{x,s} ⊆ g_{x,r}; `lieLattice_add_one` — ϖ·g_{x,r} = g_{x,r+1}; `lie_bracket_lieLattice_le` — [g_{x,r}, g_{x,s}] ⊆ g_{x,r+s}; `lieLattice_tame_inter` — E/K tame: (g_E)_{x,r} ∩ g = g_{x,r}; `lieLattice_semicontinuous` — g_{x,r−ε} = g_{x,r} (ε≪1); g_{x,r+}⊆g_{y,r}.

  Tests: `lieLattice_GL_vertex` — gl_n, standard vertex, integer r: g_{x,r} = ϖ^r M_n(O); `depth_zero_eq_top` — d(x,0) = ⊤; `lieLattice_not_power_of_m` (non-example) — SL_2, edge barycentre: g_{x,1/2} ≠ ϖ^k sl_2(O) ∀k; off-diagonal valuations differ.

  Sources: [Fintzen], §3, arXiv v2 pp. 8–9; [Fintzen], proof of Thm 6.1 and Lem. 6.1.1, arXiv v2 pp. 22–23. Requires: *moy-prasad-filtration*; ReductiveGroups layer 2; RG2.1/*affine-roots-and-filtrations*; RG2.1/*valued-commutator-estimates*.

- **The Moy–Prasad isomorphism.** (a) r > 0: G_{x,r}/G_{x,r+} ≅ g_{x,r}/g_{x,r+} canonically (abelian, G(K)_x-equivariant). (b) G_{x,0}/G_{x,0+} = 𝒢̄_x(κ) (K = E, unramified extensions), acting on V_{x,r} := g_{x,r}/g_{x,r+} (finite-dim) and V_{x,r}^* algebraically. (c) G′ ⊂ G tame twisted Levi, x ∈ B(G′,K), s ≥ s′ ≥ s/2 > 0: (G′,G)_{x,s,s′}/(G′,G)_{x,s+} ≅ (g′,g)_{x,s,s′}/(g′,g)_{x,s+} canonically (abelian, G′(K)_x-equivariant); also derived variants; G′ = G: G_{x,s′} suitably cut down.

  Sources: [Fintzen], §3, arXiv v2 pp. 8–9; [Fintzen], §4 after Lem. 4.4, Def. 4.5, arXiv v2 pp. 16–17; Cors. 5.2–5.4, pp. 19–21; [He 2018], §4.3, Lem. 4.6 proof, arXiv v3 pp. 13–14. Requires: *moy-prasad-lie-lattices*; *reductive-quotient-of-special-fibre*; *yu-mixed-depth-groups*; *moy-prasad-filtration*.

- **Positive-depth subgroups are pro-p and cofinal.** x ∈ B^e(G,E), r > 0. (a) G_{x,r} compact open, ⊴ G_{x,0}, pro-p; G_{x,0+} = P_x^+. (b) {G_{x,r}} a basis at 1; each compact open subgroup contains some G_{x,r} with finite index. (c) alcove C, barycentre x_C, n ≥ 1: I_n := G_{x_C,n} ⊴ I := G_{x_C,0}, stable under algebraic/Frobenius automorphisms fixing C, decreasing, cofinal; 𝒢(O)_n (any smooth affine O-model) and G_{x,r} mutually cofinal.

  Sources: [He 2018], §4.2, arXiv v3 p. 12; [Fintzen], §3, arXiv v2 pp. 8–9. Requires: *moy-prasad-filtration*; *parahoric-subgroup*; *pro-unipotent-radical-and-nested-facets*; RG2.0/*congruence-neighbourhood-basis*; `TauCeti.IsProP`; *moy-prasad-isomorphism*; RG2.0/*integral-points-compact-open*; RG2.0/*congruence-subgroup*.

- **Yu's mixed-depth groups.** G′ ⊂ G tame twisted Levi pair, x ∈ B(G′,K), extended reals s ≥ t ≥ s/2 > 0; T ⊂ G′ maximal torus tamely split over E, x ∈ A(T,E). (G′,G)_{x,s,t} := G(K) ∩ ⟨T(E)_s, U_α(E)_{x,s} (α ∈ Φ(G′,T)), U_β(E)_{x,t} (β ∉ Φ(G′,T))⟩; (g′,g)_{x,s,t} likewise; G′ = G: G_{x,s}. Independent of T, E; G′_{x,s} ⊆ (G′,G)_{x,s,t} ⊆ G_{x,t}; ∩ G′(K) = G′_{x,s}; G′(K)_x-normalized. Derived variants H(K) ∩ (G′,G)_{x,s,t} (H = G^der, G) included; datum-specific conventions excluded.

  API (in `MoyPrasad`): `yuGroup` — (G′,G)_{x,s,t}, s ≥ t ≥ s/2 > 0; `yuLieLattice` — (g′,g)_{x,s,t}; `yuGroup_self` — (G,G)_{x,s,t} = G_{x,s}; `yuGroup_le` — G′_{x,s} ⊆ (G′,G)_{x,s,t} ⊆ G_{x,t}; `yuGroup_inf_twistedLevi` — (G′,G)_{x,s,t} ∩ G′(K) = G′_{x,s}; `yuGroup_independent` — independent of T and of E.

  Tests: `yuGroup_torus` — G′ = T tame-split maximal torus: (T,G)_{x,s,t} = T(K)_s·∏_β U_{β,x,t}, all roots β; `yuGroup_eq_filtration_of_eq` — s = t: (G′,G)_{x,s,s} = G_{x,s}; `yuGroup_not_group_without_half` (non-example) — GL_2, diagonal G′, s=3, t=1 < s/2: off-diagonal depth-1 commutators have diagonal depth 2.

  Sources: [Fintzen], §4 after Lem. 4.4, arXiv v2 pp. 16–17; [Fintzen], §3, arXiv v2 pp. 8–9. Requires: *moy-prasad-filtration*; RG2.2/*twisted-levi-subgroup*.

- **The mock exponential.** G tamely split over E, Chevalley system (x_α, X_α); x ∈ A(T,E) ∩ B(G,K), s > 0. e: g_{x,s} → G_{x,s} mock exponential: e(Σ a_αX_α + t) ≡ ∏ x_α(a_α)·e_T(t) mod G(E)_{x,2s} (t ∈ Lie(T), root order fixed); induces G_{x,s}/G_{x,s+} ≅ g_{x,s}/g_{x,s+}; Ad(e(Y))Z ≡ Z + [Y,Z] mod g_{x,t+2s}, Z ∈ g_{x,t}. Any characteristic, no series.

  API (in `MoyPrasad`): `mockExp` — e: g_{x,s} → G_{x,s}, s > 0, Chevalley system; `mockExp_mem` — e(g_{x,t}) ⊆ G_{x,t} for t ≥ s; `mockExp_graded` — e: g_{x,t}/g_{x,t+} ≅ G_{x,t}/G_{x,t+}, t ≥ s; `mockExp_ad` — Ad(e(Y))Z − Z − [Y,Z] ∈ g_{x,t+2s}; `mockExp_ordering` — root reordering changes e(Y) within G_{x,2s}.

  Tests: `mockExp_zero` — e(0) = 1; `mockExp_GL` — GL_n, standard vertex: e(Y) ≡ 1 + Y mod 1 + ϖ^{2s} M_n(O); `mockExp_not_hom` (non-example) — Not additive: SL_2, Y = X_α, Z = X_{−α}, depth s: e(Y+Z) ≠ e(Y)e(Z) at depth 2s.

  Sources: [Fintzen], proof of Lem. 5.1, arXiv v2 pp. 18–19; [Fintzen], §3, arXiv v2 pp. 8–9. Requires: *moy-prasad-isomorphism*; *moy-prasad-lie-lattices*; RG2.1/*valued-commutator-estimates*.

- **Generation of Moy–Prasad subgroups by a torus and the derived group.** G′ tamely split; H′ ∈ {G′^der, G′}; T ⊂ G′ maximal torus, x ∈ A(T,E), E tame splitting field; r > 0: G′_{x,r} = ⟨T(K)_r, H′(K) ∩ G′_{x,r}⟩.

  Sources: [Fintzen], Lem. 7.1 and Cor. 7.2 with proof, arXiv v2 p. 26. Requires: *moy-prasad-filtration*; *bruhat-tits-group-scheme*; *torus-models-exact-sequences*.

- **Lifting cocharacters of the reductive quotient.** x ∈ B(G,K), λ̄: G_m → 𝒢̄_x over κ. ∃ K-split S ⊂ G, closure 𝒮 ⊂ 𝒢°_x a split O-torus, 𝒮_κ ↠ maximal split torus of 𝒢̄_x ⊇ im λ̄; λ̄ lifts uniquely to λ: G_m → S; x ∈ A(S); α(x+ελ) − α(x) = ε⟨grad α, λ⟩ (affine α, 0 < ε ≪ 1). Hence X ∈ g*_{x,r}, lim_{t→0} λ̄(t)X̄ = 0 in V*_{x,r} ⇒ X ∈ g*_{x+ελ,r+}, ε ≪ 1. Tame case: some maximal torus ⊇ λ is tamely split.

  Sources: [Fintzen], proof of Cor. 3.8, arXiv v2 p. 11; proofs of Lem. 6.1.2 (p. 24) and Lem. 7.10 (p. 32). Requires: *reductive-quotient-of-special-fibre*; *moy-prasad-filtration*; *moy-prasad-lie-lattices*; RG2.2/*facets-and-special-points*.

### RG2.3.7 — Lang's theorem and lifting

- **Lang's theorem.** H smooth connected/F_q, F = q-Frobenius. (a) g ↦ g^{−1}F(g) onto H(F̄_q), finite étale. (b) H^1(F_q, H) = 1: each étale/fppf H-torsor has an F_q-point. (c) 1 → H′ → H → H″ → 1 exact, smooth, H′ connected ⇒ H(F_q) ↠ H″(F_q). Connectedness needed: ℤ/2 has Lang map 0, H^1 = ℤ/2.

  Sources: [Milne AG], Prop. 27.54, Cors. 27.55–27.56 and Notes, v2.00 pp. 487–488; [Lipnowski–Tsimerman], §5.4.2, arXiv v1 pp. 28–29; [Kisin–Zhou], proofs of Lem. 5.2.5 and Cor. 5.2.7, arXiv v2 pp. 52–53. Requires: ReductiveGroups layer 3; `groupCohomology`; `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`.

- **Lang's theorem for inverse limits and fixed cosets.** (a) affine F_q-scheme, finite type, n generators: ≤ q^n F_q-points. (b) H affine algebraic/F_q (any π_0), a ∈ H(F̄_q): {z : z^{−1}F(z) = a} is ∅ or a left H(F_q)-torsor, so finite. (c) directed inverse system (H_j) (F_q-homs) of smooth connected affine F_q-groups: z ↦ z^{−1}F(z) onto lim H_j(F̄_q). (d) σ ∈ Aut(H), J ≤ H σ-stable (not nec. normal), z ↦ z^{−1}σ(z) onto J ⇒ H^σ/J^σ ≅ (H/J)^σ.

  Sources: [He 2018], Lem. 15 (arXiv v3 Lem. 4.5) and its proof, p. 13; [Milne AG], Prop. 27.54, v2.00 p. 487. Requires: *lang-theorem*.

- **Frobenius-fixed coset lifting at positive level.** Ĭ ⊂ G(Ĕ) Iwahori of σ-stable alcove C, Ĭ_n := G(Ĕ)_{x_C,n} (n ≥ 1), I = Ĭ^σ, I_n = Ĭ_n^σ; g ∈ G(E). I_n/(I_n ∩ gI_ng^{−1}) ≅ (Ĭ_n/(Ĭ_n ∩ gĬ_ng^{−1}))^σ. Needs Ĭ_n ∩ gĬ_ng^{−1} = Ŏ-points of a smooth connected pro-unipotent scheme with smooth connected truncations; pro-p alone fails.

  Sources: [He 2018], §4.3 and Lem. 15 (arXiv v3 Lem. 4.5) with proof, pp. 12–13. Requires: *lang-for-pro-algebraic-groups*; *positive-depth-filtration-basis*; *parahoric-subgroup*; *unramified-base-change-of-parahorics*; *moy-prasad-filtration*.

- **Torsors under smooth models with connected special fibre.** O complete DVR, κ = F_q; 𝒢 smooth affine/O, 𝒢_κ connected. (a) 𝒢(O) ↠ 𝒢(κ). (b) H^1_ét(O, 𝒢) = 1. (c) 1 → 𝒢′ → 𝒢 → 𝒢″ → 1 fppf exact, smooth affine, 𝒢′_κ connected ⇒ 𝒢(O) ↠ 𝒢″(O). (d) g ↦ g^{−1}σ(g) onto 𝒢(Ŏ) (σ via the O-model). 𝒢_κ connected is essential: a disconnected fixer needs H^1(F_q, π_0(𝒢_κ)) = 0.

  Sources: [Gleason–Lim–Xu], Lem. 6.5 and proof of Prop. 6.9, arXiv v3 pp. 44, 48–49; [Kisin–Pappas], Cors. 4.2.12–4.2.13 and Rem. 4.2.14, arXiv v3 pp. 56–57; [Milne AG], Cors. 27.55–27.56, v2.00 p. 488. Requires: *lang-theorem*; RG2.0/*smooth-model-congruence-quotients*; *lang-for-pro-algebraic-groups*; `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`.

### RG2.3.8 — Examples

- **Iwahori and congruence levels of classical groups.** ḡ := g mod ϖ. (a) GL_n(E): Iwahori I = {g ∈ GL_n(O) : ḡ upper triangular}; pro-p Iwahori I^+ = {g ∈ I : ḡ unipotent} = G_{x_C,0+}; (1,n−1)-parahoric {g ∈ GL_n(O) : ḡ's last row ∈ (0,…,0,∗)} = fixer of O^n ⊃ O^{n−1} ⊕ ϖO; 1 + ϖ^mM_n(O) = G_{x_0,m}; images in PGL_n(E) = its parahorics, pro-p radicals. (b) GSp_4(E), ψ antidiagonal: Iw = fixer of the standard alcove's self-dual chain, Iw_1 its pro-p radical; g ∈ Iw_1 ⇒ char. poly ≡ (X − 1)^4 mod ϖ. (c) B quaternion/number field, O_B maximal order, N ≥ 1: (1 + NÔ_B)_v^× = principal congruence subgroups of the parahoric O_{B,v}^× (G_{x,r} at split places), decreasing in N, finite index in Ô_B^×. All compact open; pro-p ones pro-p.

  Sources: [Bruhat–Tits 1984], 3.6–3.12, printed pp. 288–290; [Kisin–Pappas], §1.1.9 and §1.1.11, arXiv v3 pp. 8–10; [Casselman], §1 (structure of p-adic groups, Iwahori subgroups and congruence filtrations of GL_n), draft 1995. Requires: *parahoric-subgroup*; *lattice-chain-stabilizer-schemes*; *positive-depth-filtration-basis*; RG2.0/*integral-points-compact-open*; `TauCeti.GeneralLinear.pointsMulEquiv`; `Matrix.isUnit_iff_isUnit_det`.

- **Parahorics of nonsplit tori.** E′/E sep. quadratic, T = R^1_{E′/E}G_m: T(E) compact, B(T,E) = pt. (a) unramified: X_*(T)_I = ℤ with σ = −1: invariants 0, no torsion; 𝒯^ft = 𝒯°, T(E)_0 = T(E). (b) ramified, p odd: X_*(T)_I = ℤ/2 (I acts by −1); T(E)_0 = ker κ_T ⊊ T(E) = 𝒯^ft(O), index 2 via u mod ϖ_{E′} = ±1. Tori: fixer ≠ parahoric ⇔ X_*(T)_I has torsion.

  Sources: [Haines–Rapoport], proof of Prop. 3 a) and the lemma on T(L) ∩ K_F, pp. 2–3; [Kisin–Zhou], §2.4.1, arXiv v2 p. 12. Requires: *neron-finite-type-and-connected-models*; RG2.1/*nonsplit-torus-example*; RG2.1/*kottwitz-homomorphism-torus*; RG2.0a/*norm-torus*.

## RG2.4 — Decompositions and double cosets

With the parahoric subgroups in hand, the layer defines the Iwahori–Weyl group `W̃ = N(K)/Z(K)_0` with its exact sequences, length function and Bruhat order, proves the Iwahori–Bruhat decomposition and the affine Tits system of the subgroup generated by the parahorics (the abstract BN-pair theory being Tau Ceti's `TitsSystem`), the Kottwitz quotient `G(K) → Ω` and the surjectivity of the Kottwitz map on rational points, the parahoric double-coset formula, the multiplication and cardinalities of Iwahori double cosets, and the finiteness of a compact double coset with its index formula (the Cartan double-coset set itself is infinite). It then handles dominant inertia-coinvariant cocharacters, the length formula for translations, the dominant normal form and the μ-admissible sets, the Cartan and Iwasawa decompositions at a special vertex in their exact generality, unimodularity and the Iwasawa integration formula, the Iwahori factorization, the comparison with an unramified group, and the examples (`GL_n`, rank one, nonsplit unitary groups) which show why the split simply connected index formula cannot be used universally.

### RG2.4.1 — The Iwahori–Weyl group

- **The Iwahori–Weyl group.** K complete discretely valued, perfect residue field; S, Z = Z_G(S), N = N_G(S). Z(K) has a unique parahoric Z(K)_0 (the O-points of the connected Néron model if Z is a torus), normal in N(K); W̃ = N(K)/Z(K)_0. ker ν is the maximal bounded subgroup of Z(K) ⊇ Z(K)_0, so W̃ acts on A by affine maps; W_a ⊂ W̃ and Ω is a complement to W_a. Over L, Z(L)_0 = ker κ_Z; over E, W̃_E = (W̃_L)^σ, σ acting through N(L).

  API (in `BruhatTits.IwahoriWeylGroup`): `mk` — The quotient map N(K) →* W̃ = N(K)/Z(K)_0; `mk_surjective` — The quotient homomorphism is surjective; `mk_eq_one_iff` — n ∈ N(K) maps to 1 in W̃ iff n ∈ Z(K)_0; `apartmentAction` — The action W̃ →* Aff(A) induced by ν; `apartmentAction_mk` — mk n acts on A as ν(n), for n ∈ N(K); `affineWeyl` — W_a ⊂ W̃, the image of N(K) ∩ G(K)_1; `lengthZero` — The stabilizer Ω ⊂ W̃ of a base alcove C; `affineWeyl_isComplement'_lengthZero` — W̃ = W_a ⋊ Ω: W_a and Ω are complements; `frobeniusFixedEquiv` — Over E, W̃_E ≅ (W̃_L)^σ.

  Tests: `splitTorus` — Split torus T of rank r: W̃ ≅ ℤ^r via the valuation map, acting on A by translations; `sl2_eq_affineWeyl` — SL_2: Ω is trivial and W̃ = W_a is infinite dihedral; `not_quotient_by_boundedPart` (non-example) — N(K)/ker ν is a proper quotient of W̃ if (X_*(T)_I)_tors ≠ 0; Iwahori–Bruhat fails.

  Sources: [Haines–Rapoport], §1 (definition of the Iwahori–Weyl group) and Lem. 14; [Richarz], Def. 1.1, (1.1) and (1.2), Lem. 1.6; [He 2018], §1.1. Requires: RG2.1/*apartment-action-kernel*; RG2.3/*neron-finite-type-and-connected-models*; RG2.1/*affine-weyl-group*; RG2.3/*parahoric-subgroup*; `QuotientGroup.mk'`.

- **Structure of the Iwahori–Weyl group.** (1) 1 → Z(K)/Z(K)_0 → W̃ → W_0 → 1 exact; over L (T = Z), κ_T : Z(L)/Z(L)_0 ≅ X_*(T)_I; over E, (X_*(T)_I)^σ. (2) W̃ = W_a ⋊ Ω, Ω ≅ W̃/W_a; over L, κ_G : W̃/W_a ≅ π₁(G)_I; over E, (π₁(G)_I)^σ. (3) A special vertex x splits W_0 ≅ W_x ⊂ W̃, so W̃ ≅ X_*(T)_I ⋊ W_0 over L; σ-equivariant only for σ-fixed x. (4) ker(W̃ → Aff(A)) = (X_*(T)_I)_tors (image of Z(K)_b); faithful iff X_*(T)_I is torsion-free; translations act via ν with image a lattice in V.

  Sources: [Haines–Rapoport], Lem. 14, Lem. 15, Prop. 13; [Richarz], §1.1, Lem. 1.3 and Lem. 1.6; [Kisin–Zhou], §2.1.2, (2.1.2.1). Requires: *iwahori-weyl-group*; RG2.1/*kottwitz-homomorphism*; RG2.1/*algebraic-fundamental-group*; RG2.1/*affine-weyl-group*; `Subgroup.IsComplement'`.

- **Length and Bruhat order on the Iwahori–Weyl group.** (W_a, S̃) the Coxeter system of C. ℓ(wτ) = ℓ_{W_a}(w) (w ∈ W_a, τ ∈ Ω) = #hyperplanes between C and wτ(C). wτ ≤ w'τ' iff τ = τ' and w ≤ w' in (W_a, S̃): a partial order, that of W_a on each W_aτ. Length zero = Ω; τ ∈ Ω permutes S̃ by conjugation, ℓ(τwτ^{-1}) = ℓ(w). Over E (σ-stable C), ℓ̆ of W̃_L restricted to W̃_E = (W̃_L)^σ differs in general from ℓ: a simple reflection of W̃_E is the longest element of a finite σ-orbit parabolic of W̃_L; Bruhat orders are compatible.

  API (in `BruhatTits.IwahoriWeylGroup`): `length` — The length ℓ : W̃ → ℕ of a base alcove; `length_mul_lengthZero` — ℓ(wτ) = ℓ(w) = ℓ(τw) for τ ∈ Ω; `length_eq_zero_iff` — ℓ(w) = 0 iff w ∈ Ω; `length_eq_coxeterLength` — On W_a, ℓ is the Coxeter length of (W_a, S̃); `length_inv` — ℓ(w^{-1}) = ℓ(w); `bruhatLE` — The Bruhat relation w ≤ w' on W̃; `bruhatLE_iff` — wτ ≤ w'τ' iff τ = τ' and w ≤ w' in W_a; `bruhatPartialOrder` — The Bruhat relation is a partial order; `length_mono_of_bruhatLE` — w < w' implies ℓ(w) < ℓ(w'); `simpleReflections` — S̃ ⊂ W_a: reflections in the walls of C.

  Tests: `length_simple` — Each s ∈ S̃ has length 1, and ℓ(sw) = ℓ(w) ± 1 for every w; `length_translation_gl2` — GL_2, base alcove between 0 and e_1: ℓ(t^{(1,0)}) = 1 and ℓ(t^{(1,-1)}) = 2; `not_bruhatLE_of_lengthZero_ne` (non-example) — PGL_2: 1 ≰ τ though ℓ(1) = ℓ(τ) = 0; length order and Coxeter order on S̃ ∪ {τ} both fail.

  Sources: [He 2018], §1.1; [He 2021], §2.2 and §4.3; [Richarz], Prop. 1.11 and Lem. 1.6. Requires: *iwahori-weyl-exact-sequences*; RootSystems layer 3; `CoxeterSystem`; `CoxeterSystem.length`.

### RG2.4.2 — Iwahori–Bruhat decomposition, the affine Tits system and double cosets

- **The Iwahori–Bruhat decomposition.** C an alcove (σ-stable over E), I = 𝒢°_C(O), ẇ ∈ N(K) a lift of w. w ↦ IẇI is well defined (I ⊇ Z(K)_0) and bijective W̃ → I\G(K)/I: G(K) = ⊔_w IẇI. Over E the IẇI are compact open, countably many.

  Sources: [Haines–Rapoport], Prop. 8; [Richarz], Thm 1.4 and (1.7); [He 2018], §1.1. Requires: *affine-tits-system*; *iwahori-weyl-exact-sequences*; RG2.3/*parahoric-subgroup*; `DoubleCoset.Quotient`; `DoubleCoset.mk`.

- **The affine Tits system of the parahoric subgroup.** G(K)_1 = ⟨parahorics⟩, N(K)_1 = N(K) ∩ G(K)_1, I the Iwahori of C, S̃ ⊂ N(K)_1/(N(K)_1 ∩ I) its wall reflections. (1) (G(K)_1, I, N(K)_1, S̃) is a Tits system with Weyl group W_a = N(K)_1/(N(K)_1 ∩ I) and Coxeter generators S̃. (2) Over L, G(L)_1 = ker κ_G ⊲ G(L), G(L)/G(L)_1 ≅ Ω ≅ π₁(G)_I; in general G(K) = ⟨G(K)_1, lifts of Ω⟩, each lift normalizing I and permuting S̃ (double Tits system). (3) So the Bruhat covering of G(K)_1 extends, coset by coset, to G(K) = ⋃_{w ∈ W̃} IẇI.

  Sources: [Bruhat–Tits I], §6.5 (Valuations discrètes et doubles systèmes de Tits) and Remarque (5.2.12); [He 2018], §1.1; [Richarz], §1.1, (1.2), Lem. 1.2 and Lem. 1.3. Requires: RG2.3/*parahoric-kottwitz-characterization*; RG2.1/*affine-weyl-group*; `TauCeti.TitsSystem`; `TauCeti.TitsSystem.bruhatCells_eq_univ`; RG2.3/*parahoric-subgroup*.

- **The Kottwitz quotient G(K) → Ω.** G(K)_1 = ⟨parahorics⟩. (1) G(K)_1 ⊲ G(K), N(K)/N(K)_1 ≅ G(K)/G(K)_1, so W̃/W_a ≅ Ω gives a surjection κ : G(K) → Ω, ker κ = G(K)_1. (2) κ(IẇI) = {pr_Ω(w)}, pr_Ω : W_a ⋊ Ω → Ω. (3) Over L, under Ω ≅ π₁(G)_I, κ = κ_G; over E, κ_G into (π₁(G)_I)^σ. (4) θ ∈ Aut G(K) preserving I, N(K) (e.g. σ): κ(θg) = θκ(g), κ(hgθ(h)^{-1}) = κ(g) + κ(h) − θκ(h); only κ(g) ∈ Ω_θ = Ω/(1 − θ)Ω is θ-conjugation invariant.

  Sources: [He 2018], §1.1 and §2.6; [Richarz], Lem. 1.3 and the exact sequence after Lem. 1.2; [Haines–Rapoport], Lem. 14. Requires: *iwahori-bruhat-decomposition*; RG2.1/*kottwitz-homomorphism*; *affine-tits-system*; `QuotientGroup.mk'`.

- **Surjectivity of the Kottwitz map on rational points.** (1) κ_G : G(E) → (π₁(G)_I)^σ is surjective. (2) 𝒢 a parahoric over O_E, ρ : G_sc → G_der: H = ρ(G_sc(E))𝒢(O_E) ⊲ G(E), κ_G : G(E)/H ≅ (π₁(G)_I)^σ (as ker κ_G ∩ G(E) = H). (3) G reductive over ℤ_p, T the centralizer of a maximal split torus, Γ = Gal(ℚ̄_p/ℚ_p): X_*(T)^Γ → π₁(G)^Γ and κ̃_G : G(ℚ_p) → π₁(G)^Γ are surjective; G(ℚ_p)/(ρ(G_sc(ℚ_p))G(ℤ_p)) ≅ π₁(G)^Γ. (4) If κ̃_{G_ad}(g_ad) lifts to π₁(G)^Γ, g_ad G_ad(ℤ_p) lies in the image of G(ℚ_p)/G(ℤ_p).

  Sources: [van Hoften], Lem. 3.4.2 and its proof; [Kisin], Lem. (1.2.3) and Lem. (1.2.4); [Richarz], Lem. 1.3. Requires: *kottwitz-quotient*; *iwahori-weyl-exact-sequences*; RG2.3/*frobenius-fixed-coset-lifting*; RG2.1/*kottwitz-homomorphism*.

- **Double cosets of parahoric subgroups.** F, F' ⊂ C̄ facets, P = 𝒢°_F(O), Q = 𝒢°_{F'}(O) ⊇ I, W_F = (P ∩ N(K))/Z(K)_0, W_{F'}: the standard parabolics of (W_a, S̃) for the walls through F, F'. PẇQ depends only on W_F w W_{F'}, and W_F\W̃/W_{F'} ≅ P\G(K)/Q. Each W_F w W_{F'} has a unique minimal-length element; these form ^F W̃^{F'} and G(K) = ⊔_{w ∈ ^F W̃^{F'}} PẇQ.

  Sources: [Haines–Rapoport], Prop. 8 (second part); [Richarz], Thm 1.4 and (1.7); [He 2018], §1.1. Requires: *iwahori-bruhat-decomposition*; *length-and-bruhat-order*; RG2.3/*parahoric-subgroup*; `DoubleCoset.Quotient`.

- **Multiplication of Iwahori double cosets.** (1) s ∈ S̃, w ∈ W̃: IṡI·IẇI = IṡẇI if ℓ(sw) = ℓ(w) + 1, = IṡẇI ⊔ IẇI if ℓ(sw) = ℓ(w) − 1; same on the right. Hence IẇI = Iṡ_1I⋯Iṡ_kI·Iτ̇I for w = s_1⋯s_kτ reduced, and IẇI·Iẇ'I = Iẇẇ'I if ℓ(ww') = ℓ(w) + ℓ(w'). (2) Over E, I_n the Moy–Prasad subgroups (I_1 the pro-p radical), g_1 ∈ IṡI: I_n g_1 I_n ⊆ g_1 I_{n−1}, as I_n ṡ I_n ⊂ ṡ I_{n−1} (ṡ moves U_{a,n}, ṡ(a) < 0, to depth n−1). (3) A compact X ⊂ G(E) meets finitely many IẇI; IẇI·Iẇ'I is a finite union of Iu̇I, ℓ(u) ≤ ℓ(w) + ℓ(w').

  Sources: [He 2018], §1.1, Prop. 2.3, Prop. 4.3 and the proof of Lem. 4.7; [Richarz], Lem. 1.8 and Lem. 1.9; [Bruhat–Tits I], §6.5. Requires: *iwahori-bruhat-decomposition*; *length-and-bruhat-order*; RG2.3/*positive-depth-filtration-basis*; *affine-tits-system*.

- **Cardinalities of Iwahori double cosets.** I the Iwahori of a σ-stable alcove, Ĭ, Ĭ_n over L, I_n (n ≥ 1) its Moy–Prasad subgroups, ℓ̆ the length of W̃_L on W̃_E = (W̃_L)^σ. (1) #(IẇI/I) = q^{ℓ(w)}; for s ∈ S̃, ℓ(s) = 1 but #(ĬṡĬ/Ĭ) = q^{ℓ̆(s)}, ℓ̆(s) = 1 iff the σ-orbit of s in S̃_L is a singleton. (2) n ≥ 1, g ∈ IẇI: #(I_n g I_n/I_n) = q^{ℓ̆(w)}, independent of g (via a reduced word in W̃_L, contraction, and Lang). (3) IẇI has q^{ℓ(w)}[I : I_n] left I_n-cosets, hence is a disjoint union of q^{ℓ(w) − ℓ̆(w)}[I : I_n] I_n-double cosets ([I : I_n] if ℓ̆(w) = ℓ(w), e.g. G split).

  Sources: [He 2018], Lem. 4.5 and Lem. 4.6 (Lem. 16 in the arXiv numbering), with the proof corrected after referee comments as noted in the acknowledgments; [Richarz], Prop. 1.11 and the final remark after it; [He 2021], §2.2. Requires: *simple-cell-multiplication*; RG2.3/*frobenius-fixed-coset-lifting*; *length-and-bruhat-order*; *iwahori-factorization*.

- **Finiteness of compact double cosets.** G a Hausdorff group, K, K' compact open, g ∈ G. (1) KgK' = ⊔ of [K : K ∩ gK'g^{-1}] left cosets hK' and of [K' : K' ∩ g^{-1}Kg] right cosets Kh, finitely many. (2) μ(KgK') = [K : K ∩ gK'g^{-1}]μ(K') for left Haar μ, = [K' : K' ∩ g^{-1}Kg]μ(K) for right Haar. (3) K\G/K' is finite iff G/K' is finite mod K; false for G(E): the Cartan set is infinite, finiteness is per double coset.

  Sources: [Casselman], §1.5, Lem. 1.5.1 and Prop. 1.5.2; [Zhu], Lem. 1.8. Requires: RG2.0/*congruence-neighbourhood-basis*; `Subgroup.index`; `Subgroup.relIndex`; `MeasureTheory.Measure.haar`; `MeasureTheory.Measure.IsHaarMeasure`; `DoubleCoset.doubleCoset`.

### RG2.4.3 — Cocharacters, lengths and admissible sets

- **Dominant inertia-coinvariant cocharacters.** S maximal L-split over E, T = Z_G(S). (1) X_*(T)_I mod torsion embeds in V = X_*(T)_I ⊗ ℝ = X_*(S) ⊗ ℝ, with the échelonnage system Σ (reduced, Weyl group W_0, coroot lattice X_*(T_sc)_I); a σ-stable alcove and special vertex fix Σ^+, C^+ = {⟨·, Σ^+⟩ ≥ 0}. (2) λ is dominant if its image is in C^+; W_0λ has a unique dominant λ_dom =: λ_w on W_0t^λW_0. (3) λ^♦ = (1/m)Σ_{i<m} σ^i(λ_dom) ∈ V (m the σ-order): σ-invariant, in C^+, Newton point of t^λ. (4) λ ≤ λ' iff λ' − λ ∈ ℕΣ^{∨,+} ⊂ X_*(T_sc)_I: a partial order compatible with Bruhat on translations of equal Ω-part and with real dominance. (5) The Hodge coweight μ̄ ∈ X_*(T)_I of a geometric conjugacy class {μ} is the image of its B-dominant member (B ⊃ T over L containing the chamber), well defined up to W_0, dominant form μ̄_dom.

  API (in `BruhatTits.Coinvariants`): `IsDominant` — ⟨λ, a⟩ ≥ 0 for all a ∈ Σ^+; `dominantRep` — λ_dom, the dominant element of W_0λ; `dominantRep_mem_orbit` — λ_dom is the unique dominant element of W_0λ; `dominantRep_of_isDominant` — If λ is dominant then λ_dom = λ; `frobeniusAverage` — λ^♦ ∈ V, the σ-average of λ_dom; `frobeniusAverage_isDominant` — λ^♦ ∈ C^+ and σ(λ^♦) = λ^♦; `dominanceLE` — λ ≤ λ' iff λ' − λ ∈ ℕΣ^{∨,+}; `dominancePartialOrder` — The dominance relation is a partial order; `hodgeCoweight` — μ̄ ∈ X_*(T)_I, the dominant image of {μ}.

  Tests: `isDominant_gl_n` — GL_n: λ ∈ ℤ^n is dominant iff λ_1 ≥ ⋯ ≥ λ_n; (0, 1)_dom = (1, 0); `dominanceLE_gl2` — GL_2: (1, 0) ≤ (2, −1) via the coroot (1, −1); (1, 0), (1, 1) incomparable: differ in π₁; `dominance_not_real_order` (non-example) — PGL_2, X_*(T)_I = ℤ: 0 ≤ 1 in V (coroot 2) yet 1 ∉ 2ℕ; ℝ-coefficients ignore the Ω-part.

  Sources: [Haines–Rapoport], Lem. 15 and the surrounding discussion; [Kisin–Zhou], §2.1.3–2.1.5; [Gleason–Lim–Xu], §2.1, (2.5). Requires: *iwahori-weyl-exact-sequences*; RG2.1/*echelonnage-root-system*; RG2.1/*minuscule-coweight*; RG2.1/*kottwitz-homomorphism*.

- **Length of translations.** x ∈ C̄ special, giving W̃ ≅ X_*(T)_I ⋊ W_0, Σ^+ and 2ρ_Σ (over L, or W̃_E ⊂ W̃_L). (1) ℓ(t^λ) = ⟨λ_dom, 2ρ_Σ⟩ = Σ_{a ∈ Σ^+} |⟨λ, a⟩|; = 0 iff λ is central; additive on dominant λ, λ'. (2) λ dominant, x ∈ W_0: ℓ(xt^λ) = ℓ(x) + ℓ(t^λ); the Newton point of t^λ is λ^♦; G quasi-split simple: η_σ(xt^λ) = x, xt^λ cordial, ℓ(xt^λ) − ℓ(η_σ(xt^λ)) = ⟨λ^♦, 2ρ⟩. (3) Over E, ℓ̆(t^λ) = ⟨λ_dom, 2ρ_{Σ_L}⟩, in general ≠ ℓ(t^λ) from Σ_E.

  Sources: [Kisin–Zhou], §2.1.5, (2.1.5.1); [He 2021], §4.3 (proof of Thm 4.2); [Richarz], Prop. 1.11. Requires: *length-and-bruhat-order*; *dominant-coinvariant-cocharacters*; RG2.1/*echelonnage-root-system*.

- **Dominant double-coset normal form.** W̃ = X_*(T)_I ⋊ W_0 via a special vertex, S its simple reflections, ^S W̃ = minimal elements of the left W_0-cosets. Uniquely w = xt^λy, λ dominant, x, y ∈ W_0, t^λy ∈ ^S W̃, and ℓ(w) = ℓ(x) + ℓ(t^λ) − ℓ(y); so W_0\W̃/W_0 ↔ dominant λ = λ_w.

  Sources: [He 2021], §2.2 (the unique expression w = x t^μ y with μ dominant and t^μ y ∈ ^S W̃, and the definition of η_σ); [He 2018], §1.1. Requires: *translation-length-formula*; *length-and-bruhat-order*; *parahoric-double-cosets*.

- **The μ-admissible set.** {μ} a geometric conjugacy class, μ̄ ∈ X_*(T)_I its dominant Hodge coweight, ≤ Bruhat on W̃ = W_a ⋊ Ω. Adm(μ) = {w ∈ W̃ : w ≤ t^{x(μ̄)}, some x ∈ W_0}. For a facet F ⊂ C̄, Adm^F(μ) = W_F Adm(μ) W_F; its image in W_F\W̃/W_F is the set of double cosets meeting Adm(μ). Adm(μ) is finite, a lower set, ⊆ W_a τ_μ (τ_μ ∈ Ω the image of μ̄ in π₁(G)_I), σ-stable if W_0μ̄ is (e.g. {μ} defined over E); its maximal elements are the t^{x(μ̄)}, each of length ⟨μ̄, 2ρ_Σ⟩; Adm(μ) ⊆ Perm(μ) = {w : w(v) − v ∈ conv(W_0μ̄) ∀ v ∈ C}, with equality in the known cases.

  API (in `BruhatTits.Admissible`): `admissibleSet` — Adm(μ) = {w : w ≤ t^{x(μ̄)}, some x ∈ W_0}; `mem_admissibleSet_iff` — w ∈ Adm(μ) iff ∃ x ∈ W_0, w ≤ xt^{μ̄}x^{-1}; `admissibleSet_finite` — Adm(μ) is finite; `admissibleSet_lowerSet` — If w' ≤ w and w ∈ Adm(μ) then w' ∈ Adm(μ); `translation_mem_admissibleSet` — t^{x(μ̄)} ∈ Adm(μ) for every x ∈ W_0; `length_le_of_mem_admissibleSet` — ℓ(w) ≤ ⟨μ̄, 2ρ_Σ⟩; equal iff w = t^{x(μ̄)}; `admissibleSet_subset_coset` — Adm(μ) ⊆ W_a τ_μ, τ_μ ∈ Ω the image of μ̄; `parahoricAdmissibleSet` — Adm^F(μ) = W_F Adm(μ) W_F for a facet F ⊂ C̄; `admissibleSet_subset_parahoricAdmissibleSet` — Adm(μ) ⊆ Adm^F(μ), with equality for F = C; `admissibleSet_frobenius` — W_0μ̄ σ-stable ⇒ σ(Adm(μ)) = Adm(μ).

  Tests: `admissibleSet_gl2_minuscule` — GL_2, μ = (1, 0): Adm(μ) = {t^{(1,0)}, t^{(0,1)}, τ}, three elements; `admissibleSet_central` — μ central: Adm(μ) = {t^μ}, one element of length zero; `admissibleSet_ne_lowerSet_of_dominant` (non-example) — GL_2, μ = (1, 0): the lower set of t^{μ̄} alone is {t^{(1,0)}, τ}, missing t^{(0,1)}.

  Sources: [Gleason–Lim–Xu], §2.1, (2.3)–(2.4), and §3.1; [van Hoften], §2 (notation for Adm(μ) and the μ-admissible locus); [He 2021], §2.2. Requires: *length-and-bruhat-order*; *dominant-coinvariant-cocharacters*; *translation-length-formula*; *parahoric-double-cosets*.

### RG2.4.4 — Cartan and Iwasawa decompositions

- **The Cartan decomposition.** x a special vertex, K = 𝒢°_x(O) (K̂ = 𝒢_x(O) the fixer). (1) G(K) = KZ(K)K = KN(K)K. (2) n ↦ KnK: W_0\W̃/W_0 ≅ K\G(K)/K (W_0 ≅ W_x) ≅ (Z(K)/Z(K)_0)/W_0 = {dominant λ ∈ X_*(T)_I} over L, Z(E)/Z(E)_0 mod W_0 over E. (3) G split, K = 𝒢(O) hyperspecial (𝒢 reductive over O): G(E) = ⊔_{λ ∈ X_*(T)^+} Kλ(ϖ)K, distinct for distinct λ. (4) K\G(K)/K is infinite once X_*(T)_I is (S ≠ 1); for K̂ the double cosets are unions over the finite K̂/K, indexed by W_0 ⋉ (K̂/K)-orbits.

  Sources: [Bruhat–Tits I], Prop. (4.4.3) (indexed as 'Cartan (décomposition de)' in the index, p. 11396 of the scan); [Haines–Rapoport], Prop. 8 and Prop. 13; [Zhu], Prop. 1.23 and Lem. 1.8. Requires: *parahoric-double-cosets*; *dominant-coinvariant-cocharacters*; *dominant-normal-form*; RG2.3/*hyperspecial-vertices*.

- **The Iwasawa decomposition.** x special, K = 𝒢_x(O) (or 𝒢°_x(O), as 𝒢_x(O) = 𝒢°_x(O)·(Z(K) ∩ 𝒢_x(O))), P = ZU a minimal K-parabolic, U(K) = ⟨U_a(K), a ∈ Φ^+⟩. (1) G(K) = KP(K) = KZ(K)U(K) = U(K)Z(K)K. (2) w ↦ KẇU(K): W_0\W̃ ≅ K\G(K)/U(K) (≅ Z(K)/Z(K)_0 ≅ X_*(T)_I over L). (3) Over E: K special maximal compact, K ∩ P(E) = (K ∩ Z(E))(K ∩ U(E)) and G(E)/P(E) compact.

  Sources: [Bruhat–Tits I], Prop. (7.3.1) and §7.3 (Décomposition d'Iwasawa et décomposition de Bruhat); [Bruhat–Tits I], Prop. (4.4.3); [Casselman], §1.6 (p. 841 of the scan) and the discussion of good compact subgroups before Lem. 1.5.1. Requires: *parahoric-double-cosets*; RG2.3/*parahoric-subgroup*; *iwahori-weyl-exact-sequences*; RG2.2/*stabilizers-and-fixers*.

- **Unimodularity and the Iwasawa integration formula.** (1) G(E) is unimodular: Δ is trivial on compact open subgroups, on Z(E) as Δ(z) = [zIz^{-1} : zIz^{-1} ∩ I]/[I : I ∩ zIz^{-1}] = 1 (root-group symmetry), and on lifts n_s with n_s² ∈ I, hence on IN(E)I = G(E). (2) K the fixer of a special vertex, P = MN = ZU minimal parabolic, vol(K) = vol(K ∩ M) = vol(K ∩ N) = 1, δ_P(m) = |det Ad(m)|_{Lie N}|: ∫_{G(E)} f = ∫_K∫_M∫_N f(mnk)δ_P(m)^{-1} dn dm dk (f ∈ C_c). (3) z ∈ Z(E): δ_P(z) = ∏_{a ∈ Φ^+} |a(z)|_E^{dim U_a} = q^{Σ_a dim U_a⟨v(z), a⟩}, χ(v(z)) = −ω(χ(z)).

  Sources: [Casselman], §1.5 (Lem. 1.5.1, Prop. 1.5.2) and §1.6; [He 2018], §1.2. Requires: *iwasawa-decomposition*; *compact-double-coset-finiteness*; *double-coset-cardinalities*; *iwahori-factorization*; `MeasureTheory.Measure.haar`; `MeasureTheory.Measure.IsHaarMeasure`; `MeasureTheory.Measure.IsMulRightInvariant`.

- **The Iwahori factorization.** P = MN a K-parabolic, M ⊇ Z, N = ⟨U_a : a ∈ Φ_N⟩, N^- opposite; H an Iwahori, a pro-unipotent radical P_F^+ (F ⊂ A) or a Moy–Prasad G_{x,r} (r > 0). (1) (H ∩ N^-) × (H ∩ M) × (H ∩ N) → H is bijective in every order; H ∩ U_a(K) = U_{a,f_H(a)}, H ∩ N^± = product of its root groups in any order. (2) Over L, Ĭ_n = ∏_{Φ_aff(Ĭ_n)} U_{a,n-shifted}·T_n (fixed order); for s simple, Ĭ_n ∩ ṡĬ_nṡ^{-1} has the wall root group of s at depth n+1, whence #(Ĭ_n ṡ Ĭ_n/Ĭ_n) = q^{ℓ̆(s)}. (3) The dominant monoid Δ_M = {z ∈ Z(E) : ⟨a, v(z)⟩ ≤ 0, a ∈ Φ_N} is a submonoid; z ∈ Δ_M contracts H ∩ N and z^{-1} contracts H ∩ N^-, so HzH = (H ∩ N^-)z(H ∩ M)(H ∩ N) and [H : H ∩ zHz^{-1}] = [H ∩ N : z(H ∩ N)z^{-1}] = δ_P(z)^{-1}.

  Sources: [He 2018], proof of Lem. 4.6 (Lem. 16 in the arXiv numbering); [Casselman], §1.4 (Iwahori factorization, pp. 632–747 of the scan) and Lem. 1.5.1; [Bruhat–Tits I], §6.4 (6.4.9, 6.4.48 and neighbours) via the valued root datum. Requires: RG2.3/*moy-prasad-filtration*; RG2.3/*parahoric-subgroup*; RG2.1/*valued-commutator-estimates*; RG2.3/*pro-unipotent-radical-and-nested-facets*.

- **Non-injectivity of the Kottwitz map for proper Levis.** G adjoint, ℚ_p-simple; P ⊊ G a ℚ_p-parabolic, M its Levi, φ Frobenius. ι : π₁(M)_I^φ → π₁(G)_I^φ is not injective; ker ι has positive rank: X_*(A_M) (A_M ≠ 1 the split centre of M) injects into π₁(M)_I^φ ⊗ ℚ, while π₁(G)_I^φ is finite (G adjoint).

  Sources: [Gleason–Lim–Xu], Lem. 4.12 and its proof, with (4.15). Requires: RG2.1/*algebraic-fundamental-group*; *iwahori-weyl-exact-sequences*; *kottwitz-quotient*.

- **Rational coset spaces are infinite.** G over ℚ_p with a nontrivial ℚ_p-split torus S, K ⊂ G(ℚ_p) compact open. (1) S(ℚ_p) ∩ K is compact, so ⊆ S(ℤ_p) = S(ℚ_p)_b = ker(v : S(ℚ_p) → X_*(S)) (χ(v(s)) = −ω(χ(s))); hence λ ↦ λ(p)K, X_*(S) → G(ℚ_p)/K, is injective. (2) So G(ℚ_p)/K is infinite, and for G adjoint ω_G : G(ℚ_p)/K → π₁(G)_I^φ (finite) is not injective: coset space and Cartan set are infinite.

  Sources: [Gleason–Lim–Xu], Prop. 4.11, Thm 4.12 and the displayed maps (4.12)–(4.13) in the proof. Requires: *cartan-decomposition*; RG2.0/*integral-points-compact-open*; RG2.1/*algebraic-fundamental-group*.

- **Transport of root combinatorics to an unramified comparison group.** G adjoint, simple over ℚ_p (or E); W̃ over L, σ preserving the base alcove. (1) Some unramified adjoint G' over ℚ_p has (W̃', σ') ≅ (W̃, σ), matching Σ with the absolute roots of G', X_*(T)_I with X_*(T'), π₁(G)_I with π₁(G'), lengths, Bruhat orders, Levi subsets (σ-stable sets of simple reflections), and dominant μ̄ with dominant μ' having Adm(μ) ↔ Adm(μ') and equal (κ, ν). (2) For σ-stable Λ, Q^∨ ⊆ Λ ⊆ P^∨ (coroot, coweight lattices of Σ; e.g. X_*(T)_I mod torsion), W_a = W_{Q^∨} ⊆ W_Λ = Λ ⋊ W(Σ) ⊆ W_{P^∨} have compatible lengths, Bruhat orders (on equal P^∨/Q^∨-components), ⟨·, 2ρ⟩, dominance, positive coroots and σ-actions; results for P^∨ (adjoint) or Q^∨ (simply connected) transfer along the chain.

  Sources: [van Hoften], §A.3.2; [He 2021], §5.2–5.4 and §6.3; [Haines–Rapoport], Lem. 15. Requires: *dominant-coinvariant-cocharacters*; *translation-length-formula*; *length-and-bruhat-order*; *admissible-set*.

- **Generation of hyperspecial points by root groups and the torus.** 𝒢 split reductive over a strictly henselian DVR O_L (or O), pinned (𝒯, 𝒰_a ≅ G_a); 𝒢(O_L) hyperspecial at x_0, I_C the Iwahori of an alcove C, x_0 ∈ C̄. (1) 𝒢(O_L) = ⟨𝒯(O_L), 𝒰_a(O_L) : a ∈ Φ⟩. (2) 𝒢(O_L) = ⟨𝒢_a(O_L) : a ∈ Φ⟩, 𝒢_a = ⟨𝒯, 𝒰_a, 𝒰_{-a}⟩ (a base Δ plus 𝒯 suffices; Φ = ∅: 𝒯(O_L)). (3) Via I_C = (I_C ∩ 𝒰^-)(I_C ∩ 𝒯)(I_C ∩ 𝒰) and 𝒢(O_L) = ⊔_{W_0} I_CẇI_C (reduction ≅ 𝒢(κ)): each cell lies in the generated subgroup, with ẇ a product of w_a(1) = u_a(1)u_{-a}(−1)u_a(1) ∈ 𝒢_a(O_L).

  Sources: [Bruhat–Tits I], §6.4 and §7.3 (Iwasawa and Bruhat decompositions); [Milne AG], the chapter on reductive groups and their root data (split reductive groups are generated by a maximal torus and the root groups). Requires: *iwahori-factorization*; RG2.3/*hyperspecial-vertices*; *parahoric-double-cosets*; RG2.3/*pro-unipotent-radical-and-nested-facets*; RG2.0/*smooth-model-congruence-quotients*.

### RG2.4.5 — Examples

- **Decompositions for GL_n.** GL_n, B upper triangular, K = GL_n(O). (1) GL_n(E) = ⊔ Kϖ^λK over λ_1 ≥ ⋯ ≥ λ_n in ℤ^n, ϖ^λ = diag(ϖ^{λ_i}), λ = elementary divisors of gO^n. (2) GL_n(E) = KB(E) = B(E)K, GL_n(E)/B(E) compact; cells KẇU(E), w ∈ ℤ^n. (3) GL_n(E) = ⊔ IẇI, W̃ = ℤ^n ⋊ S_n, Ω = ⟨τ⟩ ≅ ℤ (τ cycles the alcove vertices, τ^n = t^{(1,…,1)}), #(IẇI/I) = q^{ℓ(w)}. (4) k perfect: GL_n(W(k)) is transitive on Gr_μ(k) = {lattices in position μ to W(k)^n}, Gr(k) = ⊔_{μ dom} Gr_μ(k). (5) [Kϖ^{(1,0,…,0)}K : K] = (q^n − 1)/(q − 1) = #hyperplanes in 𝔽_q^n; [Kϖ^λK : K] = q^{⟨λ, 2ρ⟩}(1 + O(q^{-1})) = #{Λ ⊂ O^n of type λ}.

  Sources: [Zhu], Lem. 1.8 and §0.5; [Garrett], §17.5 (Bruhat and Cartan decompositions), p. 297; [Kisin], §1.2, (1.2.3). Requires: *cartan-decomposition*; *iwasawa-decomposition*; *iwahori-bruhat-decomposition*; *compact-double-coset-finiteness*; `Module.Basis.SmithNormalForm`; `TauCeti.GeneralLinear.pointsMulEquiv`.

- **Rank-one and nonsplit Cartan sets.** (1) SL_2, K = SL_2(O): Cartan set ↔ ℕ via diag(ϖ^n, ϖ^{-n}), index (q + 1)q^{2n−1} (n ≥ 1): vertices at distance 2n in the (q+1)-regular tree. (2) PGL_2, K = PGL_2(O): ↔ ℕ via diag(ϖ^n, 1), index (q + 1)q^{n−1} (n ≥ 1); odd n map nontrivially to π₁ = ℤ/2; Ω's order-2 element swaps the base-edge vertices; SL_2(E) cannot. (3) Unramified U_3, tree (q^3+1, q+1)-biregular, K hyperspecial of valency q^3+1: ↔ ℕ via λ_n = diag(ϖ^n, 1, ϖ^{-n}), index (q^3+1)q^{4n−3} (n ≥ 1), 4n = ℓ(t^{λ_n}) = ⟨λ_n, 2ρ_Σ⟩ (Σ = A_1, dim U_a = 2, dim U_{2a} = 1). (4) Ramified SU_3: the base alcove's two special vertices have non-isomorphic reductive quotients, so neither G(E) nor Ω swaps them; K_i\G/K_i ↔ ℕ at both (X_*(T)_I ≅ ℤ mod W_0 = ℤ/2), but the generating translation has index (q + 1)q^{a_i}, a_0 ≠ a_1: formula (1) for split simply connected groups fails. All four Cartan sets are infinite.

  Sources: [Garrett], §17.5 (Bruhat and Cartan decompositions), p. 297; [Haines–Rapoport], Prop. 8, Lem. 14 and Lem. 15; [Bruhat–Tits I], Prop. (4.4.3) and §4.4. Requires: *cartan-decomposition*; RG2.1/*unitary-rank-one-example*; *double-coset-cardinalities*; *compact-double-coset-finiteness*; RG2.3/*hyperspecial-vertices*; *translation-length-formula*.

## RG2.5 — Integral dual data

The dual based root datum is the flip of the absolute based root datum of `G` with the transported Galois action; the Langlands dual group `Ĝ` is the pinned split reductive group over `ℤ` attached to it by the Chevalley–Demazure construction of the Reductive groups roadmap, layer 9, and the Galois group acts on `Ĝ` through pinned automorphisms with finite image. The L-group `ᴸG = Ĝ ⋊ Γ` is a group functor over `ℤ` with its projection, inclusion and action law, in its finite Galois, absolute Galois and Weil forms; the layer proves its independence of all choices, identifies the centre of `Ĝ` with `π₁(G)`, constructs the Levi embeddings of L-groups and the duals of central isogenies, products, z-extensions and Weil restrictions, and checks the examples (tori, `GL_n`, `SL_n ↔ PGL_n`, the norm-one torus, and the self-duality of `GSp_4`). No square root of `q` enters: normalizations used by Satake transforms are coefficient choices of the consumers. Spaces of Langlands parameters are not part of this roadmap.

### RG2.5.1 — The dual group and its Galois action

- **The dual based root datum with its Galois action.** Ψ_0(G) = (X^*, Δ, X_*, Δ^∨) absolute based root datum, μ_G : Γ_K → Aut(Ψ_0(G)) its base-preserving Galois action. Ψ_0(G)^∨ := (X_*, Δ^∨, X^*, Δ): the ℤ-root-pairing flip of Ψ_0(G) (roots ↔ coroots, X^* ↔ X_*), base flipped. Canonical Aut(Ψ_0(G)) ≅ Aut(Ψ_0(G)^∨): f ↦ the flip-automorphism with weight map (f's coweight map)⁻¹ (same index permutation; inverse: transposition reverses composition). μ̂_G := this ∘ μ_G preserves the dual base and factors through Gal(K'/K), K' a finite Galois splitting field: finite image, open kernel

  API (in `LanglandsDual`): `dualRootDatum` — Ψ_0(G)^∨, the flip of Ψ_0(G) over ℤ; `dualRootDatum_root` — (Ψ^∨).root i = Ψ.coroot i; `dualRootDatum_flip` — (Ψ^∨)^∨ = Ψ, definitionally; `dualBase` — Δ^∨, the flipped base, same support; `autFlip` — Aut(Ψ) ≃* Aut(Ψ^∨), transpose-inverse; `autFlip_indexEquiv` — autFlip f permutes the index set as f; `dualGaloisAction` — μ̂_G = autFlip ∘ μ_G : Γ_K →* Aut(Ψ^∨); `dualGaloisAction_preserves_dualBase` — μ_G preserves Δ ⟹ μ̂_G preserves Δ^∨; `dualGaloisAction_finite` — μ̂_G has finite image.

  Tests: `dualRootDatum_gl_n` — GL_n (ℤ^n, roots = coroots = e_i − e_j): the flip equals it via id; GL_n is self-dual; `dualGaloisAction_split` — μ_G trivial (inner form of a split group): μ̂_G trivial; `transpose_antiHom` (non-example) — f ↦ f^t (no inverse): (fg)^t = g^t f^t, anti-homomorphism; fails on nonabelian image (D_4).

  Sources: [Buzzard–Gee], §2.1, pp. 4–5; [Kaletha], §4.1, pp. 16–17, and §5.3, p. 33. Requires: ReductiveGroups layer 7; `RootPairing.flip`; `RootPairing.Base.flip`; `RootPairing.Aut`; `Field.absoluteGaloisGroup`; `RootPairing.Base.flipSupportEquiv`.

- **The Langlands dual group over ℤ.** Ĝ := the pinned split reductive ℤ-group scheme of Ψ_0(G)^∨ (Chevalley–Demazure): smooth affine, connected reductive geometric fibres; split maximal torus T̂, characters X_*(T), T̂(R) = Hom(X_*(T), R^×); Borel B̂ ⊃ T̂, simple roots Δ^∨; per root α of G a root subgroup x_{α^∨} : G_a → Ĝ, t x_{α^∨}(r) t⁻¹ = x_{α^∨}(t(α^∨)r); pinning (T̂, B̂, (x_{α^∨})_{α∈Δ}). No √q (or of any integer) adjoined: Satake normalizations are the users' choice, not part of Ĝ

  API (in `LanglandsDual`): `dualGroup` — Hopf ℤ-algebra of Ĝ, pinned, from Ψ_0(G)^∨; `dualTorus` — Hopf ℤ-algebra of T̂ = ℤ[X_*(T)]; `dualTorusPointsEquiv` — T̂(R) ≃* Hom(X_*(T), R^×), natural in R; `dualTorusInclusion` — T̂(R) → Ĝ(R), natural in R; `dualRootSubgroup` — x_{α_i^∨} : (R,+) → Ĝ(R) for each root i; `dualRootSubgroup_conj` — t x_{α^∨}(r) t⁻¹ = x_{α^∨}(t(α^∨) r); `dualGroup_smooth` — Ĝ is smooth over ℤ; `dualGroup_reductive_fibres` — Ĝ_k connected reductive for every field k; `dualPinning` — (T̂, B̂, (x_{α^∨})_{α∈Δ}) for a base Δ.

  Tests: `dualGroup_gl_n` — G = GL_n: Ĝ = GL_n over ℤ with standard pinning; Ĝ(R) = GL_n(R); `dualGroup_torus` — G a torus (no roots): Ĝ = T̂, Ĝ(R) = Hom(X_*(T), R^×); `dualGroup_not_self` (non-example) — Ĝ ≠ G: PGL_2 has Ĝ = SL_2 (centre μ_2, PGL_2 none); the Chevalley group of Ψ_0(G) is wrong.

  Sources: [Buzzard–Gee], §2.1, pp. 4–5; [Buzzard–Gee], §2.2, p. 10. Requires: *dual-based-root-datum*; ReductiveGroups layer 9; `CommHopfAlgCat`; `TauCeti.SplitTorus.pointsMulEquiv`.

- **Pinned automorphisms of the dual group.** (1) Each automorphism of (Ψ_0(G)^∨, Δ^∨) lifts uniquely to a pinned automorphism of Ĝ: Aut(Ĝ, pinning) ≅ Aut(Ψ_0(G)^∨, Δ^∨). (2) k algebraically closed: Aut(Ĝ_k) = Inn(Ĝ_k) ⋊ Aut(Ĝ, pinning), so Out(Ĝ_k) ≅ Aut(Ψ_0(G)^∨, Δ^∨). (3) Ĝ^ad(k) acts simply transitively on the pinnings of Ĝ_k.

  Sources: [Buzzard–Gee], §2.1, p. 5. Requires: *langlands-dual-group*; ReductiveGroups layer 9; ReductiveGroups layer 7; `TauCeti.Pinning`.

- **The Galois action on the dual group.** μ̂_G : Γ_K → Aut(Ĝ, pinning) := pinned lift ∘ dual Galois action. Γ_K acts on each Ĝ(R) by automorphisms preserving T̂(R), B̂(R), pinning, natural in R; open kernel, finite image (via a finite splitting field); on T̂(R) = Hom(X_*(T), R^×): precompose the action on X_*(T). Trivial iff μ_G is (G inner form of a split group). Weil form: pull back along W_K → Γ_K (or any Γ' → Γ_K)

  API (in `LanglandsDual`): `galoisActionOnPinned` — μ̂_G : Γ_K →* Stab_{Aut(Ψ^∨)}(Δ^∨); `galoisActionOnPoints` — Γ_K →* MulAut(Ĝ(R)) for each ring R; `galoisActionOnPoints_eq_lift` — the pinned lift of galoisActionOnPinned; `galoisActionOnPoints_finite` — an open subgroup of Γ_K acts trivially; `galoisActionOnPoints_torus` — the action preserves T̂(R) ⊂ Ĝ(R); `galoisActionOnPoints_natural` — commutes with Ĝ(R) → Ĝ(R') for R → R'; `weilActionOnPoints` — pull-back along W → Γ_K, W a Weil group.

  Tests: `galoisAction_split` — μ_G trivial: Γ_K acts trivially on Ĝ(R); `galoisAction_unitary` — quasi-split unitary: the nontrivial element acts on Ĝ = GL_n by g ↦ J (g^t)⁻¹ J⁻¹; `galoisAction_not_inner` (non-example) — Int(n), n a nontrivial Weyl lift, keeps T̂ not B̂: unpinned; its L-group is not this one.

  Sources: [Buzzard–Gee], §2.1, p. 5; [Kaletha], §2, p. 9 (notation), and §5.3, p. 33. Requires: *pinned-automorphisms*; *dual-based-root-datum*; `Field.absoluteGaloisGroup`; `OpenSubgroup`; ClassFieldTheory layer 9.

### RG2.5.2 — The L-group and its functoriality

- **The L-group.** Γ → Γ_K (Galois form: Γ_K; finite: Gal(K'/K), K' finite Galois splitting field; Weil: W_K, K local). ^LG(R) := Ĝ(R) ⋊ Γ via μ̂_G, (g,γ)(g',γ') = (g μ̂_G(γ)g', γγ'); pr : ^LG(R) ↠ Γ, ker Ĝ(R), section γ ↦ (1,γ), natural in R. Finite form: affine ℤ-group scheme, Ĝ° = Ĝ, π_0 = Gal(K'/K); Galois form = its inflation, Weil form = its pull-back to W_K. No √q enters

  API (in `LanglandsDual`): `LGroup` — ^LG(R) = Ĝ(R) ⋊ Γ_K, Galois form; `projection` — pr : ^LG(R) →* Γ_K; `inclusion` — Ĝ(R) →* ^LG(R); `projection_surjective` — pr is surjective; `range_inclusion_eq_ker` — image of Ĝ(R) = ker pr; `mul_left` — (xy).left = x.left · μ̂_G(x.right)(y.left); `section_` — Γ_K →* ^LG(R), γ ↦ (1, γ); `mapCoeff` — R → R' induces ^LG(R) →* ^LG(R') over Γ_K; `finiteAction` — induced action of Γ_K/U, U ⊂ ker open normal; `inflation` — ^LG(R) →* Ĝ(R) ⋊ Γ_K/U: id on Ĝ(R), quotient; `WeilLGroup` — Ĝ(R) ⋊ W for a homomorphism W → Γ_K.

  Tests: `LGroup_split_prod` — Γ_K acting trivially on Ĝ(R): ^LG(R) ≃* Ĝ(R) × Γ_K over Γ_K (e.g. GL_n); `LGroup_trivial` — Ĝ(R) trivial: pr is an isomorphism ^LG(R) ≃* Γ_K; `LGroup_not_direct_product` (non-example) — γ acting nontrivially (unitary): the section does not commute with Ĝ(R): no direct product.

  Sources: [Buzzard–Gee], §2.1, p. 5; [Kaletha], §2, p. 9. Requires: *galois-action-on-dual-group*; `SemidirectProduct`; `SemidirectProduct.rightHom`; `SemidirectProduct.range_inl_eq_ker_rightHom`; `SemidirectProduct.rightHom_surjective`; `SemidirectProduct.map`; `QuotientGroup.lift`; ClassFieldTheory layer 9.

- **Independence of the L-group from choices.** ^LG canonical over Γ: (1) Ψ_0(G), μ_G canonical; (2) pinned duals Ĝ, Ĝ' of Ψ_0(G)^∨: unique pinned Ĝ ≅ Ĝ' is Γ-equivariant: ^LG ≅ ^LG' over Γ; (3) two pinnings of Ĝ_k (k alg. closed), lifts μ̂, μ̂'; h ∈ Ĝ(k) moving one to the other, μ̂' = Int(h)μ̂Int(h)⁻¹, and (g,γ) ↦ (hgh⁻¹,γ) : ^LG(k) ≅ ^LG'(k) over Γ depends only on h mod centre; hence Ĝ(k)-classes of admissible homomorphisms to ^LG(k) are canonical

  Sources: [Buzzard–Gee], §2.1, pp. 4–5. Requires: *l-group*; *pinned-automorphisms*; ReductiveGroups layer 9.

- **Centre of the dual group and π₁.** Z(Ĝ) ⊂ T̂ diagonalizable over ℤ, characters X_*(T)/Q^∨ = π₁(G), Γ_K-equivariant; so Z(Ĝ)(R) = Hom(π₁(G), R^×), natural in R, = centre of Ĝ(R) for R alg. closed. I ≤ Γ_K (e.g. inertia): X^*(Z(Ĝ)^I) = π₁(G)_I, the Kottwitz homomorphism's target. Z(Ĝ) torus iff π₁(G) torsion-free (iff G_der simply connected); finite iff G semisimple

  Sources: [Kaletha], §5.3, proof of Prop. 5.3, p. 33; [Haines–Rapoport], introduction, (1), p. 1. Requires: *langlands-dual-group*; *galois-action-on-dual-group*; RG2.1/*algebraic-fundamental-group*; `TauCeti.CommHopfAlgCat.centerGroupScheme`; `TauCeti.DiagonalizableGroup.pointsMulEquiv`.

- **Levi embeddings of L-groups.** P ⊂ G K-parabolic, Levi M; Borel pair T ⊂ M, B ⊂ P; Δ_M ⊂ Δ (simple roots of M) μ_G-stable. Then Ψ_0(M) = (X^*, Δ_M, X_*, Δ_M^∨), μ_M = μ_G|, M̂ = ⟨T̂, x_{α^∨} : α ∈ ℤΔ_M ∩ Φ⟩ ⊂ Ĝ, the μ̂_G-stable Levi of the standard parabolic of type Δ_M^∨; ^LM = M̂ ⋊ Γ ↪ ^LG over Γ. Ĝ-class choice-free; transitive in M' ⊂ M ⊂ G, matching dual tori (M = T, G quasi-split, P minimal)

  API (in `LanglandsDual`): `leviDual` — ⟨T̂(R), x_{α^∨}(R) : α^∨ ∈ span Δ_M^∨⟩ ⊂ Ĝ(R); `LLevi` — M̂(R) ⋊ Γ_K ⊂ ^LG(R); `leviEmbedding` — ^LM(R) →* ^LG(R) for a Levi M, Δ_M ⊂ Δ; `leviEmbedding_injective` — the Levi embedding is injective; `leviEmbedding_range` — its image is LLevi; `projection_comp_leviEmbedding` — pr_G ∘ leviEmbedding = pr_M; `leviEmbedding_trans` — Levi embeddings compose for M' ⊂ M ⊂ G.

  Tests: `leviEmbedding_torus` — G quasi-split, M = T (Δ_M = ∅): leviDual = T̂(R), image of ^LT = T̂(R) ⋊ Γ_K; `leviEmbedding_self` — M = G (Δ_M = Δ): leviDual = Ĝ(R), the embedding is the identity; `leviEmbedding_not_stable` (non-example) — U_3 quasi-split: GL_2 × GL_1 ⊂ GL_3 not Galois-stable (↦ GL_1 × GL_2); no K-Levi gives it.

  Sources: [Kaletha], §5.6, p. 45 (as used there for real groups); [Buzzard–Gee], §2.1, p. 5. Requires: *l-group*; *l-group-change-of-pinning*; ReductiveGroups layer 7.

- **Dual groups of isogenies, products and z-extensions.** (1) Z ⊂ G finite central, Ḡ = G/Z, T → T̄: dually a central isogeny Ĝ̄ → Ĝ, pinned, Γ_K-equivariant, kernel diagonalizable, characters X_*(T̄)/X_*(T); so ^LḠ → ^LG over Γ. (2) (G × G')^∧ = Ĝ × Ĝ' (diagonal action), ^L(G × G') = ^LG ×_Γ ^LG'. (3) z-extension G̃ → G, induced torus kernel Z: Ĝ ↪ Ĝ̃ Γ-equivariant closed, normal image ⊃ Ĝ̃_der, quotient a torus with characters X_*(Z); Z(Ĝ̃) a torus, π₁(G̃) torsion-free

  Sources: [Kaletha], §5.3, p. 33; [Kaletha], §4.1, pp. 16–17. Requires: *l-group*; *dual-based-root-datum*; RG2.1/*z-extension*; RG2.1/*z-extension-existence*; ReductiveGroups layer 9; `TauCeti.RootPairingIsogeny`; `TauCeti.IsCentralIsogeny`.

- **The L-group of a Weil restriction.** K'/K finite separable, G'/K' connected reductive, H = Res_{K'/K}G'. Ψ_0(H) induced: X^*(T_H) = ⊕_{τ : K' → K^sep} X^*(T')_τ, Γ_K permuting summands, inside via μ_{G'}; so Ĥ = ∏_τ Ĝ', μ̂_H(γ)(g_τ)_τ = (μ̂_{G'}(c(γ,τ))(g_{γ⁻¹τ}))_τ, c the induction cocycle, ^LH = Ĥ ⋊ Γ_K. Shapiro: admissible Γ_K → ^LH(R) mod Ĥ(R) ↔ admissible Γ_{K'} → ^LG'(R) mod Ĝ'(R)

  Sources: [Buzzard–Gee], §2.3, pp. 13–14. Requires: *l-group*; *dual-isogenies-and-products*; RG2.0a/*weil-restriction-character-lattices*; RG2.0a/*weil-restriction-separable-splitting*.

### RG2.5.3 — Examples

- **Dual groups of tori and GL_n.** (1) Torus T: T̂ = split ℤ-torus, characters X_*(T), Γ_K acting via X_*(T); ^LT = T̂ ⋊ Γ. T split: ^LT = T̂ × Γ; quadratic norm-one torus: G_m with inversion; Res_{K'/K}G_m: G_m^{[K':K]} permuted. (2) GL_n self-dual: Ĝ = GL_n/ℤ, standard pinning, trivial Galois, ^LGL_n = GL_n × Γ; (SL_n)^∧ = PGL_n, (PGL_n)^∧ = SL_n

  Sources: [Buzzard–Gee], §2.2, p. 7; [Kaletha], §4.1, p. 16. Requires: *l-group*; *galois-action-on-dual-group*; `TauCeti.SplitTorus.pointsMulEquiv`; `TauCeti.GeneralLinear.diagonalRootDatum`; `TauCeti.GeneralLinear.pointsMulEquiv`; RG2.0a/*norm-torus*.

- **GSp_4 is its own dual.** GSp_4/ℤ, T = diag(st_1,st_2,st_2⁻¹,st_1⁻¹): X^*(T) = {(a_1,a_2;c) ∈ ℤ³ : c ≡ a_1+a_2 (2)}, basis e_1 = (1,0;1), e_2 = (0,1;1), e_3 = (0,0;2), X_*(T) = {(b_1,b_2;d) ∈ (½ℤ)³ : b_i+d ∈ ℤ}, dual basis (f_i). Correct base α_1 = e_2−e_1, α_2 = e_3−2e_2, α_1^∨ = f_2−f_1, α_2^∨ = −f_2: i : X^*(T) → X_*(T) with symmetric matrix ((1,1,1),(1,0,1),(1,1,2)) in (e_i),(f_i) unimodular (det −1), an isomorphism Ψ ≅ Ψ^∨, i(α_1) = α_2^∨, i(α_2) = α_1^∨; GSp_4 is its own pinned dual over ℤ, trivial Galois. The printed base (α_1 = e_1−e_2, α_1^∨ = f_1−f_2, α_2^∨ = f_2) fails: ⟨α_2,f_2⟩ = −2, i(α_2) = f_2−f_1 is no printed simple coroot

  Sources: [Pilloni], §5.1.1, p. 20 (statement and coordinates checked by direct computation on the root datum); [Buzzard–Gee], §2.1, p. 5. Requires: *langlands-dual-group*; *dual-based-root-datum*; `TauCeti.Symplectic.diagonalTorus`.

## Sources

- [Anantharaman] Sivaramakrishna Anantharaman, *Schémas en groupes, espaces homogènes et espaces algébriques sur une base de dimension 1*, Mém. Soc. Math. France 33 (1973), 5–79. http://www.numdam.org/item/MSMF_1973__33__5_0.pdf
- [Bruhat–Tits 1984] François Bruhat, Jacques Tits, *Schémas en groupes et immeubles des groupes classiques sur un corps local*, Bull. Soc. Math. France 112 (1984), 259–301. http://www.numdam.org/item/10.24033/bsmf.2006.pdf
- [Bruhat–Tits I] François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. I. Données radicielles valuées*, Publ. Math. IHÉS 41 (1972), 5–251. http://www.numdam.org/item/10.1007/BF02715544.pdf
- [Bruhat–Tits II] François Bruhat, Jacques Tits, *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d'une donnée radicielle valuée*, Publ. Math. IHÉS 60 (1984), 5–184. http://www.numdam.org/item/10.1007/BF02700560.pdf
- [Buzzard–Gee] Kevin Buzzard, Toby Gee, *The conjectural connections between automorphic representations and Galois representations*, LMS Lecture Note Series 414 (2014), 135–187; arXiv:1009.0785v3. https://arxiv.org/abs/1009.0785
- [Calegari–Geraghty] Frank Calegari, David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, Invent. Math. 211 (2018), 297–433; arXiv:1207.4224v2. https://arxiv.org/abs/1207.4224
- [Casselman] W. Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*, draft of 1 May 1995. https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf
- [Conrad] Brian Conrad, *Weil and Grothendieck approaches to adelic points*, L'Enseignement Math. 58 (2012), 61–97. https://math.stanford.edu/~conrad/papers/adelictop.pdf
- [Edixhoven] Bas Edixhoven, *Néron models and tame ramification*, Compositio Math. 81 (1992), 291–306. http://www.numdam.org/item/CM_1992__81_3_291_0.pdf
- [Fintzen] Jessica Fintzen, *Types for tame p-adic groups*, Ann. of Math. 193 (2021), 303–346; arXiv:1810.04198v2. https://arxiv.org/abs/1810.04198
- [Garrett] Paul Garrett, *Buildings and Classical Groups*, Chapman & Hall (1997). https://www-users.cse.umn.edu/~garrett/m/buildings/book.pdf
- [Gleason–Lim–Xu] Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne–Lusztig varieties*, Invent. Math. 243 (2026), 805–861; arXiv:2208.07195v3. https://arxiv.org/abs/2208.07195
- [Haines] Thomas J. Haines, *Dualities for root systems with automorphisms and applications to non-split groups*, Represent. Theory 22 (2018), 1–26; arXiv:1604.01468v2. https://arxiv.org/abs/1604.01468
- [Haines–Rapoport] Thomas J. Haines, Michael Rapoport, *On parahoric subgroups*, appendix to Pappas–Rapoport, *Twisted loop groups and their affine flag varieties*, Adv. Math. 219 (2008), 118–198. https://www.math.umd.edu/~tjh/HRParahoric3.pdf
- [Harpaz–Wittenberg] Yonatan Harpaz, Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*, J. Amer. Math. Soc. 33 (2020), 775–805; arXiv:1802.09605v2. https://arxiv.org/abs/1802.09605
- [He 2018] Xuhua He, *Cocenters of p-adic groups, I: Newton decomposition*, Forum Math. Pi 6 (2018), e2; arXiv:1610.04791v3. https://arxiv.org/abs/1610.04791
- [He 2021] Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*, Forum Math. Pi 9 (2021), e9; arXiv:2001.03325v1. https://arxiv.org/abs/2001.03325
- [Kaletha] Tasho Kaletha, *Rigid inner forms of real and p-adic groups*, Ann. of Math. 184 (2016), 559–632; arXiv:1304.3292v5. https://arxiv.org/abs/1304.3292
- [Kisin] Mark Kisin, *Mod p points on Shimura varieties of abelian type*, J. Amer. Math. Soc. 30 (2017), 819–914. https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf
- [Kisin–Pappas] Mark Kisin, Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*, Publ. Math. IHÉS 128 (2018), 121–218; arXiv:1512.01149v3. https://arxiv.org/abs/1512.01149
- [Kisin–Pappas–Zhou] Mark Kisin, Georgios Pappas, Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*, Forum Math. Pi 14 (2026), e14; arXiv:2409.03689v3. https://arxiv.org/abs/2409.03689
- [Kisin–Zhou] Mark Kisin, Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*, Ann. of Math. 202 (2025), 1077–1156; arXiv:2103.09945v2. https://arxiv.org/abs/2103.09945
- [Lipnowski–Tsimerman] Michael Lipnowski, Jacob Tsimerman, *How large is A_g(F_q)?*, Duke Math. J. 167 (2018), 3403–3453; arXiv:1511.02212v1. https://arxiv.org/abs/1511.02212
- [Milne AG] J. S. Milne, *Algebraic Groups: the theory of group schemes of finite type over a field*, version 2.00 (2015; numbering differs from the CUP 2017 book). https://www.jmilne.org/math/CourseNotes/iAG200.pdf
- [Milne ISV] J. S. Milne, *Introduction to Shimura varieties*, revised 2017 (numbering of Clay Math. Proc. 4 (2005)). https://www.jmilne.org/math/xnotes/svi.pdf
- [Pappas–Rapoport] Georgios Pappas, Michael Rapoport, *Twisted loop groups and their affine flag varieties*, Adv. Math. 219 (2008), 118–198. https://arxiv.org/abs/math/0607130
- [Pilloni] Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*, Duke Math. J. 169 (2020), 1647–1807. https://doi.org/10.1215/00127094-2019-0075
- [Prasad] Gopal Prasad, *Finite group actions on reductive groups and buildings and tamely-ramified descent in Bruhat–Tits theory*, Amer. J. Math. 142 (2020), 1239–1267; arXiv:1705.02906v5. https://arxiv.org/abs/1705.02906
- [Prasad–Yu] Gopal Prasad, Jiu-Kang Yu (appendix by Brian Conrad), *On quasi-reductive group schemes*, J. Algebraic Geom. 15 (2006), 507–549. https://arxiv.org/abs/math/0405381
- [Richarz] Timo Richarz, *On the Iwahori–Weyl group*, Bull. Soc. Math. France 144 (2016), 117–124; arXiv:1310.4635v1. https://arxiv.org/abs/1310.4635
- [Stacks] The Stacks Project Authors, *The Stacks Project*, Tag 05Y8 (restriction of scalars) and Tag 05YF. https://stacks.math.columbia.edu/tag/05Y8
- [van Hoften] Pol van Hoften (appendix by Rong Zhou), *Mod p points on Shimura varieties of parahoric level*, Forum Math. Pi 12 (2024), e20; arXiv:2010.10496v4. https://arxiv.org/abs/2010.10496
- [Zhu] Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*, Ann. of Math. 185 (2017), 403–492; arXiv:1407.8519v3. https://arxiv.org/abs/1407.8519
- [Česnavičius] Kęstutis Česnavičius, *Purity for the Brauer group*, Duke Math. J. 168 (2019), 1461–1486; arXiv:1711.06456v4. https://arxiv.org/abs/1711.06456
