# BP-HabiroRings--HR.3 handoff

Issue #6499, by Codex, session `codex-1W5Jdw`, 5 October 2026. The bot confirmed
the claim before work began. This is a completed target-level planning pass,
not a checkpoint. Only the four deliverables for this job are changed.

## Result and coverage

The packet has status `complete`; its sole stage `HabiroRings:HR.3` has coverage
`planned`, not `closed`. The parent packet's accepted five HR.3 nodes are
imported by id, without editing them or duplicating their declarations. This
part adds five nodes: one definition, two constructions, one lemma and one
theorem. It specifies 23 API items and 11 unit tests, cites six baseline
declarations, adds three planets, and records five supplier requests and two
gaps. Together with the parent's two HR.3 planets, the layer has five planets.
All implementation statuses remain `unchecked`.

The new work fixes the conventions for the finite full subposet of singletons
and maximal prime-power chains; specifies the actual coherent completion
diagram with its completed tensor and unit; proves the finite localization
contract on underlying enhanced modules; constructs the inverse by extension
and finite homotopy limit; and states the prime-edge homotopy-equalizer formula
for algebra mapping spaces. The reader document has approximately 3,100 words
and gives every construction's API and discriminating tests.

Nothing is claimed formalized, and no stage is closed. The unresolved parent
categorical boundary is decomposed into exact supplier statements, with an
ownership proposal rather than a second generic theory in HR.3.

## What a follow-up must do

1. Check and accept the proposed ownership refinements in EnhancedDerivedSheaves.
   E0 supplies finite-poset straightening, coherent-section limits/mapping spaces
   and the stable cubical contraction. E3 supplies coherent adjoints and the
   dual full-inclusion right-Kan theorem. E5:abstract supplies monoidal
   localization and both varying-category and fixed-category algebra limits.
   E5:presentability supplies adjoint reversal and finite presentable stable
   category limits. The packet's five `requests` give hypotheses, source
   locators and consuming node ids.
2. Match DD.1's actual completion nodes against the finite-ideal specialization:
   accessible exact Koszul completion, coherent composition, radical/generator
   independence, tensor compatibility, derived Nakayama, closure under limits
   and the underlying-module comparison for completed E∞ algebras. DD.1 is the
   generic owner; EDS E4 is its sheaf application. Do not introduce an ordinary
   quotient-tower formula without its hypotheses.
3. With those enhanced carriers supplied, turn the named mathematical signatures
   in the suggested file into actual Lean signatures and examples. The finite
   indexing declarations already have elaborated signatures. The diagram,
   localization contract, reconstruction and mapping-space statements require
   the real enhanced APIs. No arbitrary proposition field or opaque substitute
   closes that gap.
4. Verify the source's parent arbitrary-poset-site theorem separately if that
   greater generality is required. This finite application only requests finite
   refinement shapes and verifies accessible finite-ideal completion categories.
   Arbitrary reflective subcategories do not automatically supply the requisite
   accessible presentability hypotheses.

Two details deserve attention in review. For right Kan extension the slice is
`(S ↓ j)`: it is empty at discarded intersections, has initial object S when S
is included, and is the single containing maximal chain for a surviving
nonsingleton outside P. General limits are not computed at a terminal object.
Also, the m=6 incidence cycle has no nondegenerate 2-simplices. Objects require
no extra cycle equation; morphisms require specified edge paths, and the
mapping-space formula retains those paths and their higher homotopies.

## Verification

* `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroRings--HR.3.json`:
  0 errors and 0 warnings, using the configured pinned declaration index.
* `lean-check research/blueprint/suggested/HabiroRings--HR.3.lean`: exit 0;
  only ten expected `sorry` warnings. The file imports individual Mathlib
  modules at `082e2d37e8b0463410cdb532e111cd43d5a66174`; it imports no Tau Ceti
  declaration from the shared checkout. Compilation checks the finite-index
  definitions, six theorem signatures and four example signatures. It does
  not prove those statements or check the mathematical comments describing
  unavailable derived/operadic signatures. Memory was checked before this
  single compile; no Lean server or background compiler was started.
* Exhaustive bounded combinatorial checks for m=1 through 60: 8,122 nonempty
  divisor subsets. Checked chain containment/incomparability, unique
  prime-edge factorization and all pointwise right-Kan slices. In particular,
  P(1), P(4), P(6) have 1, 4, 8 vertices; P(6) has 8 incidence arrows and 4
  prime edges. These checks validate conventions, not cyclotomic ideal
  arithmetic or categorical proofs.
* New ids are disjoint from existing packet/decomposition ids. The reachable
  node graph has 33 nodes and no cycle. The existing atlas and packet-stage
  graph has no reverse HR.3-to-supplier path for any of the five requested
  suppliers, so these requests introduce no stage cycle. Every proposed API
  and test name is represented in the suggested file, as a declaration in its
  namespace or as an explicitly omitted mathematical signature.
* File intake validation and whitespace validation were run before submission.

## Sources and boundaries of reading

The blueprint and expansion protocols, upstream guide, parent packet/review,
reviewed HR.3 audit, HR.3 stage and incident links were read. For style, the
upstream AnalyticToricGeometry and AlgebraicTopology roadmaps were read in full.
Supplier E0/E3/E5 and DD.1 statements and available E0/E5 packet nodes were
examined rather than treated as implemented libraries.

Public source versions, accessed 5 October 2026:

* Wagner, [q-Hodge complexes over the Habiro ring, arXiv:2510.04782v2](https://arxiv.org/pdf/2510.04782v2):
  §1.22(c)–(d), pp. 11–12, and §2.1–2.6, pp. 13–15, including the full
  Corollary 2.4 proof and Lemma 2.2 proof sketch. PDF SHA-256
  `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`.
* Lurie, [Higher Algebra, 18 September 2017](https://www.math.ias.edu/~lurie/papers/HA.pdf):
  Lemma 1.2.4.15 and Proposition 2.2.1.9 with proofs; Definition 2.1.3.1;
  statements of Proposition 3.2.2.1, Warning 3.2.2.2 and Corollary 3.2.2.3,
  with the short corollary proof. The long proof of Proposition 3.2.2.1 was
  not audited. PDF SHA-256
  `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3`.
* Lurie, [Higher Topos Theory, 9 April 2017](https://www.math.ias.edu/~lurie/papers/HTT.pdf):
  Theorem 3.2.0.1 statement, Corollary 3.3.3.2 with proof, Definition
  5.5.3.2 and the adjoint-reversal/limit results 5.5.3.3–5 and 5.5.3.12–13
  with proofs. The long straightening proof was not audited. PDF SHA-256
  `58855f3a0ad6d9c470ded74a38938b9468927592e9ae1209bab6a068e67ede6e`.

No needed public source was inaccessible, and no additional source mistake was
established. The companion-paper ideal arithmetic is imported through the
parent's reviewed intersection node, not re-extracted. The parent's corrected
source statements and source issues remain with that parent packet. Source
downloads and compilation logs were scratch artifacts; their relevant results
and checksums are recorded here and in the packet, and they are not committed.
