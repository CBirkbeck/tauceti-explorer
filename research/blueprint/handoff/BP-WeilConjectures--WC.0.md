# Handoff: BP-WeilConjectures--WC.0

Issue #1005. Continuing agent **Codex — codex-a71f92**, 26 September 2026.
Claim comment **5849052090**, winning bot confirmation **5849053184**; the whole issue
was reread after confirmation. This continues ChatGPT Pro session cp-20260926-6f2c's
merged checkpoint PR #2943; all twelve inherited node IDs and statements are preserved.
Input snapshot: bb5169e6ac6ef3639aeb180798ae86cd46837577.

## Status and deliverables

The independent child **WC.5:power-sum-converse is blueprint-closed**. The whole
eight-stage part remains **partial**: WC.0–WC.5 and WC.5:surface-alternative still
need geometric source decomposition. No implementation is claimed.

Only these four authorized deliverables change:

- research/blueprint/packets/WeilConjectures--WC.0.json
- research/blueprint/readmes/WeilConjectures--WC.0.md
- research/blueprint/suggested/WeilConjectures--WC.0.lean
- research/blueprint/handoff/BP-WeilConjectures--WC.0.md

Totals: **14 nodes (4 lemmas, 10 theorems), 6 planets, 24 checked baseline
declarations, 1 gap covering the seven untouched stages, 0 requests, 1 source
issue**. There are **0 new definitions, 0 definition API items and 0 definition
unit tests**. The suggested file has **14 signatures and 20 acceptance examples**,
all with admitted proofs.

## What this continuation adds

Two declaration-sized nodes close the formal-carrier gap:

1. **formal-power-sum-product:** over every commutative ring, including rings with
   zero divisors, the positive-moment series G satisfies DG=N for the existing
   common polynomial numerator and denominator. The proof rescales Mathlib's
   existing formal geometric series, shifts coefficients and clears the finite
   product denominator. No logarithm or division by an index is used.
2. **formal-rational-comparison:** over a field, the existing PowerSeries and
   RatFunc images agree in the existing LaurentSeries field. D(0)=1 proves its
   image nonzero; the checked embeddings and quotient map give G=N/D there.
   The negative coefficients and constant coefficient vanish, and every positive
   coefficient is the corresponding weighted moment.

Five new acceptance examples cover coefficients and indexing, the actual one-root
Laurent comparison, the empty family, characteristic-two cancellation and a zero
root at exponent zero. No replacement series, rational-function, norm or geometric
carrier is introduced. The earlier converse, grouping, pole and pairing arguments
remain independent of geometric purity.

The inherited file's leading module-doc comment before imports failed Lean's
import ordering; it is now an ordinary block comment. The new rational algebra
map also required opening the existing RatFunc scope (its liftAlgebra instance
is scoped). These were elaboration repairs, not changes in mathematical claims.

The timeless document now gives the two full proof plans, the exact baseline
interfaces and all twenty acceptance examples. The earlier repeated references
to Milne now distinguish his logarithmic identity from the workers' separate
weighted geometric-series derivation.

## Sources and mathematical qualification

The reviewed library coverage, all eight stage descriptions and their incident
edges, accepted RS-17 keeps/suppliers, relevant upstream link entries and the
existing integrated decomposition were inspected. Existing WC.1/WC.2/WC.3/WC.6
IDs and source work are not discarded or newly certified. The binding protocols,
upstream guide and complete upstream JacobianChallenge and HodgeStructures
documents were read during this worker's immediately preceding job on unchanged
inputs.

Every one of the 24 baseline declarations was read in its actual pinned source,
with surrounding hypotheses. The pins remain Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Searches in the existing power-series,
rational-function and Tau Ceti sources preceded the added nodes.

**Yu:** arXiv:1807.04659v5, Appendix C, pp. 79–81 context and complete negative-power
lemma proof read. Page 81 successfully rendered and inspected in this continuation:
the overbars on the p-adic integer ring are visible. The source's integral-weight
case is in the integral closure of Z_p in an algebraic closure of Q_p; the inherited
normed-field proof still gives the claimed stronger result without completeness.
The journal version was not collated and no Yu source error is asserted.
PDF SHA-256: 9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c.

**Milne:** author's LEC v2.21 dated 22 March 2013, Lemma 27.5 and full proof,
pp. 155–156, freshly read as text and images. The surrounding trace and application
passages were read for context, not newly decomposed.
PDF SHA-256: ac4f122f371d38a44c58c296b7dbf88081d89d2de2334070bff3606771c01077.

**Source issue WeilConjectures/E-WC0-1:** the standalone logarithmic identity in
Lemma 27.5 needs characteristic zero, missing from its stated field hypothesis.
The identity endomorphism over F_p already requires division by p. The preceding
power-trace identity and the geometric Q_ℓ application are unaffected. The author's
current course-note listing and complete LEC section of the course-note errata
were checked; no matching correction was listed. The finding is scoped to these
course notes, not the different published 1980 book, and awaits independent review.
The formal series nodes use the corrected characteristic-independent,
division-free route.

## Checks actually run in this continuation

- Official scripts/check_blueprint.py with the exact pinned declaration index:
  **0 errors, 0 warnings**.
- Source-issue schema and source-version checks: **pass**.
- Swarm intake check-files on exactly the four deliverables: **pass**.
- Exact eight-stage scope, unique/current IDs, unchecked statuses, correspondence
  between all 14 nodes and signatures, and 20 acceptance markers: **pass**.
- Combined graph built from atlas stage edges, integrated nodes and all available
  packet nodes, including node-to-realised-stage exports: **6,760 declaration IDs,
  41,609 edges**. No cycle touches any of the 14 current nodes; every ancestor of
  those nodes is an internal node or checked baseline reference. This does **not**
  certify unrelated atlas components, and no false parent-stage dependency was
  added to the independent child.
- **1,025 exact coefficient checks** for DG=N and another 1,025 matching coefficients
  of formal division by D, across Q, F₂, F₃, Z/4Z and Z/6Z, 25 coefficients per case.
  These include empty and zero-root families, unequal/repeated roots, cancellation
  and rational coefficients. This is regression evidence, not a proof.
- The entire suggested file elaborates using Lean **v4.34.0-rc2** and the exact
  Mathlib pin's prebuilt dependency cache: **exit 0, 34 warnings, all exclusively
  declarations using admitted proofs**. Fourteen signatures plus twenty examples
  are typechecked; no theorem or example has been proved by this check.

The original checkpoint reported 1,260 inverse-Vandermonde identities, 1,260
moment-window inequalities, 9 quotient identities, 72 coefficients, 7 pole tests,
24 characteristic-p cancellation checks and 16 p-adic escape checks. Those remain
**the previous worker's reported checks**, not fresh executions by this worker.
The current source, official validator, formal regression and elaboration checks
supersede the original handoff's uncompiled/failed-rendering caveats.

## Where to resume

1. Continue WC.0's actual finite-type rational-point finiteness, field-isomorphism
   and extension-tower interfaces and private-snapshot reconciliation. Existing
   integral étale carriers are not a finite-dimensional rational realization.
2. Refine the integrated WC.1 and WC.2 nodes using the exact PR196 trace/Euler
   suppliers and EDC duality interfaces. Do not define zeta a second time.
3. For WC.3 preserve the stable node
   WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity as the
   projective geometric application, and separate out the generic weight-separated
   factor-extraction lemma required by RS-17 and the WC.6 checkpoint (PR #2956).
   It must accept any constructed degreewise-pure realization, retain
   multiplicities and all algebraic conjugates, and establish rational descent,
   integral normalization and realization independence. This continuation inspected
   the mismatch but did not add or certify the generic extraction proof.
4. Continue WC.4's supplied-family comparison and WC.5's higher-dimensional
   estimates/recurrences within RS-17. A coherent genus formula alone does not
   identify étale b₁ with 2g; request the actual curve/Jacobian supplier.
5. Decompose the SF.5 diagonal/Frobenius-graph intersection calculations for every
   extension in the surface route, then use this closed numerical child and
   purity-independent WC.2 pairing. Never shortcut through DWP.1/DWP.4 or the
   RH-derived parent estimate.

The finite-spectrum child is complete as a blueprint; the seven geometric stages
are not. Keep the one explicit remaining gap and partial packet status until
their genuine source and supplier obligations are met.
