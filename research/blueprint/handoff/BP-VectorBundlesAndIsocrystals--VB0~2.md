# VB0 revision round 2

Job `BP-VectorBundlesAndIsocrystals--VB0~2`, issue #7015. Worker: Codex,
session `codex-AlMCJf`, 7 October 2026. This is a completed revision of the
target-level plan, not a checkpoint or an independent review.

## Result

The reader now agrees with the corrected packet and suggested Lean contracts.
All 51 node identifiers, 98 API items, 72 tests, 17 planets, 16 pinned baseline
declarations, seven gaps and fourteen supplier requests are retained. The
packet remains `complete`. Its existing `needs_changes` review object and each
source issue's current independent-review verdict are unchanged; the next
independent reviewer decides acceptance.

The node inventory is 6 definitions, 12 constructions, 24 theorems,
7 comparisons and 2 lemmas. VB0, VB1, VB2, VB2:ampleness and
VB2:classification are all `planned`; none is `closed`. The seven named
refinements remain reasons not to claim proof closure or implementation.

## Changes made

- Synchronized every reader contract with its packet statement, proof route,
  API, tests, acceptance conditions, direct prerequisites and source locators.
  Removed the raw-isocrystal annulus input and the premature Brauer-invariant
  argument. Galois descent now states Frobenius conjugation compatibility.
- Restricted the arbitrary-isocrystal functor to a specified algebraically
  closed residue-field embedding; distinguished cyclic standard bundles over
  F_q. The conventions and geometric-classification introduction retain that
  choice. Geometric degree is a separate comparison, and the positive open-ball
  identification retains its base-field restriction.
- Added the nonempty-curve hypothesis to the infinite-free non-example;
  corrected the regular-curve phrase and FF degree/saturation locators.
- Corrected the stable-presentation supplier to KTheoryLowDegrees Z.1.
  Continuous coefficient actions fix E, and their converse continuity criterion
  explicitly consumes global generation. Corrected the KL continuity,
  two-affine, definition, power-criterion and positive-line locators.
- Updated the key-extension proof, A1 request and G-KEY to use perfected
  analytic affine lines and possible fractional p-power exponents in equal
  characteristic. The classification argument proves triviality after an
  allowed extension before using the Isom torsor to descend it.
- Specified the abelian module-sheaf/QCoh Ext category, its direct GAGA and
  two-affine cohomology inputs, and FF5.6.23(4)–(5). Removed the absolute
  Prüfer input from general-E coherent classification and cited CN Theorem
  3.9(iii). Synchronized the VS1 reciprocity scope with its existing request.
- Recorded E15 as independently confirmed in the reader. Gave the current FF
  erratum pages, SW's PDF offset +10, and Ked05's tensor-calculus page 487.
  An additional source check found Theorem KL6.3.14 on p. 142: its packet and
  reader range now includes that page instead of ending at p. 141.
- Replaced the fifteen inherited `printed` transcripts and source quotations
  in historical erratum explanations with descriptions in our own words.
  Locators, identifiers, mathematical corrections, reviewer attributions and
  verdicts are preserved. No source excerpt was added. The Lean header now
  points to the synchronized definitive plan, and the reader reports 30 typed
  examples and 42 omissions.

## Checks

`python3 scripts/check_blueprint.py
research/blueprint/packets/VectorBundlesAndIsocrystals--VB0.json` reports
**0 errors and 0 warnings**. The source-issue records pass its shared validator.
Cross-file checks verified all 51 contracts, 98 APIs, 72 tests, seven gap
descriptions and fourteen requests; the local declaration graph is acyclic.
Every definition/construction still has at least three discriminating tests.
The original scope, coverage, identifiers, baseline and review are preserved.
Submission file intake and `git diff --check` pass for the four authorized
deliverables. No supplier, upstream roadmap, atlas data or application file was
edited.

After checking available memory, `lean-check
research/blueprint/suggested/VectorBundlesAndIsocrystals--VB0.lean` returned
**exit 0**, with **77 warnings, all admitted-proof warnings**, and no errors.
The shared build uses pinned Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Relevant Tau Ceti statements were
read through the existing repository at
`f790474821cf4256814db967cb154e7af3d0c369`; its three commented sheaf/line-bundle
imports remain unavailable as compiled modules in that build. No library
build, update, cache download or language server was started.

The suggested file retains 36/98 typed API specializations, 30/72 example
specializations, 3/33 named theorem/comparison signatures and 8/18 typed
definition/construction interfaces. The index explicitly records the remaining
62 APIs, 42 tests and 30 theorem signatures. Compilation checks these available
types with admitted proofs; it does not implement the geometric assertions.

## Sources and ownership

The nine public PDFs were retrieved again and matched every recorded SHA-256.
The affected passages were checked against FS II.2 (especially pp. 57–58,
63 and 70–72), FF5.5 (pp. 162–164), FF5.6.23 (pp. 181–182), FF8.2
(pp. 236–238, with the coefficient defects on pp. 229, 234–235), KL6.2–6.3
(pp. 135–143) and KL8.7–8.8 (pp. 178, 180–182), CN3.2 (pp. 14–15), SW13.5.7
(printed p. 114), and Ked05 Lemma 4.1.2 (p. 487). CS17 §§3.2–3.3,
Lurie's three-page Lecture 26 and GLX26 §5.1 were checked for the existing
isocrystal/bundle and consumer boundaries. This is a check of the revision's
contracts, not a new full-source audit. No restricted library book was needed.

Accepted RS-15/RS-20 ownership and the two assigned area findings remain
binding. The reviewed library catalogue has no entry for this roadmap; the
absence does not imply zero library coverage. Existing finite isocrystal,
module-sheaf, line-class and Brauer interfaces remain imports. Nearby upstream
AdicSpaces and SemisimpleAlgebras reader documents were read for their scope and
presentation. The fourteen requests remain in the packet and reader; no new
supplier work was claimed.

## Follow-up

The next independent review should check this reader synchronization and the
own-word erratum records. The finished target-level pass requires no additional
nodes for this revision. Proof and supplier work remains precisely bounded:

- **G-INTEGRATION:** atomically narrow RF3 to rank-one descent/partial charts
  and retarget basic VB3 inputs to the four early analytic nodes.
- **G-DM:** supply the eigenvector calculation referenced through Ked05
  Lemma 4.3.3 and its [19, Lemma 4.12], plus a full equal-characteristic proof.
- **G-GEOM:** complete geometric chart separation, coverage, localization and
  finite-projective overlap comparison before general-base GAGA.
- **G-HN:** verify bounded divisor poles, generic-fiber exactness and bounded
  saturated-subobject degrees independently of classification/ampleness.
- **G-KEY:** provide the ordinary/perfected analytic-line comparison,
  coefficient-linearity argument and nonclassical-point/open-image step.
- **G-GG:** transport the corrected KL two-half-annulus contraction estimates
  to general E and equal characteristic with the correct radius normalization.
- **G-LEAN:** replace the indexed omissions when genuine FF curve, period-ring,
  Robba topology, HN and diamond supplier carriers are available.

The named supplier requests additionally delimit the SF.0/SF.1, Q4,
cyclic/Brauer, basic BC, relative slope and VS1 export obligations. Preserve
the current reciprocity characteristic restriction in any VS1 integration.
