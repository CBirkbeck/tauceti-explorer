# Analytic adic geometry required for diamonds

This roadmap develops the analytic adic geometry used in Scholze’s *Étale cohomology of
diamonds*. It begins after **Foundations of adic spaces** (the Tau Ceti roadmap `AdicSpaces`,
called the anchor below) and **Foundations of adic spaces, Part II** (`AdicSpacesPartII`).
Its five layers connect complete Huber pairs, analytic étale sites, nonnoetherian approximation,
and perfectoid torsor presentations. The resulting analytic constructions supply
`DiamondsAndVStacks:D6` with its adic input.

## Purpose

ECD builds diamonds out of perfectoid spaces and then compares the étale site of an analytic adic
space with that of its diamond. Before that comparison can be stated, the adic side needs its own
étale geometry in a generality beyond Huber's noetherian setting: finite étale algebras over
arbitrary complete Tate rings, étale morphisms defined by a local description, the étale,
finite étale and pro-étale sites with their points, the presentation of non-sheafy spaces, the
nonnoetherian approximation statement ECD 6.4(iv), and the tower of finite étale torsors whose
uniform completion is perfectoid (ECD 15.3). These are the targets of this roadmap. The ordinary morphism
theory (completed tensor products, fibre products, separated, proper, finite, smooth and étale
morphisms in Huber's sense, analytification and formal models) is AdicSpacesPartII's; layers A0
and A2 are the comparison interfaces that identify it on the same carriers.

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

- **The anchor**, Layers 0–5, and **AdicSpacesPartII** (R0–R5, F0), whose interfaces the
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

## Conventions

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

**Imported foundation:** AdicSpacesPartII R0 (`AdicSpacesPartII:R0`). A0 is the comparison interface of this
roadmap with R0: it identifies, on the same carriers, R0's completed tensor product, its topology,
plus ring and universal property, its uniformization and its affinoid fibre products with the objects
the diamond and perfectoid layers use, and proves the comparisons that R0 does not state (pullback
along rational and finite étale maps, chart independence, associativity and unit, tracking of the
definition data and plus rings). It constructs one new object, the analytic locus of an adic space
with its restriction interface, needed to apply R0's constructions to analytic adic spaces over
`Spa(ℤ_p, ℤ_p)` with non-Tate charts. It keeps explicit the boundary with PerfectoidSpaces P2, which
proves that the relevant products of perfectoid spaces are perfectoid.

**Dependencies.** AdicSpacesPartII R0 (completed tensor products, fibre products, adic morphisms,
finite morphisms, uniformization); the Tau Ceti anchor `AdicSpaces`, Layers 0
(completion of Huber pairs), 2 (analytic points of `Spa`), 3 (rational localisation, the category
`𝒱`) and 5 (adic spaces, open subspaces, gluing), which are imported as interfaces of those layers. A0 uses no stage that depends on it: PerfectoidSpaces P2, AdicSpacesPartII R4–R5 and AdicEtaleGeometry
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

#### A0.1 The comparison interface: the pushout of complete Huber pairs

<a id="t001"></a> **T001** `A0/supplier-contract-fibre-products` (comparison; declaration
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
target and is not part of it.

Acceptance:

- Scalar extension of a Tate algebra (A0 test): for a complete extension L/K of nonarchimedean fields, (K⟨T⟩, K°⟨T⟩) ⊗̂_{(K, K°)} (L, L°) ≅ (L⟨T⟩, L°⟨T⟩) through AdicSpacesPartII:R0/completed-tensor-restricted-power-series (b), and Spa(L⟨T⟩, L°⟨T⟩) = Spa(K⟨T⟩, K°⟨T⟩) ×_{Spa(K, K°)} Spa(L, L°) is the closed unit disc over L.
- Polydisc: (K⟨T⟩, K°⟨T⟩) ⊗̂_{(K, K°)} (K⟨S⟩, K°⟨S⟩) ≅ (K⟨T, S⟩, K°⟨T, S⟩) and its Spa is the product of two closed discs (Hübner, Example 9.3).
- Plus ring is not the image: for L = ℚ_p(√p), (L, O_L) ⊗̂_{ℚ_p} (L, O_L) ≅ (L × L, O_L × O_L); the idempotent (1, 0) lies in the plus ring but not in the image of O_L ⊗_{ℤ_p} O_L.
- Perfectoid scalar extension after P2 (A0 test): for a perfectoid field K, the perfectoid affinoid K-algebra K⟨T^{1/p^∞}⟩ and a perfectoid complete extension L/K, PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces identifies Spa K⟨T^{1/p^∞}⟩ ×_{Spa K} Spa L with Spa of this target's pair K⟨T^{1/p^∞}⟩ ⊗̂_K L = L⟨T^{1/p^∞}⟩; the perfectoidness and sheafiness used there are P2's and are not consequences of this target.
- Non-example: for ℤ_p → ℤ_p⟦X⟧ ((p, X)-adic, not adic) and ℤ_p → ℚ_p there is no Huber topology on ℤ_p⟦X⟧ ⊗_{ℤ_p} ℚ_p making both maps continuous with ℤ_p⟦X⟧ open (Morel, Example II.3.2.2); the fibre product Spa ℤ_p⟦X⟧ ×_{Spa ℤ_p} Spa(ℚ_p, ℤ_p) is the open unit disc over ℚ_p, which is not affinoid (AdicSpacesPartII:R0/fibre-product-along-finite-type).

#### A0.2 Uniformization, supplied separately

<a id="t002"></a> **T002** `A0/uniformization-contract` (comparison; declaration
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

<a id="t003"></a> **T003** `A0/definition-data-and-plus-ring-tracking` (lemma; declaration
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

<a id="t004"></a> **T004** `A0/rational-pullback-comparison` (comparison; declaration
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

<a id="t005"></a> **T005** `A0/finite-etale-pullback-comparison` (comparison; declaration
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
- Kedlaya–Liu, Definition 8.2.16: finite étale morphisms of preadic spaces are 'evidently stable under base extension'; on sheafy pieces this target is that statement.

#### A0.6 Chart independence

<a id="t006"></a> **T006** `A0/fibre-product-affinoid-chart-comparison` (comparison; declaration
`AdicSpace.pullbackAffinoidChartIso`). For the glued fibre product `Z = X ×_S Y` of R0 (with `g` adic)
and open affinoids `W ⊆ S`, `U ⊆ f⁻¹(W)`, `V ⊆ g⁻¹(W)` with `O(U) ⊗̂_{O(W)} O(V)` sheafy, the open
subspace `p⁻¹(U) ∩ q⁻¹(V)` is canonically `Spa(O(U) ⊗̂_{O(W)} O(V))`, independently of the cover used to
glue `Z`, and compatibly with rational restriction (`AdicSpacesPartII:R0/completed-tensor-rational-localisation`).

Acceptance:

- For X = Y = Spa(ℚ_p⟨T⟩) over S = Spa ℚ_p, with the covers X = {|T| ≤ |p|} ∪ {|p| ≤ |T|} and the trivial cover, the chart over {|T| ≤ |p|} × Y is Spa(ℚ_p⟨T/p⟩ ⊗̂_{ℚ_p} ℚ_p⟨S⟩) = Spa(ℚ_p⟨T, S⟩⟨T/p⟩), the rational subset {|T| ≤ |p|} of the closed bidisc, whichever cover is used.
- A0 stage text: 'Glue affine constructions and prove the categorical pullback property, chart independence'.

#### A0.7 Associativity, symmetry and unit

<a id="t007"></a> **T007** `A0/fibre-product-associativity-and-unit` (comparison; declaration
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

<a id="t008"></a> **T008** `A0/analytic-locus-restriction` (construction; planet *Analytic locus of an adic
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

#### Imported interfaces and boundaries

- The category of adic spaces, open subspaces and maps into affinoids (anchor Layer 5), rational
  localisation as a complete pair and Huber's category `𝒱` (anchor Layer 3), and completion of Huber
  pairs (anchor Layer 0) are requested from the Tau Ceti anchor. PerfectoidSpaces P0's request for adic
  spaces with their structure presheaf, and P8's for the category `𝒱`, are owned there.
- Completed tensor products of Banach modules and Banach spaces over a nonarchimedean field (requested
  of A0 by PerfectoidSpaces P8/P9) belong to R0's completed tensors and are requested from AdicSpacesPartII R0 (the interface
  `AdicSpacesPartII:R0/completed-tensor-banach-module` proposed there).
- Sheafiness of finite étale algebras over a general sheafy Tate pair is an open problem and is kept as
  a hypothesis.

<a id="a1"></a>

## A1. Finite étale and étale geometry

### A1 (part A1a). Finite étale and étale morphisms, the étale sites, geometric points

**Dependencies.** AdicEtaleGeometry A0 (pullbacks along rational open immersions and finite étale maps:
`A0/rational-pullback-comparison`, `A0/finite-etale-pullback-comparison`);
AdicSpacesPartII R0 (Huber's finite and étale morphisms, finite algebras over noetherian affinoids, completed
tensor products and affinoid fibre products, valuation amalgamation, the local structure of étale maps including
the import of Huber's Lemma 2.2.8) and R3 (Čech acyclicity of sheafy affinoids, Kiehl's theorem); the anchor's
Layers 2–5 (`AdicSpaces#layer-2-…` to `#layer-5-…`: rational-subset calculus, structure
presheaf and sheafiness predicates, sheafiness of strongly noetherian Tate rings, the category of adic spaces —
requested, see below); and, for the site of an arbitrary analytic adic space only, the Yoneda-adic spaces of part A1b
(`A1/generalized-adic-presentation` and its lemmas).

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

<a id="t009"></a> **T009** `A1/strongly-sheafy-huber-pair` (definition). `Huber.IsStronglySheafy A` for a complete Tate ring A:
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

<a id="t010"></a> **T010** `A1/finite-etale-affinoid-algebra` (construction). For a complete Tate pair
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

- <a id="t011"></a> **T011** `A1/finite-etale-strongly-sheafy` (theorem). If A is strongly sheafy, so is every B ∈ FÉt(A); so
  Spa(B, B⁺) is an affinoid adic space. The proof shows that B is monogenic locally on Spa(A, A⁺) (residue fields of
  Tate rings are infinite; a primitive element with unit discriminant spreads to a rational neighbourhood) and applies
  Hansen–Kedlaya Corollary 4.7. Boundary: A sheafy (or stably uniform) is not known to suffice.
- <a id="t012"></a> **T012** `A1/finite-etale-rational-descent` (lemma). For any complete Tate A, a finite rational covering is
  an effective descent morphism for finite étale algebras (Kedlaya–Liu Theorem 2.6.9).
- <a id="t013"></a> **T013** `A1/affinoid-system-approximation` (lemma) and <a id="t014"></a> **T014** `A1/finite-etale-approximation`
  (theorem). Every complete Tate pair is the completed direct limit of an affinoid system of noetherian Tate pairs
  (quotients of ℤ((z))⟨S⟩); Spa is the limit of the spectra, rational subsets and coverings live at a finite stage,
  and FÉt(A) ≃ 2-colim FÉt(A_α) (Kedlaya–Liu 2.6.2–2.6.8). This is how non-noetherian statements are reduced to
  Huber's noetherian theory.

#### A1a.3 Finite étale and étale morphisms

<a id="t015"></a> **T015** `A1/finite-etale-morphism` (definition). `AdicSpace.IsFiniteEtale f` for f: Y → X: X has a cover by
open affinoids V = Spa(A, A⁺) with f⁻¹(V) ≅ Spa(`finiteEtale A⁺ B`) over V, B ∈ FÉt(A) (Kedlaya–Liu 8.2.16, Scholze
2012 Definition 7.1(ii)).
API: `IsFiniteEtale`, `.spa`, `.id`, `.of_openCover`, `.isAffinoid_preimage`, `.isFinite`, `.isEtaleLocalDescription`,
`.comp`, `.baseChange`, `.of_comp`, `.surjective_iff`, `.iff_isFinite_and_etale`.
Tests: fold map X ⊔ X → X and ∅ → X (degenerate); a rational inclusion is étale but not finite étale; the squaring
map of the disc is finite but not finite étale; the plus-ring non-example over a rank-two field; comparison with
R0's finite + étale on noetherian spaces.

<a id="t016"></a> **T016** `A1/finite-etale-local-to-global` (theorem). Over an open affinoid V = Spa(A, A⁺) with A strongly
sheafy, f⁻¹(V) is affinoid and finite étale over V with ring O_Y(f⁻¹V); so on locally strongly sheafy X the local
definition agrees with the 'for every affinoid' form of ECD 6.2(i); X_fét of an affinoid is FÉt(A)^op (Kedlaya–Liu
8.2.17(a)); the degree is locally constant and f is surjective iff the degree is everywhere positive; f is finite in
R0's sense. Proof: rational descent, then sheafiness of the glued algebra.

<a id="t017"></a> **T017** `A1/etale-morphism` (definition). `AdicSpace.IsEtaleLocalDescription f`: every point of Y has an
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

<a id="t018"></a> **T018** `A1/etale-morphisms-local-description-and-comparison` (comparison). On a
locally noetherian analytic X (charts Spa of complete strongly noetherian Tate rings): A1-finite étale ⇔ finite and
Huber-étale (Huber 1.6.6(ii) via R0's `finite-etale-algebra-comparison`); A1-étale ⇔ Huber-étale (⇐ is Huber's Lemma
2.2.8 via R0's `etale-local-open-finite-etale-factorisation`, over a field de Jong–van der Put 3.1.4); hence Huber's
Et/X, with the same morphisms and coverings, is A1's, and every A1-étale map over X has Huber's standard
presentations, flatness, openness and local quasi-finiteness; étale X-spaces are again locally noetherian. This is
what AdicSpacesPartII:R4/etale-site-on-analytic-carriers cites.

#### A1a.5 Stability properties

All for X locally strongly sheafy; fibre products are formed among adic spaces.

- <a id="t019"></a> **T019** `A1/etale-base-change` (lemma): base change of finite étale and étale maps along any morphism
  from a locally strongly sheafy X', with the uncompleted affinoid formula Spa(`finiteEtale C⁺ (C ⊗_A B)`) and
  surjectivity of |Y ×_X X'| → |Y| ×_{|X|} |X'|. Fibre products of adic spaces are not claimed in general
  (Kedlaya–Liu Remark 8.2.5).
- <a id="t020"></a> **T020** `A1/etale-composition` (lemma): composites of finite étale, resp. étale, maps. The étale case
  ('finite étale after rational after finite étale is locally rational after finite étale after rational') is
  proved by descending the data to a noetherian stage of an affinoid system, where Huber's Lemma 2.2.8 applies, and
  base-changing back (Kedlaya–Liu 8.2.17(c)). Étale spaces over X are locally strongly sheafy.
- <a id="t021"></a> **T021** `A1/etale-diagonal` (lemma): the diagonal of an étale map is an open immersion, of a finite
  étale map an open and closed immersion (the diagonal idempotent of B ⊗_A B); equalisers of étale X-spaces are
  open subspaces; sections of étale maps are open immersions.
- <a id="t022"></a> **T022** `A1/etale-cancellation` (lemma): X-morphisms between étale (finite étale) X-spaces are étale
  (finite étale).
- <a id="t023"></a> **T023** `A1/etale-open-map` (lemma): étale maps are open; a quasi-compact étale map factors uniquely as a
  surjection onto a quasi-compact open followed by its inclusion (Kedlaya–Liu 8.2.17(b)); over an affinoid the image
  is a finite union of rational subsets.

#### A1a.6 The étale and finite étale sites

<a id="t024"></a> **T024** `A1/etale-site` (construction). For X locally strongly sheafy: `AdicSpace.smallEtale X` (Mathlib
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

<a id="t025"></a> **T025** `A1/finite-etale-site` (construction). `AdicSpace.smallFiniteEtale X` with jointly surjective
coverings: finite limits and coproducts; for affinoid X, X_fét ≃ FÉt(A)^op and a family is a covering iff the
product of the algebras is faithfully flat; the inclusion into X_ét defines X_ét → X_fét; functorial.
API: `smallFiniteEtale`, `smallFiniteEtaleTopology`, `ofArrows_mem_smallFiniteEtaleTopology_iff`,
`smallFiniteEtale.hasFiniteLimits`, `.toSmallEtale`, `.affinoidEquiv`, `.map`, `.fiberFunctor`, `.galoisCategory`.
Tests: Spa(K, K⁺)_fét ≃ FÉt(K)^op independently of K⁺; over Spa(C, C⁺) every object is split; a proper rational
inclusion is not an object; X_fét ≃ (CommAlgCat.FiniteEtale A)^op; covering iff ∏ B_i faithfully flat.

Further site statements:

- <a id="t032"></a> **T032** `A1/etale-structure-sheaf` (lemma): U ↦ O_U(U) and O⁺_U(U) are sheaves on X_ét, with
  λ_*O_{X_ét} = O_X (faithfully flat descent for finite étale surjections, via Mathlib's
  `CommRingCat.isLimitForkPushoutSelfOfFaithfullyFlat`). Higher acyclicity is cohomological and belongs to R3/H0.
- <a id="t030"></a> **T030** `A1/basis-comparison` (lemma): the basic objects — composites of rational localisations and
  finite étale maps over open affinoids — form a stable basis (X is stably adic, Kedlaya–Liu 8.2.19), each basic
  object is a strongly sheafy affinoid, and restriction Sh(X_ét) ≃ Sh(X_ét^aff) is Mathlib's
  `IsDenseSubsite.sheafEquiv`.
- <a id="t031"></a> **T031** `A1/etale-covering-reduction` (lemma): a property of coverings of basic objects that is stable
  under refinement and composition and holds for rational coverings and finite étale surjections holds for all
  (Kedlaya–Liu 8.2.20, after de Jong–van der Put 3.2.2, by induction on the degree using the complement of the
  diagonal); hence the sheaf criterion 'sheaf on each U_an and for finite étale surjections of basic objects'.
- <a id="t033"></a> **T033** `A1/slice-site` (lemma): U_ét ≃ X_ét/U with the induced topology (Mathlib
  `GrothendieckTopology.over`), restriction = `overPullback`; likewise U_fét ≃ X_fét/U when U → X is finite étale, and U_an ≃ X_an/U when U ⊆ X is open.

#### A1a.7 Geometric points, enough points, strict localisations

<a id="t026"></a> **T026** `A1/geometric-point-etale-split` (lemma). For S = Spa(C, C⁺): |S| is the chain of valuation rings
between C⁺ and O_C with the unique closed point s, every open containing s is S; finite étale S-spaces are finite
disjoint unions of copies of S; every étale V → S has a section through any point over s, and sections are open
immersions. Non-example: for C⁺ ≠ O_C, two copies of S glued along S ∖ {s} are étale over S but not a disjoint union
of opens of copies of S — étale S-spaces split near the closed point, not globally.

<a id="t027"></a> **T027** `A1/etale-site-and-geometric-points` (construction). `AdicSpace.GeometricPoint X`:
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

<a id="t028"></a> **T028** `A1/etale-enough-points` (theorem). One geometric point per point of X gives a conservative family
(Mathlib `IsConservativeFamilyOfPoints.mk'`), so X_ét has enough points and isomorphisms, monomorphisms and
epimorphisms of sheaves are detected on stalks (ECD Proposition 14.3's argument). Rank-one points are not enough.
The classification of all points of the topos is not claimed.

<a id="t034"></a> **T034** `A1/strict-localisation` (construction). X(ξ) is the cofiltered diagram of étale neighbourhoods of
ξ (the category of elements of ε_ξ) viewed as a pro-object; F(X(ξ)) = F_ξ; O_{X_ét, ξ} = colim O_U(U) with its map
to C and valuation; |X(ξ)| = lim |U|; functorial in (X, ξ).
API: `GeometricPoint.Neighbourhood`, `.isCofiltered_neighbourhood`, `strictLocalization`, `.eval`,
`.eval_iso_sheafFiber`, `.openNeighbourhood_final`, `GeometricPoint.localRing`, `.localRing_toField`,
`strictLocalization.space`, `strictLocalization.map`.
Tests: X(id) = Spa(C, C⁺) with local ring C; for a field K the local ring is K^sep; constant sheaves have stalk Λ;
over a rank-two field the strict localisation at the closed point has two points; F(X(ξ)) = `sheafFiber`.

<a id="t035"></a> **T035** `A1/strict-localisation-analytic` (theorem). O_{X_ét, ξ} is strictly henselian (a filtered colimit
of the henselian local rings O_{U,u} along local maps, with separably closed residue field whose completion C_ξ is
algebraically closed); |X(ξ)| ≅ |Spa(C_ξ, C_ξ⁺)|, C_ξ⁺ = C⁺ ∩ C_ξ — the strict localisation of an analytic adic space
is the spectrum of an algebraically closed affinoid field (Huber). For X = Spa(K, K⁺) the local ring is K^sep.

#### A1a.8 The finite étale fundamental group

<a id="t029"></a> **T029** `A1/finite-etale-galois-category` (theorem). For X connected and locally strongly sheafy and a
geometric point ξ, F_ξ is a fibre functor and X_fét is a Galois category (Mathlib `GaloisCategory`); π₁(X, ξ) =
Aut F_ξ is profinite and X_fét ≃ finite continuous π₁(X, ξ)-sets (`functorToContAction`). For a field,
π₁ = Gal(K^sep/K) whatever K⁺; the Kummer coverings of an annulus over ℂ_p give a surjection π₁ → ℤ̂(1).

#### A1a.9 The Kedlaya–Liu site of an arbitrary analytic adic space

<a id="t036"></a> **T036** `A1/etale-site-generalized` (construction). When X is not locally strongly sheafy the finite étale
covers of its affinoids are not known to be adic spaces, so the objects of the site are analytic Yoneda-adic spaces
(part A1b: `A1/generalized-adic-presentation`, with `yoneda-adic-open-immersions`,
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

#### Boundaries

- Huber's Lemma 2.2.8 is used through AdicSpacesPartII R0 .
- The Banach-ring inputs of Kedlaya–Liu Proposition 2.6.8 (Gel'fand spectrum, Hausdorff localisations, Lemmas
  2.2.3–2.2.4) are prerequisites of the approximation theorem; its proof must supply those analytic estimates.
- Kedlaya–Liu 8.2.17(b), (c) are proved in the source by a two-line reduction; the reduction is carried out in the
  composition and openness lemmas.
- The homeomorphism |X(ξ)| ≅ |Spa(C_ξ, C_ξ⁺)| requires the shrinking argument in Huber §2.5.
  Its proof is a separate target. The classification of all points of the étale topos is outside the
  scope, and subsequent targets use neither that classification nor this homeomorphism.
- Outside this layer: sheafiness of finite étale extensions of merely sheafy or stably uniform rings; fibre
  products of arbitrary adic spaces; any derived or cohomological statement (H0, R3);  the uniformisation comparison of finite étale algebras (A4).

The definitions retain the integral-closure plus ring throughout. Finite étale sheafiness
uses local monogenicity over Tate rings in the strong-sheafiness argument, rather than
an assertion that finite étale algebras over every sheafy ring remain sheafy.

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

**Definition** (<a id="t037"></a> **T037** `A1/pro-etale-morphism`, Scholze Definition 3.9). A morphism
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

The seven parts of Scholze's Lemma 3.10 are separate targets:

| target | statement |
|---|---|
| <a id="t042"></a> **T042** `A1/pro-etale-base-change` | base change along étale / finite étale / pro-étale maps exists, keeps the class, and `|U ×_V W| → |U| ×_{|V|} |W|` is surjective with nonempty compact fibres |
| <a id="t043"></a> **T043** `A1/pro-etale-etale-composition` | composites of étale (finite étale) maps are étale (finite étale) |
| <a id="t044"></a> **T044** `A1/pro-etale-quasicompact-opens` | a quasi-compact open `W ⊂ |U|` is represented by an étale subobject, which in `X_proét` has the universal property of an open subobject |
| <a id="t045"></a> **T045** `A1/pro-etale-maps-open` | pro-étale maps are open (via Huber 1.7.8, `AdicSpacesPartII:R0/smooth-morphism-open`) |
| <a id="t046"></a> **T046** `A1/pro-etale-surjective-etale-descent` | surjective (finite) étale maps to objects of `X_proét` come from a finite stage |
| <a id="t047"></a> **T047** `A1/pro-etale-composition` | pro-étale over pro-étale is pro-étale; every pro-étale map is an inverse system of finite étale surjections followed by an étale map |
| <a id="t049"></a> **T049** `A1/pro-etale-finite-limits` | `X_proét` has finite limits, computed in `pro-X_ét`: terminal object, fibre products and equalizers. An intersection of clopen subsets of a pro-étale object is represented by a pro-étale subobject |

The only nonformal input is <a id="t048"></a> **T048** `A1/etale-locally-finitely-many-components`: an affinoid
`Spa(B, B⁺)` étale over `X` has `B` strongly noetherian and sheafy, so its connected components
are the finitely many primitive idempotents of `B`. Thus a quasi-compact étale object
is a finite disjoint union of connected open and closed subspaces; every étale object is
locally connected.

#### 2. The corrected covering condition

The erratum restricts the coverings and leaves the category unchanged. The explicit form used here:

**Definition** (<a id="t038"></a> **T038** `A1/finite-etale-tower`). A *finite-étale tower* over
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

- <a id="t039"></a> **T039** `A1/finite-etale-tower-is-pro-etale`: a tower is `lim_{F∈K} V_F` with `K` the finite subsets of
  `λ` closed under a dependency function (finite by König's lemma), each `V_F → W` finite étale
  surjective; so towers are pro-étale and surjective. Conversely a pro-étale presentation indexed
  by a countable category is, beyond its threshold, a tower of length `ω`: the countable case is
  unchanged.
- <a id="t040"></a> **T040** `A1/transfinite-tower-splitting` (the erratum's replacement of Proposition 3.7(i)): a map of
  profinite sets `S = lim_{μ<λ} S_μ → S_0 = S'` whose steps are pullbacks of surjections of finite
  sets has a continuous section. Proposition 3.7(i) as printed is false and is not used.
- <a id="t041"></a> **T041** `A1/profinite-group-tower`: `G = lim_{μ<λ} G_μ` with `G_0 = 1` and finite kernels; for `A ⊂ B`
  closed of finite index, `G/A → G/B` is the pullback of `G/AN → G/BN` for an open normal `N` with
  `B ∩ N ⊂ A`; hence `G → G/G'` is a tower for every closed `G' ⊂ G`.
- <a id="t050"></a> **T050** `A1/etale-over-tower-swap`: an étale map followed by a tower is a tower followed by an étale map
  (transfinite induction on `λ`: at successors absorb the last finite étale step into the étale
  map; at limits factor the classifying map through a stage `μ_0 < λ`).
- <a id="t051"></a> **T051** `A1/corrected-covers-pretopology`: the **corrected coverings** — families `{U_i → U}` with
  `|U| = ⋃ f_i(|U_i|)` and each `f_i` a tower followed by an étale map — form a pretopology
  (isomorphisms; base change; composition via the swap). Every member is pro-étale and open;
  étale surjective families, towers and countably presented printed covers are coverings; every
  corrected covering is a covering of the printed Definition 3.9.

#### 3. The pro-étale site

**Construction** (<a id="t052"></a> **T052** `A1/pro-etale-site-corrected`; planet *Pro-étale site*).
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

**The projection ν** (<a id="t053"></a> **T053** `A1/proetale-projection-nu`). `c : X_ét → X_proét` is fully faithful,
preserves finite limits and coverings, so it is continuous and defines `ν : X_proét → X_ét` with
`ν_* F = F ∘ c` and `ν^*F` the sheafification of `V ↦ colim_j F(V_j)`.
<a id="t054"></a> **T054** `A1/nu-pullback-sections-qcqs` proves `(ν^*F)(lim U_j) = colim_j F(U_j)` for quasi-compact
quasi-separated `U`, hence `F ≅ ν_*ν^*F` and full faithfulness of `ν^*` on sheaves of sets: the
case `i = 0` of Lemma 3.16, which the consumers cite for `O_X = ν^*O_{X_ét}` and for sections over
Galois towers.

**Slices** (<a id="t066"></a> **T066** `A1/proetale-slice`). For `V ∈ X_ét`, `V_proét ≃ X_proét/V` as sites (Mathlib's
`GrothendieckTopology.over`), compatibly with `ν` and the étale slice of A1 (part a).

**Profinite sets** (<a id="t069"></a> **T069** `A1/profinite-set-objects`). For profinite `S = lim S_j`,
`S × X := lim ⊔_{s∈S_j} X` and `U × S := U ×_X (S × X)` satisfy `|U × S| = |U| × S` and, for
quasi-compact `V`, `Hom(V, U × S) = Hom(V, U) × C(|V|, S)`. For nonempty `S`, `U × S → U` has a section, so it
generates a covering sieve; it is a tower for `S` metrizable or `S = G/G'`. For an open
surjection `S → S'` without section, `X × S → X × S'` is pro-étale surjective but not a covering.

**Galois covers** (<a id="t070"></a> **T070** `A1/profinite-galois-cover-is-covering`). A pro-finite-étale `G`-torsor
`Ũ = lim Ũ_j → U` satisfies `Ũ ×_U Ũ ≅ Ũ × G`, is a tower (quotients `Ũ/N_μ` along the
erratum's filtration of `G`), hence a covering for every profinite `G`, and
`F(U) = eq(F(Ũ) ⇉ F(Ũ × G))`; for `F = ν^*F'` and `U` qcqs, `F(U) = F(Ũ)^G`.

#### 4. Profinite G-sets and the pro-finite-étale site

- <a id="t055"></a> **T055** `A1/profinite-g-sets-site` (construction): `G-fsets` (jointly surjective coverings) and
  `G-pfsets ≃ Pro(G-fsets)` with corrected coverings: members are `G`-towers followed by
  pullbacks of maps of finite `G`-sets. `F_M(S) = Hom_cont,G(S, M)` is a sheaf. API:
  `ProfiniteGSet`, `equivPro`, `IsGEtale`, `IsGTower`, `pretopology`, `sheafF`, `sheafF_apply`,
  `forgetTrivial`, `FiniteGSet.site`. Tests: `test_FM_on_G`, `test_summands`,
  `test_trivial_group`, `test_nonsplit`, `test_G_to_pt`.
- <a id="t056"></a> **T056** `A1/open-surjection-profinite-structure` (Lemma 3.6).
  If S → S′ is an open surjection of profinite G-sets, choose finite G-set quotients
  A_i → B_i and surjections S′ → B_i so that, over S′,
  S ≅ lim_i (A_i ×_{B_i} S′), each S → A_i ×_{B_i} S′ is surjective,
  S ≅ lim_i A_i and S′ ≅ lim_i B_i. This is a cofiltered presentation by finite
  surjections; it does not assert that S → S′ is a transfinite G-tower.
- <a id="t057"></a> **T057** `A1/free-g-profinite-sections-exact` (Proposition 3.7(ii)): free `S ≅ S/G × G`, and
  `F ↦ F(S)` is exact; the splitting comes from the tower `S → S/G`, not from the false 3.7(i).
- `A1/finite-etale-galois-category`: for connected `X` and a geometric point `x̄`, `X_fét` with
  `F_x̄ = Hom_X(x̄, −)` is a Galois category (Mathlib `GaloisCategory`, `FiberFunctor`);
  `π1(X, x̄) := Aut F_x̄` and `X_fét ≃` finite continuous `π1`-sets.
- <a id="t058"></a> **T058** `A1/pro-finite-etale-site-corrected` (construction): `X_profét = Pro(X_fét)` with coverings a
  pro-finite-étale tower followed by the pullback of a morphism of `X_fét`. API:
  `ProFetSite`, `topology`, `toProEtaleSite`, `isCovering_of_isFetTower`,
  `isCovering_summands`, `space`, `const`. Tests: `ProFetSite.test_field`,
  `test_alg_closed`, `test_summands` (the reading of the erratum that keeps summand covers),
  `test_inclusion`.
- <a id="t059"></a> **T059** `A1/profinite-etale-galois-sets` (Proposition 3.5): `X_profét ≃ π1(X, x̄)-pfsets` as sites.
- <a id="t060"></a> **T060** `A1/proetale-profinite-etale-morphism-of-sites` (Lemma 3.11): on `X_profét`, open equals
  pro-étale; the inclusion gives a morphism of sites `X_proét → X_profét`. The printed
  consequence "the notions of coverings coincide" is not asserted for the corrected coverings.

#### 5. Coherence and change of base field

- <a id="t061"></a> **T061** `A1/proetale-coherence` (Proposition 3.12(i)–(iii)): objects `lim U_i` with affinoid `U_i` are
  quasi-compact; those lying over an affinoid open of `X` form a generating family stable under
  fibre products of coherent objects; `Sh(X_proét)` is algebraic (D0's definition).
- <a id="t062"></a> **T062** `A1/proetale-quasicompactness-detection` (Proposition 3.12(iv)–(vii)): quasi-compactness and
  quasi-separatedness of objects and morphisms are detected on `|·|`; `X_proét` is coherent iff
  `|X|` is; `X_proét^qc` has the same topos for quasi-separated `X`.
- <a id="t067"></a> **T067** `A1/etale-descent-along-algebraic-extension`: for `X` of finite type over `Spa(K, K⁺)` and
  `L/K` separable algebraic, `|X_{L̂}| = lim |X_{L_i}|` and
  `2-colim (X_{L_i})_{ét,qcqs} ≃ (X_{L̂})_{ét,qcqs}` (standard étale presentations with polynomial
  equations, their perturbation stability, and perturbation of rational subsets).
- <a id="t068"></a> **T068** `A1/proetale-field-extension-slice` (Proposition 3.15): `X_{L̂,proét} ≃ X_proét/X_L`, with
  `X_L = lim X_{L_i}`. The hypothesis *finite type over K* replaces Scholze's *locally
  noetherian*, for which `X_{L̂}` need not be locally noetherian.

#### 6. Points

- <a id="t063"></a> **T063** `A1/proetale-fibre-morphism-of-topoi` (Proposition 3.13, first sentence): for `x ∈ X`,
  `Y_x = Spa(k(x)^, k(x)^+)`, a geometric point `x̄` and `G_x = π1(Y_x, x̄)`, the geometric-fibre
  functor `Φ_x(U) = lim Hom_X(x̄, U_i)` gives `i_x : Sh(G_x-pfsets) → Sh(X_proét)` with
  `i_x^*F` the sheafification of `V ↦ colim_{V → Φ_x(U)} F(U)`.
- <a id="t064"></a> **T064** `A1/proetale-fibre-conservativity` (second sentence): if all `i_x^*F = 0` then `F = 0`; the
  printed proof needs a pro-étale surjection to be a covering, which the corrected topology does not
  grant. This conservativity statement is a separate proof obligation for the corrected
  site; the printed argument does not establish it. It is not an input to any subsequent target.
- <a id="t065"></a> **T065** `A1/proetale-topos-enough-points` (erratum item (2)): for quasi-compact quasi-separated `|X|`,
  `Sh(X_proét)` is coherent, hence has enough points by Deligne's theorem (requested from D0),
  locally in general. The points are abstract; functors `S ↦ C(T, S)` for profinite `T` with two
  points are not points (they do not respect the covering of a disjoint union by its summands).

#### 7. Generalized adic presentations

**Site** (<a id="t071"></a> **T071** `A1/huber-pair-rational-site`). `CAff` = complete Hausdorff Huber pairs with
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

**Construction** (<a id="t072"></a> **T072** `A1/generalized-adic-presentation`; planet *Yoneda-adic spaces*).

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

- <a id="t073"></a> **T073** `A1/yoneda-adic-open-immersions`: open immersions into `Spa^Y(A, A⁺)` ↔ open subsets of
  `Spa(A, A⁺)`; `Spa^Y(A, A⁺)` is glued from any rational covering (the gluing ECD §15 uses for
  `Spd`).
- <a id="t074"></a> **T074** `A1/yoneda-adic-ind-ringed-description` (Berkeley Proposition 3.5.3): Yoneda-adic spaces are the
  objects of `(V)_ind` locally isomorphic to `Spa^ind(A, A⁺)` (structure presheaf sheafified in
  ind-topological rings); this gives `|F|` with `|Spa^Y(A, A⁺)| = Spa(A, A⁺)`. Sheafifying in
  topological rings instead does not describe maps between affinoids.
- <a id="t075"></a> **T075** `A1/maps-from-adic-spaces-to-yoneda-affinoids` (Kedlaya–Liu Lemma 8.2.9): for an adic space
  `X` and any complete pair, `Hom(X^Y, Spa^Y(A, A⁺)) = Hom((A, A⁺), (O_X(X), O_X⁺(X)))`.
- <a id="t076"></a> **T076** `A1/adic-spaces-in-yoneda-adic-spaces` (**agreement with the anchor**): `ι : Adic → YAdic` is
  fully faithful, `ι Spa(A, A⁺) ≅ Spa^Y(A, A⁺)` for sheafy pairs, preserves and reflects open
  immersions, `|ι X| = |X|`, essential image = Yoneda-adic spaces covered by `Spa^Y` of sheafy
  pairs.
- <a id="t077"></a> **T077** `A1/yoneda-adic-analytic-tate-local`: analytic points (Berkeley Definition 4.3.2) agree with the
  anchor's; analytic Yoneda-adic spaces are covered by Tate affinoids, maps out of Tate rings are
  adic, and analytic Yoneda-adic spaces are Kedlaya–Liu's preadic spaces.
- <a id="t078"></a> **T078** `A1/yoneda-adic-fibre-products`: analytic Yoneda-adic spaces have fibre products,
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

#### Covering conventions

The corrected topology includes the covering of a disjoint union by its summands.
Transfinite steps used to calculate the étale comparison arise from the étale category.
The field-extension slice theorem requires finite type over the base field. Fibre
conservativity remains a separate target; it is not inferred from an arbitrary
surjection in the pro-category.

<a id="a2"></a>

## A2. Separatedness, smooth charts, and classical analytic geometry

**Imported foundations:** AdicSpacesPartII R0 (separated, proper and smooth morphisms), R1
(analytification), R2 (formal models and generic fibres) and F0 (noetherian formal schemes). A2 is
the geometric comparison interface of this roadmap with those layers, in the scope that
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

<a id="t079"></a> **T079** `A2/supplier-contract-separated-proper-smooth` (comparison; declaration
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
- Consumer instance (DiamondsAndVStacks D3/D6, ECD §18): ECD recalls Huber's canonical compactifications of analytic adic spaces (Huber 1996, Theorem 5.1.5), which are built for the classical separated morphisms of this target; ECD Proposition 18.6 is the v-stack analogue.

#### A2.2 Relative closed polydiscs

<a id="t080"></a> **T080** `A2/relative-closed-polydisc` (construction; planet *Relative closed unit ball*;
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

<a id="t081"></a> **T081** `A2/relative-torus` (construction; planet *Relative torus*; declaration
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

<a id="t082"></a> **T082** `A2/smooth-morphism-ball-charts` (definition; planet *Smooth morphism*; declaration
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
- `AdicSpace.IsLocallyEtaleOverPolydisc.iff_smooth` (compatibility): On locally noetherian analytic adic spaces: IsLocallyEtaleOverPolydisc f ↔ AdicSpace.Smooth f (promoted to A2/smooth-local-ball-charts).

Unit tests:

- `isLocallyEtaleOverPolydisc_test_polydisc` (computation): π : B^n_Y → Y and T^n_Y → Y satisfy the definition with g the identity, resp. the open immersion.
- `isLocallyEtaleOverPolydisc_test_etale` (degenerate): An étale morphism (A1) satisfies the definition with n = 0 (B⁰_Y = Y).
- `isLocallyEtaleOverPolydisc_test_origin` (non-example): The closed embedding of the origin Spa(K, K°) → B¹_K is not locally étale over a relative ball: its image is not open, whereas étale maps and projections from balls are open.
- `isLocallyEtaleOverPolydisc_test_huber` (compatibility): For morphisms of locally noetherian analytic adic spaces the class coincides with AdicSpacesPartII:R0/smooth-morphism (A2/smooth-local-ball-charts); for example a smooth rigid curve over K.
- `isLocallyEtaleOverPolydisc_test_perfectoidBase` (characterisation): For an affinoid perfectoid Y = Spa(R, R⁺), B^n_Y = Spa(R⟨T⟩, R⁺⟨T⟩) → Y satisfies the definition although B^n_Y is not perfectoid for n ≥ 1 (AdicSpacesPartII:R5/perfectoid-times-polydisc).
Acceptance:

- B^n_Y → Y and T^n_Y → Y are locally étale over a relative ball; étale morphisms are (n = 0).
- ECD Proposition 24.4: a separated morphism of analytic adic spaces over Spa ℤ_p that is locally étale over a relative ball has ℓ-cohomologically smooth diamond (DiamondSixOperations S5).

<a id="t083"></a> **T083** `A2/smooth-local-ball-charts` (comparison; declaration `AdicSpace.IsLocallyEtaleOverPolydisc.iff_smooth`).
On locally noetherian analytic adic spaces, Huber's smooth morphisms (R0) are exactly the morphisms
locally étale over a relative ball; the ball dimension is the rank of `Ω_{X/S}` at the point, the chart
can be chosen inside any neighbourhood, and over a field it can be chosen to contain the closure of the
point (Scholze's refinement of Huber 1.6.10). Composition and base change correspond on both sides.

Acceptance:

- BHW, proof of Corollary 3.4: a smooth rigid space Y over a perfectoid extension L' of L is covered by opens étale over discs Spa L'⟨X₁, …, Xₙ⟩.
- Zavyalov, Remark 5.10: a smooth morphism factors locally as an étale map to D^d_S followed by the projection.
- For X = T¹_K → Spa K the chart is the rational embedding {|T| = 1} ⊆ B¹_K (n = 1).

#### A2.5 Compatible toric charts

<a id="t084"></a> **T084** `A2/relative-toric-charts` (lemma; declaration `AdicSpace.Smooth.exists_relativeToricChart`). For a
smooth morphism `f : X → Y` of smooth adic spaces over `Spa(K, K°)`, a point `x`, and an affinoid
`V ∋ f(x)` containing the closure of `f(x)` with a toric chart `h : V → T^m_K` (a composite of rational
embeddings and finite étale maps, R0/smooth-toric-chart), there are an affinoid `U ∋ x` containing the
closure of `x` and an étale `k : U → T^d_V`, again a composite of rational embeddings and finite étale
maps, such that `(id × h) ∘ k : U → T^{d+m}_K` lies over `h ∘ f` for the coordinate projection. This is
the reduction to `Tⁿ → T^{n−d}` used in Scholze 2013, Proposition 8.5, whose proof does not state it
; its proof is the relative chart compatibility target here.

Acceptance:

- For the coordinate projection X = Tⁿ_K → Y = T^{n−d}_K, V = Y and h = id, the chart k is the identity: this is the reduction step of Scholze 2013, Proposition 8.5.
- For f = π : B¹_V → V the chart is B¹_V ≅ {|T − 1| ≤ |ϖ|} ⊆ T¹_V.
- Consumer instance: PadicHodgeTheory:P8:local-rational/relative-poincare-lemma computes over toric covers of f with base coordinates X₁, …, X_m.

#### A2.6 Dimension and dimension estimates

<a id="t085"></a> **T085** `A2/dimension-of-adic-spaces` (definition; planet *Dimension of adic spaces*;
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

- <a id="t086"></a> **T086** `A2/relative-dimension-rank-one-fibres` (lemma; `AdicSpace.isPureRelDim_iff_rankOneFibres`):
  for `f` locally of finite type over a locally noetherian analytic base, relative pure dimension `d`
  is detected on the adic fibres over rank-one points (Huber 1.8.7).
- <a id="t087"></a> **T087** `A2/smooth-pure-relative-dimension` (lemma; `AdicSpace.Smooth.isPureRelDim`):
  a smooth morphism with `Ω` locally free of rank `d` has relative pure dimension `d`; étale morphisms
  have relative pure dimension 0; for smooth rigid spaces this is the classical dimension.
- <a id="t088"></a> **T088** `A2/weakly-finite-type-finite-dimension` (lemma; `AdicSpace.relDim_lt_top_of_isWeaklyFiniteType`):
  a morphism of weakly finite type between locally noetherian analytic adic spaces,
  with quasi-compact target, has finite relative dimension (Zavyalov, Lemma 3.7).
  Here weakly finite type includes quasi-compactness of the morphism.

The dimension comparisons use Huber §1.8, especially 1.8.4–1.8.9, through
AdicSpacesPartII R0 and the stated dimension targets. Zavyalov’s dimension statements
supply public comparison references; they do not replace every argument in Huber’s §1.8.

#### A2.7 Analytification

<a id="t089"></a> **T089** `A2/analytification-relative-polydisc-comparison` (comparison; declaration
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

<a id="t090"></a> **T090** `A2/smooth-etale-site-compatibility` (comparison; declaration
`AdicSpace.Smooth.ballCharts_mem_etaleTopology`). For a smooth morphism `f : X → S` of locally noetherian
analytic adic spaces, the objects of `X_ét` (A1, identified on these carriers by
`AdicSpacesPartII:R4/etale-site-on-analytic-carriers`) admitting an étale map to some `B^n_S` generate
a covering sieve; every object of `X_ét` is smooth over `S` with `u^*Ω_{X/S} ≅ Ω_{U/S}`; base change
of sites carries ball charts to ball charts; over a field, toric charts also generate a covering sieve.

Acceptance:

- For X = B¹_K the identity is a ball chart and the cover {|T| = 1} ∪ {|T − 1| = 1} gives toric charts (A2/relative-torus (e)).
- Consumer instance: PadicHodgeTheory:P8/vector-bundles-on-analytic-etale-and-proetale-sites and the sheaf Ω¹ on X_ét are computed on such covers.

#### A2.9 Formal schemes and generic fibres in the scope of H1

<a id="t091"></a> **T091** `A2/formal-generic-fibre-analytic-locus` (comparison; declaration
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

#### Imported interfaces and boundaries

- DiamondsAndVStacks (D3/D6) asks A2 for analytic adic spaces over `ℤ_p` with their diagonals,
  separated morphisms, classical valuative criteria and Huber's étale and finite étale sites: the
  category and analytic loci are the anchor's Layer 5 with AdicEtaleGeometry A0's analytic-locus
  interface, separatedness and the valuative criteria are A2.1, and the étale and finite étale sites
  are AdicEtaleGeometry A1's.
- PadicHodgeTheory P7 asks for Huber 1.6.10 charts containing the closure of a point (A2.4), Huber
  2.2.8 (AdicSpacesPartII R0), compatible toric charts (A2.5) and the sheaf `Ω¹` on `X_ét`, locally free
  of rank `dim X`: the rank statement is A2.6, and the coherent sheaf `Ω¹_{X/Y}` with its exterior
  powers is requested from AdicSpacesPartII R3 (the interface
  `AdicSpacesPartII:R3/sheaf-of-continuous-differentials` proposed there); A2.6 uses its étale-site version.
- Base change of smooth, étale and unramified morphisms (Huber 1.6.7) is requested from AdicSpacesPartII R0
  (the target `AdicSpacesPartII:R0/smooth-etale-base-change` proposed there).
- The general non-noetherian affinoid statement of ECD 6.4(iv) is A3's; A2's non-noetherian content is
  limited to the definitions of balls, tori and ball-chart smooth morphisms.

<a id="a3"></a>

## A3. The nonnoetherian affinoid étale approximation input

**Dependencies.** PerfectoidSpaces P1–P3 (perfectoid Tate rings and tilts, rational localisations, the sheaf theorem,
fibre products, almost purity, the étale site and its tilting), PerfectoidSpaces P5 (cofiltered limits of affinoid
perfectoid spaces and ECD 6.4(o)–(iii)), AdicSpacesPartII R0 (completed tensor products and their base-change formulas,
continuous differentials, the conormal sequence, Huber's noetherian étale theory), AdicSpacesPartII R3 (Tate's reduction
and Čech acyclicity on sheafy Tate affinoids, glueing squares, Kiehl gluing of finite projective modules), AdicSpacesPartII
R5 (sousperfectoid rings and spaces), AdicEtaleGeometry A1 (étale morphisms by local description, finite étale affinoid
algebras), and the Tau Ceti anchor's Layers 0–5 (Huber pairs, Tate rings and the open mapping theorem, restricted power
series, rational subsets with their universal property and perturbation invariance, sheafy pairs, adic spaces).
PerfectoidQuotients Q4 (ECD 5.8) is not an input: the closed immersions used here are built directly into the sousperfectoid ball, and the transfer between characteristics is made on étale categories (P3, P5) .

**Consumers.** PerfectoidSpaces P6 (affinoid pro-étale maps, ECD 7.10–7.11, and through it the strictly totally
disconnected covers of ECD 7.18 used by DiamondsAndVStacks D1), and RelativeFarguesFontaine RF0 (the chart-cover
argument for the integral curve).

The main target of A3 is **ECD Proposition 6.4(iv)**: for a cofiltered system X_i = Spa(R_i, R_i⁺) of affinoid perfectoid spaces with
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
   spaces are taken by local description (A1/etale-morphisms-local-description-and-comparison;
   Fargues–Scholze p. 135). X_{ét,aff} is the full subcategory of affinoid perfectoid spaces étale over X.
6. Modules are pseudocoherent in the sense of SGA 6 / Kedlaya–Liu (resolutions by finitely generated projectives), not
   in the sense of Hartshorne's Exercise I.2.11. Tensor products are algebraic unless written ⊗̂.
7. Characteristic p is used only through the Jacobian criterion (A3.3); every other statement holds for perfectoid
   bases of any characteristic. The passage between characteristics tilts étale categories, never closed immersions.

#### A3.1 Pseudocoherent modules and sheaves

The required cases of Kedlaya–Liu II, §§1.1–1.2 and 2.4–2.5: pseudocoherent modules over sheafy complete Tate pairs, no
imperfect period rings, no étale-site or pro-étale variants.

- <a id="t092"></a> **T092** `A3/pseudocoherent-module` (definition). For a commutative ring R and m ∈ ℕ ∪ {∞}, M is
  *m-pseudocoherent* if it has a projective resolution ⋯ → P₁ → P₀ → M → 0 with Pᵢ finitely generated for i ≤ m, and
  *m-fpd* if it has a resolution of length ≤ m by finitely generated projectives (Kedlaya–Liu II, Definition 1.1.1).
  0-pseudocoherent = `Module.Finite`, 1-pseudocoherent = `Module.FinitePresentation`; beyond that the notion is new to
  Mathlib. API: `Module.IsPseudoCoherent`, `Module.IsFPD`, `zero_iff`, `one_iff`, `of_projective`,
  `IsFPD.isPseudoCoherent`, `mono`, `tensorProduct` (Remark 1.1.3, with one factor flat), `baseChange_of_flat`,
  `baseChange_of_isPseudoCoherent_algebra` (Stacks 064Z: for a finite algebra that is pseudocoherent as a module, pseudocoherence of an S-module over S and over R agree),
  `of_isNoetherianRing`. Unit tests: `test_quotient_nonZeroDivisor` (R/fR is 1-fpd), `test_finiteProjective`,
  `test_not_two` (over R = k[x, y₁, y₂, …]/(x·yᵢ) the finitely presented R/xR is not 2-pseudocoherent — rules out
  "pseudocoherent = finitely presented"), `test_noetherian`.
- <a id="t093"></a> **T093** `A3/pseudocoherent-two-out-of-three` (Lemma 1.1.5) and <a id="t094"></a> **T094** `A3/koszul-regular-sequence-fpd` (a weakly regular sequence
  f₁, …, f_r in the sense of Mathlib `RingTheory.Sequence.IsWeaklyRegular` gives a Koszul resolution: R/(f) is r-fpd and
  (f)/(f)² is free on the fᵢ).
- <a id="t095"></a> **T095** `A3/natural-topology-strict-exactness` (Kedlaya–Liu II, §1.2). Over a complete Tate ring: the natural topology of a
  finite module is Mathlib's `moduleTopology`, linear maps out of finite modules are continuous, continuous surjections
  of complete metrizable modules are strict (Tau Ceti `IsTateRing.isOpenMap`), Hausdorff finite modules are complete,
  finitely generated submodules of complete finite modules are closed (Corollary 1.2.11), completion preserves strict
  exact sequences (AdicSpacesPartII:R0/strict-complex-completion-exact).
- <a id="t096"></a> **T096** `A3/stably-pseudocoherent-module` (definition; planet *Stably pseudocoherent module*). Over a complete Tate pair
  (A, A⁺): *strictly* m-pseudocoherent = m-pseudocoherent and complete for the natural topology; *stably*
  m-pseudocoherent = m-pseudocoherent with M ⊗_A B complete for every rational localisation B (Definitions 1.2.13,
  2.4.1). API: `Huber.IsStrictlyPseudoCoherent`, `Huber.IsStablyPseudoCoherent`, `Huber.IsStablyFPD`,
  `isStrictlyPseudoCoherent`, `IsStablyFPD.isStablyPseudoCoherent`, `of_projective`, `completeSpace`, `baseChange`,
  `of_exact`, `of_isStronglyNoetherian`. Unit tests: `test_finiteProjective`, `test_tateAlgebra_quotient`
  (ℚ_p⟨T⟩/(T)), `test_not_stably` (Kedlaya–Liu II, Example 2.4.2: a quotient A/fA of an affinoid perfectoid ring that is
  strictly but not stably pseudocoherent), `test_strongly_noetherian`.
- <a id="t097"></a> **T097** `A3/pseudoflat-module` (definition, Definitions 2.4.4 and 2.4.6). B is *m-pseudoflat* over A if Tor₁^A(P, B) = 0 for
  all stably m-pseudocoherent P; *pro-projective* modules have continuous projectors with finite projective images
  converging to the identity. 2-pseudoflat implies pseudoflat; only Tor₁ is controlled. API: `Huber.IsPseudoFlat`,
  `Huber.IsProProjective`, `of_flat`, `of_isProProjective`, `iff_injective_rTensor`, `mono`, `comp`,
  `baseChange_isStablyPseudoCoherent`. Unit tests: `test_flat`, `test_restrictedPowerSeries` (A⟨T⟩ and A⟨T^{±1}⟩),
  `test_quotient_not` (ℚ_p⟨T⟩/(T) is not pseudoflat), `test_iff_injective`.
- <a id="t098"></a> **T098** `A3/restricted-power-series-pro-projective` (Lemma 2.4.7, Corollaries 2.4.8–2.4.9: M ⊗_A A⟨T⟩ = M⟨T⟩ for complete
  finitely presented M), <a id="t099"></a> **T099** `A3/simple-laurent-strict-multiplication` (Lemma 2.4.10: over a sheafy pair, ×(T − f) and
  ×(1 − fT) are strict injections of A⟨T⟩ and A⟨T^{±1}⟩, so the simple Laurent localisations are A⟨T⟩/(T − f),
  A⟨T⟩/(1 − fT) without closure), <a id="t100"></a> **T100** `A3/simple-laurent-pseudoflat` (Lemmas 2.4.12–2.4.13), and
  <a id="t101"></a> **T101** `A3/rational-inclusion-reduction` (Kedlaya–Liu I, Proposition 2.4.24: a transitive property of rational inclusions
  that holds on simple Laurent pieces holds for all).
- <a id="t102"></a> **T102** `A3/rational-localisation-pseudoflat` (theorem, Theorem 2.4.15). Rational localisations of a sheafy pair are
  2-pseudoflat; base change preserves stable m-pseudocoherence (m ∈ {2, ∞}) and is exact on it. This is the substitute
  for flatness, which is not known in the non-noetherian case (Remark 2.2.8).
- <a id="t103"></a> **T103** `A3/pseudocoherent-tate-acyclicity` (theorem, Theorem 2.5.1). For M stably pseudocoherent over a sheafy pair,
  M̃(U) = M ⊗_A O(U) is a sheaf on rational subsets with exact augmented Čech complexes on all finite rational coverings.
  <a id="t104"></a> **T104** `A3/fpd-local-to-global` (Corollary 2.5.2): finite projective dimension, in particular projectivity, is local on
  rational coverings.
- <a id="t105"></a> **T105** `A3/pseudocoherent-sheaf` (definition, Definition 2.5.3). A sheaf of O_X-modules on an adic space covered by sheafy
  Tate affinoids is *pseudocoherent* (*fpd*) if it is locally M̃ with M stably pseudocoherent (stably fpd). API:
  `AdicSpace.IsPseudoCoherentSheaf`, `AdicSpace.IsFPDSheaf`, `of_module`, `restrict`, `ker_of_surjective`,
  `coker_of_injective`, `isStablyPseudoCoherent_sections`, `equivModule`, `IsFPDSheaf.isPseudoCoherentSheaf`. Unit
  tests: `test_structureSheaf`, `test_vectorBundle` (compatibility with AdicSpacesPartII:R3's vector bundles),
  `test_tateAlgebra_ideal` (compatibility with R3's coherent sheaves on Spa ℚ_p⟨T⟩), `test_pushforward_not` (j_*O_U for
  the rational open U = {|T| ≤ |p|} is not pseudocoherent: O(U) is not finite over ℚ_p⟨T⟩).
- <a id="t106"></a> **T106** `A3/simple-laurent-pseudocoherent-descent` (Lemma 2.5.4) and **<a id="t107"></a> **T107** `A3/pseudocoherent-kiehl-gluing`** (theorem, Theorem
  2.5.5 and Corollary 2.5.6; planet *Pseudocoherent Kiehl gluing*). On a sheafy Tate affinoid, global sections are an
  exact equivalence between pseudocoherent (fpd) sheaves and stably pseudocoherent (stably fpd) modules, and base
  extension along open immersions is exact and pseudoflat. Strongly noetherian case: Kiehl's theorem
  (AdicSpacesPartII:R3/tate-kiehl-affinoid); finite projective case: R3/sheafy-tate-acyclicity-and-kiehl-gluing.

#### A3.2 Standard étale presentations and the implicit function theorem

- <a id="t108"></a> **T108** `A3/restricted-power-series-newton` (lemma). Over a complete Tate ring C with ring of definition C₀ ∋ ϖ: if
  F ∈ C₀⟨T⟩^N, t ∈ C₀^N, the Jacobian J(t) has an inverse bounded by |ϖ|^{−k} and F(t) ∈ ϖ^{2k+1}C₀^N, then F has a
  unique zero t* ∈ t + ϖ^{k+1}C₀^N, functorial in C and continuous in parameters. Taylor expansion uses Hasse
  derivatives, so the lemma holds in characteristic p.
- <a id="t109"></a> **T109** `A3/perturbation-of-generators` (lemma). X ↦ X + ε(X) with ε ∈ ϖA₀⟨X⟩ⁿ is an automorphism of A⟨X⟩; hence a small
  perturbation of a strong generating system of a quotient pair is again one, and a presentation transports to
  F ∘ θ_ε with Jacobian changed by a unit ≡ 1 mod ϖ. This is point (3) of Huber's proof of 1.7.1 without its
  noetherian hypothesis.
- **<a id="t110"></a> **T110** `A3/standard-etale-presentation`** (definition; planet *Standard étale presentation*). A standard étale
  presentation of (C, C⁺) over a complete Tate pair (A, A⁺) is (N, F, k, π): F ∈ A⁺⟨T₁, …, T_N⟩^N, π: A⟨T⟩ → C a quotient
  mapping with kernel the closure of (F), and π(J_F) a unit with ϖᵏπ(J_F)^{−1} ∈ C⁺. The *explicit-inverse form*
  F = (F', S·J_{F'} − ϖ^{k'}) encodes the Jacobian inverse as an equation (then k = 2k'); it is the form that is
  perturbed and approximated. Equal numbers of equations and variables, weights all 1 (the Tate case of Huber's
  A⟨X⟩_{T₁,…,T_n}), closure of the ideal always taken, plus ring always the integral closure. API:
  `Huber.StandardEtalePresentation`, `jacobian`, `isUnit_jacobian`, `quotientEquiv`, `withInverse`, `ofRational`,
  `ofFiniteEtale`, `comp`, `baseChange`, `kaehler_eq_zero`, `tube`, `perturb`. Unit tests: `test_rational`
  ((tTᵢ − sᵢ) presents A⟨s/t⟩ with Jacobian tⁿ), `test_zero`, `test_frobenius_not` (T^p − a in characteristic p has
  Jacobian 0), `test_finiteEtale` (Mathlib's submersive presentations of étale algebras).
- <a id="t111"></a> **T111** `A3/standard-presentation-basic-pieces` (lemma). Rational localisations, finite étale algebras (with their natural
  topology and integral-closure plus ring), composites and rational subsets of presented pairs all have standard étale
  presentations; the Jacobian of a composite is the product.
- **<a id="t112"></a> **T112** `A3/tubular-neighbourhood`** (theorem; planet *Nonarchimedean implicit function theorem*). For e ∈ O⁺(R)^N on a
  rational R ⊆ B^N_X with Jacobian bounded below by |ϖᵏ| on the tube
  W = R ∩ {|eᵢ| ≤ |ϖ^m|} ∩ {|ϖᵏ| ≤ |Δ|} (m ≥ 2k + 1), and A with uniform rational localisations of its Tate algebras
  (for instance A sousperfectoid):

  ```text
  O(W) ≅ C⟨u₁, …, u_N⟩,   e ↦ ϖ^m u,   C = O(W)/(e) = O(V(e) ∩ W),
  ```

  i.e. W ≅ (V(e) ∩ W) ×_X B^N(|ϖ|^m), and the same on every rational W' ⊆ W; (e) is closed there.
- <a id="t113"></a> **T113** `A3/standard-presentation-perturbation` (theorem). For a presentation in explicit-inverse form with exponent k and
  G ≡ F modulo ϖ^{4k+2}: V(G) lies in the tube of F, G is again a standard étale presentation, and there is a unique
  isomorphism α_{F,G}: C → C_G over A with α(T) close to T. The comparison maps are mutually inverse on the tube (no
  further shrinking), compose, commute with base change and match plus rings. In Huber's noetherian scope this is
  AdicSpacesPartII:R0/etale-presentation-perturbation (Huber 1.7.2).
- <a id="t114"></a> **T114** `A3/standard-etale-locus-sousperfectoid` (lemma). Over a sousperfectoid base a standard étale locus is sousperfectoid:
  the tube makes C a C-linear direct summand of the sousperfectoid O(W), and a frame of O(W) restricts to a frame of C.
  Hence the locus is a sousperfectoid affinoid adic space — the étale case of the sousperfectoid clause of FS IV.4.17.
- <a id="t115"></a> **T115** `A3/fs-iv-4-13-regular-sequence` (lemma). On every rational subset W' of the tube, e is a weakly regular sequence with
  closed ideal and free conormal module; O(W)/(e) is stably N-fpd.

#### A3.3 The Fargues–Scholze specialisations by analytic algebra

The étale specialisations of Fargues–Scholze §IV.4.1 (arXiv v4, pp. 135–141) are
reconstructed using analytic algebra. The dependency order is: the tube theorem gives
regular sequences and finite projective dimension; the characteristic-p Jacobian
criterion supplies the étale parts of IV.4.15 and IV.4.17; pseudocoherent gluing and the
integral cut-off then give the closed-image and conormal statements used in IV.4.19.
The arguments of IV.4.14, IV.4.16 and IV.4.18 involving diamonds are not inputs.

The specialisations targeted are exactly those ECD 6.4(iv) uses: étale (relative dimension 0) loci and closed immersions
of affinoid étale perfectoid spaces into rational subsets of relative balls over affinoid perfectoid bases. The smooth
cases over general sousperfectoid bases are outside this construction.

- <a id="t116"></a> **T116** `A3/char-p-perfectoid-base-field` (lemma). A perfectoid Tate pair (R, R⁺) of characteristic p is an algebra over the
  perfectoid field K = F_p((t^{1/p^∞}))^∧ (t ↦ ϖ) with R⁺ a K°-algebra; so Scholze 2012, Lemma 6.13 writes it as a
  completed colimit of p-finite algebras, completed perfections of reduced K-affinoid algebras of topologically finite
  type (PerfectoidSpaces:P2/completed-direct-limits-of-p-finite-affinoids).
- <a id="t117"></a> **T117** `A3/jacobian-criterion-char-p` (theorem; FS IV.4.15(ii) and IV.4.17, étale case). Over B = O(Q), Q rational in B^m_X
  with X affinoid perfectoid of characteristic p, a standard étale locus is étale over Spa(B) by local description; for
  m = 0 it is affinoid perfectoid and étale over X in ECD's sense (its ring is perfect). Maps between rational subsets of
  balls with invertible Jacobian are étale. Proof: approximate the finitely many coefficients by a strongly noetherian
  K-affinoid algebra (previous target), use Huber's noetherian theory (AdicSpacesPartII:R0/etale-local-structure,
  R0/etale-affinoid-finite-etale-embedding, R0/etale-local-open-finite-etale-factorisation), base change along the
  sousperfectoid Spa(B) (AdicSpacesPartII:R5/sousperfectoid-etale-base-change), and perturb back
  (A3/standard-presentation-perturbation) — the strategy of Scholze 2012, Proposition 7.7.
- <a id="t118"></a> **T118** `A3/integral-cutoff-graph-presentation` (lemma). Given a morphism g: Spa(C) → R ⊆ B^N_X with C standard étale over A,
  functions w ∈ O(R) whose images are close to C's generators, and monic polynomials P_l over O⁺(R) with |P_l(g*w_l)|
  small on Spa(C): the rational subset R'' = {|P_l(w_l)| ≤ |ϖ^M|} contains g(Spa C), forces |w_l| ≤ 1 (a monic
  polynomial with bounded coefficients is large where its argument is), and its complement pieces
  Q_l = {|P_l(w_l)| ≥ |ϖ^M|} miss Spa(C). On R'' the map O(R'') → C is a quotient mapping and, through the graph of w and
  the tube theorem, C is a stably pseudocoherent O(R'')-module. This integral cut-off is what removes the boundary
  specialisations (points with |w| = 1⁺) that otherwise prevent the image of Y from being closed.
- <a id="t119"></a> **T119** `A3/fs-iv-4-19-zariski-closed-char-p` (theorem; FS IV.4.19–IV.4.20). For g: Y → Y' ⊆ B^N_X (Y' a finite union of
  rational subsets, Y affinoid perfectoid étale over X): local surjectivity on a rational covering of Y' (i) implies it
  on every rational subset (ii); then the ideal sheaf is pseudocoherent and O(V')/I(V') = O(g^{−1}V') with integral
  closure plus ring (the *affine quotient* and *plus-ring description*). Valid for perfectoid bases of any
  characteristic.
- <a id="t120"></a> **T120** `A3/etale-standard-piece-cover` (lemma). An affinoid perfectoid Y étale over affinoid perfectoid X has a standard
  rational covering Y(σ/σ_j) by pieces that are rational subsets of spaces finite étale over rational subsets of X,
  each with a standard étale presentation.

#### A3.4 The closed embedding of an affinoid étale object

- <a id="t121"></a> **T121** `A3/integral-approximation-of-generators` (lemma). On V = Y(σ/σ_j), every ū ∈ O⁺(V) is approximated by some z that is
  a root of a monic polynomial whose coefficients are polynomials in the ratios σᵢ/σ_j with coefficients in finitely
  many global elements of B⁺, and z by b/σ_j^s with b ∈ B (Kedlaya–Liu I, Lemma 2.4.13(a): plus rings of rational
  localisations are completed integral closures).
- <a id="t122"></a> **T122** `A3/affinoid-etale-zariski-closed-embedding` (theorem). For Y = Spa(B, B⁺) affinoid perfectoid étale over affinoid
  perfectoid X there are b ∈ (B⁺)^N with A⟨T₁, …, T_N⟩ → B, T ↦ b, a quotient mapping; its kernel I is stably
  pseudocoherent and Ĩ is a pseudocoherent ideal sheaf on B^N_X. ECD asserts this closed immersion; A3 constructs it:
  global coordinates (the σᵢ, a unit-ideal certificate aᵢ, the coefficients β of the monic equations, and the
  numerators b of the approximations), the rational covering
  R₀ = {|h| ≥ |ϖ^{2c+1}|} ∪ {R''_j} ∪ {Q_{jl}} of the whole ball built from the integral cut-off, and
  A3/fs-iv-4-19-zariski-closed-char-p with Y' = B^N_X.
- <a id="t123"></a> **T123** `A3/conormal-description` (lemma). Ω^c_{O(Y)/A} = 0 and δ: I/I² → ⊕ O(Y)·dTᵢ is an isomorphism — the conormal identification needed in ECD’s proof of 6.4(iv).
- <a id="t124"></a> **T124** `A3/local-equations-near-closed-subspace` (lemma). Lifts e₁, …, e_N ∈ I of the basis dTᵢ have Jacobian ≡ 1 on Y; in
  the tube of e, the kernel K of O(W₀)/(e) → O(Y) satisfies K = K² and is finitely generated, hence generated by an
  idempotent (Mathlib `Ideal.isIdempotentElem_iff_of_fg`); cutting the other component off by a rational condition
  gives W with O(W)/(e) = O(Y). This replaces Fargues–Scholze's "closed immersion and étale, hence locally an
  isomorphism".
- **<a id="t125"></a> **T125** `A3/global-standard-etale-presentation`** (theorem; planet *Huber 1.7.1 for affinoid perfectoid spaces*). Every
  affinoid étale Y over affinoid perfectoid X has a standard étale presentation over (A, A⁺), in explicit-inverse form;
  in characteristic p, conversely, every standard étale presentation defines an affinoid perfectoid space étale over X.

#### A3.5 Finite-stage approximation and ECD 6.4(iv)

- <a id="t126"></a> **T126** `A3/tilting-affinoid-etale-and-limits` (lemma). Tilting commutes with cofiltered limits of affinoid perfectoid spaces
  (R^{♭+}/ϖ^♭ = R⁺/ϖ = colim R_i⁺/ϖ) and identifies the functors of 6.4(iv) for (X_i) and (X_i^♭).
- <a id="t127"></a> **T127** `A3/cofiltered-limit-presentation-approximation` (lemma). R⁺⟨T⟩/ϖ^M = colim (R_i⁺/ϖ^M)[T], so finitely many equations
  and the rational data are approximated over some R_i⁺; base change of a presentation over R_i presents the fibre
  product with X.
- <a id="t128"></a> **T128** `A3/finite-stage-approximation-char-p` (theorem). In characteristic p: approximate the explicit-inverse presentation of
  Y modulo ϖ^{4k+2} over R_i; the approximating locus Y_i is affinoid perfectoid and étale over X_i (Jacobian criterion)
  and Y_i ×_{X_i} X ≅ Y (perturbation). The approximated Jacobian inverse is part of the data, so the finite-stage locus
  has invertible Jacobian everywhere.
- <a id="t129"></a> **T129** `A3/independence-of-presentations` (lemma). Models from different presentations, approximations and indices become
  uniquely isomorphic over some X_j (P5's 6.4(ii) full faithfulness); the model is the P5 qcqs descent of Y, which is
  therefore affinoid at a finite stage.
- **<a id="t130"></a> **T130** `A3/affinoid-etale-finite-stage-6-4-iv`** (theorem; planet *Affinoid étale finite-stage descent*). The equivalence
  2-colim (X_i)_{ét,aff} → X_{ét,aff} for any cofiltered system of affinoid perfectoid spaces, in any characteristic.
- <a id="t131"></a> **T131** `A3/etale-descent-to-finite-stage-6-4` (comparison). ECD Proposition 6.4 assembled: (o)–(iii) and the cardinal bound
  are PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces and P5/finite-stage-descent-of-qcqs-etale-objects;
  (iv) is the target above; the inclusions X_{fét} ⊆ X_{ét,aff} ⊆ X_{ét,qc,sep} ⊆ X_{ét,qcqs} are compatible with all four
  comparison functors. A3 does not reprove (o)–(iii); P5 does not claim (iv).
- <a id="t132"></a> **T132** `A3/zariski-closed-immersion-ecd-comparison` (comparison). The closed embedding of A3.4, composed into the perfectoid
  ball, is strongly Zariski closed in the sense of ECD 5.7, directly. ECD 5.8 (PerfectoidQuotients Q4) is not
  imported, and the 6.4(iv) proof does not need it .

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

#### Boundaries

- PerfectoidSpaces P5 owns ECD 6.4(o)–(iii), the cofiltered limits and the cardinal bounds; A3 owns 6.4(iv) and the
  analytic algebra behind it. DiamondsAndVStacks D6 owns the identification of étale sites of analytic adic spaces with
  those of diamonds (ECD 15.6); A3 uses neither it nor ECD 11.30.
- Fargues–Scholze IV.4.13–IV.4.19 in their general (smooth, sous-perfectoid-base) form are not imported: their printed
  proofs rest on ECD 12.17, 15.6, 11.30 and on descent to strictly totally disconnected bases. Only the étale
  perfectoid-base specialisations are targets here.
- Kedlaya–Liu II, Remark 2.4.3 (stable pseudocoherence of quotients with sheafy quotient) cites additional lecture notes
  and is not used; Kedlaya–Liu's open points (flatness of rational localisations, Fitting ideals of pseudocoherent
  modules, the T − f case of Lemma 2.4.12) are outside the claimed input.
- Inherited through cited suppliers: Huber 1996 Lemma 2.2.8 and the de Jong–van der Put inputs (AdicSpacesPartII R0),
  used by the characteristic-p Jacobian criterion; the Bosch–Güntzer–Remmert inputs of Scholze 2012, Lemma 6.13
  (PerfectoidSpaces P2); the perfectoid-field generality of the P2/P3 targets, requested in the generality of perfectoid
  Tate rings for the tilting transfer.
<a id="a4"></a>

## A4. Analytic adic presentations for diamondification

**Dependencies.** AdicEtaleGeometry A1 (finite étale algebras over complete Tate Huber pairs with their natural
topology and integral plus ring, `A1/finite-etale-affinoid-algebra`; the finite étale and étale sites
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
   topology (the uniform topology used in Berkeley Lecture 10), not the colimit of chosen rings of
   definition.
7. **Uniform completion.** The uniform completion of a Tate pair is its uniformization in the sense of
   AdicSpacesPartII R0 (separated completion for the spectral seminorm, plus ring the closure of the image). For
   the colimit of a tower it is the Hausdorff completion, since A_∞ is uniform.
8. **Perfectoid.** Perfectoid Tate rings are those of PerfectoidSpaces P1 (ECD Definition 3.1: complete, uniform,
   a pseudouniformizer ϖ with ϖ^p | p in R°, and Φ : R°/ϖ → R°/ϖ^p bijective).
9. **Completeness.** A4's statements are for complete Tate rings A. For a Tate ℤ_p-algebra that is not complete,
   the construction is applied to its completion Â; its adic spectrum is that of A, and D6 uses
   Spd(A, A⁺) = Spd(Â, Â⁺). A torsor tower over the non-complete ring itself need not have a perfectoid
   uniform completion.
10. **Actions on spectra.** G acts on Spa(B, B⁺) by (g·y)(b) = y(g⁻¹b). Presentations require the map of adic
    spectra to be spectral (quasi-compact) as well as surjective: surjectivity on points alone is not the
    compactness condition.

#### A4.1 Rings without nonsplit finite étale covers

<a id="t133"></a> **T133** `A4/finite-etale-split-ring` (definition; planet "Ring with no nonsplit finite étale covers").
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

<a id="t134"></a> **T134** `A4/finite-etale-galois-torsor` (definition). `Algebra.IsFiniteEtaleTorsor G A B`: B is finite
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

<a id="t136"></a> **T136** `A4/finite-etale-algebras-filtered-colimit` (lemma; Kedlaya–Liu Remark 1.2.9). For a filtered
colimit R = colim R_i of rings, base change is an equivalence 2-colim FÉt(R_i) ≅ FÉt(R); faithful flatness,
sections and total splittings over R are already present over some R_j.

<a id="t137"></a> **T137** `A4/splitting-torsor-of-finite-etale-algebra` (lemma). Every finite étale A-algebra S is totally
split by some finite étale torsor A → P. After padding S to constant rank n, P is the direct factor of S^{⊗n}
cut out by ε = ∏_{a<b}(1 − δ_{ab}) (δ the diagonal idempotent of S ⊗_A S), with S_n permuting the factors — the
algebra of ordered n-tuples of distinct points in the fibres; on geometric fibres P ⊗ k ≅ k^{S_n}, and the universal
frame S ⊗_A P → P^n is an isomorphism. This is the ring-theoretic form of the Galois-closure construction for
Galois categories (Stacks 0BN2), needed because Spec A may be disconnected.

<a id="t138"></a> **T138** `A4/finite-etale-torsor-tower` (construction; planet "Finite étale torsor tower"). The structure
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

<a id="t139"></a> **T139** `A4/uniform-completion-etale-comparison` (theorem; planet "Invariance under uniformization").
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

<a id="t140"></a> **T140** `A4/completed-tower-pair` (construction; planet "Completed torsor tower"). For (A, A⁺) complete
Tate and a tower T: the levels (A_i, A_i⁺) are A1's Huber pairs of finite étale algebras; the colimit
(A_∞, A_∞⁺ = colim A_i⁺) with the topology of convention 6 is a *uniform* Tate pair (A_∞° ⊆ ϖ⁻¹·colim A_i°: for power-bounded x,
ϖx is topologically nilpotent, hence integral over colim A_i°, which is integrally closed in A_∞); its uniformization (Â_∞, Â_∞⁺) is its Hausdorff
completion, with Â_∞⁺ the closure of colim A_i⁺ — the uniform completion used in ECD §15. G acts continuously on
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

<a id="t135"></a> **T135** `A4/henselian-pairs-filtered-colimit` (lemma; Stacks 0FWT). A filtered colimit of henselian pairs is
henselian, in Mathlib's `HenselianRing` form (roots lifting simple roots modulo I).

<a id="t141"></a> **T141** `A4/finite-etale-invariance-along-tower` (lemma). For (A, A⁺) complete Tate and any tower:

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

<a id="t142"></a> **T142** `A4/finite-etale-effective-descent-along-tower` (lemma). With s(b) = (g ↦ b), t(b) = (g ↦ g·b) and
the face maps (d₀f)(g, h) = g·f(h), (d₁f)(g, h) = f(gh), (d₂f)(g, h) = f(g), finite étale A-algebras are equivalent
to finite étale Â_∞-algebras with descent data over C^0(G, Â_∞) satisfying the cocycle condition over
C^0(G × G, Â_∞) — equivalently, finite étale Â_∞-algebras with a continuous semilinear G-action. Descent data come
from a finite level (previous lemma) and are effective there by faithfully flat descent along A → A_i (Mathlib
`comonadicExtendScalars`, `Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`). This is the effectivity
of finite étale data along the tower that the stage asks for.

#### A4.6 Perfectoidness

<a id="t143"></a> **T143** `A4/root-of-monic-in-split-tate-ring` (lemma). Over a complete Tate ring R without nonsplit
covers, a monic P ∈ R°[X] with P′(x) = u(1 − τ) in R[X]/(P), u ∈ R^× and τ topologically nilpotent, has a root, and
all roots lie in R°: R[X]/(P) is complete and free, 1 − τ is a unit (Tau Ceti `IsTopologicallyNilpotent.isUnit_one_sub`),
so (P, 1) is a standard étale pair and the free algebra of rank ≥ 1 has a section.

<a id="t144"></a> **T144** `A4/pseudouniformizer-dividing-p` (lemma). For a pseudouniformizer ϖ₀ and n with p^n ∈ ϖ₀R° and
p^{n−1} > n, a root ϖ of X^{p^n} − ϖ₀X − ϖ₀ is a pseudouniformizer with ϖ^{p^n} = ϖ₀(1 + ϖ), 1 + ϖ ∈ (R°)^×,
ϖ^p | p in R° and p/ϖ^p topologically nilpotent. (Here τ = (p^n/ϖ₀)x^{p^n−1} is topologically nilpotent because
x^{p^n} ∈ ϖ₀·B°; from p^n = ϖ^{p^n}w, (p/ϖ^p)^n = ϖ^{p^n−pn}w.)

<a id="t145"></a> **T145** `A4/frobenius-surjective-for-split-tate-ring` (lemma). If ϖ^p | p and p/ϖ^p is topologically
nilpotent, every f ∈ R° satisfies f = x^p − ϖ^px for some x ∈ R°, so Φ : R°/ϖ → R°/ϖ^p is surjective. The second
hypothesis is what makes P′ = −ϖ^p(1 − (p/ϖ^p)x^{p−1}) invertible; without it the algebra need not be étale.

<a id="t146"></a> **T146** `A4/split-tate-ring-is-perfectoid` (lemma). A complete uniform Tate ring in which p is topologically
nilpotent and which has no nonsplit finite étale covers is perfectoid (injectivity of Φ is automatic, ECD Remark 3.2).
ℚ̄_p (split, not complete) and ℂ_p⟨T⟩ (complete, uniform, not split) show that no hypothesis can be dropped.

<a id="t147"></a> **T147** `A4/perfectoid-uniform-completion` (theorem; planet "Perfectoid uniform completion"). For (A, A⁺)
with A a complete Tate ℤ_p-algebra and any finite étale torsor tower, Â_∞ is perfectoid; so (Â_∞, Â_∞⁺) is a
perfectoid pair with a continuous action of G. The pseudouniformizer may be chosen as a root of X^{p^n} − ϖ₀X − ϖ₀
with ϖ₀ ∈ A. For the non-complete ℚ_p[T] every tower has colimit B[T] with B ind-finite-étale over ℚ_p, whose uniform
completion B̂⟨T⟩ is not perfectoid: completeness of A is necessary.

#### A4.7 Adic spectra of the tower

<a id="t148"></a> **T148** `A4/torsor-spa-orbits` (lemma). For a finite étale G-torsor A → B of complete Tate pairs,
Spa(B, B⁺) → Spa(A, A⁺) is continuous, spectral, open and surjective with fibres the G-orbits, so
|Spa(B, B⁺)|/G ≅ |Spa(A, A⁺)|; preimages of rational subsets are rational (Tau Ceti `spaComap_preimage_rationalSubset`).
Fibres are orbits because B ⊗_A B = B ⊗̂_A B ≅ ∏_G B and Huber's valuation argument (1994, Lemma 3.9(i)) puts a point of
Spa(B ⊗̂_A B) over any two points with the same image.

<a id="t149"></a> **T149** `A4/spa-of-completed-tower` (lemma). |Spa(Â_∞, Â_∞⁺)| ≅ lim_i |Spa(A_i, A_i⁺)| (valuations on a
colimit are compatible families; for valuations bounded by 1 on the plus ring, continuity means v(ϖ) cofinal in the
value group, which is the union of those of the restrictions; rational subsets come from a finite level), and
Spa(Â_∞, Â_∞⁺) → Spa(A, A⁺) is open, surjective and spectral with fibres the G-orbits, whence
|Spa(Â_∞, Â_∞⁺)|/G ≅ |Spa(A, A⁺)| — the topological identification of ECD Proposition 15.4, with no sheafiness.

<a id="t150"></a> **T150** `A4/completed-tower-self-product` (lemma). The uniform completed tensor product
Â_∞ ⊗̂ᵘ_A Â_∞ (R0) is (C^0(G, Â_∞), C^0(G, Â_∞⁺)) via b ⊗ b′ ↦ (g ↦ b·g(b′)), and the (k+1)-fold power is
C^0(G^k, Â_∞); for A a Tate ℤ_p-algebra these are perfectoid, with |Spa C^0(G^k, Â_∞)| ≅ G^k × |Spa Â_∞| (P5's limits
of affinoid perfectoid spaces), s and t becoming (g, x) ↦ x and (g, x) ↦ g⁻¹·x. The uniformization is necessary:
ℂ_p ⊗̂_{ℚ_p} ℂ_p is not uniform.

#### A4.8 The perfectoid torsor presentation

<a id="t151"></a> **T151** `A4/perfectoid-cover-presentation` (construction; planet "Perfectoid torsor presentation"). The
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

#### A4.9 Comparison interfaces with diamonds

<a id="t152"></a> **T152** `A4/spd-of-tate-huber-pair-and-perfectoid-torsor` (comparison). ECD 15.1–15.4 as a composite record.
A4's part is the existence of a perfectoid torsor presentation for every complete Tate ℤ_p-pair
(`Huber.Pair.exists_perfectoidTorsorPresentation`), with the tower, the perfectoid uniform completion, the
self-product and the topological identification as above. D6's part — Spd ℤ_p and Spd(A, A⁺) are v-sheaves
(Lemma 15.1), Spd of a perfectoid pair is its tilt (15.2), the torsors of v-sheaves, the spatial diamond and
|Spd(A, A⁺)| = |Spa(A, A⁺)| (15.4) — is `DiamondsAndVStacks:D6/spd-of-a-tate-pair`, `D6/untilt-descent-along-v-covers`
and `D6/spd-is-a-spatial-diamond`. For non-complete A the record applies to the completion (convention 9).

<a id="t153"></a> **T153** `A4/diamond-of-analytic-adic-space-and-etale-site-15-6` (comparison). ECD Definition 15.5 and
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

#### Hypotheses in the perfectoidness argument

ECD Lemma 15.3 (v4, p. 90) and Berkeley Lemma 10.1.6 motivate the completed tower.
Here its base ring is complete: the henselian comparison transferring finite étale
splittings to the completion needs that hypothesis. The polynomial example over
ℚ_p[T] above prevents its removal. In the Frobenius argument the choice of exponent
also makes p/ϖ^p topologically nilpotent. Divisibility ϖ^p ∣ p alone does not make the
root algebra étale; at ϖ = p^{1/p} and f = 1 − p the polynomial
X^p − pX + p − 1 has a double root at 1.

#### Imported interfaces

- PerfectoidSpaces P3: state `P3/henselian-finite-etale-approximation` for Tate rings without a base field
  (Berkeley Theorem 7.4.8: FÉt(A) ≅ FÉt(Â) when a ring of definition is henselian along a pseudouniformizer, and its
  corollary for filtered colimits of complete Tate rings).
- AdicEtaleGeometry A1: the Huber pair of a finite étale algebra over an arbitrary complete Tate pair (natural
  topology, integral plus ring, functoriality, group actions), and the finite étale and étale sites of generalized
  adic spaces with Kedlaya–Liu 8.2.17(a).
- ClassicalAdicEtaleCohomology H1:henselian: the completeness-to-henselianity implication as a separately citable
  statement, with a proof independent of Huber's book in the Tate case.
- The topologically henselian comparison is an input from PerfectoidSpaces P3;
  Kedlaya–Liu 2.8.16 supplies the uniformization case. Composition in the finite étale
  site uses the reduction to de Jong–van der Put 3.1.7 identified in Kedlaya–Liu 8.2.17(b).

Sources: Scholze, *Étale cohomology of diamonds* (arXiv v4, 14 April 2026), §3 and §15; Scholze–Weinstein, *Berkeley
lectures* (2020), Theorem 7.4.8 and Lemmas 10.1.6–10.1.7; Kedlaya–Liu, *Relative p-adic Hodge theory: Foundations*,
§§1.2–1.4, 2.6, 2.8, 8.2, 9.1; Scholze, *Perfectoid spaces*, Proposition 7.4 and Lemma 7.5; Huber 1994, Lemma 3.9;
the Stacks project, Tags 0FWT, 0ALJ, 0BN2.

## Target references and prerequisites

The labels T001–T153 link the following references to the targets above. Internal
prerequisites are listed by these labels; they refer to specific constructions,
including those in the same layer. Their order of use is explained in the layer discussions. An imported roadmap label names its layer, whose
interface is described in the corresponding mathematical discussion. `M:` means an
existing Mathlib declaration and `TC:` an existing Tau Ceti declaration. These are inputs,
not definitions to reproduce. Source abbreviations refer to the bibliography below.
The source column supplies the principal locator for each target; further clause-specific
references are given in its discussion. Page numbers use the editions in the bibliography.

### A0

| Target | Source | Prerequisites |
|---|---|---|
| [T001](#t001) | H94 §3, proof of Proposition 3.7, printed p. 536 | `AdicSpacesPartII:R0`, `M:CategoryTheory.IsPushout`, `M:integralClosure`, `TC:Huber.Pair`, `TC:Huber.Pair.Hom` |
| [T002](#t002) | KL I §2.8, Definition 2.8.13, p. 63 | `AdicSpacesPartII:R0`, `T001`, `M:CategoryTheory.IsPushout`, `TC:Huber.Pair`, `TC:Huber.IsTateRing` |
| [T003](#t003) | Hüb §9, proof of Theorem 9.2, p. 41 | `AdicSpacesPartII:R0`, `T001`, `TC:ValuationSpectrum.spa_antitone`, `TC:ValuationSpectrum.spa_integralClosure`, `TC:Huber.Pair.Hom.spaComap`, `TC:Huber.IsPseudoUniformizer`, `M:integralClosure` |
| [T004](#t004) | Wedhorn §7.5, Lemma 7.46(3), p. 68 | `AdicSpacesPartII:R0`, `T001`, `TC:Huber.Pair.Hom.spaComap_preimage_rationalSubset`, `TC:ValuationSpectrum.rationalSubset`, `TC:ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`, `TC:ValuationSpectrum.spaLocalizationHomeomorph`, `TC:Huber.PairOfDefinition.completionLocalization` |
| [T005](#t005) | KL I §8.2, Definition 8.2.16, p. 162 | `AdicSpacesPartII:R0`, `T001`, `T004`, `M:Algebra.Etale`, `M:Algebra.Smooth.flat`, `M:Module.FinitePresentation.of_finite_of_finitePresentation`, `M:Module.Flat.projective_of_finitePresentation`, `M:Algebra.Etale.baseChange`, `M:Module.Finite.base_change` |
| [T006](#t006) | Wedhorn §8.6, proof of Theorem 8.56(i), p. 89 | `AdicSpacesPartII:R0`, `T001`, `M:CategoryTheory.IsPullback` |
| [T007](#t007) | H94 §3, Proposition 3.7, printed p. 535 | `AdicSpacesPartII:R0`, `T001`, `T006`, `M:CategoryTheory.Limits.pullbackAssoc`, `M:CategoryTheory.Limits.pullbackSymmetry`, `M:CategoryTheory.IsPullback.of_id_snd`, `M:CategoryTheory.IsPushout.paste_horiz` |
| [T008](#t008) | Wedhorn §8.3, Proposition and Definition 8.36, p. 85 | `AdicSpacesPartII:R0`, `T004`, `TC:ValuationSpectrum.IsAnalyticPoint`, `TC:ValuationSpectrum.spaAnalytic`, `TC:ValuationSpectrum.isOpen_val_preimage_spaAnalytic`, `TC:ValuationSpectrum.isCompact_val_preimage_spaAnalytic`, `TC:ValuationSpectrum.spaAnalytic_eq_biUnion_rationalSubset`, `TC:ValuationSpectrum.isTateRing_completion_locTopology_of_mem_generators`, `TC:ValuationSpectrum.spaAnalytic_eq_spa_of_isTateRing`, `TC:ValuationSpectrum.spaAnalytic_eq_empty_iff_discrete_separationQuotient` |

### A1

| Target | Source | Prerequisites |
|---|---|---|
| [T009](#t009) | HK §4, Definition 4.1, p. 11 | `TC:Huber.IsTateRing`, `TC:Huber.restrictedMvPowerSeriesCompletion`, `TC:Huber.IsStronglyNoetherian`, `TC:ValuationSpectrum.rationalSubset`, `AdicSpacesPartII:R0`, `AdicSpacesPartII:R3`, `M:CategoryTheory.Sheaf.H` |
| [T010](#t010) | KL I §2.4, Remark 2.4.2, p. 38 | `AdicSpacesPartII:R0`, `T005`, `M:Algebra.Etale`, `M:Module.Finite`, `M:Module.Projective`, `M:moduleTopology`, `M:IsModuleTopology`, `M:IsModuleTopology.continuous_of_linearMap`, `M:integralClosure`, `M:CommAlgCat.FiniteEtale`, `M:Algebra.Etale.baseChange`, `TC:Huber.Pair`, `TC:Huber.Pair.Hom`, `TC:Huber.IsTateRing`, `TC:Huber.IsTateRing.isModuleTopology`, `TC:completeSpace_moduleTopology`, `TC:Huber.Pair.isRingOfIntegralElements_integralClosure`, `TC:ValuationSpectrum.spa`, `TC:ValuationSpectrum.spaComap`, `TC:ValuationSpectrum.continuous_spaComap`, `TC:ValuationSpectrum.spaComap_preimage_rationalSubset` |
| [T011](#t011) | HK §4, Corollary 4.7, p. 13 | `T009`, `T010`, `AdicSpacesPartII:R3`, `AdicSpacesPartII:R0`, `M:Algebra.Etale`, `M:Module.Projective`, `TC:Huber.IsStronglyNoetherian`, `TC:ValuationSpectrum.rationalSubset` |
| [T012](#t012) | KL I §2.6, Theorem 2.6.9, p. 55 | `T010`, `T013`, `T014`, `AdicSpacesPartII:R3`, `AdicSpacesPartII:R0`, `M:Algebra.Etale`, `M:Algebra.Etale.baseChange`, `M:Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`, `TC:ValuationSpectrum.faithfullyFlat_pi_toCompletionLoc`, `TC:ValuationSpectrum.rationalSubset` |
| [T013](#t013) | KL I §2.6, Lemma 2.6.2, p. 53 | `T010`, `AdicSpacesPartII:R0`, `TC:Huber.IsTateRing`, `TC:Huber.Pair.isRingOfIntegralElements_integralClosure`, `TC:ValuationSpectrum.spa`, `TC:ValuationSpectrum.spa_integralClosure`, `TC:ValuationSpectrum.rationalSubset`, `TC:ValuationSpectrum.spaComap_preimage_rationalSubset` |
| [T014](#t014) | KL I §2.6, Proposition 2.6.8, p. 55 | `T013`, `T010`, `AdicSpacesPartII:R3`, `M:Algebra.Etale`, `M:CommAlgCat.FiniteEtale`, `M:HenselianLocalRing` |
| [T015](#t015) | KL I §8.2, Definition 8.2.16, p. 162 | `T010`, `AdicSpacesPartII:R0`, `TC:ValuationSpectrum.spa`, `TC:ValuationSpectrum.rationalSubset` |
| [T016](#t016) | ECD §6, after Definition 6.2, p. 26 | `T015`, `T010`, `T011`, `T012`, `T009`, `AdicSpacesPartII:R0`, `TC:ValuationSpectrum.rationalSubset` |
| [T017](#t017) | KL I §8.2, Definition 8.2.16, p. 162 | `T015`, `T010`, `TC:ValuationSpectrum.rationalSubset` |
| [T018](#t018) | PS §7, after Definition 7.1, p. 39 | `T015`, `T017`, `T010`, `T011`, `AdicSpacesPartII:R0` |
| [T019](#t019) | KL I §8.2, after Definition 8.2.16, p. 162 | `T015`, `T017`, `T010`, `T011`, `T009`, `AdicSpacesPartII:R0`, `T005`, `T004`, `M:Algebra.Etale.baseChange` |
| [T020](#t020) | KL I §8.2, Lemma 8.2.17(c), p. 162 | `T015`, `T017`, `T016`, `T011`, `T009`, `T013`, `T014`, `T018`, `T019`, `AdicSpacesPartII:R0`, `M:Algebra.Etale.comp`, `M:Module.Finite.trans`, `M:integralClosure` |
| [T021](#t021) | KL I §1.2, Definition 1.2.2, p. 13 | `T017`, `T015`, `T019`, `T016`, `M:Algebra.FormallyUnramified.iff_exists_tensorProduct`, `M:Algebra.TensorProduct.lmul'`, `AdicSpacesPartII:R0` |
| [T022](#t022) | dJvP §3.2, p. 23 | `T017`, `T015`, `T021`, `T019`, `T020`, `T009` |
| [T023](#t023) | KL I §8.2, Lemma 8.2.17(b), p. 162 | `T017`, `T015`, `T013`, `T014`, `T018`, `AdicSpacesPartII:R0` |
| [T024](#t024) | H96 §2.1, p. 109 | `T009`, `T017`, `T019`, `T020`, `T021`, `T022`, `T018`, `M:Opens.grothendieckTopology`, `M:AlgebraicGeometry.Scheme.smallEtaleTopology`, `M:CategoryTheory.MorphismProperty.Over`, `M:CategoryTheory.Pretopology`, `M:CategoryTheory.Pretopology.toGrothendieck`, `M:CategoryTheory.GrothendieckTopology`, `M:CategoryTheory.Functor.IsContinuous`, `M:CategoryTheory.Functor.sheafPushforwardContinuous`, `M:CategoryTheory.Functor.sheafPullback` |
| [T025](#t025) | KL I §8.2, Definition 8.2.19, p. 163 | `T015`, `T016`, `T019`, `T021`, `T022`, `T020`, `T024`, `T009`, `M:CommAlgCat.FiniteEtale`, `M:CategoryTheory.MorphismProperty.Over`, `M:CategoryTheory.Pretopology`, `M:CategoryTheory.Pretopology.toGrothendieck`, `M:CategoryTheory.GrothendieckTopology`, `M:CategoryTheory.Functor.IsContinuous`, `M:CategoryTheory.Functor.sheafPushforwardContinuous`, `M:CategoryTheory.Functor.sheafPullback` |
| [T026](#t026) | ECD §7, proof of Proposition 7.16, p. 36 | `T017`, `T015`, `T010`, `T016`, `T009`, `M:Algebra.FormallyEtale.equivPiOfIsSepClosed`, `M:IsAlgClosed`, `M:ValuationSubring`, `TC:ValuationSpectrum.spa` |
| [T027](#t027) | ECD §14, Proposition 14.3, p. 82 | `T024`, `T026`, `T019`, `T021`, `T009`, `M:CategoryTheory.GrothendieckTopology.Point`, `M:CategoryTheory.GrothendieckTopology.Point.sheafFiber`, `M:CategoryTheory.Functor.sheafPullback`, `M:IsAlgClosed`, `M:ValuationSubring`, `M:AlgebraicGeometry.Scheme.pointSmallEtale` |
| [T028](#t028) | ECD §14, Proposition 14.3, p. 82 | `T027`, `T026`, `T019`, `T024`, `M:CategoryTheory.ObjectProperty.IsConservativeFamilyOfPoints`, `M:CategoryTheory.ObjectProperty.IsConservativeFamilyOfPoints.mk'`, `M:CategoryTheory.ObjectProperty.IsConservativeFamilyOfPoints.jointlyReflectIsomorphisms`, `M:CategoryTheory.GrothendieckTopology.HasEnoughPoints`, `M:AlgebraicGeometry.Scheme.isConservative_pointSmallEtale` |
| [T029](#t029) | PH §3, before Definition 3.4, p. 13 | `T025`, `T026`, `T027`, `T021`, `T016`, `M:CategoryTheory.GaloisCategory`, `M:CategoryTheory.PreGaloisCategory.FiberFunctor`, `M:CategoryTheory.PreGaloisCategory.functorToContAction`, `M:CommAlgCat.FiniteEtale` |
| [T030](#t030) | KL I §8.2, Definition 8.2.19, p. 163 | `T024`, `T017`, `T009`, `T011`, `T016`, `T010`, `T019`, `T021`, `AdicSpacesPartII:R0`, `TC:ValuationSpectrum.spaComap_preimage_rationalSubset`, `M:CategoryTheory.Functor.IsCoverDense`, `M:CategoryTheory.Functor.IsDenseSubsite`, `M:CategoryTheory.Functor.IsDenseSubsite.sheafEquiv` |
| [T031](#t031) | KL I §8.2, Proposition 8.2.20, p. 163 | `T030`, `T024`, `T021`, `T023`, `T019`, `T020`, `M:CategoryTheory.Presieve.IsSheafFor` |
| [T032](#t032) | KL I §8.2, Theorem 8.2.22(a), p. 165 | `T024`, `T031`, `T030`, `T016`, `T019`, `T009`, `M:CommRingCat.isLimitForkPushoutSelfOfFaithfullyFlat`, `M:Module.FaithfullyFlat`, `M:CategoryTheory.Presieve.IsSheafFor`, `M:CategoryTheory.Sheaf` |
| [T033](#t033) | dJvP §3.2, p. 23 | `T024`, `T025`, `T022`, `T020`, `T019`, `T021`, `M:CategoryTheory.GrothendieckTopology.over`, `M:CategoryTheory.GrothendieckTopology.overPullback`, `M:CategoryTheory.Over.iteratedSliceEquiv`, `M:CategoryTheory.Functor.sheafPushforwardContinuous` |
| [T034](#t034) | dJvP §3.3, p. 28 | `T027`, `T024`, `T032`, `T019`, `M:CategoryTheory.Functor.Elements`, `M:CategoryTheory.IsCofiltered`, `M:CategoryTheory.GrothendieckTopology.Point.sheafFiber` |
| [T035](#t035) | KL I §2.4, Lemma 2.4.17(a), p. 43 | `T034`, `T026`, `T010`, `T027`, `T014`, `M:HenselianLocalRing`, `M:IsAlgClosed` |
| [T036](#t036) | KL I §8.2, Definition 8.2.3, p. 159 | `T072`, `T073`, `T078`, `T076`, `T075`, `T010`, `T012`, `T013`, `T014`, `T015`, `T017`, `T019`, `T020`, `T024`, `T025`, `T011`, `T026`, `T027`, `T028`, `M:CategoryTheory.MorphismProperty.Over`, `M:CategoryTheory.Pretopology`, `M:CategoryTheory.Pretopology.toGrothendieck`, `M:CategoryTheory.GrothendieckTopology`, `M:CategoryTheory.Functor.IsContinuous`, `M:CategoryTheory.Functor.sheafPushforwardContinuous`, `M:CategoryTheory.Functor.sheafPullback` |
| [T037](#t037) | PH §3, Definition 3.1, p. 13 | `AdicSpacesPartII:R0`, `T024`, `T015`, `DiamondsAndVStacks:D0`, `M:CategoryTheory.Ind`, `M:CategoryTheory.IsCofiltered` |
| [T038](#t038) | PH erratum item (1), p. 1 | `T037`, `T042`, `T025`, `DiamondsAndVStacks:D0`, `M:CategoryTheory.MorphismProperty.transfiniteCompositions`, `M:CategoryTheory.MorphismProperty.pullbacks`, `M:CategoryTheory.Functor.IsWellOrderContinuous` |
| [T039](#t039) | PH erratum item (1), p. 1 | `T038`, `T037`, `T042`, `T043`, `T047`, `DiamondsAndVStacks:D0` |
| [T040](#t040) | PH erratum item (1), p. 1 | `M:Profinite`, `T038` |
| [T041](#t041) | PH erratum item (1), p. 1 | `M:Profinite`, `T055` |
| [T042](#t042) | PH §3, Lemma 3.10 (i), p. 15 | `T037`, `T018`, `T015`, `AdicSpacesPartII:R0`, `DiamondsAndVStacks:D0` |
| [T043](#t043) | PH §3, Lemma 3.10 (ii), p. 15 | `T037`, `T042`, `AdicSpacesPartII:R0`, `T015`, `DiamondsAndVStacks:D0` |
| [T044](#t044) | PH §3, Lemma 3.10 (iii), p. 15 | `T037`, `T042`, `DiamondsAndVStacks:D0`, `AdicSpacesPartII:R0` |
| [T045](#t045) | PH §3, Lemma 3.10 (iv), p. 15 | `T044`, `T043`, `T042`, `AdicSpacesPartII:R0` |
| [T046](#t046) | PH §3, Lemma 3.10 (v), p. 15 | `T042`, `T037`, `AdicSpacesPartII:R0` |
| [T047](#t047) | PH §3, Lemma 3.10 (vi), p. 16 | `T042`, `T043`, `T046`, `DiamondsAndVStacks:D0` |
| [T048](#t048) | PH §3, before Definition 3.3, p. 13 | `AdicSpacesPartII:R0` |
| [T049](#t049) | PH §3, Lemma 3.10 (vii), p. 16 | `T042`, `T047`, `T048`, `AdicSpacesPartII:R0` |
| [T050](#t050) | PH erratum item (1), p. 1 | `T038`, `T043`, `T042`, `T037`, `DiamondsAndVStacks:D0` |
| [T051](#t051) | PH erratum item (1), p. 1 | `T038`, `T039`, `T042`, `T043`, `T047`, `T045`, `T049`, `T050`, `M:CategoryTheory.Pretopology` |
| [T052](#t052) | PH §3, Definition 3.9, p. 15 | `T037`, `T038`, `T051`, `T049`, `T044`, `T047`, `T039`, `T024`, `M:CategoryTheory.Pretopology.toGrothendieck`, `M:AlgebraicGeometry.Scheme.proetaleTopology` |
| [T053](#t053) | PH §3, before Lemma 3.16, p. 19 | `T052`, `T049`, `T037`, `T024`, `M:CategoryTheory.Functor.IsContinuous`, `M:CategoryTheory.Functor.sheafPushforwardContinuous`, `M:CategoryTheory.Functor.sheafPullback`, `M:CategoryTheory.presheafToSheaf` |
| [T054](#t054) | PH §3, Lemma 3.16, p. 19 | `T053`, `T061`, `T062`, `T039`, `T024`, `DiamondsAndVStacks:D0` |
| [T055](#t055) | PH §3, Definition 3.4, p. 13 | `M:Profinite`, `M:CategoryTheory.Pretopology`, `DiamondsAndVStacks:D0` |
| [T056](#t056) | PH §3, Lemma 3.6, p. 14 | `T055`, `M:Profinite` |
| [T057](#t057) | PH §3, Proposition 3.7 (ii), p. 14 | `T055`, `T041`, `T040` |
| [T058](#t058) | PH §3, Definition 3.3, p. 13 | `T025`, `T037`, `T038`, `T042`, `T050`, `DiamondsAndVStacks:D0`, `M:CategoryTheory.Pretopology` |
| [T059](#t059) | PH §3, Proposition 3.5, p. 14 | `T029`, `T058`, `T055`, `DiamondsAndVStacks:D0` |
| [T060](#t060) | PH §3, Lemma 3.11, p. 17 | `T045`, `T059`, `T056`, `T042`, `T058`, `T052`, `M:CategoryTheory.Functor.IsContinuous` |
| [T061](#t061) | PH §3, Proposition 3.12 (i), p. 17 | `T052`, `T045`, `T042`, `T044`, `DiamondsAndVStacks:D0`, `TC:ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`, `AdicSpacesPartII:R0` |
| [T062](#t062) | PH §3, Proposition 3.12 (iv), p. 17 | `T061`, `T044`, `T042`, `DiamondsAndVStacks:D0`, `M:CategoryTheory.Functor.IsDenseSubsite` |
| [T063](#t063) | PH §3, Proposition 3.13, p. 18 | `T052`, `T055`, `T029`, `T059`, `T062`, `T027`, `AdicSpacesPartII:R0`, `M:CategoryTheory.Functor.IsContinuous`, `M:CategoryTheory.Functor.sheafPullback` |
| [T064](#t064) | PH §3, Proposition 3.13, p. 18 | `T063`, `T059`, `T045`, `T061` |
| [T065](#t065) | PH erratum item (2), p. 1 | `T061`, `T062`, `T066`, `DiamondsAndVStacks:D0`, `M:CategoryTheory.GrothendieckTopology.HasEnoughPoints`, `M:CategoryTheory.GrothendieckTopology.Point` |
| [T066](#t066) | PH §3, before Proposition 3.15, p. 19 | `T052`, `T053`, `T037`, `T033`, `AdicSpacesPartII:R0`, `DiamondsAndVStacks:D0`, `M:CategoryTheory.GrothendieckTopology.over` |
| [T067](#t067) | PH §3, before Proposition 3.15, p. 19 | `AdicSpacesPartII:R0`, `TC:ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`, `T024` |
| [T068](#t068) | PH §3, before Proposition 3.15, p. 19 | `T067`, `T066`, `T061`, `T052`, `T039`, `M:CategoryTheory.GrothendieckTopology.over` |
| [T069](#t069) | PH §5, proof of Lemma 5.6, p. 31 | `T052`, `T042`, `T047`, `T039`, `T041`, `T056`, `T040`, `DiamondsAndVStacks:D0`, `M:Profinite` |
| [T070](#t070) | PH §5, proof of Lemma 5.6, p. 31 | `T069`, `T041`, `T029`, `T054`, `T052`, `T038`, `T037` |
| [T071](#t071) | Berkeley Lecture 3, §3.4, p. 22 | `TC:Huber.Pair`, `TC:Huber.Pair.Hom`, `TC:Huber.Pair.Hom.spaComap`, `TC:Huber.Pair.Hom.spaComap_preimage_rationalSubset`, `TC:ValuationSpectrum.rationalSubset`, `TC:ValuationSpectrum.isTopologicalBasis_spaRationalFamily`, `TC:ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`, `TC:ValuationSpectrum.existsUnique_continuous_ringHom_of_isUnit_of_forall_comap_mem_rationalSubset`, `TC:ValuationSpectrum.spa_eq_empty_iff_subsingleton`, `M:CategoryTheory.Coverage`, `M:CategoryTheory.Presieve.isSheaf_coverage` |
| [T072](#t072) | Berkeley Lecture 3, §3.4, p. 21 | `T071`, `M:CategoryTheory.presheafToSheaf`, `TC:Huber.Pair`, `TC:ValuationSpectrum.spa_eq_empty_iff_subsingleton` |
| [T073](#t073) | Berkeley Lecture 3, Definition 3.4.1, p. 22 | `T071`, `T072`, `TC:ValuationSpectrum.existsUnique_continuous_ringHom_of_isUnit_of_forall_comap_mem_rationalSubset`, `TC:Huber.Pair.Hom.spaComap_preimage_rationalSubset`, `TC:ValuationSpectrum.isTopologicalBasis_spaRationalFamily` |
| [T074](#t074) | Berkeley Appendix to Lecture 3, p. 23 | `T072`, `T073`, `M:CategoryTheory.Ind`, `M:CategoryTheory.Ind.yoneda` |
| [T075](#t075) | KL I §8.2, Lemma 8.2.9, p. 160 | `T072`, `T073` |
| [T076](#t076) | Berkeley Lecture 3, §3.4, p. 22 | `T072`, `T073`, `T074`, `T075`, `M:CategoryTheory.Ind.yoneda` |
| [T077](#t077) | Berkeley Lecture 4, Proposition 4.3.1 (2), p. 33 | `T072`, `T073`, `T074`, `TC:ValuationSpectrum.spaAnalytic_eq_biUnion_rationalSubset`, `TC:ValuationSpectrum.isTateRing_completion_locTopology_of_mem_generators`, `TC:Huber.IsTateRing`, `AdicSpacesPartII:R0` |
| [T078](#t078) | Berkeley Lecture 5, Remark 5.1.6, p. 36 | `T072`, `T073`, `T077`, `AdicSpacesPartII:R0`, `M:CategoryTheory.presheafToSheaf` |

### A2

| Target | Source | Prerequisites |
|---|---|---|
| [T079](#t079) | H96 §1.3, Definitions 1.3.1-1.3.3, p. 51 | `AdicSpacesPartII:R0`, `AdicSpacesPartII:R1`, `AdicSpacesPartII:R2`, `T008` |
| [T080](#t080) | Berkeley Lecture 4, §4.1, the adic closed unit disc, p. 27 | `AdicSpacesPartII:R0`, `AdicSpacesPartII:R1`, `T008`, `TC:Huber.restrictedMvPowerSeriesCompletion`, `TC:ValuationSpectrum.closedPolydisc`, `TC:ValuationSpectrum.spa_integralClosure`, `M:MvPolynomial`, `M:CategoryTheory.IsPullback.paste_horiz` |
| [T081](#t081) | PH §4, Example 4.4, p. 22 | `T080`, `AdicSpacesPartII:R0`, `TC:ValuationSpectrum.rationalSubset`, `TC:ValuationSpectrum.spaLocalizationHomeomorph`, `M:LaurentPolynomial` |
| [T082](#t082) | ECD §24, Proposition 24.4, p. 156 | `T080`, `T081`, `T018`, `AdicSpacesPartII:R0`, `T008`, `T019`, `T020` |
| [T083](#t083) | H96 §1.6, Corollary 1.6.10, p. 80 | `AdicSpacesPartII:R0`, `T080`, `T082`, `T008`, `T018`, `T019`, `T020` |
| [T084](#t084) | PH §5, Lemma 5.2, p. 28 | `AdicSpacesPartII:R0`, `T083`, `T081`, `T080`, `T004`, `T005` |
| [T085](#t085) | Zav §3, Definition 3.1, p. 4 | `M:topologicalKrullDim`, `M:Order.krullDim`, `M:Specializes`, `M:QuasiSober`, `M:genericPoint`, `M:Topology.IsInducing.topologicalKrullDim_le`, `M:IsHomeomorph.topologicalKrullDim_eq`, `M:ringKrullDim`, `TC:ValuationSpectrum.spa` |
| [T086](#t086) | Zav §3, Lemma 3.2, p. 5 | `T085`, `AdicSpacesPartII:R0`, `TC:ValuationSpectrum.IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic` |
| [T087](#t087) | Zav §3, Corollary 3.4, p. 5 | `T085`, `T086`, `T083`, `T080`, `T081`, `AdicSpacesPartII:R0` |
| [T088](#t088) | Zav §3, Lemma 3.7, p. 7 | `T085`, `T087`, `T080`, `AdicSpacesPartII:R0` |
| [T089](#t089) | H96 §1.2, (1.2.7), p. 50 | `AdicSpacesPartII:R1`, `AdicSpacesPartII:R4`, `T080`, `T081`, `T083` |
| [T090](#t090) | H96 §2.1, p. 109 | `T027`, `T018`, `AdicSpacesPartII:R4`, `AdicSpacesPartII:R0`, `T083`, `T080`, `T084`, `T081`, `M:CategoryTheory.GrothendieckTopology`, `T024` |
| [T091](#t091) | H96 §1.9, Proposition 1.9.1, pp. 96-97 | `AdicSpacesPartII:F0`, `AdicSpacesPartII:R2`, `T008` |

### A3

| Target | Source | Prerequisites |
|---|---|---|
| [T092](#t092) | KL II §1.1, Definition 1.1.1, p. 10 | `M:Module.Finite`, `M:Module.FinitePresentation`, `M:Module.FinitePresentation.fg_ker`, `M:Module.Projective`, `M:Module.Flat`, `M:TensorProduct` |
| [T093](#t093) | KL II §1.1, Lemma 1.1.5, p. 11 | `T092`, `M:Module.FinitePresentation.fg_ker`, `M:Module.Projective` |
| [T094](#t094) | KL II §1.1, Remark 1.1.6, p. 12 | `T092`, `T093`, `M:RingTheory.Sequence.IsWeaklyRegular`, `M:Ideal.Cotangent`, `M:Module.Flat` |
| [T095](#t095) | KL II §1.2, Definition 1.2.2, p. 14 | `TC:Huber.IsTateRing`, `TC:Huber.IsTateRing.isOpenMap`, `TC:Huber.IsTateRing.isStrictMap_of_isClosed_range`, `TC:Huber.isClosed_of_module_finite_topologicalClosure`, `TC:completeSpace_moduleTopology`, `M:moduleTopology`, `M:IsModuleTopology`, `M:Topology.IsStrictMap`, `AdicSpacesPartII:R0` |
| [T096](#t096) | KL II §1.2, Definition 1.2.13, p. 17 | `T092`, `T095`, `TC:Huber.Pair`, `TC:Huber.IsTateRing`, `TC:Huber.PairOfDefinition.completionLocalization`, `TC:ValuationSpectrum.rationalSubset`, `M:moduleTopology` |
| [T097](#t097) | KL II §2.4, Definition 2.4.4, p. 36 | `T096`, `M:Module.Flat`, `M:TensorProduct` |
| [T098](#t098) | KL II §2.4, Definition 2.4.6, p. 37 | `T097`, `T096`, `T095`, `TC:Huber.restrictedMvPowerSeriesCompletion` |
| [T099](#t099) | KL II §2.4, Lemma 2.4.10, p. 38 | `T095`, `T098`, `AdicSpacesPartII:R3`, `TC:Huber.restrictedMvPowerSeriesCompletion`, `TC:Huber.PairOfDefinition.rationalEvalHom_surjective`, `TC:Huber.PairOfDefinition.completionLocalization` |
| [T100](#t100) | KL II §2.4, Lemma 2.4.12, p. 39 | `T099`, `T098`, `T097`, `T093`, `AdicSpacesPartII:R3` |
| [T101](#t101) | KL I §2.4, Proposition 2.4.24, p. 47 | `TC:ValuationSpectrum.rationalSubset`, `TC:Huber.IsTateRing`, `TC:Huber.PairOfDefinition.completionLocalization`, `AdicSpacesPartII:R3` |
| [T102](#t102) | KL II §2.4, Theorem 2.4.15, p. 40 | `T101`, `T100`, `T097`, `T096`, `T093` |
| [T103](#t103) | KL II §2.5, Theorem 2.5.1, p. 41 | `T096`, `T102`, `T100`, `AdicSpacesPartII:R3` |
| [T104](#t104) | KL II §2.5, Corollary 2.5.2, p. 41 | `T103`, `T102`, `T093`, `AdicSpacesPartII:R3`, `M:Module.Projective` |
| [T105](#t105) | KL II §2.5, Definition 2.5.3, p. 41 | `T096`, `T103`, `T102`, `AdicSpacesPartII:R3` |
| [T106](#t106) | KL II §2.5, Lemma 2.5.4, p. 41 | `T103`, `T104`, `T102`, `T093`, `T095`, `AdicSpacesPartII:R3` |
| [T107](#t107) | KL II §2.5, Theorem 2.5.5, p. 42 | `T103`, `T106`, `T102`, `T105`, `T096`, `AdicSpacesPartII:R3` |
| [T108](#t108) | H96 §1.7, Proposition 1.7.1, p. 80 | `TC:Huber.PairOfDefinition`, `TC:Huber.IsPseudoUniformizer`, `TC:Huber.IsTateRing`, `TC:Huber.restrictedMvPowerSeriesCompletion`, `M:MvPowerSeries.pderiv`, `M:Polynomial.hasseDeriv` |
| [T109](#t109) | H96 §1.7, Proposition 1.7.1, p. 80 | `T108`, `TC:Huber.restrictedMvPowerSeriesCompletion`, `TC:Huber.existsUnique_continuous_ringHom_completion_weightedRestrictedSubring`, `TC:Huber.Pair.quotient`, `TC:Huber.PairOfDefinition` |
| [T110](#t110) | H96 §1.7, Proposition 1.7.1, p. 80 | `TC:Huber.restrictedMvPowerSeriesCompletion`, `TC:Huber.Pair`, `TC:Huber.Pair.Hom`, `TC:Huber.Pair.quotient`, `TC:Huber.IsTateRing`, `TC:Huber.IsPseudoUniformizer`, `M:MvPowerSeries.pderiv`, `M:Algebra.PreSubmersivePresentation.jacobian`, `AdicSpacesPartII:R0` |
| [T111](#t111) | KL I §2.4, Lemma 2.4.13(a), p. 42 | `T110`, `T095`, `TC:Huber.PairOfDefinition.rationalEvalHom_surjective`, `TC:Huber.PairOfDefinition.completionLocalization`, `TC:ValuationSpectrum.mem_iff_forall_vle_one`, `AdicSpacesPartII:R0`, `M:Algebra.Etale`, `M:Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`, `M:Algebra.SubmersivePresentation`, `M:Module.Finite`, `T010` |
| [T112](#t112) | FS §IV.4.1, before Lemma IV.4.14, p. 137 | `T108`, `AdicSpacesPartII:R5`, `TC:ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`, `TC:ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`, `TC:Huber.existsUnique_continuous_ringHom_completion_weightedRestrictedSubring`, `TC:Huber.PairOfDefinition.completionLocalization`, `TC:ValuationSpectrum.mem_iff_forall_vle_one`, `TC:ValuationSpectrum.rationalSubset`, `AdicSpacesPartII:R0` |
| [T113](#t113) | ECD §6, proof of Proposition 6.4(iv), p. 28 | `T110`, `T112`, `T108`, `TC:ValuationSpectrum.existsUnique_continuous_ringHom_of_forall_comap_mem_rationalSubset`, `TC:ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`, `AdicSpacesPartII:R0` |
| [T114](#t114) | FS §IV.4.1, Proposition IV.4.17, p. 139 | `T112`, `T110`, `T111`, `AdicSpacesPartII:R5` |
| [T115](#t115) | FS §IV.4.1, Lemma IV.4.13, p. 137 | `T112`, `T094`, `T096`, `M:RingTheory.Sequence.IsWeaklyRegular` |
| [T116](#t116) | PS §6, Lemma 6.13(i), p. 37 | `PerfectoidSpaces:P1`, `PerfectoidSpaces:P2`, `M:PerfectRing`, `M:frobenius`, `TC:Huber.IsPseudoUniformizer` |
| [T117](#t117) | FS §IV.4.1, Proposition IV.4.17, p. 139 | `T116`, `T110`, `T113`, `T114`, `AdicSpacesPartII:R0`, `AdicSpacesPartII:R5`, `T018`, `PerfectoidSpaces:P3`, `PerfectoidSpaces:P2`, `PerfectoidSpaces:P1`, `TC:ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem`, `M:PerfectRing` |
| [T118](#t118) | KL II §1.1, Remark 1.1.13, p. 14 | `T109`, `T110`, `T112`, `T115`, `T092`, `T093`, `T105`, `T096`, `T107`, `TC:ValuationSpectrum.mem_iff_forall_vle_one`, `TC:ValuationSpectrum.rationalSubset`, `AdicSpacesPartII:R0`, `AdicSpacesPartII:R5` |
| [T119](#t119) | FS §IV.4.1, Proposition IV.4.19(i), p. 140 | `T118`, `T120`, `T107`, `T105`, `T096`, `AdicSpacesPartII:R5`, `TC:ValuationSpectrum.mem_iff_forall_vle_one`, `TC:ValuationSpectrum.rationalSubset`, `PerfectoidSpaces:P3` |
| [T120](#t120) | ECD §6, Definition 6.2(ii), p. 26 | `T111`, `PerfectoidSpaces:P3`, `T010`, `TC:ValuationSpectrum.exists_span_eq_top_forall_rationalSubset_subset_of_isTateRing`, `TC:ValuationSpectrum.rationalSubset` |
| [T121](#t121) | KL I §2.4, Lemma 2.4.13(a), p. 42 | `TC:Huber.PairOfDefinition.completionLocalization`, `TC:ValuationSpectrum.rationalSubset`, `AdicSpacesPartII:R5`, `PerfectoidSpaces:P2` |
| [T122](#t122) | ECD §6, proof of Proposition 6.4(iv), p. 28 | `T120`, `T121`, `T118`, `T119`, `T109`, `AdicSpacesPartII:R5`, `TC:ValuationSpectrum.rationalSubset`, `TC:Huber.restrictedMvPowerSeriesCompletion` |
| [T123](#t123) | ECD §6, proof of Proposition 6.4(iv), p. 28 | `T119`, `T118`, `T115`, `T120`, `T092`, `T107`, `AdicSpacesPartII:R0`, `AdicSpacesPartII:R3` |
| [T124](#t124) | ECD §6, proof of Proposition 6.4(iv), p. 28 | `T123`, `T112`, `T115`, `T119`, `T111`, `M:Ideal.isIdempotentElem_iff_of_fg`, `TC:ValuationSpectrum.rationalSubset` |
| [T125](#t125) | ECD §6, proof of Proposition 6.4(iv), p. 28 | `T122`, `T124`, `T111`, `T110`, `T117`, `AdicSpacesPartII:R0` |
| [T126](#t126) | ECD §6, proof of Proposition 6.4(iv), p. 28 | `PerfectoidSpaces:P5`, `PerfectoidSpaces:P1`, `PerfectoidSpaces:P3`, `PerfectoidSpaces:P2` |
| [T127](#t127) | ECD §6, Proposition 6.4 (set-up), p. 27 | `PerfectoidSpaces:P5`, `PerfectoidSpaces:P2`, `T110`, `AdicSpacesPartII:R0`, `TC:ValuationSpectrum.exists_mem_nhds_forall_rationalSubset_eq_of_sub_mem` |
| [T128](#t128) | ECD §6, proof of Proposition 6.4(iv), p. 28 | `T125`, `T110`, `T127`, `T117`, `T113`, `PerfectoidSpaces:P5` |
| [T129](#t129) | ECD §6, proof of Proposition 6.4(ii), p. 28 | `T128`, `PerfectoidSpaces:P5`, `PerfectoidSpaces:P2` |
| [T130](#t130) | ECD §6, Proposition 6.4(iv), p. 27 | `PerfectoidSpaces:P5`, `PerfectoidSpaces:P2`, `PerfectoidSpaces:P3`, `T126`, `T128`, `T129` |
| [T131](#t131) | ECD §6, Proposition 6.4(o), p. 27 | `PerfectoidSpaces:P5`, `T130`, `PerfectoidSpaces:P3`, `PerfectoidSpaces:P2` |
| [T132](#t132) | ECD §5, Definition 5.7(ii), p. 24 | `T122`, `AdicSpacesPartII:R5`, `PerfectoidSpaces:P1` |

### A4

| Target | Source | Prerequisites |
|---|---|---|
| [T133](#t133) | ECD §15, Lemma 15.3, p. 90 | `M:Algebra.Etale`, `M:Module.Finite`, `M:Module.FaithfullyFlat`, `M:IsIdempotentElem`, `M:Module.rankAtStalk`, `M:StandardEtalePair`, `M:StandardEtalePair.homEquiv`, `M:Algebra.IsStandardEtale`, `M:AdjoinRoot.powerBasis'`, `M:Algebra.Etale.iff_exists_algEquiv_prod`, `M:IsSepClosed`, `M:IsSepClosed.exists_root` |
| [T134](#t134) | ECD §15, Lemma 15.3, p. 90 | `M:Algebra.Etale`, `M:Module.Finite`, `M:Module.FaithfullyFlat`, `M:Module.Projective`, `M:Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, `M:Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`, `M:comonadicExtendScalars`, `M:Algebra.IsInvariant`, `M:IsGaloisGroup` |
| [T135](#t135) | Stacks Tag 0FWT (Lemma 15.11.13) | `M:HenselianRing`, `M:Ring.DirectLimit`, `M:Ideal.jacobson` |
| [T136](#t136) | KL I §1.2, Remark 1.2.9, p. 15 | `M:Ring.DirectLimit`, `M:Algebra.Etale`, `M:Module.Finite`, `M:Module.FaithfullyFlat`, `T133` |
| [T137](#t137) | Stacks Tag 0BN2 (Lemma 58.3.8) | `T134`, `T133`, `M:Module.rankAtStalk`, `M:Algebra.TensorProduct.lmul'`, `M:Equiv.Perm`, `M:Algebra.Etale.comp`, `M:Algebra.Etale.baseChange`, `M:IsIdempotentElem`, `M:IsSepClosed` |
| [T138](#t138) | ECD §15, Lemma 15.3, p. 90 | `T134`, `T133`, `T136`, `T137`, `M:Ring.DirectLimit`, `M:ProfiniteGrp`, `M:LocallyConstant`, `M:Algebra.Etale.comp`, `M:Algebra.IsInvariant` |
| [T139](#t139) | KL I §2.8, Definition 2.8.13, p. 63 | `AdicSpacesPartII:R0`, `T010`, `T013`, `T014`, `ClassicalAdicEtaleCohomology:H1:henselian`, `PerfectoidSpaces:P3`, `T133`, `TC:Huber.Pair`, `TC:Huber.IsTateRing`, `TC:Huber.powerBoundedSubring`, `M:Algebra.Etale`, `M:Module.FaithfullyFlat` |
| [T140](#t140) | Berkeley Lecture 10, Lemma 10.1.6, p. 75 | `T138`, `T010`, `AdicSpacesPartII:R0`, `TC:Huber.Pair`, `TC:Huber.Pair.Hom`, `TC:Huber.IsTateRing`, `TC:Huber.IsTateRing.completion`, `TC:Huber.powerBoundedSubring`, `TC:Huber.isOpen_powerBoundedSubring`, `TC:Huber.IsRingOfIntegralElements`, `TC:Huber.mem_of_isTopologicallyNilpotent_of_isIntegrallyClosedIn`, `M:UniformSpace.Completion`, `M:Ring.DirectLimit`, `M:IsIntegrallyClosedIn`, `M:ProfiniteGrp` |
| [T141](#t141) | Berkeley Lecture 7, Theorem 7.4.8, p. 54 | `T140`, `T138`, `T133`, `T135`, `T136`, `T010`, `ClassicalAdicEtaleCohomology:H1:henselian`, `PerfectoidSpaces:P3`, `M:HenselianRing`, `M:ContinuousMap`, `M:LocallyConstant` |
| [T142](#t142) | ECD §15, proof of Lemma 15.6, p. 91 | `T141`, `T134`, `T140`, `T150`, `M:comonadicExtendScalars`, `M:Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, `M:Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`, `M:ContinuousMap` |
| [T143](#t143) | ECD §15, proof of Lemma 15.3, p. 90 | `T133`, `M:AdjoinRoot.powerBasis'`, `M:StandardEtalePair`, `M:Algebra.IsStandardEtale`, `M:StandardEtalePair.homEquiv`, `M:Polynomial.Monic`, `M:Polynomial.derivative`, `TC:IsTopologicallyNilpotent.isUnit_one_sub`, `TC:Huber.IsPowerBounded`, `TC:Huber.powerBoundedSubring`, `TC:Huber.IsTateRing` |
| [T144](#t144) | ECD §15, proof of Lemma 15.3, p. 90 | `T143`, `T133`, `TC:Huber.IsPseudoUniformizer`, `TC:Huber.IsPowerBounded.isTopologicallyNilpotent_mul`, `TC:IsTopologicallyNilpotent.isUnit_one_add`, `TC:Huber.powerBoundedSubring`, `M:IsTopologicallyNilpotent` |
| [T145](#t145) | ECD §15, proof of Lemma 15.3, p. 90 | `T143`, `T144`, `T133`, `TC:Huber.IsPowerBounded.isTopologicallyNilpotent_mul`, `TC:Huber.powerBoundedSubring`, `M:frobenius` |
| [T146](#t146) | Berkeley Lecture 10, Lemma 10.1.6, p. 75 | `T144`, `T145`, `T133`, `PerfectoidSpaces:P1` |
| [T147](#t147) | ECD §15, Lemma 15.3, p. 90 | `T140`, `T141`, `T146`, `T138`, `PerfectoidSpaces:P1`, `TC:Huber.IsPseudoUniformizer` |
| [T148](#t148) | ECD §15, proof of Proposition 15.4, p. 91 | `T134`, `T010`, `AdicSpacesPartII:R0`, `TC:ValuationSpectrum.spa`, `TC:ValuationSpectrum.spaComap`, `TC:ValuationSpectrum.continuous_spaComap`, `TC:ValuationSpectrum.spaComap_preimage_rationalSubset`, `TC:ValuationSpectrum.rationalSubset` |
| [T149](#t149) | ECD §15, proof of Proposition 15.4, p. 91 | `T140`, `T148`, `T138`, `AdicSpacesPartII:R0`, `TC:ValuationSpectrum.spa`, `TC:ValuationSpectrum.spaComap`, `TC:ValuationSpectrum.rationalSubset`, `M:ProfiniteGrp` |
| [T150](#t150) | ECD §15, proof of Lemma 15.6, p. 91 | `T140`, `T138`, `T147`, `AdicSpacesPartII:R0`, `PerfectoidSpaces:P1`, `PerfectoidSpaces:P5`, `M:ContinuousMap`, `M:LocallyConstant`, `M:ProfiniteGrp` |
| [T151](#t151) | ECD §15, Proposition 15.4, p. 90 | `T140`, `T147`, `T150`, `T149`, `T142`, `T138`, `AdicSpacesPartII:R0`, `PerfectoidSpaces:P1`, `T072`, `TC:Huber.Pair`, `TC:Huber.Pair.Hom`, `TC:ValuationSpectrum.spa`, `TC:ValuationSpectrum.spaComap`, `M:ProfiniteGrp`, `M:ContinuousMap` |
| [T152](#t152) | ECD §15, Lemma 15.3, p. 90 | `T151`, `T138`, `T140`, `T147`, `T150`, `T149` |
| [T153](#t153) | ECD §15, Lemma 15.6, p. 91 | `T151`, `T149`, `T141`, `T142`, `T025`, `T024`, `T072`, `T010`, `T036` |

## Bibliography

Page locators refer to the printed pagination of the stated PDF or book edition.

- **HK**: D, a, v, i, d,  , H, a, n, s, e, n, ,,  , K, i, r, a, n,  , S, .,  , K, e, d, l, a, y, a, [Sheafiness criteria for Huber rings](https://kskedlaya.org/papers/criteria.pdf). Version dated 6 August 2026.
- **H96**: R, o, l, a, n, d,  , H, u, b, e, r, [Étale Cohomology of Rigid Analytic Varieties and Adic Spaces](https://link.springer.com/book/10.1007/978-3-663-09991-8). Aspects of Mathematics E30, Vieweg, 1996.
- **H94**: R, o, l, a, n, d,  , H, u, b, e, r, [A generalization of formal schemes and rigid analytic varieties](https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217). Math. Z. 217 (1994), 513–551.
- **Hüb**: K, a, t, h, a, r, i, n, a,  , H, ü, b, n, e, r, [Adic spaces](https://arxiv.org/abs/2405.06435). arXiv:2405.06435v1.
- **KL I**: K, i, r, a, n,  , S, .,  , K, e, d, l, a, y, a, ,,  , R, u, o, c, h, u, a, n,  , L, i, u, [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792). arXiv:1301.0792v5; Astérisque 371 (2015).
- **Morel**: S, o, p, h, i, e,  , M, o, r, e, l, [Adic spaces (lecture notes)](https://web.math.princeton.edu/~smorel/adic_notes.pdf). Lecture notes, 22 April 2019.
- **ECD**: P, e, t, e, r,  , S, c, h, o, l, z, e, [Étale cohomology of diamonds](https://arxiv.org/abs/1709.07343). arXiv:1709.07343v4, 14 April 2026.
- **PS**: P, e, t, e, r,  , S, c, h, o, l, z, e, [Perfectoid spaces](https://arxiv.org/abs/1111.4914). Publ. Math. IHÉS 116 (2012), 245–313; arXiv:1111.4914.
- **Berkeley**: P, e, t, e, r,  , S, c, h, o, l, z, e, ,,  , J, a, r, e, d,  , W, e, i, n, s, t, e, i, n, [Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf). Annals of Mathematics Studies 207 (2020); PDF dated 27 March 2020.
- **Wedhorn**: T, o, r, s, t, e, n,  , W, e, d, h, o, r, n, [Adic Spaces](https://arxiv.org/abs/1910.05934v1). arXiv:1910.05934v1.
- **PH**: P, e, t, e, r,  , S, c, h, o, l, z, e, [p-adic Hodge theory for rigid-analytic varieties](https://arxiv.org/abs/1205.3463). arXiv:1205.3463v2; Forum of Mathematics, Pi 1 (2013), e1.
- **dJvP**: J, o, h, a, n,  , d, e,  , J, o, n, g, ,,  , M, a, r, i, u, s,  , v, a, n,  , d, e, r,  , P, u, t, [Étale cohomology of rigid analytic spaces](https://ems.press/content/serial-article-files/25781). Documenta Mathematica 1 (1996), 1–56.
- **FS**: L, a, u, r, e, n, t,  , F, a, r, g, u, e, s, ,,  , P, e, t, e, r,  , S, c, h, o, l, z, e, [Geometrization of the local Langlands correspondence](https://arxiv.org/abs/2102.13459). arXiv:2102.13459v4.
- **PH erratum**: P, e, t, e, r,  , S, c, h, o, l, z, e, [Erratum to 'p-adic Hodge theory for rigid-analytic varieties'](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf). Author’s three-page erratum; read alongside PH.
- **H93**: R, o, l, a, n, d,  , H, u, b, e, r, [Continuous valuations](https://gdz.sub.uni-goettingen.de/id/PPN266833020_0212). Math. Z. 212 (1993), 455–477.
- **BHW**: C, h, r, i, s, t, o, p, h, e, r,  , B, i, r, k, b, e, c, k, ,,  , B, e, n,  , H, e, u, e, r, ,,  , C, h, r, i, s,  , W, i, l, l, i, a, m, s, [Overconvergent Hilbert modular forms via perfectoid modular varieties](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf). Annales de l’Institut Fourier 73 (2023), 1709–1794.
- **Zav**: B, o, g, d, a, n,  , Z, a, v, y, a, l, o, v, [Some foundational results in adic geometry](https://arxiv.org/abs/2409.15516). arXiv:2409.15516v2, 17 July 2025.
- **KL II**: K, i, r, a, n,  , S, .,  , K, e, d, l, a, y, a, ,,  , R, u, o, c, h, u, a, n,  , L, i, u, [Relative p-adic Hodge theory, II: Imperfect period rings](https://arxiv.org/abs/1602.06899). arXiv:1602.06899v3, 21 October 2019.
- **Stacks**: T, h, e,  , S, t, a, c, k, s,  , p, r, o, j, e, c, t,  , a, u, t, h, o, r, s, [The Stacks project](https://stacks.math.columbia.edu). Online edition; references use stable tags.
