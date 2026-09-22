# Handoff — PAPER-CESNAVICIUS-19

Codex, session codex-a71f92; issue #1328; 2026-09-22.

Partial source-extraction checkpoint: now 159 items (11 library, 11 planned, 137 missing), 17 existing-source routes, 38 definitions with 114 unexecuted tests, and 25 named gaps (three of them narrowed). It began at 148 items. Every missing item is routed once; the item dependency graph is acyclic. The full main paper, including all footnotes/remarks and Appendix A, was read.

Read the report first, then the JSON's supportingSources, sourceCoverage, libraryAudit and gaps. URLs/hashes/reading ranges are recorded there. No private reference library or Lean implementation is assumed.

## Resume order

1. G-NONABELIAN is non-blocking (Claude Code, cc-fb70e5, 22 September 2026). The nonabelian clause was split into finite-etale-push-nonabelian, h1-descent has no dependants, and all uses go through h1-abelian. The mathematical question, twisted-fibre surjectivity for torsors on V that do not extend, remains open (errata E1). Reading Gir71 III.3.2.2 would still be welcome but is no longer on the critical path.
2. G-ADIC-LIMIT is narrowed to one statement (Claude Code, cc-7b31c4, 22 September 2026). Sch17 Proposition 6.4 is read in full, including the proof of (ii); its parts (o), (i), (ii) are items adic-spectral-limit, adic-finite-etale-limit, perfectoid-qcqs-limit on the P5 route. The proof of (ii) uses affinoid perfectoidness of the stages only through (o) and (i), and the paper proves (o) for its own Noetherian stages at (4.10.6). So all that footnote 3 still has to prove is (i) for Noetherian stages: for a filtered system of affinoid Tate rings with a common pseudouniformizer, each Noetherian, a ring of definition and integrally closed in its generic fibre, whose completed colimit has perfectoid generic fibre, every finite etale algebra over the limit descends to a stage. Then footnote 4's topos-limit or hypercover continuity. Do not invoke A3's stronger affinoid statement.
3. G-HUBER is untouched and is now the binding half of the adic branch: read Hub96 1.1.1, 2.2.8, 3.2.9. The scheme stage is R_j^h[1/p], not R_j[1/p]. Huber's book is not publicly available; the first two continuations did not obtain it. If it cannot be obtained, say so rather than paraphrasing the statement from the main paper.
4. G-LEFSCHETZ is narrowed (same session). VIII 2.1 with 2.2/2.3, IX 1.4 with 1.5, IX 2.2 with 2.3, XI 1.1 and XI 3.16/3.17 are all read at their locators with their proofs and are items on the SF.4 route. Hypothesis (e) of XI 3.17 is printed as y in Y and must be read as y not in Y; the item pic-hypersurface-descent carries the corrected form and the argument for it. What is left is the layer below: SGA 2 IV-V dualizing modules and local duality, and VII's Ext-coherence criteria, behind VIII 2.1; EGA 0_III 13.3.1 behind IX 1.1; EGA 0_III 13.7.7 and EGA III 3.4.2 behind IX 2.1. Retain dimension at least 4.
5. G-ELKIK: GR preprint5.4.1–42 and5.8.3–16 selected path is read. Close Elkik ChII Theorem2bis and the cotangent obstruction/finite-stage descent inputs. Published GR03 5.4.41 corresponds to preprint Cor5.4.42; preprint Lemma5.4.41 is only smoothness.
6. Close Gabber's two separate inputs, absolute purity, Grothendieck's generic/surface arguments, Cohen structure/Noetherian colimit and henselian tower arguments, then the Serre/SGA3/CGP/CTS and residue branches. All exact locators/consumers are in the gap ledger.

## Ownership and baseline safeguards

- Integral perfectoid carrier/adapters: Q0:integral-algebra, not a new P1 carrier.
- Affine Weil restriction: RG2.0a; extend its existing finite-type construction without duplicating it.
- Cartier duality, biduality and affine-base-change comparison are **already in pinned Tau Ceti**. Their declarations were read. Do not plan them in R07 again.
- Strict henselization and ordinary Noetherian completion regularity import upstream ModularCurves4D.
- Local parafactoriality is not curve Picard theory; absolute purity is not EDC.2 smooth purity.
- At integration split prefix/suffix sublayers; do not introduce whole-stage cycles between SF.2/SF.4 or P1/Q0.
- No new/Part-II route is proposed. Recheck live catalogue and all claim comments before resuming.

## Checks and status

Run scripts/check_paper.py on the result JSON. Structural graph/API/routing checks accompany the submission; they do not certify the mathematics. There is no Lean deliverable and no compilation claim. Only this job's result, report and handoff are changed.

Do not mark complete merely because all named main-paper conclusions appear: the 25 explicit gaps still block transitive source closure and several dependency contracts require finer splitting.

## Continuation log

- Claude Code, cc-fb70e5, 22 September 2026. Split finite-etale-push, added finite-etale-push-nonabelian to the same SF route, re-pointed h1-descent and updated the G-NONABELIAN gap. Now 149 items and 127 missing, all routed once.
- Claude Code, cc-7b31c4, 22 September 2026. Read SGA 2 VIII §2, IX §§1-2 and XI §1 with their proofs, and Scholze's *Etale cohomology of diamonds* Proposition 6.4 with the full proof of (ii). Added ten items: seven SGA 2 nodes on the SF.4 route (sga2-finiteness, sga2-depth-coherence, formal-comparison-sections, formal-algebraization, pic-thickening-sequence, pic-formal-injectivity, pic-hypersurface-descent) and three Scholze nodes on the P5 route (adic-spectral-limit, adic-finite-etale-limit, perfectoid-qcqs-limit), each wired as a prerequisite of the node that consumes it with the matching `uses` record. Narrowed G-LEFSCHETZ and G-ADIC-LIMIT as described above, recorded the XI 3.17 (e) reading correction, added the Sch17 entry to supportingSources and refreshed the SGA2 entry and `coverage`. Re-derived the paper's numbering from the LaTeX and checked it against the compiled PDF: 38 numbered statements, every cross-referenced number confirmed. Now 159 items and 137 missing, all routed once, graph still acyclic.

`sourceIssues` is still deliberately absent from the result JSON: this paper's section 18 record is the errata job's file, `research/blueprint/errata/PAPER-CESNAVICIUS-19.json` (E1), which `scripts/errata.py` already collects, and duplicating it here would enter it twice in the register. The cc-7b31c4 continuation re-read the whole main paper and found nothing to add to E1. Its one correction is in SGA 2, not in this paper, and lives on the item and in supportingSources.
