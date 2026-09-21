# PAPER-HARPAZ-WITTENBERG-20 continuation checkpoint

Codex — codex-a71f92, continuing codex-c83e7a; issue #1426; 21 September 2026.

Reread every page of the author manuscript and all 144 inherited items; re-downloaded arXiv v2 and verified both hashes. Current result: 150 items (7 library, 12 planned, 131 missing), fourteen routes covering 130 missing and 10 planned items exactly once. Status remains partial. Every definition/construction has an API and three tests.

G2 is resolved for E⁺. Borovoi's author Proposition 3.4 explicitly permits G/R_u(G) semisimple simply connected; it is not restricted to semisimple G. Items 139 and 148 split rational existence from weak approximation. Items 145–147 extract the normal-subgroup quotient and unipotent homogeneous-space inputs; 149 is DLA19's broader good-property predicate, 150 is the uniform compactification/all-finite-extension admissibility bridge. Item 115 applies HW20 Lemma 7.4. The report gives the full interface argument. Do not reintroduce a need for a global relative group action or assert equivalence of the two good-property predicates for arbitrary P.

Resume at the sole unrouted item 75 (G1), Remark 4.5. Its statement lacks the RC hypothesis inherited by its cited Theorem 4.2(i). Acquire Sko90 Theorem 1 and Sko96 Theorem 2.1 or give an independent broader proof. The original Sko90 theorem was not obtained. Har97 §3.2 was read; its finite geometric Brauer, torsion-free Picard and general-line-section hypotheses cannot simply be discarded. The remark is not used in the RC main induction. No counterexample is claimed.

Then continue prerequisite proof decomposition/closure as recorded in the JSON and report. Bor96 §§2–3 and the cited proposition's proof were read selectively, not its whole article or its earlier [Bo2]/[Bo4] proofs. Earlier targeted prerequisite reads are attributed to the first checkpoint. Do not convert interface verification into a claim of complete prerequisite proofs.

The shared candidate HeightsRationalPointsPartIIHomogeneousMassey receives 53 items, including the broader homogeneous (⋆) theorem, and remains the same candidate as the now-completed HW23 extraction (PR #1664), not an accepted owner. HeightsRationalPointsPartIIZeroCycles receives 45 items. Maintain stage order RC geometry → homogeneous geometry → E⁺ arithmetic. Do not duplicate generic unipotent radicals, group quotients or descent owned upstream/SF.1.

Preserve all existing source boundaries: Theorem 2.1 needs no RC, Corollary 2.2 does; torus duality has modified infinite factors; finite type modules may have torsion; outer-invariant flags are stronger than abstract solvability; Theorem 6.1 is conditional; E⁺ quantifies over all finite extensions and its defect need not be finite; restriction of an ℓ-variety's structure morphism is not Weil restriction; Galois degrees have collective gcd 1. Quaternion range is m≥3 with the source convention recorded.

All seven claimed library statements were reopened at the pins. Owner/audit refresh is at ab70a4827ce9461bb1055187ad8ef4656c0864f4. The main paper and new prerequisite hashes are in the report. Current paper checker, intake file rules and structural/finite regression checks pass. No Lean deliverable or compilation; no formalization claim.
