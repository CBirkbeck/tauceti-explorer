# RT-AUDIT-39: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5048, job FIX-RT-AUDIT-39).
- **Findings and verdicts.** `RT-AUDIT-39.result.json` and `RT-AUDIT-39.review.json`. The red team made 5 findings: 1 high (/1) and 4 medium (/2–/5), none low. The review confirmed all 5 and rejected none; it narrowed /4.
- **Scope.** All 5 confirmed findings are in scope. The fix applied is the one the review authorises, which overrides the red team's fix text where they differ.
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-39.result.json`; no other file changes. The audit's `review` object is unchanged.
- **Library values and layer verdicts.** None change. AdicSpaces Layer 1 stays `built`, Layer 4 `partly built`, Layer 6 `partly built`; RF0:integral-Y and TB.6 stay `not built`; every target keeps its library value.

**Verification.**
- I read every added declaration at Tau Ceti f790474, at the stated file and line, with its hypotheses. Each resolves in the pinned `declarations.tsv` under the stated full name, file and line.
- No layer id is added to any `duplicates` list; two entries are removed and three notes rewritten.
- The two targets that gain citations have at most five declarations. Displaced citations are named in the note with file and line.

## RT-AUDIT-39/1 (high, library-claim): cΓ_v(I) is a case split (AdicSpaces Layer 1)

In the target "Cofinality theory of Lemmas 7.1–7.2, the convex subgroup cΓ_v(I) of Definition 7.3, and Lemma 7.4":
- **Note.** The unconditional "greatest convex subgroup at which I is cofinal" is replaced by both branches of Wedhorn Definition 7.3:
  - if the values of I meet cΓ_v (`IdealMeetsCharacteristicSubgroup`, CofinalIdeal/Greatest.lean:131), then cΓ_v(I) = cΓ_v;
  - only under ¬ IdealMeetsCharacteristicSubgroup v I is cΓ_v(I) the greatest convex subgroup at which I is cofinal, and the note says that `isGreatestIdealCofinal_characteristicSubgroupOfIdeal` carries this hypothesis.
- **Regression example.** The note quotes I = ⊤: 1 ∈ I has value in cΓ_v, so the first branch applies, and 1 is cofinal for no subgroup (`Valuation.not_cofinalValueFor_one`, CofinalIdeal/Basic.lean:251). So the unconditional characterisation would be about an empty family.
- **Citation added.** `Valuation.characteristicSubgroupOfIdeal_of_meets` (CofinalIdeal/Greatest.lean:487, exact), for the first branch. As the review notes, the red team's line 485 is the docstring; the declaration is at 487. The target now has five declarations, the limit.
- **Unchanged.** Library `tauceti`, the existing fits and the Layer 1 verdict `built`.

## RT-AUDIT-39/2 (medium, library-claim): completion preserves strong noetherianness (AdicSpaces Layer 4, summary)

In the target "Completion preserves strong noetherianness and identifies rational localisations and structure presheaves; Theorem 8.28(b) and Corollary 8.35…" (stays `partial`):
- **Citations added, fit related.**
  - `TauCeti.Huber.IsStronglyNoetherian.restrictedMvPowerSeriesCompletion` (Huber/StronglyNoetherian.lean:161), the instance used at k = 0.
  - `TauCeti.Huber.restrictedMvPowerSeriesCompletionFinZeroEquiv` (Huber/WeightedRestrictedSeries/Completion.lean:286), the zero-variable ring isomorphism onto `UniformSpace.Completion A` for the right additive uniformity.
- **Citations kept.** `isStronglyNoetherian_completion` (LocalizationTopology/StronglyNoetherian.lean:104) and `isStronglyNoetherian_congr` (StronglyNoetherian.lean:229).
- **Citations displaced, as the review asks.** `PairOfDefinition.isStronglyNoetherian_completion_self` (LocalizationTopology/StronglyNoetherian.lean:60) and `IsStrictlyTopologicallyFiniteType.isStronglyNoetherian` (TopologicallyFiniteType.lean:250) are now named in the note only. The target has four declarations.
- **Note.** It says the A ↦ Â clause follows by composition, although no single declaration states it: the k = 0 instance (which needs `IsHuberRing A`, and `IsTateRing` extends it), the zero-variable isomorphism, its two continuity lemmas (`continuous_restrictedMvPowerSeriesCompletionFinZeroEquiv`, Completion.lean:329, and `..._symm`, Completion.lean:340, named in the note only), and `isStronglyNoetherian_congr`. It says that the composition was checked on statements, not elaborated in Lean, and that an alias would be a convenience, not a proof obligation. The note still lists the comparison of rational localisations and structure presheaves under completion, Theorem 8.28(b) and Corollary 8.35 as missing.
- **Review correction.** The new citations are `related`, not `exact`, because no single declaration states the clause. The second continuity lemma is at line 340, not the red team's 339.
- **Summary.** "preservation of strong noetherianness under completion" is removed from the AdicSpaces summary's Layer 4 list of missing results.
- **Unchanged.** Target library `partial` and the Layer 4 verdict `partly built`.

## RT-AUDIT-39/3 (medium, library-claim): Pic(T) is not the metric-graph Jacobian (TropicalAndBerkovichArithmetic summary)

- **Summary.** The clause "Pic(T) = coker of the weighted intersection matrix, proved of rank one with finite torsion — the combinatorial Jacobian TB.3 wants" is rewritten. It now describes Pic(T) as (T.Component → ℤ) modulo the image of the weighted intersection matrix: a discrete weighted multidegree quotient, of rank one, with finite ℓ-torsion for each ℓ ≠ 0. It calls this adjacent combinatorial infrastructure whose degree-zero part is only a discrete analogue, and says that the metric-graph Jacobian TB.3 wants is missing.
- **Unchanged.** As the review asks, no target entry, citation, duplicate or verdict changes. TB.3 target 3 already says that the metric-graph Jacobian is absent.

## RT-AUDIT-39/4 (medium, error): integral versus generic period spaces (RF0:integral-Y, AdicSpaces Layer 6)

The review narrows the red team's fix to four items:
- **(a) RF0:integral-Y → AdicSpaces Layer 6: note rewritten, entry kept.** The overlap is now Layer 6.1's A_inf = W(𝒪_F) with the (p,[ϖ])-adic Huber topology, the E = ℚ_p fixed-field case of RF0:integral-Y's target 0 (W_{O_E}(R^+) as a Huber ring). The note says that Layer 6's 𝒴 = D(p) ∩ D([ϖ]) is not 𝒴_S = Spa(W_{O_E}(R^+)) ∖ V([ϖ]), which keeps its characteristic-p fibre. The generic domain's relative counterpart is RF0:annuli's Y_S. The false claim "Layer 6.1 defines exactly 𝒴" is gone.
- **(b) Reverse entry AdicSpaces Layer 6 → RF0:integral-Y: note rewritten in the same way.** Layer 6 already lists RF0:annuli for the generic domain, and RF0:annuli already lists Layer 6. So, as the review says, no entry is added for (a) or (b).
- **(c) FarguesFontaineDiamonds:F0: entry removed from RF0:integral-Y's duplicates.** F0 is in RF0:integral-Y's `requires` list, so it is a declared supplier, not a duplicate. It is not added to RF0:annuli.
- **(d) FarguesFontaineDiamonds:F1: note rewritten as a generic-open comparison.** F1's α_F : Y_F^♢ ≅ S × Spd(ℚ_p) lives on the generic domain. At E = ℚ_p the stage's FS II.1.2 formula (T6) gives S × Spd(ℤ_p) for the integral space. α_F is its restriction to D(p), which is base change from Spd(ℤ_p) to Spd(ℚ_p), not its E = ℚ_p case. The note says RF0:annuli requires F1 as a supplier. F1 is not moved to RF0:annuli as a duplicate.
- **Not applied.**
  - The integral space is not removed, and Spd(O_E) is not replaced by Spd(E); the review does not authorise either.
  - The RF2:integral-divisors → F4 note is unchanged. The review rejected that part of the fix: the note calls RF2 "the general-E, degree-d, integral version", which is not false.
- **Unchanged.** No target status or verdict changes.

## RT-AUDIT-39/5 (medium, error): R35.2 is not a TB.6 duplicate (TB.6)

- **Duplicate removed.** The `ArakelovGeometryAndAbelianHeights:R35.2` entry is deleted from TB.6's duplicates. R35.2 builds the Hodge bundle with the Faltings metric, defined by integration at complex places, and supplies nothing nonarchimedean.
- **Review correction.** The entry is not retargeted to another R35 stage. The review checked that R35.1 and R35.3 do not take over TB.6's objects either.
- **Kept.** The GZ.2, RP.0 and DY.2 entries and all five TB.6 targets, which stay `absent`. The verdict stays `not built`.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-39.result.json research/blueprint/redteam/RT-AUDIT-39.fixes.md`: 0 problems.
- New citations, checked against `declarations.tsv`: `Valuation.characteristicSubgroupOfIdeal_of_meets` (Greatest.lean:487), `TauCeti.Huber.IsStronglyNoetherian.restrictedMvPowerSeriesCompletion` (StronglyNoetherian.lean:161) and `TauCeti.Huber.restrictedMvPowerSeriesCompletionFinZeroEquiv` (Completion.lean:286). All resolve.
- The `review` object is byte-for-byte unchanged, and the JSON keeps its original formatting (indent 1, non-ASCII kept).
- **Maintainer note, not changed here.** Seven targets that no finding touches already had six declarations before this job:
  - TB.0 "Acceptance: nonclassical Gauss points on the closed disc";
  - AdicSpaces Layer 0 "Completion: A → Â has dense image…" and "Henkel's open mapping theorem and Wedhorn Theorem 6.16…";
  - Layer 1 "Spv A as valuative relations on A…";
  - Layer 2 "Proposition 7.52(1)…";
  - Layer 3 "Canonical isomorphisms between the localisations of two presentations…" and "The basis sheaf criterion…".

  No confirmed finding covers them, so they are left for a later pass.
