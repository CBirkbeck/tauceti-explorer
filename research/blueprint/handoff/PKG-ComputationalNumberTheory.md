# PKG-ComputationalNumberTheory

Completed by Codex, session `codex-0C4Z4W`, 2026-10-10. Refs #7536.

The bot confirmed the claim in issue comment 6099179979, in response to claim
comment 6099178492. This submission completes the package job; it is not a
checkpoint and does not claim a completed formalization or a full dataset replay.

## Delivered

- [README](../packages/ComputationalNumberTheory/README.md): a timeless roadmap
  with scope, ownership contracts, native carriers, normalization conventions,
  six layers in order, all 108 accepted targets, their prerequisites and source
  locators, all 187 API items and all 185 unit tests. Targets are grouped by
  mathematical purpose; blueprint IDs, acceptance duplication, statuses and
  review history are omitted. The explicit CT scalar expressions are written
  out, so their definition does not require guessing from a source citation.
- [Suggested.lean](../packages/ComputationalNumberTheory/Suggested.lean): the
  original declaration and example inventories, joined under one standard
  disclaimer, import block and namespace, ordered by layer. Added specific
  native Tau Ceti Sturm, L-function and good-prime Hecke recurrence imports.
  The root-qualified opens prevent the Tau Ceti namespace from shadowing
  Mathlib's modular-form and upper-half-plane namespaces. Proofs and factories
  remain admitted; semantic structures are distinguished from the finite
  verifiers required by the README.
- [metadata.toml](../packages/ComputationalNumberTheory/metadata.toml):
  `topic = "math.NT"`.

The packet, its original reader/suggested files, foreign roadmaps and generated
atlas data were not edited.

## Validation

- `lean-check research/blueprint/packages/ComputationalNumberTheory/Suggested.lean`
  exited **0** in the existing shared build at the pins. Its output consisted
  of the wrapper's build identification and **449 warnings**, all
  `declaration uses sorry`; no errors or other warnings. No Lake build, update,
  cache download or language server was run.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ComputationalNumberTheory.json`
  reported **0 errors and 0 warnings**, 108 nodes, 187 API items, 185 unit
  tests, six stages planned and none closed. The accepted input remains
  unchanged, with its 28 refinements and 19 supplier requests.
- An inventory comparison checked every accepted target, API name and test
  name in the README and Suggested.lean, equality of the original and packaged
  declaration/example inventories, and at least three tests for all 61
  definition/construction targets. Suggested.lean contains 185 admitted
  examples. No empty `Prop := sorry` placeholder was introduced.
- Exact integer q-series spot checks used normalized E4/E6 divisor sums and
  the Delta logarithmic-derivative recurrence. They recovered
  `a_107(Delta*E4^2*E6) = 35830422465487817813321292` and residue `-1` modulo
  107. The weight-38 Miller basis gave the T79 determinant
  `18305626494011330814755672971002224685372017853979279455158236824121600`,
  divisible by 79. The gcd checks gave `gcd(37,80)=1` and
  `gcd(51,150)=gcd(99,150)=3`. These checks validate the packaged examples;
  they do not supply simultaneous-eigensystem certificates or exhaustive
  finite-range formal proofs.
- README is below 150 KB and the 200 KB limit. Local-path and deliverable-path
  checks, Markdown reference checks, TOML parsing and `git diff --check` were
  also performed before submission.

## Library and source checks

Read the governing protocols and upstream guidance, the current upstream
README/CONTRIBUTING checklist, and the completed EffectiveBounds and
Multiquadratic READMEs in full. Checked the ComputationalNumberTheory library
audit, the pinned native declarations used by the plan, current number-field
and modular-form interfaces, and the current RealAlgebraicGeometry roadmap and
suggested interfaces. The accepted pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; the separate current Tau Ceti checkout
was inspected read-only and was not used as a substitute compilation baseline.

Downloaded the fourteen public source versions listed in the package references
directly on 2026-10-10. Each SHA-256 matched the corresponding accepted
`sources`/`sourceVersions` entry. Rechecked the sensitive locators and formulas:
GMN Theorems 1.15 and 1.19/Corollary 1.20; Stevenhagen Proposition 9.3;
BCG's coefficient, companion normalization and Remark 3.3; the Citro–Ghitza
companion table; Caruso's precision formulas; CL Proposition 3.17 and CT
Proposition 4.4; Platt Theorems 7.1–7.2. This was package reconciliation, not a
claim to have newly decomposed every proof in those sources. Sources remain
cited in the roadmap's own mathematical prose, with no copied source passage.
No restricted book was needed. Source downloads and temporary scripts are
discarded after submission.

## Boundaries and maintainer follow-up

The accepted target inventory is preserved. The README turns the packet's
refinement ledger into construction/proof requirements beside the relevant
layer; it does not silently promote those requirements to library results.
The following bindings still need maintainer attention outside this job:

1. **RealAlgebraicGeometry Layers 1–4** is present in current upstream main
   and already owns general Sturm–Tarski/subresultant/root matching theory.
   The package consumes it; CN.0/CN.4 retain finite rational certificates,
   effective isolation, refinement and verifier comparison. Update the atlas
   graph to reflect that boundary if necessary; do not plan a second generic
   Sturm theory. Its multiplicity conventions must be retained.
2. **GN.5**: the accepted plan explicitly found only LLL nodes, without exact
   Fincke–Pohst enumeration. The README requires every integer vector in a
   symmetric positive-definite rational ellipsoid, with termination and
   cutoff completeness. A short-vector routine does not meet the contract.
3. **CA.3**: its integer HNF/SNF contracts do not establish the additional
   finite-field kernel-basis algorithm with spanning, termination and native
   matrix comparison. Preserve that supplier request and the convex-hull
   supporting-line/slope-ordering contract for Newton sides.
4. **ED.3**: retain the finite local-image and saturation algorithm request
   with soundness, completeness and termination. Foundational elliptic and
   Selmer stages do not alone supply it.
5. **LevelOneAutomorphicFormsForClassicalGroups**: the intrinsic CT owner is
   named by the accepted route but still has no precise stage identifier here.
   The package specifies the numerical RHS and the exact intrinsic comparison
   contract, without inventing an owner stage. Bind its K-infinity objects,
   admissibility, epsilon/Fourier/J conventions and positivity implication to
   the appropriate stage when that design is available. The G numerical
   formulas do not assume GRH; the automorphic positivity implication does.
6. Preserve accepted RS-03/RS-06/RS-07 edges. The ModularForms Layer 11 trace
   import and CN.4-to-CM.5 unique-integer/rounding supply need explicit graph
   bindings if imported-only contracts do not draw them automatically. CM.5
   retains heights, CRT and endomorphism-ring certification.
7. The packet proposes removing CN.5 as a mathematical layer, but that
   restructuring was not approved by this package job. The README keeps CN.5
   and describes binding/replay using CN.0/CN.3/CN.4 interfaces, without adding
   a redundant certificate carrier. Retarget its edges only after the
   maintainer's restructuring decision.

All 19 supplier requests are retained as mathematical contracts in the scope
table and relevant layers. In particular, finite fields remain FF.0/FF.3,
lattice normal forms CA.3, intrinsic fields LocalFieldsRamification,
symbols/labels/trace/width conventions ModularForms Layers 7–11, integral
mod-p comparisons R15.2–R15.3, elliptic foundations EllipticCurves Layers
1/3/6/7, and analytic continuation/comparison AL.1/AN.4. Existing native
characteristic-zero Sturm equality and continued L-functions are consumed,
rather than specified again.

## Mathematical refinements retained

The packet's 28 gap entries remain input to implementation; packaging does not
resolve them by pretending admitted existence proofs are algorithms. Their
content is preserved as follows:

- **CN.0:** finite rational root counts and separation, exact elimination and
  common-root equality, presentation-change costs, digit-array encoding and
  uniform RAM-to-bit simulation with proved magnitude and per-step charges.
- **CN.1:** cyclic prime-power kernels, CRT strong-liar counting and the
  Carmichael prime-divisor lemma; the AKS quotient-algebra/cardinality proof,
  parameter and RAM cost estimates; self-delimiting Pratt size and charged
  verification; rational content/square-free reduction, bounded lifting and
  complete recombination. Rational irreducibility is not inferred from a
  nonexistent guarantee of irreducible reduction at some prime.
- **CN.2:** nilpotence dimension bound and finite-field kernels; p-primary
  saturation, multiplier integrality, radical comparison and strict index
  descent; discriminant prime coverage; maximal-order quotient idempotents
  at index divisors; complete Minkowski factor bases, principal relations,
  unit extraction and rigorous regulator/hR stopping bounds; admissible
  Newton developments and product/factor assembly with native ramification
  comparison; chosen residue sections and terminating local digit extraction.
  Repeated residual factors require higher-order refinement or the maximal
  order algorithm. The radical-power direction in Stevenhagen's printed
  Proposition 9.3 proof requires an eventual-containment argument, as noted
  in the accepted plan, not the reversed containment printed there.
- **CN.3:** integral E4/E6/Delta coefficients, the Miller monomial family,
  unitriangular elimination and the full modular lattice's normalized
  Eisenstein generator; integral polynomial-in-j and congruence Sturm;
  general-level/character/bad-prime and integral symbol comparisons;
  every finite exclusion and every common-eigenvector/lifting certificate.
  The exponent at (107,26) is 81 in the cohomological convention. The 151
  examples fail the gcd condition. Two characteristic-polynomial roots do
  not certify a simultaneous companion system.
- **CN.4:** terminating special-function enclosures and remainder constants;
  exact finite root counts and subdivision termination; smoothed cusp L
  evaluation with coefficient growth, incomplete-Gamma tails and correct
  Fricke/width normalization; complete primitive-character enumeration,
  Euler–Maclaurin/FFT errors, sampling and Turing counts for Platt's ranges;
  CT scalar/intrinsic comparisons, weighted alternating tails and complete
  admissible datasets; exact ellipsoid covers and the multiplicity lift
  `t_i/m_i` with diagonal `A/m_i`. The 12293 rows belong to the enlarged
  cover and do not imply that count for the smaller exact ellipsoid.
- **Structural:** the supplier/forwarding bindings above, GN.5's missing
  enumeration service and ED.3's local-image/saturation contract.

No further package editing is required. The next step is independent package
review, including another pinned `lean-check`, with these supplier and
implementation obligations kept visible.
