# RT-AREA-topology, fix round 3

Job `FIX-RT-AREA-topology~3`, issue #5543. Claude Code, session `cc-c2c06b`, 1 October 2026. Base `80b3d8bd`. The bot
confirmed my claim (comment 5941494936).

This round makes the one correction that `REV-FIX-RT-AREA-topology~2` asked for, and accounts for every finding the
issue lists. The [findings](RT-AREA-topology.result.json), [verification](RT-AREA-topology.review.json),
[round-one report](RT-AREA-topology.fixes.md) and [round-two report](RT-AREA-topology.fixes-2.md) stay the record.

- **Changed:** `research/blueprint/readmes/Polylogarithms.md` only.
- **Unchanged:**
  - the Polylogarithms and HabiroNahmSeries packets;
  - the HabiroNahmSeries reader;
  - both suggested Lean files.

  Each is left as the round-two review accepted or corrected it (reasons below).
- **Independence.** I did none of the following:
  - the red team (`cc-2aeb03`, PR #2758) or its verification (`cc-7b31c4`, PR #2764);
  - fix round one (`cc-39fac3`, PR #4647), round two (Codex `codex-rtOQ9t`, PR #5232) or its review (Codex
    `codex-5ebb6f`, PR #5298);
  - the Polylogarithms blueprint (`cc-7b31c4`, PRs #2780 and #2877) or its review (`cc-442dc5`, PR #2887);
  - the HabiroNahmSeries blueprint (`cc-7b31c4`, PR #2876) or its review (`cc-442dc5`, PR #2909);
  - the concurrent K-theory fix #5265.
- **Disclosure.** Two earlier PRs of mine touch nearby files.
  - **#5317** reviewed fixes to two other Habiro packets, HabiroCohomologyFoundations--HQ.1 and HabiroRings, under
    `REV-FIX-RT-AREA-etale~2`. Neither deliverable here was touched by it, and no finding cites it.
  - **#5221** (`FIX-RT-AREA-ktheory-1`) edited the K3BlochGroups packet, including V.1 nodes. P.2's volume node imports
    K3BlochGroups V.4's cross-ratio, which I did not change here. /26's hand-off below names K3BlochGroups V.1 as a
    possible consumer; I only record it.

## The correction asked for: the Polylogarithms reader now agrees with the packet

The round-two review corrected `Polylogarithms:P.2/hyperbolic-volume` in the packet and the suggested Lean comments. It
kept the packet at `needs_changes` because the reader still had the old text. The review named lines 243, 1379, 1388,
1395, 4478 and 4819–4821, plus three entries the reader lacked.

- **The check.** I wrote a check that every string field of the packet appears verbatim in the reader. It covers:
  - for each node: statement, hypotheses, proof steps, acceptance, prerequisites and `uses`;
  - each coverage note and remaining item;
  - each gap title and detail;
  - each request supplier and need;
  - each restructure detail and proposal;
  - each source-issue field.
- **Before:** 13 strings were missing, exactly the review's list:
  - the node's statement, second hypothesis and fourth proof step;
  - P.2's two new `remaining` items;
  - the Milnor gap's detail;
  - the new ideal-geometry gap (title and detail);
  - the layer-7 request's need;
  - the new layer-8 request (supplier and need);
  - the new restructure entry (detail and proposal).
- **After:** 0 missing.
- **The edits.** Each replaces or inserts the packet's text, rendered in the reader's existing format and in the
  packet's order:
  - **P.2 coverage:** "Goncharov Section 7 and the proof of Milnor's volume formula, owned by P.2" replaces the line
    that sent Milnor's formula to GeometricTopology layer 7. The
    ideal-boundary/oriented-tetrahedron/finite-region-volume item is added.
  - **The volume node:** the statement now asks layers 7 and 8 only for metric/volume foundations and the model
    geometry, and records the ideal geometry as an early extension. The second hypothesis and fourth proof step match
    the packet.
  - **Open gaps:** the Milnor gap's detail now names layers 7 and 8, and the new last gap, "Ideal-boundary and oriented
    ideal-tetrahedron geometry beyond GeometricTopology layers 7 and 8", is added.
  - **Supplier requests:** the layer-7 need is narrowed, and the layer-8 request (the model hyperbolic geometry and its
    isometry action) is added last.
  - **Restructure:** the `propose-early-geometric-extension` entry, "Early ideal-tetrahedron geometry in
    GeometricTopology, Part II", is added last.
  - **Status paragraph:** one sentence at the top says that this round makes the synchronisation, for
    `REV-FIX-RT-AREA-topology~3` to check.
- **No new mathematics.** No statement was rewritten beyond the packet's own text, and no stage id was invented. The
  ideal-geometry prefix stays a proposal for a maintainer or design job, as the review left it.

## Why nothing else changed in the six blueprint files

- **The Polylogarithms packet** already carries the review's corrections. I left `review` at the round-two verdict for
  `REV-FIX-RT-AREA-topology~3` to replace. `check_blueprint.py` with the pinned declaration index reports 0 errors and
  the same 4 warnings: the unwritten BorelRegulators R.4 (three consumers) and R.3 (one).
- **The suggested Lean comments** for P.2 already state the corrected boundary (layer 7 foundations, layer 8 model, the
  early extension, and Milnor as P.2's own gap). No non-comment line needed a change.
- **HabiroNahmSeries** was accepted in round two for its supplier corrections (/11, /21). No finding asks for more, and
  `check_blueprint.py` reports 0 errors and 0 warnings.
  - Its reader is written as prose rather than as a field-by-field rendering, so the verbatim check does not apply to
    it.
  - The review checked the HB.10 reader text against the packet.
- **The import-encoding limitation persists.** At `80b3d8bd`, `check_blueprint.py` still treats a
  `tauceti:TauCetiRoadmap/...` prerequisite as a Lean declaration. Adding the layer-7 and layer-8 stage ids to
  `P.2/hyperbolic-volume`'s `prerequisites` in a temporary copy gave two errors, "baseline prerequisite ... is not
  listed in baseline.declarations".
  - The two exact structured requests therefore stay, as the review kept them.
  - The maintainer action is unchanged: resolve stage ids before the `BASE_REF` branch, then add both stage ids to the
    node's prerequisites.

## /1–/16: handed to BP-ArithmeticQuantumTopology (and /13 also to BP-QSeriesPartitionsAndMockModularForms)

The issue assigns these to the jobs that will write those blueprints. Their packets exist only in partial form and are
not deliverables here, so I made no edit.

- **The hand-offs.** The round-two disposition table, which the round-two review found appropriate finding by finding,
  states each one.
- **Status at `80b3d8bd`.** The ArithmeticQuantumTopology packet is still partial (54 nodes, no review object), and it
  has not yet taken in the hand-offs:
  - it cites neither `Polylogarithms:P.2/hyperbolic-volume` nor `P.1/bloch-wigner-dilogarithm` (/6, /7, /9);
  - it does not cite `HabiroNahmSeries:HB.10`, and its single HB.4 citation is not the six-node export of /11 and /21.

| Finding | Goes to | What that job must do (unchanged from round two) |
|---|---|---|
| /1 | BP-ArithmeticQuantumTopology, QT.0 | Import the framed-link and manifold suppliers; request a surgery-calculus extension. |
| /2 | QT.3 | Use admissible links and Hoste moves, or choose Habiro's alternative route. |
| /3 | QT.1–QT.3 | Supply the quantum group, bottom-tangle invariant, integral form, pairing and twist. |
| /4 | QT.4 | State the general-Lie-type inputs and root-order hypotheses, or narrow the target. |
| /5 | QT.2 | Import the Jones owner and prove the normalisation comparison. |
| /6 | QT.5 | Correct its inputs to P.1/P.2 and the algebraic and geometric suppliers. |
| /7 | QT.5 | Import `Polylogarithms:P.2/hyperbolic-volume` (sole owner); never supply P.2. |
| /8 | QT.5 and the GeometricTopology Part II proposal | Cusped manifolds and ideal triangulations, after the early ideal-geometry prefix. |
| /9 | QT.5 | Own the extended Bloch/Rogers/Chern–Simons comparison. |
| /10 | QT.6 | Build NZ data, DG series and their invariance, then apply HB.9 with its hypotheses. |
| /11 | QT.6 | Import the six HabiroNahmSeries export nodes; HB.10 has no QT input. |
| /12 | QT.2, QT.7 | Define the Kashaev invariant; separate the volume conjecture from proved cases. |
| /13 | QM.5 (BP-QSeriesPartitionsAndMockModularForms); QT.7 | QM.5 owns generic quantum modular forms; QT.7 imports them. |
| /14 | QT.6 | Own Faddeev/state-integral analysis; request the common formal pentagon. |
| /15 | QT.7 | Source and define the resurgence inputs, or bound the target. |
| /16 | QT.2 follow-up | Import HR.1 and the Alexander supplier. |

## /23–/105 as listed: upstream findings with an atlas-side consumer

Each of these is about a Tau Ceti roadmap. By PROTOCOL sections 10 and 17, the swarm does not plan or fix Tau Ceti's own
roadmaps, so the upstream part goes to the maintainer. Each also names an atlas roadmap as a consumer or owner, which
is presumably why the queue lists it here. None concerns Polylogarithms or HabiroNahmSeries, so no deliverable changes.
The atlas-side parts belong to the jobs of those roadmaps.

None of the eleven is yet in `research/blueprint/UPSTREAM_NOTES.md`, which carries the topology findings that name no
planned roadmap (/100–/110 and others). The maintainer should add them there when the file is next regenerated.

- **/23 (high, error): AlgebraicTopology 8.1.**
  - Upstream: define relative homotopy groups for every based pair, without the NDR/cofibration restriction.
  - Atlas side: Hatcher Theorem 4.41 (p_* : π_n(E, F) ≅ π_n(B)) is the export StableHomotopyKTheory H.2 consumes. Its
    blueprint must import it from Stage 8, or state that H.2 proves it from the based-pair interface.
- **/24 (high, missing): AlgebraicTopology's inventory and spectral sequences.**
  - Upstream: replace "exact couples" by Mathlib's `SpectralObject`/`HasSpectralSequence`, and add one generic
    filtered-complex and double-complex spectral sequence with convergence before Stage 4.3.
  - Atlas side: StableHomotopyKTheory H.6, SchemeKTheoryOperations S.4 and DiamondsAndVStacks D0 should import that
    item for their chain-level cases, once it exists, rather than plan their own.
- **/26 (medium, missing): AlgebraicTopology Stage 8.**
  - Upstream: add the compression lemma, CW approximation, Hatcher 4.21 and degree-one Hurewicz.
  - Atlas side: StableHomotopyKTheory H.1 imports degree-one Hurewicz. For n-connected covers, either AlgebraicTopology
    exports them to K3BlochGroups V.1 or the K-theory family records their owner. The K3BlochGroups packet's
    `V.1/bst-plus-connected-cover` uses a two-connected cover, so the K-theory side should name its supplier when the
    upstream choice is made.
- **/29 (medium, missing): the AlgebraicTopology dependency records.** The extract
  `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_AlgebraicTopology.json` is outside the swarm's output paths.
  The finding confirms that it still has empty `requires` and `consumers` for all eight stages and no `stageEdges`. It
  is generated from the atlas, so the change belongs in the upstream dependency records and then a regeneration. The
  edges it needs (supplier → consumer, the finding's list) are:
  - **internal:** 2 → 3; 2, 3 → 4; 2, 3, 4 → 5; 2, 3, 5 → 6; 2, 3, 4, 5, 6 → 7; 2, 3, 4 → 8;
  - **inbound:** UniversalCovers stage 3 → 8; UniversalCovers stage 0 → 5; GeometricTopology layer 1 → 6; a
    smooth-triangulation or Morse supplier → 8;
  - **outbound:** 1 → BelyiMaps layer 5; 4, 7, 8 → FuchsianOrbifolds layer 5; 6, 7 → GeometricTopology layer 10; 1 →
    InverseGaloisAndArithmeticFundamentalGroups IG.3, marked inferred.
  - **Roadmap prerequisites:** add UniversalCovers and GeometricTopology. **Roadmap consumers:** add BelyiMaps,
    FuchsianOrbifolds and GeometricTopology.
  - **Later:** the RS-09 and RS-33 edges join only when those proposals are accepted.
  - **Which edges touch the atlas:** BelyiMaps, FuchsianOrbifolds, UniversalCovers and GeometricTopology are Tau Ceti
    roadmaps, so all of these edges are upstream except 1 → IG.3. The InverseGalois blueprint should cite it as
    inferred.
- **/33 (medium, duplicate): absolute homotopy groups.**
  - Upstream: narrow 8.1 to the relative theory, import the absolute API that UniversalCovers stage 3 and Tau Ceti
    `f790474` already have, and add the edge UniversalCovers stage 3 → 8.
  - Atlas side: none.
- **/81 (medium, missing): GeometricTopology layer 1.**
  - Upstream: add D^n as a manifold with boundary, manifolds with corners and products, corner straightening, and
    collars.
  - Atlas side: ArithmeticLocallySymmetricSpaces ALS.2 and ALS.5 should import collars and the interior homotopy
    equivalence from layer 1. The edges GT layer 1 → ALS.2 and ALS.5 go in those blueprints or in a link file.
- **/82 (medium, missing): isotopy extension.**
  - Upstream: add isotopy extension, the homogeneity lemma, and cutting along two-sided hypersurfaces to layer 1.
  - Atlas side: the MordellLawrenceVenkatesh packet's LV.5 request already asks GeometricTopology layer 1 for cutting
    and gluing and for isotopy extension in surfaces. It should cite layer 1's general theorem once upstream adds it.
- **/87 (medium, missing): GeometricTopology layer 9's inputs.**
  - Upstream: take surface classification and Mod(Σ_g) from one owner, and name one existence supplier for Heegaard
    splittings.
  - Atlas side: the owner is LV.5 or the proposed mapping-class-group roadmap, whichever the pending restructuring
    chooses. That owner needs an edge to layer 9.
- **/91 (medium, missing): GeometricTopology's dependency records.** The internal edges and the misplaced unlocks are
  upstream.
  - **Atlas-side edges:** GT layer 1 → ALS.2 and ALS.5; LV.5 (or its successor) → GT layer 9; GT layer 1 → LV.5 and LV.9
    (already in LV's requires). MordellLawrenceVenkatesh is a designed roadmap, not yet in the atlas.
  - **Upstream-only edges:** the finding's edges into OptimalTransport and FuchsianOrbifolds join two Tau Ceti roadmaps.
  - **Coordination:** the atlas-side edges need the ALS, LV and link jobs. The finding files its
    ArithmeticQuantumTopology edges elsewhere; /1 covers QT.0's GeometricTopology imports.
- **/103 (medium, missing): differential forms and Stokes on manifolds.**
  - Upstream: record a gap against HeegaardFloer F2.1 and F3, and choose an owner: GeometricTopology layer 1 or a new
    roadmap "Differential forms and Stokes' theorem on manifolds".
  - Atlas side: ALS.5 and AutomorphicFormsOnReductiveGroups AF.1a should import that owner rather than plan their own.
    This needs a new-roadmap decision by the maintainer.
- **/105 (medium, missing): HeegaardFloer F4.5's four-dimensional inputs.**
  - Upstream: Spin^c structures on 4-manifolds, signature, handle moves and the absolute grading.
  - Atlas side: the finding suggests linking ArithmeticQuantumTopology QT.0's Kirby theorem as a possible shared
    supplier. BP-ArithmeticQuantumTopology should record QT.0's Kirby calculus as the candidate, with its exact
    hypotheses, alongside /1.

## Checks

- `check_blueprint.py` (pinned index): Polylogarithms 0 errors and 4 warnings (the existing reserved BorelRegulators
  nodes); HabiroNahmSeries 0 errors and 0 warnings. Both packets are byte-identical to `80b3d8bd`.
- **Verbatim check** of packet against reader for Polylogarithms: 13 missing strings before this round, 0 after.
- `intake.py check-files` on the changed files: 0 problems.
- **Not done:** no Lean file was compiled, and no language server or Lake build was started. The non-comment Lean is
  unchanged.
