# REV-RS-10~2 — independent review of the Habiro restructuring

**Accepted with corrections.** Codex, session `codex-rtOQ9t`, 2026-09-29.
Refs #3942. Reviewed at `9e1a3e4ef6d640bf085a01da28ed117fe88f5081`.

I did not author RS-10 (`codex-c83e7a`), its revision (`cc-39fac3`), or its
previous review (`cc-442dc5`). My earlier, unmerged K-theory fix report concerns
neighbouring arithmetic sources; it neither authored nor changed this proposal
and is not used as evidence for accepting it.

The revision resolves the three objections in [REV-RS-10](REV-RS-10.md).
The remaining corrections below clarify the completion and interim ownership
contracts. They change no endpoint, stage identity or prerequisite direction.
Acceptance concerns the restructuring; it certifies neither completed proofs
nor installation of the draft roadmaps.

## Inputs and scope

Read the five member READMEs and all 38 member stage descriptions and their
requirements in `data/atlas.json`: ArithmeticQuantumTopology,
HabiroCohomologyFoundations, HabiroCyclotomicCompletions, HabiroNumberFields and
HabiroRings. Read the family evidence, the complete proposal and report, the
previous review, PROTOCOL §15, and the restructuring checker and applicator.
Checked the relevant PLAN-HABIRO assignments and QW.1–QW.7 supplier descriptions,
SA.1's light-solid contract, and the external consumer contracts at QM.5, HB.5,
HB.9, the Nahm readiness checkpoints and the two RT.4 return stages.

The library-coverage index continues to route these foundations through
AUDIT-17, AUDIT-19 and AUDIT-28; its process entries are not formalization claims.
No new library declaration or new library-absence claim is introduced by this
review. This is an ownership and prerequisite review, not a repeated full-paper
proof extraction or a fresh audit of the pinned libraries.

## Corrections made in the proposal

1. **Completion at QW.6.** HQ.1's `keeps` and `reason`, and all link reasons
   importing QW.6, now distinguish its `(q-1)`-complete framed q-de Rham and
   q-Hodge complexes over `R[[q-1]]` from HQ.4's uncompleted framed complex over
   the Habiro ring. The former construction uses completed étale lifting;
   calling it uncompleted was incorrect. HQ.1 explicitly holds both framed
   complexes until QW.6 is installed. This matches the staged QW.6 definition
   and [Wagner, q-Witt v5, 4.7](https://arxiv.org/html/2410.23078v5#S4.SS2).
2. **Interim-owner consistency.** QW.1 forwarding reasons incorrectly said that
   HQ.1 still held Lambda theory; HR.1 holds it. QW.2 forwarding reasons
   incorrectly located the degree-zero theory at HQ.4; HR.4 holds it. Several
   QW.6 reasons incorrectly located its framed complexes at HQ.4; HQ.1 holds
   them. Corrected every such reason. The retained HR.4 → HQ.4 and
   HQ.1 → HQ.2 → HQ.4 paths supply these inputs before QW is installed.
3. **Degree-zero versus positive-degree ghosts.** HQ.4's `keeps` and `reason`
   and the QW.2/QW.5 ownership entries now distinguish the degree-zero ghost
   square and ring-level restriction obstruction, owned by QW.2, from the
   positive-degree ghost maps and restriction-free differential operator
   system, owned by QW.5. Before installation their holders are HR.4 and HQ.4,
   respectively. This agrees with the two staged contracts and
   [Wagner, q-Witt v5, §§2–3](https://arxiv.org/html/2410.23078v5#S3).

These three corrections are also recorded in the JSON review object. The
author's report is outside this review's editable deliverables; its conflicting
completion/interim-owner wording should be read with these corrections. Its
original graph counts are historical, superseded by the measurements below.

## Duplication and preservation

The 52 evidence rows form 26 unordered pairs. Rechecked every pair against the
member descriptions. The 18 ownership entries retain the correct distinction
between a construction and a theorem applying or comparing that construction.

| Evidence rows | Ownership or non-duplication decision |
| --- | --- |
| 1/16, 2/18, 3/21 | HC owns generic expansions, evaluation/Taylor maps and rigidity; QT retains its link-integrality and WRT/Ohtsuki theorems. |
| 4/35 | QW.1 owns Lambda theory, with HR.1 the interim holder; HR.1 retains completed Frobenius lifts and HQ.1 global gluing. |
| 5/42, 7/43 | QW supplies degree-zero, positive-degree and animated q-Witt theory; HR.4 retains the finite complete lift and HQ.3 the filtered comparison. |
| 6/39 | HR.3 owns categorical cyclotomic descent; HQ.3 owns its q-Hodge application. |
| 8/44, 9/49 | HR.5 supplies the coefficient ring/Taylor maps; HQ.5 constructs its cohomology objects; HR.6 proves the later coefficient identification. |
| 10/25, 11/51, 27/52 | HC.6, HQ.7 and HR.7 test different APIs; keep all three. |
| 12/28, 26/31 | HC.1 constructs the classical completion; HB.6 owns its arithmetic specialization and the late rational-number-field test. |
| 13/36, 14/40, 15/45 | HC.1 supplies ordinary indexing and cofinality; HR.2/HR.3 retain derived completion/descent and HR.5 its relative inverse limit. |
| 17/37, 24/38 | HC.2 supplies ordinary q-invertibility; HR.2 owns the derived comparison/correction used by HC.5. |
| 19/29, 20/46, 32/47 | HC.3 owns convergent re-expansion; HR.1 constructs the early twisted ring; HB.6 specializes it and HR.5 compares it with finite gluing. |
| 22/41, 23/30 | HC.4/HC.5 supply adjacency and classical localization; derived descent and twisted arithmetic specialization remain separate theorems. |
| 33/48, 34/50 | HB.6/HB.7 supply the arithmetic ring/modules to the later HR comparison stages. |

The additional Theorem 4.22(b) transfer to HQ.5-trace is appropriate. Its proof
uses the trace route, while the smooth and algebraic existence cases remain in
HQ.5. The stronger spherical-E2, 2-inverted instance remains separately scoped.

Every narrowed stage retains its targets or names their owner:

| Narrowed stage | Retained target and transferred input |
| --- | --- |
| HQ.1 | Global gluing, chart comparisons and q-connections remain; Lambda and framed-complex inputs have named final and interim owners. |
| HQ.4 | Framed Habiro ring/complex constructions remain; q-Witt inputs move to QW, and the descent application/comparison to HQ.3. |
| HQ.5 | Algebraic existence, partial multiplicativity and completed comparisons remain; the spherical-E1 case moves to HQ.5-trace. |
| HC.5 | Ordinary modules, exactness qualifications and localization remain; HR.2 supplies the late derived correction. |
| HC.6 | Classical tests and exports remain; only the arithmetic comparison test moves to HB.6. |
| HB.6 | Arithmetic specialization, excluded roots and examples remain; HR.1/HC supply the early ring and classical operations. |
| HR.1 | Completed Frobenius and the early Taylor ring remain; Lambda theory moves to QW.1 when installed. |
| HR.2 | Habiro-specific derived/spectral completion and bounded-below comparison remain; generic completion and light-solid spectra have named suppliers. |
| HR.3 | Derived finite descent and its coherences remain; HC supplies ordinary indexing/arithmetic. |
| HR.4 | Finite glued rings, staticity, complete étale lift and Frobenius transitions remain; degree-zero q-Witt theory moves to QW. |
| HR.5 | Relative inverse limit and the Taylor comparison remain; HC/HR.1 supply indexing and re-expansion. |

No family anchor exists and no extension, merger or retirement is proposed.
All 38 identities survive. No upstream scope or requirement is changed.

## Earlier objections and consumers

**The cycle is resolved.** HQ.4 constructs its framed objects; HQ.3, after HQ.4,
applies descent and proves the comparison. The JSON proposes no HQ.3 → HQ.4
edge. This respects the distinction between the constructed complex and the
later comparison, consistent with the chosen-filtration hypotheses in
[Wagner, q-Hodge v2, Corollary 3.54](https://arxiv.org/html/2510.04782v2#S3.SS8).
The other six old edges remain explicitly acknowledged. In particular, HQ.6
defines an open comparison problem; retaining HQ.6 → HQ.7 does not require a
proof of that open conjecture before the algebraic tests.

**Forwarding is complete for the actual uses.** Recomputed supplier-to-consumer
pairs for all 11 narrowed stages from current atlas requirements and stage
edges, after applying accepted restructurings. Exactly two pairs are absent:

- HQ.5-trace → HR.6: HR.6's finite-étale identification does not use the moved
  spherical-E1 existence case.
- HB.6 → QT.4: QT.4 uses HC.6's retained classical tests, not the transferred
  arithmetic comparison test.

Both omissions are justified by the consumer statements. Pure transfers do
not require a backward dependency to their former owner.

All nine external exports at seven consumer stages remain:
QT.4/HC.3/HC.4 → QM.5; HB.2 → Nahm HB.5; HB.7 → Nahm HB.9;
KU-finitereg → KU-nahmtorsion; KU-habiromodules → KU-habiromembership;
HQ.3 → RT.4:q-Hodge; HR.5-number-field-comparison → RT.4:Habiro-comparison.
Their retained hypotheses include separate analytic radial-limit proofs,
good-order regulator restrictions and the stronger trace localization.

**Absent draft suppliers no longer erase existing targets.** QWittVectors,
SolidAnalyticRings and AnalyticHabiroStack still have no stages in this atlas.
The five interim-holder clauses preserve the transferred material. HQ.2's
additional Nygaard application explicitly waits for QW.7; it does not import
backward from HQ.4. Installing QW/SA alongside this proposal remains preferable.
These clauses describe blueprint ownership; they do not make missing APIs
available in Lean or automatically install the new roadmaps.

## Validation

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-10.result.json`: **ok**.
- Exact member-stage coverage: **38**, comprising **27 keep / 11 narrow**;
  **18** ownership records and **133** distinct link pairs.
- Called `apply_restructurings` on `data/atlas.json` with
  `load_accepted(Path('.'))` first, then this proposal: **72** new links,
  **43** skipped because endpoints are absent, **zero** skipped for cycles.
  The skipped set is 38 QW-source links, three SA-source links, HS.3 → HQ.6,
  and HC.4 → QW.2.
- Repeated on an in-memory snapshot augmented by all **27** stage definitions
  and requirements of the five PLAN-HABIRO roadmaps: **114** new links,
  **zero** skipped. The staged HC.4 → QW.2 requirement already supplies that
  edge, explaining why 72 + 43 is not the second new-edge count.
- Topologically sorted the union of existing stage edges, resolvable `requires`
  and applied links using Python `graphlib.TopologicalSorter`: **1,472 nodes /
  6,270 edges** currently, **1,499 nodes / 6,404 edges** with the staged
  definitions; both acyclic. These counts include the current accepted
  restructuring set, not the earlier proposal's historical snapshot.
- Asserted every original resolvable prerequisite survives and no stage is
  hidden. Checked title, description, owner and requirements of all **656**
  upstream stages remain identical. The upstream Kummer supplier gains a
  downstream consumer backlink, which does not change its curriculum.
- `git diff --check`: passed. JSON parses. No atlas, campaign document,
  draft roadmap or script was changed.

No Lean file is a deliverable and no Lean code changed; Lean was not compiled.
`check_blueprint.py` validates declaration packets, not this restructuring.

## Orchestrator handoff

No unresolved restructuring objection remains. Apply the corrected JSON with
the draft roadmaps where possible, preserving its interim clauses otherwise.
Blueprints must still discharge the existing proof gaps: the full-coefficient
Taylor comparison repair, the generic Koszul interface, source decomposition
of quantum topology, and the analytic comparison's open status. The staged
QW.0 acceptance typo already flagged in RS-10's report also remains a separate
roadmap correction; accepting this proposal does not certify that example.
