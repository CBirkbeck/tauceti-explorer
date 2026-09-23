# Independent review: one-parameter semigroup links

**Verdict: accepted.** Retain the three links and four overlap recommendations;
no new link or removal. Reviewer: **Codex — codex-7e92bd**, 23 September 2026.
Job: `REV-LINK-tauceti_TauCetiRoadmap_OneParameterSemigroups`,
[issue #119](https://github.com/CBirkbeck/tauceti-explorer/issues/119).
The original author was **ChatGPT Pro — cgp-14f035649b9f**, working on
[issue #52](https://github.com/CBirkbeck/tauceti-explorer/issues/52).
This is an independent review of that packet, not a self-review.

## Sources and extent

Read the complete nine focal stage descriptions and all six other distinct
endpoint/overlap descriptions: PDE F.26; OptimalTransport Layers 10, 11 and 14;
StandardDistributions Layer 1; DenseGraphLimits Layer 8a. Read the source
ownership passages and original link handoff. Consulted the accepted
`REV-AUDIT-06` result in `research/blueprint/audit/AUDIT-06.result.json` and
`data/library-coverage.json`. Their broader implementation verdicts remain
audit evidence; the fresh declaration checks below are narrower.

The original packet, atlas and all five endpoint README files were byte-checked
against GitHub main before submission. Input SHA-256 values are recorded below.
All 15 link/overlap evidence entries were also tested directly against the raw
named README text, without whitespace normalization: all are exact substrings,
and their line locators agree. The StandardDistributions ownership quotation is
in its roadmap document rather than inside Layer 1; PROTOCOL §10 expressly
permits document evidence, and the full Layer 1 independently confirms the
concrete characteristic-function targets.

## Link-by-link decision

| Supplier → consumer | Decision and mathematical contract |
| --- | --- |
| Part A → PDE F.26 | Keep, inferred. F.26 explicitly needs the heat semigroup and generators. Reuse the real Banach-space C0 carrier, generator and unbounded resolvent interface. The concrete Banach carrier, strong continuity, domain, heat kernel and smoothing remain PDE obligations. Clarified that `HasGrowthBound` is separate from the pinned carrier structure: the source quotation's parenthetical does not describe a bundled field. |
| Hille–Yosida milestone → PDE F.26 | Keep, inferred. The theorem named in F.26 is supplied by the already implemented general generation iff. The hypotheses include `1 ≤ M`, dense domain, the real resolvent half-line and **every** positive integer power bound. `HasGrowthBound` takes `omega` before `M`. The carrier link and generation-theorem link have distinct contracts; neither asserts heat-operator estimates already exist. |
| Part A → OptimalTransport Layer 11 | Keep, explicit under original issue #52 METHOD 3, which classifies a link as explicit when a text names its partner. OT item 9 names this roadmap and imports C0/contraction semigroups and generator uniqueness. Two actual linear C0 semigroups must be on the same real Banach space with equal full generators, including domains. Agreement on an unproved test core does not suffice. Identifying probability orbits with a Wasserstein flow is additional OT work. |

These directions are prerequisite to consumer. No heat-kernel construction,
nonlinear EVI existence theorem, or arbitrary weak-PDE uniqueness result is
supplied by the abstract links. The explicit confidence convention is preserved
from the job-specific instruction; it is not an assertion of reciprocal named
references in both README files.

## Overlap-by-overlap decision

| Stages | Recommendation | Independent assessment |
| --- | --- | --- |
| Part A / Hille–Yosida / PDE F.26 | Rescope | Confirmed. Retain the existing abstract semigroup theory with its current owner; PDE owns concrete heat realizations and their estimates. This records the boundary, not permission to re-plan the upstream theory. |
| Part A / OT10 / OT14 | Keep | Confirmed as a restricted comparison, not a blanket prerequisite. Nonlinear metric EVI flows and variational resolvents are not automatically bounded linear semigroups and linear resolvents. For a densely defined closed nonnegative quadratic form, identify the associated self-adjoint operator `B`, generator `A=-B`, and linear L2 flow. The RCD comparison also requires quadratic Cheeger energy and an L2/probability carrier bridge. |
| Part C / StandardDistributions1 | Keep | Confirmed as a convention/API boundary. Named probability laws already constructed by measures do not need Bochner existence to exist. Their characteristic-function formulas can be compared with Fourier transforms, but neither finite moments nor a local mgf follows from a finite representing measure. The document explicitly excludes redevelopment of Bochner theory. |
| Part C / DenseGraphLimits8a | Keep | Confirmed as an optional finite-positivity interface. First quotient fixed-label graphs by label-preserving isomorphism and prove the commutative gluing monoid laws. The identity involution then gives a real symmetric PSD kernel; complexification preserves its nonnegative quadratic forms. This does not make the graph monoid the time-space domain of BCR. Full Layer 8b instead uses Möbius consistency and exchangeable-law representation. |

Independent mathematical checks supporting these limits:

* For `tau>0`, `(I-tau A)^(-1)=tau^(-1) R(tau^(-1),A)` follows by
  factoring `I-tau A=tau(tau^(-1)I-A)`. With `A=-I`, it is
  `x/(1+tau)`, and the semigroup is `exp(-t)x`; dropping the scalar factor
  gives the wrong proximal map.
* A Fourier kernel `exp(-2*pi*i*<a,q>)` integrates to the characteristic
  function at `-2*pi*a`, with the same underlying measure. This is a
  convention conversion, not a measure-existence theorem.
* Heat evolution of a Dirac mass is mutually singular with that Dirac mass
  at every positive time on positive-dimensional Euclidean space. Their
  difference has total-variation norm 2. Thus the full finite-signed-measure
  space with that norm does not furnish the required C0 realization.
* For the identity involution on additive nonnegative reals, `F(t)=exp(t)`
  gives the PSD quadratic form `|sum c_j exp(t_j)|^2`, yet is unbounded.
  Hence the focal README's generic bound by `F(0)` cannot be transferred
  to graph gluing. The verified library bound explicitly requires `star a=-a`.

## Pinned declaration checks

Freshly opened the following seven declaration statements at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; six distinct source files were read
around the statements. No Lean compilation or proof-axiom audit was performed.

| Source at the pin | Checked scope |
| --- | --- |
| [Semigroups/Basic.lean, line 41](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Basic.lean#L41) | `StronglyContinuousSemigroup`: bounded real-linear operators, NNReal time, semigroup identities, pointwise continuity at zero. A growth bound is not a field. |
| [HilleYosida/Generation.lean, line 217](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Generation.lean#L217) | `hilleYosida_generation_iff`: the dense-domain/all-powers real-Banach characterization described above. |
| [Generator/Uniqueness.lean, line 170](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Generator/Uniqueness.lean#L170) | `StronglyContinuousSemigroup.eq_of_generator_eq`: equality of actual C0 semigroups from equality of their `LinearPMap` generators. |
| [HausdorffBernsteinWidder.lean, line 70](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Bernstein/HausdorffBernsteinWidder.lean#L70) | `hausdorff_bernstein_widder_existsUnique`: `IsContinuousCompletelyMonotoneOnIoi`, not smoothness at zero, is equivalent to unique finite Laplace representation. |
| [PositiveDefinite/Basic.lean, line 239](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Basic.lean#L239) | `IsPositiveDefinite.norm_apply_le_map_zero_re_of_star_eq_neg`: the group-negation hypothesis is explicit. |
| [CauchyProblem.lean, lines 132 and 149](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/CauchyProblem.lean#L132) | `isClassicalSolution_realOperator` and `isMildSolution_realOperator`: generator-domain orbits solve the differential problem, and all orbits solve the integrated problem. Read both solution definitions: the derivative is within the nonnegative half-line; the mild equation explicitly requires the time integral to belong to the generator domain. Neither statement is uniqueness of arbitrary curves. |

The original handoff's warnings are mathematically justified. For `A=I`,
the Yosida approximant is `lambda/(lambda-1) I` for `lambda>1`, so its
exponential is not contractive. For the probability measure
`sum_(n>=1) 2^(-n) delta_(2^n)`, the Laplace transform is continuous at zero
and smooth completely monotone at positive times, but its first right
derivative at zero is not finite. Truncating the nonnegative difference
quotients already gives arbitrarily large negative slopes. Finally,
`exp(-n*t)` has a discontinuous pointwise limit on the closed half-line.
These examples prevent importing the stale contraction/endpoint assertions
from the focal README. Correcting that README is outside this issue's files.

## Completeness spot-check

Searched the current 2,007 stage descriptions, plus roadmap documents, for the
inputs/outputs of **all nine** focal stages. This exceeds the required five.
The original packet's catalogue-wide examined list remains the original
author's coverage record; the following is the independent spot-check.

| Focal stages | Search terms and result |
| --- | --- |
| Part A; abstract Cauchy problem milestone | Strong continuity, C0, heat semigroup, closed generator, Cauchy problem and uniqueness. PDE F.26 and OT11 support the retained links. Read OT13C in full: its Brownian/Schrödinger heat kernel and forward/backward PDE equations require the concrete heat realization, not an additional asserted abstract-generation contract. OT14's nonlinear/linear comparison is already delimited by the overlap. |
| Hille–Yosida; Lumer–Phillips milestones | Hille–Yosida, Lumer–Phillips, maximal dissipativity, resolvent and Yosida. No new use of Lumer–Phillips is stated. Read PDE D.18 in full: compact elliptic resolvents feed Fredholm theory; the text does not require C0 generation. OT10's variational resolvent is covered by the restricted comparison, while arithmetic/Galois resolvents are different objects. |
| Part B; Bernstein milestone | Completely monotone, Bernstein functions, Laplace transforms, Hausdorff–Bernstein and Stieltjes. No additional exact supplier/consumer found. Read ArithmeticDirichletSeries6: its Stieltjes summation/Perron formulas do not use the reciprocal complete-Bernstein/Stieltjes-function correspondence. |
| Part C; Bochner milestone | Positive-definite functions/kernels, characteristic functions, Bochner and reflection positivity. Read ProbabilisticAndMetricNumberTheory PM.0 and PM.1 in full: they ask for estimates for laws already supplied by arithmetic probability, not representation of an abstract positive-definite function. StandardDistributions and graph positivity are already covered; Bochner integration is a different use of the name. |
| BCR milestone | Berg–Christensen–Ressel, semicharacter, involutive monoid, time-space and Fourier–Laplace. No additional exact stage match outside the focal roadmap. Graph representation does not justify a BCR edge. |

Also read Exchangeability Layer 5 and RepresentationTheory/LieGroups Layer 0
in full. A discrete-time shift Koopman operator has no supplied continuous-time
interpolation, and finite-dimensional Lie-group exponentials do not supply the
general unbounded-generator theory. Neither justifies a link here. No blanket
claim of mathematical independence is made for any rejected candidate: a later
roadmap could state a new concrete interface.

## Changes and validation

Retained all endpoints, all 15 quotations, all confidence labels and all four
recommendations. Clarified the unbundled growth predicate and the scope of the
classical-orbit declaration; updated the summary and removed the completed
independent-review item from `remainingWork`. The review object records
`accepted`, with empty `added` and `removed` arrays. No `addedBy` entry is
needed because no new link was established.

Checks run:

* `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_OneParameterSemigroups.json`
* `python3 research/blueprint/intake.py check-files research/blueprint/links/tauceti_TauCetiRoadmap_OneParameterSemigroups.json research/blueprint/reviews/REV-LINK-tauceti_TauCetiRoadmap_OneParameterSemigroups.md`
* Raw-source quote, source-byte and deliverable-scope checks described above.

The link and intake checks pass. No Lean file is required or changed; no Lean
compilation is claimed. No `git` command was run for this job. Submission uses
the GitHub API and only the two issue deliverables.

## Input fingerprints

| Input | SHA-256 |
| --- | --- |
| `data/atlas.json` | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |
| `research/blueprint/links/tauceti_TauCetiRoadmap_OneParameterSemigroups.json` | `562789d71594ae9a00724712d431cbd7a280c918f4a8b37f9438d7654abb988e` |
| `content/tau-ceti/OneParameterSemigroups/README.md` | `ba46be06f2b83ef9275c176044b95fe270fd679b4e0ebc2007f4e9996062e27b` |
| `content/tau-ceti/PDE/README.md` | `ed2de35c8da6c952cbae2728ccc368987ad7c9dd8616bc4f42da7cfa568d09aa` |
| `content/tau-ceti/OptimalTransport/README.md` | `54b87ef74d97179e78d0057b1a5e8df315024d7343613b434f61cbe95faf577c` |
| `content/tau-ceti/DenseGraphLimits/README.md` | `d31ef1f3c3ac40f9749a4008d4954e32cc59c4cf777a2f3e739a0e332a6d8401` |
| `content/tau-ceti/StandardDistributions/README.md` | `d2c3d756c34ff19a2aa685a71d6159d859651b80b660ac1cacc732a14f0c6346` |
