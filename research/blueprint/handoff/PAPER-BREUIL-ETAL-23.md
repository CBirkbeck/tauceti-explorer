# Handoff: PAPER-BREUIL-ETAL-23

Issue #1241. Claude Code, session `cc-d67081`, 23 September 2026. Status: **partial** (second checkpoint, continuing `cc-442dc5`).

Base blobs: result `05852a05`, report `ed5cd5e3`, handoff `a9feab1d`.

## Done in this checkpoint

**1. The source is arXiv v7, not v4.** The first extraction recorded "arXiv v4 (final version, 112 pages)" with SHA-256 `8f06c68b…f99e7a` and the URL `.../pdf/2009.03127v4`. That hash, the date and the page count are **v7**'s; `.../v4` serves a different document (14 September 2021, 107 pages, SHA-256 `98a9e688…fecc46`). So the reading was of v7 and only the label was wrong — but v4 has different numbering, so anyone following the recorded URL would have been misled. The `source` block, its URL and all seventeen inherited locators now say v7, and `source.version` records the discrepancy and both hashes. Nothing else about the inherited items changed.

**2. Twenty-five items for §§2.3–3.3**, the first part of the previous resume list, with exact statements:

- §2.3: Definitions 2.3.1, 2.3.3, 2.3.4, plus `orientation` for Remarks 2.3.5–2.3.6, which §3 uses throughout.
- §2.4: the Λ_W/t_μ/Σ setup with (14), Propositions 2.4.2 and 2.4.3, Lemmas 2.4.4 and 2.4.6.
- §3.1: Definitions 3.1.1, 3.1.4, 3.1.6, 3.1.8 and Propositions 3.1.5, 3.1.7, 3.1.9.
- §3.2: Definitions 3.2.1, 3.2.4, 3.2.5, Lemmas 3.2.3, 3.2.6, 3.2.8, Proposition 3.2.7, Corollary 3.2.9.
- §3.3: Lemma 3.3.1.

The displays of Definition 2.3.1, Propositions 2.4.2–2.4.3, Proposition 3.1.5 and Proposition 3.1.9 were checked on page images (pp. 14, 16, 19, 21); text extraction mangles this paper's notation. Twenty-two of the new items join the Local Galois deformation rings Part II route, three (`lambda-lattice`, `change-of-origin`, `ext-adjacent-weights`) the new GL₂ roadmap.

## Resume here

1. **Continue the item list, §§4–8.** Still to add, in v7 numbering:
   - §4: Lemmas 4.1.1, 4.1.2, 4.2.3, 4.2.4, 4.3.2; Propositions 4.2.1, 4.3.1, 4.3.3; Corollary 4.2.6.
   - §5: Lemmas 5.1.2, 5.1.3, 5.3.1, 5.3.2; Proposition 5.3.3; Theorem 5.3.4.
   - §6: Lemmas 6.1.1–6.1.3, 6.2.1, 6.2.3, 6.3.1, 6.3.3–6.3.5, 6.3.7–6.3.9, 6.4.3, 6.4.4; Corollaries 6.1.4, 6.3.13, 6.3.15, 6.4.5; Propositions 6.2.2, 6.2.4, 6.3.10, 6.4.1; Theorem 6.3.11.
   - §7: Lemmas 7.1.1, 7.1.2, 7.1.4, 7.2.1, 7.3.2, 7.4.2; Propositions 7.2.2, 7.3.1, 7.4.1, 7.4.3; Theorem 7.3.3.
   - §8: Lemmas 8.1.2, 8.2.1, 8.2.2, 8.3.1, 8.3.2, 8.3.5, 8.3.6, 8.3.8; Propositions 8.2.3, 8.2.6, 8.3.3, 8.3.7; Corollaries 8.2.4, 8.3.10; Theorems 8.3.4, 8.3.9, 8.3.11, 8.4.3.
   Render page images for anything with a display: §§4 and 6–8 are far more notation-heavy than §§2–3, and `pdftotext` silently drops superscripts and primes.
2. **Sharpen the three remaining paraphrase items.** `def-rings` still summarises §§4.2–4.3 rather than stating Propositions 4.2.1, 4.3.1 and 4.3.3; `patching` summarises §8.1; `kisin-descent` and `generic` are now backed by the §2–3 items but still read as summaries — consider replacing them with pointers, or demoting them to the definitions they actually name.
3. **Complete `kisin-matrices`.** It describes the renormalization of C_{M,β} into A_{M,β} without transcribing the display of Definition 3.1.1; take it from p. 18 of v7.
4. **Check the libraries.** No Mathlib or Tau Ceti declaration has been examined for any item, so all 42 are `missing` by default. The plausible library candidates are in the commutative algebra and Iwasawa-algebra layers (Lemma 3.3.1, completed group algebras, Lazard theory), not in the Galois-side items.
5. **Source issues.** None are proposed yet. §§2.3–3.3 read clean, but they are largely definitional and quote their inputs; §§4–8 are where computations live and should be read with the errata discipline of PROTOCOL §18.
6. **Do not re-plan the routes** without reading their briefs: the three inherited routes already name most of what §§2–8 contain, and the new GL₂ roadmap id is shared with the Colmez–Dospinescu–Nizioł extraction on purpose.

## Checks

`python3 scripts/check_paper.py` reports ok and `python3 research/blueprint/intake.py check-files` reports 2 files, 0 problems on the edited result and report. The seventeen inherited ids were checked programmatically to be the first seventeen items, in order, with only their locator strings changed; every missing item is routed exactly once across the three unchanged routes. No Lean artifact was written or compiled. This worker read §§2.3–3.3 of v7 only, did not re-verify the inherited items against the source, and checked no library declaration.
