# Geometric Satake over the Fargues–Fontaine curve (part from GS3)

Blueprint for the roadmap `GeometricSatakeAndFusion`, job `BP-GeometricSatakeAndFusion--GS3` (issue #742).
Packet: `research/blueprint/packets/GeometricSatakeAndFusion--GS3.json` (`"part": "GS3"`). Suggested Lean file:
`research/blueprint/suggested/GeometricSatakeAndFusion--GS3.lean`. Handoff:
`research/blueprint/handoff/BP-GeometricSatakeAndFusion--GS3.md`.

This part covers `GS3` with its substage and the four `GS4` stages. `GS0`, `GS1` and `GS2` belong to the other
part (`BP-GeometricSatakeAndFusion--GS0`, issue #741) and are consumed here as requests.

**Status: partial.** Five of the six layers in scope are decomposed; `GS4:classical-Satake-comparison` is
`not_read` and gets no node, for the reason given below. The packet has 7 nodes (6 theorems and one
construction), 8 API items, 5 unit tests and 7 planets; it cites 21 declarations of the pinned libraries,
records 9 gaps, makes 15 requests and 2 structural proposals.

Only one node of this part is a construction and none is a definition, so there is one API block with its unit
tests — the fusion product. The other six are theorems, and PROTOCOL sections 4 and 12 ask for an API and unit
tests for definitions and constructions.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources

**All four sources were downloaded again in this session and all four SHA-256 hashes reproduce the recorded
values byte for byte.** Only Fargues–Scholze is cited by the nodes of this part; the other three are carried
from the decomposition because they are the roadmap's sources and are cited by the other part.

- **`FS-geometrization`** — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*. Author-hosted 356-page PDF (MPIM Bonn), inspected 2026-09-15; corresponds to arXiv:2102.13459v4 by metadata and contents, not by byte comparison. PDF page = printed page.
  <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>, read 2026-09-16.
  SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` — reproduced 24 September 2026.
- **`BS17-witt-grassmannian`** — Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*. arXiv:1507.06490v3 [math.AG], 21 February 2017 (published Invent. Math. 209 (2017)); library PDF, printed page = PDF page
  <https://arxiv.org/abs/1507.06490>, read 2026-09-16.
  SHA-256 `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e` — reproduced 24 September 2026.
- **`Keel99-basepoint`** — Sean Keel, *Basepoint freeness for nef and big line bundles in positive characteristic*. Annals of Mathematics 149 (1999), 253-286; library copy is arXiv:math/9901149v1 (1 January 1999) with the Annals pagination printed. Printed page = PDF page + 252.
  <https://arxiv.org/abs/math/9901149>, read 2026-09-16.
  SHA-256 `2ec4141aea36ad77e5b504f01617ffbbe17de0af27f8b2c5f4a1f4ee6afde398` — reproduced 24 September 2026.
- **`SW20-berkeley`** — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*. Annals of Mathematics Studies 207; PDF dated 'March 27, 2020'. Printed page = PDF page - 10.
  <https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf>, read 2026-09-16.
  SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` — reproduced 24 September 2026.

## What the pinned libraries have, and what they do not

`data/library-coverage.json` has **no reviewed audit entry for this roadmap**, so the pinned declaration index was
searched directly. The large finding is on the Tannakian side.

**Tau Ceti already has Tannaka reconstruction.** 125 declarations across twelve files under
`TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/`, including:

- `TauCeti.Tannaka.tensorAutFunctor : CommAlgCat R ⥤ GrpCat` — the tensor-automorphism functor of the fibre
  functor, which is the Tannakian group functor itself;
- `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` — the reconstruction isomorphism;
- `TauCeti.Tannaka.reconstructedPoint` — its explicit direction.

Mathlib adds `HopfAlgebra`, `Bialgebra`, `BraidedCategory`, `SymmetricCategory` and `Functor.Braided`. None of
that is planned here; all of it is cited.

**What it does not give** is the statement this layer exists for. Tau Ceti's reconstruction is over a *field*,
for finitely generated comodules over a Hopf algebra. Fargues–Scholze identify a group scheme over `ℤ_ℓ`,
recovered from the torus and the rank-one Levi maps by maximal-compact generation. The roadmap says *"rational
reductivity alone does not identify the integral group scheme"*, and the library search says the same of the
pinned reconstruction.

**Absent at both pins:** any Weil group (no declaration whose name contains `WeilGroup`), and any Langlands dual
group (nothing containing `LanglandsDual` or `DualGroup`). `RootPairing` gives the combinatorics and
`TauCeti.GeneralLinear.diagonalRootDatum` a worked example, so the combinatorial half exists and the group half
does not. Both are requested.

## GS3. Fusion, symmetry and finite-set functoriality

An aggregate layer with no node of its own.

**Coverage: `partial`.** Aggregate layer over GS3:fusion; it has no node of its own and its coverage is that of the substage.

Remaining in this layer:

- Aggregate stage; inherits the remaining items of GS3:fusion.

## GS3:fusion. Coherent collision and factorization maps

Over the disjoint-leg locus `Hck^I_G` is literally the product of the
`Hck^{I_j}_G`, so exterior product gives a functor into `Sat^{I;I_1,…,I_k}_G`. The whole construction then turns on two
things: that restriction to that locus is **fully faithful**, so the exterior product extends back over the collision
diagonals; and that the extension carries the right **sign**.

Full faithfulness reduces to `i^*i^!A ∈ ^pD^{≥2}` for the complementary closed `Z`, and that comes from a geometric
fact: `Z` is stratified by **partial diagonals** with smooth strata of `ℓ`-codimension `≥ 1` inside the smooth
`(Div¹_X)^I`.

The sign rule is the delicate part and the packet keeps the source's own justification rather than treating it as a
convention. `Hck^I_G` splits into even and odd parts by the parity of `d_{μ∙} = Σ_i ⟨2ρ,μ_i⟩`, and the splitting is
open *and closed* precisely because the dominance order never compares elements of different parity. One then imposes a
minus sign whenever two odd objects are commuted — and Fargues–Scholze say why it is not a free choice:

> Indeed, note that the functors `F^I` invoke a shift by `deg`, which exactly introduces this sign rule. This in fact
> pins down this choice of signs by faithfulness of the functors.

Without it `F^I` is symmetric monoidal for a *super* variant and the dual group comes out wrong. With it, each
`Sat^I_G` is symmetric monoidal and the fusion product refines convolution.

Two further things the layer records. `LocSys((Div¹_X)^I, Λ) ≃ Rep_{W_E^I}(Λ)` — continuous representations on **finite
projective** `Λ`-modules — and the source's proof of that is one line: *"This is a consequence of Proposition
IV.7.3"*, Drinfeld's lemma, which the decomposition records as unread. And functoriality in `I` comes from the closed
immersion `Gr^I_G ×_{(Div¹)^I} (Div¹)^J → Gr^J_G`, with a footnote in the source, crediting Tony Feng, that on **Hecke
stacks** the map is *not* a closed immersion.

Fusion is constructed with **no characteristic-zero semisimplicity input**. That is what keeps the roadmap acyclic:
semisimplicity is the separate, later dependency of `GS4:rational-reductivity`.

**Coverage: `partial`.** Full faithfulness of restriction to the disjoint-leg locus, the fusion product with its Koszul sign rule, and the finite-set functoriality with the duality and constant-term compatibilities. The sign rule is the delicate point and the packet keeps the source's own reason for it: the shift by deg inside F^I introduces exactly that sign, and faithfulness of the functors pins the choice down. Fusion is constructed with no characteristic-zero semisimplicity input, which is what keeps the roadmap acyclic.

Remaining in this layer:

- FS IV.7.3 (Drinfeld's lemma), on which Proposition VI.9.2 rests, was NOT read.
- The coherence of the collision maps for THREE legs and two different successive diagonal factorizations, which the completion contract makes an explicit obligation, is asserted by FS as 'functorial in I_1, ..., I_k and compatible with composition' but no coherence proof was read.
- Proposition VI.6.8 (the multi-leg ULA statement over the disjoint-leg locus) was located but not read.

### `disjoint-leg-factorization-and-full-faithfulness` — FS VI.9.3: restriction to the disjoint-leg locus is fully faithful

*theorem.* **Planet: Full faithfulness on the disjoint-leg locus.**

**Statement.** Let I = I_1 union ... union I_k and let j : (Div^1_X)^{I;I_1,...,I_k} inside (Div^1_X)^I be the open locus where x_i and x_{i'} differ whenever i, i' lie in different I_j. Then j^* : Sat^I_G(Lambda) -> Sat^{I;I_1,...,I_k}_G(Lambda) is fully faithful, and likewise j^* on LocSys((Div^1_X)^I,Lambda).

**Hypotheses that must not be dropped.**

- Full faithfulness is equivalent to A -> ^p H^0(R j_* j^* A) being an isomorphism for all A in Sat^I_G(Lambda)
- The proof needs i^* i^! A in ^p D^{>=2} for the complementary closed i : Z -> (Div^1_X)^I; this is reduced by working locally to split G and applying the t-exact conservative functor R pi_{T*} CT_B[deg]
- The input is that Z admits a stratification by PARTIAL DIAGONALS with smooth strata of l-CODIMENSION >= 1 inside the smooth (Div^1_X)^I, whence i^* i^! Lambda in D^{>=2}

**Proof outline.**

1. Reduce full faithfulness to A = ^p H^0(R j_* j^* A).
2. Reduce to i^* i^! A in ^p D^{>=2}.
3. Work locally to assume G split and apply R pi_{T*} CT_B[deg], which is t-exact and lands in local systems of finite projective Lambda-modules.
4. Use the partial-diagonal stratification of Z with smooth strata of l-codimension >= 1 to get i^* i^! Lambda in D^{>=2}.
5. The same argument proves the LocSys statement directly.

**Acceptance.**

- Check the codimension-1 input for two legs
- Check full faithfulness for k = 2 and I_1, I_2 singletons
- Check the analogous statement for local systems, which gives the Weil-group functoriality

**Prerequisites.** `GeometricSatakeAndFusion:GS1`, `GeometricSatakeAndFusion:GS2:correspondences`, `RelativeFarguesFontaine:RF2:integral-divisors`, `VStackSheavesAndLisseCategories:VS1`, `mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:Module.Projective`, `mathlib:RootPairing`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.9.3 and proof, printed p. 227.

  > this follows from the observation that i^* i^! Lambda in D^{>=2}, which follows from the observation that Z admits a stratification (by partial diagonals) with smooth strata of l-codimension >= 1 inside the smooth (Div^1_X)^I.

  The geometric input behind full faithfulness on the disjoint-leg locus.

### `fusion-product-and-sign-rule` — FS VI.9.4 and the even/odd decomposition: the fusion product and the Koszul sign normalisation

*construction.* **Planet: The fusion product and its sign rule.**

**Statement.** Over the disjoint-leg locus, Hck^I_G restricted there is the product of the Hck^{I_j}_G, so exterior product gives a monoidal functor Sat^{I_1}_G x ... x Sat^{I_k}_G -> Sat^{I;I_1,...,I_k}_G. Each Hck^I_G = (Hck^I_G)^{even} disjoint union (Hck^I_G)^{odd} according to the parity of d_{mu_bullet} = sum_i <2rho,mu_i>, and this is an open-and-closed decomposition because the dominance order compares only elements of the same parity. One imposes a MINUS SIGN whenever two sheaves concentrated on the odd parts are commuted. The image of the exterior product lands in Sat^I_G, defining the fusion product, a functor of monoidal categories functorial in I_1,...,I_k, and F^I becomes symmetric monoidal.

**Hypotheses that must not be dropped.**

- The sign rule is imposed BY HAND; equivalently, it is forced by the shift by deg inside F^I, and 'this in fact pins down this choice of signs by faithfulness of the functors'
- The even/odd decomposition is open and closed precisely because the dominance order does not compare elements of different parity
- By Proposition VI.7.4, sheaves concentrated on the even (resp. odd) part have F^I concentrated in even (resp. odd) degrees
- Fargues-Scholze note (footnote, crediting Tony Feng) that on HECKE STACKS the map Gr^I_G x_{(Div^1)^I} (Div^1)^J -> Gr^J_G being a closed immersion is a statement about Gr, not about Hck
- The fusion product is constructed WITHOUT any characteristic-zero semisimplicity input

**Proof outline.**

1. Identify Hck^I_G over the disjoint-leg locus with the product of the Hck^{I_j}_G and form the exterior product.
2. Decompose into even and odd parts and impose the sign rule; check the commuting square with the fibre functors and the exterior tensor product on local systems.
3. Show the image lands in Sat^I_G by Proposition VI.9.3 (full faithfulness of j^*) applied to the extension.
4. Deduce that each Sat^I_G is symmetric monoidal with the fusion product refining convolution, functorially in I.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `disjointLegLocus` | data | The open locus (Div^1_X)^{I;I_1,...,I_k} inside (Div^1_X)^I where x_i and x_{i'} differ whenever i and i' lie in different I_j; over it Hck^I_G is the product of the Hck^{I_j}_G. |
| `exteriorProduct` | data | The exterior-product functor Sat^{I_1}_G x ... x Sat^{I_k}_G -> Sat^{I;I_1,...,I_k}_G, monoidal, obtained from that product decomposition. |
| `parity` | data | The open-and-closed decomposition Hck^I_G = (Hck^I_G)^{even} disjoint union (Hck^I_G)^{odd} by the parity of d_{mu_bullet} = sum_i <2rho,mu_i>. |
| `parity.clopen` | structure | The decomposition is open AND closed precisely because the dominance order compares only elements of the same parity; on a category where it did not, the decomposition would not exist. |
| `signRule` | structure | A MINUS SIGN is imposed whenever two sheaves concentrated on the odd parts are commuted. It is not a convention chosen for convenience: the shift by deg inside F^I introduces exactly this sign, and faithfulness of the functors pins the choice down. |
| `fusionProduct` | data | The fusion product Sat^{I_1}_G x ... x Sat^{I_k}_G -> Sat^I_G, obtained by showing the exterior product's image lands in Sat^I_G; a functor of monoidal categories, functorial in I_1,...,I_k. |
| `fusionProduct.symmetricMonoidal` | structure | With the sign rule, F^I becomes symmetric monoidal and each Sat^I_G symmetric monoidal, the fusion product refining convolution. |
| `fusionProduct.noSemisimplicity` | structure | The construction uses no characteristic-zero semisimplicity input; that is a separate and later dependency, in GS4:rational-reductivity. |

Derived from where the object is used:

- in `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms` — the constant-term functors are shown to commute with this product, which is what makes them symmetric monoidal
- in `GeometricSatakeAndFusion:GS4:integral-dual-group/tannakian-left-adjoint` — the left adjoint's value on the unit is a fusion over I of the one-element values, which is what makes the Tannakian Hopf algebra a tensor product over I
- in `GeometricSatakeAndFusion:GS4:integral-dual-group/chevalley-involution` — the commutativity constraint whose automorphism is identified with the Chevalley involution is the one this product carries

**Unit tests.** A plausible wrong definition fails one of these.

- `sign_on_two_odd_objects` — On two minuscule GL_2 objects with d_mu = 1 the commutation introduces a minus sign; without it F^I is symmetric monoidal for a super variant and the dual group comes out wrong.
- `sign_is_forced_not_chosen` — The sign is not free: the shift by deg inside F^I introduces it, and faithfulness of the functors pins it down. A construction that omits it contradicts the source's own reason for it.
- `parity_decomposition_is_clopen` — The even/odd decomposition is open and closed because the dominance order does not compare elements of different parity; a definition of the order that did would destroy it.
- `three_leg_coherence` — For three legs the two successive diagonal factorizations must agree. The source asserts functoriality in I_1,...,I_k and compatibility with composition, but no coherence proof was read; this test records the obligation rather than a verified fact.
- `no_semisimplicity_used` — Fusion is constructed integrally, with no characteristic-zero semisimplicity; a construction that needs it has imported GS4:rational-reductivity early and made the roadmap circular.

**Acceptance.**

- Check the sign rule on two odd objects, e.g. two minuscule GL_2 objects with d_mu = 1
- Check coherence for three legs and the two successive diagonal factorizations, as the completion contract requires
- Check that F^I is symmetric monoidal with the chosen signs and not a super variant

**Prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`, `GeometricSatakeAndFusion:GS2:correspondences`, `GeometricSatakeAndFusion:GS2:Satake-closure`, `RelativeFarguesFontaine:RF2:integral-divisors`, `mathlib:CategoryTheory.BraidedCategory`, `mathlib:CategoryTheory.SymmetricCategory`, `mathlib:CategoryTheory.Functor.Braided`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:RootPairing`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, VI.9, printed p. 228.

  > Now we impose that when forming the above exterior product, we introduce a minus sign whenever we commute two sheaves concentrated on the odd parts. ... Indeed, note that the functors F^I invoke a shift by deg, which exactly introduces this sign rule. This in fact pins down this choice of signs by faithfulness of the functors.

  The Koszul sign normalisation the roadmap insists on, together with the reason it is forced.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition/Proposition VI.9.4, statement printed p. 228, proof printed p. 229.

  > The image of Sat^{I_1}_G(Lambda) x ... x Sat^{I_k}_G(Lambda) -> Sat^{I;I_1,...,I_k}_G(Lambda) lands in Sat^I_G(Lambda) in Sat^{I;I_1,...,I_k}_G(Lambda), defining the fusion product ... a functor of monoidal categories, functorial in I_1, ..., I_k.

  The fusion construction itself.

### `finite-set-functoriality-and-constant-terms` — FS VI.9.2, VI.9.5, VI.9.6: Weil-group local systems, duality compatibility and constant-term compatibility

*theorem.* **Planet: Finite-set functoriality of Satake.**

**Statement.** LocSys((Div^1_X)^I,Lambda) is naturally equivalent to Rep_{W_E^I}(Lambda), the category of continuous representations of W_E^I on finite projective Lambda-modules. For a map f : I -> J of finite sets there is a natural monoidal functor Sat^I_G(Lambda) -> Sat^J_G(Lambda) compatible with composition, and the square with F^I, F^J and pullback along W_E^J -> W_E^I commutes naturally. For A in Sat^I_G there are natural isomorphisms F^I(sw^* A) = F^I(A) and D(sw^* A) = sw^* D(A); D is symmetric monoidal and D o F^I = (F^I)^* as symmetric monoidal functors. For a parabolic P with Levi M, the constant term functors CT^I_P[deg_P] : Sat^I_G -> Sat^I_M commute with the fusion product, functorially in I and in permutations of I_1,...,I_k, hence are symmetric monoidal.

**Hypotheses that must not be dropped.**

- The identification LocSys = Rep_{W_E^I} is 'a consequence of Proposition IV.7.3', i.e. of Drinfeld's lemma in FS IV.7, which was NOT read
- The functor for f : I -> J comes from the natural closed immersion Gr^I_G x_{(Div^1)^I}(Div^1)^J -> Gr^J_G; Fargues-Scholze add a footnote that on HECKE STACKS the map is not a closed immersion
- VI.9.5 uses dualizability (VI.8.2) and Proposition VI.7.12
- VI.9.6 is proved by passing to the disjoint-leg locus, applying the Kunneth formula, and invoking VI.9.3

**Proof outline.**

1. VI.9.2 from Drinfeld's lemma (IV.7.3).
2. Functoriality in I by pull-push along Gr^I_G <- Gr^I_G x_{(Div^1)^I}(Div^1)^J -> Gr^J_G, preserving the equivariance condition.
3. VI.9.5: dualizability gives sw^* D sw^* D(A) = A; since sw^* and D are self-inverse this gives their commutation. Since F^I is symmetric monoidal, F^I(sw^* D(A)) and F^I(A) are dual; by VI.7.12 the dual of F^I(A) is F^I(D(A)); substituting gives F^I(sw^* A) = F^I(A).
4. VI.9.6: restrict to the disjoint-leg locus, use Kunneth, extend back by VI.9.3.

**Acceptance.**

- Check the coCartesian functoriality for a surjection I -> J and for a diagonal
- Check that pairwise isomorphisms for two legs do not give the coherent family, as the roadmap warns
- Check symmetric monoidality of CT_P[deg_P] on a minuscule object

**Prerequisites.** `GeometricSatakeAndFusion:GS2:Satake-closure`, `VStackSheavesAndLisseCategories:VS1`, `VStackSheavesAndLisseCategories:VS3`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.LeftRigidCategory`, `mathlib:Representation`, `mathlib:Module.Projective`, `mathlib:CategoryTheory.Comma`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.9.2 and proof, printed p. 226.

  > The category LocSys((Div^1_X)^I, Lambda) is naturally equivalent to the category Rep_{W_E^I}(Lambda) of continuous representations of W_E^I on finite projective Lambda-modules. Proof. This is a consequence of Proposition IV.7.3.

  The Weil-group identification, whose proof is Drinfeld's lemma - an unread import.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Footnote 1 to VI.9, printed p. 226.

  > We thank Tony Feng for pointing out that on Hecke stacks the map is not a closed immersion.

  A correction in the source itself, worth preserving: the closed immersion is on Grassmannians, not Hecke stacks.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.9.6, printed p. 230.

  > For any finite set I decomposed into finite sets I = I_1 union ... union I_k, the diagram [Sat^{I_1}_G x ... x Sat^{I_k}_G -> Sat^I_G ; CT^{I_j}_P[deg_P] ; CT^I_P[deg_P]] commutes functorially in I and permutations of I_1, ..., I_k.

  The constant-term compatibility needed for the dual-group identification.

## GS4. Tannakian reconstruction and the Weil action

An aggregate layer with no node of its own.

**Coverage: `partial`.** Aggregate layer over the three GS4 substages; no node of its own.

Remaining in this layer:

- Aggregate stage; inherits the remaining items of the three GS4 substages.

## GS4:classical-Satake-comparison. A downstream comparison, not an input

**Not read, and no node is written for it.** The
decomposition inspected the section list of Fargues–Scholze Chapter VI, which ends at VI.12 with the Chevalley
involution, and found no passage comparing the Frobenius trace of a Satake object on a finite-type special-fibre model
with the spherical Hecke function. The stage's own text already calls it *"a downstream comparison, not an input"*, and
its only atlas supplier is `SmoothRepresentationsOfLocalGroups:SR.4`, the classical Satake isomorphism.

Its coverage status is left at `not_read` rather than closed, and the first structural proposal asks either for a source
route of its own — Zhu's mixed-characteristic Satake paper §2 is in the reference library and unread — or for the
comparison to move to the roadmap that owns the classical Satake transform, where its other half already lives. As it
stands the stage cannot be closed by anyone reading only this roadmap's sources.

**Coverage: `not_read`.** NOT READ, and no node is written for it. The decomposition searched Chapter VI section by section and found no passage comparing the Frobenius trace of a Satake object on a finite-type special-fibre model with the spherical Hecke function; the chapter ends at VI.12 with the Chevalley involution. The coverage status is left at not_read rather than closed, and the candidate sources are named in the gap.

Remaining in this layer:

- NOT READ. This stage asks for the comparison of the Frobenius trace of a Satake object on a finite-type special-fibre model with the spherical Hecke function in the unramified/hyperspecial case, including Haar volume of the hyperspecial subgroup, geometric Frobenius, q^{<rho,mu>} and the chosen half twist, importing the classical Satake transform from SmoothRepresentationsOfLocalGroups SR.4. No passage covering this was found in FS VI (the chapter ends with VI.12 on the Chevalley involution). Candidate sources: Zhu_MixedCharacteristicSatake.pdf section 2 (in the library, unread), and the classical Satake literature. Nothing in this packet addresses it.

## GS4:integral-dual-group. Reconstruction and normalized functoriality

**Tau Ceti already has Tannaka reconstruction.** The pinned
library has 125 declarations under `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/`, including
`tensorAutFunctor` — the functor `CommAlgCat R ⥤ GrpCat` of tensor automorphisms of the fibre functor, which *is* the
Tannakian group functor — together with `pointsFunctorIsoTensorAutFunctor`, the reconstruction isomorphism, and
`reconstructedPoint`. Mathlib supplies `HopfAlgebra`, `Bialgebra`, `BraidedCategory` and `SymmetricCategory`. So the
Tannakian formalism is cited here, not planned.

What the pinned development does *not* give is the point of this layer. Tau Ceti's reconstruction is over a **field**,
for finitely generated comodules over a Hopf algebra. Fargues–Scholze identify a group scheme over **`ℤ_ℓ`**, and the
roadmap is explicit that *"rational reductivity alone does not identify the integral group scheme"*. The integral
recovery runs through the torus and the rank-one Levi maps, using that `Ĝ(ℤ_ℓ)` is a maximal compact open subgroup of
`Ĝ(Q_ℓ)` generated by the rank-one Levis — Bruhat–Tits theory, requested from `ReductiveGroupsPartII:RG2.5`.

The three nodes are the Tannakian left adjoint, whose value on the unit is a **fusion** over `I` of the one-element
values (which is what makes the Hopf algebra a tensor product over `I`, and where GS3 is consumed); the identification
itself, `W_E`-equivariant and canonical, with the `W_E`-action agreeing with the pinned action up to an explicit
cyclotomic twist that `√q` trivialises; and the Chevalley involution.

Two remarks the source makes about its own result are kept. Its formulation is *more precise* than [MV07], where no
canonical isomorphism is given — and in particular that the Tannakian group depends only on `G` up to inner
automorphisms *"is not clear"*. And the Chevalley involution comes with the conjugation by `ρ̂(-1)`, which
Fargues–Scholze record that Ginzburg's earlier construction **overlooked**.

**Coverage: `partial`.** The left adjoint of the fibre functor with its fusion decomposition, the identification of the Tannakian group with the Langlands dual group W_E-equivariantly and integrally, and the Chevalley involution. Tau Ceti already has Tannaka reconstruction over a field, which this packet cites; what it does not have, and what this layer is for, is the integral statement over Z_l recovered from the torus and the rank-one Levi maps by maximal-compact generation.

Remaining in this layer:

- The proof of Theorem VI.11.1 was read only through the torus case, the closed-immersion step and the generic-fibre discussion (printed pp. 235-236); the rank-one/PGL_2 analysis, the pinning-independence argument and the Galois descent for nonsplit G (printed pp. 236-239) were NOT read.
- Lemmas VI.11.2, VI.11.3 and VI.11.4 ([PY06, Corollary 5.2]) were located but not read.
- Propositions VI.10.2 and VI.10.3 (the abstract Tannakian criterion and the exterior tensor product) were located but not read; the construction of the one-element left adjoint in VI.10.1 was not read.
- Naturality for Levi restriction/constant term, products, maps inducing isomorphisms on adjoint groups, and Weil restriction - which HS4 and ES6/ES7 require - were not located as proved statements.
- The proof of Proposition VI.12.1 was not read.

### `tannakian-left-adjoint` — FS VI.10.1: the left adjoint of the fibre functor and its fusion decomposition

*theorem.* **Planet: The left adjoint of the fibre functor.**

**Statement.** For a quasicompact closed substack Hck^I_{G,(W_i)_i} of Hck^I_G with corresponding full subcategory Sat^I_{G,(W_i)_i}(Lambda), the functor F^I : Sat^I_{G,(W_i)_i}(Lambda) -> Rep_{W_E^I}(Lambda) admits a left adjoint L^I_{(W_i)_i} with: (i) L^I_{(W_i)_i}(V) = L^I_{(W_i)_i}(1) tensor V for V in Rep_{W_E^I}(Lambda), using that Sat^I_G is tensored over Rep_{W_E^I}; (ii) L^I_{(W_i)_i}(1) = the fusion over i in I of L^{{i}}_{W_i}(1); (iii) for I a single element, the left adjoint is the restriction of the left adjoint to the direct sum over m of H^m(R pi_{G*}) : Perv(Hck^{{i}}_{G,W},Lambda) -> Mod_{W_E}(Lambda).

**Hypotheses that must not be dropped.**

- The left adjoint is constructed only on the QUASICOMPACT bounded pieces Sat^I_{G,(W_i)_i}; the whole Satake category is the colimit of these
- Property (i) uses that Sat^I_G(Lambda) is TENSORED over Rep_{W_E^I}(Lambda)
- Property (ii) expresses the left adjoint's value on the unit as a FUSION, which is where GS3 is consumed
- Fargues-Scholze reduce the construction to finding the value on the unit satisfying (ii) and (iii); property (i) then defines the left adjoint in general

**Proof outline.**

1. Show it suffices to produce L^I_{(W_i)_i}(1) satisfying (ii) and (iii).
2. Construct the one-element case as the left adjoint to the perverse-cohomology fibre functor on the bounded perverse category.
3. Define the general case by fusing the one-element values.
4. Extend to all V by tensoring, using the Rep_{W_E^I}-linear structure.
5. NOTE: only the statement and the first lines of the proof were read; the construction of the one-element left adjoint was not.

**Acceptance.**

- Check the left adjoint on a single minuscule bound for GL_2
- Check that the fusion formula (ii) is what makes the Hopf algebra a tensor product over I
- Check the Rep_{W_E^I}-linearity used in (i)

**Prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:CategoryTheory.Adjunction`, `mathlib:CategoryTheory.Functor.Monoidal`, `tauceti:TauCeti.Tannaka.tensorAutFunctor`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.10.1, printed pp. 230-231.

  > (ii) There is a natural isomorphism L^I_{(W_i)_i}(1) = fusion over i in I of L^{{i}}_{W_i}(1) as the fusion of L^{{i}}_{W_i}(1) in Sat^{{i}}_{G,W_i}(Lambda).

  The property that makes the Tannakian Hopf algebra a tensor product of I copies, as described in the chapter introduction.

### `dual-group-identification` — FS VI.11.1: the Tannakian group is canonically the Langlands dual group, W_E-equivariantly

*theorem.* **Planet: Satake is the Langlands dual group.**

**Statement.** There is a canonical W_E-equivariant isomorphism between the Tannakian group scheme attached to the Satake category and the Langlands dual group G-hat. Under it the W_E-action agrees with the usual pinned action up to an explicit cyclotomic twist; if a square root of q lies in Lambda the twist can be trivialized and Sat^I_G(Lambda) becomes the category of (G-hat semidirect W_E)^I-representations on finite projective Lambda-modules.

**Hypotheses that must not be dropped.**

- The proof works over Z_l for l != p; the reduction from general Lambda uses that the statement is equivalent to having isomorphisms over Z/nZ for all n prime to p plus the Chinese remainder theorem
- The isomorphism is first constructed for SPLIT G with a fixed split torus, Borel and trivializations of all simple root groups (a pinning); independence of the pinning is argued because pinnings vary algebraically while automorphisms of G-hat/Z_l form an l-adic group; the general case is by Galois descent
- For G = T a torus, Gr_{T,Div^1_X} = X_*(T) x Div^1_X and Sat_T is X_*(T)-graded objects in Rep^cont_{W_E}(Z_l), giving the dual torus with X^*(T-hat) = X_*(T)
- The map T-hat -> (Tannakian group) is shown to be a closed immersion using the objects A_mu = ^p j_{mu!}Z_l[d_mu], whose mu-weight space is one-dimensional
- Fargues-Scholze note their formulation is more precise than [MV07], where no canonical isomorphism is given, and that in particular the Tannakian group depending only on G up to inner automorphisms 'is not clear'
- The integral identification uses the rank-one Levi maps and that G-hat(Z_l) inside G-hat(Q_l) is a maximal compact open subgroup generated by the rank-1 Levi subgroups, by Bruhat-Tits theory

**Proof outline.**

1. Reduce to Z_l coefficients.
2. Handle G = T: the Satake category is X_*(T)-graded W_E-representations, so the Tannakian group is the dual torus.
3. Use the symmetric monoidal constant-term functor CT_B[deg] : Sat_G -> Sat_T, which commutes with the fibre functors via the identity (direct sum over i of H^i(R pi_{G*})) = H^0(R pi_{T*} CT_B[deg]), to get a W_E-equivariant map T-hat -> Tannakian group; it is a closed immersion by the one-dimensionality of the mu-weight space of A_mu.
4. Use the rational semisimplicity of GS4:rational-reductivity to know the generic fibre is reductive and identify it via [MV07, Section 7].
5. Pass from Z/l^n to Z_l and recover the integral group scheme from the torus and rank-one Levi maps, using that G-hat(Z_l) is a maximal compact open generated by rank-1 Levis (Bruhat-Tits), with the auxiliary Lemmas VI.11.2 (subgroups of SL_2/F_l containing the diagonal torus), VI.11.3 (flat Z_l-modules with injective reduction) and VI.11.4 ([PY06, Corollary 5.2]).
6. Verify pinning-independence and descend to nonsplit G.

**Acceptance.**

- Check the cyclotomic twist and the role of sqrt(q) on a torus
- Check the rank-one calculation for PGL_2
- Check that rational reductivity alone does not give the integral statement, as the roadmap warns

**Prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `GeometricSatakeAndFusion:GS4:integral-dual-group/tannakian-left-adjoint`, `GeometricSatakeAndFusion:GS4:rational-reductivity/rational-semisimplicity`, `ReductiveGroupsPartII:RG2.2`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCeti.Tannaka.tensorAutFunctor`, `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, `tauceti:TauCeti.Tannaka.reconstructedPoint`, `tauceti:TauCeti.AffineGroupSchemeCat`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, `mathlib:HopfAlgebra`, `mathlib:Bialgebra`, `mathlib:RootPairing`, `mathlib:Module.Flat`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem VI.11.1 and the following remarks, printed p. 235.

  > There is a canonical W_E-equivariant isomorphism [Tannakian group] = G-hat. ... We note that the formulation of this theorem is slightly more precise than the formulation in [MV07], where no canonical isomorphism is given. Also, we handle the case of non-split groups. Note that in particular, [the Tannakian group] only depends on G up to inner automorphisms; this is not clear.

  The theorem and the source's own record of what is and is not obvious.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem VI.0.2, printed p. 190.

  > There is a canonical isomorphism [Tannakian group] = G-hat with the Langlands dual group, under which the action of W_E on [it] agrees with the usual action of W_E on G-hat up to an explicit cyclotomic twist. If sqrt(q) is in Lambda, the cyclotomic twist can be trivialized, and Sat^I_G(Lambda) is naturally equivalent to the category of (G-hat semidirect W_E)^I-representations on finite ...

  The normalized form with the sqrt(q) condition the roadmap requires. The excerpt is truncated here; the full quotation is in data/decompositions/GeometricSatakeAndFusion.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, VI.0, printed p. 190.

  > As these maps M -> G-hat are even defined integrally, and G-hat(Z_l) in G-hat(Q_l) is a maximal compact open subgroup by Bruhat-Tits theory, generated by the rank 1 Levi subgroups, one can then deduce that [the Tannakian group] = G-hat integrally, again with an explicit (cyclotomic) pinning.

  The integral-recovery argument from rank-one Levi maps and maximal-compact generation.

### `chevalley-involution` — FS VI.0.3/VI.12.1: the switching involution is the Chevalley involution conjugated by rho-hat(-1)

*theorem.* **Planet: The switching involution is Chevalley.**

**Statement.** The involution sw of the local Hecke stack, reversing the roles of the two G-torsors and induced by inversion on LG, induces via sw^* an involution of Sat^I_G(Lambda) that upgrades to a symmetric monoidal functor commuting with the fibre functor, hence a W_E-equivariant automorphism of the Tannakian group. Under the identification with G-hat, this automorphism is the Chevalley involution of the split group G-hat, conjugated by rho-hat(-1) in G-hat_ad(Z_l).

**Hypotheses that must not be dropped.**

- The upgrade of sw^* to a symmetric monoidal functor commuting with the fibre functor uses F^I(sw^* A) = F^I(A) from Corollary VI.9.5, which itself uses dualizability (VI.8.2) and VI.7.12
- The sign rho-hat(-1) is essential: Fargues-Scholze record that Ginzburg's alternative construction of the commutativity constraint 'overlooked the sign rho-hat(-1)'
- Remark VI.12.2 notes that there is a DIFFERENT construction of the commutativity constraint not using fusion, based on the Chevalley involution (a categorical Gelfand trick); this packet decomposes the fusion route, as the roadmap requires

**Proof outline.**

1. Show sw^* is symmetric monoidal and commutes with F^I, using Corollary VI.9.5.
2. Conclude that sw^* gives a W_E-equivariant automorphism of the Tannakian group.
3. Identify it with the Chevalley involution conjugated by rho-hat(-1).
4. NOTE: only the statements (VI.0.3, VI.12.1) and Remark VI.12.2 were read; the proof of VI.12.1 was not.

**Acceptance.**

- Check the rho-hat(-1) conjugation on PGL_2 versus SL_2
- Check compatibility of sw^* with Verdier duality and with inversion of modifications
- Check that the fusion commutativity constraint and the Chevalley-involution one agree

**Prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`, `mathlib:CategoryTheory.SymmetricCategory`, `mathlib:CategoryTheory.LeftRigidCategory`, `mathlib:RootPairing`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.12.1 and Remark VI.12.2, printed p. 239.

  > Under the isomorphism [Tannakian group] = G-hat with the dual group, the isomorphism sw^* is given by the Chevalley involution, up to conjugation by rho-hat(-1) in G-hat_ad(Z_l). ... For the Satake category, this construction was first proposed by Ginzburg [Gin90], who however overlooked the sign rho-hat(-1).

  Exact statement with the sign, and the historical record of the sign being overlooked.

## GS4:rational-reductivity. The late decomposition-theorem input

After inverting `ℓ`, `Sat_G(Q_ℓ)` is the direct sum over
dominant `μ` of `Rep^cont_{W_E}(Q_ℓ) ⊗ A_μ`. The input is the last clause of Proposition VI.7.5 — that the kernel and
cokernel of the map from the standard to the costandard object are killed by `ℓ^{a(μ)}`, so after inverting `ℓ` the two
coincide.

That clause is the **only** place the decomposition theorem enters this roadmap, and the source says so:

> We remark that the final statement ultimately makes use of the decomposition theorem (and thus requires the
> degeneration to the Witt vector affine Grassmannian).

which confirms exactly the routing the roadmap demands: the decomposition theorem is applied to finite-type proper
models over an algebraic closure of a finite field, reached through the Witt degeneration, and transported back through
the integral-family comparison — never to the diamond directly, and never back into `GS0:Schubert-smoothness` or `BG2`.

Semisimplicity of the representation category then gives finite type, connectedness and reductivity of the generic
fibre, by three citations to Deligne–Milne that were not read. And **rational reductivity is where this stops**: it does
not identify the integral group scheme. That is the next layer's job, and the roadmap says so in terms.

**Coverage: `partial`.** Semisimplicity of the rational Satake category and reductivity of the generic fibre of the Tannakian group. This is the late decomposition-theorem dependency, and the source confirms the routing the roadmap insists on: the decomposition theorem enters only through the last clause of Proposition VI.7.5, which Fargues-Scholze say 'ultimately makes use of the decomposition theorem (and thus requires the degeneration to the Witt vector affine Grassmannian)'. It is applied to finite-type proper models over an algebraic closure of a finite field, not to the diamond.

Remaining in this layer:

- The decomposition theorem itself (BBD) was not read; it is EtaleDualityAndPerverseSheaves EDC.7, another roadmap's stage, and its hard-Lefschetz input DWP.9 is a further dependency.
- The [MV07, Section 7] argument that the generic fibre is reductive was not read.
- The transport of semisimplicity from the finite-type proper models through perfection and through the ULA comparison was not verified beyond the statement of VI.6.7.

### `rational-semisimplicity` — FS VI.11 (generic fibre step) and VI.7.5: rational semisimplicity of the Satake category and reductivity of the generic fibre

*theorem.* **Planet: Rational semisimplicity of Satake.**

**Statement.** Working over Z_l with l != p, set Sat_G(Z_l) = lim_m Sat_G(Z/l^m Z) and Sat_G(Q_l) = Sat_G(Z_l)[1/l]. Then Sat_G(Q_l) is the direct sum over dominant mu of Rep^cont_{W_E}(Q_l) tensor A_mu, where A_mu = ^p j_{mu!}Z_l[d_mu]; the category of representations of the generic fibre of the Tannakian group scheme AS AN ABSTRACT GROUP SCHEME is correspondingly the direct sum over mu of Vect(Q_l) tensor A_mu, hence semisimple. Fargues-Scholze deduce from this that the generic fibre is of FINITE TYPE (a finite set of tensor generators, since A_mu star A_mu' contains A_{mu+mu'} as a direct summand and X_*^+ is a finitely generated monoid), CONNECTED (no nontrivial finite tensor subcategories), and REDUCTIVE.

**Hypotheses that must not be dropped.**

- The reduction to Z_l coefficients is legitimate because the statement is equivalent to having isomorphisms over Z/nZ for all n prime to p (Tannakian perspective) plus the Chinese remainder theorem
- The semisimplicity input is the last clause of Proposition VI.7.5, whose proof Fargues-Scholze say 'ultimately makes use of the decomposition theorem (and thus requires the degeneration to the Witt vector affine Grassmannian)'
- The roadmap's constraint is confirmed by the source's structure: the decomposition theorem is applied to finite-type proper models over an algebraic closure of a finite field, reached through the Witt degeneration, not to the diamond directly
- Rational semisimplicity does NOT identify the integral group scheme; that is the separate content of GS4:integral-dual-group
- The passage from semisimplicity of the representation category to finite type, connectedness and reductivity of the generic fibre is quoted from [DM82, Proposition 2.20, Corollary 2.22, Proposition 2.23]; these were not read.

**Proof outline.**

1. Reduce to Z_l coefficients by the Tannakian/Chinese-remainder argument.
2. Use VI.7.5's last clause: the kernel and cokernel of ^pH^0(j_{mu!}Lambda[d_mu]) -> ^pH^0(Rj_{mu*}Lambda[d_mu]) are killed by l^{a(mu)}; after inverting l the two agree, so the standard and costandard objects coincide and Sat_G(Q_l) decomposes as a direct sum over mu.
3. Following [MV07, Section 7]: from the displayed decomposition, the representation category of the generic fibre is semisimple; finite type follows by [DM82, Proposition 2.20] from the finite set of tensor generators, connectedness by [DM82, Corollary 2.22], and reductivity by [DM82, Proposition 2.23]. [MV07, Section 7] and the three [DM82] citations were NOT read.

**Acceptance.**

- Check the decomposition of Sat_G(Q_l) for G = GL_2
- Check that the same argument fails mod l, i.e. that no integral semisimplicity is asserted
- Check that the decomposition-theorem input is applied on the Witt side

**Prerequisites.** `GeometricSatakeAndFusion:GS1`, `GeometricSatakeAndFusion:GS0:Witt-geometry`, `EtaleDualityAndPerverseSheaves:EDC.7`, `mathlib:Module.Flat`, `mathlib:Module.Projective`, `mathlib:CategoryTheory.Abelian`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, VI.11, printed p. 236.

  > First, it follows from Proposition VI.7.5 that its category of representations Sat_G(Q_l) is given by Sat_G(Q_l) = direct sum over mu of Rep^cont_{W_E}(Q_l) tensor A_mu. (Here Sat_G(Q_l) = Sat_G(Z_l)[1/l], where Sat_G(Z_l) = lim_m Sat_G(Z/l^m Z).)

  The rational decomposition, which is what gives reductivity of the generic fibre.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Proposition VI.7.5, printed p. 219.

  > We remark that the final statement ultimately makes use of the decomposition theorem (and thus requires the degeneration to the Witt vector affine Grassmannian).

  Confirms the roadmap's claim that this is a late decomposition-theorem dependency routed through the Witt degeneration.

## Requests to other roadmaps and to the other part

- **`GeometricSatakeAndFusion:GS1`** — The relative perverse t-structure and the ULA sheaves on the Hecke stack, planned in the other part of this roadmap (BP-GeometricSatakeAndFusion--GS0). The full-faithfulness argument of GS3:fusion is a statement in that t-structure, and the rational decomposition of GS4 rests on the integral-family comparison there.
- **`GeometricSatakeAndFusion:GS2:correspondences`** — The Satake category with its exact faithful fibre functor and the convolution product, planned in the other part. Fusion refines that convolution and the Tannakian datum is that category with that functor.
- **`GeometricSatakeAndFusion:GS2:Satake-closure`** — That convolution preserves the Satake category and that every object is dualizable with right dual sw^* D(A), planned in the other part. Corollary VI.9.5 consumes the dualizability directly, which is why the atlas edge GS3:fusion -> GS2:Satake-closure points the wrong way; the other part proposes correcting it.
- **`GeometricSatakeAndFusion:GS0:Witt-geometry`** — The Witt vector affine Grassmannian and its projectivity, planned in the other part. The decomposition theorem is applied to finite-type proper models reached through that degeneration, and the roadmap forbids routing the return into GS0:Schubert-smoothness or BG2.
- **`RelativeFarguesFontaine:RF2:integral-divisors`** — Integral divisors, and in particular the divisor addition that makes the collision diagonals and the disjoint-leg locus meaningful.
- **`EtaleDualityAndPerverseSheaves:EDC.7`** — The decomposition theorem on the scheme side, with its hard-Lefschetz input. The roadmap is explicit that it is applied only to the finite-type proper models and resolutions of bounded Witt Schubert spaces over an algebraic closure of a finite field, and that neither a mod-l nor an integral semisimplicity theorem is asserted.
- **`VStackSheavesAndLisseCategories:VS1`** — Drinfeld's lemma, in the form of Proposition IV.7.3, which is the whole proof of Proposition VI.9.2, the identification of LocSys((Div^1_X)^I) with continuous W_E^I-representations. The decomposition records FS IV.7 as unread, so this is a genuine dependency and not a citation.
- **`VStackSheavesAndLisseCategories:VS3`** — The lisse coefficient category and its conventions, in which the finite projective Lambda-module coefficients of the local systems are expressed.
- **`EnhancedDerivedSheaves:E5:abstract`** — The monoidal stable infinity-categorical baseline. The coCartesian finite-set functoriality is a lift to the total space of a fibration over the category of finite sets, and the Tannakian left adjoint is constructed on a colimit of quasicompact pieces; both are statements in this layer's language.
- **`ReductiveGroupsPartII:RG2.2`** — Root data and pinnings of a reductive group, needed for the pinning-independence argument and for the statement that the identification is canonical.
- **`ReductiveGroupsPartII:RG2.3`** — Tori, Borels, parabolics and Levi subgroups, with the cocharacter lattice. The torus case of the identification is that Sat_T is X_*(T)-graded W_E-representations, giving the dual torus with X^*(T-hat) = X_*(T).
- **`ReductiveGroupsPartII:RG2.4`** — The dual group G-hat as a split reductive group over Z with the dual root datum, and the Chevalley involution of a split group. These are the objects the theorem identifies the Tannakian group with.
- **`ReductiveGroupsPartII:RG2.5`** — Bruhat-Tits theory in the form actually used: that G-hat(Z_l) inside G-hat(Q_l) is a maximal compact open subgroup, generated by the rank-one Levi subgroups. This is what converts the rational identification into the integral one, and the roadmap says rational reductivity alone does not.
- **`SmoothRepresentationsOfLocalGroups:SR.4`** — The classical Satake isomorphism and the spherical Hecke algebra. The stage GS4:classical-Satake-comparison is to compare the Frobenius trace of a Satake object with a spherical Hecke function, with the Haar volume of the hyperspecial subgroup, geometric Frobenius, q^{<rho,mu>} and the chosen half twist. Nothing in this packet addresses it, because no passage of the primary source covers it.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`** — The local Weil group W_E with its topology, from the existing Tau Ceti roadmap. Continuous representations of W_E^I on finite projective Lambda-modules are the target of the fibre functor, and neither pinned library contains a Weil group: a search of the pinned declaration index found no declaration whose name contains WeilGroup. It is requested rather than used as a prerequisite, because the packet checker parses a tauceti: identifier as a baseline declaration.

## Gaps

### Zhu's mixed-characteristic Satake paper is in the library and entirely unread

The roadmap names 'Zhu sections 1-2 and Appendix A' as a primary source for the perfect-space carrier of the Witt vector affine Grassmannian and its relation to finite-type models, and warns that 'Zhu's independent commutativity proof is not silently imported instead of FS fusion, nor are its inputs to equal-characteristic Satake made circular here'. VERIFIED PRESENT: references/papers/Zhu_MixedCharacteristicSatake.pdf, 'Affine Grassmannians and the geometric Satake in mixed characteristic', arXiv:1407.8519v3 (20 July 2016), 63 pages, sha256 2c23e397d21e84812daec2c637e2a763eec54ef0d784748eb74e3b2093de1e5b. Its first page and table of contents were inspected to confirm the title and edition; NOTHING ELSE WAS READ. NEXT SOURCE ACTION: read Zhu sections 1.1-1.4 (p-adic loop groups, affine Grassmannians for GL_n, the Demazure resolution, affine flag varieties), section 2 (the geometric Satake) and Appendix A. Note that FS's Theorem 8.2 attribution to Zhu (representability by the perfection of a proper algebraic space) is weaker than Bhatt-Scholze Theorem 8.3, and FS's proof is independent of it.

### Bhatt-Scholze sections 2-7 and 8.2-8.3 are unread, so the line bundle L is a read STATEMENT with an unread construction

The roadmap makes the geometric construction of L an explicit obligation: 'use the GEOMETRIC determinant line construction on a Demazure resolution and the trivial-on-geometric-fibres descent criterion (BS17 section 6, especially 6.8/6.12); prove its positivity/ampleness by the semiampleness criterion used in BS17 sections 7-8'. What was actually read: the introduction (Theorems 1.1, 1.2, 1.3, Remark 1.4, the outline), Theorem 6.8 with its proof, the statements of Definition 8.1, Theorems 8.2 and 8.3 with the strategy paragraph, and the proof of Theorem 8.3 in section 8.4 including the three Keel citations. NOT READ: section 2 (h-topology, Theorem 2.9), section 3 (perfect schemes), section 4 (proof of Theorem 1.2), section 6 apart from 6.8 (Propositions 6.1, 6.2, Lemmas 6.4, 6.11, Remark 6.12), section 7 (families of torsion W(k)-modules, Lemma 7.9 giving the closed immersions Gr_{<=mu} in Gr_{<=lambda}), section 8.2 (the Demazure resolution) and section 8.3 (Theorem 8.8, the construction of L) and the auxiliary Lemmas 8.9, 8.10 (nefness), 8.11 (the exceptional locus). NEXT SOURCE ACTION: read BS17 printed pp. 4-22 and pp. 32-35 in full. Until then the existence of the ample line bundle is an unread import, not an input package.

### Keel's semiampleness machinery beyond 1.7-1.9 is unread

The roadmap makes the Keel criterion a sub-obligation: 'construct the exceptional locus of a nef line bundle, its restriction criterion, Frobenius-power extension/descent of sections, and the reduction yielding semiampleness; verify the positivity assumptions before the projectivity conclusion'. READ: Abstract, 0.0 Definition-Lemma, 0.1 Definition (exceptional locus), 0.2 Theorem, 0.3 Corollary (printed pp. 253-254), and 1.7 Lemma with proof, 1.8 Lemma with sketch, 1.9 Theorem with proof (printed pp. 262-263). NOT READ: 1.1-1.6 (including Kodaira's lemma application 1.6 and the reductions 1.4, 1.5), the whole of Section 2 (which Keel says contains the complete proof of 1.8, e.g. 2.10.1 and 2.12), and the Frobenius-power section-extension arguments that carry the positive-characteristic content. NEXT SOURCE ACTION: read Keel printed pp. 255-262 and Section 2. Note that Keel's 1.8 is only SKETCHED in Section 1 ('Sketch of Proof. This follows easily from [Kol95,8.4] and [Ar70,6.1]'), so the complete proof genuinely requires Section 2.

### FS IV.6 and IV.7 are unread but are imported throughout Chapter VI

Section IV.6 (hyperbolic localization / Braden's theorem, including Definition IV.6.11 of G_m-monodromic and Proposition IV.6.13 on compatibility with Verdier duality) and Section IV.7 (Drinfeld's lemma, Proposition IV.7.3) were NOT opened. They are used at: Corollary VI.3.5 (the hyperbolic-localization comparison), the proofs of VI.6.4 and VI.7.5 (IV.6.13), and Proposition VI.9.2 (IV.7.3, which is what turns local systems on (Div^1_X)^I into W_E^I-representations and hence supplies the Weil action of the final Satake theorem). FS themselves caution in the Chapter IV introduction: 'The theme here is the idea pi_1((Div^1)^I) = W_E^I. Unfortunately, we know no definition of pi_1 making this true, but for example it becomes true when considering Lambda-local systems for any Lambda.' NEXT SOURCE ACTION: read FS printed pp. 155-166. This gap is shared with the VStackSheavesAndLisseCategories packet of this job, where it is recorded for stage VS1.

### GS4:classical-Satake-comparison has no corresponding passage in FS VI

Chapter VI of Fargues-Scholze ends with VI.12 (the Chevalley involution); the section list VI.1-VI.12 was inspected and contains no Frobenius-trace/spherical-Hecke-function comparison. The stage's content - comparing the trace of Frobenius on a Satake object over a finite-type special-fibre model with the spherical Hecke function, with Haar volume of the hyperspecial subgroup, geometric Frobenius, q^{<rho,mu>} and the half twist - therefore has no source in the primary reference for this roadmap. NEXT SOURCE ACTION: look in Zhu, 'Affine Grassmannians and the geometric Satake in mixed characteristic' section 2 (in the library, unread) and in the classical Satake literature (Gross, 'On the Satake isomorphism'; Haines-Kottwitz-Prasad). Also check SmoothRepresentationsOfLocalGroups SR.4, which the stage text says supplies the classical Satake transform and which belongs to another roadmap. This stage is marked not_read in coverage.

### Imported results invoked inside the inspected proofs but not named in any node

Added by independent review after reading the printed proofs. Each item is cited inside a proof that this packet decomposes, and none of the cited texts was read. (a) Proof of VI.1.7, printed p. 193: [GR03, Proposition 5.4.21] (already named) and, one page earlier in the proof of VI.1.4 on which it rests, [dJvdP96, Proposition 3.2.2] / [KL15, Proposition 8.2.20] and [SW20, Lemma 17.1.8]. (b) Proposition VI.1.10, printed p. 194: G^diamond is defined by [Sch17a, Section 27, before Proposition 27.5]. (c) Proof of VI.1.13, printed p. 196: [Sch17a, Propositions 9.7, 11.23, Lemma 15.6] and [Hub94, Proposition 3.8]. (d) Proof of VI.2.4, printed p. 199: [SW20, Proposition 20.3.7] and [Sch17a, Lemma 12.5]. (e) Proof of VI.3.7, printed p. 206: [SW20, Lemma 14.2.3] and 'the v-descent results of [BS17]'. (f) Proof of VI.7.5, printed p. 220: [Zhu17, Lemma 2.1], cf. [Gai01, Proposition 1], [Lus83]; [Zhu17, Section 1.4.2] for the Demazure-Bott-Samuelson fibres; and the decomposition theorem itself. (g) p. 236: [DM82, Proposition 2.20, Corollary 2.22, Proposition 2.23] and [MV07, Section 7]. (h) Keel's proof of 1.9, printed p. 263: Kodaira's lemma [Kol96, VI.2.16] and Keel's own 1.4, 1.5, 1.6, 1.8; Keel's 1.8 is only sketched, citing [Kol95, 8.4] and [Ar70, 6.1]. (i) Bhatt-Scholze proof of 8.3, printed pp. 34-35: Lemmas 8.9, 8.10, 8.11, Proposition 6.1 and Lemma 7.9. NEXT SOURCE ACTION: read (d), (e) and (g) first - they are the imports that carry actual mathematical content into nodes of this packet rather than routine descent bookkeeping.

### Atlas substage order is the reverse of the source's proof order: GS2:Satake-closure -> GS3:fusion (link convolution-preserves-satake-and-dualizability -> finite-set-functoriality-and-constant-terms), while the atlas has GS3:fusion -> GS2:Satake-closure

Added by independent review. The link is source-correct at NODE level: the proof of Corollary VI.9.5 (printed p. 229) opens 'By Proposition VI.8.2, all A in Sat^I_G(Lambda) are dualizable, with dual sw^* D(A)'. And Proposition VI.8.2 is proved (printed p. 226) from Proposition IV.2.24, Proposition VI.6.2 and Proposition VI.7.12 - fusion is NOT used - just as Proposition VI.8.1(iii) is proved from (i), (ii) and the commutation of convolution with Verdier duality. In Fargues-Scholze both live in section VI.8, BEFORE section VI.9 on fusion. The atlas, however, says GeometricSatakeAndFusion:GS2:Satake-closure REQUIRES GS3:fusion, and its stage text says 'Using GS3:fusion ... prove perversity, flatness and ULA preservation ... This return is after GS3's geometric fusion construction, as in FS VI.8-VI.9'. So lifting this node link to stages contradicts the atlas edge and would create a two-cycle. The node itself bundles two things with different positions in the source's order: VI.8.1(iii), the closure theorem that GS2:Satake-closure owns, and VI.8.2, dualizability, which is prior to fusion and is what VI.9.5 consumes. CONSEQUENCE AND DECISION NEEDED. The node-level link graph of all thirteen packets of this job is ACYCLIC (197 nodes, 210 edges, checked). The cycle appears only if node links are lifted to stage edges and unioned with data/atlas.json stageEdges. Nothing was reversed here, because reversing would misstate the source. The orchestrator must choose: (i) treat these as node-level edges only and do not lift them to stage edges at integration; (ii) re-parent the offending node (or split it) so that its stage matches the source's order; or (iii) revise the atlas substage ordering. Option (iii) is the one the source actually supports in each case.

### Tau Ceti already has Tannaka reconstruction, but over a field; the integral statement is what this layer is for

data/library-coverage.json has no reviewed audit entry for this roadmap, so the pinned declaration index was searched directly. Tau Ceti at f790474 has a substantial Tannaka development: 125 declarations across twelve files under TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/, including tensorAutFunctor (the functor CommAlgCat R -> GrpCat of tensor automorphisms of the fibre functor, that is, the Tannakian group functor), pointsFunctorIsoTensorAutFunctor (the reconstruction isomorphism between the points functor of the group scheme and that functor) and reconstructedPoint. Mathlib supplies HopfAlgebra, Bialgebra, BraidedCategory, SymmetricCategory and Functor.Braided. So the Tannakian formalism is NOT planned here; it is cited. What the pinned development does not give, and what GS4:integral-dual-group exists for, is the INTEGRAL statement: Tau Ceti's reconstruction is over a field, for finitely generated comodules over a Hopf algebra, whereas Fargues-Scholze identify a group scheme over Z_l, recovered from the torus and the rank-one Levi maps through the fact that G-hat(Z_l) is a maximal compact open subgroup of G-hat(Q_l) generated by the rank-one Levis. The roadmap says in terms that 'rational reductivity alone does not identify the integral group scheme', and the library search confirms that the pinned reconstruction does not either. A reviewer should check that no node of this packet plans the field-level reconstruction again.

### Neither pinned library has a Weil group or a Langlands dual group

The same index search found no declaration whose name contains WeilGroup in either Mathlib or Tau Ceti, and none containing LanglandsDual or DualGroup. The continuous W_E^I-representations that are the target of the fibre functor, and the dual group G-hat that the main theorem identifies the Tannakian group with, are therefore genuine dependencies: the first on Tau Ceti's ClassFieldTheory roadmap, layer 9, and the second on ReductiveGroupsPartII:RG2.4. Both are requested. Mathlib's RootPairing gives the root-datum combinatorics, and Tau Ceti's GeneralLinear.diagonalRootDatum gives a worked example, so the combinatorial half exists and the group half does not.

## Structural proposals

### GS4:classical-Satake-comparison has no source in this roadmap's primary reference and should be moved or given one (`split-layer`)

The stage asks for the comparison of the Frobenius trace of a Satake object on a finite-type special-fibre model with the spherical Hecke function in the unramified case, with the Haar volume of the hyperspecial subgroup, geometric Frobenius, q^{<rho,mu>} and the chosen half twist. The reviewed decomposition inspected the section list of Fargues-Scholze Chapter VI, which ends at VI.12 with the Chevalley involution, and found no passage covering it; this packet writes no node for it and leaves its coverage at not_read. Its own text already says it is 'a downstream comparison, not an input', and its only atlas supplier is SmoothRepresentationsOfLocalGroups:SR.4, the classical Satake isomorphism. Two remedies: give the stage a source route of its own - Zhu's mixed-characteristic Satake paper section 2 is in the reference library and unread, and the classical Satake literature covers the rest - or move the comparison to the roadmap that owns the classical Satake transform, which is where its other half already lives. As it stands the stage cannot be closed by anyone reading only this roadmap's sources.

### The atlas edge GS3:fusion -> GS2:Satake-closure points the wrong way (repeated from the GS0 part) (`reorder-links`)

This packet consumes GS2:Satake-closure in three places - Corollary VI.9.5 opens by invoking Proposition VI.8.2's dualizability, the fusion construction uses the monoidal structure convolution provides, and the Tannakian left adjoint is taken on the Satake category - while the atlas records GS3:fusion as a SUPPLIER of GS2:Satake-closure. Propositions VI.8.1(iii) and VI.8.2 are proved without fusion, in section VI.8, before VI.9. The companion packet BP-GeometricSatakeAndFusion--GS0 makes the same proposal from the other side; it is repeated here because this is the part that actually consumes the edge, and a reviewer of either part should see it.

## Planets

| layer | planets |
| --- | --- |
| `GS3` | — |
| `GS3:fusion` | Full faithfulness on the disjoint-leg locus; The fusion product and its sign rule; Finite-set functoriality of Satake |
| `GS4` | — |
| `GS4:classical-Satake-comparison` | — |
| `GS4:integral-dual-group` | The left adjoint of the fibre functor; Satake is the Langlands dual group; The switching involution is Chevalley |
| `GS4:rational-reductivity` | Rational semisimplicity of Satake |

## Nothing here is formalised

No Lean was compiled for this job and no statement in this packet is claimed to be formalised. The suggested file
is a set of signatures whose only proof is `sorry`; every `implementationStatus` is `unchecked`.
