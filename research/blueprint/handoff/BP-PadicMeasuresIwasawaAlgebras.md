# BP-PadicMeasuresIwasawaAlgebras — bounded coefficients

Codex — codex-7e92bd. Refs #555. Own-job follow-up to merged PR3170, under
WORKERS. The original winning claim was comment5852157140, confirmed by
bot5852157899; the entire issue was reread after that confirmation. This
follow-up preserves all 101 prior node objects, all 107 prior baseline records,
all seven source findings, ten planets and every stage status. It appends the
new seed block to the exact preceding suggested file. L2's remaining-work
descriptions are narrowed; every other gap and coverage entry is unchanged.

Totals: **117 nodes** (18 constructions, 74 lemmas, 2 definitions,
17 theorems, 6 comparisons); **107 API entries**;
**75 packet tests**, comprising 72 definition/construction
tests and three other tests; **86 typed examples**;
**10 planets**; **125 baseline references**;
**8 gaps**, **0 requests**, **7 source findings**, **0 closed stages**.
All implementation statuses remain unchecked.

## What this supplies

Sixteen L2 declarations construct the Mahler pairing for bounded sequences,
its convergence and norm estimate, and the actual inverse in the existing
AbstractMeasure type. The existing BoundedContinuousFunction on the natural
numbers is the input. The pinned general Mahler isometry, forward Amice
transform and injectivity are reused. The norm only needs to be submultiplicative.
Completeness, ultrametricity and bounded Z_p scalar action are explicit.

Mapped integral coefficients are bounded by ||1_R||. Their bounded inverse
constructs an actual extension D(Z_p,Z_p)->D(Z_p,R), with exact Amice and
integral-test formulas, uniqueness, Dirac, pushforward and integral-weight
compatibilities. The scratch proof establishes all of these, including the
weight calculation from the actual weight evaluation equations. The target
measure carrier has not been replaced by a coefficient record.

The four constructions carry 32 API items and 15 tests, represented by 16
typed examples. The tests include bounded coefficients 1/3 over Q_3, the zero
case, the existing integral inverse, Dirac-square evaluation 4 at 2,
pushforward, the dyadic weight example, and an excluded unbounded sequence.
The sequence 3^(-n) has norms 3^n, and pairing it with Mahler coefficients
3^n yields nonsummable constant terms. The Q_p test instance is assembled
from the existing integral subtype norm and the bounded-action constructor.

## Evidence and checks

Read the owner document, reviewed AUDIT26 and its accepted review, accepted
RS16 owner decisions, all three touching link records, and exact current
consumer requests. The binding protocols and previously read upstream
LocalFieldsRamification, Multiquadratic and JacobianChallenge models were
byte-checked unchanged. The current Coleman input is byte-identical to our
merged PR3167. Prior root-averaging nodes and handoff were read and preserved.

Fresh public source: [RJW arXiv v2](https://arxiv.org/pdf/2309.15692v2),
pp.17–19 read in full, especially Theorem3.25 and Remark3.28. Accessed
27 September2026; SHA256
`efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`.
The bounded-ring generalization and compatibility decomposition are worker
derivations. No new source finding is made, and this is not an all-source
reading claim. The integral convolution-algebra theorem and weak/strong
topology comparisons are not inferred from the linear inverse.

All 29 used baseline statements were read at the pin and type-checked;
18 are new records relative to PR3170. The generated additive norm/summability
and map-of-sum results cite their indexed generating declarations; the
vanishing-at-infinity projection cites its structure. The exact additive
telescopes were checked. No modified declaration index is needed or submitted.

The actual full suggested file compiled with **0 errors and 255
expected placeholder warnings only**. Its 2732 imported Mathlib
source modules match the pinned tree; no Tau Ceti module is imported.
SHA256: `2e6cf9ef37bf31d863a53a5e5a285a2e52a3c52278fe5f1118476b6eb1a30526`.
The four constructor telescopes were inspected to confirm that the placeholder
definitions retain every convergence hypothesis; these assumptions are written
explicitly in their signatures.

A separate complete scratch proof, with 31 definitions,
lemmas and examples, compiles with **0 errors, 0 warnings and 0 placeholders**
against 2020 pinned Mathlib source modules. It includes actual
nonintegral and Dirac/pushforward examples and proves divergence of the excluded
pairing. Its SHA256 is `018a16cd7a75dc416d14c6b70efb8a87fa4e0d2c60ce9cf13af97e4176f97a36`. Only signatures with
placeholders enter the roadmap's suggested file; no implementation is claimed.

An exact rational harness checks **1,716 finite assertions** and six negative
controls. It computes finite differences of binomial functions, finite Mahler
pairings on polynomials through degree six, Dirac/pushforward/weight formulas,
nonintegral scaling and the excluded-sequence norms at p=2,3,5,7. Reproduce the
pairing by a_n(f)=sum_(k=0)^n (-1)^(n-k) binom(n,k) f(k), then sum a_n(f)c_n.
Negative controls detect shifted indices, reversed difference signs, missing
binomial normalization, discarding nonintegral coefficients, replacing an
extension with delta_0, and admitting unbounded coefficients. Finite arithmetic
does not establish the infinite analytic theorem.

The unmodified indexed blueprint checker reports **0 errors and 0 warnings**;
the exact four-file intake reports **0 problems**. The 209-edge internal graph
is acyclic and its leaves are recorded baseline declarations. Preservation,
reader/signature/API/test parity, source hashes and scoped mutations pass.

Fresh main `bf2349fb5eb9b2f6381c8847192c30a8f69d2dc5` matches all 28 captured inputs and all
four predecessor output blobs. The issue body and own winning confirmation
5852157899 are unchanged. Issue555 is available and review146 is unclaimed.
Only the four authorized deliverables are submitted through Git Data REST;
no git command, manual merge or independent-review verdict is used.

## Exact continuation

ColemanIntegration may use integral-coefficient-extension and
coefficient-extension-amice for the Z_p-to-R portion of its rotation request.
It must still establish its receiving O_K instances and the genuine
continuous-character rotation formula; no consumer file is changed here.
The prior root-average and rational-descent interfaces remain unchanged.

For PMIA, identify bounded Amice coefficients of all field-valued measures,
the finite-extension integral lattice and scaling, coefficient towers,
convolution and multivariable comparisons, and both topologies. General
profinite-domain coefficient extension and completed tensors remain in L0.
Decompose multiplication by z^x, general residue classes modulo p^n and
unit-dilation/binomial substitution, retaining the direction from bounded
suppliers to Coleman, period-ring and locally analytic consumers. Continue
the exact L3 and other-layer targets in the eight gap records.

The preceding handoff is retained in [PR3170](https://github.com/CBirkbeck/tauceti-explorer/pull/3170).
