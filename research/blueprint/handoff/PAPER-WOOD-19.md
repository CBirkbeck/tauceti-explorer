# PAPER-WOOD-19 handoff — codex-a71f92

Partial continuation of PR #1550. Do not mark complete merely because the two remaining unrouted items could be assigned a broad statistics owner.

## Saved work

- Reread the entire 40-page Wood v2 preprint, all proofs, appendix, references, both tables and the figure. Published typeset PDF was not obtained; retain the version qualification.
- Preserved all 249 inherited identifiers and added /250–/297. Totals: 297 items, 5 library, 13 planned, 279 missing, 277 routed once. Only /99 and /143 remain unrouted.
- Closed trace-formula ownership through SF.2's explicit integration of the canonical upstream supplier: TauCetiProject/TauCetiRoadmap PR196, head 4bd72379658126cbe9be935656396f0c9dac4de0, TraceFormula Layer12. Open roadmap PR, not built code.
- Read all of Wood's 2021 algebraic lifting-invariant paper. Added the fiber-product abelianization, weaker homology composite, marking-discrepancy inverse and stable-cancellation interfaces. Preserve the stronger EVW homology-image theorem /132 as a separate statement.
- Read EVW16 Lemma7.6/Proposition7.7 and their proofs, plus the relevant EVW12 tangential/specialization/odd-order passages. Coefficient-tower and ramified-infinity distinctions are explicit.
- Split number-field versus function-field duality and reciprocity. Ordinary ideal-class-group correspondence /130 is number-field-only. Milne's exact Grunwald–Wang character statement now verifies the claimed μ4 scope, but its original proof was not acquired.
- Supplied all prime-2 factors and the fixed-swap imaginary projector. Selecting merely an outside infinity image overcounts by 2^k. Derived the continuation, positive common leading coefficient, Delange interface and proper-image subtraction, with a separate rank-zero boundary.
- Added a generic higher-pole Tauberian Part II after upstream ArithmeticDirichletSeries Layer9; Delange1954 is a sourced alternative, not an assertion about unread Narkiewicz p.121.
- Split Bhargava's twelve n=3,4,5 sign/type cases and Alberts's four Q8/D8 sign cases. Do not conflate Alberts's D4 notation or normal-over-Q subfamily with arbitrary wreath types.
- Derived A4 rigid weights: 24 per embedded eligible kernel, 4 per quotient epimorphism, 48 per S3 orbit. Inclusive cubic cutoff repaired. No extra factor3 for conjugate cubic subfields.
- 563 exact finite regression assertions pass. The complete standalone test is embedded in the report, with its SHA-256. It is not a field-table reproduction or a formal proof.

## Resume here

1. DONE (Claude Code, cc-fb70e5, 22 September 2026). /99 is kept as the printed proposition, refuted by /144. /298 is the generator-form conjecture, and /299 proves the generator/Hom equivalence and independence of the generator. All three are routed to ST.3. See the report section "Resolving /99".
2. Resolve /143: analyze every remaining fixed-component fiber and its q-dependence for the bad-type assertion. The current argument establishes a liminf lower bound. Do not call this an ordinary-limit proof or claim a counterexample without one.
3. Acquire the final published Wood PDF if possible; compare the disputed passages, not only the title and DOI. The preprint is author-linked but explicitly labelled old on the author's page.
4. Read the remaining original inputs: Romagny–Wewers moduli/specialization, Fried–Völklein Appendix Lemma3, Artin–Tate X.5, exact SGA comparison/vanishing-cycle interfaces, and Alberts's Lemmermeyer/Goldfeld–Hoffstein dependencies. The JSON records precisely what was and was not read.
5. Certify the Appendix computation: source implementation/data version, complete cubic list, no-total-ramification filter including 2, class-group precision, kernel/orbit convention and sampling. The new weighting theorem specifies a correct algorithm, not what the original program actually did.
6. Supply reduced-multiplier certificates for the source-reported group tables. The five library entries were rechecked at the pins, but the paper's GAP outputs are still reports, not checked proofs.
7. Recheck live owners before extending the two Part II briefs; integrate any subsequently accepted design rather than proposing it twice. Current ownership screen reached explorer main d76643df4405140aed1dfade7a21b9159db80017.

## Verification and submission

Run `python3 scripts/check_paper.py research/blueprint/papers/PAPER-WOOD-19.result.json`. It passes in this continuation. Independently check ID uniqueness, stage/galaxy existence, exact-once routing and the two declared omissions. The report contains executable finite regression code; its expected result is 563 assertions. No Lean file was required or compiled. Submit only the result JSON, report and this handoff; opening the PR ends the claim. Never `/unclaim` submitted work.

Continuation log: Claude Code, cc-fb70e5, 22 September 2026. Added /298 and /299 and routed /99, /298 and /299 to ST.3. Now 299 items; only /143 is unrouted. No other item changed.
