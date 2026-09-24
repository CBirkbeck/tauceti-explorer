# REV-RT-AUDIT-27 — verification of the red team on library audit AUDIT-27

**Both findings confirmed.** Each is a false statement about a library declaration the audit itself cites, and I would have fixed both. Neither changes a layer verdict, so both fixes are confined to the notes.

Verifier: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: `research/blueprint/redteam/RT-AUDIT-27.result.json`, two findings on `AUDIT-27` (Periods, motivic L-values and special-value conjectures; baseline tauceti `f790474`, mathlib `082e2d3`). **Eligibility:** `cc-fb70e5` appears nowhere in `RT-AUDIT-27.result.json` or `RT-AUDIT-27.md`, and wrote neither `AUDIT-27` nor `REV-AUDIT-27`.

**Method.** I did not take either finding's reading of the library on trust. For each I opened the cited file and read the definition, its local notation and its hypotheses, and then looked for the statement the audit's note would need in order to be true.

**Trees used, stated up front.** Mathlib at `045acef0f761280401116e3801cb78ed1b2e716b` and Tau Ceti at `787733ab7904b5650f41f0f62e3da361dd27b254`, not the pinned `082e2d3` and `f790474`. Every declaration either finding names was present with the content reported; the only discrepancy was one line of drift on `amiceTransformEquiv` (157 against the cited 156). Line drift between commits is expected; no statement or hypothesis differed.

## RT-AUDIT-27/1 — `library-claim`, high — **CONFIRMED**

The audit's `SelmerIwasawaCohomology:L0` note ends:

> "Mathlib's `IsDedekindDomain.selmerGroup` is the group K(S,n) of **S-units mod n-th powers**, the target of the S-restricted Kummer map."

**That is false, and reading the definition rather than the name settles it.** In `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean`:

```lean
/-- The Selmer group `K⟮S, n⟯`. -/
def selmerGroup : Subgroup <| K / n where
  carrier := {x : K/n | ∀ (v) (_ : v ∉ S), (v : HeightOneSpectrum R).valuationOfNeZeroMod n x = 1}
```

with the file's local notation `K "/" n => Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range`. So K(S,n) consists of **field power classes in Kˣ/(Kˣ)ⁿ whose valuation is divisible by n outside S** — a valuation condition, with no requirement of an S-unit representative.

Mathlib makes the containment visible in the opposite direction from the audit's claim: `fromUnit : Rˣ →* K⟮∅,n⟯` maps units *into* the Selmer group, and `fromUnit_ker` proves its kernel is `(powMonoidHom n : Rˣ →* Rˣ).range`, so unit power classes inject as a **subgroup**.

**The dropped quotient is the class-group torsion, and Tau Ceti proves the whole sequence.** The module docstring of `TauCeti/RingTheory/DedekindDomain/SInteger/SelmerGroup/Basic.lean` labels its three results "**exactness on the left**" (`fromSUnitLift_injective`), "**exactness in the middle**" (`ker_toClassGroup`) and "**exactness on the right**" (`range_toClassGroup`), and I read the statements:

- `ker_toClassGroup : (toClassGroup K S n).ker = (fromSUnit K S n).range`
- `range_toClassGroup [NeZero n] : (toClassGroup K S n).range = (powMonoidHom n : ClassGroup (S.integer K) →* ClassGroup (S.integer K)).ker`

which is 1 → O_S^×/(O_S^×)ⁿ → K(S,n) → Cl(O_S)[n] → 1. The audit's identification therefore holds **only when Cl(O_S)[n] is trivial**.

**The finding's second point is also right**, and I checked it separately. The note calls `selmerGroup` "the target of the S-restricted Kummer map" while its other cited declaration is `TauCeti.kummerClassMap`, whose type is into `Multiplicative (H1 (AbsoluteGaloisGroup K) (KummerCoeff K n))` — the target is **H¹**. The sentence does obscure the direction of the injection it cites.

**The fix is correct as proposed:** state the valuation-divisibility definition, record the proved exact sequence with its three declarations, and distinguish the map of power classes into H¹ from the algebraic S-unit map into K(S,n).

**Two qualifications for the fix job.**

1. **Nothing here moves the layer.** The target stays `library: partial` and the layer stays `partly built`. The rest of the note is accurate and independently supported — Tau Ceti does build the finite-level Kummer map, compute it on cocycles and prove its kernel is (Kˣ)ⁿ, and the p-adic limit, the ℤ_p(1) coefficient module and the tensor-product comparison for units and S-units really are absent. **The correction is confined to the final sentence.**
2. **`high` is defensible, but on consequence rather than scope.** The declaration is cited only as `related`, and the layer verdict is unaffected; what earns the grade is that a worker consuming `selmerGroup` as O_S^×/(O_S^×)ⁿ would prove a false statement. I would keep it at high for that reason, and a fix job should be scoped as a note correction, not a re-audit.

## RT-AUDIT-27/2 — `library-claim`, medium — **CONFIRMED**

The audit's `SelmerIwasawaCohomology:L3` note says Mathlib has "abstract measures on Z_p **with values in Q_p** and the Amice transform identifying them with power series", citing `AbstractMeasure.amiceTransformEquiv`. In `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean`:

```lean
def amiceTransform : D(ℤ_[p], R) →ₗ[R] R⟦X⟧          -- general coefficients, a linear MAP
def amiceTransformEquiv : D(ℤ_[p], ℤ_[p]) ≃ₗ[ℤ_[p]] ℤ_[p]⟦X⟧   -- the EQUIVALENCE, ℤ_p-valued
```

So the coefficient domain in the note is wrong: the equivalence is for **ℤ_p**-valued measures, and the general-coefficient version is only a linear map. The file's own module docstring draws the same distinction — `amiceTransform` is "the Amice transform as an `R`-linear map into `R⟦X⟧`", `amiceTransformEquiv` "the Amice transform with `ℤ_[p]`-coefficients, bundled" as a linear equivalence — and the comment above the map points the reader to the equivalence for the bundled form. A reader of the audit would believe Mathlib supplies a ℚ_p-coefficient identification that it does not.

**The fix is right and complete:** replace ℚ_p by ℤ_p, give the actual linear-equivalence type, and cite only the generic transform if ℚ_p-valued measures are mentioned.

**The verdict must not move, and the finding says so.** The target stays `absent`: the cited equivalence supplies neither the completed-group-ring identification nor control theory, characteristic ideals or Γ-module theory, and the note's own observation that this is an analytic object rather than ℤ_p[[Γ]] survives the correction untouched. `medium` is right — the claim is false as written and misdescribes the baseline, but the missing-work conclusion is unaffected.

## What I did not do

I verified the two findings, not the rest of `AUDIT-27`. The red team reports rechecking 204 targets across 45 layers, 182 citation occurrences and 109 overlap claims and finding the broad missing-work verdicts supported; I did not reproduce that sweep, so this review is evidence about these two findings only and not an endorsement of the audit as a whole. I read the declarations at the trees named above rather than at the pinned commits, and I did not attempt to evaluate whether `high` and `medium` are the right grades against the programme's wider calibration — only whether each finding is true, whether its fix is right, and what a fix job should and should not change.
