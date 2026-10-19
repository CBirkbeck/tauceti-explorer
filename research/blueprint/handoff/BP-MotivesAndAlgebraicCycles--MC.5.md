# Handoff — BP-MotivesAndAlgebraicCycles--MC.5

Issue #10831. Agent: Codex. Session: codex-HSHmgg. Date: 19 October 2026.
Claim confirmed by the bot in issue comment 6273339683. Branch: codex-HSHmgg-mc5.

## Completed planning pass

The MC.5 continuation has a packet, definitive reader and compact suggested Lean
file. It has 28 targets (seven constructions, nineteen theorems, two
applications), 35 API items, 21 discriminating construction tests, twelve pinned
baseline declarations and six replacement planets. Every construction has five
API items derived from recorded uses and three tests. All implementation flags
remain unchecked. No Nori construction is claimed to be formalized.

Packet status is **complete** and MC.5 coverage is **planned**, in the sense of
PROTOCOL section 0. This is a finished target-level planning pass, not a claim of
closure: four exact supplier/proof gaps and six interface requests remain. Each
brief target is a new proof/adaptation node or an explicitly imported existing
owner. This submission is not an independent review or a package acceptance.

The new prefix is MotivesAndAlgebraicCycles:MC.5/completion-. Existing whole-roadmap
MC.5 objects remain canonical. This pass supplies finite-dual and filtered
support arguments, reconstruction and marked universality, the geometric Basic
Lemma proof route, cellular complexes and choice comparisons, corrected tensor
paths, Tate inversion, rigidity, two fibres, and the sourced geometric-motive
realization. It also specifies the constructible-sheaf and equivariant inputs
needed for Harrer's correspondence construction.

## Source and mathematical findings for review

The reader's source ledger gives URLs, SHA-256 hashes, dates and exact locators
for the six freely readable source versions. All statements and proof routes
are in our own words. No downloaded source file or passage is in the repository.
In particular, HM17 is the Version 6 author preprint; HM25 is the annotated
1 July 2025 author version. Their page numbers are different.

- **E48, author-known:** the product-boundary functoriality arrow in HM17
  Proposition 9.3.1 goes in the wrong cohomological direction. The authors'
  27 June 2025 erratum adds inverse excision arrows. They preserve the abelian
  diagram category because the existing faithful exact fibre reflects
  isomorphisms. The tensor proof uses the corrected Good_ex diagram.
- **E49, new and requiring independent checking:** the annotated author's
  three-edge path on p. 224 still passes through a pair which need not be good.
  The reader gives the explicit example X=A¹, Y={0,1}, Z=empty, and
  A=A² with B the smooth affine cubic y²=x³−x. The unwanted intermediate has
  nonzero H¹ and H². After inverse excision, use the boundary of the triple
  X×A containing S=Y×A union X×B containing T=Z×A union X×B directly.
  This is a two-edge path with good endpoints and the same cohomological map.
  E49 is scoped to the annotated author version, not unseen publisher text.
- The Basic Lemma's proper modification of the original affine X need not be
  affine. Only the swapped complement in the normal-crossings compactification
  is made affine. The reader distinguishes the original upper-degree vanishing
  from the dual lower-degree argument.
- Finite algebra restrictions need not be surjective and their dual maps need
  not be injective. Coaction coefficients and equations descend at later stages.
  Generation is proved by finite regular modules before using universality.
- The ordinary constant-sheaf Basic Lemma does not by itself give quotient-nice
  filtrations. The constructible-sheaf Basic Lemma and equivariant filtration
  targets are stated separately, with integral cellularity before rational
  realization. Their missing analytic/geometric adapters are named precisely.
- The full repeated-index Čech complex is unbounded. Harrer's finite filtration
  theorem applies to the finite diagram of connected-component representatives,
  with hom-almost acyclicity and genuine finite group automorphisms. This does
  not assert that the infinite complex has finitely many occurrences.
- Harrer's totalization sign differs from ours. Multiplication by (-1)^(ij)
  conjugates the two double-complex conventions; all cited total comparisons
  must be translated, including iterated totalization and products.
- With cochain shifts and M(P¹)=Q plus Q(1)[2], realization sends Q(1) to
  L[0], not to L[-2]. It sends Q(1)[2] to L[-2] and M(j)[r] to
  R(M) tensor Q_N(-j)[-r]. The projective-line check fixes the normalization.
- The derived Betti functor is conservative, not assumed full or faithful.
  Actual comparison maps/zigzags are constructed before using conservativity.
  Cover-filtrations themselves are not a directed poset.
- Motivic categories and both neutral fibres are over Q in this pass. Artin
  H⁰ factors are retained, notably for Spec Q(i). No equivalence, fullness or
  faithfulness of the geometric-to-Nori realization is claimed.

## Existing library and roadmap ownership

The pinned baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Each of the twelve baseline
statements was read at its pin. The finite Noether-normalization theorem is
already in Mathlib, but does not identify its variable count with dimension;
its geometric adapter is named rather than attributed to that declaration.

Current read-only Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 contains
Algebra/Coalgebra/Comodule/Finite/Abelian.lean, absent at the pin. Reuse that
implementation after repinning. Generic finite-comodule tensor, symmetry and
dual machinery already exist at the pin. Only their Nori coefficient and
geometric applications are new here.

Current roadmap sources at 0d144d044dacebca17b654695b6f1ad58f159b27 were searched;
AlgebraicTopology, RepresentationTheory/QuiverRepresentations and
RealAlgebraicGeometry were read at the relevant README/Suggested interfaces.
Generic quiver representations, CW cohomology, products, finite-cover descent
and manifold duality remain upstream imports. RealAlgebraicGeometry explicitly
excludes triangulation. No current Nori diagram construction was found.

The aggregate library coverage file has no entry for this roadmap. AUDIT-35 has
search leads but no independent review object; it is not represented as an
accepted audit. No upstream roadmap was edited or repackaged.

## Exact remaining work and assembly instructions

The four gaps in the packet/reader specify their consuming nodes and source
routes. A continuation must install the precise supplier ownership and proofs:

1. Compatible algebraic-pair triangulation and the affine analytic CW-dimension
   theorem. Proposed continuations of RealAlgebraicGeometry/complex topology;
   neither is supplied by generic finite CW type.
2. The normal-crossings oriented real-blow-up/manifold-with-corners adapter to
   Poincaré–Lefschetz duality, beyond the existing general manifold theorem.
3. Arbitrary singular-pair multiplicative de Rham comparison by smooth proper
   hypercover or h-descent, with products and triple boundaries. Proposed
   ComplexComparison Part III. Current C5 supplies proper smooth comparison
   and nonproper curve interfaces; MC.6 already owns abstract fibre extension.
4. Stratified Betti sheaf/base-change adapters to the sourced sheaf Basic Lemma,
   finite symmetric quotients and multivalued correspondence geometry, and the
   rigidified Nisnevich correspondence-cover bridges of Harrer chapters 5–6.
   The reader names the exact stronger base-change hypotheses. These are not
   the divided-power algebra of a module.

At assembly, apply the packet's refinement map as proof replacements; do not
blindly add all new dependencies to each canonical object. In particular:

- Separate effective vertices/edges of effective-pairs-diagram from its
  localized/tensor clauses. Basic pair cohomology uses only the former.
- Remove the old generation node's universality prerequisite: the direct
  finite-stage generation argument precedes universality.
- Keep the coefficient construction independent of its category-equivalence
  consequence. Rewire the old universal-property proof to reconstruction.
- Replace the unsupported unmodified good-pair product claim by Good_ex.
  Transport tensor to the very-good category through the proven equivalence;
  do not assert raw product closure of the very-good quiver.
- Import MC.4/M.5a finite correspondences, motivic localization and Tate
  stabilization. Keep abstract fibre extension and formal-period objects in
  MC.6. Do not duplicate any of those carriers.
- **Replace** the old MC.5 planet selection with the six here; never append it.
  The total remains six after assembly.

The Tate curve computation is independently accessible from the current C5
curve residue/comparison interface. It does not justify arbitrary-pair de Rham
comparison. The original whole-roadmap packet and other stages were not edited.

## Validation and prototype boundary

- check_blueprint.py: zero errors and zero warnings; complete/planned MC.5.
- Suggested Lean: lean-check completed successfully at the pins, with exactly
  two warnings, both admitted theorem proofs; no other warnings or errors.
- The prototype is 101 lines: one real-bodied compatible-endomorphism
  subalgebra, two theorem signatures, two proved evaluation examples, two
  imported triple-homology checks and two existing finite-comodule checks.
- No admitted data, artificial Prop-valued construction carrier, Lean language
  server, new Lake project, library build or cache operation was used.
- Heavy construction signatures, APIs and tests remain in the definitive reader
  because their carriers do not exist at the pin. The prototype is deliberately
  not an exhaustive translation of the roadmap.

The handoff and reader contain the durable findings. Scratch downloads and
work notes can be deleted after submission; no future worker needs a local
source path or a private source copy.
