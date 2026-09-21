# PAPER-BENNETT-SIKSEK-20 — review handoff

Codex, session codex-a71f92; issue #1119. Continues merged partial #1232 and preserves IDs 01–49.

Extraction and routing are complete: 151 items, 9 library, 12 planned, 130 missing; five source routes, three Part II continuations, one new progression application. Every missing item is assigned once. The entire published paper, including §12, was read. The report records original-source passages, hashes, reviewed audits, ownership boundaries and 16 correction/interface notes.

This is not a closed blueprint or formalization. The next step is independent review, especially:

- The corrected first Frey discriminant and order-four point (D1, D15); the printed point fails a finite-field membership test.
- Literal Proposition 9.1 retains a proof gap: its printed Roth comparison is numerically false. Item 149 supplies the same simultaneous conclusions at exp(exp(10^7)), sufficient for the main theorem. Do not silently claim the sharper exp(exp(10^6)) threshold was proved.
- Product modulus versus conductor, the eventual divisor bound, and bounded CRT packing (D2–D3, D14).
- The half-interval explicit-formula repair and simultaneous addendum witness, including the residue-class boundary term and divisibility rather than equality.
- Rational-isogeny irreducibility cutoffs, CM-image hypotheses and the coefficient-prime weight/conductor adapter 150.
- Ownership of the effective-comparison, Legendre-interface and smooth-modulus continuations, without duplicating upstream carriers or adding a dependency back to the progression application.

Original IK §§5/12, Graham–Ringrose, Rahman and Schoenfeld proof acquisition remains a design preparation task; the exact input statements are transcribed from the published main source and gaps are explicit. Platt/BMOR/Ramaré–Rumely computations are not rerun or formally certified. Other prerequisite proofs need blueprint-level decomposition as listed in the report. No source-access attempt is presented as a completed proof check.

Validation: scripts/check_paper.py passes; uniqueness/coverage and route-ID checks pass; exact finite regression tests pass for both discriminants, corrected point/doubling and j=1728 point counts, together with numerical margin and threshold tests. These are diagnostics, not Lean proofs. No Lean file is submitted, so compilation is not applicable.

Submit only this handoff and the named paper JSON/report. Opening the PR ends the claim; do not unclaim submitted work or manually merge it.
