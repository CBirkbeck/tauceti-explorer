# Hecke correspondences on the Fargues–Fontaine curve and local shtuka cohomology

Blueprint for the roadmap `HeckeStacksAndLocalShtukas`, job `BP-HeckeStacksAndLocalShtukas` (issue #750).
Packet: `research/blueprint/packets/HeckeStacksAndLocalShtukas.json`. Suggested Lean file:
`research/blueprint/suggested/HeckeStacksAndLocalShtukas.lean`. Handoff:
`research/blueprint/handoff/BP-HeckeStacksAndLocalShtukas.md`.

The title above is the one the accepted restructuring **RS-22** gives this roadmap, replacing "Hecke
correspondences and local shtuka cohomology", so that *which curve* HS0 means is visible in the name.

**Status: partial.** All five layers in scope are decomposed, none is closed. The packet has 12 nodes
(4 constructions, one definition, 4 theorems, one lemma, 2 comparisons), 32 API items, 21 unit tests and
9 planets; it cites 28 declarations of the pinned libraries, records 8 gaps, makes 22 requests to other
roadmaps and makes 2 structural entries.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources

Both sources are author-hosted and freely available, and **both were downloaded again in this session and their
SHA-256 hashes reproduce the recorded values byte for byte.** Every locator therefore rests on the same two files
the independent review of the decomposition checked.

- **`FS-geometrization`** — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*. Author-hosted 356-page PDF (MPIM Bonn), inspected 2026-09-15; corresponds to arXiv:2102.13459v4 by metadata and contents, not by byte comparison. PDF page = printed page.
  <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>, read 2026-09-16.
  SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` — reproduced 24 September 2026.
- **`SW20-berkeley`** — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*. Annals of Mathematics Studies 207; PDF dated 'March 27, 2020'. Printed page = PDF page - 10.
  <https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf>, read 2026-09-16.
  SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` — reproduced 24 September 2026.

## What this packet is, and what it rests on

This roadmap already had a **reviewed integrated decomposition** of Fargues–Scholze Chapter IX (introduction,
IX.1, IX.2, IX.3, IX.5.1, IX.6.1–IX.6.3) together with Definition 23.1.1 and Theorem 23.1.4 of the Berkeley
lectures. This packet keeps twelve of its thirteen node identifiers with their statements, hypotheses, proof
steps, acceptance items and verified locators, and adds prerequisites resolved to the pinned libraries or to a
named supplier stage, planets, a coverage record per layer, and API outlines with unit tests for the four
constructions and the one definition.

### RS-22

The accepted restructuring (review `REV-RS-22`, 23 September 2026) **keeps all five layers** and retitles the
roadmap. It adds three links into it, all of which are requested here:

| new supplier | into | what for |
| --- | --- | --- |
| `VStackSheavesAndLisseCategories:VS1` | HS1 | Drinfeld's lemma, as an imported input; building the action on the actual kernels is HS1's own work |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group` | HS1 | the local Weil group and its topology; a global Galois product action is not what is needed |
| `GeometricSatakeAndFusion:GS3:fusion` | HS4 | Satake collision and factorisation coherences, before their action-level compatibility |

and it settles the ownership of Proposition IX.5.1 — see HS4 below.

### What the pinned libraries have, and what they do not

`data/library-coverage.json` has **no reviewed audit entry for this roadmap**, so the pinned declaration index was
searched directly.

**Absent from both libraries**, and therefore genuine dependencies rather than citations: any declaration whose
name contains `WeilGroup`, `LoopGroup`, `Shtuka` or `Perfectoid`, and any affine Grassmannian (the only
`Grassmannian` is `Module.Grassmannian`, the linear-algebra one). The geometric objects of this roadmap do not
exist at the pins.

**Present, and cited rather than planned:**

- `mathlib:WittVector` and `mathlib:WittVector.Isocrystal`. The second is the real find: an isocrystal is a module
  over `K(p,k) = W(k)[1/p]` with a Frobenius-semilinear automorphism, which for `G = GL_n` is *exactly* the datum
  `b ∈ G(L)` of the shtuka triple. The linear-algebra case of the datum is pinned; the `G`-version and `B(G)` are
  not.
- `mathlib:CoxeterSystem` and `tauceti:TauCeti.TitsSystem.bruhatCell`. The boundedness condition of the shtuka
  moduli is an inequality in the Bruhat order, and Tau Ceti already has the Bruhat decomposition of a Tits system.
- `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` and `tauceti:TauCeti.AffineGroupSchemeCat` for the groups;
  `tauceti:TauCeti.ClosedSubgroupScheme` for the isogeny and Levi comparisons.
- `tauceti:TauCeti.Huber.Pair` and `tauceti:TauCeti.ValuationSpectrum.spa` for the affinoid test objects.
- `tauceti:TauCeti.IsSmoothDiscrete` and `tauceti:TauCeti.SmoothDiscreteTopRep` — the pinned smooth-representation
  carriers that HS3's conclusion has to be compared with. The comparison is owned by
  `SmoothRepresentationsOfLocalGroups` and is requested.
- `mathlib:Condensed`, `mathlib:CondensedMod`, `mathlib:Profinite`, `mathlib:CompHaus` for the condensed
  enrichment that makes the Weil action continuous.

### What is deliberately absent

FS VII.4–VII.5, FS IV.7 (Drinfeld's lemma), FS VIII.4 (excursion operators) and Berkeley 23.2–23.5 and Lecture 24
were **not read** by the decomposition, and several of them are load-bearing. No node is invented for them: they
are carried as gaps with a *next source action* naming exact printed pages, and the nodes that depend on them say
so in their own hypotheses. Proposition IX.5.1 is not planned here at all — see HS4.

## HS0. Global and local Hecke stacks

The correspondence `Bun_G ← Hck^I_G → Bun_G × (Div¹)^I` parametrises two `G`-bundles on
the Fargues–Fontaine curve with an isomorphism away from the chosen degree-one divisors, **meromorphic** along them —
meromorphy being tested on every representation in the Tannakian description. *Global* here means the leg set `I`, not
a global function field; that is exactly what the accepted restructuring RS-22 retitles the roadmap to say.

Fargues–Scholze set this up in one display at the head of Chapter IX and devote no section to it. So most of what the
stage text asks for — descent, representability of the relative fibres by the bounded Grassmannian, the diagonal and
repetition maps, chains of modifications — has no located source statement and is recorded as remaining. What *is*
recorded is the one geometric property the cohomological arguments consume: for a single **minuscule** `μ` the
corresponding correspondence on `Bun_{G,C}` is proper and smooth over both factors. That is asserted for the minuscule
case only.

The roadmap's warning is kept in the API and the unit tests: global source and target maps are **not** representable
merely because the individual fibres are.

The layer's second node is the reduction that makes HS1 work. Over a geometric point, the ULA kernel category is
generated under colimits by the objects `Rf_{w∙*} ℤ_ℓ` for Demazure resolutions of Schubert varieties in the **affine
flag** variety (modulo an Iwahori) — not the affine Grassmannian — and for each such kernel the push-pull
correspondence on `Bun_{G,C}` is proper and cohomologically smooth, hence preserves `D_lis`.

**Coverage: `partial`.** The global Hecke correspondence with its leg, source and target maps, its meromorphy condition and its bounded substacks, together with the Demazure generation of the ULA kernel category that the preservation of D_lis in HS1 rests on. Fargues-Scholze set the correspondence up in a single display at the head of Chapter IX and devote no section to it, so the global statements the stage text asks for - descent, representability of the relative fibres, the diagonal and repetition maps - are recorded as remaining rather than invented. The accepted restructuring RS-22 keeps this layer and clarifies that 'global' here means the Fargues-Fontaine curve and not a global function field.

Remaining in this layer:

- The stage text asks for the stack of two G-bundles with an isomorphism away from the divisors together with source/target/leg maps, diagonal/repetition maps, bounded substacks, descent, representability of relative fibres by the bounded Grassmannian, and compactifiability/properness/dimension bounds per pushforward. Fargues-Scholze set up the correspondence in one display at the head of Chapter IX and do not devote a section to it; the local model (VI.1-VI.2) was decomposed in the GeometricSatakeAndFusion packet, but the GLOBAL statements (descent, representability of the relative fibres, the diagonal/repetition maps) were not located as proved statements anywhere read.
- Chains of modifications and the identification of composition over disjoint legs and over collisions with the convolution diagrams were not located; the convolution diagrams themselves are FS VI.8, decomposed in the Satake packet.
- Compatibility with extension of structure group, central characters and inner forms was not located.

### `global-hecke-correspondence` — The global Hecke correspondence Bun_G <- Hck^I_G -> Bun_G x (Div^1)^I

*construction.* **Planet: The global Hecke correspondence.**

**Statement.** For a finite set I, Hck^I_G parametrizes over S in Perf pairs of G-torsors E_1, E_2 on X_S together with an isomorphism away from the chosen degree-one divisors, meromorphic along them, plus the leg data S -> (Div^1)^I. The two projections p_1 : Hck^I_G -> Bun_G and p_2 : Hck^I_G -> Bun_G x (Div^1)^I form the correspondence used to define Hecke operators. Bounded substacks for tuples of dominant cocharacters are the pullbacks of the bounded loci in the local Hecke stack; for a single minuscule mu the corresponding correspondence on Bun_{G,C} is PROPER AND SMOOTH over both factors.

**Hypotheses that must not be dropped.**

- The isomorphism must be MEROMORPHIC along the divisors; this is tested on all representations in the Tannakian description (FS III.3, printed p. 97)
- The bounded loci and their properness come from the local theory: Gr_{G,Div^d,<=mu_bullet} -> Div^d is proper, representable in spatial diamonds, of finite dim.trg (FS VI.2.7). The roadmap's warning applies: GLOBAL source/target maps are not declared representable merely because individual fibres are
- The properness-and-smoothness statement quoted for a minuscule mu is asserted by Fargues-Scholze in the proof of Theorem IX.3.1 for the type-mu Hecke correspondence on Bun_{G,C}, not for arbitrary bounds
- Hck^I_G is obtained from the local Hecke stack Hck_{G,Div^d} by pullback along (Div^1_X)^I -> Div^d_X; on Hecke STACKS the comparison map for a map I -> J of finite sets is not a closed immersion (FS footnote to VI.9)

**Proof outline.**

1. Fargues-Scholze set up the correspondence in the opening of Chapter IX and define T_V by pull-tensor-push along it.
2. The local model is Hck_{G,Div^d} with its bounded substacks and Schubert stratification from VI.1-VI.2; the global stack is the pullback along the leg map.
3. The proper-and-smooth claim for a minuscule type is used in the proof of Theorem IX.3.1 to identify the local Shimura tower with a fibre of T_mu.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `HckI` | data | For a finite set I, the stack over Perf of pairs of G-torsors on X_S with an isomorphism away from the chosen degree-one divisors, meromorphic along them, together with the leg data S -> (Div^1)^I. |
| `HckI.p1` | data | The source projection to Bun_G. |
| `HckI.p2` | data | The target projection to Bun_G x (Div^1)^I; it is the map along which the solid relative homology is taken. |
| `HckI.legs` | data | The leg map to (Div^1)^I, and the diagonal and repetition maps induced by a map of finite sets I -> J. |
| `HckI.meromorphic` | structure | The meromorphy condition, tested on every representation in the Tannakian description: the associated map of vector bundles extends to F -> F'(kD) for k large. |
| `HckI.bounded` | data | The bounded substacks for a tuple of dominant cocharacters, pulled back from the bounded loci of the local Hecke stack. |
| `HckI.proper_smooth_minuscule` | characterisation | For a single minuscule mu the corresponding correspondence on Bun_{G,C} is proper and smooth over both factors; this is asserted for that case only, and is what the cohomological statements consume. |
| `HckI.pullback_from_local` | compatibility | Hck^I_G is the pullback of the local Hecke stack Hck_{G,Div^d} along (Div^1_X)^I -> Div^d_X; on Hecke stacks the comparison map for I -> J is not a closed immersion. |

Derived from where the object is used:

- in `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology` — T_V is defined by pull-tensor-relative-homology along exactly this correspondence
- in `HeckeStacksAndLocalShtukas:HS2/hecke-fibre-description` — the local Shimura tower is identified with a fibre of the type-mu correspondence
- in `HeckeStacksAndLocalShtukas:HS4/isogeny-product-and-weil-restriction-diagrams` — the isogeny diagram compares the correspondences for G and G' through Hck^I_{G'} -> Hck^I_G

**Unit tests.** A plausible wrong definition fails one of these.

- `trivial_modification` — The trivial modification recovers the identity correspondence; this is the roadmap's first acceptance test and the one that pins the normalisation.
- `one_leg_torus` — For a torus and one leg the correspondence is the modification of a line bundle at a degree-one divisor, and the bounded locus for a cocharacter is a point.
- `fibrewise_properness_is_not_representability` — Properness of the individual fibres does not make the global maps p_1 and p_2 representable; the roadmap says so explicitly, so an API that declares them representable is wrong.
- `minuscule_only` — Properness and smoothness over both factors is claimed for a minuscule bound, not for an arbitrary one; asserting it in general goes beyond the source.

**Acceptance.**

- Check the trivial modification recovers the identity correspondence
- Check a one-leg torus modification
- Check that properness of the individual fibres does not give representability of p_1, p_2 globally

**Prerequisites.** `RelativeFarguesFontaine:RF2:integral-divisors`, `RelativeFarguesFontaine:RF2:untilts`, `RelativeFarguesFontaine:RF4:G-torsors`, `BunGAndNewtonStrata:BG2:uniformization`, `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness`, `GeometricSatakeAndFusion:GS0:Witt-geometry`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:WittVector`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, IX introduction, printed p. 317.

  > Using the correspondence Bun_G <- Hck^I_G -> Bun_G x (Div^1)^I we get the Hecke operator T_V : D_et(Bun_G,Lambda) -> D_et(Bun_G x (Div^1)^I, Lambda) : A -> Rp_{2*}(p_1^* A tensor^L_Lambda S_V).

  The correspondence and the torsion-coefficient definition of the Hecke operator.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Theorem IX.3.1, printed p. 324.

  > Now mu gives rise to a Hecke operator T_mu = T_{V_mu} where V_mu is the highest weight representation of weight mu. It corresponds to the Hecke correspondence on Bun_{G,C} parametrizing modifications of type mu; this Hecke correspondence is proper and smooth over both factors.

  The geometric property of the bounded correspondence that the cohomological statements consume.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, III.3, printed p. 97.

  > a modification between E and E' at D is an isomorphism E|_{X_S \ D} -> E'|_{X_S \ D} that is meromorphic along D. The latter means that for any representation in Rep_E(G), the associated isomorphism between vector bundles ... extends to a morphism F -> F'(kD) for k >> 0.

  The meromorphy condition defining the correspondence.

### `demazure-generators-of-ULA-kernels` — Demazure generation of the ULA kernel category and preservation of D_lis

*lemma.*

**Statement.** Over a geometric point Spd C -> Div^1_X, the category D^{ULA}(Hck_{G,Spd C/Div^1_X}, Z_l) is generated under colimits by the objects R f_{w-dot *} Z_l for f_{w-dot} : L^+I \ Dem_{w-dot} -> Hck_{G,Spd C/Div^1_X} a Demazure resolution (modulo the action of an Iwahori) of a Schubert variety in the AFFINE FLAG variety. For each such generator the corresponding push-pull correspondence on Bun_{G,C} is PROPER AND COHOMOLOGICALLY SMOOTH, hence preserves D_lis(Bun_{G,C},Lambda).

**Hypotheses that must not be dropped.**

- The generation statement is over a geometric point Spd C with C = E-breve-bar; it is what reduces Proposition IX.2.1 to a proper cohomologically smooth correspondence
- The Demazure resolutions are taken in the AFFINE FLAG variety, not in the affine Grassmannian; the Iwahori quotient is part of the statement
- The passage from the generators to all of D_lis uses Proposition VII.4.3 (relation between D_solid and D_et), which was NOT read
- The reduction from a general I to I = {*} uses that V -> T_V is monoidal plus highest weight theory

**Proof outline.**

1. Reduce by highest weight theory to V an exterior tensor product of representations of G-hat, then by monoidality to the tensor factors, hence to I = {*}.
2. Reduce the claim to showing that h_{2 sharp}(h_1^* A tensor^L_solid q^* B^dual) lies in D_lis for all B in D^{ULA}(Hck_{G,Spd C/Div^1_X}, Z_l).
3. Use that this category is generated under colimits by the Demazure objects R f_{w-dot *} Z_l.
4. For each such kernel the correspondence on Bun_{G,C} is proper and cohomologically smooth, so Proposition VII.4.3 gives preservation of D_lis.

**Acceptance.**

- Check that the Demazure generators really generate under colimits, on a rank-one group
- Check that a proper cohomologically smooth correspondence preserves D_lis
- Check the reduction to I = {*} is legitimate for a non-exterior-product V

**Prerequisites.** `HeckeStacksAndLocalShtukas:HS0/global-hecke-correspondence`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness`, `VStackSheavesAndLisseCategories:VS3`, `mathlib:CoxeterSystem`, `tauceti:TauCeti.TitsSystem.bruhatCell`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition IX.2.1, printed p. 322.

  > Now the category of such B is generated (under colimits) by the objects R f_{w-dot *} Z_l for f_{w-dot} : L^+ I \ Dem_{w-dot} -> Hck_{G,Spd C/Div^1_X} a Demazure resolution (modulo action of Iwahori) of some Schubert variety in the affine flag variety. Using Proposition VII.4.3, it thus suffices to see that for the corresponding push-pull correspondence on Bun_{G,C} with kernel given by ...

  The exact generation-and-reduction argument, naming the affine flag Demazure resolutions. The excerpt is truncated here; the full quotation is in data/decompositions/HeckeStacksAndLocalShtukas.json, where the independent review checked it against the source.

## HS1. Kernels and the coherent Hecke action

Four nodes, all four planets, and one mechanism underneath all of them.

The Satake kernel `S'_V` is built from geometric Satake by composing with relative Verdier duality and extending
linearly to a `ℤ_ℓ[√q]`-algebra `Λ`; the square root of `q` is what trivialises the cyclotomic twist. The target
monoidal structure is the **solid** convolution, and the source says why in as many words:

> as the convolution on `D_■` makes use only of pullback, tensor product, and `π_♯`-functors, all of which are defined
> naturally on ∞-categories, this monoidal structure is actually a monoidal structure on the ∞-category
> `D_■(Hck^I_G, ℤ_ℓ[√q])`. (We would have to work harder to obtain this structure when employing lower-`!`-functors, as
> we have not defined them in a sufficiently structured way.)

The Hecke operator is then `T_V(A) = p_{2♯}(p_1^* A ⊗^{L,■} S'_V)`. `p_{2♯}` is the solid relative-homology **left
adjoint** of `p_2^*`. It is not a renaming of `Rp_{2!}`: for the stacky `p_2` that functor does not exist. This is the
point the stage text makes and the packet's unit tests pin it.

Everything formal then follows from one fact: `V` is **dualizable** in the Satake category. Monoidality plus
dualizability gives `T_V` a left and a right adjoint, both `T_{V^∨}`; from that, preservation of all limits, colimits
and compact objects is automatic, and preservation of ULA objects follows by adjointness from the characterisation of
ULA objects as those with perfect `RHom` against every compact object.

The fourth node is what makes the Weil action *continuous*. `D_lis(Bun_G,Λ)` is enriched in condensed anima by
`S ↦ D_lis(Bun_G × S,Λ)`, and then `D_■(Bun_G × [*/W_E^I],Λ) = D_■(Bun_G,Λ)^{BW_E^I}` — objects with a map of
**condensed animated groups** `W_E^I → Aut(A)`. The source notes that only the enrichment is needed, not the full
condensed ∞-category. A discrete abstract action is strictly weaker and, as the roadmap says, insufficient for
parameter stacks.

**Coverage: `partial`.** The heart of the packet: the Satake kernel as a solid monoidal functor, the Hecke operator defined by pull-tensor-relative-homology, the condensed enrichment that makes the Weil action continuous, and the formal consequences of dualizability. Four of the twelve nodes are here and all four are planets. RS-22 keeps the layer and adds two suppliers, VStackSheavesAndLisseCategories:VS1 for Drinfeld's lemma and the local Weil group of Tau Ceti's ClassFieldTheory roadmap; both are requested.

Remaining in this layer:

- FS VII.4 (relation to D_et, Proposition VII.4.3) and VII.5 (dualizability, Proposition VII.5.2) were NOT read; both are load-bearing - VII.4.3 for preservation of D_lis in IX.2.1, VII.5.2 for defining T_V over non-torsion Lambda and for identifying f_sharp with Rf_! Rf^!.
- Corollary IV.7.2 and Proposition IV.7.3 (Drinfeld's lemma), which give D_et(Bun_G x [*/W_E^I],Lambda) as a full subcategory of the target and identify local systems with W_E^I-representations, were NOT read.
- Corollary VII.2.7 and Proposition VII.7.3, used in the proof of Corollary IX.2.3, were not read.
- Proposition VII.7.9 (ULA equals stratumwise admissibility in the lisse setting), used for the ULA-preservation clause of IX.2.2, was located but its proof was not read; the etale analogue V.7.1 was decomposed in the VStackSheavesAndLisseCategories packet.
- The explicit statement T_unit = identity, the scalar-extension compatibility and the tensor/convolution composition across arbitrary finite sets are implied by monoidality but were not isolated as source statements.

### `satake-kernel-and-solid-monoidal-functor` — FS IX.2: the Satake kernel S'_V as a solid monoidal functor, extended from Z_l[sqrt q] to arbitrary Lambda

*construction.* **Planet: The Satake kernel S_V.**

**Statement.** Geometric Satake gives exact Rep_{Z_l[sqrt q]}(Q^I)-linear monoidal functors Rep_{Z_l[sqrt q]}((G-hat semidirect Q)^I) -> Sat(Hck^I_G, Z_l[sqrt q]) : V -> S_V, the target being the inverse limit over n of the Z/l^n[sqrt q]-versions, functorially in I. Composing with A -> D(A)^dual (Verdier duality relative to Hck^I_G -> [(Div^1)^I/L^+G]) gives exact monoidal functors into D_solid(Hck^I_G, Z_l[sqrt q]), where the target's monoidal structure is the convolution of FS VII.5. This extends uniquely by linearity to an exact Rep_Lambda(Q^I)-linear monoidal functor Rep_Lambda((G-hat semidirect Q)^I) -> D_solid(Hck^I_G, Lambda) : V -> S'_V.

**Hypotheses that must not be dropped.**

- Lambda must be a Z_l[sqrt q]-ALGEBRA; the square root of q is what trivializes the cyclotomic twist in geometric Satake, and Q is a finite quotient of W_E through which the action on G-hat factors
- The monoidal structure on D_solid(Hck^I_G, Z_l[sqrt q]) is available on the INFINITY-CATEGORY because the solid convolution uses only pullback, tensor product and pi_sharp, all naturally defined infinity-categorically; Fargues-Scholze note 'We would have to work harder to obtain this structure when employing lower-!-functors, as we have not defined them in a sufficiently structured way'
- The functor from Rep((G-hat semidirect Q)^I) is monoidal in this setting because on perverse sheaves there are no higher coherences to take care of
- The extension to general Lambda implicitly uses HIGHEST WEIGHT THEORY, through the identity Perf(B(G-hat semidirect Q)^I_{Z_l[sqrt q]}) tensor_{Perf(BQ^I)} Perf(*/Q^I_Lambda) = Perf(*/(G-hat semidirect Q)^I_Lambda), and that the free stable infinity-category with an exact functor from Rep_Lambda((G-hat semidirect Q)^I) is Perf(*/(G-hat semidirect Q)^I_Lambda)

**Proof outline.**

1. Start from the geometric Satake equivalence of GS4 with the sqrt(q)-normalisation, giving V -> S_V into the Satake category with Z_l[sqrt q]-coefficients, defined as an inverse limit over torsion levels.
2. Compose with A -> D(A)^dual to land in the solid category, where the relevant monoidal structure is the VII.5 convolution; note that this functor is monoidal for the usual convolution on perverse sheaves and the solid convolution on the target.
3. Extend linearly to a general Z_l[sqrt q]-algebra Lambda using the highest-weight/perfect-complex identity.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `satakeSheaf` | data | The geometric Satake functor V -> S_V from Rep_{Z_l[sqrt q]}((G-hat semidirect Q)^I) to the Satake category of Hck^I_G, defined as the inverse limit over torsion levels and functorial in I. |
| `satakeKernel` | data | S'_V in D_solid(Hck^I_G, Lambda), the composite of S_V with Verdier duality relative to Hck^I_G -> [(Div^1)^I/L^+G], extended by linearity to a Z_l[sqrt q]-algebra Lambda. |
| `satakeKernel.monoidal` | structure | Monoidality for the solid convolution of FS VII.5; on perverse sheaves there are no higher coherences to take care of, which is why the functor is monoidal on the nose. |
| `satakeKernel.infinityCategorical` | structure | The monoidal structure exists on the infinity-category because the solid convolution uses only pullback, tensor and pi_sharp; Fargues-Scholze say they would have to work harder with lower-shriek functors, which they have not defined in a sufficiently structured way. |
| `satakeKernel.sqrtq` | data | The Z_l[sqrt q]-coefficient convention, which trivializes the cyclotomic twist, and the finite quotient Q of W_E through which the action on G-hat factors. |
| `satakeKernel.dualizable` | characterisation | V is dualizable in the Satake category with dual V^dual; every formal property of T_V in HS1 follows from this. |

Derived from where the object is used:

- in `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology` — the kernel is the middle term of the pull-tensor-push
- in `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance` — dualizability of V in the Satake category is what makes T_V biadjoint to T_{V^dual}
- in `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality` — functoriality in I of the Hecke family is inherited from functoriality in I of this functor

**Unit tests.** A plausible wrong definition fails one of these.

- `unit_kernel` — S'_1 is the unit kernel, so that T_1 is the identity; this is the roadmap's normalisation test.
- `sqrt_q_on_a_torus` — On a torus the sqrt(q) normalisation is visible as the half-integral Tate twist; taking Z_l coefficients without a square root of q changes the functor.
- `lands_in_the_dualizable_category` — The kernel lies in the dualizable ULA category; without that the adjointness argument of HS1 has no input.
- `solid_not_shriek` — The target monoidal structure is the solid convolution built from pullback, tensor and pi_sharp. A construction using a lower-shriek functor is not what the source builds and, as the source says, is not available in a sufficiently structured form.

**Acceptance.**

- Check T_unit = identity, i.e. S'_1 is the unit kernel
- Check that the kernel lands in the dualizable/ULA category, which is what IX.2.2's adjointness argument uses
- Check the sqrt(q) normalisation on a torus

**Prerequisites.** `GeometricSatakeAndFusion:GS2:Satake-closure`, `GeometricSatakeAndFusion:GS3:fusion`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `VStackSheavesAndLisseCategories:VS2`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:Representation`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.LeftRigidCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, IX.2, printed p. 321.

  > We can compose with the functor A -> D(A)^dual (where the Verdier duality is relative to the projection Hck^I_G -> [(Div^1)^I/L^+G]) to get exact Rep_{Z_l[sqrt q]}(Q^I)-linear monoidal functors Rep_{Z_l[sqrt q]}((G-hat semidirect Q)^I) -> D_solid(Hck^I_G, Z_l[sqrt q]), functorially in I.

  The construction of the solid kernel from the Satake sheaf.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, IX.2, printed p. 321.

  > We note that as the convolution on D_solid makes use only of pullback, tensor product, and pi_sharp-functors, all of which are defined naturally on infinity-categories, this monoidal structure is actually a monoidal structure on the infinity-category D_solid(Hck^I_G, Z_l[sqrt q]). (We would have to work harder to obtain this structure when employing lower-!-functors, as we have not ...

  Records exactly why the solid pi_sharp is used rather than a naive lower-shriek, which is what the stage text asks to be respected. The excerpt is truncated here; the full quotation is in data/decompositions/HeckeStacksAndLocalShtukas.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, IX introduction, printed p. 317.

  > As in the last chapter, we work over a Z_l[sqrt q]-algebra Lambda in order to trivialize the cyclotomic twist in the geometric Satake equivalence; let Q be a finite quotient of W_E over which the action on G-hat factors.

  The coefficient hypothesis and the role of sqrt(q).

### `hecke-operator-via-relative-homology` — FS IX.2 and IX.2.1: T_V by pull-tensor-relative-homology, and preservation of D_lis

*construction.* **Planet: The Hecke operator T_V.**

**Statement.** Define T_V(A) = p_{2 sharp}(p_1^* A tensor^{L,solid}_Lambda S'_V) along the Hecke correspondence, giving T_V : D_lis(Bun_G,Lambda) -> D_solid(Bun_G x (Div^1)^I, Lambda). The passage from torsion Lambda to arbitrary Lambda is exactly the translation of Proposition VII.5.2. Pulling back to the diagonal geometric point Spd C -> (Div^1)^I with C = E-breve-bar, the functor depends only on the composite factoring over Rep_Lambda(G-hat^I), and then T_V : D_solid(Bun_G x Spd C, Lambda) -> D_solid(Bun_G x Spd C, Lambda) restricts to T_V : D_lis(Bun_G,Lambda) -> D_lis(Bun_G,Lambda).

**Hypotheses that must not be dropped.**

- p_{2 sharp} is the SOLID relative-homology left adjoint of p_2^*, not an ordinary Rp_{2!}; the naive ECD lower-shriek is unavailable for the stacky map p_2
- The tensor product is the solid one
- For arbitrary (non-torsion) Lambda the definition rests on Proposition VII.5.2 (f_sharp Lambda = Rf_! Rf^! Lambda for separated cohomologically smooth f), which was NOT read
- Proposition IX.2.1 is stated after pullback to the diagonal geometric point Spd C, where the functor factors over Rep_Lambda(G-hat^I) rather than Rep_Lambda((G-hat semidirect Q)^I)

**Proof outline.**

1. Define T_V by pull-tensor-push with the solid relative homology.
2. For preservation of D_lis: reduce by highest weight theory and monoidality to I = {*}; reduce to showing h_{2 sharp}(h_1^* A tensor^L_solid q^* B^dual) in D_lis for all ULA B; use the Demazure generation and Proposition VII.4.3 for the proper cohomologically smooth correspondences.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `heckeOperator` | data | T_V(A) = p_{2 sharp}(p_1^* A tensor^{L,solid} S'_V), a functor D_lis(Bun_G,Lambda) -> D_solid(Bun_G x (Div^1)^I, Lambda). |
| `heckeOperator.sharp` | structure | p_{2 sharp} is the solid relative-homology left adjoint of p_2^*, not an ordinary Rp_{2!}: the naive lower-shriek is not defined for the stacky map p_2. |
| `heckeOperator.generalLambda` | compatibility | The extension from torsion Lambda to an arbitrary Z_l[sqrt q]-algebra is the translation of Proposition VII.5.2, which this packet records as unread. |
| `heckeOperator.preservesLis` | characterisation | Proposition IX.2.1: after pullback to the diagonal geometric point Spd C, T_V restricts to an endofunctor of D_lis(Bun_G,Lambda). |
| `heckeOperator.factorsOverDualGroup` | compatibility | At the diagonal geometric point the functor depends only on the composite factoring over Rep_Lambda(G-hat^I) rather than Rep_Lambda((G-hat semidirect Q)^I). |

Derived from where the object is used:

- in `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance` — every formal property is a property of this functor
- in `HeckeStacksAndLocalShtukas:HS3/compactness-of-shtuka-cohomology` — the compactness theorem applies T_mu to a compactly induced object and reads off the answer on a stratum
- in `HeckeStacksAndLocalShtukas:HS3/admissibility-duality-and-adjunction` — the adjoint description of the colimit over levels is the adjunction between T_mu and T_{mu^dual}

**Unit tests.** A plausible wrong definition fails one of these.

- `unit_gives_identity` — T_V for the unit kernel is the identity functor.
- `sharp_is_not_shriek` — p_{2 sharp} is not a renaming of Rp_{2!}: the latter is not defined for p_2, so a formalisation that uses it is not this construction.
- `preserves_lisse` — T_V maps D_lis into D_lis, which is Proposition IX.2.1 and rests on the Demazure generation of the ULA kernels.
- `factorisation_at_the_diagonal_point` — At the diagonal geometric point the functor factors over Rep_Lambda(G-hat^I); away from it the Q-action is genuinely present and the factorisation fails.

**Acceptance.**

- Check T_V on the unit kernel gives the identity
- Check that the naive Rp_{2!} is not defined for p_2, so that p_{2 sharp} is not a renaming
- Check the factorisation over Rep_Lambda(G-hat^I) at the diagonal geometric point

**Prerequisites.** `HeckeStacksAndLocalShtukas:HS0/demazure-generators-of-ULA-kernels`, `HeckeStacksAndLocalShtukas:HS1/satake-kernel-and-solid-monoidal-functor`, `VStackSheavesAndLisseCategories:VS2`, `VStackSheavesAndLisseCategories:VS3`, `mathlib:DerivedCategory`, `mathlib:CategoryTheory.Adjunction`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, IX.2, printed pp. 321-322.

  > T_V(A) = p_{2 sharp}(p_1^* A tensor^{L,solid}_Lambda S'_V) where we consider the usual diagram Bun_G <- Hck^I_G -> Bun_G x (Div^1)^I. Note that we have thus essentially used the translation of Proposition VII.5.2 to extend the Hecke operators from the case of torsion rings Lambda to all Lambda.

  The definition with the solid relative homology and the exact reason the extension to general Lambda works.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition IX.2.1, printed p. 322.

  > For any V in Rep_Lambda(G-hat^I), the functor T_V : D_solid(Bun_G x Spd C, Lambda) -> D_solid(Bun_G x Spd C, Lambda) restricts to a functor T_V : D_lis(Bun_G,Lambda) -> D_lis(Bun_G,Lambda).

  The preservation statement, stated at the diagonal geometric point.

### `properties-and-weil-equivariance` — FS IX.2.2-IX.2.4: exactness, preservation of compact and ULA objects, duality, and the W_E^I-action

*theorem.* **Planet: T_V preserves compact and ULA objects.**

**Statement.** For V in Rep_Lambda(G-hat^I), T_V preserves all limits and colimits, compact objects and universally locally acyclic objects, and for the involution sw^* of Proposition VI.12.1 there are natural isomorphisms D_BZ(T_V(A)) = T_{sw^* V^dual}(D_BZ(A)) and RHom_lis(T_V(A),Lambda) = T_{sw^* V^dual} RHom_lis(A,Lambda). For V in Rep_Lambda((G-hat semidirect Q)^I), T_V takes values in D_solid(Bun_G x [*/W_E^I],Lambda) with lisse pullback, hence induces T_V : D_lis(Bun_G,Lambda) -> D_lis(Bun_G,Lambda)^{B W_E^I}; and the Hecke action gives exact Rep_Lambda(Q^I)-linear monoidal functors Rep_Lambda((G-hat semidirect Q)^I) -> End_Lambda(D_lis(Bun_G,Lambda)^omega)^{B W_E^I}, functorially in I.

**Hypotheses that must not be dropped.**

- Preservation of limits, colimits and compact objects is FORMAL from monoidality plus dualizability of V in the Satake category, which gives T_V left and right adjoints both equal to T_{V^dual}
- Preservation of ULA objects uses the characterisation of Proposition VII.7.9 (A is ULA if and only if RHom_Lambda(B,A) is perfect for all compact B) and then adjointness; it is NOT proved directly
- The duality statements rest on the identity pi_sharp(T_V(A) tensor^L_solid B) = pi_sharp(A tensor^L_solid T_{sw^* V}(B)), both sides being the homology of Hck^I_G x_{(Div^1)^I} Spd C with coefficients in h_1^* A tensor h_2^* B tensor S'_V, plus Proposition VI.12.1
- Corollary IX.2.3's reduction to I = {*} uses a possibly INFINITE resolution by exterior tensor products, legitimate because only finitely many weights of G-hat^I are involved
- Corollary IX.2.3 also uses Corollary VII.2.7 and Proposition VII.7.3 (that D_lis(Bun_G,Lambda) -> D_lis(Bun_G x Spd C,Lambda) is an equivalence); neither was read

**Proof outline.**

1. Monoidality of V -> T_V plus dualizability of V gives adjoints T_{V^dual} on both sides, hence preservation of limits, colimits and compact objects.
2. ULA preservation by VII.7.9 plus adjointness.
3. The duality isomorphisms from the displayed pi_sharp identity together with VI.12.1, using that T_{sw^* V^dual} is right adjoint to T_{sw^* V} for the Bernstein-Zelevinsky statement and left adjoint for the naive dual.
4. For IX.2.3: reduce to I = {*} by the resolution argument, then use VII.2.7 to reduce to the pullback to Bun_G x Spd C, where IX.2.1 and VII.7.3 apply.
5. IX.2.4 then packages the result as a monoidal functor into W_E^I-equivariant endofunctors of the compact objects.

**Acceptance.**

- Check T_V preserves compact objects on a compactly induced generator
- Check the duality isomorphism on a self-dual V
- Check continuity of the W_E^I-action, i.e. that it is a map of condensed animated groups and not merely abstract

**Prerequisites.** `HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`, `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology`, `VStackSheavesAndLisseCategories:VS4`, `VStackSheavesAndLisseCategories:VS5`, `mathlib:CategoryTheory.LeftRigidCategory`, `mathlib:CategoryTheory.Adjunction`, `mathlib:CategoryTheory.Idempotents.Karoubi`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem IX.2.2 and proof, printed pp. 322-323.

  > The functor V -> T_V is monoidal. As V is dualizable in the Satake category, with dual V^dual, it follows that T_V has a left and a right adjoint, given by T_{V^dual}, and hence it follows formally that it preserves all limits and colimits, and compact objects. Now recall that A in D_lis(Bun_G,Lambda) is universally locally acyclic if and only if for all compact B in D_lis(Bun_G,Lambda), ...

  The complete mechanism: dualizability in the Satake category is what makes everything formal. The excerpt is truncated here; the full quotation is in data/decompositions/HeckeStacksAndLocalShtukas.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Corollary IX.2.4, printed p. 323.

  > Endowing the stable Z_l-linear infinity-category D_lis(Bun_G,Lambda)^omega with the relatively discrete condensed structure, the Hecke action defines exact Rep_Lambda(Q^I)-linear monoidal functors Rep_Lambda((G-hat semidirect Q)^I) -> End_Lambda(D_lis(Bun_G,Lambda)^omega)^{B W_E^I}, functorially in I.

  The packaged statement with the condensed structure and the functoriality in I.

### `condensed-enrichment` — FS IX.1: the condensed infinity-category structure and the identification of W_E^I-equivariant objects

*construction.* **Planet: The condensed enrichment of D_lis.**

**Statement.** D_lis(Bun_G,Lambda) is given the structure of a condensed infinity-category by S -> D_lis(Bun_G x S,Lambda) for S extremally disconnected profinite; it is a full condensed infinity-subcategory of the condensed infinity-category D_solid(Bun_G,Lambda), which is a hypersheaf in S by v-hyperdescent. Consequently D_solid(Bun_G x [*/W_E^I],Lambda) = D_solid(Bun_G,Lambda)^{B W_E^I}, the objects A together with a map of CONDENSED ANIMATED GROUPS W_E^I -> Aut(A). Only the structure of an infinity-category enriched in condensed anima is needed. Pullback along Bun_G x (Div^1)^I -> Bun_G x [*/W_E^I] induces a fully faithful functor D_lis(Bun_G,Lambda)^{B W_E^I} -> D_solid(Bun_G x (Div^1)^I, Lambda), with essential image the objects whose pullback to Bun_G is lisse.

**Hypotheses that must not be dropped.**

- The condensed structure is evaluated on EXTREMALLY DISCONNECTED profinite sets; the hypersheaf property is for D_solid and follows from the case of D(X_v,Lambda)
- The W_E^I-action is a map of CONDENSED animated groups; a discrete abstract action is not what is constructed, which is exactly the roadmap's requirement
- The identification D_solid(Bun_G x [*/W_E^I],Lambda) = D_solid(Bun_G,Lambda)^{B W_E^I} is 'a direct consequence of descent'
- The full faithfulness in Proposition IX.1.1 factors through the identification of Corollary IV.7.2 (Drinfeld's lemma), which was NOT read

**Proof outline.**

1. Define the condensed enrichment by S -> D_lis(Bun_G x S,Lambda).
2. Use v-hyperdescent of D_solid to get the hypersheaf property, hence the descent identification with B W_E^I-equivariant objects.
3. Observe that only enrichment in condensed anima (in fact condensed animated Lambda-modules) is needed.
4. Proposition IX.1.2 obtains this enrichment from the Lambda-linear stable structure, using that RGamma([*/K],B') is a direct summand of the stalk of B' at *, which has the relatively discrete condensed Z_l-module structure.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `condensedStructure` | data | The condensed infinity-category structure on D_lis(Bun_G,Lambda) given by S -> D_lis(Bun_G x S,Lambda) for S extremally disconnected profinite. |
| `condensedStructure.hypersheaf` | structure | D_solid(Bun_G,Lambda) is a hypersheaf in S by v-hyperdescent, which is what extends the enrichment from extremally disconnected sets. |
| `weilEquivariant` | data | D_solid(Bun_G x [*/W_E^I],Lambda) = D_solid(Bun_G,Lambda)^{B W_E^I}: objects A with a map of CONDENSED animated groups W_E^I -> Aut(A). A discrete abstract action is not this. |
| `weilEquivariant.enrichmentSuffices` | structure | Only the structure of an infinity-category enriched in condensed anima is needed, not the full condensed infinity-category; Fargues-Scholze make this reduction explicitly. |
| `weilEquivariant.fullyFaithful` | universal-property | Proposition IX.1.1: pullback along Bun_G x (Div^1)^I -> Bun_G x [*/W_E^I] is fully faithful with essential image the objects whose pullback to Bun_G is lisse. |
| `condensedStructure.fromLinearity` | constructor | Proposition IX.1.2 obtains the enrichment from the Lambda-linear stable structure, using that RGamma([*/K],B') is a direct summand of the stalk at *, which carries the relatively discrete condensed structure. |

Derived from where the object is used:

- in `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance` — the W_E^I-equivariant target of T_V is this category, and Corollary IX.2.4 is stated in it
- in `HeckeStacksAndLocalShtukas:HS3/compactness-of-shtuka-cohomology` — continuity of the W_E-action on shtuka cohomology means exactly that W_E acts as a condensed group here
- in `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality` — the coCartesian family of monoidal functors lands in W_E^I-equivariant endofunctors

**Unit tests.** A plausible wrong definition fails one of these.

- `condensed_not_discrete` — The action is a map of condensed animated groups; an abstract action of the underlying group is strictly weaker and, as the roadmap says, insufficient for parameter stacks.
- `classical_continuity` — On a Hecke image the condensed action is, in classical language, a continuous action of W_E; this is the translation the source itself gives.
- `extremally_disconnected` — The enrichment is evaluated on extremally disconnected profinite sets and extended by hypersheaf descent; evaluating on all profinite sets without descent is not the same structure.
- `image_is_the_lisse_locus` — The essential image of the fully faithful functor of Proposition IX.1.1 is exactly the objects whose pullback to Bun_G is lisse.

**Acceptance.**

- Check that the W_E-action on a Hecke image is continuous in the classical sense
- Check the full faithfulness of Proposition IX.1.1 on an explicit object
- Check that the enrichment is on extremally disconnected S and extends by hypersheaf descent

**Prerequisites.** `VStackSheavesAndLisseCategories:VS1`, `VStackSheavesAndLisseCategories:VS3`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:Condensed`, `mathlib:CondensedMod`, `mathlib:Profinite`, `mathlib:CompHaus`, `mathlib:CategoryTheory.Sheaf`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, IX.1, printed p. 320.

  > More concretely, this is the infinity-category of objects A in D_solid(Bun_G,Lambda) together with a map of condensed animated groups W_E^I -> Aut(A). We see in particular that to define D_solid(Bun_G,Lambda)^{B W_E^I}, we do not need to know the full structure as a condensed infinity-category. Rather, we only need the structure as an infinity-category enriched in condensed anima.

  The exact form of the continuous Weil action the stage text requires.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition IX.1.1, printed p. 320.

  > The essential image of the first functor consists of all objects A in D_solid(Bun_G x [*/W_E^I],Lambda) whose pullback to Bun_G lies in D_lis(Bun_G,Lambda).

  The characterisation of the image, used in Corollary IX.2.3.

## HS2. Local shtuka moduli and bounds

The datum is `(𝒢, b, {μ_i})`: a **smooth** group scheme `𝒢` with reductive generic
fibre and **connected special fibre** — more general than a reductive group, and what admits parahoric level — an
element `b ∈ G(L)` with `L = W(k)[1/p]`, and conjugacy classes of cocharacters with their fields of definition.
`Sht_{𝒢,b,{μ_i}}` sends `S` to quadruples `(𝒫, {S_i^♯}, φ_𝒫, ι_r)`, and Theorem 23.1.4 says it is a locally spatial
diamond. (The v-sheaf property is weaker and already follows from Proposition 19.5.3.)

Two details of the boundedness condition survive into the API because they are easy to lose. It is imposed at geometric
**rank-1 points** only; and at a repeated untilt the bound is the **sum** of the corresponding `μ_j`, which is how
colliding legs are handled.

Only Definition 23.1.1, Remarks 23.1.2–23.1.3 and the statement of Theorem 23.1.4 were read. Sections 23.2–23.5 (the
proof) and the whole of Lecture 24, which constructs the local Shimura tower, were not. So the tower itself, its level
quotients and transition maps, its cofinality and the two commuting `J_b(E)`-actions are recorded as remaining, and the
one node that does mention the tower — the identification of `M_{(G,b,μ),K,C}` with a fibre of `T_μ` — carries the
source's citation to the unread Lecture 24 in its own hypotheses.

The roadmap forbids restricting local shtukas to classical Rapoport–Zink spaces, and the unit tests say so: a
nonminuscule bound gives a space with no classical counterpart.

**Coverage: `partial`.** The moduli of mixed-characteristic local G-shtukas with their boundedness condition, and the identification of the minuscule case with a fibre of the Hecke correspondence. Only Definition 23.1.1, Remarks 23.1.2-23.1.3 and the statement of Theorem 23.1.4 of the Berkeley lectures were read; sections 23.2-23.5 and the whole of Lecture 24, which constructs the local Shimura tower, were not, so the tower itself is recorded as remaining.

Remaining in this layer:

- Scholze-Weinstein Lecture 23 sections 23.2-23.5 (the case of no legs, the case of one leg, the proof of Theorem 23.1.4, the duality Corollary 23.3.2) were NOT read; only Definition 23.1.1, Remarks 23.1.2-23.1.3 and the statement of Theorem 23.1.4 were.
- Scholze-Weinstein Lecture 24 (local Shimura varieties and the EL/PEL comparisons), which constructs the tower (M_{(G,b,mu),K}) and is cited by FS IX.3, was NOT read.
- Compact-open level quotients, the transition maps, the cofinality and descent properties needed before describing the tower as an inverse limit of level sheaves, and the descent to the reflex field with its Weil action, were not located as proved statements in anything read.
- The two commuting J_b(E) and J_{b'}(E) actions at a basic pair, which the completion contract asks to be constructed before cohomology, were not located.

### `local-shtuka-moduli` — Scholze-Weinstein Definition 23.1.1 and Theorem 23.1.4: moduli of mixed-characteristic local G-shtukas

*definition.* **Planet: Moduli of local G-shtukas.**

**Statement.** Let (G, b, {mu_i}) consist of a SMOOTH group scheme G with reductive generic fibre G and CONNECTED SPECIAL FIBRE, an element b in G(L) with L = W(k)[1/p], and conjugacy classes mu_1,...,mu_m of cocharacters G_m -> G_{Q_p-bar} with fields of definition E_i and E-breve_i = E_i . L. Then Sht_{G,b,{mu_i}} -> Spd E-breve_1 x_{Spd k} ... x_{Spd k} Spd E-breve_m sends S = Spa(R,R^+) to quadruples (P, {S_i^sharp}, phi_P, iota_r) where P is a G-torsor on S x-dot Spa Z_p, S_i^sharp is an untilt of S over E-breve_i, phi_P is an isomorphism (Frob_S^* P) -> P away from the union of the graphs Gamma_{x_i}, meromorphic along the closed Cartier divisor, and iota_r is a trivialization over Y_{[r,infty)}(S) for large r under which phi_P is identified with b x Frob_S. The boundedness condition is: at all GEOMETRIC RANK-1 POINTS of S, the relative position of Frob_S^* P and P at S_i^sharp is bounded in the BRUHAT ORDER by the sum of the mu_j with S_j^sharp = S_i^sharp. Theorem 23.1.4: Sht_{G,b,{mu_i}} is a locally spatial diamond.

**Hypotheses that must not be dropped.**

- G is a SMOOTH group scheme with reductive generic fibre and CONNECTED special fibre; this is more general than a reductive group and is what allows parahoric levels
- The boundedness condition is imposed at geometric RANK-1 points only, and the bound at a repeated untilt is the SUM of the corresponding mu_j - this is how coincident legs are handled
- The trivialization iota_r is only required over Y_{[r,infty)}(S) for r large, i.e. near one end; it is part of the data, not a property
- Scholze-Weinstein note that Sht_{(G,b,mu_bullet)} is already a v-sheaf by Proposition 19.5.3 before the locally-spatial-diamond theorem
- The isomorphism class depends only on the class of b in B(G): replacing b by phi(y) b y^{-1} corresponds to composing iota_r with y x id
- Remark 23.1.2: the boundedness condition is essentially the same as the one defining Gr_{G,Spd E_1 x ... x Spd E_m, <= mu_bullet}

**Proof outline.**

1. Scholze-Weinstein give the functor of points and record the v-sheaf property from 19.5.3.
2. Theorem 23.1.4 is proved first in the case of no legs (23.2) and then for one leg (23.3), the general case by induction; only the statement and the opening of the argument were read here.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `ShtukaDatum` | data | The triple (G, b, {mu_i}): a SMOOTH group scheme G with reductive generic fibre and CONNECTED special fibre, b in G(L) with L = W(k)[1/p], and conjugacy classes mu_1,...,mu_m of cocharacters with fields of definition E_i and E-breve_i = E_i . L. |
| `Sht` | data | Sht_{G,b,{mu_i}} over Spd E-breve_1 x_{Spd k} ... x_{Spd k} Spd E-breve_m, sending S to quadruples (P, {S_i^sharp}, phi_P, iota_r). |
| `Sht.frobeniusStructure` | data | phi_P : Frob_S^* P -> P away from the union of the graphs Gamma_{x_i}, meromorphic along the closed Cartier divisor. |
| `Sht.trivialization` | data | iota_r, a trivialization over Y_{[r,infty)}(S) for r large under which phi_P is identified with b x Frob_S. It is part of the data, not a property. |
| `Sht.bounded` | structure | The boundedness condition: at all GEOMETRIC RANK-1 POINTS of S the relative position of Frob_S^* P and P at S_i^sharp is bounded in the Bruhat order by the SUM of the mu_j with S_j^sharp = S_i^sharp. |
| `Sht.isLocallySpatialDiamond` | characterisation | Theorem 23.1.4: the moduli space is a locally spatial diamond. The v-sheaf property is weaker and already follows from Proposition 19.5.3. |
| `Sht.dependsOnBClass` | compatibility | The isomorphism class depends only on the class of b in B(G): replacing b by phi(y) b y^{-1} corresponds to composing iota_r with y x id. |

Derived from where the object is used:

- in `HeckeStacksAndLocalShtukas:HS2/hecke-fibre-description` — the minuscule case of this moduli problem is identified with a fibre of the Hecke correspondence
- in `HeckeStacksAndLocalShtukas:HS3/compactness-of-shtuka-cohomology` — the compactly supported cohomology whose compactness is proved is that of these spaces at finite level

**Unit tests.** A plausible wrong definition fails one of these.

- `no_legs` — With no legs the space is the classifying object for the automorphism group of b; this is the base case of the representability proof and the smallest check of the data.
- `connected_special_fibre` — The special fibre of G is required to be connected, which is what allows parahoric level; dropping it changes the class of levels the definition covers.
- `bound_at_coincident_legs` — At a repeated untilt the bound is the SUM of the corresponding mu_j, not each of them separately; this is how colliding legs are handled and a definition that imposes them separately is wrong.
- `rank_one_points_only` — The boundedness condition is imposed at geometric rank-1 points; imposing it at all points is a different, stronger condition.
- `nonminuscule_is_not_rapoport_zink` — A nonminuscule bound gives a local shtuka space with no classical Rapoport-Zink counterpart; the roadmap forbids restricting the definition to the classical case.

**Acceptance.**

- Check the no-leg case, which should be a classifying object for the automorphism group of b
- Check a minuscule GL_n datum against the classical Rapoport-Zink space, remembering that this comparison is a theorem and not a definition
- Check a nonminuscule bound, which is not a Rapoport-Zink space

**Prerequisites.** `RelativeFarguesFontaine:RF4:G-torsors`, `BunGAndNewtonStrata:BG3`, `GeometricSatakeAndFusion:GS0:Witt-geometry`, `tauceti:TauCeti.AffineGroupSchemeCat`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, `tauceti:TauCeti.TitsSystem.bruhatCell`, `mathlib:CoxeterSystem`, `mathlib:WittVector`, `mathlib:WittVector.Isocrystal`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.ValuationSpectrum.spa`

**Sources.**

- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Definition 23.1.1, printed pp. 216-217.

  > Let (G, b, {mu_i}) be a triple consisting of a smooth group scheme G with reductive generic fiber G and connected special fiber, an element b in G(L), and a collection mu_1, ..., mu_m of conjugacy classes of cocharacters G_m -> G_{Q_p-bar}.

  The exact hypotheses on the datum, including the connected special fibre that permits parahoric level.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Definition 23.1.1, printed p. 217.

  > The isomorphism phi_P is required to be meromorphic along the closed Cartier divisor union_{i=1}^m S_i^sharp in S x-dot Spa Z_p, and it is subject to the following boundedness condition: At all geometric rank 1 points of S, the relative position of Frob_S^* P and P at S_i^sharp is bounded by sum_{j | S_j^sharp = S_i^sharp} mu_j in the Bruhat order.

  The boundedness condition with its exact quantifier and the sum over coincident legs.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Theorem 23.1.4 and the sentence after it, printed p. 217.

  > The moduli space Sht_{G,b,{mu_i}} is a locally spatial diamond. Before embarking on the proof, let us note that the descent result of Proposition 19.5.3 already implies that Sht_{(G,b,mu_bullet)} is a v-sheaf.

  The representability theorem and the separate, weaker v-sheaf statement.

### `hecke-fibre-description` — FS IX.3: the local Shimura tower as a fibre of the Hecke correspondence

*comparison.*

**Statement.** For E = Q_p and a local Shimura datum (G, b, mu) with mu MINUSCULE and b in B(G,mu), the tower (M_{(G,b,mu),K})_{K in G(Q_p)} of partially proper smooth rigid-analytic spaces over E-breve constructed in Scholze-Weinstein Lecture 24 is identified, at level K, with the space of modifications of G-torsors of type mu from the G-bundle E_b to the G-bundle E_1, modulo the action of K. Under this identification, i_b^* T_mu(j_! c-Ind_K^{G(Q_p)} Z_l) is, up to shift, f_{K sharp} Z_l for f_K : M_{(G,b,mu),K,C} -> Spa C.

**Hypotheses that must not be dropped.**

- mu must be MINUSCULE for the local Shimura datum; nonminuscule bounds give local shtuka moduli that are not local Shimura varieties
- b must lie in B(G,mu), the mu-admissible subset of B(G)
- E here denotes the REFLEX FIELD of mu, not the base local field; Fargues-Scholze flag this change of meaning explicitly
- The identification is quoted from [SW20, Lecture 23, 24]; those lectures were read only for Definition 23.1.1 and Theorem 23.1.4, not for the local Shimura tower construction in Lecture 24
- The Hecke correspondence of type mu is proper and smooth over both factors, which is what makes the fibre computation work

**Proof outline.**

1. Apply T_mu = T_{V_mu} to A = j_! c-Ind_K^{G(Q_p)} Z_l, where j : Bun_G^1 = [*/G(Q_p)] -> Bun_G is the open immersion.
2. Restrict along i_b : Bun_G^b -> Bun_G and use the identification D_lis(Bun_G^b,Z_l) = D(G_b(Q_p),Z_l).
3. Identify the result with f_{K sharp} Z_l via the description of M_{(G,b,mu),K,C} as modifications of type mu from E_b to E_1 modulo K.

**Acceptance.**

- Check the identification for GL_2 and a minuscule mu against the Lubin-Tate tower
- Check that a nonminuscule bound gives a local shtuka space with no classical counterpart
- Check the level-K quotient and the transition maps between two pro-p levels

**Prerequisites.** `HeckeStacksAndLocalShtukas:HS2/local-shtuka-moduli`, `BunGAndNewtonStrata:BG3`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Theorem IX.3.1, printed p. 324.

  > But this is, up to shift again, precisely f_{K sharp} Z_l, by the identification of M_{(G,b,mu),K,C} with the space of modifications of G-torsors of type mu from the G-bundle E_b to the G-bundle E_1, up to the action of K (cf. [SW20, Lecture 23, 24]).

  The exact fibre description, with its citation to the unread Lecture 24.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, IX.3, printed p. 324.

  > Consider any local Shimura datum, consisting of a reductive group G over Q_p, a conjugacy class of minuscule cocharacters mu : G_m -> G_{Q_p-bar} with field of definition E|Q_p and some element b in B(G,mu) in B(G). (Beware that we are making a small sin here in changing the meaning of the letter E, using it now in its usual meaning as a reflex field.)

  The hypotheses of the local Shimura datum and the source's own warning about the notation clash.

## HS3. Cohomology as a representation-valued functor

`RΓ_c(M_{(G,b,μ),K,C}, ℤ_ℓ)` — colimit over quasicompact opens of the limit over `m`
of `RΓ_c(U, ℤ/ℓ^m)`, **in that order** — is a complex of smooth `G_b(ℚ_p)`-representations and, **if `K` is pro-`p`**, a
compact object of `D(G_b(ℚ_p), ℤ_ℓ)`. The proof is short because HS1 did the work: apply `T_μ` to the compact object
`j_! c-Ind_K^{G(ℚ_p)} ℤ_ℓ`, which stays compact by Theorem IX.2.2; restrict to the stratum, which preserves
compactness; and identify the result with `f_{K♯}ℤ_ℓ` through the Hecke-fibre description.

Continuity of the `W_E`-action is not an extra argument either: define `T_μ` over `Spd E/φ^ℤ` and `W_E` acts as a
**condensed** group, which *in classical language* is continuity.

The second node is what that compactness buys. Against an **admissible** `ρ`, `RHom_{G_b(ℚ_p)}(RΓ_c, ρ)` is a perfect
complex; the colimit over levels is, up to shift, `i_{1*}T_{μ^∨}(Ri_{b*}[ρ])`, because `T_μ` is left adjoint to
`T_{μ^∨}`; and for admissible `ρ` one can pull Verdier duality all the way through the Hecke operator using the
duality isomorphisms of IX.2.2 with the involution `sw^*`.

The roadmap's distinction is carried in the acceptance items: a perfect invariant complex at a level is **not**
finite-dimensionality of the infinite-level cohomology, and a trace divided by an index needs that index invertible.

**Coverage: `partial`.** Compactness of the compactly supported cohomology of a local Shimura variety at pro-p level, with its continuous Weil action, and the perfectness, adjoint description and Verdier pull-through that follow. The roadmap's distinction between a perfect invariant complex at a level and finite-dimensionality of the infinite-level cohomology is carried into the nodes' acceptance items.

Remaining in this layer:

- Proposition IX.3.2 was located but not read.
- Proposition VII.7.4 (lisse compact generation), used in the proof of IX.3.1 to pass from compactness of T_mu(A) to compactness of i_b^* T_mu(A), was located but its proof was not read.
- Huber's definition of compactly supported cohomology for partially proper rigid spaces ([Hub98]) was not read; only FS's recollection of it.
- Level-change trace/pullback compatibilities and the invertibility condition on the index that the stage text requires were not located in anything read.
- The comparison with SmoothRepresentationsOfLocalGroups SR.0-SR.2 was not attempted; that is another roadmap's stage.

### `compactness-of-shtuka-cohomology` — FS IX.3.1: RGamma_c of a local Shimura variety is a compact object of D(G_b(Q_p),Z_l) at pro-p level, with continuous W_E-action

*theorem.* **Planet: Compactness of shtuka cohomology.**

**Statement.** With RGamma_c(M_{(G,b,mu),K,C},Z_l) = colim over quasicompact opens U of RGamma_c(U,Z_l), where RGamma_c(U,Z_l) = lim_m RGamma_c(U,Z/l^m Z) in Huber's sense, the complex RGamma_c(M_{(G,b,mu),K,C},Z_l) is naturally a complex of SMOOTH G_b(Q_p)-representations and, IF K IS PRO-P, a COMPACT object of D(G_b(Q_p),Z_l); the action of W_E is continuous. In particular each H^i_c is a finitely generated smooth G_b(Q_p)-representation, and by descent this holds for all K, not necessarily pro-p.

**Hypotheses that must not be dropped.**

- The compactness conclusion requires K PRO-P; for general K it is obtained by descent and only the finite generation of the individual H^i_c is stated
- The colimit over quasicompact opens U and the limit over m must be taken in that order (Huber's definition); the stage text asks for exactly this ordering
- The identification RGamma_c with f_{K sharp} Z_l up to shift rests on Proposition VII.5.2, i.e. R f_{K!} R f_K^! Z_l|_U = f_{K sharp} Z_l|_U for quasicompact U, and on the left-hand side being perfect so that it is the limit of its reductions mod l^m
- Continuity of the W_E-action is obtained by defining T_mu with values in D_solid(Bun_G x Spd E/phi^Z, Z_l) and noting that W_E then acts as a CONDENSED group; 'In classical language, this means that the action is continuous'

**Proof outline.**

1. Up to shift replace Z_l by the dualizing complex R f_K^! Z_l; by VII.5.2, R f_{K!} R f_K^! Z_l|_U = f_{K sharp} Z_l|_U for quasicompact U, and the left side is perfect so equals the limit of its mod-l^m reductions. Hence H^i_c(M_{(G,b,mu),K,C},Z_l) = H^i(f_{K sharp} Z_l) up to shift.
2. Apply T_mu to the compact object A = j_! c-Ind_K^{G(Q_p)} Z_l; by Theorem IX.2.2, T_mu(A) is compact.
3. By Proposition VII.7.4, i_b^* T_mu(A) in D_lis(Bun_G^b,Z_l) = D(G_b(Q_p),Z_l) is compact.
4. Identify this with f_{K sharp} Z_l via the fibre description.
5. For descent to E, define T_mu over Spd E/phi^Z; W_E then acts as a condensed group on i_b^* T_mu(A), i.e. continuously.

**Acceptance.**

- Check compactness fails for K not pro-p, or that only the descended statement is available there
- Check that a perfect invariant complex at a level is not the same as finite-dimensionality of the infinite-level cohomology
- Check continuity of the W_E-action in the classical sense

**Prerequisites.** `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance`, `HeckeStacksAndLocalShtukas:HS2/hecke-fibre-description`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:DerivedCategory`, `mathlib:Module.Finite`, `tauceti:TauCeti.IsSmoothDiscrete`, `tauceti:TauCeti.SmoothDiscreteTopRep`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem IX.3.1, printed p. 324.

  > The complex RGamma_c(M_{(G,b,mu),K,C}, Z_l) is naturally a complex of smooth G_b(Q_p)-representations, and, if K is pro-p, a compact object in D(G_b(Q_p), Z_l). Moreover, the action of W_E is continuous.

  Exact statement with the pro-p hypothesis isolated.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Theorem IX.3.1, printed p. 325.

  > Descending to E, note that T_mu can be defined with values in D_solid(Bun_G x Spd E/phi^Z, Z_l), and takes values in those sheaves whose pullback to Bun_{G,C} lies in D_lis(Bun_G,Z_l). Thus W_E, as a condensed group, acts on i_b^* T_mu(A) ... considered as representations on condensed Z_l-modules. In classical language, this means that the action is continuous.

  How continuity is obtained, which is the content the stage text asks to be retained.

### `admissibility-duality-and-adjunction` — FS IX.3 (after IX.3.1): perfectness against admissible representations, the adjoint description, and the Verdier pull-through

*theorem.* **Planet: Admissibility and the Hecke adjunction.**

**Statement.** For each admissible representation rho of G_b(Q_p) on a Z_l-algebra Lambda, the complex RHom_{G_b(Q_p)}(RGamma_c(M_{(G,b,mu),K,C},Z_l), rho) is a PERFECT complex of Lambda-modules. Passing to the colimit over K one obtains, on each cohomology group, an admissible G(Q_p)-representation; in fact, since T_mu is left adjoint to T_{mu^dual}, the colimit is up to shift i_{1*} T_{mu^dual}(R i_{b*}[rho]) in D_lis(Bun_G^1,Lambda) = D(G(Q_p),Lambda), so there is a natural complex of admissible G(Q_p)-representations underlying colim_K RHom_{G_b(Q_p)}(RGamma_c, rho). For rho admissible one may pull Verdier duality through: i_{1*}T_{mu^dual}(R i_{b*}[rho]) = i_{1*}T_{mu^dual}(R i_{b*} D([rho^dual])) = i_{1*}T_{mu^dual}(D(i_b^![rho^dual])) = i_{1*}D(T_{sw^* mu}(i_{b!}[rho^dual])) = D(i_{1*}T_{sw^* mu}(i_{b!}[rho^dual])).

**Hypotheses that must not be dropped.**

- rho must be ADMISSIBLE for the perfectness statement; admissibility here is in the sense of VS5, i.e. perfectness of the invariant complexes
- The adjointness used is that T_mu is LEFT adjoint to T_{mu^dual}, which comes from dualizability of V_mu in the Satake category
- The Verdier pull-through uses the duality isomorphisms of Theorem IX.2.2 with the involution sw^*
- [rho] denotes the object of D(G_b(Q_p),Lambda) = D_lis(Bun_G^b,Lambda) attached to rho, and may be a complex of smooth representations

**Proof outline.**

1. Perfectness of RHom against an admissible rho follows from compactness of RGamma_c at pro-p level (IX.3.1) and the characterisation of admissibility as perfectness of invariants.
2. Rewrite the colimit over K using the adjunction between T_mu and T_{mu^dual}.
3. Apply the duality isomorphisms of IX.2.2 successively to pull Verdier duality through the Hecke operator, using D([rho^dual]) = [rho] for admissible rho.

**Acceptance.**

- Check the perfectness statement for a single admissible rho and a fixed pro-p K
- Check the adjunction i_{1*}T_{mu^dual}(R i_{b*}[rho]) against a direct computation for GL_2
- Check that a trace divided by an index requires the index invertible in Lambda, as the stage text warns

**Prerequisites.** `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance`, `HeckeStacksAndLocalShtukas:HS3/compactness-of-shtuka-cohomology`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `VStackSheavesAndLisseCategories:VS5`, `mathlib:CategoryTheory.Adjunction`, `mathlib:Module.Finite`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, IX.3, printed p. 325.

  > In particular, for each admissible representation rho of G_b(Q_p) on a Z_l-algebra Lambda, the complex RHom_{G_b(Q_p)}(RGamma_c(M_{(G,b,mu),K,C}, Z_l), rho) is a perfect complex of Lambda-modules. Passing to the colimit over K, one obtains at least on each cohomology group an admissible G(Q_p)-representation. In fact, as T_mu is left adjoint to T_{mu^dual}, we see that this is (up to ...

  The admissibility and adjoint-description statements. The excerpt is truncated here; the full quotation is in data/decompositions/HeckeStacksAndLocalShtukas.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, IX.3, printed p. 325.

  > Assuming again that rho is admissible, one can pull through Verdier duality, i_{1*} T_{mu^dual}(R i_{b*}[rho]) = i_{1*} T_{mu^dual}(R i_{b*} D([rho^dual])) = i_{1*} T_{mu^dual}(D(i_b^![rho^dual])) = i_{1*} D(T_{sw^* mu}(i_{b!}[rho^dual])) = D(i_{1*} T_{sw^* mu}(i_{b!}[rho^dual])).

  The explicit duality computation, which is the level-change/duality compatibility the stage text asks for.

## HS4. Reusable compatibility library

**This layer is one node smaller than the decomposition, and the reason is written in
the repository rather than inferred.** Fargues–Scholze's Proposition IX.5.1 — for each compact `A` there is an open
subgroup `P` of the wild inertia, uniform in `I` and in `V`, with `T_V(A)` already `(W_E/P)^I`-equivariant — is not
planned here. The roadmap document says `ES1:finite-ramification` is *"the canonical owner of IX.5.1's uniform wild
subgroup for each compact object"* and that *"this transferred theorem is not assumed in the construction of the Hecke
family"*; RS-22 says *"uniform wild-inertia cutoff remains ES1:finite-ramification. The older decomposition node does
not reverse that current ownership."* The atlas edge runs `HS4 → ES1:finite-ramification`, in that direction. So the
statement is filed as a request carrying its full content, including the mechanism of the full-faithfulness step and
the point where `ℓ ≠ p` enters.

What remains here is two things that do not belong together, which is the packet's second structural proposal. The
first is the coherence of the Hecke family: finite-set functoriality in the strong sense — a lift to the total space of
a coCartesian fibration over the category of finite sets, **not** a compatible family of functors — together with
permutation, dual-leg creation and annihilation and the triangle identities. The second is the geometry of the isogeny,
product and Weil-restriction diagrams of IX.6.

The decomposition found a source statement for the second and **none at all** for the triangle identities: Chapter IX
was searched section by section. They are implicit in dualizability in the Satake category and in the excursion
formalism of FS VIII.4, both owned elsewhere. And IX.6 itself is about Bernstein centres, so only the geometry of its
diagrams is recorded here; the parameter conclusions belong to ES6–ES7.

**Coverage: `partial`.** The monoidal and finite-set functoriality of the Hecke family, and the geometry of the isogeny, product and Weil-restriction diagrams. This layer is one node smaller than the decomposition: Proposition IX.5.1, the uniform open wild-inertia subgroup, is not planned here, because both the roadmap document and the accepted restructuring RS-22 assign it to ExcursionOperatorsAndSpectralAction:ES1:finite-ramification. It is filed as a request with its full statement, and the packet's first gap explains the decision.

Remaining in this layer:

- The creation/annihilation of a pair of dual legs and the coevaluation/evaluation triangle identities, which the stage text and its completion contract make explicit obligations, were NOT located as statements in FS IX. They are implicit in the monoidal structure plus dualizability (VI.8.2) and in the excursion formalism of FS VIII.4, which was not read.
- FS VIII.4 (excursion operators) and Theorem VIII.4.1 were NOT read; the roadmap says the natural transformations of HS4 are the INPUT to excursion operators, so VIII.4 is the consumer, but Theorem IX.0.1's phrasing 'the categories D^P_lis(Bun_G,Lambda)^omega fit the bill of the discussion of Section VIII.4' should be checked against it.
- The second half of the proof of Proposition IX.5.1 (the construction of P) was not read.
- Propositions IX.6.4 and IX.6.5 (tori) were located but not read; Theorem IX.6.1's proof was read only in its opening.
- Iterated modification compatibility and fusion along every finite-set map were recorded only through the coCartesian-functoriality statement of Theorem IX.0.1(iii), whose proof was not read.

### `monoidal-and-finite-set-functoriality` — FS IX.0.1(ii)-(iii) and IX.2.4: the coCartesian monoidal Hecke family over finite sets

*theorem.* **Planet: Finite-set functoriality of the Hecke family.**

**Statement.** As a functor of V, the Hecke action induces an exact Rep_Lambda(Q^I)-linear MONOIDAL functor Rep_Lambda((G-hat semidirect Q)^I) -> End_Lambda(D_lis(Bun_G,Lambda)^omega)^{B W_E^I}, where the target is W_E^I-equivariant objects inside the condensed infinity-category of endofunctors with the TRIVIAL W_E^I-action. Varying I, these functors are functorial in I in the strong sense: the objects are treated as coCartesian fibrations over the category of finite sets, and the functors are required to lift to the total space of these coCartesian fibrations.

**Hypotheses that must not be dropped.**

- Functoriality in I is coCartesian-fibration functoriality, NOT merely a compatible family of functors for each I; Fargues-Scholze spell this out
- The W_E^I-action on the target End_Lambda(D_lis(Bun_G,Lambda)^omega) is the TRIVIAL one; the nontriviality is in the equivariant structure of the functor
- The monoidal structure on the source is the tensor product of representations; on the Hecke side it corresponds to convolution/fusion of kernels, so this statement consumes GS3's fusion and GS4's dual-group identification, not just GS2's convolution
- The underlying source functor Rep((G-hat semidirect Q)^I) -> D_solid(Hck^I_G,Lambda) is functorial in I because the Satake side is (FS VI.9)

**Proof outline.**

1. Assemble IX.2.4 for each I and check compatibility under maps of finite sets, using the functoriality in I of the Satake side (VI.9.2's square with pullback along W_E^J -> W_E^I, and VI.9.4's fusion functoriality).
2. Package as a lift to the total space of the coCartesian fibrations over the category of finite sets.
3. NOTE: Fargues-Scholze state this as part of Theorem IX.0.1(iii) with the explanatory paragraph; no separate proof was read.

**Acceptance.**

- Check the permutation action on a two-leg object
- Check the effect of a map I -> J, in particular the diagonal I -> {*}
- Check that pairwise compatibilities do not give the coCartesian lift

**Prerequisites.** `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance`, `GeometricSatakeAndFusion:GS3:fusion`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `VStackSheavesAndLisseCategories:VS2`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Comma`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem IX.0.1 (ii)-(iii) and the paragraph after it, printed p. 318.

  > (iii) Varying also I, the functors of (ii) are functorial in I. Here, functoriality in I means, more precisely, that one treats the preceding objects as coCartesian fibrations over the category of finite sets, and the functors are then required to lift to the total space of these coCartesian fibrations.

  The precise meaning of finite-set functoriality, which the stage text requires rather than pairwise isomorphisms.

### `isogeny-product-and-weil-restriction-diagrams` — FS IX.6.1-IX.6.3: the geometric diagrams for isogenies, products and Weil restriction

*comparison.*

**Statement.** For G' -> G inducing an isomorphism of adjoint groups, with dual map G-hat -> G'-hat and pi : Bun_{G'} -> Bun_G, the square relating Z^spec(G'-hat,Lambda) -> End(pi^* A) and Z^spec(G-hat,Lambda) -> End(A) commutes. For G = G_1 x G_2 the corresponding square relating the tensor product of the spectral and geometric Bernstein centres commutes. For G = Res_{E'|E}G' there are canonical identifications Bun_{G'} = Bun_G, Z^1(W_E,G-hat)/G-hat = Z^1(W_{E'},G'-hat)/G'-hat and Exc(W,G-hat) = Exc(W',G'-hat), where P is an open subgroup of the wild inertia of W_{E'} inside W_E and W' inside W_{E'}/P is the preimage of W inside W_E/P.

**Hypotheses that must not be dropped.**

- These statements are about the SPECTRAL and GEOMETRIC BERNSTEIN CENTRES, i.e. about parameters; the roadmap assigns the parameter identities themselves to ES6-ES7 and only the GEOMETRY of the diagrams to HS4. This node therefore records the diagrams and their geometric inputs, not the parameter conclusions
- The isogeny statement's proof is an excursion-operator diagram chase using the Hecke correspondences for G and G' and the map Hck^I_{G'} -> Hck^I_G
- The Weil-restriction statement requires the choice of an open subgroup P of the wild inertia of W_{E'}, and W' is defined as a preimage; this is the discretization apparatus of FS VIII
- The product statement is proved by 'a straightforward diagram chase, noting that everything decomposes into products'

**Proof outline.**

1. For isogenies: given an excursion datum for G', consider the two Hecke diagrams and the induced map between them, and chase.
2. For products: use Bun_{G_1 x G_2} = Bun_{G_1} x Bun_{G_2} and the decomposition of all data into products.
3. For Weil restriction: identify Bun_{G'} with Bun_G, the cocycle quotients and the excursion algebras, after choosing P.
4. NOTE: Theorem IX.6.1's proof was read only in its opening; Propositions IX.6.4 and IX.6.5 were located but not read.

**Acceptance.**

- Check the isogeny diagram for SL_n -> GL_n
- Check the product statement for G_1 = G_2 = GL_1
- Check the Weil-restriction identification of excursion algebras

**Prerequisites.** `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `BunGAndNewtonStrata:BG2:uniformization`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, `tauceti:TauCeti.ClosedSubgroupScheme`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem IX.6.1, printed p. 330.

  > Let G' -> G be a map of reductive groups inducing an isomorphism of adjoint groups, inducing a dual map G-hat -> G'-hat, and pi : Bun_{G'} -> Bun_G. Then for any A in D_lis(Bun_G,Lambda) the diagram [Z^spec(G'-hat,Lambda) -> End(pi^* A) ; Z^spec(G-hat,Lambda) -> End(A)] commutes.

  The isogeny compatibility; the geometric content is the comparison of the two Hecke correspondences.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition IX.6.2, printed p. 331.

  > If G = G_1 x G_2 is a product of two groups, then the diagram [Z^spec(G_1,Lambda) tensor_Lambda Z^spec(G_2,Lambda) -> Z^geom(G_1,Lambda) tensor_Lambda Z^geom(G_1,Lambda) ; Z^spec(G,Lambda) -> Z^geom(G,Lambda)] commutes. In particular, if Lambda = L is an algebraically closed field and A_1, A_2 in D_lis(Bun_G,L) are Schur-irreducible, and A is a Schur-irreducible constituent of A_1 box ...

  The products clause of the node statement, which previously had no source entry. Note the source's own display repeats Z^geom(G_1,Lambda) twice where the second factor should be Z^geom(G_2,Lambda); reproduced here as printed. The excerpt is truncated here; the full quotation is in data/decompositions/HeckeStacksAndLocalShtukas.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition IX.6.3, printed p. 331.

  > Choose P to be an open subgroup of the wild inertia of W_{E'} in W_E, and let W' in W_{E'}/P be the preimage of W in W_E/P. Then there are canonical identifications Bun_{G'} = Bun_G, Z^1(W_E,G-hat)/G-hat = Z^1(W_{E'},G'-hat)/G'-hat and Exc(W,G-hat) = Exc(W',G'-hat).

  The Weil-restriction identifications, including the discretization data they depend on.

## Requests to other roadmaps

This roadmap sits on top of six others. Each request names the supplier stage and what exactly is needed.

- **`RelativeFarguesFontaine:RF2:integral-divisors`** — Integral divisors on the relative Fargues-Fontaine curve. The legs of the Hecke correspondence are the degree-one divisors of this layer, and (Div^1)^I is the base of the whole construction.
- **`RelativeFarguesFontaine:RF2:untilts`** — Untilts and the identification of Div^1 with Spd E/phi^Z. The S_i^sharp of the shtuka datum are untilts, and the descent of T_mu to the reflex field is phrased over Spd E/phi^Z.
- **`RelativeFarguesFontaine:RF4:G-torsors`** — G-torsors on the curve and their modifications by patching. Both projections of the Hecke correspondence land in categories of G-torsors, and the shtuka moduli parametrises a G-torsor on S x-dot Spa Z_p.
- **`BunGAndNewtonStrata:BG2:uniformization`** — Bun_G with its uniformization. The Hecke correspondence has Bun_G at both ends, and the isogeny and Weil-restriction diagrams of HS4 rest on the identifications Bun_{G'} = Bun_G and Bun_{G_1 x G_2} = Bun_{G_1} x Bun_{G_2}.
- **`BunGAndNewtonStrata:BG3`** — The basic and nonbasic strata with the groups G_b(E) and J_b(E). The shtuka moduli is a fibre over a pair of bundles E_b, E_{b'}, and the two commuting group actions the stage's completion contract asks for are the automorphism groups of those bundles.
- **`GeometricSatakeAndFusion:GS0:loop-geometry`** — The loop group and the local Hecke stack Hck_{G,Div^d}, of which the global Hecke stack is the pullback along the leg map. Neither the loop group nor the affine Grassmannian exists in either pinned library, so this is a genuine dependency and not a citation.
- **`GeometricSatakeAndFusion:GS0:Schubert-smoothness`** — Smoothness of the Schubert cells and the Demazure resolutions in the AFFINE FLAG variety. The generation statement HS0 uses names Demazure resolutions modulo an Iwahori, so the affine flag variety and not only the affine Grassmannian is needed.
- **`GeometricSatakeAndFusion:GS0:Witt-geometry`** — The Witt-vector geometry and the bounded loci Gr_{G,Div^d,<=mu} -> Div^d with their properness, representability in spatial diamonds and finite dim.trg. The roadmap asks for the exact statement, since the global source and target maps are not representable merely because the fibres are.
- **`GeometricSatakeAndFusion:GS2:Satake-closure`** — The Satake category and its closure under convolution, the source of the kernel S_V.
- **`GeometricSatakeAndFusion:GS3:fusion`** — Fusion and the collision of legs, which is what makes the Hecke family monoidal across finite sets rather than one functor per leg set. RS-22 adds this as a supplier of HS4.
- **`GeometricSatakeAndFusion:GS4:integral-dual-group`** — The integral dual group with the sqrt(q) normalisation and the geometric Satake equivalence Rep((G-hat semidirect Q)^I) -> Sat(Hck^I_G). The roadmap says this requires completed GS4 and not merely GS2's convolution.
- **`VStackSheavesAndLisseCategories:VS1`** — Drinfeld's lemma, in the form of Corollary IV.7.2 and Proposition IV.7.3, which identifies the target of the Hecke operator with W_E^I-equivariant objects. RS-22 records this as an imported input and says that constructing the action on the actual Hecke kernels is HS1's own work; the decomposition records FS IV.7 as unread.
- **`VStackSheavesAndLisseCategories:VS2`** — The solid categories with the relative-homology functor f_sharp and the solid convolution, and in particular Propositions VII.4.3 and VII.5.2, which the Hecke construction uses twice and which the decomposition records as unread.
- **`VStackSheavesAndLisseCategories:VS3`** — D_lis with its coefficient convention Lambda = Z_l tensor_{Z_l,disc} Lambda_disc, its tensor and pullback stability and its right adjoint. Every statement of HS1 is about preservation of this category.
- **`VStackSheavesAndLisseCategories:VS4`** — Compact generation of D_lis(Bun_G,Lambda) by the compact inductions, and the identification of a stratum's category with smooth representations. The compactness theorem of HS3 applies T_mu to one of these generators and reads the answer off on a stratum.
- **`VStackSheavesAndLisseCategories:VS5`** — The characterisation of universally locally acyclic objects as those with perfect RHom against every compact object, in the lisse form of Proposition VII.7.9. Theorem IX.2.2 deduces ULA-preservation from it by adjointness. The atlas currently has an edge from VS5 into HS3 but none into HS1, where the statement is actually consumed.
- **`EnhancedDerivedSheaves:E5:abstract`** — The monoidal stable infinity-categorical baseline. The monoidal structure on the kernel category is asserted on the infinity-category, and finite-set functoriality is a lift to the total space of a coCartesian fibration; both are statements in this layer's language.
- **`SmoothRepresentationsOfLocalGroups:SR.0`** — The abelian category of smooth representations of a locally profinite group and its derived category. The shtuka cohomology is asserted to be a complex of smooth G_b(Q_p)-representations, and D(G_b(Q_p),Z_l) is where compactness is asserted.
- **`SmoothRepresentationsOfLocalGroups:SR.1`** — Hecke algebras over rings, needed for the level-change trace and pullback maps of HS3 and for the warning that a trace divided by an index requires the index invertible in the coefficients.
- **`SmoothRepresentationsOfLocalGroups:SR.2`** — Compact induction c-Ind_K^{G(Q_p)} and its adjunctions. The object to which T_mu is applied in the proof of Theorem IX.3.1 is j_! c-Ind_K^{G(Q_p)} Z_l, and compactness in D(G_b(Q_p),Z_l) is membership in the thick subcategory generated by these.
- **`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification`** — Proposition IX.5.1 of Fargues-Scholze: for every compact object A of D_lis(Bun_G,Lambda) there is an OPEN SUBGROUP P of the WILD INERTIA of W_E such that for all finite sets I and all V in Rep((G-hat semidirect Q)^I), the object T_V(A) lies in D_lis(Bun_G,Lambda)^{B(W_E/P)^I}; consequently D_lis(Bun_G,Lambda)^omega is an increasing union of stable subcategories on which the Hecke action factors through (W_E/P)^I. P depends on A but is uniform in I and in V, and that uniformity is the whole content. The full-faithfulness step is f_sharp Lambda = Lambda for [*/W_E^I] -> [*/(W_E/P)^I], which after pullback to a v-cover amounts to the vanishing of the Lambda-homology of P^I and uses that P is pro-p and l != p. This roadmap's own document names this layer 'the canonical owner of IX.5.1's uniform wild subgroup for each compact object' and adds that 'this transferred theorem is not assumed in the construction of the Hecke family'; the accepted restructuring RS-22 repeats it. The node is therefore requested here and not planned, and HS4 exports to it the continuous Weil actions and the tensor-generator compatibility it needs.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`** — The local Weil group W_E with its Weil topology, from the existing Tau Ceti roadmap. RS-22 adds this import to HS1 and says that a global Galois product action is not what this consumer needs. Neither pinned library contains a Weil group: a search of the pinned declaration index found no declaration whose name contains WeilGroup in either Mathlib or Tau Ceti, so W_E is a genuine dependency. It is requested rather than used as a prerequisite, because the packet checker parses a tauceti: identifier as a baseline declaration.

## Gaps

### Proposition IX.5.1 is not planned here: the roadmap and RS-22 both assign it to ES1:finite-ramification

The reviewed decomposition carries a node HeckeStacksAndLocalShtukas:HS4/uniform-wild-subgroup for Fargues-Scholze Proposition IX.5.1. This packet does not keep it, and the decision rests on two independent statements in the repository rather than on a judgement of the mathematics. First, the roadmap document itself, in the HS4 stage text, says: 'Export continuous Weil actions and tensor-generator compatibility to ES1:finite-ramification, the canonical owner of IX.5.1's uniform wild subgroup for each compact object. This transferred theorem is not assumed in the construction of the Hecke family.' Second, the accepted restructuring RS-22 (review REV-RS-22, accepted 23 September 2026) gives as its reason for keeping HS4: 'Import the same HS1 kernels and Satake fusion; parameter identities remain ES6/ES7 and uniform wild-inertia cutoff remains ES1:finite-ramification. The older decomposition node does not reverse that current ownership.' The atlas agrees: there is a stage edge HeckeStacksAndLocalShtukas:HS4 -> ExcursionOperatorsAndSpectralAction:ES1:finite-ramification, in that direction. PROTOCOL section 15 says what another roadmap plans is imported and never planned again, so the statement is filed as a request with its full content, including the mechanism of the full-faithfulness step and the point at which l != p is used, and nothing is lost. A reviewer who disagrees should note that reinstating the node would duplicate ES1:finite-ramification, not that the statement has been dropped from the record. The decomposition's own note that only the statement and the first half of the proof were read still stands and is repeated in the request.

### FS VII.4 and VII.5 are unread but carry the Hecke construction

Two results from the unread Chapter VII are load-bearing here. (a) Proposition VII.4.3, invoked in the proof of Proposition IX.2.1 to pass from the Demazure generators to preservation of D_lis. (b) Proposition VII.5.2, invoked twice: 'we have thus essentially used the translation of Proposition VII.5.2 to extend the Hecke operators from the case of torsion rings Lambda to all Lambda' (printed p. 322), and in the proof of Theorem IX.3.1 in the form R f_{K!} R f_K^! Z_l|_U = f_{K sharp} Z_l|_U (printed p. 324). Neither was read. NEXT SOURCE ACTION: read FS printed pp. 261-268 (VII.4-VII.5). This gap is shared with the VStackSheavesAndLisseCategories packet of this job, where it is recorded for stage VS2.

### Drinfeld's lemma (FS IV.7) is unread but supplies the Weil action

The target of the Hecke operator is identified with W_E^I-equivariant objects via Corollary IV.7.2 ('By Corollary IV.7.2, the target has D_et(Bun_G x [*/W_E^I],Lambda) as a full subcategory, and we will see below that T_V will factor over this subcategory', printed p. 317) and via Proposition IV.7.3 for the Satake side (FS VI.9.2). Section IV.7 was NOT opened. The stage text explicitly asks to 'Construct the continuous W_E^I action through Drinfeld's lemma', and warns that 'a discrete abstract action without continuity is insufficient for parameter stacks'. NEXT SOURCE ACTION: read FS printed pp. 164-166. This gap is shared with the GeometricSatakeAndFusion and VStackSheavesAndLisseCategories packets of this job.

### Berkeley Lectures 23.2-23.5 and Lecture 24 are unread, so HS2 rests on a statement

Definition 23.1.1 (with its full data list and boundedness condition), Remarks 23.1.2-23.1.3 and the statement of Theorem 23.1.4 were read (printed pp. 216-217). The PROOF of Theorem 23.1.4 (sections 23.2 'the case of no legs', 23.3 'the case of one leg' with Corollary 23.3.2, and the remaining sections) was not, nor was Lecture 24, which constructs the local Shimura tower (M_{(G,b,mu),K}) that FS IX.3 identifies with a Hecke fibre. The roadmap names 'Berkeley sections 23.1-23.5 (bounded local shtukas and legs), sections 24.1-24.3 (local Shimura and EL/PEL comparisons), and section 19.5.1 (torsor description)' as the source route. NEXT SOURCE ACTION: read Berkeley printed pp. 217-235 (Lectures 23-24). VERIFIED PRESENT in the library: references/papers/ScholzeWeinstein_Berkeley.pdf, sha256 225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc.

### The creation/annihilation and triangle identities of HS4 have no located source statement

The HS4 stage text asks to 'Prove permutation, creation/annihilation of a pair of dual legs, coevaluation/evaluation identities, iterated modification compatibility and fusion along every finite-set map', and its completion contract says 'Creation and annihilation come with the two triangle identities and Weil continuity'. Chapter IX of Fargues-Scholze was searched section by section (IX.1-IX.7 statement list inspected); no proposition stating the triangle identities was found. They are implicit in (a) dualizability of V in the Satake category (VI.8.2, decomposed in the GeometricSatakeAndFusion packet), (b) the monoidal functoriality of IX.2.4, and (c) the excursion formalism of FS VIII.4, which was NOT read. NEXT SOURCE ACTION: read FS printed pp. 290-293 (VIII.4, Theorem VIII.4.1 and the definition of the excursion algebra) and check whether the triangle identities are stated there or have to be supplied. Recorded as an unresolved boundary, not as an input package.

### IX.6 is about Bernstein centres, so only part of it belongs to HS4

The HS4 stage text says: 'Group-map and Levi compatibility compares these exact Satake kernels; only the geometry of IX.6's diagrams belongs here. The parameter identities themselves are ES6-ES7.' Reading IX.6 confirms this reading of the source: Theorem IX.6.1, Propositions IX.6.2 and IX.6.3 are stated as commuting squares of SPECTRAL and GEOMETRIC BERNSTEIN CENTRES, with the parameter conclusions ('φ_{A'} is the composite of φ_A with G-hat -> G'-hat') drawn as corollaries. This packet records the diagrams and the geometric identifications (Bun_{G'} = Bun_G for Weil restriction; the product decomposition) and does NOT record the parameter conclusions, which belong to ExcursionOperatorsAndSpectralAction (EXT-04's roadmap). CROSS-JOB NOTE for the reviewer: if EXT-04 decomposes IX.6 for ES6/ES7, the geometric half recorded here should not be duplicated there.

### Neither pinned library has a Weil group, a loop group, an affine Grassmannian, a perfectoid space or a shtuka

data/library-coverage.json has no reviewed audit entry for this roadmap, so the pinned declaration index was searched directly at Mathlib 082e2d3 and Tau Ceti f790474. Absent from both: any declaration whose name contains WeilGroup, LoopGroup, Shtuka, Perfectoid, or an affine Grassmannian (the only Grassmannian is Module.Grassmannian, the linear-algebra one). So the geometric objects of this roadmap are genuine dependencies on other roadmaps and are requested, not cited. Present and cited instead: mathlib:WittVector and mathlib:WittVector.Isocrystal, which give W(k)[1/p] and, for GL_n, exactly the datum b of the shtuka triple; mathlib:CoxeterSystem and tauceti:TauCeti.TitsSystem.bruhatCell for the Bruhat order in which the boundedness condition is stated; tauceti:TauCeti.ReductiveAffineGroupSchemeCat and tauceti:TauCeti.AffineGroupSchemeCat for the groups; tauceti:TauCeti.Huber.Pair and tauceti:TauCeti.ValuationSpectrum.spa for the affinoid test objects; and tauceti:TauCeti.IsSmoothDiscrete with tauceti:TauCeti.SmoothDiscreteTopRep, which are the pinned smooth-representation carriers HS3's conclusion has to be compared with. A reviewer should check that no node plans any of the present ones.

### One supplier edge the atlas does not have: VS5 into HS1

Theorem IX.2.2 deduces preservation of universally locally acyclic objects from preservation of compact objects by adjointness, using Proposition VII.7.9, the characterisation of ULA objects as those whose RHom against every compact object is perfect. That statement is the lisse form of Fargues-Scholze V.7.1, which the VStackSheavesAndLisseCategories packet plans in stage VS5. The stage edges of data/atlas.json give VStackSheavesAndLisseCategories:VS5 -> HeckeStacksAndLocalShtukas:HS3 but no edge into HS1, where the statement is actually consumed; RS-22 adds no such edge either. It is filed as a request in this packet, but a kind:link job should add the edge, since a request is a note and an edge is what the atlas draws.

## Structural entries

### RS-22's new title is adopted: the curve in HS0 is the Fargues-Fontaine curve (`retitle-roadmap`)

The accepted restructuring RS-22 gives this roadmap the title 'Hecke correspondences on the Fargues-Fontaine curve and local shtuka cohomology', with the reason 'Clarify which curve global in HS0 means. Own the local-field/Fargues-Fontaine constructions in both characteristics, with their solid/lisse coefficient and local Weil interfaces. No global function-field Langlands prerequisite is introduced.' The packet is written under that title and the word global is used only for the leg set and never for a global function field; GlobalShtukasAndFunctionFieldLanglands, the other member of the family, is neither a base nor a supplier here and is not requested. This entry records the adoption so that a reviewer can see the title change was applied and not merely noted.

### HS4 is two different things and the half that has no source statement should be separated (`split-layer`)

HS4 as written contains two unrelated obligations. The first is the coherence of the Hecke family: permutation, creation and annihilation of a pair of dual legs with the two triangle identities, iterated modification and fusion along every map of finite sets. The second is the geometry of the isogeny, product and Weil-restriction diagrams of FS IX.6. The decomposition found a source statement for the second, in Theorem IX.6.1 and Propositions IX.6.2 and IX.6.3, and none at all for the triangle identities: Chapter IX was searched section by section and no proposition stating them was located. They are implicit in dualizability in the Satake category (VI.8.2, which GeometricSatakeAndFusion owns) and in the excursion formalism of FS VIII.4 (which ExcursionOperatorsAndSpectralAction owns), and the source route for them therefore runs outside this roadmap. Separating the coherence obligations from the IX.6 diagrams would let the second half be finished on the source that exists, and would make visible that the first half is waiting on a section of the source nobody in this family has read. With IX.5.1 now correctly assigned to ES1:finite-ramification, HS4 as it stands has one node with a source and one obligation without one.

## Planets

At most six per layer; only definitions, constructions and named theorems.

| layer | planets |
| --- | --- |
| `HS0` | The global Hecke correspondence |
| `HS1` | The Satake kernel S_V; The Hecke operator T_V; T_V preserves compact and ULA objects; The condensed enrichment of D_lis |
| `HS2` | Moduli of local G-shtukas |
| `HS3` | Compactness of shtuka cohomology; Admissibility and the Hecke adjunction |
| `HS4` | Finite-set functoriality of the Hecke family |

## Nothing here is formalised

No Lean was compiled for this job and no statement in this packet is claimed to be formalised. The suggested file
is a set of signatures whose only proof is `sorry`; every `implementationStatus` is `unchecked`.
