# FIX-PKG-ColemanIntegration~adv2 — completed

Issue: #10204. Agent: Claude. Session: `claude-L4qPy2`.

## Findings and dispositions

The issue-named `reviews/REV-PKG-ColemanIntegration~adv.md` is not on main. The three earlier package reviews and the previous fix report (`handoff/FIX-PKG-ColemanIntegration~adv.md`, #10180) were read. The operative finding is the manager's owner correction of 2026-10-17 in #10204: the package must not import the Laurent rings of annuli from PadicHodgeTheory P7. Everything from the previous repair is kept. ComputationalNumberTheory stays removed, DirichletPadicLFunctions stays a supplier (TauCetiRoadmap pull request #1039), and the branch interface `iwasawaLog_eq_normalizedLog` is unchanged.

| Finding | Change |
| --- | --- |
| PadicHodgeTheory P7 supplied the Laurent carrier O_K(A(e; r, s)), its restriction maps, Gauss norms and the identity principle. | Every citation is removed: the Scope bullet, the supplier contract, the *Needs* of L0.11, L0.12, L0.14, L0.20, L0.21 and L2.63, the L0.21 and L2.63 proofs, and the L0 and L2 Dependencies. PadicHodgeTheory now appears only under Downstream consumers. |
| Take the rigid identity principle and the affinoid and annulus foundations from the AdicSpaces roadmaps, citing exact sections. | TauCetiRoadmap AdicSpacesPartII §R1.9 (*rigid-identity-principle*, on main) is now a "From TauCetiRoadmap" contract, used through AdicSpacesPartIV §F1.8 (*dagger-identity-principle*, pull request #815) in L1.2 (`daggerAlgebra_identity`) and L1.35. The supplier needs a connected **normal** space; the README now says W_r is a connected smooth curve, hence normal. Residue discs and the reparametrization t′ = u t (1 + h) come from AdicSpacesPartIII §R2.9 (*residue-disc*, `residueDisc_reparam_one`, pull request #813) in L1.2–L1.3. L0.12 cross-references AdicSpacesPartIV §F1.9 (*dagger-polyannulus-de-rham-cohomology* (b)), which gives H¹_dR = K·dX/X for the rigid open annulus with radii in √\|K^×\|. |
| Where none of them states the Laurent carrier, define and prove it in L0 with Checks. | No AdicSpaces roadmap states it. RestrictedPowerSeries puts "general Laurent-series rings" out of scope. NewtonPolygons puts "analytic Laurent/Robba rings" out of scope. PadicFunctionalAnalysis §5.6 is one specific integral annular ring. RigidAnalyticGeometry §6.2 builds annuli as rigid spaces without a Laurent description of their sections. So two new targets were added, L0.A1 and L0.A2. See the next section. |
| The AdicSpacesPartII ids F1, R2 and R3 are stale. | AdicSpacesPartII upstream has only R0–R1 (merged, #817). F0, R2 and R3 are in AdicSpacesPartIII (#813), and R4, R5 and F1 are in AdicSpacesPartIV (#815). The old node numbers F1.17, F1.18, F1.31, F1.34, F1.47 and F1.65 do not exist upstream. Every citation in Scope, the supplier contracts, L1.2, L1.3, L1.5, L1.9, L1.18, L1.21, L1.25, L1.26, L1.35, L1.36, L1.38, L2.13, L3.Fb.1 and the L1–L3 Dependencies now names the upstream roadmap, subsection and slug. |
| Upstream statements narrower than the old wording. | L1.26 claimed a "Banach norm of O(W_r)", but O(W_r) is Fréchet. The bounds are now taken on closed rational subdomains, and A⁺ is cited as a dagger algebra with fringe Banach stages (§§F1.2–F1.3). For L1.18, upstream has no pole-removal target, so the step is now the local computation (a pole of order m gives a pole of order m + 1 of df in characteristic zero) followed by *overconvergent-sections-formula* (§F1.7). For L2.13, integral functions on the closed disc are ℤ_p⟨v⟩ by the maximum principle of TauCetiRoadmap RestrictedPowerSeries §2.4, not by a dagger statement. L1.2 now says that colim_r O(W_r) = S†⊗K for these particular wide opens is its own `daggerAlgebra_eq_weakCompletion`, not a supplier statement. |
| L2.63–L2.65 cited "the existing IsLogLaurentNear/IsLogLaurentAtInfty", which no longer existed. | Both are now API of L0.20, built on the new carrier, and are real-bodied definitions in Suggested.lean. L2.63 has the Lean signature `IsLogLaurentNear.eqOn_punctured`. |
| L0.14 cited P7 without using it. | Citation removed. |

## The new targets

**L0.A1 (Laurent carriers of annuli).** O_K(I) is defined for every nonempty interval I ⊆ (0, ∞): open, closed, half-open, unbounded, or a single radius. Endpoints need not lie in |K^×|. The ring of the open annulus is O_K((r, s)) in the coordinate z − e. The target covers:
- the two-sided Cauchy product, the integral-domain structure and multiplicative Gauss norms with extreme dominant indices n_ρ ≤ N_ρ;
- log-convexity with finitely many breaks on compact subintervals, from NewtonPolygons §§0.3 and 0.5;
- Fréchet completeness, restriction maps and the inverse limit over compact subintervals;
- the end germ ring (the Robba ring as a ring), the inclusion of open-disc series from RestrictedPowerSeries §§7.1–7.2, and the decomposition f = f⁺ + f⁻;
- the derivative, the unit criterion (single dominant index; n_{ρ₁} = N_{ρ₂} on a compact interval), a sub-interval with a single dominant index, and the pullback along t = uT(1 + h).

Sources: Lazard 1962 §§1–2 and Props. 1, 4 and 4 bis; Kedlaya pde §§8.1–8.4.

**L0.A2 (points).** This target gives evaluation at points of ℂ_p, the bound |f(z)| ≤ |f|_{|z−e|}, and attainment of |f|_ρ on circles of radius ρ ∈ p^ℚ through reduction to F̄_p. It counts zeros on a closed sub-annulus as N_{ρ₂} − n_{ρ₁} (Lazard Props. 2 and 4 (2); Kedlaya Prop. 8.3.2), and proves the identity principle for infinite zero sets, nonempty open sets and whole circles.

The Checks of L0.A1 are:
- a radius condition that fails beyond p;
- a member with infinitely many negative terms, which is no formal Laurent series;
- the maximum versus ℓ¹ Gauss norm;
- a multiplicativity witness at ρ = 1 and ρ = p^{-2};
- the unit criterion for T − p on (1/p, 1), against its tie at 1/p;
- derivatives having no T^{-1} term.

The Checks of L0.A2 are:
- an annulus without ℚ_p-points;
- T^p − T, whose maximum is not attained at ℚ_p-points;
- the zero count of T − p;
- finitely many roots of unity, which do not force vanishing;
- a radius p^{√2} with an empty circle;
- agreement with Tau Ceti's `TauCeti.laurentEval` on Laurent polynomials.

Most Checks are mirrored by Lean `example`s.

## Move-down record for PadicHodgeTheory

PadicHodgeTheory Layer 1, §§1.1–1.3, plans the same carrier (`AnnulusRing`, `gaussNorm`, restriction, evaluation, zeros, units, derivative), and its Robba ring is the union of the carriers on (r, 1). After this fix those notions are owned by ColemanIntegration L0.A1–L0.A2, stated for every interval of radii so that nothing is lost. PadicHodgeTheory should import them and keep its own topology of the Robba ring, the bounded, integral and cyclotomic rings, Frobenius and Γ-actions, and scalar extension. ColemanIntegration lists PadicHodgeTheory as a downstream consumer.

## Adversarial pass on the touched statements

| Statement | Instances tried | Result and change |
| --- | --- | --- |
| `IsLaurentOn I a` | I = ∅, which holds vacuously; a single radius, which is the closed-circle ring; I = (0, ∞) with a_{−n} = p^{n²}; I = (1/p, p) against (1/p, p²) with a_n = p^{\|n\|}; endpoints outside \|K^×\|; K of characteristic p | Statements that need a radius carry `I.Nonempty`, interior or membership hypotheses. The predicate does not use characteristic zero. Both families have Lean examples. |
| `IsLaurentOn.laurentMul` | a = 0; I = ∅, where every family qualifies and a Cauchy sum need not converge; ρ = 0, where only n = 0 survives; ρ < 0, where the condition is that of \|ρ\| | The theorem states coefficientwise summability as well as membership, so it carries `I ⊆ Ioi 0` and `I.Nonempty`. |
| `laurentGaussNorm_laurentMul` | ρ = 0 with a = b = T + T^{-1}: the junk norm is ‖a₀‖ = 0, but the product has c₀ = 2 | False without positivity, so `hρ0 : 0 < ρ` is kept. Witnesses at ρ = 1 and ρ = p^{-2} for (T + p)(T^{-1} + p); a weighted ℓ¹ norm fails at |T + p|₁. |
| `isUnit_laurentOn_iff` | a = 0 with I = ∅: the right side holds vacuously, the left fails; I = {1/p} or (p^{-2}, 1) with T − p (tie at 1/p); I = {1, 4}, which is not an interval | `hne : I.Nonempty` and `I ⊆ Ioi 0` are kept. Interval-ness is not needed: the carrier and the dominance condition at two radii propagate to the hull, since each term is log-affine in log ρ. The closed-interval form n_{ρ₁} = N_{ρ₂} is in the README (Lazard Prop. 4 (1)). |
| `exists_subinterval_single_dominant` | a single radius (empty interior); a = 0; finitely many breaks on (p^{-2}, 1) for T − p | Hypotheses `interior I` nonempty and `a ≠ 0` are kept. |
| `laurentGaussNorm_eq_max_on_circle` | c = 0, which is excluded; a = 0, where w = c attains the value 0; T^p − T at ℚ_p-points | True over ℂ_p. The ℚ_p negative control is a Lean example. Radii outside p^ℚ have no points, which the README states. |
| `finite_zeros_closedSubannulus` | ρ₁ > ρ₂ (empty set); ρ₁ = ρ₂ = 1/p for T − p (one zero); a = 0 (excluded); ρ₁ = 0 (excluded, junk value at w = 0); T^{p−1} − 1 on \|z\| = 1 | Count N_{ρ₂} − n_{ρ₁} recomputed: 1 − 0 at 1/p and 1 − 1 at 1. The p = 2 case z − 1 has one zero. |
| `eq_zero_of_eval_eq_zero_on_open` | U = ∅ (excluded); U inside one circle; I containing 0 (excluded by `I ⊆ Ioi 0`) | A nonempty open set of ℂ_p is infinite and meets a single circle, so (d) applies. |
| `IsLogLaurentNear`, `IsLogLaurentAtInfty`, `IsLogLaurentNear.eqOn_punctured` | changing f only at c; r just below 1; L an arbitrary function versus a branch, with the indicator of \|z\| < 1/p | The value at the puncture is unconstrained, which is now a Check and a Lean example. The outer annulus contains circles of two radii, which L0.21 needs. The Lean statement carries 0 ≤ r < 1, as the README does. The indicator has an expansion when L is itself an indicator but none for a branch, so the branch hypothesis is essential (Lean example). |
| L0.11, L0.12, L0.20, L0.21, L2.63 citation changes | The end germ through `LaurentOn.endGerm`; the coordinate change through `LaurentOn.pullback` with \|u\| = 1 and \|h\|_ρ < 1; L0.12 against Part IV, whose radii lie in √\|K^×\| | Statements unchanged. L0.12 keeps arbitrary real radii and the end germ, and says how it differs from the upstream statement. |
| L1 citation rewrites | the hypotheses of each upstream target: weak completion and *mw-morphism-lifting* need a complete DVR of mixed characteristic, which holds since K/ℚ_p is finite; the identity principle needs normality; GAGA is applied over K | Matched, or the wording was changed as in the table above. No L1–L3 statement changed. |

## Sources and library boundary

All descriptions are in this worker's own words.

| Source | Passages read | SHA-256 |
| --- | --- | --- |
| M. Lazard, Publ. Math. IHÉS 14 (1962), 47–75 (Numdam PMIHES_1962__14__47_0) | §1 (1.1)–(1.9), pp. 48–49; §2, Prop. 1 and (2.5)–(2.6), pp. 50–51; Prop. 2, pp. 53–54; Prop. 4 and 4 bis, pp. 55–56 | `8d18aea92a0857251622ce008e8204c8fb353a5127a179e71fcce2bb73ffaf31` |
| K. S. Kedlaya, *p-adic Differential Equations*, CUP 2010 (author copy, kskedlaya.org) | §8.1, Defs. 8.1.1–8.1.5, pp. 136–137; §8.2, Def. 8.2.1–Lemma 8.2.6, pp. 138–140; §8.3, Props. 8.3.1–8.3.2, pp. 140–141; §8.4, Defs. 8.4.1–8.4.3, pp. 143–144 | `e752a2fbd732b59f1beb452cc633a509ada1f1ce5d384394443dd02c79ffdc3d` |

The upstream roadmaps were read as follows:
- TauCetiRoadmap main at `350e970ce49f707a327909beac0b7b7c782cc7ee` (fetched read-only through the API): AdicSpacesPartII §R1.9, RestrictedPowerSeries §§1.1, 2.1, 2.4, 3.2 and 7.1–7.3, NewtonPolygons §§0.3, 0.5 and 2.2–2.3, RigidAnalyticGeometry §§2.2 and 6.2, and PadicFunctionalAnalysis §5.6.
- AdicSpacesPartIII and AdicSpacesPartIV, from the open-pull-request copies that the issue names.

The library boundary was checked at the pins. Mathlib's `LaurentSeries` is `HahnSeries ℤ`, whose supports are bounded below, so it cannot carry an annulus ring when inf I = 0. It is used only as a comparison. Neither Mathlib nor Tau Ceti at the pins nor the current Tau Ceti (`a91d3aaf`) has an analytic Laurent carrier. Pinned Tau Ceti has `TauCeti.laurentEval` (evaluation of Laurent polynomials at a unit, module `TauCeti.Algebra.Polynomial.Laurent`). It is now imported and checked against L0.A2. The package's evaluation is named `laurentSeriesEval` to avoid confusion with it.

## Validation

- `lean-check research/blueprint/packages/ColemanIntegration/Suggested.lean`: exit 0, with 94 warnings, all `declaration uses sorry`, and no other diagnostics. Before this fix there were 73 sorry warnings. The file has 860 lines. Its real-bodied definitions are `IsLaurentOn`, `laurentGaussNorm`, `laurentMul`, `laurentSeriesEval`, `IsLogLaurentNear` and `IsLogLaurentAtInfty`, and `IsLaurentOn.mono` has a real proof.
- `python3 scripts/check_sorry_data.py` on the file: exit 0.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems. `git diff --check` is clean.
- A scripted comparison against main found that all 209 previous `###` targets are present and that no API entry was lost; 23 API entries are new. The Checks headings rose from 66 to 68 and the Lean examples from 46 to 59. Every name in an *In `Suggested.lean`* line is declared in the file, and every Lean declaration is named in the README.
- A Sonnet cross-check of README against Lean and of every new upstream slug found no missing slug. It found four loose descriptions and a few Checks without Lean mirrors, and all were fixed:
  - Theorem A is *quasi-stein-theorem-a*;
  - *residue-disc* is for rational points, with `residueDisc_unramified_split` for the rest;
  - *mw-morphism-lifting* gives existence only;
  - the carrier bridge of *rigid-identity-principle* is now stated.
- The packet is unchanged.

No unresolved finding remains for this issue. PadicHodgeTheory's plan of the same carrier needs to be pointed at L0.A1–L0.A2 by that roadmap's next job.
