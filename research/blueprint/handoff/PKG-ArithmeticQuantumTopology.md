# PKG-ArithmeticQuantumTopology — blocked checkpoint

Worker: Codex, session `codex-1R2Vs9`, issue #7889, 2026-10-10.
Continues `codex-us8zWs` (PR #8192), which continued `codex-TzHZjT` (PR #8154).

This is **partial**, not a completed package. The README is assembled; the Lean
file is a compiled subset, now also including finite free formal sl₂ colors,
generator/divided-power actions, pivotal trace and tensor comparison signatures.
Missing supplier carriers prevent the full signatures
required by PROTOCOL §20. No packet, review verdict or supplier file was changed.

## What is saved

- `research/blueprint/packages/ArithmeticQuantumTopology/README.md`: all 106
  accepted targets, grouped by their actual parent QT.0–QT.7. It retains every
  statement and explicit hypothesis, all 221 API entries and 169 named tests
  across all kinds (206 API entries and 159 tests belong to definitions and
  constructions), and every numbered/page source locator. It omits process
  narrative, repeated use lists and repetitive acceptance prose. The resulting
  document is 199,704 bytes, below the 200 KB ceiling. Comparison obligations
  and conjectures remain visibly distinct from established source results.
- `Suggested.lean`: the input's concrete native interfaces, without the long
  commented inventory masquerading as signatures, plus genuine meromorphic
  Faddeev, extended Bloch and formal finite-color interfaces. The README retains
  the omitted mathematical specifications;
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
`dea8191cc6047d6142a65872ebce6eeeb841a29b` and Tau Ceti
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

## Native finite-color addition in this checkpoint

Habiro arXiv:math/0605314v1 was read directly at §2.1–2.3 (pp. 7–9),
§5.1 (pp. 18–19, equations (5.1)–(5.3)), and §§5.3–5.4 (p. 20).
The PDF SHA-256 is
`5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc`.
The new `FormalColors` section uses actual `PowerSeries ℚ`, finite function
modules and matrices, with no assumed quantum-group carrier.

- The basis is the source's F̃^(i)v₀, with explicit H/E/F/K/K⁻¹ matrices.
  Balanced Laurent integers map to exp(ah/2); a separate unbalanced Gaussian
  recurrence supplies F̃^(m). The denominator v−v⁻¹ is never inverted in
  ℚ[[h]]. Signatures check generator relations, the precise K exponential,
  highest weight, divided-power normalizations and endpoint vanishing.
- `quantumTrace` is the linear functional Tr(K⁻¹A). Its constant-term
  comparison, quantum dimension and qualified cyclicity use that matrix.
  Tests distinguish ordinary dimension, the opposite pivot, arbitrary
  cyclicity, and ordinary F² from the divided-power basis.
- The module tensor product is compared with product-index coordinates on
  pure tensors. Coproduct matrices and the Clebsch–Gordan equivalence require
  intertwining H/E/F/K, rather than only equality of ranks. Weight characters,
  the Chebyshev representation algebra and their product comparison are
  separately stated. The zero color tests all four tensor generators.

These are construction/signature plans with `sorry` obligations, not a
formalization. The continuous completed U_h-module action and ribbon operators
still need QT.1's quantum algebra and completed tensor presentation.
Do not mark the entire finite-color target closed from these matrix interfaces.
No external owner is duplicated. Mathlib's `PowerSeries.exp/rescale`, Laurent
`eval₂`, `Pi.basisFun`, matrix trace/Kronecker and module tensor product
statements were read at the supplied pinned sources before use.

## Native QT.5 addition inherited from PR #8192

Neumann arXiv:math/0307092v2 was read directly: §2, pp. 416–420;
§3, pp. 420–424; Lemma 7.1/Proposition 7.2, pp. 439–440; and
Theorem 7.5, p. 441. The new namespace
`TauCeti.QuantumTopology.ExtendedBloch` builds the owned algebraic cover and
quotient without waiting for a manifold or triangulation carrier.

- `Flattening` is a subtype of ℂ³ with exp(2w₀)=z² and
  exp(−2w₁)=(1−z)², with its subspace topology. Both logarithms recover z.
  The explicit upper/lower cut banks, limiting logarithms and two sheet
  transitions define `CutCover` as a genuine quotient with quotient topology.
  `flatteningEquiv` is a homeomorphism obligation for its concrete log map.
  Tests distinguish odd sheets, equal w₀ with unequal shapes, and even-sheet
  path connectivity. The >1 cut's upper bank has +π imaginary part in w₁;
  the principal log chart there is the lower bank.
- `LiftedFiveTermZero` uses paths in the five-shape preimage from the FT⁺
  principal lifts. `LiftedFiveTerm` then translates by the exact five-coordinate
  sheet lattice V. It never admits independent arbitrary five lifts. The
  chart criterion and rejection test retain all five sheet equations.
- `extendedPreBloch` is the native free abelian quotient by the join of two
  explicitly generated subgroups: lifted five-term and transfer relations.
  Its universal map and extensionality have concrete signatures. Tests
  include a nonempty FT⁺ locus, transfer zero, and the nonzero order-two
  transfer class in the quotient that omits transfer.
- `extendedDehn` descends the actual logarithmic wedge to the quotient;
  `extendedBloch` is its kernel. The wedge uses `exteriorPower` over ℤ,
  not over ℂ. Tests retain the sheet-change term and assert existence of a
  generator outside the kernel.
- `forget` takes the ordinary supplier's actual shape-generator map with
  its five-term equation. The comparison square uses the concrete unit-valued
  exponential linear map and ε=−2 exterior-square(exp), into the exterior
  square of the additive synonym of ℂˣ. `extendedBloch_forget` restricts to
  the supplied boundary's kernel with the exact equation ν′[z]=2z∧(1−z).
  This is a genuine universal/import-facing API, **not** an instantiated
  K3BlochGroups import. Instantiate it only when that owner's native package
  exists, and retain the distinct ordinary Bloch conventions.

This implements definition/signature plans with `sorry` proof obligations;
none of the mathematical results is claimed formalized. It does not supply
strong flattenings, Pachner geometry, Rogers regulators, geometric Bloch
classes, or the ordinary K₃ comparison. Those remain in the README and the
remaining-work table below. No supplier plan was copied or redefined.

Pinned declarations read before use: `FreeAbelianGroup.of/lift`,
`Relation.EqvGen.setoid`, quotient topology, `Joined/JoinedIn`,
`QuotientAddGroup.mk'/lift`, and `exteriorPower.ιMulti/map`.
The source PDF SHA-256 is
`de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650`.
Only own-word mathematics and exact source locators are retained.

## Native analytic addition inherited from PR #8154

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
| QT.1 | Mathlib-backed ribbon twist/trace interface; concrete finite-color generator relations | Topological quantum algebra and completed tensor multiplication; integral PBW/even forms, ribbon/core/twist data and extension of finite matrices to continuous U_h-modules (QT-owned work); supplier framed tangles, RT functor and universal bottom-tangle invariant |
| QT.2 | Formal finite free colors/basis and explicit actions; divided powers and pivotal matrix trace; tensor/Clebsch–Gordan and character comparisons; Laurent Chebyshev polynomials, cyclotomic lattice/filtration; scalar Kashaev kernel | Continuous quantum-module and ribbon comparisons, link invariant and normalization, divisibility and expansion, completion import and unified Kashaev construction on actual knots |
| QT.3 | Earlier scalar color conventions | Twist element and twisting theorem, JM on an actual integral-homology-sphere/surgery carrier, independence, connected-sum and orientation comparisons |
| QT.4 | Earlier scalar conventions | Root categories, strong Kirby colors, WRT and JM evaluation, Ohtsuki series and rigidity on the exact integral coefficient ring; general Lie-type core/parity/filtration |
| QT.5 | Principal charts, actual cut quotient/homeomorphism, intrinsic four-component flattenings, exact lifted five-term lattice, two relation subgroups, extended pre-Bloch quotient/Dehn kernel, universal ordinary forget/boundary square | Instantiate ordinary pre-Bloch supplier and its convention comparisons; actual strong/geometric flattening and Pachner interface; regulator branch/period comparison; number-field Bloch and K₃ torsion comparison |
| QT.6 | Linear NZ/Hessian formulas, full scalar meromorphic Faddeev signatures, selected real-b integral formulas, charged kernel action under explicit integrability/continuity, scalar root-NZ weights | Geometric NZ/root datum, formal Gaussian vertex series and move invariance; qualified HB.8/HB.9 bridge; operator pentagon; leveled shape/gluing carrier, microlocal products, AK convergence/invariance and selected volume theorem |
| QT.7 | Finite figure-eight root sums/descendants, denominator cocycle, conditional ordered matrix transport, a partial provenance ledger | Actual representation-indexed knot rows/matrices; precise scalar/matrix asymptotic and analyticity predicates, lifts/quadratic/coefficient conjectures; proved BD comparison signatures; full six-column ledger and its tests |

These are not all external tasks. Quantum completed tensors/PBW/cores and
the knot-specific series are this roadmap's own work. Their native prototypes
remain to be written; independent pieces can proceed while supplier boundaries
are resolved. The compiled elementary components do not discharge a whole geometric
or quantum target merely by sharing an API name.

Resume first at `QT.0/framed-link-and-linking-matrix`: obtain the owner’s actual
carrier and invariant linking-number/framing API, then the integral surgery
carrier and H₁/Kirby comparison. In parallel mathematical planning, not through
new worker claims, identify the lower-tier/bundle package interfaces for the
Bloch, dilogarithm and Habiro bridge. Replace each outstanding specification
with genuine Lean definitions/signatures and the named API/tests in the README.
The QT.5 cover and relation algebra now stand independently: retain this
namespace and instantiate its universal maps rather than recreating it. A next
independent QT.5 step is the extended Rogers regulator once the ordinary
dilogarithm supplier has a usable native interface.
Do not restore a comment-only inventory as evidence of elaboration. Use the
accepted input for exhaustive target/name tracing; this checkpoint has changed
no mathematical verdict there. Only after all layers meet §20 should metadata
be added and the package submitted as complete.

## Sources and validation

This run read the current SemisimpleAlgebras and GrothendieckEulerForms
readers and the actual GeometricTopology suggested file and link/slope library
interfaces. PR #8192 records reading GeometricTopology and the spectral
interfaces in its earlier audit. The reviewed library catalogue has no
ArithmeticQuantumTopology row.
The inherited checkpoint records rereading the input's 24 baseline declaration
statements in the supplied pinned sources, including the total Bochner integral, ordinary Hopf structure,
rigid/braided category APIs, cyclotomic positivity, framed braid boundary,
Schwartz/Fourier and pointwise-dual tempered distributions. Source locators in
the README are retained from the accepted input; this run does not claim a
fresh full audit of all seventeen papers.

Public source reads inherited from PR #8154: Andersen–Kashaev arXiv:1109.6295v2, specifically
Definition 15 and Appendix A, with the selected-integral/steepest-descent loci
in §12; Habiro arXiv:math/0509039v2, the framed-link/Kirby loci.
PDF SHA-256: AK `cbbac2dcec624a2a541fb770f312a5bd2a6051fe79f3ae7cd02a7d19ab9ba24d`;
Kirby `d30d9c69b652aa58539d2398f1a8424c968188d94cc2098ee462dd4e53a13416`.
Only own-word mathematics appears in the repository. No restricted source was
needed; scratch PDFs/texts are not retained.

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  **0 errors, 0 warnings**, unchanged input.
- Final `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  **exit 0, 0 errors, 185 warnings**, all `declaration uses sorry`. Free memory
  exceeded 100 GB before the check. Only the supplied shared checker was used.
- Exact-rational smoke checks of the new color formulas: **606 passed**, for
  colors n=0,…,6 and tensor pairs m,n=0,…,3 at v=2, 3/2 and 1. These check
  generator/coproduct relations, divided powers, trace and specializations;
  they are numerical checks, not proofs of the formal-series identities.
- README assertion audit: 106 unique target anchors plus 8 layer anchors; every
  exact target statement, separate hypothesis, API specification, test and
  source locator is retained; size and excluded process-vocabulary checks pass.
- File-scope/intake checks and `git diff --check`: recorded in the PR after the
  final staging check. Only this job's permitted outputs and handoff are submitted.
