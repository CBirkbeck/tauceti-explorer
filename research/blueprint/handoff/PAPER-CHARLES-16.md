# PAPER-CHARLES-16 handoff

Worker: Codex, session codex-a71f92. Issue #1188; claim comment 5769456111 explicitly confirmed by bot comment 5769457289. Issue reread in full after confirmation.

Status: partial checkpoint. Three allowed deliverables only; no Lean implementation or suggested file.

## Completed

Read the complete published forty-page Charles16 article, the complete LMS arXiv v5 manuscript, the complete Charles13 two-page erratum, and targeted older Charles16 Corollary 2.7. Provenance/hashes and numbering differences are in the result. Read both near-area upstream documents completely and the relevant current owners/audits. Search both pinned library trees and confirm actual declaration statements.

Extracted 142 items: 8 library, 14 planned, 120 missing. Nine routes take 116 missing and 14 planned; 41 definitions/constructions include API/three tests. Four missing items are deliberately unrouted: /50,/113,/119,/127. Do not change status to complete merely because the schema checker accepts partial files.

Recorded concrete corrections: Corollary 2.8 uses rational v²/I², not necessarily integer; Proposition 3.17 proves unpolarized finiteness; twisted N is a separately chosen integral span, gerbe sign is the LMS sign, determinant trivialization is required for μ_r inertia, and exact geometric Brauer order is required. Primitive/twist KS labels and the level inequality are made explicit.

## Resume in this order

1. G1: acquire Saint-Donat/Huybrechts and complete Proposition 3.1's all-characteristic birational linear-series proof. The displayed constants and r=2 inequality need repair. Do not infer birationality of a nonreduced curve solely from its reduced support.
2. G2/G3: either justify the literal square-class step in Lemma 4.5 or use the fully read LMS Lemma 3.5.2 after quadratic extension. Compose with complete splitting in the eigenvalue/cyclotomic compositum and exact additional congruences. Preserve its stated p≥5 scope until the p=2,3 hypothesis audit is done. The pinned auxiliary-prime theorem does not assert complete splitting.
3. G4: prove the actual projective twisted-moduli deformation and H_n lift with generic Picard rank one, then apply /128; independently verify nonsuperspecial applicability to X_n.
4. G5: read Nikulin 1.15.1 itself, not only Charles's summary. Check primitive initial embedding and orbit conventions.
5. G6: acquire/decompose the remaining original prerequisite proofs in the 25-entry register. In particular check small-weight integral torsion comparison and Charles13 special-endomorphism proof with its erratum.
6. Recheck fresh main ownership and any accepted design jobs before revising routes. MC.7 needs acyclic early Lefschetz-(1,1)/late K3 Tate leaves, not a whole-stage circular import.

Published Charles16 numbering is authoritative. LMS arXiv v5 3.4.2 corresponds to Charles's cited published 3.4.1; arXiv 3.5.6 to cited 3.5.4. No published LMS PDF was obtained. No claim of a Charles16 author-issued erratum is made.

## Checks

Run `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CHARLES-16.result.json`. Additional local checks verify counts, single routing, live owner stage IDs, exact baseline reference names, all four source hashes and exact rational Gram/Mukai regressions. No Lean compilation is applicable. Original prerequisite interiors remain open regardless of these checks.
