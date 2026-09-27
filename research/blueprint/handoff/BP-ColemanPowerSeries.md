# BP-ColemanPowerSeries — integral trace and bounded psi

Codex — codex-7e92bd. Refs #699. Own-job follow-up to merged PR3173 under
WORKERS. Original claim comment5852348746 was confirmed by bot5852349508;
the winning reply and the entire issue were reread. No second claim was made.
All 69 prior node objects, 76 baseline records, eleven source findings, eight
planets and stage statuses are preserved. L1/L2 trace-related remaining work
and the corresponding PMIA request wording are narrowed. A fresh Dirichlet
supplier removes the obsolete root-average gap wording; the six gap records
and twelve requests remain. No stage is closed.

Totals: **75 nodes** (2 definitions, 7 constructions, 56 lemmas,
5 theorems, 5 comparisons); **48 API items**;
**66 packet tests**, including 33 definition/construction
tests; **68 typed examples**; **8 planets**;
**83 baseline references**; **6 gaps**, **12 requests**,
**11 source findings**, **0 closed stages**. Every implementation status is unchecked.

## What this supplies

The existing finite-free trace for the explicit Frobenius scalar algebra
takes values in the ordinary base B=ℤ_p[[T]]. Its integral comparison is
τ(F)=pψ(F), with the actual PMIA bounded operator. The source's embedded trace
is φτ(F), explaining the different convention in the normalized-trace sentence.
There is no division by p inside B and no trace-defined replacement for ψ.

Six nodes promote the existing scalar-compatibility API, calculate τ(Y^n),
compare on polynomials, extend the comparison by coefficientwise continuity,
identify the zeroth Frobenius coordinate, and identify the embedded trace
with the existing integral root sum. Five new lemma/theorem signatures and
ten typed tests are added; the promoted scalar signature already occurs in
the inherited trace API. All prior seed bytes are retained between two new
imports and the appended comparison block.

The proof imports the exact PMIA nodes psi-series, phi-psi-natural-powers,
psi-series-phi, psi-series-continuous, integral-coefficient-map and root-average.
Natural-power values of ψ are derived inside the comparison from those exact
suppliers; no generic bounded-operator node is duplicated. Root translations
take values in the existing integer ring of ℂ_p, and are not presented as
automorphisms of ℤ_p[[T]]. The theorem includes p=2 by this algebraic proof.

## Reading and validation

Read the owner document, reviewed AUDIT24 L0/L1/L2 targets with the relevant
L1 row in full, the accepted RS16 Coleman ownership, every touching link
record, and exact basis/trace and PMIA supplier interfaces. The prior twelve
norm-limit nodes were read in full. Scope is the current trace comparison,
not a new claim to have reread every old source or proof. Binding protocols,
audit/review, owner and previously read upstream LocalFieldsRamification,
Multiquadratic and JacobianChallenge models match the captured read versions.
The PMIA packet and seed match our merged PR3172 output. The Dirichlet packet
was refreshed at main 797977d5a6a116d94aca5543f14d411cf3215d1b. Its six changed
L1 records were read; their statements are unchanged and the averaging argument
now imports exact suppliers. Its seven new L4 nodes are outside this task.

Public [RJW published version](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf),
printed167/PDF68, read in full, including the sentence after Lemma10.8;
SHA256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`.
The full [arXiv v2](https://arxiv.org/pdf/2309.15692v2) PDF21, §3.5.5,
was read for the independent bounded operator and root-average conventions;
SHA256 `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`.
Accessed 27 September2026. The polynomial-density decomposition is a worker
derivation. No new source finding is made, and all eleven findings remain.

Both pinned libraries and the packet inventory were screened. The existing
Mathlib normalized trace is defined for field extensions and does not provide
this integral bounded-operator comparison. Seven new baseline records are
added after reading their exact statements. The existing trace, scalar action,
polynomial inclusion, Taylor equivalence, monomial induction and density are
used at their pinned hypotheses. The unmodified declaration index is used.

The actual full suggested file compiles with **0 errors and 162
expected placeholder warnings only**. Its actual imported PMIA seed also
compiles, with **255 expected placeholder warnings**.
All 2752 reached Mathlib source modules match the pin; no Tau Ceti
module is reached. Seed SHA256: `e386f767514b02d01a9c2b5ff1548ce3c840b47dc046f8387d7cb788731434d2`.
The explicit Frobenius module in the coordinate signature is retained.

A separate complete two-lemma scratch proof checks polynomial comparison from
powers of 1+T via Taylor translation and the continuous dense-range extension.
It compiles with **0 errors, 0 warnings, 0 placeholders**, reaching
2031 pinned Mathlib source modules. SHA256:
`972b60bd4de077a5c8676faf81fd292931f5b23edd483ec7d11d1a8a701f9afc`. The generic argument verifies the density step;
the roadmap still imports the trace and bounded-psi continuity nodes.

**3,030 exact assertions** compare finite multiplication matrices, the Amice
transforms of finite Dirac combinations, and sums in exact cyclotomic polynomial
quotients for p=2,3,5,7. Sixteen negative controls reject a missing factor p,
an extra Frobenius, the ordinary self-algebra, and confusion with the norm.
Reproduce the matrix with basis 1,Y,…,Y^(p−1) and relation Y^p=U, substitute
U=1+T in its trace, and independently restrict the Dirac masses to pℤ_p and
divide their support by p. The root sum is computed modulo
1+ζ+⋯+ζ^(p−1). These finite checks do not prove infinite continuity.

The unmodified-index blueprint validator reports zero errors and warnings; the exact four-file intake reports zero problems. The dependency graph is acyclic, and reader/signature/test parity passes. Fresh main `797977d5a6a116d94aca5543f14d411cf3215d1b` matches all 24 captured inputs and all four predecessor output blobs. The issue body and own winning confirmation5852349508 are unchanged; #699 is available and review #374 is unclaimed. No manual merge or independent review was performed.

## Exact continuation

Use coleman-trace-psi and frobenius-zeroth-coordinate-psi in L2. Establish the
logarithmic-derivative/norm compatibility before passing from norm-fixed units
to ψ-fixed series. The determinant/root-product formula, arithmetic
norm/evaluation compatibility and finite-level lifts remain in L1. Then prove
interpolation uniqueness and surjectivity onto the actual norm-compatible
tower using the already supplied norm-fixed limit. That series limit is not
itself an arithmetic interpolation map.

L0 still needs the actual cyclotomic towers and modules; L2 the Coleman map,
its action and arithmetic normalization; L3 the exact sequences; L4 the local
cyclotomic-unit quotient. Receiving coefficient-ring instances and the precise
unramified variants remain distinct obligations. All exact coverage lists and
supplier requests are retained with only the completed trace work narrowed.

The preceding handoff is retained in [PR3173](https://github.com/CBirkbeck/tauceti-explorer/pull/3173).
