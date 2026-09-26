# Roadmap: analytic adic geometry required for diamonds

*Proposed roadmap `AdicEtaleGeometry`. It starts where the Tau Ceti roadmap **Foundations of adic
spaces** (`tauceti:TauCetiRoadmap/AdicSpaces`, called **the anchor** below) and its successor
**Foundations of adic spaces, Part II** (`AdicSpacesPartII`) stop, and supplies the analytic
geometry that Scholze's *Étale cohomology of diamonds* (ECD) uses before diamonds exist.*

## Purpose

ECD builds diamonds out of perfectoid spaces and then compares the étale site of an analytic adic
space with that of its diamond. Before that comparison can be stated, the adic side needs its own
étale geometry in a generality beyond Huber's noetherian setting: finite étale algebras over
arbitrary complete Tate rings, étale morphisms defined by a local description, the étale,
finite étale and pro-étale sites with their points, the presentation of non-sheafy spaces, the
nonnoetherian approximation statement ECD 6.4(iv), and the tower of finite étale torsors whose
uniform completion is perfectoid (ECD 15.3). This roadmap plans exactly that. The ordinary morphism
theory (completed tensor products, fibre products, separated, proper, finite, smooth and étale
morphisms in Huber's sense, analytification and formal models) is AdicSpacesPartII's; layers A0
and A2 are the supplier contracts that identify it on the same carriers.

| Layer | Title | What it builds |
|---|---|---|
| A0 | Completed tensor products and the fibre products actually used | the contract with AdicSpacesPartII R0: completed tensors, uniformisation, analytic pullbacks, analytic loci of non-Tate spaces |
| A1 | Finite étale and étale geometry | finite étale algebras and morphisms, étale morphisms by local description, the étale, finite étale and pro-étale sites, geometric points, strict localisations, Yoneda-adic presentations |
| A2 | Separatedness, smooth charts, and classical analytic geometry | the contract with AdicSpacesPartII R0–R2 and F0; relative polydiscs and tori, smooth morphisms by ball charts, dimension of adic spaces |
| A3 | The nonnoetherian affinoid étale approximation input | pseudocoherent modules, the closed embedding into a relative ball, perturbation lemmas, ECD 6.4(iv) |
| A4 | Analytic adic presentations for diamondification | uniform completion and étale invariance, the finite étale torsor tower, perfectoidness, the perfectoid cover presentation |

```text
AdicSpacesPartII R0–R2, F0 → A0, A2
A0, AdicSpacesPartII R0     → A1 → A2
A1, PerfectoidSpaces P1–P5  → A3
A1, AdicSpacesPartII R0     → A4 → DiamondsAndVStacks D6
```

## Prerequisites and boundaries

- **The anchor**, Layers 0–5, and **AdicSpacesPartII** (R0–R5, F0), whose node identifiers the
  declarations below cite. AdicSpacesPartII owns the completed tensor product, uniformisation,
  fibre products and Huber's morphism theory; A0 and A2 add only the comparisons and the few objects
  its text leaves to this roadmap (relative polydiscs and tori, smooth morphisms by ball charts,
  dimension).
- **PerfectoidSpaces** P1–P5: perfectoid Tate rings, rational localisation, almost purity and
  cofiltered limits with the finite-stage descent ECD 6.4(o)–(iii), which A3 imports; its P2 owns
  the perfectoid pullback theorem.
- **DiamondsAndVStacks** D0 (Deligne's theorem on coherent topoi) and D6, which owns Spd, the
  representability of diamonds and the identification of the étale sites of ECD 15.4–15.6.
- **ClassicalAdicEtaleCohomology** H0 owns derived étale cohomology; this roadmap's sites are
  geometric sites, not definitions of derived cohomology. **AInfCohomology** AI.3 owns the affinoid
  perfectoid basis of the pro-étale site.
- **Consumers.** AdicSpacesPartII R4 (the re-export of the sites on its carriers) and R5,
  PerfectoidSpaces P0–P9, DiamondsAndVStacks D2–D6, PadicHodgeTheory P7–P8, AdicCoefficients L0–L6,
  RelativeFarguesFontaine RF0.

## Pinned conventions

1. Huber pairs, completeness (including Hausdorff) and adic spaces are the anchor's; morphism classes
   in Huber's sense are AdicSpacesPartII's.
2. Finite étale and étale morphisms of analytic adic spaces are defined by the local description
   (Kedlaya–Liu 8.2.16): locally an open immersion, a finite étale morphism and an open immersion.
   On locally noetherian analytic spaces they agree with Huber's (A1).
3. Base change, composition and the sites are stated for **strongly sheafy** spaces (Hansen–Kedlaya):
   sheafiness alone is not known to survive finite étale extension. Non-sheafy spaces are handled as
   **Yoneda-adic spaces** (sheaves on complete Huber pairs glued from sheafified spectra).
4. Pro-étale coverings follow Scholze's erratum: a covering map is a transfinite tower of pullbacks of
   finite étale surjections followed by an étale map; the deleted Proposition 3.8 and the last claims of
   Proposition 3.13 of the 2013 paper are never used.
5. Geometric points are morphisms `Spa(C, C⁺) → X` with `C` complete algebraically closed and `C⁺` of
   any rank; nothing is tested only on rank-one points.
6. The dimension of an adic space is the topological Krull dimension of its underlying space
   (Mathlib `topologicalKrullDim`).
7. Names: ring-level declarations in `TauCeti.Huber`, geometry in `TauCeti.AdicSpace`, Yoneda-adic
   spaces in `TauCeti.YonedaAdic`; the names below omit `TauCeti.`.

<a id="a0"></a>

## A0. Completed tensor products and the fibre products actually used

### A0. Completed tensor products and the fibre products actually used

**Canonical owner:** AdicSpacesPartII R0 (`AdicSpacesPartII:R0`). A0 is the supplier contract of this
roadmap with R0: it identifies, on the same carriers, R0's completed tensor product, its topology,
plus ring and universal property, its uniformization and its affinoid fibre products with the objects
the diamond and perfectoid layers use, and proves the comparisons that R0 does not state (pullback
along rational and finite étale maps, chart independence, associativity and unit, tracking of the
definition data and plus rings). It constructs one new object, the analytic locus of an adic space
with its restriction interface, needed to apply R0's constructions to analytic adic spaces over
`Spa(ℤ_p, ℤ_p)` with non-Tate charts. It keeps explicit the boundary with PerfectoidSpaces P2, which
proves that the relevant products of perfectoid spaces are perfectoid.

**Dependencies.** AdicSpacesPartII R0 (completed tensor products, fibre products, adic morphisms,
finite morphisms, uniformization); the Tau Ceti anchor `tauceti:TauCetiRoadmap/AdicSpaces`, Layers 0
(completion of Huber pairs), 2 (analytic points of `Spa`), 3 (rational localisation, the category
`𝒱`) and 5 (adic spaces, open subspaces, gluing), which are requested where the pinned Tau Ceti tree
lacks them. A0 uses no stage that depends on it: PerfectoidSpaces P2, AdicSpacesPartII R4–R5 and AdicEtaleGeometry
A1 consume A0 and appear below only in examples and boundaries. **Consumers:** AdicEtaleGeometry A1,
PerfectoidSpaces P2 (fibre products of perfectoid spaces), PerfectoidSpaces P8/P9 (quotients and
scalar extension), FarguesFontaineDiamonds F4, RelativeFarguesFontaine RF0.

#### Conventions

1. **Huber pairs and morphisms.** Huber pairs are Tau Ceti `Huber.Pair` on complete Hausdorff
   Huber rings; morphisms are Tau Ceti `Huber.Pair.Hom` (continuous, preserving plus rings).
2. **Adic homomorphisms.** A completed tensor product `B ⊗̂_A C` is formed only along adic ring maps
   (`AdicSpacesPartII:R0/adic-ring-homomorphism`); over a Tate ring `A` every continuous map is adic.
   Over a non-Tate base such as `ℤ_p` or `ℤ_p⟦T⟧` adicness is a condition, and fibre products along
   non-adic maps are computed by R0's ascending unions of affinoids, not by a tensor formula.
3. **The completed tensor product** is R0's `Huber.Pair.completedTensor`: the Hausdorff completion of
   `B ⊗_A C` for the `{Iⁿ·F}`-topology, with plus ring the closure of the integral closure of the image
   of `B⁺ ⊗_{A⁺} C⁺`. It is never uniformised implicitly, and its sheafiness is never inferred from the
   formula: it is a hypothesis wherever an adic space is formed.
4. **Analytic points.** A point is analytic if its support in an affinoid neighbourhood is not open;
   an adic space is analytic if all its points are. Every morphism into an analytic adic space is adic.
5. **Existence of fibre products** is Huber's Proposition 1.2.2 as R0 states it (one leg locally of
   finite type, or locally of weakly finite type with the other leg adic, and a stably sheafy cover of
   the second factor). Nothing is asserted outside these hypotheses: fibre products of adic spaces do
   not exist in general.

#### A0.1 The supplier contract: the pushout of complete Huber pairs

`AdicEtaleGeometry:A0/supplier-contract-fibre-products` (comparison; declaration
`Huber.Pair.completedTensor.isPushout`). For morphisms `f : (A, A⁺) → (B, B⁺)`, `g : (A, A⁺) → (C, C⁺)`
of complete Hausdorff Huber pairs with adic ring maps, the square `(f, g, inl, inr)` with
`D = B ⊗̂_A C` is a pushout in the category of complete Hausdorff Huber pairs. This single statement is
A0's contract, on R0's carrier:

- *topology* — `D` is the completion of `B ⊗_A C` for the group topology with neighbourhood basis
  `{Iⁿ·F}`, `F` the image of `B₀ ⊗_{A₀} C₀`, with pair of definition `(F, I·F)`, independent of the
  choices;
- *plus ring* — `D⁺` is the closure of the integral closure of the image of `B⁺ ⊗_{A⁺} C⁺`; since
  `D⁺` is integrally closed in `D` and closed, it is also the closure of the integral closure of that
  image *in `D`*, which is Kedlaya–Liu's plus ring of the coproduct of adic Banach rings and the plus
  ring `D⁺` of Scholze's Proposition 6.18;
- *universal property* — every compatible pair of morphisms into a complete Hausdorff Huber pair
  factors uniquely, with no adicness condition on the pair;
- *geometry* — when all four pairs are sheafy, `Spa D = Spa B ×_{Spa A} Spa C` in adic spaces
  (`AdicSpacesPartII:R0/affinoid-fibre-product`), globalised by `AdicSpacesPartII:R0/fibre-products-existence`.

Sheafiness of `D` is supplied for `B` of noetherian type and `g` topologically of finite type
(`AdicSpacesPartII:R0/completed-tensor-noetherian-stability`); for perfectoid `(A, B, C)` over a
perfectoid field it is PerfectoidSpaces P2's theorem that `D` is perfectoid and that perfectoid fibre
products exist (`PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`), a result that applies this
node and is not part of it.

Acceptance:

- Scalar extension of a Tate algebra (A0 test): for a complete extension L/K of nonarchimedean fields, (K⟨T⟩, K°⟨T⟩) ⊗̂_{(K, K°)} (L, L°) ≅ (L⟨T⟩, L°⟨T⟩) through AdicSpacesPartII:R0/completed-tensor-restricted-power-series (b), and Spa(L⟨T⟩, L°⟨T⟩) = Spa(K⟨T⟩, K°⟨T⟩) ×_{Spa(K, K°)} Spa(L, L°) is the closed unit disc over L.
- Polydisc: (K⟨T⟩, K°⟨T⟩) ⊗̂_{(K, K°)} (K⟨S⟩, K°⟨S⟩) ≅ (K⟨T, S⟩, K°⟨T, S⟩) and its Spa is the product of two closed discs (Hübner, Example 9.3).
- Plus ring is not the image: for L = ℚ_p(√p), (L, O_L) ⊗̂_{ℚ_p} (L, O_L) ≅ (L × L, O_L × O_L); the idempotent (1, 0) lies in the plus ring but not in the image of O_L ⊗_{ℤ_p} O_L.
- Perfectoid scalar extension after P2 (A0 test): for a perfectoid field K, the perfectoid affinoid K-algebra K⟨T^{1/p^∞}⟩ and a perfectoid complete extension L/K, PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces identifies Spa K⟨T^{1/p^∞}⟩ ×_{Spa K} Spa L with Spa of this node's pair K⟨T^{1/p^∞}⟩ ⊗̂_K L = L⟨T^{1/p^∞}⟩; the perfectoidness and sheafiness used there are P2's and are not consequences of this node.
- Non-example: for ℤ_p → ℤ_p⟦X⟧ ((p, X)-adic, not adic) and ℤ_p → ℚ_p there is no Huber topology on ℤ_p⟦X⟧ ⊗_{ℤ_p} ℚ_p making both maps continuous with ℤ_p⟦X⟧ open (Morel, Example II.3.2.2); the fibre product Spa ℤ_p⟦X⟧ ×_{Spa ℤ_p} Spa(ℚ_p, ℤ_p) is the open unit disc over ℚ_p, which is not affinoid (AdicSpacesPartII:R0/fibre-product-along-finite-type).

#### A0.2 Uniformization, supplied separately

`AdicEtaleGeometry:A0/uniformization-contract` (comparison; declaration
`Huber.Pair.uniformCompletedTensor.isPushout`). Over a Tate base, R0's uniform completed tensor product
`B ⊗̂ᵘ_A C = (B ⊗̂_A C)^u` is the pushout in complete Hausdorff *uniform* Tate Huber pairs; the
comparison map `ι : B ⊗̂_A C → B ⊗̂ᵘ_A C` is the unit of the uniformization adjunction, induces a
homeomorphism of adic spectra matching rational subsets, and is an isomorphism exactly when
`B ⊗̂_A C` is uniform. A separated completion need not be uniform: `ℂ_p ⊗̂_{ℚ_p} ℂ_p` is not.
A0's fibre products use `B ⊗̂_A C` itself; uniformization enters only where a consumer works among
uniform pairs, and no sheafiness of `B ⊗̂ᵘ_A C` is asserted.

Acceptance:

- K⟨T⟩ ⊗̂ᵘ_K K⟨S⟩ ≅ K⟨T, S⟩ and ι is an isomorphism (the completed tensor product is already uniform).
- ℂ_p ⊗̂_{ℚ_p} ℂ_p → ℂ_p ⊗̂ᵘ_{ℚ_p} ℂ_p is not an isomorphism: the separated completion is not uniform.
- For a finite Galois extension L/K of complete nonarchimedean fields, L ⊗̂ᵘ_K L ≅ ∏_{σ ∈ Gal(L/K)} L via x ⊗ y ↦ (xσ(y))_σ.
- Why A0's fibre products are not uniformised: a topologically split injection stays split after completed base change but may lose the splitting after uniform completion (Hansen–Kedlaya, Remark 7.2), which AdicSpacesPartII:R5 uses for sousperfectoid base change.

#### A0.3 Tracking rings of definition, pseudouniformisers and plus rings

`AdicEtaleGeometry:A0/definition-data-and-plus-ring-tracking` (lemma; declaration
`Huber.Pair.completedTensor.spa_plus_eq_inter_preimage`). The topological ring `D = B ⊗̂_A C` and
`inl`, `inr` depend only on the topological rings and ring maps; pseudouniformisers of `A`, `B` or `C`
map to pseudouniformisers of `D`; `D⁺` depends only on `(B⁺, C⁺)`, not on `A⁺`. Enlarging the plus
rings to `B'⁺ ⊇ B⁺`, `C'⁺ ⊇ C⁺` enlarges `D⁺` to `D'⁺`, and
`Spa(D, D'⁺) = Spa(inl)⁻¹(Spa(B, B'⁺)) ∩ Spa(inr)⁻¹(Spa(C, C'⁺))` inside `Spa(D, D⁺)`, which is the
fibre product of the corresponding open subspaces when all pairs are sheafy.

Acceptance:

- Independence of A⁺: let K be a complete rank-one field whose residue field carries a nontrivial valuation ring (for instance the completion of ℚ_p(t) for the Gauss norm, residue field 𝔽_p(t)) and K⁺ ⊊ K° the preimage of 𝔽_p[t]_(t); then (K⟨T⟩, K°⟨T⟩) ⊗̂_{(K, K⁺)} (K⟨S⟩, K°⟨S⟩) and the same over (K, K°) are both (K⟨T, S⟩, K°⟨T, S⟩).
- Change of plus ring: with the same K, the completed tensor product (K, K⁺) ⊗̂_{(K, K⁺)} (K, K⁺) is (K, K⁺), whose spectrum has two points (the rank-one point and the rank-two point); replacing the second factor by (K, K°) gives (K, K°), and Spa(K, K°) is the single rank-one point, which is Spa(inr)⁻¹(Spa(K, K°)).
- Pseudouniformiser: p is a pseudouniformiser of ℚ_p⟨T⟩ ⊗̂_{ℚ_p} ℚ_p⟨S⟩ = ℚ_p⟨T, S⟩.

#### A0.4 Pullback along rational open immersions

`AdicEtaleGeometry:A0/rational-pullback-comparison` (comparison; declaration
`Huber.Pair.completedTensor.rationalLocalizationIso`).

- For any morphism `g : Y → X` of adic spaces and any open `U ⊆ X`, the open subspace `g⁻¹(U)` is
  `Y ×_X U`; no hypothesis on `g` is needed.
- For `φ : (A, A⁺) → (B, B⁺)` with adic ring map and a rational subset `R(T/s)`, the preimage is the
  rational subset `R(φ(T)/φ(s))`, and `B ⊗̂_A A⟨T/s⟩ ≅ B⟨φ(T)/φ(s)⟩` over `(B, B⁺)`; this is
  PerfectoidSpaces P8's formula `A⟨f/h⟩ = A ⊗̂_B B⟨f/h⟩`. The pair is sheafy because it is the
  coordinate ring of an open subspace of a sheafy space.
- Without adicness the tensor formula is not available: the preimage of `R(p/p) = Spa(ℚ_p, ℤ_p)` in
  `Spa ℤ_p⟦X⟧` is the open unit disc over `ℚ_p`, which is not rational.

Acceptance:

- Rational pullback (A0 test): for Y = Spa(ℚ_p⟨S⟩, ℤ_p⟨S⟩) → X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩), T ↦ S², and U = {|T| ≤ |p|} = R((T, p)/p): g⁻¹(U) = R((S², p)/p) = {|S²| ≤ |p|} and ℚ_p⟨S⟩ ⊗̂_{ℚ_p⟨T⟩} ℚ_p⟨T⟩⟨T/p⟩ ≅ ℚ_p⟨S⟩⟨S²/p⟩.
- PerfectoidSpaces P8's formula A⟨f/h⟩ = A ⊗̂_B B⟨f/h⟩ for a continuous B → A of Tate rings and a rational localisation B⟨f/h⟩ is (b) with (A, B) in the roles of (B, A).
- Non-adic base (d): Spa ℤ_p⟦X⟧ ×_{Spa ℤ_p} Spa(ℚ_p, ℤ_p) = ⋃_n R(Xⁿ/p) is the open unit disc over ℚ_p (Hübner, Example 9.4; Scholze–Weinstein, Lecture 4).

#### A0.5 Pullback along finite étale maps

`AdicEtaleGeometry:A0/finite-etale-pullback-comparison` (comparison; declaration
`Huber.Pair.completedTensor.finiteEtaleEquivTensor`). Let `(A, A⁺) → (B, B⁺)` be a finite morphism of
complete Tate Huber pairs (R0) whose ring map is étale, and `(A, A⁺) → (C, C⁺)` a morphism to a complete
Tate pair. Then `B` is finite projective over `A`, the uncompleted tensor product `B ⊗_A C` with its
natural `C`-module topology is complete and equals `B ⊗̂_A C`, its plus ring is the integral closure of
`C⁺`, and `C → B ⊗_A C` is finite étale. If `B ⊗_A C` is sheafy (for example `C` strongly noetherian),
`Spa(B ⊗_A C)` is the fibre product. Over a rational subset `R(f/g)` the preimage is `R(φ(f)/φ(g))`
with ring `B ⊗_A A⟨f/g⟩`. Whether finite étale algebras over a general sheafy Tate ring are sheafy is
not known (Kedlaya–Liu, Remark 8.2.18); the sousperfectoid and perfectoid cases are AdicSpacesPartII R5
and PerfectoidSpaces P3, and the non-sheafy case is handled by AdicEtaleGeometry A1's generalized
adic presentations.

Acceptance:

- A finite étale algebra (A0 test): for p odd, A = ℚ_p⟨T^{±1}⟩ (the unit circle |T| = 1) and B = A[S]/(S² − T), which is finite étale because 2S is a unit; over the rational subset U = {|T − 1| ≤ |p|} the element T has a square root (the binomial series for (1 + (T − 1))^{1/2} converges), so B ⊗_A A⟨(T − 1)/p⟩ ≅ A⟨(T − 1)/p⟩ × A⟨(T − 1)/p⟩ without completion and Spa(B) ×_{Spa A} U is two disjoint copies of U.
- ℚ_p(√p) ⊗_{ℚ_p} ℚ_p(√p) ≅ ℚ_p(√p) × ℚ_p(√p) is already complete, and the plus ring is ℤ_p[√p] × ℤ_p[√p], the integral closure of ℤ_p[√p] in the product.
- Kummer cover: for n invertible in a complete nonarchimedean field K, the pullback of the finite étale Spa K⟨S^{±1}⟩ → Spa K⟨T^{±1}⟩, T ↦ Sⁿ, along a classical point Spa(L, L°) → Spa K⟨T^{±1}⟩ with T ↦ t is Spa(L[S]/(Sⁿ − t)).
- Kedlaya–Liu, Definition 8.2.16: finite étale morphisms of preadic spaces are 'evidently stable under base extension'; on sheafy pieces this node is that statement.

#### A0.6 Chart independence

`AdicEtaleGeometry:A0/fibre-product-affinoid-chart-comparison` (comparison; declaration
`AdicSpace.pullbackAffinoidChartIso`). For the glued fibre product `Z = X ×_S Y` of R0 (with `g` adic)
and open affinoids `W ⊆ S`, `U ⊆ f⁻¹(W)`, `V ⊆ g⁻¹(W)` with `O(U) ⊗̂_{O(W)} O(V)` sheafy, the open
subspace `p⁻¹(U) ∩ q⁻¹(V)` is canonically `Spa(O(U) ⊗̂_{O(W)} O(V))`, independently of the cover used to
glue `Z`, and compatibly with rational restriction (`AdicSpacesPartII:R0/completed-tensor-rational-localisation`).

Acceptance:

- For X = Y = Spa(ℚ_p⟨T⟩) over S = Spa ℚ_p, with the covers X = {|T| ≤ |p|} ∪ {|p| ≤ |T|} and the trivial cover, the chart over {|T| ≤ |p|} × Y is Spa(ℚ_p⟨T/p⟩ ⊗̂_{ℚ_p} ℚ_p⟨S⟩) = Spa(ℚ_p⟨T, S⟩⟨T/p⟩), the rational subset {|T| ≤ |p|} of the closed bidisc, whichever cover is used.
- A0 stage text: 'Glue affine constructions and prove the categorical pullback property, chart independence'.

#### A0.7 Associativity, symmetry and unit

`AdicEtaleGeometry:A0/fibre-product-associativity-and-unit` (comparison; declaration
`Huber.Pair.completedTensor.assoc`). For morphisms locally of finite type between spaces covered by
stably sheafy affinoids, all iterated fibre products exist (R0's base-change stability), and Mathlib's
`pullbackAssoc`, `pullbackSymmetry` and the unit isomorphism of `IsPullback.of_id_snd` are the unique
isomorphisms compatible with the projections, so every coherence identity holds. On affinoid charts
they are `Spa` of `(C ⊗̂_A B) ⊗̂_A E ≅ C ⊗̂_A (B ⊗̂_A E)` (pasting pushout squares, Mathlib
`IsPushout.paste_horiz`), of R0's `completedTensor.comm` and of `B ⊗̂_A A ≅ B`.

Acceptance:

- For S = Spa K and three closed discs, both iterated fibre products are Spa K⟨T, S, R⟩, and the associator is the identity of K⟨T, S, R⟩ under the evident identifications.
- Transitivity of base change: for the closed unit disc D over ℚ_p and an embedding ℚ_p(√p) ⊆ ℂ_p, (D ×_{Spa ℚ_p} Spa ℚ_p(√p)) ×_{Spa ℚ_p(√p)} Spa ℂ_p ≅ D ×_{Spa ℚ_p} Spa ℂ_p = Spa(ℂ_p⟨T⟩, O_{ℂ_p}⟨T⟩) (the pasting of two pullback squares; on rings R0's API `completedTensor.cancelBaseChange`).
- A0 stage text: 'associativity and unit comparison maps, with their coherence'.

#### A0.8 The analytic locus and restriction of morphisms

`AdicEtaleGeometry:A0/analytic-locus-restriction` (construction; planet *Analytic locus of an adic
space*). For an adic space `X`, `X_a` is the open adic subspace of analytic points, with its open
immersion `ι_X : X_a → X`; `X` is analytic when `X_a = X`.

- On `Spa(A, A⁺)` with `A` complete, `|X_a|` is Tau Ceti's `spaAnalytic A⁺`; it is quasi-compact and,
  for generators `G` of an ideal of definition, it is covered by the rational subsets `R(G/g)`, whose
  coordinate rings are Tate (Tau Ceti `spaAnalytic_eq_biUnion_rationalSubset`,
  `isTateRing_completion_locTopology_of_mem_generators`). These *Tate charts* are how R0's constructions
  are applied to non-Tate inputs such as `W(k)`, `ℤ_p⟦T⟧` and `A_inf`.
- A morphism `f : Y → X` is adic iff `f(Y_a) ⊆ X_a`; an adic `f` restricts to `f_a : Y_a → X_a`,
  functorially; a morphism from an analytic space to `X` factors through `X_a` iff it is adic.
- Analytic loci commute with adic base change: if `Z → X` is adic, `(Y ×_X Z)_a = Y_a ×_X Z`.
- For an adic space over `Spa(ℤ_p, ℤ_p)` with adic structure map, `X_a` is the preimage of
  `Spa(ℚ_p, ℤ_p)`; for `Spa ℤ_p⟦T⟧` or `Spa A_inf` it is larger and contains analytic points of
  characteristic `p`.

API:

- `AdicSpace.analyticLocus` (constructor): The open adic subspace X_a of an adic space X on its analytic points.
- `AdicSpace.analyticLocus.ι` (projection): The open immersion ι_X : X_a → X.
- `AdicSpace.mem_analyticLocus_iff` (characterisation): x ∈ X_a ↔ some open neighbourhood U of x has a topologically nilpotent unit in O_X(U) ↔ the support of x in an open affinoid neighbourhood is not open.
- `AdicSpace.IsAnalytic` (structure): The class of analytic adic spaces: X_a = X.
- `AdicSpace.IsAnalytic.isIso_ι` (characterisation): X is analytic iff ι_X is an isomorphism.
- `AdicSpace.analyticLocus_inf_open` (compatibility): For an open subspace U ⊆ X: U_a = X_a ∩ U.
- `AdicSpace.analyticLocus_spa` (compatibility): For X = Spa(A, A⁺), A complete: |X_a| = Tau Ceti `spaAnalytic A⁺`.
- `AdicSpace.analyticLocus_spa_eq_iUnion_tateCharts` (characterisation): For generators G of an ideal of definition, Spa(A, A⁺)_a = ⋃ R(G/g), each chart with Tate coordinate ring.
- `AdicSpace.analyticLocus_eq_top_of_isTateRing` (simp): If A is Tate then Spa(A, A⁺)_a = Spa(A, A⁺).
- `AdicSpace.analyticLocus_spa_eq_bot_iff` (characterisation): Spa(A, A⁺)_a = ∅ iff the Hausdorff quotient of A is discrete.
- `AdicSpace.IsAdic.analyticLocusMap` (functoriality): For adic f : Y → X, the morphism f_a : Y_a → X_a with ι_X ∘ f_a = f ∘ ι_Y; analyticLocusMap_id, analyticLocusMap_comp.
- `AdicSpace.analyticLocus.lift` (universal-property): For analytic T and adic g : T → X, the unique lift T → X_a with ι_X ∘ lift = g.
- `AdicSpace.isAdic_iff_image_analyticLocus` (characterisation): f is adic iff f maps Y_a into X_a (re-export of AdicSpacesPartII:R0/adic-iff-analytic-locus).
- `AdicSpace.analyticLocus_pullback` (compatibility): If g : Z → X is adic and Y ×_X Z exists, (Y ×_X Z)_a = p⁻¹(Y_a) ≅ Y_a ×_X Z.
- `AdicSpace.analyticLocus_isAnalytic` (instance): X_a is analytic.

Unit tests:

- `analyticLocus_test_powerSeries` (computation): For X = Spa(ℤ_p⟦T⟧, ℤ_p⟦T⟧) with the (p, T)-adic topology: X_a = R((p, T)/p) ∪ R((p, T)/T), each chart has Tate coordinate ring, and X_a contains the point given by the T-adic valuation of 𝔽_p((T)), which lies over the closed (non-analytic) point of Spa(ℤ_p, ℤ_p).
- `analyticLocus_test_witt` (computation): For a perfect field k and W(k) with the p-adic topology: Spa(W(k), W(k))_a = R(p/p) = Spa(W(k)[1/p], W(k)), a single point.
- `analyticLocus_test_discrete` (degenerate): For a ring R with the discrete topology, Spa(R, R)_a = ∅; for a Tate ring A, Spa(A, A⁺)_a = Spa(A, A⁺) and ι is an isomorphism.
- `analyticLocus_test_nonAdic` (non-example): The morphism Spa(ℤ_p⟦T⟧) → Spa(ℤ_p) sends the analytic T-adic point of 𝔽_p((T)) to the non-analytic closed point, so it does not restrict to analytic loci; a definition restricting every morphism to X_a fails, and (d) requires adicness.
- `analyticLocus_test_spaAnalytic` (compatibility): For X = Spa(A, A⁺) with A complete, the underlying set of analyticLocus X is Tau Ceti's `spaAnalytic A⁺` (as a subset of Spv A).
- `analyticLocus_test_ainf` (characterisation): For A_inf = W(O_F) with the (p, [ϖ])-adic topology, Spa(A_inf)_a = R((p, [ϖ])/p) ∪ R((p, [ϖ])/[ϖ]) = D(p) ∪ D([ϖ]), and it is not 𝒴 = D(p) ∩ D([ϖ]).
Acceptance:

- Spa ℤ_p⟦T⟧ ((p, T)-adic): X_a = R((p, T)/p) ∪ R((p, T)/T), both Tate charts (Hübner, Example 6.12).
- Spa(A_inf, A_inf) for A_inf = W(O_F) with the (p, [ϖ])-adic topology: X_a = D(p) ∪ D([ϖ]), strictly larger than 𝒴 = D(p) ∩ D([ϖ]) (anchor Layer 6.1).
- Every morphism of analytic adic spaces is adic (Hübner, Lemma 6.8), so the analytic adic spaces over Spa ℤ_p used in ECD §15 form a full subcategory on which (d) is vacuous.

#### Acceptance tests of A0

- **Rational pullback:** `ℚ_p⟨S⟩ ⊗̂_{ℚ_p⟨T⟩} ℚ_p⟨T⟩⟨T/p⟩ ≅ ℚ_p⟨S⟩⟨S²/p⟩` for `T ↦ S²`, and the open
  unit disc as the non-adic pullback (A0.4).
- **A finite étale algebra:** the square root of `T` over the unit circle, split over `{|T − 1| ≤ |p|}`
  without completion (A0.5).
- **Scalar extension of a Tate algebra:** `K⟨T⟩ ⊗̂_K L ≅ L⟨T⟩` and the closed unit disc over `L` as a
  fibre product (A0.1).
- **Perfectoid scalar extension after P2:** `Spa K⟨T^{1/p^∞}⟩ ×_{Spa K} Spa L = Spa L⟨T^{1/p^∞}⟩` with
  the carrier of A0.1 and perfectoidness from `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`.
- No pullback of arbitrary adic spaces is inferred from these cases.

#### Requests and boundaries

- The category of adic spaces, open subspaces and maps into affinoids (anchor Layer 5), rational
  localisation as a complete pair and Huber's category `𝒱` (anchor Layer 3), and completion of Huber
  pairs (anchor Layer 0) are requested from the Tau Ceti anchor. PerfectoidSpaces P0's request for adic
  spaces with their structure presheaf, and P8's for the category `𝒱`, are owned there.
- Completed tensor products of Banach modules and Banach spaces over a nonarchimedean field (requested
  of A0 by PerfectoidSpaces P8/P9) belong to R0's completed tensors and are requested from AdicSpacesPartII R0 (the node
  `AdicSpacesPartII:R0/completed-tensor-banach-module` proposed there).
- Sheafiness of finite étale algebras over a general sheafy Tate pair is an open problem and is kept as
  a hypothesis (gap).

<a id="a1"></a>

## A1. Finite étale and étale geometry

### A1 (part A1a). Finite étale and étale morphisms, the étale sites, geometric points

**Dependencies.** AdicEtaleGeometry A0 (pullbacks along rational open immersions and finite étale maps:
`AdicEtaleGeometry:A0/rational-pullback-comparison`, `AdicEtaleGeometry:A0/finite-etale-pullback-comparison`);
AdicSpacesPartII R0 (Huber's finite and étale morphisms, finite algebras over noetherian affinoids, completed
tensor products and affinoid fibre products, valuation amalgamation, the local structure of étale maps including
the import of Huber's Lemma 2.2.8) and R3 (Čech acyclicity of sheafy affinoids, Kiehl's theorem); the anchor's
Layers 2–5 (`tauceti:TauCetiRoadmap/AdicSpaces#layer-2-…` to `#layer-5-…`: rational-subset calculus, structure
presheaf and sheafiness predicates, sheafiness of strongly noetherian Tate rings, the category of adic spaces —
requested, see below); and, for the site of an arbitrary analytic adic space only, the Yoneda-adic spaces of part A1b
(`AdicEtaleGeometry:A1/generalized-adic-presentation` and its lemmas).

**Consumers.** AdicSpacesPartII R4 (re-export of the sites on the R0/R1 carriers, geometric points, slices) and R5
(finite étale and étale maps over sousperfectoid spaces), PerfectoidSpaces P3–P4 (the étale site of an adic space
with its finite étale and étale morphisms), PadicHodgeTheory P8 (λ: X_ét → X_an, O_{X_ét}, X_fét and π₁),
ClassicalAdicEtaleCohomology H0 (the analytic site, strict-localisation stalks, higher-rank field pairs),
AdicEtaleGeometry A1b (pro-objects of X_ét), A2 and A4, DiamondsAndVStacks D6 (the right-hand sides Y_ét, Y_fét of
ECD Lemma 15.6), AInfCohomology AI.3.

A1 owns the étale and finite étale sites of analytic adic spaces. The ordinary finite and étale morphism theory of
locally noetherian adic spaces (Huber's infinitesimal definitions, finiteness, standard étale presentations,
flatness, openness) is AdicSpacesPartII R0's and is imported, never re-planned. Part A1a defines finite étale and
étale morphisms of possibly non-noetherian analytic adic spaces by the local algebraic description of
Kedlaya–Liu and Scholze, proves the properties a site needs, compares with Huber's notions where both are defined,
and builds the sites, their points and strict localisations. These are geometric sites: no derived category or
cohomology is defined here.

#### Conventions

1. **Carriers.** Adic spaces are the anchor's (Layer 5); *analytic* means every point is analytic, so affinoid
   charts can be taken of the form Spa(A, A⁺) with A a complete Hausdorff Tate ring. Every morphism into an analytic
   adic space is adic.
2. **Finite étale algebras.** For a complete Tate ring A, FÉt(A) is Mathlib's `CommAlgCat.FiniteEtale A`
   (`Algebra.Etale A B` and `Module.Finite A B`). Such a B is finite projective; it carries the natural A-module
   topology, and its plus ring over (A, A⁺) is the integral closure of the image of A⁺ — never B° (they differ when
   A⁺ ≠ A°).
3. **Strongly sheafy.** A complete Tate ring A is strongly sheafy if every A⟨T₁, …, Tₙ⟩ is sheafy (Hansen–Kedlaya
   Definition 4.1). Sheafiness of A alone is not known to pass to finite étale extensions (Kedlaya–Liu Remark 8.2.18),
   strong sheafiness is. All results that need fibre products of étale maps inside adic spaces are stated for
   *locally strongly sheafy* spaces; this covers locally noetherian analytic spaces (rigid spaces, analytifications),
   and — by facts proved where those rings are constructed — perfectoid and sousperfectoid spaces.
4. **Étale.** `AdicSpace.IsEtaleLocalDescription f`: locally on the source an open immersion, a finite étale morphism
   and an open immersion. Huber's infinitesimal notion is R0's `AdicSpace.Etale`; the two agree on locally noetherian
   analytic spaces (§A1a.4) and Huber's notion is not used elsewhere.
5. **Coverings.** A family of étale maps is a covering when it is jointly surjective on *all* points of the adic
   spaces, including points of higher rank; surjectivity on rank-one (Berkovich) points is not enough.
6. **Geometric points** are Spa(C, C⁺) → X with C algebraically closed, complete, nontrivially valued and C⁺ ⊆ C an
   open and bounded valuation subring of any rank. Rank one is a special case, not the definition.

#### A1a.1 Strongly sheafy rings

`AdicEtaleGeometry:A1/strongly-sheafy-huber-pair` (definition). `Huber.IsStronglySheafy A` for a complete Tate ring A:
every A⟨T₁, …, Tₙ⟩ (Tau Ceti `restrictedMvPowerSeriesCompletion`) is a sheafy ring (anchor `Huber.IsSheafyRing`).
`AdicSpace.IsLocallyStronglySheafy X`: an open affinoid cover by strongly sheafy charts. Stability (proved from
Hansen–Kedlaya Theorem 4.2, Lemma 4.3, Corollary 4.5 and the Čech acyclicity of sheafy affinoids, R3): rational
localisations and Tate algebras of strongly sheafy rings are strongly sheafy; a sheafy ring with a finite rational
covering by strongly sheafy rings is strongly sheafy; hence every open affinoid of a locally strongly sheafy space
is strongly sheafy. Examples: strongly noetherian Tate rings, Tate rings with a noetherian ring of definition,
anchor-stably-sheafy rings. Non-example: the uniform non-sheafy Tate rings of Buzzard–Verberkmoes and Mihara.

API: `IsStronglySheafy`, `.isSheafyRing`, `.restrictedMvPowerSeries`, `.rationalLocalization`, `.of_rationalCover`,
`.of_isStronglyNoetherian`, `.of_isStablySheafyRing`; `AdicSpace.IsLocallyStronglySheafy` with
`.isStronglySheafy_of_isAffinoidOpen`, `.restrict`, `.of_isLocallyNoetherian`.
Tests: K⟨T₁, …, T_m⟩ is strongly sheafy; a complete nonarchimedean field is (degenerate); a uniform non-sheafy ring
is not (non-example); stably sheafy ⇒ strongly sheafy (compatibility with the anchor).

#### A1a.2 The Huber pair of a finite étale algebra

`AdicEtaleGeometry:A1/finite-etale-affinoid-algebra` (construction; historical id kept). For a complete Tate pair
(A, A⁺) and B ∈ FÉt(A), `Huber.Pair.finiteEtale A⁺ B` is the complete Tate pair (B, B⁺):

```text
topology on B  = natural A-module topology  (subspace = quotient topology of B ⊕ Q ≅ Aⁿ, Kedlaya–Liu 2.2.12)
ring of def.   = A₀[ϖᴺb₁, …, ϖᴺb_m]         (b_j A-module generators, N ≫ 0)
B⁺             = integral closure of ι(A⁺) in B
```

It is complete, Hausdorff and Tate; ι: (A, A⁺) → (B, B⁺) is a finite morphism of Huber pairs (R0); Spa(ι) has finite
fibres and is surjective when B is faithfully flat. Universal property: morphisms (B, B⁺) → (D, D⁺) under (A, A⁺)
are the A-algebra maps B → D. Base change needs no completion: C ⊗_A B → C ⊗̂_A B is a topological isomorphism, and
the preimage of a rational subset R(f/g) is R(ι f/ι g) with ring O(U) ⊗_A B. For strongly noetherian A the pair is
R0's `Huber.Pair.finiteAlgebra` and Spa(ι) is finite and Huber-étale. Sheafiness is a separate theorem; the
uniformisation comparison FÉt(A) ≃ FÉt(A^u) belongs to A4.

API: `Huber.Pair.finiteEtale`, `finiteEtale_plus`, `Huber.FiniteEtale.isModuleTopology`, `finiteEtale.hom`,
`.hom_isFinite`, `.homEquiv`, `Huber.Pair.finiteEtaleFunctor`, `.baseChangeIso`, `.spaComap_preimage_rationalSubset`,
`.rationalLocalizationIso`, `.spaComap_surjective`, `.eq_finiteAlgebra`.
Tests: split algebra B = A × A (degenerate); plus ring over a rank-two (K, K⁺) is K⁺ × K⁺, not O_K × O_K
(non-example); the Kummer algebra A[S]/(S² − T) over the annulus is a domain but splits on {|T − 1| ≤ |p|}
(computation); agreement with R0's `finiteAlgebra` (compatibility); A/J with J non-closed is not a valid input
(non-example).

Three statements about these pairs:

- `AdicEtaleGeometry:A1/finite-etale-strongly-sheafy` (theorem). If A is strongly sheafy, so is every B ∈ FÉt(A); so
  Spa(B, B⁺) is an affinoid adic space. The proof shows that B is monogenic locally on Spa(A, A⁺) (residue fields of
  Tate rings are infinite; a primitive element with unit discriminant spreads to a rational neighbourhood) and applies
  Hansen–Kedlaya Corollary 4.7. Boundary: A sheafy (or stably uniform) is not known to suffice.
- `AdicEtaleGeometry:A1/finite-etale-rational-descent` (lemma). For any complete Tate A, a finite rational covering is
  an effective descent morphism for finite étale algebras (Kedlaya–Liu Theorem 2.6.9).
- `AdicEtaleGeometry:A1/affinoid-system-approximation` (lemma) and `AdicEtaleGeometry:A1/finite-etale-approximation`
  (theorem). Every complete Tate pair is the completed direct limit of an affinoid system of noetherian Tate pairs
  (quotients of ℤ((z))⟨S⟩); Spa is the limit of the spectra, rational subsets and coverings live at a finite stage,
  and FÉt(A) ≃ 2-colim FÉt(A_α) (Kedlaya–Liu 2.6.2–2.6.8). This is how non-noetherian statements are reduced to
  Huber's noetherian theory.

#### A1a.3 Finite étale and étale morphisms

`AdicEtaleGeometry:A1/finite-etale-morphism` (definition). `AdicSpace.IsFiniteEtale f` for f: Y → X: X has a cover by
open affinoids V = Spa(A, A⁺) with f⁻¹(V) ≅ Spa(`finiteEtale A⁺ B`) over V, B ∈ FÉt(A) (Kedlaya–Liu 8.2.16, Scholze
2012 Definition 7.1(ii)).
API: `IsFiniteEtale`, `.spa`, `.id`, `.of_openCover`, `.isAffinoid_preimage`, `.isFinite`, `.isEtaleLocalDescription`,
`.comp`, `.baseChange`, `.of_comp`, `.surjective_iff`, `.iff_isFinite_and_etale`.
Tests: fold map X ⊔ X → X and ∅ → X (degenerate); a rational inclusion is étale but not finite étale; the squaring
map of the disc is finite but not finite étale; the plus-ring non-example over a rank-two field; comparison with
R0's finite + étale on noetherian spaces.

`AdicEtaleGeometry:A1/finite-etale-local-to-global` (theorem). Over an open affinoid V = Spa(A, A⁺) with A strongly
sheafy, f⁻¹(V) is affinoid and finite étale over V with ring O_Y(f⁻¹V); so on locally strongly sheafy X the local
definition agrees with the 'for every affinoid' form of ECD 6.2(i); X_fét of an affinoid is FÉt(A)^op (Kedlaya–Liu
8.2.17(a)); the degree is locally constant and f is surjective iff the degree is everywhere positive; f is finite in
R0's sense. Proof: rational descent, then sheafiness of the glued algebra.

`AdicEtaleGeometry:A1/etale-morphism` (definition). `AdicSpace.IsEtaleLocalDescription f`: every point of Y has an
open neighbourhood U with f|_U = i ∘ g ∘ j, j and i open immersions and g finite étale. Equivalently, locally f is
a standard affinoid étale map

```text
Spa(C, C⁺) ⊆ Spa(B, B⁺) → Spa(A, A⁺) ⊆ X,     A → B finite étale,  B → C rational localisation.
```

No separatedness is included (two discs glued along {|p| ≤ |T|} map étale to the disc).
API: `IsEtaleLocalDescription`, `.of_isOpenImmersion`, `.of_isFiniteEtale`, `.exists_standardAffinoid`,
`.of_openCover_source`, `.of_openCover_target`, `.comp`, `.baseChange`, `.of_comp`, `.isOpenMap`,
`.isOpenImmersion_diagonal`, `.iff_etale`.
Tests: open immersions are étale (degenerate); the origin Spa(K) → disc is finite unramified but not étale
(non-example); the non-separated glued disc (characterisation); agreement with Huber on noetherian spaces.

#### A1a.4 Comparison with Huber's definitions

`AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison` (comparison; historical id kept). On a
locally noetherian analytic X (charts Spa of complete strongly noetherian Tate rings): A1-finite étale ⇔ finite and
Huber-étale (Huber 1.6.6(ii) via R0's `finite-etale-algebra-comparison`); A1-étale ⇔ Huber-étale (⇐ is Huber's Lemma
2.2.8 via R0's `etale-local-open-finite-etale-factorisation`, over a field de Jong–van der Put 3.1.4); hence Huber's
Et/X, with the same morphisms and coverings, is A1's, and every A1-étale map over X has Huber's standard
presentations, flatness, openness and local quasi-finiteness; étale X-spaces are again locally noetherian. This is
what AdicSpacesPartII:R4/etale-site-on-analytic-carriers cites.

#### A1a.5 Stability properties

All for X locally strongly sheafy; fibre products are formed among adic spaces.

- `AdicEtaleGeometry:A1/etale-base-change` (lemma): base change of finite étale and étale maps along any morphism
  from a locally strongly sheafy X', with the uncompleted affinoid formula Spa(`finiteEtale C⁺ (C ⊗_A B)`) and
  surjectivity of |Y ×_X X'| → |Y| ×_{|X|} |X'|. Fibre products of adic spaces are not claimed in general
  (Kedlaya–Liu Remark 8.2.5).
- `AdicEtaleGeometry:A1/etale-composition` (lemma): composites of finite étale, resp. étale, maps. The étale case
  ('finite étale after rational after finite étale is locally rational after finite étale after rational') is
  proved by descending the data to a noetherian stage of an affinoid system, where Huber's Lemma 2.2.8 applies, and
  base-changing back (Kedlaya–Liu 8.2.17(c)). Étale spaces over X are locally strongly sheafy.
- `AdicEtaleGeometry:A1/etale-diagonal` (lemma): the diagonal of an étale map is an open immersion, of a finite
  étale map an open and closed immersion (the diagonal idempotent of B ⊗_A B); equalisers of étale X-spaces are
  open subspaces; sections of étale maps are open immersions.
- `AdicEtaleGeometry:A1/etale-cancellation` (lemma): X-morphisms between étale (finite étale) X-spaces are étale
  (finite étale).
- `AdicEtaleGeometry:A1/etale-open-map` (lemma): étale maps are open; a quasi-compact étale map factors uniquely as a
  surjection onto a quasi-compact open followed by its inclusion (Kedlaya–Liu 8.2.17(b)); over an affinoid the image
  is a finite union of rational subsets.

#### A1a.6 The étale and finite étale sites

`AdicEtaleGeometry:A1/etale-site` (construction). For X locally strongly sheafy: `AdicSpace.smallEtale X` (Mathlib
`MorphismProperty.Over` of `IsEtaleLocalDescription` over X, all X-morphisms) with the Grothendieck topology
`AdicSpace.smallEtaleTopology X` generated by the pretopology of jointly surjective families. Et/X has finite
limits; open covers are coverings, giving λ_X: X_ét → X_an; base change defines morphisms of sites g_ét with g_* and
g^{-1} = `Functor.sheafPullback`. On locally noetherian X this is Huber's X_et; on perfectoid X Scholze's X_ét of
perfectoid spaces.
API: `smallEtale`, `smallEtale.mk`, `smallEtale.forget`, `smallEtale.hasFiniteLimits`, `smallEtalePretopology`,
`smallEtaleTopology`, `ofArrows_mem_smallEtaleTopology_iff`, `smallEtale.map`, `etaleSheafPushforward`,
`etaleSheafPullback`, `smallEtale.mapComp`, `opensToSmallEtale`, `smallEtaleTopology_eq_huber`,
`structureSheafEtale`.
Tests: the Kummer covering and a two-piece rational covering of the annulus are coverings (computation); over a
rank-two field, {η} hits all rank-one points but is not a covering (non-example); every covering of Spa(C, C⁺) has a
member with a section (degenerate); agreement with Huber's topology (compatibility); open families are coverings iff
they are open covers (characterisation).

`AdicEtaleGeometry:A1/finite-etale-site` (construction). `AdicSpace.smallFiniteEtale X` with jointly surjective
coverings: finite limits and coproducts; for affinoid X, X_fét ≃ FÉt(A)^op and a family is a covering iff the
product of the algebras is faithfully flat; the inclusion into X_ét defines X_ét → X_fét; functorial.
API: `smallFiniteEtale`, `smallFiniteEtaleTopology`, `ofArrows_mem_smallFiniteEtaleTopology_iff`,
`smallFiniteEtale.hasFiniteLimits`, `.toSmallEtale`, `.affinoidEquiv`, `.map`, `.fiberFunctor`, `.galoisCategory`.
Tests: Spa(K, K⁺)_fét ≃ FÉt(K)^op independently of K⁺; over Spa(C, C⁺) every object is split; a proper rational
inclusion is not an object; X_fét ≃ (CommAlgCat.FiniteEtale A)^op; covering iff ∏ B_i faithfully flat.

Further site statements:

- `AdicEtaleGeometry:A1/etale-structure-sheaf` (lemma): U ↦ O_U(U) and O⁺_U(U) are sheaves on X_ét, with
  λ_*O_{X_ét} = O_X (faithfully flat descent for finite étale surjections, via Mathlib's
  `CommRingCat.isLimitForkPushoutSelfOfFaithfullyFlat`). Higher acyclicity is cohomological and belongs to R3/H0.
- `AdicEtaleGeometry:A1/basis-comparison` (lemma): the basic objects — composites of rational localisations and
  finite étale maps over open affinoids — form a stable basis (X is stably adic, Kedlaya–Liu 8.2.19), each basic
  object is a strongly sheafy affinoid, and restriction Sh(X_ét) ≃ Sh(X_ét^aff) is Mathlib's
  `IsDenseSubsite.sheafEquiv`.
- `AdicEtaleGeometry:A1/etale-covering-reduction` (lemma): a property of coverings of basic objects that is stable
  under refinement and composition and holds for rational coverings and finite étale surjections holds for all
  (Kedlaya–Liu 8.2.20, after de Jong–van der Put 3.2.2, by induction on the degree using the complement of the
  diagonal); hence the sheaf criterion 'sheaf on each U_an and for finite étale surjections of basic objects'.
- `AdicEtaleGeometry:A1/slice-site` (lemma): U_ét ≃ X_ét/U with the induced topology (Mathlib
  `GrothendieckTopology.over`), restriction = `overPullback`; likewise U_fét ≃ X_fét/U and U_an ≃ X_an/U.

#### A1a.7 Geometric points, enough points, strict localisations

`AdicEtaleGeometry:A1/geometric-point-etale-split` (lemma). For S = Spa(C, C⁺): |S| is the chain of valuation rings
between C⁺ and O_C with the unique closed point s, every open containing s is S; finite étale S-spaces are finite
disjoint unions of copies of S; every étale V → S has a section through any point over s, and sections are open
immersions. Non-example: for C⁺ ≠ O_C, two copies of S glued along S ∖ {s} are étale over S but not a disjoint union
of opens of copies of S — étale S-spaces split near the closed point, not globally.

`AdicEtaleGeometry:A1/etale-site-and-geometric-points` (construction; historical id kept). `AdicSpace.GeometricPoint X`:
ξ: Spa(C, C⁺) → X with support ξ(s); one exists over every point (C = completed algebraic closure of k(x)^, C⁺
extending k(x)^+). The fibre functor ε_ξ(U) = Hom_X(Spa(C, C⁺), U) is a Mathlib `GrothendieckTopology.Point` of
X_ét; stalks F_ξ = `sheafFiber`; ε_{g∘ξ'} ≅ ε_{ξ'} ∘ g^*, so (g^{-1}F)_{ξ'} ≅ F_{g∘ξ'}; the image of ξ consists of
generisations of its support.
API: `GeometricPoint`, `.support`, `.ofPoint`, `.comp`, `.fiber`, `.point`, `.stalk`, `.fiber_comp_iso`,
`.stalk_pullback_iso`, `.range_subset_generizations`, `isConservativeFamilyOfPoints_geometricPoint`,
`.strictLocalization`.
Tests: over a rank-two field only rank ≥ 2 geometric points reach the closed point (computation); rank-one points do
not detect coker(j_!ℤ → ℤ) for j the generic point (non-example); ξ = id on Spa(C, C⁺) gives Γ (degenerate); on
X_fét of a field ε_ξ is Mathlib's `CommAlgCat.FiniteEtale.fiber` (compatibility); image in generisations
(characterisation).

`AdicEtaleGeometry:A1/etale-enough-points` (theorem). One geometric point per point of X gives a conservative family
(Mathlib `IsConservativeFamilyOfPoints.mk'`), so X_ét has enough points and isomorphisms, monomorphisms and
epimorphisms of sheaves are detected on stalks (ECD Proposition 14.3's argument). Rank-one points are not enough.
The classification of all points of the topos is not claimed.

`AdicEtaleGeometry:A1/strict-localisation` (construction). X(ξ) is the cofiltered diagram of étale neighbourhoods of
ξ (the category of elements of ε_ξ) viewed as a pro-object; F(X(ξ)) = F_ξ; O_{X_ét, ξ} = colim O_U(U) with its map
to C and valuation; |X(ξ)| = lim |U|; functorial in (X, ξ).
API: `GeometricPoint.Neighbourhood`, `.isCofiltered_neighbourhood`, `strictLocalization`, `.eval`,
`.eval_iso_sheafFiber`, `.openNeighbourhood_final`, `GeometricPoint.localRing`, `.localRing_toField`,
`strictLocalization.space`, `strictLocalization.map`.
Tests: X(id) = Spa(C, C⁺) with local ring C; for a field K the local ring is K^sep; constant sheaves have stalk Λ;
over a rank-two field the strict localisation at the closed point has two points; F(X(ξ)) = `sheafFiber`.

`AdicEtaleGeometry:A1/strict-localisation-analytic` (theorem). O_{X_ét, ξ} is strictly henselian (a filtered colimit
of the henselian local rings O_{U,u} along local maps, with separably closed residue field whose completion C_ξ is
algebraically closed); |X(ξ)| ≅ |Spa(C_ξ, C_ξ⁺)|, C_ξ⁺ = C⁺ ∩ C_ξ — the strict localisation of an analytic adic space
is the spectrum of an algebraically closed affinoid field (Huber). For X = Spa(K, K⁺) the local ring is K^sep.

#### A1a.8 The finite étale fundamental group

`AdicEtaleGeometry:A1/finite-etale-galois-category` (theorem). For X connected and locally strongly sheafy and a
geometric point ξ, F_ξ is a fibre functor and X_fét is a Galois category (Mathlib `GaloisCategory`); π₁(X, ξ) =
Aut F_ξ is profinite and X_fét ≃ finite continuous π₁(X, ξ)-sets (`functorToContAction`). For a field,
π₁ = Gal(K^sep/K) whatever K⁺; the Kummer coverings of an annulus over ℂ_p give a surjection π₁ → ℤ̂(1).

#### A1a.9 The Kedlaya–Liu site of an arbitrary analytic adic space

`AdicEtaleGeometry:A1/etale-site-generalized` (construction). When X is not locally strongly sheafy the finite étale
covers of its affinoids are not known to be adic spaces, so the objects of the site are analytic Yoneda-adic spaces
(part A1b: `AdicEtaleGeometry:A1/generalized-adic-presentation`, with `yoneda-adic-open-immersions`,
`yoneda-adic-fibre-products` and `adic-spaces-in-yoneda-adic-spaces`): finite étale and étale morphisms by the same
local descriptions with Spa^Y, and X_ét^Y, X_fét^Y with set-theoretic coverings (Kedlaya–Liu 8.2.16–8.2.19). Fibre
products exist, the classes are stable, Spa^Y(A, A⁺)_fét^Y ≃ FÉt(A)^op for every complete Tate pair, the site agrees
with X_ét on locally strongly sheafy X, and geometric points are conservative. This is the site Y_ét, Y_fét of ECD
Lemma 15.6, whose comparison with Y^◇ is DiamondsAndVStacks D6's.
API: `YonedaAdicSpace.IsFiniteEtale`, `YonedaAdicSpace.IsEtaleLocalDescription`, `YonedaAdicSpace.smallEtale`,
`YonedaAdicSpace.smallEtaleTopology`, `YonedaAdicSpace.smallFiniteEtale`, `YonedaAdicSpace.finiteEtaleEquiv`,
`.baseChange`, `.comp`, `YonedaAdicSpace.smallEtale_equiv_of_isLocallyStronglySheafy`,
`YonedaAdicSpace.hasEnoughPoints_smallEtaleTopology`.
Tests: FÉt(A)^op for every Tate A (characterisation); agreement with X_ét (compatibility); open immersions
(degenerate); adic-space objects alone do not suffice (non-example).

#### Boundaries and recorded gaps

- Huber's Lemma 2.2.8 is not public; it enters only through AdicSpacesPartII R0 (gap recorded there).
- The Banach-ring inputs of Kedlaya–Liu Proposition 2.6.8 (Gel'fand spectrum, Hausdorff localisations, Lemmas
  2.2.3–2.2.4) are not decomposed; the approximation theorem records them as open obligations.
- Kedlaya–Liu 8.2.17(b), (c) are proved in the source by a two-line reduction; the reduction is carried out in the
  composition and openness lemmas.
- Huber §2.5 is not public: the homeomorphism |X(ξ)| ≅ |Spa(C_ξ, C_ξ⁺)| has one unproved shrinking step, and the
  classification of all points of the étale topos is not planned; no other node depends on either.
- Not claimed anywhere: sheafiness of finite étale extensions of merely sheafy or stably uniform rings; fibre
  products of arbitrary adic spaces; any derived or cohomological statement (H0, R3); the pro-étale site and
  generalized presentations themselves (part A1b); the uniformisation comparison of finite étale algebras (A4).

Source mistakes recorded: ECD Definition 6.2(ii) prints 'y ∈ Y' for 'y ∈ V'; Scholze 2012 Lemma 7.3(i), (iii)
permute the indices of |X ×_Y Z|; Hansen–Kedlaya apply Corollary 4.7 to finite étale algebras without checking
local monogenicity (true over Tate rings, supplied here); Kedlaya–Liu's proof of Lemma 2.6.2 takes a plus ring that
need not be integrally closed.

#### Acceptance tests

1. The Kummer covering Spa(K⟨S, S⁻¹⟩) → Spa(K⟨T, T⁻¹⟩), T ↦ S², is finite étale in A1's and in Huber's sense, is an
   étale covering, and restricts to a split covering over {|T − 1| ≤ |p|}; glued from its restrictions to
   {|T − 1| ≤ |p|} and {|T − 1| ≥ |p|} it is recovered by rational descent.
2. The rational inclusion {|T| ≤ |p|} of the disc is étale but not finite étale; the squaring map of the disc is
   finite but not étale; the origin is finite and unramified but not étale.
3. Over a rank-two field (K, K⁺): the plus ring of K × K is K⁺ × K⁺; the generic point is not an étale covering;
   the sheaf coker(j_!ℤ → ℤ) is invisible to rank-one geometric points and visible at the closed point.
4. For Spa(C, C⁺), every étale covering has a member with a section, X_fét is split, the strict localisation is
   Spa(C, C⁺) itself; for C⁺ ≠ O_C the doubled space along S ∖ {s} is étale but not split globally.
5. For a field K, X_fét ≃ finite continuous Gal(K^sep/K)-sets, O_{X_ét, ξ} = K^sep.
6. On locally noetherian X, A1's site is Huber's X_et (§2.1), with Huber's properties of étale maps available.

### A1 (part b). The pro-étale site with corrected coverings, and generalized adic presentations

This part of A1 builds two things on top of the analytic étale site of A1 (part a) and the adic
spaces of the Tau Ceti roadmap *Foundations of adic spaces*:

1. Scholze's pro-étale site `X_proét` of a locally noetherian analytic adic space, with the class of
   coverings restricted as in Scholze's erratum, the projection `ν : X_proét → X_ét`, the
   pro-finite-étale site, the profinite `G`-set sites, and the structural results of §3 of
   *p-adic Hodge theory for rigid-analytic varieties* that the consumers use.
2. The category of generalized adic spaces used in ECD §15: sheaves on the opposite category of
   complete Huber pairs that are glued from the sheafified representable functors `Spa^Y(A, A⁺)`
   (Scholze–Weinstein's adic spaces of [SW13, §2.1], the pre-adic spaces of the Berkeley Lectures,
   Kedlaya–Liu's preadic spaces), with the proof that the sheafy adic spaces of the anchor form a
   full subcategory.

It owns no morphism theory: étale, finite étale, smooth and finite morphisms, fibre products and
completed tensor products are imported from AdicSpacesPartII R0, and the small étale and finite
étale sites, geometric points and the étale slice site from A1 (part a). It proves no derived
comparison: Scholze's Lemma 3.16 for `i > 0`, Corollary 3.17 and Proposition 3.7(iii) belong to
ClassicalAdicEtaleCohomology H0, and the affinoid perfectoid basis of §4 to AInfCohomology AI.3.
The pro-étale and v-topologies on perfectoid spaces (ECD §8) are a different site, owned by
DiamondsAndVStacks D2.

#### Conventions

- `X` is a **locally noetherian analytic adic space**
  (`AdicSpacesPartII:R0/locally-noetherian-adic-space` with every point analytic): locally
  `Spa(A, A⁺)` with `A` a complete strongly noetherian Tate ring. Scholze allows all locally
  noetherian adic spaces and schemes; the analytic case is the one the consumers use.
- `X_ét` and `X_fét` are the small étale and finite étale sites of A1 (part a); every
  `X`-morphism between étale `X`-spaces is étale.
- `pro-X_ét := Pro(X_ét)` is the pro-category of DiamondsAndVStacks D0 (the dual of Mathlib's
  `Ind`), with small cofiltered index categories. Objects are written `U = lim U_i`, and

  ```text
  Hom(lim_i U_i, lim_j V_j) = lim_j colim_i Hom_X(U_i, V_j),     |U| := lim_i |U_i|.
  ```

  `c : X_ét → pro-X_ét` is the fully faithful embedding by constant systems; `X` is final.
- **Surjective** means surjective on underlying spaces `|·|`.
- Sizes: a universe is fixed; `X_ét` is locally small and sheaves are small-set-valued.
- The name **Yoneda-adic space** (Berkeley, Appendix to Lecture 3) is used for the generalized
  adic spaces, because the anchor's *pre-adic spaces* (Wedhorn's `𝒱^pre`, anchor Layer 3.4) are a
  different, presheaf-based category.

#### 1. Pro-étale morphisms and the underlying space

**Definition** (`AdicEtaleGeometry:A1/pro-etale-morphism`, Scholze Definition 3.9). A morphism
`f : U → V` of `pro-X_ét` is

- *étale* (resp. *finite étale*) if `U ≅ U_0 ×_{V_0} V` for a morphism `V → V_0` to a constant
  object and an étale (resp. finite étale) `U_0 → V_0` of `X_ét`;
- *pro-étale* if `U ≅ lim_{k∈K} U_k` over `V` with every `U_k → V` étale and every transition
  `U_k → U_{k'}` finite étale and surjective for `k ≥ k' ≥ k_0` (a *pro-étale presentation*).

`U` is pro-étale over `X` if `U → X` is. API: `AdicSpace.ProEtale.ProEt` (the category),
`ProEt.const`, `ProEt.hom_const_equiv` (`Hom(lim U_i, c V) ≃ colim Hom(U_i, V)`), `ProEt.space`
(`|U| = lim |U_i|`, `|c U| = |U|`), `IsEtale`, `IsFiniteEtale`, `IsProEtale` with its
`ProEtalePresentation`, `IsEtale.isProEtale`, `isEtale_const`, `IsSurjective`. Tests:
`ProEtale.test_const_etale` (degenerate), `ProEtale.test_kummer_tower` (the Kummer tower
`X̃ = lim Spa(K⟨T^{±1/p^n}⟩) → Spa(K⟨T^{±1}⟩)`, `char K = 0`, is pro-étale with fibre `Z_p` over
the Gauss point), `ProEtale.test_kummer_not_etale` (non-example), `ProEtale.test_hom_const`.

The seven parts of Scholze's Lemma 3.10 are separate nodes:

| node | statement |
|---|---|
| `A1/pro-etale-base-change` | base change along étale / finite étale / pro-étale maps exists, keeps the class, and `|U ×_V W| → |U| ×_{|V|} |W|` is surjective with nonempty compact fibres |
| `A1/pro-etale-etale-composition` | composites of étale (finite étale) maps are étale (finite étale) |
| `A1/pro-etale-quasicompact-opens` | a quasi-compact open `W ⊂ |U|` is represented by an étale subobject, which in `X_proét` has the universal property of an open subobject |
| `A1/pro-etale-maps-open` | pro-étale maps are open (via Huber 1.7.8, `AdicSpacesPartII:R0/smooth-morphism-open`) |
| `A1/pro-etale-surjective-etale-descent` | surjective (finite) étale maps to objects of `X_proét` come from a finite stage |
| `A1/pro-etale-composition` | pro-étale over pro-étale is pro-étale; every pro-étale map is an inverse system of finite étale surjections followed by an étale map |
| `A1/pro-etale-finite-limits` | `X_proét` has finite limits, computed in `pro-X_ét` |

The only nonformal input is `A1/etale-locally-finitely-many-components`: an affinoid
`Spa(B, B⁺)` étale over `X` has `B` strongly noetherian and sheafy, so its connected components
are the finitely many primitive idempotents of `B`.

#### 2. The corrected covering condition

The erratum restricts the coverings and leaves the category unchanged. The explicit form used here:

**Definition** (`AdicEtaleGeometry:A1/finite-etale-tower`). A *finite-étale tower* over
`W ∈ pro-X_ét` of length `λ` is a functor `μ ↦ U_μ` on `{μ < λ}ᵒᵖ` over `W` with `U_0 = W` such
that for every `μ < λ`

```text
U_μ  →  U_{<μ} := lim_{μ' < μ} U_{μ'}        (U_{<0} := W)
```

is finite étale and surjective, i.e. the pullback of a finite étale surjection of `X_ét`. Steps
at limit ordinals are allowed (Kerz's transfinite compositions). A morphism is a tower if it is
isomorphic to `lim_{μ<λ} U_μ → W`. Equivalently, after inserting `U_{<μ}` before `U_μ`, its
opposite lies in Mathlib's `MorphismProperty.transfiniteCompositions` of the opposite of the
pullbacks of finite étale surjections, computed in `(pro-X_ét)ᵒᵖ`.

API: `FetTower`, `FetTower.comp`, `IsFetTower`, `IsFetTower.of_finiteEtale_surjective`,
`IsFetTower.comp` (concatenation, ordinal sum), `IsFetTower.baseChange` (same length),
`IsFetTower.surjective`, `isFetTower_iff_transfiniteCompositions`, `IsFetTower.isProEtale`,
`isFetTower_of_countable`. Tests: `FetTower.test_kummer` (length `ω`),
`FetTower.test_length_le_one`, `FetTower.test_open_immersion` (a proper open immersion is not a
tower: towers are surjective), `FetTower.test_nonsplit_surjection` (an open surjection of profinite
sets without section is pro-étale and surjective but not a tower), `FetTower.test_mathlib_shape`.

Supporting lemmas:

- `A1/finite-etale-tower-is-pro-etale`: a tower is `lim_{F∈K} V_F` with `K` the finite subsets of
  `λ` closed under a dependency function (finite by König's lemma), each `V_F → W` finite étale
  surjective; so towers are pro-étale and surjective. Conversely a pro-étale presentation indexed
  by a countable category is, beyond its threshold, a tower of length `ω`: the countable case is
  unchanged.
- `A1/transfinite-tower-splitting` (the erratum's replacement of Proposition 3.7(i)): a map of
  profinite sets `S = lim_{μ<λ} S_μ → S_0 = S'` whose steps are pullbacks of surjections of finite
  sets has a continuous section. Proposition 3.7(i) as printed is false and is not used.
- `A1/profinite-group-tower`: `G = lim_{μ<λ} G_μ` with `G_0 = 1` and finite kernels; for `A ⊂ B`
  closed of finite index, `G/A → G/B` is the pullback of `G/AN → G/BN` for an open normal `N` with
  `B ∩ N ⊂ A`; hence `G → G/G'` is a tower for every closed `G' ⊂ G`.
- `A1/etale-over-tower-swap`: an étale map followed by a tower is a tower followed by an étale map
  (transfinite induction on `λ`: at successors absorb the last finite étale step into the étale
  map; at limits factor the classifying map through a stage `μ_0 < λ`).
- `A1/corrected-covers-pretopology`: the **corrected coverings** — families `{U_i → U}` with
  `|U| = ⋃ f_i(|U_i|)` and each `f_i` a tower followed by an étale map — form a pretopology
  (isomorphisms; base change; composition via the swap). Every member is pro-étale and open;
  étale surjective families, towers and countably presented printed covers are coverings; every
  corrected covering is a covering of the printed Definition 3.9.

#### 3. The pro-étale site

**Construction** (`AdicEtaleGeometry:A1/pro-etale-site-corrected`; planet *Pro-étale site*).
`X_proét` is the full subcategory of `pro-X_ét` on objects pro-étale over `X`, with the Grothendieck
topology `J_proét` generated by the corrected coverings. A sieve covers iff it contains a family

```text
{ U_i → W_i → U },   U_i = lim_{μ<λ_i} U_{i,μ} → W_i a finite-étale tower,   W_i → U étale,
|U| = ⋃_i image(|U_i| → |U|).
```

The category is Scholze's; `J_proét` is coarser than the printed topology and strictly coarser
as soon as a non-split open surjection of profinite sets appears over a geometric point. No
arbitrary open surjection of profinite sets is assumed to split; Proposition 3.8 and the last
sentence of Proposition 3.13 are deleted by the erratum and are not used; enough points are only
asserted abstractly (§6). API: `AdicSpace.ProEtaleSite`, `ProEtaleSite.topology`,
`ProEtaleSite.mem_topology_iff`, `isCovering_of_etale`, `isCovering_of_isFetTower`,
`isCovering_of_countable`, `topology_le_printed`, `hasFiniteLimits`, `ProEtaleSite.space`,
`isOpenMap_of_mem_covering`, `ne_scheme_proetale` (not Mathlib's `Scheme.proetaleTopology`).

Tests:

- `ProEtaleSite.test_point` (computation): for `X = Spa(C, O_C)` (`C` algebraically closed,
  `O_C` of rank one), `U ↦ |U|` is an equivalence from quasi-compact objects to `Profinite`.
- `ProEtaleSite.test_nonsplit_not_cover` (non-example): an open continuous surjection `S → S'`
  without continuous section (Ribes–Zalesskii, Example 5.6.9) generates a covering sieve for the
  printed topology but not for `J_proét`.
- `ProEtaleSite.test_countable_unchanged` (compatibility): the Kummer tower covers in both.
- `ProEtaleSite.test_etale_cover` (degenerate): open covers are coverings; `∅` is covered by `∅`.
- `ProEtaleSite.test_geometric_stalk_not_conservative` (non-example): for `X = Spa(C, O_C)` the
  sheafification of the separated presheaf `S ↦ C(S, ℝ)/LC(S, ℝ)` is nonzero on the Cantor set
  and zero at the point (Remark 3.14, first sentence).

**The projection ν** (`A1/proetale-projection-nu`). `c : X_ét → X_proét` is fully faithful,
preserves finite limits and coverings, so it is continuous and defines `ν : X_proét → X_ét` with
`ν_* F = F ∘ c` and `ν^*F` the sheafification of `V ↦ colim_j F(V_j)`.
`A1/nu-pullback-sections-qcqs` proves `(ν^*F)(lim U_j) = colim_j F(U_j)` for quasi-compact
quasi-separated `U`, hence `F ≅ ν_*ν^*F` and full faithfulness of `ν^*` on sheaves of sets: the
case `i = 0` of Lemma 3.16, which the consumers cite for `O_X = ν^*O_{X_ét}` and for sections over
Galois towers.

**Slices** (`A1/proetale-slice`). For `V ∈ X_ét`, `V_proét ≃ X_proét/V` as sites (Mathlib's
`GrothendieckTopology.over`), compatibly with `ν` and the étale slice of A1 (part a).

**Profinite sets** (`A1/profinite-set-objects`). For profinite `S = lim S_j`,
`S × X := lim ⊔_{s∈S_j} X` and `U × S := U ×_X (S × X)` satisfy `|U × S| = |U| × S` and, for
quasi-compact `V`, `Hom(V, U × S) = Hom(V, U) × C(|V|, S)`. `U × S → U` has a section, so it
generates a covering sieve; it is a tower for `S` metrizable or `S = G/G'`. For an open
surjection `S → S'` without section, `X × S → X × S'` is pro-étale surjective but not a covering.

**Galois covers** (`A1/profinite-galois-cover-is-covering`). A pro-finite-étale `G`-torsor
`Ũ = lim Ũ_j → U` satisfies `Ũ ×_U Ũ ≅ Ũ × G`, is a tower (quotients `Ũ/N_μ` along the
erratum's filtration of `G`), hence a covering for every profinite `G`, and
`F(U) = eq(F(Ũ) ⇉ F(Ũ × G))`; for `F = ν^*F'` and `U` qcqs, `F(U) = F(Ũ)^G`.

#### 4. Profinite G-sets and the pro-finite-étale site

- `A1/profinite-g-sets-site` (construction): `G-fsets` (jointly surjective coverings) and
  `G-pfsets ≃ Pro(G-fsets)` with corrected coverings: members are `G`-towers followed by
  pullbacks of maps of finite `G`-sets. `F_M(S) = Hom_cont,G(S, M)` is a sheaf. API:
  `ProfiniteGSet`, `equivPro`, `IsGEtale`, `IsGTower`, `pretopology`, `sheafF`, `sheafF_apply`,
  `forgetTrivial`, `FiniteGSet.site`. Tests: `test_FM_on_G`, `test_summands`,
  `test_trivial_group`, `test_nonsplit`, `test_G_to_pt`.
- `A1/open-surjection-profinite-structure` (Lemma 3.6).
- `A1/free-g-profinite-sections-exact` (Proposition 3.7(ii)): free `S ≅ S/G × G`, and
  `F ↦ F(S)` is exact; the splitting comes from the tower `S → S/G`, not from the false 3.7(i).
- `A1/finite-etale-galois-category`: for connected `X` and a geometric point `x̄`, `X_fét` with
  `F_x̄ = Hom_X(x̄, −)` is a Galois category (Mathlib `GaloisCategory`, `FiberFunctor`);
  `π1(X, x̄) := Aut F_x̄` and `X_fét ≃` finite continuous `π1`-sets.
- `A1/pro-finite-etale-site-corrected` (construction): `X_profét = Pro(X_fét)` with coverings a
  pro-finite-étale tower followed by the pullback of a morphism of `X_fét`. API:
  `ProFetSite`, `topology`, `toProEtaleSite`, `isCovering_of_isFetTower`,
  `isCovering_summands`, `space`, `const`. Tests: `ProFetSite.test_field`,
  `test_alg_closed`, `test_summands` (the reading of the erratum that keeps summand covers),
  `test_inclusion`.
- `A1/profinite-etale-galois-sets` (Proposition 3.5): `X_profét ≃ π1(X, x̄)-pfsets` as sites.
- `A1/proetale-profinite-etale-morphism-of-sites` (Lemma 3.11): on `X_profét`, open equals
  pro-étale; the inclusion gives a morphism of sites `X_proét → X_profét`. The printed
  consequence "the notions of coverings coincide" is not asserted for the corrected coverings.

#### 5. Coherence and change of base field

- `A1/proetale-coherence` (Proposition 3.12(i)–(iii)): objects `lim U_i` with affinoid `U_i` are
  quasi-compact; those lying over an affinoid open of `X` form a generating family stable under
  fibre products of coherent objects; `Sh(X_proét)` is algebraic (D0's definition).
- `A1/proetale-quasicompactness-detection` (Proposition 3.12(iv)–(vii)): quasi-compactness and
  quasi-separatedness of objects and morphisms are detected on `|·|`; `X_proét` is coherent iff
  `|X|` is; `X_proét^qc` has the same topos for quasi-separated `X`.
- `A1/etale-descent-along-algebraic-extension`: for `X` of finite type over `Spa(K, K⁺)` and
  `L/K` separable algebraic, `|X_{L̂}| = lim |X_{L_i}|` and
  `2-colim (X_{L_i})_{ét,qcqs} ≃ (X_{L̂})_{ét,qcqs}` (standard étale presentations with polynomial
  equations, their perturbation stability, and perturbation of rational subsets).
- `A1/proetale-field-extension-slice` (Proposition 3.15): `X_{L̂,proét} ≃ X_proét/X_L`, with
  `X_L = lim X_{L_i}`. The hypothesis *finite type over K* replaces Scholze's *locally
  noetherian*, for which `X_{L̂}` need not be locally noetherian (sourceIssues AdicEtaleGeometry/E8).

#### 6. Points

- `A1/proetale-fibre-morphism-of-topoi` (Proposition 3.13, first sentence): for `x ∈ X`,
  `Y_x = Spa(k(x)^, k(x)^+)`, a geometric point `x̄` and `G_x = π1(Y_x, x̄)`, the geometric-fibre
  functor `Φ_x(U) = lim Hom_X(x̄, U_i)` gives `i_x : Sh(G_x-pfsets) → Sh(X_proét)` with
  `i_x^*F` the sheafification of `V ↦ colim_{V → Φ_x(U)} F(U)`.
- `A1/proetale-fibre-conservativity` (second sentence): if all `i_x^*F = 0` then `F = 0`; the
  printed proof needs a pro-étale surjection to be a covering, which the corrected topology does not
  grant — a recorded gap. No consumer uses it.
- `A1/proetale-topos-enough-points` (erratum item (2)): for quasi-compact quasi-separated `|X|`,
  `Sh(X_proét)` is coherent, hence has enough points by Deligne's theorem (requested from D0),
  locally in general. The points are abstract; functors `S ↦ C(T, S)` for profinite `T` with two
  points are not points (they do not respect the covering of a disjoint union by its summands).

#### 7. Generalized adic presentations

**Site** (`A1/huber-pair-rational-site`). `CAff` = complete Hausdorff Huber pairs with
`Huber.Pair.Hom`. Rational covering families `(A, A⁺) → (O(U_k), O⁺(U_k))` for finitely many rational
`U_k` covering `Spa(A, A⁺)` form a coverage on `CAffᵒᵖ` (preimages refined by rational subsets by
quasi-compactness; factorisation by the universal property of rational localisation); `J_rat` is
the generated topology. The presheaf `𝒪 : (A, A⁺) ↦ A`, represented by `(Z[T], Z)`, satisfies the
sheaf condition at `(A, A⁺)` and its rational localisations iff `(A, A⁺)` is sheafy (for complete
Tate pairs). API: `CAff`, `CAff.rationalCover`, `rationalCoverage`, `ratTopology`, `isSheaf_iff`,
`rationalCover_pullback`, `CAff.spa`, `CAff.O`, `isSheafAt_O_iff_isSheafyPair`. Tests:
`CAff.test_laurent_cover`, `test_empty_cover`, `test_O_sheafy`, `test_rost` (Rost's pair, Hansen–
Kedlaya Example 6.28: `X_3 ≠ 0` restricts to `0` on the cover `{v(X_1) ≤ 1}, {v(X_1) ≥ 1}`),
`test_isSheaf_iff`.

**Construction** (`A1/generalized-adic-presentation`; planet *Yoneda-adic spaces*).

```text
Spa^Y(A, A⁺) := sheafification of Hom_CAff((A, A⁺), −) for J_rat,
F → Spa^Y(A, A⁺) open immersion  ⇔  F ≅ colim_{V ⊂ U rational} Spa^Y(O(V), O⁺(V)) for an open U,
F Yoneda-adic  ⇔  F = colim of its affinoid open immersions Spa^Y(A, A⁺) → F.
```

This is [SW13, Definition 2.1.5] as repeated in the Berkeley Lectures (Definition 3.4.1), and
Kedlaya–Liu's preadic spaces (Definition 8.2.3) on Tate pairs; ECD Definition 15.5 and Lemma 15.6
hold in this generality. The framework is needed because sheafiness is not known to be stable under
finite étale extension (Kedlaya–Liu, Remark 8.2.18). API: `YonedaAdicSpace.spaY`,
`spaYFunctor`, `homSpaYEquiv` (`Hom(Spa^Y(A), G) ≃ G(A)`), `IsOpenImmersion`,
`YonedaAdicSpace`, `isColimit_affinoids`, `spaY_isInitial_iff`, `globalFunctions`
(`Hom(F, Spa^Y(Z[T], Z))`), `space`, `ofAdicSpace`. Tests: `test_zero_pair`, `test_open_disc`
(the open unit disc is Yoneda-adic, not affinoid), `test_affine_line`,
`test_rost_not_faithful` (`T ↦ X_3` and `T ↦ 0` give the same morphism
`Spa^Y(A, A⁺) → Spa^Y(Z[T], Z)`; a presheaf-level definition would separate them),
`test_sheafy`.

Supporting results:

- `A1/yoneda-adic-open-immersions`: open immersions into `Spa^Y(A, A⁺)` ↔ open subsets of
  `Spa(A, A⁺)`; `Spa^Y(A, A⁺)` is glued from any rational covering (the gluing ECD §15 uses for
  `Spd`).
- `A1/yoneda-adic-ind-ringed-description` (Berkeley Proposition 3.5.3): Yoneda-adic spaces are the
  objects of `(V)_ind` locally isomorphic to `Spa^ind(A, A⁺)` (structure presheaf sheafified in
  ind-topological rings); this gives `|F|` with `|Spa^Y(A, A⁺)| = Spa(A, A⁺)`. Sheafifying in
  topological rings instead does not describe maps between affinoids.
- `A1/maps-from-adic-spaces-to-yoneda-affinoids` (Kedlaya–Liu Lemma 8.2.9): for an adic space
  `X` and any complete pair, `Hom(X^Y, Spa^Y(A, A⁺)) = Hom((A, A⁺), (O_X(X), O_X⁺(X)))`.
- `A1/adic-spaces-in-yoneda-adic-spaces` (**agreement with the anchor**): `ι : Adic → YAdic` is
  fully faithful, `ι Spa(A, A⁺) ≅ Spa^Y(A, A⁺)` for sheafy pairs, preserves and reflects open
  immersions, `|ι X| = |X|`, essential image = Yoneda-adic spaces covered by `Spa^Y` of sheafy
  pairs.
- `A1/yoneda-adic-analytic-tate-local`: analytic points (Berkeley Definition 4.3.2) agree with the
  anchor's; analytic Yoneda-adic spaces are covered by Tate affinoids, maps out of Tate rings are
  adic, and analytic Yoneda-adic spaces are Kedlaya–Liu's preadic spaces.
- `A1/yoneda-adic-fibre-products`: analytic Yoneda-adic spaces have fibre products,
  `Spa^Y(B) ×_{Spa^Y(A)} Spa^Y(C) = Spa^Y(B ⊗̂_A C)` without sheafiness; the non-adic diagram
  `(Z_p⟦T⟧) ← (Z_p) → (Q_p, Z_p)` has no pushout.

#### Dependencies

Inside AdicEtaleGeometry: A1 (part a) for `X_ét`, `X_fét`, finite étale and étale morphisms,
geometric points and the étale slice site; A0 for nothing beyond what R0 supplies. Other roadmaps:
AdicSpacesPartII R0 (locally noetherian spaces, étale structure 1.7.1–1.7.2, openness 1.7.8,
fibre products, completed tensor products, finite étale algebras 1.6.6(ii), Tate norms);
DiamondsAndVStacks D0 (pro-categories, cofiltered limits of spectral spaces, qcqs objects and
algebraic topoi; Deligne's theorem is requested); the Tau Ceti anchor Layers 0, 2–5 (requested:
adic spaces and gluing, rational localisation with its universal property, sheafiness of strongly
noetherian Tate pairs, open mapping). Consumers: AdicSpacesPartII R4 (re-export and functoriality),
R5, ClassicalAdicEtaleCohomology H0, AInfCohomology AI.3, PadicHodgeTheory P8, PerfectoidSpaces P3,
P9, IgusaVarieties IG.3, AdicEtaleGeometry A3–A4, DiamondsAndVStacks D6.

#### Acceptance

- The Kummer tower over the torus is a covering of `X_proét` in both the corrected and the printed
  sense; for `X = Spa(C, O_C)` an open surjection of profinite sets without section is not a
  covering.
- `ν^*` is fully faithful on sheaves of sets and `(ν^*F)(X̃) = colim F(X_n)`.
- `Z_p → pt` and every Galois cover `Ũ → U` are coverings; `F(U) = F(Ũ)^G` for étale sheaves.
- `X_{L̂,proét} ≃ X_proét/X_L` for `X = Spa(Q_p⟨T^{±1}⟩)`, `L = Q_p(μ_{p^∞})`.
- `Spa^Y(Q_p⟨T⟩, Z_p⟨T⟩)` is the anchor's closed disc; the open disc is Yoneda-adic and not
  affinoid; for Rost's pair `Spa^Y` is not faithful.

#### Source problems recorded

AdicEtaleGeometry/E6 (the erratum's literal Definition 3.3/3.4 condition excludes summand covers), AdicEtaleGeometry/E7
(steps for Definition 3.9 must come from `X_ét`), AdicEtaleGeometry/E8 (Proposition 3.15 needs `X_L` locally
noetherian), AdicEtaleGeometry/E9 (Lemma 3.11 "coverings coincide" unverified after the correction), AdicEtaleGeometry/E10
(Proposition 3.13 conservativity proof under corrected coverings), AdicEtaleGeometry/E11 (Remark 3.14 refers to
the deleted notion of points).

<a id="a2"></a>

## A2. Separatedness, smooth charts, and classical analytic geometry

### A2. Separatedness, smooth charts, and classical analytic geometry

**Canonical owners:** AdicSpacesPartII R0 (separated, proper and smooth morphisms), R1
(analytification), R2 (formal models and generic fibres) and F0 (noetherian formal schemes). A2 is
the geometric supplier contract of this roadmap with those layers, in the scope that
ClassicalAdicEtaleCohomology H1 and the diamond layers use, on the same carriers and without any
derived comparison theorem (H1 owns specialization and nearby cycles). It identifies R0's
separatedness and properness with the classical valuative criteria, constructs the relative balls and
tori that R0 uses only affinoid-locally, compares Huber's smooth morphisms with ECD's local ball
charts, supplies compatible toric charts for smooth morphisms, the dimension theory the dimension
estimates need, and the comparisons of analytification and generic fibres with these objects and with
A1's étale site.

**Dependencies.** AdicSpacesPartII R0, R1, R2, R4 and F0; AdicEtaleGeometry A0 (analytic loci,
rational and finite étale pullbacks) and A1 (étale morphisms by local description, the étale site);
the Tau Ceti anchor, Layers 1, 2, 3 and 5 (requested where the pinned tree lacks them); Mathlib's
`topologicalKrullDim`. **Consumers:** AdicEtaleGeometry A3; ClassicalAdicEtaleCohomology H0, H1,
H1:henselian, H3; AdicCoefficientsAndComparisons L1; DiamondsAndVStacks D3/D6; PadicHodgeTheory P8;
DiamondSixOperations S5 (ECD 24.4).

#### Conventions

1. **Carriers.** Unless stated otherwise spaces are analytic adic spaces covered by open affinoids
   with complete stably sheafy rings — in particular locally noetherian analytic adic spaces
   (`AdicSpacesPartII:R0/locally-noetherian-adic-space`), which is Huber's scope and the scope of
   every comparison with Huber's definitions. Smooth morphisms of non-noetherian analytic spaces
   (ECD 24.4) are defined by ball charts; ECD 6.4(iv)'s affinoid statement is A3's.
2. **Separated, proper, partially proper** are R0's (Huber 1.3.1–1.3.3), defined for morphisms
   locally of (+)weakly finite type so that the diagonal and the base changes exist; they are not the
   v-stack notions of D3/D6.
3. **Smooth and étale.** On locally noetherian spaces, smooth and étale are Huber's infinitesimal
   notions (R0), which agree with the local-description notions of A1 by Huber's Lemma 2.2.8.
4. **Balls and tori** are relative to a base `X`: `B^n_X = X ×_{Spa ℤ} Spa(ℤ[T], ℤ[T])` with plus ring
   `B⁺⟨T⟩` on charts, and `T^n_X = {|T₁ ⋯ Tₙ| ≥ 1} ⊆ B^n_X`; radius 1 unless stated.
5. **Dimension** is the Krull dimension of the underlying topological space (Huber 1.8.1), not of a
   ring; the relative dimension of a smooth morphism in R0's sense (rank of `Ω`) agrees with it.

#### A2.1 Separated, proper and partially proper morphisms

`AdicEtaleGeometry:A2/supplier-contract-separated-proper-smooth` (comparison; declaration
`AdicSpace.IsProper.iff_quasiCompact_and_existsUnique_centre`). For a quasi-separated morphism `f : X → Y` of
analytic adic spaces, locally of +weakly finite type, with `X`, `Y` covered by complete stably sheafy
affinoids (so that `X ×_Y X` and all base changes exist): `f` is separated ⇔ `Δ_f` is a closed
embedding ⇔ centres of valuation rings are unique; `f` is partially proper ⇔ centres exist uniquely;
and — the declaration — `f` is proper ⇔ `f` is quasi-compact and centres exist uniquely. Closed
embeddings and finite morphisms are proper, and the three classes are stable under composition and
base change. These are Huber's notions as R0 decomposes them, the same ones R1 and R2 compare with
analytification and formal models; outside these hypotheses no separatedness or properness predicate
of adic spaces is defined, and the v-stack notions are DiamondsAndVStacks D3/D6's.

Acceptance:

- The analytified projective line P^{1,ad}_K → Spa(K, K°) is proper; the closed unit disc is separated and quasi-compact but not proper (the valuation ring A_∞ at the Gauss point has no centre); the open unit disc is partially proper and not proper; the unit disc with doubled origin is not separated (a valuation ring has two centres).
- Finite morphisms to analytic adic spaces are proper, since integral plus rings lie in every valuation ring containing the base plus ring.
- Consumer instance (DiamondsAndVStacks D3/D6, ECD §18): ECD recalls Huber's canonical compactifications of analytic adic spaces (Huber 1996, Theorem 5.1.5), which are built for the classical separated morphisms of this node; ECD Proposition 18.6 is the v-stack analogue.

#### A2.2 Relative closed polydiscs

`AdicEtaleGeometry:A2/relative-closed-polydisc` (construction; planet *Relative closed unit ball*;
declaration `AdicSpace.relativePolydisc`). For `X` covered by complete stably sheafy affinoids,
`B^n_X := X ×_{Spa(ℤ, ℤ)} Spa(ℤ[T₁, …, Tₙ], ℤ[T₁, …, Tₙ])`, which exists by R0 because the second factor
is of finite type over `Spa ℤ`. Over an affinoid `Spa(B, B⁺)` it is `Spa(B⟨T⟩, B⁺⟨T⟩)` (ECD 24.4's
`B^n_Y`); `B⁺⟨T⟩` is integrally closed because it is the set of functions bounded by 1 on the adic
spectrum (Gauss extensions of the points of `Spa(B, B⁺)`). It represents `Z ↦ O⁺_Z(Z)ⁿ`, is stable
under base change, `B^{m+n} = B^m ×_X B^n`, and `π` is smooth, quasi-compact and separated with `Ω`
free on `dT₁, …, dTₙ`. For locally noetherian analytic `X` it is the open subspace `{|Tᵢ| ≤ 1}` of the
relative affine space.

API:

- `AdicSpace.relativePolydisc` (constructor): B^n_X := X ×_{Spa ℤ} Spa(ℤ[T₁..Tₙ], ℤ[T₁..Tₙ]) for X covered by complete stably sheafy affinoids.
- `AdicSpace.relativePolydisc.proj` (projection): The projection π : B^n_X → X.
- `AdicSpace.relativePolydisc.coord` (data): The coordinates Tᵢ ∈ O⁺(B^n_X), i = 1, …, n.
- `AdicSpace.relativePolydisc.homEquiv` (universal-property): Hom_X(Z, B^n_X) ≃ (Fin n → O⁺_Z(Z)), h ↦ (h^*Tᵢ)ᵢ, natural in Z.
- `AdicSpace.relativePolydisc.affinoidChart` (characterisation): π⁻¹(Spa(B, B⁺)) ≅ Spa(B⟨T⟩, B⁺⟨T⟩) over Spa(B, B⁺), compatibly with the coordinates.
- `Huber.restrictedPowerSeries_plus_isIntegrallyClosed` (other): For a complete Huber pair (B, B⁺), B⁺⟨T⟩ = {h : v(h) ≤ 1 on Spa(B⟨T⟩, B⁺⟨T⟩)} is integrally closed in B⟨T⟩ and is a ring of integral elements.
- `AdicSpace.relativePolydisc.baseChangeIso` (compatibility): B^n_X ×_X X' ≅ B^n_{X'} over X', compatibly with the coordinates.
- `AdicSpace.relativePolydisc.addIso` (structure): B^{m+n}_X ≅ B^m_X ×_X B^n_X.
- `AdicSpace.relativePolydisc.smooth` (instance): π is smooth (AdicSpacesPartII:R0/smooth-morphism), with Ω_{B^n_X/X} free on dT₁, …, dTₙ.
- `AdicSpace.relativePolydisc.quasiCompact_proj` (instance): π is quasi-compact and separated.
- `AdicSpace.relativePolydisc.isLocallyNoetherian` (instance): X locally noetherian ⇒ B^n_X locally noetherian.
- `AdicSpace.relativePolydisc.isAnalytic` (instance): X analytic ⇒ B^n_X analytic.
- `AdicSpace.relativePolydisc.isOpenImmersion_affineSpace` (compatibility): For X locally noetherian and analytic, B^n_X is the open subspace {|Tᵢ| ≤ 1} of A^n_ℤ ×_{Spec ℤ} X.
- `AdicSpace.relativePolydisc_spa_field` (compatibility): Over Spa(K, K°), |Bⁿ| = Tau Ceti `closedPolydisc n K`.
- `AdicSpace.relativePolydisc.zeroIso` (example): B⁰_X ≅ X.

Unit tests:

- `relativePolydisc_test_Qp` (computation): B¹ over Spa(ℚ_p, ℤ_p) is Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩), and Hom_{Spa ℚ_p}(Spa(L, O_L), B¹) = O_L for a finite extension L/ℚ_p.
- `relativePolydisc_test_zero` (degenerate): B⁰_X = X with π the identity.
- `relativePolydisc_test_notAffineLine` (non-example): B¹_{Spa K} is not Spa(ℤ[T], ℤ) ×_{Spa ℤ} Spa K (the adic affine line, an increasing union of the discs {|ϖⁿT| ≤ 1}, not quasi-compact): replacing the plus ring ℤ[T] by ℤ changes the object.
- `relativePolydisc_test_rankTwoPlus` (non-example): For a complete rank-one field K and a ring of integral elements K⁺ ⊊ K°, the fibre of B¹ over Spa(K, K⁺) is Spa(K⟨T⟩, K⁺⟨T⟩), which strictly contains Spa(K⟨T⟩, K°⟨T⟩); a definition with plus ring the power-bounded subring loses the points over the rank-two point of Spa(K, K⁺).
- `relativePolydisc_test_closedPolydisc` (compatibility): Over Spa(K, K°) for a complete nonarchimedean field K, the underlying set of Bⁿ is Tau Ceti's `closedPolydisc n K` (as subsets of Spv of the restricted power series ring).
- `relativePolydisc_test_homEquiv` (characterisation): For an adic space Z over X, the map Hom_X(Z, B^n_X) → O⁺_Z(Z)ⁿ, h ↦ (h^*Tᵢ)ᵢ, is bijective; for Z = X this sends the zero section to (0, …, 0).
Acceptance:

- Over Spa(ℚ_p, ℤ_p): B¹ = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩), the closed unit disc (Scholze–Weinstein, Lecture 4: Spa ℤ[T] × Spa K = Spa K⟨T⟩).
- ECD Proposition 24.4 defines B^n_Y for affinoid Y = Spa(A, A⁺) as Spa(A⟨T₁, …, Tₙ⟩, A⁺⟨T₁, …, Tₙ⟩); this construction globalises it.
- Consumer instances: the closed embedding Y ↪ B^n_X of ECD 6.4(iv) over affinoid perfectoid X (AdicEtaleGeometry A3, where B^n_X is sousperfectoid by AdicSpacesPartII:R5/sousperfectoid-rings), and Huber's relative balls in 1.6.10 and in ClassicalAdicEtaleCohomology H1/H4.

#### A2.3 Relative tori

`AdicEtaleGeometry:A2/relative-torus` (construction; planet *Relative torus*; declaration
`AdicSpace.relativeTorus`). `T^n_X := {|T₁ ⋯ Tₙ| ≥ 1} = {|Tᵢ| = 1} ⊆ B^n_X`, with charts
`Spa(B⟨T^{±1}⟩, B⁺⟨T^{±1}⟩)`; it represents `Z ↦ ((O⁺_Z(Z))^×)ⁿ`, is a commutative group object
over `X`, is smooth, and contains `B^n_X` as the rational subset `{|Tᵢ − 1| ≤ |ϖ|}` via
`Tᵢ ↦ 1 + ϖTᵢ` (Scholze 2013, proof of Lemma 5.2). `B¹_X` is covered by `T¹_X` and its translate by 1
(the two annuli of ECD 24.4's proof). Over a field it is Scholze's `Tⁿ`; it is not `(G_m^n)^{ad}`.

API:

- `AdicSpace.relativeTorus` (constructor): T^n_X ⊆ B^n_X, the open subspace {|T₁⋯Tₙ| ≥ 1}.
- `AdicSpace.relativeTorus.ι` (projection): The open immersion T^n_X → B^n_X.
- `AdicSpace.relativeTorus.homEquiv` (universal-property): Hom_X(Z, T^n_X) ≃ (Fin n → (O⁺_Z(Z))ˣ), natural in Z.
- `AdicSpace.relativeTorus.affinoidChart` (characterisation): Over Spa(B, B⁺): Spa(B⟨T^{±1}⟩, B⁺⟨T^{±1}⟩), the rational subset R(1/(T₁⋯Tₙ)) of the polydisc chart.
- `AdicSpace.relativeTorus.baseChangeIso` (compatibility): T^n_X ×_X X' ≅ T^n_{X'}.
- `AdicSpace.relativeTorus.smooth` (instance): T^n_X → X is smooth with Ω free on dTᵢ.
- `AdicSpace.relativeTorus.mul` (structure): The commutative group object structure over X (coordinatewise multiplication, unit 1).
- `AdicSpace.relativeTorus.polydiscEmbedding` (relation): For a topologically nilpotent unit ϖ: Tᵢ ↦ 1 + ϖTᵢ is an isomorphism of B^n_X onto {|Tᵢ − 1| ≤ |ϖ|} ⊆ T^n_X.
- `AdicSpace.relativeTorus.iSup_translate_eq_polydisc` (relation): B¹_X = T¹_X ∪ (T¹_X + 1).
- `AdicSpace.relativeTorus_spa_field` (compatibility): Over Spa(K, K°): Scholze's Tⁿ = Spa(K⟨T^{±1}⟩, K°⟨T^{±1}⟩).

Unit tests:

- `relativeTorus_test_field` (computation): Over Spa(K, K°), T¹ = Spa(K⟨T^{±1}⟩, K°⟨T^{±1}⟩) and Hom_{Spa K}(Spa(L, O_L), T¹) = O_L^× for a finite extension L/K.
- `relativeTorus_test_zero` (degenerate): T⁰_X = X.
- `relativeTorus_test_notGm` (non-example): Over K, T¹ ≠ (G_m)^{ad} = A^{1,ad} ∖ {0}: the latter is not quasi-compact and contains points with |T| ≠ 1; a definition as the analytified torus fails.
- `relativeTorus_test_ballEmbedding` (characterisation): Over ℚ_p, T ↦ 1 + pT identifies B¹ with the rational subset {|T − 1| ≤ |p|} of T¹, and the image of the zero section is the point T = 1.
- `relativeTorus_test_annulusCover` (computation): B¹_X = T¹_X ∪ {|T − 1| = 1}, the second being the image of T¹_X under T ↦ T + 1.
- `relativeTorus_test_openImmersion` (compatibility): The inclusion T^n_X → B^n_X is an open immersion whose chart over Spa(B, B⁺) is the rational localisation B⟨T⟩ → B⟨T⟩⟨1/(T₁⋯Tₙ)⟩ = B⟨T^{±1}⟩.
Acceptance:

- Over K, T¹ = Spa(K⟨T^{±1}⟩, K°⟨T^{±1}⟩) is the unit circle {|T| = 1} of the closed disc.
- Scholze 2013, Example 4.4: the tower of Tⁿ with pᵐ-th roots of the coordinates has affinoid perfectoid limit T̃ⁿ; ECD Proposition 24.4 uses the ℤ_p-torsor T̃_{ℂ_p} → T_{ℂ_p}.

#### A2.4 Smooth morphisms by ball charts, and Huber's smooth morphisms

`AdicEtaleGeometry:A2/smooth-morphism-ball-charts` (definition; planet *Smooth morphism*; declaration
`AdicSpace.IsLocallyEtaleOverPolydisc`). A morphism `f : Y' → Y` of analytic adic spaces (with `Y`
covered by complete stably sheafy affinoids) is locally étale over a relative ball if locally on
`Y'` it is an A1-étale map `U → B^n_Y` followed by `π`. This is ECD 24.4's notion of a smooth morphism
of analytic adic spaces over `Spa ℤ_p`, including non-noetherian ones; it is stable under composition
and base change.

API:

- `AdicSpace.IsLocallyEtaleOverPolydisc` (structure): The predicate on f : Y' → Y: locally on Y' an A1-étale map to some B^n_Y followed by π.
- `AdicSpace.IsLocallyEtaleOverPolydisc.exists_chart` (projection): For y' ∈ Y', an open U ∋ y', n and an étale g : U → B^n_Y with f|_U = π ∘ g.
- `AdicSpace.IsLocallyEtaleOverPolydisc.of_isEtale` (instance): A1-étale morphisms satisfy it with n = 0.
- `AdicSpace.IsLocallyEtaleOverPolydisc.relativePolydisc` (example): π : B^n_Y → Y and T^n_Y → Y satisfy it.
- `AdicSpace.IsLocallyEtaleOverPolydisc.comp` (functoriality): Stable under composition (with B^{m+n}_Y ≅ B^m_Y ×_Y B^n_Y).
- `AdicSpace.IsLocallyEtaleOverPolydisc.baseChange` (functoriality): Stable under base change along morphisms Y₁ → Y of the same kind.
- `AdicSpace.IsLocallyEtaleOverPolydisc.of_isOpenImmersion_comp` (relation): Local on the source: if Y' = ⋃ U_i and each f|_{U_i} satisfies it, so does f.
- `AdicSpace.IsLocallyEtaleOverPolydisc.iff_smooth` (compatibility): On locally noetherian analytic adic spaces: IsLocallyEtaleOverPolydisc f ↔ AdicSpace.Smooth f (promoted to AdicEtaleGeometry:A2/smooth-local-ball-charts).

Unit tests:

- `isLocallyEtaleOverPolydisc_test_polydisc` (computation): π : B^n_Y → Y and T^n_Y → Y satisfy the definition with g the identity, resp. the open immersion.
- `isLocallyEtaleOverPolydisc_test_etale` (degenerate): An étale morphism (A1) satisfies the definition with n = 0 (B⁰_Y = Y).
- `isLocallyEtaleOverPolydisc_test_origin` (non-example): The closed embedding of the origin Spa(K, K°) → B¹_K is not locally étale over a relative ball: its image is not open, whereas étale maps and projections from balls are open.
- `isLocallyEtaleOverPolydisc_test_huber` (compatibility): For morphisms of locally noetherian analytic adic spaces the class coincides with AdicSpacesPartII:R0/smooth-morphism (AdicEtaleGeometry:A2/smooth-local-ball-charts); for example a smooth rigid curve over K.
- `isLocallyEtaleOverPolydisc_test_perfectoidBase` (characterisation): For an affinoid perfectoid Y = Spa(R, R⁺), B^n_Y = Spa(R⟨T⟩, R⁺⟨T⟩) → Y satisfies the definition although B^n_Y is not perfectoid for n ≥ 1 (AdicSpacesPartII:R5/perfectoid-times-polydisc).
Acceptance:

- B^n_Y → Y and T^n_Y → Y are locally étale over a relative ball; étale morphisms are (n = 0).
- ECD Proposition 24.4: a separated morphism of analytic adic spaces over Spa ℤ_p that is locally étale over a relative ball has ℓ-cohomologically smooth diamond (DiamondSixOperations S5).

`AdicEtaleGeometry:A2/smooth-local-ball-charts` (comparison; declaration `AdicSpace.IsLocallyEtaleOverPolydisc.iff_smooth`).
On locally noetherian analytic adic spaces, Huber's smooth morphisms (R0) are exactly the morphisms
locally étale over a relative ball; the ball dimension is the rank of `Ω_{X/S}` at the point, the chart
can be chosen inside any neighbourhood, and over a field it can be chosen to contain the closure of the
point (Scholze's refinement of Huber 1.6.10). Composition and base change correspond on both sides.

Acceptance:

- BHW, proof of Corollary 3.4: a smooth rigid space Y over a perfectoid extension L' of L is covered by opens étale over discs Spa L'⟨X₁, …, Xₙ⟩.
- Zavyalov, Remark 5.10: a smooth morphism factors locally as an étale map to D^d_S followed by the projection.
- For X = T¹_K → Spa K the chart is the rational embedding {|T| = 1} ⊆ B¹_K (n = 1).

#### A2.5 Compatible toric charts

`AdicEtaleGeometry:A2/relative-toric-charts` (lemma; declaration `AdicSpace.Smooth.exists_relativeToricChart`). For a
smooth morphism `f : X → Y` of smooth adic spaces over `Spa(K, K°)`, a point `x`, and an affinoid
`V ∋ f(x)` containing the closure of `f(x)` with a toric chart `h : V → T^m_K` (a composite of rational
embeddings and finite étale maps, R0/smooth-toric-chart), there are an affinoid `U ∋ x` containing the
closure of `x` and an étale `k : U → T^d_V`, again a composite of rational embeddings and finite étale
maps, such that `(id × h) ∘ k : U → T^{d+m}_K` lies over `h ∘ f` for the coordinate projection. This is
the reduction to `Tⁿ → T^{n−d}` used in Scholze 2013, Proposition 8.5, whose proof does not state it
(source issue `AdicEtaleGeometry/E12`).

Acceptance:

- For the coordinate projection X = Tⁿ_K → Y = T^{n−d}_K, V = Y and h = id, the chart k is the identity: this is the reduction step of Scholze 2013, Proposition 8.5.
- For f = π : B¹_V → V the chart is B¹_V ≅ {|T − 1| ≤ |ϖ|} ⊆ T¹_V.
- Consumer instance: PadicHodgeTheory:P8:local-rational/relative-poincare-lemma computes over toric covers of f with base coordinates X₁, …, X_m.

#### A2.6 Dimension and dimension estimates

`AdicEtaleGeometry:A2/dimension-of-adic-spaces` (definition; planet *Dimension of adic spaces*;
declaration `AdicSpace.dim`). `dim X` is Mathlib's `topologicalKrullDim` of the
underlying space, equal to Huber's supremum of lengths of specialization chains; pure dimension and
the relative dimension `dim f = sup_y dim f⁻¹(y)` follow Huber 1.8.1 (through Zavyalov's statement).
The dimension is topological: `Spa(K, K⁺)` for `K⁺` of rank two has dimension 1.

API:

- `AdicSpace.dim` (constructor): dim X := topologicalKrullDim |X|.
- `AdicSpace.dim_eq_iSup_specializationChain` (characterisation): dim X is the supremum of lengths of chains of proper specializations of points (Huber 1.8.1).
- `AdicSpace.IsPureDim` (structure): X is of pure dimension d: every nonempty open subset has dimension d.
- `AdicSpace.relDim` (data): dim f := ⨆ y, topologicalKrullDim (f⁻¹(y)).
- `AdicSpace.IsPureRelDim` (structure): f is of relative pure dimension d: every nonempty fibre is of pure dimension d.
- `AdicSpace.dim_le_of_isOpenImmersion` (relation): dim U ≤ dim X for an open subspace U.
- `AdicSpace.dim_eq_iSup_of_openCover` (relation): dim X = ⨆ᵢ dim Uᵢ for an open cover.
- `AdicSpace.dim_spa_field` (example): dim Spa(K, K⁺) = rank(K⁺) − 1 for a complete rank-one field K.
- `AdicSpace.dim_congr_homeomorph` (compatibility): Homeomorphic adic spaces have equal dimension (Mathlib `IsHomeomorph.topologicalKrullDim_eq`).
- `AdicSpace.IsPureDim.iff_localRing_dim` (compatibility): For X locally of finite type over Spa(K, K°): X is of pure dimension d iff dim O_{X,x} = d at every classical point (Zavyalov Lemma 3.3).

Unit tests:

- `dim_test_field` (computation): dim Spa(K, K°) = 0 and, for a valuation ring K⁺ ⊊ K° of rank two, dim Spa(K, K⁺) = 1.
- `dim_test_disc` (computation): dim Spa(K⟨T⟩, K°⟨T⟩) = 1 and the closed unit disc is of pure dimension 1.
- `dim_test_empty` (degenerate): dim ∅ = ⊥, and the empty space is of pure dimension d for every d.
- `dim_test_notRingDim` (non-example): For K⁺ of rank two, dim Spa(K, K⁺) = 1 ≠ ringKrullDim K = 0: a definition by the Krull dimension of the global sections fails.
- `dim_test_topologicalKrullDim` (compatibility): For X = Spa(A, A⁺), dim X equals Mathlib's `topologicalKrullDim` of Tau Ceti's `spa A⁺` with the subspace topology, and dim U ≤ dim X for every open U ⊆ X.
Acceptance:

- dim Spa(K, K°) = 0; dim Spa(K⟨T⟩, K°⟨T⟩) = 1 (the Gauss point specializes to rank-two points, and no chain is longer); the closed unit polydisc of dimension n has dimension n.
- ECD Lemma 21.6: dim f ≤ dim.trg f for maps of analytic adic spaces.

The estimates:

- `AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres` (lemma; `AdicSpace.isPureRelDim_iff_rankOneFibres`):
  for `f` locally of finite type over a locally noetherian analytic base, relative pure dimension `d`
  is detected on the adic fibres over rank-one points (Huber 1.8.7).
- `AdicEtaleGeometry:A2/smooth-pure-relative-dimension` (lemma; `AdicSpace.Smooth.isPureRelDim`):
  a smooth morphism with `Ω` locally free of rank `d` has relative pure dimension `d`; étale morphisms
  have relative pure dimension 0; for smooth rigid spaces this is the classical dimension.
- `AdicEtaleGeometry:A2/weakly-finite-type-finite-dimension` (lemma; `AdicSpace.relDim_lt_top_of_isWeaklyFiniteType`):
  morphisms of weakly finite type to a quasi-compact base have finite dimension (Zavyalov, Lemma 3.7).

The inputs from Huber's §1.8 (1.8.4–1.8.9) are not public and are recorded as a gap.

#### A2.7 Analytification

`AdicEtaleGeometry:A2/analytification-relative-polydisc-comparison` (comparison; declaration
`AdicSpace.relativePolydiscIsoAnalyticAffineSpaceChart`). The adic analytification of finite-type schemes
over a nonarchimedean field and its relative version over a strongly noetherian Tate affinoid
`S = Spa(A, A⁺)` are R1's (`AdicSpacesPartII:R1/analytification-functor`,
`AdicSpacesPartII:R1/scheme-fibre-product-analytification`). On the same carriers, `(A^n_A)^{ad/S}` is the
increasing union of the rational subsets `{|ϖᵏTᵢ| ≤ 1}` (`k ≥ 1`), and `B^n_S` is the rational subset `{|Tᵢ| ≤ 1}` of each of them; likewise
`T^n_S ⊆ (G^n_m)^{ad/S}` is `{|Tᵢ| = 1}`. R1's comparisons of separatedness, properness, étaleness,
smoothness and differentials under analytification therefore apply to A2's balls, tori and charts,
and the étale sites compare through `AdicSpacesPartII:R4/analytification-etale-site`.

Acceptance:

- Over K: A^{1,ad}_K = ⋃_{k ≥ 0} {|ϖᵏT| ≤ 1}, not quasi-compact, and its piece k = 0 is the closed unit disc B¹_K (AdicSpacesPartII:R1/analytic-affine-space indexes the pieces from k = 0).
- Over S = Spa(ℚ_p⟨U⟩, ℤ_p⟨U⟩): (A¹_{ℚ_p⟨U⟩})^{ad/S} ⊇ B¹_S = Spa(ℚ_p⟨U, T⟩, ℤ_p⟨U, T⟩), the closed bidisc.

#### A2.8 Compatibility with A1's étale site

`AdicEtaleGeometry:A2/smooth-etale-site-compatibility` (comparison; declaration
`AdicSpace.Smooth.ballCharts_mem_etaleTopology`). For a smooth morphism `f : X → S` of locally noetherian
analytic adic spaces, the objects of `X_ét` (A1, identified on these carriers by
`AdicSpacesPartII:R4/etale-site-on-analytic-carriers`) admitting an étale map to some `B^n_S` generate
a covering sieve; every object of `X_ét` is smooth over `S` with `u^*Ω_{X/S} ≅ Ω_{U/S}`; base change
of sites carries ball charts to ball charts; over a field, toric charts also generate a covering sieve.

Acceptance:

- For X = B¹_K the identity is a ball chart and the cover {|T| = 1} ∪ {|T − 1| = 1} gives toric charts (AdicEtaleGeometry:A2/relative-torus (e)).
- Consumer instance: PadicHodgeTheory:P8/vector-bundles-on-analytic-etale-and-proetale-sites and the sheaf Ω¹ on X_ét are computed on such covers.

#### A2.9 Formal schemes and generic fibres in the scope of H1

`AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus` (comparison; declaration
`FormalScheme.genericFibreIsoAnalyticLocus`). Formal schemes (F0), type-(S) and admissible formal
schemes, Huber's functors `t` and `d`, the specialisation map, tubes, admissible blow-ups, Raynaud's
theorem, completions of schemes and the comparison maps `σ`, `φ` are R2's constructions. A2 identifies,
for a locally noetherian formal scheme `𝔛`, Huber's generic fibre `d(𝔛)` with the analytic locus
`t(𝔛)_a` of AdicEtaleGeometry A0 (with `λ = π ∘ ι`, compatibly with open formal subschemes and adic
morphisms), so `d(Spf A) = Spa(A, A)_a` with its Tate charts. H1 uses exactly: `d(𝔛)` and `λ_𝔛` for
type-(S) formal schemes, `d(X̂)` for completions of schemes (Huber 1.9.4–1.9.6, R2), the microbial
valuation-ring case `d(Spf A) = Spa(K, A)`, `Spa(A, A)_a` for noetherian `A` henselian along `I`
(Huber 3.2.11), the preimages `λ⁻¹(L)` defining pseudo-adic supports, and base change of generic
fibres to `k̄^` (R2/generic-fibre-fibre-products); none of these is a derived comparison.

Acceptance:

- 𝔛 = Spf ℤ_p⟦T⟧: d(𝔛) = Spa(ℤ_p⟦T⟧)_a = R((p, T)/p) ∪ R((p, T)/T) is quasi-compact and contains characteristic-p points; the Berthelot generic fibre d(𝔛) ×_{Spa ℤ_p} Spa(ℚ_p, ℤ_p), the open unit disc over ℚ_p, is the part where |p| ≠ 0 and is not quasi-compact (Hübner, Example 8.7).
- 𝔛 = Spf ℤ_p⟨T⟩: d(𝔛) = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩), the closed unit disc (Hübner, Example 9.4).

#### Requests and boundaries

- DiamondsAndVStacks (D3/D6) asks A2 for analytic adic spaces over `ℤ_p` with their diagonals,
  separated morphisms, classical valuative criteria and Huber's étale and finite étale sites: the
  category and analytic loci are the anchor's Layer 5 with AdicEtaleGeometry A0's analytic-locus
  interface, separatedness and the valuative criteria are A2.1, and the étale and finite étale sites
  are AdicEtaleGeometry A1's.
- PadicHodgeTheory P7 asks for Huber 1.6.10 charts containing the closure of a point (A2.4), Huber
  2.2.8 (AdicSpacesPartII R0), compatible toric charts (A2.5) and the sheaf `Ω¹` on `X_ét`, locally free
  of rank `dim X`: the rank statement is A2.6, and the coherent sheaf `Ω¹_{X/Y}` with its exterior
  powers is requested from AdicSpacesPartII R3 (the node
  `AdicSpacesPartII:R3/sheaf-of-continuous-differentials` proposed there); A2.6 uses its étale-site version.
- Base change of smooth, étale and unramified morphisms (Huber 1.6.7) is requested from AdicSpacesPartII R0
  (the node `AdicSpacesPartII:R0/smooth-etale-base-change` proposed there).
- The general non-noetherian affinoid statement of ECD 6.4(iv) is A3's; A2's non-noetherian content is
  limited to the definitions of balls, tori and ball-chart smooth morphisms.

<a id="a3"></a>

## A3. The nonnoetherian affinoid étale approximation input

### A3. The nonnoetherian affinoid étale approximation input

**Dependencies.** PerfectoidSpaces P1–P3 (perfectoid Tate rings and tilts, rational localisations, the sheaf theorem,
fibre products, almost purity, the étale site and its tilting), PerfectoidSpaces P5 (cofiltered limits of affinoid
perfectoid spaces and ECD 6.4(o)–(iii)), AdicSpacesPartII R0 (completed tensor products and their base-change formulas,
continuous differentials, the conormal sequence, Huber's noetherian étale theory), AdicSpacesPartII R3 (Tate's reduction
and Čech acyclicity on sheafy Tate affinoids, glueing squares, Kiehl gluing of finite projective modules), AdicSpacesPartII
R5 (sousperfectoid rings and spaces), AdicEtaleGeometry A1 (étale morphisms by local description, finite étale affinoid
algebras), and the Tau Ceti anchor's Layers 0–5 (Huber pairs, Tate rings and the open mapping theorem, restricted power
series, rational subsets with their universal property and perturbation invariance, sheafy pairs, adic spaces).
PerfectoidQuotients Q4 (ECD 5.8) is related to A3's closed immersions by a comparison node but is not needed by the proof.

**Consumers.** PerfectoidSpaces P6 (affinoid pro-étale maps, ECD 7.10–7.11, and through it the strictly totally
disconnected covers of ECD 7.18 used by DiamondsAndVStacks D1), and RelativeFarguesFontaine RF0 (the chart-cover
argument for the integral curve).

A3 proves **ECD Proposition 6.4(iv)**: for a cofiltered system X_i = Spa(R_i, R_i⁺) of affinoid perfectoid spaces with
limit X, the base change functors induce an equivalence

```text
2-colim_i (X_i)_{ét,aff}  ─────→  X_{ét,aff}
```

between affinoid perfectoid spaces étale over the X_i and over X. Full faithfulness is P5's ECD 6.4(ii). Essential
surjectivity is the content of the stage: an affinoid étale Y → X must be written by finitely many equations with
invertible Jacobian, and those equations approximated at a finite stage. Scholze's sketch cites Huber's Proposition
1.7.1, the pseudocoherent sheaves of Kedlaya–Liu, and Fargues–Scholze IV.4.19, whose proof uses diamond-level results.
A3 replaces every diamond-level step by analytic algebra, in five tasks: pseudocoherent modules and sheaves (A3.1),
standard étale presentations with a quantitative implicit function theorem (A3.2), the Fargues–Scholze specialisations
(A3.3), the closed embedding of an affinoid étale object into a relative ball (A3.4), and finite-stage approximation
(A3.5). No diamond, no ECD Proposition 11.30, no ECD Lemma 15.6 and no six-functor formalism is used anywhere.

#### Conventions

1. A prime p is fixed. Tate rings are complete and Hausdorff (anchor convention 3) with a pseudouniformiser ϖ (a
   topologically nilpotent unit, Tau Ceti `IsPseudoUniformizer`). Kedlaya–Liu's *Banach rings* are these Tate rings with
   a norm of the form attached to a ring of definition (AdicSpacesPartII:R0/tate-ring-norm); their *adic Banach rings*
   are complete Tate Huber pairs. *Sheafy* means that the structure presheaf is a sheaf for finite rational coverings of
   rational subsets.
2. A *rational localisation* of (A, A⁺) is the completed localisation (A⟨T/s⟩, A⟨T/s⟩⁺) at a rational subset R(T/s)
   (Tau Ceti `completionLocalization`); its plus ring is the completion of the integral closure of the image of
   A⁺[T₁, …, T_n] (Kedlaya–Liu I, Lemma 2.4.13(a)).
3. B^N_X := Spa(A⟨T₁, …, T_N⟩, A⁺⟨T₁, …, T_N⟩) is the relative closed unit polydisc over X = Spa(A, A⁺)
   (Tau Ceti `restrictedMvPowerSeriesCompletion`). Over a perfectoid (hence sousperfectoid) A it and all its rational
   subsets are sousperfectoid and sheafy (AdicSpacesPartII:R5/sousperfectoid-rings, R5/sousperfectoid-sheafy).
   Partial derivatives ∂/∂T_j are termwise on A⟨T⟩ (Mathlib `MvPowerSeries.pderiv`) and extend uniquely to rational
   localisations; the Jacobian of F = (F₁, …, F_N) is J_F := det(∂Fᵢ/∂T_j).
4. A *quotient mapping* of complete Huber pairs π: (P, P⁺) → (C, C⁺) is a surjective ring map with C⁺ the integral
   closure of π(P⁺) (Tau Ceti `Pair.quotient`); by the open mapping theorem it is open. An ideal generated by finitely
   many elements need not be closed, so presentations always use the closure of the ideal of equations.
5. Étale morphisms of perfectoid spaces are those of ECD Definition 6.2 (locally an open immersion into a space finite
   étale over an open of the base; PerfectoidSpaces:P3). Étale morphisms of sousperfectoid or general analytic adic
   spaces are taken by local description (AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison;
   Fargues–Scholze p. 135). X_{ét,aff} is the full subcategory of affinoid perfectoid spaces étale over X.
6. Modules are pseudocoherent in the sense of SGA 6 / Kedlaya–Liu (resolutions by finitely generated projectives), not
   in the sense of Hartshorne's Exercise I.2.11. Tensor products are algebraic unless written ⊗̂.
7. Characteristic p is used only through the Jacobian criterion (A3.3); every other statement holds for perfectoid
   bases of any characteristic. The passage between characteristics tilts étale categories, never closed immersions.

#### A3.1 Pseudocoherent modules and sheaves (task 1)

The required cases of Kedlaya–Liu II, §§1.1–1.2 and 2.4–2.5: pseudocoherent modules over sheafy complete Tate pairs, no
imperfect period rings, no étale-site or pro-étale variants.

- `AdicEtaleGeometry:A3/pseudocoherent-module` (definition). For a commutative ring R and m ∈ ℕ ∪ {∞}, M is
  *m-pseudocoherent* if it has a projective resolution ⋯ → P₁ → P₀ → M → 0 with Pᵢ finitely generated for i ≤ m, and
  *m-fpd* if it has a resolution of length ≤ m by finitely generated projectives (Kedlaya–Liu II, Definition 1.1.1).
  0-pseudocoherent = `Module.Finite`, 1-pseudocoherent = `Module.FinitePresentation`; beyond that the notion is new to
  Mathlib. API: `Module.IsPseudoCoherent`, `Module.IsFPD`, `zero_iff`, `one_iff`, `of_projective`,
  `IsFPD.isPseudoCoherent`, `mono`, `tensorProduct` (Remark 1.1.3, with one factor flat), `baseChange_of_flat`,
  `baseChange_of_isPseudoCoherent_algebra` (Stacks 064Z: for a finite algebra that is pseudocoherent as a module, pseudocoherence of an S-module over S and over R agree),
  `of_isNoetherianRing`. Unit tests: `test_quotient_nonZeroDivisor` (R/fR is 1-fpd), `test_finiteProjective`,
  `test_not_two` (over R = k[x, y₁, y₂, …]/(x·yᵢ) the finitely presented R/xR is not 2-pseudocoherent — rules out
  "pseudocoherent = finitely presented"), `test_noetherian`.
- `A3/pseudocoherent-two-out-of-three` (Lemma 1.1.5) and `A3/koszul-regular-sequence-fpd` (a weakly regular sequence
  f₁, …, f_r in the sense of Mathlib `RingTheory.Sequence.IsWeaklyRegular` gives a Koszul resolution: R/(f) is r-fpd and
  (f)/(f)² is free on the fᵢ).
- `A3/natural-topology-strict-exactness` (Kedlaya–Liu II, §1.2). Over a complete Tate ring: the natural topology of a
  finite module is Mathlib's `moduleTopology`, linear maps out of finite modules are continuous, continuous surjections
  of complete metrizable modules are strict (Tau Ceti `IsTateRing.isOpenMap`), Hausdorff finite modules are complete,
  finitely generated submodules of complete finite modules are closed (Corollary 1.2.11), completion preserves strict
  exact sequences (AdicSpacesPartII:R0/strict-complex-completion-exact).
- `A3/stably-pseudocoherent-module` (definition; planet *Stably pseudocoherent module*). Over a complete Tate pair
  (A, A⁺): *strictly* m-pseudocoherent = m-pseudocoherent and complete for the natural topology; *stably*
  m-pseudocoherent = m-pseudocoherent with M ⊗_A B complete for every rational localisation B (Definitions 1.2.13,
  2.4.1). API: `Huber.IsStrictlyPseudoCoherent`, `Huber.IsStablyPseudoCoherent`, `Huber.IsStablyFPD`,
  `isStrictlyPseudoCoherent`, `IsStablyFPD.isStablyPseudoCoherent`, `of_projective`, `completeSpace`, `baseChange`,
  `of_exact`, `of_isStronglyNoetherian`. Unit tests: `test_finiteProjective`, `test_tateAlgebra_quotient`
  (ℚ_p⟨T⟩/(T)), `test_not_stably` (Kedlaya–Liu II, Example 2.4.2: a quotient A/fA of an affinoid perfectoid ring that is
  strictly but not stably pseudocoherent), `test_strongly_noetherian`.
- `A3/pseudoflat-module` (definition, Definitions 2.4.4 and 2.4.6). B is *m-pseudoflat* over A if Tor₁^A(P, B) = 0 for
  all stably m-pseudocoherent P; *pro-projective* modules have continuous projectors with finite projective images
  converging to the identity. 2-pseudoflat implies pseudoflat; only Tor₁ is controlled. API: `Huber.IsPseudoFlat`,
  `Huber.IsProProjective`, `of_flat`, `of_isProProjective`, `iff_injective_rTensor`, `mono`, `comp`,
  `baseChange_isStablyPseudoCoherent`. Unit tests: `test_flat`, `test_restrictedPowerSeries` (A⟨T⟩ and A⟨T^{±1}⟩),
  `test_quotient_not` (ℚ_p⟨T⟩/(T) is not pseudoflat), `test_iff_injective`.
- `A3/restricted-power-series-pro-projective` (Lemma 2.4.7, Corollaries 2.4.8–2.4.9: M ⊗_A A⟨T⟩ = M⟨T⟩ for complete
  finitely presented M), `A3/simple-laurent-strict-multiplication` (Lemma 2.4.10: over a sheafy pair, ×(T − f) and
  ×(1 − fT) are strict injections of A⟨T⟩ and A⟨T^{±1}⟩, so the simple Laurent localisations are A⟨T⟩/(T − f),
  A⟨T⟩/(1 − fT) without closure), `A3/simple-laurent-pseudoflat` (Lemmas 2.4.12–2.4.13), and
  `A3/rational-inclusion-reduction` (Kedlaya–Liu I, Proposition 2.4.24: a transitive property of rational inclusions
  that holds on simple Laurent pieces holds for all).
- `A3/rational-localisation-pseudoflat` (theorem, Theorem 2.4.15). Rational localisations of a sheafy pair are
  2-pseudoflat; base change preserves stable m-pseudocoherence (m ∈ {2, ∞}) and is exact on it. This is the substitute
  for flatness, which is not known in the non-noetherian case (Remark 2.2.8).
- `A3/pseudocoherent-tate-acyclicity` (theorem, Theorem 2.5.1). For M stably pseudocoherent over a sheafy pair,
  M̃(U) = M ⊗_A O(U) is a sheaf on rational subsets with exact augmented Čech complexes on all finite rational coverings.
  `A3/fpd-local-to-global` (Corollary 2.5.2): finite projective dimension, in particular projectivity, is local on
  rational coverings.
- `A3/pseudocoherent-sheaf` (definition, Definition 2.5.3). A sheaf of O_X-modules on an adic space covered by sheafy
  Tate affinoids is *pseudocoherent* (*fpd*) if it is locally M̃ with M stably pseudocoherent (stably fpd). API:
  `AdicSpace.IsPseudoCoherentSheaf`, `AdicSpace.IsFPDSheaf`, `of_module`, `restrict`, `ker_of_surjective`,
  `coker_of_injective`, `isStablyPseudoCoherent_sections`, `equivModule`, `IsFPDSheaf.isPseudoCoherentSheaf`. Unit
  tests: `test_structureSheaf`, `test_vectorBundle` (compatibility with AdicSpacesPartII:R3's vector bundles),
  `test_tateAlgebra_ideal` (compatibility with R3's coherent sheaves on Spa ℚ_p⟨T⟩), `test_pushforward_not` (j_*O_U for
  the rational open U = {|T| ≤ |p|} is not pseudocoherent: O(U) is not finite over ℚ_p⟨T⟩).
- `A3/simple-laurent-pseudocoherent-descent` (Lemma 2.5.4) and **`A3/pseudocoherent-kiehl-gluing`** (theorem, Theorem
  2.5.5 and Corollary 2.5.6; planet *Pseudocoherent Kiehl gluing*). On a sheafy Tate affinoid, global sections are an
  exact equivalence between pseudocoherent (fpd) sheaves and stably pseudocoherent (stably fpd) modules, and base
  extension along open immersions is exact and pseudoflat. Strongly noetherian case: Kiehl's theorem
  (AdicSpacesPartII:R3/tate-kiehl-affinoid); finite projective case: R3/sheafy-tate-acyclicity-and-kiehl-gluing.

#### A3.2 Standard étale presentations and the implicit function theorem (task 4)

- `A3/restricted-power-series-newton` (lemma). Over a complete Tate ring C with ring of definition C₀ ∋ ϖ: if
  F ∈ C₀⟨T⟩^N, t ∈ C₀^N, the Jacobian J(t) has an inverse bounded by |ϖ|^{−k} and F(t) ∈ ϖ^{2k+1}C₀^N, then F has a
  unique zero t* ∈ t + ϖ^{k+1}C₀^N, functorial in C and continuous in parameters. Taylor expansion uses Hasse
  derivatives, so the lemma holds in characteristic p.
- `A3/perturbation-of-generators` (lemma). X ↦ X + ε(X) with ε ∈ ϖA₀⟨X⟩ⁿ is an automorphism of A⟨X⟩; hence a small
  perturbation of a strong generating system of a quotient pair is again one, and a presentation transports to
  F ∘ θ_ε with Jacobian changed by a unit ≡ 1 mod ϖ. This is point (3) of Huber's proof of 1.7.1 without its
  noetherian hypothesis.
- **`A3/standard-etale-presentation`** (definition; planet *Standard étale presentation*). A standard étale
  presentation of (C, C⁺) over a complete Tate pair (A, A⁺) is (N, F, k, π): F ∈ A⁺⟨T₁, …, T_N⟩^N, π: A⟨T⟩ → C a quotient
  mapping with kernel the closure of (F), and π(J_F) a unit with ϖᵏπ(J_F)^{−1} ∈ C⁺. The *explicit-inverse form*
  F = (F', S·J_{F'} − ϖ^{k'}) encodes the Jacobian inverse as an equation (then k = 2k'); it is the form that is
  perturbed and approximated. Equal numbers of equations and variables, weights all 1 (the Tate case of Huber's
  A⟨X⟩_{T₁,…,T_n}), closure of the ideal always taken, plus ring always the integral closure. API:
  `Huber.StandardEtalePresentation`, `jacobian`, `isUnit_jacobian`, `quotientEquiv`, `withInverse`, `ofRational`,
  `ofFiniteEtale`, `comp`, `baseChange`, `kaehler_eq_zero`, `tube`, `perturb`. Unit tests: `test_rational`
  ((tTᵢ − sᵢ) presents A⟨s/t⟩ with Jacobian tⁿ), `test_zero`, `test_frobenius_not` (T^p − a in characteristic p has
  Jacobian 0), `test_finiteEtale` (Mathlib's submersive presentations of étale algebras).
- `A3/standard-presentation-basic-pieces` (lemma). Rational localisations, finite étale algebras (with their natural
  topology and integral-closure plus ring), composites and rational subsets of presented pairs all have standard étale
  presentations; the Jacobian of a composite is the product.
- **`A3/tubular-neighbourhood`** (theorem; planet *Nonarchimedean implicit function theorem*). For e ∈ O⁺(R)^N on a
  rational R ⊆ B^N_X with Jacobian bounded below by |ϖᵏ| on the tube
  W = R ∩ {|eᵢ| ≤ |ϖ^m|} ∩ {|ϖᵏ| ≤ |Δ|} (m ≥ 2k + 1), and A with uniform rational localisations of its Tate algebras
  (for instance A sousperfectoid):

  ```text
  O(W) ≅ C⟨u₁, …, u_N⟩,   e ↦ ϖ^m u,   C = O(W)/(e) = O(V(e) ∩ W),
  ```

  i.e. W ≅ (V(e) ∩ W) ×_X B^N(|ϖ|^m), and the same on every rational W' ⊆ W; (e) is closed there.
- `A3/standard-presentation-perturbation` (theorem). For a presentation in explicit-inverse form with exponent k and
  G ≡ F modulo ϖ^{4k+2}: V(G) lies in the tube of F, G is again a standard étale presentation, and there is a unique
  isomorphism α_{F,G}: C → C_G over A with α(T) close to T. The comparison maps are mutually inverse on the tube (no
  further shrinking), compose, commute with base change and match plus rings. In Huber's noetherian scope this is
  AdicSpacesPartII:R0/etale-presentation-perturbation (Huber 1.7.2).
- `A3/standard-etale-locus-sousperfectoid` (lemma). Over a sousperfectoid base a standard étale locus is sousperfectoid:
  the tube makes C a C-linear direct summand of the sousperfectoid O(W), and a frame of O(W) restricts to a frame of C.
  Hence the locus is a sousperfectoid affinoid adic space — the étale case of FS IV.4.17's "sous-perfectoid" clause.
- `A3/fs-iv-4-13-regular-sequence` (lemma). On every rational subset W' of the tube, e is a weakly regular sequence with
  closed ideal and free conormal module; O(W)/(e) is stably N-fpd.

#### A3.3 The Fargues–Scholze IV.4 statements by analytic algebra (task 3)

Fargues–Scholze §IV.4.1 was read in full (arXiv v4, pp. 135–141). Its proofs use, besides Kedlaya–Liu's gluing:

```text
IV.4.13  "spreading of étale maps" (no reference; ECD 12.17 + 15.6 type)   → A3/fs-iv-4-13-regular-sequence (tube)
IV.4.14  ECD 15.6, ECD 12.17                                               → not needed
IV.4.15  Huber 1.6.9(iii) on fibres, ECD 12.17 (twice), IV.4.14, IV.4.16    → A3/jacobian-criterion-char-p (c)
IV.4.16  descent to strictly totally disconnected bases (uses ECD §7,
         whose covers are built with ECD 6.4(iv))                          → not needed
IV.4.17  IV.4.15                                                           → A3/jacobian-criterion-char-p (a),(b);
                                                                              A3/standard-etale-locus-sousperfectoid
IV.4.18  ECD 15.6, ECD 11.30                                               → not needed
IV.4.19  IV.4.13, IV.4.15, IV.4.17, Kedlaya–Liu gluing                      → A3/fs-iv-4-19-zariski-closed-char-p,
                                                                              A3/conormal-description,
                                                                              A3/local-equations-near-closed-subspace
```

The specialisations proved are exactly those ECD 6.4(iv) uses: étale (relative dimension 0) loci and closed immersions
of affinoid étale perfectoid spaces into rational subsets of relative balls over affinoid perfectoid bases. The smooth
cases and general sous-perfectoid bases remain a recorded gap.

- `A3/char-p-perfectoid-base-field` (lemma). A perfectoid Tate pair (R, R⁺) of characteristic p is an algebra over the
  perfectoid field K = F_p((t^{1/p^∞}))^∧ (t ↦ ϖ) with R⁺ a K°-algebra; so Scholze 2012, Lemma 6.13 writes it as a
  completed colimit of p-finite algebras, completed perfections of reduced K-affinoid algebras of topologically finite
  type (PerfectoidSpaces:P2/completed-direct-limits-of-p-finite-affinoids).
- `A3/jacobian-criterion-char-p` (theorem; FS IV.4.15(ii) and IV.4.17, étale case). Over B = O(Q), Q rational in B^m_X
  with X affinoid perfectoid of characteristic p, a standard étale locus is étale over Spa(B) by local description; for
  m = 0 it is affinoid perfectoid and étale over X in ECD's sense (its ring is perfect). Maps between rational subsets of
  balls with invertible Jacobian are étale. Proof: approximate the finitely many coefficients by a strongly noetherian
  K-affinoid algebra (previous node), use Huber's noetherian theory (AdicSpacesPartII:R0/etale-local-structure,
  R0/etale-affinoid-finite-etale-embedding, R0/etale-local-open-finite-etale-factorisation), base change along the
  sousperfectoid Spa(B) (AdicSpacesPartII:R5/sousperfectoid-etale-base-change), and perturb back
  (A3/standard-presentation-perturbation) — the strategy of Scholze 2012, Proposition 7.7.
- `A3/integral-cutoff-graph-presentation` (lemma). Given a morphism g: Spa(C) → R ⊆ B^N_X with C standard étale over A,
  functions w ∈ O(R) whose images are close to C's generators, and monic polynomials P_l over O⁺(R) with |P_l(g*w_l)|
  small on Spa(C): the rational subset R'' = {|P_l(w_l)| ≤ |ϖ^M|} contains g(Spa C), forces |w_l| ≤ 1 (a monic
  polynomial with bounded coefficients is large where its argument is), and its complement pieces
  Q_l = {|P_l(w_l)| ≥ |ϖ^M|} miss Spa(C). On R'' the map O(R'') → C is a quotient mapping and, through the graph of w and
  the tube theorem, C is a stably pseudocoherent O(R'')-module. This "integral cut-off" is what removes the boundary
  specialisations (points with |w| = 1⁺) that otherwise prevent the image of Y from being closed.
- `A3/fs-iv-4-19-zariski-closed-char-p` (theorem; FS IV.4.19–IV.4.20). For g: Y → Y' ⊆ B^N_X (Y' a finite union of
  rational subsets, Y affinoid perfectoid étale over X): local surjectivity on a rational covering of Y' (i) implies it
  on every rational subset (ii); then the ideal sheaf is pseudocoherent and O(V')/I(V') = O(g^{−1}V') with integral
  closure plus ring (the *affine quotient* and *plus-ring description*). Valid for perfectoid bases of any
  characteristic.
- `A3/etale-standard-piece-cover` (lemma). An affinoid perfectoid Y étale over affinoid perfectoid X has a standard
  rational covering Y(σ/σ_j) by pieces that are rational subsets of spaces finite étale over rational subsets of X,
  each with a standard étale presentation.

#### A3.4 The closed embedding of an affinoid étale object (task 2)

- `A3/integral-approximation-of-generators` (lemma). On V = Y(σ/σ_j), every ū ∈ O⁺(V) is approximated by some z that is
  a root of a monic polynomial whose coefficients are polynomials in the ratios σᵢ/σ_j with coefficients in finitely
  many global elements of B⁺, and z by b/σ_j^s with b ∈ B (Kedlaya–Liu I, Lemma 2.4.13(a): plus rings of rational
  localisations are completed integral closures).
- `A3/affinoid-etale-zariski-closed-embedding` (theorem). For Y = Spa(B, B⁺) affinoid perfectoid étale over affinoid
  perfectoid X there are b ∈ (B⁺)^N with A⟨T₁, …, T_N⟩ → B, T ↦ b, a quotient mapping; its kernel I is stably
  pseudocoherent and Ĩ is a pseudocoherent ideal sheaf on B^N_X. ECD asserts this closed immersion; A3 constructs it:
  global coordinates (the σᵢ, a unit-ideal certificate aᵢ, the coefficients β of the monic equations, and the
  numerators b of the approximations), the rational covering
  R₀ = {|h| ≥ |ϖ^{2c+1}|} ∪ {R''_j} ∪ {Q_{jl}} of the whole ball built from the integral cut-off, and
  A3/fs-iv-4-19-zariski-closed-char-p with Y' = B^N_X.
- `A3/conormal-description` (lemma). Ω^c_{O(Y)/A} = 0 and δ: I/I² → ⊕ O(Y)·dTᵢ is an isomorphism — ECD's
  "Ω¹_{Y/X} = 0 and so I/I² ≅ Ω¹_{B^n_X/X}/I".
- `A3/local-equations-near-closed-subspace` (lemma). Lifts e₁, …, e_N ∈ I of the basis dTᵢ have Jacobian ≡ 1 on Y; in
  the tube of e, the kernel K of O(W₀)/(e) → O(Y) satisfies K = K² and is finitely generated, hence generated by an
  idempotent (Mathlib `Ideal.isIdempotentElem_iff_of_fg`); cutting the other component off by a rational condition
  gives W with O(W)/(e) = O(Y). This replaces Fargues–Scholze's "closed immersion and étale, hence locally an
  isomorphism".
- **`A3/global-standard-etale-presentation`** (theorem; planet *Huber 1.7.1 for affinoid perfectoid spaces*). Every
  affinoid étale Y over affinoid perfectoid X has a standard étale presentation over (A, A⁺), in explicit-inverse form;
  in characteristic p, conversely, every standard étale presentation defines an affinoid perfectoid space étale over X.

#### A3.5 Finite-stage approximation and ECD 6.4(iv) (task 5)

- `A3/tilting-affinoid-etale-and-limits` (lemma). Tilting commutes with cofiltered limits of affinoid perfectoid spaces
  (R^{♭+}/ϖ^♭ = R⁺/ϖ = colim R_i⁺/ϖ) and identifies the functors of 6.4(iv) for (X_i) and (X_i^♭).
- `A3/cofiltered-limit-presentation-approximation` (lemma). R⁺⟨T⟩/ϖ^M = colim (R_i⁺/ϖ^M)[T], so finitely many equations
  and the rational data are approximated over some R_i⁺; base change of a presentation over R_i presents the fibre
  product with X.
- `A3/finite-stage-approximation-char-p` (theorem). In characteristic p: approximate the explicit-inverse presentation of
  Y modulo ϖ^{4k+2} over R_i; the approximating locus Y_i is affinoid perfectoid and étale over X_i (Jacobian criterion)
  and Y_i ×_{X_i} X ≅ Y (perturbation). The approximated Jacobian inverse is part of the data, so the finite-stage locus
  has invertible Jacobian everywhere.
- `A3/independence-of-presentations` (lemma). Models from different presentations, approximations and indices become
  uniquely isomorphic over some X_j (P5's 6.4(ii) full faithfulness); the model is the P5 qcqs descent of Y, which is
  therefore affinoid at a finite stage.
- **`A3/affinoid-etale-finite-stage-6-4-iv`** (theorem; planet *Affinoid étale finite-stage descent*). The equivalence
  2-colim (X_i)_{ét,aff} → X_{ét,aff} for any cofiltered system of affinoid perfectoid spaces, in any characteristic.
- `A3/etale-descent-to-finite-stage-6-4` (comparison). ECD Proposition 6.4 assembled: (o)–(iii) and the cardinal bound
  are PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces and P5/finite-stage-descent-of-qcqs-etale-objects;
  (iv) is the node above; the inclusions X_{fét} ⊆ X_{ét,aff} ⊆ X_{ét,qc,sep} ⊆ X_{ét,qcqs} are compatible with all four
  comparison functors. A3 does not reprove (o)–(iii); P5 does not claim (iv).
- `A3/zariski-closed-immersion-ecd-comparison` (comparison). The closed embedding of A3.4, composed into the perfectoid
  ball, is strongly Zariski closed in the sense of ECD 5.7; by ECD 5.8 (PerfectoidQuotients:Q4) every Zariski closed
  immersion of perfectoid spaces is strongly Zariski closed. The 6.4(iv) proof does not need 5.8.

#### Acceptance tests

1. Rational subsets: Y = X(s/t) descends to X_i(s_i/t_i) for approximations of s, t (Tau Ceti perturbation of rational
   subsets); the closed embedding is Tᵢ ↦ sᵢ/t with ideal the closure of (tTᵢ − sᵢ).
2. Finite étale Y: the model from an approximated monic presentation agrees with P5's ECD 6.4(i).
3. The tube of e = T − a on B¹_X is the translation {|T − a| ≤ |ϖ|} ≅ B¹(|ϖ|).
4. Perturbation of (T − a) to (T − a') with a ≡ a' mod ϖ² gives the identity of A.
5. F = T^p − a in characteristic p is rejected by the Jacobian condition; its locus is not étale.
6. Over ℚ_p⟨T⟩ (strongly noetherian) the pseudocoherent theory reduces to Kiehl's coherent theory
   (AdicSpacesPartII:R3/tate-kiehl-affinoid) and pseudoflatness to flatness.
7. The ECD applications: in the proof of Lemma 7.18, affinoid étale covers descend to a finite level of a tower; in the
   proof of Lemma 7.11(i), composites of affinoid pro-étale maps via Proposition 7.10 and 6.4(iv).

#### Boundaries and retained gaps

- PerfectoidSpaces P5 owns ECD 6.4(o)–(iii), the cofiltered limits and the cardinal bounds; A3 owns 6.4(iv) and the
  analytic algebra behind it. DiamondsAndVStacks D6 owns the identification of étale sites of analytic adic spaces with
  those of diamonds (ECD 15.6); A3 uses neither it nor ECD 11.30.
- Fargues–Scholze IV.4.13–IV.4.19 in their general (smooth, sous-perfectoid-base) form are not imported: their printed
  proofs rest on ECD 12.17, 15.6, 11.30 and on descent to strictly totally disconnected bases. Only the étale
  perfectoid-base specialisations are proved here.
- Kedlaya–Liu II, Remark 2.4.3 (stable pseudocoherence of quotients with sheafy quotient) cites unread lecture notes
  and is not used; Kedlaya–Liu's open points (flatness of rational localisations, Fitting ideals of pseudocoherent
  modules, the T − f case of Lemma 2.4.12) are recorded as boundaries.
- Inherited through cited suppliers: Huber 1996 Lemma 2.2.8 and the de Jong–van der Put inputs (AdicSpacesPartII R0),
  used by the characteristic-p Jacobian criterion; the Bosch–Güntzer–Remmert inputs of Scholze 2012, Lemma 6.13
  (PerfectoidSpaces P2); the perfectoid-field generality of the P2/P3 nodes, requested in the generality of perfectoid
  Tate rings for the tilting transfer.
- Source problems recorded: the misprint "V₀ is contained in V" in Kedlaya–Liu I, Proposition 2.4.24 (should read
  "contains V"); the reference "[91, Theorem 2.7.4]" in Kedlaya–Liu II, Lemma 2.4.10 (the Tate sheaf property is
  [91, Theorem 2.7.7]); the unconstructed closed immersion and unproved perturbation in ECD's proof of 6.4(iv); the
  unreferenced "spreading of étale maps" in Fargues–Scholze IV.4.13 and the unstated descent in IV.4.16; the false
  four-way equivalence in Kedlaya–Liu I, Definition 2.8.1 (corrected in Kedlaya–Liu II, Appendix A), which bears on
  AdicSpacesPartII:R3/uniform-iff-power-bound but not on A3.

<a id="a4"></a>

## A4. Analytic adic presentations for diamondification

### A4. Analytic adic presentations for diamondification

**Dependencies.** AdicEtaleGeometry A1 (finite étale algebras over complete Tate Huber pairs with their natural
topology and integral plus ring, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`; the finite étale and étale sites
of generalized adic spaces, `A1/finite-etale-site`, `A1/etale-site`, `A1/generalized-adic-presentation`);
AdicSpacesPartII R0 (`R0/uniformization`, `R0/spectral-seminorm`, `R0/spectral-topology`, `R0/tate-ring-norm`,
`R0/completed-tensor-product`, `R0/uniform-completed-tensor-product`, `R0/finite-algebra-tensor-complete`);
PerfectoidSpaces P1 (`P1/perfectoid-tate-rings-and-algebras`), P3 (the henselian finite étale comparison, requested
in the generality of Tate rings without a base field) and P5 (`P5/cofiltered-limits-of-affinoid-perfectoid-spaces`);
ClassicalAdicEtaleCohomology H1:henselian (`henselian-f-adic-rings-and-henselization`: complete f-adic rings are
henselian); the Tau Ceti anchor's Huber pairs, power-bounded subrings, completion and adic spectra through the
declarations named below. **Consumers.** DiamondsAndVStacks D6 (`D6/spd-of-a-tate-pair`, `D6/spd-is-a-spatial-diamond`,
`D6/gluing-and-the-diamond-functor`, `D6/etale-site-comparison`) and BunGAndNewtonStrata BG0.

A4 is the analytic half of ECD §15. It builds, for a complete Tate ℤ_p-algebra A, a profinite tower of finite étale
torsors A → A_i that kills every finite étale cover, completes it uniformly to a perfectoid Tate ring Â_∞ with a
continuous action of G = lim G_i, and packages the result as a *perfectoid torsor presentation*: an affinoid
perfectoid cover X̃ = Spa(Â_∞, Â_∞⁺) of Spa(A, A⁺), the induced perfectoid equivalence relation
R̃ = Spa(C^0(G, Â_∞)) ≅ G × X̃, the topological quotient |X̃|/G = |Spa(A, A⁺)|, and effective descent of finite
étale algebras along X̃ → Spa(A, A⁺). Everything here is a statement about rings, Huber pairs and spaces of
continuous valuations; no v-sheaf appears. The v-sheaf Spd(A, A⁺), the facts that Spd(A_i) → Spd(A) and
Spd(Â_∞) → Spd(A) are torsors, that Spd(A, A⁺) is a spatial diamond, the diamond Y^♢ of an analytic adic space,
and the equivalence of its étale sites with those of Y are DiamondsAndVStacks D6's; D6 imports A4, and no A4
statement is justified by a D6 result. Sheafiness of (A, A⁺) is never assumed: the presentation is exactly what
makes a non-sheafy Tate pair usable in ECD §15.

#### Conventions

1. **Tate rings.** A Tate ring is Tau Ceti's `IsTateRing` (a Huber ring with a topologically nilpotent unit); it is
   not required to be complete. *Complete* means complete and Hausdorff. A *Tate ℤ_p-algebra* is a Tate ring in
   which p is topologically nilpotent. Pseudouniformizers are Tau Ceti's `IsPseudoUniformizer`; R° is
   `powerBoundedSubring`; R°° the topologically nilpotent elements.
2. **Finite étale algebras.** A finite étale R-algebra is one with Mathlib's `Algebra.Etale` and `Module.Finite`;
   FÉt(R) is their category with R-algebra maps. For R a complete Tate ring, a finite étale R-algebra carries its
   natural topology as a finite projective R-module and, over a pair (R, R⁺), the plus ring given by the integral
   closure of R⁺ (A1).
3. **Splitting.** A finite étale R-algebra T is *totally split* if T ≅ ∏_{j=1}^m R/(1 − e_j) for idempotents e_j
   of R (m ≥ 0). R *has no nonsplit finite étale covers* if every finite étale R-algebra is totally split.
4. **Torsors.** A finite group G acts on the left by algebra automorphisms; the Galois map is
   `b ⊗ b′ ↦ (g ↦ b·g(b′))`; faithful flatness is part of the definition of a torsor.
5. **Towers.** In a tower, π_{ij} : G_j → G_i goes from the larger index to the smaller, ι_{ij} : A_i → A_j is
   equivariant along it, and G = lim G_i acts on A_∞ = colim A_i.
6. **Topology on the colimit.** A_∞ carries the topology in which colim_i A_i° is an open subring with its ϖ-adic
   topology (the Berkeley lectures' "topology making lim R_i° open and bounded"), not the colimit of chosen rings of
   definition.
7. **Uniform completion.** The uniform completion of a Tate pair is its uniformization in the sense of
   AdicSpacesPartII R0 (separated completion for the spectral seminorm, plus ring the closure of the image). For
   the colimit of a tower it is the Hausdorff completion, since A_∞ is uniform.
8. **Perfectoid.** Perfectoid Tate rings are those of PerfectoidSpaces P1 (ECD Definition 3.1: complete, uniform,
   a pseudouniformizer ϖ with ϖ^p | p in R°, and Φ : R°/ϖ → R°/ϖ^p bijective).
9. **Completeness.** A4's statements are for complete Tate rings A. For a Tate ℤ_p-algebra that is not complete,
   the construction is applied to its completion Â; its adic spectrum is that of A, and D6 uses
   Spd(A, A⁺) = Spd(Â, Â⁺). A torsor tower over the non-complete ring itself need not have a perfectoid
   uniform completion (source correction AdicEtaleGeometry/E19 below).
10. **Actions on spectra.** G acts on Spa(B, B⁺) by (g·y)(b) = y(g⁻¹b). Presentations require the map of adic
    spectra to be spectral (quasi-compact) as well as surjective: surjectivity on points alone is not the
    compactness condition.

#### A4.1 Rings without nonsplit finite étale covers

`AdicEtaleGeometry:A4/finite-etale-split-ring` (definition; planet "Ring with no nonsplit finite étale covers").
The class `IsFiniteEtaleSplit R`: every finite étale R-algebra is totally split (convention 3), with the predicate
`Algebra.IsTotallySplit R T`. This is the conclusion of ECD Lemma 15.3 and the only property of A_∞ its proof uses.

API:
- `isFiniteEtaleSplit_iff_exists_section`: R has no nonsplit covers iff every *faithfully flat* finite étale
  R-algebra has an R-algebra map to R (for T faithfully flat and totally split, refine the covering idempotents to
  orthogonal ones; conversely split off a section by the idempotent of its graph and induct on the rank);
- `IsFiniteEtaleSplit.exists_root`: a monic P of degree ≥ 1 with P′ a unit modulo P (a Mathlib `StandardEtalePair`
  with g = 1) has a root;
- `isFiniteEtaleSplit_iff_isSepClosed`: for a field, the condition is `IsSepClosed`
  (Mathlib `Algebra.Etale.iff_exists_algEquiv_prod`);
- `IsFiniteEtaleSplit.of_baseChange_equivalence`: if base change along R → R′ is an equivalence
  FÉt(R) ≅ FÉt(R′), then R has no nonsplit covers iff R′ has none (idempotents are the maps R × R → R, so
  faithful flatness is preserved and reflected);
- `Algebra.IsTotallySplit.quotient_idempotent`, `IsFiniteEtaleSplit.pi`, `IsFiniteEtaleSplit.of_subsingleton`.

Unit tests: `test_isSepClosed` (compatibility with `IsSepClosed`), `test_zero` (the zero ring), `test_not_rat`
(ℚ[X]/(X² − 2) has no section), `test_zero_algebra_has_no_section` (the zero algebra is totally split and has no
section, so "every finite étale algebra has a section" is the wrong definition), `test_pi` (products of separably
closed fields), `test_exists_root`.

#### A4.2 Finite étale torsors

`AdicEtaleGeometry:A4/finite-etale-galois-torsor` (definition). `Algebra.IsFiniteEtaleTorsor G A B`: B is finite
étale and faithfully flat over A and the Galois map B ⊗_A B → Map(G, B) is bijective. Consequences: B is finite
projective of constant rank |G|; B^G = A (Mathlib `Algebra.IsInvariant`); for A ≠ 0 the action is faithful and
Mathlib's `IsGaloisGroup G A B` holds; B^{⊗(k+1)} ≅ Map(G^k, B). For fields, torsors are finite Galois extensions.

API: `galoisMap`, `iterGaloisMap`, `trivial` (Map(G, A) with (h·f)(g) = f(gh)), `tensor` (product torsors),
`baseChange`, `isInvariant`, `isGaloisGroup`, `rankAtStalk_eq_card`, `of_surjective` (an equivariant map from a
G-torsor to a G′-torsor along a surjection π : G′ → G makes B′ a (ker π)-torsor over B, hence faithfully flat and
injective), `iff_isGalois`.

Unit tests: `test_gaussian_half` (ℤ[1/2][i] is a ℤ/2-torsor over ℤ[1/2]), `test_not_gaussian` (ℤ[i] over ℤ is not:
ramification at 2), `test_trivial_action` (A × A with trivial action is not), `test_trivial_group`, `test_isGalois`.

#### A4.3 The finite étale torsor tower

`AdicEtaleGeometry:A4/finite-etale-algebras-filtered-colimit` (lemma; Kedlaya–Liu Remark 1.2.9). For a filtered
colimit R = colim R_i of rings, base change is an equivalence 2-colim FÉt(R_i) ≅ FÉt(R); faithful flatness,
sections and total splittings over R are already present over some R_j.

`AdicEtaleGeometry:A4/splitting-torsor-of-finite-etale-algebra` (lemma). Every finite étale A-algebra S is totally
split by some finite étale torsor A → P. After padding S to constant rank n, P is the direct factor of S^{⊗n}
cut out by ε = ∏_{a<b}(1 − δ_{ab}) (δ the diagonal idempotent of S ⊗_A S), with S_n permuting the factors — the
algebra of ordered n-tuples of distinct points in the fibres; on geometric fibres P ⊗ k ≅ k^{S_n}, and the universal
frame S ⊗_A P → P^n is an isomorphism. This is the ring-theoretic form of the Galois-closure construction for
Galois categories (Stacks 0BN2), needed because Spec A may be disconnected.

`AdicEtaleGeometry:A4/finite-etale-torsor-tower` (construction; planet "Finite étale torsor tower"). The structure
`FiniteEtaleTorsorTower A`: a directed set I, finite groups G_i with surjective π_{ij}, finite étale G_i-torsors
A → A_i with equivariant transition maps, functorial in i ≤ j ≤ k, such that A_∞ = colim A_i has no nonsplit finite
étale covers. `FiniteEtaleTorsorTower.canonical A` shows every ring has one: index by finite sets F of isomorphism
classes of finite étale A-algebras, with A_F = ⊗_{S∈F} P(S) and G_F = ∏_{S∈F} G(S). A finite étale A_∞-algebra C
comes from some A_F (A4.3 first lemma), hence is isomorphic to some S; over A_{F∪{S}} it is a direct factor of the
totally split S ⊗_A A_{F∪{S}}, so it is totally split.

API: `colim`, `toColim`, `group` (G = lim G_i as a `ProfiniteGrp`), `colimAction` (open stabilisers),
`isFiniteEtaleSplit_colim`, `exists_level_totallySplit`, `transition_isFiniteEtaleTorsor` (A_j is a
ker π_{ij}-torsor over A_i), `colim_isInvariant` ((A_∞)^G = A), `colimTensorEquiv`
(A_∞ ⊗_A A_∞ ≅ LC(G, A_∞), a ⊗ b ↦ (g ↦ a·g(b))), `faithfullyFlat_colim`, `baseChange`.

Unit tests: `test_finiteField` (𝔽_{p^{n!}} over 𝔽_p, colimit 𝔽̄_p, G = ℤ̂), `test_trivial` (the one-point tower over
a split ring), `test_not_cyclotomic` (the p-power cyclotomic system over ℚ_p is a compatible system of torsors but
not a tower: the unramified quadratic cover of its colimit does not split), `test_field_residue` (over a field,
residue fields of A_∞ are separable closures, Mathlib `IsSepClosure`), `test_exists_level_split`.

#### A4.4 Uniformization does not change spectra or finite étale algebras

`AdicEtaleGeometry:A4/uniform-completion-etale-comparison` (theorem; planet "Invariance under uniformization").
Let (A, A⁺) be a Huber pair with A complete Tate and ι : (A, A⁺) → (A^u, A^{u+}) its uniformization
(AdicSpacesPartII R0). Then:

```text
(i)   Spa(A^u, A^{u+}) → Spa(A, A⁺) is a homeomorphism matching rational subsets   (R0, clause (d));
(ii)  FÉt(A) → FÉt(A^u), B ↦ B ⊗_A A^u, is a tensor equivalence, preserving and reflecting
      faithful flatness and ranks, bijective on sections and on idempotents;
(iii) for B ∈ FÉt(A), B ⊗_A A^u (natural topology, integral plus ring) is uniform and is the
      uniformization of (B, B⁺);
(iv)  A has no nonsplit finite étale covers iff A^u has none.
```

(ii)–(iii) are Kedlaya–Liu Proposition 2.8.16, proved there through affinoid systems; the same equivalence follows
from the topologically henselian comparison, since the spectral topology has ring of definition A°, which is
henselian along ϖ when A is complete. Completeness is essential: ℚ_p[T] (ring of definition ℤ_p[T]) has
uniformization ℚ_p⟨T⟩, and ℚ_p⟨T⟩[X]/(X^p − X − T/p) is finite étale (discriminant ±(pT^{p−1} − (p−1)^{p−1}), a unit
on the disc) but is not the base change of a finite étale ℚ_p[T]-algebra: its fibre over T = 0 splits while over
T = p it is the unramified extension of degree p, whereas finite étale ℚ_p[T]-algebras are products of L[T].

#### A4.5 The completed tower and its finite étale data

`AdicEtaleGeometry:A4/completed-tower-pair` (construction; planet "Completed torsor tower"). For (A, A⁺) complete
Tate and a tower T: the levels (A_i, A_i⁺) are A1's Huber pairs of finite étale algebras; the colimit
(A_∞, A_∞⁺ = colim A_i⁺) with the topology of convention 6 is a *uniform* Tate pair (A_∞° ⊆ ϖ⁻¹·colim A_i°: for power-bounded x,
ϖx is topologically nilpotent, hence integral over colim A_i°, which is integrally closed in A_∞); its uniformization (Â_∞, Â_∞⁺) is its Hausdorff
completion, with Â_∞⁺ the closure of colim A_i⁺ — ECD's "uniform completion Â_∞ of A_∞". G acts continuously on
(Â_∞, Â_∞⁺) by automorphisms of Huber pairs over (A, A⁺), and morphisms out of (Â_∞, Â_∞⁺) into complete pairs
with bounded power-bounded subring are compatible families of morphisms out of the levels.

API: `levelPair`, `colimPair`, `colimPair_isUniform`, `completion`, `completion_eq_completion` (uniformization =
Hausdorff completion), `completion_plus_eq_closure`, `toCompletion`, `completionAction` (continuous action map
G × Â_∞ → Â_∞), `completion.lift`, `completion.lift_comp_toCompletion`, `completion.hom_ext`,
`completion_isTateRing`.

Unit tests: `completion_test_Qp` (for ℚ_p and a tower of Galois fields, (ℂ_p, 𝒪_{ℂ_p})), `completion_test_trivial`,
`completion_test_not_colim` (ℚ̄_p is not complete and 𝒪_{ℚ̄_p} is not closed: both completion steps are needed),
`completion_test_uniformization` (a non-uniform complete A gives the same completed tower as A^u),
`completion_test_lift`.

`AdicEtaleGeometry:A4/henselian-pairs-filtered-colimit` (lemma; Stacks 0FWT). A filtered colimit of henselian pairs is
henselian, in Mathlib's `HenselianRing` form (roots lifting simple roots modulo I).

`AdicEtaleGeometry:A4/finite-etale-invariance-along-tower` (lemma). For (A, A⁺) complete Tate and any tower:

```text
2-colim_i FÉt(A_i) ≅ FÉt(A_∞) ≅ FÉt(Â_∞),
2-colim_i FÉt(Map(G_i^k, A_i)) ≅ FÉt(C^0(G^k, Â_∞))      (k = 1, 2),
Â_∞ has no nonsplit finite étale covers.
```

Each A_i° is henselian along ϖ (A_i is complete; ClassicalAdicEtaleCohomology H1:henselian, or directly: A_i° is the
directed union of ϖ-adically complete rings of definition), so is colim A_i°, and the topologically henselian
comparison (Berkeley Theorem 7.4.8, requested from PerfectoidSpaces P3 without a base field) passes from A_∞ to its
completion; the first equivalence is A4.3's colimit lemma. These are the equivalences ECD's proof of Lemma 15.6 cites
from [Sch12, Lemma 7.5(i)].

`AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower` (lemma). With s(b) = (g ↦ b), t(b) = (g ↦ g·b) and
the face maps (d₀f)(g, h) = g·f(h), (d₁f)(g, h) = f(gh), (d₂f)(g, h) = f(g), finite étale A-algebras are equivalent
to finite étale Â_∞-algebras with descent data over C^0(G, Â_∞) satisfying the cocycle condition over
C^0(G × G, Â_∞) — equivalently, finite étale Â_∞-algebras with a continuous semilinear G-action. Descent data come
from a finite level (previous lemma) and are effective there by faithfully flat descent along A → A_i (Mathlib
`comonadicExtendScalars`, `Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`). This is the effectivity
of finite étale data along the tower that the stage asks for.

#### A4.6 Perfectoidness

`AdicEtaleGeometry:A4/root-of-monic-in-split-tate-ring` (lemma). Over a complete Tate ring R without nonsplit
covers, a monic P ∈ R°[X] with P′(x) = u(1 − τ) in R[X]/(P), u ∈ R^× and τ topologically nilpotent, has a root, and
all roots lie in R°: R[X]/(P) is complete and free, 1 − τ is a unit (Tau Ceti `IsTopologicallyNilpotent.isUnit_one_sub`),
so (P, 1) is a standard étale pair and the free algebra of rank ≥ 1 has a section.

`AdicEtaleGeometry:A4/pseudouniformizer-dividing-p` (lemma). For a pseudouniformizer ϖ₀ and n with p^n ∈ ϖ₀R° and
p^{n−1} > n, a root ϖ of X^{p^n} − ϖ₀X − ϖ₀ is a pseudouniformizer with ϖ^{p^n} = ϖ₀(1 + ϖ), 1 + ϖ ∈ (R°)^×,
ϖ^p | p in R° and p/ϖ^p topologically nilpotent. (Here τ = (p^n/ϖ₀)x^{p^n−1} is topologically nilpotent because
x^{p^n} ∈ ϖ₀·B°; from p^n = ϖ^{p^n}w, (p/ϖ^p)^n = ϖ^{p^n−pn}w.)

`AdicEtaleGeometry:A4/frobenius-surjective-for-split-tate-ring` (lemma). If ϖ^p | p and p/ϖ^p is topologically
nilpotent, every f ∈ R° satisfies f = x^p − ϖ^px for some x ∈ R°, so Φ : R°/ϖ → R°/ϖ^p is surjective. The second
hypothesis is what makes P′ = −ϖ^p(1 − (p/ϖ^p)x^{p−1}) invertible; without it the algebra need not be étale (AdicEtaleGeometry/E20).

`AdicEtaleGeometry:A4/split-tate-ring-is-perfectoid` (lemma). A complete uniform Tate ring in which p is topologically
nilpotent and which has no nonsplit finite étale covers is perfectoid (injectivity of Φ is automatic, ECD Remark 3.2).
ℚ̄_p (split, not complete) and ℂ_p⟨T⟩ (complete, uniform, not split) show that no hypothesis can be dropped.

`AdicEtaleGeometry:A4/perfectoid-uniform-completion` (theorem; planet "Perfectoid uniform completion"). For (A, A⁺)
with A a complete Tate ℤ_p-algebra and any finite étale torsor tower, Â_∞ is perfectoid; so (Â_∞, Â_∞⁺) is a
perfectoid pair with a continuous action of G. The pseudouniformizer may be chosen as a root of X^{p^n} − ϖ₀X − ϖ₀
with ϖ₀ ∈ A. For the non-complete ℚ_p[T] every tower has colimit B[T] with B ind-finite-étale over ℚ_p, whose uniform
completion B̂⟨T⟩ is not perfectoid: completeness of A is necessary.

#### A4.7 Adic spectra of the tower

`AdicEtaleGeometry:A4/torsor-spa-orbits` (lemma). For a finite étale G-torsor A → B of complete Tate pairs,
Spa(B, B⁺) → Spa(A, A⁺) is continuous, spectral, open and surjective with fibres the G-orbits, so
|Spa(B, B⁺)|/G ≅ |Spa(A, A⁺)|; preimages of rational subsets are rational (Tau Ceti `spaComap_preimage_rationalSubset`).
Fibres are orbits because B ⊗_A B = B ⊗̂_A B ≅ ∏_G B and Huber's valuation argument (1994, Lemma 3.9(i)) puts a point of
Spa(B ⊗̂_A B) over any two points with the same image.

`AdicEtaleGeometry:A4/spa-of-completed-tower` (lemma). |Spa(Â_∞, Â_∞⁺)| ≅ lim_i |Spa(A_i, A_i⁺)| (valuations on a
colimit are compatible families; for valuations bounded by 1 on the plus ring, continuity means v(ϖ) cofinal in the
value group, which is the union of those of the restrictions; rational subsets come from a finite level), and
Spa(Â_∞, Â_∞⁺) → Spa(A, A⁺) is open, surjective and spectral with fibres the G-orbits, whence
|Spa(Â_∞, Â_∞⁺)|/G ≅ |Spa(A, A⁺)| — the topological identification of ECD Proposition 15.4, with no sheafiness.

`AdicEtaleGeometry:A4/completed-tower-self-product` (lemma). The uniform completed tensor product
Â_∞ ⊗̂ᵘ_A Â_∞ (R0) is (C^0(G, Â_∞), C^0(G, Â_∞⁺)) via b ⊗ b′ ↦ (g ↦ b·g(b′)), and the (k+1)-fold power is
C^0(G^k, Â_∞); for A a Tate ℤ_p-algebra these are perfectoid, with |Spa C^0(G^k, Â_∞)| ≅ G^k × |Spa Â_∞| (P5's limits
of affinoid perfectoid spaces), s and t becoming (g, x) ↦ x and (g, x) ↦ g⁻¹·x. The uniformization is necessary:
ℂ_p ⊗̂_{ℚ_p} ℂ_p is not uniform.

#### A4.8 The perfectoid torsor presentation

`AdicEtaleGeometry:A4/perfectoid-cover-presentation` (construction; planet "Perfectoid torsor presentation"). The
structure `Huber.PerfectoidTorsorPresentation P` for a complete Tate ℤ_p-pair P = (A, A⁺): a profinite group G, a
complete perfectoid pair (Ã, Ã⁺) with a continuous action of G by pair automorphisms, and a G-invariant morphism
q : (A, A⁺) → (Ã, Ã⁺), such that

```text
(a) Ã ⊗̂ᵘ_A Ã ≅ (C^0(G, Ã), C^0(G, Ã⁺)),  b ⊗ b′ ↦ (g ↦ b·g(b′));
(b) Spa(q) : Spa(Ã, Ã⁺) → Spa(A, A⁺) is spectral, surjective and open with fibres the G-orbits,
    so |Spa(Ã, Ã⁺)|/G ≅ |Spa(A, A⁺)|.
```

The perfectoid cover is X̃ = Spa(Ã, Ã⁺); the induced perfectoid equivalence relation is R̃ = Spa(C^0(G, Ã)) ≅ G × X̃
with s, t, unit and composition of the action groupoid, all affinoid perfectoid. `ofTower` builds one from any tower
(A4.5–A4.7), so every complete Tate ℤ_p-pair has one (`exists`), and for these finite étale A-algebras are
G-descent data over Ã (`ofTower_finiteEtaleDescent`). The relation is an equivalence relation only as v-sheaves (D6):
on points, |R̃| → |X̃| ×_{|Spa A|} |X̃| is surjective, not injective.

API: `ofTower`, `exists`, `relation`, `relation_isPerfectoid`, `uniformCompletedTensorEquiv`, `spaQuotientHomeomorph`,
`spa_relation_homeomorph`, `isSpectralMap_spa`, `preimage_rationalSubset`, `ofTower_finiteEtaleDescent`,
`ofPerfectoid`.

Unit tests: `test_Qp` (G = Gal(ℚ̄_p/ℚ_p), Ã = ℂ_p, ℂ_p ⊗̂ᵘ_{ℚ_p} ℂ_p ≅ C^0(G, ℂ_p)), `test_perfectoid` (G = 1 for a
perfectoid pair), `test_relation_not_injective`, `test_pointwise_cover` (the disjoint union of all points of
Spa(ℚ_p⟨T⟩) maps surjectively on points but is not quasi-compact, so it is not a presentation — point-surjectivity
without the compactness condition gives no surjection of v-sheaves), `test_finite_level`
(|Spa(A_i, A_i⁺)| = |X̃|/ker(G → G_i)), `test_nonuniform` (A and A^u have the same presentations).

#### A4.9 The two records kept from the decomposition

`AdicEtaleGeometry:A4/spd-of-tate-huber-pair-and-perfectoid-torsor` (comparison). ECD 15.1–15.4 as a composite record.
A4's part is the existence of a perfectoid torsor presentation for every complete Tate ℤ_p-pair
(`Huber.Pair.exists_perfectoidTorsorPresentation`), with the tower, the perfectoid uniform completion, the
self-product and the topological identification as above. D6's part — Spd ℤ_p and Spd(A, A⁺) are v-sheaves
(Lemma 15.1), Spd of a perfectoid pair is its tilt (15.2), the torsors of v-sheaves, the spatial diamond and
|Spd(A, A⁺)| = |Spa(A, A⁺)| (15.4) — is `DiamondsAndVStacks:D6/spd-of-a-tate-pair`, `D6/untilt-descent-along-v-covers`
and `D6/spd-is-a-spatial-diamond`. For non-complete A the record applies to the completion (convention 9).

`AdicEtaleGeometry:A4/diamond-of-analytic-adic-space-and-etale-site-15-6` (comparison). ECD Definition 15.5 and
Lemma 15.6 are `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor` and `D6/etale-site-comparison`; this record proves
neither. It names A4's inputs to the affinoid case: |Spa A| = |X̃|/G, the finite étale invariance along the tower
including C^0(G, ·) and C^0(G × G, ·), and effective descent; the right-hand sides Y_fét, Y_ét are A1's sites
(Kedlaya–Liu 8.2.16–8.2.19, with 8.2.17(a) identifying FÉt(A) with finite étale maps to Spa(A, A⁺)~). Uses of
Lemma 15.6 elsewhere (AdicCoefficientsAndComparisons L3 and L4, ECD Propositions 27.2 and 27.5) take it from D6.

#### Acceptance tests for the stage

- For (ℚ_p, ℤ_p): the tower of finite Galois extensions, Â_∞ = ℂ_p, G = Gal(ℚ̄_p/ℚ_p), ℂ_p ⊗̂ᵘ_{ℚ_p} ℂ_p ≅ C^0(G, ℂ_p),
  |Spa ℂ_p|/G = |Spa ℚ_p|.
- For (ℚ_p⟨T⟩, ℤ_p⟨T⟩): Â_∞ is perfectoid (approximate p-power roots of T modulo ϖ^p exist in Â_∞°) although
  ℚ_p⟨T⟩ is not; the finite étale ℚ_p⟨T⟩-algebra ℚ_p⟨T⟩[X]/(X^p − X − T/p) splits over Â_∞.
- For the non-complete ℚ_p[T]: finite étale algebras change under uniformization and no torsor tower over ℚ_p[T] has a
  perfectoid uniform completion — A4's statements require completeness.
- For a perfectoid pair: the trivial presentation.
- The pointwise cover by all completed residue fields is excluded by the quasi-compactness clause.

#### Corrections to the sources

- **AdicEtaleGeometry/E19 (ECD v4, Lemma 15.3, p. 90).** "If A is a Tate ℤ_p-algebra, then the uniform completion Â_∞ of A_∞ is
  perfectoid" is false without completeness (Tate rings in ECD §3 need not be complete): for A = ℚ_p[T] every tower
  has colimit B[T] and uniform completion B̂⟨T⟩, which is not perfectoid. The proof's step "this determines a finite
  étale R-algebra, and so it admits a solution" needs FÉt(A_∞) ≅ FÉt(Â_∞), which holds when A is complete. The
  same statement is Berkeley Lemma 10.1.6. A4 states the lemma for complete A; the Spd conclusions of
  Proposition 15.4 survive by passing to the completion.
- **AdicEtaleGeometry/E20 (ECD v4, proof of Lemma 15.3, Frobenius step).** x^p − ϖ^px − f is finite étale only if p/ϖ^p is
  topologically nilpotent: for ϖ = p^{1/p} in the completion of ℚ_p(p^{1/p^∞}) and f = 1 − p, x^p − px + p − 1 has
  the double root 1. The Berkeley lectures' proof of Lemma 10.1.6 already chooses the exponent so that p/ϖ^p is
  topologically nilpotent; A4 does the same (p^{n−1} > n).

#### Requests and recorded gaps

- PerfectoidSpaces P3: state `P3/henselian-finite-etale-approximation` for Tate rings without a base field
  (Berkeley Theorem 7.4.8: FÉt(A) ≅ FÉt(Â) when a ring of definition is henselian along a pseudouniformizer, and its
  corollary for filtered colimits of complete Tate rings).
- AdicEtaleGeometry A1: the Huber pair of a finite étale algebra over an arbitrary complete Tate pair (natural
  topology, integral plus ring, functoriality, group actions), and the finite étale and étale sites of generalized
  adic spaces with Kedlaya–Liu 8.2.17(a).
- ClassicalAdicEtaleCohomology H1:henselian: the clause "complete f-adic rings are henselian" as a separately citable
  statement, with a proof independent of Huber's book in the Tate case.
- Gaps: Gabber–Ramero's henselian comparison is quoted, not read (Kedlaya–Liu 2.8.16 covers the uniformization case
  inside a read source); Kedlaya–Liu 8.2.17(b) rests on de Jong–van der Put 3.1.7, not read.

Sources: Scholze, *Étale cohomology of diamonds* (arXiv v4, 14 April 2026), §3 and §15; Scholze–Weinstein, *Berkeley
lectures* (2020), Theorem 7.4.8 and Lemmas 10.1.6–10.1.7; Kedlaya–Liu, *Relative p-adic Hodge theory: Foundations*,
§§1.2–1.4, 2.6, 2.8, 8.2, 9.1; Scholze, *Perfectoid spaces*, Proposition 7.4 and Lemma 7.5; Huber 1994, Lemma 3.9;
the Stacks project, Tags 0FWT, 0ALJ, 0BN2.

## Declaration index

Every declaration of the roadmap, layer by layer: its identifier, kind and planet, its prerequisites, and the names of its API items and unit tests (the names the suggested Lean file uses). The layer sections above state each item; an item they do not present is stated here.

### A0. Completed tensor products and the fibre products actually used

- **A0 supplier contract: the completed tensor product of AdicSpacesPartII R0 is the pushout of complete Huber pairs, with its topology, plus ring and affinoid fibre products** — `AdicEtaleGeometry:A0/supplier-contract-fibre-products` (comparison)
  - prerequisites: `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/completed-tensor-product-universal-property`, `AdicSpacesPartII:R0/affinoid-fibre-product`, `AdicSpacesPartII:R0/fibre-products-existence`, `AdicSpacesPartII:R0/adic-ring-homomorphism`, `AdicSpacesPartII:R0/completed-tensor-noetherian-stability`, `AdicSpacesPartII:R0/uniform-completed-tensor-product`, `mathlib:CategoryTheory.IsPushout`, `mathlib:integralClosure`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.Pair.Hom`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`
- **Uniformization supplied separately: the uniform completed tensor product is the pushout among uniform complete Tate pairs** — `AdicEtaleGeometry:A0/uniformization-contract` (comparison)
  - prerequisites: `AdicSpacesPartII:R0/uniform-completed-tensor-product`, `AdicSpacesPartII:R0/uniformization`, `AdicSpacesPartII:R0/spectral-topology-cont-eq`, `AdicEtaleGeometry:A0/supplier-contract-fibre-products`, `mathlib:CategoryTheory.IsPushout`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.IsTateRing`
- **Tracking rings of definition, pseudouniformisers and plus rings through the completed tensor product** — `AdicEtaleGeometry:A0/definition-data-and-plus-ring-tracking` (lemma)
  - prerequisites: `AdicSpacesPartII:R0/completed-tensor-product`, `AdicEtaleGeometry:A0/supplier-contract-fibre-products`, `tauceti:TauCeti.ValuationSpectrum.spa_antitone`, `tauceti:TauCeti.ValuationSpectrum.spa_integralClosure`, `tauceti:TauCeti.Huber.Pair.Hom.spaComap`, `tauceti:TauCeti.Huber.IsPseudoUniformizer`, `mathlib:integralClosure`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Pullback along a rational open immersion is restriction, computed by the completed tensor product with the rational localisation** — `AdicEtaleGeometry:A0/rational-pullback-comparison` (comparison)
  - prerequisites: `AdicSpacesPartII:R0/completed-tensor-rational-localisation`, `AdicSpacesPartII:R0/topologically-finite-type-is-adic`, `AdicSpacesPartII:R0/adic-ring-homomorphism`, `AdicSpacesPartII:R0/fibre-product-along-finite-type`, `AdicEtaleGeometry:A0/supplier-contract-fibre-products`, `tauceti:TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.spaLocalizationHomeomorph`, `tauceti:TauCeti.Huber.PairOfDefinition.completionLocalization`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Pullback along a finite étale map is computed by the uncompleted tensor product** — `AdicEtaleGeometry:A0/finite-etale-pullback-comparison` (comparison)
  - prerequisites: `AdicSpacesPartII:R0/finite-huber-pair-hom`, `AdicSpacesPartII:R0/finite-algebra-tensor-complete`, `AdicSpacesPartII:R0/finite-algebra-over-affinoid`, `AdicEtaleGeometry:A0/supplier-contract-fibre-products`, `AdicEtaleGeometry:A0/rational-pullback-comparison`, `mathlib:Algebra.Etale`, `mathlib:Algebra.Smooth.flat`, `mathlib:Module.FinitePresentation.of_finite_of_finitePresentation`, `mathlib:Module.Flat.projective_of_finitePresentation`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Module.Finite.base_change`
- **Chart independence: every affinoid chart of the glued fibre product is the completed tensor product of the charts below it** — `AdicEtaleGeometry:A0/fibre-product-affinoid-chart-comparison` (comparison)
  - prerequisites: `AdicSpacesPartII:R0/fibre-products-existence`, `AdicSpacesPartII:R0/affinoid-fibre-product`, `AdicSpacesPartII:R0/completed-tensor-rational-localisation`, `AdicSpacesPartII:R0/completed-tensor-restricted-power-series`, `AdicEtaleGeometry:A0/supplier-contract-fibre-products`, `mathlib:CategoryTheory.IsPullback`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Associativity, symmetry and unit isomorphisms of fibre products, and their affinoid formulas** — `AdicEtaleGeometry:A0/fibre-product-associativity-and-unit` (comparison)
  - prerequisites: `AdicSpacesPartII:R0/fibre-products-existence`, `AdicSpacesPartII:R0/base-change-stability`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicEtaleGeometry:A0/supplier-contract-fibre-products`, `AdicEtaleGeometry:A0/fibre-product-affinoid-chart-comparison`, `mathlib:CategoryTheory.Limits.pullbackAssoc`, `mathlib:CategoryTheory.Limits.pullbackSymmetry`, `mathlib:CategoryTheory.IsPullback.of_id_snd`, `mathlib:CategoryTheory.IsPushout.paste_horiz`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **The analytic locus X_a of an adic space: open adic subspace, Tate charts, and restriction of adic morphisms** — `AdicEtaleGeometry:A0/analytic-locus-restriction` (construction) — planet *Analytic locus of an adic space*
  - prerequisites: `AdicSpacesPartII:R0/adic-morphism`, `AdicSpacesPartII:R0/adic-iff-analytic-locus`, `AdicSpacesPartII:R0/base-change-stability`, `AdicSpacesPartII:R0/fibre-products-existence`, `AdicEtaleGeometry:A0/rational-pullback-comparison`, `tauceti:TauCeti.ValuationSpectrum.IsAnalyticPoint`, `tauceti:TauCeti.ValuationSpectrum.spaAnalytic`, `tauceti:TauCeti.ValuationSpectrum.isOpen_val_preimage_spaAnalytic`, `tauceti:TauCeti.ValuationSpectrum.isCompact_val_preimage_spaAnalytic`, `tauceti:TauCeti.ValuationSpectrum.spaAnalytic_eq_biUnion_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.isTateRing_completion_locTopology_of_mem_generators`, `tauceti:TauCeti.ValuationSpectrum.spaAnalytic_eq_spa_of_isTateRing`, `tauceti:TauCeti.ValuationSpectrum.spaAnalytic_eq_empty_iff_discrete_separationQuotient`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.analyticLocus`; `AdicSpace.analyticLocus.ι`; `AdicSpace.mem_analyticLocus_iff`; `AdicSpace.IsAnalytic`; `AdicSpace.IsAnalytic.isIso_ι`; `AdicSpace.analyticLocus_inf_open`; `AdicSpace.analyticLocus_spa`; `AdicSpace.analyticLocus_spa_eq_iUnion_tateCharts`; `AdicSpace.analyticLocus_eq_top_of_isTateRing`; `AdicSpace.analyticLocus_spa_eq_bot_iff`; `AdicSpace.IsAdic.analyticLocusMap`; `AdicSpace.analyticLocus.lift`; `AdicSpace.isAdic_iff_image_analyticLocus`; `AdicSpace.analyticLocus_pullback`; `AdicSpace.analyticLocus_isAnalytic`
  - unit tests: `analyticLocus_test_powerSeries`; `analyticLocus_test_witt`; `analyticLocus_test_discrete`; `analyticLocus_test_nonAdic`; `analyticLocus_test_spaAnalytic`; `analyticLocus_test_ainf`

### A1. Finite étale and étale geometry

- **Strongly sheafy Tate rings and locally strongly sheafy analytic adic spaces** — `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair` (definition)
  - prerequisites: `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.restrictedMvPowerSeriesCompletion`, `tauceti:TauCeti.Huber.IsStronglyNoetherian`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `AdicSpacesPartII:R0/noetherian-type-huber-ring`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `AdicSpacesPartII:R3/sheafy-cech-acyclicity`, `mathlib:CategoryTheory.Sheaf.H`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-4-sheafiness-and-tate-acyclicity`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `Huber.IsStronglySheafy`; `Huber.IsStronglySheafy.isSheafyRing` (projection: IsStronglySheafy A → Huber.IsSheafyRing A.); `Huber.IsStronglySheafy.restrictedMvPowerSeries` (instance: IsStronglySheafy A → IsStronglySheafy A⟨S_1, …, S_m⟩.); `Huber.IsStronglySheafy.rationalLocalization` (instance: Rational localisations of strongly sheafy rings are strongly sheafy.); `Huber.IsStronglySheafy.of_rationalCover` (characterisation: A sheafy, with a finite rational covering by strongly sheafy rings ⇒ A strongly sheafy.); `Huber.IsStronglySheafy.of_isStronglyNoetherian` (instance: Complete strongly noetherian Tate rings are strongly sheafy.); `Huber.IsStronglySheafy.of_isStablySheafyRing` (compatibility: Stably sheafy (anchor) complete Tate rings are strongly sheafy.); `AdicSpace.IsLocallyStronglySheafy`; `AdicSpace.IsLocallyStronglySheafy.isStronglySheafy_of_isAffinoidOpen` (characterisation: Every open affinoid Spa(A, A⁺) ⊆ X has A strongly sheafy.); `AdicSpace.IsLocallyStronglySheafy.restrict` (instance: Open subspaces of a locally strongly sheafy space are locally strongly sheafy.); `AdicSpace.IsLocallyStronglySheafy.of_isLocallyNoetherian` (instance: Locally noetherian analytic adic spaces are locally strongly sheafy.)
  - unit tests: `Huber.IsStronglySheafy.test_tateAlgebra` (computation: For K a complete nonarchimedean field and m ≥ 0, Huber.IsStronglySheafy (K⟨T_1, …, T_m⟩).); `Huber.IsStronglySheafy.test_field` (degenerate: A complete nonarchimedean field K (as a Tate ring) is strongly sheafy, and Spa(K, K⁺) is locally strongly sheafy for every open valuation subring K⁺.); `Huber.IsStronglySheafy.test_not_of_uniform` (non-example: There is a complete uniform Tate ring A (Buzzard–Verberkmoes) with ¬ Huber.IsStronglySheafy A; so 'uniform' cannot replace 'strongly sheafy'.); `Huber.IsStronglySheafy.test_of_isStablySheafyRing` (compatibility: For a complete Tate ring A, Huber.IsStablySheafyRing A → Huber.IsStronglySheafy A (anchor notion).)
- **The complete Huber pair of a finite étale algebra over a complete Tate pair** — `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra` (construction)
  - prerequisites: `AdicSpacesPartII:R0/finite-huber-pair-hom`, `AdicSpacesPartII:R0/finite-algebra-tensor-complete`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/finite-algebra-over-affinoid`, `AdicSpacesPartII:R0/finite-etale-algebra-comparison`, `AdicEtaleGeometry:A0/finite-etale-pullback-comparison`, `mathlib:Algebra.Etale`, `mathlib:Module.Finite`, `mathlib:Module.Projective`, `mathlib:moduleTopology`, `mathlib:IsModuleTopology`, `mathlib:IsModuleTopology.continuous_of_linearMap`, `mathlib:integralClosure`, `mathlib:CommAlgCat.FiniteEtale`, `mathlib:Algebra.Etale.baseChange`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.Pair.Hom`, `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.IsTateRing.isModuleTopology`, `tauceti:TauCeti.completeSpace_moduleTopology`, `tauceti:TauCeti.Huber.Pair.isRingOfIntegralElements_integralClosure`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.spaComap`, `tauceti:TauCeti.ValuationSpectrum.continuous_spaComap`, `tauceti:TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`
  - API: `Huber.Pair.finiteEtale`; `Huber.Pair.finiteEtale_plus` (simp: (finiteEtale A⁺ B).plus = integral closure of the image of A⁺ in B.); `Huber.FiniteEtale.isModuleTopology`; `Huber.Pair.finiteEtale.hom` (data: The morphism of Huber pairs ι: (A, A⁺) → finiteEtale A⁺ B.); `Huber.Pair.finiteEtale.hom_isFinite` (compatibility: ι is a finite morphism of Huber pairs (R0 `Huber.Pair.Hom.IsFinite`).); `Huber.Pair.finiteEtale.homEquiv` (universal-property: Morphisms finiteEtale A⁺ B → (D, D⁺) under (A, A⁺) ≃ A-algebra maps B → D.); `Huber.Pair.finiteEtaleFunctor`; `Huber.Pair.finiteEtale.baseChangeIso` (compatibility: finiteEtale C⁺ (C ⊗_A B) ≅ C ⊗̂_A (finiteEtale A⁺ B), with C ⊗_A B → C ⊗̂_A B a topological isomorphism.); `Huber.Pair.finiteEtale.spaComap_preimage_rationalSubset` (compatibility: Spa(ι)⁻¹ R(f/g) = R(ι f/ι g).); `Huber.Pair.finiteEtale.rationalLocalizationIso` (compatibility: O(R(f/g)) ⊗_A B ≅ B⟨ι f/ι g⟩ as topological rings, with plus rings.); `Huber.Pair.finiteEtale.spaComap_surjective` (other: If B is faithfully flat over A, Spa(ι) is surjective.); `Huber.Pair.finiteEtale.eq_finiteAlgebra` (compatibility: For A strongly noetherian or with a noetherian ring of definition, the pair agrees with R0's finiteAlgebra.)
  - unit tests: `Huber.Pair.finiteEtale_test_split` (degenerate: For B = A × A: finiteEtale A⁺ B has plus ring A⁺ × A⁺, and spa of it is the disjoint union of two copies of spa A⁺ (via the two idempotents).); `Huber.Pair.finiteEtale_test_plus_not_powerBounded` (non-example: For (K, K⁺) a complete nonarchimedean field with K⁺ ⊊ O_K of rank 2 and B = K × K: the plus ring is K⁺ × K⁺, not B° = O_K × O_K; with B° the map Spa(B, B°) → Spa(K, K⁺) would miss the closed point.); `Huber.Pair.finiteEtale_test_kummer_annulus` (computation: A = K⟨T, T⁻¹⟩ (p odd), B = A[S]/(S² − T): B is an integral domain and B ⊗_A A⟨(T − 1)/p⟩ ≅ A⟨(T − 1)/p⟩ × A⟨(T − 1)/p⟩.); `Huber.Pair.finiteEtale_test_eq_finiteAlgebra` (compatibility: If A is strongly noetherian, finiteEtale A⁺ B = Huber.Pair.finiteAlgebra A⁺ B (AdicSpacesPartII:R0/finite-algebra-over-affinoid).); `Huber.Pair.finiteEtale_test_quotient_not_projective` (non-example: For a complete Tate A and a non-closed ideal J (possible when A is not noetherian), the finite A-algebra A/J is not étale and its natural topology is not Hausdorff: projectivity is what makes the construction work.)
- **Finite étale algebras over strongly sheafy Tate rings are strongly sheafy** — `AdicEtaleGeometry:A1/finite-etale-strongly-sheafy` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicSpacesPartII:R3/sheafy-cech-acyclicity`, `AdicSpacesPartII:R0/noetherian-type-huber-ring`, `mathlib:Algebra.Etale`, `mathlib:Module.Projective`, `tauceti:TauCeti.Huber.IsStronglyNoetherian`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`
- **Rational coverings are effective descent morphisms for finite étale algebras** — `AdicEtaleGeometry:A1/finite-etale-rational-descent` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/affinoid-system-approximation`, `AdicEtaleGeometry:A1/finite-etale-approximation`, `AdicSpacesPartII:R3/tate-kiehl-affinoid`, `AdicSpacesPartII:R0/noetherian-rod-sheafy`, `mathlib:Algebra.Etale`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`, `tauceti:TauCeti.ValuationSpectrum.faithfullyFlat_pi_toCompletionLoc`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`
- **Complete Tate pairs are completed direct limits of noetherian affinoid pairs** — `AdicEtaleGeometry:A1/affinoid-system-approximation` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicSpacesPartII:R0/noetherian-type-huber-ring`, `AdicSpacesPartII:R0/valuation-amalgamation`, `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.Pair.isRingOfIntegralElements_integralClosure`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.spa_integralClosure`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`
- **Finite étale algebras over a complete Tate ring are defined at a finite stage of an affinoid system** — `AdicEtaleGeometry:A1/finite-etale-approximation` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/affinoid-system-approximation`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicSpacesPartII:R3/tate-kiehl-affinoid`, `mathlib:Algebra.Etale`, `mathlib:CommAlgCat.FiniteEtale`, `mathlib:HenselianLocalRing`
- **Finite étale morphisms of analytic adic spaces by the local algebraic description** — `AdicEtaleGeometry:A1/finite-etale-morphism` (definition) — planet *Finite étale morphism*
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicSpacesPartII:R0/adic-morphism`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.IsFiniteEtale`; `AdicSpace.IsFiniteEtale.spa` (constructor: Spa(finiteEtale A⁺ B) → Spa(A, A⁺) is finite étale when the pair is sheafy.); `AdicSpace.IsFiniteEtale.id` (instance: Isomorphisms are finite étale.); `AdicSpace.IsFiniteEtale.of_openCover` (characterisation: Finite étale is local on the target.); `AdicSpace.IsFiniteEtale.isAffinoid_preimage` (characterisation: Over an open affinoid with strongly sheafy ring the preimage is affinoid and finite étale (AdicEtaleGeometry:A1/finite-etale-local-to-global).); `AdicSpace.IsFiniteEtale.isFinite` (compatibility: Finite étale morphisms are finite (AdicSpacesPartII:R0/finite-morphism).); `AdicSpace.IsFiniteEtale.isEtaleLocalDescription` (relation: Finite étale morphisms are étale in A1's sense.); `AdicSpace.IsFiniteEtale.comp` (other: Composites (AdicEtaleGeometry:A1/etale-composition).); `AdicSpace.IsFiniteEtale.baseChange` (other: Base change (AdicEtaleGeometry:A1/etale-base-change).); `AdicSpace.IsFiniteEtale.of_comp` (other: Morphisms between finite étale X-spaces are finite étale (AdicEtaleGeometry:A1/etale-cancellation).); `AdicSpace.IsFiniteEtale.surjective_iff` (characterisation: f is surjective iff its degree is everywhere positive iff each O_Y(f⁻¹V) is faithfully flat over O_X(V).); `AdicSpace.IsFiniteEtale.iff_isFinite_and_etale` (compatibility: On locally noetherian X: finite étale ⇔ finite and Huber-étale (KEEP comparison node).)
  - unit tests: `AdicSpace.IsFiniteEtale.test_fold` (degenerate: For any analytic adic space X, the fold map X ⊔ X → X is finite étale, and ∅ → X is finite étale.); `AdicSpace.IsFiniteEtale.test_rational_inclusion` (non-example: The inclusion of the rational subset {|T| ≤ |p|} into the closed unit disc over ℚ_p is étale but not finite étale: the preimage of the disc is not finite over it (its image is not closed).); `AdicSpace.IsFiniteEtale.test_squaring` (non-example: Spa(K⟨S⟩) → Spa(K⟨T⟩), T ↦ S², is finite (AdicSpacesPartII:R0/finite-morphism) but not finite étale.); `AdicSpace.IsFiniteEtale.test_plus_ring` (non-example: For (K, K⁺) with K⁺ ⊊ O_K of rank 2, Spa(K × K, O_K × O_K) → Spa(K, K⁺) is not finite étale, although K → K × K is a finite étale ring map.); `AdicSpace.IsFiniteEtale.test_huber` (compatibility: For X locally noetherian: IsFiniteEtale f ↔ AdicSpace.IsFinite f ∧ AdicSpace.Etale f (R0 notions).)
- **Local-to-global recognition of finite étale morphisms over strongly sheafy affinoids** — `AdicEtaleGeometry:A1/finite-etale-local-to-global` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/finite-etale-strongly-sheafy`, `AdicEtaleGeometry:A1/finite-etale-rational-descent`, `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `AdicSpacesPartII:R0/finite-morphism`, `AdicSpacesPartII:R0/finite-huber-pair-hom`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Étale morphisms of analytic adic spaces by the local open-immersion/finite-étale description** — `AdicEtaleGeometry:A1/etale-morphism` (definition)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.IsEtaleLocalDescription`; `AdicSpace.IsEtaleLocalDescription.of_isOpenImmersion` (instance: Open immersions are étale.); `AdicSpace.IsEtaleLocalDescription.of_isFiniteEtale` (instance: Finite étale morphisms are étale.); `AdicSpace.IsEtaleLocalDescription.exists_standardAffinoid` (characterisation: Locally f is Spa(C) ⊆ Spa(B) → Spa(A) ⊆ X with A → B finite étale and B → C rational.); `AdicSpace.IsEtaleLocalDescription.of_openCover_source` (characterisation: Étale is local on the source.); `AdicSpace.IsEtaleLocalDescription.of_openCover_target` (characterisation: Étale is local on the target.); `AdicSpace.IsEtaleLocalDescription.comp` (other: Composites of étale maps (AdicEtaleGeometry:A1/etale-composition).); `AdicSpace.IsEtaleLocalDescription.baseChange` (other: Base change (AdicEtaleGeometry:A1/etale-base-change).); `AdicSpace.IsEtaleLocalDescription.of_comp` (other: Cancellation (AdicEtaleGeometry:A1/etale-cancellation).); `AdicSpace.IsEtaleLocalDescription.isOpenMap` (other: Étale maps are open (AdicEtaleGeometry:A1/etale-open-map).); `AdicSpace.IsEtaleLocalDescription.isOpenImmersion_diagonal` (other: The diagonal is an open immersion (AdicEtaleGeometry:A1/etale-diagonal).); `AdicSpace.IsEtaleLocalDescription.iff_etale` (compatibility: On locally noetherian analytic spaces: ⇔ AdicSpace.Etale (KEEP comparison node).)
  - unit tests: `AdicSpace.IsEtaleLocalDescription.test_openImmersion` (degenerate: Every open immersion, in particular the inclusion of a rational subset, is étale; the identity is étale.); `AdicSpace.IsEtaleLocalDescription.test_origin` (non-example: The closed immersion Spa(K, K°) → Spa(K⟨T⟩, K°⟨T⟩) at T = 0 is finite and unramified but not étale; so 'unramified' is not a substitute.); `AdicSpace.IsEtaleLocalDescription.test_nonseparated` (characterisation: Two copies of the closed unit disc glued along {|p| ≤ |T|} map étale to the disc; the map is not separated, so étale does not include separatedness.); `AdicSpace.IsEtaleLocalDescription.test_huber` (compatibility: For X, Y locally noetherian analytic: IsEtaleLocalDescription f ↔ AdicSpace.Etale f (Huber 1.6.5 via R0).)
- **Comparison of A1's finite étale and étale morphisms with Huber's on locally noetherian analytic adic spaces** — `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison` (comparison)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicEtaleGeometry:A1/etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/finite-etale-strongly-sheafy`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `AdicSpacesPartII:R0/noetherian-type-huber-ring`, `AdicSpacesPartII:R0/finite-morphism`, `AdicSpacesPartII:R0/finite-algebra-over-affinoid`, `AdicSpacesPartII:R0/finite-etale-algebra-comparison`, `AdicSpacesPartII:R0/differentials-unramified-smooth-etale`, `AdicSpacesPartII:R0/open-embedding-etale`, `AdicSpacesPartII:R0/etale-smooth-composition`, `AdicSpacesPartII:R0/etale-smooth-locality`, `AdicSpacesPartII:R0/etale-smooth-cancellation`, `AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation`, `AdicSpacesPartII:R0/etale-affinoid-finite-etale-embedding`, `AdicSpacesPartII:R0/etale-local-structure`, `AdicSpacesPartII:R0/etale-flat-unramified`, `AdicSpacesPartII:R0/smooth-morphism-open`, `AdicSpacesPartII:R0/unramified-locally-quasi-finite`
- **Base change of finite étale and étale morphisms along morphisms of locally strongly sheafy spaces** — `AdicEtaleGeometry:A1/etale-base-change` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicEtaleGeometry:A1/etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/finite-etale-strongly-sheafy`, `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `AdicSpacesPartII:R0/affinoid-fibre-product`, `AdicSpacesPartII:R0/completed-tensor-product-universal-property`, `AdicSpacesPartII:R0/valuation-amalgamation`, `AdicEtaleGeometry:A0/finite-etale-pullback-comparison`, `AdicEtaleGeometry:A0/rational-pullback-comparison`, `mathlib:Algebra.Etale.baseChange`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Composites of finite étale, resp. étale, morphisms** — `AdicEtaleGeometry:A1/etale-composition` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicEtaleGeometry:A1/etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-local-to-global`, `AdicEtaleGeometry:A1/finite-etale-strongly-sheafy`, `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `AdicEtaleGeometry:A1/affinoid-system-approximation`, `AdicEtaleGeometry:A1/finite-etale-approximation`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicSpacesPartII:R0/etale-smooth-composition`, `AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation`, `mathlib:Algebra.Etale.comp`, `mathlib:Module.Finite.trans`, `mathlib:integralClosure`
- **The diagonal of an étale morphism is an open immersion; of a finite étale morphism, open and closed** — `AdicEtaleGeometry:A1/etale-diagonal` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/finite-etale-local-to-global`, `mathlib:Algebra.FormallyUnramified.iff_exists_tensorProduct`, `mathlib:Algebra.TensorProduct.lmul'`, `AdicSpacesPartII:R0/infinitesimal-criteria`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Morphisms between étale (resp. finite étale) objects are étale (resp. finite étale)** — `AdicEtaleGeometry:A1/etale-cancellation` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicEtaleGeometry:A1/etale-diagonal`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-composition`, `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Étale morphisms are open; quasi-compact étale maps factor through their open images** — `AdicEtaleGeometry:A1/etale-open-map` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicEtaleGeometry:A1/affinoid-system-approximation`, `AdicEtaleGeometry:A1/finite-etale-approximation`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`, `AdicSpacesPartII:R0/smooth-morphism-open`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **The small étale site of a locally strongly sheafy analytic adic space** — `AdicEtaleGeometry:A1/etale-site` (construction) — planet *Étale site*
  - prerequisites: `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `AdicEtaleGeometry:A1/etale-morphism`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-composition`, `AdicEtaleGeometry:A1/etale-diagonal`, `AdicEtaleGeometry:A1/etale-cancellation`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`, `mathlib:Opens.grothendieckTopology`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:CategoryTheory.MorphismProperty.Over`, `mathlib:CategoryTheory.Pretopology`, `mathlib:CategoryTheory.Pretopology.toGrothendieck`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.smallEtale`; `AdicSpace.smallEtale.mk` (constructor: An object from an étale morphism U → X.); `AdicSpace.smallEtale.forget` (projection: Fully faithful forgetful functor Et/X ⥤ Over X.); `AdicSpace.smallEtale.hasFiniteLimits` (instance: Et/X has finite limits (final object, fibre products, equalisers).); `AdicSpace.smallEtalePretopology` (constructor: The pretopology of jointly surjective families.); `AdicSpace.smallEtaleTopology`; `AdicSpace.ofArrows_mem_smallEtaleTopology_iff` (characterisation: Sieve.ofArrows f is covering iff ⋃ range |f_i| = |U|.); `AdicSpace.smallEtale.map` (functoriality: Base change functor g^*: Et/X ⥤ Et/X' for g: X' → X, continuous.); `AdicSpace.etaleSheafPushforward` (functoriality: g_*: Sh(X'_ét) ⥤ Sh(X_ét), (g_*F)(U) = F(U ×_X X').); `AdicSpace.etaleSheafPullback` (functoriality: g^{-1} = sheafPullback, left adjoint of g_*.); `AdicSpace.smallEtale.mapComp` (functoriality: (h ∘ g)^* ≅ g^* ∘ h^* and id^* ≅ id, coherent.); `AdicSpace.opensToSmallEtale` (compatibility: The continuous functor Opens X ⥤ Et/X inducing λ_X: X_ét → X_an.); `AdicSpace.smallEtaleTopology_eq_huber` (compatibility: On locally noetherian X: equal to Huber's étale topology (KEEP comparison node).); `AdicSpace.structureSheafEtale` (other: O_{X_ét} and O⁺_{X_ét} (AdicEtaleGeometry:A1/etale-structure-sheaf).)
  - unit tests: `AdicSpace.smallEtaleTopology.test_kummer_cover` (computation: For X the annulus over K ⊇ ℚ_p (p odd), the Kummer map Spa(K⟨S, S⁻¹⟩) → X is a covering, and so is the two-member rational covering {|T − 1| ≤ |p|}, {|T − 1| ≥ |p|}.); `AdicSpace.smallEtaleTopology.test_rank_one_not_enough` (non-example: For X = Spa(K, K⁺) with K⁺ of rank 2, the family ({η} → X) hits all rank-one points but is not a covering: coverings must be surjective on higher-rank points too.); `AdicSpace.smallEtaleTopology.test_geometric_point` (degenerate: For X = Spa(C, C⁺) with C algebraically closed, every covering of X contains a member admitting a section (AdicEtaleGeometry:A1/geometric-point-etale-split).); `AdicSpace.smallEtaleTopology.test_huber` (compatibility: For X locally noetherian, smallEtaleTopology X is Huber's étale topology on Et/X, i.e. R4's `AdicSpace.etaleTopology X`.); `AdicSpace.smallEtaleTopology.test_opens` (characterisation: A family of open immersions U_i ⊆ U is a covering of U in X_ét iff it is an open covering of U.)
- **The small finite étale site** — `AdicEtaleGeometry:A1/finite-etale-site` (construction)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-local-to-global`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-diagonal`, `AdicEtaleGeometry:A1/etale-cancellation`, `AdicEtaleGeometry:A1/etale-composition`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `mathlib:CommAlgCat.FiniteEtale`, `mathlib:CategoryTheory.MorphismProperty.Over`, `mathlib:CategoryTheory.Pretopology`, `mathlib:CategoryTheory.Pretopology.toGrothendieck`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.smallFiniteEtale`; `AdicSpace.smallFiniteEtaleTopology` (structure: The topology of jointly surjective families on X_fét.); `AdicSpace.ofArrows_mem_smallFiniteEtaleTopology_iff` (characterisation: Covering iff jointly surjective.); `AdicSpace.smallFiniteEtale.hasFiniteLimits` (instance: Finite limits, finite coproducts, initial object.); `AdicSpace.smallFiniteEtale.toSmallEtale` (compatibility: Fully faithful, continuous, finite-limit-preserving inclusion X_fét ⥤ X_ét.); `AdicSpace.smallFiniteEtale.affinoidEquiv` (equivalence: smallFiniteEtale (Spa A) ≌ (CommAlgCat.FiniteEtale A)ᵒᵖ.); `AdicSpace.smallFiniteEtale.map` (functoriality: Base change functor for g: X' → X, continuous, compatible with toSmallEtale.); `AdicSpace.smallFiniteEtale.fiberFunctor` (data: For a geometric point ξ, F_ξ: X_fét ⥤ FintypeCat (AdicEtaleGeometry:A1/finite-etale-galois-category).); `AdicSpace.smallFiniteEtale.galoisCategory` (instance: For connected nonempty X, X_fét is a Galois category (AdicEtaleGeometry:A1/finite-etale-galois-category).)
  - unit tests: `AdicSpace.smallFiniteEtale.test_field` (computation: For X = Spa(K, K⁺), smallFiniteEtale X ≌ (CommAlgCat.FiniteEtale K)ᵒᵖ, and this does not depend on K⁺.); `AdicSpace.smallFiniteEtale.test_algClosed` (degenerate: For X = Spa(C, C⁺) with C algebraically closed, every object of X_fét is a finite disjoint union of copies of X.); `AdicSpace.smallFiniteEtale.test_open_not_object` (non-example: The inclusion of a proper nonempty rational subset of a connected affinoid X is étale but is not an object of X_fét.); `AdicSpace.smallFiniteEtale.test_affinoid_equiv` (compatibility: For X = Spa(A, A⁺), Γ induces smallFiniteEtale X ≌ (CommAlgCat.FiniteEtale A)ᵒᵖ (Mathlib category of finite étale algebras).); `AdicSpace.smallFiniteEtale.test_cover_iff` (characterisation: For X affinoid, (Spa B_i → X)_i is a covering iff ∏ B_i is faithfully flat over A.)
- **Étale maps to Spa(C, C⁺) split near the closed point** — `AdicEtaleGeometry:A1/geometric-point-etale-split` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/finite-etale-local-to-global`, `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `mathlib:Algebra.FormallyEtale.equivPiOfIsSepClosed`, `mathlib:IsAlgClosed`, `mathlib:ValuationSubring`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Geometric points of analytic adic spaces and their fibre functors on the étale site** — `AdicEtaleGeometry:A1/etale-site-and-geometric-points` (construction) — planet *Geometric point*
  - prerequisites: `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-diagonal`, `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `mathlib:CategoryTheory.GrothendieckTopology.Point`, `mathlib:CategoryTheory.GrothendieckTopology.Point.sheafFiber`, `mathlib:CategoryTheory.Functor.sheafPullback`, `mathlib:IsAlgClosed`, `mathlib:ValuationSubring`, `mathlib:AlgebraicGeometry.Scheme.pointSmallEtale`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.GeometricPoint`; `AdicSpace.GeometricPoint.support` (projection: The support x = ξ(s) ∈ X.); `AdicSpace.GeometricPoint.ofPoint` (constructor: For x ∈ X, a geometric point with support x.); `AdicSpace.GeometricPoint.comp` (functoriality: g ∘ ξ for g: X' → X.); `AdicSpace.GeometricPoint.fiber` (data: ε_ξ: smallEtale X ⥤ Type, U ↦ lifts of ξ to U.); `AdicSpace.GeometricPoint.point` (constructor: The point (smallEtaleTopology X).Point with fiber ε_ξ.); `AdicSpace.GeometricPoint.stalk` (data: F ↦ F_ξ = (point ξ).sheafFiber F.); `AdicSpace.GeometricPoint.fiber_comp_iso` (compatibility: ε_{g∘ξ'} ≅ ε_{ξ'} ⋙ base change along g.); `AdicSpace.GeometricPoint.stalk_pullback_iso` (compatibility: (g^{-1}F)_{ξ'} ≅ F_{g∘ξ'}, natural in F.); `AdicSpace.GeometricPoint.range_subset_generizations` (other: The image of ξ consists of generisations of the support.); `AdicSpace.isConservativeFamilyOfPoints_geometricPoint` (other: Conservativity (AdicEtaleGeometry:A1/etale-enough-points).); `AdicSpace.GeometricPoint.strictLocalization` (other: The strict localisation X(ξ) (AdicEtaleGeometry:A1/strict-localisation).)
  - unit tests: `AdicSpace.GeometricPoint.test_field_rank_two` (computation: For X = Spa(K, K⁺) with K⁺ of rank 2, the support of a geometric point Spa(C, O_C) → X is the generic point; a geometric point with support the closed point has C⁺ of rank ≥ 2.); `AdicSpace.GeometricPoint.test_rank_one_not_conservative` (non-example: For X = Spa(K, K⁺) with K⁺ of rank 2, j: {η} → X and F = coker(j_!ℤ → ℤ): F_ξ = 0 for every geometric point ξ = Spa(C, O_C) → X, but F ≠ 0 (its stalk at a geometric point supported at s is ℤ).); `AdicSpace.GeometricPoint.test_identity` (degenerate: For X = Spa(C, C⁺) and ξ = id, the fibre functor is Γ(X, −) and (point ξ).sheafFiber F ≅ F(X).); `AdicSpace.GeometricPoint.test_fet_fiber` (compatibility: For X = Spa(K, K⁺) and ξ from K ⊆ C, the restriction of ε_ξ to X_fét ≃ FÉt(K)^op is Mathlib's CommAlgCat.FiniteEtale.fiber K C.); `AdicSpace.GeometricPoint.test_image_generizations` (characterisation: The image of ξ is contained in the set of generisations of its support.)
- **The étale site has enough points: geometric points form a conservative family** — `AdicEtaleGeometry:A1/etale-enough-points` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-site`, `mathlib:CategoryTheory.ObjectProperty.IsConservativeFamilyOfPoints`, `mathlib:CategoryTheory.ObjectProperty.IsConservativeFamilyOfPoints.mk'`, `mathlib:CategoryTheory.ObjectProperty.IsConservativeFamilyOfPoints.jointlyReflectIsomorphisms`, `mathlib:CategoryTheory.GrothendieckTopology.HasEnoughPoints`, `mathlib:AlgebraicGeometry.Scheme.isConservative_pointSmallEtale`
- **The finite étale site of a connected space is a Galois category; the étale fundamental group** — `AdicEtaleGeometry:A1/finite-etale-galois-category` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/etale-diagonal`, `AdicEtaleGeometry:A1/finite-etale-local-to-global`, `mathlib:CategoryTheory.GaloisCategory`, `mathlib:CategoryTheory.PreGaloisCategory.FiberFunctor`, `mathlib:CategoryTheory.PreGaloisCategory.functorToContAction`, `mathlib:CommAlgCat.FiniteEtale`
- **The affinoid étale basis: X is stably adic and sheaves on X_ét are sheaves on the basis** — `AdicEtaleGeometry:A1/basis-comparison` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-morphism`, `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `AdicEtaleGeometry:A1/finite-etale-strongly-sheafy`, `AdicEtaleGeometry:A1/finite-etale-local-to-global`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-diagonal`, `AdicSpacesPartII:R0/completed-tensor-rational-localisation`, `tauceti:TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`, `mathlib:CategoryTheory.Functor.IsCoverDense`, `mathlib:CategoryTheory.Functor.IsDenseSubsite`, `mathlib:CategoryTheory.Functor.IsDenseSubsite.sheafEquiv`
- **Reduction of étale coverings to rational coverings and finite étale surjections; the étale sheaf criterion** — `AdicEtaleGeometry:A1/etale-covering-reduction` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/basis-comparison`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-diagonal`, `AdicEtaleGeometry:A1/etale-open-map`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-composition`, `mathlib:CategoryTheory.Presieve.IsSheafFor`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`
- **The structure sheaves O and O⁺ on the étale site** — `AdicEtaleGeometry:A1/etale-structure-sheaf` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-covering-reduction`, `AdicEtaleGeometry:A1/basis-comparison`, `AdicEtaleGeometry:A1/finite-etale-local-to-global`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/strongly-sheafy-huber-pair`, `mathlib:CommRingCat.isLimitForkPushoutSelfOfFaithfullyFlat`, `mathlib:Module.FaithfullyFlat`, `mathlib:CategoryTheory.Presieve.IsSheafFor`, `mathlib:CategoryTheory.Sheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **The étale site of an étale X-space is the slice site: U_ét ≃ X_ét/U** — `AdicEtaleGeometry:A1/slice-site` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/etale-cancellation`, `AdicEtaleGeometry:A1/etale-composition`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-diagonal`, `mathlib:CategoryTheory.GrothendieckTopology.over`, `mathlib:CategoryTheory.GrothendieckTopology.overPullback`, `mathlib:CategoryTheory.Over.iteratedSliceEquiv`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`
- **The strict localisation at a geometric point** — `AdicEtaleGeometry:A1/strict-localisation` (construction) — planet *Strict localization*
  - prerequisites: `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-structure-sheaf`, `AdicEtaleGeometry:A1/etale-base-change`, `mathlib:CategoryTheory.Functor.Elements`, `mathlib:CategoryTheory.IsCofiltered`, `mathlib:CategoryTheory.GrothendieckTopology.Point.sheafFiber`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`
  - API: `AdicSpace.GeometricPoint.Neighbourhood` (structure: Étale neighbourhoods (U, ū) of ξ: the category (fiber ξ).Elements.); `AdicSpace.GeometricPoint.isCofiltered_neighbourhood` (instance: N(ξ) is cofiltered and essentially small.); `AdicSpace.strictLocalization` (constructor: The diagram N(ξ)ᵒᵖ ⥤ smallEtale X, the pro-object X(ξ).); `AdicSpace.strictLocalization.eval` (data: F ↦ F(X(ξ)) = colim F(U).); `AdicSpace.strictLocalization.eval_iso_sheafFiber` (characterisation: F(X(ξ)) ≅ (point ξ).sheafFiber F for sheaves F.); `AdicSpace.strictLocalization.openNeighbourhood_final` (other: Open neighbourhoods of ū(s) in U are cofinal.); `AdicSpace.GeometricPoint.localRing` (data: O_{X_ét, ξ} = colim O_U(U).); `AdicSpace.GeometricPoint.localRing_toField` (data: The ring map O_{X_ét, ξ} → C and the valuation v_ξ.); `AdicSpace.strictLocalization.space` (data: |X(ξ)| = lim |U| with the map from |Spa(C, C⁺)|.); `AdicSpace.strictLocalization.map` (functoriality: X'(ξ') → X(g ∘ ξ') and O_{X_ét, gξ'} → O_{X'_ét, ξ'}.)
  - unit tests: `AdicSpace.strictLocalization.test_algClosed` (degenerate: For X = Spa(C, C⁺) and ξ = id, the neighbourhood category has the initial object (X, id), so X(ξ) = X and O_{X_ét, ξ} = C.); `AdicSpace.strictLocalization.test_field` (computation: For X = Spa(K, K⁺) and ξ from K ⊆ C, O_{X_ét, ξ} ≅ the separable closure of K in C.); `AdicSpace.strictLocalization.test_constant_stalk` (computation: For the constant sheaf Λ on X_ét, Λ(X(ξ)) = Λ.); `AdicSpace.strictLocalization.test_higher_rank_point` (non-example: For X = Spa(K, K⁺) with K⁺ of rank 2 and ξ supported at the closed point, |X(ξ)| has two points (the images of η and s); taking C⁺ = O_C instead gives a geometric point supported at η whose strict localisation has one point.); `AdicSpace.strictLocalization.test_stalk_eq_sheafFiber` (compatibility: For a sheaf F, F(X(ξ)) ≅ (point ξ).sheafFiber F (Mathlib GrothendieckTopology.Point.sheafFiber).)
- **Strict localisations of analytic adic spaces: strictly henselian local rings and algebraically closed affinoid fields** — `AdicEtaleGeometry:A1/strict-localisation-analytic` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/strict-localisation`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/finite-etale-approximation`, `mathlib:HenselianLocalRing`, `mathlib:IsAlgClosed`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **The Kedlaya–Liu étale and finite étale sites of an arbitrary analytic adic space** — `AdicEtaleGeometry:A1/etale-site-generalized` (construction)
  - prerequisites: `AdicEtaleGeometry:A1/generalized-adic-presentation`, `AdicEtaleGeometry:A1/yoneda-adic-open-immersions`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`, `AdicEtaleGeometry:A1/adic-spaces-in-yoneda-adic-spaces`, `AdicEtaleGeometry:A1/maps-from-adic-spaces-to-yoneda-affinoids`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/finite-etale-rational-descent`, `AdicEtaleGeometry:A1/affinoid-system-approximation`, `AdicEtaleGeometry:A1/finite-etale-approximation`, `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicEtaleGeometry:A1/etale-morphism`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-composition`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/finite-etale-strongly-sheafy`, `AdicEtaleGeometry:A1/geometric-point-etale-split`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/etale-enough-points`, `mathlib:CategoryTheory.MorphismProperty.Over`, `mathlib:CategoryTheory.Pretopology`, `mathlib:CategoryTheory.Pretopology.toGrothendieck`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`
  - API: `YonedaAdicSpace.IsFiniteEtale`; `YonedaAdicSpace.IsEtaleLocalDescription`; `YonedaAdicSpace.smallEtale`; `YonedaAdicSpace.smallEtaleTopology`; `YonedaAdicSpace.smallFiniteEtale`; `YonedaAdicSpace.finiteEtaleEquiv`; `YonedaAdicSpace.IsEtaleLocalDescription.baseChange` (other: Stability under base change along arbitrary morphisms.); `YonedaAdicSpace.IsEtaleLocalDescription.comp` (other: Stability under composition.); `YonedaAdicSpace.smallEtale_equiv_of_isLocallyStronglySheafy`; `YonedaAdicSpace.hasEnoughPoints_smallEtaleTopology`
  - unit tests: `YonedaAdicSpace.smallFiniteEtale.test_affinoid` (characterisation: For every complete Tate pair (A, A⁺), YonedaAdicSpace.smallFiniteEtale (spaY A) ≌ (CommAlgCat.FiniteEtale A)ᵒᵖ, with no sheafiness hypothesis.); `YonedaAdicSpace.smallEtale.test_eq_adic` (compatibility: For X locally strongly sheafy, the functor AdicSpace.smallEtale X ⥤ YonedaAdicSpace.smallEtale X^Y is an equivalence of sites.); `YonedaAdicSpace.smallEtale.test_opens` (degenerate: Open immersions into X are objects of X_ét^Y and open coverings are coverings.); `YonedaAdicSpace.smallEtale.test_adic_objects_insufficient` (non-example: For A sheafy but not known to be strongly sheafy, the adic-space objects of X_ét^Y are not known to be closed under fibre products (Kedlaya–Liu Remark 8.2.18): restricting to adic objects is not a substitute.)
- **Étale, finite étale and pro-étale morphisms of pro-objects of X_ét, and the underlying space |U| = lim |U_i|** — `AdicEtaleGeometry:A1/pro-etale-morphism` (definition)
  - prerequisites: `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/finite-etale-morphism`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`, `AdicSpacesPartII:R0/fibre-products-existence`, `AdicSpacesPartII:R0/etale-smooth-cancellation`, `mathlib:CategoryTheory.Ind`, `mathlib:CategoryTheory.IsCofiltered`
  - API: `AdicSpace.ProEtale.ProEt`; `AdicSpace.ProEtale.ProEt.const` (constructor: The fully faithful functor c: X_ét ⥤ pro-X_ét sending U to the constant system.); `AdicSpace.ProEtale.ProEt.hom_const_equiv` (characterisation: Hom(lim_i U_i, c V) ≃ colim_i Hom_X(U_i, V) for V ∈ X_ét (Scholze Proposition 3.2).); `AdicSpace.ProEtale.ProEt.space` (projection: The functor U ↦ |U| = lim |U_i| from pro-X_ét to topological spaces, with |c U| = |U| and |lim_k U_k| = lim_k |U_k| for cofiltered limits.); `AdicSpace.ProEtale.IsEtale` (data: The class of étale morphisms of pro-X_ét: pullbacks of étale morphisms of X_ét along maps to constant objects.); `AdicSpace.ProEtale.IsFiniteEtale` (data: The class of finite étale morphisms of pro-X_ét; IsFiniteEtale.isEtale.); `AdicSpace.ProEtale.IsProEtale` (data: The class of pro-étale morphisms, with the structure ProEtalePresentation of a chosen presentation.); `AdicSpace.ProEtale.IsEtale.isProEtale` (relation: Every étale morphism is pro-étale, via the constant presentation.); `AdicSpace.ProEtale.isEtale_const` (compatibility: For a morphism g of X_ét, c(g) is étale; it is finite étale iff g is finite étale in the sense of AdicEtaleGeometry:A1/finite-etale-morphism.); `AdicSpace.ProEtale.IsSurjective` (data: Surjectivity of a morphism of pro-X_ét on underlying spaces.)
  - unit tests: `ProEtale.test_const_etale`; `ProEtale.test_kummer_tower`; `ProEtale.test_kummer_not_etale`; `ProEtale.test_hom_const`
- **Finite-étale towers: transfinite compositions of pullbacks of finite étale surjections (the erratum's corrected covering condition)** — `AdicEtaleGeometry:A1/finite-etale-tower` (definition)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-morphism`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicEtaleGeometry:A1/finite-etale-site`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`, `mathlib:CategoryTheory.MorphismProperty.transfiniteCompositions`, `mathlib:CategoryTheory.MorphismProperty.pullbacks`, `mathlib:CategoryTheory.Functor.IsWellOrderContinuous`
  - API: `AdicSpace.ProEtale.FetTower` (structure: A finite-étale tower over W: an ordinal λ, the functor μ ↦ U_μ with U_0 = W, and for each μ a finite étale surjection of X_ét whose pullback is U_μ → U_{<μ}.); `AdicSpace.ProEtale.FetTower.comp` (projection: The composite lim_{μ<λ} U_μ → W of a tower.); `AdicSpace.ProEtale.IsFetTower` (data: The class of morphisms isomorphic over their target to the composite of a tower.); `AdicSpace.ProEtale.IsFetTower.of_finiteEtale_surjective` (constructor: A finite étale surjective morphism is a tower of length 2; an isomorphism is a tower of length 1.); `AdicSpace.ProEtale.IsFetTower.comp` (structure: Towers compose: concatenation of a tower of length λ₁ over the composite of a tower of length λ₂ is a tower of length λ₂ + λ₁.); `AdicSpace.ProEtale.IsFetTower.baseChange` (functoriality: The base change of a tower along any morphism W' → W of pro-X_ét is a tower of the same length (steps pull back to pullbacks of the same finite étale surjections; fibre products commute with cofiltered limits).); `AdicSpace.ProEtale.IsFetTower.surjective` (relation: Towers are surjective on underlying spaces.); `AdicSpace.ProEtale.isFetTower_iff_transfiniteCompositions` (compatibility: t is a tower iff t.op lies in Mathlib's MorphismProperty.transfiniteCompositions of the opposite of the pullbacks of finite étale surjections.); `AdicSpace.ProEtale.IsFetTower.isProEtale` (relation: Every tower is pro-étale (AdicEtaleGeometry:A1/finite-etale-tower-is-pro-etale).); `AdicSpace.ProEtale.isFetTower_of_countable` (characterisation: A pro-étale presentation lim_{i∈I} U_i → U_{i_0} beyond the threshold i_0, with I countable, is a tower of length ω.)
  - unit tests: `FetTower.test_kummer`; `FetTower.test_length_le_one`; `FetTower.test_open_immersion`; `FetTower.test_nonsplit_surjection`; `FetTower.test_mathlib_shape`
- **Towers are pro-étale: presentation by finite dependency-closed sets of stages, and the countable case** — `AdicEtaleGeometry:A1/finite-etale-tower-is-pro-etale` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-tower`, `AdicEtaleGeometry:A1/pro-etale-morphism`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicEtaleGeometry:A1/pro-etale-etale-composition`, `AdicEtaleGeometry:A1/pro-etale-composition`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`
- **Transfinite towers of pullbacks of finite surjections of profinite sets split (the erratum's replacement of Proposition 3.7(i))** — `AdicEtaleGeometry:A1/transfinite-tower-splitting` (lemma)
  - prerequisites: `mathlib:Profinite`, `AdicEtaleGeometry:A1/finite-etale-tower`
- **Profinite groups are transfinite towers of finite extensions; G → G/G' is a corrected covering of profinite G-sets** — `AdicEtaleGeometry:A1/profinite-group-tower` (lemma)
  - prerequisites: `mathlib:Profinite`, `AdicEtaleGeometry:A1/profinite-g-sets-site`
- **Base change in pro-X_ét along étale, finite étale and pro-étale maps, surjective on underlying spaces (Scholze Lemma 3.10(i))** — `AdicEtaleGeometry:A1/pro-etale-base-change` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-morphism`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`, `AdicEtaleGeometry:A1/finite-etale-morphism`, `AdicSpacesPartII:R0/fibre-products-existence`, `AdicSpacesPartII:R0/fibre-product-points`, `AdicSpacesPartII:R0/unramified-locally-quasi-finite`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`
- **Composites of étale (finite étale) maps in pro-X_ét are étale (finite étale) (Scholze Lemma 3.10(ii))** — `AdicEtaleGeometry:A1/pro-etale-etale-composition` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-morphism`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicSpacesPartII:R0/etale-smooth-composition`, `AdicEtaleGeometry:A1/finite-etale-morphism`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`
- **Quasi-compact opens of |U| are represented by étale subobjects (Scholze Lemma 3.10(iii))** — `AdicEtaleGeometry:A1/pro-etale-quasicompact-opens` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-morphism`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `AdicSpacesPartII:R0/open-embedding-etale`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`
- **Pro-étale maps are open on underlying spaces (Scholze Lemma 3.10(iv))** — `AdicEtaleGeometry:A1/pro-etale-maps-open` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-quasicompact-opens`, `AdicEtaleGeometry:A1/pro-etale-etale-composition`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicSpacesPartII:R0/smooth-morphism-open`
- **Surjective étale and finite étale maps to objects of X_proét descend to a surjective map at a finite stage (Scholze Lemma 3.10(v))** — `AdicEtaleGeometry:A1/pro-etale-surjective-etale-descent` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicEtaleGeometry:A1/pro-etale-morphism`, `AdicSpacesPartII:R0/smooth-morphism-open`
- **Pro-étale over pro-étale is pro-étale (Scholze Lemma 3.10(vi))** — `AdicEtaleGeometry:A1/pro-etale-composition` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicEtaleGeometry:A1/pro-etale-etale-composition`, `AdicEtaleGeometry:A1/pro-etale-surjective-etale-descent`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`
- **Étale spaces over a locally noetherian analytic adic space locally have finitely many connected components** — `AdicEtaleGeometry:A1/etale-locally-finitely-many-components` (lemma)
  - prerequisites: `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `AdicSpacesPartII:R0/etale-local-structure`, `AdicSpacesPartII:R0/topologically-finite-type-noetherian-type`, `AdicSpacesPartII:R0/noetherian-type-stably-sheafy`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-4-sheafiness-and-tate-acyclicity`
- **Finite limits exist in X_proét (Scholze Lemma 3.10(vii))** — `AdicEtaleGeometry:A1/pro-etale-finite-limits` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicEtaleGeometry:A1/pro-etale-composition`, `AdicEtaleGeometry:A1/etale-locally-finitely-many-components`, `AdicSpacesPartII:R0/infinitesimal-criteria`
- **An étale map over a finite-étale tower can be rewritten as a tower followed by an étale map** — `AdicEtaleGeometry:A1/etale-over-tower-swap` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-tower`, `AdicEtaleGeometry:A1/pro-etale-etale-composition`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicEtaleGeometry:A1/pro-etale-morphism`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`
- **The corrected covering families form a pretopology on X_proét** — `AdicEtaleGeometry:A1/corrected-covers-pretopology` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-tower`, `AdicEtaleGeometry:A1/finite-etale-tower-is-pro-etale`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicEtaleGeometry:A1/pro-etale-etale-composition`, `AdicEtaleGeometry:A1/pro-etale-composition`, `AdicEtaleGeometry:A1/pro-etale-maps-open`, `AdicEtaleGeometry:A1/pro-etale-finite-limits`, `AdicEtaleGeometry:A1/etale-over-tower-swap`, `mathlib:CategoryTheory.Pretopology`
- **The pro-étale site X_proét of a locally noetherian analytic adic space, with Scholze's corrected coverings** — `AdicEtaleGeometry:A1/pro-etale-site-corrected` (construction) — planet *Pro-étale site*
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-tower`, `AdicEtaleGeometry:A1/corrected-covers-pretopology`, `AdicEtaleGeometry:A1/pro-etale-finite-limits`, `AdicEtaleGeometry:A1/pro-etale-quasicompact-opens`, `AdicEtaleGeometry:A1/pro-etale-composition`, `AdicEtaleGeometry:A1/finite-etale-tower-is-pro-etale`, `AdicEtaleGeometry:A1/etale-site`, `mathlib:CategoryTheory.Pretopology.toGrothendieck`, `mathlib:AlgebraicGeometry.Scheme.proetaleTopology`
  - API: `AdicSpace.ProEtaleSite`; `AdicSpace.ProEtaleSite.topology` (structure: The Grothendieck topology J_proét := Pretopology.toGrothendieck of the corrected coverings.); `AdicSpace.ProEtaleSite.mem_topology_iff` (characterisation: A sieve on U is J_proét-covering iff it contains a family {U_i → U} with |U| = ⋃ f_i(|U_i|) and each member a finite-étale tower followed by an étale map.); `AdicSpace.ProEtaleSite.isCovering_of_etale` (constructor: A jointly surjective family of étale morphisms is a covering.); `AdicSpace.ProEtaleSite.isCovering_of_isFetTower` (constructor: A finite-étale tower is a covering (single-member family).); `AdicSpace.ProEtaleSite.isCovering_of_countable` (characterisation: A jointly surjective family of pro-étale maps with countably indexed presentations is a covering.); `AdicSpace.ProEtaleSite.topology_le_printed` (relation: J_proét ≤ the topology of the printed Definition 3.9 on the same category.); `AdicSpace.ProEtaleSite.hasFiniteLimits` (instance: X_proét has finite limits, computed in pro-X_ét.); `AdicSpace.ProEtaleSite.space` (projection: The underlying-space functor U ↦ |U| restricted to X_proét.); `AdicSpace.ProEtaleSite.isOpenMap_of_mem_covering` (relation: Members of coverings induce open maps on underlying spaces.); `AdicSpace.ProEtaleSite.ne_scheme_proetale` (other: No identification with AlgebraicGeometry.Scheme.proetaleTopology is asserted: its objects are schemes weakly étale over a base with fpqc covers, not pro-objects of étale adic spaces.)
  - unit tests: `ProEtaleSite.test_point`; `ProEtaleSite.test_nonsplit_not_cover`; `ProEtaleSite.test_countable_unchanged`; `ProEtaleSite.test_etale_cover`; `ProEtaleSite.test_geometric_stalk_not_conservative`
- **The projection ν: X_proét → X_ét** — `AdicEtaleGeometry:A1/proetale-projection-nu` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/pro-etale-finite-limits`, `AdicEtaleGeometry:A1/pro-etale-morphism`, `AdicEtaleGeometry:A1/etale-site`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPushforwardContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`, `mathlib:CategoryTheory.presheafToSheaf`
- **Sections of ν^*F on quasi-compact quasi-separated pro-étale objects: (ν^*F)(lim U_j) = colim F(U_j)** — `AdicEtaleGeometry:A1/nu-pullback-sections-qcqs` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/proetale-projection-nu`, `AdicEtaleGeometry:A1/proetale-coherence`, `AdicEtaleGeometry:A1/proetale-quasicompactness-detection`, `AdicEtaleGeometry:A1/finite-etale-tower-is-pro-etale`, `AdicEtaleGeometry:A1/etale-site`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`
- **The sites G-fsets and G-pfsets of finite and profinite G-sets, with corrected coverings (Scholze Definition 3.4 with the erratum)** — `AdicEtaleGeometry:A1/profinite-g-sets-site` (construction)
  - prerequisites: `mathlib:Profinite`, `mathlib:CategoryTheory.Pretopology`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`
  - API: `ProfiniteGSet`; `ProfiniteGSet.equivPro` (equivalence: G-pfsets ≃ Pro(G-fsets).); `ProfiniteGSet.IsGEtale` (data: Pullbacks of maps of finite G-sets.); `ProfiniteGSet.IsGTower` (data: Transfinite compositions of pullbacks of surjections of finite G-sets.); `ProfiniteGSet.pretopology` (structure: The corrected covering pretopology and its Grothendieck topology.); `ProfiniteGSet.sheafF` (constructor: F_M(S) = Hom_cont,G(S, M), a sheaf of abelian groups for a topological G-module M.); `ProfiniteGSet.sheafF_apply` (simp: F_M(S) = Hom_cont,G(S, M).); `ProfiniteGSet.forgetTrivial` (compatibility: For G = 1, ProfiniteGSet ≃ Profinite.); `FiniteGSet.site`
  - unit tests: `ProfiniteGSet.test_FM_on_G` (computation: For a topological G-module M, F_M(G) = C(G, M) (continuous maps) and F_M(pt) = M^G.); `ProfiniteGSet.test_summands` (degenerate: For G trivial and profinite S_1, S_2, the summand inclusions form a covering of S_1 ⊔ S_2; the empty family covers the empty set.); `ProfiniteGSet.test_trivial_group` (compatibility: For G = 1 the underlying category is equivalent to Profinite (mathlib:Profinite), and every covering family of a profinite set has continuous sections locally on a finite clopen partition.); `ProfiniteGSet.test_nonsplit` (non-example: For G = 1 an open continuous surjection of profinite sets without continuous section (Ribes–Zalesskii, Example 5.6.9) is not a covering, although it was one for the printed Definition 3.4.); `ProfiniteGSet.test_G_to_pt` (characterisation: For any profinite G, {G → pt} is a covering (AdicEtaleGeometry:A1/profinite-group-tower); for G = Z/2 acting on S = Z/2 by translation, S → pt is a covering without G-equivariant section, so coverings of G-pfsets need not split equivariantly.)
- **Structure of open surjections of profinite G-sets (Scholze Lemma 3.6)** — `AdicEtaleGeometry:A1/open-surjection-profinite-structure` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/profinite-g-sets-site`, `mathlib:Profinite`
- **Sections over profinite G-sets with free action are exact (Scholze Proposition 3.7(ii), with corrected coverings)** — `AdicEtaleGeometry:A1/free-g-profinite-sections-exact` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/profinite-g-sets-site`, `AdicEtaleGeometry:A1/profinite-group-tower`, `AdicEtaleGeometry:A1/transfinite-tower-splitting`
- **The pro-finite étale site X_profét, with Scholze's corrected coverings (Definition 3.3 with the erratum)** — `AdicEtaleGeometry:A1/pro-finite-etale-site-corrected` (construction)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/pro-etale-morphism`, `AdicEtaleGeometry:A1/finite-etale-tower`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicEtaleGeometry:A1/etale-over-tower-swap`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`, `mathlib:CategoryTheory.Pretopology`
  - API: `AdicSpace.ProFetSite` (structure: The category X_profét = Pro(X_fét).); `AdicSpace.ProFetSite.topology` (structure: The corrected covering pretopology and its topology.); `AdicSpace.ProFetSite.toProEtaleSite` (functoriality: The fully faithful inclusion X_profét ⥤ X_proét.); `AdicSpace.ProFetSite.isCovering_of_isFetTower` (constructor: Pro-finite-étale towers are coverings.); `AdicSpace.ProFetSite.isCovering_summands` (constructor: The summand inclusions of a finite disjoint union form a covering.); `AdicSpace.ProFetSite.space` (projection: |U| = lim |U_i| on X_profét.); `AdicSpace.ProFetSite.const` (constructor: The embedding X_fét ⥤ X_profét.)
  - unit tests: `ProFetSite.test_field`; `ProFetSite.test_alg_closed` (degenerate: For X = Spa(C, C⁺) with C algebraically closed, X_fét is the category of finite disjoint unions of copies of X and X_profét ≃ Profinite.); `ProFetSite.test_summands` (non-example: The summand inclusions X → X ⊔ X form a covering of X_profét; under the literal reading of the erratum (each covering map a tower, hence surjective) they would not, which is why the second factor is allowed.); `ProFetSite.test_inclusion` (compatibility: Every covering of X_profét is a covering of X_proét (AdicEtaleGeometry:A1/pro-etale-site-corrected): pullbacks of morphisms of X_fét are finite étale, hence étale.)
- **X_profét ≃ π1(X, x̄)-pfsets as sites with corrected coverings (Scholze Proposition 3.5)** — `AdicEtaleGeometry:A1/profinite-etale-galois-sets` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/finite-etale-galois-category`, `AdicEtaleGeometry:A1/pro-finite-etale-site-corrected`, `AdicEtaleGeometry:A1/profinite-g-sets-site`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`
- **Open equals pro-étale on X_profét, and the morphism of sites X_proét → X_profét (Scholze Lemma 3.11)** — `AdicEtaleGeometry:A1/proetale-profinite-etale-morphism-of-sites` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-maps-open`, `AdicEtaleGeometry:A1/profinite-etale-galois-sets`, `AdicEtaleGeometry:A1/open-surjection-profinite-structure`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicEtaleGeometry:A1/pro-finite-etale-site-corrected`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `mathlib:CategoryTheory.Functor.IsContinuous`
- **Affinoid pro-étale presentations give a generating family of coherent objects; the pro-étale topos is algebraic (Scholze Proposition 3.12(i)–(iii))** — `AdicEtaleGeometry:A1/proetale-coherence` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/pro-etale-maps-open`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicEtaleGeometry:A1/pro-etale-quasicompact-opens`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`, `AdicSpacesPartII:R0/fibre-products-existence`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`
- **Quasi-compactness and quasi-separatedness in X_proét are detected on underlying spaces (Scholze Proposition 3.12(iv)–(vii))** — `AdicEtaleGeometry:A1/proetale-quasicompactness-detection` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/proetale-coherence`, `AdicEtaleGeometry:A1/pro-etale-quasicompact-opens`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `mathlib:CategoryTheory.Functor.IsDenseSubsite`
- **The fibre morphisms of topoi i_x: Sh(Y_x,profét) → Sh(X_proét) at points x ∈ X (Scholze Proposition 3.13, first sentence)** — `AdicEtaleGeometry:A1/proetale-fibre-morphism-of-topoi` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/profinite-g-sets-site`, `AdicEtaleGeometry:A1/finite-etale-galois-category`, `AdicEtaleGeometry:A1/profinite-etale-galois-sets`, `AdicEtaleGeometry:A1/proetale-quasicompactness-detection`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicSpacesPartII:R0/unramified-locally-quasi-finite`, `mathlib:CategoryTheory.Functor.IsContinuous`, `mathlib:CategoryTheory.Functor.sheafPullback`
- **The family (i_x^*)_{x∈X} detects zero sheaves (Scholze Proposition 3.13, second sentence)** — `AdicEtaleGeometry:A1/proetale-fibre-conservativity` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/proetale-fibre-morphism-of-topoi`, `AdicEtaleGeometry:A1/profinite-etale-galois-sets`, `AdicEtaleGeometry:A1/pro-etale-maps-open`, `AdicEtaleGeometry:A1/proetale-coherence`
- **The pro-étale topos has enough points for abstract reasons (erratum item (2)); the deleted point assertions are not used** — `AdicEtaleGeometry:A1/proetale-topos-enough-points` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/proetale-coherence`, `AdicEtaleGeometry:A1/proetale-quasicompactness-detection`, `AdicEtaleGeometry:A1/proetale-slice`, `DiamondsAndVStacks:D0`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `mathlib:CategoryTheory.GrothendieckTopology.HasEnoughPoints`, `mathlib:CategoryTheory.GrothendieckTopology.Point`
- **The pro-étale site of an étale X-space is the slice site: V_proét ≃ X_proét/V** — `AdicEtaleGeometry:A1/proetale-slice` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/proetale-projection-nu`, `AdicEtaleGeometry:A1/pro-etale-morphism`, `AdicEtaleGeometry:A1/slice-site`, `AdicSpacesPartII:R0/etale-smooth-cancellation`, `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`, `mathlib:CategoryTheory.GrothendieckTopology.over`
- **Quasi-compact quasi-separated étale spaces over X_{L̂} descend to a finite subextension (the approximation behind Scholze Proposition 3.15)** — `AdicEtaleGeometry:A1/etale-descent-along-algebraic-extension` (lemma)
  - prerequisites: `AdicSpacesPartII:R0/etale-local-structure`, `AdicSpacesPartII:R0/etale-presentation-perturbation`, `AdicSpacesPartII:R0/infinitesimal-criteria`, `AdicSpacesPartII:R0/smooth-morphism-open`, `AdicSpacesPartII:R0/fibre-products-existence`, `tauceti:TauCeti.ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`, `AdicEtaleGeometry:A1/etale-site`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Change of base field: X_{L̂,proét} ≃ X_proét/X_L (Scholze Proposition 3.15)** — `AdicEtaleGeometry:A1/proetale-field-extension-slice` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/etale-descent-along-algebraic-extension`, `AdicEtaleGeometry:A1/proetale-slice`, `AdicEtaleGeometry:A1/proetale-coherence`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/finite-etale-tower-is-pro-etale`, `mathlib:CategoryTheory.GrothendieckTopology.over`
- **Products U × S with profinite sets in X_proét; an open surjection of profinite sets need not give a covering** — `AdicEtaleGeometry:A1/profinite-set-objects` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/pro-etale-base-change`, `AdicEtaleGeometry:A1/pro-etale-composition`, `AdicEtaleGeometry:A1/finite-etale-tower-is-pro-etale`, `AdicEtaleGeometry:A1/profinite-group-tower`, `AdicEtaleGeometry:A1/open-surjection-profinite-structure`, `AdicEtaleGeometry:A1/transfinite-tower-splitting`, `DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces`, `mathlib:Profinite`
- **Pro-finite-étale Galois covers are corrected coverings; Ũ ×_U Ũ ≅ Ũ × G and Galois descent of sections** — `AdicEtaleGeometry:A1/profinite-galois-cover-is-covering` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/profinite-set-objects`, `AdicEtaleGeometry:A1/profinite-group-tower`, `AdicEtaleGeometry:A1/finite-etale-galois-category`, `AdicEtaleGeometry:A1/nu-pullback-sections-qcqs`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1/finite-etale-tower`, `AdicEtaleGeometry:A1/pro-etale-morphism`
- **The rational-covering site on the opposite category of complete Huber pairs** — `AdicEtaleGeometry:A1/huber-pair-rational-site` (construction)
  - prerequisites: `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.Pair.Hom`, `tauceti:TauCeti.Huber.Pair.Hom.spaComap`, `tauceti:TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.isTopologicalBasis_spaRationalFamily`, `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`, `tauceti:TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_isUnit_of_forall_comap_mem_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.spa_eq_empty_iff_subsingleton`, `mathlib:CategoryTheory.Coverage`, `mathlib:CategoryTheory.Presieve.isSheaf_coverage`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-4-sheafiness-and-tate-acyclicity`
  - API: `CAff`; `CAff.rationalCover`; `CAff.rationalCoverage` (structure: The coverage on CAffᵒᵖ given by rational covering families.); `CAff.ratTopology` (structure: J_rat := rationalCoverage.toGrothendieck.); `CAff.isSheaf_iff` (characterisation: A presheaf is a J_rat-sheaf iff it satisfies the sheaf condition for rational covering families.); `CAff.rationalCover_pullback` (relation: For (A, A⁺) → (B, B⁺), a rational covering of Spa(B, B⁺) refines the preimage of a rational covering of Spa(A, A⁺).); `CAff.spa`; `CAff.O`; `CAff.isSheafAt_O_iff_isSheafyPair` (compatibility: For complete Tate (A, A⁺): 𝒪 satisfies the sheaf condition at all rational coverings of (A, A⁺) and its rational localisations iff Huber.IsSheafyPair A A⁺.)
  - unit tests: `CAff.test_laurent_cover`; `CAff.test_empty_cover` (degenerate: The empty family is a rational covering family of (A, A⁺) iff A = 0 (tauceti:TauCeti.ValuationSpectrum.spa_eq_empty_iff_subsingleton); hence every J_rat-sheaf takes the value pt at the zero pair.); `CAff.test_O_sheafy` (compatibility: For a complete strongly noetherian Tate pair (A, A⁺), 𝒪 satisfies the sheaf condition for the rational covering families of (A, A⁺) and of each rational localisation (anchor Layer 4).); `CAff.test_rost` (non-example: For Rost's complete Tate pair (A, A⁺) (Hansen–Kedlaya, Example 6.28), 𝒪 = h_{(Z[T],Z)} fails the sheaf condition for the rational covering {v(X_1) ≤ 1}, {v(X_1) ≥ 1}: X_3 ≠ 0 restricts to 0 on both members; so representable presheaves are not J_rat-sheaves in general.); `CAff.test_isSheaf_iff` (characterisation: A presheaf G on CAffᵒᵖ is a J_rat-sheaf iff for every (A, A⁺) and every rational covering {U_k}, G(A) → ∏_k G(O(U_k)) ⇉ ∏_{k,l} G(O(U_k ∩ U_l)) is an equalizer.)
- **Yoneda-adic spaces: generalized adic spaces as sheaves on complete Huber pairs (Scholze–Weinstein pre-adic spaces, Kedlaya–Liu preadic spaces)** — `AdicEtaleGeometry:A1/generalized-adic-presentation` (construction) — planet *Yoneda-adic spaces*
  - prerequisites: `AdicEtaleGeometry:A1/huber-pair-rational-site`, `mathlib:CategoryTheory.presheafToSheaf`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.ValuationSpectrum.spa_eq_empty_iff_subsingleton`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`
  - API: `YonedaAdicSpace.spaY`; `YonedaAdicSpace.spaYFunctor` (functoriality: (A, A⁺) ↦ Spa^Y(A, A⁺) as a functor CAffᵒᵖ ⥤ Sh(CAffᵒᵖ, J_rat), with map_id and map_comp.); `YonedaAdicSpace.homSpaYEquiv` (universal-property: Hom(Spa^Y(A, A⁺), G) ≃ G(A, A⁺) naturally, for every J_rat-sheaf G.); `YonedaAdicSpace.IsOpenImmersion` (data: Open immersions of J_rat-sheaves (Berkeley Definition 3.4.1), stable under base change and composition.); `YonedaAdicSpace`; `YonedaAdicSpace.isColimit_affinoids` (characterisation: A J_rat-sheaf is Yoneda-adic iff it is the colimit of its affinoid open immersions; equivalently it has a covering by affinoid open immersions.); `YonedaAdicSpace.spaY_isInitial_iff` (example: Spa^Y(A, A⁺) is initial iff A = 0.); `YonedaAdicSpace.globalFunctions` (other: Γ(F) := Hom(F, Spa^Y(Z[T], Z)), a ring; Γ(Spa^Y(A, A⁺)) is the sheafified value of 𝒪 at (A, A⁺), equal to A when (A, A⁺) and its rational localisations are sheafy.); `YonedaAdicSpace.space` (projection: The underlying topological space |F| (AdicEtaleGeometry:A1/yoneda-adic-ind-ringed-description), with |Spa^Y(A, A⁺)| = Spa(A, A⁺).); `YonedaAdicSpace.ofAdicSpace` (coercion: The fully faithful functor ι from the anchor's adic spaces (AdicEtaleGeometry:A1/adic-spaces-in-yoneda-adic-spaces).)
  - unit tests: `YonedaAdicSpace.test_zero_pair` (degenerate: Spa^Y(A, A⁺) is an initial object of Sh(CAffᵒᵖ, J_rat) iff A = 0; in particular Spa^Y(0, 0) is initial, and the empty sheaf is a Yoneda-adic space (empty colimit).); `YonedaAdicSpace.test_open_disc` (computation: D := colim_n Spa^Y(Q_p⟨T, T^n/p⟩, Z_p⟨T, T^n/p⟩) → Spa^Y(Q_p⟨T⟩, Z_p⟨T⟩) is an open immersion with image the open unit disc {|T| < 1}; |D| is not quasi-compact, so D is a Yoneda-adic space not isomorphic to any Spa^Y(A, A⁺).); `YonedaAdicSpace.test_affine_line` (characterisation: Hom(F, Spa^Y(Z[T], Z)) = (J_rat-sheafification of 𝒪)(F) for every Yoneda-adic space F; for F = Spa^Y(A, A⁺) with (A, A⁺) sheafy together with all its rational localisations this is A.); `YonedaAdicSpace.test_rost_not_faithful` (non-example: For Rost's complete Tate pair (A, A⁺) (Hansen–Kedlaya, Example 6.28), the continuous maps (Z[T], Z) → (A, A⁺), T ↦ X_3 and T ↦ 0, induce the same morphism Spa^Y(A, A⁺) → Spa^Y(Z[T], Z), since X_3 restricts to 0 on the rational covering {v(X_1) ≤ 1}, {v(X_1) ≥ 1}; so (A, A⁺) ↦ Spa^Y(A, A⁺) is not faithful and the global functions of Spa^Y(A, A⁺) are not A. A definition by representable presheaves without sheafification would separate these maps.); `YonedaAdicSpace.test_sheafy` (compatibility: For (A, A⁺) = (Q_p⟨T⟩, Z_p⟨T⟩), Spa^Y(A, A⁺) ≅ ι(Spa(A, A⁺)) for the anchor's adic space Spa(A, A⁺) (AdicEtaleGeometry:A1/adic-spaces-in-yoneda-adic-spaces) and its global functions are Q_p⟨T⟩.)
- **Open immersions into Spa^Y(A, A⁺) are the open subsets of Spa(A, A⁺); gluing along rational subsets** — `AdicEtaleGeometry:A1/yoneda-adic-open-immersions` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/huber-pair-rational-site`, `AdicEtaleGeometry:A1/generalized-adic-presentation`, `tauceti:TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_isUnit_of_forall_comap_mem_rationalSubset`, `tauceti:TauCeti.Huber.Pair.Hom.spaComap_preimage_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.isTopologicalBasis_spaRationalFamily`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`
- **Yoneda-adic spaces as ind-topologically ringed spaces with valuations; the underlying space |F| (Berkeley Proposition 3.5.3)** — `AdicEtaleGeometry:A1/yoneda-adic-ind-ringed-description` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/generalized-adic-presentation`, `AdicEtaleGeometry:A1/yoneda-adic-open-immersions`, `mathlib:CategoryTheory.Ind`, `mathlib:CategoryTheory.Ind.yoneda`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`
- **Maps from an adic space to Spa^Y(A, A⁺) are continuous maps of pairs into global sections (Kedlaya–Liu Lemma 8.2.9)** — `AdicEtaleGeometry:A1/maps-from-adic-spaces-to-yoneda-affinoids` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/generalized-adic-presentation`, `AdicEtaleGeometry:A1/yoneda-adic-open-immersions`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Agreement with the sheafy adic spaces of the anchor: adic spaces form a full subcategory of Yoneda-adic spaces** — `AdicEtaleGeometry:A1/adic-spaces-in-yoneda-adic-spaces` (theorem)
  - prerequisites: `AdicEtaleGeometry:A1/generalized-adic-presentation`, `AdicEtaleGeometry:A1/yoneda-adic-open-immersions`, `AdicEtaleGeometry:A1/yoneda-adic-ind-ringed-description`, `AdicEtaleGeometry:A1/maps-from-adic-spaces-to-yoneda-affinoids`, `mathlib:CategoryTheory.Ind.yoneda`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-4-sheafiness-and-tate-acyclicity`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Analytic Yoneda-adic spaces are covered by Tate affinoids and are the preadic spaces of Kedlaya–Liu** — `AdicEtaleGeometry:A1/yoneda-adic-analytic-tate-local` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/generalized-adic-presentation`, `AdicEtaleGeometry:A1/yoneda-adic-open-immersions`, `AdicEtaleGeometry:A1/yoneda-adic-ind-ringed-description`, `tauceti:TauCeti.ValuationSpectrum.spaAnalytic_eq_biUnion_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.isTateRing_completion_locTopology_of_mem_generators`, `tauceti:TauCeti.Huber.IsTateRing`, `AdicSpacesPartII:R0/tate-ring-norm`, `AdicSpacesPartII:R0/adic-ring-homomorphism`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`
- **Fibre products of analytic Yoneda-adic spaces; affinoid case by completed tensor products** — `AdicEtaleGeometry:A1/yoneda-adic-fibre-products` (lemma)
  - prerequisites: `AdicEtaleGeometry:A1/generalized-adic-presentation`, `AdicEtaleGeometry:A1/yoneda-adic-open-immersions`, `AdicEtaleGeometry:A1/yoneda-adic-analytic-tate-local`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/completed-tensor-product-universal-property`, `AdicSpacesPartII:R0/completed-tensor-rational-localisation`, `AdicSpacesPartII:R0/fibre-product-points`, `mathlib:CategoryTheory.presheafToSheaf`

### A2. Separatedness, smooth charts, and classical analytic geometry

- **A2 supplier contract: separated, proper and partially proper morphisms of analytic adic spaces and their valuative criteria are AdicSpacesPartII R0's notions** — `AdicEtaleGeometry:A2/supplier-contract-separated-proper-smooth` (comparison)
  - prerequisites: `AdicSpacesPartII:R0/separated-morphism`, `AdicSpacesPartII:R0/universally-closed-and-proper-morphism`, `AdicSpacesPartII:R0/partially-proper-morphism`, `AdicSpacesPartII:R0/adic-valuation-rings-and-centres`, `AdicSpacesPartII:R0/valuative-criterion-separated`, `AdicSpacesPartII:R0/valuative-criterion-specializing`, `AdicSpacesPartII:R0/separated-proper-partially-proper`, `AdicSpacesPartII:R0/proper-iff-partially-proper-quasi-compact`, `AdicSpacesPartII:R0/separated-diagonal-closed-embedding`, `AdicSpacesPartII:R0/diagonal-locally-closed`, `AdicSpacesPartII:R0/closed-embedding-proper`, `AdicSpacesPartII:R0/finite-morphisms`, `AdicSpacesPartII:R0/proper-comp`, `AdicSpacesPartII:R0/proper-base-change`, `AdicSpacesPartII:R0/fibre-products-existence`, `AdicSpacesPartII:R0/finite-type-morphism-classes`, `AdicSpacesPartII:R0/plus-weakly-finite-type`, `AdicSpacesPartII:R0/adic-iff-analytic-locus`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `AdicSpacesPartII:R1/analytification-separated-proper`, `AdicSpacesPartII:R1/proper-separated-comparisons`, `AdicSpacesPartII:R2/formal-rigid-properness-comparison`, `AdicEtaleGeometry:A0/analytic-locus-restriction`
- **The relative closed unit polydisc B^n_X over an adic space** — `AdicEtaleGeometry:A2/relative-closed-polydisc` (construction) — planet *Relative closed unit ball*
  - prerequisites: `AdicSpacesPartII:R0/fibre-products-existence`, `AdicSpacesPartII:R0/fibre-product-along-finite-type`, `AdicSpacesPartII:R0/finite-type-morphism-classes`, `AdicSpacesPartII:R0/discrete-huber-pair-sheafy`, `AdicSpacesPartII:R0/restricted-power-series-smooth`, `AdicSpacesPartII:R0/topologically-finite-type-noetherian-type`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `AdicSpacesPartII:R1/affine-chart-analytification`, `AdicEtaleGeometry:A0/analytic-locus-restriction`, `tauceti:TauCeti.Huber.restrictedMvPowerSeriesCompletion`, `tauceti:TauCeti.ValuationSpectrum.closedPolydisc`, `tauceti:TauCeti.ValuationSpectrum.spa_integralClosure`, `mathlib:MvPolynomial`, `mathlib:CategoryTheory.IsPullback.paste_horiz`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.relativePolydisc`; `AdicSpace.relativePolydisc.proj`; `AdicSpace.relativePolydisc.coord`; `AdicSpace.relativePolydisc.homEquiv`; `AdicSpace.relativePolydisc.affinoidChart`; `Huber.restrictedPowerSeries_plus_isIntegrallyClosed`; `AdicSpace.relativePolydisc.baseChangeIso`; `AdicSpace.relativePolydisc.addIso`; `AdicSpace.relativePolydisc.smooth`; `AdicSpace.relativePolydisc.quasiCompact_proj`; `AdicSpace.relativePolydisc.isLocallyNoetherian`; `AdicSpace.relativePolydisc.isAnalytic`; `AdicSpace.relativePolydisc.isOpenImmersion_affineSpace`; `AdicSpace.relativePolydisc_spa_field`; `AdicSpace.relativePolydisc.zeroIso`
  - unit tests: `relativePolydisc_test_Qp`; `relativePolydisc_test_zero`; `relativePolydisc_test_notAffineLine`; `relativePolydisc_test_rankTwoPlus`; `relativePolydisc_test_closedPolydisc`; `relativePolydisc_test_homEquiv`
- **The relative torus T^n_X ⊆ B^n_X** — `AdicEtaleGeometry:A2/relative-torus` (construction) — planet *Relative torus*
  - prerequisites: `AdicEtaleGeometry:A2/relative-closed-polydisc`, `AdicSpacesPartII:R0/open-embedding-etale`, `AdicSpacesPartII:R0/etale-smooth-composition`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.spaLocalizationHomeomorph`, `mathlib:LaurentPolynomial`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.relativeTorus`; `AdicSpace.relativeTorus.ι`; `AdicSpace.relativeTorus.homEquiv`; `AdicSpace.relativeTorus.affinoidChart`; `AdicSpace.relativeTorus.baseChangeIso`; `AdicSpace.relativeTorus.smooth`; `AdicSpace.relativeTorus.mul`; `AdicSpace.relativeTorus.polydiscEmbedding`; `AdicSpace.relativeTorus.iSup_translate_eq_polydisc`; `AdicSpace.relativeTorus_spa_field`
  - unit tests: `relativeTorus_test_field`; `relativeTorus_test_zero`; `relativeTorus_test_notGm`; `relativeTorus_test_ballEmbedding`; `relativeTorus_test_annulusCover`; `relativeTorus_test_openImmersion`
- **Smooth morphisms of analytic adic spaces by local étale charts over relative balls (ECD 24.4)** — `AdicEtaleGeometry:A2/smooth-morphism-ball-charts` (definition) — planet *Smooth morphism*
  - prerequisites: `AdicEtaleGeometry:A2/relative-closed-polydisc`, `AdicEtaleGeometry:A2/relative-torus`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`, `AdicSpacesPartII:R0/fibre-products-existence`, `AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation`, `AdicEtaleGeometry:A0/analytic-locus-restriction`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-composition`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.IsLocallyEtaleOverPolydisc`; `AdicSpace.IsLocallyEtaleOverPolydisc.exists_chart`; `AdicSpace.IsLocallyEtaleOverPolydisc.of_isEtale`; `AdicSpace.IsLocallyEtaleOverPolydisc.relativePolydisc`; `AdicSpace.IsLocallyEtaleOverPolydisc.comp`; `AdicSpace.IsLocallyEtaleOverPolydisc.baseChange`; `AdicSpace.IsLocallyEtaleOverPolydisc.of_isOpenImmersion_comp`; `AdicSpace.IsLocallyEtaleOverPolydisc.iff_smooth`
  - unit tests: `isLocallyEtaleOverPolydisc_test_polydisc`; `isLocallyEtaleOverPolydisc_test_etale`; `isLocallyEtaleOverPolydisc_test_origin`; `isLocallyEtaleOverPolydisc_test_huber`; `isLocallyEtaleOverPolydisc_test_perfectoidBase`
- **Huber's smooth morphisms are exactly the morphisms locally étale over a relative ball (Huber 1.6.10 globalised)** — `AdicEtaleGeometry:A2/smooth-local-ball-charts` (comparison)
  - prerequisites: `AdicSpacesPartII:R0/smooth-morphism`, `AdicSpacesPartII:R0/smooth-local-structure`, `AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation`, `AdicSpacesPartII:R0/open-embedding-etale`, `AdicSpacesPartII:R0/restricted-power-series-smooth`, `AdicSpacesPartII:R0/etale-smooth-composition`, `AdicSpacesPartII:R0/etale-smooth-locality`, `AdicSpacesPartII:R0/smooth-differentials-locally-free`, `AdicSpacesPartII:R0/first-fundamental-sequence`, `AdicSpacesPartII:R0/infinitesimal-criteria`, `AdicSpacesPartII:R0/differential-criterion-morphism`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `AdicEtaleGeometry:A2/relative-closed-polydisc`, `AdicEtaleGeometry:A2/smooth-morphism-ball-charts`, `AdicEtaleGeometry:A0/analytic-locus-restriction`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`, `AdicEtaleGeometry:A1/etale-base-change`, `AdicEtaleGeometry:A1/etale-composition`
- **Compatible local toric charts for smooth morphisms of smooth rigid spaces** — `AdicEtaleGeometry:A2/relative-toric-charts` (lemma)
  - prerequisites: `AdicSpacesPartII:R0/smooth-local-structure`, `AdicSpacesPartII:R0/smooth-toric-chart`, `AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation`, `AdicSpacesPartII:R0/etale-affinoid-finite-etale-embedding`, `AdicSpacesPartII:R0/etale-smooth-composition`, `AdicSpacesPartII:R0/open-embedding-etale`, `AdicSpacesPartII:R0/smooth-morphism`, `AdicEtaleGeometry:A2/smooth-local-ball-charts`, `AdicEtaleGeometry:A2/relative-torus`, `AdicEtaleGeometry:A2/relative-closed-polydisc`, `AdicEtaleGeometry:A0/rational-pullback-comparison`, `AdicEtaleGeometry:A0/finite-etale-pullback-comparison`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets`
- **Dimension, pure dimension and relative dimension of adic spaces (Huber 1.8.1)** — `AdicEtaleGeometry:A2/dimension-of-adic-spaces` (definition) — planet *Dimension of adic spaces*
  - prerequisites: `mathlib:topologicalKrullDim`, `mathlib:Order.krullDim`, `mathlib:Specializes`, `mathlib:QuasiSober`, `mathlib:genericPoint`, `mathlib:Topology.IsInducing.topologicalKrullDim_le`, `mathlib:IsHomeomorph.topologicalKrullDim_eq`, `mathlib:ringKrullDim`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.dim`; `AdicSpace.dim_eq_iSup_specializationChain`; `AdicSpace.IsPureDim`; `AdicSpace.relDim`; `AdicSpace.IsPureRelDim`; `AdicSpace.dim_le_of_isOpenImmersion`; `AdicSpace.dim_eq_iSup_of_openCover`; `AdicSpace.dim_spa_field`; `AdicSpace.dim_congr_homeomorph`; `AdicSpace.IsPureDim.iff_localRing_dim`
  - unit tests: `dim_test_field`; `dim_test_disc`; `dim_test_empty`; `dim_test_notRingDim`; `dim_test_topologicalKrullDim`
- **Relative pure dimension is detected on the fibres over rank-one points (Huber 1.8.7)** — `AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres` (lemma)
  - prerequisites: `AdicEtaleGeometry:A2/dimension-of-adic-spaces`, `AdicSpacesPartII:R0/fibre-products-existence`, `AdicSpacesPartII:R0/fibre-product-points`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `tauceti:TauCeti.ValuationSpectrum.IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic`
- **Smooth morphisms of rank-d differentials have relative pure dimension d** — `AdicEtaleGeometry:A2/smooth-pure-relative-dimension` (lemma)
  - prerequisites: `AdicEtaleGeometry:A2/dimension-of-adic-spaces`, `AdicEtaleGeometry:A2/relative-dimension-rank-one-fibres`, `AdicEtaleGeometry:A2/smooth-local-ball-charts`, `AdicEtaleGeometry:A2/relative-closed-polydisc`, `AdicEtaleGeometry:A2/relative-torus`, `AdicSpacesPartII:R0/smooth-morphism`, `AdicSpacesPartII:R0/smooth-differentials-locally-free`
- **Morphisms of weakly finite type to a quasi-compact base have finite dimension** — `AdicEtaleGeometry:A2/weakly-finite-type-finite-dimension` (lemma)
  - prerequisites: `AdicEtaleGeometry:A2/dimension-of-adic-spaces`, `AdicEtaleGeometry:A2/smooth-pure-relative-dimension`, `AdicEtaleGeometry:A2/relative-closed-polydisc`, `AdicSpacesPartII:R0/finite-type-morphism-classes`, `AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`
- **Relative analytification over an affinoid pair: the affine space is the union of relative polydiscs, on the same carriers** — `AdicEtaleGeometry:A2/analytification-relative-polydisc-comparison` (comparison)
  - prerequisites: `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `AdicSpacesPartII:R1/affine-chart-analytification`, `AdicSpacesPartII:R1/analytification-functor`, `AdicSpacesPartII:R1/analytic-affine-space`, `AdicSpacesPartII:R1/analytification-separated-proper`, `AdicSpacesPartII:R1/analytification-reflects-etale-smooth`, `AdicSpacesPartII:R1/analytic-kahler-differentials`, `AdicSpacesPartII:R4/analytification-etale-site`, `AdicEtaleGeometry:A2/relative-closed-polydisc`, `AdicEtaleGeometry:A2/relative-torus`, `AdicEtaleGeometry:A2/smooth-local-ball-charts`
- **Smooth charts form a covering of the étale site of A1** — `AdicEtaleGeometry:A2/smooth-etale-site-compatibility` (comparison)
  - prerequisites: `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`, `AdicSpacesPartII:R4/etale-site-on-analytic-carriers`, `AdicSpacesPartII:R4/etale-site-functoriality`, `AdicSpacesPartII:R0/open-embedding-etale`, `AdicSpacesPartII:R0/infinitesimal-criteria`, `AdicSpacesPartII:R0/etale-smooth-composition`, `AdicSpacesPartII:R0/first-fundamental-sequence`, `AdicSpacesPartII:R0/differential-criterion-morphism`, `AdicSpacesPartII:R0/smooth-toric-chart`, `AdicEtaleGeometry:A2/smooth-local-ball-charts`, `AdicEtaleGeometry:A2/relative-closed-polydisc`, `AdicEtaleGeometry:A2/relative-toric-charts`, `AdicEtaleGeometry:A2/relative-torus`, `mathlib:CategoryTheory.GrothendieckTopology`, `AdicEtaleGeometry:A1/etale-site`
- **Huber's generic fibre of a noetherian formal scheme is the analytic locus of its adic space** — `AdicEtaleGeometry:A2/formal-generic-fibre-analytic-locus` (comparison)
  - prerequisites: `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`, `AdicSpacesPartII:R2/formal-schemes-of-type-S`, `AdicSpacesPartII:R2/noetherian-formal-scheme-as-adic-space`, `AdicSpacesPartII:R2/generic-fibre-functor-d`, `AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison`, `AdicSpacesPartII:R2/admissible-formal-scheme`, `AdicEtaleGeometry:A0/analytic-locus-restriction`

### A3. The nonnoetherian affinoid étale approximation input

- **Pseudocoherent and finite-projective-dimension modules over a commutative ring (Kedlaya–Liu II, Definition 1.1.1)** — `AdicEtaleGeometry:A3/pseudocoherent-module` (definition)
  - prerequisites: `mathlib:Module.Finite`, `mathlib:Module.FinitePresentation`, `mathlib:Module.FinitePresentation.fg_ker`, `mathlib:Module.Projective`, `mathlib:Module.Flat`, `mathlib:TensorProduct`
  - API: `Module.IsPseudoCoherent`; `Module.IsFPD`; `Module.IsPseudoCoherent.zero_iff` (characterisation: M is 0-pseudocoherent iff `Module.Finite R M`.); `Module.IsPseudoCoherent.one_iff` (characterisation: M is 1-pseudocoherent iff `Module.FinitePresentation R M`.); `Module.IsPseudoCoherent.of_projective` (constructor: A finitely generated projective module is pseudocoherent and 0-fpd.); `Module.IsFPD.isPseudoCoherent` (relation: An fpd module is pseudocoherent.); `Module.IsPseudoCoherent.mono` (relation: m-pseudocoherent implies m'-pseudocoherent for m' ≤ m.); `Module.IsPseudoCoherent.tensorProduct` (other: If M is flat and M, N are m-pseudocoherent, then M ⊗_R N is m-pseudocoherent; with M flat, an m-fpd M and an n-fpd N give an (m+n)-fpd M ⊗_R N (Kedlaya–Liu II, Remark 1.1.3: totalise the tensor product of resolutions). Without flatness the underived tensor product need not be pseudocoherent: in a non-coherent domain, R/(f) ⊗_R R/(g) = R/(f, g) with both factors 1-fpd can fail to be 2-pseudocoherent; the general statement concerns the derived tensor product.); `Module.IsPseudoCoherent.baseChange_of_flat` (functoriality: Along a flat ring map R → S, base change takes m-pseudocoherent (m-fpd) modules to m-pseudocoherent (m-fpd) modules and is exact on them.); `Module.IsPseudoCoherent.baseChange_of_isPseudoCoherent_algebra` (functoriality: If S is a finite R-algebra that is pseudocoherent as an R-module, an S-module is pseudocoherent over S if and only if it is pseudocoherent over R (Stacks Tag 064Z). Base change S ⊗_R M of a pseudocoherent R-module M is pseudocoherent over S when Tor^R_i(S, M) = 0 for i > 0 (for instance S flat, Module.IsPseudoCoherent.baseChange_of_flat); without that vanishing it can fail (S = R/(g), M = R/(f) in a non-coherent domain).); `Module.IsPseudoCoherent.of_isNoetherianRing` (compatibility: Over a noetherian ring every finitely generated module is pseudocoherent.)
  - unit tests: `Module.IsPseudoCoherent.test_quotient_nonZeroDivisor` (computation: If f ∈ R is a non-zero-divisor then R/fR is 1-fpd and pseudocoherent, with resolution 0 → R →(×f) R → R/fR → 0.); `Module.IsPseudoCoherent.test_finiteProjective` (degenerate: A finitely generated projective R-module is 0-fpd and pseudocoherent; the zero module is 0-fpd.); `Module.IsPseudoCoherent.test_not_two` (non-example: For R = k[x, y₁, y₂, …]/(x·yᵢ : i ≥ 1) (k a field) the module R/xR is finitely presented but not 2-pseudocoherent, because the kernel xR ≅ R/Ann(x) of R → R/xR is not finitely presented (Ann(x) = (y₁, y₂, …) is not finitely generated). A definition 'pseudocoherent := finitely presented' fails this test.); `Module.IsPseudoCoherent.test_noetherian` (compatibility: If R is noetherian, an R-module is pseudocoherent iff it is finitely generated (Mathlib `Module.Finite`).)
- **Two-out-of-three for pseudocoherent and fpd modules (Kedlaya–Liu II, Lemma 1.1.5)** — `AdicEtaleGeometry:A3/pseudocoherent-two-out-of-three` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/pseudocoherent-module`, `mathlib:Module.FinitePresentation.fg_ker`, `mathlib:Module.Projective`
- **Quotients by weakly regular sequences are fpd, with free conormal module** — `AdicEtaleGeometry:A3/koszul-regular-sequence-fpd` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/pseudocoherent-module`, `AdicEtaleGeometry:A3/pseudocoherent-two-out-of-three`, `mathlib:RingTheory.Sequence.IsWeaklyRegular`, `mathlib:Ideal.Cotangent`, `mathlib:Module.Flat`
- **Natural topology and strictness for finitely generated modules over a complete Tate ring (Kedlaya–Liu II, §1.2)** — `AdicEtaleGeometry:A3/natural-topology-strict-exactness` (lemma)
  - prerequisites: `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.IsTateRing.isOpenMap`, `tauceti:TauCeti.Huber.IsTateRing.isStrictMap_of_isClosed_range`, `tauceti:TauCeti.Huber.isClosed_of_module_finite_topologicalClosure`, `tauceti:TauCeti.completeSpace_moduleTopology`, `mathlib:moduleTopology`, `mathlib:IsModuleTopology`, `mathlib:Topology.IsStrictMap`, `AdicSpacesPartII:R0/strict-complex-completion-exact`
- **Strictly and stably pseudocoherent modules over a complete Tate Huber pair (Kedlaya–Liu II, Definitions 1.2.13 and 2.4.1)** — `AdicEtaleGeometry:A3/stably-pseudocoherent-module` (definition) — planet *Stably pseudocoherent module*
  - prerequisites: `AdicEtaleGeometry:A3/pseudocoherent-module`, `AdicEtaleGeometry:A3/natural-topology-strict-exactness`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.PairOfDefinition.completionLocalization`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `mathlib:moduleTopology`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`
  - API: `Huber.IsStrictlyPseudoCoherent`; `Huber.IsStablyPseudoCoherent`; `Huber.IsStablyFPD`; `Huber.IsStablyPseudoCoherent.isStrictlyPseudoCoherent` (relation: Stably implies strictly (identity localisation).); `Huber.IsStablyFPD.isStablyPseudoCoherent` (relation: Stably fpd implies stably pseudocoherent.); `Huber.IsStablyPseudoCoherent.of_projective` (constructor: Finite projective modules are stably pseudocoherent and stably 0-fpd.); `Huber.IsStablyPseudoCoherent.completeSpace` (projection: A stably (or strictly) pseudocoherent module is complete Hausdorff for its natural topology.); `Huber.IsStablyPseudoCoherent.baseChange` (functoriality: Over a sheafy pair, for m ∈ {2, ∞}, M ⊗_A B is stably m-pseudocoherent over each rational localisation B (A3/rational-localisation-pseudoflat).); `Huber.IsStablyPseudoCoherent.of_exact` (relation: Over a sheafy pair, two-out-of-three for stably pseudocoherent modules in short exact sequences (A3/pseudocoherent-two-out-of-three with the exactness of base change from A3/rational-localisation-pseudoflat).); `Huber.IsStablyPseudoCoherent.of_isStronglyNoetherian` (compatibility: Over a strongly noetherian Tate ring, finite modules are stably pseudocoherent.)
  - unit tests: `Huber.IsStablyPseudoCoherent.test_finiteProjective` (degenerate: A finite projective A-module P is stably pseudocoherent and stably 0-fpd: P ⊗_A B is finite projective over B, hence complete.); `Huber.IsStablyPseudoCoherent.test_tateAlgebra_quotient` (computation: For A = ℚ_p⟨T⟩ (strongly noetherian) the module M = A/TA is stably 1-fpd, and for every rational localisation B, M ⊗_A B = B/TB.); `Huber.IsStablyPseudoCoherent.test_not_stably` (non-example: Kedlaya–Liu II, Example 2.4.2: there is an affinoid perfectoid (A, A⁺) and a non-zero-divisor f with fA closed (so A/fA strictly pseudocoherent) but fB not closed for some rational localisation B, so A/fA is not stably pseudocoherent. A definition using only completeness of M itself fails this test.); `Huber.IsStablyPseudoCoherent.test_strongly_noetherian` (compatibility: If A is strongly noetherian (Tau Ceti `IsStronglyNoetherian`), an A-module is stably pseudocoherent iff it is finitely generated.)
- **Pseudoflat modules over a complete Tate Huber pair (Kedlaya–Liu II, Definition 2.4.4)** — `AdicEtaleGeometry:A3/pseudoflat-module` (definition)
  - prerequisites: `AdicEtaleGeometry:A3/stably-pseudocoherent-module`, `mathlib:Module.Flat`, `mathlib:TensorProduct`
  - API: `Huber.IsPseudoFlat`; `Huber.IsProProjective`; `Huber.IsPseudoFlat.of_flat` (constructor: Flat modules are pseudoflat.); `Huber.IsPseudoFlat.of_isProProjective` (constructor: Pro-projective modules are 2-pseudoflat (A3/restricted-power-series-pro-projective).); `Huber.IsPseudoFlat.iff_injective_rTensor` (characterisation: The Remark 2.4.5(c) criterion.); `Huber.IsPseudoFlat.mono` (relation: m-pseudoflat implies m'-pseudoflat for m' ≥ m; 2-pseudoflat implies pseudoflat.); `Huber.IsPseudoFlat.comp` (relation: For m ∈ {2, ∞}, an m-pseudoflat rational localisation followed by an m-pseudoflat morphism is m-pseudoflat.); `Huber.IsPseudoFlat.baseChange_isStablyPseudoCoherent` (functoriality: For m ∈ {2, ∞} and an m-pseudoflat rational localisation A → B, M ↦ M ⊗_A B carries stably m-pseudocoherent A-modules to stably m-pseudocoherent B-modules and is exact on them.)
  - unit tests: `Huber.IsPseudoFlat.test_flat` (compatibility: A flat A-module (Mathlib `Module.Flat`) is m-pseudoflat for every m.); `Huber.IsPseudoFlat.test_restrictedPowerSeries` (computation: For every complete Tate pair (A, A⁺), A⟨T⟩ and A⟨T^{±1}⟩ are pro-projective, hence 2-pseudoflat.); `Huber.IsPseudoFlat.test_quotient_not` (non-example: For A = ℚ_p⟨T⟩ and B = A/TA: A/TA is stably pseudocoherent and Tor₁^A(A/TA, A/TA) ≅ A/TA ≠ 0, so B is not 1-pseudoflat (a quotient by a non-zero-divisor is never pseudoflat when the quotient is nonzero).); `Huber.IsPseudoFlat.test_iff_injective` (characterisation: B is m-pseudoflat iff M ⊗_A B → N ⊗_A B is injective for all 0 → M → N → P → 0 with N finite projective and P stably m-pseudocoherent (Kedlaya–Liu II, Remark 2.4.5(c)).)
- **Restricted power series and Laurent series are pro-projective; M ⊗_A A⟨T⟩ = M⟨T⟩ (Kedlaya–Liu II, Lemma 2.4.7, Corollaries 2.4.8–2.4.9)** — `AdicEtaleGeometry:A3/restricted-power-series-pro-projective` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/pseudoflat-module`, `AdicEtaleGeometry:A3/stably-pseudocoherent-module`, `AdicEtaleGeometry:A3/natural-topology-strict-exactness`, `tauceti:TauCeti.Huber.restrictedMvPowerSeriesCompletion`
- **Strictness of multiplication by T − f and 1 − fT on Tate algebras over a sheafy pair (Kedlaya–Liu II, Lemma 2.4.10)** — `AdicEtaleGeometry:A3/simple-laurent-strict-multiplication` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/natural-topology-strict-exactness`, `AdicEtaleGeometry:A3/restricted-power-series-pro-projective`, `AdicSpacesPartII:R3/sheafy-cech-acyclicity`, `tauceti:TauCeti.Huber.restrictedMvPowerSeriesCompletion`, `tauceti:TauCeti.Huber.PairOfDefinition.rationalEvalHom_surjective`, `tauceti:TauCeti.Huber.PairOfDefinition.completionLocalization`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-4-sheafiness-and-tate-acyclicity`
- **The three rational localisations of a simple Laurent covering are 2-pseudoflat (Kedlaya–Liu II, Lemmas 2.4.12–2.4.13)** — `AdicEtaleGeometry:A3/simple-laurent-pseudoflat` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/simple-laurent-strict-multiplication`, `AdicEtaleGeometry:A3/restricted-power-series-pro-projective`, `AdicEtaleGeometry:A3/pseudoflat-module`, `AdicEtaleGeometry:A3/pseudocoherent-two-out-of-three`, `AdicSpacesPartII:R3/simple-laurent-glueing-square`
- **Reduction of properties of rational inclusions to simple Laurent pieces (Kedlaya–Liu I, Proposition 2.4.24)** — `AdicEtaleGeometry:A3/rational-inclusion-reduction` (lemma)
  - prerequisites: `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.PairOfDefinition.completionLocalization`, `AdicSpacesPartII:R3/rational-covering-reduction`
- **Rational localisations of sheafy Tate pairs are 2-pseudoflat (Kedlaya–Liu II, Theorem 2.4.15)** — `AdicEtaleGeometry:A3/rational-localisation-pseudoflat` (theorem)
  - prerequisites: `AdicEtaleGeometry:A3/rational-inclusion-reduction`, `AdicEtaleGeometry:A3/simple-laurent-pseudoflat`, `AdicEtaleGeometry:A3/pseudoflat-module`, `AdicEtaleGeometry:A3/stably-pseudocoherent-module`, `AdicEtaleGeometry:A3/pseudocoherent-two-out-of-three`
- **Tate acyclicity for stably pseudocoherent modules (Kedlaya–Liu II, Theorem 2.5.1)** — `AdicEtaleGeometry:A3/pseudocoherent-tate-acyclicity` (theorem)
  - prerequisites: `AdicEtaleGeometry:A3/stably-pseudocoherent-module`, `AdicEtaleGeometry:A3/rational-localisation-pseudoflat`, `AdicEtaleGeometry:A3/simple-laurent-pseudoflat`, `AdicSpacesPartII:R3/cech-acyclicity-simple-laurent-reduction`, `AdicSpacesPartII:R3/sheafy-cech-acyclicity`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`
- **Finite projective dimension is local on rational coverings for stably pseudocoherent modules (Kedlaya–Liu II, Corollary 2.5.2)** — `AdicEtaleGeometry:A3/fpd-local-to-global` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/pseudocoherent-tate-acyclicity`, `AdicEtaleGeometry:A3/rational-localisation-pseudoflat`, `AdicEtaleGeometry:A3/pseudocoherent-two-out-of-three`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `AdicSpacesPartII:R3/locally-free-sheaf`, `mathlib:Module.Projective`
- **Pseudocoherent and fpd sheaves of O-modules on adic spaces (Kedlaya–Liu II, Definition 2.5.3)** — `AdicEtaleGeometry:A3/pseudocoherent-sheaf` (definition)
  - prerequisites: `AdicEtaleGeometry:A3/stably-pseudocoherent-module`, `AdicEtaleGeometry:A3/pseudocoherent-tate-acyclicity`, `AdicEtaleGeometry:A3/rational-localisation-pseudoflat`, `AdicSpacesPartII:R3/locally-free-sheaf`, `AdicSpacesPartII:R3/coherent-sheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
  - API: `AdicSpace.IsPseudoCoherentSheaf`; `AdicSpace.IsFPDSheaf`; `AdicSpace.IsPseudoCoherentSheaf.of_module` (constructor: For (A, A⁺) sheafy and M stably pseudocoherent, M̃ is pseudocoherent on Spa(A, A⁺).); `AdicSpace.IsPseudoCoherentSheaf.restrict` (functoriality: Restriction to open subspaces preserves pseudocoherence.); `AdicSpace.IsPseudoCoherentSheaf.ker_of_surjective` (relation: The kernel of a surjection of pseudocoherent sheaves is pseudocoherent.); `AdicSpace.IsPseudoCoherentSheaf.coker_of_injective` (relation: The cokernel of an injection of pseudocoherent sheaves is pseudocoherent.); `AdicSpace.IsPseudoCoherentSheaf.isStablyPseudoCoherent_sections` (projection: On a sheafy affinoid, the global sections of a pseudocoherent sheaf form a stably pseudocoherent module (A3/pseudocoherent-kiehl-gluing).); `AdicSpace.IsPseudoCoherentSheaf.equivModule` (equivalence: On Spa(A, A⁺) sheafy, pseudocoherent sheaves ≌ stably pseudocoherent A-modules (A3/pseudocoherent-kiehl-gluing).); `AdicSpace.IsFPDSheaf.isPseudoCoherentSheaf` (relation: fpd sheaves are pseudocoherent.)
  - unit tests: `AdicSpace.IsPseudoCoherentSheaf.test_structureSheaf` (degenerate: On X = Spa(A, A⁺) with (A, A⁺) sheafy complete Tate, O_X = Ã is pseudocoherent and fpd.); `AdicSpace.IsPseudoCoherentSheaf.test_vectorBundle` (compatibility: A vector bundle (AdicSpacesPartII:R3/locally-free-sheaf) on a sheafy Tate affinoid is an fpd pseudocoherent sheaf, and its global sections are the finite projective module of AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing.); `AdicSpace.IsPseudoCoherentSheaf.test_tateAlgebra_ideal` (computation: For X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) and J = (T), the sheaves J̃ and (ℚ_p⟨T⟩/J)~ are pseudocoherent, with (ℚ_p⟨T⟩/J)~(U) = O(U)/T·O(U) on rational U, and they coincide with the coherent sheaves of AdicSpacesPartII:R3/coherent-sheaf.); `AdicSpace.IsPseudoCoherentSheaf.test_pushforward_not` (non-example: For X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) and the rational open immersion j : U = {|T| ≤ |p|} → X, the sheaf j_*O_U is not pseudocoherent: its global sections O(U) = ℚ_p⟨T/p⟩ are not a finitely generated ℚ_p⟨T⟩-module. A definition asking only that F be locally a module tensored with O fails this test.)
- **Effective descent of stably pseudocoherent modules along a simple Laurent covering (Kedlaya–Liu II, Lemma 2.5.4)** — `AdicEtaleGeometry:A3/simple-laurent-pseudocoherent-descent` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/pseudocoherent-tate-acyclicity`, `AdicEtaleGeometry:A3/fpd-local-to-global`, `AdicEtaleGeometry:A3/rational-localisation-pseudoflat`, `AdicEtaleGeometry:A3/pseudocoherent-two-out-of-three`, `AdicEtaleGeometry:A3/natural-topology-strict-exactness`, `AdicSpacesPartII:R3/glueing-square-finite-surjectivity`, `AdicSpacesPartII:R3/simple-laurent-glueing-square`
- **Kiehl gluing for pseudocoherent sheaves on sheafy Tate affinoids (Kedlaya–Liu II, Theorem 2.5.5 and Corollary 2.5.6)** — `AdicEtaleGeometry:A3/pseudocoherent-kiehl-gluing` (theorem) — planet *Pseudocoherent Kiehl gluing*
  - prerequisites: `AdicEtaleGeometry:A3/pseudocoherent-tate-acyclicity`, `AdicEtaleGeometry:A3/simple-laurent-pseudocoherent-descent`, `AdicEtaleGeometry:A3/rational-localisation-pseudoflat`, `AdicEtaleGeometry:A3/pseudocoherent-sheaf`, `AdicEtaleGeometry:A3/stably-pseudocoherent-module`, `AdicSpacesPartII:R3/rational-covering-reduction`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-4-sheafiness-and-tate-acyclicity`
- **Multivariable Newton–Hensel lemma for restricted power series over a complete Tate ring** — `AdicEtaleGeometry:A3/restricted-power-series-newton` (lemma)
  - prerequisites: `tauceti:TauCeti.Huber.PairOfDefinition`, `tauceti:TauCeti.Huber.IsPseudoUniformizer`, `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.restrictedMvPowerSeriesCompletion`, `mathlib:MvPowerSeries.pderiv`, `mathlib:Polynomial.hasseDeriv`
- **Small perturbations of topological generators: automorphisms of A⟨X⟩ and transport of presentations** — `AdicEtaleGeometry:A3/perturbation-of-generators` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/restricted-power-series-newton`, `tauceti:TauCeti.Huber.restrictedMvPowerSeriesCompletion`, `tauceti:TauCeti.Huber.existsUnique_continuous_ringHom_completion_weightedRestrictedSubring`, `tauceti:TauCeti.Huber.Pair.quotient`, `tauceti:TauCeti.Huber.PairOfDefinition`
- **Standard étale presentations of complete Huber pairs over a complete Tate pair** — `AdicEtaleGeometry:A3/standard-etale-presentation` (definition) — planet *Standard étale presentation*
  - prerequisites: `tauceti:TauCeti.Huber.restrictedMvPowerSeriesCompletion`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.Pair.Hom`, `tauceti:TauCeti.Huber.Pair.quotient`, `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.IsPseudoUniformizer`, `mathlib:MvPowerSeries.pderiv`, `mathlib:Algebra.PreSubmersivePresentation.jacobian`, `AdicSpacesPartII:R0/completed-tensor-restricted-power-series`, `AdicSpacesPartII:R0/continuous-differentials`
  - API: `Huber.StandardEtalePresentation`; `Huber.StandardEtalePresentation.jacobian` (data: J_F = det(∂Fᵢ/∂T_j) ∈ A⁺⟨T⟩.); `Huber.StandardEtalePresentation.isUnit_jacobian` (projection: π(J_F) is a unit of C and ϖᵏπ(J_F)^{−1} ∈ C⁺.); `Huber.StandardEtalePresentation.quotientEquiv` (equivalence: (C, C⁺) ≅ `Pair.quotient` (A⟨T⟩, A⁺⟨T⟩) (closure of (F)) as Huber pairs over (A, A⁺).); `Huber.StandardEtalePresentation.withInverse` (constructor: The explicit-inverse form (N+1, (F, S·J_F − ϖᵏ), 2k, ·).); `Huber.StandardEtalePresentation.ofRational` (constructor: The presentation of a rational localisation (A3/standard-presentation-basic-pieces (a)).); `Huber.StandardEtalePresentation.ofFiniteEtale` (constructor: The presentation of a finite étale algebra (A3/standard-presentation-basic-pieces (b)).); `Huber.StandardEtalePresentation.comp` (constructor: Composite of presentations (A3/standard-presentation-basic-pieces (c)).); `Huber.StandardEtalePresentation.baseChange` (functoriality: For a morphism of complete Tate pairs (A, A⁺) → (A', A'⁺), the image of F presents C ⊗̂_A A' (AdicSpacesPartII:R0/completed-tensor-restricted-power-series (c)).); `Huber.StandardEtalePresentation.kaehler_eq_zero` (characterisation: The continuous differentials vanish: Ω^c_{C/A} = 0 (AdicSpacesPartII:R0/continuous-differentials (c): the presentation matrix is invertible).); `Huber.StandardEtalePresentation.tube` (other: The tube rational subset W ⊆ B^N_X of A3/tubular-neighbourhood.); `Huber.StandardEtalePresentation.perturb` (other: The isomorphism attached to a nearby presentation (A3/standard-presentation-perturbation).)
  - unit tests: `Huber.StandardEtalePresentation.test_rational` (computation: For s₁, …, s_n, t ∈ A⁺ with ϖ^c among the sᵢ, (n, (tTᵢ − sᵢ)ᵢ, cn, Tᵢ ↦ sᵢ/t) is a standard étale presentation of the rational localisation A⟨s/t⟩ with its plus ring; J = tⁿ and ϖ^{cn}t^{−n} ∈ A⟨s/t⟩⁺ because |t| ≥ |ϖ^c| on R(s/t).); `Huber.StandardEtalePresentation.test_zero` (degenerate: N = 0, F = (), k = 0, π = id presents (A, A⁺); J = 1.); `Huber.StandardEtalePresentation.test_frobenius_not` (non-example: Over A = F_p((t^{1/p^∞}))^ with A⁺ = A°, F = T^p − a (a ∈ A⁺) is not a standard étale presentation of A⟨T⟩/(T^p − a): J_F = pT^{p−1} = 0. A definition asking only for N equations in N variables fails this test.); `Huber.StandardEtalePresentation.test_finiteEtale` (compatibility: If S is a finite étale A-algebra (Mathlib `Algebra.Etale`, `Module.Finite`) with its natural topology and S⁺ the integral closure of A⁺, then a submersive presentation of relative dimension 0 (Mathlib `Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`), rescaled into S⁺, is a standard étale presentation of (S, S⁺).)
- **Rational localisations, finite étale algebras and their composites have standard étale presentations** — `AdicEtaleGeometry:A3/standard-presentation-basic-pieces` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/standard-etale-presentation`, `AdicEtaleGeometry:A3/natural-topology-strict-exactness`, `tauceti:TauCeti.Huber.PairOfDefinition.rationalEvalHom_surjective`, `tauceti:TauCeti.Huber.PairOfDefinition.completionLocalization`, `tauceti:TauCeti.ValuationSpectrum.mem_iff_forall_vle_one`, `AdicSpacesPartII:R0/completed-tensor-restricted-power-series`, `mathlib:Algebra.Etale`, `mathlib:Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`, `mathlib:Algebra.SubmersivePresentation`, `mathlib:Module.Finite`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`
- **Tubular neighbourhoods of standard étale loci: a nonarchimedean implicit function theorem** — `AdicEtaleGeometry:A3/tubular-neighbourhood` (theorem) — planet *Nonarchimedean implicit function theorem*
  - prerequisites: `AdicEtaleGeometry:A3/restricted-power-series-newton`, `AdicSpacesPartII:R5/sousperfectoid-stably-uniform`, `AdicSpacesPartII:R5/sousperfectoid-rings`, `tauceti:TauCeti.ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`, `tauceti:TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`, `tauceti:TauCeti.Huber.existsUnique_continuous_ringHom_completion_weightedRestrictedSubring`, `tauceti:TauCeti.Huber.PairOfDefinition.completionLocalization`, `tauceti:TauCeti.ValuationSpectrum.mem_iff_forall_vle_one`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `AdicSpacesPartII:R0/completed-tensor-rational-localisation`, `AdicSpacesPartII:R0/completed-tensor-restricted-power-series`, `AdicSpacesPartII:R0/continuous-differentials`
- **Stability of standard étale presentations under perturbation (nonnoetherian replacement of Huber 1.7.2)** — `AdicEtaleGeometry:A3/standard-presentation-perturbation` (theorem)
  - prerequisites: `AdicEtaleGeometry:A3/standard-etale-presentation`, `AdicEtaleGeometry:A3/tubular-neighbourhood`, `AdicEtaleGeometry:A3/restricted-power-series-newton`, `tauceti:TauCeti.ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`, `AdicSpacesPartII:R0/etale-presentation-perturbation`
- **Standard étale loci over sousperfectoid bases are sousperfectoid affinoids (the étale case of Fargues–Scholze IV.4.17)** — `AdicEtaleGeometry:A3/standard-etale-locus-sousperfectoid` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/tubular-neighbourhood`, `AdicEtaleGeometry:A3/standard-etale-presentation`, `AdicEtaleGeometry:A3/standard-presentation-basic-pieces`, `AdicSpacesPartII:R5/sousperfectoid-ring`, `AdicSpacesPartII:R5/sousperfectoid-rings`, `AdicSpacesPartII:R5/sousperfectoid-rational-localisation`, `AdicSpacesPartII:R5/sousperfectoid-sheafy`, `AdicSpacesPartII:R5/sousperfectoid-stably-uniform`, `AdicSpacesPartII:R5/sousperfectoid-adic-space`
- **The equations of a standard étale locus form a regular sequence with closed ideal on its tube (analytic replacement of Fargues–Scholze, Lemma IV.4.13)** — `AdicEtaleGeometry:A3/fs-iv-4-13-regular-sequence` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/tubular-neighbourhood`, `AdicEtaleGeometry:A3/koszul-regular-sequence-fpd`, `AdicEtaleGeometry:A3/stably-pseudocoherent-module`, `mathlib:RingTheory.Sequence.IsWeaklyRegular`
- **A perfectoid Tate ring of characteristic p is an algebra over a perfectoid field and a completed colimit of p-finite algebras** — `AdicEtaleGeometry:A3/char-p-perfectoid-base-field` (lemma)
  - prerequisites: `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `PerfectoidSpaces:P1/perfectoid-field-definition`, `PerfectoidSpaces:P2/completed-direct-limits-of-p-finite-affinoids`, `mathlib:PerfectRing`, `mathlib:frobenius`, `tauceti:TauCeti.Huber.IsPseudoUniformizer`
- **Jacobian criterion over characteristic-p perfectoid bases: standard étale loci are étale, and affinoid perfectoid over X (Fargues–Scholze IV.4.15(ii) and IV.4.17, characteristic-p étale case)** — `AdicEtaleGeometry:A3/jacobian-criterion-char-p` (theorem)
  - prerequisites: `AdicEtaleGeometry:A3/char-p-perfectoid-base-field`, `AdicEtaleGeometry:A3/standard-etale-presentation`, `AdicEtaleGeometry:A3/standard-presentation-perturbation`, `AdicEtaleGeometry:A3/standard-etale-locus-sousperfectoid`, `AdicSpacesPartII:R0/etale-local-structure`, `AdicSpacesPartII:R0/etale-affinoid-finite-etale-embedding`, `AdicSpacesPartII:R0/etale-local-open-finite-etale-factorisation`, `AdicSpacesPartII:R5/sousperfectoid-etale-base-change`, `AdicSpacesPartII:R5/sousperfectoid-rings`, `AdicSpacesPartII:R5/sousperfectoid-rational-localisation`, `AdicSpacesPartII:R0/completed-tensor-restricted-power-series`, `AdicSpacesPartII:R0/affinoid-fibre-product`, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`, `PerfectoidSpaces:P3/almost-purity-theorem`, `PerfectoidSpaces:P3/strongly-etale-morphisms-and-base-change`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `tauceti:TauCeti.ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`, `mathlib:PerfectRing`
- **Local presentations of a closed subspace from integral cut-offs and graphs; pseudocoherence of its ideal** — `AdicEtaleGeometry:A3/integral-cutoff-graph-presentation` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/perturbation-of-generators`, `AdicEtaleGeometry:A3/standard-etale-presentation`, `AdicEtaleGeometry:A3/tubular-neighbourhood`, `AdicEtaleGeometry:A3/fs-iv-4-13-regular-sequence`, `AdicEtaleGeometry:A3/pseudocoherent-module`, `AdicEtaleGeometry:A3/pseudocoherent-two-out-of-three`, `AdicEtaleGeometry:A3/pseudocoherent-sheaf`, `AdicEtaleGeometry:A3/stably-pseudocoherent-module`, `AdicEtaleGeometry:A3/pseudocoherent-kiehl-gluing`, `tauceti:TauCeti.ValuationSpectrum.mem_iff_forall_vle_one`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `AdicSpacesPartII:R0/completed-tensor-rational-localisation`, `AdicSpacesPartII:R0/completed-tensor-restricted-power-series`, `AdicSpacesPartII:R5/sousperfectoid-rings`, `AdicSpacesPartII:R5/sousperfectoid-sheafy`
- **Zariski closed immersions of affinoid étale perfectoid spaces into relative balls (Fargues–Scholze IV.4.19–IV.4.20, perfectoid-base specialisation)** — `AdicEtaleGeometry:A3/fs-iv-4-19-zariski-closed-char-p` (theorem)
  - prerequisites: `AdicEtaleGeometry:A3/integral-cutoff-graph-presentation`, `AdicEtaleGeometry:A3/etale-standard-piece-cover`, `AdicEtaleGeometry:A3/pseudocoherent-kiehl-gluing`, `AdicEtaleGeometry:A3/pseudocoherent-sheaf`, `AdicEtaleGeometry:A3/stably-pseudocoherent-module`, `AdicSpacesPartII:R5/sousperfectoid-rings`, `AdicSpacesPartII:R5/sousperfectoid-sheafy`, `AdicSpacesPartII:R5/sousperfectoid-rational-localisation`, `tauceti:TauCeti.ValuationSpectrum.mem_iff_forall_vle_one`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `PerfectoidSpaces:P3/strongly-etale-morphisms-and-base-change`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`
- **Affinoid étale perfectoid spaces have standard rational coverings by standard étale pieces** — `AdicEtaleGeometry:A3/etale-standard-piece-cover` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/standard-presentation-basic-pieces`, `PerfectoidSpaces:P3/strongly-etale-morphisms-and-base-change`, `PerfectoidSpaces:P3/strongly-finite-etale-maps-are-affinoid-over-affinoids`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `tauceti:TauCeti.ValuationSpectrum.exists_span_eq_top_forall_rationalSubset_subset_of_isTateRing`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`
- **Local plus-generators on a rational subset are approximated by elements integral over global plus elements and ratios** — `AdicEtaleGeometry:A3/integral-approximation-of-generators` (lemma)
  - prerequisites: `tauceti:TauCeti.Huber.PairOfDefinition.completionLocalization`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `AdicSpacesPartII:R5/sousperfectoid-stably-uniform`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`
- **An affinoid étale perfectoid space is Zariski closed in a relative ball; its ideal is stably pseudocoherent (the closed embedding asserted in ECD 6.4(iv))** — `AdicEtaleGeometry:A3/affinoid-etale-zariski-closed-embedding` (theorem)
  - prerequisites: `AdicEtaleGeometry:A3/etale-standard-piece-cover`, `AdicEtaleGeometry:A3/integral-approximation-of-generators`, `AdicEtaleGeometry:A3/integral-cutoff-graph-presentation`, `AdicEtaleGeometry:A3/fs-iv-4-19-zariski-closed-char-p`, `AdicEtaleGeometry:A3/perturbation-of-generators`, `AdicSpacesPartII:R5/sousperfectoid-rings`, `AdicSpacesPartII:R5/perfectoid-times-polydisc`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.Huber.restrictedMvPowerSeriesCompletion`
- **Conormal description of an affinoid étale closed subspace of a relative ball: I/I² ≅ Ω¹_{B^N_X/X}|_Y** — `AdicEtaleGeometry:A3/conormal-description` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/fs-iv-4-19-zariski-closed-char-p`, `AdicEtaleGeometry:A3/integral-cutoff-graph-presentation`, `AdicEtaleGeometry:A3/fs-iv-4-13-regular-sequence`, `AdicEtaleGeometry:A3/etale-standard-piece-cover`, `AdicEtaleGeometry:A3/fpd-local-to-global`, `AdicEtaleGeometry:A3/pseudocoherent-module`, `AdicSpacesPartII:R0/conormal-sequence`, `AdicSpacesPartII:R0/continuous-differentials`, `AdicSpacesPartII:R3/simple-laurent-glueing-square`
- **The ideal of an affinoid étale Y in a relative ball is generated by N equations with unit Jacobian on a rational neighbourhood of Y** — `AdicEtaleGeometry:A3/local-equations-near-closed-subspace` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/conormal-description`, `AdicEtaleGeometry:A3/tubular-neighbourhood`, `AdicEtaleGeometry:A3/fs-iv-4-13-regular-sequence`, `AdicEtaleGeometry:A3/fs-iv-4-19-zariski-closed-char-p`, `AdicEtaleGeometry:A3/standard-presentation-basic-pieces`, `mathlib:Ideal.isIdempotentElem_iff_of_fg`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`
- **Huber's standard étale presentation for affinoid étale maps of affinoid perfectoid spaces (Huber 1.7.1 (i) ⇔ (ii), perfectoid case)** — `AdicEtaleGeometry:A3/global-standard-etale-presentation` (theorem) — planet *Étale presentation over a perfectoid base*
  - prerequisites: `AdicEtaleGeometry:A3/affinoid-etale-zariski-closed-embedding`, `AdicEtaleGeometry:A3/local-equations-near-closed-subspace`, `AdicEtaleGeometry:A3/standard-presentation-basic-pieces`, `AdicEtaleGeometry:A3/standard-etale-presentation`, `AdicEtaleGeometry:A3/jacobian-criterion-char-p`, `AdicSpacesPartII:R0/etale-local-structure`
- **Tilting commutes with cofiltered limits of affinoid perfectoid spaces and identifies the affinoid étale categories** — `AdicEtaleGeometry:A3/tilting-affinoid-etale-and-limits` (lemma)
  - prerequisites: `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring`, `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt`, `PerfectoidSpaces:P3/etale-site-tilting-and-etale-almost-acyclicity`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`, `PerfectoidSpaces:P3`
- **Approximating equations and rational data at a finite stage of a cofiltered limit of affinoid perfectoid spaces** — `AdicEtaleGeometry:A3/cofiltered-limit-presentation-approximation` (lemma)
  - prerequisites: `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`, `AdicEtaleGeometry:A3/standard-etale-presentation`, `AdicSpacesPartII:R0/completed-tensor-restricted-power-series`, `tauceti:TauCeti.ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`
- **Affinoid étale objects over a cofiltered limit descend to a finite stage (characteristic p)** — `AdicEtaleGeometry:A3/finite-stage-approximation-char-p` (theorem)
  - prerequisites: `AdicEtaleGeometry:A3/global-standard-etale-presentation`, `AdicEtaleGeometry:A3/standard-etale-presentation`, `AdicEtaleGeometry:A3/cofiltered-limit-presentation-approximation`, `AdicEtaleGeometry:A3/jacobian-criterion-char-p`, `AdicEtaleGeometry:A3/standard-presentation-perturbation`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`
- **Independence of the finite-stage model from presentations, approximations and indices** — `AdicEtaleGeometry:A3/independence-of-presentations` (lemma)
  - prerequisites: `AdicEtaleGeometry:A3/finite-stage-approximation-char-p`, `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`
- **Affinoid étale objects descend to a finite stage of a cofiltered limit of affinoid perfectoid spaces (ECD Proposition 6.4(iv))** — `AdicEtaleGeometry:A3/affinoid-etale-finite-stage-6-4-iv` (theorem) — planet *Affinoid étale finite-stage descent*
  - prerequisites: `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`, `PerfectoidSpaces:P3/strongly-etale-morphisms-and-base-change`, `AdicEtaleGeometry:A3/tilting-affinoid-etale-and-limits`, `AdicEtaleGeometry:A3/finite-stage-approximation-char-p`, `AdicEtaleGeometry:A3/independence-of-presentations`
- **ECD Proposition 6.4 assembled: parts (o)–(iii) from PerfectoidSpaces P5, part (iv) from AdicEtaleGeometry A3** — `AdicEtaleGeometry:A3/etale-descent-to-finite-stage-6-4` (comparison)
  - prerequisites: `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P5/finite-stage-descent-of-qcqs-etale-objects`, `AdicEtaleGeometry:A3/affinoid-etale-finite-stage-6-4-iv`, `PerfectoidSpaces:P3/strongly-finite-etale-maps-are-affinoid-over-affinoids`, `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`
- **Comparison of the Zariski closed immersions of A3 with ECD Definition 5.7 and Theorem 5.8 (PerfectoidQuotients Q4)** — `AdicEtaleGeometry:A3/zariski-closed-immersion-ecd-comparison` (comparison)
  - prerequisites: `AdicEtaleGeometry:A3/affinoid-etale-zariski-closed-embedding`, `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`, `AdicSpacesPartII:R5/sousperfectoid-rings`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`

### A4. Analytic adic presentations for diamondification

- **Rings with no nonsplit finite étale covers** — `AdicEtaleGeometry:A4/finite-etale-split-ring` (definition) — planet *Ring with no nonsplit finite étale covers*
  - prerequisites: `mathlib:Algebra.Etale`, `mathlib:Module.Finite`, `mathlib:Module.FaithfullyFlat`, `mathlib:IsIdempotentElem`, `mathlib:Module.rankAtStalk`, `mathlib:StandardEtalePair`, `mathlib:StandardEtalePair.homEquiv`, `mathlib:Algebra.IsStandardEtale`, `mathlib:AdjoinRoot.powerBasis'`, `mathlib:Algebra.Etale.iff_exists_algEquiv_prod`, `mathlib:IsSepClosed`, `mathlib:IsSepClosed.exists_root`
  - API: `IsFiniteEtaleSplit`; `Algebra.IsTotallySplit`; `isFiniteEtaleSplit_iff_exists_section`; `IsFiniteEtaleSplit.exists_root`; `isFiniteEtaleSplit_iff_isSepClosed`; `IsFiniteEtaleSplit.of_baseChange_equivalence`; `Algebra.IsTotallySplit.quotient_idempotent`; `IsFiniteEtaleSplit.pi`; `IsFiniteEtaleSplit.of_subsingleton`
  - unit tests: `IsFiniteEtaleSplit.test_isSepClosed` (compatibility: For a field K: IsFiniteEtaleSplit K ↔ IsSepClosed K.); `IsFiniteEtaleSplit.test_zero` (degenerate: The zero ring has no nonsplit finite étale covers: every finite étale algebra over it is the empty product.); `IsFiniteEtaleSplit.test_not_rat` (non-example: ¬ IsFiniteEtaleSplit ℚ: ℚ[X]/(X² − 2) is finite étale and faithfully flat over ℚ but has no ℚ-algebra map to ℚ.); `IsFiniteEtaleSplit.test_zero_algebra_has_no_section` (non-example: Over a nonzero ring R with no nonsplit finite étale covers, the zero algebra is finite étale and totally split (m = 0) but has no R-algebra map to R; so the section criterion must be restricted to faithfully flat algebras, and 'every finite étale algebra has a section' is the wrong definition.); `IsFiniteEtaleSplit.test_pi` (computation: If K₁, K₂ are separably closed fields then K₁ × K₂ has no nonsplit finite étale covers; for instance, in characteristic ≠ 2, (K₁ × K₂)[X]/(X² − (a, b)) with a, b ≠ 0 is isomorphic to (K₁ × K₂) × (K₁ × K₂).); `IsFiniteEtaleSplit.test_exists_root` (characterisation: If IsFiniteEtaleSplit R, P ∈ R[X] is monic of degree ≥ 1 and P′ is a unit in R[X]/(P), then ∃ r ∈ R, P(r) = 0.)
- **Finite étale G-torsors of commutative rings** — `AdicEtaleGeometry:A4/finite-etale-galois-torsor` (definition)
  - prerequisites: `mathlib:Algebra.Etale`, `mathlib:Module.Finite`, `mathlib:Module.FaithfullyFlat`, `mathlib:Module.Projective`, `mathlib:Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, `mathlib:Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`, `mathlib:comonadicExtendScalars`, `mathlib:Algebra.IsInvariant`, `mathlib:IsGaloisGroup`
  - API: `Algebra.IsFiniteEtaleTorsor`; `Algebra.IsFiniteEtaleTorsor.galoisMap` (data: The B-algebra isomorphism γ : B ⊗[A] B ≃ₐ[B] (G → B), b ⊗ b′ ↦ (g ↦ b * g • b′).); `Algebra.IsFiniteEtaleTorsor.iterGaloisMap` (data: The isomorphism B^{⊗(k+1)} ≃ₐ (G^k → B) obtained by iterating γ, compatible with the face maps.); `Algebra.IsFiniteEtaleTorsor.trivial` (constructor: Map(G, A) with (h·f)(g) = f(g h) is a G-torsor over A.); `Algebra.IsFiniteEtaleTorsor.tensor` (constructor: If B is a G-torsor and B′ a G′-torsor over A then B ⊗[A] B′ is a (G × G′)-torsor.); `Algebra.IsFiniteEtaleTorsor.baseChange` (functoriality: If B is a G-torsor over A and A → A′ is any ring map then A′ ⊗[A] B is a G-torsor over A′.); `Algebra.IsFiniteEtaleTorsor.isInvariant` (compatibility: A torsor satisfies Mathlib's Algebra.IsInvariant A B G (B^G = A).); `Algebra.IsFiniteEtaleTorsor.isGaloisGroup` (compatibility: If A is nontrivial, a torsor satisfies Mathlib's IsGaloisGroup G A B.); `Algebra.IsFiniteEtaleTorsor.rankAtStalk_eq_card` (characterisation: B is finite projective over A and Module.rankAtStalk B p = Fintype.card G for every prime p.); `Algebra.IsFiniteEtaleTorsor.of_surjective` (relation: For π : G′ ↠ G and an equivariant A-algebra map ι : B → B′ between a G-torsor and a G′-torsor, B′ is a (ker π)-torsor over B; in particular ι is injective and faithfully flat.); `Algebra.IsFiniteEtaleTorsor.iff_isGalois` (compatibility: For fields K ⊆ L with G acting on L: IsFiniteEtaleTorsor G K L ↔ IsGalois K L ∧ G ≃* (L ≃ₐ[K] L) via the action.)
  - unit tests: `IsFiniteEtaleTorsor.test_gaussian_half` (computation: ℤ[1/2][i] with complex conjugation is a (ℤ/2)-torsor over ℤ[1/2].); `IsFiniteEtaleTorsor.test_not_gaussian` (non-example: ℤ[i] with complex conjugation is not a (ℤ/2)-torsor over ℤ: the Galois map ℤ[i] ⊗ ℤ[i] → ℤ[i] × ℤ[i] is not surjective.); `IsFiniteEtaleTorsor.test_trivial_action` (non-example: A × A with the trivial action of ℤ/2 is not a (ℤ/2)-torsor over a nonzero A (the image of γ lies in the diagonal).); `IsFiniteEtaleTorsor.test_trivial_group` (degenerate: For the trivial group, B is a torsor over A iff A → B is an isomorphism.); `IsFiniteEtaleTorsor.test_isGalois` (compatibility: For a finite Galois extension L/K: IsFiniteEtaleTorsor (L ≃ₐ[K] L) K L, and it implies Mathlib's IsGaloisGroup (L ≃ₐ[K] L) K L.)
- **Henselian pairs are stable under filtered colimits** — `AdicEtaleGeometry:A4/henselian-pairs-filtered-colimit` (lemma)
  - prerequisites: `mathlib:HenselianRing`, `mathlib:Ring.DirectLimit`, `mathlib:Ideal.jacobson`
- **Finite étale algebras over a filtered colimit of rings descend to a finite stage** — `AdicEtaleGeometry:A4/finite-etale-algebras-filtered-colimit` (lemma)
  - prerequisites: `mathlib:Ring.DirectLimit`, `mathlib:Algebra.Etale`, `mathlib:Module.Finite`, `mathlib:Module.FaithfullyFlat`, `AdicEtaleGeometry:A4/finite-etale-split-ring`
- **Every finite étale algebra is split by a finite étale torsor** — `AdicEtaleGeometry:A4/splitting-torsor-of-finite-etale-algebra` (lemma)
  - prerequisites: `AdicEtaleGeometry:A4/finite-etale-galois-torsor`, `AdicEtaleGeometry:A4/finite-etale-split-ring`, `mathlib:Module.rankAtStalk`, `mathlib:Algebra.TensorProduct.lmul'`, `mathlib:Equiv.Perm`, `mathlib:Algebra.Etale.comp`, `mathlib:Algebra.Etale.baseChange`, `mathlib:IsIdempotentElem`, `mathlib:IsSepClosed`
- **The cofiltered system of finite étale torsors with no remaining nonsplit finite étale covers (ECD Lemma 15.3, first part)** — `AdicEtaleGeometry:A4/finite-etale-torsor-tower` (construction) — planet *Finite étale torsor tower*
  - prerequisites: `AdicEtaleGeometry:A4/finite-etale-galois-torsor`, `AdicEtaleGeometry:A4/finite-etale-split-ring`, `AdicEtaleGeometry:A4/finite-etale-algebras-filtered-colimit`, `AdicEtaleGeometry:A4/splitting-torsor-of-finite-etale-algebra`, `mathlib:Ring.DirectLimit`, `mathlib:ProfiniteGrp`, `mathlib:LocallyConstant`, `mathlib:Algebra.Etale.comp`, `mathlib:Algebra.IsInvariant`
  - API: `FiniteEtaleTorsorTower`; `FiniteEtaleTorsorTower.canonical`; `FiniteEtaleTorsorTower.colim` (data: The A-algebra A_∞ = Ring.DirectLimit of the A_i, with the maps toColim i : A_i →ₐ[A] A_∞.); `FiniteEtaleTorsorTower.group` (data: The profinite group G = lim_i G_i (a ProfiniteGrp) with surjective projections G → G_i.); `FiniteEtaleTorsorTower.colimAction` (instance: MulSemiringAction of G on A_∞ by A-algebra automorphisms, with toColim i equivariant along G → G_i; each element has an open stabiliser.); `FiniteEtaleTorsorTower.isFiniteEtaleSplit_colim` (characterisation: IsFiniteEtaleSplit A_∞ (the defining axiom, as an instance).); `FiniteEtaleTorsorTower.exists_level_totallySplit` (characterisation: Every finite étale A-algebra becomes totally split over some A_i.); `FiniteEtaleTorsorTower.transition_isFiniteEtaleTorsor` (relation: For i ≤ j, A_j is a (ker π_{ij})-torsor over A_i; the transition maps are injective and faithfully flat.); `FiniteEtaleTorsorTower.colim_isInvariant` (compatibility: Algebra.IsInvariant A A_∞ G, i.e. (A_∞)^G = A; and IsGaloisGroup G A A_∞ for A nontrivial.); `FiniteEtaleTorsorTower.colimTensorEquiv` (characterisation: A_∞ ⊗[A] A_∞ ≃ₐ LocallyConstant G A_∞, a ⊗ b ↦ (g ↦ a * g • b); likewise A_∞^{⊗(k+1)} ≃ LocallyConstant (G^k) A_∞.); `FiniteEtaleTorsorTower.faithfullyFlat_colim` (other: A_∞ is a faithfully flat, ind-étale A-algebra.); `FiniteEtaleTorsorTower.baseChange` (functoriality: For A → A′ the base-changed system (A′ ⊗_A A_i, G_i) is a compatible system of finite étale torsors over A′ (its colimit need not be split; a tower over A′ refining it exists by canonical).)
  - unit tests: `FiniteEtaleTorsorTower.test_finiteField` (computation: Over 𝔽_p, I = ℕ with A_n = 𝔽_{p^{n!}}, G_n = ℤ/n! and the natural maps is a finite étale torsor tower with colimit 𝔽̄_p and group G ≅ ℤ̂.); `FiniteEtaleTorsorTower.test_trivial` (degenerate: If A has no nonsplit finite étale covers (for instance a separably closed field, or the zero ring), the one-point tower (I = {∗}, G_∗ = 1, A_∗ = A) is a finite étale torsor tower.); `FiniteEtaleTorsorTower.test_not_cyclotomic` (non-example: Over ℚ_p, the cyclotomic system A_n = ℚ_p(μ_{p^n}) with G_n = (ℤ/p^n)^× is a compatible system of finite étale torsors with surjective transitions, but it is not a tower: its colimit has the nonsplit finite étale cover given by the unramified quadratic extension.); `FiniteEtaleTorsorTower.test_field_residue` (compatibility: For any tower over a field K, every residue field of A_∞ at a prime is a separable closure of K (Mathlib IsSepClosure K).); `FiniteEtaleTorsorTower.test_exists_level_split` (characterisation: For every tower over A and every finite étale A-algebra S there is i with A_i ⊗_A S totally split over A_i.)
- **Uniformization of a complete Tate pair does not change its adic spectrum or its finite étale algebras** — `AdicEtaleGeometry:A4/uniform-completion-etale-comparison` (theorem) — planet *Invariance under uniformization*
  - prerequisites: `AdicSpacesPartII:R0/uniformization`, `AdicSpacesPartII:R0/tate-ring-norm`, `AdicSpacesPartII:R0/spectral-topology`, `AdicSpacesPartII:R0/spectral-seminorm`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/affinoid-system-approximation`, `AdicEtaleGeometry:A1/finite-etale-approximation`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `PerfectoidSpaces:P3`, `AdicEtaleGeometry:A4/finite-etale-split-ring`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `mathlib:Algebra.Etale`, `mathlib:Module.FaithfullyFlat`
- **The uniform completion (Â_∞, Â_∞⁺) of a finite étale torsor tower over a complete Tate pair** — `AdicEtaleGeometry:A4/completed-tower-pair` (construction) — planet *Completed torsor tower*
  - prerequisites: `AdicEtaleGeometry:A4/finite-etale-torsor-tower`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicSpacesPartII:R0/uniformization`, `AdicSpacesPartII:R0/spectral-topology`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.Pair.Hom`, `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.IsTateRing.completion`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `tauceti:TauCeti.Huber.isOpen_powerBoundedSubring`, `tauceti:TauCeti.Huber.IsRingOfIntegralElements`, `tauceti:TauCeti.Huber.mem_of_isTopologicallyNilpotent_of_isIntegrallyClosedIn`, `mathlib:UniformSpace.Completion`, `mathlib:Ring.DirectLimit`, `mathlib:IsIntegrallyClosedIn`, `mathlib:ProfiniteGrp`
  - API: `FiniteEtaleTorsorTower.levelPair` (constructor: The Huber pair (A_i, A_i⁺) of level i, with transition morphisms and the G_i-action by pair automorphisms.); `FiniteEtaleTorsorTower.colimPair` (data: The Tate Huber pair (A_∞, A_∞⁺) with ring of definition colim A_i° and the ϖ-adic topology on it.); `FiniteEtaleTorsorTower.colimPair_isUniform` (characterisation: A_∞° ⊆ ϖ⁻¹ · colim A_i°; in particular A_∞° is bounded and the identity of A_∞ is a homeomorphism onto its spectral topology.); `FiniteEtaleTorsorTower.completion` (data: The completed tower pair (Â_∞, Â_∞⁺), defined as the uniformization of colimPair.); `FiniteEtaleTorsorTower.completion_eq_completion` (compatibility: The uniformization of colimPair is its Hausdorff completion (UniformSpace.Completion, Tau Ceti IsTateRing.completion).); `FiniteEtaleTorsorTower.completion_plus_eq_closure` (characterisation: Â_∞⁺ is the closure of the image of colim A_i⁺ in Â_∞.); `FiniteEtaleTorsorTower.toCompletion` (projection: The morphisms of Huber pairs (A_i, A_i⁺) → (Â_∞, Â_∞⁺), compatible with transitions and with G → G_i.); `FiniteEtaleTorsorTower.completionAction` (instance: The action of G on (Â_∞, Â_∞⁺) by pair automorphisms over (A, A⁺), with continuous action map G × Â_∞ → Â_∞.); `FiniteEtaleTorsorTower.completion.lift` (universal-property: A compatible family of morphisms (A_i, A_i⁺) → (B, B⁺) into a complete Hausdorff pair with B° bounded lifts to (Â_∞, Â_∞⁺) → (B, B⁺).); `FiniteEtaleTorsorTower.completion.lift_comp_toCompletion` (universal-property: lift f ∘ toCompletion i = f i.); `FiniteEtaleTorsorTower.completion.hom_ext` (extensionality: Two morphisms out of (Â_∞, Â_∞⁺) that agree after every toCompletion i are equal.); `FiniteEtaleTorsorTower.completion_isTateRing` (instance: Â_∞ is a complete Hausdorff uniform Tate ring with ring of definition the ϖ-adic completion of colim A_i°.)
  - unit tests: `FiniteEtaleTorsorTower.completion_test_Qp` (computation: For (ℚ_p, ℤ_p) and a tower of finite Galois field extensions exhausting ℚ̄_p: (Â_∞, Â_∞⁺) ≅ (ℂ_p, 𝒪_{ℂ_p}).); `FiniteEtaleTorsorTower.completion_test_trivial` (degenerate: For the one-point tower over a complete uniform (A, A⁺) with no nonsplit finite étale covers, the completion is (A, A⁺).); `FiniteEtaleTorsorTower.completion_test_not_colim` (non-example: The completion step cannot be omitted: for the ℚ_p tower above, A_∞ = ℚ̄_p is not complete, and colim A_i⁺ = 𝒪_{ℚ̄_p} is not closed in ℂ_p (the plus ring is its closure 𝒪_{ℂ_p}).); `FiniteEtaleTorsorTower.completion_test_uniformization` (compatibility: For A complete but not uniform (e.g. ℚ_p⟨T⟩[ε]/(ε²)), the completed tower of A is the completed tower of the base-changed tower over A^u = ℚ_p⟨T⟩: nilpotents disappear in Â_∞.); `FiniteEtaleTorsorTower.completion_test_lift` (characterisation: Morphisms (Â_∞, Â_∞⁺) → (ℂ_p, 𝒪_{ℂ_p}) correspond to compatible families of morphisms (A_i, A_i⁺) → (ℂ_p, 𝒪_{ℂ_p}).)
- **Finite étale algebras are unchanged along the completed torsor tower** — `AdicEtaleGeometry:A4/finite-etale-invariance-along-tower` (lemma)
  - prerequisites: `AdicEtaleGeometry:A4/completed-tower-pair`, `AdicEtaleGeometry:A4/finite-etale-torsor-tower`, `AdicEtaleGeometry:A4/finite-etale-split-ring`, `AdicEtaleGeometry:A4/henselian-pairs-filtered-colimit`, `AdicEtaleGeometry:A4/finite-etale-algebras-filtered-colimit`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `ClassicalAdicEtaleCohomology:H1:henselian/henselian-f-adic-rings-and-henselization`, `PerfectoidSpaces:P3`, `mathlib:HenselianRing`, `mathlib:ContinuousMap`, `mathlib:LocallyConstant`
- **Finite étale algebras descend effectively along the completed torsor tower** — `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower` (lemma)
  - prerequisites: `AdicEtaleGeometry:A4/finite-etale-invariance-along-tower`, `AdicEtaleGeometry:A4/finite-etale-galois-torsor`, `AdicEtaleGeometry:A4/completed-tower-pair`, `AdicEtaleGeometry:A4/completed-tower-self-product`, `mathlib:comonadicExtendScalars`, `mathlib:Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, `mathlib:Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`, `mathlib:ContinuousMap`
- **Roots of monic polynomials with invertible derivative over a complete Tate ring without nonsplit covers** — `AdicEtaleGeometry:A4/root-of-monic-in-split-tate-ring` (lemma)
  - prerequisites: `AdicEtaleGeometry:A4/finite-etale-split-ring`, `mathlib:AdjoinRoot.powerBasis'`, `mathlib:StandardEtalePair`, `mathlib:Algebra.IsStandardEtale`, `mathlib:StandardEtalePair.homEquiv`, `mathlib:Polynomial.Monic`, `mathlib:Polynomial.derivative`, `tauceti:IsTopologicallyNilpotent.isUnit_one_sub`, `tauceti:TauCeti.Huber.IsPowerBounded`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `tauceti:TauCeti.Huber.IsTateRing`
- **A pseudouniformizer whose p-th power divides p, from a root of x^{p^n} − ϖ₀x − ϖ₀** — `AdicEtaleGeometry:A4/pseudouniformizer-dividing-p` (lemma)
  - prerequisites: `AdicEtaleGeometry:A4/root-of-monic-in-split-tate-ring`, `AdicEtaleGeometry:A4/finite-etale-split-ring`, `tauceti:TauCeti.Huber.IsPseudoUniformizer`, `tauceti:TauCeti.Huber.IsPowerBounded.isTopologicallyNilpotent_mul`, `tauceti:IsTopologicallyNilpotent.isUnit_one_add`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `mathlib:IsTopologicallyNilpotent`
- **Surjectivity of Frobenius modulo ϖ^p from roots of x^p − ϖ^p x − f** — `AdicEtaleGeometry:A4/frobenius-surjective-for-split-tate-ring` (lemma)
  - prerequisites: `AdicEtaleGeometry:A4/root-of-monic-in-split-tate-ring`, `AdicEtaleGeometry:A4/pseudouniformizer-dividing-p`, `AdicEtaleGeometry:A4/finite-etale-split-ring`, `tauceti:TauCeti.Huber.IsPowerBounded.isTopologicallyNilpotent_mul`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `mathlib:frobenius`
- **A complete uniform Tate ring with p topologically nilpotent and no nonsplit finite étale covers is perfectoid** — `AdicEtaleGeometry:A4/split-tate-ring-is-perfectoid` (lemma)
  - prerequisites: `AdicEtaleGeometry:A4/pseudouniformizer-dividing-p`, `AdicEtaleGeometry:A4/frobenius-surjective-for-split-tate-ring`, `AdicEtaleGeometry:A4/finite-etale-split-ring`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`
- **The uniform completion of a finite étale torsor tower over a complete Tate ℤ_p-algebra is perfectoid (ECD Lemma 15.3, second part)** — `AdicEtaleGeometry:A4/perfectoid-uniform-completion` (theorem) — planet *Perfectoid uniform completion*
  - prerequisites: `AdicEtaleGeometry:A4/completed-tower-pair`, `AdicEtaleGeometry:A4/finite-etale-invariance-along-tower`, `AdicEtaleGeometry:A4/split-tate-ring-is-perfectoid`, `AdicEtaleGeometry:A4/finite-etale-torsor-tower`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `tauceti:TauCeti.Huber.IsPseudoUniformizer`
- **The adic spectrum of a finite étale G-torsor is a G-quotient of the adic spectrum of the torsor** — `AdicEtaleGeometry:A4/torsor-spa-orbits` (lemma)
  - prerequisites: `AdicEtaleGeometry:A4/finite-etale-galois-torsor`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicSpacesPartII:R0/finite-algebra-tensor-complete`, `AdicSpacesPartII:R0/completed-tensor-product`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.spaComap`, `tauceti:TauCeti.ValuationSpectrum.continuous_spaComap`, `tauceti:TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`
- **The adic spectrum of the completed tower is the limit of the levels and a G-quotient onto Spa(A, A⁺)** — `AdicEtaleGeometry:A4/spa-of-completed-tower` (lemma)
  - prerequisites: `AdicEtaleGeometry:A4/completed-tower-pair`, `AdicEtaleGeometry:A4/torsor-spa-orbits`, `AdicEtaleGeometry:A4/finite-etale-torsor-tower`, `AdicSpacesPartII:R0/uniformization`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.spaComap`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `mathlib:ProfiniteGrp`
- **The uniform completed self-product of the completed tower is C^0(G, Â_∞)** — `AdicEtaleGeometry:A4/completed-tower-self-product` (lemma)
  - prerequisites: `AdicEtaleGeometry:A4/completed-tower-pair`, `AdicEtaleGeometry:A4/finite-etale-torsor-tower`, `AdicEtaleGeometry:A4/perfectoid-uniform-completion`, `AdicSpacesPartII:R0/uniform-completed-tensor-product`, `AdicSpacesPartII:R0/spectral-topology`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `mathlib:ContinuousMap`, `mathlib:LocallyConstant`, `mathlib:ProfiniteGrp`
- **Perfectoid torsor presentation of a complete Tate ℤ_p-pair: a perfectoid cover and its induced perfectoid equivalence relation** — `AdicEtaleGeometry:A4/perfectoid-cover-presentation` (construction) — planet *Perfectoid torsor presentation*
  - prerequisites: `AdicEtaleGeometry:A4/completed-tower-pair`, `AdicEtaleGeometry:A4/perfectoid-uniform-completion`, `AdicEtaleGeometry:A4/completed-tower-self-product`, `AdicEtaleGeometry:A4/spa-of-completed-tower`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A4/finite-etale-torsor-tower`, `AdicSpacesPartII:R0/uniform-completed-tensor-product`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `AdicEtaleGeometry:A1/generalized-adic-presentation`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.Huber.Pair.Hom`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.spaComap`, `mathlib:ProfiniteGrp`, `mathlib:ContinuousMap`
  - API: `Huber.PerfectoidTorsorPresentation`; `Huber.PerfectoidTorsorPresentation.ofTower` (constructor: The presentation (lim G_i, Â_∞, Â_∞⁺) of a finite étale torsor tower over a complete Tate ℤ_p-algebra.); `Huber.PerfectoidTorsorPresentation.exists` (constructor: Every complete Tate ℤ_p-pair admits a perfectoid torsor presentation (ofTower of the canonical tower).); `Huber.PerfectoidTorsorPresentation.relation` (data: The pair (C^0(G, Ã), C^0(G, Ã⁺)) with the morphisms source s, target t, unit (evaluation at 1) and composition C^0(G, Ã) → C^0(G × G, Ã).); `Huber.PerfectoidTorsorPresentation.relation_isPerfectoid` (instance: C^0(G^k, Ã) is perfectoid for every k ≥ 0.); `Huber.PerfectoidTorsorPresentation.uniformCompletedTensorEquiv` (characterisation: Ã ⊗̂ᵘ_A Ã ≅ (C^0(G, Ã), C^0(G, Ã⁺)) with inlᵘ ↦ s and inrᵘ ↦ t (axiom (a)).); `Huber.PerfectoidTorsorPresentation.spaQuotientHomeomorph` (equivalence: The homeomorphism |Spa(Ã, Ã⁺)|/G ≃ₜ |Spa(A, A⁺)| induced by Spa(q).); `Huber.PerfectoidTorsorPresentation.spa_relation_homeomorph` (characterisation: |Spa(C^0(G, Ã), C^0(G, Ã⁺))| ≃ₜ G × |Spa(Ã, Ã⁺)|, under which s and t become (g, x) ↦ x and (g, x) ↦ g⁻¹·x.); `Huber.PerfectoidTorsorPresentation.isSpectralMap_spa` (other: Spa(q) is a spectral map (quasi-compact), surjective and open: the compactness condition.); `Huber.PerfectoidTorsorPresentation.preimage_rationalSubset` (compatibility: The preimage under Spa(q) of the rational subset R(T/s) of Spa(A, A⁺) is the rational subset R(q(T)/q(s)) of Spa(Ã, Ã⁺).); `Huber.PerfectoidTorsorPresentation.ofTower_finiteEtaleDescent` (equivalence: For ofTower T: finite étale A-algebras ≃ finite étale Ã-algebras with descent data over C^0(G, Ã).); `Huber.PerfectoidTorsorPresentation.ofPerfectoid` (example: The trivial presentation of a perfectoid pair (G = 1).)
  - unit tests: `PerfectoidTorsorPresentation.test_Qp` (computation: (ℚ_p, ℤ_p) has the presentation G = Gal(ℚ̄_p/ℚ_p), (Ã, Ã⁺) = (ℂ_p, 𝒪_{ℂ_p}); ℂ_p ⊗̂ᵘ_{ℚ_p} ℂ_p ≅ C^0(G, ℂ_p) and |Spa(ℂ_p, 𝒪_{ℂ_p})|/G = |Spa(ℚ_p, ℤ_p)| (both points).); `PerfectoidTorsorPresentation.test_perfectoid` (degenerate: If (A, A⁺) is perfectoid, G = 1 and (Ã, Ã⁺) = (A, A⁺) is a presentation (C^0(1, A) = A = A ⊗̂ᵘ_A A).); `PerfectoidTorsorPresentation.test_relation_not_injective` (non-example: For (ℚ_p, ℤ_p) the map |R̃| = Gal(ℚ̄_p/ℚ_p) × |X̃| → |X̃| ×_{|Spa ℚ_p|} |X̃| = point is surjective but not injective: R̃ ⇉ X̃ is not an equivalence relation on underlying sets.); `PerfectoidTorsorPresentation.test_pointwise_cover` (non-example: For A = ℚ_p⟨T⟩, the disjoint union Y = ⊔_x Spa(K(x), K(x)⁺) over all points x of Spa(A, A°) (completed residue fields) maps surjectively onto |Spa(A, A°)| but is not quasi-compact, so it is not a presentation: point-surjectivity without the compactness condition does not give surjectivity of the associated map of v-sheaves (a map from an affinoid perfectoid space that lifts v-locally to Y has image in finitely many points).); `PerfectoidTorsorPresentation.test_finite_level` (compatibility: For a presentation ofTower T and a level i, Spa(Ã, Ã⁺) → Spa(A_i, A_i⁺) identifies |Spa(A_i, A_i⁺)| with the quotient of |X̃| by the open subgroup ker(G → G_i).); `PerfectoidTorsorPresentation.test_nonuniform` (compatibility: A and its uniformization A^u have the same presentations: a presentation of (A, A⁺) is one of (A^u, A^{u+}) via the universal property of uniformization, Ã being uniform.)
- **ECD 15.1–15.4 as a composite record: the analytic torsor tower is A4's, the Spd, v-sheaf and quotient conclusions are DiamondsAndVStacks D6's** — `AdicEtaleGeometry:A4/spd-of-tate-huber-pair-and-perfectoid-torsor` (comparison)
  - prerequisites: `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/finite-etale-torsor-tower`, `AdicEtaleGeometry:A4/completed-tower-pair`, `AdicEtaleGeometry:A4/perfectoid-uniform-completion`, `AdicEtaleGeometry:A4/completed-tower-self-product`, `AdicEtaleGeometry:A4/spa-of-completed-tower`
- **ECD Definition 15.5 and Lemma 15.6: a DiamondsAndVStacks D6 endpoint, with the analytic inputs A4 supplies to it** — `AdicEtaleGeometry:A4/diamond-of-analytic-adic-space-and-etale-site-15-6` (comparison)
  - prerequisites: `AdicEtaleGeometry:A4/perfectoid-cover-presentation`, `AdicEtaleGeometry:A4/spa-of-completed-tower`, `AdicEtaleGeometry:A4/finite-etale-invariance-along-tower`, `AdicEtaleGeometry:A4/finite-etale-effective-descent-along-tower`, `AdicEtaleGeometry:A1/finite-etale-site`, `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/generalized-adic-presentation`, `AdicEtaleGeometry:A1/finite-etale-affinoid-algebra`, `AdicEtaleGeometry:A1/etale-site-generalized`


## Sources

- **HansenKedlaya-SheafinessCriteria**: David Hansen, Kiran S. Kedlaya, *Sheafiness criteria for Huber rings*, living preprint served from the author's page, version dated August 6, 2026 (date printed on p. 1 of the PDF read); no version history. <https://kskedlaya.org/papers/criteria.pdf>
- **Huber-EtaleCohomology-1996**: Roland Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30, Vieweg 1996. Not public: the excerpt and locator are copied from the reviewed decomposition data/decompositions/AdicSpacesPartII.json. <https://link.springer.com/book/10.1007/978-3-663-09991-8>
- **Huber-GeneralizationFormalRigid-1994**: Roland Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217 (1994), 513-551; GDZ scan with OCR (quoted as OCR text). <https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217>
- **Hubner-AdicSpaces-2024**: Katharina Hübner, *Adic spaces*, arXiv:2405.06435v1. <https://arxiv.org/abs/2405.06435>
- **KedlayaLiu-RelativeFoundations-2015**: Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory: foundations*, arXiv:1301.0792v5 (9 May 2015), Astérisque 371 (2015); locators give the printed page number (page footer) of the arXiv PDF. <https://arxiv.org/abs/1301.0792>
- **Morel-AdicSpacesNotes**: Sophie Morel, *Adic spaces (lecture notes)*, version of April 22, 2019 (author's page). <https://web.math.princeton.edu/~smorel/adic_notes.pdf>
- **Scholze-EtaleCohomologyDiamonds**: Peter Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4 (14 April 2026); locators are the printed page numbers of that version. <https://arxiv.org/abs/1709.07343>
- **Scholze-PerfectoidSpaces-2012**: Peter Scholze, *Perfectoid spaces*, arXiv:1111.4914 (Publ. Math. IHÉS 116 (2012) 245–313); locators are the printed page numbers of the arXiv PDF. <https://arxiv.org/abs/1111.4914>
- **ScholzeWeinstein-Berkeley-2020**: Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Annals of Mathematics Studies 207, Princeton University Press 2020; PDF stamped 'March 27, 2020'; printed page numbers. <https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf>
- **Wedhorn-AdicSpaces-2019**: Torsten Wedhorn, *Adic Spaces*, arXiv:1910.05934v1 (the only version). <https://arxiv.org/abs/1910.05934v1>
- **Scholze-PadicHodgeRigid-2013**: Peter Scholze, *p-adic Hodge theory for rigid-analytic varieties*, arXiv:1205.3463v2 (Forum of Mathematics, Pi 1 (2013), e1),; printed page numbers. <https://arxiv.org/abs/1205.3463>
- **deJongvanderPut-EtaleRigid-1996**: Johan de Jong, Marius van der Put, *Étale cohomology of rigid analytic spaces*, Documenta Mathematica 1 (1996), 1–56; EMS Press PDF, accessed 2026-09-26); its text layer drops the ligatures fi/ffi/ff/fl and the accent of 'étale', excerpts quote the printed words. <https://ems.press/content/serial-article-files/25781>
- **FarguesScholze-Geometrization**: Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, arXiv:2102.13459v4; printed page numbers. <https://arxiv.org/abs/2102.13459>
- **Scholze-PadicHodgeRigid-Erratum**: Peter Scholze, *Erratum to 'p-adic Hodge theory for rigid-analytic varieties'*, three-page author erratum (undated), SHA-256 identical to the copy read in RS-05. <https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf>
- **Huber-ContinuousValuations-1993**: Roland Huber, *Continuous valuations*, Math. Z. 212 (1993) 455–477; GDZ OCR (PPN266833020_0212), quoted as OCR text. <https://gdz.sub.uni-goettingen.de/id/PPN266833020_0212>
- **BHW-OverconvergentHilbert-2023**: Christopher Birkbeck, Ben Heuer, Chris Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties*, Annales de l'Institut Fourier 73 (2023), no. 4, 1709-1794 (journal pagination); the flagged passages of Corollaries 3.4-3.5 were compared with arXiv:1902.03985v4 (SHA-256 8ee48970…), where they read the same. <https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf>
- **Zavyalov-FoundationalAdic-2024**: Bogdan Zavyalov, *Some foundational results in adic geometry*, arXiv:2409.15516v2 (17 Jul 2025). <https://arxiv.org/abs/2409.15516>
- **KedlayaLiu-RelativeII-ImperfectPeriodRings**: Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory, II: Imperfect period rings*, arXiv:1602.06899v3 (21 October 2019); printed page numbers of this version. <https://arxiv.org/abs/1602.06899>
- **Stacks-Project**: The Stacks project authors, *The Stacks project*, online, tag pages fetched 2026-09-26. <https://stacks.math.columbia.edu>
