# Independent review: Quiver representations, Part II

Accepted as a complete target-level planning pass, with the two explicitly recorded proof gaps still open. All six stages remain `planned`; none is `closed`, and all implementation statuses remain `unchecked`.

Reviewer: Codex, session `codex-MxM2uK`, 10 October 2026. Job: `REV-DESIGN-QuiverRepresentationsPartII`, issue #3600. The original design was submitted by session `codex-JZdBx9` in PR #8623. This session did not write that design.

## Scope and counts

Read the roadmap definition, complete reader document, all packet nodes and suggested file. Checked the binding protocols, the reviewed library audit, supplier statements, pinned declarations and the current upstream roadmap/library. The revised packet contains 35 nodes: 3 definitions, 13 constructions, 17 theorems, 1 comparison and 1 application. Its review records 21 corrected nodes and 14 verified nodes; no nodes were added or left unverifiable. Corrections include test metadata, so a corrected verdict does not always indicate a mathematical error.

There are 62 definition/construction API entries, plus one theorem companion entry, 48 unit tests, 21 planets, 10 confirmed baseline declarations and four supplier requests. Every definition/construction retains at least three tests. The test kinds now use the protocol's vocabulary: 24 computation, 12 degenerate, 3 compatibility, 3 characterisation and 6 non-example. The original `example` kind on all 48 tests was outside that vocabulary, although the packet checker did not reject it.

The node density matches the target-level budget. Interval classification, Krull–Schmidt and general smooth segment classification are imported from their owners. The proof sketches retain smaller steps without manufacturing one node per declaration. The 21 planets name key objects or theorems, including right truncation, generic multisegment duality, admissible images, weighted inclusion chains and the canonical maximal-split theorem.

## Source checks and corrections

The mathematical statements and hypotheses were checked in the following primary sources. All locators in the packet use printed pages, with arXiv v4 numbering for AKY.

| Source | Scope checked and implication |
| --- | --- |
| [Atobe–Kondo–Yasuda, arXiv:2110.09070v4](https://arxiv.org/pdf/2110.09070v4) | §2.1 and §§2.3–2.5, pp.7–13; §§3.1–3.3, pp.14–22. Checked multiplicities, both image directions, generic/admissible loci, Proposition 3.5, the adjacent Proposition 3.7 and the proof of Proposition 2.7. |
| [Mœglin–Waldspurger, *Sur l’involution de Zelevinski*](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002204061) | Introduction pp.136–138; II.1–II.2 pp.148–150; II.4–II.7 pp.160–169; II.10–II.13 pp.173–177. Checked the endpoint order and commuting recurrence against rendered pp.149 and 160. II.6 identifies the generic geometric label with the algorithm; the separate representation identification is the theorem in II.13, pp.176–177. Its complete representation prerequisite chain remains part of G2. |
| [Zelevinsky, ICM 1998](https://ems.press/content/book-chapter-files/27254?nt=1) | §2 p.410, §3 Theorem 1 pp.410–411, §5 p.412. Checked rank and algorithm conventions. Only the adjacent case is planned here; the full 1996 Knight–Zelevinsky proof was not obtained or treated as read. |
| [Goemans–Lim, MIT Lecture 6](https://ocw.mit.edu/courses/18-997-topics-in-combinatorial-optimization-spring-2004/72c5d7935dea64f0e2773ad376f83d5d_co_lec6.pdf) | Theorem 3 and the first inductive proof, pp.6-1–6-2, and the split-poset matching argument p.6-3. The packet uses this finite-poset proof, rather than assuming a matching-polytope proof of Kőnig's theorem. |
| [Zelevinskii, 1981 original](https://www.mathnet.ru/eng/faa1707) | §4.3 and Proposition 4.4, Russian pp.20–21. The finite-orbit conormal involution is identified, but its quoted Pyasetskii input is not a pinned-library theorem. The later representation comparison was still conjectural there; MW II.13 is the proving source. |

The downloaded AKY, MW volume, Z98 and lecture hashes agree with the packet. The MathNet PDF was read through browser extraction; direct downloading returned 403. An English transcription was used only to check notation. No fresh publisher collation of AKY is claimed; earlier published-text evidence and bounded correction searches remain attributed to the earlier independent paper review.

Corrected these locators: admissibility is an unnumbered paragraph on AKY p.16 before Lemma 3.3, not “Definition 3.3 p.17”; Proposition 2.4 is on p.9; the endpoint slip occurs on p.20 before Figure 1; and the representation comparison cites MW II.13 in addition to II.6. Expanded the MW access record to reflect the actual review scope.

Both inherited source issues are confirmed, with a review object naming this job. E1's endpoint is (1,r), as the path definition on the same page requires. Its old arXiv/figure locator was corrected. E2 concerns inconsistent relabeling and shortening notation: retaining original labels 2–5 gives the four shortened intervals [5,5], [4,4], [2,3], [0,2]. The actual interval values and final ramified multisegment are correct. No new source error is asserted.

## Baseline and ownership

Every declaration below was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No citation was removed or replaced. The pinned Tau Ceti quiver file was checked against the shared elaboration build; Mathlib's checkout and manifest identify the exact pin.

| Declaration | Module and hypotheses supplying the needed input |
| --- | --- |
| `TauCeti.QuiverRep` | `TauCeti/RepresentationTheory/Quiver/Representation/Basic.lean`, line 50: path-category functors into modules over a field. It supplies the category, not interval classification. |
| `DirectSum.IsInternal` | `Mathlib/Algebra/DirectSum/Basic.lean`, line 441: bijectivity of the canonical external-sum map for additive subobjects. Applied to the grade submodules. |
| `LinearMap.range` | `Mathlib/Algebra/Module/Submodule/Range.lean`, line 57: the actual image submodule; complex linear maps meet the semilinear-map hypotheses. |
| `Submodule.map` | `Mathlib/Algebra/Module/Submodule/Map.lean`, line 53: pushforward of a submodule under a semilinear map. |
| `Module.finBasis` | `Mathlib/LinearAlgebra/Dimension/Free.lean`, line 334: finite basis for a free finite module with the rank hypotheses. Complex finite-dimensional vector spaces satisfy these assumptions. |
| `Matrix.rank` | `Mathlib/LinearAlgebra/Matrix/Rank.lean`, line 134: natural-number finrank of the matrix map's range over a commutative semiring. Used over ℂ. |
| `MvPolynomial.eval` | `Mathlib/Algebra/MvPolynomial/Eval.lean`, line 256: polynomial evaluation as a ring homomorphism. |
| `TopologicalSpace.generateFrom` | `Mathlib/Topology/Order.lean`, line 70: topology generated by the designated opens. It supplies the construction, not density or irreducibility. |
| `IsIrreducible` | `Mathlib/Topology/Irreducible.lean`, line 52: nonempty preirreducible subset. The packet proves the needed affine-space property separately. |
| `Module.Basis.ofVectorSpace` | `Mathlib/LinearAlgebra/Basis/VectorSpace.lean`, line 152: a basis over a division ring, with the division-ring freeness instance supplying the centralizer coordinate model. |

Read current upstream QuiverRepresentations, including Layers 1, 2 and 5, and SchurWeyl. The quiver supplier requests match the existing representation, Krull–Schmidt and Gabriel targets. The additional integer-window and coordinate comparison stays local. The audit contains no direct reviewed QuiverRepresentationsPartII coverage entry; no named generic commuting-multisegment or ramified maximal-split API was found in the current library search. This is an absence result for that search, not a claim that the libraries contain no related material.

Current upstream TauCetiRoadmap commit `81207c7f16d5abf770f13a7d2bdcdb465c030787` and Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were read without changing or building them. SmoothRepresentationsOfLocalGroups §SR.5.3 and its suggested segment/Zelevinsky declarations already own normalized induction, general segments, Z/L and the general involution. Their segment carrier uses a real start and a unitary cuspidal representation. The integer adapter for an arbitrary unramified character must reconcile that convention.

The early ET.6 request now asks only for these existing-owner inputs. It no longer asks the supplier to export the very geometric comparison being planned here. ET.6's atlas statement includes segment/Langlands classification, but its complete local correspondence and monodromy are not needed by this roadmap. The atlas/upstream SR.5 identity mismatch remains an upstream note for the maintainer.

## API, signature and proof corrections

Moved occurrence-count correctness to MS.0, where occurrence labels first enter the standard block construction. Added grade membership for standard vectors. Replaced opaque matching and antichain maxima in the suggested file with finite feasible sets, using the powerset and cardinality supremum. Their API now exposes feasible matchings, antichains, transitivity and the maximum-bound characterizations.

The old singleton-not-open topology test also holds in the Euclidean topology. Its replacement says that the Euclidean unit disk is not Zariski open, so installing the wrong topology would fail it. The existing polynomial-open and density tests remain.

Made the VN restriction coefficient lift explicit and proved the WL route by grade reflection, adding the VN surjectivity theorem as its direct prerequisite. Completed the nonempty-cut peeling signature with the maximal-part chain weight equal to one, and added the zero-cut companion giving all three zero weights. The reader, packet and suggested file agree on these changes.

The adjacent rank argument keeps duplicate occurrences and isolated rows/columns. The independent-variable minor argument supplies the matching rank, and finite Dilworth gives the deficit. Ram/truncation uses image-admissibility on every iterated image of the same map, with its common shift −1. The maximal-split proof has a decreasing total-length induction and uses reconstruction from actual images and graded dimensions. No arbitrary additivity of dual or ram is asserted.

## Closure and next work

G1 remains the exact finite-orbit algebraic dimension/constructibility bridge for conormal symmetry. The trace and block computations do not prove the smooth orbit, conormal bundle, irreducible component and dense projection statements by themselves. Generic rank existence and the adjacent matching formula have a separate proof route and do not use involutivity.

G2 now records both the actual smooth carrier/normalization adapter and the representation comparison proof bridge. MW II.13 uses its recursion and induced-embedding criteria from II.3, I.7.2–I.7.3 and II.10–II.11. Those inputs still need exact supplier declarations or a local target-level decomposition. The comparison signature remains omitted, instead of being replaced by an abstract oracle. This review verifies the stated target and source route without claiming to have closed that chain.

The orchestrator should retain the precise stage `remaining` lists, arrange closure of G1 and G2, and reconcile the current upstream smooth-roadmap identity before packaging this interface. No review work remains unfinished, and this submission is not a checkpoint.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/QuiverRepresentationsPartII.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/QuiverRepresentationsPartII.lean`: exit zero; 147 warnings, all `declaration uses sorry`, with no other warning or error.
- Checked all 35 node statements/proof sketches/source locators against the reader, all 63 API names and 48 test markers against the suggested file, source equality between packet and roadmap, and the 35 per-node verdicts.
- Independent finite diagnostics checked all 1,001 multisets of at most four intervals in [0,3], at five cuts each: dual involution and degree dimensions, ram/truncation commutation, canonical maximal split, peeling, occurrence-poset width/matching and adjacent dual counts. Separately solved 100 commuting block recurrence systems and checked the rank-17 example. All passed. These bounded checks are not a proof and do not implement the Lean declarations; the diagnostic script stayed in disposable scratch.
- `git diff --check`: clean.

## Per-node verdicts

| Node | Verdict | Check |
| --- | --- | --- |
| `MS.0/interval` | corrected | Interval hypotheses and tests checked; test kinds corrected to protocol values. |
| `MS.0/multisegment` | corrected | Moved occurrence labeling/count to its first-use construction and corrected test kinds. |
| `MS.0/maximal` | corrected | Verified one copy per distinct maximum, including repetitions; corrected test kinds. |
| `MS.1/space` | corrected | Coordinate grading and internal direct-sum baseline checked; corrected test kinds. |
| `MS.1/pair` | corrected | Grade-preserving intertwining and ±1 directions checked; corrected test kinds. |
| `MS.1/standard` | corrected | Added grade membership for standard vectors and checked occurrence basis equations; corrected test kinds. |
| `MS.1/classification` | verified | Finite-window adapter imports parent type-A classification without replanning it. |
| `MS.1/image` | corrected | Checked actual images and the −1 VN shift; corrected test kinds. |
| `MS.1/reconstruct` | verified | Reconstruction recovers non-singletons from the image and singleton counts from dimensions. |
| `MS.2/centralizer` | corrected | Actual commuting submodule and restriction embeddings checked; corrected test kinds. |
| `MS.2/coordinates` | verified | Verified coefficient direction and recurrence against MW II.4 pp.160–161. |
| `MS.2/restrict-up` | corrected | Made the permitted VN image coefficient lift explicit, including zero images. |
| `MS.2/restrict-down` | corrected | Reduced WL restriction to the VN theorem by grade reflection and added that direct prerequisite. |
| `MS.2/zariski` | corrected | Replaced the ineffective Euclidean-topology discriminator by the non-Zariski-open unit disk; corrected test kinds. |
| `MS.2/generic` | corrected | Finite interval ranks recover type on a nonempty polynomial-open locus; corrected test kinds. |
| `MS.2/conormal` | verified | Scoped conormal target and proof route checked against Z81 §4.3 and MW; non-routine dimension/constructibility closure remains explicitly G1. |
| `MS.2/dual` | corrected | Up/down generic definitions and graded dimensions checked; corrected test kinds. |
| `MS.2/involution` | verified | Involution proof route is sound conditional on the explicitly open G1 conormal bridge. |
| `MS.3/admissible` | corrected | Corrected the nonexistent Definition 3.3 locator and distinguished genericity on V from image admissibility; corrected test kinds. |
| `MS.3/image-generic` | verified | Checked nonempty image-admissible construction and rank-minor chart openness, conditional on involutivity. |
| `MS.3/simultaneous` | verified | Finite intersection uses one L and image-admissibility on each iterated image, not separately chosen generic maps. |
| `MS.3/ram` | corrected | Ram convention and unshifted WL-image realization checked; corrected test kinds. |
| `MS.3/commute` | verified | Image equality uses the same commuting pair, with the common −1 shift retained. |
| `MS.4/cut` | corrected | Cut means meeting [a,a+1], and chain weight retains occurrence multiplicity; corrected test kinds. |
| `MS.4/poset` | corrected | Specified finite feasible antichains/matchings and maximum characterizations; moved occurrence_count to MS.0 and corrected test kinds. |
| `MS.4/dilworth` | verified | Finite Dilworth and split-graph path cover argument checked, including duplicate occurrences. |
| `MS.4/rank` | verified | Allowed block entries, isolated rows/columns, and independent-variable minor argument checked. |
| `MS.4/grid` | corrected | Corrected endpoint-error locator and verified path length, boundary vertices and multiplicity weights; corrected test kinds. |
| `MS.4/path-chain` | verified | Checked both inequalities for weighted paths/chains; zero weights preclude a path/chain bijection. |
| `MS.4/adjacent` | verified | Adjacent formula is proved independently of unread higher-power KZ proof; boundary cuts checked. |
| `MS.5/truncate-peel` | verified | Truncation preserves inclusion on surviving intervals; singleton deletion does not change a surviving maximum. |
| `MS.5/chain-peel` | corrected | Completed the suggested nonempty-cut conclusion and added its all-three-weights zero-cut companion. |
| `MS.5/split` | verified | Canonical split induction, degree dimensions and reconstruction checked; arbitrary additivity is not asserted. |
| `MS.5/representation` | corrected | Cited MW II.13, removed the circular supplier request, and made both the carrier adapter and comparison proof inputs explicit in G2. |
| `MS.5/consumers` | corrected | Corrected Proposition 2.4 to p.9; checked rank-17 example and ownership of downstream newform/induction targets. |
