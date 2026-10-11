# Handoff — BP-EnhancedDerivedSheaves--E5 (issue #720)

Agent: Codex, session `codex-Q7tgGA`, branch `codex-Q7tgGA-e5`.
Bot-confirmed claim: issue comment 6103905427, 11 October 2026.
This run completes one planning job and claims no second job.

## Completed planning pass

Packet status is `complete`: all six scope stages are `planned`.
**None is closed or implemented.** All implementation statuses are `unchecked`.
The 44 targets comprise 11 definitions, 13 constructions, 17 theorems and
3 comparisons, with 78 API items, 72 named unit tests, 19 planets and 19
checked pinned-baseline declarations. Four gaps, seven requests, three
structural proposals and six groups of signature omissions remain explicit.

| Stage | Nodes | Status | Refinement before closure |
| --- | ---: | --- | --- |
| E5 | 1 | planned | Integrate the common enhancement, cotangent and spectral acceptance diagram. |
| E5:abstract | 19 | planned | Refine E0/E3 dependencies; supply E2 Amitsur and general uniform-index inputs. |
| E5:presentability | 14 | planned | Refine coherent signatures and the continuous-module adapter; specify broader categorical continuity. |
| E5:animation | 7 | planned | Supply coherent Witt-fibre p-annihilation and E2 bounded-totalization interfaces. |
| E5:cotangent-export | 2 | planned | Integrate DD.0 and the rational commutative comparison, preserving their hypotheses. |
| E5:spectra-comparison | 1 | planned | Integrate H.5 model axioms and E1's enhanced comparison. |

The reader and suggested file agree with the packet. Every definition and
construction has at least three discriminating tests. Theorem acceptance
checks include concrete examples and false-neighbour obstructions.

## Continuation and corrections

This continues Claude Code's merged checkpoint (PR #2869), using the expanded,
unmerged submission by Codex session `codex-ivBbmv` (PR #8009) as source leads.
All 22 original checkpoint ids are preserved. This submission supersedes
#8009's proposed version; it does not close that pull request. Sources,
supplier statements and baseline declarations were independently rechecked
for this planning job.

Substantive corrections made here:

- NS A.7 gives a lax all-object localization map; the strong comparison is
  between the cofibrant localization and the category with derived tensor.
  NS A.16–A.17 glue over infinity-categorical colimits, not strict simplicial
  pushouts. Weak-equivalence preservation is sufficient for preservation of
  original cocartesian lifts; no necessity claim is made.
- Uniform descendability keeps the source algebra fixed and requires a common
  index. General filtered indexing requires finite derived-limit cohomological
  dimension; the sequential bound is `2m`. Mathew's countability theorem bounds
  generators and relations. The existing citation discrepancy is recorded
  without starting an errata job.
- Tensor inversion uses the PrL telescope and colimit-preserving strong
  monoidal functors. Compact mapping comparisons specify filtered indexing.
  Representable presheaves have the correct contravariant orientation.
- Compact assembly implies dualizability in the stable setting. The filtered
  compact-object comparison uses Efimov v4 Proposition 2.70 and BM Lemma 10.5,
  without substituting a geometric Kunneth assertion or compact generation.
- A genuine derived Witt test retains nonzero first homotopy of a polynomial
  self-pushout; a pi-zero-only substitute fails it. Bounded space totalization
  uses stage n+1 with a common bound, while the spectral case gives a degreewise
  window. DD.0's quotient test requires a finite regular sequence. The dual-
  number augmentation has nonzero degree-minus-two cotangent cohomology,
  detecting naive truncation. Positive-characteristic spectral commutative
  algebras are not identified with animated rings.

## Baseline, sources and ownership

Mathlib was checked at `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369`. The accepted AUDIT-22 coverage was
read. All 19 baseline declarations were read in pinned source files and
checked against the declaration index. Existing ordinary Ind, Karoubi,
symmetric monoidal, Witt, simplicial-ring, regular-sequence and square-zero
carriers are imported rather than rebuilt.

Current TauCetiRoadmap main was read at
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti was searched at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. DGAInfinity and
StablePeriodicCurved's README and Suggested files were read for ownership and
style. ProfiniteCohomology's discrete coefficients and all-degree finite-
quotient signatures were checked directly: Layers 0 and 10 are imported;
Layer 4 alone supplies degrees zero through two. All link-map entries
mentioning EnhancedDerivedSheaves were read. None supplies an additional
concrete E5 construction. No current upstream roadmap was replanned.

The relevant target statements and proofs in 13 public PDFs were read on
11 October 2026. Exact URLs, editions, hashes and locators are in the packet:
Lurie's Higher Algebra and Higher Topos Theory; Bhatt–Scholze's Witt paper;
Nikolaus–Scholze; Mathew; Robalo; Scholze's Berkovich motives and diamonds;
Fargues–Scholze; Bhatt's direct-summand paper; Ramzi's dualizable v1 and locally
rigid v2; and Efimov v4 (5 October 2026). HTT PDF pages exceed printed pages
by 18; FS21 has inserted pages and varying offsets. Ramzi's rigidity criterion
is v2 Corollary 4.60. No inaccessible-source dependency or copied passage
remains. The sourceCoverage ledger accounts for every routed issue item;
prismatic item 48 and trace-review item 5 are consumers of these targets.

## Remaining obligations and requests

1. **Abstract supplier refinement.** E3's broad Kan/adjoint prerequisites in
   the E0–E4 packet include concrete E1/E2/E5 applications. Isolate generic
   statements, preserving ids, to remove application-to-foundation edges.
   E0 must expose restricted operadic shapes, coherent functor categories,
   mapping-space composition and transformations. This packet's internal
   graph is acyclic; combined closure is not claimed.
2. **Amitsur and general index.** E2 must supply the cubical/bar-to-partial-
   totalization pro-comparison and multiplicative derived-limit filtration
   for finite cohomological dimension. BS17 Lemma 11.22 gives the sequential
   argument. Pro-equivalence gives no termwise ordinary Tot fibre formula.
3. **Witt fibre.** Construct the fibre-level Frobenius nullhomotopy and use
   the existing Witt identity to prove p-annihilation. Homotopy-group torsion
   alone does not prove a nullhomotopy of the map.
4. **Profinite categorical continuity.** Finite actions, specified finite-
   quotient actions and the discrete-continuous-module adapter have models.
   General categorical actions need a topology or condensed model; no
   universal categorical fixed-point filtered-colimit formula is asserted.

Seven requests name E0 (coherent restricted interfaces), E1 (concrete modules,
perfect-ring Tor and geometric specialization), E2 (towers, totalization and
h-descent), E3 (generic dependency refinement), E4 (adic/Amitsur completion),
and upstream ProfiniteCohomology Layers 0 and 10 (existing coefficient and
cocone interfaces). Each request identifies its consuming node ids.

Ownership stays fixed: E0 owns minimal stable/exact APIs; their E5 ids are
monoidal comparisons. E1 imports E5 generic presentability. DD.0 owns cotangent
complexes and H.5 concrete spectra; they enter only return branches and the
common acceptance diagram. E5 owns dualizable/assembled/rigid categories
without compact generation. E2 owns Roos/Milnor and pro-tower theory;
CompletedCohomologyPartII and ArithmeticGaloisDuality must import it.
RefinedTraceMethods and the Berkovich continuation import E5 categorical
inputs. No upward prerequisite was introduced.

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/EnhancedDerivedSheaves--E5.json`
  with the pinned declaration index: 0 errors, 0 warnings.
- `research/blueprint/intake.py check-files` for all four deliverables:
  0 problems.
- `lean-check` for the suggested file: **compiled**, exit 0, 346 warnings,
  all exactly `declaration uses sorry`; no other warning or error. Checked in
  the shared pinned build without a language server or build.
- Structural checks: original ids retained, routed items covered, internal
  graph acyclic, API/test names in reader and prototype, planet counts at
  most six per layer.

Where coherent interfaces are unavailable, the prototype exposes data and
homotopy-category consequences. HEquiv explicitly means an ordinary homotopy-
category equivalence. Cocartesian axioms, accessibility, coherent monads,
duality triangles and other omissions are listed in signatureOmissions,
not hidden in arbitrary proposition fields. Elaboration certifies displayed
types, not those stronger assertions.

Independent review is next. Packaging must reconcile supplier obligations,
refine full coherent signatures and check accepted bundle tiers; E5 is outside
the current upstream tier. No scratch file is needed to resume: the four
deliverables hold the work.
