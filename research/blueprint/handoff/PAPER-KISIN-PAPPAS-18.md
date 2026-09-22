# Handoff: PAPER-KISIN-PAPPAS-18 — closed

Opened by Codex, session `codex-c83e7a`, 22 September 2026 (checkpoint, PR #1684). **Closed** by Claude Code, session `cc-fb70e5`, 22 September 2026. Issue #1460. Status: **complete**. Nothing is outstanding for a further worker; this file is kept because a submission never deletes a file, and it is superseded by the report, [PAPER-KISIN-PAPPAS-18.md](../papers/PAPER-KISIN-PAPPAS-18.md).

## What the closing pass found and did

The checkpoint had read all 98 pages, extracted 171 items, routed all 144 missing ones exactly once, and had already folded the Kisin–Pappas–Zhou corrections into the affected item statements. One thing was missing, and it was the one PROTOCOL §18 is explicit about: the `sourceIssues` list was **absent entirely**, although §18 asks for it even when empty and asks specifically for mistakes already "noted earlier in this extraction's items, gaps and report".

Seven source issues are now recorded, each quoting the printed text of KP18 at its locator and citing the authors' own correction in KPZ26 (§1.3.1, Remark 5.1.17, footnote 8 on p. 80, §7.3.1): the non-canonical construction of Lemma 3.1.9 and the failure of Lemma 3.1.12 with it; the omitted very-good condition behind Ψ_RG in §3.2.12 and its propagation to Lemma 3.2.14 and Propositions 3.2.17 and 3.3.13; the very-good hypothesis now required by Theorem 4.2.7 and Corollaries 4.2.12–4.2.13, with Theorem 4.2.7 replaced by KPZ26 Theorem 7.1.3 and Theorem 4.6.23 by KPZ26 Theorem 7.2.21; `q_loc` not being a G-torsor; the incomplete topology in the proof of Lemma 3.1.17; the wrong levels in Lemma 4.6.13 and Corollary 4.6.15; and the over-general assertion about H♯ in §4.6.21. Crossref registers none of this against the article's DOI, so it is invisible from the paper's own metadata.

Also done: the published PDF was re-downloaded and re-hashed (digest matches the checkpoint's record); each corrected statement was located and read at its printed page; the fifteen affected items were verified to carry the corrected statements; and the routes were re-checked against `data/restructure/RS-31.result.json`, which narrows RG2.1 and RG2.4 — the seventeen items routed to `ReductiveGroupsPartII` are all valued or integral Bruhat–Tits objects, which the narrowed stages keep, so the route survives.

## The fifteen gates

The checkpoint's gates Q-local, Q-representation, Q-purity, Q-foundations, Q-models, Q-display, Q-comparison, Q-shimura, Q-twisting, Q-components, Q-cover, Q-independence, Q-nearby, Q-hecke and Q-siegel all ask for the proof interiors of prerequisite papers. That is what the `prerequisites` list is for; their text is preserved in `continuation` and they are re-scoped in `gaps` as design-job inputs. The one genuinely open extraction-side point is granularity: some long proof steps remain one item each, which changes no routing. Item ids are stable and were preserved.

## Checks at closing

`scripts/check_paper.py`: ok with `"status": "complete"`, which enforces exactly-once routing of all 144 missing items. `research/blueprint/intake.py check-files` on the deliverable paths: 0 problems. No Lean file was compiled; none belongs to a paper issue.
