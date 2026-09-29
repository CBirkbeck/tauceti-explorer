# RT-AREA-analysis: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3985, job FIX-RT-AREA-analysis).
- Findings: `RT-AREA-analysis.result.json`, 5 findings (4 high, 1 medium), by `codex-c83e7a`.
- Verdicts: `RT-AREA-analysis.review.json` and `research/blueprint/reviews/REV-RT-AREA-analysis.md`, by `codex-hjdg0j`. All five are confirmed.
- Checked at origin/main `09710a95`. The three snapshots named below were last rebuilt on 16 September; nothing has changed since the verification.

This report is the only file changed. Every finding is about a Tau Ceti roadmap: `OneParameterSemigroups`, `OptimalTransport` and `ConformalMapping` under `content/tau-ceti/`. These are snapshots of the upstream TauCetiRoadmap repository. Under PROTOCOL.md section 15 they are existing work, which the atlas never re-plans. So each fix is a **note for the Tau Ceti maintainer**: replacement wording for the upstream README. The snapshot and the atlas stage descriptions are then regenerated from upstream, as the verifier asks; a generated extract alone is not the repair.

**Quotations ignore line wrapping.** The quoted old text ignores the README's line wrapping; each quotation occurs exactly once in its file (checked against the snapshot at `09710a95`).

**No new mathematics is planned.** Four of the five corrections point at declarations already built at the Tau Ceti pin (`f790474`); only the barycenter theorem stays unbuilt. The reviewed library coverage (`data/library-coverage.json`) already credits and qualifies those declarations, and keeps its verdicts. Each cited declaration was read at the pin, with its hypotheses, for this report.

**Disclosure.** This session did not write the red team, its verification, or the three roadmaps.

## /1 (high, error): Bernstein's theorem is for the continuous class, and the strong class stays separate

### What the verifier corrected
- **The roadmap's predicate is too strong for the theorem.** Its `ContDiffOn` predicate requires finite right derivatives of every order at 0, and an arbitrary finite Laplace measure does not supply them. For μ = Σ_{n≥1} 2^{−n} δ_{2^n}, f(t) = Σ 2^{−n} e^{−2^n t} has mass 1, but (1 − f(t))/t ≥ Σ_{n≤N} 2^{−n}(1 − e^{−2^n t})/t → N, so the right derivative is infinite.
- **Pointwise limits break continuity at the endpoint.** e^{−nt} tends on [0,∞) to the discontinuous indicator of {0}.
- **The pin separates the two classes.**
  - `hausdorff_bernstein_widder_existsUnique` (`Bernstein/HausdorffBernsteinWidder.lean:70`) proves the finite-measure iff for `IsContinuousCompletelyMonotoneOnIoi`, not `IsCompletelyMonotone`.
  - `Representation.lean:504` gives the all-moments converse for the strong class.
  - `Limits.lean:68` and `:96` give open-half-line limit closure and its endpoint-continuous version.
- **Endpoint continuity repairs closure of the weaker class only.** The partial sums of the first example have a continuous limit that is not endpoint-smooth.
- **What to do:** correct the prose and the displayed stub, import these theorems, and keep the library credit.

### Read at the pin
- `IsCompletelyMonotone` (`TauCeti/Analysis/CompletelyMonotone/Basic.lean:195`): `ContDiffOn ℝ ∞ f (Ici 0) ∧ ∀ n t, 0 ≤ t → 0 ≤ (-1)^n * iteratedDerivWithin n f (Ici 0) t`.
- `IsContinuousCompletelyMonotoneOnIoi` (`Basic.lean:483`): `ContinuousOn f (Ici 0) ∧ IsCompletelyMonotoneOnIoi f`.
- `hausdorff_bernstein_widder_existsUnique` (`Bernstein/HausdorffBernsteinWidder.lean:70`): `IsContinuousCompletelyMonotoneOnIoi f ↔ ∃! μ : Measure ℝ≥0, RepresentsLaplace μ f`.
- `RepresentsLaplace` (`Laplace/Representation.lean:517`): `IsFiniteMeasure μ ∧ ∀ t, 0 ≤ t → f t = laplaceTransform μ t`.
- `isCompletelyMonotone_laplaceTransform_of_moments` (`Representation.lean:504`): under `∀ n, Integrable (fun x => (x:ℝ)^n) μ`.
- `isCompletelyMonotoneOnIoi_of_tendsto` (`Limits.lean:68`), and `isContinuousCompletelyMonotoneOnIoi_of_tendsto` (`Limits.lean:96`) with the extra hypothesis `ContinuousWithinAt f (Ici 0) 0`.

### Note for the Tau Ceti maintainer: `OneParameterSemigroups/README.md`, Part B

1. **"Objects".** Replace the paragraph beginning "**Objects.** `IsCompletelyMonotone` — **bundle smoothness**" with:
   > **Objects.** Two classes, kept distinct (both built; `TauCeti/Analysis/CompletelyMonotone/Basic.lean`):
   > - `IsContinuousCompletelyMonotoneOnIoi f`: continuity on `[0,∞)` and complete monotonicity on `(0,∞)`. This is the class Bernstein's theorem characterises.
   > - `IsCompletelyMonotone f` (strong): `ContDiffOn ℝ ∞ f (Set.Ici 0) ∧ ∀ n, ∀ t ≥ 0, 0 ≤ (−1)ⁿ · iteratedDerivWithin n f (Set.Ici 0) t`, with derivatives within `[0,∞)`.
   >
   > ⚠ The smoothness clause is essential: derivatives are total and default to `0` where `f` is not differentiable, so `0 ≤ 0` would let a non-smooth `f` pass *vacuously*. The strong class is strictly smaller. A finite measure need not give finite derivatives at `0`: for `μ = Σ_{n≥1} 2^{−n} δ_{2^n}` (mass 1), `f(t) = Σ_{n≥1} 2^{−n} e^{−2^n t}` has an infinite right derivative at `0`.
   >
   > The related **Bernstein functions** (nonnegative, with completely monotone derivative).
2. **"API to develop", the closure bullet.** Replace "Closure: completely monotone functions are closed under **sums, nonnegative scalar multiples, products, and pointwise limits**;" with:
   > Closure: completely monotone functions are closed under **sums, nonnegative scalar multiples and products**. **Pointwise limits:**
   > - a finite-valued pointwise limit on `(0,∞)` of functions completely monotone on `(0,∞)` is completely monotone on `(0,∞)` (`isCompletelyMonotoneOnIoi_of_tendsto`, `Limits.lean:68`);
   > - it is in the continuous class when the limit is also right-continuous at `0` (`isContinuousCompletelyMonotoneOnIoi_of_tendsto`, `Limits.lean:96`).
   >
   > Neither class is closed under pointwise limits on `[0,∞)` without that condition: `e^{−nt} → 𝟙_{{0}}`. The strong class is not closed even with it: the partial sums of the example above.

   The rest of the bullet ("**composition** `g ∘ f` … derivative/integral closure") stays.
3. **"Milestone — Bernstein's theorem".** Replace the paragraph from "**Milestone — Bernstein's theorem.** `f` completely monotone **on the closed `[0,∞)`**" to "measure extraction via Prokhorov tightness." with:
   > **Milestone — Bernstein's theorem (built).** `f` is continuous on `[0,∞)` and completely monotone on `(0,∞)` **iff** it is the Laplace transform on `[0,∞)` of a unique **finite** positive measure on `[0,∞)`: `hausdorff_bernstein_widder_existsUnique` (`Bernstein/HausdorffBernsteinWidder.lean:70`), with `RepresentsLaplace μ f := IsFiniteMeasure μ ∧ ∀ t ≥ 0, f t = laplaceTransform μ t` (`Laplace/Representation.lean:517`). Import it; do not rebuild it.
   >
   > ⚠ Complete monotonicity on the *open* `(0,∞)` alone yields only a general (possibly infinite) positive measure (Hausdorff–Bernstein–Widder). For example `1/t = ∫₀^∞ e^{−tx} dx` is completely monotone with the infinite Lebesgue representing measure. Finiteness is exactly the `f(0⁺) < ∞` criterion, which continuity on `[0,∞)` builds in.
   >
   > The strong class `IsCompletelyMonotone` is reached only under more: a finite measure all of whose moments are integrable has its Laplace transform in it (`isCompletelyMonotone_laplaceTransform_of_moments`, `Representation.lean:504`). The measure `Σ 2^{−n} δ_{2^n}` shows that finiteness alone is not enough.
   >
   > The measure lives on `Measure ℝ≥0`, so non-negative support is automatic; this is the BCR milestone's convention, not a `support ⊆ Ici 0` side-condition.
4. **The Lean stub.** Replace the displayed block with:
   ```lean
   -- theorem hausdorff_bernstein_widder_existsUnique (f : ℝ → ℝ) :
   --     IsContinuousCompletelyMonotoneOnIoi f ↔ ∃! μ : Measure ℝ≥0, RepresentsLaplace μ f
   -- (built: TauCeti/Analysis/CompletelyMonotone/Bernstein/HausdorffBernsteinWidder.lean:70)
   ```
5. **"Acceptance examples".** Append:
   > Regression: `Σ_{n≥1} 2^{−n} e^{−2^n t}` is in the continuous class but not the strong one (infinite right derivative at `0`); `e^{−nt} → 𝟙_{{0}}` on `[0,∞)` is not a limit in either class.

## /2 (high, error): the general-growth Hille–Yosida route does not use contractive Yosida exponentials

### What the verifier corrected
- **The counterexample.** On X = ℝ take A = I. The resolvent-power estimate holds with M = ω = 1, but A_λ = λ/(λ−1)·I and ‖e^{tA_λ}‖ = e^{tλ/(λ−1)} > 1. So the shared contraction sentence is false for general growth.
- **The textbook routes.** Engel–Nagel II.3.5 proves the contraction case. II.3.8 shifts first and uses an equivalent norm for general M.
- **The pin's route.**
  - The exponent-zero M-bound: `HilleYosida/Approximation.lean:105`.
  - The shift: `Shift.lean:49`.
  - The shifted limit and generation: `Generation.lean:165–205`.
- **What to do.**
  - Import the real-Banach-space theorem, with its density, M ≥ 1 and all-resolvent-powers hypotheses; its growth bound is written `HasGrowthBound omega M`.
  - Keep the contraction route under the dissipativity and range hypotheses.
  - Do not assert that shifting alone makes the original-norm bound contractive when M > 1.
  - No new semigroup owner.

### Read at the pin
- `norm_exp_smul_yosidaApproximation_le` (`TauCeti/Analysis/Semigroups/Generation/HilleYosida/Approximation.lean:105`): `‖exp (t • yosidaApproximation A λ)‖ ≤ M`, under `1 ≤ M`, `0 < λ`, `0 ≤ t` and `‖resolvent A λ ^ n‖ ≤ M / λ ^ n` for n ≥ 1.
- `LinearPMap.hilleYosida_zero_of` (`HilleYosida/Shift.lean:49`): transfers the (ω, M) hypotheses to `subScalar A omega` with exponent 0.
- `tendsto_hilleYosidaSemigroup` (`HilleYosida/Generation.lean:165`).
- `hilleYosida_generation` (`Generation.lean:205`): `∃ S : StronglyContinuousSemigroup X, S.generator = A ∧ S.HasGrowthBound omega M`, for a real Banach space X under `1 ≤ M`, `(ω,∞) ⊆` resolvent set, all power estimates and a dense domain.
- `IsMDissipative.exists_contractionSemigroup_generator_eq` (`Generation/LumerPhillips.lean:86`): a densely defined m-dissipative A generates a contraction semigroup.

### Note for the Tau Ceti maintainer: `OneParameterSemigroups/README.md`, Part A
Replace the paragraph from "⚠ **Both are genuinely open / build-here**, via the same **Yosida approximation**:" to "Refs: Engel–Nagel II.3.5–3.8; Pazy Ch. 1." with:

> Both milestones are **built** (Tau Ceti `f790474`); import them. Both use the **Yosida approximation** `Aλ = λ² R(λ,A) − λI`, but not in the same way.
> - **Lumer–Phillips (contraction).** For densely defined m-dissipative `A` the `e^{tAλ}` are contractions and converge; their limit is a contraction semigroup with generator `A` (`IsMDissipative.exists_contractionSemigroup_generator_eq`, `Semigroups/Generation/LumerPhillips.lean:86`).
> - **Hille–Yosida, general growth `(M, ω)`.** The `e^{tAλ}` are **not** contractions in general: for `A = I` on `ℝ` with `M = ω = 1`, `Aλ = λ/(λ−1) · I` and `‖e^{tAλ}‖ = e^{tλ/(λ−1)} > 1`. The built route is:
>   1. shift to `A − ωI` (`LinearPMap.hilleYosida_zero_of`, `HilleYosida/Shift.lean:49`);
>   2. bound the exponent-zero exponentials by `M` using **all** resolvent-power estimates (`norm_exp_smul_yosidaApproximation_le`, `HilleYosida/Approximation.lean:105`);
>   3. prove the `e^{tAλ}x` Cauchy uniformly on compact `t`-intervals, *define* `S(t)x` as the limit and shift back (`tendsto_hilleYosidaSemigroup`, `HilleYosida/Generation.lean:165`);
>   4. identify the generator.
>
>   The theorem is `hilleYosida_generation` (`Generation.lean:205`) on a real Banach space, under `1 ≤ M`, a dense domain, `(ω,∞)` in the resolvent set and all power estimates; its growth bound is written `HasGrowthBound omega M`. Shifting does not make the original-norm bound contractive when `M > 1`; Engel–Nagel II.3.8 uses an equivalent norm instead, and the Tau Ceti proof uses the direct `M`-bound.
>
> Refs: Engel–Nagel II.3.5 (contraction, pp. 73–74) and II.3.8 (general growth, pp. 77–78); Pazy Ch. 1. Regression test: `A = I` on `ℝ` with `M = ω = 1` separates the two regimes.

The PDE and optimal-transport consumers keep the general `StronglyContinuousSemigroup` interface, as the verifier says. No consumer text changes.

## /3 (high, error): the involutive-monoid API states its group hypotheses

### What the verifier corrected
- **The counterexample.** On ℝ≥0 with the identity involution, F(t) = e^t has quadratic form |Σ cᵢ e^{tᵢ}|² ≥ 0, so it is positive definite in the generic sense. It is continuous at zero but exceeds F(0) = 1, and is not uniformly continuous: at n and n + e^{−n} its values differ by e^n(e^{e^{−n}} − 1) → 1.
- **What the pin assumes.**
  - `Basic.lean:206` keeps the general diagonal Cauchy–Schwarz bound.
  - `Basic.lean:213` needs a + a⋆ = 0 for the bound by F(0).
  - `Continuity.lean:250` needs a seminormed additive group and a globally negating involution.
- **What to do.** Apply these qualifications, keep the generic monoid definition, and keep BCR's separately stated boundedness hypothesis. The unbounded example does not refute the qualified BCR theorem. Keep the library credit.

### Read at the pin
- `IsPositiveDefinite.normSq_le` (`TauCeti/Analysis/PositiveDefinite/Basic.lean:206`): `normSq (F (a + star b)) ≤ (F (a + star a)).re * (F (b + star b)).re`.
- `norm_apply_le_map_zero_re_of_add_star_eq_zero` (`Basic.lean:213`): `(ha : a + star a = 0) → ‖F a‖ ≤ (F 0).re`.
- `uniformContinuous_of_continuousAt_zero_of_forall_star_eq_neg` (`PositiveDefinite/Continuity.lean:250`): `(hstar : ∀ x, star x = -x) (hcont : ContinuousAt F 0) → UniformContinuous F`, on a seminormed additive group E.

### Note for the Tau Ceti maintainer: `OneParameterSemigroups/README.md`, Part C
In "API to develop", first bullet, replace "for `F : M → ℂ`, conjugate symmetry, `(F 0).im = 0`, `0 ≤ (F 0).re`, and `‖F a‖ ≤ (F 0).re` (the Lean-typed form of `F(0) ≥ |F(a)|`); **continuity at `0` ⇒ uniform continuity**." with:

> for `F : M → ℂ` on a general involutive monoid: conjugate symmetry, `(F 0).im = 0`, `0 ≤ (F 0).re`, and the diagonal Cauchy–Schwarz bound `normSq (F (a + b⋆)) ≤ (F (a + a⋆)).re · (F (b + b⋆)).re` (`IsPositiveDefinite.normSq_le`, `PositiveDefinite/Basic.lean:206`).
>
> Two further facts need the group hypotheses (both built):
> - **`‖F a‖ ≤ (F 0).re`** (the Lean-typed form of `F(0) ≥ |F(a)|`) holds when `a + a⋆ = 0` (`norm_apply_le_map_zero_re_of_add_star_eq_zero`, `Basic.lean:213`);
> - **continuity at `0` ⇒ uniform continuity** holds on a seminormed additive group with `x⋆ = −x` (`uniformContinuous_of_continuousAt_zero_of_forall_star_eq_neg`, `PositiveDefinite/Continuity.lean:250`).
>
> Neither holds on a general involutive monoid. On `ℝ≥0` with the trivial involution, `F(t) = e^t` is positive definite (its quadratic form is `|Σ cᵢ e^{tᵢ}|²`), continuous at `0`, unbounded and not uniformly continuous. So the BCR milestone keeps boundedness as a separate hypothesis. The PD-kernel, graph-gluing and semigroup consumers carry the group hypothesis wherever they use either fact.

The rest of the bullet (the ⚠ on pointwise limits) stays.

## /4 (high, error): barycenter uniqueness uses Agueh–Carlier's revised small-set threshold

### What the verifier corrected
- **The roadmap follows an obsolete draft.** The August 17, 2010 draft's Definition 3.2 uses dimension < d−1; the December 10, 2010 revision uses ≤ d−1, and its Proposition 3.5 proves uniqueness under the revised predicate.
- **The counterexample in ℝ².**
  - The uniform laws on the perpendicular centred segments vanish on every Borel set of dimension < 1.
  - Every coupling has squared cost 2/3.
  - The equal-parameter and opposite-parameter couplings give the distinct midpoint laws law(U/2, U/2) and law(U/2, −U/2).
  - Both attain 1/6 for the averaged squared-distance objective, which is its triangle-inequality lower bound, so uniqueness fails.
- **What to do.**
  - Replace the threshold by ≤ n−1, citing the revised Definition 3.2 and Proposition 3.5.
  - Keep the probability, finite-second-moment and positive normalized weight hypotheses.
  - One qualifying input suffices for uniqueness. The simultaneous Brenier-map characterization (Proposition 3.8) assumes the condition on every input.
  - Keep the density estimates separate.
- **Status.** This corrects an obsolete manuscript condition, not a new error in the revised source. The barycenter theorem stays unbuilt.

### Read for this fix
Agueh–Carlier, *Barycenters in the Wasserstein space*, author version dated December 10, 2010, 27 pages (https://www.ceremade.dauphine.fr/~carlier/Wasserstein-barycenters, SHA-256 48d0c809…a287, the hash the verifier records), read 29 September 2026:
- **Definition 3.2 (p. 10):** "A probability measure µ … is said to vanish on small sets if and only if µ(A) = 0 for every Borel set A of R^d, having Hausdorff dimension less than or equal to d − 1."
- **Proposition 3.5 (p. 11):** "Assume that there is an index i … such that ν_i vanishes on small sets. Then (P) admits a unique solution".
- **Proposition 3.8 (pp. 11–12):** "Assume that ν_i vanishes on small sets for every i".

### Note for the Tau Ceti maintainer: `OptimalTransport/README.md`, Layer 12, item 7
Replace the text of item 7, from "For normalized positive weights, define Agueh--Carlier's" to "do not infer this density bound from the small-set predicate alone.", with:

> 7. For normalized positive weights, define Agueh--Carlier's "vanishes on small sets" predicate exactly as in the revised Definition 3.2 (*Barycenters in the Wasserstein space*, version of 10 December 2010, p. 10): `μ(A)=0` for every Borel `A⊆ℝⁿ` whose Hausdorff dimension is **at most** `n-1`.
>    - **The strict threshold of the August 2010 draft is not enough.** In `ℝ²`, the uniform laws on `[-1,1]×{0}` and `{0}×[-1,1]` vanish on every Borel set of dimension `<1`, yet the equal-weight barycenter is not unique: the laws of `(U/2, U/2)` and `(U/2, -U/2)` both attain the minimum.
>    - **Existence and uniqueness.** Prove them in `P₂(ℝⁿ)` when one positive-weight input has the property (Proposition 3.5, p. 11); absolute continuity is a standard sufficient corollary.
>    - **Multi-map optimality conditions.** Develop them, with the characterization by Brenier maps assuming the property for **every** input (Proposition 3.8, pp. 11–12).
>    - **The density estimate.** If that input has density in `L∞`, prove the separate Agueh--Carlier estimate `‖ρ_bar‖_∞ ≤ λ_j^(-n) ‖ρ_j‖_∞`; do not infer this density bound from the small-set predicate alone.

The stage description of this layer in `data/atlas.json` follows the snapshot and is regenerated from it.

## /5 (medium, error): L4 straightens general analytic arcs with biholomorphic charts

### What the verifier corrected
- **Möbius maps only straighten generalized circles.** A Möbius preimage of the real axis is a generalized circle. The regular analytic parabola t + it² lies on no line or circle on an interval: substituting it into A|z|² + Bx + Cy + D = 0 forces every coefficient to vanish. So no Möbius map straightens it.
- **A biholomorphic chart does.** The local inverse of h(z) = z + iz², with h′(0) = 1, is a biholomorphic straightening chart.
- **The pin already has the theorem.** Charted reflection is proved at `Reflection/Arc.lean:160`, with these hypotheses:
  - holomorphic open partial homeomorphisms as charts;
  - conjugation-invariant coordinate domains and the mapping conditions;
  - continuity on the closed side, holomorphy on the open side, and the real-boundary condition.
- **What to do.** Restrict Möbius reduction to lines and circles, and import the chart theorem for regular analytic arcs, keeping every hypothesis and the built verdict.

### Read at the pin
`differentiableOn_chartedSchwarzReflection_of_symmetric` (`TauCeti/Analysis/Complex/Conformal/Reflection/Arc.lean:160`) has these hypotheses:
- `DifferentiableOn ℂ e e.source` and `DifferentiableOn ℂ d d.source` (the charts e, d);
- `MapsTo conj e.target e.target` and `MapsTo conj d.target d.target`;
- f maps `e.source ∩ {0 ≤ (e z).im}` into `d.source`;
- f is continuous on that set and differentiable on `e.source ∩ {0 < (e z).im}`;
- `(e z).im = 0 → (d (f z)).im = 0` on `e.source`.

Conclusion: `DifferentiableOn ℂ (chartedSchwarzReflection e d f) e.source`.

### Note for the Tau Ceti maintainer: `ConformalMapping/README.md`, milestone L4
In the L4 bullet, replace "then across an analytic arc / circle by Möbius reduction;" with:

> then across a line or circle by Möbius reduction, and across a general regular real-analytic arc by a local biholomorphic straightening chart. For the arc case import the charted reflection theorem `differentiableOn_chartedSchwarzReflection_of_symmetric` (`Complex/Conformal/Reflection/Arc.lean:160`) with all its hypotheses:
> - holomorphic open partial homeomorphisms as source and target charts;
> - conjugation-invariant chart targets;
> - the mapping condition;
> - continuity on the closed side and holomorphy on the open side;
> - the real-boundary condition.
>
> A Möbius map cannot do this: the parabola `t + it²` lies on no line or circle, while the local inverse of `z ↦ z + iz²` straightens it (the acceptance example);

The rest of the bullet (Painlevé removability, monodromy, L4.0) stays. The reviewed built verdict for charted reflection is unchanged.

## Sources read
- **Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`** (pinned baseline tree), read 29 September 2026:
  - `Analysis/CompletelyMonotone/{Basic, Limits}.lean`, `Bernstein/HausdorffBernsteinWidder.lean` and `Laplace/Representation.lean`;
  - `Analysis/Semigroups/Generation/{LumerPhillips.lean, HilleYosida/Approximation.lean, HilleYosida/Shift.lean, HilleYosida/Generation.lean}`;
  - `Analysis/PositiveDefinite/{Basic, Continuity}.lean`;
  - `Analysis/Complex/Conformal/Reflection/Arc.lean`.

  Each at the lines cited, with the hypotheses in scope.
- **Agueh and Carlier**, *Barycenters in the Wasserstein space*, author version of 10 December 2010. https://www.ceremade.dauphine.fr/~carlier/Wasserstein-barycenters (SHA-256 48d0c809725c7c8abdaa2bc0e698c691f8f3ed4b7221ef50f060f06479bca287). Pages 1 and 10–12.
- **Engel and Nagel**, II.3.5 and II.3.8, are cited as the verifier read them (printed pp. 73–78). They were not re-read here.
