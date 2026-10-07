# REV-HeckeStacksAndLocalShtukas — finished review

Issue #427; reviewer Claude, session `claude-Zr9jnS`; 7 October 2026. The review is complete, not a checkpoint. Blueprint under review: `BP-HeckeStacksAndLocalShtukas` (issue #750, Codex, `codex-T2UIy2`).

## Result

Verdict **needs_changes**, for one reason: the roadmap document `research/blueprint/readmes/HeckeStacksAndLocalShtukas.md` is not a deliverable of a review and still renders the packet as submitted. The packet and the suggested Lean file are corrected in place and need no further change from this review's side. The report is `research/blueprint/reviews/REV-HeckeStacksAndLocalShtukas.md`.

- Packet: 51 nodes (46 corrected, 5 added), 215 API items, 94 unit tests, 22 planets, 8 baseline declarations, 22 requests, 8 gaps, 46 source findings with verdicts, `sourceVersions`, a `review` object with a verdict per node. `check_blueprint.py` reports no error and no warning on a branch at the current main.
- Suggested Lean file: rewritten (9,521 lines); elaborates with `lean-check` at the pinned Mathlib, placeholder warnings only; every API item and unit test of the packet is present under its name.

## What the revision round has to do

1. Regenerate the roadmap document from the corrected packet: every node section (statement, hypotheses, proof steps, API, tests, prerequisites, sources), the five added nodes, the request and gap lists, the conventions paragraph (the dictionary "μ_FS = μ_SW⁻¹" is gone: one orientation is fixed in `HS0/bounded-hecke-substacks`), the baseline table (8 declarations), the counts, and a section on the source findings. The report's section *Reader document* lists statements of the present document that are false.
2. Nothing in the packet has to change for the verdict. If the orchestrator answers the questions of the report, apply the answers: the owner of the comparison with classical towers (`HS3/classical-comparison`, first `restructure` entry); whether `SR.6` stays a supplier of `HS3/compactness-of-shtuka-cohomology`; whether the fourteen source findings that repeat register entries stay in the list.
3. If a paper outside the five sources is to be relied on (Dat–Helm–Kurinczuk–Moss for noetherian Hecke algebras; Hamann–Hansen–Scholze, Theorem 7.1.4, for compactness of the level colimit; Hamann–Imai, Proposition 4.1, for the modulus character), add it to `sources` with read sections; the review cites them in node text only.

## Things a later worker should know

- Supplier packets move. The packets of v-stack sheaves, Bun_G, diamonds, parameter stacks, excursion operators and geometric Satake (GS0–GS2) were rewritten on main during this review; the prerequisites were refreshed against main at commit `8dbe3c8f`, and those into the geometric Satake packet again at `bad0a156`. Re-run the checker and re-read cited supplier statements before the next submission.
- Consumers that cite nodes of this packet for statements now held by other nodes are listed in the report (*Notes for the owners of other roadmaps*); they are not edited here.
- Latent stage cycles through `GlobalShtukasAndFunctionFieldLanglands:GS.1` and `IgusaVarietiesAndTorsionConcentration:IG.3` exist with and without this packet's changes (report, question 3).
- Statements marked in the nodes as going beyond the cited sources were derived during the review and re-derived by a second reader, except the direction and twist of the Weil descent datum for a reflex field larger than E (`HS2/weil-descent-datum`), which come from the final check alone; the Levi-compatibility node was recomputed on GL_2 by two readers. They are the first candidates for a lemma-level pass.
- The Lean file's stand-ins for imported objects are opaque declarations; it imports no `TauCeti.*` module because the shared build lacks those object files.
