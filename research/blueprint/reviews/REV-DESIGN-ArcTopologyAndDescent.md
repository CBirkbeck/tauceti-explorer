# Independent review: ArcTopologyAndDescent

Accepted after correction, 18 October 2026. Reviewer: Codex, session
`codex-3wgtV3`, job `REV-DESIGN-ArcTopologyAndDescent`, issue #3494.
The original design was written by a different worker. This is acceptance of a
complete target-level planning pass, with the supplier requests and registration
gap below still open. It asserts no implementation or proof completion.

The packet now has 96 nodes: 16 definitions, 7 constructions and 73 theorems.
The per-node review records 58 verified, 37 corrected and 1 added, with none
unverifiable. All 13 stages remain `planned`; every node remains `unchecked`.
There are 98 API items, 79 tests for the 23 definitions/constructions, 59 planets,
19 baseline declarations and 177 routed coverage entries. No stage is marked
closed. Twelve supplier contracts remain: ten open and two supplied by existing
Tau Ceti roadmaps. The packet retains one explicit owner-registration gap.

The source review covered the entire BM21 arXiv v4 paper, the cited passages of
BS17, BS22, CS24, GR24, CMM21, MAT22 and BC22, the Stacks henselian-pair proof,
and the relevant Huber comparisons in the maintainer-cleared edition. The added
references are Bhatt's Tannaka theorem, Huber–Jörder's smooth differential-form
comparison, and the categorical descent corollary in Higher Algebra. Their exact
versions, URLs, hashes, read dates and printed-page locators are in the packet.
The statements and explanations are paraphrases; no source passages or book
files were copied into the deliverables.

**Mathematical and closure corrections.**

| Targets | Correction and reason |
| --- | --- |
| AT.0/valuation-interval | The maximal ideal of `(V/p)_q` is the localized ideal `(q/p)(V/p)_q`. Writing only `q/p` did not specify an ideal of the localized ring. |
| AT.0/valuation-extension | Specified the localization/prime-quotient replacement used to obtain a lifting valuation of rank at most one. Separated the torsion-free flatness, Bézout and local faithful-flatness inputs. |
| AT.1/universal-descent | Replaced the general warning about equalizers by an actual test: for the identity cover with constant value `Z[0]`, totalization is `Z[0]`, whereas the homotopy equalizer of the two identity arrows has an additional `Z[−1]` summand. |
| AT.1/rydh-refinement; AT.1/h-descent-criterion | BS17 Theorem 2.4, p. 5 assumes an affine target. Restricted that assertion, made the Zariski-local use explicit, added the direct refinement prerequisite, and clarified the affine approximation proof. |
| AT.3/finitary | Kept the general definition, but imposed compact generation by cotruncated objects on the affine Zariski-sheaf criterion and its API. Its proof needs filtered-colimit/descent-limit interchange. The infinite-polynomial nonexample now assumes a nonzero base ring. |
| AT.3/boolean-sheaf | Added a compactly generated presentable target, which is needed by the stated stalkwise equivalence detection. The product and ultraproduct formulas themselves are preserved. |
| AT.4/rank-one-detection | The extra space-valued contractibility statement now has one global finite truncation bound, as required by BM21 Lemma 4.10, pp. 29–30. Replaced the unsupported cofinal-tower proof of the extension variant by the diagonal/fibre induction and Cech argument of Corollary 4.12, pp. 30–31. |
| AT.7/constructible-v-hyperdescent | Added the existing Barr–Beck node and an exact E5:abstract request for HA Corollary 4.7.5.3, p. 705. Ordinary monadicity alone did not supply the cosimplicial comparison. The sketch now specifies truncated proper pushforwards as right adjoints, right-adjointable base-change squares, conservative exact pullback and fixed-amplitude totalizations. The SF.2 contract supplies proper constructibility and truncation compatibility. |
| AT.7/h-differential-functor; AT.7/h-differential-arc-descent | Added the direct enhanced-cohomology and cotangent/exterior-power suppliers, and promoted the used smooth-comparison API to the new theorem below. The SF.4 request includes characteristic-zero resolution; SF.2 supplies quasi-coherent affine acyclicity. |
| AT.7/perfect-effective-epimorphisms | Read and added BH16 Theorem 1.5, p. 2: the target algebraic space is qcqs, the source may be any algebraic space, and the functors are exact symmetric monoidal in the enhanced sense. Removed the outstanding source-verification task, but retained the genuinely missing registered supplier. |
| AT.8/gabber-degree-zero | Replaced the insufficient citation to Stacks 59.82.1–3 by Lemma 59.82.6, tag 09ZH. The proof uses connected spectral closures, finite henselian algebras and Lemmas 59.82.2–4. Higher-cohomology effacement is not the proof for arbitrary sheaves of sets. |
| AT.9/proper-rigid-gaga; AT.12/perfectoid-generic-fibre-consumers | Separated Huber's constant-coefficient Corollary 3.2.2, p. 174 from the general sheaf comparisons in Theorems 3.2.9–3.2.10, pp. 180–181. The AdicEtaleGeometry request retains the analytic conditions and properness at the relevant generic points; the perfectoid Tate variant remains a separate required comparison. |
| AT.10/rational-domain-vanishing; /rational-mayer-vietoris; /shrinking-tube-continuity; /constant-affinoid-vanishing; /affinoid-artin-grothendieck | Made the complete algebraically closed nontrivially valued nonarchimedean base field explicit in each independently displayed target. The shrinking-tube statement also fixes a nonzero topologically nilpotent parameter. The distinct general `d+1` and residue-invertible `d` bounds are preserved. |

The added node is
`ArcTopologyAndDescent:AT.7/smooth-h-differential-comparison`, marked
`addedBy: REV-DESIGN-ArcTopologyAndDescent`. It states the derived h/Zariski
comparison of HJ14 Corollary 6.5, printed p. 465, first with the paper's
characteristic-zero, smooth, separated finite-type hypotheses. It explains the
extension by Zariski descent and the ind-smooth affine consequence used in BM21
Theorem 5.14, p. 43. It is a key theorem used by a target, rather than an
additional definition or a decomposition of routine proof steps. No planet was
added, and no other roadmap's construction was replanned.

**Source locators and findings.**

The correction table and per-node records include the following locator repairs:
BM21 Definition 1.1 is on p. 2; Definition 1.2 and Example 1.3 are on p. 3;
Proposition 2.1 is on p. 9; Lemmas 2.21–2.22 are on p. 14; Definition 3.1 is on
p. 16; Definition 3.5 and Example 3.6 are on p. 17. The product-component
reference is Remark 3.16 and Construction 3.17, p. 20, rather than two lemmas.
Proposition 4.15 is on p. 32, so the excision criterion's locator must include
that page. Lemmas 5.1–5.3 and Proposition 5.2 occupy pp. 37–38; Theorem 5.4 is
on p. 38 and Remark 5.5 on p. 39. Removed the nonexistent Example 1.5 citation
from failure of subcanonicity; Warning 4.20, p. 33 and the explicit nilpotent
calculation support it. BS17 Lemma 3.16 is on p. 14, Theorem 11.2 on p. 40 and
Theorem 11.15 on p. 43, with its application/proof on pp. 46–47. Ranges for the
arc/spectral characterization and rank-one detection now include their full
statements. Mixed BM21/BS17/Huber/GR24 references have separate source ids.

All seven existing `sourceIssues` received independent confirmed verdicts with
reasons. E4 is in the proof of Proposition 3.10, p. 19, rather than an Example
3.10; E6's maximum/minimum slip is on p. 58. E7 is a discrepancy between the
introduction and the proved body bounds, not a claim that the stronger
introduction theorem is false. Added E8 for Definition 3.26, p. 22: its monic-root
condition needs an explicit positive-degree qualification. The constant monic
polynomial 1 otherwise excludes every nonzero intended example. The original
packet and Lean predicate already use the right convention; this is a minor
qualification omission, not a new obstruction to the results.

These findings concern the identified arXiv v4 text. The previous reviewed
atlas fixes and public source/version information were checked; the publisher
text could not be retrieved in this run. No finding is represented as a verified
journal error or a published corrigendum.

**Baseline, ownership and reader.**

All 19 declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. None was removed. Replaced the generic
`provides` descriptions with their actual mathematical scope. In particular,
`Scheme.etaleTopology` is the big topology, `DerivedCategory` is ordinary,
`PerfectClosure` is direct Frobenius perfection, and adic completion is not an
unqualified derived-completion or automatic-completeness result. The three
flatness declarations now each describe their own hypotheses and conclusion.
The positive-degree monic predicate, unit reflection and first-order
ultraproduct applications agree with the pinned statements.

Read the exact statements of the 42 distinct external node prerequisites and
the stage-level supplier scopes. The reviewed library audit contains no entry
for this new roadmap; the relevant scheme and enhanced-category audit entries
do not supply the new arc targets. The current upstream roadmap checkout
(`0d144d044dacebca17b654695b6f1ad58f159b27`) and current Tau Ceti library
(`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) were inspected read-only, including
the roadmaps newer than the atlas snapshot. The existing AdicSpaces and
ModularCurves documents were used as nearby examples. Ownership of perfect
v-descent, enhanced categories, analytic geometry, perfectoid algebra and prisms
is preserved. No higher-tier target was introduced as a supplier.

The roadmap descriptions, source records, reader, exact supplier contracts and
representative Lean comments were synchronized. Every final node statement,
proof step, acceptance condition, API statement, test and locator occurs in the
reader. Its worked examples retain the rank-two splitting, noninjective finite
set morphisms, singular differential, coefficient-Tor and parameter boundary
checks. The suggested file retains five light definitions, fifteen theorem
signatures and ten examples; heavy carriers and the new comparison remain
mathematical README targets as WORKERS requires.

**Validation and remaining coordination.**

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArcTopologyAndDescent.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/ArcTopologyAndDescent.lean`:
  exit 0 at the pinned Mathlib, with exactly 25 declaration-uses-`sorry`
  warnings and no other diagnostics. Memory was checked before compilation.
- Reader/packet assertions checked every final target field, baseline
  description, source locator and request; the review covers every node once.
  Source inventories agree between the packet and roadmap, and every node
  remains unchecked. The packet checker verifies the prerequisite graph and
  planet limits. `git diff --check` passed.

The orchestrator should register an owner for the verified algebraic-space
Tannaka contract before closing AT.7. The new categorical-descent request and
the strengthened SF.2, SF.4 and AdicEtaleGeometry contracts also need supplier
follow-through. These are explicit planning dependencies, not unresolved
contradictions or reasons to reject this complete pass. No change to upstream
roadmaps, promotion, or second job is part of this submission.
