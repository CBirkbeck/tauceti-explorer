# REV-PKG-IntegralIwasawaTheory~codex2 — completed independent review

Codex session `codex-Kz5ezx`, issue #11371, 20 October 2026. One job only. The claim bot confirmed this session's claim at issuecomment-6290049377. Verdict: **accepted with in-place corrections**, not a checkpoint. This worker did not author the original package, available prior independent review or intervening fix.

The durable record is `reviews/REV-PKG-IntegralIwasawaTheory~codex2.md`, relative to `research/blueprint/`. It lists the actual inputs, every earlier finding, this review's fixes, all historical source flags, fifteen randomly sampled locators, the current-library audit, subsection-by-subsection adversarial pass and ten Lean signature checks. The issue template's Mordell title, monolithic packet and missing `~codex` report are mismatches; the actual accepted inputs are the 68-, 53- and 27-record arithmetic Iwasawa parts and the existing `~adv` review. Do not invent a missing rejection or use the fix worker's self-acceptance as independent review.

## What changed

Only package README, Suggested.lean's closing inventory, review.json, the new report and this handoff are changed. Metadata is still the valid one-line math.NT category. No packet, link map, other roadmap, library or upstream checkout was edited.

The remaining ColemanPowerSeries supplier cycle was repaired by moving the necessary construction down into IntegralIwasawaTheory Layer 7. This is the ownership adjustment the maintainer needs to propagate to the later Coleman roadmap:

| New owner | Targets / contract for downstream reuse |
| --- | --- |
| §7.1 | `colemanSeriesBasis`, `colemanNorm`, `colemanTrace`, `colemanTrace_eq_p_psi`, `localUnitNormLimit`, `colemanInterpolation`: every prime, every finite unramified E/ℚ_p; native norm/trace, integral ψ, local integer rings and relative bases, Frobenius-corrected interpolation, topology and equivariance. |
| §7.2 | `colemanLogDerivative_surjective`, `arithmeticColeman`, `principalColeman_exact`, `principalColeman_plusEquiv`: odd p; first-moment endpoint and Tate kernel; finite free commutative coefficient transport. |
| §7.3 | `realPrincipalCircularClosure`, `realCircularClosure_generator`, `realCircularClosure_colemanImage`: actual closed principal real unit subgroups, corrected compatible generator, unconditional quotient by Iζ_p. |

ColemanPowerSeries must consume these targets rather than supply them back to IntegralIwasawaTheory or independently replan them. Its further extensions remain its own. There is no upward supplier citation in the revised package; the roadmap is named only as a downstream consumer. The allowed scope of this job did not include changing its packet or README.

The normalizations need to survive that update:

- `a≥1` indexes roots of order p^a. For unramified E, `Nf=Σf` and `f(π_a)=σ_a^(a−1)u_a`; the projector is the limit of `(Σ⁻¹N)^n`. At p=2 the compatible root tower is signed and interpolated by −(1+T).
- `arithmeticColeman` is the negative of RJW's raw derivative composite. Proposition 10.4 and Lemma 10.5 pin the sign against the canonical Dirichlet zeta numerator. Its endpoint is ∫x, not total mass.
- The principal real circular generator is `ω(b)⁻¹ζ^((1−b)/2)c(b)`, with the half taken p-adically. It may be local, but its (p−1)st power is global. Its image is `([b]−1)ζ_p`.
- The plus equivalence uses odd p. The integral norm/interpolation does not acquire that restriction. Finite free coefficient transport of the odd-prime sequence is different from changing the arithmetic field to E.

The original 148-node package crosswalk in `handoff/PKG-IntegralIwasawaTheory~codex.md` is preserved with old §§7.1–7.4 now §§7.4–7.7. The rational equivalence target moves from §6.5 to §7.8, after its construction prerequisites. Closure comparison uses new §§7.1–7.3 as well as §7.5. No accepted target is dropped. Layer 7 includes Layer 5 for its μ comparison.

Other corrections: clarify full characteristic ideal versus NSW characteristic polynomial (the former retains p^μ); extend the Burns–Flach finite-coefficient locator through p. 80; identify current Tau Ceti prerequisites that postdate f790474; add explicit closure, Mellin and Coleman checks. The eleven prior independent corrections and the earlier SpecialValues/EulerSystems dependency fixes remain intact. The README's full detail takes precedence over the issue's older size ceiling under the explicit 12 October PACKAGE_REVIEW rule.

## Validation and versions

- Final `lean-check`: exit 0; ten declaration-uses-sorry warnings only, no other warnings/errors, 299 lines. Eleven real-bodied light definitions, ten theorems and 21 proved examples; the code declarations themselves did not change.
- `scripts/check_sorry_data.py`: exit 0.
- All three accepted packet checks: exit 0, zero errors/warnings, 148 records in total. Historical I.8 source-access flags were checked in original public sources; packets were not mutated.
- Intake `check-files`: zero problems; `git diff --check`: clean.
- Baseline Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474`; current read-only Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`. No build was run in current upstream checkouts.

The source-check table and reference versions are in the review report. Scanned original pages were read for Burns–Flach, both Sinnott papers, Ferrero and Washington; the uncleared Washington book was not used. Source files and transient logs are scratch only and need not be retained. No suspicious instructions were encountered in untrusted material. Nothing remains for this job beyond submission; formalisation and the downstream ownership update are future work by their respective owners.
