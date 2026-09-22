# PAPER-YU-23 handoff

Partial checkpoint by Codex, session codex-a71f92. Refs #1091.

## Saved work

Read the entire 85-page arXivv5 main paper, all proofs and Appendices A–C. Selected original inputs read as recorded in the report, not all cited literature. The JSON has 141 items (8 library,23 planned,110 missing),46 definition/construction APIs with tests,95 theorem proof outlines,13 routes,28 source findings, and an explicit acyclic dependency graph. Every missing item is routed once.

The routes propose the counting Part II of GlobalShtukasAndFunctionFieldLanglands and the rational-GSp character Part II of the upstream ClassicalGroups roadmap. Existing function-field, spectral, L-function, weights, duality, curve, arithmetic and formal-series layers receive source additions. Pinned library declarations were read, including the existing split representation ring; no Lean formalization is claimed.

The report contains the complete reproducible Python exact-arithmetic script: 110864 finite assertions passed. Schema/intake/unit-test results are recorded in the PR.

## Resume in this order

1. S2: expand item063 into the exact spectral operator formula, collate Laf97 pp306–308 from page images, and reconcile the spherical rho/Haar/conductor normalizations. Item123's exact KW01 normalizer theorem in S4 also needs replacing with a verified statement.
2. S3: read Nitsure Proposition7.4, Schiffmann's original bundle/Higgs proofs, the rest of Mellit and Ch15's HN/scalar-nilpotent proofs. Separate coarse rational points, G_m automorphisms and groupoid mass.
3. S5: split partition adapters from the library carrier and close the general integral/zero/negative edge cases beyond the positive application range; verify the whole determinant-index formula symbolically.
4. S6: close the leading term, density, Higgs purity and twisted PGL Euler inputs; no smoothness-to-purity shortcut.
5. S7: read the original ordinary-locus, full-monodromy, Larsen/Chavdarov and Honda–Tate arguments; check Yu's infinitely-many-primes adaptation.
6. S8: coordinate shared Hitchin carriers, reusable matrix-tree ownership and the rational GSp extension; import existing K0 and highest-weight theory.
7. S1: obtain the 109-page journal article and collate with arXivv5. Independently verify E1–E28; do not call the findings confirmed journal errata before that.

The JSON's S1–S8 lists exact affected items. Item123 is explicitly an incomplete input contract, and item063 still needs full operator expansion. Other multi-part imported statements need finer splitting at proof closure. Keep status partial until these obligations are genuinely discharged.

## Provenance and restrictions

Main source: https://arxiv.org/pdf/1807.04659v5 (18July2022). SHA-256 and selected supplementary read ranges are in the JSON. Publisher DOI10.4007/annals.2023.197.2.1; final journal text not read. Atlas base a79a97d5c4f2c2e2246534c119ab10a8775b13f3; publication base 3f02b067baa564e05e9f5def7a4751cf92eef40a. Mathlib082e2d3 and Tau Ceti f790474.

Only the two paper deliverables and this handoff are part of the PR. No Lean file was required or compiled. No reviewer verdict was fabricated and no author was contacted.
