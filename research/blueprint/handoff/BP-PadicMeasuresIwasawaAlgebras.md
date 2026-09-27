# BP-PadicMeasuresIwasawaAlgebras — clopen and intrinsic-unit continuation

Worker: Codex — codex-hjdg0j, 27 September 2026. Refs #555.
Winning claim: comment 5852504289, explicitly confirmed by bot comment 5852505090.
The full issue was reread after confirmation. This is a partial checkpoint.

This addition has 25 nodes: 14 in L0 and 11 in L2. It constructs zero extension of clopen
continuous test functions, intrinsic restriction of the native AbstractMeasure, split inclusion,
full test-function support characterization, complementary decomposition and pushforward
naturality. It identifies the native p-adic units with their clopen locus, then constructs
restriction to that actual group, proves its inclusion is split and its ambient projector is
unitRestriction, and gives linear equivalences with the measure and integral-series ψ kernels.
All primes including 2 are retained. No completed group algebra, pushforward, product measure,
Amice carrier, or locally analytic operator is duplicated.

All 117 inherited node statements, hypotheses, prerequisite lists and API/test entries are unchanged;
101 entire node objects are unchanged. Sixteen objects update only superseded clopen-comparison
references in source/acceptance prose. All 125 baseline objects, seven source findings and ten planet
choices are preserved. Three L0 planets are added; L2 retains its existing six-planet limit.
The reader has been regenerated from the complete packet with mathematical introductions,
all definitions/proof outlines/APIs/tests, and the current coverage ledger.

Totals: 142 nodes (2 definitions, 25 constructions, 90 lemmas, 18 theorems, 7 comparisons),
141 API items, 102 packet tests (99 on definitions/constructions), 113 typed examples,
13 planets, 146 baseline references, 13 source findings, 8 gaps, 0 requests and 0 closed stages.
L0, L2 and L3 are partial; the other five layers retain not_read status and full targets.

Validation: the indexed blueprint checker reports zero errors/warnings; source-finding schema
and version validation pass. The graph has 263 internal edges and 553 total edges, is acyclic,
and every leaf is a recorded baseline declaration. The suggested file elaborates with zero errors
and 317 warnings, all expected declaration placeholders. All 8,483 Mathlib import sources match
the pinned source tree and cache; no Tau Ceti import is required. Compiler: Lean 4.34.0-rc2,
commit 6a10ac8c22beadecabdbb0919c2b50214762f91d. Only the issue's suggested file was elaborated;
no scratch Lean proof file was created. Historical scratch-proof claims below belong to predecessors.
These checks do not establish the proposed proofs or claim implementation.

Finite mathematical checks exhaust 27,000 clopen evaluations and 4,000 pushforward/restriction
cases with signed atomic measures, including empty/full clopens. Additional controls distinguish
additive and multiplicative Dirac convolution at p=2, and verify source E13 exactly:
23/60 has 3-adic valuation −1, whereas the smoothed difference 15/4 has valuation 1.

Evidence: all eight reviewed AUDIT-26 rows, current packet mathematics and handoff, full campaign,
accepted RS-16/RS-14 boundaries, all touching link records and the upstream Layer9 algebra/coordinate
contract were read. The protocols and two upstream models (ArithmeticDirichletSeries and
AnalyticToricGeometry) were reused after byte equality with the previously read copies.
Published PDF14–16,18–23,28–30 and v2 PDF10–15,20–22 were read in batches of at most three pages.
Every new cited baseline statement was read at the pin; native gluing, homeomorphism transport,
unit topology and compactness were checked explicitly. No all-paper reading is claimed.

E8 corrects ideles called a ring. E9 qualifies uniform convergence by a bounded domain.
E10 gives a pointwise Cauchy net whose algebraic-functional limit is discontinuous, refuting
unrestricted weak completeness. E11 exhibits an unbounded continuous function on a noncompact
subset. E12 repairs the ℤ_p-only approximation formula used for a general profinite group.
E13 gives a counterexample to the blanket unsmoothed Kummer congruence. The four foundational
qualifications already appear in the campaign/accepted restructuring; their formal source records
are added here. All six findings are version-collated, with a bounded correction search and no review
verdict or author contact. The arithmetic correction in E13 belongs to DirichletPadicLFunctions.

Resume with L0's bounded finitely additive clopen-data correspondence and integral-lattice/scaling
comparison, importing native clopen approximation and dense extension rather than re-planning them.
The new clopen restriction and support results are ready for those constructions. A second concrete
continuation is integral unit-measure uniqueness from positive moments (RJW Lemma3.36(i)), using
the new unitsMeasureAmiceEquiv and the earlier ψ-on-constants identity, followed by the required
multiplicative convolution/moment comparison for part(ii). The actual completed-algebra Dirac map
and augmentation-ideal comparison remain separate L1/L3 inputs. Preserve the p=2 branch and the
choice of an infinite-order integer a=p+1 for the regular clearing factor in part(iii).

L0a scalar character spaces remain here; family distribution actions remain at
LocallyAnalyticDistributions:L4. L1 imports the upstream ℤ_p algebra and resolves the joint (p,T)
topology comparison. Remaining L2 coefficient lattices/towers, arbitrary residue classes,
multivariable convolution and analytic/Galois comparisons stay explicit. L4 module invariants,
L5 determinant and compact exactness statements, and L6 order duality retain their complete gaps.

Publication guard: 52 captured files are unchanged at fresh main `bc77fa8260238a38b70799a8fdc30342c7e3ec84`; the claim and issue text remain valid. Exact four-file intake passes.

Suggested file SHA-256: `e30045de517a00888b6e6f13ba040f27d086944cb42d1b8f9018755a7c3fe6dd`.

## Predecessor handoff history

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
