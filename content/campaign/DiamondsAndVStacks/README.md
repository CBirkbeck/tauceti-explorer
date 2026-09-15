# Roadmap: pro-étale descent, diamonds and small v-stacks

This specification uses the shared [diamond conventions](../../campaign-guide/DIAMONDS_CONVENTIONS.md),
[source contracts](../../campaign-guide/DIAMONDS_SOURCE_CONTRACTS.md), and
[65-milestone source graph](../../campaign-guide/DIAMONDS_DEPENDENCY_ORDER.md). The original ECD source
coverage is retained in the 328-item index.
Canonical campaign ownership takes precedence over historical supplier paths in the source index.

This component constructs the geometry of ECD §§2, 4, 7–13 and 15. Basic sheaf cohomology in
D0 is shared with the other components; the specialized derived étale category is not defined
here. Perfectoid spaces and finite-stage approximation come from P0–P6.

## D0. Spectral topology, ordinary sites, and size

Extend the existing spectral-space API with constructible and pro-constructible subsets,
generalization, spectral maps, limits and quotient criteria of ECD §2. Prove the exact quotient
hypotheses rather than the false assertion that every quotient of a spectral space is spectral.
Implement pro-categories of the small categories needed for these limits and compare with the
existing categorical limit API. Supply profinite decompositions, extremally disconnected covers
and the Stone–Čech argument where used.

Use the existing presheaf/sheaf and Grothendieck-topology carriers. Build the missing coherent
and algebraic topos interfaces, qc and qs objects versus morphisms, sheaves of modules,
exactness of sheafification and filtered colimits, enough injectives, derived global sections,
Leray and Čech-to-sheaf spectral sequences, and acyclic-basis comparison. These ordinary
foundations suffice for the structure-sheaf vanishing statements in P2 and D2; they do not
presuppose the enhanced diamond étale category.

Prove the abstract cutoff-cardinal existence lemma of ECD 4.1 here. The perfectoid-specific
categories and closure assertions are instantiated in P6 and D1–D2, not prerequisites of
these ordinary sheaf foundations. Supply the cardinal arithmetic, bounded-union and completion
bounds in conditional form. Likewise prove the spectral/profinite representation results used
from Hochster in §2, with their actual ring or inverse-system constructions rather than an
unproved representation axiom.

For ordinary groupoid-valued prestacks, construct descent data, stackification, 2-fibre products,
quotients of groupoids, and descent of morphisms and objects. Keep isomorphism classes separate
from the groupoid until absence of automorphisms has been proved. Reuse any existing stack
API with the same universal properties; build missing statements in its namespace.

## D1. Totally disconnected perfectoid spaces

Implement ECD 7.1–7.7 and 7.12–7.23. Distinguish totally disconnected, strictly totally
disconnected, w-local and w-strictly local. Prove the affinoid and connected-component
characterizations, with components `Spa(K,K⁺)` and algebraically closed `K` in the strict case.
Construct w-localization and the universally open affinoid pro-étale strictly totally disconnected
cover of 7.18. The countable iteration uses P6's affinoid approximation.

Classify separated qc pro-étale maps over a strictly totally disconnected base by the associated
spectral-space data; construct the inverse functor, its sheaves and valuations. Prove automatic
flatness modulo a pseudouniformizer for maps to a totally disconnected base, and faithful
flatness for a surjective map of affinoids. This is the algebraic descent input, not an assertion
that arbitrary maps between perfectoid rings are flat.

## D2. Pro-étale and v-topologies

Use P6's κ-small perfectoid spaces and closure statements, then
prove ECD 8.2's cutoff independence and cohomological invariance for the sites below.
Track completion, countable iteration and bounded inverse limits; universe annotations alone
do not prove these results. Define small sheaves through the compatible cutoff comparisons.

Construct the big pro-étale site, the small pro-étale site of a perfectoid space, and the v-site.
Use the actual covering condition: every qc open of the target is covered by the images of
finitely many qc opens of members of the family. Mere point-surjectivity of a completely
unrestricted family is not the definition. Prove the pretopology axioms, refinements by suitable
affinoid covers and comparison with the analytic and étale topologies.

Prove that `𝒪` and `𝒪⁺` are sheaves on the pro-étale site and that representables are sheaves.
Then prove v-descent of functions and subcanonicity using D1's automatic flatness, P0's
almost descent and the completed integral equalizer argument. Prove the higher v-acyclicity
and almost-acyclicity on affinoid perfectoids, not just degree zero (ECD 8.5–8.8). Supply all
smallness and Čech-to-derived comparison steps.

## D3. Effective descent and morphisms of stacks

Prove ECD 9.2–9.11. General perfectoid spaces have fully faithful descent of morphisms. The
effectivity assertions have distinct scopes: affinoid perfectoids over a totally disconnected
base; separated pro-étale objects over a strictly totally disconnected base; separated étale
and finite étale objects over an arbitrary perfectoid base. Preserve these restrictions.
The finite étale/Galois reduction, descent of the integral subring, spectral quotient arguments
and the section lemma for rational opens of balls over `(C,C⁺)` all require proofs.

Define étale, finite étale and quasi-pro-étale morphisms of stacks as in ECD 10.1. Include local
separatedness in étale and quasi-pro-étale. Prove composition, base change, appropriate
cancellation and target-locality, together with open/closed immersions, separatedness and
0-truncatedness. “Representable in perfectoid spaces” is not imposed on every morphism of
diamonds. Construct locally profinite group torsors and their representability/pro-étale
presentation over perfectoid bases; include finite quotient towers and universal openness.

## D4. Diamonds and small v-stacks

Define a diamond by a pro-étale sheaf quotient `U/R`, where `U` and `R` are characteristic-`p`
perfectoid spaces and the relation projections are pro-étale. Prove effectiveness of the
relation, independence of atlas/refinement, the quasi-pro-étale atlas characterization,
products, fibre products, and stability under the precisely stated quotients. Prove diamonds
are v-sheaves and sub-v-sheaves of diamonds are diamonds. Do not strengthen this to arbitrary
v-sheaves being diamonds.

Construct the underlying topological space independently of presentation, via field-valued
points and quotient topology. Prove the open-subfunctor correspondence. Define small
v-sheaves and small v-stacks with their atlas/relation smallness conditions, and prove their
closure and topological comparison results, ECD §12. Prove the qcqs geometric-point
isomorphism criterion and the distinction between a v-surjection and a topologically
surjective map. The converse implication requires the stated qc hypothesis.

**Tests:** a characteristic-`p` perfectoid representable, a profinite torsor, a free discrete
group quotient, a quotient with genuine stack stabilizers, and the compact-Hausdorff diamond
example of 11.12. These tests distinguish sheaves, stacks and spatiality.

## D5. Spatial geometry and relative representability

Define spatial and locally spatial diamonds by the sheaf-theoretic qcqs and qc-open-basis
conditions, not just by the spectrality of the underlying space. Prove the structural and
permanence results of 11.17–11.31, the finite-stage étale comparisons, the universally open
strictly totally disconnected presentation and its converse. Prove the spatial v-sheaf
criterion of 12.18–12.21, which starts with point-surjectivity of a quasi-pro-étale map and
concludes existence of an actual atlas.

Construct representability in diamonds and in locally spatial diamonds, including the different
pro-étale and v-locality assumptions in §13. Prove the fibre criterion for separated
quasi-pro-étale morphisms. Construct the Berkovich/maximal-Hausdorff quotient functor and the
proper-zero-dimensional compact-Hausdorff examples needed later. The maximal-point inclusion
back into the adic topological space need not be continuous.

The source index assigns §13 here, including its ordinary sheaf-cohomology assertion 13.13,
proved using D0 rather than the later diamond coefficient category. Canonical compactifications
in C4 are not assumed to remain spatial; this component's nonspatial geometry is needed for
the `3 dim.trg` bound.

## D6. Analytic adic spaces as diamonds

Construct `Spd ℤ_p` by marked untilts, proving functorial pullback from the tilting equivalence,
absence of automorphisms, and v-descent. Construct `Spd(A,A⁺)` for a Tate `ℤ_p`-pair by a
marked untilt and a continuous morphism of pairs. Distinguish a Tate pair from an arbitrary
formal base such as `(ℤ_p,ℤ_p)`.

Using A4, prove ECD 15.2–15.4: a perfectoid pair gives its tilt, arbitrary Tate-pair presentations
give spatial diamonds, and the topological and finite étale comparisons hold. Glue these affine
objects to define `X^♢` for analytic adic spaces over `ℤ_p`. Prove functoriality, restriction,
compatibility with the relevant fibre products and with the tilt on perfectoid spaces.

Prove ECD Lemma 15.6 in full: local spatiality, identification of underlying spaces and the
étale and finite étale site comparisons. Both full faithfulness on the **étale categories** and
essential surjectivity are tasks. This is not full faithfulness of the functor on all analytic
adic spaces. Distinguish site equivalence from the later derived left-completion comparison.

**Tests:** `Spd ℚ_p`, a rigid analytic disc, a perfectoid disc, a finite étale cover and a rational
open. Applying this endpoint to the existing Fargues–Fontaine adic curve is F0–F3 and is already
possible before the full coefficient theory.

## Completion contracts added on 2026-09-15

**Applies to:** `D0`, `D1`, `D2`, `D3`, `D4`, `D6`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

At each cutoff prove closure under the countable towers and completed affinoid constructions actually used. In D3 descend the integral subring as well as the rational ring and verify the resulting valuations; descent of functions alone does not yield effective descent of all perfectoid spaces. In D4 construct the atlas relation and its groupoid before passing to a quotient sheaf, and retain stabilizers for genuine stack quotients.

### Producer–consumer contract

D6 returns an equivalence of étale categories on the already constructed analytic object. It does not return full faithfulness of diamondification on all analytic morphisms. Quotient comparison requires an effective presentation and preservation of its particular pullback diagram.

### Acceptance and source route

A free finite torsor, a classifying stack with nontrivial automorphisms, a topologically surjective family failing the qc-cover condition, and a higher-rank valued pair separate the categories.

**Source route:** ECD §§4/7–13 and 15.6. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
