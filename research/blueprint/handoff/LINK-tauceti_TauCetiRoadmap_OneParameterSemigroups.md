# Handoff: one-parameter semigroups and Bochner representations

## Submission and scope

**Job:** `LINK-tauceti_TauCetiRoadmap_OneParameterSemigroups`, issue #52.  
**Author:** ChatGPT Pro — `cgp-14f035649b9f`.  
**Claim:** comment 5713521449; explicitly accepted for this session by bot comment 5713522963.  
**Disposition:** complete catalogue-screen submission; independent review and integration remain separate.

The two authorized outputs are this handoff and
`research/blueprint/links/tauceti_TauCetiRoadmap_OneParameterSemigroups.json`.
No content document, integrated atlas, audit, queue, application file or other worker's packet
is changed. No git command was run. No Lean code was authored or compiled.

There are **three outward links, no established inward link, and four overlap/boundary
proposals**: one rescope and three keep-and-compare proposals. No whole-roadmap merger is
recommended. The absence of an accepted inward link is not a mathematical assertion that
no further library dependency exists.

The outward suppliers are **existing library interfaces**, not new implementation jobs:
Part A's C0 carrier/generator API and the separately indexed Hille–Yosida theorem feed PDE
F.26; Part A's carrier and generator-uniqueness interface feed OptimalTransport Layer 11.
PDE retains concrete heat operators, domains, boundary conditions, kernels and estimates.
OT retains Fokker–Planck constructions and comparisons with its metric flows.

## Inputs, reproducibility and coverage

Initial input: `dbafc759460581dbd23999a3c112149fedefe2b5`. The repository's GitHub Pages
artifact was downloaded through the GitHub connector: run 35210869629, artifact 10491219312.
The ZIP SHA-256 was verified as
`42073dce6a2708590def6f040b6b88fa988a03f7ca5bf1da18b9314b8cbadfb7`.
Its tar member supplied the local read-only input tree; no maintainer-machine access was used.

The submission-base recheck used `66e35f2051d4e49644701ad398112de45095d315`.
GitHub's commit comparison showed only AUDIT-24/25, their review reports, queue and ledger
changes. The atlas, content texts, additional roadmap definitions, all link packets,
AUDIT-06, baseline, protocols and link validator were unchanged.

Baseline: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The packet records source URLs and line numbers
for seven directly checked declarations, and hashes of the principal local input files.
Read date: 17 September 2026.

The screen covers **217 other records**: 211 other raw-atlas roadmaps and six additional
blueprint definitions. That raw count includes the retired FoundationsAndLibraryIntegration
record, which was read only to exclude it as a supplier. The source atlas contains 212
roadmaps, 1,968 stage records and 3,508 recorded stage edges; 25 other link packets were
included in duplicate and cycle checks.

All nine focal stage descriptions and the focal README were read in full. All 59 other
upstream Tau Ceti summaries and the analysis-area summaries were read. Every raw roadmap
README and every stage title/description was searched for the focal objects and synonyms.
Searches included semigroups, C0/strong continuity, generators/resolvents, Hille–Yosida,
Lumer–Phillips, dissipativity, Bernstein/Stieltjes, Laplace transforms, positive-definite
functions/kernels, Bochner, GNS, reflection positivity, characteristic functions, heat
flows and Pontryagin duality. Word boundaries distinguish GNS from the suffix of “signs”.
The six new definitions were read at summary/purpose/stage-inventory level and searched.

Detailed candidate reads include PDE Lane F (and its surrounding roadmap), complete OT
Layers 10, 11 and 14 and the ownership section, StandardDistributions conventions and full
Layer 1, DenseGraphLimits 8a/8b, Exchangeability's Koopman layer, OrthogonalL2Bases B1,
AutomorphicSpectralTheory AS.0, and ProbabilisticAndMetricNumberTheory PM.0/PM.1. The packet
records the depth of each examination. Catalogue screening is not a proof-by-proof audit
of all 217 partners; `none` means no sufficiently supported direct pair was retained.

## Focal input/output inventory

| Stage | Input and output contract |
| --- | --- |
| Part A | Real Banach space and the existing bounded/partial-linear-operator and integration APIs. Nonnegative-time C0 semigroups, contraction subclass, dense closed generators, domain invariance, growth, unbounded resolvents, bounded-generator and perturbation comparisons. |
| Hille–Yosida | Dense partial operator, `1 <= M`, real `omega`, the real resolvent half-line and all positive-integer power estimates. Produces a C0 semigroup with exactly that generator and growth bound. |
| Lumer–Phillips | Dense operator, Banach-space dissipativity and a surjective `lambda I-A` for one positive lambda. Produces a contraction semigroup. The Hilbert inner-product criterion is a specialization. |
| Abstract Cauchy problem | A C0 semigroup and initial vector. Its orbit is classical for generator-domain data and mild for arbitrary data; solution uniqueness needs a separate argument, not just a relabelled generator theorem. |
| Part B | Smooth real functions on the open positive half-line, endpoint-continuity data where required, real analysis and positive measures. Completely monotone/Bernstein functions, closure and Stieltjes/Lévy–Khintchine comparisons. The printed closed-smoothness definition needs the correction below. |
| Bernstein milestone | Continuity on the closed half-line and complete monotonicity on its interior. Unique finite positive representing measure on nonnegative reals. Closed-endpoint smoothness is stronger and needs moments. |
| Part C | Involutive additive monoid and nonnegative finite complex quadratic forms. Generic PD functions/kernels, closure, GNS/Kolmogorov comparisons and Fourier/charFun normalization. Group-negation norm and continuity theorems retain their additional hypotheses. |
| Bochner milestone | Finite-dimensional real inner-product space with negation involution, continuous PD function. Unique finite positive Fourier representing measure on that space; an arbitrary LCA theorem is a different scope. |
| BCR milestone | The particular involutive semigroup `NNReal × V`, bounded continuous PD function and finite-dimensional real inner-product V. Unique finite positive Laplace–Fourier representation. This is not a representation theorem for every involutive monoid. |

## Reviewed audit and direct library verification

Read `research/blueprint/audit/AUDIT-06.result.json` before deciding what to commission.
Its reviewed inventory reports substantially more implemented material than the focal
README's “build here” paragraphs acknowledge. Seven load-bearing declarations were opened
in their actual Lean files at the Tau Ceti pin:

- `Semigroups.StronglyContinuousSemigroup`, `Analysis/Semigroups/Basic.lean:41`:
  real Banach carrier, nonnegative time, bounded real-linear maps, zero/addition laws and
  pointwise continuity at zero. A growth bound is not an extra field of this structure.
- `Semigroups.hilleYosida_generation_iff`,
  `Analysis/Semigroups/Generation/HilleYosida/Generation.lean:217`: the general real
  characterization, including all resolvent powers. The proof shifts by `omega I` and
  unshifts the constructed semigroup. `HasGrowthBound` takes **omega, M**, unlike the
  order in the focal illustrative signature.
- `Semigroups.StronglyContinuousSemigroup.eq_of_generator_eq`,
  `Analysis/Semigroups/Generator/Uniqueness.lean:170`: equality of two actual C0 semigroups
  from equality of their full partial-linear-map generators.
- `hausdorff_bernstein_widder_existsUnique`,
  `Analysis/CompletelyMonotone/Bernstein/HausdorffBernsteinWidder.lean:70`: the correct
  continuous-at-zero/open-complete-monotonicity predicate, with unique representation.
- `IsPositiveDefinite.norm_apply_le_map_zero_re_of_star_eq_neg`,
  `Analysis/PositiveDefinite/Basic.lean:239`: the norm bound requires `star a = -a`.
- `Semigroups.StronglyContinuousSemigroup.isClassicalSolution_realOperator` and
  `.isMildSolution_realOperator`, `Analysis/Semigroups/CauchyProblem.lean:132,149`:
  the orbit theorems already exist. The classical predicate includes a continuous
  derivative within the nonnegative half-line; the mild predicate includes continuity,
  the initial value, domain membership of the time integral and its integrated equation.

All names have namespace prefix `TauCeti.`. The exact repository URLs appear in
`verifiedLibrary` in the packet. This was a statement/source check, **not** a Lean build,
axiom audit or independent verification of every entry in AUDIT-06. Other audit entries
are leads for the blueprint author, not fresh implementation claims by this worker.
In particular, do not recommission Bochner, BCR or Lumer–Phillips merely because the
old README calls them missing; consult the reviewed declaration inventory first.

## Corrections to the source roadmap

All line numbers below refer to `content/tau-ceti/OneParameterSemigroups/README.md` at the
input revision. These are handoff requests; this job does not authorize editing content/.

### General growth is not contraction (lines 129–134 and 157–159)

The blanket sentence that each Yosida approximation generates a contraction is false for
the stated general-growth hypotheses. On `X=R`, take `A=I`, `M=1`, `omega=1` and `lambda>1`.
Then `R(lambda,A)=(lambda-1)^-1 I` satisfies every stated power bound, but

`A_lambda = lambda^2/(lambda-1) I - lambda I = lambda/(lambda-1) I`.

Consequently its exponential has norm `exp(t lambda/(lambda-1))>1` for `t>0`.
Even the acceptance assertion `||R(lambda,A)|| <= 1/lambda` cannot be imposed on arbitrary
bounded A: the same example violates it. Reserve those contraction estimates for the
appropriate dissipative/contraction case. Retain general M-bounds, shift by omega, and
consume the existing general theorem. For multiplication examples, state the measurable
multiplier and lower-bound hypotheses; nonnegative multipliers give the contraction case.

### Finite Laplace measure does not imply smoothness at zero (lines 163–193)

The printed predicate requires closed-half-line smoothness, but the converse from an
arbitrary finite representing measure does not. Let

`mu = sum_(n>=1) 2^(-n) delta_(2^n)`.

It has total mass one and infinite first moment. Its Laplace transform
`f(t)=sum_(n>=1) 2^(-n) exp(-2^n t)` is continuous at zero and smooth completely monotone
for `t>0`. However

`(1-f(t))/t = sum_(n>=1) 2^(-n) (1-exp(-2^n t))/t`

increases to infinity as `t` decreases to zero: each summand tends to one, and monotone
convergence applies. Thus no finite right derivative at zero exists. The correct
finite-measure equivalence is already expressed by
`IsContinuousCompletelyMonotoneOnIoi` in the pinned theorem. Retain the stronger smooth
endpoint variant only with the necessary moment hypotheses. Within-derivative and
unrestricted iterated-derivative conventions at the boundary must also be distinguished.

The unconditional pointwise-limit closure at lines 170–171 is separately false for a
continuous-at-zero class: `f_n(t)=exp(-n t)` converges to a function equal to one at zero
and zero for positive t. State open-half-line closure, and impose continuity of the limit
at zero for the finite-measure/closed-continuity formulation. Finite limit at zero is not
the same as finite moments of every order.

### Generic involutions do not supply group bounds (lines 210–217)

On the additive monoid `NNReal` with the identity involution, `F(t)=exp(t)` is continuous
and positive definite: its finite quadratic form is
`|sum_i c_i exp(t_i)|^2`. Yet `F(t)>F(0)` for positive t, and F is not uniformly continuous
on the unbounded half-line. Therefore neither printed assertion follows from the generic
monoid hypotheses. The general Cauchy–Schwarz estimate is

`|F(a)|^2 <= F(a+star(a)).re * F(0).re`.

Negation involution gives the stated group bound; the pinned theorem makes that
hypothesis explicit. BCR keeps boundedness as its own assumption. In particular, a
future graph-gluing/GNS comparison must not import the false generic bound.

### Generator uniqueness is not uniqueness of an arbitrary trajectory (lines 137–140)

The checked uniqueness theorem compares **two semigroups**. An arbitrary classical or
mild solution is a curve, not a semigroup. The checked CauchyProblem file supplies the
orbit existence theorems, but these alone do not justify the sentence “It follows from
generator-uniqueness” as a proof of all solution uniqueness.

For a classical solution, the remaining argument is to show for fixed t that
`s -> S(t-s)u(s)` is constant on `[0,t]`, with the domain invariance, derivative,
strong-continuity and endpoint hypotheses justified. For mild uniqueness, subtract two
solutions with the same data. Their difference w has zero initial value; its integral
`v(t)=integral_0^t w(s) ds` lies in D(A), satisfies `v'=w=Av`, and has continuous derivative.
Apply classical zero-data uniqueness to v and differentiate to get w=0. This is a proof
outline for the missing bridge, not a claim that new Lean declarations were proved here.

### OT carrier comparison must exclude a false Banach example

OT Layer 11 lines 1309–1313 suggests signed measures as one possible realization. For heat
on Euclidean space of positive dimension, starting at a Dirac mass gives a nonatomic
Gaussian at every positive time. They are mutually singular, so their total-variation
norm distance is two (or one with the probability-distance convention), not a quantity
tending to zero. Thus heat on **all** finite signed measures with TV norm is not C0.
Use a stated L1/L2 realization or prove another appropriate realization; a probability
orbit alone is not enough to invoke the existing Banach-semigroup uniqueness theorem.
Agreement of differential expressions on smooth tests is also not equality of closed
generators without a common-core/closure argument.

## Scope decisions and deliberately rejected arrows

The PDE abstract/concrete split is already requested by OT's ownership paragraph
(lines 1967–1974); record it rather than introducing a competing general theorem.
The two PDE arrows distinguish the carrier/generator API from the separately indexed
Hille–Yosida theorem and do not assert that heat requires every Part A target.

OT10's nonlinear minimizing movements and EVI remain separate. In the quadratic Hilbert
specialization, with generator A=-B, the correct normalization is
`(I-tau A)^-1 = tau^-1 R(tau^-1,A)`, for `tau>0`. OT14 still has to construct Cheeger
energy, prove quadraticity and establish the density-to-probability comparison. No
unconditional HY arrow into the whole nonlinear/RCD programme was added.

StandardDistributions computes transforms of already constructed measures. That is not
an existence problem requiring Bochner. Preserve the conversion from the negative-2pi
Fourier kernel to `charFun` evaluated at `-2*pi*a`, and keep all parameter/moment regimes.
DenseGraphLimits' reflection-positive gluing kernels can be compared with generic PD
kernels after the gluing monoid and real/complex coefficient comparison are proved; its
Mobius/exchangeable-law graphon representation does not follow from BCR.

The screen rejects several misleading names: Galois resolvent polynomials, numerical and
toric semigroups, p-adic matrix-semigroup actions, indicator functions of Hecke double
cosets, Bernstein centers, Stieltjes integration, and positive-definite matrices or
quadratic forms. Discrete Koopman iterations do not supply continuous-time dynamics.
Bochner spaces use the integral, not the representation theorem. General compact-group
Peter–Weyl, Pontryagin duality for compact/discrete arithmetic modules and Stone–von
Neumann are not instances of the finite-dimensional Bochner theorem or of an unspecified
Stone/LCA extension. Generic analysis already in Mathlib or Tau Ceti is not routed through
the retired foundations roadmap.

## Validation and next owner

Executed from the local input tree, with the submitted JSON:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_OneParameterSemigroups.json
status: complete; links: 3; overlaps: 4; examined: 217
0 error(s), 0 warning(s)
exit status: 0
```

Additional checks verify exact coverage of the expected 217 other IDs, unique pairs,
absence of duplicates in all 25 other packets or the atlas, no retired endpoint, and
literal occurrence of every link/overlap evidence excerpt in its recorded source-line
range. These are structural/evidence checks, not independent mathematical acceptance.

The next owner should review the three links, the four concrete boundary proposals and
the counterexamples above; correct the stale README using the reviewed library audit;
and preserve concrete realization/core/solution-comparison work with the appropriate
consumer. No missing-library claim is inferred from a failed name search. Any remaining
ACP or complex-resolvent work needs its own baseline verification before implementation.
The issue submission comment records the PR and the CI status actually observed.
