# PAPER-GILLE-PARIMALA-26 checkpoint

Codex — codex-c83e7a; issue #1197; 21 September 2026.

Read the complete 26-page HAL v5 author manuscript and the May 26 2026 errata entry. Extracted 128 items: 6 library, 4 planned, 118 missing; nine routes cover 113 missing plus one planned item. All 39 definitions/constructions have an API and three tests. Preserve `status: partial`.

Resume with the five unrouted assertions:

1. G1 `PAPER-GILLE-PARIMALA-26/37`: compare final Proposition 3.3 wording with the author V/V derivative typo. The corrected V/W theorem already has a proof route using Mathlib strict submersion.
2. G2 `PAPER-GILLE-PARIMALA-26/55`, `PAPER-GILLE-PARIMALA-26/56`: read Kaletha–Prasad Proposition 2.14, Harder torus approximation and Tits normal-subgroup theorem at their exact valued-field scope. Preserve the closure bar, power subgroup and F1-isotropy distinctions. This optional theorem is not a dependency of the main result.
3. G3 `PAPER-GILLE-PARIMALA-26/76`: verify final publication against the reversed Tits-index inclusions in the author manuscript. Correct Delta_0 formula is stable closure of the union of local minimal types, not smallest subset inside them.
4. G4 `PAPER-GILLE-PARIMALA-26/90`: acquire CTS Theorem 6.13 and inspect the Appendix 7 extension to affine linear quotients, including flatness/finiteness. The narrower main-proof application also owes this proof inspection.

Then extract the prerequisite interiors in the ledger: HH finite-model/field patching, HHK completed-patch spreading, HHKP rank-one comparison, PS elementary independence, Kneser–Tits R comparison, Lipman SNC resolution, MPW flags, CGP restriction and fixed loci, Raghunathan torus Lie span, GP1 gluing, Margaux limits, SGA3 and orbit quotient. Targeted Gille2024, GPS2021, GS and CGR reads are recorded; these are not claims to have read every prerequisite completely.

Do not use the downloaded publisher PDF endpoint as article text: it returned a rendering of the paywall page. The source hashes and locator convention are in the report. The errata's series is also wrong: sum(t^n/x^n)=t/(x−t). Use factorial pole growth and the denominator coefficient recurrence. Complete the local ring before the loop argument, enlarge an SNC coordinate divisor when needed, and keep arbitrary residue fields and inseparable Weil restriction throughout.

The new candidate `ReductiveGroupsPartIISemiglobalFlags` extends the upstream reductive-group roadmap, importing SF, RG2 and IG. It is a proposal, not an accepted planned owner. Check for newly accepted routes before continuing. No Lean deliverable or compilation; schema, scope, route, API/test and exact finite-boundary checks pass. Submit only this job's JSON, report and handoff.
