# PAPER-TSIMERMAN-18 — handoff

Partial checkpoint by Codex, session `codex-c83e7a`, continuing PRs #1263 and #1639. Issue #1141. All 84 previous IDs and both contributors preserved.

Completed in this continuation:

- Reread the entire published 12-page paper; downloaded and hashed it, arXiv v5, Yuan–Zhang published, Tsimerman 2012 arXiv v3 and Thorner–Zaman 2017. The JSON records exact read extents and checksums. Thorner–Zaman pp. 1140–1142 provide primitive continuation and variable-field uniform convexity. The older binary-access blocker is resolved.
- Added 17 atomic items, making 101 total: 5 library, 28 planned, 68 missing. The new library import is Mathlib's different-norm discriminant tower identity, read at 082e2d3. The other four library signatures were reread.
- Made the quadratic-Hecke proof of the CM height estimate explicit at the imported-theorem level: Q=D_E/D_F, residue quotient, fixed-degree residue bounds, fixed small Cauchy circle, reciprocal-value bound, odd gamma factors and exact metric normalization. The Cauchy step needs an entire L-function, not a zero-free logarithm or unproved Artin holomorphy. h_YZ=h_T+(g/2)log(2*pi); Bost's lower constant may be negative.
- Added uniform ideal coefficient/divisor estimates and the primitive orbit exponent budget. The source's general-Artin-route obligations remain separate and are not certified by the quadratic alternative.
- Added structured APIs and three proposed tests for every definition/construction: 23 APIs, 69 tests. No Lean tests or implementation claimed.
- Ten routes now cover all but four missing mixed items. The proposed CM Part II contains quantitative height/orbit/lift-height targets; the Faltings Part II contains the quantitative geometric isogeny theorem. General CM classification/stabilizer, height, moduli descent and Hecke analytic foundations remain with existing owners. The accepted AN and R28 decompositions and the current 211-roadmap portfolio were screened; no upstream roadmap was edited or ID manually reserved.

Resume in this order:

1. Verify the polarized CM stabilizer and the precise absolute-versus-reflex-compositum moduli degree using an accessible full CM theorem proof. The numerical sufficient inequality is preserved, but equalities of those two degrees cannot be assumed. Original Silverberg 1992 remains unread, with its sufficient both-torsion contract corroborated by the author follow-up.
2. Reconcile Tsimerman 2012 and Pila–Tsimerman 2013 against published versions: compact-index/order-index estimates, dyadic exponential depth, lattice covolume, matrix multiplicity, and coordinatewise degree versus joint field degree. The AMS 2012 PDF request returned 403; acquired arXiv is v3. Preserve the earlier source corrections until independently resolved.
3. Close the recursive analytic proof leaves: original Brauer 1947, original Rademacher convexity, quadratic conductor-discriminant, Bost, and the averaged-Colmez/erratum proof. The last is already assigned to #1143/#1145; do not duplicate it. The present deduction from these named contracts is explicit; this does not make their full proof trees read. The Iwaniec–Kowalski excerpt lacks chapter 5.
4. Extract Gao's earlier mixed Ax–Lindemann and quotient/foundation inputs and choose their owners. The four unrouted IDs are mixed-application-interface, mixed-special-point-order, mixed-galois-orbit-factor and mixed-conditional-andre-oort. Do not assign them to a pure CM Part II merely to make the routing counter zero.
5. Finish remaining item-by-item library checks and source closure. AUDIT-34 remains pending, unlike the accepted AN/CM/height/abelian audits. Keep status partial until source, statement and routing obligations are met.

Validation: custom checks pass with 101 unique items, 135 edges, no cycle, no missing internal reference, no duplicate missing-item route, 84 stable IDs preserved, and exactly four unrouted mixed nodes. All 2412 regression assertions pass (finite Euler-coefficient examples, exact rational exponent allocation, normalization and average algebra). Repository check_paper.py passes; intake.py check-files reports 3 files and 0 problems. A complete-status negative control reports exactly the four intentionally unrouted mixed nodes. No Lean compilation: this job has no Lean deliverable.
