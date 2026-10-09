# PKG-HabiroCohomologyFoundations

Completed package for issue #7474. Agent: Codex (GPT-6), session
`codex-MeECkR`. Date: 2026-10-09. Input checkout:
`763e75640ad9c64ae70d20a6a914496dd6e90f20`.

## Delivered

- `research/blueprint/packages/HabiroCohomologyFoundations/README.md`:
  an independently worded reader, with purpose, boundaries, conventions,
  fixed-version bibliography, sources and prerequisites for every target,
  proposed APIs and discriminating examples.
- `research/blueprint/packages/HabiroCohomologyFoundations/Suggested.lean`:
  joined signatures, API lemmas and examples, with one header and import block.
  The reader is definitive; the file explicitly describes its enhanced
  signature omissions.
- `research/blueprint/packages/HabiroCohomologyFoundations/metadata.toml`:
  `topic = "math.AG"`, the primary category of Wagner's Habiro paper.

Only these three files and this handoff are changed. No input packet, library,
atlas data, existing reader or neighbouring roadmap was edited.

## Coverage and input reconciliation

The four issue-listed accepted packets are the authority:
`HabiroCohomologyFoundations--HQ.1.json` (122 targets),
`HabiroCohomologyFoundations--HQ.1-2.json` (7),
`HabiroCohomologyFoundations--HQ.3.json` (3) and
`HabiroCohomologyFoundations--HQ.8.json` (19), all under
`research/blueprint/packets/`. Their 151 distinct targets, 266 API items and
153 test items are included. All 38 definition/construction targets have
examples. The two additional comparison targets also include their coefficient
and Laurent acceptance cases.

| Layer | Targets | Reader order |
| --- | ---: | ---: |
| HQ.1 | 28 | 1 |
| HQ.2 | 11 | 2 |
| HQ.4 | 31 | 3 |
| HQ.3 | 27 | 4 |
| HQ.5 | 25 | 5 |
| HQ.5-trace | 5 | 6 |
| HQ.6 | 3 | 7 |
| HQ.7 | 2 | 8 |
| HQ.8 | 19 | 9 |

HQ.4 precedes HQ.3 because it supplies the twisted q-Witt/Nygaard objects;
this follows the accepted RS-10 ordering. The current four packets retain
HQ.1's framed calculus and HQ.4's positive-degree q-Witt construction under
RS-10's interim ownership clauses. HR.4 supplies degree-zero q-Witt theory.
The QW.5/QW.6 shared interface destinations are identified without treating
uninstalled draft interfaces as existing implementations. HR.6 and HB.6/HB.7
are consumers, not prerequisites of the early construction.

The assembled reader contains source excerpts and historical assembly notes;
none was carried into the package. Its older coverage summary is superseded
by the issue-listed packet contents. The Lean join uses the four part files
under `research/blueprint/suggested/` corresponding to these packets, retaining
the later HQ.1 coherent-descent supplement, the finite-projective HQ.3
supplement, and the revised HQ.8 comparison records. In particular it includes
the positive semilinear pullback convention and the two new canonical
theta/Witt map-equality targets, which are missing from an older assembly.

Package-only elaboration repairs: the reserved structure-field spelling
`partial` becomes `partialOp` in `FramedHabiroOperators` and its references;
an unmatched anonymous `end` at the first part's boundary is removed. Historical
process comments are replaced by mathematical interface/omission notes.

## Source audit and mathematical limits

Sources were read at the fixed public versions linked in the reader. No private
library book was needed. The mathematical reader and this handoff contain no
verbatim source passages, and no downloaded source file is committed.

The printed-page audit distinguishes numbered declarations from bare
cross-references and section headings. For example, in q-Hodge v2 Definition
3.2 starts on p.20, Theorem 3.11 on p.25, Proposition 3.22 on p.32, paragraph
3.14 on p.28, Appendix A.1 on p.70 and paragraph A.13 on p.76. These correct
the stale or broad locators in some inputs without editing those inputs.
Bhatt--Scholze Theorems 16.18 and 16.22 and BMS2 Theorem 1.12 have explicit
page locators in the package. The theta/Witt targets preserve BMS1 Theorem
14.1(ii)/(i), pp.118--119, and the full-functor uniqueness hypotheses of
Bhatt--Scholze Theorem 18.2 and Lemma 18.3, pp.122--124. Stacks references
use stable tags and numbered statements because those HTML sources have no
fixed pages. DAG VIII §§2.6--2.7 supplies the enhanced QCoh/fpqc/perfectness
interfaces; ordinary groupoid descent alone is not substituted for it.

The package is complete as a presentation of the accepted plan, not a proof
that its mathematical gaps have been solved. In particular it preserves:

- the enhanced completion, coherent descent, animated and prismatic supplier
  requests; ordinary categorical prototypes do not encode higher coherence;
- the relative Habiro framing and toric rescaling omissions where the actual
  complete ring/Koszul interfaces cannot yet be expressed;
- the difference between the local smooth comparison and the global animated
  functor, including the Laurent rational non-example;
- filtration degree one for q^m-1, the q-PD ideal (q-1) versus prism ideal
  ([p]_q), positive semilinearity, Frobenius pullbacks, and completion before
  rationalization where required;
- restriction-free q-de Rham--Witt, graded FV/VF laws, prime-local conditions
  on the ordinary Witt map, and the Nygaard/rescaled stupid-filtration squares;
- the partial multiplicative scope of the small-prime smooth section: tensor
  dimension bounds do not make the admissible subset an infinity-operad;
- the announced smooth-proper perfectness and quasi-regular terminal-section
  assertions, whose proof interfaces are still targets;
- the distinction between spherical E2 and E1 existence hypotheses, the special
  prime-two conditions of the stated E1 lift method, and the number-field trace
  comparison only with 6 and the discriminant inverted;
- the open analytic comparison and the theta/de Rham and Witt/crystalline
  natural-map equalities. The latter two are outside the eight-square
  commutation theorem. They require the supplier's normalized enhanced maps,
  full-functor compatibility and sheaf descent; no arbitrary isomorphism or
  post-specialization uniqueness argument discharges them.

The input's source-number corrections are retained in substance: the Nygaard
proof uses Lemma A.4, the smooth truncation extension is a right adjoint, and
the number-field specialization uses q-Hodge Corollary 3.13. These are not new
changes to the accepted mathematical plan.

## Validation

- `python3 scripts/check_blueprint.py` on each of the four issue-listed packets:
  **0 errors, 0 warnings** on every packet. These are read-only input checks.
- Coverage audit: 151 unique target headings, 151 source rows, 151 prerequisite
  rows, all 266 API labels, all 153 test cases; examples at every definition or
  construction; no duplicate target headings. The reader is under 200 KB.
- Checked package text for process terminology and private filesystem paths;
  no source passages or scratch dependencies are included.
- `git diff --check`: passed.
- Final `lean-check research/blueprint/packages/HabiroCohomologyFoundations/Suggested.lean`:
  **exit 0, no errors, 472 warnings, all `declaration uses sorry`**.
  Memory was checked before compilation and exceeded the 20 GB requirement.
  No Lean language server, library build, update or cache download was used.

Native declarations were checked at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; the final shared elaboration uses
that pinned Mathlib. The file imports individual Mathlib modules and no Tau
Ceti modules: it therefore exercises no installed Tau Ceti implementation.
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` remains the accepted
planning baseline, not a claim that its missing enhanced APIs are present.

## Resume

No packaging work remains. Resume at the independent package review, checking
the reader against the four accepted packets and running the Lean check again.
The unresolved mathematics listed above remains work specified by the roadmap
and its supplier requests; it does not justify treating the package as a
checkpoint or asserting that any theorem has been formalized. This run takes
no second job.
