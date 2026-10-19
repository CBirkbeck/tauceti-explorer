# Algebraic cycles, pure and mixed motives — MC.4, Part 2: duality, fundamental triangles over a perfect field, and comparisons

This document completes the planning of layer `MotivesAndAlgebraicCycles:MC.4`, *Geometric mixed motives and
motivic cohomology*. The layer's first 31 declarations are in the roadmap's base document
([reader](MotivesAndAlgebraicCycles.md), [packet](../packets/MotivesAndAlgebraicCycles.json)). They build
the geometric subcategory `DM^eff_gm(k, R)`, its Tate stabilisation `DM_gm(k, R)`, homotopy invariance,
the motives of `A^1`, `G_m` and `P^n`, the projective bundle theorem and the comparison with higher Chow
groups. They also build motives with compact support, duals and rigidity. Four of their inputs were
stated there without proof:

1. Friedlander–Voevodsky's duality and shifting theorems for bivariant cycle cohomology. The base
   document's duals, rigidity, Künneth isomorphism for motives with compact support and comparison with
   Chow motives all rest on them.
2. The blow-up formula and the Gysin triangle for a smooth pair. The base document proves them only under
   resolution of singularities, so the layer's acceptance test, the boundary map at a closed point of a
   smooth curve, held only in characteristic zero.
3. A functor from Chow motives to geometric motives. The base document has the Hom bijections but not the
   functor.
4. The transfers and the proper and flat functoriality of the sheaves of equidimensional cycles `z_equi(X, r)`.

This part supplies all four from the papers on which the cited statements rest. These are Suslin and
Voevodsky, *Relative cycles and Chow sheaves*; Voevodsky, *Cohomological theory of presheaves with transfers*
and *Triangulated categories of motives over a field*; Friedlander and Voevodsky, *Bivariant cycle cohomology*;
and Friedlander and Lawson, *Moving algebraic cycles of bounded degree*. It adds 17 declarations
([packet](../packets/MotivesAndAlgebraicCycles--MC.4.json),
[suggested Lean signatures](../suggested/MotivesAndAlgebraicCycles--MC.4.lean)). Every one is a plan with
implementation status unchecked. Three further declarations answer requests that other roadmaps made of
this layer. Tate motives serve `PeriodsAndSpecialValues:PS.9`. The Grothendieck ring of varieties and the
motivic measure given by motives with compact support serve `LogicAndDefinabilityInNumberTheory:LD.3`.

## Conventions

- `k` is a field and `R` a commutative ring of coefficients. `Sm/k` is the category of smooth separated
  `k`-schemes of finite type and `Sch/k` that of separated `k`-schemes of finite type.
- `DM^eff,-_Nis(k, R)` is the category of effective motivic complexes of
  `MotivicEtaleKTheory:M.5a/effective-motives`. It is the `A^1`-localisation of the derived category of
  bounded-above complexes of Nisnevich sheaves of `R`-modules with transfers. `M(X)` is the class of
  `R_tr(X)` for `X` smooth. For any `Y` of finite type, `C_*(Y)` is the Suslin complex of `Z_tr(Y)`; it is
  `M(Y)` when `Y` is smooth.
- `R(1) = C_*R_tr(G_m^{∧1})[-1]` and `A(n) = A ⊗ R(n)`. `H^{n,i}(X, R) = Hom(M(X), R(i)[n])` is motivic
  cohomology.
- `z_equi(X, r)` is the presheaf on `Sm/k` whose value at `U` is the free abelian group on the integral closed
  subschemes of `U × X` that are equidimensional of relative dimension `r` over a component of `U`. Its
  restriction maps are the base changes `cycl(f)` of relative cycles. `M^c(X) = C_*z_equi(X, 0)` is the motive
  with compact support. For smooth `U`, `z_equi(U, X, r)` is the presheaf `V ↦ z_equi(X, r)(U × V)`.
- *Resolution of singularities* means the condition of Friedlander–Voevodsky, Definition 3.4. Every scheme of
  finite type is the image of a proper surjection from a smooth scheme. Every abstract blow-up of a smooth
  scheme is dominated by a composite of blow-ups with smooth centres. Every field of characteristic zero
  satisfies it (Hironaka), and a field satisfying it is perfect. Statements of the bivariant theory are made
  over infinite fields with resolution of singularities, in practice fields of characteristic zero. The
  fundamental triangles of the last group of declarations need only a perfect field.
- *Abstract blow-up*: a proper morphism `p : X' → X` and a closed `Z ⊂ X` with `p` an isomorphism over `X − Z`.
- Page numbers for the five papers are those of the freely posted preprints listed under Sources. They are
  not the page numbers of Annals of Mathematics Studies 143 or of Inventiones.

## What this part imports, and from where

- **MotivicEtaleKTheory:M.5a.** This part imports finite correspondences, presheaves and Nisnevich sheaves
  with transfers, the tensor product of sheaves with transfers, the Suslin complex and the motivic complexes,
  Voevodsky's theorem on homotopy invariant presheaves with transfers, the category `DM^eff,-_Nis` with
  representability and internal Hom, and the cancellation theorem, each by its exact node. Two inputs are
  requested from that layer: (1) the cdh topology, the cdh vanishing theorem (Friedlander–Voevodsky,
  Theorem 5.5; MVW 13.25) and the comparison of morphisms out of `C_*(X)` with cdh hypercohomology
  (Voevodsky, Theorem 4.1.10); (2) base change of relative cycles over regular bases (Suslin–Voevodsky,
  §§3.3–3.4; MVW Appendix 1A).
- **MotivicEtaleKTheory:M.4.** Motivic cohomology in weights zero and one.
- **SchemeAndStackFoundations.** From SF.5: Chow groups, flat pullback, exterior products, intersection
  multiplicities, normal cones, the deformation to the normal cone, specialisation and the projective bundle
  formula. From SF.4: flattening by blow-up and generic projections. From SF.2: elementary distinguished
  squares. Requested: resolution of singularities as a hypothesis with Nagata compactification (SF.4), and
  étale coordinates for a smooth pair (SF.0).
- **SchemeKTheoryOperations:S.4.** The Brown–Gersten theorem.
- **AlgebraicModuliForArithmeticGeometry:R09.1.** Chow parameters. Chow varieties over arbitrary infinite
  fields, with continuous algebraic maps, are requested.
- **MotivesAndAlgebraicCycles:MC.1.** Chow motives and the Lefschetz motive.

Nothing here plans finite correspondences, the motivic category, cancellation or the cycle complexes, which
RS-08 gives to `MotivicEtaleKTheory:M.4` and `M.5a`.

## The layer after this part

**Equidimensional cycles and their functoriality.** `equidimensional-cycles-transfers` makes
`z_equi(X, r)` a sheaf with transfers by Suslin–Voevodsky's correspondence homomorphisms. The same node
gives the proper pushforward, flat pullback, flat–proper base change, the exterior product and the duality
embedding `D : z_equi(U, X, r) → z_equi(X × U, r + dim U)`.

**Bivariant cycle cohomology and duality.** `bivariant-cycle-cohomology` defines
`A_{r,i}(Y, X) = H^{-i}_cdh(Y, C_*z_equi(X, r))`. Several theorems follow:

- `equidimensional-cycle-localisation` gives its localisation, Mayer–Vietoris and blow-up sequences in `X`.
- `bounded-family-moving-lemma` is Friedlander–Lawson's moving lemma for families in presheaf form.
- `projective-duality-for-equidimensional-cycles` and `duality-for-equidimensional-cycles` are the two duality
  theorems.
- `naive-bivariant-comparison` identifies the naive groups with the bivariant ones on smooth quasi-projective
  schemes.
- `bivariant-duality` and `bivariant-suspension-and-gysin` are Friedlander–Voevodsky's Theorems 8.2 and 8.3.

`hom-into-motives-with-compact-support` then identifies `Hom(C_*(Y)(r)[2r + i], M^c(X))` with
`A_{r,i}(Y, X)`. This proves the shifting theorem and the duality theorem that the base document's
`bivariant-shifting-theorem` and `friedlander-voevodsky-duality` record from MVW (MVW 16.22 and 16.24). It
also gives the flat pullback `M^c(Y)(n)[2n] → M^c(X)` and `Hom(M(X), M(Y)) = CH_{dim X}(X × Y)` for smooth
proper `X` and `Y`.

**Chow motives in DM.** `chow-motives-functor` constructs the functor from effective Chow motives to
geometric motives over any infinite field. It is fully faithful under resolution of singularities and is
compared with the contravariant `Q`-linear Chow motives of MC.1.

**Fundamental triangles over a perfect field.** These need no resolution of singularities:

- `smooth-blow-up-triangle` is the blow-up triangle for a smooth centre.
- `blow-up-formula-over-a-perfect-field` is the decomposition of the motive of a blow-up, with the Gysin map
  and its cycle-class property.
- `gysin-triangle-over-a-perfect-field` is the Gysin triangle with the boundary map at a closed point of a
  smooth curve.

They supersede the base document's `blow-up-smooth-centre-and-gysin-map` and `gysin-triangle`, which assumed
resolution. They meet the layer's acceptance test in every characteristic.

**Comparisons requested by other layers.** `tate-motives` is the thick subcategory `DTM(k, R)` of `DM_gm(k, R)`
generated by the `R(n)`. Its Hom groups are the motivic cohomology of `k`. `PS.9` installs the mixed Tate
t-structure on it for number fields. `grothendieck-ring-of-varieties` and `compactly-supported-motivic-measure`
give the ring homomorphism `K_0(Var_k) → K_0(DM_gm(k, Z))`, `[X] ↦ [M^c(X)]`. It extends to the localisation
`K_0(DM_gm(k, Q))[(1 − [Q(−i)])^{−1}]` that `LD.3` asked for.

## Acceptance tests of the layer and where they are met

- The motives of `A^1`, `G_m` and `P^n`, with shifts and twists: base `motive-of-projective-space`.
- The boundary map at a closed point `x` of a smooth curve `X`, over any perfect field:
  `gysin-triangle-over-a-perfect-field`. Here `M(X − x) → M(X) → M(Spec k(x))(1)[2] →`. In weight one this is
  `O(X)^× → O(X − x)^× →^{ord_x} Z → Pic X → Pic(X − x) → 0`.
- Duality and rigidity: base `geometric-motives-rigid` with this part's `hom-into-motives-with-compact-support`.
- Comparison with higher Chow groups: base `motivic-cohomology-higher-chow`, consistent with
  `hom-into-motives-with-compact-support` (d).
- No motivic t-structure is installed on the whole triangulated category. The heart of the Tate subcategory
  over number fields is `PS.9`'s.

## Planets

The base document's six planets fill the layer: *Effective geometric motives*, *Geometric motives*, *Motive of
projective space*, *Gysin triangle*, *Motives with compact support* and *Projective bundle theorem*. This part
marks none, so the layer stays within six. The packet's `restructure` proposes four sub-layers, each with up to
four planets, and moves the planet *Gysin triangle* to `gysin-triangle-over-a-perfect-field`. The sub-layers
are:

- geometric motives and Tate stabilisation;
- fundamental triangles;
- equidimensional cycles, bivariant cohomology and duality;
- comparisons.

## The base packet after this part

The base packet's MC.4 nodes keep their ids. A fix of the base packet should rewire them. That fix is listed
in the packet's `restructure` and in the coverage record.

- `gysin-triangle` and `blow-up-smooth-centre-and-gysin-map` give way to the perfect-field nodes.
- `friedlander-voevodsky-duality` and `bivariant-shifting-theorem` take
  `hom-into-motives-with-compact-support` and `bivariant-duality` as prerequisites in place of their gap.
- `compact-support-kunneth` takes its natural map from `equidimensional-cycles-transfers`.
- `chow-motives-into-geometric-motives` takes its functor from `chow-motives-functor`.
- The transfer items of `equidimensional-cycle-sheaves` move to `equidimensional-cycles-transfers`, which
  avoids a cycle.

## Gaps, requests and source corrections

- **Gap.** The moving lemma for bounded families, and the duality theorem it gives, over finite fields.
  Friedlander and Lawson prove the lemma over infinite fields and over finite fields large enough for the
  degrees involved. Friedlander–Voevodsky state the consequences over every field (E101). The nodes are
  stated over infinite fields.
- **Requests.** `MotivicEtaleKTheory:M.5a`: cdh topology and cdh vanishing; relative cycles.
  `SchemeAndStackFoundations:SF.4`: resolution of singularities, Nagata compactification.
  `SchemeAndStackFoundations:SF.0`: étale coordinates for smooth pairs.
  `AlgebraicModuliForArithmeticGeometry:R09.1`: Chow varieties over infinite fields.
- **Source corrections** (packet `sourceIssues`):
  - E101: the finite-field scope above.
  - E102: Voevodsky's proof of his Proposition 3.5.3 cites Proposition 4.1.3, which needs resolution, where
    Proposition 3.5.2 applies.
  - E103: the cycle-class property of the Gysin map and the normalisation at `(P^c, point)` are asserted
    without proof.
  - E104: the proof of Proposition 2.1.4 does not check compatibility with composition.
  - E105: the proof of Proposition 4.23 of *Cohomological theory of presheaves with transfers* is wrong, by
    Voevodsky's own account. The corrected argument is MVW Lemma 22.10. This part imports homotopy
    invariance from M.5a instead of that paper's Theorem 5.6.

## Sources

| id | work | read |
| --- | --- | --- |
| `V.DM` | V. Voevodsky, *Triangulated categories of motives over a field*, Ann. of Math. Stud. 143 (2000); IAS preprint | §§2–4 |
| `FV.BivCycl` | E. M. Friedlander and V. Voevodsky, *Bivariant cycle cohomology*, Ann. of Math. Stud. 143 (2000); IAS preprint | §§1–8 |
| `SV.RelCycles` | A. Suslin and V. Voevodsky, *Relative cycles and Chow sheaves*, Ann. of Math. Stud. 143 (2000); IAS preprint | §§3.3–3.4, 3.6–3.7 |
| `V.CTP` | V. Voevodsky, *Cohomological theory of presheaves with transfers*, Ann. of Math. Stud. 143 (2000); K-theory preprint 0368 | §§5.2–5.4 |
| `FL.Moving` | E. M. Friedlander and H. B. Lawson, *Moving algebraic cycles of bounded degree*, Invent. Math. 132 (1998); authors' preprint | §§0–3 |
| `MVW.2006` | C. Mazza, V. Voevodsky and C. Weibel, *Lecture Notes on Motivic Cohomology*, Clay Math. Monographs 2 (2006) | App. 1A, Lectures 15, 16, 20 |

Links, hashes and the sections read are in the packet's `sources`.

## Declarations

Each declaration below is stated in the packet with the same text. Ids are relative to `MotivesAndAlgebraicCycles:MC.4/`; prerequisites in other roadmaps are given in full.

### Equidimensional cycles and bivariant cycle cohomology

#### `equidimensional-cycles-transfers` — Transfers, pushforward, flat pullback and products on the sheaves of equidimensional cycles

*construction.*

**Statement.** Let k be a field, X a scheme of finite type over k and r >= 0, and let z_equi(X, r) be the presheaf on Sm/k of MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-sheaves, whose restriction maps are the base changes cycl(f) of relative cycles. (i) Transfers. For smooth schemes U', U and an elementary finite correspondence W in Cor_k(U', U) (an integral closed W in U' x U, finite and surjective over a component of U'), the transfer W^*: z_equi(X, r)(U) -> z_equi(X, r)(U') sends a cycle Z on U x X, equidimensional of relative dimension r over U, to the pushforward along the finite map W x X -> U' x X of the base change cycl(W -> U)(Z) of Z along the composite W -> U' x U -> U; extended linearly, these maps make z_equi(X, r) a presheaf with transfers whose underlying presheaf is the given one (the transfer along the graph of f: U' -> U is cycl(f)); it is a Nisnevich, indeed etale, sheaf with transfers. For X proper and r = 0 it is the representable sheaf with transfers Z_tr(X), transfers included. (ii) Proper pushforward. For p: X -> Y proper, pushforward of cycles p_*: z_equi(X, r) -> z_equi(Y, r) is a morphism of presheaves with transfers, with (p'p)_* = p'_* p_*. (iii) Flat pullback. For q: W -> X flat and equidimensional of relative dimension n, flat pullback q^*: z_equi(X, r) -> z_equi(W, r + n) is a morphism of presheaves with transfers, with (q q')^* = q'^* q^*. (iv) Base change. For a cartesian square with q flat equidimensional and p proper, q^* p_* = p'_* q'^*. (v) Exterior product. Fibre product over the base gives z_equi(X, r)(U) x z_equi(Y, s)(U) -> z_equi(X x Y, r + s)(U), bilinear, natural in U and compatible with transfers in each variable, hence a morphism z_equi(X, r) tensor_tr z_equi(Y, s) -> z_equi(X x Y, r + s) of presheaves with transfers; for r = s = 0 it is the map M^c(X) tensor M^c(Y) -> M^c(X x Y) used in MC.4/compact-support-kunneth. (vi) Duality embedding. For U smooth and equidimensional of dimension n, write z_equi(U, X, r) for the presheaf V -> z_equi(X, r)(U x V); regarding a cycle on X x U x V as a cycle over V gives an injective morphism of presheaves with transfers D: z_equi(U, X, r) -> z_equi(X x U, r + n), compatible with p_* and q^* in X.

**Hypotheses.**

- k is any field; X, Y, W are of finite type over k; U, U', V are smooth over k.
- Every base of a relative cycle used here is smooth, hence regular, so base change of equidimensional cycles has integral coefficients and needs no inverted characteristic (Suslin-Voevodsky, Relative cycles and Chow sheaves, Proposition 3.3.15 and Corollary 3.4.5; MVW Theorems 1A.6, 1A.8 and 1A.10). That theory of relative cycles is requested from MotivicEtaleKTheory:M.5a, which owns relative cycles for finite correspondences.
- For (iii) and (iv), q is flat and every fibre of q has pure dimension n.

**Construction, or proof, in steps.**

1. Presheaf structure: by SV Theorem 3.4.2 and Corollary 3.4.5 a cycle on U x X equidimensional of relative dimension r over the regular scheme U is a relative cycle in SV's sense with universally integral base changes (SV Proposition 3.3.15); SV Theorem 3.3.1 gives cycl(f) for every f: U' -> U and its functoriality (imported from M.5a by request).
2. Transfers: in SV's notation W^*(Z) is the correspondence homomorphism Cor(cycl(pr)(Z), [W]) of SV section 3.7. SV Theorem 3.7.3 shows that it is a relative cycle of relative dimension r over U' and that it commutes with base change in U', so W^* is natural in U'; SV Proposition 3.7.7 and Corollary 3.7.8 (associativity of correspondence homomorphisms) give (W' o W)^* = W^* W'^* for the composition of finite correspondences of M.5a/finite-correspondence, which MVW Definition 1A.11 identifies with the correspondence composition; for the graph of f the correspondence homomorphism is cycl(f) (MVW 1A.11, last paragraph). The sheaf property is the one recorded after MVW Definition 16.1.
3. Proper case: for X proper a closed subvariety of U x X quasi-finite and proper over U is finite (MVW Example 16.2, SV Corollary 3.4.6), so z_equi(X, 0)(U) = Cor_k(U, X); both transfer structures are correspondence homomorphisms, hence equal.
4. Pushforward: SV Proposition 3.6.2 shows that p_* of a relative cycle is relative and commutes with base change, and SV Corollary 3.6.3 gives functoriality; compatibility with transfers is SV Proposition 3.7.6 (FV Proposition 5.8(1)).
5. Flat pullback: SV Lemma 3.6.4 (relative cycles pull back with the dimension shift, compatibly with base change; FV Proposition 2.1); compatibility with transfers by SV Lemma 3.7.2; base change square by SV Proposition 3.6.5.
6. Exterior product: SV, end of section 3.7, defines it as cycl(p_Y) followed by the correspondence homomorphism; its naturality and transfer compatibility follow from SV 3.7.3 and 3.7.7; a family of pairings natural in both variables and compatible with transfers in each variable is the same as a morphism out of the tensor product of presheaves with transfers (M.5a/tensor-product-transfers, MVW Definition 8.2 and Lemma 8.3).
7. Duality embedding: SV Theorem 3.7.3 gives cycl(f)(Z) = cycl(id_U x f)(Z) for f: V' -> V (FV p. 5), so D is a morphism of presheaves; it is a morphism of presheaves with transfers by FV Proposition 5.8(3), and injectivity is clear on cycles.

**Acceptance.**

- For X = Spec k and r = 0 the presheaf with transfers z_equi(Spec k, 0) is the constant sheaf Z, and the transfer along an elementary correspondence W from U' to U is multiplication by the degree of W over U'.
- For X proper and r = 0 the construction returns Z_tr(X) with its transfers, so M^c(X) = M(X) as objects of DM^eff,-_Nis, as MC.4/motives-with-compact-support records.
- Pushforward is defined only along proper maps: the hyperbola st = 1 in A^1_s x A^1_t, a section of z_equi(A^1_t, 0) over A^1_s, has image G_m x {point} under the projection to A^1_s x Spec k, which is not closed.

**API.**

| name | role | statement |
| --- | --- | --- |
| `zEqui.transfer` | structure | For W in Cor_k(U', U), the transfer W^*: z_equi(X, r)(U) -> z_equi(X, r)(U'), the pushforward of the base change of a cycle along W. |
| `zEqui.transfer_graph` | simp | The transfer along the graph of f: U' -> U is the base change cycl(f). |
| `zEqui.transfer_comp` | functoriality | (W' o W)^* = W^* o W'^* for composable finite correspondences, and the identity correspondence acts as the identity. |
| `zEqui.toPST` | structure | z_equi(X, r) as a Nisnevich sheaf with transfers on Sm/k. |
| `zEqui.ofTr_eq_of_proper` | compatibility | For X proper, z_equi(X, 0) = Z_tr(X) as presheaves with transfers. |
| `zEqui.pushforward` | functoriality | For p: X -> Y proper, p_*: z_equi(X, r) -> z_equi(Y, r) is a morphism of presheaves with transfers, with map_id and map_comp. |
| `zEqui.flatPullback` | functoriality | For q: W -> X flat of relative dimension n, q^*: z_equi(X, r) -> z_equi(W, r + n) is a morphism of presheaves with transfers, with map_id and map_comp. |
| `zEqui.pushforward_flatPullback` | compatibility | Flat-proper base change: q^* p_* = p'_* q'^* for a cartesian square with q flat equidimensional and p proper. |
| `zEqui.extProduct` | structure | The exterior product z_equi(X, r) tensor_tr z_equi(Y, s) -> z_equi(X x Y, r + s), associative, commutative up to the swap of factors, and unital with unit the class of Spec k in z_equi(Spec k, 0). |
| `zEqui.dualityEmbedding` | other | For U smooth of pure dimension n, the injective morphism of presheaves with transfers D: z_equi(U, X, r) -> z_equi(X x U, r + n), natural for proper pushforward and flat pullback in X. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.4/motives-with-compact-support`: M^c(X) = C_*z_equi(X, 0) needs z_equi(X, 0) as a sheaf with transfers and its proper and etale functoriality
- `MotivesAndAlgebraicCycles:MC.4/compact-support-kunneth`: the exterior product (v) for r = s = 0 is the natural map M^c(X) tensor M^c(Y) -> M^c(X x Y) the base node lacked
- `MotivesAndAlgebraicCycles:MC.4/bivariant-cycle-cohomology`: the bivariant groups are cdh hypercohomology of the Suslin complexes of z_equi(X, r), functorial in X through (ii) and (iii)
- `MotivesAndAlgebraicCycles:MC.4/projective-duality-for-equidimensional-cycles`: the duality embedding (vi) is the map shown to be a quasi-isomorphism
- `MotivesAndAlgebraicCycles:MC.4/equidimensional-cycle-localisation`: the cokernels of restriction to open subschemes are presheaves with transfers, so the cdh vanishing theorem applies to them
- Friedlander-Voevodsky, Theorem 6.1: the moving maps on projective space are extended from an open subset of A^1 to A^1 by a transfer along a finite correspondence

**Unit tests.** A plausible wrong definition fails one of these.

- `zEqui_transfer_point` (computation): For a finite separable extension L/k, X = Spec k, r = 0 and W = Spec L viewed as a finite correspondence from Spec k to Spec L, the transfer z_equi(Spec k, 0)(Spec L) = Z -> z_equi(Spec k, 0)(Spec k) = Z is multiplication by [L : k].
- `zEqui_transfer_id` (degenerate): The transfer along the diagonal of U is the identity of z_equi(X, r)(U).
- `zEqui_pushforward_degree` (compatibility): For X proper over k, pushforward along X -> Spec k on z_equi(X, 0)(Spec k), the group of zero-cycles of X, is the degree of zero-cycles (SchemeAndStackFoundations:SF.5/degree).
- `zEqui_pushforward_needs_proper` (non-example): For the non-proper projection A^1_t -> Spec k, pushing forward the hyperbola st = 1 in z_equi(A^1_t, 0)(A^1_s) gives the cycle G_m x Spec k on A^1_s, which is not closed in A^1_s; so there is no pushforward along non-proper maps.
- `zEqui_extProduct_points` (computation): The exterior product of the classes of closed points x of X and y of Y with k(x) = k(y) = k is the class of the point (x, y) of X x Y.

**Prerequisites.** `equidimensional-cycle-sheaves`, `MotivicEtaleKTheory:M.5a/finite-correspondence`, `MotivicEtaleKTheory:M.5a/presheaf-with-transfers`, `MotivicEtaleKTheory:M.5a/tensor-product-transfers`, `MotivicEtaleKTheory:M.5a`, `SchemeAndStackFoundations:SF.5/flat-pullback`, `mathlib:AlgebraicGeometry.AlgebraicCycle.map`

**Sources.**

- Andrei Suslin and Vladimir Voevodsky, *Relative cycles and Chow sheaves*, Theorem 3.3.1 (preprint p. 23), Proposition 3.3.15 (p. 32), Theorem 3.4.2 and Corollaries 3.4.5-3.4.6 (p. 34). Base change of relative cycles, its integrality over regular bases, and the description of equidimensional cycles over geometrically unibranch and regular bases as relative cycles.
- Andrei Suslin and Vladimir Voevodsky, *Relative cycles and Chow sheaves*, Proposition 3.6.2, Corollary 3.6.3, Lemma 3.6.4 and Proposition 3.6.5 (preprint pp. 45-47). Proper pushforward and flat pullback of relative cycles commute with base change, are functorial, and satisfy flat-proper base change.
- Andrei Suslin and Vladimir Voevodsky, *Relative cycles and Chow sheaves*, Section 3.7: Lemmas 3.7.1-3.7.2, Theorem 3.7.3, Corollary 3.7.5, Propositions 3.7.6-3.7.7, Corollary 3.7.8 and the external product (preprint pp. 49-55). Correspondence homomorphisms of relative cycles, their base change, associativity and compatibility with pushforward, which give the transfers and the external product.
- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Section 2, Proposition 2.1 and the duality embedding D (preprint pp. 4-5); Propositions 5.7 and 5.8 (pp. 25-26). The functoriality of z_equi(X, r) in X, the embedding z_equi(U, X, r) into z_equi(X x U, r + dim U), and the structure of pretheory (transfers) with the maps p_*, q^* and D as morphisms of pretheories.
- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Section 4.2, paragraph before Definition 4.2.1 (preprint p. 45). States that z_equi(X, r) is a Nisnevich sheaf with a canonical structure of presheaf with transfers, covariant for proper and contravariant for flat equidimensional maps, and equal to L^c(X) for r = 0.
- Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Lecture 16, Definition 16.1 and Exercise 16.3; Appendix 1A, Definition 1A.11. The source the base node used, which leaves the transfers as an exercise; the construction here supplies them from Suslin-Voevodsky.

#### `bivariant-cycle-cohomology` — Bivariant cycle cohomology

*definition.*

**Statement.** Let k be a field, X and Y schemes of finite type over k and r >= 0. Let pi: (Sch/k)_cdh -> (Sm/k)_Zar be the morphism of sites and C_*(z_equi(X, r)) the Suslin complex of MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers. The bivariant cycle cohomology of Y with coefficients in r-cycles on X is A_{r,i}(Y, X) = H^{-i}_cdh(Y, pi^* C_*(z_equi(X, r))), the cdh hypercohomology on Sch/k, for i in Z; write A_{r,i}(X) = A_{r,i}(Spec k, X), which equals h_i(z_equi(X, r))(Spec k), the i-th homology of the complex n -> z_equi(X, r)(Delta^n). The groups are contravariant in Y for every morphism, covariant in X for proper maps and contravariant in X for flat equidimensional maps of relative dimension n, with r -> r + n. There is a natural map h_i(z_equi(X, r))(U) -> A_{r,i}(U, X) for U smooth. Zariski open covers of Y give Mayer-Vietoris sequences and abstract blow-ups of Y give long exact blow-up sequences in the first variable. If k admits resolution of singularities, A_{r,i}(Y, X) = Hom_{DM^eff,-_Nis(k)}(C_*(Y)[i], C_*(z_equi(X, r))), where C_*(Y) is the Suslin complex of Z_tr(Y), the motive M(Y) when Y is smooth.

**Hypotheses.**

- k is a field; the definition needs nothing more. The comparison with Hom groups in DM^eff,- and every property beyond functoriality, Mayer-Vietoris and the blow-up sequence in Y need k to admit resolution of singularities in the sense of Friedlander-Voevodsky, Definition 3.4, which forces k to be perfect.
- The cdh topology on Sch/k (generated by Nisnevich covers and abstract blow-ups) and the comparison of morphisms out of C_*(Y) with cdh hypercohomology (Voevodsky, Triangulated categories of motives, Theorem 4.1.10) are requested from MotivicEtaleKTheory:M.5a.

**Construction, or proof, in steps.**

1. Define C_*(z_equi(X, r)) as a complex of presheaves with transfers (M.5a/suslin-complex-and-motivic-complexes applied to MC.4/equidimensional-cycles-transfers), pull it back along pi and take cdh hypercohomology (FV Definition 4.3).
2. Functoriality in Y is that of hypercohomology; in X it comes from (ii) and (iii) of MC.4/equidimensional-cycles-transfers.
3. Mayer-Vietoris and the blow-up sequence in Y: Zariski covers and abstract blow-ups are cdh covers (FV Propositions 4.4 and 4.5).
4. For Y = Spec k, cdh hypercohomology of the point is the value of the complex, so A_{r,i}(X) = h_i(z_equi(X, r))(Spec k) (FV, after Definition 4.3).
5. Under resolution of singularities, Hom(C_*(Y)[i], C_*(F)) = H^{-i}_cdh(Y, pi^* C_*(F)) for every presheaf with transfers F (Voevodsky, Triangulated categories of motives, Theorem 4.1.10, requested from M.5a), giving the Hom description (Definition 4.2.1 there).

**Acceptance.**

- A_{r,0}(Spec k, X) is the Chow group CH_r(X) of r-cycles modulo rational equivalence.
- For X affine and equidimensional of dimension d, A_{r,i}(X) is the higher Chow group CH^{d-r}(X, i).
- The second variable is not homotopy invariant: it shifts r.

**API.**

| name | role | statement |
| --- | --- | --- |
| `bivariant` | data | The group A_{r,i}(Y, X) for X, Y of finite type, r >= 0 and i in Z. |
| `bivariant.mapLeft` | functoriality | Contravariance in Y: f: Y' -> Y induces f^*: A_{r,i}(Y, X) -> A_{r,i}(Y', X), with map_id and map_comp. |
| `bivariant.pushforward` | functoriality | Covariance in X for proper maps p: X -> X', with map_id and map_comp. |
| `bivariant.flatPullback` | functoriality | For q: W -> X flat equidimensional of relative dimension n, q^*: A_{r,i}(Y, X) -> A_{r+n,i}(Y, W). |
| `bivariant.ofNaive` | data | The natural map h_i(z_equi(X, r))(U) -> A_{r,i}(U, X) for U smooth. |
| `bivariant.point` | simp | A_{r,i}(Spec k, X) = h_i(z_equi(X, r))(Spec k). |
| `bivariant.mayerVietoris` | relation | For Y = U_1 union U_2 Zariski open, the long exact sequence ... -> A_{r,i}(Y, X) -> A_{r,i}(U_1, X) + A_{r,i}(U_2, X) -> A_{r,i}(U_1 cap U_2, X) -> A_{r,i-1}(Y, X) -> ... |
| `bivariant.blowUp` | relation | For an abstract blow-up p: Y' -> Y with centre Z, the long exact sequence ... -> A_{r,i}(Y, X) -> A_{r,i}(Y', X) + A_{r,i}(Z, X) -> A_{r,i}(p^{-1}Z, X) -> A_{r,i-1}(Y, X) -> ... |
| `bivariant.homEquiv` | characterisation | Under resolution of singularities, A_{r,i}(Y, X) = Hom_{DM^eff,-}(C_*(Y)[i], C_*(z_equi(X, r))). |

**Uses.**

- Friedlander-Voevodsky, Theorems 8.1-8.3: the duality, homotopy invariance, suspension and Gysin theorems are statements about these groups
- `MotivesAndAlgebraicCycles:MC.4/hom-into-motives-with-compact-support`: Hom(M(Y)(r)[2r + i], M^c(X)) is identified with A_{r,i}(Y, X)
- `MotivesAndAlgebraicCycles:MC.4/bivariant-shifting-theorem`: the base node records these groups inside its proof; the definition with its API is this node
- `MotivesAndAlgebraicCycles:MC.4/borel-moore-motivic-homology`: Borel-Moore motivic homology Hom(R(i)[n], M^c(X)) is A_{i,n-2i}(Spec k, X)

**Unit tests.** A plausible wrong definition fails one of these.

- `bivariant_chow` (computation): A_{r,0}(Spec k, X) = CH_r(X); for X = P^1 and r = 0 this is Z, the degree of zero-cycles.
- `bivariant_point_point` (degenerate): A_{0,i}(Spec k, Spec k) is Z for i = 0 and 0 otherwise: z_equi(Spec k, 0) is the constant presheaf Z and its Suslin complex at Spec k has homology Z in degree 0 only.
- `bivariant_affine_higherChow` (compatibility): For X affine equidimensional of dimension d, A_{r,i}(Spec k, X) is CH^{d-r}(X, i), the higher Chow group of MotivicEtaleKTheory:M.4/cycle-complex.
- `bivariant_not_homotopy_invariant_in_X` (non-example): A_{0,0}(Spec k, A^1) = CH_0(A^1) = 0 while A_{0,0}(Spec k, Spec k) = Z: the second variable is not homotopy invariant; it is the dimension shift A_{r,i}(Y, X) = A_{r+1,i}(Y, X x A^1) that holds.

**Prerequisites.** `equidimensional-cycles-transfers`, `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes`, `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.5a`

**Sources.**

- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Definition 4.3 and the paragraph after it, Propositions 4.4 and 4.5 (preprint pp. 18-19). The definition of A_{r,i}(Y, X) as cdh hypercohomology, its functoriality, A_{r,i}(X) = h_i(z_equi(X, r))(Spec k), and the Mayer-Vietoris and blow-up sequences in the first variable.
- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Theorem 4.2(1)-(2) (preprint p. 16). h_0(z_equi(X, r))(Spec k) is the Chow group of r-cycles, and for affine equidimensional X the groups h_i are Bloch's higher Chow groups (Suslin).
- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Definition 4.2.1 with Theorem 4.1.10 (preprint pp. 44-46). The same groups as Hom groups in DM^eff,- out of the Suslin complex of Y, under resolution of singularities.

#### `equidimensional-cycle-localisation` — Localisation, Mayer-Vietoris and blow-up triangles for equidimensional cycles

*theorem.*

**Statement.** Let k be a field admitting resolution of singularities, X a scheme of finite type over k, Y a closed subscheme with open complement X - Y, X = U_1 union U_2 a Zariski open cover and r >= 0. There are canonical distinguished triangles of complexes of Zariski sheaves on Sm/k: C_*z_equi(Y, r) -> C_*z_equi(X, r) -> C_*z_equi(X - Y, r) -> C_*z_equi(Y, r)[1], C_*z_equi(X, r) -> C_*z_equi(U_1, r) + C_*z_equi(U_2, r) -> C_*z_equi(U_1 cap U_2, r) -> C_*z_equi(X, r)[1], and, for an abstract blow-up p: X' -> X with centre Z (p proper, an isomorphism over X - Z), C_*z_equi(p^{-1}Z, r) -> C_*z_equi(Z, r) + C_*z_equi(X', r) -> C_*z_equi(X, r) -> . Consequently, for every scheme U of finite type, the groups A_{r,*}(U, -) have the corresponding long exact localisation, Mayer-Vietoris and blow-up sequences in the second variable, and A_{r,i}(U x A^1, X) = A_{r,i}(U, X) (homotopy invariance in the first variable). For r = 0 the first triangle is the localisation triangle of motives with compact support, MC.4/compact-support-localisation-triangle.

**Hypotheses.**

- k admits resolution of singularities (FV Definition 3.4); in particular k is perfect.
- The cdh vanishing theorem: for a presheaf with transfers F on Sm/k with F_cdh = 0, the complex C_*(F)_Zar is acyclic, and Zariski and cdh hypercohomology of C_*(F) agree on smooth schemes (FV Theorem 5.5, MVW Theorem 13.25); requested from MotivicEtaleKTheory:M.5a with the exactness of pi^* (FV Lemma 3.6).
- Platification by blow-up (Raynaud-Gruson) is SchemeAndStackFoundations:SF.4/flattening-by-blowup.

**Construction, or proof, in steps.**

1. The sequences of presheaves 0 -> z_equi(Y, r) -> z_equi(X, r) -> z_equi(X - Y, r) and 0 -> z_equi(X, r) -> z_equi(U_1, r) + z_equi(U_2, r) -> z_equi(U_1 cap U_2, r) are exact; their maps are morphisms of presheaves with transfers (MC.4/equidimensional-cycles-transfers), so the cokernels are presheaves with transfers.
2. The cdh sheafification of each cokernel vanishes: given a cycle Z in z_equi(X - Y, r)(U), take the closure of each component in X x U, flatten it over U by a blow-up U' -> U (SF.4/flattening-by-blowup), make U' smooth by resolution; the proper transform lies in z_equi(X, r)(U') and restricts to cycl(p)(Z) (FV, proof of Theorem 5.11).
3. The cdh vanishing theorem (imported) makes C_* of each cokernel Zariski-acyclic, giving the first two triangles; the blow-up triangle is the same argument for coker(z_equi(Z, r) + z_equi(X', r) -> z_equi(X, r)) (FV Theorem 5.13).
4. Apply pi^*, exact under resolution (FV Lemma 3.6), and cdh hypercohomology to obtain the long exact sequences (FV Corollaries 5.12 and 5.14); homotopy invariance in the first variable is FV Theorem 5.5(3) for F = z_equi(X, r) (FV Proposition 5.9).

**Acceptance.**

- For X = A^1, Y the origin and r = 0 the first triangle is M^c(0) -> M^c(A^1) -> M^c(G_m) -> M^c(0)[1].
- For X = P^1 and r = 1 the localisation sequence at Spec k reads 0 -> A_{1,0}(A^1) -> ... with A_{1,0}(P^1) = CH_1(P^1) = Z restricting isomorphically to CH_1(A^1) = Z.
- Without resolution of singularities the flattening step does not produce smooth U', and the triangles are not claimed.

**Prerequisites.** `equidimensional-cycles-transfers`, `bivariant-cycle-cohomology`, `MotivicEtaleKTheory:M.5a`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.4/flattening-by-blowup`, `mathlib:CategoryTheory.Pretriangulated.Triangle`

**Sources.**

- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Theorem 5.5 (preprint p. 23), Proposition 5.9 (p. 26), Theorem 5.11 with its proof and Corollary 5.12 (pp. 27-29), Theorem 5.13 and Corollary 5.14 (p. 29). The cdh vanishing theorem for pretheories, the localisation and Mayer-Vietoris triangles for C_*z_equi(-, r) with their long exact sequences, the abstract blow-up triangle, and homotopy invariance in the first variable.
- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Definition 3.4 and Lemma 3.6 (preprint pp. 10-11). The resolution hypothesis used throughout and the exactness of pi^* from Zariski sheaves on Sm/k to cdh sheaves on Sch/k.

### The moving lemma and the duality theorems

#### `bounded-family-moving-lemma` — The moving lemma for families of cycles of bounded degree

*theorem.*

**Statement.** Let k be an infinite field, X in P^N a smooth projective equidimensional scheme of dimension m over k, and d, e, r, s >= 0 with r + s >= m. There are homomorphisms of abelian monoids H^+_U, H^-_U: z^eff_equi(X, r)(U) -> z^eff_equi(X, r)(U x A^1), defined for all smooth schemes U over k, such that: (1) they are natural in U (H_{U'} cycl(f) = cycl(f x id) H_U for f: U' -> U); (2) for every geometric point xbar of U x {0} and every Z in z^eff_equi(X, r)(U) of degree <= d, cycl(xbar)(H^+(Z)) = cycl(xbar)(H^-(Z)) + cycl(xbar)(Z), and the components of excess dimension of the intersection of either cycl(xbar)(H^{+-}(Z)) with an effective s-cycle W of degree <= e lie in Supp(cycl(xbar)Z) cap Supp(W); (3) for every geometric point xbar of U x (A^1 - {0}) and every such Z and W, the cycles cycl(xbar)(H^{+-}(Z)) meet W properly. Here z^eff_equi(X, r)(U) is the monoid of effective cycles of z_equi(X, r)(U) and the degree is taken in the fibres.

**Hypotheses.**

- k is infinite. Friedlander and Lawson prove their moving lemma when k is infinite or a finite field that is large enough for the given degrees; Friedlander-Voevodsky state the presheaf form over an arbitrary field (MotivesAndAlgebraicCycles/E101).
- Chow varieties C_{r,d}(X) of effective r-cycles of degree d on X over k, their monoid C_r(X), continuous algebraic maps between them, and the comparison of z^eff_equi(X, r)(U) with morphisms U -> C_r(X) for U smooth quasi-projective (FV Proposition 2.3, from Friedlander 1991, 1.4) are requested from AlgebraicModuliForArithmeticGeometry:R09.1, whose R09.1/chow-parameters supplies them over algebraically closed fields of characteristic zero.

**Construction, or proof, in steps.**

1. Projective cones (FL section 1, FV Proposition 6.2): for a generic family F of m + 1 forms of a large degree D, the projection p_F: X -> P^m is finite and flat, and R_F(Z) = p_F^* p_{F*}(Z) - Z has excess intersections with every effective s-cycle of degree <= e only inside the ramification locus of p_F (FL Theorem 1.7, Proposition 1.9); R_F is a morphism of presheaves built from flat pullback and proper pushforward (MC.4/equidimensional-cycles-transfers (ii), (iii)).
2. Iterating m + 1 generic projections writes every effective r-cycle as an alternating sum of pullbacks of cycles from P^m and a cycle R_{F_m} ... R_{F_0}(Z) meeting every effective s-cycle of degree <= e properly (FL formula (1.9.1)).
3. Moving in P^m (FL section 2): linear projections from (t - 1)-planes L_j of P^{m+t} give continuous algebraic maps Theta_N on C_r(P^m) x l^o, with l^o open in a line, whose values at t != 0 meet every cycle of degree <= e properly and whose value at 0 is a fixed multiple of the identity (FL Propositions 2.3-2.5, Theorem 2.6); k-rational points avoiding the finitely many bad loci exist because k is infinite.
4. Combine (FL Theorem 3.1), choosing two sequences of degrees with coprime products M + 1 and M, to obtain Psi^{+-} on C_r(X) x O with O open in P^1, and extend O to A^1 by a finite map g: P^1 -> P^1 (FL Theorem 3.8).
5. Presheaf form (FV Theorems 6.1 and 6.3): through FV Proposition 2.3 the continuous algebraic maps act on z^eff_equi(X, r)(U) for U smooth; the extension from an open V of A^1 to A^1 is the composite of flat pullback with the transfer along the finite correspondence Gamma = m Gamma_u + n Gamma_w over A^1 (MC.4/equidimensional-cycles-transfers (i)), and properties (1)-(3) are checked fibrewise.

**Acceptance.**

- For U = Spec k and t = 0 the two moved cycles differ by Z itself; for t != 0 they meet every effective s-cycle of degree <= e properly.
- For X = P^m the projective cone step is not needed and the maps come from FL Theorem 2.6 alone.
- The construction is not a moving lemma for single cycles modulo rational equivalence: it moves all cycles of degree <= d simultaneously and algebraically in families.

**Prerequisites.** `equidimensional-cycles-transfers`, `equidimensional-cycle-sheaves`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.1/chow-parameters`, `SchemeAndStackFoundations:SF.4/generic-projection`, `SchemeAndStackFoundations:SF.5/flat-pullback`

**Sources.**

- Eric M. Friedlander and H. Blaine Lawson, *Moving algebraic cycles of bounded degree*, Theorem 1.7 (preprint p. 10), Proposition 1.9 (p. 12), Propositions 2.3-2.5 and Theorem 2.6 (pp. 15-18), Theorem 3.1 (p. 19) and Theorem 3.8 (p. 25). The projective cone construction, moving in projective space by linear projections, the moving lemma for cycles of bounded degree over an infinite or sufficiently large finite field, and its extension to A^1.
- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Section 6: Theorem 6.1 (preprint p. 30), Proposition 6.2 (p. 33), Theorem 6.3 (p. 34). The moving lemma recast as natural maps of presheaves of effective equidimensional cycles, with the transfer argument extending the parameter to A^1.
- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Section 2, Chow varieties and Proposition 2.3 (preprint pp. 6-8). Effective equidimensional cycles over a smooth quasi-projective U and morphisms from U to the Chow monoid.

#### `projective-duality-for-equidimensional-cycles` — Duality for equidimensional cycles on smooth projective schemes

*theorem.*

**Statement.** Let k be an infinite field, X and Y smooth projective equidimensional schemes over k and r >= 0. The duality embedding D: z_equi(Y, X, r) -> z_equi(X x Y, r + dim Y) of MotivesAndAlgebraicCycles:MC.4/equidimensional-cycles-transfers induces isomorphisms h_i(z_equi(Y, X, r)) -> h_i(z_equi(X x Y, r + dim Y)) of presheaves on Sm/k for all i. In particular, with r = 0, i = 0 and evaluation at Spec k: the group h_0(Y, X) = coker(Cor_k(Y x A^1, X) -> Cor_k(Y, X)), the difference of the restrictions to Y x {0} and Y x {1}, is canonically CH_{dim Y}(Y x X), the class of a finite correspondence going to its cycle class.

**Hypotheses.**

- k is infinite, through MC.4/bounded-family-moving-lemma; FV state the theorem over an arbitrary field (MotivesAndAlgebraicCycles/E101).
- X and Y are smooth and projective; no resolution of singularities is used.

**Construction, or proof, in steps.**

1. Embed X x Y in some P^N, fix e bounding the degrees of the fibres {x} x Y, and for each d take H = H^+ - H^- from MC.4/bounded-family-moving-lemma applied to X x Y with the dimensions r + dim Y and dim Y.
2. Apply FV Lemma 6.6 with F = z_equi(X x Y, r + dim Y), F_d its cycles of degree <= d and G the image of D: H commutes with base change (property (1)), at t = 0 it is the identity up to the moved difference (property (2b)), and at t = 1 it lands in G because a cycle on X x Y x U equidimensional over U lies in the image of D as soon as each geometric fibre is equidimensional over X (FV Proposition 6.4, effective cycles; property (3)); property (2a) shows that H preserves G cap F_d.
3. FV Lemma 6.6 then makes C_*(G) -> C_*(F) a quasi-isomorphism of complexes of presheaves; D is injective, so this is the statement on h_i (FV Theorem 7.1).
4. For r = 0, z_equi(X, 0)(Y x V) = Cor_k(Y x V, X) because X is proper (MC.4/equidimensional-cycles-transfers), so h_0(z_equi(Y, X, 0))(Spec k) = h_0(Y, X); and h_0(z_equi(T, s))(Spec k) is CH_s(T) (FV Theorem 4.2(1): a rational equivalence on T is a cycle on T x P^1, restricted to T x A^1 after moving the two fibres to 0 and 1).

**Acceptance.**

- For Y = Spec k, h_0(Spec k, X) = Z_0(X)/(rational equivalence) = CH_0(X).
- For X = Spec k and Y = P^1, h_0(P^1, Spec k) = Z = CH_1(P^1).
- The isomorphism is of presheaves, so it holds after evaluation at every smooth U, not only at Spec k.

**Prerequisites.** `bounded-family-moving-lemma`, `equidimensional-cycles-transfers`, `SchemeAndStackFoundations:SF.5/chow-group`, `MotivicEtaleKTheory:M.5a/finite-correspondence`

**Sources.**

- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Proposition 6.4 (preprint p. 35), Lemma 6.6 (p. 36), Theorem 7.1 with its proof (p. 37). Fibrewise criterion for lying in the image of D, the homotopy lemma, and the duality theorem for smooth projective X and Y over a field.
- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Theorem 4.2(1) (preprint p. 16). h_0 of z_equi(X, r) at Spec k is the group of r-cycles modulo rational equivalence.
- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Proof of Proposition 2.1.4 (preprint pp. 6-7). Uses the case r = 0, i = 0 to identify h_0(X, Y) with the Chow group of dim X-cycles on X x Y.

#### `duality-for-equidimensional-cycles` — Duality for equidimensional cycles with a smooth quasi-projective parameter

*theorem.*

**Statement.** Let k be an infinite field admitting resolution of singularities, U a smooth quasi-projective equidimensional scheme of dimension n, X a scheme of finite type over k and r >= 0. The duality embedding D: z_equi(U, X, r) -> z_equi(X x U, r + n) induces a quasi-isomorphism of complexes of abelian groups C_*(z_equi(U, X, r))(Spec k) -> C_*(z_equi(X x U, r + n))(Spec k), that is, isomorphisms h_i(z_equi(X, r))(U) -> A_{r+n,i}(Spec k, X x U) for all i.

**Hypotheses.**

- k is an infinite field admitting resolution of singularities in the sense of FV Definition 3.4, for example any field of characteristic zero (FV Proposition 3.5); infinite because the moving lemma is used (MotivesAndAlgebraicCycles/E101).
- A smooth projective compactification U in Ubar and an open embedding of X in a proper scheme Xbar (Nagata) are requested from SchemeAndStackFoundations:SF.4 with resolution of singularities.

**Construction, or proof, in steps.**

1. For q: Ybar -> Xbar proper, let Phi_Ybar be the subpresheaf of z_equi(Ubar x Ybar, n + r) generated by the effective cycles whose proper pushforward to Ubar x Xbar, restricted to U x X, lies in the image of D (FV p. 38).
2. FV Proposition 7.3, case Ybar smooth projective: the moving maps of MC.4/bounded-family-moving-lemma on Ubar x Ybar satisfy the hypotheses of FV Lemma 6.6 for G = Phi_Ybar, by the fibrewise criterion FV Lemma 7.2, so h_i(Phi_Ybar)(Spec k) = h_i(z_equi(Ubar x Ybar, r + n))(Spec k).
3. General Ybar, by induction on dimension: resolve Ybar by Ybar' -> Ybar, an isomorphism off a closed Zbar of smaller dimension; compare the abstract blow-up sequences for Phi and for z_equi; the cokernels are presheaves with transfers whose cdh sheaves vanish, so the cdh vanishing theorem and FV Lemma 3.6 give the comparison (FV, end of proof of Proposition 7.3, as in MC.4/equidimensional-cycle-localisation).
4. FV Theorem 7.4: compare 0 -> ker -> Phi_Xbar -> z_equi(U, X, r) -> coker_1 -> 0 with 0 -> ker(alpha) -> z_equi(Ubar x Xbar) -> z_equi(U x X) -> coker_2 -> 0; the left maps are isomorphisms, Proposition 7.3 handles the middle, and h_i(coker_j)(Spec k) = 0 because coker_j are presheaves with transfers (FV Proposition 5.8(2), (3)) with vanishing cdh sheaves.
5. Identify the target with A_{r+n,i}(Spec k, X x U) (MC.4/bivariant-cycle-cohomology) and the source with h_i(z_equi(X, r))(U), by definition of z_equi(U, X, r).

**Acceptance.**

- For U = Spec k (n = 0) the map is the identity.
- For U and X smooth projective the statement is MC.4/projective-duality-for-equidimensional-cycles evaluated at Spec k.
- The comparison is of complexes evaluated at Spec k, not of presheaves: the cdh vanishing theorem concerns sheafifications.

**Prerequisites.** `bounded-family-moving-lemma`, `projective-duality-for-equidimensional-cycles`, `equidimensional-cycle-localisation`, `equidimensional-cycles-transfers`, `bivariant-cycle-cohomology`, `SchemeAndStackFoundations:SF.4`, `MotivicEtaleKTheory:M.5a`

**Sources.**

- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Section 7: Lemma 7.2 (preprint p. 39), Proposition 7.3 (p. 40), Theorem 7.4 with its proof (pp. 41-42). The duality embedding is a quasi-isomorphism at Spec k for U smooth quasi-projective and X arbitrary of finite type, under resolution of singularities.

#### `naive-bivariant-comparison` — Naive and cdh bivariant cycle cohomology agree on smooth quasi-projective schemes

*theorem.*

**Statement.** Let k be an infinite field admitting resolution of singularities, X a scheme of finite type over k, U a smooth quasi-projective scheme over k and r >= 0. The natural maps h_i(z_equi(X, r))(U) -> A_{r,i}(U, X) of MotivesAndAlgebraicCycles:MC.4/bivariant-cycle-cohomology are isomorphisms for all i in Z. In particular for X proper and r = 0: A_{0,0}(U, X) = h_0(U, X) = coker(Cor_k(U x A^1, X) -> Cor_k(U, X)).

**Hypotheses.**

- k is an infinite field admitting resolution of singularities in the sense of Friedlander-Voevodsky, Definition 3.4, for example any field of characteristic zero (FV Proposition 3.5); infinite because the duality theorems rest on the moving lemma (MotivesAndAlgebraicCycles/E101).
- Brown-Gersten descent for presheaves of complexes with the Mayer-Vietoris property on a Noetherian space of finite dimension is SchemeKTheoryOperations:S.4/brown-gersten-vanishing.
- The comparison of Zariski and cdh hypercohomology of C_*(F) on smooth schemes for a presheaf with transfers F (FV Theorem 5.5(1)) is requested from MotivicEtaleKTheory:M.5a.

**Construction, or proof, in steps.**

1. For V smooth of pure dimension n and a Zariski cover V = V_1 union V_2 with V_3 = V_1 cap V_2, the sequence 0 -> C_*z_equi(X, r)(V) -> C_*z_equi(X, r)(V_1) + C_*z_equi(X, r)(V_2) -> C_*z_equi(X, r)(V_3) is, by MC.4/duality-for-equidimensional-cycles, quasi-isomorphic to the value at Spec k of the Mayer-Vietoris triangle of MC.4/equidimensional-cycle-localisation for the cover X x V = (X x V_1) union (X x V_2); so V -> C_*z_equi(X, r)(V) has the Mayer-Vietoris property on quasi-projective smooth schemes ('pseudo-flasque').
2. Brown-Gersten (S.4/brown-gersten-vanishing) then gives H^{-i}_Zar(U, C_*z_equi(X, r)_Zar) = h_i(z_equi(X, r))(U).
3. FV Theorem 5.5(1) identifies the left side with H^{-i}_cdh(U, pi^* C_*z_equi(X, r)) = A_{r,i}(U, X) (FV Theorem 8.1).

**Acceptance.**

- For U = Spec k the statement is the definition A_{r,i}(X) = h_i(z_equi(X, r))(Spec k).
- For U = P^1, X = Spec k, r = 0, i = 0: A_{0,0}(P^1, Spec k) = h_0(z_equi(Spec k, 0))(P^1) = Z.
- The naive groups need not have Mayer-Vietoris in U without the duality theorem; the comparison is what supplies it.

**Prerequisites.** `duality-for-equidimensional-cycles`, `equidimensional-cycle-localisation`, `bivariant-cycle-cohomology`, `SchemeKTheoryOperations:S.4/brown-gersten-vanishing`, `MotivicEtaleKTheory:M.5a`

**Sources.**

- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Theorem 8.1 with its proof (preprint pp. 42-43). The natural maps from the naive groups to the bivariant groups are isomorphisms for U smooth quasi-projective, by duality, localisation and Brown-Gersten.

#### `bivariant-duality` — The duality theorem for bivariant cycle cohomology

*theorem.*

**Statement.** Let k be an infinite field admitting resolution of singularities, X and Y schemes of finite type over k, U a smooth scheme of pure dimension n over k and r >= 0. There are canonical isomorphisms A_{r,i}(Y x U, X) -> A_{r+n,i}(Y, X x U) for all i, natural in Y, induced by the duality embeddings z_equi(U_j, X, r) -> z_equi(X x U_j, r + n) for a quasi-projective open cover (U_j) of U. For Y = Spec k: A_{r,i}(U, X) = A_{r+n,i}(Spec k, X x U).

**Hypotheses.**

- k is an infinite field admitting resolution of singularities in the sense of Friedlander-Voevodsky, Definition 3.4, for example any field of characteristic zero (FV Proposition 3.5); infinite because the duality theorems rest on the moving lemma (MotivesAndAlgebraicCycles/E101).
- U smooth of pure dimension n; X and Y arbitrary of finite type.

**Construction, or proof, in steps.**

1. Cover U by quasi-projective opens U_j and form the total complex C_*(z(U_., X, r)) of the Cech bicomplex; there is a canonical map H^{-i}_cdh(Y, C_*(z(U_., X, r))_cdh) -> A_{r,i}(Y x U, X).
2. The duality embeddings (MC.4/equidimensional-cycles-transfers (vi)) with MC.4/duality-for-equidimensional-cycles give a quasi-isomorphism of cdh complexes C_*(z(U_., X, r))_cdh -> C_*(z_equi(X x U, r + n))_cdh.
3. It remains to see that the first map is an isomorphism; the question is cdh-local in Y, so by resolution of singularities Y may be taken smooth and quasi-projective, where it follows from MC.4/naive-bivariant-comparison and MC.4/duality-for-equidimensional-cycles (FV Theorem 8.2).

**Acceptance.**

- For n = 0 (U = Spec k) both sides are A_{r,i}(Y, X).
- For X = Spec k, Y = Spec k, U = A^1, r = 0, i = 0: A_{0,0}(A^1, Spec k) = Z and A_{1,0}(Spec k, A^1) = CH_1(A^1) = Z.
- This is the input of motivic duality: with MC.4/hom-into-motives-with-compact-support it becomes Hom(M(X x T)[n], M^c(Y)) = Hom(M(X)(d)[2d + n], M^c(T x Y)) for T smooth of dimension d.

**Prerequisites.** `duality-for-equidimensional-cycles`, `naive-bivariant-comparison`, `bivariant-cycle-cohomology`, `equidimensional-cycle-localisation`, `equidimensional-cycles-transfers`, `SchemeAndStackFoundations:SF.4`

**Sources.**

- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Theorem 8.2 with its proof (preprint p. 43). The duality isomorphisms A_{r,i}(Y x U, X) -> A_{r+n,i}(Y, X x U) for U smooth of pure dimension n.
- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Theorem 4.2.2(3) (preprint p. 46). The same duality, for Y smooth equidimensional, as used in the triangulated category of motives.

#### `bivariant-suspension-and-gysin` — Homotopy invariance, suspension, cosuspension and the Gysin sequence for bivariant cycle cohomology

*theorem.*

**Statement.** Let k be an infinite field admitting resolution of singularities and X, Y schemes of finite type over k. (1) Homotopy invariance: flat pullback along X x A^1 -> X induces A_{r,i}(Y, X) = A_{r+1,i}(Y, X x A^1). (2) Suspension: with p: X x P^1 -> X and i: X -> X x P^1 a section at a rational point, i_* + p^* induces A_{r+1,i}(Y, X) + A_{r,i}(Y, X) = A_{r+1,i}(Y, X x P^1). (3) Cosuspension: A_{r,i}(Y x P^1, X) = A_{r+1,i}(Y, X) + A_{r,i}(Y, X), where the summand A_{r,i}(Y, X) is the image of pullback along Y x P^1 -> Y and the projection to it is restriction along Y x {point}. (4) Gysin: for a closed immersion Z in U of smooth schemes of pure codimension c, there is a long exact sequence ... -> A_{r+c,i}(Z, X) -> A_{r,i}(U, X) -> A_{r,i}(U - Z, X) -> A_{r+c,i-1}(Z, X) -> ....

**Hypotheses.**

- k is an infinite field admitting resolution of singularities in the sense of Friedlander-Voevodsky, Definition 3.4, for example any field of characteristic zero (FV Proposition 3.5); infinite because the duality theorems rest on the moving lemma (MotivesAndAlgebraicCycles/E101).
- In (4), Z and U are smooth and every component of Z has codimension c in U.

**Construction, or proof, in steps.**

1. (1): the maps are natural in Y; by the Mayer-Vietoris and blow-up sequences in Y (MC.4/bivariant-cycle-cohomology) and resolution, Y may be taken smooth and quasi-projective; then MC.4/naive-bivariant-comparison, MC.4/duality-for-equidimensional-cycles and homotopy invariance of the presheaves h_i (FV Lemma 4.1) give it (FV Theorem 8.3(1)).
2. (2): the localisation sequence of MC.4/equidimensional-cycle-localisation for X x A^1 in X x P^1, with complement X x {infinity}, together with (1); the section i splits it.
3. (3): MC.4/bivariant-duality moves P^1 from the first variable to the second, and (2) splits the result.
4. (4): MC.4/bivariant-duality writes the three groups as A_{*,i}(Spec k, X x -) for X x Z in X x U, and the localisation sequence of MC.4/equidimensional-cycle-localisation gives the long exact sequence; the dimension of Z gives the index r + c.

**Acceptance.**

- For Y = X = Spec k, (1) is A_{0,i}(Spec k) = A_{1,i}(A^1): both are Z for i = 0.
- (3) is the projective bundle theorem for P^1 in the first variable; the summand A_{r+1,i}(Y, X) is the twist by Z(1)[2] in the motivic form.
- In (4) for U = A^1, Z = {0}, X = Spec k, r = 0, i = 0: A_{1,0}(Spec k, Spec k) = 0 -> A_{0,0}(A^1) = Z -> A_{0,0}(G_m) = Z -> A_{1,-1}(Spec k) = 0.

**Prerequisites.** `bivariant-duality`, `naive-bivariant-comparison`, `duality-for-equidimensional-cycles`, `equidimensional-cycle-localisation`, `bivariant-cycle-cohomology`

**Sources.**

- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Theorem 8.3 (1)-(4) with its proof, and Remark 8.4 (preprint pp. 44-45). Homotopy invariance, suspension, cosuspension and the Gysin sequence, proved from Theorems 8.1, 8.2, 7.4 and the localisation sequence.
- Eric M. Friedlander and Vladimir Voevodsky, *Bivariant cycle cohomology*, Lemma 4.1 (preprint p. 14). The homology presheaves of a singular simplicial complex are homotopy invariant.
- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Theorem 4.2.2(1)-(2) (preprint p. 46). Cosuspension and homotopy invariance as used for the triangulated category of motives.

### Motives with compact support and Chow motives in DM

#### `hom-into-motives-with-compact-support` — Morphisms into motives with compact support are bivariant cycle cohomology

*theorem.*

**Statement.** Let k be an infinite field admitting resolution of singularities, X and Y schemes of finite type over k, r >= 0 and i in Z. Write C_*(Y) for the Suslin complex of Z_tr(Y), which is M(Y) for Y smooth, and M^c(X) = C_*z_equi(X, 0) (MotivesAndAlgebraicCycles:MC.4/motives-with-compact-support). There are canonical isomorphisms Hom_{DM^eff,-_Nis(k)}(C_*(Y)(r)[2r + i], M^c(X)) = A_{r,i}(Y, X), and globally RHom(Z(r)[2r], M^c(X)) = C_*z_equi(X, r) in DM^eff,-_Nis(k). Consequences: (a) shifting: Hom(A(1)[2], C_*z_equi(X, r)) = Hom(A, C_*z_equi(X, r + 1)) for every A in DM^eff,-_Nis(k), and Hom(A(r)[2r], M^c(X)) = Hom(A, C_*z_equi(X, r)); (b) duality: for T smooth of pure dimension d and every n, Hom(M(X x T)[n], M^c(Y)) = Hom(M(X)(d)[2d + n], M^c(T x Y)); (c) flat pullback: a flat equidimensional f: X -> Y of relative dimension n induces f^*: M^c(Y)(n)[2n] -> M^c(X); (d) for X smooth, CH^i(X) = Hom(M(X), Z(i)[2i]); (e) for X and Y smooth proper, Hom(M(X), M(Y)) = CH_{dim X}(X x Y) and Hom(M(X), M(Y)[i]) = 0 for i > 0.

**Hypotheses.**

- k is an infinite field admitting resolution of singularities in the sense of Friedlander-Voevodsky, Definition 3.4, for example any field of characteristic zero (FV Proposition 3.5); infinite because the duality theorems rest on the moving lemma (MotivesAndAlgebraicCycles/E101).
- The comparison Hom(C_*(Y)[i], C_*(F)) = H^{-i}_cdh(Y, pi^* C_*(F)) (Voevodsky, Triangulated categories of motives, Theorem 4.1.10) and the internal Hom RHom(A, -) for A a summand of a motive of a smooth scheme (MVW 14.12) come from MotivicEtaleKTheory:M.5a (the latter is the rhom item of M.5a/effective-motives).

**Construction, or proof, in steps.**

1. r = 0: z_equi(X, 0) is L^c(X), so Hom(C_*(Y)[i], M^c(X)) = A_{0,i}(Y, X) by MC.4/bivariant-cycle-cohomology (homEquiv).
2. Induction on r: Z(1)[2] is the summand of M(P^1) cut out by the projector id - (P^1 -> Spec k -> P^1) (MC.4/motive-of-projective-space), and C_*(Y x P^1) = C_*(Y) tensor M(P^1) (Kuenneth for Suslin complexes of schemes of finite type, MVW 14.2 for Y smooth and the abstract blow-up triangle MC.4/blow-up-triangle-and-formula with resolution in general); so C_*(Y)(r)[2r] is the corresponding summand of C_*(Y x P^1)(r - 1)[2r - 2], and the cosuspension isomorphism of MC.4/bivariant-suspension-and-gysin (3) identifies the summands (Voevodsky, Proposition 4.2.3).
3. Global form: by M.5a's internal Hom, RHom(Z(r)[2r], M^c(X)) is the summand of R p_* p^* C_*z_equi(X, 0) on (P^1)^r cut out by the projector; the morphism C_*z_equi((P^1)^r, X, 0) -> R p_* p^* C_*z_equi(X, 0) is a quasi-isomorphism by MC.4/naive-bivariant-comparison, and pushforward along (P^1)^r x U x X -> U x X maps z_equi((P^1)^r, X, 0) to z_equi(X, r), giving the isomorphism (Voevodsky, Proposition 4.2.8).
4. (a) is the global form with adjunction; it is the theorem MVW cite as Theorem 16.22. (b): Hom(M(X x T)[n], M^c(Y)) = A_{0,n}(X x T, Y) = A_{d,n}(X, Y x T) by MC.4/bivariant-duality = Hom(M(X)(d)[2d + n], M^c(T x Y)); this is the theorem MVW cite as Theorem 16.24.
5. (c): flat pullback C_*z_equi(Y, 0) -> C_*z_equi(X, n) (MC.4/equidimensional-cycles-transfers (iii)) composed with the global form for r = n is adjoint to M^c(Y)(n)[2n] -> M^c(X) (Voevodsky, Corollary 4.2.4; MVW Corollary 16.23).
6. (d): Z(i)[2i] = M^c(A^i) (MC.4/motives-with-compact-support), so Hom(M(X), Z(i)[2i]) = A_{0,0}(X, A^i) = A_{dim X,0}(Spec k, A^i x X) = CH^i(A^i x X) = CH^i(X) by MC.4/bivariant-duality, MC.4/bivariant-suspension-and-gysin (1) and homotopy invariance (Voevodsky, Corollary 4.2.5); it agrees with MC.4/motivic-cohomology-higher-chow.
7. (e): Hom(M(X), M(Y)[i]) = A_{0,-i}(X, Y) = A_{dim X,-i}(Spec k, Y x X) = h_{-i}(z_equi(Y x X, dim X))(Spec k), zero for i > 0 and CH_{dim X}(X x Y) for i = 0 (Voevodsky, Corollary 4.2.6).

**Acceptance.**

- For X = Y = Spec k, r = 0, i = 0: Hom(Z, Z) = A_{0,0}(Spec k, Spec k) = Z.
- (a) for r = 0 and A = Z: Hom(Z(1)[2], M^c(X)) = Hom(Z, C_*z_equi(X, 1)) = CH_1(X) at i = 0; for X = A^1 this is Z, matching M^c(A^1) = Z(1)[2].
- (e) for X = Y = P^1: End(M(P^1)) = CH_1(P^1 x P^1) = Z^2, matching End(Z + Z(1)[2]) = Z + Z.

**Prerequisites.** `bivariant-cycle-cohomology`, `bivariant-duality`, `bivariant-suspension-and-gysin`, `naive-bivariant-comparison`, `equidimensional-cycles-transfers`, `motives-with-compact-support`, `motive-of-projective-space`, `blow-up-triangle-and-formula`, `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.5a`

**Sources.**

- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Proposition 4.2.3, Corollaries 4.2.4-4.2.7 (preprint pp. 47-48), Proposition 4.2.8 (p. 48). Hom groups into the motive with compact support are bivariant cycle cohomology, with the flat pullback, Chow groups, morphisms between motives of smooth proper schemes, and the global form RHom(Z(r)[2r], C^c_*(X)) = C_*z_equi(X, r).
- Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Lecture 16, Theorems 16.22 and 16.24, Corollary 16.23. The shifting and duality theorems that MVW cite without proof; (a), (b) and (c) are these statements, now proved from Friedlander-Voevodsky.

#### `chow-motives-functor` — The functor from Chow motives to geometric motives

*construction.*

**Statement.** Let k be an infinite field and R a commutative ring. Let C_k(R) be the category of smooth projective k-schemes with Hom(X, Y) = CH_{dim X}(X x Y) tensor R (dimension of X taken componentwise) and composition of correspondences, and Chow^eff(k, R) its idempotent completion (homological convention, as in Voevodsky's Triangulated categories of motives, section 2.1). There is an R-linear symmetric monoidal functor Phi: Chow^eff(k, R) -> DM^eff_gm(k, R) with Phi(X) = M(X), Phi(class of W) = M(W) for every finite correspondence W in Cor_k(X, Y) (so Phi(graph of f) = M(f)), and Phi(P^1, Delta - P^1 x {x0}) = R(1)[2]. If k moreover admits resolution of singularities, Phi is fully faithful and Hom(Phi(A), Phi(B)[i]) = 0 for i > 0. If k is perfect and R = Q, composing with the transpose of correspondences gives a Q-linear contravariant functor from the Chow motives of MotivesAndAlgebraicCycles:MC.1/chow-motive to DM_gm(k, Q), sending h(X) to M(X), the twisted motive (X, p, m) to the summand of M(X)(-m)[-2m] cut out by the transpose of p, and the Lefschetz motive to Q(1)[2].

**Hypotheses.**

- k is infinite, for MC.4/projective-duality-for-equidimensional-cycles (MotivesAndAlgebraicCycles/E101).
- Full faithfulness and the vanishing of positive Ext use resolution of singularities through MC.4/hom-into-motives-with-compact-support (e).
- The extension to twisted Chow motives uses the Tate stabilisation of MC.4/tate-stabilised-motives, hence k perfect.

**Construction, or proof, in steps.**

1. For X, Y smooth projective, a finite correspondence W in Cor_k(X, Y) gives M(W): M(X) -> M(Y) (M.5a/effective-motives, M is a functor on Cor_k).
2. M(W) depends only on the class of W in h_0(X, Y) = coker(Cor_k(X x A^1, Y) -> Cor_k(X, Y)): the two restrictions of a correspondence on X x A^1 differ by a map through M(X x A^1) -> M(X), an isomorphism (MC.4/homotopy-invariance-and-mayer-vietoris).
3. h_0(X, Y) = CH_{dim X}(X x Y) by MC.4/projective-duality-for-equidimensional-cycles; define Phi on Hom groups as the inverse of this isomorphism followed by W -> M(W), tensored with R.
4. Composition: the composite of finite correspondences is the pushforward of an intersection product of properly meeting cycles (M.5a/finite-correspondence), and for properly meeting cycles Fulton's intersection product used for Chow correspondences is computed by the same multiplicities (SF.5/tor-intersection, SF.5/smooth-intersection); since every Chow class is the class of a finite correspondence, Phi preserves composition and identities. Voevodsky's proof of his Proposition 2.1.4 calls this sufficient without writing it (MotivesAndAlgebraicCycles/E104).
5. Tensor structure: the exterior product of correspondences maps to the exterior product of cycles (SF.5/exterior-product) and M(X x Y) = M(X) tensor M(Y) (M.5a/effective-motives); the symmetry constraints correspond.
6. Extend to the idempotent completion by Mathlib's karoubiUniversal, DM^eff_gm(k, R) being closed under retracts (MC.4/effective-geometric-motives); the projector Delta - P^1 x {x0} cuts out R(1)[2] of M(P^1) (MC.4/motive-of-projective-space).
7. Full faithfulness under resolution: Hom(M(X), M(Y)) = CH_{dim X}(X x Y) and positive Ext vanish by MC.4/hom-into-motives-with-compact-support (e); the identification sends the class of a finite correspondence W to M(W), because for X smooth quasi-projective and Y proper Hom(M(X), M(Y)) = A_{0,0}(X, Y) = h_0(X, Y) (MC.4/naive-bivariant-comparison), the class of W corresponding to M(W).
8. Comparison with MC.1: MC.1's Hom(h(Y), h(X)) = CH^{dim Y}(Y x X)_Q is CH_{dim X}(X x Y)_Q after transposing, so h -> Phi is a contravariant Q-linear functor; on twists use M(X)(-m)[-2m] in DM_gm(k, Q) (MC.4/tate-stabilised-motives).

**Acceptance.**

- Phi(Spec k) = R with End = R.
- Phi sends the decomposition of P^1 into its two projectors to M(P^1) = R + R(1)[2].
- Under resolution, End(M(P^1)) = CH_1(P^1 x P^1) = Z^2.

**API.**

| name | role | statement |
| --- | --- | --- |
| `chowToDM` | data | The R-linear functor Phi: Chow^eff(k, R) -> DM^eff_gm(k, R). |
| `chowToDM_obj` | simp | Phi(X) = M(X) for X smooth projective. |
| `chowToDM_map_corr` | compatibility | Phi of the class of a finite correspondence W is M(W). |
| `chowToDM_map_graph` | simp | Phi of the graph of f: X -> Y is M(f). |
| `chowToDM_monoidal` | instance | Phi is symmetric monoidal: Phi(X x Y) = Phi(X) tensor Phi(Y), compatibly with the symmetries. |
| `chowToDM_lefschetz` | example | Phi(P^1, Delta - P^1 x {x0}) = R(1)[2]. |
| `h0Equiv` | equivalence | h_0(X, Y) = CH_{dim X}(X x Y) for X, Y smooth projective, the class of a correspondence going to its cycle class. |
| `chowToDM_fullyFaithful` | characterisation | Under resolution of singularities Phi is fully faithful. |
| `chowToDM_ext_eq_zero` | other | Under resolution of singularities Hom(M(X), M(Y)[i]) = 0 for i > 0 and X, Y smooth projective. |
| `chowToDM_contravariant` | compatibility | For k perfect and R = Q, the contravariant functor from MC.1 Chow motives to DM_gm(k, Q): h(X) -> M(X), (X, p, m) -> the summand of M(X)(-m)[-2m] cut out by the transpose of p. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.4/chow-motives-into-geometric-motives`: the base node records the Hom bijections but no functor (gap E24); this node constructs the functor and identifies its Hom maps with those bijections
- Voevodsky, Triangulated categories of motives, Corollary 2.1.5: the switch of Z(1) tensor Z(1) is the identity because it is so for Chow motives
- `MotivicEtaleKTheory:M.5c/rost-motive`: the Rost motive is a direct summand of the Chow motive of a norm variety, transported into DM
- `MotivesAndAlgebraicCycles:MC.4/compactly-supported-motivic-measure`: for X smooth projective the class of M^c(X) = M(X) is the image of the Chow motive of X

**Unit tests.** A plausible wrong definition fails one of these.

- `chowToDM_point` (degenerate): Phi(Spec k) is the unit R and End(Phi(Spec k)) = CH_0(Spec k) tensor R = R.
- `chowToDM_projectiveLine` (computation): Phi(P^1, P^1 x {x0}) = R and Phi(P^1, Delta - P^1 x {x0}) = R(1)[2], so Phi(P^1) = R + R(1)[2].
- `chowToDM_graph` (compatibility): For f: X -> Y a morphism of smooth projective schemes, Phi([Gamma_f]) = M(f).
- `chowToDM_needs_projective` (non-example): For the smooth non-projective A^1, CH_1(A^1 x A^1) = 0 while Hom(M(A^1), M(A^1)) = Hom(Z, Z) = Z: the description of Hom groups by Chow groups fails off smooth projective schemes.

**Prerequisites.** `projective-duality-for-equidimensional-cycles`, `hom-into-motives-with-compact-support`, `naive-bivariant-comparison`, `effective-geometric-motives`, `homotopy-invariance-and-mayer-vietoris`, `motive-of-projective-space`, `tate-stabilised-motives`, `MotivesAndAlgebraicCycles:MC.1/chow-motive`, `MotivesAndAlgebraicCycles:MC.1/lefschetz-motive`, `MotivicEtaleKTheory:M.5a/finite-correspondence`, `MotivicEtaleKTheory:M.5a/effective-motives`, `SchemeAndStackFoundations:SF.5/exterior-product`, `SchemeAndStackFoundations:SF.5/tor-intersection`, `SchemeAndStackFoundations:SF.5/smooth-intersection`, `mathlib:CategoryTheory.Idempotents.karoubiUniversal`

**Sources.**

- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Section 2.1, the category Chow^eff(k), Proposition 2.1.4 with its proof and Corollary 2.1.5 (preprint pp. 6-7). Constructs the functor from effective Chow motives to geometric motives over a field through h_0(X, Y) and the duality theorem, and deduces that the switch of Z(1) tensor Z(1) is the identity.
- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Remark after Corollary 2.1.5 (p. 7), Corollary 4.2.6 (p. 48) and the summary in section 2.2 (p. 11). Under resolution of singularities the functor is a full embedding, positive Ext between motives of smooth projective varieties vanish, and the tensor additive subcategory generated by the M(X)(n)[2n] is the category of Chow motives.
- Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Lecture 20, Proposition 20.1 and Remark 20.2. The bijections of Hom groups and the functor that MVW assert; this node constructs the functor.

### Fundamental triangles over a perfect field

#### `smooth-blow-up-triangle` — The blow-up triangle for a smooth centre over a perfect field

*theorem.*

**Statement.** Let k be a perfect field, R a commutative ring, X a smooth scheme over k, Z a smooth closed subscheme, p: X_Z -> X the blow-up of X along Z and E = p^{-1}(Z) its exceptional divisor, with q: E -> Z and i: E -> X_Z. Then there is a distinguished triangle M(E) -> M(Z) + M(X_Z) -> M(X) -> M(E)[1] in DM^eff,-_Nis(k, R), the first map (M(q), M(i)) and the second M(Z -> X) - M(p). No resolution of singularities is assumed.

**Hypotheses.**

- k is perfect: the proof uses Voevodsky's theorem that Nisnevich cohomology of a homotopy invariant sheaf with transfers is homotopy invariant (MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves, MVW Theorem 13.8).
- Z is smooth, so E is the projective bundle P(N_{Z/X}) of the normal bundle, Zariski locally trivial over Z (SchemeAndStackFoundations:SF.5/normal-deformation and SF.5/normal-cone, the blow-up itself coming from Tau Ceti's StableReduction Layer 4).

**Construction, or proof, in steps.**

1. Let Phi be the complex R_tr(E) -> R_tr(Z) + R_tr(X_Z) -> R_tr(X); it suffices that Phi is zero in DM^eff,-_Nis(k, R), i.e. that Hom(Phi, F[n]) = 0 for every homotopy invariant Nisnevich sheaf with transfers F and every n, these F[n] detecting A^1-local objects (M.5a/effective-motives, MVW 14.8 and 14.11; Voevodsky, Theorem 3.2.6).
2. Replace the sheaves with transfers by the free Nisnevich sheaves Z_Nis(-) without transfers: for a smooth T, Ext^n(R_tr(T), F) = H^n_Nis(T, F) = Ext^n(Z_Nis(T), F) (M.5a/presheaf-with-transfers; Voevodsky, Proposition 3.1.8).
3. The complex Z_Nis(E) -> Z_Nis(Z) + Z_Nis(X_Z) -> Z_Nis(X) is exact except at its right end: Z_Nis(E) -> Z_Nis(Z) is surjective because E -> Z is Zariski locally trivial, and ker Z_Nis(q) = ker Z_Nis(p) because X_Z x_X X_Z is the union of the diagonal and E x_Z E (CTP Proposition 5.19). So Hom(Phi, F[n]) = Ext^n(coker Z_Nis(p), F).
4. These Ext groups vanish (CTP Proposition 5.21): the question is local on X; Nisnevich excision (CTP Proposition 5.18, SchemeAndStackFoundations:SF.2/elementary-distinguished-square) and etale coordinates for the smooth pair (Z, X) reduce to Z x A^d with centre Z x {0}; there the blow-up is a line bundle over Z x P^{d-1}, so its cohomology with coefficients in F is that of Z x P^{d-1} and the cohomology of Z x A^d is that of Z, by homotopy invariance of Nisnevich cohomology (M.5a/homotopy-invariant-sheaves, used in place of CTP Theorem 5.6, whose proof rests on CTP Proposition 4.23; MotivesAndAlgebraicCycles/E105); the cokernel then has no cohomology by CTP Proposition 5.19 applied to E = Z x P^{d-1}.

**Acceptance.**

- If Z is a divisor, p is an isomorphism, E = Z and the triangle is split trivially.
- For a rational point Z of a smooth surface X, E = P^1 and with MC.4/blow-up-formula-over-a-perfect-field the triangle gives M(X_Z) = M(X) + R(1)[2].
- The statement holds over every perfect field, for instance a finite field, where resolution of singularities is not known; this is the difference from MC.4/blow-up-triangle-and-formula.

**Prerequisites.** `homotopy-invariance-and-mayer-vietoris`, `vector-bundle-invariance`, `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.5a/presheaf-with-transfers`, `MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves`, `SchemeAndStackFoundations:SF.5/normal-deformation`, `SchemeAndStackFoundations:SF.5/normal-cone`, `SchemeAndStackFoundations:SF.2/elementary-distinguished-square`, `SchemeAndStackFoundations:SF.0`, `mathlib:CategoryTheory.Pretriangulated.Triangle`

**Sources.**

- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Proposition 3.5.2 with its proof (preprint p. 35); Theorem 3.2.6 (p. 26) and Proposition 3.1.8 (p. 16). The blow-up triangle for a smooth centre in DM^eff_gm over a perfect field, proved by testing against homotopy invariant sheaves and reducing to free Nisnevich sheaves.
- Vladimir Voevodsky, *Cohomological theory of presheaves with transfers*, Section 5.4: Propositions 5.18, 5.19 and 5.21, Corollary 5.22 (preprint pp. 50-52). Nisnevich excision for an etale map isomorphic over a closed subscheme, the kernel comparison for a smooth blow-up, and the vanishing of Ext from the cokernel of Z_Nis(p) into homotopy invariant sheaves.

#### `blow-up-formula-over-a-perfect-field` — The motive of a blow-up with smooth centre, and the Gysin map, over a perfect field

*theorem.*

**Statement.** Let k be a perfect field, R a commutative ring, X a smooth scheme over k, Z a smooth closed subscheme of pure codimension c and p: X_Z -> X the blow-up. (1) M(p): M(X_Z) -> M(X) has a canonical splitting and M(X_Z) = M(X) + (sum for n from 1 to c - 1 of M(Z)(n)[2n]) in DM^eff,-_Nis(k, R). (2) There is a canonical Gysin map g_Z: M(X) -> M(Z)(c)[2c], natural for smooth morphisms X' -> X (with Z' = Z x_X X') and with g_{Z x Y} = g_Z tensor M(Y) for Y smooth. (3) The composite of g_Z with M(Z)(c)[2c] -> R(c)[2c], induced by Z -> Spec k, is the class of Z in H^{2c,c}(X, R) = CH^c(X) tensor R.

**Hypotheses.**

- k perfect; no resolution of singularities (compare MC.4/blow-up-smooth-centre-and-gysin-map, which uses it).
- Z smooth of pure codimension c >= 1 in X; for c = 1 the sum in (1) is empty.

**Construction, or proof, in steps.**

1. Let q: (X x A^1)_{Z x 0} -> X x A^1 be the blow-up along Z x {0} (the deformation to the normal cone, SchemeAndStackFoundations:SF.5/normal-deformation); its exceptional divisor is P(N + O) over Z, containing E = P(N).
2. The triangles of MC.4/smooth-blow-up-triangle for p and for q (Voevodsky's proof cites his Proposition 4.1.3, which needs resolution; Proposition 3.5.2 is the one that applies, MotivesAndAlgebraicCycles/E102) are connected by the maps induced by X = X x {0} -> X x A^1.
3. M(id x {0}) = M(id x {1}) is an isomorphism (MC.4/homotopy-invariance-and-mayer-vietoris), and id x {1} lifts to the blow-up since Z x {0} misses X x {1}; this splits the right column, hence its middle map onto M(X x A^1).
4. P(N) -> P(N + O) is a split monomorphism on motives with canonical splitting (MC.4/projective-bundle-theorem); composing splits M(E) -> M(Z) + M(X_Z) and hence M(X_Z) -> M(X) (exists_iso_binaryBiproduct_of_distTriang); insert M(E) = sum for n < c of M(Z)(n)[2n] (MC.4/projective-bundle-theorem) to obtain (1).
5. Gysin map (Voevodsky p. 37): the difference of the split map M(X) -> M(Z x 0) + M((X x A^1)_{Z x 0}) and the lift of id x {1} maps to zero in M(X x A^1), so lifts to M(P(N + O)); project to the top summand M(Z)(c)[2c] of the projective bundle formula. Naturality for smooth maps and products holds because every step does.
6. (3), asserted without proof by Voevodsky (MotivesAndAlgebraicCycles/E103): apply Hom(-, R(c)[2c]) and identify motivic cohomology of smooth schemes with Chow groups (MC.4/motivic-cohomology-higher-chow); the lift through P(N + O) is the specialisation of [Z x A^1] in the deformation space (SF.5/specialization), whose restriction to P(N + O) is the class of the zero section, and in the projective bundle formula for Chow groups (SF.5/projective-bundle-formula) that class has coefficient 1 on the top summand.

**Acceptance.**

- For the blow-up of a smooth surface at a rational point (c = 2), M(X_Z) = M(X) + R(1)[2], matching CH^1(X_Z) = CH^1(X) + Z.
- For c = 1, p is an isomorphism and g_Z composed with the structure map is the divisor class [Z] in Pic(X).
- For X = P^c and Z a rational point, (3) says that g_Z composed with M(Z)(c)[2c] = R(c)[2c] is the class of a point, a generator of CH^c(P^c) tensor R = R.

**Prerequisites.** `smooth-blow-up-triangle`, `projective-bundle-theorem`, `homotopy-invariance-and-mayer-vietoris`, `motivic-cohomology-higher-chow`, `SchemeAndStackFoundations:SF.5/normal-deformation`, `SchemeAndStackFoundations:SF.5/specialization`, `SchemeAndStackFoundations:SF.5/projective-bundle-formula`, `mathlib:CategoryTheory.Pretriangulated.exists_iso_binaryBiproduct_of_distTriang`

**Sources.**

- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Proposition 3.5.3 with its proof (preprint p. 36), the construction of g_Z after it (p. 37), and its naturality conditions, stated in the proof of Proposition 3.5.4 (p. 38). The splitting of the motive of a blow-up with smooth centre over a perfect field, via the deformation diagram, and the Gysin map with its naturality and the cycle-class property.
- Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Lecture 15, Corollary 15.13. The same decomposition, proved there through the abstract blow-up triangle and hence under resolution of singularities.

#### `gysin-triangle-over-a-perfect-field` — The Gysin triangle over a perfect field and the boundary map at a closed point of a curve

*theorem.*

**Statement.** Let k be a perfect field, R a commutative ring, X a smooth scheme over k and Z a smooth closed subscheme of pure codimension c. There is a canonical distinguished triangle M(X - Z) -> M(X) -> M(Z)(c)[2c] -> M(X - Z)[1] in DM^eff,-_Nis(k, R), with first map induced by the open immersion and second map the Gysin map g_Z of MotivesAndAlgebraicCycles:MC.4/blow-up-formula-over-a-perfect-field; it is natural for smooth morphisms X' -> X with Z' = Z x_X X' and compatible with products with smooth Y. For X a smooth curve and x a closed point, k(x) is finite separable over k, Spec k(x) is smooth, and the triangle reads M(X - x) -> M(X) -> M(Spec k(x))(1)[2] -> M(X - x)[1]; applying Hom(-, R(i)[n]) gives the exact localisation sequence ... -> H^{n-2,i-1}(k(x), R) -> H^{n,i}(X, R) -> H^{n,i}(X - x, R) -> H^{n-1,i-1}(k(x), R) -> ..., whose last map is the boundary map at x. In weight i = 1 it is 0 -> O(X)^x -> O(X - x)^x -> Z -> Pic(X) -> Pic(X - x) -> 0 tensored with R, the boundary map being the valuation ord_x and Z -> Pic(X) sending 1 to the class of x.

**Hypotheses.**

- k perfect; no resolution of singularities. This replaces the resolution hypothesis of MC.4/gysin-triangle (MotivesAndAlgebraicCycles/E21).
- Etale coordinates for the smooth pair (X, Z): locally on X there is an etale f: X -> A^d with Z = f^{-1}(A^{d-c}) (EGA IV 17.12.2); requested from SchemeAndStackFoundations:SF.0, whose SF.0/etale-coordinates gives the absolute case.
- The sign of the boundary map is fixed by the convention of the cone in the triangle; with the convention of MC.4/motive-of-projective-space it is +ord_x.

**Construction, or proof, in steps.**

1. Write M(X/(X - Z)) for the cone of M(X - Z) -> M(X), the class of C_*(Z_tr(X)/Z_tr(X - Z)); it suffices to give an isomorphism alpha(X, Z): M(X/(X - Z)) -> M(Z)(c)[2c] through which g_Z factors.
2. Run the deformation diagram of MC.4/blow-up-formula-over-a-perfect-field for the relative objects M(X_Z/(X_Z - E)) and M(X/(X - Z)); as there, M(X_Z/(X_Z - E)) = M(X/(X - Z)) + sum for 1 <= n < c of M(Z)(n)[2n] compatibly with the triangles, and g_Z factors through alpha(X, Z), which is natural for smooth maps and products (Voevodsky pp. 37-38).
3. alpha is compatible with the Mayer-Vietoris triangles of an open cover of X and of the induced cover of Z (MC.4/homotopy-invariance-and-mayer-vietoris), so being an isomorphism is local on X.
4. Locally choose etale coordinates f: X -> A^d with Z = f^{-1}(A^{d-c}); in Y = X x_{A^d} (Z x A^c) the diagonal copy of Z is open and closed in the preimage of Z, and on the open X' = Y - (the other components) Nisnevich excision (CTP Proposition 5.18, M.5a/presheaf-with-transfers) gives isomorphisms M(X'/(X' - Z')) -> M(X/(X - Z)) and M(X'/(X' - Z')) -> M(Z x A^c/(Z x A^c - Z x 0)). By naturality and the product compatibility it suffices that alpha(A^c, 0), equivalently alpha(P^c, pt), is an isomorphism.
5. Normalisation, which Voevodsky says follows easily from the construction (MotivesAndAlgebraicCycles/E103): P^c - pt is a line bundle over P^{c-1} (MC.4/vector-bundle-invariance), so M(P^c/(P^c - pt)) = M(P^c/P^{c-1}) = R(c)[2c] (MC.4/projective-space-quotient), and alpha(P^c, pt) is an endomorphism of R(c)[2c], i.e. an element of R by cancellation (M.5a/cancellation); by part (3) of MC.4/blow-up-formula-over-a-perfect-field it is the coefficient of the class of a point in CH^c(P^c) tensor R = R, namely 1.
6. Curve case: c = 1 and Spec k(x) is smooth as k is perfect; apply Hom(-, R(i)[n]), cancellation and representability H^{n,i}(T, R) = Hom(M(T), R(i)[n]) (M.5a/effective-motives); in weight one H^{1,1} = O^x and H^{2,1} = Pic (MotivicEtaleKTheory:M.4/weight-zero-and-one with MC.4/motivic-cohomology-higher-chow), and the boundary is ord_x, as one checks on X = A^1, x = 0, where M(G_m) = R + R(1)[1] and the coordinate t has ord_0(t) = 1.

**Acceptance.**

- For X = P^1 and a rational point x, M(A^1) -> M(P^1) -> R(1)[2] -> recovers M(A^1) = R from M(P^1) = R + R(1)[2].
- For X = A^1 over Q and x = V(t^2 + 1), the third term is M(Spec Q(i))(1)[2], not R(1)[2]; the boundary map O(A^1 - x)^x -> H^{0,0}(Spec Q(i)) = Z sends t^2 + 1 to 1.
- The triangle exists over every perfect field, including finite fields and their algebraic closures, which is what the norm residue arguments of MotivicEtaleKTheory:M.5c need in characteristic different from l.

**Prerequisites.** `blow-up-formula-over-a-perfect-field`, `smooth-blow-up-triangle`, `projective-space-quotient`, `vector-bundle-invariance`, `motive-of-projective-space`, `homotopy-invariance-and-mayer-vietoris`, `effective-geometric-motives`, `motivic-cohomology-higher-chow`, `MotivicEtaleKTheory:M.5a/presheaf-with-transfers`, `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.5a/cancellation`, `MotivicEtaleKTheory:M.4/weight-zero-and-one`, `SchemeAndStackFoundations:SF.0`, `mathlib:CategoryTheory.Pretriangulated.Triangle`

**Sources.**

- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Proposition 3.5.4 with its proof (preprint pp. 37-39). The Gysin triangle for a smooth pair over a perfect field, built from the morphism alpha(X, Z) and proved to be an isomorphism by Mayer-Vietoris, Nisnevich excision and reduction to (P^c, point).
- Vladimir Voevodsky, *Cohomological theory of presheaves with transfers*, Proposition 5.18 (preprint p. 50). Nisnevich excision for an etale map that is an isomorphism over a closed subscheme.
- Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Lecture 15, Theorem 15.15. The same triangle, proved there from Corollary 15.13 and hence under resolution of singularities.

### Tate motives and the motivic measure

#### `tate-motives` — Tate motives

*construction.*

**Statement.** Let k be a perfect field and R a commutative ring. The category DTM(k, R) of Tate motives is the full subcategory of DM_gm(k, R) (MotivesAndAlgebraicCycles:MC.4/tate-stabilised-motives) on the thick envelope of the objects R(n), n in Z: the smallest triangulated subcategory closed under retracts and isomorphisms containing every R(n). It is a tensor triangulated subcategory stable under all twists, and contains M(Spec k), M(A^n), M(G_m), M(P^n) and every effective geometric motive built from these by cones. Its Hom groups are motivic cohomology of k: Hom(R(p), R(q)[m]) = H^{m,q-p}(Spec k, R) for q >= p, and = 0 for q < p. For R = Q these are rational motivic cohomology groups CH^{q-p}(k, 2(q - p) - m) tensor Q of the field, the input of the mixed Tate t-structure that PeriodsAndSpecialValues:PS.9 constructs.

**Hypotheses.**

- k perfect, for the Tate stabilisation and cancellation (MotivicEtaleKTheory:M.5a/cancellation).
- No t-structure is installed here: the heart MT(k) of mixed Tate motives, which exists for number fields by Beilinson-Soule vanishing, belongs to PeriodsAndSpecialValues:PS.9/mixed-tate-z, which imports this category.

**Construction, or proof, in steps.**

1. Take the Mathlib triangulated envelope of the object property 'isomorphic to some R(n)' in DM_gm(k, R) and the full subcategory on it, as for MC.4/effective-geometric-motives.
2. Tensor stability: R(a) tensor R(b) = R(a + b), and the class of objects A with A tensor R(b) in DTM is thick and contains the generators, so it is everything; repeat in the other variable.
3. Hom groups for q >= p: by cancellation Hom(R(p), R(q)[m]) = Hom(R, R(q - p)[m]) (MC.4/tate-stabilised-motives, hom_mk), which is H^{m,q-p}(Spec k, R) by representability (M.5a/effective-motives).
4. Vanishing for q < p: reduce by cancellation to Hom(R(n), R[m]) with n > 0, and then to n = 1: R(1)[1] is the reduced motive of G_m, so Hom(R(1), R[m]) is the cokernel of H^{m+1,0}(Spec k, R) -> H^{m+1,0}(G_m, R), which vanishes because weight-zero motivic cohomology is the Zariski cohomology of the constant sheaf R (MotivicEtaleKTheory:M.4/weight-zero-and-one (a)).
5. Membership: M(A^n) = R, M(G_m) = R + R(1)[1] and M(P^n) = sum of R(i)[2i] (MC.4/motive-of-projective-space).

**Acceptance.**

- Hom(Q(0), Q(1)[1]) = H^{1,1}(Spec k, Q) = k^x tensor Q.
- Hom(Q(0), Q(0)[m]) is Q for m = 0 and 0 otherwise.
- DTM(k, R) contains R(-1), which is not in the thick subcategory generated by the effective Tate objects R(n), n >= 0.

**API.**

| name | role | statement |
| --- | --- | --- |
| `DTM` | data | The full subcategory of DM_gm(k, R) on the thick envelope of the R(n), n in Z. |
| `DTM.of_tate` | constructor | R(n) is a Tate motive for every integer n. |
| `DTM.incl` | projection | The fully faithful triangulated inclusion DTM(k, R) -> DM_gm(k, R). |
| `DTM.isTriangulated` | instance | The defining property is triangulated and closed under retracts and isomorphisms. |
| `DTM.le_iff` | universal-property | DTM is contained in a thick subcategory Q if and only if every R(n) lies in Q. |
| `DTM.tensor` | instance | DTM is closed under the tensor product and under twisting by R(n). |
| `DTM.hom_tate` | characterisation | Hom(R(p), R(q)[m]) = H^{m,q-p}(Spec k, R) for q >= p. |
| `DTM.hom_tate_neg` | relation | Hom(R(p), R(q)[m]) = 0 for q < p and all m. |
| `DTM.motive_projectiveSpace` | example | M(P^n) and M(G_m) are Tate motives. |

**Uses.**

- `PeriodsAndSpecialValues:PS.9/mixed-tate-z`: the mixed Tate heart MT(Q) is taken inside the Tate-generated triangulated subcategory of MC.4, with Hom groups given by rational motivic cohomology of the field
- `ZagierConjecturePolylogarithms:Z.3/motivic-correlator`: mixed Tate motives over a number field F live in DTM(F, Q); the request MT-1 for the heart over number fields is answered by PS.9 on top of this category
- `MotivesAndAlgebraicCycles:MC.4/compactly-supported-motivic-measure`: the image of the Lefschetz class is the class of the Tate object

**Unit tests.** A plausible wrong definition fails one of these.

- `dtm_hom_weight_one` (computation): Hom_{DTM(k,Q)}(Q, Q(1)[1]) = k^x tensor Q, and Hom(Q, Q(1)[2]) = Pic(Spec k) tensor Q = 0.
- `dtm_hom_unit` (degenerate): Hom(R, R[m]) is R for m = 0 and 0 for m != 0.
- `dtm_projectiveSpace` (characterisation): M(P^2) = R + R(1)[2] + R(2)[4] lies in DTM(k, R).
- `dtm_needs_negative_twists` (non-example): R(-1) lies in DTM(k, R), but not in the thick subcategory generated by the R(n) with n >= 0: every object A there has Hom(A, R(-1)[m]) = 0, because Hom(R(n), R(-1)[m]) = Hom(R(n + 1), R[m]) = 0, while the identity of R(-1) is nonzero.

**Prerequisites.** `tate-stabilised-motives`, `effective-geometric-motives`, `motive-of-projective-space`, `MotivicEtaleKTheory:M.5a/cancellation`, `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.4/weight-zero-and-one`, `mathlib:CategoryTheory.ObjectProperty.triangEnvelope`, `mathlib:CategoryTheory.ObjectProperty.triangEnvelope_le_iff`

**Sources.**

- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Section 2.1, definition of Z(1) and of DM_gm(k) (preprint p. 5); Corollary 3.4.3 (p. 33). The Tate object as the reduced motive of P^1 shifted by -2, the category obtained by inverting it, and Hom(M(X), Z(1)[j]) as Zariski cohomology of G_m, the weight-one input of the Hom computation.
- Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Lecture 14, Definition 14.1 and the paragraph after Definition 14.2. The geometric and Tate-stabilised categories in which the thick envelope is taken.

#### `grothendieck-ring-of-varieties` — The Grothendieck ring of varieties

*definition.*

**Statement.** Let k be a field. K_0(Var_k) is the quotient of the free abelian group on the isomorphism classes [X] of separated schemes of finite type over k by the scissor relations [X] = [Z] + [X - Z] for every closed subscheme Z of X; it is a commutative ring with [X] [Y] = [X x_k Y] and unit [Spec k]. The Lefschetz class is L = [A^1]. Consequences: [X] = [X_red], [empty] = 0, [A^n] = L^n, [P^n] = 1 + L + ... + L^n, [G_m] = L - 1, and an assignment X -> phi(X) in a commutative ring that is constant on isomorphism classes, satisfies the scissor relations, is multiplicative and sends Spec k to 1 factors uniquely through a ring homomorphism K_0(Var_k) -> A.

**Hypotheses.**

- k a field; schemes are separated of finite type; the scissor relation uses reduced or arbitrary closed subschemes indifferently, since [X] = [X_red] follows from it with Z = X_red.

**Construction, or proof, in steps.**

1. Define the free abelian group on isomorphism classes (Mathlib FreeAbelianGroup on the quotient type of isomorphism classes) and quotient by the subgroup generated by the scissor relations.
2. The product is well defined: for Z in X closed, (X x Y) = (Z x Y) union ((X - Z) x Y) with Z x Y closed, so the relations form an ideal; associativity, commutativity and unit come from those of the fibre product over k.
3. Consequences: Z = X_red gives [X] = [X_red] + [empty] and [empty] = 0 from X = empty; A^n is stratified by the A^j; P^n = A^n union P^{n-1}; G_m = A^1 - {0}.
4. Universal property: by the universal property of the free abelian group and of the quotient.

**Acceptance.**

- [P^1] = 1 + L and [G_m] = L - 1.
- [empty] = 0 and [Spec k] = 1.
- The scissor relation is not a consequence of the disjoint-union relation: A^1 is not a disjoint union of G_m and a point.

**API.**

| name | role | statement |
| --- | --- | --- |
| `K0Var` | data | The ring K_0(Var_k). |
| `K0Var.mk` | constructor | The class [X] of a separated scheme of finite type over k. |
| `K0Var.mk_scissor` | relation | [X] = [Z] + [X - Z] for Z closed in X. |
| `K0Var.mk_prod` | simp | [X x_k Y] = [X] [Y]. |
| `K0Var.mk_point` | simp | [Spec k] = 1. |
| `K0Var.mk_iso` | extensionality | Isomorphic schemes have the same class. |
| `K0Var.lefschetz` | data | L = [A^1]. |
| `K0Var.mk_affineSpace` | example | [A^n] = L^n. |
| `K0Var.mk_projectiveSpace` | example | [P^n] = 1 + L + ... + L^n. |
| `K0Var.lift` | universal-property | A scissor-additive, multiplicative, isomorphism-invariant assignment with phi(Spec k) = 1 factors uniquely through a ring homomorphism from K_0(Var_k). |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.4/compactly-supported-motivic-measure`: the source of the motivic measure X -> [M^c(X)]
- `LogicAndDefinabilityInNumberTheory:LD.3/geometric-realization-interface`: geometric residue classes are realised in a localisation of the Grothendieck ring of motives through K_0(Var_k), which LD.3 keeps distinct from its definable Grothendieck rings

**Unit tests.** A plausible wrong definition fails one of these.

- `k0var_projectiveLine` (computation): [P^1] = 1 + L in K_0(Var_k).
- `k0var_empty` (degenerate): [empty] = 0 and [Spec k] = 1.
- `k0var_multiplicativeGroup` (computation): [G_m] = L - 1 and [G_m x G_m] = L^2 - 2L + 1.
- `k0var_not_disjoint_union_only` (non-example): In the group completion of isomorphism classes under disjoint union alone, [A^1] and [G_m] + [Spec k] are distinct (A^1 is connected and not isomorphic to G_m disjoint union a point); the scissor relation identifies them, and without it the Lefschetz class would not satisfy [P^1] = 1 + L.

**Prerequisites.** `mathlib:FreeAbelianGroup`, `mathlib:AlgebraicGeometry.Scheme.Over`

**Sources.**

- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Section 2.2, motives with compact support, item 2 (preprint p. 9). The localisation triangle for motives with compact support, the property that makes [X] -> [M^c(X)] respect the scissor relations; the ring K_0(Var_k) is the source of that assignment.

#### `compactly-supported-motivic-measure` — The motivic measure given by motives with compact support

*construction.*

**Statement.** Let k be an infinite field admitting resolution of singularities. Let K_0(DM_gm(k, R)) be the Grothendieck group of the triangulated category DM_gm(k, R): the free abelian group on isomorphism classes [A] modulo [B] = [A] + [C] for every distinguished triangle A -> B -> C -> A[1]; it is a commutative ring under the tensor product, [A[1]] = -[A], and [R(1)] is a unit with inverse [R(-1)]. The assignment X -> [M^c(X)] defines a ring homomorphism chi_c: K_0(Var_k) -> K_0(DM_gm(k, Z)) with chi_c(L) = [Z(1)] = [Z(1)[2]] and chi_c(X) = [M(X)] for X proper. Hence chi_c extends uniquely to K_0(Var_k)[L^{-1}], and, after tensoring with Q and inverting the elements 1 - [Q(-i)], i >= 1, to a ring homomorphism K_0(Var_k)[L^{-1}, (1 - L^{-i})^{-1}] -> K_0(DM_gm(k, Q))[(1 - [Q(-i)])^{-1} : i >= 1], the named localised Grothendieck ring of motives. For X smooth projective chi_c(X) is the class of the image of the Chow motive of X under MotivesAndAlgebraicCycles:MC.4/chow-motives-functor.

**Hypotheses.**

- k is infinite and admits resolution of singularities, for example of characteristic zero: M^c(X) is geometric (MC.4/compact-support-geometric), has the localisation triangle (MC.4/compact-support-localisation-triangle) and the Kuenneth isomorphism (MC.4/compact-support-kunneth), all under resolution.
- The localisations are those of Mathlib's Localization, at the submonoids generated by the listed elements.

**Construction, or proof, in steps.**

1. K_0 of the triangulated category: the quotient of the free abelian group on isomorphism classes by the triangle relations; the tensor product is exact in each variable (tensor triangulated category), so it descends to a commutative ring structure with unit [Z]; rotation of triangles gives [A[1]] = -[A].
2. Scissors: the triangle M^c(Z) -> M^c(X) -> M^c(X - Z) -> gives [M^c(X)] = [M^c(Z)] + [M^c(X - Z)]; isomorphic schemes have isomorphic M^c.
3. Products: M^c(X x Y) = M^c(X) tensor M^c(Y) (MC.4/compact-support-kunneth, whose natural map is the exterior product of MC.4/equidimensional-cycles-transfers (v)); M^c(Spec k) = Z.
4. So K0Var.lift (MC.4/grothendieck-ring-of-varieties) gives chi_c. M^c(A^1) = Z(1)[2] (MC.4/motives-with-compact-support), so chi_c(L) = [Z(1)[2]] = [Z(1)], a unit because Z(1) tensor Z(-1) = Z in DM_gm (MC.4/tate-stabilised-motives).
5. The extensions are the universal property of localisation (Mathlib IsLocalization.lift): the images of L and of 1 - L^{-i} are [Z(1)] and 1 - [Z(-i)], units in the target.
6. For X proper M^c(X) = M(X); for X smooth projective, M(X) is the image of its Chow motive.

**Acceptance.**

- chi_c(P^n) = sum for i from 0 to n of [Z(i)], from M(P^n) = sum of Z(i)[2i].
- chi_c(G_m) = [Z(1)] - 1, from M^c(G_m) = Z(1)[2] + Z[1].
- chi_c(Spec k) = 1 and chi_c(empty) = 0.

**API.**

| name | role | statement |
| --- | --- | --- |
| `K0Tri` | data | The Grothendieck ring K_0(DM_gm(k, R)) of the tensor triangulated category. |
| `K0Tri.mk_triangle` | relation | [B] = [A] + [C] for a distinguished triangle A -> B -> C -> A[1]. |
| `K0Tri.mk_shift` | simp | [A[1]] = -[A], hence [A[2]] = [A]. |
| `K0Tri.mk_tensor` | simp | [A tensor B] = [A] [B] and [Z] = 1. |
| `K0Tri.isUnit_tate` | other | [R(1)] is a unit with inverse [R(-1)]. |
| `chiC` | data | The ring homomorphism chi_c: K_0(Var_k) -> K_0(DM_gm(k, Z)), [X] -> [M^c(X)]. |
| `chiC_lefschetz` | simp | chi_c(L) = [Z(1)]. |
| `chiC_of_proper` | compatibility | chi_c(X) = [M(X)] for X proper; for X smooth projective it is the class of the image of the Chow motive of X. |
| `chiC.localized` | universal-property | The unique extension K_0(Var_k)[L^{-1}, (1 - L^{-i})^{-1}] -> K_0(DM_gm(k, Q))[(1 - [Q(-i)])^{-1}] of chi_c tensor Q. |

**Uses.**

- `LogicAndDefinabilityInNumberTheory:LD.3/geometric-realization-interface`: the requested scissor and product realisation into an explicitly named localised rational Grothendieck ring of motives, with L and 1 - L^{-i} invertible
- `MotivesAndAlgebraicCycles:MC.4/tate-motives`: the image of K_0(Var_k) on cellular varieties lies in the subring generated by the classes of Tate motives

**Unit tests.** A plausible wrong definition fails one of these.

- `chiC_projectiveLine` (computation): chi_c(P^1) = 1 + [Z(1)] = 1 + chi_c(L).
- `chiC_point` (degenerate): chi_c(Spec k) = 1 and chi_c(empty) = 0.
- `chiC_multiplicativeGroup` (computation): chi_c(G_m) = [Z(1)] - 1, from M^c(G_m) = Z(1)[2] + Z[1].
- `chiC_not_motive` (non-example): The assignment X -> [M(X)] (motive without compact support) is not a motivic measure compatible with the Lefschetz class: scissors would force [M(P^1)] = [M(A^1)] + [M(Spec k)] = 2, whereas [M(P^1)] = 1 + [Z(1)], so it would send L to 1 and make the localisation at 1 - L^{-1} the zero ring.

**Prerequisites.** `grothendieck-ring-of-varieties`, `motives-with-compact-support`, `compact-support-localisation-triangle`, `compact-support-kunneth`, `compact-support-geometric`, `tate-stabilised-motives`, `motive-of-projective-space`, `equidimensional-cycles-transfers`, `chow-motives-functor`, `mathlib:FreeAbelianGroup`, `mathlib:IsLocalization.lift`, `mathlib:Localization`

**Sources.**

- Vladimir Voevodsky, *Triangulated categories of motives over a field*, Section 2.2, motives with compact support, items 1-4 (preprint p. 9); Propositions 4.1.5 and 4.1.7, Corollary 4.1.8 (pp. 42-43). M^c(X) = M(X) for proper X, the localisation triangle, the Kuenneth isomorphism and M^c(X x A^1) = M^c(X)(1)[2], the properties that make X -> [M^c(X)] a ring homomorphism from K_0(Var_k).
