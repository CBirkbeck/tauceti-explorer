# ASM-AnabelianGeometryAndNonabelianChabauty handoff

Job: ASM-AnabelianGeometryAndNonabelianChabauty · Refs #6277

Agent: Claude (Opus 5.5), session claude-RMbgsm, 14 October 2026. The claim bot confirmed this session's claim on #6277 (comment 6168832750) before work began. This is a complete assembly submission, not a checkpoint.

## Delivered

- [`research/blueprint/readmes/AnabelianGeometryAndNonabelianChabauty.md`](../readmes/AnabelianGeometryAndNonabelianChabauty.md): the assembled roadmap document, replacing the earlier stack of continuation notes. It opens with purpose and end theorems, the owners this roadmap imports from and what it does not contain, its downstream consumers, one set of conventions reconciled across the layers, the construction order where layers interlock, and a layer overview. Then the seven layers NC.0–NC.6, each with an introduction and all its targets in themed groups: **535 targets** (the 363 lemma-level targets of the root packet in NC.0 and NC.3, and the 172 targets of the seven part packets), **650 API items, 465 unit tests, 41 planets**, with every statement, hypothesis, proof step, use, check, prerequisite, consumer and source locator. It closes with the 86 supplier contracts grouped by owner (including the five contracts between this roadmap's own layers, each explained), the 39 open proof obligations by layer (with a reconciliation of the root packet's ten), all 43 source corrections, notes for existing Tau Ceti roadmaps, the restructuring proposals, the supplier statements checked by NC.0–NC.2, the paper routing of the Balakrishnan–Dogra–Müller–Tuitman–Vonk items, a curated source register (34 labels) and the 241 pinned declarations, and a description of the suggested file.
- [`research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty.lean`](../suggested/AnabelianGeometryAndNonabelianChabauty.lean): the eight suggested files joined into one (8,157 lines) with one import block, one standard note and one section per layer, ending with the proposed names of the 261 API items, tests and declarations (100 targets) whose carriers are not at the pins.
- Bookkeeping edits in five packets (below), and this note.

## Which text governs

The packets are definitive. The reviews of NC.0, NC.2, NC.3, NC.4, NC.5 and NC.6 each say that their part reader lags the corrected packet (NC.0: the extensionality API and Kim's published 2010 collation; NC.2: shuffle versus concatenation, the Hadian locator, supplier scopes, three gaps; NC.3: Kim 2009 published locators, cocone wording, filtered pieces, the local closedness criterion, all-algebra fibre hypotheses; NC.4: nine corrected nodes, the new torsor test, four gaps, six findings; NC.5: preheight order, Tate-class tests, `lift_unique`, the KT title and locators; NC.6: its review's synchronization list). The root reader was a reverse-ordered stack of continuation notes. So every target section is generated from the packets, and none of the stale prose enters the document. The layer introductions and framing were written from the packets and the review reports, drawing on the reviewed NC.1 reader (regenerated in its second round) and on the other part readers' exposition, corrected where their reviews required. One worked computation that a root unit test refers to ("the explicit normalized bar 3-cocycle … in the reader", `TauCeti.EtaleKPiOne.tests.constantFp_not_pro_p_cohomology`) is carried over as a group note in NC.0, rewritten and rechecked by a short script (the 3-cocycle condition, the cycle condition and the pairing value 1 mod 3).

Integrity, by script (kept in scratch): all 535 targets, 650 API items, 465 tests and 41 planets are rendered; 8,913 packet text fields (statements, hypotheses, proof steps, checks, API and test names and statements, uses, locators and matches, external prerequisites, requests, gaps, source-issue texts) occur in the document after escaping; all 4,030 internal links resolve; a Markdown render (markdown-it) shows no unintended emphasis or strikethrough.

## Cross-part prerequisites

No packet cites a node id that does not exist, and the node graph over all eight packets has no cycle (before and after the edits). Eighteen citations, from five consumer layers, cite a whole layer of this roadmap; each goes through a request and each is now covered by a recorded gap of the consuming part:

- NC.1 → NC.0 (pro-p sharpening of effacement, cofinal Artin neighbourhoods): NC.1 gaps G3 and G4 already cover it.
- NC.1 → NC.2 (two-step ℚ_p Malcev quotient of the geometric pro-p group): no NC.2 target supplies it, and no NC.1 gap covered it; **added NC.1 gap G5**. NC.2 must add the target with no input from NC.1 (NC.1 restructure proposal 2); then the layer order NC.2 → NC.1 has no cycle.
- NC.4 → NC.2 and NC.4 → NC.3: the consuming targets also cite the exact NC.2/NC.3 targets; the stage citation stands for the requested refinements, covered by NC.4's second, third and fourth gaps.
- NC.5 → NC.4 (five targets): NC.4 states residue-disc density, the loci and finiteness under discwise nonvanishing, but not the Kim–Tamagawa finite local images, every-open-subdisc density, the compact-chart zero theorem or potential unramifiedness. **Added NC.5 gap G504** and listed it in the five targets' `blockedBy`. All four NC.5 requests recorded their consumers under the misspelt key `needBy`; renamed to `neededBy`.

At the level of layers the plan is not ordered by number: NC.0 and NC.2 use the cohomological core of NC.3 (seven and one citations, flagged *(layer NC.3)* in the document), and NC.1 uses NC.2. Within layers, citations of a later target of the same layer are flagged *(below)*; the first group of NC.3 collects the assembled theorems ahead of the lemma groups that prove them.

## Packet edits

All edited packets keep their review objects and verdicts unchanged and pass `check_blueprint.py` with 0 errors and 0 warnings; each records its edits in a new `assemblyEdits` field.

1. **Planets (root and NC.3 packets).** The joined layer NC.3 had twelve planets (six on the root's lemma-level NC.3 targets, six in the NC.3 part). Kept six: `nonabelian-h1`, `exact-sequence`, `torsor-classification` (root) and `finite-level-representability`, `selmer-functor`, `central-selmer-dimension` (part). Removed the planet field from `connecting-cocycle`, `normal-h1-kernel`, `central-extension` (root) and `positive-defect`, `cohomology-functor`, `local-condition-geometry` (part). NC.0 already had six combined (five root, one part).
2. **Source-issue ids (NC.1, NC.3, NC.4).** E1, E2 and E4 each named two or three different findings in the register (root E1; NC.1 E1–E4; NC.3 E4–E5; NC.4 E1–E2). Renumbered NC.1 E1–E4 → **E101–E104**, NC.3 E4–E5 → **E304–E305**, NC.4 E1–E2 → **E401–E402**; root E1 is unchanged. The three node references were updated (NC.1/j-geometric-section source locator; NC.3/central-selmer-dimension proof step 2 and locator). Review objects keep their historical numbers.
3. **NC.1 gap G5 and NC.5 gap G504, NC.5 `neededBy` key** (above).

**Re-review.** No statement, hypothesis, proof route, API item, test or prerequisite changed. The edits are bookkeeping (planet fields, issue identifiers and the three references to them, two new gap records, one misspelt key, five `blockedBy` lists). A light check of the two new gaps is enough.

## Notation reconciled

The document fixes one set of conventions (function-order multiplication and right path torsors; Kim's cocycle factor order versus Mathlib's `IsMulCocycle₁`; the gauge action; the positive central defect matching Tau Ceti's d¹, the negative of Kim's printed class; three coefficient regimes; depth U⟨n⟩ = U/Γ_{n+1}U with Kim's shift by one and Mathlib's `lowerCentralSeries` index; the augmentation-length tower kept separate; the period p_φ·u = p_H and I⁻¹γ; sections up to geometric conjugacy and the Kummer sign; three systems of local conditions; the height sign convention). Node texts are kept as reviewed; where they spell the same object differently (U_n for U⟨n⟩ in NC.3, Is(X,x;C), Π_X → G_K, the ASCII forms of NC.5) the conventions section says so.

## Suggested Lean file

`lean-check research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty.lean` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: exit 0, no errors, 1,077 `declaration uses sorry` warnings and no other diagnostic (the joined file without its closing comment gave the same result). No language server, build, update or cache command was run. Changes relative to the part files:

- The root file's 297 lines of base64 "recovery payload" comment blocks (about 1.85 MB), its review receipts, its comment omission ledgers and the part files' comment registries are removed; the closing list of proposed names per target replaces them (computed by a namespace-aware declaration scan; the statements are in the document). Process-worded comments and docstrings were dropped; section `TwistingContinuation` is renamed `InnerTwisting`.
- The root file now elaborates in full: the earlier review could not compile it because the shared build lacked Tau Ceti's `LowDegree` object, which it now has.
- The NC.3 part file's `SupplierInterface` restated the core's cocycles, classes, coefficient map and abelian comparison with admitted bodies. In the joined file `classOf`, `map` and `abelianEquiv` are real-bodied aliases of the core's `H1.mk`, `H1.map` and `H1.equivContCohomology`, the duplicate `Z1`, `H1` and the duplicate multiplicative-action instances are removed, and the NC.3 targets use the core's carriers: there is one nonabelian H¹ in the file.
- Each layer keeps the namespace its packet gives it (`TauCeti.NonabelianCohomology`, `TauCeti.EtaleKPiOne`, `TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC0/.NC2/.NC5`, `TauCeti.Anabelian`, `TauCeti.NonabelianCohomology.NC3`, `TauCeti.ChabautyKim`), so packet API names and Lean names agree. The package should choose one outer namespace in upstream style (upstream Suggested files use `TauCetiRoadmap.<Roadmap>`), renaming the packets' namespaces with it.
- `scripts/check_sorry_data.py` (enforced only for packages) lists 64 definitions and instances with admitted bodies, inherited from the root (most), NC.2 and NC.3 files. The package's compact `Suggested.lean` must give a real body to any of them it keeps.

## Restructuring proposals collected

From the packets (all in the document's "Restructuring proposals"):

1. **ProfiniteProPGroups, Part II** (NC.1): centre-freeness of free and surface pro-p groups and the open-subgroup transfer.
2. **InverseGaloisAndArithmeticFundamentalGroups, Part II** (NC.1): admissible covers with invertible local node and marking indices, without invertible total degree.
3. **Split the two-step Malcev foundation out of NC.2's application order** (NC.1): see gap G5 above.
4. **ProfiniteCohomology, Part II** (NC.1): completed coefficients, derived p-power limits, arithmetic Hochschild–Serre.
5. **ProfiniteArithmetic, Part II** (NC.1): the centre-free extension pullback (T97 Lemma 7.1).
6. **Reductive groups, Part II refinement** (NC.4): split-unipotent nonnormal homogeneous quotients and torsor vanishing over every affine coefficient algebra.
7. **Narrow NC.6 to the conjectural frontier** (NC.6): keeps its eighteen targets, replaces the atlas edges NC.1, NC.5 → NC.6 by NC.0, NC.2, NC.3, NC.4 → NC.6. It supersedes the root packet's earlier proposal to drop NC.6.
8. **Étale homotopy types core** (root): reconcile the unaccepted EtaleHomotopyTypes candidate into a generic foundation for raw étale pro-spaces, with no dependency on NC.0 or NC.1.

New, from the assembly:

9. **Move the cohomological core of NC.3 to a first layer**, before NC.0, since NC.0 and NC.2 use it and it uses no geometry; the layer order would then be a construction order.
10. **Atlas edges should follow the targets**: add NC.3 → NC.0, NC.3 → NC.2, NC.2 → NC.1 and NC.0, NC.2, NC.3, NC.4 → NC.6; drop NC.1 → NC.6 and NC.5 → NC.6 (with 9, the layer graph has no cycle).

## Requests collected

86 contracts, grouped by owner in the document: SchemeAndStackFoundations 18, InverseGaloisAndArithmeticFundamentalGroups 7, TauCetiRoadmap JacobianChallenge 6, StableReduction 6, ReductiveGroups 6, this roadmap's own layers 5, TauCetiRoadmap ProfiniteCohomology 5, AlgebraicCurves 4, EtaleDualityAndPerverseSheaves 4, PadicHodgeTheory 3, TauCetiRoadmap ProfiniteProPGroups 3, ArithmeticGaloisDuality 3, AbelianSchemesAndArithmeticModuli 3, and one each to BelyiMaps, AlgebraicModuliForArithmeticGeometry, FiniteFlatGroupsAndIntegralPadicHodgeTheory, WeightsInEtaleCohomology, ClassFieldTheory, LocalFieldsRamification, StableReductionPartII, CohomologyComparisons, SelmerIwasawaCohomology, ColemanIntegration, MotivesAndAlgebraicCycles, HeightsRationalPointsAndObstructions and ArithmeticKTheory. Those needing an owner's attention first: the SF.2 coefficient dictionary and canonical comparison maps (the K(π,1) targets wait on them); IG.1's analytic tangent-germ comparison (symmetric good paths); CP.2's multiplicative comparison with two endpoint augmentations (NC.2's first gap); the ReductiveGroups split-unipotent refinements (NC.3, NC.4); and the pending generic p-adic heights design (NC.5 G502), which has no stage yet.

## For the package (tier order)

`upstream/CaraianiNewton.md` puts this roadmap in tier 16. The plan cites EffectiveDiophantineMethods ED.4 (tier 17) six times, all from NC.4 (Strassmann's bound, abelian logarithms, the Coleman–abelian comparison, annihilating differentials, p-adic closure dimension, the residue-disc zero bound): the package must move these notions down or state them as named inputs. It also cites roadmaps outside the 94: MotivesAndAlgebraicCycles (NC.2, NC.5), StableReductionPartII and JacobianChallengePartII (NC.1), FunctionFieldArithmetic (NC.1).

## Upstream notes for the maintainer

From the packets (in the document): ProfiniteArithmetic current main supplies continuous outer actions but not the centre-free pullback; AlgebraicCurves' current Layers 9 and 12 are broader than the snapshot; JacobianChallenge B, E, F do not state the Tate, de Rham and Kummer comparisons NC.2 needs; AlgebraicVectorBundles uses L0A/L0B; ReductiveGroups refinements requested by NC.3; the BDMTV routed item /9 should be retargeted to A2/A6 (NC.5).

## Checks run

- `python3 scripts/check_blueprint.py` on all eight packets (with `TAUCETI_BASELINE` set): 0 errors, 0 warnings each.
- Source-issue schema (`scripts/source_issues.py` check) on the edited packets: no problems.
- `lean-check` on the joined suggested file: see above. `scripts/check_sorry_data.py`: 64 inherited admitted data bodies, listed for the package.
- Document integrity and render checks: as above.
- `python3 research/blueprint/intake.py check-files` on the changed paths and `git diff --check`: clean.

## Where to resume

Next is the independent review of this assembly, then the package (PKG-AnabelianGeometryAndNonabelianChabauty), which takes its README targets from this document and a compact subset of the joined Lean file. Before packaging: decide proposals 7, 9 and 10; plan the NC.2 Malcev target (gap G5) and the NC.4 refinements of gap G504; and handle the ED.4 tier citations. The scratch scripts (document generator, packet edits, Lean join, integrity and render checks) are not needed: every decision is recorded here and in the packets' `assemblyEdits`.
