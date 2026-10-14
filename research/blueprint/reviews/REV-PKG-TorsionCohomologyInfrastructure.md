# REV-PKG-TorsionCohomologyInfrastructure

Independent package review of `research/blueprint/packages/TorsionCohomologyInfrastructure/` (README, Suggested.lean, metadata.toml) against the accepted plan `research/blueprint/packets/TorsionCohomologyInfrastructure.json`. Reviewer: Claude (Opus 5.5), session `claude-jsrZKA`, 2026-10-14. I did no part of the package job.

**Verdict: accepted**, with the corrections below applied in place.

## What was checked

1. **Upstream form.** The README follows the TauCetiRoadmap shape: an opening Summary; Scope and ownership; Conventions, including a Frobenius witness; Exact supplier contracts; How to read the build; Layers 0, 2a, 1, 2, 3a, 3b and 4, each with Examples and Dependencies; then Corrections to the published sources, Downstream consumers and References. A scripted sweep found no process language. Every subsection that defines or constructs something has at least three Checks.
2. **Fidelity to the plan.** A Sonnet agent compared all 38 plan targets with their README sections: statements, hypotheses, API, tests, acceptance lines and locators. It flagged 62 items, and I read each against the packet.
   - Most were wording differences or items stated once in Conventions or Scope.
   - Some flags are ownership changes the packager made deliberately and recorded in the README's "Owned specialisations" paragraph: four supplier requests became owned targets. Two of them, Scholze Lemma 5.3.13 and Chenevier Lemma 3.8, I checked against the current upstream IntegralHeckeAndGaloisDeterminants, which states neither. A third, trace integrality, would belong to AdicSpacesPartII R3, whose R3.58–R3.59 give only finite locally free traces. The fourth, the ALS boundary filtration, was not re-checked; I took the packager's supplier check.
   - Another flag is the deliberate replacement of the tier-26 ML.4 citation by the hypothesis (EC).
   - Five flags were real, and are fixed below: the §2a.1 example, integral H¹ in §1.6, the triple-overlap condition in §0.2, the symmetric space in §4.8, and the Tor term in §4.4.
3. **Sources.**
   - **Scholze locators, all of them by script.** Each `[Scholze, …]` chunk and each Corrections item was checked against the published Annals PDF (sha256 `ebac854f…`, matching the packet). Each label must occur on its cited printed page. The real misses are fixed below; the others were artefacts of multi-locator parsing.
   - **Caraiani–Le Hung, by hand.** Remark 3.1 p.8, Lemma 3.2 p.8, Proposition 3.3 and Remark 3.4 p.9, Theorem 4.5 pp.11–12 are correct. The `GL_3` counterexample to the exterior-power formula of Remark 3.1 is correct: the abelianisation is `ℤ² ⊕ ℤ/3`, so `H¹` with `𝔽_5` coefficients has dimension 2, not 3.
   - **Chenevier, by hand.** Corollary 1.14 p.14, Theorem 2.12 p.28, Theorem 2.22 p.34, Example 2.32 p.38 and Lemma 3.8 p.43 are correct. The statement of §3b.6 matches Lemma 3.8.
   - **Stacks Project.** All 11 tags were fetched and their statements read. Tag 0B91, second half, is the finitely presented flat case used in §1.5.
   - **Other arXiv sources.** Bhatt–Scholze Theorem 7.4 and Remark 7.5, *Étale cohomology of diamonds* Definition 5.7(ii) and Theorem 5.8, and AGIKMS §§0.3–0.4 all say what the README attributes to them.
4. **Gaps and suppliers.** Every supplier is in a lower tier than this roadmap (tier 18), and no upward citation remains. A Sonnet agent checked all 63 cited supplier items against the supplier packages, or against the packets for CompletedCohomologyPartII and PadicHodgeTheory. 62 match. ET.7a is defective (fix 6). The italic IntegralHeckeAndGaloisDeterminants names all occur in the current upstream README. The Tau Ceti declarations `maximalProPQuotient.lift` and `Scheme.Modules.cohomologyδ` exist at the pin.
5. **Duplication.** The current TauCetiRoadmap was searched by topic: IntegralHeckeAndGaloisDeterminants Layers 0–6, ProfiniteCohomology and ProfiniteProPGroups. So was the Tau Ceti library at a91d3aaf. No target of this package is already there. IntegralHeckeAndGaloisDeterminants Layer 0 has coefficient-subring descent and the open-kernel criterion, which the README cites. It has neither the homogeneous decomposition of Scholze Lemma 5.3.13 nor the residual-kernel factorisation, so both stay owned here.
6. **Lean.** `lean-check` exits 0. The file is 321 lines and imports Mathlib only. The only warnings are 31 `declaration uses sorry`. A `run_cmd` audit over all 41 constants found no proof placeholder in any statement or definition body, and `scripts/check_sorry_data.py` reports nothing. I spot-checked every theorem signature against its README statement, at the same generality, and checked every `example` by hand. The ℤ/9 separation failure, the initial-topology examples and `H¹({±1}, ℤ₂) = 0` versus `H¹({±1}, 𝔽₂) ≠ 0` are all true as stated.
7. **Own words.** No source passage is reproduced. The Corrections items describe printed text by its formulas only.
8. **`intake.py check-files`.** 0 problems on all files.

## Corrections made

1. **§3a.3, polynomiality of finite-weight factorisations.** The sketch shifted by `X ↦ XT^{m_0}` with `m_0` the least weight. The correct shift is `XT^{−m_0}`. The sketch also inferred `Q′ ∈ S[T, X]` from `Q′Q_0 ∈ S[T, X]` because `Q_0` is a nonzerodivisor, which does not follow: `Q_0` is not a unit of `S[T, X]`. The correct argument expands `Q′` in powers of `T`. Its `T^e`-coefficients are polynomials in `X` of degree at most `e`, because the remaining weights are positive. Then `Q_0` is cancelled coefficientwise for `e` beyond the `T`-degree. The page images show that the published proof (p.1054) makes the same exchange of `X` and `T`: it writes `Q′ ∈ S[[X, XT]] ⊂ S[T][[X]]`, `Q′ = Σ Q′_a(T)X^a` and `Q_0 ∈ S[T]`. The package's Corrections item repeated that expansion, and it has been rewritten. The Lean statement `finiteWeight_factorization_polynomial` was already true and is unchanged.
2. **§4.8, nonlifting example.** The double coset was written `ℚ^×\(ℝ^×/ℝ_{>0}) × 𝔸_f^×/ℤ̂^×`. That space has two archimedean points, which `−1` swaps, so its stabiliser is trivial and the class vanishes. The plan, and Scholze's `GL_n(F ⊗ ℝ)/ℝ_{>0}K_∞` on p.1057, include `K_∞ = O(1) = {±1}`. The fix adds it and records the two-point version as a negative control.
3. **§2a.1 Examples.** "For the whole boundary (`I = O`)" described the empty boundary. It now reads: if the boundary is empty (`I = O`), both sides are `O⁺/p^m`; if the chart lies in the boundary, both sides are zero. This is the plan's acceptance line.
4. **§1.6.** The plan's statement includes `H¹(𝔛, 𝔍 ⊗ 𝔏^t) = 0`, which the README had dropped. It is restored, with its proof from the Milnor sequence.
5. **§0.2.** The README now states the cocycle condition on triple overlaps (a plan acceptance line). The source's proof finds `f` "by assumption (i)". The README's product of ratios uses (i) and (ii), so it is an explicit choice of `f`, not a correction of the source. The wording now says so, in agreement with the plan's own source match.
6. **Endoscopic supplier.** The README cited "ET.7a" for Shin's cohomological base change for unitary similitude groups. The EndoscopicTransferAndUnitaryTraceComparison package defines no such id; another roadmap uses the same id for Arthur–Clozel base change. The package's §13.4 states the cohomological base change only for standard hermitian spaces. Its Labesse form, §6.29, needs property (*), which needs a coefficient system of regular highest weight (Shin's appendix, p.2). For `n ≥ 2` the coefficient system of `π_k` has highest weight `(k − n, …, k − n, n − k, …, n − k)`, which is not regular.
   - The contract now lists, as *Uses*, Layer 5 §5.1 (the Speh datum), Layers 1 and 6 (§1.8, §6.25, §6.29) and Layer 13 (§§13.1, 13.4).
   - As *Required in addition*, it names Shin's Theorem 1.1 (appendix to Goldring, pp.1–2, author PDF) for the similitude group of `U(n,n)`, needed only by the unconditional CM form.
   - Scope, Conventions, §3b.2, the Layer 3b Dependencies and the References were updated to match.
7. **Locators.**
   - Corollary 5.1.7 is on pp.1036–1037, not pp.1035–1036 (§§2.6, 3b.2).
   - "Theorems 5.1.2–5.1.4, pp.1031–1034" now reads "Proposition 5.1.1, Theorem 5.1.2, Remark 5.1.3 and Theorem 5.1.4, pp.1032–1034"; 5.1.3 is a remark.
   - Remarks 5.4.5 and 5.4.6 are on p.1061 (§§3b.2, 4.3, 4.6).
   - Theorem 4.2.1 is on pp.1021–1023 (§§2.1, 4.5).
   - The proof of Theorem 4.3.1 is on pp.1028–1031 (§2.7). In §1.7, Lemma 4.3.3 (pp.1026–1028) is now cited separately.
   - Theorem 4.1.1 is on pp.1018–1020 (§1.1).
8. **Smaller items.**
   - The Mathlib name is `Algebra.isIntegral_trace`, in `Mathlib/RingTheory/Trace/Basic.lean`.
   - §2.5 now defines codimension as the grade over `Λ` used in CompletedCohomologyPartII CC.5. The plan has this hypothesis.
   - §4.4 names the next-degree `Tor` term of the universal coefficient sequence.
   - §1.2 states that it uses Scholze's version of PerfectoidShimuraVarieties §3.9, which holds for every `p`. That roadmap records its Pilloni–Stroh variant as conditional at `p = 2`.
9. **Suggested.lean.** Two discriminating examples were added. One gives the rank-one dual polynomial: the normalised reciprocal of `1 − 6X` is `1 − X/6`. The other: the zero ideal has zero coefficient ideal. The second holds because the substitution `a = 1` is the identity, although `a = 0` has a kernel.

## Adversarial pass

| Statement | Instances tried | Outcome |
|---|---|---|
| §3a.2 separation | ℤ/9 with `u = 2`; ℚ with `u = 2` and the swapped pair; `n = 0` | ℤ/9 gives `1 + 6X` for both twisted products, and `1 − u² = 6` is not a unit; the swapped pair over ℚ is `1 − (11/2)X + 6X²`. Both hold |
| §3a.3 uniqueness and polynomiality | the first differing order; weights `{0,1}` and `{−1,0,1}` over `k[a,b]/(a²,b²)` | uniqueness holds; the polynomiality proof was repaired (fix 1) |
| §3a.4 homogeneous decomposition | `ℚ × ℚ` with degrees 1 and 2; the constant law; `ε²` over ℤ | holds |
| §3a.6 exact degrees | a factor with `d_m < n_m` | excluded by `Σ d_m = h` with unit top coefficients |
| §3a.7 coefficient ideal | `I = 0`; ℤ/4 with `(2)`; `𝔽_2[a,b]/(a²,b²)` with `(a + bT)`; the base-`(2B+1)` exponents | holds; `a + bT ∉ I_2` checked |
| §0.7 trace integrality | `ℤ_p[√p]`; the cusp `ℤ_p[[t²,t³]]`; `(x², y²)` | holds; each hypothesis is needed |
| §0.8 normalised trace constant | Scholze Corollary 3.2.23 | `C_m = Σ_{m′≥m} (g²+g+1)ε/p^{m′}` matches |
| §1.1 Lagrangian charts | `g = 2`, the plane spanned by `e_1, e_3`, and the chart `p_{13}` | the counts `p³ − p` (the order of `SL_2(𝔽_p)`) and `p³` are correct |
| §1.5 Serre vanishing | descent to a noetherian ring, perfect complexes, base change | correct by Tags 0B91 and 0B5U |
| §2.2 almost faithfulness | `O_C/p`; `𝔪_C/p`; `O_C/𝔪_C` | holds |
| §2.5 and the Corollary 4.2.3 correction | Scholze's choice of the maximal violating codimension | the minimal codimension is the right choice, as the package says |
| §2.6 Checks | `ℤ → ℤ/2, ℤ/3`; `λ(t) = p`; the step `a = n` | hold |
| §3b.1 polynomials | `n = 1, q = 3, U = 2`; `n = 2, q = 2, U = (3, 5)`; unitary `n = 1`; `P^∨` against `c^{−1}X^nP(1/X)` | all identities hold |
| §3b.2 against Corollary 5.1.7 | the twists `(δ+1−ℓ_i)/2` against `(h−ℓ_i)/2` | they differ by an integer, so both are regular algebraic; the README follows Corollary 5.1.7 |
| Remark 5.1.5 correction | `Π′` the twist of `Π` by the `(k+1−n)/2` power of the norm | gives the `(n−1−k)` power of the norm, as the package says |
| §3b.6 Checks | `ℤ_ℓ`; `ℤ_p`; `ℤ/ℓ × ℤ_p` | hold |
| §3b.7 step 4 | the χ with `χ(g)^{2j} = 1` | there are finitely many, and `1 − ζ` is a unit for `ζ` of `ℓ`-power order |
| §4.2 witness | `GL_2` Eisenstein with `t = 1+ℓ`, `d = 1`; block shift `c_i` against the normalised parameters | consistent |
| §4.3 exponent | kernel of square zero composed with `I_!`, `I_∂` | `2·max(4(d+1), N_∂)` is correct |
| §4.8 nonlifting | the symmetric space with and without `K_∞` | repaired (fix 2) |
| Frobenius witness | `n = 1`, trivial character | `P_v = 1 − q_vX`, which is `ε^{−1}` |

## What remains (for other owners)

- **EndoscopicTransferAndUnitaryTraceComparison** should state Shin's cohomological base change (Theorem 1.1 of the appendix to Goldring) for unitary similitude groups of arbitrary signature, in particular signature `(n,n)`, with non-regular coefficient systems. This roadmap's unconditional CM form uses it; the general form does not, since it carries (EC). Until then the item is listed as *Required in addition* in this README's supplier contract.
- **The packager's existing follow-ups stand:** ModularityAndLanglandsExtensions should discharge (EC), and five suppliers may absorb the owned specialisations listed in the packager's handoff.

No defect remains that I could not fix.
