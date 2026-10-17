# Arithmetic statistics, counting fields and Selmer distributions, Part II: random Γ-groups and nonabelian Cohen–Lenstra–Martinet heuristics

This roadmap builds the probability theory of random profinite groups with an action of a finite group Γ, following Liu, Wood and Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions* (Part I, §§1–7), and the paper of Liu and Wood on the free group modulo n + u random relations on whose lemmas its §§4–5 rest. It starts where *Arithmetic statistics, counting fields and Selmer distributions* (ArithmeticStatistics) stops: that roadmap plans families of fields, the Cohen–Lenstra measure, class-group moments and the function-field moment theorems, but no measure on spaces of profinite groups.

The end results are: the free admissible Γ-group 𝓕_n and its universal property; the random groups X_{u,n} = 𝓕_n/[Y(S)] for n + u Haar-random relations of the form Y(s); the exact distribution of their level-𝒞 completions (Theorem 4.12); the absence of escape of mass and the limiting Borel probability measure μ_u on the space 𝒫 of admissible Γ-groups, with μ_Γ = μ_1 the weak limit of X_{1,n} (Theorem 1.2) and its explicit values (5.13) and (Theorem 5.15); the moments ∫|Sur_Γ(X, A)| dμ_u = [A : A^Γ]^{−u} (Theorem 6.2); the specializations to the Cohen–Lenstra–Martinet distribution (§7.1) and to the Boston–Bush–Hajir distributions of p-class tower groups (Theorems 7.4–7.5); and the arithmetic interface: the conjecture that Gal(K^#/K) is μ_Γ-distributed (Conjecture 1.3), stated as a proposition, its consistency with admissibility and Property E, the comparison with the function-field moment theorem, and the occurrence of every p-class tower group in the model (Proposition 3.22).

## Scope and boundaries

- **ArithmeticStatistics** (first prerequisite). ST.5 supplies the Cohen–Lenstra measure μ_{p,u} (`cohen-lenstra-measure`), the predicted Cohen–Martinet moments (`cohen-martinet-predicted-surjection-moment`, `cohen-martinet-surjection-moment-conjecture`), the abelian conjugacy lemma (`complements-of-a-coprime-abelian-normal-subgroup-are-conjugate`) and the function-field moment theorem of Liu–Wood–Zureick-Brown with its corollary (`liu-wood-zureick-brown-function-field-moments`, `cohen-lenstra-martinet-moments-over-function-fields`). Those are imported, never restated; the comparison of their right-hand sides with μ_Γ is RG.6.
- **InverseGaloisAndArithmeticFundamentalGroups IG.4** supplies the Galois side: the Γ-action on Gal(K^#/K) through a Schur–Zassenhaus section and the definition of admissible Γ-groups (`unramified-gamma-groups`), Property E for the pro-Δ′ category (`property-e`), the theorem that Gal(K^#/K) has Property E (`unramified-property-e`) and the profinite coprime complements (`coprime-profinite-complements`). This roadmap asks IG.4 to state Property E for an arbitrary full subcategory and to record the solvability input of complement conjugacy.
- **Tau Ceti.** ProfiniteProPGroups Layers 0–1 (profinite foundations and the supernatural order, `TauCeti.profiniteOrder`), Layer 3 (Frattini theory, generator rank, the lower p-central series), Layer 4 (free pro-C groups on finite sets) and Layer 5 (presentations, H² of free pro-p groups, relation ranks); ProfiniteCohomology Layer 5 (the five-term sequence); ClassFieldTheory Layer 12 (Hilbert class fields). At the pinned commit Tau Ceti has `TauCeti.haarProb` (normalized Haar measure on compact groups, uniform on finite groups), `TauCeti.maximalProPQuotient` and `TauCeti.IsProP`; it does not have the free pro-C group, which Tau Ceti's main branch now has as `TauCeti.freeProC`.
- **Mathlib** supplies MulDistribMulAction and its equivariant homomorphisms, semidirect products, fixed-point subgroups, Schur–Zassenhaus existence and the abelian conjugacy, the Möbius function of a locally finite order, Carathéodory extension from a σ-subadditive content (`MeasureTheory.AddContent.measure`), Fatou's lemma, Tannery's theorem, the open-set Portmanteau criterion, Maschke's theorem, Nakayama's lemma and Hermite's finiteness theorem.
- **ArithmeticGaloisDuality R02.3** is asked for Koch's bound on H² of the maximal unramified pro-p extension and the Galois structure of the units mod p; **FunctionFieldArithmetic FA.4** for the function-field class field theory.
- **Not here.** The Hurwitz-space proof of the function-field moment theorem belongs to ArithmeticStatistics ST.5 and InverseGaloisAndArithmeticFundamentalGroups IG.5. Random polynomials of growing degree, Schinzel averages over coefficient boxes and Smith's method for 2^∞-class groups are separate Part II roadmaps of ArithmeticStatistics (see *Structure*).

## Conventions

- Γ is a finite group with a fixed generating tuple (γ_1, …, γ_d); results never depend on the tuple. A Γ-group is a profinite group with an action of Γ by continuous automorphisms (Mathlib's `MulDistribMulAction` with continuity of each γ); homomorphisms are continuous; generation is topological generation; |G| is the supernatural order. A Γ-group is pro-n′ (an n′-Γ-group) when every quotient by an open normal subgroup has order prime to n. Finite groups carry the discrete topology.
- Y(g) = (g⁻¹γ_1(g), …, g⁻¹γ_d(g)); [S] is the closed normal Γ-subgroup generated by S and [Y(S)] the one generated by the coordinates of the Y(s), s ∈ S. For finite G, |Y(G)| = [G : G^Γ].
- **The hypothesis (SZ_Γ).** For every finite group N of order prime to |Γ| with an action of Γ, every crossed homomorphism Γ → N is principal; equivalently all complements of N in N ⋊ Γ are N-conjugate. It is proved for solvable Γ and for abelian N; for arbitrary Γ it is the conjugacy half of the Schur–Zassenhaus theorem, whose proof uses the Feit–Thompson theorem, which the libraries lack. Every statement below that depends on it says so.
- 𝒞 always denotes a set of finite |Γ|′-Γ-groups; 𝒞̄ is its closure under finite direct products, Γ-subgroups and Γ-quotients, which need not be closed under extensions; 𝒞_ℓ is the set of |Γ|′-Γ-groups of order at most ℓ. 'Property E at level 𝒞' means Property E in the category of Γ-groups of level 𝒞.
- n ≥ 1 and u is an integer with u > −n; the default is u = 1 and μ_Γ = μ_1. Every statement about μ_u holds for every integer u.
- 𝒜_H is the set of non-trivial finite abelian irreducible |Γ|′-(H ⋊ Γ)-groups — Z/p with trivial action is a member, with |Y(Z/p)| = 1 — and 𝒩 the set of |Γ|′-Γ-groups that are powers of a non-abelian simple group.
- Statements use the corrected forms recorded under *Source issues*: in particular, every explicit limit formula assumes Property E at level 𝒞, and gives the value 0 without it.

## Layers

### RG.0. Γ-groups, the map Y and coprime actions

**Targets.** Fix a finite group Γ and a generating tuple (γ_1, …, γ_d) of Γ.
- *Γ-groups.* A Γ-group is a profinite group with an action of Γ by continuous automorphisms. Pin the equivariant hom-sets Hom_Γ, Sur_Γ, Aut_Γ, closed Γ-subgroups, the closed normal Γ-subgroup [S] generated by a subset, irreducible Γ-groups, h_Γ(H) = |Hom_Γ(H, H)|, the semidirect product H ⋊ Γ, fixed points G^Γ and n′-Γ-groups (every finite continuous quotient of order prime to n, i.e. `TauCeti.profiniteOrder` prime to n).
- *The map Y.* Y(g) = (g⁻¹γ_1(g), …, g⁻¹γ_d(g)) ∈ G^d, with Y(g) = Y(h) iff hg⁻¹ ∈ G^Γ, naturality in Γ-maps, and |G| = |G^Γ|·|Y(G)| for finite G (LWZB Lemma 3.5).
- *Sections and Y.* For a |Γ|′-Γ-group G satisfying the coprime conjugacy hypothesis (SZ) — trivial non-abelian H¹(Γ, N) for the finite quotients N — Y(G) is in bijection with the continuous sections of G ⋊ Γ → Γ; Y(E) = Y(G) ∩ E^d for closed Γ-subgroups E (Lemma 3.4); for 1 → N → G → H → 1 of finite |Γ|′-Γ-groups, fixed points are exact, |Y(N)| = |Y(G)|/|Y(H)| and the fibres of Y(G) → Y(H) have constant size (Lemma 3.6).
- *Admissible Γ-groups.* Closure under Γ-quotients and finite products, Γ-generation by the coordinates of Y(G) (Lemma 3.9), centrality of normal Γ-subgroups with trivial Γ-action (Lemma 3.12), rigidity Y(D) = Y(E) ⇒ D = E, and the abelian criterion: a finite abelian |Γ|′-Γ-group is admissible iff H^Γ = 1 (§7.1).

**Imports.** The definition of admissibility and the profinite Schur–Zassenhaus theorem are InverseGaloisAndArithmeticFundamentalGroups:IG.4 (`unramified-gamma-groups`, `coprime-profinite-complements`); complement existence is Mathlib's `Subgroup.exists_right_complement'_of_coprime`; the abelian conjugacy case is ArithmeticStatistics:ST.5 (`complements-of-a-coprime-abelian-normal-subgroup-are-conjugate`).

**Hypothesis (SZ).** Conjugacy of coprime complements holds without further input when Γ or the normal subgroup is solvable; in general it rests on the Feit–Thompson theorem, which neither library contains. Every statement of RG.0–RG.6 that uses it carries (SZ) explicitly.

**Acceptance.** Γ = Z/2 acting on Z/3 by inversion has fixed points 1, |Y| = 3 and h_Γ = 3; on Z/4 by inversion |Y(Z/4)| = 2 and the bijection of RG.1 fails (Z/4 is not pro-odd); a finite abelian group with nontrivial Γ-invariants is not admissible.

Layer dependencies: InverseGaloisAndArithmeticFundamentalGroups:IG.4, ArithmeticStatistics:ST.5, tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index.

#### Γ-groups and their equivariant maps

Declaration: ArithmeticStatisticsPartII:RG.0/gamma-group. Kind: definition. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Basic`, namespace `TauCeti.GammaGroup`.

Let Γ be a finite group. A Γ-group is a profinite group G (a compact, Hausdorff, totally disconnected topological group) with an action of Γ on G by continuous group automorphisms; as Γ is finite and discrete, the action map Γ × G → G is then continuous. A morphism of Γ-groups is a continuous Γ-equivariant homomorphism; Hom_Γ(G, H), Sur_Γ(G, H) and Aut_Γ(G) denote the morphisms, the surjective morphisms and the automorphisms. A Γ-subgroup is a closed Γ-stable subgroup; a Γ-quotient is the target of a surjective morphism. For S ⊆ G, [S]_G is the smallest closed normal Γ-subgroup of G containing S, and G is Γ-generated by S when the closed subgroup generated by {γ(s) : γ ∈ Γ, s ∈ S} is G. G is an irreducible Γ-group when it is non-trivial and its only closed normal Γ-subgroups are 1 and G (for an action that contains the inner automorphisms, every Γ-stable subgroup is normal and the condition reads: no proper non-trivial Γ-subgroups). For finite H, h_Γ(H) = |Hom_Γ(H, H)|. G^Γ is the closed subgroup of Γ-fixed points and H ⋊ Γ the semidirect product for the action. For a positive integer n, G is an n′-Γ-group (pro-n′) when every quotient of G by an open normal subgroup has order prime to n, equivalently when the supernatural order of G is prime to n. The same vocabulary is used for an arbitrary group F acting on a finite group (an F-group), as in Liu–Wood §2.2.

**Hypotheses.** Γ is a finite group; groups acted on are profinite (finite groups carry the discrete topology).

**Construction or proof.**

1. Model a Γ-group as a profinite group with Mathlib's MulDistribMulAction Γ G and continuity of each γ (ContinuousConstSMul); continuity of the joint action follows because Γ is finite and discrete.
2. Model morphisms as continuous elements of Mathlib's MulDistribMulActionHom G →*[Γ] H; Sur_Γ and Aut_Γ are the surjective and invertible ones.
3. Define [S]_G as the topological closure of the normal closure of the Γ-orbit of S; it is Γ-stable because Γ acts by continuous automorphisms that preserve normal closures and closures.
4. Define pro-n′ through the quotients by open normal subgroups and identify it with coprimality of TauCeti.profiniteOrder with n (Ribes–Zalesskii §2.3, the supernatural order).
5. The semidirect product H ⋊ Γ is Mathlib's SemidirectProduct for the homomorphism Γ → MulAut H given by the action.

**Uses.** LWZB §§3–7: every random group, completion and count is a Γ-group or a Γ-equivariant map; LWZB Proposition 4.3 and Corollary 4.8: the irreducible F ⋊ Γ-groups and h_{H⋊Γ}(G) enter the generation probabilities and multiplicities; LWZB Theorem 6.2: the moments count Sur_Γ(X, A); InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-gamma-groups: Gal(K^#/K) with a Schur–Zassenhaus section is a Γ-group in this sense.

**API.**

- `GammaGroup.Hom` (data): Hom_Γ(G, H): the continuous elements of Mathlib's MulDistribMulActionHom G →*[Γ] H, closed under composition and containing the identity.
- `GammaGroup.Hom.comp_assoc` (functoriality): Composition of morphisms is associative and unital, so Γ-groups form a category.
- `GammaGroup.countSur` (data): For finite G and H, |Sur_Γ(G, H)| as a natural number: the cardinality of the surjective elements of G →*[Γ] H.
- `GammaGroup.isClosed_fixedPoints` (structure): G^Γ = FixedPoints.subgroup Γ G is a closed subgroup of G.
- `GammaGroup.closedNormalClosure` (data): [S]_G, the topological closure of the normal closure of ⋃_γ γ(S).
- `GammaGroup.closedNormalClosure_le_iff` (characterisation): [S]_G ≤ N iff S ⊆ N, for every closed normal Γ-subgroup N of G.
- `GammaGroup.map_closedNormalClosure` (functoriality): For a morphism φ, φ([S]_G) ⊆ [φ(S)]_H, with equality when φ is surjective (compactness makes the image of a closure closed).
- `GammaGroup.homEquivSemidirect` (equivalence): Hom_Γ(G, H) is in bijection with the continuous homomorphisms G ⋊ Γ → H ⋊ Γ that commute with the projections to Γ and restrict to the identity on Γ.
- `GammaGroup.IsPrimeTo` (compatibility): G is pro-n′ iff gcd(|G/U|, n) = 1 for every open normal U, iff TauCeti.profiniteOrder G is prime to n; the property passes to closed subgroups, Γ-quotients and finite products, and for finite discrete G it is gcd(|G|, n) = 1.
- `GammaGroup.hEnd` (other): h_Γ(H) = |Hom_Γ(H, H)|; for an abelian irreducible H the ring End_Γ(H) is a finite field, so h_Γ(H) is a power of the prime p with pH = 0.

**Unit tests.**

- `GammaGroup.test_inversion_Z3` (computation): For Γ = Z/2 acting on Z/3 by inversion: G^Γ = 1, h_Γ(Z/3) = 3 and |Sur_Γ(Z/3, Z/3)| = 2.
- `GammaGroup.test_trivial_Gamma` (degenerate): For Γ = 1, Hom_Γ is the set of continuous homomorphisms and [S]_G is the closed normal subgroup generated by S.
- `GammaGroup.test_closure_swap` (non-example): For Γ = Z/2 swapping the factors of (Z/3)² and S = {(1, 0)}, [S] is all of (Z/3)², while the closed normal subgroup generated by S alone is Z/3 × 0.
- `GammaGroup.test_primeTo_finite` (compatibility): For a finite discrete group G, G is pro-n′ iff Nat.Coprime (Nat.card G) n.

**Acceptance.** For Γ = 1 the notions are those of profinite groups and their continuous homomorphisms. Γ-equivariant homomorphisms G → H correspond to homomorphisms G ⋊ Γ → H ⋊ Γ over Γ that are the identity on Γ.

**Depends on.** `MulDistribMulAction` (Mathlib); `MulDistribMulActionHom` (Mathlib); `FixedPoints.subgroup` (Mathlib); `SemidirectProduct` (Mathlib); `OpenNormalSubgroup` (Mathlib); `Subgroup.topologicalClosure` (Mathlib); `ProfiniteGrp` (Mathlib); `TauCeti.profiniteOrder` (Tau Ceti); tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index.

**Source.** LWZB, §1.7, p. 9: Fixes the conventions: Γ-groups as profinite groups with continuous Γ-action, morphisms, Γ-subgroups and Γ-quotients, Hom_Γ, Sur_Γ, Aut_Γ, irreducible Γ-groups, Γ-generation, the closed normal Γ-subgroup [x_1, …], H ⋊ Γ, h_Γ and pro-n′ groups. LW20, §2.2, p. 4: Defines F-groups for an arbitrary group F, their morphisms, irreducible F-groups as those with no normal F-subgroups but 1 and the group, and h_F(G) = |Hom_F(G, G)|.

#### The map Y

Declaration: ArithmeticStatisticsPartII:RG.0/y-map. Kind: definition. Planet: The map Y. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/YMap`, namespace `TauCeti.GammaGroup`.

Fix a tuple (γ_1, …, γ_d) of generators of Γ. For a Γ-group G define Y : G → G^d by Y(g) = (g⁻¹γ_1(g), …, g⁻¹γ_d(g)), write Y(G) for its image, and for S ⊆ G write [Y(S)] for the closed normal Γ-subgroup generated by the coordinates of the Y(s), s ∈ S. Y is continuous, Y(1) = 1, Y(gh) = h⁻¹Y(g)h · Y(h) coordinatewise, and Y(g) = Y(h) iff hg⁻¹ ∈ G^Γ; hence the fibres of Y are the right cosets G^Γ g, the partition of G into fibres does not depend on the generating tuple, and for finite G, |G| = |G^Γ| · |Y(G)| (LWZB Lemma 3.5). Morphisms commute with Y. Using all elements of Γ as the tuple, Y(g) is the principal crossed homomorphism σ ↦ g⁻¹σ(g).

**Hypotheses.** (γ_1, …, γ_d) generates Γ; G is a Γ-group.

**Construction or proof.**

1. h⁻¹γ(h) = g⁻¹γ(g) is equivalent to γ(hg⁻¹) = hg⁻¹; quantifying over the generators gives hg⁻¹ ∈ G^Γ, because a generating tuple fixes an element iff Γ does.
2. The fibre through g is therefore the right coset G^Γ g, which gives |G| = |G^Γ||Y(G)| for finite G (LWZB Lemma 3.5).
3. Twisted multiplicativity: (gh)⁻¹γ(gh) = h⁻¹(g⁻¹γ(g))h · h⁻¹γ(h).
4. Naturality: φ(g)⁻¹γ(φ(g)) = φ(g⁻¹γ(g)) for a Γ-equivariant homomorphism φ.

**Uses.** LWZB Lemma 3.1: the retraction π is defined by choosing y_i ∈ 𝓕_n with Y(y_i) = Y(x_i); LWZB Corollary 3.8: Hom_Γ(𝓕_n, G) is identified with Y(G)^n; LWZB Definition 3.15: the random relations are the coordinates of Y(s) for Haar-random s; LWZB Proposition 4.3 and (4.16): Y(y) is trivial with probability |Y(G)|⁻¹ for uniform y.

**API.**

- `yMap` (data): yMap Γ G g = fun γ ↦ g⁻¹ * (γ • g), the version indexed by all of Γ; the d-tuple version is its restriction to the chosen generators.
- `yMap_apply` (simp): yMap Γ G g γ = g⁻¹ * (γ • g).
- `yMap_one` (simp): yMap Γ G 1 = 1.
- `yMap_mul` (relation): yMap Γ G (g * h) γ = h⁻¹ * yMap Γ G g γ * h * yMap Γ G h γ.
- `yMap_eq_yMap_iff` (characterisation): yMap Γ G g = yMap Γ G h ↔ h * g⁻¹ ∈ FixedPoints.subgroup Γ G.
- `yMap_eq_one_iff` (characterisation): yMap Γ G g = 1 ↔ g ∈ FixedPoints.subgroup Γ G.
- `yMap_map` (functoriality): For a Γ-equivariant homomorphism φ, yMap Γ H (φ g) = φ ∘ yMap Γ G g.
- `card_eq_card_fixedPoints_mul_card_range_yMap` (relation): For finite G, Nat.card G = Nat.card (FixedPoints.subgroup Γ G) * Nat.card (Set.range (yMap Γ G)).
- `continuous_yMap` (structure): yMap Γ G is continuous for the product topology on Γ → G.

**Unit tests.**

- `yMap_test_inversion_Z3` (computation): Γ = Z/2 acting on Z/3 by inversion: Y(g) = −2g, Y(Z/3) = Z/3, so |Y(Z/3)| = 3 = [Z/3 : 1].
- `yMap_test_trivial_action` (degenerate): If Γ acts trivially then Y(G) = {1}, so |Y(G)| = 1 (the case Z/p with trivial action in Proposition 3.13).
- `yMap_test_Z4` (compatibility): Γ = Z/2 acting on Z/4 by inversion: G^Γ = {0, 2} and Y(Z/4) = {0, 2}, so 4 = 2 · 2 as Lemma 3.5 requires.
- `yMap_test_not_hom` (non-example): Y is not a homomorphism: for Γ = Z/2 acting on S_3 by conjugation by (12), the transposition g = (23) has Y(g²) = 1 while Y(g)² ≠ 1, Y(g) being a 3-cycle; Y(S_3) = A_3 has 3 = [S_3 : C(12)] elements.

**Acceptance.** The fibre partition is the same for every generating tuple (the criterion hg⁻¹ ∈ G^Γ does not mention the tuple), which is the content of LWZB Lemma 3.9's independence statement at the level of sets.

**Depends on.** *Γ-groups and their equivariant maps* (RG.0/gamma-group); `FixedPoints.subgroup` (Mathlib).

**Source.** LWZB, (3.3) and Lemma 3.5, pp. 13–14: Defines Y(g) = (g⁻¹γ_1(g), …, g⁻¹γ_d(g)) for a fixed generating set and proves that its fibres over finite G are the cosets of G^Γ, so |G| = |G^Γ||Y(G)|. LWZB, §3.2, p. 15: Introduces the notation [Y(S)] for the closed normal Γ-subgroup generated by the coordinates of Y(r), r ∈ S.

#### The coprime conjugacy hypothesis (SZ)

Declaration: ArithmeticStatisticsPartII:RG.0/coprime-conjugacy-hypothesis. Kind: definition. Planet: Coprime conjugacy hypothesis (SZ). Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/CoprimeConjugacy`, namespace `TauCeti.GammaGroup`.

For a finite group Γ, (SZ_Γ) is the proposition: for every finite group N of order prime to |Γ| with an action of Γ by automorphisms, every crossed homomorphism c : Γ → N (c(στ) = c(σ)·σ(c(τ))) is principal, c(σ) = g⁻¹σ(g) for some g ∈ N; equivalently the non-abelian H¹(Γ, N) is a point; equivalently all complements of N in N ⋊ Γ are N-conjugate. (SZ_Γ) holds when Γ is solvable, and for each abelian N without hypothesis on Γ; for all Γ it is equivalent, given Schur–Zassenhaus existence, to the conjugacy half of the Schur–Zassenhaus theorem, whose proof in general uses the Feit–Thompson theorem. A profinite version follows by compactness: if (SZ_Γ) holds then for every |Γ|′-Γ-group N every continuous crossed homomorphism Γ → N is principal.

**Hypotheses.** Γ finite; N finite (respectively pro-|Γ|′ for the profinite form) with gcd(|N|, |Γ|) = 1.

**Construction or proof.**

1. Crossed homomorphisms c correspond to sections σ ↦ (c(σ), σ) of N ⋊ Γ → Γ, principal ones to the N-conjugates of the trivial section; this gives the equivalence of the three formulations.
2. Abelian N: Mathlib's Subgroup.exists_smul_eq (the abelian Schur–Zassenhaus conjugacy) and ArithmeticStatistics:ST.5/complements-of-a-coprime-abelian-normal-subgroup-are-conjugate.
3. Solvable Γ: the classical induction on |N ⋊ Γ| over a minimal normal subgroup of the solvable complement (Gorenstein, Finite Groups, Theorem 6.2.1, case of a solvable quotient), using the abelian case at each step.
4. General Γ: one of |N|, |Γ| is odd, hence the corresponding group is solvable by Feit–Thompson, and the solvable cases apply. Neither library nor any atlas layer has Feit–Thompson; this is recorded as a gap.
5. Profinite form: the sets of g ∈ N/U trivializing c mod U are non-empty finite and compatible over the open normal Γ-stable U, so their inverse limit is non-empty (as in InverseGaloisAndArithmeticFundamentalGroups:IG.4/coprime-profinite-complements).

**Uses.** LWZB Lemma 3.4 and the bijection Y(G) ↔ sections, p. 14: surjectivity of g ↦ (conjugate of the trivial section) is exactly (SZ); LWZB Lemma 3.6(1): exactness of fixed points needs H¹(Γ, N) = 1; LWZB Lemma 5.2: conjugacy of the image of Γ in a chief factor pair; ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments: carries the same hypothesis under the name (SZ).

**API.**

- `CoprimeH1Trivial` (data): The proposition (SZ_Γ), stated with crossed homomorphisms Γ → N for every finite N of order prime to |Γ| with a MulDistribMulAction of Γ.
- `coprimeH1Trivial_iff_conj` (equivalence): (SZ_Γ) holds iff, for every such N, every complement of N in N ⋊ Γ is N-conjugate to Γ.
- `coprimeH1Trivial_of_isSolvable` (constructor): If Γ is solvable then (SZ_Γ) holds.
- `crossedHom_principal_of_commGroup` (constructor): For abelian N of order prime to |Γ|, every crossed homomorphism Γ → N is principal, with no hypothesis on Γ.
- `CoprimeH1Trivial.profinite` (other): Under (SZ_Γ), every continuous crossed homomorphism Γ → N into a |Γ|′-Γ-group N is principal.
- `CoprimeH1Trivial.card_sections` (relation): Under (SZ_Γ), for finite |Γ|′ H the sections of H ⋊ Γ → Γ form one H-orbit with stabilizer H^Γ, so there are [H : H^Γ] of them.

**Unit tests.**

- `CoprimeH1Trivial.test_Z2` (computation): (SZ_Γ) holds for Γ = Z/2 (solvable); for N = Z/3 with inversion every a ∈ Z/3 is the value c(σ) of a crossed homomorphism (c(σ²) = a + σ(a) = 0), and c(σ) = −2g = g⁻¹σ(g) for g = a, since −2 ≡ 1 mod 3.
- `CoprimeH1Trivial.test_trivial_group` (degenerate): For Γ = 1 the proposition holds trivially: the only crossed homomorphism is constant 1.
- `CoprimeH1Trivial.test_noncoprime` (non-example): Without coprimality the statement fails: Γ = Z/2 acting trivially on N = Z/2 has the crossed homomorphism id, which is not principal because g⁻¹σ(g) = 1.
- `CoprimeH1Trivial.test_abelian_compat` (compatibility): For abelian N the conclusion is Mathlib's abelian Schur–Zassenhaus conjugacy Subgroup.exists_smul_eq transported along N ⋊ Γ.

**Acceptance.** (SZ_Γ) holds for Γ = Z/2, Z/4, (Z/2)², D_8 and S_3, which covers every Γ in the test cases of RG.5. Dropping coprimality breaks it: Γ = Z/2 acting trivially on N = Z/2 has the non-principal crossed homomorphism id : Γ → N.

**Depends on.** *Γ-groups and their equivariant maps* (RG.0/gamma-group); `Subgroup.exists_right_complement'_of_coprime` (Mathlib); `Subgroup.exists_smul_eq` (Mathlib); `Group.IsSolvable` (Mathlib); ArithmeticStatistics:ST.5/complements-of-a-coprime-abelian-normal-subgroup-are-conjugate; InverseGaloisAndArithmeticFundamentalGroups:IG.4/coprime-profinite-complements.

**Source.** LWZB, §2, p. 10, and the proof of Lemma 3.6, p. 14: Uses that all sections of Gal(L/Q) → Γ are conjugate and that H¹(Γ, N) vanishes for finite |Γ|′-Γ-groups N, both by the Schur–Zassenhaus theorem (Ribes–Zalesskii, Theorem 2.3.15). LWZB, Remark after Definition 3.15, p. 17: Notes that for |Γ| odd the random groups need not be prosolvable, so the conjugacy input is not covered by a solvability argument on the side of the random group.

#### Sections of G ⋊ Γ and the fibres of Y (Lemmas 3.4–3.6)

Declaration: ArithmeticStatisticsPartII:RG.0/sections-and-y. Kind: theorem. Planet: Sections and the map Y. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Sections`, namespace `TauCeti.GammaGroup`.

Assume (SZ_Γ). (a) For a |Γ|′-Γ-group G, sending g to the g-conjugate of the trivial section induces a bijection between Y(G) and the continuous sections of G ⋊ Γ → Γ; the sections form one G-conjugacy class with stabilizer G^Γ. (b) (Lemma 3.4) For a closed Γ-subgroup E of a |Γ|′-Γ-group G, Y(E) = Y(G) ∩ E^d. (c) (Lemma 3.6) For an exact sequence 1 → N → G → H → 1 of finite |Γ|′-Γ-groups: 1 → N^Γ → G^Γ → H^Γ → 1 is exact; |Y(N)| = |Y(G)|/|Y(H)|; and |Y(G) ∩ π⁻¹(x)| = |Y(G)|/|Y(H)| for every x ∈ Y(H), where π also denotes G^d → H^d.

**Hypotheses.** (SZ_Γ) (RG.0/coprime-conjugacy-hypothesis), or the special case it covers (Γ solvable, or all groups involved abelian). G, E, N, G, H are pro-|Γ|′ (finite in (c)).

**Construction or proof.**

1. (a) Conjugating the trivial section by (g, 1) gives γ_i ↦ (g⁻¹γ_i(g), γ_i); two such agree on the generators iff they agree everywhere, so the induced map from Y(G) is injective; surjectivity is (SZ_Γ) in its profinite form.
2. (b) A section with image in E ⋊ Γ is a section of E ⋊ Γ → Γ, and conversely; apply (a) to E and to G.
3. (c) The long exact sequence of pointed sets 1 → N^Γ → G^Γ → H^Γ → H¹(Γ, N) has H¹(Γ, N) = 1 by (SZ_Γ), giving exactness; with RG.0/y-map (|X| = |X^Γ||Y(X)|) this gives |Y(N)| = |Y(G)|/|Y(H)|.
4. For the fibre count, fix g over h with Y(h) = x; z ↦ (g, …, g)·z·(γ_1(g)⁻¹, …, γ_d(g)⁻¹) preserves Y(G) and carries π⁻¹(x) onto N^d, so each fibre has |Y(G) ∩ N^d| = |Y(N)| elements by (b).

**Acceptance.** Γ = Z/2, 1 → Z/3 → Z/3 × Z/3 → Z/3 → 1 with inversion on both factors: |Y| = 9, 3, 3 and every fibre has 3 elements. Γ = Z/2 acting on Z/4 by inversion is not |Γ|′: there |Y(Z/4)| = 2 while Hom_Γ(𝓕_1, Z/4) has one element, so the hypothesis cannot be dropped (LWZB source issue on Corollary 3.8).

**Depends on.** *The map Y* (RG.0/y-map); *The coprime conjugacy hypothesis (SZ)* (RG.0/coprime-conjugacy-hypothesis); InverseGaloisAndArithmeticFundamentalGroups:IG.4/coprime-profinite-complements; `SemidirectProduct` (Mathlib).

**Source.** LWZB, Paragraph after (3.3), Lemma 3.4, Lemma 3.6, pp. 13–14: Identifies Y(G) with the sections of G ⋊ Γ → Γ by Schur–Zassenhaus, proves Y(E) = Y(G) ∩ E^d, and proves exactness of fixed points and the counting identities for |Y| in an exact sequence of finite |Γ|′-Γ-groups. LWZB, Proof of Lemma 3.6(3), p. 14: Translates the fibre over x to N^d by the map z ↦ (g, …, g) z (γ_i(g)⁻¹); the printed γ_d^{−1}(g) is read as γ_d(g)^{−1} (source issue ArithmeticStatisticsPartII/E2).

#### Admissible Γ-groups: closure properties and the abelian criterion

Declaration: ArithmeticStatisticsPartII:RG.0/admissible-gamma-groups. Kind: theorem. Planet: Admissible Γ-groups. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Admissible`, namespace `TauCeti.GammaGroup`.

Call a Γ-group admissible when it is pro-|Γ|′ and topologically generated by {g⁻¹γ(g) : g ∈ G, γ ∈ Γ} (the definition of InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-gamma-groups). Then: (a) Γ-quotients and finite products of admissible Γ-groups are admissible; (b) (Lemma 3.9) an admissible G is Γ-generated by the coordinates of Y(G) for any generating tuple of Γ; (c) (Lemma 3.12) if G̃ is admissible and N a closed normal Γ-subgroup on which Γ acts trivially, then N is central in G̃; (d) (rigidity) if E is admissible and D a closed Γ-subgroup with Y(D) = Y(E), then D = E; (e) (§7.1) a finite abelian |Γ|′-Γ-group H is admissible iff H^Γ = 1; (f) the Γ-coinvariants G/[g⁻¹γ(g)] of an admissible G are trivial, and an admissible Γ-group has no non-trivial Γ-quotient with trivial Γ-action.

**Hypotheses.** Γ finite; for (e) the hypothesis (SZ_Γ) is not needed because H is abelian.

**Construction or proof.**

1. (a) A surjection carries the generators g⁻¹γ(g) onto generators of the same form; for products use the coordinates.
2. (b) Expand g⁻¹σ(g) for σ = σ_1⋯σ_s a word in the generators as the product of σ_1⋯σ_{k−1}(g⁻¹σ_k(g)), each factor a Γ-translate of a coordinate of Y(g).
3. (c) For n ∈ N: (g⁻¹γ(g)) n (g⁻¹γ(g))⁻¹ = g⁻¹γ(g n g⁻¹)g = n because Γ fixes g n g⁻¹ ∈ N; the generators of G̃ centralize N, hence G̃ does.
4. (d) By (b), E is generated by the Γ-translates of the coordinates of Y(E) = Y(D) ⊆ D^d, and D is a Γ-subgroup.
5. (e) As |H| is prime to |Γ|, e = |Γ|⁻¹Σ_γ γ is an idempotent endomorphism of H with image H^Γ, and x − e(x) = |Γ|⁻¹Σ_γ (x − γx) lies in the subgroup S generated by the (γ − 1)h, while e kills S. Hence H = H^Γ ⊕ S, so H = S (admissible) iff H^Γ = 0. This is the additive form of the argument of §7.1, which uses Lemma 3.6(1).
6. (f) The coinvariant quotient has trivial Γ-action, so all g⁻¹γ(g) lie in the kernel, which is therefore everything.

**Acceptance.** Γ = Z/2: Z/3 with inversion is admissible, Z/3 with trivial action is not (its Y-image is trivial). Γ = Z/3 acting on (Z/2)² through multiplication by a primitive cube root of unity in F_4 is admissible (no non-zero fixed vector). Z/4 with inversion is not admissible for Γ = Z/2: it is not pro-odd.

**Depends on.** InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-gamma-groups; *The map Y* (RG.0/y-map); *Sections of G ⋊ Γ and the fibres of Y (Lemmas 3.4–3.6)* (RG.0/sections-and-y); *Γ-groups and their equivariant maps* (RG.0/gamma-group).

**Source.** LWZB, Lemma 3.9 and Lemma 3.12, pp. 14–15: Lemma 3.9: an admissible G is Γ-generated by the coordinates of Y(G), so 𝓕_n does not depend on the generating set; Lemma 3.12: a normal Γ-subgroup of an admissible group on which Γ acts trivially is centralized by the whole group. LWZB, §7.1, p. 34, first paragraph: Shows that a finite abelian |Γ|′-Γ-group is admissible exactly when it has no non-zero Γ-invariants, using Lemma 3.6(1). LWZB, Proof of Theorem 4.12, p. 25: Uses that for admissible E, Y(D) = Y(E) forces D = E, in the bounds |Y(D)|/|Y(H)| ≤ |Y(G)| and (4.18).

### RG.1. The free admissible Γ-group and level-𝒞 completions

**Targets.**
- *Level-𝒞 completion (LWZB (3.11)).* For a set 𝒞 of finite Γ-groups, its closure 𝒞̄ under finite products, Γ-subgroups and Γ-quotients, and the pro-𝒞 completion G^𝒞 = lim G/M over closed normal Γ-subgroups M with G/M ∈ 𝒞̄; groups of level 𝒞; universal property, functoriality, preservation of surjections, (G^𝒞)^𝒟 = G^𝒟 when 𝒟̄ ⊆ 𝒞̄, and the levels 𝒞_ℓ (|Γ|′-Γ-groups of order ≤ ℓ). 𝒞̄ is not extension-closed, so this is not the pro-C completion of ProfiniteProPGroups Layer 4.
- *F_n(Γ) and 𝓕_n (§3.1).* F_n(Γ) is the free pro-|Γ|′ group on {x_{i,γ}} with Γ permuting the generators; 𝓕_n is the closed Γ-subgroup generated by the x_i⁻¹γ_j(x_i). Lemma 3.1 (𝓕_n is admissible and is a Γ-retract of F_n), Remark 3.2 (free pro-|Γ|′ on the x_i⁻¹σ(x_i), σ ≠ 1).
- *Universal property (Corollary 3.8, Lemma 3.9, Corollary 3.10).* For every |Γ|′-Γ-group G, Y(G)^n ≅ Hom_Γ(𝓕_n, G); |Hom_Γ(𝓕_n, H)| = [H : H^Γ]^n and |Sur_Γ(𝓕_n, H)|·[H : H^Γ]^{−n} → 1 for finite admissible H; 𝓕_n does not depend on the generating tuple; 𝓕_n^ab ≅ (Ẑ′[Γ]/(Σ_g g))^n with Ẑ′ = ∏_{p∤|Γ|} Z_p; (𝓕_n)^𝒞 is finite for finite 𝒞.
- *Property E (Definition 2.3, Proposition 3.13).* Property E relative to the category of level-𝒞 Γ-groups and to pro-p Γ-groups, its passage to completions and to smaller categories, and the criterion: a Γ-quotient φ: (𝓕_n)^𝒞 → H has ker φ = [Y(ker φ)] iff H has Property E at level 𝒞.

**Imports.** Free pro-C groups on finite sets: tauceti:TauCetiRoadmap/ProfiniteProPGroups Layer 4. The notion of Property E: InverseGaloisAndArithmeticFundamentalGroups:IG.4 (`property-e`).

**Acceptance.** For Γ = Z/2, 𝓕_1 ≅ Ẑ_odd with σ = −1; the abelianization of F_1(Z/2) has Z_3-rank 2 while that of 𝓕_1 has rank 1; (Z/2)² with a nontrivial Z/3-action is admissible but lacks Property E at any level containing Q_8 with its Z/3-action.

Layer dependencies: ArithmeticStatisticsPartII:RG.0, InverseGaloisAndArithmeticFundamentalGroups:IG.4, tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets.

#### Level-𝒞 closure and the pro-𝒞 completion of a Γ-group

Declaration: ArithmeticStatisticsPartII:RG.1/level-completion. Kind: construction. Planet: Level-𝒞 completion. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/LevelCompletion`, namespace `TauCeti.GammaGroup`.

For a set 𝒞 of (isomorphism classes of) finite Γ-groups let 𝒞̄ be the smallest set of isomorphism classes of finite Γ-groups containing 𝒞 and closed under finite direct products, Γ-subgroups and Γ-quotients. For a Γ-group G, its pro-𝒞 completion is G^𝒞 = lim_M G/M over the closed normal Γ-subgroups M of G with G/M ∈ 𝒞̄ (LWZB (3.11)), with the canonical surjection η : G → G^𝒞; G is of level 𝒞 when η is an isomorphism. For ℓ ≥ 1, 𝒞_ℓ is the set of |Γ|′-Γ-groups of order at most ℓ. The construction is a functor from Γ-groups to Γ-groups of level 𝒞, left adjoint to the inclusion: every morphism from G to a Γ-group of level 𝒞 factors uniquely through η. It preserves surjections; ker η is the intersection of the M above; (G^𝒞)^𝒟 = G^𝒟 when 𝒟̄ ⊆ 𝒞̄; a finite Γ-group lies in 𝒞̄ iff it is of level 𝒞. 𝒞̄ need not be closed under extensions, so for most 𝒞 (groups of bounded order, groups of bounded p-class) this is not the pro-C completion of an extension-closed class.

**Hypotheses.** 𝒞 a set of finite Γ-groups; G a Γ-group.

**Construction or proof.**

1. The family of M with G/M ∈ 𝒞̄ is closed under finite intersections, because G/(M ∩ M′) embeds Γ-equivariantly in G/M × G/M′ and 𝒞̄ is closed under products and Γ-subgroups; so the inverse limit is over a directed system of finite Γ-quotients.
2. The limit of the finite discrete quotients is profinite with the induced Γ-action; η is surjective by compactness (an inverse limit of surjections of compact Hausdorff groups).
3. Universal property: a morphism f : G → L with L of level 𝒞 has, for each M_L with L/M_L ∈ 𝒞̄, preimage M = f⁻¹(M_L) with G/M ↪ L/M_L, hence G/M ∈ 𝒞̄; the compatible maps G/M → L/M_L assemble to G^𝒞 → L^𝒞 = L.
4. Surjections are preserved: for f : F → H surjective, the image of F^𝒞 → H^𝒞 is closed and dense (LWZB, the standard argument after (3.11)).
5. For 𝒞 the class of all finite p-Γ-groups (p ∤ |Γ|) the completion is the maximal pro-p quotient TauCeti.maximalProPQuotient with its induced action, because that class is closed under extensions as well.

**Uses.** LWZB (4.1): the fundamental sequence starts from (𝓕_n)^𝒞; LWZB Proposition 3.13: Property E is taken in the category of level-𝒞 Γ-groups; LWZB §3.2 and Definition 3.15: basic opens U_{𝒞,H} = {X : X^𝒞 ≅ H}; LWZB Lemma 5.10 and Theorem 5.12: induction over the levels 𝒞_ℓ, with H^{𝒞_{ℓ−1}} as the coarser datum; LWZB Theorems 7.4–7.5: 𝒞 = all p-Γ-groups, or those of p-class ≤ c.

**API.**

- `levelClosure` (data): 𝒞̄ as a predicate on finite Γ-groups up to isomorphism: the least predicate containing 𝒞 and closed under finite products, Γ-subgroups and Γ-quotients.
- `levelCompletion` (data): G^𝒞 together with the canonical continuous surjective Γ-homomorphism η_G : G → G^𝒞.
- `levelCompletion.lift` (universal-property): For f : G → L with L of level 𝒞, the unique morphism f̄ : G^𝒞 → L with f̄ ∘ η_G = f.
- `levelCompletion.lift_unique` (universal-property): Two morphisms G^𝒞 → L agreeing after η_G are equal.
- `levelCompletion.map` (functoriality): A morphism f : G → G′ induces f^𝒞 : G^𝒞 → G′^𝒞 with map_id and map_comp.
- `levelCompletion.map_surjective` (functoriality): If f is surjective so is f^𝒞.
- `levelCompletion.ker_eta` (characterisation): ker η_G is the intersection of the closed normal Γ-subgroups M with G/M ∈ 𝒞̄.
- `IsOfLevel` (data): G is of level 𝒞 iff η_G is an isomorphism; for finite G iff G ∈ 𝒞̄.
- `levelCompletion.completion_of_le` (compatibility): (G^𝒞)^𝒟 ≅ G^𝒟 when 𝒟̄ ⊆ 𝒞̄.
- `levelCompletion.finite_of_finite_class` (other): If 𝒞 is finite and G is topologically Γ-generated by finitely many elements, G^𝒞 is finite (finitely many Γ-maps to members of 𝒞, whose common kernel has finite index).
- `levelCompletion.eq_maximalProPQuotient` (compatibility): For 𝒞 the finite p-Γ-groups, G^𝒞 is TauCeti.maximalProPQuotient p G with the induced action.

**Unit tests.**

- `levelCompletion.test_Z2_elementary` (computation): Γ = 1, 𝒞 = {Z/2}: 𝒞̄ is the elementary abelian 2-groups and the completion of the free profinite group on two generators is (Z/2)².
- `levelCompletion.test_empty` (degenerate): 𝒞 = ∅ or 𝒞 = {1}: 𝒞̄ = {1} and G^𝒞 = 1 for every G.
- `levelCompletion.test_not_extension_closed` (non-example): Γ = 1, 𝒞 = {Z/2}: Z/4 is not of level 𝒞 (Z/4 ∉ 𝒞̄) and (Z/4)^𝒞 = Z/2, so this is not the completion with respect to an extension-closed class.
- `levelCompletion.test_maximal_pro_p` (compatibility): For 𝒞 the finite 3-Γ-groups and G = Ẑ_odd with σ = −1 (Γ = Z/2), G^𝒞 = Z_3 with σ = −1, the maximal pro-3 quotient.

**Acceptance.** Every Γ-group of level 𝒞 is pro-𝒞̄ and every finite member of 𝒞̄ is of level 𝒞. For 𝒞 ⊆ 𝒞_ℓ, U_{𝒞,H} is a union of the sets U_{𝒞_ℓ,H′} (used in RG.2).

**Depends on.** *Γ-groups and their equivariant maps* (RG.0/gamma-group); tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations; `TauCeti.maximalProPQuotient` (Tau Ceti); `ProfiniteGrp` (Mathlib).

**Source.** LWZB, §3.2, (3.11), p. 15: Defines 𝒞̄ as the closure under finite direct products, Γ-quotients and Γ-subgroups and the pro-𝒞 completion G^𝒞 as the inverse limit over closed normal Γ-subgroups with quotient in 𝒞̄; notes functoriality and preservation of surjections. LW20, §2.4, p. 5: The Γ = 1 version: the variety generated by S and the pro-S̄ completion; for profinite G in 𝒫, G is of level S iff G = G^S̄. LWZB, §5.2, p. 27, and §7.2.2, p. 36: Uses 𝒞_ℓ (groups of order ≤ ℓ, which must be |Γ|′-groups, source issue E4 here) and the p-Γ-groups of p-class ≤ c, two classes that are not extension-closed.

#### The free pro-|Γ|′ Γ-group F_n(Γ)

Declaration: ArithmeticStatisticsPartII:RG.1/free-gamma-group. Kind: construction. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/FreeAdmissible`, namespace `TauCeti.GammaGroup`.

For n ≥ 0, F_n(Γ) is the free pro-|Γ|′ group on the finite set {x_{i,γ} : 1 ≤ i ≤ n, γ ∈ Γ} (the free pro-C group for the extension-closed class C of finite groups of order prime to |Γ|), with σ ∈ Γ acting by the automorphism induced by the permutation x_{i,γ} ↦ x_{i,σγ} of the basis. Put x_i = x_{i,1}. Universal property: for every |Γ|′-Γ-group G and g_1, …, g_n ∈ G there is a unique morphism of Γ-groups F_n(Γ) → G with x_i ↦ g_i (then x_{i,γ} ↦ γ(g_i)). Its abelianization is (Ẑ′[Γ])^n with Ẑ′ = ∏_{p∤|Γ|} Z_p.

**Hypotheses.** n ≥ 0; Γ finite.

**Construction or proof.**

1. Take the free pro-C group of tauceti:TauCetiRoadmap/ProfiniteProPGroups Layer 4 for C the finite groups of order prime to |Γ|, a class closed under subgroups, quotients and extensions.
2. Functoriality of the free object in its basis gives an action of the symmetric group of {1..n} × Γ, which restricts to Γ acting on the second coordinate by left multiplication.
3. The equivariant universal property is the plain universal property applied to x_{i,γ} ↦ γ(g_i), whose equivariance is checked on the basis.
4. The abelianization is the free pro-|Γ|′ abelian group on the basis, i.e. (Ẑ′)^{n|Γ|} = Ẑ′[Γ]^n as a Γ-module.

**Uses.** LWZB §3.1: 𝓕_n is defined as a closed Γ-subgroup of F_n(Γ); LWZB Lemma 3.1: the retraction π : F_n → 𝓕_n is defined on the basis; LWZB Corollary 3.8: the bijection Y(G)^n ≅ Hom_Γ(𝓕_n, G) restricts maps out of F_n; LWZB §3.3: pro-p completions (F_n)_p and the extra generator x_{n+1} in the function-field case.

**API.**

- `freeGammaGroup` (data): F_n(Γ) as a Γ-group, with generators of i γ = x_{i,γ}.
- `freeGammaGroup.smul_of` (simp): σ • of i γ = of i (σ * γ).
- `freeGammaGroup.lift` (universal-property): For a |Γ|′-Γ-group G and g : Fin n → G, the unique morphism with of i 1 ↦ g i.
- `freeGammaGroup.lift_of` (simp): lift g (of i γ) = γ • g i.
- `freeGammaGroup.hom_ext` (extensionality): Two morphisms out of F_n(Γ) agreeing on the x_i are equal.
- `freeGammaGroup.abelianization` (compatibility): F_n(Γ)^ab ≅ Ẑ′[Γ]^n as Γ-modules.

**Unit tests.**

- `freeGammaGroup.test_zero` (degenerate): F_0(Γ) is the trivial group.
- `freeGammaGroup.test_trivial_Gamma` (compatibility): For Γ = 1, F_n(1) is the free profinite group on n generators of ProfiniteProPGroups Layer 4.
- `freeGammaGroup.test_hom_count` (computation): For finite |Γ|′-Γ-groups G, |Hom_Γ(F_n(Γ), G)| = |G|^n; for Γ = Z/2, G = Z/3 with inversion and n = 2 this is 9.
- `freeGammaGroup.test_not_admissible` (non-example): F_n(Γ) is not admissible for n ≥ 1, Γ ≠ 1: its abelianization Ẑ′[Γ]^n has invariants (Ẑ′)^n ≠ 0, so F_n(Γ) is not admissible: an admissible Γ-group has abelianization without non-zero invariants (the averaging argument of RG.0/admissible-gamma-groups (e)).

**Acceptance.** F_0(Γ) is trivial; for Γ = 1, F_n(1) is the free profinite group on n generators.

**Depends on.** tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets; *Γ-groups and their equivariant maps* (RG.0/gamma-group).

**Source.** LWZB, §3.1, p. 13: Defines F_n(Γ) as the free pro-|Γ|′ group on {x_{i,γ}} with σ(x_{i,γ}) = x_{i,σγ}. LWZB, Proof of Corollary 3.10, p. 15: Uses that F_n^ab is Ẑ′[Γ]^n, free over the pro-|Γ|′ completion of Z.

#### The free admissible Γ-group 𝓕_n (Lemma 3.1, Remark 3.2)

Declaration: ArithmeticStatisticsPartII:RG.1/free-admissible-gamma-group. Kind: construction. Planet: Free admissible Γ-group 𝓕_n. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/FreeAdmissible`, namespace `TauCeti.GammaGroup`.

𝓕_n = 𝓕_n(Γ) is the closed Γ-subgroup of F_n(Γ) generated by the elements x_i⁻¹γ_j(x_i) (1 ≤ i ≤ n, 1 ≤ j ≤ d). Under (SZ_Γ): (Lemma 3.1) 𝓕_n is admissible, and there is a surjective morphism of Γ-groups π : F_n(Γ) → 𝓕_n with π ∘ ι = id, where ι is the inclusion and π(x_i) = y_i for elements y_i ∈ 𝓕_n with Y(y_i) = Y(x_i); (Remark 3.2) as a pro-|Γ|′ group 𝓕_n is free on {x_i⁻¹σ(x_i) : 1 ≤ i ≤ n, σ ∈ Γ ∖ 1}, it is Γ-generated by n elements, and every pro-|Γ|′ Γ-group generated by elements h_i⁻¹γ(h_i) (1 ≤ i ≤ n, γ ∈ Γ) is a Γ-quotient of 𝓕_n. 𝓕_n does not depend on the generating tuple (Lemma 3.9).

**Hypotheses.** (SZ_Γ) for the retraction and for admissibility; n ≥ 1.

**Construction or proof.**

1. The x_i⁻¹γ(x_i) for all γ lie in 𝓕_n (RG.0/admissible-gamma-groups(b) expansion), so 𝓕_n contains every x_i⁻¹σ(x_i).
2. Freeness (Remark 3.2(1)): after the change of basis x_{i,σ} ↦ x_i⁻¹x_{i,σ} (σ ≠ 1) of F_n, the elements x_i⁻¹σ(x_i) are part of a basis, and the closed subgroup they generate is Γ-stable because σ(x_i⁻¹τ(x_i)) = (x_i⁻¹σ(x_i))⁻¹(x_i⁻¹στ(x_i)).
3. Lemma 3.1: by RG.0/sections-and-y(b) with G = F_n and E = 𝓕_n, Y(x_i) ∈ Y(F_n) ∩ 𝓕_n^d = Y(𝓕_n), so y_i exists; comparing coordinates shows that 𝓕_n is generated by the y_i⁻¹γ(y_i), i.e. admissible; π is the morphism x_i ↦ y_i, and π ∘ ι = id because both fix the generators x_i⁻¹γ_j(x_i) = y_i⁻¹γ_j(y_i).
4. Remark 3.2(3): x_i ↦ h_i defines F_n → H, whose restriction to 𝓕_n is onto because H is generated by the h_i⁻¹γ(h_i).

**Uses.** LWZB Corollary 3.8: maps out of 𝓕_n are classified by Y(G)^n; LWZB Proposition 3.13: Property E criterion for quotients of (𝓕_n)^𝒞; LWZB Definition 3.15: the random groups are quotients of 𝓕_n; LWZB §7.1: 𝓕_n^ab and its pro-p parts; LWZB Proposition 3.22: p-class tower groups as quotients of (𝓕_n)_p.

**API.**

- `freeAdmissible` (data): 𝓕_n as a closed Γ-subgroup of F_n(Γ), with its Γ-group structure.
- `freeAdmissible.isAdmissible` (structure): Under (SZ_Γ), 𝓕_n is admissible.
- `freeAdmissible.retraction` (projection): The Γ-quotient map π : F_n(Γ) → 𝓕_n with π ∘ ι = id.
- `freeAdmissible.yMap_retraction` (simp): Y(π(x_i)) = Y(x_i).
- `freeAdmissible.isFree` (characterisation): As a pro-|Γ|′ group, 𝓕_n is free on {x_i⁻¹σ(x_i) : σ ≠ 1}, of rank n(|Γ| − 1).
- `freeAdmissible.surjects` (universal-property): A pro-|Γ|′ Γ-group generated by the h_i⁻¹γ(h_i) (i ≤ n) is a Γ-quotient of 𝓕_n via x_i ↦ h_i.
- `freeAdmissible.indep_generators` (other): Two generating tuples of Γ give the same closed subgroup 𝓕_n of F_n(Γ).

**Unit tests.**

- `freeAdmissible.test_Z2_rank_one` (computation): Γ = Z/2: 𝓕_1 ≅ Ẑ_odd with σ acting by −1; its maximal pro-3 quotient is Z_3 with σ = −1.
- `freeAdmissible.test_rank` (compatibility): The abelianization of 𝓕_n has Ẑ′-rank n(|Γ| − 1), matching Remark 3.2(1) and Corollary 3.10.
- `freeAdmissible.test_trivial_Gamma` (degenerate): For Γ = 1, 𝓕_n is trivial (generated by x_i⁻¹x_i = 1).
- `freeAdmissible.test_not_F` (non-example): For Γ = Z/2 and n = 1, F_1 has abelianization of Z_3-rank 2 at p = 3 while 𝓕_1 has rank 1, so x_1 ∉ 𝓕_1.

**Acceptance.** For Γ = Z/2 = ⟨σ⟩, 𝓕_1 is procyclic on y = x⁻¹σ(x) with σ(y) = y⁻¹, so 𝓕_1 ≅ Ẑ_odd with σ = −1. 𝓕_n is never F_n for Γ ≠ 1 and n ≥ 1: x_1 ∉ 𝓕_n.

**Depends on.** *The free pro-|Γ|′ Γ-group F_n(Γ)* (RG.1/free-gamma-group); *Sections of G ⋊ Γ and the fibres of Y (Lemmas 3.4–3.6)* (RG.0/sections-and-y); *Admissible Γ-groups: closure properties and the abelian criterion* (RG.0/admissible-gamma-groups); *The coprime conjugacy hypothesis (SZ)* (RG.0/coprime-conjugacy-hypothesis).

**Source.** LWZB, §3.1, Lemma 3.1, Remark 3.2, p. 13, and proof of Lemma 3.1, p. 14: Defines 𝓕_n as the closed Γ-subgroup generated by the x_i⁻¹γ_j(x_i), proves it admissible with a Γ-retraction π from F_n, and records that it is free pro-|Γ|′ on the x_i⁻¹σ(x_i), Γ-generated by n elements, and maps onto every pro-|Γ|′ Γ-group generated by n elements' Y-coordinates (the text omits pro-|Γ|′, source issue E1 here).

#### Homomorphisms out of 𝓕_n (Corollary 3.8, Corollary 3.10, finiteness)

Declaration: ArithmeticStatisticsPartII:RG.1/free-admissible-universal-property. Kind: theorem. Planet: Universal property of 𝓕_n. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/FreeAdmissible`, namespace `TauCeti.GammaGroup`.

Assume (SZ_Γ). (a) (Corollary 3.8) For every pro-|Γ|′ Γ-group G, the map Y(G)^n → Hom_Γ(𝓕_n, G) sending (Y(g_1), …, Y(g_n)) to the restriction to 𝓕_n of the morphism F_n → G with x_i ↦ g_i is well defined and bijective. (b) Consequently |Hom_Γ(𝓕_n, H)| = [H : H^Γ]^n for finite |Γ|′-Γ-groups H, and for finite admissible H, |Sur_Γ(𝓕_n, H)|·[H : H^Γ]^{−n} ≤ 1 and → 1 as n → ∞ (LWZB (4.18)). (c) For a set 𝒞 of finite |Γ|′-Γ-groups and finite H of level 𝒞, morphisms (𝓕_n)^𝒞 → H correspond to morphisms 𝓕_n → H, hence to Y(H)^n. (d) (Corollary 3.10) 𝓕_n^ab ≅ (Ẑ′[Γ]/(Σ_{g∈Γ} g))^n as Γ-modules, with Ẑ′ = ∏_{p∤|Γ|} Z_p, and (𝓕_n^ab)^Γ = 0. (e) For finite 𝒞, (𝓕_n)^𝒞 is finite.

**Hypotheses.** (SZ_Γ); G pro-|Γ|′ in (a) — the statement fails for Γ = Z/2 acting on Z/4 by inversion.

**Construction or proof.**

1. (a) Injectivity: two maps x_i ↦ g_i, g_i′ agree on 𝓕_n iff they agree on the generators x_i⁻¹γ_j(x_i), i.e. iff Y(g_i) = Y(g_i′). Surjectivity: extend a morphism 𝓕_n → G along the retraction π of RG.1/free-admissible-gamma-group.
2. (b) RG.0/y-map gives |Y(H)| = [H : H^Γ]; non-surjective morphisms land in proper Γ-subgroups H′, each with |Y(H′)| < |Y(H)| by RG.0/admissible-gamma-groups(d), so their number is at most Σ_{H′} |Y(H′)|^n = o(|Y(H)|^n).
3. (c) Universal property of the level-𝒞 completion (RG.1/level-completion).
4. (d) 𝓕_n^ab injects into F_n^ab = Ẑ′[Γ]^n (if [x, y] ∈ F_n with x, y ∈ 𝓕_n then [x, y] = π([x, y]) ∈ [𝓕_n, 𝓕_n]) with image I^n, I the augmentation ideal; |Γ| is invertible in Ẑ′ so Ẑ′[Γ] = I ⊕ Ẑ′·Σg and I ≅ Ẑ′[Γ]/(Σg); I^Γ = 0 because |Γ|⁻¹Σg acts as 0 on I.
5. (e) The intersection W of the kernels of the finitely many Γ-maps from 𝓕_n to members of 𝒞 has finite index and is killed by all maps to 𝒞̄ (lift maps to quotients by π), so (𝓕_n)^𝒞 = 𝓕_n/W.

**Acceptance.** Γ = Z/2, H = Z/3 with inversion: |Hom_Γ(𝓕_n, Z/3)| = 3^n and |Sur_Γ(𝓕_n, Z/3)| = 3^n − 1. Γ = Z/2, G = Z/4 with inversion: |Y(Z/4)| = 2 but Hom_Γ(𝓕_1, Z/4) = {1} since 𝓕_1 is pro-odd, so (a) needs G pro-|Γ|′.

**Depends on.** *The free admissible Γ-group 𝓕_n (Lemma 3.1, Remark 3.2)* (RG.1/free-admissible-gamma-group); *Level-𝒞 closure and the pro-𝒞 completion of a Γ-group* (RG.1/level-completion); *The map Y* (RG.0/y-map); *Admissible Γ-groups: closure properties and the abelian criterion* (RG.0/admissible-gamma-groups).

**Source.** LWZB, Corollary 3.8, Lemma 3.9 and Corollary 3.10, pp. 14–15: Corollary 3.8 identifies Y(G)^n with Hom_Γ(𝓕_n, G) (stated for every Γ-group G, which needs pro-|Γ|′, source issue E1); Corollary 3.10 computes 𝓕_n^ab = (Ẑ[Γ]/(Σg))^n with trivial invariants. LWZB, Paragraph before Definition 3.15, pp. 16–17: Proves (𝓕_n)^𝒞 finite for finite 𝒞 by the finite-index intersection of kernels. LWZB, (4.18) in the proof of Theorem 4.12, p. 25: Proves |Sur_Γ(𝓕_n, H)||Y(H)|^{−n} → 1 for finite admissible H by bounding the non-surjective maps through proper Γ-subgroups.

#### Property E relative to a level: restriction and completion

Declaration: ArithmeticStatisticsPartII:RG.1/property-e-at-level. Kind: theorem. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/PropertyE`, namespace `TauCeti.GammaGroup`.

Property E is taken in the general form of LWZB Definition 2.3: for a full subcategory 𝒦 of Γ-groups, H ∈ 𝒦 has Property E for 𝒦 if every Γ-surjection H → G lifts to a Γ-surjection H → G̃ along every non-split central extension 1 → Z/p → G̃ → G → 1 in 𝒦 with trivial Γ-action on Z/p (InverseGaloisAndArithmeticFundamentalGroups:IG.4/property-e, which states it for 𝒦 the pro-Δ′ Γ-groups). For a set 𝒞 of finite |Γ|′-Γ-groups, 'Property E at level 𝒞' means Property E for the Γ-groups of level 𝒞. Then: (a) if 𝒦′ ⊆ 𝒦 are full subcategories and H ∈ 𝒦′ has Property E for 𝒦, it has Property E for 𝒦′; (b) if a Γ-group X has Property E for a full subcategory containing all Γ-groups of level 𝒞 and X itself, then X^𝒞 has Property E at level 𝒞; (c) for p ∤ |Γ| and X with Property E for the pro-p Γ-groups, X^𝒞 has Property E at level 𝒞 for every set 𝒞 of finite p-Γ-groups; (d) for finite H it suffices to test extensions G̃ of finite Γ-groups G that are Γ-quotients of H, and every lift H → G̃ of a surjection whose composite with G̃ → G is onto is itself onto (a weak lift is proper).

**Hypotheses.** Full subcategories closed under isomorphism; extensions tested inside the subcategory.

**Construction or proof.**

1. (a) Fewer extensions are tested in 𝒦′.
2. (b) Given a Γ-surjection X^𝒞 → G and a non-split central G̃ → G of level 𝒞, compose with η : X → X^𝒞, lift to X → G̃ by Property E of X, and factor through X^𝒞 because G̃ is of level 𝒞 (RG.1/level-completion).
3. (c) The level-𝒞 groups for a set of p-Γ-groups are pro-p, so (b) applies with the pro-p subcategory.
4. (d) A lift H → G̃ whose image maps onto G either is onto or has image meeting Z/p trivially, which would split the extension over G.

**Acceptance.** Γ = Z/2, p = 3, H = F_3² with σ = −1 lacks Property E at the level of 3-Γ-groups of 3-class ≤ 2: the Heisenberg group of order 27 with σ acting by −1 on generators (hence trivially on the centre) is a non-split central extension, and |H| = 9 < 27. Γ = Z/3, H = (Z/2)² with a nontrivial Z/3-action is admissible but lacks Property E for any level containing Q_8 with its compatible Z/3-action, since |H| = 4 < 8.

**Depends on.** InverseGaloisAndArithmeticFundamentalGroups:IG.4/property-e; *Level-𝒞 closure and the pro-𝒞 completion of a Γ-group* (RG.1/level-completion); *Γ-groups and their equivariant maps* (RG.0/gamma-group).

**Source.** LWZB, Definition 2.3 and (2.4), p. 11: Defines Property E for an arbitrary full subcategory of Γ-groups by lifting Γ-surjections along non-split central extensions by Z/p with trivial Γ-action. LWZB, §3.2, p. 15, first example: Gives (Z/2)² with Z/3-action and Q_8 as an admissible quotient of 𝓕_n without Property E. LWZB, Proof of Proposition 3.22, p. 19: Uses Property E of G_{K,p} in the category of pro-p Γ-groups, deduced from Theorem 2.5.

#### Property E as the shape of the relations (Proposition 3.13)

Declaration: ArithmeticStatisticsPartII:RG.1/property-e-criterion. Kind: theorem. Planet: Property E criterion (Proposition 3.13). Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/PropertyE`, namespace `TauCeti.GammaGroup`.

Assume (SZ_Γ). Let n ≥ 1, 𝒞 a set of finite |Γ|′-Γ-groups and φ : (𝓕_n)^𝒞 → H a Γ-surjection. Then ker φ = [Y(ker φ)] (the closed normal Γ-subgroup of (𝓕_n)^𝒞 generated by the coordinates of Y(ker φ)) iff H has Property E at level 𝒞. In particular, for every S ⊆ 𝓕_n the group (𝓕_n)^𝒞/[Y(S)] — and so every (X_{u,n})^𝒞 of RG.2 — has Property E at level 𝒞.

**Hypotheses.** (SZ_Γ); 𝒞 consists of |Γ|′-groups so that RG.0/sections-and-y applies to the kernels.

**Construction or proof.**

1. (⇒) Let θ : H → G be a Γ-surjection with a non-split central extension G̃ → G of level 𝒞, and ϖ = θ ∘ φ. Choose g̃_i ∈ G̃ over ϖ(π(x_i)); non-splitness makes G̃ Γ-generated by the g̃_i⁻¹γ_j(g̃_i), giving a surjection ρ : (𝓕_n)^𝒞 → G̃ over ϖ.
2. From 1 → ker ρ → ker ϖ → Z/p → 1 with |Y(Z/p)| = 1 (trivial action) and Lemma 3.4: Y(ker φ) ⊆ Y((𝓕_n)^𝒞) ∩ (ker ϖ)^d = Y(ker ϖ) = Y(ker ρ) ⊆ (ker ρ)^d; so ρ factors through (𝓕_n)^𝒞/[Y(ker φ)] = H. (The printed proof applies the finite-group Lemma 3.6(2) to the possibly infinite ker ϖ; the containment argument via Lemma 3.4 avoids it, source issue E3 here.)
3. (⇐) If [Y(ker φ)] ⊊ ker φ, put M = ker φ/[Y(ker φ)] and E = (𝓕_n)^𝒞/[Y(ker φ)]. Γ acts trivially on M, E is admissible, so E centralizes M (RG.0/admissible-gamma-groups(c)).
4. A maximal proper subgroup D of M gives 1 → N → H̃ → H → 1 with N = M/D simple, central, hence Z/p with trivial action; it is split only if H̃ = N × H, contradicting admissibility of H̃, and non-split contradicts Property E of H.

**Acceptance.** For Γ = Z/3 and H = (Z/2)² with nontrivial action, the kernel of any surjection (𝓕_1)^𝒞 → H, 𝒞 ∋ Q_8, is not generated by Y-relations, matching the failure of Property E. For abelian 𝒞 and H with H^Γ = 1 every Γ-quotient has Property E at level 𝒞 (no non-split central extensions of level 𝒞 exist by abelianness), consistent with §7.1.

**Depends on.** *Property E relative to a level: restriction and completion* (RG.1/property-e-at-level); *Homomorphisms out of 𝓕_n (Corollary 3.8, Corollary 3.10, finiteness)* (RG.1/free-admissible-universal-property); *Sections of G ⋊ Γ and the fibres of Y (Lemmas 3.4–3.6)* (RG.0/sections-and-y); *Admissible Γ-groups: closure properties and the abelian criterion* (RG.0/admissible-gamma-groups); InverseGaloisAndArithmeticFundamentalGroups:IG.4/property-e.

**Source.** LWZB, Lemma 3.12 and Proposition 3.13 with proof, pp. 15–16: Proves that the kernel of a Γ-quotient of (𝓕_n)^𝒞 is generated by its Y-image exactly when the quotient has Property E for level-𝒞 groups, via lifting generators along a non-split central extension and, conversely, a maximal subgroup of the trivial-action quotient kernel.

### RG.2. The space of admissible Γ-groups and the random groups X_{u,n}

**Targets.**
- *The space 𝒫 (§3.2).* Isomorphism classes of admissible |Γ|′-Γ-groups all of whose level-𝒞 completions (𝒞 finite) are finite, with basic opens U_{𝒞,H} = {X : X^𝒞 ≅ H}; for each ℓ the U_{𝒞_ℓ,H} partition 𝒫 and refine every basic open; every open set is a countable disjoint union of basic opens; the level-tower map X ↦ ([X^{𝒞_ℓ}])_ℓ is injective and identifies 𝒫 with a subspace of a countable product of countable discrete sets; the algebra 𝒜 generated by basic opens, the Borel σ-algebra, and the sets V_{𝒞,H} for arbitrary 𝒞.
- *Random groups (Definition 3.15).* For n ≥ 1 and an integer u > −n, X_{u,n} = 𝓕_n/[Y(S)] with S a tuple of n + u independent Haar-random elements (`TauCeti.haarProb`); its law μ_{u,n} on 𝒫; the event {X^𝒞 ≅ H} depends only on the image of S in the finite group (𝓕_n)^𝒞, where Haar measure pushes forward to the uniform measure; every (X_{u,n})^𝒞 has Property E at level 𝒞.

**Acceptance.** For Γ = 1 the space 𝒫 is a single point; for Γ = Z/2, n = 1, u = 0, X_{0,1} ≅ Ẑ_odd/rẐ_odd and the probability that 3 does not divide its order is 2/3.

Layer dependencies: ArithmeticStatisticsPartII:RG.1.

#### The space 𝒫 of admissible Γ-groups

Declaration: ArithmeticStatisticsPartII:RG.2/space-of-admissible-gamma-groups. Kind: construction. Planet: Space 𝒫 of admissible Γ-groups. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Space`, namespace `TauCeti.GammaGroupSpace`.

𝒫 = 𝒫_Γ is the set of isomorphism classes of admissible |Γ|′-Γ-groups X such that X^𝒞 is finite for every finite set 𝒞 of finite |Γ|′-Γ-groups. For such 𝒞 and a finite |Γ|′-Γ-group H, the basic open set is U_{𝒞,H} = {X ∈ 𝒫 : X^𝒞 ≅ H}; 𝒫 carries the topology generated by these sets, its Borel σ-algebra, the algebra 𝒜 of sets generated by the basic opens, and, for an arbitrary set 𝒞, the sets V_{𝒞,H} = {X : X^𝒞 ≅ H}. Facts: U_{𝒞,H} = ∅ unless H is of level 𝒞; for each ℓ, the sets U_{𝒞_ℓ,H} (H of level 𝒞_ℓ) are pairwise disjoint and cover 𝒫, and each U_{𝒞,H} with 𝒞 ⊆ 𝒞_ℓ is a union of them; the level-tower map X ↦ ([X^{𝒞_ℓ}])_{ℓ≥1} is injective, so 𝒫 is a set and its topology is the subspace topology from a countable product of countable discrete sets — in particular second countable and Hausdorff, every open set is a countable disjoint union of basic opens, and V_{𝒞,H} = ⋂_i U_{𝒟_i,H} for any exhaustion 𝒟_1 ⊆ 𝒟_2 ⊆ ⋯ of 𝒞 by finite sets with H of level 𝒟_i.

**Hypotheses.** Γ finite; isomorphism classes of finite Γ-groups of bounded order form a finite set.

**Construction or proof.**

1. Each X ∈ 𝒫 is the inverse limit of its completions X^{𝒞_ℓ}, since every open normal subgroup contains an open normal Γ-stable one (intersect the finitely many Γ-translates) and so every finite Γ-quotient of X has level 𝒞_ℓ for some ℓ.
2. Injectivity of the tower map: if X^{𝒞_ℓ} ≅ X′^{𝒞_ℓ} for all ℓ, the sets of isomorphisms at level ℓ are finite, non-empty and form an inverse system under the completion maps (RG.1/level-completion), so a compatible system of isomorphisms exists and X ≅ X′.
3. For 𝒞 ⊆ 𝒞_ℓ, X^𝒞 = (X^{𝒞_ℓ})^𝒞, so U_{𝒞,H} is the union of U_{𝒞_ℓ,H′} over the level-𝒞_ℓ classes H′ with H′^𝒞 ≅ H; the level-ℓ sets are disjoint because X^{𝒞_ℓ} has one class.
4. Countability: there are countably many pairs (𝒞, H) up to isomorphism; an open set is the union of the level sets it contains, and refining to a common level gives a countable disjoint union.

**Uses.** LWZB Definition 3.15: μ_{u,n} is a Borel probability measure on 𝒫; LWZB (3.16) and Theorem 5.12: μ_u is first defined on 𝒜 and then extended; LWZB §5.3: weak convergence is tested on open sets, each a disjoint union of basic opens; LWZB Theorem 5.15: values of μ_u on V_{𝒞,H}.

**API.**

- `GammaGroupSpace` (data): 𝒫 as a type, realized as the image of the level-tower map in ∏_ℓ (finite Γ-groups of level 𝒞_ℓ up to isomorphism).
- `GammaGroupSpace.basicOpen` (data): U_{𝒞,H} for a finite set 𝒞 and a finite Γ-group H.
- `GammaGroupSpace.isOpen_basicOpen` (structure): Each U_{𝒞,H} is open and closed.
- `GammaGroupSpace.basicOpen_eq_empty` (simp): U_{𝒞,H} = ∅ unless H is of level 𝒞.
- `GammaGroupSpace.levelPartition` (characterisation): For each ℓ the sets U_{𝒞_ℓ,H} over level-𝒞_ℓ classes H partition 𝒫.
- `GammaGroupSpace.basicOpen_eq_iUnion` (relation): For 𝒞 ⊆ 𝒞_ℓ, U_{𝒞,H} = ⋃_{H′ : H′^𝒞 ≅ H} U_{𝒞_ℓ,H′}.
- `GammaGroupSpace.tower_injective` (extensionality): Two points of 𝒫 with isomorphic completions at every level 𝒞_ℓ are equal.
- `GammaGroupSpace.secondCountable` (instance): 𝒫 is second countable and Hausdorff; its Borel σ-algebra is generated by the basic opens.
- `GammaGroupSpace.isOpen_eq_iUnion_basicOpen` (characterisation): Every open set is a countable disjoint union of basic opens.
- `GammaGroupSpace.vSet` (data): V_{𝒞,H} for arbitrary 𝒞, equal to ⋂_i U_{𝒟_i,H} for an exhaustion by finite sets.

**Unit tests.**

- `GammaGroupSpace.test_trivial_Gamma` (degenerate): For Γ = 1, 𝒫 has exactly one point.
- `GammaGroupSpace.test_trivial_point` (computation): For any Γ, V_{all,1} = {[1]} and U_{{1},1} = 𝒫.
- `GammaGroupSpace.test_empty_basic` (non-example): U_{𝒞,H} = ∅ when H is not of level 𝒞: for Γ = Z/2, 𝒞 = {Z/3 with σ = −1} and H = Z/9 with σ = −1 no X has X^𝒞 ≅ H, every level-𝒞 group being elementary abelian of exponent 3.
- `GammaGroupSpace.test_level_partition` (compatibility): For Γ = Z/2 and 𝒞 the abelian 3-Γ-groups, the non-empty V_{𝒞,H} with H finite are indexed by the finite abelian 3-groups with σ = −1, the index set of ArithmeticStatistics:ST.5/cohen-lenstra-measure; their union is the set of X with finite abelian 3-completion.

**Acceptance.** For Γ = 1 an admissible group is generated by elements g⁻¹g = 1, so 𝒫 is a single point. The trivial class lies in U_{𝒞_ℓ,1} for every ℓ and {[1]} = ⋂_ℓ U_{𝒞_ℓ,1} = V_{all,1}.

**Depends on.** *Level-𝒞 closure and the pro-𝒞 completion of a Γ-group* (RG.1/level-completion); *Admissible Γ-groups: closure properties and the abelian criterion* (RG.0/admissible-gamma-groups); `MeasureTheory.Measure.map` (Mathlib); `MeasureTheory.ProbabilityMeasure` (Mathlib).

**Source.** LWZB, §3.2, p. 16: Defines 𝒫 as the isomorphism classes of admissible |Γ|′-Γ-groups whose level-𝒞 completions are finite for finite 𝒞, topologized by the basic opens U_{𝒞,H}. LWZB, §5.3, p. 30, and §5.4, p. 31: Uses that every open set is a disjoint union of basic opens and that V_{𝒞,H} for infinite 𝒞 is an intersection of a sequence of basic opens. LW20, §1, p. 1, and §3, p. 5: The Γ = 1 model: the space P of profinite groups with finite pro-S̄ completions, with basic opens U_{S,H}, and the algebra 𝒜 they generate.

#### Random Γ-groups X_{u,n} and their laws μ_{u,n} (Definition 3.15)

Declaration: ArithmeticStatisticsPartII:RG.2/random-gamma-groups. Kind: construction. Planet: Random Γ-groups X_{u,n}. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/RandomGroup`, namespace `TauCeti.RandomGammaGroup`.

For n ≥ 1 and an integer u > −n, let S = (s_1, …, s_{n+u}) be distributed by the product of n + u copies of the Haar probability measure of the compact group 𝓕_n (TauCeti.haarProb), and put X_{u,n} = 𝓕_n/[Y(S)] (u = 1 by default: X_{Γ,n} = X_{1,n}). Its law μ_{u,n} is the Borel probability measure on 𝒫 with μ_{u,n}(A) = Prob([X_{u,n}] ∈ A). For finite 𝒞, (X_{u,n})^𝒞 ≅ (𝓕_n)^𝒞/[Y(S̄)] with S̄ the image of S in the finite group (𝓕_n)^𝒞, and the image of Haar measure is the uniform measure; so μ_{u,n}(U_{𝒞,H}) = Prob((𝓕_n)^𝒞/[Y(r_1, …, r_{n+u})] ≅ H) for independent uniform r_j ∈ (𝓕_n)^𝒞. Every (X_{u,n})^𝒞 has Property E at level 𝒞. The measures μ_u on 𝒜 are the limits μ_u(A) = lim_n μ_{u,n}(A), whose existence is RG.3 and whose extension is RG.4.

**Hypotheses.** (SZ_Γ) (through RG.1); n ≥ 1, u > −n.

**Construction or proof.**

1. X_{u,n} is admissible (a Γ-quotient of 𝓕_n) and its level-𝒞 completions are quotients of the finite (𝓕_n)^𝒞, so [X_{u,n}] ∈ 𝒫.
2. Completion commutes with the quotient: (𝓕_n/[Y(S)])^𝒞 = (𝓕_n)^𝒞/[Y(S̄)] by the universal property, since a map to a level-𝒞 group killing Y(S) factors through (𝓕_n)^𝒞.
3. The pushforward of Haar probability along a continuous surjection onto a finite group is uniform (invariance plus uniqueness, TauCeti.haarProb_eq_uniformOn_univ and Mathlib's uniqueness of Haar probability measures).
4. Measurability: each event {X^𝒞 ≅ H} is a union of fibres of S ↦ S̄, hence clopen in 𝓕_n^{n+u}; the basic opens generate the Borel σ-algebra (RG.2/space-of-admissible-gamma-groups), so S ↦ [X_{u,n}] is measurable.
5. Property E: RG.1/property-e-criterion applied to (𝓕_n)^𝒞 → (𝓕_n)^𝒞/[Y(S̄)].

**Uses.** LWZB Theorem 4.12: μ_{u,n}(U_{𝒞,H}) is computed exactly; LWZB Theorem 1.2: μ_{1,n} converges weakly to μ_Γ; LWZB Lemma 6.1: the moments E|Sur_Γ(X_{u,n}, A)| are computed from (4.16); LWZB Proposition 3.22: p-class tower groups have the form (𝓕_n)_p/[Y(S)], i.e. lie in the support of these laws.

**API.**

- `RandomGammaGroup.relations` (data): The random tuple S, with law the (n + u)-fold product of TauCeti.haarProb on 𝓕_n.
- `RandomGammaGroup.quotient` (data): X_{u,n} = 𝓕_n/[Y(S)] as a Γ-group-valued random variable, and its class in 𝒫.
- `RandomGammaGroup.law` (data): μ_{u,n} as a probability measure on 𝒫 (Mathlib's Measure.map along the class map).
- `RandomGammaGroup.measurable_class` (structure): The class map 𝓕_n^{n+u} → 𝒫 is measurable.
- `RandomGammaGroup.completion_quotient` (compatibility): (𝓕_n/[Y(S)])^𝒞 ≅ (𝓕_n)^𝒞/[Y(S̄)] for finite 𝒞.
- `RandomGammaGroup.law_basicOpen` (characterisation): μ_{u,n}(U_{𝒞,H}) equals the probability for n + u independent uniform elements of (𝓕_n)^𝒞.
- `RandomGammaGroup.map_haarProb_uniform` (compatibility): The image of TauCeti.haarProb under a continuous surjection onto a finite group is the uniform measure ProbabilityTheory.uniformOn univ.
- `RandomGammaGroup.propertyE_completion` (other): Almost surely, every (X_{u,n})^𝒞 has Property E at level 𝒞.

**Unit tests.**

- `RandomGammaGroup.test_Z2_n1` (computation): Γ = Z/2, n = 1, u = 0: X_{0,1} ≅ Ẑ_odd/rẐ_odd and μ_{0,1}(U_{𝒞,1}) = 2/3 for 𝒞 = {Z/3 with σ = −1}.
- `RandomGammaGroup.test_min_relations` (degenerate): u = 1 − n (one relation): μ_{1−n,n}-almost surely the quotient is 𝓕_n/[Y(s)], Γ-generated by n elements with one relation; for n = 1, Γ = Z/2 it is Ẑ_odd/sẐ_odd.
- `RandomGammaGroup.test_support` (non-example): Γ = Z/3, H = (Z/2)² with nontrivial action: μ_{u,n}(U_{𝒞,H}) = 0 for every 𝒞 containing Q_8 with its compatible Z/3-action, although H is an admissible quotient of 𝓕_1.
- `RandomGammaGroup.test_uniform_pushforward` (compatibility): For finite 𝒞, the image law of S̄ is the uniform measure on ((𝓕_n)^𝒞)^{n+u}.

**Acceptance.** Γ = Z/2, n = 1, u = 0: 𝓕_1 ≅ Ẑ_odd with σ = −1 and Y(r) = −2r, so X_{0,1} ≅ Ẑ_odd/rẐ_odd and Prob(3 ∤ |X_{0,1}|) = Prob(r ∈ Z_3^×) = 2/3.

**Depends on.** *The free admissible Γ-group 𝓕_n (Lemma 3.1, Remark 3.2)* (RG.1/free-admissible-gamma-group); *Homomorphisms out of 𝓕_n (Corollary 3.8, Corollary 3.10, finiteness)* (RG.1/free-admissible-universal-property); *Property E as the shape of the relations (Proposition 3.13)* (RG.1/property-e-criterion); *The space 𝒫 of admissible Γ-groups* (RG.2/space-of-admissible-gamma-groups); `TauCeti.haarProb` (Tau Ceti); `TauCeti.haarProb_eq_uniformOn_univ` (Tau Ceti); `MeasureTheory.Measure.isHaarMeasure_eq_of_isProbabilityMeasure` (Mathlib); `MeasureTheory.Measure.map` (Mathlib).

**Source.** LWZB, Definition 3.15 and (3.16), p. 17: Defines X_{Γ,n,u} = 𝓕_n/[Y(S)] for n + u independent Haar-random elements, the laws μ_{u,n} on Borel sets of 𝒫, and μ_u on the algebra of basic opens as the limit in n. LW20, §4, p. 6: In the Γ = 1 model, (X_{u,n})^S̄ has the law of a quotient of the finite group (F̂_n)^S̄ by n + u uniform relations.

### RG.3. The finite-level distribution

**Targets.**
- *Products of irreducible operator groups (Liu–Wood §§5–7).* For a group F and pairwise non-isomorphic finite irreducible F-groups G_i: normal F-subgroups of ∏ G_i^{m_i} are products, the generation criterion, the probability that n + u uniform elements normally F-generate the product, |Sur_F(∏ G_i^{m_i}, G_j)|, the structure of N/M for M the intersection of the maximal proper G-normal subgroups of N, and the bound m ≤ |H| on the power of a simple group in an irreducible kernel.
- *The fundamental short exact sequence (4.1)–(4.2)* 1 → R → F → H → 1 attached to (𝒞, n, ϖ), the sets 𝒜_H (abelian irreducible |Γ|′-(H ⋊ Γ)-groups, including Z/p with trivial action) and 𝒩 (powers of non-abelian simple groups), and the multiplicities m(𝒞, n, H, G).
- *Generation by Y-relations (Proposition 4.3, Remark 4.4).*
- *H-extensions and the Möbius function of the poset of sub-H-extensions (§4, corrected recursion)*; counting maps (Lemma 4.6); multiplicities through extensions (Proposition 4.7, Corollary 4.8, Remark 4.9).
- *The λ-invariants (4.10)–(4.11)*, their finite support and their relation (4.17) to the multiplicities; the tail-product limit (Liu–Wood Lemma 8.11).
- *Theorem 4.12*: the exact finite-n formula (4.13) for Prob((X_{u,n})^𝒞 ≅ H) and, when H has Property E at level 𝒞, its limit (4.14); the probability is 0 for every n when Property E fails.

**Acceptance.** For H = 1 and 𝒞 = {Z/3 with σ = −1}, (4.13) is ∏_{k<n}(1 − 3^{k−n−u}) and (4.14) is ∏_{i>u}(1 − 3^{−i}); for Γ = Z/2, p = 3, 𝒞 the 3-Γ-groups of 3-class ≤ 2 and H = F_3² with σ = −1 the probability is 0 for every n.

Layer dependencies: ArithmeticStatisticsPartII:RG.2.

#### Products of irreducible F-groups (Liu–Wood §§5–7)

Declaration: ArithmeticStatisticsPartII:RG.3/products-of-irreducible-operator-groups. Kind: theorem. Planet: Products of irreducible F-groups. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/IrreducibleProducts`, namespace `TauCeti.GammaGroup`.

Let F be a group and G_1, …, G_k pairwise non-isomorphic finite irreducible F-groups, R = ∏ G_i^{m_i}. (a) (Liu–Wood Lemmas 5.3–5.5, Corollary 5.6) every normal F-subgroup of R is ∏ N_i with N_i a normal F-subgroup of G_i^{m_i}, and it is R iff each projection to G_i^{m_i} is onto. (b) (Lemma 5.8) for G non-abelian, a normal F-subgroup of G^m is G^m iff all m projections to G are non-trivial; for G abelian, iff its projection to the first m − 1 factors is onto and its projection to the last factor does not factor through that projection. (c) (Theorem 5.1) for N ≥ 1 independent uniform x_1, …, x_N ∈ R, Prob([x_1, …, x_N]_F = R) = ∏_{G_i abelian} ∏_{j=0}^{m_i−1}(1 − h_F(G_i)^j |G_i|^{−N}) ∏_{G_i non-abelian}(1 − |G_i|^{−N})^{m_i}. (d) (Theorem 7.1) |Sur_F(R, G_j)| = h_F(G_j)^{m_j} − 1 for G_j abelian and m_j·|Aut_F(G_j)| for G_j non-abelian. (e) (Lemma 5.11) for a finite group G, N ⊴ G and M the intersection of the maximal proper G-normal subgroups of N, N/M is, under conjugation, a product of irreducible G/M-groups, and its abelian factors are G/N-groups. (f) (Lemma 6.1) if (E, π) is an extension of a finite group H whose kernel G is a finite irreducible E-group, then G ≅ T^m for a finite simple group T and m ≤ |H|. (g) (Remark 5.2) for abelian irreducible G and m maximal such that G^m is F-generated by one element, h_F(G)^m = |G|.

**Hypotheses.** F an arbitrary group acting by automorphisms; the G_i finite.

**Construction or proof.**

1. (a) A normal F-subgroup projecting to 1 or G_i in each coordinate is isomorphic to the product of a subset of the factors (Liu–Wood Lemma 5.3, induction on the number of factors); F-maps between non-isomorphic irreducibles with normal image are trivial (Lemma 5.4), which separates the isotypic parts (Lemma 5.5).
2. (b) Induction on m: πm(ker π) is 1 or G; if it were 1 then π would be injective on N and πm would factor through π, impossible for non-abelian G by a conjugation argument (Liu–Wood Lemma 5.8).
3. (c) Independence across isotypic parts (Corollary 5.7); for G^m condition on the first k projections: a bad choice of the (k+1)-st coordinates is one given by an F-map G^k → G, and there are h_F(G)^k of them (Corollaries 5.9–5.10).
4. (d) Restrict surjections to the factors and use (a) and Lemma 5.4 (Liu–Wood Lemmas 7.2–7.3).
5. (e) The maximal proper G-normal subgroups M_i of N give an embedding N/M ↪ ∏ (N/M)/M_i onto each factor; apply (a). On an abelian factor conjugation by N is trivial.
6. (f) For T = Z/p, H acts irreducibly on F_p^m so m ≤ |H|; for T non-abelian the normal copies of T are the factors and H permutes them transitively.
7. (g) Apply (c) with N = 1: the probability is positive for m_i = m and zero for m + 1.

**Acceptance.** F = 1, G = Z/3: N ≥ m uniform vectors of F_3^m span with probability ∏_{j<m}(1 − 3^{j−N}); |Sur(F_3^m, Z/3)| = 3^m − 1. F = 1, G = A_5: |Sur(A_5^m, A_5)| = m·|Aut(A_5)| = 120m.

**Depends on.** *Γ-groups and their equivariant maps* (RG.0/gamma-group).

**Source.** LW20, Theorem 5.1, Lemmas 5.3–5.5, 5.8, Corollaries 5.6–5.10, Lemma 5.11, pp. 6–10: Computes the probability that N uniform elements normally F-generate a product of irreducible F-groups, from the structure of its normal F-subgroups, and shows N/M is such a product. LW20, Lemma 6.1, p. 10, and Theorem 7.1 with Lemmas 7.2–7.3, pp. 14–15: Bounds the power of a simple group in an irreducible kernel by |H|, and counts F-surjections from a product of irreducibles onto one factor.

#### The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G)

Declaration: ArithmeticStatisticsPartII:RG.3/fundamental-exact-sequence. Kind: construction. Planet: Fundamental short exact sequence. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/FundamentalSequence`, namespace `TauCeti.GammaGroup`.

Let n ≥ 1, 𝒞 a finite set of finite |Γ|′-Γ-groups, H a finite Γ-group of level 𝒞 and ϖ : (𝓕_n)^𝒞 → H a Γ-surjection with kernel N. Let M be the intersection of the maximal proper (𝓕_n)^𝒞-normal Γ-subgroups of N, F = (𝓕_n)^𝒞/M and R = N/M. The fundamental short exact sequence of (𝒞, n, ϖ) is 1 → R → F → H → 1 (LWZB (4.1)); it is induced by 1 → R → F ⋊ Γ → H ⋊ Γ → 1 (4.2), and R is a finite product of irreducible F ⋊ Γ-groups whose abelian factors are H ⋊ Γ-groups. 𝒜_H is the set of isomorphism classes of non-trivial finite abelian irreducible |Γ|′-(H ⋊ Γ)-groups — 'non-trivial' refers to the group, so Z/p with trivial action (p ∤ |Γ|) belongs to 𝒜_H, with |Y(Z/p)| = 1 — and 𝒩 the set of isomorphism classes of finite |Γ|′-Γ-groups isomorphic as groups to T^j with T non-abelian simple. For G ∈ 𝒜_H, m(𝒞, n, ϖ, G) is the multiplicity of G in R as an H ⋊ Γ-group; for G ∈ 𝒩 it is the sum of the multiplicities in R of the irreducible F ⋊ Γ-group structures on G compatible with its Γ-action. These numbers depend only on (𝒞, n, H, G) (RG.3/multiplicities-via-extensions) and are non-zero for finitely many G.

**Hypotheses.** 𝒞 finite, so (𝓕_n)^𝒞 is finite (RG.1/free-admissible-universal-property (e)).

**Construction or proof.**

1. Normal subgroups of (𝓕_n)^𝒞 ⋊ Γ contained in N are exactly the (𝓕_n)^𝒞-normal Γ-subgroups of N, so RG.3/products-of-irreducible-operator-groups (e) applies to N ⊴ (𝓕_n)^𝒞 ⋊ Γ and gives R as a product of irreducible F ⋊ Γ-groups.
2. Abelian factors: conjugation by R is trivial on them, so the F ⋊ Γ-action factors through H ⋊ Γ.
3. A subgroup of (𝓕_n)^𝒞 generated as a normal Γ-subgroup by elements of N equals N iff its image in F equals R, because a proper one would lie in a maximal proper (𝓕_n)^𝒞-normal Γ-subgroup of N (Liu–Wood §4, the argument before (4.2)).
4. Finiteness of the support: each irreducible factor is characteristically simple, hence a power of a simple group lying (as a group) in the subgroup-and-quotient closure of 𝒞 (Liu–Wood Corollary 6.12), with exponent at most |H ⋊ Γ| (part (f) of the products node).

**Uses.** LWZB Theorem 4.12, (4.15)–(4.16): the probability of each kernel N reduces to generation of R; LWZB Proposition 4.7 and Corollary 4.8: Sur_{F⋊Γ}(R, G) is counted in two ways to determine the multiplicities; LWZB Lemma 5.4: irreducible factors of R give Γ-chief factor pairs; LWZB Lemma 7.2: identification with the p-covering-group sequence.

**API.**

- `fundamentalSES` (data): The sequence 1 → R → F → H → 1 attached to (𝒞, n, ϖ), with R = N/M and F = (𝓕_n)^𝒞/M.
- `fundamentalSES.R_eq_prod` (characterisation): R is isomorphic, as an F ⋊ Γ-group, to a finite product of irreducible F ⋊ Γ-groups.
- `fundamentalSES.abelian_factor_through` (structure): On each abelian irreducible factor the F ⋊ Γ-action factors through H ⋊ Γ.
- `fundamentalSES.generates_iff` (characterisation): A normal Γ-subgroup of (𝓕_n)^𝒞 contained in N equals N iff its image in F is R.
- `abelianIrreducibles` (data): 𝒜_H, including Z/p with trivial action for p ∤ |Γ|.
- `nonabelianSimplePowers` (data): 𝒩, the |Γ|′-Γ-groups isomorphic to T^j with T non-abelian simple.
- `multiplicity` (data): m(𝒞, n, ϖ, G) for G ∈ 𝒜_H ∪ 𝒩.
- `multiplicity_finiteSupport` (other): Only finitely many G ∈ 𝒜_H ∪ 𝒩 have m(𝒞, n, ϖ, G) ≠ 0.

**Unit tests.**

- `fundamentalSES.test_cohen_lenstra` (computation): Γ = Z/2, H = 1, 𝒞 = {Z/3 with σ = −1}: (𝓕_n)^𝒞 = F_3^n with σ = −1, M = 0, R = F = F_3^n and m(𝒞, n, 1, Z/3) = n.
- `fundamentalSES.test_iso` (degenerate): If ϖ is an isomorphism then N = R = 1 and every multiplicity is 0.
- `fundamentalSES.test_trivial_action_factor` (non-example): Excluding Z/p with trivial action from 𝒜_H loses the factors that detect Property E: for Γ = Z/2, p = 3, 𝒞 the 3-Γ-groups of 3-class ≤ 2 and H = F_3² with σ = −1, R contains Z/3 with trivial action (the commutator of two σ-anti-invariant generators).
- `fundamentalSES.test_pcovering` (compatibility): For Γ = Z/2, p odd, H = (𝓕_n)_p^𝒞/[Y(S)] and 𝒞 a large finite set of p-Γ-groups, R is the p-multiplicator of RG.5/p-covering-group.

**Acceptance.** For a sufficiently large finite set 𝒞 of p-Γ-groups (Γ = Z/2, p odd, H with Y-generated relation kernel), the fundamental sequence is the p-covering-group sequence (LWZB Lemma 7.2, RG.5).

**Depends on.** *Products of irreducible F-groups (Liu–Wood §§5–7)* (RG.3/products-of-irreducible-operator-groups); *Level-𝒞 closure and the pro-𝒞 completion of a Γ-group* (RG.1/level-completion); *Homomorphisms out of 𝓕_n (Corollary 3.8, Corollary 3.10, finiteness)* (RG.1/free-admissible-universal-property).

**Source.** LWZB, §4, (4.1)–(4.2), p. 20, and Remark 4.9, p. 23: Defines the fundamental short exact sequence from the intersection of the maximal (𝓕_n)^𝒞-normal Γ-subgroups of the kernel, the sets 𝒜_H and 𝒩, and the multiplicities, shown independent of ϖ in Remark 4.9. LW20, §4, (4.1), pp. 5–6: The Γ = 1 version, where any two surjections (F̂_n)^S̄ → H are isomorphic as H-extensions (Lubotzky).

#### Generation by Y-relations (Proposition 4.3, Remark 4.4)

Declaration: ArithmeticStatisticsPartII:RG.3/y-generation-probability. Kind: theorem. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/FiniteLevel`, namespace `TauCeti.GammaGroup`.

Assume (SZ_Γ). Let F be a Γ-group, G_1, …, G_k pairwise non-isomorphic finite irreducible F ⋊ Γ-groups (of order prime to |Γ|) and R = ∏ G_i^{m_i}. For integers n, u with n + u ≥ 1 and r_1, …, r_{n+u} independent uniform elements of R, Prob([Y(r_1), …, Y(r_{n+u})]_{F⋊Γ} = R) = ∏_{G_i abelian} ∏_{j=0}^{m_i−1}(1 − h_{F⋊Γ}(G_i)^j |Y(G_i)|^{−n−u}) · ∏_{G_i non-abelian}(1 − |Y(G_i)|^{−n−u})^{m_i}, where [·]_{F⋊Γ} is the normal F ⋊ Γ-subgroup generated by the coordinates. (Remark 4.4) For an abelian irreducible F ⋊ Γ-group G and m maximal such that G^m is F ⋊ Γ-generated by the coordinates of one Y(g), h_{F⋊Γ}(G)^m = |Y(G)|.

**Hypotheses.** (SZ_Γ) (for the count of maps in the abelian case, through Corollary 3.8). the G_i of order prime to |Γ|.

**Construction or proof.**

1. Normal F ⋊ Γ-subgroups of R split along the isotypic parts (RG.3/products-of-irreducible-operator-groups (a)), so the probability factors over the G_i^{m_i}.
2. Y(y) has all coordinates trivial iff y ∈ G^Γ, which for uniform y has probability |Y(G)|⁻¹ (RG.0/y-map).
3. Non-abelian G: by part (b) of the products node, G^m is generated iff each projection receives a non-trivial Y-coordinate, giving (1 − |Y(G)|^{−n−u})^m.
4. Abelian G: condition on the first m − 1 projections; the tuples Y(y_i) correspond to maps 𝓕_{n+u} → G^m (RG.1/free-admissible-universal-property (a)), and the bad last coordinates are those factoring through G^{m−1}: h_{F⋊Γ}(G)^{m−1} of the |Y(G)|^{n+u} possibilities (counted via RG.0/y-map). The printed proof writes 𝓕_n for 𝓕_{n+u} and Y[(…)] for [Y(…)] (source issue E11 here).
5. Remark 4.4: apply the formula with n + u = 1 for m and m + 1.

**Acceptance.** Γ = Z/2, F = 1, R = (Z/3 with σ = −1)^m: the probability is ∏_{j<m}(1 − 3^{j−n−u}), the probability that n + u uniform vectors span F_3^m. A factor Z/p with trivial action has |Y(Z/p)| = 1 and contributes the factor 1 − 1 = 0 when m ≥ 1: trivial-action factors are never generated by Y-relations.

**Depends on.** *Products of irreducible F-groups (Liu–Wood §§5–7)* (RG.3/products-of-irreducible-operator-groups); *The map Y* (RG.0/y-map); *Homomorphisms out of 𝓕_n (Corollary 3.8, Corollary 3.10, finiteness)* (RG.1/free-admissible-universal-property).

**Source.** LWZB, Proposition 4.3 with proof and Remark 4.4, p. 21: Gives the probability that the Y-coordinates of n + u uniform elements generate a product of irreducible F ⋊ Γ-groups, reducing to Liu–Wood Lemmas 5.5 and 5.8 and a conditional count of maps from 𝓕_{n+u}.

#### H-extensions of Γ-groups and the Möbius function of sub-extensions

Declaration: ArithmeticStatisticsPartII:RG.3/h-extensions. Kind: definition. Planet: H-extensions and their Möbius function. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Extensions`, namespace `TauCeti.GammaGroup`.

For a Γ-group H, an H-extension is a pair (E, π) of a Γ-group E and a Γ-surjection π : E → H; a morphism (E, π) → (E′, π′) is a Γ-homomorphism f with π′ ∘ f = π, and Sur_{Γ,H}, Aut_{Γ,H} are the surjective morphisms and automorphisms. (E, π) is admissible if E is. A sub-H-extension of (E, π) is a closed Γ-subgroup E′ ≤ E with π(E′) = H; for finite E these form a finite poset 𝓔^E_H under inclusion with top element E, and ν(D, E) is its Möbius function: ν(E, E) = 1 and ν(D, E) = −Σ_{D ⊊ D′ ⊆ E} ν(D′, E) for D ≠ E (the printed recursion sums over all D′ ≠ D, source issue E5 here). For G ∈ 𝒜_H, 𝓔(G, H) is the set of isomorphism classes of admissible H-extensions with ker π ≅ G as H ⋊ Γ-groups (under conjugation); for G ∈ 𝒩, the admissible H-extensions with ker π ≅ G as Γ-groups and ker π an irreducible E ⋊ Γ-group. 𝓔_𝒞(G, H) ⊆ 𝓔(G, H) consists of those with E of level 𝒞; it is finite for finite 𝒞.

**Hypotheses.** H a finite Γ-group; E finite for the poset and the Möbius function.

**Construction or proof.**

1. The Möbius function is Mathlib's IncidenceAlgebra.mu of the finite poset 𝓔^E_H, evaluated at (D, E).
2. Möbius inversion on 𝓔^E_H: if g(D) = Σ_{D′ ≤ D} f(D′) for every D, then f(E) = Σ_D ν(D, E) g(D).
3. Finiteness of 𝓔_𝒞(G, H): an extension of level 𝒞 is a Γ-quotient of a product of members of 𝒞 of bounded order |H||G|, and there are finitely many such up to isomorphism.

**Uses.** LWZB Lemma 4.6: Möbius inversion over 𝓔^E_H counts surjections of H-extensions; LWZB Proposition 4.7 and Corollary 4.8: the multiplicities are sums over 𝓔_𝒞(G, H); LWZB (4.10)–(4.11): λ(𝒞, H, G) is a weighted count of 𝓔_𝒞(G, H); LWZB Lemma 5.4: non-abelian H-extensions of level 𝒞_ℓ are counted through chief factor pairs.

**API.**

- `HExtension` (data): An H-extension (E, π) of Γ-groups.
- `HExtension.Hom` (data): Morphisms of H-extensions, with Sur_{Γ,H} and Aut_{Γ,H}.
- `HExtension.subExtensions` (data): The finite poset 𝓔^E_H of closed Γ-subgroups of E mapping onto H, ordered by inclusion.
- `HExtension.mobius` (data): ν(D, E) = IncidenceAlgebra.mu ℤ 𝓔^E_H D E.
- `HExtension.mobius_self` (simp): ν(E, E) = 1.
- `HExtension.sum_mobius` (characterisation): For D ≠ E, Σ_{D ≤ D′ ≤ E} ν(D′, E) = 0.
- `HExtension.mobius_inversion` (relation): If g(D) = Σ_{D′ ≤ D} f(D′) for all D, then f(E) = Σ_D ν(D, E) g(D).
- `HExtension.extSet` (data): 𝓔(G, H) for G ∈ 𝒜_H ∪ 𝒩.
- `HExtension.extSetLevel` (data): 𝓔_𝒞(G, H), the members of level 𝒞.
- `HExtension.finite_extSetLevel` (other): 𝓔_𝒞(G, H) is finite for finite 𝒞, and Aut_{Γ,H}(E, π) is finite for finite E.

**Unit tests.**

- `HExtension.test_identity` (degenerate): For (H, id), 𝓔^H_H = {H} and ν(H, H) = 1.
- `HExtension.test_Z3` (computation): Γ = Z/2, H = 1, E = Z/3 with σ = −1: 𝓔^E_H = {0 < Z/3}, ν(Z/3, Z/3) = 1, ν(0, Z/3) = −1.
- `HExtension.test_F3_squared` (non-example): Γ = Z/2, H = 1, E = F_3² with σ = −1: the corrected recursion gives ν = −1 on each of the four lines and ν(0, E) = 3 (the Möbius function of the subspace lattice); the printed recursion over all D′ ≠ D is circular on the four lines and defines no function.
- `HExtension.test_mobius_compat` (compatibility): ν agrees with Mathlib's IncidenceAlgebra.mu on 𝓔^E_H, and for E with H = 1 and E elementary abelian of rank k it is (−1)^k p^{k(k−1)/2} at (0, E).

**Acceptance.** The extension sets are the index sets of the sums (4.10)–(4.11) defining λ.

**Depends on.** *Γ-groups and their equivariant maps* (RG.0/gamma-group); *Admissible Γ-groups: closure properties and the abelian criterion* (RG.0/admissible-gamma-groups); *Level-𝒞 closure and the pro-𝒞 completion of a Γ-group* (RG.1/level-completion); `IncidenceAlgebra.mu` (Mathlib).

**Source.** LWZB, §4.1, pp. 21–22, before Lemma 4.6 and before Proposition 4.7: Defines H-extensions of Γ-groups, admissible H-extensions, sub-H-extensions, the poset 𝓔^E_H with its Möbius function ν, and the sets 𝓔(G, H), 𝓔_𝒞(G, H) in the abelian and non-abelian cases. LW20, §2.3, p. 4: The Γ = 1 notions of H-extensions, their morphisms and sub-H-extensions.

#### Counting surjections of H-extensions (Lemma 4.6)

Declaration: ArithmeticStatisticsPartII:RG.3/counting-extension-maps. Kind: theorem. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Extensions`, namespace `TauCeti.GammaGroup`.

Assume (SZ_Γ). Let n ≥ 1, 𝒞 a finite set of finite |Γ|′-Γ-groups, H a finite Γ-group of level 𝒞, ρ : (𝓕_n)^𝒞 → H an H-extension structure and (E, π) a finite H-extension. Then |Sur_{Γ,H}(ρ, π)| = Σ_{D ∈ 𝓔^E_H} ν(D, E) (|Y(D)|/|Y(H)|)^n if E is admissible of level 𝒞, and 0 otherwise.

**Hypotheses.** (SZ_Γ); all groups finite and pro-|Γ|′.

**Construction or proof.**

1. (𝓕_n)^𝒞 is admissible of level 𝒞, so its Γ-quotients are admissible of level 𝒞; this gives the vanishing case.
2. For a sub-H-extension D, morphisms (𝓕_n)^𝒞 → D over H correspond to elements of Y(D)^n lying over the element of Y(H)^n determined by ρ (RG.1/free-admissible-universal-property (a), (c)); by RG.0/sections-and-y (c) there are (|Y(D)|/|Y(H)|)^n of them.
3. Each such morphism is a surjection onto its image, a unique sub-H-extension D′ ≤ D: (|Y(D)|/|Y(H)|)^n = Σ_{D′ ≤ D} |Sur_{Γ,H}(ρ, D′)|.
4. Möbius inversion on 𝓔^E_H (RG.3/h-extensions).

**Acceptance.** Γ = Z/2, H = 1, E = Z/3 with σ = −1: |Sur_Γ((𝓕_n)^𝒞, Z/3)| = 3^n − 1 = ν(E, E)·3^n + ν(0, E)·1.

**Depends on.** *H-extensions of Γ-groups and the Möbius function of sub-extensions* (RG.3/h-extensions); *Homomorphisms out of 𝓕_n (Corollary 3.8, Corollary 3.10, finiteness)* (RG.1/free-admissible-universal-property); *Sections of G ⋊ Γ and the fibres of Y (Lemmas 3.4–3.6)* (RG.0/sections-and-y).

**Source.** LWZB, Lemma 4.6 with proof, p. 22: Counts surjections of H-extensions from (𝓕_n)^𝒞 by counting all maps into each sub-H-extension through Corollary 3.8 and Lemma 3.6(3), then inverting over the poset of sub-H-extensions.

#### Multiplicities through extensions (Proposition 4.7, Corollary 4.8, Remark 4.9)

Declaration: ArithmeticStatisticsPartII:RG.3/multiplicities-via-extensions. Kind: theorem. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/FiniteLevel`, namespace `TauCeti.GammaGroup`.

Assume (SZ_Γ). Let 1 → R → F → H → 1 be the fundamental sequence of (𝒞, n, ϖ) with H admissible. (1) For an irreducible abelian F ⋊ Γ-group G, |Sur_{F⋊Γ}(R, G)| = |Aut_{F⋊Γ}(G)| Σ_{(E,π)∈𝓔_𝒞(G,H)} Σ_{D∈𝓔^E_H} ν(D, E)(|Y(D)|/|Y(H)|)^n / |Aut_{Γ,H}(E, π)| when the F ⋊ Γ-action on G factors through H ⋊ Γ, and 0 otherwise. (2) For G ∈ 𝒩 with pairwise non-isomorphic compatible irreducible F ⋊ Γ-structures G_1, …, G_k, Σ_i |Sur_{F⋊Γ}(R, G_i)|/|Aut_{F⋊Γ}(G_i)| equals the same double sum over 𝓔_𝒞(G, H). (Corollary 4.8) Hence for G ∈ 𝒜_H, (h_{H⋊Γ}(G)^{m} − 1)/(h_{H⋊Γ}(G) − 1) = Σ_{(E,π)∈𝓔_𝒞(G,H)} Σ_D ν(D, E)(|Y(D)|/|Y(H)|)^n/|Aut_{Γ,H}(E, π)| with m = m(𝒞, n, ϖ, G), and for G ∈ 𝒩, m(𝒞, n, ϖ, G) equals that sum. (Remark 4.9) The multiplicities depend only on (𝒞, n, H, G).

**Hypotheses.** (SZ_Γ); 𝒞 finite; H admissible of level 𝒞.

**Construction or proof.**

1. |Sur_{F⋊Γ}(R, G)| is |Aut_{F⋊Γ}(G)| times the number of F ⋊ Γ-subgroups M of R with R/M ≅ G; for abelian R/M the action factors through H ⋊ Γ.
2. Sorting these M by the isomorphism class of the H-extension F/M → H, and using that every surjection of H-extensions from (𝓕_n)^𝒞 onto such an extension factors through F (Liu–Wood Proposition 8.7), the count is Σ_{(E,π)} |Sur_{Γ,H}((𝓕_n)^𝒞 → H, π)|/|Aut_{Γ,H}(E, π)|; then apply RG.3/counting-extension-maps.
3. Non-abelian case: group together the H-extensions whose kernels have the same Γ-structure.
4. Corollary 4.8: write R = ∏ G_i^{m_i} and use RG.3/products-of-irreducible-operator-groups (d): |Sur_{F⋊Γ}(R, G_i)| = h^{m_i} − 1 (abelian), m_i|Aut_{F⋊Γ}(G_i)| (non-abelian).

**Acceptance.** Γ = Z/2, H = 1, 𝒞 = {Z/3 with σ = −1}: 𝓔_𝒞(Z/3, 1) has one element with |Aut_{Γ,1}| = 2, so (3^m − 1)/2 = (3^n − 1)/2 and m = n.

**Depends on.** *The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G)* (RG.3/fundamental-exact-sequence); *Counting surjections of H-extensions (Lemma 4.6)* (RG.3/counting-extension-maps); *Products of irreducible F-groups (Liu–Wood §§5–7)* (RG.3/products-of-irreducible-operator-groups); *H-extensions of Γ-groups and the Möbius function of sub-extensions* (RG.3/h-extensions).

**Source.** LWZB, Proposition 4.7, Corollary 4.8 and Remark 4.9 with proofs, pp. 22–24: Counts F ⋊ Γ-surjections from R onto an irreducible group through H-extensions of level 𝒞 and Lemma 4.6, compares with the count through multiplicities (Liu–Wood Theorem 7.1), and concludes that the multiplicities do not depend on ϖ. LW20, Propositions 8.7 and 8.9, pp. 16–19: The Γ = 1 counts of surjections from R to abelian and non-abelian irreducible groups.

#### The λ-invariants λ(𝒞, H, G)

Declaration: ArithmeticStatisticsPartII:RG.3/lambda-invariants. Kind: definition. Planet: λ-invariants of extensions. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/FiniteLevel`, namespace `TauCeti.GammaGroup`.

For a set 𝒞 of finite |Γ|′-Γ-groups and a finite Γ-group H of level 𝒞: for G ∈ 𝒜_H, λ(𝒞, H, G) = (h_{H⋊Γ}(G) − 1) Σ_{(E,π)∈𝓔_𝒞(G,H)} |Aut_{Γ,H}(E, π)|⁻¹ (LWZB (4.10)); for G ∈ 𝒩, λ(𝒞, H, G) = Σ_{(E,π)∈𝓔_𝒞(G,H)} |Aut_{Γ,H}(E, π)|⁻¹ (4.11). For finite 𝒞 these are finite sums, non-zero for only finitely many G, and (4.17) λ(𝒞, H, G) = lim_n h_{H⋊Γ}(G)^{m(𝒞,n,H,G)}|Y(G)|^{−n} for G ∈ 𝒜_H and lim_n m(𝒞, n, H, G)|Y(G)|^{−n} for G ∈ 𝒩; λ > 0 iff 𝓔_𝒞(G, H) ≠ ∅, and then m → ∞. λ is nondecreasing in 𝒞; for an arbitrary set 𝒞 (Definition 5.14) λ(𝒞, H, G) = lim_i λ(𝒟_i, H, G) along any increasing exhaustion of 𝒞 by finite sets 𝒟_i, independent of the exhaustion. If H has Property E at level 𝒞 then λ(𝒞, H, Z/p) = 0 for Z/p with trivial action.

**Hypotheses.** H of level 𝒞; for (4.17), (SZ_Γ) and H admissible.

**Construction or proof.**

1. Finiteness of support: an irreducible kernel of an extension of level 𝒞 is a power of a simple group in the subgroup-and-quotient closure of 𝒞 (Liu–Wood Corollary 6.12) with exponent at most |H ⋊ Γ| (Liu–Wood Lemma 6.1).
2. (4.17): in the formula of RG.3/multiplicities-via-extensions, D = E is the unique term with |Y(D)|/|Y(H)| = |Y(G)|, the others being smaller by admissibility (RG.0/admissible-gamma-groups (d)); divide by |Y(G)|^n and let n → ∞.
3. Monotonicity in 𝒞: 𝓔_𝒞(G, H) grows with 𝒞; for an exhaustion the limit is the sum over all extensions of level 𝒞, which does not depend on the exhaustion.
4. Property E: a non-split central extension of H by Z/p of level 𝒞 admits no surjection from H (by order), so under Property E there is none, and split ones are not admissible; hence 𝓔_𝒞(Z/p, H) = ∅.

**Uses.** LWZB (4.14) and (5.13): the limiting values of the basic opens are products over G with parameters λ(𝒞, H, G); LWZB Theorem 5.15: λ for infinite 𝒞; LWZB §7.1: λ = 1 for the abelian level; LWZB Theorem 7.4: λ = p^{r(H)−d(H)} for p-groups.

**API.**

- `lambdaInv` (data): λ(𝒞, H, G) for finite 𝒞 and G ∈ 𝒜_H ∪ 𝒩, as a nonnegative rational.
- `lambdaInv_eq_tendsto` (relation): (4.17): λ is the limit of h^m|Y(G)|^{−n} (abelian) or m|Y(G)|^{−n} (non-abelian).
- `lambdaInv_pos_iff` (characterisation): λ(𝒞, H, G) > 0 iff 𝓔_𝒞(G, H) ≠ ∅.
- `lambdaInv_finiteSupport` (other): For finite 𝒞, λ(𝒞, H, G) = 0 for all but finitely many G.
- `lambdaInv_mono` (relation): λ(𝒞, H, G) ≤ λ(𝒞′, H, G) when 𝒞 ⊆ 𝒞′.
- `lambdaInvInf` (data): λ for arbitrary 𝒞, the limit along an exhaustion (Definition 5.14), with independence of the exhaustion.
- `lambdaInv_trivial_of_propertyE` (other): Under Property E at level 𝒞, λ(𝒞, H, Z/p) = 0 for trivial-action Z/p.

**Unit tests.**

- `lambdaInv.test_cohen_lenstra` (computation): Γ = Z/2, H = 1, 𝒞 = {Z/3 with σ = −1}, G = Z/3 with σ = −1: one extension with |Aut| = 2 and h = 3, so λ = (3 − 1)/2 = 1.
- `lambdaInv.test_abelian_level` (compatibility): For 𝒞 the abelian |Γ|′-Γ-groups and H abelian with H^Γ = 1, λ(𝒞, H, G) = 1 for each G with trivial H-action and G^Γ = 1 (LWZB §7.1).
- `lambdaInv.test_level_dependence` (computation): Γ = Z/2, H = Z/3 with σ = −1, G = Z/3 with trivial H-action and σ = −1: at level 𝒞 = {Z/3^−} the only extension is F_3² → Z/3 with |Aut_{Γ,H}| = 6, so λ = 2/6 = 1/3; at the level of all abelian 3-Γ-groups Z/9 → Z/3 (|Aut_{Γ,H}| = 3) also occurs and λ = 2(1/6 + 1/3) = 1.
- `lambdaInv.test_bbh` (computation): Γ = Z/2, p odd, 𝒞 all p-Γ-groups, G = Z/p with trivial H-action: λ = p^{r(H) − d(H)} (LWZB proof of Theorem 7.4).
- `lambdaInv.test_not_multiplicity` (non-example): λ is not the limit of the multiplicities themselves: for H = 1 above m(𝒞, n, 1, G) = n → ∞ while λ = lim 3^n·3^{−n} = 1.
- `lambdaInv.test_empty_class` (degenerate): For 𝒞 = {1} and H = 1 every 𝓔_𝒞(G, H) is empty and all λ vanish.

**Acceptance.** The λ's are the parameters of the limiting formulas (4.14), (5.13) and Theorem 5.15.

**Depends on.** *H-extensions of Γ-groups and the Möbius function of sub-extensions* (RG.3/h-extensions); *Multiplicities through extensions (Proposition 4.7, Corollary 4.8, Remark 4.9)* (RG.3/multiplicities-via-extensions); *The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G)* (RG.3/fundamental-exact-sequence); *Products of irreducible F-groups (Liu–Wood §§5–7)* (RG.3/products-of-irreducible-operator-groups).

**Source.** LWZB, (4.10)–(4.11), p. 24, (4.17), p. 25, and Definition 5.14, p. 31: Defines λ as a weighted count of level-𝒞 H-extensions with kernel G, relates it to the growth of the multiplicities, and extends it to arbitrary 𝒞 by exhaustion. LW20, §3.1, pp. 5–6, and Remark 8.13: The Γ = 1 definitions of λ(S, H, G) in the abelian and non-abelian cases.

#### Limits of truncated products (Liu–Wood Lemma 8.11)

Declaration: ArithmeticStatisticsPartII:RG.3/tail-product-limit. Kind: lemma. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/FiniteLevel`, namespace `TauCeti.GammaGroup`.

Let a > 1, x_n → x in ℝ and y_n → ∞ (positive integers). Then f(x) = ∏_{i≥1}(1 − x a^{−i}) is continuous in x and lim_n ∏_{i=1}^{y_n}(1 − x_n a^{−i}) = ∏_{i≥1}(1 − x a^{−i}). Similarly (1 − c_n)^{m_n} → e^{−λ} when m_n c_n → λ and c_n → 0.

**Hypotheses.** a > 1 real.

**Construction or proof.**

1. Only finitely many factors can have |x_n a^{−i}| ≥ 1/2 for n large (x_n is bounded); treat them directly.
2. For the rest take logarithms: |log(1 − t) + t| ≤ t² for |t| ≤ 1/2, so the tails are dominated by a summable sequence C a^{−i} uniformly in n; apply Tannery's theorem (Mathlib's tendsto_tsum_of_dominated_convergence) and exponentiate.
3. The exponential limit is the standard (1 − c_n)^{m_n} = exp(m_n log(1 − c_n)).

**Acceptance.** With x_n = 1, a = 3, y_n = n this gives ∏_{i≤n}(1 − 3^{−i}) → ∏_{i≥1}(1 − 3^{−i}) ≈ 0.5601.

**Depends on.** `tendsto_tsum_of_dominated_convergence` (Mathlib).

**Source.** LW20, Lemma 8.11, p. 20: States the continuity of x ↦ ∏(1 − x a^{−i}) and the convergence of truncated products with converging parameters and diverging lengths, used to pass from (8.2) to (8.3).

#### The finite-level distribution and its limit (Theorem 4.12)

Declaration: ArithmeticStatisticsPartII:RG.3/finite-level-distribution. Kind: theorem. Planet: Finite-level distribution (Theorem 4.12). Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/FiniteLevel`, namespace `TauCeti.GammaGroup`.

Assume (SZ_Γ). Let 𝒞 be a finite set of finite |Γ|′-Γ-groups, H a finite admissible Γ-group of level 𝒞, n ≥ 1 and u > −n. Then, with m = m(𝒞, n, H, G), Prob((X_{u,n})^𝒞 ≅ H) = |Sur_Γ(𝓕_n, H)| / (|Aut_Γ(H)| |Y(H)|^{n+u}) · ∏_{G∈𝒜_H} ∏_{k=0}^{m−1}(1 − h_{H⋊Γ}(G)^k |Y(G)|^{−n−u}) · ∏_{G∈𝒩}(1 − |Y(G)|^{−n−u})^m   (4.13). If H has Property E at level 𝒞, then as n → ∞ this tends to |Aut_Γ(H)|⁻¹|Y(H)|^{−u} ∏_{G∈𝒜_H} ∏_{i≥1}(1 − λ(𝒞, H, G) h_{H⋊Γ}(G)^{−i} |Y(G)|^{−u}) · ∏_{G∈𝒩} exp(−|Y(G)|^{−u} λ(𝒞, H, G))   (4.14), a product with finitely many factors different from 1. If H lacks Property E at level 𝒞, the probability (4.13) is 0 for every n. (The printed (4.14) carries no Property E hypothesis and is false in that case: source issue E6 here.)

**Hypotheses.** (SZ_Γ); 𝒞 finite of |Γ|′-groups; H finite admissible of level 𝒞; n ≥ 1, u > −n.

**Construction or proof.**

1. (4.15): the probability is the sum over closed normal Γ-subgroups N of (𝓕_n)^𝒞 with quotient ≅ H of Prob([Y(r_1, …, r_{n+u})] = N), r_j uniform (RG.2/random-gamma-groups).
2. (4.16): Prob(Y(r_j) ∈ N^d for all j) = |Y(H)|^{−n−u}, by RG.0/y-map and RG.0/sections-and-y.
3. Conditionally on that event, [Y(r)] = N iff the images of the Y(r_j) generate R in the fundamental sequence (the reference to (7.1) in the printed proof is to (4.1), source issue E12 here), and Y(r) mod M has the law of Y(r′) for uniform r′ ∈ R; apply RG.3/y-generation-probability and Remark 4.9.
4. The number of N is |Sur_Γ(𝓕_n, H)|/|Aut_Γ(H)| (RG.1/free-admissible-universal-property (c)); this gives (4.13).
5. Limits: finitely many G have m ≠ 0 (RG.3/fundamental-exact-sequence); by (4.17) of RG.3/lambda-invariants and RG.3/tail-product-limit each factor converges; |Sur_Γ(𝓕_n, H)||Y(H)|^{−n} → 1 (4.18).
6. Property E: then λ(𝒞, H, G) ≠ 0 forces |Y(G)| ≥ 2 (trivial-action Z/p has λ = 0), which is what the limit of the factor with h^m = 1 + λ·|Y(G)|^n requires. Without Property E some trivial-action Z/p occurs with m ≥ 1 for every n, its k = 0 factor is 1 − 1 = 0, and the probability vanishes, as RG.1/property-e-criterion also shows.

**Acceptance.** Γ = Z/2, H = 1, 𝒞 = {Z/3 with σ = −1}: (4.13) = ∏_{k<n}(1 − 3^{k−n−u}) and (4.14) = ∏_{i>u}(1 − 3^{−i}), the Cohen–Lenstra probability of a trivial 3-part. Γ = Z/2, p = 3, 𝒞 the 3-Γ-groups of 3-class ≤ 2, H = F_3² with σ = −1: here 𝒜_H contributes Z/3 with σ = −1 (m = n, λ = 1: the extensions F_3³ and the four classes of Z/9 × Z/3 over H, with |Aut_{Γ,H}| = 18 and 9) and Z/3 with trivial action (m = 1 for every n, λ = 2: the Heisenberg group, |Aut_{Γ,H}| = 1); the probability is 0 for every n, whereas the printed (4.14) gives (1/48)∏_{i≥1}(1 − 3^{−i})∏_{i≥1}(1 − 2·3^{−i}) ≈ 2.70·10^{−3} at u = 0, and (4.17) fails for the trivial-action factor (h^m|Y(G)|^{−n} = 3 ≠ λ).

**Depends on.** *Random Γ-groups X_{u,n} and their laws μ_{u,n} (Definition 3.15)* (RG.2/random-gamma-groups); *The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G)* (RG.3/fundamental-exact-sequence); *Generation by Y-relations (Proposition 4.3, Remark 4.4)* (RG.3/y-generation-probability); *Multiplicities through extensions (Proposition 4.7, Corollary 4.8, Remark 4.9)* (RG.3/multiplicities-via-extensions); *The λ-invariants λ(𝒞, H, G)* (RG.3/lambda-invariants); *Limits of truncated products (Liu–Wood Lemma 8.11)* (RG.3/tail-product-limit); *Homomorphisms out of 𝓕_n (Corollary 3.8, Corollary 3.10, finiteness)* (RG.1/free-admissible-universal-property); *Property E as the shape of the relations (Proposition 3.13)* (RG.1/property-e-criterion).

**Source.** LWZB, Theorem 4.12 with proof, (4.13)–(4.18), pp. 24–25: Computes Prob((X_{u,n})^𝒞 ≅ H) exactly by summing over kernels, reducing to the generation probability of Proposition 4.3 with the multiplicities of Corollary 4.8, and takes the limit in n through (4.17) and Liu–Wood Lemma 8.11. LW20, Theorem 8.1, (8.2)–(8.3), p. 15: The Γ = 1 finite-n formula and its limit.

### RG.4. No escape of mass and the limiting measure μ_Γ

**Targets.**
- *Chief factor pairs (Liu–Wood §6)*: chief series of finite groups, the pairs (M, A), their isomorphism, independence of the chief series, closure under products, subgroups and quotients, finiteness for a finite set.
- *Γ-chief factor pairs (Definition 5.1, Lemma 5.2, Corollary 5.3).*
- *Multiplicity bounds (Lemma 5.4)* and the uniform positivity bound (Corollary 5.9).
- *The interchange lemma (Lemma 5.10)*, with the monotone-positivity hypothesis its proof needs.
- *Countable additivity (Theorem 5.12)* of μ_u on the algebra 𝒜, for every integer u.
- *The limiting measure*: μ_u as a Borel probability measure on 𝒫 (Carathéodory), μ_Γ = μ_1.
- *Theorem 1.2*: μ_{1,n} → μ_Γ weakly, with the explicit value (5.13) on basic opens for H with Property E at level 𝒞 and 0 otherwise.
- *Theorem 5.15*: the value of μ_u on V_{𝒞,H} for arbitrary 𝒞 (Definition 5.14), with the same Property E proviso.

**Acceptance.** μ_u(𝒫) = 1 for every integer u; the abelian 3-part of μ_0 for Γ = Z/2 is the Cohen–Lenstra measure μ_{3,0}; the printed (5.13) value 2.70·10^{−3} for the F_3² example is replaced by 0.

Layer dependencies: ArithmeticStatisticsPartII:RG.3.

#### Chief factor pairs of finite groups (Liu–Wood §6)

Declaration: ArithmeticStatisticsPartII:RG.4/chief-factor-pairs. Kind: definition. Planet: Chief factor pairs. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/ChiefFactors`, namespace `TauCeti.GammaGroup`.

A chief series of a finite group G is a chain 1 = G_0 ◁ G_1 ◁ ⋯ ◁ G_r = G of normal subgroups of G with each G_{i+1}/G_i a minimal normal subgroup of G/G_i. For a minimal normal subgroup M of G, ρ_M : G → Aut(M) is conjugation. A chief factor pair is a pair (M, A) of finite groups with M an irreducible A-group and A acting faithfully (so A ≤ Aut(M)); (M, A) ≅ (M′, A′) if some isomorphism α : M → M′ carries A onto A′ under α_* : Aut(M) → Aut(M′). CF(G) is the set of isomorphism classes of the pairs (G_{i+1}/G_i, ρ_{G_{i+1}/G_i}(G/G_i)) of a chief series; it does not depend on the series (Liu–Wood Lemma 6.3, a Jordan–Hölder theorem for chief factor pairs). For a set T of finite groups, CF(T) = ∪_{G∈T} CF(G). Properties: CF(G × J) = CF(G) ∪ CF(J); CF(G/N) ⊆ CF(G); if T is closed under subgroups and quotients then CF(T̄) = CF(T) for its closure T̄ under products, subgroups and quotients (Lemma 6.11); a simple group in T̄ lies in the subgroup-and-quotient closure of T (Corollary 6.12); for finite T, CF(T̄) is finite and, if every member of T has order ≤ ℓ, A/Inn(M) has order ≤ ℓ − 1 for every (M, A) ∈ CF(T̄) (Corollary 6.13).

**Hypotheses.** G finite; chief factors are characteristically simple, so each is T^k for a simple group T.

**Construction or proof.**

1. Independence of the series: induction on |G|; if G_1 ≠ I_1 compare both series through G_1 × I_1, whose two orders of quotients give isomorphic chief factor pairs (Liu–Wood Lemma 6.3).
2. Products and quotients: concatenate chief series of G × 1 and 1 × J; refine a series through N for G/N.
3. Subgroups (Lemma 6.11): a chief series of J ≤ G passes through the G_i ∩ J, and the pairs between 1 and G_1 ∩ J arise from a subgroup J′ of a group G′ ∈ T realizing (G_1, ρ(G)); by induction CF(J) ⊆ CF(T).
4. Corollary 6.12: (T, Inn T) ∈ CF(T̄) for simple T ∈ T̄. Corollary 6.13: if (M, A) ∈ CF(G) with |G| ≤ ℓ then |M||A/Inn M| ≤ ℓ (abelian M) or |A| ≤ ℓ (non-abelian M), so |A/Inn M| ≤ ℓ/2.

**Uses.** LWZB Definition 5.1: Γ-chief factor pairs are the chief factor pairs of G ⋊ Γ coming from G; LWZB Lemma 5.4: irreducible factors of R map injectively to pairs (M, A) with surjections onto A; LWZB Theorem 4.12: finitely many simple groups occur, by Liu–Wood Corollary 6.12; Liu–Wood Lemma 9.5: the uniform lower bound is controlled by the finite set CF(S̄_ℓ).

**API.**

- `IsMinimalNormal` (data): N is a minimal non-trivial normal subgroup of G.
- `ChiefSeries` (data): A chain of normal subgroups of a finite group whose successive quotients are minimal normal in the quotient.
- `ChiefSeries.exists` (constructor): Every finite group has a chief series; every normal subgroup lies on one.
- `ChiefFactorPair` (data): A pair (M, A) with A ≤ Aut(M) acting irreducibly, and its isomorphism relation.
- `chiefFactors` (data): CF(G), the finite set of isomorphism classes of chief factor pairs of a chief series.
- `chiefFactors_eq_of_chiefSeries` (characterisation): Two chief series of G give the same multiset of chief factor pairs (Liu–Wood Lemma 6.3).
- `chiefFactors_prod` (relation): CF(G × J) = CF(G) ∪ CF(J).
- `chiefFactors_quotient_subset` (relation): CF(G/N) ⊆ CF(G).
- `chiefFactors_closure` (relation): For T closed under subgroups and quotients, CF(T̄) = CF(T).
- `simple_mem_subquotientClosure` (other): A simple group in T̄ lies in the subgroup-and-quotient closure of T.
- `finite_chiefFactors_closure` (other): For finite T, CF(T̄) is finite, and |A/Inn M| ≤ ℓ − 1 when the orders in T are at most ℓ.

**Unit tests.**

- `chiefFactors.test_S3` (computation): CF(S_3) = {(Z/3, Aut(Z/3) ≅ Z/2), (Z/2, 1)}.
- `chiefFactors.test_trivial` (degenerate): CF(1) = ∅.
- `chiefFactors.test_A4` (non-example): A_4 has chief series 1 ◁ V_4 ◁ A_4 with pairs (V_4, Z/3) and (Z/3, 1): a chief factor need not be simple (V_4 contributes two composition factors Z/2 but one chief factor pair).
- `chiefFactors.test_pgroup` (compatibility): For a finite p-group P ≠ 1, CF(P) = {(Z/p, 1)} and every chief series has log_p|P| steps, the length of a composition series in Mathlib's sense.

**Acceptance.** Mathlib has composition series of lattices (CompositionSeries.jordan_holder) but no chief series of groups or minimal normal subgroups; these are new here.

**Depends on.** `CompositionSeries.jordan_holder` (Mathlib); `IsSimpleGroup` (Mathlib).

**Source.** LW20, §6, pp. 10–14: the definitions before Lemma 6.3, Lemma 6.3, Lemma 6.10, Lemma 6.11, Corollaries 6.12–6.13: Defines chief series, ρ_M, chief factor pairs and their isomorphism, proves that the multiset of chief factor pairs is independent of the chief series, and that the chief factor pairs of the variety generated by a set of groups are those of the set itself, with a size bound. LWZB, §5.1, pp. 25–26: Recalls these definitions from Liu–Wood before introducing Γ-chief factor pairs.

#### Γ-chief factor pairs (Definition 5.1, Lemma 5.2, Corollary 5.3)

Declaration: ArithmeticStatisticsPartII:RG.4/gamma-chief-factor-pairs. Kind: definition. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/ChiefFactors`, namespace `TauCeti.GammaGroup`.

For a finite |Γ|′-Γ-group G, CF_Γ(G) is the set of (M, A) ∈ CF(G ⋊ Γ) with gcd(|M|, |Γ|) = 1 — the chief factor pairs of G ⋊ Γ coming from the normal subgroup G — and CF_Γ(𝒞) = ∪_{G∈𝒞} CF_Γ(G) for a set 𝒞 of finite |Γ|′-Γ-groups. (Lemma 5.2) If 𝒞 is closed under Γ-subgroups and Γ-quotients then CF_Γ(𝒞̄) = CF_Γ(𝒞). (Corollary 5.3) If every member of 𝒞 has order at most ℓ, then for each (M, A) ∈ CF_Γ(𝒞̄) the largest divisor of |A/Inn(M)| prime to |Γ| is less than ℓ, and CF_Γ(𝒞̄) is finite.

**Hypotheses.** (SZ_Γ), used in Lemma 5.2 to conjugate the images of Γ.

**Construction or proof.**

1. Γ-quotients and finite products create no new pairs, as for CF.
2. Γ-subgroups J ≤ G ∈ 𝒞: take a chief series of G ⋊ Γ through G and the induced series of J ⋊ Γ through the G_i ∩ J; the pairs between 1 and G_1 ∩ J are realized by a Γ′-subgroup of some G′ ∈ 𝒞, where Γ′ is a conjugate of Γ obtained from Schur–Zassenhaus conjugacy inside ρ^{−1}(α_*(A)); twisting the Γ-action on G′ by that conjugation keeps it in 𝒞 (LWZB Lemma 5.2).
3. Corollary 5.3: follow Liu–Wood Corollary 6.13 in G ⋊ Γ, discarding the factor of |Γ|.

**Uses.** LWZB Lemma 5.4: each multiplicity-carrying factor of R gives an element of CF_Γ(𝒞_ℓ) and a surjection from H̃ ⋊ Γ; LWZB Corollary 5.9: finiteness of CF_Γ(𝒞_ℓ) gives the uniform lower bound.

**API.**

- `gammaChiefFactors` (data): CF_Γ(G) ⊆ CF(G ⋊ Γ).
- `mem_gammaChiefFactors_iff` (characterisation): (M, A) ∈ CF_Γ(G) iff it arises from a chief series of G ⋊ Γ passing through G, at a step below G.
- `gammaChiefFactors_closure` (relation): CF_Γ(𝒞̄) = CF_Γ(𝒞) for 𝒞 closed under Γ-subgroups and Γ-quotients.
- `finite_gammaChiefFactors` (other): CF_Γ(𝒞̄) is finite when the orders in 𝒞 are bounded.
- `gammaChiefFactors_outer_lt` (other): The prime-to-|Γ| part of |A/Inn(M)| is less than ℓ.

**Unit tests.**

- `gammaChiefFactors.test_inversion` (computation): Γ = Z/2, G = Z/3 with σ = −1: G ⋊ Γ = S_3 and CF_Γ(G) = {(Z/3, Z/2)}.
- `gammaChiefFactors.test_trivial_group` (degenerate): CF_Γ(1) = ∅, although CF(1 ⋊ Γ) = CF(Γ) is non-empty for Γ ≠ 1.
- `gammaChiefFactors.test_trivial_Gamma` (compatibility): For Γ = 1, CF_Γ(G) = CF(G).
- `gammaChiefFactors.test_excludes_Gamma` (non-example): For Γ = Z/2 and G = Z/3 with trivial action, CF(G × Γ) = {(Z/3, 1), (Z/2, 1)} but CF_Γ(G) = {(Z/3, 1)}: the factor of Γ is excluded.

**Acceptance.** For Γ = 1, CF_Γ(G) = CF(G).

**Depends on.** *Chief factor pairs of finite groups (Liu–Wood §6)* (RG.4/chief-factor-pairs); *Level-𝒞 closure and the pro-𝒞 completion of a Γ-group* (RG.1/level-completion); *The coprime conjugacy hypothesis (SZ)* (RG.0/coprime-conjugacy-hypothesis).

**Source.** LWZB, Definition 5.1, Lemma 5.2 with proof, Corollary 5.3, pp. 26–27: Defines the Γ-chief factor pairs of G as the chief factor pairs of G ⋊ Γ with order prime to |Γ|, proves they do not grow under the closure operations of level-𝒞 groups (using Schur–Zassenhaus conjugacy), and bounds them for groups of bounded order.

#### Multiplicity bounds at level ℓ (Lemma 5.4)

Declaration: ArithmeticStatisticsPartII:RG.4/multiplicity-bounds. Kind: theorem. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/NoEscape`, namespace `TauCeti.GammaGroup`.

Assume (SZ_Γ). Let H be a finite Γ-group of level 𝒞_ℓ and H̃ = H^{𝒞_{ℓ−1}}. If M is a product of isomorphic abelian simple groups, the number of G ∈ 𝒜_H with G ≅ M as groups and m(𝒞_ℓ, n, H, G) ≠ 0 for some n is at most Σ_{(M,A)∈CF_Γ(𝒞_ℓ)} |Sur(H̃ ⋊ Γ, A)|. If M is a product of isomorphic non-abelian simple groups, the number of isomorphism classes of level-𝒞_ℓ H-extensions (E, π) with ker π ≅ M an irreducible E ⋊ Γ-group is at most Σ_{(M,A)∈CF_Γ(𝒞_ℓ)} |Sur(H̃ ⋊ Γ, A/Inn(M))|. (The printed 'irred. E-group' is read as irreducible E ⋊ Γ-group, source issue E8 here.)

**Hypotheses.** (SZ_Γ); 𝒞_ℓ the |Γ|′-Γ-groups of order ≤ ℓ.

**Construction or proof.**

1. An abelian factor G of R gives (G, ρ_G(F ⋊ Γ)) ∈ CF_Γ(𝒞_ℓ) and a surjection H ⋊ Γ → ρ_G(F ⋊ Γ); the map (G, φ) ↦ ((M, A), ρ) is injective (an equal image gives an H ⋊ Γ-isomorphism).
2. A non-abelian extension (E, π) maps to ((ker π, ρ(E ⋊ Γ)), the induced H ⋊ Γ → A/Inn(M)); E ⋊ Γ is the fibre product of H ⋊ Γ → A/Inn(M) ← A, so the map is injective.
3. By RG.4/gamma-chief-factor-pairs (Corollary 5.3) every surjection H ⋊ Γ → A/Inn(M) factors through H̃ ⋊ Γ.

**Acceptance.** The bounds depend only on (ℓ, H̃), not on H or n — the input to Corollary 5.9.

**Depends on.** *Γ-chief factor pairs (Definition 5.1, Lemma 5.2, Corollary 5.3)* (RG.4/gamma-chief-factor-pairs); *The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G)* (RG.3/fundamental-exact-sequence); *H-extensions of Γ-groups and the Möbius function of sub-extensions* (RG.3/h-extensions).

**Source.** LWZB, Lemma 5.4 with proof, (5.5)–(5.8), pp. 27–28: Bounds the number of irreducible factors of a given underlying group, and of non-abelian level-𝒞_ℓ extensions, by maps into the finite set of Γ-chief factor pairs, through the coarser quotient H^{𝒞_{ℓ−1}}.

#### A uniform lower bound for the generation factors (Corollary 5.9)

Declaration: ArithmeticStatisticsPartII:RG.4/uniform-positivity. Kind: theorem. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/NoEscape`, namespace `TauCeti.GammaGroup`.

Assume (SZ_Γ). For a finite Γ-group H of level 𝒞_ℓ let P_{u,n}(U_{𝒞_ℓ,H}) = ∏_{G∈𝒜_H} ∏_{k<m}(1 − h_{H⋊Γ}(G)^k |Y(G)|^{−n−u}) ∏_{G∈𝒩}(1 − |Y(G)|^{−n−u})^m (m = m(𝒞_ℓ, n, H, G)), the product in (4.13) without its prefactor. For ℓ > 1, integers u, and a finite Γ-group H̃ of level 𝒞_{ℓ−1}, there is c(u, ℓ, H̃) > 0 such that for all n ≥ 1 with u > −n and every H of level 𝒞_ℓ with H^{𝒞_{ℓ−1}} ≅ H̃, either P_{u,n}(U_{𝒞_ℓ,H}) = 0 or P_{u,n}(U_{𝒞_ℓ,H}) ≥ c(u, ℓ, H̃).

**Hypotheses.** (SZ_Γ).

**Construction or proof.**

1. Abelian factors: by Remark 4.4 each non-zero abelian product is a product of distinct factors 1 − p^{−i}, hence ≥ ∏_{k≥1}(1 − 2^{−k}); Lemma 5.4 bounds the number of G involved by a constant depending only on (ℓ, H̃) (Liu–Wood Lemma 9.5).
2. Non-abelian factors: bound Σ_G m(𝒞_ℓ, n, H, G)|Y(G)|^{−n} using Corollary 4.8, Lemma 4.6, Corollary 3.8 and Lemma 5.4, uniformly in n; then (1 − |Y(G)|^{−n−u})^m ≥ exp(−C·m|Y(G)|^{−n−u}) gives a positive bound (Liu–Wood Lemmas 9.5–9.6).

**Acceptance.** For abelian 𝒞 the bound is the Cohen–Lenstra constant ∏_{i≥1}(1 − p^{−i}) raised to the number of primes involved.

**Depends on.** *Multiplicity bounds at level ℓ (Lemma 5.4)* (RG.4/multiplicity-bounds); *Multiplicities through extensions (Proposition 4.7, Corollary 4.8, Remark 4.9)* (RG.3/multiplicities-via-extensions); *Generation by Y-relations (Proposition 4.3, Remark 4.4)* (RG.3/y-generation-probability); *Counting surjections of H-extensions (Lemma 4.6)* (RG.3/counting-extension-maps).

**Source.** LWZB, Corollary 5.9 and the paragraph after it, pp. 28–29: States the uniform lower bound for P_{u,n}(U_{𝒞_ℓ,H}) depending only on (u, ℓ, H^{𝒞_{ℓ−1}}), proved as in Liu–Wood Lemma 9.5 from Lemma 5.4 and Remark 4.4. LW20, Lemmas 9.5–9.6, pp. 23–26: The Γ = 1 bounds for the abelian and non-abelian parts.

#### Interchanging limits and sums over the level tower (Lemma 5.10)

Declaration: ArithmeticStatisticsPartII:RG.4/limit-interchange. Kind: theorem. Planet: Interchange lemma (Lemma 5.10). Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/NoEscape`, namespace `TauCeti.GammaGroup`.

Let f_n(H, ℓ) ≥ 0 be defined for n ≥ n_0, ℓ ≥ 1 and finite Γ-groups H of level 𝒞_ℓ, with: (1) f_n(H, ℓ) = g_n(H, ℓ) P_{u,n}(U_{𝒞_ℓ,H}); (2) g_n(H, ℓ) → g(H, ℓ) and g_n(H, ℓ) ≤ g(H, ℓ) for all n; (3) Σ_{H : H^{𝒞_{ℓ−1}} ≅ H̃} f_n(H, ℓ) = f_n(H̃, ℓ − 1); (4) if f_n(H, ℓ) > 0 then f_{n′}(H, ℓ) > 0 for all n′ ≥ n (monotone positivity, absent from the printed statement and needed by its proof: source issue E7 here). Then lim_n f_n(H, ℓ) exists for all (H, ℓ) and Σ_{H of level 𝒞_ℓ} lim_n f_n(H, ℓ) = lim_n f_n(1, 1). For u < 0 take n_0 = 1 − u.

**Hypotheses.** (SZ_Γ) through Corollary 5.9; the four hypotheses above.

**Construction or proof.**

1. Existence of lim_n f_n: by (1), (2) and the convergence of P_{u,n} in the proof of Theorem 4.12.
2. Induction on ℓ; the case ℓ = 1 is the trivial group alone. By (3) it suffices to interchange limit and sum over the H above a fixed H̃.
3. For each H with f_n(H, ℓ) > 0 for some n, (4) and Corollary 5.9 give f_n(H, ℓ) ≥ ½c(u, ℓ, H̃)g(H, ℓ) for all large n; so Σ_H g(H, ℓ) ≤ (2/c) lim_n f_n(H̃, ℓ − 1) < ∞ and the f_n(H, ℓ) are dominated by the summable g(H, ℓ).
4. Dominated convergence for sums (Mathlib's tendsto_tsum_of_dominated_convergence) gives the interchange.

**Acceptance.** Both applications satisfy (4): killing the generator x_{n+1} identifies 𝓕_{n+1}/[Y(S ∪ {y})] with 𝓕_n/[Y(S)] when Y(y) = Y(x_{n+1}), so an event of positive probability at n stays positive at n + 1.

**Depends on.** *A uniform lower bound for the generation factors (Corollary 5.9)* (RG.4/uniform-positivity); *The finite-level distribution and its limit (Theorem 4.12)* (RG.3/finite-level-distribution); `tendsto_tsum_of_dominated_convergence` (Mathlib).

**Source.** LWZB, Lemma 5.10 with proof, p. 29: States the interchange of the limit in n with the sum over the level-𝒞_ℓ groups for functions of the form g_n·P_{u,n} with dominated g_n and compatible sums, proved by induction on ℓ and dominated convergence using Corollary 5.9.

#### No escape of mass: countable additivity of μ_u (Theorem 5.12)

Declaration: ArithmeticStatisticsPartII:RG.4/countable-additivity. Kind: theorem. Planet: No escape of mass (Theorem 5.12). Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/NoEscape`, namespace `TauCeti.GammaGroup`.

Assume (SZ_Γ). For every integer u, the set function μ_u(A) = lim_n μ_{u,n}(A) on the algebra 𝒜 generated by the basic opens exists and is countably additive on 𝒜, with μ_u(𝒫) = 1. In particular Σ_{H of level 𝒞_ℓ} μ_u(U_{𝒞_ℓ,H}) = 1 for every ℓ. (The printed theorem assumes u ≥ 0; its proof never uses it, and Theorems 5.15, 6.2 and 7.4–7.5 need every u: source issue E9 here.)

**Hypotheses.** (SZ_Γ); u any integer, with X_{u,n} defined for n > −u.

**Construction or proof.**

1. Existence of the limit on basic opens is RG.3/finite-level-distribution (limit 0 when Property E fails); finite additivity passes to the limit, so μ_u is a finitely additive content on 𝒜 with μ_u(𝒫) = 1.
2. Tightness: apply RG.4/limit-interchange with f_n(H, ℓ) = μ_{u,n}(U_{𝒞_ℓ,H}) and g_n(H) = |Sur_Γ(𝓕_n, H)|/(|Aut_Γ(H)||Y(H)|^{n+u}), whose limit is |Aut_Γ(H)|⁻¹|Y(H)|^{−u} for admissible H by (4.18) (and 0 otherwise); this gives Σ_H μ_u(U_{𝒞_ℓ,H}) = μ_u(U_{𝒞_1,1}) = 1.
3. Countable additivity on 𝒜 follows from tightness at every level, as in Liu–Wood Corollary 9.7 and Theorem 9.1: a countable disjoint union in 𝒜 of level-ℓ basic opens has measure the sum, and every countable disjoint decomposition in 𝒜 refines to one of this form.

**Acceptance.** μ_u(𝒫) = 1 for every u; for Γ = Z/2 and 𝒞 the abelian 3-Γ-groups, the masses of the V_{𝒞,H} sum to 1 (the Cohen–Lenstra mass formula, ArithmeticStatistics:ST.5/cohen-lenstra-mass-formula, for u ≥ 0).

**Depends on.** *Interchanging limits and sums over the level tower (Lemma 5.10)* (RG.4/limit-interchange); *The finite-level distribution and its limit (Theorem 4.12)* (RG.3/finite-level-distribution); *The space 𝒫 of admissible Γ-groups* (RG.2/space-of-admissible-gamma-groups); *Homomorphisms out of 𝓕_n (Corollary 3.8, Corollary 3.10, finiteness)* (RG.1/free-admissible-universal-property).

**Source.** LWZB, Theorem 5.12 with proof, p. 30: Proves countable additivity of μ_u on the algebra of basic opens by reducing to the total mass of each level and applying Lemma 5.10 to μ_{u,n}(U_{𝒞_ℓ,H}) (stated for u ≥ 0). LW20, Theorem 9.1, Theorem 9.2 and Corollary 9.7, pp. 21–28: The Γ = 1 reduction of countable additivity to the level-ℓ total mass.

#### The limiting measures μ_u and μ_Γ

Declaration: ArithmeticStatisticsPartII:RG.4/limit-measure. Kind: construction. Planet: Limiting measure μ_Γ. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/LimitMeasure`, namespace `TauCeti.RandomGammaGroup`.

Assume (SZ_Γ). For each integer u, μ_u is the unique Borel probability measure on 𝒫 extending the countably additive content μ_u on 𝒜 (Carathéodory); μ_Γ = μ_1. The basic opens and the algebra 𝒜 generate the Borel σ-algebra, so μ_u is determined by its values on basic opens, and μ_u(V_{𝒞,H}) = lim_i μ_u(U_{𝒟_i,H}) for an exhaustion of an arbitrary 𝒞 by finite sets.

**Hypotheses.** (SZ_Γ).

**Construction or proof.**

1. 𝒜 is a ring of sets (in particular a set semiring) and μ_u is σ-additive, hence σ-subadditive, on it (RG.4/countable-additivity); Mathlib's AddContent.measure gives a measure on the σ-algebra generated by 𝒜, which is the Borel σ-algebra (RG.2/space-of-admissible-gamma-groups), agreeing with μ_u on 𝒜 (AddContent.measure_eq).
2. Uniqueness: two finite measures agreeing on the π-system 𝒜 that generates the σ-algebra coincide.
3. Continuity from above gives μ_u(V_{𝒞,H}) as the decreasing limit.

**Uses.** LWZB Theorem 1.2: μ_Γ is the weak limit; LWZB Theorem 5.15: values on V_{𝒞,H} by continuity from above; LWZB Theorem 6.2: moments are integrals against μ_u; LWZB Conjecture 1.3: μ_Γ is the predicted distribution of Gal(K^#/K).

**API.**

- `limitMeasure` (data): μ_u as a MeasureTheory.ProbabilityMeasure on 𝒫.
- `limitMeasure_basicOpen` (characterisation): μ_u(U_{𝒞,H}) = lim_n μ_{u,n}(U_{𝒞,H}).
- `limitMeasure_ext` (extensionality): A finite Borel measure on 𝒫 agreeing with μ_u on basic opens is μ_u.
- `limitMeasure_vSet` (relation): μ_u(V_{𝒞,H}) = lim_i μ_u(U_{𝒟_i,H}) for an exhaustion of 𝒞.
- `muGamma` (data): μ_Γ = μ_1.
- `limitMeasure_eq_zero_of_not_propertyE` (other): μ_u(U_{𝒞,H}) = 0 if H is not admissible or lacks Property E at level 𝒞.

**Unit tests.**

- `limitMeasure.test_total_mass` (degenerate): μ_u(𝒫) = 1 for every integer u, including u < 0.
- `limitMeasure.test_cohen_lenstra` (compatibility): For Γ = Z/2 and 𝒞 the abelian 3-Γ-groups, H ↦ μ_0(V_{𝒞,H}) on finite abelian 3-groups with σ = −1 is the Cohen–Lenstra measure μ_{3,0} of ArithmeticStatistics:ST.5/cohen-lenstra-measure.
- `limitMeasure.test_trivial_part` (computation): For Γ = Z/2, μ_1(U_{{Z/3^−},1}) = ∏_{i≥2}(1 − 3^{−i}) ≈ 0.840.
- `limitMeasure.test_E5` (non-example): For Γ = Z/2, p = 3, 𝒞 the 3-Γ-groups of 3-class ≤ 2 and H = F_3² with σ = −1, μ_0(U_{𝒞,H}) = 0, not the 2.70·10^{−3} of the printed (5.13).

**Acceptance.** μ_u(U_{𝒞,H}) = lim_n μ_{u,n}(U_{𝒞,H}) for every finite 𝒞 and H.

**Depends on.** *No escape of mass: countable additivity of μ_u (Theorem 5.12)* (RG.4/countable-additivity); *The space 𝒫 of admissible Γ-groups* (RG.2/space-of-admissible-gamma-groups); `MeasureTheory.AddContent.measure` (Mathlib); `MeasureTheory.AddContent.measure_eq` (Mathlib); `MeasureTheory.ProbabilityMeasure` (Mathlib).

**Source.** LWZB, §5.3, p. 30, first sentences: Extends μ_u from the algebra of basic opens to the Borel sets by Carathéodory's theorem and sets μ_Γ = μ_1. LW20, §3, p. 5: The Γ = 1 definition of μ_u on the algebra and its Carathéodory extension.

#### Convergence of the random Γ-groups (Theorem 1.2)

Declaration: ArithmeticStatisticsPartII:RG.4/weak-convergence. Kind: theorem. Planet: Weak convergence to μ_Γ (Theorem 1.2). Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/LimitMeasure`, namespace `TauCeti.RandomGammaGroup`.

Assume (SZ_Γ). For every finite group Γ, the laws μ_{1,n} of X_{Γ,n} = 𝓕_n/[Y(S)] (|S| = n + 1) converge weakly to the probability measure μ_Γ on 𝒫 as n → ∞; more generally μ_{u,n} → μ_u for every integer u. Explicitly (5.13), for a finite set 𝒞 of finite |Γ|′-Γ-groups and a finite admissible Γ-group H of level 𝒞 with Property E at level 𝒞, μ_Γ(U_{𝒞,H}) = |Aut_Γ(H)|⁻¹ [H : H^Γ]⁻¹ ∏_{G∈𝒜_H} ∏_{i≥1}(1 − λ(𝒞, H, G) h_{H⋊Γ}(G)^{−i} [G : G^Γ]⁻¹) ∏_{G∈𝒩} exp(−λ(𝒞, H, G)/[G : G^Γ]); if H is not admissible or lacks Property E at level 𝒞, μ_Γ(U_{𝒞,H}) = 0. (The printed (5.13) has no Property E hypothesis: source issue E6 here.)

**Hypotheses.** (SZ_Γ).

**Construction or proof.**

1. Every open set U ⊆ 𝒫 is a countable disjoint union of basic opens U_j (RG.2/space-of-admissible-gamma-groups); μ_Γ(U) = Σ_j lim_n μ_{1,n}(U_j) ≤ liminf_n Σ_j μ_{1,n}(U_j) = liminf_n μ_{1,n}(U) by Fatou's lemma for sums (the printed proof writes lim for liminf, source issue E10 here).
2. Weak convergence follows from the open-set criterion of the Portmanteau theorem (Mathlib's MeasureTheory.tendsto_of_forall_isOpen_le_liminf; the filter atTop is countably generated).
3. (5.13) is (4.14) with u = 1 and |Y(G)| = [G : G^Γ] (RG.0/y-map); the vanishing case is the last clause of RG.3/finite-level-distribution.

**Acceptance.** Γ = Z/2, 𝒞 = {Z/3 with σ = −1}, H = Z/3: here λ = 1/3 and μ_Γ(U_{𝒞,H}) = (1/6)∏_{i≥3}(1 − 3^{−i}) = (3/16)∏_{i≥2}(1 − 3^{−i}), the real-quadratic (u = 1) Cohen–Lenstra probability that the 3-rank is exactly 1. Γ = Z/2, H = F_3² with σ = −1 at the level of 3-class ≤ 2: μ_Γ(U_{𝒞,H}) = 0.

**Depends on.** *The limiting measures μ_u and μ_Γ* (RG.4/limit-measure); *The finite-level distribution and its limit (Theorem 4.12)* (RG.3/finite-level-distribution); *Random Γ-groups X_{u,n} and their laws μ_{u,n} (Definition 3.15)* (RG.2/random-gamma-groups); *The map Y* (RG.0/y-map); `MeasureTheory.tendsto_of_forall_isOpen_le_liminf` (Mathlib); `MeasureTheory.lintegral_liminf_le` (Mathlib).

**Source.** LWZB, Theorem 1.2, p. 2, and §5.3 with (5.13), p. 30: States weak convergence of the laws of X_{Γ,n} to μ_Γ and proves it from countable additivity, the decomposition of open sets into basic opens and Fatou's lemma, giving the explicit value (5.13) on basic opens.

#### μ_u on V_{𝒞,H} for arbitrary 𝒞 (Definition 5.14, Theorem 5.15)

Declaration: ArithmeticStatisticsPartII:RG.4/arbitrary-level-values. Kind: theorem. Planet: Values on V_{𝒞,H} (Theorem 5.15). Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/LimitMeasure`, namespace `TauCeti.RandomGammaGroup`.

Assume (SZ_Γ). Let 𝒞 be an arbitrary set of finite |Γ|′-Γ-groups, H a finite admissible Γ-group of level 𝒞 with Property E at level 𝒞, and u an integer. With m and λ extended to 𝒞 by exhaustion (Definition 5.14), μ_u(V_{𝒞,H}) = |Aut_Γ(H)|⁻¹|Y(H)|^{−u} ∏_{G∈𝒜_H} ∏_{i≥1}(1 − λ(𝒞, H, G) h_{H⋊Γ}(G)^{−i}|Y(G)|^{−u}) ∏_{G∈𝒩} exp(−|Y(G)|^{−u} λ(𝒞, H, G)). If H lacks Property E at level 𝒞, μ_u(V_{𝒞,H}) = 0. (The printed theorem has no Property E hypothesis and is false for such H: source issue E6 here.)

**Hypotheses.** (SZ_Γ); H finite admissible of level 𝒞.

**Construction or proof.**

1. V_{𝒞,H} = ⋂_i U_{𝒟_i,H} for an exhaustion 𝒟_1 ⊆ 𝒟_2 ⊆ ⋯ with H of level 𝒟_i, so μ_u(V_{𝒞,H}) = lim_i μ_u(U_{𝒟_i,H}) by continuity from above (RG.4/limit-measure, which needs Theorem 5.12 for this u).
2. Each μ_u(U_{𝒟_i,H}) is the product (4.14); its factors are non-increasing in i and λ(𝒟_i, H, G) increases to λ(𝒞, H, G) (RG.3/lambda-invariants), so the limit is the product with the limiting λ's (Liu–Wood Lemma 11.3 with Lemma 8.11).
3. Level-𝒟_i groups are of level 𝒞, so Property E at level 𝒞 gives Property E at level 𝒟_i once H is of level 𝒟_i (RG.1/property-e-at-level (a)), and the formula follows. If H lacks Property E at level 𝒞, the obstructing extension G̃ → G is finite, hence of level 𝒟_i for large i; then μ_u(U_{𝒟_i,H}) = 0 and V_{𝒞,H} ⊆ U_{𝒟_i,H}, because X^𝒞 ≅ H gives X^{𝒟_i} ≅ H^{𝒟_i} = H.

**Acceptance.** Γ = Z/2, p = 3, 𝒞 all finite 3-Γ-groups, H = F_3² with σ = −1: μ_u(V_{𝒞,H}) = 0 (the printed formula gives 2.70·10^{−3} at u = 0, while Theorem 7.4 gives 0). For abelian 𝒞 this is the formula of §7.1 (RG.5/abelian-specialization).

**Depends on.** *The limiting measures μ_u and μ_Γ* (RG.4/limit-measure); *The λ-invariants λ(𝒞, H, G)* (RG.3/lambda-invariants); *The finite-level distribution and its limit (Theorem 4.12)* (RG.3/finite-level-distribution); *Limits of truncated products (Liu–Wood Lemma 8.11)* (RG.3/tail-product-limit); *Property E relative to a level: restriction and completion* (RG.1/property-e-at-level).

**Source.** LWZB, Definition 5.14 and Theorem 5.15, p. 31: Extends m and λ to an arbitrary set 𝒞 by exhaustion and gives μ_u(V_{𝒞,H}) as the corresponding infinite product, proved as Liu–Wood Lemma 11.3. LW20, Lemma 11.3, pp. 32–33: The Γ = 1 computation of μ_u(V_{S,H}) as a double limit with monotone factors.

### RG.5. Moments, Cohen–Lenstra–Martinet and Boston–Bush–Hajir

**Targets.**
- *Moments (Lemma 6.1, Theorem 6.2)*: for every finite admissible Γ-group A and integer u, E|Sur_Γ(X_u, A)| = [A : A^Γ]^{−u}; in particular the μ_Γ-moment is [A : A^Γ]^{−1}.
- *Abelianization (§7.1)*: finite-index Γ-submodules of (Z_p[Γ]/(Σ_g g))^n are isomorphic to it (p ∤ |Γ|); μ_u(V_{𝒞_ab,H}) = |Aut_Γ(H)|^{−1}|H|^{−u} ∏_{p∤|Γ|} ∏_G ∏_{i≥1}(1 − h_Γ(G)^{−i}|G|^{−u}) for finite abelian |Γ|′-Γ-groups with H^Γ = 1 — the Cohen–Lenstra–Martinet distribution for u = 1.
- *The p-covering group*: p-multiplicator R′, relation rank r(H), lower p-central series, p-class, nucleus and nuclear rank ν(H), with their Γ-structure.
- *Boston–Bush–Hajir (Lemma 7.2, Theorems 7.4–7.5)*: for Γ = Z/2 and p odd, μ_u(V_{𝒞,H}) = |Aut_Γ(H)|^{−1}|Y(H)|^{−u} ∏_{i ≥ 1+u+d(H)−r(H)}(1 − p^{−i}) on pro-p completions, and the p-class-c version with r(H) − ν(H) when cl_p(H) = c; 0 for H not of the form (𝓕_n)^𝒞/[Y(S)].

**Imports.** The Cohen–Lenstra measure μ_{p,u}: ArithmeticStatistics:ST.5 (`cohen-lenstra-measure`); the lower p-central series and relation ranks: tauceti:TauCetiRoadmap/ProfiniteProPGroups Layers 3 and 5.

**Acceptance.** Γ = Z/2, A = Z/3 with σ = −1: moments 1/3 (u = 1) and 1 (u = 0), i.e. average |Cl[3]| = 4/3 and 2 (Davenport–Heilbronn); Γ = Z/4, A the Heisenberg group mod 3: moment 1/9; Theorem 7.4 for H = Z/3 gives ∏_{i≥2}(1 − 3^{−i})/6 = μ_{3,1}(Z/3).

Layer dependencies: ArithmeticStatisticsPartII:RG.4, ArithmeticStatistics:ST.5, tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations.

#### Moments at finite n (Lemma 6.1)

Declaration: ArithmeticStatisticsPartII:RG.5/finite-n-moments. Kind: theorem. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Moments`, namespace `TauCeti.RandomGammaGroup`.

Assume (SZ_Γ). For a finite admissible Γ-group A and integers n ≥ 1, u > −n: E|Sur_Γ(X_{u,n}, A)| = |Sur_Γ(𝓕_n, A)| · |Y(A)|^{−n−u}, and this tends to [A : A^Γ]^{−u} as n → ∞.

**Hypotheses.** (SZ_Γ); A finite admissible (in particular of order prime to |Γ|).

**Construction or proof.**

1. A Γ-surjection X_{u,n} → A is a Γ-surjection φ : 𝓕_n → A whose kernel contains the coordinates of every Y(s_j); so E|Sur_Γ(X_{u,n}, A)| = Σ_φ Prob(Y(s_j) ∈ (ker φ)^d for all j).
2. Each probability is |Y(A)|^{−n−u} by (4.16) (RG.0/y-map with RG.0/sections-and-y).
3. |Sur_Γ(𝓕_n, A)||Y(A)|^{−n} → 1 (RG.1/free-admissible-universal-property (b)) and |Y(A)| = [A : A^Γ].

**Acceptance.** Γ = Z/2, A = Z/3 with σ = −1, u = 1: E|Sur_Γ(X_{1,n}, A)| = (3^n − 1)/3^{n+1} → 1/3.

**Depends on.** *Random Γ-groups X_{u,n} and their laws μ_{u,n} (Definition 3.15)* (RG.2/random-gamma-groups); *Homomorphisms out of 𝓕_n (Corollary 3.8, Corollary 3.10, finiteness)* (RG.1/free-admissible-universal-property); *The map Y* (RG.0/y-map); *Sections of G ⋊ Γ and the fibres of Y (Lemmas 3.4–3.6)* (RG.0/sections-and-y).

**Source.** LWZB, Lemma 6.1 with proof, p. 31: Computes the expected number of Γ-surjections from X_{u,n} to a finite admissible A as |Sur_Γ(𝓕_n, A)||Y(A)|^{−n−u} and its limit [A : A^Γ]^{−u}.

#### The moments of μ_u (Theorem 6.2)

Declaration: ArithmeticStatisticsPartII:RG.5/moments. Kind: theorem. Planet: Moments of μ_u (Theorem 6.2). Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Moments`, namespace `TauCeti.RandomGammaGroup`.

Assume (SZ_Γ). For every integer u and every finite admissible Γ-group A, X ↦ |Sur_Γ(X, A)| is a locally constant function on 𝒫 and ∫ |Sur_Γ(X, A)| dμ_u(X) = [A : A^Γ]^{−u}. In particular the μ_Γ-moment is [A : A^Γ]^{−1}, and for abelian A with A^Γ = 1 it is |A|^{−1}.

**Hypotheses.** (SZ_Γ); A finite admissible; u any integer (this uses Theorem 5.12 for all u).

**Construction or proof.**

1. For ℓ ≥ |A|, |Sur_Γ(X, A)| = |Sur_Γ(X^{𝒞_ℓ}, A)|, so the function is constant on each U_{𝒞_ℓ,H} and the integral is Σ_H |Sur_Γ(H, A)| μ_u(U_{𝒞_ℓ,H}).
2. Apply RG.4/limit-interchange to f_n(H, ℓ) = E(|Sur_Γ(X_{u,n}, A)| · 1[X_{u,n}^{𝒞_ℓ} ≅ H]); conditioning on Y(S̄) as in the proof of LWZB Theorem 6.2 gives f_n = g_n P_{u,n}(U_{𝒞_ℓ,H}) with g_n = |Y(A^{𝒞_ℓ})|^{n+u}|Sur_Γ(ρ, π_A)||Sur_Γ((𝓕_n)^{𝒞_ℓ}, H)||Sur_Γ(H, A^{𝒞_ℓ})| / (|Y(A)|^{n+u}|Y(H)|^{n+u}|Aut_Γ(H)|), bounded by its limit (RG.3/counting-extension-maps and RG.1/free-admissible-universal-property).
3. Monotone positivity holds as in RG.4/limit-interchange; the sum over H of lim_n f_n is lim_n E|Sur_Γ(X_{u,n}, A)| = [A : A^Γ]^{−u} (RG.5/finite-n-moments), and for ℓ ≥ |A| the left side is Σ_H |Sur_Γ(H, A)|μ_u(U_{𝒞_ℓ,H}).

**Acceptance.** Γ = Z/2, A = Z/3 with σ = −1: the μ_1-moment is 1/3 and the μ_0-moment is 1, i.e. averages 4/3 and 2 of |Cl[3]| for real and imaginary quadratic fields, the Davenport–Heilbronn values. Γ = Z/4 acting on the Heisenberg group of order 27 through a fixed-point-free action of order 4 on its abelianization (trivially on the centre): A^Γ is the centre, so the moment is 1/9 (LWZB §1.5). Γ = (Z/2)² acting faithfully and admissibly on the Heisenberg group of order 27: A^Γ = 1 and the moment is 1/27 (LWZB §1.5).

**Depends on.** *Moments at finite n (Lemma 6.1)* (RG.5/finite-n-moments); *Interchanging limits and sums over the level tower (Lemma 5.10)* (RG.4/limit-interchange); *The limiting measures μ_u and μ_Γ* (RG.4/limit-measure); *No escape of mass: countable additivity of μ_u (Theorem 5.12)* (RG.4/countable-additivity); *Counting surjections of H-extensions (Lemma 4.6)* (RG.3/counting-extension-maps).

**Source.** LWZB, Theorem 6.2 with proof, (6.3)–(6.5), pp. 31–33: Proves that the moments of μ_u are [A : A^Γ]^{−u} by applying Lemma 5.10 to the expectation of |Sur_Γ(X_{u,n}, A)| on each level-ℓ basic open. LWZB, §1.5, pp. 7–8: Lists predicted moments: 1/9 for Γ = Z/4 and the Heisenberg group mod 3, 1/27 for Γ = (Z/2)², 1/15 for (Z/5)² ⋊ Z/3 with Γ = Z/2, and 1/125 for Γ = S_3.

#### Finite-index sublattices over Z_p[Γ] for p ∤ |Γ|

Declaration: ArithmeticStatisticsPartII:RG.5/coprime-lattice-lemma. Kind: theorem. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Abelian`, namespace `TauCeti.RandomGammaGroup`.

Let p be a prime not dividing |Γ| and L = (Z_p[Γ]/(Σ_{g∈Γ} g))^n. Every Γ-stable Z_p-submodule N ⊆ L of finite index is isomorphic to L as a Z_p[Γ]-module. More generally, two Z_p[Γ]-lattices (finitely generated, Z_p-free) M ⊆ M′ with M′/M finite are isomorphic.

**Hypotheses.** p ∤ |Γ|.

**Construction or proof.**

1. Lattices are projective Z_p[Γ]-modules: a Z_p-linear splitting of Z_p[Γ] ⊗ M → M, averaged over Γ (|Γ| is a unit), is Z_p[Γ]-linear (Mathlib's Module.Projective.of_split).
2. Reductions agree in the Grothendieck group: for T = M′/M finite, the snake lemma for multiplication by p on 0 → M → M′ → T → 0 gives an exact sequence 0 → T[p] → M/pM → M′/pM′ → T/pT → 0, and T[p], T/pT have the same composition factors (from 0 → T[p] → T → T → T/pT → 0).
3. F_p[Γ] is semisimple (Maschke, Mathlib's MonoidAlgebra.Submodule.exists_isCompl), so M/pM ≅ M′/pM′.
4. Lift an isomorphism M/pM → M′/pM′ to φ : M → M′ by projectivity; φ is onto by Nakayama (Mathlib's Submodule.le_of_le_smul_of_le_jacobson_bot, with p in the Jacobson radical) and injective because M and M′ are free of the same Z_p-rank.

**Acceptance.** For Γ = Z/2, p = 3, n = 1: L = Z_3 with σ = −1 and every non-zero Γ-submodule 3^kZ_3 is isomorphic to L. The hypothesis p ∤ |Γ| is needed: for Γ = Z/2, p = 2, the sublattice of Z_2[Γ] spanned by 1 + σ and 2 has finite index but its reduction mod 2 is the trivial module twice, not F_2[Γ].

**Depends on.** `Module.Projective.of_split` (Mathlib); `MonoidAlgebra.Submodule.exists_isCompl` (Mathlib); `Submodule.le_of_le_smul_of_le_jacobson_bot` (Mathlib).

**Source.** LWZB, §7.1, p. 34, second paragraph: Uses that a finite-index closed Γ-submodule N_p of the pro-p abelian quotient of 𝓕_n is isomorphic to it, because Z_p[Γ] is hereditary and N_p ⊗ Q_p ≅ (𝓕_n)^𝒞_p ⊗ Q_p (citing Serre, Linear Representations, §16, Theorem 34, Corollary 2); the module is printed as Z_p[Γ]^n instead of (Z_p[Γ]/(Σg))^n (source issue E13 here).

#### The abelianization: the Cohen–Lenstra–Martinet distribution (§7.1)

Declaration: ArithmeticStatisticsPartII:RG.5/abelian-specialization. Kind: theorem. Planet: Cohen–Lenstra–Martinet specialization. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Abelian`, namespace `TauCeti.RandomGammaGroup`.

Assume (SZ_Γ). Let 𝒞 be the set of all finite abelian |Γ|′-Γ-groups (or those whose orders involve only a fixed set of primes not dividing |Γ|), and H a finite abelian |Γ|′-Γ-group with H^Γ = 1. Then: (a) in every fundamental sequence 1 → R → F → H → 1 at level 𝒞 the H-action on R is trivial and F^Γ = R^Γ = H^Γ = 1, so m(𝒞, n, H, G) = 0 unless G ∈ 𝒜_H has trivial H-action; (b) for G with trivial H-action and G^Γ = 1, m(𝒞, n, H, G) = n·m_G (m_G maximal with G^{m_G} cyclic as a Γ-module, h_Γ(G)^{m_G} = |G|) and λ(𝒞, H, G) = 1; (c) μ_u(V_{𝒞,H}) = |Aut_Γ(H)|^{−1} |H|^{−u} ∏_{p∤|Γ|} ∏_{G} ∏_{i≥1}(1 − h_Γ(G)^{−i}|G|^{−u}), the middle product over the non-trivial irreducible F_p[Γ]-modules G (restricted to the chosen primes). For u = 1 this is the Cohen–Lenstra–Martinet distribution of the prime-to-|Γ| class groups of totally real Γ-fields; for Γ = Z/2 and u = 0, 1 its p-parts are the Cohen–Lenstra measures μ_{p,u}.

**Hypotheses.** (SZ_Γ) (abelian H needs it only through the general machinery); H^Γ = 1.

**Construction or proof.**

1. (a) In an abelian level the kernel R is abelian with trivial F-conjugation, hence trivial H-action; (𝓕_n^ab)^Γ = 0 (RG.1/free-admissible-universal-property (d)) gives F^Γ = 1.
2. (b) For a finite-index closed Γ-subgroup N of (𝓕_n)^𝒞, N ≅ (𝓕_n)^𝒞 one prime at a time (RG.5/coprime-lattice-lemma), so the maximal quotient of N that is a product of copies of G has G^{n m_G}, giving m = n·m_G; by (4.17) λ = lim h^{n m_G}|G|^{−n} = 1 (Remark 4.4 with |Y(G)| = |G| because G^Γ = 1).
3. (c) Insert (b) into RG.4/arbitrary-level-values; |Y(H)| = |H| because H^Γ = 1; the trivial F_p[Γ]-module has m = 0 and λ = 0.
4. For Γ = Z/2 the only non-trivial irreducible F_p[Γ]-module is F_p with σ = −1, h_Γ = p, so the p-part is |Aut H|^{−1}|H|^{−u}∏_{i>u}(1 − p^{−i}) = μ_{p,u}(H) (ArithmeticStatistics:ST.5/cohen-lenstra-measure). The agreement with Cohen–Martinet's formulation for general Γ is Wang–Wood, Proposition 6.5.

**Acceptance.** Γ = Z/2, H = Z/3 with σ = −1, 𝒞 the abelian 3-Γ-groups, u = 1: μ_1(V_{𝒞,H}) = (1/6)∏_{i≥2}(1 − 3^{−i}) = μ_{3,1}(Z/3). For abelian H with H^Γ = 1 the moment |H|^{−1} of RG.5/moments equals the predicted Cohen–Martinet moment ∏_v |H^{σ_v}|^{−1} of ArithmeticStatistics:ST.5/cohen-martinet-predicted-surjection-moment for totally real fields (every σ_v = 1).

**Depends on.** *μ_u on V_{𝒞,H} for arbitrary 𝒞 (Definition 5.14, Theorem 5.15)* (RG.4/arbitrary-level-values); *Finite-index sublattices over Z_p[Γ] for p ∤ |Γ|* (RG.5/coprime-lattice-lemma); *The λ-invariants λ(𝒞, H, G)* (RG.3/lambda-invariants); *Homomorphisms out of 𝓕_n (Corollary 3.8, Corollary 3.10, finiteness)* (RG.1/free-admissible-universal-property); *Admissible Γ-groups: closure properties and the abelian criterion* (RG.0/admissible-gamma-groups); ArithmeticStatistics:ST.5/cohen-lenstra-measure; ArithmeticStatistics:ST.5/cohen-martinet-predicted-surjection-moment.

**Source.** LWZB, §7.1, pp. 34–35: Shows that for abelian levels the multiplicities are n·m_G and λ = 1, and that μ_u restricted to finite abelian |Γ|′-Γ-groups with trivial invariants is |Aut_Γ(H)|^{−1}|H|^{−u} times a product over non-trivial irreducible F_p[Γ]-modules, the Cohen–Lenstra–Martinet distribution for u = 1.

#### The p-covering group, p-multiplicator and nucleus

Declaration: ArithmeticStatisticsPartII:RG.5/p-covering-group. Kind: construction. Planet: p-covering group and nucleus. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/BostonBushHajir`, namespace `TauCeti.RandomGammaGroup`.

Let p be a prime and H a finite p-group with generator rank d = d(H) = dim_{F_p} H/Φ(H). For n ≥ d and a surjection ϖ : F → H from a free pro-p group of rank n with kernel N, put N* = N^p[N, F], F′ = F/N* and R′ = N/N* (LWZB (7.1)); R′ is elementary abelian and central in F′, and F′ is the largest quotient of F mapping onto H with kernel elementary abelian with trivial F′-action. For n = d, F′ is the p-covering group of H and R′ its p-multiplicator; r(H) = dim_{F_p} R′ = dim H²(H, F_p) is the relation rank, and for n ≥ d, dim R′ = r(H) + n − d. The lower p-central series is P_0(P) = P, P_{i+1}(P) = [P_i(P), P]·P_i(P)^p, Q_i(P) = P/P_i(P), and the p-class cl_p(H) is the least c with P_c(H) = 1. If cl_p(H) = c, the nucleus of H is P_c(F′) ≤ R′ and ν(H) = dim_{F_p} P_c(F′) is the nuclear rank. When a group Γ of order prime to p acts on H and ϖ is Γ-equivariant, N, N*, F′, R′ and P_c(F′) are Γ-stable and the constructions are Γ-equivariant; for 𝒞 the p-Γ-groups of p-class at most c, (𝓕_n)^𝒞 = Q_c((𝓕_n)_p).

**Hypotheses.** H a finite p-group; for the Γ-structure, p ∤ |Γ|.

**Construction or proof.**

1. N* is characteristic in N and normal in F, so F′ and R′ are well defined; R′ is elementary abelian and central because N^p[N, F] ⊇ N^p[N, N].
2. Independence of the presentation: two surjections from free pro-p groups of rank d differ by an automorphism of F (Gaschütz lifting of generators, tauceti:TauCetiRoadmap/ProfiniteProPGroups Layer 3), so F′ is unique up to isomorphism over H.
3. dim R′ = r(H) + n − d: R′ is dual to H¹(N, F_p)^F, which the five-term sequence and H²(F, F_p) = 0 identify with H¹(F, F_p)/inflation ⊕ H²(H, F_p) of dimension (n − d) + r(H) (ProfiniteProPGroups Layer 5, the H² interpretation).
4. The lower p-central series and p-class are ProfiniteProPGroups' pLowerCentralSeries; Q_c((𝓕_n)_p) is of level 𝒞 and universal for maps to p-groups of p-class ≤ c, which is (𝓕_n)^𝒞 (RG.1/level-completion).

**Uses.** LWZB Lemma 7.2: the fundamental sequence at a large p-level is (7.1); LWZB Theorem 7.4: m = r(H) − d(H) + n and λ = p^{r(H)−d(H)}; LWZB Theorem 7.5: the nuclear rank corrects the multiplicity at p-class c; Boston–Bush–Hajir measures: their formulas are expressed in d(H), r(H) and ν(H).

**API.**

- `pCoveringGroup` (data): F′ for a presentation of rank n ≥ d, with its map to H.
- `pMultiplicator` (data): R′ = N/N^p[N, F], an elementary abelian central subgroup of F′.
- `relationRank` (data): r(H) = dim_{F_p} R′ for n = d.
- `relationRank_eq_finrank_H2` (compatibility): r(H) = dim H²(H, F_p), ProfiniteProPGroups' relation rank of a finite p-group.
- `finrank_pMultiplicator` (relation): For a presentation of rank n ≥ d, dim R′ = r(H) + n − d.
- `pCoveringGroup_unique` (characterisation): F′ is unique up to isomorphism over H and is the largest quotient of F over H with elementary abelian kernel on which F′ acts trivially.
- `pClass` (data): cl_p(H), the length of the lower p-central series (ProfiniteProPGroups' pLowerCentralSeries).
- `nucleus` (data): P_c(F′) for c = cl_p(H), a subgroup of R′.
- `nuclearRank` (data): ν(H) = dim_{F_p} P_c(F′).
- `pCoveringGroup_equivariant` (functoriality): For Γ of order prime to p acting on H and on F compatibly, F′, R′ and the nucleus are Γ-stable.
- `levelCompletion_pClass` (compatibility): For 𝒞 the p-Γ-groups of p-class ≤ c, (𝓕_n)^𝒞 = Q_c((𝓕_n)_p).

**Unit tests.**

- `pCoveringGroup.test_cyclic` (computation): H = Z/p: d = 1, r = 1, the p-covering group is Z/p², the multiplicator and the nucleus are pZ/p² ≅ Z/p, cl_p = 1 and ν = 1.
- `pCoveringGroup.test_elementary` (computation): H = (Z/p)²: d = 2 and r = 3 = d(d + 1)/2.
- `pCoveringGroup.test_trivial` (degenerate): H = 1: d = r = 0 and F′ = 1.
- `pCoveringGroup.test_not_schur` (non-example): The p-multiplicator is not the Schur multiplier: for H = Z/p, H_2(H, Z) = 0 while R′ ≅ Z/p.
- `pCoveringGroup.test_H2` (compatibility): r(H) agrees with ProfiniteProPGroups' relation rank dim H²(H, F_p) for every finite p-group H.

**Acceptance.** For H = (Z/p)^d, r(H) = d(d + 1)/2, the sanity value in ProfiniteProPGroups Layer 5.

**Depends on.** tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation; tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations; *Level-𝒞 closure and the pro-𝒞 completion of a Γ-group* (RG.1/level-completion); `TauCeti.IsProP` (Tau Ceti).

**Source.** LWZB, §7.2.1, (7.1) and the paragraph before Theorem 7.4, pp. 34–35; §7.2.2, pp. 35–36: Defines N* = N^p[N, (𝓕_n)_p], R′, F′ and the sequence (7.1), names F′ the p-covering group, R′ the p-multiplicator (printed as 'p-multiplicator rank', source issue E14 here) with dimension the relation rank, and defines the lower p-central series, p-class, nucleus and nuclear rank. LW20, Lemma 12.5 with proof, p. 37: For a finite p-group H of generator rank d and S all finite p-groups, the multiplicity of Z/p with trivial action is r(H) at n = d and r(H) + n − d for n ≥ d, through the p-covering group.

#### The pro-p specialization: Boston–Bush–Hajir (Lemma 7.2, Theorem 7.4)

Declaration: ArithmeticStatisticsPartII:RG.5/boston-bush-hajir-pro-p. Kind: theorem. Planet: Boston–Bush–Hajir distribution (Theorem 7.4). Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/BostonBushHajir`, namespace `TauCeti.RandomGammaGroup`.

Let Γ = Z/2 = ⟨σ⟩, p an odd prime and u an integer. (Lemma 7.2) If H is an admissible p-Γ-group and ϖ : (𝓕_n)_p → H a Γ-surjection whose kernel is generated as a closed normal Γ-subgroup by the coordinates of Y(S) for a finite S, then for every finite set 𝒞 of p-Γ-groups with H of level 𝒞 the fundamental sequence is (F′)^𝒞 → H induced by (7.1), and for 𝒞 large enough it is (7.1). (Theorem 7.4) Let 𝒞 be the set of all finite p-Γ-groups and H a finite p-Γ-group. If H ≅ (𝓕_n)^𝒞/[Y(S)] for some n and some S with |S| = n + u, then μ_u(V_{𝒞,H}) = |Aut_Γ(H)|^{−1}|Y(H)|^{−u} ∏_{i ≥ 1+u+d(H)−r(H)} (1 − p^{−i}); otherwise μ_u(V_{𝒞,H}) = 0. For u = 0 and u = 1 these are the Boston–Bush–Hajir measures predicted for the p-class tower groups of imaginary and real quadratic fields.

**Hypotheses.** (SZ_Γ) holds (Γ = Z/2 is solvable); p odd.

**Construction or proof.**

1. Lemma 7.2: by the Y-generation of the kernel, σ acts by −1 on every irreducible factor G of R; as G is an irreducible p-group-module it is Z/p with trivial H-action, so F′ → H factors through F; conversely F → H factors through the largest level-𝒞 quotient of F′.
2. Theorem 7.4: by RG.4/arbitrary-level-values only G = Z/p (trivial H-action, σ = −1) has λ ≠ 0, with |Y(G)| = h_{H⋊Γ}(G) = p; m(𝒞, n, H, G) = r(H) − d(H) + n (Liu–Wood Lemma 12.5 with RG.5/p-covering-group), so λ = p^{r(H)−d(H)} by (4.17).
3. Then ∏_{i≥1}(1 − p^{r−d}p^{−i}p^{−u}) = ∏_{j≥1+u+d−r}(1 − p^{−j}); the vanishing case is the support statement of RG.4/arbitrary-level-values (H without Property E, equivalently not of the stated form by RG.1/property-e-criterion).
4. Agreement with Boston–Bush–Hajir: for u = 0 Boston–Wood Lemma 4.8, for u = 1 Boston–Bush–Hajir (2021), Theorem 2.22, with equality of supports from Boston–Bush–Hajir (2017), Lemma 2.7, and (2021), Lemma 2.8.

**Acceptance.** H = Z/3 (σ = −1), u = 1: d = r = 1 and μ_1(V_{𝒞,H}) = (1/6)∏_{i≥2}(1 − 3^{−i}) = μ_{3,1}(Z/3), consistent with RG.5/abelian-specialization because a cyclic 3-class group has trivial 3-class field tower beyond it. H = 1: μ_u(V_{𝒞,1}) = ∏_{i≥1+u}(1 − p^{−i}), the Cohen–Lenstra probability of a trivial p-part. H = F_3² with σ = −1 is not of the stated form (it lacks Property E), so μ_u(V_{𝒞,H}) = 0.

**Depends on.** *The p-covering group, p-multiplicator and nucleus* (RG.5/p-covering-group); *μ_u on V_{𝒞,H} for arbitrary 𝒞 (Definition 5.14, Theorem 5.15)* (RG.4/arbitrary-level-values); *The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G)* (RG.3/fundamental-exact-sequence); *The λ-invariants λ(𝒞, H, G)* (RG.3/lambda-invariants); *Property E as the shape of the relations (Proposition 3.13)* (RG.1/property-e-criterion).

**Source.** LWZB, Lemma 7.2, Remark 7.3 and Theorem 7.4 with proofs, pp. 35–36: Identifies the fundamental sequence at p-levels with the p-covering-group sequence and computes μ_u(V_{𝒞,H}) on pro-p completions for Γ = Z/2 through the multiplicity r(H) − d(H) + n. LW20, Lemma 12.5, p. 37: Supplies the multiplicity r(H) + n − d of the trivial module Z/p for p-groups.

#### The p-class-c specialization (Theorem 7.5)

Declaration: ArithmeticStatisticsPartII:RG.5/boston-bush-hajir-p-class. Kind: theorem. Planet: p-class-c distribution (Theorem 7.5). Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/BostonBushHajir`, namespace `TauCeti.RandomGammaGroup`.

Let Γ = Z/2, p odd, u an integer, c ≥ 1, and 𝒞 the set of finite p-Γ-groups of p-class at most c. For H of the form (𝓕_n)^𝒞/[Y(S)] with |S| = n + u: (1) if cl_p(H) < c then m(𝒞, n, H, G) = r(H) + n − d(H) and μ_u(V_{𝒞,H}) = |Aut_Γ(H)|^{−1}|Y(H)|^{−u} ∏_{i ≥ 1+u+d(H)−r(H)}(1 − p^{−i}); (2) if cl_p(H) = c then m(𝒞, n, H, G) = r(H) − ν(H) + n − d(H) and μ_u(V_{𝒞,H}) = |Aut_Γ(H)|^{−1}|Y(H)|^{−u} ∏_{i ≥ 1+u+d(H)+ν(H)−r(H)}(1 − p^{−i}). If H is not of this form, μ_u(V_{𝒞,H}) = 0. For u = 0, 1 these are the Boston–Bush–Hajir measures on p-class-c quotients.

**Hypotheses.** Γ = Z/2; p odd; c ≥ 1.

**Construction or proof.**

1. (𝓕_n)^𝒞 = Q_c((𝓕_n)_p) (RG.5/p-covering-group).
2. If cl_p(H) < c, P_c(F′) = 1 because P_{c−1}(F′) lies in the elementary abelian central kernel; so F′ is of p-class ≤ c and the fundamental sequence is (7.1) (Remark 7.3).
3. If cl_p(H) = c, P_c((𝓕_n)_p) ≤ N and the fundamental sequence is F′/P_c(F′) → H with kernel R′/P_c(F′), of dimension r(H) − ν(H) + n − d(H).
4. Insert the multiplicities into RG.4/arbitrary-level-values as in Theorem 7.4.

**Acceptance.** c = 1: the p-class-1 groups are the elementary abelian p-Γ-groups; for H = F_p^d (σ = −1), ν(H) = r(H) and μ_u(V_{𝒞,H}) = |GL_d(F_p)|^{−1}p^{−du}∏_{i≥1+u+d}(1 − p^{−i}), the Cohen–Lenstra probability that the p-rank is d.

**Depends on.** *The pro-p specialization: Boston–Bush–Hajir (Lemma 7.2, Theorem 7.4)* (RG.5/boston-bush-hajir-pro-p); *The p-covering group, p-multiplicator and nucleus* (RG.5/p-covering-group); *μ_u on V_{𝒞,H} for arbitrary 𝒞 (Definition 5.14, Theorem 5.15)* (RG.4/arbitrary-level-values).

**Source.** LWZB, §7.2.2 and Theorem 7.5, pp. 35–36: Computes μ_u on p-Γ-groups of p-class at most c, with the nuclear rank correcting the multiplicity when the p-class of H is exactly c, and identifies the u = 0, 1 cases with the Boston–Bush–Hajir measures.

### RG.6. The arithmetic interface: the conjecture and p-class towers

**Targets.**
- *Conjecture 1.3*, as a proposition: for Q = Q or F_q(t) (q prime to |Γ|), Δ = 2|Γ| or q(q−1)|Γ|, and finite 𝒞 of Γ-groups of order prime to Δ, the totally real Γ-extensions ordered by radical discriminant have Gal(K^#/K)^𝒞 ≅ H^𝒞 with frequency μ_Γ(U_{𝒞,H}), and average |Sur_Γ(Gal(K^#/K), H)| equal to [H : H^Γ]^{−1}.
- *Consistency*: Gal(K^#/K)^𝒞 is a finite admissible Γ-group with Property E at level 𝒞, the support condition of μ_Γ; the abelian part is the Cohen–Lenstra–Martinet prediction for the prime-to-Δ class group.
- *Function-field moments*: ArithmeticStatistics:ST.5's form of LWZB Theorem 1.4 identifies the q → ∞ moments with the μ_Γ-moments of RG.5.
- *p-class towers in the model (Lemma 3.17, Proposition 3.22)*: for p ∤ Δ with μ_p ⊄ K and n large, the maximal pro-p quotient of Gal(K^#/K) is (𝓕_n)_p/[Y(S)] with |S| = n + 1.

**Imports.** Gal(K^#/K) as an admissible Γ-group with Property E: InverseGaloisAndArithmeticFundamentalGroups:IG.4; the H² bound for the maximal unramified pro-p extension and the Galois structure of units mod p: ArithmeticGaloisDuality:R02.3; class field theory: tauceti:TauCetiRoadmap/ClassFieldTheory and FunctionFieldArithmetic:FA.4.

**Acceptance.** The conjecture's abelian specialization for Γ = Z/2 is the real-quadratic Cohen–Lenstra prediction; the q → ∞ moment of ST.5 equals ∫|Sur_Γ(X, H)| dμ_Γ.

Layer dependencies: ArithmeticStatisticsPartII:RG.5, InverseGaloisAndArithmeticFundamentalGroups:IG.4, ArithmeticGaloisDuality:R02.3, ArithmeticStatistics:ST.5, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

#### The Liu–Wood–Zureick-Brown conjecture (Conjecture 1.3), as a proposition

Declaration: ArithmeticStatisticsPartII:RG.6/lwzb-conjecture. Kind: definition. Planet: Liu–Wood–Zureick-Brown conjecture. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Conjecture`, namespace `TauCeti.RandomGammaGroup`.

Let Q be Q, or F_q(t) with q prime to |Γ|, and Δ = 2|Γ| for Q = Q, Δ = q(q − 1)|Γ| for Q = F_q(t). A Γ-extension K/Q is a Galois extension with an identification Gal(K/Q) ≅ Γ; it is totally real when it is split completely above ∞. K^# is the maximal extension of K unramified everywhere, split completely above ∞, all of whose finite subextensions have degree prime to Δ; Gal(K^#/K) is an admissible Γ-group through a Schur–Zassenhaus section, well defined up to isomorphism (InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-gamma-groups, under (SZ_Γ)). rDisc(K) is the norm of the radical of the discriminant ideal of K/Q, and E_Γ(D, Q) the finite set of isomorphism classes of totally real Γ-extensions with rDisc(K) = D. LWZBConjecture(Γ, Q) is the proposition: for every finite set 𝒞 of finite Γ-groups of order prime to Δ and every finite admissible Γ-group H of order prime to Δ, (i) Σ_{D≤B} #{K ∈ E_Γ(D, Q) : Gal(K^#/K)^𝒞 ≅ H^𝒞} / Σ_{D≤B} |E_Γ(D, Q)| → μ_Γ(U_{𝒞,H^𝒞}) as B → ∞, and (ii) Σ_{D≤B} Σ_{K∈E_Γ(D,Q)} |Sur_Γ(Gal(K^#/K), H)| / Σ_{D≤B} |E_Γ(D, Q)| → ∫|Sur_Γ(X, H)| dμ_Γ = [H : H^Γ]^{−1}. It is recorded as a proposition and never assumed.

**Hypotheses.** (SZ_Γ) for the Γ-action on Gal(K^#/K) and for μ_Γ; q prime to |Γ| in the function-field case.

**Construction or proof.**

1. E_Γ(D, Q) is finite: the discriminant of K/Q is bounded in terms of D and |Γ|, and Hermite's theorem (Mathlib's NumberField.finite_of_discr_bdd) or its function-field analogue applies.
2. Gal(K^#/K)^𝒞 is finite for finite 𝒞 (RG.6/conjecture-consistency), so the counts in (i) are counts of finitely many conditions.
3. The right sides are μ_Γ of a basic open (RG.4/weak-convergence) and the moment of RG.5/moments; both statements are propositions about limits of explicit finite averages.

**Uses.** ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments: proves form (ii) over F_q(t) in the iterated limit q → ∞ then b → ∞; LWZB §1.2–1.3: it implies the Cohen–Martinet and Boston–Bush–Hajir predictions; RG.6/conjecture-consistency: the Galois groups lie in the support of μ_Γ; RG.6/function-field-moment-comparison: the proven function-field moments equal the μ_Γ-moments.

**API.**

- `LWZBConjecture` (data): The proposition LWZBConjecture(Γ, Q), the conjunction of (i) and (ii) over all admissible test data.
- `LWZBConjecture.basicOpen` (projection): Form (i) for given (𝒞, H).
- `LWZBConjecture.moment` (projection): Form (ii) for given H.
- `totallyRealFamily` (data): E_Γ(D, Q), the totally real Γ-extensions of Q with radical discriminant norm D.
- `finite_totallyRealFamily` (other): E_Γ(D, Q) is finite (Hermite).
- `LWZBConjecture.abelian` (relation): Form (i) at abelian levels is the Cohen–Lenstra–Martinet prediction (u = 1) for the prime-to-Δ class groups of totally real Γ-fields ordered by radical discriminant.
- `LWZBConjecture.bostonBushHajir` (relation): For Γ = Z/2 and Q = Q, form (i) at p-levels is the Boston–Bush–Hajir prediction for the p-class tower groups of real quadratic fields.

**Unit tests.**

- `LWZBConjecture.test_trivial_H` (degenerate): For H = 1, (ii) is the identity 1 = 1 (|Sur_Γ(X, 1)| = 1).
- `LWZBConjecture.test_real_quadratic` (computation): Γ = Z/2, Q = Q, H = Z/3 with σ = −1: (ii) predicts that the average of |Sur(Cl(K)[3^∞], Z/3)| over real quadratic K ordered by radical discriminant is 1/3, i.e. the average of |Cl(K)[3]| is 4/3.
- `LWZBConjecture.test_cohen_martinet` (compatibility): At abelian levels, (ii) is ArithmeticStatistics:ST.5/cohen-martinet-surjection-moment-conjecture for totally real fields (every σ_v = 1, moment |H|^{−1}), with fields ordered by radical discriminant instead of discriminant.
- `LWZBConjecture.test_ordering` (non-example): The proposition with E_Γ ordered by discriminant instead of radical discriminant is a different statement, and its abelian part is known to fail for Z/4-fields (Bartel–Lenstra); the ordering is part of the definition.

**Acceptance.** The proposition is well formed for every finite Γ; it is consistent with the support of μ_Γ (RG.6/conjecture-consistency).

**Depends on.** InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-gamma-groups; *Convergence of the random Γ-groups (Theorem 1.2)* (RG.4/weak-convergence); *The moments of μ_u (Theorem 6.2)* (RG.5/moments); `NumberField.finite_of_discr_bdd` (Mathlib).

**Source.** LWZB, §1.2, pp. 2–3, the definitions before Conjecture 1.3 and Conjecture 1.3: Defines Δ, K^#, totally real Γ-extensions, the radical discriminant and E_Γ(D, Q), and conjectures that the Gal(K^#/K) are equidistributed for μ_Γ when fields are ordered by radical discriminant, in the two test-function forms (i) and (ii). LWZB, §1.6, p. 9: Explains the choice of the radical discriminant and of finitely many primes, and why roots of unity of the base field are avoided.

#### The Galois groups lie in the support of μ_Γ

Declaration: ArithmeticStatisticsPartII:RG.6/conjecture-consistency. Kind: theorem. Planet: Consistency with the Galois side. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Conjecture`, namespace `TauCeti.RandomGammaGroup`.

Assume (SZ_Γ). Let K/Q be a Γ-extension (Q = Q or F_q(t)) and 𝒞 a finite set of finite Γ-groups of order prime to Δ. (a) Gal(K^#/K)^𝒞 is a finite admissible Γ-group with Property E at level 𝒞, and the class of Gal(K^#/K) lies in 𝒫. (b) μ_Γ(U_{𝒞,H}) = 0 unless H is admissible with Property E at level 𝒞, so form (i) of the conjecture predicts positive frequency only for groups the Galois side allows. (c) Gal(K^#/K)^ab is the prime-to-Δ part of the class group (Cl(O_K) for Q = Q; the prime-to-q(q−1)|Γ| part of Cl(O_K), O_K the integral closure of F_q[t], for Q = F_q(t)); hence at abelian levels form (i) is the Cohen–Lenstra–Martinet prediction with u = 1 (RG.5/abelian-specialization).

**Hypotheses.** (SZ_Γ); K a Γ-extension of Q or F_q(t).

**Construction or proof.**

1. (a) Admissibility is LWZB Proposition 2.2 and Property E for Δ′-Γ-groups is Theorem 2.5 (InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-gamma-groups and IG.4/unramified-property-e); RG.1/property-e-at-level (b) passes Property E to the level-𝒞 completion.
2. Finiteness of Gal(K^#/K)^𝒞: K has finitely many unramified extensions of bounded degree (Hermite), so finitely many Γ-maps to the members of 𝒞, and the intersection of their kernels has finite index; this places the class in 𝒫.
3. (b) is the support clause of RG.4/weak-convergence.
4. (c) is class field theory: the maximal unramified abelian extension split completely at the infinite places is the Hilbert class field (tauceti:TauCetiRoadmap/ClassFieldTheory Layer 12) or, over F_q(t), the extension with Galois group Cl(O_K) (FunctionFieldArithmetic:FA.4); restrict to the prime-to-Δ part.

**Acceptance.** For Γ = Z/2 and Q = Q, Gal(K^#/K)^ab is the odd part of the class group of the real quadratic field K, and its abelian level-3 predictions are the u = 1 Cohen–Lenstra probabilities. For Γ = Z/2, p = 3 and H = F_3² with σ = −1 at 3-class ≤ 2, no real quadratic K has Gal(K^#/K)^𝒞 ≅ H, consistently with μ_Γ(U_{𝒞,H}) = 0.

**Depends on.** InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-gamma-groups; InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-property-e; *Property E relative to a level: restriction and completion* (RG.1/property-e-at-level); *Convergence of the random Γ-groups (Theorem 1.2)* (RG.4/weak-convergence); *The abelianization: the Cohen–Lenstra–Martinet distribution (§7.1)* (RG.5/abelian-specialization); *The Liu–Wood–Zureick-Brown conjecture (Conjecture 1.3), as a proposition* (RG.6/lwzb-conjecture); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; FunctionFieldArithmetic:FA.4; `NumberField.finite_of_discr_bdd` (Mathlib).

**Source.** LWZB, §2, Proposition 2.2 and Theorem 2.5, pp. 10–13: Proves that Gal(K^#/K) is admissible and has Property E in the category of Δ′-Γ-groups, the two facts the model is built to respect. LWZB, §1.2, p. 3, and §1.5, p. 6: Notes that Gal(K^#/K)^ab is the prime-to-Δ part of the class group by class field theory, and that Gal(K^un/K)^𝒞 is a finite admissible Γ-group for finite 𝒞.

#### Function-field moments agree with the moments of μ_Γ

Declaration: ArithmeticStatisticsPartII:RG.6/function-field-moment-comparison. Kind: comparison. Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Conjecture`, namespace `TauCeti.RandomGammaGroup`.

Assume (SZ_Γ). Let H be a finite admissible Γ-group and q range over prime powers with gcd(q, |Γ||H|) = 1 and gcd(q − 1, |H|) = 1. The function-field moment theorem ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments gives lim_{b→∞} limsup_{q→∞} R_b(q) = lim_{b→∞} liminf_{q→∞} R_b(q) = [H : H^Γ]^{−1} for the averages R_b(q) of |Sur_Γ(Gal(K^#/K), H)| over E_Γ(q^n, F_q(t)), n ≤ b. By RG.5/moments this common value is ∫|Sur_Γ(X, H)| dμ_Γ(X). Hence form (ii) of the conjecture holds over F_q(t) in the iterated limit, q → ∞ first, for every such H; for abelian H with H^Γ = 1 this is the Cohen–Lenstra–Martinet moment |H|^{−1} of ArithmeticStatistics:ST.5/cohen-lenstra-martinet-moments-over-function-fields.

**Hypotheses.** (SZ_Γ) (ST.5 states the moment theorem under the same hypothesis); the coprimality conditions on q.

**Construction or proof.**

1. Read the right side of the ST.5 theorem, [H : H^Γ]^{−1}.
2. Identify it with the μ_Γ-moment by RG.5/moments with u = 1.
3. The inner limit in q is read with lim sup and lim inf, because the existence of lim_{q→∞} R_b(q) is not proved (ST.5 records this).

**Acceptance.** Γ = Z/2, H = Z/3 with σ = −1: the iterated function-field average of |Sur(Cl(O_K), Z/3)| is 1/3 = ∫|Sur_Γ(X, Z/3)|dμ_Γ. The comparison is an identity of numbers; it asserts nothing about the number-field case of the conjecture.

**Depends on.** ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments; ArithmeticStatistics:ST.5/cohen-lenstra-martinet-moments-over-function-fields; *The moments of μ_u (Theorem 6.2)* (RG.5/moments); *The Liu–Wood–Zureick-Brown conjecture (Conjecture 1.3), as a proposition* (RG.6/lwzb-conjecture).

**Source.** LWZB, Theorem 1.4 and Corollary 1.5, pp. 3–4: States that the q → ∞ function-field moments of Gal(K^#/K) are the μ_Γ-moments [H : H^Γ]^{−1}, with the class-group corollary |H|^{−1}; ArithmeticStatistics ST.5 owns the proof and records the lim sup/lim inf reading.

#### p-class tower groups occur in the model (Lemma 3.17, Proposition 3.22)

Declaration: ArithmeticStatisticsPartII:RG.6/p-class-tower-in-model. Kind: theorem. Planet: p-class towers in the model (Proposition 3.22). Proposed module: `TauCeti/NumberTheory/ArithmeticStatistics/RandomGammaGroups/Conjecture`, namespace `TauCeti.RandomGammaGroup`.

Assume (SZ_Γ). Let K/Q be a Γ-extension (Q = Q or F_q(t)) and p ∤ Δ a prime with μ_p ⊄ K. Let G_{K,p} be the maximal pro-p quotient of Gal(K^#/K) (the Galois group of the maximal unramified pro-p extension of K split completely above ∞) and G̃_{K,p} the Galois group of the maximal unramified pro-p extension of K. (Lemma 3.17) For the presentations ρ : F → G̃_{K,p} of §3.3 (F = (F_n)_p over Q, F = (F_{n+1})_p over F_q(t), the extra generator mapping to a decomposition group at an infinite place), N = ker ρ and N* = [N, F]N^p, there is an F_p[Γ]-surjection F_p[Γ]^{n+1} → N/N*. (Proposition 3.22) If n is so large that G_{K,p} = [Y({h_1, …, h_n})] for some h_i ∈ G_{K,p}, then G_{K,p} ≅ (𝓕_n)_p/[Y(S)] for a subset S ⊆ (𝓕_n)_p with |S| = n + 1. So every p-class tower group of a totally real Γ-field is of the shape of the random groups X_{1,n}.

**Hypotheses.** (SZ_Γ); p ∤ Δ; μ_p ⊄ K.

**Construction or proof.**

1. G_{K,p} is finitely presented and admissible (Koch, Chapter 11; IG.4/unramified-gamma-groups), so the h_i exist for n large.
2. Lemma 3.17: by the five-term sequence (tauceti:TauCetiRoadmap/ProfiniteCohomology Layer 5) and H²(F, F_p) = 0 for free pro-p F (ProfiniteProPGroups Layer 5), (N/N*)^∨ = H¹(N, F_p)^F is an extension of H²(G̃_{K,p}, F_p) by the image of restriction, which is (N/(N ∩ Φ(F)))^∨; F_p[Γ] is semisimple, so it splits.
3. H²(G̃_{K,p}, F_p) embeds into (V/K^{×p})^∨ (Koch, Theorem 11.3; requested from ArithmeticGaloisDuality:R02.3), and V/K^{×p} is an extension of Cl(O_K)[p] by O_K^×/O_K^{×p}, which embeds in F_p[Γ]/(Σg) (Neukirch–Schmidt–Wingberg, Corollary 8.7.3; same request). Counting F_p[Γ]-ranks gives the surjection from F_p[Γ]^{n+1}. In the function-field case the units and class group must be those of the complete curve C_K (constant units, Pic(C_K)), because O_K^× is not F_{q^r}^× for totally real K with Γ ≠ 1 (source issue E15 here).
4. Proposition 3.22: G_{K,p} has Property E for pro-p Γ-groups (Theorem 2.5 with RG.1/property-e-at-level (c)), so R = ker ϖ = [Y(R)] by RG.1/property-e-criterion and (R/R*)^Γ = 0; the surjection of Lemma 3.17 then factors through (F_p[Γ]/(Σg))^{n+1} → R/R*, which is Γ-generated by Y-coordinates of n + 1 elements; lift them to S ⊆ R (generation theory: elements generate R as a closed normal subgroup iff their images generate R/R*, ProfiniteProPGroups Layer 5).

**Acceptance.** For Γ = Z/2, Q = Q and p odd with K real quadratic, the 3-class tower group of K is a quotient of (𝓕_n)_3 ≅ the free pro-3 group of rank n (σ inverting the generators) by n + 1 Y-relations. The conclusion is about the shape of G_{K,p}; it does not assert that G_{K,p} is finite.

**Depends on.** InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-gamma-groups; InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-property-e; *Property E relative to a level: restriction and completion* (RG.1/property-e-at-level); *Property E as the shape of the relations (Proposition 3.13)* (RG.1/property-e-criterion); *The free admissible Γ-group 𝓕_n (Lemma 3.1, Remark 3.2)* (RG.1/free-admissible-gamma-group); tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences; ArithmeticGaloisDuality:R02.3; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; FunctionFieldArithmetic:FA.4.

**Source.** LWZB, §3.3, Lemma 3.17 and Proposition 3.22 with proofs, pp. 17–20: Shows, through the Hochschild–Serre sequence, Koch's bound for H² of the maximal unramified pro-p extension and the Galois structure of the units, that N/N* is an F_p[Γ]-quotient of F_p[Γ]^{n+1}, and deduces from Property E that the p-class tower group is (𝓕_n)_p modulo n + 1 Y-relations.

## Dependencies on other roadmaps

- **InverseGaloisAndArithmeticFundamentalGroups:IG.4/property-e.** State Property E for an arbitrary full subcategory 𝒦 of Γ-groups closed under isomorphism (LWZB Definition 2.3): H ∈ 𝒦 has Property E for 𝒦 if every Γ-surjection H → G lifts to a Γ-surjection H → G̃ along every non-split central extension 1 → Z/p → G̃ → G → 1 in 𝒦 with trivial Γ-action on Z/p; the pro-Δ′ Γ-groups are one instance. The uses here take 𝒦 = Γ-groups of level 𝒞 and 𝒦 = pro-p Γ-groups. Needed by: *Property E relative to a level: restriction and completion* (RG.1/property-e-at-level), *Property E as the shape of the relations (Proposition 3.13)* (RG.1/property-e-criterion).
- **InverseGaloisAndArithmeticFundamentalGroups:IG.4/coprime-profinite-complements.** Record that conjugacy of complements in the finite and profinite Schur–Zassenhaus theorem holds without further input when the normal subgroup or the quotient is (pro)solvable, and in general rests on the Feit–Thompson theorem; state the conjugacy half with that hypothesis (or an imported Feit–Thompson) so that consumers can track it. The consumers here use it as the hypothesis (SZ_Γ) of RG.0/coprime-conjugacy-hypothesis. Needed by: *The coprime conjugacy hypothesis (SZ)* (RG.0/coprime-conjugacy-hypothesis), *Sections of G ⋊ Γ and the fibres of Y (Lemmas 3.4–3.6)* (RG.0/sections-and-y).
- **tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations.** Inverse limits of finite discrete quotients of profinite groups, closed normal subgroups and quotients, and compactness of inverse limits of non-empty finite sets (used for level-𝒞 completions and the level-tower injectivity of 𝒫). Needed by: *Level-𝒞 closure and the pro-𝒞 completion of a Γ-group* (RG.1/level-completion), *The space 𝒫 of admissible Γ-groups* (RG.2/space-of-admissible-gamma-groups).
- **tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index.** The supernatural order TauCeti.profiniteOrder and its behaviour under closed subgroups, quotients and finite products, to define pro-n′ Γ-groups. Needed by: *Γ-groups and their equivariant maps* (RG.0/gamma-group).
- **tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets.** The free pro-C group on a finite set for C the (extension-closed) class of finite groups of order prime to a fixed integer, with its universal property and functoriality in the generating set (so that a permutation of the basis induces an automorphism); and the free pro-p group on a finite set. Tau Ceti's main branch has TauCeti.freeProC; the pinned commit f790474 does not. Needed by: *The free pro-|Γ|′ Γ-group F_n(Γ)* (RG.1/free-gamma-group).
- **tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation.** The lower p-central series (pLowerCentralSeries), the Frattini subgroup and generator rank d(G) = dim G/Φ(G), and Gaschütz lifting of generating tuples for pro-p groups. Needed by: *The p-covering group, p-multiplicator and nucleus* (RG.5/p-covering-group).
- **tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations.** Presentations of finitely generated pro-p groups: H²(F, F_p) = 0 for free pro-p F; for 1 → R → F → G → 1, elements of R generate it as a closed normal subgroup iff their images generate R/R^p[R, F], which is dual to H¹(R, F_p)^F; and r(G) = dim H²(G, F_p) for finite p-groups, with dim R/R^p[R, F] = r(G) + rank F − d(G). Needed by: *The p-covering group, p-multiplicator and nucleus* (RG.5/p-covering-group), *p-class tower groups occur in the model (Lemma 3.17, Proposition 3.22)* (RG.6/p-class-tower-in-model).
- **tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences.** The five-term inflation–restriction exact sequence 0 → H¹(G/N) → H¹(G) → H¹(N)^G → H²(G/N) → H²(G) for a closed normal subgroup N of a profinite group with F_p-coefficients, natural with respect to a finite group acting compatibly on G and N. Needed by: *p-class tower groups occur in the model (Lemma 3.17, Proposition 3.22)* (RG.6/p-class-tower-in-model).
- **ArithmeticGaloisDuality:R02.3.** (a) Koch, Galois Theory of p-Extensions, Theorem 11.3 for S = ∅: for a number field K and the Galois group G̃ of its maximal unramified pro-p extension, an injection H²(G̃, F_p) ↪ (V/K^{×p})^∨ with V = {α ∈ K^× : (α) = 𝔞^p}, equivariant for automorphisms of K; and its function-field analogue for the complete curve. (b) Neukirch–Schmidt–Wingberg, Corollary 8.7.3: for K/Q Galois with group Γ, K totally real, p ∤ |Γ| and μ_p ⊄ K, an F_p[Γ]-injection O_K^×/O_K^{×p} ↪ F_p[Γ]/(Σ_g g). Needed by: *p-class tower groups occur in the model (Lemma 3.17, Proposition 3.22)* (RG.6/p-class-tower-in-model).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.** For a number field K, the Galois group of the maximal unramified abelian extension in which every infinite place splits completely is Cl(O_K) (the Hilbert class field), equivariantly for automorphisms of K over Q. Needed by: *The Galois groups lie in the support of μ_Γ* (RG.6/conjecture-consistency), *p-class tower groups occur in the model (Lemma 3.17, Proposition 3.22)* (RG.6/p-class-tower-in-model).
- **FunctionFieldArithmetic:FA.4.** For a finite extension K/F_q(t) with O_K the integral closure of F_q[t], the Galois group of the maximal unramified abelian extension split completely above ∞ is Cl(O_K), and the maximal unramified abelian extension corresponds to Pic(C_K) (C_K the complete curve), equivariantly for automorphisms over F_q(t). Needed by: *The Galois groups lie in the support of μ_Γ* (RG.6/conjecture-consistency), *p-class tower groups occur in the model (Lemma 3.17, Proposition 3.22)* (RG.6/p-class-tower-in-model).

## Gaps

- **Conjugacy of coprime complements for non-solvable Γ (the Feit–Thompson theorem).** Every statement from RG.0/sections-and-y onward carries the hypothesis (SZ_Γ) of RG.0/coprime-conjugacy-hypothesis. It is proved here for solvable Γ (which covers every Γ in the tests: Z/2, Z/4, (Z/2)², D_8, S_3) and for abelian kernels, and in general it is equivalent to the conjugacy half of the Schur–Zassenhaus theorem, whose proof for arbitrary coprime orders uses the Feit–Thompson odd-order theorem. Neither Mathlib nor Tau Ceti at the pins has Feit–Thompson, and no atlas layer plans it (Tau Ceti's CFSGStatement roadmap does not state it). The same gap is recorded by ArithmeticStatistics ST.5 for LWZB Lemma 9.3 and Theorem 1.4. Owner: a foundational finite-group-theory roadmap; once it exists, (SZ_Γ) becomes a theorem for every finite Γ and the hypothesis can be dropped from the statements here.

## Source issues

Mistakes found in the sources, stated at their locators in arXiv v2 of Liu–Wood–Zureick-Brown; the statements above use the corrections.

- **E1 (error, Corollary 3.8, p. 14; Remark 3.2(3), p. 13; the paragraph after (3.3), p. 14 (arXiv v2)).** The bijection Y(G)^n ≅ Hom_Γ(𝓕_n, G), the quotient statement of Remark 3.2(3) and the identification of Y(G) with sections are asserted for every Γ-group G. Correction: Assume G pro-|Γ|′ (a |Γ|′-Γ-group), as the proofs require. Reason: For Γ = Z/2 acting on Z/4 by inversion, |Y(Z/4)| = 2 but Hom_Γ(𝓕_1, Z/4) is trivial because 𝓕_1 is pro-odd. Reach: a stated result.
- **E2 (misprint, Proof of Lemma 3.6(3), p. 14 (arXiv v2)).** The translating map is written with γ_d^{−1}(g) in its last coordinate. Correction: Read γ_d(g)^{−1}, matching the other coordinates γ_i(g)^{−1}. Reason: Only γ_i(g)^{−1} makes the map carry Y(G) to itself and π^{−1}(x) onto N^d. Reach: nothing.
- **E3 (gap, Proof of Proposition 3.13 (⇒), p. 16 (arXiv v2)).** Applies Lemma 3.6(2), a statement about finite groups, to the kernel of ϖ, which is infinite when 𝒞 is infinite. Correction: Argue by containment: Y(ker φ) ⊆ Y((𝓕_n)^𝒞) ∩ (ker ϖ)^d = Y(ker ϖ) by Lemma 3.4, and Y(ker ϖ) ⊆ (ker ρ)^d because Γ acts trivially on ker ϖ/ker ρ ≅ Z/p. Reason: Lemma 3.6 is proved only for finite groups; the containment argument needs only Lemma 3.4. Reach: the proof.
- **E4 (misprint, §5.2, definition of 𝒞_ℓ, p. 27 (arXiv v2)).** 𝒞_ℓ is defined as the set of all Γ-groups of order at most ℓ. Correction: Take the |Γ|′-Γ-groups of order at most ℓ, as the basic opens and Lemma 5.4 require. Reason: The basic opens U_{𝒞,H} are defined only for sets of finite |Γ|′-Γ-groups. Reach: nothing.
- **E5 (misprint, Definition of ν before Lemma 4.6, p. 22 (arXiv v2)).** The Möbius recursion sets ν(D, E) = −Σ ν(D′, E) over all D′ in the poset with D′ ≠ D. Correction: Sum over D ⊊ D′ ⊆ E. Reason: For E = F_3² over H = 1 (Γ = Z/2, σ = −1) the printed recursion is circular on the four lines; the corrected one gives ν = −1 on lines and ν(0, E) = 3. Reach: nothing.
- **E6 (error, Theorem 4.12, (4.14), p. 24; (5.13), p. 30; Theorem 5.15, p. 31 (arXiv v2)).** The limiting formulas are stated for every finite admissible H of level 𝒞, with no Property E hypothesis. Correction: Assume H has Property E at level 𝒞; otherwise the probabilities (4.13) vanish for every n and the limits are 0. Reason: Without Property E a trivial-action Z/p in 𝒜_H has m = 1 for all n, so (4.17) fails (h^m|Y(G)|^{−n} = 1 + λ). Example: Γ = Z/2, p = 3, 𝒞 the 3-Γ-groups of 3-class ≤ 2, H = F_3² with σ = −1: λ = 1 for Z/3 with σ = −1 and λ = 2 for the trivial Z/3, and the printed (4.14) at u = 0 is (1/48)∏(1 − 3^{−i})∏(1 − 2·3^{−i}) ≈ 2.698·10^{−3} (recomputed here), while the true value is 0 and the paper's own Theorem 7.4 gives 0. Reach: a stated result.
- **E7 (gap, Lemma 5.10 and its proof, p. 29 (arXiv v2)).** The proof bounds f_n(H, ℓ) below for n ≥ i(H) using Corollary 5.9 for every H with f_n(H, ℓ) > 0 for some n. Correction: Add the hypothesis that f_n(H, ℓ) > 0 implies f_{n′}(H, ℓ) > 0 for n′ ≥ n; it holds in both applications. Reason: Corollary 5.9 gives the dichotomy 'zero or ≥ c' for each n separately; without monotone positivity a function could vanish at infinitely many n and the domination step does not follow. Reach: the proof.
- **E8 (misprint, Lemma 5.4, (5.6), p. 27 (arXiv v2)).** The set counted has kernel 'irred. E-group'. Correction: Read: ker π is an irreducible E ⋊ Γ-group, as in the definition of 𝓔(G, H). Reason: The non-abelian sets 𝓔(G, H) before Proposition 4.7 use irreducibility as an E ⋊ Γ-group. Reach: nothing.
- **E9 (gap, Theorem 5.12, p. 30 (arXiv v2)).** Countable additivity of μ_u is stated for integers u ≥ 0. Correction: It holds for every integer u (with X_{u,n} defined for n > −u); Theorems 5.15, 6.2 and 7.4–7.5 use it for all u. Reason: The proof (Lemma 5.10 with f_n = μ_{u,n}(U_{𝒞_ℓ,H})) never uses u ≥ 0; Corollary 5.9 needs only u > −n. Reach: a stated result.
- **E10 (misprint, §5.3, proof of Theorem 1.2, p. 30 (arXiv v2)).** The Fatou step is written μ_Γ(U) ≤ lim_n μ_{1,n}(U). Correction: Read lim inf. Reason: The limit of μ_{1,n}(U) for a general open U is not known to exist; Fatou gives lim inf, which is what the Portmanteau criterion needs. Reach: nothing.
- **E11 (misprint, Proof of Proposition 4.3, p. 21 (arXiv v2)).** The proof writes 𝓕_n for 𝓕_{n+u}, Y[(…)] for [Y(…)], and 'γ ∈ F ⋊ Γ' where the F ⋊ Γ-subgroup generated by the y_i^{−1}γ(y_i), γ ∈ Γ, is meant. Correction: Use 𝓕_{n+u}, [Y(…)] and the generated F ⋊ Γ-subgroup. Reason: There are n + u random elements, giving maps from 𝓕_{n+u}. Reach: nothing.
- **E12 (misprint, Proof of Theorem 4.12, p. 25 (arXiv v2)).** The proof refers to 'the fundamental exact sequence (7.1)'. Correction: Refer to (4.1). Reason: (7.1) is the p-covering-group sequence of §7.2. Reach: nothing.
- **E13 (misprint, §7.1, p. 34 (arXiv v2)).** The pro-p abelian completion of 𝓕_n is written (Z_p[Γ])^n. Correction: It is (Z_p[Γ]/(Σ_g g))^n, by Corollary 3.10. Reason: (Z_p[Γ])^n has Γ-invariants Z_p^n, while (𝓕_n^ab)^Γ = 0; the lattice argument is unaffected. Reach: nothing.
- **E14 (misprint, Paragraph before Theorem 7.4, p. 35 (arXiv v2)).** R′ is called the 'p-multiplicator rank' of H. Correction: R′ is the p-multiplicator; its F_p-dimension is the relation rank r(H). Reason: The next clause gives dim R′ = r(H), so R′ itself is the group. Reach: nothing.
- **E15 (error, Proof of Lemma 3.17, function-field case, p. 19 (arXiv v2)).** The proof uses O_K^× = F_{q^r}^× (the constant field units) for the function field K. Correction: For totally real K with Γ ≠ 1, O_K^× (O_K the integral closure of F_q[t]) has rank |Γ| − 1; the bound must be run with the complete curve C_K (constant units, Pic(C_K)) for the maximal unramified pro-p extension. Reason: K is split completely above ∞, so |Γ| places lie over ∞ and Dirichlet's S-unit theorem gives units of rank |Γ| − 1. Reach: the proof.

## Structure

- **Split** (ArithmeticStatisticsPartII, ArithmeticStatisticsPartIIRandomPolynomials, ArithmeticStatisticsPartIISchinzelAverages, ArithmeticStatisticsPartIISmithMethod). The design job for ArithmeticStatisticsPartII groups four paper routes that share only their parent ArithmeticStatistics: random Γ-groups (Liu–Wood–Zureick-Brown, Invent. Math. 2024), irreducibility of random polynomials of growing degree (Bary-Soroker–Koukoulopoulos–Kozma, Invent. Math. 2023), Schinzel's hypothesis on average over coefficient boxes (Skorobogatov–Sofos, Invent. Math. 2023) and Smith's method for 2^∞-class groups with Stevenhagen's conjecture (Koymans–Pagano, Acta Math.). Their objects (profinite Γ-groups and measures on them; random polynomials and their Galois groups; sieve and circle-method averages of prime values; governing fields, Rédei matrices and additive systems) and their suppliers are disjoint, so one roadmap would have no coherent layer order. This roadmap plans the first route only (layers RG.0–RG.6, random Γ-groups and the nonabelian Cohen–Lenstra–Martinet heuristics). The other three become their own Part II roadmaps of ArithmeticStatistics, each with a design job whose brief is its route in research/blueprint/papers/: ArithmeticStatisticsPartIIRandomPolynomials (PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23, endpoints items 29–41, 44–45, 52, 123, 133), ArithmeticStatisticsPartIISchinzelAverages (PAPER-SKOROBOGATOV-SOFOS-23) and ArithmeticStatisticsPartIISmithMethod (PAPER-KOYMANS-PAGANO; its design starts by reading the fixes FIX-RT-PAPER-KOYMANS-PAGANO already applied to the ArithmeticStatistics packet). None of them imports this roadmap; the Smith-method roadmap may cite RG.0 for Γ-group vocabulary only if it needs it.
- **Rescope** (ArithmeticStatisticsPartII). The id ArithmeticStatisticsPartII is also the name of the package research/blueprint/packages/ArithmeticStatisticsPartII (integral orbit dictionaries), produced on 2026-10-17 when the ArithmeticStatistics package was split into eight dependency-ordered parts; that package is not an atlas roadmap, so the atlas does not clash yet, but the two would clash on promotion and upstream. ArithmeticStatistics ST.5's notes already name this roadmap's planned owner ArithmeticStatisticsPartIIRandomGammaGroups, the id of its paper route. Rename this roadmap to ArithmeticStatisticsPartIIRandomGammaGroups (title unchanged: 'Arithmetic statistics, counting fields and Selmer distributions, Part II: random Γ-groups and nonabelian Cohen–Lenstra–Martinet heuristics') before its packet is promoted, moving the four files to that name and rewriting the node-id prefix; no stage changes. Alternatively the maintainer renames the package part; either way one of the two must change.

## References

- Y. Liu, M. M. Wood, D. Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions*, Invent. Math. 237 (2024), 49–116; arXiv:1907.05002v2 (read).
- Y. Liu, M. M. Wood, *The free group on n generators modulo n + u random relations as n goes to infinity*, J. reine angew. Math. 762 (2020); arXiv:1708.08509v2 (read).
- N. Boston, M. Bush, F. Hajir, *Heuristics for p-class towers of imaginary quadratic fields*, Math. Ann. 368 (2017), and *Heuristics for p-class towers of real quadratic fields*, J. Inst. Math. Jussieu 20 (2021) (cited for the comparison of measures).
- N. Boston, M. M. Wood, *Non-abelian Cohen–Lenstra heuristics over function fields*, Compos. Math. 153 (2017) (cited for the u = 0 comparison).
- W. Wang, M. M. Wood, *Moments and interpretations of the Cohen–Lenstra–Martinet heuristics*, Comment. Math. Helv. 96 (2021) (cited for the comparison with Cohen–Martinet).
- H. Koch, *Galois Theory of p-Extensions*, Springer (2002), Chapter 11 (cited for the H² bound, requested from ArithmeticGaloisDuality).
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd ed., Springer (2008), Corollaries 3.9.3 and 8.7.3 (cited).
- L. Ribes, P. Zalesskii, *Profinite Groups*, 2nd ed., Springer (2010), Theorem 2.3.15 (profinite Schur–Zassenhaus, cited through IG.4).
