# BP-ColemanPowerSeries — continuous norm-fixed limits

Codex — codex-7e92bd. Refs #699. Winning claim 5852348746 was confirmed by
bot 5852349508; the full issue was read before and after confirmation.
The five stages L0–L4 remain in scope, part null. This is a partial checkpoint;
all implementation statuses remain unchecked and no stage is closed.

Twelve new L1 nodes supply inverse Frobenius-coordinate continuity, norm and
trace continuity, Cauchy coefficients of norm iterates, the actual series limit,
its convergence and uniform precision, fixedness, multiplicativity, identity on
fixed inputs, invertibility and continuity. One new construction has seven API
entries, each promoted to its own node, and four typed examples. The norm-fixed
limit is the sixth L1 planet.

Totals: **69 nodes** (2 definition, 7 construction, 53 lemma, 5 theorem,
2 comparison); **48 API entries**; **33 definition/construction tests** plus
23 other packet tests; **58 typed examples**; **8 planets**; **76 baseline
declarations**; **6 gaps**, **12 requests**, **11 source findings** and
**0 closed stages**. All 57 predecessor node objects, all 68 prior baseline
records, all 11 source findings and the entire preceding suggested file are
preserved exactly. Only the PMIA L2 request and L1 continuation boundary are
narrowed; the other requests and stage coverage are preserved.

## Proof architecture

The inherited assembly is a continuous bijection from compact B^p to Hausdorff
B, where B=ℤ_p[[T]] has its coefficientwise p-adic topology. Its inverse is
continuous and uniqueness identifies it with Frobenius basis coordinates.
The explicit multiplication matrix then proves continuity of the determinant
norm; the trace-coordinate formula proves continuity of the trace.

The existing two-index congruence bounds each coefficient difference by
p^(−k−1), uniformly in the input unit. Completeness gives the coefficientwise
limit L. The set p^(k+1)B is compact and closed, so the same divisibility holds
for L(u)−N^[k](u). Continuity of N gives fixedness. Multiplication passes to
the limit, fixed inputs remain fixed, and L(u)L(u⁻¹)=L(1)=1 proves that L(u)
is a unit. Uniform coefficient error bounds prove continuity of L.

No new power-series, unit, bounded-measure or ψ carrier is introduced. The
construction includes p=2 from the preceding determinant congruences; it does
not extend the odd-prime arithmetic tower theorem. At p=2, N(Y)=−Y and −Y
is fixed, so L(Y)=−Y; at p=3, L(Y)=Y. At p=2, L(−1)=1.

## Reading and ownership

Read the full issue, campaign, all five reviewed AUDIT24 entries and their
review metadata, all five stage descriptions and thirteen edges, the current
handoff, accepted RS16 Coleman layer/owner decisions and the five exact
touching link records. The binding protocols and the previously read
LocalFieldsRamification and Multiquadratic upstream models were byte-checked
unchanged. RS16 retains determinant-norm continuity and norm iteration in L1.

Read every inherited node statement, the focal L1 proof/API chain and norm
congruence proofs, the ten later signed/p-adic proof plans, and all eleven
source findings. The first 40 nodes match the earlier session-authored snapshot
exactly. The reader was read in its conventions and relevant L1/continuation
sections; no entire-reader reread is claimed. Both pinned trees and related
packet statements were screened for an exact supplier; no competing Coleman
norm-limit construction was found. Generic topology and determinants are
reused from Mathlib.

Fresh public source reads: Coates–Sujatha printed17–19/PDF27–29, including
Corollary2.3.4, and RJW printed167–169/PDF68–70, all six page texts read in full.
Fresh download hashes match the recorded editions:
`38178a8a147169c3750b7693c46c7453954790b101b37c2690f8e8cda91b0789`
and `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`.
The continuity, inverse-witness and uniform-limit details are explicit worker
elaborations. The book fixes odd p; the dyadic algebra is independently justified.
No all-paper reading, new erratum or independent-review verdict is asserted.

PMIA PR3170 has merged. Its exact root-translation, root-average,
root-average-integral-descent and rational-root-average-descent nodes were
authored and checked in this session and refreshed as an input here. A concurrent sixteen-node PMIA continuation also supplies the bounded inverse
and actual integral-to-R coefficient extension, including Amice, test-function,
pushforward and weight comparisons. All sixteen statements and hypotheses were
read, and all 101 preceding node objects are unchanged. The request now concerns
receiving-ring instances, lattice/scaling, measure topology and
unit-dilation/binomial-substitution interfaces. The Coleman normalized-trace,
determinant/product and arithmetic-action comparisons remain its own work.

## Validation

The complete suggested file compiles: **0 errors, 147 warnings**, all proof
placeholders, with **2,252 imported Mathlib sources** byte-verified against
the pin and no Tau Ceti imports. It contains 58 typed examples. The actual
import parser excludes nested comments and audits only reached modules.

Six complete scratch Lean examples and three sensitive telescopes pass with
no warnings: compact inverse continuity on these coefficient spaces, closed
p-power multiples, complete coefficient limits, a concrete inverse witness,
the dyadic determinant sign, and uniform-limit continuity. The compactness
adapter explicitly specializes Pi.compactSpace to the underlying coefficient
function type; ordinary instance inference through PowerSeries did not suffice.
This is reuse of the native product topology and compactness, not a new topology.

Exact determinant regression arithmetic passed **1,847 assertions**, for
p=2,3,5 modulo p^8, seventeen input polynomials per prime and six norm iterations.
Checks cover the two-index precision, approximate fixedness, multiplication,
input perturbations, unit residues, signs and nonunit constants. The p=2 Y
example rejects the false stronger p^(k+2) error bound at k=0.
To reproduce: write f(T) as f(Y−1), form multiplication on the basis
1,Y,…,Y^(p−1) with Y^p=Z, take its determinant over (ℤ/p^8ℤ)[Z], and put
Z=1+T. Iterate this exact polynomial operation. These finite checks do not
prove infinite convergence or continuity.

Indexed blueprint validation: **zero errors and warnings**, using the unmodified
pinned index. Official four-file intake: **zero problems**. The errata wrapper
passes for all eleven inherited findings. Preservation, reader/API/test parity,
source hashes, the 105-edge acyclic internal graph and scoped mutation checks pass.

Publication guard: all 21 captured inputs and the four predecessor output
blobs match main `53f06e0559ab2ee495667979348b29c5616a028f`. The issue body and winning
claim are unchanged. The refreshed PMIA supplier statements narrow the request;
no Coleman norm-limit prerequisite changed. Exactly the four authorized files
are submitted using Git Data REST. No git command was used.

## Exact next work

Compare the normalized integral trace with the actual PMIA bounded ψ, using
the supplied averaging interfaces or continuity plus polynomial density. Prove
the determinant/product comparison over completed extended coefficients with
descent. Continue arithmetic norm/evaluation compatibility and actual
finite-level lifts, then interpolation uniqueness and compact surjectivity
onto the genuine unit tower. The new series limit supplies one ingredient;
it is not the tower isomorphism.

Retain the remaining L0 tower/module work, L2 Coleman-map sign and action
comparisons, L3 topological exact sequences/coefficient extension, and L4 local
cyclotomic quotient. Original Coleman1979 and precise coefficient variants
remain source obligations. Do not rebuild bounded operators or global
cyclotomic groups here.

The preceding handoff and its historical evidence remain at
[snapshot a6fef00](https://github.com/CBirkbeck/tauceti-explorer/blob/a6fef00401eceb26dfb065a063ed39fc3668a020/research/blueprint/handoff/BP-ColemanPowerSeries.md).
