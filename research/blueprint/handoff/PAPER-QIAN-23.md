# PAPER-QIAN-23 handoff

Codex — codex-a71f92; issue #1252; partial checkpoint; 2026-09-22.

## Done

Read the entire37-page published main paper and entire24-page Qian2021 local-ordinarity companion. Compared selected original ACC+, BLGHT and Varma passages; the JSON gives exact coverage and hashes. Extracted112 items, routed all86 missing items once, added38 use-derived API/test triples and74 proof outlines, and checked the dependency DAG. Recorded13 source findings with correction searches. The new proposal is an asymmetric-Dwork Part II of PotentialAutomorphyInfrastructure, with explicit reuse/coordination of CG18's existing shared polarized-Dwork input. Final automorphy endpoints remain ML.2; the seed remains ML.3.

## Resume here

Start with JSON gaps S1–S10; do not simply change status to complete. Highest priorities:

1. Independently verify E2's l>n gap against the exact ACC+ theorem and look for a qualified replacement if preserving the full printed range.
2. Verify E11 against BLGHT2.2(2), expand the filtered-module witness through admissibility, and supply the selected family's labelled crystalline character shift. Do not certify the companion's general-character endpoint yet.
3. Read original Deligne §7 and its publisher-listed erratum, Levelt/Beukers–Heckman, the remaining rank-two BLGHT proof, Zalesskii–Serezhkin and the small-group exclusions.
4. Close NSW/Moret–Bailly, Geraghty normalized Hecke operators, coefficient-transport semisimplicity/cuspidality, and the KKMSD/Illusie/Hyodo–Kato/Tsuji comparisons. The main/companion full reads do not count as reads of all their references.
5. Reconcile CG18's dwork-family/sec10-dwork-point ML.2 source allocation with the one shared geometric prerequisite interface proposed here. No duplicate family/projector definitions and no endpoint→family→endpoint cycle. Coordinate generic toric refinements with the existing BKV25 nonarchimedean toric proposal.
6. Split the remaining imported packages into all definitions/theorems, rerun library/audit and route checks, then assess completeness.

## Checks and limits

Run the paper checker on PAPER-QIAN-23.result.json, intake check-files on exactly these three deliverables, and the test_check_paper.py/test_source_issues.py unit suites. Final passing results are in the JSON. Mathematical finite examples and the item dependency graph were also checked. No Lean file was authorized, created or compiled. Do not treat the planning APIs as formalized.

Preserve the reported E1 negative-valuation condition, E5 prime-to-l root convention, E6 determinant cancellation, E7 auxiliary congruence and E9 cohomological determinant convention. All new source findings remain unreviewed; E13 documents a correction already in the journal version. Do not contact authors or alter other jobs from this checkpoint.
