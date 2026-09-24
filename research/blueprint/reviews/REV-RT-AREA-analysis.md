# REV-RT-AREA-analysis — independent verification

Codex — codex-hjdg0j · 2026-09-24 · Refs #1538

Complete: **all five findings confirmed** (four high, one medium). These correct false or overbroad roadmap statements; the qualified existing implementations retain their credit. [Machine-readable verdict](../redteam/RT-AREA-analysis.review.json).

## Independence and evidence

I did not write RT-AREA-analysis. Its report identifies Codex / codex-c83e7a, a different worker session. Bot reply 5808637049 confirmed my claim comment 5808635106, and I reread the full issue afterward. Explorer baseline: `2f82d0fe011aa6415b86bed59a089ff8bf277c67`. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

I independently checked all five finding locations, recalculated the counterexamples, read the cited declarations with their surrounding hypotheses and relevant proof bodies, and verified eleven Lean files against the pinned Git tree's blob hashes. I checked seven affected stage descriptions against their native documents and read their relevant reviewed coverage records. Three primary PDFs were reacquired; the source passages and hashes below were checked. This verifies the findings, not the red team's entire six-roadmap survey or every transitive proof dependency. No Lean compilation was run.

## 1. Endpoint regularity in Bernstein's theorem — confirmed, high

[Part B](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/content/tau-ceti/OneParameterSemigroups/README.md#L163) bundles smoothness on the closed half-line, then claims equivalence with the Laplace transform of an arbitrary finite measure. Set

    μ = Σ(n≥1) 2⁻ⁿ δ(2ⁿ),
    f(t) = Σ(n≥1) 2⁻ⁿ exp(−2ⁿt),  t≥0.

The weights sum to one. Dominated convergence gives continuity at zero, and exponential damping gives smoothness and alternating derivatives for positive t. For any integer N and positive t,

    (1−f(t))/t ≥ Σ(n=1..N) 2⁻ⁿ (1−exp(−2ⁿt))/t → N as t↓0.

Consequently the right derivative cannot be finite; neither ordinary nor within derivatives can provide the advertised endpoint smoothness. Independently, (e^{-nt}) converges to the indicator of zero on the closed half-line, disproving unrestricted preservation of continuity under pointwise limits. Even requiring endpoint continuity would not preserve the **strong** class: finite partial sums defining f are smooth and converge to this continuous, non-differentiable f.

The pin explicitly distinguishes [`IsCompletelyMonotone`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Basic.lean#L195), using within derivatives, from [`IsContinuousCompletelyMonotoneOnIoi`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Basic.lean#L483). [`hausdorff_bernstein_widder_existsUnique`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Bernstein/HausdorffBernsteinWidder.lean#L70) uses the latter. [`RepresentsLaplace`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Laplace/Representation.lean#L517) includes finite mass and equality on the half-line; [the strong converse](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Laplace/Representation.lean#L504) additionally requires every moment integrable.

Correct the prose, predicate and displayed stub consistently. The already proved [`isCompletelyMonotoneOnIoi_of_tendsto`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Limits.lean#L68) permits finite-valued pointwise limits on the open half-line; [its endpoint version](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Limits.lean#L96) additionally requires right-continuity of the limit. Import these results. Endpoint continuity repairs the weaker class, not closed-half-line smoothness.

## 2. General Yosida exponentials are not contractions — confirmed, high

The [common construction paragraph](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/content/tau-ceti/OneParameterSemigroups/README.md#L129) follows both the general-growth Hille–Yosida theorem and Lumer–Phillips with the same contraction assertion. On X=ℝ, take A=I. It is densely defined and closed, and for λ>1 its resolvent-power estimate holds with equality for M=1, ω=1. But

    A_λ = (λ²/(λ−1) − λ) I = λ/(λ−1) I,
    ‖exp(t A_λ)‖ = exp(tλ/(λ−1)) > 1  for t>0.

[Engel–Nagel, II.3.5 and II.3.8](https://www.math.uni-tuebingen.de/de/forschung/agfa/members/engel-nagel_one-parameter-semigroups.pdf#page=89) distinguish contraction from general growth: printed pp.73–74 give the contraction estimate; pp.77–78 shift the exponent and use an equivalent norm. I read those statements and proof passages.

The pinned [approximation theorem](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Approximation.lean#L105) bounds the exponent-zero exponentials by M using **all** resolvent-power estimates. [`hilleYosida_zero_of`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Shift.lean#L49) shifts the operator to A−ωI. The [completed construction](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Generation.lean#L165) takes the limit and shifts back, and [`hilleYosida_generation`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Generation.lean#L205) supplies the real-Banach-space theorem. Its enclosing assumptions include dense domain and M≥1; the Lean growth-bound argument order is `omega M`.

Retain the separate [Lumer–Phillips contraction construction](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Generation/LumerPhillips.lean#L86), with m-dissipativity and density. For general growth, import the existing shifted-limit construction. Shifting alone does not turn an original-norm M-bound with (M>1) into a contraction bound. Replace the stale build-here instruction; do not create a second semigroup owner.

## 3. The involutive-monoid API needs its group hypotheses — confirmed, high

[Part C](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/content/tau-ceti/OneParameterSemigroups/README.md#L200) deliberately defines positive definiteness on a general involutive additive monoid. On the nonnegative reals with identity involution, (F(t)=e^t) satisfies the exact quadratic-form condition:

    Σ(i,j) c_i conj(c_j) F(t_i+t_j) = |Σ_i c_i exp(t_i)|² ≥ 0.

Yet (F(t)>F(0)=1) for positive t. It is continuous at zero but not uniformly continuous: the points n and (n+e^{-n}) approach each other while their images differ by exp(n)(exp(exp(−n))−1) → 1.

The [generic Cauchy–Schwarz theorem](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Basic.lean#L206) correctly retains the two diagonal values. [The bound by F(0)](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Basic.lean#L213) requires a+star(a)=0. The [uniform-continuity theorem](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Continuity.lean#L250) assumes a seminormed additive group and a globally negating involution. State those hypotheses in the roadmap API and keep the generic monoid theory intact.

The BCR milestone already assumes boundedness separately. The unbounded example refutes the purported automatic bound, **not** that qualified representation theorem. Keep that independent hypothesis when propagating the correction to monoid and kernel consumers.

## 4. Barycenter uniqueness uses the revised small-set threshold — confirmed, high

[Layer 12, item 7](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/content/tau-ceti/OptimalTransport/README.md#L1379) uses nullity of Borel sets of Hausdorff dimension strictly below (n-1). This is the older [August 17 draft, Definition 3.2, p.10](https://www.ceremade.dauphine.fr/~carlier/AC_bary_Aug11_10.pdf#page=10). The [December 10 revision, Definition 3.2, p.10](https://www.ceremade.dauphine.fr/~carlier/Wasserstein-barycenters#page=10) instead requires dimension **at most** (d-1). Its Proposition 3.5, p.11 proves uniqueness when one input satisfies that condition. The proof uses differentiability of a convex potential almost everywhere for that input. These passages were read in both versions.

For an independent counterexample, let U be uniform on [−1,1], with μ=law(U,0) and ν=law(0,U). Sets of dimension below one have zero length on either supporting segment, so both laws satisfy the old condition. Every coupling has cost E[U²]+E[U²]=2/3, since the coordinates lie on perpendicular axes. Coupling equal or opposite parameters gives the two distinct midpoint laws ρ₊=law(U/2,U/2) and ρ₋=law(U/2,−U/2).

Each midpoint has couplings to both endpoints of cost 1/6. For any candidate ρ, the triangle inequality gives

    (W₂(μ,ρ)² + W₂(ν,ρ)²)/2 ≥ W₂(μ,ν)²/4 = 1/6.

Thus both midpoint laws attain the minimum and uniqueness fails. This uses the averaged squared-distance objective; the paper's additional factor (1/2) changes the value to (1/12), not the minimizers.

Adopt the revised threshold with probability, finite-second-moment and positive normalized weight assumptions. One qualifying input suffices for uniqueness; the simultaneous Brenier-map characterization of Proposition 3.8 assumes the condition on **every** input. Retain the separate stronger density hypotheses for density estimates. This is a correction of an obsolete manuscript condition, not a new error in the revised source. It does not change the unbuilt status of the barycenter theorem.

## 5. General analytic arcs need biholomorphic charts — confirmed, medium

[L4](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/content/tau-ceti/ConformalMapping/README.md#L118) proposes Möbius reduction for analytic arcs and circles alike. A Möbius preimage of the real axis is a generalized circle. Substituting (z=t+it^2) into its equation (A|z|^2+Bx+Cy+D=0) gives (At^4+(A+C)t^2+Bt+D=0). Vanishing on an interval forces all coefficients to vanish, so no genuine generalized circle contains this parabola.

The holomorphic map (h(z)=z+iz^2) instead has (h'(0)=1), and its local inverse straightens the arc. The pinned [`differentiableOn_chartedSchwarzReflection_of_symmetric`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/Conformal/Reflection/Arc.lean#L160) already works through holomorphic open partial homeomorphisms, with conjugation-invariant coordinate domains, mapping conditions, continuity on the closed side, holomorphy on the open side and the real-boundary condition. These hypotheses are essential to applying its extension formula.

Restrict Möbius reduction to lines and circles; for regular analytic arcs construct suitable local charts and import this theorem. The reviewed coverage already credits charted reflection, so retain the built verdict and do not re-plan that implementation.

## Sources, repair scope and validation

Access date: 2026-09-24. Independently downloaded PDF SHA-256 values agree with the red-team report:

| PDF | SHA-256 |
| --- | --- |
| Agueh–Carlier, August draft, 28 pages | `907a406a29d6c2293ce4ef363376899aaa2235c74a39417b87d119fde2900a52` |
| Agueh–Carlier, December revision, 27 pages | `48d0c809725c7c8abdaa2bc0e698c691f8f3ed4b7221ef50f060f06479bca287` |
| Engel–Nagel, 603 pages | `a48ba290280c718cbf6a65a6b09b4c3c59f622102619fe5b227d446c921a56ff` |

The [reviewed coverage](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/data/library-coverage.json) already qualifies the Bernstein endpoint, positive-definiteness and analytic-arc cases. These findings confirm remaining source-text defects, not new failures of those audited implementations. Preserve the existing upstream owners and qualified library credits. Source corrections should follow the maintained upstream/snapshot process; generated extracts alone are not the authoritative repair.

Only the two named review deliverables change. Required review and two-file intake checks pass. All five finding IDs match exactly. All 14 input guards matched fresh main `6af6b7c02f12d86eb8b32d304d650890cfd9d5fc`; both output paths were absent, and the bot-confirmed claim still belonged to this worker. No suggested Lean file is requested, no Lean source changed and no compilation ran. The counterexamples are mathematical verifications, not newly formalized proofs.
