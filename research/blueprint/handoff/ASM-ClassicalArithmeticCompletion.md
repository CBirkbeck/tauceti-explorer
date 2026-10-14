# ASM-ClassicalArithmeticCompletion handoff

Job: ASM-ClassicalArithmeticCompletion · Refs #9681

Agent: Claude (Opus 5.5), session claude-evmPBt, 14 October 2026. The claim bot confirmed this session's claim on #9681 (comment 6169498554) before work began. Branch `claude-evmPBt-asm-classical-arithmetic`, from main `62de2ec9e`. This is a complete assembly, not a checkpoint. This session wrote no part of the plan and none of its reviews.

## Delivered

- **[`readmes/ClassicalArithmeticCompletion.md`](../readmes/ClassicalArithmeticCompletion.md)**: the assembled roadmap document. It replaces the first pass's reader, and the seven part readers are no longer needed. It contains:
  - *Front matter*: purpose and end theorems; status by layer; scope, ownership and boundaries (the upstream tier, the notions moved down into this roadmap and who imports them, the imports from Tau Ceti roadmaps and the libraries, what is not here); one set of conventions reconciled across the parts; the sources; how a target is presented.
  - *The eight layers CA.0–CA.7*, each with an introduction written for the joined plan, and all **570 targets** (333 first pass, 237 continuation) in 71 themed groups, numbered CA.k.n. Every target keeps its `CA-k-slug` anchor, so existing links into the first-pass reader still resolve.
  - *For every target*: its statement, hypotheses, API (915 items in all), unit tests (582), checks, proof sketch, uses, exact prerequisite list (*Needs*), sources, and any open obligation. Each first-pass target with a review finding also shows that finding and the continuation's answer.
  - *Back matter*: the open obligations by layer; the supplier contracts merged by owner (this merges the first pass's and the CA.1 continuation's requests to Global Quadratic Forms 4 and Class Field Theory 14, as the CA.1 review asked); how the first-pass review frontier was closed; 134 source mistakes; 19 restructuring proposals; the routing of the 71 paper items; notes for Tau Ceti roadmaps; the sources; and the Lean file.
- **[`suggested/ClassicalArithmeticCompletion.lean`](../suggested/ClassicalArithmeticCompletion.lean)**: the eight suggested files joined, 9,946 lines, described below.
- Bookkeeping edits in the eight packets, described below, and this note.

## Which text governs

The packets are definitive. The document is generated from them: a script renders every target from the eight packets in one format, and the front matter, the layer and group introductions and the back-matter introductions are written by hand. The part readers lag their packets in places; their reviews say so, and most re-rendered from the corrected packets. Their front matter was used only as background.

Integrity checks, all by script:

- all 8,818 packet text fields are present in the document after escaping: titles, statements, hypotheses, proof steps, checks, API and test statements and names, uses, locators and matches, gap details, request needs and source-issue corrections;
- all 2,015 internal links resolve, and there are no duplicate anchors;
- a markdown-it render shows no unintended emphasis or strikethrough;
- the tables have consistent rows.

## Packet edits (for the re-review)

All eight packets keep their `review` objects unchanged. Each pass `check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**. Each edited packet records its edits in a new field, `assemblyEdits`, written by a rerunnable script from `62de2ec9e`.

### First-pass packet (`ClassicalArithmeticCompletion.json`)

1. **Continuation suppliers attached** (168 prerequisites added to 98 first-pass targets, listed in `assemblyEdits.prerequisitesAdded`). Each comes from an explicit instruction of a continuation:
   - CA.1: `norm-residue-symbol-at-a-place` for the three degree-n targets; the three Stickelberger inputs for `eisenstein-reciprocity`; and each supporting lemma for the target named in its `parentStageId`.
   - CA.2: the three supplier lemmas and two Mathlib summability declarations (its restructure entry 2).
   - CA.3: every `continuations[].additionalPrerequisites`.
   - CA.4: `consumerRetargets` and the `suppliers` of `frontierDispositions`.
   - CA.6: `consumerBindings`; the stage prerequisite `DiophantineApproximationAndTranscendence:DT.0` of `dobrowolski-auxiliary-polynomial` becomes `DT.0/siegel-lemma-number-field-product`.
   - CA.7: every `inheritedTargetContracts[].additionalPrerequisites`.

   **Cycles.** Attaching an edge that would make a cycle was not done. For five definitions (`primary-eisenstein-integer`, `primary-element-of-a-cyclotomic-ring`, `ring-of-integers-as-group-ring-module`, `order-in-finite-dimensional-algebra` and `locally-free-class-group`), eight suppliers use only the definition, and they prove its API. They are recorded in a new node field, `apiPrerequisites`, and the document prints them as *API proofs also use*; this is what CA.7's `dependencyAttachment` and `prerequisiteFacets` ask for. One supplier, `CA.4/markoff-coefficient-three-twist` for `markoff-coefficient-one-zero-orbits`, is not attached at all. The twist cites that target for its ℤ-bijection, and the target's own proof contains the scaling identity (`assemblyEdits.notAttached`).
2. **Baseline and requests.**
   - 31 baseline declarations were added: 15 copied from the parts' baselines, and 16 that the CA.2 and CA.4 continuations named but did not list. The assembly read the 16 at the pinned Mathlib, each with its line number.
   - Three requests were added, copying the CA.7 continuation's contracts, for the Tau Ceti layers the attached prerequisites cite: NumberFieldArithmetic Layers 1 and 4, and CharacterTheory Layer 3.
3. **Mathematics changed (review decision applied).** `CA.7/locally-free-class-represented-by-rank-one` and the API item `LocallyFree.exists_classOf_eq` of `CA.7/locally-free-class-group` are restricted to arithmetic orders: 𝓞_F-orders in semisimple F-algebras, F a number field. This is the decision of REV-ClassicalArithmeticCompletion--CA.7 on G-GENERALIDEAL; hypotheses 1 and 3 of the first node are rewritten to match. **This is the one change of reviewed mathematics; the re-review should check it.**
4. **Wording (no mathematics).** Eleven proof steps or hypotheses still said that an input was "recorded as a gap" or "requested from CA.4". They now name the continuation suppliers:
   - the three Hirschhorn steps;
   - `markoff-positive-root-orbits`;
   - the Smyth and Dimitrov steps;
   - `locally-free-class-group` step 5;
   - `froehlich-kernel-group`, and the three Taylor targets.
5. **Planets.** Joining root and parts gave CA.1 ten planets, CA.2 ten, CA.3 eleven, CA.4 twelve and CA.7 eleven. Each layer now shows six. The CA.7 palette is the one its continuation proposed. The 24 removed planets are listed in the packets' `assemblyEdits`; they can be restored when the proposed sub-layers are adopted.
6. **Gaps reconciled.** Of the 220 first-pass gaps, 6 stay open:
   - Catalan–Mihăilescu;
   - the four CA.4 frontier items that the CA.4 continuation marked open, each now with an `assemblyNote`;
   - the retired-roadmap note.

   The other 214 move to a new field, `assemblyResolvedGaps`, with their title, consumers and detail. Of these, 172 are *resolved*, with `by` naming the supplying targets. The other 42 are *restated*, with `restatedAs` naming the continuation gap that now carries the obligation. All 32 CA.6 frontier gaps are restated as the CA.6 gap "Imported mathematical interfaces outside the analytic continuation scope", which lists all 32 targets, as the CA.6 continuation itself specifies. The CA.5 review asked for its 16 gaps to be marked resolved by `frontierResolution`; they are.
7. **Requests answered inside the roadmap.** 29 requests move to a new field, `assemblyResolvedRequests`:
   - to CA.1 (Eisenstein inputs);
   - 26 to CA.4 (the Ghosh–Sarnak items and the Gauss-sum normalisation), mapped by the CA.4 `requestResolutions`;
   - to CA.6 (the dyadic count, restated as the CA.6 gap);
   - to DT.0 (answered by `DT.0/siegel-lemma-number-field-product`, as the CA.6 review asked).

   15 external requests remain.
8. **Coverage.** The CA.1–CA.7 records follow their continuation packets: CA.5 is **closed**, as its review asked, and the others are planned. The first-pass notes and remaining lists are kept as `firstPassNote` and `firstPassRemaining`.

### Continuation packets

- CA.1, CA.2, CA.3, CA.4 and CA.7: the planet removals above.
- CA.5, CA.6 and CA.7: `library.namespace` is set to `TauCeti.ClassicalArithmetic`, the one namespace of the joined Lean file. It was `…CA5`, `TauCeti.MahlerAnalytic` and `…CA7Continuation`; the CA.5 review asked for this.
- CA.3 and CA.6: coverage `remaining` items that were assembly work are removed (the CA.3 continuations wiring and the CA.6 DT.0 binding), and the CA.6 item "carry the assessments through assembly" is reduced to the open interfaces it leaves.

No node of any continuation packet changed.

## Cross-part prerequisites

The 570 nodes have 1,104 internal edges after the edits, and the graph has no cycle (checked across all eight packets, not just within each one). There is no stage-level citation of this roadmap's own layers. Two citations point forward in the document's order:

- `CA.3/imaginary-quadratic-polya-fields` cites `CA.5/index-of-the-order-z-sqrt-d`. CA.5 cites nine CA.3 targets, so the layers cite each other; new restructure proposal 18 moves the index into CA.3.
- `CA.4/markoff-coefficient-one-zero-orbits` cites `CA.4/markoff-class-number`, flagged *(below)*.

Every citation outside the roadmap goes to Mathlib, Tau Ceti, a Tau Ceti roadmap layer, or a lower-tier roadmap:

- AdelicAlgebraicGroups, tier 2;
- GeometryOfNumbersAndQuadraticArithmetic and IntegralHeckeAndGaloisDeterminants, tier 3;
- DiophantineApproximationAndTranscendence, tier 4.

None goes upward.

## Notation reconciled

The document fixes one set of conventions, listed in its *Conventions* section:

- the orientation of the norm-residue symbol and arithmetic Frobenius;
- the domain of the power residue symbol;
- the three notions of primary element;
- the Gauss-sum normalisation, including the sign at the trivial character;
- the discriminant of a binary form;
- the coefficient-three and coefficient-one Markoff surfaces with the twist, and the two meanings of "exceptional";
- the Eulerian versus Euler numbers;
- the Hermite form convention;
- number-field notation, with ideal norm versus element norm;
- the normalisations of transfinite diameter and condenser capacity;
- the Galois-module conventions: left group rings, arithmetic orders, the ranks of the integer-ring class, and ν = L/p.

Node texts keep their reviewed wording.

## Suggested Lean file

`lean-check research/blueprint/suggested/ClassicalArithmeticCompletion.lean`, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` in the shared build: **exit 0, no errors, 1,510 warnings, all `declaration uses 'sorry'`.** No language server, build, update or cache command was run.

The join:

- one import block of 188 individual modules (the CA.5 part's `import Mathlib.Tactic` is dropped), and one standard note;
- the namespace `TauCeti.ClassicalArithmetic` throughout;
- per layer, the first-pass section followed by `section CAkContinuation`; the first pass's trailing Cobham and d ≡ 1 (mod 4) sections are moved to CA.2 and CA.5;
- each part's unclosed scopes are closed by a comment-aware scope scan.

Reconciliations:

- **Duplicates removed.** These were restated in the parts, and only the first-pass copies are kept, with a comment at each removal:
  - from CA.1: six declarations and four promoted API items;
  - from CA.3: `intValuedPolynomials` and `characteristicIdeal`;
  - from CA.4: `markoffSet`, `markoffVieta`, `positiveMarkoffTriples` and `pellNormSet`.
- **One determinant criterion.** The general `relationDet_eq_classNumber_iff` is kept; the first pass's `natAbs_det_eq_classNumber_iff` is named in a comment as its special case.
- **One norm convention.** `negativePell_iff_norm_neg_one` now states `Algebra.norm ℤ` on 𝓞_K, as the first pass does (the CA.5 review asked for one form of each). **This is a Lean statement change; the reviewer should check it.**
- **Namespaces and imports.**
  - The first pass defines local namespaces `TauCeti.ClassicalArithmetic.Polynomial` and `…PowerSeries`, so an `open` of either inside the namespace now names `_root_` explicitly, together with the local namespace in the first-pass chunks.
  - The CA.2 part imports `Mathlib.NumberTheory.ZetaValues`, which brings in Bernoulli polynomials, so four first-pass `bernoulli` occurrences are written `_root_.bernoulli`.
- **Closing list.** The file ends with a comment listing, by target, the 226 names of 33 targets that the packets propose but the file does not type. These come mostly from the CA.6 and CA.7 continuations, which kept their heavy carriers in the document. The list makes every packet API item, unit test and declaration name occur in the file.
- `scripts/check_sorry_data.py` (enforced only for packages) lists 21 definitions with admitted bodies. Eighteen are elaborated: seventeen from the first pass and `stickelbergerPhi` from the CA.1 part. Three are inside the first pass's commented-out CA.7 interfaces. The package must give real bodies to any of them that it keeps.

## Restructuring proposals collected

All 19 are printed in the document.

1. CA.6 owns the Dimitrov potential-theory inputs (first pass).
2. CA.7 sub-layers CA.7a–d (first pass).
3. A separate roadmap, IntegralGaloisModuleStructure, from CA.7 (first pass).
4. HigherLocalFields HL.4 owns the explicit laws above n and imports CA.1's symbol (CA.1).
5. K2SymbolsBrauer T.7 imports CA.1's norm-residue symbol and comparison (CA.1).
6. CA.1 sub-layers a–c (CA.1).
7. Re-point AdditiveCombinatorics' divisor-bound request to AnalyticNumberTheory AN.5 (CA.2).
8. The CA.2 wiring, done by this assembly (CA.2).
9. CA.2 sub-layers a–d (CA.2).
10. CA.3 sub-layers a–c (CA.3).
11. CA.4 sub-layers a–e (CA.4).
12. LP.1 imports CA.6's Fekete diameter and Dubinin's bound (CA.6).
13. ConformalMappingPartII's conformal radius is compared with CA.6's (CA.6).
14. KTheoryLowDegrees Z.1 and Z.4 import CA.7's K₀ bridges (CA.7).
15. FiniteFieldsAndCharacterSums FF.1 imports CA.7's finite Gauss valuation and product (CA.7).
16. CA.7 blocks (CA.7).

New, from the assembly:

17. **Atlas stage edges should follow the targets.** Drop ArithmeticDynamics DY.1 → CA.6, KTheoryLowDegrees Z.1 → CA.7 and the retired LI.* inputs. Add the lower-tier and internal edges the targets cite.
18. **Move `CA.5/index-of-the-order-z-sqrt-d` into CA.3**, which removes the CA.3 ↔ CA.5 citation cycle.
19. **Adopt the sub-layer proposals**, and restore the removed planets there.

## Requests collected

15 external requests remain in the first-pass packet, and 25 in the continuations. The document merges them by owner:

- Tau Ceti Class Field Theory Layers 5, 6, 7, 10, 11, 13 and 14;
- EllipticCurves 1;
- GlobalQuadraticForms 4;
- LocalFieldsRamification 2–3;
- NumberFieldArithmetic 1, 4 and 5;
- QuadraticFormInvariants 6C;
- ReductiveGroups 6;
- CharacterTheory 3, 4 and 7;
- InductionRestriction 6;
- SemisimpleAlgebras 6;
- DiophantineApproximationAndTranscendence DT.2;
- GeometryOfNumbersAndQuadraticArithmetic GN.3/pell-automorph and GN.4.

## For other roadmaps (moves down, recorded for the maintainer)

These are owned here, and the higher roadmaps should import them:

- K2SymbolsBrauer T.7: the norm-residue symbol and its comparison (CA.1).
- FiniteFieldsAndCharacterSums FF.1: Φ and Stickelberger (CA.1), and the finite Gauss valuation and product (CA.7).
- QSeriesPartitionsAndMockModularForms QM.0: the formal triple product, cube identity and theta products (CA.4).
- ArithmeticStatistics ST.0 and ST.3: 𝒟 and 𝒟⁻ (CA.4).
- ArithmeticDynamics DY.1: the power-map canonical height (CA.6).
- LogarithmicPotentialTheoryAndAlgebraicIntegers LP.1: the Fekete diameters and Dubinin's bound (CA.6). LP.5 should cite CA.3's squarefree combination.
- KTheoryLowDegrees Z.1 and Z.4: the K₀ bridges (CA.7). They should cite GN.2 for the Steinitz class.
- NoncommutativeAndEquivariantIwasawa NE.3 and NE.6: CA.7's integral group logarithm.
- ComputationalNumberTheory CN.2: CA.3's Newton polygon and Tau Ceti's kernel basis, and CA.5's four criteria.
- ExponentialSums ES.3: CA.4's point count.

## For the package

- This roadmap is in tier 5, and all its citations are already lower-tier.
- The DT package README predates `DT.0/siegel-lemma-number-field-product`. The package must cite a DT layer that contains it, or state the lemma.
- Decide proposals 17–19 first; 18 changes the order of CA.3 and CA.5.
- The package's `Suggested.lean` must be cut down to the compact shape (under 5,000 lines, no admitted data). The 18 admitted definitions are the first to replace or drop.
- Promote the eight packets together. The first-pass packet now cites continuation nodes, and promotion handles the parts first, since their file names sort first. An atlas build (`scripts/build.py --blueprints` with the eight edited packets and this document, run in scratch) succeeds.

## Checks run

- `TAUCETI_BASELINE=… python3 scripts/check_blueprint.py` on all eight packets: 0 errors, 0 warnings each.
- Cross-packet graph: 570 nodes, 1,104 edges, acyclic; six planets per layer.
- `lean-check` on the joined file: exit 0, 1,510 `sorry` warnings and nothing else.
- Document integrity: the text-field, link, anchor and render checks above.
- Atlas build with the edited packets: exit 0. The `BUILD.json` it rewrote was restored.
- `python3 research/blueprint/intake.py check-files` on the changed paths, and `git diff --check`: clean.

## Where to resume

Next is the independent review of this assembly. It should check:

- the G-GENERALIDEAL restriction and the CA.5 Lean norm change;
- the attached prerequisites (`assemblyEdits.prerequisitesAdded`);
- the gap reconciliation (`assemblyResolvedGaps`).

Then the package (PKG-ClassicalArithmeticCompletion) takes its README from this document. The open obligations it inherits are in the document's [Open proof obligations](../readmes/ClassicalArithmeticCompletion.md#open-proof-obligations). The scratch scripts (packet edits, renderer, Lean join and checks) are not needed: every decision is recorded here and in the packets' `assemblyEdits`.
