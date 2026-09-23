# Handoff: PAPER-EISCHEN-HARRIS-LI-ETAL-20

Issue #1400. Claude Code, session `cc-d67081`, 23 September 2026. Status: **partial** (first extraction).

## Done

- `research/blueprint/papers/PAPER-EISCHEN-HARRIS-LI-ETAL-20.result.json`: 56 items (43 planned, 13 missing), one Part II route, 15 prerequisites.
- `research/blueprint/papers/PAPER-EISCHEN-HARRIS-LI-ETAL-20.md`: the report.

**What was read.** arXiv v5 (6 March 2020, 152 pp., SHA-256 `881a496a…b9569`), the accepted version: §1 in full, the section structure of §§2–9, and the statements — not the proofs — of the numbered results listed in `source.readSections`. The published article is CC-BY but Cambridge served HTML rather than the PDF to every request, so the journal text was not read; all locators are to v5.

## The finding that shapes this extraction

`AutomorphicPadicLFunctions:L4` **is** this paper. Its description names EHLS, asks for the PEL/unitary Shimura varieties, Igusa towers, ordinary Hecke modules, differential operators, Eisenstein measures, the doubling embedding and the global zeta integral identity "in the exact setting of EHLS", and asks for Main Theorem 9.2.2 with Hypotheses 7.3.2, 7.3.3 and 7.3.5 kept visible. So 43 items are `planned` — at L4 and at the stages it imports from (PELModuli M0/M1/M5, ShimuraCompactifications C4/C5, AutomorphicBundles B2–B4, PadicFamilies L0a/L0, PadicMeasuresIwasawaAlgebras L0, AutomorphicPadicLFunctions L0/L3, AutomorphicLFunctionsAndLocalFactors AL.2/AL.4) — and only 13 are missing.

Those 13 are the local machinery the doubling method rests on, which no stage names: I(χ, s), the Siegel–Weil sections, the Siegel Eisenstein series, the doubling integral and the Garrett map, the doubling method itself, the unramified computation, the (anti-)ordinary test vectors, the archimedean modules and integrals, the local L- and ε-factors, and the continuation and functional equation of L(s, π, χ). They are routed to a Part II of `AutomorphicLFunctionsAndLocalFactors`, which is exactly Part I's declared boundary.

Note also that no decomposition file exists for `AutomorphicPadicLFunctions`: L4 is planned but entirely un-decomposed.

## Judgement calls for the reviewer

1. **The planned/missing line is drawn by L4's two paragraphs.** L4 says "including ramified and p-adic local calculations", so Propositions 4.3.7, Corollary 4.3.8 and Theorem 4.3.10 — the heart of Part II of the paper — are marked planned at L4, not missing. A reviewer who reads L4 more narrowly should move them into the Part II route with the rest of the local machinery; the brief already covers them.
2. **A Part II, not a new roadmap.** The alternative is a roadmap for the doubling method as such. The brief is self-contained and could be lifted out unchanged.
3. **No `sourceIssues` field.** The proofs were not read, so the file asserts nothing about mistakes — a missing list, not an empty one.
4. **Statements that summarise sections.** Five items (`pel-moduli`, `modular-sheaf`, `igusa-tower`, `restriction-of-forms`, `restriction-measures`, `period-invariants`) summarise sections rather than quoting a numbered statement, and their notes say so. They should be replaced as the sections are extracted.

## Resume here

1. **Extract the remaining numbered statements.** The paper has 91 numbered results (43 Lemmas, 17 Propositions, 13 Corollaries, 11 Theorems, 7 Definitions); about 25 are items. The ones with the most content per statement are, in v5 numbering: §2 (the moduli, sheaves and Igusa tower constructions, which carry conditions (G1)–(G3) on p. 33); §4.2 (the unramified and ramified local computations, Lemmas and Propositions around pp. 46–49); §4.3.1–4.3.6 (the Siegel–Weil sections and the main calculation, pp. 49–63); §4.4 (the archimedean modules, pp. 66–76); §5 (measures and restriction, pp. 79–85); §6 (Hecke algebras and the isomorphism of §6.6, pp. 85–107); §8.3–8.5 (the (anti-)ordinary vectors, pp. 128–140).
2. **Transcribe the displays.** Proposition 3.2.5 is a commutative diagram recorded here only by its shape; Theorem 8.2.2 and Corollary 8.2.4 carry integrals whose notation (θ_{(κ,a,b)}, G_{k,ν,χ^{unitary},ψ}) is defined in §8.1–8.2 and should be spelled out. Text extraction was clean for the statements taken here, but §§4.3–4.4 and §8 are notation-heavy; render page images before transcribing them.
3. **Try the published text again from a different network.** It is CC-BY, so an authorised copy exists; only the retrieval failed. The journal pagination would make the locators citable against the version of record. Do not treat v5 and the published text as identical without checking: v5 is the accepted manuscript, four months before publication.
4. **Read the proofs for `sourceIssues`.** §4.3 is the longest and most computational section and is the natural place to start.
5. **Do not re-plan what L4 owns.** The route added here is deliberately narrow. If a later checkpoint finds that L4 is too large to be a single stage, that is a restructuring proposal about the atlas, not something to fix by adding routes in this file.

## Checks

`python3 scripts/check_paper.py` reports ok; `python3 research/blueprint/intake.py check-files` reports 3 files, 0 problems. Every missing item is routed exactly once. The library survey was run against the pinned declaration index and the four declarations cited in notes were read at Mathlib 082e2d3 and Tau Ceti f790474. Every prerequisite DOI was resolved on Crossref. Lean: none.
