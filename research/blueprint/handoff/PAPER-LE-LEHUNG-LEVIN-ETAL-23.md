# LLHLM23 — current handoff

Claude Code — cc-7b31c4, issue #1254, 23 September 2026. Continues cc-fb70e5's pass, which continued cc-d67081's. Status **partial**.

Census unchanged in size: **580 items (86 library, 23 planned, 471 missing), 23 routes, 52 unreviewed findings**. This pass added no items and changed no routes; it proved out the last three theorem items of the A66–A73 chain. Exactly three items were modified — `A71`, `A72`, `A73` — and `routes`, `sourceIssues`, `source` and `sourceData` are byte-identical to the inherited file.

## Completed this pass (cc-7b31c4)

**A71, A72 and A73 now carry step-by-step proofs**, which closes resume item 1 of the previous handoff and, with it, the whole generic-local-factor chain: every theorem item from A66 to A73 is now proved out (A66 is a construction and carries API and tests instead).

- **A71** (nonzero finite-place functional), five steps. The substance is why the frozen vector has to be *produced*: A107's two-factor form offers no distinguished vector, unlike Cogdell's restricted-tensor-product construction on printed 32, so one writes `ξ = Σ_j x_j ⊗ w_j` with the `w_j` independent and observes that `0 ≠ Λ(ξ) = Σ_j λ_{w_j}(x_j)` forces some `λ_{w_j} ≠ 0`. Every frozen vector already gives an equivariant functional — that step needs no hypothesis on `w` at all — so nonvanishing is the only issue, which is exactly what the item's existing `choose_good_frozen_vector` test is about. Step 5 records what is *not* claimed: no uniqueness (Gelfand–Kazhdan/Shalika, Theorem 4.1, is unused), no `Λ = ⊗Λ_v` (that needs the restricted product and `Λ_v(ξ°_v) = 1` at almost all places), and the finite place is what keeps the argument algebraic, since at `v | ∞` Cogdell's remark (ii) gives `n!` algebraic functionals against one continuous one.
- **A72** (determinant twists), four steps, entirely elementary: the twist has the same carrier, unitriangular matrices have determinant one, so the two equivariance equations are *the same equation* and the two Hom spaces are the same subset of `Hom_C(V_π, C)`. A new `characterisation` test records that the conclusion is an equality of subspaces and not merely a bijection, because that is what A73's normalization twist consumes; a new `non-example` records that conjugating `ψ_K` is a different statement and is not covered.
- **A73** (conditional split-place genericity), seven steps, an assembly of A59, A62, A70, A71 and A72. **The conditional hypothesis is kept as a hypothesis throughout** — step 1 says so and step 7 states the four boundaries the item's own non-example tests name: no Speh/Galois isomorphism, no temperedness, no occurrence dictionary, no p-adic Hodge or monodromy input.

**Two prerequisite edges added** (417 → 418 internal edges, still acyclic): `A71 → A66`, since the equivariance step uses `ψ_N`'s definition, and `A73 → A107`, since step 3 applies A71 through the one-place factorization by name.

**A locator correction.** For Cogdell's Fields Institute notes, **printed page = PDF page − 4**, not − 3 as the cc-d67081 handoff's evidence line said: PDF 36 carries the running head `32` and PDF 37 carries `33`. The item locators (`printed32–33/PDF36–37`) already use − 4 and are right; only that handoff line was wrong, and it is corrected here. The Fields PDF's hash reproduces (`2c5ec050…18a7`).

**A warning about the PCMI notes, sharper than the inherited one.** Its hash reproduces (`09b82f9a…0932a`), but the text layer is not merely dropping the letter `c`: on the pages of Lecture 1 the encoding is broken wholesale and no sentence can be read from it. Quotations from PCMI must come from page images. Everything this pass needed was in the Fields notes, whose text layer is clean.

## Resume in order

1. **The A66–A73 chain is closed.** Every theorem item in it now has step-by-step proofs, and the analytic suppliers A104–A107 are in place. Nothing in this chain is a frontier any more. Last IDs: **A107**, **L86**, **E52**.
2. Other queues, unchanged: `analytic-regularity-suppliers`, `approximation-and-tensor-adapter-closure`, `remaining-proof-leaves`, `closure-external-inputs`, per-item audit and shared-owner reconciliation. Keep bounded supplier reads and the inherited main-paper read attributed; do not restart as if unread. A useful next sweep is the `remaining-proof-leaves` queue: the same census script that found A71–A73 will list the other theorem items with an outline and no `proofSteps`.
3. Appendix B: uniform integral-parameter certificates, exceptional denominator loci, minimal primes and specialized Gröbner cases. Existing generic rational checks are insufficient.
4. The 52 findings remain **unreviewed**; a `kind:review` job for this paper has not run. Do not treat any of them as confirmed.

## Evidence and checks

Bounded supplier reads only; the inherited main-paper reading stands and is not restated.

This pass: Cogdell's Fields Institute notes re-downloaded from the author's page (`people.math.osu.edu/cogdell.1/fields-www.pdf`) and Lecture 4 read at PDF 36–37 — the functional/model dictionary, Definition 4.1 and remark (ii) on printed 32, and Corollary 4.1.2 with the displayed global functional on printed 33. Cogdell's PCMI notes re-downloaded from the same page and confirmed unreadable as text, as recorded above.

- Cogdell, Fields Institute notes (2003), SHA-256 `2c5ec050a6db216dcd2104b7fe266ddc03e4db7c7d300239e60d6ee9c40618a7`, 109 PDF pages, printed page = PDF page − 4.
- Cogdell, PCMI notes (2002), SHA-256 `09b82f9aed494d28327ed9692f5bf37e6bed229cf470e80927e0cc10ce70932a`, 85 PDF pages; text layer unusable, images required.

No new findings recorded: nothing in the passages read contradicts what the items assert, and the 52 inherited findings are unchanged.

Verified this pass: 580 unique IDs with none added and none lost, and **only A71, A72 and A73 modified**; `routes`, `sourceIssues`, `source` and `sourceData` byte-identical to the inherited file; 418 internal prerequisite edges, all resolving to existing items and **acyclic**; all 471 missing items carry exactly one route, with no double-routing and no routed id that is not an item; all 163 definitions/constructions retain `api` or `tests`; `check_paper.py` and `intake.py check-files` both pass. Exactly three deliverables touched: the result, the report and this handoff.
