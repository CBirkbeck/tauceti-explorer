# FIX-RT-AREA-ktheory-1 — checkpoint

Agent: Codex. Session: `codex-5ebb6f`. Date: 2026-09-29. Issue: [#3979](https://github.com/CBirkbeck/tauceti-explorer/issues/3979).

**Partial. The 38-finding job is not complete.** This checkpoint corrects the doubled-origin acceptance example and prepares part of the classical K-theory ownership/import/order repairs. It does not repair the entire stage graph or the remaining arithmetic and motivic findings. No mathematics is claimed formalised.

## What changed

- Finding 31: the resolution acceptance example now uses two affine planes glued along the punctured plane, with `K₀(VB(X)) = ℤ` and `G₀(X) = K₀(Perf(X)) = ℤ²`. The line fails this test: gluing units on the overlap gives `Pic(X) = ℤ`, and rank/determinant give independent classes. The packet and integrated decomposition record the precise author-copy discrepancy under `sourceIssues` and `sourceVersions`; they make no claim about the unread published edition or novelty of the correction.
- Finding 21, partially: import the pinned `ExactStructure`, `ExactK0` object-class/conflation/universal-property API, and `finiteProjectiveModules` exact structure, its split-structure theorem and its essentially-small instance. Only the Q construction and its higher-homotopy comparison are new. A needed dictionary to Quillen’s redundant cancellation axiom remains a proof obligation; its kernel/cokernel hypotheses must not be suppressed.
- Finding 19, partially: the K.1 carrier is generic in exact categories; the early K.2:plus ring node now defines the connective ring functor and its actual scalar maps, products and filtered-colimit interface independently of the plus theorem. Its API and four definition tests are updated. The arbitrary noncommutative tensor functor is explicitly missing; the commutative pinned scalar-extension declaration is not misrepresented as supplying it. K.5 imports the early ring map. Late K.7’s integrated statement imports elementary invariance rather than rebuilding it. The companion K.6/K.7 packet and stage edges still need repair.
- Finding 4, partially: both the current K.1 packet and the older integrated decomposition reparent Waldhausen additivity and relative S-fibration/delooping to K.4:construction. H.5:S-delooping consumes their maps for spectrum assembly; it no longer owns biexact K-products. Generic smash is assigned to H.5:spectra; K-products stay in K.7. The immutable snapshot stage graph is **not** repaired by these parent edits; apply the stage changes below before calling this finding fixed.
- Finding 20, partially: the reader distinguishes early exact-category K.3 from late cofinality. The packet removes the irrelevant `ExactK0.ofLE_surjective` prerequisite from the cofinality theorem and imports the actual late Waldhausen fibration instead. A proposed K.3:cofinality parent is recorded, without inventing a currently nonexistent stage.
- Finding 15, request only: the current packet asks H.2 for the precise realization-fibration theorem and the hypotheses needed in the relative S application. Waldhausen 1978 Lemma 5.2 is a source lead, not a theorem read or proved by this checkpoint.
- Additional correction discovered while following the early ring interface: KSpace is `ΩBQ`, and `K_n = π_n KSpace = π_(n+1) BQ`. The earlier source transcription omitted Ω. The connected BQ versus generally disconnected KSpace is now an explicit negative test.
- The companion reader is rendered from the revised packet, including its hypotheses, API, uses, tests and gaps. The suggested Lean file replaces the old `True`/`Unit` substitutes with explicit typed signature comments for genuinely missing objects and three examples of existing declarations. It is not an implementation of the higher K theory.

The research packet’s earlier independent verdict is preserved in `reviewHistory`; its current review is pending. The two older integrated files retain their **unmodified historical review objects** because the atlas loader requires them, and explicitly mark this revision as awaiting independent review. Those old verdicts must not be treated as a review of this patch. The promoted `data/blueprints` copies have not been rewritten or self-reviewed; they continue to carry their earlier accepted text until a new independent review and promotion.

## Required stage changes

Apply these through the maintainer’s graph integration, then check both stage and node dependencies together. A pending proposal is not an applied repair.

1. Early K.4:construction owns its Waldhausen/S-category data, additivity, relative S-fibration and natural iterated delooping maps. Its classical construction imports H.1/H.2, without importing EDS E5:abstract or H.5:spectra. Preserve enhanced-category prerequisites on the later enhanced results.
2. H.5:S-delooping imports K.4:construction and H.5:spectra and assembles the connective spectrum. Late K.4 imports that prefix/assembly and retains its localization, approximation and comparison theorems.
3. Early K.3 additivity, resolution, dévissage and abelian localization depend on K.1 and H.1/H.2. Introduce K.3:cofinality after late K.4; move the cofinality theorem there while preserving its stable node id.
4. Retain K.4 → K.5 for the relative/support Waldhausen results; add K.2:plus → K.5 and the projective-model interface from Z.1 where required. K.6/K.7 must import the early ring functor, rather than define it after consumers need it.
5. Generic smash products belong to H.5:spectra; K-theory-specific biexact pairings and their coherence belong to K.7. Check that no product requirement returns from K.7 into spectrum assembly.

## Finding ledger

“Partial” below means the exact change above is committed, with obligations remaining. “Not fixed” means no repair is claimed. The verified recommendations, including their corrections to the initial red-team proposal, remain binding.

| Finding | Status | Resume contract |
| --- | --- | --- |
| 1 | Not fixed | R.1 owns building, Solomon–Tits, Steinberg coefficients and **integral** arithmetic finiteness. Use the GL dualizer `St ⊗ ℤχ^(n−1)`, χ = norm of determinant, or prove descent from a torsion-free subgroup in ker χ. N.3 retains Q-rank filtration, nonfree projectives, low ranks and finite-S assembly. |
| 2 | Not fixed | M.5 needs the actual truncated Beilinson–Lichtenbaum comparison, topology/naturality and the smooth-scheme passage; treat the arithmetic Dedekind-base reduction separately before M.6/M.7. |
| 3 | Not fixed | Extend the shared RT.4:topological owner with KO/BO, real Bott periodicity and realification/complexification. M.7 imports Suslin’s positive-degree comparison and handles degree zero separately; N.5 imports the dyadic output. |
| 4 | Partial | Parent/owner changes are prepared. Apply the stage graph, check product ownership and complete the relative-realization supplier. |
| 5 | Not fixed | H.3 needs H-space simplicity, the simple-CW homology Whitehead theorem and its scoped obstruction argument, with actual π₁ actions. Add H.3 → H.4. Coordinate rational Hurewicz with finding 33’s H.6 owner. |
| 6 | Not fixed | R.5 needs the inner-form division algebra, compactness, strong approximation, normalized Tamagawa number/local volumes and Brauer imports. Read Borel 1977; Borel 1974 is the rank source. |
| 7 | Not fixed | R.3 owns number-ring ranks. N.3:ranks imports them and uses localization/L.1 for finite-S extension, respecting n ≥ 2 and degree-one exceptions; no even finiteness claim for the field itself. |
| 8 | Not fixed | M.3 owns the general-field symbol and arithmetic Tate/Chern theorem. T.7 imports them for Hilbert/invariant/reciprocity compatibility; retain that compatibility rather than delete all Chern language. |
| 9 | Not fixed | T.5 owns the tame-kernel degree-two row and elementary K₂ examples. N.6 alone owns the certificate engine; N.2/N.8 import the row/examples, and N.8 imports U.6/Z.6. Remove T.5’s competing certificate proof. |
| 10 | Not fixed | B.1 imports N.4’s W₂ and N.3:ranks’ K₂ finiteness. W₂ is invariants of ℚ/ℤ(2), not ordinary roots of unity. |
| 11 | Not fixed | N.8’s real-quadratic certificate feeds B.3; the Birch–Tate check cannot supply its independent order bound. |
| 12 | Not fixed | T.4 exports all-degree norms and Suslin norm/residue reciprocity to M.4. Cover regular proper normalizations and inseparable residue norms; do not identify regularity with smoothness over imperfect fields. |
| 13 | Not fixed | Separate early mod-p differential symbol/BGK from the invertible-prime motivic engine; import classical Cartier and appropriate CR.4 Witt APIs, including arbitrary imperfect fields. Separate mod-p and prime-power proofs. |
| 14 | Not fixed | Import upstream ProfiniteCohomology Layer 9 Kummer and Layer 12 cup products. Isolate an early general-field symbol with tensor Tate twists and Steinberg descent, consumed by M.3 and M.5c. |
| 15 | Request only | Establish the precise realization theorem, its model hypotheses and the actual homotopy-fibre comparison, then check the relative S application. |
| 16 | Not fixed | H.5:spectra owns Eilenberg–MacLane spectra of complexes, π_n(HC)=H_n(C), HR modules/monoidal structure and the required representability/truncation maps. |
| 17 | Not fixed | K.6’s Bass route needs early ring projective-line gluing and Nil terms; scheme agreement/projective-bundle clauses belong to S.2/S.5. Remove the S.5 → K.6 cycle. |
| 18 | Not fixed | K.5 owns Milnor-square projective patching and the low-degree boundary; K.6 owns Bass contracted negative continuation, with the correct degree range. Do not assert unrestricted higher excision. |
| 19 | Partial | Early ring definition/imports corrected. Repair companion K.6/K.7 imports and remaining elementary duplication, implement the arbitrary-ring tensor interface, and apply the stage edges. |
| 20 | Partial | Apply the early K.3 / late K.3:cofinality split and exact prerequisite closures, explicitly preserving K.4 → K.5. |
| 21 | Partial | Existing carriers and class-map API are imported. Complete any needed exact-axiom dictionary with kernel/cokernel existence, and review the universe/small-model transport; higher π₁ comparison remains a planned theorem. |
| 22 | Not fixed | Import pinned nerve/realization/local-coefficient carriers and the existing AlgebraicTopology twisted-chain/Serre/Whitehead owners. Only residual scope belongs in a gap; pending RS-33 is not an applied supplier. |
| 23 | Not fixed | H.6 supplies generic filtered exact couples/convergence to S.4; S.4 supplies its geometric filtration and checks convergence hypotheses. |
| 24 | Not fixed | The newer U.1 packet already has U.4/s-unit-theorem. Inspect its exact rank/valuation/class-group proof and connect existing consumers; do not add another theorem or call an unmerged proposal baseline. |
| 25 | Not fixed | U.4’s Bass–Milnor–Serre proof needs the actual ray-class prime selection, Chebotarev and power-reciprocity normalizations in its number-field scope. |
| 26 | Not fixed | T.5 imports T.3’s degree-two localization-boundary identification and U.4 SK₁ vanishing. For O_S → F sum residues **outside** S; the relative O → O_S row uses primes **inside** S. |
| 27 | Not fixed | Preserve already promoted CFT5/CFT10 interfaces. Add the missing higher/quadratic/Hilbert-Brauer compatibility imports while retaining the M.3 symbol/Chern comparison. Do not add a reverse L.3 → T.7 dependency. |
| 28 | Not fixed | T.4 exports early simple-extension norm/residue identities before transitivity to T.3’s localization comparison; Quillen transfer compatibility is the consumer’s work. |
| 29 | Not fixed | T.1:classical owns the Steinberg universal-central-extension theorem; V.1 imports its superperfect consequence and retains its plus/Hurewicz/bar comparison. |
| 30 | Not fixed | Supply perfect-group universal central extensions, Hopf formula/recognition and naturality before the plus π₂ comparison. These are algebraic constructions, not a pinned library claim. |
| 31 | Corrected in submitted source artifacts | The acceptance example and precise source discrepancy are corrected. New independent review/promotion and maintainer handling are still required; no live-atlas repair is claimed. |
| 32 | Not fixed | Preserve the already supplied AlgebraicCurves L12 interface. Add only the EllipticCurves L2 compatibility with disjoint divisors, norms and tame-symbol signs; retain the all-degree theorem in T.4. |
| 33 | Not fixed | H.6 is the Cartan–Serre/Milnor–Moore rational Hurewicz owner, with connected CW/H-space, associativity and finite-type hypotheses. R.3 imports it and the compact-dual/Serre comparison. |
| 34 | Not fixed | S.6’s higher Adams operations and the shared topological Adams/change-of-topology API feed R.4’s weight calculation. |
| 35 | Not fixed | Supply the early characteristic-zero Betti/de Rham/Lie comparison from ALS to R.2 before the late automorphic stage; fix normalization constants without duplicating the comparison. |
| 36 | Not fixed | R.7 imports the all-weight Burgos comparison for p ≥ 2 and the determinant factor 2^d. Bloch–Wigner is a weight-two test, not a proof for all weights. |
| 37 | Not fixed | L.1 needs the chosen-root Brauer lift, real topological Adams/Atiyah–Segal completion and the actual fibre of 1−ψ^q. Check simple-space hypotheses in the homology-to-homotopy step. |
| 39 | Not fixed | General logarithmic de Rham–Witt belongs to CR.4/CR.5 before L.5/CR.6. Distinguish the pre-log/sheaf/Hyodo–Kato comparisons and preserve the odd-p ℤ_(p) source scope. |

Finding 38 was rejected by the verifier: preserve the existing CFT5 → T.7 → L.3 and CFT5 → D.7 → M.7 → L.6 routes. Low findings 40–49 are outside this issue’s listed high/medium batch; this checkpoint makes no claim to have addressed them.

## Fresh evidence and checks

Fresh source reading on 2026-09-29: Weibel author chapter II pp.77,100; IV pp.54–56,69; V pp.2–4,8,22. The packet records public URLs and SHA-256 values. Its earlier read-section records remain attributable to earlier workers. The author’s errata PDF link returned 404 on both host variants; no correction was located, and the published version was not obtained.

At the pinned Tau Ceti commit, read ExactStructure.lean’s self-dual E0/E1/E2 fields, GrothendieckGroup/Exact.lean’s `ExactK0`, `of`, `of_conflation`, `lift`/`liftEquiv`, and CartanMap.lean’s finite-projective property, essentially-small instance, exact structure, split theorem and conflation characterization. No new library checkout, Lake project, cache, build or language server was started.

Validation:

- `scripts/check_blueprint.py` on GeneralAlgebraicKTheory--K.1 and --K.6 with the shared pinned declaration index: zero errors and zero warnings. K.6 was checked as an unchanged companion; its remaining mathematical fixes are not implied by this result.
- `source_issues.check_issues` and `check_errata.versions_checked` on both source-issue-bearing files: no errors.
- `scripts.build.assemble()` without writing outputs: atlas assembly succeeded, 2,840 stages and 7,792 edges. This checks loader compatibility, not repair of the outstanding stage graph or promotion of the revised research packet.
- JSON parsing and `git diff --check` are required again before submission.
- Suggested Lean was **not compiled**: no existing build at both pinned commits was identified. Signature comments are not elaborated proofs.

## Submission and resume

The issue authorizes roadmap documents, integrated decompositions and target packet corrections, but `intake.py` accepts only flat research deliverable paths and `own_files` lists only this job’s eventual fixes report plus handoff. These actual corrections therefore require maintainer handling. Do not change the checker, queue or workflow to bypass that mismatch.

The partial fixes report is here, **not** in `redteam/RT-AREA-ktheory-1.fixes.md`: `issues.deliverables_complete` currently treats any present fixes report as complete without inspecting a partial status. Creating that output now would wrongly finish the remaining findings after merge. On resuming, retain this ledger; create the final fixes report only when every confirmed finding is addressed, or once the maintainer gives the intake an explicit fix-checkpoint completion contract.

Start with the graph integration and owner review of findings 4/19/20/21, and the high-priority arithmetic/motivic source work in findings 1/2/3/5/6. Read the current packets first: several have advanced substantially since the red-team pass. Keep the verifier’s essential scope corrections, and never replace independent certificates or integral arithmetic finiteness by rational ranks or Birch–Tate predictions.

Scratch source PDFs and extracted texts can be re-fetched from the packet’s public URLs and hashes; no local scratch path is needed for handoff. The worker deletes its job scratch after opening the pull request.
