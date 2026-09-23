# PAPER-CLAUSEN-MATHEW-21: reviewed extraction

Independent review **requires revision**. The extraction is **partial**, not a closed implementation plan.

Original issue #1290 / PR #1990: Claude Code, cc-442dc5. Independent review #1291: Codex, codex-a71f92, 23 September 2026.

Dustin Clausen and Akhil Mathew, *Hyperdescent and étale K-theory*, Inventiones Mathematicae 225 (2021), 981–1076; [journal DOI](https://doi.org/10.1007/s00222-021-01043-3), [arXiv v3](https://arxiv.org/abs/1905.06611v3).

## What the paper contributes

The paper distinguishes sheafification, hypercompletion and Postnikov completion for sheaves of spectra. It proves finite-dimensional Zariski/Nisnevich homotopy-dimension bounds without noetherian assumptions, a profinite-group nilpotence criterion, the Nisnevich-plus-Galois criterion for étale hypercompleteness, and smashing étale hypercompletion under the stated dimension hypotheses.

It constructs Selmer K-theory as the pullback of L_1K and TC over L_1TC and compares it with étale K-theory. For connective structure sheaves, Theorem 7.12 gives agreement in degrees ≥−1 and the filtered-colimit and hyperdescent results. Theorem 7.13's Lichtenbaum–Quillen target is retained here in the connective scope established by its cited proof. The characteristic-p residue bound is 1+log_p[k:k^p]; away from p it is virtual mod-p Galois dimension. Theorem 7.14 treats telescopically localized weakly localizing invariants under its own hypotheses.

The proof of Theorem 6.18(2) contains a false truncated-fibre step. The review gives a replacement through TC; it does not reject the hyperdescent theorem.

## Inventory and routing

There are **200 items: 5 library, 11 planned, 184 missing**. Every missing item has exactly one provisional route. Original IDs /001–195 are preserved; /196–200 separate coefficient, virtual-dimension, spectral-continuity and existing-library inputs.

| Route | Decision | Required owner/action |
| --- | --- | --- |
| 1, EDS hypercompletion Part II | Reject pending revision | Appropriate parent; supply general prestable, coefficient and genuine-equivariant interfaces, and mandatory Corollary 4.39 coverage. |
| 2, Selmer/étale K Part II | Reject pending revision | Keep Selmer comparisons here; move generic chromatic, spectral-geometric, motive and TC work to their existing directions. |
| 3, henselian-pairs Part II | Accept source contribution | Reuse RefinedTraceMethodsPartIIHenselianPairs; connective rigidity and prefix order are explicit. |
| 4, EDS:E2 source | Reject | Separate the derived-sheaf specialization from the genuinely broader prestable theory. |
| 5, SF.1 source | Accept | Algebraic-space stratification and étale dévissage. |
| 6, SF.0 source | Accept | Henselization and approximation, importing existing henselian predicates. |

The overall `revise` verdict prevents all routes from being automatically applied. Acceptance of an owner does not close the extraction's remaining statement splits.

## What is already supplied

At Mathlib 082e2d3, spectral spaces/maps, the spectrality of prime spectra, and topological Krull dimension already exist. The sober point/irreducible-closed order isomorphism also exists as `irreducibleSetEquivPoints`; with the order-theoretic dimension lemmas it supplies /199. Henselian predicates and the adically complete instance supply /200.

The pinned continuous-cohomology carrier and finite-quotient system exist, but not the all-degree comparison needed by /095. Upstream ProfiniteCohomology owns its completion and the ordinary/strict dimension interfaces. EDS owns higher-category/enhanced-sheaf foundations; StableHomotopyKTheory owns spectra; RefinedTraceMethods owns THH/TC and motives; GeneralAlgebraicKTheory owns K-theory; M.5–M.7 supply norm residue, motivic filtration and ordinary Quillen–Lichtenbaum. These are imports, not alternative constructions.

The reviewed audits and native contracts were checked. DiamondsAndVStacks:D0 explicitly plans the Hochster representation input but has no entry under that id in this snapshot's library audit; no invented audit verdict is attributed to it.

## Corrections and remaining gaps

Important extraction corrections include contravariance in the Kan-extension lemma, the opposite field-algebra category, the nullary sheaf condition, connective scope in CMM/Gabber rigidity, the distinction between exact and split-exact small categories, the positive-height Morava counterexample, the finite-étale cover hypothesis and the finite-localization arrows. M.7 does not already supply the entire Selmer field comparison /179.

The JSON has twelve explicit coverage gaps G1–G12: atomicity, prestable foundations, coefficient/virtual comparisons, chromatic/equivariant suppliers, ownership, motive interfaces, prefix ordering, K-theory comparisons, the henselian proof repair, the nonconnective scope question, unbounded limits/hypercovers, and later blueprint readiness. It is not enough to count numbered results: the full definitions and proof inputs must be extracted too.

## Sources and source issues

The reviewer read all 96 pages of the [published institutional copy](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/CM21.pdf), SHA-256 `284074584f42008de351022f89dba3e653a4f041cefc927a4fd039ffa58aa726`. The v3 PDF/source hashes remain in the JSON; existing item page locators are v3 unless explicitly marked published.

All five original source findings were checked against the published text. E3 is narrowed: F(Y) should be F(V), but an exponent error was not established. Seventeen further findings are recorded, total **22**, each with a review verdict, evidence, corrected reading and correction search. E21 is the false fibre bound; E22 is the connective-scope proof gap. None is merely inferred from an unsuccessful keyword search.

See [the independent review](../reviews/REV-PAPER-CLAUSEN-MATHEW-21.md) for the full change ledger, proof repair, route decisions and validation. No Lean implementation or compilation is claimed.
