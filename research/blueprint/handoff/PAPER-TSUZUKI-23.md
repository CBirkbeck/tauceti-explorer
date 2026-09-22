# Handoff: PAPER-TSUZUKI-23

Codex — codex-a71f92. Issue #1258. Date: 2026-09-22.
Status: partial checkpoint; no Lean file authorized, written or compiled.

## Saved work

The complete arXiv v3 preprint (41 pages, including Appendices A–B and references) was read, together with the explicitly listed CT11, Ohkubo and Abe–Esnault source passages. The report and result contain 164 items: 7 library, 27 planned, 130 missing, with all missing items routed exactly once. The 339 dependency edges form an acyclic graph. All 55 definitions/constructions have three API contracts and three test contracts. Twenty-four preprint observations are recorded with uncertain publication/novelty status, not independent verdicts.

The main distinctions are retained: maximal-quotient versus minimal-subobject duality; prescribed-morphism lifting on curves versus conditional compatibility in higher dimensions; graded PBQ pieces versus nested filtration steps; quasi-saturated E† injection versus E-linearized surjection; raw n[L:K] trace degree versus projected coefficient normalization; and arbitrary real weights.

Only the three issue deliverables are changed. The proposed minimal-slope Part II imports RD.0–RD.6 and VB0. It coordinates the pure-Hom Chebotarev interface with the pending rigid-companions successor, and does not enqueue Abe's paper again (already PAPER-ABE-18).

## Resume in this order

1. Obtain the public/final journal version through an authorized source and collate it against v3. Do not promote any E finding as a verified published mistake before this. Source metadata, SHA-256 and exact read ranges are in the result JSON.
2. Repair or locate a corrected proof of Lemma 3.31 (finite-étale PBQ); the printed first proof concludes its own assumption.
3. Type the coefficient projectors and dual pairing, A.1(3)'s Frobenius extension and the 7.15 trace-average comparison. The raw n[L:K] degree must not be silently replaced by n.
4. Close the external full-faithfulness, unit-root correspondence, local-monodromy and subobject-extension leaves. Check applicable de Jong corrections and published AE/Ohkubo numbering.
5. Decompose the opposite-filtration rank-r reduction and remaining grouped multipart estimates/tower laws at declaration granularity.
6. Verify the Legendre/Kummer rank-three extension via the K3 source calculations, including open-versus-compact cohomology and root-of-unity factor.
7. Reconcile the current accepted/pending roadmap ownership, finish the nine recorded gates, then reassess complete status. Continue these files rather than replacing the existing inventory.

The precise consumers and missing inputs are G1–G9 in the JSON. Several bibliography links point deliberately to Tsuzuki's bibliography because those independent texts have not yet been read.

## Verification performed

- Paper checker: passed.
- Checker unit tests: 9 passed.
- Source-issue unit tests: 7 passed.
- Scratch structural audit: all item/route/edge/API/test/gap references passed.
- Scratch exact arithmetic: 1,718 assertions passed.
- Intake path/content check: three files, zero problems; rerun on fresh main before publication.
- Publication base: ffe90556be9c0d6571d13c5fb4cb0baffb7f7fa1. Binding instructions and owning atlas extracts are hash-identical to the research snapshot.

Finite arithmetic sanity checks are not formal proofs of the paper, and no suggested Lean file was compiled. This checkpoint is intentionally partial despite a full preprint read.
