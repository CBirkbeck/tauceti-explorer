# Handoff — PAPER-CESNAVICIUS-19

Current worker: Codex, session codex-c83e7a; issue #1328; 2026-09-23.

Partial checkpoint: 178 items (15 library, 13 planned, 150 missing), 17 existing-source routes, 42 definitions/constructions with 126 unexecuted planning tests, and the same 25 named gaps. All inherited159 IDs/statuses are preserved. Every missing item is routed once; the 331-edge graph is acyclic. The whole 17-page main paper was freshly reread this continuation.

Read the report first, then the JSON's supportingSources, sourceCoverage, libraryAudit and gaps. URLs/hashes/reading ranges are recorded there. No private reference library or Lean implementation is assumed.

## Resume order

1. G-NONABELIAN is non-blocking (Claude Code, cc-fb70e5, 22 September 2026). The nonabelian clause was split into finite-etale-push-nonabelian, h1-descent has no dependants, and all uses go through h1-abelian. The mathematical question, twisted-fibre surjectivity for torsors on V that do not extend, remains open (errata E1). Reading Gir71 III.3.2.2 would still be welcome but is no longer on the critical path.
2. G-ADIC-LIMIT is narrowed to one statement (Claude Code, cc-7b31c4, 22 September 2026). Sch17 Proposition 6.4 is read in full, including the proof of (ii); its parts (o), (i), (ii) are items adic-spectral-limit, adic-finite-etale-limit, perfectoid-qcqs-limit on the P5 route. The proof of (ii) uses affinoid perfectoidness of the stages only through (o) and (i), and the paper proves (o) for its own Noetherian stages at (4.10.6). So all that footnote 3 still has to prove is (i) for Noetherian stages: for a filtered system of affinoid Tate rings with a common pseudouniformizer, each Noetherian, a ring of definition and integrally closed in its generic fibre, whose completed colimit has perfectoid generic fibre, every finite etale algebra over the limit descends to a stage. Then footnote 4's topos-limit or hypercover continuity. Do not invoke A3's stronger affinoid statement.
3. G-HUBER is untouched and is now the binding half of the adic branch: read Hub96 1.1.1, 2.2.8, 3.2.9. The scheme stage is R_j^h[1/p], not R_j[1/p]. Huber's book is not publicly available; the first two continuations did not obtain it. If it cannot be obtained, say so rather than paraphrasing the statement from the main paper.
4. G-LEFSCHETZ is narrowed (same session). VIII 2.1 with 2.2/2.3, IX 1.4 with 1.5, IX 2.2 with 2.3, XI 1.1 and XI 3.16/3.17 are all read at their locators with their proofs and are items on the SF.4 route. Hypothesis (e) of XI 3.17 is printed as y in Y and must be read as y not in Y; the item pic-hypersurface-descent carries the corrected form and the argument for it. What is left is the layer below: SGA 2 IV-V dualizing modules and local duality, and VII's Ext-coherence criteria, behind VIII 2.1; EGA 0_III 13.3.1 behind IX 1.1; EGA 0_III 13.7.7 and EGA III 3.4.2 behind IX 2.1. Retain dimension at least 4.
5. G-ELKIK is now narrowed (Codex codex-c83e7a, 23 September): original Elkik pp553–568, all §§0–II, and GR5.4.1–14 /3.2.1–18 are freshly read. The direct finite-conormal Newton proof, Tougeron lemma, conormal stabilization, torsion separation, complete/principal/general Noetherian approximation are written. Resume with GR5.4.13’s finite-data Noetherian Henselian model reduction, including descent of conormal factorization witnesses; then the SF.0 HenselianRing-to-smooth-lifting interface already shared with CMM21/044, and DD.0 low cotangent comparison. The full Ext morphism-obstruction construction is optional for the new direct Newton argument, but the Ext-defined H still needs the low comparison. Elkik2bis is Noetherian by the convention at p554. Do not identify H_Jac and H_fac literally. Published GR03 5.4.41 is preprint Cor5.4.42; the published interior remains uncollated.
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

- Codex, codex-c83e7a, 23 September 2026: added19 items (four library, two planned, thirteen missing), all new missing items on SF.4. The report gives fresh read ranges, proof details, sources/hashes, pinned statements and exact diagnostics. The Huber publisher request returned HTML; the book was not read.

The result now has sourceIssues E1–E4 as issue5a requires. E1 is copied unchanged from the dedicated errata file; E2–E3 are the local GR5.4.13 finite-subideal and finite-stage base-change/coordinate slips; E4 transfers the earlier SGA2 XI3.17(e) correction. No independent verdict was added. Current errata.py does not deduplicate matching IDs across files, so the two occurrences of E1 need coalescing at integration. The canonical dedicated record and collector are outside this job’s editable scope.

Latest validation: check_paper and three-file intake pass; 2,551 structural assertions, 331 dependency edges, and 6,383 exact arithmetic assertions (including1,296 Newton and1,200 Taylor cases). These are not Lean tests. All126 definition/construction planning tests remain unexecuted in Lean. Preserve all gap IDs and source-reading boundaries on resumption.
