# PAPER-YANG-ZHAO-25 handoff

Codex — session `codex-a71f92`; issue #1218. Partial checkpoint.

## Completed

- Read the complete arXiv2209.11086v4 (51 pages) and complete author-linked PFF alternative proof (11 image pages).
- Extracted 114 items, 230 acyclic internal prerequisite edges; 4 library, 8 planned and 102 missing.
- Added 135 API entries and 135 specification tests for all 45 definitions/constructions.
- Routed every missing item exactly once, reusing the existing pending Abe and Shende–Tsimerman continuation IDs.
- Recorded seven source findings, including an explicit finite-field counterexample to the constant-direct-sum claim and its rank-twist repair.
- Recorded eleven source/closure gaps with exact consumers. Main conclusions and conjectural boundaries remain distinct.
- Re-read current WORKERS and relevant PROTOCOL material; main instructions and selected owner READMEs were unchanged at publication refresh.
- No external correspondence, relabelling, merging or closing was performed.

## Resume here

1. Obtain the final Umezaki–Yang–Zhao journal paper: reconcile Lemma4.2.7, Lemma3.3.2/Remark3.3.3 and Proposition5.3.7 with its earlier arXiv statements, particularly quasi-projectivity, smooth center, prime-to-ℓ extension and smooth properly transversal fibers.
2. Obtain the Yang–Zhao journal text and map its numbering. Current sourceIssues concern arXivv4 only.
3. Close G02–G08 and G10–G11: enhanced six operations, precise purity/finiteness, ULA extension/descent, Ψ-goodness, character enlargement, microlocal existence/integrality and localized Chern inputs.
4. Keep the item-level prefix dependency order. Do not create a whole-roadmap cycle between relative traces and microlocal comparison, and do not re-create either Abe continuation.
5. Replace broad prerequisite interfaces with exact supplier nodes as those blueprints become available. Recheck the declarations at the pinned commits before changing any library status.

## Source access

URLs, checksums, version labels and exact read scopes are in `sourceLedger`; no downloaded PDFs are included. The Springer main-paper PDF was unavailable as full text; AMS returned forbidden for the cited final UYZ paper. Earlier public versions are not silently substituted at matching journal locators.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-YANG-ZHAO-25.result.json`: passed.
- `python3 research/blueprint/intake.py check-files` on the three authorized deliverables: 3 files, 0 problems.
- `python3 -m unittest discover -s tests -p test_check_paper.py`: 9 tests passed.
- `python3 -m unittest discover -s tests -p test_source_issues.py`: 7 tests passed.
- Separate structural audit: 114 unique/resolved item IDs, 230 edges, acyclic graph, exactly one route for each missing item, 45 definitions/constructions each with 3 APIs and 3 specification tests.
- Executed finite calculations: over F3 the swap matrix has 3 fixed vectors and trace 0, versus 9 fixed vectors and trace 2 for the identity; the square's difference composite is 0 whereas the plus composite is 2; the skyscraper's alternating vanishing-cycle dimension is −1 and its Milnor class is +1. These check the stated finite examples, not the general sheaf-theoretic claims.

No Lean file is authorized for this paper issue and no Lean compilation is claimed. The 135 proposed specification tests have not been executed as Lean proofs.
