# Handoff: ASM-CrystallineCohomology (issue #221)

This job assembles the roadmap *Crystalline cohomology, de Rham–Witt and logarithmic foundations* from its two parts:

- CR.0, CR.1, CR.2, CR.3, CR.3:Frobenius-isogeny, CR.3:duality, CR.4: written by BP-CrystallineCohomology--CR.0, reviewed (and corrected in place) by REV-CrystallineCohomology--CR.0;
- CR.5:log-algebra, CR.5, CR.6, CR.7: written by BP-CrystallineCohomology--CR.5, reviewed by REV-CrystallineCohomology--CR.5.

Worker: Claude, session claude-24jtOj, 7 October 2026. I took no part in either part or either review. This is a complete assembly, not a checkpoint.

## Files

- `research/blueprint/readmes/CrystallineCohomology.md`: the full roadmap document.
- `research/blueprint/suggested/CrystallineCohomology.lean`: the two parts' suggested files, joined.
- `research/blueprint/handoff/ASM-CrystallineCohomology.md`: this note.

The part packets are not deliverables of this job (the queue lists only the three files above), so they are unchanged. The fixes they need are listed below for the jobs that own them.

## The reviews' objections

Both packets carry `review.status: needs_changes`.

- **REV-CrystallineCohomology--CR.0** gives three reasons. (1) The part document was written for the uncorrected packet: it states things the review found false, lacks the 14 added nodes and places two CR.1 nodes under CR.2. *Answered by this document*, which is generated from the corrected packet. (2) CR.1, CR.2 and CR.3 have targets without nodes, so the packet is `partial`. (3) Points of the second reading left for the revision. Reasons (2) and (3) need packet edits and remain for the revision of that part; the document shows each stage's open items under "Still open in this layer".
- **REV-CrystallineCohomology--CR.5** asks the orchestrator (2) to refresh the reader, which still had the false integrality converse, old locators, missing PD hypotheses, the CP.2 product request, the R06.5 cycle and the uncompleted coefficient field. *Answered by this document.* Its blocking reason, false universal Lean signatures and tests that do not bind to their objects, remains for the revision: the joined Lean file keeps those signatures, as the review did, and its opening note names them.

A script checks that every packet field occurs in the document after the generator's escaping and whitespace normalisation: 10528 fields (titles, statements, hypotheses, proof steps, acceptance items, API and test names, roles, kinds and statements, uses, source locators, excerpts and matches, prerequisites, planets, library locations, gaps, requests, source-issue fields with their verdicts, structural proposals, coverage items, upstream notes, sources and versions, baseline declarations, and the CR.5 review's per-node notes). None is missing. The part documents `readmes/CrystallineCohomology--CR.0.md` and `--CR.5.md` are superseded and were not edited. No review verdict was changed.

## What was done

**The document** (13,477 lines, 3,183 internal links, all resolving).

- Generated from the two packets by a script; the introduction, conventions, layer overviews and the cross-part section are new prose, checked against the node statements.
- Introduction: purpose and scope with every layer's content; what is not here, with each owner; boundaries, with the three accepted restructurings that fix them (RS-01, RS-02, RS-28) and the dependency discipline; a generated table of every other roadmap's layer or node imported, with consumers; a generated table of every node of another packet that cites this roadmap (21 packets; HodgeTateAndCanonicalSubgroups T6, merged during the job, cites fourteen CR.5:log-algebra and CR.5 nodes by id, from eleven of its nodes); the 64 requests other packets file with this roadmap, each with its answering nodes, a status and what remains; conventions; the 38 source records with versions; the 171 pinned declarations; a layer overview with the 50 planets.
- Layers in dependency order: CR.0, CR.1, CR.2, CR.3, CR.3:Frobenius-isogeny, CR.4, CR.3:duality, CR.5:log-algebra, CR.5, CR.6, CR.7. CR.3:duality stands after CR.4 because its trace is built from W_nΩ^d and its nodes cite CR.4. Within each layer, nodes are ordered prerequisites first. Each layer has an overview and its open items; each node its statement, hypotheses, proof outline or construction, API, unit tests, acceptance, recorded uses, dependencies (linked), users in the roadmap, proposed location, where its names occur in the Lean file, sources with excerpts, and the review's verdict (with the CR.5 review's per-node note, which carries the revision instructions).
- Closing sections: cross-part prerequisites, the parts' 26 requests by supplier, the 47 gaps (G1–G43 from CR.0, G44–G47 from CR.5), the 70 source issues with verdicts, the 15 structural proposals (S1–S13, S14–S15), the notes for the maintainer, and the layer dependencies.

**Notation.** Unlike some assemblies, no node text needed respelling: both parts write Unicode and use the same symbols for the objects they share. The Conventions section fixes the conventions across layers and records the three double uses: CR.4 indexes Witt truncation by r while CR.1, CR.3, CR.5 and CR.6 write W_n = W(k)/pⁿ, and W_r(M) of a Dieudonné complex is a quotient complex; Disegni–Liu's κ°, W°, W[t]°, W^triv in the CR.4 nodes are the k^log, W(k)^log (1 ↦ 0) and W(k)[t]^log of CR.6; and the source id `dl` names two different versions of Disegni–Liu (arXiv v3 in the CR.0 part, the 2024 author copy in the CR.5 part, with different page numbers), disambiguated in the document as `src-dl-cr-0` and `src-dl-cr-5`.

**Requests filed with this roadmap.** 64 requests from 20 packets, as they stand on `main` at the time of the pull request. The CR.0 part's coverage records analyse 30 of them (28 met in part, 2 not met), given as recorded. The other 34 were read for this job against the nodes of both parts, 33 by two subagents under my direction (every node id they cite was validated against the packets, and I checked the eight answers marked met against the node statements one by one) and one by me: AInfCohomology AI.0 filed a new request with CR.4 during the job (the agreement of Bhatt–Lurie–Mathew's §10.3 comparison maps with the AΩ crystalline map), met in part, since no node states BLM §§10.3–10.4. While the job ran, CohomologyComparisons also renumbered its requests and withdrew its request to CR.7, moving that consumer to its CR.3 request; the document follows the current numbering. The results: 8 met, 25 met in part, 1 not met (AutomorphicGaloisRepresentationsPartII AG2.6 asks CR.6 for Caraiani's two-boundary log de Rham–Witt complex, which no node plans; the request itself calls it a Part II extension). Many requests name one layer and are answered by another; the document says so per request.

**`check_blueprint.py`**, with the pinned declaration index (`TAUCETI_BASELINE` set to the baseline directory), reports 0 errors and 0 warnings on both part packets.

**The Lean file** (7,544 lines).

- One standard note, one import block (the union of the parts' imports: 81 Mathlib modules, no Tau Ceti import, as in both parts), then the CR.0 part's body and the CR.5 part's body, each introduced by a section comment that keeps the part's own note (the CR.0 part's omission register stays at the end of its body). The CR.0 part leaves three anonymous `noncomputable section`s open; the join closes them before the CR.5 part, so that nothing of the first part (its top-level `open Finset`) reaches the second. No declaration name occurs in both parts, and no name was changed.
- Every declaration, API and test name of both packets occurs in the file: all 1158 of them. In the CR.5 part all are named in the code; in the CR.0 part 120 of 164 declarations, 258 of 340 API items and 175 of 236 tests are named in the code and the rest only in the omission register, as the CR.0 review left it.
- **Elaboration.** `lean-check` on the joined file, at the pinned Mathlib 082e2d3 in the shared build: exit 0, no errors, 1107 warnings, all `declaration uses 'sorry'`, which is the sum of the two parts checked separately (710 + 397). Elaboration checks types only; the CR.5 review's false signatures elaborate too.

## Fixes the part packets need (not deliverables here)

1. **Stage citations in the CR.5 packet that should name nodes.** The CR.5 part cites CR.0–CR.4 by stage id 21 times from 19 nodes. The document's "Cross-part prerequisites" table gives the supplying nodes for each. In short: `CR.5/log-pd-envelope` → `CR.0/pd-envelope`, `CR.0/compatible-divided-powers`; `CR.5/qc-log-pd-envelope` → `CR.0/pd-polynomial`, `CR.0/envelope-quotient-transitivity`, `CR.0/pd-envelope`; `CR.5/log-pd-thickening` → `CR.0/compatible-divided-powers`; `CR.5/a-cris-log` → `CR.0/fontaine-envelope`, `CR.0/completed-envelope`; `CR.6/log-witt-base` → `CR.0/canonical-p-divided-powers`; `CR.7/pd-coefficient-compatibility` → `CR.0/compatible-divided-powers`, `CR.1/pd-differentials`; `CR.6/hk-good-reduction` → `CR.2/smooth-lift-filtration`, `CR.2/formal-and-end0`; `CR.6/hk-products` → `CR.3/cup-product`, `CR.3/kunneth`; `CR.6/qian-family-model` → `CR.6/hk-finiteness`; `CR.7/finite-projective-coefficients` → `CR.1/crystal`, `CR.1/taylor-equivalence`; `CR.7/relative-crystalline-direct-image` → `CR.1/site-morphisms`, `CR.1/crystal`, `CR.3/proper-perfectness`, `CR.3/derived-base-change`; `CR.7/relative-base-change` → `CR.3/derived-base-change`, `CR.3/proper-perfectness`; `CR.7/gauss-manin` → `CR.1/crystal`, `CR.1/quasi-nilpotent-connection`, `CR.1/taylor-equivalence`, `CR.3/proper-perfectness`, `CR.3/derived-base-change`. `CR.6/integral-hk`, `CR.6/hk-finiteness` and `CR.6/hk-comparison` use only the non-logarithmic analogues of CR.3 nodes (named in the table); they can cite those or keep a note. `CR.6/log-de-rham-witt-model` is supplied only in part by `CR.4/semistable-log-witt-models` (no node defines Hyodo–Kato's W_nω_Y for fine log smooth Y of Cartier type; CR.0 gap G36), and `CR.6/sato-residue-variant` by no node (Sato's WΞ_X, CR.0 gap G37). None of the replacements changes a statement or creates a cycle; CR.3 → CR.7 is the edge structural proposal S4 asks for.
2. **Disegni–Liu, Appendix B is planned in two places.** `CR.4/semistable-log-witt-models` and `CR.4/log-witt-proper-support` (CR.0 part) and `CR.6/convergent-log-complex`, `tube-proper-support`, `convergent-monodromy-triangle`, `convergent-witt-comparison`, `sato-residue-variant` (CR.5 part) overlap: the comparison (B.5) is stated twice, CR.4 uses the convergent complexes and supported complexes that CR.6 defines (and records their absence as gaps G37, G40), and CR.6 imports "from CR.4" Sato's complex, which neither defines. Fix: apply the CR.0 review's proposal S3 in its second form, moving the two CR.4 nodes into CR.6; then let them cite the CR.5 nodes, `CR.6/log-witt-base`, `CR.6/convergent-log-complex`, `CR.6/tube-proper-support` and `CR.6/sato-residue-variant`, state (B.5) once, narrow G40, and keep Sato's complex as one gap. This also answers the CR.0 part's two requests to its own roadmap (CR.5:log-algebra and CR.5) by node ids. The move cannot be made by citation alone: CR.4 citing CR.6 would close a layer cycle.
3. **The source id `dl`** names arXiv:2204.09239v3 in the CR.0 packet and the 2024 author copy in the CR.5 packet, with different pagination. Rename one (for instance `dl-arxiv-v3` in CR.0) so that the register and the atlas can tell them apart. Likewise `bo-correction` (CR.0) and `bo-erratum` (CR.5) are the same file.
4. **Berthelot–Ogus is available.** The CR.0 review lists the book among what was not available, and several CR.0 gaps rest on it (filtered comparison G16, smooth-lift and formal comparisons G17–G18, base change and perfectness G19–G20). The CR.5 part read a public scan (`bo`, Chapter 2, Chapter 7 with Theorem 7.8 and Corollaries 7.9–7.13, Appendix B2.1; URL and SHA-256 in its packet). A revision of the CR.0 part can use it.
5. **CR.5 source excerpts.** In the CR.5 packet 118 of 119 node citations quote a single word ("log", "Witt", "residue"), 85 of the `match` texts and 55 of the `uses` entries are generated from the node's own statement ("The passage is used for …", "The source construction uses …"). The locators were checked by the review; the excerpts and matches need to be replaced by literal passages (PROTOCOL §5), as the CR.0 review did for its part. The document says so in its Sources section.
6. **Overlap of base change.** `CR.7/relative-base-change` states Berthelot–Ogus Theorem 7.8 for Rf_{X/S,*}; `CR.3/derived-base-change` states base change for RΓ over an affine base from the Stacks remarks. They are compatible (relative versus absolute), but the CR.7 node should cite the CR.3 node, and the CR.3 node could rest on BO 7.8 (item 4).
7. **Not planned anywhere, asked by consumers:** the comparison H¹_crys(E/W(k)) ≅ D(E[p^∞]) and the supersingular elliptic H¹ computation (CohomologyComparisons asks CR.3 for it; CR.0 gap G21; structural proposal S4); convergent F-isocrystals (PadicDifferentialEquationsAndRigidCohomology RD.3 asks CR.3; S10); the absolute Hesselholt–Madsen Witt complexes and log Witt complexes of prelog rings (KTheoryFiniteLocalFields asks CR.4; S12); Caraiani's two-boundary log de Rham–Witt complex (AG2.6 asks CR.6). Owner decisions for the maintainer; the document lists them under the incoming requests.

## Structural proposals of the parts

All are awaiting the maintainer; none is applied here. The document gives each in full under "Structural proposals".

| # | Part | Action | Proposal |
|---|---|---|---|
| S1 | CR.0 | rescope | DerivedDeRhamCohomology DD.2 (not DD.0) owns ordinary de Rham complexes; replace the atlas link DD.0 → CR.2 by DD.2 → CR.1, CR.2, CR.4 and add DD.3 → CR.4 |
| S2 | CR.0 | rescope | Néron–Popescu desingularisation owned by SchemeAndStackFoundations SF.0, linked to CR.4 and KTheoryFiniteLocalFields L.5 |
| S3 | CR.0 | rescope | the convergent side of Disegni–Liu Appendix B: a log-rigid stage of PadicDifferentialEquationsAndRigidCohomology, or move the two logarithmic CR.4 nodes into CR.6 (recommended here, fix 2) |
| S4 | CR.0 | rescope | own H¹_crys(A/W(k)) ≅ M(A[p^∞]) in CR.7 (adding CR.3 to its prerequisites) or in an R07 stage that may require CR.3 |
| S5 | CR.0 | merge | one owner for proper coherent cohomology (SF.2 preferred over S.2 and A0-extension) |
| S6 | CR.0 | rescope | Dieudonné–Manin owners: RD.1 over algebraically closed residue fields, R06.2 for descent to perfect fields, VB0 for F̄_q |
| S7 | CR.0 | rescope | add CR.3 to the requirements of CR.4, or move CR.4/degree-scaled-frobenius and CR.4/witt-slope-spectral-sequence to a successor layer |
| S8 | CR.0 | rescope | add the PD module of differentials and envelope differentials to the description of CR.1 |
| S9 | CR.0 | rescope | QWittVectors QW.0 as the owner of Witt vectors of étale maps when that roadmap enters the atlas; repoint CR.4's citations of HabiroRings HR.4 |
| S10 | CR.0 | rescope | convergent F-isocrystals owned by RD.3; their comparison with CR.1 isocrystals in CR.7 or RD.7 |
| S11 | CR.0 | rescope | three coherent statements (smooth and étale shriek formulas, Hodge cohomology of projective space, vanishing of the coherent trace on exact classes) added to SF.2 |
| S12 | CR.0 | rescope | owner of absolute Witt complexes and log Witt complexes of prelog rings: CR.4 extended, or KTheoryFiniteLocalFields L.5 |
| S13 | CR.0 | rescope | the stage links implied by the prerequisites that the atlas lacks, and two prospective cycles (HR.4 → CR.4, R06.2 → CR.4) |
| S14 | CR.5 | split | a sub-layer `CR.5:qc-crystalline` for integral quasi-coherent log crystalline cohomology, required by AInfCohomology AI.6 |
| S15 | CR.5 | rescope | *P-adic differential equations, rigid cohomology and p-adic weights, Part II: logarithmic convergent and weak formal cohomology* (tube sites and support, log rigid foundations, Fréchet limits) |

S3 and S15 address the same missing foundations from the two sides; the document's Structural proposals section says how they fit together.

## Requests of the parts

26 requests (17 from the CR.0 part, 9 from the CR.5 part) to 18 supplier layers; the document gives each with the exact statement needed. Index:

| Supplier | Requests (part) | Needed by |
|---|---|---|
| AInfCohomology AI.0:integral | 1 (CR.5) | CR.5:log-algebra/valuation-log, CR.5/a-cris-log |
| AInfCohomology AI.1 | 2 (CR.0) | CR.4/saturation-colimit, CR.4/leta-fixed-point |
| AlgebraicModuliForArithmeticGeometry A0-extension, R09.7a | 2 (both) | CR.3/proper-perfectness; CR.5:log-algebra/divisorial-log, log-regularity |
| CrystallineCohomology CR.5:log-algebra, CR.5 | 2 (CR.0) | CR.4/semistable-log-witt-models (answered by CR.5-part nodes; fix 2) |
| DerivedDeRhamCohomology DD.1 | 5 (both) | CR.0/regular-envelope, CR.3/proper-perfectness (2), CR.3/derived-base-change, CR.5/p-adic-log-crystalline |
| EnhancedDerivedSheaves E1, E2 | 3 (CR.0) | CR.3/cup-product, CR.3/crystalline-descent, CR.4/crystalline-comparison |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 | 1 (CR.5) | CR.7/dieudonne-evaluation, CR.7/messing-filtration-interface |
| LefschetzPencilsAndVanishingCycles LPV.5 | 1 (CR.5) | CR.5:log-algebra/log-abhyankar |
| PadicDifferentialEquationsAndRigidCohomology RD.4, RD.5 | 2 (CR.5) | CR.6 convergent, rigid, Stein and tower nodes |
| PadicHodgeTheory R06.1, R06.2 | 2 (CR.5) | CR.5/a-cris-log, CR.6/unit-logarithm, CR.6/stein-hk-comparison; CR.7/filtered-frobenius-coefficients |
| PerfectoidQuotients Q0:integral-algebra | 1 (CR.0) | CR.4/perfectoid-base-change |
| SchemeAndStackFoundations SF.2 | 3 (CR.0) | CR.4/logarithmic-witt-sheaf, CR.4/log-witt-proper-support, CR.3:duality/trace |
| Tau Ceti JacobianChallenge, layer B | 1 (CR.0) | CR.3/torsion-and-models |

## For the orchestrator and the reviewer

- **No reviewed mathematics changed.** No packet, part document or part Lean file was edited. The document's node text is the packets' own (with `*` and `<` escaped for Markdown outside `$…$` math); the Lean file differs from the parts only in its opening note, two section comments and the three `end`s that close the CR.0 part's anonymous sections.
- **Regenerating the document** after packet fixes: the generator and its prose fragments were scratch files of this job and are not kept. The node sections follow a fixed format (anchor, heading, meta line, statement, then bold-labelled fields in a fixed order), so a later job can regenerate them from the packets and keep the hand-written introduction, conventions, layer overviews and cross-part section. After fix 2 the CR.4 overview, the cross-part section and the layer order need a small rewrite.
- **Planets.** 50 in all; CR.0, CR.1, CR.4 and CR.5:log-algebra have six each, the limit.
- The document was regenerated against `main` as it stood just before the pull request; the tables of consumers and incoming requests reflect the packets on `main` at that time.
