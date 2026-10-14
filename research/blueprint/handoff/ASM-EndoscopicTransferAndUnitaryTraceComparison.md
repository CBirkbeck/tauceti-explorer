# Assembly: Endoscopic transfer and unitary trace comparison

Issue [#226](https://github.com/CBirkbeck/tauceti-explorer/issues/226), job `ASM-EndoscopicTransferAndUnitaryTraceComparison`. Claude (Opus 5.5), session `claude-2JDz9F`, 2026-10-14; claim confirmed by the bot on the issue (claim comment 6168815199). Branch `claude-2JDz9F-endoscopic-assembly`, from main `e413d8137`. This run continues the three checkpoints #9701 (`codex-mzqAco`), #9722 (`codex-vEpuUD`) and #9728 (`codex-gnFnGw`).

**Status: assembly complete.** All five outputs of the job are in place: the combined reader, the joined Suggested file, this handoff, and the two part packets the queue lets an assembly edit (ET.6a changed, ET.0 unchanged). No review verdict was changed. No reviewed statement changed in substance: the ET.6a prerequisite lists, one ET.6a statement's supplier sentence and one locator changed, and they are itemized below for the next review of that packet.

**The roadmap itself is not complete.** ET.4–ET.6 (packet `--ET.4`) has a finished independent review with verdict `needs_changes` (#395, PR #9717) and status `partial`. The combined reader states every open item of that review at its target and collects them; see "What the roadmap still needs" below. `make_queue.roadmap_complete` requires every stage to be planned in an accepted packet, so finishing this assembly does not queue a package job.

## Why the assembly is completed rather than checkpointed again

The three earlier runs withheld the Suggested file so that the intake would not mark the job complete while ET.4 is unaccepted. That keeps the job in a loop: the ET.4 review is finished, no revision round `BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4~2` exists in the queue, and none will be generated (`make_queue.py` makes revision rounds only for planning jobs whose prompt is in `plan_prompts`; `research/blueprint/prompts/BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4.md` does not exist, because the job's deliverables arrived from an external worker on #718). Every subsequent worker would meet the same inputs. An assembly joins reviewed parts; ET.4 is reviewed, its corrections are in its packet, and what the review left open is recorded there as gaps and per-node `unverifiable` notes. The precedent is ASM-PrismaticCohomology (PR #6803), assembled from parts whose reviews were `needs_changes`: the document is generated from the corrected packets and prints each open review note at its node. This assembly does the same.

## What this run changed

1. **Combined reader** (`readmes/EndoscopicTransferAndUnitaryTraceComparison.md`, built on #9722's draft):
   - the checkpoint banner is replaced by a status paragraph naming the four inputs that must still be planned and the condition for completeness;
   - the 29 ET.4–ET.6 targets whose review verdict is `unverifiable` each carry a paragraph **Open after the independent review**, stating in plain words the review's "Remaining" note (for the six ET.5 targets: the algebraic σ-conjugacy, J_b and early Igusa inputs that must be planned at this roadmap's tier);
   - introductions for layers ET.4, ET.5, ET.6, ET.6a, ET.7a, ET.7b and ET.7 in the style of the ET.0–ET.3 introductions (they listed the targets only);
   - a subsection *Inputs still to be planned in ET.4–ET.6* opens *Remaining supplier and proof obligations*, listing the four inputs the ET.4 review found missing with the targets that use them;
   - the build paragraph now describes the Suggested file that exists;
   - the *Needs* lines of the 15 ET.6a–ET.7 targets whose prerequisites changed in this run follow the packet exactly.
2. **Suggested file** (`suggested/EndoscopicTransferAndUnitaryTraceComparison.lean`, 571 lines): one import block of individual Mathlib modules, one module note, namespace `TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison`, layers in roadmap order (ET.0, ET.1, ET.2b, ET.4, ET.5, ET.6, ET.7). The ET.0 and ET.4 bodies were in `TauCetiRoadmap.EndoscopicTransfer`, the ET.6a body in `TauCeti.Endoscopy`; all now live in the one namespace with no name clash. Reconciliation: ET.4's `glInnerFormSign` and its two examples duplicated ET.0's `kottwitzSign` (`kottwitzSign_gl` is exactly the sign (−1)^(n−r) of GL_r(D), `kottwitzSign 1 0 = -1` the quaternion case, `kottwitzSign_self` the split case), so they are dropped and an ET.6 note points to the ET.0 declarations; `glInnerFormSign` is not a packet name. Packet unit-test names were added as comments before the ET.0–ET.2b declarations and examples that realise them (`stableConj_gln`, `kottwitzSign_quasiSplit`, `kottwitzSign_quaternion`, `kappaOrbitalIntegral_change_base`, `kappaOrbitalIntegral_sl2`, `stableOrbitalIntegral_gln`, `chevalleyQuotient_gln`, `kostantSection_gln`, `kostantSection_not_semisimple`, `regularCentralizer_gln`), and `Segment.precedes_irrefl`, `endoscopicCoefficient` in ET.4–ET.6. The note distinguishes abstract cochains from continuous Galois cohomology, segment and matrix models from representations and Weil–Deligne parameters, and the finite ledger from automorphic traces, and says that the ET.4–ET.6 signatures do not supply the open inputs.
3. **ET.6a packet** (`packets/EndoscopicTransferAndUnitaryTraceComparison--ET.6a.json`): cross-part references only, itemized below for the next review of that packet. Its `review` object is untouched (still the accepted #9379 review); per PROTOCOL §8 these edits go live only after an accepted review.
4. Nothing else: the ET.0 and ET.4 packets, the part readers and part Suggested files, the queue and all other roadmaps are untouched.

## ET.6a packet edits (for re-review)

All identifiers omit `EndoscopicTransferAndUnitaryTraceComparison:`.

(a) The 29 prerequisites that named a whole stage of this roadmap are replaced, in place, by the exact supplier nodes. The table started from #9722's proposal. In this run every row was checked against the consumer's statement, hypotheses and proof steps and against each supplier's statement (a Sonnet cross-check listed the evidence; each change below was decided by reading the node texts): 15 rows are as proposed; 12 rows gain a supplier that the consumer's text uses (for example `ET.7b/red-trace-duality` uses the acceptable-function extension theorem, `ET.5/acceptable-functions-determine`); 3 rows lose one that the consumer does not use (`ET.7a/transferable-level` concerns finite places only, `ET.7/torus-measure-check` is a local computation, `ET.7/division-inner-form-check` does not use the non-transfer of principal series); one row does both. Where the consumer needs more than the named nodes state, the residue stays where it was already recorded: in the four internal requests of the packet (to ET.3, ET.4, ET.5 and ET.6, kept unchanged as the contracts those stages still owe) and in gaps 4–7.

| Consumer | Replaced | Exact suppliers now cited | Against #9722 |
| --- | --- | --- | --- |
| `ET.6a/tower-conventions` | `ET.6` | `ET.6/llc-characterizing-properties`, `ET.6/full-wd-local-langlands`, `ET.6/local-jacquet-langlands`, `ET.6/segment-wd-parameter` | adds `ET.6/segment-wd-parameter` |
| `ET.6a/raw-compact-unitary-cohomology` | `ET.4` | `ET.4/simple-division-algebra-trace-identity` | as proposed |
| `ET.6a/global-extraction` | `ET.4` | `ET.4/simple-division-algebra-trace-identity`, `ET.4/archimedean-lefschetz-functions` | as proposed |
| `ET.6a/global-extraction` | `ET.6` | `ET.6/full-wd-local-langlands`, `ET.6/local-jacquet-langlands` | as proposed |
| `ET.6a/fs-normalization-contract` | `ET.6` | `ET.6/full-wd-local-langlands`, `ET.6/local-jacquet-langlands`, `ET.6/semisimple-langlands-parameter`, `ET.6/segment-wd-parameter` | adds `ET.6/segment-wd-parameter` |
| `ET.7a/cyclic-base-change` | `ET.4` | `ET.4/local-cyclic-base-change`, `ET.4/global-cyclic-base-change` | as proposed |
| `ET.7a/cyclic-base-change` | `ET.3` | `ET.3/base-change-fundamental-lemma-and-transfer`, `ET.3/twisted-fundamental-lemma-and-transfer` | as proposed |
| `ET.7a/twisted-spectral-normalization` | `ET.4` | `ET.4/twisted-spectral-side`, `ET.4/archimedean-lefschetz-functions`, `ET.4/twisted-trace-formula`, `ET.4/base-change-groups` | adds `ET.4/twisted-trace-formula`, `ET.4/base-change-groups` |
| `ET.7a/weak-unitary-base-change` | `ET.4` | `ET.4/unitary-gl-base-change-descent`, `ET.4/stable-twisted-identity`, `ET.4/unramified-transfers`, `ET.4/base-change-groups` | adds `ET.4/unramified-transfers`, `ET.4/base-change-groups` |
| `ET.7a/cohomological-base-change` | `ET.4` | `ET.4/archimedean-lefschetz-functions`, `ET.4/stable-twisted-identity`, `ET.4/unitary-gl-base-change-descent`, `ET.4/base-change-transfer-of-functions`, `ET.4/unramified-transfers`, `ET.4/base-change-groups` | adds `ET.4/base-change-transfer-of-functions`, `ET.4/unramified-transfers`, `ET.4/base-change-groups` |
| `ET.7a/local-unitary-base-change` | `ET.4` | `ET.4/unitary-endoscopic-classification`, `ET.4/unramified-transfers`, `ET.4/base-change-groups` | as proposed |
| `ET.7a/local-unitary-base-change` | `ET.6` | `ET.6/zelevinsky-classification`, `ET.6/full-wd-local-langlands` | as proposed |
| `ET.7a/relevant-packet-multiplicity` | `ET.4` | `ET.4/unitary-endoscopic-classification` | as proposed |
| `ET.7a/definite-indefinite-switches` | `ET.4` | `ET.4/unitary-endoscopic-classification`, `ET.4/unramified-transfers` | as proposed |
| `ET.7a/transferable-level` | `ET.4` | `ET.4/small-level-transfer`, `ET.4/base-change-transfer-of-functions`, `ET.4/unramified-transfers` | adds `ET.4/unramified-transfers`; drops `ET.4/archimedean-lefschetz-functions` |
| `ET.7a/transferable-level` | `ET.3` | `ET.3/group-fundamental-lemma`, `ET.3/base-change-fundamental-lemma-and-transfer`, `ET.3/twisted-fundamental-lemma-and-transfer`, `ET.3/local-transfer-existence` | adds `ET.3/local-transfer-existence` |
| `ET.7a/oldform-dimensions` | `ET.4` | `ET.4/unitary-endoscopic-classification`, `ET.4/archimedean-lefschetz-functions`, `ET.4/small-level-transfer`, `ET.4/base-change-transfer-of-functions`, `ET.4/stable-twisted-identity` | adds `ET.4/stable-twisted-identity` |
| `ET.7a/gsp4-solvable-descent-interface` | `ET.4` | `ET.4/gsp4-gl4-transfer` | as proposed |
| `ET.7b/csnc-test-functions` | `ET.4` | `ET.4/base-change-groups`, `ET.4/unramified-transfers`, `ET.4/base-change-transfer-of-functions`, `ET.4/small-level-transfer`, `ET.4/archimedean-lefschetz-functions` | as proposed |
| `ET.7b/csnc-test-functions` | `ET.5` | `ET.5/acceptable-test-functions`, `ET.5/igusa-endoscopic-test-function`, `ET.5/transfer-at-p` | adds `ET.5/transfer-at-p` |
| `ET.7b/newton-reduction` | `ET.5` | `ET.5/jb-endoscopic-levi-data`, `ET.5/transfer-at-p` | as proposed |
| `ET.7b/newton-reduction` | `ET.4` | `ET.4/base-change-groups`, `ET.4/unramified-transfers` | as proposed |
| `ET.7b/red-trace-duality` | `ET.5` | `ET.5/transfer-at-p`, `ET.5/igusa-endoscopic-test-function`, `ET.5/acceptable-functions-determine` | adds `ET.5/acceptable-functions-determine` |
| `ET.7b/signed-igusa-trace` | `ET.4` | `ET.4/stable-twisted-identity`, `ET.4/twisted-spectral-side`, `ET.4/stable-elliptic-distribution`, `ET.4/twisted-trace-formula` | adds `ET.4/twisted-trace-formula` |
| `ET.7b/signed-igusa-trace` | `ET.5` | `ET.5/unitary-igusa-trace-formula`, `ET.5/acceptable-functions-determine` | as proposed |
| `ET.7/torus-measure-check` | `ET.4` | `ET.4/base-change-transfer-of-functions`, `ET.4/stable-elliptic-distribution` | drops `ET.4/tamagawa-number-formula` |
| `ET.7/unramified-gl2-check` | `ET.4` | `ET.4/unramified-transfers`, `ET.4/base-change-groups` | as proposed |
| `ET.7/proper-endoscopy-check` | `ET.4` | `ET.4/stable-elliptic-distribution`, `ET.4/twisted-spectral-side`, `ET.4/tamagawa-number-formula`, `ET.4/base-change-groups`, `ET.4/stable-twisted-identity` | adds `ET.4/base-change-groups`, `ET.4/stable-twisted-identity` |
| `ET.7/division-inner-form-check` | `ET.6` | `ET.6/local-jacquet-langlands`, `ET.6/badulescu-langlands-jacquet-map` | drops `ET.6/inner-form-nontransfer` |

Two prerequisites missing outside these rows are added: `ET.7b/newton-reduction` applies the Langlands–Jacquet map to the inner form, so it now cites `ET.6/badulescu-langlands-jacquet-map` (whose own consumer list names it); `ET.7/unramified-gl2-check` uses the unramified cyclic base-change map of Satake parameters, so it now cites `ET.3/base-change-fundamental-lemma-and-transfer`.

(b) Two imports of early owners, as #9722 recorded: `ET.6a/lubin-tate-tower` now cites `ET.6/drinfeld-level-deformation-spaces` (and its statement says so: "Use the formal O_E-module deformation construction with full Drinfeld levels of ET.6/drinfeld-level-deformation-spaces. The additional framed deformation functor …"; the mathematics is unchanged), and `ET.7a/cyclic-automorphic-induction` cites `ET.4/cyclic-automorphic-induction` (ET.4 proposal 1 / ET.6a proposal 1: one owner for cyclic base change and automorphic induction).

(c) Wording and locators, no mathematics: a proof step of `ET.6a/infinite-level-moduli` says "finite-flat supplier" instead of "finite-flat packet"; the Arthur–Clozel locator of `ET.7a/cyclic-automorphic-induction` becomes "Chapter III, Definition 6.1 and Theorem 6.2, p. 215; proof, pp. 215–217; Lemma 6.4, pp. 217–218; Corollary 6.5, p. 218" (checked on the Clay scan, printed page = PDF page − 16).

After these edits the three packets have 180 targets and **604 distinct internal node edges, no cycle, no internal stage-level prerequisite, and no edge from a target to a target of a subsequent stage** (stage order ET.0 < ET.1 < ET.2b < ET.3 < ET.4 < ET.5 < ET.6 < ET.6a < ET.7a < ET.7b < ET.7). The reader's *Needs* line of every ET.4–ET.7 target equals the packet's prerequisite list exactly.

## Corrections the ET.4 revision should carry into its packet

The assembly may not edit the ET.4 packet (it is not an output of this job), so the reader carries these corrections and the packet still has the old text:

- Arthur–Clozel locators (Clay scan, printed = PDF − 16, verified page by page in this run): `ET.4/local-cyclic-base-change` should cite Ch. I Proposition 6.6 pp. 58–59, Propositions 6.7–6.8 p. 59, Proposition 6.9 pp. 60–61, Lemma 6.10 p. 62 (proof to p. 64) instead of "Propositions 6.6–6.9 and Lemma 6.10, pp. 59–63"; `ET.4/global-cyclic-base-change` Theorem 3.1 p. 201 (not 202), Theorem 4.2 pp. 202–203, Proposition 4.4 pp. 210–211, Theorem 5.1 pp. 212–213; `ET.4/cyclic-automorphic-induction` Theorem 6.2 p. 215 and Corollary 6.5 p. 218 (proof continues on p. 219) instead of "pp. 216–219".
- The reader replaces extraction-item and erratum identifiers in target prose (for example "confirmed erratum E74 of the CS17 extraction" in `ET.5/transfer-at-p`) by references to the section *Corrections used by the targets*; the packets keep the identifiers.

No ET.4–ET.6 target cites a target of ET.6a–ET.7 as a prerequisite; ten ET.4–ET.6 targets name downstream consumers in their `uses` notes or prose (for example `ET.5/transfer-at-p` names `ET.7b/newton-reduction`), which is consumer bookkeeping except for the proof-order obligation in item 5 below.

The supplier check also confirmed the residual contracts the reader already states under *Remaining supplier and proof obligations*: the existence of weak base change for the exact U(V) standard data (`ET.7a/cohomological-base-change`), the non-tempered Langlands-quotient rule of local unitary base change (`ET.7a/local-unitary-base-change`), and the even-rank special-maximal S/S′ comparison with its local c_v calculation (`ET.7a/definite-indefinite-switches`, `ET.7a/oldform-dimensions`). No ET.4 target states them; they belong to the ET.4 revision or stay recorded as contracts.

## What the roadmap still needs

From the ET.4 review (#9717) and its handoff, all stated in the reader:

1. Plan, in this roadmap at its own tier, the inputs the review found missing after it removed the citations of higher-tier roadmaps (IgusaVarietiesAndTorsionConcentration IG.0–IG.1, tier 19; BunGAndNewtonStrata BG0–BG1, outside the 94): the algebraic σ-conjugacy, B(G), J_b, Newton and decency prefix, and the early Igusa geometry (central leaves, liftable torsors, perfect tower, rational Euler class) that ET.5's fixed-point and counting targets use; then the geometry of the Igusa trace correspondences (boundary and leg checks for the EDC.8 trace theorem).
2. Representability and projectivity at Drinfeld level for the division-algebra Shimura varieties (PELModuli M2 gives an algebraic space and properness at good level only), and the formal/algebraic nearby-cycle comparison and Drinfeld-level deformation theory (requests to R07.2, H1, LPV.6).
3. The multiplicity-one newvector statement used in Scholze's Corollary 11.5 (request to SmoothRepresentationsOfLocalGroups SR.5).
4. The segment-pair L- and ε-factors with monodromy and conductor needed for the full Weil–Deligne correspondence (request to AutomorphicLFunctionsAndLocalFactors AL.3).
5. The proof-order obligation between `ET.5/transfer-at-p` and `ET.7b/newton-reduction` (an early normalized Jacquet/JL composite, or a split of the geometric transfer from its representation-trace assertion), and the early rational Igusa object before ET.5's fixed-point theorem (ET.6a proposal 4).
6. The unread primary proofs listed per target ("Open after the independent review") and in the gaps below.

## Maintainer actions

1. Queue the revision round of ET.4–ET.6 (`BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4~2`, outputs the `--ET.4` packet, reader and Suggested file, with its independent review). `make_queue.py` will not create it by itself: the job is not in `plan_prompts`, since `research/blueprint/prompts/BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4.md` is absent. The worklist is the ET.4 review handoff (`handoff/REV-EndoscopicTransferAndUnitaryTraceComparison--ET.4.md`) and "What the roadmap still needs" above.
2. When that revision is accepted, the ET.4–ET.6 sections of the combined reader must be brought into line with the revised packet (re-render those sections; the per-node open notes go away with the gaps they record) and the Suggested file's ET.4–ET.6 part rechecked. Either reopen this assembly for that, or let the package job take ET.4–ET.6 from the accepted packet.
3. The issue body of #226 names the ET.0 and ET.4 packets as editable; the queue entry names ET.0 and ET.6a, and its `after` list omits the ET.4 review. The queue was followed.
4. Source-issue identifiers collide between parts (`ET.4/E2` is the inverse-transpose involution, `ET.6a/E2` the missing negative-height components); a registry owner must renumber one without dropping either.
5. The restructure proposals collected below (11 groups) await decisions; ET.4 proposal 1 (sub-layer ET.4b for cyclic base change and automorphic induction) is already reflected in the prerequisites (ET.7a imports the ET.4 owners).

## Checks run in this run

- `python3 scripts/check_blueprint.py <packet> --index …/declarations.tsv` on all three part packets: **0 errors, 0 warnings** each (ET.0 61 nodes complete; ET.4 69 nodes partial; ET.6a 50 nodes complete).
- `lean-check suggested/EndoscopicTransferAndUnitaryTraceComparison.lean` (Mathlib 082e2d37e8, shared build): **exit 0, 53 warnings, all `declaration uses 'sorry'`**; `scripts/check_sorry_data.py`: no sorry-bodied data.
- Reader against packets (scripted, 4,037 fields: statements, hypotheses, proof steps, acceptance, API names and statements, test names and statements, prerequisites, locators): every target has its anchor; the 24 remaining differences are the deliberate reader edits described above (extraction identifiers removed, Arthur–Clozel locators refined, erratum identifiers replaced by references to the corrections section). Prerequisite lists of ET.4–ET.7 targets agree exactly.
- Internal graph: 180 nodes, 604 distinct edges, acyclic, stage-monotone.
- `python3 research/blueprint/intake.py check-files` on the five changed files: 0 problems; `git diff --check` clean.

## History of this job

#9701 (`codex-mzqAco`) took the inventory. #9722 (`codex-vEpuUD`) wrote the combined reader from the accepted ET.0 and ET.6a readers and the corrected ET.4 packet (ET.4's part reader is stale: it predates the review), proposed the 29 exact replacements and the two imports, and compiled a 507-line joined draft that it did not submit. #9728 (`codex-gnFnGw`) reconciled ET.0's Tamagawa gap with the ET.4 owner and renumbered the AutomorphicSpectralTheory package sections (§§6.9, 6.18, 6.19). Their detailed records are condensed into the sections below.

## Requests collected without claiming fulfillment

There are **54** original request records: 25 from ET.0, 11 from corrected ET.4, and 18 from ET.6a. Four ET.6a requests are internal contracts (to ET.3, ET.4, ET.5 and ET.6); they are kept unchanged, since after the exact prerequisites they state what those stages still owe the ET.6a–ET.7 consumers. The combined reader groups the other 50 by supplier; the numbered collection below keeps every exact consumer list. A request extends the supplier's scope only when explicitly agreed and planned; it is not evidence that its mathematics already exists.


### ET.0 request 1: `AlgebraicModuliForArithmeticGeometry:R09.4`

For a smooth projective curve X over 𝔽_q, a smooth affine group scheme G over X and a line bundle D: (i) for a G-torsor E on X × S, the stack over Bun_G of sections φ ∈ H^0(X × S, ad(E) ⊗ D) (an abelian cone of a coherent sheaf) is algebraic and locally of finite type; (ii) for a smooth commutative group scheme J over X × S, the Picard stack of J-torsors is algebraic and smooth when H^2 vanishes; (iii) the criterion that an algebraic stack of finite type with finite unramified inertia is Deligne–Mumford. These are the stack inputs of the Hitchin moduli stack, its Picard action and the anisotropic DM statement.

Needed by `ET.2b/hitchin-moduli-stack`, `ET.2b/regular-centralizer`, `ET.2b/picard-stack-action`, `ET.2b/anisotropic-locus`.

### ET.0 request 2: `SchemeAndStackFoundations:SF.2`

The Grothendieck–Lefschetz trace formula over 𝔽_q with Q̄_ℓ coefficients for separated schemes of finite type and its extension to separated Deligne–Mumford stacks of finite type (counting points weighted by 1/#Aut), with compact supports; used to count points of anisotropic Hitchin fibres.

Needed by `ET.2b/hitchin-point-count`.

### ET.0 request 3: `EtaleDualityAndPerverseSheaves:EDC.7`

The decomposition theorem (BBD 5.4.5) and relative hard Lefschetz for a proper morphism f : M → S from a smooth separated Deligne–Mumford stack of finite type over 𝔽_q to a scheme (in Ngô's application M^ani → A^ani, with M^ani a global quotient by a finite-stabilizer action), stated so that EDC.7/decomposition-theorem and EDC.7/relative-hard-lefschetz-theorem, now stated for schemes, apply; Ngô (Remarque 7.5.1) records that the argument carries over. Also the Chebotarev-type principle: two mixed perverse sheaves on a scheme X_0 of finite type over 𝔽_q whose Frobenius trace functions agree at all closed points of X_0 (and its finite extensions) have isomorphic semisimplifications.

Needed by `ET.2b/kappa-decomposition`, `ET.2b/support-theorem`, `ET.2b/endoscopic-comparison`.

### ET.0 request 4: `GlobalShtukasAndFunctionFieldLanglands:GS.1`

Only the geometric prefix of GS.1, without Satake: the fibre of the Beilinson–Drinfeld Grassmannian at a closed point v of X is the affine Grassmannian Gr_v = G(F_v)/G(𝒪_v) as an ind-projective ind-scheme over k(v), with its G(𝒪_v)-action and the closed sub-ind-schemes cut out by integrality conditions; ET.2b builds affine Springer fibres inside it.

Needed by `ET.2b/affine-springer-fibre`.

### ET.0 request 5: `AutomorphicSpectralTheory:AS.6`

The unweighted invariant orbital integral of a semisimple element of a connected reductive group over a local field of characteristic 0 (or a finite product of such): the quotient measure on G_γ^0\G, convergence, invariance, linearity in the measures and the full-centralizer factor [G_γ : G_γ^0] (target AS.6.9 of the AutomorphicSpectralTheory package); and, for real groups, the Clozel–Delorme pseudo-coefficients of discrete series and the Euler–Poincaré test functions with tr π(f_ξ) = Σ_i (−1)^i dim H^i(𝔤, K; π ⊗ ξ) for every finite-length π (targets AS.6.18–AS.6.19). These moved below this roadmap in the upstream order (handoff of PKG-AutomorphicSpectralTheory); ET.1 imports them and keeps the Lie-algebra, descent, packet-average, inner-form and twisted statements.

Needed by `ET.1/orbital-integral`, `ET.1/pseudocoefficients`.

### ET.0 request 6: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`

The Lie algebra 𝔤 of a reductive group scheme with its adjoint representation; used for orbital integrals on 𝔤(F), Shalika germs, the Chevalley quotient and the Kostant section. Centralizers and the regular and regular semisimple loci are not in this layer; they are defined in ET.0/semisimple-conjugacy and ET.2b/chevalley-quotient.

Needed by `ET.0/semisimple-conjugacy`, `ET.1/orbital-integral`, `ET.1/shalika-germs`, `ET.2b/chevalley-quotient`, `ET.2b/kostant-section`.

### ET.0 request 7: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`

Tori, their character and cocharacter modules with Galois action, the Jordan decomposition and centralizers of semisimple elements; used for stable centralizers, Tate–Nakayama and the regular centralizer.

Needed by `ET.0/abelianized-cohomology`, `ET.0/tate-nakayama-tori`, `ET.0/semisimple-conjugacy`, `ET.2b/regular-centralizer`.

### ET.0 request 8: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`

Reductive and semisimple groups with the simply connected cover of the derived group and central isogenies; used for the crossed module [G_sc → G] and abelianized cohomology.

Needed by `ET.0/abelianized-cohomology`, `ET.0/semisimple-conjugacy`.

### ET.0 request 9: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`

Maximal tori, Borel pairs, root data with Galois action, Weyl groups, quasi-split groups and pinnings; used throughout for stable conjugacy, endoscopic data, a-data and χ-data and the Chevalley quotient.

Needed by `ET.0/abelianized-cohomology`, `ET.0/abelianization-theorems`, `ET.0/kottwitz-sign`, `ET.0/inner-twist`, `ET.0/semisimple-conjugacy`, `ET.0/endoscopic-datum`, `ET.0/norm-correspondence`, `ET.1/orbital-integral`, `ET.1/a-data-chi-data`, `ET.2b/chevalley-quotient`, `ET.2b/regular-centralizer`.

### ET.0 request 10: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`

Pinned split reductive groups over ℤ and their automorphisms preserving a pinning; used for quasi-split forms, the Kostant section (regular nilpotent from a pinning) and Out-torsors over a curve.

Needed by `ET.0/inner-twist`, `ET.2b/chevalley-quotient`, `ET.2b/kostant-section`.

### ET.0 request 11: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`

Long exact sequences of continuous cohomology of profinite groups; used for crossed-module cohomology (abelian coefficients; the nonabelian and crossed-module statements are planned in ET.0/crossed-module-galois-cohomology).

Needed by `ET.0/crossed-module-galois-cohomology`.

### ET.0 request 12: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

Hilbert 90 for split tori and Galois cohomology of field extensions; used for Tate–Nakayama, z-pairs and transfer of tori.

Needed by `ET.0/tate-nakayama-tori`, `ET.0/inner-twist`, `ET.0/z-pair`.

### ET.0 request 13: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

Continuous cohomology of profinite groups in all degrees with discrete coefficients; used for Galois cohomology of tori and crossed modules (abelian coefficients; the nonabelian and crossed-module statements are planned in ET.0/crossed-module-galois-cohomology).

Needed by `ET.0/crossed-module-galois-cohomology`, `ET.0/abelianized-cohomology`.

### ET.0 request 14: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`

Cup products in all degrees and the projection formula; used for the Tate–Nakayama isomorphisms.

Needed by `ET.0/tate-nakayama-tori`.

### ET.0 request 15: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-3-tates-theorem-for-a-class-formation`

Tate's theorem (cup product with the fundamental class is an isomorphism Ĥ^r(Γ, ℤ) → Ĥ^{r+2}(Γ, C)) with the scaled inflation formula; ET.0 applies the Nakayama generalization to the cocharacter module of a torus.

Needed by `ET.0/tate-nakayama-tori`.

### ET.0 request 16: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`

The local class formation and fundamental class; used for local Tate–Nakayama for tori.

Needed by `ET.0/tate-nakayama-tori`.

### ET.0 request 17: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`

The local Artin map with its pinned normalization (arithmetic versus geometric Frobenius); transfer factors record which normalization is in force (Kottwitz–Shelstad 2012).

Needed by `ET.1/a-data-chi-data`, `ET.1/local-transfer-factor`, `ET.1/twisted-transfer-factor`.

### ET.0 request 18: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`

The local Weil group W_F, used for L-groups, endoscopic data and the cocycle a_ω.

Needed by `ET.0/endoscopic-datum`, `ET.1/local-transfer-factor`.

### ET.0 request 19: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

Global carriers and the sum-of-local-invariants formula; used for global Tate–Nakayama and ker^1 duality.

Needed by `ET.0/tate-nakayama-tori`.

### ET.0 request 20: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`

The global class formation, idele class groups and global reciprocity; used for global Tate–Nakayama, global χ-data and the character ϖ of the unitary L-morphisms.

Needed by `ET.0/tate-nakayama-tori`, `ET.0/unitary-elliptic-endoscopic-data`, `ET.1/a-data-chi-data`, `ET.1/transfer-factor-properties`.

### ET.0 request 21: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula`

Places, completions and the product formula; used for the global product formula for transfer factors.

Needed by `ET.1/transfer-factor-properties`.

### ET.0 request 22: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient`

Adeles of number fields; used for adelic abelianized cohomology.

Needed by `ET.0/abelianized-cohomology`.

### ET.0 request 23: `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`

Riemann–Roch on a smooth projective curve; used for the dimension of the Hitchin base, Schiffmann's boundedness and the δ-codimension estimate.

Needed by `ET.2b/hitchin-moduli-stack`, `ET.2b/schiffmann-boundedness`, `ET.2b/delta-stratification`, `ET.3/lie-algebra-fundamental-lemma`.

### ET.0 request 24: `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`

The dictionary between function fields and smooth projective curves over finite fields; used for the global curve of the Hitchin fibration.

Needed by `ET.2b/hitchin-moduli-stack`.

### ET.0 request 25: `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

Chebotarev density for number fields (Dirichlet density); used to choose auxiliary split places (Waldspurger's global argument and the global applications of the fundamental lemma) and in ET.0/abelianization-theorems. The layer is stated for number fields only; the comparison of Frobenius traces in the geometric stabilization is a function-field statement, requested from EtaleDualityAndPerverseSheaves:EDC.7.

Needed by `ET.0/abelianization-theorems`, `ET.3/local-transfer-existence`, `ET.3/fundamental-lemma-almost-all-places`.

### ET.4 request 1: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`

Deformation theory of p-divisible groups with O-action over complete local rings with perfect residue field (Grothendieck–Messing or Dieudonné-theoretic form), in the generality of one-dimensional ϖ-divisible O-modules of height n and of D-groups, as used for R_β and for the D-groups of Scholze 2010 §§2, 4 and 7.

Needed by `ET.6/drinfeld-level-deformation-spaces`, `ET.6/norm-maps-and-base-change-identities`.

### ET.4 request 2: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`

Berkovich's nearby cycles for formal schemes locally of finite type over a complete discrete valuation ring and their comparison with algebraic nearby cycles (used for R_β,m and for the Lubin–Tate tower, Scholze 2010 Theorems 2.5 and 11.1).

Needed by `ET.6/drinfeld-level-deformation-spaces`, `ET.6/lubin-tate-comparison`.

### ET.4 request 3: `LefschetzPencilsAndVanishingCycles:LPV.6`

Nearby cycles of schemes over a henselian discrete valuation ring with constructible ℓ-adic coefficients, compatibility with proper pushforward and with completion at closed points (Scholze 2010 Lemmas 9.1–9.2).

Needed by `ET.6/drinfeld-level-deformation-spaces`, `ET.6/division-algebra-shimura-varieties`, `ET.5/igusa-fixed-point-formula`.

### ET.4 request 4: `EtaleDualityAndPerverseSheaves:EDC.5`

The scheme perverse/recollement interface formerly imported through ET.2a:duality-perversity, as the coefficient framework for the Igusa correspondences.

Needed by `ET.5/igusa-fixed-point-formula`.

### ET.4 request 5: `EtaleDualityAndPerverseSheaves:EDC.6`

Coefficient realization of the duality operations formerly imported through ET.2a:duality-perversity.

Needed by `ET.5/igusa-fixed-point-formula`.

### ET.4 request 6: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`

The local Weil group W_F with its topology, inertia, the degree map to ℤ and the norm |·| : W_F → ℝ_{>0}, as the carrier of Weil–Deligne parameters.

Needed by `ET.6/segment-wd-parameter`, `ET.6/llc-characterizing-properties`.

### ET.4 request 7: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`

Import the existing arithmetic-Frobenius reciprocity isomorphism. Define Art_geo(x)=Art_arith(x⁻¹) in W_F^ab and verify the convention used by rank-one LLC. Do not ask the upstream roadmap to replan an already existing geometric-normalized carrier.

Needed by `ET.6/llc-characterizing-properties`.

### ET.4 request 8: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`

Global class field theory for cyclic extensions: the character ω of 𝔸_F^×/F^×N(𝔸_E^×) attached to a cyclic extension E/F.

Needed by `ET.4/global-cyclic-base-change`.

### ET.4 request 9: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`

Maximal tori, Levi subgroups and anisotropic tori of connected reductive groups over ℚ and ℝ, used to define cuspidal groups.

Needed by `ET.4/cuspidal-levi-subsets`.

### ET.4 request 10: `SmoothRepresentationsOfLocalGroups:SR.5`

A precise multiplicity-one GL_n(O)-newvector/type statement for supercuspidals, used by Scholze Corollary 11.5 p. 30; the current mirabolic-derivative definition alone does not supply it.

Needed by `ET.6/lubin-tate-comparison`.

### ET.4 request 11: `AutomorphicLFunctionsAndLocalFactors:AL.3`

An essentially-square-integrable segment-pair L/ε formula with monodromy and conductor correction, and its Langlands-block extension to the chosen nongeneric convention; current rs-local-factor is generic only.

Needed by `ET.6/full-wd-local-langlands`.

### ET.6a request 1: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`

Add an early local p-divisible/formal-module supplier after Dieudonné theory: deformation representability with full Drinfeld levels for one-dimensional formal O_E modules and special O_D modules; SW13 5.1.4, 5.1.6 and 5.2.1 with Hodge–Tate subspace and vector-bundle exact sequence, including the SW20 covariant conversion and O_E-linear specialization. This is an explicit scope-extension request, not a claim that R07.2 already has those local results. Move the local classification out of T2 and assign its FF bundle prerequisites below this supplier. The supplier must extend the Dieudonné interface with these local moduli and classification results. A Part II or an earlier dedicated interface must own this extension.

Needed by `ET.6a/lubin-tate-tower`, `ET.6a/drinfeld-tower`, `ET.6a/infinite-level-moduli`, `ET.6a/basic-modification-functor`, `ET.7b/rational-igusa-object`.

### ET.6a request 2: `PerfectoidSpaces:P5`

Finite-level étale-object descent, the tilde-limit topology and completed affinoid colimit, with compatible descent of compact supports through cofinal levels. Supply the topos-level statement required for equivariant tower cohomology; a space limit alone is insufficient.

Needed by `ET.6a/perfectoid-limit`, `ET.6a/equivariant-cohomology-comparison`, `ET.6a/stein-mittag-leffler`.

### ET.6a request 3: `DiamondsAndVStacks:D6`

The diamond associated to a classical analytic adic space, full faithfulness and compatibility with the marked untilt and group actions for the classical tower-fibre comparison.

Needed by `ET.6a/basic-modification-functor`, `ET.6a/stein-mittag-leffler`.

### ET.6a request 4: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`

Comparison of formal-model generic-fibre nearby cycles with analytic cohomology on finite tower/compact-unitary levels, including pullback, proper trace and Weil descent. Do not use the higher Galois compatibility theorem.

Needed by `ET.6a/equivariant-cohomology-comparison`, `ET.6a/raw-compact-unitary-cohomology`.

### ET.6a request 5: `LefschetzPencilsAndVanishingCycles:LPV.6`

Nearby-cycle functors and the perverse/spectral-sequence formalism on the actual compact unitary integral model with stratum restriction, coefficient local systems and inertia. No Harris–Taylor stratum calculation is assumed to be contained in this general supplier.

Needed by `ET.6a/raw-compact-unitary-cohomology`, `ET.6a/unitary-nearby-cycle-decomposition`.

### ET.6a request 6: `DiamondSixOperations:S2`

Non-quasicompact compactifiable proper-support pushforward and finite étale pullback/trace in all required dimensions n−1, plus the analytic comparison of support functors. The classical H3 curve theory alone is inadequate for n>2.

Needed by `ET.6a/tower-compact-support`, `ET.7b/rational-igusa-object`.

### ET.6a request 7: `AdicCoefficientsAndComparisons:L0`

At a fixed finite level, adic coefficient complexes as derived inverse limits over ell^r, derived reduction and scalar extension, followed by the separate smooth level colimit; no unproved interchange of these limits.

Needed by `ET.6a/tower-compact-support`, `ET.7b/rational-igusa-object`.

### ET.6a request 8: `SmoothRepresentationsOfLocalGroups:SR.0`

Smooth group representations over Λ, equivariant derived complexes with additional abstract W_E action, exact characteristic-zero compact-mod-centre sector extraction, tensor/Hom dual convention, and compatible level colimits.

Needed by `ET.6a/tower-compact-support`, `ET.6a/central-quotient-sector`.

### ET.6a request 9: `SmoothRepresentationsOfLocalGroups:SR.2`

Normalized opposite-parabolic Jacquet functors, normalized induction and trace duality with constant terms, including additivity on Grothendieck groups.

Needed by `ET.7b/newton-reduction`.

### ET.6a request 10: `LocallyAnalyticDistributions:L0`

Locally analytic vectors in the rank-two tower affinoid function spaces, their analytic-radius topology and continuous Lie-algebra differentiation. Pan22’s explicit local-series and Higgs compatibility input must be assigned once within this lower analytic direction.

Needed by `ET.6a/gross-hopkins-vector-fields`, `ET.6a/analytic-vectors-under-duality`.

### ET.6a request 11: `AutomorphicFormsOnReductiveGroups:AF.2`

Cuspidal automorphic representations with unitary central character, normalized restricted tensor products and square integrability modulo the centre.

Needed by `ET.7a/speh-representation`.

### ET.6a request 12: `AutomorphicFormsOnReductiveGroups:AF.5`

For the standard definite unitary datum: identification of the degree-zero cohomology of the Shimura sets with algebraic automorphic forms on the compact-at-infinity unitary group (functions on finite adelic double cosets), compatibly with Hecke operators and with the decomposition into automorphic representations with trivial infinity component. This is the definite case of the oldform count; it is not integral or Igusa concentration.

Needed by `ET.7a/oldform-dimensions`.

### ET.6a request 13: `AutomorphicFormsOnReductiveGroups:AF.4`

Cohomological representations of the real unitary group U(N−1,1)×U(N)^(d−1) and the (g,K)-cohomology (Matsushima) description of the Π-eigenspace of the cohomology of the standard indefinite unitary Shimura variety for relevant Π: every contributing π is cuspidal and tempered, contributes only in degree N−1, and each of the N discrete series with Harish-Chandra parameter {(1−N)/2,…,(N−1)/2} contributes one dimension. Characteristic zero only; not integral or Igusa concentration.

Needed by `ET.7a/oldform-dimensions`.

### ET.6a request 14: `AutomorphicSpectralTheory:AS.4`

The discrete and continuous automorphic spectral decomposition with fixed unitary central character, normalized Langlands quotients, meromorphic normalized Eisenstein intertwiners, their Rankin–Selberg factors and residue calculus. These are inputs to the MW target here; the residual Speh classification in this part supplies the resulting GL discrete data.

Needed by `ET.7a/speh-representation`.

### ET.6a request 15: `EndoscopicTransferAndUnitaryTraceComparison:ET.4`

Independent stable/twisted unitary trace identities with all L-embeddings, transfer factors, measures, Lefschetz infinity functions and normalized intertwiners. Also provide generic unitary packet relevance and multiplicity formulas (Mok/KMSW generic theorem as used in LTXZZ C.3.1), local unitary quotient base change, special-maximal packet comparisons, small-level transfer, and general-type GL4/GSp4 transfer. Relocate cyclic BC/AI to proposed ET.4b before ET.6; neither later Igusa concentration nor AG2/FS agreement may prove these inputs.

Needed by `ET.6a/tower-conventions`, `ET.6a/raw-compact-unitary-cohomology`, `ET.6a/global-extraction`, `ET.7a/cyclic-base-change`, `ET.7a/twisted-spectral-normalization`, `ET.7a/weak-unitary-base-change`, `ET.7a/cohomological-base-change`, `ET.7a/local-unitary-base-change`, `ET.7a/relevant-packet-multiplicity`, `ET.7a/definite-indefinite-switches`, `ET.7a/transferable-level`, `ET.7a/oldform-dimensions`, `ET.7b/csnc-test-functions`, `ET.7b/newton-reduction`, `ET.7b/signed-igusa-trace`, `ET.7/proper-endoscopy-check`, `ET.7a/gsp4-solvable-descent-interface`.

### ET.6a request 16: `EndoscopicTransferAndUnitaryTraceComparison:ET.3`

Associated endoscopic/base-change test functions, local fundamental lemmas and normalized Satake maps for the fixed split, hyperspecial and cyclic unramified cases.

Needed by `ET.7a/cyclic-base-change`, `ET.7a/transferable-level`.

### ET.6a request 17: `EndoscopicTransferAndUnitaryTraceComparison:ET.5`

Independent geometric Igusa trace/stabilization and the explicit effective-Levi/Newton transfer theorem, including signs, opposite Jacquet convention, modulus/character twists, factorization through the inner form and the Frobenius-shift extension from acceptable functions (Shin09 Lemma 6.4). Import the rational-Igusa object after its proposed relocation to early ET.5a before ET.5; the current ET.7b stage label must not be used as an ET.5 prerequisite. This resolves the ordering only once the maintainer applies the move.

Needed by `ET.7b/csnc-test-functions`, `ET.7b/newton-reduction`, `ET.7b/red-trace-duality`, `ET.7b/signed-igusa-trace`.

### ET.6a request 18: `EndoscopicTransferAndUnitaryTraceComparison:ET.6`

Classical characteristic-zero GL_n LLC and JL with division invariant, duality, central character, reciprocity and unramified twists. Audit the independent cyclic BC/AI input and reorder it to ET.4b. Supply elliptic JL character sign and compatibility of local unitary GL quotient parameters; no tower or FS realization is imported to define rec.

Needed by `ET.6a/tower-conventions`, `ET.6a/global-extraction`, `ET.6a/supercuspidal-dat-sector`, `ET.6a/fs-normalization-contract`, `ET.7a/local-unitary-base-change`, `ET.7/division-inner-form-check`.

## Gap collection

The parts have **26** gap records: 5 + 12 + 9. These records are retained below with their full consumer lists. They overlap, and several contain multiple proof obligations; do not report 26 as a count of distinct missing theorems. The partial contracts and the proof-order obligation under "What the roadmap still needs" come in addition. ET.0's stale Tamagawa ownership wording is explicitly reconciled rather than perpetuated.


### ET.0 gap 1: Primary sources cited through secondary statements

The following were not read; the nodes use the statements recalled by sources that were read (named in each node): R. Kottwitz, 'Transfer factors for Lie algebras', Represent. Theory 3 (1999) (the AMS copy refused automated access); J.-L. Waldspurger, 'Le lemme fondamental implique le transfert', Compositio Math. 105 (1997); D. Shelstad's papers on real endoscopy (1982 onwards); Harish-Chandra, 'Invariant eigendistributions on a semisimple Lie group', Trans. AMS 119 (1965); Clozel–Delorme (Invent. Math. 1984; Ann. ÉNS 1990); T. Hales, 'On the fundamental lemma for standard endoscopy: reduction to unit elements' (1995); Deligne–Kazhdan–Vignéras (1984); Lemaire–Mœglin–Waldspurger (2018); Langlands–Shelstad, 'Descent for transfer factors' (1990); Kottwitz 1982, 1984, 1990; Kottwitz–Shelstad, Astérisque 255 (1999); Borovoi, Memoirs AMS 626 (1998); Serre, Galois cohomology; Borel–Serre finiteness of local H¹ (Platonov–Rapinchuk Theorem 6.14). A lemma-level pass should read each and replace the secondary locators.

Needed by `ET.1/lie-algebra-transfer-factor`, `ET.1/fourier-transform-orbital-integrals`, `ET.1/real-character-theory`, `ET.1/real-transfer`, `ET.1/pseudocoefficients`, `ET.1/archimedean-pseudocoefficient-transfer`, `ET.1/transfer-factor-properties`, `ET.3/local-transfer-existence`, `ET.3/group-fundamental-lemma`, `ET.3/inner-form-transfer`, `ET.3/twisted-fundamental-lemma-and-transfer`, `ET.0/endoscopic-datum`, `ET.0/abelianization-theorems`.

### ET.0 gap 2: Hasse principle for adjoint groups: proof not read

Item (f) of ET.0/abelianization-theorems (injectivity of H^1(F, G) → ∏_v H^1(F_v, G) for adjoint G over a number field) is used as a known result by Kisin §4.3.1; its proof (Platonov–Rapinchuk, Chapter 6, not among the cleared chapters 1–5) was not read.

Needed by `ET.0/abelianization-theorems`.

### ET.0 gap 3: Deligne–Mumford versions of the trace formula and the decomposition theorem

Ngô applies the Grothendieck–Lefschetz trace formula and the decomposition theorem to the smooth Deligne–Mumford stack M^ani (Proposition 8.1.13, §6.2, Remarque 7.5.1). The atlas suppliers state them for schemes; requests to SchemeAndStackFoundations SF.2 and EtaleDualityAndPerverseSheaves EDC.7 are recorded. Until they are planned, these two inputs are open. The purity of proper direct images used in ET.2b/kappa-decomposition (a) is also applied to the Deligne–Mumford stack M^ani, while DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6 is stated for schemes; it belongs to the same open input.

Needed by `ET.2b/kappa-decomposition`, `ET.2b/support-theorem`, `ET.2b/hitchin-point-count`.

### ET.0 gap 4: Kottwitz's Tamagawa number formula: ET.4 owner and primary-proof obligation

The formula is a target of EndoscopicTransferAndUnitaryTraceComparison:ET.4/tamagawa-number-formula, which imports ET.0/kottwitz-duality and the Tamagawa measures of AdelicAlgebraicGroups:AA.2. Its primary proof and the simply connected Tamagawa input remain unresolved in the ET.4 packet (primary-source gap; review status needs_changes). The stable coefficients in ET.4/stable-elliptic-distribution and ET.5/stable-igusa-trace-formula consume that named owner. This is a cross-part ownership reconciliation, not fulfillment of the proof obligation or acceptance of ET.4.

Needed by `ET.4/tamagawa-number-formula`.

### ET.0 gap 5: Characteristic hypothesis of the Lie-algebra fundamental lemma

The roadmap text of ET.3 says Ngô's published Lie statement requires p > 2h. The version read (arXiv:0801.0446v3, Théorème 1, p. 1, and the standing assumption of §1.1, p. 9) assumes only that p does not divide |W|. The published version (Publ. IHÉS 111) was not read; the node states the hypothesis of the version read and keeps Waldspurger's separate large-p bound for the change of characteristic.

Needed by `ET.3/lie-algebra-fundamental-lemma`.

### ET.4 gap 1: Arthur's classification inputs

KMSW arXiv:1409.3731v1 §§1.6–1.7 pp. 79–80, 88–89 was read independently: unconditional scope is generic global parameters on pure inner forms; generic global parameters need not be tempered locally (Remark 1.7.2). A precise non-tempered local-packet supplier and the stabilization prerequisites remain open. The full Mok/Gee–Taïbi proof chains were not read; BCGP §1.6 records the remaining twisted weighted fundamental lemma. This is distinct from the proved ordinary twisted spherical fundamental lemma.

Needed by `ET.4/unitary-endoscopic-classification`, `ET.4/gsp4-gl4-transfer`.

### ET.4 gap 2: Harris–Taylor §VI and Kottwitz's simple Shimura varieties read only through citing papers

The base change and descent statements Harris–Taylor Lemma VI.2.10, Theorem VI.2.9 and Corollaries VI.2.7–VI.2.8, and Kottwitz's results on simple Shimura varieties (Invent. Math. 108, 1992), are planned from their statements as used in Scholze 2010 §§8–10 and Shin 2011 §6.2. The Harris–Taylor book is not freely available and is not in the cleared library (the same source-access request as the ET.6a packet). The proofs must be matched with internal locators once a copy is registered; Labesse's Changement de base CM et séries discrètes (2011) is the public alternative for the unitary base change.

Needed by `ET.4/unitary-gl-base-change-descent`, `ET.4/simple-division-algebra-trace-identity`, `ET.6/global-galois-input`, `ET.6/post-correspondence-global-galois`.

### ET.4 gap 3: Primary sources cited through secondary statements

Still unread primary proofs: Kottwitz 1986 Theorem 9.6 and Kottwitz 1988 Tamagawa theorem; Arthur’s twisted invariant formula and Morel §8; Labesse’s twisted Lefschetz construction; full classical Deligne–Kazhdan–Vignéras JL proof; Drinfeld deformation/level theory; Berkovich and Mieda nearby-cycle comparison; Harris non-Galois induction and Henniart characterization. Badulescu 2007 §§2–3 and Scholze §12 were independently read in this review. Scholze Theorem 12.3 uses constructive cyclic descent, not Henniart’s numerical counts.

Needed by `ET.4/tamagawa-number-formula`, `ET.4/elliptic-stabilization`, `ET.4/twisted-trace-formula`, `ET.4/twisted-geometric-side`, `ET.4/archimedean-lefschetz-functions`, `ET.6/local-jacquet-langlands`, `ET.6/non-galois-automorphic-induction`, `ET.6/drinfeld-level-deformation-spaces`.

### ET.4 gap 4: Bushnell–Henniart level-zero formulas not read

The explicit level-zero composite of local Langlands and Jacquet–Langlands (Bushnell–Henniart, J. Number Theory 2011) is stated from its use in Newton–Thorne 2026 (proof of Lemma 3.6) as recorded by the accepted extraction; the twisting characters were not read and the node's statement is only as precise as that use.

Needed by `ET.6/level-zero-explicit`.

### ET.4 gap 5: Truncated constituent criterion beyond degree one

Independently checked in the published AKY 2022 §6.3 Lemma 6.6 pp. 33–34. The displayed derivative order equals the cardinality only when every cuspidal degree is one. This packet keeps precisely that type-χ form. A higher-degree consumer must replace cardinality by the sum of cuspidal degrees and prove the revised criterion; no such generalization is claimed here.

Needed by `ET.6/ladder-and-constituent-theorems`.

### ET.4 gap 6: Missing current-tier algebraic and Igusa geometry

ET is tier 14, IG tier 19, and BG outside the 94. WORKERS.md forbids those upward imports. Plan the required B(G), representable J_b, decency, Newton/Kottwitz maps and slope pieces here, together with the required completely slope-divisible Igusa moduli, finite levels, Hecke actions and Frobenius descent. Each definition requires its own API and three discriminating tests. The review removes the illegal prerequisites but supplies no replacement proof; these nodes are not dependency-closed. Higher BG/IG plans must later import the new owner, not duplicate it.

Needed by `ET.5/acceptable-test-functions`, `ET.5/igusa-fixed-point-formula`, `ET.5/igusa-kottwitz-triples`, `ET.5/p-adic-types`, `ET.5/fixed-points-and-effective-triples`, `ET.5/igusa-counting-formula`, `ET.5/stabilization-away-from-p`, `ET.5/jb-endoscopic-levi-data`, `ET.5/transfer-at-p`, `ET.5/igusa-endoscopic-test-function`, `ET.5/stable-igusa-trace-formula`, `ET.5/acceptable-functions-determine`, `ET.5/unitary-igusa-trace-formula`.

### ET.4 gap 7: Trace-correspondence boundary and normalization supplier

EDC.8/fujiwara-varshavsky-trace-formula requires the actual leg properness/quasi-finiteness and a compactification with invariant boundary; EDC.8/frobenius-twist-contracting is the general theorem, not the Igusa application. Supply the geometry and the correct volume-normalized double-coset trace. Ordinary Shimura triple weights in Scholze §9 also require their own Kottwitz coefficient/effectivity supplier; Shin 2009 Remark 13.3 does not identify the indexing sets.

Needed by `ET.5/igusa-fixed-point-formula`, `ET.6/drinfeld-level-point-count`.

### ET.4 gap 8: Formal geometry and Drinfeld-level representability

R07.2, LPV.6 and the requested H1 formal-adic comparison are stage-level requests, not exact supplying nodes. Plan or resolve formal deformation and level regularity, algebraization along a finite subscheme and the Berkovich comparison. PELModuli:M2/representability only gives a smooth algebraic space at good level, and M2/properness-when-division only properness at good primes; they do not prove projective Drinfeld-level representability. Name a precise projectivity/Drinfeld-level supplier with the determinant condition.

Needed by `ET.6/drinfeld-level-deformation-spaces`, `ET.6/norm-maps-and-base-change-identities`, `ET.6/division-algebra-shimura-varieties`, `ET.6/lubin-tate-comparison`.

### ET.4 gap 9: Missing archimedean base-change and Hecke-character realizations

Strong cyclic base change needs all archimedean components as well as the local nonarchimedean theorem. Scholze §13 Lemmas 13.3–13.4 require the archimedean GL_n parameter dictionary and ℓ-adic realizations of algebraic Hecke characters, not just finite cyclic reciprocity. Supply those precise imports and normalization conversions.

Needed by `ET.4/global-cyclic-base-change`, `ET.6/non-galois-automorphic-induction`.

### ET.4 gap 10: Zelevinsky dual algorithm primary proof

Zelevinsky 1980 §9 pp. 199–203 does not prove the later Mœglin–Waldspurger algorithm. AKY §2.3 pp. 7–8 uses the dual with references. Read a primary proof of the algorithm, state it exactly and plan its inputs before claiming the algorithm is established.

Needed by `ET.6/zelevinsky-classification`, `ET.6/multisegment-operations`.

### ET.4 gap 11: Lubin–Tate multiplicity-one newvector input

Scholze Corollary 11.5 p. 30 uses a GL_n(O)-representation occurring with multiplicity one in π∨. None of the direct suppliers states that newvector theorem. Add its precise primary statement and supplier to obtain the integrality needed by Lemma 3.2(iii).

Needed by `ET.6/lubin-tate-comparison`.

### ET.4 gap 12: Full Weil–Deligne segment-pair factors and conductor

The supercuspidal equality of factors in Scholze §14 is insufficient for the asserted full theorem. Need the essentially-square-integrable segment-pair L/ε formula including ker N and the monodromy conductor correction, then multiplicativity over Langlands blocks and the nongeneric factor convention. AL.3/rs-local-factor is stated for generic inputs. Equality of semisimple cuspidal support cannot prove this: St₂ and 1 have different monodromy. Read and cite the relevant primary factor proof; Zelevinsky §10 is not that proof.

Needed by `ET.6/full-wd-local-langlands`.

### ET.6a gap 1: Harris–Taylor and Boyer primary proof access

The full Harris–Taylor book is neither cleared in atlas-library/INDEX.md nor freely accessible from an authorized copy found in this run. Dat credits Theorem 4.1.2 to Boyer and proves it by translating notation and applying Boyer’s theorem; Boyer’s computation (arXiv:math/0511531, freely available; Invent. Math. 177 (2009)) rests on Harris–Taylor’s global realization. Neither Boyer’s paper nor the Harris–Taylor book has been read for this plan. The raw compact unitary integral model, Newton-stratum nearby-cycle decomposition, global extraction, actual supercuspidal concentration and scalar normalization have a target-level plan but no independently read book proof or precise internal theorem/page locators. Obtain/register the book, then match its exact statements and proof chain. The packet is planned, not source_decomposed or closed.

Needed by `ET.6a/raw-compact-unitary-cohomology`, `ET.6a/unitary-nearby-cycle-decomposition`, `ET.6a/global-extraction`, `ET.6a/supercuspidal-dat-sector`.

### ET.6a gap 2: Independent Dat-to-FS action dictionary

The literal Dat sector and Weil contragredient are stated exactly. FS IX.7.4 witnesses the requested normalized Hecke outputs but cannot independently prove their convention conversion. Read the Harris–Taylor dictionary and check the source-torsor right actions, contragredient, inverse transpose, central quotient, [n−1] and ((n−1)/2) normalization before certifying the FS export. An arithmetic/geometric Frobenius substitution alone cannot invert an arbitrary nonabelian Weil representation.

Needed by `ET.6a/fs-normalization-contract`.

### ET.6a gap 3: Early local formal-module and classification supplier

R07.2 currently plans Dieudonné theory, not the entire O_E/O_D deformation/classification interface requested here. The SW13 local classification and SW20 sign conversion must move below the tower and below relative T2. The general representation of the special O_D formal moduli also needs its primary proof (Drinfeld/Rapoport–Zink or the source explicitly proving the specialization); SW13 duality alone is not that integral representability proof. FiniteFlatGroupsAndIntegralPadicHodgeTheory is now TauCetiRoadmap pull request #879, whose R07.2 stops at Dieudonné theory over perfect valuation rings (R07.2.29); the classification can only be added there, in a Part II, or planned in ET.6a.

Needed by `ET.6a/lubin-tate-tower`, `ET.6a/drinfeld-tower`, `ET.6a/infinite-level-moduli`, `ET.6a/basic-modification-functor`.

### ET.6a gap 4: Primary pure-transfer and packet proofs

LTXZZ 3.2.8 cites Shin’s cohomological base change (their reference [72], Theorem 1.1) and, for definite V, Labesse (their reference [42], Corollaire 5.3), C.3.1 cites the generic KMSW classification, and D.2.2 cites Morel/small-level transfer. Their exact consumer statements were read, but this part does not certify those independently unread primary proofs. ET.4 must supply the requested independent pure-transfer, generic packet, small-level and GSp4 classification contracts. Local LLC in ET.6 does not automatically supply all global unitary packet members.

Needed by `ET.7a/cohomological-base-change`, `ET.7a/relevant-packet-multiplicity`, `ET.7a/definite-indefinite-switches`, `ET.7a/transferable-level`, `ET.7a/oldform-dimensions`, `ET.7a/gsp4-solvable-descent-interface`.

### ET.6a gap 5: Early cyclic base-change ordering repair

The confirmed langlands red-team finding /1 identifies a classical LLC route in ET.6 that already needs cyclic base change. The current stage placement of BC/AI in ET.7a is therefore too late. These target nodes remain in this issue’s current scope but are marked for relocation to a new ET.4b after ET.3/4 and AS.6, before ET.6; there is no ET.7a→ET.6 prerequisite in this packet. This ordering proposal is not an integrated atlas change and must be applied before packaging.

Needed by `ET.7a/cyclic-base-change`, `ET.7a/cyclic-automorphic-induction`, `ET.6a/global-extraction`, `ET.6a/supercuspidal-dat-sector`.

### ET.6a gap 6: Early Igusa geometry and rational trace move

The higher IG.0/IG.1 packet already records the central leaf, liftable torsors, Mantovan/perfect tower and rational Euler class. WORKERS requires their early clauses to move down to this part and be relocated to an ET.5a supplier before ET.5. Leaving the object under ET.7b while importing the entire ET.7b stage into ET.5 would create a cycle: the signed trace target already imports ET.5. The lower PEL/finite-flat suppliers must cover the exact p-divisible isomorphism and liftable-automorphism proofs, including CSnc 2.2.7 and CS17 4.3.15 used in their construction. Redirect those higher clauses to the early node; compactified fibres, integral cohomology and concentration remain IG.

Needed by `ET.7b/rational-igusa-object`, `ET.7b/signed-igusa-trace`, `ET.7b/rational-trace-export`.

### ET.6a gap 7: Exact Newton-transfer conventions and acceptable extension

CS17 and Shin expose the reduction construction and trace identity. The primary transfer identities and the Frobenius-shift extension used by CSnc cite Shin09/10 and signed inner-form JL. ET.5 must match the complete CSnc normalization, including its modulus/character twist and every effective Levi embedding. The span proof intentionally drops some signs; it cannot supply the exact signed constants on its own.

Needed by `ET.7b/newton-reduction`, `ET.7b/red-trace-duality`, `ET.7b/signed-igusa-trace`, `ET.7b/local-factorization`.

### ET.6a gap 8: Analytic local-series and Higgs input

Pan v1 5.2.8 refers to Pan22 for its full local-series proof and explicitly notes an additional Higgs-field compatibility check on the toric chart. This was not independently proved here. The lower analytic supplier must provide the input and the explicit normalization constant in the operator comparison must remain nonzero but unspecified until coordinates are fixed. Publication-number correspondence for the 2026 Annals version has not been checked.

Needed by `ET.6a/analytic-vectors-under-duality`.

### ET.6a gap 9: All-dimensional support comparison

The classical curve compact-support roadmap H3 cannot alone construct C_T for arbitrary n. The lower diamond support and coefficient bundle must provide the all-dimensional analytic/tower topos support comparison and its equivariant cofinal descent. The Dat result is a target theorem with its proof route, not a claim that generic perfectoid limit machinery already proves it.

Needed by `ET.6a/tower-compact-support`, `ET.6a/equivariant-cohomology-comparison`.

## Ownership proposals collected

There are **13** raw restructure proposals. ET.4/1 and ET.6a/1 describe the same early cyclic-transfer owner; ET.4/4 and ET.6a/4 overlap on the early unitary/Igusa prefix. That gives **11 proposal groups**, with the current-tier correction from #9717 taking precedence over any older suggestion to rearrange tiers. None is implemented by this assembly, except the import halves already recorded: ET.7a cites the ET.4 owners of cyclic base change and automorphic induction (ET.4 proposal 1, ET.6a proposal 1) and `ET.6a/lubin-tate-tower` cites `ET.6/drinfeld-level-deformation-spaces` (ET.4 proposal 3). Keep the proposals and their exact consumer interfaces for the maintainer; do not apply changes to upstream, other packets or atlas data here.


### ET.0 proposal 1: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`, `BunGAndNewtonStrata`.

The paper route from Hansen–Kaletha–Weinstein assigns to ET.0 the isocrystal invariant inv[b](g, g′) ∈ B(T) of related elements and its properties. Items 021 (Steinberg's relatedness lemma) and 119 (the dual-group formula for the Kottwitz sign) are planned in ET.0. Items 022–023 need the Kottwitz set B(T) and the map κ : B(G) → π_1(G)_Γ, owned by BunGAndNewtonStrata BG0–BG1; BG1 imports ET.0 (abelianization, local cohomology), so planning them in ET.0 would create the stage cycle ET.0 → BG1 → ET.0, and BG0 itself rests on Fargues–Fontaine and diamond inputs that a characteristic-zero group-cohomology layer should not import.

Route PAPER-HANSEN-KALETHA-WEINSTEIN-22/022 and /023 to BunGAndNewtonStrata:BG1, which imports ET.0/rational-classes-in-stable-class for Steinberg's relatedness and ET.0/kottwitz-duality; no change to ET.0's scope.

### ET.0 proposal 2: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`, `AnabelianGeometryAndNonabelianChabauty`.

AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1 (accepted) plans nonabelian H¹ of a profinite group with coefficients in a topological group. ET.0 does not import it: in the upstream order of research/blueprint/upstream/CaraianiNewton.md AnabelianGeometryAndNonabelianChabauty is tier 16 and this roadmap tier 14, so the citation would point upward, and NC.3 is downstream of ET.0 in the promoted atlas (ET.0 → AutomorphicSpectralTheory:AS.2 → AS.6 → GL2AutomorphicRepresentationsAndTransfer:R17.3 → AutomorphicGaloisRepresentations:R19.2 → WeightsInEtaleCohomology:R34.3 → PadicHodgeTheory:R06.5 → AnabelianGeometryAndNonabelianChabauty:NC.2 → NC.3), so the import would also close a stage cycle. ET.0/crossed-module-galois-cohomology therefore plans the discrete-coefficient case (the crossed module 1 → H): the notion moves down.

Make ET.0/crossed-module-galois-cohomology the owner of nonabelian Galois H¹ with discrete coefficients and have NC.3/nonabelian-h1 import it, keeping in NC.3 only the extension to non-discrete topological coefficient groups; alternatively move both into a layer extending the upstream ProfiniteCohomology roadmap. Either way record one owner.

### ET.0 proposal 3: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`, `GlobalShtukasAndFunctionFieldLanglands`, `FunctionFieldArithmetic`.

Red-team finding RT-AREA-langlands-1/12: Bun_G of the global curve, the affine Grassmannian and function-field adeles are owned by GS.0, GS.1 and FA.2; the ET.2b text still says 'Construct' for the first two.

Owners: Bun_G → GlobalShtukasAndFunctionFieldLanglands:GS.0 (formerly also described in ET.2b); the affine Grassmannian at a point → the geometric prefix of GS.1 (fibre of the Beilinson–Drinfeld Grassmannian, without Satake); function-field adeles and G(K)\G(𝔸_K) → FunctionFieldArithmetic:FA.2/FA.6. Add the stage edges GS.0 → ET.2b, GS.1 → ET.2b and FA.2 → ET.3, and narrow the ET.2b text to 'import Bun_G and the affine Grassmannian; construct the Higgs, Hitchin, Picard, affine Springer and support geometry'.

### ET.0 proposal 4: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`.

Corrections to the roadmap text that this plan cannot make itself: (1) ET.3 states that Ngô's published Lie-algebra theorem needs p > 2h, while the version read assumes p ∤ |W|; (2) ET.5 calls the general twisted fundamental lemma unproved, while Waldspurger (Théorèmes 1.8, 4.11) with Ngô's non-standard fundamental lemma proves it for unit elements and Lemaire–Mœglin–Waldspurger for the spherical Hecke algebra (red-team finding RT-AREA-langlands-1/13).

In ET.3 state the hypotheses as 'p ∤ |W| for the equal-characteristic Lie-algebra theorem (as in the version read; confirm against the published version), and p large relative to G for Waldspurger's change of characteristic and descent'. In ET.5 replace the sentence by 'the route does not need the twisted fundamental lemma; it is proved (ET.3/twisted-fundamental-lemma-and-transfer)'.

### ET.0 proposal 5: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`, `AutomorphicSpectralTheory`.

RT-AREA-automorphic-1/24 made ET.1 the single owner of unweighted orbital integrals and AS.6 their consumer. The upstream order puts AutomorphicSpectralTheory in tier 13 and this roadmap in tier 14, so the AutomorphicSpectralTheory package planned the invariant orbital integral (AS.6.9), the discrete functionals and pseudo-coefficients (AS.6.18) and the real Euler–Poincaré test functions (AS.6.19) itself and asked this roadmap to import them (PKG-AutomorphicSpectralTheory handoff, "Upward citations"). The promoted AutomorphicSpectralTheory packet still requests them from ET.1.

Owners: the group orbital integral, its quotient measure and convergence, pseudo-coefficients and the Euler–Poincaré trace identity → AutomorphicSpectralTheory:AS.6 (formerly ET.1); Waldspurger's normalization, transport of centralizer measures, Lie-algebra and nilpotent orbital integrals, semisimple descent, packet averages of pseudo-coefficients with their orbital integrals, and the inner-form and twisted versions → ET.1. Retarget the AutomorphicSpectralTheory packet's requests 12 and 13 (to ET.1) as self-supplied when its package corrections are carried into the packet, and draw the edge AS.6 → ET.1.

### ET.4 proposal 1: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`, `GL2AutomorphicRepresentationsAndTransfer`.

Confirmed RT-AREA-langlands-1/1: Scholze's proof of the local correspondence (ET.6) needs Arthur–Clozel local cyclic base change (§12), Harris–Taylor/Clozel unitary base change (§10) and automorphic induction (§§13–14) before ET.6, but ET.7a, which held them, requires ET.6. The ET.6a packet makes the same proposal.

Create the sub-layer ET.4b 'Cyclic base change and automorphic induction for GL_n' after ET.4 (requiring AutomorphicSpectralTheory:AS.6, ET.3 and ET.4) with the nodes ET.4/local-cyclic-base-change, ET.4/global-cyclic-base-change, ET.4/cyclic-automorphic-induction and ET.4/unitary-gl-base-change-descent of this packet; add edges ET.4b → ET.6, ET.4b → ET.7a and ET.4b → GL2AutomorphicRepresentationsAndTransfer:R17.4, which then specialises to GL_2. The ET.6a packet's ET.7a/cyclic-base-change and ET.7a/cyclic-automorphic-induction become imports of these nodes (single owner ET.4b); ET.7a keeps the unitary cohomological transfer and the residual Speh classification.

### ET.4 proposal 2: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`, `SmoothRepresentationsOfLocalGroups`.

Confirmed RT-AREA-langlands-1/15: no stage below ET.4 and ET.6 plans Harish-Chandra's p-adic character theory, twisted characters or the Weyl integration formula. SmoothRepresentationsOfLocalGroups is a Tau Ceti roadmap and its Part II (design job DESIGN-SmoothRepresentationsOfLocalGroupsPartII) does not exist yet.

Plan the early character prefix once, here: ET.4/padic-character-distributions and ET.4/twisted-characters. When SmoothRepresentationsOfLocalGroupsPartII is designed, its early character layer should either import these two nodes or take them over as owner, in a tier below this roadmap, with ET.4 and ET.6 importing; either way there is one owner, and the late excursion-dependent SR.6 material stays out of the prefix.

### ET.4 proposal 3: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`.

Finite-level Lubin–Tate deformation spaces with Drinfeld level structure are needed by ET.6 (Scholze 2010 §2), while ET.6a/lubin-tate-tower restates the same deformation functor for the tower and depends on the stage ET.6.

ET.6/drinfeld-level-deformation-spaces owns the finite-level spaces; ET.6a/lubin-tate-tower imports it and keeps only the rigid generic fibres, the tower and its actions.

### ET.4 proposal 4: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`, `IgusaVarietiesAndTorsionConcentration`, `BunGAndNewtonStrata`, `AutomorphicGaloisRepresentationsPartII`.

Upward citations in research/blueprint/upstream/CaraianiNewton.md: ET.5 imports accepted IG.0–IG.1 nodes (IgusaVarietiesAndTorsionConcentration, tier 19) and BG0–BG1 nodes (BunGAndNewtonStrata, outside the 94; RT-AREA-geomlanglands/32). ET.6 no longer imports AutomorphicGaloisRepresentationsPartII:AG2.1a: the Drinfeld-level point count of Scholze §9 for the division-algebra data is planned here (ET.6/division-algebra-shimura-varieties, ET.6/drinfeld-level-point-count), a different datum from AG2.1a's compact Shin instance at good reduction. Independent review 2026-10-14: merely proposing an earlier supplier package did not satisfy the binding current-tier rule.

Under WORKERS.md the required algebraic σ-conjugacy and early Igusa-geometry notions must move down into EndoscopicTransferAndUnitaryTraceComparison. This review removes the upward prerequisites and records the missing local targets as a gap. It does not implement the ownership move or alter either higher roadmap; the revision must plan the needed prefix here, then the maintainer must repoint BG/IG consumers to the new owner.

### ET.6a proposal 1: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`.

Confirmed RT-AREA-langlands-1/1: ET.6 classical LLC needs cyclic BC/AI currently placed after it.

Create ET.4b after ET.3/ET.4 and AS.6, requiring AutomorphicSpectralTheory:AS.6, ET.3 and ET.4. Move cyclic-base-change (with Arthur–Clozel Chapter I §6: Theorem 6.2, Proposition 6.7, Lemma 6.10) and cyclic-automorphic-induction (Chapter III §§4 and 6) there, and add Harris–Taylor’s base change from their unitary group (Harris–Taylor §VI: VI.1.1, VI.2.1, VI.2.9–VI.2.10), which this part could not read. Add the edges ET.4b→ET.6, ET.4b→ET.7a and ET.4b→GL2AutomorphicRepresentationsAndTransfer:R17.4. ET.6 itself still needs explicit targets for Harris’s non-Galois automorphic induction (Scholze, Local Langlands for GL_n, §13) and Henniart’s highly-ramified-twist argument (§14). Keep ET.7a pure cohomological unitary transfer and residual Speh comparison. The current packet retains the assigned scope pending this decision.

### ET.6a proposal 2: rescope

Roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, `IntegralRelativeFarguesFontaine`, `EndoscopicTransferAndUnitaryTraceComparison`.

Confirmed RT-AREA-padic-1/25: SW13 local classification must precede T2 and the towers.

Add an early local p-divisible stage after R07.2, with the independent geometric FF bundle classification and the SW13 5.1.4/5.1.6/5.2.1 proof chain; route T2, IG.3 and ET.6a to it. Do not import relative T2 back into the classical tower construction. FiniteFlatGroupsAndIntegralPadicHodgeTheory is now TauCetiRoadmap pull request #879, so the new stage is either an addition to that pull request or a Part II of it; planning the classification in ET.6a is the alternative if neither is wanted.

### ET.6a proposal 3: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`, `HeckeStacksAndLocalShtukas`, `HeckeStacksAndLocalShtukasIntegralPartII`.

Confirmed RT-AREA-geomlanglands/2 and current HS3/classical-comparison overlap: tower comparison needs one owner and direction.

ET.6a owns the narrow basic minuscule fibre and the LT/Dr specialization of SW20 24.2.5/24.3.5. Redirect HS3 tower clauses and ES7 to these nodes. General HS2 local-shtuka construction and the general EL/PEL integral comparison remain with their owners. No ET.6a→HS3 dependency; HS3 and ES7 consume ET.6a. Delete the atlas stage edge HeckeStacksAndLocalShtukas:HS2→ET.6a: no ET.6a node uses HS2 (the basic fibre is built from FarguesFontaineDiamonds F4 and DiamondsAndVStacks D6), and HS2 lies outside the Caraiani–Newton tiers. Point ES7:GLn-comparison’s import sentence and HS2’s “match with known local Shimura moduli” clause at ET.6a/classical-tower-fibre-comparison.

### ET.6a proposal 4: rescope

Roadmaps: `EndoscopicTransferAndUnitaryTraceComparison`, `AutomorphicGaloisRepresentationsPartII`, `IgusaVarietiesAndTorsionConcentration`.

WORKERS upstream tier rule moves higher raw geometry and rational Igusa inputs down before ET.

Move only the early compact-unitary raw model/cohomology clauses of AG2.1a and the central-leaf/Mantovan/perfect-tower/rational Euler-class clauses of IG.0/IG.1 needed by this part to ET.6a and a proposed early ET.5a rational-Igusa supplier before ET.5, respectively. The rational object is retained in the assigned ET.7b scope until that move is approved; the trace theorem stays ET.7b. Higher stages import these nodes; global Galois representations, boundary localization, compactified fibres, integral concentration and residual applications stay with AG2/IG.

## Source versions and citation corrections

The reconciliation reading of #9722 (2026-10-14) covered Arthur–Clozel Ch. I §6 and Ch. III §§1–6 at the relevant theorem pages; Dat §§2.2 and 4.1–4.2 at the stated normalization/sector loci; Shin 2010 §6 (6.8)–(6.10); and Caraiani–Scholze noncompact §§5.4–5.6. The authorized LTXZZ published copy was read in place at Appendix C.1, pp. 351–354; Lemmas C.2.4–C.2.5 and their proofs, pp. 360–363; Proposition C.3.1 and Corollaries C.3.2–C.3.3, pp. 363–364. These readings test the reconciliation points; they are not a fresh complete review of every inherited primary source. No restricted file or passage was saved or copied. Harris–Taylor remains uncleared and unread.

The public copies freshly fetched for this run are identified below. The input packets retain their own source manifests. In particular the author PDF and arXiv CSnc copies have different hashes, and editions with different numbering remain distinct.

| Source | Public copy | SHA-256 |
| --- | --- | --- |
| AC | [AC](https://www.claymath.org/library/cw/arthur/pdf/30.pdf) | `3033d863634f5a1e8c26e48ba5b5ec9d8f95fb411b2a6d21c1580db80bc01737` |
| Dat | [Dat](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf) | `4973a260e5af4b046652956ad63e95a412fb82873cdecc6bd585c85e1aa4a04d` |
| Shin10 | [Shin10](https://math.berkeley.edu/~swshin/StableIgusa.pdf) | `e74cbbe4463f003b8ae2eb10636744c7ae032d25a566f8b441004c7f14e2faf0` |
| CSnc | [CSnc](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf) | `9c9b723d20f35af25f45c236224fb3a4d72c57379ea54759a3b609f4092d8eb5` |


Arthur–Clozel's Clay scan uses **printed page = one-based PDF page − 16**. The combined reader corrects these exact citations: Ch. I Theorem 6.2 starts on p. 51; Proposition 6.6 pp. 58–59, 6.7–6.8 p. 59, 6.9 pp. 60–61, Lemma 6.10 pp. 62–63. Ch. III Definitions 1.1–1.2 p. 199, Theorem 3.1 p. 201, Definition 4.1/Theorem 4.2 pp. 202–203, Proposition 4.4 pp. 210–211, Theorem 5.1 pp. 212–213. Definition 6.1/Theorem 6.2 p. 215, proof pp. 215–217, Lemma 6.4 pp. 217–218, Corollary 6.5 p. 218 with proof continuing on p. 219. These are locator corrections, not replacements of the theorem's hypotheses. Both cyclic-transfer occurrences use the corrected edition. This run re-verified every Arthur–Clozel page above on the Clay scan (same SHA-256) and carried the ET.7a locator into the ET.6a packet; the ET.4 packet keeps the old locators until its revision.

The bibliography corrects the noncompact paper's title to *On the generic part of the cohomology of non-compact unitary Shimura varieties*. The compact paper is separately named. Identical URL/title entries are deduplicated; editions with different page numbering remain. Short labels such as AC, Dat, CSnc, CS17, SW13, SW20, FS, LTXZZ and Shin in the target prose refer to those named bibliography entries, not to independent unregistered sources.

The part-local source-issue identifiers collide: **ET.4/E2** is the inverse-transpose involution, while **ET.6a/E2** is the missing negative-height components. Keep both findings and their original review provenance; a registry owner must reconcile the identifiers without overwriting either record. The own-word appendix distinguishes the endoscopic-index correction, involution, integer heights, Dat degree range, Red modulus and infinity coefficients. The earlier braided-crossed-module and aggregate-Hecke-character corrections remain in the corresponding targets. The possible effect of the Red correction on CSnc Theorem 5.1.2's final parameter assertion, p. 77, remains open.

## Libraries and current-owner audit

Elaboration used Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The roadmap ownership audit read the current read-only TauCetiRoadmap at `0d144d044dacebca17b654695b6f1ad58f159b27` and the current read-only Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These current-owner revisions differ from the elaboration pins. No Lake command was run in either read-only checkout.

Read the roadmap's library-coverage audit; it has no direct ET acceptance record. Narrow declaration searches in the current library found no exact named ET carriers; that is not a certification that every related notion is absent. Existing ReductiveGroupsPartII's z-extensions, algebraic π₁, Kottwitz homomorphisms, dual/L-groups and the current SmoothRepresentations induction, Jacquet, Satake and conditional Langlands-classification interfaces are imports. LocalGaloisGroups' marked presentations/orientations and IntegralLattices' arithmetic quadratic-lattice carriers were checked for overlap. Do not replan them, or interpret arithmetic lattice infrastructure as the missing affine Springer or unitary S/S′ theorem. Current HeckeStacksAndLocalShtukas and its integral continuation retain general Hecke/shtuka and integral comparison; ET.6a's proposed classical basic-minuscule specialization is narrower.

The baseline statements were opened at the pin, rather than inferred from declaration names: `Matrix.charpoly`, `Matrix.charpoly_monic`, `Polynomial.discr`, `MeasureTheory.Measure.IsHaarMeasure`, `LaurentSeries`, `PowerSeries`, `Matrix.IsHermitian`, `Matrix.trace` and `Matrix.trace_diagonal`. The Haar predicate supplies local Haar properties, not Tamagawa/quotient measures, character integrability or Weyl integration. The Suggested file uses those real matrix/series/finite-sum carriers and abstract algebraic cochains only.

The adjacent AutomorphicSpectralTheory package update arrived with main during this run; the current §§6.9, 6.18–6.20 were read directly. This is an atlas package awaiting its own upstream process, not a claim that those future APIs are already in the Tau Ceti library.
