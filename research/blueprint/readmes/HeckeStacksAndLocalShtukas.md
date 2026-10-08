# Hecke correspondences on the Fargues–Fontaine curve and local shtuka cohomology

This roadmap builds the Hecke correspondences of G-bundles on the relative Fargues–Fontaine curve, the Hecke operators T\_V they define on D\_lis(Bun\_G,Λ) with their continuous action of products of the Weil group, the moduli spaces of local shtukas with their period maps and level towers, and the cohomology of these towers as complexes of smooth representations. It is the part of the geometrization of the local Langlands correspondence of Fargues and Scholze that lies between the geometry of Bun\_G with the geometric Satake equivalence, which it imports, and excursion operators with L-parameters, which consume it. The word "global" in "global Hecke stack" refers to the Fargues–Fontaine curve: the base field is a local field throughout, and shtukas over a global function field belong to another roadmap.

The plan has 51 nodes (18 theorems, 17 constructions, 13 comparisons, 2 definitions, 1 application) in five layers, with 215 API items and 94 unit tests on its definitions and constructions, and 22 planets. It is a plan at target level: one node for each object or theorem that a layer states, each with its exact statement, its hypotheses, an outline of the construction or proof, and its prerequisites. Every layer is planned and none is closed: 22 statements are requested from layers of other roadmaps and 9 inputs are recorded as gaps. Nothing here is formalised. The machine-readable form of this document is the [packet](../packets/HeckeStacksAndLocalShtukas.json); the [suggested Lean file](../suggested/HeckeStacksAndLocalShtukas.lean) proposes names and signatures and is not the specification.

## Scope and boundaries

**Built here.**

- **HS0**: the Hecke stack Hck^I\_G of modifications of G-bundles at a finite set I of legs, with its source, target, leg, unit, swap, repetition and localisation maps; relative positions and bounded substacks; descent, the Grassmannian fibres of the target map and the properness of bounded parts; chains of modifications and convolution; the twisted Beilinson–Drinfeld Grassmannian of a local shtuka datum; functoriality in the group and the behaviour of the Kottwitz invariant.
- **HS1**: the solid Satake kernel S′\_V, the Hecke operator T\_V(A) = p\_{2♮}(p\_1^\*A ⊗ S′\_V), its monoidality and functoriality in the set of legs, preservation of lisse, compact and universally locally acyclic objects, the duality formulas, the condensed structure on D\_lis(Bun\_G,Λ), the W\_E^I-equivariance of T\_V(A), and change of coefficients.
- **HS2**: moduli spaces of local shtukas over Q\_p with their framings, the spaces of modifications between two fixed bundles, the lattice functor, period maps and admissible loci, level towers and their limit, the tower over a general local field, rigid local Shimura varieties for minuscule bounds, the universal torsor on the admissible locus, the Weil descent datum, non-emptiness and connectedness of admissible loci, and the action on connected components.
- **HS3**: the complexes C\_K = f\_{K♮}S′\_W of a level-K shtuka space with their actions of J\_b(E) and of Weil groups, their identification with Hecke operators restricted to a stratum and with Huber's compactly supported cohomology, compactness for pro-p levels, admissibility and duality, the maps between levels, Hecke operators between two arbitrary strata, and the comparison with Rapoport–Zink towers.
- **HS4**: the Hecke action as a family functorial in finite sets, the creation and annihilation maps of a pair of dual legs with their triangle identities, and the geometric comparisons of Hecke kernels along maps of groups that induce an isomorphism of adjoint groups, products, Weil restriction and Levi subgroups.

**Imported, not built here.** The relative Fargues–Fontaine curve, its divisors and the gluing of G-torsors along them (`RelativeFarguesFontaine`); vector bundles and isocrystals, Banach–Colmez spaces and integral torsors near p = 0 (`VectorBundlesAndIsocrystals`); B(G), the Newton and Kottwitz maps, Bun\_G, its strata and their automorphism groups (`BunGAndNewtonStrata`); diamonds, v-stacks and the six operations (`DiamondsAndVStacks`, `DiamondSixOperations`); the B\_dR-affine Grassmannian, the local Hecke stack, Schubert varieties, the Satake category, fusion and the dual group (`GeometricSatakeAndFusion`); solid and lisse sheaves, relative homology and duality on Bun\_G (`VStackSheavesAndLisseCategories`); stable ∞-categories and their monoidal structures (`EnhancedDerivedSheaves`); smooth representations, compact induction and Hecke algebras (`SmoothRepresentationsOfLocalGroups`); integral highest-weight theory (the requested `ReductiveGroupsIntegralRepresentationsPartII` continuation of Tau Ceti’s `ReductiveGroups`); the local Weil group (Tau Ceti, `ClassFieldTheory`, layer 9). The nodes cite the supplying nodes by id; where a supplier has no node for a statement, the statement is listed under [Requests to other roadmaps](#requests-to-other-roadmaps).

**Built on this roadmap, elsewhere.** Excursion operators, the map to the Bernstein centre and L-parameters (`ExcursionOperatorsAndSpectralAction`: its layers ES0, ES1, ES6 and ES7 consume HS1, HS2, HS3 and HS4). In particular the existence of one open subgroup of wild inertia acting trivially on all T\_V(A) for a compact A (Fargues–Scholze IX.5.1) is a theorem of ES1: HS4 supplies its inputs and does not state it. The identities of L-parameters under maps of groups, products, Weil restriction and parabolic induction (Fargues–Scholze IX.6–IX.7) are theorems of ES6 and ES7: HS4 supplies the comparisons of Hecke kernels only. The realisation of the local Langlands correspondence in the cohomology of the Lubin–Tate and Drinfeld towers belongs to `EndoscopicTransferAndUnitaryTraceComparison` (ET.6a) and to ES7.

**Continuations.** The paper catalogue of the atlas proposes three continuations of this roadmap, each starting where it stops: integral models of local shtuka spaces, with Rapoport–Zink spaces and their comparison with shtuka towers (`HeckeStacksAndLocalShtukasIntegralPartII`); affine Deligne–Lusztig varieties and their connected components (`HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig`); and the Lefschetz–Verdier trace formula with the Kottwitz conjecture for the cohomology of local shtuka spaces (`HeckeStacksAndLocalShtukasKottwitzPartII`). None of their objects is planned here, with one exception: the node `HS3/classical-comparison` states the comparison of minuscule shtuka towers with Rapoport–Zink towers, which the layers consuming HS3 cite; the first entry under [Proposed changes of structure](#proposed-changes-of-structure) says where it belongs.

## Conventions

These conventions are fixed for all layers. A node repeats the ones it uses under "Hypotheses and conventions".

**Fields and groups.** E is a nonarchimedean local field with residue field F\_q of characteristic p and uniformizer π, of characteristic 0 or p; a node that needs E = Q\_p says so (this is the case for the moduli of shtukas after Scholze–Weinstein in HS2, which involve a smooth model over Z\_p, and for rigid spaces). Ĕ is the completion of the maximal unramified extension of E, with Frobenius σ, and k is an algebraic closure of F\_q; all v-sheaves and v-stacks are on Perf\_k. G is a reductive group over E. For b ∈ G(Ĕ), σ-conjugation is b ↦ y·b·σ(y)⁻¹, B(G) is the set of σ-conjugacy classes, and J\_b = G\_b is the σ-centraliser, with G\_b(E) = {y ∈ G(Ĕ) : y·b·σ(y)⁻¹ = b}. For a conjugacy class μ of cocharacters, its field of definition is written F (with F̆ = F·Ĕ), and F\_i for the classes μ\_i of several legs, so that E always denotes the base field (the sources write E for the field of definition in the one-leg case over Q\_p, and E\_i for several legs); μ⁻¹ is the class of the inverse cocharacters, with dominant representative −w\_0μ; μ♯ is the image of μ in π\_1(G)\_Γ (written μ^♮ in the nodes that follow Scholze–Weinstein and Gleason–Lim–Xu).

**The curve and bundles.** For S ∈ Perf\_k, X\_S = Y\_S/φ^Z is the relative Fargues–Fontaine curve and Div¹ = Spd Ĕ/φ^Z the sheaf of degree-one closed Cartier divisors of X\_S; for a finite extension F of E, Div¹\_F = Spd F̆/φ\_F^Z. G-bundles are exact tensor functors from Rep\_E(G) to vector bundles. E\_b is the G-bundle of b ∈ G(Ĕ); the Kottwitz map κ is normalised so that the first Chern class of E\_b is −κ(b): for GL\_n, κ(b) is the valuation of det b, 𝒪(1) is the bundle of the isocrystal (Ĕ, π⁻¹σ), and for G\_m, E\_b = 𝒪(−v(b)).

**Modifications and their orientation.** An object of Hck^I\_G over S is ((D\_i)\_{i∈I}, E\_1, E\_2, α) with α an isomorphism from E\_1 to E\_2 away from the legs D\_i, meromorphic along them; p\_1 remembers E\_1 and p\_2 remembers E\_2 with the legs. The relative position of such an object at a leg is the dominant cocharacter μ for which, in trivialisations of the completions, α lies in the double coset of μ(ξ); one says that E\_1 has position μ relative to E\_2. For G\_m, the pair (L(−D), L) has position 1. Bounded substacks Hck^I\_{G,≤μ•} are defined by bounding this position, by the sum of the μ\_i over the legs that coincide. With this orientation:

- κ(E\_1) = κ(E\_2) + μ♯;
- the kernel of T\_V is supported on positions bounded by the weights of V, and T\_V(A) at a bundle E\_2 integrates A over the modifications E\_1 ⇢ E\_2 of these positions; for G\_m and the character z ↦ zⁿ, T\_V moves a sheaf from line bundles of degree d to line bundles of degree d + n;
- a local shtuka space for (G, b, μ) parametrises modifications from the trivial bundle E\_1 to E\_b bounded by μ, and it is non-empty exactly when [b] ∈ B(G, μ⁻¹), that is κ(b) = −μ♯ and ν\_b ≤ (μ⁻¹)^♦.

This is the orientation of Scholze–Weinstein, Lectures 23–24, and of Fargues–Scholze IX.7. Three nodes of HS2 that follow Gleason–Lim–Xu state their results in the orientation of that paper, in which μ is replaced by μ⁻¹; each of them gives the translation. Places where a source prints the opposite orientation are listed under [Mistakes in the sources](#mistakes-in-the-sources).

**Coefficients and sheaves.** ℓ ≠ p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root of q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ ⊗\_{Z\_ℓ,disc} Λ. No condition on ℓ beyond ℓ ≠ p is imposed. Q is a finite quotient of W\_E through which the action of W\_E on the pinned dual group Ĝ over Z\_ℓ factors, and Rep\_Λ((Ĝ⋊Q)^I) is the exact category of representations on finite projective Λ-modules. D\_■ is the category of solid sheaves, D\_lis its full subcategory of lisse sheaves and D\_ét the category of étale sheaves for torsion coefficients. For a map f of small v-stacks, f\_♮ is the left adjoint of f^\* on solid sheaves (relative homology); it is defined for every map and is not the functor Rf\_!. S\_V is the normalised Satake sheaf of V and S′\_V = D(S\_V)^∨ its solid kernel: relative Verdier dual, then solid dual. Half Tate twists use the fixed √q. An action of W\_E^I on an object of D\_lis(Bun\_G,Λ) is always an action of the condensed group, for the condensed structure of HS1; an action of the abstract group on an ordinary complex does not give it.

**Levels.** K denotes a compact open subgroup of G(E) (or of G\_b(E)). Statements of compactness and of perfectness of invariants require K pro-p; counterexamples for other levels are given in the nodes. C\_K = f\_{K♮}S′\_W is the complex of level K, tr and pull are the maps between levels induced by the finite étale transition maps, and the tower object is the colimit of the C\_K along pull.

**Statements beyond the sources.** Where the cited texts assert a statement without proof, or state it in a special case only, the node says so and gives the argument in its outline. Mistakes found in the sources are recorded in the last section, and the nodes use the corrected statements.

## Layers and their order

| Layer | Content | Nodes | Rests on |
| --- | --- | --- | --- |
| HS0 | Global and local Hecke stacks | 6 | relative curve and torsors, Bun\_G, Grassmannians |
| HS1 | Kernels and the coherent Hecke action | 10 | HS0; Satake category, solid and lisse sheaves |
| HS2 | Local shtuka moduli and bounds | 18 | HS0; strata of Bun\_G, integral torsors |
| HS3 | Cohomology as a representation-valued functor | 10 | HS0, HS1, HS2; smooth representations |
| HS4 | Reusable compatibility library | 7 | HS0, HS1; fusion, dual group |

HS0 is geometry only and uses no sheaf theory. HS1 and HS2 are independent of each other. HS3 joins them: its central comparison identifies the homology of a shtuka space with a Hecke operator restricted to a stratum. HS4 rests on HS1 and is used by the layers on excursion operators. The node `HS0/demazure-generators-of-ULA-kernels` belongs to HS1 (it is the theorem that Hecke operators preserve lisse sheaves); its identifier is kept because other roadmaps cite it.

Each layer below lists its planets, its dependencies, the state of its plan, and then its nodes. For a node the entry gives the statement, the hypotheses, the outline of the construction or proof, and, for definitions and constructions, the API and the unit tests; then where the object is used, the acceptance tests, the prerequisites and the places in the sources.

## Pinned baseline

Statements were read in the source trees of Mathlib at commit `082e2d37e8b0463410cdb532e111cd43d5a66174` and of Tau Ceti at commit `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit (AUDIT-21, `data/library-coverage.json`) finds nothing of the five layers built. All five reviewed entries classify the layers as not built at the pinned commits. Tau Ceti supplies TauCeti.IsSmoothDiscrete and TauCeti.SmoothDiscreteTopRep: topological representations on discrete modules with open point stabilizers and continuous scalar action. The coefficient ring may be topological; a discrete coefficient ring makes the scalar continuity automatic. These declarations supply an abelian-level carrier, not the derived smooth category, compact induction or admissibility required here. No node duplicates a built construction reported by the audit.

The nodes cite the following declarations; each entry says exactly what the declaration supplies, and what it does not.

- `mathlib:CategoryTheory.Adjunction` (structure, `Mathlib/CategoryTheory/Adjunction/Basic.lean`). An adjunction F ⊣ G of ordinary categories: unit, counit and the two triangle identities. It is the form of the adjunctions f\_♮ ⊣ f^\* and T\_{V^∨} ⊣ T\_V ⊣ T\_{V^∨} on homotopy categories; the existence of these adjoints is the content of the nodes and of their suppliers. Cited by: `HS1/hecke-operator-via-relative-homology`, `HS1/properties-and-weil-equivariance`.
- `mathlib:CategoryTheory.ExactPairing` (class, `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean`). An exact pairing of two objects X, Y of a monoidal category: coevaluation 1 → X ⊗ Y and evaluation Y ⊗ X → 1 with the two triangle identities. A monoidal functor carries an exact pairing to an exact pairing (apply it to the two identities). The pinned Mathlib has no lemma for this direction: Mathlib/CategoryTheory/Monoidal/Rigid/OfEquivalence.lean only transports an exact pairing back along a faithful monoidal functor (ExactPairing.ofFaithful, ExactPairing.ofFullyFaithful). Applied to V and V^∨ in both orders it gives the two adjunctions of FS IX.2.2 and the creation and annihilation maps. The class LeftRigidCategory of the same file gives left duals only; the nodes need exact pairings of V and its dual in both orders. Cited by: `HS1/properties-and-weil-equivariance`, `HS4/creation-annihilation-and-triangles`.
- `mathlib:CategoryTheory.Functor.Monoidal` (class, `Mathlib/CategoryTheory/Monoidal/Functor.lean`). A functor between monoidal categories with lax and oplax structures (ε, μ, η, δ) that are mutually inverse. It is the form of monoidality of V ↦ S′\_V and V ↦ T\_V on homotopy categories; the higher coherences of the enhanced categories are the suppliers'. Cited by: `HS4/creation-annihilation-and-triangles`, `HS1/monoidality-of-hecke-operators`.
- `mathlib:CategoryTheory.MonoidalCategory` (class, `Mathlib/CategoryTheory/Monoidal/Category.lean`). A category with tensor product, unit, associator and unitors satisfying the pentagon and triangle identities. Carrier for Rep\_Λ((Ĝ⋊Q)^I), for the convolution of kernels and for endofunctor categories at the level of homotopy categories. Cited by: `HS1/monoidality-of-hecke-operators`.
- `mathlib:Condensed` (abbrev, `Mathlib/Condensed/Basic.lean`). Condensed objects of a category: sheaves on CompHaus for the coherent topology. Carrier for condensed sets and groups such as W\_E^I; condensed ∞-categories and condensed anima are not in the library. Cited by: `HS1/condensed-enrichment`.
- `mathlib:CondensedMod` (abbrev, `Mathlib/Condensed/Module.lean`). Condensed modules over a ring: sheaves of modules on CompHaus for the coherent topology. Carrier for the homotopy groups of the condensed mapping complexes of FS IX.1.2; solid modules and relative discreteness are not in the library. Cited by: `HS1/condensed-enrichment`.
- `mathlib:WittVector.Isocrystal` (class, `Mathlib/RingTheory/WittVector/Isocrystal.lean`). An isocrystal over a perfect field k of characteristic p: a vector space over K(p,k) = Frac W(k) with a Frobenius-semilinear automorphism (finite dimension is not part of the class). It gives the meaning of the isocrystal (V ⊗ L, b ⊗ σ) attached to b ∈ G(L) and a representation V; isocrystals with G-structure and the set B(G) are planned by BunGAndNewtonStrata. Cited by: `HS2/local-shtuka-moduli`.
- `tauceti:TauCeti.AffineGroupSchemeCat` (abbrev, `TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean`). The category of affine group schemes over Spec S: group objects in schemes over Spec S whose underlying scheme is affine. Carrier for the integral model 𝒢 over Z\_p of Scholze–Weinstein, Definition 23.1.1; smoothness, connected fibres and a reductive generic fibre are additional conditions not in the library. Cited by: `HS2/local-shtuka-moduli`.

## Sources

Locators in the node entries refer to the following versions.

- **Fargues–Scholze.** Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence. Author-hosted 356-page file, the text of arXiv:2102.13459v4 (27 November 2024); PDF page = printed page. The published version, Astérisque 466 (2026), was not read. [https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`; read 2026-10-07.
  Read: I.2 p.16 and I.7 pp.30–32 (Theorem I.7.2, Corollary I.7.3); II.2 pp.58–62 (O(n), Propositions II.2.2–II.2.3); III.2–III.5 pp.87–106 (|Bun\_G|, III.2.4, Beauville–Laszlo uniformization III.3, III.4.3–III.4.5, III.5); IV.1.19–IV.1.22; IV.7 pp.164–166, statements and proofs; V.7.1 with proof pp.183–184; VI.1–VI.2 pp.190–201; VI.6.6; VI.7.13; VI.8–VI.12 pp.224–241 as far as the nodes cite them; VII.2–VII.7 pp.250–276, statements and proofs (VII.2.6–VII.2.10, VII.3.1, VII.4.3, VII.5.2, VII.6, VII.7.1–VII.7.10); VIII.4 pp.290–292; IX introduction and IX.1–IX.7 pp.317–338, statements and proofs.
- **Scholze–Weinstein.** Peter Scholze, Jared Weinstein, Berkeley Lectures on p-adic Geometry. Print-ready file dated 27 March 2020 (printed page = PDF page − 10). The published volume, Annals of Mathematics Studies 207 (2020), was not collated. [https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf). SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`; read 2026-10-07.
  Read: 10.4.2 p.81; 11.1 pp.90–91; footnote p.99; Lecture 19 pp.169–181 (19.1–19.5 and its appendix); Lecture 20 pp.182–192; Lecture 22 pp.209–214 (22.3–22.6), statements and proofs; Lecture 23 pp.216–224 in full, statements and proofs; Lecture 24 pp.225–231 in full, statements and proofs.
- **Howe–Klevdal.** Sean Howe, Christian Klevdal, Admissible pairs and p-adic Hodge structures II: The bi-analytic Ax-Lindemann theorem. arXiv:2308.11064v2, 28 February 2025. Locators refer to this version, not the published Inventiones pagination. [https://arxiv.org/pdf/2308.11064v2](https://arxiv.org/pdf/2308.11064v2). SHA-256 `c133b06bec1209a04f84d1c2984b78ce2242ba85fc1b72cf5a662002685cab8a`; read 2026-10-07.
  Read: §7.2–§7.3 pp.41–44 (7.3.1–7.3.4), statements and proofs; only the reductive case is used.
- **Gleason–Lourenço.** Ian Gleason, João Lourenço, On the connectedness of p-adic period domains. arXiv:2210.08625v2, 28 December 2022; corrected Lemma 3.3. [https://arxiv.org/pdf/2210.08625v2](https://arxiv.org/pdf/2210.08625v2). SHA-256 `24342df8b2c221481c50147299cb63a4b5b60c45d808e4c50e8c89daf4f66946`; read 2026-10-07.
  Read: The whole paper (13 pages): Theorem 1.1, §2, Theorems 3.1–3.2, Lemma 3.3 and proofs.
- **Gleason–Lim–Xu.** Ian Gleason, Dong Gyu Lim, Yujie Xu, The connected components of affine Deligne–Lusztig varieties. Inventiones mathematicae 243 (2026), 805–861; DOI 10.1007/s00222-025-01386-1, CC BY 4.0. Published PDF byte-pinned below. [https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf). SHA-256 `c40fe1fc5e0941812cf3aca5ba77c471ee49122c63ed7b0d864d322136031485`; read 2026-10-07.
  Read: §1.4 p.812; §3.1–§3.6 pp.819–829 (Lemma 3.2, §3.4, Lemma 3.10, Theorem 3.11, Proposition 3.12, §3.6); §6.1–§6.2 pp.845–851 (Theorem 6.1, Proposition 6.4, Proposition 6.6 with Steps 1–3).
- **Dat–Helm–Kurinczuk–Moss.** Jean-François Dat, David Helm, Robert Kurinczuk, Gilbert Moss, Finiteness for Hecke algebras of p-adic groups. arXiv:2203.04929v2, 22 April 2022 (16 pages). Locators refer to this version; the published article (Journal of the American Mathematical Society 37 (2024)) was not read. [https://arxiv.org/pdf/2203.04929v2](https://arxiv.org/pdf/2203.04929v2). SHA-256 `921286bd623e9c1d9d954ea7e9a461ebb837b6c4446ab4c69a3fcb619cdf803b`; read 2026-10-08.
  Read: §1 pp.1–3: Theorems 1.1 and 1.2, Corollaries 1.3–1.6 and the outline of the proof; §3 pp.9–11: Lemma 3.1 with proof, Corollary 3.5 and Remark 3.6 with proof; the proofs of the main theorems (§2, §3.1) and §4 were not read.
- **Hamann–Hansen–Scholze.** Linus Hamann, David Hansen, Peter Scholze, Geometric Eisenstein series I: finiteness theorems. arXiv:2409.07363v1, 11 September 2024 (64 pages). Locators refer to this version. [https://arxiv.org/pdf/2409.07363v1](https://arxiv.org/pdf/2409.07363v1). SHA-256 `490a28590d6870119cfa0e57966e59a4e80d52ee744d3c0cf1c88181a2132e51`; read 2026-10-08.
  Read: §1 p.2 with footnote 1 (coefficients for which the six-functor formalism is available); §1.3 p.6 (Theorem 1.3.1); notation p.8 (coefficients and sheaf theory); §7.1 pp.60–61: Remark 7.1.2, Theorems 7.1.3 and 7.1.4 with their proofs; the finiteness theorems for Eisenstein series and constant terms on which these proofs rest (Theorem 1.2.1, §§3–6) were not read.
- **Hamann–Imai.** Linus Hamann, Naoki Imai, Dualizing complexes on the moduli of parabolic bundles. arXiv:2401.06342v4, 7 May 2025 (47 pages). Locators refer to this version. [https://arxiv.org/pdf/2401.06342v4](https://arxiv.org/pdf/2401.06342v4). SHA-256 `216227b4f53c46d7365d990ee2ba4039532b0f159c9b202f3667a1cc286449b3`; read 2026-10-08.
  Read: §1 pp.1–5 (statements: Proposition 1.1, Corollaries 1.7–1.9); notation p.7 (torsion coefficients); Definition 3.14 and Proposition 3.15 p.20, Proposition 3.18 p.22 (statements); §4.1 pp.23–26: Proposition 4.1 with proof, Proposition 4.4 and Lemma 4.7 (statements); used as an independent check, the proofs of §§2–3 were not read.

## HS0. Global and local Hecke stacks

This layer is geometry only; no sheaves occur in it. It defines the stack Hck^I\_G of modifications of G-bundles on the relative Fargues–Fontaine curve at a finite set of legs, with all its structure maps, and fixes the notion of relative position that every other layer of this roadmap uses: the position of the first bundle relative to the second, with Schubert cells the orbits of μ(ξ). The sources define the stack for one leg only; the definition for a finite set of legs and the repetition maps are written out here.

The theorems of the layer are: Hck^I\_G is a small v-stack; the fibres of the target map are Beilinson–Drinfeld Grassmannians, étale locally on the target; and on bounded substacks the target map, and the source map taken together with the legs, are proper, representable in spatial diamonds and of finite dim.trg, while on the whole stack they are not quasicompact. Chains of modifications give the convolution diagram: composition is an equivalence where legs of different parts are disjoint and is the convolution map of Grassmannians where they collide. The twisted Beilinson–Drinfeld Grassmannian of Scholze–Weinstein is the target of period maps for several legs; its dependence on b is made exact. The last node gives functoriality in the group: extension of structure group, twisting by a central torus, the equivalence with the Hecke stack of a basic inner form, and the formula κ(E\_1) = κ(E\_2) + μ♯.

The layer is checked on tori (where every bounded part maps isomorphically to its base), on GL\_2 with bounds (1,0) and (2,0), and on a non-split torus, where a single cocharacter defines a substack only over its field of definition.

**Planets.** Global Hecke stack (`HS0/global-hecke-correspondence`); Convolution Hecke stack (`HS0/chains-and-composition`); Twisted Beilinson–Drinfeld Grassmannian (`HS0/twisted-period-grassmannian`); Closed Schubert cells of the Hecke stack (`HS0/bounded-hecke-substacks`).

**Dependencies.** No earlier layer of this roadmap. Layers of other roadmaps cited by the nodes: `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG2:uniformization`, `DiamondSixOperations:S4`, `DiamondsAndVStacks:D3`, `DiamondsAndVStacks:D4`, `DiamondsAndVStacks:D5`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness`, `GeometricSatakeAndFusion:GS0:loop-geometry`, `RelativeFarguesFontaine:RF0:annuli`, `RelativeFarguesFontaine:RF2:integral-divisors`, `RelativeFarguesFontaine:RF2:untilts`, `RelativeFarguesFontaine:RF4:G-torsors`, `VectorBundlesAndIsocrystals:VB3:general-BC`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples`.

**Coverage.** Status `planned`. Target-level plan with 6 nodes; every target of the stage text is a node. The stage is not closed: it has open requests and a recorded gap. Remaining:

- Gap: Supplier normalization of the Beauville–Laszlo map.
- Statements requested from supplier stages that have no node for them yet: BunGAndNewtonStrata:BG2:uniformization, GeometricSatakeAndFusion:GS0:loop-geometry.
- Lemma-level refinement of the target-level nodes of this stage.

### The global Hecke stack Hck^I\_G with its source, target, leg and repetition maps

`HS0/global-hecke-correspondence` · Construction · planet: **Global Hecke stack**

**Construction.** Let I be a finite set and S ∈ Perf\_k. An object of Hck^I\_G(S) is a tuple ((D\_i)\_{i∈I}, E\_1, E\_2, α): a point (D\_i) of (Div¹)^I(S), that is, degree-one closed Cartier divisors D\_i ⊂ X\_S; G-bundles E\_1, E\_2 on X\_S; and an isomorphism of G-bundles α: E\_1|\_{X\_S∖D} ≅ E\_2|\_{X\_S∖D}, D = ⋃\_{i∈I} D\_i, that is meromorphic along D: for every V ∈ Rep\_E(G) the induced isomorphism of vector bundles E\_1(V)|\_{X\_S∖D} ≅ E\_2(V)|\_{X\_S∖D} extends to a map E\_1(V) → E\_2(V)(k·Σ\_i D\_i) for some k ≥ 0, locally on S. A morphism to ((D\_i), E\_1′, E\_2′, α′), with the same legs, is a pair of isomorphisms f\_1: E\_1 ≅ E\_1′, f\_2: E\_2 ≅ E\_2′ with α′∘f\_1 = f\_2∘α on X\_S∖D. Pullback of bundles and divisors along T → S makes Hck^I\_G a prestack over (Div¹)^I, the global Hecke stack; for I = {∗} it is the stack Hck\_G of FS I.2. Its maps are the following. (1) Source: p\_1 = h\_1: Hck^I\_G → Bun\_G, ((D\_i),E\_1,E\_2,α) ↦ E\_1. (2) Target: p\_2 = h\_2: Hck^I\_G → Bun\_G × (Div¹)^I, ((D\_i),E\_1,E\_2,α) ↦ (E\_2,(D\_i)); its second component is the leg map. (3) Unit: e: Bun\_G × (Div¹)^I → Hck^I\_G, (E,(D\_i)) ↦ ((D\_i),E,E,id), with p\_2∘e = id and p\_1∘e the first projection. (4) Swap: sw: Hck^I\_G → Hck^I\_G over (Div¹)^I, (E\_1,E\_2,α) ↦ (E\_2,E\_1,α⁻¹), an involution. (5) Repetition: for a map a: I → J of finite sets let Δ\_a: (Div¹)^J → (Div¹)^I, (D\_j)\_{j∈J} ↦ (D\_{a(i)})\_{i∈I}. The map ι\_a: Hck^I\_G ×\_{(Div¹)^I,Δ\_a} (Div¹)^J → Hck^J\_G over (Div¹)^J sends ((D\_j),E\_1,E\_2,α) to ((D\_j),E\_1,E\_2,α|\_{X\_S∖⋃\_{j∈J}D\_j}). It commutes with p\_1, p\_2 and e, satisfies ι\_id = id and ι\_{b∘a} = ι\_b∘(ι\_a ×\_{(Div¹)^J} (Div¹)^K) for b: J → K, is fully faithful for every a, and is an equivalence when a is surjective. (6) Localisation: loc: Hck^I\_G → Hck^{I,loc}\_G to the local Hecke stack Hck^{I,loc}\_G = Hck\_{G,Div^d\_X} ×\_{Div^d\_X} (Div¹)^I (d = |I|) of Fargues–Scholze VI.1 and VI.9, sending ((D\_i),E\_1,E\_2,α) to the completions Ê\_1, Ê\_2 of E\_1, E\_2 along Σ\_i D\_i with the isomorphism induced by α over B\_D(S); it is defined on the basis of those S for which D is affinoid. For I = ∅, p\_1: Hck^∅\_G → Bun\_G is an equivalence with inverse e.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p; G is a reductive group over E; k is an algebraic closure of F\_q; S ∈ Perf\_k, and X\_S is the relative Fargues–Fontaine curve over S.
- G-bundles on X\_S are exact tensor functors Rep\_E(G) → Bun(X\_S); Bun\_G is the v-stack of G-bundles and Div¹ = Spd Ĕ/φ^ℤ the v-sheaf of degree-one closed Cartier divisors on X\_S.
- No bound on the poles of α is imposed; bounded substacks are cut out afterwards by the relative position of E\_1 with respect to E\_2 at the legs.
- Fargues–Scholze define the global stack only for one leg (I.2, p. 16; over C in the proof of Proposition IX.2.1, p. 322) and use Hck^I\_G for a finite set I in Chapter IX without a displayed definition; the definition above is the one-leg definition with D replaced by ⋃ D\_i, chosen so that loc lands in the local stack Hck^I\_G of VI.9.

**Construction.**

1. Objects and pullback. For (D\_i) ∈ (Div¹)^I(S) the sum Σ\_i D\_i is the closed Cartier divisor of the image point of Div^d(S) (RelativeFarguesFontaine:RF2:integral-divisors and RF2:untilts). The groupoid of triples (E\_1,E\_2,α) is the groupoid of G-modifications at Σ\_i D\_i of RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification, with E\_2 varying in Bun\_G(S) (BunGAndNewtonStrata:BG2:uniformization). A meromorphic α pulls back along T → S to a meromorphic isomorphism, because the extension E\_1(V) → E\_2(V)(kD) pulls back; this gives the prestack and the maps p\_1, p\_2.
2. Swap, unit and repetition. By the definition in RF4 the inverse of a meromorphic isomorphism is meromorphic (apply the condition to the dual representation), so sw is defined and sw∘sw = id. For a: I → J the open X\_S∖⋃\_{j∈J}D\_j is contained in X\_S∖⋃\_{i∈I}D\_{a(i)}, and Σ\_i D\_{a(i)} ≤ |I|·Σ\_j D\_j, so the restriction of α is meromorphic along Σ\_j D\_j; this defines ι\_a, and the identities for id and b∘a hold because restriction is transitive. ι\_a is fully faithful because a map of vector bundles on X\_S∖⋃\_i D\_{a(i)} is determined by its restriction to the complement of the Cartier divisor Σ\_j D\_j; it is an equivalence for surjective a because then the two unions of legs coincide.
3. Localisation. For D affinoid, RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing(i) attaches to (E\_1,α) over a fixed E\_2 the G-torsor Ê\_1 on Spec B⁺\_D(S) with the isomorphism α̂: Ê\_1 ≅ Ê\_2 over Spec B\_D(S); together with Ê\_2 this is an object of the local Hecke stack of GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke (FS Definition VI.1.6). The construction commutes with pullback in S, so it defines loc on the basis of S with D affinoid.
4. No legs. For I = ∅ the divisor is empty, α is an isomorphism E\_1 ≅ E\_2 over X\_S, and (E\_1,E\_2,α) ↦ E\_1 is an equivalence with inverse e.

**API.**

- `HckI` (data): For S ∈ Perf\_k the groupoid of ((D\_i)\_{i∈I}, E\_1, E\_2, α) with α: E\_1|\_{X\_S∖⋃D\_i} ≅ E\_2|\_{X\_S∖⋃D\_i} meromorphic along Σ D\_i; morphisms are the pairs (f\_1,f\_2) intertwining α; it is functorial in S by pullback.
- `HckI.p1` (projection): p\_1: Hck^I\_G → Bun\_G, ((D\_i),E\_1,E\_2,α) ↦ E\_1.
- `HckI.p2` (projection): p\_2: Hck^I\_G → Bun\_G × (Div¹)^I, ((D\_i),E\_1,E\_2,α) ↦ (E\_2,(D\_i)).
- `HckI.legs` (projection): The leg map Hck^I\_G → (Div¹)^I is the second component of p\_2; e, sw and loc are maps over (Div¹)^I and ι\_a is a map over (Div¹)^J.
- `HckI.unit` (constructor): e: Bun\_G × (Div¹)^I → Hck^I\_G, (E,(D\_i)) ↦ ((D\_i),E,E,id); p\_2∘e = id and p\_1∘e = pr\_1.
- `HckI.swap` (structure): sw(E\_1,E\_2,α) = (E\_2,E\_1,α⁻¹) is an involution of Hck^I\_G over (Div¹)^I with p\_1∘sw = pr\_1∘p\_2 and sw∘e = e.
- `HckI.ext` (extensionality): Two objects over the same legs are isomorphic iff there are f\_1: E\_1 ≅ E\_1′ and f\_2: E\_2 ≅ E\_2′ with α′f\_1 = f\_2α off the legs; a morphism (f\_1,f\_2) is determined by f\_2, so the automorphism group of an object is the group of f\_2 ∈ Aut(E\_2) for which α⁻¹f\_2α extends to an automorphism of E\_1.
- `HckI.repeat` (functoriality): For a: I → J, ι\_a: Hck^I\_G ×\_{(Div¹)^I,Δ\_a} (Div¹)^J → Hck^J\_G restricts α to the complement of all legs indexed by J; ι\_id = id, ι\_{b∘a} = ι\_b∘(base change of ι\_a), ι\_a is fully faithful, and it is an equivalence for surjective a.
- `HckI.repeat_image` (characterisation): The essential image of ι\_a consists of the objects of Hck^J\_G whose α extends to an isomorphism over X\_S∖⋃\_{j∈a(I)}D\_j; for a: ∅ → J it is the image of e.
- `HckI.toLocal` (compatibility): loc: Hck^I\_G → Hck^{I,loc}\_G sends (E\_1,E\_2,α) to (Ê\_1,Ê\_2,α̂), the completions along Σ D\_i with the induced isomorphism over B\_D(S); it commutes with pullback in S, with sw and with e (which goes to the unit section of the local Hecke stack).
- `HckI.empty` (example): Hck^∅\_G ≃ Bun\_G through p\_1, with inverse e.
- `HckI.torus_point` (example): For G = 𝔾\_m and one leg D over a geometric point Spa(C,C⁺), the isomorphism classes of objects over D are the pairs (deg L\_1, deg L\_2) ∈ ℤ², and every automorphism group is E^×, embedded diagonally in Aut(L\_1) × Aut(L\_2).

**Unit tests.**

- `HckI.empty_test` (degenerate): For I = ∅ the functor p\_1: Hck^∅\_G(S) → Bun\_G(S) is an equivalence of groupoids for every S ∈ Perf\_k; for G = 𝔾\_m and S a geometric point its isomorphism classes are ℤ (the degree) and its automorphism groups are E^×.
- `HckI.torus_test` (computation): Let G = 𝔾\_m, S = Spa(C,C⁺) a geometric point and D ⊂ X\_S a degree-one divisor. The isomorphism classes of objects (D,L\_1,L\_2,α) of Hck^{∗}\_{𝔾\_m}(S) are in bijection with ℤ² through (deg L\_1, deg L\_2), all pairs occur, and the automorphism group of each object is E^× embedded diagonally in E^× × E^× = Aut(L\_1) × Aut(L\_2).
- `HckI.repeat_test` (computation): For the map a: {1,2} → {∗}, ι\_a: Hck^{1,2}\_G ×\_{(Div¹)²,Δ} Div¹ → Hck^{∗}\_G is an equivalence. For the map a: ∅ → {∗}, ι\_a is the unit e: Bun\_G × Div¹ → Hck^{∗}\_G, which for G = 𝔾\_m is not essentially surjective: over a geometric point its image consists of the classes with deg L\_1 = deg L\_2.
- `HckI.trivial_group_test` (degenerate): For G = 1, Hck^I\_1 = (Div¹)^I, p\_1 is the structure map to Bun\_1 = ∗ and p\_2 is the identity of (Div¹)^I.
- `HckI.fibre_test` (characterisation): Let S = Spa(C,C⁺) be a geometric point, D one leg with untilt C♯, and E\_2 = 𝒪ⁿ the trivial GL\_n-bundle. The pairs (E\_1,α) with (D,E\_1,𝒪ⁿ,α) ∈ Hck^{∗}\_{GL\_n}(S), up to isomorphisms of E\_1 compatible with α, are in bijection with the B⁺\_dR(C♯)-lattices in B\_dR(C♯)ⁿ through (E\_1,α) ↦ α(Ê\_1); all lattices occur, not only those contained in B⁺\_dR(C♯)ⁿ.

**Uses.**

- HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology: T\_V(A) = p\_{2♮}(p\_1^\*A ⊗ S′\_V) is formed along p\_1 and p\_2, with the kernel S′\_V pulled back along loc (FS IX.2, pp. 321–322).
- HeckeStacksAndLocalShtukas:HS2/framed-bundle-fibres: The fibre of (p\_1, p\_2) over two fixed bundles is the space of modifications between them (FS IX.3, proof of Theorem IX.3.1, p. 324).
- HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality: Δ\_a and ι\_a give the functoriality of the Hecke action in the finite set I (FS VI.9, pp. 226–227, where it is built on the Beilinson–Drinfeld Grassmannians).
- HeckeStacksAndLocalShtukas:HS0/structure-group-and-inner-form: A homomorphism of groups induces a map of the diagrams (p\_1, p\_2), as in the proof of FS Theorem IX.6.1, pp. 330–331.

**Acceptance.**

- For I = ∅, p\_1: Hck^∅\_G → Bun\_G is an equivalence.
- For G = 𝔾\_m, a line bundle L on X\_S and one leg D, the triple (L, L(D), can), with can the tautological isomorphism off D, is an object of Hck^{∗}\_{𝔾\_m}(S), since can extends to L → L(D); its swap (L(D), L, can⁻¹) is an object because can⁻¹ extends to L(D) → L(D) = L(1·D).
- An object whose α extends to an isomorphism E\_1 ≅ E\_2 over X\_S is isomorphic to e(E\_2,(D\_i)), and conversely.
- For a: {1,2} → {∗}, ι\_a identifies the restriction of Hck^{1,2}\_G to the diagonal of (Div¹)² with Hck^{∗}\_G.

**Prerequisites.**

- In other roadmaps: `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification`, `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`, `RelativeFarguesFontaine:RF2:integral-divisors/addition-and-disjoint-divisor-loci`, `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`, `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`, `BunGAndNewtonStrata:BG2:uniformization/bun-g-as-v-stack`, `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`.

**Sources.**

- Fargues–Scholze, I.2, p. 16: Definition of the global Hecke stack for one leg: two G-bundles, a degree-one divisor and a meromorphic isomorphism off it.
- Fargues–Scholze, I.2, p. 16: The two projections: h\_1 to Bun\_G and h\_2 to Bun\_G × Div¹.
- Fargues–Scholze, III.3, p. 97: Meromorphy is tested on every representation, by extension to a twist by kD.
- Fargues–Scholze, IX, introduction, p. 317: The multi-leg global Hecke stack is the target of pullback from the local stack; it is used here without a displayed definition.
- Fargues–Scholze, IX, introduction, p. 317: For a finite set I the target map p\_2 lands in Bun\_G × (Div¹)^I and p\_1 in Bun\_G.
- Fargues–Scholze, IX.2, proof of Proposition IX.2.1, p. 322: The one-leg stack over C, as it is used in the proof of Proposition IX.2.1.
- Fargues–Scholze, VI.9, p. 226: The repetition map for a map of finite sets, on Grassmannians; ι\_a is its analogue on global Hecke stacks.
- Fargues–Scholze, I.13, p. 44: Base field: k is an algebraic closure of F\_q, and E has residue field F\_q.

### v-descent, Grassmannian fibres of the target map, and properness of the bounded Hecke maps

`HS0/descent-and-bounded-fibres` · Theorem

**Theorem.** (a) Descent. Hck^I\_G is a small v-stack on Perf\_k, and p\_1, p\_2, e, sw, ι\_a and loc are maps of v-stacks. (b) Fibres of the target map. Let c: Bun\_G × (Div¹)^I → [(Div¹)^I/L⁺G] send (E\_2,(D\_i)) to the completion Ê\_2 of E\_2 along Σ D\_i, and let q\_2: Hck^{I,loc}\_G → [(Div¹)^I/L⁺G] remember the second torsor. The square formed by loc, p\_2, c and q\_2 is 2-cartesian. Equivalently: for S → Bun\_G × (Div¹)^I given by (E\_2,(D\_i)) with D affinoid and a trivialisation t of Ê\_2 over B⁺\_D(S), the map (E\_1,α) ↦ (Ê\_1, t∘α̂) is an isomorphism Hck^I\_G ×\_{Bun\_G×(Div¹)^I} S ≅ Gr^I\_G ×\_{(Div¹)^I} S, natural in S, and replacing t by g∘t with g ∈ L⁺G(S) composes it with the left action of g on the Beilinson–Drinfeld Grassmannian Gr^I\_G. Such t exist étale locally on S. (c) Bounded maps. For every bound W = (W\_i)\_{i∈I} of HS0/bounded-hecke-substacks the restriction p\_{2,W}: Hck^I\_{G,W} → Bun\_G × (Div¹)^I of p\_2 is representable in spatial diamonds, proper and of finite dim.trg. The same holds for (p\_1, legs): Hck^I\_{G,W} → Bun\_G × (Div¹)^I, which is p\_{2,W\*}∘sw with W\*\_i = {−w\_0μ : μ ∈ W\_i}; and p\_{1,W}: Hck^I\_{G,W} → Bun\_G is representable in spatial diamonds, proper and of finite dim.trg. In particular these maps are compactifiable of finite dim.trg. (d) Cells. If G is split, I = {∗} and μ ∈ X\_\*(T)⁺, then on the open substack Hck\_{G,μ} = Hck\_{G,≤μ} ∖ ⋃\_{μ′<μ} Hck\_{G,≤μ′} the map p\_2: Hck\_{G,μ} → Bun\_G × Div¹ is cohomologically smooth of ℓ-dimension ⟨2ρ,μ⟩; if μ is minuscule, Hck\_{G,≤μ} = Hck\_{G,μ} and p\_{2,≤μ} is proper and cohomologically smooth of ℓ-dimension ⟨2ρ,μ⟩. (e) The whole stack. By (b), p\_2: Hck^I\_G → Bun\_G × (Div¹)^I is étale locally on the target the projection from a product with Gr^I\_G, an increasing union of the closed subsheaves of (c). For G ≠ 1 and I ≠ ∅ it is not quasicompact, so the statements of (c) do not extend from the bounded substacks to Hck^I\_G; the same holds for (p\_1, legs) = p\_2∘sw.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p; G is a reductive group over E; k is an algebraic closure of F\_q; S ∈ Perf\_k, and X\_S is the relative Fargues–Fontaine curve over S.
- In (b) the divisor D = Σ D\_i is affinoid, which holds locally on S (FS Proposition VI.1.2).
- In (d) G is split and ℓ ≠ p; parts (a)–(c) involve no coefficients.
- Relative positions and bounds are those of HS0/bounded-hecke-substacks (position of E\_1 relative to E\_2).

**Proof outline.**

1. (a) Bun\_G is a small v-stack (BunGAndNewtonStrata:BG2:uniformization) and (Div¹)^I a small v-sheaf, so it remains to descend α along a v-cover T → S. Over a fixed E\_2 the pair (E\_1,α) is equivalent, by RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing(i) on the basis where D is affinoid, to a G-torsor Q on Spec B⁺\_D(S) with an isomorphism to Ê\_2 over Spec B\_D(S); G-torsors over B⁺\_D and isomorphisms over B\_D satisfy v-descent by RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality(b) (FS Proposition VI.1.7; for bundles on open subsets of S ×̇ Spa O\_E, Scholze–Weinstein Proposition 19.5.3). Smallness follows as for Bun\_G. The maps of HS0/global-hecke-correspondence are given by formulas compatible with pullback.
2. (b) The same equivalence identifies the fibre of p\_2 over (E\_2,(D\_i)) with the set of pairs (Q, a: Q|\_{B\_D} ≅ Ê\_2|\_{B\_D}), which is the fibre of q\_2 over Ê\_2; it commutes with base change in S (RF4:G-torsors/base-change-and-divisor-compatibility(a)), which gives the 2-cartesian square. With a trivialisation t of Ê\_2 the pairs (Q, t∘a) are the S-points of Gr^I\_G over the given legs (GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke; FS Definition VI.1.8), and changing t by g ∈ L⁺G(S), the automorphisms of the trivial torsor, multiplies t∘a by g. Trivialisations exist étale locally on S by RF4:G-torsors/v-descent-and-local-triviality(c), after a finite étale extension of E splitting G.
3. (c) For G split, Gr\_{G,Div^d,≤μ•} → Div^d is proper, representable in spatial diamonds and of finite dim.trg by FS Proposition VI.2.7, stated over the integral base and checked after pullback to (Div¹)^d; it restricts to the generic part and transports to (Div¹\_X)^I because every map S → Div^d\_X lifts locally to Div^d\_Y with isomorphic local Hecke stacks (FS Remark VI.8.4). A finite Γ-stable bound W becomes, after base change along the finite étale cover (Div¹\_{E′})^I → (Div¹\_E)^I for a finite Galois extension E′ splitting G, and locally after translation by Gal(E′|E)^I as in HS0/bounded-hecke-substacks, a finite union of such closed subsheaves; the three properties are local on the base and descend along the cover (DiamondsAndVStacks:D5/relative-representability). By (b), p\_{2,W} is étale locally on the target the base change of Gr^I\_{G,W} → (Div¹)^I, the bounded locus being stable under L⁺G; the properties descend along the étale cover. The statement for (p\_1, legs) follows from sw(Hck^I\_{G,W}) = Hck^I\_{G,W\*}, and the one for p\_{1,W} by composing with the base change of (Div¹)^I → ∗, which is proper, representable in spatial diamonds and, being cohomologically smooth and quasicompact, of finite dim.trg (FS Proposition II.1.21).
4. (d) By FS Proposition VI.2.4, Gr\_{G,Div¹,μ} = L⁺G/(L⁺G)\_μ → Div¹ is cohomologically smooth of ℓ-dimension ⟨2ρ,μ⟩; by (b) the same holds for p\_2 on Hck\_{G,μ}, cohomological smoothness being local on the target. For minuscule μ there is no dominant μ′ < μ, so Hck\_{G,≤μ} = Hck\_{G,μ}, and (c) applies.
5. (e) For G ≠ 1 the set X\_\*(T)⁺ is infinite and every Schubert cell has a geometric point. Over a geometric point with pairwise distinct legs the fibre of p\_2 is a product of copies of Gr\_G, the union of the increasing family of closed subsheaves of (c) and equal to none of them; a quasicompact v-sheaf mapping to Gr\_G meets only finitely many Schubert cells (proof of FS Lemma III.3.4), so the fibre is not quasicompact. The statement for (p\_1, legs) follows by sw.

**Acceptance.**

- G = 𝔾\_m, one leg, bound n ∈ ℤ: p\_{2,n}: Hck\_{𝔾\_m,n} → Pic × Div¹ is an isomorphism with inverse (L\_2,D) ↦ (L\_2 ⊗ I\_Dⁿ, L\_2, can), I\_D the ideal sheaf of D; here ⟨2ρ,n⟩ = 0.
- G = 1: Hck^I\_1 = (Div¹)^I and p\_2 is the identity.
- G = GL\_n, one leg, μ = (1,0,…,0): for S → Bun\_G × Div¹ given by (E\_2,D) with untilt S♯, the fibre of p\_{2,≤μ} is the diamond over S of rank-one quotients of the vector bundle E\_2|\_{S♯}, a twisted form of ℙ^{n−1} of dimension n − 1 = ⟨2ρ,μ⟩; a change of trivialisation of Ê\_2 acts on it through GL\_n(𝒪\_{S♯}).
- For one leg and G split, p\_{1,≤μ} and p\_{2,≤μ} are proper, as asserted without proof in FS I.2 (p. 16).

**Prerequisites.**

- In this roadmap: `HS0/global-hecke-correspondence`, `HS0/bounded-hecke-substacks`.
- In other roadmaps: `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`, `DiamondsAndVStacks:D5/relative-representability`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`, `BunGAndNewtonStrata:BG2:uniformization/bun-g-as-v-stack`, `RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison`, `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondSixOperations:S4/smooth-v-local-on-target`, `BunGAndNewtonStrata:BG2:uniformization/bun-g-smallness`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`, `GeometricSatakeAndFusion:GS0:loop-geometry`.

**Sources.**

- Fargues–Scholze, VI.1, proof of Proposition VI.1.7, p. 193: v-descent of G-bundles over the completed rings, the input for descent of the pair (E\_1, α).
- Scholze–Weinstein, Appendix to Lecture 19, Proposition 19.5.3, p. 180: v-descent of G-torsors on open subsets of S ×̇ Spa ℤ\_p.
- Fargues–Scholze, III.3, pp. 97–98: Beauville–Laszlo gluing: modifications of a fixed bundle at D are torsors over B⁺\_dR with an isomorphism over B\_dR; stated in the source for the trivial bundle.
- Fargues–Scholze, VI.1, proof of Proposition VI.1.7, p. 193: Étale-local trivialisations give the quotient presentations, hence the local product structure of p\_2.
- Fargues–Scholze, VI.2, Proposition VI.2.7, p. 201: Properness, spatial representability and finite dim.trg of the bounded Beilinson–Drinfeld Grassmannian.
- Fargues–Scholze, VI.8, Remark VI.8.4, p. 226: Passage from the divisors on Y to those on X.
- Fargues–Scholze, II.1, Proposition II.1.21, p. 56: Div¹ → ∗ is proper and representable in spatial diamonds, used for p\_{1,W}.
- Fargues–Scholze, I.2, p. 16: The source's assertion that both bounded projections are proper.
- Fargues–Scholze, VI.2, Proposition VI.2.4, p. 198: Cohomological smoothness and ℓ-dimension of the open cell.

### Chains of modifications, their composition, and the convolution diagram

`HS0/chains-and-composition` · Construction · planet: **Convolution Hecke stack**

**Construction.** Let I = I\_1 ⊔ … ⊔ I\_m be an ordered partition of a finite set into possibly empty parts. An object of Hck^{I;I\_1,…,I\_m}\_G(S) consists of legs (D\_i)\_{i∈I} ∈ (Div¹)^I(S), G-bundles E\_0, …, E\_m on X\_S and, for j = 1, …, m, an isomorphism α\_j: E\_{j−1}|\_{X\_S∖D\_{I\_j}} ≅ E\_j|\_{X\_S∖D\_{I\_j}} meromorphic along D\_{I\_j} = Σ\_{i∈I\_j} D\_i; morphisms are tuples of isomorphisms of the E\_j commuting with the α\_j. Equivalently Hck^{I;I\_1,…,I\_m}\_G = Hck^{I\_1}\_G ×\_{Bun\_G} Hck^{I\_2}\_G ×\_{Bun\_G} ⋯ ×\_{Bun\_G} Hck^{I\_m}\_G, each fibre product being formed with the Bun\_G-component of p\_2 on the left and p\_1 on the right. It carries the projections q\_j to Hck^{I\_j}\_G, the maps to Bun\_G remembering E\_j, and the composition c: Hck^{I;I\_1,…,I\_m}\_G → Hck^I\_G over (Div¹)^I, ((D\_i),(E\_j),(α\_j)) ↦ ((D\_i), E\_0, E\_m, α\_m∘⋯∘α\_1|\_{X\_S∖D\_I}). (1) c is well defined: the composite is meromorphic along D\_I. (2) Associativity and units: merging two consecutive parts I\_j, I\_{j+1} by composing α\_{j+1}∘α\_j defines c\_j: Hck^{I;…,I\_j,I\_{j+1},…}\_G → Hck^{I;…,I\_j⊔I\_{j+1},…}\_G; any two sequences of such merges ending at the one-part partition have composite c; and for I\_j = ∅ forgetting (E\_j, α\_j) after composing identifies the chain stack with the one for the partition without I\_j. (3) Disjoint legs: over the open subsheaf (Div¹)^{I;I\_1,…,I\_m} ⊂ (Div¹)^I where D\_i ∩ D\_{i′} = ∅ whenever i and i′ lie in different parts, c is an equivalence, and there the local Hecke stack is the product of the local Hecke stacks of the parts. (4) Collisions: for I = {1,2} with parts {1}, {2}, the restriction of c to the diagonal Div¹ → (Div¹)² is, under the equivalence ι of HS0/global-hecke-correspondence, the map Hck^{∗}\_G ×\_{Bun\_G×Div¹} Hck^{∗}\_G → Hck^{∗}\_G composing two modifications at the same leg. Its base change to a point (E\_2,D) with Ê\_2 trivialised is the convolution map LG ×^{L⁺G} Gr\_G → Gr\_G of FS VI.8, whose fibres are those of Gr\_G → Div¹; in particular c is not an equivalence there. (5) Bounds: for G split and μ• ∈ (X\_\*(T)⁺)^I let Hck^{I;I\_1,…,I\_m}\_{G,≤μ•} be the closed substack where each q\_j lands in Hck^{I\_j}\_{G,≤(μ\_i)\_{i∈I\_j}}. Then c maps it into Hck^I\_{G,≤μ•}, and the restriction c\_{≤μ•} is representable in spatial diamonds, proper, and surjective as a map of v-stacks.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p; G is a reductive group over E; k is an algebraic closure of F\_q; S ∈ Perf\_k, and X\_S is the relative Fargues–Fontaine curve over S.
- The chain is ordered so that E\_m is the reference bundle: α\_j is a modification from E\_{j−1} to E\_j, and positions are those of E\_{j−1} relative to E\_j (HS0/bounded-hecke-substacks).
- In (5) G is split; for general G the bounds are the Γ-stable sets W of HS0/bounded-hecke-substacks, with sums of sets in place of sums of cocharacters.

**Construction.**

1. Fibre product and composition. An object of the iterated fibre product is a tuple of objects of the Hck^{I\_j}\_G together with identifications of the target bundle of the j-th with the source bundle of the (j+1)-st; this is the groupoid of chains. On X\_S∖D\_I all α\_j are defined, and for V ∈ Rep\_E(G) the composite of maps E\_{j−1}(V) → E\_j(V)(k\_jD\_{I\_j}) is a map E\_0(V) → E\_m(V)(Σ\_j k\_jD\_{I\_j}) ⊂ E\_m(V)(kD\_I), k = max k\_j; this is the additivity of pole orders of RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility(c). Hence c is defined, and (2) holds because composition of isomorphisms is associative and Hck^∅\_G ≃ Bun\_G (HS0/global-hecke-correspondence).
2. Disjoint legs. Let ((D\_i),E\_0,E\_m,α) ∈ Hck^I\_G(S) with the D\_{I\_j} pairwise disjoint. By RF4:G-torsors/base-change-and-divisor-compatibility(b), B⁺\_{D\_I}(S) is the product of the B⁺\_{D\_{I\_j}}(S) and a modification at D\_I is the same as a tuple of modifications at the D\_{I\_j}, glued successively; let E\_j be obtained from E\_m by performing the modifications at D\_{I\_{j+1}}, …, D\_{I\_m} only. This is inverse to c. On completed data it is the product decomposition of the local Hecke stack over the disjoint locus of FS VI.9, where the composition map of the local convolution Hecke stack is an isomorphism.
3. Collisions. Over the diagonal both modifications are at the same divisor D, and by HS0/descent-and-bounded-fibres(b), applied twice, the chains over a fixed (E\_2,D) with Ê\_2 trivialised are the pairs (Ê\_1 ∈ Gr\_G, Ê\_0 a lattice in the torsor Ê\_1), that is LG ×^{L⁺G} Gr\_G of GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke with c the multiplication map (FS VI.8; Scholze–Weinstein Definition 20.4.2 with P\_r = E\_{m−r}). The fibre of the multiplication map over a point of Gr\_G is isomorphic to Gr\_G, so c is not a monomorphism.
4. Bounds. At a geometric point and a leg x write α\_j in frames as g\_j ∈ G(B⁺\_dR)λ\_j(ξ)G(B⁺\_dR); the composite is g\_m⋯g\_1, whose double coset is that of some ν ≤ Σ\_j λ\_j (Scholze–Weinstein Proposition 20.1.4), so c maps bounded chains into Hck^I\_{G,≤μ•}. The map from bounded chains to Bun\_G × (Div¹)^I remembering E\_m is a composite of base changes of the maps p\_{2,≤} of HS0/descent-and-bounded-fibres(c), hence proper and representable in spatial diamonds; as Hck^I\_{G,≤μ•} is separated over the same base, c\_{≤μ•} is proper and representable in spatial diamonds. It is surjective on geometric points by the surjectivity of convolution Schubert varieties onto the Schubert variety of the sum (Scholze–Weinstein Propositions 20.1.4 and 20.4.5(2)), and being quasicompact it is a surjection of v-stacks.

**API.**

- `ModificationChain` (data): For an ordered partition I = I\_1 ⊔ … ⊔ I\_m: legs (D\_i)\_{i∈I}, G-bundles E\_0, …, E\_m on X\_S and modifications α\_j: E\_{j−1} ⇢ E\_j, isomorphisms off D\_{I\_j} meromorphic along D\_{I\_j}; morphisms are compatible tuples of isomorphisms.
- `ModificationChain.proj` (projection): q\_j: Hck^{I;I\_1,…,I\_m}\_G → Hck^{I\_j}\_G, the chain ↦ ((D\_i)\_{i∈I\_j}, E\_{j−1}, E\_j, α\_j), and the maps to Bun\_G remembering E\_j, 0 ≤ j ≤ m.
- `ModificationChain.fibreProduct` (characterisation): (q\_1,…,q\_m) is an equivalence from Hck^{I;I\_1,…,I\_m}\_G to Hck^{I\_1}\_G ×\_{Bun\_G} ⋯ ×\_{Bun\_G} Hck^{I\_m}\_G, the fibre products being over E\_j on both sides.
- `ModificationChain.compose` (constructor): c: Hck^{I;I\_1,…,I\_m}\_G → Hck^I\_G, the chain ↦ ((D\_i)\_{i∈I}, E\_0, E\_m, α\_m∘⋯∘α\_1 restricted to X\_S∖D\_I); it commutes with the maps to Bun\_G remembering E\_0 and E\_m and with the leg maps.
- `ModificationChain.assoc` (relation): The merge maps c\_j composing α\_{j+1}∘α\_j commute with one another, and every composite of merges from the partition (I\_1,…,I\_m) to (I) equals c.
- `ModificationChain.unit` (relation): For I\_j = ∅ the chain stack is equivalent to the one without the j-th part, compatibly with c; inserting E\_j = E\_{j−1} with α\_j = id is inverse to this equivalence.
- `ModificationChain.compose_disjoint` (equivalence): Over (Div¹)^{I;I\_1,…,I\_m}, where legs in different parts are disjoint, c is an equivalence; its inverse sends (E\_0,E\_m,α) to the chain whose E\_j is E\_m modified at D\_{I\_{j+1}}, …, D\_{I\_m} only.
- `ModificationChain.convolution` (compatibility): For parts {1}, {2} over the diagonal, the fibre of the chain stack over (E\_2,D) with Ê\_2 trivialised is LG ×^{L⁺G} Gr\_G and c is the multiplication map to Gr\_G; for m singleton parts it is the convolution Beilinson–Drinfeld Grassmannian of Scholze–Weinstein Definition 20.4.2 with P\_r = E\_{m−r} and S♯\_r the leg of the part I\_{m+1−r}.
- `ModificationChain.bound_add` (relation): If at a common leg E\_{j−1} has position ≤ λ\_j relative to E\_j for all j, then E\_0 has position ≤ Σ\_j λ\_j relative to E\_m; c\_{≤μ•}: Hck^{I;I\_1,…,I\_m}\_{G,≤μ•} → Hck^I\_{G,≤μ•} is proper, representable in spatial diamonds and surjective.
- `ModificationChain.swap` (relation): Reversing a chain, (E\_0,…,E\_m;α\_j) ↦ (E\_m,…,E\_0;α\_{m+1−j}⁻¹), is an equivalence onto the chain stack of the reversed partition, and c of the reversed chain is sw of c of the chain.

**Unit tests.**

- `ModificationChain.torus_collision_test` (computation): G = 𝔾\_m, I = {1,2} with parts {1}, {2}, S a geometric point with D\_1 = D\_2 = D. Isomorphism classes of chains (L\_0,L\_1,L\_2;α\_1,α\_2) are the triples (deg L\_2, b, a) ∈ ℤ³ with L\_1 ≅ L\_2 ⊗ I\_D^b and L\_0 ≅ L\_1 ⊗ I\_D^a, and c sends (deg L\_2, b, a) to the class (deg L\_0, deg L\_2) = (deg L\_2 − a − b, deg L\_2) of Hck^{∗}\_{𝔾\_m}; so c is surjective on isomorphism classes with infinite fibres {(a,b) : a + b = n}.
- `ModificationChain.torus_disjoint_test` (characterisation): Same G and partition, S a geometric point with D\_1 ≠ D\_2: chains are classified by (deg L\_2, b, a) ∈ ℤ³ with L\_1 = L\_2 ⊗ I\_{D\_2}^b and L\_0 = L\_1 ⊗ I\_{D\_1}^a; objects of Hck^{1,2}\_{𝔾\_m} over (D\_1,D\_2) are classified by (deg L\_2, a, b) through L\_0 = L\_2 ⊗ I\_{D\_1}^a ⊗ I\_{D\_2}^b; and c is the identity in these coordinates, hence bijective on isomorphism classes.
- `ModificationChain.GL2_test` (computation): G = GL\_2, one common leg at a geometric point with untilt C♯, E\_2 fixed with Ê\_2 trivialised, bounds μ\_1 = μ\_2 = (1,0). Bounded chains are the flags of lattices Λ\_0 ⊂ Λ\_1 ⊂ Ê\_2 with both successive quotients of length one, a ℙ¹-bundle over ℙ¹(C♯). The map c, (Λ\_0 ⊂ Λ\_1) ↦ Λ\_0, is onto the set of lattices with Ê\_2/Λ\_0 of length two; its fibre is one point if Ê\_2/Λ\_0 ≅ B⁺\_dR/ξ² and is ℙ¹(C♯) if Λ\_0 = ξÊ\_2.
- `ModificationChain.empty_part_test` (degenerate): For the partition I = I ⊔ ∅ the chain stack is Hck^I\_G ×\_{Bun\_G} Hck^∅\_G ≃ Hck^I\_G and c is this equivalence; for the partition with one part, c is the identity.

**Uses.**

- HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality: Composites of Hecke operators and fusion are computed by pull–push along q\_1, q\_2 and c; c is an equivalence over the disjoint locus, and the convolution of kernels on Hck^I\_G uses the chain stack for I ⊔ I restricted along the fold map (FS IX.2, p. 321).
- HeckeStacksAndLocalShtukas:HS0/twisted-period-grassmannian: Over a Frobenius-twisted diagonal the twisted Grassmannian is the fibre of a two-step chain over E\_b, with its intermediate bundle, not the fibre of Hck^{1,2}\_G.
- FS VI.9, proof of Definition/Proposition VI.9.4, p. 229: The local convolution Hecke stack with its maps p\_j and m defines the fusion product; the global chain stack maps to it by completion along the legs.

**Acceptance.**

- m = 1: c is the identity of Hck^I\_G. m = 2 with I\_2 = ∅: c is the equivalence Hck^I\_G ×\_{Bun\_G} Hck^∅\_G ≃ Hck^I\_G.
- G = 𝔾\_m, one common leg D, positions a of L\_0 relative to L\_1 and b of L\_1 relative to L\_2: the composite has position a + b, since L\_0 = L\_2 ⊗ I\_D^{a+b}.
- G = 𝔾\_m, two disjoint legs at a geometric point: c is bijective on isomorphism classes, both sides being classified by (deg L\_2, a, b) ∈ ℤ³.
- G = GL\_2, one leg, bounds (1,0) and (1,0): c has a single point over each lattice of position (2,0) and the fibre ℙ¹ over the lattice of position (1,1).

**Prerequisites.**

- In this roadmap: `HS0/global-hecke-correspondence`, `HS0/descent-and-bounded-fibres`, `HS0/bounded-hecke-substacks`.
- In other roadmaps: `RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`, `GeometricSatakeAndFusion:GS0:loop-geometry`.

**Sources.**

- Fargues–Scholze, VI.9, proof of Definition/Proposition VI.9.4, p. 229: The local convolution Hecke stack for an ordered partition: a chain of bundles with isomorphisms after inverting the ideals of the j-th part.
- Fargues–Scholze, VI.9, proof of Definition/Proposition VI.9.4, p. 229: Over the locus where legs of different parts are disjoint, composition is an isomorphism.
- Fargues–Scholze, VI.8, p. 224: The convolution diagram at a common divisor; the composition map has the fibres of the Grassmannian.
- Scholze–Weinstein, Lecture 20, Definition 20.4.2, p. 187: The convolution Beilinson–Drinfeld Grassmannian: successive modifications at the legs (the index range is misprinted as n).
- Scholze–Weinstein, Lecture 20, Proposition 20.1.4, p. 183: Bounds add under composition, and the bounded composition map is surjective.
- Scholze–Weinstein, Lecture 20, Proposition 20.4.5(2), p. 188: Surjectivity of the bounded composition map over several legs.
- Fargues–Scholze, IX.2, p. 321: Sheaves on the global Hecke stack act on D\_■(Bun\_G × (Div¹)^I) through a monoidal functor, for the convolution of Section VII.5. The source does not write the convolution diagram; it is the chain stack of this node for I ⊔ I, restricted along the fold map.

### The twisted Beilinson–Drinfeld Grassmannian of a local shtuka datum (Scholze–Weinstein 23.4–23.5)

`HS0/twisted-period-grassmannian` · Construction · planet: **Twisted Beilinson–Drinfeld Grassmannian**

**Construction.** Data: G a reductive group over ℚ\_p; k an algebraic closure of F\_p, L = W(k)[1/p] = Ĕ with Frobenius σ (the base field is E = ℚ\_p); b ∈ G(L); conjugacy classes μ\_1, …, μ\_m of cocharacters of G over an algebraic closure of ℚ\_p, with fields of definition F\_i and F̆\_i = F\_i·L. For S ∈ Perf\_k with untilts S♯\_1, …, S♯\_m over F̆\_1, …, F̆\_m, let Gr^{tw,b}\_{G,≤μ•}(S) be the set of isomorphism classes of triples (P\_η, φ, ι): P\_η a G-torsor on S ×̇ Spa ℚ\_p = Y\_{(0,∞)}(S); φ: (Frob\_S^\*P\_η)|\_U ≅ P\_η|\_U, U = S ×̇ Spa ℚ\_p ∖ ⋃\_i S♯\_i, meromorphic along the closed Cartier divisor ⋃\_i S♯\_i; and ι: P\_η|\_{Y\_{[r,∞)}(S)} ≅ G × Y\_{[r,∞)}(S) for some large r (two such being identified when they agree for a larger r) under which φ becomes b × Frob\_S; subject to the bound that at every geometric rank-one point and every i the relative position of P\_η with respect to Frob\_S^\*P\_η at S♯\_i is at most Σ\_{j: S♯\_j = S♯\_i} μ\_j. This is the functor of Scholze–Weinstein Definition 23.5.1; it is a v-sheaf over Spd F̆\_1 ×\_k ⋯ ×\_k Spd F̆\_m. (1) ι extends uniquely to a trivialisation of P\_η over S ×̇ Spa ℚ\_p ∖ ⋃\_{i,n≥0} φ⁻ⁿ(S♯\_i), meromorphic along the divisors φ⁻ⁿ(S♯\_i); thus P\_η is a modification of the trivial torsor along these divisors, determined by its modifications at the S♯\_i and continued by φ = b × Frob\_S. (2) One leg: (P\_η,φ,ι) ↦ (the completion of P\_η along S♯\_1, with the trivialisation ι) is an isomorphism Gr^{tw,b}\_{G,≤μ} ≅ Gr\_{G,Spd F̆\_1,≤μ}, for every b. (3) Two legs: over the open locus where S♯\_2 ≠ φⁿ(S♯\_1) for all n ≠ 0, completion along S♯\_1 + S♯\_2 identifies Gr^{tw,b} with the Beilinson–Drinfeld Schubert variety Gr\_{G,≤(μ\_1,μ\_2)}. Over the open locus where S♯\_2 ≠ φ⁻ⁿ(S♯\_1) for all n ≠ m, for a fixed m > 0, it is identified with the pullback under (φ × 1)⁻ᵐ of the convolution Schubert variety, by first modifying the trivial torsor at S♯\_1, continuing by φ, and then modifying at S♯\_2; symmetrically for m < 0 with the two legs exchanged. For b = 1 these identifications are compatible with the gluing of Scholze–Weinstein Definition 23.4.1, so Gr^{tw,1} is the space defined there; for general b the two identifications differ on their common locus by left translation of the lattice at the first leg by b\_m = b·σ(b)⋯σ^{m−1}(b) ∈ G(L). (4) For y ∈ G(L), (P\_η,φ,ι) ↦ (P\_η,φ,(y × id)∘ι) is an isomorphism Gr^{tw,b} ≅ Gr^{tw,b′} with b′ = y·b·σ(y)⁻¹. (5) Gr^{tw,b}\_{G,≤μ•} → Spd F̆\_1 ×\_k ⋯ ×\_k Spd F̆\_m is proper and representable in spatial diamonds (Scholze–Weinstein Proposition 23.5.2). (6) Two legs on X\_S: if S♯\_2 = φ⁻ᵐ(S♯\_1) on all of S for some m > 0, with common image x̄ in X\_S, the S-points over these legs are the chains E ⇢ E′ ⇢ E\_b on X\_S in the sense of HS0/chains-and-composition, with E′ a modification of E\_b at x̄ of position ≤ μ\_1 and E a modification of E′ at x̄ of position ≤ μ\_2; the intermediate bundle E′ is part of the datum. This statement is not in the source beyond the remark on intermediate modifications in §23.4.

**Hypotheses and conventions.**

- G is a reductive group over ℚ\_p; k is an algebraic closure of F\_p and L = W(k)[1/p], which is Ĕ for E = ℚ\_p, as in the conventions (Scholze–Weinstein allow any discrete algebraically closed field k of characteristic p, and nothing below uses more); b ∈ G(L); μ\_1, …, μ\_m are conjugacy classes of cocharacters 𝔾\_m → G over an algebraic closure of ℚ\_p, with fields of definition F\_i finite over ℚ\_p and F̆\_i = F\_i·L; S ∈ Perf\_k.
- This is the construction of Scholze–Weinstein, Lecture 23, for the field ℚ\_p. Fargues–Scholze IX.3 (pp. 325–326) use the analogous space for a general local field E, with π in place of p and the q-Frobenius; that case is not part of this node.
- Relative positions are taken in the dominance order and in the normalisation of HS0/bounded-hecke-substacks: the position of P\_η relative to Frob\_S^\*P\_η.
- The element b enters through ι. Statement (2) removes it for one leg and (4) for σ-conjugate elements; for m ≥ 2 no identification of Gr^{tw,b} for different σ-conjugacy classes of b is asserted.

**Construction.**

1. v-sheaf and extension of ι. G-torsors on open subsets of S ×̇ Spa ℤ\_p form a v-stack (Scholze–Weinstein Proposition 19.5.3), φ and ι are sections of v-sheaves, and ι rigidifies the triple, so the functor is a v-sheaf of sets. On Y\_{[r/p,∞)}(S) minus the legs put ι := (b × Frob\_S)∘Frob\_S^\*(ι)∘φ⁻¹; iterating gives (1), with meromorphy along φ⁻ⁿ(S♯\_i) inherited from that of φ (proof of Scholze–Weinstein Proposition 23.4.2).
2. One leg. The divisors φ⁻ⁿ(S♯), n ≥ 0, are pairwise disjoint; the lattice of P\_η at S♯ relative to ι is arbitrary within the bound, and the lattice at φ⁻ⁿ(S♯) is its transport by (b × Frob\_S)ⁿ; Beauville–Laszlo gluing on S ×̇ Spa ℚ\_p (RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing) reconstructs P\_η. This gives (2).
3. Two legs. On the first locus a leg can meet no translate φ⁻ⁿ(S♯\_j), n ≥ 1, of the other, so the lattice of P\_η along S♯\_1 + S♯\_2 is a point of the Beilinson–Drinfeld Grassmannian (Scholze–Weinstein Definitions 20.4.1 and 20.4.4) and determines P\_η as in the previous step. On the m-th locus let P\_1 be the torsor obtained from the trivial one by the modification of P\_η at S♯\_1, continued by φ; then S♯\_1 ≠ φ⁻ⁿ(S♯\_2) for all n ≥ 0, P\_1 is trivialised away from the φ⁻ⁿ(S♯\_1), and P\_η is a modification of P\_1 at S♯\_2 and its translates. The pair (P\_1 near φ⁻ᵐ(S♯\_1), P\_η near S♯\_2) is a point of the convolution Grassmannian of Scholze–Weinstein Definition 20.4.2 over (φ⁻ᵐ(S♯\_1), S♯\_2) (HS0/chains-and-composition(4)). The lattice of P\_1 at φ⁻ᵐ(S♯\_1) is b\_m·(Frob\_S^m)^\* of the lattice at S♯\_1, because (b × Frob\_S)^m = b\_m × Frob\_S^m; the gluing of Definition 23.4.1 uses (Frob\_S^m)^\* alone, which gives the comparison in (3).
4. (4) is a direct check: (y × id)∘ι conjugates b × Frob\_S into y·b·σ(y)⁻¹ × Frob\_S (compare Scholze–Weinstein Remark 23.1.3). (5): over a quasicompact open U of the base choose ε > 0 with all S♯\_i ⊂ Y\_{[ε,∞)}(S) and n\_0 with φ⁻ⁿ(S♯\_i) ⊂ Y\_{(0,ε/p]}(S) for n ≥ n\_0. Then P\_η is determined by its modifications at the φ⁻ⁿ(S♯\_i), 0 ≤ n < n\_0, which embeds Gr^{tw,b}\_{≤μ•}|\_U into the Beilinson–Drinfeld Grassmannian over U × φ⁻¹(U) × ⋯ × φ^{−n\_0+1}(U), with image in a Schubert variety and closed in it; these Schubert varieties are proper and representable in spatial diamonds (Scholze–Weinstein Proposition 20.4.5).
5. (6): for r large, P\_η|\_{Y\_{[r,∞)}(S)} with φ descends to E\_b through ι; for ε small, P\_η|\_{Y\_{(0,ε]}(S)} with φ descends to a bundle E on X\_S; and between S♯\_1 and S♯\_2 the torsor P\_η is the pullback of the bundle E′ obtained from E\_b by the modification at S♯\_1. The maps φ identify E′ with E\_b off x̄ and E with E′ off x̄, with the stated bounds, and conversely a chain determines the lattices of the two-leg step.

**API.**

- `TwistedPeriodData` (data): For S ∈ Perf\_k with untilts S♯\_i over F̆\_i: triples (P\_η, φ, ι) of a G-torsor on S ×̇ Spa ℚ\_p, a meromorphic isomorphism φ: Frob\_S^\*P\_η ⇢ P\_η off ⋃ S♯\_i, and a trivialisation ι near infinity carrying φ to b × Frob\_S, with the position of P\_η relative to Frob\_S^\*P\_η at S♯\_i bounded by Σ\_{j: S♯\_j = S♯\_i} μ\_j.
- `TwistedPeriodData.frobenius` (projection): The isomorphism φ: (Frob\_S^\*P\_η)|\_U ≅ P\_η|\_U on the complement U of the legs, meromorphic along the legs.
- `TwistedPeriodData.framing` (projection): The trivialisation ι, which extends uniquely to S ×̇ Spa ℚ\_p ∖ ⋃\_{i,n≥0} φ⁻ⁿ(S♯\_i), meromorphically along these divisors, with φ = b × Frob\_S in the extended trivialisation.
- `TwistedPeriodData.ext` (extensionality): Two triples over the same legs are equal iff there is an isomorphism of the torsors commuting with φ and compatible with ι on some Y\_{[r,∞)}(S); it is then unique, and a triple is determined by the lattices of P\_η relative to the extended ι along the divisors S♯\_i.
- `TwistedPeriodData.one_leg` (equivalence): For m = 1 and every b, completion along S♯\_1 is an isomorphism Gr^{tw,b}\_{G,≤μ} ≅ Gr\_{G,Spd F̆\_1,≤μ}.
- `TwistedPeriodData.toBD` (compatibility): Over the open locus where S♯\_i ≠ φⁿ(S♯\_j) for all i ≠ j and n ≠ 0, completion along Σ\_i S♯\_i is an isomorphism of Gr^{tw,b}\_{G,≤μ•} onto the Beilinson–Drinfeld Schubert variety Gr\_{G,≤μ•} of Scholze–Weinstein Definition 20.4.4, for every b.
- `TwistedPeriodData.collision` (compatibility): For two legs, over the open locus where S♯\_2 ≠ φ⁻ⁿ(S♯\_1) for all n ≠ m (m > 0), Gr^{tw,b} is isomorphic to the pullback under (φ × 1)⁻ᵐ of the convolution Schubert variety; on the common locus this chart and the Beilinson–Drinfeld chart differ by the Frobenius identification composed with left translation by b\_m = b·σ(b)⋯σ^{m−1}(b) at the first leg.
- `TwistedPeriodData.sigma_conj` (functoriality): For y ∈ G(L), (P\_η,φ,ι) ↦ (P\_η,φ,(y × id)∘ι) is an isomorphism Gr^{tw,b} ≅ Gr^{tw,y b σ(y)⁻¹}; for y, y′ it composes to the isomorphism for y′y.
- `TwistedPeriodData.truncation` (other): Over a quasicompact open U of the base there is n\_0 such that recording the modifications of the trivial torsor at φ⁻ⁿ(S♯\_i), 0 ≤ n < n\_0, is a closed embedding of Gr^{tw,b}\_{≤μ•}|\_U into a Schubert variety of the Beilinson–Drinfeld Grassmannian over U × φ⁻¹(U) × ⋯ × φ^{−n\_0+1}(U).
- `TwistedPeriodData.proper` (structure): Gr^{tw,b}\_{G,≤μ•} → Spd F̆\_1 ×\_k ⋯ ×\_k Spd F̆\_m is proper and representable in spatial diamonds.
- `TwistedPeriodData.chain` (characterisation): For two legs with S♯\_2 = φ⁻ᵐ(S♯\_1), m > 0, the points are the bounded chains E ⇢ E′ ⇢ E\_b on X\_S at the common image of the legs, with E′ relative to E\_b bounded by μ\_1 and E relative to E′ bounded by μ\_2.

**Unit tests.**

- `TwistedPeriodData.one_leg_test` (degenerate): For m = 1 and any b, Gr^{tw,b}\_{G,≤μ} → Gr\_{G,Spd F̆\_1,≤μ} is an isomorphism. For G = 𝔾\_m and μ = n it is Spd F̆\_1: the unique point over S is the line bundle P\_η = 𝒪(−n·Σ\_{j≥0} φ⁻ʲ(S♯\_1)) on S ×̇ Spa ℚ\_p, with ι the inclusion into the meromorphic functions and φ multiplication by b.
- `TwistedPeriodData.no_leg_test` (degenerate): For m = 0 and every b ∈ G(L), Gr^{tw,b}(S) is a single point for all S ∈ Perf\_k, namely (G × Y\_{(0,∞)}(S), b × Frob\_S, id).
- `TwistedPeriodData.torus_collision_test` (computation): G = 𝔾\_m, m = 2, μ• = (a,c) ∈ ℤ², b = 1: the map to Spd L ×\_k Spd L is an isomorphism, and the unique point over S is P\_η = 𝒪(−a·Σ\_{n≥0} φ⁻ⁿ(S♯\_1) − c·Σ\_{n≥0} φ⁻ⁿ(S♯\_2)) with ι the inclusion. At a geometric point with S♯\_2 = φ⁻¹(S♯\_1) the order of P\_η along S♯\_2 relative to ι is a + c, while its position relative to Frob\_S^\*P\_η there is c.
- `TwistedPeriodData.GL2_collision_test` (non-example): G = GL\_2, μ\_1 = μ\_2 = (1,0), b = 1. Over a geometric point of the diagonal S♯\_1 = S♯\_2 the fibre is the set of lattices Λ ⊂ (B⁺\_dR)² with quotient of length two, the Schubert variety of (2,0). Over a geometric point with S♯\_2 = φ⁻¹(S♯\_1) the fibre is the set of flags Λ\_0 ⊂ Λ\_1 ⊂ (B⁺\_dR)² at S♯\_2 with successive quotients of length one, a ℙ¹-bundle over ℙ¹, and the map (Λ\_0 ⊂ Λ\_1) ↦ Λ\_0 to the first kind of fibre is not injective: its fibre over ξ·(B⁺\_dR)² is ℙ¹. So over such a point the fibre of the twisted Grassmannian does not map isomorphically to the fibre of the Beilinson–Drinfeld Grassmannian of the images of the legs in X\_S, and over the diagonal the fibre of the convolution Grassmannian does not map isomorphically to the fibre of the twisted Grassmannian: neither space describes the twisted Grassmannian over the whole base.

**Uses.**

- HeckeStacksAndLocalShtukas:HS2/multi-leg-period-and-representability: The period map of Scholze–Weinstein Corollary 23.5.3 from the moduli of shtukas to Gr^{tw,b} is étale with open image the admissible locus, and local spatiality of the moduli of shtukas follows from (5).
- HeckeStacksAndLocalShtukas:HS3/satake-coefficients-and-partial-frobenius: The Satake sheaf is defined on the Beilinson–Drinfeld locus of (3) and extended over the Frobenius-twisted diagonals (FS IX.3, p. 326).
- FS IX.3, proof of Proposition IX.3.2, pp. 326–327: The comparison between modifications of E\_b on X\_S and shtukas is an isomorphism away from Frobenius-twisted partial diagonals; (6) describes the remaining locus for two legs.

**Acceptance.**

- One leg recovers Gr\_{G,Spd Ĕ,≤μ}, for every b.
- No legs: the functor is a point for every b, since ι extends to all of S ×̇ Spa ℚ\_p by iterating φ⁻¹; by contrast the moduli of shtukas with no legs is empty unless b is σ-conjugate to 1 (Scholze–Weinstein Proposition 23.2.1).
- Two legs: off all Frobenius translates of the diagonal the fibre is Gr\_{≤μ\_1} × Gr\_{≤μ\_2}; on the diagonal it is Gr\_{≤μ\_1+μ\_2}; on (φ × 1)^m(Δ), m ≠ 0, it is the convolution Schubert variety.
- For G a torus the map to Spd F̆\_1 ×\_k ⋯ ×\_k Spd F̆\_m is an isomorphism.

**Prerequisites.**

- In this roadmap: `HS0/chains-and-composition`, `HS0/bounded-hecke-substacks`.
- In other roadmaps: `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`, `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`, `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`, `GeometricSatakeAndFusion:GS0:loop-geometry`.

**Sources.**

- Scholze–Weinstein, Lecture 23, Definition 23.5.1, p. 223: The functor: G-torsors on S ×̇ Spa ℚ\_p over a base of m untilts.
- Scholze–Weinstein, Lecture 23, Definition 23.5.1, p. 223: The framing near infinity identifies the Frobenius with b × Frob\_S.
- Scholze–Weinstein, Lecture 23, Definition 23.5.1, p. 223: The bound: position of Frob\_S^\*P and P at a leg, with the sum over coinciding legs.
- Scholze–Weinstein, Lecture 23, Definition 23.4.1, p. 221: Two legs: off the nonzero Frobenius translates of the diagonal it is the Beilinson–Drinfeld Grassmannian.
- Scholze–Weinstein, Lecture 23, Definition 23.4.1, p. 221: Two legs: near the m-th translate it is the pulled-back convolution Grassmannian.
- Scholze–Weinstein, Lecture 23, proof of Proposition 23.4.2, p. 222: The convolution chart: modify at the first leg, continue by Frobenius, then modify at the second.
- Scholze–Weinstein, Lecture 23, Remark 23.4.3, p. 222: The source's remark on independence of b, which statement (3) replaces by the precise comparison.
- Scholze–Weinstein, Lecture 23, Proposition 23.5.2, p. 223: Properness and spatial representability of the bounded twisted Grassmannian.
- Scholze–Weinstein, Lecture 23, proof of Proposition 23.5.2, p. 224: The proof embeds it into a Beilinson–Drinfeld Schubert variety over finitely many Frobenius translates of the base.
- Fargues–Scholze, IX.3, p. 326: Use in Fargues–Scholze: away from Frobenius-twisted partial diagonals it is the Beilinson–Drinfeld Grassmannian.

### Functoriality in G: structure group, central twisting, basic inner forms and the Kottwitz invariant

`HS0/structure-group-and-inner-form` · Comparison

**Comparison.** (a) Structure group. Let f: G → H be a homomorphism of reductive groups over E. Pushing out bundles and modifications along f defines f\_\*: Hck^I\_G → Hck^I\_H over (Div¹)^I, ((D\_i),E\_1,E\_2,α) ↦ ((D\_i),f\_\*E\_1,f\_\*E\_2,f\_\*α), with p\_1∘f\_\* = f\_\*∘p\_1 and p\_2∘f\_\* = (f\_\* × id)∘p\_2; it commutes with e, sw, ι\_a, loc and with the chain stacks and their composition maps, and (f′∘f)\_\* = f′\_\*∘f\_\*, id\_\* = id. At a geometric point, inv(f\_\*E\_1,f\_\*E\_2,f\_\*α) is the dominant representative f(μ) of the H-conjugacy class of f∘μ, where μ = inv(E\_1,E\_2,α); for split groups f\_\* maps Hck^I\_{G,≤μ•} into Hck^I\_{H,≤f(μ•)}. (b) Central twisting. Let Z ⊂ G be a central torus. The multiplication m: Z × G → G is a homomorphism and Hck^I\_{Z×G} = Hck^I\_Z ×\_{(Div¹)^I} Hck^I\_G, so (a) gives m\_\*: Hck^I\_Z ×\_{(Div¹)^I} Hck^I\_G → Hck^I\_G over the twisting action Bun\_Z × Bun\_G → Bun\_G, compatibly with p\_1 and p\_2; relative positions add, inv = λ + μ for λ ∈ X\_\*(Z) and μ ∈ X\_\*(T)⁺. This is the geometric form of the compatibility with central characters, which Fargues–Scholze obtain by applying Theorem IX.6.1 to Z × G → G. (c) Basic inner forms. Let b ∈ G(Ĕ) be basic and G\_b its σ-centraliser, so that G\_b × X\_S is the pure inner twist of G × X\_S by E\_b. The equivalence τ\_b: Bun\_G ≃ Bun\_{G\_b}, E ↦ Isom\_G(E,E\_b), which carries Bun^b\_G to Bun^1\_{G\_b}, extends to an equivalence τ\_b: Hck^I\_G ≃ Hck^I\_{G\_b} over (Div¹)^I, (E\_1,E\_2,α) ↦ (τ\_bE\_1,τ\_bE\_2,u ↦ u∘α⁻¹), commuting with p\_1, p\_2, e, sw, ι\_a, chains and composition. Under the Γ-equivariant identification of the conjugacy classes of cocharacters of G and of G\_b over Ē given by G\_b ×\_E Ĕ ≅ G ×\_E Ĕ, it preserves relative positions and therefore maps Hck^I\_{G,W} onto Hck^I\_{G\_b,W}. (d) Kottwitz invariant. Let (D,E\_1,E\_2,α) be a geometric point of Hck^{∗}\_G with E\_1 of position μ relative to E\_2 (HS0/bounded-hecke-substacks). Then κ(E\_1) = κ(E\_2) + μ♯ in π\_1(G)\_Γ, where μ♯ is the image of μ under X\_\*(T) → π\_1(G) → π\_1(G)\_Γ; equivalently the first Chern class c\_1 = −κ satisfies c\_1(E\_1) = c\_1(E\_2) − μ♯. For several legs the classes of the positions at the distinct legs add, and under sw the position becomes −w\_0μ, of class −μ♯. Consequently, for G split, p\_1 maps Hck^I\_{G,≤μ•} ∩ p\_2⁻¹(Bun\_G^{κ=c} × (Div¹)^I) into Bun\_G^{κ=c+Σ\_iμ\_i♯}. In particular the Beauville–Laszlo map sends the Schubert cell Gr\_{G,μ}, the L⁺G-orbit of μ(ξ) as in Scholze–Weinstein Definition 19.2.2, into the locus κ = +μ♯. FS Proposition III.3.6(ii) prints the opposite sign; that sign is the one for the orbit of μ(ξ)⁻¹, that is, for modifications of the trivial bundle of type μ in the sense of FS IX.7, where the modification from 𝒪 to 𝒪(1) has type 1.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p; G is a reductive group over E; k is an algebraic closure of F\_q; S ∈ Perf\_k, and X\_S is the relative Fargues–Fontaine curve over S.
- In (a), f is any homomorphism of reductive groups over E, with no condition on its kernel or image.
- In (b), Z is a central torus of G, for instance the connected centre. The statements about sheaves and L-parameters that Fargues–Scholze deduce from it are not part of this node.
- In (c), b is basic; for non-basic b the group G\_b is an inner form of a proper Levi subgroup of the quasi-split inner form of G (FS III.4.1, p. 101), the map G\_b ×\_E Ĕ → G ×\_E Ĕ is not an isomorphism, and τ\_b is not defined.
- In (d), κ is normalised as in FS III.2.2: for G = GL\_n, κ(b) is the endpoint of the Newton polygon of the isocrystal of b, 𝒪(n) is the bundle of the isocrystal (Ĕ, π⁻ⁿσ), and the first Chern class of E\_b is −κ(b). The relative position is that of E\_1 with respect to E\_2, with Schubert cells the orbits of μ(ξ).

**Proof outline.**

1. (a) By RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group(a), f\_\* carries G-modifications at D to H-modifications at D and commutes with gluing, hence with completion along D and with pullback in S; the compatibilities with p\_1, p\_2, e, sw, ι\_a and c follow from the formulas of HS0/global-hecke-correspondence and HS0/chains-and-composition, f\_\* being a functor on bundles that commutes with restriction to opens. At a geometric point, if α̂(e\_1) = e\_2·g with g ∈ G(B⁺\_dR)μ(ξ)G(B⁺\_dR), then f\_\*α̂(f\_\*e\_1) = f\_\*e\_2·f(g) and f(g) lies in the double coset of (f∘μ)(ξ), which is that of f(μ)(ξ). For the bounds: μ′ ≤ μ means that μ − μ′ lies in the coroot lattice and μ′ in the convex hull of the Weyl orbit of μ; f maps coroots of G into the coroot lattice of H, because a homomorphism from SL\_2 lifts to the simply connected cover of the derived group, and maps Weyl conjugates of μ to conjugates of f∘μ; so f(μ′) ≤ f(μ). At a collision, the dominant representative of f∘(μ\_1+μ\_2) is ≤ f(μ\_1) + f(μ\_2).

2. (b) Apply (a) to m and to the two projections of Z × G: a (Z × G)-bundle is a pair of bundles and a modification of it is a pair of modifications at the same legs. The cocharacter m∘(λ,μ) = λ + μ is dominant because λ is central. The source is the paragraph after FS Proposition IX.6.5.

3. (c) BunGAndNewtonStrata:BG0/pure-inner-twisting: G\_b × X\_S is the pure inner twist of G × X\_S by E\_b (FS Proposition III.4.2), and E ↦ Isom(E,E\_b) is an equivalence from G-torsors to G\_b-torsors on every open of X\_S (FS Proposition III.4.1(ii)); applied on X\_S and on X\_S∖D it gives τ\_b on objects and on isomorphisms off D. Applied to the completion along D, with the L⁺G-torsor Ê\_b, it gives an equivalence of the local Hecke stacks compatible with loc, so meromorphy is preserved (RF4:G-torsors/tannakian-transfer-of-gluing). After trivialising Ê\_b at a geometric point, G\_b ≅ G over B⁺\_dR and u ↦ u⁻¹(1) identifies Isom(P,G) with P as torsors, so relative positions are preserved; the trivialisation is unique up to G(B⁺\_dR), acting on G by inner automorphisms. Scholze–Weinstein, proof of Corollary 23.3.2, is this statement after exchanging the roles of the two bundles, which replaces μ by μ⁻¹.

4. (d) Both sides are compatible with f\_\* for the homomorphisms used to define κ in BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps, by (a). Step 1: for a z-extension G̃ → G with simply connected derived group the geometric point lifts to Hck\_{G̃}, because B(G̃) → B(G) and Gr\_{G̃}(C) → Gr\_G(C) are surjective (FS III.2.2 and Lemma III.3.5) and E\_1 is the modification of E\_2 by the lattice. Step 2: for G with simply connected derived group, G → G/G\_der induces an isomorphism on π\_1, which reduces to a torus. Step 3: a further z-extension reduces to an induced torus, and restriction of scalars to 𝔾\_m over a finite extension, where the legs above D are distinct and their contributions add. Step 4: for 𝔾\_m and position n, E\_1 = E\_2 ⊗ I\_Dⁿ with I\_D the ideal sheaf of D; I\_D ≅ 𝒪(−1) by FS Proposition II.2.3 and its proof, 𝒪(−1) is the bundle of the isocrystal (Ĕ, πσ), and κ is additive on line bundles, so κ(E\_1) = κ(E\_2) + n. This is the argument of FS Proposition III.3.6(ii) with E\_2 in place of the trivial bundle.

5. Comparison with the sources. In Scholze–Weinstein Definition 24.1.1 with Proposition 23.3.3 the trivial bundle has position ≤ μ relative to E\_b and κ(b) = −μ♮, which is (d) with E\_1 trivial and E\_2 = E\_b. In FS IX.7 (p. 337) the bundle E\_b with b = μ(π⁻¹) is the modification of the trivial bundle of type μ, obtained by pushing out the modification from 𝒪 to 𝒪(1); in the present normalisation (𝒪, 𝒪(1)) has position 1, so (trivial, E\_b) has position μ and κ(b) = −μ♯, again (d).

6. Supplier normalization gate. The present BG2 exports grassmannian-kottwitz-sign, modification-newton-bound and minuscule-modification-image carry the opposite sign for the GS0 point μ(ξ). They are not imported unchanged here. The request to BG2:uniformization must supply κ(BL(Gr\_μ)) = +μ♯, image B(G,μ) and its minuscule equality for a fixed trivial second bundle. A modification from the trivial first bundle to E\_b of type μ uses the inverse Grassmannian orientation, so its nonemptiness condition is \[b\] ∈ B(G,μ⁻¹). The line lattice ξB⁺\_dR glues to O(−1), of κ = +1 (FS II.2.3, pp.60–61; III.2, pp.90–91; VI.2.4, p.199). This supplier correction remains open in the recorded normalization gap.

**Acceptance.**

- G = 𝔾\_m, one leg: (E\_1,E\_2) = (L ⊗ I\_Dⁿ, L) has position n, deg E\_1 = deg E\_2 − n and κ(E\_1) = κ(E\_2) + n. In particular (𝒪, 𝒪(D)) has position 1 with κ(𝒪) − κ(𝒪(D)) = 0 − (−1) = 1, and its swap (𝒪(D), 𝒪) has position −1.
- det: GL\_n → 𝔾\_m maps position (μ\_1 ≥ … ≥ μ\_n) to Σ μ\_i. For the modification 𝒪ⁿ ⊂ 𝒪(1/n) with cokernel of length one at D, (E\_1,E\_2) = (𝒪ⁿ, 𝒪(1/n)) has position (1,0,…,0) and κ(𝒪ⁿ) − κ(𝒪(1/n)) = 0 − (−1) = 1.
- Central twisting by Z = 𝔾\_m ⊂ GL\_n: m\_\* of ((L(−D), L, can), e(E)) is (E ⊗ L(−D), E ⊗ L, can), of position (1,…,1), with κ(E\_1) − κ(E\_2) = n.
- Inner forms: τ\_b(E\_b) is the trivial G\_b-bundle, and τ\_b maps the part of Hck\_{G,≤μ} over (E\_1 trivial, E\_2 = E\_b) onto the part of Hck\_{G\_b,≤μ} over (E\_{b⁻¹}, trivial); after sw this is the duality (G,b,μ) ↔ (G\_b,b⁻¹,μ⁻¹) of Scholze–Weinstein Corollary 23.3.2.

**Prerequisites.**

- In this roadmap: `HS0/global-hecke-correspondence`, `HS0/bounded-hecke-substacks`, `HS0/chains-and-composition`.
- In other roadmaps: `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`, `BunGAndNewtonStrata:BG0/pure-inner-twisting`, `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`, `BunGAndNewtonStrata:BG2:uniformization/beauville-laszlo-surjectivity`, `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`, `BunGAndNewtonStrata:BG2:uniformization/points-are-B-of-G`, `BunGAndNewtonStrata:BG0/basic-inner-form-bundle-equivalence`, `BunGAndNewtonStrata:BG2:uniformization/central-torus-grassmannian-surjectivity`, `BunGAndNewtonStrata:BG2:uniformization/hn-sign-and-semicontinuity`, `BunGAndNewtonStrata:BG2:uniformization`.

**Sources.**

- Fargues–Scholze, III.4, Corollary III.4.3, p. 101: Basic twisting: Bun\_G ≃ Bun\_{G\_b}, carrying the stratum of b to the trivial stratum.
- Fargues–Scholze, III.4, Proposition III.4.2, p. 101: G\_b on the curve is the pure inner twist of G by E\_b.
- Fargues–Scholze, III.4, Proposition III.4.1(ii), p. 100: The equivalence of classifying stacks is S ↦ Isom(S,T); applied on opens of X\_S it transports modifications.
- Scholze–Weinstein, Lecture 23, proof of Corollary 23.3.2, p. 219: Transport of bounds under the inner-form equivalence; the inverse appears because the two bundles exchange roles.
- Fargues–Scholze, IX.6.4, p. 333: Central characters and twisting are obtained from the maps Z × G → G and G → G × D.
- Fargues–Scholze, IX.6, proof of Theorem IX.6.1, p. 331: For G′ → G inducing an isomorphism of adjoint groups (the hypothesis of the theorem), the map Hck^I\_{G′} → Hck^I\_G ×\_{Bun\_G} Bun\_{G′} is, locally over Bun\_{G′}, the map of Grassmannians Gr^I\_{G′} → Gr^I\_G. The same holds for every homomorphism, by HS0/descent-and-bounded-fibres (b).
- Fargues–Scholze, III.3, Proposition III.3.6(ii), p. 100: The source's statement on the Kottwitz invariant of a modification of the trivial bundle; its sign is that of the orbit of μ(ξ)⁻¹.
- Fargues–Scholze, III.2.2, p. 91: Normalisation: the first Chern class of E\_b is −κ(b).
- Fargues–Scholze, II.2, proof of Proposition II.2.3, p. 61: The ideal sheaf of a degree-one divisor is 𝒪(−1).
- Scholze–Weinstein, Lecture 24, Definition 24.1.1 and Proposition 24.1.2, p. 225: Independent check of the sign: b ∈ B(G, μ⁻¹), that is κ(b) = −μ♮, is the condition for the trivial bundle to be a modification of E\_b of position μ (Proposition 24.1.2; the orientation is that of Proposition 23.3.3).
- Fargues–Scholze, IX.7, p. 337: The source's notion of type: the modification from 𝒪 to 𝒪(1) has type 1.

### Relative position and the bounded substacks Hck^I\_{G,≤μ•} and Hck^I\_{G,W}

`HS0/bounded-hecke-substacks` · Definition · planet: **Closed Schubert cells of the Hecke stack**

**Definition.** Fix a finite Galois extension E′ ⊂ Ē of E splitting G, a maximal torus and Borel T ⊂ B ⊂ G\_{E′}, the set X\_\*(T)⁺ of dominant cocharacters with the dominance order (μ′ ≤ μ iff μ − μ′ is a sum of positive coroots with coefficients in ℤ\_{≥0}) and the action of Γ = Gal(Ē|E) on it. (1) Relative position. Let (D,E\_1,E\_2,α) be a geometric point Spa(C,C⁺) of Hck^{∗}\_G, D given by an untilt C♯ over E, and let τ: E′ → C♯ be an embedding over E (equivalently, a lift of D to Div¹\_{E′}); through τ the rings B⁺\_dR(C♯) ⊂ B\_dR(C♯) are E′-algebras, so that T ⊂ B ⊂ G\_{E′} are defined over them. Choose trivialisations e\_1, e\_2 of the completions Ê\_1, Ê\_2 over B⁺\_dR(C♯) and write α̂(e\_1) = e\_2·g with g ∈ G(B\_dR(C♯)). The relative position inv(E\_1,E\_2,α) is the unique μ ∈ X\_\*(T)⁺ with g ∈ G(B⁺\_dR(C♯))·μ(ξ)·G(B⁺\_dR(C♯)), ξ a uniformiser of B⁺\_dR(C♯). Equivalently the point (Ê\_1, e\_2⁻¹∘α̂) of the fibre Gr\_G(C) = G(B\_dR)/G(B⁺\_dR) of p\_2 lies in the Schubert cell Gr\_{G,μ} of Scholze–Weinstein Definition 19.2.2; for G = GL\_n and μ = (μ\_1 ≥ … ≥ μ\_n) this means α(Ê\_1) = ⊕\_i ξ^{μ\_i}B⁺\_dR·f\_i for a basis (f\_i) of Ê\_2. One says that E\_1 has position μ relative to E\_2. Another embedding τ∘γ, γ ∈ Gal(E′|E), replaces μ by a conjugate under Gal(E′|E); so only the Γ-orbit of the position is attached to a geometric point of Hck^{∗}\_G, and the position does not depend on τ when G is split. (2) Split groups. If G is split over E and μ• = (μ\_i)\_{i∈I} ∈ (X\_\*(T)⁺)^I, then Hck^I\_{G,≤μ•} ⊂ Hck^I\_G is the full substack of those S-points such that at every geometric point of S and every divisor x among the D\_i the relative position at x is ≤ Σ\_{i: D\_i = x} μ\_i. For the unordered collection {μ\_i} the substack of FS Definition VI.2.6, pulled back to (Div¹)^I, is the union over the permutations σ of I of the Hck^I\_{G,≤(μ\_{σ(i)})\_i}. (3) General G. Let W\_i ⊂ X\_\*(T)⁺ (i ∈ I) be finite Γ-stable subsets, each closed under the dominance order. Hck^I\_{G,W} ⊂ Hck^I\_G, W = (W\_i), is the full substack of those S-points such that at every geometric point of S and every divisor x of X\_S among the D\_i the relative position at x, computed with any embedding of E′ into the untilt of x, is ≤ Σ\_{i: D\_i = x} μ\_i for some choice of μ\_i ∈ W\_i; since the W\_i are Γ-stable the condition does not depend on the embedding. Here D\_i = x means equality of divisors of X\_S, that is of points of Div¹\_E. If μ\_i has field of definition F\_i ⊂ E′ (the fixed field of its stabiliser in Γ), then Hck^I\_{G,≤μ•} is the full substack of Hck^I\_G ×\_{(Div¹\_E)^I} ∏\_i Div¹\_{F\_i} of those S-points such that at every geometric point and every divisor x of X\_S among the D\_i the relative position at x is ≤ Σ\_{i: D\_i = x} μ\_i^x; here the untilt C♯\_x of x is an F\_i-algebra through the i-th leg, μ\_i^x is the conjugacy class of cocharacters of G over C♯\_x obtained from μ\_i by this base change, the sum is that of the dominant representatives for one maximal torus and Borel over C♯\_x (Scholze–Weinstein Definition 20.4.4), and Div¹\_{F\_i} is the space of degree-one divisors for the field F\_i, finite étale over Div¹\_E. After base change to (Div¹\_{E′})^I, on the open locus where no two legs differ by a nontrivial element of Gal(E′|E), these are the conditions of (2) for the split group G\_{E′} over E′, for some μ• ∈ ∏W\_i, respectively for the given μ•. At a geometric point where two legs have the same image x in Div¹\_E and lifts to Div¹\_{E′} that differ by γ ≠ 1, there is one position at x, and the cocharacter of one of the two legs enters the sum after transport by γ; the condition of (2) for the two lifts regarded as distinct legs is a different condition and is not stable under Gal(E′|E)^I. (4) Properties. These substacks are closed, are the preimages under loc of closed substacks of the local Hecke stack defined by the same conditions, and are stable under base change in S. If W\_i ⊂ W′\_i for all i then Hck^I\_{G,W} ⊂ Hck^I\_{G,W′}. Every map from a quasicompact S to Hck^I\_G factors through some Hck^I\_{G,W}. The unit e identifies Bun\_G × (Div¹)^I with Hck^I\_{G,(0)}. The swap maps Hck^I\_{G,W} onto Hck^I\_{G,W\*}, W\*\_i = {−w\_0μ : μ ∈ W\_i}. For G split and a: I → J, the map ι\_a carries the pullback of Hck^I\_{G,≤μ•} along Δ\_a into Hck^J\_{G,≤ν•} with ν\_j = Σ\_{a(i)=j} μ\_i.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p; G is a reductive group over E; k is an algebraic closure of F\_q; S ∈ Perf\_k, and X\_S is the relative Fargues–Fontaine curve over S.
- The normalisation is that of Scholze–Weinstein Definition 19.2.2 and FS VI.2: the Schubert cell of μ is the L⁺G-orbit of μ(ξ), and the lattice measured is that of E\_1 inside Ê\_2[1/ξ]. In this normalisation (𝒪, 𝒪(D)) has position 1 for G = 𝔾\_m, so a point of Hck\_{G,μ} is a modification from E\_1 to E\_2 of type μ in the sense of FS IX.7 (pp. 336–337).
- FS Definition VI.2.6 is used with the correction that the bijection ψ goes from the index set J of the cocharacters to the set I of untilts.
- For non-split G only Γ-stable bounds define substacks over (Div¹\_E)^I; a single μ defines one over the reflex field of μ.

**Construction.**

1. Relative position. The Cartan decomposition over the complete discrete valuation ring B⁺\_dR(C♯) with algebraically closed residue field (Scholze–Weinstein Proposition 19.2.1; FS VI.2) shows that the double coset of g contains μ(ξ) for a unique dominant μ; changing e\_1, e\_2 multiplies g on the right and on the left by elements of G(B⁺\_dR(C♯)), and changing ξ by a unit changes μ(ξ) by an element of T(B⁺\_dR(C♯)).
2. Split case. The condition depends only on loc, and the local substack it defines is the pullback to (Div¹\_X)^I of the closed subfunctor of FS Definition VI.2.6 and Proposition VI.2.7 (GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness), with ordered legs as in Scholze–Weinstein Definition 20.4.4; closedness is checked after pullback to (Div¹)^d, where it is Scholze–Weinstein Proposition 20.5.4. The comparison with the unordered definition is pointwise: a bijection ψ of the index sets reorders μ•.
3. General G. The conditions of (3) are stable under Gal(E′|E)^I, respectively ∏\_i Gal(E′|F\_i), acting on the lifts of the legs to Div¹\_{E′}: for Hck^I\_{G,W} because the W\_i are Γ-stable, and for Hck^I\_{G,≤μ•} because μ\_i^x depends only on the F\_i-structure of the i-th leg. Closedness is checked after base change along the finite étale cover (Div¹\_{E′})^I → (Div¹\_E)^I (closed immersions are v-local on the target, DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes). Let U ⊂ (Div¹\_{E′})^I be the open locus where no two legs differ by a nontrivial element of Gal(E′|E); the group Gal(E′|E) acts freely on Div¹\_{E′} over Div¹\_E, so every point of (Div¹\_{E′})^I has an open neighbourhood which a suitable element of Gal(E′|E)^I maps into U. Over U the divisor Σ D\_i of X\_S is the isomorphic image of the divisor of the lifted legs on the curve for E′, the base change of X\_S along Spa E′ → Spa E, which is finite étale over X\_S; so the completed rings along the two divisors agree, G-torsors over them are G\_{E′}-torsors, and the conditions of (3) become those of (2) for the split group G\_{E′}, a finite union over ∏W\_i in the first case. These are closed by the split case; transport by the element of Gal(E′|E)^I, which replaces μ• by a conjugate tuple, gives closedness near every point. The source for Γ-stable bounds is FS VI.10 (p. 230); for a single μ\_i over its field of definition, Scholze–Weinstein §20.2 and Definition 20.4.4.
4. Properties. Monotonicity is clear. Exhaustion: choose a faithful representation ρ: G → GL\_n; on a quasicompact S the maps α\_ρ and α\_ρ⁻¹ have poles of bounded order, which bounds the entries of ρ∘μ for every relative position μ that occurs, and X\_\*(T)⁺ → ℤⁿ/S\_n has finite fibres (FS proof of Lemma III.3.4), so finitely many μ occur; their Γ-orbits and the elements below them form a finite W. Unit: inv = 0 at all geometric points means that the point of Gr\_G lies in the closed subsheaf Gr\_{G,≤0}, which is the unit section (a closed immersion that is bijective on geometric points, DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks), so α̂ is an isomorphism over B⁺\_D(S) and α extends over X\_S by RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing. Swap: g ↦ g⁻¹ exchanges the double cosets of μ(ξ) and of (−w\_0μ)(ξ). Repetition: the bound at a point x of the J-legs is Σ\_{j: D\_j = x} ν\_j = Σ\_{i: D\_{a(i)} = x} μ\_i.

**API.**

- `HckI.relPos` (data): inv(E\_1,E\_2,α) ∈ X\_\*(T)⁺ for a geometric point of Hck^{∗}\_G together with an embedding over E of E′ into the untilt of the leg: the μ with α̂(e\_1) ∈ e\_2·G(B⁺\_dR)μ(ξ)G(B⁺\_dR); it is independent of e\_1, e\_2 and ξ, and another embedding replaces it by a conjugate under Gal(E′|E), so that for a point of Hck^{∗}\_G it is defined up to Γ.
- `HckI.Bounded` (data): The substacks Hck^I\_{G,≤μ•} (G split, or over ∏ Div¹\_{F\_i} for the fields of definition F\_i, with coincidence of legs taken in Div¹\_E and each μ\_i transported by the F\_i-structure of its leg) and Hck^I\_{G,W} (W\_i finite, Γ-stable, closed under ≤) of Hck^I\_G.
- `HckI.Bounded.closed` (structure): Hck^I\_{G,W} → Hck^I\_G is a closed immersion, equal to the preimage under loc of the closed substack of the local Hecke stack defined by the same condition; it is stable under the action of L⁺G on the fibres of p\_2.
- `HckI.Bounded.mono` (relation): W\_i ⊂ W′\_i for all i implies Hck^I\_{G,W} ⊂ Hck^I\_{G,W′}; for G split, μ′\_i ≤ μ\_i for all i implies Hck^I\_{G,≤μ′•} ⊂ Hck^I\_{G,≤μ•}.
- `HckI.Bounded.exhaust` (characterisation): Every map S → Hck^I\_G with S quasicompact factors through Hck^I\_{G,W} for some W.
- `HckI.Bounded.unit` (example): e: Bun\_G × (Div¹)^I → Hck^I\_{G,(0)} is an equivalence: an S-point has position 0 at all geometric points and legs iff α extends to an isomorphism E\_1 ≅ E\_2 over X\_S.
- `HckI.Bounded.swap` (relation): inv(E\_2,E\_1,α⁻¹) = −w\_0·inv(E\_1,E\_2,α), and sw(Hck^I\_{G,W}) = Hck^I\_{G,W\*} with W\*\_i = −w\_0W\_i.
- `HckI.Bounded.collision` (relation): For G split and a: I → J, ι\_a maps the pullback of Hck^I\_{G,≤μ•} along Δ\_a into Hck^J\_{G,≤ν•}, ν\_j = Σ\_{a(i)=j} μ\_i; for a: {1,2} → {∗} this is an equivalence onto Hck^{∗}\_{G,≤μ\_1+μ\_2}.
- `HckI.Bounded.cell` (characterisation): For G split and one leg, Hck\_{G,μ} = Hck\_{G,≤μ} ∖ ⋃\_{μ′<μ} Hck\_{G,≤μ′} is open in Hck\_{G,≤μ}; its geometric points are those of relative position exactly μ.
- `HckI.Bounded.class` (relation): μ′ ≤ μ implies μ′♯ = μ♯ in π\_1(G); hence on Hck\_{G,≤μ} (one leg, G split) the class of the relative position in π\_1(G) is the constant μ♯.

**Unit tests.**

- `HckI.Bounded.zero_test` (degenerate): For W\_i = {0} for all i, e: Bun\_G × (Div¹)^I → Hck^I\_{G,(0)} is an equivalence; for G = GL\_n and one leg, an object with α(Ê\_1) ⊂ Ê\_2 lies in Hck\_{G,(0)} only if α(Ê\_1) = Ê\_2.
- `HckI.Bounded.collision_test` (computation): G = 𝔾\_m, I = {1,2}, μ• = (a,c) ∈ ℤ²: p\_2: Hck^{1,2}\_{𝔾\_m,≤(a,c)} → Pic × (Div¹)² is an isomorphism with inverse (L\_2,D\_1,D\_2) ↦ (L\_2 ⊗ I\_{D\_1}^a ⊗ I\_{D\_2}^c, L\_2, can); over the diagonal D\_1 = D\_2 = D the relative position at D is a + c, and deg L\_1 = deg L\_2 − a − c.
- `HckI.Bounded.GL2_test` (computation): G = GL\_2, one leg D over a geometric point with untilt C♯, E\_2 fixed. The fibre of p\_{2,≤(1,0)} over (E\_2,D) is the set of lattices Λ with ξÊ\_2 ⊂ Λ ⊂ Ê\_2 and Ê\_2/Λ of length one, in bijection with ℙ¹(C♯). The fibre of p\_{2,≤(2,0)} is the set of lattices Λ ⊂ Ê\_2 with Ê\_2/Λ of length two: the cell of position (2,0), where Ê\_2/Λ ≅ B⁺\_dR/ξ², together with the single point Λ = ξÊ\_2 of position (1,1). The lattice Ê\_2 (position (0,0)) and the lattices of colength one are not in it.
- `HckI.Bounded.nonsplit_test` (non-example): Let F|E be the unramified quadratic extension and G = Res\_{F|E}𝔾\_m, so X\_\*(T) = ℤ² with Γ acting through the swap. The set {(1,0)} is not Γ-stable and defines no substack of Hck\_G over Div¹\_E. For W = {(1,0),(0,1)} the fibre of p\_{2,W} over (E\_2,D), with D given by an untilt S♯ over E and Ê\_2 trivialised, is Gr\_{G,W} ×\_{Spd E} S, where Gr\_{G,W} ≅ Spd F is connected and finite étale of degree 2 over Spd E; after base change to Spd F it is the disjoint union of the two sections of positions (1,0) and (0,1).
- `HckI.Bounded.twisted_collision_test` (computation): Let F|E be a separable quadratic extension with Gal(F|E) = {1,γ} and G = Res\_{F|E}𝔾\_m, so that G-bundles on X\_S are line bundles on X\_{S,F} = X\_S ×\_{Spa E} Spa F and Div¹\_F is the space of degree-one divisors of X\_{S,F}; let I = {1,2} and μ\_1 = μ\_2 = (1,0), with field of definition F. Then p\_2: Hck^{1,2}\_{G,≤μ•} → Bun\_G × (Div¹\_F)² is an isomorphism with inverse (L\_2,D′\_1,D′\_2) ↦ (L\_2 ⊗ I\_{D′\_1} ⊗ I\_{D′\_2}, L\_2, can). At a geometric point with D′\_2 = D′\_1 the position at the common image in X\_S is (2,0) = μ\_1 + μ\_2. At a geometric point with D′\_2 = γ(D′\_1) the two legs again have the same image x in X\_S, the fibre is not empty, and the position at x is (1,1) = μ\_1 + γμ\_2, which is not ≤ (2,0).

**Uses.**

- HeckeStacksAndLocalShtukas:HS0/descent-and-bounded-fibres: Properness, spatial representability and finite dim.trg are statements about p\_1 and p\_2 restricted to these substacks.
- HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology: The Satake kernel attached to a representation has support in some Hck^I\_{G,W}, on which p\_2 is proper, so that the pushforward along p\_2 is defined (FS I.2, p. 16; VI.10, p. 230).
- HeckeStacksAndLocalShtukas:HS2/local-shtuka-moduli: Bounded local shtukas are fibres of Hck^I\_{G,≤μ•} over two fixed bundles, over the product of the reflex-field bases.
- HeckeStacksAndLocalShtukas:HS0/structure-group-and-inner-form: The relative position controls the change of the Kottwitz invariant: κ(E\_1) = κ(E\_2) + μ♯.

**Acceptance.**

- G = 𝔾\_m, one leg: (L\_1,L\_2,α) has position n iff α identifies L\_1 with L\_2 ⊗ I\_Dⁿ; (𝒪,𝒪(D),can) has position 1 and (𝒪(D),𝒪,can⁻¹) has position −1.
- G = GL\_n: (E\_1,E\_2,α) has position (1,0,…,0) iff α extends to an injection E\_1 → E\_2 whose cokernel is a line bundle on the divisor D; e.g. 𝒪ⁿ ⊂ 𝒪(1/n) with cokernel of length one.
- Over the diagonal of (Div¹)², Hck^{1,2}\_{G,≤(μ\_1,μ\_2)} is Hck^{∗}\_{G,≤μ\_1+μ\_2} (G split).
- For μ′ ≤ μ the images of μ and μ′ in π\_1(G) agree, so the class of the relative position in π\_1(G) is constant on Hck\_{G,≤μ} for one leg (G split).

**Prerequisites.**

- In this roadmap: `HS0/global-hecke-correspondence`.
- In other roadmaps: `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks`, `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`.

**Sources.**

- Fargues–Scholze, I.2, p. 16: Closed Schubert substacks of the Hecke stack for each conjugacy class of cocharacters.
- Scholze–Weinstein, Lecture 19, Proposition 19.2.1, p. 172: Normalisation of Schubert cells: the orbit of μ(ξ).
- Scholze–Weinstein, Lecture 19, proof of Proposition 19.4.2, p. 177: For GL\_n the cell of μ contains the lattice with elementary divisors ξ^{μ\_i}.
- Fargues–Scholze, VI.2, Definition VI.2.2, p. 197: One-leg bounded substack: relative position at every geometric point below μ.
- Fargues–Scholze, VI.2, Definition VI.2.6, p. 200: Several legs: the bound at an untilt is the sum of the cocharacters attached to it (the direction of the bijection is misprinted).
- Fargues–Scholze, VI.2, Proposition VI.2.7, p. 201: Closedness of the bounded substack for several legs.
- Scholze–Weinstein, Lecture 20, Definition 20.4.4, p. 187: Ordered legs: the bound at S♯\_i is the sum over the legs equal to it (the range of the index is misprinted as n).
- Fargues–Scholze, VI.10, p. 230: Bounds for general G: finite Galois-stable sets closed under the dominance order.
- Scholze–Weinstein, Lecture 20, §20.2, p. 184: A single Schubert variety is defined over the field of definition of μ only.
- Fargues–Scholze, VI.2, proof of Proposition VI.2.4, p. 199: Fargues–Scholze state the normalisation themselves: for GL\_n the section [μ] = μ(ξ) of the Grassmannian is the lattice ⊕ ξ^{k\_i}B⁺\_dR, as in Scholze–Weinstein.

## HS1. Kernels and the coherent Hecke action

This layer turns the Satake category into operators on D\_lis(Bun\_G,Λ). The kernel of a representation V of (Ĝ⋊Q)^I is S′\_V = D(S\_V)^∨, the relative Verdier dual of the Satake sheaf followed by the solid dual, pulled back to the global Hecke stack; the Hecke operator is T\_V(A) = p\_{2♮}(p\_1^\*A ⊗ S′\_V), formed with relative homology, which exists for every map of small v-stacks. For torsion coefficients it is the operator Rp\_{2\*}(p\_1^\*A ⊗ S\_V) on étale sheaves.

The theorems are those of Fargues–Scholze IX.1 and IX.2: V ↦ T\_V is monoidal and functorial in the finite set of legs; T\_V preserves lisse sheaves (IX.2.1), has T\_{V^∨} as left and right adjoint and so preserves compact objects, preserves universally locally acyclic objects, and commutes with Bernstein–Zelevinsky and Verdier duality up to the Chevalley involution (IX.2.2); D\_lis(Bun\_G,Λ) carries a condensed structure for which Hom out of a compact object is relatively discrete (IX.1.1, IX.1.2); and T\_V(A) descends to Bun\_G × [∗/W\_E^I], that is, carries a continuous action of W\_E^I (IX.2.3). The compatibility of all of this with change of the coefficient ring, which the source uses without stating it, is a node of its own.

The layer is checked on G\_m, where T\_V for the character z ↦ zⁿ is pullback along (L, D) ↦ L(−nD); on PGL\_2 with the standard representation of SL\_2, where the kernel is the constant sheaf on a P¹-fibration with the shift [−1] and twist (−1/2); and on representations inflated from Q, where T\_V is a twist by a local system that is constant only at a geometric point of the legs.

**Planets.** Solid Satake kernel (`HS1/satake-kernel-and-solid-monoidal-functor`); Hecke operator (`HS1/hecke-operator-via-relative-homology`); Hecke operators preserve compact objects (`HS1/properties-and-weil-equivariance`); Condensed structure on D\_lis(Bun\_G) (`HS1/condensed-enrichment`); W\_E^I-equivariant Hecke operators (`HS1/continuous-weil-descent`).

**Dependencies.** Earlier layers of this roadmap: HS0. Layers of other roadmaps cited by the nodes: `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS1`, `GeometricSatakeAndFusion:GS2:correspondences`, `GeometricSatakeAndFusion:GS3:fusion`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `VStackSheavesAndLisseCategories:VS1`, `VStackSheavesAndLisseCategories:VS2`, `VStackSheavesAndLisseCategories:VS3`, `VStackSheavesAndLisseCategories:VS4`, `VStackSheavesAndLisseCategories:VS5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Coverage.** Status `planned`. Target-level plan with 10 nodes; every target of the stage text is a node. The stage is not closed: it has open requests. Remaining:

- Statements requested from supplier stages that have no node for them yet: GeometricSatakeAndFusion:GS1, GeometricSatakeAndFusion:GS4:integral-dual-group, tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ (requested extension: ReductiveGroupsIntegralRepresentationsPartII), VStackSheavesAndLisseCategories:VS2, VStackSheavesAndLisseCategories:VS4, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group.
- Lemma-level refinement of the target-level nodes of this stage.

### Global solid Satake kernel

`HS1/satake-kernel-and-solid-monoidal-functor` · Construction · planet: **Solid Satake kernel**

**Construction.** For a finite set I let 𝓗ck^I\_G=[L⁺G\\LG/L⁺G] be the local Hecke stack over (Div¹)^I and q\_I: Hck^I\_G→𝓗ck^I\_G the map from the global Hecke stack that restricts a modification to the formal completion along the legs. For V∈Rep\_{Z\_ℓ[√q]}((Ĝ⋊Q)^I) let S\_V∈Sat(𝓗ck^I\_G,Z\_ℓ[√q]) be its normalized Satake sheaf (an inverse limit over n of flat perverse universally locally acyclic sheaves with Z/ℓⁿ[√q]-coefficients). Its solid kernel is S′\_V=D(S\_V)^∨∈D\_■(𝓗ck^I\_G,Z\_ℓ[√q]): first the Verdier dual D relative to the projection 𝓗ck^I\_G→[(Div¹)^I/L⁺G], then the solid dual A^∨=RHom\_{D\_■}(A,Z\_ℓ[√q]). V↦S′\_V is an exact Rep\_{Z\_ℓ[√q]}(Q^I)-linear monoidal functor for the convolution A⋆B=p\_{13♮}(p\_{12}^\*A⊗^■p\_{23}^\*B) of FS VII.5, functorial in I. For a Z\_ℓ[√q]-algebra Λ it extends uniquely to an exact Rep\_Λ(Q^I)-linear monoidal functor Rep\_Λ((Ĝ⋊Q)^I)→D\_■(𝓗ck^I\_G,Λ), V↦S′\_V, functorial in I; this uses the equivalence Perf(B(Ĝ⋊Q)^I\_{Z\_ℓ[√q]})⊗\_{Perf(BQ^I\_{Z\_ℓ[√q]})}Perf(BQ^I\_Λ)≃Perf(B(Ĝ⋊Q)^I\_Λ) and the fact that Perf(B(Ĝ⋊Q)^I\_Λ) is the free stable ∞-category on the exact category Rep\_Λ((Ĝ⋊Q)^I). The global kernel of V is q\_I^\*S′\_V∈D\_■(Hck^I\_G,Λ), again written S′\_V. V↦q\_I^\*S′\_V is an exact Rep\_Λ(Q^I)-linear monoidal functor to D\_■(Hck^I\_G,Λ) with its convolution over (Div¹)^I, functorial in I; its unit is S′\_1≅δ\_♮Λ for the identity-modification section δ: Bun\_G×(Div¹)^I→Hck^I\_G. Every S′\_V is dualizable for the convolution, with dual S′\_{V^∨}. After pullback along the diagonal geometric point Spd C→(Div¹)^I, C the completed algebraic closure of E, the functor factors through restriction Rep\_Λ((Ĝ⋊Q)^I)→Rep\_Λ(Ĝ^I).

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- ℓ≠p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root √q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ⊗\_{Z\_ℓ,disc}Λ (FS VII.6). No condition on ℓ beyond ℓ≠p is imposed.
- Q is a finite quotient of W\_E through which the action of W\_E on the pinned dual group Ĝ factors. For a flat affine group scheme H over Z\_ℓ, Rep\_Λ(H) is the exact category of algebraic representations of H on finite projective Λ-modules.

**Construction.**

1. Local kernel over Z\_ℓ[√q] (supplied by the perfect-complex Satake extension of GeometricSatakeAndFusion GS4; FS IX.2 p.321, VII.5 pp.264 and 267–268). S\_V is universally locally acyclic over (Div¹)^I and flat, so the covariant embedding A↦D(A)^∨ of FS VII.5 applies to it. A↦A^∨ carries the étale convolution of proper kernels of finite Tor-dimension to the solid convolution by FS VII.4.2 and VII.4.3, and Verdier duality is monoidal on the Satake category, so V↦D(S\_V)^∨ is monoidal; the source category is an ordinary category of perverse sheaves, so no higher coherence data have to be supplied.
2. Λ-linear extension (GeometricSatakeAndFusion:GS4:integral-dual-group/enhanced-perfect-satake-extension, which rests on highest weight theory over Z\_ℓ[√q]-algebras and on the universal property of the category of perfect complexes; FS p.321): the two facts quoted in the statement give the unique exact Rep\_Λ(Q^I)-linear monoidal extension to Rep\_Λ((Ĝ⋊Q)^I).
3. Globalisation. q\_I^\* is symmetric monoidal for ⊗^■ and commutes with ♮-pushforward along any base change (FS VII.3.1(iii)). The global convolution diagram Hck^I\_G×\_{Bun\_G×(Div¹)^I}Hck^I\_G→Hck^I\_G is the base change along q\_I of the local convolution diagram (chains-of-modifications node of HS0, by Beauville–Laszlo gluing), so q\_I^\* is monoidal for the two convolutions.
4. Unit. S\_1=e\_\*Λ for the unit section e: [(Div¹)^I/L⁺G]→𝓗ck^I\_G; D(e\_\*Λ)=e\_\*Λ because e is a section of the projection, and (e\_\*Λ)^∨≅e\_♮Λ by FS VII.4.3 (e is a closed immersion). The square formed by δ, e, q\_I and Bun\_G×(Div¹)^I→[(Div¹)^I/L⁺G] is cartesian, so q\_I^\*e\_♮Λ≅δ\_♮Λ by FS VII.3.1(iii).
5. Dualizability and the geometric fibre. A monoidal functor preserves duals, and V∈Rep\_Λ((Ĝ⋊Q)^I) has dual V^∨. The functor is Rep\_Λ(Q^I)-linear and the local systems attached to Rep\_Λ(Q^I) become constant on Spd C, so the composite to D\_■(Hck^I\_G×\_{(Div¹)^I}Spd C,Λ) factors over Rep\_Λ(Ĝ^I) (FS IX.2 p.322).

**API.**

- `globalKernel` (constructor): For V∈Rep\_Λ((Ĝ⋊Q)^I): the object S′\_V=q\_I^\*(S′\_V)^{loc}∈D\_■(Hck^I\_G,Λ), where for Λ=Z\_ℓ[√q] the local object is D(S\_V)^∨, D the Verdier dual relative to 𝓗ck^I\_G→[(Div¹)^I/L⁺G] and A^∨=RHom\_{D\_■}(A,Λ), and for general Λ it is the value of the unique exact Rep\_Λ(Q^I)-linear monoidal extension.
- `globalKernel.map` (functoriality): V↦S′\_V is covariant, Λ-linear and exact: f: V→W induces S′\_f: S′\_V→S′\_W with S′\_{id}=id and S′\_{g∘f}=S′\_g∘S′\_f; a short exact sequence 0→V′→V→V″→0 in Rep\_Λ((Ĝ⋊Q)^I) gives a cofibre sequence S′\_{V′}→S′\_V→S′\_{V″}.
- `globalKernel.unit` (simp): S′\_1≅δ\_♮Λ for the identity-modification section δ: Bun\_G×(Div¹)^I→Hck^I\_G; consequently RHom\_{D\_■}(S′\_1,Λ)≅δ\_\*Λ.
- `globalKernel.tensor` (structure): Monoidal constraint S′\_{V⊗W}≅S′\_V⋆S′\_W for the convolution of D\_■(Hck^I\_G,Λ) over (Div¹)^I, natural in V and W, with the associativity and unit coherences.
- `globalKernel.weilLinear` (structure): For U∈Rep\_Λ(Q^I): S′\_{U⊗V}≅p^\*L\_U⊗^■\_ΛS′\_V, where p: Hck^I\_G→(Div¹)^I is the leg map and L\_U the local system on (Div¹)^I attached to U through (Div¹)^I→[\*/W\_E^I]→[\*/Q^I]; compatible with the monoidal constraints.
- `globalKernel.restrictLegs` (functoriality): For a map ζ: I→J of finite sets let ζ^\*: Rep\_Λ((Ĝ⋊Q)^I)→Rep\_Λ((Ĝ⋊Q)^J) be restriction along (Ĝ⋊Q)^J→(Ĝ⋊Q)^I, ι\_ζ: Hck^I\_G×\_{(Div¹)^I}(Div¹)^J→Hck^J\_G the fully faithful map of HS0/global-hecke-correspondence (5), which restricts to a closed immersion on every bounded part (there it is a monomorphism between stacks that are proper over Bun\_G×(Div¹)^J, by HS0/descent-and-bounded-fibres (c)), and pr\_ζ the projection to Hck^I\_G. Then S′\_{ζ^\*V}≅ι\_{ζ♮}pr\_ζ^\*S′\_V, compatibly with composition of maps of finite sets and with the monoidal constraints.
- `globalKernel.dual` (relation): S′\_V is left and right dualizable for ⋆ with dual S′\_{V^∨}; the evaluation and coevaluation are the images of those of V.
- `globalKernel.switch` (relation): After pullback to Spd C→(Div¹)^I and for V∈Rep\_Λ(Ĝ^I): sw^\*S′\_V≅S′\_{sw^\*V}, where sw is the involution of the Hecke stack exchanging the two bundles and sw^\* on Rep\_Λ(Ĝ^I) is the Chevalley involution composed with conjugation by ρ̂(−1)∈Ĝ\_ad (FS VI.12.1).
- `globalKernel.support` (characterisation): If the weights of V|\_{Ĝ^I} are bounded by a tuple μ\_• of dominant cocharacters, then S′\_V≅i\_♮i^\*S′\_V for the closed bounded substack i: Hck^I\_{G,≤μ\_•}→Hck^I\_G, on which p\_2 is proper, representable in spatial diamonds and of finite dim.trg.
- `globalKernel.geometricFibre` (characterisation): The composite Rep\_Λ((Ĝ⋊Q)^I)→D\_■(Hck^I\_G,Λ)→D\_■(Hck^I\_G×\_{(Div¹)^I}Spd C,Λ) factors through the restriction functor to Rep\_Λ(Ĝ^I).
- `globalKernel.torsion` (compatibility): For Λ₀=Z/ℓⁿ[√q] and V∈Rep\_{Λ₀}((Ĝ⋊Q)^I) with pulled-back Satake sheaf S\_V∈D\_ét(Hck^I\_G,Λ₀), and with D(S\_V) the pullback along q\_I of the Verdier dual of the Satake sheaf on the local Hecke stack relative to 𝓗ck^I\_G→[(Div¹)^I/L⁺G]: S′\_V=RHom\_{D\_■}(D(S\_V),Λ₀), and D(S\_V)≅RHom\_{D\_■}(S′\_V,Λ₀) (biduality of FS VII.4.1, stated there for Z/n-coefficients).
- `globalKernel.minuscule` (example): G split, I a singleton, μ a minuscule dominant cocharacter with d=⟨2ρ,μ⟩, i\_μ: Hck\_{G,μ}→Hck\_G the closed stratum and V the minuscule representation with S\_V=i\_{μ\*}Λ[d\](d/2): then S′\_V≅i\_{μ♮}Λ[−d\](−d/2).
- `globalKernel.torus` (example): G=T a split torus, I a singleton, χ∈X^\*(T̂)=X\_\*(T): S\_χ=S′\_χ is the constant sheaf Λ in degree 0, extended by zero, on the open and closed substack of Hck\_T of modifications of position χ (HS0/bounded-hecke-substacks), which p\_2 maps isomorphically onto Bun\_T×Div¹.

**Unit tests.**

- `globalKernel.unit_test` (degenerate): For every finite set I and the trivial representation 1 of (Ĝ⋊Q)^I: S′\_1≅δ\_♮Λ, where δ: Bun\_G×(Div¹)^I→Hck^I\_G is the identity modification, and RHom\_{D\_■}(S′\_1,Λ)≅δ\_\*Λ. For I=∅ this reads S′\_1=Λ on Hck^∅\_G=Bun\_G.
- `globalKernel.minuscule_test` (computation): For G=PGL\_2, I a singleton, V the standard representation of Ĝ=SL\_2 and i\_μ: Hck\_{G,μ}→Hck\_G the minuscule closed stratum (a fibration in twisted forms of P¹ over Bun\_G×Div¹): S\_V=i\_{μ\*}Λ[1\](1/2), D(S\_V)≅S\_V and S′\_V≅i\_{μ♮}Λ[−1\](−1/2).
- `globalKernel.torus_test` (computation): For G=G\_m, I a singleton and V\_n the character z↦zⁿ of Ĝ=G\_m: S′\_{V\_n} is the constant sheaf Λ in degree 0, extended by zero, on the open and closed substack of Hck\_{G\_m} of modifications L\_1⇢L\_2 with deg L\_2−deg L\_1=n, that is L\_1=L\_2(−nD), the modifications of position n in the normalisation of HS0/bounded-hecke-substacks; and S′\_{V\_n}⋆S′\_{V\_m}≅S′\_{V\_{n+m}}.
- `globalKernel.weil_character_test` (characterisation): For U∈Rep\_Λ(Q^I) inflated to (Ĝ⋊Q)^I: S′\_U≅δ\_♮(pr\_2^\*L\_U) with L\_U the local system on (Div¹)^I attached to U. Its pullback to Spd C→(Div¹)^I is δ\_♮ of a constant sheaf, but L\_U is a constant local system on (Div¹)^I only if Q^I acts trivially on U.
- `globalKernel.covariance_test` (characterisation): For I a singleton and V∈Rep\_Λ(Ĝ⋊Q) the coevaluation 1→V⊗V^∨ induces a map δ\_♮Λ→S′\_V⋆S′\_{V^∨} and the evaluation V^∨⊗V→1 a map S′\_{V^∨}⋆S′\_V→δ\_♮Λ, and these satisfy the two triangle identities.

**Uses.**

- HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology: S′\_V is the kernel in T\_V(A)=p\_{2♮}(p\_1^\*A⊗S′\_V) (FS IX.2 p.321).
- HeckeStacksAndLocalShtukas:HS1/monoidality-of-hecke-operators: Monoidality, Rep\_Λ(Q^I)-linearity and functoriality in I of V↦S′\_V give T̃\_1≅id, T̃\_{V⊗W}≅T̃\_W∘T̃\_V and fusion.
- HeckeStacksAndLocalShtukas:HS0/demazure-generators-of-ULA-kernels: The proof of FS IX.2.1 enlarges the class of kernels S′\_V to q^\*B^∨ for B universally locally acyclic on the local Hecke stack and resolves B by Demazure pushforwards.
- HeckeStacksAndLocalShtukas:HS1/duality-exchange: sw^\*S′\_V≅S′\_{sw^\*V} (FS VI.12.1) gives the pairing identity in the proof of FS IX.2.2.
- HeckeStacksAndLocalShtukas:HS3/satake-coefficients-and-partial-frobenius: FS IX.3 p.326 pulls S′\_W=D(S\_W)^∨ back to the moduli of local shtukas and forms f\_{K♮}S′\_W.

**Acceptance.**

- S′\_1≅δ\_♮Λ, and δ\_♮Λ is the unit of the convolution on D\_■(Hck^I\_G,Λ).
- For G=PGL\_2, I a singleton and V the standard representation of Ĝ=SL\_2: S\_V=i\_{μ\*}Λ[1\](1/2) on the minuscule Schubert stratum i\_μ (FS p.240), D(S\_V)≅S\_V (FS p.241), and S′\_V≅i\_{μ♮}Λ[−1\](−1/2).
- For U∈Rep\_Λ(Q^I) inflated to (Ĝ⋊Q)^I: S′\_U≅δ\_♮(L\_U), L\_U the local system pulled back from (Div¹)^I→[\*/W\_E^I]→[\*/Q^I]; after pullback to Spd C→(Div¹)^I it becomes δ\_♮ of the constant sheaf on the underlying Λ-module of U.
- For a homomorphism Λ→Λ′ of Z\_ℓ[√q]-algebras, S′\_{V⊗\_ΛΛ′}≅S′\_V⊗^■\_ΛΛ′ compatibly with the monoidal constraints (uniqueness of the linear extension).

**Prerequisites.**

- In this roadmap: `HS0/global-hecke-correspondence`, `HS0/chains-and-composition`.
- In other roadmaps: `GeometricSatakeAndFusion:GS4:integral-dual-group/enhanced-perfect-satake-extension`, `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:abstract/exact-functors`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS2/torsion-solid-comparisons`, `VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`.

**Sources.**

- Fargues–Scholze, IX.2, p. 321: Definition of the local kernel: relative Verdier dual, then solid dual; exact, Rep(Q^I)-linear, monoidal, functorial in I.
- Fargues–Scholze, IX.2, p. 321: Unique Λ-linear extension, which defines S′\_V for every Z\_ℓ[√q]-algebra Λ.
- Fargues–Scholze, IX.2, p. 321: The global kernel is the pullback of the local one and the functor stays monoidal.
- Fargues–Scholze, VII.5, p. 264: The covariant embedding A↦D\_{X/S}(A)^∨ with A^∨ the solid dual: the order of the two dualities.
- Fargues–Scholze, IX.2, p. 322: Factorisation through Rep\_Λ(Ĝ^I) at the diagonal geometric point.

### Hecke action by relative homology

`HS1/hecke-operator-via-relative-homology` · Construction · planet: **Hecke operator**

**Construction.** Let I be a finite set, X\_I=Bun\_G×(Div¹)^I, and p\_1: Hck^I\_G→Bun\_G, p\_2: Hck^I\_G→X\_I the projections of the global Hecke stack (p\_1 the first bundle, p\_2 the second bundle together with the legs). For V∈Rep\_Λ((Ĝ⋊Q)^I) with global kernel S′\_V∈D\_■(Hck^I\_G,Λ), the Hecke operator is the functor T\_V: D\_■(Bun\_G,Λ)→D\_■(X\_I,Λ), T\_V(A)=p\_{2♮}(p\_1^\*A⊗^■\_ΛS′\_V), where ⊗^■\_Λ is the solid tensor product and p\_{2♮} (relative homology) is the left adjoint of p\_2^\*: D\_■(X\_I,Λ)→D\_■(Hck^I\_G,Λ) (FS VII.3.1). Its restriction to D\_lis(Bun\_G,Λ) is the Hecke operator T\_V: D\_lis(Bun\_G,Λ)→D\_■(X\_I,Λ) of FS IX.2. With h\_1=(p\_1,legs): Hck^I\_G→X\_I in place of p\_1, the same formula B↦p\_{2♮}(h\_1^\*B⊗^■\_ΛS′\_V) defines a D\_■((Div¹)^I,Λ)-linear endofunctor T̃\_V of D\_■(X\_I,Λ), and T\_V(A)=T̃\_V(pr^\*A) for pr: X\_I→Bun\_G. The construction commutes with base change along any S→(Div¹)^I. For the diagonal geometric point Spd C→(Div¹)^I, C the completed algebraic closure of E, the resulting endofunctor of D\_■(Bun\_G×Spd C,Λ) depends only on V|\_{Ĝ^I}∈Rep\_Λ(Ĝ^I). Torsion comparison: for Λ₀=Z/ℓⁿ[√q], V∈Rep\_{Λ₀}((Ĝ⋊Q)^I) with Satake sheaf S\_V pulled back to Hck^I\_G, and A∈D\_ét(Bun\_G,Λ₀)⊂D\_■(Bun\_G,Λ₀), there is a natural isomorphism T\_V(A)≅Rp\_{2!}(p\_1^\*A⊗^L\_{Λ₀}S\_V)=Rp\_{2\*}(p\_1^\*A⊗^L\_{Λ₀}S\_V) in D\_ét(X\_I,Λ₀); this is the Hecke operator of FS p.317.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- ℓ≠p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root √q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ⊗\_{Z\_ℓ,disc}Λ (FS VII.6). No condition on ℓ beyond ℓ≠p is imposed.
- Q is a finite quotient of W\_E through which the action of W\_E on the pinned dual group Ĝ factors. For a flat affine group scheme H over Z\_ℓ, Rep\_Λ(H) is the exact category of algebraic representations of H on finite projective Λ-modules.

**Construction.**

1. Definition (FS IX.2 pp.321–322; FS VII.3.1(i) for the existence of the left adjoint f\_♮ of f^\* for every map f of small v-stacks, FS VII.2.2 for ⊗^■). T̃\_V is D\_■((Div¹)^I,Λ)-linear by the projection formula f\_♮(A⊗^■f^\*B)≅f\_♮A⊗^■B of FS VII.3.1(i), and commutes with base change in (Div¹)^I by FS VII.3.1(iii). T\_V is exact and commutes with all colimits, being a composite of left adjoints.
2. Geometric fibre (FS p.322): by base change the restriction of T̃\_V to Bun\_G×Spd C is given by the kernel S′\_V|\_{Hck^I\_G×\_{(Div¹)^I}Spd C}, which depends only on V|\_{Ĝ^I} by the kernel node.
3. Torsion comparison. S\_V is universally locally acyclic over (Div¹)^I with bounded Tor-amplitude and is supported on a closed bounded substack Hck^I\_{G,≤μ\_•}, on which p\_2 is proper, representable in spatial diamonds and of finite dim.trg (bounded-fibres node of HS0). The Verdier dual of q\_I^\*S\_V relative to p\_2 is q\_I^\*D(S\_V): universal local acyclicity gives base change, and the choice between the two projections of the local Hecke stack is immaterial on the Satake category because D commutes with sw^\* (FS VI.9.5). FS VII.5.2 applied to p\_2 on this substack, with its hypotheses (compactifiable, representable in locally spatial diamonds, locally of finite dim.trg; kernel universally locally acyclic of bounded Tor-amplitude; the other factor in D\_ét with Z/n-coefficients), gives p\_{2♮}(D(S\_V)^∨⊗^■p\_1^\*A)≅Rp\_{2!}(S\_V⊗^Lp\_1^\*A), and Rp\_{2!}=Rp\_{2\*} on the proper support. FS states VII.4.1, VII.4.2 and VII.5.2 for the coefficient ring Z/n; Λ₀ is a finite free Z/ℓⁿ-algebra with Hom\_{Z/ℓⁿ}(Λ₀,Z/ℓⁿ)≅Λ₀ as Λ₀-modules, so it is self-injective, the solid dual over Λ₀ is the solid dual over Z/ℓⁿ of the underlying sheaf, and the three proofs apply with Λ₀-coefficients.

**API.**

- `heckeOperator` (constructor): For a finite set I and V∈Rep\_Λ((Ĝ⋊Q)^I): the functor T\_V: D\_■(Bun\_G,Λ)→D\_■(Bun\_G×(Div¹)^I,Λ), T\_V(A)=p\_{2♮}(p\_1^\*A⊗^■\_ΛS′\_V), and its restriction to D\_lis(Bun\_G,Λ).
- `heckeOperator.endo` (constructor): The endofunctor T̃\_V of D\_■(Bun\_G×(Div¹)^I,Λ), T̃\_V(B)=p\_{2♮}(h\_1^\*B⊗^■\_ΛS′\_V) with h\_1=(p\_1,legs); it satisfies T\_V(A)=T̃\_V(pr^\*A).
- `heckeOperator.linear` (structure): T\_V and T̃\_V are exact, Λ-linear and commute with all colimits; T̃\_V is D\_■((Div¹)^I,Λ)-linear: T̃\_V(B⊗^■pr\_2^\*M)≅T̃\_V(B)⊗^■pr\_2^\*M for M∈D\_■((Div¹)^I,Λ).
- `heckeOperator.map` (functoriality): V↦T\_V is a Λ-linear functor from Rep\_Λ((Ĝ⋊Q)^I) to functors D\_■(Bun\_G,Λ)→D\_■(Bun\_G×(Div¹)^I,Λ), with T\_{id}=id and T\_{g∘f}=T\_g∘T\_f; a short exact sequence of representations gives a cofibre sequence of functors, and T\_{V⊕W}=T\_V⊕T\_W.
- `heckeOperator.unit` (simp): T\_1(A)≅pr^\*A for the trivial representation 1, pr: Bun\_G×(Div¹)^I→Bun\_G.
- `heckeOperator.baseChange` (compatibility): For g: S→(Div¹)^I, (id×g)^\*T\_V(A)≅p\_{2,S♮}(p\_{1,S}^\*A⊗^■S′\_V|\_S) for the base change Hck^I\_G×\_{(Div¹)^I}S of the correspondence; similarly for T̃\_V.
- `heckeOperator.geometricFibre` (characterisation): For the diagonal geometric point Spd C→(Div¹)^I the base change of T̃\_V is an endofunctor of D\_■(Bun\_G×Spd C,Λ) that depends only on V|\_{Ĝ^I}; this defines T\_W on D\_■(Bun\_G×Spd C,Λ) for every W∈Rep\_Λ(Ĝ^I).
- `heckeOperator.weilTwist` (relation): For U∈Rep\_Λ(Q^I) with local system L\_U on (Div¹)^I: T\_{U⊗V}(A)≅T\_V(A)⊗^■\_Λpr\_2^\*L\_U; in particular T\_U(A)≅pr\_1^\*A⊗^■\_Λpr\_2^\*L\_U.
- `heckeOperator.torsion` (compatibility): For Λ₀=Z/ℓⁿ[√q], V∈Rep\_{Λ₀}((Ĝ⋊Q)^I) and A∈D\_ét(Bun\_G,Λ₀): T\_V(A)≅Rp\_{2!}(p\_1^\*A⊗^L\_{Λ₀}S\_V)=Rp\_{2\*}(p\_1^\*A⊗^L\_{Λ₀}S\_V) in D\_ét(Bun\_G×(Div¹)^I,Λ₀) (FS VII.5.2).
- `heckeOperator.bounded` (characterisation): If the weights of V|\_{Ĝ^I} are bounded by μ\_•, then T\_V(A)≅p\_{2,≤μ\_•♮}(p\_{1,≤μ\_•}^\*A⊗^■i^\*S′\_V) for the restrictions of p\_1, p\_2 to the closed bounded substack i: Hck^I\_{G,≤μ\_•}→Hck^I\_G.
- `heckeOperator.minuscule` (example): G split, I a singleton, μ minuscule with d=⟨2ρ,μ⟩, V the minuscule representation with S\_V=i\_{μ\*}Λ[d\](d/2), h=p\_2∘i\_μ, g=p\_1∘i\_μ: T\_V(A)≅h\_♮g^\*A[−d\](−d/2)≅Rh\_\*g^\*A[d\](d/2).
- `heckeOperator.torus` (example): G=T a split torus, I a singleton, χ∈X\_\*(T)=X^\*(T̂): T\_χ(A)=c\_χ^\*A, where c\_χ: Bun\_T×Div¹→Bun\_T sends (E\_2,D) to the unique T-bundle E\_1 of position χ relative to E\_2 at D (HS0/bounded-hecke-substacks); for T=G\_m and χ=n, E\_1=E\_2(−nD).

**Unit tests.**

- `heckeOperator.no_legs_test` (degenerate): For I=∅: (Div¹)^∅ is a point, Hck^∅\_G=Bun\_G with p\_1=p\_2=id, Rep\_Λ of the trivial group is the category of finite projective Λ-modules M, and T\_M(A)=A⊗\_ΛM, the direct summand of A^{⊕n} cut out by an idempotent n×n matrix over Λ with image M. In particular T\_Λ=id and T\_{Λ^n}(A)=A^{⊕n}.
- `heckeOperator.unit_test` (degenerate): For every finite set I and the trivial representation 1: T\_1(A)≅pr^\*A in D\_■(Bun\_G×(Div¹)^I,Λ), where pr: Bun\_G×(Div¹)^I→Bun\_G is the projection.
- `heckeOperator.minuscule_test` (computation): For G=PGL\_2, I a singleton and V the standard representation of Ĝ=SL\_2, let h=p\_2∘i\_μ: Hck\_{G,μ}→Bun\_G×Div¹ (proper, representable in spatial diamonds, cohomologically smooth of dimension 1, with fibres twisted forms of P¹) and g=p\_1∘i\_μ. Then T\_V(A)≅h\_♮g^\*A[−1\](−1/2)≅Rh\_\*g^\*A[1\](1/2), the second isomorphism by FS VII.3.5 with Rh^!Λ≅Λ[2\](1).
- `heckeOperator.torus_test` (computation): For G=G\_m, I a singleton and V\_n the character z↦zⁿ of Ĝ=G\_m: T\_{V\_n}(A)=c\_n^\*A for c\_n: Bun\_{G\_m}×Div¹→Bun\_{G\_m}, (L,D)↦L(−nD): the kernel is supported on the modifications of position n, for which L\_1=L\_2(−nD) (HS0/bounded-hecke-substacks). Hence T\_{V\_n} carries sheaves supported on line bundles of degree d to sheaves supported in degree d+n, that is, from Kottwitz invariant a to a−n; T̃\_{V\_n} is pullback along the automorphism (L,D)↦(L(−nD),D) of Bun\_{G\_m}×Div¹, so it is an equivalence with inverse T̃\_{V\_{−n}}, and T̃\_{V\_n}∘T̃\_{V\_m}≅T̃\_{V\_{n+m}}.
- `heckeOperator.weil_character_test` (computation): For U∈Rep\_Λ(Q^I) inflated to (Ĝ⋊Q)^I: T\_U(A)≅pr\_1^\*A⊗^■\_Λpr\_2^\*L\_U, i.e. A⊗\_ΛU with W\_E^I acting on U through W\_E^I→Q^I. If Λ is a field, I a singleton, U a nontrivial character of Q and A≠0, then T\_U(A) is not isomorphic to T\_1(A) in D\_■(Bun\_G×Div¹,Λ), although the two have isomorphic pullbacks to Bun\_G×Spd C.
- `heckeOperator.torsion_test` (compatibility): For Λ₀=Z/ℓⁿ[√q], V∈Rep\_{Λ₀}((Ĝ⋊Q)^I) and A∈D\_ét(Bun\_G,Λ₀): T\_V(A)≅Rp\_{2\*}(p\_1^\*A⊗^L\_{Λ₀}S\_V) in D\_ét(Bun\_G×(Div¹)^I,Λ₀), the Hecke operator of the introduction of FS Chapter IX.

**Uses.**

- HeckeStacksAndLocalShtukas:HS1/monoidality-of-hecke-operators: V↦T̃\_V is the monoidal functor of FS IX.2 p.321.
- HeckeStacksAndLocalShtukas:HS0/demazure-generators-of-ULA-kernels: FS IX.2.1 shows that the endofunctor at the diagonal geometric point preserves D\_lis.
- HeckeStacksAndLocalShtukas:HS1/continuous-weil-descent: FS IX.2.3 shows that T\_V(A) descends to Bun\_G×[\*/W\_E^I].
- HeckeStacksAndLocalShtukas:HS3/hecke-cohomology-comparison: Base change to a stratum identifies i\_b^\*T\_W(j\_♮c-Ind\_KΛ) with the relative homology f\_{K♮}S′\_W of the moduli of local shtukas (FS IX.3).
- FS Definition IX.0.4, p.319: Excursion operators are the composites A=T\_1(A)→T\_V(A)→T\_V(A)→T\_1(A)=A.

**Acceptance.**

- For the trivial representation, T\_1(A)≅pr^\*A, the pullback of A along X\_I→Bun\_G.
- For G=PGL\_2, I a singleton and V the standard representation of SL\_2: T\_V(A)≅h\_♮g^\*A[−1\](−1/2)≅Rh\_\*g^\*A[1\](1/2), h and g the restrictions of p\_2 and p\_1 to the minuscule stratum; the shift and twist are neither [−1\](−1/2) on Rh\_\* nor [1\](1/2) on h\_♮.
- For Λ₀=Z/ℓⁿ[√q] the functor agrees on D\_ét(Bun\_G,Λ₀) with A↦Rp\_{2\*}(p\_1^\*A⊗^LS\_V) of FS p.317.
- For I=∅ and M a finite projective Λ-module, T\_M(A)=A⊗\_ΛM.

**Prerequisites.**

- In this roadmap: `HS1/satake-kernel-and-solid-monoidal-functor`, `HS0/global-hecke-correspondence`, `HS0/descent-and-bounded-fibres`.
- In other roadmaps: `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `VStackSheavesAndLisseCategories:VS3/lisse-category-definition`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS2/torsion-solid-comparisons`, `VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality`.
- In the pinned libraries: `mathlib:CategoryTheory.Adjunction`.

**Sources.**

- Fargues–Scholze, IX.2, p. 321: The definition: source D\_lis(Bun\_G,Λ), target D\_■(Bun\_G×(Div¹)^I,Λ), formula p\_{2♮}(p\_1^\*A⊗S′\_V).
- Fargues–Scholze, IX.2, p. 321: The endofunctor form, linear over D\_■((Div¹)^I,Λ).
- Fargues–Scholze, VII.3.1, p. 257: The functor f\_♮ is the left adjoint of f^\*.
- Fargues–Scholze, IX.2, p. 322: The formula extends the torsion Hecke operators through FS VII.5.2.
- Fargues–Scholze, VII.5.2, p. 265: The comparison f\_♮(D(A)^∨⊗B)≅Rf\_!(A\_n⊗B) with its hypotheses.
- Fargues–Scholze, IX introduction, p. 317: The torsion Hecke operator A↦Rp\_{2\*}(p\_1^\*A⊗S\_V) with which the formula is compared.

### Hecke operators preserve D\_lis (FS Proposition IX.2.1)

`HS0/demazure-generators-of-ULA-kernels` · Theorem

**Theorem.** Let C be the completed algebraic closure of E and Spd C→(Div¹)^I the diagonal geometric point. For V∈Rep\_Λ(Ĝ^I) let T\_V be the endofunctor of D\_■(Bun\_G×Spd C,Λ) given by B↦h\_{2♮}(h\_1^\*B⊗^■\_ΛS′\_V), where Bun\_G×Spd C ←h\_1− Hck^I\_G×\_{(Div¹)^I}Spd C −h\_2→ Bun\_G×Spd C is the base change of the Hecke correspondence and S′\_V the restriction of the kernel. Then T\_V maps the full subcategory D\_lis(Bun\_G×Spd C,Λ) into itself. Since pullback D\_lis(Bun\_G,Λ)→D\_lis(Bun\_G×Spd C,Λ) is an equivalence (FS VII.7.3), T\_V restricts to an endofunctor T\_V: D\_lis(Bun\_G,Λ)→D\_lis(Bun\_G,Λ). For V∈Rep\_Λ((Ĝ⋊Q)^I) and A∈D\_lis(Bun\_G,Λ), the pullback of T\_V(A)∈D\_■(Bun\_G×(Div¹)^I,Λ) to Bun\_G×Spd C is T\_{V|Ĝ^I}(A).

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- ℓ≠p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root √q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ⊗\_{Z\_ℓ,disc}Λ (FS VII.6). No condition on ℓ beyond ℓ≠p is imposed.
- Q is a finite quotient of W\_E through which the action of W\_E on the pinned dual group Ĝ factors. For a flat affine group scheme H over Z\_ℓ, Rep\_Λ(H) is the exact category of algebraic representations of H on finite projective Λ-modules.

**Proof outline.**

1. Reduction to one leg (FS p.322). By highest weight theory V may be replaced by exterior tensor products ⊠\_{i∈I}V\_i with V\_i∈Rep\_Λ(Ĝ) (the requested extension ReductiveGroupsIntegralRepresentationsPartII; D\_lis is closed under cones, shifts and direct sums, and V↦T\_V is exact). By the monoidality node T\_{⊠V\_i} is the composite of the operators T\_{V\_i}, so one may take I a singleton and write Bun\_{G,C} ←h\_1− Hck\_{G,C} −h\_2→ Bun\_{G,C}.
2. Enlarging the class of kernels. Let q: Hck\_{G,C}→𝓗ck\_{G,Spd C/Div¹\_X} be the map to the local Hecke stack. It suffices that h\_{2♮}(h\_1^\*A⊗^■q^\*B^∨)∈D\_lis(Bun\_{G,C},Λ) for all A∈D\_lis and all B∈D^ULA(𝓗ck\_{G,Spd C/Div¹\_X},Z\_ℓ): the kernels D(S\_W)^∨ are of this form because Verdier duality preserves D^ULA (FS VI.6.6).
3. Demazure generation (an input from stage GS1 of GeometricSatakeAndFusion). The kernels B^∨ lie in the smallest full stable subcategory of D\_■ closed under colimits (so under shifts in both directions, cones, retracts and direct sums) that contains (Rf\_{ẇ\*}Z\_ℓ)^∨ for the Demazure resolutions f\_ẇ: L⁺𝓘\\Dem\_ẇ→𝓗ck\_{G,Spd C/Div¹\_X} of Schubert varieties in the affine flag variety, taken modulo the Iwahori group. The functor K↦h\_{2♮}(h\_1^\*A⊗^■q^\*K) commutes with colimits and D\_lis is closed under colimits, so it suffices to treat these generators.
4. Demazure kernels. f\_ẇ is proper, representable in spatial diamonds and of finite dim.trg, so (Rf\_{ẇ\*}Z\_ℓ)^∨≅f\_{ẇ♮}Z\_ℓ by FS VII.4.3 in its ℓ-adic form of FS VII.5. By base change and the projection formula for ♮ (FS VII.3.1), h\_{2♮}(h\_1^\*A⊗^■q^\*f\_{ẇ♮}Λ)≅g\_{2♮}g\_1^\*A for the correspondence Bun\_{G,C} ←g\_1− Z\_ẇ −g\_2→ Bun\_{G,C} with Z\_ẇ=Hck\_{G,C}×\_{𝓗ck}[L⁺𝓘\\Dem\_ẇ].
5. The correspondence Z\_ẇ is proper and cohomologically smooth over both factors (its fibres are fibrations in Demazure varieties over a flag variety). g\_1^\* preserves D\_lis (FS VII.6.2). For every separated ℓ-cohomologically smooth f: Y→Z\_ẇ representable in locally spatial diamonds, g\_{2♮}f\_♮Λ=(g\_2f)\_♮Λ is one of the generators of D\_lis(Bun\_{G,C},Λ) (FS VII.6.1); g\_{2♮} commutes with direct sums and cones, hence maps D\_lis(Z\_ẇ,Λ) into D\_lis(Bun\_{G,C},Λ).

**Acceptance.**

- For V=1, T\_1=id preserves D\_lis.
- For G=T a torus and V=χ a character of T̂, T\_χ is pullback along an automorphism of Bun\_T×Spd C, which preserves D\_lis.
- For G=PGL\_2 and V the standard representation of SL\_2: T\_V(A)=h\_♮g^\*A[−1\](−1/2) with h proper and cohomologically smooth (a fibration in twisted forms of P¹) and g cohomologically smooth; for a generator f\_♮Λ of D\_lis, T\_V(f\_♮Λ)=(h∘f′)\_♮Λ[−1\](−1/2) with f′ the base change of f along g, and h∘f′ is separated, representable in locally spatial diamonds and ℓ-cohomologically smooth.

**Prerequisites.**

- In this roadmap: `HS1/hecke-operator-via-relative-homology`, `HS1/monoidality-of-hecke-operators`.
- In other roadmaps: `GeometricSatakeAndFusion:GS1`, `VStackSheavesAndLisseCategories:VS3/lisse-category-definition`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS2/torsion-solid-comparisons`, `VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality`, `VStackSheavesAndLisseCategories:VS4/hn-localization-and-geometric-invariance`, `GeometricSatakeAndFusion:GS1/ula-constant-term-criterion`, `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`.

**Sources.**

- Fargues–Scholze, Proposition IX.2.1, p. 322: The statement.
- Fargues–Scholze, Proposition IX.2.1, proof, p. 322: Generation of the universally locally acyclic kernels by Demazure pushforwards, as asserted in the proof.
- Fargues–Scholze, Proposition IX.2.1, proof, p. 322: Reduction to the push-pull correspondence of a Demazure resolution, which is proper and cohomologically smooth.
- Fargues–Scholze, Proposition VII.4.3, p. 263: Proper pushforward followed by the solid dual is relative homology of the solid dual, with its hypotheses on f and A.
- Fargues–Scholze, Proposition VII.7.3, p. 273: D\_lis(Bun\_G,Λ)≃D\_lis(Bun\_G×Spd C,Λ), used to state the restriction to D\_lis(Bun\_G,Λ).

### Adjoints and compactness of Hecke operators

`HS1/properties-and-weil-equivariance` · Theorem · planet: **Hecke operators preserve compact objects**

**Theorem.** Let V∈Rep\_Λ(Ĝ^I) with contragredient representation V^∨, and let T\_V be the endofunctor of D\_lis(Bun\_G,Λ) obtained at the diagonal geometric point (FS IX.2.1). Then T\_{V^∨} is both left and right adjoint to T\_V. The units and counits are the images, under the monoidal functor W↦T\_W, of the coevaluations 1→V⊗V^∨, 1→V^∨⊗V and the evaluations V^∨⊗V→1, V⊗V^∨→1. Consequently T\_V commutes with all limits and all colimits and preserves compact objects of D\_lis(Bun\_G,Λ). The same holds for V∈Rep\_Λ((Ĝ⋊Q)^I) after forgetting the W\_E^I-action, with V|\_{Ĝ^I} in place of V (FS IX.0.1(i)).

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- ℓ≠p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root √q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ⊗\_{Z\_ℓ,disc}Λ (FS VII.6). No condition on ℓ beyond ℓ≠p is imposed.
- Q is a finite quotient of W\_E through which the action of W\_E on the pinned dual group Ĝ factors. For a flat affine group scheme H over Z\_ℓ, Rep\_Λ(H) is the exact category of algebraic representations of H on finite projective Λ-modules.
- C is the completed algebraic closure of E and Spd C→(Div¹)^I is the diagonal geometric point; D\_lis(Bun\_G,Λ) is identified with D\_lis(Bun\_G×Spd C,Λ) by pullback (FS VII.7.3).

**Proof outline.**

1. W↦T\_W is a monoidal functor from Rep\_Λ(Ĝ^I) to the endofunctors of D\_lis(Bun\_G,Λ): the monoidality node restricted to the diagonal geometric point, together with FS IX.2.1 for the preservation of D\_lis.
2. Every V∈Rep\_Λ(Ĝ^I) is finite projective over Λ, hence dualizable with dual V^∨, and Rep\_Λ(Ĝ^I) is symmetric monoidal, so V^∨ is a left and a right dual. A monoidal functor carries the triangle identities of the dual pairs (V,V^∨) and (V^∨,V) to the triangle identities of adjunctions T\_{V^∨}⊣T\_V and T\_V⊣T\_{V^∨} (FS p.323).
3. A functor with a left adjoint preserves limits and one with a right adjoint preserves colimits. The right adjoint T\_{V^∨} of T\_V preserves colimits, so T\_V preserves compact objects.

**Acceptance.**

- For V=1, T\_1=id and both adjunctions are the identity adjunction.
- For K⊂G(E) open pro-p and j: Bun\_G^1=[\*/G(E)]→Bun\_G the open immersion, T\_V(j\_♮c-Ind\_K^{G(E)}Λ) is compact in D\_lis(Bun\_G,Λ); equivalently B↦(j^\*T\_{V^∨}B)^K commutes with direct sums.
- For G=T a split torus and V=χ a character of T̂: T\_χ is an equivalence with inverse T\_{χ^{−1}}=T\_{χ^∨}, which is its left and right adjoint.
- The adjoint of T\_V is T\_{V^∨} for the contragredient V^∨; the involution sw^\* enters only the duality isomorphisms of FS IX.2.2. For a torus, T\_{χ^∨}=T\_{χ^{−1}} whereas T\_{sw^\*χ^∨}=T\_χ.

**Prerequisites.**

- In this roadmap: `HS0/demazure-generators-of-ULA-kernels`, `HS1/monoidality-of-hecke-operators`.
- In other roadmaps: `EnhancedDerivedSheaves:E5:presentability/compact-objects`.
- In the pinned libraries: `mathlib:CategoryTheory.ExactPairing`, `mathlib:CategoryTheory.Adjunction`.

**Sources.**

- Fargues–Scholze, Theorem IX.2.2, p. 322: Statement: limits, colimits and compact objects are preserved, for every V∈Rep\_Λ(Ĝ^I).
- Fargues–Scholze, Theorem IX.2.2, proof, p. 323: Both adjoints are T\_{V^∨}, from dualizability and monoidality.
- Fargues–Scholze, Theorem IX.0.1(i), p. 318: The same statement for V∈Rep\_Λ((Ĝ⋊Q)^I) after forgetting the Weil action.

### Hecke preservation of lisse ULA objects

`HS1/ula-preservation` · Theorem

**Theorem.** Let V∈Rep\_Λ(Ĝ^I) and let A∈D\_lis(Bun\_G,Λ) be universally locally acyclic in the sense of FS Definition VII.7.8: the natural map p\_1^\*RHom\_lis(A,Λ)⊗^■\_Λp\_2^\*A→RHom\_lis(p\_1^\*A,p\_2^\*A) on Bun\_G×Bun\_G is an isomorphism. Then T\_V(A) is universally locally acyclic. The proof uses the criterion: A is universally locally acyclic if and only if RHom(B,A)∈D(Λ) is a perfect complex for every compact B∈D\_lis(Bun\_G,Λ), if and only if for every b∈B(G) and every open pro-p subgroup K⊂G\_b(E) the K-invariants M\_b^K of the complex M\_b of smooth G\_b(E)-representations corresponding to i^{b\*}A form a perfect complex of Λ-modules (FS VII.7.9, where M^K is printed for M\_b^K).

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- ℓ≠p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root √q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ⊗\_{Z\_ℓ,disc}Λ (FS VII.6). No condition on ℓ beyond ℓ≠p is imposed.
- Q is a finite quotient of W\_E through which the action of W\_E on the pinned dual group Ĝ factors. For a flat affine group scheme H over Z\_ℓ, Rep\_Λ(H) is the exact category of algebraic representations of H on finite projective Λ-modules.
- C is the completed algebraic closure of E and Spd C→(Div¹)^I is the diagonal geometric point; D\_lis(Bun\_G,Λ) is identified with D\_lis(Bun\_G×Spd C,Λ) by pullback (FS VII.7.3).

**Proof outline.**

1. Criterion (an input from stage VS5 of VStackSheavesAndLisseCategories). FS VII.7.9 states the stratumwise form; its proof is that of FS V.7.1 and uses FS VII.7.10, in which the exterior product A\_1⊠A\_2 lies in D\_lis(Bun\_G,Λ). That proof (FS p.184) shows that A is universally locally acyclic iff π\_♮(A\_1⊗^■A) is perfect for all compact A\_1; since RHom(D\_BZ(A\_1),A)≅π\_♮(A\_1⊗^■A) and D\_BZ is an autoequivalence of the compact objects (FS VII.7.6), this is the condition that RHom(B,A) is perfect for all compact B. For the compact generators A^b\_K=f\_{K♮}Λ=π\_{b♮}q\_b^\*c-Ind\_K^{G\_b(E)}Λ (FS VII.7.4, VII.7.2) one has RHom(A^b\_K,A)=(i^{b\*}A)^K, which gives the stratumwise form.
2. Adjunction: RHom(B,T\_V(A))≅RHom(T\_{V^∨}(B),A), because T\_{V^∨} is left adjoint to T\_V (adjunction node).
3. T\_{V^∨}(B) is compact for compact B (same node), so RHom(T\_{V^∨}(B),A) is perfect; by the criterion T\_V(A) is universally locally acyclic.

**Acceptance.**

- For G=T a split torus and V=χ: every b∈B(T) is basic with Bun\_T^b=[\*/T(E)], A is universally locally acyclic iff each i^{b\*}A has perfect K-invariants for all open pro-p K⊂T(E), and (i^{b′\*}T\_χA)^K≅(i^{b\*}A)^K, where b′ is the component to which T\_χ moves the component b; so T\_χ preserves the condition.
- For G=G\_m and a smooth character ψ of E^× placed on one component: its K-invariants are the direct summand eΛ of Λ cut out by the idempotent e that averages ψ over the finite p-group ψ(K) (so Λ or 0 when Spec Λ is connected); this is a perfect complex, so ψ is universally locally acyclic, and so is T\_{V\_n}(ψ).
- Compact objects need not be universally locally acyclic: for G=G\_m and K⊂E^× open pro-p, A=j\_♮c-Ind\_K^{E^×}Λ is compact and (j^\*A)^K=Λ[E^×/K] is a free Λ-module of infinite rank, hence not perfect.

**Prerequisites.**

- In this roadmap: `HS1/properties-and-weil-equivariance`.
- In other roadmaps: `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`, `VStackSheavesAndLisseCategories:VS5/lisse-ula-definition`, `VStackSheavesAndLisseCategories:VS5/lisse-ula-equals-admissibility`, `VStackSheavesAndLisseCategories:VS5/lisse-bernstein-zelevinsky-duality`, `VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint`, `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`.

**Sources.**

- Fargues–Scholze, Theorem IX.2.2, proof, p. 323: The criterion against compact objects, as the proof quotes it.
- Fargues–Scholze, Theorem IX.2.2, proof, p. 323: Preservation follows by adjointness from the preservation of compact objects.
- Fargues–Scholze, Proposition VII.7.9, p. 275: The stratumwise criterion; the printed statement continues with M^K, to be read M\_b^K.
- Fargues–Scholze, Definition VII.7.8, p. 275: Universal local acyclicity for objects of D\_lis(Bun\_G,Λ).
- Fargues–Scholze, Theorem V.7.1, proof, p. 184: The step of the proof of V.7.1 (quoted for VII.7.9) giving the criterion in terms of π\_♮(A\_1⊗A).

### Hecke exchange with BZ and lisse duality

`HS1/duality-exchange` · Theorem

**Theorem.** Let V∈Rep\_Λ(Ĝ^I), let π: Bun\_G→\* be the projection and π\_♮: D\_lis(Bun\_G,Λ)→D\_lis(\*,Λ)≅D(Λ) the left adjoint of π^\*, and let sw^\* be the automorphism of Rep\_Λ(Ĝ^I) that corresponds, under the Satake equivalence, to pullback along the involution of the Hecke stack exchanging the two bundles; by FS VI.12.1 it is induced on each factor by the Chevalley involution of Ĝ composed with conjugation by ρ̂(−1)∈Ĝ\_ad. (a) For A,B∈D\_lis(Bun\_G,Λ) there is a natural isomorphism π\_♮(T\_V(A)⊗^■\_ΛB)≅π\_♮(A⊗^■\_ΛT\_{sw^\*V}(B)). (b) For every compact A∈D\_lis(Bun\_G,Λ): D\_BZ(T\_V(A))≅T\_{sw^\*V^∨}(D\_BZ(A)), where D\_BZ is the Bernstein–Zelevinsky duality of FS VII.7.6, defined on compact objects by RHom(D\_BZ(A),B)≅π\_♮(A⊗^■\_ΛB). (c) For every A∈D\_lis(Bun\_G,Λ): RHom\_lis(T\_V(A),Λ)≅T\_{sw^\*V^∨}(RHom\_lis(A,Λ)). The isomorphisms are natural in A and in V.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- ℓ≠p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root √q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ⊗\_{Z\_ℓ,disc}Λ (FS VII.6). No condition on ℓ beyond ℓ≠p is imposed.
- Q is a finite quotient of W\_E through which the action of W\_E on the pinned dual group Ĝ factors. For a flat affine group scheme H over Z\_ℓ, Rep\_Λ(H) is the exact category of algebraic representations of H on finite projective Λ-modules.
- C is the completed algebraic closure of E and Spd C→(Div¹)^I is the diagonal geometric point; D\_lis(Bun\_G,Λ) is identified with D\_lis(Bun\_G×Spd C,Λ) by pullback (FS VII.7.3).

**Proof outline.**

1. (a) By the projection formula for h\_{2♮} (FS VII.3.1(i)), π\_♮(T\_V(A)⊗^■B) is the homology of Hck^I\_G×\_{(Div¹)^I}Spd C with coefficients h\_1^\*A⊗^■h\_2^\*B⊗^■S′\_V. The involution sw exchanges h\_1 and h\_2, and sw^\*S′\_V≅S′\_{sw^\*V} (kernel node; FS VI.12.1), so the same homology computes π\_♮(A⊗^■T\_{sw^\*V}(B)) (FS p.323).
2. (b) T\_V(A) is compact, so D\_BZ(T\_V(A)) is defined. For B∈D\_lis(Bun\_G,Λ): RHom(D\_BZ(T\_VA),B)≅π\_♮(T\_VA⊗^■B)≅π\_♮(A⊗^■T\_{sw^\*V}B)≅RHom(D\_BZ(A),T\_{sw^\*V}B)≅RHom(T\_{sw^\*V^∨}D\_BZ(A),B), the last step because T\_{sw^\*V^∨} is left adjoint to T\_{sw^\*V} (adjunction node, with (sw^\*V)^∨=sw^\*(V^∨)). Conclude by the Yoneda lemma.
3. (c) RHom\_lis(A,Λ) is characterised by RHom(B,RHom\_lis(A,Λ))≅RHom(B⊗^■A,π^\*Λ)≅RHom(π\_♮(A⊗^■B),Λ) (FS VII.6.3 and π\_♮⊣π^\*). Hence RHom(B,RHom\_lis(T\_VA,Λ))≅RHom(π\_♮(A⊗^■T\_{sw^\*V}B),Λ)≅RHom(T\_{sw^\*V}B,RHom\_lis(A,Λ))≅RHom(B,T\_{sw^\*V^∨}RHom\_lis(A,Λ)), the last step because T\_{sw^\*V^∨} is right adjoint to T\_{sw^\*V}.

**Acceptance.**

- For V=1 all three isomorphisms are identities.
- For G=T a torus and V=χ a character of T̂: sw^\* is inversion on T̂, so sw^\*χ=χ^{−1} and sw^\*χ^∨=χ, and D\_BZ(T\_χA)≅T\_χ(D\_BZA). This is consistent with D\_BZ preserving each open and closed component of Bun\_T while T\_χ translates the components by a fixed element; for A≠0 supported on one component, T\_{χ^∨}(D\_BZA) lies on a different component from D\_BZ(T\_χA) when the class of χ in B(T) is not 2-torsion.
- For G=T a torus, (a) reads π\_♮(T\_χA⊗^■B)≅π\_♮(A⊗^■T\_{χ^{−1}}B); for A and B each supported on one component of Bun\_T, both sides vanish unless the component of B is the translate of the component of A by which T\_χ moves supports.
- For G=PGL\_2 and V the standard representation of Ĝ=SL\_2: the pinned Chevalley involution of SL\_2 is the identity, because −w\_0 acts trivially on its root datum (FS VI.12, pp. 239–240), so sw^\* is conjugation by ρ̂(−1), the image of diag(−1,1) in PGL\_2: (a b; c d)↦(a −b; −c d). It fixes the diagonal torus pointwise and acts by −1 on the two root spaces. Being the restriction of an inner automorphism of GL\_2, it satisfies sw^\*V≅V (through e\_1↦−e\_1, e\_2↦e\_2), and V≅V^∨ by the determinant pairing; hence sw^\*V^∨≅V and D\_BZ∘T\_V≅T\_V∘D\_BZ on compact objects.
- D\_BZ is defined only on compact objects, and (b) is asserted only for compact A.

**Prerequisites.**

- In this roadmap: `HS1/properties-and-weil-equivariance`, `HS1/satake-kernel-and-solid-monoidal-functor`, `HS1/hecke-operator-via-relative-homology`.
- In other roadmaps: `GeometricSatakeAndFusion:GS4:integral-dual-group/chevalley-involution`, `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `VStackSheavesAndLisseCategories:VS3/lisse-category-definition`, `VStackSheavesAndLisseCategories:VS5/lisse-bernstein-zelevinsky-duality`, `VStackSheavesAndLisseCategories:VS3/lisse-adjoints-and-operations`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`.

**Sources.**

- Fargues–Scholze, Theorem IX.2.2, p. 322: The two duality isomorphisms, with T\_{sw^\*V^∨}.
- Fargues–Scholze, Theorem IX.2.2, proof, p. 323: The pairing identity (a) from which both follow.
- Fargues–Scholze, Proposition VII.7.6, p. 274: Bernstein–Zelevinsky duality on compact objects of D\_lis(Bun\_G,Λ) and its defining property.
- Fargues–Scholze, Proposition VI.12.1, p. 239: sw^\* is the Chevalley involution up to conjugation by ρ̂(−1).

### Condensed structure on D\_lis(Bun\_G,Λ) and W\_E^I-equivariant objects

`HS1/condensed-enrichment` · Construction · planet: **Condensed structure on D\_lis(Bun\_G)**

**Construction.** The condensed ∞-category D\_■(Bun\_G,Λ) sends a profinite set S to D\_■(Bun\_G×S,Λ); it is a hypersheaf in S by v-hyperdescent of D\_■. Its full condensed subcategory D\_lis(Bun\_G,Λ) sends an extremally disconnected profinite set S to D\_lis(Bun\_G×S,Λ). Only the resulting enrichment in condensed anima is used: for objects A, B the condensed anima Hom(A,B) has S-points Hom\_{D\_■(Bun\_G×S,Λ)}(A|\_S,B|\_S), and it is a condensed animated Λ-module. For a finite set I, D\_■(Bun\_G,Λ)^{BW\_E^I} is the evaluation on the condensed anima BW\_E^I: the ∞-category of objects A∈D\_■(Bun\_G,Λ) with a map of condensed animated groups W\_E^I→Aut(A). By descent, D\_■(Bun\_G×[\*/W\_E^I],Λ)≃D\_■(Bun\_G,Λ)^{BW\_E^I}. (FS IX.1.1) Pullback along Bun\_G×(Div¹)^I→Bun\_G×[\*/W\_E^I] induces fully faithful functors D\_lis(Bun\_G,Λ)^{BW\_E^I}→D\_■(Bun\_G,Λ)^{BW\_E^I}≃D\_■(Bun\_G×[\*/W\_E^I],Λ)→D\_■(Bun\_G×(Div¹)^I,Λ), and the essential image of the first consists of the objects of D\_■(Bun\_G×[\*/W\_E^I],Λ) whose pullback to Bun\_G lies in D\_lis(Bun\_G,Λ). (FS IX.1.2) For A∈D\_lis(Bun\_G,Λ) compact and B∈D\_lis(Bun\_G,Λ) arbitrary, the condensed animated Λ-module Hom(A,B) is relatively discrete over Z\_ℓ, i.e. Hom(A,B)≅Hom(A,B)(\*)⊗\_{Z\_ℓ,disc}Z\_ℓ. Hence on the compact objects D\_lis(Bun\_G,Λ)^ω the condensed structure is the relatively discrete one, determined by the Λ-linear stable ∞-category.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- ℓ≠p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root √q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ⊗\_{Z\_ℓ,disc}Λ (FS VII.6). No condition on ℓ beyond ℓ≠p is imposed.

**Construction.**

1. Hypersheaf and enrichment. D\_■(−,Λ) satisfies v-hyperdescent, because D((−)\_v,Λ) does and solidity can be checked v-locally (FS VII.1.8, proof of VII.2.2); so S↦D\_■(Bun\_G×S,Λ) is a hypersheaf on profinite sets and the S-points of the mapping anima define the enrichment. D\_lis is stable under pullback in S (FS VII.6.2).
2. Equivariant objects. [\*/W\_E^I] is the geometric realisation of the Čech nerve of \*→[\*/W\_E^I], whose terms are the powers (W\_E^I)^n, disjoint unions of profinite sets. Descent along Bun\_G→Bun\_G×[\*/W\_E^I] identifies D\_■(Bun\_G×[\*/W\_E^I],Λ) with the limit of the categories D\_■(Bun\_G×(W\_E^I)^n,Λ), which is the evaluation on BW\_E^I (FS p.320).
3. FS IX.1.1. Pullback to Bun\_G×(Div¹)^I is fully faithful on D\_■ by FS VII.2.8. An equivariant object whose underlying object A\_0 is lisse has n-th term the pullback of A\_0 to Bun\_G×(W\_E^I)^n, which is lisse on every extremally disconnected set mapping to (W\_E^I)^n; this gives the essential image.
4. FS IX.1.2. One may take A=f\_{K♮}Λ for the charts f\_K: M̃\_b/K→Bun\_G, b∈B(G), K⊂G\_b(E) open pro-p, as these generate (FS VII.7.4). By adjunction Hom(A,B)=RΓ(M̃\_b/K,f\_K^\*B). For B′∈D\_lis(M̃\_b/K,Λ) the restriction RΓ(M̃\_b/K,B′)→RΓ([\*/K],B′) to the base point is an isomorphism of condensed objects, by the proof of FS VII.7.2, which applies with condensed structure because FS VII.2.10 does. RΓ([\*/K],B′) is a direct summand of the stalk of B′ at the base point (K is pro-p), and stalks of objects of D\_lis(\*,Λ)≅D(Λ) are relatively discrete (FS VII.6.5).

**API.**

- `condensedStructure` (data): For a profinite set S the ∞-category D\_■(Bun\_G×S,Λ); for S extremally disconnected its full subcategory D\_lis(Bun\_G×S,Λ).
- `condensedStructure.pullback` (functoriality): For g: S′→S the pullback functor (id×g)^\*, with (id×id)^\*=id and (id×(g∘g′))^\*≅(id×g′)^\*∘(id×g)^\*; it preserves D\_lis, and S↦D\_■(Bun\_G×S,Λ) is a hypersheaf.
- `condensedStructure.point` (simp): The evaluation at S=\* is D\_■(Bun\_G,Λ), respectively D\_lis(Bun\_G,Λ).
- `condensedStructure.hom` (data): The condensed mapping anima Hom(A,B): S↦Hom\_{D\_■(Bun\_G×S,Λ)}(A|\_S,B|\_S), a condensed animated Λ-module, with composition Hom(B,C)×Hom(A,B)→Hom(A,C) and Hom(A,B)(\*) the mapping anima of D\_■(Bun\_G,Λ).
- `condensedStructure.equivariant` (data): For a finite set I the ∞-category D^{BW\_E^I} of objects A with a map of condensed animated groups W\_E^I→Aut(A); the forgetful functor to D is conservative and preserves limits and colimits.
- `condensedStructure.trivialAction` (constructor): Pullback along Bun\_G×[\*/W\_E^I]→Bun\_G is the functor D→D^{BW\_E^I} equipping A with the trivial action; its composite with the forgetful functor is the identity.
- `condensedStructure.classifyingStack` (equivalence): D\_■(Bun\_G×[\*/W\_E^I],Λ)≃D\_■(Bun\_G,Λ)^{BW\_E^I}, compatibly with pullback along Bun\_G→Bun\_G×[\*/W\_E^I] and the forgetful functor.
- `condensedStructure.lisse_equivariant` (characterisation): FS IX.1.1: D\_lis(Bun\_G,Λ)^{BW\_E^I}→D\_■(Bun\_G×[\*/W\_E^I],Λ)→D\_■(Bun\_G×(Div¹)^I,Λ) are fully faithful, and an object of D\_■(Bun\_G×[\*/W\_E^I],Λ) lies in D\_lis(Bun\_G,Λ)^{BW\_E^I} iff its pullback to Bun\_G lies in D\_lis(Bun\_G,Λ).
- `condensedStructure.hom_relativelyDiscrete` (characterisation): FS IX.1.2: for A∈D\_lis(Bun\_G,Λ)^ω and B∈D\_lis(Bun\_G,Λ), Hom(A,B)≅Hom(A,B)(\*)⊗\_{Z\_ℓ,disc}Z\_ℓ as condensed animated Λ-modules.
- `condensedStructure.compact` (compatibility): For A compact, B lisse and S extremally disconnected profinite: Hom(A,B)(S)≅Hom(A,B)(\*)⊗^L\_{Z\_ℓ}C(S,Z\_ℓ), C(S,Z\_ℓ) the ring of continuous functions S→Z\_ℓ. So on D\_lis(Bun\_G,Λ)^ω the condensed structure is determined by the Λ-linear stable ∞-category.
- `condensedStructure.representations` (example): For G=1: D\_lis(\*,Λ)=D(Λ), and for a finite projective Λ-module M in degree 0 a W\_E-equivariant structure on M is a homomorphism W\_E→Aut\_Λ(M) whose restriction to every profinite subset factors continuously through a finitely generated Z\_ℓ-submodule of End\_Λ(M) with its ℓ-adic topology.

**Unit tests.**

- `condensedStructure.point_test` (degenerate): The evaluation at S=\* is D\_lis(Bun\_G,Λ) with its mapping anima; the evaluation at the two-point set is D\_lis(Bun\_G,Λ)×D\_lis(Bun\_G,Λ); and for I=∅ the category D\_lis(Bun\_G,Λ)^{BW\_E^∅} is D\_lis(Bun\_G,Λ).
- `condensedStructure.continuous_functions_test` (computation): For G=1, Λ=Z\_ℓ[√q] (a finite free Z\_ℓ-module) and A=B=Λ∈D\_lis(\*,Λ)=D(Λ): for S extremally disconnected profinite, Hom(A,B)(S) is concentrated in degree 0 and equals C(S,Λ)=C(S,Z\_ℓ)⊗\_{Z\_ℓ}Λ, the continuous functions for the ℓ-adic topology. For S infinite this is strictly larger than the module of locally constant functions S→Λ.
- `condensedStructure.hecke_algebra_test` (computation): For K⊂G(E) open pro-p, j: [\*/G(E)]→Bun\_G the open immersion and A=j\_♮c-Ind\_K^{G(E)}Λ: Hom(A,A) is concentrated in degree 0 and Hom(A,A)(S)=Λ[K\\G(E)/K]⊗\_{Z\_ℓ}C(S,Z\_ℓ) for S extremally disconnected profinite. If Λ is killed by a power of ℓ this is the module of locally constant functions S→Λ[K\\G(E)/K].
- `condensedStructure.continuous_representation_test` (characterisation): For G=1, Λ=Z\_ℓ[√q] and M a finite free Λ-module in degree 0, the W\_E-equivariant structures on M∈D\_lis(\*,Λ) are exactly the Λ-linear actions W\_E→GL\_Λ(M) continuous for the ℓ-adic topology of M. In particular the base change to Λ of the Kummer extension of Z\_ℓ by Z\_ℓ(1) attached to a uniformizer of E, on which the inertia group acts through its tame ℓ-adic quotient by unipotent matrices of infinite order, is an equivariant object although no open subgroup of the inertia group acts trivially on it.

**Uses.**

- HeckeStacksAndLocalShtukas:HS1/continuous-weil-descent: D\_lis(Bun\_G,Λ)^{BW\_E^I} is the target of the Hecke operators, and FS IX.1.1 is the criterion applied in FS IX.2.3.
- HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality: FS IX.2.4 uses the relatively discrete condensed structure on D\_lis(Bun\_G,Λ)^ω to form End\_Λ(D\_lis(Bun\_G,Λ)^ω)^{BW\_E^I}.
- HeckeStacksAndLocalShtukas:HS4/continuous-tensor-generator-export: The continuous W\_E^I-equivariant Hecke family is exported with this condensed structure.
- FS Definition IX.0.4, p.319: Schur-irreducibility End(A)=L is a condition on condensed algebras.

**Acceptance.**

- At S=\* the evaluation is D\_lis(Bun\_G,Λ) and Hom(A,B)(\*) is the mapping anima.
- On a disjoint union S\_1⊔S\_2 the evaluation is the product of the evaluations at S\_1 and S\_2.
- For K⊂G(E) open pro-p and A=j\_♮c-Ind\_K^{G(E)}Λ: End(A)=Λ[K\\G(E)/K]⊗\_{Z\_ℓ,disc}Z\_ℓ, concentrated in degree 0.
- For G=1, Λ=Z\_ℓ[√q] and M a finite free Λ-module in degree 0, a W\_E-equivariant structure on M∈D\_lis(\*,Λ) is a Λ-linear action W\_E→GL\_Λ(M) continuous for the ℓ-adic topology of M.

**Prerequisites.**

- In other roadmaps: `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `VStackSheavesAndLisseCategories:VS3/lisse-category-definition`, `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `VStackSheavesAndLisseCategories:VS4`, `EnhancedDerivedSheaves:E5:presentability/coherent-group-actions`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `VStackSheavesAndLisseCategories:VS3/lisse-comparisons`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS2/solid-geometric-base-change-and-drinfeld`, `VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint`, `VStackSheavesAndLisseCategories:VS2/solid-partial-supported-vanishing`.
- In the pinned libraries: `mathlib:Condensed`, `mathlib:CondensedMod`.

**Sources.**

- Fargues–Scholze, IX.1, p. 320: The condensed structure on D\_lis and on D\_■.
- Fargues–Scholze, IX.1, p. 320: Equivariant objects as objects with a map of condensed animated groups W\_E^I→Aut(A).
- Fargues–Scholze, IX.1, p. 320: Only the enrichment in condensed anima is needed.
- Fargues–Scholze, Proposition IX.1.1, p. 320: The essential image of D\_lis(Bun\_G,Λ)^{BW\_E^I}.
- Fargues–Scholze, Proposition IX.1.2, p. 320: Relative discreteness of Hom(A,B) for A compact.
- Fargues–Scholze, Proposition IX.1.2, proof, p. 320: The step of the proof that reduces to the base point of the chart.

### Hecke operators are W\_E^I-equivariant (FS Corollary IX.2.3)

`HS1/continuous-weil-descent` · Theorem · planet: **W\_E^I-equivariant Hecke operators**

**Theorem.** For every finite set I and V∈Rep\_Λ((Ĝ⋊Q)^I), the Hecke operator T\_V: D\_lis(Bun\_G,Λ)→D\_■(Bun\_G×(Div¹)^I,Λ) takes values in the full subcategory D\_■(Bun\_G×[\*/W\_E^I],Λ), embedded by pullback along Bun\_G×(Div¹)^I→Bun\_G×[\*/W\_E^I]; moreover the pullback to Bun\_G of every T\_V(A) lies in D\_lis(Bun\_G,Λ). Hence, by FS IX.1.1, T\_V induces a functor T\_V: D\_lis(Bun\_G,Λ)→D\_lis(Bun\_G,Λ)^{BW\_E^I} to the W\_E^I-equivariant objects for the condensed structure; its composite with the forgetful functor is the endofunctor T\_{V|Ĝ^I} of FS IX.2.1. For compact A the object T\_V(A) is compact (FS IX.2.2), so its endomorphisms are relatively discrete over Z\_ℓ (FS IX.1.2), and the action is a map of condensed groups from W\_E^I to the automorphisms of T\_V(A) with this relatively discrete structure. Scope of the input of Drinfeld type: pullback along X×(Div¹)^I→X×[\*/W\_E^I] is fully faithful on D\_■ for every small v-stack X (FS VII.2.8; for étale sheaves with Λ killed by an integer prime to p, FS IV.7.2) but is not essentially surjective in general; the equivalence of FS IV.7.3 holds only on the objects that are v-locally constant with perfect fibres.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- ℓ≠p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root √q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ⊗\_{Z\_ℓ,disc}Λ (FS VII.6). No condition on ℓ beyond ℓ≠p is imposed.
- Q is a finite quotient of W\_E through which the action of W\_E on the pinned dual group Ĝ factors. For a flat affine group scheme H over Z\_ℓ, Rep\_Λ(H) is the exact category of algebraic representations of H on finite projective Λ-modules.

**Proof outline.**

1. By FS IX.2.1 and IX.1.1 it remains to show that T\_V(A) lies in the essential image of D\_■(Bun\_G×[\*/W\_E^I],Λ) (FS p.323).
2. Reduction to exterior tensor products. V admits a resolution, possibly infinite, by exterior tensor products ⊠\_{i∈I}V\_i with V\_i∈Rep\_Λ(Ĝ⋊Q) involving only finitely many weights of Ĝ^I (highest weight theory, the requested extension ReductiveGroupsIntegralRepresentationsPartII), which induces a resolution of S′\_V in D\_■(𝓗ck^I\_G,Λ). The essential image of a fully faithful colimit-preserving functor is closed under colimits, and T\_V is exact and colimit-preserving in the kernel, so one may take V=⊠\_{i∈I}V\_i.
3. Criterion. Let C be the completed algebraic closure of E; (Spd C)^I→(Div¹)^I is a W\_E^I-torsor. For a small v-stack X, descent along X×(Spd C)^I→X×(Div¹)^I and along X→X×[\*/W\_E^I] presents D\_■(X×(Div¹)^I,Λ) and D\_■(X×[\*/W\_E^I],Λ) as the limits over n of D\_■(X×(Spd C)^I×(W\_E^I)^n,Λ) and of D\_■(X×(W\_E^I)^n,Λ), and the pullback functors D\_■(X×(W\_E^I)^n,Λ)→D\_■(X×(Spd C)^I×(W\_E^I)^n,Λ) are fully faithful (FS VII.2.6(ii), VStackSheavesAndLisseCategories:VS2/solid-geometric-base-change, applied once for each factor Spd C). The n-th term of the descent datum of an object M is the pullback of its 0-th term along a map over X. Hence M∈D\_■(X×(Div¹)^I,Λ) lies in the essential image of D\_■(X×[\*/W\_E^I],Λ) as soon as its pullback to X×(Spd C)^I is the pullback of an object of D\_■(X,Λ). For |I|=1 this is the argument of the proofs of FS IV.7.1 and VII.2.7, which FS p.323 quotes as Corollary VII.2.7.
4. Exterior tensor products. By part (c) of the monoidality node, whose proof gives the kernel ι\_{ζ♮}pr\_ζ^\*S′\_{V\_i} of the operator along the i-th leg for the inclusion ζ: {i}→I, and by base change for ♮ (FS VII.3.1(iii)), the base change of T̃\_{⊠V\_i} to Bun\_G×(Spd C)^I is the composite over i∈I of the base changes, along the i-th projection (Spd C)^I→Spd C, of the one-leg endofunctors T\_{V\_i|Ĝ} of D\_■(Bun\_G×Spd C,Λ). Each of these sends the pullback of B∈D\_lis(Bun\_G,Λ) to the pullback of T\_{V\_i|Ĝ}(B)∈D\_lis(Bun\_G,Λ) (FS IX.2.1, with D\_lis(Bun\_G,Λ)≃D\_lis(Bun\_G×Spd C,Λ) by FS VII.7.3). Hence the pullback of T\_{⊠V\_i}(A) to Bun\_G×(Spd C)^I is the pullback of an object of D\_lis(Bun\_G,Λ), and the criterion applies with X=Bun\_G.

**Acceptance.**

- For V=1: T\_1(A)=pr^\*A is the pullback of A along Bun\_G×[\*/W\_E^I]→Bun\_G, so the action of W\_E^I is trivial.
- For U∈Rep\_Λ(Q^I) inflated to (Ĝ⋊Q)^I: T\_U(A)=A⊗\_ΛU with W\_E^I acting on U through W\_E^I→Q^I.
- For G=G\_m, I a singleton, V the identity character of Ĝ=G\_m and A\_ψ the object attached to a smooth character ψ: E^×→Λ^× on one component of Bun\_{G\_m}: T\_V(A\_ψ) is A\_ψ on the component of degree one higher, with W\_E acting through the character ψ∘Art\_E or through its inverse, the same choice for all ψ. Here Art\_E: W\_E→E^× is the homomorphism classifying the E^×-torsor BC(O(1))∖{0}→Div¹ (FS II.2.4), which induces the reciprocity isomorphism of the abelianised Weil group with E^×; which of the two occurs depends on the normalisation of Art\_E and of the identification of the components of Bun\_{G\_m} with [∗/E^×]. This character is the L-parameter of A\_ψ in the sense of FS Definition IX.0.4, which FS IX.6.4–IX.6.5 identify with ψ through local class field theory. In particular the action is trivial exactly when ψ is trivial and trivial on inertia exactly when ψ is trivial on the units of O\_E.
- For |I|=2, X=\* and Λ killed by an integer prime to p: Δ\_\*Λ, for the diagonal Δ: Div¹→(Div¹)², is not in the essential image of D\_ét([\*/W\_E²],Λ)→D\_ét((Div¹)²,Λ), since its support is a proper nonempty closed subset while every pullback from [\*/W\_E²] has support empty or everything.

**Prerequisites.**

- In this roadmap: `HS1/condensed-enrichment`, `HS0/demazure-generators-of-ULA-kernels`, `HS1/properties-and-weil-equivariance`, `HS1/monoidality-of-hecke-operators`.
- In other roadmaps: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `VStackSheavesAndLisseCategories:VS1/divisor-weil-map`, `VStackSheavesAndLisseCategories:VS1/drinfeld-pullback`, `VStackSheavesAndLisseCategories:VS1/drinfeld-local-systems`, `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS2/solid-geometric-base-change-and-drinfeld`, `VStackSheavesAndLisseCategories:VS4/hn-localization-and-geometric-invariance`, `VStackSheavesAndLisseCategories:VS2/solid-geometric-base-change`.

**Sources.**

- Fargues–Scholze, Corollary IX.2.3, p. 323: The statement: values in D\_■(Bun\_G×[\*/W\_E^I],Λ) with lisse underlying object.
- Fargues–Scholze, Corollary IX.2.3, proof, p. 323: Reduction to exterior tensor products through a possibly infinite resolution.
- Fargues–Scholze, Corollary IX.2.3, proof, p. 323: The one-leg criterion taken from Corollary VII.2.7.
- Fargues–Scholze, Corollary VII.2.8, p. 256: Full faithfulness of pullback to X×(Div¹)^I for solid sheaves, any small v-stack X and finite set I.
- Fargues–Scholze, Proposition IX.1.1, p. 320: The criterion for an equivariant solid object to be lisse.
- Fargues–Scholze, Proposition IV.7.3, p. 165: Essential surjectivity holds only for locally constant objects with perfect fibres.

### Change of coefficients for the Hecke action

`HS1/coefficient-base-change` · Comparison

**Comparison.** Let Λ→Λ′ be a homomorphism of Z\_ℓ[√q]-algebras. For a small v-stack X write (−)\_{Λ′}=−⊗^■\_ΛΛ′: D\_■(X,Λ)→D\_■(X,Λ′) for the base-change functor, the left adjoint of restriction of scalars r; it is symmetric monoidal, commutes with pullbacks and preserves D\_lis. For V∈Rep\_Λ((Ĝ⋊Q)^I) put V′=V⊗\_ΛΛ′. (a) S′\_{V′}≅(S′\_V)\_{Λ′} in D\_■(Hck^I\_G,Λ′), compatibly with the monoidal constraints, the Rep(Q^I)-linearity and the functoriality in I. (b) T\_{V′}(A\_{Λ′})≅T\_V(A)\_{Λ′} naturally in A∈D\_■(Bun\_G,Λ) and in V, and likewise T̃\_{V′}(B\_{Λ′})≅T̃\_V(B)\_{Λ′} for B∈D\_■(Bun\_G×(Div¹)^I,Λ), compatibly with the composition isomorphisms T̃\_{V⊗W}≅T̃\_W∘T̃\_V of HS1/monoidality-of-hecke-operators and, for A∈D\_lis(Bun\_G,Λ), with the W\_E^I-equivariant structures of FS IX.2.3. (c) For B∈D\_■(Bun\_G,Λ′): r(T\_{V′}(B))≅T\_V(r(B)). All tensor products are derived. This comparison is not stated in the source: FS constructs S′\_V for general Λ by linear extension from Z\_ℓ[√q] (p.321) and uses the comparison implicitly, for instance in the proof of FS IX.7.2 (p.335), which passes from Λ to Z\_ℓ[√q] and to torsion coefficients. It is proved here from the prerequisites.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- ℓ≠p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root √q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ⊗\_{Z\_ℓ,disc}Λ (FS VII.6). No condition on ℓ beyond ℓ≠p is imposed.
- Q is a finite quotient of W\_E through which the action of W\_E on the pinned dual group Ĝ factors. For a flat affine group scheme H over Z\_ℓ, Rep\_Λ(H) is the exact category of algebraic representations of H on finite projective Λ-modules.

**Proof outline.**

1. Base change. Restriction of scalars r: D\_■(X,Λ′)→D\_■(X,Λ) commutes with f^\* for every map f of small v-stacks, so its left adjoint (−)\_{Λ′} commutes with the left adjoint f\_♮ (FS VII.3.1(i)); (−)\_{Λ′} is symmetric monoidal and commutes with f^\* (FS VII.2.2). It preserves D\_lis because (f\_♮Λ)\_{Λ′}=f\_♮Λ′ on the generators (FS VII.6.1).
2. (a) Over Z\_ℓ[√q] the kernel functor is defined directly, and over any Z\_ℓ[√q]-algebra it is the unique exact Rep(Q^I)-linear monoidal extension (kernel node; FS p.321). The functors V↦S′\_{V′} and V↦(S′\_V)\_{Λ′} from Rep\_Λ((Ĝ⋊Q)^I) to D\_■(𝓗ck^I\_G,Λ′) are both exact, Rep\_Λ(Q^I)-linear and monoidal and agree on the image of Rep\_{Z\_ℓ[√q]}((Ĝ⋊Q)^I), hence are isomorphic; pull back along q\_I.
3. (b) Apply the first step to p\_1^\*, to ⊗^■S′\_V and to p\_{2♮}, and use (a). The composition isomorphisms are built from the same three operations (monoidality node), and (−)\_{Λ′} commutes with pullback along Bun\_G×(Div¹)^I→Bun\_G×[\*/W\_E^I], so the equivariant structures correspond.
4. (c) By FS VII.3.1(ii) r commutes with p\_{2♮}; r commutes with p\_1^\*; and r(M⊗^■\_{Λ′}(S′\_V)\_{Λ′})≅r(M)⊗^■\_ΛS′\_V.

**Acceptance.**

- For Λ′=Λ all comparison isomorphisms are identities; for V=1 both sides of (b) are pr^\*(A\_{Λ′}).
- For Λ=Z\_ℓ[√q], Λ′=Z/ℓ^m[√q]: T\_{V/ℓ^m}(A⊗^L\_{Z\_ℓ}Z/ℓ^m)≅T\_V(A)⊗^L\_{Z\_ℓ}Z/ℓ^m.
- The tensor product must be derived: for I=∅, V=Λ=Z\_ℓ[√q] (so T\_V=id) and A a sheaf killed by ℓ, A⊗^L\_{Z\_ℓ}Z/ℓ^m has A in degrees 0 and −1.
- For Λ₀=Z/ℓⁿ[√q], V₀∈Rep\_{Λ₀}((Ĝ⋊Q)^I), a Λ₀-algebra Λ′ and A∈D\_ét(Bun\_G,Λ₀): T\_{V₀⊗Λ′}(A⊗^L\_{Λ₀}Λ′)≅Rp\_{2\*}(p\_1^\*A⊗^LS\_{V₀})⊗^L\_{Λ₀}Λ′, by (b) and the torsion comparison of the Hecke-operator node.

**Prerequisites.**

- In this roadmap: `HS1/continuous-weil-descent`, `HS1/satake-kernel-and-solid-monoidal-functor`, `HS1/hecke-operator-via-relative-homology`, `HS1/monoidality-of-hecke-operators`.
- In other roadmaps: `VStackSheavesAndLisseCategories:VS2`, `GeometricSatakeAndFusion:GS4:integral-dual-group/enhanced-perfect-satake-extension`, `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `VStackSheavesAndLisseCategories:VS3/lisse-category-definition`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS3/lisse-coefficient-change`.

**Sources.**

- Fargues–Scholze, IX.2, p. 321: The kernel for general Λ is defined by unique linear extension from Z\_ℓ[√q]; the comparison (a) is this uniqueness. The source does not state the comparison.
- Fargues–Scholze, Proposition VII.3.1(ii), p. 257: Relative homology commutes with restriction of coefficients, used for (c).
- Fargues–Scholze, Theorem IX.7.2, proof, p. 335: A place where the source changes coefficients for statements about Hecke operators without stating the comparison.

### Monoidality of V↦T\_V and functoriality in the set of legs

`HS1/monoidality-of-hecke-operators` · Theorem

**Theorem.** For a finite set I put X\_I=Bun\_G×(Div¹)^I and regard Hck^I\_G as a correspondence X\_I ←h\_1− Hck^I\_G −h\_2→ X\_I over (Div¹)^I, with h\_1=(p\_1,legs) and h\_2=p\_2. (a) K↦Φ\_K=h\_{2♮}(h\_1^\*(−)⊗^■\_ΛK) is an exact monoidal functor from D\_■(Hck^I\_G,Λ), with the convolution K⋆K′=c\_♮(pr\_1^\*K⊗^■\_Λpr\_2^\*K′) along the composition map c: Hck^I\_G×\_{X\_I}Hck^I\_G→Hck^I\_G, to the D\_■((Div¹)^I,Λ)-linear endofunctors of D\_■(X\_I,Λ): Φ\_{δ\_♮Λ}≅id and Φ\_{K⋆K′}≅Φ\_{K′}∘Φ\_K, with the associativity and unit coherences. Here the fibre product is formed with h\_2 on the first factor and h\_1 on the second, pr\_1 and pr\_2 are the first and the second modification of a chain E\_0⇢E\_1⇢E\_2, and K is applied first; so K↦Φ\_K is monoidal for the product F·F′=F′∘F on endofunctors (the convention of FS VII.5, where the kernel A⋆B gives the functor of A followed by the functor of B). (b) Composing with V↦S′\_V gives an exact Rep\_Λ(Q^I)-linear monoidal functor Rep\_Λ((Ĝ⋊Q)^I)→End\_{D\_■((Div¹)^I,Λ)}(D\_■(X\_I,Λ)), V↦T̃\_V. In particular T̃\_1≅id, T̃\_{V⊗W}≅T̃\_W∘T̃\_V, the commutativity isomorphism V⊗W≅W⊗V of representations gives T̃\_W∘T̃\_V≅T̃\_V∘T̃\_W, and T̃\_{U⊗V}≅pr\_2^\*L\_U⊗^■T̃\_V for U∈Rep\_Λ(Q^I) with local system L\_U on (Div¹)^I. The Hecke operator is T\_V(A)=T̃\_V(pr^\*A), so T\_1(A)≅pr^\*A and T\_{V⊗W}(A)≅T̃\_W(T\_V(A))≅T̃\_V(T\_W(A)). (c) For a map ζ: I→J of finite sets let Δ\_ζ: (Div¹)^J→(Div¹)^I be the induced map and ζ^\*: Rep\_Λ((Ĝ⋊Q)^I)→Rep\_Λ((Ĝ⋊Q)^J) restriction along (Ĝ⋊Q)^J→(Ĝ⋊Q)^I. Then (id×Δ\_ζ)^\*∘T̃\_V≅T̃\_{ζ^\*V}∘(id×Δ\_ζ)^\*, compatibly with composition of maps of finite sets and with the monoidal structures of (b). In particular, for V\_i∈Rep\_Λ(Ĝ⋊Q), i∈I, the operator T̃\_{⊠\_iV\_i} is the composite, in any order, of the operators T̃\_{V\_i} acting along the i-th leg; and for I→{\*} the restriction of T̃\_{⊠\_iV\_i} to the diagonal Div¹⊂(Div¹)^I is T̃\_{⊗\_iV\_i} (fusion). After base change to the diagonal geometric point Spd C→(Div¹)^I, (b) gives a monoidal functor from Rep\_Λ(Ĝ^I) to the endofunctors of D\_■(Bun\_G×Spd C,Λ).

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- ℓ≠p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root √q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ⊗\_{Z\_ℓ,disc}Λ (FS VII.6). No condition on ℓ beyond ℓ≠p is imposed.
- Q is a finite quotient of W\_E through which the action of W\_E on the pinned dual group Ĝ factors. For a flat affine group scheme H over Z\_ℓ, Rep\_Λ(H) is the exact category of algebraic representations of H on finite projective Λ-modules.

**Proof outline.**

1. (a) Kernels and convolution (FS VII.5 p.267): for small v-stacks over a base, a kernel A defines the functor p\_{2♮}(A⊗^■p\_1^\*(−)), and the convolution A⋆B=p\_{13♮}(p\_{12}^\*A⊗^■p\_{23}^\*B) is the kernel of the functor of A followed by the functor of B: with pr\_1, pr\_2 the two projections of the chain stack and c the composition, Φ\_{K′}(Φ\_K(B))=h\_{2♮}(h\_1^\*h\_{2♮}(h\_1^\*B⊗^■K)⊗^■K′)=h\_{2♮}pr\_{2♮}(pr\_1^\*(h\_1^\*B⊗^■K)⊗^■pr\_2^\*K′)=h\_{2♮}(h\_1^\*B⊗^■c\_♮(pr\_1^\*K⊗^■pr\_2^\*K′)). The comparison uses only base change for ♮ (FS VII.3.1(iii)) and the projection formula for ♮ (FS VII.3.1(i)), which hold for arbitrary maps of small v-stacks. Here the triple fibre product is the stack of chains of two modifications and p\_13 is their composition (chains node of HS0). The unit is δ\_♮Λ: Φ\_{δ\_♮Λ}(B)=h\_{2♮}δ\_♮δ^\*h\_1^\*B=B.
2. The monoidal structure exists on the ∞-categories, because the convolution uses only pullback, tensor product and ♮-pushforward, which are defined on ∞-categories (FS p.321).
3. (b) V↦S′\_V is exact, Rep\_Λ(Q^I)-linear and monoidal (kernel node), and Φ\_{pr\_2^\*L⊗K}≅pr\_2^\*L⊗Φ\_K by the projection formula.
4. (c) The kernel node gives S′\_{ζ^\*V}≅ι\_{ζ♮}pr\_ζ^\*S′\_V for the map ι\_ζ: Hck^I\_G×\_{(Div¹)^I}(Div¹)^J→Hck^J\_G of globalKernel.restrictLegs (a closed immersion on every bounded part); base change for ♮ along id×Δ\_ζ gives the isomorphism. For the inclusion of one element i into I, ζ^\* is inflation along the i-th projection, and ⊠\_iV\_i is the tensor product of the inflations of the V\_i, so the two special cases follow from (b).

**Acceptance.**

- For I=∅: X\_∅=Bun\_G, Rep\_Λ of the trivial group is the category of finite projective Λ-modules M, T̃\_M=−⊗\_ΛM, and the monoidal constraint is the associativity of ⊗\_Λ.
- For G=G\_m, I a singleton and V\_n the character z↦zⁿ: T̃\_{V\_n}∘T̃\_{V\_m}≅T̃\_{V\_{n+m}} and T̃\_{V\_n}∘T̃\_{V\_{−n}}≅id, the composition of the automorphisms (L,D)↦(L(−nD),D) of Bun\_{G\_m}×Div¹.
- For ζ: {1,2}→{\*}: the restriction of T̃\_{V\_1⊠V\_2} to the diagonal Div¹⊂(Div¹)² is T̃\_{V\_1⊗V\_2}.
- For ζ: ∅→I and M a finite projective Λ-module: T̃\_{ζ^\*M}(pr^\*A)=pr^\*A⊗\_ΛM; for M=Λ this is T\_1(A)=pr^\*A.

**Prerequisites.**

- In this roadmap: `HS1/hecke-operator-via-relative-homology`, `HS1/satake-kernel-and-solid-monoidal-functor`, `HS0/chains-and-composition`.
- In other roadmaps: `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `GeometricSatakeAndFusion:GS4:integral-dual-group/enhanced-perfect-satake-extension`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`.
- In the pinned libraries: `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`.

**Sources.**

- Fargues–Scholze, IX.2, p. 321: The monoidal functor from kernels on the global Hecke stack to linear endofunctors.
- Fargues–Scholze, IX.2, p. 321: The convolution uses only pullback, tensor product and ♮-pushforward, so the monoidal structure exists on ∞-categories.
- Fargues–Scholze, VII.5, p. 267: Composition of kernel functors is the convolution with ♮-pushforward.
- Fargues–Scholze, Theorem IX.2.2, proof, p. 323: The monoidality of V↦T\_V as it is used in the proofs of IX.2.1–IX.2.3.
- Fargues–Scholze, VI.9, p. 226: Functoriality of the Satake category in the finite set, the source of (c).

## HS2. Local shtuka moduli and bounds

This layer defines local shtuka spaces in three forms and proves that they agree where they overlap. Over Q\_p, a point of Sht\_{𝒢,b,μ•} is a 𝒢-torsor on S ×̇ Spa Z\_p with a Frobenius that is meromorphic along the legs and bounded by μ•, framed near infinity by b (Scholze–Weinstein, Lecture 23). For two classes b, b′ and any local field E, Mod^I\_{b,b′,≤μ•} is the fibre of the bounded Hecke correspondence over the two points E\_b, E\_b′ of Bun\_G, with the commuting actions of the automorphism groups of both bundles. For a general E and a level K, the tower Sht\_{(G,b,μ•),K} is the sheaf of K-lattices in the torsor of trivialisations over the admissible locus of the twisted Grassmannian. With one leg all three are the space of modifications from the trivial bundle to E\_b bounded by μ, modulo the level; for several legs they agree away from the Frobenius-twisted partial diagonals.

The theorems are: the lattice functor is representable and étale over the open admissible locus (Scholze–Weinstein 22.6.2); period maps are étale and the shtuka spaces are locally spatial diamonds (23.1.4, 23.3.3, 23.5.3); transition maps between levels are finite étale of degree the index, and the tower is the limit of its levels; the structure maps are separated, compactifiable and of locally finite dim.trg, which is what the cohomology of HS3 needs; with no legs the space is the discrete set G(Q\_p)/K for b = 1 and empty otherwise; basic towers at infinite level are dual to those of the inner form; for minuscule μ the levels are the diamonds of smooth, partially proper rigid spaces, the local Shimura varieties; the one-leg tower has a Weil descent datum to the reflex field, which is not effective in general; the admissible locus is non-empty exactly for [b] ∈ B(G, μ⁻¹), and is then geometrically connected and dense; and G(Q\_p) acts transitively on the connected components of the infinite level for minuscule μ.

The layer is checked on G\_m (for the cocharacter z ↦ z^d the tower is non-empty exactly for v(b) = −d, and for d = 1 its levels are given by the Lubin–Tate extensions of the field), on GL\_2 with the Lubin–Tate datum (a disjoint union of open discs indexed by Z, with the Gross–Hopkins period map), on the non-minuscule bound (2,0), and on a norm-one torus, where the Newton point vanishes and the Kottwitz invariant does not.

**Planets.** Moduli spaces of local shtukas (`HS2/local-shtuka-moduli`); Space of modifications from E\_b to E\_b′ (`HS2/framed-bundle-fibres`); Extending G-torsors: the functor Latt (`HS2/lattice-extension-functor`); Tower of moduli spaces of local shtukas (`HS2/levels-and-tower-limit`); Sht\_{𝒢,b,μ•} is a locally spatial diamond (`HS2/multi-leg-period-and-representability`); Local Shimura varieties (`HS2/minuscule-rigidification`).

**Dependencies.** Earlier layers of this roadmap: HS0. Layers of other roadmaps cited by the nodes: `AdicEtaleGeometry:A2`, `AdicSpacesPartII:R0`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG2:smooth-Artin`, `BunGAndNewtonStrata:BG2:uniformization`, `BunGAndNewtonStrata:BG3`, `DiamondSixOperations:S0`, `DiamondsAndVStacks:D3`, `DiamondsAndVStacks:D4`, `DiamondsAndVStacks:D5`, `DiamondsAndVStacks:D6`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness`, `GeometricSatakeAndFusion:GS0:loop-geometry`, `PadicHodgeTheory:R06.2`, `ReductiveGroupsPartII:RG2.0`, `RelativeFarguesFontaine:RF0`, `RelativeFarguesFontaine:RF0:annuli`, `RelativeFarguesFontaine:RF0:integral-Y`, `RelativeFarguesFontaine:RF2:untilts`, `RelativeFarguesFontaine:RF4:G-torsors`, `VStackSheavesAndLisseCategories:VS1`, `VectorBundlesAndIsocrystals:VB1`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples`, `VectorBundlesAndIsocrystals:VB4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Coverage.** Status `planned`. Target-level plan with 18 nodes; every target of the stage text is a node. The stage is not closed: it has open requests and recorded gaps. Remaining:

- Gap: Supplier normalization of the Beauville–Laszlo map.
- Gap: Connectedness and density after removing a locus of smaller dimension.
- Gap: Dimension theory for stacky maps used in the connectedness proof.
- Gap: Open connected components of finite-level local shtuka spaces for non-minuscule μ.
- Gap: Non-emptiness of the weakly admissible locus (Rapoport–Viehmann, Proposition 3.1).
- Statements requested from supplier stages that have no node for them yet: AdicEtaleGeometry:A2, BunGAndNewtonStrata:BG2:uniformization, BunGAndNewtonStrata:BG3, GeometricSatakeAndFusion:GS0:Schubert-smoothness, PadicHodgeTheory:R06.2, ReductiveGroupsPartII:RG2.0, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group.
- Lemma-level refinement of the target-level nodes of this stage.

### Moduli space of mixed-characteristic local shtukas

`HS2/local-shtuka-moduli` · Definition · planet: **Moduli spaces of local shtukas**

**Definition.** Let E = Q\_p, G a reductive group over Q\_p, k an algebraic closure of F\_p and L = W(k)[1/p] with Frobenius σ. A local shtuka datum (𝒢, b, μ•) consists of a smooth affine group scheme 𝒢 over Z\_p with generic fibre G and connected special fibre, an element b ∈ G(L), and conjugacy classes μ\_1, …, μ\_m of cocharacters of G over an algebraic closure of Q\_p (m ≥ 0); F\_i/Q\_p denotes the field of definition of μ\_i and F̆\_i = F\_i·L. For S = Spa(R,R⁺) affinoid perfectoid over k with pseudo-uniformizer ϖ, write Y\_[0,∞)(S) = S ×̇ Spa Z\_p and Y\_[r,∞)(S) = {|[ϖ]| ≤ |p|^r ≠ 0}. Sht\_{𝒢,b,μ•}(S) is the set of isomorphism classes of quadruples (P, (S\_i♯)\_i, φ\_P, ι) where: (1) P is a 𝒢-torsor on S ×̇ Spa Z\_p; (2) S\_i♯ is an untilt of S over F̆\_i for i = 1, …, m, with its closed Cartier divisor S\_i♯ ⊂ S ×̇ Spa Z\_p; (3) φ\_P : (Frob\_S^\*P)|\_U ≅ P|\_U is an isomorphism over U = (S ×̇ Spa Z\_p) ∖ ⋃\_i S\_i♯ which is meromorphic along ⋃\_i S\_i♯; (4) ι is an isomorphism ι\_r : P|\_{Y\_[r,∞)(S)} ≅ G × Y\_[r,∞)(S), for some r so large that Y\_[r,∞)(S) is disjoint from all S\_i♯, under which φ\_P becomes b × Frob\_S; ι\_r and ι\_{r′} are identified when they agree on Y\_[r″,∞)(S) for some r″ ≥ r, r′. Bound: at every geometric rank-one point of S and every i, the position of P relative to Frob\_S^\*P at S\_i♯ is bounded in the Bruhat order by Σ\_{j : S\_j♯ = S\_i♯} μ\_j; that is, the modification φ\_P⁻¹ : P ⇢ Frob\_S^\*P satisfies inv(P, Frob\_S^\*P, φ\_P⁻¹) ≤ Σ\_{j : S\_j♯ = S\_i♯} μ\_j at S\_i♯, where inv is defined on the completions along S\_i♯ as in HS0/bounded-hecke-substacks. For 𝒢 = GL\_n and one leg with μ = (1^d, 0^{n−d}) this says that φ\_P⁻¹ extends to an injection P ↪ Frob\_S^\*P near S♯ whose cokernel is locally free of rank d over O\_{S♯}; φ\_P itself then has a simple pole along S♯ when d ≥ 1. The source bounds the relative position of the pair Frob\_S^\*P, P without fixing the order; the order is forced by its Proposition 23.3.1 (the bound is that of α from E to E\_b) and by the case of p-divisible groups in its §24.2, and the opposite order would define Sht\_{𝒢,b,μ•⁻¹}. An isomorphism of quadruples with the same untilts is an isomorphism of 𝒢-torsors compatible with φ\_P and with the framings for large r; it is unique when it exists, so Sht\_{𝒢,b,μ•} is a presheaf of sets on Perf\_k. It has the structure map Sht\_{𝒢,b,μ•} → Spd F̆\_1 ×\_{Spd k} ⋯ ×\_{Spd k} Spd F̆\_m, (P,(S\_i♯),φ\_P,ι) ↦ (S\_i♯)\_i, and it is a v-sheaf. For y ∈ G(L), composing ι with y × id is an isomorphism Sht\_{𝒢,b,μ•} ≅ Sht\_{𝒢,b′,μ•} over the leg base, b′ = y b σ(y)⁻¹; hence the isomorphism class of Sht\_{𝒢,b,μ•} depends only on the class of b in B(G), and J\_b(Q\_p) = {y ∈ G(L) : y b σ(y)⁻¹ = b} acts on Sht\_{𝒢,b,μ•}. The μ\_i are arbitrary (not necessarily minuscule) and b is arbitrary (not necessarily basic). The framing ι is part of the data: without it the functor is a stack, not a sheaf.

**Hypotheses and conventions.**

- E = Q\_p. G is a reductive group over Q\_p; k is an algebraic closure of F\_p, L = W(k)[1/p] with Frobenius σ, and S ranges over Perf\_k; wherever Y\_[0,r\](S), Y\_(0,r\](S) or Y\_[r,∞)(S) is written, S = Spa(R,R⁺) is affinoid with a fixed pseudo-uniformizer ϖ.
- 𝒢 is a smooth affine group scheme over Z\_p with generic fibre G and connected special fibre (Scholze–Weinstein §23.1; their torsor formalism in the appendix to Lecture 19 is for flat affine group schemes over Z\_p). 𝒢 is not assumed reductive or parahoric.
- φ\_P is an isomorphism only away from the legs; it is not a Frobenius structure on all of S ×̇ Spa Z\_p. The source defines the functor as a set of quadruples; isomorphism classes are meant (Proposition 23.3.1 puts the S-points in bijection with isomorphism classes of the quadruples (S♯, E, α, ℙ)), and the uniqueness of isomorphisms is proved in step 3.

**Construction.**

1. Well-definedness. Torsors under the smooth affine 𝒢 on the sousperfectoid space S ×̇ Spa Z\_p and on its open subsets are taken in the Tannakian sense, as exact tensor functors from the representations of 𝒢 on finite free Z\_p-modules to vector bundles (the convention of RelativeFarguesFontaine:RF4:G-torsors for smooth affine groups over the ring of integers; Scholze–Weinstein, Theorem 19.5.2, compares them with geometric torsors, and over S ×̇ Spa Q\_p the comparison for the reductive group G is BunGAndNewtonStrata:BG0/g-torsors-three-descriptions); meromorphy of φ\_P along the Cartier divisor ⋃ S\_i♯ and the bound by Σ μ\_j are the conditions of RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification and of the Schubert varieties of GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness, the bound being imposed on φ\_P⁻¹ : P ⇢ Frob\_S^\*P and tested on all representations and at geometric rank-one points (Remark 23.1.2 compares the bound with the one defining the Schubert variety of the Beilinson–Drinfeld Grassmannian, Definition 20.4.4; Definition 23.5.1 imposes the same bound on the twisted Grassmannian of HS0/twisted-period-grassmannian). For r large Y\_[r,∞)(S) is disjoint from the S\_i♯, so the condition on ι\_r makes sense; the functor does not depend on ϖ.
2. v-sheaf. By Scholze–Weinstein, Proposition 19.5.3, 𝒢-torsors on open subsets of S ×̇ Spa Z\_p form a v-stack in S; isomorphisms of torsors, untilts, meromorphy, the framing germ and the pointwise bound all satisfy v-descent, and by step 3 the stack of quadruples has no non-trivial automorphisms. Hence Sht\_{𝒢,b,μ•} is a v-sheaf (the sentence after Theorem 23.1.4).
3. Rigidity. Let γ be an automorphism of (P,φ\_P,ι). Then γ = id on Y\_[r,∞)(S). Since γ commutes with φ\_P and Frob\_S maps Y\_[r/p,∞)(S) onto Y\_[r,∞)(S), induction gives γ = id on Y\_(0,∞)(S) ∖ ⋃\_{i, n ≥ 0} φ^{−n}(S\_i♯); this is the complement of a locally finite union of Cartier divisors in Y\_(0,∞)(S), and Y\_(0,∞)(S) is the complement of the Cartier divisor p = 0, so γ = id because 𝒢 is affine and functions on S ×̇ Spa Z\_p inject into functions on the complement of a Cartier divisor. The same induction extends ι\_r to an isomorphism P ≅ G × Y over Y\_(0,∞)(S) ∖ ⋃\_{i, n ≥ 0} φ^{−n}(S\_i♯), meromorphic along the φ^{−n}(S\_i♯) (Scholze–Weinstein, proof of Proposition 23.4.2). Explicitly, the extension of ι\_r over Y\_[r/p,∞)(S) ∖ ⋃ S\_i♯ is (b × id) ∘ Frob\_S^\*(ι\_r) ∘ φ\_P⁻¹, and Frob\_S^\*(ι\_r) is an isomorphism on all of Y\_[r/p,∞)(S); in general, along a leg S\_i♯ that meets no φ^{−n}(S\_j♯) with n ≥ 1, the extended framing is φ\_P⁻¹ followed by an isomorphism that is regular along S\_i♯, so the position of P relative to the trivial torsor G × Y there equals the position of P relative to Frob\_S^\*P.
4. Change of framing. In Tannakian terms the trivial torsor with b × Frob\_S is V ↦ (V ⊗ O, b ⊗ φ), and y ∈ G(L) acts on it by left multiplication; conjugating gives y ∘ (b ⊗ φ) ∘ y⁻¹ = (y b σ(y)⁻¹) ⊗ φ. So (P,φ\_P,ι) ↦ (P,φ\_P,(y × id) ∘ ι) maps Sht\_{𝒢,b,μ•} isomorphically onto Sht\_{𝒢,y b σ(y)⁻¹,μ•}, with inverse given by y⁻¹, and the maps for y and z compose to the map for zy (Remark 23.1.3, with the σ-conjugation formula corrected to Kottwitz's b ↦ y b σ(y)⁻¹).

**API.**

- `ShtukaDatum` (data): A point of Sht\_{𝒢,b,μ•} over affinoid S ∈ Perf\_k: a 𝒢-torsor P on S ×̇ Spa Z\_p, untilts S\_i♯ of S over F̆\_i, an isomorphism φ\_P : Frob\_S^\*P ≅ P over the complement of ⋃ S\_i♯, meromorphic along ⋃ S\_i♯ and such that the position of P relative to Frob\_S^\*P (the type of φ\_P⁻¹ : P ⇢ Frob\_S^\*P) at S\_i♯ is bounded by Σ\_{j : S\_j♯ = S\_i♯} μ\_j at all geometric rank-one points, and the germ at infinity ι of isomorphisms ι\_r : P|\_{Y\_[r,∞)(S)} ≅ G × Y\_[r,∞)(S) carrying φ\_P to b × Frob\_S.
- `ShtukaDatum.legs` (projection): The structure map Sht\_{𝒢,b,μ•} → Spd F̆\_1 ×\_{Spd k} ⋯ ×\_{Spd k} Spd F̆\_m sending a datum to its untilts.
- `ShtukaDatum.frobenius` (projection): The isomorphism φ\_P from Frob\_S^\*P to P over (S ×̇ Spa Z\_p) ∖ ⋃ S\_i♯. It need not extend over the legs: at a geometric rank-one point it extends to an isomorphism across S\_i♯ exactly when the position of P relative to Frob\_S^\*P there is trivial, and for 𝒢 = GL\_n, μ = (1^d, 0^{n−d}) with d ≥ 1 it has a simple pole along S♯, while φ\_P⁻¹ extends to an injection P ↪ Frob\_S^\*P.
- `ShtukaDatum.ext` (extensionality): Two data over S with the same untilts are equal in Sht\_{𝒢,b,μ•}(S) if and only if there is an isomorphism of 𝒢-torsors P ≅ P′ compatible with φ\_P, φ\_{P′} and with ι, ι′ on Y\_[r,∞)(S) for r large; such an isomorphism is unique.
- `ShtukaDatum.isVSheaf` (structure): Sht\_{𝒢,b,μ•} is a v-sheaf on Perf\_k (Scholze–Weinstein, after Theorem 23.1.4, from Proposition 19.5.3). That it is a locally spatial diamond (Theorem 23.1.4 of the source) is not part of the definition; it is proved through the period map.
- `ShtukaDatum.framing_extends` (characterisation): The framing ι\_r extends uniquely to a φ-equivariant isomorphism P ≅ G × Y over Y\_(0,∞)(S) ∖ ⋃\_{i, n ≥ 0} φ^{−n}(S\_i♯), meromorphic along the divisors φ^{−n}(S\_i♯); with no legs it is an isomorphism over all of Y\_(0,∞)(S) (Scholze–Weinstein, proofs of 23.2.1 and 23.4.2).
- `ShtukaDatum.changeFrame` (functoriality): For y ∈ G(L), (P,(S\_i♯),φ\_P,ι) ↦ (P,(S\_i♯),φ\_P,(y × id) ∘ ι) is an isomorphism c\_y : Sht\_{𝒢,b,μ•} ≅ Sht\_{𝒢,y b σ(y)⁻¹,μ•} over the leg base, with c\_1 = id and c\_z ∘ c\_y = c\_{zy}.
- `ShtukaDatum.sigmaCentralizerAction` (structure): J\_b(Q\_p) = {y ∈ G(L) : y b σ(y)⁻¹ = b} acts on Sht\_{𝒢,b,μ•} over the leg base by y ↦ c\_y.
- `ShtukaDatum.genericPart` (compatibility): Restriction to S ×̇ Spa Q\_p, (P,(S\_i♯),φ\_P,ι) ↦ (P|\_{S ×̇ Spa Q\_p},(S\_i♯),φ\_P,ι), is a map π\_GM : Sht\_{𝒢,b,μ•} → Gr^tw\_{G,∏ Spd F̆\_i,≤μ•} to the twisted Grassmannian of HS0/twisted-period-grassmannian; it commutes with c\_y.
- `ShtukaDatum.diagonal` (relation): Over the locus S\_i♯ = S\_j♯ (i ≠ j) a datum is, by the definition of the bound, a datum with m − 1 legs in which the i-th and j-th legs are replaced by one leg, after base change of the leg base to this locus. The locus is Spd(F̆\_i ⊗\_L F̆\_j), a finite disjoint union of spaces Spd F′ with F′ a composite of F̆\_i and of a conjugate of F̆\_j over L. On the component where F′ is the composite F̆\_iF̆\_j inside the fixed algebraic closure, the common leg is bounded by the sum μ\_i + μ\_j of the dominant representatives; on the component of another conjugate, μ\_j is replaced in this sum by the corresponding Galois conjugate class (as in HS0/bounded-hecke-substacks (3)).
- `ShtukaDatum.noLegs` (example): For m = 0: Sht\_{𝒢,b,∅} = ∅ unless [b] = 1, and Sht\_{𝒢,1,∅} ≅ underline{G(Q\_p)/𝒢(Z\_p)} × Spd k (Scholze–Weinstein, Proposition 23.2.1).

**Unit tests.**

- `ShtukaDatum.noLegs_trivial_test` (degenerate): For m = 0 and b = 1: Sht\_{𝒢,1,∅} ≅ underline{G(Q\_p)/𝒢(Z\_p)} × Spd k, the constant sheaf on a discrete set; for 𝒢 = GL\_n this set is the set of Z\_p-lattices in Q\_p^n and for 𝒢 = G\_m it is Q\_p^×/Z\_p^× ≅ Z.
- `ShtukaDatum.noLegs_nontrivial_test` (non-example): For m = 0, 𝒢 = G\_m and b = p: Sht\_{G\_m,p,∅} = ∅.
- `ShtukaDatum.gm_oneLeg_test` (computation): For 𝒢 = G\_m, one leg with μ(z) = z^d (d ∈ Z) and b ∈ L^×: Sht\_{G\_m,b,μ} is empty unless v\_p(b) = −d; if v\_p(b) = −d, the period map Sht\_{G\_m,b,μ} → Gr\_{G\_m,Spd Q̆\_p,≤μ} = Spd Q̆\_p is surjective and each of its geometric fibres is Q\_p^×/Z\_p^× ≅ Z. For d = 1: b = p⁻¹ gives a non-empty space and b = p the empty one.
- `ShtukaDatum.lubinTate_test` (computation): For 𝒢 = GL\_2, μ = (1,0) and b the matrix with rows (0,1), (p⁻¹,0) (basic, κ(b) = v\_p(det b) = −1): Sht\_{GL\_2,b,μ} is isomorphic over Spd Q̆\_p to the diamond of the generic fibre of the Rapoport–Zink space of the one-dimensional formal group of height 2 over k (Scholze–Weinstein, Theorem 24.2.5), that is, of a disjoint union indexed by Z of open unit discs over Q̆\_p; its period map to Gr\_{GL\_2,Spd Q̆\_p,≤μ} = (P¹\_{Q̆\_p})^◇ is surjective with geometric fibres GL\_2(Q\_p)/GL\_2(Z\_p).
- `ShtukaDatum.coincident_legs_test` (characterisation): For 𝒢 = G\_m, two legs with μ\_1(z) = z, μ\_2(z) = z⁻¹ and b = 1: the restriction of Sht\_{G\_m,1,(μ\_1,μ\_2)} to the diagonal Spd Q̆\_p → Spd Q̆\_p ×\_{Spd k} Spd Q̆\_p is underline{Q\_p^×/Z\_p^×} × Spd Q̆\_p; the bound at the coincident leg is μ\_1 + μ\_2 = 0, so φ\_P extends to an isomorphism across the leg and the no-leg computation applies.
- `ShtukaDatum.nonminuscule_test` (non-example): For 𝒢 = GL\_2, μ = (2,0) and b = p⁻¹·1\_2: Sht\_{GL\_2,b,μ} is non-empty, and the fibre of its period map over each geometric point of the closed stratum Gr\_{GL\_2,(1,1)} ⊂ Gr\_{GL\_2,Spd Q̆\_p,≤(2,0)} is GL\_2(Q\_p)/GL\_2(Z\_p). The target Gr\_{GL\_2,≤(2,0)} is the union of the 2-dimensional cell Gr\_{(2,0)} and the point Gr\_{(1,1)}; it is not the diamond of a flag variety of GL\_2 (a point or P¹).
- `ShtukaDatum.boundDirection_test` (characterisation): For 𝒢 = G\_m, one leg, μ(z) = z and b = p⁻¹: for every point (P, S♯, φ\_P, ι) the framing identifies P|\_{Y\_(0,∞)(S)} with the ideal sheaf of the divisor ⋃\_{n≥0} φ^{−n}(S♯) in O\_{Y\_(0,∞)(S)}, with φ\_P induced by p⁻¹·Frob\_S; so φ\_P⁻¹ is an inclusion P ↪ Frob\_S^\*P with cokernel O\_{S♯}, and φ\_P has a simple pole along S♯. The functor defined with inv(Frob\_S^\*P, P, φ\_P) ≤ μ in place of inv(P, Frob\_S^\*P, φ\_P⁻¹) ≤ μ is Sht\_{G\_m,b,μ⁻¹}, which is empty for b = p⁻¹ and non-empty for b = p.

**Uses.**

- HeckeStacksAndLocalShtukas:HS2/hecke-fibre-description: For one leg its S-points are rewritten as modifications E ⇢ E\_b of G-bundles on the Fargues–Fontaine curve together with a 𝒢(Z\_p)-lattice (Scholze–Weinstein, Proposition 23.3.1).
- HeckeStacksAndLocalShtukas:HS2/multi-leg-period-and-representability: Restricting (P,φ\_P,ι) to S ×̇ Spa Q\_p is the period map π\_GM to the twisted Grassmannian; Sht\_{𝒢,b,μ•} is the space of 𝒢(Z\_p)-lattices over its admissible locus (Corollary 23.5.3).
- HeckeStacksAndLocalShtukas:HS2/no-legs-and-basic-duality: The case m = 0 is computed directly from the definition (Proposition 23.2.1).
- HeckeStacksAndLocalShtukas:HS2/levels-and-tower-limit: Sht\_{𝒢,b,μ•} is the member of level K = 𝒢(Z\_p) of the tower.
- Fargues–Scholze, proof of Proposition IX.3.2 (p. 326): Sht parametrises G-torsors over Y\_S with an isomorphism with their Frobenius pullback away from the legs and a level structure near π = 0; its two bundles near π = 0 and near [ϖ] = 0 give the comparison with the Hecke correspondence.

**Acceptance.**

- No legs: Sht\_{𝒢,b,∅} is empty unless [b] = 1 in B(G), and Sht\_{𝒢,1,∅} ≅ underline{G(Q\_p)/𝒢(Z\_p)} × Spd k (Scholze–Weinstein, Proposition 23.2.1); it is not the classifying stack of 𝒢(Z\_p) or of Aut(E\_b), because the framing is part of the data.
- For 𝒢 = G\_m and two legs with μ\_1(z) = z^{d\_1}, μ\_2(z) = z^{d\_2}: over the diagonal S\_1♯ = S\_2♯ the bound is z^{d\_1+d\_2}.
- For 𝒢 = GL\_2 the bound μ = (2,0) is allowed although it is not minuscule; for b = p⁻¹·1\_2 the space Sht\_{GL\_2,b,(2,0)} is non-empty.
- Replacing b by y b σ(y)⁻¹ changes Sht\_{𝒢,b,μ•} by the isomorphism 'compose ι with y × id'; for y ∈ J\_b(Q\_p) this is an automorphism.

**Prerequisites.**

- In this roadmap: `HS0/twisted-period-grassmannian`.
- In other roadmaps: `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification`, `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`, `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`, `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, `BunGAndNewtonStrata:BG0/sigma-conjugacy-quotient`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`.
- In the pinned libraries: `mathlib:WittVector.Isocrystal`, `tauceti:TauCeti.AffineGroupSchemeCat`.

**Sources.**

- Scholze–Weinstein, Definition 23.1.1, p. 216: The datum (𝒢, b, μ•): hypotheses on the integral model, b in G(L), conjugacy classes of cocharacters.
- Scholze–Weinstein, Definition 23.1.1, p. 217: The framing near infinity, the fourth entry of a quadruple.
- Scholze–Weinstein, Definition 23.1.1, p. 217: The bound, with the sum over coincident legs.
- Scholze–Weinstein, Remark 23.1.3, p. 217: Dependence on the class of b only; the printed σ-conjugation formula is the one corrected in the statement.
- Scholze–Weinstein, sentence after Theorem 23.1.4, p. 217: The v-sheaf property, from Proposition 19.5.3.
- Scholze–Weinstein, Proposition 19.5.3, p. 180: Descent of 𝒢-torsors on open subsets of S ×̇ Spa Z\_p.
- Scholze–Weinstein, proof of Proposition 23.4.2, p. 222: Extension of the framing away from the Frobenius translates of the legs.

### Modifications between E\_b and E\_b′: the fibre of the Hecke correspondence

`HS2/framed-bundle-fibres` · Construction · planet: **Space of modifications from E\_b to E\_b′**

**Construction.** Let b, b′ ∈ B(G) with chosen representatives in G(Ĕ), and let x\_b, x\_b′ : Spd k → Bun\_G be the points given by E\_b, E\_b′. Let I be a finite set and μ• = (μ\_i)\_{i∈I} a tuple of conjugacy classes of geometric cocharacters; let F\_i be the field of definition of μ\_i, Div¹\_{F\_i} = Spd F̆\_i/φ\_i^Z (φ\_i the q\_i-Frobenius of the factor Spd F\_i of Spd F̆\_i = Spd F\_i ×\_{Spd κ\_i} Spd k, κ\_i the residue field of F\_i and q\_i its cardinality), and D\_I = ∏\_{i∈I} Div¹\_{F\_i}, which maps to (Div¹)^I. Hck^I\_{G,≤μ•} denotes the bounded part of Hck^I\_G ×\_{(Div¹)^I} D\_I (over (Div¹)^I itself only the union over the Galois conjugates of μ• is defined). (a) Definition. Mod^I\_{b,b′,≤μ•} is the 2-fibre product Spd k ×\_{x\_b, Bun\_G, p\_1} Hck^I\_{G,≤μ•} ×\_{p\_2, Bun\_G, x\_b′} Spd k, where p\_1, p\_2 are the source and target maps of HS0/global-hecke-correspondence. Its S-points are the pairs ((D\_i)\_{i∈I}, α) with D\_i ∈ Div¹\_{F\_i}(S) and α : E\_b|\_{X\_S ∖ ⋃D\_i} ≅ E\_b′|\_{X\_S ∖ ⋃D\_i} an isomorphism of G-bundles that is meromorphic along ⋃D\_i and bounded by μ• at all geometric points (by Σ\_{j : D\_j = D\_i} μ\_j at D\_i). Both bundles are fixed, so points have no automorphisms: Mod^I\_{b,b′,≤μ•} is a v-sheaf of sets over D\_I. Types are normalised as in Fargues–Scholze: for G = G\_m the inclusion O ⊂ O(D) is a modification from O to O(D) of type z ↦ z. (b) Actions. The v-sheaves of groups G̃\_b = Aut(E\_b) and G̃\_b′ = Aut(E\_b′) act on Mod^I\_{b,b′,≤μ•} over D\_I by (g, g′)·α = g′ ∘ α ∘ g⁻¹; the two actions commute. The locally profinite groups J\_b(E) = G\_b(E) and J\_b′(E) act through the inclusions underline{G\_b(E)} ⊂ G̃\_b, underline{G\_b′(E)} ⊂ G̃\_b′. For non-basic b the group G̃\_b = G̃\_b^{>0} ⋊ underline{G\_b(E)} is strictly larger than underline{G\_b(E)}, and the whole of G̃\_b acts. (c) Quotient. The quotient stack [Mod^I\_{b,b′,≤μ•}/(G̃\_b × G̃\_b′)] is Bun\_G^b ×\_{Bun\_G, p\_1} Hck^I\_{G,≤μ•} ×\_{p\_2, Bun\_G} Bun\_G^{b′}, the part of the Hecke correspondence between the two strata. (d) Representability. Mod^I\_{b,b′,≤μ•} → D\_I is representable in locally spatial diamonds; its pullback along ∏\_i Spd F̆\_i → D\_I is a locally spatial diamond. (e) Inversion and composition. α ↦ α⁻¹ is an isomorphism Mod^I\_{b,b′,≤μ•} ≅ Mod^I\_{b′,b,≤μ•⁻¹} exchanging the two actions, where μ⁻¹ is the class of the inverse cocharacters; for disjoint finite sets I, I′ composition of modifications is a map Mod^I\_{b,b′,≤μ•} × Mod^{I′}\_{b′,b″,≤μ′•} → Mod^{I⊔I′}\_{b,b″,≤(μ•,μ′•)}, equivariant for G̃\_b × G̃\_b″ and invariant under the diagonal action of G̃\_b′. (f) Relation to the sources. One has G̃\_1 = underline{G(E)}, and for a compact open K ⊂ G(E) the quotient Mod^I\_{1,b,≤μ•}/K over D\_I = ∏\_i Spd F̆\_i/φ\_i^Z is the space M of the proof of Fargues–Scholze IX.3.2: the modifications between the trivial bundle and E\_b bounded by μ•, up to the action of K. The source prints the modifications as going from E\_b to the trivial bundle, as on its p. 324; with its Hecke operators the trivial bundle is the first bundle of the modification, as in Mod^I\_{1,b,≤μ•}, and by (e) the quotient Mod^I\_{b,1,≤μ•}/K is the same space for the inverse bounds μ•⁻¹. For E = Q\_p and one leg, Mod\_{1,b,≤μ} ×\_{Div¹\_F} Spd F̆ is Scholze–Weinstein's Sht\_{G,b,μ,∞}. The sources define the space only when one of b, b′ is trivial; the general two-bundle space, its quotient description (c) and its representability (d) are not stated in them and are proved in the steps below.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p (either characteristic); G is a reductive group over E; k is an algebraic closure of F\_q, Ĕ the completion of the maximal unramified extension of E with Frobenius σ, and S ranges over Perf\_k.
- Bun\_G, its strata Bun\_G^b ≅ [Spd k/G̃\_b] and Hck^I\_{G,≤μ•} with its maps p\_1 (source bundle), p\_2 (target bundle) and legs are those of the prerequisites in BunGAndNewtonStrata and of HS0; Div¹ = Spd Ĕ/φ^Z.
- No level structure, no basicness and no minuscule hypothesis is imposed.

**Construction.**

1. (a) A point of the 2-fibre product over S is (E\_1, E\_2, (D\_i), α) ∈ Hck^I\_{G,≤μ•}(S) with isomorphisms E\_b ≅ E\_1 and E\_2 ≅ E\_b′; transporting α along them gives ((D\_i), α : E\_b ⇢ E\_b′), and an isomorphism between two such points is a pair of bundle isomorphisms compatible with the identifications, hence the identity. So the fibre product is 0-truncated; it is a v-sheaf because Hck^I\_G and Bun\_G are v-stacks (HS0/descent-and-bounded-fibres).
2. (b), (c) Pre- and postcomposition with automorphisms preserve meromorphy and the bound, which are tested on geometric points after trivialising both bundles near the legs, where an automorphism acts through L⁺G. The decomposition G̃\_b = G̃\_b^{>0} ⋊ underline{G\_b(E)} is Fargues–Scholze III.5.1. Since x\_b : Spd k → Bun\_G^b is a G̃\_b-torsor (Fargues–Scholze III.5.3: Bun\_G^b ≅ [Spd k/G̃\_b]), base change gives (c).
3. (d) The fibre F\_b = Spd k ×\_{x\_b, Bun\_G, p\_1} Hck^I\_{G,≤μ•} parametrises ((D\_i), E′, α : E\_b ⇢ E′). By HS0/descent-and-bounded-fibres it is, after trivialising E\_b along the legs (possible étale locally), the bounded Beilinson–Drinfeld Grassmannian, so F\_b → D\_I is proper and representable in spatial diamonds. The point x\_b′ : Spd k → Bun\_G is representable in locally spatial diamonds, because the diagonal of Bun\_G is (for bundles E, E′ on X\_S the sheaf Isom(E, E′) is a locally spatial diamond over S; Fargues–Scholze IV.1.19–IV.1.20). Hence Mod^I\_{b,b′,≤μ•} = F\_b ×\_{Bun\_G, x\_b′} Spd k → F\_b → D\_I is representable in locally spatial diamonds.
4. (e) If α is bounded by μ at D then α⁻¹ is bounded by μ⁻¹: on a geometric fibre, after trivialising, α is given by an element of G(B⁺\_dR)μ′(ξ)G(B⁺\_dR) with μ′ ≤ μ, and inversion maps this double coset to that of μ′⁻¹; the Bruhat order is preserved by μ ↦ μ⁻¹. Composition over disjoint index sets adds the bounds at coincident divisors (HS0/chains-and-composition).
5. (f) For b = 1 the bundle E\_1 is trivial and G̃\_1 = underline{G(E)}, since G̃\_1^{>0} is built from the positive-slope part of the adjoint isocrystal of b = 1, which is zero. The two identifications are then the definitions in the sources. In the first the direction is the one forced by the Hecke operators of Fargues–Scholze (pp. 337–338), whose kernel for a representation V lies over the pairs (E\_1, E\_2) with E\_1 of position bounded by the weights of V relative to E\_2 (HS0/bounded-hecke-substacks): the fibre that computes the restriction to the stratum of b of T\_W applied to a sheaf on the trivial stratum has E\_1 trivial and E\_2 = E\_b.

**API.**

- `FramedModification` (data): An S-point of Mod^I\_{b,b′,≤μ•}: legs D\_i ∈ Div¹\_{F\_i}(S) (i ∈ I) and an isomorphism α : E\_b|\_{X\_S ∖ ⋃D\_i} ≅ E\_b′|\_{X\_S ∖ ⋃D\_i} of G-bundles, meromorphic along ⋃D\_i and bounded at D\_i by Σ\_{j : D\_j = D\_i} μ\_j at all geometric points of S.
- `FramedModification.legs` (projection): The map Mod^I\_{b,b′,≤μ•} → D\_I, ((D\_i), α) ↦ (D\_i).
- `FramedModification.ofHecke` (universal-property): Mod^I\_{b,b′,≤μ•} is the 2-fibre product Spd k ×\_{x\_b, Bun\_G, p\_1} Hck^I\_{G,≤μ•} ×\_{p\_2, Bun\_G, x\_b′} Spd k: a map T → Mod^I\_{b,b′,≤μ•} is the same as a point (E\_1, E\_2, (D\_i), α) of Hck^I\_{G,≤μ•}(T) with isomorphisms E\_b ≅ E\_1 and E\_2 ≅ E\_b′.
- `FramedModification.sourceAction` (structure): g ∈ G̃\_b(S) = Aut(E\_b|\_{X\_S}) acts by α ↦ α ∘ g⁻¹; this is a left action over D\_I.
- `FramedModification.targetAction` (structure): g′ ∈ G̃\_b′(S) acts by α ↦ g′ ∘ α; it commutes with the source action.
- `FramedModification.quotient` (characterisation): [Mod^I\_{b,b′,≤μ•}/(G̃\_b × G̃\_b′)] ≅ Bun\_G^b ×\_{Bun\_G, p\_1} Hck^I\_{G,≤μ•} ×\_{p\_2, Bun\_G} Bun\_G^{b′}.
- `FramedModification.locallySpatial` (structure): Mod^I\_{b,b′,≤μ•} → D\_I is representable in locally spatial diamonds.
- `FramedModification.inverse` (equivalence): α ↦ α⁻¹ is an isomorphism Mod^I\_{b,b′,≤μ•} ≅ Mod^I\_{b′,b,≤μ•⁻¹} over D\_I; it is an involution and intertwines the action of (g, g′) with that of (g′, g).
- `FramedModification.comp` (functoriality): For disjoint I, I′: (α, α′) ↦ α′ ∘ α is a map Mod^I\_{b,b′,≤μ•} × Mod^{I′}\_{b′,b″,≤μ′•} → Mod^{I⊔I′}\_{b,b″,≤(μ•,μ′•)}; it is associative, and composition with the point id ∈ Mod^∅\_{b,b} is the identity.
- `FramedModification.changeGroup` (functoriality): A homomorphism f : G → H with f(μ•) ≤ μ^H• induces Mod^I\_{b,b′,≤μ•} → Mod^I\_{f(b),f(b′),≤μ^H•}, α ↦ f\_\*α, equivariant along G̃\_b → H̃\_{f(b)} and G̃\_b′ → H̃\_{f(b′)} (HS0/structure-group-and-inner-form).
- `FramedModification.noLegs` (example): Mod^∅\_{b,b} = G̃\_b, a bitorsor under G̃\_b; Mod^∅\_{b,b′} = ∅ for b ≠ b′.
- `FramedModification.infiniteLevel` (compatibility): For E = Q\_p and one leg with reflex field F: Mod\_{1,b,≤μ} ×\_{Div¹\_F} Spd F̆ is the sheaf of pairs (S♯, α : E\_1 ⇢ E\_b bounded by μ), which is Sht\_{G,b,μ,∞}, with G̃\_1 = underline{G(Q\_p)} and J\_b(Q\_p) acting (Scholze–Weinstein, p. 219).

**Unit tests.**

- `FramedModification.noLegs_test` (degenerate): For I = ∅: Mod^∅\_{b,b} = G̃\_b with (g, g′) acting by h ↦ g′hg⁻¹, and Mod^∅\_{b,b′} = ∅ for b ≠ b′ in B(G). For G = GL\_2 and E\_b = O ⊕ O(1): Mod^∅\_{b,b}(S) is the set of triples (a, d, u) with a, d ∈ underline{E^×}(S) and u ∈ H⁰(X\_S, O(1)), strictly larger than underline{E^× × E^×}(S) = underline{G\_b(E)}(S).
- `FramedModification.gm_test` (computation): For G = G\_m, one leg and μ(z) = z^d: with E\_b = O(−v(b)), Mod\_{b,b′,μ} is empty unless v(b) − v(b′) = d, and when v(b) − v(b′) = d it is a torsor over Div¹ under underline{E^×} = G̃\_b acting on the source and equally under underline{E^×} = G̃\_b′ acting on the target (c ∈ E^× multiplies α by c⁻¹ through the first action and by c through the second), an S-point being a leg D with an isomorphism E\_b(dD) ≅ E\_b′. For b = π, b′ = 1, d = 1 it is non-empty; for b = 1, b′ = π, d = 1 it is empty.
- `FramedModification.oneBundle_test` (non-example): For G = G\_m and μ(z) = z: Mod\_{1,1,μ} = ∅, whereas the fibre of p\_1 : Hck\_{G\_m,μ} → Bun\_{G\_m} over E\_1 alone, with the target bundle not fixed, is Gr\_{G\_m,Div¹,μ} ≅ Div¹.
- `FramedModification.shtuka_test` (compatibility): For E = Q\_p, G = G\_m, μ(z) = z and b = p⁻¹: Mod\_{1,b,μ} ×\_{Div¹} Spd Q̆\_p is the sheaf of pairs (S♯, α : O ⇢ O(1) of type μ at S♯), a Q\_p^×-torsor over Spd Q̆\_p, equal to Sht\_{G\_m,p⁻¹,μ,∞}; its quotient by Z\_p^× has geometric fibres Q\_p^×/Z\_p^× ≅ Z.
- `FramedModification.inverse_test` (characterisation): Inversion identifies Mod\_{b,1,≤μ} with Mod\_{1,b,≤μ⁻¹}; for G = GL\_2 and μ = (1,0) one has μ⁻¹ = (0,−1), and for G = G\_m, μ(z) = z: Mod\_{π,1,μ} ≅ Mod\_{1,π,μ⁻¹}, both non-empty, while Mod\_{1,π,μ} = ∅.

**Uses.**

- HeckeStacksAndLocalShtukas:HS2/hecke-fibre-description: For E = Q\_p and one leg, Sht\_{𝒢,b,μ} is the quotient by 𝒢(Z\_p) of Mod\_{1,b,≤μ} ×\_{Div¹\_F} Spd F̆.
- HeckeStacksAndLocalShtukas:HS2/levels-and-tower-limit: Level quotients by compact open subgroups of G\_b(E) and G\_b′(E) are taken on this space.
- HeckeStacksAndLocalShtukas:HS2/multi-leg-period-and-representability: Away from Frobenius-twisted partial diagonals the multi-leg tower at infinite level is the pullback of Mod\_{1,b,≤μ•}.
- HeckeStacksAndLocalShtukas:HS3/hecke-cohomology-comparison: The stalk of T\_W(j\_! c-Ind\_K Λ) on Bun\_G^b is the relative homology of Mod^I\_{1,b,≤μ•}/K, the quotient by K ⊂ G(E) acting on the source bundle E\_1; the G\_b(E)-action on it comes from the action on the target bundle E\_b (Fargues–Scholze, proof of IX.3.2).

**Acceptance.**

- No legs: Mod^∅\_{b,b} = G̃\_b with (g,g′)·h = g′hg⁻¹, and Mod^∅\_{b,b′} = ∅ for b ≠ b′.
- The actions of G̃\_b and G̃\_b′ commute, and inversion exchanges them.
- For G = GL\_2 and E\_b = O ⊕ O(1): G̃\_b(S) consists of the triples (a, d, u) with a, d ∈ underline{E^×}(S) and u ∈ H⁰(X\_S, O(1)); the subgroup BC(O(1)) of the u acts on Mod\_{b,b′,≤μ•} and is not contained in underline{G\_b(E)} = underline{E^× × E^×}.
- For G = G\_m, one leg and μ(z) = z^d: Mod\_{b,b′,μ} ≠ ∅ exactly when v(b) − v(b′) = d (v the normalised valuation of Ĕ; E\_b = O(−v(b))).

**Prerequisites.**

- In this roadmap: `HS0/descent-and-bounded-fibres`, `HS0/chains-and-composition`, `HS0/structure-group-and-inner-form`.
- In other roadmaps: `BunGAndNewtonStrata:BG3/full-automorphism-v-group`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `DiamondsAndVStacks:D5/relative-representability`, `BunGAndNewtonStrata:BG3/stratum-is-classifying-stack`, `BunGAndNewtonStrata:BG2:smooth-Artin/bun-g-is-smooth-artin`, `BunGAndNewtonStrata:BG2:smooth-Artin/isom-sheaf-representability`.

**Sources.**

- Fargues–Scholze, III.3, p. 97: Definition of a modification between two fixed G-bundles at a degree-one divisor.
- Fargues–Scholze, proof of Proposition IX.3.2, p. 326: The fibre of the Hecke correspondence over E\_b and the trivial bundle, modulo K; this is the space Mod^I\_{1,b,≤μ•}/K.
- Fargues–Scholze, proof of Theorem IX.3.1, p. 324: The one-leg minuscule case; the direction from E\_b to E\_1 is the one printed.
- Scholze–Weinstein, §23.3, p. 219: The two commuting actions through the automorphisms of the two bundles, for E = Q\_p and one leg.
- Fargues–Scholze, proof of IX.7.2, p. 336: Normalisation of types: O to O(1) has type z ↦ z.

### Extending G-torsors over p = 0: the functor Latt(P\_η)

`HS2/lattice-extension-functor` · Construction · planet: **Extending G-torsors: the functor Latt**

**Construction.** Let E = Q\_p, 𝒢 a smooth affine group scheme over Z\_p with connected fibres and reductive generic fibre G, S = Spa(R,R⁺) an affinoid perfectoid space of characteristic p with pseudo-uniformizer ϖ, and r > 0 rational; Y\_[0,r\](S) = {|p|^r ≤ |[ϖ]|} ⊂ S ×̇ Spa Z\_p and Y\_(0,r\](S) = Y\_[0,r\](S) ∩ {p ≠ 0}, on both of which φ⁻¹ acts. (a) Integral torsors (Proposition 22.6.1). ℙ ↦ ℙ ×^{𝒢(Z\_p)} (𝒢 ×\_{Spa Z\_p} Y\_[0,r\](S)) is an equivalence from pro-étale 𝒢(Z\_p)-torsors on S to φ⁻¹-equivariant 𝒢-torsors on Y\_[0,r\](S). (b) The functor. Let P\_η be a G-torsor on Y\_(0,r\](S) with an isomorphism with its φ⁻¹-pullback. Latt(P\_η) sends S′ → S to the set of isomorphism classes of 𝒢-torsors P′ on Y\_[0,r\](S′) with an isomorphism with their φ⁻¹-pullback and a φ⁻¹-equivariant identification of P′|\_{Y\_(0,r\](S′)} with the pullback of P\_η. (c) Theorem 22.6.2. Latt(P\_η) is representable by a perfectoid space étale over S. Its image is the open subset S^a ⊂ S, the admissible locus, where ν\_{P\_η} and κ\_{P\_η} are both identically 0, equivalently where the G-torsor on X\_FF,S attached to P\_η is trivial at geometric points. Over S^a there is a pro-étale G(Q\_p)-torsor ℙ\_η with P\_η = ℙ\_η ×^{G(Q\_p)} (G × Y\_(0,r\](S^a)), and Latt(P\_η) parametrises the pro-étale 𝒢(Z\_p)-torsors ℙ with an identification ℙ ×^{𝒢(Z\_p)} G(Q\_p) = ℙ\_η; that is, Latt(P\_η) ≅ ℙ\_η/𝒢(Z\_p) = ℙ\_η ×^{G(Q\_p)} G(Q\_p)/𝒢(Z\_p) over S^a. In particular Latt(P\_η) → S^a is surjective and pro-étale locally on S^a isomorphic to S^a × G(Q\_p)/𝒢(Z\_p); it need not have a section. (d) GL\_n (Corollary 22.3.3). For 𝒢 = GL\_n and E\_η a φ⁻¹-module on Y\_(0,r\](S), Latt(E\_η) parametrises φ⁻¹-modules on Y\_[0,r\](S′) extending E\_η; S^a is the locus where the Newton polygon of E\_η is identically 0, and over S^a, Latt(E\_η) parametrises Z\_p-lattices 𝕃 in the Q\_p-local system 𝕃\_η attached to E\_η. For general G the condition ν = 0 alone does not define S^a.

**Hypotheses and conventions.**

- E = Q\_p. G is a reductive group over Q\_p; k is an algebraic closure of F\_p, L = W(k)[1/p] with Frobenius σ, and S ranges over Perf\_k; wherever Y\_[0,r\](S), Y\_(0,r\](S) or Y\_[r,∞)(S) is written, S = Spa(R,R⁺) is affinoid with a fixed pseudo-uniformizer ϖ.
- 𝒢 is a smooth affine group scheme over Z\_p with connected fibres whose generic fibre G is reductive (a standing assumption of §22.6). Connectedness of the special fibre is used through Lang's lemma: H¹\_ét(Spec Z\_p, 𝒢) = 0.
- Torsors on Y\_[0,r\](S) and Y\_(0,r\](S) are taken in the Tannakian sense; ν and κ are the Newton and Kottwitz maps of the G-torsor on X\_FF,S obtained from P\_η by Scholze–Weinstein, Proposition 22.1.1.

**Construction.**

1. (a) By Kedlaya–Liu (Scholze–Weinstein, Proposition 22.3.2), 𝕃 ↦ 𝕃 ⊗\_{Z\_p} O\_{Y\_[0,r\](S)} is an equivalence from pro-étale Z\_p-local systems on S to φ⁻¹-modules on Y\_[0,r\](S); with the Tannakian description of torsors (Theorem 19.5.2), φ⁻¹-equivariant 𝒢-torsors on Y\_[0,r\](S) are exact tensor functors from Rep\_{Z\_p}𝒢 to pro-étale Z\_p-local systems on S. Such a functor is pro-étale locally isomorphic to the forgetful one: at a geometric point by Lang's lemma, and on a strictly totally disconnected S because Z\_p-local systems are finite projective C⁰(π\_0 S, Z\_p)-modules and the local rings of C⁰(π\_0 S, Z\_p) are henselian along (p). This is the equivalence of (a).
2. (c), openness and the torsor ℙ\_η. By (a), Latt(P\_η) maps into S^a. Semicontinuity of the Newton point (Corollary 22.5.1) reduces openness of S^a to the case ν\_{P\_η} ≡ 0; on a strictly totally disconnected S the bundle then gives a G-torsor over C⁰(π\_0 S, Q\_p), whose local rings are henselian, so triviality at a point spreads to a neighbourhood, and by the classification of G-torsors on the Fargues–Fontaine curve S^a is the locus where this torsor is trivial. Over S^a the sheaf of isomorphisms with the forgetful fibre functor is a pro-étale G(Q\_p)-torsor ℙ\_η with P\_η = ℙ\_η ×^{G(Q\_p)} (G × Y\_(0,r\](S)) (Theorem 22.5.2; for a general local field this is the statement that the geometrically trivial locus of Bun\_G is open and equal to the classifying stack of pro-étale G(E)-torsors, Fargues–Scholze III.2.4).
3. (c), lattices and étaleness. Comparing with (a), an extension of P\_η over Y\_[0,r\](S′) is a pro-étale 𝒢(Z\_p)-torsor ℙ with ℙ ×^{𝒢(Z\_p)} G(Q\_p) = ℙ\_η. After trivialising ℙ\_η pro-étale locally, Latt(P\_η) becomes S × G(Q\_p)/𝒢(Z\_p) with G(Q\_p)/𝒢(Z\_p) discrete; separated étale maps descend along pro-étale covers (Scholze–Weinstein, Theorem 9.1.3), so Latt(P\_η) is a perfectoid space étale over S, the coset bundle of DiamondsAndVStacks:D3/locally-profinite-torsors.
4. (d) is the case 𝒢 = GL\_n, where torsors are vector bundles, G(Q\_p)/𝒢(Z\_p) is the set of Z\_p-lattices in Q\_p^n, and κ is determined by ν.

**API.**

- `LatticeSpace` (data): For S′ → S, Latt(P\_η)(S′) is the set of isomorphism classes of pairs (P′, j) with P′ a φ⁻¹-equivariant 𝒢-torsor on Y\_[0,r\](S′) and j a φ⁻¹-equivariant isomorphism of P′|\_{Y\_(0,r\](S′)} with the pullback of P\_η; such pairs have no non-trivial automorphisms.
- `LatticeSpace.toBase` (projection): The structure map Latt(P\_η) → S is étale, with image the admissible locus S^a.
- `LatticeSpace.admissibleLocus` (characterisation): S^a = {s ∈ S : ν\_{P\_η}(s) = 0 and κ\_{P\_η}(s) = 0} is open in S and is the locus where the G-torsor on X\_FF,S attached to P\_η is trivial at geometric points.
- `LatticeSpace.integralTorsors` (equivalence): ℙ ↦ ℙ ×^{𝒢(Z\_p)} (𝒢 ×\_{Spa Z\_p} Y\_[0,r\](S)) is an equivalence from pro-étale 𝒢(Z\_p)-torsors on S to φ⁻¹-equivariant 𝒢-torsors on Y\_[0,r\](S); restriction to Y\_(0,r\](S) corresponds to ℙ ↦ ℙ ×^{𝒢(Z\_p)} G(Q\_p).
- `LatticeSpace.genericTorsor` (constructor): Over S^a there is a pro-étale G(Q\_p)-torsor ℙ\_η, the sheaf of trivialisations of the fibre functor of P\_η, with P\_η = ℙ\_η ×^{G(Q\_p)} (G × Y\_(0,r\](S^a)).
- `LatticeSpace.equivCosetBundle` (equivalence): Latt(P\_η) ≅ ℙ\_η/𝒢(Z\_p) = ℙ\_η ×^{G(Q\_p)} (G(Q\_p)/𝒢(Z\_p)) over S^a: a point over S′ is a pro-étale 𝒢(Z\_p)-torsor ℙ with an identification ℙ ×^{𝒢(Z\_p)} G(Q\_p) = ℙ\_η|\_{S′}.
- `LatticeSpace.baseChange` (functoriality): For T → S: Latt(P\_η|\_T) = Latt(P\_η) ×\_S T and T^a is the preimage of S^a; this is compatible with composition of base changes.
- `LatticeSpace.changeGroup` (functoriality): A homomorphism f : 𝒢 → ℋ of such group schemes induces Latt(P\_η) → Latt(f\_\*P\_η), given on coset bundles by G(Q\_p)/𝒢(Z\_p) → H(Q\_p)/ℋ(Z\_p); for two models 𝒢′ → 𝒢 of the same G it is the projection ℙ\_η/𝒢′(Z\_p) → ℙ\_η/𝒢(Z\_p).
- `LatticeSpace.glN` (compatibility): For 𝒢 = GL\_n, Latt(P\_η) is the functor Latt(E\_η) of Corollary 22.3.3 for the associated φ⁻¹-module E\_η: it parametrises Z\_p-lattices 𝕃 ⊂ 𝕃\_η, and S^a is the locus where the Newton polygon of E\_η is identically 0.
- `LatticeSpace.trivial` (example): For P\_η = G × Y\_(0,r\](S) with its standard φ⁻¹-structure: S^a = S, ℙ\_η = underline{G(Q\_p)} × S and Latt(P\_η) = underline{G(Q\_p)/𝒢(Z\_p)} × S.
- `LatticeSpace.independence` (other): Latt(P\_η) is unchanged when r is replaced by a smaller r′ and P\_η by its restriction, and does not depend on the pseudo-uniformizer ϖ.

**Unit tests.**

- `LatticeSpace.trivial_test` (degenerate): For P\_η = G × Y\_(0,r\](S) with its standard φ⁻¹-structure: Latt(P\_η) ≅ underline{G(Q\_p)/𝒢(Z\_p)} × S. For 𝒢 = GL\_n the coset g·GL\_n(Z\_p) is the φ⁻¹-module g·O^n\_{Y\_[0,r]} ⊂ O^n\_{Y\_(0,r]}; for 𝒢 = G\_m, Latt(P\_η) = ⊔\_{m∈Z} S, the m-th copy being the extension p^m·O\_{Y\_[0,r]}.
- `LatticeSpace.nonadmissible_test` (non-example): For 𝒢 = G\_m, S non-empty and P\_η the φ⁻¹-equivariant line bundle on Y\_(0,r\](S) corresponding to O\_{X\_FF,S}(d) with d ≠ 0: Latt(P\_η) = ∅, although the underlying line bundle on Y\_(0,r\](S) extends to a line bundle on Y\_[0,r\](S).
- `LatticeSpace.kappa_test` (non-example): Let 𝒯 be the norm-one torus of Z\_{p²}/Z\_p, T its generic fibre and b ∈ T(L) a representative of the non-trivial element of B(T) = X\_\*(T)\_Γ = Z/2. For S non-empty and P\_η the restriction to Y\_(0,r\](S) of the pullback of E\_b: ν\_{P\_η} ≡ 0, because (X\_\*(T) ⊗ Q)^Γ = 0, but κ\_{P\_η} ≡ κ(b) ≠ 0, so S^a = ∅ and Latt(P\_η) = ∅.
- `LatticeSpace.gln_test` (compatibility): For 𝒢 = GL\_n and E\_η = 𝕃\_η ⊗\_{Q\_p} O\_{Y\_(0,r\](S)} with 𝕃\_η a pro-étale Q\_p-local system of rank n on S: Latt(E\_η)(S′) is the set of pro-étale Z\_p-lattices 𝕃 ⊂ 𝕃\_η|\_{S′}, the lattice 𝕃 corresponding to 𝕃 ⊗\_{Z\_p} O\_{Y\_[0,r\](S′)}.
- `LatticeSpace.twoModels_test` (computation): For G = GL\_2, 𝒢 = GL\_2 and 𝒢′ the Iwahori group scheme with 𝒢′(Z\_p) the matrices that are upper triangular modulo p (smooth with connected fibres), and P\_η trivial: Latt\_{𝒢′}(P\_η) → Latt\_𝒢(P\_η) is underline{GL\_2(Q\_p)/𝒢′(Z\_p)} × S → underline{GL\_2(Q\_p)/GL\_2(Z\_p)} × S, finite étale of degree p + 1.

**Uses.**

- HeckeStacksAndLocalShtukas:HS2/hecke-fibre-description: The restriction of a shtuka to Y\_[0,ε\](S) is a φ⁻¹-equivariant 𝒢-torsor, hence a pro-étale 𝒢(Z\_p)-torsor by (a); this is the lattice ℙ of Proposition 23.3.1.
- HeckeStacksAndLocalShtukas:HS2/one-leg-period-map: The fibre of π\_GM over an S-point of the Grassmannian is Latt of the generic torsor near p = 0; (c) gives étaleness, the open admissible locus and the torsor ℙ\_η.
- HeckeStacksAndLocalShtukas:HS2/multi-leg-period-and-representability: The same for several legs (Corollaries 23.4.4, 23.5.3).
- HeckeStacksAndLocalShtukas:HS2/no-legs-and-basic-duality: With no legs the generic torsor is the pullback of E\_b, and Sht\_{𝒢,1,∅} is Latt of the trivial torsor.

**Acceptance.**

- For the trivial φ⁻¹-equivariant torsor P\_η = G × Y\_(0,r\](S): Latt(P\_η) = underline{G(Q\_p)/𝒢(Z\_p)} × S.
- If ν\_{P\_η} is non-zero at every point of S (for instance P\_η comes from a line bundle O(d), d ≠ 0, and 𝒢 = G\_m), then Latt(P\_η) = ∅.
- For the norm-one torus of Q\_{p²}/Q\_p and P\_η of non-trivial Kottwitz class: ν\_{P\_η} ≡ 0 but Latt(P\_η) = ∅; the admissible locus needs both ν = 0 and κ = 0.
- Latt(P\_η) does not depend on r: restriction from Y\_[0,r] to Y\_[0,r′], r′ < r, is an equivalence on φ⁻¹-equivariant 𝒢-torsors by (a).

**Prerequisites.**

- In other roadmaps: `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `VectorBundlesAndIsocrystals:VB4/integral-group-torsors`, `VectorBundlesAndIsocrystals:VB4/integral-boundary-realization`, `BunGAndNewtonStrata:BG2:uniformization/geometrically-trivial-locus`, `BunGAndNewtonStrata:BG2:uniformization/semicontinuity-and-local-constancy`, `BunGAndNewtonStrata:BG2:uniformization/points-are-B-of-G`, `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, `BunGAndNewtonStrata:BG1/classification-by-two-invariants`, `BunGAndNewtonStrata:BG2:uniformization/hn-sign-and-semicontinuity`.

**Sources.**

- Scholze–Weinstein, Theorem 22.6.2, p. 214: Representability, étaleness and the admissible locus defined by ν = 0 and κ = 0.
- Scholze–Weinstein, Theorem 22.6.2, p. 214: The G(Q\_p)-torsor over the admissible locus and the description of Latt by 𝒢(Z\_p)-lattices.
- Scholze–Weinstein, Proposition 22.6.1, p. 213: The classification of φ⁻¹-equivariant integral torsors.
- Scholze–Weinstein, §22.6, p. 213: Standing hypothesis on the integral model.
- Scholze–Weinstein, Corollary 22.3.3, p. 209: The case of vector bundles.
- Scholze–Weinstein, Theorem 22.5.2, p. 212: The equivalence used to produce the torsor ℙ\_η over the admissible locus.
- Scholze–Weinstein, proof of Theorem 22.6.2, p. 214: Étaleness through the local product structure.

### One-leg shtukas as modifications of G-bundles on the Fargues–Fontaine curve

`HS2/hecke-fibre-description` · Comparison

**Comparison.** Let E = Q\_p, (𝒢, b, μ) a local shtuka datum with one leg (HS2/local-shtuka-moduli), F the field of definition of μ, F̆ = F·L and S ∈ Perf\_k. (a) (Scholze–Weinstein, Proposition 23.3.1.) Sht\_{𝒢,b,μ}(S) is in natural bijection with the set of isomorphism classes of quadruples (S♯, E, α, ℙ), where S♯ is an untilt of S over F̆; E is a G-torsor on X\_FF,S that is trivial at every geometric point of S; α : E|\_{X\_FF,S ∖ S♯} ≅ E\_b|\_{X\_FF,S ∖ S♯} is an isomorphism of G-torsors, meromorphic along S♯ and bounded by μ; and ℙ is a 𝒢(Z\_p)-lattice in the pro-étale G(Q\_p)-torsor ℙ\_η of trivialisations of E, that is, a pro-étale 𝒢(Z\_p)-torsor with ℙ ×^{𝒢(Z\_p)} G(Q\_p) = ℙ\_η. For a shtuka (P, S♯, φ\_P, ι): E is the descent of P|\_{Y\_(0,ε)(S)} for ε so small that Y\_(0,ε)(S) is disjoint from S♯; E\_b is the descent of P|\_{Y\_[r,∞)(S)} through ι; α comes from the identity of P away from the Frobenius translates of S♯; and ℙ is the 𝒢(Z\_p)-torsor corresponding to P|\_{Y\_[0,ε\](S)} under HS2/lattice-extension-functor (a). (b) Infinite level. Let M\_∞ = Mod\_{1,b,≤μ} ×\_{Div¹\_F} Spd F̆ (HS2/framed-bundle-fibres); its S-points are the pairs (S♯, α : E\_1 ⇢ E\_b) with α meromorphic along S♯ and bounded by μ, and G(Q\_p) = Aut(E\_1) acts on it by α ↦ α ∘ g⁻¹. The map (S♯, α) ↦ (S♯, E\_1, α, the trivial lattice) identifies Sht\_{𝒢,b,μ} with the quotient M\_∞/𝒢(Z\_p) of pro-étale sheaves, and M\_∞ → Sht\_{𝒢,b,μ} is a pro-étale 𝒢(Z\_p)-torsor. In particular Sht\_{𝒢,b,μ} depends on 𝒢 only through G and the subgroup 𝒢(Z\_p) ⊂ G(Q\_p). (c) Orientation. In (a) the modification goes from the geometrically trivial bundle to E\_b, and for G = G\_m the modification from O to O(D) given by O ⊂ O(D) has type z ↦ z; a local Shimura datum has b ∈ B(G, μ⁻¹) (Scholze–Weinstein, Definition 24.1.1). By HS2/framed-bundle-fibres (e), inversion identifies M\_∞ with Mod\_{b,1,≤μ⁻¹} ×\_{Div¹\_F} Spd F̆, the space of modifications from E\_b to E\_1 bounded by μ⁻¹. Fargues–Scholze (p. 324) print b ∈ B(G, μ) and describe the tower of the datum (G, b, μ) by modifications of type μ that go from E\_b to E\_1. Their Hecke operator T\_μ at a bundle E integrates over the modifications E′ ⇢ E of type μ (pp. 337–338), so the space that computes the restriction to the stratum of b of T\_μ applied to the compact induction from K on the trivial stratum is M\_∞/K, with modifications from E\_1 to E\_b of type μ and b ∈ B(G, μ⁻¹); the condition and the direction printed on p. 324 are those of the tower of the datum (G, b, μ⁻¹).

**Hypotheses and conventions.**

- E = Q\_p. G is a reductive group over Q\_p; k is an algebraic closure of F\_p, L = W(k)[1/p] with Frobenius σ, and S ranges over Perf\_k; wherever Y\_[0,r\](S), Y\_(0,r\](S) or Y\_[r,∞)(S) is written, S = Spa(R,R⁺) is affinoid with a fixed pseudo-uniformizer ϖ.
- 𝒢 is a smooth affine group scheme over Z\_p with generic fibre G and connected special fibre (Scholze–Weinstein §23.1; their torsor formalism in the appendix to Lecture 19 is for flat affine group schemes over Z\_p). 𝒢 is not assumed reductive or parahoric.
- E\_b denotes the G-torsor on X\_FF,S attached to b (the source writes E^b); it has slopes opposite to those of b, so for G = G\_m, E\_b = O(−v\_p(b)). μ⁻¹ denotes the conjugacy class of the inverse cocharacters.

**Proof outline.**

1. From a shtuka to a quadruple (the source's proof). Let S be affinoid and (P, S♯, φ\_P, ι) a point. For ε > 0 with Y\_(0,ε)(S) disjoint from S♯, the restriction of P to Y\_(0,ε)(S) is φ⁻¹-equivariant and descends to a G-torsor E on X\_FF,S. The restriction of P to Y\_[0,ε\](S) is a φ⁻¹-equivariant 𝒢-torsor, hence by HS2/lattice-extension-functor (a) a pro-étale 𝒢(Z\_p)-torsor ℙ on S, whose generic fibre ℙ\_η corresponds to E under the equivalence between pro-étale G(Q\_p)-torsors and geometrically trivial G-torsors on X\_FF,S (Theorem 22.5.2); so E is trivial at geometric points. The pullbacks of E and E\_b to Y\_(0,∞)(S) are both identified φ-equivariantly with P away from ⋃\_{n∈Z} φ^n(S♯), which gives α. Near S♯ the pullback of E is P, and the extended framing P ⇢ G × Y is (b × id) ∘ Frob\_S^\*(ι) ∘ φ\_P⁻¹ with Frob\_S^\*(ι) an isomorphism along S♯ (HS2/local-shtuka-moduli, step 3); hence inv(E, E\_b, α) at the image of S♯ equals inv(P, Frob\_S^\*P, φ\_P⁻¹) at S♯. So meromorphy and the bound of α are those of φ\_P⁻¹, which is the bound in the definition of the shtuka.
2. From a quadruple to a shtuka (not written in the source). Let Ẽ be the pullback of E to Y\_(0,∞)(S); α identifies it φ-equivariantly and meromorphically with G × Y\_(0,∞)(S) away from ⋃\_{n∈Z} φ^n(S♯). The divisors φ^{−n}(S♯), n ≥ 0, are locally finite in Y\_(0,∞)(S). By gluing of G-torsors along Cartier divisors of Y\_S with the trivial torsor as fixed reference (RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing (i), applied on quasicompact opens, which meet finitely many of the divisors; on X\_S it is the construction of RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice), let P\_η be the G-torsor on Y\_(0,∞)(S) which is G × Y away from ⋃\_{n≥0} φ^{−n}(S♯) and is Ẽ near each φ^{−n}(S♯), n ≥ 0. Then P\_η = G × Y on Y\_[r,∞)(S) for r large, which gives ι; P\_η = Ẽ on Y\_(0,ε)(S); and b × Frob\_S induces φ\_{P\_η} : Frob\_S^\*P\_η ≅ P\_η away from S♯, since Frob\_S^\*P\_η is modified at the φ^{−n}(S♯) with n ≥ 1 only. Along S♯ the torsor Frob\_S^\*P\_η is trivial and P\_η is Ẽ, so φ\_{P\_η}⁻¹ : P\_η ⇢ Frob\_S^\*P\_η is α up to isomorphisms regular along S♯, and the shtuka satisfies the bound μ of HS2/local-shtuka-moduli. Finally ℙ extends P\_η|\_{Y\_(0,ε\](S)} to a 𝒢-torsor over Y\_[0,ε\](S) by HS2/lattice-extension-functor. The two constructions are inverse to each other.
3. (b) Pro-étale locally on S the torsor ℙ\_η is trivial and ℙ is the trivial lattice in it, so M\_∞ → Sht\_{𝒢,b,μ} is surjective as a map of pro-étale sheaves; two points (S♯, α), (S♯, α′) have the same image exactly when α′ = α ∘ g⁻¹ with g a section of underline{𝒢(Z\_p)} over S, because an isomorphism of quadruples is an automorphism of E\_1 preserving the lattice. The action of the profinite group 𝒢(Z\_p) is free, so M\_∞ → M\_∞/𝒢(Z\_p) is a torsor.
4. (c) Inversion of modifications is HS2/framed-bundle-fibres (e). Fargues–Scholze identify the local Shimura variety, for b ∈ B(G, μ), with the quotient by K of the space of modifications of type μ that go from E\_b to E\_1, and Scholze–Weinstein define local Shimura data by b ∈ B(G, μ⁻¹) with α from E\_1 to E\_b bounded by μ; replacing μ by μ⁻¹ in one of the two turns it into the other. That the second is the one compatible with T\_μ is seen from the proofs of Fargues–Scholze IX.7.3 and IX.7.4 (pp. 337–338), where the Hecke operator of μ at a bundle E integrates over the modifications E′ ⇢ E of type μ: for G = G\_m and μ(z) = z it carries a sheaf on the stratum of O to the stratum of O(1), that is b = p⁻¹, while the sentence of p. 324 would give the stratum of O(−1).

**Acceptance.**

- μ = 0 (so F = Q\_p): a modification bounded by 0 is an isomorphism E ≅ E\_b, so Sht\_{𝒢,b,0} = ∅ unless [b] = 1, and Sht\_{𝒢,1,0} ≅ underline{G(Q\_p)/𝒢(Z\_p)} × Spd Q̆\_p.
- G = G\_m, μ(z) = z^d: α identifies E(dS♯) with E\_b, so deg E\_b = d and Sht\_{G\_m,b,μ} ≠ ∅ forces v\_p(b) = −d, that is κ(b) = −d and b ∈ B(G\_m, μ⁻¹); by inversion the same space consists of the modifications from E\_b = O(d) to O of type z ↦ z^{−d}.
- G = GL\_n, μ = (1^d, 0^{n−d}): α is an injection E ↪ E\_b of vector bundles whose cokernel is supported on S♯ and locally free of rank d over O\_{S♯} (Scholze–Weinstein §24.2: 0 → F → E\_b → i\_{∞\*}Lie X → 0); hence deg E\_b = d and κ(b) = −d.
- The 𝒢(Z\_p)-orbits on M\_∞ are the fibres of M\_∞ → Sht\_{𝒢,b,μ}.

**Prerequisites.**

- In this roadmap: `HS2/framed-bundle-fibres`, `HS2/lattice-extension-functor`, `HS2/local-shtuka-moduli`.
- In other roadmaps: `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`, `BunGAndNewtonStrata:BG2:uniformization/geometrically-trivial-locus`, `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`.

**Sources.**

- Scholze–Weinstein, Proposition 23.3.1, p. 218: The bijection of (a).
- Scholze–Weinstein, Proposition 23.3.1, p. 218: Direction of α (from E to E\_b), its bound μ and the lattice.
- Scholze–Weinstein, proof of Proposition 23.3.1, p. 218: Construction of α from a shtuka.
- Scholze–Weinstein, §23.3, p. 219: The infinite-level space of (b).
- Fargues–Scholze, proof of Theorem IX.3.1, p. 324: The direction printed in the source, from E\_b to E\_1; with its Hecke operators the modification goes from E\_1 to E\_b.
- Fargues–Scholze, IX.3, p. 324: The condition b ∈ B(G, μ) as printed; for the tower of (G, b, μ) it is b ∈ B(G, μ⁻¹).
- Scholze–Weinstein, Definition 24.1.1, p. 225: The Scholze–Weinstein condition b ∈ B(G, μ⁻¹).

### The étale period morphism π\_GM and the admissible locus (one leg)

`HS2/one-leg-period-map` · Theorem

**Theorem.** Let E = Q\_p, (𝒢, b, μ) a local shtuka datum with one leg, F the field of definition of μ and F̆ = F·L. (a) Period morphism. For an S-point (S♯, E, α, ℙ) of Sht\_{𝒢,b,μ} (HS2/hecke-fibre-description), with S♯ = Spa(R♯,R♯⁺), the pullback of E\_b to S ×̇ Spa Q\_p is the trivial G-torsor, so the pullback of E to B⁺\_dR(R♯) is a G-torsor over B⁺\_dR(R♯) with a trivialisation over B\_dR(R♯) induced by α. This is an S-point of Gr\_{G,Spd F̆,≤μ}, and defines π\_GM : Sht\_{𝒢,b,μ} → Gr\_{G,Spd F̆,≤μ} over Spd F̆. (b) Admissible locus. An S-point of Gr\_{G,Spd F̆,≤μ} is a modification E ⇢ E\_b of E\_b on X\_FF,S; the locus S^a ⊂ S where E is trivial at geometric points is open. These loci define an open subfunctor Gr^a\_{G,Spd F̆,≤μ} ⊂ Gr\_{G,Spd F̆,≤μ}, the admissible locus, which depends on b; over it E corresponds to a pro-étale G(Q\_p)-torsor ℙ\_η. (c) (Proposition 23.3.3.) π\_GM is étale with image Gr^a\_{G,Spd F̆,≤μ}. Its fibre over an S-point is the sheaf of 𝒢(Z\_p)-lattices in ℙ\_η, so Sht\_{𝒢,b,μ} ≅ ℙ\_η/𝒢(Z\_p) over Gr^a; pro-étale locally on S the fibre is S^a × G(Q\_p)/𝒢(Z\_p) → S. More generally, for every compact open K ⊂ G(Q\_p) the sheaf ℙ\_η/K of K-lattices in ℙ\_η is étale over Gr\_{G,Spd F̆,≤μ}, with image Gr^a. (d) (Remark 23.3.4.) Gr\_{G,Spd F̆,≤μ} is a spatial diamond, hence Sht\_{𝒢,b,μ} and all ℙ\_η/K are locally spatial diamonds. (e) ℙ\_η → Gr^a\_{G,Spd F̆,≤μ} is a pro-étale G(Q\_p)-torsor; in particular it is quasi-pro-étale. If the admissible locus is nonempty and dim G > 0, it is not étale, its fibres being torsors under the non-discrete group G(Q\_p). The source states that it is a pro-étale G(Q\_p)-torsor; quasi-pro-étaleness is the formal consequence.

**Hypotheses and conventions.**

- E = Q\_p. G is a reductive group over Q\_p; k is an algebraic closure of F\_p, L = W(k)[1/p] with Frobenius σ, and S ranges over Perf\_k; wherever Y\_[0,r\](S), Y\_(0,r\](S) or Y\_[r,∞)(S) is written, S = Spa(R,R⁺) is affinoid with a fixed pseudo-uniformizer ϖ.
- 𝒢 is a smooth affine group scheme over Z\_p with generic fibre G and connected special fibre (Scholze–Weinstein §23.1; their torsor formalism in the appendix to Lecture 19 is for flat affine group schemes over Z\_p). 𝒢 is not assumed reductive or parahoric.
- Gr\_{G,Spd F̆,≤μ} is the bounded B⁺\_dR-affine Grassmannian over Spd F̆ of GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness: S-points are untilts S♯ over F̆ with a G-torsor over B⁺\_dR(R♯) trivialised over B\_dR(R♯), bounded by μ (Scholze–Weinstein, Propositions 20.2.2–20.2.3).

**Proof outline.**

1. (a) is the construction preceding Proposition 23.3.3: the Grassmannian is described by B⁺\_dR-lattices (Proposition 20.2.2), and α is bounded by μ, so the point lies in the Schubert variety.
2. (b) Let S → Gr\_{G,Spd F̆,≤μ} be a point, E ⇢ E\_b the corresponding modification. Restricting the pullback of E to Y\_(0,r\](S) for small r gives a φ⁻¹-equivariant G-torsor P\_η whose invariants ν, κ are those of E; by HS2/lattice-extension-functor (c) the locus S^a where E is geometrically trivial is open and carries the pro-étale G(Q\_p)-torsor ℙ\_η. Openness for all S gives the open subfunctor Gr^a.
3. (c) By HS2/hecke-fibre-description (a) a lift of the point to Sht\_{𝒢,b,μ} is a 𝒢(Z\_p)-lattice ℙ in ℙ\_η, so the fibre of π\_GM over S is Latt(P\_η) = ℙ\_η/𝒢(Z\_p), which is étale over S with image S^a and pro-étale locally the projection S^a × G(Q\_p)/𝒢(Z\_p) → S. For general K the coset bundle ℙ\_η/K is separated étale over S^a by DiamondsAndVStacks:D3/locally-profinite-torsors.
4. (d) Gr\_{G,Spd F̆,≤μ} is a spatial diamond (Proposition 20.2.3). An étale map is quasi-pro-étale and locally separated, so its source is a locally spatial diamond when its target is (DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence).
5. (e) A torsor under the locally profinite group G(Q\_p) that is pro-étale locally trivial becomes, over any strictly totally disconnected space, a disjoint union of copies of the base times profinite sets, which is pro-étale over the base.

**Acceptance.**

- For G = G\_m and μ(z) = z^d: Gr\_{G\_m,Spd Q̆\_p,≤μ} = Spd Q̆\_p; the admissible locus is all of it if v\_p(b) = −d and empty otherwise.
- For G = GL\_2, μ = (1,0) and b basic with κ(b) = −1: Gr^a is all of (P¹\_{Q̆\_p})^◇ and π\_GM is the Gross–Hopkins period map of the Lubin–Tate space, with geometric fibres GL\_2(Q\_p)/GL\_2(Z\_p).
- For G = GL\_2, μ = (1,0) and b = diag(p⁻¹, 1): E\_b = O(1) ⊕ O, and Gr^a is the complement in (P¹\_{Q̆\_p})^◇ of the single Q̆\_p-rational point at which the modified bundle is O(1) ⊕ O(−1); so Gr^a is open and not closed.
- Over a point of Gr^a at which ℙ\_η is trivialised, the fibre of ℙ\_η/K is G(Q\_p)/K and the fibre of ℙ\_η is G(Q\_p).
- For G = G\_m, μ = 1 and b = p, the admissible locus is empty, so the universal torsor maps from the empty diamond to the empty diamond and is étale. This checks the nonemptiness hypothesis in (e).

**Prerequisites.**

- In this roadmap: `HS2/hecke-fibre-description`, `HS2/lattice-extension-functor`.
- In other roadmaps: `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`.

**Sources.**

- Scholze–Weinstein, Proposition 23.3.3, p. 220: Étaleness of the period morphism at every level K.
- Scholze–Weinstein, Remark 23.3.4, p. 220: Local spatiality of the finite levels.
- Scholze–Weinstein, proof of Proposition 23.3.3, p. 220: The fibre of the period map.
- Scholze–Weinstein, proof of Proposition 23.3.3, p. 220: The open admissible locus of the Grassmannian.
- Scholze–Weinstein, §23.4, p. 221: The infinite level as a pro-étale torsor.

### Level structures: the tower (Sht\_K)\_K and its limit Sht\_∞

`HS2/levels-and-tower-limit` · Construction · planet: **Tower of moduli spaces of local shtukas**

**Construction.** Let E = Q\_p, (𝒢, b, μ) a local shtuka datum with one leg, Gr^a = Gr^a\_{G,Spd F̆,≤μ} the admissible locus and ℙ\_η → Gr^a the pro-étale G(Q\_p)-torsor of HS2/one-leg-period-map, on which G(Q\_p) acts on the right. (a) Levels. For a compact open subgroup K ⊂ G(Q\_p), Sht\_{G,b,μ,K} := ℙ\_η/K = ℙ\_η ×^{G(Q\_p)} G(Q\_p)/K. Its S-points are the quadruples (S♯, E, α, ℙ) as in HS2/hecke-fibre-description with ℙ a pro-étale K-torsor and an identification ℙ ×^K G(Q\_p) = ℙ\_η (a K-lattice in ℙ\_η). For K = 𝒢(Z\_p) it is Sht\_{𝒢,b,μ}. The period map π\_K : Sht\_{G,b,μ,K} → Gr\_{G,Spd F̆,≤μ} is separated and étale with image Gr^a. (b) Transition maps. For compact open K′ ⊂ K the map Sht\_{G,b,μ,K′} → Sht\_{G,b,μ,K}, ℙ ↦ ℙ ×^{K′} K, is finite étale and surjective, with fibres K/K′, hence of degree [K : K′]; it is a K/K′-torsor when K′ is normal in K. The maps are compatible for K″ ⊂ K′ ⊂ K and with the π\_K. (c) Limit. Sht\_{G,b,μ,∞} := lim\_K Sht\_{G,b,μ,K}, the limit over all compact open K, is ℙ\_η: its S-points are the pairs (S♯, α : E\_1 ⇢ E\_b) with α meromorphic along S♯ and bounded by μ, and Sht\_{G,b,μ,∞} → Sht\_{G,b,μ,K} is a K-torsor. The limit may be taken over any family of compact open subgroups that is a neighbourhood basis of 1; the compact open pro-p subgroups form such a family. (d) Actions. g ∈ G(Q\_p) acts on Sht\_{G,b,μ,∞} by α ↦ α ∘ g⁻¹ (through Aut(E\_1) = G(Q\_p)) and induces isomorphisms Sht\_{G,b,μ,K} ≅ Sht\_{G,b,μ,gKg⁻¹} compatible with the transition maps. This is the left action g·x = x·g⁻¹ attached to the right action x·g = α ∘ g of the torsor structure of ℙ\_η; right translation by g is an isomorphism Sht\_{G,b,μ,K} ≅ Sht\_{G,b,μ,g⁻¹Kg}, namely the isomorphism of the left action of g⁻¹. J\_b(Q\_p) acts on every Sht\_{G,b,μ,K} and on Sht\_{G,b,μ,∞} by α ↦ j ∘ α (through Aut(E\_b)), compatibly with the transition maps; the two actions commute, and both are continuous: they are actions of the v-sheaves of groups underline{G(Q\_p)} and underline{J\_b(Q\_p)}. (e) Functoriality. For a homomorphism f : G → H of reductive groups over Q\_p, b\_H = f(b), μ\_H = f ∘ μ and compact open subgroups with f(K) ⊂ K\_H, there is a map Sht\_{G,b,μ,K} → Sht\_{H,b\_H,μ\_H,K\_H} of diamonds over the reflex bases; for f = id it is the transition map. (f) Generality. (a)–(d) use only that ℙ\_η is a pro-étale torsor under a locally profinite group over a v-sheaf. They apply verbatim to the G(Q\_p)-torsor over the admissible locus of the twisted Grassmannian for several legs (Scholze–Weinstein, Corollary 23.5.3 and the lines after it), and to the two-bundle spaces of HS2/framed-bundle-fibres: for compact open K′ ⊂ K contained in G\_b(E) (acting on the source bundle, α ↦ α ∘ g⁻¹) or in G\_b′(E) (acting on the target bundle, α ↦ g′ ∘ α) the quotients Mod^I\_{b,b′,≤μ•}/K are defined, Mod^I\_{b,b′,≤μ•}/K′ → Mod^I\_{b,b′,≤μ•}/K is finite étale of degree [K : K′], and lim\_K Mod^I\_{b,b′,≤μ•}/K = Mod^I\_{b,b′,≤μ•}; the case used in HS3 is b = 1 with K ⊂ G(E) acting on the source. In the source: finite étaleness, the torsor property for normal K′, the limit, the two actions and their continuity (Scholze–Weinstein pp. 219, 224) and (e) (Gleason–Lim–Xu §3.4). Not in the sources and proved in the steps: the degree [K : K′], separatedness of π\_K, cofinality of pro-p subgroups, and (f) for the two-bundle spaces.

**Hypotheses and conventions.**

- E = Q\_p. G is a reductive group over Q\_p; k is an algebraic closure of F\_p, L = W(k)[1/p] with Frobenius σ, and S ranges over Perf\_k; wherever Y\_[0,r\](S), Y\_(0,r\](S) or Y\_[r,∞)(S) is written, S = Spa(R,R⁺) is affinoid with a fixed pseudo-uniformizer ϖ.
- The construction uses only that ℙ\_η is a pro-étale torsor under the locally profinite group G(E) over a v-sheaf; it applies verbatim to a pro-étale G(E)-torsor for a general nonarchimedean local field E, with K ranging over compact open subgroups of G(E), which is the generality of the tower of Fargues–Scholze IX.3, p. 325.
- K, K′ always denote compact open subgroups, so [K : K′] is finite.

**Construction.**

1. (a), (b) For a pro-étale torsor X̃ → X under a locally profinite group H and an open subgroup K ⊂ H, the pushout X̃\_K = X̃ ×^H H/K is separated étale over X, and X̃\_{K′} → X̃\_K is finite étale when K′ ⊂ K has finite index (DiamondsAndVStacks:D3/locally-profinite-torsors); pro-étale locally on X the map is X × H/K′ → X × H/K, whose fibres are K/K′. Apply this to ℙ\_η → Gr^a and compose with the open immersion Gr^a ⊂ Gr\_{G,Spd F̆,≤μ}. Points of ℙ\_η/K over S are K-torsors ℙ ⊂ ℙ\_η, which is the description by quadruples; for K = 𝒢(Z\_p) this is HS2/one-leg-period-map (c).
2. (c) The same theorem, with DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons, gives X̃ = lim\_K X̃\_K; pro-étale locally this is the homeomorphism H ≅ lim\_K H/K of a locally profinite group with the limit of its discrete coset spaces, which holds for any family of compact open subgroups forming a neighbourhood basis of 1. The description of the points of ℙ\_η is HS2/hecke-fibre-description (b). Pro-p subgroups: G(Q\_p) is a closed subgroup of some GL\_n(Q\_p), and the subgroups G(Q\_p) ∩ (1 + p^m M\_n(Z\_p)), m ≥ 1, are compact open pro-p and form a neighbourhood basis of 1.
3. (d) G(Q\_p) = Aut(E\_1) and J\_b(Q\_p) ⊂ Aut(E\_b) act on pairs (S♯, α) by pre- and postcomposition (HS2/framed-bundle-fibres (b)); they commute. The automorphism α ↦ α ∘ g⁻¹ of ℙ\_η maps the K-orbit of α onto the gKg⁻¹-orbit of α ∘ g⁻¹, hence descends to an isomorphism ℙ\_η/K ≅ ℙ\_η/gKg⁻¹. The J\_b(Q\_p)-action commutes with the G(Q\_p)-action on ℙ\_η, hence descends to every ℙ\_η/K. Continuity: both actions are induced by the actions of the v-sheaves of groups Aut(E\_1) = underline{G(Q\_p)} and underline{J\_b(Q\_p)} ⊂ Aut(E\_b) on the two bundles.
4. (e) f induces a map of Grassmannians preserving the bounds, f\_\*E\_b = E\_{f(b)}, and a map of torsors ℙ\_η ×^{G(Q\_p)} H(Q\_p) → ℙ^H\_η over the admissible loci; a K-lattice ℙ is sent to the K\_H-lattice ℙ ×^K K\_H when f(K) ⊂ K\_H (Gleason–Lim–Xu (3.6)).
5. (f) For several legs the argument is word for word the same (Corollary 23.5.3 and the lines after it). For Mod^I\_{b,b′,≤μ•} the group underline{K} ⊂ underline{G\_b′(E)} ⊂ G̃\_b′ acts freely: g′ ∘ α = α forces g′ = id away from the legs, hence everywhere; in the same way underline{K} ⊂ underline{G\_b(E)} ⊂ G̃\_b acts freely, since α ∘ g⁻¹ = α forces g = id away from the legs. So Mod → Mod/K is a torsor under the profinite group K for the v-topology, and the statements follow from DiamondsAndVStacks:D3/locally-profinite-torsors as in (b), (c).

**API.**

- `LevelTower.level` (constructor): For a compact open K ⊂ G(Q\_p): Sht\_{G,b,μ,K} = ℙ\_η/K; an S-point is a K-lattice ℙ in ℙ\_η|\_S, i.e. a pro-étale K-torsor ℙ with an identification ℙ ×^K G(Q\_p) = ℙ\_η|\_S.
- `LevelTower.period` (projection): π\_K : Sht\_{G,b,μ,K} → Gr\_{G,Spd F̆,≤μ} is separated étale with image the admissible locus; pro-étale locally on the admissible locus it is the projection from the product with the discrete set G(Q\_p)/K.
- `LevelTower.integralLevel` (compatibility): Sht\_{G,b,μ,𝒢(Z\_p)} = Sht\_{𝒢,b,μ}, the moduli space of HS2/local-shtuka-moduli; it depends on 𝒢 only through 𝒢(Z\_p).
- `LevelTower.transition` (functoriality): For K′ ⊂ K: t\_{K′,K} : Sht\_{G,b,μ,K′} → Sht\_{G,b,μ,K}, ℙ ↦ ℙ ×^{K′} K, is finite étale surjective of degree [K : K′]; t\_{K,K} = id, t\_{K′,K} ∘ t\_{K″,K′} = t\_{K″,K}, and π\_K ∘ t\_{K′,K} = π\_{K′}.
- `LevelTower.transition_torsor` (characterisation): If K′ is normal in K, then K/K′ acts on Sht\_{G,b,μ,K′} over Sht\_{G,b,μ,K} and t\_{K′,K} is a K/K′-torsor.
- `LevelTower.limit` (universal-property): Sht\_{G,b,μ,∞} = ℙ\_η with the maps Sht\_{G,b,μ,∞} → Sht\_{G,b,μ,K} is the limit of the tower in v-sheaves: a compatible family of maps T → Sht\_{G,b,μ,K} is a unique map T → ℙ\_η. Each Sht\_{G,b,μ,∞} → Sht\_{G,b,μ,K} is a K-torsor, so Sht\_{G,b,μ,K} = Sht\_{G,b,μ,∞}/K.
- `LevelTower.limit_points` (characterisation): Sht\_{G,b,μ,∞}(S) is the set of pairs (S♯, α) with S♯ an untilt of S over F̆ and α : E\_1 ⇢ E\_b a modification at S♯ bounded by μ.
- `LevelTower.cofinal` (other): If 𝒦 is a set of compact open subgroups forming a neighbourhood basis of 1 in G(Q\_p), then lim\_{K∈𝒦} Sht\_{G,b,μ,K} = Sht\_{G,b,μ,∞}; the compact open pro-p subgroups form such a set.
- `LevelTower.heckeAction` (structure): g ∈ G(Q\_p) induces isomorphisms Sht\_{G,b,μ,K} ≅ Sht\_{G,b,μ,gKg⁻¹}, compatible with transition maps and with composition in G(Q\_p); on the limit this is the action of underline{G(Q\_p)} on ℙ\_η.
- `LevelTower.sigmaCentralizerAction` (structure): underline{J\_b(Q\_p)} acts on every Sht\_{G,b,μ,K} and on Sht\_{G,b,μ,∞}, compatibly with transition maps and commuting with the action of G(Q\_p).
- `LevelTower.map` (functoriality): For f : G → H with f(K) ⊂ K\_H: a map Sht\_{G,b,μ,K} → Sht\_{H,f(b),f∘μ,K\_H}, compatible with transition maps on both sides and with composition of homomorphisms.

**Unit tests.**

- `LevelTower.noLegs_test` (degenerate): For no legs and b = 1 (the case m = 0 of (f), where the twisted Grassmannian is Spd k and the torsor is underline{G(Q\_p)} × Spd k): Sht\_{G,1,∅,K} = underline{G(Q\_p)/K} × Spd k, the transition map for K′ ⊂ K is induced by gK′ ↦ gK, and lim\_K Sht\_{G,1,∅,K} = underline{G(Q\_p)} × Spd k, whose S-points are the continuous maps |S| → G(Q\_p), not only the locally constant ones.
- `LevelTower.torus_test` (computation): For G = G\_m, μ(z) = z^d, v\_p(b) = −d, K\_0 = Z\_p^× and K\_n = 1 + p^n Z\_p (n ≥ 1): each geometric fibre of Sht\_{G\_m,b,μ,K\_n} over Spd Q̆\_p is Q\_p^×/K\_n ≅ Z × (Z/p^n)^×, and Sht\_{G\_m,b,μ,K\_n} → Sht\_{G\_m,b,μ,K\_0} is a (Z/p^n)^×-torsor, of degree (p−1)p^{n−1}.
- `LevelTower.iwahori_test` (non-example): For G = GL\_2, K = GL\_2(Z\_p) and K′ ⊂ K the subgroup of matrices that are upper triangular modulo p: Sht\_{K′} → Sht\_K is finite étale of degree p + 1 = |P¹(F\_p)| and K′ is not normal in K, so no group K/K′ acts; for K″ = ker(GL\_2(Z\_p) → GL\_2(F\_p)) the map Sht\_{K″} → Sht\_K is a GL\_2(F\_p)-torsor of degree (p² − 1)(p² − p).
- `LevelTower.integralLevel_test` (compatibility): For K = 𝒢(Z\_p): Sht\_{G,b,μ,𝒢(Z\_p)} = Sht\_{𝒢,b,μ}. If 𝒢 and 𝒢′ are two smooth models of G with connected special fibres and 𝒢(Z\_p) = 𝒢′(Z\_p), then Sht\_{𝒢,b,μ} = Sht\_{𝒢′,b,μ}.
- `LevelTower.hecke_test` (characterisation): For g ∈ G(Q\_p) the isomorphism Sht\_K ≅ Sht\_{gKg⁻¹} is, on the no-leg tower with b = 1 of (f) (points hK, h ∈ G(Q\_p)), the map hK ↦ hg⁻¹·(gKg⁻¹); for g ∈ K it is the identity of Sht\_K, and for g normalising K it is the right translation hK ↦ hg⁻¹K.

**Uses.**

- HeckeStacksAndLocalShtukas:HS2/multi-leg-period-and-representability: The multi-leg tower is the tower of coset bundles of the torsor over the admissible locus of the twisted Grassmannian.
- HeckeStacksAndLocalShtukas:HS2/no-legs-and-basic-duality: The duality isomorphism is stated at infinite level and is equivariant for G(Q\_p) × J\_b(Q\_p).
- HeckeStacksAndLocalShtukas:HS3/compact-support-at-levels: The complexes C\_K are indexed by the levels; cofinal pro-p levels are used for compactness.
- HeckeStacksAndLocalShtukas:HS3/level-trace-and-pullback: Pullback and trace along the finite étale transition maps of degree [K : K′].
- Gleason–Lim–Xu §3.4, (3.7)–(3.8): The determinant map to the tower of G^ab at level det(K) and the change-of-level maps are instances of the functoriality (e).

**Acceptance.**

- No legs, b = 1: Sht\_{G,1,∅,K} = underline{G(Q\_p)/K} × Spd k and the limit is underline{G(Q\_p)} × Spd k.
- G = GL\_2, K = GL\_2(Z\_p), K′ the Iwahori subgroup: the transition map has degree p + 1 and K′ is not normal in K; for K″ = ker(GL\_2(Z\_p) → GL\_2(F\_p)) it is a GL\_2(F\_p)-torsor.
- G = G\_m, μ(z) = z^d, v\_p(b) = −d: the geometric fibres of Sht\_{G\_m,b,μ,K} over Spd Q̆\_p are Q\_p^×/K.
- The map Sht\_∞ → Sht\_K is a K-torsor and Sht\_K is not the quotient of Sht\_∞ by a normal subgroup of G(Q\_p) in general: G(Q\_p) permutes the levels by K ↦ gKg⁻¹.

**Prerequisites.**

- In this roadmap: `HS2/one-leg-period-map`, `HS2/framed-bundle-fibres`.
- In other roadmaps: `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `ReductiveGroupsPartII:RG2.0`.

**Sources.**

- Scholze–Weinstein, §23.3, p. 219: Definition of the level-K space.
- Scholze–Weinstein, §23.3, p. 219: Transition maps and the action of J\_b(Q\_p).
- Scholze–Weinstein, §23.3, p. 219: The two commuting actions on the limit.
- Scholze–Weinstein, after Corollary 23.5.3, p. 224: The tower and its inverse limit, for any number of legs.
- Gleason–Lim–Xu, §3.4, p. 824: Functoriality in the group and the level.
- Fargues–Scholze, IX.3, p. 325: The tower for a general local field E, used by HS2/general-local-field.

### Period maps for several legs; Sht is a locally spatial diamond

`HS2/multi-leg-period-and-representability` · Theorem · planet: **Sht\_{𝒢,b,μ•} is a locally spatial diamond**

**Theorem.** Let E = Q\_p and (𝒢, b, μ•) a local shtuka datum with legs i = 1, …, m (m ≥ 0), F\_i the field of definition of μ\_i, and B = Spd F̆\_1 ×\_{Spd k} ⋯ ×\_{Spd k} Spd F̆\_m. (a) (Corollary 23.5.3.) Restricting (P, φ\_P, ι) to S ×̇ Spa Q\_p defines the period map π\_GM : Sht\_{𝒢,b,μ•} → Gr^tw\_{G,B,≤μ•} to the twisted Grassmannian of HS0/twisted-period-grassmannian, and π\_GM is étale. (b) Its image is an open subfunctor Gr^{tw,a}\_{G,B,≤μ•}, the admissible locus: the locus where the G-torsor on X\_FF,S obtained from P\_η near p = 0 is trivial at geometric points. Over it there is a pro-étale G(Q\_p)-torsor ℙ\_η, and Sht\_{𝒢,b,μ•} parametrises the 𝒢(Z\_p)-lattices in ℙ\_η. (c) (Theorem 23.1.4.) Sht\_{𝒢,b,μ•} is a locally spatial diamond. It depends on 𝒢 only through G and 𝒢(Z\_p). For every compact open K ⊂ G(Q\_p) the space Sht\_{G,b,μ•,K} of K-lattices in ℙ\_η is a locally spatial diamond, étale over Gr^tw\_{G,B,≤μ•}; these spaces form a tower of finite étale covers whose inverse limit is the G(Q\_p)-torsor Sht\_{G,b,μ•,∞} = ℙ\_η → Gr^{tw,a}\_{G,B,≤μ•} (HS2/levels-and-tower-limit). (d) Gr^tw\_{G,B,≤μ•} → B is proper and representable in spatial diamonds (Proposition 23.5.2), but Sht\_{G,b,μ•,K} → B is in general neither proper nor quasicompact: for m = 0 and b = 1 it is underline{G(Q\_p)/K} × Spd k → Spd k. (e) Comparison with the Hecke fibre. Let M\_∞ be the pullback of Mod^I\_{1,b,≤μ•} (HS2/framed-bundle-fibres, I = {1, …, m}) along B → ∏\_i Div¹\_{F\_i}, where Div¹\_{F\_i} = Spd F̆\_i/φ\_i^Z with φ\_i the Frobenius of the factor Spd F\_i of Spd F̆\_i = Spd F\_i ×\_{Spd κ\_i} Spd k, which covers the f\_i-th power of the Frobenius of the factor Spd Q\_p of Spd Q̆\_p, f\_i being the residue degree of F\_i. From a point of Sht\_{G,b,μ•,∞} one obtains the two bundles E\_1 (near p = 0, with its trivialisation) and E\_b (near [ϖ] = 0) on X\_FF,S, identified away from the images of the legs. Over the open locus U ⊂ B where no leg is a non-trivial Frobenius translate of another, that is S\_i♯ ≠ φ^n(S\_j♯) at every geometric point for all i ≠ j and all n ≠ 0 (the complement of the Frobenius-twisted partial diagonals; legs may coincide, and two legs over U have the same image in X\_FF,S exactly when they are equal), this is an isomorphism Sht\_{G,b,μ•,∞} ≅ M\_∞, equivariant for G(Q\_p) × J\_b(Q\_p) (Fargues–Scholze, proof of Proposition IX.3.2, where the modifications are printed as going from E\_b to the trivial bundle). Where a leg meets a non-trivial Frobenius translate of another leg, the infinite-level space is not described by a boundedness condition on a modification E\_1 ⇢ E\_b alone but includes intermediate modifications (Scholze–Weinstein §23.4), and no identification with M\_∞ is asserted there. For one leg (e) is HS2/hecke-fibre-description (b).

**Hypotheses and conventions.**

- E = Q\_p. G is a reductive group over Q\_p; k is an algebraic closure of F\_p, L = W(k)[1/p] with Frobenius σ, and S ranges over Perf\_k; wherever Y\_[0,r\](S), Y\_(0,r\](S) or Y\_[r,∞)(S) is written, S = Spa(R,R⁺) is affinoid with a fixed pseudo-uniformizer ϖ.
- 𝒢 is a smooth affine group scheme over Z\_p with generic fibre G and connected special fibre (Scholze–Weinstein §23.1; their torsor formalism in the appendix to Lecture 19 is for flat affine group schemes over Z\_p). 𝒢 is not assumed reductive or parahoric.
- Gr^tw\_{G,B,≤μ•} is the functor of Scholze–Weinstein, Definition 23.5.1: G-torsors P\_η on S ×̇ Spa Q\_p with φ\_{P\_η} meromorphic along the legs, a framing ι\_r near infinity identifying φ\_{P\_η} with b × Frob\_S, and the bound Σ\_{j : S\_j♯ = S\_i♯} μ\_j at S\_i♯.

**Proof outline.**

1. (a), (b) The source gives no separate proof and says only that the one-leg arguments carry over. Work over a quasicompact open U ⊂ B; there is ε > 0 with all legs in Y\_[ε,∞)(S) (proof of Proposition 23.5.2). For an S-point (P\_η, φ, ι) of Gr^tw over U, the restriction of P\_η to Y\_(0,r\](S), r < ε, is a G-torsor with an isomorphism with its φ⁻¹-pullback, and the fibre of π\_GM over S is the functor of extensions of P\_η to a 𝒢-torsor on S ×̇ Spa Z\_p compatible with φ, that is Latt(P\_η|\_{Y\_(0,r\](S)}). By HS2/lattice-extension-functor (c) it is étale over S with open image S^a, over which there is the torsor ℙ\_η and Latt = ℙ\_η/𝒢(Z\_p).
2. (c) Gr^tw\_{G,B,≤μ•} → B is representable in spatial diamonds and B is a locally spatial diamond (Proposition 23.5.2 and its proof), so Gr^tw\_{G,B,≤μ•} is a locally spatial diamond; an étale map into a locally spatial diamond has locally spatial source (as in HS2/one-leg-period-map (d)). The levels and the limit are HS2/levels-and-tower-limit applied to ℙ\_η → Gr^{tw,a}.
3. (d) Properness is Proposition 23.5.2 (HS0/twisted-period-grassmannian). For m = 0 and b = 1 the twisted Grassmannian is Spd k, the torsor ℙ\_η of (b) is the trivial G(Q\_p)-torsor, and Sht\_{G,1,∅,K} = ℙ\_η/K = underline{G(Q\_p)/K} × Spd k (for K = 𝒢(Z\_p) this is Proposition 23.2.1); it is not quasicompact when G(Q\_p)/K is infinite.
4. (e) A point of Sht\_{G,b,μ•,∞} = ℙ\_η is a point (P\_η, φ, ι) of the admissible locus together with a trivialisation of the geometrically trivial G-torsor E on X\_FF,S obtained from P\_η near p = 0, that is, an isomorphism E\_1 ≅ E. As in HS2/hecke-fibre-description, P\_η near [ϖ] = 0 descends to E\_b through ι, and the identity of P\_η away from all Frobenius translates of the legs gives α : E\_1 ⇢ E\_b. Over U no leg meets φ^{−n}(S\_j♯) for any j and any n ≥ 1. Hence along the divisor Σ\_i S\_i♯ the extended framing is φ\_P⁻¹ followed by an isomorphism that is regular along the legs (HS2/local-shtuka-moduli, step 3); the divisor Σ\_i S\_i♯ of Y\_(0,∞)(S) maps isomorphically onto the divisor Σ\_i D\_i of the images in X\_FF,S, so that the completions along the two agree; and D\_i = D\_j exactly when S\_i♯ = S\_j♯. So the position of E\_1 relative to E\_b at D\_i is the position of P\_η relative to Frob\_S^\*P\_η at S\_i♯, and the bound Σ\_{j : S\_j♯ = S\_i♯} μ\_j is the same on both sides. Conversely, over U the translates φ^{−n}(Σ\_i S\_i♯), n ≥ 0, are pairwise disjoint and locally finite, and the construction is reversed as in step 2 of HS2/hecke-fibre-description with Σ\_i S\_i♯ in place of S♯ (Fargues–Scholze p. 327 say that the procedure can be reversed when the images of the legs in X\_S are disjoint, which is the case of pairwise distinct legs). For two legs the targets already differ on the Frobenius-twisted diagonals: Gr^tw is the Beilinson–Drinfeld Grassmannian only away from (φ × 1)^n(Δ), n ≠ 0 (Definition 23.4.1).

**Acceptance.**

- m = 1: Gr^tw\_{G,Spd F̆,≤μ} = Gr\_{G,Spd F̆,≤μ} and the statement is Proposition 23.3.3 with Remark 23.3.4.
- m = 0: Gr^tw is Spd k, the admissible locus is Spd k if [b] = 1 and empty otherwise, and the statement is Proposition 23.2.1.
- m = 2, G = G\_m, μ\_1(z) = z, μ\_2(z) = z⁻¹, b = 1: Gr^tw\_{G\_m,B,≤μ•} = B = Spd Q̆\_p ×\_{Spd k} Spd Q̆\_p, all of it is admissible (the modified line bundle has degree 0), and Sht\_{G\_m,1,μ•} → B is surjective with geometric fibres Q\_p^×/Z\_p^×.
- Sht\_{G,b,μ•,K} → B is not quasicompact when G(Q\_p)/K is infinite and the admissible locus is non-empty.

**Prerequisites.**

- In this roadmap: `HS0/twisted-period-grassmannian`, `HS2/lattice-extension-functor`, `HS2/levels-and-tower-limit`, `HS2/local-shtuka-moduli`, `HS2/framed-bundle-fibres`, `HS2/hecke-fibre-description`.
- In other roadmaps: `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`.

**Sources.**

- Scholze–Weinstein, Corollary 23.5.3, p. 224: Étale period map, local spatiality and the admissible locus.
- Scholze–Weinstein, Corollary 23.5.3, p. 224: The torsor on the admissible locus and the lattice description.
- Scholze–Weinstein, Theorem 23.1.4, p. 217: The main theorem.
- Scholze–Weinstein, Proposition 23.5.2, p. 223: Properness of the bounded twisted Grassmannian over the leg base.
- Scholze–Weinstein, after Corollary 23.5.3, p. 224: Independence of the model and the levels.
- Fargues–Scholze, proof of Proposition IX.3.2, p. 326: Comparison of the tower with the fibre of the Hecke correspondence.
- Scholze–Weinstein, §23.4, p. 221: The infinite level as a torsor over the admissible locus.

### The case of no legs; duality of basic towers at infinite level

`HS2/no-legs-and-basic-duality` · Theorem

**Theorem.** Let E = Q\_p. (a) No legs (Scholze–Weinstein, Proposition 23.2.1). For a datum (𝒢, b) with no legs, Sht\_{𝒢,b,∅} is empty if b does not lie in the trivial class of B(G), and Sht\_{𝒢,1,∅} ≅ underline{G(Q\_p)/𝒢(Z\_p)} × Spd k, the constant perfectoid space on the discrete set G(Q\_p)/𝒢(Z\_p). (b) Duality (Corollary 23.3.2). Let (G, b, μ) be a datum with one leg, F the field of definition of μ, and assume that b is basic. Put Ǧ = J\_b, the σ-centraliser of b; it is an inner form of G with J\_b ⊗ L = G ⊗ L, so that J\_b(L) = G(L) and conjugacy classes of geometric cocharacters of Ǧ and of G correspond, with the same fields of definition. Put b̌ = b⁻¹ ∈ Ǧ(L) = G(L) and μ̌ = μ⁻¹, a conjugacy class of cocharacters of Ǧ with field of definition F. Then J\_b̌ = G as inner forms of Ǧ, and there is a natural isomorphism Sht\_{G,b,μ,∞} ≅ Sht\_{Ǧ,b̌,μ̌,∞} over Spd F̆ which is equivariant for G(Q\_p) × J\_b(Q\_p): on the left G(Q\_p) acts through Aut(E\_1) and J\_b(Q\_p) through Aut(E\_b); on the right J\_b(Q\_p) = Ǧ(Q\_p) acts through the automorphisms of the trivial Ǧ-torsor and G(Q\_p) = J\_b̌(Q\_p) through those of the Ǧ-torsor E\_b̌. Applying the construction twice returns (G, b, μ) and the identity. For b not basic, J\_b is an inner form of a proper Levi subgroup of a quasi-split inner form of G, J\_b and G are not forms of each other, and no dual datum is defined.

**Hypotheses and conventions.**

- E = Q\_p. G is a reductive group over Q\_p; k is an algebraic closure of F\_p, L = W(k)[1/p] with Frobenius σ, and S ranges over Perf\_k; wherever Y\_[0,r\](S), Y\_(0,r\](S) or Y\_[r,∞)(S) is written, S = Spa(R,R⁺) is affinoid with a fixed pseudo-uniformizer ϖ.
- 𝒢 is a smooth affine group scheme over Z\_p with generic fibre G and connected special fibre (Scholze–Weinstein §23.1; their torsor formalism in the appendix to Lecture 19 is for flat affine group schemes over Z\_p). 𝒢 is not assumed reductive or parahoric. The model is used in (a) only; (b) is at infinite level and involves no model.
- In (b), b is basic: its Newton point is central, equivalently J\_b is an inner form of G. Sht\_{G,b,μ,∞} is the limit of HS2/levels-and-tower-limit, with S-points the pairs (S♯, α : E\_1 ⇢ E\_b bounded by μ).

**Proof outline.**

1. (a) Let S be affinoid perfectoid over k. A point of Sht\_{𝒢,b,∅} over S is a 𝒢-torsor P on Y\_[0,∞)(S) with an isomorphism φ\_P : Frob\_S^\*P ≅ P and a trivialisation ι\_r over Y\_[r,∞)(S) carrying φ\_P to b × Frob\_S. With no legs, repeated application of φ\_P⁻¹ extends ι\_r to all of Y\_(0,∞)(S) (HS2/local-shtuka-moduli, framing\_extends), so P|\_{Y\_(0,∞)(S)} is the pullback of E\_b. By HS2/lattice-extension-functor (c), applied to the restriction to Y\_(0,r\](S), an extension to a φ-equivariant 𝒢-torsor over p = 0 exists only where E\_b is trivial at geometric points, that is only if [b] = 1; and for b = 1 the extensions correspond to 𝒢(Z\_p)-lattices in the trivial pro-étale G(Q\_p)-torsor, that is to S-points of G(Q\_p)/𝒢(Z\_p).
2. (b), the twist. For b basic the automorphism group scheme of E\_b on X\_S is the pure inner form J\_b × X\_S, and T ↦ Isom\_G(E\_b, T) is an equivalence from G-torsors to J\_b-torsors on X\_S, functorial in S (BunGAndNewtonStrata:BG0/pure-inner-twisting). It sends E\_b to the trivial J\_b-torsor and E\_1 to the J\_b-torsor attached to b̌ = b⁻¹ ∈ J\_b(L).
3. (b), the map. A point (S♯, α : E\_1 ⇢ E\_b) of Sht\_{G,b,μ,∞} is sent by the twist to a modification from the J\_b-torsor E\_b̌ to the trivial J\_b-torsor at S♯; its inverse is a modification from the trivial J\_b-torsor to E\_b̌. Inversion turns the bound μ into μ⁻¹ (HS2/framed-bundle-fibres (e)), and bounds correspond under the twist because G and J\_b are identified over an algebraic closure up to inner automorphisms; so the inverse is a point of Sht\_{Ǧ,b̌,μ̌,∞}. The construction is invertible by the same recipe applied to (Ǧ, b̌, μ̌), for which J\_b̌(Q\_p) = {g ∈ G(L) : g = σ(g)} = G(Q\_p), because the Frobenius of J\_b(L) = G(L) is g ↦ b σ(g) b⁻¹.
4. (b), equivariance. The twist identifies Aut(E\_b) with the automorphisms of the trivial J\_b-torsor and Aut(E\_1) with those of E\_b̌; pre- and postcomposition are exchanged by inversion, which gives the stated matching of the two actions.

**Acceptance.**

- G = 1: Sht with no legs is Spd k.
- 𝒢 = G\_m, no legs: Sht\_{G\_m,b,∅} = ∅ for v\_p(b) ≠ 0 and Sht\_{G\_m,1,∅} = underline{Z} × Spd k.
- G = G\_m, μ(z) = z^d, v\_p(b) = −d: Ǧ = G\_m, b̌ = b⁻¹, μ̌(z) = z^{−d}; both Sht\_{G\_m,b,μ,∞} and Sht\_{G\_m,b⁻¹,μ⁻¹,∞} are non-empty (v\_p(b⁻¹) = d = −(−d)), and the isomorphism sends α : O ⇢ O(d) to the inverse of α ⊗ O(−d) : O(−d) ⇢ O.
- G = GL\_n, μ = (1, 0, …, 0), b basic with κ(b) = −1: Ǧ(Q\_p) is the group of units of a central division algebra of dimension n² over Q\_p, μ̌ = (0, …, 0, −1), and the statement specialises to the duality between the Lubin–Tate and Drinfeld towers at infinite level, which the source names as the case it generalises.
- (Ǧ)ˇ = G, (b̌)ˇ = b, (μ̌)ˇ = μ.

**Prerequisites.**

- In this roadmap: `HS2/levels-and-tower-limit`, `HS2/local-shtuka-moduli`, `HS2/lattice-extension-functor`, `HS2/framed-bundle-fibres`.
- In other roadmaps: `BunGAndNewtonStrata:BG0/pure-inner-twisting`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `BunGAndNewtonStrata:BG0/basic-inner-form-bundle-equivalence`.

**Sources.**

- Scholze–Weinstein, Proposition 23.2.1, p. 217: Statement (a).
- Scholze–Weinstein, proof of Proposition 23.2.1, p. 218: The use of the lattice theorem in the proof of (a).
- Scholze–Weinstein, Corollary 23.3.2, p. 219: Statement (b): the dual datum and the equivariant isomorphism.
- Scholze–Weinstein, proof of Corollary 23.3.2, p. 219: The bound of the dual datum.

### Local shtuka tower over a general local field

`HS2/general-local-field` · Construction

**Construction.** Let E be a nonarchimedean local field of either characteristic, with residue field F\_q and uniformizer π; G a reductive group over E; b ∈ G(Ĕ); I a finite set; for i ∈ I a conjugacy class μ\_i of cocharacters of G over an algebraic closure of E, with field of definition F\_i ⊇ E and F̆\_i = F\_i·Ĕ (the sources write E\_i, Ĕ\_i); and K ⊂ G(E) a compact open subgroup. For S ∈ Perf\_k let Y\_S = S ×̇ Spa O\_E ∖ V(π[ϖ]), with Frobenius φ, and X\_S = Y\_S/φ^Z. (1) Gr^tw\_{G,∏Spd F̆\_i,≤μ•} sends S to the set of tuples ((S\_i♯)\_{i∈I}, P\_η, φ\_P, ι\_r): S\_i♯ is an untilt of S over F̆\_i; P\_η is a G-torsor on Y\_S; φ\_P: Frob\_S^\*P\_η ≅ P\_η is an isomorphism over Y\_S ∖ ∪\_i S\_i♯ that is meromorphic along ∪\_i S\_i♯; ι\_r is a trivialisation of P\_η over Y\_{S,[r,∞)} = {|[ϖ]| ≤ |π|^r ≠ 0}, for r large, carrying φ\_P to b × Frob\_S, two such being identified when they agree for larger r; and at every geometric rank-one point of S the position of P\_η relative to Frob\_S^\*P\_η at S\_i♯ (the type of φ\_P⁻¹: P\_η ⇢ Frob\_S^\*P\_η, in the normalisation of HS0/bounded-hecke-substacks) is bounded by Σ\_{j: S\_j♯=S\_i♯} μ\_j. It is proper and representable in spatial diamonds over ∏\_i Spd F̆\_i, and for |I| = 1 it is Gr\_{G,Spd F̆\_1,≤μ\_1}. (2) Locally on S there is r′ > 0 such that Y\_{S,(0,r′]} meets no S\_i♯; there P\_η is φ⁻¹-equivariant and descends to a G-torsor E on X\_S. The admissible locus Gr^{tw,a} ⊂ Gr^tw\_{≤μ•} is the subfunctor on which E is trivial at every geometric point of S. It is open, and Isom(E\_1, E) is a pro-étale G(E)-torsor 𝒫\_η over it. (3) Sht\_{(G,b,μ•),K} = 𝒫\_η/K is the sheaf of K-lattices in 𝒫\_η, and Sht\_{(G,b,μ•),∞} = 𝒫\_η = lim\_K Sht\_{(G,b,μ•),K}. The period map π\_K: Sht\_{(G,b,μ•),K} → Gr^tw\_{≤μ•} is étale with image Gr^{tw,a}; Sht\_{(G,b,μ•),K} is a locally spatial diamond over ∏\_i Spd F̆\_i; for K′ ⊂ K the transition map is finite étale of degree [K:K′] and commutes with the period maps; G(E) acts on the tower, J\_b(E) acts on each level through ι\_r, and the two actions commute. (4) For E = Q\_p and K = 𝒢(Z\_p), with 𝒢 a smooth model of G over Z\_p with connected special fibre, Sht\_{(G,b,μ•),K} is the moduli space of framed 𝒢-shtukas of HS2/local-shtuka-moduli. Fargues–Scholze IX.3 states the existence of the tower and of compatible étale period maps for general E in one sentence, by reference to the construction of Scholze–Weinstein for E = Q\_p; the definitions (1)–(3) for general E and their proof are not written out there. The bound is in the orientation of Scholze–Weinstein, Definition 23.5.1: for G = G\_m, one leg and μ = id the tower is non-empty exactly when v\_π(b) = −1, and a local Shimura datum has b ∈ B(G,μ⁻¹). Fargues–Scholze IX.3 describe the space M that they compare with this tower as the space of modifications bounded by μ• that go from E\_b to the trivial bundle (p. 326), and b ∈ B(G,μ) for local Shimura data (p. 324); with their Hecke operators (pp. 337–338) the space M consists of the modifications from the trivial bundle to E\_b bounded by μ•, and the condition is b ∈ B(G,μ⁻¹).

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- I is a finite set, possibly empty; the μ\_i are arbitrary conjugacy classes of cocharacters (no minuscule condition); b is an element of G(Ĕ), and the tower depends on b only through its σ-conjugacy class up to the isomorphisms changing ι\_r; K runs through the compact open subgroups of G(E).

**Construction.**

1. Y\_S, its Frobenius, the untilts S\_i♯ as closed Cartier divisors of Y\_S and meromorphy along them are taken from RF0 and RF2 in both characteristics; G-torsors on Y\_S and X\_S, their v-descent and descent along φ from RF4.
2. Properness and spatiality of Gr^tw\_{≤μ•} as in Scholze–Weinstein 23.5.2: over a quasicompact open of ∏\_i Spd F̆\_i there is n₀ such that P\_η is determined by the modifications of the trivial torsor at φ^{−n}(S\_i♯), 0 ≤ n < n₀, which embeds Gr^tw\_{≤μ•} as a closed subfunctor of a Schubert variety in a Beilinson–Drinfeld Grassmannian over the base and its Frobenius translates; these are proper and spatial for general E by GS0. For one leg the φ⁻¹-periodic continuation identifies Gr^tw with Gr\_{G,Spd F̆\_1,≤μ\_1}.
3. Openness of Gr^{tw,a} and the torsor 𝒫\_η: the geometrically fibrewise trivial locus Bun\_G^1 ⊂ Bun\_G is open and is the classifying stack of pro-étale G(E)-torsors (Fargues–Scholze III.2.4, for every E); pull back along Gr^tw\_{≤μ•} → Bun\_G, (P\_η, φ\_P) ↦ E.
4. Pro-étale locally on the admissible locus S^a of a test object S the torsor 𝒫\_η is trivial and 𝒫\_η/K is S^a × G(E)/K, so π\_K is étale and separated; a sheaf étale over a locally spatial diamond is a locally spatial diamond. Transition maps, the limit and the two group actions are those of HS2/levels-and-tower-limit.
5. For E = Q\_p and K = 𝒢(Z\_p), (4) is Scholze–Weinstein 23.5.3, through the equivalence between 𝒢(Z\_p)-lattices in 𝒫\_η and extensions of the φ⁻¹-equivariant torsor to Y\_{S,[0,r′]} (HS2/lattice-extension-functor). For general O\_E the description by integral torsors needs the general-E form of that equivalence; it is not used in (1)–(3).

**API.**

- `GeneralShtukaTower` (data): For (E, G, b, (μ\_i)\_{i∈I}, K) the v-sheaf Sht\_{(G,b,μ•),K} on Perf\_k whose S-points are tuples ((S\_i♯), P\_η, φ\_P, ι\_r, 𝒫): a point of Gr^{tw,a}(S) together with a K-lattice 𝒫 ⊂ 𝒫\_η, that is a section of 𝒫\_η/K.
- `GeneralShtukaTower.legs` (projection): f\_K: Sht\_{(G,b,μ•),K} → ∏\_{i∈I} Spd F̆\_i, ((S\_i♯), …) ↦ (S\_i♯).
- `GeneralShtukaTower.periodMap` (projection): π\_K: Sht\_{(G,b,μ•),K} → Gr^tw\_{G,∏Spd F̆\_i,≤μ•} forgets 𝒫; it is étale, separated, with image the open admissible locus, and its fibre over S → Gr^{tw,a} is 𝒫\_η|\_S/K, which pro-étale locally on S is S × G(E)/K.
- `GeneralShtukaTower.ext` (extensionality): Two S-points are equal if and only if they have the same legs, there is an isomorphism of the pairs (P\_η, φ\_P) compatible with the germs of ι\_r, and it carries one K-lattice to the other.
- `GeneralShtukaTower.transition` (functoriality): For K′ ⊂ K the map Sht\_{(G,b,μ•),K′} → Sht\_{(G,b,μ•),K}, 𝒫′ ↦ 𝒫′·K, is finite étale of degree [K:K′], a K/K′-torsor when K′ is normal in K; it is the identity for K′ = K, is compatible with composition for K″ ⊂ K′ ⊂ K, and commutes with π\_K and f\_K.
- `GeneralShtukaTower.limit` (characterisation): Sht\_{(G,b,μ•),∞} = lim\_K Sht\_{(G,b,μ•),K} = 𝒫\_η is a pro-étale G(E)-torsor over Gr^{tw,a}; over the complement of the Frobenius-twisted partial diagonals, the loci S\_i♯ = φ^n(S\_j♯) with i ≠ j and n ≠ 0, its S-points are the tuples ((S\_i♯), α) with α: E\_1 ≅ E\_b an isomorphism away from the images D\_i of the S\_i♯ in X\_S, meromorphic and bounded by μ•, that is by Σ\_{j: S\_j♯ = S\_i♯} μ\_j at D\_i (for E = Q\_p this is HS2/multi-leg-period-and-representability (e); the argument is the same for general E).
- `GeneralShtukaTower.actions` (structure): g ∈ G(E) = Aut(E\_1) acts on 𝒫\_η = Isom(E\_1, E) by τ ↦ τ∘g⁻¹ and induces isomorphisms Sht\_{(G,b,μ•),K} ≅ Sht\_{(G,b,μ•),gKg⁻¹}, 𝒫 ↦ 𝒫·g⁻¹, compatible with transition maps and with products in G(E), as in HS2/levels-and-tower-limit; j ∈ J\_b(E) acts on every level by changing ι\_r; the two actions commute and both commute with f\_K.
- `GeneralShtukaTower.oneLeg` (compatibility): For |I| = 1, Gr^tw\_{G,Spd F̆\_1,≤μ\_1} = Gr\_{G,Spd F̆\_1,≤μ\_1} and, for E = Q\_p, the tower is the one-leg tower of HS2/levels-and-tower-limit.
- `GeneralShtukaTower.integralModel` (compatibility): For E = Q\_p and K = 𝒢(Z\_p), with 𝒢 smooth over Z\_p with generic fibre G and connected special fibre, Sht\_{(G,b,μ•),K} is the moduli space of framed 𝒢-shtukas on S ×̇ Spa Z\_p (Scholze–Weinstein 23.1.1 and 23.5.3).
- `GeneralShtukaTower.noLegs` (example): For I = ∅: Sht\_{(G,b,∅),K} = ∅ if [b] ≠ 1 in B(G), and Sht\_{(G,1,∅),K} is the constant sheaf G(E)/K.
- `GeneralShtukaTower.lubinTate` (example): For G = G\_m, one leg, μ = id and b = π⁻¹, so that E\_b = O(1): Sht\_{(G\_m,b,μ),∞} is the sheaf of pairs (S♯, s) with s a section of O\_{X\_S}(1) whose divisor is the image of S♯, that is (BC(O(1)) ∖ {0}) ×\_{Div¹} Spd Ĕ ≅ Z × Spd Ĕ\_∞, with Ĕ\_∞ the completion of the compositum of Ĕ and the Lubin–Tate extension E\_∞ of E (Fargues–Scholze II.2.2–II.2.4).

**Unit tests.**

- `GeneralShtukaTower.no_legs_test` (degenerate): For I = ∅ and any E: Sht\_{(G,b,∅),K} = ∅ when [b] ≠ 1; for b = 1 it is the constant sheaf G(E)/K, on which J\_1(E) = G(E) acts by left translation.
- `GeneralShtukaTower.qp_test` (compatibility): For E = Q\_p and K = 𝒢(Z\_p) with 𝒢 a smooth model of G with connected special fibre, Sht\_{(G,b,μ•),K} is the sheaf of quadruples (P, {S\_i♯}, φ\_P, ι\_r) of Scholze–Weinstein, Definition 23.1.1, and Sht\_{(G,b,μ•),K′} for K′ ⊂ G(Q\_p) compact open is their Sht\_{G,b,{μ\_i},K′}.
- `GeneralShtukaTower.lubin_tate_test` (computation): For G = G\_m, one leg and μ = id (the modification makes E\_b the larger bundle): for b = π⁻¹ one has Sht\_{(G\_m,b,μ),∞} ≅ Z × Spd Ĕ\_∞, Sht\_{(G\_m,b,μ),O\_E^×} ≅ Z × Spd Ĕ and Sht\_{(G\_m,b,μ),1+π^nO\_E} ≅ Z × Spd Ĕ\_n, where Ĕ\_n is the compositum of Ĕ with the field of π^n-torsion points of a Lubin–Tate formal O\_E-module; for every b with v\_π(b) ≠ −1 the tower is empty.
- `GeneralShtukaTower.one_leg_test` (characterisation): For |I| = 1 the map Gr^tw\_{G,Spd F̆\_1,≤μ\_1} → Gr\_{G,Spd F̆\_1,≤μ\_1}, sending (S♯, P\_η, φ\_P, ι\_r) to the modification of the trivial torsor at S♯ defined by ι\_r, is an isomorphism.

**Uses.**

- HeckeStacksAndLocalShtukas:HS3/satake-coefficients-and-partial-frobenius: The Satake sheaf S\_W on Gr^tw is pulled back along π\_K, and its relative homology along f\_K: Sht\_{(G,b,μ•),K} → ∏\_i Spd F̆\_i is formed for general E.
- Fargues–Scholze, Proposition IX.3.2: f\_{K♮}S′\_W is defined on this tower; its partial Frobenii come from the comparison with the space of modifications away from the Frobenius-twisted partial diagonals.
- HeckeStacksAndLocalShtukas:HS2/weil-descent-datum: The one-leg tower is the pullback of the space of modifications over Spd F̆/φ\_F^Z, φ\_F the Frobenius of the factor Spd F of Spd F̆.

**Acceptance.**

- For E = Q\_p the tower is that of Scholze–Weinstein, Corollary 23.5.3.
- With no legs, Sht\_{(G,b,∅),K} is empty unless [b] = 1, and is the constant sheaf G(E)/K for b = 1.
- For G = G\_m, one leg, μ = id and b = π⁻¹, Sht\_{(G\_m,b,μ),O\_E^×} ≅ Z × Spd Ĕ, in mixed and in equal characteristic.

**Prerequisites.**

- In this roadmap: `HS2/multi-leg-period-and-representability`, `HS2/levels-and-tower-limit`, `HS0/twisted-period-grassmannian`, `HS2/lattice-extension-functor`.
- In other roadmaps: `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`, `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition`, `RelativeFarguesFontaine:RF0:annuli/generic-period-domain`, `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `BunGAndNewtonStrata:BG2:uniformization/geometrically-trivial-locus`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`.

**Sources.**

- Fargues–Scholze, IX.3, after the proof of Theorem IX.3.1, pp. 325–326: The statement of the tower for general E, in the paragraph that turns to Corollary I.7.3 (the same sentence is in §I.7, p. 31, before that corollary): asserted by reference to Lecture 23 of Scholze–Weinstein, together with compatible étale period maps to the twisted Grassmannian; no construction or proof for general E in either place.
- Fargues–Scholze, IX.3, proof of Proposition IX.3.2, p. 326: The moduli description for general E: a Frobenius G-torsor on Y\_S with a level-K structure near π = 0.
- Scholze–Weinstein, Definition 23.5.1, p. 223: The twisted Grassmannian for E = Q\_p; (1) is this definition with S ×̇ Spa Q\_p replaced by Y\_S.
- Scholze–Weinstein, Corollary 23.5.3 and the paragraph after it, p. 224: Levels as K-lattices in the G(Q\_p)-torsor over the admissible locus; the definition used in (3).
- Scholze–Weinstein, Definition 11.1.2, pp. 90–91: The equal-characteristic model case only: G = GL\_n and E = F\_p((T)), a vector bundle on S ×\_{F\_p} Spf F\_p[[T]] with a meromorphic Frobenius; no framing by b, no bound and no level structure.

### Local Shimura varieties: the rigid tower for minuscule μ

`HS2/minuscule-rigidification` · Construction · planet: **Local Shimura varieties**

**Construction.** Let G be a reductive group over Q\_p, μ a conjugacy class of minuscule cocharacters of G over an algebraic closure of Q\_p, with field of definition F and F̆ = F·Q̆\_p, b ∈ G(Q̆\_p), and K ⊂ G(Q\_p) a compact open subgroup; the orientation is that of Scholze–Weinstein, Lecture 24. Let Fl\_{G,μ} = G/P\_μ be the flag variety over F, with P\_μ = {g : lim\_{t→∞} μ(t)gμ(t)⁻¹ exists}. (1) The Białynicki-Birula map is an isomorphism Gr\_{G,Spd F̆,≤μ} ≅ Fl\_{G,μ,F̆}^♦. (2) There are a rigid space M\_{G,b,μ,K} over F̆, an étale morphism π\_K: M\_{G,b,μ,K} → Fl\_{G,μ,F̆} and an isomorphism c\_K: M\_{G,b,μ,K}^♦ ≅ Sht\_{G,b,μ,K} over Spd F̆ under which π\_K^♦ is the period map π\_GM; the triple (M\_{G,b,μ,K}, π\_K, c\_K) is unique up to unique isomorphism. (3) M\_{G,b,μ,K} is smooth over F̆ and partially proper, of pure dimension ⟨2ρ,μ⟩ = dim Fl\_{G,μ} when it is not empty; it is non-empty if and only if [b] ∈ B(G,μ⁻¹), that is ν\_b ≤ (μ⁻¹)^♦ and κ(b) = −μ^♮; the image of π\_K is the open subspace Fl^a ⊂ Fl\_{G,μ,F̆} whose diamond is the admissible locus, and the geometric fibres of π\_K over Fl^a are G(Q\_p)/K. (4) For K′ ⊂ K the map Sht\_{G,b,μ,K′} → Sht\_{G,b,μ,K} comes from a unique morphism M\_{G,b,μ,K′} → M\_{G,b,μ,K} over Fl\_{G,μ,F̆}, which is finite étale of degree [K:K′]; G(Q\_p) acts on the tower (M\_{G,b,μ,K})\_K and J\_b(Q\_p) on each M\_{G,b,μ,K}, and π\_K is equivariant for the action of J\_b(Q\_p) ⊂ G(Q̆\_p) on Fl\_{G,μ,F̆}. When [b] ∈ B(G,μ⁻¹), the tower (M\_{G,b,μ,K})\_K with its period maps is the local Shimura variety of (G,b,μ). For μ not minuscule the map in (1) is not an isomorphism and no rigid space is constructed.

**Hypotheses and conventions.**

- The base field is Q\_p: G is a reductive group over Q\_p, k is an algebraic closure of F\_p, Q̆\_p = W(k)[1/p] with Frobenius σ, and all v-sheaves and diamonds are over Perf\_k.
- G is a reductive group over Q\_p and μ is minuscule; F is the field of definition of μ, written F to keep E for the base field; b ∈ G(Q̆\_p) is arbitrary, and [b] ∈ B(G,μ⁻¹) exactly when the spaces are non-empty.

**Construction.**

1. Gr\_{G,≤μ} = Gr\_{G,μ} for minuscule μ, and the Białynicki-Birula map Gr\_{G,μ} → Fl\_{G,μ}^♦ is an isomorphism (Scholze–Weinstein 19.4.2, over an algebraically closed C; the map is Galois equivariant and descends to F̆).
2. π\_GM: Sht\_{G,b,μ,K} → Gr\_{G,Spd F̆,≤μ} is étale (HS2/one-leg-period-map). By the equivalence of étale sites (Fl\_{G,μ,F̆})\_ét ≅ (Fl\_{G,μ,F̆}^♦)\_ét (Scholze–Weinstein 10.4.2; D6) there is a rigid space M\_{G,b,μ,K}, étale over Fl\_{G,μ,F̆}, with diamond Sht\_{G,b,μ,K}; morphisms over the flag variety between such spaces correspond to morphisms of their diamonds, which gives the uniqueness, the transition maps and the action of G(Q\_p). The action of j ∈ J\_b(Q\_p) covers the automorphism j of Fl\_{G,μ,F̆}; it is obtained by applying the same correspondence to M\_{G,b,μ,K} and its pullback along j, or directly from the full faithfulness of X ↦ X^♦ on seminormal rigid spaces over F̆ (Scholze–Weinstein 10.2.3). Finite étale maps correspond under the equivalence of finite étale sites.
3. Smoothness and the dimension: M\_{G,b,μ,K} is étale over the smooth F̆-variety Fl\_{G,μ,F̆}, of dimension ⟨2ρ,μ⟩. The image and the fibres of π\_K are those of π\_GM (HS2/one-leg-period-map); non-emptiness is Scholze–Weinstein 24.1.2.
4. Partial properness, in the sense of Scholze–Weinstein 17.4.7 (unique extension from Spa(R,R°) to Spa(R,R⁺) for every affinoid perfectoid (R,R⁺)). Gr\_{G,Spd F̆,≤μ} → Spd F̆ is partially proper because its (R,R⁺)-points over a given untilt depend only on R (Scholze–Weinstein 19.1.4). The open immersion of the admissible locus is partially proper: every point of Spa(R,R⁺) is a specialisation of a rank-one point, which lies in Spa(R,R°), and triviality of a G-bundle at a geometric point Spa(C,C⁺) depends only on C, so a map Spa(R,R⁺) → Gr\_{G,≤μ} sending Spa(R,R°) into the admissible locus lands in it. π\_K is partially proper: pro-étale locally on the target it is the projection S × G(Q\_p)/K → S, maps from Spa(R,R⁺) and from Spa(R,R°) to a discrete set coincide, and the extension property with uniqueness descends along a v-cover of the target. Hence Sht\_{G,b,μ,K} → Spd F̆ is partially proper, and therefore so is M\_{G,b,μ,K} → Spa F̆ (A2). Fargues–Scholze IX.3 states partial properness by reference to Lecture 24 of Scholze–Weinstein, where it does not appear.

**API.**

- `Rigidification` (data): For a minuscule datum (G,b,μ) over Q\_p and K ⊂ G(Q\_p) compact open: a rigid space M\_{G,b,μ,K} over F̆, an étale morphism π\_K: M\_{G,b,μ,K} → Fl\_{G,μ,F̆}, and an isomorphism c\_K: M\_{G,b,μ,K}^♦ ≅ Sht\_{G,b,μ,K} over Spd F̆ with BB ∘ π\_GM ∘ c\_K = π\_K^♦.
- `Rigidification.space` (projection): M\_{G,b,μ,K}: smooth and partially proper over F̆, of pure dimension ⟨2ρ,μ⟩ when non-empty, in general not quasicompact.
- `Rigidification.periodMap` (projection): π\_K: M\_{G,b,μ,K} → Fl\_{G,μ,F̆} is étale; its image is the open subspace Fl^a whose diamond is the admissible locus, and its geometric fibres over Fl^a are G(Q\_p)/K.
- `Rigidification.comparison` (projection): c\_K: M\_{G,b,μ,K}^♦ ≅ Sht\_{G,b,μ,K}; it induces |M\_{G,b,μ,K}| ≅ |Sht\_{G,b,μ,K}| and an equivalence of étale sites.
- `Rigidification.unique` (extensionality): If (M′, π′, c′) is a second triple as in Rigidification, there is exactly one isomorphism M\_{G,b,μ,K} ≅ M′ over Fl\_{G,μ,F̆} carrying c\_K to c′.
- `Rigidification.lift` (universal-property): For every rigid space U étale over Fl\_{G,μ,F̆}, U ↦ U^♦ is a bijection from morphisms U → M\_{G,b,μ,K} over Fl\_{G,μ,F̆} to morphisms U^♦ → Sht\_{G,b,μ,K} over Fl\_{G,μ,F̆}^♦ (Scholze–Weinstein 10.4.2); and for every finite extension L of F̆, M\_{G,b,μ,K}(L) = Sht\_{G,b,μ,K}(Spd L), by full faithfulness of the diamond functor on seminormal rigid spaces (Scholze–Weinstein 10.2.3).
- `Rigidification.transition` (functoriality): For K′ ⊂ K: a finite étale morphism M\_{G,b,μ,K′} → M\_{G,b,μ,K} over Fl\_{G,μ,F̆} of degree [K:K′], Galois with group K/K′ when K′ is normal in K; it is the identity for K′ = K and compatible with composition for K″ ⊂ K′ ⊂ K.
- `Rigidification.heckeAction` (functoriality): For g ∈ G(Q\_p): an isomorphism M\_{G,b,μ,K} ≅ M\_{G,b,μ,gKg⁻¹} over Fl\_{G,μ,F̆}, whose diamond is the isomorphism α ↦ α∘g⁻¹ of HS2/levels-and-tower-limit, compatible with transition maps and with products in G(Q\_p).
- `Rigidification.framingAction` (functoriality): J\_b(Q\_p) acts on M\_{G,b,μ,K}, commuting with the Hecke action and the transition maps, and π\_K is equivariant for the action of J\_b(Q\_p) ⊂ G(Q̆\_p) ⊂ G(F̆) on Fl\_{G,μ,F̆}.
- `Rigidification.nonempty_iff` (characterisation): M\_{G,b,μ,K} ≠ ∅ if and only if [b] ∈ B(G,μ⁻¹).
- `Rigidification.lubinTate` (example): For G = GL\_n, μ = (1,0,…,0) and b basic with E\_b ≅ O(1/n): M\_{GL\_n,b,μ,GL\_n(Z\_p)} is the generic fibre ∐\_{h∈Z} D̊^{n−1} of the Lubin–Tate deformation space with quasi-isogeny, and π is the Gross–Hopkins period map onto P^{n−1}.

**Unit tests.**

- `Rigidification.lubin_tate_test` (computation): For G = GL\_2, μ = (1,0) and b the basic class with κ(b) = −1 (E\_b ≅ O(1/2); b is the Frobenius of the covariant Dieudonné module of the formal group of height 2 and dimension 1 in the normalisation of Scholze–Weinstein, in which μ\_{p^∞} has Frobenius p⁻¹σ): M\_{GL\_2,b,μ,GL\_2(Z\_p)} ≅ ∐\_{h∈Z} D̊ with D̊ the open unit disc over Q̆\_p; π: M → P¹\_{Q̆\_p} is surjective with every geometric fibre in bijection with GL\_2(Q\_p)/GL\_2(Z\_p); and for m ≥ 1 the map M\_{GL\_2,b,μ,1+p^mM\_2(Z\_p)} → M\_{GL\_2,b,μ,GL\_2(Z\_p)} is finite étale of degree p^{4(m−1)}(p²−1)(p²−p).
- `Rigidification.orientation_test` (non-example): For G = GL\_2, the same b (E\_b ≅ O(1/2), κ(b) = −1) and the cocharacter μ⁻¹ = (0,−1) in place of μ = (1,0): the condition for (G, b, μ⁻¹) is [b] ∈ B(G,μ), which fails since κ(b) ≠ 1, and M\_{GL\_2,b,μ⁻¹,K} is empty for every K.
- `Rigidification.torus_test` (degenerate): For G = G\_m, μ = id and b = p⁻¹: Fl\_{G\_m,μ} is a point, M\_{G\_m,b,μ,Z\_p^×} ≅ ∐\_Z Spa Q̆\_p and M\_{G\_m,b,μ,1+p^mZ\_p} ≅ ∐\_Z Spa Q̆\_p(ζ\_{p^m}) for m ≥ 1; for p^m > 2 this is not the constant space (Q\_p^×/(1+p^mZ\_p)) × Spa Q̆\_p.
- `Rigidification.dimension_test` (characterisation): For G = GL\_n, μ = (1^d,0^{n−d}) and [b] ∈ B(G,μ⁻¹): M\_{GL\_n,b,μ,K} is smooth of pure dimension d(n−d) = ⟨2ρ,μ⟩ = dim Gr(d,n).
- `Rigidification.nonminuscule_test` (non-example): For G = GL\_2 and μ = (2,0): the Białynicki-Birula map Gr\_μ → (P¹)^♦ has geometric fibres (A¹)^♦, and dim Gr\_{≤μ} = ⟨2ρ,μ⟩ = 2 > 1 = dim Fl\_{GL\_2,μ}; statement (1) fails and the construction does not apply.

**Uses.**

- HeckeStacksAndLocalShtukas:HS3/huber-cohomology-comparison: Compactly supported cohomology of the smooth partially proper rigid space M\_{G,b,μ,K,C} is compared with that of its diamond.
- HeckeStacksAndLocalShtukas:HS3/classical-comparison: The Rapoport–Zink tower is compared with (M\_{G,b,μ,K})\_K through the uniqueness in (2).
- HeckeStacksAndLocalShtukas:HS2/component-transitivity-source-gate: M\_{G,b,μ,K} ×\_{F̆} C is a rigid space, hence locally connected: its connected components are open.
- Fargues–Scholze, Theorem IX.3.1: RΓ\_c(M\_{(G,b,μ),K,C}, Z\_ℓ) is defined, following Huber, on these partially proper smooth rigid spaces.

**Acceptance.**

- For a torus T, every μ is minuscule, Fl\_{T,μ} = Spa F, and M\_{T,b,μ,K} is a disjoint union of spectra of finite extensions of F̆ whose set of geometric points is T(Q\_p)/K when [b] ∈ B(T,μ⁻¹).
- For GL\_n, μ = (1^d,0^{n−d}) and b the Frobenius of the covariant Dieudonné module of a p-divisible group X of dimension d and height n, in the normalisation of Scholze–Weinstein in which Q\_p/Z\_p has Frobenius σ and μ\_{p^∞} has Frobenius p⁻¹σ (so that κ(b) = −d), the tower is the generic fibre of the Rapoport–Zink tower of X (Scholze–Weinstein 24.2.5 and the paragraph after its proof).
- For GL\_2 and μ = (2,0), Gr\_{≤μ} has dimension 2 and Fl\_{GL\_2,μ} = P¹; the construction does not apply.

**Prerequisites.**

- In this roadmap: `HS2/one-leg-period-map`, `HS2/levels-and-tower-limit`.
- In other roadmaps: `GeometricSatakeAndFusion:GS0:Schubert-smoothness`, `DiamondsAndVStacks:D6/etale-site-comparison`, `AdicEtaleGeometry:A2`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `AdicEtaleGeometry:A2/smooth-morphism-ball-charts`, `AdicSpacesPartII:R0/separated-proper-partially-proper`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula`.

**Sources.**

- Scholze–Weinstein, Definition 24.1.1, p. 225: The datum: G reductive over Q\_p, μ minuscule, [b] ∈ B(G,μ⁻¹).
- Scholze–Weinstein, Proposition 24.1.2, p. 225: Non-emptiness criterion, quoted from Rapoport; it is the reason for the condition on b.
- Scholze–Weinstein, 24.1, after Proposition 24.1.2, p. 225; Definition 24.1.3, p. 226: The rigid space, its uniqueness together with the étale map to the flag variety, and the transition maps.
- Scholze–Weinstein, Theorem 10.4.2, p. 81: The equivalence of étale sites used to construct M\_{G,b,μ,K} from the étale period map.
- Scholze–Weinstein, Proposition 19.4.2, pp. 176–177: Statement (1), over an algebraically closed field C.
- Scholze–Weinstein, Lemma 19.1.4, p. 171: Partial properness of the Grassmannian, the first input of step 4.
- Fargues–Scholze, IX.3, before Theorem IX.3.1, p. 324: Partial properness is asserted here by reference to Lecture 24 of Scholze–Weinstein, which does not state it.
- Scholze–Weinstein, 24.2, after the proof of Theorem 24.2.5, p. 229: The comparison with Rapoport–Zink towers used in the Lubin–Tate test.

### Non-emptiness, connectedness and density of the admissible locus

`HS2/nonemptiness-and-period-connectedness` · Theorem

**Theorem.** Let G be a reductive group over Q\_p, b ∈ G(Q̆\_p), and μ a conjugacy class of cocharacters of G over an algebraic closure of Q\_p, not necessarily minuscule, with reflex field F and F̆ = F·Q̆\_p. In the Berkeley orientation let Gr\_μ ⊂ Gr\_{≤μ} = Gr\_{G,Spd F̆,≤μ} be the open Schubert cell, and Gr^a\_μ ⊂ Gr^a\_{≤μ} the admissible loci: the open loci where the modification of E\_b is trivial at geometric points. (a) Gr^a\_μ ≠ ∅ ⇔ Gr^a\_{≤μ} ≠ ∅ ⇔ [b] ∈ B(G,μ⁻¹), that is κ(b) = −μ^♮ and ν\_b ≤ (μ⁻¹)^♦. (b) If [b] ∈ B(G,μ⁻¹), there are a finite extension L of F̆ and a point Spd L → Gr^a\_μ over Spd F̆. (c) If [b] ∈ B(G,μ⁻¹), then for every complete algebraically closed extension C of F̆: Gr^a\_μ ×\_{Spd F̆} Spd C is connected, and Gr^a\_{≤μ} ×\_{Spd F̆} Spd C is connected and dense in Gr\_{≤μ} ×\_{Spd F̆} Spd C. In the orientation of Gleason–Lourenço and of Gleason–Lim–Xu the same statements read with μ replaced by μ⁻¹, the condition being [b] ∈ B(G,μ).

**Hypotheses and conventions.**

- The base field is Q\_p: G is a reductive group over Q\_p, k is an algebraic closure of F\_p, Q̆\_p = W(k)[1/p] with Frobenius σ, and all v-sheaves and diamonds are over Perf\_k.
- G is reductive over Q\_p; μ is arbitrary. Howe–Klevdal state 7.3.3 and 7.3.4 for connected linear algebraic groups; only the reductive case is stated here.

**Proof outline.**

1. Non-emptiness of the cell (Howe–Klevdal 7.3.3, reductive case, whose Gr\_{\[μ\]} is the cell Gr\_μ here). If Gr^a\_μ ≠ ∅ then \[b\] ∈ B(G,μ⁻¹), by Caraiani–Scholze, Proposition 3.5.3. Conversely, if \[b\] ∈ B(G,μ⁻¹), the weakly admissible locus of the flag variety of filtrations of type μ⁻¹ (the variety Fl\_{G,μ} of Scholze–Weinstein Definition 19.4.1) has a point over a finite extension L of F̆ (Rapoport–Viehmann, Proposition 3.1), and it is the image of a unique admissible point of Gr\_μ(Spd L) (HS2/classical-period-points (c), applied with its cocharacter equal to μ⁻¹, so that its cell is Gr\_μ and its hypothesis is κ(b) = −μ^♮); this gives (b). For minuscule μ the equivalence is Scholze–Weinstein 24.1.2.

2. Closed locus. Gr^a\_{≤μ} is the union of the Gr^a\_{μ′} over the dominant μ′ ≤ μ, and B(G,μ′⁻¹) ⊂ B(G,μ⁻¹): μ′^♮ = μ^♮ because μ − μ′ is a sum of coroots, and (μ′⁻¹)^♦ ≤ (μ⁻¹)^♦ because the Galois average of a non-negative combination of positive coroots is one. Hence Gr^a\_{≤μ} ≠ ∅ if and only if \[b\] ∈ B(G,μ⁻¹).

3. Connectedness and density (Gleason–Lourenço, Theorems 3.1 and 3.2, whose μ is μ⁻¹ here and whose Gr\_{G,μ} is the closed Schubert variety). Reduce to G adjoint, since the Schubert variety and its admissible locus only depend on the adjoint datum (HS2/adjoint-period-and-tower-comparison), and then to the quasi-split inner form by pure inner twisting (HS0/structure-group-and-inner-form), which replaces the trivial class by a basic class b\_μ, the one with κ(b\_μ) = κ(b) − μ^♮ in their orientation (the paper prints μ^♮ − κ(b)): this is their Theorem 3.2, for b acceptable modulo the centre. With d = ⟨2ρ,μ⟩ the dimension of the Schubert variety, it is enough that every Newton stratum of the cell other than the one over b\_μ has ℓ-dimension < d, and that the boundary of the cell has ℓ-dimension < d: by the dimension criterion (Hansen, Moduli of local shtukas and Harris's conjecture, Corollary 4.11, for connectedness; density holds because a non-empty open subset of the cohomologically smooth cell has ℓ-dimension exactly d and so is not contained in a closed subset of smaller ℓ-dimension) applied to the connected, cohomologically smooth and partially proper cell over C, the admissible part of the cell is connected and dense in the cell, which is the statement for Gr^a\_μ (Howe–Klevdal 7.3.4); then Gr^a\_{≤μ}, which contains it as a dense subset, is connected and dense in the Schubert variety.

4. The dimension bound. For b basic the Beauville–Laszlo map from the quotient of the cell by J\_b(Q\_p) to Bun\_G is cohomologically smooth of dimension d, and non-basic strata of Bun\_G have negative dimension. For b not basic let ν⁻ be the G-antidominant conjugate of ν\_b, M its centraliser, P the standard parabolic with Levi M and b\_M the reduction of b to M with Newton point ν⁻; on L⁺P·ξ^μ the Beauville–Laszlo map factors through Bun\_P. Use that Bun\_P → Bun\_M is cohomologically smooth, of relative ℓ-dimension ⟨2ρ\_G − 2ρ\_M, ν⟩ over the stratum of a class of B(M) with Newton point ν (Gleason–Lourenço, Theorem 2.13, due to Hamann), the bound dim\_ℓ(Bun\_P^{b″} ∖ T\_{b″}) < ⟨2ρ\_G − 2ρ\_M, ν\_{b″}⟩ for basic non-negative classes b″ of B(M) (their Proposition 2.15), and their Lemma 3.3: the geometric fibres of the map (3.7) are empty or torsors under the unipotent filtered automorphism group of E\_b, of dimension ⟨2ρ\_G, ν\_b⟩ = −⟨2ρ\_G − 2ρ\_M, ν⁻⟩ (Fargues–Scholze III.5.1; the paper writes ⟨2ρ\_G − 2ρ\_M, ν\_b⟩ without saying which conjugate is meant).

5. Supplier normalization gate. The present BG2 exports grassmannian-kottwitz-sign, modification-newton-bound and minuscule-modification-image carry the opposite sign for the GS0 point μ(ξ). They are not imported unchanged here. The request to BG2:uniformization must supply κ(BL(Gr\_μ)) = +μ♯, image B(G,μ) and its minuscule equality for a fixed trivial second bundle. A modification from the trivial first bundle to E\_b of type μ uses the inverse Grassmannian orientation, so its nonemptiness condition is \[b\] ∈ B(G,μ⁻¹). The line lattice ξB⁺\_dR glues to O(−1), of κ = +1 (FS II.2.3, pp.60–61; III.2, pp.90–91; VI.2.4, p.199). This supplier correction remains open in the recorded normalization gap.

**Acceptance.**

- For a torus T, B(T,μ⁻¹) is the single class with κ(b) = −μ^♮, and for this class Gr^a\_μ = Gr\_μ = Spd F̆.
- For GL\_2, μ = (2,0) and b = p⁻¹·1: the cell Gr\_μ has dimension 2, the boundary Gr\_{(1,1)} is Spd Q̆\_p, both meet the admissible locus, and Gr^a\_{≤μ} × Spd C is connected and dense in Gr\_{≤μ} × Spd C.
- If κ(b) ≠ −μ^♮ then Gr^a\_{≤μ} is empty.
- For GL\_2, μ = (1,0) and b = diag(p⁻¹,1), Gr^a\_μ × Spd C is the complement of one point in (P¹\_C)^♦: connected and dense, and not all of Gr\_μ.

**Prerequisites.**

- In this roadmap: `HS2/one-leg-period-map`, `HS2/classical-period-points`, `HS2/adjoint-period-and-tower-comparison`, `HS0/structure-group-and-inner-form`.
- In other roadmaps: `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`, `BunGAndNewtonStrata:BG3`, `BunGAndNewtonStrata:BG3/stratum-dimension`, `BunGAndNewtonStrata:BG2:smooth-Artin/bun-g-is-smooth-artin`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `BunGAndNewtonStrata:BG3/full-automorphism-v-group`, `BunGAndNewtonStrata:BG1/admissible-pair`, `BunGAndNewtonStrata:BG1/galois-average`, `BunGAndNewtonStrata:BG1/admissible-finiteness-and-basic`, `BunGAndNewtonStrata:BG1/basic-class`, `BunGAndNewtonStrata:BG1/z-extension-bounded-lifting`, `BunGAndNewtonStrata:BG3/positive-automorphism-kernel`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`, `BunGAndNewtonStrata:BG2:uniformization`.

**Sources.**

- Howe–Klevdal, Proposition 7.3.3, p. 43: Non-emptiness of the admissible part of the cell; the sentence on a rigid analytic point that follows is printed for the whole cell and is meant for the admissible locus.
- Howe–Klevdal, proof of Proposition 7.3.3, p. 43: The reductive case is by reference: Caraiani–Scholze 3.5.3 and Rapoport–Viehmann 3.1.
- Howe–Klevdal, Proposition 7.3.4 and its proof, pp. 43–44: Connectedness of the admissible part of the cell is read off from the proof of Gleason–Lourenço.
- Gleason–Lourenço, Theorem 1.1, p. 3: Connected geometric fibres and density, for the admissible locus of the closed Schubert variety.
- Gleason–Lourenço, Theorem 3.1, p. 10: The same over an algebraically closed C, with the hypothesis b ∈ B(G,μ) in their orientation.
- Gleason–Lourenço, proof of Theorem 3.2, p. 10: The reduction to a dimension bound on the cell.
- Gleason–Lourenço, Introduction, p. 4: The connectedness criterion, quoted from Hansen.
- Gleason–Lourenço, Lemma 3.3, p. 12: The fibre description used in the non-basic case.
- Scholze–Weinstein, Definition 24.1.1, p. 225: The Berkeley orientation of the condition on b.

### Component transitivity of the infinite-level tower

`HS2/component-transitivity-source-gate` · Theorem

**Theorem.** Let G be a reductive group over Q\_p, b ∈ G(Q̆\_p), μ a conjugacy class of cocharacters with reflex field F, with [b] ∈ B(G,μ⁻¹) in the Berkeley orientation (in the orientation of Gleason–Lim–Xu the same tower is attached to the cocharacter μ⁻¹ and their hypothesis is that [b] lies in B of that cocharacter), and C a complete algebraically closed extension of F̆. Write π₀(X) for the set of connected components of |X|. (T) Let a profinite group K act continuously on a topological space A. If A/K is connected, then K acts transitively on π₀(A). Consequently, for every continuous action of a profinite group, π₀(A)/K → π₀(A/K) is bijective. (N) Let a locally profinite group H act continuously on a topological space A, and let K ⊂ H be a compact open subgroup such that every connected component of A/K is open. If A/H is connected, then H acts transitively on π₀(A). (P1) For every compact open K ⊂ G(Q\_p) and every μ: π₀(Sht\_{G,b,μ,K} × Spd C) = π₀(Sht\_{G,b,μ,∞} × Spd C)/K. (P2) If μ is minuscule, G(Q\_p) acts transitively on π₀(Sht\_{G,b,μ,∞} ×\_{Spd F̆} Spd C). (P3) For arbitrary μ, G(Q\_p) acts transitively on π₀(Sht\_{G,b,μ,∞} × Spd C) provided that, for one compact open K ⊂ G(Q\_p), every connected component of |Sht\_{G,b,μ,K} × Spd C| is open. The conclusion of (N) fails without a hypothesis of this kind: for H = Z acting by translation on A = |Z\_p × Spa C|, the quotient A/H is connected and H is not transitive on π₀(A) = Z\_p. (P2) and (P3) are Proposition 3.12 of Gleason–Lim–Xu, which is stated there for all μ.

**Hypotheses and conventions.**

- The base field is Q\_p: G is a reductive group over Q\_p, k is an algebraic closure of F\_p, Q̆\_p = W(k)[1/p] with Frobenius σ, and all v-sheaves and diamonds are over Perf\_k.
- G is reductive over Q\_p and [b] ∈ B(G,μ⁻¹) in the Berkeley orientation, so that the admissible locus is non-empty and geometrically connected; in (T) and (N) the spaces are arbitrary topological spaces and the actions are continuous as maps K × A → A and H × A → A.

**Proof outline.**

1. (T), first part. For N ⊂ K open and normal put Z\_N = A/N; the finite group K/N acts on Z\_N with quotient A/K. A non-empty open and closed subset of Z\_N maps onto the connected space A/K, since the quotient map by a finite group is open and closed, and each fibre of Z\_N → A/K is one K/N-orbit; so Z\_N has at most [K:N] connected components, all open, permuted transitively by K/N. Then T = lim\_N π₀(Z\_N) is a profinite set on which K acts transitively: for t, t′ ∈ T the sets {k ∈ K : k·t\_N = t′\_N} are non-empty, closed and decreasing in N, and K is compact. The map A → T is continuous and equivariant, and it is surjective because its image is a non-empty K-stable subset.
2. (T), second part. Let W be the fibre of A → T over t = (c\_N)\_N and H\_t its stabiliser. Write W\_N for the preimage of c\_N in A, an open and closed subset, so that W = ∩\_N W\_N is closed. For M ⊂ N the image of c\_M in Z\_N is open, closed and contained in c\_N, hence equal to c\_N. So for a ∈ W\_N the sets {n ∈ N : n·a ∈ W\_M}, M ⊂ N, are non-empty; they are closed in N and decrease with M, and N is compact, so there is n ∈ N with n·a ∈ W. Hence W → c\_N is surjective for every N. Its fibres are the orbits of H\_t ∩ N, because n·a ∈ W for a ∈ W and n ∈ N forces n·t = t. It is closed, being the restriction to the closed subset W of the quotient map A → Z\_N by the compact group N, which is closed; so it identifies c\_N with the quotient W/(H\_t ∩ N) and is also open. If W = U ⊔ V with U and V non-empty and open in W, then both map onto the connected c\_N for every N, so every (H\_t ∩ N)-orbit in W meets U and V; but for u ∈ U the orbit (H\_t ∩ N)u lies in U when N is small. So W is connected, the fibres of A → T are the connected components of A, and K is transitive on them. The consequence follows by applying this to the preimage of each component of A/K.
3. (N). For a component c of A, its image in A/K lies in a component D, which is open, and by (T) the preimage of D is K·c. So K·c is open, and so is H·c = ∪\_h h(K·c). The sets H·c partition A into open H-stable subsets, whose images are disjoint open subsets covering the connected space A/H; hence there is only one.
4. (P1)–(P3). Put A = |Sht\_{G,b,μ,∞} × Spd C| and H = G(Q\_p). The action is continuous: for a locally spatial diamond X and a locally profinite group H one has |underline{H} × X| = H × |X| (write H as a disjoint union of cosets of a profinite open subgroup, a cofiltered limit of finite sets, and use that underlying spaces commute with cofiltered limits of locally spatial diamonds along qcqs maps, DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons), and Sht\_{G,b,μ,∞} × Spd C is locally spatial, being a cofiltered limit of the locally spatial finite levels along finite étale maps. Moreover A/H = |Gr^a\_{≤μ} × Spd C| and A/K = |Sht\_{G,b,μ,K} × Spd C|, because Sht\_{G,b,μ,∞} is a G(Q\_p)-torsor over the admissible locus, a surjection of small v-sheaves induces a quotient map of underlying spaces, and the space of a fibre product surjects onto the fibre product of the spaces, so that the fibres of |Sht\_{G,b,μ,∞} × Spd C| over the quotient are the orbits (DiamondsAndVStacks:D3/locally-profinite-torsors and DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks; the first assertion of Gleason–Lim–Xu, Lemma 3.2). (P1) is (T). A/H is connected by HS2/nonemptiness-and-period-connectedness, so (P3) is (N). For minuscule μ, Sht\_{G,b,μ,K} × Spd C is the diamond of the rigid space M\_{G,b,μ,K} ×\_{F̆} C (HS2/minuscule-rigidification), and a rigid space is locally connected, so its connected components are open: (P2).
5. For μ not minuscule the openness of the components of |Sht\_{G,b,μ,K} × Spd C| is not proved in the steps above; it is the hypothesis of (P3). Gleason–Lim–Xu, Theorem 3.9 gives it for parahoric K: the specialisation map induces a bijection of π₀(Sht\_{G,b,μ,K} × Spd C\_p) with π₀ of an affine Deligne–Lusztig variety, whose components are open.

**Acceptance.**

- For a torus T with [b] ∈ B(T,μ⁻¹), Sht\_{T,b,μ,∞} × Spd C is the trivial T(Q\_p)-torsor over Spd C and π₀ is one T(Q\_p)-orbit.
- For GL\_2 with the Lubin–Tate datum, π₀(Sht\_{GL\_2,b,μ,∞} × Spd C) maps onto π₀(M\_{GL\_2,b,μ,GL\_2(Z\_p)} × C) = Z, and the transitive action of GL\_2(Q\_p) induces on this quotient the translation action through ±v\_p∘det.
- For the action of Z on Z\_p × Spa C by translation, the quotient is connected, the components of the total space are the {t} × Spa C for t ∈ Z\_p, and they are not open: the hypothesis of (N) fails for K = 1, and so does its conclusion.

**Prerequisites.**

- In this roadmap: `HS2/nonemptiness-and-period-connectedness`, `HS2/levels-and-tower-limit`, `HS2/minuscule-rigidification`, `HS2/admissible-period-torsor`.
- In other roadmaps: `DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondsAndVStacks:D4/underlying-topological-space`, `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`, `DiamondsAndVStacks:D4/small-quotients-and-underlying-spaces`.

**Sources.**

- Gleason–Lim–Xu, Proposition 3.12, p. 828: The statement, for all μ; (P2) proves it for minuscule μ and (P3) reduces the general case to one input.
- Gleason–Lim–Xu, proof of Proposition 3.12, p. 828: The printed proof. Its use of the component formula of Lemma 3.2 for the non-compact group G(Q\_p) is not valid; steps 1–4 replace it.
- Gleason–Lim–Xu, Lemma 3.2, p. 820: The first equality is used in step 4. The second holds for profinite K by (T) and fails for K = Z.
- Gleason–Lim–Xu, Theorem 3.11, p. 828: Connectedness of the quotient A/H, from Gleason–Lourenço.
- Gleason–Lim–Xu, Theorem 3.9, p. 826: This gives open components at parahoric level for all μ, the components of an affine Deligne–Lusztig variety being open; it rests on integral models of the spaces of shtukas and their local models.
- Scholze–Weinstein, 24.1, after Proposition 24.1.2, p. 225: For minuscule μ the finite levels are diamonds of smooth rigid spaces. That the connected components of a rigid space are open is not stated there; it is the general fact used in step 4.

### Białynicki-Birula comparison on classical period points

`HS2/classical-period-points` · Comparison

**Comparison.** Let G be a reductive group over Q\_p, b ∈ G(Q̆\_p), μ a conjugacy class of cocharacters with reflex field F and F̆ = F·Q̆\_p, in the orientation of Gleason–Lim–Xu §3.6: admissibility is governed by B(G,μ). The translation to the Berkeley orientation of the other nodes of this stage replaces μ by μ⁻¹ throughout: Gr°\_μ ⊂ Gr\_μ denote here the Schubert cell and the Schubert variety that are there the cell Gr\_{μ⁻¹} and the variety Gr\_{G,Spd F̆,≤μ⁻¹} (the L⁺G-orbit of μ(ξ)⁻¹ and its closure); Gr^b\_μ ⊂ Gr\_μ is the admissible locus of HS2/one-leg-period-map for the datum (G, b, μ⁻¹); Fl\_μ = G/P\_μ is the variety of filtrations of type μ, where P\_μ = {g : lim\_{t→0} μ(t)gμ(t)⁻¹ exists} is the stabiliser of the filtration defined by μ, so that Fl\_μ is the flag variety Fl\_{G,μ⁻¹} of Scholze–Weinstein Definition 19.4.1; and BB: Gr°\_μ → Fl\_μ^♦ is the Białynicki-Birula map of Scholze–Weinstein 19.4.2 for the cocharacter μ⁻¹. A filtration of type μ has Hodge numbers given by μ, and [b] ∈ B(G,μ) is the condition of Scholze–Weinstein Definition 24.1.1 for the datum (G, b, μ⁻¹). (a) If μ is minuscule, BB is an isomorphism. (b) For every μ and every finite extension L of F̆, BB induces a bijection Gr°\_μ(Spd L) → Fl\_μ(L). (c) Assume κ\_G(b) = μ^♮ in π\_1(G)\_Γ. Then for every finite extension L of F̆, BB restricts to a bijection from the b-admissible points (Gr°\_μ ∩ Gr^b\_μ)(Spd L) onto the weakly admissible points Fl^wa\_μ(L): the x ∈ Fl\_μ(L) such that for every V ∈ Rep\_{Q\_p}(G) the filtered isocrystal (V ⊗ Q̆\_p, bσ, Fil\_x) is weakly admissible. This locus is written Fl^adm\_μ in Gleason–Lim–Xu. (d) Without the hypothesis on κ\_G(b), (c) fails: for T the norm-one torus of a quadratic extension of Q\_p, μ = 0 and b the non-trivial class of B(T) = Z/2, Fl^wa\_0(L) is a point and Gr^b\_0 is empty. (e) For μ not minuscule BB is not an isomorphism; (b) and (c) concern points over finite extensions of F̆ only.

**Hypotheses and conventions.**

- The base field is Q\_p: G is a reductive group over Q\_p, k is an algebraic closure of F\_p, Q̆\_p = W(k)[1/p] with Frobenius σ, and all v-sheaves and diamonds are over Perf\_k.
- G is reductive over Q\_p; L runs through the finite extensions of F̆; in (c), κ\_G(b) = μ^♮ in the orientation of Gleason–Lim–Xu, which holds when [b] ∈ B(G,μ).

**Proof outline.**

1. (a) is Scholze–Weinstein 19.4.2. BB is defined through the Tannakian formalism from GL\_n, where a lattice Ξ of relative position μ gives the filtration Fil^i\_Ξ = (ξ^iΞ ∩ B\_dR⁺(R♯)^n)/(ξ^iΞ ∩ ξB\_dR⁺(R♯)^n); for minuscule μ it is bijective on (C,C⁺)-points between spaces that are qcqs over Spd C.
2. (b): let C be the completed algebraic closure of L. A point of Gr°\_μ(Spd L) is a family, exact and tensor-compatible in V ∈ Rep(G), of Gal(L̄/L)-stable B\_dR⁺(C)-lattices of type μ in V ⊗ B\_dR(C). By Tate's theorem, H⁰ and H¹ of Gal(L̄/L) in C(i) vanish for i ≠ 0; hence a Galois-stable lattice Λ is recovered from its filtration, Λ = Fil⁰(V\_L ⊗\_L B\_dR(C)), and every filtration of V\_L of the type given by μ arises. Gleason–Lim–Xu quote (b) from Viehmann, On Newton strata in the B\_dR⁺-Grassmannian, Theorem 5.2.
3. (c): x ∈ Gr°\_μ(Spd L) is b-admissible if and only if the modification E\_x of E\_b is trivial at the geometric point. The vector bundles E\_x(V) are the modifications attached to the filtered isocrystals (V ⊗ Q̆\_p, bσ, Fil\_x), and they are semistable of slope 0 if and only if these are weakly admissible (Colmez–Fontaine, quoted by Gleason–Lim–Xu). So BB(x) is weakly admissible if and only if E\_x is a basic class e with ν\_e = 0; such a class is trivial if and only if κ\_G(e) = 0, and κ\_G(e) = κ\_G(b) − μ^♮: in this orientation E\_x has position μ⁻¹ relative to E\_b, and HS0/structure-group-and-inner-form (d) gives κ\_G(e) = κ\_G(b) + (μ⁻¹)^♮. The crystalline representation of an admissible x is x^\*𝕃\_b (HS2/admissible-period-torsor).
4. (d): for the norm-one torus T of a quadratic extension, X\_\*(T)\_Γ = Z/2; with μ = 0 and ν\_b = 0 every filtered isocrystal (V ⊗ Q̆\_p, bσ, trivial filtration) is weakly admissible, while E\_b is a non-trivial T-bundle, so no point is admissible.

**Acceptance.**

- For GL\_2 and μ minuscule and not central, BB: Gr\_μ → (P¹)^♦ is an isomorphism.
- For GL\_2 and μ = (2,0), the geometric fibres of BB: Gr°\_μ → (P¹)^♦ are (A¹)^♦, and Gr°\_μ(Spd L) → P¹(L) is bijective for every finite extension L of Q̆\_p.
- For GL\_2, b = diag(p,1) and μ = (1,0) in the orientation of Gleason–Lim–Xu, the admissible points of P¹(L) are the complement of one Q̆\_p-rational point.
- For GL\_2, b basic with κ(b) = 1 and μ = (1,0) in the same orientation, every point of P¹(L) is weakly admissible and admissible.

**Prerequisites.**

- In this roadmap: `HS2/one-leg-period-map`, `HS2/admissible-period-torsor`, `HS0/structure-group-and-inner-form`.
- In other roadmaps: `GeometricSatakeAndFusion:GS0:Schubert-smoothness`, `PadicHodgeTheory:R06.2`, `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`, `BunGAndNewtonStrata:BG1/classification-by-two-invariants`, `BunGAndNewtonStrata:BG1/torus-norm-description`, `BunGAndNewtonStrata:BG1/admissible-pair`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`.

**Sources.**

- Gleason–Lim–Xu, §3.6, p. 829: Statements (a), (b) and (e); (b) is given by reference to Viehmann.
- Gleason–Lim–Xu, §3.6, p. 829: Statement (c), by reference to Colmez–Fontaine; the hypothesis b ∈ B(G,μ) is the standing one of the paper.
- Scholze–Weinstein, Proposition 19.4.2, pp. 176–177: The Białynicki-Birula map and statement (a).

### Ad-isomorphism of admissible period towers

`HS2/adjoint-period-and-tower-comparison` · Comparison

**Comparison.** A morphism f: G → H of reductive groups over Q\_p is an ad-isomorphism if f maps the centre of G into the centre of H and induces an isomorphism of adjoint groups. Let f be an ad-isomorphism, b ∈ G(Q̆\_p), μ a conjugacy class of cocharacters of G with reflex field F, b\_H = f(b), and μ\_H = f∘μ with reflex field F\_H ⊂ F. Assume [b] ∈ B(G,μ) in the orientation of Gleason–Lim–Xu; then [b\_H] ∈ B(H,μ\_H). In this orientation Gr\_{G,Spd F̆,≤μ}, its b-admissible locus and Sht\_{G,b,μ,K} denote the objects that the other nodes of this stage, written in the Berkeley orientation, attach to the datum (G, b, μ⁻¹): the Schubert variety Gr\_{G,Spd F̆,≤μ⁻¹} (the closure of the L⁺G-orbit of μ(ξ)⁻¹), its admissible locus (HS2/one-leg-period-map) and the tower Sht\_{G,b,μ⁻¹,K} (HS2/levels-and-tower-limit), for which the condition of Scholze–Weinstein Definition 24.1.1 is [b] ∈ B(G,μ); likewise for H and μ\_H. Equivalently, in the Berkeley orientation: if [b] ∈ B(G,μ⁻¹), then statements (1)–(4) hold for the Schubert varieties, admissible loci and towers that the other nodes attach to (G, b, μ) and (H, b\_H, μ\_H). (1) f induces an isomorphism Gr\_{G,Spd F̆,≤μ} ≅ Gr\_{H,Spd F̆\_H,≤μ\_H} ×\_{Spd F̆\_H} Spd F̆. (2) Under (1), the b-admissible locus is the base change of the b\_H-admissible locus. (3) The G(Q\_p)-equivariant map Sht\_{G,b,μ,∞} → Sht\_{H,b\_H,μ\_H,∞} ×\_{Spd F̆\_H} Spd F̆ given by extension of structure group induces an isomorphism of H(Q\_p)-torsors over the common admissible locus, Sht\_{G,b,μ,∞} ×^{G(Q\_p)} H(Q\_p) ≅ Sht\_{H,b\_H,μ\_H,∞} ×\_{Spd F̆\_H} Spd F̆, equivariant for J\_b(Q\_p) → J\_{b\_H}(Q\_p). (4) Consequently, for K\_H ⊂ H(Q\_p) compact open, Sht\_{H,b\_H,μ\_H,K\_H} ×\_{Spd F̆\_H} Spd F̆ ≅ Sht\_{G,b,μ,∞} ×^{G(Q\_p)} (H(Q\_p)/K\_H); when G(Q\_p) → H(Q\_p) is surjective this is Sht\_{G,b,μ,∞}/f⁻¹(K\_H). (2) and (3) fail without the hypothesis κ\_G(b) = μ^♮: for a torus T, the map T → 1 is an ad-isomorphism, Sht\_{1,1,0,∞} = Spd Q̆\_p, and Sht\_{T,b,μ,∞} is empty when κ\_T(b) ≠ μ^♮. The base change to Spd F̆ cannot be omitted when F̆\_H ≠ F̆.

**Hypotheses and conventions.**

- The base field is Q\_p: G is a reductive group over Q\_p, k is an algebraic closure of F\_p, Q̆\_p = W(k)[1/p] with Frobenius σ, and all v-sheaves and diamonds are over Perf\_k.
- G and H are reductive over Q\_p, f is an ad-isomorphism, and [b] ∈ B(G,μ) in the orientation of Gleason–Lim–Xu; μ is arbitrary.

**Proof outline.**

1. (1): the map Gr\_{G,≤μ} → Gr\_{H,≤μ\_H} ×\_{Spd F̆\_H} Spd F̆ is a proper map of spatial diamonds over Spd F̆, hence an isomorphism as soon as it is bijective on (C,C⁺)-points. On C-points: G(B\_dR⁺(C)) → G\_ad(B\_dR⁺(C)) is surjective, the fibres of Gr\_G(C) → Gr\_{G\_ad}(C) are orbits of the discrete group Z\_G(B\_dR(C))/Z\_G(B\_dR⁺(C)), which acts freely on π₀(Gr\_G) = π\_1(G), and a Schubert variety lies in one component; the same holds for H, and G\_ad = H\_ad. This is Step 1 of the proof of Gleason–Lim–Xu, Proposition 6.6(1), given there by reference to Anschütz–Gleason–Lourenço–Richarz, Proposition 4.16.

2. (2): both loci are open, so it is enough to compare geometric points. For x ∈ Gr\_{G,≤μ}(C) let e ∈ B(G) be the class of the modification E of E\_b at x. Then κ\_G(e) = κ\_G(b) − μ^♮ = 0: in this orientation E has position ≤ μ⁻¹ relative to E\_b, so HS0/structure-group-and-inner-form (d) gives κ\_G(e) = κ\_G(b) + (μ⁻¹)^♮, and κ\_G(b) = μ^♮. The bundle f\_\*E has class f(e) with κ\_H(f(e)) = 0. A class with trivial Kottwitz invariant is trivial if and only if it is basic, and e is basic if and only if f(e) is, because centrality of the Newton point can be tested in the adjoint group (BG1).

3. (3): over the common admissible locus both sides are pro-étale H(Q\_p)-torsors (HS2/admissible-period-torsor), the image of G(Q\_p) in H(Q\_p) being closed; the map induced by extension of structure group is H(Q\_p)-equivariant, and a morphism of torsors is an isomorphism. (4) is the quotient of (3) by K\_H.

4. Supplier normalization gate. The present BG2 exports grassmannian-kottwitz-sign, modification-newton-bound and minuscule-modification-image carry the opposite sign for the GS0 point μ(ξ). They are not imported unchanged here. The request to BG2:uniformization must supply κ(BL(Gr\_μ)) = +μ♯, image B(G,μ) and its minuscule equality for a fixed trivial second bundle. A modification from the trivial first bundle to E\_b of type μ uses the inverse Grassmannian orientation, so its nonemptiness condition is \[b\] ∈ B(G,μ⁻¹). The line lattice ξB⁺\_dR glues to O(−1), of κ = +1 (FS II.2.3, pp.60–61; III.2, pp.90–91; VI.2.4, p.199). This supplier correction remains open in the recorded normalization gap.

**Acceptance.**

- For a torus T with [b] ∈ B(T,μ) and f: T → 1: Sht\_{T,b,μ,∞}/T(Q\_p) = Spd F̆ = Sht\_{1,1,0,∞} ×\_{Spd Q̆\_p} Spd F̆.
- For T = Res\_{L/Q\_p} G\_m with L/Q\_p a ramified quadratic extension and μ the cocharacter of one embedding, F = L and Spd L̆ ≠ Spd Q̆\_p: the identification (3) for T → 1 does not hold before base change to Spd F̆.
- For GL\_2 → PGL\_2 and the Lubin–Tate datum (b basic with E\_b ≅ O(1/2), μ = (1,0) in the Berkeley orientation): Sht\_{PGL\_2,b̄,μ̄,PGL\_2(Z\_p)} = Sht\_{GL\_2,b,μ,∞}/(Q\_p^×·GL\_2(Z\_p)) = (∐\_{h∈Z} D̊)/p^Z, the diamond of two open unit discs over Q̆\_p.
- For μ = 0 and b = 1 both sides of (3) are the constant torsor H(Q\_p) × Spd Q̆\_p.

**Prerequisites.**

- In this roadmap: `HS2/one-leg-period-map`, `HS2/levels-and-tower-limit`, `HS2/admissible-period-torsor`, `HS0/structure-group-and-inner-form`.
- In other roadmaps: `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks`, `BunGAndNewtonStrata:BG1/classification-by-two-invariants`, `BunGAndNewtonStrata:BG1/basic-class`, `BunGAndNewtonStrata:BG1/admissible-pair`, `BunGAndNewtonStrata:BG1/z-extension-bounded-lifting`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`, `BunGAndNewtonStrata:BG2:uniformization`.

**Sources.**

- Gleason–Lim–Xu, Definition 3.14, p. 829: Definition of ad-isomorphism.
- Gleason–Lim–Xu, Proposition 6.6(1), p. 849: Statement (3); the printed identity omits the base change to the reflex field of μ.
- Gleason–Lim–Xu, proof of Proposition 6.6(1), Step 1, p. 850: Statement (1), with the bijectivity on points left to a reference.
- Gleason–Lim–Xu, proof of Proposition 6.6(1), Step 2, p. 850: Statement (2); the argument needs κ of the modified bundle to vanish, that is b ∈ B(G,μ).
- Gleason–Lim–Xu, proof of Proposition 6.6(1), Step 3, p. 850: Statement (3): a map of H(Q\_p)-torsors is an isomorphism.
- Gleason–Lim–Xu, §1, p. 807; repeated in Theorem 6.1, p. 845: The standing hypothesis of the paper, under which Proposition 6.6 is stated; Theorem 6.1 repeats it as the hypothesis b ∈ B(G,𝝁).
- Gleason–Lim–Xu, proof of Proposition 6.7, p. 851: The base change to the larger reflex field, written out where the proposition is applied to a z-extension.

### Tori, products, functoriality in the group, and the determinant map

`HS2/torus-products-and-determinant` · Comparison

**Comparison.** All groups are reductive over Q\_p. The orientation is that of Gleason–Lim–Xu: [b] ∈ B(G,μ) means κ\_G(b) = μ^♮ and μ^♦ − ν\_b is a non-negative rational combination of simple coroots; in the Berkeley orientation μ is replaced by μ⁻¹: Gr\_{G,Spd F̆,≤μ} and Sht\_{G,b,μ,K} denote here the Schubert variety and the tower that HS2/one-leg-period-map and HS2/levels-and-tower-limit attach to the datum (G, b, μ⁻¹), the Schubert variety being the closure of the L⁺G-orbit of μ(ξ)⁻¹, and [b] ∈ B(G,μ) is the condition of Scholze–Weinstein Definition 24.1.1 for (G, b, μ⁻¹). Statements (2)–(4) read the same in both orientations. (1) Tori. Let T be a torus, μ ∈ X\_\*(T) with reflex field F, and b ∈ T(Q̆\_p). Then Gr\_{T,Spd F̆,≤μ} = Spd F̆. If κ\_T(b) ≠ μ^♮, Sht\_{T,b,μ,K} is empty for all K. If κ\_T(b) = μ^♮, that is [b] ∈ B(T,μ), then all of Spd F̆ is admissible, Sht\_{T,b,μ,∞} → Spd F̆ is a pro-étale T(Q\_p)-torsor, Sht\_{T,b,μ,∞} ×\_{Spd F̆} Spd C\_p is a trivial T(Q\_p)-torsor over Spd C\_p, π₀(Sht\_{T,b,μ,∞} × Spd C\_p) is a T(Q\_p)-torsor, and Sht\_{T,b,μ,K} × Spd C\_p ≅ T(Q\_p)/K × Spd C\_p for every compact open K. (2) Products. For G = G\_1 × G\_2, b = (b\_1,b\_2), μ = (μ\_1,μ\_2) with reflex fields F\_1, F\_2 and F = F\_1F\_2, and K = K\_1 × K\_2: Sht\_{G,b,μ,K} ≅ (Sht\_{G\_1,b\_1,μ\_1,K\_1} ×\_{Spd F̆\_1} Spd F̆) ×\_{Spd F̆} (Sht\_{G\_2,b\_2,μ\_2,K\_2} ×\_{Spd F̆\_2} Spd F̆), compatibly with the period maps to Gr\_{G,≤μ} = Gr\_{G\_1,≤μ\_1} × Gr\_{G\_2,≤μ\_2} over Spd F̆ and with the group actions. (3) Functoriality. For a morphism f: G → H, b\_H = f(b), μ\_H = f∘μ with reflex field F\_H ⊂ F, and compact open subgroups with f(K) ⊂ K\_H, extension of structure group defines Sht\_{G,b,μ,K} → Sht\_{H,b\_H,μ\_H,K\_H} over Spd F̆ → Spd F̆\_H, compatible with period maps, with transition maps, with G(Q\_p) → H(Q\_p), and with composition of morphisms. (4) Determinant. For G^ab = G/G^der and det: G → G^ab, the subgroup K^ab := det(K) of G^ab(Q\_p) is compact open, and (3) gives det: Sht\_{G,b,μ,K} → Sht\_{G^ab,b^ab,μ^ab,K^ab}. K^ab can be strictly smaller than the maximal compact subgroup of G^ab(Q\_p).

**Hypotheses and conventions.**

- The base field is Q\_p: G is a reductive group over Q\_p, k is an algebraic closure of F\_p, Q̆\_p = W(k)[1/p] with Frobenius σ, and all v-sheaves and diamonds are over Perf\_k.
- All groups are over Q\_p. In (1), b ∈ T(Q̆\_p) is arbitrary and the two cases are distinguished by κ\_T(b); in (2)–(4) no condition on b is needed.

**Proof outline.**

1. (1): T(B\_dR)/T(B\_dR⁺) = X\_\*(T) is discrete and the Schubert variety of this orientation is the single point μ(ξ)⁻¹, so Gr\_{T,≤μ} = Spd F̆. For a torus, B(T) = X\_\*(T)\_Γ through κ and every class is basic; the modification of E\_b by the lattice μ(ξ)⁻¹ has position μ⁻¹ relative to E\_b, so its κ is κ\_T(b) + (μ⁻¹)^♮ = κ\_T(b) − μ^♮ (HS0/structure-group-and-inner-form (d)). So the modification is trivial at a geometric point if and only if κ\_T(b) = μ^♮. The torsor is that of HS2/admissible-period-torsor, levels are those of HS2/levels-and-tower-limit, and a pro-étale torsor under a locally profinite group over the geometric point Spd C\_p is trivial. Gleason–Lim–Xu state the torsor property after Proposition 6.4, with a reference.
2. (2): a torsor under G\_1 × G\_2 is a pair of torsors, and Frobenius structures, framings, meromorphy and trivialisations decompose; the Bruhat order on dominant cocharacters of G\_1 × G\_2 is the product order, so Gr\_{G,≤μ} is the product and the bound is the pair of bounds; a K\_1 × K\_2-lattice in a G\_1(Q\_p) × G\_2(Q\_p)-torsor is a pair of lattices. Lemma 3.6 of Gleason–Lim–Xu is the corresponding statement for affine Deligne–Lusztig varieties; for shtukas the statement is this direct argument.
3. (3): push the torsors forward along f (HS0/structure-group-and-inner-form); f maps Gr\_{G,≤μ} to Gr\_{H,≤μ\_H}, admissible points to admissible points, and the G(Q\_p)-torsor of trivialisations to the H(Q\_p)-torsor, K-lattices going to K\_H-lattices when f(K) ⊂ K\_H. (4): det: G(Q\_p) → G^ab(Q\_p) is an open map because G → G^ab is smooth, so det(K) is compact and open.

**Acceptance.**

- For T = G\_m, μ = id in the Berkeley orientation, b = p⁻¹ and K = Z\_p^×: Sht\_{T,b,μ,K} × Spd C\_p ≅ Z × Spd C\_p.
- For G = GL\_n: det(GL\_n(Z\_p)) = Z\_p^× and det(1 + p^m M\_n(Z\_p)) = 1 + p^m Z\_p; for K = {g ∈ GL\_n(Z\_p) : det g ∈ 1 + pZ\_p} one has K^ab = 1 + pZ\_p.
- For the Lubin–Tate datum of GL\_2 and K = GL\_2(Z\_p), det induces a bijection π₀(Sht\_{GL\_2,b,μ,K} × Spd C\_p) → π₀(Sht\_{G\_m,det b,det∘μ,Z\_p^×} × Spd C\_p) ≅ Z.
- For G = 1 every level is Spd Q̆\_p.

**Prerequisites.**

- In this roadmap: `HS2/levels-and-tower-limit`, `HS0/structure-group-and-inner-form`, `HS2/admissible-period-torsor`, `HS2/one-leg-period-map`.
- In other roadmaps: `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`, `ReductiveGroupsPartII:RG2.0`, `BunGAndNewtonStrata:BG1/torus-norm-description`, `BunGAndNewtonStrata:BG1/admissible-pair`.

**Sources.**

- Gleason–Lim–Xu, Proposition 6.4, p. 848: The hypothesis of the torus statement.
- Gleason–Lim–Xu, Proposition 6.4(2) and the paragraph after it, pp. 848–849: Part (1) after base change to C\_p, given with a reference.
- Gleason–Lim–Xu, §3.4, ¶8, (3.6), p. 824: Part (3), with the condition f(K) ⊆ K\_H.
- Gleason–Lim–Xu, §3.4, (3.7), p. 824: Part (4): the level of the determinant map is det(K).
- Gleason–Lim–Xu, Lemma 3.6, p. 824: The product statement of the source is for affine Deligne–Lusztig varieties; part (2) is its analogue for shtukas, proved in step 2.

### Universal torsor on the admissible period locus

`HS2/admissible-period-torsor` · Construction

**Construction.** Let G be a reductive group over Q\_p, b ∈ G(Q̆\_p), μ a conjugacy class of cocharacters with reflex field F, in the Berkeley orientation, and Gr^a\_{≤μ} ⊂ Gr\_{G,Spd F̆,≤μ} the admissible locus: the open locus where the modification E\_x of E\_b at x is trivial at every geometric point. (1) 𝕃\_b → Gr^a\_{≤μ} is the sheaf S ↦ {(x, τ) : x ∈ Gr^a\_{≤μ}(S), τ: E\_1 ≅ E\_x an isomorphism of G-bundles on X\_S}. It is a pro-étale G(Q\_p)-torsor, G(Q\_p) = Aut(E\_1) acting on the right by τ·g = τ∘g; the left action g·τ = τ∘g⁻¹ is the action of HS2/levels-and-tower-limit (d), for which g maps 𝕃\_b/K isomorphically onto 𝕃\_b/gKg⁻¹. The group J\_b(Q\_p) ⊂ Aut(E\_b), which is the whole of Aut(E\_b) when b is basic, acts on 𝕃\_b, compatibly with its action on Gr^a\_{≤μ} through J\_b(Q\_p) ⊂ G(Q̆\_p) ⊂ G(B\_dR⁺), and commutes with G(Q\_p). (2) 𝕃\_b = Sht\_{G,b,μ,∞} over Gr^a\_{≤μ}, with projection π\_GM, and 𝕃\_b/K = Sht\_{G,b,μ,K} for every compact open K ⊂ G(Q\_p). (3) For V ∈ Rep\_{Q\_p}(G), 𝕃\_b ×^{G(Q\_p)} V is the pro-étale Q\_p-local system on Gr^a\_{≤μ} attached to the vector bundle E\_x(V), which is trivial at geometric points; V ↦ 𝕃\_b ×^{G(Q\_p)} V is an exact tensor functor. (4) For a finite extension L of F̆ and x ∈ Gr^a\_{≤μ}(Spd L), the torsor x^\*𝕃\_b is a conjugacy class of continuous homomorphisms ρ\_x: Gal(L̄/L) → G(Q\_p); ρ\_x is crystalline, its isocrystal with G-structure is the one defined by b, and its Hodge filtration is the image of x under the Białynicki-Birula map: if x lies in the Schubert cell Gr\_{μ′}, μ′ ≤ μ, then in the normalisation of Howe–Klevdal the Hodge filtration has type μ′⁻¹ and the Hodge–Tate filtration has type μ′. Points of Gr^a\_{≤μ} outside the open cell Gr\_μ have a type μ′ ≠ μ. (5) 𝕃\_b is in general not trivial over Gr^a\_{≤μ}, nor over a point Spd L.

**Hypotheses and conventions.**

- The base field is Q\_p: G is a reductive group over Q\_p, k is an algebraic closure of F\_p, Q̆\_p = W(k)[1/p] with Frobenius σ, and all v-sheaves and diamonds are over Perf\_k.
- G is reductive over Q\_p, μ is arbitrary and b ∈ G(Q̆\_p); the admissible locus is non-empty exactly when [b] ∈ B(G,μ⁻¹). In (4), L is a finite extension of F̆.

**Construction.**

1. For S → Gr^a\_{≤μ} the bundle E\_x on X\_S is trivial at geometric points, so Isom(E\_1, E\_x) is a pro-étale G(Q\_p)-torsor, by the identification of the geometrically fibrewise trivial locus of Bun\_G with the classifying stack of pro-étale G(Q\_p)-torsors (Scholze–Weinstein 22.5.2; Fargues–Scholze III.2.4). The actions of Aut(E\_1) and Aut(E\_b) are by composition; J\_b(Q\_p) acts on the Grassmannian by left multiplication through G(Q̆\_p) because it acts on the canonical trivialisation of the pullback of E\_b to Y\_S.
2. (2): by Scholze–Weinstein 23.3.1 and the description of the limit after it, an S-point of Sht\_{G,b,μ,∞} is a pair (S♯, α) with α: E\_1 ≅ E\_b away from S♯, meromorphic and bounded by μ, that is a point x with a trivialisation of E\_x; the fibre of π\_GM at level K is the sheaf of K-lattices in 𝕃\_b (23.3.3). (3): 𝕃\_b ×^{G(Q\_p)} V is the local system of the pushout bundle E\_x(V), by the Tannakian description of G-bundles.
3. (4): for x ∈ Gr^a\_{≤μ}(Spd L) and V ∈ Rep(G), E\_x(V) is the modification of E\_b(V) by the lattice x(V), and its global sections over the curve of the completed algebraic closure of L form the crystalline representation with filtered isocrystal (V ⊗ Q̆\_p, bσ, Fil\_x). This is the crystalline property at classical points: Gleason–Lim–Xu (§3.5) give it by reference to Gleason, and Howe–Klevdal (proof of Theorem 7.2.3) to their Part I, Theorem 5.5.1; it rests on the theorem of Colmez–Fontaine that weakly admissible filtered isocrystals are admissible. The types of the two filtrations follow from the convention relating lattices and filtrations (Howe–Klevdal §7.2).
4. (5): for G = G\_m, μ = id and b = p⁻¹ the torsor is the torsor of bases of Q\_p(1) over Spd Q̆\_p, which is not trivial.

**API.**

- `admissiblePeriodTorsor` (constructor): 𝕃\_b → Gr^a\_{≤μ}: the sheaf of pairs (x, τ) with x a point of the admissible locus and τ: E\_1 ≅ E\_x a trivialisation of the modified bundle; a pro-étale G(Q\_p)-torsor for the right action τ·g = τ∘g.
- `admissiblePeriodTorsor.lift` (universal-property): For every perfectoid S and x: S → Gr^a\_{≤μ}, the sections of x^\*𝕃\_b over S are the isomorphisms E\_1 ≅ E\_x on X\_S; a map S → Sht\_{G,b,μ,∞} is the same as a pair (x, τ).
- `admissiblePeriodTorsor.total_space` (equivalence): 𝕃\_b ≅ Sht\_{G,b,μ,∞} over Gr^a\_{≤μ}, equivariantly for G(Q\_p) × J\_b(Q\_p), the projection being π\_GM.
- `admissiblePeriodTorsor.level_quotient` (relation): 𝕃\_b/K ≅ Sht\_{G,b,μ,K} for K ⊂ G(Q\_p) compact open, compatibly with transition maps, and 𝕃\_b = lim\_K 𝕃\_b/K.
- `admissiblePeriodTorsor.actions` (structure): G(Q\_p) acts on 𝕃\_b on the right over Gr^a\_{≤μ}, by τ·g = τ∘g; the associated left action g·τ = τ∘g⁻¹ is the one of HS2/levels-and-tower-limit (d) and induces 𝕃\_b/K ≅ 𝕃\_b/gKg⁻¹, while right translation by g induces 𝕃\_b/K ≅ 𝕃\_b/g⁻¹Kg. J\_b(Q\_p) acts on the left, covering its action on Gr^a\_{≤μ}; the actions of the two groups commute.
- `admissiblePeriodTorsor.localSystem` (functoriality): V ↦ 𝕃\_b ×^{G(Q\_p)} V is an exact tensor functor from Rep\_{Q\_p}(G) to pro-étale Q\_p-local systems on Gr^a\_{≤μ}, with value at x the local system of global sections of E\_x(V).
- `admissiblePeriodTorsor.pushforward` (functoriality): For f: G → H, the torsor 𝕃\_b ×^{G(Q\_p)} H(Q\_p) is the pullback of 𝕃\_{f(b)} along Gr^a\_{G,≤μ} → Gr^a\_{H,≤f∘μ}; compatible with composition of morphisms.
- `admissiblePeriodTorsor.classical_point` (characterisation): For L finite over F̆ and x ∈ Gr^a\_{≤μ}(Spd L): x^\*𝕃\_b is the torsor of a crystalline ρ\_x: Gal(L̄/L) → G(Q\_p), with D\_cris(V∘ρ\_x) ≅ (V ⊗ Q̆\_p, bσ) functorially in V and Hodge filtration BB(x).
- `admissiblePeriodTorsor.torus` (example): For G = G\_m, μ = id, b = p⁻¹: 𝕃\_b is the torsor of bases of Q\_p(1) over Spd Q̆\_p, that is of non-zero sections of O(1) vanishing at the leg.

**Unit tests.**

- `admissiblePeriodTorsor.trivial_datum_test` (degenerate): For μ = 0: Gr\_{≤0} = Spd Q̆\_p; for b = 1, 𝕃\_1 = G(Q\_p) × Spd Q̆\_p with G(Q\_p) acting by right translation and J\_1(Q\_p) = G(Q\_p) by left translation; for [b] ≠ 1 the admissible locus and 𝕃\_b are empty.
- `admissiblePeriodTorsor.cyclotomic_test` (computation): For G = G\_m, μ = id and b = p⁻¹: Gr^a\_{≤μ} = Spd Q̆\_p, 𝕃\_b ×^{Q\_p^×} Q\_p ≅ Q\_p(1), the character of Gal(Q̄\_p/Q̆\_p) defined by 𝕃\_b is the cyclotomic character, D\_cris(Q\_p(1)) = (Q̆\_p, p⁻¹σ), and 𝕃\_b/(1 + p^mZ\_p) ≅ Z × Spd Q̆\_p(ζ\_{p^m}) for m ≥ 1.
- `admissiblePeriodTorsor.tate_module_test` (compatibility): For G = GL\_n, μ = (1^d,0^{n−d}) and b the Frobenius of the covariant Dieudonné module of a p-divisible group X of dimension d and height n, in the normalisation of Scholze–Weinstein in which μ\_{p^∞} has Frobenius p⁻¹σ: the pullback of 𝕃\_b ×^{GL\_n(Q\_p)} Q\_p^n to the generic fibre of the Rapoport–Zink space of X is the rational Tate module of the universal p-divisible group, and the lattice defining the map to Sht\_{GL\_n,b,μ,GL\_n(Z\_p)} is its Tate module.
- `admissiblePeriodTorsor.level_test` (characterisation): For K ⊂ G(Q\_p) compact open the fibre of 𝕃\_b/K = Sht\_{G,b,μ,K} over a geometric point of Gr^a\_{≤μ} is G(Q\_p)/K, and pro-étale locally on S → Gr^a\_{≤μ} the pullback of 𝕃\_b/K is S × G(Q\_p)/K.
- `admissiblePeriodTorsor.boundary_test` (non-example): For G = GL\_2, μ = (2,0) and b = p⁻¹·1: the closed stratum Gr\_{(1,1)} = Spd Q̆\_p lies in Gr^a\_{≤μ}, and 𝕃\_b restricts to it as the torsor of bases of Q\_p(1)², of type μ′ = (1,1) in the sense of (4) and not of type μ = (2,0).

**Uses.**

- HeckeStacksAndLocalShtukas:HS2/component-transitivity-source-gate: The lemma on components is applied to the action of G(Q\_p) on |𝕃\_b × Spd C|, whose quotient is |Gr^a\_{≤μ} × Spd C|.
- HeckeStacksAndLocalShtukas:HS2/classical-period-points: x^\*𝕃\_b is the crystalline representation attached to an admissible classical point x.
- HeckeStacksAndLocalShtukas:HS2/adjoint-period-and-tower-comparison: For an ad-isomorphism f, the map of torsors 𝕃\_b ×^{G(Q\_p)} H(Q\_p) → 𝕃\_{f(b)} is an isomorphism.
- HeckeStacksAndLocalShtukas:HS2/torus-products-and-determinant: For a torus the torsor lives over Spd F̆ and becomes trivial over Spd C\_p.
- Gleason–Lim–Xu, Proposition 5.9: A classical point x whose crystalline representation ρ\_x has image meeting G^der(Q\_p) in an open subgroup is produced from this torsor.

**Acceptance.**

- For μ = 0 and b = 1 the torsor is G(Q\_p) × Spd Q̆\_p.
- For a torus T with [b] ∈ B(T,μ⁻¹) the base is Spd F̆ and 𝕃\_b/K has T(Q\_p)/K as set of geometric points.
- For GL\_2, μ = (2,0) and b = p⁻¹·1, the point of the closed stratum Gr\_{(1,1)} is admissible and has type (1,1).

**Prerequisites.**

- In this roadmap: `HS2/one-leg-period-map`, `HS2/levels-and-tower-limit`.
- In other roadmaps: `PadicHodgeTheory:R06.2`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `BunGAndNewtonStrata:BG2:uniformization/geometrically-trivial-locus`.

**Sources.**

- Gleason–Lim–Xu, §3.5, p. 828: The torsor 𝕃\_b and its pullback to points over finite extensions; the crystalline property is given by reference.
- Gleason–Lim–Xu, §3.5, p. 828: Statement (2): the infinite level is the space of trivialisations of 𝕃\_b.
- Scholze–Weinstein, proof of Proposition 23.3.3, p. 220: The pro-étale G(Q\_p)-torsor on the admissible locus and the finite levels as K-lattices.
- Howe–Klevdal, §7.2, after Definition 7.2.2, p. 42: Normalisation of the types in (4): Hodge filtration of type μ⁻¹; the next sentence gives type μ for the Hodge–Tate filtration.
- Howe–Klevdal, proof of Theorem 7.2.3, p. 42: The crystalline property at classical points, by reference to Part I.
- Gleason–Lim–Xu, §1.4, footnote 8, p. 812: The Tate-module description used in the third test.

### Structure maps of the tower: separated, compactifiable, of locally finite dim.trg

`HS2/structure-map-compactifiable` · Theorem

**Theorem.** Let E = Q\_p, (𝒢, b, μ•) a local shtuka datum with legs i = 1, …, m, B = Spd F̆\_1 ×\_{Spd k} ⋯ ×\_{Spd k} Spd F̆\_m and K ⊂ G(Q\_p) a compact open subgroup. The structure map f\_K : Sht\_{G,b,μ•,K} → B factors as f\_K = g ∘ π\_K, where π\_K : Sht\_{G,b,μ•,K} → Gr^tw\_{G,B,≤μ•} is the period map and g : Gr^tw\_{G,B,≤μ•} → B the projection. (a) π\_K is étale and separated. (b) g is proper and representable in spatial diamonds, and over every quasicompact open U ⊂ B it has finite dim.trg. (c) Hence f\_K is separated, representable in locally spatial diamonds, compactifiable, and of locally finite dim.trg. These are the standing hypotheses of Fargues–Scholze VII.5 under which they compare f\_{K♮}S′\_W with Rf\_{K!}S\_W for the tower (IX.3, p. 326), and the hypotheses under which Rf\_{K!} and Rf\_K^! are defined for torsion coefficients of order prime to p; they are the boundedness conditions needed to take compactly supported cohomology of Sht\_{G,b,μ•,K} relative to B. (d) f\_K is in general neither quasicompact nor proper. (e) General local field. For a nonarchimedean local field E of either characteristic, a compact open K ⊂ G(E) and the tower f\_K : Sht\_{(G,b,μ•),K} → ∏\_{i∈I} Spd F̆\_i of HS2/general-local-field, with its period map π\_K to Gr^tw\_{G,∏Spd F̆\_i,≤μ•}, the statements (a)–(d) hold. (f) Two bundles. For a nonarchimedean local field E of either characteristic, b, b′ ∈ B(G), a finite set I with bounds μ• and a compact open subgroup K ⊂ G\_b′(E), the structure map Mod^I\_{b,b′,≤μ•}/K → D\_I of the level quotient of the space of HS2/framed-bundle-fibres (HS2/levels-and-tower-limit (f)) is representable in locally spatial diamonds, compactifiable and of locally finite dim.trg; by inversion of modifications the same holds for the quotient by a compact open subgroup of G\_b(E). It is in general not quasicompact. The sources state that π\_K is étale and that g is proper and representable in spatial diamonds; separatedness of π\_K, finiteness of dim.trg, compactifiability of f\_K and part (f) are not stated in them and are proved below.

**Hypotheses and conventions.**

- E = Q\_p in (a)–(d); in (e) and (f), E is a nonarchimedean local field of either characteristic and G is reductive over E, with the notation of HS2/general-local-field and HS2/framed-bundle-fibres. In (a)–(d): G is a reductive group over Q\_p; k is an algebraic closure of F\_p, Q̆\_p = W(k)[1/p] with Frobenius σ, and S ranges over Perf\_k; wherever Y\_[0,r\](S), Y\_(0,r\](S) or Y\_[r,∞)(S) is written, S = Spa(R,R⁺) is affinoid with a fixed pseudo-uniformizer ϖ.
- Compactifiable, representable in locally spatial diamonds and dim.trg are those of Scholze's Étale cohomology of diamonds, as used in Fargues–Scholze VII.5: a map is compactifiable if it is the composite of an open immersion and a partially proper map.

**Proof outline.**

1. (a) π\_K is étale by Corollary 23.5.3 (HS2/multi-leg-period-and-representability). Pro-étale locally on an S-point of Gr^tw\_{G,B,≤μ•} its fibre is S^a × G(Q\_p)/K → S (HS2/levels-and-tower-limit (a), (f)): an open immersion followed by the projection from a product with a discrete set. Such a map is separated, and separatedness can be checked after a v-cover of the target.
2. (b) Properness and representability in spatial diamonds are Proposition 23.5.2 (HS0/twisted-period-grassmannian). Its proof embeds Gr^tw\_{G,U,≤μ•} as a closed subfunctor of a Schubert variety in the Beilinson–Drinfeld Grassmannian over U × φ⁻¹(U) × ⋯ × φ^{−n\_0+1}(U); bounded Beilinson–Drinfeld Schubert varieties have finite dim.trg over their base (HS0/descent-and-bounded-fibres), and a closed subfunctor has no larger dim.trg.
3. (c) An étale map has dim.trg 0, so f\_K has finite dim.trg over each quasicompact open of B. A composite of separated maps is separated. π\_K is quasi-pro-étale and g is representable in spatial diamonds, so f\_K is representable in locally spatial diamonds. Separated étale maps are compactifiable, a proper map is partially proper and hence compactifiable, and compactifiable maps are stable under composition (Scholze, Étale cohomology of diamonds, Definition 22.2 and Proposition 22.3); hence f\_K is compactifiable.
4. (d) For m = 0 and b = 1, f\_K is underline{G(Q\_p)/K} × Spd k → Spd k, which is not quasicompact when G(Q\_p)/K is infinite.
5. (e) For general E the two inputs are in HS2/general-local-field: by its part (3) and step 4, π\_K is étale and separated, pro-étale locally the map S^a × G(E)/K → S; by its part (1) and step 2, g is proper, representable in spatial diamonds and, over a quasicompact open of the base, a closed subfunctor of a bounded Beilinson–Drinfeld Schubert variety, which has finite dim.trg (HS0/descent-and-bounded-fibres). Steps 3 and 4 apply unchanged.
6. (f) Let F\_b = Spd k ×\_{x\_b, Bun\_G, p\_1} Hck^I\_{G,≤μ•}; the map F\_b → D\_I is proper, representable in spatial diamonds and of finite dim.trg (HS2/framed-bundle-fibres, step 3; HS0/descent-and-bounded-fibres (c)). The stratum Bun\_G^{b′} is locally closed in Bun\_G, because |Bun\_G| → B(G) is continuous for the order topology (BunGAndNewtonStrata:BG2:uniformization/semicontinuity-and-local-constancy), in which every point is locally closed; so F\_b^{b′} = F\_b ×\_{Bun\_G} Bun\_G^{b′} → F\_b is a locally closed immersion. The map x\_b′: Spd k → Bun\_G^{b′} is a surjection and a torsor under G̃\_b′ = G̃\_b′^{>0} ⋊ underline{G\_b′(E)} (BunGAndNewtonStrata:BG3/stratum-is-classifying-stack, BunGAndNewtonStrata:BG3/full-automorphism-v-group), and Mod^I\_{b,b′,≤μ•} = F\_b ×\_{Bun\_G, x\_b′} Spd k; so Mod := Mod^I\_{b,b′,≤μ•} → F\_b^{b′} is a G̃\_b′-torsor. Put T = Mod/G̃\_b′^{>0}, a torsor under underline{G\_b′(E)} over F\_b^{b′}; it is pro-étale locally trivial, because a G̃\_b′-torsor over an affinoid perfectoid space is the product of a pro-étale G\_b′(E)-torsor with G̃\_b′^{>0} (Fargues–Scholze, Remark III.5.4). Since G̃\_b′^{>0} is normal in G̃\_b′, the map Mod/K → F\_b^{b′} factors as Mod/K → T/K → F\_b^{b′}. The second map is separated and étale (DiamondsAndVStacks:D3/locally-profinite-torsors). The first is, pro-étale locally on T/K, the projection from the product with G̃\_b′^{>0}. The v-sheaf G̃\_b′^{>0} is a successive extension of the Banach–Colmez spaces of the isoclinic parts of positive slope of the adjoint bundle of E\_b′ (Fargues–Scholze III.5.1), which are finite products of spaces BC(O(λ)) with λ > 0; each BC(O(λ)) → Spd k is representable in locally spatial diamonds, partially proper and cohomologically smooth, in particular of locally finite dim.trg (Fargues–Scholze II.2.5(iii); VectorBundlesAndIsocrystals:VB1/cohomology-of-twists). Hence G̃\_b′^{>0} → Spd k and Mod/K → T/K are separated, partially proper, representable in locally spatial diamonds and of locally finite dim.trg: separatedness (DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes) and the valuative criterion can be checked after a surjection onto the target, and so can representability in locally spatial diamonds of a quasiseparated map when the surjection is one of pro-étale stacks (Scholze, Étale cohomology of diamonds, Proposition 13.4(iv)). A partially proper map, a separated étale map, a locally closed immersion and a proper map are compactifiable, and compactifiable maps, maps representable in locally spatial diamonds and maps of locally finite dim.trg are stable under composition (step 3); this gives (f) for K ⊂ G\_b′(E). The statement for a compact open subgroup of G\_b(E) follows from HS2/framed-bundle-fibres (e), which exchanges the two actions. For I = ∅ and b = b′ = 1 the map is underline{G(E)/K} → Spd k, which is not quasicompact when G(E)/K is infinite.

**Acceptance.**

- m = 0, b = 1: f\_K : underline{G(Q\_p)/K} × Spd k → Spd k is separated étale, of dim.trg 0, and not quasicompact for G = G\_m.
- G = GL\_2, μ = (1,0), b basic with κ(b) = −1, K = GL\_2(Z\_p): f\_K is the structure map of the diamond of a countable disjoint union of open unit discs over Q̆\_p; it has dim.trg 1 and is not proper.
- One minuscule leg with non-empty admissible locus: dim.trg f\_K = dim Fl\_μ = ⟨2ρ, μ⟩, since π\_K is étale with non-empty open image in the diamond of the flag variety.
- E = F\_q((t)), G = G\_m, m = 0, b = 1: f\_K : underline{E^×/K} × Spd k → Spd k is separated étale, of dim.trg 0 and not quasicompact.
- G = GL\_2, I = ∅, b = b′ with E\_b = O ⊕ O(1), K ⊂ G\_b(E) = E^× × E^× compact open: Mod^∅\_{b,b}/K = G̃\_b/K = BC(O(1)) × underline{(E^× × E^×)/K} → Spd k is a disjoint union of copies of the Banach–Colmez space BC(O(1)); it is partially proper, representable in locally spatial diamonds, of dim.trg 1, and not quasicompact.

**Prerequisites.**

- In this roadmap: `HS2/multi-leg-period-and-representability`, `HS2/levels-and-tower-limit`, `HS0/twisted-period-grassmannian`, `HS0/descent-and-bounded-fibres`, `HS2/general-local-field`, `HS2/framed-bundle-fibres`.
- In other roadmaps: `DiamondSixOperations:S0/compactifiable-morphism`, `DiamondSixOperations:S0/separated-etale-compactifiable`, `DiamondSixOperations:S0/compactifiable-composition`, `DiamondSixOperations:S0/eligible-morphism`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`, `BunGAndNewtonStrata:BG3/full-automorphism-v-group`, `BunGAndNewtonStrata:BG3/stratum-is-classifying-stack`, `BunGAndNewtonStrata:BG2:uniformization/semicontinuity-and-local-constancy`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `BunGAndNewtonStrata:BG3/positive-automorphism-kernel`, `BunGAndNewtonStrata:BG3/automorphism-torsor-reduction`.

**Sources.**

- Scholze–Weinstein, Corollary 23.5.3, p. 224: Étaleness of the period map and local spatiality.
- Scholze–Weinstein, Proposition 23.5.2, p. 223: The projection of the bounded twisted Grassmannian.
- Fargues–Scholze, VII.5, p. 264: The standing hypotheses under which relative homology and Rf\_! are compared.
- Fargues–Scholze, IX.3, p. 326: The use of these hypotheses for the tower of local shtukas.

### Weil descent datum of the one-leg tower

`HS2/weil-descent-datum` · Construction

**Construction.** Keep the notation of HS2/general-local-field with one leg: μ has field of definition F ⊇ E with residue field κ\_F of cardinality q\_F, and F̆ = F·Ĕ. Write Spd F̆ = Spd k ×\_{Spd κ\_F} Spd F and let φ\_F be the Frobenius of the factor Spd F, that is x ↦ x∘Frob\_S^f on S-points, where Frob\_S is the q-Frobenius of S and f is the residue degree of F over E, so that Frob\_S^f is the q\_F-Frobenius of S. It is an automorphism of Spd F̆ over Spd k; it keeps the untilt S♯ and replaces the identification ι of its tilt with S by Frob\_S^{−f}∘ι; it replaces the Cartier divisor of S♯ in Y\_S by its preimage under the f-th power of the Frobenius of Y\_S; and it is the composite of the absolute q\_F-Frobenius of Spd F̆ with the automorphism induced by σ\_F⁻¹, σ\_F being the lift to F̆ of the q\_F-Frobenius of k that is the identity on F. The map Spd F̆ → Spd F̆/φ\_F^Z is a Z-torsor. (1) Let M\_{(G,b,μ),∞} → Spd F̆/φ\_F^Z be the v-sheaf whose S-points are a point of (Spd F̆/φ\_F^Z)(S), with its Cartier divisor D ⊂ X\_S, and an isomorphism α: E\_1|\_{X\_S∖D} ≅ E\_b|\_{X\_S∖D} that is meromorphic along D and bounded by μ at every geometric point (the framed modifications of HS2/framed-bundle-fibres); put M\_{(G,b,μ),K} = M\_{(G,b,μ),∞}/K. There are isomorphisms Sht\_{(G,b,μ),K} ≅ M\_{(G,b,μ),K} ×\_{Spd F̆/φ\_F^Z} Spd F̆ over Spd F̆, for K compact open and for K = ∞, compatible with the transition maps and with the actions of G(E) and J\_b(E): the S-points of the one-leg tower depend on the untilt S♯ only through its image in Spd F̆/φ\_F^Z, that is through the degree-one Cartier divisor that it defines on X\_S ×\_E F (the divisor D ⊂ X\_S itself when F = E). (2) The Weil descent datum of the tower is the resulting descent datum along Spd F̆ → Spd F̆/φ\_F^Z: the automorphism ψ\_K = id × φ\_F of Sht\_{(G,b,μ),K} = M\_{(G,b,μ),K} ×\_{Spd F̆/φ\_F^Z} Spd F̆, which covers φ\_F and commutes with the transition maps and with G(E) × J\_b(E); its powers ψ\_K^n = id × φ\_F^n form an action of Z covering φ\_F^Z. Equivalently it is the isomorphism w\_K: φ\_F^\*Sht\_{(G,b,μ),K} ≅ Sht\_{(G,b,μ),K} over Spd F̆ whose inverse is y ↦ (ψ\_K(y), f\_K(y)), where φ\_F^\*Sht\_{(G,b,μ),K} = Sht\_{(G,b,μ),K} ×\_{Spd F̆,φ\_F} Spd F̆ and f\_K is the structure map; composed with the inverse of the projection φ\_F^\*Sht\_{(G,b,μ),K} → Sht\_{(G,b,μ),K}, which covers φ\_F, the isomorphism w\_K is ψ\_K⁻¹ and covers φ\_F⁻¹. The period map π\_K intertwines ψ\_K with the automorphism ψ\_Gr of Gr\_{G,Spd F̆,≤μ} covering φ\_F that is induced by the Frobenius structure b × Frob\_S of the pullback of E\_b to Y\_S, and w\_K with the corresponding isomorphism w\_Gr: φ\_F^\*Gr\_{G,Spd F̆,≤μ} ≅ Gr\_{G,Spd F̆,≤μ}. Let b\_f = b·σ(b)⋯σ^{f−1}(b) ∈ G(Ĕ), so that (b × Frob\_S)^f = b\_f × Frob\_S^f. Then ψ\_Gr is the canonical automorphism ψ\_can of Gr\_{G,Spd F̆,≤μ} = Gr\_{G,Spd F,≤μ} ×\_{Spd κ\_F} Spd k, the Frobenius of the first factor, which sends a pair (x, Λ) of a point x of Spd F̆ and a lattice Λ over B\_dR⁺ of its untilt to (φ\_F(x), Λ), followed by left multiplication by the image of b\_f in G(B\_dR⁺) through the F̆-algebra structure of φ\_F(x); so ψ\_Gr⁻¹ is left multiplication by b\_f⁻¹ followed by ψ\_can⁻¹. For F = E, and whenever f = 1, b\_f = b; and ψ\_Gr = ψ\_can when b = 1. The datum w\_K need not be effective: the tower need not come by base change from a v-sheaf over Spd F. (3) For a complete algebraic closure C of F, Spd C → Spd F̆/φ\_F^Z is a torsor under the Weil group W\_F, where τ ∈ W\_F acts on Spd C as τ∘Frob^{−deg τ}, Frob being the q\_F-Frobenius of Spd C; hence W\_F acts on Sht\_{(G,b,μ),K} ×\_{Spd F̆} Spd C = M\_{(G,b,μ),K} ×\_{Spd F̆/φ\_F^Z} Spd C, covering its action on Spd C and commuting with G(E) × J\_b(E). (4) For several legs, the space M = Mod^I\_{1,b,≤μ•}/K of modifications α: E\_1 ⇢ E\_b bounded by μ•, up to K (HS2/framed-bundle-fibres; Fargues–Scholze print the modifications as going from E\_b to the trivial bundle), lives over ∏\_i Spd F̆\_i/φ\_i^Z, and the natural map from Sht\_{(G,b,μ•),K} to M ×\_{∏ Spd F̆\_i/φ\_i^Z} ∏\_i Spd F̆\_i is an isomorphism away from the Frobenius-twisted partial diagonals, the loci S\_i♯ = φ^n(S\_j♯) with i ≠ j and n ≠ 0 (Fargues–Scholze print the map in the other direction, while their construction starts from a shtuka); no descent of Sht\_{(G,b,μ•),K} itself along ∏\_i Spd F̆\_i → ∏\_i Spd F̆\_i/φ\_i^Z is asserted. Fargues–Scholze IX.3 mentions the Weil descent datum for E = Q\_p and minuscule μ, by reference to Lecture 24 of Scholze–Weinstein, where it is not constructed; (1)–(3) are proved in the proof steps.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- One leg in (1)–(3); μ is an arbitrary conjugacy class of cocharacters, b ∈ G(Ĕ), K ⊂ G(E) compact open or K = ∞.

**Construction.**

1. For one leg, Gr^tw\_{G,Spd F̆,≤μ} = Gr\_{G,Spd F̆,≤μ}, and a point (S♯, P\_η, φ\_P, ι\_r) is equivalent to (S♯, E, α), where E is the descent of P\_η near π = 0 and α: E ≅ E\_b away from the image D of S♯ in X\_S is induced by ι\_r: the pullbacks of E and E\_b to Y\_S are both identified φ-equivariantly with P\_η away from ∪\_{n∈Z} φⁿ(S♯) (Scholze–Weinstein, proof of 23.3.1; the argument is the same for general E). The pair (E, α), its bound, admissibility and the torsor Isom(E\_1, E) only involve D.
2. The map sending S♯ to its image in Spd F̆/φ\_F^Z is a Z-torsor; the image determines D and the F-algebra structure of the completion of X\_S along D, and the bound μ, being defined over F, is invariant under φ\_F. This gives the isomorphism in (1), and (2) is the canonical descent datum of a pullback: for Y = M ×\_{B/φ\_F^Z} B with B = Spd F̆, a point of φ\_F^\*Y is a pair (y, x) with y = (m, φ\_F(x)), the isomorphism w\_K sends it to (m, x), and ψ\_K = id × φ\_F sends (m, x) to (m, φ\_F(x)). Equivariance under G(E) = Aut(E\_1) and J\_b(E) ⊂ Aut(E\_b) is read off from the description by α. For the period map: π\_K uses the trivialisation of E\_b on the completion of X\_S at D that comes from the canonical trivialisation of its pullback to Y\_S at the point S♯; the vector bundle E\_b(V) has as sections the functions h on Y\_S with values in V such that b·φ^\*h = h, φ the Frobenius of Y\_S, so that (φ^\*)^n h = (b·σ(b)⋯σ^{n−1}(b))⁻¹h. Hence the trivialisation t\_x read at the divisor D\_x of a point x of Spd F̆ and the trivialisation t\_{x′} read at D\_{x′} = (φ^n)⁻¹(D\_x) satisfy t\_{x′} = b\_n·(φ^n)^\*∘t\_x, with b\_n = b·σ(b)⋯σ^{n−1}(b) taken through the structure of x′ and (φ^n)^\* the identification of the completions along D\_x and D\_{x′}. For x′ = φ\_F(x) one has n = f, and (φ^f)^\* is the identification underlying ψ\_can; this gives ψ\_Gr = b\_f·ψ\_can.
3. Spd C → Spd F̆/φ\_F^Z is a W\_F-torsor (Fargues–Scholze IV.7, applied to the local field F); pulling M\_{(G,b,μ),K} back along it gives (3).
4. (4) is the statement in the proof of Fargues–Scholze IX.3.2: Sht\_{(G,b,μ•),K} parametrises Frobenius torsors on Y\_S; these give two bundles on X\_S identified away from the images of the legs, and the procedure can be reversed where no leg is a non-trivial Frobenius translate of another: there the divisor of the legs in Y\_S maps isomorphically onto its image in X\_S and the bounds on the two sides agree, also at coincident legs (HS2/multi-leg-period-and-representability (e) for E = Q\_p; the argument is the same for general E).

**API.**

- `WeilDescent.modificationSpace` (data): M\_{(G,b,μ),K} → Spd F̆/φ\_F^Z: the sheaf of triples (D, α, 𝒫) with D a point of Spd F̆/φ\_F^Z, viewed as a degree-one Cartier divisor of X\_S, α: E ≅ E\_b a modification at D bounded by μ with E trivial at geometric points, and 𝒫 a K-lattice in Isom(E\_1, E).
- `WeilDescent.pullback` (equivalence): Sht\_{(G,b,μ),K} ≅ M\_{(G,b,μ),K} ×\_{Spd F̆/φ\_F^Z} Spd F̆ over Spd F̆, compatibly with transition maps, with G(E) and with J\_b(E).
- `WeilDescent.datum` (constructor): The automorphism ψ\_K = id × φ\_F of Sht\_{(G,b,μ),K}, covering φ\_F, with ψ\_K^n = id × φ\_F^n for n ∈ Z; equivalently the isomorphisms w\_K^{(n)}: (φ\_F^n)^\*Sht\_{(G,b,μ),K} ≅ Sht\_{(G,b,μ),K} over Spd F̆ with inverse y ↦ (ψ\_K^n(y), f\_K(y)), which satisfy w\_K^{(m+n)} = w\_K^{(m)} ∘ (φ\_F^m)^\*w\_K^{(n)}; w\_K = w\_K^{(1)}.
- `WeilDescent.datum_natural` (functoriality): w\_K commutes with the transition maps Sht\_{(G,b,μ),K′} → Sht\_{(G,b,μ),K}, with the isomorphisms induced by g ∈ G(E), and with the action of J\_b(E).
- `WeilDescent.datum_period` (compatibility): π\_K ∘ ψ\_K = ψ\_Gr ∘ π\_K and π\_K ∘ w\_K = w\_Gr ∘ φ\_F^\*π\_K, where ψ\_Gr is the automorphism of Gr\_{G,Spd F̆,≤μ} covering φ\_F induced by the Frobenius structure of E\_b and w\_Gr the corresponding isomorphism φ\_F^\*Gr\_{G,Spd F̆,≤μ} ≅ Gr\_{G,Spd F̆,≤μ}: ψ\_Gr is the canonical automorphism (x, Λ) ↦ (φ\_F(x), Λ) followed by left multiplication by b\_f = b·σ(b)⋯σ^{f−1}(b), f the residue degree of F over E, through the F̆-algebra structure of φ\_F(x). For F = E this is left multiplication by b after the canonical automorphism; for b = 1 it is the canonical one.
- `WeilDescent.weilAction` (structure): An action of W\_F on Sht\_{(G,b,μ),K} ×\_{Spd F̆} Spd C covering the action τ ↦ τ∘Frob^{−deg τ} on Spd C; the inertia subgroup acts through its action on C; the action commutes with G(E) × J\_b(E) and with transition maps.
- `WeilDescent.rigid` (compatibility): For E = Q\_p and μ minuscule, let τ = σ\_F⁻¹ be the automorphism of F̆ over F inverse to the lift of the q\_F-Frobenius of k, so that φ\_F is the composite of τ^♦ with the absolute q\_F-Frobenius of Spd F̆ and pullbacks along φ\_F and along τ^♦ are canonically identified. Then w\_K is the diamond of a unique isomorphism τ^\*M\_{G,b,μ,K} ≅ M\_{G,b,μ,K} of rigid spaces over F̆, lying over the isomorphism τ^\*Fl\_{G,μ,F̆} ≅ Fl\_{G,μ,F̆} that corresponds to w\_Gr under the Białynicki-Birula isomorphism.
- `WeilDescent.lubinTate` (example): For G = G\_m, μ = id, b = π⁻¹: M\_{(G\_m,b,μ),∞} = BC(O(1)) ∖ {0} ≅ Spd Ĕ\_∞, on which O\_E^× acts through the Lubin–Tate action and π as the Frobenius (Fargues–Scholze II.2.4).

**Unit tests.**

- `WeilDescent.lubin_tate_test` (computation): For G = G\_m, μ = id and b = π⁻¹ (so F = E): M\_{(G\_m,b,μ),∞} ≅ Spd Ĕ\_∞ has a single point, Sht\_{(G\_m,b,μ),∞} ≅ Z × Spd Ĕ\_∞, the component of index m consisting of the pairs (s, x) of a point s of Spd Ĕ\_∞ and a point x of Spd Ĕ with x = φ^m(p(s)), where p: Spd Ĕ\_∞ → Spd Ĕ is the projection; ψ\_K^n = id × φ^n maps the component of index m onto the component of index m + n; so the descent datum acts simply transitively on π₀(Sht\_{(G\_m,b,μ),O\_E^×}) = Z.
- `WeilDescent.not_effective_test` (non-example): In the same example there is no v-sheaf Y over Spd E with Y ×\_{Spd E} Spd Ĕ ≅ Sht\_{(G\_m,b,μ),O\_E^×} compatibly with w: a continuous action of the profinite group Gal(k/F\_q) on the discrete set Z has finite orbits. The quotient Sht\_{(G\_m,b,μ),O\_E^×}/π^Z by π ∈ J\_b(E) is Spd Ĕ with w = φ, which descends to Spd E.
- `WeilDescent.trivial_datum_test` (degenerate): For μ = 0 and b = 1 (so F = E): M\_{(G,1,0),K} = G(E)/K × Spd Ĕ/φ^Z, Sht\_{(G,1,0),K} = G(E)/K × Spd Ĕ, the descent datum is id × φ and is effective with descent G(E)/K × Spd E, and W\_E acts on Sht\_{(G,1,0),K} × Spd C through Spd C only.
- `WeilDescent.reciprocity_test` (compatibility): For G = G\_m, μ = id and b = π⁻¹, W\_E acts on the E^×-torsor π₀(Sht\_{(G\_m,b,μ),∞} ×\_{Spd Ĕ} Spd C) through a continuous homomorphism W\_E → E^× which is the reciprocity isomorphism W\_E^{ab} ≅ E^× of local class field theory, up to the normalisation τ ↦ τ^{±1}: inertia acts through the Lubin–Tate character onto O\_E^× and an element of degree 1 by an element of valuation ±1.

**Uses.**

- Fargues–Scholze, Theorem IX.3.1: The action of W\_F on RΓ\_c(M\_{(G,b,μ),K,C}, Z\_ℓ) is the one induced by the Weil descent datum of the tower.
- Fargues–Scholze, Proposition IX.3.2 and its proof: The partial Frobenii of f\_{K♮}S′\_W come from the space of modifications M of (4) over ∏\_i Spd F̆\_i/φ\_i^Z; for one leg this is the descent of the relative homology along the datum ψ\_K of (2).
- HeckeStacksAndLocalShtukas:HS3/huber-cohomology-comparison: The comparison of compactly supported cohomology is required to respect the descent to the reflex field.

**Acceptance.**

- For μ = 0 and b = 1 the descent datum is id × φ on G(E)/K × Spd Ĕ, and w\_Gr is the canonical descent datum of Spd Ĕ.
- For G = G\_m, μ = id, b = π⁻¹ the descent datum permutes π₀(Sht\_{(G\_m,b,μ),O\_E^×}) = Z simply transitively.
- For E = Q\_p and minuscule μ the datum is induced by a unique isomorphism of the rigid spaces of HS2/minuscule-rigidification.

**Prerequisites.**

- In this roadmap: `HS2/general-local-field`, `HS2/framed-bundle-fibres`, `HS2/levels-and-tower-limit`, `HS2/minuscule-rigidification`.
- In other roadmaps: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`, `VStackSheavesAndLisseCategories:VS1/divisor-weil-map`.

**Sources.**

- Fargues–Scholze, IX.3, before Theorem IX.3.1, p. 324: The descent datum of the tower of local Shimura varieties is asserted, by reference to Lecture 24 of Scholze–Weinstein, which does not construct it.
- Fargues–Scholze, IX.3, proof of Proposition IX.3.2, pp. 326–327: Statement (4): the space of modifications over the quotient by partial Frobenii, compared with the shtuka space; the reversal of the construction is on p. 327.
- Fargues–Scholze, IV.7, before Proposition IV.7.1, p. 164: Spd C is a W\_E-torsor over Spd Ĕ/φ^Z, with the stated action of Frobenius elements; used in (3).
- Scholze–Weinstein, Proposition 23.3.1 and its proof, p. 218: The one-leg data (E, α) live on X\_S and only see the image of the untilt; this gives (1) for E = Q\_p.
- Fargues–Scholze, Corollary II.2.4, p. 61: The example used in the tests: the space of modifications for G\_m, μ = id, b = π⁻¹ is BC(O(1)) ∖ {0} over Div¹.

## HS3. Cohomology as a representation-valued functor

This layer defines the cohomology of local shtuka spaces as C\_K = f\_{K♮}S′\_W, the relative homology of the level-K space with coefficients the kernel of W = ⊠V\_{μ\_i}, and identifies it. The central comparison (Fargues–Scholze IX.3.2) is that C\_K is the pullback of the restriction to the stratum of b of T\_W applied to the compact induction from K on the trivial stratum; it gives C\_K its smooth action of J\_b(E), its partial Frobenii and its continuous action of the Weil groups of the reflex fields. For one minuscule leg over Q\_p a second comparison identifies C\_K with Huber's compactly supported cohomology of the local Shimura variety, shifted by [d] and twisted by (d/2), d = ⟨2ρ,μ⟩ (IX.3.1).

From the comparison and the properties of T\_W in HS1 the layer deduces: C\_K is a compact object of D(J\_b(E),Λ) when K is pro-p, and need not be when K is not; for pro-p K, RHom from C\_K into an admissible ρ is a perfect complex, and its colimit over the levels is the restriction to the trivial stratum of T\_{W^∨} applied to the pushforward of ρ; the duality formula; finite length for Q̄\_ℓ-coefficients; and the identities for the trace and pullback maps between levels, in which division by the index is allowed only when the index is invertible in Λ. The same construction with an arbitrary source stratum gives Hecke operators between two Newton strata. The last comparison identifies the towers with Rapoport–Zink towers for GL\_n and for EL and PEL data (Scholze–Weinstein 24.2.5, 24.3.5); it rests on inputs that no layer of the atlas supplies, which are recorded as a gap.

The layer is checked on tori (C\_K is the compact induction from K, in degree 0), on the Lubin–Tate tower of GL\_2 at level GL\_2(Z\_p) (a sum of copies of Λ(−1/2)[−1] indexed by Z, which is compactly induced from the units of the maximal order of the quaternion algebra), on the order of the ℓ-adic limit and the colimit over quasicompact opens, and on the level O\_E^× of G\_m with ℓ dividing q − 1, where compactness fails.

**Planets.** Local shtuka cohomology (`HS3/compact-support-at-levels`); Partial Frobenii (`HS3/satake-coefficients-and-partial-frobenius`); Cohomology of local Shimura varieties (`HS3/compactness-of-shtuka-cohomology`); Admissibility and Hecke adjunction (`HS3/admissibility-duality-and-adjunction`); Hecke operators between Newton strata (`HS3/hecke-operators-between-strata`).

**Dependencies.** Earlier layers of this roadmap: HS2, HS1, HS0. Layers of other roadmaps cited by the nodes: `AInfCohomology:AI.2`, `AdicCoefficientsAndComparisons:L0`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG2:smooth-Artin`, `BunGAndNewtonStrata:BG3`, `BunGAndNewtonStrata:BG4`, `ClassicalAdicEtaleCohomology:H3`, `DiamondSixOperations:S1`, `DiamondSixOperations:S3`, `DiamondSixOperations:S4`, `DiamondSixOperations:S5`, `DiamondsAndVStacks:D6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`, `EnhancedDerivedSheaves:E5:abstract`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness`, `GeometricSatakeAndFusion:GS3:fusion`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `IgusaVarietiesAndTorsionConcentration:IG.0`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.6`, `VStackSheavesAndLisseCategories:VS2`, `VStackSheavesAndLisseCategories:VS3`, `VStackSheavesAndLisseCategories:VS4`, `VStackSheavesAndLisseCategories:VS5`.

**Coverage.** Status `planned`. Target-level plan with 10 nodes; every target of the stage text is a node. The stage is not closed: it has open requests and recorded gaps. Remaining:

- Gap: Classical O\_E-linear and EL/PEL comparison inputs.
- Gap: Comparison of classical and diamond compact support, and duality in dimension d.
- Gap: Compactness of the level colimit for compact ρ.
- Gap: Geometric description of Hecke operators from a non-basic stratum.
- Statements requested from supplier stages that have no node for them yet: EndoscopicTransferAndUnitaryTraceComparison:ET.6a, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2, GeometricSatakeAndFusion:GS3:fusion, GeometricSatakeAndFusion:GS4:integral-dual-group, SmoothRepresentationsOfLocalGroups:SR.0:derived-extension, SmoothRepresentationsOfLocalGroups:SR.1, SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3, SmoothRepresentationsOfLocalGroups:SR.6, VStackSheavesAndLisseCategories:VS4.
- Lemma-level refinement of the target-level nodes of this stage.

### Completed compact support and tower complexes

`HS3/compact-support-at-levels` · Construction · planet: **Local shtuka cohomology**

**Construction.** Let W=⊠\_{i∈I}V\_{μ\_i} with the V\_{μ\_i} highest-weight representations defined over Z\_ℓ[r], F\_i the field of definition of μ\_i, K⊂G(E) compact open, and f\_K:Sht\_{G,b,μ•,K}→∏\_{i∈I}Spd F̆\_i the level-K shtuka space with its J\_b(E)-action. Let S\_W be the Satake coefficient on Sht\_{G,b,μ•,K} (HS3/satake-coefficients-and-partial-frobenius), universally locally acyclic of bounded Tor-amplitude, and S′\_W=D(S\_W)^∨. Definition: C\_K=f\_{K♮}S′\_W∈D\_■([\*/J\_b(E)]×∏\_iSpd F̆\_i,Λ), where f\_{K♮} is the left adjoint of f\_K^\* (relative homology). (1) Torsion coefficients: if ℓ^nΛ=0 then C\_K≃Rf\_{K!}S\_W, and no limit is involved. (2) Change of coefficients: for a map Λ→Λ′ of Z\_ℓ[r]-algebras, C\_{K,Λ}⊗^{L■}\_ΛΛ′≃C\_{K,Λ′}. Rational coefficients are obtained by inverting ℓ in the integral object; inverting ℓ before the limit over m in (3) would give 0. (3) Huber's convention: for a partially proper rigid space M over C, RΓ\_c(M,Z\_ℓ)=colim\_U Rlim\_m RΓ\_c(U,Z/ℓ^m), U running over the quasicompact open subsets of M, and RΓ\_c(M,Λ)=RΓ\_c(M,Z\_ℓ)⊗^L\_{Z\_ℓ}Λ. The ℓ-adic limit is formed at each U, then Λ is tensored on, then the colimit over U is taken. (4) One minuscule leg over E=Q\_p: S′\_W=Λ[−d\](−d/2) with d=⟨2ρ,μ⟩=dim M\_K, so C\_K=f\_{K♮}Λ[−d\](−d/2). The comparison with Huber's complex (HS3/huber-cohomology-comparison, which rests on this node) identifies the geometric fibre of f\_{K♮}Λ with RΓ\_c(M\_{K,C},Λ)[2d\](d); with it the geometric fibre of C\_K is RΓ\_c(M\_{K,C},Λ)[d\](d/2). Half twists use r. (5) Levels: for K′≤K the finite étale π:Sht\_{K′}→Sht\_K satisfies π^\*S′\_W=S′\_W and π\_♮=π\_\*, which gives tr:C\_{K′}→C\_K (counit of π\_♮⊣π^\*) and pull:C\_K→C\_{K′} (unit of π^\*⊣π\_\*). The tower object is C\_∞=colim\_K C\_K along pull, over all compact open K or equivalently over the cofinal open pro-p ones. G(E) acts on C\_∞ through the isomorphisms Sht\_K≅Sht\_{gKg⁻¹} of the tower; the actions of G(E) and J\_b(E) commute; the action of G(E) on C\_∞ is smooth in the sense that C\_∞ is the filtered colimit of the C\_{K′}, on the image of which K′ acts trivially; and C\_K≃(C\_∞)^K for K pro-p, where (C\_∞)^K denotes the colimit, over the open normal subgroups K′ of K, of the direct summands of C\_{K′} cut out by the idempotents e\_{K/K′}=[K:K′]⁻¹Σ\_{γ∈K/K′}γ^\* of the action of the finite group K/K′ on C\_{K′}. That the action of J\_b(E) on each C\_K is smooth, that is, that C\_K comes from D(J\_b(E),Λ), is part (2) of HS3/hecke-cohomology-comparison, which rests on this node. C\_∞ is not the inverse limit of the C\_K along tr.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p unless E=Q\_p is stated below; G/E is reductive; k is an algebraic closure of F\_q and S belongs to Perf\_k.
- Fix ℓ≠p, a Z\_ℓ[r]-algebra Λ with r²=q, and a finite quotient Q of W\_E through which the pinned action on the dual group factors. No condition on ℓ beyond ℓ≠p is imposed.
- K⊂G(E) is compact open; W=⊠\_{i∈I}V\_{μ\_i} is defined over Z\_ℓ[r]; in (4) E=Q\_p, I is a singleton and μ is minuscule.

**Construction.**

1. f\_{K♮} is the left adjoint of f\_K^\* on solid sheaves; it commutes with colimits and base change and satisfies the projection formula (FS VII.3, supplied by VStackSheavesAndLisseCategories:VS2). S′\_W is the kernel of HS3/satake-coefficients-and-partial-frobenius. The projection formula and HS1/coefficient-base-change give (2).
2. Torsion comparison: FS VII.5.2 applied to A=S\_W (universally locally acyclic, bounded Tor-amplitude) and B=Λ gives (1); applied to B=j\_!Λ/ℓ^m for a quasicompact open j:U→Sht\_K it gives f\_{K♮}(S′\_W⊗j\_!Z/ℓ^m)≃Rf\_{K!}(j\_!j^\*S\_W/ℓ^m). The hypotheses of VII.5.2 on f\_K (compactifiable, representable in locally spatial diamonds, locally of finite dim.trg) are HS2/structure-map-compactifiable, part (c) for E=Q\_p and part (e) for general E.
3. Minuscule case: S′\_W=Λ[−d\](−d/2) by HS3/satake-coefficients-and-partial-frobenius. For constant coefficients f\_{K♮}Λ=colim\_U f\_{K♮}j\_!Λ; each f\_{K♮}j\_!Z\_ℓ is a perfect complex (f\_K∘j is quasicompact, separated and ℓ-cohomologically smooth), hence the derived limit of its reductions modulo ℓ^m (FS, proof of IX.3.1). This is the order of operations in (3).
4. Levels: π is finite étale of degree [K:K′] and a K/K′-torsor for K′ normal (HS2/levels-and-tower-limit), so π\_♮=π\_\* and unit and counit give pull and tr. For K′ normal in a pro-p K the idempotent [K:K′]⁻¹Σ\_γγ identifies C\_K with (C\_{K′})^{K/K′}; filtered colimits commute with invariants under a pro-p group since p is invertible in Λ. This gives C\_K≃(C\_∞)^K.

**API.**

- `compactSupportAtLevel` (constructor): C\_K=f\_{K♮}S′\_W∈D\_■([\*/J\_b(E)]×∏\_iSpd F̆\_i,Λ) for f\_K:Sht\_{G,b,μ•,K}→∏\_iSpd F̆\_i and S′\_W=D(S\_W)^∨.
- `compactSupportAtLevel.torsion` (compatibility): If ℓ^nΛ=0 then C\_K≃Rf\_{K!}S\_W; more generally f\_{K♮}(S′\_W⊗B)≃Rf\_{K!}(S\_W⊗B) for B∈D\_ét(Sht\_K,Λ) (FS VII.5.2).
- `compactSupportAtLevel.baseChange` (compatibility): For a map Λ→Λ′ of Z\_ℓ[r]-algebras, C\_{K,Λ}⊗^{L■}\_ΛΛ′≃C\_{K,Λ′}.
- `huberCompactSupport` (constructor): For a partially proper rigid space M over C: RΓ\_c(M,Z\_ℓ)=colim\_U Rlim\_m RΓ\_c(U,Z/ℓ^m) over quasicompact opens U, and RΓ\_c(M,Λ)=RΓ\_c(M,Z\_ℓ)⊗^L\_{Z\_ℓ}Λ.
- `huberCompactSupport.torsion` (simp): RΓ\_c(M,Z\_ℓ)⊗^L Z/ℓ^n≃colim\_U RΓ\_c(U,Z/ℓ^n), the compactly supported cohomology of M with Z/ℓ^n-coefficients.
- `compactSupportAtLevel.minuscule` (simp): For one minuscule leg over Q\_p, C\_K=f\_{K♮}Λ[−d\](−d/2), and its geometric fibre is RΓ\_c(M\_{K,C},Λ)[d\](d/2), d=⟨2ρ,μ⟩ (the second identification is the statement of HS3/huber-cohomology-comparison, which rests on this node).
- `compactSupportAtLevel.tr` (functoriality): For K′≤K, tr\_{K′,K}:C\_{K′}→C\_K, with tr\_{K,K}=id and tr\_{K′,K}∘tr\_{K″,K′}=tr\_{K″,K}.
- `compactSupportAtLevel.pull` (functoriality): For K′≤K, pull\_{K,K′}:C\_K→C\_{K′}, with pull\_{K,K}=id and pull\_{K′,K″}∘pull\_{K,K′}=pull\_{K,K″}.
- `compactSupportAtLevel.actions` (structure): J\_b(E) acts on Sht\_K over ∏\_iSpd F̆\_i, so C\_K lives over [\*/J\_b(E)]; tr and pull are J\_b(E)-equivariant; g∈G(E) induces C\_K≃C\_{gKg⁻¹} compatibly with tr and pull.
- `towerCompactSupport` (constructor): C\_∞=colim\_K C\_K along pull, over compact open K (equivalently over open pro-p K), with its commuting smooth actions of G(E) and J\_b(E).
- `towerCompactSupport.invariants` (characterisation): For K open pro-p the canonical map C\_K→C\_∞ identifies C\_K with (C\_∞)^K, the colimit over the open normal subgroups K′ of K of the summands e\_{K/K′}C\_{K′}, e\_{K/K′}=[K:K′]⁻¹Σ\_{γ∈K/K′}γ^\*.
- `compactSupportAtLevel.hecke` (relation): C\_K is the pullback to ∏\_iSpd F̆\_i of i^{b\*}T\_W(j\_!c-Ind\_K^{G(E)}Λ) (proved in HS3/hecke-cohomology-comparison, which rests on this node).
- `compactSupportAtLevel.torus` (example): For G=T a torus over Q\_p, one leg μ and b the class with κ(b)=−μ^♮, the geometric fibre of C\_K is c-Ind\_K^{T(Q\_p)}Λ in degree 0; for every other class b the tower is empty and C\_K=0.

**Unit tests.**

- `compactSupportAtLevel.torus_test` (computation): E=Q\_p, G=T a torus, one leg μ∈X\_\*(T), b with κ(b)=−μ^♮ (the class for which the tower is nonempty), K⊂T(Q\_p) compact open: the geometric fibre of Sht\_{T,b,μ,K} is the discrete set T(Q\_p)/K, d=0, S′\_W=Λ, and the geometric fibre of C\_K is Λ[T(Q\_p)/K]=c-Ind\_K^{T(Q\_p)}Λ in degree 0, the finitely supported functions on T(Q\_p)/K with J\_b(Q\_p)=T(Q\_p) acting by translation; it is not the module of all functions on T(Q\_p)/K.
- `compactSupportAtLevel.trivial_leg_test` (degenerate): E=Q\_p, one leg with μ=0: for b=1, Sht\_{G,1,0,K}=G(Q\_p)/K×Spd Q̆\_p and C\_K=Λ[G(Q\_p)/K]=c-Ind\_K^{G(Q\_p)}Λ in degree 0, constant along Spd Q̆\_p, with J\_1(Q\_p)=G(Q\_p) acting by left translation; for [b]≠1 the space is empty and C\_K=0.
- `compactSupportAtLevel.lubin_tate_test` (computation): G=GL\_2 over Q\_p, μ=(1,0), b basic with κ(b)=−1, K=GL\_2(Z\_p): M\_{K,C} is a disjoint union, indexed by Z, of open unit discs and d=1. Then RΓ\_c(M\_{K,C},Z\_ℓ)=⊕\_Z Z\_ℓ(−1)[−2], f\_{K♮}Z\_ℓ=⊕\_Z Z\_ℓ in degree 0, and the geometric fibre of C\_K is ⊕\_Z Λ(−1/2)[−1]; as a representation of J\_b(Q\_p)=D^× (D the quaternion division algebra) it is c-Ind\_{O\_D^×}^{D^×}Λ(−1/2)[−1].
- `compactSupportAtLevel.completion_order_test` (non-example): G=G\_m over Q\_p, μ(z)=z, b with κ(b)=−1, K=Z\_p^×, Λ=Z\_ℓ[r]: the geometric fibre of C\_K is ⊕\_Z Λ. It is not the ℓ-adic completion of ⊕\_Z Λ, which is what the limit over m taken after the colimit over U gives and which contains Σ\_{n≥0}ℓ^nδ\_n; and C\_K for the coefficient ring Λ[1/ℓ] is ⊕\_Z Λ[1/ℓ], not 0, which is what inverting ℓ before the limit over m gives.
- `compactSupportAtLevel.torsion_test` (compatibility): For Λ=Z/ℓ^n[r] and one minuscule leg over Q\_p: C\_K=Rf\_{K!}(Λ[d\](d/2)), whose geometric fibre is RΓ\_c(M\_{K,C},Λ)[d\](d/2); it is not RΓ\_c(M\_{K,C},Λ)[3d\](3d/2), which is what f\_{K♮} applied to S\_W instead of S′\_W gives.
- `towerCompactSupport.regular_test` (characterisation): E=Q\_p, b=1, one leg with μ=0: pull sends 1\_{gK} to Σ\_{k∈K/K′}1\_{gkK′} and tr sends 1\_{gK′} to 1\_{gK}; C\_∞ is the space C\_c^∞(G(Q\_p),Λ) of locally constant compactly supported functions with G(Q\_p)×G(Q\_p) acting by left and right translation, and (C\_∞)^K=Λ[G(Q\_p)/K]=C\_K. The inverse limit of the Λ[G(Q\_p)/K] along tr is not a smooth representation: for G(Q\_p) replaced by an infinite compact open subgroup it is the completed group algebra, in which the Dirac measure at 1 is fixed by no open subgroup.

**Uses.**

- HeckeStacksAndLocalShtukas:HS3/hecke-cohomology-comparison: C\_K is identified with the pullback of i^{b\*}T\_W(j\_!c-Ind\_K^{G(E)}Λ).
- HeckeStacksAndLocalShtukas:HS3/huber-cohomology-comparison: f\_{K♮}Z\_ℓ is identified with Huber's RΓ\_c(M\_{K,C},Z\_ℓ)[2d\](d), in the convention (3).
- HeckeStacksAndLocalShtukas:HS3/compactness-of-shtuka-cohomology: The complex whose compactness is asserted for one minuscule leg.
- HeckeStacksAndLocalShtukas:HS3/general-bound-compactness: The complex whose compactness is asserted for general bounds.
- HeckeStacksAndLocalShtukas:HS3/admissibility-duality-and-adjunction: RHom\_{J\_b(E)}(C\_K,ρ) and its colimit over K along the maps induced by tr.
- HeckeStacksAndLocalShtukas:HS3/level-trace-and-pullback: tr and pull between levels and their composites.
- Fargues–Scholze, Theorem IX.3.1 and Proposition IX.3.2 (pp. 324–326): f\_{K♮}Z\_ℓ computes Huber's compactly supported cohomology up to shift, and f\_{K♮}S′\_W is the object of the proposition.

**Acceptance.**

- If ℓ^nΛ=0 then C\_K=Rf\_{K!}S\_W and no ℓ-adic limit occurs.
- For G=1 and W trivial, Sht\_K=∏\_iSpd F̆\_i and C\_K=Λ in degree 0.
- For M a disjoint union of n copies of Spa C, RΓ\_c(M,Λ)=Λ^n in degree 0.
- For M=⊔\_{n∈N}Spa C, RΓ\_c(M,Z\_ℓ)=⊕\_N Z\_ℓ.

**Prerequisites.**

- In this roadmap: `HS2/levels-and-tower-limit`, `HS1/hecke-operator-via-relative-homology`, `HS3/satake-coefficients-and-partial-frobenius`, `HS1/coefficient-base-change`, `HS2/structure-map-compactifiable`, `HS2/minuscule-rigidification`, `HS2/general-local-field`.
- In other roadmaps: `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`, `AdicCoefficientsAndComparisons:L0/adic-coefficient-limit`, `AdicCoefficientsAndComparisons:L0/six-operations-for-adic-coefficients`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`, `DiamondSixOperations:S4/smooth-perfect-constructible`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `SmoothRepresentationsOfLocalGroups:SR.1`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality`, `VStackSheavesAndLisseCategories:VS2/proper-smooth-solid-poincare`.

**Sources.**

- Fargues–Scholze, IX.3, definition before Theorem IX.3.1, p. 324: Huber's convention: colimit over quasicompact opens U of the limit over m of RΓ\_c(U,Z/ℓ^m).
- Fargues–Scholze, IX.3, paragraph before Proposition IX.3.2, p. 326: f\_{K♮}S′\_W agrees with Rf\_{K!}S\_W for torsion coefficients and is defined in general.
- Fargues–Scholze, Proposition VII.5.2, p. 265: The hypotheses (universally locally acyclic, bounded Tor-amplitude) of the comparison f\_♮(D(A)^∨⊗B)≃Rf\_!(A⊗B).
- Fargues–Scholze, Proof of Theorem IX.3.1, p. 324: The ℓ-adic limit is taken on each quasicompact open, where the complex is perfect.

### Twisted Satake coefficients on shtuka spaces and partial Frobenii

`HS3/satake-coefficients-and-partial-frobenius` · Construction · planet: **Partial Frobenii**

**Construction.** Let W=⊠\_{i∈I}V\_{μ\_i}, F\_i the field of definition of μ\_i, and Gr^tw=Gr^tw\_{G,∏\_iSpd F̆\_i,≤μ•}→∏\_iSpd F̆\_i the twisted Schubert variety of HS0/twisted-period-grassmannian. Away from the Frobenius-twisted partial diagonals {S\_i♯=φ^n(S\_j♯): i≠j, n≠0}, Gr^tw is the Beilinson–Drinfeld Schubert variety and carries the Satake sheaf of W. (1) Extension: there is a universally locally acyclic sheaf S\_W on Gr^tw (relative to ∏\_iSpd F̆\_i), flat perverse relative to the base, restricting to the Satake sheaf on that locus; it is unique up to unique isomorphism among the flat perverse universally locally acyclic sheaves with this restriction (FS p. 326 asserts uniqueness among all universally locally acyclic sheaves, and adds that every such extension is automatically perverse; only uniqueness among flat perverse ones is proved and used here), and on a chart around a twisted diagonal, where Gr^tw is a Frobenius pullback of a convolution Schubert variety, it is the pullback of the twisted external product of the S\_{V\_{μ\_i}}. (2) Kernel on shtukas: for compact open K⊂G(E), S\_W also denotes its pullback along the étale period map π\_K:Sht\_{G,b,μ•,K}→Gr^tw, and S′\_W=D(S\_W)^∨, with D Verdier duality relative to ∏\_iSpd F̆\_i and ^∨ the solid dual RHom(−,Λ). S\_W and S′\_W are J\_b(E)-equivariant, and π^\*S′\_W=S′\_W for the level maps π:Sht\_{K′}→Sht\_K. For one minuscule leg, S\_W=Λ[d\](d/2) and S′\_W=Λ[−d\](−d/2) with d=⟨2ρ,μ⟩. (3) Partial Frobenii: for a small v-stack X and A∈D\_■(X×∏\_iSpd F̆\_i,Λ), a system of partial Frobenii is an action of the group ∏\_iφ\_i^Z on A covering its action on ∏\_iSpd F̆\_i, that is, isomorphisms F\_i:φ\_i^\*A≃A with F\_i∘φ\_i^\*(F\_j)=F\_j∘φ\_j^\*(F\_i) and the higher coherences of a group action. By descent such systems are the objects of D\_■(X×∏\_iSpd F̆\_i/φ\_i^Z,Λ). An object with partial Frobenii has a continuous ∏\_iW\_{F\_i}-action when its descent lies in the full subcategory D\_lis(X,Λ)^{B∏\_iW\_{F\_i}} of HS1/continuous-weil-descent. That C\_K=f\_{K♮}S′\_W carries such a structure is part of HS3/hecke-cohomology-comparison, which rests on this node.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p unless E=Q\_p is stated below; G/E is reductive; k is an algebraic closure of F\_q and S belongs to Perf\_k.
- Fix ℓ≠p, a Z\_ℓ[r]-algebra Λ with r²=q, and a finite quotient Q of W\_E through which the pinned action on the dual group factors. No condition on ℓ beyond ℓ≠p is imposed.
- The V\_{μ\_i} are highest-weight representations with fields of definition F\_i; φ\_i is the Frobenius automorphism of F̆\_i over F\_i acting on Spd F̆\_i, so that Spd F̆\_i/φ\_i^Z is the space Div^1 of F\_i. If F\_i≠E, the class μ\_i is not stable under W\_E and V\_{μ\_i} is the highest-weight representation of Ĝ⋊W\_{F\_i}; its sheaf on the Hecke stack over Div¹\_{F\_i} is the direct summand of the pullback along Div¹\_{F\_i}→Div¹\_E of the Satake sheaf of Ind\_{Ĝ⋊W\_{F\_i}}^{Ĝ⋊W\_E}V\_{μ\_i} that corresponds to the summand V\_{μ\_i} of the restriction of this induced representation to Ĝ⋊W\_{F\_i}. This uses that every endomorphism of the restricted representation acts on the pullback of the Satake sheaf, compatibly with composition: pullback along Div¹\_{F\_i}→Div¹\_E corresponds to restriction of representations from Ĝ⋊W\_E to Ĝ⋊W\_{F\_i}, the Satake functor over F\_i being formed with the square root r^{f\_i} of the cardinality of the residue field of F\_i, where f\_i is the residue degree of F\_i over E.

**Construction.**

1. Off the twisted diagonals take the Satake sheaf of W on the Beilinson–Drinfeld Schubert variety (HS1/satake-kernel-and-solid-monoidal-functor). On the chart of Gr^tw around a φ^m-twisted diagonal, Gr^tw is the pullback under a partial Frobenius of a convolution Schubert variety (HS0/twisted-period-grassmannian (3) for E=Q\_p; for general E the same charts for the functor of HS2/general-local-field (1), by the argument of step 3 of HS0/twisted-period-grassmannian with S ×̇ Spa Q\_p replaced by Y\_S; SW 23.4.1, 23.5.1); take the pullback of the twisted external product of the S\_{V\_{μ\_i}}, which is universally locally acyclic and agrees with the Beilinson–Drinfeld sheaf away from the diagonals (GS3 fusion).
2. Uniqueness and gluing: restriction to the complement of the partial diagonals is fully faithful on flat perverse universally locally acyclic sheaves (GS3 disjoint-leg full faithfulness; FS VI.9.3, where the statement is for the Satake category and not for all universally locally acyclic complexes), so the local extensions agree on overlaps and glue; perversity is checked on geometric fibres.
3. Pull back along the étale π\_K (HS2/multi-leg-period-and-representability; HS2/general-local-field for general E). Étale pullback commutes with relative Verdier duality and with the solid dual, so S′\_W on Sht\_K is the pullback of D(S\_W)^∨ from Gr^tw; this gives compatibility with level maps and with J\_b(E). In the minuscule one-leg case Gr\_{≤μ} is smooth of dimension d over Spd F̆, the relative dualizing complex is Λ[2d\](d), so D(Λ[d\](d/2))=Λ[d\](d/2) and its solid dual is Λ[−d\](−d/2).
4. Partial Frobenii: ∏\_iSpd F̆\_i→∏\_iSpd F̆\_i/φ\_i^Z is a torsor under the discrete group ∏\_iφ\_i^Z, and v-descent for D\_■ identifies objects on the quotient with objects carrying an action of that group; the comparison with ∏\_iW\_{F\_i}-equivariant lisse objects is HS1/continuous-weil-descent (FS IX.1.1).

**API.**

- `satakeCoefficient` (constructor): S\_W on Gr^tw\_{G,∏\_iSpd F̆\_i,≤μ•}: the unique flat perverse universally locally acyclic extension of the Satake sheaf of W=⊠\_iV\_{μ\_i} from the complement of the Frobenius-twisted partial diagonals.
- `satakeCoefficient.restrict_offDiagonal` (characterisation): On the complement of the twisted diagonals S\_W is the Beilinson–Drinfeld Satake sheaf of W; restriction to this locus is fully faithful on flat perverse universally locally acyclic sheaves on Gr^tw, so S\_W is determined by its restriction.
- `satakeCoefficient.convolutionChart` (compatibility): On the chart around the diagonal twisted by φ^m, m≠0, S\_W is the pullback under the partial Frobenius of the twisted external product of the S\_{V\_{μ\_i}} on the convolution Schubert variety.
- `satakeCoefficient.oneLeg` (simp): For I a singleton, Gr^tw=Gr\_{G,Spd F̆,≤μ} and S\_W=S\_{V\_μ}; for minuscule μ, S\_W=Λ[d\](d/2) with d=⟨2ρ,μ⟩.
- `satakeCoefficient.map` (functoriality): For fixed μ•, an endomorphism of the representation W=⊠\_iV\_{μ\_i} of ∏\_i(Ĝ⋊W\_{F\_i}) induces an endomorphism of S\_W on Gr^tw\_{≤μ•}, compatibly with identities and composition: it acts on the Satake sheaf off the twisted diagonals and extends uniquely by the full faithfulness of the restriction. Maps between representations with different bounds are not defined here, since S\_W is constructed only for exterior tensor products of highest-weight representations, on the Schubert variety of their bounds.
- `shtukaKernel` (constructor): S′\_W=D(π\_K^\*S\_W)^∨ on Sht\_{G,b,μ•,K}, D relative to ∏\_iSpd F̆\_i, ^∨ the solid dual.
- `shtukaKernel.level` (functoriality): For K′≤K with π:Sht\_{K′}→Sht\_K one has π^\*S′\_{W,K}=S′\_{W,K′}, compatibly with composition of level maps and with the action of J\_b(E).
- `shtukaKernel.minuscule` (simp): For one minuscule leg S′\_W=Λ[−d\](−d/2), d=⟨2ρ,μ⟩.
- `shtukaKernel.unit` (example): For W trivial, S\_W=S′\_W=Λ.
- `shtukaKernel.torsion` (compatibility): If ℓ^nΛ=0 then f\_{K♮}(S′\_W⊗B)≃Rf\_{K!}(S\_W⊗B) for B∈D\_ét(Sht\_K,Λ) (FS VII.5.2), so S′\_W is the kernel whose relative homology is compactly supported cohomology with coefficients S\_W.
- `PartialFrobenius` (data): For A∈D\_■(X×∏\_iSpd F̆\_i,Λ): an action of ∏\_iφ\_i^Z on A covering the action on the base, i.e. isomorphisms F\_i:φ\_i^\*A≃A commuting up to the coherences of a group action.
- `PartialFrobenius.descent` (equivalence): Objects with partial Frobenii are equivalent, by pullback, to objects of D\_■(X×∏\_iSpd F̆\_i/φ\_i^Z,Λ).
- `PartialFrobenius.weil` (compatibility): D\_lis(X,Λ)^{B∏\_iW\_{F\_i}} is a full subcategory of D\_■(X×∏\_iSpd F̆\_i/φ\_i^Z,Λ) (HS1/continuous-weil-descent); objects in it are those with a continuous ∏\_iW\_{F\_i}-action.

**Unit tests.**

- `shtukaKernel.minuscule_test` (computation): G=GL\_n over Q\_p, one leg, μ=(1,0,…,0): Gr\_{≤μ} is the diamond of P^{n−1} over Spd Q̆\_p, d=n−1, S\_W=Λ[n−1\]((n−1)/2), its relative Verdier dual is again Λ[n−1\]((n−1)/2), and S′\_W=Λ[1−n\]((1−n)/2). For n=1 both are Λ.
- `satakeCoefficient.torus_test` (computation): G=T a torus, any finite I and μ•: Gr^tw\_{T,≤μ•}→∏\_iSpd F̆\_i is an isomorphism and S\_W=S′\_W=Λ in degree 0 on the whole base, including the Frobenius-twisted diagonals.
- `satakeCoefficient.twisted_diagonal_test` (characterisation): G=GL\_2 over Q\_p, μ\_1=(1,0), μ\_2=(0,−1). Over a geometric point with S\_1♯=φ^m(S\_2♯), m≠0, the fibre of Gr^tw\_{≤μ•} is the convolution variety of Gr\_{μ\_1} and Gr\_{μ\_2}, a P¹-bundle over P¹, and S\_W restricts to Λ[2\](1). Over a point of the diagonal S\_1♯=S\_2♯ the fibre is the singular Schubert variety Gr\_{≤(1,−1)} and S\_W restricts to Rm\_\*(Λ[2\](1)), m the convolution map, whose stalk at the point Gr\_{(0,0)} is RΓ(P¹,Λ)[2\](1), of total rank 2.
- `satakeCoefficient.one_leg_test` (degenerate): For I a singleton there are no twisted diagonals, Gr^tw is the Schubert variety Gr\_{G,Spd F̆,≤μ} and S\_W is the Satake sheaf of V\_μ, with no extension step.
- `PartialFrobenius.descent_test` (characterisation): For X a point and I a singleton, the partial Frobenius structures on A=Λ over Spd F̆ are the isomorphisms F=u·id with u∈Λ^×; F=id descends to the constant sheaf on Spd F̆/φ^Z, and for u≠1 the descended rank-one object is not constant. For I={1,2} a pair (F\_1,F\_2) with F\_1∘φ\_1^\*(F\_2)≠F\_2∘φ\_2^\*(F\_1) is not a system of partial Frobenii.

**Uses.**

- HeckeStacksAndLocalShtukas:HS3/compact-support-at-levels: S′\_W is the coefficient of C\_K=f\_{K♮}S′\_W.
- HeckeStacksAndLocalShtukas:HS3/hecke-cohomology-comparison: The fusion description of S\_W on the twisted diagonals gives the comparison with T\_W across them; the partial Frobenius structure defined here is the one transported to C\_K.
- HeckeStacksAndLocalShtukas:HS3/level-trace-and-pullback: π^\*S′\_W=S′\_W for level maps defines pull and tr on C\_K.
- Fargues–Scholze, Proposition IX.3.2 and the paragraph before it (p. 326): S\_W on the twisted Grassmannian, its pullback to Sht\_K and S′\_W=D(S\_W)^∨ are the coefficients of the proposition.

**Acceptance.**

- For a single leg there is one isomorphism F:φ^\*A≃A and no commutation condition; it is a descent datum to X×Div^1.
- A bijection σ of I induces an isomorphism of twisted Schubert varieties under which S\_W corresponds to the sheaf of the permuted representation, and partial Frobenii are reindexed by σ.
- For W trivial (all μ\_i=0) Gr^tw is the base ∏\_iSpd F̆\_i and S\_W=S′\_W=Λ.

**Prerequisites.**

- In this roadmap: `HS0/twisted-period-grassmannian`, `HS2/general-local-field`, `HS1/continuous-weil-descent`, `HS2/multi-leg-period-and-representability`, `HS1/satake-kernel-and-solid-monoidal-functor`.
- In other roadmaps: `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`, `GeometricSatakeAndFusion:GS3:fusion`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `DiamondSixOperations:S3/upper-shriek-etale`, `GeometricSatakeAndFusion:GS4:integral-dual-group`.

**Sources.**

- Fargues–Scholze, IX.3, paragraph before Proposition IX.3.2, p. 326: Existence and uniqueness of S\_W on the twisted Grassmannian; the next sentences define its pullback to Sht\_K and S′\_W=D(S\_W)^∨.
- Fargues–Scholze, Proposition IX.3.2, p. 326: The partial Frobenius structure and its equivalence with descent to ∏\_iSpd F̆\_i/φ\_i^Z.
- Scholze–Weinstein, Definition 23.4.1, p. 221: For two legs: over the open set around the diagonal twisted by φ^m, m≠0, the twisted Grassmannian is the pullback under a partial Frobenius of the convolution Beilinson–Drinfeld Grassmannian, with the corresponding Schubert varieties; for several legs Definition 23.5.1, p. 223, defines the space directly, without charts. That S\_W is the twisted external product on these charts is the construction of this node, not of the source.

### Hecke action and shtuka cohomology

`HS3/hecke-cohomology-comparison` · Comparison

**Comparison.** Let j:Bun\_G^1=[\*/G(E)]→Bun\_G be the open immersion, i^b:Bun\_G^b→Bun\_G the stratum of b∈B(G), and identify D\_lis(Bun\_G^b,Λ) with D(J\_b(E),Λ) by pullback along [\*/J\_b(E)]→Bun\_G^b (FS VII.7.1; for non-basic b this uses that the kernel of Aut(E\_b)→J\_b(E) is a successive extension of positive Banach–Colmez spaces). Let W=⊠\_iV\_{μ\_i} and let K⊂G(E) be any compact open subgroup. (1) Comparison: the pullback of i^{b\*}T\_W(j\_!c-Ind\_K^{G(E)}Λ)∈D\_■([\*/J\_b(E)]×∏\_iSpd F̆\_i/φ\_i^Z,Λ) to [\*/J\_b(E)]×∏\_iSpd F̆\_i is identified with C\_K=f\_{K♮}S′\_W. The identification is J\_b(E)-equivariant, commutes with the action of G(E) on the tower, and for K′≤K carries tr and pull to the maps induced by c-Ind\_{K′}Λ→c-Ind\_KΛ, 1\_{gK′}↦1\_{gK}, and c-Ind\_KΛ→c-Ind\_{K′}Λ, 1\_{gK}↦Σ\_{k∈K/K′}1\_{gkK′}. (2) Weil structure: consequently C\_K carries partial Frobenii and descends to [\*/J\_b(E)]×∏\_iSpd F̆\_i/φ\_i^Z, and the descended object lies in the full subcategory D(J\_b(E),Λ)^{B∏\_iW\_{F\_i}}: its geometric fibre is a complex of smooth J\_b(E)-representations with a continuous action of the condensed group ∏\_iW\_{F\_i}. (3) The map: the fibre of the Hecke correspondence over E\_b, restricted to bundles isomorphic to E\_1 on the other side and divided by K, is the space ℳ\_K→∏\_iDiv^1\_{F\_i} of modifications between E\_1 and E\_b bounded by μ• with a level-K structure. After pullback to ∏\_iSpd F̆\_i there is a natural map Sht\_{G,b,μ•,K}→ℳ\_K, an isomorphism away from the Frobenius-twisted partial diagonals; over them it forgets the intermediate modifications recorded by a shtuka and is the convolution morphism on period spaces. (4) One minuscule leg: i^{b\*}T\_{V\_μ}(j\_!c-Ind\_KΛ)≃f\_{K♮}Λ[−d\](−d/2), d=⟨2ρ,μ⟩; with HS3/huber-cohomology-comparison this is RΓ\_c(M\_{G,b,μ,K,C},Λ)[d\](d/2) for E=Q\_p. Normalisation: Sht\_{G,b,μ,K} parametrises modifications E\_1⇢E\_b bounded by μ, nonempty exactly for b∈B(G,μ⁻¹) (SW 23.3.1, 24.1.2), and T\_{V\_μ}(A) at a bundle E integrates A over the modifications E′⇢E of type μ (the convention of FS IX.7.2–IX.7.3).

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p unless E=Q\_p is stated below; G/E is reductive; k is an algebraic closure of F\_q and S belongs to Perf\_k.
- Fix ℓ≠p, a Z\_ℓ[r]-algebra Λ with r²=q, and a finite quotient Q of W\_E through which the pinned action on the dual group factors. No condition on ℓ beyond ℓ≠p is imposed.
- K⊂G(E) is any compact open subgroup; W=⊠\_{i∈I}V\_{μ\_i} with fields of definition F\_i; in the last sentence of (4), E=Q\_p. If some F\_i≠E, T\_W denotes the direct summand, cut out by the summand ⊠\_iV\_{μ\_i} of the restriction of ⊠\_iInd\_{Ĝ⋊W\_{F\_i}}^{Ĝ⋊W\_E}V\_{μ\_i} to ∏\_i(Ĝ⋊W\_{F\_i}), of the pullback along ∏\_iDiv¹\_{F\_i}→(Div¹\_E)^I of the Hecke operator of that induced representation (the idempotent acts on this pullback because the operator of an exterior tensor product is the composite of the one-leg operators, HS1/monoidality-of-hecke-operators (c), and the idempotent of the i-th factor acts on the pullback of the i-th one-leg operator along Div¹\_{F\_i}→Div¹\_E); its kernel is the one described in the hypotheses of HS3/satake-coefficients-and-partial-frobenius.

**Proof outline.**

1. c-Ind\_K^{G(E)}Λ=g\_♮Λ for g:[\*/K]→[\*/G(E)]. By base change and the projection formula for p\_{2♮} (HS1/hecke-operator-via-relative-homology), and because the part of the Hecke correspondence between Bun\_G^1 and Bun\_G^b is the quotient of Mod^I\_{1,b,≤μ•} by the automorphism groups of the two bundles (HS2/framed-bundle-fibres (c)), i^{b\*}T\_W(j\_!g\_♮Λ) is the relative homology over ∏\_iDiv^1\_{F\_i} of ℳ\_K=Mod^I\_{1,b,≤μ•}/K with coefficients the pullback of S′\_W from the local Hecke stack.
2. Pull back to ∏\_iSpd F̆\_i. A shtuka with level-K structure determines two G-bundles on X\_S, from its restrictions near {π=0} and near {[ϖ]=0}, identified away from the images of the legs; this defines Sht\_K→ℳ\_K, an isomorphism wherever no leg is a non-trivial Frobenius translate of another (coinciding legs are allowed: there both sides are bounded by the sum of the μ\_i at the common leg), because the construction can then be reversed (HS2/hecke-fibre-description for one leg over Q\_p; HS2/multi-leg-period-and-representability and HS2/general-local-field in general; HS2/levels-and-tower-limit for the level structure).
3. Over the twisted diagonals the map is proper and is the convolution morphism on period spaces. Fusion identifies the pushforward of the twisted external product with the Beilinson–Drinfeld Satake sheaf (GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule), and FS VII.4.3 (VStackSheavesAndLisseCategories:VS2) carries this through D(−)^∨ and ♮-pushforward. Hence f\_{K♮}S′\_W is the pullback of i^{b\*}T\_W(j\_!c-Ind\_KΛ).
4. T\_W takes values in D\_lis(Bun\_G,Λ)^{B∏\_iW\_{F\_i}} (HS1/continuous-weil-descent; FS IX.2.3), and i^{b\*} and the identification with D(J\_b(E),Λ) are compatible with this structure; this gives (2). When some F\_i≠E the same applies to the direct summand T\_W of the pullback of the Hecke operator of ⊠\_iInd V\_{μ\_i}, with W\_{F\_i}⊂W\_E. For (4) insert S′\_{V\_μ}=Λ[−d\](−d/2) from HS3/satake-coefficients-and-partial-frobenius.
5. Level maps: Sht\_{K′}→Sht\_K corresponds to [\*/K′]→[\*/K] over [\*/G(E)], and the unit and counit of the two adjunctions for this finite étale map give the stated maps of compact inductions.

**Acceptance.**

- G=1: Bun\_G is a point, T\_W is the identity and C\_K=Λ.
- W trivial: T\_W is the identity, so C\_K=c-Ind\_K^{G(E)}Λ for b=1 and C\_K=0 for b≠1, in agreement with the no-leg computation of Sht.
- Torus T over Q\_p, one leg μ, b the class with κ(b)=−μ^♮, K⊂T(Q\_p): both sides have geometric fibre c-Ind\_K^{T(Q\_p)}Λ in degree 0; for the other classes b both sides are 0.
- Lubin–Tate: G=GL\_n over Q\_p, μ=(1,0,…,0), E\_b=O(1/n): i^{b\*}T\_std(j\_!c-Ind\_KΛ)≃RΓ\_c(M\_{K,C},Λ)[n−1\]((n−1)/2) for M\_K the Lubin–Tate tower; the shift [n−1] and the twist ((n−1)/2) come from the normalisation of the perverse sheaf of the standard representation (FS IX.7.3).
- Height one: G=GL\_1 over Q\_p, μ(z)=z, b with κ(b)=−1, K=1+p^nZ\_p, n≥1, p odd: the geometric fibre of C\_K is Λ[Q\_p^×/K], and the inertia group of Q\_p acts on Q\_p^×/K through the cyclotomic character or its inverse, in particular non-trivially.
- For K′≤K the composite c-Ind\_KΛ→c-Ind\_{K′}Λ→c-Ind\_KΛ is multiplication by [K:K′], matching tr∘pull.

**Prerequisites.**

- In this roadmap: `HS2/hecke-fibre-description`, `HS3/satake-coefficients-and-partial-frobenius`, `HS1/hecke-operator-via-relative-homology`, `HS3/compact-support-at-levels`, `HS2/multi-leg-period-and-representability`, `HS2/general-local-field`, `HS2/levels-and-tower-limit`, `HS1/continuous-weil-descent`, `HS2/framed-bundle-fibres`, `HS3/huber-cohomology-comparison`.
- In other roadmaps: `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`, `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`, `SmoothRepresentationsOfLocalGroups:SR.2`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `VStackSheavesAndLisseCategories:VS4`, `VStackSheavesAndLisseCategories:VS2/torsion-solid-comparisons`, `VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality`, `VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint`.

**Sources.**

- Fargues–Scholze, Proof of Proposition IX.3.2, p. 326: The comparison of the Hecke fibre ℳ with the shtuka space; the sentences before it state the key observation f\_{K♮}S′\_W=T\_W(j\_![c-Ind\_KΛ]) restricted to Bun\_G^b. The source writes the map from ℳ to Sht, while the construction in its next sentences goes from Sht to ℳ, the direction used here.
- Fargues–Scholze, Proof of Proposition IX.3.2, p. 327: The partial Frobenii of f\_{K♮}S′\_W are obtained from the comparison.
- Fargues–Scholze, Proof of Theorem IX.3.1, p. 324: The one-leg minuscule case; the source identifies i^{b\*}T\_μ(A) with f\_{K♮}Z\_ℓ only up to an unspecified shift, and the shift [−d\](−d/2) is computed here from S′\_{V\_μ}=Λ[−d\](−d/2).
- Fargues–Scholze, IX.7.3, proof of Theorem IX.7.4, p. 338: The shift [n−1] and twist ((n−1)/2) for the Lubin–Tate tower, and the convention that T\_std integrates over modifications O(−1/n)⊂E.
- Scholze–Weinstein, Proposition 23.3.1, p. 218: Sht\_{G,b,μ} parametrises modifications of a geometrically trivial bundle to E^b bounded by μ, with a lattice.

### Classical compact-support comparison

`HS3/huber-cohomology-comparison` · Comparison

**Comparison.** Let E=Q\_p, (G,b,μ) a local Shimura datum with F the field of definition of μ, M\_K=M\_{G,b,μ,K} the smooth partially proper rigid space over F̆ with M\_K^♦=Sht\_{G,b,μ,K} (HS2/minuscule-rigidification), d=⟨2ρ,μ⟩=dim M\_K, and f\_K:M\_{K,C}^♦→Spd C. (1) For every quasicompact open j:U→M\_{K,C} and m≥1, Huber's RΓ\_c(U,Z/ℓ^m), the compactly supported cohomology of the adic space U, is identified with Rf\_{K!}(j\_!Z/ℓ^m) computed in the étale cohomology of diamonds, compatibly in U and m. (2) Rf\_K^!Z/ℓ^m≃Z/ℓ^m[2d\](d), compatibly in m and with the trace maps of the two theories. (3) Hence f\_{K♮}Z\_ℓ≃RΓ\_c(M\_{K,C},Z\_ℓ)[2d\](d), where RΓ\_c(M\_{K,C},Z\_ℓ)=colim\_U Rlim\_m RΓ\_c(U,Z/ℓ^m) is Huber's complex, and f\_{K♮}Λ≃RΓ\_c(M\_{K,C},Z\_ℓ)⊗^L\_{Z\_ℓ}Λ[2d\](d) for every Z\_ℓ-algebra Λ. (4) These identifications are equivariant for J\_b(Q\_p) and for the Weil descent datum (hence for W\_F), and commute with pullback and trace along the finite étale maps M\_{K′}→M\_K. The equivalence of the étale sites of M\_K and M\_K^♦ identifies the categories of étale sheaves; (1) and (2) concern Rf\_! and Rf^! and need in addition the comparison of compactifications and of trace maps.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p unless E=Q\_p is stated below; G/E is reductive; k is an algebraic closure of F\_q and S belongs to Perf\_k.
- E=Q\_p; G is reductive over Q\_p, μ is minuscule with field of definition F, b∈B(G,μ⁻¹) (Berkeley normalisation), K⊂G(Q\_p) is compact open, ℓ≠p, and C is a completed algebraic closure of F̆.

**Proof outline.**

1. The equivalence of sites M\_{K,ét}≃M^♦\_{K,ét} (DiamondsAndVStacks:D6/etale-site-comparison; SW 10.4.2) identifies torsion étale sheaves and their derived categories, compatibly with j\_! and with pullback along finite étale maps.
2. Compare Huber's proper-support direct image (ClassicalAdicEtaleCohomology:H3) with Rf\_! for diamonds through a compactification, and the dualizing complexes through the trace (DiamondSixOperations:S3); since M\_K is smooth of dimension d, Rf\_K^!Z/ℓ^m=Z/ℓ^m[2d\](d). This gives (1) and (2).
3. FS VII.5.2 with A=Rf\_K^!Z\_ℓ and B=j\_!Z/ℓ^m gives f\_{K♮}(j\_!Z/ℓ^m)≃Rf\_{K!}(j\_!Rf\_K^!Z/ℓ^m) (through HS3/compact-support-at-levels). The complex f\_{K♮}j\_!Z\_ℓ is perfect, hence the derived limit of its reductions, and f\_{K♮} commutes with the colimit over U; this gives (3), with the limit over m formed at each U before the colimit over U (AdicCoefficientsAndComparisons:L0).
4. Equivariance: every map used is natural for automorphisms of M\_K covering the Weil descent datum (HS2/weil-descent-datum) and for finite étale maps.

**Acceptance.**

- M=Spa C: both sides are Z\_ℓ in degree 0.
- M the open unit disc over C: RΓ\_c(M,Z\_ℓ)=Z\_ℓ(−1)[−2] and f\_♮Z\_ℓ=Z\_ℓ in degree 0.
- M=⊔\_{n∈N}Spa C: RΓ\_c(M,Z\_ℓ)=⊕\_N Z\_ℓ, not the ℓ-adic completion of ⊕\_N Z\_ℓ.
- For a finite étale map π both identifications intertwine π^\* and the trace of π.

**Prerequisites.**

- In this roadmap: `HS2/minuscule-rigidification`, `HS3/compact-support-at-levels`, `HS2/weil-descent-datum`.
- In other roadmaps: `DiamondsAndVStacks:D6/etale-site-comparison`, `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`, `ClassicalAdicEtaleCohomology:H3/flat-quasi-finite-trace`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S1/lower-shriek-quasicompact`, `AdicCoefficientsAndComparisons:L0/adic-coefficient-limit`, `AdicCoefficientsAndComparisons:L0/six-operations-for-adic-coefficients`, `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`, `DiamondSixOperations:S4/smooth-perfect-constructible`.

**Sources.**

- Fargues–Scholze, IX.3, before Theorem IX.3.1, p. 324: Huber's compactly supported cohomology with Z\_ℓ-coefficients: colimit over quasicompact opens of the limit over m.
- Fargues–Scholze, Proof of Theorem IX.3.1, p. 324: The identification Rf\_{K!}Rf\_K^!Z\_ℓ|\_U=f\_{K♮}Z\_ℓ|\_U by VII.5.2 and the passage to the ℓ-adic limit on each quasicompact U.
- Scholze–Weinstein, Theorem 10.4.2, p. 81: The equivalence of étale sites of a rigid space and its diamond.
- Scholze–Weinstein, 24.1, after Proposition 24.1.2, p. 225: The smooth rigid space M\_{G,b,μ,K} whose diamond is Sht\_{G,b,μ,K}.

### Cohomology of local Shimura varieties: smoothness, compactness, continuity

`HS3/compactness-of-shtuka-cohomology` · Theorem · planet: **Cohomology of local Shimura varieties**

**Theorem.** Let E=Q\_p, G reductive over Q\_p, μ a conjugacy class of minuscule cocharacters with field of definition F, b∈B(G,μ⁻¹), so that (G,b,μ) is a local Shimura datum in the Berkeley normalisation and the tower M\_{G,b,μ,K} is nonempty (FS IX.3 prints b∈B(G,μ); with the operator T\_μ of its proof the condition is b∈B(G,μ⁻¹)), ℓ≠p, and K⊂G(Q\_p) compact open. (1) Huber's complex RΓ\_c(M\_{G,b,μ,K,C},Z\_ℓ) is naturally a complex of smooth J\_b(Q\_p)-representations, and the action of W\_F on it is continuous: it is an action of the condensed group W\_F on the associated complex of condensed Z\_ℓ-modules. (2) If K is pro-p, RΓ\_c(M\_{G,b,μ,K,C},Z\_ℓ) is a compact object of D(J\_b(Q\_p),Z\_ℓ), that is, it lies in the thick subcategory generated by the c-Ind\_{K\_b}^{J\_b(Q\_p)}Z\_ℓ for open pro-p K\_b⊂J\_b(Q\_p). (3) The pro-p hypothesis cannot be dropped: for G=G\_m, μ(z)=z, K=Z\_p^× and ℓ dividing p−1 the complex is c-Ind\_{Z\_p^×}^{Q\_p^×}Z\_ℓ in degree 0, which is not compact in D(Q\_p^×,Z\_ℓ). (4) For every compact open K each H^i\_c(M\_{G,b,μ,K,C},Z\_ℓ) is a finitely generated smooth J\_b(Q\_p)-representation. Beyond (2) this uses that subrepresentations of finitely generated smooth Z\_ℓ-representations of J\_b(Q\_p) are finitely generated (noetherian Hecke algebras), and for K not pro-p the Hochschild–Serre spectral sequence of the K/K′-torsor M\_{K′}→M\_K for an open normal pro-p K′⊂K. Compactness does not bound the Z\_ℓ-rank: c-Ind\_{K\_b}Z\_ℓ has infinite rank when J\_b(Q\_p)/K\_b is infinite.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p unless E=Q\_p is stated below; G/E is reductive; k is an algebraic closure of F\_q and S belongs to Perf\_k.
- E=Q\_p; G is reductive over Q\_p; μ is minuscule with field of definition F; b∈B(G,μ⁻¹); ℓ≠p; K⊂G(Q\_p) is compact open, pro-p in (2); C is a completed algebraic closure of F̆.

**Proof outline.**

1. By HS3/huber-cohomology-comparison, RΓ\_c(M\_{K,C},Z\_ℓ)≃f\_{K♮}Z\_ℓ[−2d\](−d) with d=⟨2ρ,μ⟩; by HS3/hecke-cohomology-comparison, f\_{K♮}Z\_ℓ[r][−d\](−d/2)≃i^{b\*}T\_{V\_μ}(j\_!c-Ind\_K^{G(Q\_p)}Z\_ℓ[r]) over Z\_ℓ[r]. This gives the smooth J\_b(Q\_p)-structure, and the continuity of W\_F by HS1/continuous-weil-descent (T\_μ takes values in sheaves on Bun\_G×Spd F̆/φ^Z whose pullback to Bun\_{G,C} is lisse).
2. For K pro-p, c-Ind\_KZ\_ℓ[r] is a compact object of D(G(Q\_p),Z\_ℓ[r]) and j\_! preserves compact objects; T\_{V\_μ} preserves compact objects (HS1/properties-and-weil-equivariance; FS IX.2.2) and so does i^{b\*} (FS VII.7.4, VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects). Hence RΓ\_c(M\_{K,C},Z\_ℓ)⊗Z\_ℓ[r] is compact in D(J\_b(Q\_p),Z\_ℓ[r]).
3. Descent of compactness from Z\_ℓ[r] to Z\_ℓ: Z\_ℓ[r] is finite free over Z\_ℓ, so RHom(A,B)⊗Z\_ℓ[r]=RHom(A⊗Z\_ℓ[r],B⊗Z\_ℓ[r]) and RHom(A,−) commutes with direct sums as soon as RHom(A⊗Z\_ℓ[r],−) does. Alternatively the kernel Z\_ℓ[−d] without half twist can be used over Z\_ℓ.
4. (3): RHom\_{Q\_p^×}(c-Ind\_{Z\_p^×}Z\_ℓ,−)=RΓ(Z\_p^×,−), and H^i(Z\_p^×,F\_ℓ)=H^i(F\_p^×,F\_ℓ)≠0 for all i≥0 when ℓ divides p−1, so RHom does not commute with the direct sum ⊕\_{i≥0}F\_ℓ[i].
5. (4): a compact object is a retract of a bounded complex of finite sums of c-Ind\_{K\_b}Z\_ℓ; its cohomology groups are subquotients of finitely generated representations, hence finitely generated: a finitely generated smooth Z\_ℓ-representation is finite over the centre of the category in the sense of Dat–Helm–Kurinczuk–Moss, Finiteness for Hecke algebras of p-adic groups (Theorem 1.2, equivalent to Theorem 1.1 on Hecke algebras), such representations are stable under subobjects and quotients (Lemma 3.1), and one of bounded depth is finitely generated (Remark 3.6); a subquotient of a finitely generated representation has bounded depth, the category being the product of its depth components. For general K use E\_2^{pq}=H^p(K/K′,H^q\_c(M\_{K′,C},Z\_ℓ))⇒H^{p+q}\_c(M\_{K,C},Z\_ℓ), whose terms are again subquotients of finitely generated representations.

**Acceptance.**

- Torus T over Q\_p, K pro-p: RΓ\_c(M\_{K,C},Z\_ℓ)=c-Ind\_K^{T(Q\_p)}Z\_ℓ in degree 0, one of the compact generators of D(T(Q\_p),Z\_ℓ).
- G=GL\_2, μ=(1,0), b basic, K=GL\_2(Z\_p): RΓ\_c(M\_{K,C},Z\_ℓ)≃c-Ind\_{O\_D^×}^{D^×}Z\_ℓ(−1)[−2] for D the quaternion division algebra over Q\_p; its cohomology is finitely generated, and it is not compact in D(D^×,Z\_ℓ) when ℓ divides p²−1.
- G=GL\_2, μ=(1,0), b basic, K=1+pM\_2(Z\_p): the complex is compact in D(D^×,Z\_ℓ), concentrated in degrees 1 and 2, and W\_{Q\_p} acts continuously on H^1\_c and H^2\_c.
- For one minuscule leg the statement agrees, through C\_K≃RΓ\_c(M\_{K,C},Λ)[d\](d/2), with the compactness of C\_K=f\_{K♮}S′\_W for general bounds (FS IX.3.2 with the pro-p hypothesis).

**Prerequisites.**

- In this roadmap: `HS3/hecke-cohomology-comparison`, `HS3/huber-cohomology-comparison`, `HS1/properties-and-weil-equivariance`, `HS1/continuous-weil-descent`.
- In other roadmaps: `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.6`.

**Sources.**

- Fargues–Scholze, Theorem IX.3.1, p. 324: The theorem; E in the source is the field of definition of μ, written F here.
- Fargues–Scholze, IX.3, sentence after Theorem IX.3.1, p. 324: Finite generation of each H^i\_c for all K, part (4).
- Fargues–Scholze, IX.3, first paragraph, p. 324: The datum as printed in the source: G over Q\_p, μ minuscule, b∈B(G,μ).
- Scholze–Weinstein, Definition 24.1.1, p. 225: The normalisation b∈B(G,μ⁻¹) of the tower M\_{G,b,μ,K} used in the statement.
- Dat–Helm–Kurinczuk–Moss, Theorem 1.1 and Theorem 1.2, p. 1; Corollary 1.4, p. 2; Lemma 3.1, p. 9; Remark 3.6, p. 11: For a noetherian Z\_ℓ-algebra of coefficients, ℓ ≠ p, the Hecke algebra of a compact open subgroup of a p-adic reductive group is a finitely generated module over its centre, which is a finitely generated algebra; equivalently every finitely generated smooth representation is finite over the centre of the category (Theorem 1.2). Representations with this property are stable under subobjects and quotients (Lemma 3.1), and one of bounded depth is finitely generated (Remark 3.6). With the decomposition of the category by depth this gives the input of part (4): subrepresentations of finitely generated smooth Z\_ℓ-representations are finitely generated.

### Compactness of shtuka cohomology with Satake coefficients

`HS3/general-bound-compactness` · Theorem

**Theorem.** Let E be any nonarchimedean local field, {μ\_i}\_{i∈I} conjugacy classes of cocharacters with fields of definition F\_i, b∈B(G), W=⊠\_iV\_{μ\_i} and C\_K=f\_{K♮}S′\_W. For K⊂G(E) open pro-p, the object of D(J\_b(E),Λ) underlying C\_K (forgetting the action of ∏\_iW\_{F\_i}) is compact. The pro-p hypothesis is needed: for G=G\_m, I a singleton, μ=0, b=1, K=O\_E^× and Λ=F\_ℓ with ℓ dividing q−1, C\_K=c-Ind\_{O\_E^×}^{E^×}F\_ℓ is not compact in D(E^×,F\_ℓ). (FS IX.3.2 and I.7.3 print the assertion for all compact open K.) For one minuscule leg over Q\_p the statement is FS IX.3.1 through C\_K≃RΓ\_c(M\_{K,C},Λ)[d\](d/2). The coefficient is the Satake kernel S′\_W; for non-minuscule μ• nothing is asserted for constant coefficients.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p unless E=Q\_p is stated below; G/E is reductive; k is an algebraic closure of F\_q and S belongs to Perf\_k.
- Fix ℓ≠p, a Z\_ℓ[r]-algebra Λ with r²=q, and a finite quotient Q of W\_E through which the pinned action on the dual group factors. No condition on ℓ beyond ℓ≠p is imposed.
- K⊂G(E) is open pro-p (compact open in the counterexample); the μ\_i are arbitrary conjugacy classes of cocharacters.

**Proof outline.**

1. By HS3/hecke-cohomology-comparison, C\_K is the pullback of i^{b\*}T\_W(j\_!c-Ind\_K^{G(E)}Λ).
2. For K pro-p, c-Ind\_KΛ is a compact (projective) object of D(G(E),Λ) since p is invertible in Λ; j\_! preserves compact objects; T\_W preserves compact objects (HS1/properties-and-weil-equivariance; FS IX.2.2); i^{b\*} preserves compact objects (FS VII.7.4, VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects).
3. Counterexample: for μ=0 and b=1, Sht\_K=E^×/K×Spd Ĕ and C\_K=c-Ind\_K^{E^×}Λ. RHom\_{E^×}(c-Ind\_{O\_E^×}F\_ℓ,−)=RΓ(O\_E^×,−) and H^i(O\_E^×,F\_ℓ)=H^i(F\_q^×,F\_ℓ)≠0 for all i≥0 when ℓ divides q−1, so RHom does not commute with the direct sum ⊕\_{i≥0}F\_ℓ[i].

**Acceptance.**

- One minuscule leg over Q\_p: the statement is FS IX.3.1 after the shift and twist [d\](d/2).
- E=F\_q((π)): the same statement, with W\_{F\_i} the Weil groups of the fields of definition.
- G=G\_m, μ=0, b=1: C\_K=c-Ind\_K^{E^×}Λ, compact for K=1+𝔪\_E, not compact for K=O\_E^× and Λ=F\_ℓ with ℓ dividing q−1.
- G=GL\_2, μ=(2,0): the coefficient S\_W is the Satake sheaf on Gr\_{≤(2,0)}, with non-zero restriction to the boundary stratum Gr\_{(1,1)}, and not the extension by zero of a constant sheaf on the open cell.

**Prerequisites.**

- In this roadmap: `HS3/hecke-cohomology-comparison`, `HS1/properties-and-weil-equivariance`.
- In other roadmaps: `SmoothRepresentationsOfLocalGroups:SR.2`, `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`.

**Sources.**

- Fargues–Scholze, Proposition IX.3.2, p. 326: The compactness assertion; the proposition places no condition on K, and the statement here adds the pro-p hypothesis of Theorem IX.3.1.
- Fargues–Scholze, Proof of Proposition IX.3.2, p. 327: The proof is that of Theorem IX.3.1, which uses that K is pro-p.
- Fargues–Scholze, Proposition VII.7.4, p. 273: Stalks of compact objects are compact; compact objects of D(G\_b(E),Λ) are generated by compact inductions from open pro-p subgroups.

### Admissibility, duality and the Hecke adjunction

`HS3/admissibility-duality-and-adjunction` · Theorem · planet: **Admissibility and Hecke adjunction**

**Theorem.** Let W=⊠\_iV\_{μ\_i}, C\_K=f\_{K♮}S′\_W, and for ρ∈D(J\_b(E),Λ), with [ρ] the corresponding object of D\_lis(Bun\_G^b,Λ), put X(ρ)=i^{1\*}T\_{W^∨}(Ri^b\_\*[ρ])∈D\_lis(Bun\_G^1,Λ)≃D(G(E),Λ), with its action of ∏\_iW\_{F\_i}. Call ρ admissible if ρ^{K\_b} is a perfect complex of Λ-modules for every open pro-p K\_b⊂J\_b(E). (1) Adjunction: for every open pro-p K⊂G(E), RHom\_{J\_b(E)}(C\_K,ρ)≃X(ρ)^K, compatibly with ∏\_iW\_{F\_i}; for K′≤K the map induced by tr:C\_{K′}→C\_K is the inclusion X(ρ)^K→X(ρ)^{K′}. Hence colim\_K RHom\_{J\_b(E)}(C\_K,ρ)≃X(ρ), with no shift. This holds for every ρ. (2) Admissibility: if ρ is admissible, RHom\_{J\_b(E)}(C\_K,ρ) is a perfect complex of Λ-modules for K pro-p, and X(ρ) is admissible. For K not pro-p perfectness can fail: G=G\_m, μ=0, b=1, K=O\_E^×, ρ the trivial representation on F\_ℓ, ℓ dividing q−1, gives RΓ(O\_E^×,F\_ℓ). (3) One minuscule leg over Q\_p: RHom\_{J\_b(Q\_p)}(RΓ\_c(M\_{K,C},Z\_ℓ),ρ)≃X(ρ)^K[d\](d/2) with W=V\_μ and d=⟨2ρ,μ⟩. (4) Duality: let D=RHom\_lis(−,Λ), which on D(G(E),Λ) and D(J\_b(E),Λ) is the derived smooth dual, and let ρ be admissible with smooth dual ρ^∨. If b is basic, X(ρ)≃D(i^{1\*}T\_{sw^\*W}(i^b\_![ρ^∨])). For arbitrary b the same holds with [ρ^∨] replaced by [ρ^∨]⊗i^{b!}Λ, where i^{b!}Λ, the dualizing complex of Bun\_G^b, is invertible and concentrated in cohomological degree 2⟨2ρ,ν\_b⟩. (5) Finite length: if Λ=Q̄\_ℓ and ρ is a smooth representation of finite length, every cohomology group of X(ρ) is a G(E)-representation of finite length. (6) Compact ρ: let U⊂Bun\_G be a quasicompact open substack containing the finitely many strata of the bundles E′ that admit a modification E\_1⇢E′ bounded by μ•. If the restriction of Ri^b\_\*[ρ] to U is compact, then X(ρ) is a compact object of D(G(E),Λ). The hypothesis holds for every compact ρ as soon as i^b\_\* of a compact object has compact stalks; this is Theorem 7.1.4 of Hamann–Hansen–Scholze, Geometric Eisenstein series I: finiteness theorems, whose six-functor formalism is set up for Λ killed by a power of ℓ. For Λ=Q̄\_ℓ and ρ of finite length, X(ρ) is bounded with cohomology of finite length (proof of (5)), hence compact. FS IX.3.2 states the conclusion for every compact ρ, and the argument it refers to gives only the case of (5). Perfectness at each level, as in (2), is not finiteness of X(ρ) over Λ: for W trivial, b=1 and ρ an infinite-dimensional admissible representation of G(E), X(ρ)=ρ.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p unless E=Q\_p is stated below; G/E is reductive; k is an algebraic closure of F\_q and S belongs to Perf\_k.
- Fix ℓ≠p, a Z\_ℓ[r]-algebra Λ with r²=q, and a finite quotient Q of W\_E through which the pinned action on the dual group factors. No condition on ℓ beyond ℓ≠p is imposed.
- K ranges over open pro-p subgroups of G(E) except in the counterexample of (2); in (3) E=Q\_p, I is a singleton and μ is minuscule; in (5) Λ=Q̄\_ℓ.

**Proof outline.**

1. Adjunction: RHom\_{J\_b(E)}(i^{b\*}T\_W(j\_!c-Ind\_KΛ),ρ)=RHom(T\_W(j\_!c-Ind\_KΛ),Ri^b\_\*[ρ])=RHom(j\_!c-Ind\_KΛ,T\_{W^∨}Ri^b\_\*[ρ])=RHom\_{G(E)}(c-Ind\_KΛ,X(ρ))=X(ρ)^K, using HS3/hecke-cohomology-comparison, i^{b\*}⊣Ri^b\_\*, T\_W⊣T\_{W^∨} (HS1/properties-and-weil-equivariance), j\_!⊣j^\* and Frobenius reciprocity for the pro-p group K (SmoothRepresentationsOfLocalGroups:SR.2).
2. A smooth complex is the colimit of its invariants under open pro-p subgroups; under the comparison tr corresponds to c-Ind\_{K′}Λ→c-Ind\_KΛ (HS3/level-trace-and-pullback), which induces the inclusion of invariants. This gives the colimit formula of (1); (3) follows from C\_K≃RΓ\_c(M\_{K,C},Λ)[d\](d/2).
3. Perfectness: C\_K is compact for K pro-p (HS3/general-bound-compactness) and RHom(c-Ind\_{K\_b}Λ,ρ)=ρ^{K\_b} is perfect, so RHom(A,ρ) is perfect for every compact A. Equivalently Ri^b\_\*[ρ] is universally locally acyclic by the criterion of FS VII.7.9, T\_{W^∨} preserves such objects (HS1/ula-preservation), and the stalk at b=1 of a universally locally acyclic object is admissible.
4. Duality: RHom\_lis(T\_V(A),Λ)≃T\_{sw^\*V^∨}RHom\_lis(A,Λ) (HS1/duality-exchange; FS IX.2.2) with V=sw^\*W and A=i^b\_!B; RHom\_lis(i^b\_!B,Λ)=Ri^b\_\*RHom\_lis(B,i^{b!}Λ); an admissible ρ is reflexive; i^{1\*} commutes with RHom\_lis(−,Λ) because j is an open immersion. For basic b, i^b is an open immersion and i^{b!}Λ=Λ; in general Bun\_G^b is cohomologically smooth of ℓ-dimension −⟨2ρ,ν\_b⟩ (FS IV.1.22) inside Bun\_G of ℓ-dimension 0 with dualizing complex Λ.
5. Finite length: with Q̄\_ℓ-coefficients the category of smooth representations of G(E) is noetherian of finite global dimension, so compact means bounded with finitely generated cohomology. ρ^∨ has finite length, hence is compact and admissible; i^b\_!, T\_{sw^\*W} and i^{1\*} preserve compact objects and universally locally acyclic objects, so i^{1\*}T\_{sw^\*W}(i^b\_![ρ^∨]) has finitely generated admissible cohomology, of finite length by Howe's theorem (Renard VI.6.3). The smooth dual of a representation of finite length has finite length, and a shift or a twist by a character of J\_b(E) of [ρ^∨] does not change the argument.
6. (6): T\_{W^∨}(A) at the bundle E\_1 depends only on the restriction of A to the strata of bundles E′ with a modification E\_1⇢E′ bounded by μ•, so for the cone Q of j\_{U!}j\_U^\*Ri^b\_\*[ρ]→Ri^b\_\*[ρ], which is supported off U, i^{1\*}T\_{W^∨}(Q)=0 and X(ρ)=i^{1\*}T\_{W^∨}(j\_{U!}j\_U^\*Ri^b\_\*[ρ]). The functors j\_{U!}, T\_{W^∨} and i^{1\*} preserve compact objects. If i^b\_\* of a compact object has compact stalks (Hamann–Hansen–Scholze, Theorem 7.1.4), then j\_U^\*Ri^b\_\*[ρ] has finite support and compact stalks, hence is compact by FS VII.7.4.

**Acceptance.**

- G=1: X(ρ)=ρ and RHom\_Λ(Λ,ρ)=ρ.
- Torus T over Q\_p, one leg μ, b the class with κ(b)=−μ^♮, K pro-p: C\_K=c-Ind\_K^{T(Q\_p)}Λ, RHom\_{T(Q\_p)}(c-Ind\_KΛ,ρ)=ρ^K, and X(ρ) is ρ as a representation of T(Q\_p), with W\_F acting through a continuous homomorphism W\_F→T(Q\_p) followed by the action of T(Q\_p) on ρ; for admissible ρ the duality formula reads ρ≃D(ρ^∨).
- Compact but not admissible ρ: G=G\_m over E, one leg, K and K\_b open pro-p, C\_K=c-Ind\_KΛ and ρ=c-Ind\_{K\_b}Λ give RHom\_{E^×}(C\_K,ρ)=Λ[E^×/KK\_b], of infinite rank, hence not perfect; X(ρ) is ρ=c-Ind\_{K\_b}Λ, on which W\_F acts by translations through a continuous homomorphism W\_F→E^×, and it is compact.
- Λ=Q̄\_ℓ, G=GL\_2 over Q\_p, μ=(1,0), b basic, ρ the trivial representation of D^×: the cohomology groups of X(ρ) are of finite length; the tower cohomology colim\_K H^i\_c(M\_{K,C},Q̄\_ℓ) itself is not of finite length.

**Prerequisites.**

- In this roadmap: `HS3/general-bound-compactness`, `HS1/duality-exchange`, `HS3/hecke-cohomology-comparison`, `HS1/properties-and-weil-equivariance`, `HS1/ula-preservation`, `HS3/level-trace-and-pullback`.
- In other roadmaps: `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`, `VStackSheavesAndLisseCategories:VS4`, `BunGAndNewtonStrata:BG3/stratum-dimension`, `BunGAndNewtonStrata:BG2:smooth-Artin/bun-g-is-smooth-artin`, `VStackSheavesAndLisseCategories:VS5/lisse-ula-definition`, `VStackSheavesAndLisseCategories:VS5/lisse-ula-equals-admissibility`, `VStackSheavesAndLisseCategories:VS3/lisse-adjoints-and-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`.

**Sources.**

- Fargues–Scholze, IX.3, after the proof of Theorem IX.3.1, p. 325: The level colimit of RHom is, up to a shift that the source does not specify, i^{1\*}T\_{μ^∨}(Ri^b\_\*[ρ]); the shift is [d\](d/2) for RΓ\_c and none for C\_K, by the computation of part (3).
- Fargues–Scholze, IX.3, p. 325: The duality formula; as printed it is exact for basic b.
- Fargues–Scholze, IX.3, p. 325: The finite length statement for Λ=Q̄\_ℓ and its proof.
- Fargues–Scholze, Proposition IX.3.2, p. 326: Perfectness of RHom and admissibility of the level colimit for general bounds; the next sentence is the assertion for compact ρ.
- Fargues–Scholze, Proposition VII.7.9, p. 275: Universally locally acyclic means admissible stalks; used for admissibility of X(ρ).
- Hamann–Hansen–Scholze, Theorem 1.3.1, p. 6; Theorem 7.1.4 and its proof, pp. 60–61; footnote 1, p. 2: For a compact object A of D(G\_b(E),Λ) the pushforward of A along the stratum has compact stalks; the proof is by induction on strata from the preservation of compact objects by the upper-shriek restriction to a stratum. The footnote restricts the available formalism to Λ killed by a power of ℓ. This is the input of part (6).
- Hamann–Imai, Proposition 4.1, p. 24, with Proposition 1.1 (= Proposition 3.18), p. 2 (torsion coefficients, p. 7): For p\_b: Bun\_G^b → [∗/G\_b(E)] one has p\_b^!Λ ≅ p\_b^\*(δ\_b⁻¹)[−2d\_b] with d\_b = ⟨2ρ\_G,ν\_b⟩: the dualizing complex of Bun\_G^b is an invertible sheaf in cohomological degree 2d\_b, where δ\_b is the character of Definition 3.14 (for quasi-split G the modulus character of the parabolic of b, transferred to G\_b(E)). Since the dualizing complex of Bun\_G is Λ (Proposition 1.1), this is also i^{b!}Λ. An independent check of the degree stated in part (4), for torsion coefficients; the node does not use the character.

### Level pullback, trace and index normalization

`HS3/level-trace-and-pullback` · Theorem

**Theorem.** For compact open K′≤K⊂G(E), π:Sht\_{G,b,μ•,K′}→Sht\_{G,b,μ•,K} is finite étale of degree [K:K′], and a K/K′-torsor when K′ is normal in K. Since π^\*S′\_W=S′\_W and π\_♮=π\_\*, there are maps pull:C\_K→C\_{K′} (unit of π^\*⊣π\_\*) and tr:C\_{K′}→C\_K (counit of π\_♮⊣π^\*), equivariant for J\_b(E) and compatible with the partial Frobenii. (1) tr∘pull=[K:K′]·id on C\_K. (2) If K′ is normal in K, pull∘tr=Σ\_{γ∈K/K′}γ^\* on C\_{K′}. (3) Transitivity: for K″≤K′≤K, tr\_{K′,K}∘tr\_{K″,K′}=tr\_{K″,K} and pull\_{K′,K″}∘pull\_{K,K′}=pull\_{K,K″}; conjugation by g∈G(E) intertwines them. (4) Under HS3/hecke-cohomology-comparison, tr and pull are induced by c-Ind\_{K′}^{G(E)}Λ→c-Ind\_K^{G(E)}Λ, 1\_{gK′}↦1\_{gK}, and by c-Ind\_KΛ→c-Ind\_{K′}Λ, 1\_{gK}↦Σ\_{k∈K/K′}1\_{gkK′}; on Hom\_{G(E)}(c-Ind\_•Λ,π)=π^• for a smooth representation π they induce the inclusion π^K⊂π^{K′} and the map π^{K′}→π^K, v↦Σ\_{k∈K/K′}kv. (5) Normalisation: when [K:K′] is a unit in Λ, [K:K′]⁻¹tr is a retraction of pull and [K:K′]⁻¹pull∘tr is an idempotent of C\_{K′} that splits off C\_K; when [K:K′] is not a unit in Λ these maps are not defined, and tr∘pull=[K:K′] need not be invertible. If K is pro-p then [K:K′] is a power of p, hence a unit in every Z\_ℓ-algebra; for general K it need not be a unit (K=GL\_2(Z\_p), K′ an Iwahori subgroup: index p+1). (6) The tower object C\_∞ is the colimit along pull; colim\_K RHom\_{J\_b(E)}(C\_K,ρ) is the colimit along the maps induced by tr.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p unless E=Q\_p is stated below; G/E is reductive; k is an algebraic closure of F\_q and S belongs to Perf\_k.
- Fix ℓ≠p, a Z\_ℓ[r]-algebra Λ with r²=q, and a finite quotient Q of W\_E through which the pinned action on the dual group factors. No condition on ℓ beyond ℓ≠p is imposed.
- K′≤K are compact open subgroups of G(E); W=⊠\_iV\_{μ\_i}; C\_K=f\_{K♮}S′\_W.

**Proof outline.**

1. π is finite étale of degree [K:K′] and a K/K′-torsor for K′ normal (HS2/levels-and-tower-limit; SW 23.3 for one leg and 23.5.3 for several; HS2/general-local-field (3) for general E). For finite étale π one has π\_!=π\_\*=π\_♮ and π^!=π^\*; the unit and counit of the two adjunctions, applied to S′\_W with π^\*S′\_W=S′\_W (HS3/satake-coefficients-and-partial-frobenius) and followed by f\_{K♮}, give pull and tr (HS3/compact-support-at-levels).
2. tr∘pull is multiplication by the degree of π, which is the constant [K:K′]. For a K/K′-torsor, Sht\_{K′}×\_{Sht\_K}Sht\_{K′}=⊔\_{γ∈K/K′}Sht\_{K′} and base change give pull∘tr=Σ\_γγ^\* (DiamondSixOperations:S3).
3. Transitivity follows from composition of adjunctions. Under the comparison π corresponds to [\*/K′]→[\*/K] over [\*/G(E)], and ♮-pushforward of Λ along [\*/K]→[\*/G(E)] is c-Ind\_KΛ; unit and counit give the stated maps (SmoothRepresentationsOfLocalGroups:SR.1 for the Hecke-algebra description).
4. Index: an open subgroup of a pro-p group has p-power index, and p is a unit in Z\_ℓ.

**Acceptance.**

- K′=K: tr and pull are the identity.
- K pro-p, [K:K′]=p, Λ=Z\_ℓ[r]: p⁻¹tr is a retraction of pull.
- G=GL\_2(Q\_p), K=GL\_2(Z\_p), K′ an Iwahori subgroup, Λ an algebraic closure of F\_ℓ with ℓ dividing p+1: tr∘pull=0, so when C\_K≠0 no multiple of tr is a retraction of pull.
- b=1 and one leg with μ=0: on C\_K=Λ[G(E)/K], tr(1\_{gK′})=1\_{gK} and pull(1\_{gK})=Σ\_{k∈K/K′}1\_{gkK′}.

**Prerequisites.**

- In this roadmap: `HS2/levels-and-tower-limit`, `HS3/hecke-cohomology-comparison`, `HS3/compact-support-at-levels`, `HS3/satake-coefficients-and-partial-frobenius`, `HS2/general-local-field`.
- In other roadmaps: `SmoothRepresentationsOfLocalGroups:SR.1`, `DiamondSixOperations:S3/adjunction-calculus`, `DiamondSixOperations:S3/upper-shriek-etale`, `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS2/proper-smooth-solid-poincare`.

**Sources.**

- Scholze–Weinstein, 23.3, text between Proposition 23.3.1 and Corollary 23.3.2, p. 219: The level maps are finite étale, and torsors for normal subgroups (one leg). The trace identities (1)–(5) are not stated in the sources; they are proved from the finite étale formalism of the six operations.
- Scholze–Weinstein, After Corollary 23.5.3, p. 224: For several legs the level-K spaces form a tower of finite étale covers whose inverse limit is a G(Q\_p)-torsor over the admissible locus; that Sht\_{K′}→Sht\_K is a K/K′-torsor for K′ normal is not stated there and follows from this description.

### Comparison with independent classical RZ towers

`HS3/classical-comparison` · Comparison

**Comparison.** (1) GL\_n (SW 24.2.5). Let 𝕏 be a p-divisible group over k=F̄\_p of dimension d and height n, and M(𝕏)≅Q̆\_p^n its covariant rational Dieudonné module in the Berkeley normalisation (Q\_p/Z\_p↦(W(k),φ), μ\_{p^∞}↦(W(k),p⁻¹φ)), with Frobenius bφ. Thus b∈GL\_n(Q̆\_p) has slopes in [−1,0], κ(b)=−d, and b∈B(GL\_n,μ⁻¹) for μ=(1^d,0^{n−d}); the Frobenius of the covariant Dieudonné module normalised by Lie 𝕏=M/VM is pbφ. Let ℳ\_𝕏 be the formal scheme over Spf Z̆\_p of deformations (X,ρ) of 𝕏 up to quasi-isogeny. Then ℳ\_{𝕏,Q̆\_p}^♦≅Sht\_{GL\_n,b,μ,GL\_n(Z\_p)} as diamonds over Spd Q̆\_p, compatibly with the period maps to Gr(d,n)^♦≅Gr\_{GL\_n,Spd Q̆\_p,≤μ}, and the Rapoport–Zink tower (ℳ\_{𝕏,Q̆\_p,K})\_K is isomorphic to the local Shimura tower (ℳ\_{GL\_n,b,μ,K})\_K over all compact open K⊂GL\_n(Q\_p). The isomorphism sends (X,ρ) over a perfectoid (R,R^+) to the modification 0→ℱ→ℰ^b→i\_{∞\*}Lie X→0 with ℱ≅𝕋(X)⊗\_{Z\_p}O and the lattice 𝕋(X). (2) EL and PEL data (SW 24.3.5). Let 𝒟=(B,V,O\_B,ℒ,(,),\*,b,μ) be EL or PEL data in the sense of the appendix to Lecture 21 of SW (pp. 198–199): B is a finite-dimensional semisimple Q\_p-algebra whose centre is a field, V a finite B-module, O\_B a maximal order and ℒ a chain of O\_B-lattices in V; in the PEL case p≠2, (,) is a non-degenerate alternating form with (bv,w)=(v,b^\*w), and ℒ is self-dual. Assume G connected, 𝒢=Aut(ℒ) parahoric, μ minuscule with field of definition F such that the weights of μ on V⊗Q̄\_p are only 0 and 1 and, in the PEL case, the composite of μ with the similitude character c:G→G\_m is the identity (the conditions of the appendix to Lecture 21 of SW, p. 200), and b∈B(G,μ⁻¹). Let ℳ\_𝒟 be the formal scheme over Spf O\_{F̆} of M^{loc,naive}\_{(𝒢,μ)}-admissible (polarized) chains of O\_B-p-divisible groups of type (ℒ) with a quasi-isogeny from the chain 𝕏\_{b,Λ}. Then ℳ\_{𝒟,F̆}≅ℳ\_{G,b,μ,𝒢(Z\_p)} as smooth rigid spaces over F̆, identifying the natural 𝒢(Z\_p)-torsors and hence the towers over the open subgroups K⊂𝒢(Z\_p). (3) Special cases of (2): B=E′ a finite extension of Q\_p, V=E′^n, ℒ the multiples of O\_{E′}^n, μ equal to (1,0,…,0) at one embedding of E′ and 0 at the others, and b the basic element of B(G,μ⁻¹) give the Lubin–Tate tower of formal O\_{E′}-modules of height n as the local Shimura variety of Res\_{E′/Q\_p}GL\_n; B=D the division algebra of invariant 1/n over E′ and V=D, with the analogous μ, give the Drinfeld tower. The two towers are exchanged at infinite level by HS2/no-legs-and-basic-duality, with the roles of G and J\_b reversed. The cited lectures do not spell out these cases, and they do not identify these towers over Q\_p with the towers of FS IX.3 for GL\_n over the base field E′. (4) Cohomology: under (1)–(3) the compactly supported cohomology of the classical tower, in Huber's convention, is the geometric fibre of C\_K[−δ\](−δ/2), where δ=⟨2ρ,μ⟩ is the dimension of the tower (δ=d(n−d) in (1), d being the dimension of 𝕏), equivariantly, by HS3/huber-cohomology-comparison.

**Hypotheses and conventions.**

- E is a nonarchimedean local field with residue field F\_q of characteristic p, of characteristic 0 or p unless E=Q\_p is stated below; G/E is reductive; k is an algebraic closure of F\_q and S belongs to Perf\_k.
- E=Q\_p and k=F̄\_p throughout; in (2) the data are those of the appendix to Lecture 21 of SW (centre of B a field, O\_B a maximal order, ℒ a chain, self-dual in the PEL case, and p≠2 in the PEL case), G is connected, 𝒢 is parahoric and b∈B(G,μ⁻¹); in (3) E′ is a finite extension of Q\_p and the group over Q\_p is a Weil restriction.
- The Rapoport–Zink spaces are not objects of this roadmap: the two-tower layer of the roadmap on endoscopic transfer constructs the Lubin–Tate and Drinfeld towers, and the general spaces, with these two comparison theorems, are assigned by the routing of the Scholze–Weinstein lectures to the continuation of this roadmap on integral models (HeckeStacksAndLocalShtukasIntegralPartII). The statement is recorded here for the layers that consume HS3; the first proposed change of structure of this packet says where it moves once that continuation has layers.

**Proof outline.**

1. (1), construction: for (X,ρ) over a perfectoid (R,R^+), Grothendieck–Messing theory gives Lie EX[1/p]≅M(𝕏)⊗R for the universal vector extension EX, and Lie EX→Lie X is a point of Gr(d,n). This defines, for S=Spa(R,R^+), a φ-module on S^♭×̇Spa Q\_p identified with ℰ^b near infinity and the modification ℱ⊂ℰ^b with cokernel i\_{∞\*}Lie X. The Tate module gives 𝕋(X)⊗O→ℰ^b, which factors through an isomorphism onto ℱ (Scholze–Weinstein, Moduli of p-divisible groups, Proposition 5.1.6); so 𝕋(X) is a GL\_n(Z\_p)-lattice and HS2/hecke-fibre-description gives ℳ\_𝕏^♦→Sht.
2. (1), isomorphism: both sides are étale over the Grassmannian (Rapoport–Zink 5.17; HS2/one-leg-period-map), with the same image, the admissible locus (Scholze–Weinstein, Moduli of p-divisible groups, Theorem 6.2.1; first proved by Faltings), and the same fibres GL\_n(Q\_p)/GL\_n(Z\_p) (Rapoport–Zink 5.37). The universal Q\_p-local systems on the admissible locus agree, which identifies all levels (HS2/levels-and-tower-limit) and, by HS2/minuscule-rigidification, the rigid towers.
3. (2): both sides are closed subspaces of ∏\_Λℳ\_{𝕏\_{b,Λ},F̆}≅∏\_Λℳ\_{GL(Λ),ρ\_Λ(b),ρ\_Λ(μ)} (SW 24.3.4, from Rapoport–Zink Theorem 3.25, and (1)), so it suffices to compare geometric rank-one points. A chain over O\_C gives by Breuil–Kisin–Fargues modules a chain of O\_B⊗A\_inf-modules of type (ℒ), that is a 𝒢-torsor over A\_inf with a Frobenius of relative position μ; shtukas over Spa C^♭×̇Spa Z\_p extend uniquely to Spec A\_inf (SW 14.1.1, 21.2.2).
4. (3) and (4): specialise (2) to the two EL data and apply HS3/huber-cohomology-comparison to the identified rigid towers.

**Acceptance.**

- n=1, d=1: 𝕏=μ\_{p^∞}, b=p⁻¹, μ=(1); for K=1+p^mZ\_p the space ℳ\_{𝕏,Q̆\_p,K} is ⊔\_Z Spa Q̆\_p(ζ\_{p^m}) and Sht\_{GL\_1,b,μ,K} has geometric fibre Q\_p^×/K.
- d=0: 𝕏 is étale, b=1, μ=0, and both sides are GL\_n(Q\_p)/GL\_n(Z\_p) (SW 23.2.1).
- With b replaced by pb (the usual covariant Frobenius) one has κ=n−d≠−d for n>0, and Sht\_{GL\_n,pb,μ} is empty by SW 24.1.2.
- Lubin–Tate tower of height n over Q\_p: d=1, μ=(1,0,…,0), dim ℳ=n−1; basic duality exchanges it with the Drinfeld tower with G and J\_b interchanged.

**Prerequisites.**

- In this roadmap: `HS2/minuscule-rigidification`, `HS2/no-legs-and-basic-duality`, `HS3/huber-cohomology-comparison`, `HS2/one-leg-period-map`, `HS2/hecke-fibre-description`, `HS2/levels-and-tower-limit`.
- In other roadmaps: `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-tate-module`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `AInfCohomology:AI.2/fargues-classification`, `IgusaVarietiesAndTorsionConcentration:IG.0/pel-rapoport-zink-space`.

**Sources.**

- Scholze–Weinstein, Theorem 24.2.5, p. 227: The GL\_n comparison at level GL\_n(Z\_p).
- Scholze–Weinstein, Proof of Theorem 24.2.5, p. 227: b is the Frobenius of the covariant Dieudonné module.
- Scholze–Weinstein, 12.1, footnote 1, p. 99: The normalisation of covariant Dieudonné theory in the lectures: slopes in [−1,0].
- Scholze–Weinstein, After the proof of Theorem 24.2.5, p. 229: The isomorphism of towers over all levels K.
- Scholze–Weinstein, 24.3, before Definition 24.3.3, p. 230: The hypotheses of the EL/PEL comparison.
- Scholze–Weinstein, Corollary 24.3.5, p. 231: The EL/PEL comparison.
- Scholze–Weinstein, Appendix to Lecture 21, after Remark 21.6.7, p. 200: The conditions on μ in (2): weights 0 and 1 on V, and c∘μ the identity in the PEL case; p. 230 refers to them as the conditions of Section 21.4.

### Hecke operators between two Newton strata

`HS3/hecke-operators-between-strata` · Construction · planet: **Hecke operators between Newton strata**

**Construction.** Let b, b′ ∈ B(G), let I be a finite set and V ∈ Rep\_Λ((Ĝ⋊Q)^I). Write i^b: Bun\_G^b → Bun\_G for the locally closed immersion, D\_lis(Bun\_G^b,Λ) ≅ D(G\_b(E),Λ) for the equivalence of FS VII.7.1, and L\_{b′} = π\_{b′♮}q\_{b′}^\*: D(G\_{b′}(E),Λ) → D\_lis(Bun\_G,Λ) for the left adjoint of i^{b′\*} (FS VII.7.2), where π\_{b′}: M\_{b′} → Bun\_G is the smooth chart and q\_{b′}: M\_{b′} → [∗/G\_{b′}(E)]. (a) Definition. Φ^{b′,b}\_V := i^{b\*} ∘ T\_V ∘ L\_{b′}: D(G\_{b′}(E),Λ) → D(G\_b(E),Λ)^{BW\_E^I}, where T\_V is the W\_E^I-equivariant Hecke operator of HS1/continuous-weil-descent. For an open pro-p subgroup K′ ⊂ G\_{b′}(E) put A^{b′}\_{K′} = L\_{b′}(c-Ind\_{K′}^{G\_{b′}(E)}Λ) = f\_{K′♮}Λ, with f\_{K′}: M\_{b′,K′} → Bun\_G the natural map, and C^{b′,b}\_{K′}(V) := Φ^{b′,b}\_V(c-Ind\_{K′}^{G\_{b′}(E)}Λ) = i^{b\*}T\_V(A^{b′}\_{K′}). (b) Φ^{b′,b}\_V commutes with all colimits and preserves compact objects; in particular C^{b′,b}\_{K′}(V) is a compact object of D(G\_b(E),Λ), with a W\_E^I-action in the condensed sense. It is functorial in V, and for K″ ⊂ K′ the map c-Ind\_{K″}^{G\_{b′}(E)}Λ → c-Ind\_{K′}^{G\_{b′}(E)}Λ induces C^{b′,b}\_{K″}(V) → C^{b′,b}\_{K′}(V). (c) Commuting actions. The Hecke algebra End\_{G\_{b′}(E)}(c-Ind\_{K′}^{G\_{b′}(E)}Λ) = Λ[K′\\G\_{b′}(E)/K′] acts on C^{b′,b}\_{K′}(V) by functoriality, commuting with G\_b(E) and W\_E^I; with C^{b′,b}\_∞(V) := Φ^{b′,b}\_V(C\_c^∞(G\_{b′}(E),Λ)), on which G\_{b′}(E) acts through right translation on C\_c^∞(G\_{b′}(E),Λ), one has C^{b′,b}\_{K′}(V) ≅ Φ^{b′,b}\_V applied to the K′-coinvariants, the three actions of G\_b(E), G\_{b′}(E) and W\_E^I commute, and C^{b′,b}\_∞(V) = colim\_{K′} C^{b′,b}\_{K′}(V) along the maps induced by inclusions c-Ind\_{K′}Λ → c-Ind\_{K″}Λ, 1\_{K′} ↦ Σ\_{k∈K′/K″} 1\_{kK″}, of right K′-invariant into right K″-invariant functions (K″ ⊂ K′). (d) The trivial stratum. For b′ = 1 the chart is the open immersion j: Bun\_G^1 = [∗/G(E)] → Bun\_G, L\_1 = j\_!, A^1\_K = j\_!c-Ind\_K^{G(E)}Λ, and C^{1,b}\_K(V) is the object T\_V(j\_!c-Ind\_K^{G(E)}Λ)|\_{Bun\_G^b} of HS3/hecke-cohomology-comparison. (e) Basic source stratum. For b′ basic, the equivalence Bun\_G ≅ Bun\_{G\_{b′}} of FS III.4.3 carries Bun\_G^{b′} to the trivial stratum of Bun\_{G\_{b′}} and commutes with Hecke operators (Ĝ\_{b′} = Ĝ); under it C^{b′,b}\_{K′}(V) for G is C^{1,b″}\_{K′}(V) for the inner form G\_{b′} (an extended pure inner form of G; over the curve it is the pure inner twist of G by E\_{b′}), where b″ = b·b′⁻¹ ∈ G\_{b′}(Ĕ) = G(Ĕ). Here the Frobenius of G\_{b′}(Ĕ) is g ↦ b′σ(g)b′⁻¹, the map x ↦ x·b′ is a bijection B(G\_{b′}) → B(G) carrying 1 to b′, and the σ-centraliser of b″ in G\_{b′} is G\_b. (f) Adjunction. For every ρ ∈ D(G\_b(E),Λ): RHom\_{G\_b(E)}(C^{b′,b}\_{K′}(V), ρ) ≅ (i^{b′\*}T\_{V^∨}Ri^b\_\*ρ)^{K′}, the derived K′-invariants; it is a perfect complex of Λ-modules when ρ is admissible. No identification of C^{b′,b}\_{K′}(V) with the relative homology of a space of framed modifications is asserted when b′ is not basic; for basic b′ it follows from (e) and HS3/hecke-cohomology-comparison. Fargues–Scholze state (d) (IX.3). In the proof of IX.7.2, which is carried out with torsion coefficients and étale sheaves, they restrict to Bun\_G^b the Hecke operator applied to a sheaf concentrated on a non-basic stratum Bun\_G^{b\_N}, that is, to the extension by zero i^{b\_N}\_!σ of a representation σ. This is a different functor from (a): the natural map L\_{b′}M → i^{b′}\_!M, adjoint to M ≅ i^{b′\*}i^{b′}\_!M, induces Φ^{b′,b}\_V(M) → i^{b\*}T\_V(i^{b′}\_!M), which is an isomorphism for basic b′ (then L\_{b′} = i^{b′}\_!) and is not asserted to be one otherwise, since L\_{b′}M can be non-zero on every stratum that specialises to b′ (these strata form the image of the chart M\_{b′}, FS V.3.7). Fargues–Scholze use L\_b itself to define the map Ψ^b\_G to the Bernstein centre of G\_b(E) (IX.7.1, p. 334). (b), (c), (e), (f) are proved in the steps.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; k is an algebraic closure of F\_q, and all v-stacks are over Perf\_k.
- ℓ≠p is a prime and Λ is a Z\_ℓ[√q]-algebra with a fixed square root √q; Λ is a discrete ring, regarded as the condensed ring Z\_ℓ⊗\_{Z\_ℓ,disc}Λ (FS VII.6). No condition on ℓ beyond ℓ≠p is imposed.
- Q is a finite quotient of W\_E through which the action of W\_E on the pinned dual group Ĝ factors. For a flat affine group scheme H over Z\_ℓ, Rep\_Λ(H) is the exact category of algebraic representations of H on finite projective Λ-modules.
- K′ ⊂ G\_{b′}(E) is an open pro-p subgroup. For a compact open subgroup that is not pro-p the object c-Ind\_{K′}^{G\_{b′}(E)}Λ need not be compact, and the compactness of C^{b′,b}\_{K′}(V) in (b) and the perfectness in (f) fail in general.
- T\_V denotes the restriction of the Hecke operator to the diagonal geometric point together with its W\_E^I-equivariance; continuity of the W\_E^I-action means equivariance for the condensed group, as in HS1/condensed-enrichment.

**Construction.**

1. (a) is a definition: i^{b′\*} has the left adjoint L\_{b′} = π\_{b′♮}q\_{b′}^\* by FS VII.7.2, T\_V takes D\_lis(Bun\_G,Λ) to D\_lis(Bun\_G,Λ)^{BW\_E^I} by HS1/continuous-weil-descent, and i^{b\*} is W\_E^I-equivariant because the W\_E^I-action is on the legs. The equality A^{b′}\_{K′} = f\_{K′♮}Λ is the description of the compact generators in FS VII.7.4 (M\_{b′,K′} = M̃\_{b′}/K′ and q\_{b′}^\*c-Ind\_{K′}Λ is the ♮-pushforward of Λ along M\_{b′,K′} → M\_{b′}). Functoriality in V: V ↦ T̃\_V is a functor to endofunctors of D\_■(Bun\_G×(Div¹)^I,Λ) (HS1/monoidality-of-hecke-operators (b)), and a morphism between objects pulled back from Bun\_G×[∗/W\_E^I] is a morphism of W\_E^I-equivariant objects, because that pullback is fully faithful (FS VII.2.8, as in HS1/continuous-weil-descent); so a morphism V → V′ induces a W\_E^I-equivariant natural transformation T\_V → T\_{V′}.
2. (b): L\_{b′} is a left adjoint, so it commutes with colimits, and it preserves compact objects because its right adjoint i^{b′\*} commutes with colimits (FS VII.7.4, proof). T\_V commutes with colimits and preserves compact objects (HS1/properties-and-weil-equivariance, FS IX.2.2). i^{b\*} commutes with colimits and sends compact objects to compact objects by the characterisation of compact objects in FS VII.7.4 (finite support and compact stalks). The object c-Ind\_{K′}^{G\_{b′}(E)}Λ is compact for K′ pro-p because RHom(c-Ind\_{K′}Λ, −) is the functor of K′-invariants, which is exact and commutes with direct sums as p is invertible in Λ.
3. (c): Functoriality of Φ^{b′,b}\_V in its argument gives the action of End(c-Ind\_{K′}Λ); it commutes with G\_b(E) and W\_E^I because Φ^{b′,b}\_V takes values in D(G\_b(E),Λ)^{BW\_E^I}. The regular representation C\_c^∞(G\_{b′}(E),Λ), with G\_{b′}(E) acting by left translation, is the union of its subrepresentations c-Ind\_{K′}^{G\_{b′}(E)}Λ of right K′-invariant functions, a filtered colimit over open pro-p K′; right translation commutes with left translation, and its K′-coinvariants are c-Ind\_{K′}Λ (coinvariants and invariants agree for pro-p K′ since p is invertible in Λ). Φ^{b′,b}\_V commutes with colimits.
4. (d): for basic b′ the stratum Bun\_G^{b′} ≅ [∗/G\_{b′}(E)] is open in Bun\_G (FS III.4.5), the chart is M\_{b′} = Bun\_G^{b′} with π\_{b′} the open immersion, and π\_{b′♮} is extension by zero. For b′ = 1 this gives the object of FS IX.3.1 and IX.3.2.
5. (e): FS III.4.3 gives Bun\_G ≅ Bun\_{G\_{b′}} for basic b′, E ↦ Isom(E, E\_{b′}). It sends E\_b to the G\_{b′}-bundle of class b″ = b·b′⁻¹: on the underlying trivial torsors over Ĕ the Frobenius of Isom(E\_{b′},E\_b) is h ↦ b·σ(h)·b′⁻¹ = b″·(b′σ(h)b′⁻¹), and g ∈ G(Ĕ) satisfies b″·b′σ(g)b′⁻¹ = g·b″ exactly when bσ(g) = gb; for b = 1 this is the class b′⁻¹, as in HS0/structure-group-and-inner-form, where the trivial bundle goes to the bundle of the inverse class. Here Isom(E\_{b′},E\_b) is Isom(E\_b,E\_{b′}) with the action of G\_{b′} inverted. The equivalence identifies the Hecke stacks with their bounds (HS0/structure-group-and-inner-form, part on inner forms) and hence the kernels and operators T\_V, the dual groups of G and G\_{b′} being identified. Fargues–Scholze use this equivariance in the proof of IX.7.2.
6. (f): by the adjunctions L\_{b′} ⊣ i^{b′\*}, T\_V ⊣ T\_{V^∨} (HS1/properties-and-weil-equivariance) and i^{b\*} ⊣ Ri^b\_\*, RHom(i^{b\*}T\_VL\_{b′}(c-Ind\_{K′}Λ), ρ) ≅ RHom(c-Ind\_{K′}Λ, i^{b′\*}T\_{V^∨}Ri^b\_\*ρ) = (i^{b′\*}T\_{V^∨}Ri^b\_\*ρ)^{K′}. Perfectness for admissible ρ follows from (b): RHom from c-Ind\_KΛ, K ⊂ G\_b(E) open pro-p, into ρ is ρ^K, which is perfect, and compact objects of D(G\_b(E),Λ) are generated by these under finite colimits, shifts and retracts.

**API.**

- `heckeBetweenStrata` (constructor): The functor Φ^{b′,b}\_V = i^{b\*}∘T\_V∘π\_{b′♮}q\_{b′}^\*: D(G\_{b′}(E),Λ) → D(G\_b(E),Λ)^{BW\_E^I}.
- `heckeBetweenStrata.atLevel` (constructor): C^{b′,b}\_{K′}(V) = Φ^{b′,b}\_V(c-Ind\_{K′}^{G\_{b′}(E)}Λ) for K′ ⊂ G\_{b′}(E) open pro-p.
- `heckeBetweenStrata.map` (functoriality): A morphism V → V′ of representations induces a natural transformation Φ^{b′,b}\_V → Φ^{b′,b}\_{V′}, compatibly with identities and composition.
- `heckeBetweenStrata.preservesColimits` (structure): Φ^{b′,b}\_V commutes with all colimits.
- `heckeBetweenStrata.compact` (characterisation): Φ^{b′,b}\_V sends compact objects to compact objects; C^{b′,b}\_{K′}(V) is compact in D(G\_b(E),Λ) for K′ open pro-p.
- `heckeBetweenStrata.unit` (simp): For I = ∅ and V = 1: Φ^{b,b}\_1 ≅ id, and Φ^{b′,b}\_1 = i^{b\*}π\_{b′♮}q\_{b′}^\*.
- `heckeBetweenStrata.comp_trivial` (compatibility): For b′ = 1: Φ^{1,b}\_V(M) = i^{b\*}T\_V(j\_!M), and C^{1,b}\_K(V) is the object T\_V(j\_!c-Ind\_K^{G(E)}Λ)|\_{Bun\_G^b} of HS3/hecke-cohomology-comparison.
- `heckeBetweenStrata.basicTwist` (compatibility): For b′ basic, under Bun\_G ≅ Bun\_{G\_{b′}}: Φ^{b′,b}\_V for G is Φ^{1,b″}\_V for G\_{b′}, b″ = b·b′⁻¹ ∈ G\_{b′}(Ĕ) = G(Ĕ) the class of the image of E\_b, with (G\_{b′})\_{b″} = G\_b.
- `heckeBetweenStrata.homAdjunction` (relation): RHom\_{G\_b(E)}(Φ^{b′,b}\_V(M), ρ) ≅ RHom\_{G\_{b′}(E)}(M, i^{b′\*}T\_{V^∨}Ri^b\_\*ρ), naturally in M and ρ; for M = c-Ind\_{K′}Λ the right side is the derived K′-invariants.
- `heckeBetweenStrata.heckeAlgebraAction` (structure): Λ[K′\\G\_{b′}(E)/K′] acts on C^{b′,b}\_{K′}(V), commuting with G\_b(E) and W\_E^I.
- `heckeBetweenStrata.tower` (data): C^{b′,b}\_∞(V) = Φ^{b′,b}\_V(C\_c^∞(G\_{b′}(E),Λ)) with commuting actions of G\_b(E), G\_{b′}(E) and W\_E^I; it is the colimit of the C^{b′,b}\_{K′}(V) over open pro-p K′.

**Unit tests.**

- `heckeBetweenStrata.torus_unit_test` (degenerate): For G = G\_m, I = ∅, V = 1 and K′ ⊂ E^× open pro-p: C^{b′,b}\_{K′}(1) ≅ c-Ind\_{K′}^{E^×}Λ if b = b′ in B(G\_m) = Z, and C^{b′,b}\_{K′}(1) = 0 if b ≠ b′. Here G\_b(E) = E^× ⊂ Ĕ^× for every representative b ∈ Ĕ^×, because Ĕ^× is commutative, and D(G\_b(E),Λ) is identified with D(E^×,Λ) through this equality; two representatives of one class give the same identification.
- `heckeBetweenStrata.torus_shift_test` (computation): For G = G\_m, I = {∗} and V the character z ↦ z^n of Ĝ = G\_m, the object C^{b′,b}\_{K′}(V) is non-zero for exactly one class b ∈ B(G\_m), namely the one with κ(b) = κ(b′) − n (κ(b) = v\_π(b), so that E\_b = O(−κ(b))); for n = 1 and E\_{b′} = O(−1) this is the trivial class, in agreement with FS IX.7.4, where T\_std takes a sheaf on the stratum of O(−1/n) to Bun\_G^1. Its underlying object is c-Ind\_{K′}^{E^×}Λ, under the equalities G\_b(E) = E^× = G\_{b′}(E).
- `heckeBetweenStrata.trivial_stratum_test` (compatibility): For G = GL\_2 over Q\_p, b′ = 1, V = std, K = 1 + p^m M\_2(Z\_p) with m ≥ 1, and b the class with E\_b = O(1/2): C^{1,b}\_K(std) ≅ RΓ\_c(M\_{LT,K,C},Λ)[1\](1/2), the shifted compactly supported cohomology of the Lubin–Tate tower of height 2 at level K, as a complex of smooth representations of D^× (D the quaternion division algebra over Q\_p) with W\_{Q\_p}-action.
- `heckeBetweenStrata.not_pro_p_test` (non-example): For G = G\_m over Q\_p with p odd, ℓ a prime dividing p − 1, Λ = F\_ℓ, b = b′ = 1, V = 1 and the compact open subgroup K′ = Z\_p^×, which is not pro-p: i^{1\*}L\_1(c-Ind\_{Z\_p^×}^{Q\_p^×}F\_ℓ) = c-Ind\_{Z\_p^×}^{Q\_p^×}F\_ℓ is not compact in D(Q\_p^×,F\_ℓ), because Ext^n(c-Ind\_{Z\_p^×}^{Q\_p^×}F\_ℓ, F\_ℓ) = H^n(F\_p^×, F\_ℓ) ≠ 0 for all n ≥ 0.

**Uses.**

- Fargues–Scholze IX.3.1 and IX.3.2, pp. 324–327: the case b′ = 1: the cohomology of local shtuka spaces is C^{1,b}\_K(V)
- Fargues–Scholze, proof of Theorem IX.7.2, pp. 335–336: T\_V applied to the extension by zero of a representation from one non-basic stratum is restricted to another stratum to compare excursion operators; that object receives the natural map from Φ^{b\_N,b}\_V(σ)
- HeckeStacksAndLocalShtukas:HS4/levi-compatibility: the constant-term computation concerns i^{b\_N\*}T\_V(i^{b\_N}\_!σ) on one stratum, the target of the natural map from Φ^{b\_N,b\_N}\_V(σ)
- ExcursionOperatorsAndSpectralAction:ES7:parabolic: compatibility of L-parameters with the strata of Bun\_G uses the Hecke operators between strata

**Acceptance.**

- For G = G\_m every stratum is open and closed, L\_{b′} is extension by zero from a component, and C^{b′,b}\_{K′}(1) is c-Ind\_{K′}^{E^×}Λ for b = b′ and 0 otherwise.
- For b′ = 1, I = {∗}, G over Q\_p, μ minuscule and defined over Q\_p, V of highest weight μ and b ∈ B(G,μ⁻¹), C^{1,b}\_K(V) is the complex of FS IX.3.1, RΓ\_c(M\_{(G,b,μ),K,C},Λ)[d\](d/2) with d = ⟨2ρ,μ⟩.
- In the proof of FS IX.7.2 the object T\_V(A\_N)|\_{Bun\_G^b}, with A\_N = i^{b\_N}\_!σ concentrated on Bun\_G^{b\_N} and σ a representation of G\_{b\_N}(E) = G\_b(E), is i^{b\*}T\_V(i^{b\_N}\_!σ); it is the target of the natural map from Φ^{b\_N,b}\_V(σ) induced by L\_{b\_N}σ → i^{b\_N}\_!σ, and the two agree when the source stratum is basic. For G = G\_m every stratum is basic and the two functors coincide.

**Prerequisites.**

- In this roadmap: `HS1/continuous-weil-descent`, `HS1/properties-and-weil-equivariance`, `HS1/hecke-operator-via-relative-homology`, `HS0/structure-group-and-inner-form`, `HS3/hecke-cohomology-comparison`, `HS1/monoidality-of-hecke-operators`.
- In other roadmaps: `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`, `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`, `BunGAndNewtonStrata:BG0/pure-inner-twisting`, `BunGAndNewtonStrata:BG0/basic-inner-form-bundle-equivalence`, `BunGAndNewtonStrata:BG3/semistable-locus-and-basic-strata`, `BunGAndNewtonStrata:BG4/filtered-bundle-chart`, `VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint`, `VStackSheavesAndLisseCategories:VS3/lisse-adjoints-and-operations`.

**Sources.**

- Fargues–Scholze, Proposition VII.7.2, p. 272: The left adjoint π\_{b♮}q\_b^\* of i^{b\*}, used to define Φ^{b′,b}\_V; the unit of the adjunction is an equivalence.
- Fargues–Scholze, Proposition VII.7.4, p. 273: Compact objects have compact stalks, so i^{b\*} preserves compact objects; the same proposition gives the compact generators A^b\_K = f\_{K♮}Λ.
- Fargues–Scholze, Proof of Theorem IX.3.1, p. 324: The case b′ = 1 of (b), for A = j\_!c-Ind\_K^{G(Q\_p)}Z\_ℓ.
- Fargues–Scholze, Proof of Theorem IX.7.2, p. 335: Part (e): the inner-form equivalence commutes with Hecke operators. The same proof restricts T\_V(A\_N), A\_N on Bun\_G^{b\_N}, to Bun\_G^b: a Hecke operator between two non-trivial strata. Parts (b), (c), (f) for general b′ are not stated in the source and are proved in the steps.

## HS4. Reusable compatibility library

This layer packages the Hecke action in the form that excursion operators consume and proves the geometric comparisons behind the functoriality of L-parameters. For every finite set I the operators form an exact monoidal functor from Rep\_Λ((Ĝ⋊Q)^I) to the W\_E^I-equivariant endofunctors of the compact objects of D\_lis(Bun\_G,Λ), and these functors are natural in I (Fargues–Scholze IX.2.4, IX.0.1): permutation of legs, fusion along surjections, insertion of trivial legs and iterated modifications are its special cases. Applying it to the coevaluation and evaluation of a dual pair gives the creation and annihilation maps, which satisfy the triangle identities and are equivariant for the diagonal Weil group only; with maps equivariant for the diagonal copy of Ĝ they are the two outer arrows of an excursion operator.

The four comparison nodes state, for kernels and operators, what the proofs of Fargues–Scholze IX.6.1–IX.6.3 and IX.7.2 use: pullback along a map of groups that induces an isomorphism of adjoint groups intertwines the Hecke operators with restriction of representations; for a product the operators of exterior tensor products are exterior products; for a Weil restriction the operator of an induced representation is induced; and, for torsion coefficients, on a sufficiently unstable stratum the operator of G is computed by an operator of the Levi subgroup whose kernel is a constant term of the Satake sheaf, with the shift and the unramified twist made explicit. The last node lists the properties of the family (I, V) ↦ T\_V(A), for a compact A, from which the layer on excursion operators proves that an open subgroup of wild inertia acts trivially.

The layer is checked on G\_m (the creation and annihilation maps are isomorphisms, and the two-leg excursion operator of the standard character acts on a character χ of E^× through the reciprocity map), on the standard representation for GL\_n (annihilation after creation is multiplication by n), on GL\_n → PGL\_n and G\_m → 1, on a quadratic Weil restriction of G\_m, and on the constant term of the standard representation of GL\_2 along the Borel subgroup.

**Planets.** Hecke action functorial in finite sets (`HS4/monoidal-and-finite-set-functoriality`); Dual-leg creation and annihilation (`HS4/creation-annihilation-and-triangles`).

**Dependencies.** Earlier layers of this roadmap: HS1, HS0. Layers of other roadmaps cited by the nodes: `BunGAndNewtonStrata:BG2:uniformization`, `BunGAndNewtonStrata:BG3`, `DiamondSixOperations:S2`, `EnhancedDerivedSheaves:E5:abstract`, `GeometricSatakeAndFusion:GS3:fusion`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `RelativeFarguesFontaine:RF4:G-torsors`, `VStackSheavesAndLisseCategories:VS0`, `VStackSheavesAndLisseCategories:VS1`, `VStackSheavesAndLisseCategories:VS2`, `VStackSheavesAndLisseCategories:VS5`.

**Coverage.** Status `planned`. Target-level plan with 7 nodes; every target of the stage text is a node. The stage is not closed: it has open requests. Remaining:

- Statements requested from supplier stages that have no node for them yet: BunGAndNewtonStrata:BG2:uniformization, BunGAndNewtonStrata:BG3, GeometricSatakeAndFusion:GS4:integral-dual-group, VStackSheavesAndLisseCategories:VS0.
- Lemma-level refinement of the target-level nodes of this stage.

### Coherent finite-set Hecke family

`HS4/monoidal-and-finite-set-functoriality` · Theorem · planet: **Hecke action functorial in finite sets**

**Theorem.** For every finite set I the Hecke operators give an exact Rep\_Λ(Q^I)-linear monoidal functor T^I: Rep\_Λ((Ĝ⋊Q)^I) → End\_Λ(D\_lis(Bun\_G,Λ)^ω)^{BW\_E^I}, V ↦ T\_V (FS Corollary IX.2.4, Theorem IX.0.1(ii)). Here D\_lis(Bun\_G,Λ)^ω carries the relatively discrete condensed structure; the target consists of the W\_E^I-equivariant objects of the condensed ∞-category End\_Λ(D\_lis(Bun\_G,Λ)^ω), equipped with the trivial W\_E^I-action, so an object is an endofunctor F with a map of condensed groups W\_E^I → Aut(F); its monoidal structure is composition, so T\_1 ≅ id and T\_{V⊗V′} ≅ T\_V∘T\_{V′}, with W\_E^I acting on the composite through both factors.

The functors T^I are functorial in I (IX.0.1(iii)). For a map a: I → J of finite sets let a\_\*: Rep\_Λ((Ĝ⋊Q)^I) → Rep\_Λ((Ĝ⋊Q)^J) be restriction along (Ĝ⋊Q)^J → (Ĝ⋊Q)^I, (g\_j) ↦ (g\_{a(i)})\_i, and let a\_\* on the targets be restriction of the equivariant structure along W\_E^J → W\_E^I, (w\_j) ↦ (w\_{a(i)})\_i. There are monoidal isomorphisms T^J∘a\_\* ≅ a\_\*∘T^I, compatible with identities and composition with all higher coherences: I ↦ Rep\_Λ((Ĝ⋊Q)^I) and I ↦ End\_Λ(D\_lis(Bun\_G,Λ)^ω)^{BW\_E^I} are coCartesian fibrations over the category of finite sets, and the T^I lift to a functor between the total spaces. The lift is read as a morphism of coCartesian fibrations, that is, a natural transformation of functors from finite sets to monoidal ∞-categories; the source says only that the functors lift to the total spaces.

Special cases, all consequences of this functoriality and of monoidality. (1) Permutation: for a bijection σ of I, T\_{σ\_\*V} is T\_V with the W\_E^I-action permuted by σ. (2) Fusion: for a surjection a, T\_{a\_\*V} is T\_V with W\_E^J acting through W\_E^J → W\_E^I; for I = {1,2} → {∗} and V\_1, V\_2 ∈ Rep\_Λ(Ĝ⋊Q), T\_{V\_1⊗V\_2} is T\_{V\_1⊠V\_2} with W\_E acting through the diagonal of W\_E². (3) Unit insertion: for an injection a, the factors of W\_E^J indexed by J∖a(I) act trivially on T\_{a\_\*V}; for I = ∅ the functor T^∅ sends Λ to the identity functor. (4) Iterated modifications: for V\_1 ∈ Rep\_Λ((Ĝ⋊Q)^{I\_1}) and V\_2 ∈ Rep\_Λ((Ĝ⋊Q)^{I\_2}) there are W\_E^{I\_1⊔I\_2}-equivariant isomorphisms T\_{V\_1⊠V\_2} ≅ T\_{V\_1}∘T\_{V\_2} ≅ T\_{V\_2}∘T\_{V\_1}, in which W\_E^{I\_1} acts through T\_{V\_1} and W\_E^{I\_2} through T\_{V\_2}. The source states (1)–(4) only as functoriality in I; it uses (4) in the proof of IX.5.1.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; Bun\_G is the stack of G-bundles on the Fargues–Fontaine curve on Perf\_k, for k an algebraic closure of F\_q.
- ℓ ≠ p is a prime, Λ is a Z\_ℓ[√q]-algebra (a square root of q is fixed), and Q is a finite quotient of W\_E through which the action of W\_E on the dual group Ĝ over Z\_ℓ factors. Rep\_Λ((Ĝ⋊Q)^I) is the exact category of representations on finite projective Λ-modules. No condition on ℓ beyond ℓ ≠ p is imposed.

**Proof outline.**

1. Kernels. HeckeStacksAndLocalShtukas:HS1/satake-kernel-and-solid-monoidal-functor gives exact Rep\_Λ(Q^I)-linear monoidal functors V ↦ S′\_V from Rep\_Λ((Ĝ⋊Q)^I) to D\_■(Hck^I\_G,Λ) with the convolution of FS VII.5, functorially in I (FS IX.2, p. 321). The finite-set maps on the Satake side are those of FS VI.9, pp. 226–229 (GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms): for every map I → J, not only surjections, with fibre functors intertwined by restriction along W\_E^J → W\_E^I; the passage to D\_■ and to coefficients Λ is GeometricSatakeAndFusion:GS4:integral-dual-group/enhanced-perfect-satake-extension.
2. Action. Kernels act by T\_V(A) = p\_{2♮}(p\_1\*A ⊗^■ S′\_V) (HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology), and D\_■(Hck^I\_G,Λ) → End\_{D\_■((Div¹)^I,Λ)}(D\_■(Bun\_G×(Div¹)^I,Λ)) is exact, Rep\_Λ(Q^I)-linear and monoidal: convolution of kernels along the chains of HeckeStacksAndLocalShtukas:HS0/chains-and-composition becomes composition of functors by base change and the projection formula for ♮-pushforward (HeckeStacksAndLocalShtukas:HS1/monoidality-of-hecke-operators, parts (a) and (b); FS p. 321). There the kernel K⋆K′ gives the functor of K followed by that of K′, so that T\_{V⊗V′} ≅ T\_{V′}∘T\_V; composed with the symmetry V⊗V′ ≅ V′⊗V of the representation category this is the constraint T\_{V⊗V′} ≅ T\_V∘T\_{V′} of the statement, for which V ↦ T\_V is monoidal with respect to composition (F,F′) ↦ F∘F′.
3. Target. T\_V preserves D\_lis and compact objects (HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance; FS IX.2.1, IX.2.2) and takes values in the full subcategory D\_lis(Bun\_G,Λ)^{BW\_E^I} of D\_■(Bun\_G×(Div¹)^I,Λ) (HeckeStacksAndLocalShtukas:HS1/continuous-weil-descent; FS IX.1.1, IX.2.3). With the relatively discrete condensed structure on compact objects (HeckeStacksAndLocalShtukas:HS1/condensed-enrichment; FS IX.1.2) this is the functor of IX.2.4.
4. Functoriality in I. Pullback along Bun\_G×(Div¹)^J → Bun\_G×(Div¹)^I corresponds, under the full faithfulness of IX.1.1, to restriction of equivariance along W\_E^J → W\_E^I and intertwines the finite-set maps of kernels of the first step (HeckeStacksAndLocalShtukas:HS1/monoidality-of-hecke-operators, part (c)); the coherent form is a morphism of coCartesian fibrations in the formalism of EnhancedDerivedSheaves:E5:abstract.
5. Special cases. (1), (2), (3) are the cases a bijective, surjective, injective. For (4) let p\_k: I\_k → I\_1⊔I\_2 be the inclusions; V\_1⊠V\_2 = p\_{1\*}V\_1 ⊗ p\_{2\*}V\_2, so monoidality for I\_1⊔I\_2 and functoriality for p\_1, p\_2 give T\_{V\_1⊠V\_2} ≅ T\_{V\_1}∘T\_{V\_2}; applying T to the symmetry p\_{1\*}V\_1 ⊗ p\_{2\*}V\_2 ≅ p\_{2\*}V\_2 ⊗ p\_{1\*}V\_1 of the representation category gives the other order.

**Acceptance.**

- For I = {1,2} and the transposition σ: T\_{V\_2⊠V\_1} is T\_{V\_1⊠V\_2} with the two factors of W\_E² exchanged, and the comparison applied twice is the identity of T\_{V\_1⊠V\_2}.
- For a: {1,2} → {∗} and V\_1, V\_2 ∈ Rep\_Λ(Ĝ⋊Q): the W\_E-action on T\_{V\_1⊗V\_2} ≅ T\_{V\_1}∘T\_{V\_2} is the restriction to the diagonal of the W\_E²-action on T\_{V\_1⊠V\_2}.
- For a: ∅ → {∗}: T\_1 ≅ id with the trivial W\_E-action.
- For composable maps a: I → J and b: J → K the comparison for b∘a is the composite of the comparisons for a and for b.
- For G = G\_m and χ\_n the n-th power character of Ĝ = G\_m: T\_{χ\_n} carries the factor of D\_lis(Bun\_{G\_m},Λ) = ∏\_{d∈Z} D(E^×,Λ) indexed by the degree d of the line bundles into the factor indexed by d+n, since T\_{χ\_n}(A)(L,D) = A(L(−nD)) (HS1/hecke-operator-via-relative-homology), and T\_{χ\_n}∘T\_{χ\_m} ≅ T\_{χ\_{n+m}}, T\_{χ\_1}∘T\_{χ\_{−1}} ≅ id.

**Prerequisites.**

- In this roadmap: `HS1/continuous-weil-descent`, `HS0/chains-and-composition`, `HS1/properties-and-weil-equivariance`, `HS1/condensed-enrichment`, `HS1/satake-kernel-and-solid-monoidal-functor`, `HS1/hecke-operator-via-relative-homology`, `HS1/monoidality-of-hecke-operators`.
- In other roadmaps: `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `GeometricSatakeAndFusion:GS4:integral-dual-group/enhanced-perfect-satake-extension`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E5:abstract/monoidal-categories-over-an-operad`.

**Sources.**

- Fargues–Scholze, Corollary IX.2.4, p. 323: The functor itself: exact, Rep\_Λ(Q^I)-linear, monoidal, with target End\_Λ(D\_lis(Bun\_G,Λ)^ω)^{BW\_E^I}, functorial in I.
- Fargues–Scholze, Theorem IX.0.1(ii), p. 318: Summary statement; the next lines describe the target as W\_E^I-equivariant objects of the condensed ∞-category of endofunctors, on which W\_E^I is taken to act trivially.
- Fargues–Scholze, Theorem IX.0.1(iii) and the paragraph after it, p. 318: Functoriality in I.
- Fargues–Scholze, paragraph after Theorem IX.0.1, p. 318: The coherent form of functoriality in I; the sentence does not say that coCartesian edges are preserved, nor which maps of finite sets act how.
- Fargues–Scholze, Section VI.9, p. 226: Finite-set maps of the Satake categories for arbitrary maps, which gives unit insertion at legs outside the image.
- Fargues–Scholze, Section VI.9, p. 227: Fibre functors intertwine the finite-set maps with restriction along W\_E^J → W\_E^I.
- Fargues–Scholze, Proposition IX.5.1, proof, p. 328: The source's use of case (4): T\_{V⊠W} ≅ T\_V∘T\_W ≅ T\_W∘T\_V equivariantly for W\_E^{I⊔I}.

### Dual-leg creation and annihilation

`HS4/creation-annihilation-and-triangles` · Construction · planet: **Dual-leg creation and annihilation**

**Construction.** Let V ∈ Rep\_Λ(Ĝ⋊Q), let V^∨ = Hom\_Λ(V,Λ) be the dual representation, and let coev: 1 → V⊗V^∨ and ev: V^∨⊗V → 1 be the coevaluation and evaluation; these are maps in Rep\_Λ(Ĝ⋊Q) and satisfy the two triangle identities. Applying the monoidal functor T = T^{∗} of HS4/monoidal-and-finite-set-functoriality gives natural transformations create\_V := T\_coev: id ≅ T\_1 → T\_{V⊗V^∨} ≅ T\_V∘T\_{V^∨} and annihilate\_V := T\_ev: T\_{V^∨}∘T\_V ≅ T\_{V^∨⊗V} → T\_1 ≅ id. They are morphisms of End\_Λ(D\_lis(Bun\_G,Λ)^ω)^{BW\_E}, that is, W\_E-equivariant for the trivial action on id. They satisfy the triangle identities: the composites T\_V ≅ id∘T\_V → T\_V∘T\_{V^∨}∘T\_V → T\_V∘id ≅ T\_V and T\_{V^∨} ≅ T\_{V^∨}∘id → T\_{V^∨}∘T\_V∘T\_{V^∨} → id∘T\_{V^∨} ≅ T\_{V^∨} (create, then annihilate, with the associativity and unit constraints of T) are identities. Hence create\_V and annihilate\_V are the unit and counit of an adjunction T\_{V^∨} ⊣ T\_V, and the same construction for V^∨, with V^{∨∨} ≅ V, gives T\_V ⊣ T\_{V^∨}.

Two-leg form. By the fusion case {1,2} → {∗} of HS4/monoidal-and-finite-set-functoriality, the underlying endofunctor of T\_{V⊗V^∨} is that of T\_{V⊠V^∨}, and its W\_E-action is the restriction of the W\_E²-action to the diagonal. So create\_V is a map id → T\_{V⊠V^∨} of underlying endofunctors with (γ,γ)∘create\_V = create\_V for all γ ∈ W\_E. Invariance under (γ\_1,γ\_2) with γ\_1 ≠ γ\_2 does not follow, and it fails for G = G\_m (FS IX.6.5). Let s: V⊗V^∨ ≅ V^∨⊗V be the symmetry of Rep\_Λ(Ĝ⋊Q) and annihilate′\_V := T\_{ev∘s}: T\_{V⊠V^∨} → id; then annihilate′\_V∘(γ,γ) = annihilate′\_V. For γ\_1, γ\_2 ∈ W\_E the endomorphism annihilate′\_V∘(γ\_1,γ\_2)∘create\_V of the identity functor depends only on γ\_1γ\_2^{-1}, and for γ\_1 = γ\_2 it is multiplication by rank\_Λ(V), the trace of id\_V in Λ.

General form, used by excursion operators (FS Definition VIII.4.2 and IX.4.1). For a finite set I, V ∈ Rep\_Λ((Ĝ⋊Q)^I), and maps α: 1 → V|\_Ĝ and β: V|\_Ĝ → 1 of representations of the diagonal copy Ĝ ⊂ (Ĝ⋊Q)^I, the monoidal functor Rep\_Λ(Ĝ) → End\_Λ(D\_lis(Bun\_G,Λ)) underlying the Hecke action at a geometric point of the diagonal of (Div¹)^I gives natural transformations T\_α: id → T\_V and T\_β: T\_V → id of underlying endofunctors; they carry no Weil equivariance. If g: V → V′ is a map in Rep\_Λ((Ĝ⋊Q)^I), then T\_g∘T\_α = T\_{g∘α} and T\_{β′}∘T\_g = T\_{β′∘g}. The pair (create\_V, annihilate′\_V) is the case I = {1,2}, V⊠V^∨, α = coev, β = ev∘s.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; Bun\_G is the stack of G-bundles on the Fargues–Fontaine curve on Perf\_k, for k an algebraic closure of F\_q.
- ℓ ≠ p is a prime, Λ is a Z\_ℓ[√q]-algebra (a square root of q is fixed), and Q is a finite quotient of W\_E through which the action of W\_E on the dual group Ĝ over Z\_ℓ factors. Rep\_Λ((Ĝ⋊Q)^I) is the exact category of representations on finite projective Λ-modules. No condition on ℓ beyond ℓ ≠ p is imposed.

**Construction.**

1. Rep\_Λ(Ĝ⋊Q) is rigid: coev and ev are equivariant maps of finite projective Λ-modules and satisfy the triangle identities (exact pairings of V and V^∨ in both orders, in the sense of mathlib:CategoryTheory.ExactPairing). On the Satake side the dual of S\_V is sw\*D(S\_V) (GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality), which corresponds to V^∨.
2. A monoidal functor carries an exact pairing to an exact pairing: apply the functor to the two triangle equations and insert its tensor and unit constraints (mathlib:CategoryTheory.Functor.Monoidal). Apply this to T^{∗} of HS4/monoidal-and-finite-set-functoriality, whose target has W\_E-equivariant natural transformations as morphisms. This is the argument of FS IX.2.2, proof: T\_V has a left and a right adjoint, given by T\_{V^∨}.
3. Two-leg form. The fusion case identifies T\_{V⊗V^∨} with T\_{V⊠V^∨} restricted to the diagonal, so W\_E-equivariance of create\_V reads (γ,γ)∘create\_V = create\_V, and likewise for annihilate′\_V. Writing (γ\_1,γ\_2) = (γ\_1γ\_2^{-1},1)·(γ\_2,γ\_2) gives the dependence on γ\_1γ\_2^{-1}. For γ\_1 = γ\_2 the composite is T applied to ev∘s∘coev = rank\_Λ(V)·id\_1, and T is Λ-linear.
4. General form. At a geometric point of the diagonal the action of kernels factors through Rep\_Λ(Ĝ^I) and preserves D\_lis (HS1/hecke-operator-via-relative-homology; FS p. 322 and IX.2.1); restricting to the diagonal Ĝ and applying the functor to α, β and g gives T\_α, T\_β and the two naturality identities (FS p. 291).
5. Failure of W\_E²-invariance for G\_m: by FS IX.6.5 the endomorphism annihilate′∘(γ\_1,γ\_2)∘create for the standard character acts on a smooth character χ of E^× by χ(rec(γ\_1γ\_2^{-1})); if create were W\_E²-invariant this would be 1 for all γ\_1, γ\_2.
6. Coefficient change Λ → Λ′ commutes with all of the above by HS1/coefficient-base-change, since base change of representations preserves coev and ev.

**API.**

- `createDualLegs` (constructor): For V ∈ Rep\_Λ(Ĝ⋊Q): the W\_E-equivariant natural transformation create\_V = T\_coev: id ≅ T\_1 → T\_{V⊗V^∨} ≅ T\_V∘T\_{V^∨}.
- `annihilateDualLegs` (constructor): For V ∈ Rep\_Λ(Ĝ⋊Q): the W\_E-equivariant natural transformation annihilate\_V = T\_ev: T\_{V^∨}∘T\_V ≅ T\_{V^∨⊗V} → T\_1 ≅ id.
- `dualLegs.annihilateSwapped` (constructor): annihilate′\_V = T\_{ev∘s}: T\_V∘T\_{V^∨} → id, where s: V⊗V^∨ ≅ V^∨⊗V is the symmetry of Rep\_Λ(Ĝ⋊Q); it is the map β: V⊗V^∨ → 1, v⊗f ↦ f(v), of FS IX.6.5.
- `dualLegs.leftTriangle` (relation): The composite T\_V ≅ id∘T\_V → (T\_V∘T\_{V^∨})∘T\_V ≅ T\_V∘(T\_{V^∨}∘T\_V) → T\_V∘id ≅ T\_V, given by create\_V and then annihilate\_V, is the identity.
- `dualLegs.rightTriangle` (relation): The composite T\_{V^∨} ≅ T\_{V^∨}∘id → T\_{V^∨}∘(T\_V∘T\_{V^∨}) ≅ (T\_{V^∨}∘T\_V)∘T\_{V^∨} → id∘T\_{V^∨} ≅ T\_{V^∨}, given by create\_V and then annihilate\_V, is the identity.
- `dualLegs.adjunction` (characterisation): create\_V and annihilate\_V are the unit and counit of an adjunction T\_{V^∨} ⊣ T\_V in W\_E-equivariant endofunctors; with V^∨ in place of V and V^{∨∨} ≅ V one gets T\_V ⊣ T\_{V^∨}. So T\_{V^∨} is both left and right adjoint to T\_V.
- `dualLegs.diagonal_equivariant` (compatibility): Under the fusion identification of T\_{V⊗V^∨} with T\_{V⊠V^∨} restricted to the diagonal of W\_E²: (γ,γ)∘create\_V = create\_V and annihilate′\_V∘(γ,γ) = annihilate′\_V for every γ ∈ W\_E.
- `dualLegs.trace` (simp): annihilate′\_V∘create\_V = rank\_Λ(V)·id, an endomorphism of the identity functor; rank\_Λ(V) ∈ Λ is the trace of id\_V.
- `dualLegs.excursion_quotient` (relation): For γ\_1, γ\_2 ∈ W\_E: annihilate′\_V∘(γ\_1,γ\_2)∘create\_V = annihilate′\_V∘(γ\_1γ\_2^{-1},1)∘create\_V.
- `dualLegs.createAlong` (constructor): For a finite set I, V ∈ Rep\_Λ((Ĝ⋊Q)^I) and α: 1 → V|\_Ĝ equivariant for the diagonal Ĝ: the natural transformation T\_α: id → T\_V of underlying endofunctors of D\_lis(Bun\_G,Λ).
- `dualLegs.annihilateAlong` (constructor): For a finite set I, V ∈ Rep\_Λ((Ĝ⋊Q)^I) and β: V|\_Ĝ → 1 equivariant for the diagonal Ĝ: the natural transformation T\_β: T\_V → id of underlying endofunctors.
- `dualLegs.along_naturality` (functoriality): For g: V → V′ in Rep\_Λ((Ĝ⋊Q)^I): T\_g∘T\_α = T\_{g∘α} and T\_{β′}∘T\_g = T\_{β′∘g}; T\_g commutes with the action of W\_E^I. Hence T\_β∘(γ\_i)∘T\_α is unchanged when (V,α,β) is replaced by (V′, g∘α, β′) with β = β′∘g.
- `dualLegs.along_dual_pair` (compatibility): For I = {1,2}, the representation V⊠V^∨, α = coev and β = ev∘s: T\_α = create\_V and T\_β = annihilate′\_V.
- `dualLegs.unit` (example): For V = 1, create\_1 and annihilate\_1 are the unit constraints id ≅ id∘id of the monoidal functor T.
- `dualLegs.map_coefficients` (compatibility): For a map Λ → Λ′ of Z\_ℓ[√q]-algebras, coefficient extension carries create\_V and annihilate\_V to create and annihilate of V⊗\_ΛΛ′.

**Unit tests.**

- `dualLegs.rank_test` (computation): For G = GL\_n, Q = 1 and V the standard representation of Ĝ = GL\_n over Λ: annihilate′\_V∘create\_V is multiplication by n on the identity functor of D\_lis(Bun\_{GL\_n},Λ)^ω. For n = 2 it is 2.
- `dualLegs.triangle_test` (characterisation): For G = G\_m and V = χ\_1 the standard character of Ĝ = G\_m, so V^∨ = χ\_{−1}: create and annihilate are isomorphisms id ≅ T\_{χ\_1}∘T\_{χ\_{−1}} and T\_{χ\_{−1}}∘T\_{χ\_1} ≅ id, and the composite T\_{χ\_1} → T\_{χ\_1}∘T\_{χ\_{−1}}∘T\_{χ\_1} → T\_{χ\_1} is the identity.
- `dualLegs.diagonal_test` (compatibility): For V ∈ Rep\_Λ(Ĝ⋊Q) and γ, γ\_1, γ\_2 ∈ W\_E: (γ,γ)∘create\_V = create\_V as maps id → T\_{V⊠V^∨} of underlying endofunctors, and annihilate′\_V∘(γ\_1,γ\_2)∘create\_V = annihilate′\_V∘(γ\_1γ\_2^{-1},1)∘create\_V.
- `dualLegs.torus_excursion_test` (computation): For G = G\_m, V = χ\_1, γ\_1, γ\_2 ∈ W\_E and a smooth character χ: E^× → Λ^×, regarded as an object of D(E^×,Λ) ≅ D\_lis(Bun^b\_{G\_m},Λ) for any b ∈ B(G\_m) (the natural transformations extend from the compact objects to D\_lis(Bun\_{G\_m},Λ), their Ind-completion, because the functors T\_V commute with colimits; a character need not be a compact object): annihilate′\_V∘(γ\_1,γ\_2)∘create\_V acts on χ by the scalar χ(rec(γ\_1γ\_2^{-1})), where rec: W\_E → E^× is the reciprocity map through which FS IX.6.4 identifies Z¹(W\_E,G\_m) with Hom(E^×,G\_m).
- `dualLegs.not_invariant_test` (non-example): For G = G\_m, V = χ\_1 and a smooth character χ of E^× with χ(rec(γ\_0)) ≠ 1 for some γ\_0 ∈ W\_E: on the object χ, (γ\_0,1)∘create\_V = χ(rec(γ\_0))·create\_V ≠ create\_V. So create\_V is not invariant under W\_E², only under its diagonal.
- `dualLegs.unit_test` (degenerate): For V = 1: create\_1 and annihilate\_1 are the unit constraints, and annihilate′\_1∘(γ\_1,γ\_2)∘create\_1 is the identity for all γ\_1, γ\_2 ∈ W\_E.

**Uses.**

- FS Definition VIII.4.2 (p. 291) and Definition/Proposition IX.4.1 (p. 327); ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator: The excursion operator of a datum (I,V,α,β,(γ\_i)) is T\_β∘(γ\_i)∘T\_α: id → T\_V → T\_V → id, with α: 1 → V|\_Ĝ and β: V|\_Ĝ → 1 equivariant for the diagonal Ĝ.
- FS Proposition IX.6.5 (p. 333); ExcursionOperatorsAndSpectralAction:ES6:functoriality/torus-two-leg-calculation: For G\_m the datum I = {1,2}, V = std⊠std^∨ with the tautological α and β, that is (create, annihilate′), computes the map of Bernstein centres.
- FS Theorem IX.7.4 (p. 338); ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace: For GL\_n the unit and counit of std give the excursion operators that determine the trace of the parameter; the scalar is fixed by taking both Weil elements equal to 1, where the composite is rank = n.
- FS Theorem IX.2.2, proof (p. 323): T\_{V^∨} is left and right adjoint to T\_V, whence T\_V preserves limits, colimits and compact objects; in this roadmap that adjunction on all of D\_lis(Bun\_G,Λ) is HS1/properties-and-weil-equivariance, and create and annihilate are its W\_E-equivariant form on compact objects.

**Acceptance.**

- V = 1: create and annihilate are the unit constraints id ≅ id∘id.
- V of rank one, a character χ of Ĝ⋊Q: coev and ev are isomorphisms, V^∨ = χ^{-1}, and T\_{χ^{-1}} is inverse to T\_χ.
- Both triangle composites are identities, with the associativity and unit constraints of T inserted.
- annihilate′\_V∘create\_V = rank\_Λ(V)·id; for V the standard representation of the dual group of GL\_n it is n.
- For G = G\_m and the standard character, annihilate′∘(γ\_1,γ\_2)∘create acts on a smooth character χ of E^× by χ(rec(γ\_1γ\_2^{-1})), where rec: W\_E → E^× is the reciprocity map of FS IX.6.4 (FS IX.6.5).

**Prerequisites.**

- In this roadmap: `HS4/monoidal-and-finite-set-functoriality`, `HS1/hecke-operator-via-relative-homology`, `HS1/coefficient-base-change`.
- In other roadmaps: `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`.
- In the pinned libraries: `mathlib:CategoryTheory.ExactPairing`, `mathlib:CategoryTheory.Functor.Monoidal`.

**Sources.**

- Fargues–Scholze, Theorem IX.2.2, proof, p. 323: The adjunctions whose units and counits are the images of coev and ev; the source states them for V ∈ Rep\_Λ(Ĝ^I), with the Weil action forgotten, and does not write out triangle identities.
- Fargues–Scholze, Definition VIII.4.2 and the construction after it, p. 291: The general creation and annihilation maps T\_α and T\_β and their composite with the Weil elements.
- Fargues–Scholze, Definition VIII.4.2, p. 291: α and β are equivariant only for the diagonal Ĝ, so T\_α and T\_β are maps of underlying endofunctors.
- Fargues–Scholze, Proposition IX.6.5 and its proof, p. 333: The proof reduces to the excursion operators of I = {1,2}, V = std ⊠ std^∨ with the tautological α and β, that is the pair (create, annihilate′) for the standard character of G\_m; their value is not written out there (it refers to Section II.2.1) and is read off from the statement: the map of centres is the diagonal embedding.
- Fargues–Scholze, paragraph after Theorem IX.0.1, p. 318: Functoriality in I, as a lift to the total spaces; its instance for {1,2} → {∗}, which the paragraph does not single out, gives the two-leg form.

### Geometric Hecke comparison for ad-isomorphisms

`HS4/isogeny-product-and-weil-restriction-diagrams` · Comparison

**Comparison.** Let η: G′ → G be a homomorphism of reductive groups over E inducing an isomorphism of adjoint groups, with dual map η̂: Ĝ → Ĝ′. Extension of structure group gives π: Bun\_{G′} → Bun\_G and π\_H: Hck^I\_{G′} → Hck^I\_G, and the diagram with rows Bun\_{G′} ←h′\_1— Hck^I\_{G′} —h′\_2→ Bun\_{G′}×(Div¹)^I and Bun\_G ←h\_1— Hck^I\_G —h\_2→ Bun\_G×(Div¹)^I and vertical maps π, π\_H, π×id commutes. For V′ ∈ Rep\_Λ((Ĝ′⋊Q)^I) let V = V′|\_{(Ĝ⋊Q)^I} be the restriction along η̂.

(a) π\_H is the composite of j: Hck^I\_{G′} → Hck^I\_G×\_{h\_1,Bun\_G}Bun\_{G′} and the projection q to Hck^I\_G. Locally on Bun\_{G′}, the map j is isomorphic to Gr^I\_{G′} → Gr^I\_G, and j♮S′\_{V′} ≅ q\*S′\_V.

(b) π\_{H♮}S′\_{V′} ≅ h\_1\*π♮Λ ⊗^■ S′\_V in D\_■(Hck^I\_G,Λ).

(c) For A ∈ D\_lis(Bun\_G,Λ): (π×id)♮T\_{V′}(π\*A) ≅ h\_{2♮}(h\_1\*A ⊗^■ h\_1\*π♮Λ ⊗^■ S′\_V) = T\_V(A ⊗^■ π♮Λ) in D\_■(Bun\_G×(Div¹)^I,Λ). Here T\_V is the functor h\_{2♮}(h\_1\*(−) ⊗^■ S′\_V) on D\_■(Bun\_G,Λ); the object A ⊗^■ π♮Λ is solid and is not claimed to be lisse. All pushforwards are ♮-pushforwards; no !-pushforward occurs. The isomorphism is natural in A and in V′ and compatible with maps of finite sets; it lies over Bun\_G×(Div¹)^I.

(d) For A ∈ D\_lis(Bun\_G,Λ): T\_{V′}(π\*A) ≅ (π×id)\*T\_V(A) in D\_lis(Bun\_{G′},Λ)^{BW\_E^I}, naturally in A and V′. That is, π\* intertwines the Hecke action of G′ with that of G along restriction of representations Rep\_Λ((Ĝ′⋊Q)^I) → Rep\_Λ((Ĝ⋊Q)^I). The source displays (b) and (c) (FS IX.6.1, proof, p. 331) and not (d), which follows from the same local comparison with h\_2 in place of h\_1; applying (π×id)♮ to (d) recovers (c).

The statement of FS Theorem IX.6.1 itself, on the action of the spectral Bernstein centres on π\*A and on L-parameters of Schur-irreducible constituents, is deduced from (c) in ExcursionOperatorsAndSpectralAction:ES6:functoriality.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; Bun\_G is the stack of G-bundles on the Fargues–Fontaine curve on Perf\_k, for k an algebraic closure of F\_q.
- ℓ ≠ p is a prime, Λ is a Z\_ℓ[√q]-algebra (a square root of q is fixed), and Q is a finite quotient of W\_E through which the action of W\_E on the dual groups in question factors. Representations are on finite projective Λ-modules. S′\_V = D(S\_V)^∨ is the solid Satake kernel of HS1 and T\_V(A) = h\_{2♮}(h\_1\*A ⊗^■ S′\_V), with ♮ the left adjoint of pullback (FS VII.3.1).
- η: G′ → G is a homomorphism of reductive groups over E inducing an isomorphism G′\_ad ≅ G\_ad; no surjectivity or finiteness of the kernel is assumed. Q is a finite quotient of W\_E through which the actions on both Ĝ and Ĝ′ factor.

**Proof outline.**

1. The maps π and π\_H are extension of structure group along η and commute with h\_1, h\_2 and the leg maps (HS0/structure-group-and-inner-form).
2. (a): v-locally on Bun\_{G′}, after trivialising the G′-bundle E′\_1 near the legs, Hck^I\_{G′} and Hck^I\_G×\_{h\_1,Bun\_G}Bun\_{G′} become Gr^I\_{G′} and Gr^I\_G, and j becomes the map Gr^I\_{G′} → Gr^I\_G. These are the Grassmannians of the second bundle relative to the trivialised first one; inversion of the loop group identifies them, compatibly with the map from G′ to G, with the Grassmannians of HS0/descent-and-bounded-fibres (b), the fibres of h\_2, and carries the pullbacks of the Satake sheaves to their pullbacks under the switch sw. Over a geometric point of Div¹ (equivalently, for G′ and G split) the one-leg map restricts to an isomorphism from each connected component onto a connected component (FS VI.11.1, proof, p. 237, stated there for split G of rank one and G → G\_ad; compare G′ and G with their common adjoint group). Over Div¹ itself this fails for non-split groups: for E′/E quadratic and the norm Res\_{E′/E}G\_m → G\_m, the component of the cocharacters (1,0), (0,1) is Div¹\_{E′}, which maps to the component Div¹\_E of degree one by the double cover ρ. For several legs it is false for connected components even for split groups: over the locus of pairwise distinct legs the map is the product of the one-leg maps, while a connected component of Gr^I\_{G′} only records the sum of the classes at the legs (examples: G\_m → 1 and SL\_n → PGL\_n with two legs). For every I the map is proper with finite fibres on each bounded closed part of Gr^I\_{G′}: over a geometric point of (Div¹)^I it is a product of one-leg maps, each of which is injective on every Schubert variety. Pushforward along it carries the Satake sheaf of V′ to that of V′|\_Ĝ (GeometricSatakeAndFusion:GS4:integral-dual-group/adjoint-isomorphism-naturality, which uses the direction G′ → G; the phrase 'the map G → G′' on p. 331 is a misprint). The pushforward commutes with sw\*: it is monoidal and commutes with Verdier duality, and the dual of A in the Satake category is sw\*D(A) (FS VI.8.2; GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality); so it also carries sw\*S\_{V′} to sw\*S\_V, which is what is needed on the fibres of h\_1. Since j is proper on the support of S\_{V′}, relative Verdier duality commutes with the pushforward and the solid dual turns it into ♮-pushforward (FS VII.4.3); this gives j♮S′\_{V′} ≅ q\*S′\_V.
3. (b): π\_{H♮}S′\_{V′} = q♮j♮S′\_{V′} ≅ q♮q\*S′\_V ≅ q♮Λ ⊗^■ S′\_V ≅ h\_1\*π♮Λ ⊗^■ S′\_V, by the projection formula and base change for ♮ (FS VII.3.1(i),(iii); VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks).
4. (c): (π×id)♮h′\_{2♮}(h′\_1\*π\*A ⊗^■ S′\_{V′}) ≅ h\_{2♮}π\_{H♮}(π\_H\*h\_1\*A ⊗^■ S′\_{V′}) ≅ h\_{2♮}(h\_1\*A ⊗^■ π\_{H♮}S′\_{V′}); insert (b). This is the displayed computation of FS p. 331, with T\_V from HS1/hecke-operator-via-relative-homology.
5. (d): let Y = Hck^I\_G×\_{h\_2,Bun\_G×(Div¹)^I}(Bun\_{G′}×(Div¹)^I), with j\_2: Hck^I\_{G′} → Y and projections q\_2: Y → Hck^I\_G, r\_2: Y → Bun\_{G′}×(Div¹)^I. Trivialising E′\_2 instead of E′\_1 near the legs identifies j\_2 locally with the map Gr^I\_{G′} → Gr^I\_G of the Grassmannians of HS0/descent-and-bounded-fibres (b), which parametrise the first bundle relative to the trivialised second one and carry the Satake sheaves themselves. Hence j\_{2♮}S′\_{V′} ≅ q\_2\*S′\_V by the pushforward statement of (a), here without the switch. Then T\_{V′}(π\*A) = r\_{2♮}j\_{2♮}(j\_2\*q\_2\*h\_1\*A ⊗^■ S′\_{V′}) ≅ r\_{2♮}(q\_2\*h\_1\*A ⊗^■ q\_2\*S′\_V) ≅ (π×id)\*h\_{2♮}(h\_1\*A ⊗^■ S′\_V), by the projection formula and base change. Both sides lie in the full subcategory D\_lis(Bun\_{G′},Λ)^{BW\_E^I} (HS1/continuous-weil-descent; π\* preserves D\_lis by FS VII.6.2), so the isomorphism is W\_E^I-equivariant. Applying (π×id)♮ and the projection formula gives (π×id)♮T\_{V′}(π\*A) ≅ T\_V(A) ⊗^■ pr\*π♮Λ for pr: Bun\_G×(Div¹)^I → Bun\_G; this is (c), because h\_1\*π♮Λ ⊗^■ S′\_V and h\_2\*pr\*π♮Λ ⊗^■ S′\_V are both isomorphic to π\_{H♮}S′\_{V′}.
6. Naturality in V′ and I: every identification is natural in the kernel and commutes with the finite-set maps of HS4/monoidal-and-finite-set-functoriality, because the comparison of Satake sheaves does.

**Acceptance.**

- η = id: π♮Λ = Λ, V = V′, and (a)–(d) are identities.
- G′ = GL\_n → G = PGL\_n, I = {∗}: η̂ is the inclusion SL\_n → GL\_n; Gr\_{GL\_n} → Gr\_{PGL\_n} maps each connected component, indexed by Z, isomorphically onto the component indexed by its class in Z/n, and pushforward carries the Satake sheaf of a representation V′ of GL\_n to that of V′|\_{SL\_n}.
- A homomorphism of tori T′ → T induces an isomorphism of the (trivial) adjoint groups: V = V′∘η̂ and (d) reads T\_{V′}∘π\* ≅ π\*∘T\_{V′∘η̂}.
- SL\_n → PGL\_n, SL\_n → GL\_n, GL\_n → PGL\_n, Z×G → G for Z the centre of G when Z is connected, and G → G×D for D = G/G\_der all satisfy the hypothesis; SL\_n → GL\_n is not surjective and Z×G → G has kernel isomorphic to Z.
- In (c) the object π♮Λ lies in D\_■(Bun\_G,Λ) and both pushforwards are left adjoints of pullback.
- G′ = G\_m → G = 1 with I = {1,2}: Gr^I\_{G\_m} is the union of the sections of (Div¹)² of degrees (a,b) ∈ Z², and two sections coincide over the diagonal exactly when a+b = a′+b′. Each section maps isomorphically onto Gr^I\_1 = (Div¹)², but the connected component of total degree 0 does not. In (d), for a complex of Λ-modules A in D\_lis(Bun\_1,Λ) = D(Λ): T\_{χ\_a⊠χ\_b}(π\*A) is the constant sheaf A on Bun\_{G\_m} with trivial W\_E²-action, which is (π×id)\*T\_1(A).

**Prerequisites.**

- In this roadmap: `HS4/monoidal-and-finite-set-functoriality`, `HS0/structure-group-and-inner-form`, `HS1/hecke-operator-via-relative-homology`, `HS1/continuous-weil-descent`.
- In other roadmaps: `GeometricSatakeAndFusion:GS4:integral-dual-group/adjoint-isomorphism-naturality`, `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS2/torsion-solid-comparisons`, `VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality`.

**Sources.**

- Fargues–Scholze, Theorem IX.6.1, proof, p. 331: (c): the displayed chain π♮T\_{V′}(π\*A) ≅ … = T\_V(A ⊗ π♮Λ), and the remark after it that the identification is functorial in V′ and I and lies over Bun\_G×(Div¹)^I.
- Fargues–Scholze, Theorem IX.6.1, proof, p. 331: (a): the factorisation of π\_H and the local comparison of kernels.
- Fargues–Scholze, Theorem IX.6.1, proof, p. 331: (b): the last display of the proof, π\_{H♮}S′\_{V′} ≅ h\_1\*π♮Λ ⊗ S′\_V, deduced there from the projection formula.
- Fargues–Scholze, Theorem IX.6.1, proof, p. 331: Why the source applies π♮ instead of stating (d).
- Fargues–Scholze, Proposition VII.3.1, p. 257: ♮-pushforward for arbitrary maps, with the projection formula (i) and base change (iii) used in (b)–(d).
- Fargues–Scholze, Theorem VI.11.1, proof, p. 237: The one-leg model for step (a): for split G of rank one the map Gr\_{G,Div¹} → Gr\_{G\_ad,Div¹} is an isomorphism on each connected component. The passage states this for split G (the case treated first, p. 235), for G → G\_ad and for a single leg only.

### Products of global Hecke kernels

`HS4/product-hecke-diagram` · Comparison

**Comparison.** Let G = G\_1×G\_2 with G\_1, G\_2 reductive over E, so Ĝ = Ĝ\_1×Ĝ\_2, and let Q be a finite quotient of W\_E through which the action on both factors passes. Then Bun\_G = Bun\_{G\_1}×Bun\_{G\_2}, and for every finite set I, Hck^I\_G = Hck^I\_{G\_1}×\_{(Div¹)^I}Hck^I\_{G\_2}, compatibly with h\_1, h\_2 and the leg maps. For V\_i ∈ Rep\_Λ((Ĝ\_i⋊Q)^I) write V\_1⊠V\_2 for the tensor product of their inflations to (Ĝ⋊Q)^I = (Ĝ\_1⋊Q)^I×\_{Q^I}(Ĝ\_2⋊Q)^I.

(a) S′\_{V\_1⊠V\_2} ≅ pr\_1\*S′\_{V\_1} ⊗^■ pr\_2\*S′\_{V\_2} in D\_■(Hck^I\_G,Λ).

(b) For A\_i ∈ D\_lis(Bun\_{G\_i},Λ) there is an isomorphism T\_{V\_1⊠V\_2}(A\_1⊠A\_2) ≅ T\_{V\_1}(A\_1) ⊠\_{(Div¹)^I} T\_{V\_2}(A\_2) in D\_■(Bun\_G×(Div¹)^I,Λ), natural in A\_i and V\_i and compatible with maps of finite sets. Equivalently, in D\_lis(Bun\_G,Λ)^{BW\_E^I} the left side is the exterior product T\_{V\_1}(A\_1)⊠T\_{V\_2}(A\_2) with the diagonal W\_E^I-action.

(c) (FS VII.7.10, with D\_lis in place of the printed D\_ét) For compact A\_i ∈ D\_lis(Bun\_{G\_i},Λ) the object A\_1⊠A\_2 ∈ D\_lis(Bun\_G,Λ) is compact, these objects form a class of compact generators, and RHom(A\_1,B\_1) ⊗^L\_Λ RHom(A\_2,B\_2) → RHom(A\_1⊠A\_2,B\_1⊠B\_2) is an isomorphism for all B\_i ∈ D\_lis(Bun\_{G\_i},Λ). Hence the functors T\_{V\_1⊠V\_2}, which preserve colimits, are determined by (b) on these generators.

(a) and (b) concern representations of the form V\_1⊠V\_2; a general object of Rep\_Λ((Ĝ⋊Q)^I) is not of this form. The source's proof of IX.6.2 is the single sentence that everything decomposes into products; (a) and (b) are that decomposition made explicit, and the proof does not cite VII.7.10, which is what defines the map Z^geom(G\_1,Λ)⊗\_ΛZ^geom(G\_2,Λ) → Z^geom(G,Λ) in its statement.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; Bun\_G is the stack of G-bundles on the Fargues–Fontaine curve on Perf\_k, for k an algebraic closure of F\_q.
- ℓ ≠ p is a prime, Λ is a Z\_ℓ[√q]-algebra (a square root of q is fixed), and Q is a finite quotient of W\_E through which the action of W\_E on the dual groups in question factors. Representations are on finite projective Λ-modules. S′\_V = D(S\_V)^∨ is the solid Satake kernel of HS1 and T\_V(A) = h\_{2♮}(h\_1\*A ⊗^■ S′\_V), with ♮ the left adjoint of pullback (FS VII.3.1).
- G = G\_1×G\_2 with G\_1 and G\_2 reductive over E.

**Proof outline.**

1. A G-bundle on X\_S is a pair of a G\_1-bundle and a G\_2-bundle, and a modification at given legs is a pair of modifications at the same legs; this gives Bun\_G = Bun\_{G\_1}×Bun\_{G\_2} and Hck^I\_G = Hck^I\_{G\_1}×\_{(Div¹)^I}Hck^I\_{G\_2} (HS0/global-hecke-correspondence).
2. (a): on the local Hecke stack S\_{V\_1⊠V\_2} ≅ S\_{V\_1}⊠S\_{V\_2} (GeometricSatakeAndFusion:GS4:integral-dual-group/product-naturality). Relative Verdier duality and the solid dual commute with exterior products of universally locally acyclic objects (VStackSheavesAndLisseCategories:VS2), so the same holds for S′ = D(S)^∨; pull back to the global Hecke stack.
3. (b): h\_1\*(A\_1⊠A\_2) ⊗^■ S′\_{V\_1⊠V\_2} is the exterior product over (Div¹)^I of the h\_1\*A\_i ⊗^■ S′\_{V\_i}, and ♮-pushforward commutes with exterior products over a base by base change and the projection formula (FS VII.3.1); T\_V is that of HS1/hecke-operator-via-relative-homology. Both sides lie in the full subcategory of W\_E^I-equivariant lisse objects (HS1/continuous-weil-descent), so the isomorphism is equivariant; compatibility with finite-set maps is that of HS4/monoidal-and-finite-set-functoriality on each factor.
4. (c): FS VII.7.10 (VStackSheavesAndLisseCategories:VS5), whose proof is that of FS V.7.2: the compact generators attached to open pro-p subgroups K\_1×K\_2 of G\_{1,b\_1}(E)×G\_{2,b\_2}(E) are exterior products.

**Acceptance.**

- G\_2 = 1 and V\_2 = 1: Hck^I\_G = Hck^I\_{G\_1}, (a) is the identity, and for a complex of Λ-modules M = A\_2 in D\_lis(Bun\_1,Λ) = D(Λ), (b) reads T\_{V\_1}(A\_1 ⊗^L\_Λ M) ≅ T\_{V\_1}(A\_1) ⊗^L\_Λ M. For G\_2 = 1 and a general V\_2 ∈ Rep\_Λ(Q^I), (a) and (b) are the Rep\_Λ(Q^I)-linearity of the kernel and of the action.
- V\_2 = 1: T\_{V\_1⊠1}(A\_1⊠A\_2) ≅ T\_{V\_1}(A\_1)⊠A\_2, with W\_E^I acting through the first factor.
- G = G\_m×G\_m, I = {∗}, V = χ\_a⊠χ\_b: T\_V maps the factor of D\_lis(Bun\_G,Λ) = ∏\_{(d\_1,d\_2)∈Z²} D(E^××E^×,Λ) indexed by (d\_1,d\_2) to the factor indexed by (d\_1+a, d\_2+b), the indices being the degrees of the two line bundles.
- For compact A\_i and arbitrary B\_i: RHom(A\_1⊠A\_2, T\_{V\_1⊠V\_2}(B\_1⊠B\_2)) ≅ RHom(A\_1,T\_{V\_1}B\_1) ⊗^L\_Λ RHom(A\_2,T\_{V\_2}B\_2) after forgetting the Weil action.

**Prerequisites.**

- In this roadmap: `HS4/monoidal-and-finite-set-functoriality`, `HS1/hecke-operator-via-relative-homology`, `HS0/global-hecke-correspondence`, `HS1/continuous-weil-descent`.
- In other roadmaps: `GeometricSatakeAndFusion:GS4:integral-dual-group/product-naturality`, `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS2/torsion-solid-comparisons`, `VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality`, `VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion`, `VStackSheavesAndLisseCategories:VS5/lisse-kunneth`.

**Sources.**

- Fargues–Scholze, Proposition IX.6.2, proof, p. 331: The whole proof in the source; (a) and (b) spell out the decomposition of Bun\_G, Hck^I\_G, kernels and operators.
- Fargues–Scholze, Proposition VII.7.10, p. 276: (c): compact generation by exterior products and the Künneth formula for Hom; the statement prints D\_ét(Bun\_G,Λ) where D\_lis(Bun\_G,Λ) is meant.
- Fargues–Scholze, Proposition VII.3.1, p. 257: Base change and projection formula for ♮, giving the Künneth formula used in (b).

### Weil restriction of Hecke kernels

`HS4/weil-restriction-hecke-diagram` · Comparison

**Comparison.** Let E′/E be a finite separable extension inside a fixed separable closure Ē, so that W\_{E′} ⊂ W\_E; let G′ be a reductive group over E′ and G = Res\_{E′/E}G′. Let f be the residue degree, so the residue field of E′ has q′ = q^f elements, and take (√q)^f as the square root of q′.

(a) There is a canonical isomorphism Bun\_{G′} ≅ Bun\_G: for S ∈ Perf\_k a G-bundle on X\_{S,E} is a G′-bundle on X\_{S,E′} = X\_{S,E}×\_E E′.

(b) Let ρ: Div¹\_{E′} → Div¹\_E be the induced map, finite étale of degree [E′:E]. For every finite set I there is a commutative diagram with rows Bun\_{G′} ←h′\_1— Hck^I\_{G′} —h′\_2→ Bun\_{G′}×(Div¹\_{E′})^I and Bun\_G ←h\_1— Hck^I\_G —h\_2→ Bun\_G×(Div¹\_E)^I, whose vertical maps are the isomorphism of (a), a map ψ, and that isomorphism times ρ^I. The induced map Hck^I\_{G′} → Hck^I\_G×\_{(Div¹\_E)^I}(Div¹\_{E′})^I is a closed immersion, compatibly with the analogous closed immersion of Beilinson–Drinfeld Grassmannians.

(c) Ĝ = ∏\_{E′↪Ē}Ĝ′, with W\_E permuting the factors. The chosen embedding gives a W\_{E′}-equivariant projection Ĝ → Ĝ′, hence a surjection Ĝ⋊W\_{E′} → Ĝ′⋊W\_{E′} from the subgroup Ĝ⋊W\_{E′} ⊂ Ĝ⋊W\_E. For a representation V′ of (Ĝ′⋊W\_{E′})^I on a finite projective Λ-module, factoring through a finite quotient of W\_{E′}, let V be the induction to (Ĝ⋊W\_E)^I of the inflation of V′ to (Ĝ⋊W\_{E′})^I; then rank\_Λ V = [E′:E]^{|I|}·rank\_Λ V′. With these, ψ\_\*S\_{V′} ≅ S\_V for the Satake sheaves pulled back to the Hecke stacks. The map ψ is proper, being the closed immersion of (b) followed by a base change of the finite étale map ρ^I, and equivalently ψ♮S′\_{V′} ≅ S′\_V.

(d) Consequently, for A ∈ D\_lis(Bun\_G,Λ) = D\_lis(Bun\_{G′},Λ): T\_V(A) ≅ (id×ρ^I)♮T\_{V′}(A) in D\_■(Bun\_G×(Div¹\_E)^I,Λ). That is, the W\_E^I-equivariant object T\_V(A) is induced from the W\_{E′}^I-equivariant object T\_{V′}(A). The isomorphisms are natural in A and V′ and compatible with maps of finite sets.

The source states (b) and (c) in words (FS IX.6.3, proof, p. 332: the procedure is described as the commutative diagram together with pushforward of sheaves along ψ) and gives no proof of (c); (d) is the consequence used for excursion operators. The identifications of cocycle stacks and of excursion algebras in the statement of IX.6.3 belong to ExcursionOperatorsAndSpectralAction:ES6:functoriality.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; Bun\_G is the stack of G-bundles on the Fargues–Fontaine curve on Perf\_k, for k an algebraic closure of F\_q.
- ℓ ≠ p is a prime, Λ is a Z\_ℓ[√q]-algebra (a square root of q is fixed), and Q is a finite quotient of W\_E through which the action of W\_E on the dual groups in question factors. Representations are on finite projective Λ-modules. S′\_V = D(S\_V)^∨ is the solid Satake kernel of HS1 and T\_V(A) = h\_{2♮}(h\_1\*A ⊗^■ S′\_V), with ♮ the left adjoint of pullback (FS VII.3.1).
- E′/E is a finite separable extension with a fixed embedding E′ ⊂ Ē; G′ is reductive over E′ and G = Res\_{E′/E}G′. The half twists for G′ are formed with √q′ := (√q)^f, where f is the residue degree of E′/E.

**Proof outline.**

1. (a) and ρ: for S over k one has X\_{S,E′} = X\_{S,E}×\_E E′, so G-bundles on X\_{S,E} are G′-bundles on X\_{S,E′} (the Weil-restriction equivalence of BunGAndNewtonStrata:BG2:uniformization); a degree-one divisor of X\_{S,E′} maps isomorphically onto a degree-one divisor of X\_{S,E}, which defines ρ.
2. (b): a modification of G′-bundles on X\_{S,E′} away from legs D′\_i is a modification of the corresponding G-bundles on X\_{S,E} away from the images D\_i; this defines ψ and the diagram (HS0/global-hecke-correspondence). Conversely a modification of G-bundles away from the D\_i is a modification of G′-bundles away from the preimages of the D\_i, and it comes from Hck^I\_{G′} exactly when it is an isomorphism along the part of the preimage not contained in ∪D′\_i; the source asserts that this locus is closed (FS IX.6.3, proof).
3. (c): GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-naturality, applied to the closed immersion of Beilinson–Drinfeld Grassmannians and the finite étale projection. The half twists agree because the cyclotomic character of W\_E restricts to that of W\_{E′} and √q′ = (√q)^f. Since ψ is proper, relative Verdier duality and the solid dual turn ψ\_\* on S into ψ♮ on S′ = D(S)^∨ (VStackSheavesAndLisseCategories:VS2; FS VII.4.3).
4. (d): T\_V(A) = h\_{2♮}(h\_1\*A ⊗^■ ψ♮S′\_{V′}) ≅ h\_{2♮}ψ♮(ψ\*h\_1\*A ⊗^■ S′\_{V′}) = (id×ρ^I)♮h′\_{2♮}(h′\_1\*A ⊗^■ S′\_{V′}), by the projection formula (FS VII.3.1) and h\_1ψ = h′\_1, h\_2ψ = (id×ρ^I)h′\_2 (HS1/hecke-operator-via-relative-homology). Under HS1/continuous-weil-descent, ♮-pushforward along Bun\_G×[∗/W\_{E′}^I] → Bun\_G×[∗/W\_E^I] is induction of equivariant objects.

**Acceptance.**

- E′ = E: ρ and ψ are identities and V = V′.
- E′/E separable quadratic, G′ = G\_m, I = {∗}, V′ = χ\_1: Ĝ = G\_m×G\_m with W\_E exchanging the factors through Gal(E′/E), and V is the rank-two representation whose restriction to Ĝ is χ\_{(1,0)}⊕χ\_{(0,1)}, with W\_{E′} preserving and W\_E∖W\_{E′} exchanging the two lines; ψ\_\*S\_{χ\_1} has rank one on each of the components (1,0) and (0,1) of Gr\_G over a geometric point.
- rank\_Λ V = [E′:E]^{|I|}·rank\_Λ V′, the degree of ρ^I.
- For a tower E″/E′/E the diagram for E″/E is the composite of the diagrams for E″/E′ and E′/E, matching transitivity of induction.
- Normalisation. Replacing √q′ = (√q)^f by −(√q)^f changes Λ(1/2) on Div¹\_{E′} by the character ε(w) = (−1)^{|w|} of W\_{E′}, |w| the exponent of the geometric Frobenius of E′, and hence, for I = {∗} and V′ all of whose weights μ have ⟨2ρ,μ⟩ ≡ d mod 2, the Satake sheaf of V′ by ε^d. With that choice ψ\_\*S\_{V′} ≅ S\_V for V the induction of the inflation of V′⊗ε^d; so (c) as stated needs √q′ = (√q)^f, except when d is even, for instance for G′ a torus. For this choice the square root (√q)^{−|w|\_E} of the cyclotomic character of W\_E restricts on W\_{E′} to ((√q)^f)^{−|w|}, because |w|\_E = f·|w| on W\_{E′}.

**Prerequisites.**

- In this roadmap: `HS4/monoidal-and-finite-set-functoriality`, `HS1/hecke-operator-via-relative-homology`, `HS0/global-hecke-correspondence`, `HS1/continuous-weil-descent`.
- In other roadmaps: `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-naturality`, `BunGAndNewtonStrata:BG2:uniformization`, `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS2/torsion-solid-comparisons`, `VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality`.

**Sources.**

- Fargues–Scholze, Proposition IX.6.3, proof, p. 332: (b), (c): the diagram, followed by pushforward of sheaves along ψ; the procedure is inflation to (Ĝ⋊W\_{E′})^I and induction to (Ĝ⋊W\_E)^I, described in the sentence before.
- Fargues–Scholze, Proposition IX.6.3, proof, p. 332: (b): the closed immersion Hck^I\_{G′} → Hck^I\_G×\_{(Div¹)^I}(Div′¹)^I, compatible with the one of Beilinson–Drinfeld Grassmannians; after it the proof only says that the claim follows from a diagram chase.
- Fargues–Scholze, Proposition IX.6.3, statement, p. 331: (a): Bun\_{G′} ≅ Bun\_G; the sentence continues with the identifications of cocycle stacks and excursion algebras, which are not used for (a)–(d).

### Levi constant-term compatibility of the action

`HS4/levi-compatibility` · Comparison

**Comparison.** Let P ⊂ G be a parabolic subgroup with Levi quotient M and a Levi splitting M ⊂ P. The proof of FS IX.7.2 (p. 336) uses the commutative diagram with rows Bun\_M ←h″\_1— Hck^I\_{M,P} —h″\_2→ Bun\_P×(Div¹)^I, Bun\_P ←h′\_1— Hck^I\_P —h′\_2→ Bun\_P×(Div¹)^I and Bun\_M ←h\_1— Hck^I\_M —h\_2→ Bun\_M×(Div¹)^I. Here ψ: Bun\_M → Bun\_P and π: Bun\_P → Bun\_M are induced by M ⊂ P and P → M, ψ\_H and π\_H are the induced maps of Hecke stacks, the right-hand vertical maps are the identity and π×id, and Hck^I\_{M,P} := Hck^I\_P×\_{h′\_1,Bun\_P,ψ}Bun\_M parametrises modifications from an M-bundle to a P-bundle. Put g = π\_H∘ψ\_H: Hck^I\_{M,P} → Hck^I\_M.

(a) Geometry. Over a point of Hck^I\_M, after trivialising the first bundle (an M-bundle) near the legs, the fibre of g is the fibre of the map Gr^I\_P → Gr^I\_M of the Grassmannians of the second bundle relative to the first. So g is the pullback, along Hck^I\_M → 𝓗ck^I\_M, of the map L⁺M\\Gr^I\_P → L⁺M\\Gr^I\_M of local Hecke stacks (FS p. 337). Inversion of the loop group exchanges these Grassmannians with those of HS0/bounded-hecke-substacks, which are the fibres of the target map and measure the first bundle relative to the second.

(b) Kernel. Let Λ be killed by a power of ℓ, let V ∈ Rep\_Λ((Ĝ⋊Q)^I), and write S\_V for its Satake sheaf and for its pullbacks. Types of modifications and Satake sheaves are normalised as in HS0/bounded-hecke-substacks: the type is the position of the first bundle relative to the second, and S\_V is supported on types bounded by the weights of V. On the Grassmannians of (a) the pullback of S\_V is therefore sw\*S\_V, with sw the switch of the two bundles, and by base change Rg\_!S\_V is the pullback of Rp\_!q\*(sw\*S\_V) ∈ D\_ét(𝓗ck^I\_M,Λ), for the maps Gr^I\_G ←q— Gr^I\_P —p→ Gr^I\_M of FS VI.7.13. The source (p. 337) writes the constant term CT\_P(S\_V) = Rp\_!q\*S\_V here, without the switch. For A in the Satake category of G, CT\_P(A)[deg\_P] lies in the Satake category of M and corresponds to restriction of representations along M̌⋊W\_E → Ǧ⋊W\_E for the W\_E-actions arising geometrically; in terms of the algebraic actions it is restriction along (m,w) ↦ (m·(2ρ̂\_G − 2ρ̂\_M)(√q)^{|w|}, w). Here deg\_P is the locally constant function on Gr^I\_M given by pairing with 2ρ\_G − 2ρ\_M, the sum of the roots of G in the Lie algebra of the unipotent radical of P; 2ρ̂\_G − 2ρ̂\_M ∈ X\_\*(T̂) is the same sum of roots, regarded as a cocharacter of the dual torus; the element (2ρ̂\_G − 2ρ̂\_M)(√q) is central in M̂; and |·|: W\_E → Z sends a geometric Frobenius to 1. Since sw\* corresponds to the Chevalley involution up to an inner automorphism, for G and for M (FS VI.12.1), the result in the normalisation of HS0 is: Rg\_!S\_V[−deg\_P] is the pullback of the Satake sheaf for M of the representation obtained by restricting V along (m,w) ↦ (m·(2ρ̂\_G − 2ρ̂\_M)(√q)^{−|w|}, w), where deg\_P is now the function on Hck^I\_M that pairs 2ρ\_G − 2ρ\_M with the sum of the types at the legs. These are the shift and the twist of the constant term along the parabolic opposite to P, and they have the opposite sign to the sentence of the source that asserts the agreement up to the shift [deg\_P], read in the same normalisation and with the same P.

(c) Action on one stratum. Let G be quasisplit, let Λ be killed by a power of ℓ, and let b\_N ∈ B(G) have Harder–Narasimhan parabolic P, so that Bun\_G^{b\_N} ≅ Bun\_P^{b\_N} ⊂ Bun\_P. Let A\_N ∈ D\_ét(Bun\_G,Λ) be concentrated on Bun\_G^{b\_N}, A′\_N ∈ D\_ét(Bun\_P,Λ) the corresponding object, and B\_N = Rπ\_!A′\_N ∈ D\_ét(Bun\_M,Λ), so that A′\_N = Rψ\_!B\_N. Then Rπ\_!Rh′\_{2!}(h′\_1\*A′\_N ⊗^L\_Λ S\_V) ≅ Rh\_{2!}(h\_1\*B\_N ⊗^L\_Λ Rg\_!S\_V). If moreover every modification of E\_{b\_N} to itself of type bounded by V is compatible with the Harder–Narasimhan reduction to P, which holds once b\_N is sufficiently unstable relative to V, then T\_V(A\_N)|\_{Bun\_G^{b\_N}} = Rh′\_{2!}(h′\_1\*A′\_N ⊗^L\_Λ S\_V)|\_{Bun\_P^{b\_N}}.

So on such a stratum the restriction of T\_V(A\_N) to the stratum is computed, after applying Rπ\_!, by the Hecke operator of M with kernel Rg\_!S\_V applied to B\_N = Rπ\_!A′\_N (not to the sheaf of the same representation on Bun\_M; see the last paragraph). On the components with deg\_P = 0, the only ones that excursion operators see, Rg\_!S\_V is the kernel of V restricted along the twisted map of (b).

Scope. (b) and (c) are statements for torsion coefficients, étale sheaves and a single stratum. The source proves no identity of functors on D\_lis(Bun\_G,Λ) for general Λ and none on all of Bun\_G; such an extension is not asserted here. In (c) the objects A\_N and B\_N correspond to different representations of G\_b(E): when the étale sheaves on the strata Bun\_G^{b\_N} ≅ Bun\_P^{b\_N} and Bun\_M^{b\_N} are identified with D(G\_b(E),Λ) by pullback (FS V.1.1, V.2.2), A′\_N = π\*σ gives B\_N = σ ⊗^L\_Λ Rπ\_!Λ, and Rπ\_!Λ is a shift of a character of G\_b(E), given by its action on the compactly supported cohomology of the classifying stack of the unipotent part of Aut(E\_{b\_N}), which is not trivial in general. The source does not track this character, so (c) does not by itself give the unramified twist in the comparison of excursion operators; the inverse twist of (b) and this character have to be combined. Compatibility of (b) with fusion and with nested parabolics is FS VI.9.6 and VI.7.13.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; Bun\_G is the stack of G-bundles on the Fargues–Fontaine curve on Perf\_k, for k an algebraic closure of F\_q.
- ℓ ≠ p is a prime, Λ is a Z\_ℓ[√q]-algebra, and Q is a finite quotient of W\_E through which the action on Ĝ factors. In (b) and (c) Λ is killed by a power of ℓ, so that D\_ét and the functors Rf\_! are available and T\_V(A) = Rh\_{2!}(h\_1\*A ⊗^L\_Λ S\_V).
- P ⊂ G is a parabolic subgroup with Levi quotient M and a chosen Levi splitting. In (c), G is quasisplit, P is the parabolic of the Harder–Narasimhan reduction of E\_{b\_N}, and b\_N is so unstable relative to V that every modification of E\_{b\_N} to itself of type bounded by V is compatible with that reduction.

**Proof outline.**

1. Diagram: Bun\_P, Bun\_M, their Harder–Narasimhan strata and the maps induced by M ⊂ P → M are those of BunGAndNewtonStrata:BG3; the Hecke stacks of P and M are defined as in HS0/global-hecke-correspondence, and the squares commute by functoriality of extension of structure group. The upper left square is cartesian by the definition of Hck^I\_{M,P}.
2. (a): v-locally on Bun\_M, after trivialising the M-bundle near the legs, Hck^I\_{M,P} → Hck^I\_M becomes Gr^I\_P → Gr^I\_M, equivariantly for L⁺M (FS p. 337).
3. (b): base change for Rg\_! along Hck^I\_M → 𝓗ck^I\_M identifies Rg\_!S\_V with the pullback of Rp\_!q\*(sw\*S\_V) = CT\_P(sw\*S\_V), for the maps q, p of FS VI.7.13: by (a) the fibres of g are Grassmannians of the second bundle relative to the first, on which the pullback of S\_V is sw\*S\_V. That CT\_P[deg\_P] corresponds to restriction of representations along the twisted inclusion is GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term together with GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality. The switch sw\* corresponds to the Chevalley involution up to an inner automorphism, for G and for M (FS VI.12.1), and it changes the sign of deg\_P; conjugating the twisted inclusion by the two involutions replaces the central element (2ρ̂\_G − 2ρ̂\_M)(√q)^{|w|} of M̂ by its inverse. This gives the shift [−deg\_P] and the inverse twist of (b).
4. (c), first identity: h′\_1\*Rψ\_!B\_N ≅ Rψ\_{H!}h″\_1\*B\_N by base change in the cartesian square, so Rπ\_!Rh′\_{2!}(h′\_1\*A′\_N ⊗ S\_V) ≅ Rπ\_!Rh′\_{2!}Rψ\_{H!}(h″\_1\*B\_N ⊗ S\_V) by the projection formula for ψ\_H. Since π∘ψ = id one has h″\_1 = h\_1∘g, and π∘h′\_2∘ψ\_H = h\_2∘g, so this is Rh\_{2!}Rg\_!(g\*h\_1\*B\_N ⊗ S\_V) ≅ Rh\_{2!}(h\_1\*B\_N ⊗ Rg\_!S\_V) by the projection formula for g (DiamondSixOperations:S2/projection-formula). Rπ\_! is defined on A′\_N because π is cohomologically smooth on its support, a single stratum whose category of sheaves is D(G\_b(E),Λ) (FS p. 336); the identity is used after restriction to Bun\_P^{b\_N}, which is the full preimage under π of a stratum of Bun\_M, where the same holds for Rh′\_{2!}(h′\_1\*A′\_N ⊗ S\_V).
5. (c), second identity: for torsion Λ, T\_V(A) = Rh\_{2!}(h\_1\*A ⊗ S\_V) (HS1/hecke-operator-via-relative-homology; FS VII.5.2). Under the instability hypothesis the modifications of E\_{b\_N} to itself of type bounded by V are modifications of P-bundles, so over the stratum the correspondence Hck^I\_G may be replaced by Hck^I\_P (FS p. 336).
6. Compatibility of (b) with maps of finite sets and with nested parabolics follows from the corresponding properties of CT\_P[deg\_P] in GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term and of T in HS4/monoidal-and-finite-set-functoriality.

**Acceptance.**

- M = G = P: ψ, π and g are identities, deg\_P = 0, CT\_P is the identity, and (c) is the torsion formula for T\_V.
- V = 1: S\_1 is the unit kernel, Rg\_!S\_1 is the unit kernel of Hck^I\_M, supported where deg\_P = 0, and (c) reads Rπ\_!A′\_N = B\_N.
- G = GL\_2, M = T, I = {∗}, V = std, and P = B the stabiliser of the line N\_1 in a B-bundle E\_2 with quotient N\_2, so that 2ρ\_G − 2ρ\_M = (1,−1). The fibre of g over the modification of T-bundles (N\_1(−D), N\_2) → (N\_1, N\_2), of type (1,0), is a point: in a basis e\_1, e\_2 of the completion of the first bundle, the second is ⟨ξ^{−1}e\_1, e\_2 + c·e\_1⟩ with c taken modulo ξ^{−1}B⁺\_dR, and it contains e\_2 only for c ∈ ξ^{−1}B⁺\_dR, that is, for one value of c. Over (N\_1, N\_2(−D)) → (N\_1, N\_2), of type (0,1), it is an affine line: the second bundle is ⟨e\_1, ξ^{−1}e\_2 + c·e\_1⟩ with c taken modulo B⁺\_dR, and it contains e\_2 exactly for c ∈ ξ^{−1}B⁺\_dR. Since S\_std is Λ[1\](1/2) on its support, Rg\_!S\_std is Λ[1\](1/2), in degree −1, on type (1,0) and Λ[−1\](−1/2), in degree +1, on type (0,1). So Rg\_!S\_std[−deg\_B] is Λ(1/2) on (1,0) and Λ(−1/2) on (0,1), which is std restricted along (t,w) ↦ (t·diag((√q)^{−|w|},(√q)^{|w|}), w). By contrast the constant term CT\_B(S\_std) on the fibre of the target map has an affine line over (1,0) and a point over (0,1): degrees +1 and −1, twists Λ(−1/2) and Λ(1/2), and CT\_B(S\_std)[deg\_B] is std restricted along (t,w) ↦ (t·diag((√q)^{|w|},(√q)^{−|w|}), w).
- Nested parabolics P′ ⊂ P with Levi quotients M′ and M, and P″ the image of P′ in M: deg\_{P′} = deg\_{P″} + deg\_P on Gr\_{M′}, 2ρ̂\_G − 2ρ̂\_{M′} = (2ρ̂\_G − 2ρ̂\_M) + (2ρ̂\_M − 2ρ̂\_{M′}), and CT\_{P′}[deg\_{P′}] ≅ CT\_{P″}[deg\_{P″}]∘CT\_P[deg\_P] (FS VI.7.13).
- G = GL\_2 and E\_{b\_N} = 𝒪(d\_1)⊕𝒪(d\_2) with d\_1 > d\_2: G\_b(E) = E^××E^×, the unipotent part of Aut(E\_{b\_N}) is BC(𝒪(d\_1−d\_2)), and for d\_1−d\_2 = 1 it is a perfectoid open unit disc with coordinate t on which a uniformiser of one factor acts by t ↦ t^q and a uniformiser of the other by the inverse map; so they act on H²\_c = Λ(−1) by q and q^{−1}, and Rπ\_!Λ is a non-trivial unramified character of G\_b(E) placed in one degree, unless q = 1 in Λ.

**Prerequisites.**

- In this roadmap: `HS4/monoidal-and-finite-set-functoriality`, `HS1/hecke-operator-via-relative-homology`, `HS0/global-hecke-correspondence`, `HS0/bounded-hecke-substacks`, `HS1/satake-kernel-and-solid-monoidal-functor`.
- In other roadmaps: `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality`, `BunGAndNewtonStrata:BG3`, `DiamondSixOperations:S2/lower-shriek`, `DiamondSixOperations:S2/lower-shriek-base-change`, `DiamondSixOperations:S2/projection-formula`, `DiamondSixOperations:S2/lower-shriek-composition`, `VStackSheavesAndLisseCategories:VS0/shriek-pullback-for-smooth-stacky-maps`, `VStackSheavesAndLisseCategories:VS0`, `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification`, `GeometricSatakeAndFusion:GS4:integral-dual-group/chevalley-involution`.

**Sources.**

- Fargues–Scholze, Theorem IX.7.2, proof, p. 337: (b): the source's statement that Rg\_!S\_V is the pullback of CT\_P(S\_V) ∈ D\_ét(𝓗ck^I\_M,Λ); it holds for the Grassmannian of the second bundle relative to the first with the switched Satake sheaf.
- Fargues–Scholze, Theorem IX.7.2, proof, p. 337: (b): comparison with the Satake sheaf of V restricted to (M̂⋊Q)^I, the restriction involving the cyclotomic twist; in the normalisation in which types are positions of the first bundle relative to the second, the shift and the twist have the opposite sign.
- Fargues–Scholze, Theorem IX.7.2, proof, p. 336: The definition of Hck^I\_{M,P} as the fibre product Hck^I\_P×\_{Bun\_P}Bun\_M under the three-row diagram.
- Fargues–Scholze, Theorem IX.7.2, proof, p. 336: (c): the instability hypothesis on the stratum, depending on V.
- Fargues–Scholze, Theorem IX.7.2, proof, p. 336: (c): B\_N = Rπ\_!A′\_N and A′\_N = Rψ\_!B\_N on one stratum; the displayed computation follows on p. 337.
- Fargues–Scholze, Theorem IX.7.2, proof, p. 335: The computation is made with torsion coefficients and étale sheaves.
- Fargues–Scholze, Proposition VI.7.13, p. 223: CT\_P[deg\_P] and its compatibility with nested parabolics.
- Hamann–Imai, Proposition 4.4, p. 25; Lemma 4.7, p. 26: The compactly supported cohomology of the unipotent part of Aut(E\_b), with the action of G\_b(E), is the inverse of the modulus character δ\_b in degree 2⟨2ρ\_G,ν\_b⟩; and the parameter of a sheaf extended from a stratum is the parameter of the representation composed with the embedding twisted by (2ρ̂\_G − 2ρ̂\_{G\_b})(√q)^{|w|}. An independent check of the character of Rπ\_!Λ in the paragraph on scope and of the twist in (b); neither is an input of the proof.

### Tensor compatibility and continuity of the Weil action on T\_V(A)

`HS4/continuous-tensor-generator-export` · Application

**Application.** Let A ∈ D\_lis(Bun\_G,Λ)^ω be a compact object. For every finite set I and V ∈ Rep\_Λ((Ĝ⋊Q)^I), T\_V(A) is a compact object of D\_lis(Bun\_G,Λ) with a map of condensed groups W\_E^I → Aut(T\_V(A)), and End(T\_V(A)) is a relatively discrete condensed animated Z\_ℓ-algebra (FS IX.2.4 with IX.1.2 and IX.2.2). The family (I,V) ↦ T\_V(A) has the following properties, which are the input from the Hecke action to the proof of FS Proposition IX.5.1.

(E1) Exterior products. For V ∈ Rep\_Λ((Ĝ⋊Q)^I) and W ∈ Rep\_Λ((Ĝ⋊Q)^J): T\_{V⊠W}(A) ≅ T\_V(T\_W(A)) ≅ T\_W(T\_V(A)) in D\_lis(Bun\_G,Λ)^{BW\_E^{I⊔J}}. In T\_V(T\_W(A)) the factor W\_E^I acts through its action on the functor T\_V, and W\_E^J acts through T\_V applied to its action on T\_W(A); symmetrically for T\_W(T\_V(A)).

(E2) Tensor products. For I = J, T\_{V⊗W}(A) is T\_{V⊠W}(A) with W\_E^I acting through the diagonal W\_E^I → W\_E^{I⊔I}.

(E3) Consequence. Let P be an open subgroup of the wild inertia subgroup of W\_E. If P^I acts trivially on T\_V(A) and on T\_W(A), then P^{I⊔I} acts trivially on T\_{V⊠W}(A), and P^I acts trivially on T\_{V⊗W}(A). Acting trivially is meant as in the source: the object lies in the full subcategory of objects equivariant for the quotient by the power of P.

(E4) Exactness and exterior tensor products. V ↦ T\_V(A) is exact and Rep\_Λ(Q^I)-linear, T\_1(A) = A with trivial action, and for V\_i ∈ Rep\_Λ(Ĝ⋊Q), i ∈ I, the object T\_{⊠\_iV\_i}(A) is the iterated composite of the T\_{V\_i} applied to A, the i-th factor of W\_E^I acting through T\_{V\_i}.

(E5) Duals. For V ∈ Rep\_Λ(Ĝ⋊Q), T\_{V^∨} is left and right adjoint to T\_V, with W\_E-equivariant units and counits. This gives the compactness of T\_V(A) (FS IX.2.2); the argument on p. 328 uses duals in no other way.

By (E3) and (E4), the class of V for which P^I acts trivially on T\_V(A) is closed under tensor products and exterior tensor products. Since V ↦ T\_V(A) is exact and the (W\_E/P)^I-equivariant objects form a full stable subcategory closed under colimits and direct summands, the class is also closed under finite direct sums, direct summands, extensions (if two terms of a short exact sequence of representations lie in it, so does the third) and resolutions of the kind used for FS IX.2.3. None of (E1)–(E5) shows that it is closed under subobjects, quotients or duals. So after reduction to exterior tensor products and I = {∗} it suffices to control one V ∈ Rep\_{Z\_ℓ}(Ĝ⋊Q) from whose tensor powers every representation is obtained by these operations; this is the sense in which the ⊗-generator of the source has to be taken, and the source does not discuss the existence of such a V. The existence of one open subgroup P of the wild inertia such that P^I acts trivially on T\_V(A) for all I and V is FS IX.5.1; it is proved from (E1)–(E5) and such a generator in ExcursionOperatorsAndSpectralAction:ES1:finite-ramification and is not asserted here.

**Hypotheses and conventions.**

- E is a nonarchimedean local field, of either characteristic, with residue field F\_q of characteristic p; G is a reductive group over E; Bun\_G is the stack of G-bundles on the Fargues–Fontaine curve on Perf\_k, for k an algebraic closure of F\_q.
- ℓ ≠ p is a prime, Λ is a Z\_ℓ[√q]-algebra (a square root of q is fixed), and Q is a finite quotient of W\_E through which the action of W\_E on the dual group Ĝ over Z\_ℓ factors. Rep\_Λ((Ĝ⋊Q)^I) is the exact category of representations on finite projective Λ-modules. No condition on ℓ beyond ℓ ≠ p is imposed.

**Proof outline.**

1. Compactness and continuity: T\_V preserves compact objects (HS1/properties-and-weil-equivariance; FS IX.2.2), and Hom-complexes out of compact objects are relatively discrete over Z\_ℓ (HS1/condensed-enrichment; FS IX.1.2). So the W\_E^I-action on T\_V(A) is a map of condensed groups into the units of a relatively discrete condensed algebra.
2. (E1), (E2), (E4): the cases (4), (2) and (3) of HS4/monoidal-and-finite-set-functoriality, evaluated at A; exactness and Rep\_Λ(Q^I)-linearity are part of FS IX.2.4.
3. (E3): by (E1), T\_{V⊠W}(A) ≅ T\_W(T\_V(A)), in which the first copy of P^I acts through T\_W applied to its trivial action on T\_V(A); and T\_{V⊠W}(A) ≅ T\_V(T\_W(A)), in which the second copy acts through T\_V applied to its trivial action on T\_W(A). Hence P^{I⊔I} acts trivially, and by (E2) so does the diagonal P^I on T\_{V⊗W}(A) (FS p. 328).
4. (E5): HS4/creation-annihilation-and-triangles.

**Acceptance.**

- V = 1: T\_1(A) = A with the trivial W\_E^I-action, and (E3) with W = 1 is tautological.
- I = {1,2}, V\_1, V\_2 ∈ Rep\_Λ(Ĝ⋊Q): on T\_{V\_1}(T\_{V\_2}(A)) the element (γ,1) acts through the action of γ on the functor T\_{V\_1}, and (1,γ) through T\_{V\_1} applied to the action of γ on T\_{V\_2}(A).
- G = G\_m, K ⊂ E^× an open pro-p subgroup and A = c-Ind\_K^{E^×}Λ placed on a component of Bun\_{G\_m}: an element γ ∈ W\_E acts on T\_{χ\_n}(A) as the central element rec(γ)^n of E^×, where rec: W\_E → E^× is the reciprocity map of FS IX.6.4 (FS IX.6.5). Hence P = {γ in the wild inertia : rec(γ) ∈ K} acts trivially on T\_{χ\_n}(A) for every n ∈ Z, the instance of FS IX.5.1 for G\_m, in agreement with (E3) for the ⊗-generators χ\_1, χ\_{−1}.

**Prerequisites.**

- In this roadmap: `HS4/creation-annihilation-and-triangles`, `HS1/condensed-enrichment`, `HS4/monoidal-and-finite-set-functoriality`, `HS1/properties-and-weil-equivariance`.

**Sources.**

- Fargues–Scholze, Corollary IX.2.4, p. 323: The family on compact objects with its condensed structure. The corollary says nothing about tensor generators.
- Fargues–Scholze, Proposition IX.5.1, proof, p. 328: (E1)–(E3) as the source uses them.
- Fargues–Scholze, Proposition IX.5.1, proof, p. 328: The reduction to a tensor generator, which consumes (E3) and (E4).
- Fargues–Scholze, Proposition IX.5.1, proof, p. 328: Where the relatively discrete condensed structure of End(T\_V(A)) is used.

## Requests to other roadmaps

A node that needs a statement of another roadmap for which that roadmap has no node yet lists the supplier layer as a prerequisite, and the statement is requested here. Each request names the statement and the nodes that need it.

### `AdicEtaleGeometry:A2`

For K a complete nonarchimedean field of characteristic 0 with perfect residue field (here the completed maximal unramified extension of the reflex field of μ): (1) the analytification of a smooth projective K-variety, here the flag variety Fl\_{G,μ}, is a smooth proper rigid space over K; (2) an analytic adic space étale over a smooth rigid space over K is a smooth rigid space of the same dimension, and a finite étale cover of a rigid space is a rigid space; (3) a separated morphism X → Spa K of analytic adic spaces, locally of finite type, is partially proper if the induced map of diamonds X^♦ → Spd K satisfies the valuative criterion of partial properness (unique lifting from Spa(R,R°) to Spa(R,R⁺) for perfectoid Tate R). The definitions of smooth morphisms by ball charts and of partial properness are taken from the existing nodes; the request is for these three statements.

Needed by: `HS2/minuscule-rigidification`.

### `BunGAndNewtonStrata:BG2:uniformization`

Weil restriction of bundles on the curve. For E′/E finite separable and G = Res\_{E′/E} G′: the relative curve for E′ is the base change of the relative curve for E along Spa E′ → Spa E, compatibly with Frobenius, and pushforward along it gives an equivalence of small v-stacks Bun\_{G′} ≅ Bun\_G on Perf\_k carrying E\_{b′} to E\_b under B(G′) = B(G); the equivalence is compatible with modifications at a leg of Div¹ for E′ and its image in Div¹ for E, which is what the closed immersion of Hecke stacks in Fargues–Scholze IX.6.3 uses. The existing node on products and unramified restriction of scalars gives the bijection B(G′) ≅ B(G) by the norm when E′/E is unramified, for the Kottwitz sets only; the statement for the stacks of bundles and for ramified E′/E is not among the statements of the layer. Normalization correction also requested: with the GS0 orbit of μ(ξ), Beauville–Laszlo gluing into the trivial second bundle has κ = +μ♯ and image B(G,μ), with equality of the image for minuscule μ. Reconcile the three current exports grassmannian-kottwitz-sign, modification-newton-bound and minuscule-modification-image with this convention, and supply the inverse-orientation dictionary for modifications from the trivial first bundle to E\_b, whose criterion is \[b\] ∈ B(G,μ⁻¹). The G\_m calculation ξB⁺\_dR ↦ O(−1), κ = +1 fixes the sign (FS II.2.3, pp.60–61; III.2, pp.90–91; VI.2.4, p.199; SW 19.4.2, pp.176–177).

Needed by: `HS4/weil-restriction-hecke-diagram`, `HS0/structure-group-and-inner-form`, `HS2/nonemptiness-and-period-connectedness`, `HS2/adjoint-period-and-tower-comparison`.

### `BunGAndNewtonStrata:BG3`

Parabolic bundles on the relative curve and their dimension theory. For G quasi-split, P a standard parabolic with Levi M: the small v-stacks Bun\_P and Bun\_M with the maps Bun\_P → Bun\_G, π : Bun\_P → Bun\_M and the section ψ : Bun\_M → Bun\_P induced by M ⊂ P. (1) For b with canonical (Harder–Narasimhan) parabolic P and the class b\_M in B(M) with G-antidominant Newton point, Bun\_P^{b\_M} → Bun\_G^b is an isomorphism. (2) Gleason–Lourenço Theorem 2.13 (after Hamann): for standard Levis M ⊂ L with P\_L = P ∩ L, the map Bun\_{P\_L} → Bun\_M is ℓ-cohomologically smooth, and over the stratum of b\_M it has relative ℓ-dimension ⟨2ρ\_L − 2ρ\_M, ν\_b⟩. (3) Their Proposition 2.15: for b in B(M) basic and non-negative, Bun\_P^b contains an open substack T\_b such that T\_b → Bun\_G is ℓ-cohomologically smooth of relative dimension ⟨2ρ\_G − 2ρ\_M, ν\_b⟩ and factors through one stratum, and the complement of T\_b in Bun\_P^b has ℓ-dimension less than ⟨2ρ\_G − 2ρ\_M, ν\_b⟩. (4) Their Lemma 3.3: the nonempty geometric fibres of the map from the P-Grassmannian cell to the fibre product of the M-cell with Bun\_P over Bun\_M are torsors under the unipotent automorphisms of the filtered bundle E\_b, of dimension ⟨2ρ\_G − 2ρ\_M, ν\_b⟩; they are not torsors under a constant group. (5) For the diagram of Fargues–Scholze IX.7.2 (pp. 336–337): for b in B(G) with Harder–Narasimhan parabolic P and every finite set of bounds W, there is N\_0 such that for the classes b\_N, N ≥ N\_0, of the increasingly unstable sequence attached to b and a cocharacter with dynamical parabolic P, every modification of E\_{b\_N} to a bundle isomorphic to E\_{b\_N}, of type bounded by W, is compatible with the Harder–Narasimhan reductions to P; and on the stratum Bun\_P^{b\_N} ≅ Bun\_G^{b\_N} the map π is ℓ-cohomologically smooth, both strata having category of torsion étale sheaves D(G\_b(E),Λ). The existing nodes on the stratum dimension, on the automorphism v-group and on the moduli of filtered G-bundles are the starting point.

Needed by: `HS2/nonemptiness-and-period-connectedness`, `HS4/levi-compatibility`.

### `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`

For E/Q\_p finite and n ≥ 1, the Lubin–Tate tower and the Drinfeld tower constructed independently of local shtukas, as towers of smooth rigid spaces over Ĕ indexed by the compact open subgroups of GL\_n(E), respectively of D^×, with: the deformation problem of formal O\_E-modules they represent at maximal level and the level structures; the commuting actions of GL\_n(E), D^× and the Weil descent datum; the finite étale transition maps; and the Grothendieck–Messing period maps to the flag variety with their images. The identification of these towers with the minuscule local shtuka towers is not requested: it is planned in the consuming node.

Needed by: `HS3/classical-comparison`.

### `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`

(1) The covariant Dieudonné isocrystal of a p-divisible group X over a perfect field k of characteristic p in terms of the contravariant module of the existing classification node: M\_cov(X) = M(X^D) with its Frobenius, of slopes in [0,1], of rank the height of X and with M\_cov(X)/V M\_cov(X) the Lie algebra of X, so that b has Hodge type (1^d, 0^{n−d}) in the convention of Scholze–Weinstein 24.2. (2) The universal vector extension E(X) → X of a p-divisible group over a ring in which p is nilpotent, or over a p-adically complete ring, and Grothendieck–Messing theory in the form used in Scholze–Weinstein 24.2: for a lift of X over a nilpotent divided-power thickening, Lie E(X) is the value of the covariant Dieudonné crystal on the thickening, and lifts of X correspond to lifts of the Hodge filtration Lie E(X) → Lie X.

Needed by: `HS3/classical-comparison`.

### `GeometricSatakeAndFusion:GS0:Schubert-smoothness`

The Białynicki-Birula map of a group that need not be split, over the reflex field, with its equivariance and its values on points over finite extensions, in the generality of Scholze–Weinstein 19.4.2 and Caraiani–Scholze 3.4.5. Let G be a reductive group over a p-adic field E (the consuming nodes use E = ℚ\_p), μ a conjugacy class of cocharacters with reflex field F, Gr\_{G,μ} its Schubert cell over Spd F (after a splitting extension, the L⁺G-orbit of μ(ξ)), and Fl\_{G,μ} the flag variety over F of the parabolic subgroups in the class of P\_μ^-, the parabolic whose Lie algebra is the sum of the non-positive weight spaces of μ (the group of g for which lim\_{t→∞} μ(t)gμ(t)^{-1} exists). (1) Descent and equivariance. The map Gr\_{G,μ} = L⁺G/(L⁺G)\_μ → (G/P\_μ^-)^♦ of the split form, induced by the reduction (L⁺G)\_μ/(L⁺G)\_μ^{≥1} = (P\_μ^-)^♦ of the stabiliser of the cell, commutes with the action of the Galois group of the splitting extension and descends to a map Gr\_{G,μ} → Fl\_{G,μ}^♦ over Spd F, compatible with base change of the leg base. It intertwines the action of L⁺G on the cell with the action of G^♦ on the flag variety through the reduction L⁺G → G^♦; in particular over Spd F̆ it is equivariant for the group G(F̆), which acts on both sides. For minuscule μ, where Gr\_{G,≤μ} = Gr\_{G,μ} because no dominant cocharacter lies strictly below μ, the descended map is an isomorphism Gr\_{G,≤μ} ≅ Fl\_{G,μ}^♦. (2) Points. For every μ and every finite extension L of F̆ the map induces a bijection Gr\_{G,μ}(Spd L) → Fl\_{G,μ}(L). In the orientation of Scholze–Weinstein, Lecture 24, Fl\_{G,μ} is the flag variety that receives the Grothendieck–Messing period map of the datum (G,b,μ) with [b] in B(G,{μ^{-1}}). The supplier's nodes on the open Schubert cell and on the minuscule Białynicki-Birula isomorphism state, for the split form, the reduction of the stabiliser to P\_μ^-, the map to (G/P\_μ^-)^♦ and that it is an isomorphism for minuscule μ over characteristic-zero untilts; the consuming nodes cite them directly, and only what is listed here is requested.

Needed by: `HS2/minuscule-rigidification`, `HS2/classical-period-points`.

### `GeometricSatakeAndFusion:GS1`

From Fargues–Scholze VI.5–VI.6, for C a complete algebraically closed extension of E and X = Div^1: (1) for the affine flag variety over Spd C and its Demazure spaces Dem\_ẇ, which the supplier's node on affine flags and Demazure spaces states over Spd O\_C as iterated bundles in projective lines, proper over the Schubert bound: the action of the positive loop group L⁺𝓘 of the Iwahori on Dem\_ẇ, and the map f\_ẇ : [L⁺𝓘\\Dem\_ẇ] → 𝓗ck\_{G,Spd C/Div^1} = [L⁺G\\Gr\_G] induced by Dem\_ẇ → Fl\_G → Gr\_G and the inclusion of L⁺𝓘 in L⁺G; f\_ẇ is proper, representable in spatial diamonds and of finite dim.trg. (2) The generation statement in the form used in the proof of Fargues–Scholze IX.2.1 (p. 322): for every B in D^ULA(𝓗ck\_{G,Spd C/Div^1}, ℤ\_ℓ), the solid dual B^∨ = RHom(B, ℤ\_ℓ) lies in the smallest full stable subcategory of D\_■(𝓗ck\_{G,Spd C/Div^1}, ℤ\_ℓ) that is closed under colimits (hence under shifts in both directions) and contains the objects (Rf\_{ẇ\*}ℤ\_ℓ)^∨ ≅ f\_{ẇ♮}ℤ\_ℓ. The source states that D^ULA is generated under colimits by the Rf\_{ẇ\*}ℤ\_ℓ and gives no proof; since B ↦ B^∨ is contravariant, the statement is requested on the dual side. Generation by finite colimits and retracts would not suffice in general: passing from Iwahori-equivariant to L⁺G-equivariant kernels along [L⁺𝓘\\Gr] → [L⁺G\\Gr] by a retract needs the unit ℤ\_ℓ → Rπ\_\*ℤ\_ℓ to split, which fails when ℓ is a torsion prime of G, and the Čech nerve of that map gives an infinite colimit of ♮-pushforwards. The supplier's nodes on universally locally acyclic sheaves on the local Hecke stack define the category and, in the node on recognition by constant terms, give its stability under Verdier duality over a one-leg base; the consuming node cites them directly. The properness and smoothness of the global Demazure correspondence over the two bundle factors is planned in the consuming node.

Needed by: `HS0/demazure-generators-of-ULA-kernels`.

### `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`

Extension through ReductiveGroupsIntegralRepresentationsPartII, routed by PAPER-KISIN-PAPPAS-18 and PAPER-KISIN-PAPPAS-ZHOU-26. Until that continuation has designed layers, this request is registered against its existing ReductiveGroups parent layer; the parent itself does not supply the results below. Integral highest-weight theory for the split reductive group Ĝ over Z\_ℓ[√q] with a finite group Q acting through pinned automorphisms, for every prime ℓ ≠ p, with no condition on the torsion of π\_1(Ĝ) and no solvability or order condition on Q, and for every Z\_ℓ[√q]-algebra Λ: (1) every representation of Ĝ^I on a finite projective Λ-module lies in the thick subcategory of Perf(BĜ^I\_Λ) generated by exterior tensor products of representations of Ĝ on finite projective Λ-modules, the reduction used in Fargues–Scholze IX.2.1; (2) every representation of (Ĝ⋊Q)^I on a finite projective Λ-module has a resolution, possibly infinite to the left, by exterior tensor products of |I| such representations of Ĝ⋊Q in which only finitely many weights of Ĝ^I occur, the reduction used in IX.2.3. The good-prime theory of VIII.5 on parameter stacks does not give these statements.

Needed by: `HS0/demazure-generators-of-ULA-kernels`, `HS1/continuous-weil-descent`.

### `PadicHodgeTheory:R06.2`

For L a complete discretely valued field of characteristic 0 with perfect residue field, in particular a finite extension of the completed maximal unramified extension F̆ of a p-adic field F, with C the completion of an algebraic closure of L and G\_L its Galois group (the existing nodes are stated for fields finite over ℚ\_p). (1) Tate's theorem for such L: H⁰(G\_L, C) = L, and H⁰(G\_L, C(i)) = H¹(G\_L, C(i)) = 0 for i ≠ 0. (2) Lattices and filtrations (Viehmann, On Newton strata in the B\_dR⁺-Grassmannian, Theorem 5.2, as quoted by Gleason–Lim–Xu §3.6). For a finite-dimensional L-vector space V\_L, the G\_L-stable B\_dR⁺(C)-lattices Ξ in V\_L ⊗\_L B\_dR(C) correspond bijectively to the exhaustive separated decreasing filtrations of V\_L: to Ξ corresponds the filtration whose i-th step spans, over C, the image of ξ^iΞ ∩ (V\_L ⊗\_L B\_dR⁺(C)) in V\_L ⊗\_L C, and to a filtration the lattice Fil⁰(V\_L ⊗\_L B\_dR(C)). The bijection is compatible with tensor products and exact sequences and matches the relative position of the lattice with the type of the filtration, so that for G reductive over ℚ\_p and a conjugacy class μ with reflex field F the Białynicki-Birula map is a bijection from the points over Spd L of the Schubert cell of μ to Fl\_μ(L), for every finite extension L of F̆. (3) Crystalline representations of G\_L with values in G(ℚ\_p), G reductive over ℚ\_p, as exact tensor functors from Rep\_{ℚ\_p}(G) to crystalline representations, and the filtered isocrystal with G-structure attached to them, with D\_cris normalised as in the existing node on Tate twists (D\_cris(ℚ\_p(1)) = (ℚ̆\_p, p⁻¹σ)). (4) Comparison at a classical point. Let b ∈ G(ℚ̆\_p), let x be a point over Spd L of the Schubert cell of μ, with filtration Fil\_x, and for V in Rep\_{ℚ\_p}(G) let E\_x(V) be the modification of the vector bundle E\_b(V) on the Fargues–Fontaine curve of C^♭, at the point defined by C, given by the lattice x(V). Then E\_x(V) is semistable of slope 0 if and only if the filtered isocrystal (V ⊗ ℚ̆\_p, bσ, Fil\_x(V)) over L is weakly admissible, and in that case the global sections of E\_x(V), with the action of G\_L, form the crystalline representation with this filtered isocrystal (Colmez–Fontaine: weakly admissible implies admissible, for such L and in the Tannakian form; the statement used in Gleason–Lim–Xu §3.5–3.6). Consequently the filtered isocrystals of all V are weakly admissible if and only if the G-bundle E\_x has a basic class with Newton point 0. The bundle E\_x is trivial if and only if, in addition, its Kottwitz invariant vanishes, that is κ\_G(b) = μ^♮ in the orientation of Gleason–Lim–Xu (κ\_G(b) = −μ^♮ in the orientation of Scholze–Weinstein); in that case the fibre at x of the universal G(ℚ\_p)-torsor of trivialisations of E\_x is the G(ℚ\_p)-valued crystalline representation attached to (b, Fil\_x). Without the condition on the Kottwitz invariant, triviality of E\_x is not equivalent to weak admissibility: for T the norm-one torus of a quadratic extension of ℚ\_p, μ = 0 and b the non-trivial class of B(T) = ℤ/2, every filtered isocrystal (V ⊗ ℚ̆\_p, bσ, trivial filtration) is weakly admissible and E\_b is not trivial. All four statements concern points over such fields L only.

Needed by: `HS2/classical-period-points`, `HS2/admissible-period-torsor`.

### `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`

For H a locally pro-p group (here J\_b(E) and G(E)) and Λ a ℤ\_ℓ-algebra with ℓ ≠ p: the enhanced derived category D(H,Λ) of smooth representations on Λ-modules; for K an open pro-p subgroup, the exact functor of K-invariants and its derived form, which commutes with filtered colimits; every object of D(H,Λ) is the filtered colimit of its invariants under the open pro-p subgroups; the definition of an admissible complex as one whose K-invariants are a perfect complex of Λ-modules for every open pro-p subgroup K; the derived Hom of smooth representations and the smooth dual ρ ↦ ρ^∨ = colim\_K RHom\_Λ(ρ^K,Λ); an admissible complex is reflexive, ρ ≅ (ρ^∨)^∨, and its smooth dual is admissible.

Needed by: `HS3/compact-support-at-levels`, `HS3/admissibility-duality-and-adjunction`.

### `SmoothRepresentationsOfLocalGroups:SR.1`

For compact open K′ ⊂ K in a locally pro-p group H and Λ with p invertible: restriction and corestriction between K- and K′-invariants with cores∘res = [K:K′]; for K′ normal in K, res∘cores equal to the sum over K/K′; transitivity for K″ ⊂ K′ ⊂ K; the Hecke algebra of level K as the endomorphism algebra of the compact induction from K, with the maps c-Ind\_{K′}^H Λ → c-Ind\_K^H Λ, 1\_{gK′} ↦ 1\_{gK}, and c-Ind\_K^H Λ → c-Ind\_{K′}^H Λ, 1\_{gK} ↦ Σ\_{k∈K/K′} 1\_{gkK′}, inducing on Hom\_H(−,π) the inclusion π^K ⊂ π^{K′} and the trace π^{K′} → π^K; an open subgroup of a pro-p group has p-power index, so that averaging by [K:K′]^{-1} is defined when K is pro-p, and only when the index is invertible in Λ in general.

Needed by: `HS3/compact-support-at-levels`, `HS3/admissibility-duality-and-adjunction`, `HS3/level-trace-and-pullback`.

### `SmoothRepresentationsOfLocalGroups:SR.2`

Compact induction c-Ind\_K^H Λ from an open subgroup K of a locally pro-p group H, for a Z\_ℓ-algebra Λ, ℓ ≠ p: Frobenius reciprocity Hom\_H(c-Ind\_K^H Λ, ρ) = ρ^K, and its derived form RHom\_H(c-Ind\_K^H Λ, ρ) = ρ^K for K pro-p; for K pro-p the object c-Ind\_K^H Λ is compact and projective, and these objects generate D(H,Λ); transitivity of compact induction for K′ ⊂ K.

Needed by: `HS3/hecke-cohomology-comparison`, `HS3/compactness-of-shtuka-cohomology`, `HS3/general-bound-compactness`, `HS3/admissibility-duality-and-adjunction`.

### `VStackSheavesAndLisseCategories:VS2`

Compatibility of relative homology with restriction of scalars (Fargues–Scholze Proposition VII.3.1(ii)). Let Λ → Λ′ be a homomorphism of discrete ℤ\_ℓ-algebras, regarded as solid ℤ\_ℓ-algebras, and r: D\_■(−,Λ′) → D\_■(−,Λ) restriction of scalars. For every map f: Y → X of small v-stacks the natural map f\_♮∘r → r∘f\_♮ of functors D\_■(Y,Λ′) → D\_■(X,Λ) is an isomorphism; equivalently, f\_♮ on Λ′-modules is computed on the underlying Λ-modules. Together with r∘f^\* ≅ f^\*∘r and r(M ⊗^■\_{Λ′} (N ⊗^■\_Λ Λ′)) ≅ r(M) ⊗^■\_Λ N, which are formal, this gives r(T\_{V′}(B)) ≅ T\_V(r(B)) for the Hecke operators. The node of the layer on relative solid homology states the adjunction f\_♮ ⊣ f^\*, base change, the projection formula and comparison maps of f\_♮ with extension and with restriction of coefficients; that the comparison map for restriction of scalars is an isomorphism is not asserted in its statement.

Needed by: `HS1/coefficient-base-change`.

### `VStackSheavesAndLisseCategories:VS4`

Three statements on lisse sheaves on Bun\_G, for Λ a discrete ℤ\_ℓ-algebra regarded as the condensed ring ℤ\_ℓ ⊗\_{ℤ\_ℓ,disc} Λ, which the existing nodes of the layer (coefficients on strata, the left adjoint of stratum restriction, Harder–Narasimhan localisation, compact generation) do not state. (1) The computation in the proof of Fargues–Scholze Proposition VII.7.2 (p. 272) with condensed structure. For b in B(G), K ⊂ G\_b(E) open pro-p, the chart f\_K: M̃\_b/K → Bun\_G, every profinite set S and every B′ in D\_lis(M̃\_b/K × S,Λ), restriction to the closed substack [∗/K] × S induces an isomorphism RΓ(M̃\_b/K × S, B′) ≅ RΓ([∗/K] × S, B′), compatibly with pullback in S; that is, RΓ(M̃\_b/K, B′) → RΓ([∗/K], B′) is an isomorphism of condensed objects. The source obtains it from the proof of VII.7.2, the solid partial-support vanishing of VII.2.10 being valid over every base. (2) Compact induction as relative homology. For H = G\_b(E), K ⊂ H an open subgroup and g: [∗/K] → [∗/H]: an equivalence D\_lis([∗/K],Λ) ≅ D(K,Λ) compatible with D\_lis([∗/H],Λ) ≅ D(H,Λ), under which g^\* is restriction of representations, so that g\_♮ is compact induction and g\_♮Λ = c-Ind\_K^H Λ; and for open K′ ⊂ K the unit and the counit of the two adjunctions for [∗/K′] → [∗/K] induce the maps c-Ind\_K^H Λ → c-Ind\_{K′}^H Λ, 1\_{gK} ↦ Σ\_{k∈K/K′} 1\_{gkK′}, and c-Ind\_{K′}^H Λ → c-Ind\_K^H Λ, 1\_{gK′} ↦ 1\_{gK}. The existing node on the left adjoint of stratum restriction gives only the image f\_{K♮}Λ of c-Ind\_K^H Λ for K pro-p. (3) Extension by zero along a stratum. Let i^b: Bun\_G^b → Bun\_G be a stratum, closed in an open substack j: U → Bun\_G with open complement j′: U′ → U, and i: Bun\_G^b → U the closed immersion. Requested: the functor i^b\_! := j\_♮∘i\_{lis\*} on D\_lis, with i^{b\*}i^b\_! ≅ id; the excision triangle j′\_♮j′^\*A → A → i\_{lis\*}i^\*A for A in D\_lis(U,Λ); preservation of compact objects by i^b\_!; and RHom\_lis(i^b\_!B,Λ) ≅ Ri^b\_{lis\*}RHom\_lis(B, i^{b!}Λ), where i^{b!}Λ is invertible and concentrated in cohomological degree 2⟨2ρ,ν\_b⟩ (for b basic, i^b is an open immersion and i^{b!}Λ = Λ). The existing nodes give the semi-orthogonal decomposition through the left adjoint π\_{b♮}q\_b^\* of i^{b\*}, and Ri^b\_{lis\*} and Rj\_{lis\*} as right adjoints of pullback; the functor i^b\_! and its dual are not among their statements.

Needed by: `HS1/condensed-enrichment`, `HS3/hecke-cohomology-comparison`, `HS3/admissibility-duality-and-adjunction`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`

Cited as it stands, for every nonarchimedean local field E in either characteristic: the Weil group W\_E as a topological group with the Weil topology, locally compact and totally disconnected, with open inertia subgroup carrying its profinite topology and the degree homomorphism W\_E → ℤ with kernel the inertia subgroup; and for a finite extension F/E (the reflex fields of the bounds) the continuous injection W\_F → W\_E with open image of index [F:E]. The condensed group attached to W\_E and its classifying stack are formed in the consuming nodes from the v-sheaf of continuous maps to a topological space; nothing is requested to be added to the layer.

Needed by: `HS1/condensed-enrichment`, `HS1/continuous-weil-descent`, `HS2/weil-descent-datum`.

### `GeometricSatakeAndFusion:GS3:fusion`

Fusion on the convolution space: for the convolution Beilinson–Drinfeld Grassmannian over (Div^1)^2 with its map m to the Beilinson–Drinfeld Grassmannian, and Satake objects A\_1, A\_2, the twisted exterior product on the convolution space is universally locally acyclic and flat perverse over the leg base, restricts to A\_1 ⊠ A\_2 over the complement of the diagonal, and is the unique universally locally acyclic extension of that restriction; the same for chains of any finite length. This is the statement on the chain space that the fusion product is built from before pushing forward along m.

Needed by: `HS3/satake-coefficients-and-partial-frobenius`.

### `ReductiveGroupsPartII:RG2.0`

For G a linear algebraic group over a nonarchimedean local field E of residue characteristic p, with the topology on G(E) of the layer: (1) G(E) is a locally profinite group, and a closed embedding G → GL\_n identifies it with a closed subgroup of GL\_n(E); (2) the subgroups G(E) ∩ (1 + π^m M\_n(O\_E)), m ≥ 1, are compact open pro-p subgroups forming a neighbourhood basis of the identity, so that the open pro-p subgroups are cofinal among the compact open subgroups and [K:K′] is finite for compact open K′ ⊂ K; (3) a smooth homomorphism f : G → H of linear algebraic groups over E induces an open map G(E) → H(E), so that the image of a compact open subgroup is compact and open in f(G(E)), and open in H(E) when f is surjective and smooth (applied to det : G → G/G^der).

Needed by: `HS2/levels-and-tower-limit`, `HS2/torus-products-and-determinant`.

### `SmoothRepresentationsOfLocalGroups:SR.3`

For G reductive over E and coefficients an algebraically closed field of characteristic 0 (applied to ℚ̄\_ℓ): (1) the category of smooth representations of G(E) is noetherian (a subrepresentation of a finitely generated representation is finitely generated) and has finite global dimension (Bernstein), so that an object of the derived category is compact if and only if it is bounded with finitely generated cohomology; (2) irreducible smooth representations are admissible, hence a representation of finite length is admissible and its smooth dual has finite length; (3) a finitely generated admissible representation has finite length (Howe; Renard, Représentations des groupes réductifs p-adiques, VI.6.3). These are used for the finite-length statement with ℚ̄\_ℓ-coefficients after Fargues–Scholze IX.3.1 (p. 325) and are not asserted for other coefficient rings.

Needed by: `HS3/admissibility-duality-and-adjunction`.

### `GeometricSatakeAndFusion:GS4:integral-dual-group`

Three statements about the normalised Satake functor V ↦ S\_V and its solid form V ↦ S′\_V = D(S\_V)^∨, for ℓ ≠ p and Λ a ℤ\_ℓ[√q]-algebra. (1) Convergence on resolutions with finitely many weights (Fargues–Scholze, proof of IX.2.3, p. 323). Let V be a representation of (Ĝ⋊Q)^I on a finite projective Λ-module and ⋯ → V\_2 → V\_1 → V\_0 → V → 0 an exact complex of such representations in which only finitely many weights of Ĝ^I occur. Then S′\_V is the colimit over n of the objects S′\_{σ\_{≥−n}V\_•} of D\_■(𝓗ck^I\_G,Λ) attached by the perfect-complex extension to the truncations σ\_{≥−n}V\_• = [V\_n → ⋯ → V\_0]; equivalently the cofibres of S′\_{σ\_{≥−n}V\_•} → S′\_V, which are shifts by n+1 of the objects S′\_{Z\_n} for the kernels Z\_n = ker(V\_n → V\_{n−1}), have colimit 0. All S\_{V\_n} are supported on one bounded closed substack. (2) Weil restriction with matched half twists (Fargues–Scholze IX.6.3, pp. 331–332). Let E′/E be finite separable with residue degree f, G′ reductive over E′, G = Res\_{E′/E} G′, and take √q′ := (√q)^f as square root of q′ = q^f. For V′ a representation of (Ĝ′⋊W\_{E′})^I on a finite projective Λ-module factoring through a finite quotient, and V the induction to (Ĝ⋊W\_E)^I of its inflation to (Ĝ⋊W\_{E′})^I, there is a natural isomorphism ψ\_\*S\_{V′} ≅ S\_V, where ψ is the composite of the closed immersion of local Hecke stacks over (Div^1\_{E′})^I with the finite étale map to (Div^1\_E)^I, compatible with fusion and with maps of finite sets. With this choice the half Tate twist Λ(1/2) for E restricts on W\_{E′} to the one for E′, because deg\_E(w) = f·deg\_{E′}(w) for w in W\_{E′} and therefore (√q)^{deg\_E(w)} = (√q′)^{deg\_{E′}(w)}; for the other square root −(√q)^f the two half twists differ by the unramified character w ↦ (−1)^{deg\_{E′}(w)} of W\_{E′}, and the comparison holds only after twisting V′ by this character on the components where ⟨2ρ,μ⟩ is odd. The source states the comparison and gives no proof. (3) Restriction to the Weil group of a finite extension, used for bounds whose field of definition is larger than E (Fargues–Scholze IX.3, p. 325, use Satake sheaves of such bounds without comment). Let F\_i/E, i ∈ I, be finite separable extensions inside the separable closure, with residue degrees f\_i. The local Hecke stack of G over ∏\_i Div^1\_{F\_i} is the base change of the local Hecke stack over (Div^1\_E)^I along ∏\_i Div^1\_{F\_i} → (Div^1\_E)^I. Requested: an exact Λ-linear functor V′ ↦ S\_{V′} from the representations of ∏\_i (Ĝ⋊W\_{F\_i}) on finite projective Λ-modules that factor through finite quotients of the W\_{F\_i} to universally locally acyclic sheaves on this base change, together with isomorphisms, natural in V and compatible with fusion and with towers of extensions, between the pullback of S\_V and S\_{V′} for V a representation of (Ĝ⋊W\_E)^I and V′ its restriction to ∏\_i (Ĝ⋊W\_{F\_i}); for I a singleton, S\_{V′} is the Satake sheaf of the group G ⊗\_E F\_1 over F\_1, formed with the square root (√q)^{f\_1} of the cardinality of the residue field of F\_1. Consequence used: an idempotent endomorphism of the restricted representation acts on the pullback of S\_V and cuts out a direct summand. For a conjugacy class μ\_i with field of definition F\_i, the highest-weight representation V\_{μ\_i} of Ĝ⋊W\_{F\_i} is a direct summand of the restriction of its induction to Ĝ⋊W\_E, and its Satake sheaf over Div^1\_{F\_i} is the corresponding direct summand of the pullback of the Satake sheaf of the induced representation.

Needed by: `HS1/continuous-weil-descent`, `HS4/weil-restriction-hecke-diagram`, `HS3/satake-coefficients-and-partial-frobenius`.

### `SmoothRepresentationsOfLocalGroups:SR.6`

For G a reductive group over a nonarchimedean local field E of residue characteristic p (applied to J\_b over ℚ\_p), a prime ℓ ≠ p and K ⊂ G(E) a compact open pro-p subgroup: the Hecke algebra ℤ\_ℓ[K\\G(E)/K] is a finitely generated module over its centre, and the centre is a finitely generated ℤ\_ℓ-algebra (Dat–Helm–Kurinczuk–Moss, Finiteness for Hecke algebras of p-adic groups, Theorem 1.1, stated there for noetherian ℤ\_ℓ-algebras of coefficients); in particular these Hecke algebras are noetherian (Corollary 1.4 of the same paper, stated for every compact open subgroup and every noetherian ℤ[1/p]-algebra of coefficients). Consequence requested in the form used: every subrepresentation of a finitely generated smooth ℤ\_ℓ[G(E)]-module is finitely generated, so that the cohomology groups of a bounded complex whose terms are finite direct sums of representations c-Ind\_K^{G(E)} ℤ\_ℓ, K open pro-p, and of its direct summands, are finitely generated smooth representations.

Needed by: `HS3/compactness-of-shtuka-cohomology`.

### `VStackSheavesAndLisseCategories:VS0`

Exceptional direct image along a cohomologically smooth, non-representable map on one stratum, in the situation of the proof of Fargues–Scholze IX.7.2 (p. 336). Let Λ be killed by a power of ℓ, G quasisplit, P a parabolic with Levi M, b\_N a class whose Harder–Narasimhan parabolic is P, and π : Bun\_P^{b\_N} → Bun\_M^{b\_M} the restriction of Bun\_P → Bun\_M to the stratum, a cohomologically smooth map of Artin v-stacks whose fibres are classifying stacks of unipotent group diamonds, with section ψ. For Rπ\_! the left adjoint of Rπ^! = Rπ^!Λ ⊗ π^\* (the existing node on smooth stacky maps): (1) Rπ\_! and Rψ\_! are mutually inverse equivalences between D\_ét(Bun\_P^{b\_N},Λ) and D\_ét(Bun\_M^{b\_M},Λ), where Rψ\_! is the direct image with proper support of the representable map ψ; (2) for maps f, f′ representable in locally spatial diamonds, compactifiable and of locally finite dim.trg, and g such that π∘f = f′∘g with all four maps defined over the strata, a natural isomorphism Rπ\_!Rf\_! ≅ Rf′\_!Rg\_! compatible with composition of such squares; (3) base change of Rπ\_! along maps representable in locally spatial diamonds into Bun\_M^{b\_M}. On the stratum all categories of sheaves involved are equivalent to D(G\_b(E),Λ), which is the reason the source gives for the existence of Rπ\_!; the compatibilities (1)–(3) are what its diagram chase uses and are not consequences of the definition (Fargues–Scholze Remark IV.1.14).

Needed by: `HS4/levi-compatibility`.

### `GeometricSatakeAndFusion:GS0:loop-geometry`

Two statements over the generic leg base; no statement over the integral leg base is requested. (1) The convolution Beilinson–Drinfeld Grassmannian over a product of leg bases and its Schubert varieties, in the generality of Scholze–Weinstein 20.1.4 and 20.4.2–20.4.5 extended to a general E. For conjugacy classes μ\_1,…,μ\_m with reflex fields F\_i: the v-sheaf over ∏ Spd F\_i of chains of G-torsors P\_1,…,P\_m with P\_1 trivialised off the first leg and P\_i ≅ P\_{i−1} off the i-th leg, meromorphically. (a) It is a small v-sheaf over ∏ Spd F\_i, and it and the Beilinson–Drinfeld Grassmannian are partially proper over ∏ Spd F\_i (20.4.3). (b) Its Schubert subfunctor of successive relative positions bounded by μ\_i is a locally spatial diamond, proper and representable in spatial diamonds over ∏ Spd F\_i (20.4.5). (c) The map forgetting the intermediate torsors sends it into the Beilinson–Drinfeld Schubert variety bounded by Σ\_{j : legs j and i coincide} μ\_j at the i-th leg, is proper and a surjection of v-sheaves onto it, and is an isomorphism over the locus of pairwise distinct legs (20.1.4 for coinciding legs, 20.4.5(1),(2) in general): in particular, at a geometric point with all legs equal, if g\_j lies in the double coset of λ′\_j(ξ) for some λ′\_j ≤ λ\_j, then g\_m⋯g\_1 lies in the double coset of ν(ξ) for some ν ≤ Σ λ\_j, and every element of such a double coset is a product of this kind. The supplier's nodes state the Beilinson–Drinfeld Grassmannian as a small v-sheaf, its pullback to ordered legs with the product decomposition over disjoint legs, and its Schubert varieties, closed, proper and representable in spatial diamonds, with bounds that add at collisions; the bounded convolution tower and its surjective multiplication map occur only inside the proofs of the properness nodes, and the composition map of two modifications is stated only for the Hecke stack over one divisor base, in the node on the ambient Hecke convolution, which rests on the Satake category. (2) Finite dim.trg (Fargues–Scholze VI.2.7). For split G and every tuple μ• of dominant cocharacters, the projection Gr\_{G,Div^d,≤μ•} → Div^d of the bounded Beilinson–Drinfeld Grassmannian is of finite dim.trg over the generic base Div^d\_Y and over Div^d\_X; hence also after pullback to the ordered legs (Div^1)^d and, by descent along a splitting cover, for the bound attached to a Galois-stable set of cocharacters of a general G. The node on generic Schubert bounds states closedness, properness and representability in spatial diamonds of these projections, and no node bounds dim.trg.

Needed by: `HS0/descent-and-bounded-fibres`, `HS0/chains-and-composition`, `HS0/twisted-period-grassmannian`.

## Gaps

Each gap names a missing input that no layer of the atlas plans, and the nodes whose proofs need it.

### Classical O\_E-linear and EL/PEL comparison inputs

Inputs of Scholze–Weinstein 24.2.5 and 24.3.5 that no layer states, or that are stated in special cases only. (1) The Rapoport–Zink deformation spaces themselves: representability of the deformation functor of a p-divisible group with EL or PEL structure by a formal scheme locally formally of finite type (Scholze–Weinstein Theorem 24.2.2 and Proposition 24.3.4, after Rapoport–Zink), its rigid generic fibre, the étale Grothendieck–Messing period map (Rapoport–Zink 5.17) and the tower of level structures. Two families are planned: the Lubin–Tate and Drinfeld cases, with the two-tower layer; and, with the layer on Igusa varieties and local PEL data, the unramified local PEL data of type (A) or (C), for which the representability by a formally smooth formal scheme over Spf O\_Ĕ, the generic fibre and its finite étale covers by level structures are stated. Planned by no existing layer: EL and PEL data that are ramified or of parahoric, non-hyperspecial level; a statement of representability for a p-divisible group without additional structure (its space is used at infinite level in that layer without such a statement); and the Grothendieck–Messing period map outside the Lubin–Tate and Drinfeld cases. The routing of the Scholze–Weinstein lectures (extraction PAPER-SCHOLZE-WEINSTEIN-20, items 172–175) assigns the Rapoport–Zink spaces for GL\_n and for EL and PEL data, and their comparison with local shtuka spaces, to the continuation of this roadmap on integral models (HeckeStacksAndLocalShtukasIntegralPartII); it has no layers yet, so no node can be cited for them. (2) The description of the image of the period map (Scholze–Weinstein, Moduli of p-divisible groups, Theorem 6.2.1; Faltings) and Rapoport–Zink 5.37 identifying the fibres with lattices in the universal local system. (3) Dieudonné theory over O\_C/p and A\_cris: for a p-divisible group X over O\_C with Tate module T and a quasi-isogeny from 𝕏 over O\_C/p, the induced map of covariant Dieudonné modules over A\_cris gives a map T ⊗ 𝒪 → E\_b of bundles on the Fargues–Fontaine curve which factors through the modification of E\_b defined by the Hodge filtration and is an isomorphism onto it (the same paper, Proposition 5.1.6); the Dieudonné layer plans deformations over nilpotent thickenings only. (4) For 24.3.5: a 𝒢-torsor on the punctured spectrum of A\_inf that is trivial after inverting ξ is trivial, hence extends to the whole spectrum, for the parahoric 𝒢 (Scholze–Weinstein Theorem 21.2.2, after Anschütz). (5) For E ≠ Q\_p: the towers of formal O\_E-modules are the Rapoport–Zink spaces of the EL datum with group Res\_{E/Q\_p} GL\_n, so 24.3.5 compares them with Q\_p-shtukas for Res\_{E/Q\_p} GL\_n; the identification of these with the E-shtukas for GL\_n of the general-field node (compatibly with levels, the two group actions and Weil descent) is stated in none of the sources. The covariant convention for b, the periodic lattice chains, the determinant condition and the polarisation in the PEL case are kept as hypotheses.

Needed by: `HS3/classical-comparison`.

### Comparison of classical and diamond compact support, and duality in dimension d

Two statements that no layer states. (1) For X a separated taut rigid space locally of finite type over Spa(C,O\_C), U ⊂ X a quasi-compact open and n prime to p, Huber’s compactly supported cohomology RΓ\_c(U, Z/n), defined through the universal compactification, agrees with the compactly supported cohomology of the diamond of U defined through the canonical compactification, naturally in U, compatibly with the equivalence of étale sites, with change of n and with the traces of finite étale maps. The classical side and the diamond side are each stated by supplier nodes; the layer on the exceptional inverse image covers formal identities only, and the classical layer does not mention diamonds. (2) For f smooth of pure dimension d between rigid spaces, a canonical isomorphism Rf^!Λ ≅ Λ(d)[2d] of the diamond dualizing complex, compatible with the trace; the diamond layers prove cohomological smoothness of smooth analytic maps and compute the ball, and the classical layer plans trace and Poincaré duality for curves only. Statement (2) is what gives f\_{K♮}Λ ≅ RΓ\_c(M\_K,Λ)[2d\](d) for the local Shimura variety, of dimension d = ⟨2ρ,μ⟩. Applied to the minuscule Schubert cell Gr\_{G,μ}, the diamond of the flag variety, statement (2) is also what gives the normalisation S\_W = Λ[d\](d/2), S′\_W = Λ[−d\](−d/2) of the Satake kernel: the cell is known to be cohomologically smooth of ℓ-dimension d, and the identification of its dualizing complex with Λ(d)[2d] is the missing part.

Needed by: `HS3/huber-cohomology-comparison`, `HS3/satake-coefficients-and-partial-frobenius`.

### Connectedness and density after removing a locus of smaller dimension

The consuming proof reduces connectedness and density of the admissible locus to a bound on the dimension of its complement (Gleason–Lourenço, proof of Theorem 3.2). Two statements are needed and no layer of the atlas states either. (1) Connectedness: for a connected, cohomologically smooth, partially proper diamond X over Spd C of pure dimension d and a closed subset Z of dimension less than d, the complement X ∖ Z is connected; Gleason–Lourenço quote it from Hansen, Moduli of local shtukas and Harris's conjecture, Corollary 4.11. Hansen's paper was not read; the hypotheses must be taken from it. (2) Density, which the quoted criterion does not contain: a locally closed subset of ℓ-dimension less than d of a cohomologically smooth diamond of pure ℓ-dimension d over Spd C contains no non-empty open subset, so that the complement of Z is dense. The layer on universal local acyclicity and Drinfeld's lemma does not cover these statements, and the layers on cohomological smoothness and biduality state neither them nor the duality between H^0 and top compactly supported cohomology from which (1) follows.

Needed by: `HS2/nonemptiness-and-period-connectedness`.

### Dimension theory for stacky maps used in the connectedness proof

Gleason–Lourenço, Section 2, bound ℓ-cohomological dimensions of maps of Artin v-stacks that are not representable (Bun\_P → Bun\_G, strata of Bun\_G, quotients of Schubert cells), using the proper pushforward of such maps: their Definition 2.1 and Lemmas 2.3–2.5 rest on Gulotta–Hansen–Weinstein, An enhanced six-functor formalism for diamonds and v-stacks, Theorem 1.4, for the class of fine morphisms. The atlas plans exceptional functors for stacky maps only in the restricted range of the layer on Artin v-stacks, which excludes a general lower-shriek functor for non-representable maps. Either that formalism is added to a supplier, or the dimension bounds are reproved with atlases and the smooth-base-change properties already planned; neither is done.

Needed by: `HS2/nonemptiness-and-period-connectedness`.

### Open connected components of finite-level local shtuka spaces for non-minuscule μ

Needed: for G reductive over Q\_p, [b] ∈ B(G,μ⁻¹), μ not minuscule, C a complete algebraically closed extension of F̆ and at least one compact open K ⊂ G(Q\_p), every connected component of |Sht\_{G,b,μ,K} ×\_{Spd F̆} Spd C| is open. With this, statement (N) of the node gives transitivity of G(Q\_p) on π₀(Sht\_{G,b,μ,∞} × Spd C). Two routes. (i) Sht\_{G,b,μ,K} is étale over Gr\_{G,≤μ}; it suffices that Gr\_{G,≤μ} × Spd C is locally connected and that local connectedness passes to diamonds étale over it (an étale map is locally an open immersion into a finite étale cover, and a finite étale cover of a connected open has finitely many components, all open). On the open cell local connectedness should follow from its structure of iterated fibration in affine lines over the flag variety; at boundary points it is a unibranch property of the Schubert variety, to be supplied with the Schubert geometry of GS0. (ii) Gleason–Lim–Xu, Theorem 3.9 (Gleason): for parahoric K the specialisation map gives a bijection from π₀(Sht\_{G,b,μ,K} × Spd C\_p) to π₀ of the affine Deligne–Lusztig variety, which is discrete; this uses the integral model and its local model, which no stage of this roadmap plans. For minuscule μ nothing is missing: the finite levels are rigid spaces.

Needed by: `HS2/component-transitivity-source-gate`.

### Compactness of the level colimit for compact ρ

Fargues–Scholze IX.3.2 asserts that colim\_K RHom\_{J\_b(E)}(C\_K,ρ) = i^{1\*}T\_{W^∨}(Ri^b\_\*[ρ]) is a compact object of D(G(E),Λ) whenever ρ is compact; the argument it refers to covers Λ = Q̄\_ℓ and ρ of finite length. Missing input: for ρ compact in D(J\_b(E),Λ), the stalks i^{b′\*}Ri^b\_\*[ρ] are compact objects of D(J\_{b′}(E),Λ) for the finitely many strata b′ of the bundles that admit a modification from E\_1 bounded by μ•; equivalently, the restriction of Ri^b\_\*[ρ] to a quasicompact open substack of Bun\_G containing these strata is compact. For Λ killed by a power of ℓ this is Hamann–Hansen–Scholze, Geometric Eisenstein series I: finiteness theorems (arXiv:2409.07363v1), Theorem 1.3.1 and Theorem 7.1.4: for a compact object A of D(G\_b(E),Λ) the stalks of i\_{b\*}A are compact. It is proved there through finiteness properties of geometric Eisenstein series and constant terms, and no layer of the atlas states it or plans these functors. For Λ not killed by a power of ℓ the six-functor formalism that the paper uses is not available in the literature (its footnote 1), and the statement is not proved in the sources read, apart from the case Λ = Q̄\_ℓ with ρ of finite length treated in the consuming node.

Needed by: `HS3/admissibility-duality-and-adjunction`.

### Geometric description of Hecke operators from a non-basic stratum

For b′ not basic the object C^{b′,b}\_{K′}(V) = i^{b\*}T\_V(f\_{K′♮}Λ) of HS3/hecke-operators-between-strata is defined and compact, but no source identifies it with the relative homology, with coefficients in the solid Satake kernel, of a quotient of the space of framed modifications between E\_{b′} and E\_b of HS2/framed-bundle-fibres: the chart M\_{b′} → Bun\_G is not the stratum, and the group Aut(E\_{b′}) has a positive-dimensional unipotent part. Missing statement: for K′ ⊂ G\_{b′}(E) open pro-p, a description of i^{b\*}T\_V(π\_{b′♮}q\_{b′}^\*c-Ind\_{K′}Λ) as f\_♮ of S′\_V on the fibre product of M\_{b′,K′} with the Hecke correspondence over Bun\_G^b, and its comparison with the modification space of E\_{b′} and E\_b divided by K′ and the unipotent radical. For basic b′ the description follows from the inner-form equivalence and the case b′ = 1.

Needed by: `HS3/hecke-operators-between-strata`.

### Non-emptiness of the weakly admissible locus (Rapoport–Viehmann, Proposition 3.1)

Needed, for μ not minuscule: for G reductive over ℚ\_p, b in G(ℚ̆\_p) and a conjugacy class μ of cocharacters with reflex field F such that [b] lies in B(G,μ⁻¹) in the orientation of Scholze–Weinstein (in B(G,μ) in the orientation of the node on classical period points), there are a finite extension L of F̆ and a point x of the flag variety Fl\_μ(L) such that for every V in Rep\_{ℚ\_p}(G) the filtered isocrystal (V ⊗ ℚ̆\_p, bσ, Fil\_x) is weakly admissible; equivalently, the weakly admissible locus of the flag variety over F̆, an admissible open subset, is not empty. The consuming proof takes this from Rapoport–Viehmann, Towards a theory of local Shimura varieties, Proposition 3.1, which Howe–Klevdal quote in the proof of their Proposition 7.3.3 for the existence of a classical point of the admissible locus. The paper of Rapoport–Viehmann was not read; its hypotheses and the orientation of the filtration must be taken from it. Combined with the bijection between weakly admissible points of the flag variety and admissible points of the Schubert cell over finite extensions of F̆, which holds when κ(b) = −μ^♮ in the orientation of Scholze–Weinstein, it gives the implication [b] ∈ B(G,μ⁻¹) ⇒ Gr^a\_μ ≠ ∅ and statement (b) of the node on non-emptiness. For minuscule μ nothing is missing any more: the layer on the stack of bundles and its cover now states that every class of B(G,μ⁻¹) is the class of a modification of the trivial bundle at a geometric point of the flag variety (Caraiani–Scholze Remark 3.5.8, after Rapoport), which gives Gr^a\_μ ≠ ∅ after inverting the modification, and a non-empty open subset of the rigid flag variety over F̆ has points over finite extensions of F̆. For μ not minuscule no layer states the implication: the layer on period functors and admissibility covers the equivalence of weak admissibility and admissibility for a given filtered module, not the existence of a weakly admissible filtration of prescribed type; the layer on Kottwitz and Newton invariants covers the set B(G,{μ}) only; and the layer on the stack of bundles and its cover states, for general μ, only the opposite implication, that non-emptiness forces [b] ∈ B(G,μ⁻¹) (Caraiani–Scholze 3.5.3).

Needed by: `HS2/nonemptiness-and-period-connectedness`.

### Supplier normalization of the Beauville–Laszlo map

The three BG2 exports named in the request use κ = −μ♯ and B(G,μ⁻¹) for the GS0 orbit μ(ξ), while GS0 fixes the first lattice relative to the trivial second lattice. In this convention the G\_m point ξ yields O(−1), κ = +1, so the required exports have κ = +μ♯ and image B(G,μ). The existing exports have been removed from the prerequisites of the three consumers and replaced by the BG2 stage request. The mathematical sign in this packet is fixed; implementation remains conditional on the corrected supplier exports and their inverse-orientation dictionary. See source issue E1 (FS III.3.6(ii), p.100), the request, and its rank-one computation.

Needed by: `HS0/structure-group-and-inner-form`, `HS2/nonemptiness-and-period-connectedness`, `HS2/adjoint-period-and-tower-comparison`.

## Proposed changes of structure

These proposals concern the boundaries between this roadmap and its neighbours. The plan above works with the current structure.

### Proposal 1 (rescope): `HeckeStacksAndLocalShtukas`, `EndoscopicTransferAndUnitaryTraceComparison`, `ExcursionOperatorsAndSpectralAction`

The comparison of the classical towers of p-divisible groups with minuscule local shtuka towers (Scholze–Weinstein 24.2.5 and 24.3.5) is named by three layers and owned by none: the two-tower layer exports its towers 'to HS3's Hecke-fibre comparison', HS2 only matches known moduli 'in examples', and the GL\_n comparison layer of the excursion roadmap imports 'HS2–HS3's identification'. HS2 is a prerequisite of the two-tower layer, so the comparison cannot sit in HS2. The comparison needs the Rapoport–Zink spaces themselves, and the routing of the Scholze–Weinstein lectures in the paper catalogue (extraction PAPER-SCHOLZE-WEINSTEIN-20, items 172–175) sends these spaces for GL\_n and for EL and PEL data, together with both comparison theorems, to the continuation of this roadmap on integral models (HeckeStacksAndLocalShtukasIntegralPartII), which has no layers yet. This packet states the comparison as the node HS3/classical-comparison, so that the layers consuming HS3 have an exact statement to cite, with the two-tower layer as supplier of the independently constructed Lubin–Tate and Drinfeld towers and the remaining inputs recorded as a gap. A second possibility is that the two-tower layer owns the comparison, since it already requires HS2.

**Proposal.** Decide one owner. (c) The continuation on integral models owns the Rapoport–Zink spaces and the comparison, as its routing says: the node HS3/classical-comparison moves there unchanged, with the rigidification and Huber comparison nodes of HS2 and HS3 as prerequisites; HS3 then states no comparison with classical towers; the two-tower layer and the GL\_n comparison layer import the comparison from the continuation; and the inputs listed in the gap on comparison inputs become prerequisites inside the continuation. It keeps every layer of this roadmap independent of its continuation and puts the comparison in the roadmap that constructs the general Rapoport–Zink spaces. Or (a) a sub-layer HS3:classical-comparison of HS3 containing that node, with links two-tower layer → HS3:classical-comparison → the GL\_n comparison layer, the existing link HS2 → two-tower layer kept and no link from the two-tower layer to HS2; the two-tower layer's text then says that it supplies the towers with their actions, level maps and period maps, and the import sentence of the GL\_n comparison layer names HS3:classical-comparison; the rest of HS3 does not depend on the two-tower layer. Or (b) the node moves to the two-tower layer, which keeps HS2 as prerequisite and takes the rigidification and Huber comparison nodes of HS2 and HS3 as further prerequisites; HS3 then states no comparison with classical towers and the GL\_n comparison layer imports it from the two-tower layer. In (a) and (b) the Rapoport–Zink spaces outside the Lubin–Tate and Drinfeld cases still come from the continuation. In all cases the comparison covers all levels with the two group actions and Weil descent, and the statement for E ≠ Q\_p is made through the EL datum of Res\_{E/Q\_p} GL\_n.

### Proposal 2 (rescope): `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, `EndoscopicTransferAndUnitaryTraceComparison`, `HeckeStacksAndLocalShtukas`

The comparison of Scholze–Weinstein 24.2.5 and 24.3.5 needs the Rapoport–Zink deformation spaces for GL\_n and for EL and PEL data with connected group and parahoric level: representability by formal schemes, generic fibres, period maps and level towers. Two families are planned by existing layers: the Lubin–Tate and Drinfeld towers, in the two-tower layer, and the unramified local PEL data of type (A) or (C), in the roadmap on Igusa varieties. The general spaces, for GL\_n and for EL and PEL data, are assigned by the routing of the Scholze–Weinstein lectures (extraction PAPER-SCHOLZE-WEINSTEIN-20, items 172 and 174) to the continuation of this roadmap on integral models (HeckeStacksAndLocalShtukasIntegralPartII), which has no layers yet. The Dieudonné layer plans deformations of p-divisible groups over nilpotent thickenings; the two-tower layer plans only the Lubin–Tate and Drinfeld towers. The comparison also uses Dieudonné theory over O\_C/p and A\_cris (the Tate module of a p-divisible group over O\_C trivialises the modification given by its Hodge filtration), which the Dieudonné layer, limited to perfect fields and nilpotent thickenings, does not contain.

**Proposal.** Plan the Rapoport–Zink spaces once, in the continuation of this roadmap on integral models, as its routing says: deformation functors with EL and PEL structure, their representability, rigid generic fibres, the Grothendieck–Messing period map and its étaleness, level structures; it imports p-divisible groups, quasi-isogenies and Grothendieck–Messing theory from the finite flat groups roadmap. The two-tower layer imports the Lubin–Tate and Drinfeld cases from it in place of a separate construction; the comparison with local shtukas goes to the owner chosen in the first proposal. Dieudonné theory over O\_C/p and A\_cris, in the form of Scholze–Weinstein, Moduli of p-divisible groups, Proposition 5.1.6, is added to the finite flat groups roadmap, whose Dieudonné layer is limited to perfect fields and nilpotent thickenings. Until the continuation has layers the comparison node rests on a recorded gap.

### Proposal 3 (rescope): `DiamondSixOperations`, `ClassicalAdicEtaleCohomology`, `HeckeStacksAndLocalShtukas`

Fargues–Scholze IX.3.1 is about Huber's compactly supported cohomology of a smooth rigid space of dimension d = ⟨2ρ,μ⟩, computed through the relative homology of its diamond. This needs the agreement of Huber's proper-support direct image with the proper-support pushforward of diamonds for rigid spaces, and the identification of the dualizing complex of a smooth rigid space of dimension d with Λ(d)[2d]. The classical roadmap plans proper support in every dimension but trace and duality for curves only, and says nothing about diamonds; the diamond roadmap proves that smooth analytic maps are cohomologically smooth and stops there.

**Proposal.** Give the two statements to the examples layer S5 of the diamond six-operations roadmap, which already imports the classical curve results and the étale-site comparison: (1) for a separated taut morphism locally of finite type of locally noetherian analytic adic spaces over Z\_p and torsion coefficients prime to p, the diamond proper-support pushforward agrees with Huber's, compatibly with composition, base change and étale traces; (2) for a smooth morphism of pure relative dimension d, the dualizing complex is Λ(d)[2d] canonically. The classical roadmap supplies Huber's functor and, for (2), the trace of a smooth morphism of relative dimension d by reduction to relative curves.

### Proposal 4 (rescope): `BunGAndNewtonStrata`, `VStackSheavesAndLisseCategories`, `DiamondSixOperations`, `HeckeStacksAndLocalShtukas`

The connectedness of admissible loci (Gleason–Lourenço) and the constant-term diagram of Fargues–Scholze IX.7.2 use the stacks Bun\_P and Bun\_M of parabolic and Levi bundles with the maps between them, and maps between Artin v-stacks that are not representable, with their ℓ-cohomological dimensions; the connectedness proof also uses a criterion of connectedness and density for smooth partially proper diamonds. The bundle roadmap plans strata, their automorphism groups and the charts of filtered bundles, but not Bun\_P → Bun\_M; the layer on Artin v-stacks has exceptional functors for cohomologically smooth stacky maps only; no layer states the criterion.

**Proposal.** Add to the strata layer BG3 (or to the chart layer BG4, which already has the moduli of filtered bundles) the stacks Bun\_P and Bun\_M, the isomorphism of a Harder–Narasimhan stratum with a stratum of Bun\_P, the smoothness and dimension of Bun\_P → Bun\_M and the instability bound under which bounded modifications preserve the Harder–Narasimhan reduction. Add to the layer on cohomological smoothness or on biduality of the diamond six-operations roadmap the two statements on a connected, cohomologically smooth, partially proper diamond of pure dimension d over an algebraically closed field: removing a closed subset of smaller dimension leaves a connected open, and a locally closed subset of smaller ℓ-dimension contains no non-empty open subset. Decide whether the dimension theory for non-representable maps is taken from an enhanced six-functor formalism added to the layer on Artin v-stacks or reproved by atlases.

## Mistakes in the sources

The nodes use the corrected statements. Each entry gives the place, what the source asserts there, the correction and the reason. "Known" names an existing record of the same mistake.

### E1. Fargues–Scholze, Chapter III, §III.3, Proposition III.3.6(ii), p. 100, and item (ii) of the non-split case on the same page (author-hosted 356-page copy)

Kind: error. Affects: a stated result. Known: new.

**The source.** In (ii), the source identifies the composite |Gr\_G| → |Bun\_G| → π\_1(G), obtained by Beauville–Laszlo followed by κ, with the negative of the map just given.

**Correction.** With Gr\_{G,μ} the L⁺G-orbit of μ(ξ), as in [SW20, Proposition 19.2.1 and Definition 19.2.2], which the section cites for Gr\_{G,≤μ}, and as in §VI.2 where [μ] = μ(ξ), the composite is equal to the map of (i): κ(BL(x)) = μ♯ for x ∈ Gr\_{G,μ}; in the non-split case it is induced by Γ∖π\_1(G) → π\_1(G)\_Γ itself. The printed sign is the one for the orbit of μ(ξ)⁻¹, that is, for modifications of the trivial bundle of type μ in the sense of §IX.7 (pp. 336–337), where the modification from 𝒪 to 𝒪(1) has type 1.

**Reason.** Take G = 𝔾\_m and μ = 1. The point of Gr\_{𝔾\_m,1} is the lattice ξB⁺\_dR ⊂ B\_dR, and the Beauville–Laszlo map sends it to the line bundle with this completion, the ideal sheaf I of the divisor. Proposition II.2.3 and its proof (pp. 60–61: there is a map 𝒪 → I(1) and it is an isomorphism) give I ≅ 𝒪(−1). By p. 58, 𝒪(n) is the image of (Ĕ, π⁻ⁿσ), so 𝒪(−1) = E\_b with b = π; by pp. 90–91, κ(b) is the endpoint of the Newton polygon and the first Chern class of E\_b is −κ(b). Hence κ(BL(ξ)) = +1 = μ♯, not −1. The proof of (ii) says only that the 𝔾\_m case follows from Proposition II.2.3, which gives 𝒪(D) ≅ 𝒪(1) with κ = −1; but 𝒪(D) has completion ξ⁻¹B⁺\_dR, the point μ(ξ)⁻¹. Independent check: [SW20, Definition 24.1.1 with Proposition 23.3.3] require κ(b) = −μ♮ when the trivial bundle has position ≤ μ relative to E\_b in the same normalisation, that is κ(modified) − κ(original) = +μ♮; and §IX.7, p. 337, takes b = μ(π⁻¹), with κ(b) = −μ♯, for the modification of the trivial bundle of type μ, whose lattice is μ(ξ)⁻¹. Every convention used is fixed in the texts: that the point [μ] = μ(ξ) is the lattice ξ^{k\_1}B⁺\_dR ⊕ … ⊕ ξ^{k\_n}B⁺\_dR is stated in the paper itself (proof of Proposition VI.2.4, p. 199, which names this lattice as the one of the point [μ]) and in [SW20, proof of Proposition 19.4.2, pp. 176–177]; the sequence 0 → 𝒪(−1) → 𝒪 → 𝒪\_{C♯} → 0 is printed in Example II.3.12 (p. 84). Further checks inside the paper: in the proofs of Theorem IX.7.2 (p. 336: from E\_{b\_N}, b\_N = b·μ(π^N), to E\_b by the Hecke operator of highest weight μ^N), of Corollary IX.7.3 (p. 337: from E\_b, b = μ(π⁻¹), to the trivial bundle by T\_{μ⁻¹}) and of Theorem IX.7.4 (p. 338: from 𝒪(−1/n) to 𝒪ⁿ by the operator of the standard representation, through the modifications of E that contain 𝒪(−1/n) with a quotient of length one at the leg) the Kottwitz invariant of the source bundle is that of the target plus the class of the weight, and in the last one the source bundle is a lattice of position (1,0,…,0) in the target; applied to the trivial target this is κ = +μ♯ on Gr\_{G,μ}.

Searched for an existing correction: the register of mistakes recorded in the atlas for this paper (129 entries; E17, E18 and E126 concern III.3 but not this point); the author-hosted 356-page copy itself (all occurrences of 'opposite', 'B(G,', 'type' and 'global Hecke stack'); Scholze-Weinstein, Berkeley Lectures, Lectures 19, 23 and 24, for the normalisations.

### E2. Scholze–Weinstein, Lecture 23, Remark 23.4.3 and the proof of Proposition 23.4.2, p. 222 (print-ready copy of 27 March 2020)

Kind: gap. Affects: the proof. Known: new.

**The source.** The description is asserted to be canonically independent of b, despite its apparent dependence: any element of G(L) may be used to alter the isomorphism φ\_{P\_η}.

**Correction.** The description of Proposition 23.4.2 agrees with Definition 23.4.1 for b = 1, and for b′ = y·b·σ(y)⁻¹ the functors are identified by composing ι\_r with y × id (as in Remark 23.1.3). For general b the two identifications used in the proof, with the Beilinson–Drinfeld Grassmannian off the Frobenius translates of the diagonal and with the pulled-back convolution Grassmannian near (φ × 1)^m(Δ), differ on their common locus by left translation by b·σ(b)⋯σ^{m−1}(b) on the lattice at the first leg; so they do not glue to the b-independent space of Definition 23.4.1 without a further argument.

**Reason.** An element of G(L) does not act on P\_η, which is trivialised only on Y\_{[r,∞)}(S) and, after extension, off the translates of the legs; so the stated reason defines no operation on triples (P\_η, φ, ι\_r). Let Λ\_1, Λ\_2 be the lattices of P\_η at S♯\_1, S♯\_2 relative to the extended ι\_r, with no collision. The first identification gives (Λ\_1, Λ\_2). The second uses the torsor obtained by modifying the trivial torsor at S♯\_1 and continuing φ⁻¹-periodically, whose lattice at φ⁻ᵐ(S♯\_1) is the transport of Λ\_1 by (b × Frob\_S)^m = b·σ(b)⋯σ^{m−1}(b) × Frob\_S^m; the gluing of Definition 23.4.1 is by (Frob\_S^m)^\* alone. For one leg, or for b = 1, there is no discrepancy. Nothing after it depends on the remark: Proposition 23.5.2 and Corollaries 23.4.4 and 23.5.3 are local on the base, and each chart is described without b.

Searched for an existing correction: the register of mistakes recorded in the atlas for this book (6 entries, none in Lecture 23); the print-ready copy of 27 March 2020 itself (Lectures 20 and 23); Fargues-Scholze IX.3, pp. 325-326, where the space is used.

### E3. Scholze–Weinstein, Lecture 23, Proposition 23.4.2 (p. 222) and Definition 23.5.1 (p. 223) (print-ready copy of 27 March 2020)

Kind: misprint. Affects: nothing. Known: new.

**The source.** The source parametrizes torsors for G, denoted P\_η, on S ×̇ Spa ℚ\_p. Here S is perfectoid of characteristic p, with untilts over E\_i given by S♯\_i = Spa(R♯\_i, R♯+\_i), indexed by i = 1,…,m; the identification sends φ\_{P\_η} to b × Frob\_S.

**Correction.** S ∈ Perf\_k with untilts over Ĕ\_i = E\_i·L, so that the functor lives over Spd Ĕ\_1 ×\_k ⋯ ×\_k Spd Ĕ\_m, as in Definition 23.1.1 and Corollaries 23.4.4 and 23.5.3 (or else b ∈ G(ℚ\_p)).

**Reason.** b ∈ G(L) with L = W(k)[1/p] (Definition 23.1.1) defines the automorphism b × Frob\_S of G × Y\_{[r,∞)}(S) only when the functions on Y\_{[r,∞)}(S) form an L-algebra, that is, when S lives over k. Definition 23.1.1 is stated on Perf\_k with untilts over Ĕ\_i, and the target of the period map in Corollary 23.5.3 is written over Spd Ĕ\_1 ×\_k ⋯ ×\_k Spd Ĕ\_m.

Searched for an existing correction: the register of mistakes recorded in the atlas for this book (6 entries, none in Lecture 23); the print-ready copy of 27 March 2020 itself (Lectures 20 and 23); Fargues-Scholze IX.3, pp. 325-326, where the space is used.

### E4. Fargues–Scholze, Chapter IX, introduction, p. 317, and §IX.2, pp. 321–322 (author-hosted 356-page copy)

Kind: gap. Affects: nothing. Known: new.

**The source.** The source obtains a perverse sheaf S\_V on ℋck^I\_G and says that pulling it back gives a sheaf on the global Hecke stack Hck^I\_G.

**Correction.** Add the definition: for S ∈ Perf\_k, Hck^I\_G(S) is the groupoid of legs D\_i ∈ Div¹(S) (i ∈ I), G-bundles E\_1, E\_2 on X\_S and an isomorphism off ⋃ D\_i meromorphic along Σ D\_i; p\_1 remembers E\_1, p\_2 remembers (E\_2,(D\_i)), and the map to the local stack is completion along Σ D\_i.

**Reason.** Only the one-leg stack is defined: in the introduction (I.2, p. 16) and, over C, inside the proof of Proposition IX.2.1 (p. 322). The symbol Hck^I\_G for a finite set I is used in IX.0, IX.2, IX.6 and IX.7 without a definition; a search of the text for 'global Hecke stack' and for 'Hck' near 'parametriz' finds no other.

Searched for an existing correction: the register of mistakes recorded in the atlas for this paper (129 entries; E17, E18 and E126 concern III.3 but not this point); the author-hosted 356-page copy itself (all occurrences of 'opposite', 'B(G,', 'type' and 'global Hecke stack'); Scholze-Weinstein, Berkeley Lectures, Lectures 19, 23 and 24, for the normalisations.

### E5. Fargues–Scholze, Chapter VI, §VI.2, Definition VI.2.6, p. 200

Kind: misprint. Affects: nothing. Known: PAPER-FARGUES-SCHOLZE-21/E38.

**The source.** The definition requires a bijection ψ : I ≅ J for which, at Spa(C\_i^♯, C\_i^{♯+}), the relative position between E\_1 and E\_2 has bound Σ\_{j∈J, C^♯\_{ψ(j)} ≅ C^♯\_i} μ\_j.

**Correction.** there is some bijection ψ : J ≅ I such that …

**Reason.** The sum applies ψ to j ∈ J, so ψ goes from J to I.

Searched for an existing correction: the register of mistakes recorded in the atlas.

### E6. Scholze–Weinstein, Lecture 20, Definition 20.4.2 and Definition 20.4.4, p. 187

Kind: misprint. Affects: nothing. Known: PAPER-SCHOLZE-WEINSTEIN-20/E6.

**The source.** Definition 20.4.2 requires meromorphicity along S♯\_i for i = 2,…,n; Definition 20.4.4 imposes the Bruhat-order condition for every i = 1,…,n.

**Correction.** i = 2,…,m and i = 1,…,m

**Reason.** The definitions concern m untilts and m cocharacters; n is not introduced.

Searched for an existing correction: the register of mistakes recorded in the atlas.

### E7. Fargues–Scholze, Chapter III, §III.3, p. 100, non-split case, item (i)

Kind: misprint. Affects: nothing. Known: PAPER-FARGUES-SCHOLZE-21/E18.

**The source.** The Schubert colimit is indexed in the display by dominant characters rather than dominant cocharacters.

**Correction.** lim→\_{μ̄∈Γ∖X\_\*(T)^+} Gr\_{G,≤μ̄}

**Reason.** Schubert varieties are indexed by dominant cocharacters.

Searched for an existing correction: the register of mistakes recorded in the atlas.

### E8. Fargues–Scholze, Chapter VII, §VII.7, Proposition VII.7.9, p. 275

Kind: misprint. Affects: nothing. Known: PAPER-FARGUES-SCHOLZE-21/E110.

**The source.** The source assigns a complex M\_b of smooth G\_b(E)-representations and requires that, for every open pro-p subgroup K ⊂ G\_b(E), the complex M^K be perfect over Λ.

**Correction.** … for which M\_b^K is a perfect complex of Λ-modules …

**Reason.** The complex was just named M\_b and no M occurs in the statement; the étale original, Theorem V.7.1 (p. 183), prints M\_b^K. On p. 275 the perfectness condition is printed for M^K.

Searched for an existing correction: register of mistakes in published sources.

### E9. Fargues–Scholze, Chapter VII, §VII.7, Proposition VII.7.10, p. 276

Kind: misprint. Affects: nothing. Known: PAPER-FARGUES-SCHOLZE-21/E56.

**The source.** The proposition asserts compactness for A\_1 ⊠ A\_2 ∈ D\_ét(Bun\_G, Λ), the exterior product of compact objects A\_i ∈ D\_lis(Bun\_{G\_i}, Λ) indexed by i = 1, 2.

**Correction.** A\_1 ⊠ A\_2 ∈ D\_lis(Bun\_G, Λ) is compact

**Reason.** The exterior product was just defined with values in D\_lis(Bun\_G, Λ), and Λ need not be torsion in Chapter VII; the subscript is carried over from Proposition V.7.2.

Searched for an existing correction: register of mistakes in published sources.

### E10. Fargues–Scholze, Chapter IX, §IX.2, proof of Theorem IX.2.2, last sentence, p. 323 (author-hosted 356-page file)

Kind: misprint. Affects: nothing. Known: new.

**The source.** The proof derives the Bernstein–Zelevinsky duality assertion from the displayed equation and the right adjunction of T\_{sw^\*V^∨} to T\_{sw^\*V}. For naive duality, it instead invokes the left adjunction of T\_{sw^\*V^∨} to T\_{sw^\*V}.

**Correction.** … for Bernstein–Zelevinsky duals by also using that T\_{sw^\*V^∨} is left adjoint to T\_{sw^\*V}, and the statement for naive duals by using that T\_{sw^\*V^∨} is right adjoint to T\_{sw^\*V}.

**Reason.** With RHom(D\_BZ(A),B) ≅ π\_♮(A ⊗ B) (Proposition VII.7.6): RHom(D\_BZ(T\_V A),B) ≅ π\_♮(A ⊗ T\_{sw^\*V}B) ≅ RHom(D\_BZ(A),T\_{sw^\*V}B), and to rewrite this as RHom(T\_{sw^\*V^∨}D\_BZ(A),B) one needs T\_{sw^\*V^∨} to be the left adjoint of T\_{sw^\*V}. With RHom(B,RHom\_lis(A,Λ)) ≅ RHom(π\_♮(A ⊗ B),Λ): RHom(B,RHom\_lis(T\_V A,Λ)) ≅ RHom(T\_{sw^\*V}B,RHom\_lis(A,Λ)), and to rewrite this as RHom(B,T\_{sw^\*V^∨}RHom\_lis(A,Λ)) one needs the right adjoint. The two words are interchanged. Both adjunctions hold, because T\_{W^∨} is a left and a right adjoint of T\_W for every W (first paragraph of the same proof); each clause of the printed sentence is therefore a true statement, the proof is complete, and only the assignment of the two adjunctions to the two dualities is interchanged.

Searched for an existing correction: register of mistakes in published sources: no entry for §IX.2 or p. 323; only the author-hosted 356-page file was read; the published edition was not compared.

### E11. Scholze–Weinstein, Lecture 22, §22.4, p. 210 (paragraph after Definition 22.4.1), and Lecture 23, Remark 23.1.3, p. 217; print-ready file of 27 March 2020

Kind: misprint. Affects: nothing. Known: new.

**The source.** A change in the fiber functor’s trivialization is said to send b to ϕ(y)by−1, with y ∈ G(L); the source attributes the name σ-conjugacy to Kottwitz for b ∼ ϕ(y)by−1. Remark 23.1.3 identifies this replacement with composition of ιr by y × id, where y ∈ G(L).

**Correction.** b is replaced by y b ϕ(y)⁻¹ (Kottwitz's σ-conjugacy b ∼ y b σ(y)⁻¹), in both places.

**Reason.** The same paragraph defines the isocrystal as (V ⊗ L, b ⊗ ϕ); changing the trivialisation by y gives y ∘ (b ⊗ ϕ) ∘ y⁻¹ = (y b ϕ(y)⁻¹) ⊗ ϕ. The printed relation is a different relation: it is σ-conjugacy of the inverses, and it does not preserve the isomorphism class of (V ⊗ L, b ⊗ ϕ). For GL\_2: let s be the permutation matrix, t = diag(p,1), and k\_1, k\_2 ∈ GL\_2(W(k)) with ϕ(k\_2)k\_2⁻¹ = s and k\_1⁻¹ϕ²(k\_1) = s (Lang's theorem); for y = k\_1 t k\_2 one gets ϕ(y)·1·y⁻¹ = ϕ(k\_1)(t s t⁻¹)k\_1⁻¹, which is σ-conjugate in Kottwitz's sense (by ϕ(k\_1)⁻¹) to t s t⁻¹ s = diag(p, p⁻¹), an isocrystal of slopes 1 and −1, whereas b = 1 has slopes 0.

Searched for an existing correction: register of source issues: entries PAPER-SCHOLZE-WEINSTEIN-20/E1–E6 (none at Lectures 22–24); the author-hosted print-ready file of 27 March 2020 itself (the only version read; the published Annals of Mathematics Studies volume was not collated).

### E12. Scholze–Weinstein, Lecture 23, proof of Proposition 23.3.1, p. 218; print-ready file of 27 March 2020

Kind: gap. Affects: the proof. Known: new.

**The source.** The proof starts with affinoid S and an S-point of ShtG,b,µ represented by (P,S♯,ϕP,ιr). It ends after constructing an isomorphism α from E to Eb outside the image of S♯ in XFF,S.

**Correction.** The proof constructs the map from S-points of Sht to quadruples (S♯, E, α, ℙ) only. The inverse must be added: pull E back to Y\_(0,∞)(S); let P\_η be the G-torsor that is trivial away from the divisors ϕ^{−n}(S♯), n ≥ 0, and equal to the pullback of E near them (gluing along Cartier divisors, as in the proof of Proposition 23.4.2); the framing and ϕ\_P come from b × Frob on the trivial torsor, and ℙ extends P\_η over p = 0 by Proposition 22.6.1.

**Reason.** A bijection is claimed and only one direction is defined; neither injectivity nor surjectivity is addressed. The inverse construction exists and is the one used implicitly in §23.4 (proof of 23.4.2).

Searched for an existing correction: register of source issues: entries PAPER-SCHOLZE-WEINSTEIN-20/E1–E6 (none at Lectures 22–24); the author-hosted print-ready file of 27 March 2020 itself (the only version read; the published Annals of Mathematics Studies volume was not collated).

### E13. Scholze–Weinstein, Lecture 23, Proposition 23.3.1 (first bullet), p. 218, and the description of Sht\_{G,b,µ,∞}, p. 219; print-ready file of 27 March 2020

Kind: misprint. Affects: nothing. Known: new.

**The source.** The source requires S♯ to be an untilt of S over E.

**Correction.** S♯ is an untilt of S to Ĕ = E·L (as in Definition 23.1.1, where the i-th untilt is taken over Ĕ\_i).

**Reason.** Sht\_{𝒢,b,µ} lives over Spd Ĕ and S ∈ Perf\_k; an untilt over E of a space over k is an untilt over one of the [k\_E : F\_p] copies of Spd Ĕ in Spd E × Spd k, so an untilt over E alone loses the choice. The text itself explains on p. 220 that the field Ĕ = E·L is needed because S lives over k.

Searched for an existing correction: register of source issues: entries PAPER-SCHOLZE-WEINSTEIN-20/E1–E6 (none at Lectures 22–24); the author-hosted print-ready file of 27 March 2020 itself (the only version read; the published Annals of Mathematics Studies volume was not collated).

### E14. Scholze–Weinstein, Lecture 23, §23.1, the two displays of the second paragraph, p. 216, and Definition 23.1.1, third bullet, p. 217 (the first display is printed in both places); print-ready file of 27 March 2020

Kind: misprint. Affects: nothing. Known: new.

**The source.** The mixed-characteristic Frobenius map is displayed on the complement of equal-characteristic graph legs, and the radius inequality uses ϖ instead of its Teichmüller lift.

**Correction.** (S ×̇ Spa Z\_p) ∖ ⋃\_{i} S♯\_i in place of (S ×̇ X) ∖ ⋃ Γ\_{x\_i}, and |[ϖ]| ≤ |p|^r ≠ 0.

**Reason.** X and the graphs Γ\_{x\_i} belong to the equal-characteristic review at the start of the lecture (X a curve over F\_q, x\_i ∈ X(S)); in the mixed-characteristic definition the legs are the divisors S♯\_i ⊂ S ×̇ Spa Z\_p, as the following sentence of the definition says. Lecture 22 (p. 207) defines Y\_[r,∞)(S) with the Teichmüller lift [ϖ].

Searched for an existing correction: register of source issues: entries PAPER-SCHOLZE-WEINSTEIN-20/E1–E6 (none at Lectures 22–24); the author-hosted print-ready file of 27 March 2020 itself (the only version read; the published Annals of Mathematics Studies volume was not collated).

### E15. Scholze–Weinstein, Lecture 23, §23.4, first display, p. 221; print-ready file of 27 March 2020

Kind: misprint. Affects: nothing. Known: new.

**The source.** The source writes the limit as ShtG,b,{µi} = lim←K ShtG,b,{µi},K and describes its points by saying that, when S ∈ Perfk, a tuple of untilts corresponds to an S-point of ShtG,b,{µi}.

**Correction.** Sht\_{G,b,{µi},∞} = lim←K Sht\_{G,b,{µi},K}, and 'an S-point of Sht\_{G,b,{µi},∞}'.

**Reason.** The subscript ∞ is missing twice; without it the symbol denotes nothing defined (level structures are indexed by K), and p. 224 writes Sht\_{G,b,{µi},∞} = lim←K Sht\_{G,b,{µi},K} for the same object.

Searched for an existing correction: register of source issues: entries PAPER-SCHOLZE-WEINSTEIN-20/E1–E6 (none at Lectures 22–24); the author-hosted print-ready file of 27 March 2020 itself (the only version read; the published Annals of Mathematics Studies volume was not collated).

### E16. Scholze–Weinstein, Lecture 23, proof of Proposition 23.2.1, p. 218; print-ready file of 27 March 2020

Kind: error. Affects: nothing. Known: new.

**The source.** Invoking Theorem 22.6.2, the source claims that a ϕ-equivariant G-torsor over Y(0,∞)(S) extends over Y[0,∞)(S) precisely when its descent on XFF,S is trivial at every geometric point of S.

**Correction.** 'only if'; conversely, if the descent is trivial at all geometric points, an extension exists étale locally on S (Latt is étale and surjective over the admissible locus), not necessarily on S.

**Reason.** Theorem 22.6.2 gives that Latt(P\_η) → S is étale with image S^a; a section over S = S^a exists exactly when the pro-étale G(Q\_p)-torsor ℙ\_η has a reduction to 𝒢(Z\_p). For G = G\_m and S the perfection of a Tate elliptic curve minus an open disc (an affinoid whose analytic Z-cover is connected), the rank-one Q\_p-local system on which a generator of Z acts by p has no Z\_p-lattice, although the associated bundle is trivial at every geometric point. The proof of 23.2.1 uses only the 'only if' direction.

Searched for an existing correction: register of source issues: entries PAPER-SCHOLZE-WEINSTEIN-20/E1–E6 (none at Lectures 22–24); the author-hosted print-ready file of 27 March 2020 itself (the only version read; the published Annals of Mathematics Studies volume was not collated).

### E17. Gleason–Lim–Xu, Proposition 6.6(1), (6.4), p. 849, and Step 1 of its proof, p. 850 (published version)

Kind: misprint. Affects: nothing. Known: new.

**The source.** Equation (6.4) asserts Sht\_{(H,b\_H,μ\_H,∞)} ≅ Sht\_{(G,b,μ,∞)} ×^{G(Q\_p)} H(Q\_p); the proof’s Step 1 asserts Gr\_μ = Gr\_{μ\_H}.

**Correction.** Sht\_{(H,b\_H,μ\_H,∞)} ×\_{Spd Ĕ\_H} Spd Ĕ ≅ Sht\_{(G,b,μ,∞)} ×^{G(Q\_p)} H(Q\_p), and Gr\_μ = Gr\_{μ\_H} ×\_{Spd Ĕ\_H} Spd Ĕ, where E\_H ⊂ E is the reflex field of μ\_H = f∘μ.

**Reason.** Sht\_{(G,b,μ,K)} is a diamond over Spd Ĕ with E the reflex field of μ (§3.4), and the reflex field of f∘μ can be smaller. For T = Res\_{L/Q\_p} G\_m with L/Q\_p ramified quadratic, μ the cocharacter of one embedding (reflex field L), [b] ∈ B(T,μ) and the ad-isomorphism f: T → 1, the right side of (6.4) is Sht\_{(T,b,μ,∞)}/T(Q\_p) = Spd L̆ and the left side is Spd Q̆\_p. The proof of Proposition 6.7 (p.851) explicitly identifies the admissible Grassmannians after extending the reflex base to the completed larger field. Part (2), which is over C\_p, is not affected.

Searched for an existing correction: the arXiv listing of arXiv:2208.07195 (v1 15 August 2022, v2 9 January 2023, v3 10 November 2025, the accepted version); the register entries PAPER-GLEASON-LIM-XU-26/E01–E17; the published version of record (Invent. math. 243 (2026), 805–861), which is the text read.

### E18. Gleason–Lim–Xu, Lemma 3.2, p. 820, and the proof of Proposition 3.12, p. 828 (published version)

Kind: error. Affects: a stated result. Known: PAPER-GLEASON-LIM-XU-26/E01.

**The source.** The lemma gives |𝒢| = |ℱ|/K together with π\_0(𝒢) = π\_0(ℱ)/K. The proof of Proposition 3.12 then invokes Lemma 3.2 and the v-sheaf identification Gr^b\_μ × Spd C\_p ≃ Sht\_{(G,b,μ,∞)}/G(Q\_p).

**Correction.** The first equality holds. The second holds for profinite K: if a profinite group acts continuously on a space with connected quotient, it acts transitively on the connected components. It fails for non-compact K. Proposition 3.12 follows instead from three facts: the K-orbits of components of Sht\_{(G,b,μ,∞)} × Spd C\_p are the components of Sht\_{(G,b,μ,K)} × Spd C\_p (profinite case); these are open (for minuscule μ because the finite level is a rigid space, for parahoric K by Theorem 3.9); hence the G(Q\_p)-orbits of components are open, and there is one orbit because the quotient is connected (Theorem 3.11).

**Reason.** For Z acting by translation on Z\_p × Spa C the quotient has an indiscrete, hence connected, underlying space, while π\_0 of the total space is Z\_p, on which Z is not transitive. The registered entry says that a compact-only replacement is insufficient for Proposition 3.12; it becomes sufficient together with openness of the components at one finite level, which is available in the cases named.

Searched for an existing correction: the arXiv listing of arXiv:2208.07195 (v1 15 August 2022, v2 9 January 2023, v3 10 November 2025, the accepted version); the register entries PAPER-GLEASON-LIM-XU-26/E01–E17; the published version of record (Invent. math. 243 (2026), 805–861), which is the text read.

### E19. Howe–Klevdal, Proposition 7.3.3, p. 43 (arXiv v2)

Kind: misprint. Affects: nothing. Known: PAPER-HOWE-KLEVDAL-26/E7.

**The source.** The source asserts that Gr\_{[μ],Q̆\_p([μ])}/Spd Q̆\_p([μ]) has a rigid analytic point whenever this space is nonempty.

**Correction.** The conclusion should require a rigid analytic point of the nonempty b-admissible locus Gr^{b−adm}\_{[μ]} over the completed reflex field.

**Reason.** The cell Gr\_{[μ]} always has rigid analytic points, so the printed claim is empty; the proof gives a point of the admissible locus, from Rapoport–Viehmann, Proposition 3.1.

Searched for an existing correction: the arXiv listing of arXiv:2308.11064 (v1 21 August 2023; v2 28 February 2025, the latest and the text read); the register entries PAPER-HOWE-KLEVDAL-26/E1–E48; the published version (Invent. math. 244 (2026), 455–530) was not read.

### E20. Gleason–Lourenço, Proof of Theorem 3.2, p. 10 (arXiv v2)

Kind: misprint. Affects: nothing. Known: new.

**The source.** For basic b, the source cites [FS21] to assert that BL\_b : [G(Q\_p)\\Gr°\_{G,μ}] → Bun\_G has relative dimension d and is smooth.

**Correction.** If b is basic, BL\_b : [G\_b(Q\_p)\\Gr°\_{G,μ}] → Bun\_G is smooth of relative dimension d, where G\_b(Q\_p) = Aut(E\_b) is the group of points of the σ-centraliser of b.

**Reason.** Gr\_{G,μ} is the space of modifications E ⇢ E\_b and BL\_b forgets the modification; it is invariant under Aut(E\_b) = G\_b(Q\_p), which acts through G\_b(Q\_p) ⊂ G(Q̆\_p), and the quotient is the fibre of the Hecke stack over the stratum Bun\_G^b = [∗/G\_b(Q\_p)]. For basic b this is an inner form of G: for G = GL\_2 and b basic of slope 1/2 it is D^× for the quaternion algebra D, not GL\_2(Q\_p). The dimension count that follows only uses that the group is locally profinite.

Searched for an existing correction: the arXiv listing of arXiv:2210.08625 (v1 16 October 2022; v2 28 December 2022, whose listing says that the proof of Lemma 3.3 was repaired and the introduction revised; v2 is the latest and the text read); the register of mistakes recorded in the atlas, which has no entry for this paper; a published version was not located.

### E21. Fargues–Scholze, Chapter IX, §IX.3, Proposition IX.3.2, p. 326; the same omission in Chapter I, §I.7, Corollary I.7.3, pp. 31–32, and in the sentence after the proof of Theorem IX.3.1, p. 325 (author-hosted 356-page copy)

Kind: error. Affects: a stated result. Known: new.

**The source.** The source lets K vary among compact open subgroups of G(E) and asserts compactness of the restriction to D(G\_b(E),Λ). It concludes that every admissible G\_b(E)-representation ρ gives R Hom\_{G\_b(E)}(f\_{K♮}S′\_W,ρ) ∈ D(Λ)^{B∏W\_{E\_i}}, with ∏\_{i∈I}W\_{E\_i} acting on a perfect Λ-complex.

**Correction.** Both assertions hold for K pro-p (more generally when the pro-order of K is invertible in Λ), as in Theorem IX.3.1, which asserts compactness for pro-p K only. For other K the object is still a complex of smooth G\_b(E)-representations with partial Frobenii, but it need not be compact and RHom into an admissible ρ need not be perfect. The assertions about the colimit over K are unaffected, because pro-p subgroups are cofinal.

**Reason.** The proof identifies f\_{K♮}S′\_W with T\_W(j\_![c-Ind\_K^{G(E)}Λ]) restricted to Bun\_G^b and continues by reference to the earlier argument, that is the one for Theorem IX.3.1, where compactness of c-Ind\_K Z\_ℓ needs K pro-p. Counterexample: G=G\_m, one leg with μ=0, b=1, K=O\_E^×, Λ=F\_ℓ with ℓ dividing q−1. Then Sht\_K=E^×/K×Spd Ĕ, S′\_W=Λ and f\_{K♮}S′\_W=c-Ind\_{O\_E^×}^{E^×}F\_ℓ. RHom\_{E^×}(c-Ind\_{O\_E^×}F\_ℓ,ρ)=RΓ(O\_E^×,ρ); for the trivial representation ρ=F\_ℓ, which is admissible, this is RΓ(F\_q^×,F\_ℓ), non-zero in every degree ≥0. So it is not perfect, and RHom out of the object does not commute with the direct sum ⊕\_iF\_ℓ[i], so the object is not compact. The same happens for G=G\_m with non-trivial μ, and for GL\_2 over Q\_p, μ=(1,0), K=GL\_2(Z\_p), ℓ dividing p²−1, where RΓ\_c(M\_{K,C},Z\_ℓ)=c-Ind\_{O\_D^×}^{D^×}Z\_ℓ(−1)[−2]. On p. 325 the assertion that RHom\_{G\_b(Q\_p)}(RΓ\_c(M\_{(G,b,μ),K,C},Z\_ℓ),ρ) is a perfect complex of Λ-modules for every admissible ρ over a Z\_ℓ-algebra Λ has the same defect when K is not pro-p: for G=G\_m, μ(z)=z, K=Z\_p^× and ρ the trivial representation on F\_ℓ with ℓ dividing p−1 the complex is RΓ(Z\_p^×,F\_ℓ)=RΓ(F\_p^×,F\_ℓ), which is not perfect. It is correct for K pro-p, the case in which the theorem gives compactness.

Searched for an existing correction: the register of recorded mistakes of this source (no entry at IX.3, pp. 324–327, or at I.7); the copy read (author-hosted 356-page file), including the introduction's statement of the same results (I.7, pp. 30–32); not checked: the published Astérisque edition and the arXiv versions.

### E22. Fargues–Scholze, Chapter IX, §IX.3, Proposition IX.3.2, last sentence, and the end of its proof, pp. 326–327; the same sentence in Corollary I.7.3, p. 32

Kind: gap. Affects: the proof. Known: new.

**The source.** The source claims that compactness of ρ implies compactness of lim→\_K R Hom\_{G\_b(E)}(f\_{K♮}S′\_W,ρ) in the category of complexes of G(E)-representations, and says that the remaining proof proceeds as previously.

**Correction.** The argument given before (p. 325) proves this, in the form of finite length of each cohomology group, for Λ=Q̄\_ℓ and ρ of finite length: it uses that ρ is admissible to pass through Verdier duality, that ρ^∨ is compact, and finite global dimension together with Howe's theorem to see that the dual of the resulting compact admissible complex is again compact. For a general Z\_ℓ[√q]-algebra Λ and a compact ρ no argument is given. What is missing is that Ri^b\_\*[ρ] is compact on a quasicompact open substack of Bun\_G containing the strata met by the Hecke correspondence from Bun\_G^1 (or, for ρ compact and admissible, that smooth duality preserves compact admissible complexes). The missing statement has since been proved: Hamann–Hansen–Scholze, Geometric Eisenstein series I: finiteness theorems (arXiv:2409.07363v1, Theorems 1.3.1 and 7.1.4): if A∈D(G\_b(E),Λ) is compact then i\_{b\*}A has compact stalks; with Proposition VII.7.4 this gives compactness of the level colimit (their six-functor formalism is written for Λ killed by a power of ℓ).

**Reason.** By adjunction lim→\_K R Hom\_{G\_b(E)}(f\_{K♮}S′\_W,ρ)=i^{1\*}T\_{W^∨}(Ri^b\_\*[ρ]). T\_{W^∨} and i^{1\*} preserve compact objects (Theorem IX.2.2, Proposition VII.7.4), but the text proves preservation of compact objects only for i^{b\*} and its left adjoint (Propositions VII.7.2 and VII.7.4), not for Ri^b\_\*; and the duality route of p. 325 needs ρ admissible.

Searched for an existing correction: the register of recorded mistakes of this source (no entry at IX.3, pp. 324–327, or at I.7); the copy read (author-hosted 356-page file), including the introduction's statement of the same results (I.7, pp. 30–32); not checked: the published Astérisque edition and the arXiv versions; arXiv:2409.07363v1 (Hamann–Hansen–Scholze, 11 September 2024), introduction §1.3 and Theorem 7.1.4, for the subsequent result that fills the gap; the paper does not mention Proposition IX.3.2.

### E23. Fargues–Scholze, Chapter IX, §IX.3, the two sentences after Theorem IX.3.1, p. 324

Kind: gap. Affects: the proof. Known: new.

**The source.** The source concludes that H^i\_c(M\_{(G,b,μ),K,C},Z\_ℓ) is smooth and finitely generated as a G\_b(Q\_p)-representation for each i. It invokes descent to extend this assertion to every K, including those that are not pro-p.

**Correction.** Add the input: every subrepresentation of a finitely generated smooth Z\_ℓ-representation of G\_b(Q\_p) is finitely generated, because the Hecke algebras Z\_ℓ[K\_b\\G\_b(Q\_p)/K\_b] are noetherian. This is Dat–Helm–Kurinczuk–Moss, Finiteness for Hecke algebras of p-adic groups (arXiv:2203.04929, Theorem 1.1), which appeared after the source and uses its construction of the map from the excursion algebra to the Bernstein centre, not this statement.

**Reason.** A compact object of D(G\_b(Q\_p),Z\_ℓ) is a retract of a bounded complex of finite sums of c-Ind\_{K\_b}Z\_ℓ. Its top cohomology group is finitely generated, but the others are kernels modulo images, finitely generated only if the Hecke algebra is coherent; over a non-coherent ring a perfect complex can have cohomology that is not finitely generated. The descent to all K goes through a spectral sequence whose terms are subquotients, with the same need. On p. 325 the source gives the corresponding justification only for Q̄\_ℓ-coefficients, through the finite global dimension of the category of smooth representations.

Searched for an existing correction: the register of recorded mistakes of this source (no entry at IX.3, pp. 324–327, or at I.7); the copy read (author-hosted 356-page file), including the introduction's statement of the same results (I.7, pp. 30–32); not checked: the published Astérisque edition and the arXiv versions; arXiv:2203.04929, abstract and version list, for the subsequent result that fills the gap.

### E24. Fargues–Scholze, Chapter IX, §IX.3, first paragraph and proof of Theorem IX.3.1, p. 324; compare §IX.7.2, proof of Corollary IX.7.3, p. 337, and §IX.7.3, proof of Theorem IX.7.4, p. 338

Kind: misprint. Affects: nothing. Known: new.

**The source.** The argument selects b ∈ B(G,μ) ⊂ B(G), applies T\_μ to A = j\_!c-Ind\_K^{G(Q\_p)}Z\_ℓ as a compact object, and uses modifications of G-torsors with type μ going from E\_b to E\_1.

**Correction.** In the conventions of §IX.7 and of [SW20]: b ∈ B(G,μ^{-1}), and modifications of type μ that go from E\_1 to E\_b; then T\_μ and the tower of [SW20, Definition 24.1.1] are as printed. Equivalently keep b ∈ B(G,μ) and replace T\_μ by T\_{μ^{-1}} and the tower by that of the datum (G,b,μ^{-1}).

**Reason.** On p. 337, T\_{μ^{-1}}(A) restricted to Bun\_G^1, for A on Bun\_G^b with b=μ(π^{-1}), is computed by the modifications of the trivial G-torsor, bounded by μ, whose result is isomorphic to E\_b. On p. 338, T\_std applied to a sheaf on the stratum of O(−1/n) and restricted to Bun^1 is computed by the minuscule modifications of E that contain O(−1/n). Both say that T\_μ(A) at a bundle E integrates A over modifications E′→E of type μ. Hence i^{b\*}T\_μ(j\_!A) uses modifications of type μ from E\_1 to E\_b, which exist exactly for b ∈ B(G,μ^{-1}) ([SW20, Proposition 24.1.2]); and [SW20, Definition 24.1.1], cited for the tower, requires b ∈ B(G,μ^{-1}). For G=G\_m and μ(z)=z, p. 324 sends the stratum of O to the stratum of O(−1) (b=π), pp. 337–338 to that of O(1) (b=π^{-1}).

Searched for an existing correction: the register of recorded mistakes of this source (no entry at IX.3, pp. 324–327, or at I.7); the copy read (author-hosted 356-page file), including the introduction's statement of the same results (I.7, pp. 30–32); not checked: the published Astérisque edition and the arXiv versions.

### E25. Fargues–Scholze, Chapter IX, §IX.3, displayed chain of isomorphisms on p. 325, second line

Kind: error. Affects: nothing. Known: new.

**The source.** The displayed duality chain substitutes the ordinary smooth dual on the b-stratum without its nonbasic dualizing character and cohomological shift.

**Correction.** Exact for basic b. For general b: D(i^b\_!B)=Ri^b\_\*RHom(B,i^{b!}Λ), and i^{b!}Λ is the dualizing complex of Bun\_G^b, an invertible object in cohomological degree 2⟨2ρ,ν\_b⟩. So in the last three lines [ρ^∨] has to be replaced by [ρ^∨]⊗i^{b!}Λ, a shift by 2⟨2ρ,ν\_b⟩ and a twist by a character of G\_b(Q\_p).

**Reason.** Bun\_G^b is cohomologically smooth of ℓ-dimension −⟨2ρ,ν\_b⟩ (Proposition IV.1.22), while Bun\_G has ℓ-dimension 0 (Theorem IV.1.19) and dualizing complex isomorphic to Λ (footnote on p. 180); so i^{b!}Λ is not Λ unless ν\_b is central, and a local Shimura datum allows non-basic b ∈ B(G,μ). Here D is RHom\_lis(−,Λ), as in Theorem IX.2.2 which the next line uses, so the first line [ρ]=D([ρ^∨]) is smooth biduality and does not absorb the shift.

Searched for an existing correction: the register of recorded mistakes of this source (no entry at IX.3, pp. 324–327, or at I.7); the copy read (author-hosted 356-page file), including the introduction's statement of the same results (I.7, pp. 30–32); not checked: the published Astérisque edition and the arXiv versions.

### E26. Fargues–Scholze, Chapter IX, §IX.3, proof of Proposition IX.3.2, p. 326

Kind: misprint. Affects: nothing. Known: new.

**The source.** The source claims a natural morphism M → Sht\_{(G,b,μ•,K)} that becomes an isomorphism outside the partial diagonals twisted by Frobenius.

**Correction.** there is a natural map from Sht\_{(G,b,μ•,K)} to M that is an isomorphism away from Frobenius-twisted partial diagonals

**Reason.** The next sentences construct the map starting from a shtuka: its restrictions near {π=0} and near {[ϖ]=0} give two bundles on X\_S, identified away from the images of the legs, and the text says that the procedure can be reversed when these images in X\_S are disjoint. Over a twisted diagonal a modification at one point of X\_S bounded by μ\_i+μ\_j does not determine the successive modifications that a shtuka records ([SW20, §23.4], where the boundedness condition is said to carry additional data, the intermediate modifications), so there is no map in the printed direction there. In the same paragraph the bundles are called vector bundles where G-bundles are meant.

Searched for an existing correction: the register of recorded mistakes of this source (no entry at IX.3, pp. 324–327, or at I.7); the copy read (author-hosted 356-page file), including the introduction's statement of the same results (I.7, pp. 30–32); not checked: the published Astérisque edition and the arXiv versions.

### E27. Fargues–Scholze, Chapter IX, §IX.3, first line of p. 326; the same in Chapter I, §I.7, p. 31

Kind: misprint. Affects: nothing. Known: new.

**The source.** The source describes Gr^tw\_{G,∏\_{i∈I}Spd Ĕ\_i} → ∏\_{i∈I} Spd Ĕ as a twisted version of the convolution affine Grassmannian.

**Correction.** Gr^tw\_{G,∏\_{i∈I}Spd Ĕ\_i} → ∏\_{i∈I} Spd Ĕ\_i

**Reason.** The base of the tower f\_K and of the period map π\_K in the two displays just before is ∏\_{i∈I}Spd Ĕ\_i; in this paragraph E is the base field and E\_i are the fields of definition, and Ĕ without index is not the base of anything. The display of the proposition on the same page also has an unbalanced bracket in '[∗/G\_b(E))]'.

Searched for an existing correction: the register of recorded mistakes of this source (no entry at IX.3, pp. 324–327, or at I.7); the copy read (author-hosted 356-page file), including the introduction's statement of the same results (I.7, pp. 30–32); not checked: the published Astérisque edition and the arXiv versions.

### E28. Scholze–Weinstein, Lecture 24, proof of Theorem 24.2.5, pp. 227 and 228 (two displays)

Kind: misprint. Affects: nothing. Known: new.

**The source.** The two comparison displays name GL\_r although the height and Tate-module rank in this theorem are n.

**Correction.** M^♦\_{X,Q̆\_p} → Sht\_{(GL\_n,b,μ)}

**Reason.** The theorem and the rest of its proof are for GL\_n, n the height of the p-divisible group. No rank r is introduced; in the same proof (p. 227) r denotes a radius, in Y\_{[r,∞)}(S) and Y\_{(0,r]}(S).

Searched for an existing correction: the register of recorded mistakes of this source (six entries, none in Lectures 23–24); the copy read (print-ready file of 27 March 2020); not checked: the Annals of Mathematics Studies printing.

### E29. Scholze–Weinstein, Lecture 24, §24.3, footnote 1, p. 230

Kind: misprint. Affects: nothing. Known: new.

**The source.** Using the alternative normalization from [RZ96], b\_RZ = χ(p)b and μ\_RZ = χμ^{-1}, the source states that the corresponding condition is b\_RZ ∈ B(G,μ\_RZ^{-1}).

**Correction.** this corresponds to b\_RZ ∈ B(G,μ\_RZ).

**Reason.** χ is the central cocharacter acting by scalars on V (appendix to Lecture 21, p. 200). Multiplying b by the central element χ(p) adds χ to the Newton point and to the Kottwitz invariant, so b ∈ B(G,μ^{-1}) is equivalent to χ(p)b ∈ B(G,χμ^{-1})=B(G,μ\_RZ). Check for GL\_n and μ=(1^d,0^{n−d}): κ(b)=−d, κ(b\_RZ)=n−d, and μ\_RZ=(0^d,1^{n−d}) has degree n−d, while μ\_RZ^{-1} has degree d−n.

Searched for an existing correction: the register of recorded mistakes of this source (six entries, none in Lectures 23–24); the copy read (print-ready file of 27 March 2020); not checked: the Annals of Mathematics Studies printing.

### E30. Scholze–Weinstein, Lecture 24, proof of Corollary 24.3.5, p. 231, first sentence

Kind: misprint. Affects: nothing. Known: new.

**The source.** The source says it suffices to construct an isomorphism over Spd E between the associated diamonds.

**Correction.** over Spd Ĕ.

**Reason.** Both sides are smooth rigid spaces over Ĕ and the corollary is an isomorphism over Ĕ; full faithfulness of the diamond functor is applied to spaces over Ĕ, and an isomorphism of diamonds over Spd E need not respect the structure maps to Spd Ĕ.

Searched for an existing correction: the register of recorded mistakes of this source (six entries, none in Lectures 23–24); the copy read (print-ready file of 27 March 2020); not checked: the Annals of Mathematics Studies printing.

### E31. Fargues–Scholze, Chapter IX, §IX.6.1, proof of Theorem IX.6.1, p. 331

Kind: misprint. Affects: nothing. Known: PAPER-FARGUES-SCHOLZE-21/E70.

**The source.** The source invokes compatibility of geometric Satake with G → G′, a map giving isomorphisms between the adjoint groups.

**Correction.** … with the map G′ → G inducing isomorphisms of adjoint groups

**Reason.** The theorem is stated for G′ → G, with dual map Ĝ → Ĝ′ and π: Bun\_{G′} → Bun\_G, and the same sentence uses Gr^I\_{G′} → Gr^I\_G.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas; the source-issue lists of the ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets.

### E32. Fargues–Scholze, Chapter IX, §IX.6.1, Theorem IX.6.1, p. 330, the diagram

Kind: misprint. Affects: nothing. Known: PAPER-FARGUES-SCHOLZE-21/E122.

**The source.** The spectral-centre diagram is labelled by Ĝ and Ĝ′ where the theorem indexes the centres by G and G′.

**Correction.** Z^spec(G′, Λ) → End(π\*A) over Z^spec(G, Λ) → End(A)

**Reason.** Definition IX.0.2(iii) indexes the spectral Bernstein centre by the group, as do IX.5.2, IX.6.2 and IX.6.3.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas; the source-issue lists of the ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets.

### E33. Fargues–Scholze, Chapter IX, §IX.6.1, proof of Theorem IX.6.1, p. 330

Kind: misprint. Affects: nothing. Known: new.

**The source.** The source uses the usual maps α : 1 → V′|\_{Ĝ′} and β : V′|\_{Ĝ′} → 1, together with elements γ\_i ∈ Γ.

**Correction.** … and elements γ\_i ∈ W\_E (or γ\_i in the discretisation W ⊂ W\_E/P), i ∈ I, as usual

**Reason.** Excursion data have γ\_i ∈ W in Definition VIII.4.2 and γ\_i ∈ W\_E in Definition IX.0.4 and IX.4.1; Γ is not introduced in Chapter IX for this purpose and elsewhere denotes the Galois group, which does not act on T\_V.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas; the source-issue lists of the ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets.

### E34. Fargues–Scholze, Chapter IX, §IX.6.1, proof of Theorem IX.6.1, p. 331, sentence after the displayed computation

Kind: misprint. Affects: nothing. Known: new.

**The source.** To identify π\_{H♮}S\_{V′}, the source expresses π\_H as a composite.

**Correction.** The object under π\_{H♮} is S′\_{V′}, the solid Satake kernel; restore its prime in this sentence.

**Reason.** The object identified is the kernel S′\_{V′} = D(S\_{V′})^∨ of the two displays (π\_{H♮}S′\_{V′} ≅ h\_1\*π♮Λ ⊗ S′\_V); the prime is dropped in this one place.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas; the source-issue lists of the ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets.

### E35. Fargues–Scholze, Chapter IX, §IX.6.2, Proposition IX.6.2, p. 331, top row of the diagram

Kind: misprint. Affects: nothing. Known: PAPER-FARGUES-SCHOLZE-21/E66.

**The source.** The product-centre diagram repeats G₁ in both geometric-centre factors, although its spectral factors are indexed by G₁ and G₂.

**Correction.** Z^spec(G\_1, Λ) ⊗\_Λ Z^spec(G\_2, Λ) → Z^geom(G\_1, Λ) ⊗\_Λ Z^geom(G\_2, Λ)

**Reason.** The map is the tensor product of the maps for G\_1 and G\_2.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas; the source-issue lists of the ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets.

### E36. Fargues–Scholze, Chapter IX, §IX.6.2, Proposition IX.6.2, second paragraph, p. 331

Kind: misprint. Affects: nothing. Known: PAPER-FARGUES-SCHOLZE-21/E67.

**The source.** The source assumes Schur-irreducibility of A\_1, A\_2 ∈ D\_lis(Bun\_G, L).

**Correction.** A\_1 ∈ D\_lis(Bun\_{G\_1}, L), A\_2 ∈ D\_lis(Bun\_{G\_2}, L)

**Reason.** A\_1 ⊠ A\_2 lies on Bun\_G = Bun\_{G\_1}×Bun\_{G\_2}, as in Proposition VII.7.10.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas; the source-issue lists of the ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets.

### E37. Fargues–Scholze, Chapter IX, §IX.6.3, proof of Proposition IX.6.3, p. 332

Kind: error. Affects: the proof. Known: PAPER-FARGUES-SCHOLZE-21/E121.

**The source.** The source says that the colimit is unchanged upon retaining only maps F\_n → W that factor through W′, and concludes: Exc(W, Ĝ) = colim\_{(n,F\_n→W)} O(Z¹(F\_n, Ĝ))^Ĝ ←∼ colim\_{(n,F\_n→W′)} O(Z¹(F\_n, Ĝ))^Ĝ ≅ colim\_{(n,F\_n→W′)} O(Z¹(F\_n, Ĝ′))^{Ĝ′} = Exc(W′, Ĝ′).

**Correction.** Apply the Shapiro isomorphism termwise over the W-indexed diagram, Exc(W, Ĝ) ≅ colim\_{(n,F\_n→W)} O(Z¹(F\_n×\_W W′, Ĝ′))^{Ĝ′}, and show that (F\_n → W) ↦ (F\_n×\_W W′ → W′) is cofinal.

**Reason.** For E′/E unramified quadratic and G′ = G\_m the middle and right colimits are functions on Hom(W′,G\_m²) and on Hom(W′,G\_m), so the printed isomorphisms fail.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas; the source-issue lists of the ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets.

### E38. Fargues–Scholze, Chapter IX, §IX.6.3, proof of Proposition IX.6.3, p. 332, second half

Kind: gap. Affects: the proof. Known: new.

**The source.** The source inflates V′ to (Ĝ ⋊ W\_{E′})^I and then induces to (Ĝ ⋊ W\_E)^I, calling the resulting representation V. It describes the geometric counterpart by a commutative diagram and the operation ψ\_\* on sheaves, then claims that chasing the diagram proves the result.

**Correction.** The step needs ψ\_\*S\_{V′} ≅ S\_V for V the induction of the inflation of V′: the geometric Satake equivalences for G′ over E′ and for G = Res\_{E′/E}G′ over E are intertwined by pushforward along the closed immersion Gr^I\_{G′} → Gr^I\_G×\_{(Div¹)^I}(Div′¹)^I followed by the finite étale projection, compatibly with fibre functors, fusion, and the half twists for q′ and q. This is asserted and not proved.

**Reason.** Chapter VI does not treat Weil restriction: the words occur only in Theorems I.9.6 and IX.0.5 and in IX.6.3–IX.6.4. The identification of the dual group of G with the induced group, the decomposition of Gr\_G×\_{Div¹}Div′¹ into Gr\_{G′} and the Grassmannians at the conjugate points, and the comparison of the two normalisations (√q′ against √q) all enter.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas; the source-issue lists of the ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets.

### E39. Fargues–Scholze, Chapter IX, §IX.7.1, p. 334, the formula for Z¹(W\_E, Ĝ\_b) → Z¹(W\_E, Ĝ)

Kind: misprint. Affects: nothing. Known: PAPER-FARGUES-SCHOLZE-21/E124.

**The source.** The displayed parameter twist evaluates the positive-root sum of Ĝ at √q, treating that character as a dual-torus cocharacter.

**Correction.** w ↦ (2ρ̂\_G − 2ρ̂\_{G\_b})(√q)^{|w|} φ(w), with 2ρ̂\_G ∈ X^\*(T) = X\_\*(T̂) the sum of the positive roots of G for a Borel pair (B,T) such that ν\_b factors through T and is anti-dominant with respect to B (so B lies in the parabolic of the Harder–Narasimhan filtration of E\_b); this is the form in which the formula is stated in Hamann–Imai, Dualizing complexes on the moduli of parabolic bundles, arXiv:2401.06342v4, Lemma 4.7. With ν\_b dominant, as in §III.5.1.1, the same formula has the inverse twist.

**Reason.** Half the sum of the positive roots of Ĝ is a character of T̂ and cannot be evaluated at √q; the formula needs the cocharacter of T̂ given by the positive roots of G, which is central in Ĝ\_b.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas; the source-issue lists of the ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets.

### E40. Fargues–Scholze, Chapter IX, §IX.7.1, proof of Theorem IX.7.2, pp. 335–336

Kind: misprint. Affects: nothing. Known: new.

**The source.** For every b ∈ B(G), the source claims a canonical parabolic reduction, with parabolic P = P\_b ⊂ G containing the subgroup B. It chooses µ : G\_m → G whose dynamical parabolic is P and sets b\_N = bµ(π^N) for any N ≥ 0. On p. 336 it claims automatic compatibility with the Harder–Narasimhan reduction to P, and concentration on Bun\_G^{b\_N} ≅ Bun\_P^{b\_N} ⊂ Bun\_P by that reduction.

**Correction.** The parabolic of the Harder–Narasimhan reduction of E\_b is opposite to the standard parabolic containing B: in §III.5.1.1 (p. 105), B ⊂ P\_b^+ and the canonical reduction is E\_{b\_M}×^{M\_b}P\_b^−. Read P as the Harder–Narasimhan parabolic throughout, drop 'containing B', and put b\_N = bµ(π^{−N}), in line with the proof of Corollary IX.7.3 (p. 337), which takes b = µ(π^{−1}) for µ with dynamical parabolic P. Alternatively keep P ⊃ B and b\_N = bµ(π^N), and replace P by the opposite parabolic in 'Harder–Narasimhan reduction to P', Bun\_P and Hck^I\_P.

**Reason.** With the convention E\_π = O(−1) (§II.2: O(−λ) is attached to the isocrystal of slope λ), take G = GL\_2, B upper triangular and b = diag(1, π^{−1}), so E\_b = O ⊕ O(1) and ν\_b = (0,−1) is dominant. Then P\_b^+ = B, but the Harder–Narasimhan filtration O(1) ⊂ E\_b is stabilised by the opposite Borel, so Bun\_G^b is a stratum of Bun\_{B^−}, not of Bun\_B. With µ = (1,0), of dynamical parabolic B, the printed b\_N gives O(−N) ⊕ O(1), again with Harder–Narasimhan parabolic B^−. With P = B^− and µ = (0,1) the printed formula gives O ⊕ O(1−N), which is not increasingly unstable, while bµ(π^{−N}) gives O ⊕ O(1+N), the pushout of O → O(1) along µ^N as the next paragraph of the proof says.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas; the source-issue lists of the ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets; FS §III.5.1.1 (p. 105) and Example V.3.4 (p. 174) for the convention on P\_b.

### E41. Fargues–Scholze, Chapter VIII, §VIII.4, first line of p. 291

Kind: misprint. Affects: nothing. Known: PAPER-FARGUES-SCHOLZE-21/E117.

**The source.** The source defines End(C)^{BW\_E^I} as the category whose objects are F ∈ End(C) with a group homomorphism W^I → Aut(F).

**Correction.** Use the discrete-action notation End(C)^{BW^I}: its objects carry W^I-actions. The subscript E is extraneous here.

**Reason.** The section works with a discrete group W and the displayed functor has target End(C)^{BW^I}.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas; the source-issue lists of the ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets.

### E42. Scholze–Weinstein, Lecture 23, §23.3, the two paragraphs before the display of the period morphism, p. 220 (lines 1, 4 and 11 of the page); print-ready file of 27 March 2020

Kind: misprint. Affects: nothing. Known: new.

**The source.** The source recalls that GrG,Spd E,µ assigns to S untilts S♯ over E, a G-torsor P on S×̇Qp, and a trivialization outside S♯ that is meromorphic with bound µ at S♯. It then describes the S-points of GrG,Spd E,µ by a correspondence yielding an S-point of GrG,Spd Ĕ,µ.

**Correction.** Gr\_{G,Spd E,≤µ} (twice) and Gr\_{G,Spd Ĕ,≤µ}, as in the display that follows: π\_GM : Sht\_{𝒢,b,µ} → Gr\_{G,Spd Ĕ,≤µ}.

**Reason.** The condition stated is boundedness by µ, which defines the Schubert variety; the subscript µ without ≤ is the notation for the open cell (Proposition 20.2.3 gives Gr\_{G,Spd E,≤µ} = Gr\_{G,Spd E,µ} for minuscule µ). For non-minuscule µ the period of a point need not lie in the cell: for G = GL\_2, µ = (2,0), b = p⁻¹·1\_2 the modification E = E\_b(−S♯) ⊂ E\_b = O(1)² has type (1,1), E is trivial, and the resulting points of Sht\_{GL\_2,b,µ} map to Gr\_{≤µ} ∖ Gr\_µ.

Searched for an existing correction: register of source issues: entries PAPER-SCHOLZE-WEINSTEIN-20/E1–E6 (none at Lectures 22–24); the author-hosted print-ready file of 27 March 2020 itself (the only version read; the published Annals of Mathematics Studies volume was not collated).

### E43. Gleason–Lourenço, Section 3, the sentence after (3.1) and the definition of d^M\_{μ,b} before Theorem 3.2, p. 10 (arXiv v2)

Kind: misprint. Affects: nothing. Known: new.

**The source.** The source places the image of BL\_b in the unique component of Bun\_G indexed by μ^♮ − κ\_G(b) ∈ π\_1(G)\_Γ. For b ∈ B(M), it defines d^M\_{μ,b} as the unique basic class in B(M) satisfying κ\_M(d^M\_{μ,b}) = μ^♮ − κ\_M(b), and uses b\_μ for d^G\_{μ,b} when M = G.

**Correction.** For M = G the sign is the opposite one: BL\_b factors through the component of Bun\_G on which the Kottwitz invariant is κ\_G(b) − μ^♮ (equivalently, the first Chern class is μ^♮ − κ\_G(b)), and b\_μ is the basic class with κ\_G(b\_μ) = κ\_G(b) − μ^♮. The convention for d^M\_{μ,b} with M a proper Levi subgroup, and with it the Newton point used in (3.6), has to be fixed consistently with this.

**Reason.** In the paper Gr\_{G,μ} is the space of modifications E ⇢ E\_b of type bounded by μ, and for b ∈ B(G,μ), that is κ\_G(b) = μ^♮, the trivial bundle occurs. The Kottwitz invariant is additive on line bundles and the type of a modification does not change when both bundles are tensored with a line bundle. So for G = G\_m, b = 1 and μ = id: if κ(b\_0) = 1, the trivial bundle is a modification of E\_{b\_0} of type μ, hence the modification of the trivial bundle of type μ is E\_{b\_0}⁻¹, of invariant −1 = κ(b) − μ^♮, while the printed formula gives +1. The same happens for an adjoint quasi-split group: for G = PGL\_3, b = 1 and μ = (1,0,0) one has π\_1(G)\_Γ = Z/3, μ^♮ = 1, b ∈ A\_Z(G,μ), the modified bundle has invariant −1 and the printed b\_μ has invariant +1 ≠ −1, so the stratum Gr^{(b\_μ,b)}\_{G,μ} of Theorem 3.2 as printed is empty; the theorem holds for the class with the opposite invariant. For b ∈ B(G,μ) both formulas give 0, so Theorems 1.1 and 3.1 are not affected, and the proof of Theorem 3.2 only uses that b\_μ is the unique basic class in the image of BL\_b.

Searched for an existing correction: the arXiv listing of arXiv:2210.08625, opened on 7 October 2026 (v1 16 October 2022; v2 28 December 2022, whose listing says that the proof of Lemma 3.3 was repaired and the introduction revised; v2 is the latest and the text read; no journal reference listed); the register of mistakes recorded in the atlas, which has no entry for this paper; a published version was not located.

### E44. Scholze–Weinstein, Lecture 24, §24.3, paragraph before Definition 24.3.2, p. 230 (print-ready copy of 27 March 2020)

Kind: misprint. Affects: nothing. Known: new.

**The source.** The source requires definition over the reflex field E and satisfaction of the conditions in Section 21.4.

**Correction.** Refer to the appendix to Lecture 21, p.200: μ has only weights 0 and 1 on V⊗Q̄\_p, and in the PEL case c∘μ is the identity cocharacter.

**Reason.** Section 21.4 (Local models, pp. 194–196) imposes no conditions on μ beyond minuscule. The two conditions on μ that translate [RZ96, Definition 3.18] are stated on p. 200, in the appendix to Lecture 21, whose items are numbered 21.6.x; the paragraph at the start of §24.3 itself refers to the appendix to Lecture 21 for the data.

Searched for an existing correction: the register of recorded mistakes of this source (six entries, none in Lectures 21 appendix or 24); the copy read (print-ready file of 27 March 2020): table of contents and pp. 194–204, 229–231; not checked: the Annals of Mathematics Studies printing.

### E45. Fargues–Scholze, Chapter IX, §IX.5, proof of Proposition IX.5.1, p. 328

Kind: gap. Affects: the proof. Known: new.

**The source.** Assuming a ⊗-generator V ∈ Rep\_{Z\_ℓ}(Ĝ ⋊ Q), the source claims that triviality of the P-action on T\_V(A) suffices.

**Correction.** What the proof has shown is that the class of V with P acting trivially on T\_V(A) is closed under tensor products; exactness of V ↦ T\_V(A) and the full faithfulness proved at the start of the proof add closure under finite direct sums, direct summands, extensions and resolutions. The step needs one of two further inputs, and gives neither: a representation V from whose tensor powers every object of Rep\_{Z\_ℓ}(Ĝ⋊Q) is obtained by these operations, with a proof that it exists; or closure of the class under subobjects, quotients and duals.

**Reason.** Rep\_{Z\_ℓ}(Ĝ⋊Q) is not semisimple, so a representation that is a subquotient of sums of V^{⊗a}⊗(V^∨)^{⊗b} need not be a direct summand of one. The (W\_E/P)-equivariant objects form a full stable subcategory, and for an exact sequence 0 → W′ → W → W″ → 0 with W in the class this gives only that W′ and W″ are in the class together. Example of the obstruction: Ĝ = GL\_2, ℓ = 2, V the standard representation. The determinant is a quotient of V⊗V, but it is not obtained from the representations V^{⊗a}⊗(V^∨)^{⊗b} by finite direct sums, direct summands, shifts and cones: after reduction mod 2 the central character forces a − b = 2, every such tensor product is free over the distribution algebra F\_2[x]/x² of the Frobenius kernel of the upper unipotent subgroup (V itself is free of rank one), and the trivial module is not a perfect complex over F\_2[x]/x². Over a field of characteristic 0 the step is correct for V = V\_0 ⊕ V\_0^∨ with V\_0 faithful, by semisimplicity.

Searched for an existing correction: the register of mistakes recorded for Fargues–Scholze in the atlas (129 entries; none for IX.5.1); the source-issue lists of the HeckeStacksAndLocalShtukas, ExcursionOperatorsAndSpectralAction and GeometricSatakeAndFusion packets; the author-hosted 356-page copy itself (the only occurrence of '⊗-generator' is on p. 328).

### E46. Fargues–Scholze, Chapter IX, §IX.7.1, proof of Theorem IX.7.2, pp. 336–337

Kind: gap. Affects: the proof. Known: new.

**The source.** The source proposes B\_N = Rπ\_!A′\_N. It claims (cohomological) smoothness on the support of A′\_N for π : Bun\_P → Bun\_M, making Rπ\_! applicable despite π being stacky. It says everything lies on one stratum and all relevant categories are equivalent to D(G\_b(E), Λ). After these translations, it claims agreement of excursion operators on Bun\_G^{b\_N} and Bun\_M^{b\_N}, proving the result.

**Correction.** For the identifications of the strata with D(G\_b(E),Λ) by pullback, B\_N = Rπ\_!A′\_N corresponds to σ ⊗ κ[2d\_b], with κ the character of G\_b(E) on Rπ\_!Λ (the inverse modulus character of the Harder–Narasimhan parabolic). The comparison of excursion operators has to carry κ: its contribution q^{|w|} on 2ρ̂\_G − 2ρ̂\_M combines with the twist of the constant-term kernel to the twisted embedding of §IX.7.1. Alternatively compute with π^\* instead of Rπ\_!: T\_V∘π^\* ≅ π^\*∘T^M for the kernel CT\_P(S\_V), with no correction term.

**Reason.** κ is not trivial. For G = GL\_2 and E\_b = 𝒪 ⊕ 𝒪(1) the fibre of π over the stratum is the classifying stack of BC(𝒪(1)) = B^{φ=π}, the perfectoid open unit disc Spd k[[t^{1/p^∞}]]; multiplication by a uniformiser is the Frobenius t ↦ t^q, which acts by q on H²\_c = Λ(−1), so a uniformiser of a factor of G\_b(E) = E^× × E^× acts on Rπ\_!Λ by q or q^{−1}. An element of the Bernstein centre is not invariant under twisting by a character (on Λ[T(E)/K] the twist multiplies [x] by a power of κ(x)), so the two sides of the triangle are compared up to tw\_κ only. The source never introduces this character: the word 'modulus' does not occur in the text. The character is computed in Hamann–Imai, Dualizing complexes on the moduli of parabolic bundles, arXiv:2401.06342v4, Proposition 4.1: for p\_b: Bun\_G^b → [∗/G\_b(E)] one has p\_b^!Λ ≅ p\_b^\*(δ\_b^{−1})[−2d\_b], d\_b = ⟨2ρ,ν\_b⟩, with δ\_b a modulus character; hence Rπ\_!π\*σ ≅ σ ⊗ δ\_b[2d\_b]. Their Lemma 4.7 uses the formula of §IX.7.1 for ν\_b anti-dominant, and it is consistent with Proposition 4.1 under Verdier duality, so the statement of the theorem is not in doubt. With P the Harder–Narasimhan parabolic the kernel has the cyclotomic twist (2ρ̂\_G − 2ρ̂\_M)(√q)^{−|w|} (entry for the sentence on CT\_P(S\_V), p. 337), and its product with the parameter (2ρ̂\_G − 2ρ̂\_M)(q)^{|w|} of δ\_b (geometric normalisation of class field theory) is (2ρ̂\_G − 2ρ̂\_M)(√q)^{|w|}, the formula of §IX.7.1 for ν\_b anti-dominant. Without the character one obtains instead the same formula for the positive system with ν\_b dominant, which is the inverse twist.

Searched for an existing correction: arXiv:2102.13459 abstract page: versions v1 (26 February 2021) to v4 (27 November 2024); the author-hosted file read has the text of v4; the published version, Astérisque 466 (2026): not read; Hamann–Imai, Dualizing complexes on the moduli of parabolic bundles, arXiv:2401.06342v4 (7 May 2025): computes the character (Proposition 4.1) and uses Theorem IX.7.2 as stated (proof of their Lemma 4.7); it records no gap in the proof of IX.7.2; register of source issues of the atlas: no entry for the proof of IX.7.2 on pp. 336–337.


## Independent review of revision round 2

Accepted by `independent-review-REV-HeckeStacksAndLocalShtukas~2` on 8 October 2026 as a complete target-level pass. The [review report](../reviews/REV-HeckeStacksAndLocalShtukas~2.md) records the per-node checks, source-issue verdicts and supplier corrections. Acceptance does not close any layer: all five remain `planned`, the 22 requests and nine gaps remain open, and no implementation is claimed.
