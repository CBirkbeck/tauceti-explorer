# Handoff: ASM-MetaplecticAutomorphicForms (issue #245)

This job assembles the roadmap *Metaplectic groups, Weil representations and automorphic theta kernels* from its two parts. It is a complete assembly, not a checkpoint.

Worker: Claude, session claude-zyyXTy, 7 October 2026. I took no part in either part or in their reviews.

- Part MP.0 (layers MP.0–MP.7, 176 nodes): BP-MetaplecticAutomorphicForms--MP.0 (codex-3xBZEo), reviewed by REV-MetaplecticAutomorphicForms--MP.0 (codex-a5Lhnu), verdict **`needs_changes`**.
- Part MP.8 (layer MP.8, 85 nodes): BP-MetaplecticAutomorphicForms--MP.8 (codex-KMZtHy), reviewed by REV-MetaplecticAutomorphicForms--MP.8 (codex-4ye5ct), verdict **`needs_changes`**.

The assembly takes both packets as their reviews left them, as ASM-Polylogarithms and ASM-GL2ModularityLifting did with parts whose verdict was `needs_changes`. No verdict is changed.

## Files

- `research/blueprint/readmes/MetaplecticAutomorphicForms.md`: the full roadmap document (about 123,000 words). It replaces the two part documents for readers; both reviews asked that the reader be brought in line with the corrected packets, and the node text here is generated from those packets.
- `research/blueprint/suggested/MetaplecticAutomorphicForms.lean`: the two parts' suggested files joined, with one standard note and one import block.
- `research/blueprint/handoff/ASM-MetaplecticAutomorphicForms.md`: this note.

The part packets are unchanged. The issue text allows editing them, but the queue lists only the three paths above as the job's outputs, and the intake leaves a pull request that touches other files to the maintainer. The packet edits the assembly calls for are listed below for the revision of the parts.

## The document

- **Generated from the packets.** All 261 nodes, with statement, hypotheses, proof outline or construction, API, unit tests, acceptance, uses, prototype boundary or signature omissions, the gaps and requests that name the node, dependencies inside and outside the roadmap, consumers in other packets, library record, source items, sources with their literal excerpts, and the reviewer's per-node verdict and note. A scripted check finds every statement, hypothesis, proof step, acceptance item, use, API item, unit test, prerequisite, planet, excerpt, locator, match, source item, library record, review note, gap, request, source issue, baseline declaration, source id and structural proposal of both packets in the document, every internal link resolves to an anchor, and every gap, request and node id named in hand-written text exists. 75 part-MP.0 nodes share one standard prototype boundary, printed once under Conventions.
- **Display groups.** Each layer is shown in two to seven groups (`MP.3:towers`, `MP.7:shimura`, …), checked so that no node uses a node of a later group of its layer. This displays the part MP.0 proposal for sub-layers (its proposal 4) without changing ids, stages or planets.
- **Hand-written sections.** Preface; purpose and scope with what is not here; boundaries (suppliers, consumers from atlas links and citing packets, an assessment of the nine requests other packets send here, an owners table); conventions reconciling the parts (coefficient-first versus space-first Heisenberg coordinates, left and right actions, Fourier kernels, det q versus det B_q, the two cover constructions, Gan–Qiu–Takeda parameters, half-integral-weight and BFH normalisations, "item N" references); sources grouped by file (BFH90Invent and BFH90 are the same scan); the 85 pinned declarations; a layer overview with planets and paths to the main targets; one overview per layer; source issues; gaps and requests with a status after assembly; structural proposals with status; the cross-part audit; dependencies; and what the blueprint does not claim.
- **Assembly notes** follow 40 nodes: the 13 cross-part replacements and three unclear cases of part MP.8, the stage-order moves, ownership rulings and open consumer requests, and the resolution of "item N" references in four MP.7 statements. None changes a packet.

No reviewed mathematics was changed. Nothing needs re-review on account of this job beyond the ordinary review of the assembled outputs (issue #3665, blocked until this job is submitted).

## Cross-part prerequisites

Every prerequisite crossing the parts resolves. The union node graph is acyclic, also with all edges proposed below added and together with every other packet on main; the only cycle through the roadmap appears when whole-stage prerequisites are expanded, and it is the GN.3 feedback already recorded as gap G0.101.

1. **Fix 1, stage order MP.7 ↔ MP.8.** `MP.7/bfh-kernel-import` and `MP.7/ramified-quadratic-twist-kernel-inputs` cite MP.8 nodes, and no MP.8 node cites an MP.7 node, so the atlas link MP.7 → MP.8 is unsupported and the induced stage edge runs backwards. Move both nodes to MP.8 (parentStageId and realises); keep their ids. No other packet cites them, and neither is a planet.
2. **Fix 2, exact suppliers for part MP.8.** Replace the stage prerequisites as follows (all acyclic):
   - `MP.8/similitude-cover`: MP.1 → `MP.1/metaplectic-double-cover`.
   - `MP.8/arithmetic-subgroup`, `MP.8/bfh-translation`, `MP.8/similitude-heisenberg-comparison`: MP.6 → `MP.6/jacobi-group`.
   - `MP.8/bfh-slash`: MP.6 → `MP.6/jacobi-group`, `MP.6/jacobi-spaces`.
   - `MP.8/bfh-jacobi-specialization`, `MP.8/jacobi-eisenstein`: MP.6 → `MP.6/jacobi-spaces`.
   - `MP.8/theta-decomposition`: MP.6 → `MP.6/jacobi-theta-decomposition-interface` (after fix 3).
   - `MP.8/theta-fourier-transform`: MP.2 → `MP.2/generator-operators`, `MP.2/operator-relations`; MP.6 → `MP.6/jacobi-theta-decomposition-interface` (after fix 3).
   - `MP.8/arithmetic-adelic-comparison`: MP.1 → `MP.1/metaplectic-double-cover`; MP.2 → `MP.2/generator-operators`, `MP.2/operator-relations`; MP.4 → `MP.4/unramified-compact-splittings`, `MP.4/adelic-metaplectic-cover`, `MP.4/rational-symplectic-splitting`, `MP.4/adelic-weil-representation` (partial: the dyadic splitting at 8M | N and ℚ^× similitudes stay in gap G8.1).
   - To settle: `MP.8/genus-two-theta` cites MP.6 for "the MP.6 theta kernel", which does not exist (cite the interface after fix 3, or drop it); `MP.8/theta-normal-convergence` cites MP.2 for Poisson/Fourier machinery that is AL.0's (replace by `AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation` or drop); `MP.8/full-real-cover` cites MP.4 but uses nothing from it (drop).
   - Then mark R8.1, R8.2 and R8.4 answered and R8.3 answered in part.
3. **Fix 3, the MP.6 theta-decomposition interface.** Delete from `MP.6/jacobi-theta-decomposition-interface` the closing clause that specialises to the BFH formulas "supplied by MP.8/theta-decomposition, theta-pairing and theta-fourier-transform"; once those nodes cite the interface, the clause makes the general theorem depend on its own specialisation. `MP.8/theta-decomposition` already states the specialisation.

## Stage order inside part MP.0

The node graph induces three more backward stage edges (Dependencies in the document):

4. **MP.2 → MP.1.** `MP.1/rao-factor-set` and `MP.1/metaplectic-double-cover` use `MP.2/leray-cocycle` and `MP.2/weil-index-identities`, while the Leray cocycle uses `MP.1/scalar-normalizer-extension`. Recommended: move `MP.1/rao-factor-set`, `MP.1/metaplectic-double-cover` and `MP.1/genuine-oscillator` into MP.2 (MP.2 would then have seven planets, so the revision drops one). The alternative, moving the four Weil-index and Leray nodes into MP.1, leaves MP.1 with eight planets.
5. **MP.3 → MP.2.** Move `MP.2/hermitian-uncertainty` and `MP.2/hermitian-operator-normalizations` into MP.3 (no planets; nothing in MP.2 uses them).
6. **MP.6 → MP.5.** Move `MP.6/ideal-lattice-poisson` into MP.5 (no planet; its only consumer is `MP.5/ideal-class-theta-general-transform`).

## For the maintainer

- **Atlas links.** MP.8 → QM.1 is contradicted by QM.1's packet, which cites MP.6 and MP.7 (RT-AREA-automorphic-1/20); it should become MP.6 → QM.1. MP.6 → GZ.5 and MP.6 → L2s have no consuming packet nodes yet. The node prerequisites add many stage links into the roadmap at promotion (SR.0/2/3, AF.1–3, AA.1–3, QuadraticFormInvariants 6C and others), as the confirmed findings RT-AREA-automorphic-1/21–/23 require.
- **Ownership not yet ruled.** (a) The local doubling zeta integral: `MP.6/local-doubling-integral` and the proposed AutomorphicLFunctionsAndLocalFactorsPartIIDoubling plan the same Z_v; one must import the other. (b) The Rallis inner product formula: earlier routings gave it to the proposed Shimura–Waldspurger Part II, but `MP.6/rallis-inner-product` now plans it; DESIGN-MetaplecticAutomorphicFormsPartII (issue #3389) should import it. (c) ω_L and ρ_L: `MP.4/finite-weil-representation` is the single owner RT-PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/33 proposes (that finding is not yet verified).
- **GN arithmetic routing** (gap G0.101, request R0.20): the reviewer's instruction stands; exact GN nodes or a GN Part II are needed, and the maintainer chooses their ids.
- **Consumer requests not answered by any node** (Boundaries): GL₂ R17.3's continuation of the rank-one genuine Eisenstein series over a number field; GN.4's harmonic theta-coefficient interface; QM.1's multiplier systems of weight r ∈ ½ℤ on finite-index subgroups of SL(2, ℤ), Mp₂(ℤ) with vector-valued forms for ρ_L, half-integral Jacobi index and Skoruppa's Theorem 5; QM.5's holomorphic S_k(N, χ), Fricke involution, weakly holomorphic plus space, U₄ and Rankin–Cohen bracket; BSD.0's Friedberg–Hoffstein kernel (gap G0.102). The revision of part MP.0 should add those that belong here or say where they belong.

## The Lean file

- One standard note (both reviews' verdicts, the pins), one import block (the union of the parts' imports: three Tau Ceti modules and 35 Mathlib modules), `set_option linter.unusedVariables false` once, then part MP.0's body (namespaces `TauCeti.Metaplectic.Heisenberg` and `TauCeti.Metaplectic`) and part MP.8's body (`TauCeti.Jacobi.GenusTwo`), each in its own namespaces so nothing leaks between parts. No name changed and no declaration is duplicated; the namespaces are the packets' library namespaces, so every packet API name stays exact.
- Part MP.0's file had never elaborated (its review stopped at the first import). The assembly fixed its elaboration errors without changing any statement: `φ(u+x)` → `φ (u+x)` (twice), two `… |>.val (t,u) = …` → `(…).val (t,u) = …`, `ContDiff ℝ ∞` → `ContDiff ℝ (⊤ : ℕ∞)` (∞ is scoped notation), the variable `λ₂` renamed `lam₂` in code (λ is a keyword; comments keep λ₂), and `@[instance_reducible]` on `heisenbergTopology` (a definition of class type, the only non-`sorry` warning).
- Every API name of both packets (181 + 107) is a declaration of the file, and every unit-test name (180 + 104) appears in the file, labelling its `example`.
- **Elaboration.** The shared `lean-check` build (Mathlib 082e2d3) has no `.olean` for the three Tau Ceti modules the file imports. I therefore checked a scratch copy in which those imports are replaced by the sources of their import closure (ten modules) taken from Tau Ceti's pinned commit f790474 with `git show`, concatenated in dependency order. Result: **exit 0, no errors, 834 warnings `declaration uses 'sorry'`** (518 from part MP.0, 316 from part MP.8), and one further warning, `@[expose]` has no effect outside a module file, which comes from the inlined Tau Ceti source, not from the suggested file. Memory available was over 100 GB; one check at a time. The committed file itself keeps its Tau Ceti imports and has not been compiled in a build containing them.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/MetaplecticAutomorphicForms--MP.0.json`: 0 errors, 0 warnings (packet unchanged).
- `python3 scripts/check_blueprint.py research/blueprint/packets/MetaplecticAutomorphicForms--MP.8.json`: 0 errors, 0 warnings (packet unchanged).
- Document correspondence check as above: 0 problems.
- `lean-check` on the scratch copy described above: exit 0, `sorry` warnings only from the suggested file.

## Structural proposals of the parts

1. **rescope** (MetaplecticAutomorphicForms, MordellLawrenceVenkatesh; part MP.0). Keep the existing MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis node and its ownership. Narrow the algebraic-polarization wording of MP.0 to import that result, then construct the Heisenberg coordinate maps, topology and actual Schrödinger models here. The current twelve declarations use a supplied bilinear form and do not depend on choosing a Lagrangian complement; no new symplectic-space wrapper or duplicate basis theorem is proposed. *Status:* Adopted at node level: `MP.0/schroedinger-model` and `MP.2/leray-form` cite `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`, and no MP node re-plans polarizations. Narrowing the campaign wording of MP.0 is the maintainer's.
2. **prerequisites** (MetaplecticAutomorphicForms, SmoothRepresentationsOfLocalGroups, AutomorphicFormsOnReductiveGroups, AdelicAlgebraicGroups; part MP.0). Add these named stage prerequisites explicitly; retain MP cover/theta adapters rather than treating algebraic operators as smooth admissible modules or moderate-growth automorphic forms. *Status:* Implemented at node level (RT-AREA-automorphic-1/21 and /23): the MP.3 and MP.5 nodes cite SR.0, SR.2, SR.3, AF.1, AF.2, AF.3, AA.1 and AA.3. The stage links follow at promotion from the node prerequisites (Dependencies).
3. **part-ii** (AutomorphicLFunctionsAndLocalFactors, AdelicAlgebraicGroups, GeometricSatakeAndFusion, GlobalShtukasAndFunctionFieldLanglands; part MP.0). Extend those suppliers as PartII with the requests’ exact contracts; preserve their existing definitions and do not duplicate them in MP. *Status:* Awaiting the maintainer. Requests R0.1 (AL.0), R0.9 (AA.2), R0.13 (GS3) and R0.14 (GS.5) state the Part II contracts.
4. **sublayers** (MetaplecticAutomorphicForms; part MP.0). Display those groups as sublayers in a future structure job, retaining current MP.0–7 ids and the current maximum of six source-named planets per layer. MP.8 remains the genus-two BFH supplier. *Status:* Displayed: this document shows MP.3 and MP.7, and every other layer, in display groups, with node ids, stages and planets unchanged and no group using a later group of its layer. Atlas sub-layers await a structure job.
5. **rescope** (MetaplecticAutomorphicForms, QSeriesPartitionsAndMockModularForms, AutomorphicConverseTheorems; part MP.8). Place general H(W)⋊Sp(W), its unitary analogue, Schrödinger–Weil action, weight/index/multiplier Jacobi spaces, Fourier–Jacobi extraction and theta decomposition in MP.6 before MP.7. MP.8 specializes this supplier to BFH genus two and owns GSp₄ compatibility and the actual cover-specific Eisenstein comparison. QM.1 imports MP.6 and retains its q-series/eta/mock-modular applications. The converse-theorem L2 input and subsequent L2/L2s stages consume MP input. Add no dependency from MP to QM or to an AC consumer and no consumer-to-supplier cycle. No other packet or stage file is changed in this job. *Status:* Implemented by part MP.0, whose group MP.6:jacobi plans the general Jacobi theory; QM.1 already cites MP.6. Part MP.8's stage citations of MP.6 resolve to those nodes (Cross-part prerequisites, fix 2), and the atlas link MP.8 → QM.1 should become MP.6 → QM.1 (Dependencies).

## Requests of the parts

All 40 requests, in packet order; the full text is under Requests in the document.

| Id | Part | Supplier | Needed by | Status after assembly |
|---|---|---|---:|---|
| R0.1 | MP.0 | `AutomorphicLFunctionsAndLocalFactors:AL.0` | 12 | open |
| R0.2 | MP.0 | `SmoothRepresentationsOfLocalGroups:SR.2` | 13 | open |
| R0.3 | MP.0 | `AutomorphicFormsOnReductiveGroups:AF.1` | 12 | open |
| R0.4 | MP.0 | `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category` | 8 | open |
| R0.5 | MP.0 | `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation` | 3 | open |
| R0.6 | MP.0 | `SmoothRepresentationsOfLocalGroups:SR.3` | 20 | open |
| R0.7 | MP.0 | `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant` | 14 | open |
| R0.8 | MP.0 | `ModularityAndLanglandsExtensions:ML.4` | 3 | open |
| R0.9 | MP.0 | `AdelicAlgebraicGroups:AA.2` | 6 | open |
| R0.10 | MP.0 | `AutomorphicLFunctionsAndLocalFactors:AL.2` | 1 | open |
| R0.11 | MP.0 | `AdelicAlgebraicGroups:AA.1` | 8 | open |
| R0.12 | MP.0 | `tauceti:Completed/IntegralLattices#layer-3-finite-bilinear-and-quadratic-modules` | 3 | open |
| R0.13 | MP.0 | `GeometricSatakeAndFusion:GS3` | 1 | open |
| R0.14 | MP.0 | `GlobalShtukasAndFunctionFieldLanglands:GS.5` | 1 | open |
| R0.15 | MP.0 | `AutomorphicFormsOnReductiveGroups:AF.2` | 3 | open |
| R0.16 | MP.0 | `AutomorphicFormsOnReductiveGroups:AF.3` | 3 | open |
| R0.17 | MP.0 | `AdelicAlgebraicGroups:AA.3` | 3 | open |
| R0.18 | MP.0 | `AutomorphicSpectralTheory:AS.1` | 4 | open |
| R0.19 | MP.0 | `AutomorphicSpectralTheory:AS.2` | 5 | open |
| R0.20 | MP.0 | `GeometryOfNumbersAndQuadraticArithmetic:GN.3` | 12 | Open. The present GN.3 nodes do not state this arithmetic, and GN.3's own theta interface cites MP.5; see gap G0.101. |
| R0.21 | MP.0 | `AutomorphicSpectralTheory:AS.0` | 8 | open |
| R0.22 | MP.0 | `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus` | 2 | open |
| R0.23 | MP.0 | `QSeriesPartitionsAndMockModularForms:QM.2` | 4 | open |
| R0.24 | MP.0 | `GeometryOfNumbersAndQuadraticArithmetic:GN.2` | 3 | open |
| R0.25 | MP.0 | `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order` | 1 | open |
| R8.1 | MP.8 | `MetaplecticAutomorphicForms:MP.1` | 2 | Answered: the intrinsic rank-two real cover, its kernel sign and topology are `MP.1/metaplectic-double-cover`, and the generator lifts are `MP.2/generator-operators` with `MP.2/operator-relations`. Close it when the stage prerequisites are replaced (Cross-part prerequisites, fix 2). |
| R8.2 | MP.8 | `MetaplecticAutomorphicForms:MP.2` | 3 | Answered for `MP.8/theta-fourier-transform` and `MP.8/arithmetic-adelic-comparison` by `MP.2/generator-operators` and `MP.2/operator-relations`. Its third consumer, `MP.8/theta-normal-convergence`, uses no MP.2 statement (Cross-part prerequisites). |
| R8.3 | MP.8 | `MetaplecticAutomorphicForms:MP.4` | 2 | Answered in part by `MP.4/unramified-compact-splittings`, `MP.4/adelic-metaplectic-cover`, `MP.4/rational-symplectic-splitting` and `MP.4/adelic-weil-representation`. The dyadic compact-open splitting at level 8M | N is not stated by MP.4 and stays in gap G8.1; `MP.8/full-real-cover` uses no MP.4 statement. |
| R8.4 | MP.8 | `MetaplecticAutomorphicForms:MP.6` | 9 | Answered by `MP.6/jacobi-group`, `MP.6/jacobi-spaces`, `MP.6/fourier-jacobi-extraction` and `MP.6/jacobi-theta-decomposition-interface`, the last after cross-part fix 3. |
| R8.5 | MP.8 | `AutomorphicFormsOnReductiveGroups:AF.5` | 1 | open |
| R8.6 | MP.8 | `AutomorphicLFunctionsAndLocalFactors:AL.3` | 4 | open |
| R8.7 | MP.8 | `AutomorphicSpectralTheory:AS.1` | 4 | open |
| R8.8 | MP.8 | `AutomorphicSpectralTheory:AS.2` | 2 | open |
| R8.9 | MP.8 | `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem` | 1 | open |
| R8.10 | MP.8 | `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra` | 3 | open |
| R8.11 | MP.8 | `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor` | 3 | open |
| R8.12 | MP.8 | `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators` | 3 | open |
| R8.13 | MP.8 | `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions` | 2 | open |
| R8.14 | MP.8 | `AutomorphicFormsOnReductiveGroups:AF.1` | 1 | open |
| R8.15 | MP.8 | `GL2AutomorphicRepresentationsAndTransfer:R16.2` | 2 | open |

## Resume

The next job is the revision of the parts (or the review of these assembled outputs, issue #3665). Apply fixes 1–6 to the packets, regenerate the document's node sections from the revised packets (the generator and its checks are described above; the document's hand-written sections name every node they rely on), and repair the suggested signatures the MP.0 review lists, in the joined file.
