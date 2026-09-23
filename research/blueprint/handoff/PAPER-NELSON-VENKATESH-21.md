# Handoff: PAPER-NELSON-VENKATESH-21

Issue #2190. Claude Code, session `cc-d67081`, 23 September 2026. Status: **partial** (first extraction).

## Done

- `research/blueprint/papers/PAPER-NELSON-VENKATESH-21.result.json`: 44 items (1 library, 2 planned, 41 missing), two routes, 13 prerequisites.
- `research/blueprint/papers/PAPER-NELSON-VENKATESH-21.md`: the report.

**What was read.** arXiv v3 (148 pp.), the version accepted by Acta: §1 in full; the statements — not the proofs — of **all twenty-five numbered theorems** and the definitions they rest on; the section structure of the rest. The published text (Acta Math. 226 (2021), 1–209) is paywalled. Note the paper numbers its theorems 1–25 consecutively, independently of the section numbers, and this extraction follows that numbering; locators give both the theorem number and the section and page.

## The finding

**The atlas has essentially nothing for this paper.** Six searches — the orbit method and coadjoint orbits; microlocal and pseudodifferential analysis; Plancherel and tempered representations; relative characters and Gan–Gross–Prasad; Ratner and homogeneous dynamics; automorphic families as analytic objects — returned no stage for any of the first two, the fifth or the sixth, and explicit exclusions for the third ("no infinite-dimensional unitary representations of noncompact groups, no Plancherel theory, no tempered spectrum" in Tau Ceti's representation theory hub) and the fourth (Gan–Gross–Prasad appears once, as an exclusion in `GrossZagierAndArithmeticHeights`). No existing extraction proposes anything for the orbit method, star products, Ratner or Weyl laws.

So the routing is: a **new roadmap** for the local and analytic machinery (Theorems 1–24 and their definitions), and the already-proposed **`GanGrossPrasadConjecturesForClassicalGroups`** for the automorphic statements (the branching coefficient, the GGP pairs, Ichino–Ikeda, Theorem 25 and its consequences). Ratner's theorem is marked planned at `GeometryOfNumbersAndQuadraticArithmetic:GN.4`, which is the only stage that schedules unipotent-flow proofs — though it is specification-state and aimed at Oppenheim/Duke, so a reviewer may prefer to make it missing and route it.

## Judgement calls for the reviewer

1. **One new roadmap, not two.** The microlocal calculus (Parts I–II), the invariant theory of GGP pairs (Part III), inverse branching (Part IV) and the limit states (Part V) are all in it. They could be split — the calculus is reusable far beyond this paper, while Parts III–V are specific to the branching application — and a reviewer who wants the calculus to stand alone should split at that seam. The brief is written so that Parts I–II come first and could be lifted.
2. **Area `representations`.** The roadmap is representation theory of Lie groups with heavy analysis; `analysis` would also be defensible.
3. **Theorem 24 is recorded by its shape.** Its display uses notation set up across §§29–30 and was not transcribed; the item says so.
4. **No `sourceIssues` field**, because the proofs were not read.

## Resume here

1. **Extract the 41 lemmas.** The paper has 81 numbered statements in total; the 25 theorems are items, the 41 lemmas, 2 propositions, 4 definitions, 3 remarks and 4 examples are not. The lemmas in §§7–12 carry the analytic estimates behind the calculus, and those in §§13–17 the invariant theory.
2. **Transcribe the displays that were left by shape**: Theorem 24 (§30), the three sequences of Theorem 12 (§16), and the remaining clauses (vi)–(…) of Theorem 19 (§26).
3. **Read §§2–5 closely enough to state the operator assignment exactly.** The item `operator-assignment` describes it rather than defining it; a formalisation needs the actual formula, which is set up in §2 and normalized in §§3–5, together with the cutoff χ_0 that appears in Theorems 2 and 3.
4. **Appendix A** (the Plancherel technicalities) was surveyed only at section level and is recorded as one item; it should be extracted, since nothing in the atlas plans the Plancherel formula for a real reductive group.
5. **Read the proofs for `sourceIssues`.** §§7–12 are the most computational.
6. **Do not duplicate the p-adic character theory.** `SmoothRepresentationsCharactersPartII` and `SmoothRepresentationsPartIIUnitaryDual` are already proposed for `SmoothRepresentationsOfLocalGroups` and should supply §23's input.

## Checks

`python3 scripts/check_paper.py` reports ok; `python3 research/blueprint/intake.py check-files` reports 3 files, 0 problems. Every missing item is routed exactly once. The library survey ran against the pinned declaration index, and the three Mathlib declarations in the one library item were read there. All 13 prerequisite DOIs were resolved on Crossref. The internal consistency of (1.2), Theorem 25 and (31.5) was checked. Lean: none.
