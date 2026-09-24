# Artin v-stacks, solid and lisse coefficient categories

Blueprint for the roadmap `VStackSheavesAndLisseCategories`, job `BP-VStackSheavesAndLisseCategories`
(issue #1001). Packet: `research/blueprint/packets/VStackSheavesAndLisseCategories.json`. Suggested Lean
file: `research/blueprint/suggested/VStackSheavesAndLisseCategories.lean`. Handoff:
`research/blueprint/handoff/BP-VStackSheavesAndLisseCategories.md`.

**Status: partial.** All six layers in scope are decomposed, none is closed: every one carries a precise
`remaining` list, because whole sections of both sources were never opened. The packet has 21 nodes
(5 definitions, 2 constructions, 11 theorems, 2 lemmas, one comparison), 45 API items, 28 unit tests and
18 planets; it cites 29 declarations of the pinned libraries, records 7 gaps, makes 23 requests to other
roadmaps and makes 2 structural proposals.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources

Both sources are author-hosted and freely available, and **both were downloaded again in this session and
their SHA-256 hashes reproduce the recorded values byte for byte.** Every locator in this packet therefore
rests on the same two files the independent review of the decomposition checked.

- **`FS-geometrization`** — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*. Author-hosted 356-page PDF (MPIM Bonn), inspected 2026-09-15; corresponds to arXiv:2102.13459v4 by metadata and contents, not by byte comparison. PDF page = printed page.
  <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>, read 2026-09-16.
  SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` — reproduced 24 September 2026.
- **`Scholze-condensed`** — Peter Scholze (notes by Scholze; joint work with Dustin Clausen), *Lectures on Condensed Mathematics*. Lecture notes PDF, 78 pages + front matter; library copy inspected 2026-09-15. Printed page = PDF page.
  <https://people.mpim-bonn.mpg.de/scholze/Condensed.pdf>, read 2026-09-16.
  SHA-256 `d422561285f3025a53ee71a497d350fc89afaefe28053de78e2255b2d521c69d` — reproduced 24 September 2026.

## What this packet is, and what it rests on

This roadmap already had a **reviewed integrated decomposition** of Fargues–Scholze's *Geometrization of the
local Langlands correspondence* together with Definition 5.1 and Theorem 5.8 of Scholze's *Lectures on
Condensed Mathematics*. This packet keeps all 21 node identifiers with their statements, hypotheses, proof
steps, acceptance items and verified locators, and adds: prerequisites resolved to the pinned libraries or
to a named supplier stage, planets, a coverage record per layer, and an API outline with unit tests for each
of the five definitions and two constructions.

**The accepted restructuring RS-05 applies to this roadmap** (review `REV-RS-05`, accepted 23 September
2026). It keeps VS0, VS1, VS2, VS3 and VS5 and **narrows VS4**. Its dispositions are followed here:

| layer | RS-05 | what this packet does |
| --- | --- | --- |
| VS0 | keep | suppliers `DiamondsAndVStacks:D4`, `DiamondSixOperations:S3`, `S4` requested and used as prerequisites |
| VS1 | keep | ULA formalism planned; IV.3, IV.6, IV.7 unread and recorded, not invented |
| VS2 | keep | supplier `EnhancedDerivedSheaves:E3` requested; pinned condensed carriers reused, general-ring predicate corrected |
| VS3 | keep | point comparison is with the derived **discrete** module category, and `D_■` of a point is not that category |
| VS4 | **narrow** | smooth carrier, derived extension and compact induction imported from `SR.0:abelian-category`, `SR.0:derived-extension`, `SR.2`; only the geometry planned here |
| VS5 | keep | same three `SR` suppliers requested; `Bun_G` smoothness recorded as a proved prerequisite |

### What the pinned libraries already have, and is therefore not planned

The library audit `data/library-coverage.json` has **no reviewed entry for this roadmap**, so the pinned
declaration index was searched directly. The findings that changed the plan:

- `Mathlib/Condensed/Solid.lean` has `Condensed.profiniteFree`, `Condensed.profiniteSolid`,
  `Condensed.profiniteSolidCounit`, `Condensed.profiniteSolidIsPointwiseRightKanExtension`,
  `Condensed.profiniteSolidification` and `CondensedMod.IsSolid`. The **free solid module on a profinite set**
  and the **solidity predicate over `ℤ`** are therefore not planned. The file's own docstring says the
  predicate is *not* the correct definition for a general ring and prescribes the finite-type `ℤ`-algebra
  route; two further TODOs record that `((profiniteSolid ℤ).obj S).IsSolid` is unproved, so the predicate has
  no proved nonempty instance at the pinned commit. VS2 owns that correction and that proposition.
- `Condensed`, `CondensedSet`, `CondensedMod`, `Profinite` and `CompHaus` are all pinned; the condensed
  formalism is cited, never rebuilt.
- Tau Ceti has `TauCeti.IsSmoothDiscrete` and `TauCeti.SmoothDiscreteTopRep`. RS-05's note on VS4 says the
  pinned smooth-discrete continuity already exists **and is not the `Bun_G` equivalence**; both are cited as
  baseline on the classifying-stack node for exactly that reason.
- Tau Ceti has `TauCeti.Huber.Pair` and `TauCeti.ValuationSpectrum.spa`, so the strict localizations
  `X_x = Spa(C(x),C(x)^+)` through which local acyclicity is defined have a pinned carrier.
- **Not found at the pins:** `CategoryTheory.Site` as such, `CategoryTheory.Presheaf`,
  `CategoryTheory.Limits.HasColimits`, `CategoryTheory.Limits.IsFiltered`, `CategoryTheory.Presentable`,
  `Condensed.Abelian`. Nothing in this packet cites them.

### What is deliberately absent

Fargues–Scholze IV.3, the body of IV.4, IV.6, IV.7, V.3 and VII.2–VII.5, and the proof of Theorem 5.8 in
Lecture VI of the condensed notes, were **not read** by the decomposition. No node is invented for them.
They are carried as gaps with a *next source action* naming the exact printed pages to read, and the
properties of `f_♯` quoted in VS2 are marked in the node's unit tests as taken from the chapter summary
rather than from a proof. The `Bun_G`-side inputs — Theorem IV.1.19, Propositions IV.1.22 and III.5.1 — are
stage content of `BunGAndNewtonStrata` and are requested, not re-planned.

## VS0. Artin v-stacks and eligible operations

An **Artin v-stack** is a small v-stack whose diagonal is representable in locally
spatial diamonds and which admits a separated, cohomologically smooth surjection from a locally spatial diamond.
Two things about that definition have to survive any restatement. Separatedness of the atlas is there only
because cohomological smoothness has been defined for separated maps; Fargues–Scholze call it an *unwanted very
mild* condition. And `X` itself is **not** required to be quasiseparated — `Bun_G` is not, and already `[*/G(E)]`
is not, since `G(E)` is not quasicompact. A definition that imports the classical Artin-stack convention here
excludes the object the whole roadmap exists for.

The layer then extends the operations exactly as far as the source does and no further. `Rf^!` is constructed
**only** for cohomologically smooth maps of Artin v-stacks, by descending the representable `Rg^!` along charts;
the compatibility `Rg^!(Rf^!Λ) = R(f∘g)^!Λ` is asserted only for `V` a locally spatial diamond and `g` separated
cohomologically smooth, and Remark IV.1.14 says in as many words that it is *not clear* in general. Fargues–Scholze
also say explicitly that they will not give a six-functor formalism with `Rf_!` and `Rf^!` for stacky maps. The
`Rf_!` that does appear here is the left adjoint of this `Rf^!` and is not the ordinary ECD `Rπ_!`.

The layer's fourth node is Theorem IV.5.3, the vanishing of partially compactly supported cohomology towards one
end. It is the technical engine of the last two layers: it is what makes `M̃_b` behave like a strictly local
scheme (VS4) and it is invoked a second time in the involutivity of Bernstein–Zelevinsky duality (VS5).

**Coverage: `partial`.** Artin v-stacks by representable diagonal and separated cohomologically smooth atlas, their stability under fibre products and representable maps, the shriek pullback and dualizing complex for cohomologically smooth stacky maps, and the partial-support vanishing theorem IV.5.3 that both VS4 and VS5 consume. The accepted restructuring RS-05 keeps this layer and names DiamondsAndVStacks:D4, DiamondSixOperations:S3 and DiamondSixOperations:S4 as its canonical suppliers; those three are filed as requests here and appear as prerequisites of the nodes that use them.

Remaining in this layer:

- Atlas independence and the extension of the ALLOWED OPERATIONS (pullback, exceptional pullback and their normalisation for smooth atlases) were read only through Definitions IV.1.11-IV.1.17; the comparison with the existing small-v-stack ECD categories was not located.
- Smooth-lisse descent of the enhanced coefficient category, which the stage text requires, is not in Chapter IV; the corresponding descent statement is used implicitly and belongs to EnhancedDerivedSheaves.
- Adjunctions and base-change formulas for the partial compact-support functors Rbeta_{!+}, Rbeta_{!-} (beyond the vanishing theorem IV.5.3) were not found in the passages read; only the construction and the vanishing were read.
- ECD Propositions 13.2, 13.4, 11.10, 11.20, 23.12, 23.13, 23.15, 24.2, 14.15, 17.3, 17.6, 19.2, 22.11, 20.13 are all imported and none was read.

### `artin-v-stack-definition` — FS IV.1.1: Artin v-stacks by representable diagonal and a separated cohomologically smooth atlas

*definition.* **Planet: Artin v-stack.**

**Statement.** An Artin v-stack is a small v-stack X such that the diagonal Delta_X : X -> X x X is representable in locally spatial diamonds, and such that there exists a surjective map f : U -> X from a locally spatial diamond U that is separated and cohomologically smooth. Separatedness of f forces Delta_X to be quasiseparated. The relative notion over a base S with representable diagonal agrees with the absolute one.

**Hypotheses that must not be dropped.**

- Separatedness of the atlas f is imposed BECAUSE cohomological smoothness has only been defined for separated maps; Fargues-Scholze call this an 'unwanted very mild separatedness condition'
- Quasiseparatedness of X itself is NOT required and would be far too strong: Bun_G is not quasiseparated, and already [*/G(E)] is not, since G(E) is not quasicompact
- If one only has an atlas that is surjective as a map of V-STACKS (rather than of pro-etale stacks), then representability of Delta_X in diamonds still has to be proved separately; it may be checked after pullback along a map V -> X x X that is surjective as a map of pro-etale stacks
- The relative/absolute comparison (Remark IV.1.6) needs Delta_S to be representable in locally spatial diamonds

**Proof outline.**

1. Fargues-Scholze give the definition and then derive quasiseparatedness of Delta_X: taking U a disjoint union of spatial diamonds, U x_X U -> U is separated so U x_X U is quasiseparated, and this is the pullback of Delta_X along the surjection U x U -> X x X.
2. Remark IV.1.4 records the converse criteria: quasiseparatedness of Delta_X from a quasiseparated U; reduction of representability in locally spatial diamonds to representability in diamonds via ECD Prop. 13.4(v); and the permission to check the latter after a pro-etale-surjective pullback via ECD Prop. 13.2(iii).
3. Remark IV.1.5 records that surjectivity of a separated, representable, cohomologically smooth map may be checked on geometric points, since cohomologically smooth morphisms are open.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `IsArtinVStack` | data | The predicate on a small v-stack X: the diagonal X -> X x X is representable in locally spatial diamonds, and there is a separated cohomologically smooth surjection from a locally spatial diamond. |
| `IsArtinVStack.diagonal` | structure | The first half of the definition, representability of the diagonal in locally spatial diamonds; Fargues-Scholze derive quasiseparatedness of the diagonal from it together with a separated atlas. |
| `IsArtinVStack.atlas` | data | A chart: a separated, cohomologically smooth surjection from a locally spatial diamond. Separatedness is imposed only because cohomological smoothness has been defined for separated maps. |
| `IsArtinVStack.of_locallySpatialDiamond` | constructor | A locally spatial diamond is an Artin v-stack, with the identity as chart (Example IV.1.7). |
| `IsArtinVStack.not_quasiseparated` | example | The class does not require quasiseparatedness of X: [*/G(E)] and Bun_G are Artin v-stacks and are not quasiseparated. |
| `IsArtinVStack.diagonal_of_vSurjection` | characterisation | If the chart is surjective only as a map of v-stacks, representability of the diagonal has to be checked separately, and may be checked after pullback along a pro-etale surjection (Remark IV.1.4). |

Derived from where the object is used:

- in `VStackSheavesAndLisseCategories:VS0/stability-under-fibre-products-and-representable-maps` — the stability statement is about this class, and its proof consumes representability of the diagonal of the middle factor
- in `VStackSheavesAndLisseCategories:VS0/shriek-pullback-for-smooth-stacky-maps` — the shriek pullback is constructed for cohomologically smooth maps of objects of this class
- in `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks` — universal local acyclicity is defined for maps of these by descent along a chart
- in `VStackSheavesAndLisseCategories:VS3/lisse-category-definition` — D_lis is defined for an Artin v-stack, and Fargues-Scholze say that for a general small v-stack there might be very few objects

**Unit tests.** A plausible wrong definition fails one of these.

- `locally_spatial_diamond_is_artin` — A locally spatial diamond is an Artin v-stack, with the identity as chart.
- `classifying_stack_of_a_locally_profinite_group` — For a locally profinite group with a closed embedding into GL_n(E) the classifying stack [*/G] is an Artin v-stack (Example IV.1.9 (iv)); this is the example VS4 computes with.
- `quasiseparatedness_is_not_required` — [*/G(E)] is an Artin v-stack and is not quasiseparated, since G(E) is not quasicompact; a definition that demands quasiseparatedness excludes Bun_G and is wrong.
- `diagonal_is_not_implied_by_a_chart` — Representability of the diagonal is a separate condition and does not follow from the existence of a chart; dropping it breaks the fibre-product stability proof, which uses representability of the diagonal of the middle factor.

**Acceptance.**

- Check that [*/G(E)] is an Artin v-stack but not quasiseparated
- Check that a locally spatial diamond is an Artin v-stack (Example IV.1.7)
- Check atlas independence: two different separated cohomologically smooth atlases of Bun_G give the same notion

**Prerequisites.** `DiamondsAndVStacks:D4`, `DiamondsAndVStacks:D6`, `DiamondSixOperations:S4`, `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.GrothendieckTopology`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.Huber.Pair`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition IV.1.1, printed p. 107.

  > An Artin v-stack is a small v-stack X such that the diagonal Delta_X : X -> X x X is representable in locally spatial diamonds, and there is some surjective map f : U -> X from a locally spatial diamond U such that f is separated and cohomologically smooth.

  Verbatim definition.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Remark IV.1.2, printed p. 107.

  > We are making the assumption that f is separated, because only in this case we have defined cohomological smoothness. This means that we are imposing some (probably unwanted) very mild separatedness conditions on Artin v-stacks.

  Records exactly why separatedness appears, so that it is not silently dropped.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Remark IV.1.3, printed p. 108.

  > The stack Bun_G is not quasiseparated. In fact, [*/G(E)] is already not quasiseparated since the sheaf of automorphisms of the trivial G-bundle, G(E), is not quasicompact.

  Records the scope limit that distinguishes this from the classical Artin-stack convention.

### `stability-under-fibre-products-and-representable-maps` — FS IV.1.8: fibre products, base-point change and representable maps preserve Artin v-stacks

*lemma.*

**Statement.** (i) Any fibre product of Artin v-stacks is an Artin v-stack. (ii) If S -> * is pro-etale surjective, representable in locally spatial diamonds, separated and cohomologically smooth, then X is an Artin v-stack if and only if X x S is. (iii) If X is an Artin v-stack and f : Y -> X is representable in locally spatial diamonds, then Y is an Artin v-stack.

**Hypotheses that must not be dropped.**

- In (i) one needs the atlases f_i : U_i -> X_i to be separated, REPRESENTABLE IN LOCALLY SPATIAL DIAMONDS and cohomologically smooth surjections, and one uses that Delta_{X_2} is representable in locally spatial diamonds to know that the assembled U is a locally spatial diamond
- In (ii) the hypotheses on S -> * are all used; the conclusion licenses replacing the base point * by Spd E or Spa F_q((t^{1/p^infty}))
- In (iii) one uses ECD Proposition 11.10 (a 0-truncated injective map is representable in diamonds) for the first factor of Delta_Y = (Y -> Y x_X Y -> Y x_k Y)

**Proof outline.**

1. (i) Build U = (U_1 x_{X_2} U_2) x_{U_2} (U_2 x_{X_2} U_3); it is a locally spatial diamond and the projection to X is a separated, representable, cohomologically smooth surjection. For the diagonal, Delta_{X_2} x Delta_{X_3} is representable, its pullback u : X_2 x_{X_1} X_3 -> X_2 x X_3 is representable since Delta_{X_1} is, and Delta_{X_2 x_{X_1} X_3} is a map between objects representable over (X_2 x X_3) x (X_2 x X_3).
2. (ii) Compose the atlas of X x S with the projection to X; for the diagonal use Remark IV.1.4 and the fact that S x S -> S is representable in locally spatial diamonds.
3. (iii) Take V = U x_X Y; factor Delta_Y as Y -> Y x_X Y -> Y x_k Y, the first map being 0-truncated and injective (ECD Prop. 11.10) and the second a pullback of Delta_X.

**Acceptance.**

- Check (iii) on a locally closed substack of Bun_G, which is how Example IV.1.9(iii) is obtained
- Check (ii) by verifying the Artin property of [*/G] via [Spd E/G]
- Check that the assembled U in (i) really is a locally spatial diamond when Delta_{X_2} is only representable, not separated

**Prerequisites.** `VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition`, `DiamondsAndVStacks:D4`, `mathlib:CategoryTheory.Limits.limit`, `mathlib:CategoryTheory.Comma`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition IV.1.8 and proof, printed p. 109.

  > For point (i), if X = X_2 x_{X_1} X_3 is such a fibre product and f_i : U_i -> X_i are separated, representable in locally spatial diamonds, and cohomologically smooth surjective maps from locally spatial diamonds U_i, then U = (U_1 x_{X_2} U_2) x_{U_2} (U_2 x_{X_2} U_3) is itself a locally spatial diamond (using that Delta_{X_2} is representable in locally spatial diamonds).

  The explicit construction and the hypothesis it consumes.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Example IV.1.9 (iv), printed p. 110.

  > Let G be a locally profinite group that admits a closed embedding into GL_n(E) for some n. Then the classifying stack [*/G] is an Artin v-stack.

  The example on which VS4's classifying-stack analysis rests, with its exact hypothesis (closed embedding into GL_n(E)).

### `shriek-pullback-for-smooth-stacky-maps` — FS IV.1.11-IV.1.17: cohomological smoothness for stacky maps and the dualizing complex Rf^! Lambda

*construction.* **Planet: Shriek pullback for smooth stacky maps.**

**Statement.** For f : Y -> X a map of Artin v-stacks admitting a separated, representable, cohomologically smooth surjection g : V -> Y from a locally spatial diamond with f o g separated, f is cohomologically smooth if f o g is, for one equivalently all such g. For such f one defines the invertible dualizing complex Rf^! Lambda in D_et(Y,Lambda) by the compatible system of isomorphisms Rg^!(Rf^! Lambda) = R(f o g)^! Lambda over the category of separated cohomologically smooth g : V -> Y, and sets Rf^! = Rf^! Lambda tensor^L f^*. Rf^! preserves all limits and colimits, hence has a left adjoint Rf_!. f is pure of l-dimension d in (1/2)Z if Rf^! F_l sits in homological degree 2d.

**Hypotheses that must not be dropped.**

- Lambda is killed by an integer n prime to p, or is an adic ring as in ECD Section 26
- The 'equivalently, one' clause rests on ECD Proposition 23.13 (cohomological smoothness is smooth-local on the source)
- Convention IV.1.12 makes the existence of g with f o g separated PART of the assertion that f is cohomologically smooth; it is automatic only when X, Y admit perfectoid covers and Delta_X is representable in perfectoid spaces
- Remark IV.1.14 is an explicit warning: for a compactifiable representable g with dim.trg g < infinity it is NOT clear that Rg^!(Rf^! Lambda) = R(f o g)^! Lambda; this is asserted only for V a locally spatial diamond and g separated cohomologically smooth
- Fargues-Scholze explicitly do NOT construct Rf_! and Rf^! for general stacky maps; only Rf^! for cohomologically smooth maps of Artin v-stacks
- The decomposition into pieces pure of l-dimension d may a priori depend on l and involve half-integers

**Proof outline.**

1. Define cohomological smoothness by smooth-local descent on the source, using ECD Prop. 23.13 for well-definedness.
2. Define Rf^! Lambda as an object of the 2-limit over the category C of separated cohomologically smooth g : V -> Y of invertible objects in D_et(V,Lambda), via the rule g -> RHom_Lambda(Rg^! Lambda, R(f o g)^! Lambda); Fargues-Scholze identify this 2-limit with invertible objects in D_et(Y,Lambda).
3. Uniqueness up to unique isomorphism follows since Rf^! Lambda is locally concentrated in one degree.
4. Set Rf^! = Rf^! Lambda tensor^L f^*; it preserves limits and colimits by checking after a cohomologically smooth cover, so it has a left adjoint Rf_!.
5. Invertibility of Rf^! F_l plus Proposition IV.2.6(ii) gives that it is v-locally, hence etale-locally, F_l[n].

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `dualizingComplex` | data | Rf^! Lambda in D_et(Y,Lambda) for a cohomologically smooth map f of Artin v-stacks, defined by the compatible system of isomorphisms Rg^!(Rf^! Lambda) = R(f o g)^! Lambda over separated cohomologically smooth g : V -> Y with V a locally spatial diamond. |
| `dualizingComplex.invertible` | structure | Invertibility of Rf^! Lambda, which is what makes the twist well behaved and makes the uniqueness-up-to-unique-isomorphism argument work. |
| `shriekPullback` | data | Rf^! = Rf^! Lambda tensor^L f^*, the exceptional pullback of a cohomologically smooth stacky map. |
| `shriekPullback.leftAdjoint` | universal-property | Rf^! preserves all limits and colimits, hence has a left adjoint Rf_!; this Rf_! is defined only in this situation and is not the ordinary ECD Rf_! of a representable map. |
| `isCohomologicallySmooth` | characterisation | Cohomological smoothness of a stacky f, defined by descent along one and hence any chart g with f o g separated (ECD Proposition 23.13). |
| `purity` | data | f is pure of l-dimension d in (1/2)Z if Rf^! F_l sits in homological degree 2d; the value may a priori depend on l and be a half-integer. |

Derived from where the object is used:

- in `VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion` — the criterion is stated through Rf^! and its Verdier dual
- in `VStackSheavesAndLisseCategories:VS3/lisse-category-definition` — the generators of D_lis are f_sharp Lambda for separated l-cohomologically smooth f, so this is the class of maps that produces them
- in `VStackSheavesAndLisseCategories:VS5/bernstein-zelevinsky-duality` — pi_sharp for Bun_G -> * is built from Rpi^! Lambda, which is this construction for the structure map

**Unit tests.** A plausible wrong definition fails one of these.

- `only_for_cohomologically_smooth_maps` — The construction is made only for cohomologically smooth maps; Fargues-Scholze state explicitly that they do not build Rf_! and Rf^! for general stacky maps, so an unrestricted six-functor signature would not be faithful to the source.
- `compatibility_is_not_general` — Remark IV.1.14: for a compactifiable representable g of finite dim.trg it is not known that Rg^!(Rf^! Lambda) = R(f o g)^! Lambda; the compatibility is asserted only for V a locally spatial diamond and g separated cohomologically smooth.
- `dimension_of_a_classifying_stack` — [*/G(E)] -> * is pure of l-dimension 0, and Bun_G^b -> * of l-dimension -<2rho, nu_b>; a construction giving any other value contradicts Propositions IV.1.19 and IV.1.22.
- `shriek_is_not_star` — Rf^! differs from f^* by the dualizing twist; identifying them is wrong except when Rf^! Lambda is trivial.

**Acceptance.**

- Check the pi-sharp caveat: verify on an Artin v-stack that the left adjoint Rf_! constructed here is NOT the ordinary ECD Rpi_! of a representable map
- Check the l-dimension of [*/G(E)] -> * (should be 0, Example IV.1.9(iv) + Theorem IV.1.19)
- Check the l-dimension of Bun_G^b -> * against -<2rho, nu_b> (Proposition IV.1.22)

**Prerequisites.** `VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition`, `DiamondSixOperations:S3`, `DiamondSixOperations:S4`, `mathlib:CategoryTheory.Adjunction`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Before Definition IV.1.13, printed p. 111.

  > We will not try to give a completely general 6-functor formalism that includes functors Rf_! and Rf^! for stacky maps f (this would require some infinity-categorical setting). However, we can extend the functor Rf^! to cohomologically smooth maps of Artin v-stacks.

  Fixes the exact scope: the operations extended here are strictly less than a full six-functor formalism, which is what the stage text warns about.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Remark IV.1.14, printed p. 111.

  > If g : V -> Y is a compactifiable representable in locally spatial diamonds morphism of small v-stacks with dim. trg g < infinity such that f o g satisfies the same hypothesis, it is not clear that Rg^!(Rf^! Lambda) = R(f o g)^! Lambda. This is a priori true only when V is a locally spatial diamond and g is separated cohomologically smooth, the only case we will need.

  The explicit limitation on the compatibility, which must be preserved in any restatement.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition IV.1.17, printed p. 111.

  > Let f : Y -> X be a cohomologically smooth map of Artin v-stacks and let l != p be a prime. Then f is pure of l-dimension d in (1/2)Z if Rf^! F_l sits in homological degree 2d.

  The l-dimension convention, including the a priori half-integer values and l-dependence.

### `partial-compactly-supported-vanishing` — FS IV.5: partially compactly supported cohomology towards one end vanishes

*theorem.* **Planet: Partial-support vanishing towards one end.**

**Statement.** Fix k algebraically closed over F_q and work on Perf_k. Let X be a spatial diamond with f : X -> * = Spd k partially proper and dim.trg f < infinity, and let S be a spatial diamond. The product X x S has two ends; using quasi-pro-etale universally open surjections X-tilde -> X, S-tilde -> S and maps X-tilde -> Spa k((t)), S-tilde -> Spa k((u)), one defines the canonical doubly-indexed system of qcqs opens U_{a,b} in X x S and the functors Rbeta_{!+}, Rbeta_{!-} along beta : X x S -> S. If C = alpha^* A tensor^L_Lambda beta^* B for A in D_et(X,Lambda) and B in D_et(S,Lambda), then Rbeta_{!+} C = 0 = Rbeta_{!-} C. The base case is the vanishing RGamma(D^*_C, j_! Lambda) = 0 = RGamma(D^*_C, j'_! Lambda) on the punctured open unit disc.

**Hypotheses that must not be dropped.**

- X is a SPATIAL diamond, partially proper over Spd k with finite dim.trg; S is a spatial diamond
- Lambda is killed by an integer n prime to p
- C must be an exterior product alpha^* A tensor beta^* B; the theorem is NOT asserted for a general C on X x S. Remark IV.5.4 says the essential case is B = Lambda and S = Spa k((t))
- Independence of the ind-system {U_{a,b}} from the chosen pseudouniformizers uses that a power of one pseudouniformizer divides the other
- The reductions use ECD Theorem 19.2 (commutation of j_! with proper pushforward), ECD Prop. 17.3, 17.6, 14.15, 22.11

**Proof outline.**

1. Reduce to a simplicial hypercover X_bullet -> X by affinoid perfectoid X_i partially proper over Spa k, obtained as canonical compactifications of quasi-pro-etale maps, so dim.trg g_i = 0; each g_i is then proper and Rbeta_{!+} commutes with the resulting limit (using Postnikov truncations and a uniform bound).
2. Reduce to X = Spa(R,R^+) affinoid perfectoid without nonsplit finite etale covers, then push forward along the proper map g : X -> Y = Spa K with K the completed algebraic closure of k((t)); the projection formula and proper base change turn C into an exterior product on Y x S.
3. Reduce to X = Spa K, so A is just a complex of Lambda-modules; show Rbeta_*(j_{a!} C|_{U_a}) = 0 by showing the cones for a' > a vanish, these depending only on a quasicompact part so that their formation commutes with base change in S.
4. Reduce S to Spa(L,L^+), then to B concentrated at the closed point, then (using that the U_a are locally constant on a profinite set and nested) to a single map k((u)) -> L, then to B = Lambda and S = Spa L.
5. Replace Spa K by Spa k((t)) using that Spa K is the inverse limit over finite extensions and that the cones do turn the limit into a colimit.
6. Conclude by Lemma IV.5.1, proved by the triangle (kj)_! Lambda -> Rk_* j_! Lambda -> i_* A with H^0(A) = Lambda, H^1(A) = Lambda(1), and the comparison with RGamma(P^1_C \ {0}, j-tilde_! Lambda) = 0.

**Acceptance.**

- Verify Lemma IV.5.1 directly for the annulus and the algebraic P^1 comparison
- Verify that the ind-system {U_{a,b}} is independent of the chosen pseudouniformizers
- Verify the failure of the statement for a C that is not an exterior product, or record that no counterexample is given in the source

**Prerequisites.** `DiamondSixOperations:S1`, `DiamondSixOperations:S2`, `DiamondSixOperations:S5`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem IV.5.3, printed p. 153.

  > Assume that C = alpha^* A tensor^L_Lambda beta^* B for A in D_et(X,Lambda) and B in D_et(S,Lambda). Then Rbeta_{!+} C = 0 = Rbeta_{!-} C.

  Exact statement with the exterior-product hypothesis.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Lemma IV.5.1 and proof, printed p. 152.

  > The partially compactly supported cohomology groups RGamma(D^*_C, j_! Lambda) = 0 = RGamma(D^*_C, j'_! Lambda) vanish.

  The base case of the induction, with the two ends of the punctured disc made explicit.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, IV.5, printed p. 153.

  > For any two choices of pseudouniformizers, a power of one divides the other, so it follows that if U-tilde_{a,b} in X-tilde x S-tilde denotes the preimage of {|t|^b <= |u| <= |t|^a}, then the doubly-indexed ind-system {U-tilde_{a,b}} is independent of the choice of the maps X-tilde -> Spa k((t)), S-tilde -> Spa k((u)).

  The independence-of-presentation statement the stage text requires for the partial-support functors.

## VS1. ULA, Jacobian criterion and localization

The definition of local acyclicity for diamonds carries a condition that the
scheme-theoretic definition does not: besides overconvergence along generizations, one demands that
`R(f∘j)_!(A|_U)` be **perfect-constructible** for every separated étale `j` with `f∘j` quasicompact.
Fargues–Scholze give the reason and it should be quoted rather than paraphrased: *in the world of adic spaces,
there are not enough specializations to make this an interesting definition; for example, there are no
specializations from `Gr_{G,μ}` into `Gr_{G,≤μ} ∖ Gr_{G,μ}`.* Condition (b) is automatic for schemes and highly
nontrivial here.

Three results then make the notion usable: it descends along v-covers of the target, it is preserved by proper
pushforward, and — the one that matters structurally — it is **smooth-local on the source**. That last statement
is what licenses Definition IV.2.31, the definition for maps of Artin v-stacks by descent along a chart; without
it the stacky definition would not be well posed. Theorem IV.2.23 recasts the condition as left-adjointness in a
2-category of cohomological correspondences, which is the form geometric Satake and VS5 use.

The Jacobian criterion is here as a statement. Its proof, the whole of IV.3, the body of IV.4, hyperbolic
localization in IV.6 and Drinfeld's lemma in IV.7 were **not read**. That is recorded as a gap and is the
principal reason this packet proposes dividing the layer.

**Coverage: `partial`.** The strengthened definition of local acyclicity with its perfect-constructibility condition, its descent and smooth-locality, the dualizability criterion IV.2.23, the definition for maps of Artin v-stacks, and the statement of the Jacobian criterion. Sections IV.3, IV.6 and IV.7, which the stage text also asks for, were not read at all by the decomposition and no node is invented for them; this is the layer's largest remaining piece.

Remaining in this layer:

- Propositions IV.2.15 and IV.2.19, which supply (i) => (ii) in Theorem IV.2.23, were not read.
- Sections IV.3 (formal smoothness) and the body of IV.4 (Propositions IV.4.8-IV.4.29, including the deformation-to-the-normal-cone argument, the sous-perfectoid smoothness theory and the Zariski-closed-immersion analysis) were NOT read; only the statement of Theorem IV.4.2, Definition IV.4.1, the motivating discussion and Example IV.4.7 were.
- Section IV.6 (hyperbolic localization, Braden's theorem, the comparison map, equivariance and boundedness hypotheses) was NOT read.
- Section IV.7 (Drinfeld's lemma, partial Frobenius descent, the pi_1((Div^1)^I) = W_E^I heuristic) was NOT read; only the chapter introduction's caveat 'we know no definition of pi_1 making this true' was.
- Corollaries IV.2.25, IV.2.27, IV.2.29 (ULA base change) were located but not read.

### `ula-definition-with-constructibility` — FS IV.2.1: local acyclicity for diamonds requires a constructibility condition in addition to overconvergence

*definition.* **Planet: Universal local acyclicity.**

**Statement.** Let f : X -> S be a compactifiable map of locally spatial diamonds with locally dim.trg f < infinity, and A in D_et(X,Lambda) with n Lambda = 0, n prime to p. A is f-locally acyclic if (a) for all geometric points x of X with image s and every generization t of s, the map RGamma(X_x, A) -> RGamma(X_x x_{S_s} S_t, A) is an isomorphism; and (b) for all separated etale j : U -> X with f o j quasicompact, R(f o j)_!(A|_U) is PERFECT-CONSTRUCTIBLE on S. A is f-universally locally acyclic if this holds after every base change S' -> S along locally spatial diamonds.

**Hypotheses that must not be dropped.**

- Both conditions are required; (b) is automatic in the scheme case under standard finiteness hypotheses but is highly nontrivial for adic spaces. Fargues-Scholze add it because 'in the world of adic spaces, there are not enough specializations to make this an interesting definition' - e.g. there are no specializations from Gr_{G,mu} into Gr_{G,<=mu} minus Gr_{G,mu}
- X_x = Spa(C(x),C(x)^+) is the STRICT LOCALIZATION, the initial diamond pro-etale over X with a lift of x; the whole-fibre formulation is avoided because actual fibres are only pseudo-adic spaces in Huber's sense
- The generization set S_t inside S_s is a quasicompact pro-constructible generalizing subspace; condition (a) says A is overconvergent along horizontal lifts of generizations
- Condition (a) held universally is EQUIVALENT to A being overconvergent (Prop. IV.2.4); so the universal version of (a) alone is a pointwise condition
- Lambda must be killed by an integer prime to p

**Proof outline.**

1. Fargues-Scholze motivate (a) by the scheme-theoretic definition and quote Illusie's Corollary 3.5 for the equivalence of the two scheme formulations.
2. Remark IV.2.3 gives three equivalent reformulations of (a): B = Rj_* j^* B for the pro-constructible generalizing immersion j; the same for every Spa(C,C^+) -> S; and overconvergence of Rf_{x-bar *} A|_{X_{x-bar}}.
3. Prop. IV.2.4: condition (a) after every base change is equivalent to A being overconvergent; necessity is proved by base changing along X_x -> S and using the tautological section.
4. Prop. IV.2.6 identifies overconvergence with local constancy for constructible sheaves and with local constancy with perfect fibres for perfect-constructible complexes, via 2-colim Cons(U,Lambda) = Cons(X_x,Lambda) (ECD Prop. 20.7, 20.15).
5. Prop. IV.2.9: for f = id, f-locally acyclic is exactly locally constant with perfect fibres.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `IsLocallyAcyclic` | data | f-local acyclicity of A: condition (a), the overconvergence condition along generizations at every strict localization, together with condition (b), that R(f o j)_!(A\|_U) is perfect-constructible for every separated etale j : U -> X with f o j quasicompact. |
| `IsLocallyAcyclic.constructible` | structure | Condition (b) alone. Fargues-Scholze add it because in the world of adic spaces there are not enough specializations, and it is highly nontrivial here although automatic for schemes. |
| `IsULA` | data | f-universal local acyclicity: f-local acyclicity after every base change along a map of locally spatial diamonds. |
| `IsULA.overconvergent` | characterisation | Proposition IV.2.4: condition (a) held after every base change is equivalent to overconvergence of A, so the universal form of (a) is a pointwise condition. |
| `IsULA.of_id` | example | Proposition IV.2.9: for f the identity, f-local acyclicity is exactly local constancy with perfect fibres. |
| `strictLocalization` | data | X_x = Spa(C(x),C(x)^+), the initial diamond pro-etale over X with a lift of the geometric point x; the definition is phrased through it because actual fibres are only pseudo-adic spaces. |

Derived from where the object is used:

- in `VStackSheavesAndLisseCategories:VS1/ula-descent-and-smooth-locality` — descent, proper pushforward and smooth locality are all statements about this condition
- in `VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion` — the criterion reformulates this condition as left-adjointness in a 2-category of cohomological correspondences
- in `VStackSheavesAndLisseCategories:VS5/ula-equals-admissibility` — the last layer identifies the objects satisfying this condition on Bun_G with the stratumwise admissible ones

**Unit tests.** A plausible wrong definition fails one of these.

- `constructibility_is_part_of_the_definition` — Condition (b) is not implied by (a): an overconvergent complex need not be constructible, and Fargues-Scholze's motivating example is that there are no specializations from Gr_{G,mu} into the complement of Gr_{G,mu} in Gr_{G,<=mu}.
- `shriek_extension_from_the_punctured_disc` — Example IV.2.8: j_! Lambda for the punctured disc inside the disc is not constructible, whereas the annulus versions are, and j_! Lambda is their filtered colimit.
- `identity_map` — For f the identity, the condition is exactly local constancy with perfect fibres; anything weaker contradicts Proposition IV.2.9.
- `difference_only_at_higher_rank` — Remark IV.2.7: a constructible sheaf is locally constant near every maximal point, so a definition that cannot see rank > 1 valuations cannot see the difference the condition is there to make.

**Acceptance.**

- Verify Example IV.2.8: j_! Lambda for the punctured disc inside the disc is not constructible, but the annulus versions are, and j_! Lambda is their filtered colimit
- Verify that overconvergent-but-not-constructible complexes exist, so that (b) is not implied by (a)
- Verify Remark IV.2.7: a constructible sheaf is locally constant near every maximal point, so the difference shows up only at rank > 1 valuations

**Prerequisites.** `DiamondSixOperations:S1`, `EnhancedDerivedSheaves:E3`, `mathlib:CategoryTheory.Sheaf`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition IV.2.1, printed pp. 114-115.

  > (b) For all separated etale maps j : U -> X such that f o j is quasicompact, the complex R(f o j)_!(A|_U) in D_et(S,Lambda) is perfect-constructible.

  The constructibility condition that distinguishes the diamond definition from the scheme one.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, IV.2.1, printed p. 114.

  > In the world of adic spaces, there are not enough specializations to make this an interesting definition; for example, there are no specializations from Gr_{G,mu} into Gr_{G,<=mu} minus Gr_{G,mu}. Thus, we need to adapt the definition by adding a condition on preservation of constructibility that is automatic in the scheme case under standard finiteness hypothesis, but becomes highly ...

  Explains exactly why (b) is present, which the stage text asks to be retained. The excerpt is truncated here; the full quotation is in data/decompositions/VStackSheavesAndLisseCategories.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition IV.2.4, printed p. 115.

  > The condition (a) of Definition IV.2.1 holds after any base change S' -> S if and only if A is overconvergent, i.e. for any specialization y ~> x of geometric points of X, the map A_x -> A_y is an isomorphism.

  The geometric-fibre/overconvergence condition named in the stage text.

### `ula-descent-and-smooth-locality` — FS IV.2.5, IV.2.11, IV.2.13: v-descent of local acyclicity, proper pushforward, and smooth locality on the source

*theorem.* **Planet: ULA is smooth-local on the source.**

**Statement.** Local acyclicity descends along v-covers of the target (IV.2.5). If g : Y -> X is proper and A is f o g-(universally) locally acyclic, then Rg_* A is f-(universally) locally acyclic (IV.2.11); in particular if f is proper and A is f-locally acyclic, Rf_* A is locally a constant perfect complex (IV.2.12). If g : Y -> X is separated and l-cohomologically smooth for all l dividing n, then A is f-(universally) locally acyclic implies g^* A is f o g-(universally) locally acyclic, and conversely if g is surjective (IV.2.13).

**Hypotheses that must not be dropped.**

- For the LOCALLY acyclic (non-universal) statements of IV.2.13 one must assume S SPATIAL and that the cohomological dimension of U_et is bounded by a fixed N for all quasicompact separated etale U -> S; the universal case then follows by testing on strictly totally disconnected spaces via IV.2.5
- IV.2.11 needs g proper, f compactifiable, and locally dim.trg g, dim.trg f < infinity
- IV.2.13 needs g separated and l-cohomologically smooth for ALL l dividing n, where n Lambda = 0
- The converse direction of IV.2.13 needs g surjective, and its proof needs the finite-cohomological-dimension hypotheses on S, f and g (through ECD Prop. 20.17)

**Proof outline.**

1. IV.2.5: condition (a) lifts geometric points; condition (b) descends by ECD Proposition 20.13.
2. IV.2.11: for (a) use the reformulation A = Rk_* k^* A and apply Rg_*; for (b) use proper base change and Rg_* = Rg_! to identify R(f o j)_! j^* Rg_* A with R(f o g o j')_! j'^* A.
3. IV.2.13(i): reduce to X, Y spatial; (a) is preserved by pullback since stalks are preserved; (b) uses the projection formula R(f o g o j)_! j^* g^* A = Rf_!(A tensor^L R(g o j)^! Lambda), that R(g o j)^! Lambda is perfect-constructible by ECD Prop. 23.12(ii), and Lemma IV.2.14.
4. IV.2.13(ii): (a) by lifting geometric points; (b) by showing the Rg_! C for perfect-constructible C generate D_et(X,Lambda) compactly - if RHom(Rg_! C, B) = 0 for all such C then RHom(C, Rg^! B) = 0, so Rg^! B = 0 by ECD Prop. 20.17 and the dimension bounds, hence g^* B = 0 by cohomological smoothness, hence B = 0 by surjectivity.

**Acceptance.**

- Verify that the boundedness hypothesis on cohomological dimension is really used, by locating the appeal to ECD Prop. 20.17
- Verify IV.2.12 on a proper family of Schubert varieties
- Verify that IV.2.13 is what licenses the Artin-stack definition IV.2.31 to be independent of the chart

**Prerequisites.** `VStackSheavesAndLisseCategories:VS1/ula-definition-with-constructibility`, `DiamondSixOperations:S4`, `mathlib:CategoryTheory.Sheaf`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition IV.2.13, printed p. 117.

  > For the statements in the locally acyclic case below, assume that S is spatial and that the cohomological dimension of U_et for all quasicompact separated etale U -> S is <= N for some fixed integer N.

  The finiteness hypothesis that is easily lost in restatement.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition IV.2.13, printed p. 118.

  > As g o j : V -> X is a quasicompact separated l-cohomologically smooth map, it follows that R(g o j)^! Lambda in D_et(X,Lambda) is perfect-constructible by [Sch17a, Proposition 23.12 (ii)].

  Names the imported constructibility-preservation input.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Before Proposition IV.2.11, printed p. 117.

  > The fact that local acyclicity is smooth local on the source is essential to define local acyclicity for morphisms of Artin v-stacks, cf. Definition IV.2.31.

  States why IV.2.13 is the prerequisite for the Artin-stack definition.

### `ula-dualizability-criterion` — FS IV.2.23: universal local acyclicity as left-adjointness in a 2-category of cohomological correspondences

*theorem.* **Planet: ULA as left-adjointness.**

**Statement.** Fix a small v-stack S and Lambda killed by an integer prime to p. Let C_S be the 2-category whose objects are maps f : X -> S that are compactifiable, representable in locally spatial diamonds with locally dim.trg f < infinity, with Fun_{C_S}(X,Y) = D_et(X x_S Y, Lambda) and composition A star B = Rpi_{13!}(pi_{12}^* A tensor^L pi_{23}^* B), identity R Delta_! Lambda. For A in D_et(X,Lambda) the following are equivalent: (i) A is f-universally locally acyclic; (ii) the natural map p_1^* D_{X/S}(A) tensor^L p_2^* A -> RHom_Lambda(p_1^* A, Rp_2^! A) is an isomorphism; (iii) A, viewed in Fun_{C_S}(X,S), is a left adjoint in C_S, with right adjoint D_{X/S}(A).

**Hypotheses that must not be dropped.**

- The objects of C_S are REPRESENTABLE compactifiable maps of finite locally dim.trg; the identity R Delta_! Lambda = R Delta_* Lambda uses that Delta is a closed immersion, which holds because f is compactifiable, in particular 0-truncated and separated
- The criterion in the form used for Artin v-stacks (Prop. IV.2.32) is the variant p_1^* RHom(A,Lambda) tensor^L p_2^* A -> RHom(p_1^* A, p_2^* A), valid when f is COHOMOLOGICALLY SMOOTH (so that p_2^* may be replaced by Rp_2^!)
- The proof of (iii) => (i) assumes S strictly totally disconnected
- Lu-Zheng proved a related characterization; Fargues-Scholze propose a different one 'closer to how dualizability will appear later in the discussion of geometric Satake'

**Proof outline.**

1. (i) => (ii) from Propositions IV.2.15 and IV.2.19.
2. (ii) => (iii): take beta : A star D_{X/S}(A) = Rf_!(D_{X/S}(A) tensor^L A) -> Lambda adjoint to the tautological pairing D_{X/S}(A) tensor^L A -> Rf^! Lambda; take alpha : R Delta_! Lambda -> p_1^* A tensor^L p_2^* D_{X/S}(A), using (ii) to rewrite the target as RHom(p_1^* A, Rp_2^! A) and then adjunction R Delta^! RHom(p_1^* A, Rp_2^! A) = RHom(A,A) (ECD Theorem 1.8(v)) with its identity section; the triangle identities are a diagram chase.
3. (iii) => (i): with S strictly totally disconnected, Rf_!(A tensor^L -) has a colimit-preserving right adjoint, which gives condition (b); the self-duality of C_S^op yields a partner A' with RHom(A', Rf^! -) given by A tensor^L f^* -.

**Acceptance.**

- Verify the criterion on A = Lambda and f cohomologically smooth, recovering IV.2.33
- Verify that the composition star really makes C_S a 2-category (projection formula)
- Verify Prop. IV.2.32's replacement of Rp_2^! by p_2^* under cohomological smoothness

**Prerequisites.** `VStackSheavesAndLisseCategories:VS0/shriek-pullback-for-smooth-stacky-maps`, `DiamondSixOperations:S3`, `mathlib:CategoryTheory.Adjunction`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.LeftRigidCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem IV.2.23, printed pp. 124-125.

  > (iii) The object A in Fun_{C_S}(X,S) is a left adjoint in C_S. In that case, its right adjoint is given by D_{X/S}(A) in D_et(X,Lambda) = Fun_{C_S}(S,X).

  The adjointness characterization, which is the form used for Satake.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition IV.2.33 and the remark after it, printed p. 129.

  > Let f : X -> S be a compactifiable map of v-stacks that is representable in locally spatial diamonds with locally dim.trg f < infinity. Then f is l-cohomologically smooth if and only if F_l is f-universally locally acyclic and its Verdier dual Rf^! F_l is invertible. ... Thus, f is l-cohomologically smooth if and only if Rf^! F_l is invertible and its formation commutes with any base change.

  The cohomological-smoothness criterion in terms of ULA, used repeatedly downstream.

### `ula-for-artin-v-stacks` — FS IV.2.31-IV.2.32: universal local acyclicity for maps of Artin v-stacks

*definition.* **Planet: ULA for Artin v-stacks.**

**Statement.** Let f : X -> S be a map of Artin v-stacks admitting a separated, representable in locally spatial diamonds, cohomologically smooth surjection g : U -> X from a locally spatial diamond with f o g compactifiable of locally finite dim.trg. Then A in D_et(X,Lambda) is f-universally locally acyclic if g^* A is f o g-universally locally acyclic. If f is cohomologically smooth, A is f-universally locally acyclic if and only if p_1^* RHom_Lambda(A,Lambda) tensor^L p_2^* A -> RHom_Lambda(p_1^* A, p_2^* A) is an isomorphism on X x_S X.

**Hypotheses that must not be dropped.**

- The definition requires the existence of a chart g with f o g compactifiable and locally finite dim.trg; well-definedness (independence of g) is exactly Proposition IV.2.13
- Fargues-Scholze warn that the previous results carry over only 'assuming that the relevant operations are defined in the case of interest - we did not define Rf_! and Rf^! for general stacky maps'
- Proposition IV.2.32 needs f COHOMOLOGICALLY SMOOTH, which is what permits replacing Rp_2^! by p_2^*

**Proof outline.**

1. Definition by smooth descent on the source, legitimate by IV.2.13.
2. For IV.2.32: take a chart for S to assume S a locally spatial diamond, then a presentation for X; the condition commutes with smooth base change; replace p_2^* by Rp_2^! using cohomological smoothness and apply Theorem IV.2.23.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `IsULAStack` | data | A in D_et(X,Lambda) is f-universally locally acyclic for a map f of Artin v-stacks if g^* A is (f o g)-universally locally acyclic for a chart g : U -> X that is separated, representable in locally spatial diamonds and cohomologically smooth, with f o g compactifiable of locally finite dim.trg. |
| `IsULAStack.chart_independent` | characterisation | Independence of the chart, which is exactly Proposition IV.2.13, the smooth-locality statement; without it the definition is not well posed. |
| `IsULAStack.of_diamond` | compatibility | Agreement with the diamond definition when f is itself representable, so that the two notions may be used interchangeably. |
| `IsULAStack.criterion` | characterisation | Proposition IV.2.32: when f is cohomologically smooth, the condition is equivalent to p_1^* RHom(A,Lambda) tensor^L p_2^* A -> RHom(p_1^* A, p_2^* A) being an isomorphism on X x_S X. |
| `IsULAStack.scope` | structure | The caveat Fargues-Scholze attach: the earlier results carry over only where the relevant operations are defined, and Rf_! and Rf^! were not defined for general stacky maps. |

Derived from where the object is used:

- in `VStackSheavesAndLisseCategories:VS5/ula-equals-admissibility` — the identification with stratumwise perfectness of pro-p invariants is about this notion on Bun_G
- in `VStackSheavesAndLisseCategories:VS5/verdier-biduality-and-reflexivity` — the duality statements are applied to objects satisfying this condition

**Unit tests.** A plausible wrong definition fails one of these.

- `chart_independence` — Two different charts give the same condition; this is Proposition IV.2.13 and is the only reason the definition is legitimate.
- `agrees_with_the_representable_case` — For a representable f the stacky condition and the diamond condition of Definition IV.2.1 agree.
- `criterion_needs_smoothness` — The reformulation of Proposition IV.2.32 replaces Rp_2^! by p_2^*, which is licensed by cohomological smoothness of f; using it without that hypothesis is wrong.

**Acceptance.**

- Verify independence of the chart on Bun_G using the Beauville-Laszlo charts of Theorem IV.1.19 versus the charts of Theorem V.3.7
- Verify the criterion for A = Lambda on Bun_G
- Check that no Rf_! for stacky f is used in the statement

**Prerequisites.** `VStackSheavesAndLisseCategories:VS1/ula-descent-and-smooth-locality`, `VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion`, `mathlib:CategoryTheory.Sheaf`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition IV.2.31, printed p. 129.

  > Let f : X -> S be a map of Artin v-stacks and assume that there is some separated, representable in locally spatial diamonds, and cohomologically smooth surjection g : U -> X from a locally spatial diamond U such that f o g : U -> S is compactifiable with locally dim.trg(f o g) < infinity. Then A in D_et(X,Lambda) is f-universally locally acyclic if g^* A is f o g-universally locally acyclic.

  Verbatim definition with its chart hypotheses.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Definition IV.2.31, printed p. 129.

  > All previous results concerning universally locally acyclic complexes also hold in this setting (assuming that the relevant operations are defined in the case of interest - we did not define Rf_! and Rf^! for general stacky maps).

  The scope caveat.

### `jacobian-criterion` — FS IV.4.1-IV.4.2: the Jacobian criterion for cohomological smoothness of moduli of sections

*theorem.* **Planet: The Jacobian criterion.**

**Statement.** Let S be a perfectoid space and Z -> X_S a smooth map of sous-perfectoid spaces such that Z admits a Zariski closed immersion into an open subset of the adic space P^n_{X_S}. Let M_Z be the v-sheaf of sections of Z -> X_S and M_Z^sm the open subfunctor of sections s with s^* T_{Z/X_S} of everywhere positive Harder-Narasimhan slopes. Then M_Z is a locally spatial diamond, M_Z -> S is compactifiable, and M_Z^sm -> S is cohomologically smooth; at a geometric point given by s : X_C -> Z, its l-dimension is deg(s^* T_{Z/X_S}).

**Hypotheses that must not be dropped.**

- Z -> X_S must be SMOOTH in the sous-perfectoid sense of Definition IV.4.8, and QUASIPROJECTIVE in the stated sense (Zariski closed in an open subset of P^n_{X_S}). Remark IV.4.6 explains that allowing P(E) for a vector bundle E is equivalent, because O_{X_S}(1) is ample for S affinoid perfectoid
- The positivity condition is on the HN slopes of s^* T_{Z/X_S} at EVERY geometric point, and it is what makes H^1(X_{S'}, s^* T_{Z/X_S}) vanish locally on S' by Proposition II.3.4(iii)
- M_Z -> S is only LOCALLY of finite dimension, not globally (Remark IV.4.3)
- Without the positivity condition, M_Z -> S is not cohomologically smooth

**Proof outline.**

1. Fargues-Scholze motivate the definition by the expected tangent space H^0(X_{S'}, s^* T_{Z/X_S}) and obstruction space H^1(X_{S'}, s^* T_{Z/X_S}), which vanishes locally when all slopes are positive (Prop. II.3.4(iii)).
2. They note that one expects M_Z^sm to look infinitesimally like BC(s^* T_{Z/X_S}), which is cohomologically smooth for positive slopes by Prop. II.3.5(iii), but say 'we are unable to prove a direct relation of this sort'; instead they use a deformation to the normal cone.
3. The deformation-to-the-normal-cone argument (printed p. 151) produces an E^times-equivariant morphism M_C -> S x E with section, whose fibre at 0 is the zero section of BC(s^* T_{Z/X_S}) -> S and whose fibre away from 0 is M_Z x E^times, and compares dualizing complexes using that g is universally locally acyclic so that the dualizing complex commutes with base change.
4. One replaces the diagram by a quasicompact O_E \ {0}-invariant open U and concludes using that multiplication by pi contracts everything to 0 together with a constructibility argument.

**Acceptance.**

- Verify the Quot example IV.4.7: Quot_E^sm, the locus where the greatest slope of ker u is strictly less than the smallest slope of the quotient, is cohomologically smooth
- Verify the l-dimension formula on an explicit section of a projective bundle
- Verify that the criterion is not used to construct diamonds (the stage text's caveat about AdicEtaleGeometry A3)

**Prerequisites.** `RelativeFarguesFontaine:RF2`, `RelativeFarguesFontaine:RF3`, `VectorBundlesAndIsocrystals:VB1`, `VectorBundlesAndIsocrystals:VB4`, `DiamondSixOperations:S4`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem IV.4.2, printed p. 134.

  > Let S be a perfectoid space and let Z -> X_S be a smooth map of sous-perfectoid spaces such that Z admits a Zariski closed immersion into an open subset of (the adic space) P^n_{X_S} for some n >= 0. Then M_Z is a locally spatial diamond, the map M_Z -> S is compactifiable, and M_Z^sm -> S is cohomologically smooth.

  Exact statement with the quasiprojectivity hypothesis.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition IV.4.1 and the paragraph before it, printed p. 134.

  > This holds true, locally on S', if all slopes of s^* T_{Z/X_S} are positive (by Proposition II.3.4 (iii)), suggesting the following definition. Definition IV.4.1. Let M_Z^sm be contained in M_Z be the open subfunctor of all sections s : X_{S'} -> Z such that s^* T_{Z/X_S} has everywhere positive Harder-Narasimhan slopes.

  The positive-slope condition and the exact cohomological reason for it.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Before Theorem IV.4.2, printed p. 134.

  > Roughly speaking, one expects M_Z^sm to look infinitesimally like the Banach-Colmez space BC(s^* T_{Z/X_S}) ... Unfortunately, we are unable to prove a direct relation of this sort; however, we will be able to relate these spaces via a 'deformation to the normal cone'.

  Records honestly that the tangent-space heuristic is NOT the proof.

## VS2. Condensed and solid foundations

**This is the layer the pinned libraries changed most.** Mathlib at `082e2d3`
already contains `Mathlib/Condensed/Solid.lean`: `Condensed.profiniteFree`, `Condensed.profiniteSolid` — the free
solid module `R[S]^■` as the right Kan extension of the free functor on finite sets along `FintypeCat.toProfinite` —
`Condensed.profiniteSolidification`, and the class `CondensedMod.IsSolid`, which is Definition 5.1 (ii) written as
*mapping out of the solidification is bijective at every profinite set*. So the construction the stage text asks
for is not planned again.

What is planned is what the library says is missing, and the library says it in its own docstring:

> **TODO:** This is not the correct definition of solid `R`-modules for a general `R`. The correct one is as
> follows: Use this to define solid modules over a finite type `ℤ`-algebra `R`. In particular this gives a
> definition of solid modules over `ℤ[X]`. Then a solid `R`-module over a general ring `R` is the condition that
> for every `r ∈ R` and every ring homomorphism `ℤ[X] → R` such that `X` maps to `r`, the underlying `ℤ[X]`-module
> is solid.

and two further TODOs recording that `((profiniteSolid ℤ).obj S).IsSolid` is unproved. So at the pinned commit
the predicate has no proved nonempty instance, and Proposition 5.7 of Scholze's notes is exactly the missing
statement. The node owns the corrected general-ring definition, the structure theorem (Theorem 5.8), the
generators and the solid tensor product; it reuses the pinned predicate over `ℤ` and over finite-type
`ℤ`-algebras and says so.

The second node lifts this to a small v-stack. The resulting formalism is a **five**-functor formalism: `Rf_!`
does not have its usual properties, for proper finite-dimensional `f` the pushforward `Rf_*` need not satisfy a
projection formula, and the remedy is that `f^*` has a *left* adjoint `f_♯`. Two failures are recorded as part of
the construction rather than hidden: that projection formula, and the fact that a stratification does **not**
give a semiorthogonal decomposition on `D_■`. The second is the reason VS3 exists.

**Coverage: `partial`.** Solid abelian groups and solid pro-etale sheaves. This layer is the one most changed by reading the pinned libraries: Mathlib already has CondensedMod.IsSolid, Condensed.profiniteSolid, Condensed.profiniteSolidification and Condensed.profiniteFree, so the free solid module on a profinite set and the solidity predicate over the integers are not planned again. What is planned is the part the library says is missing, namely the corrected definition for a general coefficient ring, the unproved solidity of the free solid objects, the structure theorem and the sheaf-level formalism.

Remaining in this layer:

- Only Definition VII.1.1 and the chapter introduction of FS VII were read. Sections VII.2 (four functors), VII.3 (relative homology), VII.4 (relation to D_et), VII.5 (dualizability) were NOT read; the properties of f_sharp asserted here are taken from the chapter introduction's summary, not from their proofs.
- In Clausen-Scholze, only Definition 5.1, Remarks 5.2-5.3, the statement of Proposition 5.7, and the statement of Theorem 5.8 with Lemma 5.9 were read; the proof of Theorem 5.8 (Lecture VI) was not.
- Derived solid tensor and Hom, the analytic-ring formalism (Definition 7.x, Proposition 7.5) and the solid comparison with actual topological modules were NOT read.
- The stage text's Mathlib-specific tasks (CondensedMod, IsSolid and the finite-type Z-algebra restriction) are implementation matters and are recorded here as unchecked; no Lean was inspected.

### `solid-abelian-groups` — Clausen-Scholze solid abelian groups: definition and the structure theorem

*definition.* **Planet: Solid abelian groups.**

**Statement.** For a profinite set S = lim_i S_i put Z[S]_solid = lim_i Z[S_i], a condensed abelian group receiving S -> Z[S]_solid and hence Z[S] -> Z[S]_solid. A condensed abelian group A is solid if every map S -> A from a profinite set extends uniquely over Z[S]_solid. A complex C in D(Cond(Ab)) is solid if RHom(Z[S]_solid, C) -> RGamma(S,C) = RHom(Z[S],C) is an isomorphism for all profinite S. Theorem 5.8: Solid is an abelian subcategory of Cond(Ab) stable under all limits, colimits and extensions, with compact projective generators the products of copies of Z; the inclusion has a left adjoint M -> M_solid, the unique colimit-preserving extension of Z[S] -> Z[S]_solid; D(Solid) -> D(Cond(Ab)) is fully faithful with image the solid objects, and C is solid if and only if every H^i(C) is solid.

**Hypotheses that must not be dropped.**

- Z[S]_solid is defined only for S PROFINITE, via a chosen presentation as a cofiltered limit; the identification Z[S]_solid = Hom(C(S,Z),Z) shows independence
- Definition 5.1(ii) (solid object) and 5.1(iii) (solid complex) are a priori different; Scholze explicitly flags that neither implication is clear before Theorem 5.8
- Remark 5.3 notes that asking the INTERNAL RHom's to agree is a priori stronger, and that this is automatic only by Corollary 6.1(iv)
- The proof of Theorem 5.8 goes through Lemma 5.9, an abstract criterion requiring an abelian category with colimits and a generating subcategory of compact projectives, plus a vanishing condition on kernels of maps between sums of F-objects

**Proof outline.**

1. Scholze defines Z[S]_solid, solid objects and solid complexes, and notes the structural identification Z[S]_solid = lim_i Hom(C(S_i,Z),Z) = Hom(C(S,Z),Z).
2. Proposition 5.7 asserts that Z[S]_solid is solid both as a module and as a complex.
3. Theorem 5.8 is deduced from the abstract Lemma 5.9 applied to A = Cond(Ab) with A_0 the compact projectives and F(X) the solidification.
4. NOTE: the proof of Theorem 5.8 occupies the following lecture and was NOT read here; only its statement, Lemma 5.9's statement, and Definition 5.1 were read.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `solidification` | data | The map Z[S] -> Z[S]_solid for a profinite set S, and the induced solidification functor left adjoint to the inclusion. The pinned Mathlib has this: Condensed.profiniteFree, Condensed.profiniteSolid (the right Kan extension of the free functor on finite sets along FintypeCat.toProfinite) and the natural transformation Condensed.profiniteSolidification between them. |
| `IsSolid` | data | The predicate on a condensed abelian group. The pinned Mathlib has CondensedMod.IsSolid R, defined by asking that Hom(-, A) turns profiniteSolidification into an isomorphism at every profinite S, which is Definition 5.1 (ii) for R = Z. |
| `IsSolid.general_ring` | characterisation | The correction the roadmap requires: Mathlib's own docstring states that its predicate is not the correct notion for a general ring, and prescribes instead solidity over finite-type Z-algebras plus, for general R, solidity of the underlying Z[X]-module for every ring map Z[X] -> R. This node owns that corrected definition; the pinned predicate is reused only over Z and over finite-type Z-algebras. |
| `IsSolid.profiniteSolid` | constructor | That (profiniteSolid Z).obj S is itself solid, which is Proposition 5.7 of the source and is an explicit unproved TODO in the pinned Mathlib file. |
| `Solid.abelian` | structure | Theorem 5.8 (i): the solid abelian groups form an abelian subcategory of condensed abelian groups stable under all limits, colimits and extensions. |
| `Solid.generators` | characterisation | Theorem 5.8 (i): the products of copies of Z indexed by arbitrary sets are a family of compact projective generators. |
| `IsSolidComplex` | data | Definition 5.1 (iii): C in D(Cond(Ab)) is solid if RHom(Z[S]_solid, C) -> RGamma(S,C) is an isomorphism for every profinite S. Theorem 5.8 identifies this with solidity of every cohomology group, an implication Remark 5.2 says is not clear beforehand. |
| `Solid.tensor` | structure | The solid tensor product, under which the subcategory is monoidal; this is what VS2's sheaf-level construction and VS3's lisse category tensor against. |

Derived from where the object is used:

- in `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks` — solid pro-etale sheaves are defined by the same universal property one level up, and on a point they are exactly this category
- in `VStackSheavesAndLisseCategories:VS3/lisse-category-definition` — D_lis is cut out inside the solid category, so its objects are solid by construction
- in `VStackSheavesAndLisseCategories:VS3/lisse-comparisons` — the comparison that D_lis of a geometric point is the derived category of discrete modules is a statement about how small the lisse part of this category is

**Unit tests.** A plausible wrong definition fails one of these.

- `agrees_with_the_pinned_predicate_over_the_integers` — Over Z the corrected definition must agree with the pinned CondensedMod.IsSolid; a definition that does not is not an extension of the library but a replacement of it.
- `free_solid_group_on_a_profinite_set` — Z[S]_solid for S = lim S_i is lim Z[S_i], equivalently Hom(C(S,Z),Z), and not the free abelian group on the points of S; the pinned profiniteSolid is exactly the right Kan extension computing this.
- `not_every_condensed_group_is_solid` — Z[S] itself is not solid for S infinite profinite, so the inclusion of the subcategory is proper and the solidification functor is not the identity.
- `solid_is_not_discrete` — On a point, solid F_l-modules are strictly more than discrete F_l-vector spaces; this is the distinction the roadmap's acceptance note demands and it is what makes D_solid worth having.
- `the_general_ring_definition_is_not_the_naive_one` — For a ring that is not a finite-type Z-algebra the naive predicate is not the right notion; Mathlib says so in its own docstring, so a plan that simply reuses it for every R contradicts the library it cites.

**Acceptance.**

- Check that a discrete abelian group is solid and that Z_p and products of Z are solid
- Check that Z[S] itself is not solid for S infinite profinite
- Check the distinction the stage text requires: solid F_l-modules on a point versus discrete F_l-vector spaces

**Prerequisites.** `EnhancedDerivedSheaves:E3`, `mathlib:Condensed`, `mathlib:CondensedMod`, `mathlib:CondensedMod.IsSolid`, `mathlib:Condensed.profiniteSolid`, `mathlib:Condensed.profiniteSolidification`, `mathlib:Condensed.profiniteFree`, `mathlib:Profinite`, `mathlib:CompHaus`, `mathlib:CategoryTheory.Abelian`, `mathlib:CategoryTheory.Functor.rightKanExtension`

**Sources.**

- `Scholze-condensed` — Peter Scholze (notes by Scholze; joint work with Dustin Clausen), *Lectures on Condensed Mathematics*, Definition 5.1, printed p. 33.

  > (ii) A solid abelian group is a condensed abelian group A such that for all profinite sets S and all maps f : S -> A, there is a unique map f-tilde : Z[S]_solid -> A extending f. (iii) A complex C in D(Cond(Ab)) of condensed abelian groups is solid if for all profinite sets S the natural map RHom(Z[S]_solid, C) -> RGamma(S,C) = RHom(Z[S],C) is an isomorphism.

  The universal property the stage text asks to be constructed, in its exact form.
- `Scholze-condensed` — Peter Scholze (notes by Scholze; joint work with Dustin Clausen), *Lectures on Condensed Mathematics*, Remark 5.2, printed p. 33.

  > It follows formally that if A is condensed abelian group such that A[0] in D(Cond(Ab)) is solid, then A is solid. However, it is not clear that conversely, if A is a solid abelian group, then A[0] in D(Cond(Ab)) is solid, nor that if C in D(Cond(Ab)) is solid then a cohomology group H^i(C) is solid. However, Theorem 5.8 will show that these implications are both true.

  Records that the module-level and complex-level definitions are a priori different, AND that Scholze immediately says Theorem 5.8 resolves both implications; the resolving sentence must not be dropped.
- `Scholze-condensed` — Peter Scholze (notes by Scholze; joint work with Dustin Clausen), *Lectures on Condensed Mathematics*, Theorem 5.8, printed pp. 35-36.

  > (i) The category Solid contained in Cond(Ab) of solid abelian groups is an abelian subcategory stable under all limits, colimits and extensions. The objects product over I of Z in Solid, where I is any set, form a family of compact projective generators. The inclusion Solid in Cond(Ab) admits a left adjoint M -> M_solid : Cond(Ab) -> Solid that is the unique colimit-preserving extension ...

  The structure theorem, including the generators and the solidification functor. The excerpt is truncated here; the full quotation is in data/decompositions/VStackSheavesAndLisseCategories.json, where the independent review checked it against the source.

### `solid-sheaves-on-v-stacks` — FS VII.1 and VII introduction: solid pro-etale sheaves on a small v-stack and the five-functor formalism

*construction.* **Planet: Solid sheaves on a v-stack.**

**Statement.** For X a spatial diamond and quasi-pro-etale j : U -> X written as a cofiltered limit of qcqs etale j_i : U_i -> X, set j_sharp Z-hat = lim_i j_{i!} Z-hat. A pro-etale sheaf F of Z-hat-modules on X is solid if Hom(j_sharp Z-hat, F) -> F(U) is an isomorphism for all such j. This defines a full subcategory D_solid(X,Z_l) of D(X_v, Z_l), compatible with pullback, symmetric monoidal, stable under all limits and colimits, whose inclusion has a left adjoint; solidity of a complex is equivalent to solidity of each cohomology sheaf and may be checked v-locally. For any f : Y -> X, f^* has a right adjoint Rf_* commuting with base change, and also a LEFT adjoint f_sharp ('relative homology') that commutes with base change and satisfies the projection formula. Rf_! does not have its usual properties: for proper finite-dimensional f, Rf_* need not satisfy a projection formula.

**Hypotheses that must not be dropped.**

- Z-hat denotes lim over all nonzero n of Z/nZ; Fargues-Scholze quickly restrict to Z-hat^p = lim over n prime to p
- The construction of j_sharp Z-hat uses that the pro-system of the U_i is unique; the full subcategory Pro(X_et^{qcqs}) inside X_qproet^{qcqs} is a basis for the quasi-pro-etale topology by ECD Prop. 11.23(ii) and 11.24
- The resulting formalism is a FIVE-functor formalism: Fargues-Scholze explicitly decline to claim the usual Rf_! behaviour, and note in a footnote that one may treat it as a six-functor formalism in which f^! = f^* for all f
- D_solid(X,Z_l) is NOT presentable at one fixed universe: it is a large filtered colimit of presentable categories D_solid(X_kappa, Lambda) over uncountable strong limit cardinals kappa
- A stratification does NOT give a semiorthogonal decomposition on D_solid

**Proof outline.**

1. Define j_sharp Z-hat as the limit of the j_{i!} Z-hat over the unique pro-system, with its tautological section over U; for X = Spa C this recovers Clausen-Scholze's Z-hat[U]_solid.
2. Define solidity by the universal property against j_sharp Z-hat and check that it is v-local and detected on cohomology sheaves.
3. Fargues-Scholze record the resulting operations: f^*, Rf_*, RHom (all base-change compatible) and f_sharp (left adjoint to f^*, base-change compatible, projection formula).
4. For 'proper and smooth' f they relate f_sharp and Rf_*, and give a formula for the dualizing complex; these extend to universally locally acyclic complexes.
5. The presentability issue is handled by cutting off at a cardinal kappa and gluing the right adjoints (see the proof of Prop. VII.6.3).

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `sharpExtension` | data | j_sharp Z-hat = lim_i j_{i!} Z-hat for a quasi-pro-etale j : U -> X written as a cofiltered limit of qcqs etale j_i; well defined because the pro-system of the U_i is unique. |
| `IsSolidSheaf` | data | A pro-etale sheaf F of Z-hat-modules on X is solid if Hom(j_sharp Z-hat, F) -> F(U) is an isomorphism for every such j. |
| `DSolid` | data | The full subcategory D_solid(X,Z_l) of D(X_v,Z_l): stable under all limits and colimits, symmetric monoidal, with a left adjoint to the inclusion, and solidity detected on cohomology sheaves and checkable v-locally. |
| `DSolid.pullback` | functoriality | f^* for any map f of small v-stacks, with right adjoint Rf_* commuting with base change. |
| `DSolid.sharp` | functoriality | f_sharp, the left adjoint of f^* ('relative homology'), which exists for all f, commutes with base change and satisfies the projection formula; it is not an unqualified Rf_!. |
| `DSolid.no_projection_formula` | structure | The recorded failure: for f proper and finite-dimensional, Rf_* need not satisfy a projection formula, which is why the formalism has five functors and not six. |
| `DSolid.cutoff` | structure | D_solid(X,Lambda) is not presentable at a fixed universe but a large filtered colimit of the presentable D_solid(X_kappa,Lambda) over uncountable strong limit cardinals kappa. |

Derived from where the object is used:

- in `VStackSheavesAndLisseCategories:VS3/lisse-category-definition` — D_lis is by definition the sum-stable triangulated subcategory of this one generated by the f_sharp Lambda
- in `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects` — the lisse compact-generation argument uses s_sharp Lambda = Lambda and the projection formula for f_sharp, both of which live here

**Unit tests.** A plausible wrong definition fails one of these.

- `point_case` — On a point the category is the derived category of solid Z-hat-modules of the previous node, so the two definitions agree where they overlap.
- `sharp_is_a_left_adjoint` — f_sharp is left adjoint to f^*, not right adjoint, and is not Rf_!; a construction that makes it the ordinary proper pushforward loses the only functor the formalism actually has.
- `no_semiorthogonal_decomposition` — A stratification of a stack does not give a semiorthogonal decomposition of D_solid; this failure is the stated reason VS3 introduces D_lis, so a formalisation that appears to provide one is wrong.
- `taken_from_the_chapter_summary` — The four and five operations here are quoted from the source's chapter introduction; FS VII.2-VII.5 were not read, and this packet records that as a gap rather than as verified content.

**Acceptance.**

- Check on X = point, Lambda = F_l that D_solid is strictly larger than the derived category of discrete F_l-vector spaces
- Check that f_sharp of a closed immersion takes an ordinary etale sheaf to a genuinely non-etale solid sheaf, as Fargues-Scholze assert
- Check the failure of the projection formula for Rf_* with f proper

**Prerequisites.** `VStackSheavesAndLisseCategories:VS2/solid-abelian-groups`, `DiamondsAndVStacks:D6`, `DiamondSixOperations:S2`, `EnhancedDerivedSheaves:E4`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:CategoryTheory.Sheaf`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition VII.1.1 and the construction before it, printed p. 245.

  > For any quasi-pro-etale j : U -> X that can be written as a cofiltered inverse limit of qcqs etale j_i : U_i -> X, we let j_sharp Z-hat = lim_i j_{i!} Z-hat; as the pro-system of the U_i is unique, this is well-defined. ... Definition VII.1.1. Let F be a pro-etale sheaf of Z-hat-modules on X. Then F is solid if for all j : U -> X as above, the map Hom(j_sharp Z-hat, F) -> F(U) is an isomorphism.

  The definition of solid sheaves on a diamond, matching the Clausen-Scholze definition on a point.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, VII introduction, printed p. 244.

  > Unfortunately, Rf_! does not have the same good properties as usual. In particular, if f is proper (and finite-dimensional), Rf_* does not in general satisfy a projection formula. As a remedy, it turns out that for all f, the functor f^* admits a left adjoint f_sharp : D_solid(Y,Z_l) -> D_solid(X,Z_l), given by 'relative homology'.

  The exact scope of the solid formalism and the role of f_sharp; the stage text's warning that pi-sharp is not an unqualified Rpi_! is precisely this.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, VII introduction, printed p. 244.

  > The main problem with the solid formalism is that a stratification of a stack does not lead to a semi-orthogonal decomposition on the level of D_solid.

  The limitation that forces the passage to D_lis in VS3/VS4.

## VS3. Lisse categories and coefficients

`D_lis(X,Λ)` is the smallest sum-stable triangulated subcategory of
`D_■(X,Λ)` containing `f_♯Λ` for `f` separated, representable in locally spatial diamonds and ℓ-cohomologically
smooth. Two conventions are part of the definition and both are easy to lose. *Lisse* means lisse-étale in the
sense of Artin stacks; Fargues–Scholze say explicitly that it is **not** meant to evoke locally constant sheaves,
and the objects of `D_lis` are not all locally constant. And the coefficients are the **condensed** ring
`Λ = ℤ_ℓ ⊗_{ℤ_ℓ,disc} Λ_disc`, for a single fixed prime `ℓ ≠ p`, not the discrete ring.

The right adjoint of the inclusion is where the size problem surfaces. Fargues–Scholze write that its existence
*is formal* and that the description of its kernel *is formal*; what is not formal is the ambient set-up, since
`D_■(X,Λ)` is not presentable but a large filtered colimit of presentable `D_■(X_κ,Λ)` over uncountable strong
limit cardinals `κ`. One shows `D_lis(X,Λ) ⊆ D_■(X_κ,Λ)` for some `κ` and glues the right adjoints. (The
reviewer of the decomposition corrected this hypothesis: an earlier draft said the existence was *not* formal,
which is the opposite of the printed text.)

The comparisons then say how small `D_lis` is. Over `Spa C` it is `D(Λ)`, the derived category of relatively
discrete `Λ`-modules — so the lisse category is discrete again, even though `D_■` is not. For `Λ` killed by a
power of `ℓ` it sits inside `D_ét`, and agrees with it under a bounded-cohomological-dimension hypothesis on a
basis. And there is one semiorthogonal decomposition, for a closed point that is a cofiltered intersection of
qcqs opens with constant `𝔽_ℓ`-cohomology; the general stratification statement is only *expected*.

**Coverage: `partial`.** The lisse category of an Artin v-stack, its tensor and pullback stability, the right adjoint with its cutoff justification, and the three comparisons of VII.6.4-VII.6.7. The coefficient convention and the explicit disclaimer that 'lisse' does not mean locally constant are carried into the node's API and unit tests.

Remaining in this layer:

- Proposition VII.5.2 (f_sharp Lambda = Rf_! Rf^! Lambda for separated cohomologically smooth f), used in the proofs of VII.6.5 and VII.6.6, was not read.
- Section VII.6's remaining constructions - RHom_lis and Rf_{lis *} and their adjunctions - are asserted in one sentence after Proposition VII.6.3 and were not separately verified.
- The comparison of ordinary, adic, solid and lisse coefficients 'through the actual fully faithful functors of VII.6' was read only in the form of VII.6.4-VII.6.6; the adic comparison (ECD Section 26) was not.
- Rational coefficients and the constructed solid/lisse localization were not separately verified beyond the chapter introduction's discussion.

### `lisse-category-definition` — FS VII.6.1-VII.6.3: D_lis of an Artin v-stack, its tensor/pullback stability and right adjoint

*definition.* **Planet: The lisse category D_lis.**

**Statement.** Fix l != p and a discrete Z_l-algebra Lambda, interpreted as the condensed ring Lambda = Z_l tensor_{Z_l,disc} Lambda_disc. For X an Artin v-stack, D_lis(X,Lambda) inside D_solid(X,Lambda) is the smallest triangulated subcategory stable under all direct sums containing f_sharp Lambda for every f : Y -> X that is separated, representable in locally spatial diamonds, and l-cohomologically smooth. It is stable under the solid tensor product, and f^* maps D_lis(X,Lambda) into D_lis(Y,Lambda) for f a map of Artin v-stacks. The inclusion admits a right adjoint A -> A_lis whose kernel is the class of A with A(Y) = 0 for all such f : Y -> X.

**Hypotheses that must not be dropped.**

- 'lisse' refers to the lisse-etale site of an Artin stack in the sense of Laumon-Moret-Bailly, NOT to local constancy of the objects; Fargues-Scholze say this explicitly
- A single prime l must be fixed 'for a technical reason'; the coefficients are the condensed ring Z_l tensor_{Z_l,disc} Lambda_disc, not the discrete ring
- X must be an ARTIN v-stack; for a general small v-stack the definition can be made but 'there might be very few objects'
- Fargues-Scholze write 'The existence of the right adjoint is formal' and that 'The description of the kernel is formal'. What is NOT formal is the ambient set-up: D_solid(X,Lambda) is not itself presentable but a large filtered colimit of presentable infinity-categories D_solid(X_kappa,Lambda) over uncountable strong limit cardinals kappa, and one must check that D_lis(X,Lambda) is contained in D_solid(X_kappa,Lambda) for some kappa (reduce to X spatial and to quasicompact f, where f_sharp Z_l = lim_m f_sharp Z/l^m Z with each term in D_et(X,Z/l^m Z), then apply [Sch17a, Remark 17.4]) before gluing the right adjoints over all large enough kappa.

**Proof outline.**

1. Define the generators f_sharp Lambda and take the smallest sum-stable triangulated subcategory containing them.
2. Tensor and pullback stability (VII.6.2): both operations commute with direct sums, so it suffices to check on generators, and pullbacks and products of separated representable l-cohomologically smooth maps are again of that form.
3. Right adjoint (VII.6.3): Fargues-Scholze call the existence formal, but note that D_solid(X,Lambda) is not presentable; one checks that D_lis(X,Lambda) sits inside some D_solid(X_kappa,Lambda) - reduce to X a spatial diamond and to quasicompact f, where f_sharp Lambda = f_sharp Z_l tensor^L_{Z_l} Lambda and f_sharp Z_l = lim_m f_sharp Z/l^m Z with each term in D_et(X,Z/l^m Z), and use ECD Remark 17.4 - and then the right adjoints to D_lis(X,Lambda) -> D_solid(X_kappa,Lambda) for all large enough kappa glue.
4. Derive RHom_lis(A,B) in D_lis and Rf_{lis *} by composing with the right adjoint.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `Dlis` | data | For an Artin v-stack X and a fixed l != p, the smallest triangulated subcategory of D_solid(X,Lambda) stable under all direct sums containing f_sharp Lambda for every f : Y -> X separated, representable in locally spatial diamonds and l-cohomologically smooth. |
| `Dlis.coefficients` | data | The coefficient convention: Lambda is a discrete Z_l-algebra read as the condensed ring Z_l tensor_{Z_l,disc} Lambda_disc, not as the discrete ring; a single prime l must be fixed. |
| `Dlis.tensor` | structure | Stability under the solid tensor product, checked on generators because both operations commute with direct sums. |
| `Dlis.pullback` | functoriality | f^* maps D_lis(X,Lambda) into D_lis(Y,Lambda) for a map f of Artin v-stacks. |
| `Dlis.rightAdjoint` | universal-property | The right adjoint A -> A_lis of the inclusion, whose kernel is the class of A with A(Y) = 0 for every generator map f : Y -> X. |
| `Dlis.cutoff` | structure | The ambient argument: D_lis(X,Lambda) lies in D_solid(X_kappa,Lambda) for some kappa, proved by reducing to X spatial and f quasicompact where f_sharp Z_l = lim_m f_sharp Z/l^m Z, and then the right adjoints glue over all large enough kappa. |
| `Dlis.name_is_not_a_claim` | structure | 'lisse' means lisse-etale in the sense of Artin stacks, not locally constant; Fargues-Scholze say this explicitly and the roadmap repeats it. |

Derived from where the object is used:

- in `VStackSheavesAndLisseCategories:VS3/lisse-comparisons` — the discreteness, torsion and semiorthogonal comparisons are all statements about this category
- in `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects` — the lisse half of the compact generation theorem identifies D_lis(Bun_G^b,Lambda) with D(G_b(E),Lambda)
- in `VStackSheavesAndLisseCategories:VS5/verdier-biduality-and-reflexivity` — the lisse versions of duality in VII.7 are stated for objects of this category

**Unit tests.** A plausible wrong definition fails one of these.

- `point_case` — On Spa C for a complete algebraically closed C the category is D(Lambda), the derived category of relatively discrete Lambda-modules; this is Proposition VII.6.5 and is the sharpest test that the definition is not too big.
- `objects_need_not_be_locally_constant` — The objects of D_lis are not all locally constant; a formalisation that defines D_lis as the local systems contradicts the source's own disclaimer.
- `pullback_stability` — f^* preserves the lisse condition, which holds because pullbacks of separated representable l-cohomologically smooth maps are again of that form.
- `coefficients_are_condensed` — Lambda is the condensed ring Z_l tensor_{Z_l,disc} Lambda_disc; taking the discrete ring instead changes the category and is not the definition.

**Acceptance.**

- Check the coefficient convention: verify that Lambda = Z_l tensor_{Z_l,disc} Q_l-disc gives smooth representations on discrete Q_l-vector spaces on [*/G(E)]
- Check that the objects of D_lis are not all locally constant, i.e. that the name is not a claim
- Check the kernel description of A -> A_lis on an explicit non-lisse solid sheaf

**Prerequisites.** `VStackSheavesAndLisseCategories:VS0/shriek-pullback-for-smooth-stacky-maps`, `VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks`, `EnhancedDerivedSheaves:E5:presentability`, `AdicCoefficientsAndComparisons:L0`, `mathlib:DerivedCategory`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:Module.Finite`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, VII.6 and Definition VII.6.1, printed p. 268.

  > Here the subscript 'lis' is an abbreviation of 'lisse' (french smooth), and is not meant to evoke lisse sheaves in the sense of locally constant sheaves, but lisse-etale sheaves in the sense of Artin stacks [LMB00]. Definition VII.6.1. Let X be an Artin v-stack. The full subcategory D_lis(X,Lambda) in D_solid(X,Lambda) is the smallest triangulated subcategory stable under all direct sums ...

  Verbatim definition and the explicit disclaimer about the word 'lisse' that the stage text repeats. The excerpt is truncated here; the full quotation is in data/decompositions/VStackSheavesAndLisseCategories.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, VII.6, printed p. 268.

  > As coefficients, we will from now on choose a discrete Z_l-algebra Lambda for some l != p, or rather the corresponding condensed ring Lambda := Z_l tensor_{Z_l,disc} Lambda_disc. (For a technical reason, we have to restrict attention to a particular prime l.)

  The exact coefficient convention required by the stage text.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition VII.6.3, printed p. 269.

  > We note that the infinity-category D_solid(X,Lambda) is not itself presentable, but rather is the large filtered colimit of presentable infinity-categories D_solid(X_kappa,Lambda) for uncountable strong limit cardinals kappa (restricting the v-site to kappa-small perfectoid spaces).

  The cutoff mechanism the stage text demands ('construct compatible adjoints at adequate cutoffs').

### `lisse-comparisons` — FS VII.6.4-VII.6.7: discreteness at a geometric point, the torsion comparison with D_et, and a semiorthogonal decomposition

*comparison.*

**Statement.** For any condensed ring A, M -> M tensor_{A(*)} A is fully faithful from D(A(*)) to D(A) (VII.6.4). Hence for X = Spa C with C complete algebraically closed, D_lis(X,Lambda) = D(Lambda), the derived category of relatively discrete Lambda-modules (VII.6.5). If Lambda is killed by a power of l, then D_lis(X,Lambda) lies in the image of D_et(X,Lambda) inside D_solid(X,Lambda), and if there is a separated l-cohomologically smooth surjection U -> X from a locally spatial diamond with U_et having a basis of bounded l-cohomological dimension, the two agree (VII.6.6). If X is a locally spatial diamond with a closed point x whose closed subdiamond Z = Spa C is a cofiltered intersection of qcqs opens V with RGamma(V,F_l) = F_l, then D_lis(X,Lambda) has a semiorthogonal decomposition into D_lis(U,Lambda) and D_lis(Z,Lambda) = D(Lambda) (VII.6.7).

**Hypotheses that must not be dropped.**

- VII.6.5's proof needs f_sharp Z/l^m Z = Rf_! Rf^! Z/l^m Z (Proposition VII.5.2) to be a perfect complex of Z/l^m Z-modules, so that the limit over m is a perfect, in particular relatively discrete, Z_l-complex
- VII.6.6's equality half needs the BOUNDED l-cohomological dimension basis hypothesis; without it only the inclusion D_lis in D_et is claimed
- VII.6.7 needs BOTH that Z = Spa C is representable with C algebraically closed AND that Z is a cofiltered intersection of qcqs opens V with RGamma(V,F_l) = F_l; the proof uses constructibility of f_sharp F_l to spread an isomorphism over such a V and then lifts it uniquely through Z/l^m Z
- Fargues-Scholze say only that they 'expect' a general stratification result; VII.6.7 is 'a simple instance that will be sufficient for our purposes'

**Proof outline.**

1. VII.6.4: the class of M for which RHom_{A(*)}(M,N) -> RHom_A(M tensor A, N tensor A) is an isomorphism is triangulated and sum-stable, so reduce to M = A(*), where it is evaluation at * being symmetric monoidal.
2. VII.6.5: reduce to Lambda = Z_l; f_sharp Z_l = lim_m Rf_! Rf^! Z/l^m Z is a limit of perfect complexes, hence relatively discrete.
3. VII.6.6: f_sharp Lambda = Rf_! Rf^! Lambda lies in D_et, giving the inclusion; for equality, work on the atlas and use ECD Prop. 20.17 to get D_et(X,Lambda) = D(X_et,Lambda), generated by j_sharp Lambda for quasicompact separated etale j.
4. VII.6.7: analyse the quotient of D_lis(X,Lambda) by j_sharp D_lis(U,Lambda), show it is generated by the constant sheaf Lambda (using constructibility of f_sharp F_l and unique lifting along Z/l^m Z given RGamma(V,F_l) = F_l), and compute endomorphisms as the colimit of RGamma(V,Lambda) = Lambda.

**Acceptance.**

- Check VII.6.5 on X = Spa C and a nonconstant cohomologically smooth f
- Check that VII.6.6's basis hypothesis holds for Bun_G's charts
- Check VII.6.7 on the example of Remark V.4.3(i), X = Spd k[[x_1,...,x_d]]

**Prerequisites.** `VStackSheavesAndLisseCategories:VS3/lisse-category-definition`, `AdicCoefficientsAndComparisons:L0`, `AdicCoefficientsAndComparisons:L3`, `mathlib:CategoryTheory.Equivalence`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VII.6.5 and proof, printed pp. 269-270.

  > Let X = Spa C for some complete algebraically closed nonarchimedean field C. Then D_lis(X,Lambda) = D(Lambda), the derived category of (relatively) discrete Lambda-modules.

  The statement that makes D_lis 'discrete again', with its proof through perfectness of f_sharp Z/l^m Z.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VII.6.6, printed p. 270.

  > If there is a separated l-cohomologically smooth surjection U -> X from a locally spatial diamond U, such that U_et has a basis with bounded l-cohomological dimension, then it induces an equivalence D_lis(X,Lambda) = D_et(X,Lambda).

  The exact hypothesis under which lisse and etale coefficients agree for torsion Lambda.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Before Proposition VII.6.7, printed p. 270.

  > The most severe problem with the general formalism of solid sheaves is that stratifications of a space do not lead to corresponding decompositions of sheaves into pieces on the individual strata. This problem is somewhat salvaged by D_lis(X,Lambda): We expect that it holds true if X and its stratification are sufficiently nice. Here is a simple instance that will be sufficient for our purposes.

  Records that the general stratification statement is only expected, not proved.

## VS4. Sheaves on Bun_G strata and compact generation

Everything here rests on one identification: for `G` locally pro-`p` and
`nΛ = 0` with `n` prime to `p`, `D_ét([*/G],Λ)` is the derived category of **smooth** `G`-representations, with
pullback along `* → [*/G]` corresponding to forgetting the action. Both hypotheses are consumed at the same
point of the proof: one reduces to `G` pro-`p`, where there is no continuous group cohomology on `Λ`-modules
because `n` is prime to `p`. For `ℓ = p` the theorem is false.

The accepted restructuring **RS-05 narrows this layer**. The smooth abelian carrier, its derived extension and
compact induction are imported from `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`,
`SR.0:derived-extension` and `SR.2`; what is proved here is the equivalence and the geometric compact-generation
argument. RS-05 also notes that the pinned smooth-discrete continuity already exists — it does, as Tau Ceti's
`IsSmoothDiscrete` and `SmoothDiscreteTopRep`, which this packet cites — *and is not the `Bun_G` equivalence*.

Getting from `[*/G_b(E)]` to the actual stratum `Bun_G^b = [*/G̃_b]` is a separate step and the packet keeps it
separate, as the stage's completion contract demands: the kernel of `G̃_b → G_b(E)` is an iterated extension of
**positive** Banach–Colmez spaces, and pullback along a torsor under a positive (or negative) Banach–Colmez space
is fully faithful. Note *fully faithful*, not an equivalence.

Compact generation is then a stratum-by-stratum induction whose engine is the strict locality of the chart:
`RΓ(M̃_b, A) = A_0`, proved from Theorem IV.5.3 of VS0. An object is compact exactly when its restriction to
every stratum is compact **and zero for almost all `b`** — drop the second half and `!`-extension from infinitely
many strata breaks compactness.

**Coverage: `partial`.** The classifying-stack equivalence, the Banach-Colmez contractibility lemma, the stratum comparison, the strict locality of the chart and the compact generation theorem with its characterisation of compact objects. RS-05 narrows this layer: the smooth abelian carrier, the derived extension and compact induction are imported from SmoothRepresentationsOfLocalGroups:SR.0:abelian-category, SR.0:derived-extension and SR.2, and only the geometric argument is planned here. Section V.3, which builds the charts, is not read and is requested from BunGAndNewtonStrata:BG4.

Remaining in this layer:

- Section V.3 (local charts: Definition V.3.2, Propositions V.3.5, V.3.6, Theorem V.3.7) was NOT read; it supplies M_b, M-tilde_b and the cohomologically smooth chart pi_b : M_b -> Bun_G on which V.4 depends.
- Proposition III.5.1 (the description of the kernel of G-tilde_b -> G_b(E) as an iterated positive Banach-Colmez extension), used in the proof of V.2.2, was not read.
- Propositions VII.7.2-VII.7.5 (lisse localization triangles, Harder-Narasimhan semiorthogonal decomposition, lisse compact generation) were located but their proofs were not read.
- ECD Theorem 1.13, Propositions 12.9, 14.11, 14.16, 20.17 and Stacks 0719 are imported and none was read.

### `classifying-stack-equivalence` — FS V.1.1: D_et([*/G],Lambda) is the derived category of smooth G-representations

*theorem.* **Planet: Sheaves on a classifying stack.**

**Statement.** Let G be a locally pro-p group and Lambda a ring with n Lambda = 0 for some n prime to p. There is a natural symmetric monoidal equivalence D(G,Lambda) -> D_et([*/G],Lambda) under which the forgetful functor D(G,Lambda) -> D(Lambda) corresponds to pullback along * -> [*/G]. The same holds after base change to [Spa C/G] for any complete algebraically closed C/k, and the base-change functor D_et([*/G],Lambda) -> D_et([Spa C/G],Lambda) is an equivalence.

**Hypotheses that must not be dropped.**

- G LOCALLY PRO-P is essential; the argument reduces to G pro-p, where there is no continuous group cohomology on Lambda-modules because n Lambda = 0 with n prime to p
- n Lambda = 0 with n prime to p is essential for the same reason
- The construction of the functor uses that |S x A| = |S| x A for a perfectoid space S and a locally profinite set A, so that |X-tilde| carries a continuous G-action, and that v-covers induce quotient maps (ECD Prop. 12.9)
- Left-completeness of both sides (ECD Prop. 14.11 and Stacks 0719) is used to reduce to bounded-below complexes

**Proof outline.**

1. Send a smooth G-representation V to the v-sheaf F_V taking (X, G-torsor X-tilde -> X) to the continuous G-equivariant maps |X-tilde| -> V; check that its pullback to * is V, that this is a disjoint union of points, hence an etale sheaf, so F_V lies in D_et([*/G],Lambda).
2. Lemma V.1.2: for X = [Spa C/G], X_et is equivalent to the category of discrete G-sets via S -> [S x Spa C/G].
3. Lemma V.1.3: smooth G-representations are equivalent to sheaves of Lambda-modules on G-Set, via V -> (S -> continuous G-equivariant maps S -> V), with inverse F -> colim_H F(G/H).
4. Reduce fully faithfulness and essential surjectivity of D([Spa C/G]_et,Lambda) -> D_et([Spa C/G],Lambda) to G pro-p (both are local on the etale site).
5. For G pro-p the etale site has local cohomological dimension 0, so D([Spa C/G]_et,Lambda) is left-complete; compute RGamma([Spa C/G]_v, V) = V^G by the Cech nerve of Spa C -> [Spa C/G], which gives the continuous-cochain complex.
6. Essential surjectivity on the heart: a v-sheaf whose pullback to Spa C is etale is a disjoint union of points there, hence itself etale over [Spa C/G].

**Acceptance.**

- Check the theorem for G = Z_p and Lambda = F_l with l != p, i.e. that derived Z_p-invariants are just invariants
- Check that the statement fails for l = p
- Check that pullback along * -> [*/G] is the forgetful functor and not a fixed-point functor

**Prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `mathlib:Representation`, `mathlib:CategoryTheory.Equivalence`, `mathlib:DerivedCategory`, `tauceti:TauCeti.IsSmoothDiscrete`, `tauceti:TauCeti.SmoothDiscreteTopRep`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem V.1.1, printed p. 168.

  > Let D(G,Lambda) be the derived category of the category of smooth representations of G on Lambda-modules. There is a natural symmetric monoidal equivalence D(G,Lambda) = D_et([*/G],Lambda) under which the functor D(G,Lambda) -> D(Lambda) forgetting the G-action gets identified with the pullback functor D_et([*/G],Lambda) -> D_et(*,Lambda) = D(Lambda).

  Exact statement, including the identification of the forgetful functor with pullback.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Theorem V.1.1, printed p. 170.

  > Thus, we can assume that G is pro-p. Note that ([Spa C/G]_et, Lambda) is locally of cohomological dimension 0, as there is no continuous group cohomology of pro-p-groups on Lambda-modules if n Lambda = 0 for n prime to p.

  The step where the locally-pro-p and prime-to-p coefficient hypotheses are consumed.

### `contractibility-of-connected-banach-colmez-torsors` — FS V.2.1: pullback along a torsor under a positive or negative Banach-Colmez space is fully faithful

*lemma.*

**Statement.** Let f : S' -> S be a map of small v-stacks that is a torsor under BC(E) (resp. BC(E[1])) where E is a vector bundle on X_S everywhere of positive (resp. negative) slopes. Then f^* : D_et(S,Lambda) -> D_et(S',Lambda) is fully faithful.

**Hypotheses that must not be dropped.**

- E must be everywhere of positive slopes in the BC(E) case and everywhere of negative slopes in the BC(E[1]) case
- The problem is v-local on S by ECD Prop. 17.3 and Remark 17.4, so one may assume the torsor split
- The reduction to E = O_{X_S}(1/n) uses Corollary II.3.3(iv) PRO-ETALE LOCALLY on S and after replacing E by a direct sum with another bundle
- The case E = O(1/n) uses that BC(O(1/n)) is a one-dimensional perfectoid open unit ball (Prop. II.2.5(iv)), which requires the slope to be in the range covered by that statement

**Proof outline.**

1. Reduce v-locally to a split torsor; reduce by the exact sequence 0 -> O(1/2r)^{m'} -> O(1/r)^m -> E -> 0 to E = O(1/n).
2. For E = O(1/n), BC(E) is a perfectoid open unit ball, in particular cohomologically smooth; it suffices that Rf_! Rf^! A -> A is an equivalence.
3. Both Rf_! and Rf^! commute with base change (ECD Prop. 22.19, 23.12), so reduce to S = Spa(C,C^+) and to global sections; if the stalk of A at the closed point vanishes so does Rf_! Rf^! A; reduce to A constant, then to A = Lambda; conclude by the known cohomology of the perfectoid open unit disc.
4. The negative case follows from 0 -> E -> O(d)^m -> G -> 0 with d > 0 and the induced sequence of Banach-Colmez spaces.

**Acceptance.**

- Check full faithfulness explicitly for BC(O(1)) -> *
- Check that the positivity hypothesis is needed, e.g. that it fails for a slope-zero bundle
- Check that the conclusion is full faithfulness and not an equivalence

**Prerequisites.** `VectorBundlesAndIsocrystals:VB3:general-BC`, `VectorBundlesAndIsocrystals:VB4`, `mathlib:CategoryTheory.Functor.Faithful`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition V.2.1, printed p. 171.

  > Let f : S' -> S be a map of small v-stacks that is a torsor under BC(E) resp. BC(E[1]), where E is a vector bundle on X_S that is everywhere of positive (resp. negative) slopes. Then the pullback functor f^* : D_et(S,Lambda) -> D_et(S',Lambda) is fully faithful.

  Exact statement with the slope hypotheses.

### `strata-are-classifying-stacks` — FS V.2.2-V.2.3: the connected-kernel invariance on strata and independence of the base field

*theorem.* **Planet: Strata are classifying stacks.**

**Statement.** For every b in B(G) the map Bun_G^b = [*/G-tilde_b] -> [*/G_b(E)] induces by pullback an equivalence D(G_b(E),Lambda) = D_et([*/G_b(E)],Lambda) = D_et([*/G-tilde_b],Lambda), and D_et([*/G-tilde_b],Lambda) -> D_et([Spa C/G-tilde_b],Lambda) is an equivalence. Consequently, for any complete algebraically closed C and any locally closed substack U of Bun_G, D_et(U,Lambda) -> D_et(U x Spa C, Lambda) is an equivalence.

**Hypotheses that must not be dropped.**

- G-tilde_b is the automorphism group v-sheaf of the bundle E_b; the map to G_b(E) has kernel built from POSITIVE Banach-Colmez spaces, which is what makes V.2.1 applicable (via Proposition III.5.1)
- The argument is stated for b in B(G) and uses Theorem V.1.1 for the locally pro-p group G_b(E)
- Corollary V.2.3 is proved on quasicompact locally closed substacks, which are stratified into FINITELY many Bun_G^b, and uses compatibility of !-extension with base change to Spa C
- Full faithfulness of the base-change functor is ECD Theorem 1.13(ii)

**Proof outline.**

1. Reduce by ECD Thm 1.13 and Theorem V.1.1 to showing D_et([Spa C/G_b(E)],Lambda) -> D_et([Spa C/G-tilde_b],Lambda) is an equivalence.
2. For that it suffices that pullback along the section [Spa C/G_b(E)] -> [Spa C/G-tilde_b] is fully faithful, which follows from Proposition III.5.1 (describing the kernel as an iterated positive Banach-Colmez extension) together with Proposition V.2.1.
3. For Corollary V.2.3, check on quasicompact locally closed U, filter any object by !-extensions from the finitely many strata, and use V.2.2 on each graded piece.

**Acceptance.**

- Check the connected-kernel invariance separately from the classifying-stack equivalence, as the stage's completion contract requires
- Check the nonbasic GL_2 stratum
- Check independence of the base field on a nonquasicompact U

**Prerequisites.** `VStackSheavesAndLisseCategories:VS4/classifying-stack-equivalence`, `VStackSheavesAndLisseCategories:VS4/contractibility-of-connected-banach-colmez-torsors`, `BunGAndNewtonStrata:BG3`, `mathlib:Representation`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition V.2.2 and proof, printed p. 172.

  > For this, it is enough to prove that pullback under the section [Spa C/G_b(E)] -> [Spa C/G-tilde_b] induces a fully faithful functor D_et([Spa C/G-tilde_b],Lambda) -> D_et([Spa C/G_b(E)],Lambda), which follows from Proposition III.5.1 and Proposition V.2.1.

  Shows that the connected-kernel step is exactly the Banach-Colmez contractibility statement, and is logically separate from Theorem V.1.1.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Corollary V.2.3, printed p. 172.

  > For any complete algebraically closed nonarchimedean field C and any locally closed substack U in Bun_G, the functor D_et(U,Lambda) -> D_et(U x Spa C, Lambda) is an equivalence of categories.

  The base-field independence used later for Hecke operators.

### `strict-locality-of-the-chart` — FS V.4.2 and V.4.4: M-tilde_b behaves like a strictly local scheme

*theorem.* **Planet: Strict locality of the chart.**

**Statement.** For b in B(G) and A in D_et(M-tilde_b,Lambda) with stalk A_0 = i^* A at the closed point i : * inside M-tilde_b, the map RGamma(M-tilde_b, A) -> A_0 is an isomorphism; in particular RGamma(M-tilde_b, -) commutes with all direct sums. For K an open pro-p subgroup of G_b(E) and A in D_et(M-tilde_b/K, Lambda) with pullback corresponding to a complex V of smooth K-representations, RGamma(M-tilde_b/K, A) -> RGamma([*/K], A_0) = V^K is an isomorphism.

**Hypotheses that must not be dropped.**

- The proof applies Theorem IV.5.3 with X = M-tilde_b^circ and S = Spa k((t)); base change along S -> * is justified by smooth base change
- It uses that the partial compactification M-tilde_b^circ inside M-tilde_b is precisely a compactification towards ONE of the two ends of M-tilde_b^circ, as established by the Frobenius-action analysis in the proof of Proposition V.3.6
- Corollary V.4.4 follows formally by descent along psi : M-tilde_b -> M-tilde_b/K, writing any A as a direct summand of psi_* psi^* A; this uses exactness of K-invariants, i.e. K pro-p and prime-to-p coefficients

**Proof outline.**

1. Replace A by the cone of A -> i_* A_0 to reduce to A = j_! A' for A' on M-tilde_b^circ.
2. Apply Theorem IV.5.3 to conclude RGamma(M-tilde_b, j_! A') = 0.
3. Deduce Corollary V.4.4 by descent along the pro-p quotient.

**Acceptance.**

- Check the analogy of Remark V.4.3(i): RGamma(Spd k[[x_1,...,x_d]], A) = i^* A
- Check Remark V.4.5: i^* Rj_* A as a G_b(E)-representation is RGamma(M-tilde_b^circ, A)
- Check that the two ends of M-tilde_b^circ are correctly identified

**Prerequisites.** `VStackSheavesAndLisseCategories:VS0/partial-compactly-supported-vanishing`, `BunGAndNewtonStrata:BG4`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition V.4.2 and proof, printed p. 178.

  > But this follows from Theorem IV.5.3 (applied with X = M-tilde_b^circ and S = Spa k((t)), noting that base change along S -> * follows from smooth base change), using that the partial compactification M-tilde_b^circ in M-tilde_b is precisely a compactification towards one of the two ends of M-tilde_b^circ, as follows from the behaviour of the Frobenius action exhibited in the proof of ...

  The exact consumption of the partial-support vanishing theorem. The excerpt is truncated here; the full quotation is in data/decompositions/VStackSheavesAndLisseCategories.json, where the independent review checked it against the source.

### `compact-generation-and-compact-objects` — FS V.4.1 and VII.7.1/VII.7.4: compact generation of D_et(U,Lambda) and of D_lis(Bun_G,Lambda)

*theorem.* **Planet: Compact generation of D_et(Bun_G).**

**Statement.** For any locally closed substack U of Bun_G, D_et(U,Lambda) is compactly generated, and A is compact if and only if for all b in B(G) contained in U the restriction i_b^* A in D_et(Bun_G^b,Lambda) = D(G_b(E),Lambda) is compact and zero for almost all b; compactness in D(G_b(E),Lambda) is equivalent to lying in the thick triangulated subcategory generated by c-Ind_K^{G_b(E)} Lambda for K running over open pro-p subgroups. The same holds for D_lis(Bun_G,Lambda), where moreover D_lis(Bun_G^b,Lambda) = D_lis([*/G_b(E)],Lambda) = D(G_b(E),Lambda) with discrete Lambda-coefficients.

**Hypotheses that must not be dropped.**

- 'zero for almost all b' is part of the characterisation; without it !-extension from infinitely many strata would break compactness
- The proof exhibits the generators A_K^b = Rf_{K!} f_K^! Lambda for f_K : M-tilde_b/K -> Bun_G, K pro-p, and needs RGamma(M-tilde_b/K, -) to commute with direct sums (Corollary V.4.4)
- That j^* preserves compact objects uses that M-tilde_b^circ is a SPATIAL diamond of finite dim.trg (Propositions V.3.6 and V.3.5) and that K-invariants are exact
- In the lisse case, Proposition VII.7.1 needs s_sharp Lambda = Lambda for the cohomologically smooth surjection s : [*/G_b(E)] -> Bun_G^b whose fibres are successive extensions of positive Banach-Colmez spaces, plus the projection formula for s_sharp
- The identification of condensed G_b(E)-representations with smooth ones uses that G_b(E) is locally pro-p and that objects of D_lis(Spa C,Lambda) are discrete

**Proof outline.**

1. Reduce to quasicompact U and induct on the finitely many strata; for the inductive step show that j^* preserves compact objects and that !-extension from each stratum does.
2. On the stratum, the restriction of A_K^b is g_! g^! Lambda for g : [*/K] -> [*/G_b(E)] -> Bun_G^b, and g_{2!} g_2^! is the identity by V.2.2 while g_{1!} g_1^! Lambda gives c-Ind_K^{G_b(E)} Lambda.
3. Compactness of j^* A_K^b follows from RGamma(M-tilde_b^circ/K, -) commuting with direct sums, which holds since M-tilde_b^circ is spatial of finite dim.trg and K-invariants are exact.
4. In the lisse case: s_sharp Lambda = Lambda gives s_sharp s^* A = A hence full faithfulness; essential surjectivity by pullback along Bun_G^b -> [*/G_b(E)]; finally full faithfulness of D_lis([*/G_b(E)],Lambda) -> D_lis([Spa C/G_b(E)],Lambda) (VII.2.6), generation by c-Ind_K^{G_b(E)} Lambda, and the observation that a condensed G_b(E)-action on M tensor_{Z_l,disc} Z_l is smooth because K-orbits lie in compact submodules.

**Acceptance.**

- Check that an infinite direct sum tests compactness, as the stage's acceptance note requires
- Check that the compact generators are the same compact inductions as in the local-group roadmap
- Check the lisse statement with Lambda = Q_l

**Prerequisites.** `VStackSheavesAndLisseCategories:VS3/lisse-comparisons`, `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`, `VStackSheavesAndLisseCategories:VS4/strict-locality-of-the-chart`, `SmoothRepresentationsOfLocalGroups:SR.2`, `BunGAndNewtonStrata:BG2:smooth-Artin`, `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem V.4.1, printed p. 177.

  > An object A in D_et(U,Lambda) is compact if and only if for all b in B(G) contained in U, the restriction i_b^* A in D_et(Bun_G^b,Lambda) = D(G_b(E),Lambda) along i_b : Bun_G^b in Bun_G is compact, and zero for almost all b. Here, compactness in D(G_b(E),Lambda) is equivalent to lying in the thick triangulated subcategory generated by c-Ind_K^{G_b(E)} Lambda as K runs over open ...

  Exact characterisation including the finite-stratum-support condition. The excerpt is truncated here; the full quotation is in data/decompositions/VStackSheavesAndLisseCategories.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition VII.7.1, printed p. 271.

  > Recall that the map s : [*/G_b(E)] -> Bun_G^b is cohomologically smooth and surjective; in fact, its fibres are successive extensions of positive Banach-Colmez spaces. This implies that s_sharp Lambda = Lambda. This, in turn, implies by the projection formula for s_sharp that s_sharp s^* A = A for all A in D_solid(Bun_G^b,Lambda), thus giving fully faithfulness.

  The lisse-coefficient version of the connected-kernel invariance, with the exact mechanism (s_sharp Lambda = Lambda plus projection formula).

## VS5. Duality and admissible objects

Three theorems, all about compact or ULA objects on `Bun_G`.

Bernstein–Zelevinsky duality is defined by the adjunction `RHom(D_BZ(A),B) = π_♯(A ⊗^L B)`, is a contravariant
autoequivalence of the compact objects, and squares to the identity. Two things are recorded that a restatement
usually drops. `Rπ^!Λ ≅ Λ[0]` only after **fixing a Haar measure** on `G_b(E)` for every basic `b`; this is what
makes `π_♯ = Rπ_!`, and it is not canonical. And the comparison with the classical Bernstein–Zelevinsky involution
is claimed only at **basic** `b`. The involutivity proof invokes Theorem IV.5.3 a second time, so VS0's vanishing
theorem is consumed here as well as in VS4.

Verdier biduality is the statement that `j_!` and `Rj_*` may be **exchanged** in the duality formula — the
other direction is automatic and is not what the theorem says. Reflexivity is then stratumwise: `A` is reflexive
iff each `i_b^*A` is reflexive as a complex of admissible representations, meaning the complex of `K`-invariants
is reflexive for every open pro-`p` `K`.

And universal local acyclicity is exactly stratumwise admissibility, where **admissibility means perfectness of
the invariant complex `M_b^K`**, not finite-dimensionality of the individual cohomology groups. The stage text
says so and the source says so; the distinction is the point of the layer.

**Coverage: `partial`.** Bernstein-Zelevinsky duality on compact objects, the exchange of j_! and Rj_* under duality with the stratumwise reflexivity criterion, and the identification of universal local acyclicity with stratumwise perfectness of pro-p invariants. RS-05 keeps this layer and gives it the same three SmoothRepresentationsOfLocalGroups suppliers as VS4; the atlas has no stage edge into VS5 at all, which this packet records.

Remaining in this layer:

- Only the statements of Theorems V.5.1, V.6.1, V.6.2, V.7.1 and Proposition V.7.2, the footnotes to V.5.1, and partial proofs were read. The proof of V.5.1 on generators, the proof of Lemma V.6.3 and the final unwinding of V.7.1 were not fully read.
- Propositions VII.7.6 (lisse Bernstein-Zelevinsky), VII.7.7, Definition VII.7.8 and Propositions VII.7.9-VII.7.10 (the lisse versions of duality and ULA) were located but not read.
- The 'Hecke-use compatibility' and scalar-extension statements the stage text requires were not located in the passages read.

### `bernstein-zelevinsky-duality` — FS V.5.1: Bernstein-Zelevinsky duality on compact objects of D_et(Bun_G,Lambda)

*theorem.* **Planet: Bernstein-Zelevinsky duality.**

**Statement.** Write pi_sharp : D_et(Bun_G,Lambda) -> D(Lambda), A -> Rpi_!(A tensor^L Rpi^! Lambda), for the left adjoint of pi^*, pi : Bun_G -> * being the cohomologically smooth projection. For any compact A there is a unique compact D_BZ(A) with a functorial identification RHom(D_BZ(A), B) = pi_sharp(A tensor^L B) for all B. D_BZ is a contravariant autoequivalence of the compact objects and D_BZ^2 is naturally isomorphic to the identity. If A is concentrated on an open substack U then so is D_BZ(A); in particular D_BZ restricts to the usual Bernstein-Zelevinsky involution on compact objects of D(G_b(E),Lambda) for BASIC b.

**Hypotheses that must not be dropped.**

- The restriction to BASIC b in the last clause is essential: the identification with the classical Bernstein-Zelevinsky involution is claimed only there
- Rpi^! Lambda is isomorphic to Lambda[0] only after FIXING A HAAR MEASURE on G_b(E) for each basic b; Fargues-Scholze make this choice explicitly to get pi_sharp = Rpi_!
- The footnote justifying Rpi^! Lambda = Lambda uses that local systems concentrated in degree 0 on Bun_G embed fully faithfully into local systems on the semistable locus, which follows from purity and smoothness of all Harder-Narasimhan strata
- Uniqueness of D_BZ(A) is Yoneda; existence is checked on the generators g_K : [*/K] -> Bun_G for K pro-p
- The involutivity proof invokes Theorem IV.5.3 a second time (printed p. 181, via RGamma_c(M-tilde_b/K, Rj_{K*} A') = 0), so the partial-support vanishing of VS0 is consumed here as well as in VS4.

**Proof outline.**

1. Fix Haar measures on G_b(E) for all basic b to get Rpi^! Lambda = Lambda (at generic points, then by spreading out everywhere, noting both are invertible), and hence pi_sharp = Rpi_!.
2. Uniqueness is Yoneda. For existence it suffices to check on the generators A = Rg_{K!} Lambda for b in B(G) and K in G_b(E) pro-p, with g_K : [*/K] -> Bun_G factoring over [*/G_b(E)] -> Bun_G^b; these are, up to shift and twist, the sheaves on Bun_G^b corresponding to c-Ind_K^{G_b(E)} Lambda and are compact generators.
3. For such A, B -> pi_sharp(A tensor^L B) = R(pi o g_K)_! g_K^* B is B -> (i_b^* B)^K, using that for pro-p K the lower-! functor along [*/K] -> * agrees with the lower-* functor, i.e. with cohomology. By Corollary V.4.4 this agrees with RHom(A^b_K, B), so D_BZ(A) = A^b_K. The same computation shows that D_BZ preserves concentration on an open substack.
4. Involutivity: RHom(D_BZ(A),B) = pi_sharp(A tensor B) = pi_sharp(B tensor A) = RHom(D_BZ(B),A) gives a natural map D_BZ^2(A) -> A; it is an isomorphism over Bun_G^b on generators, and elsewhere one needs pi_sharp(A^b_K tensor^L B) = 0 for B = Rj_* B' with j : U -> Bun_G open not containing Bun_G^b, which reduces to RGamma_c(M-tilde_b/K, Rj_{K*} A') = 0 and hence again to Theorem IV.5.3 (with X = M-tilde_b^circ, S = Spa k((t))).
5. The comparison with the classical Bernstein-Zelevinsky involution follows by taking B the regular representation of G_b(E): then pi_sharp(A tensor B) is the underlying complex of A, and the second commuting G_b(E)-action gives the usual definition as RHom into the regular representation.
6. REVIEWER NOTE: the packet originally recorded that only the statement, the footnotes and the first lines of the proof had been read. The full proof is printed on p. 181 and was read during this review; the steps above follow it.

**Acceptance.**

- Check D_BZ on a compactly induced representation at a basic b against the classical involution
- Check that D_BZ preserves the open substack on which an object is concentrated
- Check the effect of changing the Haar measure

**Prerequisites.** `VStackSheavesAndLisseCategories:VS0/partial-compactly-supported-vanishing`, `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`, `SmoothRepresentationsOfLocalGroups:SR.2`, `mathlib:CategoryTheory.LeftRigidCategory`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem V.5.1, printed p. 180.

  > For any compact object A in D_et(Bun_G,Lambda), there is a unique compact object D_BZ(A) in D_et(Bun_G,Lambda) with a functorial identification RHom(D_BZ(A), B) = pi_sharp(A tensor^L_Lambda B) for B in D_et(Bun_G,Lambda). Moreover, the functor D_BZ is a contravariant autoequivalence of D_et(Bun_G,Lambda)^omega, and D_BZ^2 is naturally isomorphic to the identity.

  Exact statement with the compactness hypothesis.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Footnote 3 to Theorem V.5.1, printed p. 180.

  > The dualizing sheaf Rpi^! Lambda is, in fact, isomorphic to Lambda[0], by fixing a Haar measure on G_b(E) for each basic b in B(G), so pi_sharp is isomorphic to Rpi_!.

  Records the normalisation choice, which is not canonical and must be tracked.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem V.5.1 continued and its proof, printed p. 181.

  > If U in Bun_G is an open substack and A is concentrated on U, then so is D_BZ(A). In particular, D_BZ restricts to an autoequivalence of the compact objects in D_et(Bun_G^b,Lambda) = D(G_b(E),Lambda) for b in B(G) basic, and in that setting it is the usual Bernstein-Zelevinsky involution.

  The open-substack clause and the basic-b comparison asserted in the node statement; these are on p. 181, not p. 180, and the node previously had no source entry for them.

### `verdier-biduality-and-reflexivity` — FS V.6.1-V.6.2: exchange of j_! and Rj_* under duality, and the stratumwise criterion for reflexivity

*theorem.* **Planet: Verdier biduality on Bun_G.**

**Statement.** For j : V -> U an open immersion of open substacks of Bun_G and A in D_et(V,Lambda), the natural map j_! RHom_Lambda(A,Lambda) -> RHom_Lambda(Rj_* A, Lambda) is an isomorphism. Consequently, for U an open substack, A in D_et(U,Lambda) is reflexive (A -> RHom(RHom(A,D_U),D_U) is an equivalence) if and only if for every b in B(G) lying in U, the restriction i_b^* A in D(G_b(E),Lambda) is reflexive as a complex of admissible G_b(E)-representations, meaning that the complex of K-invariants is reflexive in D(Lambda) for all open pro-p K.

**Hypotheses that must not be dropped.**

- V.6.1 is the nonformal direction: Rj_* RHom(A,Lambda) = RHom(j_! A, Lambda) always holds; the theorem asserts the version with j_! and Rj_* EXCHANGED
- The proof reduces to quasicompact U and V = U \ {b} for b closed in |U|, and tests against the compact generators A_K^b = Rf_{K!} f_K^! Lambda, using RHom(A_K^b, B) = (i_b^* B)^K
- In V.6.2 one may replace D_U by Lambda, since this changes the dual only by a twist
- Reflexivity at a stratum is reflexivity of the K-invariant complexes for all open pro-p K, not a statement about individual cohomology groups
- Bun_G admits a dualizing complex D_{Bun_G} 'locally isomorphic to Lambda[0]' because it is a cohomologically smooth Artin stack of dimension 0 (stated on printed p. 182); in the reflexivity definition D_U may be replaced by Lambda, since this changes the dual only by a twist and leaves the bidual unchanged.

**Proof outline.**

1. V.6.1: reduce to U quasicompact and V = U minus a closed point b; the map is an isomorphism over V, so test after RHom(A_K^b, -) and compute both sides via (i_b^* -)^K.
2. V.6.2 follows from Lemma V.6.3, the natural isomorphism i_b^* RHom(RHom(A,Lambda),Lambda) = RHom(RHom(i_b^* A, Lambda), Lambda).
3. NOTE: the proofs of V.6.1 and V.6.3 were read only in outline; the detailed verification was not.

**Acceptance.**

- Check the exchange statement on a two-stratum quasicompact open of Bun_{GL_2}
- Check that reflexivity of each cohomology group is strictly weaker than reflexivity of the invariant complex
- Check the twist introduced by replacing D_U with Lambda

**Prerequisites.** `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `mathlib:CategoryTheory.Adjunction`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem V.6.1 and the remark after it, printed p. 182.

  > Note that one always has Rj_* RHom_Lambda(A,Lambda) = RHom_Lambda(j_! A, Lambda); the theorem asserts that this is also true with j_! and Rj_* exchanged, which is related to a local biduality statement.

  Isolates exactly what is new in the theorem.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem V.6.2, printed p. 182.

  > For any open substack U in Bun_G, an object A in D_et(U,Lambda) is reflexive, i.e. the natural map A -> RHom_Lambda(RHom_Lambda(A,D_U),D_U) is an equivalence, if and only if for all b in B(G) lying in U with corresponding locally closed stratum i_b : Bun_G^b -> U, the restriction i_b^* A in D_et(Bun_G^b,Lambda) = D_et([*/G-tilde_b],Lambda) = D_et([*/G_b(E)],Lambda) = D(G_b(E),Lambda) is ...

  The stratumwise criterion in terms of K-invariant complexes. The excerpt is truncated here; the full quotation is in data/decompositions/VStackSheavesAndLisseCategories.json, where the independent review checked it against the source.

### `ula-equals-admissibility` — FS V.7.1: ULA objects on Bun_G are exactly the stratumwise admissible ones

*theorem.* **Planet: ULA equals stratumwise admissibility.**

**Statement.** A in D_et(Bun_G,Lambda) is universally locally acyclic with respect to Bun_G -> * if and only if for every b in B(G) the pullback i_b^* A corresponds under D_et(Bun_G^b,Lambda) = D(G_b(E),Lambda) to a complex M_b of smooth G_b(E)-representations with M_b^K a PERFECT complex of Lambda-modules for every open pro-p subgroup K. Universally locally acyclic complexes are preserved by Verdier duality and satisfy Verdier biduality.

**Hypotheses that must not be dropped.**

- Admissibility here means PERFECTNESS of the invariant complex M_b^K, not finiteness of the individual cohomology groups
- The criterion used is Proposition IV.2.32, which requires Bun_G -> * to be cohomologically smooth (Theorem IV.1.19)
- The reduction to the exterior tensor product uses Proposition V.7.2: Bun_{G_1 x G_2} = Bun_{G_1} x Bun_{G_2}, the exterior products of compact objects are compact generators, and RHom(A_1,B_1) tensor^L RHom(A_2,B_2) -> RHom(A_1 box A_2, B_1 box B_2) is an isomorphism
- The identification uses pi_sharp and the adjunction RHom(A_1, RHom(A,Lambda)) = RHom(pi_sharp(A_1 tensor^L A), Lambda)

**Proof outline.**

1. By Proposition IV.2.32, ULA is equivalent to p_1^* RHom(A,Lambda) tensor^L p_2^* A -> RHom(p_1^* A, p_2^* A) being an isomorphism in D_et(Bun_G x Bun_G, Lambda) = D_et(Bun_{G x G}, Lambda).
2. By Proposition V.7.2 this is equivalent to being an isomorphism after applying RHom(A_1 box A_2, -) for varying compact A_i.
3. Rewrite both sides using V.7.2 and pi_sharp; the left side becomes RHom(pi_sharp(A_1 tensor^L A), Lambda) tensor^L RHom(A_2, A) and the right side RHom(p_1^*(A_1 tensor^L A), p_2^* RHom_Lambda(A_2, A)).
4. Unwinding on the generators A_i attached to pro-p subgroups gives exactly perfectness of the invariant complexes.
5. NOTE: the final unwinding was read only in part; the computation is recorded as partially verified.

**Acceptance.**

- Check that an admissible-but-not-perfect example (finite-dimensional cohomology groups with non-perfect invariant complex) is NOT ULA
- Check Verdier duality preservation on a compactly induced object
- Check the exterior-product statement V.7.2 on G_1 = G_2 = GL_1

**Prerequisites.** `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`, `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `BunGAndNewtonStrata:BG2:smooth-Artin`, `mathlib:Representation`, `mathlib:DerivedCategory`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Theorem V.7.1, printed p. 183.

  > Then A is universally locally acyclic with respect to Bun_G -> * if and only if for all b in B(G), the pullback i_b^* A to i_b : Bun_G^b in Bun_G corresponds under D_et(Bun_G^b,Lambda) = D(G_b(E),Lambda) to a complex M_b of smooth G_b(E)-representations for which M_b^K is a perfect complex of Lambda-modules for all open pro-p subgroups K in G_b(E).

  Exact statement; perfectness of M_b^K, not finite-dimensionality of cohomology.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition V.7.2, printed p. 183.

  > For all compact objects A_i in D_et(Bun_{G_i},Lambda), i = 1, 2, the exterior tensor product A_1 box A_2 in D_et(Bun_G,Lambda) is compact, these objects form a class of compact generators, and for all further objects B_i in D_et(Bun_{G_i},Lambda), i = 1, 2, the natural map RHom(A_1,B_1) tensor^L_Lambda RHom(A_2,B_2) -> RHom(A_1 box A_2, B_1 box B_2) is an isomorphism.

  The Kunneth-type input that makes the dualizability criterion checkable.

## Requests to other roadmaps

This roadmap is a consumer of six others and of the enhanced derived formalism. Each request names the
supplier stage and what exactly is needed from it.

- **`DiamondsAndVStacks:D4`** — Small v-stacks and locally spatial diamonds as a carrier, with atlas descent. RS-05 names this layer the canonical owner of the small v-stack carrier for VS0, and the Artin v-stack definition is a condition on an object of that carrier.
- **`DiamondsAndVStacks:D6`** — Diamondification and the equivalence of the analytic and diamond etale sites, which is what lets a perfectoid chart be used as an atlas and what the quasi-pro-etale basis of VS2's solid sheaves is expressed in.
- **`DiamondSixOperations:S1`** — Proper-support pushforward for quasicompact maps with its dimension estimate, and the proper base change used throughout IV.5 and IV.2; the constructibility condition in the definition of local acyclicity is a statement about R(f o j)_!.
- **`DiamondSixOperations:S2`** — The extension of the operations to non-quasicompact maps and to small v-stacks, which is what the partial compactly supported functors Rbeta_{!+} and Rbeta_{!-} of IV.5 are built on.
- **`DiamondSixOperations:S3`** — The exceptional inverse image for representable maps in the eligible class, with the formal identities. RS-05 names this layer the canonical owner of the diamond exceptional operations; the stacky Rf^! of VS0 is defined by descending it along charts, and Remark IV.1.14 limits exactly how far that descent is known to go.
- **`DiamondSixOperations:S4`** — Cohomological smoothness with its descent hypotheses, in particular that it is smooth-local on the source (ECD Proposition 23.13). RS-05 names this layer the canonical owner of diamond cohomological smoothness. Without that statement neither the stacky notion of VS0 nor the chart-independence of VS1's Definition IV.2.31 is well posed.
- **`DiamondSixOperations:S5`** — The worked examples, in particular the perfectoid open unit ball and its cohomology, which is the computation the Banach-Colmez contractibility lemma of VS4 reduces to, and the quotient examples that make [*/G] cohomologically smooth.
- **`EnhancedDerivedSheaves:E3`** — Coherent diagrams, Kan extensions and adjoint criteria. RS-05 names this layer the canonical owner of the generic presentability, cutoff and adjoint criteria that VS2 needs; the solidification is a Kan extension and the pinned Mathlib construction is literally Functor.rightKanExtension.
- **`EnhancedDerivedSheaves:E4`** — Derived adic completion, in which the Z-hat and Z_l coefficients of the solid formalism and the limit f_sharp Z_l = lim_m f_sharp Z/l^m Z are expressed.
- **`EnhancedDerivedSheaves:E5:presentability`** — Ind-completion and presentability at a cutoff cardinal. D_solid(X,Lambda) is not presentable at one universe but a large filtered colimit of presentable categories over uncountable strong limit cardinals, and the right adjoint of VII.6.3 exists only after that cutoff; this is the technical input VS3 cannot supply itself.
- **`RelativeFarguesFontaine:RF2`** — Untilts and divisors on the relative Fargues-Fontaine curve, the base over which the moduli of sections of the Jacobian criterion is taken.
- **`RelativeFarguesFontaine:RF3`** — Line bundles on the curve and the graded algebra, needed for the quasiprojectivity hypothesis of Theorem IV.4.2 and for the ampleness of O_{X_S}(1) that Remark IV.4.6 uses.
- **`VectorBundlesAndIsocrystals:VB1`** — Vector bundles on the curve with their descent and cohomology, since the Jacobian criterion is a condition on the pullback of the relative tangent bundle and its cohomology in degrees 0 and 1.
- **`VectorBundlesAndIsocrystals:VB3:general-BC`** — Banach-Colmez spaces BC(E) and BC(E[1]) for a general bundle, with the cohomological smoothness of the positive-slope ones. Proposition V.2.1 is a statement about torsors under these, and the atlas currently has an edge from this layer into VS1 but none into VS4, where the statement is actually used.
- **`VectorBundlesAndIsocrystals:VB4`** — Families of bundles and the Harder-Narasimhan stratification, which supplies the everywhere-positive-slope condition of Definition IV.4.1 and the finitely many strata used in Corollary V.2.3.
- **`AdicCoefficientsAndComparisons:L0`** — Adic coefficients in the sense of ECD Section 26, against which VII.6 compares ordinary, adic, solid and lisse coefficients; this packet plans the lisse comparisons of VII.6.4-VII.6.6 and not the adic formalism itself.
- **`AdicCoefficientsAndComparisons:L3`** — The characteristic-p cohomological comparison, needed for the torsion case of Proposition VII.6.6 where D_lis and D_et agree under a bounded cohomological dimension hypothesis.
- **`SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`** — The abelian category of smooth representations of a locally profinite group over a ring. RS-05 narrows VS4 onto this supplier: the classifying-stack theorem identifies D_et([*/G],Lambda) with the derived category of this category, and this packet proves the identification rather than rebuilding the category.
- **`SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`** — The derived extension of that category, so that D(G,Lambda) in Theorem V.1.1 and in the stratumwise criteria of VS5 is a supplied object. RS-05 names it a canonical supplier of both VS4 and VS5.
- **`SmoothRepresentationsOfLocalGroups:SR.2`** — Compact induction c-Ind_K^G and its adjunctions. The compact objects of D_et(Bun_G,Lambda) are characterised as the thick subcategory generated by the c-Ind_K^{G_b(E)} Lambda for open pro-p K, and the roadmap requires these to be the same objects as in the local-group roadmap.
- **`BunGAndNewtonStrata:BG2:smooth-Artin`** — That Bun_G is a cohomologically smooth Artin v-stack with l-dimension 0 (Theorem IV.1.19 and Proposition IV.1.22). VS5's criterion IV.2.32 needs the smoothness, and RS-05's note on VS5 says the dimension-zero statement is a proved prerequisite; the atlas has an edge from this layer into VS4 but none into VS5.
- **`BunGAndNewtonStrata:BG3`** — The basic and nonbasic strata, the automorphism v-sheaf G-tilde_b and Proposition III.5.1, which describes the kernel of G-tilde_b -> G_b(E) as an iterated extension of positive Banach-Colmez spaces. That description is what makes the contractibility lemma applicable in Proposition V.2.2.
- **`BunGAndNewtonStrata:BG4`** — The local charts M_b and M-tilde_b of Fargues-Scholze V.3, with Theorem V.3.7 and the spatiality and Frobenius analysis of Propositions V.3.5 and V.3.6. The decomposition records V.3 as entirely unread, and every statement of VS4's strict-locality node rests on it.

## Gaps

### FS IV.3, IV.4 body, IV.6 and IV.7 are unread; VS1 rests on their statements only

The VS1 stage text asks for the formal-smoothness theory (IV.3), the Jacobian criterion proof (IV.4), hyperbolic localization with its equivariance and boundedness hypotheses (IV.6), and Drinfeld's lemma with the separation of partial Frobenius descent from a fundamental-group product claim (IV.7). Of these, only Definition IV.4.1, the statement of Theorem IV.4.2, Remarks IV.4.3-IV.4.6, Example IV.4.7 and the summary paragraph of the deformation-to-the-normal-cone argument on printed p. 151 were read. Sections IV.3, IV.6 and IV.7 were NOT opened at all. NEXT SOURCE ACTION: read FS printed pp. 130-133 (IV.3), pp. 135-151 (IV.4 body: Definitions IV.4.8, IV.4.11, IV.4.20, Propositions IV.4.9-IV.4.19, IV.4.29), pp. 155-164 (IV.6) and pp. 164-166 (IV.7). Until then the Jacobian criterion is recorded as a read STATEMENT with an unread proof, and hyperbolic localization and Drinfeld's lemma are not_read inputs, not input packages. Note also FS's own caveat in the chapter introduction: 'The theme here is the idea pi_1((Div^1)^I) = W_E^I. Unfortunately, we know no definition of pi_1 making this true' - the stage text's warning about an 'arbitrary fundamental-group product claim' is confirmed by the source.

### FS VII.2-VII.5 unread: the solid four/five operations are taken from the chapter summary

The statements that f^* has a right adjoint Rf_* commuting with base change, that RHom commutes with base change, that f_sharp exists for ALL f and commutes with base change and satisfies the projection formula, that f_sharp and Rf_* are related for 'proper and smooth' f, and that Proposition VII.5.2 gives f_sharp Lambda = Rf_! Rf^! Lambda, were read only in FS's own chapter-introduction summary (printed pp. 243-245) and in citations inside VII.6. Sections VII.2, VII.3, VII.4, VII.5 were not opened. Three downstream proofs read here (VII.6.5, VII.6.6, VII.7.1) invoke VII.5.2 directly. NEXT SOURCE ACTION: read FS printed pp. 252-268 (VII.2-VII.5), in particular Proposition VII.2.4, the construction of f_sharp in VII.3, and Proposition VII.5.2. Recorded as an unresolved boundary, not as an input package.

### The proof of the Clausen-Scholze solidity structure theorem was not read

Theorem 5.8 of Scholze's Lectures on Condensed Mathematics (printed pp. 35-36) was read as a STATEMENT, together with the abstract Lemma 5.9 it is deduced from. Its proof occupies Lecture VI (printed p. 37 onward: 'The goal of this lecture is to finish the proof of Theorem 5.8') and was not read; neither was Proposition 5.7 (that Z[S]_solid is itself solid), whose statement only was read. The stage text asks specifically for 'the missing solidification universal property, derived solid tensor/Hom and the generators/exactness needed for FS VII.1'; of these only the universal property (Definition 5.1) and the generators (Theorem 5.8(i)) have been read. NEXT SOURCE ACTION: read Lectures VI and VII of Scholze_CondensedMathematics.pdf (printed pp. 37-50), including Corollary 6.1(iv) which is what makes the internal-RHom version of Definition 5.1(iii) automatic, Theorem 6.2, and the analytic-ring material (Proposition 7.5) for the relative theory.

### FS V.3 unread: the charts M_b and M-tilde_b are used without their construction

Proposition V.4.2 and Theorem V.4.1 both rest on Section V.3 (printed pp. 173-177): Definition V.3.2 of the moduli stack M of filtered G-bundles, Propositions V.3.5 and V.3.6 (spatiality and finite dim.trg of M-tilde_b^circ, and the Frobenius-action analysis identifying the two ends), and Theorem V.3.7 (pi_b : M_b -> Bun_G is partially proper, representable in locally spatial diamonds and cohomologically smooth). None of these was read. They are the 'more refined charts' that Remark IV.1.21 says are needed because the Beauville-Laszlo charts of Theorem IV.1.19 are not adapted to studying D_et(Bun_G,Lambda). NEXT SOURCE ACTION: read FS printed pp. 173-177. Note that the Bun_G side belongs to BunGAndNewtonStrata (EXT-04's roadmap), so this may also be a cross-job supplier question.

### Bun_G-side inputs are owned by another roadmap

Theorem IV.1.19 (Bun_G is a cohomologically smooth Artin v-stack of l-dimension 0, with the Beauville-Laszlo cover), Proposition IV.1.22 (Bun_G^b is cohomologically smooth of l-dimension -<2rho,nu_b>), Corollary IV.1.23 (Kottwitz map is a bijection on pi_0) and Proposition III.5.1 (the structure of G-tilde_b) were read (IV.1.19, IV.1.22, IV.1.23) or located (III.5.1) here, but they are stage content of BunGAndNewtonStrata, which is assigned to EXT-04, not to this job. They are recorded here only as consumed inputs with their exact locators; no node for them was created in this packet, to avoid duplicating another worker's stage. Cohomological smoothness of Bun_G -> * is what Proposition IV.2.32 needs in the proof of Theorem V.7.1, so this is a live cross-job dependency.

### The pinned Mathlib already contains the solidity predicate and the solidification, and says its own definition is wrong for a general ring

Mathlib at the pinned commit 082e2d3 has Mathlib/Condensed/Solid.lean, containing Condensed.finFree, Condensed.profiniteFree, Condensed.profiniteSolid (the right Kan extension of the free functor on finite sets along FintypeCat.toProfinite), Condensed.profiniteSolidCounit, Condensed.profiniteSolidIsPointwiseRightKanExtension, Condensed.profiniteSolidification and the class CondensedMod.IsSolid. The file was read at the pinned commit in this session. Two things follow and both cut against a naive plan for VS2. First, the free solid module on a profinite set and the solidity predicate over the integers are already there, so VS2 must not plan them again; the roadmap text already says as much and this packet's baseline now cites the exact declarations. Second, the file's own docstring says: 'TODO: This is not the correct definition of solid R-modules for a general R. The correct one is as follows: Use this to define solid modules over a finite type Z-algebra R. In particular this gives a definition of solid modules over Z[X] (polynomials in one variable). Then a solid R-module over a general ring R is the condition that for every r in R and every ring homomorphism Z[X] -> R such that X maps to r, the underlying Z[X]-module is solid.' The same file carries two further TODOs, that ((profiniteSolid Z).obj S).IsSolid and its mod p analogue are unproved. So the pinned predicate has, at the pinned commit, no proved nonempty instance, and Proposition 5.7 of the source is exactly the missing statement. A reviewer should check that VS2's node reuses the pinned predicate only over Z and over finite-type Z-algebras and owns the corrected general-ring definition, which is what the node and its unit tests now say.

### Two supplier edges the atlas does not have: Banach-Colmez geometry into VS4, and Bun_G smoothness into VS5

The stage edges of data/atlas.json into this roadmap, together with the changes of the accepted restructuring RS-05, give VS4 the suppliers BunGAndNewtonStrata:BG2:smooth-Artin, BG3, BG4 and the three SmoothRepresentationsOfLocalGroups components, and give VS5 only the three SmoothRepresentationsOfLocalGroups components. Two statements decomposed here use more than that. Proposition V.2.1, the contractibility of torsors under a positive or negative Banach-Colmez space, is a VS4 node and consumes VectorBundlesAndIsocrystals:VB3, which the atlas links only into VS1. Theorem V.7.1 and the criterion IV.2.32 it uses are VS5 nodes and consume the cohomological smoothness of Bun_G, that is BunGAndNewtonStrata:BG2:smooth-Artin, which the atlas links only into VS4; RS-05's own note on VS5 says 'Bun_G dimension zero is a proved prerequisite'. Both are filed as requests in this packet, but a link job should add the two stage edges, since a request is a note and an edge is what the atlas draws.

## Structural proposals

### VS1 asks for four separate bodies of mathematics and should be divided (`split-layer`)

The stage text of VS1 asks for the universally locally acyclic formalism of Fargues-Scholze IV.2, the formal smoothness theory of IV.3 with the Jacobian criterion of IV.4, hyperbolic localization with Braden's theorem in IV.6, and Drinfeld's lemma with partial Frobenius descent in IV.7. These are four independent developments with different consumers: the ULA formalism is consumed by VS5 and by geometric Satake, the Jacobian criterion by the construction of charts, hyperbolic localization by the Satake equivalence, and Drinfeld's lemma by the Weil-group action on the spectral side. The reviewed decomposition covers only the first and the statement of the second; IV.3, IV.6 and IV.7 were not opened at all, and its own gap list says so. Keeping them in one layer means the layer can never be closed and that a reader of the atlas cannot see which part is planned. Dividing VS1 into a ULA layer, a smoothness-criterion layer and a localization-and-Frobenius layer would let the first be finished while the others stay open, and would let the consumers name the part they actually use.

### VS2's condensed half is largely already in the pinned library and the layer should say so in its own text (`narrow-layer`)

The first paragraph of VS2's stage text is a work plan against Mathlib rather than a mathematical statement, and its description of what the library has is now out of date in one direction and right in another. At the pinned commit Mathlib/Condensed/Solid.lean already supplies the free solid module on a profinite set as a right Kan extension (Condensed.profiniteSolid), the solidification map (Condensed.profiniteSolidification) and the solidity predicate (CondensedMod.IsSolid); the stage text's warning that the predicate's general-ring definition is restricted is confirmed verbatim by the file's own docstring. What is genuinely missing is the structure theorem, the solidity of the free solid objects, the corrected general-ring definition, the derived solid tensor and Hom, and the whole sheaf-level formalism of FS VII. Narrowing VS2's text to those, and citing the pinned declarations for the rest, would stop the layer from reading as though the condensed foundations had to be built here, and would make the boundary with EnhancedDerivedSheaves, which RS-05 has just sharpened by naming E3 the owner of the cutoff and adjoint criteria, visible in the text as well as in the link graph.

## Planets

At most six per layer; only definitions, constructions and named theorems.

| layer | planets |
| --- | --- |
| `VS0` | Artin v-stack; Shriek pullback for smooth stacky maps; Partial-support vanishing towards one end |
| `VS1` | Universal local acyclicity; ULA is smooth-local on the source; ULA as left-adjointness; ULA for Artin v-stacks; The Jacobian criterion |
| `VS2` | Solid abelian groups; Solid sheaves on a v-stack |
| `VS3` | The lisse category D_lis |
| `VS4` | Sheaves on a classifying stack; Strata are classifying stacks; Strict locality of the chart; Compact generation of D_et(Bun_G) |
| `VS5` | Bernstein-Zelevinsky duality; Verdier biduality on Bun_G; ULA equals stratumwise admissibility |

## Nothing here is formalised

No Lean was compiled for this job and no statement in this packet is claimed to be formalised. The suggested
file is a set of signatures whose only proof is `sorry`; every `implementationStatus` is `unchecked`.
