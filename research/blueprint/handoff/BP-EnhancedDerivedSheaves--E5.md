# Handoff — BP-EnhancedDerivedSheaves--E5, issue #720

Agent: Codex (GPT-6), session `codex-ivBbmv`, branch `codex-ivBbmv-e5`.
The bot confirmed the claim at comment 6081559279. This run submits one
completed planning pass for independent review and stops.

The packet has 44 targets: 11 definitions, 13 constructions, 17 theorems and
3 comparisons; 78 API items, 72 unit tests, 19 planets and 16 checked baseline
declarations. All 22 inherited target ids are retained. The packet is
`complete`. E5, E5:abstract, E5:presentability, E5:animation,
E5:cotangent-export and E5:spectra-comparison are all `planned`; none is
`closed`. Every implementation status remains `unchecked`.

The reader states exact targets, hypotheses, proof sketches, supplier
interfaces, APIs and tests in our own words. It includes the added paper
routes' item-to-owner ledger. No source passage or excerpt is retained;
`sourceIssues.printed` is also a paraphrase, following the standing rule.

## Validation and prototype limits

- The packet checker with the pinned declaration index: **0 errors,
  0 warnings**.
- Intake's file check for the four permitted deliverables: **0 problems**.
- The suggested file **elaborates with `lean-check` at pinned Mathlib**,
  with 337 warnings, all declarations using `sorry`.
- API/test-name manifests agree across the packet, reader and suggested
  file. Original target ids, unchecked statuses, the local acyclic node
  graph, permitted paths and diff whitespace were checked.

Compilation verifies the displayed types. `signatureOmissions` records
missing higher equivalence, fibration, accessibility, model, preservation
and action-coherence predicates. The prototypes use existing simplicial-set
and quasicategory carriers; `HEquiv` gives only a homotopy-category consequence
of the reader's stronger equivalence. Stable/thick closures have genuine
inductive rules. Compact maps quantify over small ordinary filtered shapes,
with h-category diagonals and omitted higher filler compatibility.
Siftedness's cofinality predicate is omitted; concrete product failure/success
tests replace its prototype, not its definitive definition. None of these
signature limitations is claimed implemented or mathematically sufficient.

## Sources and conventions

Public author/arXiv PDFs were read for the targets. URLs, read dates, hashes
and theorem/section/page locators are retained in the packet. No private
reference was needed; no unidentified-source gap remains.

- *Higher Algebra*, 18 September 2017: the relevant monoidal, operadic,
  module, Ind, categorical-tensor, Barr–Beck and dg/spectral comparisons.
  Definition 2.1.2.13 is page 182, Definition 2.1.3.1 page 184, and module
  Definitions 4.2.1.12–13 pages **506–507**. The inherited module pages
  381–384 were incorrect.
- *Higher Topos Theory*, 9 April 2017: idempotents, compactness, Ind,
  presentability and limits, animation and rectification. PDF pages are
  printed pages plus 18. Definitions 5.3.5.1 and 5.5.0.1 are printed pages
  403 and 456 respectively.
- Bhatt–Scholze's Witt affine-Grassmannian paper and Nikolaus–Scholze's
  cyclic-spectra paper: their routed categorical targets, Frobenius,
  descendability, Witt, quotient and localization inputs. NS appendix
  locators use author-PDF pagination.
- Mathew's stable-homotopy Galois paper: Proposition 3.25 concerns finite
  limits **of categories**, and Corollary 3.33 controls generators **and
  relations**. The already-routed countability citation gap is recorded
  without initiating a source or errata job.
- Scholze's Berkovich motives author PDF, Ramzi's dualizable paper v1
  (28 October 2024), and locally rigid paper v2 (9 February 2026).
  The rigidity criterion is Corollary **4.60** in this v2. Ramzi Proposition
  1.62 and BM Lemma 10.5 support strongly continuous colimits; an unverified
  old Efimov proposition number is not used.
- Robalo's tensor-inversion paper and the Fargues–Scholze, diamonds and
  Bhatt direct-summand papers, for the routed uses and scope boundaries.

The upstream DGAInfinity and StablePeriodicCurved roadmaps were read fully
as style and ownership checks. ProfiniteCohomology is imported unchanged:
Layer 0 supplies discrete continuous coefficients and Layer 10 the
all-degree finite-quotient cocone. Layer 4 alone gives degrees zero to two.

## Remaining obligations and next step

Four explicit gaps remain:

1. **Cross-part dependencies.** E1's concrete presentability target imports
   E5, while existing E3 Kan/adjoint nodes carry broad E1/E2/E5 stage inputs.
   Isolate their generic statements from concrete applications, preserving
   node ids. This packet removes the direct application inputs from its own
   generic definitions and requests E3 refinement. The combined graph is
   not claimed closed.
2. **Amitsur and uniform index.** E2 must supply the coherent pro-tower
   comparison and multiplicative derived-limit filtration for general
   finite cohomological dimension. BS17 Lemma 11.22 gives the sequential
   `2m` argument. A pro-equivalence does not imply the asserted termwise
   formula for ordinary partial totalizations.
3. **Witt fibre.** Construct the fibre-level Frobenius nullhomotopy and
   combine it with the existing Witt identity to prove multiplication by p
   is null. Homotopy-group torsion alone does not prove that assertion.
4. **Profinite categorical continuity.** Finite-group actions, actions
   factoring through a specified finite quotient, and the continuous
   discrete-module specialization have models. A broader categorical
   application must supply a topology or condensed continuity model. No
   categorical fixed-point filtered-colimit formula is asserted.

Six requests name E1 (concrete modules/geometric specialization), E2
(towers/totalization/h-descent), E4 (adic/Amitsur completion), E3 (generic
dependency refinement), and upstream ProfiniteCohomology Layers 0 and 10
(the coefficient dictionary and continuous cocone).

E0 keeps the minimal stable/exact APIs: their inherited E5 ids become
monoidal comparisons. DD.0 keeps cotangent complexes and H.5 concrete
spectra; only the return branches and joint acceptance diagram import
them. E5 keeps dualizable/compactly assembled/rigid categorical targets
without imposing compact generation. No target was moved upward or
duplicated. The `BS22` route is resolved by the reviewed prismatic
extraction; prism-specific constructions remain outside E5.

Independent review is next. Packaging must reconcile supplier dependencies
and check the accepted bundle tiers; E5 is outside the current upstream
tier. No second job is claimed in this run.

## Submission state

PR #8009 is open against CBirkbeck/tauceti-explorer. The worker account's
upstream push returned HTTP 403, so the same session branch was pushed to
its existing fork. The submission marker succeeded and #720 is
`state:submitted`. GitHub marked the fork's submission-check workflow
`action_required`, requiring maintainer approval to run. Automatic intake
also leaves fork pull requests to the maintainer. The local checks above
passed; no remote validation failure has been reported. The maintainer must
approve the workflow and handle intake of this PR.
