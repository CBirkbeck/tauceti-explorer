# BP-PrismaticCohomology~2 — complete revision for independent review

Issue [#10119](https://github.com/CBirkbeck/tauceti-explorer/issues/10119). Worker: Claude (Opus 5.5), session `claude-dJntse`, 2026-10-17. The claim comment 6234513664 was confirmed by the bot. Branch `claude-dJntse-prismatic-revision`. I wrote neither part packet, neither part review, the 2026-10-13 review, nor any of the six earlier checkpoints of this job.

This is the **complete revision**, not a checkpoint. It goes to REV-PrismaticCohomology~2 (issue #10118).

## The assembly blocker, resolved without re-serializing

The six earlier checkpoints stopped on one point. The 2026-10-13 review asked for an effective whole-roadmap graph. Copying the 369 accepted targets into this packet gives 361 "also appears in" errors in `scripts/check_blueprint.py`, and the part packets are not deliverables of this job.

No copy is needed. `scripts/blueprints.py` (`merge_blueprints`) builds a roadmap from the nodes of **every** promoted packet of that roadmap. That is how every multi-part roadmap in the atlas is assembled: AnalyticNumberTheory, DiamondEtaleCohomology, CompletedCohomologyPartII and PadicHodgeTheory all have a whole-roadmap packet with `imports` beside accepted parts. The effective roadmap is therefore the union of three packets with disjoint node ids:

- PrismaticCohomology--PR.0, layers PR.0–PR.7: 290 targets, 48 planets, accepted, promoted 2026-10-09;
- PrismaticCohomology--PR.8: 79 targets, 6 planets, accepted 2026-10-10;
- this packet: 12 targets, no planets.

**Dry assembly.** I patched `blueprints.load_promoted` in a scratch script and ran `build.assemble(require_distances=False)` with the three packets, writing nothing. The build passes. The roadmap has 381 declarations (PR.0 93, PR.1 27, PR.2 30, PR.3 26, PR.4 33, PR.5 35, PR.6 30, PR.7 28, PR.8 79), 54 planets and no skipped links; the atlas has 5,709 stages and 15,143 stage edges.

**PR.8 promotion.** The PR.8 part is absent from `data/blueprints` only because no promotion has run since 2026-10-09. `promote.py --dry-run` lists 272 accepted files waiting, PR.8 among them, and `decide()` returns "promote" for it. That is a maintainer action, not a defect of this roadmap.

The gap "Executable whole-roadmap assembly" is removed, and `imports` now records this mechanism.

## Routed prerequisite edits (restructure R1–R7)

The review asked that only justified R1–R7 changes be applied to the actual node prerequisites. Every consumer belongs to a part packet, so this job cannot make the edits. Instead I checked each one against the consumer's statement and proof and against the supplier's statement. Each record now has a per-node `map` with `remove`, `replaceBy` and `verdict`, an `applicationStatus` and a `routedTo` file. The reader shows each edit as a **Routed prerequisite edit** paragraph at the consumer, 52 in all.

- **R1 (LP1 → PR.5; 10 nodes).**
  - Six nodes use LP1 only for stack formalism, which they already cite from DiamondsAndVStacks D0 and SchemeAndStackFoundations SF.1: `generalized-cartier-divisor`, `cartier-witt-stack`, `wcart-quotient-presentation`, `prism-point-of-wcart`, `wcart-fibre-products-of-prisms` and `hodge-tate-divisor`. They drop LP1 and add nothing.
  - Four nodes move to the new PR.5 nodes: `quasi-coherent-complexes-on-wcart`, `prismatic-crystals-on-wcart`, `sen-operator` and `sen-operator-classification`.
  - Two scope notes are recorded. In `quasi-coherent-complexes-on-wcart`, base change and the projection formula for ρ_A* are supplied only when ρ_A is flat, that is for transversal A. In `prismatic-crystals-on-wcart`, the form indexed by all bounded prisms depends on the open general case of the formal-QCoh comparison. Both are now in the gap "Formal affine quasi-coherent complexes".
- **R2 (QW.6 → PR.6; 4 nodes).**
  - `q-de-rham-prismatic-comparison-zp` is verified: its finite framing is (p,q−1)-adically noetherian.
  - `framed-q-pd-datum` and `gamma-extension-to-q-pd-envelope` are verified through the new theorem below.
  - `framed-q-de-rham-complex` stays conditional, because decay on the q-PD envelope is still needed when the framing is infinite.
- **R3, R4.** One consumer each: `tate-twist-analytic-continuation` and `weakly-admissible-extension-over-ainf`. Both are verified. The named inputs keep their proof gaps.
- **R6 (PR.8's 39 bare stage citations, 41 rows).**
  - 35 rows are verified as listed. Row 23 carries a note on the two sites' topologies, and the verdicts of rows 1 and 2 record that the consumer already cites one more PR.0 node its proof uses.
  - Three rows are conditional or probable:
    - row 20: the PR.1 relative-Frobenius lemma is stated for polynomial algebras, while the consumer needs Laurent polynomial algebras;
    - row 25: the log operators are the consumer's own, and its decay must be checked for an infinite S;
    - row 38: perfectness for proper log schemes comes from the consumer.
  - Row 27 drops a redundant citation. The ordinary QRSP input of `DD.6/log-quasiregular-semiperfectoid` is PerfectoidQuotients Q0, so there is nothing to replace.
  - Rows 37 and 40 were already resolved.
- **R5, R7 (stage edges, for the maintainer).** The edges T6:log-sites → PR.8, RT.3b → PR.7 and RT.6 → PR.7 are present in `data/atlas.json`; the six intra-roadmap edges of R7 are absent. With R3 and R5 removed and R7 added, the 3,511 stage edges of `data/atlas.json` form an acyclic graph.
- **Simulation.** Applying R1–R4 and R6 to a copy of the 381 nodes gives an acyclic graph. It has no citation of LanglandsParameterStacks, QWittVectors, RefinedTraceMethods or VectorBundlesAndIsocrystals, and no bare stage citation in PR.8.

**Notion moves (WORKERS.md, "Upstream tiers").** These moves, carried over from the first whole-roadmap pass, are confirmed:

- D(X) on prestacks, flat descent, flat affine direct image and the formal-affine comparison move from LanglandsParameterStacks LP1 to PR.5. LP1 and LP4 import them.
- The framed q-de Rham machinery moves from QWittVectors QW.6 to PR.6. QW.6 and HabiroCohomologyFoundations HQ.1 import it.
- The Beilinson fibre square and the Fargues–Fontaine slope-zero results become named inputs in PR.7. RefinedTraceMethods RT.3b and the owner of the curve's bundle classification prove them.

## Mathematics in this revision

**New theorem `PR.6/framed-algebras-over-flat-bases`.** It has no independent review yet. Let D be flat over A = Z_p[[q−1]] and I = (p, q−1), and let P be completely ind-étale over D[X_s : s∈S]^∧, with S arbitrary. Then:

1. P is classically complete with gr_I P = (P/IP)[p̄, t̄], and p, t, X_s and tX_s are nonzerodivisors.
2. P/pP, P/tP and P/tX_sP are classically complete. These are the sufficient hypotheses of `framed-q-automorphisms`, its δ-clause included.
3. (I^(n+1)P : tX_s) ⊆ I^nP uniformly in s.
4. γ_s(f) ≡ f mod I^(n+1)P for all but finitely many s.

So decay holds with c = 1. The proof uses complete flatness and Tor vanishing over A, initial forms in the polynomial graded ring, closedness of gP for g ∈ {p, t, tX_s}, and finite presentation of the étale pieces with étale uniqueness through a nilpotent thickening. It does not reach q-PD envelopes or log charts, which stay in the gap.

**Regular-ideal clause of `PR.5/formal-affine-complete-qcoh`.** The checkpoint's Koszul argument uses only the regular sequence, not the prism structure. I stated it for any ring and ideal generated by a finite regular sequence, with API `FormalAffineQCoh.regularIdealEquiv` and test `hodgeTateChart`. This covers the Hodge–Tate charts (A/I, (p)) of transversal prisms, which `sen-operator` needs.

**Re-derivation of the four checkpoint additions.** I re-derived the arguments of the four targets the checkpoints added and found no error:

- `general-prismatic-envelope`: the telescope criterion via Rlim of the f-tower, closure of complete subrings under the solution operations, the λ = κ^ℵ0 bound with ω_1 stages, the solution set and product, and uniqueness through preserved solution operations;
- `quasiregular-quotient-initial-prism`: its reduction to monic perfected presentations; the fat-point and non-surjective tests are consistent;
- `formal-affine-complete-qcoh`: cofinality J^(r(n−1)+1) ⊆ (f_i^n) ⊆ J^n, the Koszul fibre E_(n,k) in degrees [−r,−1], the zero transition for lag ≥ k, the ghost-map composite of r steps, and Rlim of a pro-zero tower;
- `completed-q-derivative-summability`: the infinite-series, square-zero and common-Y tests check out.

**Sources.** No source was re-read in this run, and no library file was opened. The locators of these four targets are as their checkpoints recorded them, and the reviewer should read them. The new theorem cites only BS22 Construction 16.19 for its setting, and says that its arguments are this plan's own.

## What remains

1. **REV-PrismaticCohomology~2.** Review the twelve targets: the five without review are the four checkpoint additions and the new theorem. Review also the routed verdicts and the dry-assembly claim.
2. **Apply the routed edits** in the part packets, through a fix or revision job that owns `PrismaticCohomology--PR.0.json` (R1–R4) and `PrismaticCohomology--PR.8.json` (R6). The `map` rows are mechanical. Rows 20, 25 and 38 of R6 and the `framed-q-de-rham-complex` row of R2 carry their conditions; drop the part requests to LP1, QW.6, RT.3b, RT.6 and VB2 at the same time.
3. **Maintainer.**
   - Run promotion: the PR.8 part waits with 271 other accepted files.
   - Apply the stage-edge changes of R3, R5 and R7.
   - Decide whether the named inputs of PR.7 (trace-theoretic Beilinson square, FF classification and GAGA) stay named inputs for upstream.
4. **Open gaps** (5): Trace-theoretic proof of the Beilinson fibre square; Classification of vector bundles on the Fargues–Fontaine curve; Formal affine quasi-coherent complexes (nontransversal bounded prisms); Complete framed and infinite-coordinate q interfaces (decay on q-PD envelopes and log charts); Beilinson syntomic and derived de Rham interface.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology.json` with the declaration index at the pins (Mathlib 082e2d3, Tau Ceti f790474) gives **0 errors, 0 warnings**. The packet has 12 nodes (6 constructions, 6 theorems), 61 API entries and 43 tests, 9 baseline declarations, 5 gaps and 7 requests.
- `lean-check research/blueprint/suggested/PrismaticCohomology.lean` exits 0. Its only warnings are 26 uses of `sorry`, and there are no errors; 89 GB of memory was available. The file has 375 lines. Only its closing comment changed, to name the reader-only targets. `scripts/check_sorry_data.py` passes.
- `research/blueprint/intake.py check-files` on the four deliverables reports 0 problems, and `git diff --check` is clean.
- Every internal link of the reader resolves. This includes seven appendix links to the layer anchors that were broken before this revision and are now repaired.
- The 2026-10-13 review object is preserved unchanged, and `revisionCheckpoint` is replaced by a `revision` record.

The scratch tools are deleted with the scratch directory: the dry-assembly patch, the route simulation and the edit scripts. Everything they established is recorded above and in the packet's `revision` record.
