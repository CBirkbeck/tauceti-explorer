# Independent review of the genus-one Part II design

Job: `REV-DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII`. Reviewer:
Codex, session `codex-Gmc801`, 5 October 2026. Input: issue #3580 and the
roadmap, packet and suggested file named there. This session did none of the
design work. **Verdict: needs_changes. This is a completed review, not a
checkpoint.** No implementation or atlas promotion is claimed.

The mathematics has a substantial, honestly partial plan. The remaining reasons
to return it are the target-level granularity and insufficiently discriminating
tests for actual comparison maps. The seven partial stages, unacquired recursive
sources, and missing geometric certificates are valid follow-up boundaries when
stated precisely. The raw count exceeding the approximate budget is not by
itself a reason for this verdict.

## Inventory and scope of verification

| Item | Reviewed inventory |
| --- | ---: |
| Node contracts | 776 |
| Definitions / constructions | 17 / 100 |
| Lemmas / theorems / comparisons | 622 / 28 / 9 |
| Pinned baseline declarations | 546 |
| API entries | 486 |
| Test references across all nodes | 487 |
| Tests counted for definitions/constructions by the checker | 432 |
| Planets | 29 |
| Supplier requests / gaps | 23 / 18 |
| Routed source items | 78 |
| Source findings with independent verdicts | 27 |
| Stage coverage | 7 partial; none planned or closed |
| Per-node review verdicts | 685 verified, 35 corrected, 56 unverifiable |

Every node's statement, hypotheses, prerequisites, proof outline, source match,
API and tests was read. The packet's `review.checked` retains all 776 identifiers.
“Verified” describes a mathematical planning contract within its stated scope;
it does not mean a kernel-checked implementation. Of the 56 unverifiable entries,
three concern deficient comparison tests; the others retain source, supplier or
geometric certificates that this review cannot certify. Those open certificates
are not an additional reason to reject an otherwise sound partial pass.

All 546 cited declaration statements and ambient hypotheses were inspected at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Exact names exist, including the
instance declarations that a simple declaration-header search misses. The
reviewed R11 library audit and `REV-AUDIT-10` were read. Existing regular models,
intersections, equation-side reduction, isogenies and abstract lattices remain
imports. The upstream StableReduction and EllipticCurves roadmap contracts were
read, including the restriction to smooth generic curves and the difference
between an equation/point-group interface and a scheme-level presentation.

The direct-prerequisite graph is acyclic, with 2,840 edges after correction.
No closed or planned stage has an unrealised target. The exact SF.0 exports
`flat-annihilator`, `ideal-comap-top` and `ideal-restrict-top` have the generality
needed by the conductor consumers; they are planned supplier exports, not
library implementations. Other broad requests still need exact supplier nodes
as those owners refine their plans. Their current unresolved scope is retained.

The reserved `key/ferrand-pushouts` definition occurs once. Its definition,
sample API and tests distinguish geometric structure-sheaf pushouts from
topological quotients, scheme existence from algebraic-space existence, full
conductor ideals from radicals, and split, nonsplit, cusp and nilpotent cases.
Finite pinching of algebraic spaces does not inherit the scheme-only compatible
affine-neighborhood assumption. General space signatures are honestly omitted
until the SF.1/SF.3 carriers and descent interfaces are available.

## Corrections applied

1. The G.6 roadmap description omitted the at-most-one rational base point
   whose fiber is semistable or smooth supersingular. This hypothesis now agrees
   with the classification nodes. The G.4 summary retains it for the large-fiber
   and additive-fiber consequences as well.
2. `G.5/nonrational-nonzero-j` confused one closed degree-two bad point with
   one geometric fiber. Models 2 and 14 each have the closed point
   `t²+t+1=0`, giving two conjugate geometric I₁ fibers. The acceptance text now
   names both exceptions and the absence of an F₂-rational base point.
3. `G.3/canonical-degree` cited Bombieri–Mumford Theorem 2(iii). The scanned
   source places the degree formula in 2(iv), printed p.27, with proof on p.29.
   The mathematical formula was already correct.
4. Forty-two excerpt entries were not literal source text: both entries for
   each of the sixteen conductor-section nodes used “conductor section rings”;
   the ten final nilpotent-section nodes used “ideal” for 0ET0. They now use
   literal source words, retaining the explicit authored-deduction explanation.
   Lang's “Then H has a rational point.” is present in the scanned original;
   it was not changed on the basis of a failed text-extraction match.
5. One baseline `provides` claim attributed an isomorphism conclusion to
   `IsFinite.iff_isIntegralHom_and_locallyOfFiniteType`. Its actual statement
   supplies the integral-map hypothesis. The consumer now explicitly invokes
   the separate anonymous `[IsIntegralHom f] : IsIso f.toNormalization`
   instance in the pinned normalization module, line 283. See
   [the finite-map criterion](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Finite.lean#L100)
   and [the normalization instance](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Normalization.lean#L283).
   No baseline citation was removed; no new baseline name was invented.
6. Six redundant SF.0 stage dependencies were removed from the conductor
   flat/localization/ideal-sheaf/quotient/geometric/comparison nodes. Their direct
   native and internal chains already reach the exact exports. The general SF.0
   request now separates those known planned exports from still-needed inputs.
7. Roadmap and packet summaries and G.0/G.1 remaining lists accumulated
   incompatible checkpoint frontiers and obsolete node counts. They now describe
   the current plan. Existing absolute-normalization, conductor-sheaf, all-open
   reconstruction, additive ShortExact and Scheme-descent targets are no longer
   described as absent. P¹/Proj, projectivity, cohomology, I₂, space signatures
   and three-step coherence remain distinct obligations.
8. Gap text no longer requires splitting each long model proof into helper
   nodes. The obsolete 0C6L matrix-bound dependency was removed: the actual
   conductor argument does not use that source proof. Its source finding remains.
   A precise gap records the comparison tests still needed. There remain 18 gaps.
9. A module doc comment between imports made the suggested file syntactically
   invalid. Imports now precede that comment. The header and the absolute
   comparison comment describe current planning status without stale progress
   claims.

These changes correct 35 node objects, one baseline description, the roadmap,
summary/frontier metadata and the suggested file. **No nodes were added or
removed**, and all implementation statuses remain `unchecked`.

## Required revision

The issue explicitly sets target-level planning: one node per target, definition
or key theorem needed on the way, without splitting proofs into lemmas. Many
later nodes instead promote routine coordinates, projections, inverse laws and
proof packaging. Examples include `quadratic-infinity-to-from` and `from-to`,
the coordinate/round-trip chain `overlap-equiv-*`, the relative-normalization
round trips, and the separate target/source tower projection equations. These
are useful API or proof steps; usefulness alone does not make each a key target.

Consolidate these families into their owning construction API and target proof
outlines. Keep genuinely reusable key theorems such as conductor reconstruction,
localization, the sheaf ShortExact sequence and flat-conductor comparison.
Preserve mathematical contracts and provenance, and rewrite dependent references
and route coverage coherently. A mass deletion in an independent review would
leave the current identifier/dependency structure unreliable; the review retains
it for a deliberate revision. Counting all 622 lemmas as invalid would also be
wrong: several are legitimate model or application targets.

At least the following constructions still fail the three discriminating-test
requirement. Their present tests also pass for plausible wrong definitions.

| Construction | Existing weakness | Required coordinate-sensitive checks |
| --- | --- | --- |
| `global-normalization-chart` | Three repetitions of finiteness | Pullback of q and tq under the actual Spec inclusion; cusp localization inverse; split/nonsplit branch and overlap coordinates |
| `relative-normalization-sections-iso` | Abstract inverse and cancellation laws | Integral-closure inclusion after the comparison equals the actual `toRelativeNormalization.app`; coefficient action; restriction on a nontrivial principal open |
| `normalization-function-field-map` | Preservation of zero, one and nonzero elements | Actual generic-germ images of q and tq in the cusp and nonsplit F₂ cases; the common infinity coordinate u in the split case |

Use native chart, section and germ maps in these tests, not assumed coordinate
certificates. Keep the existing generic laws as supplementary API. All 681 named
declaration contracts, 486 API entries and 487 test references have a matching
name or short name in the suggested file or its explicit omission ledger; that
textual coverage does not resolve these mathematical test weaknesses or prove
that full signatures elaborate. The 29 planets name key objects/theorems rather
than these helper proof steps.

## Sources and independent checks

Public editions used for node passages and bounded source-finding checks:

| Source | Public edition and checked passages |
| --- | --- |
| Schröer | [arXiv v3](https://arxiv.org/pdf/2004.07025v3), relevant §§2–4, 7–10 and source-finding locators; no fresh claim about published persistence |
| Ferrand | [BSMF 131 (2003)](https://www.numdam.org/item/BSMF_2003__131_4_553_0.pdf), affine/module construction and §7.1, including its scheme criterion |
| Witaszek | [author manuscript](https://par.nsf.gov/servlets/purl/10429755), geometric pushout and conductor passages, including Definitions 2.17/2.27 and adjacent hypotheses |
| Temkin–Tyomkin | [public v3](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf), §§3.4, 4.1, 5.3 and 6.2, including finite-space existence |
| Liu–Lorenzini–Raynaud | [article](https://www.math.u-bordeaux.fr/~qliu/articles/LLR.pdf), 5.9, 6.6 and 7.1, with [corrigendum](https://www.math.u-bordeaux.fr/~qliu/articles/CorrigendumToNeronModelsLieAlg.pdf); algebraically closed residue field retained |
| Szydlo | [public manuscript](http://szydlo.com/imperfect92803.pdf), invariant formula (4), translated-form/Tate tables, including Table 7 |
| Bombieri–Mumford | [scanned original](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf), Theorem 2 and Proposition 4 with their proofs, printed pp.27–30 |
| Serge Lang | [scanned original](https://wstein.org/papers/bib/Lang-Algebraic_Groups_Over_Finite_Fields.pdf), group theorem and corollary; scanned rational-point sentence checked directly |
| Cossec–Dolgachev–Liedtke | [April 19, 2024 author edition](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf), printed pp.267–268, 365–366 and 394 for the eight findings |

The Stacks passages were checked at the packet's exact tags:
[04D1](https://stacks.math.columbia.edu/tag/04D1),
[082J](https://stacks.math.columbia.edu/tag/082J),
[04S6](https://stacks.math.columbia.edu/tag/04S6),
[02X4](https://stacks.math.columbia.edu/tag/02X4),
[05Z2](https://stacks.math.columbia.edu/tag/05Z2),
[0417](https://stacks.math.columbia.edu/tag/0417),
[07T8](https://stacks.math.columbia.edu/tag/07T8),
[0BBY](https://stacks.math.columbia.edu/tag/0BBY),
[0E25](https://stacks.math.columbia.edu/tag/0E25),
[0ECH](https://stacks.math.columbia.edu/tag/0ECH),
[00IT](https://stacks.math.columbia.edu/tag/00IT),
[09MQ](https://stacks.math.columbia.edu/tag/09MQ),
[0C6L](https://stacks.math.columbia.edu/tag/0C6L),
[0ET0](https://stacks.math.columbia.edu/tag/0ET0),
[0ECI](https://stacks.math.columbia.edu/tag/0ECI),
[0B7J](https://stacks.math.columbia.edu/tag/0B7J),
[08KH](https://stacks.math.columbia.edu/tag/08KH),
[00DF](https://stacks.math.columbia.edu/tag/00DF) and
[01JO](https://stacks.math.columbia.edu/tag/01JO).
The complete current 0ECH section and its comments distinguish present notation
errors from earlier author corrections. The entire public
[00DF correction patch](https://github.com/stacks/stacks-project/commit/aee70b2c90b64dc043aa7740e0d9c9346aa4323f.patch)
was read: its 24 July 2025 change tests exactness by Hom into every module P.
That finding is historical and already corrected, not a current false lemma.

All 27 inherited source findings have `confirmed` verdicts with individual
reasons. This confirms the bounded error at each locator; it is not an exhaustive
erratum search. For ES29/ES34, the omitted twisted-case example refutes the
printed list, but this session has not reproduced the earlier review's claimed
exhaustive fourteen-class search. The packet's geometric and completeness gaps
remain explicit. No new source finding was added.

Independent finite computations, separate from earlier workers' evidence:

- Enumerated all 32 binary coefficient tuples and the eight admissible changes.
  Checked the sixteen smooth witness rows, all 1,024 point-equation transport
  tests, inverse changes and five disjoint orbits of sizes 2,4,4,4,2. Point counts
  are 1,2,3,4,5. The characteristic-two addition law reproduces every pair in all
  five listed point-group cycles, including the order-four E₄ generator.
- For every modelData tuple, interpreted coefficientBits as coefficients of
  t^j, checked degree bounds, Δ and c₄³/j identities, the reversed-chart identity
  Δ′=s¹²Δ(1/s), and each smooth fiber count at t=1. In characteristic two the
  calculation uses b₂=a₁², b₄=a₁a₃, b₆=a₃²,
  b₈=a₁²a₆+a₁a₃a₄+a₂a₃²+a₄² and
  Δ=b₂²b₈+b₆²+b₂b₄b₆. This does not certify all-place resolutions or completeness.
- Checked the omitted model `y²+txy+t³y=x³+x²` by hand: y↦y+x at zero gives
  a₂=t, a₄=t³ and the split I₂* tests; the final polynomial X²+X splits over F₂.
  At infinity its node has tangent X²+XY+Y², giving nonsplit I₂. The resulting
  rational-fiber counts are 15+4+6=25. This is a bounded counterexample check,
  not the missing general algorithm-to-scheme implementation.
- Enumerated all 32 matrices `[[λI₂,M],[0,λI₂]]` over F₂ and all 1,024 products.
  They form a commutative unital five-dimensional subalgebra of M₄. This refutes
  the bare dimension bound invoked in 0C6L, without disproving its curve lemma.

The original EGA/Raynaud editions, the full rational-surface proof, the general
Tsen proof, recursive quasielliptic sources and William Lang (2000) have not
been newly source-closed in this review. The gaps describe those limits rather
than treating consumer citations as completed prerequisite proofs.

## Validation and orchestrator handoff

`python3 scripts/check_blueprint.py` on this packet reports **0 errors and
0 warnings**. Independent integrity checks confirm the full review ledger,
source-finding verdicts, unchanged identifiers, acyclic references and unchecked
implementation status. `git diff --check` passes.

`lean-check` was run on the canonical suggested file with the shared build after
checking available memory. The first attempt exposed the misplaced doc comment;
after correction, Lean stopped at the unavailable object file for
`TauCeti.AlgebraicGeometry.Modules.RationalFunctions`. No elaboration beyond
that import, and no whole-file success, is claimed. No library build, cache
download, language server or separately authored Lean artifact was run.

For the orchestrator: route a revision that consolidates the proof-step families
and supplies discriminating comparison tests; retain the existing honest partial
stage boundaries. Decide the target/API mapping before redirecting the numerous
helper identifiers. Keep generic missing results with their current owners and
request exact exports as they become available. Refresh the companion reader
from these corrections in an authorised job: that reader is outside this
review's deliverables. A complete surface-classification certificate remains a
separate follow-up, and this review does not promote the packet.
