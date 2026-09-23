# Handoff: PAPER-LIU-ETAL-22

Issue #1280. Claude Code, session `cc-d67081`, 23 September 2026. Status: **partial** (first extraction).

## Done

- `research/blueprint/papers/PAPER-LIU-ETAL-22.result.json`: 42 items (10 planned, 32 missing), four routes, 11 prerequisites.
- `research/blueprint/papers/PAPER-LIU-ETAL-22.md`: the report.

**What was read.** arXiv v3 (179 pp.): §1 in full, the section structure of §§2–8 and the appendices, and the statements — not the proofs — of the results listed in `source.readSections`. The published version is behind the Springer paywall. The paper has **363 numbered statements**; 42 are items.

**One bibliographic point worth keeping.** The companion [LTXZZ] that supplies the R=T theorem *is* arXiv:2108.06998, which was the original Appendix E of this paper and was separated out in v3 at a referee's suggestion; it has since appeared as Acta Math. Sinica 40 (2024), 1599–1644. So the appendices here are A–D, and the R=T theorem is deliberately outside this article.

## Judgement calls for the reviewer

**Four routes, three of which join ids other extractions already propose.** PROTOCOL §15 says build on, never duplicate, and this paper sits in the middle of a cluster that is already extracted:

1. `UnitaryRapoportZinkSpacesAndRSZModels` (part-ii of `PELModuli`) takes §§3–5. **PAPER-LI-LIU-21, PAPER-LI-LIU-22 and PAPER-DISEGNI-LIU-24 already cite exactly those sections as `[LTXZZ]`, mark the items missing, and route them there.** This extraction supplies them from the source, so a reviewer should check that the items here match what those three expect.
2. `GanGrossPrasadConjecturesForClassicalGroups` (new, proposed by PAPER-JIANG-ZHANG-20 and three others) takes Lemma 8.2.1, the diagonal cycle and Conjecture 8.3.1.
3. `ArithmeticLevelRaisingAndBipartiteEulerSystems` (new) takes the method and the main theorems. This is the only genuinely unhoused piece.
4. `PolarizedAutomorphyLifting` (part-ii of `PotentialAutomorphyInfrastructure`, proposed by PAPER-BOXER-CALEGARI-GEE-25 and the Newton–Thorne extractions) takes the companion's R=T theorem as an interface item.

A reviewer might prefer to fold route 3 into a Part II of `SelmerIwasawaCohomology`, which already has two proposed Part IIs. I kept it separate because a Selmer Part II would take the Selmer half and leave level raising, the reciprocity laws and the Shimura-set periods unplaced.

**Section-level items.** Six items summarise sections rather than quoting numbered statements — `moduli-smooth` (§4, 50 statements), `moduli-special` (§5, 90), `nearby-cycles`, `unitary-hecke`, `unitary-shimura-sets`, `appendix-inputs` — and their notes say so. They are placeholders for the extraction that route 1 needs.

**No `sourceIssues` field**, because the proofs were not read: a missing list, not an empty one.

## Resume here

1. **Extract §§4–5 statement by statement.** This is the highest-value remaining work, because three completed extractions already depend on it. §4 (pp. 36–60) builds the smooth moduli schemes and Construction 4.6.1; §5 (pp. 60–110) is the strictly semistable case — Theorems 5.2.5, 5.3.4, 5.4.4 and 5.5.3 are its structure theorems for the special fibre, and the Tate-cycle computation is the technical heart of the article. Compare each item against the `[LTXZZ, …]` citations in PAPER-LI-LIU-21, PAPER-LI-LIU-22 and PAPER-DISEGNI-LIU-24 so that the two sides agree.
2. **Then §§2, 6 and 7.** §2 has 39 numbered statements; Propositions 2.4.6, 2.6.6 and 2.6.7 are recorded here by their role and need exact statements. §6 has 24 and §7 has 15; the assumptions 6.1.4, 6.1.6, 7.2.2–7.2.4 and 7.3.2 should each become items, since they are what an admissible prime is designed to guarantee.
3. **Then §§3 and 8 in detail**, and the appendices A–D. Appendix D is the Caraiani–Scholze modification; Propositions D.1.3 and Corollary D.1.4 are named in the main text and deserve items.
4. **Render page images before transcribing.** This paper's notation (V^◦_{n_0}, K^◦_{n_0}, Sh(V^◦_n), ∇^1_m, E^{0,2r}_{2,m}, H^1_sing(Q_{p²}, …)) survives `pdftotext` only roughly; every statement recorded here was read in the layout text and the ones with subscript-heavy displays were checked twice, but §§5–7 will need images.
5. **Read the proofs for `sourceIssues`.** Nothing was checked beyond the consistency of the introduction's theorems with their body forms, which agree.
6. **Consider extracting the companion** (arXiv:2108.06998) as its own job: it carries the R=T theorem and is cited by this paper as [LTXZZ]. It is not in the queue under that name.

## Checks

`python3 scripts/check_paper.py` reports ok; `python3 research/blueprint/intake.py check-files` reports 3 files, 0 problems. Every missing item is routed exactly once across the four routes. Prerequisite DOIs were resolved on Crossref except the Gan–Gross–Prasad Astérisque volume, which links to MathSciNet. The library survey ran against the pinned declaration index. Lean: none.
