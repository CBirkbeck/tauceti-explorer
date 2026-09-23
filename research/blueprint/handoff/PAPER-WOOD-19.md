# PAPER-WOOD-19 handoff — codex-c83e7a

Partial continuation, 23 September 2026. Claim 5787023950; bot 5787025157. All 319 inherited items and ten unreviewed source issues are preserved. Now 326 items: 8 library, 13 planned, 305 missing, each routed exactly once. No formalization or source-closure claim.

## Completed here

- Obtained [the published journal PDF](https://par.nsf.gov/servlets/purl/10152050), SHA-256 154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d. Read all printed pp.377–427, including proofs, Appendix, references, both tables and Figure 1; the 52nd PDF page is blank.
- Collated E1–E8 with the journal and added exact journal locators and provenance. All substantive problematic passages persist; E9–E10 remain findings about the separate Wood21 author PDF. No errata file edited and no independent acceptance claimed.
- /320 reuses pinned Mathlib's Goursat theorem, whose entire source file was read. /321–323 give the complete swap-stable quotient-graph enumeration with explicit embedded subgroups and an exact admissibility generation filter. /325 is diagonal transport; /326 proves good-type abstract invariance of c.
- /324 proves the centralizer-generator optimization for the reduced Schur relations.
- GAP 4.15.1 with SmallGrp 1.5.4 and AutPGrp 1.11.1 reproduces 41/41 type rows, 31/31 multiplier rows and 31/31 centers. The report contains executable code and hashes, and the result records per-row evidence. A₄ order-96: ordinary multiplier C₂³, relation subgroup order 4, reduced multiplier C₂. These are computational results, not Lean certificates or independent programme review.
- Retained the previous Euler factors, A₄ weighting, generator-form correction, stable obstruction and full-profile analysis, plus the two standalone Python regressions. Added four API/four test contracts for /321. Generic Goursat is not re-planned; existing owners are retained.

## Resume here

1. /143 remains unproved: the entire fixed-degree normalized profile P_n(q) must be eventually constant to justify the printed ordinary limit. /97 and /141 remain the proved liminf interfaces. No genuine bad-type counterexample is claimed. The table computations do not determine Hurwitz boundary-component Galois action.
2. For actual admissible reduced covers, compute the /300–304 stable square-class obstruction and all compatible parity fibers. Do not treat abstract C₂ diagnostic examples as paper counterexamples. The reproduced Schur-cover procedure is now a concrete starting point.
3. Continue the Seguin bounded-core route only with its limitations: characteristic-zero product-one case, unread Cau equivariance input, finite-field tame-specialization bridge, and a distinguished ramified infinity point for the imaginary case. The finite quotient need not be cyclotomic or trivial.
4. Close original-source debts: Romagny–Wewers; Fried–Völklein Appendix Lemma 3; Artin–Tate X.5; SGA comparisons and vanishing cycles; Alberts's Lemmermeyer/Goldfeld–Hoffstein inputs. The primary arXiv record was checked: the journal-cited EVW12 v2 is the 19 November 2013 withdrawal notice, with no PDF; v1 is the mathematical text read earlier. This version qualification does not close its proof dependencies. This continuation read the journal, not all those prerequisites again.
5. Build proof-assistant-checked finite computation certificates. GAP's Schur-cover maximality is currently trusted to its algorithm. The record uses explicit wreath constructions for groups too large for its SmallGroups IDs.
6. The Appendix number-field computation is still unreplicated: original code/data versions, complete cubic tables, the prime-2 test, class-group precision/certificates, rigid weights and sampling. Group-table agreement is not Figure 1 reproduction.
7. Refresh current owners and original deliverable hashes before resuming. The current audit uses the 500-input snapshot recorded in the result; reuses ST.3, existing Schur Part II and pinned Mathlib Goursat. The remaining original-source and complete inherited-API obligations prevent marking complete.

## Validation and submission

Paper checker, intake file checker and structural checks cover 326 unique IDs, 305 exact-once missing routes, all explicit dependency targets and acyclicity, inherited IDs, source-issue provenance and new construction API/test coverage. GAP status and artifact hashes are in the report. No Lean file required, authored or compiled.

Submit only the result JSON, report and this handoff. Opening the PR ends the claim. Never /unclaim submitted work.
