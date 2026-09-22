# PAPER-BRESCIANI-24 continuation checkpoint

Codex, session `codex-hjdg0j`, issue #1233, 22 September 2026. Continues checkpoints #1634 and #1648. **Status remains partial.**

The full published paper was reread. Stable IDs /1–/149 are preserved and /150–/152 added. There are 152 items: 8 library, 8 planned, 136 missing. Every missing item now has exactly one route. Ten routes: six source, four Part II. No Lean file or implementation is claimed.

## Done in this continuation

- Resolved /58 using the generalized Albanese **torsor**, Spieß–Szamuely's curve-specific fundamental-group comparison, Harari–Szamuely's arithmetic interpretation, and Bresciani's Tate-module band construction. The loop supplies a gerbe object; it does not supply a rational point of the torsor.
- Added /150 geometric curve comparison and /151 torsor band to the existing proposed Jacobian Part II. Generic chosen-object neutralization /152 goes to SF.1. No new route or duplicate carrier.
- Made /54's arithmetic finite étale cover construction explicit using a characteristic open subgroup of the geometric curve group.
- Added seven structured source issues. E1–E3 agree with the existing errata IDs, without claiming an independent review. E4 records the torsor choice, E5 the monic-lift qualification, E6 the density reference, and E7 a version-specific band misprint in a dependency.
- Rechecked the eight inherited library items, relevant reviewed audits and neighboring owners. Full source/provenance details and the comparison proof are in the report.

## Resume here

1. **Parabolic proof repair remains unresolved.** The printed assertion about all affine-parabolic sections fails for P1_Q minus V(T²−2). Repair the nonsplit degree-two-boundary branch of /81 (Lemma 16), /96 and the general-curve reverse direction /112 without using Theorem A circularly. No disproof of Theorems A–C is claimed. Splitting the completion does not split its boundary.
2. Read the exact Stix book Proposition 75/Lemma 259, Tamagawa Proposition 2.8(iv), and Koenigsmann original theorem. No new access to those passages is claimed. The prior publisher book attempt was HTML, not a PDF.
3. Finish Mattuck's analytic proof decomposition and exact logarithm/formal-group owner audit. Retain the existing finite-torsion input and its scope.
4. Finish the remaining valuative, density, coherence and other inherited prerequisite decompositions. For the new Albanese sources, the inspected propositions are explicit in the report; Picard 1-motive proof dependencies still need supplier-blueprint decomposition.
5. Keep sourceIssue E7 limited to arXiv:1904.00789v2 unless the published dependency is checked. E1–E3 are already in the separate errata file; do not renumber or independently mark them reviewed.

Do not reopen /58 as an unrouted gap: it now has a primary-source argument and exactly one owner. Preserve the earlier split-completion proof, restricted power-completed products, A.23 for arbitrary base change, the pro-open diagonal, cofinal opens omitting the associated point, disjoint iterative divisors, and monic same-degree polynomial lifts.

Checks: paper checker, intake file validation, item/route invariants, inherited finite regression, and whitespace check. No Lean compilation applies. Submit `Refs #1233`, never `Closes`, and do not unclaim a submitted PR.
