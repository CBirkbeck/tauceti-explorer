# Handoff: ASM-AInfCohomology (issue #211)

This job assembles the roadmap *Integral A_inf cohomology and Breuil–Kisin–Fargues structures* from its two parts:

- AI.0, AI.0:integral, AI.0:period-comparison, AI.1–AI.5: written by BP-AInfCohomology--AI.0 (Codex, codex-A12Cq4), reviewed and corrected in place by REV-AInfCohomology--AI.0 (Codex, codex-LLwfv5);
- AI.6, AI.7: written by BP-AInfCohomology--AI.6 (Codex, codex-KvLAhK), reviewed and corrected in place by REV-AInfCohomology--AI.6 (Claude, claude-az7OcR).

Worker: Claude, session claude-tRpzqk, 7 October 2026. I took no part in either part or either review. This is a complete assembly, not a checkpoint.

## Files

- `research/blueprint/readmes/AInfCohomology.md`: the full roadmap document.
- `research/blueprint/suggested/AInfCohomology.lean`: the two parts' suggested files, joined.
- `research/blueprint/handoff/ASM-AInfCohomology.md`: this note.

The part packets are not deliverables of this job (the queue lists only the three files above), so they are unchanged. The fixes they need are listed below for the jobs that own them.

## The reviews' objections

Both packets carry `review.status: needs_changes`.

- **REV-AInfCohomology--AI.0** gives three reasons. (1) The part document contradicts the corrected packet (V(1) lift, localisation at (p), integral-only AI.3, connectivity of D/ξ, Lemma 12.8, local versus proper étale comparison, the P8 primitive comparison, the non-noetherian CR.3 bridge). *Answered by this document*, which is generated from the corrected packet; the layer overviews state each corrected point. (2) 75 node declarations have no Lean signature in the part file. (3) Three API items (`fv-precomplex`, `fv-improved-complex`, `fargues-essential-surjectivity`) do not state their promised assertions. Reasons (2) and (3) need Lean work in the part's file and remain for the revision of that part (see "For the orchestrator"). The joined file keeps the part file unchanged and adds, at the end of the part's body, an inventory of the 75 untyped declarations with their packet statements, so that every packet name occurs in the joined file; it types none of them.
- **REV-AInfCohomology--AI.6** gives one reason: the part document was written for the submitted packet. *Answered by this document.* The review states that the corrected packet by itself meets the conditions for acceptance.

A script checks that every packet field occurs in the document after the generator's normalisation (notation respelling of the AI.0 part's prose, Markdown escaping of `*` and `<`, whitespace): 7541 fields (titles, statements, hypotheses, proof steps, acceptance, prerequisites, realised stages, API and test names, roles, kinds and statements, uses, source ids, locators, excerpts and matches, planets, declarations, library locations, the AI.6 part's Lean status notes, the reviews' per-node notes, gaps, requests, coverage items, source issues with their verdicts, sources and versions, baseline declarations, structural proposals, upstream notes). None is missing. The two part documents are superseded and were not edited. No review verdict was changed.

## What was done

**The document** (9,677 lines, 3,438 internal links, all resolving; 271 anchors, none duplicated).

- Generated from the two packets by a script; the introduction, the section on the reviews, the boundaries, the conventions, the layer overviews and the cross-part text are new prose, checked against the node statements and source locators.
- Introduction: purpose and scope with every layer's content; what is not here, with each owner; boundaries, with the four accepted restructurings that fix them (RS-01, RS-02, RS-05, RS-20) and the AdicSpaces link-map overlap; the dependency discipline; a generated table of every other roadmap's layer or node imported, with consumers (13 roadmaps); a generated table of every node of another packet that cites this roadmap (134 citations from 11 packets); the 30 requests other packets file with this roadmap, each with an answer (3 met, 26 met in part, 1 not met); conventions; the 16 source records with versions; the 55 pinned declarations; a layer overview with the 43 planets.
- Layers in stage order: AI.0, AI.0:integral, AI.0:period-comparison, AI.1, AI.2, AI.3, AI.4, AI.5, AI.6, AI.7; within each, prerequisites first. Each layer has an overview and its open items (coverage records, gaps, requests); each node its statement, hypotheses, proof outline or construction, API, unit tests, acceptance, recorded uses, dependencies (linked), users in the roadmap, citations by other roadmaps, proposed location, where its names occur in the joined Lean file, sources with excerpts, and the review's verdict with its note.
- Closing sections: cross-part prerequisites (75 citations by stage id and 7 requests of the AI.6 part, each with its supplying nodes), the parts' 27 requests to other roadmaps by supplier, the 18 gaps, the 19 source issues with verdicts, the 2 structural proposals, the notes for the maintainer, and the layer dependencies with their status in the stage graph.

**Notation.** The AI.0 part writes the period symbols in ASCII (tilde-xi, tilde-theta, xi, theta, mu, phi, C^flat, mathfrak X, etale, …), the AI.6 part in Unicode. The document prints the AI.0 part's prose fields in the AI.6 part's symbols (ξ̃, θ̃, ξ, θ, μ, φ, C^♭, 𝔛, étale, …); ids, Lean names, library references and source excerpts are left exactly as in the packets. The Conventions section gives the dictionary, and also records: k (AI.0) and k̄ (AI.6) for the residue field of O_C; the Zariski site of AI.3–AI.5 against the étale site of AI.6; R07.4's θ_𝔖 being AI.7's θ̃_𝔖; the three BMS1 records (two of them the same file) and the two BMS2 records (arXiv and published, different pagination); the gap labels AI0-G1–AI0-G12 given here to the AI.0 part's unlabelled gaps. The AI.6 part repeats one hypothesis block in 43 nodes and an arithmetic block in 17; the document prints each once (H6, H6-K) and refers to it.

**Cross-part prerequisites and incoming requests.** The AI.6 part cites the earlier layers by stage id 75 times from 48 nodes and files 7 requests with them; neither part analyses the 30 requests other packets file with this roadmap. Both were read for this job against the nodes of both parts, by two subagents under my direction (every node id validated by script against the packets), then checked by me: every *met* answer to an incoming request was read against the node statements, and one was downgraded to met in part (HabiroCohomologyFoundations HQ.8, AΩ as an E∞-algebra with its Frobenius: the E∞ structure rests on the E5 request); the *full* cross-part verdicts were read; and the one claim that a reviewed node is narrower than its source (BMS1 Lemma 12.8) was checked in the source. Results: cross-part citations 26 full, 44 in part, 5 by no node; the 7 requests of the AI.6 part all met in part; incoming requests 3 met, 26 met in part, 1 not met. The document gives every answer, and the fixes below follow from them.

**`check_blueprint.py`**, with the pinned declaration index (`TAUCETI_BASELINE` set to the baseline directory), reports 0 errors and 0 warnings on both part packets.

**The Lean file** (4,320 lines).

- One standard note, one import block (the union of the parts' imports: 42 Mathlib modules, no Tau Ceti import, as in both parts), then the AI.0 part's body and the AI.6 part's body, each introduced by a section comment; the AI.6 part's opening comment, which preceded its imports, now opens its body. Each part leaves one anonymous `noncomputable section` open; the join closes each at the end of its body, so that the AI.0 part's top-level `open CategoryTheory` and `universe u v` do not reach the AI.6 part. The parts declare in disjoint namespaces, and no name was changed.
- At the end of the AI.0 body, an inventory comment lists the 75 declarations of the AI.0 packet that the part file does not type (exactly the review's table), with node id, declaration name and packet statement.
- Every declaration, API and test name of both packets occurs in the file. AI.0 part: 56 of 131 declarations, all 118 API items declared in the code, all 85 tests as the comment labels of `example`s, 75 declarations in the inventory. AI.6 part, as its review left it: 4 of 60 declarations and 17 of 103 API items declared in the code, the others named in the part's own inventory with each node's `lean.status`; all 76 tests named (18 as labelled `example`s).
- **Elaboration.** `lean-check` on the joined file, at the pinned Mathlib 082e2d3 in the shared build: exit 0, no errors, 309 warnings, all `declaration uses 'sorry'`, the sum of the two parts checked separately (286 + 23). Elaboration checks types only.

## Fixes the part packets need (not deliverables here)

1. **Stage citations in the AI.6 packet that should name nodes.** The AI.6 part cites AI.0:integral, AI.0:period-comparison and AI.1–AI.5 by stage id 75 times from 48 nodes. The document's "Cross-part prerequisites" table gives the supplying AI.0-part nodes for each citation, with a status: 26 full, 44 in part, 5 none. Replace each stage id by the nodes marked full; for those marked part, cite the nodes and keep the stage id with the request, saying what remains; for those marked none, keep the request. None of the replacements creates a node cycle (the AI.0 part cites nothing of the AI.6 part).
2. **The AI.6 part's seven requests to its own roadmap** (to AI.0:integral, AI.0:period-comparison, AI.1, AI.2, AI.3, AI.4, AI.5) are answered item by item under "Cross-part prerequisites": all seven are met in part. What remains is listed there; it is mostly material the AI.0 part should add (below).
3. **One definition planned twice.** The rings A_crys^{(m)} of BMS1 Lemma 12.8 are defined in `AI.4/bounded-pd-coefficients` (a lemma of the AI.0 part) and in `AI.6/finite-level-acris` (a definition of the AI.6 part, with API and tests). Make the absolute rings one definition node in AI.4 (moving the API and tests of `finite-level-acris` that concern them), and let `finite-level-acris` keep Česnavičius–Koshikawa's relative rings and cite it. The AI.6 review asked for this (its question 10).
4. **A stage cycle through one node.** `AI.0/witt-almost-ideal` cites `AI.0:integral/residue-map`, but the atlas has AI.0 → AI.0:integral and not the converse. The node uses only the finite-level map W_r(O_C) → W_r(k) (to define W_r(𝔪) as its kernel), which is Witt functoriality: cite `mathlib:WittVector.map` (already in the part's baseline; the pinned Mathlib has no separate map of truncated Witt vectors, so the map is `WittVector.map` followed by truncation) instead of `residue-map`.
5. **Stage edges the node graph uses and the atlas lacks** (neither recorded nor implied): AI.0:integral → AI.4 (`hodge-tate`, `hodge-tate-cotangent` and `crystalline-witt-special-fiber` cite the twist, the completed cotangent complex and the residue map), AI.0:period-comparison → AI.2 (`lattice-pair`, `minuscule-crystalline-triple`), AI.0:period-comparison → AI.5 (`rational-crystalline-frobenius`, `p-local-freeness-from-periods`), and AI.0:period-comparison → AI.6 (five AI.6 nodes, by stage id). None closes a cycle. They belong in the stage descriptions' `requires` (orchestrator).
6. **Statements the AI.0 part should add, which other roadmaps and the AI.6 part ask for.** BMS1 Lemma 6.13 (η_f of a differential graded algebra with f-torsion-free terms is one, and the Bockstein identification is multiplicative), asked by the AI.6 part, CohomologyComparisons and PrismaticCohomology PR.0; that μ is a unit of W(C^♭) and A_inf → W(C^♭) is flat (CohomologyComparisons); Frobenius compatibility of `AI.4/mu-inverted-etale` and `AI.5/global-etale`; the remaining items of the incoming requests, which the document lists with each.
7. **The AI.0 part's Lean file** (its review's reasons 2 and 3): 75 untyped declarations and three API items that do not state their assertions. The revision of the AI.0 part owns this; see "For the orchestrator".
8. **Labels.** The AI.0 part's twelve gaps have no `id`; this document calls them AI0-G1–AI0-G12 in packet order, and the packet could adopt these ids. The AI.6 part's source issue E-AI6-2 is the register's PAPER-BHATT-MORROW-SCHOLZE-19/E12 (its review says so); the register counts it twice unless one is merged into the other. BMS1 has three source records across the parts (`bms1-v3`, `bms1-published`, and the AI.6 part's `BMS1`, the same file as `bms1-published`); BMS2 has two with different pagination (`bms2`, arXiv; `BMS2`, published).
9. **Breuil–Kisin–Fargues G-modules.** `AI.6/de-rham-lattice-functor` (a) defines the category of BKF modules with a semilinear G-action, which `AI.2/bkf-galois-descent` uses without defining. The definition would sit more naturally in AI.2, as a definition node with API and tests, cited by AI.6.
10. **The bound in `AI.4/bounded-pd-coefficients`.** The node states the intertwining and intersection properties of BMS1 Lemma 12.8 (ii)–(iii) under m ≥ p², which in BMS1 (arXiv v3, checked for this job at the packet's SHA-256) assume nothing on m; only (i) and (iv) need m ≥ p². The AI.6 nodes use them for m ≥ p. Drop the bound from those two clauses.
11. **Layer of the cyclotomic coefficients.** RS-01 gives the O_C-specialised θ, θ̃, μ, ξ, ξ̃ to AI.0:integral, and the AI.6 part cites that leaf for them; the AI.0 part states them in AI.0 (`cyclotomic-coefficients`, `tilde-theta`, `period-regularity`, `witt-kernel-generators`). Either move these nodes to AI.0:integral or cite them in AI.0; the cross-part table names them where they are.

## Structural proposals and requests of the parts

The AI.0 part makes no structural proposal. The AI.6 part makes two, both awaiting the maintainer and not applied here; the document gives each in full under "Structural proposals".

| # | Part | Action | Proposal |
|---|---|---|---|
| S1 | AI.6 | rescope | formal GAGA over a complete rank-one valuation ring (CK Theorem 4.12), finiteness of proper formal schemes over O_C and the comparison of CK Remark 4.19 belong with AdicSpacesPartII F0, extended beyond noetherian adic rings (gap G-GAGA) |
| S2 | AI.6 | split | show AI.6 as three sub-layers for reading; no stage id changes |

The AI.6 review's questions to the orchestrator (its report, "Questions for the orchestrator") stand, with three answered by this assembly: question 1 (the reader document) by this document; question 5 (AI.5's A_inf-linear algebra sitting under CohomologyComparisons CP.5 ids) by the AI.0 part, whose AI.5 and AI.2 nodes now state BMS1 §4.2 under RS-01 and can be cited by node (cross-part table); question 10 (the rings A_cris^{(m)}) by packet fix 3 above.

Requests of the parts, 34 in all (16 from the AI.0 part, 18 from the AI.6 part, 7 of them to this roadmap's own earlier layers); the document gives each with the exact statement needed. Index:

| Supplier | Requests (part) | Needed by |
|---|---|---|
| Integral A_inf cohomology and Breuil–Kisin–Fargues structures AI.0:integral | 1 (AI.6) | AI.6/ainf-chart-lift, AI.6/all-coordinates-aomega, AI.6/all-coordinates-map, AI.6/aomega-frobenius, AI.6/crystalline-de-rham-square, AI.6/de-rham-lattice-functor and 11 more |
| Integral A_inf cohomology and Breuil–Kisin–Fargues structures AI.0:period-comparison | 1 (AI.6) | AI.6/bdr-cohomology-etale-embeddings, AI.6/bdr-comparison, AI.6/bdr-comparison-map, AI.6/de-rham-lattice-functor, AI.6/etale-bdr-agreement |
| Integral A_inf cohomology and Breuil–Kisin–Fargues structures AI.1 | 1 (AI.6) | AI.6/all-coordinates-aomega, AI.6/all-coordinates-log-crystalline, AI.6/aomega, AI.6/aomega-frobenius, AI.6/crystalline-de-rham-square, AI.6/etale-bdr-agreement and 8 more |
| Integral A_inf cohomology and Breuil–Kisin–Fargues structures AI.2 | 1 (AI.6) | AI.6/cohomological-bkf, AI.6/de-rham-lattice-functor, AI.6/nodal-conic, AI.7/bkf-tensor-functor, AI.7/twist-compatibility |
| Integral A_inf cohomology and Breuil–Kisin–Fargues structures AI.3 | 1 (AI.6) | AI.6/ainf-chart-lift, AI.6/all-coordinates, AI.6/all-coordinates-aomega, AI.6/aomega, AI.6/aomega-sheaf-completeness, AI.6/etale-bdr-agreement and 9 more |
| Integral A_inf cohomology and Breuil–Kisin–Fargues structures AI.4 | 1 (AI.6) | AI.6/finite-level-acris, AI.6/hodge-tate-comparison, AI.6/local-crystalline, AI.6/log-de-rham, AI.7/comparison-diagram-agreement |
| Integral A_inf cohomology and Breuil–Kisin–Fargues structures AI.5 | 1 (AI.6) | AI.6/bdr-comparison, AI.6/cohomological-bkf, AI.6/crystalline-torsion, AI.6/de-rham-torsion, AI.6/degreewise-specializations, AI.6/freeness-criterion and 8 more |
| Adic Spaces PartII R3 | 1 (AI.6) | AI.6/bdr-cohomology-etale-embeddings, AI.6/bdr-comparison, AI.6/hodge-tate-comparison |
| Analytic adic geometry required for diamonds A1 | 2 (AI.0, AI.6) | AI.3/aomega, AI.3/completed-integral-sheaf, AI.6/aomega, AI.6/bdr-cohomology-etale-embeddings, AI.6/bdr-comparison-map, AI.6/etale-comparison |
| Cohomology comparisons: integral diagrams and rational period realizations CP.1 | 1 (AI.0) | AI.5/proper-perfectness |
| Cohomology comparisons: integral diagrams and rational period realizations CP.3 | 1 (AI.6) | AI.6/bdr-cohomology-etale-embeddings, AI.6/bdr-comparison, AI.6/bdr-comparison-map, AI.6/de-rham-lattice-functor, AI.6/etale-bdr-agreement, AI.6/model-independent-lattice and 1 more |
| Crystalline cohomology, de Rham–Witt and logarithmic foundations CR.0 | 1 (AI.6) | AI.6/all-coordinates-aomega, AI.6/all-coordinates-map, AI.6/all-coordinates-pd, AI.6/finite-level-acris, AI.6/finite-pd-base-change, AI.6/local-crystalline and 1 more |
| Crystalline cohomology, de Rham–Witt and logarithmic foundations CR.3 | 1 (AI.0) | AI.5/global-bkf, AI.5/rational-crystalline-frobenius |
| Crystalline cohomology, de Rham–Witt and logarithmic foundations CR.4 | 1 (AI.0) | AI.4/blm-crystalline-route |
| Crystalline cohomology, de Rham–Witt and logarithmic foundations CR.5 | 1 (AI.6) | AI.6/absolute-crystalline, AI.6/all-coordinates, AI.6/all-coordinates-log-crystalline, AI.6/all-coordinates-pd, AI.6/bdr-comparison, AI.6/crystalline-de-rham-square and 10 more |
| Crystalline cohomology, de Rham–Witt and logarithmic foundations CR.5:log-algebra | 1 (AI.6) | AI.6/divisorial-log, AI.6/log-derivations, AI.6/log-exactification |
| Crystalline cohomology, de Rham–Witt and logarithmic foundations CR.6 | 1 (AI.6) | AI.6/global-crystalline, AI.6/hyodo-kato-interface |
| Derived de Rham cohomology and its algebraic foundations DD.0 | 1 (AI.0) | AI.0:integral/completed-cotangent-twist |
| Derived de Rham cohomology and its algebraic foundations DD.1 | 1 (AI.0) | AI.1/continuous-cochains-koszul, AI.1/koszul-decalage-calculation, AI.1/koszul-products-and-cohomology, AI.3/q-de-rham-model |
| Enhanced derived categories of sheaves E1 | 1 (AI.0) | AI.1/bockstein-differential, AI.1/bockstein-reduction, AI.1/decalage-cohomology, AI.1/decalage-filtered-colimits, AI.1/decalage-products, AI.1/decalage-truncations and 3 more |
| Enhanced derived categories of sheaves E4 | 1 (AI.6) | AI.6/absolute-crystalline, AI.6/finite-pd-base-change, AI.6/global-crystalline, AI.7/ainf-base-change, AI.7/crystalline-base-change, AI.7/de-rham-base-change |
| Enhanced derived categories of sheaves E5 | 1 (AI.0) | AI.3/enhanced-noncommutative-regression |
| Finite flat group schemes and integral p-adic Hodge theory R07.2 | 1 (AI.0) | AI.2/minuscule-prismatic-dictionary |
| Finite flat group schemes and integral p-adic Hodge theory R07.4 | 1 (AI.6) | AI.7/bkf-tensor-functor, AI.7/perfect-cohomological-modules, AI.7/twist-compatibility |
| Hochschild, cyclotomic and refined trace methods RT.6 | 1 (AI.6) | AI.7/comparison-diagram-agreement, AI.7/frobenius-decalage, AI.7/nygaard-nondescent, AI.7/trace-descent, AI.7/trace-prismatic-agreement, AI.7/twisted-trace |
| Isocrystals, vector bundles and Banach–Colmez spaces VB0 | 1 (AI.0) | AI.2/bkf-etale-realization |
| P-adic Hodge theory and geometric comparison P8:local-rational | 1 (AI.0) | AI.5/global-etale |
| P-adic Hodge theory and geometric comparison R06.1 | 1 (AI.0) | AI.0:period-comparison/common-rational-period-maps, AI.2/bkf-galois-descent |
| Perfectoid rings and spaces P1 | 1 (AI.0) | AI.2/valuation-special-fiber-bound |
| Perfectoid rings and spaces P3 | 1 (AI.6) | AI.6/all-coordinates, AI.6/all-coordinates-map |
| Prismatic cohomology: relative, absolute, Nygaard and log variants PR.0 | 1 (AI.0) | AI.2/minuscule-prismatic-dictionary |
| Relative Fargues–Fontaine curves and period geometry RF0 | 1 (AI.0) | AI.2/fargues-essential-surjectivity |
| Relative Fargues–Fontaine curves and period geometry RF4:vector-bundles | 1 (AI.0) | AI.2/fargues-essential-surjectivity |

## For the orchestrator and the reviewer

- **No reviewed mathematics changed.** No packet, part document or part Lean file was edited. The document's node text is the packets' own (respelled and escaped as above); the Lean file differs from the parts only in its opening note, section comments, the inventory comment and the two `end`s.
- **The AI.0 part needs its revision round.** Its review asks for one (`BP-AInfCohomology--AI.0~2`): type or state the omission of the 75 declarations, repair the three API items, and refresh the reader; the reader objection is answered by the assembled document, so the round's task is the Lean file and the packet fixes above. The queue had not created the round when this job ran. When the round edits the part's Lean file, the joined file should be regenerated (or the inventory replaced by the new signatures).
- **Regenerating the document** after packet fixes: the generator and its prose fragments were scratch files of this job and are not kept. The node sections follow a fixed format (anchor, heading, meta line, statement, then bold-labelled fields in a fixed order), so a later job can regenerate them from the packets and keep the hand-written introduction, conventions, layer overviews and cross-part text.
- **A request loop.** PrismaticCohomology PR.8 asks AI.0 for the perfect prism (A_inf, (ξ)), while the AI.0 part asks PrismaticCohomology PR.0 for the initial perfectoid prism (A_inf, (ξ̃)). One owner should state the prism and the other cite it.
- **Not met.** CrystallineCohomology CR.0's request to AI.1 for the lift of Lη_f to the enhanced derived ∞-category, unique up to contractible choice: no node states it, and the AI.0 part requests the enhancement from EnhancedDerivedSheaves E1 (gap AI0-G1).
- **Planets.** 43 in all (31 in AI.0–AI.5, 12 in AI.6–AI.7); no layer exceeds six.
- The document was regenerated against `main` as it stood just before the pull request; the tables of consumers and incoming requests reflect the packets on `main` at that time.
