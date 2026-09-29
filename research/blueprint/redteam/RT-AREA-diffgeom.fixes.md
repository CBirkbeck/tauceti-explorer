# RT-AREA-diffgeom: fixes

Fixer: Claude Code, session `cc-e94dc5` (with one subagent per finding group), 29 September 2026 (issue #3992).
- Findings: `RT-AREA-diffgeom.result.json`.
- Verdicts: `RT-AREA-diffgeom.review.json`.
- Sixteen findings. Fourteen are confirmed; /8 and /16 are rejected.

**How the fixes are applied.** Every confirmed finding concerns the upstream Tau Ceti roadmap `content/tau-ceti/HopfRinow/README.md` (atlas stages `tauceti:TauCetiRoadmap/HopfRinow#…`) or its declared consumers. Under PROTOCOL.md §15 the atlas never re-plans a Tau Ceti roadmap, and as in the other area fixes this report is the only file changed. Each section gives:
- a **note for the Tau Ceti maintainer**, with exact replacement wording at origin/main line numbers;
- or exact link entries for the link workflow, for /14 and /15.

Each fix follows the review's corrected contract. Every declaration cited was opened at the pins (Mathlib `082e2d3`, Tau Ceti `f790474`). Lee's and do Carmo's books are not public; where a review cites them, the section follows the review's reading.

The seven link entries of /14 and /15 pass `scripts/check_links.py` on a scratch packet: 0 errors, 0 warnings, no cycle. A deliberately corrupted quote was rejected, so the check is not vacuous.

## Coordination between the edits

Several edits touch the same passages. Apply them together as follows.
- **Layer 1, lines 264–267** (the smooth-dependence bullet): /2's replacement supersedes /7's narrowing of the same sentence. Use /2's wording.
- **Layer 3's `(a_p) ∧ (f_p) ⇒ (b)` step:**
  - /5 inserts a sentence after line 365, and /9 rewrites lines 366–369. The two are adjacent and compatible.
  - /1 (item 3) and /5's alternative change neighbouring sentences of the same bullet.
- **/1's route A uses two other fixes:** /2's joint exponential and /5's endpoint comparison. Apply those first.
- **/11's compactness proof uses one open Layer-1 identification:** the chosen maximal geodesic as the spray's maximal integral curve, named in /7.

## /1 (high, missing): Layer 3's `(a_p) ⇒ (f_p)` needs uniformly normal neighbourhoods and the no-corner lemma

**Checked.**
- README (`content/tau-ceti/HopfRinow/README.md` at origin/main), Layer 3, lines 358–363: "**(a_p) ⇒ (f_p):** with `exp_p` everywhere defined, every `q` is joined to `p` by a curve satisfying `IsGeodesicCurveOn γ (Icc 0 1)`, `γ 0 = p`, `γ 1 = q`, and `pathELength I γ 0 1 = edist p q`; … Build it by minimizing distance on compact spheres in the finite-dimensional `T_p M`, using continuity of distance to `q`, and iterating the normal-ball radial extension step."
- Layer 2 gives normal neighbourhoods only about one fixed point. Lines 317–318: "`exp_p` restricts to a diffeomorphism from a star-shaped neighbourhood of `0`, giving normal balls and normal coordinates". Its minimization also concerns only the centre, lines 324–325: "a radial segment from `p` minimizes length against every piecewise-`C¹` competitor with the same endpoints whose image stays in the normal ball". The one variational route is shut off at lines 333–338: "define the energy functional on `C¹` curves, smooth variations with fixed endpoints … prove that a smooth curve is critical exactly when it is a geodesic. This milestone is part of the reusable geodesic API; it is not an input to the Hopf–Rinow implication graph below." The References cite do Carmo "**§4** (convex neighbourhoods)" (line 454), but no layer plans them.
- Where the gap is: the extension step at `s₀` produces a broken curve `p → γ(s₀) → x` of length `d(p, x)`. Concluding that `x = γ(s₀ + δ')` means removing a corner at an interior point of the curve. That needs a normal ball of fixed radius about points near `γ(s₀)`, i.e. a lower bound on normal radii near a point, and Layer 2's pointwise radii give no such bound.
- Tau Ceti f790474 has no exponential map or normal neighbourhood. A search of the whole tree for `expDomain|expMap|totally normal|uniformly normal|normal ball|normalBall|normal neighbo|geodesic flow` finds one docstring only (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:141`). In Mathlib 082e2d3, "geodesic" occurs under `Mathlib/Geometry/` only in `Group/WordMetric.lean`, which is about word metrics.
- Inputs that exist:
  - `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` (`TauCeti/Geometry/Manifold/LocalDiffeomorph.lean:206`). Hypotheses: `[RCLike 𝕂]`, `[CompleteSpace E]`, `[IsManifold I n M]`, `[IsManifold J n N]`, `ContMDiffOn I J n f s`, `IsOpen s`, `x ∈ s`, `I.IsInteriorPoint x`, `1 ≤ n`, and `e : TangentSpace I x ≃L[𝕂] TangentSpace J (f x)` with `↑e = mfderiv I J f x`. It applies on `TM`, whose model `E × E` is finite-dimensional.
  - `TauCeti.Manifold.IsPiecewiseContMDiffOn I n γ a b` (`TauCeti/Geometry/Manifold/PiecewisePath.lean:65`): a strict finite partition with `ContMDiffOn` on each closed piece.
  - Mathlib `Manifold.pathELength` (`Mathlib/Geometry/Manifold/Riemannian/PathELength.lean:66`), defined as `∫⁻ t in Icc a b, ‖mfderiv% γ t 1‖ₑ`. It is defined for every `γ`, so a piecewise-`C¹` curve has a length, and it is additive by `pathELength_add` (:105).
- Sources:
  - Lee, *Introduction to Riemannian Manifolds*, 2nd ed., is not public. I follow the review's reading: the step occurs in Lemma 6.18 (pp. 167–169), and the neighbourhood results are Lemma 6.14 / Theorem 6.15 (pp. 163–166).
  - I read the author's public corrections list (sites.math.washington.edu/~lee/Books/RM/errata.pdf, dated July 25, 2026). Its entry for p. 165, proof of Theorem 6.15 (12/5/21), reads: "If a, b ∈ I₀ with a < b, then the definition of uniformly normal neighborhood implies that the image of γ|[a,b] is contained in a geodesic ball centered at γ(a). Proposition 5.24 shows that every geodesic segment lying in that ball and starting at γ(a) is part of a radial geodesic, and Proposition 6.11 shows that each radial geodesic segment is minimizing." The list also has a symbol correction on p. 164, line 8 from the bottom (8/13/21).
  - do Carmo is print only. The red team's locators (Ch. 3 Thm 3.7 on totally normal neighbourhoods, and Cor. 3.9, used in the proof of Ch. 7 Thm 2.8) are unauthenticated, as the review says.

**Note for the Tau Ceti maintainer.** Route A follows do Carmo's argument and Lee's corrected argument. Item 1 uses the joint exponential map, which the /2 note adds to Layer 1. Item 3 uses the endpoint comparison that the /5 note adds to Layer 1.

1. Layer 2: insert after the "Normal neighbourhoods and the local logarithm" bullet (after line 321):

> - **Uniformly normal neighbourhoods:** on the open domain in `TM` of the Layer-1 joint exponential map, define `E(q, w) = (q, exp_q w)` into `M × M`. Prove that `mfderiv E` at the zero vector of `T_p M` is a continuous linear equivalence, and apply `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` on `TM` there. Deduce that every `p` has a neighbourhood `W` and a radius `δ > 0` with the following property: for every `q ∈ W`, the tangent ball of radius `δ` about `0 : T_q M` (for the Riemannian fibre norm) lies in `expDomain q`, and `exp_q` restricts to a diffeomorphism from that ball onto an open set containing `W`. The radius is uniform in `q ∈ W`; the pointwise normal balls above do not supply this.

2. Layer 2: insert after the "escape estimate and local distance identity" bullet (after line 332):

> - **Minimizing curves are unbroken geodesics:** suppose `TauCeti.Manifold.IsPiecewiseContMDiffOn I 1 γ a b`, that `γ` is parametrized proportionally to arc length (`pathELength I γ a t = ENNReal.ofReal ((t - a) / (b - a)) * pathELength I γ a b` for `t ∈ Icc a b`), and that `pathELength I γ a b = edist (γ a) (γ b)`. Then `IsGeodesicCurveOn γ (Icc a b)`; in particular `γ` has no corner. Every subsegment of `γ` is again minimizing. Every `t ∈ Icc a b` has a relative neighbourhood `Icc t₁ t₂` whose image lies in a uniformly normal neighbourhood, and hence in the geodesic ball of radius `δ` about `γ t₁`. The equality case of ball-internal radial minimization then makes `γ` a radial geodesic on `Icc t₁ t₂`, and partition points are covered too.

3. Layer 3, "(a_p) ⇒ (f_p)" bullet: replace the sentence on lines 361–363, "Build it by minimizing distance on compact spheres in the finite-dimensional `T_p M`, using continuity of distance to `q`, and iterating the normal-ball radial extension step.", with:

> Build it by minimizing distance to `q` on a compact sphere of a normal ball in the finite-dimensional `T_p M`, using continuity of distance to `q`, and iterating the radial extension step along `s ↦ exp_p (s • v)`. Each step produces a broken curve from `p` to some `x`, of length `d(p, x)`. The Layer-2 theorem that minimizing curves are unbroken geodesics makes this curve a geodesic on its closed parameter interval. The Layer-1 comparison of endpoint-data geodesics with the maximal geodesic then identifies it with `s ↦ exp_p (s • v)`.

4. Ordering, line 445: replace "Layer 2 supplies the local minimizing theory." with "Layer 2 supplies the local minimizing theory, ending with uniformly normal neighbourhoods and the theorem that minimizing curves are unbroken geodesics, which Layer 3's `(a_p) ⇒ (f_p)` consumes."

Route B, the review's alternative: skip items 1–2 and change the first-variation bullet (lines 333–338) instead:
- state it for piecewise-`C¹` curves and proper piecewise variations;
- add the corollary "a minimizing piecewise-`C¹` curve parametrized proportionally to arc length is a geodesic";
- replace "it is not an input to the Hopf–Rinow implication graph below" with "its minimizing-curve corollary is an input to Layer 3's `(a_p) ⇒ (f_p)`".

Items 3–4 then cite that corollary in place of the Layer-2 theorem.

**Kept.** The review finds a closure omission, not a false statement. Keep:
- the `(f_p)` statement, including "Do not require this witness to extend to an all-time geodesic";
- the compact-sphere construction;
- Layer 2's pointwise normal neighbourhoods, `log_p`, and its ban on a global logarithm;
- the Gauss lemma, ball-internal minimization with both equality cases, and the escape estimate.

Under route A the first-variation milestone stays outside the Hopf–Rinow graph. No stage link is involved; the relation is inside HopfRinow.

## /2 (medium, missing): the geodesic flow on its open maximal domain (the fundamental theorem on flows) behind `expDomain`

**Checked.**
- README Layer 1, lines 264–266: "**Smooth dependence and the local geodesic flow:** prove `C^∞` dependence on time and initial data and package the resulting local flow on `TM`. This is a target, not a theorem available in the pinned ODE library."
- The exponential-map bullet (lines 285–288) needs more than a local flow: "Prove `0 ∈ expDomain p`, `exp_p 0 = p`, and `IsOpen (expDomain p)`. On the open subset of the geodesic-flow domain where time `1` is defined, prove that evaluation of the smooth flow at time `1`, restricted to initial states `(p,v)`, is `C^∞`". Openness of `{v | 1 ∈ J(p,v)}`, and smoothness of `exp_p` at vectors far from `0`, both need the maximal flow domain `{(t, z) | t ∈ J(z)}` to be open in `ℝ × TM` and the flow to be smooth on it. A flow near `t = 0` gives neither.
- "What is missing", line 119: "the geodesic spray, its smooth local flow, and maximal intervals of existence".
- Tau Ceti f790474:
  - `ODE.exists_contDiffAt_localFlow` (`TauCeti/Analysis/ODE/InitialCondition.lean:164`). Hypotheses: `[FiniteDimensional ℝ E]`, `v : E → E`, `ContDiffOn ℝ (n + 1) v s`, `s ∈ 𝓝 a`. It gives `Φ` with `ContDiffAt ℝ (n + 1) (fun p ↦ Φ p.1 p.2) (a, 0)`, `Φ x 0 = x`, the flow law, and the equation near `(a, 0)`. This is a model-space result with regularity at one point only.
  - `maximalIntegralCurveInterval` and `maximalIntegralCurve` (`TauCeti/Geometry/Manifold/IntegralCurve/Maximal.lean:104`, `:194`) fix one initial point `x`. Their results assume `[T2Space M] [IsManifold I 1 M] [BoundarylessManifold I M]` (:223) and a `C¹` field, and say nothing about dependence on `x`.
  - `exists_mem_nhds_forall_exists_isMIntegralCurveOn_Ioo` (`IntegralCurve/Extension.lean:67`) gives a uniform existence time near a point.
  - `TauCeti.Manifold.geodesicInterval` (`Riemannian/Geodesic/Maximal.lean:127`) is open in `t` only for fixed `(p, v)` (`isOpen_geodesicInterval`, :191).
- Mathlib 082e2d3:
  - `IsPicardLindelof.exists_forall_mem_closedBall_eq_hasDerivWithinAt_continuousOn` (`Mathlib/Analysis/ODE/ExistUnique.lean:113`) is a continuous local flow on `closedBall x₀ r ×ˢ Icc tmin tmax`.
  - `ContDiffAt.exists_eventually_eq_hasDerivAt` (:167) assumes `ContDiffAt ℝ 1 f x₀` and gives a local flow with no regularity in the initial point.
  - Both of these are normed-space results.
  - `Flow` (`Mathlib/Dynamics/Flow.lean:85`) is a global continuous action.
  - `grep -w flow` under `Mathlib/Geometry/Manifold` finds nothing.
- Source: Lee, *Introduction to Smooth Manifolds*, 2nd ed., Theorem 9.12, pp. 212–215. I follow the review's reading because the book is not public; Tau Ceti's `IntegralCurve/Maximal.lean` cites the same theorem (line 77).
- Consumers:
  - The accepted LieGroups link map (`data/links/tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.json`, overlap 0, `rescope`) says: "Extract local existence, uniqueness and smooth parameter dependence for arbitrary smooth finite-dimensional vector fields there … The Frobenius prefix needs the arbitrary-vector-field version and must not wait for Ado or Lie III. … any missing general flow theorem beyond that scope belongs in HopfRinow, Part II".
  - No roadmap "HopfRinow, Part II" exists among the `roadmaps` of `data/atlas.json`.
- Lines 264–267 also carry the stale absence sentence of /7. The /7 review keeps manifold smooth dependence as a target, and the text below says so; apply it in place of any separate /7 edit to those lines.

**Note for the Tau Ceti maintainer.**

1. Layer 1: delete the "Smooth dependence and the local geodesic flow" bullet (lines 264–267). Insert the following immediately before the "Exponential-map basic API" bullet (line 284), after the maximal-interval and finite-endpoint bullets it uses:

> - **The geodesic flow on its maximal domain (fundamental theorem on flows):** for `z : TM`, let `J(z)` be the maximal interval of the integral curve of `S` through `z`, and `θ(t, z)` the value of that curve at `t`. Let `𝒟 = {(t, z) : ℝ × TM | t ∈ J(z)}`. Prove:
>   - `𝒟` is open in `ℝ × TM` and contains `{0} × TM`;
>   - `θ` is `C^∞` on `𝒟`;
>   - the flow law: if `(t, z) ∈ 𝒟`, then `J(θ(t, z)) = {s | s + t ∈ J(z)}` and `θ(s, θ(t, z)) = θ(s + t, z)` for every such `s`;
>   - for each `t`, the set `TM_t = {z | (t, z) ∈ 𝒟}` is open, and `θ(t, ·)` is a diffeomorphism from `TM_t` onto `TM_{-t}` with inverse `θ(-t, ·)`.
>
>   Only one fact about `S` is used: it is a `C^∞` vector field on the finite-dimensional, boundaryless, Hausdorff manifold `TM`. State the theorem for an arbitrary `C^k` vector field (`1 ≤ k ≤ ∞`, with a `C^k` flow) on such a manifold, then specialize it to `S`. For the proof:
>   - upgrade the model-space `ODE.exists_contDiffAt_localFlow`, which is `C^(n+1)` only at `(a, 0)`, to a neighbourhood, working in charts;
>   - combine it with the uniform existence time and `maximalIntegralCurve`;
>   - propagate the regularity along the flow law (Lee, *Introduction to Smooth Manifolds*, Thm 9.12).
>
>   Manifold smooth dependence is a target, not a pinned-library theorem. Use mathlib4#26394 and mathlib4#40062 as design references, and adopt their APIs whenever the working Mathlib dependency supplies them.

2. Same layer, "Exponential-map basic API" bullet: replace the sentence on lines 286–288, "On the open subset of the geodesic-flow domain where time `1` is defined, prove that evaluation of the smooth flow at time `1`, restricted to initial states `(p,v)`, is `C^∞`; identify its base projection with `exp_p`.", with:

> Define the joint exponential map `exp z = π (θ(1, z))` on the open set `TM_1 = {z : TM | 1 ∈ J(z)}` of the preceding milestone, and prove it `C^∞` there. Identify `expDomain p` with the preimage of `TM_1` under `TotalSpace.mk' E p`, which gives `IsOpen (expDomain p)`, and identify `exp_p` with the restriction of `exp` to that fibre.

3. "What is missing", line 119: replace "the geodesic spray, its smooth local flow, and maximal intervals of existence" with "the geodesic spray, maximal intervals of existence, and its smooth flow on the open maximal flow domain in `ℝ × TM`".

4. Ordering, lines 441–443: replace "The spray then feeds local existence, smooth dependence, constant speed, maximal intervals, and the finite-endpoint extension criterion. Next build the open-domain, smooth exponential-map basic API;" with "The spray then feeds local existence, constant speed, maximal intervals, the finite-endpoint extension criterion, and the geodesic flow on its open maximal domain. Next build the joint and fibrewise exponential-map basic API on that domain;".

If upstream keeps Layer 1 specific to the spray, drop the sentence "State the theorem for an arbitrary `C^k` vector field … then specialize it to `S`." from item 1. The general theorem then stays a request, from the accepted LieGroups overlap to the shared manifold owner. "HopfRinow, Part II" is not an atlas roadmap and must not be cited as if it existed.

Link entries for the link workflow. Record these only after upstream's Layer 1 carries the general statement. Until then, the accepted LieGroups overlap 0 records the relation as a rescope, and no edge is added.
- `tauceti:TauCetiRoadmap/HopfRinow#layer-1-the-geodesic-equation-the-flow-and-the-exponential-map` → `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-4-frobenius-lies-third-theorem-and-the-equivalence-of-categories`.
  - Reason: "Frobenius integrability is proved from flows of arbitrary smooth vector fields; HopfRinow Layer 1 supplies the fundamental theorem on flows for arbitrary `C^k` fields on finite-dimensional boundaryless Hausdorff manifolds. LieGroups keeps completeness of left-invariant fields." Confidence `inferred`.
  - Evidence (HopfRinow): the adopted bullet's first sentence, quoted with its line numbers at that revision.
  - Evidence (LieGroups): `content/tau-ceti/RepresentationTheory/LieGroups/README.md` lines 325–327, "State the Frobenius theorem (`VectorField.mlieBracket`-involutive ⇒ integrable) as the named analytic prerequisite."
- The existing reviewed link `…HopfRinow#layer-1-…` → `…LieGroups#layer-0-the-exponential-map-and-one-parameter-subgroups` (link 3, the inverse function theorem): extend its reason with "and the flow theorem gives smoothness of `lieExp`, the time-one flow of left-invariant fields". Add as evidence LieGroups lines 237–240: "`lieExp X = γ_X 1` where `γ_X : ℝ → G` is the integral curve through `1` of the left-invariant vector field `X` … Its basic theory: `lieExp 0 = 1`, `lieExp` is **smooth**".
- Lower-confidence candidate: `…HopfRinow#layer-1-…` → `tauceti:TauCetiRoadmap/HeegaardFloer#lane-m-morse-homology-stage-0`, confidence `inferred`.
  - Evidence: `content/tau-ceti/HeegaardFloer/README.md` lines 146–150, "stable/unstable manifolds (the stable-manifold theorem is itself new to Mathlib) … broken-trajectory compactness", and lines 123–124, "Morse theory, gradient flows, stable manifolds".
  - Lane M names no supplier. Record this link only if the link reviewer accepts the gradient-flow reading.

**Kept.** Layer 1 already asks for openness and smoothness of `expDomain`, so what is missing is the bridge from the local flow to the maximal flow, not a false claim.
- Keep the fibrewise conclusions of lines 284–296:
  - `0 ∈ expDomain p`, `exp_p 0 = p` and `IsOpen (expDomain p)`;
  - `C^∞` of `exp_p` on `expDomain p`, with its `ContinuousOn`, `ContMDiffAt` and `ContinuousAt` forms;
  - `t ∈ J(p,v) ↔ t • v ∈ expDomain p`, star-shapedness, and the junk-value rule.
- Keep the ownership split. HopfRinow owns the spray and geodesic and metric completeness. LieGroups owns the one-parameter-subgroup law and the completeness of left-invariant fields. Neither completeness theorem is a prerequisite of the other.
- Do not re-plan HopfRinow, and do not treat a Part II as present.

## /3 (medium, missing): two-parameter covariant derivatives and the symmetry lemma before the Gauss lemma

**Checked.**
- README Layer 2, lines 322–323: "**The Gauss lemma:** prove the radial/tangential orthogonality identity for `mfderiv exp_p` and its polar length inequality on a normal ball." It names no prerequisite.
- Lines 334–338: "Build covariant differentiation in both variation directions, prove the integration-by-parts step and the first-variation formula … it is not an input to the Hopf–Rinow implication graph below."
- Layer 1 (lines 237–242) plans differentiation along a curve only. "symmetr" does not occur anywhere in the README.
- Tau Ceti f790474 has one-parameter tools only:
  - `CovariantDerivative.alongCurveWithin` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Basic.lean:127`): the moving-chart derivative of a section `V` along `γ : 𝕜 → M` within `s`.
  - `CovariantDerivative.alongCurveWithin_pullback` (`AlongCurve/Pullback.lean:283`): agreement with `cov X (γ t) w` for pulled-back fields, assuming `UniqueDiffWithinAt 𝕜 s t`, `HasMFDerivAt[s] γ t …` and `MDiffAt (T% X) (γ t)`.
  - `CovariantDerivative.IsMetricCompatible.hasDerivWithinAt_inner_alongCurveWithin` (`AlongCurve/Metric.lean:349`): the product rule.
  - `TauCeti.Manifold.curveVelocity` (`TauCeti/Geometry/Manifold/MFDeriv/Curve.lean:116`).
- No symmetry lemma exists. Searching `CovariantDerivative/` and `Riemannian/` for "symmetr", "surface", "two-parameter" and "variation" finds only a product-rule remark (`AlongCurve/Metric.lean:109`) and the Koszul-formula symmetries (`LeviCivita/Basic.lean:157, 167`). No lemma states that `TauCeti.Manifold.christoffelMap` (`LocalFrame.lean:306`) is symmetric. `contMDiff_prod_modelWithCornersSelf_iff` (`TauCeti/Geometry/Manifold/ContMDiff/Prod.lean:45`) only changes the product-model presentation, as the review says.
- Mathlib 082e2d3:
  - `CovariantDerivative.torsion_eq_zero_iff` (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Torsion.lean:143`): `cov.torsion = 0 ↔ ∀ {X Y x}, MDiffAt (T% X) x → MDiffAt (T% Y) x → cov Y x (X x) - cov X x (Y x) = mlieBracket I X Y x`.
  - `IsLeviCivitaConnection` has the field `torsion : cov.torsion = 0` (`LeviCivita.lean:201`), and `isLeviCivitaConnection_leviCivitaConnection` is at :408.
  - `ContDiffAt.isSymmSndFDerivAt` (`Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean:534`), with hypothesis `minSmoothness 𝕜 2 ≤ n`.
- Sources: Lee's *Introduction to Riemannian Manifolds* is not public. I follow the review: Lemma 6.2 (pp. 153–154) is the torsion-free symmetry lemma, and the proof of Theorem 6.9 (pp. 159–160) uses it for the Gauss lemma. do Carmo Ch. 3, Lemma 3.4 → Lemma 3.5, are the red team's locators and are unauthenticated.

**Note for the Tau Ceti maintainer.**

1. Layer 1: insert after the "Covariant derivative along a curve" bullet (after line 242):

> - **Two-parameter maps and the symmetry lemma:** let `f : ℝ × ℝ → M` be `C²` on an open set `U`. Take the velocity fields `∂_t f` and `∂_s f` of the coordinate curves `t ↦ f (t, s)` and `s ↦ f (t, s)` (`curveVelocity`). Define the covariant derivatives `D_t` and `D_s` of a vector field along `f` by applying the along-curve derivative of the preceding milestone to the corresponding coordinate curve. Prove the **symmetry lemma** `D_s ∂_t f = D_t ∂_s f` on `U` for a torsion-free connection, in particular for the Levi-Civita connection. In a chart it reduces to two facts: symmetry of second derivatives (`ContDiffAt.isSymmSndFDerivAt`), and symmetry `Γ_x(v, w) = Γ_x(w, v)` of the Christoffel map, which follows from `CovariantDerivative.torsion_eq_zero_iff` applied to the chart's coordinate vector fields. Record the metric product rule in each coordinate direction from `IsMetricCompatible.hasDerivWithinAt_inner_alongCurveWithin`. The Layer-2 Gauss lemma and the first-variation formula share this calculus.

2. Layer 2: replace the Gauss-lemma bullet (lines 322–323) with:

> - **The Gauss lemma:** apply the Layer-1 symmetry lemma to `f(t, s) = exp_p (t • (v + s • w))`, on the open set of `(t, s)` where `t • (v + s • w) ∈ expDomain p`. Prove the radial/tangential orthogonality identity for `mfderiv exp_p` and its polar length inequality on a normal ball.

3. Layer 2, first-variation bullet, lines 334–335: replace "Build covariant differentiation in both variation directions, prove the integration-by-parts step" with "Using the Layer-1 two-parameter covariant derivatives and symmetry lemma, prove the integration-by-parts step".

4. "What is missing", lines 117–118: replace "the pullback connection and covariant differentiation along a curve;" with "the pullback connection, covariant differentiation along a curve and along two-parameter maps, and the symmetry lemma;".

**Kept.**
- The first-variation theorem stays outside the Hopf–Rinow graph: the sentence "it is not an input to the Hopf–Rinow implication graph below" stays on line 338. Only its shared preliminary calculus moves to Layer 1.
- The Gauss lemma's two conclusions are unchanged.
- The existing along-curve API (`alongCurveWithin`, its pullback agreement and its product rule) is reused, not duplicated.

## /4 (medium, missing): `T2Space (TangentBundle I M)` from the standing `[T2Space M]`

**Checked.**
- README standing hypotheses, lines 51–52: "Require `[T2Space M]` explicitly in topological statements".
- Layer 1, lines 261–263: "**Local existence and uniqueness** of the geodesic from `(p, v)` on an open interval containing `0`: apply Mathlib's manifold integral-curve API to `S` and prove uniqueness on the overlap of two such intervals."
- Mathlib 082e2d3, `Mathlib/Geometry/Manifold/IntegralCurve/ExistUnique.lean:183`: `variable [T2Space M] {a b : ℝ}` governs `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff` (:189), `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless` (:227), `isMIntegralCurve_eq_of_contMDiff` (:239) and `isMIntegralCurve_Ioo_eq_of_contMDiff_boundaryless` (:253). For the spray, the carrier `M` is `TM`.
- Tau Ceti f790474:
  - `TauCeti.Manifold.IsGeodesicCurveOnFrom.eqOn_of_inter` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Maximal.lean:149–150`) assumes `[T2Space (TangentBundle I M)]` and applies `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff` to velocity lifts. The file's standing variables (:58–60) contain no `T2Space` at all.
  - The maximal-integral-curve results (`TauCeti/Geometry/Manifold/IntegralCurve/Maximal.lean:223`, `[T2Space M] [IsManifold I 1 M] [BoundarylessManifold I M]`) need the same instance when they are applied on `TM`.
- Neither library has a separation instance for a total space. I searched both trees for `T2Space` within two lines of `TotalSpace` or `TangentBundle`; the only hit is the hypothesis above.
  - The only bundle lemma is fibrewise: `FiberBundle.t2Space [T2Space F] (b : B) : T2Space (E b)` (`Mathlib/Topology/FiberBundle/Basic.lean:288`).
  - The instance `TangentSpace.fiberBundle : FiberBundle E (TangentSpace I : M → Type _)` is at `Mathlib/Geometry/Manifold/VectorBundle/Tangent.lean:185`.
- Source: Lee, *Introduction to Smooth Manifolds*, 2nd ed., Prop. 3.18, pp. 66–67, gives the argument that separates points in the same fibre and in different fibres. I follow the review's reading; the book is not public.

**Note for the Tau Ceti maintainer.**

1. Layer 1: insert before the "Local existence and uniqueness" bullet (after line 260):

> - **The tangent bundle is Hausdorff:** in Mathlib-ready generality, prove that for `[FiberBundle F E]` with `[T2Space B]` and `[T2Space F]`, the total space `Bundle.TotalSpace F E` is `T2Space`. Separate points in different fibres by the preimages under `Bundle.TotalSpace.proj` of disjoint open sets of `B`. Separate points in one fibre inside the local trivialization at their base point. Specialize the result to an instance `T2Space (TangentBundle I M)` from `[T2Space M]`. Uniqueness for the spray, and every downstream geodesic statement, then use only the standing `[T2Space M]`; no statement carries `[T2Space (TangentBundle I M)]` as a hypothesis. (Mathlib's `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff` requires `T2Space` of its carrier `TM`.)

2. Same layer, lines 262–263: replace "apply Mathlib's manifold integral-curve API to `S` and prove uniqueness on the overlap of two such intervals." with "apply Mathlib's manifold integral-curve API to `S` and prove uniqueness on the overlap of two such intervals under the standing `[T2Space M]`, through the preceding instance."

In the library, `IsGeodesicCurveOnFrom.eqOn_of_inter` can then assume `[T2Space M]` instead.

**Kept.** The review calls this a missing Lean interface, not a missing mathematical assumption, so the standing hypotheses (lines 51–55) are unchanged. Keep:
- `[T2Space M]` stated explicitly in topological statements;
- uniqueness proved through the spray and its integral curves;
- the fibrewise `FiberBundle.t2Space`.

## /5 (medium, missing): geodesics on `Icc 0 b` or `Ico 0 b` with data at the endpoint are restrictions of the maximal geodesic

**Checked.**
- README Layer 1, lines 261–263, plans uniqueness only "on an open interval containing `0`" and "on the overlap of two such intervals". Yet lines 243–244 say that "the domains used below are nondegenerate closed intervals, open intervals, or `univ`".
- Layer 3, lines 358–360: the `(f_p)` witness is a geodesic on a closed interval: "`IsGeodesicCurveOn γ (Icc 0 1)`, `γ 0 = p`, `γ 1 = q`, and `pathELength I γ 0 1 = edist p q`".
- Lines 364–365: "the minimizing initial velocities give the set equality `closedBall p r = exp_p '' closedBall 0 r`". To read off `q = exp_p v` from a witness with initial velocity `v`, one must compare it, from the endpoint `0`, with the maximal geodesic of `(p, v)`. Route A of /1 needs the same comparison.
- Tau Ceti f790474:
  - `TauCeti.Manifold.IsGeodesicCurveOnFrom` (`Riemannian/Geodesic/Basic.lean:142`) takes the initial velocity to be `curveVelocityWithin I γ s 0`, which is one-sided when `s = Icc 0 b`.
  - `IsGeodesicCurveOn` requires `UniqueDiffOn ℝ s` (:106), which forces `b > 0` for a witness on `Icc 0 b`.
  - `isMIntegralCurveOn_curveVelocityLiftWithin_iff` (`Geodesic/Spray.lean:270`; `UniqueDiffOn ℝ s`, `ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ s`) makes the velocity lift of such a witness an integral curve of the spray on `Icc 0 b`, in Mathlib's within sense (`IsMIntegralCurveOn` uses `HasMFDerivAt[s]`, `Mathlib/Geometry/Manifold/IntegralCurve/Basic.lean:66`).
  - Uniqueness exists only on open intervals: `IsGeodesicCurveOnFrom.eqOn_of_inter` (`Geodesic/Maximal.lean:149`, both witnesses on `Ioo`) and `IsMIntegralCurveOn.eqOn_maximalIntegralCurve` (`IntegralCurve/Maximal.lean:228`, on `Ioo a b`).
  - `IsGeodesicCurveOnFrom.mono` (`Geodesic/Reparametrization.lean:136`) only restricts to smaller sets.
  - `Icc`, `Ico`, `Ioc` and `Ici` never occur in Tau Ceti's `IntegralCurve/` or `Riemannian/Geodesic/`, nor in Mathlib's `Geometry/Manifold/IntegralCurve/`.
- Mathlib 082e2d3:
  - Manifold uniqueness exists only on `Ioo` or globally (`IntegralCurve/ExistUnique.lean:189, 227, 239, 253`).
  - `ODE_solution_unique_of_mem_Icc_right` (`Mathlib/Analysis/ODE/ExistUnique.lean:193`) is a model-space theorem. Its hypotheses are `∀ t ∈ Ico a b, LipschitzOnWith K (v t) (s t)`, `ContinuousOn f (Icc a b)`, `∀ t ∈ Ico a b, HasDerivWithinAt f (v t (f t)) (Ici t) t`, `∀ t ∈ Ico a b, f t ∈ s t`, the same three for `g`, and `f a = g a`. Its conclusion is `EqOn f g (Icc a b)`.

**Note for the Tau Ceti maintainer.**

1. Layer 1: insert after the "Finite-endpoint extension criterion" bullet (after line 283). If the /2 flow bullet is also adopted, it comes after this one, just before line 284.

> - **Geodesics with initial data at an endpoint:** let `0 < b`, and suppose the initial-data predicate holds for `γ` on `s` with data `(p, v)` (Tau Ceti's `IsGeodesicCurveOnFrom`).
>   - If `s = Icc 0 b`, then `Icc 0 b ⊆ J(p,v)` and `γ` agrees with `γ_{p,v}` on `Icc 0 b`.
>   - If `s = Ico 0 b`, then `Ico 0 b ⊆ J(p,v)` and `γ` agrees with `γ_{p,v}` there. Make no claim that `b ∈ J(p,v)`.
>   - State the mirror versions for `Icc a 0` and `Ioc a 0` with `a < 0`.
>
>   The initial velocity is the one-sided within-derivative at `0` carried by the predicate. Prove the result through the spray. The velocity lift of `γ` is an integral curve of `S` on `s` in the within sense. Glue it at `0`, and at `b` for `Icc`, to local integral curves through its endpoint states; one-sided derivatives that agree give a two-sided derivative. This gives an integral curve on an open interval around `0` containing `s`. Compare it with the maximal integral curve by the open-interval uniqueness above. Alternatively, prove uniqueness on `Icc` chartwise from `ODE_solution_unique_of_mem_Icc_right`, discharging its continuity, one-sided-derivative and Lipschitz hypotheses in the chart at the current point.

2. Layer 3, "(a_p) and (f_p) ⇒ (b)" bullet: insert after "where the ball on the right lies in `T_p M`." (line 365):

> For `⊆`, take an `(f_p)` witness `γ` for `q` and let `v` be its initial velocity. The Layer-1 endpoint comparison gives `1 ∈ J(p,v)` and `q = γ 1 = exp_p v`, and constant speed gives `‖v‖ = pathELength I γ 0 1 = dist p q ≤ r`.

This insertion does not touch lines 366–369, which /9 rewrites. Route A of /1 (its item 3) also cites this comparison.

Alternative, from the review: keep `(f_p)` in the stronger form that the construction produces, and read the closed-interval witness off it.
- In the "(a_p) ⇒ (f_p)" bullet, insert after "Do not require this witness to extend to an all-time geodesic." (line 361): "Record also the stronger form produced by the construction, `∃ v : T_p M, ‖v‖ = dist p q ∧ exp_p v = q`, with witness `γ t = exp_p (t • v)`."
- In item 2, derive `⊆` from this form instead.

The Layer-1 bullet is then still wanted as geodesic API, but Layer 3 no longer depends on it.

**Kept.** The review asks for these points to be kept:
- the within-velocity convention of the initial-data predicate, and the explicit `b > 0`;
- no existence at `b` for `Ico 0 b`;
- the closed-interval `(f_p)` statement, and its "Do not require this witness to extend to an all-time geodesic";
- the open-interval uniqueness milestone as it stands.

`ODE_solution_unique_of_mem_Icc_right` is a model-space ingredient with its own hypotheses, not a drop-in manifold theorem.

## /6 (medium, library-claim): the Levi-Civita shim and the "absent `Metric.lean`" claims are stale

**Checked.**

README `content/tau-ceti/HopfRinow/README.md`, line numbers as on `main`. The atlas mirrors the same text in the stage `tauceti:TauCetiRoadmap/HopfRinow#layer-1-the-geodesic-equation-the-flow-and-the-exponential-map`.
- **Lines 7–12 (summary).** "The pinned revision predates Mathlib's `CovariantDerivative.IsMetricCompatible`; whenever the working Mathlib revision contains it, consume that predicate rather than maintaining a local duplicate. The owned Riemannian connection-and-geodesic work is existence and uniqueness and `C^∞` regularity of the Levi-Civita connection, …"
- **Lines 17–18.** "this roadmap owns the Levi-Civita connection and its regularity".
- **Lines 85–90 (What Mathlib already has).** "**Metric compatibility in newer Mathlib revisions.** … That file is absent from the pinned revision; use the Mathlib predicate whenever the working dependency contains it rather than defining a lasting duplicate here."
- **Line 117 (What is missing).** "Existence, uniqueness, and `C^∞` regularity of the Levi-Civita connection;".
- **Lines 220–227 (Layer 1).** "At the pinned revision, define only the matching local shim needed to state metric compatibility, and remove that shim when the Mathlib declaration becomes available. Prove existence and uniqueness of the torsion-free, metric-compatible connection, reusing `CovariantDerivative.torsion_eq_zero_iff`. mathlib4#36845 is the design reference: adopt its implementation when available, and otherwise implement the same milestone in Tau Ceti's shared manifold connection namespace. …"
- **Lines 233–235 (regularity).** "This roadmap owns that proof in Tau Ceti; adopt an equivalent Mathlib regularity API whenever the working dependency supplies one, but do not treat mathlib4#36845 alone as supplying it."
- **Lines 439–440 (Ordering).** "In Layer 1, construct the Levi-Civita connection, prove its `C^∞` regularity …".

Mathlib 082e2d3 is the revision pinned by Tau Ceti f790474's `lake-manifest.json`. All files below are in `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/`:
- **`Metric.lean:155`.** `IsMetricCompatible [FiniteDimensional ℝ F] : Prop := derivMetricTensor cov = 0`. It assumes `[IsContMDiffRiemannianBundle I 1 F V]` (:96) and `[ContMDiffVectorBundle 1 F V I]` (:151). `isMetricCompatible_iff` (:170) is the form `X⟪σ, τ⟫ = ⟪∇_X σ, τ⟫ + ⟪σ, ∇_X τ⟫` on fields differentiable at the point.
- **`LeviCivita.lean`.** Assumptions: `[IsManifold I 2 M]`, `[RiemannianBundle …]` and `[IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)]` (:152–172), plus `[FiniteDimensional ℝ E]` (:205).
  - `IsLeviCivitaConnection` (:201) has the fields `isMetricCompatible` and `torsion : cov.torsion = 0`.
  - `IsLeviCivitaConnection.uniqueness` (:255) proves `cov Y x X₀ = cov' Y x X₀` under `hY : MDiffAt (T% Y) x`.
  - The connection `leviCivitaConnection` (:359), with `isMetricCompatible_leviCivitaConnection` (:383) and `torsion_leviCivitaConnection_eq_zero` (:396). The torsion lemma is proved through `torsion_eq_zero_iff` (`Torsion.lean:143`).
  - `isLeviCivitaConnection_leviCivitaConnection` (:408).
  - The module docstring (:22) says: "Future PRs will prove smoothness".

Tau Ceti f790474:
- No local `IsMetricCompatible`, shim, or Levi-Civita definition: a search of `TauCeti/` for such definitions found none.
- `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Basic.lean` imports Mathlib's file and adds two results:
  - `CovariantDerivative.isLeviCivitaConnection_iff` (:363), the Koszul characterisation;
  - `CovariantDerivative.IsLeviCivitaConnection.difference_eq_zero` (:391), `cov.difference cov' = 0`.
- `LeviCivita/Regularity.lean`:
  - The instance `CovariantDerivative.instContMDiffCovariantDerivativeLeviCivitaConnection` (:292), under `[IsManifold I ∞ M]` and `[IsContMDiffRiemannianBundle I ∞ E …]`.
  - `contMDiffOn_christoffelSymbol_leviCivitaConnection` (:256) and `contMDiffOn_christoffelMap_leviCivitaConnection` (:273). Both give `C^n` on `e.baseSet` for every `e` with `[MemTrivializationAtlas e]`. They need `n + 2 ≤ m` and `n + 1 ≤ k`, for a `C^m` manifold (`[IsManifold I m M]`) with a `C^k` metric.
  - The Christoffel map takes values in `E →L[ℝ] E →L[ℝ] E`.
  - For `trivializationAt`, the base set is the chart source (`TangentBundle.trivializationAt_baseSet`, Mathlib `Geometry/Manifold/VectorBundle/Tangent.lean:223`).

**Not checked.** The PR provenance in lines 85–88 and 132–137 (mathlib4#36299, mathlib4#36845): this job does not run git. The review cites no source pages for this finding.

**Note for the Tau Ceti maintainer.** The pinned Mathlib already has metric compatibility and Levi-Civita existence and uniqueness, and Tau Ceti has the regularity. Seven edits follow.

1. **Lines 7–12**, from "Mathlib also has general covariant derivatives" to "and geodesic completeness.", become:
   ```
   Mathlib also has general covariant derivatives and their torsion, metric compatibility
   (`CovariantDerivative.IsMetricCompatible`), and the Levi-Civita connection
   (`CovariantDerivative.leviCivitaConnection`) with its existence and uniqueness; consume them
   rather than maintaining local duplicates. The owned Riemannian connection-and-geodesic work is
   `C^∞` regularity of the Levi-Civita connection, covariant differentiation along curves, geodesics
   and their flow, the exponential map, and geodesic completeness.
   ```
   The sentence "Without that layer, …" (lines 12–13) stays.
2. **Lines 17–18.** "this roadmap owns the Levi-Civita connection and its regularity," becomes "this roadmap owns the regularity of Mathlib's Levi-Civita connection,".
3. **Lines 85–90.** The bullet becomes:
   ```
   - **Metric compatibility and the Levi-Civita connection.** `CovariantDerivative.IsMetricCompatible`
     (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Metric.lean`, from
     [mathlib4#36299](https://github.com/leanprover-community/mathlib4/pull/36299)), and in
     `.../CovariantDerivative/LeviCivita.lean` the predicate `CovariantDerivative.IsLeviCivitaConnection`
     (metric-compatible and torsion-free), the connection `CovariantDerivative.leviCivitaConnection`
     with `CovariantDerivative.isLeviCivitaConnection_leviCivitaConnection`, and
     `CovariantDerivative.IsLeviCivitaConnection.uniqueness`. They assume `[FiniteDimensional ℝ E]`,
     `[IsManifold I 2 M]`, and `[IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)]`,
     which the standing hypotheses supply. Uniqueness holds on vector fields differentiable at the
     point, because a `CovariantDerivative` is unconstrained on non-differentiable fields. Mathlib
     leaves smoothness of the connection to future work; see Layer 1.
   ```
4. **Line 117.** "Existence, uniqueness, and `C^∞` regularity of the Levi-Civita connection;" becomes "`C^∞` regularity of Mathlib's Levi-Civita connection;".
5. **Lines 220–227.** The bullet becomes:
   ```
   - **The Levi-Civita connection (consume):** use Mathlib's `CovariantDerivative.IsMetricCompatible`,
     `CovariantDerivative.IsLeviCivitaConnection`, `CovariantDerivative.leviCivitaConnection`,
     `CovariantDerivative.isLeviCivitaConnection_leviCivitaConnection`, and
     `CovariantDerivative.IsLeviCivitaConnection.uniqueness`; do not define a local
     metric-compatibility shim or a second construction. State uniqueness as Mathlib does, for a
     vector field `Y` with `MDiffAt (T% Y) x`; Tau Ceti's
     `CovariantDerivative.IsLeviCivitaConnection.difference_eq_zero` restates it as the vanishing of
     `CovariantDerivative.difference`. This roadmap owns delivery of the connection API with the
     regularity below; the Geometric Topology roadmap consumes it.
   ```
6. **Lines 233–235.** "This roadmap owns that proof in Tau Ceti; … do not treat mathlib4#36845 alone as supplying it." becomes:
   ```
   Mathlib's `LeviCivita.lean` leaves smoothness to future work. Tau Ceti already contains this
   milestone in `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Regularity.lean`:
   the instance `CovariantDerivative.instContMDiffCovariantDerivativeLeviCivitaConnection`, and
   `CovariantDerivative.contMDiffOn_christoffelMap_leviCivitaConnection` and
   `CovariantDerivative.contMDiffOn_christoffelSymbol_leviCivitaConnection`, which give `C^n` on the
   base set of every trivialization in the tangent-bundle atlas (the chart source, for
   `trivializationAt`) for a `C^m` manifold and `C^k` metric with `n + 2 ≤ m` and `n + 1 ≤ k`.
   Adopt an equivalent Mathlib regularity API, and retire the Tau Ceti one, when the working
   dependency supplies it.
   ```
   The sentence "This milestone precedes and supplies …" stays.
7. **Lines 439–440.** "construct the Levi-Civita connection, prove its `C^∞` regularity" becomes "take the Levi-Civita connection from Mathlib, prove its `C^∞` regularity".

**Kept.**
- **The differentiability qualification on uniqueness** is kept, in edits 3 and 5.
- **README text that stays.** The regularity specification (lines 228–233) is kept word for word, as is its place before the spray in the ordering. The prior-art bullet (lines 132–137) is also kept: it is still true of the pinned Mathlib, whose docstring defers smoothness.
- **No atlas edit.** The accepted coverage overlay already records these targets: see `data/library-coverage.json`, job AUDIT-17, Layer 1.
  - It lists metric compatibility and Levi-Civita existence and uniqueness as `mathlib`, and regularity as `tauceti`, citing the same seven declarations.
  - The raw stage `status` is not rewritten, and Layer 1 is not marked complete. The overlay verdict stays "partly built".
- **Consumer text stays accurate.** This covers GeometricTopology line 630 ("Layer 1, owns the intervening Levi-Civita connection") and OptimalTransport lines 903 and 1961. Layer 1 still delivers the connection API: Mathlib's construction with Tau Ceti's regularity.

## /7 (medium, library-claim): stale absence claims in Layer 1; the `C^k` sentence is narrowed, not deleted

**Checked.**

README, line numbers as on `main`:
- **Lines 100–101.** "The real gaps for this roadmap are `C^k` dependence on initial data and maximal intervals in the required form."
- **Lines 265–266 (smooth dependence).** "This is a target, not a theorem available in the pinned ODE library."
- **Lines 280–283 (extension criterion).** "This is a named target because the pinned integral-curve API has no maximal-solution extension theorem. Implement it in Tau Ceti, adopting mathlib4#26413's result whenever the working Mathlib dependency supplies the required form."
- **Lines 301–306 (manifold IFT).** "add the missing shared theorem to `TauCeti/Geometry/Manifold/LocalDiffeomorph.lean`: … Mathlib's `Geometry/Manifold/LocalDiffeomorph.lean` lists this implication as a TODO, so this roadmap owns it as a prerequisite rather than consuming it."

Tau Ceti f790474, read at the lines the red team cited:
- **`TauCeti/Geometry/Manifold/IntegralCurve/Extension.lean`** (root namespace). It assumes `[CompleteSpace E] [IsManifold I 1 M] [BoundarylessManifold I M] [T2Space M]` (:101).
  - `IsMIntegralCurveOn.exists_gt_isMIntegralCurveOn_Ioo` (:109) has three hypotheses:
    - `IsMIntegralCurveOn γ v (Ioo a b)` with `a < b`;
    - `CMDiff 1 (fun x ↦ (⟨x, v x⟩ : TangentBundle I M))`;
    - `MapClusterPt y (𝓝[<] b) γ`.

    It concludes that for some `c > b` there is a `δ`, integral on `Ioo a c`, with `EqOn δ γ (Ioo a b)`. No maximality is assumed.
  - Its sequential form `…_of_tendsto` (:135) assumes `u n → b`, eventually `u n < b`, and `γ ∘ u → y`.
  - The left-endpoint versions are `exists_lt_…` (:162) and `…_of_tendsto` (:185).
- **`IntegralCurve/Maximal.lean`.** It defines `maximalIntegralCurveInterval` (:104) and `maximalIntegralCurve` (:194), and proves `isMIntegralCurveOn_maximalIntegralCurve` (:248).
  - `not_mapClusterPt_nhdsLT_maximalIntegralCurve` (:264) and `…nhdsGT…` (:296) assume `[T2Space M] [IsManifold I 1 M] [BoundarylessManifold I M]` (:223) and `[CompleteSpace E]`. They also need a `C¹` field, `0` in the interval, and an `IsLUB` or `IsGLB` endpoint.
  - They conclude that the maximal curve has no cluster point in `M` at that endpoint.
- **`TauCeti/Geometry/Manifold/LocalDiffeomorph.lean:206`**, `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`. Its hypotheses:
  - `[RCLike 𝕂]`, `[CompleteSpace E]` for the source model, and `[IsManifold I n M] [IsManifold J n N]`;
  - `ContMDiffOn I J n f s` with `IsOpen s`, a point `x ∈ s` with `I.IsInteriorPoint x`, and `1 ≤ n`;
  - `e : TangentSpace I x ≃L[𝕂] TangentSpace J (f x)` with `↑e = mfderiv I J f x`.

  The conclusion is `IsLocalDiffeomorphAt I J n f x`. The global form `isLocalDiffeomorph_of_mfderiv_eq` (:351) assumes `[BoundarylessManifold I M]`. Mathlib's `Geometry/Manifold/LocalDiffeomorph.lean:43–46` still lists the implication as a TODO.
- **`TauCeti/Analysis/ODE/InitialCondition.lean:164`**, `ODE.exists_contDiffAt_localFlow`. Its hypotheses are `[FiniteDimensional ℝ E]`, `n : ℕ∞`, and `ContDiffOn ℝ (n + 1) v s` with `s ∈ 𝓝 a`. It gives a `Φ : E → ℝ → E` with:
  - `ContDiffAt ℝ (n + 1) (fun p ↦ Φ p.1 p.2) (a, 0)`;
  - `Φ x 0 = x` and the flow law;
  - the ODE only eventually near `(a, 0)`.

  This is a model-space result, and its smoothness holds only at `(a, 0)`. There is no flow on a manifold or on `TM`: a search of `TauCeti/` for flow declarations finds only this file, and Mathlib's `Geometry/Manifold/` has none. Mathlib's `Analysis/ODE/` has `ContDiffAt.exists_eventually_eq_hasDerivAt` (`ExistUnique.lean:167`), a `C¹` local flow with no smooth dependence on initial data, and no maximal-solution theorem.
- **The rest of the red team's list** resolves at the cited lines. No exponential map exists in either library.
  - `CovariantDerivative/AlongCurve/`: `Basic.lean` :106, :127, :175, :206, :273, :299, :334; `Pullback.lean` :283, :346; `Metric.lean` :349.
  - `Riemannian/Geodesic/`:
    - `Basic.lean` :106, :142, :181;
    - `Spray.lean` :107, :162, :270, :282;
    - `Smoothness.lean` :79;
    - `Maximal.lean` :109, :127, :149 (assumes `[T2Space (TangentBundle I M)]`), :191, :199, :215, :270 (assumes `a ≠ 0`);
    - `ConstantSpeed.lean` :97 (assumes `IsPreconnected s`).

The review cites no source pages for this finding.

**Note for the Tau Ceti maintainer.** The extension criterion and the manifold inverse-function theorem are now in Tau Ceti. Smooth dependence stays a target. Four edits follow.

1. **Lines 100–101.** "The real gaps for this roadmap are … in the required form." becomes:
   ```
   Mathlib has neither `C^k` dependence on initial data nor maximal solutions. Tau Ceti already
   contains maximal integral curves on manifolds with the finite-endpoint criterion
   (`TauCeti/Geometry/Manifold/IntegralCurve/`) and a model-space local flow that is `C^(n+1)` near
   time `0` (`ODE.exists_contDiffAt_localFlow`); the smooth flow on a manifold, in particular on `TM`,
   remains the gap.
   ```
2. **Lines 265–266.** "This is a target, not a theorem available in the pinned ODE library." becomes:
   ```
   This remains a target. Tau Ceti's `ODE.exists_contDiffAt_localFlow`
   (`TauCeti/Analysis/ODE/InitialCondition.lean`) is only the model-space input: for a field that is
   `C^(n+1)` near `a` in a finite-dimensional space, a flow that is `C^(n+1)` in `(x, t)` at `(a, 0)`.
   Neither library has a flow on a manifold or on `TM`.
   ```
3. **Lines 280–283**, from "This is a named target" to "the required form.", become:
   ```
   Mathlib's integral-curve API has no such theorem; Tau Ceti already contains it, for a `C¹` vector
   field on a Hausdorff boundaryless manifold modelled on a complete space:
   `IsMIntegralCurveOn.exists_gt_isMIntegralCurveOn_Ioo` and
   `IsMIntegralCurveOn.exists_lt_isMIntegralCurveOn_Ioo`, with their `_of_tendsto` sequential forms
   (`TauCeti/Geometry/Manifold/IntegralCurve/Extension.lean`), and, for the maximal curve
   `maximalIntegralCurve` on `maximalIntegralCurveInterval`,
   `not_mapClusterPt_nhdsLT_maximalIntegralCurve` and `not_mapClusterPt_nhdsGT_maximalIntegralCurve`
   (`.../IntegralCurve/Maximal.lean`). Apply them to the geodesic spray on `TM` rather than reproving
   them, and adopt mathlib4#26413's result whenever the working Mathlib dependency supplies the
   required form.
   ```
4. **Lines 301–306**, from "- **The manifold inverse-function theorem:**" to "rather than consuming it.", become:
   ```
   - **The manifold inverse-function theorem (consume):** Mathlib's
     `Geometry/Manifold/LocalDiffeomorph.lean` still lists this implication as a TODO; Tau Ceti
     supplies it as `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` in
     `TauCeti/Geometry/Manifold/LocalDiffeomorph.lean`. Over `[RCLike 𝕂]` with a complete source
     model space, a map with `ContMDiffOn I J n f s` on an open `s`, `1 ≤ n`, at `x ∈ s` with
     `I.IsInteriorPoint x`, whose `mfderiv I J f x` is a continuous linear equivalence, satisfies
     `IsLocalDiffeomorphAt I J n f x`; on a boundaryless source the interior-point hypothesis is
     automatic.
   ```
   The sentence "Apply it to the preceding derivative theorem to obtain that `exp_p` is a local diffeomorphism at `0`." (lines 306–307) stays: that application is still a target.

**Kept.**
- **The smooth-dependence sentence is narrowed, not deleted.** This is the review's correction: the model-space flow is only partial evidence for smooth dependence on a manifold or along geodesics.
- **Open, with the text unchanged:**
  - the chosen maximal geodesic `γ_{p,v}` and the homogeneity identity (lines 272–276). Tau Ceti has `J(p,v)` as `TauCeti.Manifold.geodesicInterval`, and the domain relation `mem_geodesicInterval_smul_iff` for `a ≠ 0`, but no chosen geodesic on that interval;
  - the open joint flow domain and the smooth flow on `TM` (lines 264–267);
  - `expDomain`, `exp_p` and its derivative at `0` (lines 284–300), and the IFT application (lines 306–307);
  - `(a_p) ↔ (d_p)` (lines 308–311).
- **The other Layer 1 bullets stay as written.** These are the along-curve derivative, `IsGeodesicCurveOn`, initial data, the spray, local existence and constant speed. They are specifications with no absence claim.
  - Their delivery is already recorded in the coverage overlay (`data/library-coverage.json`, AUDIT-17, Layer 1, verdict "partly built").
  - This note does not duplicate the overlay, and there is no atlas edit.
- **"What is missing (build here)" stays.** Lines 119–122 keep "maximal intervals of existence" and "the manifold inverse-function theorem" as this roadmap's owned scope, now delivered in Tau Ceti.

## /8 (low, library-claim): rejected

The review rejects this finding: the accepted coverage overlay already renders HopfRinow Layer 0 as complete and the Layer 4 metric API as built. No change is made.

## /9 (low, library-claim): Layer 3 asks to reprove a Mathlib norm bound and Mathlib's properness criterion

**Checked.**

README, line numbers as on `main`:
- **Lines 349–350, (c) ⇒ (d).** "Prove local uniform equivalence between the smooth Riemannian norm and the chart norm near `q`; in the resulting tangent-bundle trivialization the velocity coordinates are bounded."
- **Lines 352–354.** "Apply the Layer-1 finite-endpoint extension criterion to its limit in `TM`, and use uniqueness for the geodesic spray to identify the extension with the original curve. Prove the analogous argument at the left endpoint."
- **Lines 367–369, (a_p) and (f_p) ⇒ (b).** "A closed ball centered at an arbitrary `q` is a closed subset of a sufficiently large compact ball centered at `p`, by the triangle inequality. Hence every closed ball is compact and `ProperSpace M` follows."

Mathlib 082e2d3:
- **The two trivialization bounds.**
  - `Mathlib/Topology/VectorBundle/Riemannian.lean:223`, `eventually_norm_trivializationAt_lt (x : B) : ∃ C > 0, ∀ᶠ y in 𝓝 x, ‖(trivializationAt F E x).continuousLinearMapAt ℝ y‖ < C`.
  - `:328`, `eventually_norm_symmL_trivializationAt_lt`, the same bound for `(trivializationAt F E x).symmL ℝ y`.
  - Hypotheses: `[FiberBundle F E] [VectorBundle ℝ F E]`, inner-product fibres, and `[IsContinuousRiemannianBundle F E]` (:45–50, :88–89). No finite dimension is needed.
  - Together they give the two-sided local equivalence between the fibre norm and the model norm in the trivialization at `x`.
- **The chart-derivative bound.** `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:242`, `eventually_norm_mfderiv_extChartAt_lt`, gives the same bound for `mfderiv% (extChartAt I x) y`.
  - It assumes `[IsManifold I 1 M]` and `[IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]` (:214).
  - The file's note at lines 46–49 says Lean cannot infer the continuous instance from `IsContMDiffRiemannianBundle`. Tau Ceti's Layer 0 files carry it as an explicit hypothesis, for example `TauCeti/Geometry/Manifold/Riemannian/Distance.lean:94`.
- **The properness criterion.** `Mathlib/Topology/MetricSpace/ProperSpace.lean:84`, `ProperSpace.of_seq_closedBall {l : Filter β} [NeBot l] {x : α} {r : β → ℝ} (hr : Tendsto r l atTop) (hc : ∀ᶠ i in l, IsCompact (closedBall x (r i))) : ProperSpace α`, for `[PseudoMetricSpace α]`. Its proof is the triangle-inequality step, through `closedBall_subset_closedBall'`.

Tau Ceti f790474:
- `TauCeti/Geometry/Manifold/IntegralCurve/Maximal.lean:264` and `:296` have the hypotheses listed under /7. The docstring says: "This is the form in which metric completeness is turned into completeness of the field".
- `TauCeti.Manifold.contMDiff_geodesicSpray` (`Riemannian/Geodesic/Smoothness.lean:79`) supplies the spray's `C¹` hypothesis.

The coverage overlay for Layer 3 already says "The extension criterion and constant speed are available" and "Only the generic properness criteria exist". The review cites no source pages for this finding.

**Note for the Tau Ceti maintainer.** Replace the requests to rebuild these ingredients with citations. Three edits follow.

1. **Lines 349–350.** "Prove local uniform equivalence … the velocity coordinates are bounded." becomes:
   ```
   The local uniform equivalence between the Riemannian norm and the model norm of the
   tangent-bundle trivialization at `q` is Mathlib's, for any continuous Riemannian bundle: consume
   `eventually_norm_trivializationAt_lt` and `eventually_norm_symmL_trivializationAt_lt`
   (`Mathlib/Topology/VectorBundle/Riemannian.lean`) for `trivializationAt E (TangentSpace I) q`,
   and `eventually_norm_mfderiv_extChartAt_lt` for the chart derivative. They take
   `[IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]`, which Lean does not infer from
   the standing `IsContMDiffRiemannianBundle` instance; supply it as the Layer 0 distance files do.
   In that trivialization the velocity coordinates are bounded.
   ```
2. **Lines 352–354**, from "Apply the Layer-1" to "at the left endpoint.", become:
   ```
   Its limit in `TM` is a cluster point of the lifted curve at the endpoint, which the Layer-1
   finite-endpoint criterion excludes. Once the lifted maximal geodesic is identified with
   `maximalIntegralCurve (geodesicSpray I M) ⟨p, v⟩`, this is Tau Ceti's
   `not_mapClusterPt_nhdsLT_maximalIntegralCurve` on `TangentBundle I M` (with
   `[T2Space (TangentBundle I M)]`, as in `IsGeodesicCurveOnFrom.eqOn_of_inter`, and the `C¹` input
   `TauCeti.Manifold.contMDiff_geodesicSpray`), whose proof already contains the uniqueness step;
   otherwise apply `IsMIntegralCurveOn.exists_gt_isMIntegralCurveOn_Ioo_of_tendsto` and use
   uniqueness for the geodesic spray to identify the extension with the original curve. Prove the
   analogous argument at the left endpoint (`not_mapClusterPt_nhdsGT_maximalIntegralCurve`,
   `IsMIntegralCurveOn.exists_lt_isMIntegralCurveOn_Ioo_of_tendsto`).
   ```
3. **Lines 367–369**, from "A closed ball centered at an arbitrary `q`" to "`ProperSpace M` follows.", become:
   ```
   Conclude with Mathlib's single-centre criterion `ProperSpace.of_seq_closedBall`
   (`Mathlib/Topology/MetricSpace/ProperSpace.lean`) at `p`, for instance with `l = atTop` on `ℝ`
   and `r = id`; it already contains the triangle-inequality step for balls about other centres.
   ```

**Kept.**
- **The remaining work stays as written.** For (c) ⇒ (d):
  - constant speed makes the base curve Cauchy, which gives the limit `q`;
  - the velocity coordinates are bounded, and finite dimensionality gives a convergent subsequence;
  - the argument runs at both endpoints;
  - "Neither convergence of the velocities nor the extension lemma is implicit in constant speed."

  For (b):
  - the set equality `closedBall p r = exp_p '' closedBall 0 r`, and the compactness of the exponential images;
  - the non-injectivity caveat;
  - the warning that "(f_p) does not imply (b)".
- **The maximal-curve route in edit 2 depends on the open Layer 1 identification** of the chosen maximal geodesic (see /7). The `Ioo` form is kept as the fallback.
- **These declarations do not by themselves formalise either Hopf–Rinow implication.**
- **No atlas edit.** The overlay still records both targets as absent. It is generated ("do not edit by hand").

## /10 (low, other): the Riemannian length-space statement needs neither completeness nor connectedness

**Checked.** The README is `tauceti:TauCetiRoadmap/HopfRinow`, mirrored at `content/tau-ceti/HopfRinow/README.md`; line numbers below are those of the mirror at origin/main. Layer 4, lines 397–399, reads: "Prove separately that geodesic spaces are length spaces and that a complete connected Riemannian manifold is both, using `(f_p)` and the Layer-0 length comparison."

I read each declaration of the assembly at the pins:

| Declaration | Location | Hypotheses and statement |
| --- | --- | --- |
| `TauCeti.IsLengthSpace.of_exists_eVariationOn_lt` | Tau Ceti `TauCeti/Topology/MetricSpace/Length.lean:172` | `[PseudoEMetricSpace X]`. If for all `x y c` with `edist x y < c` there is `γ` with `IsCurveJoining γ x y ∧ eVariationOn γ (Icc 0 1) < c`, then `IsLengthSpace X`. |
| `Manifold.exists_lt_of_riemannianEDist_lt` | Mathlib `Geometry/Manifold/Riemannian/PathELength.lean:250` | `[TopologicalSpace M] [ChartedSpace H M]` and fibrewise `ENorm`. From `riemannianEDist I x y < r` it gives `γ` with `γ 0 = x`, `γ 1 = y`, `CMDiff[Icc 0 1] 1 γ` and `pathELength I γ 0 1 < r`. |
| `TauCeti.Manifold.eVariationOn_eq_pathELength` | Tau Ceti `TauCeti/Geometry/Manifold/Riemannian/EVariationComparison.lean:302` | `[PseudoEMetricSpace M] [ChartedSpace H M] [RiemannianBundle …] [IsRiemannianManifold I M]` (line 97), plus `[IsManifold I 1 M] [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]` (section `Converse`, line 166). From `CMDiff[Icc a b] 1 γ` it gives `eVariationOn γ (Icc a b) = Manifold.pathELength I γ a b`. |
| `IsRiemannianManifold.out` | Mathlib `Geometry/Manifold/Riemannian/Basic.lean:81` | A class over `[PseudoEMetricSpace M] [ChartedSpace H M] [RiemannianBundle …]` with field `edist x y = riemannianEDist I x y`. |

A `C¹` path is continuous on `[0, 1]` (`ContMDiffOn.continuousOn`, used the same way at `TauCeti/Geometry/Manifold/Riemannian/Distance.lean:80`), so it gives `IsCurveJoining`. No step uses completeness or connectedness. No Riemannian length-space theorem exists yet: outside `Length.lean`, a search of the Tau Ceti tree for `IsLengthSpace` and `IsGeodesicSpace` finds nothing.

The one-sided bound `TauCeti.Manifold.eVariationOn_le_pathELength` (`EVariationComparison.lean:130`) is all the assembly uses. It sits outside the `Converse` section, so it carries neither `[IsManifold I 1 M]` nor `[IsContinuousRiemannianBundle …]`. The note below keeps the review's hypothesis list, which is binding; nothing was compiled.

The review cites no source page for this finding.

**Note for the Tau Ceti maintainer.** In Layer 4, bullet "**Metric geodesic-space API**", replace lines 397–399 from "Prove separately" to "comparison.":

> Prove separately that geodesic spaces are length spaces
> and that a complete connected Riemannian manifold is both, using `(f_p)` and the Layer-0 length
> comparison.

with:

> Prove separately that geodesic spaces are length spaces, and that every Riemannian manifold is a
> length space: under `[PseudoEMetricSpace M] [ChartedSpace H M] [IsManifold I 1 M]
> [Bundle.RiemannianBundle (fun x : M ↦ TangentSpace I x)]
> [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] [IsRiemannianManifold I M]`,
> prove `TauCeti.IsLengthSpace M`, with no completeness or connectedness hypothesis. This is an
> assembly: rewrite `edist x y < c` with `IsRiemannianManifold.out`, take the `C¹` path of
> `Manifold.exists_lt_of_riemannianEDist_lt`, identify its length with its total variation by
> `TauCeti.Manifold.eVariationOn_eq_pathELength`, and conclude with
> `TauCeti.IsLengthSpace.of_exists_eVariationOn_lt`. As a separate consequence of `(f_p)` at every
> base point, prove that a complete connected Riemannian manifold is a geodesic space, using the
> Layer-0 length comparison.

Lines 399–402, from "Coordinate names" to the end of the bullet, stay unchanged.

**Kept.** As the review requires, the statement keeps the charted `C¹` manifold, `RiemannianBundle` and `IsContinuousRiemannianBundle` hypotheses beside `PseudoEMetricSpace` and `IsRiemannianManifold`. The red team's abbreviated signature dropped them. They hold under the standing hypotheses, but a standalone declaration must state them. The geodesic-space consequence stays a separate statement routed through `(f_p)`. The metric length and geodesic-space definitions and the coordination sentence are unchanged. /12 below removes "connected" from the geodesic-space sentence.

## /11 (low, other): compact ⇒ geodesically complete, stated without connectedness

**Checked.** Layer 4, lines 385–391, reads: "the corollary itself holds without `[ConnectedSpace M]`, but the ordinary-metric proof route does not. … This roadmap therefore takes the connected proof route here: assume `[ConnectedSpace M]`, then use `proper_of_compact`, `complete_of_proper`, and Layer 3's `(c) ⇒ (d)`. Do not claim that compactness of `M` directly confines the flow on noncompact `TM`; a disconnected version requires a separate componentwise or extended-metric argument."

Declarations read at Tau Ceti f790474. Names in `IntegralCurve/Maximal.lean` have no namespace.

| Declaration | Location | Hypotheses and statement |
| --- | --- | --- |
| `maximalIntegralCurveInterval_eq_univ_of_isCompact_of_mapsTo` | `TauCeti/Geometry/Manifold/IntegralCurve/Maximal.lean:328` | `[T2Space M] [IsManifold I 1 M] [BoundarylessManifold I M]` (line 223) and `[CompleteSpace E]`. Takes `hv : CMDiff 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))`, `h0 : 0 ∈ maximalIntegralCurveInterval v x`, `hK : IsCompact K` and `hmem : MapsTo (maximalIntegralCurve v x) (maximalIntegralCurveInterval v x) K`. Concludes `maximalIntegralCurveInterval v x = univ`. |
| `zero_mem_maximalIntegralCurveInterval` | same file, :175 | `[CompleteSpace E] [IsManifold I 1 M] [BoundarylessManifold I M]` and `CMDiffAt 1` of the field at `x`. |
| `maximalIntegralCurve_zero` | :218 | The curve's value at `0` is `x`. |
| `isPreconnected_maximalIntegralCurveInterval` | :137 | The maximal interval is preconnected. |
| `isMIntegralCurveOn_maximalIntegralCurve` | :248 | The maximal curve is an integral curve on the maximal interval. |
| `TauCeti.Manifold.geodesicSpray` | `Riemannian/Geodesic/Spray.lean:107` | The spray, a vector field on `TangentBundle I M`. |
| `TauCeti.Manifold.contMDiff_geodesicSpray` | `Riemannian/Geodesic/Smoothness.lean:79` | The spray is `C^n` as a section of `T(TM)`. |
| `TauCeti.Manifold.eq_curveVelocityLiftWithin_of_isMIntegralCurveOn` | `Spray.lean:282` | An integral curve of the spray is the velocity lift of its base curve. |
| `TauCeti.Manifold.isGeodesicCurveOn_proj_of_isMIntegralCurveOn` | `Spray.lean:302` | That base curve is a geodesic, given `ContMDiffOn 𝓘(ℝ, ℝ) I 2` of it. |
| `TauCeti.Manifold.IsGeodesicCurveOn.norm_curveVelocityWithin_eq` | `Riemannian/Geodesic/ConstantSpeed.lean:97` | `[FiniteDimensional ℝ E] [IsManifold I 2 M] … [IsContMDiffRiemannianBundle I 1 E …]` and `IsPreconnected s`. The speed is constant on `s`. |

The escape theorem is applied with `TangentBundle I M` in place of `M`, so its `[T2Space]` is Hausdorffness of the total space. Tau Ceti already states that hypothesis explicitly, in `IsGeodesicCurveOnFrom.eqOn_of_inter` (`Geodesic/Maximal.lean:150`); /4 records that neither pin supplies the instance.

For the norm bounds I read Mathlib `Topology/VectorBundle/Riemannian.lean` under `[IsContinuousRiemannianBundle F E]`:
- The right bound is `eventually_norm_trivializationAt_lt` (:223), `∃ C > 0, ∀ᶠ y in 𝓝 x, ‖(trivializationAt F E x).continuousLinearMapAt ℝ y‖ < C`. It bounds the trivialized image of the disk bundle.
- The red team's `eventually_norm_symmL_trivializationAt_lt` (:328) bounds the inverse `symmL` instead, which is the wrong direction for compactness.
- The fibre norm on the total space is continuous by `Continuous.inner_bundle` (:128).

Two steps are still open:
- The /7 identification of `J(p,v)` with the maximal spray interval. The /7 review keeps it open.
- `C²` regularity of the base curve, which `Spray.lean:302` needs.

do Carmo's Corollary 2.9 is not readable here. The statement follows the README's paraphrase and the review.

**Note for the Tau Ceti maintainer.** In Layer 4, replace the bullet at lines 385–391, from "- **Compact ⇒ geodesically complete**" to "extended-metric argument.", with:

> - **Compact ⇒ geodesically complete** (do Carmo, Corollary 2.9), without `[ConnectedSpace M]`:
>   under the standing hypotheses together with `[CompactSpace M]` and
>   `[T2Space (TangentBundle I M)]`, prove global (d), `∀ p v, J(p,v) = univ`. `TM` itself is not
>   compact; the flow is confined to a fixed-speed level set instead. First prove that for every
>   `c : ℝ` the closed disk bundle `{w : TangentBundle I M | ‖w.2‖ ≤ c}` is compact: cover `M` by
>   finitely many compact sets, each inside the base set of one tangent-bundle trivialization and
>   inside a neighbourhood on which `eventually_norm_trivializationAt_lt` bounds that
>   trivialization, so that the part of the disk bundle over each set is carried into a compact
>   `K × closedBall 0 (C * c)` in the finite-dimensional model. The fibre norm is continuous
>   (`[IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]`), so the level set
>   `{w | ‖w.2‖ = c}` is a closed subset and is compact. Next, using the Layer-1 identification
>   of `J(p,v)` with `maximalIntegralCurveInterval (geodesicSpray I M) ⟨p, v⟩`, place `0` in that
>   interval (`zero_mem_maximalIntegralCurveInterval`, with value `⟨p, v⟩` there by
>   `maximalIntegralCurve_zero`). On the interval, identify the maximal integral curve with the
>   velocity lift of its base curve (`eq_curveVelocityLiftWithin_of_isMIntegralCurveOn`), and show
>   that this base curve is a geodesic (`isGeodesicCurveOn_proj_of_isMIntegralCurveOn`, once its
>   `C²` regularity is supplied). Constant speed on the preconnected maximal interval
>   (`IsGeodesicCurveOn.norm_curveVelocityWithin_eq`) keeps the curve in the level set
>   `‖w.2‖ = ‖v‖`, and `maximalIntegralCurveInterval_eq_univ_of_isCompact_of_mapsTo` then gives
>   `J(p,v) = univ`. Keep the connected ordinary-metric route as a second proof: Layer 0 exposes
>   a compatible `MetricSpace M` only after global finiteness of `riemannianEDist`, so assume
>   `[ConnectedSpace M]`, then use `proper_of_compact`, `complete_of_proper`, and Layer 3's
>   `(c) ⇒ (d)`.

**Kept.**
- Finite dimension, the continuous fibre norm, compactness of the base and a Hausdorff total space are all stated.
- The compactness argument is the finite cover by compact sets inside trivializations with local norm bounds, as the review corrects it. `TM` is never claimed compact.
- The Layer-1 identification of the maximal spray curve with the velocity lift, and its time-zero membership, come before the escape theorem.
- The connected metric route stays as an alternative proof.

## /12 (low, other): with an existing metric, connectedness is a theorem, not a hypothesis

**Checked.** The README text involved:
- Lines 56–58: "**Connectedness** (`[ConnectedSpace M]`) is load-bearing and stated explicitly wherever used: without it the distance is not finite and assertion (f) fails across components. … the equivalence and (f) (Layers 3–4) do."
- Lines 59–61: "For abstract theory, use an existing `[EMetricSpace M]` or `[MetricSpace M]` together with `[IsRiemannianManifold I M]`".
- Lines 26–28: "(do Carmo carries this as a chapter convention rather than in the theorem line; it is load-bearing — see Standing hypotheses)".
- Lines 371–373: "properness makes each `K_n` compact, connectedness and finiteness of `dist` give `⋃ n, K_n = univ`".
- Layer 0, lines 208–214: "**Distance compatibility and finiteness.**"

Declarations read at the pins:

| Declaration | Location | Hypotheses and statement |
| --- | --- | --- |
| `IsRiemannianManifold.out` | Mathlib `Geometry/Manifold/Riemannian/Basic.lean:81` | `edist x y = riemannianEDist I x y`. |
| `edist_lt_top` | Mathlib `Topology/MetricSpace/Pseudo/Defs.lean:315` | `[PseudoMetricSpace α]`: `edist x y < ⊤`. |
| `TauCeti.Manifold.joined_of_riemannianEDist_lt_top` | Tau Ceti `TauCeti/Geometry/Manifold/Riemannian/Distance.lean:77` | Only `[TopologicalSpace M] [ChartedSpace H M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)]`: `riemannianEDist I x y < ⊤ → Joined x y`. |
| `PathConnectedSpace` | Mathlib `Topology/Connected/PathConnected.lean:566` | Fields `nonempty` and `joined`. |
| `PathConnectedSpace.connectedSpace` | same file, :710 | The instance `ConnectedSpace` from `PathConnectedSpace`. |
| `Metric.iUnion_closedBall_nat` | Mathlib `Topology/MetricSpace/Pseudo/Defs.lean:593` | `[PseudoMetricSpace α]` only: `⋃ n : ℕ, closedBall x n = univ`. |

These give the bridge: in a nonempty `M` with an existing pseudometric and `IsRiemannianManifold I M`, any two points are joined. Nonemptiness is a real hypothesis, since the empty type carries a metric but is not `ConnectedSpace`.

The construction route in Tau Ceti uses only `[PreconnectedSpace M]`:
- `TauCeti.Manifold.riemannianEDist_ne_top` (`Distance.lean:152`).
- `TauCeti.PseudoMetricSpace.ofRiemannianMetric` (:225).
- `TauCeti.MetricSpace.ofRiemannianMetric` (:250), which also needs `[IsManifold I 1 M]`, `[IsContinuousRiemannianBundle …]` and `[RegularSpace M]` or `[T3Space M]`.

The bridge does not exist yet: a case-insensitive search for `connectedSpace` under `TauCeti/Geometry/Manifold` matches only `Distance.lean`. A second route becomes available once the /10 length-space theorem lands: `TauCeti.IsLengthSpace.pathConnectedSpace` (`Length.lean:199`, `[PseudoMetricSpace X] [IsLengthSpace X] [Nonempty X]`).

The review cites no source page for this finding.

**Note for the Tau Ceti maintainer.** Five edits.

1. Lines 26–28: replace "(do Carmo carries this as a chapter convention rather than in the theorem line; it is load-bearing — see Standing hypotheses)" with:

   > (do Carmo carries this as a chapter convention rather than in the theorem line; against an
   > existing metric it follows from nonemptiness, and it is load-bearing only where the distance
   > is constructed or only an extended metric is assumed — see Standing hypotheses)

2. Lines 56–58: replace the bullet "- **Connectedness** (`[ConnectedSpace M]`) is load-bearing … (Layers 3–4) do." with:

   > - **Connectedness.** Against an existing `[PseudoMetricSpace M]` or `[MetricSpace M]` with
   >   `[IsRiemannianManifold I M]`, connectedness is a theorem, not a hypothesis: every `edist` is
   >   finite, so every `Manifold.riemannianEDist I x y` is finite, and a nonempty such `M` is
   >   path-connected (Layer 0). Do not add `[ConnectedSpace M]` to the Layer-3 equivalence or to
   >   the Layer-4 statements made against an existing metric; keep nonemptiness explicit, as the
   >   base point `p` or `[Nonempty M]`. `[ConnectedSpace M]`, or `[PreconnectedSpace M]` where
   >   nonemptiness is not needed, is load-bearing and stated explicitly where the distance is
   >   constructed from the manifold topology or only an extended metric `[EMetricSpace M]` is
   >   assumed: without it the extended distance is `∞` across components and assertion (f) fails
   >   there. The purely local geodesic theory (Layers 1–2) does not need it.

3. Layer 0: after line 214 ("compatibility predicate."), insert:

   > - **Path-connectedness from an existing metric.** For `[PseudoMetricSpace M] [ChartedSpace H M]
   >   [Bundle.RiemannianBundle (fun x : M ↦ TangentSpace I x)] [IsRiemannianManifold I M]
   >   [Nonempty M]`, prove `PathConnectedSpace M`, hence `ConnectedSpace M` by
   >   `PathConnectedSpace.connectedSpace`: `edist_lt_top` and `IsRiemannianManifold.out` make
   >   `Manifold.riemannianEDist I x y` finite, and
   >   `TauCeti.Manifold.joined_of_riemannianEDist_lt_top` joins `x` to `y`. Later layers obtain
   >   connectedness from this theorem instead of assuming it. Nonemptiness cannot be dropped: the
   >   empty manifold carries a metric but is not connected.

4. Lines 371–373: replace "- **(b) ⇒ (e_p):** take `K_n = closedBall p n`; properness makes each `K_n` compact, connectedness and finiteness of `dist` give `⋃ n, K_n = univ`, and `q_n ∉ K_n` forces `dist p (q_n) → ∞`." with:

   > - **(b) ⇒ (e_p):** take `K_n = closedBall p n`; properness makes each `K_n` compact,
   >   `Metric.iUnion_closedBall_nat` gives `⋃ n, K_n = univ` in any metric space, and
   >   `q_n ∉ K_n` forces `dist p (q_n) → ∞`.

5. Layer 4, in the geodesic-space sentence as rewritten by /10, replace "a complete connected Riemannian manifold is a geodesic space" with "a complete Riemannian manifold, with an existing `[MetricSpace M]`, is a geodesic space (connectedness from the Layer-0 path-connectedness theorem)". If /10 is not applied, make the same replacement of "a complete connected Riemannian manifold" at line 398.

**Kept.**
- Connectedness remains a stated hypothesis for building an ordinary Riemannian metric from the extended distance: line 63 "prove global finiteness under `[ConnectedSpace M]`" and Layer 0 lines 208–211.
- It also stays in the connected alternative route of the /11 corollary.
- Nonemptiness is never silently dropped: it comes from the base point `p` or from `[Nonempty M]`.
- The zero-dimensional sentence (lines 65–66) and the do Carmo paraphrase "(connected)" at line 30 are unchanged.
- The bridge is a new theorem, not an assumed typeclass instance.

## /13 (low, error): the manifold integral-curve predicate is `IsMIntegralCurve`, not `IsIntegralCurve`

**Checked.**

README, line numbers as on `main`:
- **Lines 102–104.** "**Integral curves on manifolds.** `IsIntegralCurve`, existence and uniqueness, transformation lemmas, and a uniform-time theorem for local integral curves (`Mathlib/Geometry/Manifold/IntegralCurve/{Basic,ExistUnique,Transform,UniformTime}.lean`)."
- **Line 260.** "This is the object to which Mathlib's `IsIntegralCurve` API is applied."
- No other line of the README names `IsIntegralCurve`; a search of the file found only these two.

Mathlib 082e2d3:
- `Geometry/Manifold/IntegralCurve/Basic.lean:66` defines `IsMIntegralCurveOn (γ : ℝ → M) (v : (x : M) → TangentSpace% x) (s : Set ℝ) : Prop`. Line 72 defines `IsMIntegralCurveAt` and line 77 `IsMIntegralCurve`.
- That directory has no alias or deprecation named `IsIntegralCurve`.
- `Analysis/ODE/Basic.lean:54` defines `IsIntegralCurve (γ : ℝ → E) (v : ℝ → E → E) : Prop`. It is the normed-space predicate for a time-dependent field, alongside `IsIntegralCurveOn` (:44) and `IsIntegralCurveAt` (:49).
- The cited manifold files state their results with the `IsM…` names. Examples: `exists_isMIntegralCurveAt_of_contMDiffAt_boundaryless` (`ExistUnique.lean:120`) and `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless` (`ExistUnique.lean:227`).
- Tau Ceti's spray lemmas use `IsMIntegralCurveOn`, for example `isMIntegralCurveOn_curveVelocityLiftWithin_iff` (`Riemannian/Geodesic/Spray.lean:270`).

The review cites no source pages for this finding.

**Note for the Tau Ceti maintainer.** Two edits.

1. **Lines 102–106.** The bullet becomes:
   ```
   - **Integral curves on manifolds.** `IsMIntegralCurve`, `IsMIntegralCurveOn`, and
     `IsMIntegralCurveAt`, existence and uniqueness, transformation lemmas, and a uniform-time theorem
     for local integral curves
     (`Mathlib/Geometry/Manifold/IntegralCurve/{Basic,ExistUnique,Transform,UniformTime}.lean`). The
     similarly named `IsIntegralCurve` (`Mathlib/Analysis/ODE/Basic.lean`) is the normed-space
     predicate for a time-dependent field `v : ℝ → E → E`, not this API. The geodesic spray should be
     connected to this API rather than developed solely in model-space ODE terms.
   ```
2. **Line 260.** "Mathlib's `IsIntegralCurve` API" becomes "Mathlib's `IsMIntegralCurve`/`IsMIntegralCurveOn` API".

**Kept.**
- **The normed-space `IsIntegralCurve` is not renamed.** It is a different declaration, and the ODE bullet at lines 97–101 does not name it.
- **Line 262 and line 143 stay.** Line 262 reads "apply Mathlib's manifold integral-curve API to `S`"; line 143 is the mathlib4#40062 bullet.

## /14 (low, missing): stage links from HopfRinow to its declared consumer layers

**Checked.**
- **Raw snapshot.** `data/atlas.json` holds 3508 `stageEdges`, and none touches a HopfRinow stage. Its `roadmapLinks` between HopfRinow and GeometricTopology/OptimalTransport all have kind `reference`, "Document reference; not a claimed prerequisite." The raw snapshot is not the integrated graph, however.
- **Integrated graph.** Running `decompositions.merge_links` (`scripts/decompositions.py:267`) on the snapshot and `data/links/*.json` yields exactly one HopfRinow edge, of kind `reviewed_link`: HopfRinow Layer 1 → `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-0-the-exponential-map-and-one-parameter-subgroups`. It comes from `data/links/tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.json` `links[3]`, with confidence `inferred` and review status `accepted` (2026-09-23).
- **The red team's premise.** The red team's "no edge from any HopfRinow stage" is therefore false for the integrated atlas, as the review says.
- **Link state.** Neither `research/blueprint/links/` nor `data/links/` has a HopfRinow, GeometricTopology or OptimalTransport packet. `research/blueprint/queue.json` has `LINK-tauceti_TauCetiRoadmap_HopfRinow`, `…_GeometricTopology` and `…_OptimalTransport` all `pending`.

Consumer texts:
- GeometricTopology Layer 7, lines 630–631: "[Hopf--Rinow roadmap](../HopfRinow/README.md), Layer 1, owns the intervening Levi-Civita connection; this layer consumes that shared connection rather than constructing a second one".
- OptimalTransport Layer 7, lines 903–905: "The [Hopf--Rinow roadmap](../HopfRinow/README.md), Layers 1--4, supplies the Levi-Civita connection, interval-aware geodesics, exponential maps and their local inverse logarithms on normal neighborhoods, Hopf--Rinow, and minimizing geodesics." Items 1–3 (lines 912–935) consume the "exponential map, local logarithm, completeness, and minimizing-geodesic APIs".
- OptimalTransport Layer 8, lines 976–977: "Consume metric curve length, length spaces, and constant-speed geodesic spaces from the shared API owned by the [Hopf--Rinow roadmap](../HopfRinow/README.md), Layer 4."

Supplier texts: HopfRinow lines 19–23 name both consumer roadmaps, and line 227 says "the Geometric Topology roadmap consumes the resulting API." That makes the GT Layer 7 and OT Layer 7 links `explicit`. For OT Layer 8, the consumer names HopfRinow Layer 4 and the supplier calls it "this shared API" (line 401).

OptimalTransport line 1963 also says "Layers 7--9 consume these results". Layer 9 names no HopfRinow API, so, following the review, no Layer 9 edge is proposed here; the HopfRinow link job screens it.

I put the five entries below, with the two /15 entries, in a scratch `links-v1` packet and ran `python3 scripts/check_links.py` on it: 0 errors, 0 warnings. Every quote is found verbatim and no cycle is created, since no recorded or reviewed stage link enters any HopfRinow stage. As a negative control, a corrupted quote was rejected.

**Note for the Tau Ceti maintainer.** No README change is needed. HopfRinow lines 19–23 and 226–227 already name both consumer roadmaps. The red team's "the roadmap lists no consumers" describes the extract's empty `consumers` field, which the link workflow fills.

**Link entries** (for `LINK-tauceti_TauCetiRoadmap_HopfRinow`, or for the GeometricTopology or OptimalTransport link job if it runs first; the later packet lists them under `alreadyRecorded`). Five entries, all through the link workflow and its independent review, never by editing the raw atlas.

1. HopfRinow Layer 1 → GeometricTopology Layer 7:

```json
{
 "source": "tauceti:TauCetiRoadmap/HopfRinow#layer-1-the-geodesic-equation-the-flow-and-the-exponential-map",
 "target": "tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume",
 "reason": "HopfRinow Layer 1 constructs the Levi-Civita connection of the canonical Riemannian bundle instance, with its C^∞ regularity and chart Christoffel symbols, and says the Geometric Topology roadmap consumes it. GeometricTopology Layer 7 builds the Riemann curvature tensor and sectional and Ricci curvature from that shared connection and must not construct a second one.",
 "confidence": "explicit",
 "evidence": [
  {
   "stageId": "tauceti:TauCetiRoadmap/HopfRinow#layer-1-the-geodesic-equation-the-flow-and-the-exponential-map",
   "quote": "owns delivery in either case; the Geometric Topology roadmap consumes the resulting API.",
   "sourcePath": "content/tau-ceti/HopfRinow/README.md",
   "locator": "line 227"
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume",
   "quote": "owns the intervening Levi-Civita connection; this layer consumes that shared connection rather than constructing a second one",
   "sourcePath": "content/tau-ceti/GeometricTopology/README.md",
   "locator": "lines 630-631"
  }
 ]
}
```

2. HopfRinow Layer 1 → OptimalTransport Layer 7:

```json
{
 "source": "tauceti:TauCetiRoadmap/HopfRinow#layer-1-the-geodesic-equation-the-flow-and-the-exponential-map",
 "target": "tauceti:TauCetiRoadmap/OptimalTransport#layer-7-riemannian-brenier--mccann-transport",
 "reason": "HopfRinow Layer 1 supplies the Levi-Civita connection, the interval-aware geodesic predicate IsGeodesicCurveOn with its maximal intervals, and the exponential map exp_p on its open domain expDomain p. OptimalTransport Layer 7 consumes them for contact endpoints y = exp_x(-∇φ(x)) and McCann's map T(x) = exp_x(-∇φ(x)).",
 "confidence": "explicit",
 "evidence": [
  {
   "stageId": "tauceti:TauCetiRoadmap/HopfRinow#layer-1-the-geodesic-equation-the-flow-and-the-exponential-map",
   "quote": "**Exponential-map basic API:** define `expDomain p = {v | 1 ∈ J(p,v)}`",
   "sourcePath": "content/tau-ceti/HopfRinow/README.md",
   "locator": "line 284"
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/OptimalTransport#layer-7-riemannian-brenier--mccann-transport",
   "quote": "The [Hopf--Rinow roadmap](../HopfRinow/README.md), Layers 1--4, supplies the Levi-Civita connection, interval-aware geodesics, exponential maps",
   "sourcePath": "content/tau-ceti/OptimalTransport/README.md",
   "locator": "lines 903-904"
  }
 ]
}
```

3. HopfRinow Layer 2 → OptimalTransport Layer 7:

```json
{
 "source": "tauceti:TauCetiRoadmap/HopfRinow#layer-2-normal-neighbourhoods-the-gauss-lemma-and-minimizing-geodesics",
 "target": "tauceti:TauCetiRoadmap/OptimalTransport#layer-7-riemannian-brenier--mccann-transport",
 "reason": "HopfRinow Layer 2 supplies normal neighbourhoods, the local logarithm log_p as the inverse of exp_p there, and ball-internal minimization of radial geodesics, with no global single-valued logarithm. OptimalTransport Layer 7 consumes these local inverse logarithms on normal neighbourhoods and itself introduces no global logarithm across the cut locus.",
 "confidence": "explicit",
 "evidence": [
  {
   "stageId": "tauceti:TauCetiRoadmap/HopfRinow#layer-2-normal-neighbourhoods-the-gauss-lemma-and-minimizing-geodesics",
   "quote": "Define `log_p` on the resulting neighbourhood of `p` as this restriction's inverse",
   "sourcePath": "content/tau-ceti/HopfRinow/README.md",
   "locator": "lines 318-319"
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/OptimalTransport#layer-7-riemannian-brenier--mccann-transport",
   "quote": "exponential maps and their local inverse logarithms on normal neighborhoods",
   "sourcePath": "content/tau-ceti/OptimalTransport/README.md",
   "locator": "lines 904-905"
  }
 ]
}
```

4. HopfRinow Layer 3 → OptimalTransport Layer 7:

```json
{
 "source": "tauceti:TauCetiRoadmap/HopfRinow#layer-3-the-hopfrinow-equivalence",
 "target": "tauceti:TauCetiRoadmap/OptimalTransport#layer-7-riemannian-brenier--mccann-transport",
 "reason": "HopfRinow Layer 3 supplies the Hopf–Rinow equivalence at a base point and (a_p) ⇒ (f_p), minimizing geodesics realizing the distance. OptimalTransport Layer 7 consumes the completeness and minimizing-geodesic APIs to join each contact endpoint to x by a minimizing geodesic and to state McCann's theorem on geodesically complete manifolds.",
 "confidence": "explicit",
 "evidence": [
  {
   "stageId": "tauceti:TauCetiRoadmap/HopfRinow#layer-3-the-hopfrinow-equivalence",
   "quote": "assemble the `TFAE` of `(a_p)`, (b), (c), global (d), and `(e_p)`, together with `(a_p) ⇒ (f_p)`",
   "sourcePath": "content/tau-ceti/HopfRinow/README.md",
   "locator": "lines 341-342"
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/OptimalTransport#layer-7-riemannian-brenier--mccann-transport",
   "quote": "consume the Hopf--Rinow roadmap's exponential map, local logarithm, completeness, and minimizing-geodesic APIs",
   "sourcePath": "content/tau-ceti/OptimalTransport/README.md",
   "locator": "lines 912-913"
  }
 ]
}
```

5. HopfRinow Layer 4 → OptimalTransport Layer 8:

```json
{
 "source": "tauceti:TauCetiRoadmap/HopfRinow#layer-4-corollaries-and-downstream-theory",
 "target": "tauceti:TauCetiRoadmap/OptimalTransport#layer-8-metric-curves-dynamic-plans-and-benamou--brenier",
 "reason": "HopfRinow Layer 4 owns the shared metric curve-length, length-space and geodesic-space API in TauCeti/Topology/MetricSpace/Length.lean. OptimalTransport Layer 8 consumes metric curve length, length spaces and constant-speed geodesic spaces from it and builds AC^p curves and dynamic plans on top, reusing these notions.",
 "confidence": "explicit",
 "evidence": [
  {
   "stageId": "tauceti:TauCetiRoadmap/HopfRinow#layer-4-corollaries-and-downstream-theory",
   "quote": "**Metric length-space API:** in `TauCeti/Topology/MetricSpace/Length.lean`, define metric curve length",
   "sourcePath": "content/tau-ceti/HopfRinow/README.md",
   "locator": "lines 392-393"
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/OptimalTransport#layer-8-metric-curves-dynamic-plans-and-benamou--brenier",
   "quote": "Consume metric curve length, length spaces, and constant-speed geodesic spaces from the shared API owned by the [Hopf--Rinow roadmap](../HopfRinow/README.md), Layer 4.",
   "sourcePath": "content/tau-ceti/OptimalTransport/README.md",
   "locator": "lines 976-977"
  }
 ]
}
```

**Kept.**
- The reviewed HopfRinow Layer 1 → LieGroups Layer 0 link stays as it is: the inverse-function-theorem prefix only, confidence `inferred`, already integrated. It is not re-proposed.
- The `reference` roadmap links are derived and stay.
- The consumers are three layers in two roadmaps, not three roadmaps.
- Only the edges the quoted consumers support are added: H1 → GT7; H1, H2, H3 → OT7; H4 → OT8.

## /15 (low, missing): one shared smooth-Riemannian-isometry notion for GeometricTopology Layers 7–8

**Checked.** HopfRinow Layer 4, lines 403–411: "define a smooth Riemannian isometry between two standing-hypothesis manifolds as an equivalence whose forward and inverse maps are `C^∞` and whose tangent maps preserve the Riemannian inner products at every point. … including transport through the `IsRiemannianManifold` identification for downstream roadmaps (constant-curvature model spaces). Do not state this for a bare metric `IsometryEquiv`: obtaining the required smoothness from metric preservation is a Myers–Steenrod theorem, which would be a separate owned milestone."

GeometricTopology (`content/tau-ceti/GeometricTopology/README.md`) uses isometries without naming a supplier:
- Layer 7, line 641: "`Matrix.orthogonalGroup` for isometry groups."
- Layer 7, lines 644–645: "The **Riemannian volume measure** … and its invariance under isometries".
- Layer 8, lines 697–699: "Layer 7's Riemannian and hyperbolic structures and isometry groups; … Lie groups (`Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`) for the model-geometry isometry groups."
- Layer 8, lines 702–706: "The **eight model geometries** as homogeneous Riemannian 3-manifolds `(X, Isom X)`: … each with its maximal isometry group".
- Layer 8, line 718: "-- structure ModelGeometry where X : Manifold …; isom : LieGroup …; homogeneous : …".

At the pins no Riemannian isometry notion exists:
- In Mathlib `Geometry/Manifold`, "isometr" occurs only for linear isometries (`Instances/Sphere.lean`) and in a parallel-transport TODO (`VectorBundle/CovariantDerivative/Metric.lean:37`).
- In `TauCeti/Geometry`, the definitions found are linear or sphere isometry equivalences (`Sphere/LinearIsometry.lean:87`, `Sphere/Circle.lean:57`).
- Neither library contains Myers–Steenrod.
- The only atlas stage that mentions it is HopfRinow Layer 4.

Scott's survey and the Myers–Steenrod sources were not read here. The routing follows the review's reading: the eight models can get their Lie-group structures and maximality by direct classification, so the general theorem is not logically mandatory.

**Note for the Tau Ceti maintainer.**

HopfRinow, one clause. At lines 408–409, replace "for downstream roadmaps (constant-curvature model spaces)." with:

> for downstream roadmaps (constant-curvature model spaces; the Geometric Topology roadmap's
> Layer 7 volume invariance and Layer 8 model-geometry isometry groups consume this notion).

Leave the sentence on bare `IsometryEquiv` and Myers–Steenrod (lines 409–411) as it stands. No general Myers–Steenrod theorem is added to HopfRinow.

GeometricTopology, four edits:

1. Layer 7, lines 640–641: replace "the Hopf--Rinow roadmap's Levi-Civita connection; layer 1's manifolds; `Matrix.orthogonalGroup` for isometry groups." with:

   > the Hopf--Rinow roadmap's Levi-Civita connection and its smooth Riemannian isometries
   > (Layer 4); layer 1's manifolds; `Matrix.orthogonalGroup` for isometry groups.

2. Layer 7, line 645: replace "and its invariance under isometries" with:

   > and its invariance under the smooth Riemannian isometries of the Hopf--Rinow roadmap, Layer 4
   > (do not define a second isometry notion)

3. Layer 8, lines 697–699: replace "Layer 7's Riemannian and hyperbolic structures and isometry groups;" with:

   > Layer 7's Riemannian and hyperbolic structures and isometry groups; the Hopf--Rinow roadmap's
   > smooth Riemannian isometries (Layer 4);

4. Layer 8, at the end of the model-geometries bullet (line 706, after "for a discrete `Γ ≤ Isom X`)."), append:

   > `Isom X` is the group of smooth Riemannian isometries of `X` in the sense of the Hopf--Rinow
   > roadmap, Layer 4, or a group proved equal to it. Name the route to its Lie-group structure and
   > to maximality: either a model-by-model identification of each of the eight groups, or a
   > separately owned Myers–Steenrod milestone that states its hypotheses and proves the bridge
   > from metric isometries to smooth Riemannian isometries. Importing `LieGroup` does not
   > construct these groups, and metric preservation is not assumed to imply smoothness.

   The rest of the bullet and the Lean sketch at line 718 are unchanged.

**Link entries** (same workflow as /14). Both are `inferred`: neither text names the other for isometries.

6. HopfRinow Layer 4 → GeometricTopology Layer 7:

```json
{
 "source": "tauceti:TauCetiRoadmap/HopfRinow#layer-4-corollaries-and-downstream-theory",
 "target": "tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume",
 "reason": "HopfRinow Layer 4 defines smooth Riemannian isometries (an equivalence, C^∞ with C^∞ inverse, whose tangent maps preserve the Riemannian inner products) and transports the Levi-Civita connection, geodesics and exponential maps along them. GeometricTopology Layer 7 needs invariance of the Riemannian volume measure under isometries and should state it for this shared notion rather than define a second one. The link supplies smooth isometries only; it does not turn a bare metric IsometryEquiv into a smooth one.",
 "confidence": "inferred",
 "evidence": [
  {
   "stageId": "tauceti:TauCetiRoadmap/HopfRinow#layer-4-corollaries-and-downstream-theory",
   "quote": "define a smooth Riemannian isometry between two standing-hypothesis manifolds as an equivalence whose forward and inverse maps are `C^∞` and whose tangent maps preserve the Riemannian inner products at every point",
   "sourcePath": "content/tau-ceti/HopfRinow/README.md",
   "locator": "lines 403-405"
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume",
   "quote": "and its invariance under isometries",
   "sourcePath": "content/tau-ceti/GeometricTopology/README.md",
   "locator": "line 645"
  }
 ]
}
```

7. HopfRinow Layer 4 → GeometricTopology Layer 8:

```json
{
 "source": "tauceti:TauCetiRoadmap/HopfRinow#layer-4-corollaries-and-downstream-theory",
 "target": "tauceti:TauCetiRoadmap/GeometricTopology#layer-8-thurston-geometries-and-the-jsj--geometric-decomposition",
 "reason": "HopfRinow Layer 4 supplies the smooth Riemannian isometry notion, with transport through the IsRiemannianManifold identification, for downstream constant-curvature model spaces. GeometricTopology Layer 8 defines each of the eight model geometries (X, Isom X) with its maximal isometry group; Isom X must be, or be proved equal to, the group of these shared smooth isometries. The link does not supply the Lie-group structure on Isom X, its maximality, or the passage from metric to smooth isometries (Myers–Steenrod); Layer 8 must name its own route for those.",
 "confidence": "inferred",
 "evidence": [
  {
   "stageId": "tauceti:TauCetiRoadmap/HopfRinow#layer-4-corollaries-and-downstream-theory",
   "quote": "including transport through the `IsRiemannianManifold` identification for downstream roadmaps (constant-curvature model spaces)",
   "sourcePath": "content/tau-ceti/HopfRinow/README.md",
   "locator": "lines 408-409"
  },
  {
   "stageId": "tauceti:TauCetiRoadmap/GeometricTopology#layer-8-thurston-geometries-and-the-jsj--geometric-decomposition",
   "quote": "The **eight model geometries** as homogeneous Riemannian 3-manifolds `(X, Isom X)`: `S³`, `E³`, `ℍ³`, `S² × ℝ`, `ℍ² × ℝ`, `SL₂~`, `Nil`, `Sol`, each with its maximal isometry group",
   "sourcePath": "content/tau-ceti/GeometricTopology/README.md",
   "locator": "lines 702-704"
  }
 ]
}
```

**Kept.**
- HopfRinow Layer 4 keeps ownership of smooth Riemannian isometries.
- HopfRinow keeps its refusal to state transport for a bare metric `IsometryEquiv`.
- Myers–Steenrod stays a separately owned milestone and is not made mandatory. It is one of two named routes, the other being model-specific identification.
- Nothing makes metric preservation imply smoothness silently.
- The ownership choice for Layer 8's route belongs to the Geometric Topology maintainer.


## /16: rejected

The review rejects this finding: it is a possible reuse link between FuchsianOrbifolds L2 and the metric geodesic API, not a duplication. No change is made; a future link job may expose finite subarcs.
