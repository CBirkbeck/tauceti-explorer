# ASM-AnalyticNumberTheory

Completed assembly for issue #213 by Codex, session `codex-toEQra`, 16 October 2026.
This is a completed assembly, not a checkpoint or an independent review. No
implementation, proof closure, supplier delivery or new review verdict is claimed.

## Inputs and assembly choice

Both requested parts were independently accepted before this job:

- `AnalyticNumberTheory--AN.0.json`: `REV-AnalyticNumberTheory--AN.0~2`,
  11 October; 254 nodes, 113 API entries and 90 tests.
- `AnalyticNumberTheory--AN.8.json`: `REV-AnalyticNumberTheory--AN.8~2`,
  10 October; 240 nodes, 170 API entries and 150 tests.

The checkout already contained a newer whole-roadmap plan from BP #9433 and
independent REV #9404, accepted on 14 October. Its packet, reader and compact
suggested file supersede the parts' older presentation. Replacing that reader
with a concatenation would discard accepted corrections and target-level
organization. The assembly therefore preserves the accepted whole-roadmap
mathematics and adds its provenance, a source guide and the explicit part
interfaces. The layers and their full specifications remain in numerical order;
the node prerequisite graph determines implementation order.

The immutable whole-roadmap packet is
[AnalyticNumberTheory.json](../packets/AnalyticNumberTheory.json), SHA-256
`a45e364fd8f869dc68d9850c4e2ef712c5a51c124d502c6a5059c0075e6924d9`.
It has 239 targets, 317 API entries, 261 tests and 263 proof ingredients.
All 494 part nodes are accounted for, without overlaps:

| Part | Continued targets | Proof ingredients | Imported from current Tau Ceti |
|---|---:|---:|---:|
| AN.0 | 153 | 96 | 5 |
| AN.8 | 73 | 167 | 0 |
| Total | 226 | 263 | 5 |

The other 13 whole-roadmap targets are additions of the subsequent planning and
review passes. The packet's `predecessorTargets`, `proofDependencies` and
`supersededTargets` give the complete identifier concordance; none is lost by
keeping the newer document. The five superseded AN.2 nodes are
`rational-prime-number-theorem`, `fixed-progression-prime-number-theorem`,
`chebyshev-prime-count-transfer`, `rational-mangoldt-boundary` and
`progression-mangoldt-boundary`. Their replacement is
`AN.2/plan/qualitative-prime-number-theorems`, an import/comparison target,
not a second plan for those existing theorems.

The original accepted part hashes were:

- AN.0: `87f6c864518da3931eb9960ad4ed1429c93aeb073bac5b8a1e93980d959ceeef`.
- AN.8: `0cf9a3f7afb3a8210ee0f64ecae160292c72df70499dd7e1a244286ccb7bd43e`.

The whole packet's `imports` hashes are historical receipts for those snapshots,
not checksums of the parts after this assembly. Its earlier statement that its
planning pass left the parts unchanged likewise describes that earlier pass.
The whole packet is outside this issue's edit scope and remains byte-identical.
Each part now has an `assembly` object recording this distinction and its changes.

## Reconciled prerequisites and mathematical follow-up

An identifier below abbreviates `AnalyticNumberTheory:AN.k/...`. No node
statement, hypotheses, proof steps, API, tests, planet, implementation status or
review verdict changed. Thirteen AN.8-part prerequisite lists changed. These
are mathematical interface changes: the inherited acceptance verdicts do not
independently validate them. Schedule a targeted independent check of this
table, the three added baseline receipts and the new strip-adapter gap.

| Consumers | Exact reconciled input | Reason / remaining obligation |
|---|---|---|
| `AN.9/bc-prime-progression-divergence`, `AN.9/bc-prime-pairs-congruence` | `AN.2/fixed-progression-prime-number-theorem` | Replace a whole-layer edge by the fixed positive modulus, coprime-class theorem. Current Tau Ceti supplies the qualitative result through the full-plan import. |
| `AN.8/double-gamma-quotient-growth`, `AN.8/cubic-reflected-bound` | `AN.3/plan/uniform-complex-stirling` | Replace the stale AN.5 layer edge by the accepted AN.3 target. Compact-height removable points require their separate bounds. |
| `AN.8/cubic-shintani-series`, `AN.8/cubic-meromorphic-continuation`, `AN.8/cubic-orders-generating-series` | `AN.4/dedekind-zeta-continuation-and-residue` | Name the canonical continued Dedekind function and the comparison with its convergent series. |
| `AN.8/cubic-archimedean-fourier-comparison` | `mathlib:Complex.Gamma_mul_Gamma_one_sub`, `mathlib:Complex.Gamma_mul_Gamma_add_half` | Replace the incorrect Barnes-layer edge by ordinary Gamma reflection and duplication. These do not supply the local Fourier equation, every multiplication formula, or the normalized cubic matrix. |
| `AN.8/cubic-entire-order-bound` | `AN.3/plan/uniform-complex-stirling`, `AN.2/entire-order-at-most` | Separate Gamma estimates from the order predicate; neither proves the missing quantitative global adelic growth estimate. |
| `AN.8/cubic-pole-cleared-convexity` | `AN.2/entire-order-at-most`, `AN.8/cubic-entire-order-bound`, `mathlib:PhragmenLindelof.vertical_strip` | Pole clearance and an order predicate alone do not prove convexity. A normalized strip argument is recorded explicitly as an open gap. |
| `AN.9/identity-barnes-transform`, `AN.9/selberg-identity-germ`, `AN.9/selberg-identity-nonvanishing` | `AN.7/plan/barnes-g-function` | Name the normalized Barnes product, divisor, recurrence and asymptotic contract rather than a whole layer. Preserve the accepted pole exclusions. |

The two already exact AN.9 edges to fixed-progression PNT
(`bc-nontrivial-character-projection`) and rational PNT (`bc-prime-pair-ratio`)
remain unchanged. The old AN.0 request to AN.8 has an empty `neededBy` list:
it is routing information, not evidence for a reverse prerequisite. Its four
contracts are continued by `AN.8/plan/cubic-zero-at-origin`,
`cubic-orders-generating-series` and `cubic-pole-cleared-convexity`, together
with the retained `AN.8/cubic-reducible-and-field-coefficient-bound` ingredient.
That ingredient bounds the positive-real series; positivity and the triangle
inequality give the same bound at complex height. No invented reverse edge
was added.

Three existing AN.8 gaps are clarified: quantitative entire order, local
distribution/Fourier normalization and Barnes product/asymptotics. The additional
gap **Cubic convexity: normalized vertical-strip adapter** requires
`DiffContOnCl`, the precise eventual double-exponential growth hypothesis,
constant bounds on both edges after normalization, and the field/height-uniform
interpolation with its epsilon loss. Mathlib's bounded-strip theorem supplies
only its stated analytic principle. LOWW, Lemma 3.11 and proof, p.14, motivate
the adapter; the accepted pole-cleared statement is retained. No unqualified
bound at the original poles is restored.

The added baseline declarations were read with their full ambient parameters
at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and checked temporarily
in the authorized combined suggested file. Reflection and duplication use
Mathlib's totalized Gamma. Meromorphic cancellations must first be made away
from poles. `PhragmenLindelof.vertical_strip` has complex normed-space codomain,
`DiffContOnCl`, growth rate `c < pi/(b-a)` and a common constant boundary bound;
it is not already the polynomial convexity theorem.

## Current upstream boundary and suggested file

Read the current ArithmeticDirichletSeries and OperatorTheory roadmaps and their
suggested files, together with the relevant Chebotarev, ProfiniteArithmetic and
current-library contracts. Current roadmap main is `0d144d0`; current Tau Ceti
is `a91d3aa`. The accepted full plan already distinguishes these from the
historical Tau Ceti pin `f790474`.

In particular, current Tau Ceti's `TauCeti.primeIdealTheorem`,
`TauCeti.LFunctions.primeIdealVonMangoldtBoundary` and
`NumberField.Chebotarev.tendsto_frobeniusPrimeCount` are imported, not replanned.
The fixed-progression comparison must respect the cyclotomic modulus convention
(including reduction when the modulus is 2 modulo 4). Character-space positive
functional measure representation exists on current main; measure uniqueness
and the specialized KMS correspondence are distinct obligations. The generic
OperatorTheory roadmap is not the requested nonsingular factor extension.
ProfiniteArithmetic supplies the profinite integer ring and unit arithmetic;
AN.9 owns only its BC-specific torsion-character/cyclotomic adapters.

The combined suggested file retains the accepted 443-line native subset, with
one standard note, one import block and namespace `TauCeti.AnalyticNumberTheory`.
Only explanatory comments changed; all code and signatures are unchanged.
Concatenating the older 2,658- and 2,356-line part prototypes would violate the
current shape rule and restore heavy/admitted data. Heavy arithmetic, adelic
and completed operator-algebra objects remain fully specified reader targets.
The AN.8 position now explicitly describes this scope. In particular, the
Barnes recurrence keeps its nonpositive-integer exclusions and the origin
logarithmic-derivative check accepted by the newer review.

The reader's new source guide uses the inherited primary locators, distinguishes
ordinary Gamma from Barnes G, and identifies the local Fourier and quantitative
growth obligations. Direct assembly checks included DLMF §§5.11 and 5.17,
Neshveyev 2000, Proposition proof pp.2–3, Neshveyev 2009, Lemma 2.3 p.4,
LOWW §3.2 pp.12–14, and Jorgenson–Smajlović–Spilioti v2, §4 pp.13–15 and
§8.2, (8.4), p.27. This is not a claim to have acquired every inherited
source proof. All new source descriptions are in the worker's own words.
One inherited Hecke-nonvanishing consumer link had included explanatory text in
its destination; it now resolves to the existing target anchor, without changing
the explanation or the target.

## Collected requests

The authoritative exact contracts and consuming IDs remain in the parts'
`requests` arrays. The identifiers in these tables are **zero-based array
indices**, stable within the submitted files; all 39 + 15 requests are collected
here. A resolution means ownership/specification in the accepted plan, not an
implemented theorem. General supplier requests remain open to the extent their
exact contract exceeds current upstream work.

### AN.0 part: 39 requests

| Index | Supplier | Contract and assembly disposition |
|---:|---|---|
| 00 | ArithmeticDirichletSeries Layer 6 | Finite-height Perron for the actual Mangoldt series, including `arctan(T/c)/pi` at the endpoint and uniform Abel transfer to Siegel–Walfisz. |
| 01 | GlobalNumberFields Layer 9 | Canonical Hecke characters, unitary parts, finite conductors and norm-indexed coefficients. |
| 02 | AutomorphicLFunctionsAndLocalFactors AL.0 | Normalized Fourier/Haar and Poisson on the actual Tate-admissible Schwartz class, including weighted integrability. |
| 03 | AL.1 | Local/global Tate integrals, Euler factors, residues and functional equations; nonvanishing is separate. |
| 04 | ArithmeticDirichletSeries Layer 3 | Absolutely convergent ideal Euler products, including bad factors. |
| 05 | NumberFieldArithmetic Layer 2 | Arithmetic Frobenius at a chosen prime and conjugacy independence. |
| 06 | ClassFieldTheory Layer 11 | Reciprocity comparing finite one-dimensional Galois and ray class characters. |
| 07 | InductionRestriction IR.6 | Rational Artin induction versus integral monomial Brauer induction, with required fixed-degree coefficient bounds. |
| 08 | ArithmeticDirichletSeries Layer 8 | Meromorphic nonvanishing from nonnegative logarithmic coefficients and the 3-4-1 inequality. |
| 09 | ArithmeticDirichletSeries Layer 1 | Finite ideal-norm fibres and ordinary/narrow partial-class regrouping, zero at index zero. |
| 10 | AN.8, internal | Four cubic zero/order-series/residue/convexity contracts; supplied by the accepted continuations listed above. Empty local consumer list; no reverse edge. |
| 11 | AL.3 | Canonical Rankin–Selberg completed carrier for the actual automorphic representation; GRH remains a conditional predicate. |
| 12 | FiniteFieldMethods FF.1 | Signed odd quadratic Gauss sum and shifted primitive-character sum, including nonunits. The accepted local AN.4 Gauss-sign target does not by itself close every shift/comparison obligation. |
| 13 | ArithmeticDirichletSeries Layer 8 | Logarithmic-derivative 3-4-1 coefficient inequality. |
| 14 | NumberFieldArithmetic Layer 2 | Ramified decomposition/inertia and Frobenius polynomials on inertia invariants. |
| 15 | IR.6 | Integral monomial Brauer decomposition; no Artin-holomorphy assumption. |
| 16 | ArithmeticDirichletSeries Layer 8 | Landau endpoint singularity at the finite convergence abscissa for nonnegative coefficients. |
| 17 | ArithmeticDirichletSeries Layer 9 | Wiener–Ikehara with the actual boundary functions and inclusive cutoff; qualitative PNT consumers now use current-library imports. |
| 18 | ArithmeticDirichletSeries Layer 10 | Inclusive psi/theta/pi transfer, higher prime powers and logarithmic-integral comparison. |
| 19 | Formerly SieveMethods SV.1 | Shiu short-interval bound: moved down to `AN.5/plan/shiu-short-interval-bound` by the accepted whole review. Proof adapter remains open. |
| 20 | Formerly ProbabilisticMethods PM.5 | Arithmetic/Barnes moment normalization: locally `AN.5/plan/zeta-moment-constants`. This resolves the normalization only, not arbitrary correlation models or a conjectural moment asymptotic. |
| 21 | ArithmeticDirichletSeries Layer 5 | Ideal-count bounds establishing absolute convergence of class sums on Re s>1. |
| 22 | AutomorphicSpectralTheory AS.2 | Existing DIT (57)–(60) suppliers are retained; only the differentiated cusp bound for DIT 7.10/Stokes is additional. |
| 23 | GeometricNumberTheory GN.3 | Ordinary/narrow quadratic-class CM and oriented real-geodesic dictionary, stabilizers and length `2 log epsilon`; not Nielsen-core geometry. |
| 24 | ClassFieldTheory Layer 13 | Quadratic conductor–relative-discriminant formula. |
| 25 | GlobalNumberFields Layer 10 | Finite-order real sign character and the odd Gamma branch. |
| 26 | GlobalNumberFields Layer 2 | Ordinary/narrow class carriers and finite ideal partition. |
| 27 | ArithmeticDirichletSeries Layer 4 | Locally finite inclusive prime-ideal counts and the actual norm carrier. |
| 28 | ArithmeticDirichletSeries Layer 6 | Smoothed quadratic-Hecke Perron kernel `Y^s/(s(s+1))`; AN owns the quantitative contour argument. |
| 29 | ArithmeticDirichletSeries Layer 5 | Quadratic splitting counts and prime-power/Abel adapters; quantitative analytic errors belong to AN. |
| 30 | NumberFieldArithmetic Layer 1 | Existing double-coset prime decomposition with residue degrees and ideal norms. |
| 31 | InductionRestriction IR.3 | Existing Mackey restriction isomorphism; AN proves the ramified determinant adapter. |
| 32 | ClassFieldTheory Layer 7 | Local conductor exponent and the unramified/inertia criterion. |
| 33 | Formerly SV.1 | Mangoldt window including higher prime powers for `T>=1`, `m>=T^2`: now `AN.5/plan/mangoldt-short-window-bound`. Analytic proof adapters remain open. |
| 34 | UniversalCoverings UC.0 | Canonical based covers, topology, path/homotopy lifting and deck action. |
| 35 | UniversalCoverings UC.2 | Regular quotient cover from the second commutator subgroup. |
| 36 | GlobalNumberFields Layer 10 | Primitive quadratic field character, Kronecker factor at two, parity and conductor. |
| 37 | NumberFieldArithmetic Layer 7 | Actual degree-2g CM normal closure, faithful permutation degree bound and uniform discriminant refinement; Artin conductor supplier remains distinct. |
| 38 | Completed ContourIntegration | Current residue/argument-principle contracts; AN proves its rectangle/order/limit adapters. |

### AN.8 part: 15 requests

| Index | Supplier | Contract and assembly disposition |
|---:|---|---|
| 00 | ArithmeticStatistics ST.2 | Primitive real-character quadratic large sieve with Heath–Brown fourth-moment consequence; moves below the former higher-tier SV.2 request into the tier-14 bundle. |
| 01 | ST.0 | Bounded-discriminant finiteness and inverse-automorphism coefficients for all locally free cubic rings, including reducible/nonmaximal ones. |
| 02 | ST.1 | Binary cubic twisted action/orbits, trace-three dual lattice and nonprincipal-module adelic patching. |
| 03 | AL.0 | Normalized Schwartz–Bruhat/Poisson in `F^4` and lattice bounds; singular distributions remain AN.8 obligations. |
| 04 | AdelicAlgebraicGroups AA.2 | GL2 quotient measures, inversion transport and Siegel majorants; normalized additive Haar comes from AA.0. |
| 05 | ST.3 | LOWW Lemma 3.5 cubic-field count with class-group two-torsion and degree/discriminant-uniform dependence. |
| 06 | AN.7, internal | Normalized Barnes product, logarithmic derivative, divisor and asymptotic: `AN.7/plan/barnes-g-function`. Original proof/formal adapter remains open. |
| 07 | ArithmeticLocallySymmetricSpaces ALS.0 | Compact connected oriented torsion-free hyperbolic surface, curvature -1, area `4pi(g-1)`, primitive conjugacy classes and lengths. |
| 08 | AutomorphicSpectralTheory AS.4 | Scalar positive Laplacian, discrete eigenbasis, simple zero eigenvalue, Weyl law and uniform heat bounds. |
| 09 | AS.6 | Scalar Gaussian heat trace and the primitive/oriented geodesic-counting conventions. |
| 10 | GlobalNumberFields Layer 10 | Compatible finite-cyclotomic Galois restrictions and their inverse limit; no global Artin existence theorem. |
| 11 | AS.2 | Normalized rank-one GL2 Eisenstein constant term, residue and quantitative nonconstant bound from Wright §6. |
| 12 | AA.0 | Additive Haar with `mass(Zp)=1` and restricted-product compatibility. AN owns the beta-dependent local density and its adelic scaling extension. |
| 13 | GlobalNumberFields Layer 4 | Actual finite-adèle arithmetic and integral compact-open subgroup; topology alone supplies no Haar theorem. |
| 14 | Formerly AN.5, internal | Uniform ordinary-Gamma/Stirling is `AN.3/plan/uniform-complex-stirling`. The cubic global quantitative entire-order argument stays open. |

The AN.8 part's 15 `ownershipRequests` expand these same supplier contracts;
retain their exact text and consumer lists. One historical Barnes ownership
entry also names the cubic archimedean consumer: the reconciled prerequisite
table above supersedes that association. Barnes G is not its Gamma supplier.

## Collected ownership / restructuring proposals

Neither part has a top-level `restructure` array. They have seven AN.0
`ownershipRequests`, fifteen AN.8 `ownershipRequests`, and the following explicit
OperatorTheory extension proposal. These are proposals/requests, not newly
approved restructurings; no roadmap or link outside this issue was changed.

The seven AN.0 ownership items, in their existing order, are:

1. **Chebotarev, Part II: arithmetic schemes.** Serre §9's logarithmic-norm-weighted
   density for finite étale Galois covers of normal integral finite-type
   Z-schemes, including fundamental-group Frobenius classes and the split cover.
   Current number-field Chebotarev does not provide this theorem.
2. **AC.4 route decision.** Green–Tao 2008 requires the quantitative zeta strip,
   weak convexity and the prescribed Siegel–Walfisz range for its W-trick.
   A change to a narrower CFZ route belongs to the consumer owner; it was not
   silently made in this assembly.
3. **CM Part II finite-family suppliers.** For an actual normal closure, finite
   permutation-group, odd-irrep and induction coefficient/support bounds with
   dependence only on g; this is more than assuming an arbitrary Galois group.
4. **GlobalNumberFields regulator refinement.** A fixed-degree lower bound for
   the correctly normalized relative regulator ratio, via Friedman–Skoruppa.
5. **Effective Chebotarev owner.** The formerly unnamed “Zeros of L-functions”
   direction is now concretely `AN.4/plan/effective-chebotarev`. Its proof gaps
   remain. Koymans–Pagano box counting is a consumer, not a second owner.
6. **Fuchsian orbifolds, Part II.** Quadratic Nielsen cores, oriented boundary
   multiplicities and the real-quadratic geometric dictionary beyond GN.3 and
   the existing AS.1–AS.2 Eisenstein inputs.
7. **Artin representations conductor owner.** General ramification filtrations,
   invariant-codimension Artin conductors, independence/integrality, direct sums,
   conductor–discriminant comparison and the fixed-CM-degree uniform estimate.
   The current NumberFieldArithmetic boundary does not assert all of this.

The AN.8 `ownershipProposal` is **Operator theory, Part II: C*-dynamics and
nonsingular factors**, extending the existing OperatorTheory roadmap without
replanning its current layers. Its six `upstreamExtensionRequests` are:

| Contract | Requested generic theorem / construction |
|---|---|
| `OP2-universal` | Bounded-generator algebraic GNS, universal C*-seminorm and completion; do not invoke C*-GNS before the C*-algebra exists. |
| `OP2-dilation-corner` | Cancellative Ore semigroup actions, minimal automorphic dilation, full-corner covariance and amenable full/reduced comparison (Laca Theorems 2.1.1, 2.2.1). |
| `OP2-kms` | Point-norm-continuous C*-dynamics, bounded closed-strip KMS, upper-half-plane ground states and weak KMS-infinity; analytic-core extension, and KMS-infinity implies ground, without asserting the converse. |
| `OP2-expectation-measure` | Faithful conditional expectation on reduced crossed products and compact-open full corners; scaling-measure/diagonal-KMS correspondence including measure uniqueness. |
| `OP2-ratio` | Target-evaluated Radon–Nikodym ratio set, asymptotic product ratio inclusion with recurrence, measured-orbit invariance and unit-quotient lifting, on nonzero standard sigma-finite spaces. |
| `OP2-factor` | Essentially free ergodic measured crossed-product von Neumann factor, center/invariant comparison, full nonnegative ratio set implies type III_1, nonzero-corner invariance and the diagonal-state GNS compression. |

AN.9 retains the arithmetic prime-pair, cylinder, character and beta-density
witness proofs. Its six generic contracts are supplier extensions, not six
new AN.9 operator-theory developments. The accepted whole review also moved
Shiu, the Mangoldt window and moment normalization below their earlier SV/PM
requests; future consumer packages should import their AN.5 targets.

## Validation and next step

- Both part packets and the unchanged whole packet pass `check_blueprint.py`
  with zero errors and zero warnings. AN.8 now has 54 baseline receipts and
  14 gaps; AN.0 retains 169 receipts and 44 gaps. The whole packet retains its
  58 gaps; those counts describe different granularities and are not additive.
- A direct inventory comparison preserves every reviewed node field except
  the thirteen prerequisite lists. All reviews and all `unchecked` statuses
  are unchanged. The 733-node explicit prerequisite graph across the parts
  and whole packet has no unresolved internal reference and is acyclic.
- The reader retains all 239 statements, hypotheses and target proof steps,
  all 317 API and 261 test statements, and all 263 ingredient statements and
  their proof arguments. Local document links and explicit target anchors resolve.
- The final 443-line combined suggested file elaborates at the prescribed pins:
  exit 0, 51 `sorry` warnings and no other warnings/errors. Temporary baseline
  `#check`s were removed. A code-only comparison confirms unchanged signatures
  and bodies. No admitted data was introduced.
- `intake.py check-files` reports five files and zero problems;
  `scripts/check_sorry_data.py` and `git diff --check` pass.

For a reproducible inventory, let P be the union of both parts' node IDs,
T the whole packet's `predecessorTargets.predecessor`, D its
`proofDependencies.id`, and I its `supersededTargets.id`. Check that T, D and I
are pairwise disjoint and `P = T union D union I`. For the graph check, take
all `nodes.id` from the three packets and only explicit `prerequisites` edges
between those IDs, then topologically sort. This checks the recorded internal
interfaces, not the truth or closure of the external supplier requests. The
scratch comparison scripts and compiler logs are disposable; the counts,
pins, exact changed IDs and validation outcomes needed by the next worker
are recorded here.

Resume with the targeted independent assembly check described above and the
normal package/integration workflow, using the accepted whole-roadmap packet
and the identifier concordance. Source-proof acquisition, supplier requests,
the current-versus-pinned integration obligations and all recorded analytic
gaps remain future formalization work. This assembly does not need another
worker to concatenate the obsolete prototypes or re-plan current upstream work.
