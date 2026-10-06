# Six operations, cohomological smoothness and biduality

This roadmap develops ECD §§22–25 (Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4): the
exceptional direct image Rf_! and its right adjoint Rf^! for the eligible maps of small v-stacks, the
theory of ℓ-cohomologically smooth maps with their invertible dualizing complexes, the basic
examples (the perfectoid ball, profinite quotients, smooth analytic maps, Spd ℚ_p), and biduality
and conservativity of Verdier duality over a geometric point Spa(C, O_C). It continues the
four-operation theory of DiamondEtaleCohomology and is the owner, by the accepted restructuring
RS-05, of the diamond exceptional operations in the eligible class (S3) and of diamond cohomological
smoothness (S4); the stacky operations on Artin v-stacks are VStackSheavesAndLisseCategories VS0's
and import these.

## Conventions

- p is a fixed prime and Perf is the site of characteristic-p perfectoid spaces; all v-stacks are on
  Perf. * = Spd F_p is the final v-sheaf. Small v-sheaves and small v-stacks are those of
  DiamondsAndVStacks D4; spatial and locally spatial diamonds and representability in them are D5's.
- D_ét(Y, Λ) is the enhanced (stable ∞-categorical) étale category of DiamondEtaleCohomology C2,
  with the operations f^*, Rf_*, ⊗^L and RHom of C3; statements are made at the enhanced level and
  then on homotopy categories. Λ is a commutative ring; throughout §22 nΛ = 0 for an integer n prime
  to p, and statements about smoothness use a prime ℓ ≠ p and F_ℓ or ℓ-power-torsion coefficients.
- A map is *eligible* if it is compactifiable, representable in locally spatial diamonds and of
  locally finite dim.trg (S0/eligible-morphism); *spatial-eligible* if compactifiable, representable
  in spatial diamonds and of globally finite dim.trg (S0/spatial-eligible-morphism). Rf_! and Rf^! are
  defined exactly on eligible maps, and every statement that mentions Rf^! carries the eligibility
  hypotheses of f, including the exchange formula of ECD 23.16(iii), whose printed statement omits
  them.
- The canonical compactification (Y′)‾^{/Y} of a separated map is DiamondEtaleCohomology C4's (ECD
  18.6); it is not assumed spatial. The canonical factorisation of a compactifiable map is
  Y′ → (Y′)‾^{/Y} → Y.
- dim.trg is DiamondEtaleCohomology C8's geometric transcendence dimension, with the modified
  invariant tr.c̃; local finiteness and a global bound are kept apart.
- Tate twists Λ(d) are S5/tate-twist's; the dualizing complex is D_f = Rf^!Λ.
- Corrections of ECD's text recorded by the paper extraction PAPER-SCHOLZE-17 (E53, E64–E69, E72,
  E94, E98–E101) are applied in the statements below; new findings are listed at the end.

## Boundaries and imports

DiamondEtaleCohomology supplies the sites and D_ét (C0, C2), the four operations and Proposition
17.6 (C3), properness, partial properness and the canonical compactification (C4), extension by zero
for étale maps and proper base change (C5), base-field invariance (C6), constructible and
perfect-constructible sheaves (C7), dimensions and cohomological bounds (C8) and compact generation
(C9). EnhancedDerivedSheaves supplies coCartesian fibrations, hypercovers, left Kan extensions, the
adjoint functor theorem and Neeman's criterion (E0, E2, E3). DiamondsAndVStacks supplies the
geometry (D1–D6). ClassicalAdicEtaleCohomology supplies Huber's trace, duality and constructibility
(H3–H4) and the curve compactification used in biduality (H5). AdicEtaleGeometry A2 supplies
relative balls, tori and smooth morphisms by ball charts. PerfectoidSpaces P1 supplies the
perfectoid fields and tori of §24, and the Tau Ceti roadmap ProfiniteProPGroups (Layer 1) the
supernatural order used to normalise Haar measures. Nothing of these is planned again here.

What this roadmap does not contain: the operations for maps of Artin v-stacks that are not
representable in locally spatial diamonds (VStackSheavesAndLisseCategories VS0), universal local
acyclicity (VS1), solid and lisse coefficients (VS2–VS3), and ℓ-adic coefficients (AdicCoefficients
AndComparisons L0). ECD's Question 24.7 (regular ℤ_p-algebras) is not a target.

## Sources

Peter Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4 (14 April 2026, final version to
appear in Astérisque), https://arxiv.org/abs/1709.07343v4, SHA-256
78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc; §§22–25 read in full, with the
statements of §§17–21 that the proofs cite. Printed page numbers equal PDF page numbers.

## S0. Compactifiable morphisms

The layer defines compactifiable morphisms and proves every part of ECD Proposition 22.3. Source
descent 22.3(vii) is stated with the local-splitting hypothesis stored as the predicate
S0/locally-split-map: the older version without it is false, and a universally open or
cohomologically smooth cover is not, by definition, evidence for it. The layer also packages the two
domains of the exceptional operations: eligible maps (local dim.trg bounds) and spatial-eligible
maps (one global bound), with their closure properties; cancellation keeps its extra
representability and dimension hypotheses. Supplier stages: DiamondEtaleCohomology C4 (canonical
compactification), DiamondsAndVStacks D3–D5, DiamondEtaleCohomology C8 (dim.trg).

Planets of this layer: Compactifiable morphism (`S0/compactifiable-morphism`); Canonical
factorisation of a compactifiable map (`S0/compactifiable-iff-separated-open`); Eligible morphism
(`S0/eligible-morphism`).

Other roadmaps' stages used (requested): `DiamondEtaleCohomology:C4`.

Other roadmaps' declarations and nodes used: `DiamondEtaleCohomology:C8/diamond-dim-base-change`,
`DiamondEtaleCohomology:C8/diamond-dim-composition`, `DiamondEtaleCohomology:C8/diamond-dim-trg`,
`DiamondEtaleCohomology:C8/locally-finite-dim-trg`,
`DiamondsAndVStacks:D1/strictly-totally-disconnected`,
`DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`,
`DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`,
`DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces`,
`DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`,
`DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`,
`DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`,
`DiamondsAndVStacks:D5/relative-representability`.

Acceptance tests of the layer: a finite étale map; an open immersion whose canonical
compactification is not spatial; the generic-point inclusion Spa(C, O_C) → Spa(C, C⁺) with
compactification Spa(C, C⁺); the doubled-origin ball as a non-separated, non-compactifiable étale
map; the field extension Spa(C′, O_C′) → Spa(C, O_C) as a v-cover that is not locally split.

### `S0/compactifiable-morphism` — Compactifiable morphisms of v-stacks ★


A morphism f : Y′ → Y of v-stacks is compactifiable if there are a v-stack Z, an open immersion j :
Y′ → Z and a partially proper morphism g : Z → Y with f = g ∘ j. Open immersions are those of
DiamondsAndVStacks D3 (every pullback to a perfectoid space is representable by an open immersion);
partially proper morphisms are those of ECD Definition 18.4 (separated, with unique lifts from
Spa(R, R°) to Spa(R, R⁺) for perfectoid Tate R and open integrally closed R⁺), owned by
DiamondEtaleCohomology C4. No quasicompactness, representability or dimension condition is part of
the definition; those enter only through the eligible classes (S0/eligible-morphism,
S0/spatial-eligible-morphism). The factorisation is not part of the data: by
S0/compactifiable-iff-separated-open there is a canonical one, through the canonical
compactification of C4.

**Hypotheses.**

- f a morphism of v-stacks on Perf (characteristic-p perfectoid spaces); no smallness assumption.
- Open immersion and partially proper are the supplier notions of DiamondsAndVStacks D3 and
  DiamondEtaleCohomology C4 (ECD Definitions 10.7 and 18.4), used without change.

**Construction and proof.**

1. Define IsCompactifiable f as the existence of (Z, j, g) with j an open immersion, g partially
proper and g ∘ j = f.
2. Open immersions and partially proper maps are separated (D3, C4), so a compactifiable map is
separated (composites of separated maps are separated, D3).
3. Proper maps are partially proper (ECD 18.3 with 18.9, owned by C4) and open immersions are
compactifiable with g the identity; both are recorded as constructors.

Proposed declaration: `IsCompactifiable` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `IsCompactifiable.mk` | constructor | If j : Y′ → Z is an open immersion and g : Z → Y is partially proper then g ∘ j is compactifiable. |
| `IsCompactifiable.of_isOpenImmersion` | constructor | Every open immersion is compactifiable (take g the identity, which is partially proper). |
| `IsCompactifiable.of_isPartiallyProper` | constructor | Every partially proper morphism, in particular every proper morphism, is compactifiable (take j the identity). |
| `IsCompactifiable.isSeparated` | projection | A compactifiable morphism is separated. |
| `isCompactifiable_iff` | characterisation | f is compactifiable iff f is separated and the natural map Y′ → (Y′)‾^{/Y} into the canonical compactification of C4 is an open immersion (S0/compactifiable-iff-separated-open). |
| `IsCompactifiable.baseChange` | functoriality | Compactifiability is stable under base change along any map of v-stacks (S0/compactifiable-base-change). |
| `IsCompactifiable.comp` | structure | A composite of compactifiable morphisms is compactifiable (S0/compactifiable-composition). |
| `IsCompactifiable.of_separated_etale` | compatibility | A separated étale morphism (D3) is compactifiable (S0/separated-etale-compactifiable). |

**Used by.**

- ECD Definitions 22.4, 22.13 and 22.18: the domain of the exceptional direct image Rf_! is a class
  of compactifiable maps.
- ECD Definition 23.8: ℓ-cohomological smoothness requires f compactifiable.
- ECD Propositions 24.2–24.4 (proofs): quotient maps and smooth analytic maps are shown
  compactifiable via Proposition 22.3.
- VStackSheavesAndLisseCategories:VS0 (Fargues–Scholze IV.1): charts of Artin v-stacks are separated
  cohomologically smooth, hence compactifiable, maps.
- AdicCoefficientsAndComparisons:L3–L4 (ECD 27.4–27.5): the scheme-to-diamond comparison of Rf_!
  needs the diamond map compactifiable.

**Unit tests.**

- `IsCompactifiable.id` (degenerate): For every v-stack Y, the identity of Y is compactifiable.
- `IsCompactifiable.generic_point_inclusion` (computation): For C complete algebraically closed and
  C⁺ ⊊ O_C an open bounded valuation subring, j : Spa(C, O_C) → Spa(C, C⁺) is a compactifiable open
  immersion and its canonical compactification over Spa(C, C⁺) is the identity of Spa(C, C⁺): every
  map Spa(R, R°) → Spa(C, C⁺) factors through Spa(C, O_C).
- `not_isCompactifiable_doubled_origin` (non-example): Let B be the perfectoid closed unit ball over
  Spa(C, O_C) and Y′ = B ⊔_{B∖{0}} B the ball with doubled origin (two copies glued along the open
  complement of the origin). The map Y′ → B is étale and surjective but not separated, so it is not
  compactifiable.
- `IsCompactifiable.proper` (characterisation): A proper map of v-stacks (quasicompact, separated,
  universally closed; ECD 18.1) is compactifiable with canonical compactification itself.

**Acceptance.** The identity, open immersions, proper maps and separated étale maps are
compactifiable; the doubled-origin ball over the ball is not (it is not separated).

**Depends on** elsewhere `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`,
`DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S0/compactifiable-iff-separated-open`, `S0/eligible-morphism`,
`S0/spatial-eligible-morphism`, `S4/smooth-descent-along-smooth-surjection`.

**Source.** ECD Definition 22.2, p. 128: “A morphism f : Y ′ → Y of v-stacks is compactifiable if it
can be written as a composite of an open immersion and a partially proper morphism.”; ECD §22, after
Definition 22.2, p. 128: “A key difference to the world of schemes is the presence of a canonical
compactification.”

### `S0/compactifiable-iff-separated-open` — Compactifiability through the canonical compactification ★


Let f : Y′ → Y be a morphism of v-stacks, and when f is separated let (Y′)‾^{/Y} → Y be its
canonical compactification (DiamondEtaleCohomology C4, ECD Proposition 18.6) with the natural map Y′
→ (Y′)‾^{/Y}. Then f is compactifiable if and only if f is separated and Y′ → (Y′)‾^{/Y} is an open
immersion. In that case f = f‾ ∘ j with j : Y′ → (Y′)‾^{/Y} the open immersion and f‾ : (Y′)‾^{/Y} →
Y partially proper; this is the canonical factorisation used to define Rf_!.

**Hypotheses.**

- f a morphism of v-stacks; the canonical compactification exists for separated f (C4).

**Construction and proof.**

1. (⇐) The map (Y′)‾^{/Y} → Y is partially proper (C4, ECD Corollary 18.8(i)), so Y′ → (Y′)‾^{/Y} →
Y exhibits f as compactifiable.
2. (⇒) Let Y′ → Z → Y be an open immersion followed by a partially proper map. Open immersions and
partially proper maps are separated (D3, C4), so f is separated.
3. By the universal property of the canonical compactification (C4, ECD 18.6) the open immersion
extends uniquely to h : (Y′)‾^{/Y} → Z over Y; h is still an injection.
4. Hence Y′ → (Y′)‾^{/Y} is the pullback of the open immersion Y′ → Z along h, and open immersions
are stable under pullback (D3).

Proposed declaration: `isCompactifiable_iff_isSeparated_and_isOpenImmersion` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For j : Spa(C, O_C) → Spa(C, C⁺) the natural map is j itself and is open; for the
doubled-origin ball the map is not separated and the criterion fails.

**Depends on** within this roadmap `S0/compactifiable-morphism`; elsewhere
`DiamondEtaleCohomology:C4`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`.

**Used in this roadmap by** `S0/compactifiable-base-change`, `S0/compactifiable-v-local`,
`S0/compactifiable-composition`, `S0/compactifiable-local-on-source`,
`S0/compactifiable-source-descent`, `S0/compactifiable-cancellation`,
`S1/lower-shriek-quasicompact`, `S5/perfectoid-ball`.

**Source.** ECD Proposition 22.3(i), p. 128: “The morphism f is compactifiable if and only if it is
separated and the natural map Y ′ → Y ′ is an open immersion.”; ECD proof of Proposition 22.3(i), p.
128: “As open immersions and partially proper morphisms are separated, we see that f is separated.”

### `S0/compactifiable-base-change` — Compactifiability is stable under base change


Let f : Y′ → Y and Ỹ → Y be morphisms of v-stacks with pullback f̃ : Ỹ′ = Y′ ×_Y Ỹ → Ỹ. If f is
compactifiable, then f̃ is compactifiable.

**Hypotheses.**

- Any morphism Ỹ → Y of v-stacks.

**Construction and proof.**

1. By S0/compactifiable-iff-separated-open, f is separated and Y′ → (Y′)‾^{/Y} is an open immersion.
2. Separatedness is stable under base change (D3), and the canonical compactification commutes with
base change in Y: (Ỹ′)‾^{/Ỹ} = (Y′)‾^{/Y} ×_Y Ỹ (C4, proof of ECD Corollary 18.8, which reduces to
the formula (Y′)‾^{/Y} = (Y′)‾ ×_{Y‾} Y).
3. So Ỹ′ → (Ỹ′)‾^{/Ỹ} is a pullback of the open immersion Y′ → (Y′)‾^{/Y}, hence an open immersion;
apply the criterion again.

Proposed declaration: `IsCompactifiable.baseChange` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** The pullback of the compactifiable open immersion Spa(C, O_C) → Spa(C, C⁺) along
Spa(C′, C′⁺) → Spa(C, C⁺) is compactifiable.

**Depends on** within this roadmap `S0/compactifiable-iff-separated-open`; elsewhere
`DiamondEtaleCohomology:C4`, `DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`.

**Used in this roadmap by** `S0/eligible-morphism`, `S0/spatial-eligible-morphism`.

**Source.** ECD Proposition 22.3(ii), p. 128: “If f is compactifiable, then fe is compactifiable.”;
ECD proof of Proposition 22.3, p. 128: “Now parts (ii) and (iii) follow easily from (i).”

### `S0/compactifiable-v-local` — Compactifiability is v-local on the target


Let f : Y′ → Y and g : Ỹ → Y be morphisms of v-stacks with pullback f̃ : Ỹ′ → Ỹ. If f̃ is
compactifiable and g is a surjective map of v-stacks, then f is compactifiable.

**Hypotheses.**

- g surjective as a map of v-stacks (not merely topologically surjective; D4 separates the two).

**Construction and proof.**

1. By S0/compactifiable-iff-separated-open applied to f̃, f̃ is separated and Ỹ′ → (Ỹ′)‾^{/Ỹ} is an
open immersion.
2. Separatedness and being an open immersion descend along surjections of v-stacks (D3, ECD
Proposition 10.11).
3. The canonical compactification commutes with base change (C4), so Ỹ′ → (Ỹ′)‾^{/Ỹ} is the pullback
of Y′ → (Y′)‾^{/Y} along the surjection (Y′)‾^{/Y} ×_Y Ỹ → (Y′)‾^{/Y}; the latter is an open
immersion, and part (i) gives the claim.

Proposed declaration: `IsCompactifiable.of_baseChange_of_surjective` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Compactifiability of a map to Spa(C, C⁺) can be tested after pullback to a strictly
totally disconnected cover.

**Depends on** within this roadmap `S0/compactifiable-iff-separated-open`; elsewhere
`DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S0/compactifiable-composition`, `S0/separated-etale-compactifiable`,
`S4/smooth-v-local-on-target`.

**Source.** ECD Proposition 22.3(iii), p. 128: “If fe is compactifiable and Ye → Y is a surjective
map of v-stacks, then f is compactifiable.”; ECD Proposition 22.3, p. 128: “In particular, the
property of being compactifiable is v-local on the target by (iii)”

### `S0/compactifiable-composition` — Composites of compactifiable morphisms


If Y₁ → Y₂ and Y₂ → Y₃ are compactifiable morphisms of v-stacks, then the composite Y₁ → Y₃ is
compactifiable.

**Hypotheses.**

- Both maps compactifiable; no representability is needed.

**Construction and proof.**

1. By S0/compactifiable-v-local we may work v-locally on Y₃ and assume Y₃, hence every Yᵢ, separated
(compactifiable maps are separated).
2. Then Y₂ → (Y₂)‾^{/Y₃} and Y₁ → (Y₁)‾^{/Y₂} are open immersions (part (i)).
3. With Y‾ the absolute canonical compactification and (Y′)‾^{/Y} = (Y′)‾ ×_{Y‾} Y (C4, proof of ECD
Corollary 18.8), the natural map Y₁ → (Y₁)‾^{/Y₃} is the composite Y₁ → (Y₁)‾ ×_{(Y₂)‾} Y₂ → (Y₁)‾
×_{(Y₂)‾} (Y₂)‾^{/Y₃} = (Y₁)‾ ×_{(Y₃)‾} Y₃; the first map is the open immersion of part (i) for Y₁ →
Y₂, the second the pullback of the open immersion Y₂ → (Y₂)‾^{/Y₃}.
4. Composites of open immersions are open immersions (D3); apply part (i).

Proposed declaration: `IsCompactifiable.comp` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** The composite of the open immersion D ⊂ B (open unit disc in the ball) and of B → *
is compactifiable.

**Depends on** within this roadmap `S0/compactifiable-iff-separated-open`,
`S0/compactifiable-v-local`; elsewhere `DiamondEtaleCohomology:C4`,
`DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`.

**Used in this roadmap by** `S0/eligible-morphism`, `S0/spatial-eligible-morphism`.

**Source.** ECD Proposition 22.3(iv), p. 128: “If Y1 → Y2 and Y2 → Y3 are compactifiable morphisms
of v-stacks, then the composite Y1 → Y3 is compactifiable.”; ECD proof of Proposition 22.3(iv), p.
128: “Now parts (ii) and (iii) follow easily from (i). In Part (iv), we may now assume that Y3 ,
and”

### `S0/compactifiable-local-on-source` — Compactifiability is local on the source for open covers


Let f : Y′ → Y be separated and representable in locally spatial diamonds, and suppose Y′ is covered
by open subfunctors V ⊂ Y′ with f|_V : V → Y compactifiable. Then f is compactifiable. Moreover, for
every such open V ⊂ Y′ the composite V → Y′ → (Y′)‾^{/Y} is an open immersion.

**Hypotheses.**

- f separated and representable in locally spatial diamonds (D5); the cover is by open subfunctors
  (D4: open subsets of |Y′|).

**Construction and proof.**

1. It suffices to show that for every open V ⊂ Y′ with f|_V compactifiable, V → (Y′)‾^{/Y} is an
open immersion; then Y′ is a union of open subfunctors of (Y′)‾^{/Y}.
2. Replace Y by (Y′)‾^{/Y} (so Y′ ⊂ Y is an injection) and work v-locally on Y (D3 descent of open
immersions): Y = Spa(A, A⁺) strictly totally disconnected.
3. By ECD Proposition 10.5 (sub-v-sheaves of a totally disconnected space are filtered colimits of
pro-constructible generalizing subsets, D3), Y′ is a filtered union of open subspaces Spa(A, (A⁺)′)
of Y′ with A⁺ ⊂ (A⁺)′; a quasicompact V lies in one of them.
4. For x ∈ V choose a rational subset U = {|fᵢ| ≤ |g|} of Y with x ∈ Spa(A, (A⁺)′) ∩ U ⊂ V; then U ⊂
(V)‾^{/Y} = V‾ and V ⊂ V‾ is open, so U ∩ V is open in U, giving an open neighbourhood of x in Y
contained in Y′.

Proposed declaration: `IsCompactifiable.of_openCover` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** A union of two compactifiable open subspaces of a separated locally spatial diamond
over Spa(C, O_C) is compactifiable.

**Depends on** within this roadmap `S0/compactifiable-iff-separated-open`; elsewhere
`DiamondsAndVStacks:D5/relative-representability`,
`DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces`,
`DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`,
`DiamondsAndVStacks:D1/strictly-totally-disconnected`, `DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S0/separated-etale-compactifiable`, `S0/compactifiable-source-descent`,
`S5/analytic-smooth-is-cohomologically-smooth`.

**Source.** ECD Proposition 22.3(v), p. 128: “If f is separated and representable in locally spatial
diamonds and Y ′ admits a cover by open subfunctors V ⊂ Y ′ such that f |V : V → Y is
compactifiable, then f is compactifiable.”; ECD proof of Proposition 22.3(v), p. 128: “In part (v),
it is enough to prove that for any open subspace V ⊂ Y ′ , the composite V → Y ′”; ECD proof of
Proposition 22.3(v), p. 129: “These cover Y ′ , so that Y ′ is open in Y , as desired.”

### `S0/separated-etale-compactifiable` — Separated étale maps are compactifiable


Every separated étale morphism f : Y′ → Y of v-stacks (étale in the sense of DiamondsAndVStacks D3,
hence locally separated and representable after pullback to perfectoid spaces) is compactifiable.

**Hypotheses.**

- f separated and étale.

**Construction and proof.**

1. By S0/compactifiable-v-local we may assume Y = X is a strictly totally disconnected perfectoid
space; then Y′ = X′ is a perfectoid space separated and étale over X (D3).
2. By S0/compactifiable-local-on-source (X′ is locally spatial and f is separated) we may assume X′
quasicompact.
3. A quasicompact separated étale perfectoid space over a strictly totally disconnected X is a
finite disjoint union of quasicompact open subspaces of X (every étale cover of X splits, D1), so X′
→ ⊔ X → X is an open immersion followed by a finite étale, hence proper, map.

Proposed declaration: `IsCompactifiable.of_isSeparated_of_isEtale` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** A finite étale map and a quasicompact open immersion are compactifiable; the
doubled-origin ball (étale, not separated) is excluded by hypothesis.

**Depends on** within this roadmap `S0/compactifiable-v-local`, `S0/compactifiable-local-on-source`;
elsewhere `DiamondsAndVStacks:D1/strictly-totally-disconnected`,
`DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`, `DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S0/eligible-morphism`, `S1/lower-shriek-etale-agreement-qc`,
`S5/analytic-smooth-is-cohomologically-smooth`.

**Source.** ECD Proposition 22.3(vi), p. 128: “If f is separated and étale, then f is
compactifiable.”; ECD proof of Proposition 22.3(vi), p. 129: “In that case, Y ′ decomposes as a
disjoint union of quasicompact open subspaces of Y , so the result is clear.”

### `S0/locally-split-map` — Maps with local sections after pullback to strictly totally disconnected spaces


A morphism g : Z → Y′ of v-stacks is locally split if it is separated and surjective (as a map of
v-stacks) and, for every strictly totally disconnected perfectoid space X with a map X → Y′, every
point of |X| has an open neighbourhood U ⊂ X over which Z ×_{Y′} U → U admits a section. The
condition is stored as data on each use; it is not implied by universal openness, by being a
v-cover, or by ℓ-cohomological smoothness, and ECD records that the source-descent statement fails
without it.

**Hypotheses.**

- Strictly totally disconnected perfectoid spaces are those of DiamondsAndVStacks D1; surjectivity
  of maps of v-stacks is that of D4.

**Construction and proof.**

1. Define IsLocallySplit g as: g separated, g surjective, and the local-section condition on every
strictly totally disconnected test space.
2. Since X is quasicompact and totally disconnected, the neighbourhoods can be refined to a finite
partition of X into open and closed subsets carrying sections; this normal form is the constructor
IsLocallySplit.of_clopen_sections.

Proposed declaration: `IsLocallySplit` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `IsLocallySplit.isSeparated` | projection | A locally split map is separated. |
| `IsLocallySplit.surjective` | projection | A locally split map is a surjection of v-stacks. |
| `IsLocallySplit.of_section` | constructor | A separated map with a global section s (g ∘ s = id) is locally split. |
| `IsLocallySplit.of_clopen_sections` | constructor | If for every strictly totally disconnected X → Y′ there is a finite partition of X into open and closed subsets over each of which Z ×_{Y′} X has a section, and g is separated and surjective, then g is locally split. |
| `IsLocallySplit.baseChange` | functoriality | If g : Z → Y′ is locally split and Y″ → Y′ is any map, then Z ×_{Y′} Y″ → Y″ is locally split. |
| `IsLocallySplit.comp` | structure | A composite of locally split maps is locally split. |
| `IsLocallySplit.of_separated_etale_surjective` | compatibility | A separated étale surjection is locally split, because every étale cover of a strictly totally disconnected space splits (D1). |

**Used by.**

- ECD Proposition 22.3(vii): the hypothesis on g in source descent of compactifiability.
- ECD Remark after 23.14, p. 150: the compactifiability hypothesis in the converse of 23.13 may be
  dropped when the smooth surjection is locally split.
- VStackSheavesAndLisseCategories:VS1 (Fargues–Scholze IV.3.5): formally smooth maps have local
  sections after pullback to strictly totally disconnected spaces; VS1 proves that, and this
  predicate is its conclusion.

**Unit tests.**

- `IsLocallySplit.id` (degenerate): The identity of any v-stack is locally split.
- `IsLocallySplit.openCover` (computation): For an open cover {Uᵢ} of a v-sheaf Y′, the map ⊔ᵢ Uᵢ →
  Y′ is locally split (it is separated étale and surjective).
- `not_isLocallySplit_field_extension` (non-example): For complete algebraically closed C ⊊ C′, the
  map Spa(C′, O_C′) → Spa(C, O_C) is a separated surjection of v-sheaves without a section over the
  strictly totally disconnected Spa(C, O_C) (a section would be a continuous C-algebra map C′ → C),
  so it is not locally split.
- `IsLocallySplit.trivial_torsor` (characterisation): For a profinite group K and a strictly totally
  disconnected X, the projection K × X → X is locally split.

**Acceptance.** Separated étale surjections are locally split; Spa(C′, O_C′) → Spa(C, O_C) for C ⊊
C′ is a separated v-cover that is not.

**Depends on** elsewhere `DiamondsAndVStacks:D1/strictly-totally-disconnected`,
`DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`,
`DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`.

**Used in this roadmap by** `S0/compactifiable-source-descent`, `S4/representability-descent`.

**Source.** ECD Proposition 22.3(vii), p. 128: “there is a separated surjective map g : Z → Y ′ of
v-stacks that after pullback to strictly totally disconnected spaces has local sections”; ECD
Proposition 22.3, footnote 5, p. 128: “In a previous version, it was claimed that in (vii), the
local splitting condition on g is not required, but there are counterexamples to that version.”; ECD
Remark 23.14 and following paragraph, p. 150: “by Proposition 22.3 (vii), it can be omitted if g has
local sections after pullback to strictly totally disconnected spaces.”

### `S0/compactifiable-source-descent` — Descent of compactifiability along locally split maps


Let f : Y′ → Y be separated and representable in locally spatial diamonds, and let g : Z → Y′ be
locally split (S0/locally-split-map) with f ∘ g compactifiable. Then f is compactifiable.
Consequently, for separated maps representable in locally spatial diamonds, compactifiability is
étale local on the source. Whether the local-splitting hypothesis can be replaced by universal
openness of g is open (ECD footnote 5); the older statement without it is false and is not a target.

**Hypotheses.**

- f separated, representable in locally spatial diamonds; g locally split (separated, surjective,
  local sections over strictly totally disconnected spaces).

**Construction and proof.**

1. As in part (v), replace Y by (Y′)‾^{/Y}; it suffices to show that the injection Y′ → Y is an open
immersion, which can be checked v-locally on Y (D3): Y = Spa(A, A⁺) strictly totally disconnected,
so Y′ is a locally spatial diamond.
2. By S0/compactifiable-local-on-source we may assume Y′ quasicompact; then Y′ is itself strictly
totally disconnected (a quasicompact open of a sub-v-sheaf of Y, ECD 10.5 and 7.6).
3. Now g has local sections over Y′, so Y′ is covered by opens V over which f|_V factors through the
compactifiable f ∘ g; compactifiability of f|_V follows by cancellation
(S0/compactifiable-cancellation, g separated), and part (v) concludes.

Proposed declaration: `IsCompactifiable.of_comp_of_isLocallySplit` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** A separated étale surjection g satisfies the hypothesis; the field extension Spa(C′,
O_C′) → Spa(C, O_C) does not, and no conclusion is drawn from it.

**Depends on** within this roadmap `S0/locally-split-map`, `S0/compactifiable-local-on-source`,
`S0/compactifiable-cancellation`, `S0/compactifiable-iff-separated-open`; elsewhere
`DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`,
`DiamondsAndVStacks:D1/strictly-totally-disconnected`,
`DiamondsAndVStacks:D5/relative-representability`.

**Used in this roadmap by** `S4/representability-descent`.

**Source.** ECD Proposition 22.3(vii), p. 128: “If f is separated and representable in locally
spatial diamonds and there is a separated surjective map g : Z → Y ′ of v-stacks that after pullback
to strictly totally disconnected spaces has local sections and such that f ◦ g is compactifiable,
then f is compactifiable.”; ECD proof of Proposition 22.3(vii), p. 129: “But then g is locally split
by assumption, so the result follows from (v).”

### `S0/compactifiable-cancellation` — Cancellation for compactifiable morphisms


Let f : Y′ → Y and g : Y → Z be morphisms of v-stacks with g separated. If g ∘ f is compactifiable,
then f is compactifiable.

**Hypotheses.**

- g separated; no hypothesis on f beyond the morphism. Representability and dimension hypotheses on
  f are not produced by this statement and must be supplied separately in S0/eligible-morphism.

**Construction and proof.**

1. f is separated: g ∘ f is separated and g is separated (D3 cancellation).
2. There are injections Y′ → (Y′)‾^{/Y} → (Y′)‾^{/Z}: with the absolute formula of C4, (Y′)‾^{/Y} =
(Y′)‾ ×_{Y‾} Y → (Y′)‾ ×_{Z‾} Z = (Y′)‾^{/Z} is the pullback of Y → Y‾^{/Z}, which is injective
because g is separated (C4).
3. The composite is an open immersion (part (i) for g ∘ f), and the first map is its pullback along
the second, hence an open immersion; part (i) concludes.

Proposed declaration: `IsCompactifiable.of_comp` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For Y′ ⊂ Y an open subspace of a compactifiable Y → Z with Y → Z separated, the
inclusion is compactifiable (consistent with S0/compactifiable-morphism, open immersions).

**Depends on** within this roadmap `S0/compactifiable-iff-separated-open`; elsewhere
`DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`, `DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S0/compactifiable-source-descent`, `S0/eligible-cancellation`.

**Source.** ECD Proposition 22.3(viii), p. 128: “If g : Y → Z is a separated map of v-stacks such
that g ◦ f is compactifiable, then f is compactifiable.”; ECD proof of Proposition 22.3(viii), p.
129: “If the composite is an open immersion, then so is the first map (as it is a pullback of the
composite).”

### `S0/eligible-morphism` — Eligible morphisms: the domain of the exceptional operations ★


A morphism f : Y′ → Y of small v-stacks is eligible if (a) f is compactifiable
(S0/compactifiable-morphism), (b) f is representable in locally spatial diamonds (DiamondsAndVStacks
D5), and (c) locally dim.trg f < ∞ (DiamondEtaleCohomology C8: after pullback to any spatial diamond
X → Y, every quasicompact open subspace of Y′ ×_Y X has finite dim.trg over X; the bound depends on
the open). These are exactly the hypotheses of ECD Definition 22.18, Theorem 23.1 and Proposition
23.3; with nΛ = 0 for some n prime to p they make Rf_! and Rf^! defined. Local finiteness is not a
global bound; the globally finite variant is S0/spatial-eligible-morphism.

**Hypotheses.**

- f a morphism of small v-stacks (D4); the three conditions are independent and all three are
  stored.

**Construction and proof.**

1. Define IsEligible f as the conjunction of IsCompactifiable f,
IsRepresentableInLocallySpatialDiamonds f (D5) and LocallyFiniteDimTrg f (C8).
2. Base change: (a) by S0/compactifiable-base-change, (b) since representability in locally spatial
diamonds is a condition on pullbacks (D5), (c) by C8/diamond-dim-base-change, which bounds dim.trg
of a pullback by that of the map.
3. Composition: (a) by S0/compactifiable-composition, (b) by D5 (composites of maps representable in
locally spatial diamonds), (c) by C8/diamond-dim-composition applied on quasicompact opens.
4. Separated étale maps: (a) S0/separated-etale-compactifiable, (b) étale maps into locally spatial
diamonds have locally spatial source (D5/quasi-pro-etale-and-fibre-product-permanence), (c) dim.trg
of an étale map is 0 (completed residue fields agree).

Proposed declaration: `IsEligible` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `IsEligible.mk` | constructor | From IsCompactifiable f, representability of f in locally spatial diamonds and LocallyFiniteDimTrg f. |
| `IsEligible.isCompactifiable` | projection | An eligible map is compactifiable. |
| `IsEligible.representable` | projection | An eligible map is representable in locally spatial diamonds. |
| `IsEligible.locallyFiniteDimTrg` | projection | An eligible map has locally finite dim.trg. |
| `IsEligible.baseChange` | functoriality | If f is eligible and Ỹ → Y is any map of small v-stacks, the pullback f̃ is eligible. |
| `IsEligible.comp` | structure | Composites of eligible maps are eligible. |
| `IsEligible.of_separated_etale` | compatibility | A separated étale map of small v-stacks is eligible. |
| `IsEligible.of_isSpatialEligible` | relation | A spatial-eligible map (S0/spatial-eligible-morphism) is eligible. |
| `IsEligible.restrict_open` | other | If f is eligible and V ⊂ Y′ is open, then f∣_V is eligible (open immersions are separated étale; compose). |

**Used by.**

- ECD Definition 22.18 and Propositions 22.19–22.23: the domain on which Rf_! is constructed and
  satisfies base change, colimit preservation, composition and the projection formula.
- ECD Theorem 23.1, Proposition 23.3 and Proposition 23.16(i): the domain on which Rf^! exists and
  the formal identities hold.
- ECD Definition 23.8: an ℓ-cohomologically smooth map is in particular eligible.
- VStackSheavesAndLisseCategories:VS0, VS2: stacky and solid six-functor constructions descend the
  eligible-class operations along charts.
- AdicCoefficientsAndComparisons:L3 (ECD 27.4): the comparison of Rf_! with Huber's requires the
  diamond map eligible.
- IgusaVarietiesAndTorsionConcentration:IG.3: the maps whose compactly supported cohomology is
  computed must be supplied with eligibility witnesses.

**Unit tests.**

- `IsEligible.id` (degenerate): The identity of a small v-stack is eligible.
- `IsEligible.ball` (computation): The structure map of the absolute ball B → * (S5/perfectoid-ball)
  is eligible, with dim.trg equal to 1.
- `not_isEligible_infinite_dimTrg` (non-example): For complete algebraically closed C ⊂ C′ with
  tr.c̃(C′/C) = ∞, the map Spa(C′, O_C′) → Spa(C, O_C) is qcqs and representable in spatial diamonds
  but not eligible, because dim.trg is infinite on its only (quasicompact) open.
- `IsEligible.openDisc` (computation): The open unit disc D ⊂ B over Spa(C, O_C) maps eligibly to
  Spa(C, O_C), although D is not quasicompact: on each closed subdisc dim.trg is 1.

**Acceptance.** Separated étale maps, open immersions, the ball B → * and the punctured open disc
over Spa(C, O_C) are eligible; a qcqs map with infinite dim.trg is not.

**Depends on** within this roadmap `S0/compactifiable-morphism`, `S0/compactifiable-base-change`,
`S0/compactifiable-composition`, `S0/separated-etale-compactifiable`; elsewhere
`DiamondsAndVStacks:D5/relative-representability`,
`DiamondEtaleCohomology:C8/locally-finite-dim-trg`,
`DiamondEtaleCohomology:C8/diamond-dim-base-change`,
`DiamondEtaleCohomology:C8/diamond-dim-composition`,
`DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`.

**Used in this roadmap by** `S0/spatial-eligible-morphism`, `S0/eligible-cancellation`,
`S2/proper-support-subcategory`, `S2/hypercover-support-diagram`, `S2/lower-shriek`,
`S3/upper-shriek`, `S3/upper-shriek-pushforward-exchange`, `S4/strictly-local-criteria`,
`S4/cohomologically-smooth`, `S4/smooth-composition`, `S4/smooth-stable-under-base-change`,
`S4/smooth-upper-shriek-exchange`, `S4/etale-maps-smooth`, `S6/verdier-conservativity`.

**Source.** ECD Convention 22.1, p. 127: “we will always work with unbounded derived categories and
therefore assume that f is representable in locally spatial diamonds with locally dim. trg f < ∞”;
ECD Definition 22.18, p. 137: “Let f : Y ′ → Y be a compactifiable map of small v-stacks that is
representable in locally spatial diamonds with locally dim. trg f < ∞, and assume nΛ = 0 for some n
prime to p.”; ECD §22, p. 135: “(i.e., after pullback to any spatial diamond Z → Y , any
quasicompact open subspace of Y ′ ×Y Z has finite dim. trg over Z)”

### `S0/spatial-eligible-morphism` — Spatial-eligible morphisms: the quasicompact domain of Rf_!


A morphism f : Y′ → Y of small v-stacks is spatial-eligible if it is compactifiable, representable
in spatial diamonds (D5: representable in locally spatial diamonds and qcqs) and dim.trg f < ∞
globally (C8: one finite bound over all spatial diamond test objects). These are the hypotheses of
ECD Definition 22.4, Theorem 22.5 and Propositions 22.8–22.12. The canonical compactification
(Y′)‾^{/Y} of a spatial-eligible map need not be representable in spatial diamonds; the stronger
hypothesis that it is enters only in S1/spatial-compactification-cd-bound.

**Hypotheses.**

- f a morphism of small v-stacks; the finite bound on dim.trg is global.

**Construction and proof.**

1. Define IsSpatialEligible f as the conjunction of IsCompactifiable f, representability in spatial
diamonds and diamondDimTrg f < ∞ (C8).
2. Representable in spatial diamonds ⇔ representable in locally spatial diamonds and qcqs (D5), so
spatial-eligible = eligible + quasicompact + quasiseparated + a global dim.trg bound.
3. Stability: base change (S0/compactifiable-base-change, D5, C8/diamond-dim-base-change),
composition (S0/compactifiable-composition, D5, C8/diamond-dim-composition), and restriction to
quasicompact opens of the source.

Proposed declaration: `IsSpatialEligible` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `IsSpatialEligible.mk` | constructor | From compactifiability, representability in spatial diamonds and a finite dim.trg bound. |
| `IsSpatialEligible.isEligible` | projection | A spatial-eligible map is eligible. |
| `IsSpatialEligible.qcqs` | projection | A spatial-eligible map is quasicompact and quasiseparated. |
| `IsSpatialEligible.dimTrg_lt_top` | projection | diamondDimTrg f < ∞. |
| `isSpatialEligible_iff` | characterisation | f is spatial-eligible iff f is eligible, qcqs and of globally finite dim.trg. |
| `IsSpatialEligible.baseChange` | functoriality | Stable under base change along any map of small v-stacks. |
| `IsSpatialEligible.comp` | structure | Stable under composition. |
| `IsSpatialEligible.restrict_qc_open` | other | If f is eligible and V ⊂ Y′ is an open subspace that is quasicompact over a spatial Y, then f∣_V is spatial-eligible; this is the input of the left Kan extension in S2. |

**Used by.**

- ECD Definition 22.4, Theorem 22.5, Propositions 22.8–22.12: the domain of Rf_! = Rf‾_* j_! and its
  first properties.
- ECD Definition 22.13 and Proposition 22.14: the restrictions f|_V to opens quasicompact over the
  base are spatial-eligible.
- ECD Propositions 23.7 and 23.10: the direct-sum and practical smoothness criteria are stated for
  maps representable in spatial diamonds.

**Unit tests.**

- `IsSpatialEligible.id` (degenerate): The identity of a spatial diamond is spatial-eligible.
- `IsSpatialEligible.ball` (computation): B × X → X is spatial-eligible for every affinoid
  perfectoid X, with dim.trg 1.
- `not_isSpatialEligible_openDisc` (non-example): The open unit disc D → Spa(C, O_C) is eligible but
  not spatial-eligible: it is not quasicompact.
- `IsSpatialEligible.qc_open_immersion` (computation): A quasicompact open immersion into a spatial
  diamond is spatial-eligible with dim.trg 0.

**Acceptance.** The ball B → * is spatial-eligible; the open unit disc D → Spa(C, O_C) is eligible
but not spatial-eligible (not quasicompact).

**Depends on** within this roadmap `S0/compactifiable-morphism`, `S0/eligible-morphism`,
`S0/compactifiable-base-change`, `S0/compactifiable-composition`; elsewhere
`DiamondsAndVStacks:D5/relative-representability`, `DiamondEtaleCohomology:C8/diamond-dim-trg`,
`DiamondEtaleCohomology:C8/diamond-dim-base-change`,
`DiamondEtaleCohomology:C8/diamond-dim-composition`.

**Used in this roadmap by** `S1/lower-shriek-quasicompact`, `S2/lower-shriek-locally-spatial`,
`S4/direct-sum-criterion`.

**Source.** ECD Definition 22.4, p. 129: “Let f : Y ′ → Y be a compactifiable map of small v-stacks
which is representable in spatial diamonds with dim. trg f < ∞, and assume nΛ = 0 for some n prime
to p.”; ECD Theorem 22.5, p. 130: “The constant 3 may well be an artifact of the proof; if f is
still representable in spatial diamonds, it can be replaced by 2, as expected.”

### `S0/eligible-cancellation` — Cancellation in the eligible class, with its extra hypotheses retained


Let f : Y′ → Y and g : Y → Z be morphisms of small v-stacks. If g ∘ f is eligible, g is separated, f
is representable in locally spatial diamonds and locally dim.trg f < ∞, then f is eligible. The two
last hypotheses are not consequences of the others in this statement and are kept explicit.

**Hypotheses.**

- g separated; f representable in locally spatial diamonds with locally dim.trg f < ∞.

**Construction and proof.**

1. Compactifiability of f is S0/compactifiable-cancellation (g separated).
2. The other two conditions are hypotheses; S0/eligible-morphism then applies.

Proposed declaration: `IsEligible.of_comp` (module `TauCeti/Diamond/SixOperations/Compactifiable`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For an open subspace Y′ ⊂ Y of an eligible Y → Z, the inclusion is eligible.

**Depends on** within this roadmap `S0/compactifiable-cancellation`, `S0/eligible-morphism`.

**Source.** ECD Proposition 22.3(viii), p. 128: “If g : Y → Z is a separated map of v-stacks such
that g ◦ f is compactifiable, then f is compactifiable.”

## S1. Quasicompact proper-support pushforward and the dimension estimate

For spatial-eligible f, Rf_! = Rf‾_* j_! through the canonical compactification, which need not be
spatial. Theorem 22.5 is two declarations: the general bound R^i f‾_* = 0 for i > 3 dim.trg f,
proved through the maximal Hausdorff quotient and the classification of proper dim.trg 0 diamonds
(22.6–22.7), and the 2 dim.trg f bound under the additional hypothesis that the compactification is
spatial. The bound makes the unbounded base change, composition, étale agreement, projection formula
(A on the base, B on the source) and commutation with sums (22.8–22.12) available. Supplier stages:
DiamondEtaleCohomology C3, C4, C5, C0; nodes of C8 and D5.

Planets of this layer: Proper pushforward Rf_! (`S1/lower-shriek-quasicompact`); The 3·dim.trg bound
(`S1/compactification-cd-bound`); Proper diamonds of dim.trg 0
(`S1/proper-dim-zero-classification`); Base change for Rf_! (`S1/lower-shriek-base-change-qc`);
Projection formula (`S1/projection-formula-qc`).

Other roadmaps' stages used (requested): `DiamondEtaleCohomology:C0`, `DiamondEtaleCohomology:C2`,
`DiamondEtaleCohomology:C3`, `DiamondEtaleCohomology:C4`, `DiamondEtaleCohomology:C5`.

Other roadmaps' declarations and nodes used: `DiamondEtaleCohomology:C8/analytic-dimension-bound`,
`DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/fibre-dimension`,
`DiamondEtaleCohomology:C8/point-cd-geometric-bound`,
`DiamondEtaleCohomology:C8/qpetale-direct-image`,
`DiamondEtaleCohomology:C8/spatial-cohomological-bound`,
`DiamondEtaleCohomology:C8/spectral-cohomological-bound`,
`DiamondEtaleCohomology:C8/strictly-disconnected-acyclic`,
`DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`,
`DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`,
`DiamondsAndVStacks:D1/strictly-totally-disconnected`,
`DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps`,
`DiamondsAndVStacks:D3/locally-profinite-torsors`,
`DiamondsAndVStacks:D4/compact-hausdorff-diamonds`,
`DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`,
`DiamondsAndVStacks:D5/berkovich-quotient`,
`DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`,
`DiamondsAndVStacks:D5/reduction-to-spatial-and-hausdorff-cohomology`,
`DiamondsAndVStacks:D5/universally-open-presentation`.

Acceptance tests of the layer: Rf_! = Rf_* for proper f; RΓ(Spa(C, C⁺), Rj_!Λ) = 0 for the generic
point; the ball over Spa(C, O_C) with R²f_!Λ(1) ≅ Λ, consistent with both bounds; [0, 1] × Spa(C,
O_C) as a proper dim.trg 0 diamond.

### `S1/lower-shriek-quasicompact` — The proper pushforward Rf_! = Rf‾_* ∘ j_! of a spatial-eligible map ★


Let f : Y′ → Y be spatial-eligible (S0/spatial-eligible-morphism) and Λ with nΛ = 0, n prime to p.
Write f = f‾ ∘ j with j : Y′ → (Y′)‾^{/Y} the open immersion and f‾ : (Y′)‾^{/Y} → Y the canonical
compactification (S0/compactifiable-iff-separated-open); f‾ is proper because f is quasicompact (C4,
ECD Corollary 18.8(vi)). Define Rf_! := Rf‾_* ∘ j_! : D_ét(Y′, Λ) → D_ét(Y, Λ), with j_! the exact
left adjoint of j^* for the étale map j (DiamondEtaleCohomology C5, ECD 19.1) and Rf‾_* the right
adjoint of f‾^* on the unbounded D_ét (C3, ECD Lemma 17.5). The compactification (Y′)‾^{/Y} is a
small v-stack, in general not a spatial diamond; its D_ét and Rf‾_* are the general ones of C2–C3.
The construction is first made on stable ∞-categories (C2's enhancement) and then passed to homotopy
categories, so that S2 can left Kan extend it.

**Hypotheses.**

- f spatial-eligible: compactifiable, representable in spatial diamonds, dim.trg f < ∞.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

**Construction and proof.**

1. Take the canonical factorisation; f‾ is proper since f is quasicompact (C4).
2. j_! : D_ét(Y′, Λ) → D_ét((Y′)‾^{/Y}, Λ) is C5's extension by zero for the open immersion j; it is
exact and commutes with base change.
3. Rf‾_* is C3's pushforward on unbounded D_ét; by S1/compactification-cd-bound it has cohomological
dimension ≤ 3 dim.trg f, which is what makes the unbounded composite well behaved (base change,
sums).
4. Set Rf_! := Rf‾_* ∘ j_! at the level of enhanced categories, and record it on homotopy
categories.

Proposed declaration: `lowerShriekQC` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `lowerShriekQC_eq` | characterisation | Rf_! ≅ Rf‾_* ∘ j_! for the canonical factorisation (definitional). |
| `lowerShriekQC_of_isProper` | compatibility | If f is proper (so its canonical compactification is f itself), Rf_! ≅ Rf_*. |
| `lowerShriekQC_etale` | compatibility | If f is quasicompact separated étale, Rf_! agrees with C5's left adjoint of f^* (S1/lower-shriek-etale-agreement-qc). |
| `lowerShriekQC_factorisation` | characterisation | For any factorisation f = g ∘ j′ with j′ an open immersion and g proper, Rf_! ≅ Rg_* ∘ j′_! (S1/factorisation-independence). |
| `lowerShriekQC_amplitude` | other | Rf_! carries D_ét^{≥0} to D_ét^{≥0} and its cohomology vanishes in degrees > 3 dim.trg f on objects in degree 0 (S1/compactification-cd-bound). |
| `lowerShriekQC_baseChange` | functoriality | g^*Rf_! ≅ Rf̃_!g′^* for every map g : Ỹ → Y of small v-stacks (S1/lower-shriek-base-change-qc). |
| `lowerShriekQC_comp` | functoriality | R(f ∘ g)_! ≅ Rf_! ∘ Rg_! for composable spatial-eligible maps (S1/lower-shriek-composition-qc). |
| `lowerShriekQC_projection` | relation | Rf_!B ⊗^L A ≅ Rf_!(B ⊗^L f^*A) (S1/projection-formula-qc). |
| `lowerShriekQC_sum` | other | Rf_! commutes with arbitrary direct sums (S1/lower-shriek-direct-sums-qc). |

**Used by.**

- ECD Theorem 22.5 and Propositions 22.8–22.12: the first properties of the exceptional direct
  image.
- ECD Definition 22.13: on sheaves with proper support Rf_! is given by Rf‾_* j_!, and Rf_!A_V =
  R(f|_V)_!(j_V^*A).
- ECD Lemma 23.6 and Propositions 23.7, 23.10: proper pushforward along profinite projections and
  the constructibility criteria are stated for this Rf_!.
- VStackSheavesAndLisseCategories:VS1 (FS IV.2.1): the constructibility condition in universal local
  acyclicity is a statement about R(f ∘ j)_!.
- ClassicalAdicEtaleCohomology:H4/perfectoid-support-image-comparison: the classical-to-diamond
  comparison of Rf_! for the relative ball is phrased with this Rf‾_* j_!.

**Unit tests.**

- `lowerShriekQC_id` (degenerate): For f the identity of a spatial diamond, Rf_! ≅ id.
- `lowerShriekQC_generic_point` (non-example): For C⁺ ⊂ O_C of rank 2 and j : U = Spa(C, O_C) → Y =
  Spa(C, C⁺), the canonical compactification of j is Y, Rj_!Λ = j_!Λ, and RΓ(Y, Rj_!Λ) = 0, whereas
  RΓ(Y, Rj_*Λ) = Λ; so Rf_! is not Rf_* for non-proper f.
- `lowerShriekQC_finite_etale` (compatibility): For a finite étale f, Rf_! ≅ Rf_* ≅ f_! (the
  pushforward of a finite étale map is exact and equals C5's left adjoint).
- `lowerShriekQC_ball_degree_two` (computation): For f : B × Spa(C, O_C) → Spa(C, O_C), R^i f_!Λ = 0
  for i ≠ 2 and R²f_!Λ(1) ≅ Λ, compatibly with Huber's
  ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support under the diamond comparison.

**Acceptance.** For f proper, Rf_! = Rf_*; for a quasicompact open immersion j, Rj_! is C5's
extension by zero; for j : Spa(C, O_C) → Spa(C, C⁺) with C⁺ of rank 2, RΓ(Spa(C, C⁺), Rj_!Λ) = 0
while RΓ(Spa(C, C⁺), Rj_*Λ) = Λ.

**Depends on** within this roadmap `S0/spatial-eligible-morphism`,
`S0/compactifiable-iff-separated-open`; elsewhere `DiamondEtaleCohomology:C4`,
`DiamondEtaleCohomology:C5`, `DiamondEtaleCohomology:C3`, `DiamondEtaleCohomology:C2`.

**Used in this roadmap by** `S1/factorisation-independence`, `S1/compactification-cd-bound`,
`S1/spatial-compactification-cd-bound`, `S1/lower-shriek-base-change-qc`,
`S1/lower-shriek-composition-qc`, `S1/lower-shriek-etale-agreement-qc`, `S1/projection-formula-qc`,
`S1/lower-shriek-direct-sums-qc`, `S2/lower-shriek-locally-spatial`.

**Source.** ECD Definition 22.4, p. 129: “Rf! = Rf ∗ ◦ j! : Dét (Y ′ , Λ) → Dét (Y, Λ)”; ECD §22,
before Definition 22.4, p. 129: “Now if f : Y ′ → Y is a quasicompact compactifiable map of small
v-stacks, we can write f as”; ECD Definition 22.4, p. 129: “Our first aim is to prove that this
definition is well-behaved on unbounded derived categories.”

### `S1/factorisation-independence` — Independence of the factorisation and the canonical comparisons


Let f : Y′ → Y be spatial-eligible, Λ with nΛ = 0 for n prime to p, and f = g ∘ j′ with j′ : Y′ → Z
an open immersion and g : Z → Y proper. Then there is a natural equivalence Rg_* ∘ j′_! ≅ Rf_! of
functors D_ét(Y′, Λ) → D_ét(Y, Λ), compatible with morphisms of such factorisations and transitive.
In particular: (a) if f is proper then Rf_! ≅ Rf_*; (b) if f is a quasicompact open immersion with
proper compactification, Rf_! ≅ f_!. This is ECD's Definition 22.4 made independent of the choice of
compactification, the diamond counterpart of
ClassicalAdicEtaleCohomology:H3/lower-shriek-factorisation-independence.

**Hypotheses.**

- f spatial-eligible; j′ an open immersion; g proper.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

**Construction and proof.**

1. Since g is partially proper, the universal property of the canonical compactification (C4, ECD
18.6) gives a unique h : (Y′)‾^{/Y} → Z over Y with h ∘ j = j′; h is proper (both are proper over Y
and Z → Y is separated).
2. h⁻¹(j′(Y′)) = j(Y′): a point of (Y′)‾^{/Y}(R, R⁺) = Y′(R, R°) ×_{Y(R,R°)} Y(R, R⁺) mapping into
the open Y′ ⊂ Z is the image under j of the induced point of Y′(R, R⁺), since both have the same
restriction to Spa(R, R°) and the same image in Y.
3. Proper base change (C5, ECD Theorem 19.2, with the corrected pullback U′ = U ×_Y Y′ of
PAPER-SCHOLZE-17/E53) for h and the open immersion j′ gives j′_! ≅ Rh_* j_! on D⁺_ét.
4. Hence Rg_* j′_! ≅ Rg_* Rh_* j_! ≅ Rf‾_* j_! on D⁺_ét. Both sides commute with Postnikov limits
(Rg_*, Rf‾_* are right adjoints, j_!, j′_! are t-exact and D_ét is left-complete, C2), so the
equivalence extends to all of D_ét.
5. (a) and (b) are the factorisations (Y′ = Y′ → Y) and (Y′ → Y‾ → Y).

Proposed declaration: `lowerShriekQC_factorisation` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For the finite étale map ⊔ X → X both factorisations (canonical, and (id, f)) give
Rf_* = f_!; for a proper f the canonical compactification is f itself.

**Depends on** within this roadmap `S1/lower-shriek-quasicompact`; elsewhere
`DiamondEtaleCohomology:C4`, `DiamondEtaleCohomology:C5`, `DiamondEtaleCohomology:C2`,
`DiamondEtaleCohomology:C3`.

**Used in this roadmap by** `S4/profinite-projection-pushforward`, `S5/averaging-transformation`,
`S5/profinite-quotient-upper-shriek`.

**Source.** ECD Definition 22.4, p. 129: “Let f : Y ′ → Y be a compactifiable map of small v-stacks
which is representable in spatial diamonds with dim. trg f < ∞, and assume nΛ = 0 for some n prime
to p.”; ECD Theorem 19.2, p. 108: “There is a natural transformation of functors j! Rg∗ → Rf∗ j!′ :
Dét (U ′ , Λ) → Dét (Y, Λ) .”

### `S1/compactification-cd-bound` — The 3·dim.trg bound for the canonical compactification ★


Let f : Y′ → Y be spatial-eligible, Λ with nΛ = 0 for n prime to p, and f = f‾ ∘ j the canonical
factorisation. Then Rf‾_* has bounded cohomological dimension: for every A ∈ D_ét((Y′)‾^{/Y}, Λ)
concentrated in degree 0, R^i f‾_* A = 0 for i > 3 dim.trg f. Since j_* is exact (C8, ECD Remark
21.14, for the quasicompact separated quasi-pro-étale open inclusion), also R^i f_* A = 0 for A ∈
D_ét(Y′, Λ) in degree 0 and i > 3 dim.trg f. No spatiality of (Y′)‾^{/Y} is assumed; the sharper 2
dim.trg f bound under that extra hypothesis is S1/spatial-compactification-cd-bound.

**Hypotheses.**

- f spatial-eligible; d = dim.trg f < ∞.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).
- No assumption that (Y′)‾^{/Y} is a spatial diamond.

**Construction and proof.**

1. By C3 (ECD 17.6: Rf‾_* commutes with base change on D⁺ for the qcqs f‾) reduce to Y strictly
totally disconnected, then by stalks to Y = Spa(C, C⁺) and global sections: show H^i((Y′)‾^{/Y}, A)
= 0 for i > 3d.
2. Let s be the closed point, U = Y ∖ {s}, V = f‾⁻¹(U) (the misprint V = f⁻¹(U) is
PAPER-SCHOLZE-17/E98). Proper base change (C5, ECD 19.2) gives RΓ((Y′)‾^{/Y}, j_!j^*A) = 0, so one
may assume j^*A = 0, i.e. A is supported on the fibre over s.
3. By ECD Propositions 13.12 and 13.9 (D5/reduction-to-spatial-and-hausdorff-cohomology,
D5/berkovich-quotient) the maximal Hausdorff quotient T of |(Y′)‾^{/Y}|, which is also that of the
spectral space |Y′ ×_{Spa(C,C⁺)} Spa(C, O_C)|, comes with a map (Y′)‾^{/Y} → T representable in
locally spatial diamonds; the induced g : (Y′)‾^{/Y} → T × Y is proper and representable in spatial
diamonds with dim.trg g = d.
4. For g apply the spatial argument (S1/spatial-compactification-cd-bound): R^i g_*A = 0 for i > 2d.
5. For h : T × Y → Y and B in degree 0 trivial on T × U: H^i(T × Y, B) = H^i(T, B|_{T×{s}}) (proper
base change), and by S1/proper-dim-zero-topological-comparison and ECD 13.13 this is cohomology of
the spectral space |Y′ ×_{Spa(C,C⁺)} Spa(C, O_C)| of dimension ≤ dim f ≤ d
(C8/analytic-dimension-bound transported to the diamond, C8/fibre-dimension), which vanishes above d
by Scheiderer's bound (C8/spectral-cohomological-bound).
6. Combine through the Leray spectral sequence of f‾ = h ∘ g: 2d + d = 3d.

Proposed declaration: `lowerShriekQC_cd_le_three_mul` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For the ball B × Spa(C, O_C) → Spa(C, O_C) (d = 1) the bound gives vanishing above
degree 3, while the actual top degree of Rf_! is 2 (consistent with the sharper spatial bound, since
B‾ is spatial).

**Depends on** within this roadmap `S1/lower-shriek-quasicompact`,
`S1/spatial-compactification-cd-bound`, `S1/proper-dim-zero-topological-comparison`; elsewhere
`DiamondsAndVStacks:D5/reduction-to-spatial-and-hausdorff-cohomology`,
`DiamondsAndVStacks:D5/berkovich-quotient`,
`DiamondEtaleCohomology:C8/spectral-cohomological-bound`,
`DiamondEtaleCohomology:C8/fibre-dimension`, `DiamondEtaleCohomology:C8/analytic-dimension-bound`,
`DiamondEtaleCohomology:C8/qpetale-direct-image`, `DiamondEtaleCohomology:C3`,
`DiamondEtaleCohomology:C5`, `DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S1/lower-shriek-base-change-qc`, `S1/lower-shriek-composition-qc`,
`S1/lower-shriek-direct-sums-qc`, `S4/strictly-local-criteria`, `S4/direct-sum-criterion`,
`S4/smooth-perfect-constructible`.

**Source.** ECD Theorem 22.5, p. 130: “In particular, as j∗ is exact (by Remark 21.14), also Ri f∗ A
= 0 for all A ∈ Dét (Y ′ , Λ) concentrated in degree 0 and i > 3 dim. trg f , so that Rf∗ has
bounded cohomological dimension.”; ECD proof of Theorem 22.5, p. 130: “Unfortunately, for a
compactifiable map f : Y ′ → Y of spatial diamonds, we do not know whether”; ECD proof of Theorem
22.5, p. 131: “In fact, we claim that H i (T × Y, B) = 0 for i > dim f . This follows from
Proposition 22.7 below,”

### `S1/spatial-compactification-cd-bound` — The 2·dim.trg bound when the compactification is spatial


In the situation of S1/compactification-cd-bound assume in addition that (Y′)‾^{/Y} → Y is
representable in spatial diamonds. Then R^i f‾_* A = 0 for every A ∈ D_ét((Y′)‾^{/Y}, Λ) in degree 0
and i > 2 dim.trg f. This is a separate declaration from the 3·dim.trg bound, with the extra
hypothesis stated.

**Hypotheses.**

- f spatial-eligible; the canonical compactification is representable in spatial diamonds (an
  additional hypothesis).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

**Construction and proof.**

1. Reduce as in S1/compactification-cd-bound to Y = Spa(C, C⁺), A with j^*A = 0 supported over the
closed point s.
2. (Y′)‾^{/Y} is now a spatial diamond, dim((Y′)‾^{/Y} ∖ V) = dim (f‾)⁻¹(s) ≤ dim f‾ ≤ dim.trg f‾ =
dim.trg f (the compactification adds only specialisations, so the completed residue fields at
maximal points are those of Y′).
3. For maximal points y′ (all in Y′) cd_ℓ(y′) ≤ dim.trg f by C8/point-cd-geometric-bound (ECD 21.16,
ℓ ≠ p).
4. C8/spatial-cohomological-bound (ECD 21.11) gives H^i = 0 for i > d + d = 2d.

Proposed declaration: `lowerShriekQC_cd_le_two_mul_of_spatial` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For the ball over Spa(C, C⁺) (compactification spatial, d = 1) R^i f‾_* vanishes
above 2, which is sharp: R²f_!Λ ≠ 0.

**Depends on** within this roadmap `S1/lower-shriek-quasicompact`; elsewhere
`DiamondEtaleCohomology:C8/spatial-cohomological-bound`,
`DiamondEtaleCohomology:C8/point-cd-geometric-bound`,
`DiamondEtaleCohomology:C8/analytic-dimension-bound`, `DiamondEtaleCohomology:C3`,
`DiamondEtaleCohomology:C5`, `DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S1/compactification-cd-bound`.

**Source.** ECD Theorem 22.5, p. 130: “The constant 3 may well be an artifact of the proof; if f is
still representable in spatial diamonds, it can be replaced by 2, as expected.”; ECD proof of
Theorem 22.5, p. 130: “and ℓ ̸= p by Proposition 21.16, so the result follows from Proposition
21.11.”

### `S1/proper-dim-zero-classification` — Proper diamonds of dim.trg 0 over a strictly totally disconnected space ★


Let X be a strictly totally disconnected perfectoid space. The functor T ↦ X ×_{π₀X} T from compact
Hausdorff spaces over π₀X to proper diamonds over X is an equivalence onto the proper diamonds f : Y
→ X with dim.trg f = 0. For X = Spa(C, C⁺) these are exactly the T × Spa(C, C⁺), T compact
Hausdorff.

**Hypotheses.**

- X strictly totally disconnected (D1); proper as in ECD 18.1 (C4); dim.trg as in C8.

**Construction and proof.**

1. Given Y → X proper with dim.trg 0, choose a quasi-pro-étale surjection X̃ → Y from a strictly
totally disconnected space (D5/universally-open-presentation).
2. Its compactification X̃‾^{/X} → X is a proper map of strictly totally disconnected spaces
inducing isomorphisms on completed residue fields (dim.trg 0), hence of the form X ×_{π₀X} S for a
profinite S → π₀X (D1/topological-classification-of-pro-etale-maps).
3. With X_S = X ×_{π₀X} S → Y surjective, R = X_S ×_Y X_S is proper and pro-étale over X, so R = X
×_{π₀X} S′ with S′ ⊂ S × S closed; T = S/S′ is compact Hausdorff and Y = X ×_{π₀X} T.
4. Full faithfulness is ECD Example 11.12 (D4/compact-hausdorff-diamonds), relative over π₀X.

Proposed declaration: `properDimTrgZero_equiv_compHaus` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For T = [0, 1] and X = Spa(C, O_C), [0, 1] × Spa(C, O_C) is a proper diamond of
dim.trg 0 whose underlying space is the interval, not a spectral space.

**Depends on** elsewhere `DiamondsAndVStacks:D1/strictly-totally-disconnected`,
`DiamondsAndVStacks:D1/topological-classification-of-pro-etale-maps`,
`DiamondsAndVStacks:D5/universally-open-presentation`,
`DiamondsAndVStacks:D4/compact-hausdorff-diamonds`,
`DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondEtaleCohomology:C8/diamond-dim-trg`,
`DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S1/proper-dim-zero-topological-comparison`.

**Source.** ECD Proposition 22.6, p. 131: “Then the category of proper diamonds f : Y → X with dim.
trg f = 0 is equivalent to the category of compact Hausdorff spaces over π0 X, via sending a compact
Hausdorff space T → π0 X to X ×π0 X T .”; ECD proof of Proposition 22.6, p. 131: “Now T = S/S ′ is a
compact Hausdorff space, and Y = X ×π0 X T . Using Example 11.12, we see that this gives the desired
equivalence of categories.”

### `S1/qcqs-diamond-continuity` — Continuity of cohomology along cofiltered limits of qcqs diamonds


Let Y be a small v-sheaf, Λ any ring, C ∈ D⁺_ét(Y, Λ), and Zᵢ → Y a cofiltered inverse system of
qcqs diamonds with inverse limit Z. Then RΓ(Z, C) = colimᵢ RΓ(Zᵢ, C). For spatial Zᵢ this is ECD
Proposition 14.9 (owned by DiamondEtaleCohomology C0); the qcqs case is the claim in the proof of
ECD 22.7.

**Hypotheses.**

- Zᵢ qcqs diamonds with qcqs transition maps; C bounded below.

**Construction and proof.**

1. Write the Zᵢ compatibly as quotients of affinoid perfectoid spaces Xᵢ as in ECD Lemma 11.22
(D5/limits-and-finite-stage-comparisons).
2. The equivalence relations Rᵢ = Xᵢ ×_{Zᵢ} Xᵢ are spatial diamonds (ECD Proposition 12.3,
D4/small-v-sheaves-and-small-v-stacks), as are the iterated fibre products.
3. Apply the spatial continuity of C0 (ECD 14.9) to the limits of the Xᵢ, the Rᵢ, the Rᵢ ×_{Xᵢ} Rᵢ,
…, and conclude by v-descent of RΓ along the Čech nerves (C2 hyperdescent; colimits commute with the
totalisations of bounded-below objects in each degree).

Proposed declaration: `qcqsDiamond_cohomology_continuous` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For Zᵢ = T × Spa(C, O_C) with T compact Hausdorff the cofiltered neighbourhoods U
×_{π₀X} S of a point compute the stalk, as used in 22.7.

**Depends on** elsewhere `DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`,
`DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondEtaleCohomology:C0`,
`DiamondEtaleCohomology:C2`.

**Used in this roadmap by** `S1/proper-dim-zero-topological-comparison`.

**Source.** ECD proof of Proposition 22.7, p. 132: “This follows from Proposition 14.9 if all Zi are
spatial; in general, writing all Zi compatibly as quotients of affinoid perfectoid spaces Xi as in
the proof of Lemma 11.22, the equivalence relations Ri = Xi ×Zi Xi are spatial diamonds by
Proposition 12.3.”

### `S1/proper-dim-zero-topological-comparison` — Étale sheaves on a proper dim.trg 0 diamond are topological sheaves


Let X be strictly totally disconnected and f : Y → X proper with dim.trg f = 0, so Y = X ×_{π₀X} T
(S1/proper-dim-zero-classification). Then pullback along the map of topoi t : Y_v → |Y| induces an
equivalence D⁺(|Y|, Λ) ≃ D⁺_ét(Y, Λ), where D⁺(|Y|, Λ) is the derived category of sheaves of
Λ-modules on the topological space |Y|.

**Hypotheses.**

- X strictly totally disconnected; f proper of dim.trg 0; Λ any ring; bounded-below objects only.

**Construction and proof.**

1. t^*F lies in D⁺_ét(Y_v, Λ) for every sheaf F on |Y| (definition of D_ét, C2).
2. (i) F → Rt_*t^*F is an isomorphism: on stalks, neighbourhoods of y ∈ |Y| are cofinal with the
qcqs U ×_{π₀X} S (U ⊂ X a quasicompact open, S the closure of an open neighbourhood in T), with
cofiltered limit the generalisations Spa(C(y), C(y)⁺) of y; S1/qcqs-diamond-continuity reduces the
stalk to RΓ(Spa(C(y), C(y)⁺), t^*F) = F_y (strictly local, C8/strictly-disconnected-acyclic).
3. (ii) t^*Rt_*G → G is an isomorphism for small v-sheaves G étale after pullback to a strictly
totally disconnected cover, by the same cofinality on stalks.

Proposed declaration: `properDimTrgZero_topological_equiv` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For Y = [0, 1] × Spa(C, O_C), H^i_ét(Y, Λ) = H^i([0, 1], Λ) = Λ for i = 0 and 0
otherwise.

**Depends on** within this roadmap `S1/proper-dim-zero-classification`,
`S1/qcqs-diamond-continuity`; elsewhere `DiamondEtaleCohomology:C8/strictly-disconnected-acyclic`,
`DiamondEtaleCohomology:C2`.

**Used in this roadmap by** `S1/compactification-cd-bound`.

**Source.** ECD Proposition 22.7, p. 131: “Then pullback under Y → |Y | defines an equivalence”; ECD
proof of Proposition 22.7, p. 132: “Thus, the stalk of Rt∗ t∗ F can also be computed as a direct
limit of the cohomologies of t∗ F over these neighborhoods U ×π0 X S, which by the remark above
reduces to”

### `S1/lower-shriek-base-change-qc` — Base change for Rf_! (spatial-eligible case) ★


Let f : Y′ → Y be spatial-eligible, Λ with nΛ = 0 for n prime to p, and g : Ỹ → Y any map of small
v-stacks with pullbacks f̃ : Ỹ′ → Ỹ and g′ : Ỹ′ → Y′. There is a natural base-change equivalence
g^*Rf_! ≃ Rf̃_!g′^* of functors D_ét(Y′, Λ) → D_ét(Ỹ, Λ), on all of the unbounded category.

**Hypotheses.**

- f spatial-eligible; g arbitrary.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

**Construction and proof.**

1. The canonical factorisation is compatible with base change (C4), so f̃‾ is the pullback of f‾ and
j̃ that of j.
2. j_! commutes with base change (C5, ECD 19.1).
3. Rf‾_* commutes with base change on D⁺ for the qcqs f‾ (C3, ECD 17.6); since Rf‾_* has finite
cohomological dimension (S1/compactification-cd-bound), the unbounded version of 17.6 applies.

Proposed declaration: `lowerShriekQC_baseChange` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Pulling back the ball B × X → X along a point Spa(C, C⁺) → X computes the stalk of
R²f_!Λ as H²_c of the ball over Spa(C, C⁺).

**Depends on** within this roadmap `S1/lower-shriek-quasicompact`, `S1/compactification-cd-bound`;
elsewhere `DiamondEtaleCohomology:C3`, `DiamondEtaleCohomology:C5`, `DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S1/lower-shriek-etale-agreement-qc`, `S1/lower-shriek-direct-sums-qc`,
`S2/lower-shriek-base-change-locally-spatial`.

**Source.** ECD Proposition 22.8, p. 132: “There is a natural base change equivalence g ∗ Rf! ≃ Rfe!
g ′∗ of functors Dét (Y ′ , Λ) → Dét (Ye , Λ).”; ECD proof of Proposition 22.8, p. 132: “This
follows by combining Theorem 22.5, Proposition 17.6 and Proposition 19.1.”

### `S1/lower-shriek-composition-qc` — Composition of Rf_! (spatial-eligible case)


Let g : Y″ → Y′ and f : Y′ → Y be spatial-eligible and Λ with nΛ = 0 for n prime to p. There is a
natural equivalence Rf_! ∘ Rg_! ≃ R(f ∘ g)_! of functors D_ét(Y″, Λ) → D_ét(Y, Λ).

**Hypotheses.**

- f, g spatial-eligible (so f ∘ g is, S0/spatial-eligible-morphism).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

**Construction and proof.**

1. Factor Y″ →j₁ (Y″)‾^{/Y′} →j₂ (Y″)‾^{/Y} →g₂ (Y′)‾^{/Y} →f₁ Y, with g₁ : (Y″)‾^{/Y′} → Y′ and j₃
: Y′ → (Y′)‾^{/Y}.
2. Then Rf_!Rg_! = Rf₁_* j₃! Rg₁_* j₁! and R(f ∘ g)_! = Rf₁_* Rg₂_* j₂! j₁!.
3. Proper base change (C5, ECD 19.2) for the proper (Y″)‾^{/Y} → (Y′)‾^{/Y} and the open j₃, made
unbounded by S1/compactification-cd-bound applied to (Y″)‾^{/Y′} → Y′, gives j₃! Rg₁_* = Rg₂_* j₂!.

Proposed declaration: `lowerShriekQC_comp` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For an open immersion followed by a finite étale map the composite formula reduces
to j_! followed by f_*.

**Depends on** within this roadmap `S1/lower-shriek-quasicompact`, `S1/compactification-cd-bound`;
elsewhere `DiamondEtaleCohomology:C5`, `DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S2/lower-shriek-composition`.

**Source.** ECD Proposition 22.9, p. 132: “Then there is a natural equivalence Rf! ◦ Rg! ≃ R(f ◦ g)!
of functors Dét (Y ′′ , Λ) → Dét (Y, Λ).”; ECD proof of Proposition 22.9, p. 133: “However, by
Theorem 19.2 and Theorem 22.5 (applied to Y ′′ → Y ′ ), we have j3! Rg1∗ = Rg2∗ j2! ,”

### `S1/lower-shriek-etale-agreement-qc` — Agreement with the étale left adjoint (quasicompact case)


Let f : Y′ → Y be a quasicompact separated étale map of small v-stacks and Λ with nΛ = 0 for n prime
to p. Then C5's f_! (the left adjoint of f^*, ECD Definition 19.1) agrees with Rf_! of
S1/lower-shriek-quasicompact, via a natural transformation f_!^ét → Rf_!.

**Hypotheses.**

- f quasicompact, separated, étale (so spatial-eligible with dim.trg 0, S0).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

**Construction and proof.**

1. Construct f_!^ét → Rf_! as adjoint to id → f^*Rf_!, using base change f^*Rf_! = Rπ₂!π₁^*
(S1/lower-shriek-base-change-qc) for the projections π₁, π₂ : Y′ ×_Y Y′ → Y′ and id = Rπ₂!RΔ!Δ^*π₁^*
→ Rπ₂!π₁^*, Δ being open and closed.
2. Both sides commute with base change; reduce to Y strictly totally disconnected, where Y′ is a
disjoint union of quasicompact opens of Y (S0/separated-etale-compactifiable) and the claim is clear
for an open immersion.

Proposed declaration: `lowerShriekQC_eq_etaleLowerShriek` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For a finite étale cover of degree d the comparison is the identification of f_!
with f_* (trace not involved).

**Depends on** within this roadmap `S1/lower-shriek-quasicompact`, `S1/lower-shriek-base-change-qc`,
`S0/separated-etale-compactifiable`; elsewhere `DiamondEtaleCohomology:C5`.

**Used in this roadmap by** `S2/lower-shriek-etale-agreement`.

**Source.** ECD Proposition 22.10, p. 133: “Then Rf! as defined in Definition 19.1 agrees with Rf!
as defined in Definition 22.4.”; ECD proof of Proposition 22.10, p. 133: “using that ∆ : Y ′ ,→ Y ′
×Y Y ′ is an open and closed immersion.”

### `S1/projection-formula-qc` — Projection formula (spatial-eligible case) ★


Let f : Y′ → Y be a spatial-eligible map of small v-sheaves and Λ with nΛ = 0 for n prime to p.
There is an isomorphism Rf_!B ⊗^L_Λ A ≃ Rf_!(B ⊗^L_Λ f^*A), functorial in B ∈ D_ét(Y′, Λ) (on the
source) and A ∈ D_ét(Y, Λ) (on the base). The extension to small v-stacks is part of
S2/projection-formula.

**Hypotheses.**

- f spatial-eligible between small v-sheaves (as printed).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

**Construction and proof.**

1. Open immersion j: the map j_!(B ⊗ j^*A) → j_!B ⊗ A adjoint to B ⊗ j^*A = j^*(j_!B ⊗ A) is an
isomorphism: reduce to Y strictly totally disconnected, where D_ét(Y) = D(|Y|) (C2), and check on
the closed complement i, where i^*(j_!B ⊗ A) = i^*j_!B ⊗ i^*A = 0.
2. General: Rf‾_*j_!B ⊗ A → Rf‾_*(j_!B ⊗ f‾^*A) ≅ Rf‾_*j_!(B ⊗ j^*f‾^*A) by the standard adjunction
map and the open case.
3. To test it, reduce by C3 (17.6) to Y = Spa(C, C⁺) and global sections; for A = j_{U!}A_U with U =
Y ∖ {s} both sides vanish by proper base change (C5, 19.2); so A is concentrated at s and then
constant.
4. A constant complex is a filtered colimit of perfect complexes; the perfect case is clear and
colimits are handled by S1/lower-shriek-direct-sums-qc.

Proposed declaration: `lowerShriekQC_projection` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For B = Λ and f the ball over Spa(C, O_C): Rf_!Λ ⊗ A ≃ Rf_!f^*A, so H²_c(B, f^*M) ≅
M(−1) for a Λ-module M.

**Depends on** within this roadmap `S1/lower-shriek-quasicompact`, `S1/lower-shriek-direct-sums-qc`;
elsewhere `DiamondEtaleCohomology:C2`, `DiamondEtaleCohomology:C3`, `DiamondEtaleCohomology:C5`.

**Used in this roadmap by** `S2/projection-formula`, `S4/profinite-projection-pushforward`.

**Source.** ECD Proposition 22.11, p. 133: “Then there is a functorial isomorphism Rf! B ⊗LΛ A ≃ Rf!
(B ⊗LΛ f ∗ A) in B ∈ Dét (Y ′ , Λ) and A ∈ Dét (Y, Λ).”; ECD proof of Proposition 22.11, p. 134: “As
such, it is a (derived) filtered colimit of perfect complexes of Λ-modules. The case of a perfect
complex is clear, and so the general case follows from the next proposition.”

### `S1/lower-shriek-direct-sums-qc` — Rf_! commutes with direct sums (spatial-eligible case)


Let f : Y′ → Y be a spatial-eligible map of small v-sheaves and Λ with nΛ = 0 for n prime to p. For
every family (Aᵢ)_{i∈I} in D_ét(Y′, Λ), the natural map ⊕ᵢ Rf_!Aᵢ → Rf_!(⊕ᵢ Aᵢ) is an isomorphism.

**Hypotheses.**

- f spatial-eligible between small v-sheaves.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p (ECD's standing assumption in §22).

**Construction and proof.**

1. By S1/lower-shriek-base-change-qc reduce to Y = Spa(C, C⁺) and global sections.
2. In a fixed degree d both sides depend only on τ^{≥ d − 3 dim.trg f}Aᵢ
(S1/compactification-cd-bound), so assume the Aᵢ uniformly bounded below.
3. The claim becomes that RΓ((Y′)‾^{/Y}, −) commutes with direct sums on D^{≥−n}_ét: these are
v-cohomology groups of small sheaves, and the κ-small v-topos of the qcqs v-sheaf (Y′)‾^{/Y} is
coherent, so SGA 4 VI 5.2 applies (D0/filtered-colimits-and-cohomology-on-coherent-sites).

Proposed declaration: `lowerShriekQC_preservesCoproducts` (module `TauCeti/Diamond/SixOperations/ProperPushforwardQC`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For f the ball over Spa(C, O_C) and Aᵢ = Λ for i ∈ ℕ: H²_c(B, ⊕Λ) = ⊕ Λ(−1).

**Depends on** within this roadmap `S1/lower-shriek-quasicompact`, `S1/compactification-cd-bound`,
`S1/lower-shriek-base-change-qc`; elsewhere
`DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`,
`DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`.

**Used in this roadmap by** `S1/projection-formula-qc`, `S2/lower-shriek-colimits-locally-spatial`.

**Source.** ECD Proposition 22.12, p. 134: “Then for any collection of objects Ai ∈ Dét (Y ′ , Λ), i
∈ I for some set I, the natural map”; ECD proof of Proposition 22.12, p. 135: “Now the sheaves are
small, and the (κ-small) v-topos of a qcqs v-sheaf is coherent, so we get the result by SGA 4 VI
Corollaire 5.2.”

## S2. Non-quasicompact maps and small v-stacks

For eligible maps of quasiseparated locally spatial diamonds, Rf_! is the left Kan extension of
Rf‾_* j_! from sheaves with proper support over the base (22.13); it commutes with colimits and base
change (22.14–22.15). For small v-stacks the construction is repeated over a simplicial v-hypercover
by quasiseparated locally spatial diamonds: a coherent diagram of coefficient and support
categories, its fibrewise left Kan extension (22.16), preservation of coCartesian edges (22.17), and
descent (22.18), independent of the hypercover. Base change, colimits, composition, étale agreement
and the projection formula (22.19–22.23) are enhanced statements; the projection formula is extended
from v-sheaves to v-stacks by hyperdescent, and the pasting identities of the exchange equivalences
are part of the interface. Supplier stages: DiamondEtaleCohomology C2, C3, C5;
EnhancedDerivedSheaves E0, E2, E3.

Planets of this layer: Rf_! by left Kan extension (`S2/lower-shriek-locally-spatial`); Exceptional
direct image Rf_! (`S2/lower-shriek`); Base change for Rf_! (`S2/lower-shriek-base-change`);
Composition of Rf_! (`S2/lower-shriek-composition`); Projection formula (`S2/projection-formula`).

Other roadmaps' stages used (requested): `DiamondEtaleCohomology:C2`, `DiamondEtaleCohomology:C3`,
`DiamondEtaleCohomology:C4`, `DiamondEtaleCohomology:C5`, `EnhancedDerivedSheaves:E0`,
`EnhancedDerivedSheaves:E2`, `EnhancedDerivedSheaves:E3`.

Other roadmaps' declarations and nodes used: `DiamondsAndVStacks:D5/spatial-diamond`.

Acceptance tests of the layer: the open unit disc, where Rf_!Λ = Λ(−1)[−2] differs from Rf_*Λ = Λ;
independence of the hypercover; base change of the ball along X → *.

### `S2/proper-support-subcategory` — Sheaves with proper support over the base


Let f : Y′ → Y be an eligible map of quasiseparated locally spatial diamonds (S0/eligible-morphism),
with canonical factorisation j : Y′ → (Y′)‾^{/Y} and partially proper f‾. D_ét,prop/Y(Y′, Λ) is the
full ∞-subcategory of D_ét(Y′, Λ) of objects A with A ≃ j_{V!}j_V^*A for some open subspace j_V : V
→ Y′ that is quasicompact over Y (V → Y quasicompact). For such A and V, j_!A is supported on the
closure of V in (Y′)‾^{/Y}, which is proper over Y. The subcategory is stable under pullback along
maps of quasiseparated locally spatial diamonds over Y.

**Hypotheses.**

- Y, Y′ quasiseparated locally spatial diamonds; f eligible.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. Define the full subcategory by the existence of a quasicompact-over-Y open V with A ≃
j_{V!}j_V^*A (C5 extension by zero for open immersions).
2. Every A ∈ D_ét(Y′, Λ) is the filtered colimit of A_V = j_{V!}j_V^*A over the filtered poset of
such V (Y′ is a union of them, Y being quasiseparated locally spatial).
3. Pullback along Ỹ → Y preserves the condition, since quasicompactness over Y and j_{V!} are stable
under base change (C5).

Proposed declaration: `properSupportSubcategory` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `mem_properSupportSubcategory_iff` | characterisation | A lies in D_ét,prop/Y(Y′, Λ) iff A ≃ j_{V!}j_V^*A for an open V ⊂ Y′ quasicompact over Y. |
| `properSupportSubcategory.extendByZero_mem` | constructor | For V ⊂ Y′ open and quasicompact over Y and B ∈ D_ét(V, Λ), j_{V!}B lies in the subcategory. |
| `properSupportSubcategory.colimit_eq` | other | Every A ∈ D_ét(Y′, Λ) is the filtered colimit of j_{V!}j_V^*A over the opens V quasicompact over Y. |
| `properSupportSubcategory.pullback_mem` | functoriality | Pullback along a map Ỹ → Y of quasiseparated locally spatial diamonds carries D_ét,prop/Y(Y′, Λ) into D_ét,prop/Ỹ(Ỹ′, Λ). |
| `properSupportSubcategory.of_isQuasicompact` | compatibility | If f is quasicompact (spatial-eligible), the subcategory is all of D_ét(Y′, Λ). |

**Used by.**

- ECD Definition 22.13: Rf_! is the left Kan extension of Rf‾_* j_! from this subcategory.
- ECD §22, construction before Lemma 22.16: its fibrewise version over a simplicial hypercover is a
  coCartesian fibration over Δ.
- ECD Proposition 22.21 and 22.23 (proofs): composition and projection formula are first identified
  on proper-support objects.

**Unit tests.**

- `properSupportSubcategory_of_qc` (degenerate): If Y′ → Y is quasicompact, every object of D_ét(Y′,
  Λ) has proper support (take V = Y′).
- `properSupportSubcategory_disc` (computation): For the open unit disc D → Spa(C, O_C) and the
  closed subdisc V of radius |ϖ|, j_{V!}Λ ∈ D_ét,prop(D, Λ).
- `not_mem_properSupportSubcategory_const` (non-example): The constant sheaf Λ on the open unit disc
  D over Spa(C, O_C) does not have proper support: Λ ≃ j_{V!}j_V^*Λ fails for every quasicompact V ⊊
  D, since its stalks off V are nonzero.

**Acceptance.** For f : D → Spa(C, O_C) the open disc, j_{V!}Λ for V a closed subdisc lies in the
subcategory, Λ itself does not.

**Depends on** within this roadmap `S0/eligible-morphism`; elsewhere
`DiamondsAndVStacks:D5/spatial-diamond`, `DiamondEtaleCohomology:C5`, `DiamondEtaleCohomology:C2`.

**Used in this roadmap by** `S2/lower-shriek-locally-spatial`, `S2/filtered-support-formula`,
`S2/hypercover-support-diagram`.

**Source.** ECD Definition 22.13, p. 135: “be the full ∞-subcategory of A ∈ Dét (Y , Λ) such that A
≃ jV ! jV∗ A for some open subspace”; ECD Definition 22.13, p. 135: “In other words, on the full
∞-subcategory Dét,prop/Y (Y ′ , Λ) ⊂ Dét (Y ′ , Λ) of sheaves “with proper”

### `S2/lower-shriek-locally-spatial` — Rf_! over a quasiseparated locally spatial base, by left Kan extension ★


Let f : Y′ → Y be an eligible map of quasiseparated locally spatial diamonds and Λ with nΛ = 0, n
prime to p. Define Rf_! : D_ét(Y′, Λ) → D_ét(Y, Λ) as the left Kan extension (EnhancedDerivedSheaves
E3, HTT 4.3.2.14, along the full inclusion) of the functor Rf‾_* ∘ j_! : D_ét,prop/Y(Y′, Λ) →
D_ét(Y, Λ) (S2/proper-support-subcategory). It is a functor of stable ∞-categories; the left Kan
extension is not replaced by a choice of representatives of complexes. On D_ét,prop/Y it is
Rf‾_*j_!, and for A_V = j_{V!}j_V^*A one has Rf_!A_V = R(f|_V)_!(j_V^*A) with f|_V spatial-eligible
(S1/lower-shriek-quasicompact).

**Hypotheses.**

- f eligible between quasiseparated locally spatial diamonds.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. Rf‾_*j_! is defined on D_ét,prop/Y: for A = j_{V!}j_V^*A, Rf‾_*j_!A = Rf‾_*g_*j′_{V!}(j_V^*A) =
R(f|_V)_!(j_V^*A) with g : V‾^{/Y} → (Y′)‾^{/Y} the closed immersion and j′_V : V → V‾^{/Y}, so its
values are those of the quasicompact construction.
2. D_ét(Y, Λ) is presentable (C2), so the left Kan extension along the full inclusion exists (E3,
HTT 4.3.2.14) and restricts to Rf‾_*j_! on the subcategory.
3. By the pointwise formula (HTT 4.3.2.2) and filteredness of the index
(S2/proper-support-subcategory), Rf_!A = colim_V Rf_!A_V.

Proposed declaration: `lowerShriekLocSpatial` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `lowerShriekLocSpatial_restrict` | characterisation | On D_ét,prop/Y(Y′, Λ), Rf_! ≅ Rf‾_* ∘ j_! (the unit of the left Kan extension is an equivalence along a full inclusion). |
| `lowerShriekLocSpatial_colim` | characterisation | Rf_!A ≅ colim_V R(f∣_V)_!(j_V^*A) over opens V quasicompact over Y (S2/filtered-support-formula). |
| `lowerShriekLocSpatial_eq_qc` | compatibility | If f is quasicompact (spatial-eligible), Rf_! agrees with S1/lower-shriek-quasicompact. |
| `lowerShriekLocSpatial_preservesColimits` | other | Rf_! preserves all colimits (S2/lower-shriek-colimits-locally-spatial). |
| `lowerShriekLocSpatial_baseChange` | functoriality | g^*Rf_! ≃ Rf̃_!g′^* for g : Ỹ → Y a map of quasiseparated locally spatial diamonds (S2/lower-shriek-base-change-locally-spatial). |
| `lowerShriekLocSpatial_isLeftKanExtension` | universal-property | Rf_! with the identification on D_ét,prop/Y is a left Kan extension: natural transformations Rf_! → G correspond to transformations Rf‾_*j_! → G∣_{D_prop}. |

**Used by.**

- ECD Propositions 22.14 and 22.15: colimit preservation and base change over locally spatial bases.
- ECD Lemma 22.16: the fibres of the hypercover construction are these functors.
- VStackSheavesAndLisseCategories:VS0 (FS IV.5): partially compactly supported functors Rβ_{!+},
  Rβ_{!−} are built on this construction.

**Unit tests.**

- `lowerShriekLocSpatial_qc` (degenerate): If f is quasicompact the construction is
  S1/lower-shriek-quasicompact.
- `lowerShriekLocSpatial_openDisc` (computation): For the open unit disc f : D → Spa(C, O_C),
  R²f_!Λ(1) ≅ Λ and R^i f_!Λ = 0 for i ≠ 2 (colimit of the closed subdiscs, with isomorphic
  transition maps).
- `lowerShriekLocSpatial_ne_pushforward` (non-example): For the open unit disc, Rf_*Λ = Λ in degree
  0 (D is cohomologically a point, H4) while Rf_!Λ = Λ(−1)[−2]; the left Kan extension is not Rf‾_*
  applied to j_! of all objects.

**Acceptance.** For the open unit disc D → Spa(C, O_C), Rf_!Λ = colim_r R(f|_{D_r})_!Λ over closed
subdiscs D_r, which is Λ(−1)[−2].

**Depends on** within this roadmap `S2/proper-support-subcategory`, `S1/lower-shriek-quasicompact`,
`S0/spatial-eligible-morphism`; elsewhere `EnhancedDerivedSheaves:E3`, `DiamondEtaleCohomology:C2`,
`DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S2/filtered-support-formula`,
`S2/lower-shriek-base-change-locally-spatial`, `S2/hypercover-support-diagram`,
`S2/fibrewise-lower-shriek`.

**Source.** ECD Definition 22.13, p. 135: “is defined as the left Kan extension of”; ECD Definition
22.13, p. 135: “write A as a filtered colimit of objects AV = jV ! jV∗ A ∈ Dét,prop/Y (Y ′ , Λ), and
then by definition (cf. [Lur09, Definition 4.3.2.2])”; ECD §22, p. 135: “Unfortunately, it is
somewhat tricky to resolve all homotopy coherence issues in this approach.”

### `S2/filtered-support-formula` — The filtered-support formula for Rf_!


For f : Y′ → Y eligible between quasiseparated locally spatial diamonds and A ∈ D_ét(Y′, Λ), the
natural map colim_V R(f|_V)_!(j_V^*A) → Rf_!A, over the filtered poset of opens V ⊂ Y′ quasicompact
over Y, is an equivalence, and R(f|_V)_!(j_V^*A) = Rf‾_*j_!(j_{V!}j_V^*A).

**Hypotheses.**

- f eligible between quasiseparated locally spatial diamonds.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. Pointwise formula for left Kan extensions along full inclusions (E3, HTT 4.3.2.2): Rf_!A = colim
over (D_ét,prop/Y)/A.
2. The subdiagram of objects A_V → A is cofinal in that slice (every B → A with B proper-support
factors through some A_V, B = j_{W!}j_W^*B with W ⊂ V), and it is filtered
(S2/proper-support-subcategory).
3. The identification of the terms is the closed-immersion computation in
S2/lower-shriek-locally-spatial.

Proposed declaration: `lowerShriekLocSpatial_colim` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For a disjoint union Y′ = ⊔ᵢ Vᵢ of quasicompact opens over Y, Rf_!A = ⊕ᵢ
R(f|_{Vᵢ})_!A|_{Vᵢ}.

**Depends on** within this roadmap `S2/lower-shriek-locally-spatial`,
`S2/proper-support-subcategory`; elsewhere `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S2/lower-shriek-colimits-locally-spatial`.

**Source.** ECD Definition 22.13, p. 135: “Note that here, Rf! AV = R(f |V )! (jV∗ A), as”

### `S2/lower-shriek-colimits-locally-spatial` — Rf_! preserves colimits over a locally spatial base


For f : Y′ → Y eligible between quasiseparated locally spatial diamonds and Λ with nΛ = 0 (n prime
to p), Rf_! : D_ét(Y′, Λ) → D_ét(Y, Λ) commutes with all direct sums, equivalently (HA 1.4.4.1(2),
E3) with all colimits.

**Hypotheses.**

- As in S2/lower-shriek-locally-spatial.

**Construction and proof.**

1. Write each Aᵢ as colim_V A_{i,V}; then Rf_!(⊕ᵢAᵢ) = colim_V R(f|_V)_!j_V^*(⊕ᵢAᵢ) = colim_V ⊕ᵢ
R(f|_V)_!j_V^*Aᵢ by S1/lower-shriek-direct-sums-qc.
2. Exchange the colimits and use S2/filtered-support-formula for each Aᵢ.
3. An exact functor of stable presentable categories preserving direct sums preserves all colimits
(E3).

Proposed declaration: `lowerShriekLocSpatial_preservesColimits` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Rf_! of a countable direct sum of skyscrapers on the open disc is the direct sum of
their compactly supported cohomologies.

**Depends on** within this roadmap `S2/filtered-support-formula`, `S1/lower-shriek-direct-sums-qc`;
elsewhere `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S2/lower-shriek-base-change-locally-spatial`,
`S2/lower-shriek-colimits`.

**Source.** ECD Proposition 22.14, p. 135: “commutes with all direct sums; equivalently (cf. [Lur16,
Proposition 1.4.4.1 (2)]), with all colimits.”; ECD proof of Proposition 22.14, p. 136: “which
commutes with arbitrary direct sums by Proposition 22.12.”

### `S2/lower-shriek-base-change-locally-spatial` — Base change for Rf_! over locally spatial bases


Let f : Y′ → Y be eligible between quasiseparated locally spatial diamonds, Λ with nΛ = 0 (n prime
to p), and g : Ỹ → Y a map of quasiseparated locally spatial diamonds with pullbacks f̃, g′. There
is a natural base-change equivalence g^*Rf_! ≃ Rf̃_!g′^*. The base Ỹ must be quasiseparated, as the
construction of Rf̃_! requires (correction PAPER-SCHOLZE-17/E99 of the printed 'any map of locally
spatial diamonds').

**Hypotheses.**

- g a map of quasiseparated locally spatial diamonds (corrected hypothesis).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. The transformation: j_! commutes with base change (C5) and Rf‾_* has a base-change map (C3); this
gives g^*Rf‾_*j_! → Rf̃‾_*j̃_!g′^* on D_ét,prop/Y and, by the universal property of the left Kan
extension, g^*Rf_! → Rf̃_!g′^*.
2. On D_ét,prop/Y it is an equivalence by S1/lower-shriek-base-change-qc applied to f|_V.
3. Both functors commute with the filtered colimit A = colim A_V: g^*Rf_! by definition, Rf̃_!g′^*
by S2/lower-shriek-colimits-locally-spatial.

Proposed declaration: `lowerShriekLocSpatial_baseChange` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Pulling back the open disc over Spa(C, O_C) to a strictly totally disconnected X
gives the open disc over X, and R²f_!Λ(1) pulls back to the constant sheaf Λ.

**Depends on** within this roadmap `S2/lower-shriek-locally-spatial`,
`S1/lower-shriek-base-change-qc`, `S2/lower-shriek-colimits-locally-spatial`; elsewhere
`DiamondEtaleCohomology:C3`, `DiamondEtaleCohomology:C5`.

**Used in this roadmap by** `S2/cocartesian-preservation`, `S2/hypercover-independence`,
`S2/lower-shriek-base-change`.

**Source.** ECD Proposition 22.15, p. 136: “There is a natural base change equivalence g ∗ Rf! ≃
Rfe! g ′∗ of functors Dét (Y ′ , Λ) → Dét (Ye , Λ).”; ECD proof of Proposition 22.15, p. 136: “On
Dét,prop/Y (Y ′ , Λ), the base change map is an equivalence by Proposition 22.8.”

### `S2/hypercover-support-diagram` — The coherent support diagram over a simplicial v-hypercover


Let f : Y′ → Y be an eligible map of small v-stacks, Y• → Y a simplicial v-hypercover with every Yᵢ
a quasiseparated locally spatial diamond (EnhancedDerivedSheaves E2), Y′• = Y′ ×_Y Y•, and Λ with nΛ
= 0 (n prime to p). Construct: (1) the coCartesian fibrations over Δ classified by i ↦ D_ét(Y′ᵢ, Λ),
i ↦ D_ét((Y′ᵢ)‾^{/Yᵢ}, Λ) and i ↦ D_ét(Yᵢ, Λ) with pullback functors (E0, E3; Liu–Zheng's diagrams
of ringed topoi, the étale condition passing to full subcategories); (2) the full sub-fibration
D_ét,prop/Y•(Y′•, Λ)⁰ with fibres D_ét,prop/Yᵢ(Y′ᵢ, Λ), again coCartesian because pullback preserves
proper support (S2/proper-support-subcategory); (3) the fully faithful left adjoint j•! of j•^*,
fibrewise jᵢ!, and the right adjoint Rf‾•_* of f‾•^*, fibrewise Rf‾ᵢ_*; (4) Rf•!⁰ : D_ét(Y′•, Λ)⁰ →
D_ét(Y•, Λ)⁰, the left Kan extension of Rf‾•_* j•! along D_ét,prop/Y•(Y′•, Λ)⁰ ⊂ D_ét(Y′•, Λ)⁰ (HTT
4.3.2.14). All four are functors over Δ of ∞-categories, not of homotopy categories.

**Hypotheses.**

- Y• → Y a simplicial v-hypercover by quasiseparated locally spatial diamonds; f eligible (so each
  fᵢ is eligible, S0).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. Diagram of categories: the functor Δ → Cat_∞, i ↦ D_ét(Yᵢ, Λ), comes from the diagram of v-topoi
(E3, as in Liu–Zheng §2); unstraighten to a coCartesian fibration (E0).
2. The sub-fibration of proper-support objects is coCartesian because pullback preserves the
condition (S2/proper-support-subcategory).
3. j•! exists fibrewise and commutes with pullback (C5), hence is a functor over Δ, fully faithful
and left adjoint to j•^*; Rf‾•_* is the relative right adjoint of f‾•^*, fibrewise Rf‾ᵢ_*.
4. The left Kan extension of Rf‾•_* j•! exists by HTT 4.3.2.14 (E3), D_ét(Y•, Λ)⁰ being fibrewise
presentable (C2).

Proposed declarations: `hypercoverSupportDiagram`, `lowerShriekHypercover` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `hypercoverSupportDiagram.fibre` | projection | The fibre of D_ét,prop/Y•(Y′•, Λ)⁰ over [i] is D_ét,prop/Yᵢ(Y′ᵢ, Λ). |
| `hypercoverSupportDiagram.isCocartesian` | structure | D_ét,prop/Y•(Y′•, Λ)⁰ → Δ is a coCartesian fibration and its inclusion into D_ét(Y′•, Λ)⁰ preserves coCartesian edges. |
| `hypercoverSupportDiagram.extendByZero_fibre` | projection | j•! is fibrewise jᵢ! and is fully faithful and left adjoint to j•^*. |
| `hypercoverSupportDiagram.pushforward_fibre` | projection | Rf‾•_* is fibrewise Rf‾ᵢ_*. |
| `lowerShriekHypercover_fibre` | characterisation | Over [i], Rf•!⁰ is Rfᵢ! of S2/lower-shriek-locally-spatial (S2/fibrewise-lower-shriek). |
| `lowerShriekHypercover_cocartesian` | structure | Rf•!⁰ preserves coCartesian edges (S2/cocartesian-preservation). |
| `hypercoverSupportDiagram.refine` | functoriality | A map of hypercovers Ỹ• → Y• over Y induces a map of diagrams, compatible with Rf•!⁰ (S2/hypercover-independence). |

**Used by.**

- ECD Lemmas 22.16–22.17 and Definition 22.18: passage to coCartesian sections defines Rf_! for
  small v-stacks.
- ECD Propositions 22.19, 22.21, 22.23 (proofs): base change, composition and the projection formula
  are proved by repeating the construction over Δ × Δ¹ and comparing on proper-support objects.
- VStackSheavesAndLisseCategories:VS0: descent of exceptional operations along charts of Artin
  v-stacks uses the same coherent diagrams.

**Unit tests.**

- `hypercoverSupportDiagram_constant` (degenerate): For the constant hypercover of a quasiseparated
  locally spatial Y, the diagram is constant with fibre D_ét(Y′, Λ) and Rf•!⁰ is
  S2/lower-shriek-locally-spatial.
- `hypercoverSupportDiagram_qc` (computation): If f is quasicompact, every fibre of the support
  sub-fibration is the whole fibre, and Rf•!⁰ is fibrewise Rf‾ᵢ_*jᵢ!.
- `hypercoverSupportDiagram_homotopy_category_insufficient` (non-example): Choosing objects
  fibrewise in homotopy categories does not define a functor to coCartesian sections: the diagram i
  ↦ Ho D_ét(Yᵢ, Λ) does not determine D_ét(Y, Λ) (descent fails for homotopy categories), so the
  construction must be made in Cat_∞.

**Acceptance.** For the constant hypercover Y• = Y (Y quasiseparated locally spatial) the diagram is
constant and Rf•!⁰ is S2/lower-shriek-locally-spatial in every degree.

**Depends on** within this roadmap `S2/proper-support-subcategory`,
`S2/lower-shriek-locally-spatial`, `S0/eligible-morphism`; elsewhere `EnhancedDerivedSheaves:E0`,
`EnhancedDerivedSheaves:E2`, `EnhancedDerivedSheaves:E3`, `DiamondEtaleCohomology:C2`,
`DiamondEtaleCohomology:C5`.

**Used in this roadmap by** `S2/fibrewise-lower-shriek`, `S2/lower-shriek`,
`S2/hypercover-independence`, `S2/lower-shriek-base-change`, `S2/lower-shriek-composition`,
`S2/projection-formula`.

**Source.** ECD §22, construction before Lemma 22.16, p. 136: “This is encoded in a coCartesian
fibration Dét (Y•′ , Λ)0 → ∆, whose ∞-category of sections is the ∞-derived category Dét (Y•′ , Λ)
of the simplicial space Y•′ .”; ECD §22, construction before Lemma 22.16, p. 136: “As pullbacks
preserve this condition, this is still a coCartesian fibration over ∆.”; ECD §22, construction
before Lemma 22.16, p. 137: “be its left Kan extension, which exists by [Lur09, Corollary
4.3.2.14].”

### `S2/fibrewise-lower-shriek` — The fibres of the hypercover construction


In the situation of S2/hypercover-support-diagram, the functor Rf•!⁰ is given in the fibre over [i]
∈ Δ by Rfᵢ! : D_ét(Y′ᵢ, Λ) → D_ét(Yᵢ, Λ) of S2/lower-shriek-locally-spatial.

**Hypotheses.**

- As in S2/hypercover-support-diagram.

**Construction and proof.**

1. Because D_ét,prop/Y•(Y′•, Λ)⁰ is coCartesian over Δ, for A ∈ D_ét(Y′ᵢ, Λ) the inclusion
D_ét,prop/Yᵢ(Y′ᵢ, Λ)/A → D_ét,prop/Y•(Y′•, Λ)⁰/A is cofinal.
2. The index category is filtered; by HTT 4.3.1.7 (E3) the colimits computing the two left Kan
extensions agree.

Proposed declaration: `lowerShriekHypercover_fibre` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For the constant hypercover this is the tautology Rf_! = Rf_!.

**Depends on** within this roadmap `S2/hypercover-support-diagram`,
`S2/lower-shriek-locally-spatial`; elsewhere `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S2/cocartesian-preservation`.

**Source.** ECD Lemma 22.16, p. 137: “The functor Rf•!0 is given by Rfi! : Dét (Yi′ , Λ) → Dét (Yi ,
Λ) in the fibre over i ∈ ∆.”; ECD proof of Lemma 22.16, p. 137: “Taken together, these imply that
the relevant colimits agree (using [Lur09, Proposition 4.3.1.7] to see that one may pass to a
cofinal subcategory).”

### `S2/cocartesian-preservation` — Rf•!⁰ preserves coCartesian edges


The functor Rf•!⁰ : D_ét(Y′•, Λ)⁰ → D_ét(Y•, Λ)⁰ of S2/hypercover-support-diagram sends coCartesian
edges to coCartesian edges; hence it restricts to coCartesian sections, D_ét,cart(Y′•, Λ) →
D_ét,cart(Y•, Λ).

**Hypotheses.**

- As in S2/hypercover-support-diagram.

**Construction and proof.**

1. A coCartesian edge over [i] → [k] is A → α^*A; its image is Rfᵢ!A → Rf_k!α′^*A by
S2/fibrewise-lower-shriek.
2. This is the base-change map, an equivalence by S2/lower-shriek-base-change-locally-spatial (the
Yᵢ quasiseparated locally spatial).

Proposed declaration: `lowerShriekHypercover_cocartesian` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For the constant hypercover every edge is an identity.

**Depends on** within this roadmap `S2/fibrewise-lower-shriek`,
`S2/lower-shriek-base-change-locally-spatial`; elsewhere `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S2/lower-shriek`.

**Source.** ECD Lemma 22.17, p. 137: “The functor Rf•!0 : Dét (Y•′ , Λ)0 → Dét (Y• , Λ)0 sends
coCartesian edges to coCartesian edges.”; ECD proof of Lemma 22.17, p. 137: “This follows from the
previous lemma and Proposition 22.15.”

### `S2/lower-shriek` — The exceptional direct image Rf_! for eligible maps of small v-stacks ★


Let f : Y′ → Y be an eligible map of small v-stacks (compactifiable, representable in locally
spatial diamonds, locally dim.trg f < ∞) and Λ with nΛ = 0, n prime to p. Choose a simplicial
v-hypercover Y• → Y by quasiseparated locally spatial diamonds and define Rf_! as the composite
D_ét(Y′, Λ) ≃ D_ét,cart(Y′•, Λ) → D_ét,cart(Y•, Λ) ≃ D_ét(Y, Λ) of hyperdescent (C2, ECD 17.3) and
the restriction of Rf•!⁰ to coCartesian sections (S2/cocartesian-preservation); ECD's Rf_! is its
homotopy-category functor. It is independent of the hypercover (S2/hypercover-independence) and
agrees with S2/lower-shriek-locally-spatial when Y is a quasiseparated locally spatial diamond and
with S1/lower-shriek-quasicompact when f is spatial-eligible. The domain is the eligible class; for
maps of Artin v-stacks that are not representable in locally spatial diamonds, the operations are
VStackSheavesAndLisseCategories VS0's, not this construction.

**Hypotheses.**

- f eligible between small v-stacks.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. Existence of a hypercover by quasiseparated locally spatial diamonds (E2: every small v-stack has
a v-cover by a disjoint union of strictly totally disconnected spaces).
2. Hyperdescent identifies D_ét(Y, Λ) and D_ét(Y′, Λ) with coCartesian sections (C2, ECD 17.3).
3. Rf•!⁰ restricts to coCartesian sections by S2/cocartesian-preservation; compose.

Proposed declaration: `lowerShriek` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `lowerShriek_eq_locSpatial` | compatibility | If Y is a quasiseparated locally spatial diamond, Rf_! ≅ S2/lower-shriek-locally-spatial. |
| `lowerShriek_eq_qc` | compatibility | If f is spatial-eligible, Rf_! ≅ Rf‾_* ∘ j_! (S1/lower-shriek-quasicompact). |
| `lowerShriek_hypercover_indep` | characterisation | Rf_! does not depend on the hypercover, up to a coherent equivalence (S2/hypercover-independence). |
| `lowerShriek_baseChange` | functoriality | g^*Rf_! ≃ Rf̃_!g′^* for every map g of small v-stacks (S2/lower-shriek-base-change). |
| `lowerShriek_preservesColimits` | other | Rf_! preserves all colimits (S2/lower-shriek-colimits). |
| `lowerShriek_comp` | functoriality | R(f ∘ g)_! ≃ Rf_! ∘ Rg_! (S2/lower-shriek-composition). |
| `lowerShriek_id` | simp | R(id)_! ≃ id, compatibly with the composition equivalence. |
| `lowerShriek_etale` | compatibility | For f separated étale, Rf_! ≅ C5's f_! (S2/lower-shriek-etale-agreement). |
| `lowerShriek_projection` | relation | Rf_!B ⊗^L A ≃ Rf_!(B ⊗^L f^*A) (S2/projection-formula). |

**Used by.**

- ECD Theorem 23.1: Rf^! is the right adjoint of this functor.
- ECD Definition 23.8 and Propositions 23.10–23.12: cohomological smoothness compares Rf^! with f^*.
- ECD Theorem 25.1: RΓ_c and Poincaré duality on smooth curves over Spa(C, O_C).
- VStackSheavesAndLisseCategories:VS0–VS2: the stacky and solid operations restrict to this one on
  the eligible class.
- IgusaVarietiesAndTorsionConcentration:IG.3: compactly supported cohomology of Igusa-type diamonds
  over Spd C.
- AdicCoefficientsAndComparisons:L0, L4: ℓ-adic and mixed-characteristic Rf_! are built from and
  compared with this functor.

**Unit tests.**

- `lowerShriek_id_test` (degenerate): R(id_Y)_! ≅ id for every small v-stack Y.
- `lowerShriek_open_immersion` (compatibility): For an open immersion j : U → Y of small v-stacks,
  Rj_! is C5's extension by zero j_!.
- `lowerShriek_classifying_not_eligible` (non-example): For a nontrivial profinite group K acting
  trivially, the map [*/K] → * is not representable in locally spatial diamonds (its fibre over a
  point is not a diamond), so R(−)_! of this section does not apply; such stacky maps are VS0's.
- `lowerShriek_ball_point` (computation): For f : B → *, Rf_!Λ ≅ Λ(−1)[−2] (S5/ball-smooth with
  Rf_!Rf^!Λ → Λ an isomorphism here).

**Acceptance.** For Y a quasiseparated locally spatial diamond and the constant hypercover, Rf_! is
S2/lower-shriek-locally-spatial; for (Spa ℚ_p)^♢ → * it is defined since that map is eligible
(S5/spd-qp-smooth).

**Depends on** within this roadmap `S2/hypercover-support-diagram`, `S2/cocartesian-preservation`,
`S0/eligible-morphism`; elsewhere `DiamondEtaleCohomology:C2`, `EnhancedDerivedSheaves:E2`.

**Used in this roadmap by** `S2/hypercover-independence`, `S2/lower-shriek-base-change`,
`S2/lower-shriek-composition`, `S2/lower-shriek-etale-agreement`, `S2/projection-formula`,
`S3/upper-shriek`, `S6/finiteness-of-cohomology`.

**Source.** ECD §22, after Lemma 22.17, p. 137: “Rf! : Dét (Y ′ , Λ) ≃ Dét,cart (Y•′ , Λ) → Dét,cart
(Y• , Λ) ≃ Dét (Y, Λ) ,”; ECD Definition 22.18, p. 137: “is the functor obtained from the previous
discussion by passage to homotopy categories.”

### `S2/hypercover-independence` — Independence of the hypercover


The functor Rf_! of S2/lower-shriek does not depend on the choice of the hypercover: for two
simplicial v-hypercovers Y• → Y and Ỹ• → Y by quasiseparated locally spatial diamonds there is a
natural equivalence between the two functors, obtained through a common refinement, and these
equivalences are compatible with further refinement (form a coherent system).

**Hypotheses.**

- Y• and Ỹ• hypercovers as in S2/lower-shriek.

**Construction and proof.**

1. Choose a common refinement Z• → Y• ×_Y Ỹ• by quasiseparated locally spatial diamonds (E2).
2. A map of hypercovers Z• → Y• induces a map of support diagrams (S2/hypercover-support-diagram,
refine) compatible with Rf•!⁰ on fibres (S2/fibrewise-lower-shriek and base change
S2/lower-shriek-base-change-locally-spatial), hence an equivalence of the functors on coCartesian
sections (both identify with D_ét(Y, Λ) by hyperdescent, C2).
3. Compatibility for chains of refinements follows from the same construction over Δ × Δ¹ × Δ¹ (E0).

Proposed declaration: `lowerShriek_hypercover_indep` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For Y quasiseparated locally spatial, the constant hypercover and any hypercover
give the same Rf_!.

**Depends on** within this roadmap `S2/lower-shriek`, `S2/hypercover-support-diagram`,
`S2/lower-shriek-base-change-locally-spatial`; elsewhere `EnhancedDerivedSheaves:E0`,
`EnhancedDerivedSheaves:E2`, `DiamondEtaleCohomology:C2`.

**Source.** ECD Definition 22.18, p. 137: “It is easy to see that this is independent of the choice
of the simplicial v-hypercover, by passing to common refinements.”

### `S2/lower-shriek-base-change` — Base change for Rf_! (general) ★


Let f : Y′ → Y be an eligible map of small v-stacks, Λ with nΛ = 0 (n prime to p), and g : Ỹ → Y any
map of small v-stacks with pullbacks f̃ : Ỹ′ → Ỹ, g′ : Ỹ′ → Y′. There is a natural base-change
equivalence g^*Rf_! ≃ Rf̃_!g′^* of functors D_ét(Y′, Λ) → D_ét(Ỹ, Λ), constructed at the enhanced
level.

**Hypotheses.**

- f eligible; g arbitrary map of small v-stacks.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. Choose hypercovers Y• → Y and Ỹ• → Ỹ by quasiseparated locally spatial diamonds with a map g• :
Ỹ• → Y• over g (E2).
2. Repeat S2/hypercover-support-diagram over Δ × Δ¹ (E0): the edge over Δ¹ is pullback along g•; the
fibrewise left Kan extension preserves coCartesian edges in both directions by
S2/lower-shriek-base-change-locally-spatial.
3. Passing to coCartesian sections gives g^*Rf_! ≃ Rf̃_!g′^*.

Proposed declaration: `lowerShriek_baseChange` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Base change of the ball B → * along any perfectoid X → * gives the relative ball B ×
X → X, so Rf_!Λ pulls back to R(f_X)_!Λ.

**Depends on** within this roadmap `S2/lower-shriek`, `S2/hypercover-support-diagram`,
`S2/lower-shriek-base-change-locally-spatial`; elsewhere `EnhancedDerivedSheaves:E0`,
`EnhancedDerivedSheaves:E2`.

**Used in this roadmap by** `S2/lower-shriek-colimits`, `S2/lower-shriek-etale-agreement`,
`S2/exchange-pasting-coherence`, `S3/upper-shriek-pushforward-exchange`, `S3/adjunction-calculus`,
`S4/smooth-perfect-constructible`, `S5/ball-smooth`.

**Source.** ECD Proposition 22.19, p. 137: “There is a natural base change equivalence g ∗ Rf! ≃
Rfe! g ′∗ of functors Dét (Y ′ , Λ) → Dét (Ye , Λ).”; ECD proof of Proposition 22.19, p. 138:
“Repeating the previous discussion over ∆ again over ∆ × ∆1 gives the result.”

### `S2/lower-shriek-colimits` — Rf_! preserves colimits (general)


For f : Y′ → Y eligible between small v-stacks and Λ with nΛ = 0 (n prime to p), Rf_! commutes with
all direct sums, equivalently with all colimits.

**Hypotheses.**

- As in S2/lower-shriek.

**Construction and proof.**

1. By S2/lower-shriek-base-change, pullback along a hypercover is conservative and commutes with
Rf_!, so it suffices to treat Y quasiseparated locally spatial.
2. There it is S2/lower-shriek-colimits-locally-spatial; HA 1.4.4.1(2) (E3) passes from direct sums
to colimits.

Proposed declaration: `lowerShriek_preservesColimits` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** The input of the adjoint functor theorem in S3/upper-shriek.

**Depends on** within this roadmap `S2/lower-shriek-colimits-locally-spatial`,
`S2/lower-shriek-base-change`; elsewhere `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S2/lower-shriek-composition`, `S2/lower-shriek-etale-agreement`,
`S3/upper-shriek`.

**Source.** ECD Proposition 22.20, p. 138: “commutes with all direct sums; equivalently (cf. [Lur16,
Proposition 1.4.4.1 (2)]), with all colimits.”; ECD proof of Proposition 22.20, p. 138: “This
follows from Proposition 22.14 and Proposition 22.19.”

### `S2/lower-shriek-composition` — Composition of Rf_! (general) ★


Let g : Y″ → Y′ and f : Y′ → Y be eligible maps of small v-stacks and Λ with nΛ = 0 (n prime to p).
There is a natural equivalence Rf_! ∘ Rg_! ≃ R(f ∘ g)_! of functors D_ét(Y″, Λ) → D_ét(Y, Λ),
coherent with identities and associative for triple composites.

**Hypotheses.**

- f, g eligible (so f ∘ g is, S0/eligible-morphism).

**Construction and proof.**

1. Choose a hypercover Y• → Y by quasiseparated locally spatial diamonds and pull back to Y′•, Y″•
(again such hypercovers, f, g being representable in locally spatial diamonds).
2. On D_ét,prop/Y•(Y″•, Λ)⁰ the functors Rf•!⁰ ∘ Rg•!⁰ and R(f ∘ g)•!⁰ are identified by
S1/lower-shriek-composition-qc and its proof (fibrewise proper base change).
3. All three functors preserve colimits (S2/lower-shriek-colimits), so both sides are left Kan
extensions of their restrictions and the identification extends (E3); pass to coCartesian sections.

Proposed declaration: `lowerShriek_comp` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For an open immersion followed by the ball over Spa(C, O_C), compactly supported
cohomology of an open subdisc is computed by composing j_! and Rf_!.

**Depends on** within this roadmap `S2/lower-shriek`, `S2/hypercover-support-diagram`,
`S1/lower-shriek-composition-qc`, `S2/lower-shriek-colimits`; elsewhere `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S2/exchange-pasting-coherence`, `S3/upper-shriek-composition`.

**Source.** ECD Proposition 22.21, p. 138: “Then there is a natural equivalence Rf! ◦ Rg! ≃ R(f ◦
g)!”; ECD proof of Proposition 22.21, p. 138: “On the other hand, all functors commute with all
colimits by Proposition 22.20, so the full functors can be recovered by left Kan extension (as
above).”

### `S2/lower-shriek-etale-agreement` — Agreement with the étale left adjoint (general)


For f : Y′ → Y a separated étale map of small v-stacks and Λ with nΛ = 0 (n prime to p), C5's f_!
(left adjoint of f^*, ECD 19.1) agrees with Rf_! of S2/lower-shriek.

**Hypotheses.**

- f separated étale (eligible by S0/eligible-morphism).

**Construction and proof.**

1. The comparison transformation is constructed as in S1/lower-shriek-etale-agreement-qc.
2. By base change reduce to Y strictly totally disconnected; both functors commute with direct sums
(C5, S2/lower-shriek-colimits), so reduce to Y′ quasicompact, which is
S1/lower-shriek-etale-agreement-qc.

Proposed declaration: `lowerShriek_eq_etaleLowerShriek` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For the open unit disc as an open subspace of the ball, Rj_! is extension by zero.

**Depends on** within this roadmap `S2/lower-shriek`, `S1/lower-shriek-etale-agreement-qc`,
`S2/lower-shriek-colimits`, `S2/lower-shriek-base-change`; elsewhere `DiamondEtaleCohomology:C5`.

**Used in this roadmap by** `S3/upper-shriek-etale`.

**Source.** ECD Proposition 22.22, p. 138: “Then Rf! as defined in Definition 19.1 agrees with Rf!
as defined in Definition 22.18.”; ECD proof of Proposition 22.22, p. 138: “As moreover both functors
commute with all direct sums, one can reduce to the case where Y ′ is quasicompact, where it follows
from Proposition 22.10.”

### `S2/projection-formula` — Projection formula (general) ★


Let f : Y′ → Y be an eligible map of small v-stacks and Λ with nΛ = 0 (n prime to p). There is a
functorial isomorphism Rf_!B ⊗^L_Λ A ≃ Rf_!(B ⊗^L_Λ f^*A) for B ∈ D_ét(Y′, Λ) and A ∈ D_ét(Y, Λ),
compatible as A varies. ECD prints the statement for small v-sheaves; the extension to small
v-stacks is the same argument through a hypercover by quasiseparated locally spatial diamonds and
hyperdescent (C2, ECD 17.3), recorded here.

**Hypotheses.**

- f eligible between small v-stacks (the v-sheaf restriction of the printed statement is removed by
  hyperdescent).
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. Fix A; on Rf•!⁰ consider the endofunctors − ⊗ A|_{Y′•} and − ⊗ A|_{Y•}; both Rf•!⁰(− ⊗ A|_{Y′•})
and Rf•!⁰(−) ⊗ A|_{Y•} are left Kan extensions from D_ét,prop/Y•(Y′•, Λ)⁰.
2. On proper-support objects compare both with Rf‾•_*(j•!(−) ⊗ f‾•^*A|) using j•! ⊣ j•^* and Rf‾•_*
⊣ f‾•^* and that pullback is monoidal (C3); fibrewise these are the open-immersion projection
formula and S1/projection-formula-qc.
3. Both functors preserve coCartesian edges, so pass to coCartesian sections and hyperdescent (C2);
compatibility in A is checked in the homotopy category.

Proposed declaration: `lowerShriek_projection` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** With B = Λ: Rf_!Λ ⊗ A ≃ Rf_!f^*A; for the ball this computes R f_!f^*A = A(−1)[−2].

**Depends on** within this roadmap `S2/lower-shriek`, `S2/hypercover-support-diagram`,
`S1/projection-formula-qc`; elsewhere `DiamondEtaleCohomology:C2`, `DiamondEtaleCohomology:C3`,
`EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S2/exchange-pasting-coherence`, `S3/upper-shriek-change-of-rings`,
`S3/verdier-duality-lower-shriek`, `S3/upper-shriek-internal-hom`, `S3/adjunction-calculus`.

**Source.** ECD Proposition 22.23, p. 139: “Then there is a functorial isomorphism Rf! B ⊗LΛ A ≃ Rf!
(B ⊗LΛ f ∗ A) in B ∈ Dét (Y ′ , Λ) and A ∈ Dét (Y, Λ).”; ECD proof of Proposition 22.23, p. 139:
“This implies the desired result by passage to coCartesian sections (noting that both functors map
coCartesian edges to coCartesian edges, as the second functor does).”

### `S2/exchange-pasting-coherence` — Coherence of the exchange equivalences


The base-change equivalences of S2/lower-shriek-base-change, the composition equivalences of
S2/lower-shriek-composition and the projection-formula isomorphisms of S2/projection-formula satisfy
the pasting identities: (a) base change along a composite Ỹ₂ → Ỹ₁ → Y is the vertical pasting of the
two base changes; (b) for composable eligible f, g and any base change, the base change of R(f ∘
g)_! ≃ Rf_!Rg_! is the horizontal pasting of the base changes of Rf_! and Rg_!; (c) the composition
equivalences are associative and unital; (d) base change for identities and for an identity base map
is the identity. These hold at the enhanced level and are part of the public interface.

**Hypotheses.**

- Eligible maps of small v-stacks; Λ with nΛ = 0, n prime to p.

**Construction and proof.**

1. Each identity is obtained by running the construction of S2/hypercover-support-diagram over Δ ×
[1]ⁿ (n = 2 for (a), (b); n = 3 for associativity), i.e. through products of simplicial indexing
categories (E0).
2. Uniqueness of left Kan extensions (E3) identifies the two transformations once they agree on
proper-support objects, where they reduce to the pasting identities of proper base change and of j_!
(C5) and of Rf‾_* (C3).

Proposed declarations: `lowerShriek_baseChange_comp`, `lowerShriek_comp_assoc` (module `TauCeti/Diamond/SixOperations/ProperPushforward`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For open immersions, base change and composition equivalences reduce to the
canonical isomorphisms of C5's j_!.

**Depends on** within this roadmap `S2/lower-shriek-base-change`, `S2/lower-shriek-composition`,
`S2/projection-formula`; elsewhere `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E3`,
`DiamondEtaleCohomology:C3`, `DiamondEtaleCohomology:C5`.

**Used in this roadmap by** `S3/upper-shriek-composition`, `S3/adjunction-calculus`.

**Source.** ECD proof of Proposition 22.19, p. 138: “Repeating the previous discussion over ∆ again
over ∆ × ∆1 gives the result.”; ECD proof of Proposition 22.23, p. 139: “One then checks that
varying A, the relevant diagrams commute in the derived category.”

## S3. Exceptional inverse image and the formal identities

Rf^! is the right adjoint of Rf_! produced by the adjoint functor theorem from colimit preservation
(23.1). The layer proves compatibility with restriction of scalars (23.2), the two Verdier-duality
identities (23.3), identity and composition laws, Rf^! = f^* for separated étale f, and the formal
exchange Rg^!Rf_* ≃ Rf′_*Rg̃^! of 23.16(i) by passing to right adjoints of base change; this
identity is used in the proof of 23.4 and is therefore proved before any smoothness statement, with
eligibility required only of g. Units, traces, the twisted-pullback transformation, base-change
transformations and mates are constructed and tested on open immersions and finite étale maps.

Planets of this layer: Exceptional inverse image Rf^! (`S3/upper-shriek`); Verdier duality
(`S3/verdier-duality-lower-shriek`); Exceptional base change
(`S3/upper-shriek-pushforward-exchange`).

Other roadmaps' stages used (requested): `DiamondEtaleCohomology:C2`, `DiamondEtaleCohomology:C3`,
`DiamondEtaleCohomology:C5`, `EnhancedDerivedSheaves:E3`.

Acceptance tests of the layer: Rj^! = j^* for open immersions; the trace of a finite étale map of
degree d; the distribution-valued Rq^!Λ of a profinite projection.

### `S3/upper-shriek` — The exceptional inverse image Rf^! ★


Let f : Y′ → Y be an eligible map of small v-stacks (S0/eligible-morphism) and Λ with nΛ = 0, n
prime to p. Rf^! : D_ét(Y, Λ) → D_ét(Y′, Λ) is the right adjoint of Rf_! (S2/lower-shriek),
constructed at the level of presentable stable ∞-categories by the adjoint functor theorem
(EnhancedDerivedSheaves E3, HTT 5.5.2.9), which applies because Rf_! preserves all colimits
(S2/lower-shriek-colimits) and both categories are presentable (C2). It is exact; it is a right
adjoint, so it preserves all limits; the adjunction Rf_! ⊣ Rf^! is part of the data. Rf^! is defined
only for eligible f: every statement using it carries the eligibility hypotheses of the map whose
Rf^! appears.

**Hypotheses.**

- f eligible between small v-stacks.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. D_ét(Y′, Λ) and D_ét(Y, Λ) are presentable stable ∞-categories (C2, ECD Lemma 17.1).
2. Rf_! preserves all colimits (S2/lower-shriek-colimits).
3. The adjoint functor theorem (E3, HTT 5.5.2.9) produces a right adjoint, unique up to a
contractible choice; it is exact as a right adjoint between stable categories.
4. Pass to homotopy categories to obtain ECD's Rf^! with the adjunction isomorphism Hom(Rf_!A, B) ≅
Hom(A, Rf^!B).

Proposed declarations: `upperShriek`, `lowerShriekUpperShriekAdj` (module `TauCeti/Diamond/SixOperations/ExceptionalPullback`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `lowerShriekUpperShriekAdj` | universal-property | Rf_! ⊣ Rf^!: Hom(Rf_!A, B) ≅ Hom(A, Rf^!B) naturally in A ∈ D_ét(Y′, Λ), B ∈ D_ét(Y, Λ). |
| `upperShriek_preservesLimits` | other | Rf^! preserves all limits and is exact. |
| `upperShriek_id` | simp | R(id)^! ≃ id. |
| `upperShriek_comp` | functoriality | R(f ∘ g)^! ≃ Rg^! ∘ Rf^!, compatible with the composition of Rf_! (S3/upper-shriek-composition). |
| `upperShriek_etale` | compatibility | For f separated étale, Rf^! ≃ f^* (S3/upper-shriek-etale). |
| `upperShriek_restrictScalars` | compatibility | Rf^! commutes with restriction of scalars along Λ′ → Λ (S3/upper-shriek-change-of-rings). |
| `upperShriek_internalHom` | relation | Rf^!RHom(A, B) ≅ RHom(f^*A, Rf^!B) (S3/upper-shriek-internal-hom). |
| `upperShriek_pushforward` | relation | For a cartesian square with eligible horizontal g, Rg^!Rf_* ≅ Rf′_*Rg̃^! (S3/upper-shriek-pushforward-exchange). |
| `dualizingObject` | data | D_f := Rf^!Λ ∈ D_ét(Y′, Λ), the dualizing complex; it is invertible when f is ℓ-cohomologically smooth (S4/dualizing-complex). |

**Used by.**

- ECD Propositions 23.3–23.4 and Definition 23.8: Verdier duality and the definition of
  cohomological smoothness compare Rf^! with f^*.
- ECD Theorem 25.1 and Proposition 25.4: the Verdier dual RHom(A, Rf^!F_ℓ) and its biduality and
  conservativity.
- VStackSheavesAndLisseCategories:VS0 (FS IV.1.11–1.17): the stacky Rf^! is defined by descending
  this functor along charts.
- VStackSheavesAndLisseCategories:VS1 (FS IV.2.23): ULA objects are dualizable in a 2-category of
  cohomological correspondences built from Rf_! and Rf^!.
- AdicCoefficientsAndComparisons:L0, L3: ℓ-adic Rf^! and the comparison with schemes transport this
  right adjoint.

**Unit tests.**

- `upperShriek_id_test` (degenerate): R(id_Y)^! ≃ id.
- `upperShriek_openImmersion` (compatibility): For an open immersion j : U → Y of small v-stacks,
  Rj^! ≃ j^* (right adjoint of j_!).
- `upperShriek_ne_pullback_profinite` (non-example): For q : S × Spa(C, O_C) → Spa(C, O_C) with S an
  infinite profinite set, Rq^!Λ is the sheaf of Λ-valued distributions T ↦ Hom(C⁰(T, Λ), Λ) and is
  not q^*Λ (S5/profinite-quotient-upper-shriek).
- `upperShriek_ball` (computation): For the ball f : B → *, Rf^!Λ ≅ Λ(1)[2] canonically
  (S5/ball-smooth).

**Acceptance.** For an open immersion j, Rj^! = j^*; for the ball B → *, Rf^!Λ = Λ(1)[2]
(S5/ball-smooth).

**Depends on** within this roadmap `S2/lower-shriek`, `S2/lower-shriek-colimits`,
`S0/eligible-morphism`; elsewhere `EnhancedDerivedSheaves:E3`, `DiamondEtaleCohomology:C2`.

**Used in this roadmap by** `S3/upper-shriek-change-of-rings`, `S3/verdier-duality-lower-shriek`,
`S3/upper-shriek-internal-hom`, `S3/upper-shriek-composition`, `S3/upper-shriek-etale`,
`S3/upper-shriek-pushforward-exchange`, `S3/adjunction-calculus`, `S4/direct-sum-criterion`,
`S4/cohomologically-smooth`, `S4/dualizing-complex`, `S5/averaging-transformation`,
`S5/profinite-quotient-upper-shriek`, `S6/verdier-dual`.

**Source.** ECD Theorem 23.1, p. 140: “Then the functor Rf! : Dét (Y ′ , Λ) → Dét (Y, Λ) admits a
right adjoint”; ECD proof of Theorem 23.1, p. 140: “This follows from Lurie’s ∞-categorical adjoint
functor theorem, [Lur09, Corollary 5.5.2.9], and Proposition 22.20.”

### `S3/upper-shriek-change-of-rings` — Rf^! commutes with restriction of scalars


Let f be eligible and g : Λ′ → Λ a map of rings killed by integers prime to p. With res_g : D_ét(−,
Λ) → D_ét(−, Λ′) restriction of scalars along g, there is a natural equivalence res_g ∘ Rf^! ≃ Rf^!
∘ res_g of functors D_ét(Y, Λ) → D_ét(Y′, Λ′).

**Hypotheses.**

- f eligible; Λ′ → Λ a ring map with both rings killed by integers prime to p.

**Construction and proof.**

1. Restriction of scalars is right adjoint to − ⊗^L_{Λ′} Λ (C3, change of coefficients).
2. Rf_!(− ⊗^L_{Λ′} Λ) ≃ Rf_!(−) ⊗^L_{Λ′} Λ by the projection formula (S2/projection-formula),
applied over Λ′ with A = Λ the constant sheaf.
3. Pass to right adjoints (mates, E3).

Proposed declaration: `upperShriek_restrictScalars` (module `TauCeti/Diamond/SixOperations/ExceptionalPullback`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For Λ′ = ℤ/ℓ^m → Λ = F_ℓ: Rf^!(F_ℓ) computed over F_ℓ and over ℤ/ℓ^m agree as
ℤ/ℓ^m-complexes; used in the proof of ECD 23.4.

**Depends on** within this roadmap `S3/upper-shriek`, `S2/projection-formula`; elsewhere
`DiamondEtaleCohomology:C3`, `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S4/strictly-local-criteria-torsion`.

**Source.** ECD Remark 23.2, p. 140: “Indeed, this identity of functors is the right adjoint of the
identity of functors Rf! (− ⊗Λ′ Λ) = Rf! ⊗Λ′ Λ , which follows from the projection formula,
Proposition 22.23.”; ECD Remark 23.2, p. 140: “The functor Rf ! is compatible with change of rings g
: Λ′ → Λ in the following sense.”

### `S3/verdier-duality-lower-shriek` — Verdier duality for Rf_! ★


Let f : Y′ → Y be eligible and Λ with nΛ = 0 (n prime to p). For A ∈ D_ét(Y′, Λ) and B ∈ D_ét(Y, Λ)
there is a natural isomorphism RHom_Λ(Rf_!A, B) ≅ Rf_*RHom_Λ(A, Rf^!B), RHom being C3's internal Hom
on D_ét.

**Hypotheses.**

- f eligible.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. For C ∈ D_ét(Y, Λ): Hom(C, RHom(Rf_!A, B)) = Hom(C ⊗ Rf_!A, B) = Hom(Rf_!(f^*C ⊗ A), B)
(S2/projection-formula) = Hom(f^*C ⊗ A, Rf^!B) (S3/upper-shriek) = Hom(f^*C, RHom(A, Rf^!B)) =
Hom(C, Rf_*RHom(A, Rf^!B)) (C3 tensor–Hom and f^* ⊣ Rf_*).
2. Yoneda; the identification is made at the enhanced level so that it is natural (E3).

Proposed declaration: `verdierDuality` (module `TauCeti/Diamond/SixOperations/ExceptionalPullback`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Taking global sections over Y = Spa(C, O_C): RHom(RΓ_c(Y′, A), B) ≅ RHom(A, Rf^!B),
the form used in ECD 25.1 and 25.4.

**Depends on** within this roadmap `S3/upper-shriek`, `S2/projection-formula`; elsewhere
`DiamondEtaleCohomology:C3`, `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S6/verdier-dual`, `S6/biduality`, `S6/verdier-conservativity`,
`S6/conservativity-general-coefficients`.

**Source.** ECD Proposition 23.3(i), p. 140: “For all A ∈ Dét (Y ′ , Λ), B ∈ Dét (Y, Λ), one has”;
ECD proof of Proposition 23.3, p. 141: “so the result follows from the Yoneda lemma.”

### `S3/upper-shriek-internal-hom` — Rf^! of an internal Hom


Let f : Y′ → Y be eligible and Λ with nΛ = 0 (n prime to p). For A, B ∈ D_ét(Y, Λ) there is a
natural isomorphism Rf^!RHom_Λ(A, B) ≅ RHom_Λ(f^*A, Rf^!B).

**Hypotheses.**

- f eligible.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. For C ∈ D_ét(Y′, Λ): Hom(C, Rf^!RHom(A, B)) = Hom(Rf_!C, RHom(A, B)) = Hom(Rf_!C ⊗ A, B) =
Hom(Rf_!(C ⊗ f^*A), B) = Hom(C ⊗ f^*A, Rf^!B) = Hom(C, RHom(f^*A, Rf^!B)).
2. Yoneda, at the enhanced level.

Proposed declaration: `upperShriek_internalHom` (module `TauCeti/Diamond/SixOperations/ExceptionalPullback`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** With B = Λ and f smooth: Rf^!RHom(A, Λ) ≅ RHom(f^*A, D_f), the input of ECD 23.17
and 25.4.

**Depends on** within this roadmap `S3/upper-shriek`, `S2/projection-formula`; elsewhere
`DiamondEtaleCohomology:C3`, `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S4/smooth-pullback-internal-hom`, `S6/verdier-conservativity`.

**Source.** ECD Proposition 23.3(ii), p. 140: “For all A, B ∈ Dét (Y, Λ), one has”; ECD proof of
Proposition 23.3, p. 141: “Similarly, for part (ii), note that for all C ∈ Dét (Y ′ , Λ),”

### `S3/upper-shriek-composition` — Identity and composition laws for Rf^!


For eligible g : Y″ → Y′ and f : Y′ → Y (Λ with nΛ = 0, n prime to p) there are natural equivalences
R(id)^! ≃ id and R(f ∘ g)^! ≃ Rg^! ∘ Rf^!, the mates of R(id)_! ≃ id and of Rf_! ∘ Rg_! ≃ R(f ∘ g)_!
(S2/lower-shriek-composition) under the adjunctions of S3/upper-shriek; they are associative and
unital, and compatible with the composition of Rf_! through the units and counits.

**Hypotheses.**

- f, g eligible.

**Construction and proof.**

1. Right adjoints compose: Rg^! ∘ Rf^! is right adjoint to Rf_! ∘ Rg_! ≃ R(f ∘ g)_!, hence
equivalent to R(f ∘ g)^! by uniqueness of adjoints (E3).
2. Associativity and unitality are the mates of S2/exchange-pasting-coherence (c).

Proposed declaration: `upperShriek_comp` (module `TauCeti/Diamond/SixOperations/ExceptionalPullback`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For an open immersion followed by a finite étale map, R(f ∘ j)^! = j^*Rf^! = j^*f^*.

**Depends on** within this roadmap `S3/upper-shriek`, `S2/lower-shriek-composition`,
`S2/exchange-pasting-coherence`; elsewhere `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S3/adjunction-calculus`, `S4/strictly-local-criteria`,
`S4/smooth-composition`, `S4/smooth-descent-along-smooth-surjection`,
`S4/smooth-upper-shriek-exchange`, `S5/free-quotient-smooth`, `S5/profinite-quotient-upper-shriek`,
`S6/verdier-conservativity`.

**Source.** ECD proof of Proposition 23.4, p. 143: “But if g = gi is étale, then g ∗ = Rg ! and h∗ =
Rh! , so h∗ Rf ! = Rh! Rf ! = Rf ′! Rg ! = Rf ′! g ∗ , as desired.”

### `S3/upper-shriek-etale` — Rf^! = f^* for separated étale maps


If f : Y′ → Y is a separated étale map of small v-stacks and Λ with nΛ = 0 (n prime to p), then Rf^!
≃ f^* canonically, compatibly with composition.

**Hypotheses.**

- f separated étale.

**Construction and proof.**

1. By S2/lower-shriek-etale-agreement, Rf_! is C5's left adjoint f_! of f^*.
2. Both Rf^! and f^* are right adjoints of Rf_! ≃ f_!; uniqueness of adjoints (E3).

Proposed declaration: `upperShriek_etale` (module `TauCeti/Diamond/SixOperations/ExceptionalPullback`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For a disjoint union of opens ⊔Uᵢ → Y, Rf^! is the family of restrictions.

**Depends on** within this roadmap `S3/upper-shriek`, `S2/lower-shriek-etale-agreement`; elsewhere
`DiamondEtaleCohomology:C5`, `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S3/adjunction-calculus`, `S4/strictly-local-criteria`,
`S4/etale-maps-smooth`.

**Source.** ECD proof of Proposition 23.4, p. 143: “But if g = gi is étale, then g ∗ = Rg ! and h∗ =
Rh! ,”

### `S3/upper-shriek-pushforward-exchange` — The formal exceptional base change Rg^!Rf_* ≃ Rf′_*Rg̃^! ★


Let Y′ →g̃ Y, X′ →g X, f : Y → X, f′ : Y′ → X′ be a cartesian square of small v-stacks with g
eligible (compactifiable, representable in locally spatial diamonds, locally dim.trg g < ∞), and Λ
with nΛ = 0 (n prime to p). Then g̃ is eligible (S0/eligible-morphism, base change) and for A ∈
D_ét(Y, Λ) there is a natural isomorphism Rg^!Rf_*A ≅ Rf′_*Rg̃^!A. No eligibility hypothesis on f is
needed. This is ECD 23.16(i); it is proved here, before cohomological smoothness, because the proof
of ECD 23.4 uses it.

**Hypotheses.**

- g eligible; f an arbitrary map of small v-stacks.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. Base change S2/lower-shriek-base-change for g along f gives f^*Rg_! ≃ Rg̃_!f′^* as functors
D_ét(X′, Λ) → D_ét(Y, Λ).
2. Pass to right adjoints: the right adjoint of f^*Rg_! is Rg^!Rf_*, that of Rg̃_!f′^* is Rf′_*Rg̃^!
(S3/upper-shriek, C3); the mate of an equivalence is an equivalence (E3).

Proposed declaration: `upperShriek_pushforward_exchange` (module `TauCeti/Diamond/SixOperations/ExceptionalPullback`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For g an open immersion it is the base change j^*Rf_* ≅ Rf′_*j̃^* of C3; for g = h :
X × S → X with S profinite, it gives Rh′_*Rf′^! = Rf^!Rh_*, used in ECD 23.4.

**Depends on** within this roadmap `S3/upper-shriek`, `S2/lower-shriek-base-change`,
`S0/eligible-morphism`; elsewhere `DiamondEtaleCohomology:C3`, `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S4/strictly-local-criteria`, `S4/smooth-base-change`,
`S4/smooth-upper-shriek-exchange`, `S5/geometric-base-criterion`.

**Source.** ECD Proposition 23.16(i), p. 151: “Assume that g is compactifiable and representable in
locally spatial diamonds with locally dim. trg g < ∞, and A ∈ Dét (Y, Λ).”; ECD proof of Proposition
23.16, p. 151: “Part (i) follows from Proposition 22.19 by passing to right adjoints.”

### `S3/adjunction-calculus` — Units, traces, the twisted-pullback transformation and mates


For an eligible f : Y′ → Y and Λ with nΛ = 0 (n prime to p), construct at the enhanced level: (1)
the unit A → Rf^!Rf_!A and the counit (trace) tr_f : Rf_!Rf^!B → B of Rf_! ⊣ Rf^!; (2) the
twisted-pullback transformation τ_f : Rf^!Λ ⊗^L_Λ f^*(−) → Rf^!(−), adjoint to Rf_!(Rf^!Λ ⊗ f^*B) ≃
Rf_!Rf^!Λ ⊗ B →(tr ⊗ id) B (projection formula S2/projection-formula); (3) evaluation RHom(A, B) ⊗ A
→ B and coevaluation for invertible objects, and the tensor–Hom adjunction on D_ét (C3); (4) for a
cartesian square with g eligible, the base-change transformation g̃^*Rf^! → Rf′^!g^* (when f is
eligible) adjoint to Rf′_!g̃^*Rf^! ≃ g^*Rf_!Rf^! → g^* (S2/lower-shriek-base-change and tr_f), and
the transformation Rf^!Λ ⊗ f^* → Rf^! restricted along open immersions used in ECD 23.4(iii)–(iv);
(5) the mates of all exchange equivalences of S2. These are compatible with composition (traces
compose: tr_{f∘g} = tr_f ∘ Rf_!(tr_g)Rf^!) and with base change, and they are tested on finite étale
maps and open immersions before any smoothness statement uses them.

**Hypotheses.**

- f (and g in (4)) eligible.
- Λ a commutative ring with nΛ = 0 for some integer n prime to p.

**Construction and proof.**

1. (1) is the adjunction of S3/upper-shriek; (2)–(4) are composites of the projection formula, base
change and (co)units, made functorial by E3's mates.
2. Composition of traces is the mate of S3/upper-shriek-composition; compatibility with base change
is the mate of S2/exchange-pasting-coherence.
3. Tests: for f = j an open immersion, Rj^! = j^*, tr_j is the counit j_!j^* → id and τ_j is the
identity; for f finite étale, Rf^! = f^*, Rf_! = f_*, and tr_f : f_*f^* → id is the classical trace
(sum over the fibres).

Proposed declarations: `shriekTrace`, `twistedPullbackTransformation`, `upperShriekBaseChangeTransformation` (module `TauCeti/Diamond/SixOperations/ExceptionalPullback`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `shriekTrace` | data | tr_f : Rf_!Rf^!B → B, the counit of Rf_! ⊣ Rf^!. |
| `twistedPullbackTransformation` | data | τ_f : Rf^!Λ ⊗^L f^*B → Rf^!B, adjoint to (tr_f ⊗ id) ∘ (projection formula). |
| `upperShriekBaseChangeTransformation` | data | For a cartesian square with g and f eligible, g̃^*Rf^! → Rf′^!g^*, adjoint to Rf′_!g̃^*Rf^! ≃ g^*Rf_!Rf^! → g^*. |
| `shriekTrace_comp` | functoriality | tr_{f∘g} = tr_f ∘ Rf_!(tr_g)(Rf^!) under the composition equivalences. |
| `twistedPullbackTransformation_openImmersion` | simp | For f an open immersion, τ_f is the identity of j^*. |
| `twistedPullbackTransformation_etale` | simp | For f separated étale, τ_f is the identity of f^* under Rf^! ≃ f^*. |
| `shriekTrace_finiteEtale` | compatibility | For f finite étale, tr_f : f_*f^* → id is the classical trace map (summation over fibres). |
| `twistedPullbackTransformation_baseChange` | relation | τ is compatible with base change along any map of small v-stacks through upperShriekBaseChangeTransformation. |

**Used by.**

- ECD Proposition 23.4 (i)–(iv): the four equivalent criteria are statements that τ_f or base-change
  transformations are equivalences.
- ECD Definition 23.8 and Proposition 23.12: smoothness makes τ_f an equivalence with invertible
  Rf^!Λ.
- ECD Propositions 24.2–24.3: the averaging transformation q^* → Rq^! is built from a trace q_*q^* →
  id.
- ECD Theorem 24.1: the ball's dualizing isomorphism is adjoint to Huber's trace.
- VStackSheavesAndLisseCategories:VS1 (FS IV.2.23): units and counits of the correspondence
  2-category.

**Unit tests.**

- `twistedPullback_id` (degenerate): For f the identity, τ_f is the identity and tr_f is the
  identity.
- `shriekTrace_openImmersion` (computation): For an open immersion j, tr_j : j_!j^*B → B is the
  counit of j_! ⊣ j^*.
- `shriekTrace_finiteEtale_degree` (computation): For f : Y′ → Y finite étale of constant degree d,
  tr_f ∘ unit : Λ → f_*f^*Λ → Λ is multiplication by d.
- `twistedPullback_not_iso_profinite` (non-example): For q : S × Spa(C, O_C) → Spa(C, O_C), S an
  infinite profinite set, τ_q is not an equivalence: on global sections over an open and closed T ⊂
  S, Rq^!M is RHom(C⁰(T, Λ), M) while Rq^!Λ ⊗ q^*M is RHom(C⁰(T, Λ), Λ) ⊗ M, and these differ for M
  = ⊕_ℕ Λ because C⁰(T, Λ) is free of infinite rank; Rq^! does not commute with direct sums,
  matching criterion (iii) of S4/strictly-local-criteria.

**Acceptance.** For a finite étale cover of degree d of a connected base, tr_f ∘ (unit) on Λ is
multiplication by d.

**Depends on** within this roadmap `S3/upper-shriek`, `S3/upper-shriek-composition`,
`S2/projection-formula`, `S2/lower-shriek-base-change`, `S2/exchange-pasting-coherence`,
`S3/upper-shriek-etale`; elsewhere `DiamondEtaleCohomology:C3`, `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S4/strictly-local-criteria`, `S4/smooth-upper-shriek-base-change`,
`S5/averaging-transformation`.

**Source.** ECD Proposition 23.4(i), p. 141: “Rf ! Fℓ ⊗Fℓ f ∗ → Rf ! : Dét (X, Fℓ ) → Dét (Y, Fℓ )”;
ECD Proposition 23.4(i), p. 141: “is an equivalence (using the projection formula, Proposition
22.23, in the equality).”; ECD Proposition 23.12(iii), p. 147: “then the natural transformation of
functors g ′∗ Rf ! → Rfe! g ∗ : Dét (Y, Λ) → Dét (Ye ′ , Λ)”

## S4. Cohomological smoothness with the revised descent hypotheses

Over a strictly totally disconnected base, four criteria for Rf^! to be a twisted pullback are
equivalent (23.4), including the profinite-projection computation (23.6) and the compactness
criterion (23.7). ℓ-cohomological smoothness (23.8) is defined for separated maps representable in
locally spatial diamonds by an invertible twist after every strictly totally disconnected base
change; the equivalence is shown to be the canonical transformation, the dualizing complex is Rf^!Λ
and commutes with base change (23.12). The layer proves the practical criterion (23.10), universal
openness (23.11), preservation of perfect-constructible complexes by quasicompact smooth Rf_! (no
such claim for arbitrary proper maps), composition and the converse of 23.13 with all its
hypotheses, Remark 23.14, v-locality on the target with local finiteness of dim.trg f assumed on f
itself (23.15), smooth base change and the identities 23.16(ii)–(iii), 23.17. Supplier stages:
DiamondEtaleCohomology C6, C7; nodes of C8–C9.

Planets of this layer: Criteria over strictly totally disconnected bases
(`S4/strictly-local-criteria`); ℓ-cohomologically smooth morphism (`S4/cohomologically-smooth`);
Smooth maps are universally open (`S4/smooth-universally-open`); Dualizing complex D_f = Rf^!Λ
(`S4/dualizing-complex`); Composition and descent of smoothness (`S4/smooth-composition`); Smooth
base change (`S4/smooth-base-change`).

Other roadmaps' stages used (requested): `DiamondEtaleCohomology:C0`, `DiamondEtaleCohomology:C2`,
`DiamondEtaleCohomology:C3`, `DiamondEtaleCohomology:C4`, `DiamondEtaleCohomology:C5`,
`DiamondEtaleCohomology:C6`, `DiamondEtaleCohomology:C7`, `EnhancedDerivedSheaves:E3`.

Other roadmaps' declarations and nodes used: `DiamondEtaleCohomology:C8/diamond-dim-trg`,
`DiamondEtaleCohomology:C8/injection-direct-image`,
`DiamondEtaleCohomology:C8/locally-finite-dim-trg`,
`DiamondEtaleCohomology:C8/qpetale-direct-image`, `DiamondEtaleCohomology:C9/compact-generators`,
`DiamondEtaleCohomology:C9/compact-iff-perfect-constructible`,
`DiamondEtaleCohomology:C9/finite-field-compact-objects`,
`DiamondsAndVStacks:D0/spectral-quotient-criterion`,
`DiamondsAndVStacks:D1/strictly-totally-disconnected`,
`DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks`,
`DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`,
`DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`,
`DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`,
`DiamondsAndVStacks:D5/relative-representability`, `DiamondsAndVStacks:D5/spatial-diamond`.

Acceptance tests of the layer: separated étale maps (D_f = Λ); the ball (D_f = Λ(1)[2]); the
non-smooth profinite projection S × X → X; the origin of the ball as a proper map with non-open
image.

### `S4/strictly-local-criteria` — Criteria for Rf^! to be a twisted pullback over a strictly totally disconnected base ★


Let X be a strictly totally disconnected perfectoid space, f : Y → X a compactifiable map from a
locally spatial diamond Y with locally dim.trg f < ∞ (so f is eligible), and ℓ ≠ p a prime. The
following are equivalent: (i) the twisted-pullback transformation τ_f : Rf^!F_ℓ ⊗_{F_ℓ} f^* → Rf^!
of functors D_ét(X, F_ℓ) → D_ét(Y, F_ℓ) (S3/adjunction-calculus) is an equivalence; (ii) Rf^! is
equivalent to A ⊗_{F_ℓ} f^* for some A ∈ D_ét(Y, F_ℓ); (iii) Rf^! commutes with arbitrary direct
sums, and for every connected component X₀ = Spa(C, C⁺) of X and open j : U ⊂ X₀ with pullbacks f_U
: V → U, f₀ : Y₀ → X₀, j′ : V → Y₀, the map j′_!Rf_U^!F_ℓ → Rf₀^!j_!F_ℓ adjoint to Rf₀!j′_!Rf_U^!F_ℓ
= j_!Rf_U!Rf_U^!F_ℓ → j_!F_ℓ is an equivalence; (iv) for every affinoid pro-étale g : X′ → X with
pullback h : Y′ → Y, f′ : Y′ → X′, the base-change transformation h^*Rf^! → Rf′^!g^* is an
equivalence, and for X₀, U as in (iii) the transformation j′_!Rf_U^! → Rf₀^!j_! of functors D_ét(U,
F_ℓ) → D_ét(Y₀, F_ℓ) is an equivalence.

**Hypotheses.**

- X strictly totally disconnected (D1); Y locally spatial; f compactifiable with locally dim.trg f <
  ∞; ℓ ≠ p.

**Construction and proof.**

1. (i) ⇒ (ii) ⇒ (iii): clear, f^* and ⊗ commute with sums; the second part of (iii) holds for
twisted pullbacks.
2. (iii) ⇒ (iv), first part: write g = lim gᵢ with gᵢ affinoid étale; h_* = Rh_* is exact and
conservative (C8/qpetale-direct-image, ECD Remark 21.14), so it suffices that h_*h^*Rf^! →
Rf^!g_*g^* is an equivalence; g_*g^* = colim gᵢ*gᵢ^*, and Rf^! commutes with colimits (it commutes
with sums, E3), reducing to étale gᵢ, where gᵢ^* = Rgᵢ^! and S3/upper-shriek-composition,
S3/upper-shriek-etale apply.
3. (iii) ⇒ (iv), second part: the objects K of D_ét(U, F_ℓ) satisfying it form a triangulated
subcategory closed under sums containing every j″_!F_ℓ for open j″ : U″ ⊂ U, which generate
(C9/compact-generators, U strictly totally disconnected).
4. (iv) ⇒ (i): check on fibres; by the first part of (iv) reduce to X = Spa(C, C⁺) strictly local
and a geometric point y over x; replace X by the generalisations X₁ of x; by the second part and
triangles reduce K to i_*K₀ and then to a constant K₀; bounded case by triangles, D⁺ by the finite
cohomological dimension of Rf_! (S1/compactification-cd-bound), D⁻ by Postnikov limits since Rf^!
preserves limits and Rf^!F_ℓ ∈ D^{≤0} (computed via C8/injection-direct-image, ECD Lemma 21.13, and
exactness of Hom(−, F_ℓ) at a geometric point).
5. K₀ = V[0] with V = C⁰(S, F_ℓ) for a profinite S: with h : X × S → X, (iv) gives Rf′^!h^*F_ℓ =
h′^*Rf^!F_ℓ; apply Rh′_* and S3/upper-shriek-pushforward-exchange (ECD 23.16(i)) to get
Rf^!Rh_*h^*F_ℓ = Rh′_*h′^*Rf^!F_ℓ, and S4/profinite-projection-pushforward translates this into
Rf^!V = V ⊗ Rf^!F_ℓ.

Proposed declaration: `upperShriek_twist_tfae` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For the ball B × X → X all four conditions hold (S5/ball-smooth); for q : S × X → X
with S infinite profinite, (iii) fails (Rq^! does not commute with sums).

**Depends on** within this roadmap `S3/adjunction-calculus`, `S3/upper-shriek-pushforward-exchange`,
`S3/upper-shriek-composition`, `S3/upper-shriek-etale`, `S4/profinite-projection-pushforward`,
`S1/compactification-cd-bound`, `S0/eligible-morphism`; elsewhere
`DiamondEtaleCohomology:C8/qpetale-direct-image`,
`DiamondEtaleCohomology:C8/injection-direct-image`, `DiamondEtaleCohomology:C9/compact-generators`,
`DiamondsAndVStacks:D1/strictly-totally-disconnected`, `EnhancedDerivedSheaves:E3`,
`DiamondEtaleCohomology:C5`.

**Used in this roadmap by** `S4/strictly-local-criteria-torsion`,
`S4/practical-smoothness-criterion`, `S4/smooth-universally-open`, `S4/smooth-twisted-pullback`,
`S4/smooth-upper-shriek-base-change`, `S5/ball-smooth`, `S5/free-quotient-smooth`,
`S5/nonfree-quotient-smooth`.

**Source.** ECD Proposition 23.4, p. 141: “Let X be a strictly totally disconnected perfectoid
space, let f : Y → X be a compactifiable map from a locally spatial diamond Y of locally dim. trg f
< ∞, and fix a prime ℓ ̸= p. The following conditions are equivalent.”; ECD proof of Proposition
23.4, p. 142: “It is clear that (i) implies (ii), and (ii) implies (iii).”; ECD Remark 23.5, p. 142:
“condition (iv) is expressing a version of the idea that “Rf ! commutes with arbitrary pro-étale
base change”.”

### `S4/strictly-local-criteria-torsion` — The twisted-pullback criterion for ℓ-power-torsion coefficients


Under the equivalent conditions of S4/strictly-local-criteria, for every ℓ-power-torsion ring Λ (ℓ^m
Λ = 0 for some m) the transformation τ_f : Rf^!Λ ⊗_Λ f^* → Rf^! of functors D_ét(X, Λ) → D_ét(Y, Λ)
is an equivalence.

**Hypotheses.**

- As in S4/strictly-local-criteria; Λ ℓ-power torsion.

**Construction and proof.**

1. Λ is a ℤ/ℓ^m-algebra; by S3/upper-shriek-change-of-rings reduce to Λ = ℤ/ℓ^m.
2. Every K ∈ D_ét(X, ℤ/ℓ^m) is filtered by m copies of K ⊗ F_ℓ, reducing to K from D_ét(X, F_ℓ), and
so to Rf^!(ℤ/ℓ^m) ⊗_{ℤ/ℓ^m} F_ℓ → Rf^!F_ℓ being an isomorphism.
3. Condition (iv) also holds for ℤ/ℓ^m by the same filtration; reduce to X = Spa(C, C⁺) connected,
use the standard periodic resolution of F_ℓ over ℤ/ℓ^m and Rf^!(ℤ/ℓ^m) ∈ D^{≤0}, proved as for F_ℓ
using that ℤ/ℓ^m is self-injective.

Proposed declaration: `upperShriek_twist_of_ellTorsion` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For Λ = ℤ/ℓ² and the ball, Rf^!ℤ/ℓ² ≅ ℤ/ℓ²(1)[2] (S5/ball-smooth).

**Depends on** within this roadmap `S4/strictly-local-criteria`, `S3/upper-shriek-change-of-rings`;
elsewhere `DiamondEtaleCohomology:C3`.

**Used in this roadmap by** `S4/smooth-twisted-pullback`, `S4/smooth-upper-shriek-base-change`.

**Source.** ECD Proposition 23.4, p. 142: “Moreover, under these conditions, for any ℓ-power-torsion
ring Λ, the natural transformation”; ECD proof of Proposition 23.4, p. 144: “To handle the case of a
general ℓ- power-torsion ring Λ, choose m such that ℓm = 0 in Λ.”

### `S4/profinite-projection-pushforward` — Pushforward along a profinite projection


Let S be a profinite set, Y a small v-sheaf, h : Y × S → Y the projection, and Λ a ring with nΛ = 0
for some n prime to p. For C ∈ D_ét(Y, Λ) there is a natural isomorphism Rh_*h^*C ≃ C⁰(S, Λ) ⊗_Λ C,
with C⁰(S, Λ) the Λ-module of continuous (locally constant) maps S → Λ. ECD states this for any ring
Λ, but the printed proof passes through Rh_! and the projection formula, which need nΛ = 0 with n
prime to p; the statement is restricted accordingly (PAPER-SCHOLZE-17/E69), which covers its only
use (Λ = F_ℓ in S4/strictly-local-criteria).

**Hypotheses.**

- S profinite; Y a small v-sheaf; nΛ = 0, n prime to p (corrected hypothesis).

**Construction and proof.**

1. h is proper (quasicompact separated universally closed, C4) and spatial-eligible with dim.trg 0,
so Rh_* ≅ Rh_! (S1/factorisation-independence (a)).
2. Projection formula (S1/projection-formula-qc): Rh_!h^*C ≅ Rh_!h^*Λ ⊗^L C = Rh_*h^*Λ ⊗^L C.
3. Write S = lim Sᵢ with Sᵢ finite; Rh_*h^*Λ = colim Rhᵢ*hᵢ^*Λ = colim Λ^{Sᵢ} = C⁰(S, Λ) by
continuity (C0, ECD Proposition 14.9). C⁰(S, Λ) is a free Λ-module (flat), so ⊗^L = ⊗.

Proposed declaration: `profiniteProjection_pushforward_pullback` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** S finite of cardinality m: Rh_*h^*C = C^m; S = ℤ_p: Rh_*h^*Λ = C⁰(ℤ_p, Λ), a free
module of countable rank.

**Depends on** within this roadmap `S1/factorisation-independence`, `S1/projection-formula-qc`;
elsewhere `DiamondEtaleCohomology:C0`, `DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S4/strictly-local-criteria`, `S5/profinite-quotient-upper-shriek`.

**Source.** ECD Lemma 23.6, p. 144: “Then for any ring Λ and any C ∈ Dét (Y, Λ), one has a natural
isomorphism”; ECD proof of Lemma 23.6, p. 144: “Note that h is proper, so by the projection formula
(Proposition 22.11), we get”

### `S4/direct-sum-criterion` — Rf^! commutes with sums iff Rf_! preserves constructibility


Let X be strictly totally disconnected, f : Y → X a compactifiable map from a spatial diamond Y with
dim.trg f < ∞, and ℓ ≠ p. Then Rf^! : D_ét(X, F_ℓ) → D_ét(Y, F_ℓ) commutes with arbitrary direct
sums if and only if for every constructible sheaf F of F_ℓ-vector spaces on Y_ét and every i ≥ 0,
R^i f_!F is constructible on X_ét.

**Hypotheses.**

- X strictly totally disconnected; Y spatial; f compactifiable with dim.trg f < ∞
  (spatial-eligible); ℓ ≠ p.

**Construction and proof.**

1. Y satisfies the hypothesis of ECD 20.10: every quasicompact separated étale U → Y has
ℓ-cohomological dimension ≤ N = 3 dim.trg f, by S1/compactification-cd-bound (X has cohomological
dimension 0).
2. By C9/finite-field-compact-objects (ECD 20.10), D_ét(Y, F_ℓ) and D_ét(X, F_ℓ) are compactly
generated, with compact objects the bounded complexes with constructible cohomology; so the
constructibility condition says that Rf_! preserves compact objects.
3. Neeman's criterion (E3: for F ⊣ G between compactly generated triangulated categories, G
preserves sums iff F preserves compacts).

Proposed declaration: `upperShriek_preservesCoproducts_iff` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For the ball over a strictly totally disconnected X both sides hold
(H4/perfectoid-base-constructibility-transfer); for q : S × X → X with S infinite profinite both
fail: R⁰q_!F_ℓ = C⁰(S, F_ℓ) is not constructible.

**Depends on** within this roadmap `S1/compactification-cd-bound`, `S3/upper-shriek`,
`S0/spatial-eligible-morphism`; elsewhere `DiamondEtaleCohomology:C9/finite-field-compact-objects`,
`DiamondEtaleCohomology:C9/compact-generators`, `EnhancedDerivedSheaves:E3`,
`DiamondEtaleCohomology:C7`.

**Used in this roadmap by** `S4/practical-smoothness-criterion`.

**Source.** ECD Proposition 23.7, p. 144: “commutes with arbitrary direct sums if and only if for
all constructible sheaves F of Fℓ -vector spaces on Yét and all i ≥ 0, the !-pushforward Ri f! F is
constructible on Xét .”; ECD proof of Proposition 23.7, p. 145: “It follows from adjunction that Rf
! commutes with arbitrary direct sums if and only if Rf! preserves compact objects (this simple but
powerful observation goes back to Neeman, [Nee96]), so we get the result.”

### `S4/invertible-object` — Invertible objects of D_ét


For a locally spatial diamond Y and a ring Λ (in the applications F_ℓ or an ℓ-power-torsion ring),
an object D ∈ D_ét(Y, Λ) is invertible if it is locally isomorphic to Λ[n] for some integer n, where
locally may be taken equivalently in the v-, the quasi-pro-étale or the étale topology of Y. The
integer n is locally constant on |Y|. Invertible objects are ⊗-invertible (D ⊗ RHom(D, Λ) ≃ Λ); the
converse is not part of the definition.

**Hypotheses.**

- Y a locally spatial diamond; the three topologies give the same notion (ECD's 'equivalently').

**Construction and proof.**

1. Define IsInvertible D as: there is an étale cover {Uᵢ → Y} and integers nᵢ with D|_{Uᵢ} ≃ Λ[nᵢ].
2. Equivalence of the v-, quasi-pro-étale and étale versions: for an isomorphism D|_{Ỹ} ≃ Λ[n] over
a v-cover Ỹ → Y, n is constant on an open and closed stratification and the sheaf of isomorphisms D
≃ Λ[n] is separated, étale and surjective over Y by v-descent (ECD proof of 23.12(i);
D3/etale-and-finite-etale-are-v-stacks), so it has étale-local sections.
3. Local constancy of n: the degree in which the cohomology sheaf of D is nonzero.

Proposed declaration: `IsInvertibleObject` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `IsInvertibleObject.shift` | constructor | If D is invertible then D[m] is invertible for every m ∈ ℤ. |
| `IsInvertibleObject.const` | constructor | Λ[n] is invertible. |
| `IsInvertibleObject.tensor` | structure | Tensor products of invertible objects are invertible. |
| `IsInvertibleObject.pullback` | functoriality | Pullback along any map of locally spatial diamonds preserves invertibility. |
| `isInvertibleObject_iff_etale_local` | characterisation | D is invertible iff étale locally ≃ Λ[n] iff quasi-pro-étale locally ≃ Λ[n] iff v-locally ≃ Λ[n]. |
| `IsInvertibleObject.tensor_dual` | relation | For invertible D, the evaluation D ⊗ RHom(D, Λ) → Λ is an isomorphism and RHom(D, Λ) is invertible. |
| `IsInvertibleObject.degree` | data | The locally constant function ∣Y∣ → ℤ, y ↦ n with D_y ≃ Λ[n]. |
| `IsInvertibleObject.of_reduction` | other | For Λ ℓ-power torsion: if D ⊗^L_Λ F_ℓ is invertible over F_ℓ then D is invertible over Λ (extension of m copies; ECD proof of 23.12(i)). |

**Used by.**

- ECD Definition 23.8: the dualizing complex of an ℓ-cohomologically smooth map is required to be
  invertible.
- ECD Propositions 23.10(iv), 23.12(i) and 23.13: invertibility of Rf^!F_ℓ is a criterion and is
  stable under composition.
- ECD Theorem 25.1: biduality with respect to Rf^!F_ℓ is equivalent to naive biduality because
  Rf^!F_ℓ is invertible.
- VStackSheavesAndLisseCategories:VS0: the dualizing complex of a smooth chart of an Artin v-stack
  is invertible.

**Unit tests.**

- `IsInvertibleObject.const_zero` (degenerate): Λ = Λ[0] is invertible, with degree 0.
- `IsInvertibleObject.tate_twist` (computation): On Spa(C, O_C), Λ(1)[2] is invertible of degree −2
  (μ_n is constant after choosing roots of unity).
- `not_isInvertibleObject_extensionByZero` (non-example): For C⁺ ≠ O_C and j : Spa(C, O_C) → Spa(C,
  C⁺), j_!Λ is not invertible: its stalk at the closed point is 0.
- `not_isInvertibleObject_sum` (non-example): Λ ⊕ Λ is not invertible (rank 2 stalks).

**Acceptance.** Λ[2] and Λ(1)[2] (étale locally Λ[2]) are invertible; j_!Λ for a proper open j is
not.

**Depends on** elsewhere `DiamondsAndVStacks:D5/spatial-diamond`,
`DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks`, `DiamondEtaleCohomology:C2`,
`DiamondEtaleCohomology:C3`.

**Used in this roadmap by** `S4/cohomologically-smooth`, `S4/practical-smoothness-criterion`,
`S4/dualizing-complex`, `S4/smooth-twisted-pullback`, `S4/smooth-upper-shriek-base-change`,
`S4/etale-maps-smooth`, `S5/tate-twist`, `S6/verdier-dual`.

**Source.** ECD Definition 23.8, p. 145: “Here, for a locally spatial diamond Y , an object D ∈ Dét
(Y, Fℓ ) is invertible if it is locally (equivalently, in the v-, quasi-pro-étale, or étale topology
of Y ) isomorphic to Fℓ [n] for some integer”; ECD proof of Proposition 23.12, p. 149: “as the
integer n is constant on an open and closed stratification of Y ′ , and then the space of
isomorphisms between Rf ! Λ and Λ[n] is separated, étale and surjective over Y ′ as follows by v-
descent.”

### `S4/cohomologically-smooth` — ℓ-cohomologically smooth morphisms ★


Let f : Y′ → Y be a separated map of small v-stacks that is representable in locally spatial
diamonds, and ℓ ≠ p a prime. Then f is ℓ-cohomologically smooth if f is compactifiable, locally
dim.trg f < ∞, and for every strictly totally disconnected perfectoid space X with a map X → Y and
pullback f_X : Y′ ×_Y X → X, the functor Rf_X^! : D_ét(X, F_ℓ) → D_ét(Y′ ×_Y X, F_ℓ) is equivalent
to D_{f_X} ⊗_{F_ℓ} f_X^* for some invertible object D_{f_X} (S4/invertible-object). The equivalence
is not required to be natural or compatible with base change; that is a theorem
(S4/smooth-twisted-pullback, S4/smooth-upper-shriek-base-change). The printed 'D_{f_X} ⊗ f^*' should
read f_X^* (PAPER-SCHOLZE-17/E64). The notion is defined only for separated maps representable in
locally spatial diamonds; smoothness of stacky maps (e.g. [*/G] → *) is
VStackSheavesAndLisseCategories VS0's.

**Hypotheses.**

- f separated and representable in locally spatial diamonds; ℓ ≠ p.

**Construction and proof.**

1. Define IsCohomologicallySmooth ℓ f as: f compactifiable, LocallyFiniteDimTrg f, and for all
strictly totally disconnected X → Y there are an invertible D and an equivalence Rf_X^! ≃ D ⊗ f_X^*
(S3/upper-shriek over the eligible f_X).
2. f is then eligible (S0/eligible-morphism) and every pullback f_X is eligible, so Rf_X^! is
defined.

Proposed declaration: `IsCohomologicallySmooth` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `IsCohomologicallySmooth.isEligible` | projection | An ℓ-cohomologically smooth map is eligible. |
| `IsCohomologicallySmooth.isSeparated` | projection | An ℓ-cohomologically smooth map is separated. |
| `IsCohomologicallySmooth.twist` | projection | For f smooth, τ_f : Rf^!Λ ⊗ f^* → Rf^! is an equivalence for ℓ-power-torsion Λ, and Rf^!Λ is invertible (S4/smooth-twisted-pullback). |
| `isCohomologicallySmooth_iff` | characterisation | For f compactifiable and representable in spatial diamonds: smooth iff dim.trg f < ∞, constructibility of R^i f_{X!} on constructibles, the open-immersion condition over geometric points, and invertibility of Rf_X^!F_ℓ (S4/practical-smoothness-criterion). |
| `IsCohomologicallySmooth.baseChange` | functoriality | Stable under base change along any map of small v-stacks (S4/smooth-stable-under-base-change). |
| `IsCohomologicallySmooth.comp` | structure | Stable under composition (S4/smooth-composition). |
| `IsCohomologicallySmooth.of_baseChange` | other | v-local on the target, given locally dim.trg f < ∞ (S4/smooth-v-local-on-target). |
| `IsCohomologicallySmooth.isUniversallyOpen` | relation | Smooth maps are universally open (S4/smooth-universally-open). |
| `IsCohomologicallySmooth.of_separated_etale` | compatibility | Separated étale maps are smooth with dualizing complex Λ (S4/etale-maps-smooth). |

**Used by.**

- ECD Propositions 23.11–23.17: openness, dualizing complexes, composition, descent and smooth base
  change.
- ECD §24: the ball, profinite quotients, smooth analytic maps and Spd ℚ_p are shown smooth.
- ECD Theorem 25.1: biduality for X smooth over Spa(C, O_C).
- VStackSheavesAndLisseCategories:VS0 (FS IV.1.1): Artin v-stacks are defined by separated
  cohomologically smooth surjective charts.
- BunGAndNewtonStrata:BG2–BG4: Bun_G is a smooth Artin v-stack; its charts and strata are
  cohomologically smooth.
- GeometricSatakeAndFusion:GS0: graded pieces of the congruence filtration and open Schubert cells
  are cohomologically smooth.
- VectorBundlesAndIsocrystals:VB3: positive Banach–Colmez spaces are cohomologically smooth.
- RelativeFarguesFontaine:RF2: Div¹ → * is cohomologically smooth.

**Unit tests.**

- `IsCohomologicallySmooth.id` (degenerate): The identity of a small v-stack is ℓ-cohomologically
  smooth with dualizing complex Λ.
- `IsCohomologicallySmooth.ball` (computation): The ball B → * is ℓ-cohomologically smooth for every
  ℓ ≠ p, with Rf^!Λ ≅ Λ(1)[2] (S5/ball-smooth).
- `not_isCohomologicallySmooth_profinite` (non-example): For S an infinite profinite set and X
  strictly totally disconnected, S × X → X is not ℓ-cohomologically smooth: Rq^!F_ℓ is the sheaf of
  distributions, not invertible.
- `not_isCohomologicallySmooth_origin` (non-example): The origin 0 : Spa(C, O_C) → B × Spa(C, O_C)
  of the perfectoid ball is a closed immersion (proper, hence compactifiable, with dim.trg 0) whose
  image is not open, so it is not ℓ-cohomologically smooth (S4/smooth-universally-open).

**Acceptance.** Separated étale maps (D = Λ), the ball B → * (D = Λ(1)[2]), (Spa ℚ_p)^♢ → * and
smooth analytic maps are ℓ-cohomologically smooth; S × X → X for S infinite profinite is not.

**Depends on** within this roadmap `S0/eligible-morphism`, `S3/upper-shriek`,
`S4/invertible-object`; elsewhere `DiamondsAndVStacks:D1/strictly-totally-disconnected`,
`DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness`,
`DiamondsAndVStacks:D5/relative-representability`,
`DiamondEtaleCohomology:C8/locally-finite-dim-trg`.

**Used in this roadmap by** `S4/practical-smoothness-criterion`, `S4/smooth-universally-open`,
`S4/dualizing-complex`, `S4/smooth-twisted-pullback`, `S4/smooth-upper-shriek-base-change`,
`S4/smooth-composition`, `S4/smooth-descent-along-smooth-surjection`,
`S4/smooth-stable-under-base-change`, `S4/smooth-v-local-on-target`, `S4/etale-maps-smooth`,
`S5/averaging-transformation`, `S5/free-quotient-smooth`, `S5/nonfree-quotient-smooth`,
`S5/geometric-base-criterion`, `S6/biduality`.

**Source.** ECD Definition 23.8, p. 145: “Then f is ℓ-cohomologically smooth if f is compactifiable,
locally dim. trg f < ∞, and for any strictly totally disconnected perfectoid space X with a map X →
Y with pullback fX : Y ′ ×Y X → X, the functor”; ECD Definition 23.8, p. 145: “We note that we are
not a priori asking that the equivalence between”; ECD Remark 23.9, p. 145: “For example, the map M
→ ∗ for a topological manifold M should be considered smooth, but it is not representable in locally
spatial diamonds.”

### `S4/practical-smoothness-criterion` — A practical criterion for ℓ-cohomological smoothness


Let f : Y′ → Y be a compactifiable map of small v-stacks representable in spatial diamonds and ℓ ≠
p. Then f is ℓ-cohomologically smooth iff: (i) dim.trg f < ∞; (ii) for every strictly totally
disconnected X → Y and every constructible étale sheaf F of F_ℓ-vector spaces on Y′ ×_Y X, R^i
f_{X!}F is constructible on X for all i ≥ 0; (iii) for every X = Spa(C, C⁺) → Y (C algebraically
closed, C⁺ open bounded valuation subring) and quasicompact open j : U → X, with f_U, j′ the
pullbacks, the map j′_!Rf_U^!F_ℓ → Rf_X^!j_!F_ℓ adjoint to Rf_X!j′_!Rf_U^!F_ℓ = j_!Rf_U!Rf_U^!F_ℓ →
j_!F_ℓ is an equivalence; (iv) for every strictly totally disconnected X → Y, Rf_X^!F_ℓ ∈ D_ét(Y′
×_Y X, F_ℓ) is invertible.

**Hypotheses.**

- f compactifiable and representable in spatial diamonds; ℓ ≠ p.

**Construction and proof.**

1. Given (ii), condition (iii) for quasicompact U implies it for all U by S4/direct-sum-criterion
and a filtered colimit over quasicompact opens.
2. By S4/direct-sum-criterion, (ii) is equivalent to Rf_X^! commuting with direct sums; with (iii)
this is criterion (iii) of S4/strictly-local-criteria, equivalent to τ_{f_X} being an equivalence;
(iv) supplies invertibility.
3. Conversely smoothness gives (i)–(iv) by S4/smooth-twisted-pullback.

Proposed declaration: `isCohomologicallySmooth_iff_practical` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** ECD's proof of 24.1 checks exactly (i)–(iv) for the ball, with Huber's
constructibility, duality and trace as inputs.

**Depends on** within this roadmap `S4/strictly-local-criteria`, `S4/direct-sum-criterion`,
`S4/cohomologically-smooth`, `S4/invertible-object`.

**Used in this roadmap by** `S4/smooth-universally-open`, `S4/smooth-upper-shriek-base-change`,
`S5/ball-smooth`, `S5/nonfree-quotient-smooth`, `S6/biduality`.

**Source.** ECD Proposition 23.10, p. 145: “Then f is ℓ-cohomologically smooth if and only if the
following conditions are satisfied.”; ECD proof of Proposition 23.10, p. 146: “Thus, the result
follows from the equivalence of (ii) and (iii) in Proposition 23.4 and Proposition 23.7.”

### `S4/smooth-universally-open` — ℓ-cohomologically smooth maps are universally open ★


Let f : Y′ → Y be a separated map of small v-stacks, representable in locally spatial diamonds and
ℓ-cohomologically smooth for some ℓ ≠ p. Then f is universally open: for every X → Y the map |Y′ ×_Y
X| → |X| is open.

**Hypotheses.**

- f separated, representable in locally spatial diamonds, ℓ-cohomologically smooth.

**Construction and proof.**

1. Reduce to Y = X strictly totally disconnected and Y′ spatial; it suffices that the image of |Y′|
→ |X| is open, and since it is generalising, that it is constructible.
2. Rf_!Rf^!F_ℓ is constructible (Rf^!F_ℓ invertible hence constructible,
S4/practical-smoothness-criterion (ii)); its support is constructible.
3. The support equals the image: if s ∉ image, Rf^!F_ℓ lives over X ∖ {s}, so does Rf_!Rf^!F_ℓ; if s
is in the image, with U = X ∖ {s}, condition (iii) shows Rf_!Rf^!F_ℓ|_s has stalk that of
Rf_!Rf^!F_ℓ at s, and Hom(Rf_!Rf^!F_ℓ|_s, F_ℓ) = Hom(Rf^!F_ℓ|_s, Rf^!F_ℓ) ≠ 0 since the fibre over s
is nonempty.

Proposed declaration: `IsCohomologicallySmooth.isUniversallyOpen` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** The origin of the perfectoid ball has non-open image, so its inclusion is not
smooth; open immersions are.

**Depends on** within this roadmap `S4/cohomologically-smooth`, `S4/practical-smoothness-criterion`,
`S4/strictly-local-criteria`, `S4/smooth-twisted-pullback`; elsewhere
`DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`, `DiamondEtaleCohomology:C7`.

**Used in this roadmap by** `S4/smooth-descent-along-smooth-surjection`,
`S4/representability-descent`.

**Source.** ECD Proposition 23.11, p. 146: “Then f is universally open, i.e. for all X → Y , the map
|Y ′ ×Y X| → |X| is open.”; ECD proof of Proposition 23.11, p. 146: “We claim that the support of
Rf! Rf ! Fℓ agrees with the image of |Y ′ | → |X|.”

### `S4/dualizing-complex` — The dualizing complex of an ℓ-cohomologically smooth map ★


For f : Y′ → Y separated, representable in locally spatial diamonds and ℓ-cohomologically smooth,
and Λ an ℓ-power-torsion ring, the dualizing complex is D_f := Rf^!Λ ∈ D_ét(Y′, Λ). It is
invertible, étale locally isomorphic to Λ[n] with n locally constant, the canonical transformation
τ_f : D_f ⊗_Λ f^* → Rf^! is an equivalence, and D_f commutes with every base change: g′^*D_f ≃
D_{f̃}. Its local degree is −2 dim at points where f is a smooth analytic map of relative dimension
d in the sense of S5 (D = Λ(d)[2d]).

**Hypotheses.**

- f ℓ-cohomologically smooth; Λ ℓ-power torsion.

**Construction and proof.**

1. Define D_f := Rf^!Λ (S3/upper-shriek); invertibility and τ_f an equivalence are
S4/smooth-twisted-pullback; base change is S4/smooth-upper-shriek-base-change.

Proposed declaration: `dualizingComplex` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `dualizingComplex_def` | characterisation | D_f = Rf^!Λ. |
| `dualizingComplex_isInvertible` | projection | D_f is invertible (S4/invertible-object). |
| `upperShriek_eq_dualizing_tensor_pullback` | characterisation | Rf^! ≃ D_f ⊗_Λ f^* via τ_f. |
| `dualizingComplex_baseChange` | functoriality | g′^*D_f ≃ D_{f̃} for every cartesian square. |
| `dualizingComplex_comp` | relation | D_{f∘g} ≃ D_g ⊗ g^*D_f for composable smooth maps (S4/smooth-composition). |
| `dualizingComplex_etale` | compatibility | For f separated étale, D_f ≃ Λ. |
| `dualizingComplex_restrictScalars` | compatibility | For Λ → Λ′ of ℓ-power-torsion rings, D_f over Λ′ is D_f ⊗_Λ Λ′. |

**Used by.**

- ECD Propositions 23.13, 23.16(iii) and 23.17: composition, exchange with pullback and smooth
  pullback of internal Hom are computed by tensoring with D_f.
- ECD Theorem 24.1 and Propositions 24.2–24.5: the examples identify D_f (Λ(1)[2] for the ball;
  q^*D_{f/K} for quotients).
- ECD Theorem 25.1: Verdier duality RHom(−, D_f) and its biduality.
- VStackSheavesAndLisseCategories:VS0 (FS IV.1.17): the dualizing complex of a smooth stacky map is
  glued from those of charts.
- BunGAndNewtonStrata:BG3: the ℓ-dimension of strata is read off from the degree of D_f.

**Unit tests.**

- `dualizingComplex_id` (degenerate): D_{id} ≅ Λ.
- `dualizingComplex_ball` (computation): For the ball B → *, D_f ≅ Λ(1)[2] (S5/ball-smooth).
- `dualizingComplex_finiteEtale` (compatibility): For a finite étale f, D_f ≅ Λ and τ_f is the
  identification Rf^! = f^*.
- `dualizingComplex_not_const_profinite` (non-example): For the profinite projection q : S × X → X
  (not smooth), Rq^!Λ is the sheaf of distributions on S, not étale-locally Λ[n].

**Acceptance.** D_f = Λ for f separated étale; D_f = Λ(1)[2] for the ball; for a composite D_{f∘g} =
D_g ⊗ g^*D_f.

**Depends on** within this roadmap `S3/upper-shriek`, `S4/smooth-twisted-pullback`,
`S4/smooth-upper-shriek-base-change`, `S4/invertible-object`, `S4/cohomologically-smooth`.

**Used in this roadmap by** `S6/verdier-dual`, `S6/biduality`.

**Source.** ECD Proposition 23.12(i), p. 147: “is an equivalence, and the dualizing complex Df := Rf
! Λ ∈ Dét (Y ′ , Λ) is invertible, in fact étale locally isomorphic to Λ[n] for some integer n ∈
Z.”; ECD Proposition 23.12(iii), p. 147: “In particular, the dualizing complex Df commutes with base
change, i.e.”

### `S4/smooth-twisted-pullback` — Rf^! is a twisted pullback for smooth f


Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth,
and Λ ℓ-power torsion. Then τ_f : Rf^!Λ ⊗_Λ f^* → Rf^! is an equivalence of functors D_ét(Y, Λ) →
D_ét(Y′, Λ), and Rf^!Λ is invertible, étale locally ≃ Λ[n]. In particular the a priori unspecified
equivalence of the definition is the canonical transformation τ_f, and the dualizing object is
Rf^!Λ.

**Hypotheses.**

- f ℓ-cohomologically smooth; Λ ℓ-power torsion.

**Construction and proof.**

1. Over a strictly totally disconnected Y = X: the definition gives (ii) of
S4/strictly-local-criteria, hence (i) and, by S4/strictly-local-criteria-torsion, τ_f over Λ; Rf^!Λ
⊗ F_ℓ = Rf^!F_ℓ is invertible, so Rf^!Λ is (extension of m copies of F_ℓ[n], S4/invertible-object).
2. Base change between strictly totally disconnected spaces (first step of
S4/smooth-upper-shriek-base-change) shows that Rf^! commutes with pullback along a v-hypercover X̃•
→ Y by disjoint unions of strictly totally disconnected spaces.
3. Then τ_f can be checked after pullback to X̃₀, where it holds; invertibility descends étale
locally by S4/invertible-object.

Proposed declaration: `IsCohomologicallySmooth.upperShriek_twist` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For the ball, Rf^!M = M(1)[2] for every Λ-module M.

**Depends on** within this roadmap `S4/strictly-local-criteria`,
`S4/strictly-local-criteria-torsion`, `S4/invertible-object`, `S4/cohomologically-smooth`,
`S4/smooth-upper-shriek-base-change`; elsewhere `DiamondEtaleCohomology:C2`.

**Used in this roadmap by** `S4/smooth-universally-open`, `S4/dualizing-complex`,
`S4/smooth-perfect-constructible`, `S4/smooth-composition`,
`S4/smooth-descent-along-smooth-surjection`, `S4/smooth-v-local-on-target`, `S4/smooth-base-change`,
`S4/smooth-upper-shriek-exchange`, `S4/smooth-pullback-internal-hom`, `S5/ball-smooth`,
`S5/geometric-base-criterion`.

**Source.** ECD Proposition 23.12(i), p. 147: “The natural transformation Rf ! Λ ⊗Λ f ∗ → Rf ! : Dét
(Y, Λ) → Dét (Y ′ , Λ)”; ECD proof of Proposition 23.12, p. 149: “this implies also that Rf ! Λ⊗Λ f
∗ → Rf ! is an equivalence, as this can now be checked after base change to X e0 , where we know
it.”

### `S4/smooth-perfect-constructible` — Quasicompact smooth Rf_! preserves perfect-constructible complexes


Let f : Y′ → Y be separated, representable in locally spatial diamonds, ℓ-cohomologically smooth and
quasicompact, and Λ ℓ-power torsion. For every perfect-constructible A ∈ D_ét(Y′, Λ), Rf_!A ∈
D_ét(Y, Λ) is perfect-constructible. No such statement is made for an arbitrary proper map.

**Hypotheses.**

- f quasicompact and ℓ-cohomologically smooth; Λ ℓ-power torsion; A perfect-constructible (C7).

**Construction and proof.**

1. By base change (S2/lower-shriek-base-change) and v-descent of perfect-constructibility (C7)
assume Y strictly totally disconnected; Y′ is then spatial of bounded cohomological dimension
(S1/compactification-cd-bound).
2. By C9/compact-iff-perfect-constructible (ECD 20.17) compact objects of D_ét(Y′, Λ), D_ét(Y, Λ)
are the perfect-constructible complexes.
3. Rf_! preserves compacts iff Rf^! preserves sums (Neeman, E3), which holds since Rf^! = D_f ⊗ f^*
(S4/smooth-twisted-pullback).

Proposed declaration: `IsCohomologicallySmooth.lowerShriek_perfectConstructible` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** RΓ_c(B × Spa(C, O_C), Λ) = Λ(−1)[−2] is perfect; R q_!Λ for the non-smooth q : S × X
→ X (S infinite) is C⁰(S, Λ), not perfect.

**Depends on** within this roadmap `S4/smooth-twisted-pullback`, `S1/compactification-cd-bound`,
`S2/lower-shriek-base-change`; elsewhere
`DiamondEtaleCohomology:C9/compact-iff-perfect-constructible`, `EnhancedDerivedSheaves:E3`,
`DiamondEtaleCohomology:C7`.

**Source.** ECD Proposition 23.12(ii), p. 147: “If f is quasicompact, then for any
perfect-constructible A ∈ Dét (Y ′ , Λ), the proper pushforward Rf! A ∈ Dét (Y, Λ) is
perfect-constructible.”; ECD proof of Proposition 23.12, p. 149: “We need to see that Rf! preserves
compact objects, but this is equivalent to the condition that Rf ! preserves arbitrary direct sums,
which follows from part (i).”

### `S4/smooth-upper-shriek-base-change` — Rf^! of a smooth map commutes with arbitrary base change


Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth,
Λ ℓ-power torsion, and g : Ỹ → Y any map of small v-stacks (ECD writes v-sheaves), with pullbacks
f̃, g′. Then the base-change transformation g′^*Rf^! → Rf̃^!g^* (S3/adjunction-calculus) is an
equivalence; in particular g′^*D_f ≃ D_{f̃}.

**Hypotheses.**

- f ℓ-cohomologically smooth; g arbitrary; Λ ℓ-power torsion.

**Construction and proof.**

1. Over a strictly totally disconnected base τ_f is an equivalence with Rf^!Λ invertible
(S4/strictly-local-criteria with S4/strictly-local-criteria-torsion and S4/invertible-object), so
for Y = X, Ỹ = X̃ strictly totally disconnected it suffices to show g′^*D_f ≃ D_{f̃}: by condition
(iv) of S4/strictly-local-criteria reduce to connected X = Spa(C, O_C), X̃ = Spa(C̃, O_C̃) (using
commutation with j_* for quasicompact opens), Y′ spatial.
2. Rf_!Rf^!F_ℓ is constructible, so Hom(Rf_!Rf^!F_ℓ, F_ℓ) = Hom(F_ℓ, F_ℓ) on Y′ is finite and π₀Y′
is finite; assume Y′ connected, so Ỹ′ is connected (C6, ECD 19.5(iii)) and D_f = L[n], D_{f̃} =
L̃[ñ] for local systems.
3. The comparison g′^*L[n] → L̃[ñ] is nonzero (via the diagram with RΓ(Y′_ét, F_ℓ) ≅ RΓ(Ỹ′_ét, F_ℓ),
C6), forcing ñ ≥ n with equality giving an isomorphism; choose C̃ maximising ñ (bounded by 3 dim.trg
f).
4. Over Spa(C, O_C) use a v-hypercover X̃• with X̃₀ = X̃ and hyperdescent D_ét ≃ D_cart,ét (C2, ECD
17.3): Rf_! is termwise Rf̃ᵢ_!, its termwise right adjoints preserve cartesian objects by the case
already shown, so they form the right adjoint of the cartesian Rf̃•_!, giving base change along X̃ →
X.
5. General Ỹ → Y: cover by disjoint unions of strictly totally disconnected spaces and combine the
base changes.

Proposed declaration: `IsCohomologicallySmooth.upperShriek_baseChange` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For the ball, base change along Spa(C′, O_C′) → Spa(C, O_C) carries Λ(1)[2] to
Λ(1)[2].

**Depends on** within this roadmap `S4/strictly-local-criteria`,
`S4/strictly-local-criteria-torsion`, `S4/invertible-object`, `S4/cohomologically-smooth`,
`S3/adjunction-calculus`, `S4/practical-smoothness-criterion`; elsewhere
`DiamondEtaleCohomology:C6`, `DiamondEtaleCohomology:C2`, `EnhancedDerivedSheaves:E3`.

**Used in this roadmap by** `S4/dualizing-complex`, `S4/smooth-twisted-pullback`,
`S4/smooth-composition`, `S4/smooth-v-local-on-target`, `S4/smooth-base-change`,
`S4/smooth-upper-shriek-exchange`.

**Source.** ECD Proposition 23.12(iii), p. 147: “If g : Ye → Y is a map of small v-sheaves with base
change”; ECD proof of Proposition 23.12, p. 148: “This implies that n e ≥ n, and that it is an
isomorphism if n e = n.”; ECD proof of Proposition 23.12, p. 149: “This gives the desired base
change result along Spa(C,e O e ) → Spa(C, OC ) in general,”

### `S4/smooth-composition` — Composites of ℓ-cohomologically smooth maps ★


Let g : Y″ → Y′ and f : Y′ → Y be separated morphisms of small v-stacks, ℓ ≠ p. If f and g are
representable in locally spatial diamonds and ℓ-cohomologically smooth, then f ∘ g is representable
in locally spatial diamonds and ℓ-cohomologically smooth, with D_{f∘g} ≃ D_g ⊗ g^*D_f.

**Hypotheses.**

- f, g separated, representable in locally spatial diamonds, ℓ-cohomologically smooth.

**Construction and proof.**

1. f ∘ g is eligible (S0/eligible-morphism, composition).
2. Over strictly totally disconnected X → Y: R(f∘g)_X^! ≃ Rg^!Rf^! (S3/upper-shriek-composition) ≃
D_g ⊗ g^*(D_f ⊗ f^*) by S4/smooth-twisted-pullback and S4/smooth-upper-shriek-base-change (for g
over the non-perfectoid Y′ ×_Y X).

Proposed declaration: `IsCohomologicallySmooth.comp` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Bⁿ → * is smooth with D = Λ(n)[2n] as an iterated composite of balls.

**Depends on** within this roadmap `S4/cohomologically-smooth`, `S4/smooth-twisted-pullback`,
`S4/smooth-upper-shriek-base-change`, `S3/upper-shriek-composition`, `S0/eligible-morphism`.

**Used in this roadmap by** `S5/analytic-smooth-is-cohomologically-smooth`, `S5/spd-qp-smooth`.

**Source.** ECD Proposition 23.13, p. 149: “If f and g are representable in locally spatial diamonds
and ℓ-cohomologically smooth, then f ◦ g is representable in locally spatial diamonds and
ℓ-cohomologically smooth.”; ECD proof of Proposition 23.13, p. 150: “The first part follows from
Proposition 23.12.”

### `S4/smooth-descent-along-smooth-surjection` — Smoothness descends along smooth surjections


Let g : Y″ → Y′ and f : Y′ → Y be separated morphisms of small v-stacks and ℓ ≠ p. If g and f ∘ g
are representable in locally spatial diamonds and ℓ-cohomologically smooth, g is surjective, and f
is representable in diamonds and compactifiable, then f is representable in locally spatial diamonds
and ℓ-cohomologically smooth. The hypotheses that f is representable in diamonds and compactifiable
and that g is surjective are part of the statement.

**Hypotheses.**

- g, f ∘ g representable in locally spatial diamonds and smooth; g surjective; f separated,
  representable in diamonds and compactifiable.

**Construction and proof.**

1. Representability of f in locally spatial diamonds: by D5 (ECD 13.4) check after pullback to
strictly totally disconnected Y; for quasicompact open V ⊂ Y″ the image U ⊂ Y′ is open
(S4/smooth-universally-open) and quasicompact; |U| is the quotient of |V| by an open qcqs
equivalence relation, so spectral with |V| → |U| spectral (D0/spectral-quotient-criterion, ECD
2.10), U is spatial (D5/quasi-pro-etale-and-fibre-product-permanence, the converse for universally
open covers).
2. locally dim.trg f ≤ dim.trg(f ∘ g) < ∞, using the modified tr.c̃ (C8, DIMTRG).
3. Over strictly totally disconnected Y: Rg^!(Rf^!F_ℓ) = R(f∘g)^!F_ℓ = Rg^!F_ℓ ⊗ g^*Rf^!F_ℓ is
invertible and Rg^!F_ℓ is invertible, so g^*Rf^!F_ℓ, hence Rf^!F_ℓ (g surjective), is invertible.
4. τ_f is an equivalence after applying the conservative Rg^! = Rg^!F_ℓ ⊗ g^* (g smooth surjective):
Rg^!Rf^! = R(f∘g)^! = Rg^!F_ℓ ⊗ g^*Rf^!F_ℓ ⊗ g^*f^* = Rg^!(Rf^!F_ℓ ⊗ f^*).

Proposed declaration: `IsCohomologicallySmooth.of_comp_of_surjective` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** A map whose pullback along a smooth chart is the ball is smooth, provided it is
compactifiable and representable in diamonds.

**Depends on** within this roadmap `S4/cohomologically-smooth`, `S4/smooth-universally-open`,
`S4/smooth-twisted-pullback`, `S3/upper-shriek-composition`, `S0/compactifiable-morphism`; elsewhere
`DiamondsAndVStacks:D5/relative-representability`,
`DiamondsAndVStacks:D0/spectral-quotient-criterion`,
`DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`,
`DiamondEtaleCohomology:C8/diamond-dim-trg`.

**Used in this roadmap by** `S4/representability-descent`.

**Source.** ECD Proposition 23.13, p. 149: “Con- versely, if g and f ◦ g are representable in
locally spatial diamonds and ℓ-cohomologically smooth, g is surjective, and f is representable in
diamonds and compactifiable, then f is representable in locally spatial diamonds and
ℓ-cohomologically smooth.”; ECD proof of Proposition 23.13, p. 150: “One easily checks that locally
dim. trg f ≤ dim. trg(f ◦ g) < ∞ (where one uses the modified tr.”

### `S4/representability-descent` — Descent of representability along universally open covers


Let f : Y′ → Y be a separated 0-truncated map of small v-stacks representable in diamonds, and g :
Y″ → Y′ a universally open (for example ℓ-cohomologically smooth), separated and surjective map of
small v-stacks such that f ∘ g is representable in locally spatial diamonds. Then f is representable
in locally spatial diamonds. Moreover, if g is in addition locally split (S0/locally-split-map), the
hypothesis that f is compactifiable can be removed from S4/smooth-descent-along-smooth-surjection,
by S0/compactifiable-source-descent; without local splitting this is not known, and ℓ-cohomological
smoothness of g alone is not used as evidence for it.

**Hypotheses.**

- f separated, 0-truncated, representable in diamonds; g universally open, separated, surjective; f
  ∘ g representable in locally spatial diamonds.

**Construction and proof.**

1. The first paragraph of the proof of S4/smooth-descent-along-smooth-surjection uses only universal
openness of g: images of quasicompact opens are quasicompact opens with spectral underlying space
(D0/spectral-quotient-criterion), so f is representable in locally spatial diamonds (D5).
2. For the second statement: when g is locally split, S0/compactifiable-source-descent applied to f
and g gives f compactifiable (f is separated and now representable in locally spatial diamonds, and
f ∘ g is compactifiable as it is smooth).

Proposed declarations: `representableInLocallySpatial_of_universallyOpen_cover`, `IsCohomologicallySmooth.of_comp_of_isLocallySplit` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** A separated étale surjection g is locally split, so smoothness of f can be tested
along it without assuming compactifiability.

**Depends on** within this roadmap `S4/smooth-universally-open`, `S0/compactifiable-source-descent`,
`S0/locally-split-map`, `S4/smooth-descent-along-smooth-surjection`; elsewhere
`DiamondsAndVStacks:D5/relative-representability`,
`DiamondsAndVStacks:D0/spectral-quotient-criterion`,
`DiamondsAndVStacks:D5/quasi-pro-etale-and-fibre-product-permanence`.

**Source.** ECD Remark 23.14, p. 149: “then f is representable in locally spatial diamonds.”; ECD
Remark after 23.14, p. 150: “We do not know if in the second part, one can omit the hypothesis “f is
compactifiable”;”

### `S4/smooth-stable-under-base-change` — ℓ-cohomological smoothness is stable under base change


Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth,
and g : Ỹ → Y any map of small v-stacks with pullback f̃. Then f̃ is ℓ-cohomologically smooth.

**Hypotheses.**

- f smooth; g arbitrary.

**Construction and proof.**

1. Compactifiability, representability and locally finite dim.trg are stable under base change
(S0/eligible-morphism); the condition over strictly totally disconnected X → Ỹ is the condition for
X → Ỹ → Y.

Proposed declaration: `IsCohomologicallySmooth.baseChange` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** B × X → X is smooth for every X, by base change of B → *.

**Depends on** within this roadmap `S4/cohomologically-smooth`, `S0/eligible-morphism`.

**Used in this roadmap by** `S5/analytic-smooth-is-cohomologically-smooth`,
`S5/geometric-base-criterion`.

**Source.** ECD Proposition 23.15, p. 150: “If f is ℓ-cohomologically smooth, then fe is
ℓ-cohomologically smooth.”; ECD proof of Proposition 23.15, p. 150: “The first statement is clear
from the definition.”

### `S4/smooth-v-local-on-target` — ℓ-cohomological smoothness is v-local on the target, with dim.trg finiteness retained


Let f : Y′ → Y be separated and representable in locally spatial diamonds, g : Ỹ → Y a surjective
map of small v-stacks with pullback f̃. If f̃ is ℓ-cohomologically smooth and locally dim.trg f < ∞,
then f is ℓ-cohomologically smooth. Local finiteness of dim.trg f is a hypothesis on f itself; ECD
does not show that it can be checked v-locally.

**Hypotheses.**

- f separated, representable in locally spatial diamonds, locally dim.trg f < ∞ (hypothesis on f); g
  surjective.

**Construction and proof.**

1. f is compactifiable by S0/compactifiable-v-local; so f is eligible with the given dimension
hypothesis.
2. Reduce to Y = X, Ỹ = X̃ strictly totally disconnected; then the simplicial v-hypercover argument
of S4/smooth-upper-shriek-base-change with X̃₀ = X̃ identifies Rf^! with the descended twisted
pullback.

Proposed declaration: `IsCohomologicallySmooth.of_baseChange_of_surjective` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Smoothness of (Spa ℚ_p)^♢ → * is deduced from its pullback to Spa(C, O_C)
(S5/spd-qp-smooth), dim.trg being finite there directly.

**Depends on** within this roadmap `S4/cohomologically-smooth`, `S0/compactifiable-v-local`,
`S4/smooth-upper-shriek-base-change`, `S4/smooth-twisted-pullback`; elsewhere
`DiamondEtaleCohomology:C8/locally-finite-dim-trg`, `DiamondEtaleCohomology:C2`.

**Used in this roadmap by** `S5/analytic-smooth-is-cohomologically-smooth`, `S5/spd-qp-smooth`.

**Source.** ECD Proposition 23.15, p. 150: “Conversely, if fe is ℓ- cohomologically smooth, g is a
surjective map of v-stacks, and locally dim. trg f < ∞, then f is ℓ-cohomologically smooth.”; ECD
Proposition 23.15, p. 150: “It is not clear to us whether the condition that locally dim. trg f < ∞
can be checked v-locally on the target.”

### `S4/smooth-base-change` — Smooth base change ★


Let Y′ →g̃ Y, f′ : Y′ → X′, f : Y → X, g : X′ → X be a cartesian square of small v-stacks, nΛ = 0
with n prime to p, g separated, representable in locally spatial diamonds and ℓ-cohomologically
smooth, and Λ ℓ-power torsion. Then for every A ∈ D_ét(Y, Λ) the base-change morphism g^*Rf_*A →
Rf′_*g̃^*A is an isomorphism; f is arbitrary.

**Hypotheses.**

- g smooth; f arbitrary; Λ ℓ-power torsion.

**Construction and proof.**

1. S3/upper-shriek-pushforward-exchange (23.16(i)): Rg^!Rf_* ≅ Rf′_*Rg̃^!.
2. S4/smooth-twisted-pullback: Rg^! = D_g ⊗ g^*, Rg̃^! = D_{g̃} ⊗ g̃^* with D_{g̃} = f′^*D_g
(S4/smooth-upper-shriek-base-change).
3. So D_g ⊗ g^*Rf_*A ≅ Rf′_*(f′^*D_g ⊗ g̃^*A) = D_g ⊗ Rf′_*g̃^*A (projection formula for an
invertible object, C3); cancel the invertible D_g.

Proposed declaration: `IsCohomologicallySmooth.pushforward_baseChange` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For g the ball over X: RΓ(B × Y, A) computed fibrewise; for g the profinite
projection (not smooth) only quasicompact base change C3 applies.

**Depends on** within this roadmap `S3/upper-shriek-pushforward-exchange`,
`S4/smooth-twisted-pullback`, `S4/smooth-upper-shriek-base-change`; elsewhere
`DiamondEtaleCohomology:C3`.

**Used in this roadmap by** `S6/biduality`.

**Source.** ECD Proposition 23.16(ii), p. 151: “Then for all A ∈ Dét (Y, Λ), the base change
morphism g ∗ Rf∗ A → Rf∗′ ge∗ A is an isomorphism.”; ECD proof of Proposition 23.16, p. 151: “Part
(i) follows from Proposition 22.19 by passing to right adjoints. Now part (ii) follows”

### `S4/smooth-upper-shriek-exchange` — Rf^! commutes with smooth pullback


In the cartesian square of S4/smooth-base-change, assume g separated, representable in locally
spatial diamonds and ℓ-cohomologically smooth, Λ ℓ-power torsion, and in addition f compactifiable
and representable in locally spatial diamonds with locally dim.trg f < ∞, so that Rf^! and Rf′^! are
defined (the hypothesis on f is missing in print, PAPER-SCHOLZE-17/E66). Then for A ∈ D_ét(X, Λ) the
map g̃^*Rf^!A → Rf′^!g^*A, adjoint to Rf^!A → Rf^!Rg_*g^*A = Rg̃_*Rf′^!g^*A, is an equivalence.

**Hypotheses.**

- g smooth; f eligible (added hypothesis); Λ ℓ-power torsion.

**Construction and proof.**

1. f′ is eligible by base change (S0/eligible-morphism) and Rf^!Rg_* ≅ Rg̃_*Rf′^! by
S3/upper-shriek-pushforward-exchange for the eligible f.
2. Tensor with the invertible Rg̃^!Λ: g̃^*Rf^!A ⊗ Rg̃^!Λ = Rg̃^!Rf^!A = Rf′^!Rg^!A = Rf′^!(g^*A ⊗
Rg^!Λ) (S3/upper-shriek-composition, S4/smooth-twisted-pullback).
3. Rf′^!(g^*A ⊗ Rg^!Λ) = Rf′^!g^*A ⊗ f′^*Rg^!Λ (Rg^!Λ invertible) and f′^*Rg^!Λ = Rg̃^!Λ
(S4/smooth-upper-shriek-base-change); the printed F_ℓ in these formulas should be Λ
(PAPER-SCHOLZE-17/E67).

Proposed declaration: `IsCohomologicallySmooth.upperShriek_exchange` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** ECD 24.6's proof applies this to g : X̃ → X an open subset of a ball over X.

**Depends on** within this roadmap `S3/upper-shriek-pushforward-exchange`,
`S4/smooth-twisted-pullback`, `S4/smooth-upper-shriek-base-change`, `S3/upper-shriek-composition`,
`S0/eligible-morphism`.

**Used in this roadmap by** `S5/geometric-base-criterion`.

**Source.** ECD Proposition 23.16(iii), p. 151: “Assume that g is separated, representable in
locally spatial diamonds and ℓ-cohomologically smooth, and Λ is ℓ-power torsion.”; ECD proof of
Proposition 23.16, p. 151: “Finally, for part (iii), we can tensor by Re”

### `S4/smooth-pullback-internal-hom` — Smooth pullback commutes with internal Hom


Let f : Y → X be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth,
and Λ ℓ-power torsion (the coefficient hypothesis is missing in print, PAPER-SCHOLZE-17/E68). There
is a functorial isomorphism f^*RHom(A, B) ≅ RHom(f^*A, f^*B) for A, B ∈ D_ét(X, Λ).

**Hypotheses.**

- f smooth; Λ ℓ-power torsion (added).

**Construction and proof.**

1. S3/upper-shriek-internal-hom: Rf^!RHom(A, B) ≅ RHom(f^*A, Rf^!B).
2. Rf^! = f^* ⊗ D_f with D_f invertible (S4/smooth-twisted-pullback); cancel D_f on both sides.

Proposed declaration: `IsCohomologicallySmooth.pullback_internalHom` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Used in ECD 25.1's proof to transport biduality along the smooth surjection Y → X.

**Depends on** within this roadmap `S3/upper-shriek-internal-hom`, `S4/smooth-twisted-pullback`.

**Used in this roadmap by** `S6/biduality`.

**Source.** ECD Proposition 23.17, p. 151: “There is a functorial isomorphism f ∗ RH om(A, B) ∼ = RH
om(f ∗ A, f ∗ B) in A, B ∈ Dét (X, Λ).”; ECD proof of Proposition 23.17, p. 151: “This follows from
Proposition 23.3 (ii) together with the identification Rf ! = f ∗ ⊗Λ Rf ! Λ, where Rf ! Λ is
invertible.”

### `S4/etale-maps-smooth` — Separated étale maps and open immersions are ℓ-cohomologically smooth


Every separated étale map f : Y′ → Y of small v-stacks is ℓ-cohomologically smooth for every ℓ ≠ p,
with Rf^! ≃ f^* and D_f ≃ Λ; in particular open immersions are.

**Hypotheses.**

- f separated étale.

**Construction and proof.**

1. f is eligible (S0/eligible-morphism).
2. Rf^! ≃ f^* (S3/upper-shriek-etale), so the definition holds with D = Λ, which is invertible.

Proposed declaration: `IsCohomologicallySmooth.of_separated_etale` (module `TauCeti/Diamond/SixOperations/CohomologicalSmoothness`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Open subsets of the ball are smooth over *, by composition with S5/ball-smooth.

**Depends on** within this roadmap `S0/eligible-morphism`, `S3/upper-shriek-etale`,
`S4/cohomologically-smooth`, `S4/invertible-object`.

**Used in this roadmap by** `S5/analytic-smooth-is-cohomologically-smooth`, `S5/spd-qp-smooth`,
`S5/geometric-base-criterion`, `S6/biduality`, `S6/biduality-counterexample`.

**Source.** ECD proof of Theorem 25.1, p. 160: “The projection map Y → X is cohomologically smooth
(as the composite of an open immersion and a pullback of BC → Spa(C, OC ), cf. Theorem 24.1)”; ECD
proof of Proposition 23.4, p. 143: “But if g = gi is étale, then g ∗ = Rg ! and h∗ = Rh! ,”

## S5. Examples: the ball, quotients and analytic smooth maps

Theorem 24.1 is proved for the absolute perfectoid ball B(R, R⁺) = R⁺ with the canonical
normalisation Rf^!Λ ≃ Λ(1)[2], from Huber's constructibility, duality and trace
(ClassicalAdicEtaleCohomology H3–H4). Quotients by free (24.2) and non-free (24.3) actions of
profinite groups of pro-order prime to ℓ use the normalised Λ-valued Haar measure and the averaging
transformation q^* → Rq^!; Rq^! itself is a sheaf of distributions and is not q^*, so the comparison
is stated after composing with the quotient's structure map. A pro-ℓ group admits no normalised
measure. Smooth analytic maps over ℤ_p (24.4), Spd ℚ_p → * (24.5) and the geometric-base criterion
(24.6) follow.

Planets of this layer: Absolute perfectoid ball B (`S5/perfectoid-ball`); Cohomological smoothness
of the ball (`S5/ball-smooth`); Quotients by free profinite actions (`S5/free-quotient-smooth`);
Quotients by non-free profinite actions (`S5/nonfree-quotient-smooth`); Smooth analytic maps are
cohomologically smooth (`S5/analytic-smooth-is-cohomologically-smooth`); Smoothness of Spd ℚ_p
(`S5/spd-qp-smooth`).

Other roadmaps' stages used (requested): `DiamondEtaleCohomology:C0`, `DiamondEtaleCohomology:C3`,
`DiamondEtaleCohomology:C4`, `DiamondEtaleCohomology:C7`, `PerfectoidSpaces:P1`,
`tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index`.

Other roadmaps' declarations and nodes used: `AdicEtaleGeometry:A2/relative-closed-polydisc`,
`AdicEtaleGeometry:A2/relative-torus`, `AdicEtaleGeometry:A2/smooth-morphism-ball-charts`,
`ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`,
`ClassicalAdicEtaleCohomology:H3/curve-trace`,
`ClassicalAdicEtaleCohomology:H3/curve-trace-base-change`,
`ClassicalAdicEtaleCohomology:H3/duality-open-extension-compatibility`,
`ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension`,
`ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`,
`ClassicalAdicEtaleCohomology:H4/perfectoid-base-constructibility-transfer`,
`DiamondEtaleCohomology:C8/analytic-dim-trg`, `DiamondEtaleCohomology:C8/analytic-dimension-bound`,
`DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/qpetale-direct-image`,
`DiamondEtaleCohomology:C9/finite-field-compact-objects`,
`DiamondsAndVStacks:D0/spectral-quotient-criterion`,
`DiamondsAndVStacks:D1/strictly-totally-disconnected`,
`DiamondsAndVStacks:D2/v-descent-of-functions`,
`DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`,
`DiamondsAndVStacks:D3/locally-profinite-torsors`,
`DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`,
`DiamondsAndVStacks:D6/etale-site-comparison`,
`DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`,
`DiamondsAndVStacks:D6/spd-is-a-spatial-diamond`, `mathlib:LocallyConstant`,
`mathlib:Subgroup.index`.

Acceptance tests of the layer: the ball; ℤ_p acting on the compatible-root torus; ℤ_ℓ as a group
without a normalised measure; Spd ℚ_p over Spa(C, O_C) as the punctured disc modulo ℤ_p.

### `S5/perfectoid-ball` — The absolute perfectoid ball B ★


B is the v-sheaf on Perf (characteristic-p perfectoid spaces) with B(R, R⁺) = R⁺ for affinoid
perfectoid Spa(R, R⁺), extended by gluing; f : B → * is its structure map, * = Spd F_p the final
v-sheaf. For an affinoid perfectoid X = Spa(R, R⁺), B × X = Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩), the
perfectoid closed unit ball over X; for X perfectoid it is the diamond of the relative closed unit
ball B_X of AdicEtaleGeometry A2 (its perfection). B is not the ordinary analytic unit disc over a
mixed-characteristic base; the comparison with B_Y^♢ for analytic Y over ℤ_p goes through
S5/analytic-smooth-is-cohomologically-smooth. B → * is separated and compactifiable: its canonical
compactification is R ↦ R°, into which B is the open subfunctor {|T| ≤ 1}; it is representable in
spatial diamonds with dim.trg 1.

**Hypotheses.**

- Perf is the site of characteristic-p perfectoid spaces of D2; the coordinate T ∈ O⁺(B).

**Construction and proof.**

1. Define B(R, R⁺) = R⁺; it is a v-sheaf because O⁺ is (D2/v-descent-of-functions).
2. Over X = Spa(R, R⁺), B × X represents T ↦ (map to X, element of O⁺), which is Spa(R⟨T^{1/p^∞}⟩,
R⁺⟨T^{1/p^∞}⟩) (characteristic p: p-th roots of T exist uniquely), compatible with A2's B_X after
perfection (D6/gluing-and-the-diamond-functor).
3. Canonical compactification over *: B‾(R, R⁺) = B(R, R°) = R° (C4, ECD 18.6); B → B‾ pulls back
along t ∈ R° to the rational subset {|t| ≤ 1} of Spa(R, R⁺), an open immersion, so B → * is
compactifiable (S0/compactifiable-iff-separated-open).
4. dim.trg(B × X → X) = 1: completed residue fields of points of the perfectoid ball have modified
topological transcendence degree ≤ 1 over the base (C8/analytic-dim-trg via the ball's diamond).

Proposed declaration: `Ball` (module `TauCeti/Diamond/SixOperations/SmoothExamples`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `Ball.app` | characterisation | Maps X → B from an affinoid perfectoid X = Spa(R, R⁺) are the elements of R⁺. |
| `Ball.prod_affinoid` | compatibility | B × Spa(R, R⁺) ≅ Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩), the perfectoid closed unit ball. |
| `Ball.diamond_relativeBall` | compatibility | For a perfectoid space X, B × X ≅ (B_X)^♢ with B_X AdicEtaleGeometry A2's relative closed unit ball. |
| `Ball.isCompactifiable` | structure | B → * is compactifiable, with canonical compactification R ↦ R° and B ⊂ B‾ the open {∣T∣ ≤ 1}. |
| `Ball.isSpatialEligible` | structure | B → * is spatial-eligible with dim.trg 1. |
| `Ball.coordinate` | data | The coordinate T ∈ O⁺(B)(B), universal element. |
| `Ball.openDisc` | other | The open unit disc D = ⋃_n {∣T∣^n ≤ ∣ϖ∣} ⊂ B × Spa(K, O_K) and the punctured disc D^× = D ∖ {0} are open sub-v-sheaves; D^× = Spa F_p((t^{1/p^∞})) × Spa(C, O_C) over C (ECD 24.5). |

**Used by.**

- ECD Theorem 24.1: the basic example of an ℓ-cohomologically smooth map.
- ECD Propositions 24.4–24.6: smooth analytic maps, Spd ℚ_p and the geometric-base criterion reduce
  to the ball.
- ECD Theorem 25.1 (proof): the auxiliary space {f − T = 0} ⊂ X × B_C is smooth over X.
- VStackSheavesAndLisseCategories:VS4 (FS V.2.1): contractibility of Banach–Colmez torsors reduces
  to the cohomology of the perfectoid open unit ball.
- VectorBundlesAndIsocrystals:VB3: positive Banach–Colmez spaces are presented by perfectoid balls.

**Unit tests.**

- `Ball.point_C` (computation): B(Spa(C, C⁺)) = C⁺ for a perfectoid field C.
- `Ball.compactification_ne` (non-example): B → * is not partially proper: the canonical
  compactification B‾(R, R⁺) = R° differs from B(R, R⁺) = R⁺ whenever R⁺ ≠ R°.
- `Ball.dimTrg` (computation): dim.trg(B → *) = 1.
- `Ball.prod_point` (degenerate): B × Spa(C, O_C) is the perfectoid closed unit disc
  Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩) over C.

**Acceptance.** B × Spa(C, O_C) = Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩); B(Spa(C, C⁺)) = C⁺ ≠ B‾(Spa(C,
C⁺)) = O_C.

**Depends on** within this roadmap `S0/compactifiable-iff-separated-open`; elsewhere
`DiamondsAndVStacks:D2/v-descent-of-functions`,
`DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`,
`AdicEtaleGeometry:A2/relative-closed-polydisc`, `DiamondEtaleCohomology:C4`,
`DiamondEtaleCohomology:C8/diamond-dim-trg`, `DiamondEtaleCohomology:C8/analytic-dim-trg`.

**Used in this roadmap by** `S5/ball-smooth`, `S5/spd-qp-smooth`.

**Source.** ECD Theorem 24.1, p. 152: “Let f : B → ∗ be the projection from the ball to the point,
where B(R, R+ ) = R+ .”; ECD proof of Theorem 24.1, p. 152: “Condition (i) is easy (in fact, dim.
trg f = 1).”

### `S5/tate-twist` — Tate twists Λ(d) on small v-stacks


Let n be prime to p and Λ a ring with nΛ = 0. μ_n is the étale sheaf on * = Spd F_p of n-th roots of
unity, μ_n(R, R⁺) = {x ∈ R : xⁿ = 1}; it is finite étale over * (n invertible). Λ(1) := Λ ⊗_{ℤ/n}
μ_n, Λ(d) := Λ(1)^{⊗d} for d ≥ 0 and Λ(−d) := RHom(Λ(d), Λ); for a small v-stack Y, Λ_Y(d) is the
pullback to Y. Λ(d) is invertible and étale locally ≅ Λ; over Spa(C, C⁺) a choice of compatible
roots of unity trivialises it. The definition is independent of n with nΛ = 0. It agrees with the
classical Λ ⊗ μ_n on analytic adic spaces used in ClassicalAdicEtaleCohomology H3.

**Hypotheses.**

- n prime to p, nΛ = 0.

**Construction and proof.**

1. μ_n is represented by the finite étale cover of * attached to the finite étale F_p-algebra
F_p[x]/(xⁿ − 1) (n invertible); it is an étale sheaf (D3), split over every algebraically closed
perfectoid field.
2. Λ(1) is locally ≅ Λ (choose a primitive n-th root of unity étale locally), hence invertible in
the sense of S4/invertible-object.
3. For m | n, μ_m = μ_n[m] and Λ ⊗_{ℤ/m} μ_m ≅ Λ ⊗_{ℤ/n} μ_n when mΛ = 0, so the twist does not
depend on n.
4. Under D6's equivalence of étale sites (D6/etale-site-comparison) it is the classical Λ(1) of H3.

Proposed declaration: `tateTwist` (module `TauCeti/Diamond/SixOperations/SmoothExamples`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `tateTwist_zero` | simp | Λ(0) = Λ. |
| `tateTwist_add` | relation | Λ(a) ⊗ Λ(b) ≅ Λ(a + b) for a, b ∈ ℤ. |
| `tateTwist_isInvertible` | structure | Λ(d) is invertible, étale locally ≅ Λ. |
| `tateTwist_pullback` | functoriality | f^*Λ_Y(d) ≅ Λ_{Y′}(d) for every map f : Y′ → Y. |
| `tateTwist_trivialise` | other | Over Spa(C, C⁺) with C algebraically closed, a compatible system of primitive roots of unity gives Λ(d) ≅ Λ. |
| `tateTwist_classical` | compatibility | For an analytic adic space Y over ℤ_p, Λ_{Y^♢}(1) corresponds to Huber's Λ ⊗ μ_n under D6's étale-site equivalence. |

**Used by.**

- ECD Theorem 24.1: D_f ≅ Λ(1)[2] for the ball.
- ClassicalAdicEtaleCohomology:H3/curve-trace: Huber's trace R²f_!μ_n → ℤ/n is twisted by μ_n.
- ECD Theorem 25.1 (proof): Poincaré duality on a smooth curve pairs RΓ_c(U, Λ(1)[2]) with RΓ(U, Λ).

**Unit tests.**

- `tateTwist_zero_test` (degenerate): Λ(0) ≅ Λ.
- `tateTwist_point` (computation): Over Spa(C, O_C) with C algebraically closed, H⁰(Spa(C, O_C),
  Λ(1)) ≅ Λ, non-canonically.
- `tateTwist_not_const_Qp` (non-example): Over (Spa ℚ_p)^♢ with ℓ odd and μ_ℓ ⊄ ℚ_p (p ≢ 1 mod ℓ),
  F_ℓ(1) is not isomorphic to F_ℓ: Gal(ℚ̄_p/ℚ_p) acts on μ_ℓ through a nontrivial character, so
  H⁰((Spa ℚ_p)^♢, F_ℓ(1)) = 0.

**Acceptance.** Over Spa(C, O_C), Λ(1) ≅ Λ after choosing ζ_n ∈ C; Galois acts on μ_n by the
cyclotomic character over Spa ℚ_p^♢.

**Depends on** within this roadmap `S4/invertible-object`; elsewhere
`DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks`,
`DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondEtaleCohomology:C3`.

**Used in this roadmap by** `S5/ball-smooth`.

**Source.** ECD Theorem 24.1, p. 152: “one has a canonical isomorphism”; ECD proof of Theorem 24.1,
p. 152: “RfX! Fℓ (1) = g ∗ RfC! Fℓ (1) → Fℓ [−2] ,”

### `S5/ball-smooth` — The ball is ℓ-cohomologically smooth with dualizing complex Λ(1)[2] ★


The structure map f : B → * of the absolute perfectoid ball (S5/perfectoid-ball) is
ℓ-cohomologically smooth for every prime ℓ ≠ p, and for every ring Λ with nΛ = 0 (n prime to p)
there is a canonical isomorphism D_f = Rf^!Λ ≅ Λ(1)[2], adjoint to the trace Rf_!Λ(1) → Λ[−2]
obtained from Huber's trace by base change. This concerns the absolute perfectoid ball; ordinary
analytic discs over a mixed-characteristic base are S5/analytic-smooth-is-cohomologically-smooth.

**Hypotheses.**

- ℓ ≠ p; Λ with nΛ = 0, n prime to p (for the isomorphism, decompose Λ into ℓ-primary parts).
- The classical inputs of ClassicalAdicEtaleCohomology H3–H4 enter with their recorded scope:
  Huber's duality over Spa(C, C⁺) with C⁺ ≠ O_C (needed in condition (iii)) is recorded there with a
  gap.

**Construction and proof.**

1. Check S4/practical-smoothness-criterion. (i) dim.trg f = 1.
2. (ii) Constructibility: for X strictly totally disconnected and F constructible on B × X, choose X
→ Spa(K, O_K), K = F_p((ϖ^{1/p^∞}))^∧, factoring through Spa(C, O_C) (C the completed algebraic
closure, X has no nonsplit finite étale covers); write X = lim Xᵢ with Xᵢ of topologically finite
type and descend F to Fᵢ (C7, ECD 20.7); R^j f_{X!}F = g^*R^j f_{Xᵢ!}Fᵢ by
S2/lower-shriek-base-change and the classical comparison, constructible by
H4/perfectoid-base-constructibility-transfer (Hub96 6.2.2).
3. (iii) For X = Spa(C, C⁺), a strongly noetherian base, this is Huber's duality compatible with
extension by zero (H3/duality-open-extension-compatibility, H3/curve-poincare-duality; Hub96 7.5.3).
4. (iv) Huber's trace Rf_{C!}F_ℓ(1) → F_ℓ[−2] (H3/curve-trace, H3/relative-ball-compact-support,
with R^i f_{C!} = 0 for i > 2 by H3/lower-shriek-cohomological-dimension) pulls back to X;
adjunction gives α : F_ℓ(1)[2] → Rf_X^!F_ℓ. By (iii) and S4/strictly-local-criteria, Rf_X^!F_ℓ
commutes with quasi-pro-étale base change, so α can be checked on connected components Spa(C, C⁺),
where it is Hub96 7.5.3 (H3/curve-poincare-duality).
5. Canonicity: α is adjoint to the base-changed trace, independent of choices; for general Λ, use
S4/smooth-twisted-pullback and the ℓ-primary decomposition.

Proposed declarations: `Ball.isCohomologicallySmooth`, `Ball.dualizingComplex_iso` (module `TauCeti/Diamond/SixOperations/SmoothExamples`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** R²f_!Λ(1) ≅ Λ on B × Spa(C, O_C); the ball over any strictly totally disconnected X
has D ≅ Λ(1)[2].

**Depends on** within this roadmap `S5/perfectoid-ball`, `S5/tate-twist`,
`S4/practical-smoothness-criterion`, `S4/strictly-local-criteria`, `S2/lower-shriek-base-change`,
`S4/smooth-twisted-pullback`; elsewhere
`ClassicalAdicEtaleCohomology:H4/perfectoid-base-constructibility-transfer`,
`ClassicalAdicEtaleCohomology:H3/duality-open-extension-compatibility`,
`ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`,
`ClassicalAdicEtaleCohomology:H3/curve-trace`,
`ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`,
`ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension`,
`ClassicalAdicEtaleCohomology:H3/curve-trace-base-change`, `DiamondEtaleCohomology:C7`,
`DiamondsAndVStacks:D1/strictly-totally-disconnected`.

**Used in this roadmap by** `S5/analytic-smooth-is-cohomologically-smooth`, `S5/spd-qp-smooth`,
`S5/geometric-base-criterion`, `S6/biduality`.

**Source.** ECD Theorem 24.1, p. 152: “Then f is ℓ-cohomologically smooth for any prime ℓ ̸= p, and
for any ring Λ with nΛ = 0 for some n prime to p, one has a canonical isomorphism”; ECD proof of
Theorem 24.1, p. 152: “Condition (iii) is a condition about fX : B × X → X in case X = Spa(C, C + )
is strongly Noetherian. Thus, Huber’s results and in particular [Hub96, Theorem 7.5.3] applies.”;
ECD proof of Theorem 24.1, p. 153: “Thus, we can assume X = Spa(C, C + ). In this case, the result
follows from [Hub96, Theorem 7.5.3].”

### `S5/normalized-haar-measure` — The normalised Λ-valued Haar measure of a profinite group of pro-order prime to ℓ


Let K be a profinite group whose supernatural order profiniteOrder K is prime to ℓ (Tau Ceti
ProfiniteProPGroups, Layer 1), and Λ an ℓ-power-torsion ring. The normalised Λ-valued Haar measure
is the Λ-linear map μ_K : C⁰(K, Λ) → Λ with μ_K(1_{gH}) = [K : H]^{−1} for every open subgroup H and
g ∈ K; it is well defined because every [K : H] divides profiniteOrder K (Lagrange) and is therefore
a unit in Λ, and it is left and right invariant with total volume μ_K(1) = 1. For K of pro-order
divisible by ℓ (e.g. a pro-ℓ group) no such measure exists: [K : H] is then divisible by ℓ for some
H and cannot be inverted, so prime-to-ℓ averaging is unavailable.

**Hypotheses.**

- profiniteOrder K prime to ℓ; ℓ^mΛ = 0.

**Construction and proof.**

1. A locally constant function is constant on cosets of some open normal H; set μ_K(φ) = [K :
H]^{−1} Σ_{gH ∈ K/H} φ(g).
2. Independence of H: for H′ ⊂ H open normal, [K : H′] = [K : H][H : H′] and each H-coset is a union
of [H : H′] H′-cosets.
3. [K : H] = profiniteIndex H K divides profiniteOrder K (Lagrange, ProfiniteProPGroups Layer 1,
agreement with Subgroup.index), so it is prime to ℓ and invertible in Λ.
4. Invariance under left and right translation is invariance of the finite averages.

Proposed declaration: `normalizedHaar` (module `TauCeti/Diamond/SixOperations/SmoothExamples`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `normalizedHaar_indicator` | simp | μ_K(1_{gH}) = [K : H]^{−1} for H open. |
| `normalizedHaar_one` | simp | μ_K(1) = 1. |
| `normalizedHaar_translate` | relation | μ_K(φ(k · −)) = μ_K(φ) = μ_K(φ(− · k)) for k ∈ K. |
| `normalizedHaar_index_isUnit` | other | For H ⊂ K open, the image of [K : H] in Λ is a unit. |
| `normalizedHaar_pushforward` | functoriality | For a surjection K → K/N with N closed normal, μ_K restricted to functions pulled back from K/N is μ_{K/N}. |
| `normalizedHaar_finite` | compatibility | For K finite of order prime to ℓ, μ_K(φ) = ∣K∣^{−1} Σ_{k∈K} φ(k). |

**Used by.**

- ECD Proposition 24.2 (proof): the trace q_*q^* → id is the colimit of the normalised finite-level
  traces, defining q^* → Rq^!.
- ECD Proposition 24.3 (proof): integration over the K-action gives q_*Λ → Λ.
- tauceti:TauCetiRoadmap/ProfiniteProPGroups Layer 1: Lagrange for the supernatural order gives
  invertibility of every open index.

**Unit tests.**

- `normalizedHaar_trivial` (degenerate): For K trivial, μ_K(φ) = φ(1).
- `normalizedHaar_Zp` (computation): For K = ℤ_p, ℓ ≠ p and Λ = F_ℓ: μ(1_{p^kℤ_p}) = p^{−k} mod ℓ.
- `normalizedHaar_finite_cyclic` (computation): For K = ℤ/m with ℓ ∤ m: μ(1_{0}) = m^{−1}.
- `not_exists_normalizedHaar_proEll` (non-example): For K = ℤ_ℓ and Λ = F_ℓ there is no Λ-linear
  invariant μ with μ(1) = 1: invariance forces μ(1_{ℓℤ_ℓ}) · ℓ = 1 in F_ℓ, which is impossible;
  pro-ℓ quotients cannot use prime-to-ℓ averaging.

**Acceptance.** For K = ℤ_p and ℓ ≠ p, μ(1_{a+p^kℤ_p}) = p^{−k} ∈ Λ; for K = ℤ_ℓ no normalised
measure exists.

**Depends on** elsewhere
`tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index`,
`mathlib:Subgroup.index`, `mathlib:LocallyConstant`.

**Used in this roadmap by** `S5/averaging-transformation`, `S5/free-quotient-smooth`.

**Source.** ECD Proposition 24.2, p. 153: “Moreover, if we fix the Λ-valued Haar measure on K with
total volume 1, there is a natural equivalence of functors”; ECD proof of Proposition 24.2, p. 153:
“natural trace maps qH,K∗ qH,K → id, which one can divide by [K : H] to make them compatible.”

### `S5/averaging-transformation` — The averaging transformation q^* → Rq^! for profinite quotients


Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth,
K a profinite group of pro-order prime to ℓ acting on Y′ over Y such that K × Y′ → Y′ ×_Y Y′ is
0-truncated and qcqs (in particular for free actions, where it is an injection), q : Y′ → Y′/K the
quotient by the image relation, and Λ ℓ-power torsion. Using the normalised Haar measure
(S5/normalized-haar-measure), construct a natural transformation α_q : q^* → Rq^! of functors
D_ét(Y′/K, Λ) → D_ét(Y′, Λ), adjoint to a trace Rq_!q^* = Rq_*q^* = q_*q^* → id. For free actions
the trace is the colimit over open H ⊂ K of the normalised finite-level traces [K : H]^{−1}tr_{H,K}
: q_{H,K*}q_{H,K}^* → id for q_{H,K} : Y′/H → Y′/K; in general it is induced by Rq^!Λ ⊗ q^* → Rq^!
and the map Λ → Rq^!Λ adjoint to the integration q_*Λ → Λ over the K-action. q is proper and
quasi-pro-étale, so Rq_! = Rq_* = q_* is exact (C8/qpetale-direct-image).

**Hypotheses.**

- K pro-order prime to ℓ; action 0-truncated and qcqs over Y; Λ ℓ-power torsion.

**Construction and proof.**

1. q is proper and quasi-pro-étale (it is a pro-system of finite étale maps Y′/H → Y′/K,
D3/locally-profinite-torsors), so Rq_! = Rq_* (S1/factorisation-independence) and Rq_* = q_* has
cohomological dimension 0 (C8/qpetale-direct-image).
2. Free case: q_*q^* = colim_H q_{H,K*}q_{H,K}^* (continuity, C0), and the normalised traces are
compatible in H (S5/normalized-haar-measure); their colimit is the trace q_*q^* → id.
3. General case: integration over the K-action is a map of sheaves q_*Λ → Λ, constructed v-locally
(where the action is a product) and descended; compose with τ_q (S3/adjunction-calculus).
4. Adjunction (S3/upper-shriek) gives α_q.

Proposed declaration: `averagingTransformation` (module `TauCeti/Diamond/SixOperations/SmoothExamples`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `averagingTransformation_trace` | characterisation | α_q is adjoint to the normalised trace q_*q^* → id. |
| `averagingTransformation_finite` | compatibility | For K finite (q finite étale), α_q is the identification q^* = Rq^! of S3/upper-shriek-etale. |
| `averagingTransformation_comp_unit` | relation | The composite F → q_*q^*F → F (unit then trace) is the identity, so R(f/K)_!F is a direct summand of Rf_!q^*F. |
| `averagingTransformation_baseChange` | functoriality | α_q is compatible with base change along Ỹ → Y. |
| `averagingTransformation_restrict_subgroup` | relation | For open H ⊂ K, α_q factors as α_{q_H} followed by q_H^*α_{q_{H,K}} normalised by [K : H]^{−1}. |

**Used by.**

- ECD Proposition 24.2: q^*R(f/K)^! → Rq^!R(f/K)^! = Rf^! is shown to be an equivalence.
- ECD Proposition 24.3: q^*R(f/K)^! ≃ Rf^! in the nonfree case and the direct-summand argument for
  constructibility.
- VectorBundlesAndIsocrystals:VB3, BunGAndNewtonStrata:BG3: quotients of smooth spaces by profinite
  groups of pro-order prime to ℓ (e.g. [*/G_b(E)] charts).

**Unit tests.**

- `averagingTransformation_trivial_group` (degenerate): For K trivial, α_q is the identity of id^* =
  id^!.
- `averagingTransformation_finite_free` (computation): For K = ℤ/m (ℓ ∤ m) acting freely, α_q is the
  identity of q^* and q_*q^*Λ → Λ is m^{−1} times the sum over the fibre.
- `averagingTransformation_not_iso_profinite` (non-example): For K infinite acting freely on Y′ = K
  × X over X, α_q : q^* → Rq^! is not an equivalence: Rq^!Λ is the sheaf of distributions
  (S5/profinite-quotient-upper-shriek); only q^*R(f/K)^! → Rf^! is an equivalence.
- `averagingTransformation_proEll_unavailable` (non-example): For K = ℤ_ℓ there is no normalised
  measure, and the construction does not apply (S5/normalized-haar-measure).

**Acceptance.** For K finite of order prime to ℓ acting freely, α_q is q^* → q^* (q étale) and the
trace is |K|^{−1} times the sum over K.

**Depends on** within this roadmap `S5/normalized-haar-measure`, `S3/adjunction-calculus`,
`S3/upper-shriek`, `S1/factorisation-independence`, `S4/cohomologically-smooth`; elsewhere
`DiamondEtaleCohomology:C8/qpetale-direct-image`, `DiamondsAndVStacks:D3/locally-profinite-torsors`,
`DiamondEtaleCohomology:C0`.

**Used in this roadmap by** `S5/free-quotient-smooth`, `S5/nonfree-quotient-smooth`.

**Source.** ECD proof of Proposition 24.2, p. 153: “This is adjoint to a map Rq! q ∗ = Rq∗ q ∗ = q∗
q ∗ → id. For any open subgroup H ⊂ K, consider”; ECD proof of Proposition 24.3, p. 155: “This map
can be constructed v-locally, and is given by integrating over the K-action, fixing the Λ-valued
Haar measure on K with total volume 1.”

### `S5/free-quotient-smooth` — Quotients by free actions of profinite groups of pro-order prime to ℓ ★


Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth
(ℓ ≠ p), and K a profinite group of pro-order prime to ℓ acting freely on Y′ over Y (K × Y′ → Y′ ×_Y
Y′ an injection). Then f/K : Y′/K → Y is separated, representable in locally spatial diamonds and
ℓ-cohomologically smooth, and for Λ ℓ-power torsion and the normalised Haar measure there is a
natural equivalence Rf^! ≃ q^*R(f/K)^! of functors D_ét(Y, Λ) → D_ét(Y′, Λ), q : Y′ → Y′/K the
quotient. The coefficient hypothesis 'Λ ℓ-power torsion' is missing in print
(PAPER-SCHOLZE-17/E100). Rq^! itself is not q^* (S5/profinite-quotient-upper-shriek).

**Hypotheses.**

- f smooth; K of pro-order prime to ℓ acting freely over Y; Λ ℓ-power torsion (added).

**Construction and proof.**

1. Reduce to Y = X strictly totally disconnected: Y′/K is locally spatial and quasiseparated
(D0/spectral-quotient-criterion, ECD 2.10; D3/locally-profinite-torsors, ECD 10.13), separated by
the valuative criterion, with canonical compactification (Y′)‾^{/Y}/K, the inclusion being open
because (Y′)‾ → (Y′)‾/K is a quotient map; locally dim.trg f/K = dim.trg f.
2. The transformation q^*R(f/K)^! → Rq^!R(f/K)^! = Rf^! (S5/averaging-transformation,
S3/upper-shriek-composition) is an equivalence for F_ℓ: check locally on Y′ (spatial), test against
constructible F (C9/finite-field-compact-objects, ECD 20.10), descend F to F_H on Y′/H (C7, ECD
20.7), and compute Hom(F, q^*R(f/K)^!A) as colim_{H′} Hom(R(f/H′)_!F_{H′}, A).
3. The system R(f/H′)_!F_{H′} has split injective transition maps (normalised traces) and colimit
Rf_!F, which is compact; hence it is eventually constant and equal to Rf_!F, giving Hom(F,
q^*R(f/K)^!A) = Hom(F, Rf^!A).
4. Then f/K satisfies criterion (iii) of S4/strictly-local-criteria and R(f/K)^!F_ℓ is invertible,
so f/K is ℓ-cohomologically smooth.

Proposed declaration: `IsCohomologicallySmooth.quotient_free` (module `TauCeti/Diamond/SixOperations/SmoothExamples`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** T_{C_p}^♢ = T̃_{C_p}^♢/ℤ_p for the compatible-root torus T̃ (used in
S5/analytic-smooth-is-cohomologically-smooth); a pro-ℓ group is excluded.

**Depends on** within this roadmap `S5/averaging-transformation`, `S5/normalized-haar-measure`,
`S4/strictly-local-criteria`, `S4/cohomologically-smooth`, `S3/upper-shriek-composition`; elsewhere
`DiamondEtaleCohomology:C9/finite-field-compact-objects`,
`DiamondsAndVStacks:D0/spectral-quotient-criterion`,
`DiamondsAndVStacks:D3/locally-profinite-torsors`, `DiamondEtaleCohomology:C7`,
`DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S5/profinite-quotient-upper-shriek`, `S5/nonfree-quotient-smooth`,
`S5/analytic-smooth-is-cohomologically-smooth`, `S5/spd-qp-smooth`.

**Source.** ECD Proposition 24.2, p. 153: “Then the quotient map f /K : Y ′ /K → Y is separated,
representable in locally spatial diamonds, and ℓ-cohomologically smooth.”; ECD proof of Proposition
24.2, p. 154: “The map to the direct limit factors over some term in the direct limit by compactness
of Rf! F.”

### `S5/profinite-quotient-upper-shriek` — Rq^! for a profinite quotient is a sheaf of distributions, not q^*


In the situation of S5/free-quotient-smooth one also has Rf^! = Rq^!R(f/K)^!, but Rq^! ≠ q^* in
general. After base change q becomes S × Spa(C, O_C) → Spa(C, O_C) for a profinite set S and
algebraically closed C, and then Rq^!Λ is the sheaf on S sending an open and closed T ⊂ S to the
distributions Hom_Λ(C⁰(T, Λ), Λ); for S infinite this is not q^*Λ = C⁰-valued constants. A choice of
Haar measure gives a natural map q^* → Rq^! (S5/averaging-transformation), which is not an
isomorphism. Statements must therefore be made after composing with the quotient's structure map, as
in S5/free-quotient-smooth.

**Hypotheses.**

- S profinite, C algebraically closed; Λ with nΛ = 0, n prime to p.

**Construction and proof.**

1. Rf^! = Rq^!R(f/K)^! is S3/upper-shriek-composition for f = (f/K) ∘ q (q is eligible: proper
quasi-pro-étale, dim.trg 0).
2. For q : S × Spa(C, O_C) → Spa(C, O_C) and T ⊂ S open and closed with inclusion i_T: Hom(Λ_T,
Rq^!Λ) = Hom(Rq_!Λ_T, Λ) = Hom(C⁰(T, Λ), Λ), using Rq_! = Rq_* and
S4/profinite-projection-pushforward.
3. For S infinite the module of distributions is not C⁰(T, Λ)-valued constants, so Rq^!Λ ≇ q^*Λ.

Proposed declaration: `profiniteProjection_upperShriek_distributions` (module `TauCeti/Diamond/SixOperations/SmoothExamples`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For S finite of size m, Rq^!Λ = Λ^S = q^*Λ (finite étale); for S = ℤ_p the
distributions are Hom(C⁰(ℤ_p, Λ), Λ), which is not C⁰(ℤ_p, Λ).

**Depends on** within this roadmap `S3/upper-shriek-composition`,
`S4/profinite-projection-pushforward`, `S3/upper-shriek`, `S5/free-quotient-smooth`,
`S1/factorisation-independence`.

**Source.** ECD Remark after Proposition 24.2, p. 153: “However, it is not true that Rq ! = q ∗ .”;
ECD Remark after Proposition 24.2, p. 153: “In this case, Rq ! Λ can be identified with the sheaf
sending any open and closed subset T ⊂ S to the distributions Hom(C 0 (T, Λ), Λ), as follows easily
from the adjunction defining Rq ! .”

### `S5/nonfree-quotient-smooth` — Quotients by non-free profinite actions with smooth fibres ★


Let f : Y′ → Y be separated, representable in locally spatial diamonds and ℓ-cohomologically smooth,
K a profinite group of pro-order prime to ℓ acting on Y′ over Y with K × Y′ → Y′ ×_Y Y′ 0-truncated
and qcqs, and Y′/K the quotient by the image equivalence relation. Then f/K : Y′/K → Y is separated
and representable in locally spatial diamonds. If moreover for every complete algebraically closed C
with open bounded valuation subring C⁺ and every Spa(C, C⁺) → Y the pullback Y′/K ×_Y Spa(C, C⁺) →
Spa(C, C⁺) is ℓ-cohomologically smooth, then f/K is ℓ-cohomologically smooth and, for Λ ℓ-power
torsion (PAPER-SCHOLZE-17/E100) and the normalised Haar measure, Rf^! ≃ q^*R(f/K)^!.

**Hypotheses.**

- As in S5/free-quotient-smooth but the action only 0-truncated and qcqs; fibrewise smoothness of
  the quotient over geometric points is a hypothesis.

**Construction and proof.**

1. As in S5/free-quotient-smooth, Y′/K → Y is compactifiable, representable in locally spatial
diamonds with locally dim.trg f/K = dim.trg f.
2. The averaging transformation α_q (S5/averaging-transformation) from integration over the
K-action.
3. Check S4/practical-smoothness-criterion with Y = X strictly totally disconnected, Y′
quasicompact: (i) clear; (ii) for constructible F on Y′/K, F → q_*q^*F = Rq_!q^*F → Rq_!Rq^!F → F is
the identity, so R(f/K)_!F is a direct summand of the constructible Rf_!q^*F; (iii) is the fibrewise
hypothesis.
4. Then R(f/K)^! commutes with quasi-pro-étale base change (S4/strictly-local-criteria), so
q^*R(f/K)^! → Rf^! can be checked on geometric fibres, where it holds by hypothesis; this gives
(iv).

Proposed declaration: `IsCohomologicallySmooth.quotient_nonfree` (module `TauCeti/Diamond/SixOperations/SmoothExamples`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** T_Y for Y over Spa ℤ_p^cycl is the quotient of the compatible-root torus T̃_Y by a
nonfree ℤ_p-action (S5/analytic-smooth-is-cohomologically-smooth).

**Depends on** within this roadmap `S5/averaging-transformation`,
`S4/practical-smoothness-criterion`, `S4/strictly-local-criteria`, `S4/cohomologically-smooth`,
`S5/free-quotient-smooth`; elsewhere `DiamondEtaleCohomology:C7`.

**Used in this roadmap by** `S5/analytic-smooth-is-cohomologically-smooth`.

**Source.** ECD Proposition 24.3, p. 155: “Assume that there is a profinite group K of pro-order
prime to ℓ with an action K × Y ′ → Y ′ over Y for which the map K × Y ′ → Y ′ ×Y Y ′ is 0-truncated
and qcqs.”; ECD proof of Proposition 24.3, p. 156: “This implies that R(f /K)! F is a direct summand
of Rf! q ∗ F = R(f /K)! Rq! q ∗ F, which is thus constructible.”

### `S5/analytic-smooth-is-cohomologically-smooth` — Smooth morphisms of analytic adic spaces are ℓ-cohomologically smooth ★


Let f : Y′ → Y be a separated smooth morphism of analytic adic spaces over Spa ℤ_p, smooth meaning
locally on Y′ an étale map Y′ → Bⁿ_Y followed by the projection Bⁿ_Y → Y
(AdicEtaleGeometry:A2/smooth-morphism-ball-charts; Bⁿ_Y = Spa(A⟨T₁, …, Tₙ⟩, A⁺⟨T₁, …, Tₙ⟩) over
affinoid Y = Spa(A, A⁺)). Then f^♢ : (Y′)^♢ → Y^♢ is ℓ-cohomologically smooth for every ℓ ≠ p.

**Hypotheses.**

- f separated, locally étale over relative balls (A2); Y, Y′ analytic over Spa ℤ_p; ℓ ≠ p.

**Construction and proof.**

1. f^♢ is representable in locally spatial diamonds (D6/etale-site-comparison, ECD 15.6) and
compactifiable by S0/compactifiable-local-on-source and S0/separated-etale-compactifiable (ECD
22.3).
2. By S4/smooth-composition and S4/etale-maps-smooth reduce to Bⁿ_Y → Y, by induction to n = 1, and,
covering B_Y by the two tori T_Y = {|T| = 1} and {|T − 1| = 1} (A2/relative-torus), to T_Y → Y.
3. Characteristic p: T_Y^♢ is an open subspace of B × Y^♢; S5/ball-smooth and
S4/smooth-stable-under-base-change.
4. Over ℚ_p (after base change to C_p, S4/smooth-v-local-on-target): the compatible-root torus
T̃_{C_p} = Spa C_p⟨T^{±1/p^∞}⟩ (P1) is a ℤ_p-torsor over T_{C_p}, so T_{C_p}^♢ = T̃_{C_p}^♢/ℤ_p with
T̃^♢ open in a ball over (Spa C_p)^♢; apply S5/free-quotient-smooth (ℤ_p has pro-order prime to ℓ).
5. Mixed characteristic: v-locally Y lives over Spa ℤ_p^cycl; then T_Y is the quotient of T̃_Y by a
nonfree ℤ_p-action whose geometric fibres were just shown smooth; apply S5/nonfree-quotient-smooth
and descend along the v-cover (S4/smooth-v-local-on-target, dim.trg being finite for smooth adic
maps, C8/analytic-dimension-bound).

Proposed declaration: `IsCohomologicallySmooth.of_adic_smooth` (module `TauCeti/Diamond/SixOperations/SmoothExamples`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Smooth rigid curves over C and their open subsets are ℓ-cohomologically smooth over
Spa(C, O_C); this is the input of S6/biduality.

**Depends on** within this roadmap `S5/ball-smooth`, `S5/free-quotient-smooth`,
`S5/nonfree-quotient-smooth`, `S4/smooth-composition`, `S4/etale-maps-smooth`,
`S4/smooth-stable-under-base-change`, `S4/smooth-v-local-on-target`,
`S0/compactifiable-local-on-source`, `S0/separated-etale-compactifiable`; elsewhere
`AdicEtaleGeometry:A2/smooth-morphism-ball-charts`, `AdicEtaleGeometry:A2/relative-torus`,
`AdicEtaleGeometry:A2/relative-closed-polydisc`, `DiamondsAndVStacks:D6/etale-site-comparison`,
`DiamondsAndVStacks:D3/locally-profinite-torsors`,
`DiamondEtaleCohomology:C8/analytic-dimension-bound`, `PerfectoidSpaces:P1`.

**Used in this roadmap by** `S6/biduality`.

**Source.** ECD Proposition 24.4, p. 156: “Then f ♢ : (Y ′ )♢ → Y ♢ is ℓ-cohomologically smooth.”;
ECD proof of Proposition 24.4, p. 156: “By Proposition 23.13, it suffices to check that BnY → Y is
ℓ-cohomologically smooth.”; ECD proof of Proposition 24.4, p. 156: “The result follows from
Proposition 24.3, as we have already verified”

### `S5/spd-qp-smooth` — (Spa ℚ_p)^♢ → * is ℓ-cohomologically smooth ★


For every prime ℓ ≠ p, the map (Spa ℚ_p)^♢ → * is ℓ-cohomologically smooth.

**Hypotheses.**

- ℓ ≠ p.

**Construction and proof.**

1. Let K_∞ be the cyclotomic ℤ_p-extension of ℚ_p; K_∞^♭ ≅ F_p((t^{1/p^∞}))^∧ (P1), and (Spa ℚ_p)^♢
= Spa F_p((t^{1/p^∞}))/ℤ_p (D6/spd-is-a-spatial-diamond with the Galois tower).
2. After pullback along the v-cover Spa(C, O_C) → * (C algebraically closed of characteristic p),
(Spa ℚ_p)^♢ × Spa(C, O_C) = D^×_C/ℤ_p with D^×_C the punctured open unit disc, an open subset of B ×
Spa(C, O_C) (S5/perfectoid-ball).
3. D^×_C → Spa(C, O_C) is smooth (S5/ball-smooth, S4/etale-maps-smooth, S4/smooth-composition) and
ℤ_p acts freely with pro-order prime to ℓ, so S5/free-quotient-smooth applies.
4. Descend along the v-cover by S4/smooth-v-local-on-target, (Spa ℚ_p)^♢ → * having locally finite
dim.trg (dim.trg 1 on quasicompact opens).

Proposed declaration: `SpdQp.isCohomologicallySmooth` (module `TauCeti/Diamond/SixOperations/SmoothExamples`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Div¹ = (Spa Q̆_p)^♢/φ^ℤ consumers (RelativeFarguesFontaine RF2) use this together
with étale quotients.

**Depends on** within this roadmap `S5/ball-smooth`, `S5/free-quotient-smooth`,
`S5/perfectoid-ball`, `S4/etale-maps-smooth`, `S4/smooth-composition`,
`S4/smooth-v-local-on-target`; elsewhere `DiamondsAndVStacks:D6/spd-is-a-spatial-diamond`,
`PerfectoidSpaces:P1`.

**Source.** ECD Proposition 24.5, p. 156: “The map (Spa Qp )♢ → ∗ is ℓ-cohomologically smooth.”; ECD
proof of Proposition 24.5, p. 157: “Using Proposition 24.2, this shows that (Spa Qp )♢ × Spa(C, OC )
→ Spa(C, OC ) is ℓ-cohomologically smooth, and thus also (Spa Qp )♢ → ∗.”

### `S5/geometric-base-criterion` — A smoothness criterion over a general perfectoid base


Let X be a perfectoid space, Y a locally spatial diamond and f : Y → X compactifiable with locally
dim.trg f < ∞. Then f is ℓ-cohomologically smooth iff (i) Rf^!F_ℓ is invertible, i.e. étale locally
≅ F_ℓ[d], and (ii) for every X̃ → X that is an open subset of a finite-dimensional ball Bⁿ_X, with
pullback f̃ : Ỹ → X̃, the transformation τ_{f̃} : Rf̃^!F_ℓ ⊗ f̃^* → Rf̃^! is an equivalence.

**Hypotheses.**

- X perfectoid; Y locally spatial; f compactifiable, locally dim.trg f < ∞.

**Construction and proof.**

1. Necessity: S4/smooth-twisted-pullback and S4/smooth-stable-under-base-change.
2. Sufficiency: reduce to X affinoid perfectoid and Y spatial. For X̃ ⊂ Bⁿ_X open, g : Ỹ → Y is
smooth (S5/ball-smooth, base change and S4/etale-maps-smooth), so g^*Rf^!F_ℓ ≃ Rf̃^!F_ℓ by
S4/smooth-upper-shriek-exchange (with f eligible), and Rf̃^!F_ℓ is invertible.
3. For X′ strictly totally disconnected over X, write X′ = lim X̃ᵢ with X̃ᵢ affinoid open subsets of
finite-dimensional balls over X; it suffices to check h^*Rf^!F_ℓ ⊗ f′^* → Rf′^! on quasicompact
separated étale V′ → Y′, which come from a finite stage (D5/limits-and-finite-stage-comparisons, ECD
11.23(iii)); reduce to global sections and apply Rh_*.
4. Rh_*Rf′^! = Rf^!Rg_* (S3/upper-shriek-pushforward-exchange) = Rf^!F_ℓ ⊗ f^*Rg_* (condition (ii))
= Rf^!F_ℓ ⊗ Rh_*f′^* (C3, 17.6) = Rh_*(h^*Rf^!F_ℓ ⊗ f′^*) (projection formula for the invertible
Rf^!F_ℓ).

Proposed declaration: `isCohomologicallySmooth_iff_geometricBase` (module `TauCeti/Diamond/SixOperations/SmoothExamples`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For Y = B × X both conditions hold with d = 2.

**Depends on** within this roadmap `S5/ball-smooth`, `S4/smooth-twisted-pullback`,
`S4/smooth-stable-under-base-change`, `S4/smooth-upper-shriek-exchange`, `S4/etale-maps-smooth`,
`S3/upper-shriek-pushforward-exchange`, `S4/cohomologically-smooth`; elsewhere
`DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons`, `DiamondEtaleCohomology:C3`.

**Source.** ECD Proposition 24.6, p. 157: “Then f is ℓ-cohomologically smooth if and only if the
following conditions are satisfied.”; ECD proof of Proposition 24.6, p. 158: “using Proposition
23.16 (i) in the first equation, condition (ii) in the second equation, Proposi- tion 17.6 in the
third equation, and a simple projection formula for Rh∗”

## S6. Biduality and conservativity

Over Spa(C, O_C), bounded constructible F_ℓ-complexes on separated ℓ-cohomologically smooth X are
reflexive for naive and Verdier duality, and quasicompact X have finite cohomology (25.1); the proof
reduces to j_!F_ℓ, to a quasicompact open of the ball and then to a proper smooth curve, using
ClassicalAdicEtaleCohomology H5's compactification and boundary reduction. Over Spa(C, C⁺) with C⁺ ≠
O_C biduality fails (25.2), so that hypothesis stays in the theorem. Perfect-constructible complexes
with ℓ-power-torsion coefficients are reflexive with perfect global sections, a complex of
coefficient-ring modules (25.3). Verdier duality is conservative in the compactifiable
finite-dimensional setting (25.4), fails over Spa(C, C⁺) (25.5), and extends to general Λ only under
a ring-theoretic hypothesis (25.6).

Planets of this layer: Biduality over Spa(C, O_C) (`S6/biduality`); Failure of biduality over Spa(C,
C⁺) (`S6/biduality-counterexample`); Conservativity of Verdier duality
(`S6/verdier-conservativity`).

Other roadmaps' stages used (requested): `DiamondEtaleCohomology:C0`, `DiamondEtaleCohomology:C2`,
`DiamondEtaleCohomology:C3`, `DiamondEtaleCohomology:C4`, `DiamondEtaleCohomology:C5`,
`DiamondEtaleCohomology:C7`.

Other roadmaps' declarations and nodes used:
`ClassicalAdicEtaleCohomology:H5/curve-boundary-contributions`,
`ClassicalAdicEtaleCohomology:H5/curve-boundary-direct-summand`,
`ClassicalAdicEtaleCohomology:H5/curve-compactification-duality`,
`ClassicalAdicEtaleCohomology:H5/geometric-curve-compactification-export`,
`DiamondEtaleCohomology:C9/compact-iff-perfect-constructible`,
`DiamondEtaleCohomology:C9/global-sections-coproducts`,
`DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`,
`DiamondsAndVStacks:D5/universally-open-presentation`, `mathlib:JacobsonSpace`,
`mathlib:JacobsonSpace.of_isOpenEmbedding`, `mathlib:nonempty_inter_closedPoints`.

Acceptance tests of the layer: j_!F_ℓ for a closed subdisc of the ball over Spa(C, O_C) (reflexive);
the counterexamples of Remarks 25.2 and 25.5 over Spa(C, C⁺); ℤ/ℓ^m-coefficients.

### `S6/verdier-dual` — The Verdier dual and the naive dual over a geometric point


Let C be a complete algebraically closed nonarchimedean field of characteristic p, f : X → Spa(C,
O_C) an eligible map from a locally spatial diamond, and Λ with nΛ = 0 (n prime to p). The Verdier
dual is 𝔻_X := RHom_Λ(−, Rf^!Λ) : D_ét(X, Λ)^op → D_ét(X, Λ) and the naive dual is RHom_Λ(−, Λ). The
biduality maps A → 𝔻_X𝔻_X A and A → RHom(RHom(A, Λ), Λ) are the evaluation maps. When f is
ℓ-cohomologically smooth and Λ is ℓ-power torsion, Rf^!Λ is invertible (S4/dualizing-complex), so
𝔻_X = RHom(−, Λ) ⊗ Rf^!Λ and the two biduality maps correspond. On Spa(C, O_C) itself D_ét = D(Λ)
and 𝔻 is the linear dual.

**Hypotheses.**

- f eligible from a locally spatial diamond to Spa(C, O_C); for the comparison of the two duals f is
  ℓ-cohomologically smooth and Λ ℓ-power torsion.

**Construction and proof.**

1. Define both duals from C3's internal Hom and S3/upper-shriek's Rf^!Λ; the biduality maps are the
unit of the tensor–Hom adjunction applied to evaluation.
2. For invertible D = Rf^!Λ: RHom(A, D) = RHom(A, Λ) ⊗ D and RHom(RHom(A, D), D) = RHom(RHom(A, Λ),
Λ) (S4/invertible-object), compatibly with evaluation.
3. Verdier duality S3/verdier-duality-lower-shriek gives RΓ(X, 𝔻_X A) = RHom(RΓ_c(X, A), Λ) for X →
Spa(C, O_C).

Proposed declarations: `verdierDual`, `naiveDual` (module `TauCeti/Diamond/SixOperations/Biduality`, namespace `TauCeti.DiamondSixOperations`).

**API.**

| Name | Role | Statement |
|---|---|---|
| `verdierDual_apply` | characterisation | 𝔻_X A = RHom(A, Rf^!Λ). |
| `verdierDual_const` | simp | 𝔻_X Λ = Rf^!Λ. |
| `verdierDual_eq_naive_tensor` | compatibility | For f smooth and Λ ℓ-power torsion, 𝔻_X A ≅ RHom(A, Λ) ⊗ D_f. |
| `bidualityMap` | data | The evaluation map A → 𝔻_X𝔻_X A. |
| `verdierDual_globalSections` | relation | RΓ(X, 𝔻_X A) ≅ RHom(RΓ_c(X, A), Λ). |
| `verdierDual_extendByZero` | relation | For j : U → X a quasicompact open, 𝔻_X(j_!B) ≅ Rj_*𝔻_U(B) and RHom(j_!Λ, Λ) = Rj_*Λ. |
| `verdierDual_pullback_smooth` | functoriality | For g : X′ → X smooth, g^*𝔻_X ≅ D_g^{−1} ⊗ 𝔻_{X′}g^* (S4/smooth-pullback-internal-hom and S4/smooth-upper-shriek-base-change). |

**Used by.**

- ECD Theorem 25.1 and Remarks 25.2–25.3: biduality A ≃ 𝔻𝔻A for bounded constructible or
  perfect-constructible A.
- ECD Proposition 25.4 and Remarks 25.5–25.6: conservativity of 𝔻.
- VStackSheavesAndLisseCategories:VS5 (FS V.6): Verdier biduality on Bun_G is compared stratumwise
  with this one; it is a separate result.

**Unit tests.**

- `verdierDual_point` (degenerate): For X = Spa(C, O_C), 𝔻 is the linear dual RHom_Λ(−, Λ) on D(Λ).
- `verdierDual_ball` (computation): For the ball over Spa(C, O_C), 𝔻(Λ) ≅ Λ(1)[2].
- `naiveDual_extendByZero_valuedPlus` (non-example): Over Spa(C, C⁺) with C⁺ ≠ O_C and j : Spa(C,
  O_C) → Spa(C, C⁺), RHom(j_!F_ℓ, F_ℓ) = Rj_*F_ℓ = F_ℓ, so the naive double dual of j_!F_ℓ is F_ℓ ≠
  j_!F_ℓ (S6/biduality-counterexample).
- `verdierDual_contravariant` (characterisation): 𝔻 is an exact contravariant functor: 𝔻(A[1]) =
  (𝔻A)[−1].

**Acceptance.** 𝔻 of Λ_X is Rf^!Λ; on the ball over Spa(C, O_C), 𝔻(Λ) = Λ(1)[2].

**Depends on** within this roadmap `S3/upper-shriek`, `S4/dualizing-complex`,
`S4/invertible-object`, `S3/verdier-duality-lower-shriek`; elsewhere `DiamondEtaleCohomology:C3`.

**Used in this roadmap by** `S6/biduality`, `S6/biduality-counterexample`,
`S6/verdier-conservativity`.

**Source.** ECD Theorem 25.1, p. 158: “is an equivalence; equivalently, as Rf ! Fℓ is invertible,
the double Verdier duality map”; ECD Proposition 25.4, p. 161: “Assume that A ∈ Dét (X, Fℓ )
satisfies RH omFℓ (A, Rf ! Fℓ ) = 0. Then”

### `S6/biduality` — Biduality for ℓ-cohomologically smooth diamonds over Spa(C, O_C) ★


Let C be a complete algebraically closed nonarchimedean field of characteristic p with ring of
integers O_C, X a locally spatial diamond, separated and ℓ-cohomologically smooth over Spa(C, O_C)
for some ℓ ≠ p, and A ∈ D_ét(X, F_ℓ) bounded with constructible cohomology. Then the naive biduality
map A → RHom_{F_ℓ}(RHom_{F_ℓ}(A, F_ℓ), F_ℓ) is an equivalence; equivalently (Rf^!F_ℓ being
invertible) the Verdier biduality map A → 𝔻_X𝔻_X A is. The base is Spa(C, O_C); over Spa(C, C⁺) with
C⁺ ≠ O_C the statement is false (S6/biduality-counterexample).

**Hypotheses.**

- C complete algebraically closed of characteristic p; base Spa(C, O_C) (C⁺ = O_C is essential).
- X separated, locally spatial, ℓ-cohomologically smooth over Spa(C, O_C); A bounded with
  constructible cohomology sheaves.
- The curve compactification input (H5/geometric-curve-compactification-export, local form (L)) is
  used with the scope recorded by its owner.

**Construction and proof.**

1. Reduce to X spatial and A in degree 0; by C7 (ECD 20.8) A is filtered by j_!L with j : U → X
quasicompact separated étale and L a local system; étale localisation makes j an open immersion and
L constant (C7, ECD 20.7, on strict localisations, whose quasicompact opens are strictly local).
2. For A = j_!F_ℓ, RHom(j_!F_ℓ, F_ℓ) = Rj_*F_ℓ, and it suffices that j_!M → RHom(Rj_*F_ℓ, M) is an
equivalence for every M ∈ D(F_ℓ).
3. Choose a quasi-pro-étale surjection X̃ = lim X̃ᵢ → X from a strictly totally disconnected space
(D5/universally-open-presentation, ECD 11.24); Ũ = {|f| ≤ |ϖ|} for some f ∈ H⁰(X̃, O⁺) (ECD Lemma
7.6, D1); by continuity of H⁰(−, O⁺/ϖ) (C0, ECD 14.9; O⁺/ϖ étale by C2, ECD 14.12) descend f to f ∈
H⁰(X, O⁺/ϖ) with U = {f = 0}.
4. Let Y = {f − T = 0} ⊂ X × B_C (B_C the perfectoid ball over Spa(C, O_C)); Y → X is smooth
surjective (open in a pullback of the ball, S5/ball-smooth, S4/etale-maps-smooth) and Y → B_C is
smooth; using S4/smooth-pullback-internal-hom and smooth base change (S4/smooth-base-change) replace
j : U → X by {T = 0} ⊂ B_C.
5. Now X is a quasicompact smooth rigid curve over C, smooth over Spa(C, O_C) by
S5/analytic-smooth-is-cohomologically-smooth; it suffices to prove RΓ(X, j_!M) ≃ RHom(Rj_*F_ℓ, M).
The cone of α_X is supported on the finite frontier of U (H5/curve-boundary-contributions) and is a
direct summand of the cone for a proper smooth curve X′ ⊃ neighbourhoods
(H5/curve-boundary-direct-summand, H5/geometric-curve-compactification-export (L)).
6. For X′ proper: with M = Rf^!M′, RHom(Rj_*F_ℓ, M) = RHom(RΓ(U, F_ℓ), M′) and RΓ(X′, j_!M) =
RΓ_c(U, Rf^!M′) (S3/verdier-duality-lower-shriek); both commute with colimits in M because RΓ_c(U,
Rf^!F_ℓ) and RΓ(U, F_ℓ) are finite (S4/practical-smoothness-criterion (ii)), so M = F_ℓ; Poincaré
duality on U (Verdier duality with the invertible Rf^!F_ℓ, S4/dualizing-complex) dualises in
finite-dimensional vector spaces, and the identification of the maps is
H5/curve-compactification-duality (the check ECD leaves to the reader, PAPER-SCHOLZE-17/E72).

Proposed declaration: `biduality` (module `TauCeti/Diamond/SixOperations/Biduality`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For X = B × Spa(C, O_C) and A = j_!F_ℓ with U the closed subdisc of radius |ϖ|, the
double dual of j_!F_ℓ is j_!F_ℓ.

**Depends on** within this roadmap `S6/verdier-dual`, `S4/cohomologically-smooth`,
`S4/dualizing-complex`, `S4/smooth-pullback-internal-hom`, `S4/smooth-base-change`,
`S4/etale-maps-smooth`, `S4/practical-smoothness-criterion`, `S3/verdier-duality-lower-shriek`,
`S5/ball-smooth`, `S5/analytic-smooth-is-cohomologically-smooth`; elsewhere
`ClassicalAdicEtaleCohomology:H5/curve-boundary-contributions`,
`ClassicalAdicEtaleCohomology:H5/curve-boundary-direct-summand`,
`ClassicalAdicEtaleCohomology:H5/geometric-curve-compactification-export`,
`ClassicalAdicEtaleCohomology:H5/curve-compactification-duality`,
`DiamondsAndVStacks:D5/universally-open-presentation`,
`DiamondsAndVStacks:D1/pro-constructible-generalizing-subsets-are-affinoid`,
`DiamondEtaleCohomology:C0`, `DiamondEtaleCohomology:C2`, `DiamondEtaleCohomology:C7`.

**Used in this roadmap by** `S6/finiteness-of-cohomology`, `S6/biduality-torsion-coefficients`.

**Source.** ECD Theorem 25.1, p. 158: “Let A ∈ Dét (X, Fℓ ) be a bounded complex with constructible
cohomology. Then the double (naive) duality map”; ECD proof of Theorem 25.1, p. 159: “We are reduced
to the case A = j! Fℓ for a quasicompact open immersion j : U → X.”; ECD proof of Theorem 25.1, p.
160: “Thus, it is enough to prove that the latter is trivial. In other words, we may assume that X
is proper.”

### `S6/finiteness-of-cohomology` — Finiteness of cohomology of smooth diamonds over Spa(C, O_C)


In the situation of S6/biduality, if X is quasicompact then Hⁱ(X, A) is a finite-dimensional
F_ℓ-vector space for every i ∈ ℤ and every bounded A with constructible cohomology.

**Hypotheses.**

- As in S6/biduality, X quasicompact.

**Construction and proof.**

1. Reduce as in S6/biduality to A = j_!F_ℓ, and étale localise so that Rf^!F_ℓ = F_ℓ[d].
2. RΓ(X, j_!M) = RHom(Rj_*F_ℓ, M) (the claim proved in S6/biduality) = RHom_{D(F_ℓ)}(Rf_!Rj_*F_ℓ,
M)[−d].
3. The left side commutes with all colimits in M (C9/global-sections-coproducts, ECD 20.10), so
Rf_!Rj_*F_ℓ ∈ D(F_ℓ) is compact, i.e. bounded with finite cohomology; take M = F_ℓ.

Proposed declaration: `finite_cohomology_of_smooth` (module `TauCeti/Diamond/SixOperations/Biduality`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** H⁰(B × Spa(C, O_C), F_ℓ) = F_ℓ and the higher groups vanish; for the closed annulus
H¹ = F_ℓ(−1).

**Depends on** within this roadmap `S6/biduality`, `S2/lower-shriek`; elsewhere
`DiamondEtaleCohomology:C9/global-sections-coproducts`.

**Used in this roadmap by** `S6/biduality-torsion-coefficients`.

**Source.** ECD Theorem 25.1, p. 158: “Moreover, if X is quasicompact, then H i (X, A) is finite for
all i ∈ Z.”; ECD proof of Theorem 25.1, p. 159: “As the left-hand side commutes with all colimits by
Proposition 20.10, it follows that Rf! Rj∗ Fℓ ∈ D(Fℓ ) is compact, i.e. bounded with finite
cohomology groups.”

### `S6/biduality-counterexample` — Biduality fails over Spa(C, C⁺) with C⁺ ≠ O_C ★


Let C be complete algebraically closed, C⁺ ⊊ O_C an open bounded valuation subring, X = Spa(C, C⁺)
and j : U = Spa(C, O_C) → X the open immersion (the generic point). Then for A = j_!F_ℓ,
RHom_{F_ℓ}(j_!F_ℓ, F_ℓ) = Rj_*F_ℓ = j_*F_ℓ = F_ℓ, so the double dual of A is F_ℓ ≠ j_!F_ℓ. Hence the
hypothesis C⁺ = O_C in S6/biduality is essential, even for X → Spa(C, C⁺) the identity, which is
ℓ-cohomologically smooth.

**Hypotheses.**

- C⁺ ⊊ O_C.

**Construction and proof.**

1. RHom(j_!F_ℓ, F_ℓ) = Rj_*RHom(F_ℓ, j^*F_ℓ) = Rj_*F_ℓ (C5 adjunction j_! ⊣ j^*).
2. X is strictly local and U is the generic point; Rj_*F_ℓ = j_*F_ℓ = F_ℓ (étale cohomology of
Spa(C, O_C) vanishes in positive degrees and j_*F_ℓ is constant since every open neighbourhood of
the closed point is X).
3. So the double dual is RHom(F_ℓ, F_ℓ) = F_ℓ, whose stalk at the closed point is F_ℓ while that of
j_!F_ℓ is 0.

Proposed declaration: `not_biduality_valuedPlus` (module `TauCeti/Diamond/SixOperations/Biduality`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Exactly the open immersion of S0's test IsCompactifiable.generic_point_inclusion;
its canonical compactification is X.

**Depends on** within this roadmap `S6/verdier-dual`, `S4/etale-maps-smooth`; elsewhere
`DiamondEtaleCohomology:C5`, `DiamondEtaleCohomology:C2`.

**Used in this roadmap by** `S6/conservativity-counterexample`.

**Source.** ECD Remark 25.2, p. 158: “This theorem does not hold if one replaces Spa(C, OC ) by
Spa(C, C + ) for C + ̸= OC , even in the simplest case X = Spa(C, C + ).”; ECD Remark 25.2, p. 158:
“and so the double dual is also equal to Fℓ , which is different from A = j! Fℓ .”

### `S6/biduality-torsion-coefficients` — Biduality and perfectness for ℓ-power-torsion coefficients


In the situation of S6/biduality let Λ be an ℓ-power-torsion ring and A ∈ D_ét(X, Λ)
perfect-constructible. Then the biduality map A → RHom_Λ(RHom_Λ(A, Λ), Λ) is an equivalence, and if
X is quasicompact, RΓ(X, A) is a perfect complex of Λ-modules (the printed 'A-modules' is
PAPER-SCHOLZE-17/E65).

**Hypotheses.**

- As in S6/biduality; Λ ℓ-power torsion (ℓ^mΛ = 0); A perfect-constructible (C7).

**Construction and proof.**

1. By C9/compact-iff-perfect-constructible (ECD 20.17) reduce to A = j_!Λ for quasicompact separated
étale j : U → X.
2. The theorem for j_!F_ℓ gives it for j_!ℤ/ℓ^m by the five lemma (filtration by F_ℓ), and then for
j_!Λ by extension of scalars.
3. For the biduality map (footnote 6): Rj_*Λ = Rj_*ℤ/ℓ^m ⊗^L_{ℤ/ℓ^m} Λ because j is qcqs of finite
cohomological dimension, so Rj_* commutes with colimits; hence RHom_Λ(RHom_Λ(j_!Λ, Λ), Λ) =
RHom_Λ(Rj_*Λ, Λ) = RHom_{ℤ/ℓ^m}(Rj_*ℤ/ℓ^m, Λ), and RHom_{ℤ/ℓ^m}(Rj_*ℤ/ℓ^m, Λ) = j_!Λ follows from
the proof of S6/biduality (the M-version, with M = Λ).
4. Perfectness: RΓ(X, j_!Λ) = RΓ(X, j_!ℤ/ℓ^m) ⊗^L Λ and RΓ(X, j_!ℤ/ℓ^m) is perfect over ℤ/ℓ^m
(finite cohomology over each F_ℓ-graded piece, S6/finiteness-of-cohomology, and finite
Tor-amplitude).

Proposed declarations: `biduality_ellTorsion`, `perfect_globalSections` (module `TauCeti/Diamond/SixOperations/Biduality`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** For Λ = ℤ/ℓ² and A = Λ on the ball over Spa(C, O_C), RΓ = Λ is perfect and A is its
own double dual.

**Depends on** within this roadmap `S6/biduality`, `S6/finiteness-of-cohomology`; elsewhere
`DiamondEtaleCohomology:C9/compact-iff-perfect-constructible`, `DiamondEtaleCohomology:C3`,
`DiamondEtaleCohomology:C7`.

**Source.** ECD Remark 25.3, p. 158: “The biduality theorem also holds true for a general
coefficient ring Λ of ℓ-power- torsion if A ∈ Dét (X, Λ) is perfect-constructible,”; ECD Remark
25.3, footnote 6, p. 158: “The last step requires explanation for the biduality statement.”

### `S6/closed-points-detect-vanishing` — Closed points detect vanishing on proper perfectoid spaces over Spa(C, O_C)


Let C be algebraically closed nonarchimedean of characteristic p, k its residue field, and X an
affinoid perfectoid space, proper over Spa(C, O_C) and compactifiable over it, whose connected
components are Spa(C′, C′⁺) with C′ complete algebraically closed and C′⁺ ⊂ O_{C′} open and
integrally closed. Then |X| is a Jacobson space (Mathlib JacobsonSpace: every nonempty locally
closed subset contains a point closed in |X|), and an object A ∈ D(|X|, F_ℓ) whose stalks vanish at
all closed points of |X| is zero.

**Hypotheses.**

- X as in the proof of ECD Proposition 25.4 (the compactification of a strictly totally disconnected
  cover).

**Construction and proof.**

1. Connected components of a spectral space are closed; a point closed in its component is closed in
|X|, and a nonempty locally closed subset of |X| meets some component in a nonempty locally closed
subset; so Jacobson-ness reduces to components.
2. Each component is open in the Zariski–Riemann space ZR(k′/k) of valuation rings of the residue
field k′ of C′ containing k (ECD, using compactifiability over Spa(C, O_C)); open subspaces of
Jacobson spaces are Jacobson (mathlib:JacobsonSpace.of_isOpenEmbedding).
3. ZR(k′/k) is Jacobson (k algebraically closed): a nonempty locally closed subset contains U₀ ∩ Z ∋
V₀ with U₀ = {V ⊇ A}, A a finitely generated k-subalgebra; a valuation ring W with A ⊆ W ⊆ V₀
minimal for these conditions (Zorn: intersections of chains of valuation rings are valuation rings)
has residue field algebraic over k, since otherwise a nontrivial valuation ring of κ(W) containing
the image of A (a finitely generated k-algebra, either a non-field or k itself) would give a smaller
one; so W is a closed point, W ∈ Z (specialisation of V₀) and W ∈ U₀.
4. For a sheaf F on a Jacobson space with Fₓ = 0 at closed points: the support of a nonzero section
over an open U is nonempty and closed in U, hence locally closed, so it contains a closed point
(mathlib:nonempty_inter_closedPoints), contradiction. Apply to the cohomology sheaves of A.

Proposed declaration: `closedPoints_detect_zero` (module `TauCeti/Diamond/SixOperations/Biduality`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** The lemma concerns all complexes, not only constructible ones: for j_!F with F ≠ 0
on a nonempty open U ⊂ |X|, U contains a point closed in |X| at which the stalk is nonzero, as the
lemma predicts.

**Depends on** elsewhere `mathlib:JacobsonSpace`, `mathlib:JacobsonSpace.of_isOpenEmbedding`,
`mathlib:nonempty_inter_closedPoints`, `DiamondEtaleCohomology:C4`, `DiamondEtaleCohomology:C5`,
`DiamondEtaleCohomology:C2`.

**Used in this roadmap by** `S6/verdier-conservativity`, `S6/conservativity-general-coefficients`.

**Source.** ECD proof of Proposition 25.4, p. 161: “In other words, the stalks of A at all closed
points vanish, which implies that A = 0, as the closed points are very dense in |X|.”; ECD proof of
Proposition 25.4, p. 161: “But Zariski–Riemann spaces of fields have a very dense set of closed
points (by writing them as a cofiltered limit of projective varieties).”

### `S6/verdier-conservativity` — Conservativity of Verdier duality over Spa(C, O_C) ★


Let C be an algebraically closed nonarchimedean field of characteristic p, X a locally spatial
diamond with f : X → Spa(C, O_C) compactifiable with locally dim.trg f < ∞, and A ∈ D_ét(X, F_ℓ)
with RHom_{F_ℓ}(A, Rf^!F_ℓ) = 0. Then A = 0. No smoothness or constructibility is assumed; the base
Spa(C, O_C) is essential (S6/conservativity-counterexample).

**Hypotheses.**

- f compactifiable (hence eligible with the dimension hypothesis); base Spa(C, O_C).

**Construction and proof.**

1. Assume X quasicompact; take g : X̃ → X quasi-pro-étale surjective from a strictly totally
disconnected space (D5/universally-open-presentation) and its compactification g‾ : X̃‾^{/X} → X,
proper with dim.trg 0, so Rg‾^! is defined (S0, S3).
2. 0 = Rg‾^!RHom(A, Rf^!F_ℓ) = RHom(g‾^*A, R(f ∘ g‾)^!F_ℓ) (S3/upper-shriek-internal-hom,
S3/upper-shriek-composition); it suffices that g‾^*A = 0, so replace X by X̃‾^{/X}.
3. Now X is affinoid perfectoid, compactifiable over Spa(C, O_C), with components Spa(C′, C′⁺) (C′⁺
open integrally closed in O_{C′}); D_ét(X, F_ℓ) = D(|X|, F_ℓ) (C0); replacing X by its
compactification over Spa(C, O_C) and A by its extension by zero, X is proper.
4. For every open U ⊂ X, RHom(RΓ_c(U, A), F_ℓ) = RΓ(U, RHom(A, Rf^!F_ℓ)) = 0
(S3/verdier-duality-lower-shriek), hence RΓ_c(U, A) = 0; with U = X and U = X ∖ {x}, x closed, the
stalk Aₓ is the cone, so Aₓ = 0 at closed points.
5. S6/closed-points-detect-vanishing gives A = 0.

Proposed declaration: `verdierDual_conservative` (module `TauCeti/Diamond/SixOperations/Biduality`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Combined with S6/biduality: for bounded constructible A, B on smooth X, a map
inducing an isomorphism on Verdier duals is an isomorphism.

**Depends on** within this roadmap `S6/verdier-dual`, `S6/closed-points-detect-vanishing`,
`S3/upper-shriek-internal-hom`, `S3/upper-shriek-composition`, `S3/verdier-duality-lower-shriek`,
`S0/eligible-morphism`; elsewhere `DiamondsAndVStacks:D5/universally-open-presentation`,
`DiamondEtaleCohomology:C0`, `DiamondEtaleCohomology:C4`.

**Used in this roadmap by** `S6/conservativity-counterexample`,
`S6/conservativity-general-coefficients`.

**Source.** ECD Proposition 25.4, p. 161: “Let C be an algebraically closed nonarchimedean field of
characteristic p with ring of integers OC , and let X be a locally spatial diamond with f : X →
Spa(C, OC ) compactifiable with locally dim. trg f < ∞.”; ECD proof of Proposition 25.4, p. 161:
“which implies that RΓc (U, A) = 0. Using this for U = X and U = X \ {x} for some closed point x ∈
X, one sees that also the cone of RΓc (U, A) → RΓc (X, A) = RΓ(X, A) is zero, which is the stalk Ax
of A at x.”

### `S6/conservativity-counterexample` — Conservativity fails over Spa(C, C⁺) with C⁺ ≠ O_C


Let X = Spa(C, C⁺) with C⁺ ⊊ O_C, i : {s} → |X| the inclusion of the closed point, and Λ with nΛ =
0. Then RHom_Λ(i_*Λ, Λ) = 0 although i_*Λ ≠ 0 (D_ét(X, Λ) = D(|X|, Λ), X being strictly totally
disconnected). Hence S6/verdier-conservativity fails over Spa(C, C⁺): f = id is ℓ-cohomologically
smooth with Rf^!Λ = Λ.

**Hypotheses.**

- C⁺ ⊊ O_C.

**Construction and proof.**

1. D_ét(X, Λ) = D(|X|, Λ) (C0); |X| is a chain of points with closed point s and generic point η,
and i_*Λ is the skyscraper at s.
2. Hom(i_*Λ, Λ[k]) = Hom(Λ, i^!Λ[k]) and i^!Λ = 0: the triangle i_*i^!Λ → Λ → Rj_*j^*Λ with Rj_*j^*Λ
= Λ (S6/biduality-counterexample, j the open complement of s) shows i^!Λ = 0.

Proposed declaration: `not_verdierDual_conservative_valuedPlus` (module `TauCeti/Diamond/SixOperations/Biduality`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** The same space and sheaves as in S6/biduality-counterexample: j_!Λ and i_*Λ are the
two halves of Λ.

**Depends on** within this roadmap `S6/verdier-conservativity`, `S6/biduality-counterexample`;
elsewhere `DiamondEtaleCohomology:C0`, `DiamondEtaleCohomology:C5`.

**Source.** ECD Remark 25.5, p. 161: “Again, a similar result fails over Spa(C, C + ) if C + ̸= OC
.”; ECD Remark 25.5, p. 161: “Indeed, if X = Spa(C, C + ) and i : {s} → X is the inclusion of the
closed point, then RH omΛ (i∗ Λ, Λ) = 0.”

### `S6/conservativity-general-coefficients` — Conditional conservativity for general coefficient rings


Let Λ be a ring killed by some n prime to p such that for every M ∈ D(Λ), RHom_Λ(M, Λ) = 0 implies M
= 0. Then S6/verdier-conservativity holds with Λ in place of F_ℓ: for f : X → Spa(C, O_C)
compactifiable with locally dim.trg f < ∞ and A ∈ D_ét(X, Λ), RHom_Λ(A, Rf^!Λ) = 0 implies A = 0.
This is a conditional statement, not an unconditional extension: the ring hypothesis fails for Λ =
O_K with K spherically complete and non-discretely valued and M = k its residue field (corrected
example, PAPER-SCHOLZE-17/E101; such O_K is not killed by any n, so it illustrates only the
ring-theoretic condition), and it is not known in which generality (for instance for noetherian Λ)
it holds.

**Hypotheses.**

- Λ killed by n prime to p, with the stated conservativity of RHom_Λ(−, Λ) on D(Λ) (a hypothesis).

**Construction and proof.**

1. Follow S6/verdier-conservativity with Λ: the reductions to X proper affinoid perfectoid over
Spa(C, O_C) use only Verdier duality and base change, valid for nΛ = 0.
2. RHom_Λ(RΓ_c(U, A), Λ) = RΓ(U, RHom(A, Rf^!Λ)) = 0 implies RΓ_c(U, A) = 0 by the ring hypothesis.
3. Stalks at closed points vanish; S6/closed-points-detect-vanishing (its last step works for any
coefficient ring) gives A = 0.

Proposed declaration: `verdierDual_conservative_of_ring` (module `TauCeti/Diamond/SixOperations/Biduality`, namespace `TauCeti.DiamondSixOperations`).

**Acceptance.** Λ = ℤ/ℓ^m satisfies the hypothesis (self-injective, so RHom(M, Λ) = Hom(H^{−∗}M, Λ)
and Λ is a cogenerator).

**Depends on** within this roadmap `S6/verdier-conservativity`, `S6/closed-points-detect-vanishing`,
`S3/verdier-duality-lower-shriek`.

**Source.** ECD Remark 25.6, p. 161: “A similar result holds with coefficients in a ring Λ (killed
by n prime to p) as soon as for any M ∈ D(Λ) with R HomΛ (M, Λ) = 0, one has M = 0.”; ECD Remark
25.6, p. 161: “We do not know in which generality it holds (for example if Λ is noetherian).”

## Requests to other roadmaps

- `DiamondEtaleCohomology:C0`: ECD Proposition 14.9 (continuity of D_ét-cohomology along cofiltered
  limits of spatial diamonds with qcqs transition maps, for bounded-below coefficients) and the
  identification D_ét(X, Λ) = D(|X|, Λ) for X strictly totally disconnected (ECD 14.10–14.11 with
  the v/étale comparison), as used in the proofs of ECD 22.7, 22.11, 23.6, 24.2 and 25.1. Needed by
  `S1/qcqs-diamond-continuity`, `S4/profinite-projection-pushforward`,
  `S5/averaging-transformation`, `S6/biduality`, `S6/conservativity-counterexample`,
  `S6/verdier-conservativity`.
- `DiamondEtaleCohomology:C2`: The enhanced presentable stable ∞-category D_ét(Y, Λ) of a small
  v-stack (ECD 14.13, Lemma 17.1), its left-completeness (Postnikov limits), the identification with
  the left-completed D(Y_ét, Λ) for locally spatial diamonds (14.15–14.16), testing on strictly
  totally disconnected covers, and enhanced hyperdescent along simplicial v-hypercovers D_ét(Y, Λ) ≃
  D_ét,cart(Y•, Λ) (ECD 17.3, Remark 17.4), functorially in pullback. Needed by
  `S1/factorisation-independence`, `S1/lower-shriek-quasicompact`, `S1/projection-formula-qc`,
  `S1/proper-dim-zero-topological-comparison`, `S1/qcqs-diamond-continuity`,
  `S2/hypercover-independence`, `S2/hypercover-support-diagram`, `S2/lower-shriek`,
  `S2/lower-shriek-locally-spatial`, `S2/projection-formula`, `S2/proper-support-subcategory`,
  `S3/upper-shriek`, `S4/invertible-object`, `S4/smooth-twisted-pullback`,
  `S4/smooth-upper-shriek-base-change`, `S4/smooth-v-local-on-target`, `S6/biduality`,
  `S6/biduality-counterexample`, `S6/closed-points-detect-vanishing`.
- `DiamondEtaleCohomology:C3`: The four operations on D_ét of small v-stacks at the enhanced level:
  f^* with right adjoint Rf_* (ECD Lemma 17.5), derived tensor product and internal RHom with the
  tensor–Hom adjunction, the pullback/Hom and pullback/tensor identities of ECD 17.7–17.9, change of
  coefficients, and Proposition 17.6 (for qcqs f and nΛ = 0, n prime to p: Rf_* = Rf_{v*} on D⁺_ét
  and base change on D⁺, and on all of D_ét when Rf_* has finite cohomological dimension). Needed by
  `S1/compactification-cd-bound`, `S1/factorisation-independence`, `S1/lower-shriek-base-change-qc`,
  `S1/lower-shriek-quasicompact`, `S1/projection-formula-qc`,
  `S1/spatial-compactification-cd-bound`, `S2/exchange-pasting-coherence`,
  `S2/lower-shriek-base-change-locally-spatial`, `S2/projection-formula`, `S3/adjunction-calculus`,
  `S3/upper-shriek-change-of-rings`, `S3/upper-shriek-internal-hom`,
  `S3/upper-shriek-pushforward-exchange`, `S3/verdier-duality-lower-shriek`, `S4/invertible-object`,
  `S4/smooth-base-change`, `S4/strictly-local-criteria-torsion`, `S5/geometric-base-criterion`,
  `S5/tate-twist`, `S6/biduality-torsion-coefficients`, `S6/verdier-dual`.
- `DiamondEtaleCohomology:C4`: ECD §18: proper and partially proper maps of v-stacks (Definitions
  18.1, 18.4) with their valuative criteria (18.3), proper ⇒ partially proper (18.3, 18.9), the
  canonical compactification (Y′)‾^{/Y} of a separated map with its universal property for partially
  proper targets (18.6), its formation commuting with base change and the absolute formula
  (Y′)‾^{/Y} = (Y′)‾ ×_{Y‾} Y, and Corollary 18.8 (partially proper; small; diamond for diamonds;
  limits; surjectivity; quasicompact ⇒ proper; quasi-pro-étale ⇒ quasi-pro-étale), and 18.7(iv)
  (Spa(R, R⁺)‾ = Spa(R, (R⁺)′)). The RS-05 owner entry naming DiamondsAndVStacks:D5 for this
  geometry is inconsistent with D5's text; see this packet's restructure entry. Needed by
  `S0/compactifiable-base-change`, `S0/compactifiable-cancellation`,
  `S0/compactifiable-composition`, `S0/compactifiable-iff-separated-open`,
  `S0/compactifiable-local-on-source`, `S0/compactifiable-morphism`, `S0/compactifiable-v-local`,
  `S0/separated-etale-compactifiable`, `S1/compactification-cd-bound`,
  `S1/factorisation-independence`, `S1/lower-shriek-base-change-qc`,
  `S1/lower-shriek-composition-qc`, `S1/lower-shriek-quasicompact`,
  `S1/proper-dim-zero-classification`, `S1/spatial-compactification-cd-bound`,
  `S2/lower-shriek-locally-spatial`, `S4/profinite-projection-pushforward`,
  `S5/free-quotient-smooth`, `S5/perfectoid-ball`, `S6/closed-points-detect-vanishing`,
  `S6/verdier-conservativity`.
- `DiamondEtaleCohomology:C5`: ECD Definition 19.1 (the exact left adjoint f_! of f^* for étale f,
  its base change and agreement with extension by zero for open immersions) and Theorem 19.2 (proper
  base change j_!Rg_* ≅ Rf_*j′_! for f proper and j open, on D⁺ when f is quasi-pro-étale or nΛ = 0
  with n prime to p, and on all of D_ét when moreover Rf_* has finite cohomological dimension), with
  the corrections PAPER-SCHOLZE-17/E53 and E94. Needed by `S1/compactification-cd-bound`,
  `S1/factorisation-independence`, `S1/lower-shriek-base-change-qc`,
  `S1/lower-shriek-composition-qc`, `S1/lower-shriek-etale-agreement-qc`,
  `S1/lower-shriek-quasicompact`, `S1/projection-formula-qc`,
  `S1/spatial-compactification-cd-bound`, `S2/exchange-pasting-coherence`,
  `S2/hypercover-support-diagram`, `S2/lower-shriek-base-change-locally-spatial`,
  `S2/lower-shriek-etale-agreement`, `S2/proper-support-subcategory`, `S3/upper-shriek-etale`,
  `S4/strictly-local-criteria`, `S6/biduality-counterexample`, `S6/closed-points-detect-vanishing`,
  `S6/conservativity-counterexample`.
- `DiamondEtaleCohomology:C6`: ECD Theorem 19.5(iii): for algebraically closed complete C ⊂ C′ with
  C′⁺ ∩ C ⊇ C⁺ and Spa(C′, C′⁺) → Spa(C, C⁺) surjective, pullback D_ét(Y, Λ) → D_ét(Y ×_{Spa(C,C⁺)}
  Spa(C′, C′⁺), Λ) is fully faithful, together with its consequence that geometric connectedness and
  étale cohomology are invariant (used in the proof of ECD 23.12). Needed by
  `S4/smooth-upper-shriek-base-change`.
- `DiamondEtaleCohomology:C7`: ECD §20 sheaf-level constructibility: constructible étale sheaves on
  spatial diamonds (Definition 20.1/20.3), descent of constructible sheaves along cofiltered limits
  of spatial diamonds (Proposition 20.7), the filtration of a constructible sheaf by j_!L with j
  quasicompact separated étale and L a local system (Proposition 20.8), and perfect-constructible
  complexes over a general Λ. Needed by `S4/direct-sum-criterion`,
  `S4/smooth-perfect-constructible`, `S4/smooth-universally-open`, `S5/ball-smooth`,
  `S5/free-quotient-smooth`, `S5/nonfree-quotient-smooth`, `S6/biduality`,
  `S6/biduality-torsion-coefficients`.
- `EnhancedDerivedSheaves:E0`: Quasicategorical coCartesian fibrations over Δ and over Δ × Δ¹ (and
  finite products of such indexing categories), their ∞-categories of (coCartesian) sections, and
  straightening for the diagrams i ↦ D_ét(Yᵢ, Λ) of ECD §22. Needed by
  `S2/exchange-pasting-coherence`, `S2/hypercover-independence`, `S2/hypercover-support-diagram`,
  `S2/lower-shriek-base-change`.
- `EnhancedDerivedSheaves:E2`: Simplicial v-hypercovers of a small v-stack by quasiseparated locally
  spatial diamonds (existence, refinement, common refinements of two hypercovers) and the
  cartesian-object description of sheaf categories on a hypercover, independent of the hypercover.
  Needed by `S2/hypercover-independence`, `S2/hypercover-support-diagram`, `S2/lower-shriek`,
  `S2/lower-shriek-base-change`.
- `EnhancedDerivedSheaves:E3`: Left Kan extension along a full inclusion of ∞-categories (HTT
  4.3.2.14) with its pointwise colimit formula, cofinality of fibre slices in a coCartesian
  fibration (HTT 4.3.1.7), the criterion that a fibrewise transformation preserves coCartesian
  edges, the ∞-categorical adjoint functor theorem for colimit-preserving functors between
  presentable ∞-categories (HTT 5.5.2.9), the equivalence 'preserves direct sums ⇔ preserves
  colimits' for exact functors of stable presentable categories (HA 1.4.4.1), mates and
  Beck–Chevalley pasting, and Neeman's criterion: for an adjunction F ⊣ G between compactly
  generated triangulated categories, G preserves direct sums iff F preserves compact objects (Neeman
  1996, Theorem 5.1). Needed by `S2/cocartesian-preservation`, `S2/exchange-pasting-coherence`,
  `S2/fibrewise-lower-shriek`, `S2/filtered-support-formula`, `S2/hypercover-support-diagram`,
  `S2/lower-shriek-colimits`, `S2/lower-shriek-colimits-locally-spatial`,
  `S2/lower-shriek-composition`, `S2/lower-shriek-locally-spatial`, `S2/projection-formula`,
  `S3/adjunction-calculus`, `S3/upper-shriek`, `S3/upper-shriek-change-of-rings`,
  `S3/upper-shriek-composition`, `S3/upper-shriek-etale`, `S3/upper-shriek-internal-hom`,
  `S3/upper-shriek-pushforward-exchange`, `S3/verdier-duality-lower-shriek`,
  `S4/direct-sum-criterion`, `S4/smooth-perfect-constructible`,
  `S4/smooth-upper-shriek-base-change`, `S4/strictly-local-criteria`.
- `PerfectoidSpaces:P1`: Perfectoid fields and tilts used as test objects and in proofs:
  F_p((t^{1/p^∞}))^∧, the cyclotomic ℤ_p-extension K_∞ of ℚ_p with K_∞^♭ ≅ F_p((t^{1/p^∞}))^∧,
  ℚ_p^{cycl} and its tilt, and the perfectoid tori C_p⟨T^{±1/p^∞}⟩ with their ℤ_p-actions (ECD
  24.4–24.5). Needed by `S5/analytic-smooth-is-cohomologically-smooth`, `S5/spd-qp-smooth`.
- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index`: Layer 1 of the
  Tau Ceti roadmap ProfiniteProPGroups: the supernatural order profiniteOrder G of a profinite
  group, profiniteIndex, Lagrange profiniteOrder G = profiniteOrder H · profiniteIndex H G, and
  agreement of profiniteIndex with Subgroup.index for open subgroups; used to normalise the Λ-valued
  Haar measure of a profinite group of pro-order prime to ℓ (ECD 24.2–24.3). Needed by
  `S5/normalized-haar-measure`.

## Recorded gaps

- **Huber duality over Spa(C, C⁺) with C⁺ ≠ O_C (inherited).** Condition (iii) of the practical
  smoothness criterion for the ball over a geometric point Spa(C, C⁺) uses Hub96 Theorem 7.5.3 over
  higher-rank bases. ClassicalAdicEtaleCohomology:H3/curve-poincare-duality proves duality for C⁺ =
  O_C and records the C⁺ ≠ O_C case as a gap; this packet consumes the statement and does not
  re-plan it. Needed by `S5/ball-smooth`.
- **Local compactification of smooth rigid curves over a non-discretely valued field (inherited).**
  The biduality proof needs the local form (L) of
  ClassicalAdicEtaleCohomology:H5/geometric-curve-compactification-export: every point of a
  quasicompact separated smooth rigid curve over an algebraically closed complete C has a
  neighbourhood embedding into a proper smooth curve. H5 records that Lütkebohmert's Theorem 5.3 is
  stated over discretely valued fields; the gap is owned there. Needed by `S6/biduality`.
- **Openness of the components in Zariski–Riemann spaces in ECD 25.4.** ECD asserts, using
  compactifiability over Spa(C, O_C), that the connected components Spa(C′, C′⁺) of the compactified
  strictly totally disconnected cover are open in the Zariski–Riemann space of their residue field
  over that of C. The node proves the Jacobson property of the Zariski–Riemann space itself and
  passes to open subspaces; the openness claim is taken from the source and not yet decomposed.
  Needed by `S6/closed-points-detect-vanishing`, `S6/verdier-conservativity`.

## Mistakes found in the source

The corrections already recorded by the paper extraction PAPER-SCHOLZE-17 are applied above (E53,
E64–E69, E72, E94, E98–E101). This plan adds:

- **DiamondSixOperations/E1** (gap, proof of Theorem 24.1, p. 152 (arXiv:1709.07343v4)). Printed:
  “Fix a prime ℓ ̸= p. We check the conditions of Proposition 23.10.” Correction: Proposition 23.10
  applies to compactifiable maps representable in spatial diamonds; add the check that f : B → * is
  compactifiable: B is separated, its canonical compactification is B‾(R, R⁺) = R°, and B → B‾ is
  the open subfunctor {|T| ≤ 1} (pullback along t ∈ R° is the rational subset {|t| ≤ 1} of Spa(R,
  R⁺)), so Proposition 22.3(i) applies. Reason: Proposition 23.10's hypotheses include
  compactifiability, which conditions (i)–(iv) do not imply; the proof verifies only (i)–(iv). The
  check is short but is not in the text. Affects the proof.
- **DiamondSixOperations/E2** (gap, proof of Proposition 25.4, p. 161 (arXiv:1709.07343v4)).
  Printed: “But Zariski–Riemann spaces of fields have a very dense set of closed points (by writing
  them as a cofiltered limit of projective varieties).” Correction: Argue valuation-theoretically:
  for k algebraically closed, every nonempty locally closed subset of ZR(k′/k) contains a closed
  point. Given V₀ ∈ U₀ ∩ Z with U₀ = {V ⊇ A}, A finitely generated over k, a minimal valuation ring
  W with A ⊆ W ⊆ V₀ (Zorn) has residue field algebraic over k, hence is closed, and lies in U₀ ∩ Z.
  Then vanishing of stalks at closed points forces vanishing, since supports of sections are locally
  closed. Reason: A cofiltered limit of Jacobson spectral spaces along uncountable index systems
  need not inherit the property that every nonempty locally closed (not only constructible) subset
  has a closed point: an inverse limit of nonempty sets of closed points can be empty. The stated
  reason does not give the conclusion used (vanishing of a complex of arbitrary, non-constructible
  sheaves). Affects the proof.
- **DiamondSixOperations/E3** (misprint, Proposition 25.4, p. 161 (arXiv:1709.07343v4)). Printed:
  “Let C be an algebraically closed nonarchimedean field of characteristic p with ring of integers
  OC ,” Correction: Let C be a complete algebraically closed nonarchimedean field of characteristic
  p, as in Theorem 25.1. Reason: Spa(C, O_C) is used as a perfectoid space (and as the base of a
  compactifiable map of diamonds), which requires C complete; Theorem 25.1 on the preceding page
  states completeness. Affects nothing.

## Structure

RT-AREA-padic-1/11 (confirmed): the accepted RS-05 names DiamondsAndVStacks:D5 as owner of 'Diamond
canonical compactification geometry' (ECD §18), but D5's text says that canonical compactifications
are in C4, and DiamondEtaleCohomology:C4's text constructs them (with properness, partial properness
and the valuative criteria). The DiamondsAndVStacks blueprint plans no §18 node in D5. This packet
consumes the canonical compactification from DiamondEtaleCohomology:C4, the stage that states it and
that S0 and S1 already require. Proposal: Correct the RS-05 owner entry to DiamondEtaleCohomology:C4
(formerly D5, S0), keep D5 as ECD §§11–13 (spatial diamonds, relative representability, Berkovich
quotient) and give the effective-descent reason to D3 rather than D2. DiamondSixOperations S0–S1
keep the links C4 → S0, C4 → S1 and D5 → S0, D5 → S1 for the spatial geometry they use; no stage of
DiamondSixOperations constructs the canonical compactification.
