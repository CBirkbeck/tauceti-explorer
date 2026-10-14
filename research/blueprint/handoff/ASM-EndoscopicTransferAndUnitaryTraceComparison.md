# Assembly checkpoint: Endoscopic transfer and unitary trace comparison

Issue: [#226](https://github.com/CBirkbeck/tauceti-explorer/issues/226). Job:
`ASM-EndoscopicTransferAndUnitaryTraceComparison`. Worker: Codex, session
`codex-mzqAco`, 2026-10-14.

**Status: blocked checkpoint, not a completed assembly.** The bot confirmed this
session's claim in [comment 6166308657](https://github.com/CBirkbeck/tauceti-explorer/issues/226#issuecomment-6166308657).
No packet, review verdict, part reader or suggested Lean file was changed.
The consolidated reader and suggested file have not been created. This leaves
the job incomplete under the intake's deliverable check.

## Blocking input and queue mismatch

The issue explicitly requires assembly from the reviewed ET.0 and ET.4 parts,
and says to wait for `REV-EndoscopicTransferAndUnitaryTraceComparison--ET.4`.
That review is [#395](https://github.com/CBirkbeck/tauceti-explorer/issues/395),
which was still open and `state:available` when inspected. The ET.4 packet has
no top-level `review`, and no ET.4 review report exists. Its author is a
different session; this checkpoint does not review that author's mathematics.

The queue on this checkout instead lists ET.0 and ET.6a as the assembly's
prerequisite reviews, and permits only the ET.0 and ET.6a packets as packet
outputs. This explains availability of #226 but does not make ET.4 reviewed.
The issue's embedded instructions authorize edits to ET.0 and ET.4, whereas
the current queue's output allowlist authorizes ET.0 and ET.6a. Resolve this
scope/allowlist mismatch before changing packets. Do not change labels, the
queue or issue text as part of this assembly.

The central ET.4–ET.6 layers cannot be omitted from a full roadmap. Nor can
their unreviewed document be presented as a reviewed part. Resume after #395
accepts its packet and the assembly's authoritative inputs and allowed packet
paths are reconciled. ET.6a is a third part, not a replacement for ET.4–ET.6.

## Input inventory and checks

All paths below are relative to `research/blueprint/`; each packet has a
matching reader in `readmes/` and a matching Lean file in `suggested/`.

| Part packet | Actual node ownership | Nodes | Independent verdict | Requests | Gaps |
| --- | --- | ---: | --- | ---: | ---: |
| `packets/EndoscopicTransferAndUnitaryTraceComparison--ET.0.json` | ET.0: 18; ET.1: 15; ET.2b: 17; ET.3: 11 | 61 | accepted, `independent-review-REV-EndoscopicTransferAndUnitaryTraceComparison--ET.0` | 25 | 5 |
| `packets/EndoscopicTransferAndUnitaryTraceComparison--ET.4.json` | ET.4: 24; ET.5: 14; ET.6: 28 | 66 | absent; review #395 outstanding | 9 | 5 |
| `packets/EndoscopicTransferAndUnitaryTraceComparison--ET.6a.json` | ET.6a: 22; ET.7a: 14; ET.7b: 8; ET.7: 6 | 50 | accepted, `independent-review-REV-EndoscopicTransferAndUnitaryTraceComparison--ET.6a` | 18 | 9 |

There are 177 distinct node ids across the three packets, with no exact id
collision. ET.2 and its perverse-foundation aliases have no nodes of their own:
their imports are explained in the ET.0 reader. ET.4's scope includes ET.6a–ET.7b,
but its summary and handoff assign those nodes to the ET.6a packet. Do not
interpret the overlapping scope arrays as two independent developments of
those stages.

Ran `python3 scripts/check_blueprint.py` separately on **all three packets**:
each reported **0 errors and 0 warnings**. These are structural checks, not an
independent mathematical review or a proof that the prerequisite contracts
are satisfied. The checker accepts requested stage references that assembly
still needs to reconcile.

No Lean compilation was attempted in this checkpoint: no Lean file was
written or modified. Compilation of each input is recorded by its original
worker/reviewer; it is not fresh compilation evidence for a consolidated file.

## Cross-part prerequisite inventory

The ET.4 packet already has 52 prerequisite edges to exact ET.0-part node ids.
The ET.0 packet has no prerequisite edge to another part of this roadmap.
The ET.6a packet has no exact prerequisite edge to either other part. Instead
it has these 29 prerequisite occurrences at stage granularity:

| Supplier stage | Occurrences in ET.6a packet | Consumers |
| --- | ---: | --- |
| ET.3 | 2 | `ET.7a/cyclic-base-change`, `ET.7a/transferable-level` |
| ET.4 | 18 | `ET.6a/raw-compact-unitary-cohomology`, `ET.6a/global-extraction`; `ET.7a/cyclic-base-change`, `twisted-spectral-normalization`, `weak-unitary-base-change`, `cohomological-base-change`, `local-unitary-base-change`, `relevant-packet-multiplicity`, `definite-indefinite-switches`, `transferable-level`, `oldform-dimensions`, `gsp4-solvable-descent-interface`; `ET.7b/csnc-test-functions`, `newton-reduction`, `signed-igusa-trace`; `ET.7/torus-measure-check`, `unramified-gl2-check`, `proper-endoscopy-check` |
| ET.5 | 4 | `ET.7b/csnc-test-functions`, `newton-reduction`, `red-trace-duality`, `signed-igusa-trace` |
| ET.6 | 5 | `ET.6a/tower-conventions`, `global-extraction`, `fs-normalization-contract`; `ET.7a/local-unitary-base-change`; `ET.7/division-inner-form-check` |

Within a row, a slug without a stage prefix retains the preceding prefix.
These are occurrences in `prerequisites`, not the number of distinct nodes or
the number of fulfilled requests. ET.6a requests 15–18 record the corresponding
contracts. Read each complete supplier statement before replacing a stage by
one or more node ids. A theorem on smooth GL_n representations alone does not
supply a unitary packet classification or a tower action dictionary.

The following are **candidate reconciliation sites**, not verified substitutions:

- ET.7a's cyclic base-change and induction targets overlap the proposed early
  ET.4b targets. ET.4 supplies `ET.4/local-cyclic-base-change`,
  `ET.4/global-cyclic-base-change`, `ET.4/cyclic-automorphic-induction` and
  `ET.4/unitary-gl-base-change-descent`. Its own prerequisite list also uses
  SR's Langlands classification, so check the claimed early ordering at node
  level rather than using the stage ordering as a proof of independence.
- `ET.6a/lubin-tate-tower` restates the deformation/Drinfeld-level functor but
  currently imports only tower conventions and R07.2. Compare with
  `ET.6/drinfeld-level-deformation-spaces`; retain the tower's quasi-isogeny
  components, generic fibres and actions after importing the finite-level
  construction. This requires a hypothesis/convention comparison, not a
  textual replacement of the stage id.
- Compare ET.5 requests with `ET.5/transfer-at-p`,
  `ET.5/stable-igusa-trace-formula` and `ET.5/density-of-acceptable-functions`.
  The representation-theoretic Newton reduction remains ET.7b's construction.
  Keep its modulus twist and its acceptable-function domain; do not create a
  dependency of the geometric ET.5 transfer on its later trace consumer.
- ET.6's `full-wd-local-langlands`, `semisimple-langlands-parameter`,
  `local-jacquet-langlands` and `badulescu-langlands-jacquet-map` are candidate
  suppliers for the corresponding ET.6a/ET.7 contracts. Dat's literal sector
  and the FS action conversion still have different requirements.
- ET.0's gap titled “Kottwitz's Tamagawa number formula is planned nowhere”
  predates `ET.4/tamagawa-number-formula`. After ET.4 is independently accepted,
  reconcile the gap with that node's precise statement. This does not resolve
  its separate primary-source reading requirements.

No reference or gap was changed in this checkpoint. Any later change to a
reviewed node's mathematics must be itemized here for re-review.

## Ownership and restructuring proposals to carry forward

These are proposals recorded in the parts, not atlas changes made by this run.
Exact texts remain in each packet's `restructure` array and its part handoff.
Preserve the distinction between a proposal and an accepted supplier contract.

1. **Related-element isocrystal invariant** (ET.0 proposal 1): put the HKW
   extraction's B(T)-valued invariant and its properties in BG1, importing
   ET.0's cohomological prefix. Do not introduce ET.0 → BG1 → ET.0.
2. **Discrete nonabelian H¹** (ET.0 proposal 2): ET.0 owns the discrete Galois
   case; NC.3 imports it and retains its topological-coefficient extension,
   or a single earlier extension of ProfiniteCohomology owns both.
3. **Function-field geometric prefix** (ET.0 proposal 3): GS.0 owns Bun_G,
   GS.1's geometric prefix owns the affine Grassmannian, and FA.2/FA.6 own
   function-field adeles and the quotient. ET.2b keeps Hitchin and affine
   Springer geometry. GS and FA lie outside the Caraiani–Newton order, so
   packaging requires an earlier supplier or a downward move of this prefix.
4. **Fundamental-lemma scope** (ET.0 proposal 4): distinguish the
   equal-characteristic hypothesis from Waldspurger's large-characteristic
   comparison. ET.5's route does not need the general twisted fundamental
   lemma. Preserve the recorded published-version check; do not infer its
   resolution from successful packet validation.
5. **Orbital integrals and real test functions** (ET.0 proposal 5): import
   AutomorphicSpectralTheory package targets AS.6.8a, AS.6.16a and AS.6.17.
   ET.1 keeps measure transport, normalization, Lie-algebra and nilpotent
   integrals, descent, packet averages, and inner-form/twisted comparisons.
   AS's older packet requests pointing upward to ET.1 must be reconciled by
   that roadmap's owner.
6. **Early cyclic base change and induction** (ET.4 proposal 1; ET.6a proposal
   1): proposed ET.4b precedes ET.6 and supplies ET.7a and R17.4. Keep one owner
   for its four targets. ET.6 retains the non-Galois induction and highly
   ramified twist steps; Harris–Taylor primary-source access remains a gap.
7. **Early p-adic character theory** (ET.4 proposal 2): the two ET.4 character
   nodes have one owner. A future SmoothRepresentations Part II imports them
   or takes them over below ET; it does not justify re-planning the existing
   SmoothRepresentations roadmap.
8. **Finite-level deformation spaces** (ET.4 proposal 3): ET.6 owns them;
   ET.6a imports them and adds the generic-fibre tower and actions.
9. **Early local formal-module classification** (ET.6a proposal 2): SW13's
   local classification precedes towers and relative T2. R07.2's Dieudonné
   layer does not by itself provide the requested classification/moduli.
   The parts record FiniteFlat's upstream PR #879 as the relevant context;
   recheck its current state before selecting an addition, Part II or ET
   ownership. Do not re-plan an upstream roadmap.
10. **Classical tower/Hecke fibre comparison** (ET.6a proposal 3): ET.6a owns
    the narrow basic minuscule specialization; HS3 and ES7 consume it. General
    HS2 and the general integral EL/PEL comparison retain their owners. The
    unused HS2 → ET.6a atlas edge is proposed for deletion.
11. **Raw unitary and early Igusa geometry** (ET.4 proposal 4; ET.6a proposal
    4): move only the necessary early AG2.1a compact-unitary clauses and
    IG.0/IG.1 rational clauses downward. The rational object needs ET.5a before
    ET.5; its current ET.7b stage must not be imported wholesale into ET.5.
    Also place the BG0/BG1 algebraic σ-conjugacy prefix below ET.5. Integral
    concentration, boundary localization and higher global applications keep
    their original owners. Scholze's division-algebra Drinfeld-level count
    differs from AG2.1a's good-reduction compact-unitary instance.

## Request collection

There are 52 request records, including four intra-roadmap requests in ET.6a.
Do not concatenate them and declare them fulfilled. The original `need` and
`neededBy` fields remain the exact contracts and consumer lists.

- **ET.0, requests 1–5:** R09.4 stack representability and Picard/DM inputs;
  SF.2 stack trace formula; EDC.7 stack decomposition/hard Lefschetz and
  Frobenius-trace comparison; GS.1 geometric affine Grassmannian; AS.6 orbital
  integrals and real pseudo-coefficients/Euler–Poincaré traces.
- **ET.0, requests 6–25:** upstream ReductiveGroups layers 2, 4, 6, 7 and 9;
  ProfiniteCohomology layers 5, 9, 10 and 12; ClassFieldTheory layers 3, 6, 7,
  9, 10 and 11; GlobalNumberFields layers 0 and 5; AlgebraicCurves layers 4
  and 12; Chebotarev layer 10. Each request states
  the specific input; layer titles alone are insufficient.
- **ET.4, requests 1–5:** R07.2 deformation theory with O-action; H1
  formal/adic nearby-cycle comparison; LPV.6 nearby-cycle/completion
  compatibility; EDC.5 perverse/recollement and EDC.6 duality realization.
  **Requests 6–9:** upstream ClassFieldTheory layers 7, 9 and 11 and
  ReductiveGroups layer 7.
- **ET.6a, requests 1–7:** R07.2 extended local classification/moduli; P5
  equivariant finite-level descent and supports; D6 analytic/diamond
  comparison; H1 finite-level nearby cycles; LPV.6 compact-unitary nearby
  cycles; S2 support operations in every tower dimension; L0 adic coefficient
  limits before the smooth level colimit.
- **ET.6a, requests 8–14:** SR.0 smooth/derived equivariant complexes and exact
  sector extraction; SR.2 normalized opposite Jacquet/trace duality; analytic
  L0 vectors and Pan's local-series/Higgs input; AF.2 cuspidal automorphic
  representations; AF.5 the definite Shimura-set count; AF.4 the specified
  indefinite Matsushima/discrete-series count; AS.4 spectral and Eisenstein
  residue inputs, with the residual Speh theorem owned here.
- **ET.6a, requests 15–18:** ET.4 stable/twisted and packet/small-level
  contracts; ET.3 transfer/fundamental-lemma contracts; ET.5 geometric Igusa
  stabilization and normalized Newton transfer; ET.6 LLC/JL normalization and
  duality. These are the principal cross-part reconciliation work after review.

## Resume checklist

1. Confirm ET.4's independent acceptance and the authoritative assembly
   inputs/packet allowlist; read any review corrections before using the part.
2. Read the three part readers in ET.0, ET.4, ET.6a order and reconcile the
   convention ledger: local field notation, ranks, reciprocity and Frobenius,
   inverse pullback, perverse/Tate normalization, transfer factors, inner-form
   signs, measures and the rational alternating trace. Keep the distinct
   Dat and FS conventions and their unproved comparison explicit.
3. Resolve each of the 29 stage-reference occurrences against exact nodes,
   keeping any residual supplier gap explicit. Reconcile duplicated BC/AI and
   finite-level deformation targets through one owner; check for cycles after
   every ownership change. Collect all 19 recorded gaps without claiming that
   accepted planning packets are closed.
4. Write the consolidated reader with full targets, source locators, API and
   tests, and one purpose/scope/boundary introduction. It must cover the three
   actual node-owning parts, not only the two parts in either stale list.
5. Join the three slim suggested files with one import block and standard
   note. Reconcile the different namespaces and the repeated sign prototypes.
   Retain only light real-bodied definitions on pinned carriers and statable
   theorems/examples; no unsupported heavy carriers or sorry'd data.
6. Recheck current upstream roadmaps/library before planning any missing
   material. This checkpoint inspected the scope sections and suggested-file
   introductions of current ReductiveGroupsPartII and
   SmoothRepresentationsOfLocalGroups, and searched the current Tau Ceti
   source filenames. This was an ownership screen, not a declaration audit.
   Never replace a declaration-level check by the filename search.
7. Run the packet checks, sorry-data/submission checks, and `lean-check` for
   the consolidated file; record fresh evidence and any mathematics changed
   in reviewed nodes. Submit as complete only when the assembly is complete.

All resumption information is in this handoff and the unchanged part files.
No scratch file is required by the next worker.
