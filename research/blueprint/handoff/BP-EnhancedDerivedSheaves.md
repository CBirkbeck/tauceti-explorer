# Handoff: BP-EnhancedDerivedSheaves (issue #9913)

Whole-roadmap blueprint of *Enhanced derived categories of sheaves* (`EnhancedDerivedSheaves`), all eleven
stages. Worker: Claude (Claude Code, Opus 5.5), session `claude-r1SP4N`, 16 October 2026. Claim confirmed
by the bot on the issue. This session wrote none of the parts, their reviews, the assembly or the package.

The pass is complete: every stage is planned, none is closed, and the packet goes to its independent
review (`REV-EnhancedDerivedSheaves`).

## Files

- `research/blueprint/packets/EnhancedDerivedSheaves.json` (new): the whole-roadmap packet.
- `research/blueprint/readmes/EnhancedDerivedSheaves.md`: the assembled reader, updated to the
  whole-roadmap plan (new section *The whole-roadmap plan*; new and corrected declaration blocks; imports,
  request triage, layer overview, dependencies, requests, gaps, coverage, source issues, Lean, structural
  proposals and sources brought up to date).
- `research/blueprint/suggested/EnhancedDerivedSheaves.lean`: the assembled file plus two sections
  (`WholeRoadmapOrdinary`, `WholeRoadmapMonoidal`) for the new declarations.
- This note.

The accepted part packets `EnhancedDerivedSheaves--E0.json` and `--E5.json` are unchanged.

## How the packet is built

`check_blueprint.py` rejects a node id that also appears in another packet of the same roadmap, so the
packet follows the accepted AInfCohomology precedent:

- `importedNodes` lists the 169 accepted part declarations; `assembly.imports` pins both part packets by
  SHA-256 (E0 `6f0de6dd…`, E5 `0786c46b…`) with their review ids.
- `nodes` holds the 35 new declarations only.
- `assembly.importedNodeCorrections` gives field replacements for 13 imported declarations, and
  `assembly.importedPrerequisites` the replacement prerequisite lists among them. **When reviewing or
  packaging, use the corrected fields, not the part packets' fields, for these 13.**
- `coverage[].targets` ranges over imported plus new declarations; `inventory` counts the union:
  204 declarations (86 theorems, 51 constructions, 31 definitions, 25 lemmas, 11 comparisons), 357 API
  items, 271 unit tests, 51 planets.

## What the pass adds (35 declarations)

- **E5:cotangent-export (12), moved down from DerivedDeRhamCohomology DD.0.** Modules over animated
  rings, square-zero extensions and derived derivations, the cotangent complex (planet), its universal
  property, the naive comparison with Mathlib's `H1Cotangent`, transitivity (planet), base change,
  localization and filtered colimits, smooth and étale maps, regular quotients, lci amplitude (forward
  direction only), derived exterior powers (planet). Locators re-checked against the Stacks chapter
  downloaded today. **DD.0 must import these** (`assembly.moves` maps its eleven declarations).
- **Spectra without StableHomotopyKTheory.** `E5:presentability/spectra` (Sp as stabilization, mapping
  spectra; HA §1.4.2–1.4.3) and the corrected `E5:spectra-comparison/late-realisation` (HR and
  Mod_HR(Sp) ≃ D∞(R), HA 7.1.2.1/7.1.2.13). The concrete point-set comparison stays with H.5.
- **Bhatt–Scholze §2/§11 geometric inputs (E2, 10).** Inductive level of proper surjections; abstract
  blowup squares for h-sheaves; Lemma 11.23 descendable maps; Proposition 11.25; Theorem 11.12 in module
  form; Theorem 11.26 (two gaps); Corollary 11.28; Lemma 11.38; the sequential lim¹ product vanishing and
  the multiplicative derived-limit filtration (gap W1). Ordinary scheme geometry is cited from
  SchemeAndStackFoundations SF.0/SF.2/SF.4 nodes and AdicSpacesPartII F0 (coherence of proper pushforward).
- **Closing part requests/gaps.** `E1/slice-free-module-sheaves` (generators, replacing R0.1's generator
  part; real-bodied in Lean), `E5:abstract/symmetric-monoidal-derived-sheaves` (Hinich, NS18 A.5; no
  points; cup products), `E5:abstract/amitsur-tower-fibres` (Carlsson Cor. 6.7),
  `E4/amitsur-completion-of-finite-modules` (Carlsson Thm 4.4; answers R5.3).
- **Paper items and consumer requests.** `E1/localization-and-reduction-detect-zero` (BS17 6.6–6.7),
  `E1/valuation-decomposition-triangle` (BS17 6.3), `E1/enhanced-versus-triangulated-colimits`
  (BMPSTWW23 Remark 4.11), `E1/projection-formula`, `E3/kan-extensions-along-functors`,
  `E4/completed-base-change`, `E5:presentability/filtered-objects`, `E5:spectra-comparison/perfect-modules`.

All 106 paper items routed to this roadmap are accounted for in `sourceCoverage` (most were already
planned by the parts; three are not planned with reasons: Remarks 11.5 and 11.34 and DAG VIII 2.1.11,
which the plan's hyperdescent route does not use). All 130 requests other packets address to this roadmap
are triaged in `incomingRequests`: 40 answered, 3 by the Tau Ceti library, 68 partly (with what remains),
6 follow-up targets of the named layer, 13 owned elsewhere. The partly/follow-up items are listed in the
coverage `remaining` lists.

## Corrections of imported declarations (13)

Straightening over nerves of small ordinary categories (answers R5.7); the cotangent interface, the E∞
comparison and the spectral comparison (no DD.0/H.5); the perfect h-cover descendability proof (closes the
geometry gap); the uniform-index theorem (exact prerequisites instead of whole layers); descendable
algebras (uses the Amitsur fibres); perfect h-topology (SF nodes instead of D0); K-flat replacement and
derived presentability (slice-free generators); derived tensor (cites `TauCeti.SheafOfModules.tensorProduct`);
bounded totalizations (drops the E2 citation, which created a layer cycle); the joint diagram (wording).

## Graph and structure

- The node graph of all 204 declarations with the corrected prerequisites is acyclic.
- With the parts' sub-layer proposals 4 and 9 (E2:towers now also holding the two new tower nodes;
  E5:descent now also holding the Amitsur fibres) the layer graph is acyclic, order: E0, E1, E2:towers,
  E3, E5:abstract, E5:presentability, E5:animation, E5:descent, E5:spectra-comparison, E2,
  E5:cotangent-export, E4, E5.
- No declaration cites a higher-tier roadmap. One request remains (DiamondsAndVStacks D0, narrowed to
  ordinary coherent-site interfaces).
- New restructure proposals: retitle E5:cotangent-export and E5:spectra-comparison, rescope the E4
  description (generic completion owned here), and the sub-layer order above.

## Gaps

New: G-EDS-W1 (multiplicativity of the derived-limit filtration for general index categories; BS17 leaves
it to the reader), G-EDS-W2 (Bhatt–Halpern-Leistner Theorem 1.10, idempotent algebras and quasi-compact
opens) and G-EDS-W3 (h-covers of noetherian schemes are universal topological quotients; routed by BS17's
extraction to a proposed ArcTopologyAndDescent roadmap that has no design yet), both needed only by the
converse direction of BS17 Theorem 11.26. Inherited open gaps keep the parts' ids (G0.1–G0.5, G0.8–G0.12,
G5.3, G5.4), with G0.2 and G0.4 narrowed. Closed or narrowed: G0.6, G0.7, G5.1, G5.2.

## Sources read (16 October 2026)

BS17 author copy and arXiv v3 (§2, §6, §11); Mathew arXiv v2 §3; Carlsson arXiv v1 (Thm 4.4, Cor 6.7);
Bhatt–Halpern-Leistner arXiv v1 (Thm 1.10); BMPSTWW arXiv v3 (Remark 4.11 and footnote 9); Stacks chapters
The Cotangent Complex, Modules on Sites, Cohomology on Sites and More on Algebra; HA (§1.2.2, §1.4.2–1.4.3,
§2.2.6, §4.6.1, §4.8.2, §7.1.1–7.1.4, §7.2.4, §7.3.2, §7.3.5); HTT (§4.3.2–4.3.3, §6.5.1–6.5.2); NS18 author
copy (Appendix A, Theorem I.3.6); Bhatt, p-adic derived de Rham, Remark 6.6; Bhatt–Lurie, Appendix B;
BMS2 §5.1. URLs and hashes are in the packet's `sources`. No restricted source was used. The new
declarations use the corrected statements of the BS17 extraction's findings E3, E14, E22, E34, E47, E48,
E49 and E51; this pass found no further mistake.

Baseline: 34 Mathlib/Tau Ceti declarations cited by the new declarations and corrections, each read in
the pinned source trees (Mathlib 082e2d37e8, Tau Ceti f790474821). Current TauCetiRoadmap main
(0d144d04) and Tau Ceti (a91d3aaf) have no overlapping roadmap or library.

## Checks run

- `python3 scripts/check_blueprint.py` on the new packet and both part packets with the pinned index
  (`--index /home/chris/tauceti-swarm/workers/baseline/declarations.tsv`): 0 errors, 0 warnings each.
- `lean-check research/blueprint/suggested/EnhancedDerivedSheaves.lean`: exit 0; 645 warnings, all
  placeholder-proof warnings (589 from the part sections, 56 new); no errors, no other warnings. The new
  sections state 62 of the new declarations' API, test and theorem names; the rest need carriers that are
  not at the pins and are named in comments (`leanPrototype.coverage` lists both).
- Reader: all 204 declarations appear exactly once as anchored blocks; all 1,993 internal links resolve;
  every new API and test name appears; packet-derived prose is escaped for `src/markdown.js`.
- `research/blueprint/intake.py check-files` on the four deliverables: no problems.

## For the reviewer and the next steps

- Start with the 35 new declarations and the 13 corrections; the rest is the accepted parts.
- Check the moves: DerivedDeRhamCohomology's plan and package should import the E5:cotangent-export
  targets; SchemeKTheoryOperations S.4 should import `E2/noetherian-h-cover-descendability` and
  `E2/noetherian-h-descent`. No other roadmap's file was edited.
- The package `research/blueprint/packages/EnhancedDerivedSheaves/` (already accepted, upstream as
  TauCetiRoadmap PR #908) carried several of these targets ahead of the plan; this plan now supports them.
  The new targets that the package does not state (projection formula, Kan extensions along functors,
  completed base change, filtered objects, perfect modules, valuation triangle, detection lemma, Theorem
  11.12/11.26 in this form, Corollary 11.28, Lemma 11.38, Carlsson's theorems) are for a package revision.

Nothing in the scratch directory is needed to resume.
