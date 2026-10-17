# Independent package review (round 2): AnalyticNumberTheory

Issue #10162, job `REV-PKG-AnalyticNumberTheory~2`. Reviewer: Claude, session `claude-LcJ088`, 17 October 2026. I did none of `PKG-AnalyticNumberTheory` (Codex `codex-PVngDz`, PR #10128), the first package review (Codex `codex-P07c10`, PR #10138) or the fixing pass (Codex `codex-f2xL7E`, PR #10192). This is a completed fixing review. Verdict: **needs_changes**, for one defect I could not fix in place: Layers 0–2 duplicate the open upstream roadmap ZerosOfLFunctions (TauCetiRoadmap PR #253). The residue is set out below. Everything else I found is fixed in this pull request.

## What was reviewed

The current main package: README (7,702 lines before this review), Suggested.lean (538 lines), metadata.toml (`topic = "math.NT"`, kept). I re-checked the seven findings G1–G7 of [the first review](REV-PKG-AnalyticNumberTheory.md) against the repair recorded in `handoff/FIX-PKG-AnalyticNumberTheory~adv.md`. I read PACKAGE_REVIEW, WORKERS, PROTOCOL §§5, 12–13, 20 and UPSTREAM_GUIDE.

**The duplication baseline is current TauCetiRoadmap main.** The read-only TauCetiRoadmap checkout provided to workers is not main. It is the branch `roadmap/integral-hecke-and-galois-determinants` at `0d144d04`, and that commit is not on GitHub. The earlier reviews used it. I therefore fetched every README.md and Suggested.lean of GitHub main at `350e970ce49f707a327909beac0b7b7c782cc7ee` (216 files) and audited against those. Main differs from the checkout in two ways that matter here:
- ArithmeticDirichletSeries and UniversalCovers have moved to `Completed/`.
- OperatorAlgebraDynamics, NoncommutativeGeometry, HeightsAndUnits, CompactOperators and others are new.

For the library I used Tau Ceti `a91d3aaf`, read in place. I ran nothing in either checkout.

## The first review's findings, re-checked

| Finding | State on main before this review | Disposition now |
|---|---|---|
| G1 scalar spectrum, heat trace, Gaussian trace | Repaired: the P7–P7a realization (PseudodifferentialOperators PR #952) plus the local kernel, multiplier, trace and Weyl chain. | Mathematics verified (table below). The heat kernel, the Gaussian transform `g_t(v)=e^{−t/4−v²/4t}/√(4πt)` and the heat coefficients all check, using M₀=1/48 and M₁=7/1920 to get a₀=A/4π, a₁=−A/12π and a₂=A/60π. The derived values ζ₊(0)=−(g+2)/3 and the genus-one determinant D(u)=u·exp(−ζ₊′(0)+F′(1)u)∏(1+u/λ)e^{−u/λ} also check. I corrected the scope of P7 versus P7a against the supplier text. **Closed.** |
| G2 Bost–Connes completion, strip KMS, measured factors | Repaired with local Følner and strip arguments plus VonNeumannAlgebras (PR #889). | The local generic arguments duplicated **OperatorAlgebraDynamics** D1/D2/D7, which is now on TauCetiRoadmap main. I replaced them by those exports (next section). VonNeumannAlgebras V0/V1/V2/V4/V8/V11 hold the cited content at both the cited and the current head. **Closed.** |
| G3 fixed-degree arithmetic chain, Zaman 35/19 | Repaired. | §2.9 is exactly Zaman's thesis, Theorem 1.3.1, pp.11–12, read in the source: the exponents are 19 and 35, D_L is large, and C={1} with L=F=k. §2.16 matches Louboutin's bound κ_K≤(e log D_K/2(d−1))^{d−1}. §2.33's Lean form is the two-sided D^{1/2±ε} statement. Formalizing the proofs needs finite numerical certificates. Those are steps of sourced theorems, not missing prerequisites. **Closed.** |
| G4 prime, character, Hilbert and Gamma proofs | Repaired. | I verified the Montgomery–Vaughan constants. The 3π/2 Hilbert inequality gives the 6π mean-square error on [−T,T], since 1/δ_n≤n+1≤2n. Most of these targets are among the #253 duplications in the residue. **Closed as mathematics; superseded by the #253 residue.** |
| G5 multiplicative counts, Sathe, Shiu, Beurling | Repaired. | I spot-checked §§3.13, 3.14, 3.22, 3.39 (table below). **Closed.** |
| G6 cubic distributions, order one, Bochner, Fourier uniformity | Partly repaired. Three leaves were left "unresolved". | (a) Rank-one Fourier bound: the target claimed one constant on the whole half-plane Re z>1, but its proof and every consumer use fixed strips. I restated it on 1<Re z≤M with C_{F,ℓ,M}. (b) Nonarchimedean local distributions: restated as a sourced target, Datskovsky–Wright Theorem 3.2, p.47, proved from Igusa 1984, Theorem 1 (Amer. J. Math. 106, 1013–1032; DW reference [15]). (c) Order one: Datskovsky–Wright Theorem 6.2(ii), p.71, with the quantitative proof in Wright's Harvard 1982 thesis (DW reference [30]). Both are publicly stated theorems. Their proof sources are not freely online; see the maintainer notes. **Closed.** |
| G7 complex Hurwitz/Lerch, Barnes sector | Repaired. | I checked §4.16 (ζ_H(−m,c)=−B_{m+1}(c)/(m+1), and B₁(c)=c−1/2 matches Mathlib's `Polynomial.bernoulli`), the odd Lerch multiplier +i in §4.10, B₄−B₄(1/2)=−1/16, and G(4)=2, G(5)=12, G(0)=0. **Closed.** |

## Fixes applied in this review

1. **OperatorAlgebraDynamics (current main) removals in Layer 6.**
   - Added a supplier contract "From OperatorAlgebraDynamics" for D1, D2 and D7.
   - §6.23 no longer constructs crossed products. It consumes D1–D2 (full and reduced crossed products, the universal property), D2 (the faithful expectation, and full = reduced for amenable groups) and D7 (the dense entire-core KMS criterion).
   - The general "Følner compression" theorem is replaced by its specialization to Q_+× (`bcCrossedProduct.full_eq_reduced`). The general "entire spectral core to bounded-strip KMS" theorem is replaced by verifying D7's hypotheses for the BC core.
   - The strip-bound and core-equivalence ingredients, the corner expectation, and §6.36's KMS∞ ⇒ ground-state step now cite D7 and D2.
   - The deleted API names are `crossedProduct.covariantLift`, `crossedProduct.abelian_norm_eq`, `crossedProduct.amenable_norm_eq` and `crossedProduct.expectation_coeff`. They are replaced by `semigroupCorner.norm_eq_regular`, `cornerExpectation.coeff` and `bcCrossedProduct.full_eq_reduced`.
   - The BC-specific completion, the Laca dilation corner, the scaling-measure correspondence and the measured classification stay.
2. **Moved or broken upstream links.**
   - ArithmeticDirichletSeries: 47 links repointed to `Completed/ArithmeticDirichletSeries`, whose layer anchors are unchanged.
   - UniversalCovers: repointed to `Completed/`. Its supplier paragraph now names the current-library declarations `TauCeti.UniversalCover`, `TauCeti.UniversalCover.isCoveringMap`, `deckFundamentalGroupEquiv`, `SubgroupQuotient`, `isCoveringMap_subgroupQuotientProj`, `IsCoveringMap.isRegular_iff_normal_range` and `deckSubgroupQuotientProjEquivOfNormal`, and states the library's prepend-inverse loop convention.
   - AutomorphicSpectralTheory: the pinned SHA was truncated to 39 characters. It is now `64380dd1…`, where §1.5 exists.
   - GlobalNumberFields Layer 11: was pinned to the local-only `0d144d04`. It now points to main, where Layer 11 and `narrowToPic`/`narrowClassToClass` exist.
   - All 31 TauCetiRoadmap tree links now resolve against main `350e970c`. All 1,539 internal links resolve.
3. **Process residue.**
   - Removed 53 atlas packet-node suffixes (for example "AS.1 — dit-57", "— hecke-l-functional-equation") from *Needs:* lines.
   - Restated 36 sentences that spoke of "recorded gaps", "unresolved inputs", "the gap ledger", "stale 40", "previously unverified" or a "proof-closure certificate" as the mathematical steps or sources they stand for.
   - Retitled "0.9 Siegel's theorem (black box)" and its anchor.
   - Removed the "Caraiani–Newton 94-roadmap subset" sentence.
   - Removed a packet id from a Lean docstring.
4. **Duplicate titles.** §§0.25/0.31 are now Mertens's second and third theorems. §§2.14/2.15 are the real and imaginary quadratic Siegel bounds. §§3.9/3.12 are the coprime Möbius sums weighted by log t/t and by 1/t.
5. **Locators.**
   - Koukoulopoulos (3.4)–(3.5) are on printed pp.37–39, not 38–39.
   - In Neshveyev math/0002141v1 the unique W-invariant measure is on p.1, not p.2.
   - The Igusa and Wright-thesis references are completed from DW's bibliography.
6. **Scope text.** ArithmeticDirichletSeries is described as completed, and the operator boundary paragraph now names OperatorAlgebraDynamics and VonNeumannAlgebras.
7. **Lean.**
   - The `partialIdealZeta` docstring now says it is the ordinary-class instance; the README also allows narrow classes.
   - The packet id is gone from the D=−4 Gauss-sum docstring.
   - No signature changed.

## Remaining defect: duplication of ZerosOfLFunctions (TauCetiRoadmap PR #253)

ZerosOfLFunctions is PR #253 by roed-math, open since 2026-08-17 and last updated 2026-10-14. MergeQueue.md puts it in wave 1. It is the roadmap that merged Chebotarev ("The boundary with Zeros of L-functions … layer 8.7 owns the effective theory") and Completed ArithmeticDirichletSeries ("zero counting, zero-free regions, explicit formulas, and effective estimates (`ZerosOfLFunctions`)") name as owner of this territory.

Our own upstream AutomorphicLFunctionsAndLocalFactors PR #924, which this package consumes as AL.0/AL.1, already takes `OrderLE` and Hadamard factorization from #253 layers 0 and 5.1–5.6. Depending on #253 therefore adds no new sequencing constraint. Re-planning its targets here would put two upstream roadmaps on the same theorems. I read #253 at `cce2e041`. The fix round should replace each duplicated target by a citation of the #253 milestone, keeping only an adapter where this package's statement is genuinely different:

| This package | ZerosOfLFunctions #253 | Relation | Action for the fix |
|---|---|---|---|
| §0.14 `EntireOrderAtMost` (and the Lean definition) | Layer 0.1 `OrderLE` | same notion; ours bundles ρ≥0 and entirety | consume `OrderLE`; Lean: cite or drop the definition and its examples |
| §0.15 genus-one factor E₁ | Layer 5.3 | identical | consume |
| §0.26 Hadamard at order ≤1 | Layer 5.4–5.6 | ours allows a zero at 0 (factor z^m); #253 assumes f(0)≠0 | consume plus a one-line z^m adapter |
| §0.16 `riemannXi` | Layer 0.2 `entireCompletion` (for ζ, s(s−1)Λ(s), normalization 1) | ξ is half of it | keep the light definition, with the comparison to the entire completion |
| §0.17 weak ζ convexity; §2.22 Hecke convexity | Layer 3.3–3.4 strip bounds for the two families | ours at K=ℚ is a special case; §2.22's explicit Thorner–Zaman form may be finer | consume §0.17; keep §2.22 only where it is stronger, stating how |
| §1.8, §1.11 and the sector Gamma remainder | Layer 1.2–1.4 (log Γ on sectors, \|Γ\| on vertical strips, digamma) | same estimates; #253 states the additive log form with O(1/\|t\|) | consume; keep derivative bounds #253 lacks |
| §1.4 finite zero multiset | Layer 4 divisor and zero count | overlapping carriers | consume #253's divisor/zero count |
| §0.28 ζ zero-free region | Layer 6.2 at K=ℚ | special case | consume |
| §0.35 conductor-uniform Dirichlet region | Layer 6.4 at K=ℚ (constant depends only on the degree, before the field and character) | special case via the Dirichlet-to-ray-class dictionary | consume plus a K=ℚ dictionary adapter |
| §0.1, §0.21 exceptional zero, uniqueness, simplicity | Layer 6.3 `IsExceptionalZero` and its `unique`, `divisor_eq_one`, `sq_eq_one` | ours is c-parametrized for Koymans–Pagano's c_star | consume uniqueness and simplicity; keep the parametrized predicate only as an adapter |
| §2.44 Dedekind/Hecke regions | Layers 6.2–6.4 | per-character region overlaps; ours (i) is the product over an abelian extension's characters | consume the per-character region; keep the product statement as a corollary |
| §1.13 Riemann–von Mangoldt | Layer 7.4 | identical for ζ | consume |
| §1.9 truncated explicit formula; §1.12 Weil formula | Layers 8.2–8.4 | §1.9 is the K=ℚ case; §1.12 (Mestre's formalism for pairs) is more general | consume §1.9; keep §1.12 only if a consumer needs Mestre's generality |
| §1.14 PNT remainder | Layer 8.5 at K=ℚ | special case | consume |
| §0.22 character PNT uniform in N; §2.50 effective Chebotarev | Layers 8.6–8.8 (fixed χ or fixed field, abelian) | ours are uniform or nonabelian, which #253 excludes | keep; cite 8.6 and 8.8 for the fixed-family shapes |

Outside #253's declared scope, and therefore kept:
- Siegel's theorem and Siegel–Walfisz.
- Higher-genus factors (§§0.18, 0.27).
- Explicit numerical constants (§§0.3–0.8).
- §§1.5, 1.6, 1.10, 2.39.
- Artin L-functions and everything in Layers 3–6.

#253 states its theorems on LFunctions (#248) records for Dedekind zeta and Hecke characters. The K=ℚ Dirichlet statements here need the dictionary from Mathlib's `DirichletCharacter.LFunction` to those records. That dictionary is the adapter the fix should state once.

The ownership choice is the maintainer's: either consume #253 as above, or record a deliberate exception. I did not make it in this review.

## Independent source sample

I took 15 numbered sections with `random.Random(10162).sample`, over the 242 headings in order. I read every quoted location myself.

| Section | Source and location checked | Result |
|---|---|---|
| 0.22 | Bennett–Siksek, Annals 191, Theorem 5 (26), p.374 | Matches (primitive χ, error with (log N)⁴, effective c). |
| 2.15 | Duke–Imamoḡlu–Tóth, §6, pp.967–968 | Siegel used for the main term ≫ \|D\|^{1/2−ε}, ineffective. |
| 2.48 | DIT (6.7), proof of Proposition 2, pp.968–969 | Matches. |
| 2.51 | Tsimerman, proof of Corollary 3.3, pp.383–384 (Brauer–Siegel applied to L(1,ρ)) | Supports the derived two-sided bound. |
| 3.20 | Hildebrand–Tenenbaum, pp.411–414 | Matches. |
| 3.22 | Koukoulopoulos, Theorem 3.3 p.39, Theorem 1.11 p.15, (3.4)–(3.5) pp.37–38 | Matches; page range corrected. |
| 3.39 | Skorobogatov–Sofos, §3.1 definitions, p.691 | Matches (Λ₁, Λ₁z, E_z). |
| 4.2 | Lagarias–Li II, (1.3), p.2 | Matches. |
| 5.7 | LOWW Proposition 3.7, pp.12–14; Wright Part I pp.511, 516 (page images) | Matches, including the right-quotient G_A/G_k and Theorem 4.1. |
| 5.23 | LOWW Lemma 3.8, p.13 | Matches; Proposition 3.7(3) has Γ(s)²Γ(s∓1/6) in the numerator, as in §5.20. |
| 6.4 | Sarnak (1.1)–(1.5), p.603 (page image); JSS §4, pp.13–14 | Matches. |
| 6.40 | Neshveyev, Corollary and proof, p.3 | Matches; the W-invariant-measure locator is corrected to p.1. |
| 6.45 | Connes–Marcolli Definition 3.6 p.446; (3.135), (3.139) p.475 | Matches. |
| 6.47 | Connes–Marcolli Theorem 3.32, (3.136)–(3.137), pp.474–475 | Matches. |
| 6.48 | Connes–Marcolli Theorem 3.32 pp.474–475; Proposition 3.8 p.447 | Matches. |

I also checked Zaman's thesis Theorem 1.3.1 (pp.11–12) for §2.9, and DW's bibliography (p.75) for the Igusa and Wright-thesis references. The supplier exports were checked at their pinned and current heads:
- P7/P7a in PR #952.
- V0–V11 in PR #889.
- Layers 5–6 in PR #821.
- AL.0's admissible class in PR #924; `tateClass` is a README name there, not a Lean declaration.
- §§1.2–1.5 in PR #925.
- GN Layer 11 on main.

## Adversarial pass on what changed

| Statement | Instances tried | Result |
|---|---|---|
| Rank-one Fourier bound (rescoped) | Re z→1⁺; Re z→∞; ζ_F(σ)≤C/(σ−1) for large σ | False for large σ, so a strip-uniform constant is the correct claim. The smoothing contour and 2<w≤M lie in a fixed strip. |
| Full = reduced for Q_+× | B=ℂ trivial action; free group F₂ | The F₂ case shows the amenability hypothesis is needed. Q_+× is free abelian on the primes, so the all-abelian theorem is the input. |
| Dense-core KMS for BC | σ_t(μ_n e(γ)μ_m*)=(n/m)^{it}(·); r=2, β=1 gives 1/2; trivial dynamics on M₂ | The two forms of the identity, φ(aσ_{iβ}b)=φ(ba) and φ(ab)=φ(bσ_{iβ}a), coincide after renaming. |
| KMS check at β>1 | φ(x′₂σ_{iβ}x₂)=2^{1−β}=φ(x₂x′₂), using φ(e(1/2))=2^{1−β}−1 | Consistent with (3.138)/(3.139). |
| Heat coefficients | M₀=1/48, M₁=7/1920; genus 2 | a₁=−(g−1)/3=χ/6; ζ₊(0)=−4/3. |
| Weyl via heat | N(R)≤e·H(1/R); moments R⁻¹H((k+1)/R)→A/(4π(k+1)) | Correct. |
| Genus-one determinant | second log-derivative −Σ(λ+u)⁻²; linear term | F′(1) is the finite part of ζ₊ at 1. Correct. |
| DIT completions | d=−4: Λ_std=1, Λ_DIT=√π/2 at 0 and 1; d=−3: 1/√3 and √π/3 | Recomputed from L(0,χ)=h/(w/2) and L(1,χ). Correct; the Lean witnesses agree. |
| Mean square / Hilbert | 3π/2 constant; δ_n≥1/(n+1) | The error 3πΣ(n+1)\|a_n\|²≤6πΣn\|a_n\|² on [−T,T] holds. |
| Lean `riemannXi` | Λ=Λ₀−1/s−1/(1−s) | s(s−1)Λ/2=s(s−1)Λ₀/2+1/2. Correct; symmetry and ξ(0)=1/2 hold. |
| Lean `DirichletGRH` | non-primitive χ; s=1 for χ=1; zero at 3/4+it | Deleted Euler factors and trivial zeros are excluded by Re s>0. Correct. |
| Lean `barnesG` | G(1)=1, G(0)=0, G(4)=2, G(5)=12 | The product form matches §4.3. |
| Lean `smoothCount_eq` | p<⌊y⌋+1 ⇔ p≤y for y≥0 | Correct. |

## Lean

`lean-check` on the corrected Suggested.lean (539 lines) exits 0 with exactly 60 `declaration uses 'sorry'` warnings and no other diagnostics, at Mathlib `082e2d37e8` and Tau Ceti `f790474`. `scripts/check_sorry_data.py` passes.

I compared every declaration with its README statement: the hypotheses are present and the generality matches, except the ordinary-versus-narrow class note now recorded in the docstring. There are no `True` placeholders, sorry'd data or auxiliary theory development. Heavy carriers are listed in the closing comment.

## Validation

- `python3 research/blueprint/intake.py check-files` on the six changed files: 0 problems.
- `git diff --check`: clean.
- Internal links: 1,539 links, 547 explicit anchors, none unresolved, no duplicate ids. Upstream tree links: 31 of 31 resolve on main `350e970c`.
- All 80 definition/construction sections keep at least three discriminating Checks. No numbered target was removed or renumbered (still 242 sections).
- No packet, atlas data or other roadmap was edited. No source passage was copied.

## Notes for the maintainer

- The local TauCetiRoadmap checkout used by workers is a stale feature branch, not main. Duplication audits run against it miss merged roadmaps such as OperatorAlgebraDynamics.
- This package's draft PR needs, beyond its CN tiers:
  - our open PRs #924, #925, #851, #871 and #792;
  - other authors' #253 (and through it #248);
  - #952, #889 and #821. OperatorAlgebraDynamics itself cites #821.
- Proof sources not freely online: Igusa 1984 (Amer. J. Math. 106), Wright's 1982 Harvard thesis, and the Davenport, Iwaniec–Kowalski, Montgomery–Vaughan and Ingham textbook routes cited in Layers 0–1. The last group largely disappears if #253 is consumed.
