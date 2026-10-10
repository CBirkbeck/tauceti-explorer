# PKG-ArithmeticQuantumTopology — blocked checkpoint

Worker: Codex, session `codex-TzHZjT`, issue #7889, 2026-10-10.

This is **partial**, not a completed package. The README is assembled; the Lean
file is a compiled subset. Missing supplier carriers prevent the full signatures
required by PROTOCOL §20. No packet, review verdict or supplier file was changed.

## What is saved

- `research/blueprint/packages/ArithmeticQuantumTopology/README.md`: all 106
  accepted targets, grouped by their actual parent QT.0–QT.7. It retains every
  statement and explicit hypothesis, all 221 API entries and 169 named tests
  across all kinds (206 API entries and 159 tests belong to definitions and
  constructions), and every numbered/page source locator. It omits process
  narrative, repeated use lists and repetitive acceptance prose. The resulting
  document is 198,153 bytes, below the 200 KB ceiling. Comparison obligations
  and conjectures remain visibly distinct from established source results.
- `Suggested.lean`: the input's concrete native interfaces, without the long
  commented inventory masquerading as signatures, plus a genuine meromorphic
  Faddeev interface. The README retains the omitted mathematical specifications;
  this handoff identifies where native signatures still have to be supplied.
- `metadata.toml` is deliberately **not submitted**. The intake's
  `issues.deliverables_complete` treats a package as complete whenever its three
  files exist, without reading a partial handoff. Leaving this new file absent
  preserves checkpoint routing. Once the signatures are complete, create it
  with exactly `topic = "math.GT"` and a newline.

## Why the complete job is blocked

The accepted input passes the structural checker, but it explicitly contains
8 gaps, 19 open requests, 8 planned stages and **0 closed stages**. Its suggested
file has numerous entries labelled “signature omitted”; acceptance of its
planning pass did not supply those carriers. In particular the first target
requires a framed multi-link quotient and the next requires actual surgery.
These cannot be made into native signatures by interpreting a knot Gauss code,
a matrix cokernel or an unconstrained `Type` as the required geometric object.
PROTOCOL §13 explicitly forbids a dummy condition replacing an unstated one;
WORKERS forbids replanning another owner. This issue permits editing neither
GeometricTopology nor the other supplier plans.

The read-only current upstream was checked at TauCetiRoadmap
`37769f03c170a7bc3e1082df70522a0ad59c5ffd` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:

1. `TauCetiRoadmap/GeometricTopology/Suggested.lean` contains schematic comments,
   not a native framed-link/surgery interface. Current
   `TauCeti/KnotTheory/SmoothLink/Basic.lean` supplies `SmoothLinkEmbedding`
   (smooth circle components with disjoint ranges), not Seifert framings,
   linking numbers or a framed isotopy quotient. The pinned `FramedMarkovBraid`
   supplies component framing data, but `MarkovEquiv` is explicitly unframed.
2. The current `TauCeti/LowDimTopology/DehnSurgery/` contains `Slope.lean`:
   actual first-homology slope arithmetic and `FramedBoundaryTorus`. Its scope
   explicitly leaves the complement and filled manifold for further work.
   It does not supply integral surgery, the H₁ comparison, or Kirby moves.
3. GeometricTopology layer 7's closed-manifold geometry does not provide the
   ordered cusped geometric triangulation, peripheral completeness, canonical
   refinement connectivity or relative CW/homology interface required in
   QT.5–QT.6. The precise extensions are already described in the input's
   GeometricTopology Part II requests; do not replace them with bare matrices.
4. `OperatorTheory/SelfAdjointSpectralTheory` now owns the unbounded spectral
   theory that the older AS.0 request partly describes. Its native choice is
   `LinearPMap`, and its Part E constructs the spectral PVM and generated
   unitary group. This owner is cited in the package instead of planning the
   spectral theorem again. The specific Schrödinger realization/common
   Schwartz core/closure of p+q and microlocal kernel product/pushforward
   extension still require precise imported interfaces. No global AK gluing
   operation is invented here.
5. The accepted `HabiroCyclotomicCompletions` package exists and provides
   `HabiroRing`, finite factorial projections, `evalAt`, `taylorAt` and rigidity
   in its own namespace. Those must be imported, not defined again. At this
   checkout there are no packages for HabiroNahmSeries, HabiroNumberFields,
   K3BlochGroups, Polylogarithms or QSeriesPartitionsAndMockModularForms.
   Their references in the README identify mathematical owners, but must be
   reconciled with the permitted lower-tier/bundle order before upstream use.
   In particular the integral NZ/HB.9 bridge cannot erase faithful coefficient
   transfer, signed Kummer orientation or full quadratic finite étale descent.

No messages or new issues were sent to suppliers; the existing requests remain
unchanged. The maintainer must route these owner extensions or provide their
native signatures. This is a dependency block, not exhaustion of the run time.

## Native analytic addition

AK v2, Definition 15 (p. 9) and Appendix A (pp. 34–35, (42), (44), (47)–(49)),
was read directly. `FaddeevParameter` uses Re b>0, a reciprocal-stable domain
containing the source's representatives Re b>0, Im b≥0. The extension beyond
those representatives is through the same contour prescription and reciprocal
symmetry; it is documented explicitly in the README.

`IsFaddeevPhi` specifies an actual `ℂ → ℂ` function: meromorphic normal form
on the whole plane and agreement with the prescribed above-zero strip contour.
An existence-and-uniqueness theorem supplies its choice. It is not an admitted
carrier or a field asserting an unspecified mathematical property. The strip
integrability theorem and the offset bound lie before any use of the totalized
Bochner integral. The normal form assigns zero at poles, so the divisor and
functional identities use `meromorphicOrderAt` and punctured-neighborhood
`EventuallyEq`, respectively. The finite lattice cardinalities retain colliding
zero/pole multiplicities. Tests distinguish orders +1 at −c_b and −1 at +c_b,
order k+1 at −i(k+1) for b=1, reciprocal self-duality, and the cubic singularity
and nonintegrability of the ordinary real-axis integral.

The two convergent products in (44) are written directly with Mathlib `tprod`,
with an actual `Multipliable` obligation for Im(b²)>0; no second generic
Pochhammer library is introduced. Both shifts, the inversion scalar, product
representation and unitarity have concrete signatures. `faddeevPhi_real_strip`
connects the new meromorphic object to the retained real-b strip interface.
The operator pentagon, global AK gluing and volume/comparison assertions
remain unstated where their native analytic or geometric interfaces are absent.
All proof obligations use `sorry`; nothing is claimed formalized.

## Work remaining, in dependency order

| Layer | Native pieces saved | Full signatures still required |
| --- | --- | --- |
| QT.0 | Algebraically split/admissible matrix conditions, integral matrix cokernel and handle-slide congruence, discriminating small matrices | Framed-link linking matrix and tests; actual surgery/H₁ comparison; ordinary Kirby import; admissible band-slide, Hoste and presentation-existence refinements on those carriers |
| QT.1 | Mathlib-backed ribbon twist/trace interface | Topological quantum algebra and completed tensor multiplication; integral PBW/even forms, ribbon/core/twist data and finite highest-weight modules (QT-owned work); supplier framed tangles, RT functor and universal bottom-tangle invariant |
| QT.2 | Laurent color polynomials, Chebyshev basis, cyclotomic polynomials/lattice and filtration; scalar Kashaev kernel | Actual quantum-module and trace comparisons, link invariant and normalization, divisibility and expansion, completion import and unified Kashaev construction on actual knots |
| QT.3 | Earlier scalar color conventions | Twist element and twisting theorem, JM on an actual integral-homology-sphere/surgery carrier, independence, connected-sum and orientation comparisons |
| QT.4 | Earlier scalar conventions | Root categories, strong Kirby colors, WRT and JM evaluation, Ohtsuki series and rigidity on the exact integral coefficient ring; general Lie-type core/parity/filtration |
| QT.5 | Shape and logarithmic flattening charts | Cut-cover and full lifted relation subgroup/quotients (QT-owned); actual geometric flattening and Pachner interface; regulator branch/period comparison; number-field Bloch convention and K₃ torsion comparison |
| QT.6 | Linear NZ/Hessian formulas, full scalar meromorphic Faddeev signatures, selected real-b integral formulas, charged kernel action under explicit integrability/continuity, scalar root-NZ weights | Geometric NZ/root datum, formal Gaussian vertex series and move invariance; qualified HB.8/HB.9 bridge; operator pentagon; leveled shape/gluing carrier, microlocal products, AK convergence/invariance and selected volume theorem |
| QT.7 | Finite figure-eight root sums/descendants, denominator cocycle, conditional ordered matrix transport, a partial provenance ledger | Actual representation-indexed knot rows/matrices; precise scalar/matrix asymptotic and analyticity predicates, lifts/quadratic/coefficient conjectures; proved BD comparison signatures; full six-column ledger and its tests |

These are not all external tasks. Quantum completed tensors/PBW/cores, extended
Bloch relations and the knot-specific series are this roadmap's own work and
remain to be prototyped once the necessary supplier interface boundaries are
usable. The compiled elementary components do not discharge a whole geometric
or quantum target merely by sharing an API name.

Resume first at `QT.0/framed-link-and-linking-matrix`: obtain the owner’s actual
carrier and invariant linking-number/framing API, then the integral surgery
carrier and H₁/Kirby comparison. In parallel mathematical planning, not through
new worker claims, identify the lower-tier/bundle package interfaces for the
Bloch, dilogarithm and Habiro bridge. Replace each outstanding specification
with genuine Lean definitions/signatures and the named API/tests in the README.
Do not restore a comment-only inventory as evidence of elaboration. Use the
accepted input for exhaustive target/name tracing; this checkpoint has changed
no mathematical verdict there. Only after all layers meet §20 should metadata
be added and the package submitted as complete.

## Sources and validation

Two current upstream readers were read in full: GeometricTopology and
GrothendieckEulerForms. Current link/slope and relevant spectral signatures were
read; the reviewed library catalogue has no ArithmeticQuantumTopology row.
The input's 24 baseline declaration statements were reread in the supplied
pinned sources, including the total Bochner integral, ordinary Hopf structure,
rigid/braided category APIs, cyclotomic positivity, framed braid boundary,
Schwartz/Fourier and pointwise-dual tempered distributions. Source locators in
the README are retained from the accepted input; this run does not claim a
fresh full audit of all seventeen papers.

Fresh public source reads: Andersen–Kashaev arXiv:1109.6295v2, specifically
Definition 15 and Appendix A, with the selected-integral/steepest-descent loci
in §12; Habiro arXiv:math/0509039v2, the framed-link/Kirby loci.
PDF SHA-256: AK `cbbac2dcec624a2a541fb770f312a5bd2a6051fe79f3ae7cd02a7d19ab9ba24d`;
Kirby `d30d9c69b652aa58539d2398f1a8424c968188d94cc2098ee462dd4e53a13416`.
Only own-word mathematics appears in the repository. No restricted source was
needed; scratch PDFs/texts are not retained.

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  **0 errors, 0 warnings**, unchanged input.
- Final `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  **exit 0, 0 errors, 82 warnings**, all `declaration uses sorry`. Free memory
  exceeded 100 GB before the check. Only the supplied shared checker was used.
- README assertion audit: 106 unique target anchors plus 8 layer anchors; every
  exact target statement, separate hypothesis, API specification, test and
  source locator is retained; size and excluded process-vocabulary checks pass.
- File-scope/intake checks and `git diff --check`: recorded in the PR after the
  final staging check. Only this job's permitted outputs and handoff are submitted.
