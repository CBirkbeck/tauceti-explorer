# Independent review: homotopy foundations for algebraic K-theory

Job `REV-StableHomotopyKTheory`, issue [#497](https://github.com/CBirkbeck/tauceti-explorer/issues/497).
Reviewer: Claude (Claude Code, model Opus 5.5), session `claude-RkTlmB`, 6 October 2026. The blueprint
was written by session `claude-mib2G7` (issue #999, PR #6669). This review is independent of it.

**Verdict: needs_changes.** This is a completed review, not a checkpoint. Every node was checked
against its sources and its prerequisites at lemma level, and every baseline citation against the
pinned Lean source. Clear corrections are applied in place to the packet and the suggested Lean file,
and each one is recorded in the packet's `review.checked`. Many are substantive: false statements,
circular proofs, dependency cycles and missing named inputs, listed below.

The verdict is not accepted because the reader document
`research/blueprint/readmes/StableHomotopyKTheory.md` is not among this issue's deliverables, and
it now contradicts the corrected packet in many places. Examples are the shift indexing, the choice
of 3-cells in the plus construction, the bar-complex isomorphism, E/m, p-completion and connectivity.
Promotion would copy that reader. A revision round must therefore regenerate it from the corrected
packet, as described in "What the revision does" below. The packet's own open items are honest gaps,
and are not a reason to send the plan back.

## Counts

| Item | Before | After |
| --- | --- | --- |
| Nodes | 170 | 213 (154 corrected, 16 verified, 43 added, 0 unverifiable) |
| Kinds | 24 def, 34 constr, 48 lemma, 59 thm, 3 comp, 2 appl | 24 def, 36 constr, 65 lemma, 82 thm, 4 comp, 2 appl |
| API items / unit tests / planets | 305 / 236 / 36 | 336 / 245 / 36 (at most six per layer) |
| Baseline declarations | 49 | 88 (all 49 confirmed; 2 module paths and 4 kinds corrected; 39 added, each read at the pin) |
| Gaps | 24 | 35 (one closed, twelve added) |
| Requests | 16 | 15 (the UniversalCovers stage-4 request is replaced by the Tau Ceti declarations it asked for) |
| Source issues | 7 | 15, all with a review verdict (E1–E7 confirmed; E8–E15 added and confirmed) |
| Issues found | | 365 (15 high, 178 medium, 172 low) |
| Checker | 0 errors, 0 warnings | `python3 scripts/check_blueprint.py --index <pinned declarations.tsv> research/blueprint/packets/StableHomotopyKTheory.json`: 0 errors, 0 warnings |
| Lean | compiled | `lean-check` exit 0 at Mathlib 082e2d37e8; only `declaration uses sorry` warnings |

Every stage keeps coverage `planned`, with a precise `remaining` list, and the packet keeps status
`complete`. The node count, 213, is within the budget of about 300.

## Method

- **Sources.** All supplied public sources were re-fetched into scratch, and every SHA-256 matched
  the packet: Weibel IV and V, Hatcher AT and SSAT ch. 1, Schwede v3.0, Hovey–Shipley–Smith,
  Nikolaus–Scholze, Bhatt–Scholze, Calmès et al., Burklund, Lurie HA, Kahn, Shipley and Quillen. The
  Quillen OCR was checked against page images. The packet called Carlsson's Handbook chapter
  unavailable publicly; the published chapter is in Andrew Ranicki's archive and is now recorded
  (URL, SHA-256 `ae8ea812…`, printed page = PDF page + 2). Every node excerpt was located
  automatically and then read in context at its locator.
- **Node checks.** These were split by stage between six checking passes run in this session under
  this review's direction. Each pass read every node of its stage against the sources, its
  prerequisites and its Lean rendering. This reviewer re-derived the principal claims before
  applying any change: the inversion map against Mathlib's `inhomogeneousChains.d_single`, the loop
  relation under `SingleObj.comp_as_mul` and `FundamentalGroup.mul_def`, the shift indexing,
  Schwede's lim¹ display, Weibel's Remark 1.8.1, the Ex. 3.7 counterexample, and the Carlsson
  passages. Each change set was diffed node by node before it was applied.
- **Library.** Mathlib 082e2d3 is read in `~/TauCeti-adic/.lake/packages/mathlib` and Tau Ceti
  f790474 in the pinned baseline tree. The reviewed audit (`data/library-coverage.json`, AUDIT-30)
  was read for every layer.

## Baseline

All 49 cited declarations exist and provide what their citing nodes need. These corrections were made:

- `tauceti:TauCeti.fundamentalGroupMulAut` is in `TauCeti/Topology/Homotopy/HomotopyGroup/FundamentalGroupAction.lean`;
  `tauceti:TauCeti.homotopyGroupMulEquivOfPath` is in `TauCeti/Topology/Homotopy/HomotopyGroup/BasepointChange.lean`.
  The cited `TauCeti/AlgebraicTopology/FundamentalGroup/…` files do not contain them.
- Kinds: `IsCoveringMap.homotopyGroupMulEquiv` is a `def`, not a theorem (it needs `[Nontrivial N]`,
  i.e. n ≥ 2); `StructuredArrow` and `CostructuredArrow` are `def`s; `TauCeti.LocalCoefficientSystem` is an `abbrev`.
- Added, read at the pins: `tauceti:TauCeti.IsEilenbergMacLaneSpaceOne` and
  `tauceti:IsCoveringMap.isAspherical_of_subsingleton_homotopyGroup`. These replace the request to
  UniversalCovers stage 4, since what it asked for is built. The other additions include
  `IsFreeGroupoid.SpanningTree.endIsFree`, `ExtraDegeneracy.homotopyEquiv`,
  `groupHomology.inhomogeneousChains` and `H1AddEquivOfIsTrivial`, `Topology.IsQuotientMap.continuous_lift_prod_left`,
  `SSet.relativeCellComplex`, `CategoryTheory.Skeleton`, `MonoidalLeftAction` and `FreeGroupoid.lift`.

Nothing the audit shows in the libraries is planned anew. Three re-plans were removed: H.4 re-planned
Mathlib's `Skeleton` commutative monoid, `Functor.core` and `MonoidalLeftAction`, and now cites them.

## Main corrections, by stage

The full per-node record (verdict, what was read, every change) is in `review.checked`.

**H.1.**
- The bar-complex comparison matched the nerve of `SingleObj G` with Mathlib's inhomogeneous chains
  by reversing tuples, which is not a chain map. The isomorphism is entrywise inversion, checked
  against `inhomogeneousChains.d_single`.
- The face formula and the loop relation were reversed for Mathlib's `f ≫ g = g * f`; now
  `loop (g * h) ≃ (loop h).trans (loop g)`, so that g ↦ ⟦loop g⟧ is a homomorphism.
- Quillen locators: formula (2) is cohomology; Prop. 3 Cor. 1 is on p. 92. Six excerpts were
  paraphrases and are now literal.
- The finite-factor product theorem now has a proof from Mathlib's quotient-map lemma, freeing the
  natural-transformation homotopy (and its consumers in four roadmaps) from the compactly generated
  gap. That case is a separate node.
- Six named facts had no supplier and are now nodes: the nerve commutes with filtered colimits;
  realisations of simplicial coverings are coverings; the realised boundary inclusion is the disk
  inclusion; cellular chains with local coefficients; the groupoid-nerve Kan property; and the
  compactly generated product.
- A reversed dependency between the coverings and translation-category nodes is fixed.

**H.2.**
- Theorem B lacked the contractible-base step from the homotopy-cartesian square to the comparison
  map B(Y\f) → F(Bf, [Y]); it now cites it, with a Lean form that Theorem B can use.
- Hatcher's Thm 4.41 (an added node) was hidden in the long exact sequence. The request to AT stage 8
  now asks for relative homotopy groups of arbitrary based pairs, because AT stage 8 promises them
  only for NDR pairs.
- The functor-homology spectral sequence used Weibel IV Ex. 3.7's double complex, which has the wrong
  variance for cofibred functors (new issue E13, with a counterexample).
- Levelwise-fibration realisation (RT 1/15) now pins the basepoint and the fibre map, is restricted to
  levelwise realisations of bisimplicial sets (all consumers), and moves the Bousfield–Friedlander
  π_*-Kan form to its own node, which H.4's Segal delooping needs.
- The Nikolaus–Scholze results are scoped to compactly generated weak Hausdorff spaces.
- The Dold–Lashof criteria are split, and the excisive-triad comparison and Strøm's theorem are added.

**H.3.**
- The cell-attachment construction (following Weibel Ex. 1.4) let the 3-cells represent any integral
  H₂ class. That fails when P ≠ π₁X; for P = 1 and X = S¹, Hatcher's Example 4.35 gives a
  non-acyclic map. The 3-cells now lift to the ℤ[π₁X/P]-basis on the universal cover.
- The universal-property proof was circular through the uniqueness node; it is rerouted through the
  mapping cylinder (Hatcher §4.3 Ex. 23).
- Uniqueness, functoriality and the H-space recognition theorem now state their abelian-target
  hypotheses.
- RT 1/5 (ii) rested on relative Hurewicz with trivial π₁-action, which AT stage 8 does not plan. It
  is now a node, with the principal-fibration criterion (Hatcher Lemma 4.70), the Postnikov limit
  (Prop. 4.67, Cor. 4.68), degree-one Hurewicz, the base-and-total Serre comparison and the
  twisted-homology-via-cover identification.
- `plus-uce-fibration` misapplied the relative comparison; it is rerouted through a map to K(A, 2).
- The Milnor–Moore gap is closed by a packet-authored argument for finite-type H-spaces.

**H.4.**
- The H-space structure on BGL(R)⁺ used the plus-construction universal property with a target not
  yet known to be abelian. It now depends explicitly on the gap "Plus-construction universal property
  for non-abelian targets", whose record claimed that every consumer was covered.
- Weibel 4.10 inferred acyclicity from an integral homology isomorphism, which is false (a homology
  circle maps to S¹). This is now the gap node `group-completion-acyclic` (McDuff–Segal,
  Randal-Williams 2013).
- The group-completion adjunction lacked the countability its CCMT step needs.
- Uniqueness of group completions needs homotopy associativity; counterexamples are recorded.
- F(R), the ring-map and block-sum naturality that RS-33 keeps, the product of plus constructions and
  Segal's homology group completion are added as nodes.

**H.5:spectra.**
- The shift moved naive homotopy groups the wrong way. Correct is π̂_{k+1}(sh X) = π̂_k X; for
  X = S, π̂₁(sh S) = ℤ while π̂₂S = ℤ/2.
- "Naively connective ⇔ connective" is false; naive connectivity implies true connectivity, not
  conversely.
- Three dependency cycles are fixed (stable-equivalence ↔ true-homotopy-groups, mapping cone ↔ long
  exact sequence, biproducts ↔ SHC), and so is a stage cycle: Postnikov sections used H.6's Milnor
  sequence.
- The mapping-cone convention is pinned to Schwede's (the sign of distinguished triangles).
- The cohomology representability proof treated S^k ∧ HA as an Ω-spectrum.
- Added: cellular approximation and connective generation (Schwede II 5.14 and 5.21), Eilenberg–Mac
  Lane uniqueness, smash connectivity, the true-homotopy pairing, module model structures and the
  homotopy of HC.
- The `KU`/`ku` connective-cover test belongs to the stage that builds KU (see the questions).

**H.6 and H.5:S-delooping.**
- E/m is now the functor E ∧^L S/m, with the cofibre triangle a theorem. p-completion is
  F(S/p^∞, ΣE), with the homotopy-limit description a theorem.
- Countable products in SHC were used by the homotopy limit and the Milnor sequence but planned
  nowhere; they are now a node of H.5:spectra.
- Boardman's condition was misstated: the derived term is lim¹ of the r-cycles, and the finiteness
  condition is on differentials *leaving* a spot.
- Rationalisation is split from Serre's finiteness, which is now a gap.
- The UCT splitting and the coprime decomposition, Browder's scholium (requested by L.1) and
  Burklund's quotient tower with the S/4 and S/p inputs that RT.5 needs are separate nodes.
- The construction node of the K-theory spectrum no longer asserts the theorem content. π₁ = K₀ is
  imported from K.4:construction, not re-proved. The supplied deloopings are now identified with the
  adjoint structure maps.

## Red-team findings handed to the blueprint

| Finding | Status after review |
| --- | --- |
| RT-AREA-ktheory-1/4 | Handled. H.5:S-delooping only assembles; the deloopings are `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum` (parent K.4:construction, so no stage cycle); no node states the biexact pairing (K.7 owns it). The construction node's theorem content and its duplicate π₁ = K₀ argument are corrected. |
| RT-AREA-ktheory-1/5 | Now discharged. (i) `H.3/hspace-is-abelian`; (ii) Hatcher 4.69–4.74 with the added relative-Hurewicz-with-trivial-action, principal-fibration and Postnikov-limit nodes; (iii) Ex. 1.3, Thm 1.5(2) for abelian targets, Thm 1.8 with the abelian hypothesis stated; (iv) rational Hurewicz, now without the Milnor–Moore gap. H.4's comparisons route through H.3, and Weibel 4.10's acyclicity is a recorded gap. |
| RT-AREA-ktheory-1/15 | Handled by `H.2/levelwise-fibration-realisation` (basepoint and fibre map pinned, connected bases, bisimplicial levels; no claim for arbitrary levelwise fibrations) and `H.2/bisimplicial-fibration-pi-kan`. |
| RT-AREA-ktheory-1/16 | Handled: Eilenberg–Mac Lane spectra of complexes with π_k(HC) ≅ H_k(C) (its own node now), HR as a ring with module categories, [Σ^∞_+X, ΣⁿHA] ≅ Hⁿ(X; A) (proof corrected), covers and sections with their triangle. |
| RT-AREA-ktheory-1/22 | Handled: nerve, nerveMap, nerveFunctor, SSet.toTop and `TauCeti.LocalCoefficientSystem` are imported; the Kan comparison and Hurewicz come from AT stage 8; the Serre gap is restated for twisted total-space coefficients. |
| RT-AREA-ktheory-1/23 | Handled: H.6 owns the exact couple, the filtered-spectrum spectral sequence and convergence; edge H.6 → S.4 is in the restructure proposal. The exact couple is now bigraded in Lean. |
| RT-AREA-ktheory-1/30 | Handled: the π₂ node cites `K2SymbolsBrauer:T.1/recognition-theorem` and `T.1:classical/uce-kernel-h2`, which supply exactly the needed statements; the naturality K3BlochGroups V.1 asks for is the added node `H.3/plus-pi2-natural`. |
| RT-AREA-ktheory-2/29 | Handled: Burklund's Theorems 1.1–1.2 and the quotient tower (Thm 1.5 with the S/4 and S/p inputs) are nodes; edge H.6 → RT.5 is in the restructure proposal. |

## Mistakes in the sources

| Id | Source and place | Verdict |
| --- | --- | --- |
| E1 | Bhatt–Scholze p. 55, "chains of n − 1 morphisms" | confirmed |
| E2 | Weibel IV 2.9, K₁(ℂ; ℤ_ℓ) printed as ℤ_ℓ (it is 0) | confirmed |
| E3 | Nikolaus–Scholze Def. C.4, X(i_n) for X(i₀) | confirmed (known as PAPER-NIKOLAUS-SCHOLZE-18/E18) |
| E4 | Weibel V.1.7 proof, B and C exchanged | confirmed (known in GeneralAlgebraicKTheory) |
| E5 | Weibel IV p. 18 and 2.7, H̃_m for H̃_{m−1} of the Moore space | confirmed |
| E6 | Weibel IV Ex. 1.1, "the canonical map S³ → X⁺" | confirmed (degree 120) |
| E7 | Weibel IV 2.7, q₁ for q₂ | confirmed (known as K3BlochGroups/E-V4-5) |
| E8 | Carlsson Thm 3, "n > 1" for n ≥ 1 | new, confirmed |
| E9 | Schwede II proof of Thm 8.3, lim¹ π_k(ΣP_nX) for lim¹ π_{k+1}(P_nX) | new, confirmed |
| E10 | Weibel IV Ex. 1.1, SL₂(F₅) "embeds in O₃(R)" | new, confirmed |
| E11 | Weibel IV p. 27, maximal trees (the empty tree of a group) | new, confirmed |
| E12 | Schwede II p. 287, no mod-n Moore spectrum is a symmetric ring spectrum | new, confirmed (Burklund's S/8) |
| E13 | Weibel IV Ex. 3.7, variance of the double complex | new, confirmed |
| E14 | Carlsson Example 4, finite sets have no zero object | new, confirmed |
| E15 | Schwede v3.0, unfinished passages (operad equivariance, Prop. 6.23 homology, Thm 8.3 holim) | new, confirmed (gap) |

The packet now records `sourceVersions`. The Weibel findings are scoped to the author's chapter
files; the version of record (AMS GSM 145) was not read.

## Suggested Lean file

- The file compiles with `lean-check` at Mathlib 082e2d37e8, with exit 0 and only `declaration uses sorry`
  warnings. The shared build has only part of Tau Ceti, so the file still imports Mathlib only and
  keeps its four `Stub` stand-ins.
- Fixes:
  - false statements: the shift example; `IsGroupCompletion.basepointComponent` off the basepoint
    component; `homotopyEquiv_of_groupLike` without homotopy associativity; `coherentSubsetGammaSpace.level_one`,
    which claimed an isomorphism where only an equivalence holds; `smash.desc` with an unconstrained bimorphism;
  - mis-typed operad algebras and missing module axioms;
  - the omitted equivariance axiom of symmetric spectra;
  - a stable-equivalence definition that made the main characterisation a tautology;
  - an ungraded exact couple whose spectral sequence was vacuous;
  - vacuous existence statements replaced by the canonical maps (op homeomorphism, product, π₀,
    coverings, fundamental groupoid, local systems, realisation as homotopy colimit);
  - statements marked "not statable" that are statable now stated.
- Every API item, test and node id of the corrected packet appears in the file, as a declaration
  where it can be stated and otherwise as a signature comment with its reason.

## What the revision does

1. Regenerate `research/blueprint/readmes/StableHomotopyKTheory.md` from the corrected packet (the
   original was generated from the packet) and re-check agreement.
2. The packet itself needs no further change for acceptance; the revision's review re-checks the
   reader against it.

## Questions for the orchestrator

1. **Consumers citing moved content.** These nodes in other packets should switch ids:
   - GeneralAlgebraicKTheory K.3 additivity, resolution and dévissage use adjunctions through
     `H.1/natural-transformations-adjoints-contractibility`; the adjunction lemma is `H.1/adjunction-homotopy-equivalence`.
   - KTheoryLowDegrees U.6 uses acyclic maps through `H.3/acyclic-spaces-and-maps`; acyclic maps are `H.3/acyclic-map`.
   - KTheoryFiniteLocalFields L.4 uses Eilenberg–Mac Lane spectra through
     `H.5:spectra/omega-spectra-and-eilenberg-maclane`; they are `H.5:spectra/eilenberg-maclane-spectrum`
     and `/eilenberg-maclane-ring`.
   - L.1 imports Theorem 1.8 as `H.3/plus-construction-universal-property`; it is `H.3/plus-hspace-recognition`.
   - `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum` should cite
     `H.2/levelwise-fibration-realisation` directly.
   - H.4's Segal delooping now cites `H.2/bisimplicial-fibration-pi-kan`.
2. **Stage edges** missing from the atlas, all acyclic and listed in the packet's restructure proposal:
   H.3 → H.4, H.3 → H.5:spectra, H.4 → H.5:spectra, AT stage 6 → H.3 and → H.5:spectra,
   H.2 → K.4:construction, H.6 → S.4, H.6 → RT.5, H.3 → R.3 and T.1:classical → H.3. After the
   corrections no H.5:spectra node uses EnhancedDerivedSheaves:E5:abstract (only H.6's Burklund nodes
   do), so the edge E5:abstract → H.5:spectra could move to H.6.
3. **Tau Ceti.** AlgebraicTopology stage 8 plans relative Hurewicz only for simply connected spaces and
   relative homotopy groups only for NDR pairs; this packet now plans the trivial-action case itself
   and requests the general pairs. Upstream notes 1–3 of the packet stand.
4. **KU.** The test τ_{≥0}KU = ku cannot be stated in H.5:spectra (KU is built in KU-spectra or
   RefinedTraceMethods RT.4); it belongs to the consumer that builds KU.
