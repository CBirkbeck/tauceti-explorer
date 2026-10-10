# BP-EtaleDualityAndPerverseSheaves--EDC.0~2 — revision completed

Codex, session `codex-rbnZDC`, completed the revision for [issue #6957](https://github.com/CBirkbeck/tauceti-explorer/issues/6957) on 10 October 2026. The packet is `complete` at target level, all eight coverage records are `planned`, and all implementation statuses remain `unchecked`. This is a completed blueprint revision, ready for an independent review.

## Deliverables and preserved work

- [Packet](../packets/EtaleDualityAndPerverseSheaves--EDC.0.json): 52 nodes (4 definitions, 15 constructions, 31 theorems, 1 comparison and 1 lemma), 141 API entries, 76 unit tests, 24 planets, 48 checked baseline declarations, 10 supplier requests and 3 restructuring proposals.
- [Reader](../readmes/EtaleDualityAndPerverseSheaves--EDC.0.md): synchronized statements, hypotheses, proof routes, APIs, tests, sources, ownership and boundaries.
- [Suggested Lean](../suggested/EtaleDualityAndPerverseSheaves--EDC.0.lean): typed API declarations and unit-test examples, against actual pinned carriers where available. All proofs are proposals; no formalization is claimed.

All 50 original node IDs remain. The prior independent-review object is unchanged, including all 50 verdicts and its `needs_changes` outcome. Its findings describe the earlier packet. Source-issue review objects are also historical and unchanged. The next independent reviewer should replace the main review object after checking this revision. The accepted RS-19 restructuring was read and retained.

The review's corrections were rechecked and preserved: finite stratifications and uniform Tor bounds; the F₂/ℤ₃ twist character; the actual derived t-structure and Baer theorem; cartesian-square witnesses and the closed-point base-change non-example; geometric rather than arithmetic Frobenius; reduced top cohomology versus multiplicity-weighted trace; the constant-coefficient trace-isomorphism criterion; self-injective/noetherian coefficient hypotheses; the separate curve proof of alternation in characteristic two; the unit hypothesis for rank-one coinvariant vanishing; Yu's corrected tensor-Hom directions; pure dimensions and proper-pushforward shifts; all-plus Chern signs in the lines convention; and nonzero-coefficient and singular-crossing tests.

## Six internal proof and signature gaps addressed

**Enhanced compactification coherence.** The geometric comparison diagram is now explicit. Exact pullback and extension by zero are localized from complexes through E1; E3 supplies enhanced right adjoints and coherent units. For a proper refinement u, the unit j!→Ru*j′! is an equivalence by proper base change, including zero boundary fibres. The cofiltered compactification category has a contractible nerve. Descent of its equivalence diagram gives a functor with coherent comparisons. Common-refinement diagrams provide composition and cartesian base change from the same units and mates. The plan no longer infers a functor on K-injective subcategories from a termwise resolution.

**Noncircular constructible biduality.** Added `EDC.1:biduality/one-dimensional-dualizing-base`. Its constant étale Λ-base object, closed-point shift −2 and twist −1, and the underived j_* calculation come from SGA 4½ [Dualité] 1.1–1.4, pp. 155–157, using explicit strict-trait Kummer/tame computations. The general theorem follows [Th. finitude] 4.3, Lemma 4.4 and 4.5–4.7, pp. 250–251: formal proper duality carries evaluation to base evaluation; local affine projections and support-dimension induction leave a finite-support evaluation cone; exact pushforward from that support detects it. Reverse exchange is used only after biduality. Coherent O-module duality cannot supply this theorem.

**Trace-compatible smooth purity.** The purity map is defined as the adjoint of the canonical derived trace. The neighbourhood pro-system carries its actual trace augmentation and étale-trace transition maps. XVIII 2.14 and 2.14.4, pp. 561–565, give effacement and factorization through that trace. The Hom-colimit formula 3.1.17, pp. 580–581, identifies the induced stalk map with the specified adjoint. Uniform cohomological windows extend the calculation to unbounded complexes. E1's historical uncertainty is recorded, but the packet now specifies a replacement calculation.

**Singular rational-equivalence descent and intersections.** The weighted supported classes of SGA 4½ [Cycle] 2.3.1–2.3.8, pp. 144–149, supply the missing integral comparison. For div_W(g), use the graph closure in X×P¹. Flatness over P¹ eliminates parameter Tor terms while derived fibre restrictions retain singular divisor multiplicities. Projective-bundle freeness makes the two constant section pullbacks equal. Products use the alternating generic Tor lengths of O_Z⊗ᴸO_W, matched to SF.5's intersection cycle. No singular locus of codimension only r is discarded, and no factorial or very-ample multiple is inverted modulo n. Angéniol §§1–3, pp. 153–158, is an additional public supported-comparison source.

**Self-intersection specialization.** For the imported normal deformation, compare cohomology with support in Z×A¹. Smooth-pair purity identifies it with cohomology of Z×A¹; A¹ homotopy invariance makes the fibre restriction maps isomorphisms. Commuting restriction/forget-support/pullback squares transport i*i! to the normal zero-section operator. Projective completion P(N⊕O), splitting and Cartier normalization compute its pullback as c_top(N) cup the input. The source locators are Laksov–Mumford–Suominen §1, equations (1.4)–(1.7), pp. 118–119, and §2, pp. 120–121; Grothendieck §5, Lemma 3 and Theorem 2, pp. 152–153. No equality of ambient nonproper fibre cohomology is inferred merely from smoothness.

**Lean signature coverage and domains.** All 141 APIs are actual declarations and all 76 tests are attached to `example`s; the 95 formerly comment-only entries are typed. The revision uses genuine constructibility, Tor-amplitude, compactification, fibre-dimension, flat finite-presentation, pure-curve, codimension, smooth-dimension and regular-local-ring predicates. Localization and recollement triangles display their vertices and adjunction maps, with actual open-complement hypotheses. The file includes the finite-module/DVR double dual, full lisse curve pairing, underived j_* duality, constructible recollement preservation, adic derived duality with Ext¹, monodromy coinvariants, Frobenius descent, graded cycles, Chern and projective-bundle formulas, supported purity and singular examples. Excellence and complete stable infinity-category conditions are not available as pinned predicates: they remain explicit in the reader and are honestly omitted in the prototypes under PROTOCOL §13, with no replacement Prop placeholders.

A second new node, `EDC.3/projective-space-basis`, separates the early hyperplane/affine-cohomology computation from the original later degree/cycle-class target. This makes the projective-bundle → cycle-class proof order acyclic.

## Current upstream and supplier ownership

Read current TauCetiRoadmap main at `cd03e06852a13216ad246d0623492c4beac39af2`, including AlgebraicVectorBundles and the relevant JacobianChallenge targets, and inspected the current Tau Ceti library. AlgebraicVectorBundles L0A–L0C is imported rather than planned again. Its import is recorded separately because it postdates the atlas snapshot; SF.0 is its temporary graph integration contract. Pinned Tau Ceti already supplies invertible sheaves, the trivial object, line-bundle classes, their class map and tensor-unit formulas. Six such declarations and the genuine finite-presentation and regular-local predicates were added to the original 40 checked baselines.

SF.5 supplies the exact graded-cycle, chow-group, tor-intersection, smooth-intersection, projective-bundle and normal-deformation node IDs. Apply its quotient projective bundle to E∨ for the lines convention; the complete flag bundle is iterated projective-bundle geometry. The Picard inverse and degree are still JacobianChallenge imports, not purported pinned declarations.

CohomologicalPointCounting's finite-coefficient owners remain ConstructibleEtale, EtaleBaseChange, CompactSupport, EllAdicRealization and TraceFormula, imported through SF.2. Proposed upstream PR196 is not treated as merged current-main content. The strict-trait Kummer/tame computation needed by the base theorem is an explicit lower SF.2 request; it does not introduce an upward dependency on LocalGaloisGroups. The base duality conclusion stays with EDC. A¹ homotopy invariance is also an explicit SF.2 request and is used on the support in normal deformation.

For the two confirmed scope findings, common stack and equivariant operations have one owner, the stacks Part II. The perfect-space Part II imports them and owns only finite-model/perfection transport. RT-AREA-etale/3 consumers, including the named stack paper routes and shtuka/ramified-GCFT Part IIs, remain explicit. RT-AREA-etale/16 retains Zhu's model-independence/orientation gate in the perfect-space extension, with finite-type scheme inputs supplied here. Braden localization belongs to that extension. These are ownership proposals for the maintainer, not implemented atlas edits.

The total Chern class is asserted to be a unit only for quasi-compact X, where a finite trivializing cover bounds nilpotence. The individual classes and Whitney identity keep their general scheme statements.

## What remains outside this completed part

The four retained gaps identify external extensions: higher-dimensional absolute purity and the LPV semistable trait statements; stack operations and stack perverse/trace theory; perfect-space transport and its orientation gate; and the Grothendieck–Ogg–Shafarevich Euler-characteristic layer. Elementary closed-point purity for the dimension-one base is addressed here and does not discharge higher absolute purity.

The ten precise supplier requests remain integration contracts. EDC.4–EDC.8 is the other part of the roadmap; its packaging must import this part's projective-bundle freeness and scheme-level duality rather than rebuild them. The next action for this issue is independent review of the revised targets and proofs, followed by the programme's usual assembly/package work.

## Sources and validation

Only public primary sources were used for the new proof routes. The packet records URLs, SHA-256 values, editions, read dates and locators for SGA 4 XVII–XVIII, SGA 4½, Milne, Stacks, Weil I, Yu's arXiv v5, Angéniol, Grothendieck and Laksov–Mumford–Suominen. All source excerpts were removed, and the source-issue printed descriptions were paraphrased. Source issues E1 and E5 now point to the explicit replacement arguments. No source files or source passages are in the deliverables.

Validation at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json`: **0 errors, 0 warnings**; acyclic graph, all eight stages covered.
- `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.0.lean`: **exit 0**, with `sorry` as its only warnings. Checked available memory before each sequential run; no private build or language server was started.
- Explicit declaration/docstring inspection: **141/141 APIs declared, 76/76 named test examples, 52/52 targets in the reader**, and at least three tests per definition/construction.
- Compared the review object and original IDs with the base commit: **review unchanged, all 50 IDs retained**. All implementation statuses remain `unchecked`; no excerpt keys or dummy `Prop := sorry` definitions remain.
- Submission-path checks and `git diff --check`: passed on the four issue deliverables.

The handoff is self-contained; no scratch files are needed by the next worker.
