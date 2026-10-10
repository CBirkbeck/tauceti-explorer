# Independent review of the ST.2 counting refinement

**Verdict: accepted as a complete target-level planning pass, with explicit gaps.**
Codex session `codex-8zBjhT` reviewed job `BP-ArithmeticStatistics--ST.2`
independently for issue #6312 on 10 October 2026. The input was produced by
session `codex-hx9NVx` and submitted in #8613. This reviewer did not produce
that input.

The packet's `review.checked` records a separate finding for every node:
18 verified and 33 corrected, with no added or unverifiable nodes. Corrections
include statements, hypotheses, proof qualifications, source locators and the
construction API. All 51 nodes retain `implementationStatus: unchecked`.
The stage is `planned`, with zero closed stages. Acceptance uses PROTOCOL
§0's definition of a finished planning pass; it does not certify the open
even-degree repairs or turn the suggested signatures into proofs.

| Item | Reviewed result |
|---|---|
| Nodes | 51: 48 theorems, 2 constructions, 1 definition |
| Public source versions | 15 PDFs; every registered SHA-256 matched |
| Pinned baseline citations | 10 confirmed; none removed or replaced |
| Definition/construction API | 11 items, including one added finite-fibre compatibility item |
| Definition/construction tests | 10, including one added stabilizer test |
| Recorded gaps | 13, with affected targets identified |
| Supplier requests | 4, still open |
| Source findings | 15 confirmed at their registered versions; one inherited finding narrowed |
| Suggested interfaces | 8 nodes prototyped; 43 native theorem interfaces explicitly omitted |
| New planets | 0; the parent packet's six landmarks remain the landmark policy |

## Mathematical corrections

Finite congruence counts now use the actual residue density modulo a defining
modulus. A product of densities of individual local closures is valid when
the prime-power conditions are imposed independently. It loses information
for coupled conditions: the two residue pairs `(0,0)` and `(1,1)` modulo
3 and 5 have density `2/15`, while their marginal densities have product
`4/15`. This fixes the quartic, quintic, BGW pencil and degree-three,
degree-four and degree-five genus-one finite counts. The BGW infinite-weight
upper bound incorporates local indicators into its factors; coupled finite
conditions first split into disjoint product residue conditions. An upper
bound has not become an equality.

The global-field targets now require the arithmetic group to preserve the
coefficient lattice and state the source's stabilizer-weighted count. The
fundamental domain belongs to that exact group. Number fields use a height
inequality; function fields use exact discriminant-norm shells and admissible
norm values. Local coefficient measure has `vol(L_p)=1`, and an infinite
local subset is the actual intersection of its independently imposed factors.
These conventions follow Global Fields I §4.1, Theorem 4.7 on p.18 and
Theorems 5.1–5.3 on pp.18–21.

Quadratic extensions use Global Fields I's affine, nonreductive model from
§§9.1–9.4, pp.25–28: monic binary quadratics under the triangular
change-of-generator group. Table 1's one-dimensional reductive model does
not parametrize quadratic extensions in characteristic two. The tail is first
stated for the standard arithmetic lattice; the fixed-denominator and
finite-index comparison for a commensurable invariant lattice is an explicit
G-global obligation. Extra ramification is handled by the codimension-two
locus, and nonmaximality without extra ramification by local maximalization
and bounded orbit fibres. These are intrinsic ring properties. Ordinary
squarefree discriminant is not the quadratic maximality condition in
characteristic two; §9.3 on p.27 provides the needed separate argument.

The invariant geometric-sieve criterion now retains the precise six
hypotheses of the source, p.8: `G^1` is the kernel of the representation
determinant; the generic locus is invariant and has density one; the geometric
stabilizers are uniformly finite; each `Y_k` is a closed invariant subscheme
depending only on `k`; and the rational moves remain integral and generic,
with uniformly bounded original orbit fibres for fixed `k`. Positive rank,
positive degree and the uniform exponent inequality are explicit. Compact
truncation and boundary regularity for coefficient-box approximation remain
G-criterion. The source's p.17–18 coefficient normalization uses
`c_p/p^(2r)`.

The even binary-form main/shallow estimates now explicitly depend on the
row-lattice counting adapter. They retain the smaller of the two source
main-body savings, giving `1/21` in degree four. The restricted deep-cusp
Gram target remains an open repair, with a large constant-term condition,
the degree of `Delta(x f)` in pencil entries, and the doubled Gram-loss
exponent. Its determinantal-ideal argument and actual-fibre count are not
certified by this review. The restrictions and logarithmic slack propagate
to the summed tail and squarefree sieve.

The binary fixed-modulus sieve now uses its actual tail exponent. For a tail
`X^(n+1+xi)/M^delta + X^(n+1−eta)`, choose
`tau=max(eta,(eta+xi)/delta)` and `M=X^tau`. The errors are
`X^(n+1−eta+epsilon)`, `N^2 X^(n+tau+epsilon)` and
`N^(2n+2) X^((2n+1)tau+epsilon)`. The Euler-product remainder
`X^(n+1)/M` is retained. The source choice `3(eta+xi)` requires
`delta>=1/3`; an arbitrary positive `delta` does not suffice. The odd tail
has `delta=1/2`, yielding the sharper `tau=1/n`. The degree-two
finite-modulus argument remains separate. BSW II's relevant Corollary 6.27
and Theorem 7.1 are on pp.51–52.

For the monic reducibility input, the conjugate-factor splitting group has
order at most `2((n/2)!)^2`. Degree four has subgroup index 3 and retains
the weaker exponent `22/3`; degree six has index 10 and still supplies the
non-quartic bound. The rational-root proof uses the average divisor sum,
not a false pointwise logarithmic bound. The negative even `Q` torus
exponents and the distinct final torus coordinate are stated explicitly.

The native genus-one conventions are now explicit. Ternary cubics use
`I=c4/16`, `J=c6/32`. Quaternary models use BS4's determinant-kernel
central quotient, half-integral Gram matrices and resolvent
`16 det(Ax+By)`; this group differs from BGW's pencil group. Quinary
models use BS5's determinant-constrained central quotient on the
50-dimensional space `5 tensor exterior^2(5)`.

The quinary leading coefficient was corrected to
`(|J|/5) vol(G_Z\G_R) N_inv^±(X)`. BS5's real stabilizer has order 5,
and Proposition 24 with equation (18), p.17, retains that divisor. Its
introductory Theorem 12, p.7, omits it in arXiv:1312.7859v1. The acceptable
weighted count inherits the corrected finite coefficient. This discrepancy
is scoped to that preprint, with the body computation supplying the
normalization.

The smoothing construction distinguishes its generic native real sum from
the source's smooth, compactly supported, finite-stabilizer application.
The new finite-fibre API preserves every transporter element. Its new test
uses the order-two permutation group acting trivially on a singleton: for
`Theta=2` and `phi=3`, the kernel is 12. Dropping or averaging the
stabilizer would give 6.

BSS Theorem 5.1, pp.24–25, requires the discrete arithmetic-invariant set
to lie in the real component represented by the section. Matching invariants
alone is insufficient. The unfolding statement now includes this restriction,
the unimodular Haar convention and both stabilizer factors. Theorem 6.3,
p.30, requires arithmetic-invariant weights whose local factors at primes
dividing the special squarefree modulus are exactly the rank-at-most-one
indicators. Uniform weight bounds and the joint parameter restriction remain
explicit. The source proof is on pp.38–39.

Source locators were also corrected for quintic Proposition 19
(pp.1586–1588), BST switching (§9.1, pp.27–28) and its final secondary
local-product argument (§9.7, pp.35–36), BS3 finite congruence
Theorems 17–18 (p.11), the geometric criterion, BGW weights, and the PV
local-density argument (Theorem 3.6 and proof, p.3). PV proves a cube
version; the Euclidean-ball factor stays an explicitly needed adaptation.

## Source findings

Each finding has a version-scoped `review` object naming this job. The seven
inherited findings were checked, and eight findings were added. No source
passage is copied into these deliverables. Searches of the public
arXiv/author/publisher records did not locate applicable later corrections;
that search result is not an assertion that none exists.

| Finding | Result at the registered locator |
|---|---|
| E-ST2-1 | BSW I's summed tail must remove zero discriminants. |
| E-ST2-2 | BSW I's small-modulus boundary error uses `D−1`. |
| E-ST2-3 | The conjugate-factor group order and quartic subgroup index need correction; the weaker quartic bound suffices. |
| E-ST2-4 | BSW II's unrestricted Gram argument has a normalization and ideal-membership gap; the restricted repair is still open. |
| E-ST2-5 | Narrowed to overlapping row-contained lattices and the required counting justification. Equation (74) is not a disjoint sum. |
| E-ST2-6 | The geometric-sieve coefficient denominator is `p^(2r)`. |
| E-ST2-7 | The degree-five genus-one tensor factor has dimension 5. |
| E-ST2-8 | BSW I's rational-root proof needs an average divisor estimate. |
| E-ST2-9 | BS5's introductory constant omits the body computation's real stabilizer divisor 5. |
| E-ST2-10 | BSW II's summed tail likewise needs a nonzero-discriminant domain. |
| E-ST2-11 | BSW II's strong/weak alternative gives the sum of two union bounds. |
| E-ST2-12 | BS4's local no-root exclusion has a reversed description; the ensuing sieve uses the correct direction. |
| E-ST2-13 | Products of marginal local closures require independently imposed finite congruence conditions. |
| E-ST2-14 | BSW I's last even torus coordinate and `Q` exponent sign are misprinted. |
| E-ST2-15 | BSW II's degree-four main-body saving is the minimum `1/21`. |

For E-ST2-5, the source explicitly distinguishes the full-rank set and its
span on p.22. In §6 it uses row-contained lattices, which overlap at zero,
so equation (74), p.47, needs an inequality or disjoint full-rank fibres.
The deep skew box itself forces the small block to vanish for matrices
inside it. The inherited allegation that p.48 derives this solely from
row-space membership has therefore been removed. This finding confirms a
proof obligation and does not independently falsify a tail theorem.

## Baseline, ownership and closure

Every baseline declaration's full statement was read at the exact git object,
not inferred from its name or from the current library. The pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The receipts in
`baseline.declarations` now state this independent check.

| Declaration | Confirmed convention or limitation |
|---|---|
| `Set.ncard` | Natural cardinal is zero for an infinite set; finiteness is required for counting. |
| `Set.ncard_eq_toFinset_card` | Identifies the finite-set cardinal with its converted Finset cardinal. |
| `MulAction.orbitRel` | Supplies the native group-action orbit relation and quotient. |
| `Asymptotics.IsBigOWith` | An eventual norm bound at a filter, with a specified constant; extra-parameter uniformity must be stated. |
| `Asymptotics.IsLittleO` | Arbitrarily small positive norm multipliers at the height filter. |
| `Polynomial.discr` | Uses the polynomial's actual degree and signed resultant convention; it is not the fixed-degree binary-form invariant. |
| `Polynomial.Monic.discr_ne_zero_iff` | Requires a field and monicity; an integral polynomial must pass to the fraction field for this use. |
| `hensels_lemma` | Requires the strict function/derivative norm inequality and the p-adic algebra setup; preserves derivative norm and gives the unique close root. |
| `Nat.divisors` | A finite positive-divisor set; its value at zero is empty. |
| `Squarefree` | Square divisors have unit roots, including the natural unit modulus. |

The reviewed library audit calls ST.2 not built and assigns generic
Davenport counting to GN.4. The parent and ST.1 imports, GN.4's counting
statement and the finite-field supplier were read against their stated
scope. AN.5 covers the requested divisor problems; SV.2's existing
large-sieve inequalities are inputs to the explicitly requested coefficient
counting extension. SF.0's general scheme contract is not treated as an
already available finite-projection or determinantal theorem. All four
requests specify their actual missing uniform statements.

Current Tau Ceti's lattice and boundary counting source files were read
separately from the pin. Its coset-uniform Lipschitz-frontier estimate can
supply compatible regular-region counts; it does not supply every
semialgebraic multiset/cusp estimate. Current IntegralLattices supplies the
generic lattice carriers and basis theory. RealAlgebraicGeometry's analytic
preparation belongs to its CAD route and does not automatically give
the counting boundary adapter. Generic reduction and Tamagawa theory stay
with the current successor owners recorded in `upstreamNotes`.
PolynomialGaloisGroups excludes the quantitative specialization counts
requested here. No current upstream file was changed or compiled.

At target granularity, all three ST.2 targets are represented in
`targetCoverage`. The prerequisite chains end in the pinned baseline,
accepted imported nodes, precise supplier requests or the named gaps.
Nonroutine source inputs remain explicit: quartic/quintic suborder and mass
estimates, cubic secondary optimization, S-arithmetic adapters, weighted
geometric-sieve adaptation, even restricted Gram/counting repairs,
degree-two congruence truncation, genus-one local masses and integral
minimization, smoothing measures, and hypersurface coefficient geometry.
The BKLOS coregular theorem cited as Global Fields II is still unavailable
among the sources checked; its six axioms and finite representative measure
are required by the conditional twist target. Global Fields I has not been
used as its main-term replacement.

## Validation and handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatistics--ST.2.json`
reports **0 errors and 0 warnings**. The registered source-version records
and source-finding schema pass their applicable checks. `git diff --check`
passes. `lean-check research/blueprint/suggested/ArithmeticStatistics--ST.2.lean`
returns exit code 0 at the pinned shared build, with **24 warnings, all
declarations using `sorry`**, and no errors. Available memory was checked
before this single elaboration. Tests and theorem interfaces remain
suggested assertions, not completed proofs.

There is no blocking question for the orchestrator. Assembly/packaging must
synchronize the ST.2 reader with these packet corrections, especially the
finite CRT coefficients, global norm shells and quadratic representation,
degree-five divisor 5, conditional row-lattice counts, binary truncation
exponent and smoothing component restriction. The reader was outside this
review's deliverables and was not edited. The remaining gaps and supplier
requests are the work to complete before claiming closure; the separate
handoff note records the concrete synchronization list.
