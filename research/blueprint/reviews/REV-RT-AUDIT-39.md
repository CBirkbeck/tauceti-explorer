# Review: RT-AUDIT-39 (red team of the library audit AUDIT-39)

Job `REV-RT-AUDIT-39` (issue #4457), by Claude Code, session `cc-f805bf`, 30 September 2026.

**Independence.** This verifier did none of AUDIT-39, REV-AUDIT-39 or RT-AUDIT-39. The session id appears in none of their files. The red team was written by the Codex session codex-5ebb6f (PR #4847). The audit came from the 18 September swarm lanes, and the review from cc-442dc5 (PR #2354). One disclosure: this session wrote the paper extraction PAPER-FARGUES-SCHOLZE-21, which routes to RelativeFarguesFontaine, VectorBundlesAndIsocrystals and FarguesFontaineDiamonds. It also reviewed PAPER-FARGUES-FONTAINE-18 (PR #4683), which routes to RF0/RF1 and a RelativeFarguesFontaine Part II. Finding 4 concerns RF0 overlap notes. Neither job wrote or reviewed any of the files verified here.

**Method.** Each finding was checked at its evidence:
- the audit entries in `research/blueprint/audit/AUDIT-39.result.json`, together with the corrections recorded in its `review` field;
- the stage texts in `research/blueprint/atlas/roadmaps/*.json` and the roadmap documents under `content/`;
- every cited declaration, read at [Tau Ceti f790474](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369) and [Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174), including section variables and instance context, with line numbers cross-checked against the baseline `declarations.tsv`;
- Wedhorn, *Adic Spaces*, [arXiv:1910.05934v1](https://arxiv.org/abs/1910.05934v1), Definition 7.3.

This is a check of statements and sources. Nothing was compiled in Lean.

## Verdicts

**5 confirmed, 0 rejected.** Findings 2 and 4 are confirmed only with a narrowed fix. One high and four medium, so all five go to the fix job. Fixers follow the scope in each reason below, not the red team's proposed fix where the two differ.

| Finding | Kind | Severity | Verdict |
| --- | --- | --- | --- |
| RT-AUDIT-39/1 | library-claim | high | confirmed |
| RT-AUDIT-39/2 | library-claim | medium | confirmed, scope narrowed |
| RT-AUDIT-39/3 | library-claim | medium | confirmed |
| RT-AUDIT-39/4 | error | medium | confirmed, scope narrowed |
| RT-AUDIT-39/5 | error | medium | confirmed |

## RT-AUDIT-39/1: the cΓ_v(I) note of AdicSpaces Layer 1

**Confirmed.** The note on target 4 (zero-based) calls `characteristicSubgroupOfIdeal` "the greatest convex subgroup at which I is cofinal", with no condition. The definition is a case split:
- **Definition** (`CofinalIdeal/Greatest.lean:479`). It returns `characteristicSubgroup v` when `IdealMeetsCharacteristicSubgroup v I` holds, and the chosen greatest subgroup otherwise.
- **The greatest-subgroup theorem** (`:495`). It assumes `¬ IdealMeetsCharacteristicSubgroup v I`.

This matches Wedhorn's Definition 7.3 (printed p. 56): "Let cΓv(I) be the group cΓv if v(I) ∩ cΓv ≠ ∅. Otherwise let cΓv(I) be the greatest convex subgroup …".

The counterexample I = ⊤ is right:
- 1 ∈ ⊤ has value 1, and 1 lies in the characteristic subgroup, so the first branch applies.
- `not_cofinalValueFor_one` (`CofinalIdeal/Basic.lean:251`) says 1 is cofinal for no subgroup.
- So the family of subgroups for which ⊤ is cofinal is empty, and it has no greatest element.

**Scope.**
- Rewrite only this note, giving both branches.
- The first-branch theorem `characteristicSubgroupOfIdeal_of_meets` is at `:487`, not `:485`. Line 485 is its docstring; `declarations.tsv` gives 487.
- Adding it as a citation brings the target to the limit of five declarations.
- The status, fit labels and the verdict built for Layer 1 are unchanged.

## RT-AUDIT-39/2: completion and strong noetherianness

**Confirmed, with a narrowed scope.** The red team's composition is sound at the pinned commit. It runs in four steps:
1. **k = 0 instance** (`StronglyNoetherian.lean:161`). Under `[IsHuberRing A] [IsStronglyNoetherian A]`, `IsStronglyNoetherian.restrictedMvPowerSeriesCompletion` makes each `A⟨X₁,…,X_k⟩` strongly noetherian. `IsTateRing` extends `IsHuberRing` (`Huber/Basic.lean:182`), so a Tate base qualifies.
2. **Zero-variable equivalence** (`WeightedRestrictedSeries/Completion.lean:286`). `restrictedMvPowerSeriesCompletionFinZeroEquiv` identifies `A⟨⟩` with `UniformSpace.Completion A` for the right additive uniformity.
3. **Continuity both ways.** The two continuity lemmas are at `:329` and `:340`; the red team's `:339` is off by one.
4. **Transport** (`StronglyNoetherian.lean:229`). `isStronglyNoetherian_congr` moves the predicate along a bicontinuous ring isomorphism. Mathlib's instance `NonarchimedeanRing (Completion R)` (`Topology/Algebra/Nonarchimedean/Completion.lean:70`) supplies the hypotheses on the completion side.

So "A strongly noetherian ⇒ Â strongly noetherian" is a composition of existing declarations. It is not a missing mathematical result. The AdicSpaces summary nevertheless lists "preservation of strong noetherianness under completion" among the gaps. REV-AUDIT-39 was right that `isStronglyNoetherian_completion` concerns A⟨T/s⟩. It missed this composition route.

**Scope.**
- **Note on target 7.** Rewrite it so that the A ↦ Â clause follows from these statements.
- **Citations.** Stay within five declarations:
  - add the instance (`:161`) and the equivalence (`:286`) as *related*;
  - keep `isStronglyNoetherian_congr` and `isStronglyNoetherian_completion`;
  - drop `isStronglyNoetherian_completion_self` and `IsStrictlyTopologicallyFiniteType.isStronglyNoetherian`;
  - name the continuity lemmas in the note only.
- **Summary.** Remove the phrase from the list of missing results.
- **Fit.** Do not use *exact*: no single declaration states the clause.
- **Status.** Target 7 stays partial and Layer 4 partly built. Still missing are the comparison of rational localisations and structure presheaves under completion, Theorem 8.28(b) and Corollary 8.35.

## RT-AUDIT-39/3: Pic(T) in the TropicalAndBerkovichArithmetic summary

**Confirmed.** `NumericalType.Pic` (`Picard/Basic.lean:204`) is `(T.Component → ℤ) ⧸ principalDivisors`, and `principalDivisors` (`:162`) is the range of the weighted intersection matrix. Two results are proved about it:
- `finrank_pic` (`Picard/Rank.lean:186`) gives rank one, so Pic(T) still contains the degree and is not a Jacobian;
- `finite_torsion` (`Picard/Torsion.lean:57`) is finiteness of the ℓ-torsion for each ℓ ≠ 0.

These carriers have no edge lengths. TB.3 asks for the Jacobian of a metric graph, with a loop-graph acceptance test. The audit's own target 3 note, as corrected by REV-AUDIT-39, already says the metric-graph Jacobian is absent. Only the summary phrase "the combinatorial Jacobian TB.3 wants" contradicts it.

**Scope.** Rewrite that summary clause to call Pic(T) discrete adjacent infrastructure: rank one, and finite ℓ-torsion for each ℓ ≠ 0. The metric-graph Jacobian is recorded as missing. Targets, citations, duplicates and verdicts are unchanged.

## RT-AUDIT-39/4: integral versus generic period spaces

**Confirmed, with a narrowed scope.** The stage texts keep the two spaces apart:
- **RF0:integral-Y.** Defines 𝒴_S = Spa(W_OE(R⁺)) ∖ V([ϖ]), "Its characteristic-p fibre is retained", with 𝒴_S^♢ ≅ S × Spd(O_E).
- **RF0:annuli.** Removes V(π) to obtain Y_S.
- **AdicSpaces §6.1.** Defines 𝒴 = {v : v(p[ϖ]) ≠ 0} = D(p) ∩ D([ϖ]), which is the generic domain.
- **F0.** Imports that Y_F and warns that the open is the complement of the product zero locus.
- **F1.** Proves Y_F^♢ ≅ S × Spd(ℚ_p).

At E = ℚ_p the integral formula has Spd(ℤ_p), not Spd(ℚ_p). F1 is its restriction to D(p). So three notes are false:
- "Layer 6.1 defines exactly 𝒴" (RF0:integral-Y → Layer 6);
- F0's "the same space";
- F1's "E = ℚ_p case of … FS II.1.2".

REV-AUDIT-39 introduced the F1 entry. The dependency data changes how the notes should be fixed:
- **F0.** RF0:integral-Y declares FarguesFontaineDiamonds:F0 as a prerequisite, so F0 is a supplier, not a duplicate.
- **F1.** F1 is a declared prerequisite of RF0:annuli.

**Scope.**
- **(a) RF0:integral-Y → Layer 6.** Keep the entry. Restate the overlap as Layer 6.1's A_inf with its (p,[ϖ])-adic Huber topology, which is the fixed-field E = ℚ_p case of target 0. Say that Layer 6's 𝒴 corresponds to RF0:annuli's Y_S, not to 𝒴_S.
- **(b) Layer 6 → RF0:integral-Y.** Make the same correction. The generic-domain overlap between Layer 6 and RF0:annuli is already recorded in both directions, so nothing is added.
- **(c) F0.** Remove the entry. It is a declared supplier. Do not add F0 to RF0:annuli's duplicates either.
- **(d) F1.** Remove the entry, or rewrite it as a generic-open comparison. Do not move it to RF0:annuli, whose prerequisite it is.
- **Not authorized.**
  - Removing the integral space.
  - Replacing Spd(O_E) by Spd(E).
  - Changing any status or verdict.
  - Requalifying the RF2:integral-divisors → F4 note. That note already calls RF2 "the general-E, degree-d, integral version", which is not false, so it stays as it is.

## RT-AUDIT-39/5: the R35.2 duplicate of TB.6

**Confirmed.** R35.2, "The Hodge bundle and Faltings metric", equips the determinant of invariant differentials "with the metric defined by integration at complex places". Everything else it asks for is archimedean normalisation. TB.6 asks for model metrics from formal models, model measures, semipositive approximation and local heights, with Gauss-point and Tate-circle tests. No R35 stage owns these:
- R35.1 is hermitian bundles and arithmetic degree;
- R35.3 only separates bad-place corrections inside the stable Faltings height.

**Scope.** Delete the R35.2 entry from TB.6's duplicates, without retargeting it. The GZ.2, RP.0 and DY.2 entries, the five absent targets and the verdict not built are unchanged.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-39.result.json research/blueprint/redteam/RT-AUDIT-39.review.json` reports `ok` for both files.
- `python3 research/blueprint/intake.py check-files` on both deliverables reports 2 files and 0 problems.
