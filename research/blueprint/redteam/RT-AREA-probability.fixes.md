# RT-AREA-probability: fixes

Fixer: Claude Code, session `cc-e94dc5`, 30 September 2026 (issue #3987).
- Findings: `RT-AREA-probability.result.json`.
- Verdicts: `RT-AREA-probability.review.json`. All 22 findings are confirmed.
- This job covers the twelve of medium severity: /1–/7, /9, /10, /11, /15 and /20. The ten of low severity (/8, /12–/14, /16–/19, /21, /22) are not fix jobs under PROTOCOL.md §17 and are not handled here.

**This report is the only file changed.** It is the job's one deliverable, and every fix is an exact, anchored edit for whoever owns the file it touches:

| Fix | File | Who applies it |
|---|---|---|
| /1–/7, /9, /15 | `research/blueprint/audit/AUDIT-40.result.json` | The orchestrator, before it merges AUDIT-40 into `data/library-coverage.json`. AUDIT-40 is accepted (REV-AUDIT-40) but still in `pendingReview`, so no layer of either roadmap has a coverage entry yet. §17: "A fix to an audit is merged into the library audit by the orchestrator." |
| /11 | `research/blueprint/links/tauceti_TauCetiRoadmap_Exchangeability.json`, overlap EXCH-DGL-01 | The link workflow. |
| /3, /5, /10, /11, /20 | `content/tau-ceti/Exchangeability/README.md`, `content/tau-ceti/DenseGraphLimits/README.md`, `content/tau-ceti/StandardDistributions/README.md` | The Tau Ceti maintainer. These are upstream roadmaps, which the atlas never re-plans (§15). |

**How the edits were checked.**
- Every declaration cited or removed was opened at the pins: Mathlib `082e2d3`, Tau Ceti `f790474`. That covers its file and line, its full name, whether it is `private`, and its hypotheses.
- The AUDIT-40 and link edits were also written as anchored scripts and run on copies of the files. Each script locates the layer by id, the target by its exact string and the declaration by name.
  - Applying this report's edits by hand gives byte-identical output.
  - Only the named layers or overlap change.
  - The edited links file passes `scripts/check_links.py` with 0 errors and 0 warnings.
- README line numbers are those at origin/main when this report was written.

## /1 (medium, library-claim): Layer 0 is built; the permutation-extension target cites the wrong fit and a private definition

**What was checked.**
- README Layer 0, lines 295–296: "* finite approximation of infinite permutations;" and "* extension of strictly monotone finite selections to finite permutations." The milestone block (lines 304–312) names `exists_perm_extending_strictMono` (line 307) and `contractable_of_exchangeable` (line 308). Neither name is declared anywhere in `TauCeti/`.
- `TauCeti.Probability.exists_strictMono_nat_extending_fin`, `TauCeti/Probability/Exchangeability/PermutationExtension.lean:83`, public. `(hk : StrictMono k) : ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∀ i : Fin m, φ i.val = k i`. It produces a strictly increasing self-map of `ℕ`, not a permutation, so fit `related`.
- `TauCeti.Probability.ExchangeableAt.invariantSubmonoid`, `TauCeti/Probability/Exchangeability/AdjacentTranspositions.lean:55`: `private def`, not library API.
- `TauCeti.Probability.ExchangeableAt.blockLaw_eq_prefixLaw_of_injective`, `TauCeti/Probability/Exchangeability/ExchangeableAtMonotone.lean:44`, public. `(h : ExchangeableAt μ X n) (k : Fin m → Fin n) (hk : Function.Injective k) (hX : ∀ i : Fin n, AEMeasurable (X i.val) μ) : blockLaw μ X (fun i => (k i).val) = prefixLaw μ X m`. Its proof calls `Equiv.Perm.exists_extending_pair`.
- `Equiv.Perm.exists_extending_pair`, `Mathlib/Logic/Equiv/Fintype.lean:158`, public (`@[expose] public section`). `[Finite α] (f g : α → β) (hf : Injective f) (hg : Injective g) : ∃ σ : Perm β, ∀ a, σ (f a) = g a`. It covers every injective selection, not only strictly monotone ones, so fit `more general`.
- `TauCeti.Probability.Exchangeable.contractable`, `TauCeti/Probability/Exchangeability/Contractability.lean:174`, public. It is already cited in the target "`contractable_of_exchangeable` and the `Contractable` pushforward API", whose note already records the map `contractable_of_exchangeable` → `Exchangeable.contractable`.
- `TauCeti.Probability.exists_strictMono_nat_extending_fin_eventually_add`, `PermutationExtension.lean:51`, public. `∃ (φ : ℕ → ℕ) (C : ℕ), StrictMono φ ∧ (∀ i : Fin m, φ i.val = k i) ∧ ∀ n, m ≤ n → φ n = n + C`. This is a strictly increasing map that is eventually `n + C`, not a permutation, so the same reasoning gives fit `related`.
- Every other Layer 0 citation was opened at its file and line. All are public.

**Edit for the orchestrator (AUDIT-40.result.json, before merge).**
- The target's `library` changes from `tauceti` to `both`: the extension-to-permutation content is Mathlib's lemma, as in the audit's other `both` targets. The note now holds the name map.
- In the replacement object, `exists_strictMono_nat_extending_fin_eventually_add` fit `exact` → `related` (same correction, not named by the finding).

Layer `tauceti:TauCetiRoadmap/Exchangeability#layer-0-sequence-laws-finite-marginals-and-symmetry-notions`:

- Replace the target `` "Finite approximation of infinite permutations and extension of strictly monotone finite selections to permutations" `` in place by:

```json
{
 "target": "Finite approximation of infinite permutations and extension of strictly monotone finite selections to permutations",
 "library": "both",
 "declarations": [
  {
   "name": "TauCeti.Probability.exists_strictMono_nat_extending_fin",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/PermutationExtension.lean",
   "line": 83,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.exists_strictMono_nat_extending_fin_eventually_add",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/PermutationExtension.lean",
   "line": 51,
   "fit": "related"
  },
  {
   "name": "Finset.exists_perm_eqOn_le_apply",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/PermutationExtension.lean",
   "line": 90,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.ExchangeableAt.blockLaw_eq_prefixLaw_of_injective",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/ExchangeableAtMonotone.lean",
   "line": 44,
   "fit": "related"
  },
  {
   "name": "Equiv.Perm.exists_extending_pair",
   "library": "mathlib",
   "file": "Mathlib/Logic/Equiv/Fintype.lean",
   "line": 158,
   "fit": "more general"
  }
 ],
 "note": "The roadmap's `exists_perm_extending_strictMono` has no declaration of that name. The extension of a finite injective (in particular strictly monotone) selection to a permutation is Mathlib's `Equiv.Perm.exists_extending_pair`: two injections from a finite type into `β` differ by a permutation of `β`. Tau Ceti uses it in `ExchangeableAt.blockLaw_eq_prefixLaw_of_injective`, which extends an injective `k : Fin m → Fin n` to a permutation of `Fin n`, so that an exchangeable `n`-prefix has the prefix law on every injective `m`-subselection. `exists_strictMono_nat_extending_fin` and `exists_strictMono_nat_extending_fin_eventually_add` extend a strictly monotone selection to a strictly increasing self-map of `ℕ` (the second one eventually `n ↦ n + C`), not to a permutation, so both are related only. `Finset.exists_perm_eqOn_le_apply` gives a permutation of `ℕ` that fixes one finite set pointwise and carries a disjoint one past any cutoff."
}
```

- In the target `` "`exchangeable_iff_fullyExchangeable` and the adjacent-transposition characterization" ``: remove `TauCeti.Probability.ExchangeableAt.invariantSubmonoid`.
- Layer verdict: unchanged (`built`).

**Kept.**
- The review confirms both name claims. The target that already maps `contractable_of_exchangeable` is unchanged. The verdict (`built`) and the other eight targets are also unchanged. `Finset.exists_perm_eqOn_le_apply` keeps fit `exact`.

## /2 (medium, library-claim): Layer 1 is built; two of its citations are private theorems

**What was checked.**
- README Layer 1, lines 356–362 (the kernel-measurability and rectangle bullets) and lines 366–369 (milestones `mixedIID_of_mixingRepresentative`, `conditionallyIID_of_jointRectangles`).
- `TauCeti.Probability.measure_eq_of_forall_prod_univ_pi`, `TauCeti/Probability/DeFinetti/ConditionalCommonEnding.lean:62`: `private theorem`.
- `TauCeti.Probability.measure_inter_blockCylinder_eq_setLIntegral`, `TauCeti/Probability/DeFinetti/JointRectangle.lean:94`: `private theorem`.
- Every public declaration the finding lists is already cited, at the stated line. In `TauCeti/MeasureTheory/Measure/ProductKernel.lean`: `measurable_probabilityMeasure_pi` :97, `aemeasurable_probabilityMeasure_pi_toMeasure` :125, `measurable_dirac_prod_probabilityMeasure_pi_const_toMeasure` :165, `measurable_infinitePi_const` :208, `bind_probabilityMeasure_pi_pi` :297. Also `mixedIID_of_mixingRepresentative` (`DeFinetti/CommonEnding.lean:47`), and in `DeFinetti/ConditionalCommonEnding.lean`: `conditionallyIID_of_jointRectangles` :88, `conditionallyIIDWith_of_measure_inter_blockCylinder_eq_setLIntegral` :126 and `conditionallyIIDWith_iff_forall_jointRectangles` :186.

**Edit for the orchestrator (AUDIT-40.result.json, before merge).**

Layer `tauceti:TauCetiRoadmap/Exchangeability#layer-1-product-kernels-and-mixtures`:

- In the target `` "Rectangle evaluation and equality-from-rectangles for random product measures" ``: remove `TauCeti.Probability.measure_eq_of_forall_prod_univ_pi`.
- In the target `` "`conditionallyIID_of_jointRectangles`: the joint-rectangle strengthening" ``: remove `TauCeti.Probability.measure_inter_blockCylinder_eq_setLIntegral`.
- Layer verdict: unchanged (`built`).

**Kept.**
- The review calls the private-citation claim "right and worth keeping". The verdict (`built`), the notes and all other citations are unchanged.
- Note, no edit: after the removal, the "equality-from-rectangles" half of the rectangle target has no standalone public statement. It is used only inside `conditionallyIID_of_jointRectangles` and `conditionallyIIDWith_iff_forall_jointRectangles` (`ConditionalCommonEnding.lean:88`, :186).

## /3 (medium, library-claim): Layer 2 is built except the a.e. comparison of the three σ-algebras

**What was checked.**
- README Layer 2, lines 404–408: `shift`, `shift_measurable`, `shift_iterate_measurable`. Line 429: `tail_le_exchangeableSigma`. Lines 433–435: "* the exchangeable / symmetric σ-algebra on path space, and its relationship to the tail and shift-invariant σ-algebras (and their completions and a.e. versions) under the de Finetti hypotheses;"
- Name map, all public:
  - `shift_measurable` = `measurable_shift` (`TauCeti/Probability/Exchangeability/Basic.lean:188`).
  - `shift_iterate_measurable` = `measurable_shift_iterate` (`TauCeti/Probability/Exchangeability/PathSpace/Shift.lean:67`).
  - `tail_le_exchangeableSigma` = `pathTail_le_exchangeableSigma` (`PathSpace/Exchangeable/Sigma.lean:155`). This one was already in AUDIT-40's note.
  - None of the three roadmap names is declared in `TauCeti/`.
- Sure comparisons, all public: `invariants_shift_le_pathTail` (`PathSpace/Invariant/Tail.lean:111`); `invariants_shift_lt_pathTail` (:212, over `Bool`); `pathTail_lt_exchangeableSigma` (`PathSpace/Exchangeable/TailStrict.lean:167`, for `⊥ < ‹MeasurableSpace α›`).
- The only a.e. statements treat one σ-algebra each. Both are public:
  - `exists_measurableSet_exchangeableSigma_ae_eq` (`PathSpace/Exchangeable/Ergodic.lean:113`): an a.e. permutation-invariant set is a.e. equal to an `exchangeableSigma` set.
  - `aestronglyMeasurable_invariants_iff_comp_ae_eq` (`TauCeti/Probability/Ergodic/InvariantSigma.lean:150`).
- `ExchangeableLaw` (`PathSpace/Law/Basic.lean:48`, public) is the predicate the new note uses. Layer 2 cites no private declaration.
- Verdict convention, checked over every `AUDIT-*.result.json`. In layers where one target is `absent` and all the others are built, 12 have verdict `partly built` and 2 have `built`. Both `built` cases are in AUDIT-05 (OrthogonalL2Bases Part D, ConformalMapping L5). In each, the absent target is explicitly out of scope, and its note says it does not hold the verdict back. The a.e. clause here is on the layer's own Build list (lines 433–435), so **`partly built`** is the audit's convention.

**Edit for the orchestrator (AUDIT-40.result.json, before merge).**
- The shift target's note gains the two shift names. A new `absent` target splits off the a.e. clause and carries the finding's missing statement. The verdict changes.

Layer `tauceti:TauCetiRoadmap/Exchangeability#layer-2-process-tails-and-path-space-dynamics`:

- Replace the target `` "The path-space shift and its measurable iterates" `` in place by:

```json
{
 "target": "The path-space shift and its measurable iterates",
 "library": "tauceti",
 "declarations": [
  {
   "name": "TauCeti.Probability.shift",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Basic.lean",
   "line": 78,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.measurable_shift",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Basic.lean",
   "line": 188,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.measurable_shift_iterate",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/PathSpace/Shift.lean",
   "line": 67,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.processShift",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/PathSpace/ProcessShift.lean",
   "line": 43,
   "fit": "related"
  }
 ],
 "note": "The roadmap's `shift_measurable` and `shift_iterate_measurable` are `measurable_shift` and `measurable_shift_iterate`. Both the path-space shift and the process-level shift, with the compatibility `processShift_eq_shift_iterate`."
}
```

- Insert immediately after the target `` "The exchangeable σ-algebra, `exchangeableSigma_le`, and its relation to the tail" ``:

```json
{
 "target": "The relationship of the exchangeable σ-algebra to the tail and shift-invariant σ-algebras modulo null sets (their completions and a.e. versions) under the de Finetti hypotheses",
 "library": "absent",
 "declarations": [
  {
   "name": "TauCeti.Probability.exists_measurableSet_exchangeableSigma_ae_eq",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/PathSpace/Exchangeable/Ergodic.lean",
   "line": 113,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.aestronglyMeasurable_invariants_iff_comp_ae_eq",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/InvariantSigma.lean",
   "line": 150,
   "fit": "related"
  }
 ],
 "note": "Not built. The sure comparisons `invariants (shift α) ≤ pathTail α ≤ exchangeableSigma α` and their strictness are proved (previous targets), but no declaration compares two of the three σ-algebras modulo the null sets of an exchangeable law. The a.e. results present concern one σ-algebra at a time: `exists_measurableSet_exchangeableSigma_ae_eq` (an a.e. permutation-invariant set is a.e. equal to an `exchangeableSigma` set) and `aestronglyMeasurable_invariants_iff_comp_ae_eq` (a.e. invariance under `T` is a.e. measurability for `invariants T`). The missing statement, for `α` standard Borel and an exchangeable probability law `ρ` on `ℕ → α` (`[StandardBorelSpace α]`, `[IsProbabilityMeasure ρ]`, `ExchangeableLaw ρ`): every `exchangeableSigma α`-measurable set is `ρ`-a.e. equal to a set in `MeasurableSpace.invariants (shift α)`, so the three σ-algebras agree modulo `ρ`-null sets. Route: the directing measure is a.e. a shift-invariant function of the path, and each exchangeable event `A` is a.e. equal to `{ν^{⊗ℕ}(A) = 1}` by the full-path disintegration and Hewitt–Savage for each fixed `ν`."
}
```

- Layer verdict: `built` → `partly built`.

**Note for the Tau Ceti maintainer.**
- `content/tau-ceti/Exchangeability/README.md`, Layer 2, lines 433–435. Current text:

  ```text
  * the exchangeable / symmetric σ-algebra on path space, and its relationship to the tail and
    shift-invariant σ-algebras (and their completions and a.e. versions) under the de Finetti
    hypotheses;
  ```

  Replace with:

  ```text
  * the exchangeable / symmetric σ-algebra on path space, and its relationship to the tail and
    shift-invariant σ-algebras: the sure inclusions
    `MeasurableSpace.invariants (shift α) ≤ pathTail α ≤ exchangeableSigma α`, and their agreement
    modulo null sets under the de Finetti hypotheses. For `[StandardBorelSpace α]` and an
    exchangeable probability law `ρ` on `ℕ → α` (`[IsProbabilityMeasure ρ]`, `ExchangeableLaw ρ`),
    every `exchangeableSigma α`-measurable set is `ρ`-a.e. equal to a set measurable for
    `MeasurableSpace.invariants (shift α)`, so the three σ-algebras have the same `ρ`-completion.
    Route: the directing measure is a.e. a shift-invariant function of the path, and each
    exchangeable event `A` is `ρ`-a.e. equal to `{x | (ν x)^{⊗ℕ} A = 1}`, by the full-path joint
    disintegration and Hewitt–Savage for each fixed `ν x`;
  ```

**Kept.**
- The review calls recording this clause as not built, with the rest of the layer built, "the right shape for the fix". Apart from the shift target's note, the six existing targets are unchanged, including the note on the strict chain.

## /4 (medium, library-claim): Layer 3 is built; its tail-measurability citation is a private theorem

**What was checked.**
- README Layer 3, lines 466–467: "* tail measurability of that limit and its identification with `μ[f ∘ X 0 | tailProcess X]`;". Milestone at line 482: `tendsto_integral_abs_blockAverage_sub_condExp`.
- `TauCeti.Probability.measurable_tailFamily_blockAverage`, `TauCeti/Probability/Exchangeability/L2/TailMeasurability.lean:69`: `private theorem`.
- `TauCeti.Probability.Contractable.tendsto_integral_abs_blockAverage_sub_condExp`, `L2/Cesaro/ToCondExp.lean:137`, public and already cited `exact`. It proves the block averages converge in L¹ to `μ[fun ω => f (X 0 ω) | tailProcess X]`.
- `TauCeti.Probability.Contractable.exists_tailProcess_measurable_cesaro_limit`, `L2/TailMeasurability.lean:141`, public. `∃ a : Ω → ℝ, Measurable[tailProcess X] a ∧ MemLp a 1 μ ∧ ∀ k, (∀ᶠ n in atTop, Function.Injective (k n)) → Tendsto (fun m => ∫ ω, |blockAverage … (k m) ω - a ω| ∂μ) atTop (𝓝 0)`. This is the public statement of the clause the private helper served, and it replaces that helper. It is an addition beyond the finding.
- Layer 3 cites no other private declaration.

**Edit for the orchestrator (AUDIT-40.result.json, before merge).**

Layer `tauceti:TauCetiRoadmap/Exchangeability#layer-3-l²-averaging-library-and-the-standard-borel-de-finetti-route`:

- Replace the target `` "Tail measurability of the limit and its identification with `μ[f ∘ X 0 | tailProcess X]`" `` in place by:

```json
{
 "target": "Tail measurability of the limit and its identification with `μ[f ∘ X 0 | tailProcess X]`",
 "library": "tauceti",
 "declarations": [
  {
   "name": "TauCeti.Probability.Contractable.tendsto_integral_abs_blockAverage_sub_condExp",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/L2/Cesaro/ToCondExp.lean",
   "line": 137,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.Contractable.exists_tailProcess_measurable_cesaro_limit",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/L2/TailMeasurability.lean",
   "line": 141,
   "fit": "exact"
  }
 ],
 "note": "`tendsto_integral_abs_blockAverage_sub_condExp` is the literal milestone name: the block averages converge in L¹ to `μ[f ∘ X 0 | tailProcess X]`, which identifies the limit. `Contractable.exists_tailProcess_measurable_cesaro_limit` states the tail measurability of the limit directly."
}
```

- Layer verdict: unchanged (`built`).

**Kept.**
- The review confirms the private claim. The verdict (`built`), the duplicate link to Layer 6 and the other six targets are unchanged.

## /5 (medium, library-claim): Layer 4 is partly built; the Lᵖ form is missing, and two citations are private

**What was checked.**
- README Layer 4, lines 545–547: milestones `condExp_exists_ae_limit_antitone`, `ae_limit_is_condexp_iInf`, `tendsto_ae_condExp_iInf`. Lines 552–565: the target theorem, with `(h_f_int : Integrable f μ)`. Lines 567–570 (quoted in the maintainer note).
- `TauCeti/Probability/Martingale/Convergence.lean`:
  - :72 `private lemma condExp_iInf_ae_eq_of_tendsto_ae_of_tendsto_eLpNorm`.
  - :109 `private theorem tendsto_ae_and_eLpNorm_condExp_iInf`.
  - :159 `tendsto_ae_condExp_iInf`, public: `[IsFiniteMeasure μ] (h_filtration : Antitone 𝔽) (h_le0 : 𝔽 0 ≤ (inferInstance : MeasurableSpace Ω)) (f : Ω → ℝ) : ∀ᵐ ω ∂μ, Tendsto (fun n => μ[f | 𝔽 n] ω) atTop (𝓝 (μ[f | ⨅ n, 𝔽 n] ω))`. It identifies the limit, so it publicly realises `ae_limit_is_condexp_iInf`, which is not declared.
  - :177 `tendsto_eLpNorm_condExp_iInf`, public, exponent fixed at `1`.
- Two more citations in this layer are private, both fit `related`: `MeasureTheory.lintegral_upcrossings_revCEFinite_bdd` (`Martingale/Crossings/Bounds.lean:90`, `private lemma`) in the adapter target, and `MeasureTheory.ae_upcrossings_condExp_lt_top` (`Martingale/AntitoneLimit.lean:43`, `private lemma`) in the existence target.
- AUDIT-40's note for the identification target said "exactly its hypotheses (… integrable `f`)". That is wrong: the theorem has no integrability hypothesis. The note is corrected. The fit stays `exact`, because the dropped hypothesis is vacuous (`condExp` of a non-integrable function is `0`).
- `MeasureTheory.revCEFinite`, `TauCeti/Probability/Martingale/Reverse.lean:61`, public `noncomputable def`. It is named in its target's title and in the finding's fix, but was not cited. It is now added.
- No Lᵖ form in either library.
  - In `TauCeti/`, the only statements about `condExp_iInf` are the four above plus `condExp_iInf_eq_of_eventually_const` (`Martingale/LevyDownwardEventuallyConst.lean:83`, not a norm statement).
  - In Mathlib 082e2d3, the only such convergence theorems are upward: `tendsto_ae_condExp` (`Mathlib/Probability/Martingale/Convergence.lean:426`) and `tendsto_eLpNorm_condExp` (:439, exponent `1`).

**Edit for the orchestrator (AUDIT-40.result.json, before merge).**
- `revCEFinite` is added to the first target, as the finding's fix lists it.
- Two more private lemmas are removed (same correction, not named by the finding). Both targets keep an `exact` public declaration, so no fit changes:
  - the adapter target keeps `upcrossings_bdd_uniform` (`Crossings/Bounds.lean:247`, a public alias of `exists_lintegral_upcrossings_condExp_le` :213);
  - the existence target keeps `condExp_exists_ae_limit_antitone` (`AntitoneLimit.lean:108`, a public alias) and `exists_integrable_tendsto_ae_condExp_of_antitone` (:63).

Layer `tauceti:TauCetiRoadmap/Exchangeability#layer-4-reverse-martingales-and-conditional-expectation-limits`:

- Replace the target `` "Finite-horizon reversal: `revFiltration`, `revCEFinite`, `revCEFinite_martingale`" `` in place by:

```json
{
 "target": "Finite-horizon reversal: `revFiltration`, `revCEFinite`, `revCEFinite_martingale`",
 "library": "tauceti",
 "declarations": [
  {
   "name": "MeasureTheory.revFiltration",
   "library": "tauceti",
   "file": "TauCeti/Probability/Martingale/Reverse.lean",
   "line": 51,
   "fit": "exact"
  },
  {
   "name": "MeasureTheory.revFiltration_apply",
   "library": "tauceti",
   "file": "TauCeti/Probability/Martingale/Reverse.lean",
   "line": 73,
   "fit": "exact"
  },
  {
   "name": "MeasureTheory.revCEFinite",
   "library": "tauceti",
   "file": "TauCeti/Probability/Martingale/Reverse.lean",
   "line": 61,
   "fit": "exact"
  },
  {
   "name": "MeasureTheory.revCEFinite_martingale",
   "library": "tauceti",
   "file": "TauCeti/Probability/Martingale/Reverse.lean",
   "line": 80,
   "fit": "exact"
  }
 ],
 "note": "Literal milestone names, in the `MeasureTheory` namespace (they are ordinary martingale theory with no exchangeability, which is where the roadmap says they belong)."
}
```

- In the target `` "The antitone adapter for Mathlib's upcrossing bound" ``: remove `MeasureTheory.lintegral_upcrossings_revCEFinite_bdd` (same correction, not named by the finding).
- In the target `` "Existence of the a.e. limit of `μ[f | 𝔽 n]` along an antitone filtration" ``: remove `MeasureTheory.ae_upcrossings_condExp_lt_top` (same correction, not named by the finding).
- Replace the target `` "Identification of the limit: `tendsto_ae_condExp_iInf`" `` in place by:

```json
{
 "target": "Identification of the limit: `tendsto_ae_condExp_iInf`",
 "library": "tauceti",
 "declarations": [
  {
   "name": "MeasureTheory.tendsto_ae_condExp_iInf",
   "library": "tauceti",
   "file": "TauCeti/Probability/Martingale/Convergence.lean",
   "line": 159,
   "fit": "exact"
  }
 ],
 "note": "The roadmap's target theorem, stated with no exchangeability as the layer requires, and without the roadmap's integrability hypothesis: only `[IsFiniteMeasure μ]`, antitone `𝔽` and `𝔽 0 ≤ ⊤` (for non-integrable `f` both sides are `0`). `ae_limit_is_condexp_iInf` has no public declaration of its own; `tendsto_ae_condExp_iInf` realises it publicly, since it identifies the a.e. limit with `μ[f | ⨅ n, 𝔽 n]`. The file's identification step `condExp_iInf_ae_eq_of_tendsto_ae_of_tendsto_eLpNorm` and the joint a.e./L¹ theorem `tendsto_ae_and_eLpNorm_condExp_iInf` are private."
}
```

- Replace the target `` "The L¹/Lᵖ convergence forms" `` in place by:

```json
{
 "target": "The L¹/Lᵖ convergence forms",
 "library": "partial",
 "declarations": [
  {
   "name": "MeasureTheory.tendsto_eLpNorm_condExp_iInf",
   "library": "tauceti",
   "file": "TauCeti/Probability/Martingale/Convergence.lean",
   "line": 177,
   "fit": "exact"
  }
 ],
 "note": "Partial. The L¹ form is built: `tendsto_eLpNorm_condExp_iInf` concludes `Tendsto (fun n => eLpNorm (μ[f | 𝔽 n] - μ[f | ⨅ n, 𝔽 n]) 1 μ) atTop (𝓝 0)` under `[IsFiniteMeasure μ]`, antitone `𝔽` and `𝔽 0 ≤ ⊤`, with no integrability hypothesis. The Lᵖ form is absent from both libraries: Tau Ceti's only norm-convergence statement fixes the exponent at `1`, and Mathlib has no downward theorem. Missing: for `[IsFiniteMeasure μ]`, antitone `𝔽` with `𝔽 0 ≤ ⊤`, `1 ≤ p < ∞` and `MemLp f p μ`, `Tendsto (fun n => eLpNorm (μ[f | 𝔽 n] - μ[f | ⨅ n, 𝔽 n]) p μ) atTop (𝓝 0)`."
}
```

- Layer verdict: `built` → `partly built`.

**Note for the Tau Ceti maintainer.**
- `content/tau-ceti/Exchangeability/README.md`, Layer 4, lines 567–570. Current text:

  ```text
  This theorem should be independent of exchangeability and later consumed by the martingale
  proof. The L¹ and Lᵖ convergence forms (for `f ∈ L¹` / `Lᵖ`, using Mathlib's
  uniform-integrability and eLp-norm conditional-expectation tools) are follow-up Layer 4
  targets; the L¹ form is what most uses want.
  ```

  Replace with:

  ````text
  This theorem should be independent of exchangeability and later consumed by the martingale
  proof. The L¹ and Lᵖ convergence forms, using Mathlib's uniform-integrability and eLp-norm
  conditional-expectation tools, are follow-up Layer 4 targets; the L¹ form is what most uses
  want, and is `tendsto_eLpNorm_condExp_iInf`. The Lᵖ form, for `1 ≤ p < ∞`:

  ```lean
  theorem tendsto_eLpNorm_condExp_iInf_of_memLp
      [IsFiniteMeasure μ]
      {𝔽 : ℕ → MeasurableSpace Ω}
      (h_filtration : Antitone 𝔽)
      (h_le0 : 𝔽 0 ≤ (inferInstance : MeasurableSpace Ω))
      {p : ℝ≥0∞} (hp : 1 ≤ p) (hp_top : p ≠ ∞)
      {f : Ω → ℝ} (hf : MemLp f p μ) :
      Tendsto
        (fun n => eLpNorm (μ[f | 𝔽 n] - μ[f | ⨅ n, 𝔽 n]) p μ)
        atTop
        (𝓝 0)
  ```
  ````

- The name `tendsto_eLpNorm_condExp_iInf_of_memLp` is only a suggestion. The maintainer may instead generalise the existing L¹ theorem to an exponent `p`.

**Kept.**
- The review confirms the finding. The adapter and existence targets keep their notes and public citations.

## /6 (medium, library-claim): Layer 5 is built by Mathlib and Tau Ceti together, mostly under other names

**What was checked.**
- README Layer 5:
  - Lines 584–590: `koopman`, `koopman_isometry`, `fixedSpace`, `metProjection`, `birkhoffAverage_tendsto_metProjection`.
  - Lines 595–602: operator bullets. Line 602 reads "* compatibility with composition and with the invariant σ-algebra."
  - Lines 606–626: the shift-specialised and bridge milestones.
- Mathlib 082e2d3. All are public; each file uses `@[expose] public section` or `public section`:
  - In `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean`: `MeasureTheory.Lp.norm_compMeasurePreserving` :581, `Lp.isometry_compMeasurePreserving` :585, `Lp.compMeasurePreserving_comp` :601, and `Lp.compMeasurePreservingₗᵢ [Fact (1 ≤ p)] … : Lp E p μb →ₗᵢ[𝕜] Lp E p μ` :636.
  - `MeasureTheory.condExpL2` (`Mathlib/MeasureTheory/Function/ConditionalExpectation/CondexpL2.lean:68`).
  - `ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection` (`Mathlib/Analysis/InnerProductSpace/MeanErgodic.lean:89`): the von Neumann mean ergodic theorem for `‖f‖ ≤ 1`.
- Tau Ceti f790474, all public:
  - `birkhoffAverage_tendsto_metProjection` (`TauCeti/Probability/Ergodic/MeanErgodic.lean:91`) is proved by applying that theorem to `Lp.compMeasurePreservingₗᵢ`.
  - `koopmanMarkov_comp` (`Ergodic/KoopmanMarkov.lean:98`).
  - `metProjection_eq_condExpL2` (`Ergodic/CondExpProjection.lean:86`), `metProjection_ae_eq_condExp` (:105) and `birkhoffAverage_tendsto_condExpL2` (:128).
  - `fixedSpace_eq_lpMeas_invariants` (`Ergodic/InvariantSigma.lean:173`), `aestronglyMeasurable_invariants_of_comp_ae_eq` (:113) and `aestronglyMeasurable_invariants_iff_comp_ae_eq` (:150). The iff is exactly ⟨`AEStronglyMeasurable.comp_ae_eq_of_invariants`, `aestronglyMeasurable_invariants_of_comp_ae_eq`⟩.
  - `Contractable.contractableLaw_pathLaw` (`Exchangeability/PathSpace/Law/Bridge.lean:79`) and `contractable_iff_contractableLaw_pathLaw` (:85).
  - `Contractable.map_shift_iterate_pathLaw` (`Exchangeability/Stationary.lean:44`), `ContractableLaw.measurePreserving_shift` (`PathSpace/ContractableLaw.lean:123`), `ConditionallyIIDWith.of_pathLaw` (`ConditionallyIID/Map.lean:123`) and `conditionallyIID_of_contractable_viaKoopman` (`DeFinetti/ViaKoopman/Theorem.lean:86`).
- A grep of `TauCeti/` for `koopman`, `koopman_isometry` and the 13 shift-specialised names finds no declarations. `proj_eq_condexp`, `conditionallyIID_transfer` (`ConditionallyIID/Map.lean:32`, :152) and `conditionallyIID_bind_of_contractable` occur only in comments.
- One refinement of the finding's map. The finding maps `pathSpace_contractable_of_contractable` to `contractable_iff_contractableLaw_pathLaw`. Its exact counterpart is that iff's forward direction, the separate public theorem `Contractable.contractableLaw_pathLaw`. That theorem is cited `exact`, and the note records both.
- Layer 5 cites no private declaration.

**Edit for the orchestrator (AUDIT-40.result.json, before merge).**
- `library` is set to `both` on the mean-ergodic target, because Mathlib's theorem carries the convergence. The Koopman target is already `both`.
- The identification target stays `tauceti`: the identification is Tau Ceti's, and `condExpL2` is cited as `related`.
- Beyond the Mathlib additions, Tau Ceti declarations the name map names are also cited: `koopmanMarkov_comp`, `aestronglyMeasurable_invariants_of_comp_ae_eq`, `Contractable.contractableLaw_pathLaw` and `ConditionallyIIDWith.of_pathLaw`.

Layer `tauceti:TauCetiRoadmap/Exchangeability#layer-5-koopman-operators-and-invariant-σ-algebras`:

- Replace the target `` "The Koopman/composition operator on `Lᵖ` for `1 ≤ p < ∞`, an isometric embedding" `` in place by:

```json
{
 "target": "The Koopman/composition operator on `Lᵖ` for `1 ≤ p < ∞`, an isometric embedding",
 "library": "both",
 "declarations": [
  {
   "name": "MeasureTheory.Lp.compMeasurePreserving",
   "library": "mathlib",
   "file": "Mathlib/MeasureTheory/Function/LpSpace/Basic.lean",
   "line": 565,
   "fit": "exact"
  },
  {
   "name": "MeasureTheory.Lp.compMeasurePreservingₗ",
   "library": "mathlib",
   "file": "Mathlib/MeasureTheory/Function/LpSpace/Basic.lean",
   "line": 629,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.coe_compMeasurePreservingₗᵢ",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/FixedSpace.lean",
   "line": 99,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.coeFn_iterate_compMeasurePreserving",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/BirkhoffLp.lean",
   "line": 44,
   "fit": "related"
  },
  {
   "name": "MeasureTheory.Lp.compMeasurePreservingₗᵢ",
   "library": "mathlib",
   "file": "Mathlib/MeasureTheory/Function/LpSpace/Basic.lean",
   "line": 636,
   "fit": "exact"
  },
  {
   "name": "MeasureTheory.Lp.norm_compMeasurePreserving",
   "library": "mathlib",
   "file": "Mathlib/MeasureTheory/Function/LpSpace/Basic.lean",
   "line": 581,
   "fit": "exact"
  },
  {
   "name": "MeasureTheory.Lp.isometry_compMeasurePreserving",
   "library": "mathlib",
   "file": "Mathlib/MeasureTheory/Function/LpSpace/Basic.lean",
   "line": 585,
   "fit": "exact"
  },
  {
   "name": "MeasureTheory.Lp.compMeasurePreserving_comp",
   "library": "mathlib",
   "file": "Mathlib/MeasureTheory/Function/LpSpace/Basic.lean",
   "line": 601,
   "fit": "related"
  }
 ],
 "note": "The roadmap's `koopman` is Mathlib's `Lp.compMeasurePreservingₗᵢ`, and `koopman_isometry` is `Lp.norm_compMeasurePreserving` / `Lp.isometry_compMeasurePreserving`; compatibility with composition is `Lp.compMeasurePreserving_comp`. Mathlib supplies the operator and its isometry; Tau Ceti adds the bridge between the operator-level and pointwise Birkhoff averages. The layer's own instruction is to state it at this generality rather than only on `L²`, and that is what is there."
}
```

- Replace the target `` "The Markov operator on measurable germs / `L^∞`: positive, unital and (for the deterministic Koopman operator) multiplicative" `` in place by:

```json
{
 "target": "The Markov operator on measurable germs / `L^∞`: positive, unital and (for the deterministic Koopman operator) multiplicative",
 "library": "tauceti",
 "declarations": [
  {
   "name": "TauCeti.Probability.koopmanMarkov",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/KoopmanMarkov.lean",
   "line": 40,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.koopmanMarkov_one",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/KoopmanMarkov.lean",
   "line": 58,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.koopmanMarkov_mul",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/KoopmanMarkov.lean",
   "line": 66,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.coeFn_koopmanMarkov",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/KoopmanMarkov.lean",
   "line": 52,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.koopmanMarkov_comp",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/KoopmanMarkov.lean",
   "line": 98,
   "fit": "related"
  }
 ],
 "note": "`koopmanMarkov_mul` is the multiplicativity the layer singles out as special to composition operators. Compatibility with composition is `koopmanMarkov_comp`, which reverses the order."
}
```

- Replace the target `` "`fixedSpace`, the mean ergodic projection `metProjection`, and `birkhoffAverage_tendsto_metProjection`" `` in place by:

```json
{
 "target": "`fixedSpace`, the mean ergodic projection `metProjection`, and `birkhoffAverage_tendsto_metProjection`",
 "library": "both",
 "declarations": [
  {
   "name": "TauCeti.Probability.fixedSpace",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/FixedSpace.lean",
   "line": 41,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.metProjection",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/MeanErgodic.lean",
   "line": 43,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.metProjection_mem_fixedSpace",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/MeanErgodic.lean",
   "line": 48,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.birkhoffAverage_tendsto_metProjection",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/MeanErgodic.lean",
   "line": 91,
   "fit": "exact"
  },
  {
   "name": "ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection",
   "library": "mathlib",
   "file": "Mathlib/Analysis/InnerProductSpace/MeanErgodic.lean",
   "line": 89,
   "fit": "more general"
  }
 ],
 "note": "`fixedSpace`, `metProjection` and `birkhoffAverage_tendsto_metProjection` are literal milestone names (`metProjection_mem_fixedSpace` is supporting API). `birkhoffAverage_tendsto_metProjection` is a thin instance of Mathlib's von Neumann mean ergodic theorem `ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection`, applied to `Lp.compMeasurePreservingₗᵢ` at `p = 2`. The roadmap's shift-specialised `fixedSubspace`, `metProjectionShift` and `metProjectionShift_tendsto` are not separate declarations: they are these three at `T = shift α`."
}
```

- Replace the target `` "Identification of the projection with conditional expectation onto the invariant σ-algebra" `` in place by:

```json
{
 "target": "Identification of the projection with conditional expectation onto the invariant σ-algebra",
 "library": "tauceti",
 "declarations": [
  {
   "name": "TauCeti.Probability.metProjection_eq_condExpL2",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/CondExpProjection.lean",
   "line": 86,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.metProjection_ae_eq_condExp",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/CondExpProjection.lean",
   "line": 105,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.fixedSpace_eq_lpMeas_invariants",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/InvariantSigma.lean",
   "line": 173,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.aestronglyMeasurable_invariants_iff_comp_ae_eq",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/InvariantSigma.lean",
   "line": 150,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.aestronglyMeasurable_invariants_of_comp_ae_eq",
   "library": "tauceti",
   "file": "TauCeti/Probability/Ergodic/InvariantSigma.lean",
   "line": 113,
   "fit": "related"
  },
  {
   "name": "MeasureTheory.condExpL2",
   "library": "mathlib",
   "file": "Mathlib/MeasureTheory/Function/ConditionalExpectation/CondexpL2.lean",
   "line": 68,
   "fit": "related"
  }
 ],
 "note": "This is the roadmap's `proj_eq_condexp` / `lpMeas_eq_fixedSubspace` pair (`metProjection_eq_condExpL2` / `metProjection_ae_eq_condExp` and `fixedSpace_eq_lpMeas_invariants`), and the file header explicitly flags it as a separate theorem rather than a simp step, exactly the layer's warning. The roadmap's `condexpL2` is Mathlib's `condExpL2`. Its `koopman_eq_self_of_shiftInvariant` and `aestronglyMeasurable_shiftInvariant_of_koopman` are the two directions of `aestronglyMeasurable_invariants_iff_comp_ae_eq` at `T = shift α`; the second is `aestronglyMeasurable_invariants_of_comp_ae_eq`."
}
```

- Replace the target `` "Path-space specialisation: shift preservation from contractability and the shift-invariant conditional law" `` in place by:

```json
{
 "target": "Path-space specialisation: shift preservation from contractability and the shift-invariant conditional law",
 "library": "tauceti",
 "declarations": [
  {
   "name": "TauCeti.Probability.ContractableLaw.measurePreserving_shift",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/PathSpace/ContractableLaw.lean",
   "line": 123,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.Contractable.measurePreserving_shift_iterate",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Stationary.lean",
   "line": 37,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.Contractable.map_shift_iterate_pathLaw",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Stationary.lean",
   "line": 44,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.invariantConditionalProbabilityMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/ViaKoopman/InvariantConditionalLaw.lean",
   "line": 67,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.invariantConditionalProbabilityMeasure_ae_eq_condExp",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/ViaKoopman/InvariantConditionalLaw.lean",
   "line": 106,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.Contractable.contractableLaw_pathLaw",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/PathSpace/Law/Bridge.lean",
   "line": 79,
   "fit": "exact"
  }
 ],
 "note": "The roadmap's `pathSpace_contractable_of_contractable` is `Contractable.contractableLaw_pathLaw` (the forward direction of `contractable_iff_contractableLaw_pathLaw`), and `pathSpace_shift_preserving_of_contractable` / `measure_map_shift_eq_of_contractable` are `ContractableLaw.measurePreserving_shift` and `Contractable.map_shift_iterate_pathLaw`. `metProjectionShift` is the generic `metProjection` at `T = shift α`, and `condexpL2` is Mathlib's `MeasureTheory.condExpL2`."
}
```

- Replace the target `` "`deFinetti_viaKoopman` and the conditional-i.i.d. transfer" `` in place by:

```json
{
 "target": "`deFinetti_viaKoopman` and the conditional-i.i.d. transfer",
 "library": "tauceti",
 "declarations": [
  {
   "name": "TauCeti.Probability.deFinetti_viaKoopman",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/ViaKoopman/Theorem.lean",
   "line": 100,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.conditionallyIID_of_contractable_viaKoopman",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/ViaKoopman/Theorem.lean",
   "line": 86,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.ContractableLaw.conditionallyIIDWith_invariantConditionalProbabilityMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/ViaKoopman/Theorem.lean",
   "line": 72,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.ContractableLaw.condExp_indicator_coord_ae_eq_invariantConditionalProbabilityMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/ViaKoopman/Decoupling.lean",
   "line": 155,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.ContractableLaw.measure_inter_blockCylinder_eq_setLIntegral_of_measurableSet_invariants",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/ViaKoopman/CylinderMass.lean",
   "line": 73,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.ConditionallyIIDWith.of_pathLaw",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/ConditionallyIID/Map.lean",
   "line": 123,
   "fit": "exact"
  }
 ],
 "note": "The Koopman route reaches the summit and is import-independent of the L² route; `conditionallyIID_transfer` is `ConditionallyIIDWith.of_pathLaw`, which carries the path-space statement to an arbitrary sample space, and `conditionallyIID_bind_of_contractable` is `conditionallyIID_of_contractable_viaKoopman`."
}
```

- Layer verdict: unchanged (`built`).

**Note for downstream consumers (ProbabilisticAndMetricNumberTheory:PM.4, AdditiveCombinatorics:AC.2).**
- Neither stage should rebuild the generic Koopman / mean-ergodic lane as an owned prerequisite. AC.2's text reads "include ergodic/combinatorial infrastructure as owned prerequisites".
- The lane's substance is two results, both for an arbitrary measure-preserving `T`, not only the shift:
  - Mathlib's von Neumann mean ergodic theorem `ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection` (`Mathlib/Analysis/InnerProductSpace/MeanErgodic.lean:89`), applied to the Koopman isometry `MeasureTheory.Lp.compMeasurePreservingₗᵢ`.
  - Tau Ceti's identification of the limit projection with conditional expectation onto `MeasurableSpace.invariants T`: `TauCeti.Probability.metProjection_ae_eq_condExp` (`TauCeti/Probability/Ergodic/CondExpProjection.lean:105`). Its `L²` form is `metProjection_eq_condExpL2` (:86), and the combined convergence statement is `birkhoffAverage_tendsto_condExpL2` (:128).

**Kept.**
- The review confirms the finding. The existing name maps in the notes (`proj_eq_condexp` / `lpMeas_eq_fixedSubspace`, the shift-preservation names, `conditionallyIID_transfer`) are kept and extended. The verdict (`built`) is unchanged.

## /7 (medium, library-claim): Layer 6 is built; its factorization and extreme-point citations are private

**What was checked.**
- README Layer 6, line 691: "* the finite-dimensional factorization identity;". Lines 657–664: milestones. Lines 745–766: the zero-one, ergodic and extreme interfaces.
- `TauCeti.Probability.blockLaw_prefix_eq_lintegral_prod_directingMeasure`, `TauCeti/Probability/DeFinetti/BlockFactorization.lean:224`: `private theorem`.
- `TauCeti.Probability.exists_eq_infinitePi_of_mem_extremePoints`, `TauCeti/Probability/Exchangeability/PathSpace/Law/Extreme.lean:141`: `private theorem`.
- `condExp_blockIndicatorProd_prefix_ae_eq_prod_directingMeasure`, `BlockFactorization.lean:206`, public. It is already cited `exact` in the same target.
- `mixedIIDWith_of_contractable`, `BlockFactorization.lean:266`, public, concludes `MixedIIDWith μ X (directingProbabilityMeasure μ X)`. By the definition of `MixedIIDWith` (`Exchangeability/MixedIID/Basic.lean:103`), this is the block-law identity `blockLaw μ X k = μ.bind fun ω => (ProbabilityMeasure.pi fun _ : Fin m => ν ω).toMeasure` for every injective `k`. That is the integrated factorization identity, so it replaces the private citation in place, with fit `exact`.
- The zero-one target's remaining citations are all public: `exchangeableSigma_trivial_iff_iid`, `exchangeableSigma_trivial_iff_ergodicSMul`, `exchangeable_extreme_iff_iid` and `infinitePi_mem_extremePoints_exchangeable`. Layer 6 cites no other private declaration.

**Edit for the orchestrator (AUDIT-40.result.json, before merge).**

Layer `tauceti:TauCetiRoadmap/Exchangeability#layer-6-directing-measures-and-de-finetti-representation`:

- Replace the target `` "Finite-product factorization and the summit theorems `conditionallyIID_of_contractable`, `conditionallyIID_of_exchangeable`, `deFinetti`" `` in place by:

```json
{
 "target": "Finite-product factorization and the summit theorems `conditionallyIID_of_contractable`, `conditionallyIID_of_exchangeable`, `deFinetti`",
 "library": "tauceti",
 "declarations": [
  {
   "name": "TauCeti.Probability.conditionallyIID_of_contractable",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/Theorem.lean",
   "line": 141,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.conditionallyIID_of_exchangeable",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/Theorem.lean",
   "line": 151,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.deFinetti",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/Theorem.lean",
   "line": 160,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.condExp_blockIndicatorProd_prefix_ae_eq_prod_directingMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/BlockFactorization.lean",
   "line": 206,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.mixedIIDWith_of_contractable",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/BlockFactorization.lean",
   "line": 266,
   "fit": "exact"
  }
 ],
 "note": "`deFinetti` concludes `ConditionallyIID` over a nonempty standard Borel state space, the sharp Kallenberg 1.1 form the layer demands as the summit. The finite-dimensional factorization identity is `condExp_blockIndicatorProd_prefix_ae_eq_prod_directingMeasure` (conditional form, prefix blocks) and `mixedIIDWith_of_contractable` (integrated form, every injective selection)."
}
```

- In the target `` "The zero-one, ergodic and extreme interfaces for exchangeable laws" ``: remove `TauCeti.Probability.exists_eq_infinitePi_of_mem_extremePoints`.
- Layer verdict: unchanged (`built`).

**Kept.**
- The review confirms the finding. The verdict (`built`), both duplicate links and the other eight targets are unchanged.

## /9 (medium, library-claim): Layer 8 is partly built; qualify Diaconis–Freedman, and split arrays from Aldous–Hoover

**What was checked.**
- README Layer 8: line 881, "* de Finetti for other countable index types;". Lines 882–886: the affine and ergodic decomposition. Line 887: "* Markov exchangeability;". Lines 888–889: "* exchangeable arrays and the Aldous–Hoover representation (a substantially larger tower than the sequence theorem, with its own prerequisites)."
- `TauCeti.Probability.MarkovExchangeable.mixedMarkovChain`, `TauCeti/Probability/Exchangeability/Recurrence/RowExchangeable.lean:423`, public. Its binders are `[IsProbabilityMeasure μ] {a₀ : α} (h : MarkovExchangeable μ X) (hrec : Recurrent μ X) (hvis : ∀ᵐ ω ∂μ, ∀ a : α, ∃ n, X n ω = a) (h0 : ∀ᵐ ω ∂μ, X 0 ω = a₀) : MixedMarkovChain μ X`.
  - `Recurrent` (`TauCeti/Probability/Recurrent.lean:70`) is `∀ᵐ ω ∂μ, ∀ k, ∃ᶠ n in atTop, X n ω = X k ω`.
  - `h0` and `hvis` are the two extra hypotheses, so the fit becomes `special case`.
  - `MarkovExchangeable.exists_pathLaw_eq_map_deFinettiBarycenter` (`Recurrence/Representation.lean:132`) needs only `hrec` and `h0`.
  - `MixedMarkovChain.markovExchangeable` (`Exchangeability/MixedMarkovChain.lean:257`) is public.
- Ergodic identification:
  - `exchangeableSigma_trivial_iff_ergodicSMul` (`PathSpace/Exchangeable/Ergodic.lean:176`): `[IsProbabilityMeasure ρ] (hρ : ExchangeableLaw ρ)`, trivial `exchangeableSigma` ⇔ `ErgodicSMul FinitaryPerm (ℕ → α) ρ`.
  - `exchangeableSigma_trivial_iff_iid` (`PathSpace/Law/ZeroOne.lean:97`): the same hypotheses plus `[StandardBorelSpace α]`, trivial ⇔ `∃ P, ρ = Measure.infinitePi fun _ => P`.
  - Both are public, and no single theorem states ergodic ⇔ product.
- Arrays, all public:
  - `SeparatelyExchangeable` (`Exchangeability/Arrays/Basic.lean:193`) and `JointlyExchangeable` (:203).
  - `JointlyDissociated` (`Arrays/Dissociated.lean:127`).
  - `SeparatelyExchangeable.conditionallyIID_arrayRow` (`Arrays/DeFinetti.lean:65`).
  - `jointlyDissociated_iff_ergodicSMul` (`Arrays/Ergodic.lean:298`, for a jointly exchangeable array law).
  - In `Arrays/AldousHoover/Basic.lean`: `separateArray` :274, `separatelyExchangeable_separateArray` :308, `jointArray` :326 and `jointlyExchangeable_jointArray` :379.
  - `separatelyDissociated_separateArray_of_snd` (`AldousHoover/Dissociated.lean:98`).
  - `SeparatelyExchangeable.exists_arrayLaw_eq_map_unitIntervalCoding` (`Arrays/Coding.lean:172`): a row-level coding with a random path law `P`. It is not the Aldous–Hoover form.
- The header of `AldousHoover/Basic.lean` says: "The converse representation direction still has to construct the coding function from an exchangeable array." No declaration outside `AldousHoover/` uses `separateArray` or `jointArray`, and Mathlib has no Aldous or Hoover file.

**Edit for the orchestrator (AUDIT-40.result.json, before merge).**
- Qualifying the Markov target changes the fit of `MarkovExchangeable.mixedMarkovChain` from `exact` to `special case` and puts the binders in the note.
- The arrays target is renamed "Exchangeable arrays" and stays `partial`. A new `absent` target for the representation itself is inserted after it.

Layer `tauceti:TauCetiRoadmap/Exchangeability#layer-8-generalized-exchangeability-and-representation-theorems`:

- Replace the target `` "The affine and ergodic decomposition: `p ↦ p^{⊗ℕ}` and the de Finetti barycenter as an affine correspondence, with the components identified as the ergodic ones" `` in place by:

```json
{
 "target": "The affine and ergodic decomposition: `p ↦ p^{⊗ℕ}` and the de Finetti barycenter as an affine correspondence, with the components identified as the ergodic ones",
 "library": "tauceti",
 "declarations": [
  {
   "name": "TauCeti.Probability.deFinettiBarycenter",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/Barycenter.lean",
   "line": 90,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.deFinettiEquiv",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/Correspondence.lean",
   "line": 102,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.deFinettiEquiv_convexComb",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/Correspondence.lean",
   "line": 182,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.deFinettiBarycenter_mem_extremePoints_iff",
   "library": "tauceti",
   "file": "TauCeti/Probability/DeFinetti/Correspondence.lean",
   "line": 215,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.exchangeableSigma_trivial_iff_ergodicSMul",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/PathSpace/Exchangeable/Ergodic.lean",
   "line": 176,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.exchangeableSigma_trivial_iff_iid",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/PathSpace/Law/ZeroOne.lean",
   "line": 97,
   "fit": "related"
  }
 ],
 "note": "The barycenter, the affine bijection with exchangeable path laws, its restriction to point masses, and the identification of the components with the extreme laws. The ergodic identification is not one theorem: it is the composition of `exchangeableSigma_trivial_iff_ergodicSMul` (trivial `exchangeableSigma` ⇔ `ErgodicSMul` for the finitely supported permutation action) and `exchangeableSigma_trivial_iff_iid` (trivial `exchangeableSigma` ⇔ an infinite product law, for `[StandardBorelSpace α]`), both for an exchangeable probability law."
}
```

- Replace the target `` "Markov exchangeability and the Diaconis–Freedman representation" `` in place by:

```json
{
 "target": "Markov exchangeability and the Diaconis–Freedman representation",
 "library": "tauceti",
 "declarations": [
  {
   "name": "TauCeti.Probability.MixedMarkovChainWith",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/MixedMarkovChain.lean",
   "line": 100,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.MarkovExchangeable.mixedMarkovChain",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Recurrence/RowExchangeable.lean",
   "line": 423,
   "fit": "special case"
  },
  {
   "name": "TauCeti.Probability.MarkovExchangeable.rowExchangeable_successorProcess",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Recurrence/RowExchangeable.lean",
   "line": 365,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.mixedMarkovChain_of_rowExchangeable_successorProcess",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/DiaconisFreedman.lean",
   "line": 180,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.MarkovExchangeable.exists_pathLaw_eq_map_deFinettiBarycenter",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Recurrence/Representation.lean",
   "line": 132,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.MixedMarkovChain.markovExchangeable",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/MixedMarkovChain.lean",
   "line": 257,
   "fit": "related"
  }
 ],
 "note": "Built with two hypotheses beyond Diaconis–Freedman's recurrence, so it is not the unqualified Diaconis–Freedman theorem: `MarkovExchangeable.mixedMarkovChain [IsProbabilityMeasure μ] {a₀ : α} (h : MarkovExchangeable μ X) (hrec : Recurrent μ X) (hvis : ∀ᵐ ω ∂μ, ∀ a : α, ∃ n, X n ω = a) (h0 : ∀ᵐ ω ∂μ, X 0 ω = a₀) : MixedMarkovChain μ X`. That is, the process must also start almost surely at a fixed state `a₀` (`h0`) and almost surely visit every state (`hvis`). The excursion-mixture decomposition `MarkovExchangeable.exists_pathLaw_eq_map_deFinettiBarycenter` needs `h0` and recurrence only. The easy converse is `MixedMarkovChain.markovExchangeable`."
}
```

- Replace the target `` "Exchangeable arrays and the Aldous–Hoover representation" `` in place by:

```json
{
 "target": "Exchangeable arrays",
 "library": "partial",
 "declarations": [
  {
   "name": "TauCeti.Probability.AldousHoover.noiseMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Basic.lean",
   "line": 128,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.AldousHoover.separatelyDissociated_separateArray_of_snd",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Dissociated.lean",
   "line": 98,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.SeparatelyExchangeable.conditionallyIID_arrayRow",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/DeFinetti.lean",
   "line": 65,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.jointlyDissociated_iff_ergodicSMul",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/Ergodic.lean",
   "line": 298,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.SeparatelyExchangeable",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/Basic.lean",
   "line": 193,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.JointlyExchangeable",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/Basic.lean",
   "line": 203,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.JointlyDissociated",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/Dissociated.lean",
   "line": 127,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.AldousHoover.separatelyExchangeable_separateArray",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Basic.lean",
   "line": 308,
   "fit": "exact"
  },
  {
   "name": "TauCeti.Probability.AldousHoover.jointlyExchangeable_jointArray",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Basic.lean",
   "line": 379,
   "fit": "exact"
  }
 ],
 "note": "Partial. Built: the symmetry predicates `SeparatelyExchangeable` and `JointlyExchangeable`; de Finetti for the rows and columns of an array; separate and joint dissociation, with the corner-tail zero-one law and the ergodic characterisation `jointlyDissociated_iff_ergodicSMul` (for a jointly exchangeable array law); and the *easy* direction of Aldous–Hoover (every measurable coding of the canonical i.i.d. uniform noise is exchangeable, and every coding that ignores the global variable is dissociated). Missing: the representation direction, recorded as the next target."
}
```

- Insert immediately after the target `` "Exchangeable arrays" ``:

```json
{
 "target": "The Aldous–Hoover representation itself: every separately or jointly exchangeable array has the law of a measurable coding of i.i.d. uniform noise",
 "library": "absent",
 "declarations": [
  {
   "name": "TauCeti.Probability.SeparatelyExchangeable.exists_arrayLaw_eq_map_unitIntervalCoding",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/Coding.lean",
   "line": 172,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.AldousHoover.separateArray",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Basic.lean",
   "line": 274,
   "fit": "related"
  },
  {
   "name": "TauCeti.Probability.AldousHoover.jointArray",
   "library": "tauceti",
   "file": "TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Basic.lean",
   "line": 326,
   "fit": "related"
  }
 ],
 "note": "Not built in either library; only the easy converse exists (previous target). The header of `Arrays/AldousHoover/Basic.lean` says: 'The converse representation direction still has to construct the coding function from an exchangeable array.' `separateArray` and `jointArray` are the coding forms the theorem would produce. The closest result is the row-level coding `SeparatelyExchangeable.exists_arrayLaw_eq_map_unitIntervalCoding`, which keeps one random path law `P` and one uniform variable per row rather than resolving `P` into column and cell noise. The roadmap states no hypotheses or form for this target."
}
```

- Layer verdict: unchanged (`partly built`).

**Kept.**
- The review confirms the finding. Unchanged: the verdict (`partly built`), the first four targets and both DenseGraphLimits duplicate links. The README and link-map work on arrays belongs to /10 and /11.

## /10 (medium, missing): the Aldous–Hoover representation in Exchangeability Layer 8 is planned by name only

**What was checked.**

- Exchangeability README (unchanged since the link packet's input: blob `5676186`). Lines 888–889 are the whole specification of the target:

  ```text
  888	* exchangeable arrays and the Aldous–Hoover representation (a substantially larger tower than
  889	  the sequence theorem, with its own prerequisites).
  ```

  Line 887 is `* Markov exchangeability;`. References, lines 933–947: Kallenberg 2005 (cited only at "Chapter 1, Theorem 1.1", lines 935–936), Aldous's Saint-Flour notes (937–938), and Diaconis–Freedman "Finite exchangeable sequences" (943–944). As the review corrects, the list does contain array sources (Saint-Flour, and Kallenberg, whose Chapter 7 treats arrays). What is missing is a source attached to the Layer 8 target, the papers Aldous 1981 and Hoover 1979, and any Markov-exchangeability source.
- Tau Ceti f790474. All declarations below are public (`public section`, not `private`):

  | Declaration | File:line | Shape |
  |---|---|---|
  | `TauCeti.Probability.SeparatelyExchangeable` | `TauCeti/Probability/Exchangeability/Arrays/Basic.lean:193` | `(μ : Measure Ω) (X : ℕ × ℕ → Ω → α)`; law invariant under `(i, j) ↦ (σ i, τ j)` |
  | `TauCeti.Probability.JointlyExchangeable` | `…/Arrays/Basic.lean:203` | the same with `σ = τ`; diagonal included |
  | `TauCeti.Probability.SeparatelyDissociated` / `JointlyDissociated` | `…/Arrays/Dissociated.lean:117` / `:127` | `IndepFun` of blocks along index maps `e e' : ℕ → ℕ` with disjoint ranges |
  | `TauCeti.Probability.jointlyDissociated_iff_ergodicSMul` | `…/Arrays/Ergodic.lean:298` | `{ρ : Measure (ℕ × ℕ → α)} [IsZeroOrProbabilityMeasure ρ] (hexch : JointlyExchangeable ρ fun p x => x p)`: `JointlyDissociated ρ (fun p x => x p) ↔ ErgodicSMul FinitaryPerm (ℕ × ℕ → α) ρ` |
  | `TauCeti.Probability.AldousHoover.NoiseIndex`, `.Axis` | `…/Arrays/AldousHoover/Basic.lean:83`, `:89` | `global`, `vertex (axis : κ) (i : ℕ)`, `cell (p : ι)`; `Axis = row \| column` |
  | `TauCeti.Probability.AldousHoover.noiseMeasure` | `…/AldousHoover/Basic.lean:128` | `(κ ι : Type*) : Measure (NoiseIndex κ ι → I)`, i.i.d. uniform |
  | `TauCeti.Probability.AldousHoover.separateArray` | `…/AldousHoover/Basic.lean:274` | `(f : I × I × I × I → α) (p : ℕ × ℕ) (u : NoiseIndex Axis (ℕ × ℕ) → I) : α` |
  | `TauCeti.Probability.AldousHoover.jointArray` | `…/AldousHoover/Basic.lean:326` | `(f : I × I × I × I → α) (p : ℕ × ℕ) (u : NoiseIndex Unit (Sym2 ℕ) → I) : α`, cell `s(p.1, p.2)` |
  | `AldousHoover.separatelyExchangeable_separateArray`, `AldousHoover.jointlyExchangeable_jointArray` | `…/AldousHoover/Basic.lean:308`, `:379` | the easy direction, `(hf : Measurable f)` |
  | `AldousHoover.jointlyDissociated_jointArray_of_snd` | `…/AldousHoover/Dissociated.lean:154` | `(g : I × I × I → α) (hg : Measurable g) : JointlyDissociated (noiseMeasure Unit (Sym2 ℕ)) (jointArray fun q => g q.2)` |
  | `AldousHoover.separatelyDissociated_separateArray_of_snd` | `…/AldousHoover/Dissociated.lean:98` | the separate analogue |

- The converse is absent: the header of `Arrays/AldousHoover/Basic.lean` says "The converse representation direction still has to construct the coding function from an exchangeable array." The nearest result, `SeparatelyExchangeable.exists_arrayLaw_eq_map_unitIntervalCoding` (`…/Arrays/Coding.lean:172`), codes each row through a mixing law on `ProbabilityMeasure (ℕ → α)`. It does not give the four-variable form. There is also no lemma saying that joint dissociation depends only on the array law. Every dissociation theorem in `Arrays/` was listed, and none has that form.
- `TauCeti/Probability/Kernel/Randomization.lean` states laws only: `unitIntervalCoding` (:94), `exists_measurable_map_prod_volume_eq_compProd` (:162), `exists_measurable_map_prod_volume_eq` (:172), `exists_measurable_map_map_prod_volume_eq_map_prodMk` (:183, `((μ.map X).prod volume).map (fun p => (p.1, f p.1 p.2)) = μ.map fun ω => (X ω, Y ω)`), and `exists_measurable_map_prod_volume_eq_map_prodMk` (:200). None of them codes a conditional independence almost surely. The law-level core of the transfer theorem is :183, so transfer in Kallenberg's form, for an arbitrary `ξ' =ᵈ ξ` with an independent uniform, is a short corollary of it. Mathlib's `ProbabilityTheory.CondIndepFun` (`Mathlib/Probability/Independence/Conditional.lean:155`) requires `[StandardBorelSpace Ω]`.
- `TauCeti/Probability/Exchangeability/Arrays/Block.lean` provides:
  - `arrayBlock` (:88) and `arrayBlockPair` (:98);
  - `JointlyExchangeable.separatelyExchangeable_arrayBlock` (:162) and `…_arrayBlockPair` (:175), which require injective `e`, `f` with `Disjoint (Set.range e) (Set.range f)`;
  - the even–odd instances (:204, :211);
  - `JointlyExchangeable.map_arrayBlock_eq` (:297).

  Only the cross entries between two disjoint index sets are covered. Neither the diagonal nor the pairs inside one index set are.
- Where the finding's statements do not typecheck, corrected in the note below:
  - `noiseMeasure` takes two explicit types. The separate case is `noiseMeasure Axis (ℕ × ℕ)`. The joint case is `noiseMeasure Unit (Sym2 ℕ)`: vertex noise is indexed by `Unit`, and the cell index `Sym2 ℕ` includes the diagonal pairs `s(i, i)`.
  - The codings put the array index before the noise, so the law is `(noiseMeasure …).map fun u p => separateArray f p u`.
  - The finding's `f : I × I × I × I → α` is right; `×` nests to the right.
  - "`f` independent of the global variable" is `jointArray fun q => g q.2` with `g : I × I × I → α`.
  - The "if" half of AH3 needs, besides `jointlyDissociated_jointArray_of_snd`, the law-invariance lemma above, which does not exist yet.
  - For AH4: `sampleExchangeableLaw W` is a family of finite marginals, so the infinite graph law must be compared with `infiniteSampleLaw W`. See /11.
- Sources, checked on Crossref, with OpenAlex and zbMATH where Crossref lacks pages:

  | Item | Verified data | DOI |
  |---|---|---|
  | Aldous 1981 | "Representations for partially exchangeable arrays of random variables", *J. Multivariate Anal.* 11(4) (1981), 581–598 (Crossref) | `10.1016/0047-259X(81)90099-3` |
  | Hoover 1979 | "Relations on Probability Spaces and Arrays of Random Variables", preprint, Institute for Advanced Study, Princeton, NJ, 1979 (as cited by Diaconis–Janson [14]; Austin [41] gives only "1979"). Not on Crossref; the preprint is not publicly available. | none |
  | Diaconis–Freedman 1980 | "De Finetti's theorem for Markov chains", *Ann. Probab.* 8(1) (1980), 115–130. Crossref gives no pages; they are from zbMATH 0426.60064 and match `TauCeti/Probability/Exchangeability/MarkovExchangeable.lean`'s own reference. | `10.1214/aop/1176994828` |
  | Kallenberg 2005 | *Probabilistic Symmetries and Invariance Principles*, Springer. Chapter 7, "Symmetric Arrays", pp. 300–349 (Crossref chapter record `…_8`, because the Introduction takes `…_1`). | `10.1007/0-387-28861-9` |
  | Austin 2008 | "On exchangeable random variables and the statistics of large graphs and hypergraphs", *Probab. Surveys* 5 (2008), 80–145 = arXiv:0801.1698v3 (the published version) | `10.1214/08-PS124` |
  | Aldous 1985 (already listed) | Saint-Flour XIII — 1983, Lecture Notes in Math. 1117 (1985), 1–198 | `10.1007/BFb0099421` |
  | Kallenberg 2002 | *Foundations of Modern Probability*, 2nd ed., Springer, 2002. Chapter 6, "Conditioning and Disintegration", pp. 103–118 (Crossref chapter record `…_6`). Bloem-Reddy and Teh (arXiv:1901.06082, Appendix A) place the randomization of conditional independence at Proposition 6.13; the book is not public, so that number was not checked, and the note cites the chapter only. | `10.1007/978-1-4757-4015-8` |
  | Diaconis–Janson 2008 | "Graph limits and exchangeable random graphs", *Rend. Mat. Appl.* (7) 28 (2008), 33–61 (zbMATH 1162.60009; arXiv:0712.2749) | none found |

- Austin's Theorem 3.6 was read in the published PDF, p. 104: "For any exchangeable random K-coloured graph µ there is some measurable function f : [0, 1]^4 → K such that given any uniform [0, 1]-valued random variable ξ∅ and uniform [0, 1]-valued processes (ξs)s∈S and (ξe)e∈(S 2), all independent, then the stochastic process (f(ξ∅, ξs, ξt, ξ{s,t})){s,t}∈(S 2) has joint law µ."
  - Palettes are finite (Definition 2.1).
  - Edges are unordered and off-diagonal.
  - Austin presents the theorem as following from "a suitable specialization of Theorem 14.11 in Aldous [3]" (the Saint-Flour notes).

  So it sources the off-diagonal symmetric case, as the finding says.
- Aside, outside this finding: `TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Basic.lean:62–63` links Kallenberg 2005 as `https://doi.org/10.1007/0-387-28836-4`, which returns 404 at doi.org. The book's DOI is `10.1007/0-387-28861-9`.

**What the fix is.** The roadmap is upstream, so the fix is the maintainer note below; no atlas file needs an edit for /10. The /11 link edit refers to target AH4 as defined here.

**Note for the Tau Ceti maintainer.**

*(a) Exchangeability README, lines 888–889.* Replace

```text
* exchangeable arrays and the Aldous–Hoover representation (a substantially larger tower than
  the sequence theorem, with its own prerequisites).
```

with

````markdown
* **exchangeable arrays and the Aldous–Hoover representation.** The array API is in place:
  `SeparatelyExchangeable μ X` and `JointlyExchangeable μ X` for `X : ℕ × ℕ → Ω → α` (diagonal
  included), `SeparatelyDissociated` and `JointlyDissociated`, the ergodicity characterization
  `jointlyDissociated_iff_ergodicSMul`, the canonical noise `AldousHoover.noiseMeasure κ ι`
  (i.i.d. uniform on `AldousHoover.NoiseIndex κ ι → I`), and the easy direction
  (`AldousHoover.separatelyExchangeable_separateArray`,
  `AldousHoover.jointlyExchangeable_jointArray`, `AldousHoover.jointlyDissociated_jointArray_of_snd`).
  Build the converse. For `{α : Type*} [MeasurableSpace α] [StandardBorelSpace α] [Nonempty α]`,
  `{μ : Measure Ω} [IsProbabilityMeasure μ]` and `hX : ∀ p, AEMeasurable (X p) μ`, with array law
  `μ.map fun ω p => X p ω`:

  - **AH1 (separate).** `h : SeparatelyExchangeable μ X` gives a measurable
    `f : I × I × I × I → α` with
    `μ.map (fun ω p => X p ω) = (AldousHoover.noiseMeasure AldousHoover.Axis (ℕ × ℕ)).map
    fun u p => AldousHoover.separateArray f p u`, that is,
    `X (i, j) = f (U, U_row i, U_col j, U_cell (i, j))` in law;
  - **AH2 (joint).** `h : JointlyExchangeable μ X` gives a measurable `f : I × I × I × I → α`
    whose coding `(AldousHoover.noiseMeasure Unit (Sym2 ℕ)).map fun u p =>
    AldousHoover.jointArray f p u` has the array law, that is,
    `X (i, j) = f (U, U_i, U_j, U_cell s(i, j))` in law, with one cell variable per unordered pair,
    diagonal pairs included;
  - **AH3 (ergodic form).** For `h : JointlyExchangeable μ X`, `JointlyDissociated μ X` holds iff
    the `f` of AH2 can be taken to be `fun q => g q.2` for a measurable `g : I × I × I → α`. The
    "if" direction is `AldousHoover.jointlyDissociated_jointArray_of_snd` together with
    `JointlyDissociated μ X ↔ JointlyDissociated (μ.map fun ω p => X p ω) fun p x => x p`, which is
    still to be stated. State the separate analogue with `SeparatelyDissociated` and
    `AldousHoover.separatelyDissociated_separateArray_of_snd`;
  - **AH4 (graph compatibility)**, the specialization/compatibility result that DenseGraphLimits
    Layer 9b asks of this layer. For a measurable `g : I × I × I → Bool` with
    `∀ a b c, g (a, b, c) = g (b, a, c)`, let `W : Graphon I volume` be the graphon with
    `W x y = (volume {c | g (x, y, c) = true}).toReal`. The graph read off the off-diagonal entries
    of `AldousHoover.jointArray fun q => g q.2`, through DenseGraphLimits' adapter between
    symmetric irreflexive `Bool` arrays and `EdgeIndex → Bool`, has law `infiniteSampleLaw W`.
    Hence its level-`k` windows have law `(sampleExchangeableLaw W).law k`. For a measurable
    `f : I × I × I × I → Bool` symmetric in its second and third arguments, the induced graph law
    has the finite marginals of `mixtureExchangeableLaw π`. Here `π` is the law on
    `GraphonSpaceI` of the class of the graphon built from `fun q => f (a, q)`, for `a` uniform.
    Equality is of graph laws and of mixing measures on `GraphonSpaceI`, never of graphon
    representatives.

  The generic array notions (`JointlyExchangeable`, `JointlyDissociated`,
  `jointlyDissociated_iff_ergodicSMul`) belong to this layer, and DenseGraphLimits Layer 9b
  specializes them. That layer owns its adapter between symmetric irreflexive `Bool` arrays and
  `EdgeIndex → Bool`, and the transfer between its `IsDissociated` and `JointlyDissociated`. Build
  no second dissociation predicate for graphs here.

  Plan the inputs here as well; neither Mathlib nor Tau Ceti has them:

  - **almost-sure coding of conditional independence**: for `Y` in a standard Borel space, `Y` is
    conditionally independent of `X` given `Z` (`ProbabilityTheory.CondIndepFun`) iff
    `Y = f (Z, U)` almost surely. Here `f` is measurable, and `U` is uniform on `I` and independent
    of `(X, Z)`, on the extension `μ.prod volume`. This strengthens `Kernel/Randomization.lean`,
    whose `exists_measurable_map_prod_volume_eq` and `exists_measurable_map_prod_volume_eq_map_prodMk`
    are equalities of laws only;
  - **transfer**: with `f` from `exists_measurable_map_map_prod_volume_eq_map_prodMk`, for every
    `ξ'` with the law of `ξ` and every uniform `ϑ` independent of `ξ'`, `(ξ', f ξ' ϑ)` has the law
    of `(ξ, η)`. This is a short corollary of that lemma, but it is the form the representation
    proofs use;
  - **the `Arrays/Block.lean` device, extended to the full array**:
    `JointlyExchangeable.separatelyExchangeable_arrayBlockPair` makes the cross block between two
    disjoint index sets separately exchangeable, so AH1 codes it. But it reads neither the diagonal
    `X (i, i)` nor the pairs inside one index set. The passage from a coding of the even–odd cross
    block to a coding of every entry is a target of its own.

  Sources: Aldous (1981), Hoover (1979) and Kallenberg (2005), Chapter 7, for AH1–AH3. For the
  off-diagonal graph case of AH2, used by AH4: Austin (2008), Theorem 3.6, which Austin derives from
  Theorem 14.11 of Aldous's Saint-Flour notes. For AH4: Diaconis–Janson (2008), Section 5. For the
  coding of conditional independence and transfer: Kallenberg (2002), Chapter 6.
````

*(b) Markov exchangeability, line 887.* Change `* Markov exchangeability;` to `* Markov exchangeability (Diaconis–Freedman 1980, "de Finetti's theorem for Markov chains");`.

*(c) References.* Replace lines 935–936 with

```markdown
* Olav Kallenberg, *Probabilistic Symmetries and Invariance Principles*, Springer, 2005,
  Chapter 1, Theorem 1.1, and Chapter 7 (symmetric arrays).
```

and insert after line 944:

```markdown
* Persi Diaconis and David Freedman, "de Finetti's theorem for Markov chains", *Annals of
  Probability* 8 (1980), 115–130.
* David J. Aldous, "Representations for partially exchangeable arrays of random variables",
  *Journal of Multivariate Analysis* 11 (1981), 581–598.
* Douglas N. Hoover, "Relations on probability spaces and arrays of random variables", preprint,
  Institute for Advanced Study, Princeton, 1979 (unpublished).
* Tim Austin, "On exchangeable random variables and the statistics of large graphs and
  hypergraphs", *Probability Surveys* 5 (2008), 80–145, Theorem 3.6.
* Persi Diaconis and Svante Janson, "Graph limits and exchangeable random graphs", *Rendiconti di
  Matematica e delle sue Applicazioni* (7) 28 (2008), 33–61.
* Olav Kallenberg, *Foundations of Modern Probability*, 2nd ed., Springer, 2002, Chapter 6,
  "Conditioning and disintegration" (pp. 103–118).
```

The DOIs are in the table above. The README's entries carry none.

*(d) Alternative.* If the tower should not grow inside Layer 8, open the roadmap "Exchangeability and de Finetti, Part II: exchangeable arrays and the Aldous–Hoover theorem":

- Its first prerequisite is this roadmap.
- It starts from the existing `TauCeti/Probability/Exchangeability/Arrays/` subtree, as its introduction says.
- It carries AH1–AH4, the three inputs and the sources above, verbatim.
- Lines 888–889 then become:

  ```markdown
  * exchangeable arrays and the Aldous–Hoover representation: planned in *Exchangeability and de
    Finetti, Part II: exchangeable arrays and the Aldous–Hoover theorem*, which starts from the
    `Arrays/` subtree.
  ```

(c) applies either way.

**Kept.**

- The review's correction: the References already list array sources (the Saint-Flour notes and Kallenberg). The note attaches sources to the target and adds the specific papers; it does not claim that no array source is listed. The Markov-exchangeability half of the clause stands.
- The finding's claim that only the converse direction is missing.

## /11 (medium, duplicate): no owner for the compatibility of Exchangeability Layer 8 and DenseGraphLimits Layer 9b

**What was checked.**

- DenseGraphLimits README (unchanged since the link packet: blob `f0ba56d`):
  - lines 494–503 (API ownership: "The natural owner is the **Exchangeability roadmap**, whose Layer 8 names exchangeable arrays and Aldous–Hoover");
  - lines 504–509 ("The generic representation theorem owes a **specialization/compatibility result**");
  - lines 511–523 (the law-level interface `graphLawArrayLawEquiv`, described, not pinned).

  Exchangeability lines 888–889 are quoted under /10.
- DenseGraphLimits at Tau Ceti f790474. All declarations below are public:

  | Declaration | File:line | Note |
  |---|---|---|
  | `TauCeti.DenseGraphLimits.ExchangeableGraphLaw` | `TauCeti/Combinatorics/DenseGraphLimits/ExchangeableGraphLaw/Defs.lean:79` | structure: `law : (k : ℕ) → Measure (SimpleGraph (Fin k))`, probability, consistency along every `Fin k ↪ Fin l` |
  | `TauCeti.DenseGraphLimits.ExchangeableGraphLaw.IsDissociated` | `…/ExchangeableGraphLaw/Dissociated.lean:72` | the level-`(k + l)` law pushed to the windows `Fin.castAdd l` / `Fin.natAdd k` is `(L.law k).prod (L.law l)` |
  | `TauCeti.DenseGraphLimits.isDissociated_iff_upperMass_mul` | `…/ExchangeableGraphLaw/Dissociated.lean:115` | |
  | `TauCeti.DenseGraphLimits.sampleExchangeableLaw` | `…/ExchangeableGraphLaw/Sampling.lean:63` | `(W : Graphon Ω μ) : ExchangeableGraphLaw` (finite marginals) |
  | `TauCeti.DenseGraphLimits.isDissociated_sampleExchangeableLaw` | `…/ExchangeableGraphLaw/Sampling.lean:93` | |
  | `TauCeti.DenseGraphLimits.EdgeIndex` | `…/ExchangeableGraphLaw/Coordinates.lean:56` | `abbrev EdgeIndex : Type := {e : Sym2 ℕ // ¬ e.IsDiag}` |
  | `TauCeti.DenseGraphLimits.graphCoordEquiv` | `…/Coordinates.lean:59` | a plain `Equiv`; measurable both ways by `measurable_graphCoordEquiv` (:107) and `measurable_graphCoordEquiv_symm` (:120) |
  | `Equiv.Perm.edgeIndexMap`, `Equiv.Perm.graphCoordEquiv_comap` | `…/Coordinates.lean:152`, `:202` | the relabeling square |
  | `TauCeti.DenseGraphLimits.infiniteSampleLaw` | `…/Sampling/Infinite.lean:126` | `(W : Graphon Ω μ) : Measure (SimpleGraph ℕ)`; windows equal `sampleGraph W n` by `infiniteSampleLaw_map_restrictFin` (:287) |
  | `TauCeti.DenseGraphLimits.GraphonSpaceI` | `…/GraphonSpace/Basic.lean:82` | `SeparationQuotient` of `Graphon I volume`; no `MeasurableSpace` or Borel instance at the pin |

  Absent from Tau Ceti: `exists_graphon_of_isDissociated`, `mixtureExchangeableLaw`, `graphLawArrayLawEquiv`, `InfiniteExchangeableGraphLaw` (and `exchangeableGraphLawEquivInfinite`, `mixtureExchangeableLawEquiv`, `graphonMixtureLawEquiv`). A text search over `TauCeti/` finds none of these names. No DenseGraphLimits file mentions `Exchangeability`, and no `Probability/Exchangeability` file mentions `EdgeIndex`, `ExchangeableGraphLaw` or `DenseGraphLimits`.
- Typing of the finding's pieces against these signatures, corrected in the edit and the notes:
  - `W` must be a `Graphon I volume`. `SymmKernel` (`…/Kernel/Basic.lean:91`) needs pointwise symmetry and joint measurability, hence the hypotheses `Measurable g` and `∀ a b c, g (a, b, c) = g (b, a, c)`.
  - "the associated graph law is `sampleExchangeableLaw W`" becomes an equality with `infiniteSampleLaw W`, plus its windows.
  - The general case compares finite marginals with the planned `mixtureExchangeableLaw` and needs 9b's planned Borel structure on `GraphonSpaceI`.
  - In (ii), `L : ExchangeableGraphLaw` is a family of finite marginals, so "the corresponding array law" is that of its infinite extension, which is also a 9b target.
- Link packet: EXCH-DGL-01 records the overlap with `keep`. Its proposal gave the symmetric-irreflexive law API to Exchangeability and the adapters to DenseGraphLimits, and it named no owner for the compatibility theorem.
- `scripts/check_links.py` takes packet paths as arguments.
  - For every packet it rejects private filesystem paths and a wrong `protocol`, and it requires a known `roadmapId` and a non-empty `examined`.
  - For every overlap it requires at least two known stages, `recommendation` in `merge | rescope | keep`, and a non-empty `detail`.
  - It checks verbatim quotes and cycles only for `links` (this packet has none). The overlap evidence is unchanged and verbatim anyway.

**What the edit does.**

- EXCH-DGL-01 in `research/blueprint/links/tauceti_TauCetiRoadmap_Exchangeability.json`: `detail` and `proposal` are rewritten. `id`, `stages`, `evidence` and `recommendation: keep` are kept.
  - The `detail` adds the library state: two unbridged dissociation predicates, and no owner for the compatibility theorem or the array law type.
  - The `proposal` gives one owner per piece. Exchangeability Layer 8 owns the built array notions and AH4. DenseGraphLimits Layer 9b owns the adapter and the dissociation transfer.
  - It records why no stage link is added: the declaration order is acyclic, but a link in each direction would form a cycle.
- The edit was applied by an anchored script to a copy of the packet:
  - the only JSON paths that differ are `/overlaps[0]/detail` and `/overlaps[0]/proposal` (two lines in the file);
  - the checker reports 0 errors and 0 warnings;
  - a rerun is a no-op;
  - it refuses to run if EXCH-DGL-01 has drifted from the original.
- The packet is formatted with indent 2 (not 1). The script detects and keeps the indent, and asserts that the file round-trips byte for byte.

**Edit for the link workflow (links/tauceti_TauCetiRoadmap_Exchangeability.json, overlap EXCH-DGL-01).** Replace the two fields of the overlap whose `id` is `EXCH-DGL-01` with:

```json
{
 "detail": "Exchangeability Layer 8 owns the general exchangeable-array representation programme. DenseGraphLimits Layer 9b explicitly assigns generic consistent relational laws, relabeling invariance, dissociation and extremality outside its graph-specialized development, naming Exchangeability as the natural owner, and says that the generic representation theorem owes a specialization/compatibility result. The overlap is in this law-level interface, not in the proofs of the two representation theorems. DenseGraphLimits expressly makes its graphLawArrayLawEquiv an interface obligation rather than a build dependency, and proves graphon-mixture existence by empirical mixing, collisions and graphon compactness. Tau Ceti f790474 already builds both sides with no bridge between them: TauCeti.Probability.JointlyExchangeable and JointlyDissociated on arrays ℕ × ℕ → α, diagonal included (Arrays/Basic.lean:203, Arrays/Dissociated.lean:127), and TauCeti.DenseGraphLimits.ExchangeableGraphLaw.IsDissociated on finite label windows (ExchangeableGraphLaw/Dissociated.lean:72). Neither subtree imports or names the other, and neither roadmap text assigns an owner to the compatibility theorem or to the symmetric-array law type.",
 "proposal": "Keep both roadmaps and their two independent representation proofs (Diaconis-Janson in DenseGraphLimits Layer 9b, Aldous-Hoover in Exchangeability Layer 8), with one owner for each piece. (i) Exchangeability Layer 8 owns the generic array notions already built at Tau Ceti f790474, JointlyExchangeable, JointlyDissociated and jointlyDissociated_iff_ergodicSMul (Arrays/Ergodic.lean:298), with the codings AldousHoover.jointArray and AldousHoover.noiseMeasure, and it owns the compatibility theorem AH4. Ergodic case: for a measurable g : I × I × I → Bool with g (a, b, c) = g (b, a, c), let W : Graphon I volume be W x y = (volume {c | g (x, y, c) = true}).toReal; the graph read off the off-diagonal entries of AldousHoover.jointArray (fun q => g q.2) under AldousHoover.noiseMeasure Unit (Sym2 ℕ) has law infiniteSampleLaw W, so its level-k windows have law (sampleExchangeableLaw W).law k. General case: for a measurable f : I × I × I × I → Bool symmetric in its second and third arguments, the induced graph law has the finite marginals of mixtureExchangeableLaw π, where π is the law on GraphonSpaceI of the class of the graphon built as above from g = fun q => f (a, q), with a uniform on I. (ii) DenseGraphLimits Layer 9b owns the symmetric-irreflexive specialization it names as its interface obligation: a measurable equivalence between the symmetric arrays ℕ × ℕ → Bool whose diagonal is false and EdgeIndex → Bool, with the induced bijection of probability laws, commuting with relabeling (pairReindex σ σ on arrays, Equiv.Perm.edgeIndexMap σ on coordinates; it extends graphCoordEquiv and graphCoordEquiv_comap); and the transfer: an exchangeable graph law L satisfies IsDissociated exactly when the array law ρ of its infinite extension satisfies JointlyDissociated ρ (fun p x => x p). AH4 is stated through this adapter. Add no second dissociation theory: IsDissociated stays the graph specialization, related to JointlyDissociated only by this transfer. Equality in AH4 is of infinite graph laws and of mixing measures on GraphonSpaceI, never of raw graphon representatives. Record no stage link: the adapter consumes Layer 8's array predicates and AH4 consumes Layer 9b's graph laws and adapter, so the declaration order (array API, then adapter and transfer, then AH4) is acyclic but a pair of stage links would form a cycle. Do not add an Aldous-Hoover-to-graphon-mixture prerequisite edge, and do not substitute the sequence iid/extreme-point theorem for the array theorem. Not built at f790474: AH4, the adapter and transfer (graphLawArrayLawEquiv), the infinite extension (InfiniteExchangeableGraphLaw), exists_graphon_of_isDissociated, mixtureExchangeableLaw and a measurable structure on GraphonSpaceI."
}
```

**Note for the Tau Ceti maintainer.**

*(a) Exchangeability README, Layer 8 (lines 888–889).* The replacement under /10 (a) already carries AH4 and the generic API. The two passages that do this for /11 are the **AH4 (graph compatibility)** sub-bullet and the paragraph that begins "The generic array notions (`JointlyExchangeable`, `JointlyDissociated`, `jointlyDissociated_iff_ergodicSMul`) belong to this layer". Apply them as part of that single replacement, so the two notes do not edit the same lines twice.

*(b) DenseGraphLimits README, Layer 9b.* Replace lines 511–515 up to and including "(per the roadmap guide).":

```text
The two developments meet at one **law-level interface**,
`graphLawArrayLawEquiv`, equating exchangeable graph laws with the laws of symmetric, irreflexive,
jointly exchangeable Boolean arrays. Its target type belongs to the array API outside this
roadmap, and an identifier whose target type is elsewhere is described rather than
`sorry`-pinned (per the roadmap guide).
```

with

```markdown
The two developments meet at one **law-level interface**, owned by this layer:
`graphLawArrayLawEquiv`, equating exchangeable graph laws with the laws of symmetric, irreflexive,
jointly exchangeable Boolean arrays. Its array side is the Exchangeability roadmap's array API
(`JointlyExchangeable` and `JointlyDissociated` on `X : ℕ × ℕ → Ω → α`, diagonal included): the
laws `ρ` on `ℕ × ℕ → Bool` concentrated on the symmetric arrays whose diagonal is `false`, with
`JointlyExchangeable ρ fun p x => x p`, where relabeling the coordinates along `edgeIndexMap σ`
corresponds to the joint reindexing `pairReindex σ σ`. That target type belongs to the array API
outside this roadmap, and an identifier whose target type is elsewhere is described rather than
`sorry`-pinned (per the roadmap guide).
```

The rest of line 515 onward ("The carrier-level contract consists of `EdgeIndex` …") is unchanged. Then insert after line 523:

```markdown

**Dissociation transfer.** Alongside the adapter, prove that the two dissociation predicates
agree. An exchangeable graph law `L` is `IsDissociated` iff the array law `ρ` of its infinite
extension (`exchangeableGraphLawEquivInfinite`, then the adapter) satisfies
`JointlyDissociated ρ fun p x => x p`. This theorem is the only link between `IsDissociated` and
the array-level `JointlyDissociated` (whose ergodic characterization is
`jointlyDissociated_iff_ergodicSMul`); no second dissociation theory is built on either side. The
specialization/compatibility result owed by the generic representation theorem is target AH4 of
Exchangeability Layer 8, stated through this adapter. For a coding `g : I × I × I → Bool` without a
global variable, its graph law is `infiniteSampleLaw W` with
`W x y = (volume {c | g (x, y, c) = true}).toReal`. In general its finite marginals are
`mixtureExchangeableLaw` of the pushed-forward mixing measure on `GraphonSpaceI`.
```

**Kept.**

- Recommendation `keep`, and both independent proofs: Diaconis–Janson in 9b, Aldous–Hoover in Layer 8.
- Equality is of infinite graph laws and of mixing measures on `GraphonSpaceI`, never of raw graphon representatives.
- No Aldous–Hoover-to-graphon-mixture prerequisite edge, and no substitution of the sequence extreme-point theorem for the array theorem.
- DenseGraphLimits keeps its graph-specialized structures and the unordered non-diagonal edge coordinates.
- The review's shared checks: the overlap is already recorded, and the narrower claim is that no owner is assigned. EXCH-DGL-01 is therefore edited, not duplicated.

## /15 (medium, library-claim): AUDIT-40 calls the Gaussian-Gram half of Layer 6 complete, but `charFun_wishartGramMeasure` is absent

**What was checked.**
- Absence at the pin (Tau Ceti f790474), searched under every name:
  - `charFun`, case-insensitive, under `TauCeti/Probability/Distributions/Wishart/` matches only the module docstring at `Wishart/Transforms.lean:18`. That hit is the positive control for the search.
  - `wishartGram` appears in no Tau Ceti file outside `Wishart/` (4 files).
  - The only file other than `Transforms.lean` that mentions both `charFun` and the symmetric-matrix pairing is `TauCeti/MeasureTheory/Measure/SymmetricMatrix/Basic.lean:404`, the docstring of `selfAdjoint.inner_eq_trace_mul`.
  - No declaration whose name contains `charFun` concerns Wishart or symmetric matrices.
  - `complexMGF_eq_exp_of_mgf_eq_prod_rpow` and `complexMGF_I_eq_exp_of_mgf_eq_prod_rpow` have no caller anywhere in Tau Ceti.
  - Mathlib 082e2d3 has no `Wishart` anywhere.
- Ingredients. All are public and inside `public section`:
  - `TauCeti.complexMGF_I_eq_exp_of_mgf_eq_prod_rpow` (`TauCeti/Probability/Moments/ComplexMGF.lean:173`). Its hypothesis is `mgf X μ t = ∏ j, (1 - 2 * t * lam j) ^ (-a j)` whenever `∀ j, 0 < 1 - 2 * t * lam j`.
  - `Matrix.isHermitian_sqrt_mul_mul_sqrt` (`TauCeti/Analysis/Matrix/Sqrt.lean:67`). It needs no hypothesis on `S`.
  - `TauCeti.mgf_trace_mul_wishartGramMeasure` (`Wishart/Transforms.lean:177`). It takes `hS : S.PosSemidef` on the domain `(1 - (2 * t) • (CFC.sqrt S * Θ * CFC.sqrt S)).PosDef`.
  - The glue that is still missing would use `Matrix.IsHermitian.posDef_one_sub_smul_iff` (`TauCeti/Analysis/Matrix/Spectrum.lean:84`) and `selfAdjoint.inner_eq_trace_mul` (`SymmetricMatrix/Basic.lean:405`).
- Built Gram parts. Each was opened at the pin and is public; paths are under `TauCeti/Probability/Distributions/Wishart/`:
  - `wishartGramMeasure` `Basic.lean:160`
  - `hasLaw_wishartGram_gaussian` `:199`
  - `map_symmetricCongruenceLinearMap_wishartGramMeasure` `:209`
  - `ae_rank_le_wishartGramMeasure` `:311`
  - `mutuallySingular_wishartGramMeasure_symmetricLebesgue` `:319`
  - `wishartGramMeasure_conv_wishartGramMeasure` `:351`
  - `mem_integrableExpSet_trace_mul_wishartGramMeasure_iff` `Transforms.lean:111`
  - `mgf_trace_mul_wishartGramMeasure` `:177`
  - `cgf_trace_mul_wishartGramMeasure` `:188`
  - `integral_exp_neg_trace_mul_wishartGramMeasure` `:203`
  - `integral_id_wishartGramMeasure` `Moments.lean:248`
  - `covariance_coe_apply_wishartGramMeasure` `:268`
  - `measurable_wishartGramMeasure` `Measurability.lean:76`
- README Layer 6 (`StandardDistributions/README.md`, origin/main). Each item on the finding's open list was checked against the README:
  - `charFun_wishartGramMeasure`: line 813. Confirmed.
  - `nonsingularWishartMeasure`: the definition (758–762), probability, mean and covariance (769–770), convolution (774), full-row-rank congruence (777), domain, mgf and cgf (784–787), `charFun` (793–796), the `Fin 1` chi-squared identity (798) and measurability (840). Confirmed.
  - The finding's list leaves out three README items. They are now in the note:
    - the invertible-congruence and principal-submatrix cases (780);
    - the density family's cone-Laplace specialization (790);
    - the `p = 0` inverse-Wishart case (839).
  - `wishartGramMeasure_eq_nonsingularWishartMeasure` and its `HasLaw` corollary (816), Bartlett (818–828), the inversion change of variables (833), and `inverseWishartMeasure` with its density, mean and non-integrability (829–838): confirmed.
- "Complete" wording in AUDIT-40:
  - The Gram target's note, "This half of item 4 is complete, …". It is replaced.
  - The roadmap-level summary: "… and the whole Gaussian-Gram Wishart family with its transforms and moments; …". It is replaced too (section "AUDIT-40 StandardDistributions summary" below).
- Private citations: in the patched layer, every cited declaration was checked for `private` at its file and line. Two pre-existing ones were found (below).
- After the pin, for information only; the audit stays at f790474. Tau Ceti main at aedef0c (2026-09-29) now has:
  - `TauCeti.Probability.charFun_wishartGramMeasure` (`Wishart/CharFun.lean:126`);
  - `nonsingularWishartMeasure` (`Wishart/Nonsingular.lean:306`);
  - `wishartGramMeasure_eq_nonsingularWishartMeasure` (`Wishart/Agreement.lean:63`).

  A re-audit at a later pin will find these as built.

**What the edit does.**
- In AUDIT-40, StandardDistributions Layer 6 only, the Gaussian-Gram target becomes two targets:
  - **The built part (`tauceti`).** Its title names definition, probability measure, law, congruence, convolution, rank bound, singularity, trace domain/mgf/cgf, cone-Laplace specialization, mean, covariance and measurability. It keeps the five original declarations unchanged and adds eight more (all `exact`): congruence, rank bound, mgf, cgf, cone-Laplace, mean, covariance and measurability. The new note no longer says "complete".
  - **A new `absent` target, `charFun_wishartGramMeasure (spectral sum-of-principal-logarithms formula)`.** It cites `complexMGF_I_eq_exp_of_mgf_eq_prod_rpow`, `isHermitian_sqrt_mul_mul_sqrt` and `mgf_trace_mul_wishartGramMeasure` as `related`. Its note:
    - records the search;
    - names the glue that is still missing;
    - says that item 4's family agreement and the completion check depend on it;
    - lists the open Layer 6 items.
- Two private declarations cited as fits in this layer are removed (same correction, not named by the finding). Each target keeps a public `exact` fit, so no fit changes:
  - `Matrix.det_symmetricCongruenceLinearMap_mul` (`SymmetricMatrix/Congruence.lean:243`, `related`) is removed from the congruence target. The public `Matrix.det_symmetricCongruenceLinearMap` (`:283`) and `Matrix.GeneralLinearGroup.det_symmetricCongruence` (`:347`) exist but are not added.
  - `TauCeti.measurable_wishartGramMeasure_fixedDegree` (`Wishart/Measurability.lean:51`, `exact`) is removed from the parameter-measurability target. The public `measurable_wishartGramMeasure` (`:76`) and `measurable_wishartGramMeasure_selfAdjoint` (`:85`) remain.
- The roadmap summary's Gram clause is replaced; see the section "AUDIT-40 StandardDistributions summary" below.
- The verdict stays `partly built`. The other six targets and `duplicates` are unchanged.
- Applied by an anchored script to a copy of AUDIT-40, the edit changes only the StandardDistributions summary and Layer 6.

**Edit for the orchestrator (AUDIT-40.result.json, before merge).**
In `roadmaps["tauceti:TauCetiRoadmap/StandardDistributions"].layers["tauceti:TauCetiRoadmap/StandardDistributions#layer-6-symmetric-matrices-and-wishart-distributions"].targets`, find the one object whose `target` is exactly:

`The natural-degree Gaussian-Gram Wishart family: definition, probability measure, congruence, convolution, rank bound, singularity, transforms and moments`

Replace it, in the same position, with the two objects below, in this order. Leave `verdict` (`partly built`) and `duplicates` unchanged. Write the file back with `json.dump(d, f, indent=1, ensure_ascii=False)` and a trailing newline.

```json
{
 "target": "The natural-degree Gaussian-Gram Wishart family: definition, probability measure, law of the Gram sum, congruence, convolution, rank bound, singularity, trace-statistic domain, mgf and cgf, cone-Laplace specialization, mean, covariance and measurability",
 "library": "tauceti",
 "declarations": [
  {
   "name": "TauCeti.wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Basic.lean",
   "line": 160,
   "fit": "exact"
  },
  {
   "name": "TauCeti.hasLaw_wishartGram_gaussian",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Basic.lean",
   "line": 199,
   "fit": "exact"
  },
  {
   "name": "TauCeti.map_symmetricCongruenceLinearMap_wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Basic.lean",
   "line": 209,
   "fit": "exact"
  },
  {
   "name": "TauCeti.wishartGramMeasure_conv_wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Basic.lean",
   "line": 351,
   "fit": "exact"
  },
  {
   "name": "TauCeti.ae_rank_le_wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Basic.lean",
   "line": 311,
   "fit": "exact"
  },
  {
   "name": "TauCeti.mutuallySingular_wishartGramMeasure_symmetricLebesgue",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Basic.lean",
   "line": 319,
   "fit": "exact"
  },
  {
   "name": "TauCeti.mem_integrableExpSet_trace_mul_wishartGramMeasure_iff",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Transforms.lean",
   "line": 111,
   "fit": "exact"
  },
  {
   "name": "TauCeti.mgf_trace_mul_wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Transforms.lean",
   "line": 177,
   "fit": "exact"
  },
  {
   "name": "TauCeti.cgf_trace_mul_wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Transforms.lean",
   "line": 188,
   "fit": "exact"
  },
  {
   "name": "TauCeti.integral_exp_neg_trace_mul_wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Transforms.lean",
   "line": 203,
   "fit": "exact"
  },
  {
   "name": "TauCeti.integral_id_wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Moments.lean",
   "line": 248,
   "fit": "exact"
  },
  {
   "name": "TauCeti.covariance_coe_apply_wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Moments.lean",
   "line": 268,
   "fit": "exact"
  },
  {
   "name": "TauCeti.measurable_wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Measurability.lean",
   "line": 76,
   "fit": "exact"
  }
 ],
 "note": "Built at the baseline, apart from the characteristic function, which is the separate absent target `charFun_wishartGramMeasure` below. Tau Ceti also has `isProbabilityMeasure_wishartGramMeasure`, `wishartGramMeasure_zero`, support in the positive-semidefinite cone (`ae_posSemidef_wishartGramMeasure`), the degree-zero domain, mgf and cgf (`integrableExpSet_trace_mul_wishartGramMeasure_zero` and its `mgf`/`cgf` companions), and the `Fin 1` chi-squared identification `map_symmetricFinOneEquiv_wishartGramMeasure`. `measurable_wishartGramMeasure` is item 7 for this family."
}
```

```json
{
 "target": "charFun_wishartGramMeasure (spectral sum-of-principal-logarithms formula)",
 "library": "absent",
 "declarations": [
  {
   "name": "TauCeti.complexMGF_I_eq_exp_of_mgf_eq_prod_rpow",
   "library": "tauceti",
   "file": "TauCeti/Probability/Moments/ComplexMGF.lean",
   "line": 173,
   "fit": "related"
  },
  {
   "name": "Matrix.isHermitian_sqrt_mul_mul_sqrt",
   "library": "tauceti",
   "file": "TauCeti/Analysis/Matrix/Sqrt.lean",
   "line": 67,
   "fit": "related"
  },
  {
   "name": "TauCeti.mgf_trace_mul_wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Transforms.lean",
   "line": 177,
   "fit": "related"
  }
 ],
 "note": "Absent: no Tau Ceti declaration states `charFun` of `wishartGramMeasure` under any name. `charFun` occurs under `Probability/Distributions/Wishart/` only in the module docstring at `Transforms.lean:18`, no file outside `Wishart/` mentions `wishartGram`, and the continuation lemmas of `Probability/Moments/ComplexMGF.lean` have no caller. The ingredients are in place: the continuation lemma `complexMGF_I_eq_exp_of_mgf_eq_prod_rpow`, the Hermitian-sandwich lemma `Matrix.isHermitian_sqrt_mul_mul_sqrt`, and the trace mgf `mgf_trace_mul_wishartGramMeasure` (with its `_sqrt` form on the sandwich pencil). The remaining glue is to write the pencil determinant as a product over the sandwich's eigenvalues, with the domain identified by `Matrix.IsHermitian.posDef_one_sub_smul_iff`, and to pass from `complexMGF` at `Complex.I` to `charFun` through `selfAdjoint.inner_eq_trace_mul`. Item 4 proves `wishartGramMeasure_eq_nonsingularWishartMeasure` from this formula, and the completion check that the two families' characteristic functions agree needs it. With this target, the open Layer 6 items at the baseline are: `charFun_wishartGramMeasure`; `nonsingularWishartMeasure` with its probability, mean, covariance, convolution, full-row-rank congruence (with the invertible and principal-submatrix cases), trace domain, mgf and cgf, cone-Laplace specialization, `charFun`, `Fin 1` chi-squared identity and measurability; `wishartGramMeasure_eq_nonsingularWishartMeasure` and its `HasLaw` corollary; the Bartlett decomposition; the inversion change of variables; and `inverseWishartMeasure` with its density, mean, non-integrability, `p = 0` case and measurability."
}
```

In the same `targets` list, replace the object whose `target` is exactly `` `symmetricLebesgue_setOf_det_eq_zero` and the congruence change of variables `` with the following. It is the old object with `Matrix.det_symmetricCongruenceLinearMap_mul` removed.

```json
{
 "target": "`symmetricLebesgue_setOf_det_eq_zero` and the congruence change of variables",
 "library": "tauceti",
 "declarations": [
  {
   "name": "TauCeti.symmetricLebesgue_setOf_det_eq_zero",
   "library": "tauceti",
   "file": "TauCeti/MeasureTheory/Measure/SymmetricMatrix/Determinant.lean",
   "line": 85,
   "fit": "exact"
  },
  {
   "name": "Matrix.symmetricCongruenceLinearMap",
   "library": "tauceti",
   "file": "TauCeti/MeasureTheory/Measure/SymmetricMatrix/Congruence.lean",
   "line": 56,
   "fit": "exact"
  },
  {
   "name": "Matrix.GeneralLinearGroup.map_symmetricCongruence_symmetricLebesgue",
   "library": "tauceti",
   "file": "TauCeti/MeasureTheory/Measure/SymmetricMatrix/Congruence.lean",
   "line": 357,
   "fit": "exact"
  }
 ],
 "note": "The singular matrices are null and the congruence pushforward scales `symmetricLebesgue` by `|det C|^{-(p+1)}`, exactly the two statements the later items consume."
}
```

Also replace the object whose `target` is exactly `` Parameter measurability for the three Wishart families `` with the following. It is the old object with `TauCeti.measurable_wishartGramMeasure_fixedDegree` removed.

```json
{
 "target": "Parameter measurability for the three Wishart families",
 "library": "partial",
 "declarations": [
  {
   "name": "TauCeti.measurable_wishartGramMeasure",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Measurability.lean",
   "line": 76,
   "fit": "exact"
  },
  {
   "name": "TauCeti.measurable_wishartGramMeasure_selfAdjoint",
   "library": "tauceti",
   "file": "TauCeti/Probability/Distributions/Wishart/Measurability.lean",
   "line": 85,
   "fit": "exact"
  }
 ],
 "note": "Proved for `wishartGramMeasure`, including the corollary with the scale in the self-adjoint submodule that the layer asks for; the corresponding statements for `nonsingularWishartMeasure` and `inverseWishartMeasure` cannot exist because those families do not."
}
```

The roadmap summary edit is in the section "AUDIT-40 StandardDistributions summary" below. Applying all four edits and that summary edit by hand gives byte-identical output to the script.

**Kept.**
- The review confirms /15 and asks for no change. Its reason text describes a different finding (a built layer recorded as `unknown`), so it adds no constraint for /15.
- Kept: the Layer 6 verdict, items 1–3 as built, and the absent nonsingular, Bartlett and inverse-Wishart targets and their notes.

## /20 (medium, missing): Layer 6 item 6 has no route to the real-degree inverse-Wishart mean and threshold

**What was checked.**
- README, lines 818–828 and 837–838, quoted in the note below. Item 5 is stated only for `ν : ℕ` with `p ≤ ν`. Item 6 asks for the mean and the non-integrability at real `n`. Lines 685–898 contain no orthogonal invariance, no Schur complement and no inverse-gamma input; "real-degree" occurs only in the definition of the density family (758, 763).
- Inputs at the pin. All are public and inside `public section`. Paths are under `TauCeti/Probability/Distributions/` unless given in full:
  - `TauCeti.map_cholesky_symmetricLebesgue` (`TauCeti/MeasureTheory/Measure/SymmetricMatrix/Cholesky.lean:304`). Its weight `choleskyJacobianDensity p` = `ENNReal.ofReal (2 ^ p * ∏ i : Fin p, x ⟨(i, i), le_rfl⟩ ^ (p - i.1))` (`:289`) does not involve the degree.
  - `TauCeti.Probability.chiSquaredMeasure_eq_gammaMeasure (hk : 0 < k) : chiSquaredMeasure k = gammaMeasure (k / 2) (1 / 2)` (`ChiSquared.lean:190`).
  - `TauCeti.Probability.inverseGammaMeasure_of_pos (ha : 0 < a) (hr : 0 < r) : inverseGammaMeasure a r = (gammaMeasure a r).map Inv.inv` (`InverseGamma.lean:75`). This is the bridge the finding leaves implicit.
  - `TauCeti.Probability.integral_id_inverseGammaMeasure (hr : 0 < r) (ha : 1 < a)`, value `r / (a - 1)` (`InverseGamma.lean:357`).
  - `TauCeti.Probability.integrable_id_inverseGammaMeasure_iff (ha : 0 < a) (hr : 0 < r) : Integrable id (inverseGammaMeasure a r) ↔ 1 < a` (`InverseGamma.lean:404`).
  - `Matrix.orthogonalGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:295`).
  - `Matrix.GeneralLinearGroup.map_symmetricCongruence_symmetricLebesgue` (`SymmetricMatrix/Congruence.lean:357`).
- Arithmetic:
  - `(L_{p−1,p−1})²` ~ χ²(n − p + 1) = `gammaMeasure ((n − p + 1)/2) (1/2)`. This needs n > p − 1, which is the valid family.
  - So its inverse has law `inverseGammaMeasure a r` with a = (n − p + 1)/2 and r = 1/2.
  - The mean is r/(a − 1) = (1/2)/((n − p − 1)/2) = 1/(n − p − 1).
  - It is integrable iff 1 < a, iff n > p + 1.
  - In the range p − 1 < n ≤ p + 1 we have 0 < a ≤ 1, so the identity is not integrable. This is exactly item 6's mean and threshold.
- Index convention:
  - The item 4 density (761) times the item 2 Jacobian (744–745) at A = L Lᵀ gives ∏ L_ii^{n−p−1} · L_ii^{p−i} = ∏ L_ii^{n−i−1}, with 0-indexed i.
  - So (L i i)² has density ∝ y^{(n−i)/2−1} e^{−y/2}, which is χ²(n − i).
  - The README is 0-indexed: line 824 reads `chiSquaredMeasure (ν - i.1)`, and line 828 says "The zero-based `Fin p` index fixes the degrees of freedom". Sources that index from 1 write χ²(n − i + 1).
- Numeric check:
  - README density × Jacobian = ∏ (χ²(n − i) density of L_ii²)·2L_ii · ∏ N(0,1) densities, normalizing constants included. Tested at random points for p = 1…4 and n ∈ {0.3, 1.4, 2.7, 3.5, 5.25}; the largest relative error was 2.4e−13.
  - (c) holds at the same points.
  - E[1/χ²_k] = 1/(k − 2) by quadrature for k = 3.2, 3.5, 4.
  - A Monte Carlo estimate of E[A⁻¹] for W₃(7, I) is ≈ I/3.
- Source for the real-degree Bartlett decomposition:
  - J. Wesołowski, *Independence properties of Wishart matrices*, lecture notes, 20 June 2016 (https://www.lebesgue.fr/sites/default/files/attach/Wesolowski.pdf), Theorem 1.1 with its proof in §1.2. The density is ∝ |x|^{p−(n+1)/2} e^{−tr x/2} with real p > (n−1)/2 (his n is the dimension, his p is half the degree). The result is T_ii² ~ χ²(2p − i + 1) for 1-indexed i and T_ij ~ N(0,1) for j < i, all independent.
  - The proof is the density plus the Jacobian 2ⁿ ∏ t_ii^{n−i+1}, which is exactly (a).
  - I could not read Muirhead, Thm 3.2.14 (paywalled), so I cannot confirm its hypotheses.
  - S. Sawyer's public handout *Wishart Distributions and Inverse-Wishart Sampling* (2007) proves only the integer-degree case, by Gram–Schmidt.
- After the pin, for information only. Tau Ceti main at aedef0c proves item 5 at real degree along this route, and item 6 from it:
  - `TauCeti.Probability.bartlett_nonsingularWishartMeasure` (`Wishart/Bartlett.lean:430`), with hypothesis `(p : ℝ) - 1 < n` and law `chiSquaredMeasure (n - i.1)`. It was added in TauCeti PR #7167, merged 2026-09-17.
  - `integral_id_inverseWishartMeasure` (`Wishart/Inverse/Moments.lean:377`) and `not_integrable_id_inverseWishartMeasure` (`:401`). They use the last diagonal entry, swap and sign congruences, and a congruence by `C` with `C * Cᵀ = S`.

**What the fix is.**
- A maintainer note. The finding asks for a maintainer note or nodes in the Layer 6 blueprint packet, and no StandardDistributions blueprint packet exists. AUDIT-40 and the link files need no edit for /20.

**Note for the Tau Ceti maintainer.**
The line numbers are for `StandardDistributions/README.md` at origin/main; the upstream TauCetiRoadmap copy has the same numbering. Tau Ceti main at `aedef0c986ab1cd7b87e3d09a452b3d2efe5b12e` (committed 2026-09-29 18:01:53 UTC; read with `gh api repos/TauCetiProject/TauCeti/commits/main` and the contents API at that sha) already has:
- `TauCeti.Probability.bartlett_nonsingularWishartMeasure` (`TauCeti/Probability/Distributions/Wishart/Bartlett.lean`), at real degree `(p : ℝ) - 1 < n`;
- `TauCeti.Probability.integral_id_inverseWishartMeasure` and `TauCeti.Probability.not_integrable_id_inverseWishartMeasure` (`TauCeti/Probability/Distributions/Wishart/Inverse/Moments.lean`).

This note brings the README text of items 5–6 in line with those declarations and records the route they use.

1. Item 5, lines 818–828. Current text:

```text
5. **Bartlett decomposition.** Let `ν : ℕ` with `p ≤ ν`.
   Lift `nonsingularWishartMeasure (ν : ℝ) 1` to the positive-definite subtype using `(nonsingularWishartMeasure (ν : ℝ) 1).comap Subtype.val`, then apply the Cholesky equivalence.
   Prove that mapping the lift back along `Subtype.val` returns the original Wishart law.
   The proof should use `map_comap_subtype_coe` to obtain the restriction to the measurable cone, then remove that restriction because the cone's complement is null under the valid law.

   For the resulting Cholesky factor `T`, give one joint `iIndepFun` theorem for the diagonal and strict-lower-triangular entries:
   - `(T i i) ^ 2` has law `chiSquaredMeasure (ν - i.1)`;
   - `T i j` has law `gaussianReal 0 1` whenever `j < i`; and
   - all these entries are independent.

   The zero-based `Fin p` index fixes the degrees of freedom in the diagonal laws.
```

Replace with:

```text
5. **Bartlett decomposition.** Let `n : ℝ` with `(p : ℝ) - 1 < n`.
   Lift `nonsingularWishartMeasure n 1` to the positive-definite subtype using `(nonsingularWishartMeasure n 1).comap Subtype.val`, then apply the Cholesky equivalence.
   Prove that mapping the lift back along `Subtype.val` returns the original Wishart law.
   The proof should use `map_comap_subtype_coe` to obtain the restriction to the measurable cone, then remove that restriction because the cone's complement is null under the valid law.

   For the resulting Cholesky factor `T`, give one joint `iIndepFun` theorem for the diagonal and strict-lower-triangular entries:
   - `(T i i) ^ 2` has law `chiSquaredMeasure (n - i.1)`;
   - `T i j` has law `gaussianReal 0 1` whenever `j < i`; and
   - all these entries are independent.

   The zero-based `Fin p` index fixes the degrees of freedom in the diagonal laws, and `(p : ℝ) - 1 < n` makes every `n - i.1` positive.
   Prove it by reading the density of item 4 in the Cholesky coordinates of item 2: the density times the Jacobian `2 ^ p * ∏ i : Fin p, (T i i) ^ (p - i.1)` is the product of the stated coordinate densities, and the computation does not use integrality of `n`.
   For `ν : ℕ` with `p ≤ ν` this is the case `n = ν`, since `p ≤ ν` is equivalent to `(p : ℝ) - 1 < ν`.
```

2. Item 6. Current lines 837–839:

```text
   If `0 < p` and `(p : ℝ) + 1 < n`, prove mean `(n - (p : ℝ) - 1)⁻¹ • Sₛ`.
   Within the valid family, prove non-integrability of the identity at and below that threshold.
   At `p = 0`, every valid inverse-Wishart law is Dirac at the unique zero matrix; prove that the identity is integrable with mean zero for every `-1 < n`.
```

Insert after line 838, before the `p = 0` sentence:

```text
   Obtain both from item 5 at real degree.
   For `O ∈ Matrix.orthogonalGroup (Fin p) ℝ`, record that `A ↦ O * A * Oᵀ` preserves `nonsingularWishartMeasure n 1`; this is the invertible case of the congruence theorem of item 4, since `O * 1 * Oᵀ = 1`.
   For a lower-triangular `L` with positive diagonal and the last index `k : Fin p`, with `k.1 = p - 1`, prove `((L * Lᵀ)⁻¹) k k = ((L k k) ^ 2)⁻¹`.
   Under `nonsingularWishartMeasure n 1`, item 5, `chiSquaredMeasure_eq_gammaMeasure`, and `inverseGammaMeasure_of_pos` then give `(A⁻¹) k k` the law `inverseGammaMeasure ((n - (p : ℝ) + 1) / 2) (1 / 2)`.
   Invariance under permutation matrices gives every diagonal entry of `A⁻¹` this law, and invariance under diagonal sign matrices makes every off-diagonal entry of its mean zero, so that mean is a scalar multiple of `1`; positive definiteness bounds `|(A⁻¹) i j|` by `((A⁻¹) i i + (A⁻¹) j j) / 2`, so integrability reduces to the diagonal.
   Layer 3's `integral_id_inverseGammaMeasure` and `integrable_id_inverseGammaMeasure_iff` then give mean `(n - (p : ℝ) - 1)⁻¹ • 1` when `(p : ℝ) + 1 < n`, and non-integrability when `n ≤ (p : ℝ) + 1`.
   For positive-definite `S`, the congruence of item 4 by `(CFC.sqrt S)⁻¹` carries `nonsingularWishartMeasure n 1` to `nonsingularWishartMeasure n S⁻¹` and acts on inverses as `B ↦ CFC.sqrt S * B * CFC.sqrt S`; this carries the mean to `(n - (p : ℝ) - 1)⁻¹ • Sₛ` and preserves integrability in both directions.
```

The Key declarations list (843–888) needs no change: `bartlett_nonsingularWishartMeasure` (883) and `integral_id_inverseWishartMeasure` (885) are already there.

**Kept.**
- The review confirms the absences at the pin, the four inputs, the route and the arithmetic (a = (n − p + 1)/2, r = 1/2, mean 1/(n − p − 1), integrable iff n > p + 1). It makes no correction, so the red team's (a)–(c) stand as stated.
- (b) is item 4's congruence with q = p. There, finding /19's counterexample cannot arise, because source and target are valid or invalid together.

## AUDIT-40 roadmap summary (consequence of /3, /5, /9)

- Anchor: `roadmaps` → `tauceti:TauCetiRoadmap/Exchangeability` → `summary`. Replace the whole string with the one below.
- Everything up to "Layer 8 is largely done too:" is verbatim. The last two sentences change:
  - "the full Diaconis–Freedman theorem" becomes the qualified representation (/9);
  - "The one genuine gap" becomes three gaps: the Layer 2 a.e. comparison (/3), the Layer 4 Lᵖ form (/5) and the Aldous–Hoover converse (/9).

```json
"This roadmap is essentially finished in Tau Ceti, and the summary at its head — that Mathlib does not carry the exchangeability theory — is now out of date about the library as a whole. `TauCeti/Probability/Exchangeability/` and `TauCeti/Probability/DeFinetti/` contain the symmetry predicates and their implication lattice, the path-law bridges, process tails and the strict chain `invariants (shift α) < pathTail α < exchangeableSigma α`, Hewitt–Savage, the product-kernel adapters and both common endings, the whole L² averaging library, reverse martingales with `tendsto_ae_condExp_iInf`, the Koopman/mean-ergodic lane with the projection identified as conditional expectation, and the directing-measure theory: `deFinetti`, `deFinetti_viaL2`, `deFinetti_viaKoopman`, the Ryll-Nardzewski equivalence, a.e. uniqueness of the directing measure, the full-path joint disintegration, empirical-measure convergence in both the topology-free and Polish forms, and the zero-one / ergodic / extreme-point interfaces — all sorry-free, with the roadmap's own milestone names. Layer 8 is largely done too: the finite de Finetti bound with its sampling API, de Finetti for countable index types, the affine barycenter correspondence, and a Diaconis–Freedman representation for Markov exchangeability under two hypotheses beyond recurrence (the process starts almost surely at a fixed state and almost surely visits every state). Three genuine gaps remain: the comparison of the exchangeable, tail and shift-invariant σ-algebras modulo the null sets of an exchangeable law (Layer 2); the Lᵖ form of Lévy's downward theorem, of which only the a.e. and L¹ forms exist (Layer 4); and the converse direction of Aldous–Hoover (Layer 8): the array subtree proves that codings are exchangeable and dissociated, but not that every exchangeable array admits such a coding."
```

## AUDIT-40 StandardDistributions summary (consequence of /15)

Only the Gram clause changes. Old clause:

> and the whole Gaussian-Gram Wishart family with its transforms and moments; what is genuinely missing there is the nonsingular real-degree density family `nonsingularWishartMeasure`, and with it the Bartlett decomposition and the inverse-Wishart law.

New clause:

> and the Gaussian-Gram Wishart family with its trace mgf, cgf and moments; what is genuinely missing there is the Gaussian-Gram characteristic function `charFun_wishartGramMeasure` and the nonsingular real-degree density family `nonsingularWishartMeasure`, and with it the Bartlett decomposition and the inverse-Wishart law.

Set `roadmaps["tauceti:TauCetiRoadmap/StandardDistributions"].summary` to this complete string:

```json
"Tau Ceti has built almost all of this roadmap. Layers 0 to 4 are complete and sorry-free: the `HasPDF`/`rnDeriv` connections for Mathlib's six continuous families, the uniform law on an interval with its whole transform API, the missing elementary theory of every existing family (means, variances, exact `integrableExpSet` domains, mgf/cgf/characteristic functions, convolutions, memorylessness, Gaussian central and absolute moments) and the probability generating function with coefficient recovery, the incomplete gamma and beta functions and the error function with the closed-form Gaussian, gamma, beta, binomial-tail and Poisson-tail cdfs, all nine new scalar families of Layer 3 including their boundary branches, and the classical relationships of Layer 4. Layer 5 is complete apart from one item: the Dirichlet chart density is not proved, though the Dirichlet law, its marginals, aggregation and moments are. Layer 6 has the hardest infrastructure done — the symmetric-matrix carrier with `symmetricLebesgue`, the congruence and Cholesky changes of variables, the multivariate Gamma integral — and the Gaussian-Gram Wishart family with its trace mgf, cgf and moments; what is genuinely missing there is the Gaussian-Gram characteristic function `charFun_wishartGramMeasure` and the nonsingular real-degree density family `nonsingularWishartMeasure`, and with it the Bartlett decomposition and the inverse-Wishart law."
```

## Leads outside this job (no edit)

- **Two more private citations in AUDIT-40**, in StandardDistributions layers that no medium finding covers. Each target keeps a public `exact` citation, so removing them before the merge changes no verdict:
  - `TauCeti.Probability.integral_poissonMass_gammaMeasure` (`TauCeti/Probability/Distributions/Gamma/Poisson.lean:87`, `private lemma`), fit `related`, Layer 4 target "The Gamma-mixed Poisson law";
  - `TauCeti.gaussianCondKernel_eq_map_residual` (`TauCeti/Probability/Distributions/Gaussian/Conditional.lean:399`, `private theorem`), fit `related`, Layer 5 target "Conditional Gaussian laws".

  With the edits above, every other declaration AUDIT-40 cites for the two roadmaps is public: 447 citations checked by file and line at the pins.
- **A broken link in Tau Ceti source.** `TauCeti/Probability/Exchangeability/Arrays/AldousHoover/Basic.lean:62–63` gives Kallenberg (2005) as `https://doi.org/10.1007/0-387-28836-4`, which returns 404. The book's DOI is `10.1007/0-387-28861-9`. This is for the Tau Ceti maintainer.
