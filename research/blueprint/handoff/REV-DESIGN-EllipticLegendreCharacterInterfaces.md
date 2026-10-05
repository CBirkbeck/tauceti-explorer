# REV-DESIGN-EllipticLegendreCharacterInterfaces handoff

Codex · session codex-LmWcb6 · Refs #1721 · 2026-10-05

Completed independent review; verdict **accepted**, after five corrected node/prototype interfaces. All 37 nodes and all 54 original plus two added pinned declarations were checked. No nodes were added. The packet and roadmap definition carry this review id; the report gives every node verdict, every baseline declaration, the source locators and each correction.

Final counts: 37 nodes (2 definitions, 6 constructions, 14 lemmas, 14 theorems, 1 comparison), 33 API items, 27 tests, 19 planets, 56 baseline declarations, 3 requests and 4 gaps. All six stages remain planned and every implementation status unchecked.

Persistent corrections are in the packet and suggested file: explicit μ₀_some use for affine descent, explicit QuotientGroup.eq_one_iff for squareclasses, direct-case product proof, the derived symbolic minus-one ellipticity instance, the general-ring invertibility requirement for completion of the square, and independent confirmation of source finding E1. The report explains the exact identities. No mathematical target statement, API/test, planet or supplier owner was changed.

The official blueprint checker reports **0 errors and 0 warnings**. Source-issue and source-version validation also reports **0 errors**. The full file was attempted through **lean-check** but is **not compiled**: the shared build lacks the imported native XSubT object. A scratch Mathlib projection elaborated at 082e2d3 with exit 0, 61 sorry warnings only; it includes the previously failing symbolic instance check. No library build, cache download or language server was started.

Independent exact-arithmetic diagnostics passed: 72,396 halving cases; 2,900 twist traces; 8,700 root products; 76 two-by-four instances; 88 symmetric traces; 3 minus-one counts and 6 associated witnesses; 112 corrected twist witnesses (the printed formula fails in 100); 152 labelled root-ordering tuples; 456 rational valuation cases; and 4 universal integer polynomial identities. These are diagnostics, not formalization claims. The report records domains and hashes; no deleted scratch is needed to locate or understand the corrections.

Remaining mathematical/native work stays in the four existing gaps and three requests: EllipticCurves Layer 4 for the local/minimal/unit bridge, R01.3 for actual conductor support, BSD.0 for generic twist factors, and CA.1 for the primitive character object's native name. Obtain an existing compiled baseline, elaborate the native portion and discharge requests on those owners. This review job itself is finished.

The reader document is outside this issue's deliverables; the orchestrator should synchronize the changed descent proof/direct-input bookkeeping and update its baseline count 54→56. Its target statements remain consistent. The previous design handoff is preserved as history. Scratch is deleted once the pull request is open, and no owned background process remains. Stop after this submission; do not claim another job.
