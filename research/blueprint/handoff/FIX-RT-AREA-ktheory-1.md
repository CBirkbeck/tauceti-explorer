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

## Appendix: edits to the atlas's base files, kept as a patch

This checkpoint first also edited four base files, which a fix job may not change: `content/campaign/GeneralAlgebraicKTheory/README.md`, `content/campaign/StableHomotopyKTheory/README.md`, `data/decompositions/GeneralAlgebraicKTheory.json` and `data/decompositions/StableHomotopyKTheory.json` (PROTOCOL.md section 17: a fix to a roadmap's plan goes into its blueprint). The orchestrator restored those files and kept the worker's edits below, unchanged, as a record for the next worker:

- GeneralAlgebraicKTheory: carry any correction below that the `GeneralAlgebraicKTheory--K.1` packet, reader and suggested file do not already contain into them. Those files are now this job's deliverables.
- StableHomotopyKTheory: its blueprint is not written yet, so this area's findings about it are handed to `BP-StableHomotopyKTheory`. The edits below are its starting point.

```diff
diff --git a/content/campaign/GeneralAlgebraicKTheory/README.md b/content/campaign/GeneralAlgebraicKTheory/README.md
index 7e7009b1..7aec95e0 100644
--- a/content/campaign/GeneralAlgebraicKTheory/README.md
+++ b/content/campaign/GeneralAlgebraicKTheory/README.md
@@ -25,7 +25,7 @@ Prove that `π₁ NQ(C)` is the existing `ExactK0`, preserving the class of each
 
 <a id="stage-K.2:plus"></a>
 
-**Early ring/plus model (K.2:plus).** Construct the essentially small exact category `Proj_fg(A)` from the existing module category and projectivity/finiteness predicates. Show that scalar extension along every unital ring homomorphism preserves these objects and their split exact sequences, without imposing unnecessary flatness. Construct `K(A)` functorially.
+**Early ring/plus model (K.2:plus).** Import `Proj_fg(A) = (TauCeti.finiteProjectiveModules A).FullSubcategory`, its existing essentially-small instance and `TauCeti.finiteProjectiveModulesExactStructure`. The pinned theorem `finiteProjectiveModulesExactStructure_eq_split` identifies that structure with the split one; do not rebuild these carriers. Show that scalar extension along every unital ring homomorphism preserves these objects and their split exact sequences, without imposing unnecessary flatness. Construct the early connective functor `K(A) = ΩBQ(Proj_fg(A))`, with identity/composition for ring maps, finite-product compatibility and filtered-colimit compatibility via finite idempotent matrices. This applies to unital associative rings. The pinned commutative scalar-extension API does not supply the arbitrary noncommutative bimodule tensor functor; that remains an explicit interface obligation before its use.
 
 Compare the loop space of `Q(Proj_fg(A))` with direct-sum group completion of the maximal subgroupoid, identify its components with K₀(A), and identify its zero component naturally with `BGL(A)⁺`. After choosing component representatives obtain the space-level product description `K₀(A) × BGL(A)⁺`, without claiming a natural product splitting of infinite-loop spaces. Prove the cofinality statement that every finitely generated projective has a projective complement making it free. This is why the stable free-module group detects the higher groups even when projectives are not free.
 
@@ -39,21 +39,21 @@ Prove additivity for the exact category of conflations: the source-and-quotient
 
 Prove dévissage for an appropriate full abelian subcategory closed under subobjects and quotients, with a finite filtration of every object by objects of the subcategory. Prove the resolution theorem for a full exact resolving subcategory, with closure and finite-resolution hypotheses stated. Construct the alternating-resolution inverse in degree zero and compare it to the existing K₀ resolution theorem.
 
-Prove Quillen localisation for a Serre subcategory of a small abelian category and its quotient. Do not assert localisation for arbitrary exact subcategories without the additional hypotheses needed by the chosen exact-category localisation theorem. Supply cofinality with the correct degree-zero correction: idempotent completion may change K₀ even when positive K-groups agree.
+Prove Quillen localisation for a Serre subcategory of a small abelian category and its quotient. Do not assert localisation for arbitrary exact subcategories without the additional hypotheses needed by the chosen exact-category localisation theorem. The general cofinality proof uses the later Waldhausen fibration theorem. Place it in the late `K.3:cofinality` extension after K.4, preserving the correct degree-zero correction: idempotent completion may change K₀ even when positive K-groups agree. Early K.3 additivity, resolution, dévissage and abelian localisation use K.1 and H.1/H.2, without importing all of K.4. The stage split still requires maintainer integration.
 
 ## K.4 — Waldhausen's S-construction
 
 <a id="stage-K.4:construction"></a>
 
-**Early S-construction (K.4:construction).** Define a Waldhausen category with zero object, cofibrations, weak equivalences, the required pushouts and gluing axiom. Define exact functors preserving this data. Construct the categories `S_n C` of filtered objects with specified quotient squares and the simplicial identities. Define their weak-equivalence subcategories and iterate S to form the spectrum.
+**Early S-construction (K.4:construction).** Define a Waldhausen category with zero object, cofibrations, weak equivalences, the required pushouts and gluing axiom. Define exact functors preserving this data. Construct the categories `S_n C` of filtered objects with specified quotient squares and the simplicial identities. Define their weak-equivalence subcategories. In this early prefix prove Waldhausen additivity, construct the relative S-construction and prove its homotopy fibration; then derive the natural iterated delooping maps. Check the precise H.2 realization-fibration hypotheses, which remain an explicit source/proof obligation. H.5:S-delooping consumes those maps and assembles the connective spectrum. Generic smash products belong to H.5:spectra, and K-theory pairings to K.7. The early prefix needs H.1/H.2, independently of EDS E5:abstract and spectrum assembly.
 
-Prove additivity and the delooping theorem. Prove the fibration theorem with cylinder, saturation and extension assumptions as required by the adopted version. Prove approximation and the comparison with the Q-construction for exact categories. Spell out the induced cofibrations on diagram categories; objectwise cofibrations alone do not automatically give every required pushout condition.
+**Late comparison and localisation (K.4).** Import that prefix and the assembled spectrum. Prove the fibration theorem with cylinder, saturation and extension assumptions as required by the adopted version. Prove approximation and the comparison with the Q-construction for exact categories. Spell out the induced cofibrations on diagram categories; objectwise cofibrations alone do not automatically give every required pushout condition.
 
 For bounded complexes of projectives, use quasi-isomorphisms and the appropriate degreewise split cofibrations. Prove the Gillet–Waldhausen comparison with `Proj_fg(A)`. Do not confuse quasi-isomorphism and arbitrary chain homotopy equivalence in categories where they differ.
 
 ## K.5 — Relative and nonunital theories
 
-For a ring map or exact functor define relative K-theory as the homotopy fibre, with the actual map to the source theory and connecting homomorphisms. Treat a pair `(A,I)` by the map `A → A/I`; distinguish this from support K-theory for a localisation `A → S⁻¹A`.
+Import the actual early K.2:plus ring functor and maps (including the projective carrier from Z.1), and the relative S-fibration from K.4:construction and late K.4 comparison when required. For a ring map or exact functor define relative K-theory as the homotopy fibre, with the actual map to the source theory and connecting homomorphisms. Treat a pair `(A,I)` by the map `A → A/I`; distinguish this from support K-theory for a localisation `A → S⁻¹A`.
 
 For a nonunital ring use a specified unitisation and the corresponding relative theory. Prove the comparison with the usual unital theory. Ordinary algebraic K-theory does not satisfy unrestricted excision for every ideal: prove excision under the hypotheses of the adopted theorem and provide a counterexample or explanatory test preventing an unconditional instance.
 
@@ -65,10 +65,14 @@ Identify negative groups of rings with Bass's construction. Prove localisation i
 
 ## K.7 — Invariance, products and universal interfaces
 
-Prove Morita invariance, finite-product compatibility, filtered-colimit compatibility for rings, and equivalence invariance at the enhanced categorical level. Derived Morita invariance uses enhanced perfect categories, not a naked triangulated equivalence.
+Apply the early exact-equivalence interface to Morita bimodules, and import finite-product and filtered-colimit compatibility through the early projective-category functor. Extend these interfaces to the nonconnective and enhanced models, with comparison to the early maps. Derived Morita invariance uses enhanced perfect categories, not a naked triangulated equivalence.
 
 Construct external products from biexact functors and their associativity, unit and symmetry homotopies. For commutative rings obtain graded-commutative K-groups. Prove compatibility with relative groups, localisation boundaries and transfers. Export the comparison with tensor products on K₀ and multiplication of units on K₁.
 
+## Resolution acceptance example
+
+Use the affine **plane** with doubled origin: glue two copies of `Spec(k[x,y])` along the punctured plane. The intended example has `K₀(VB(X)) ≅ ℤ` and `G₀(X) ≅ K₀(Perf(X)) ≅ ℤ²` (Weibel II.8.2.4 and II.Ex.9.10(d)). The author-copy wording in V.3.4.2 says line; the packet records that discrepancy with its exact source version. On the doubled-origin line, transition functions `t^m` give `Pic(X) ≅ ℤ`, so determinant already rules out the claimed rank-only K₀.
+
 ## Tests and completion
 
 The zero exact category has contractible K-theory. Exact equivalences induce K-equivalences. `K(M_r(A)) ≃ K(A)` is induced by the explicit Morita equivalence. Split-exact and nonsplit-exact structures are not silently identified. Finite direct products of rings produce product spectra. The first four homotopy groups compare with Z, U, T and V on the same functorial ring carrier.
@@ -113,7 +117,7 @@ These additions refine the existing stage IDs. They are construction and review
 | Stage | Ordered construction and theorem contract |
 | --- | --- |
 | `K.1` | Build the equivalence relation on admissible spans and the pullback-composition congruence first; then compare the zero-component loops with the existing ExactK0 class map. |
-| `K.4:construction` | Specify the weak-equivalence and cofibration structures on every S_n category and prove their compatibility with face maps. Separate the construction from the additivity and delooping proofs. |
+| `K.4:construction` | Specify the weak-equivalence and cofibration structures on every S_n category and prove their compatibility with face maps. Prove additivity and the relative S-fibration here before the iterated delooping maps; H.5:S-delooping subsequently assembles the spectrum. The realization-fibration criterion remains an H.2 proof obligation. |
 | `K.6` | Carry the connective-to-nonconnective transformation through suspension and idempotent completion; export an actual comparison on nonnegative groups on the stated idempotent-complete inputs. |
 
 **Producer–consumer handoff.** SchemeKTheoryOperations S.3 requires a nonconnective fibre sequence, while low-degree field calculations use the connective comparison. Neither consumer may substitute the other model without that natural transformation.
diff --git a/content/campaign/StableHomotopyKTheory/README.md b/content/campaign/StableHomotopyKTheory/README.md
index 7cdccbd3..fdfe25dc 100644
--- a/content/campaign/StableHomotopyKTheory/README.md
+++ b/content/campaign/StableHomotopyKTheory/README.md
@@ -51,11 +51,11 @@ Direct sum need not be strictly associative in the source category. Either work
 
 <a id="stage-H.5:spectra"></a>
 
-**Early spectrum foundation (H.5:spectra).** Import EDS E5:abstract only, not its later spectra-comparison return. Choose a concrete spectrum model compatible with simplicial sets. Construct suspension spectra, loop and shift, stable homotopy groups indexed by integers, stable equivalences, homotopy fibres/cofibres, and long exact sequences. Construct the stable homotopy category and enough functorial fibrant/cofibrant replacement to justify the operations used. Establish the fibre/cofibre shift relation and finite products/biproducts.
+**Early spectrum foundation (H.5:spectra).** Import EDS E5:abstract only, not its later spectra-comparison return. Choose a concrete spectrum model compatible with simplicial sets. Construct suspension spectra, loop and shift, stable homotopy groups indexed by integers, stable equivalences, homotopy fibres/cofibres, and long exact sequences. Construct the stable homotopy category and enough functorial fibrant/cofibrant replacement to justify the operations used. Establish the fibre/cofibre shift relation and finite products/biproducts. Own the generic smash product and its maps on stable homotopy groups here; the K-theory-specific biexact pairing is supplied by K.7.
 
 <a id="stage-H.5:S-delooping"></a>
 
-**Later S-construction comparison (H.5:S-delooping).** Prove that the iterated S-construction produces a connective spectrum after the required delooping theorem; it is not enough to write down a sequence of spaces. Supply smash products and the pairing on homotopy groups needed for graded K-theory products. An E∞ refinement is required where it is actually used, but no universal-property characterisation of all localising invariants is assumed as a substitute for these constructions.
+**Later S-construction comparison (H.5:S-delooping).** Import Waldhausen additivity, the relative S-construction fibration and the natural iterated delooping maps from early GeneralAlgebraicKTheory K.4:construction. Assemble those maps into the connective Ω-spectrum and compare its homotopy groups to the connective K-groups. The realization-fibration hypotheses must be supplied by H.2; an unproved sequence of spaces does not discharge that obligation. Import generic smash products from H.5:spectra and K-theory-specific pairings from K.7; do not prove either again in this assembly stage. An E∞ refinement is required where it is actually used, but no universal-property characterisation of all localising invariants is assumed as a substitute for these constructions.
 
 ### H.6 — Coefficients, completion and spectral sequences
 
diff --git a/data/decompositions/GeneralAlgebraicKTheory.json b/data/decompositions/GeneralAlgebraicKTheory.json
index 3f23ad3f..876a47d3 100644
--- a/data/decompositions/GeneralAlgebraicKTheory.json
+++ b/data/decompositions/GeneralAlgebraicKTheory.json
@@ -27,7 +27,8 @@
       "sha256": "529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607",
       "readSections": [
         "§1 group completion of monoids, pp. II.1–4, and §2 opening p. II.5 (context for K₀ and cofinality of free modules)",
-        "§9 K₀ of a Waldhausen category: Definitions 9.1 (W0–W2), 9.1.1 (W3, saturation), 9.1.2, Examples 9.1.3–9.1.5, 9.1.6–9.1.8 (biWaldhausen categories, exact functors, Waldhausen subcategories), 9.2 chain complexes with Lemma 9.2.1, Theorem 9.2.2, Lemma 9.2.4, 9.3 extension categories, pp. II.87–92"
+        "§9 K₀ of a Waldhausen category: Definitions 9.1 (W0–W2), 9.1.1 (W3, saturation), 9.1.2, Examples 9.1.3–9.1.5, 9.1.6–9.1.8 (biWaldhausen categories, exact functors, Waldhausen subcategories), 9.2 chain complexes with Lemma 9.2.1, Theorem 9.2.2, Lemma 9.2.4, 9.3 extension categories, pp. II.87–92",
+        "FIX-RT-AREA-ktheory-1: independently re-fetched, SHA-256 matched, and read II.8.2.4 p.77 and II.Ex.9.10(d) p.100 on 2026-09-29. Earlier readSections are provenance of the earlier workers."
       ]
     },
     {
@@ -43,7 +44,8 @@
         "§7 The + = Q theorem, complete, pp. IV.61–65",
         "§8 Waldhausen's wS. construction, Definitions 8.1–8.5, 8.5.1–8.5.5, 8.6–8.11 including Cofinality 8.9 with proof and Theorem 8.10 with proof, Exercises 8.1–8.15, pp. IV.66–75",
         "§10 Non-connective spectra, Definitions 10.1 and 10.4, Theorem 10.2 and Corollary 10.3 with proof, 10.4.1, 10.5–10.6, Exercises, pp. IV.79–81",
-        "Checked by independent review for acceptance items: Theorem 1.10 (Loday), p. IV.7; Examples 2.10.2, p. IV.22"
+        "Checked by independent review for acceptance items: Theorem 1.10 (Loday), p. IV.7; Examples 2.10.2, p. IV.22",
+        "FIX-RT-AREA-ktheory-1: independently re-fetched, SHA-256 matched, and read IV.6.3–6.4 pp.54–56 and IV.8.5.3–8.5.5 p.69 on 2026-09-29. Earlier readSections are provenance of the earlier workers."
       ]
     },
     {
@@ -58,7 +60,8 @@
         "§2 Waldhausen localization and Approximation, complete: Theorem 2.1 with proof, Theorem 2.2 with proof and Remark 2.2.1, Theorem 2.3 with proof, Corollary 2.3.1, Theorem 2.4 with partial proof, Proposition 2.4.1 (proof partly omitted by the author), Remark 2.4.2, Proposition 2.5 with proof, 2.5.1, 2.6.1–2.6.3, 2.7.1–2.7.4, Exercises 2.1–2.9, pp. V.12–19",
         "§3 Resolution Theorem 3.1 with proof, Proposition 3.1.1 with proof, 3.2–3.7.2, pp. V.20–24; §3 exercises p. V.33",
         "§4 Dévissage, complete, pp. V.33–35; §5 Localization Theorem 5.1 with complete proof, Corollary 5.2, Exercises 5.1–5.3, pp. V.35–38",
-        "Checked by independent review for an acceptance item: Example 6.1.2, p. V.38"
+        "Checked by independent review for an acceptance item: Example 6.1.2, p. V.38",
+        "FIX-RT-AREA-ktheory-1: independently re-fetched, SHA-256 matched, and read V.1.2–1.3 pp.2–4, V.1.7 p.8, and V.3.4.2 p.22 on 2026-09-29. Earlier readSections are provenance of the earlier workers."
       ]
     },
     {
@@ -93,10 +96,10 @@
       "parentStageId": "GeneralAlgebraicKTheory:K.1",
       "title": "Exact categories and Quillen's category QM",
       "kind": "construction",
-      "statement": "An exact category is an additive category M with a family E of short sequences M′ ↣ M ↠ M″ such that (a) E is closed under isomorphism and contains the split sequences, and in each sequence i is a kernel of j and j a cokernel of i; (b) admissible epimorphisms are closed under composition and base change by arbitrary maps, admissible monomorphisms under composition and cobase change; (c) if M → M″ has a kernel and N → M → M″ is an admissible epimorphism for some N → M, then M → M″ is an admissible epimorphism, and dually. QM has the objects of M; a morphism M → M′ is an isomorphism class (isomorphisms inducing the identity on M and M′, unique when they exist) of diagrams M ↞ N ↣ M′ with an admissible epimorphism and an admissible monomorphism, composed by fibre product. Equivalently a morphism is an admissible layer M₀ ⊂ M₁ ⊂ M′ with an isomorphism M ≅ M₁/M₀. Each morphism factors uniquely up to unique isomorphism as u = i_! j^!, every morphism of QM is a monomorphism, QM/M′ is equivalent to the ordered set of admissible layers of M′, isomorphisms of QM are those of M, and Q(M^op) ≅ QM exchanging injective and surjective arrows.",
+      "statement": "Import the existing TauCeti.ExactStructure carrier in its self-dual E0/E1/E2 presentation. QM has the objects of M; a morphism M → M′ is an isomorphism class (isomorphisms inducing the identity on M and M′, unique when they exist) of diagrams M ↞ N ↣ M′ with an admissible epimorphism and an admissible monomorphism, composed by fibre product. Equivalently a morphism is an admissible layer M₀ ⊂ M₁ ⊂ M′ with an isomorphism M ≅ M₁/M₀. Each morphism factors uniquely up to unique isomorphism as u = i_! j^!, every morphism of QM is a monomorphism, QM/M′ is equivalent to the ordered set of admissible layers of M′, isomorphisms of QM are those of M, and Q(M^op) ≅ QM exchanging injective and surjective arrows.",
       "hypotheses": [
         "The isomorphism classes of diagrams M ↞ N ↣ M′ form a set (for example M well-powered); for K-groups one uses a small exact category or an equivalent small subcategory.",
-        "Quillen's axioms (a)–(c); Keller's axioms Ex0–Ex2^op are equivalent to them (Schlichting 3.1, citing Keller 1990, not read)."
+        "Import TauCeti.ExactStructure on a preadditive category with a zero object and binary biproducts. Its ConflationClass supplies kernel–cokernel pairs, and its E0/E1/E2 fields and their duals supply exactly the composition and base/cobase-change axioms used by Q. A dictionary to Quillen’s redundant cancellation axiom is a separate proof obligation if that axiom is invoked; it is not an extra exact-structure carrier."
       ],
       "proofSteps": [
         "Composition of M ↞ N ↣ M′ and M′ ↞ N′ ↣ M″ uses the fibre product N ×_{M′} N′, whose projection to N is an admissible epimorphism by base change and whose map to N′ is an admissible monomorphism (Quillen §2; Weibel IV Definition 6.1).",
@@ -108,7 +111,7 @@
       "acceptance": [
         "Morphisms from 0 to M in QM correspond to admissible subobjects of M (Weibel IV 6.1.2).",
         "For split exact structures on an additive category the admissible epimorphisms are split surjections; do not identify split and nonsplit structures (roadmap test).",
-        "Check the pinned Tau Ceti `ExactStructure` fields against (a)–(c) before using it as the carrier (unchecked)."
+        "Use the pinned ExactStructure fields and ConflationClass kernel–cokernel data directly; do not define another exact-structure carrier."
       ],
       "sources": [
         {
@@ -124,7 +127,10 @@
           "match": "Composition by fibre product, as in the node statement."
         }
       ],
-      "implementationStatus": "unchecked"
+      "implementationStatus": "unchecked",
+      "prerequisites": [
+        "tauceti:TauCeti.ExactStructure"
+      ]
     },
     {
       "id": "GeneralAlgebraicKTheory:K.1/Q-construction-universal-property",
@@ -158,7 +164,7 @@
       "parentStageId": "GeneralAlgebraicKTheory:K.1",
       "title": "π₁(BQM, 0) is the Grothendieck group K₀M",
       "kind": "theorem",
-      "statement": "For a small exact category M with chosen zero object 0, π₁(BQM, 0) is canonically isomorphic to K₀M, the abelian group generated by classes [M] with [M] = [M′] + [M″] for every exact sequence. Under the isomorphism the class [A] is represented by Weibel's based loop 0 ↣ A ↠ 0 (6.2.1), composed of the two edges from 0 to A given by the admissible monomorphism 0 ↣ A and by the admissible epimorphism A ↠ 0 (the QM-morphism 0 ↞ A), the second traversed backwards, and a morphism A ↞ B₂ ↣ B of QM corresponds to the class of the kernel of B₂ ↠ A.",
+      "statement": "For a small exact category M with chosen zero object 0, π₁(BQM, 0) is canonically isomorphic to the existing TauCeti.ExactK0 E with its existing object-class map and conflation relations. Under the isomorphism the class [A] is represented by Weibel's based loop 0 ↣ A ↠ 0 (6.2.1), composed of the two edges from 0 to A given by the admissible monomorphism 0 ↣ A and by the admissible epimorphism A ↠ 0 (the QM-morphism 0 ↞ A), the second traversed backwards, and a morphism A ↞ B₂ ↣ B of QM corresponds to the class of the kernel of B₂ ↠ A.",
       "hypotheses": [
         "M small exact category, 0 a chosen zero object.",
         "Orientation conventions of the loop must be fixed once; Weibel's representative (6.2.1) is 0 ↣ A ↠ 0, the edge 0 ↣ A followed by the edge 0 ↞ A traversed backwards."
@@ -174,7 +180,7 @@
         "The inverse map K₀M → π₁ is defined by the universal property of K₀ (not by comparing cardinalities), matching the roadmap contract.",
         "K₀M could equally be defined as the possibly nonabelian group on the same generators and relations; the relations force commutativity (Quillen's remark in the proof).",
         "Compatibility with + = Q: the isomorphism identifies [A] with the class of A in K₀(S⁻¹S) (Weibel IV Exercise 7.8).",
-        "Compare with the pinned Tau Ceti `ExactK0` class map on objects and conflation relations (unchecked)."
+        "Construct the π₁ comparison to the existing ExactK0 using ExactK0.of, of_conflation and liftEquiv; only this higher-homotopy comparison remains new."
       ],
       "sources": [
         {
@@ -190,14 +196,21 @@
           "match": "Final step of Weibel's maximal-tree proof of the same theorem."
         }
       ],
-      "implementationStatus": "unchecked"
+      "implementationStatus": "unchecked",
+      "prerequisites": [
+        "GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction",
+        "tauceti:TauCeti.ExactK0",
+        "tauceti:TauCeti.ExactK0.of",
+        "tauceti:TauCeti.ExactK0.of_conflation",
+        "tauceti:TauCeti.ExactK0.liftEquiv"
+      ]
     },
     {
       "id": "GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories",
       "parentStageId": "GeneralAlgebraicKTheory:K.1",
       "title": "K-groups of an exact category and their elementary properties",
       "kind": "definition",
-      "statement": "For a small exact category M, K_i(M) = π_{i+1}(BQM, 0) for i ≥ 0, independent of the zero object; for an exact category with a set of isomorphism classes one uses an equivalent small subcategory, the choice being irrelevant. K_i is a functor from exact categories and exact functors to abelian groups, isomorphic exact functors induce equal maps, K_i(M^op) ≅ K_i(M), K_i(M × M′) ≅ K_iM ⊕ K_iM′ with the sum in K_iM induced by ⊕, and K_i commutes with filtered colimits of exact categories. For a ring A, K_iA = K_i(P(A)); a ring map induces A′ ⊗_A − and K_i(A × A′) = K_iA ⊕ K_iA′, K_i commutes with filtered colimits of rings (using idempotent matrices), and P ↦ Hom_A(P, A) gives K_iA ≅ K_i(A^op). BQM is a homotopy-commutative H-space via ⊕.",
+      "statement": "For a small exact category M, K_i(M) = π_{i+1}(BQM, 0) for i ≥ 0, independent of the zero object; for an exact category with a set of isomorphism classes one uses an equivalent small subcategory, the choice being irrelevant. K_i is a functor from exact categories and exact functors to abelian groups, isomorphic exact functors induce equal maps, K_i(M^op) ≅ K_i(M), K_i(M × M′) ≅ K_iM ⊕ K_iM′ with the sum in K_iM induced by ⊕, and K_i commutes with filtered colimits of exact categories. BQ(M) is connected; KSpace(M) = ΩBQ(M), with π₀ KSpace(M) = ExactK0(M). The ring functor and ring products/filtered colimits are supplied early by K.2:plus/functorial connective ring theory, not K.7.",
       "hypotheses": [
         "Small exact category, or a set of isomorphism classes (equivalent small model).",
         "Filtered colimits are indexed by small filtering categories; for rings the functor A ↦ P(A) is replaced by idempotent matrices so that it is a functor."
@@ -210,7 +223,7 @@
       ],
       "acceptance": [
         "The zero exact category has contractible K-theory (roadmap test).",
-        "K_n(M_r(A)) ≅ K_n(A) via Morita equivalence P(A) ≃ P(M_r(A)) (see K.7 node).",
+        "An exact equivalence of small models induces the same K-groups and maps; the ring Morita example uses the early projective carrier.",
         "Quillen's remark that K₁ of an exact category differs in general from Bass's universal determinant group (Gersten–Murthy examples) must be respected when comparing with K₁ models."
       ],
       "sources": [
@@ -321,7 +334,8 @@
       "acceptance": [
         "Construct the alternating-resolution inverse only in degree zero; in higher degrees the proof does not use functorial resolutions, which rarely exist (Quillen §4 remark).",
         "For f: R[s] → R with f(s) = 0, the finite transfers f_*: K(R) → K(R[s]) and f_*: G(R) → G(R[s]) are zero, by additivity applied to the exact sequence of functors 0 → M[s] → M[s] → M → 0 (multiplication by s), while f^*i^* ≃ id for the flat inclusion i: R → R[s] (Weibel V Example 3.5.1).",
-        "K₀ of the affine line with doubled origin: G₀ = Z ⊕ Z but K₀VB = Z (separatedness hypothesis)."
+        "For X obtained by gluing two affine planes along the punctured plane, K₀(VB(X)) ≅ ℤ while G₀(X) ≅ K₀(Perf(X)) ≅ ℤ² (II.8.2.4 and II.Ex.9.10(d)). This tests the distinction between vector-bundle and perfect-complex models.",
+        "For the doubled-origin affine line, gluing t^m produces Pic(X) ≅ ℤ, so rank and determinant forbid the assertion K₀(VB(X)) ≅ ℤ. Do not reuse V.3.4.2’s author-copy misprint as an acceptance test."
       ],
       "sources": [
         {
@@ -335,9 +349,18 @@
           "locator": "§4, Theorem 3 with proof, Corollary 1 and Lemma, Corollaries 2–3, transfer maps (3)–(5), LNM pp. 108–112 (PDF 24–28)",
           "excerpt": "The standard proof for K₀ consists in defining an inverse map",
           "match": "Quillen's explanation that the degree-zero inverse via resolutions does not extend, motivating the Theorem A proof (the scan OCR reads 'st:dard proof for K' with the subscript 0 on the next line)."
+        },
+        {
+          "sourceId": "Weibel-KBook-II",
+          "locator": "Example 8.2.4, p. II.77; Exercise 9.10(d), p. II.100",
+          "excerpt": "affine plane with a double origin",
+          "match": "The exercise and dimension n ≥ 2 in Example 8.2.4 identify the intended scheme; see the scoped sourceIssues entry."
         }
       ],
-      "implementationStatus": "unchecked"
+      "implementationStatus": "unchecked",
+      "sourceIssues": [
+        "GeneralAlgebraicKTheory/E-double-origin"
+      ]
     },
     {
       "id": "GeneralAlgebraicKTheory:K.3/devissage-theorem",
@@ -422,7 +445,8 @@
       "statement": "(Exact categories) If B ⊂ A is an exact subcategory closed under extensions and cofinal (for every A there is A′ with A ⊕ A′ in B), then BQB is homotopy equivalent to the covering space of BQA corresponding to the subgroup K₀(B) ⊂ K₀(A); hence K_n(B) ≅ K_n(A) for n > 0 while K₀(B) may be a proper subgroup. (Waldhausen) If A is strictly cofinal in B then wS.A → wS.B is a homotopy equivalence. (Thomason) For a Waldhausen category A with a cylinder functor satisfying the cylinder axiom and a surjection π: K₀(A) → G, the subcategory B of objects with π[B] = 0 gives a homotopy fibration K(B) → K(A) → G, so K_n(B) ≅ K_n(A) for n > 0 and 0 → K₀(B) → K₀(A) → G → 0 is exact.",
       "hypotheses": [
         "Exact case: closure under extensions and cofinality; Waldhausen case: strict cofinality (for every B there is A with B ∨ A isomorphic to an object of A), or cofinality plus closure under extensions and K₀ agreement (Weibel IV 8.9).",
-        "Thomason's version needs a cylinder functor with the cylinder axiom (Schlichting A.4 replaces this by factorizations into a cofibration followed by a weak equivalence, with ∅ = 0)."
+        "Thomason's version needs a cylinder functor with the cylinder axiom (Schlichting A.4 replaces this by factorizations into a cofibration followed by a weak equivalence, with ∅ = 0).",
+        "This is late cofinality content, provisionally housed under the existing K.3 id pending the maintainer’s K.3:cofinality split. ExactK0.ofLE_surjective compares exact structures on one category and does not prove cofinal-subcategory K₀ injectivity."
       ],
       "proofSteps": [
         "Exact case: Weibel IV Exercise 6.6 (Gersten, stated as an exercise with steps) treats the special case where B consists of the objects with φ[B] = 0 for a surjection φ: K₀(A) → G: the functor ψ: QA → G sending A ↞ B₂ ↣ B to φ[Ker(B₂ ↠ A)] satisfies Theorem B, so B(ψ/*) is the homotopy fibre of BQA → BG; Theorem A gives QB ≃ ψ⁻¹(*), and cofinality gives ψ⁻¹(*) ≃ ψ/*. Weibel says (p. IV.56) that the general case of 6.4.1 follows using Waldhausen cofinality in the form 8.9.1: a cofinal B closed under extensions is contained in B′ = {A : [A] ∈ K₀(B)} with K₀(B) = K₀(B′), so K(B) ≃ K(B′) by IV 8.9 and Exercise 6.6 applies to B′ with G = K₀(A)/K₀(B). This reduction is only indicated in the source.",
@@ -454,7 +478,8 @@
           "match": "Thomason's cofinality theorem with its hypotheses."
         }
       ],
-      "implementationStatus": "unchecked"
+      "implementationStatus": "unchecked",
+      "proposedParentStageId": "GeneralAlgebraicKTheory:K.3:cofinality"
     },
     {
       "id": "GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction",
@@ -543,7 +568,7 @@
     },
     {
       "id": "GeneralAlgebraicKTheory:K.4/waldhausen-additivity-theorem",
-      "parentStageId": "GeneralAlgebraicKTheory:K.4",
+      "parentStageId": "GeneralAlgebraicKTheory:K.4:construction",
       "title": "Waldhausen's additivity theorem",
       "kind": "theorem",
       "statement": "For a category C with cofibrations and weak equivalences, the map wS.E(C) → wS.C × wS.C, (A ↣ C ↠ B) ↦ (A, B), is a homotopy equivalence. Equivalent formulations: (1) wS.E(A, C, B) → wS.A × wS.B is a homotopy equivalence; (3) the maps induced by t and s ∨ q on wS.E(C) are homotopic; (4) for a cofibration sequence F′ ↣ F ↠ F″ of exact functors (with admissible squares), |wS.F| ≃ |wS.F′| ∨ |wS.F″|. With a cylinder functor satisfying the cylinder axiom, suspension is a homotopy inverse on K(C).",
@@ -582,7 +607,7 @@
     },
     {
       "id": "GeneralAlgebraicKTheory:K.4/relative-S-construction-fibration-and-delooping",
-      "parentStageId": "GeneralAlgebraicKTheory:K.4",
+      "parentStageId": "GeneralAlgebraicKTheory:K.4:construction",
       "title": "Relative S.-construction fibration and the delooping |wS.C| ≃ Ω|wS.S.C|",
       "kind": "theorem",
       "statement": "For an exact functor f: A → B of categories with cofibrations and weak equivalences, let S.(f: A → B) be the pullback of S.A → S.B ← PS.B. Then wS.B → wS.S.(f) → wS.S.A is a fibration up to homotopy. In particular (f = id) wS.C → P(wS.S.C) → wS.S.C is one, so |wS.C| ≃ Ω|wS.S.C| and |wS.^{(n)}C| ≃ Ω|wS.^{(n+1)}C| for n ≥ 1; for exact functors A → B → C the square with wS.B → wS.S.(A → B) over wS.C → wS.S.(A → C) is homotopy cartesian; wS.B → wS.C → wS.S.(B → C) is a fibration sequence; and a retract C of B splits wS.B ≃ wS.C × wS.S.(C → B).",
@@ -600,7 +625,7 @@
       "acceptance": [
         "The first map |wC| → Ω|wS.C| is not a homotopy equivalence in general (group completion); only the later structure maps are.",
         "K₋₁(f) = π₁|wS.S.f| is the cokernel of K₀(B) → K₀(C) (Weibel IV Exercise 8.11).",
-        "Biexact functors A × B → C with the admissibility condition induce |wS.A| ∧ |wS.B| → |wwS.S.C| and pairings on K-theory (Waldhausen p. 342)."
+        "Export the all-level delooping maps to H.5:S-delooping; K-theory products are owned by K.7."
       ],
       "sources": [
         {
@@ -897,7 +922,7 @@
       "parentStageId": "GeneralAlgebraicKTheory:K.7",
       "title": "Equivalence, Morita, product and filtered-colimit invariance",
       "kind": "theorem",
-      "statement": "Exact equivalences induce K-equivalences; Morita equivalent rings have equivalent P(R) ≃ P(S) and M(R) ≃ M(S), hence K_n(R) ≅ K_n(S) and G_n(R) ≅ G_n(S); in particular K(M_r(A)) ≃ K(A). K-theory takes finite products of exact categories and rings to products and commutes with filtered colimits of exact categories (and of rings via idempotent matrices); IK_n commutes with filtered colimits of Frobenius pairs for n ≤ 0 (Schlichting Lemma 6.3; positive degrees are not treated there). At the enhanced level, a map of Frobenius pairs inducing an equivalence of derived categories induces an equivalence of K-theory spectra.",
+      "statement": "Import exact-category equivalence/products/colimits from K.1 and the connective ring functor, scalar maps, finite products and filtered colimits from the early K.2:plus interface. Retain only enhanced/nonconnective extensions here: IK_n commutes with filtered colimits of Frobenius pairs for n ≤ 0 (Schlichting Lemma 6.3); enhanced derived equivalences induced by actual maps of Frobenius pairs give K-spectrum equivalences. Morita examples apply the imported projective-category equivalence; they do not redefine K(R).",
       "hypotheses": [
         "Morita invariance is induced by an actual equivalence of exact categories; derived invariance requires a map of models, not a bare triangulated equivalence.",
         "Filtered colimits over small filtering index categories."
@@ -905,7 +930,7 @@
       "proofSteps": [
         "Equivalent exact categories give equivalent Q-categories (Weibel IV Exercise 6.2) and homotopy equivalent classifying spaces.",
         "Morita: II.2.7 equivalences P(R) ≃ P(S) (Weibel IV 6.3.5; Chapter II not re-read here).",
-        "Products and filtered colimits: Quillen §2 (8)–(12) and Weibel IV 6.4, using compatibility of realization with products and filtered colimits.",
+        "Import generic exact-category products/filtered colimits from K.1 and their connective ring specialisation from the early K.2:plus ring functor; only extend those comparisons to the nonconnective/enhanced models here.",
         "Frobenius pairs: Schlichting Lemma 6.3 (colimits of flasque envelopes remain flasque) and Proposition 11.15 (derived invariance).",
         "Spectrum level: Proposition 11.15 gives K(A) ≃ K(B) for the spaces; isomorphisms on all IK_i, i ∈ Z, follow from Theorem 11.10 applied to the exact sequence A → B → 0 of Frobenius pairs, as Schlichting argues for quasi-isomorphic dg algebras in 11.14."
       ],
@@ -966,6 +991,114 @@
         }
       ],
       "implementationStatus": "unchecked"
+    },
+    {
+      "id": "GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring",
+      "parentStageId": "GeneralAlgebraicKTheory:K.2:plus",
+      "realises": [
+        "GeneralAlgebraicKTheory:K.2:plus"
+      ],
+      "title": "Early functorial connective K-theory of unital rings",
+      "kind": "construction",
+      "statement": "For every unital, possibly noncommutative ring R, import P(R) = (TauCeti.finiteProjectiveModules R).FullSubcategory with its existing split exact structure and essentially small model. Set K(R) = ΩBQ(P(R)). Scalar extension along a unital map R → S induces K(R) → K(S), preserving identities and composition without flatness. In every n ≥ 0 the projection maps induce K_n(R × S) ≅ K_n(R) × K_n(S), and K_n commutes with filtered colimits of unital rings via descent of finite idempotent matrices. This early interface is independent of the plus comparison and nonconnective extension. Late K.7 imports it and proves only the additional enhanced/nonconnective statements.",
+      "hypotheses": [
+        "Unital associative rings and unital maps; commutativity is not a general hypothesis.",
+        "Use small-model transport of the existing essentially small projective category.",
+        "Filtered diagrams are small; finite idempotent matrices and their finitely many relations descend to a stage."
+      ],
+      "proofSteps": [
+        "Import the existing projective exact category and apply K.1 to its small model; construct the maps through scalar extension and prove identity/composition via tensor associativity and unit isomorphisms.",
+        "For R × S, use its central complementary idempotents to decompose each finitely generated projective module and produce an exact equivalence P(R × S) ≃ P(R) × P(S). Apply the generic category-product theorem from K.1.",
+        "For filtered colimits, use finite idempotent-matrix objects rather than pretend the literal category P(R) strictly commutes with colimits. Objects, morphisms and equalities use finite data and descend; then import the generic classifying-space/filtered-colimit theorem.",
+        "Leave the plus-comparison naturality to its comparison node. K.5 relative ring theory uses this already-defined K(R) and the actual map K(f)."
+      ],
+      "acceptance": [
+        "The two projections R × S → R,S give the product isomorphism in degree zero and every higher degree.",
+        "Identity and two composable ring maps give the same K-map as the corresponding tensor unit/associativity isomorphisms.",
+        "ℤ → ℤ/2 induces exact scalar extension on the split projective category although it is not flat on all modules.",
+        "An idempotent matrix over a filtered colimit and an equality between two maps descend at a sufficiently large stage."
+      ],
+      "prerequisites": [
+        "GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality",
+        "GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups"
+      ],
+      "sources": [
+        {
+          "sourceId": "Weibel-KBook-IV",
+          "locator": "Definition 6.3.2 and Elementary properties 6.4, pp. IV.55 to IV.56",
+          "excerpt": "Definition 6.3.2. Let R be a ring with unit, and let P(R) denote the exact category of finitely generated projective R-modules. We set K(R) = K P(R). ... if R_1 and R_2 are rings then P(R_1 x R_2) = P(R_1) + P(R_2) and we have K_n(R_1 x R_2) = K_n(R_1) + K_n(R_2). ... Since geometric realization preserves filtered colimits, we have BQA = colim BQA_i and hence K_n(A) = colim K_n(A_i).",
+          "match": "The functor and the two compatibilities, verbatim."
+        }
+      ],
+      "implementationStatus": "unchecked",
+      "api": [
+        {
+          "name": "KSpace.ofRing",
+          "role": "data",
+          "statement": "The K-theory space of a ring."
+        },
+        {
+          "name": "KSpace.ofRing_map",
+          "role": "functoriality",
+          "statement": "The map induced by a ring homomorphism."
+        },
+        {
+          "name": "KGroup.ofRing_prod",
+          "role": "compatibility",
+          "statement": "Compatibility with finite products of rings."
+        },
+        {
+          "name": "KGroup.ofRing_colimit",
+          "role": "compatibility",
+          "statement": "Compatibility with filtered colimits of rings."
+        },
+        {
+          "name": "KSpace.ofRing_map_id",
+          "role": "functoriality",
+          "statement": "The identity ring homomorphism induces the identity, with the small-model comparison."
+        },
+        {
+          "name": "KSpace.ofRing_map_comp",
+          "role": "functoriality",
+          "statement": "Composition of unital ring maps induces composition of K-space maps up to the specified natural homotopy."
+        }
+      ],
+      "uses": [
+        {
+          "where": "K.5",
+          "how": "Relative K-theory is the homotopy fibre of the map this functor induces."
+        },
+        {
+          "where": "K.6 and K.7",
+          "how": "The nonconnective extension and the invariance statements are about this functor."
+        },
+        {
+          "where": "The consumer roadmaps",
+          "how": "Every roadmap that speaks of the K-theory of a ring imports this functor."
+        }
+      ],
+      "tests": [
+        {
+          "name": "product_ring",
+          "kind": "computation",
+          "statement": "The two projections R × S → R,S give the product isomorphism in degree zero and every higher degree."
+        },
+        {
+          "name": "scalar_identity_composition",
+          "kind": "compatibility",
+          "statement": "Identity and two composable ring maps give the same K-map as the corresponding tensor unit/associativity isomorphisms."
+        },
+        {
+          "name": "nonflat_projectives",
+          "kind": "non-example",
+          "statement": "ℤ → ℤ/2 induces exact scalar extension on the split projective category although it is not flat on all modules."
+        },
+        {
+          "name": "filtered_idempotent_descent",
+          "kind": "computation",
+          "statement": "An idempotent matrix over a filtered colimit and an equality between two maps descend at a sufficiently large stage."
+        }
+      ]
     }
   ],
   "links": [
@@ -1589,8 +1722,8 @@
       "status": "partial",
       "remaining": [
         "Naturality of the small-model transport in exact functors (Weibel IV Exercise 6.2 is stated as an exercise).",
-        "Declaration-level comparison of Quillen's axioms and K₀ with the pinned Tau Ceti ExactStructure and ExactK0 (unchecked).",
-        "Quillen's embedding of an exact category into left exact functors is sketched with details omitted."
+        "Quillen's embedding of an exact category into left exact functors is sketched with details omitted.",
+        "The ExactStructure/ExactK0 declarations and projective exact carrier have been read at the pins; the new π₁ comparison still needs its proof and independent review."
       ]
     },
     {
@@ -1904,5 +2037,228 @@
         "note": "Weibel IV 6.5–6.6.5, Ex. 6.8–6.10, 8.11 and Waldhausen p. 342 (image) match; swallowing lemma import named; the Loday acceptance item restated to what IV Theorem 1.10 says."
       }
     ]
-  }
+  },
+  "revision": {
+    "job": "FIX-RT-AREA-ktheory-1",
+    "agent": "Codex",
+    "session": "codex-5ebb6f",
+    "date": "2026-09-29",
+    "status": "awaiting independent review",
+    "note": "The retained review object is the unmodified historical verdict on the earlier text. This fix revision has not received a new independent review; its acceptance must not be inferred from that old verdict."
+  },
+  "sourceIssues": [
+    {
+      "id": "GeneralAlgebraicKTheory/E-double-origin",
+      "source": "Weibel-KBook-V",
+      "kind": "misprint",
+      "locator": "Author chapter Kbook.V.pdf, Remark 3.4.2, p. V.22; version hashed in sourceVersions, read 2026-09-29",
+      "printed": "affine line with a double origin",
+      "correction": "Use the affine plane with a double origin: glue two copies of Spec(k[x,y]) along the punctured plane. Then K₀(VB(X)) ≅ ℤ and G₀(X) ≅ K₀(Perf(X)) ≅ ℤ². The cited II.8.2.4 explicitly assumes dimension n ≥ 2, and II.Ex.9.10(d) uses the plane.",
+      "reason": "The line has a nontrivial Picard group: transition units k[t,t⁻¹]× modulo the two copies of k[t]× give Pic(X) ≅ ℤ. Rank and determinant show that the class of a nontrivial line bundle cannot equal the class of O_X, so K₀(VB(X)) cannot be just the rank group ℤ. The plane is the actual example in both of the cited chapter-II locations. The equivalence of vector-bundle categories for the plane is quoted there from EGA IV(5.9); its proof is not claimed read or formalised here.",
+      "affects": "a stated result",
+      "known": "No correction located in the searches listed; novelty is not established. Scoped to the author chapter copy, not the published edition.",
+      "searched": [
+        "Weibel author K-book page and its errata link, checked 2026-09-29; the linked Kbook.errata.pdf returned HTTP 404 on both math.rutgers.edu host variants.",
+        "Author chapter II, Example 8.2.4 (p. II.77) and Exercise 9.10(d) (p. II.100), read 2026-09-29: both already give the correct dimension.",
+        "Public search for Weibel K-book errata and affine-line/double-origin correction, including AMS-domain results, 2026-09-29; no published correction located. The version of record was not obtained."
+      ]
+    }
+  ],
+  "sourceVersions": [
+    {
+      "source": "Weibel-KBook-II",
+      "kind": "author copy",
+      "url": "https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf",
+      "read": "2026-09-29",
+      "sha256": "529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607"
+    },
+    {
+      "source": "Weibel-KBook-IV",
+      "kind": "author copy",
+      "url": "https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf",
+      "read": "2026-09-29",
+      "sha256": "9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248"
+    },
+    {
+      "source": "Weibel-KBook-V",
+      "kind": "author copy",
+      "url": "https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf",
+      "read": "2026-09-29",
+      "sha256": "52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8"
+    }
+  ],
+  "baseline": {
+    "tauceti": "f790474821cf4256814db967cb154e7af3d0c369",
+    "mathlib": "082e2d37e8b0463410cdb532e111cd43d5a66174",
+    "declarations": [
+      {
+        "ref": "mathlib:CategoryTheory.Core",
+        "module": "Mathlib/CategoryTheory/Core.lean",
+        "provides": "The maximal subgroupoid of a category, the groupoid of isomorphisms that the plus comparison localises."
+      },
+      {
+        "ref": "mathlib:CategoryTheory.Idempotents.Karoubi",
+        "module": "Mathlib/CategoryTheory/Idempotents/Karoubi.lean",
+        "provides": "The idempotent completion, the standard witness that cofinality changes the group in degree zero."
+      },
+      {
+        "ref": "mathlib:CategoryTheory.Limits.HasFilteredColimits",
+        "module": "Mathlib/CategoryTheory/Limits/Filtered.lean",
+        "provides": "Filtered colimits of categories, the input to K.1's colimit statement."
+      },
+      {
+        "ref": "mathlib:CategoryTheory.Limits.HasPushouts",
+        "module": "Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean",
+        "provides": "Pushouts, which the cofibration axioms of a Waldhausen category require along cofibrations."
+      },
+      {
+        "ref": "mathlib:CategoryTheory.ObjectProperty.IsSerreClass",
+        "module": "Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean",
+        "provides": "Serre classes in an abelian category, the hypothesis of Quillen's localisation theorem; the localisation long exact sequence itself is absent."
+      },
+      {
+        "ref": "mathlib:CategoryTheory.nerve",
+        "module": "Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean",
+        "provides": "The nerve of a category, the first ingredient of the K-theory space."
+      },
+      {
+        "ref": "mathlib:HomotopyGroup",
+        "module": "Mathlib/Topology/Homotopy/HomotopyGroup.lean",
+        "provides": "The homotopy groups of a pointed space, the third; no K-theory space is built from these three at the pins."
+      },
+      {
+        "ref": "mathlib:LinearMap.ker_eq_range_of_comp_eq_id",
+        "module": "Mathlib/Algebra/Module/Submodule/Range.lean",
+        "provides": "The complement is the image of the complementary idempotent, the other half."
+      },
+      {
+        "ref": "mathlib:Module.Finite.base_change",
+        "module": "Mathlib/RingTheory/TensorProduct/Finite.lean",
+        "provides": "Base change preserves finite generation, the other half."
+      },
+      {
+        "ref": "mathlib:Module.Finite.exists_comp_eq_id_of_projective",
+        "module": "Mathlib/RingTheory/Finiteness/Projective.lean",
+        "provides": "A finitely generated projective module is a retract of a finite free module, the module-theoretic half of K.2:plus's cofinality node."
+      },
+      {
+        "ref": "mathlib:Module.Projective.tensorProduct",
+        "module": "Mathlib/Algebra/Module/Projective.lean",
+        "provides": "Base change preserves projectivity, half of the scalar-extension node of K.2:plus."
+      },
+      {
+        "ref": "mathlib:ModuleCat.extendScalars",
+        "module": "Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean",
+        "provides": "Extension of scalars between module categories, pinned between commutative rings; K.2:plus needs it along an arbitrary unital ring map."
+      },
+      {
+        "ref": "mathlib:SSet.toTop",
+        "module": "Mathlib/AlgebraicTopology/SingularSet.lean",
+        "provides": "The realisation of a simplicial set, the second ingredient."
+      },
+      {
+        "ref": "mathlib:Unitization",
+        "module": "Mathlib/Algebra/Algebra/Unitization.lean",
+        "provides": "The canonical unitisation of a nonunital ring with its universal property, exactly the unitisation K.5 specifies; nothing K-theoretic is built on it at the pins."
+      },
+      {
+        "ref": "tauceti:TauCeti.ExactK0",
+        "module": "TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean",
+        "provides": "The Grothendieck group of an exact category, which the fundamental-group theorem of K.1 identifies with the first homotopy group of the Q-construction."
+      },
+      {
+        "ref": "tauceti:TauCeti.ExactK0.mapEquiv",
+        "module": "TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean",
+        "provides": "Invariance of that group under an exact equivalence, likewise."
+      },
+      {
+        "ref": "tauceti:TauCeti.ExactK0.ofLE_surjective",
+        "module": "TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean",
+        "provides": "The comparison of the Grothendieck groups of two exact structures on one category, which the audit records is NOT cofinality; K.3's cofinality node says so."
+      },
+      {
+        "ref": "tauceti:TauCeti.ExactK0.transportEquiv",
+        "module": "TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean",
+        "provides": "Invariance of that group under the transport, the degree-zero form of the independence K.1 states in every degree."
+      },
+      {
+        "ref": "tauceti:TauCeti.ExactStructure",
+        "module": "TauCeti/CategoryTheory/Exact/ExactStructure.lean",
+        "provides": "Quillen exact structures on an additive category, with conflations and admissible monomorphisms and epimorphisms. This is the stated input of K.1 and it is fully built; the Q-construction is built ON it, not instead of it."
+      },
+      {
+        "ref": "tauceti:TauCeti.ExactStructure.isConflationExact_split",
+        "module": "TauCeti/CategoryTheory/Exact/Functor.lean",
+        "provides": "Every additive functor is conflation-exact for split exact structures. This is why scalar extension on finitely generated projectives needs no flatness hypothesis, which is what K.2:plus asks for."
+      },
+      {
+        "ref": "tauceti:TauCeti.ExactStructure.resolutionEquiv",
+        "module": "TauCeti/CategoryTheory/GrothendieckGroup/ProjectiveResolution.lean",
+        "provides": "The degree-zero resolution isomorphism, proved under the stronger hypothesis that every resolving object is projective; K.3 states the general theorem in every degree and cites this as the pinned special case."
+      },
+      {
+        "ref": "tauceti:TauCeti.ExactStructure.transport",
+        "module": "TauCeti/CategoryTheory/Exact/Equivalence.lean",
+        "provides": "Transport of an exact structure along an additive equivalence, the pinned half of K.1's small-model target."
+      },
+      {
+        "ref": "tauceti:TauCeti.moduleResolutionEquiv",
+        "module": "TauCeti/Algebra/Category/ModuleCat/CartanMap.lean",
+        "provides": "The instance of that isomorphism for modules with finite projective resolutions."
+      },
+      {
+        "ref": "tauceti:TauCeti.simpleClassBasis",
+        "module": "TauCeti/RepresentationTheory/GrothendieckGroup/SimpleBasis.lean",
+        "provides": "The Grothendieck group of finitely generated modules over an artinian ring is free on the simple classes, which is devissage in degree zero; K.3 states the theorem in every degree."
+      },
+      {
+        "ref": "tauceti:TauCeti.finiteProjectiveModules",
+        "module": "TauCeti/Algebra/Category/ModuleCat/CartanMap.lean",
+        "provides": "Object property of finitely generated projective R-modules. Its full subcategory has an EssentiallySmall instance in this pinned file."
+      },
+      {
+        "ref": "tauceti:TauCeti.finiteProjectiveModulesExactStructure",
+        "module": "TauCeti/Algebra/Category/ModuleCat/CartanMap.lean",
+        "provides": "Existing exact structure on the full subcategory of finitely generated projectives; import this carrier rather than reconstruct it."
+      },
+      {
+        "ref": "tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split",
+        "module": "TauCeti/Algebra/Category/ModuleCat/CartanMap.lean",
+        "provides": "The induced exact structure is equal to the split structure. This is the input that makes arbitrary scalar extension exact on projectives."
+      },
+      {
+        "ref": "tauceti:TauCeti.finiteProjectiveModulesExactStructure_conflation_iff",
+        "module": "TauCeti/Algebra/Category/ModuleCat/CartanMap.lean",
+        "provides": "Conflations are exactly short exact sequences after inclusion in ModuleCat R."
+      },
+      {
+        "ref": "tauceti:TauCeti.ExactK0.of",
+        "module": "TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean",
+        "provides": "Existing object-class map to ExactK0; the π₁ comparison must preserve this map."
+      },
+      {
+        "ref": "tauceti:TauCeti.ExactK0.of_conflation",
+        "module": "TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean",
+        "provides": "Existing conflation-additivity relation for the class map."
+      },
+      {
+        "ref": "tauceti:TauCeti.ExactK0.liftEquiv",
+        "module": "TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean",
+        "provides": "Existing universal property: conflation-additive invariants are additive homomorphisms out of ExactK0."
+      }
+    ]
+  },
+  "requests": [
+    {
+      "supplier": "StableHomotopyKTheory:H.2",
+      "need": "RT-AREA-ktheory-1/15: a precise realization theorem for the simplicial homotopy-fibration diagram in V.1.7, with connected bases and the proper/cofibrant or bisimplicial Kan hypotheses of the chosen model. Prove homotopy fibres agree after realization and verify the hypotheses for nerves of wS.(S_n f). Waldhausen 1978 Lemma 5.2 is a source lead, not read or established by this checkpoint."
+    }
+  ],
+  "restructure": [
+    {
+      "kind": "propose-split",
+      "title": "Early exact-category theorems and late cofinality have different prerequisite closures",
+      "detail": "RT-AREA-ktheory-1/20: K.3 additivity, resolution, dévissage and abelian localisation require K.1 and H.1/H.2, not all of K.4. Keep those in early K.3. Introduce a late K.3:cofinality stage after K.4 for the general cofinality proof via Waldhausen localisation; move the cofinality node there while retaining its stable id. Add K.4 → K.5 and K.2:plus → K.5. RT-AREA-ktheory-1/4: move Waldhausen additivity and relative S-fibration to K.4:construction, followed by H.5:S-delooping assembly and late K.4 localisation/approximation/comparisons. Delete EDS E5:abstract and H.5:spectra as prerequisites of the early S-construction; it only needs the homotopy-realization foundation H.1/H.2. Raw atlas snapshots are immutable; the maintainer must apply these stage changes."
+    }
+  ]
 }
diff --git a/data/decompositions/StableHomotopyKTheory.json b/data/decompositions/StableHomotopyKTheory.json
index 7286051c..cfc30c81 100644
--- a/data/decompositions/StableHomotopyKTheory.json
+++ b/data/decompositions/StableHomotopyKTheory.json
@@ -818,18 +818,17 @@
       "parentStageId": "StableHomotopyKTheory:H.5:S-delooping",
       "title": "The iterated S.-construction is a connective Ω-spectrum",
       "kind": "theorem",
-      "statement": "For a small Waldhausen category C with K(C) = Ω|wS.C| and π₁|wS.C| ≅ K₀(C), the sequence of spaces Ω|wS.C|, |wS.C|, |wS.S.C|, …, |wS.^nC|, … with the maps |wS.^nC| → Ω|wS.^{n+1}C| forms a connective Ω-spectrum KC with π_i(KC) = K_i(C) for i ≥ 0. An exact functor induces a map of spectra, and a biexact functor A × B → C satisfying the cofibration condition F(A′, B) ∪_{F(A, B)} F(A, B′) ↣ F(A′, B′) for all pairs of cofibrations (Weibel IV 8.11, II.9.5.2) induces a pairing K(A) ∧ K(B) → K(C).",
+      "statement": "For a small Waldhausen category C with K(C) = Ω|wS.C| and π₁|wS.C| ≅ K₀(C), the sequence of spaces Ω|wS.C|, |wS.C|, |wS.S.C|, …, |wS.^nC|, … with the maps |wS.^nC| → Ω|wS.^{n+1}C| forms a connective Ω-spectrum KC with π_i(KC) = K_i(C) for i ≥ 0. An exact functor induces a map of spectra. The comparison maps and their equivalences are imported from the early K.4:construction prefix. This node assembles those maps as an Ω-spectrum; it does not prove additivity, relative S-fibration or K-theory pairings.",
       "hypotheses": [
         "C small Waldhausen category; the S.-construction S_nC (with chosen subquotients, cofibrations and weak equivalences) is supplied by GeneralAlgebraicKTheory:K.4:construction.",
-        "The homotopy-fibration step uses the fibration sequence of Weibel V.1.7, which rests on the Additivity Theorem; that proof is not read in this packet but is read and decomposed in GeneralAlgebraicKTheory:K.4/relative-S-construction-fibration-and-delooping, which supplies it by a link."
+        "The homotopy-fibration step uses the fibration sequence of Weibel V.1.7, which rests on the Additivity Theorem; that proof is not read in this packet but is read and decomposed in GeneralAlgebraicKTheory:K.4/relative-S-construction-fibration-and-delooping, which supplies it by a link. Both supplier nodes now have parent K.4:construction, despite their preserved K.4/... stable ids. The precise realization-fibration criterion remains an H.2 gap."
       ],
       "proofSteps": [
         "π₁ of a simplicial space X. with X₀ a point is the free group on π₀(X₁) modulo ∂₁x = ∂₂x·∂₀x; for X. = BwS.C this is K₀(C) (Weibel IV Proposition 8.4).",
         "For an exact functor f: B → C define S_nf = S_nB ×_{S_nC} S_{n+1}C, a simplicial Waldhausen category containing C, with C → S.f → S.B (Weibel IV 8.5.3).",
         "Lemma 8.5.4: for f = id_C, S.f is the simplicial path space of S.C and wS.S.f the path space of wS.S.C, contractible since S₀f = 0 (proof given).",
         "The realization of wS.B → wS.C → wS.(S.f) → wS.(S.B) is a homotopy fibration sequence by Weibel V.1.7 (source boundary here; to be read with the Additivity Theorem).",
-        "Taking f = id gives |wS.C| ≃ Ω|wS.S.C|; iterating in the multisimplicial categories S.^nC gives the Ω-spectrum (Weibel IV 8.5.5).",
-        "Products: a biexact functor induces wS.A × wS.B → wwS.S.C, factoring through the smash product after realization (Weibel IV 8.11, sketched)."
+        "Taking f = id gives |wS.C| ≃ Ω|wS.S.C|; iterating in the multisimplicial categories S.^nC gives the Ω-spectrum (Weibel IV 8.5.5)."
       ],
       "acceptance": [
         "For an exact category A with isomorphisms as weak equivalences, |iS.A| ≃ BQA (Waldhausen 1.9; Weibel IV Exercises 8.5–8.6, statements with hints).",
@@ -839,7 +838,7 @@
       "sources": [
         {
           "sourceId": "Weibel-KBook-IV",
-          "locator": "Proposition 8.4 with proof, Definition 8.5, Relative K-theory spaces 8.5.3, Lemma 8.5.4 with proof, Infinite Loop Structure 8.5.5, pp. IV.68–69; Products 8.11, p. IV.73",
+          "locator": "Proposition 8.4 with proof, Definition 8.5, Relative K-theory spaces 8.5.3, Lemma 8.5.4 with proof, Infinite Loop Structure 8.5.5, pp. IV.68–69",
           "excerpt": "forms a connective Ω-spectrum KC, called the K-theory spectrum of C.",
           "match": "Conclusion of 8.5.5, whose fibration input is deferred in the source to V.1.7 as recorded."
         }
@@ -1519,5 +1518,19 @@
         "note": "Weibel IV 2.9 matches; the acceptance item copied Weibel's example K₁(C; Z_ℓ) = Z_ℓ, which contradicts the formula of 2.9 itself (the Tate module of K₁(C) lies in K₂(C; Z_ℓ)); replaced by an index check."
       }
     ]
-  }
+  },
+  "revision": {
+    "job": "FIX-RT-AREA-ktheory-1",
+    "agent": "Codex",
+    "session": "codex-5ebb6f",
+    "date": "2026-09-29",
+    "status": "awaiting independent review",
+    "note": "The retained review object is the unmodified historical verdict on the earlier text. This fix revision has not received a new independent review; its acceptance must not be inferred from that old verdict."
+  },
+  "requests": [
+    {
+      "supplier": "GeneralAlgebraicKTheory:K.4:construction",
+      "need": "Supply additivity and the relative S-construction fibration before this spectrum assembly, including its natural iterated delooping maps. The late K.4 fibration/approximation layer cannot be the prerequisite of its own spectrum supplier."
+    }
+  ]
 }
```
