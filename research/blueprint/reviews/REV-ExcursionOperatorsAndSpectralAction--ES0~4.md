# Independent review: excursion operators and the spectral action, revision 4

Verdict: **accepted at target level**. This completes issue #10963,
`REV-ExcursionOperatorsAndSpectralAction--ES0~4`. Reviewer: Codex, session
`codex-2c6UEE`, 2026-10-19. This session authored none of the four blueprint
revisions under review. This is a completed review.

All 42 targets were checked, including their hypotheses, proof outlines,
prerequisites, acceptance properties and source matches. The packet records
38 verified and four corrected node findings. All eight stages remain
**planned**, every implementation status remains **unchecked**, and the three
mathematical refinement gaps and eleven open supplier contracts remain explicit.
Acceptance approves the plan's specification and recorded boundaries; it does
not certify proofs or supplier implementations.

## Fixed shape and corrections

The revision 3 rejection concerned mandatory executable coverage of enhanced
targets whose carriers were absent. The binding October 12 shape in
[PACKAGE_REVIEW.md](../PACKAGE_REVIEW.md#shape-of-a-roadmap-maintainer-2026-10-12--binding-for-packages-reviews-and-ports-overrides-older-size-notes)
now assigns those targets to the full README. The October 19 import/example
rules in [UPSTREAM_GUIDE.md](../UPSTREAM_GUIDE.md) also apply. The revision keeps
the enhanced center, coherent action classifications, stacky Perf, integral
approximation and geometric comparisons as precise README targets. It removes
the weaker ordinary forms previously offered for several of them. That
resolves the old signature objection under the current rules. Previous reviews
and their inventories are preserved as history.

I made these additional corrections:

1. Replaced submodule imports with `import Mathlib`, used the standard module
   docstring and namespace, and added mathematical docstrings to the retained
   declarations. The three light definitions retain real bodies over existing
   carriers.
2. Replaced unproved examples with five named theorem targets, all listed in
   the README: `centralSupport_of_faithful_action`, `centralSupport_free`,
   `centralSupport_nilpotent`,
   `support_coefficient_change_requires_End_comparison` and
   `support_coefficient_change_requires_flatness`. Added short proved tests
   for scalar evaluation, unit membership in the annihilator and empty support
   of an object with zero identity. Each of the three definitions has one
   proved example. There are no admitted examples.
3. Removed stale references to `support_triangle_zero_ends`,
   `centralAnnihilator_map_le` and `centralSupport_map`. The first check follows
   from the actual `support_exact_operations` triangle clause and the
   zero-object support computation; `support_compatible_functor` states the
   two containments together.
4. Narrowed the derived smooth-category supplier request to import current
   SR.0d's derived category, standard heart and dg model. The remaining request
   concerns the E5/VS stable infinity-category upgrade and enhanced
   stratum/heart comparison.
5. Narrowed LP0's request to import ClassFieldTheory Layer 9's Weil carrier and
   topology, SR.6.1's finite-wild discretization, and current TauCeti's wild
   inertia/tame presentation. Tensor-compatible refinement of all Hecke legs
   and the pro-p/pro-ell argument remain additional inputs. No topological
   Weil-group declaration in the current TauCeti library is asserted.

No node was deleted or added. Ordinary centers, induction theory, block theory,
derived smooth models and Weil carriers remain supplier-owned. The two
narrowed requests remain open because their additional contracts are not
discharged by the imported foundations.

## Mathematical stress checks

The normalized creation–Weil–annihilation operation has the right identity
test: an identity Weil tuple gives the composite of creation and annihilation,
which need not be the identity. The two-leg GL_n test gives the trace of one
parameter value times the inverse of the other. Twisted cocycles, rather than
ordinary homomorphisms, are used for nonsplit data (VIII.4.2, pp. 291–292;
IX.2, pp. 321–324).

The wild cutoff is uniform over the leg and representation inputs of one
compact object, not over every object of the Ind category. Quotient-equivariant
enhanced descent is stronger than pointwise triviality on wild inertia. The
component decomposition uses idempotents and the universal homeomorphism; it
does not infer an unrestricted integral coordinate-ring isomorphism
(IX.5.1 and IX.5, pp. 327–329).

The rational action and integral approximation have separate constructions and
coefficient hypotheses. The approximation is not silently identified with
actual Perf before LP4's generation input. The rank-zero free-group case is
retained, as are both inverse higher comparisons for the universal action
equivalence (X.1.1–X.1.3, pp. 341–343; X.3.1–X.3.4, pp. 348–350). The sifted
compact-module comparison is not replaced by a filtered-diagram theorem.

For reduced central support, the zero object has unit annihilator and empty
support; a faithful action has zero annihilator and full spectrum. Over dual
numbers, the residue action on the compact object k of Perf(k) has annihilator
(epsilon) but full reduced spectrum. This avoids incorrectly treating k as
perfect over the dual numbers. In the general D(R) triangle arising from
0 -> k -> R -> k -> 0, the endpoint annihilators multiply to an annihilator of
the middle; their intersection need not annihilate it. Rotation uses the
explicit shift compatibility of the central action.

The flat coefficient comparison is sound. Write evaluation as
`R -> End(X), r -> r id_X`. Flat tensoring preserves its kernel sequence.
The supplied S-linear endomorphism comparison sends the tensor identity to
the identity, identifying tensor evaluation with evaluation on Y. Its kernel
is the extended ideal; the prime-spectrum inverse-image formula then gives
support equality. This is a deduction from the pinned flatness and ideal APIs,
also supported by [Stacks Definition 10.39.1 and Lemma 10.39.2](https://stacks.math.columbia.edu/tag/00H9),
not a source theorem attributed to Fargues–Scholze.

Both coefficient controls remain necessary. Over the flat identity map on Z,
the scalar module and zero module have different annihilators despite the
compatible additive zero functor, so compatibility cannot supply the End
comparison. For Z -> Z/2, the Q-object tensors to zero and has the required
identity-preserving End comparison, but the annihilator grows from zero to
the unit ideal: flatness cannot be dropped. The principal support criterion
uses a radical and finite power; constructing the categorical telescope still
requires the named Ind/localization inputs.

Compact lisse duality retains the Chevalley inner correction before quotienting
(VI.12.1, pp. 239–241; Proposition VII.7.6, pp. 274–275; IX.5.3, pp. 329–330).
The general multi-leg local-shtuka comparison retains the pro-p level,
level/tower action domains and trace indices (IX.3.2, pp. 326–327). Ellipticity
uses a finite algebraic centralizer quotient and semisimplicity: the torus,
trivial GL_2 and irreducible GL_n cases distinguish the definition. The residual
stabilizer remains in the elliptic component, and the basic decomposition does
not deduce the conjectural Irr(S_phi) packet identification (X.2, pp. 346–348).

## Sources, baseline and ownership

The [author-hosted Fargues–Scholze PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf)
was freshly fetched on 2026-10-19: 356 pages, SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
Direct PDF-page reads covered pp. 34–38, 239–241, 272–275, 288–293, 318–330
and 339–350. These source locators refer to that author copy; its printed and
PDF page numbers agree. The imported VIII.5.1 generation theorem is checked
as an LP4 contract, without redeveloping its supplier-owned proof here.

E1 is independently **confirmed for that author copy only**, p. 292 in the
proof of VIII.4.1. For trivial dual and quotient groups, W=C2 and a trivial
tensor family over F2, the fold on two legs gives diagonal restriction of
function rings. The pullback has eight elements versus two scalar source
images: a function nonzero on just one off-diagonal pair, together with scalar
zero, is a witness outside the image. Thus the square commutes but need not
be cartesian. Fusion uses commutativity, already supplied by current LP2.

Fresh checks of the publisher record, arXiv record, author publication pages
and a targeted correction search found no relevant erratum. The publisher's
[public ten-page sample](https://smf.emath.fr/sites/default/files/2026-07/AST-466-web__sample.pdf)
has SHA-256 `9988fc40a49c10116c7244591fa4ef8d35e398d2c81bd77990a61aee0b59db66`.
It contains front matter and contents, with different pagination, and not the
proof passage. No full published-text check or author-copy/arXiv byte
equivalence is claimed. The E1 version limit and previous verdicts remain.
No source passages or restricted library files were copied into the repository.

All 34 baseline declaration statements were independently read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, including ordinary CatCenter,
triangulated Hom exactness, prime spectra, ideal maps and flat tensor
exactness. The TauCeti pin remains
`f790474821cf4256814db967cb154e7af3d0c369`; the suggested file imports no
TauCeti module. All eight reviewed AUDIT-20 stage entries were checked. Exact
E5, HS, VS, LP and ES7 supplier statements were read where they support the
prerequisite chains; the packet retains precise requests for the remaining
stage-level input.

Current upstream was inspected read-only at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the SemisimpleAlgebras and
InductionRestriction density models, the relevant SmoothRepresentations reader
and suggested declarations, and ClassFieldTheory Layer 9. The nine
post-snapshot directions and four named Completed roadmaps were screened by
mathematical object. No duplicate enhanced ES target was found.

Current TauCeti was inspected at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Its actual
`TauCeti.wildInertiaSubgroup` (WildInertia.lean:235) and
`TauCeti.tameQuotientEquiv` (Tame/Presentation.lean:398) refine the LP0 boundary.
The current upstream suggested compact induction is open-subgroup algebraic
induction; closed-subgroup induction is a README contract. The ordinary smooth
center also remains a README contract at this current commit, regardless of
older historical executable receipts. These are not enhanced geometric
interfaces, and current-only declarations are not imported at the older pins.

## Remaining refinements and validation

The three recorded refinements remain visible: the DVR highest-weight tensor
filtration for X.3.2; the exact geometric Perf/D_lis/End derived scalar-extension
range; and twisted-invariant vanishing plus the whole-component argument for
elliptic central twists. Eleven supplier contracts remain open, five are
supplied at planning-interface level. They are implementation work identified
by the plan, not checks deferred by this reviewer.

The final inventory is 42 nodes, 38 API items, 31 definition Checks and 26
planets. All ten definition/construction nodes retain at least three
discriminating Checks. The scoped prerequisite graph is acyclic. The Lean file
has 215 lines, three real definitions, thirteen unproved theorem targets and
three proved examples. Its enhanced targets remain in the README with exact
hypotheses, APIs, Checks, source locators and supplier contracts.

Validation: the blueprint checker reports zero errors and zero warnings;
the intake file check reports zero problems; `git diff --check` passes.
`lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES0.lean`
exits 0 at the exact pins with thirteen declaration-uses-sorry warnings and no
other diagnostics. More than 20 GB of memory was available before elaboration.
The three examples use no admitted roadmap results. Reader/declaration
synchronization, complete per-node review coverage, API/Check preservation,
planet limits, source-issue records and the finite E1 counterexample were
checked. Only this job's four deliverables and its own handoff are changed.
