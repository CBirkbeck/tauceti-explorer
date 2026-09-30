# Verification of RT-PAPER-GAMBURD-MAGEE-RONAN-19

Codex, session `codex-rtOQ9t`, 30 September 2026. Refs #4097.

All seven findings are **confirmed**, with the qualifications and corrected fixes below. Findings 1–3 retain medium severity; 4–7 retain low severity. The machine-readable reasons are in [the verification](../redteam/RT-PAPER-GAMBURD-MAGEE-RONAN-19.review.json). This review changes no extraction, roadmap, packet or source-issue register.

I did none of the extraction, its original review, or the red team. The extraction and review identify Claude Code sessions `cc-fb70e5` and `cc-442dc5`; the red team identifies `cc-f805bf`. I checked the findings against the target files, the cited portions of both public source versions, the pinned library declarations, current supplier packets and the queue.

The source copies downloaded and read at the finding locators on 2026-09-30 are:

| Version | Public source | Pages | SHA-256 |
| --- | --- | --- | --- |
| arXiv v3, 13 June 2018 | [1603.06267v3 PDF](https://arxiv.org/pdf/1603.06267v3) | 57 | `965e264e260ca42bbaa5a65f789e5cc6eb6117d70d7219603a3b855d29ba997a` |
| Version of record | [Annals publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v190-n3-p02-s.pdf) | 59, printed 751–809 | `c5e7ebb5322cdfd455735f13c2b420dba318089b382a3f78f40628efc838215a` |

The [publisher record](https://annals.math.princeton.edu/2019/190-3/p02) dates the revision to 21 January 2019, after v3. The PDFs' Jacobian matrices were checked visually, not just through extracted text. Publisher and title/erratum searches found no separate correction. I have not proved the absence of an erratum, re-extracted all 43 items, or completed the full cited RPF/renewal proofs. This is verification of seven specific findings.

**1. Published collation — confirmed.** The target has no `sourceVersions`, describes only v3 as read, and labels every E1–E17 `known:new`. Direct comparison gives the following disposition.

| Entry | Published evidence | Required disposition |
| --- | --- | --- |
| E2 | (3.6), p.777: zero initial index and powered prefactor are repaired; the comparison still divides by `(A₀ log 2)^β` at zero | Split corrected components from the surviving comparison error |
| E4 | pp.772,775 repair the sequence index and unaccelerated generator range; Lemma 22's proof, p.773, still has `n−2` | Only that generator-range component remains uncorrected |
| E5 | Lemma 25's claim, p.780, restores exponent `L−1`, but the sums still omit `A₁=0` | Split the two components |
| E7 | Lemma 29, pp.784–785, restricts the word to the accelerated class | Corrected in print; this does not repair the separate strict-inequality error E12 |
| E8 | pp.799–800: factor `2` remains, but the expansion-ratio lower bound is now correctly stated as `≥3/2` | The factor remains wrong; the logarithmic claim can now use `c=log(3/2)` without changing printed text |
| E11 | Lemma 30 and (3.28), pp.785–786, use `2ε` and `τ⋆^L` | Corrected in print |
| E17 | (5.1), p.801, repairs the range to `i≤n−2`; (5.5)/(5.9), pp.801–802, retain unsquared denominators | Split corrected range from surviving denominator errors |

The unchanged passages cited by the finding remain visible: E3 in Proposition 18(3), p.768; E6 in Lemma 27, p.783; E12 in Lemma 29, p.784; E13 in Lemma 22 and the following paragraph, p.773; E14 in §1.1, p.761; E15 in Lemma 46, p.798; and E16 in §4.3, p.797. The E10 summation passage remains at p.789; the displayed assertions of positivity in Proposition 23, p.776, do not themselves supply the omitted E1 proof.

The scope distinction for E9 matters. Its incorrect column-sum equivalence in the proof of (5.1) survives in Annals p.804. Only the other components inside the proofs of (5.9)/(5.10), together with E17's components inside the proof of (5.5), concern the preprint supplement. Annals p.802 refers those omitted proofs to GMR18, arXiv v3.

Annals inserts Examples 16–17, p.766. Subsequent named results therefore have different numbers: for example v3 Proposition 16 is Annals Proposition 18, v3 Lemma 27 is Annals Lemma 29, v3 Theorems 37/39 are Annals Theorems 39/41, and v3 Lemma 46 is Annals Lemma 48. The fixer must provide version-labelled statement locators rather than treating the v3 numbers as published ones.

Add the new read date, hashes and collation; retain the old dated access history. Do not retrospectively attribute a published-version reading to the original workers. Preserve the preprint mistakes while separating corrected and surviving components so the generated register no longer presents everything as newly found in the version of record.

**2. Tauberian supplier — confirmed, with a narrower fix.** I read the accepted [WOOD extraction](../papers/PAPER-WOOD-19.result.json), item 286 and route 10, its review, and the complete upstream Arithmetic Dirichlet series roadmap. WOOD/286 is a nondecreasing-function Laplace theorem with arbitrary positive abscissa and integer pole order; its simple-pole case supplies the scalar step in GMR. The parent Layer 9's Dirichlet-series statement is related but is not itself a verbatim statement about arbitrary nondecreasing functions.

For each fixed `w`, the counting function is nonnegative and nondecreasing. A fixed waiting-time cutoff bounds word length (each accelerated letter expands by at least `3/2`) and branch index, so the count is locally finite. Positivity of the transfer operators supplies absolute convergence to the right of `β`; the spectral results in v3 §§4.2–4.3 supply local continuation along the boundary away from `β`.

Writing `Pβ(g)=νβ(g)hβ`, the singular coefficient of `s⁻¹(1−L_s)⁻¹1` is

```text
B(w) = −hβ(w)/(β λ′β) = hβ(w)/(β |λ′β|).
```

Here `νβ` is a probability measure and `νβ(hβ)=1`. The expansion bound gives
`λ_t ≤ (3/2)^{−(t−s)} λ_s` for `t>s>1`, hence `λ′β≤−log(3/2)<0`. Merely saying that an analytic function is strictly decreasing would not justify a simple zero.

The scalar Tauberian import yields the pointwise asymptotic. It does **not** by itself prove the uniform little-o required by GMR Theorem 13. Continuity of `B` alone is insufficient; retain the uniform analytic estimates and the uniform Tauberian/contour argument as named GMR obligations.

Correct the proposed schema fix too. `ArithmeticDirichletSeriesPartIIHigherPoleTauberian` is an accepted proposed roadmap id, not an existing stage id for `planned`. Until a supplier stage exists, record a prerequisite/gap and a maintainer dependency note citing WOOD/286 and route 10 under `DESIGN-ArithmeticDirichletSeriesPartII`. Do not manufacture a second scalar theorem owned by GMR route 3 to satisfy routing syntax.

**3. Unsupported Mathlib imports — confirmed.** The declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

| Declaration read | What it supplies | Why it does not close the disputed import |
| --- | --- | --- |
| `mellin`, Mathlib/Analysis/MellinTransform.lean:91 | Complex Mellin integral on positive reals | A logarithmic substitution and convergence/holomorphy adapters remain necessary |
| `ContDiffMapSupportedIn`, Mathlib/Analysis/Distribution/ContDiffMapSupportedIn.lean:97–101 | Globally Cⁿ functions zero outside a fixed compact set | Taking that compact set to be the simplex does not give a space containing the constant-one function used in (4.4) |
| `TauCeti.laplaceTransform`, TauCeti/Analysis/CompletelyMonotone/Laplace/Representation.lean:73 | Real-parameter transform of a measure on nonnegative reals | GMR uses a complex-parameter transform of functions on the whole real line |
| `tendsto_tsum_term_mul_fourier_atTop`, TauCeti/NumberTheory/LSeries/WienerIkehara/Asymptotic.lean:122 | A smoothed Dirichlet-series asymptotic | It is not WOOD's sharp nondecreasing-function theorem |

The pinned `spectralRadius`, `Real.summable_one_div_nat_rpow` and `Complex.summable_one_div_nat_cpow` are valid imports. Searches of the pinned Analysis sources found no Laplace-transform declaration or ready C¹-on-a-simplex Banach space. The library audit agrees on the unbuilt sharp Tauberian and PM.4 targets. I also read the complete upstream One-parameter semigroups roadmap; its real-measure and semigroup Laplace APIs must be preserved and reused where applicable.

The fix must expose the missing C¹ carrier, completeness, composition and complex-transform adapters, not reclassify these as implemented. For a Mellin construction the exact convention is
`Laplace(f,s)=mellin (t ↦ f(log t)) (−s)`; the substitution includes `dt/t`. Coordinate conventions should use the convex body's affine span, so the derivative in the norm is well specified. Coordinate this generic transform with the Tauberian supplier instead of giving the two consumers incompatible copies.

**4. PM.4 only covers part of item 30 — confirmed.** I read the live PM.4 stage and its packet's `not_read` coverage. The stage plans the Gauss map, its invariant probability measure and ergodic statistics, without an explicit all-parameter transfer conjugacy or the precise C¹ spectral theorem.

For `T_A(x)=1/(x+A+1)`, multiplication by `g_s(x)=(x+1)^s` gives

```text
g_s(x)⁻¹ ((x+1)/(x+A+2))^s g_s(T_A(x))
  = (x+A+1)^(−s).
```

Positive real bases make this valid throughout `Re s>1`. This verifies the conjugacy in v3 Example 35 directly. Separate the PM.4 base objects from missing route-3 conjugacy/spectral items, importing the former. Keep Gauss's unnormalized eigenfunction `1/(1+x)` distinct from the invariant probability density `1/((1+x)log 2)`.

**5. Prerequisite register — confirmed, with a bibliographic correction.** The paper's v3 pp.35,40–42 and p.20 cite the missing sources in precisely the roles described: Baladi as background, Pollicott for direct calculations and an RPF proof, ITM for the two-norm method, PP90 for the finite-type theorem, and Lalley 1988 as a renewal precursor.

The finding nevertheless misidentifies the Annals citation key. The references on printed p.808 list `[Pol14]` as **Apollonian circle packings (2014)** and `[Pol]` as **Statistical properties of the Rauzy–Veech–Zorich map**. The published body uses `[Pol14]` at pp.797 and 799. It is therefore wrong to state that the Rauzy notes merely received that new key.

The public [teichmuller-survey7.pdf](https://warwick.ac.uk/fac/sci/maths/people/staff/mark_pollicott/p3/teichmuller-survey7.pdf) has Aimino and Pollicott as authors and a different later presentation. I inspected its title and section structure; I do not identify it with the original solely by title, or claim to have verified the old Lemmas 2.1/2.3 there.

Add the missing references with precise roles and the version/label discrepancy. The design must identify which direct/cone proof it actually uses and either read the exact source or retain an acquisition gap. A bibliography does not close the countably-many-branches adaptation, nor make all alternative proofs mandatory dependencies.

**6. Jacobian typo — confirmed.** In the displayed `i>3` pattern, the third output coordinate is `w₃/(2−w_i)`. Differentiation with respect to `w_i` gives `w₃/(2−w_i)²`. Both page images instead repeat `w₂` in row 3, column `i`.

Summing the absolute entries of the corrected column gives

```text
(Σ_{k≠i} w_k + 1 − w_i + β(w))/(2−w_i)²
  = (1 + 2β(w) − 2w_i)/(2−w_i)².
```

This is the paper's subsequent column-sum formula, so the correction preserves the (5.1) estimate. Add a source issue with both locators, rather than changing the theorem. E18 is available in the reviewed extraction; check for concurrent additions before allocating it. Record novelty only relative to the dated searches above.

**7. CA.4 continuation and canonical design names — confirmed.** The existing CA.4 Markoff nodes already handle `n=a=3,k=0`. GMR items 1 and 5 should cite those nodes for the special case and retain the general parameters as missing. The packet's source list has no GMR source, and the added-source lines of [issue #1025](https://github.com/CBirkbeck/tauceti-explorer/issues/1025) list Bennett–Siksek and Martin.

This is a continuation gap, not a reason to discard the correct classical nodes or treat their existing source coverage as mathematically false. Record GMR items 1–5 as additional work for the continuation.

The current queue makes `DESIGN-ArithmeticDynamicsPartII`, `DESIGN-ProbabilisticAndMetricNumberTheoryPartII` and `DESIGN-ArithmeticDirichletSeriesPartII` the canonical jobs. Use those in dependency/brief references, retaining the earlier accepted proposed route ids as aliases. The queue's supersession note dates the consolidation to 28 September; the earlier extraction's use of the old ids was not itself an error at review time.

Validation: `scripts/check_redteam.py` on the verification, `research/blueprint/intake.py check-files` on its three deliverables, and `git diff --check`. No Lean file is a deliverable; no Lean build was run. The downstream fixes and their proof obligations remain work for the fix/design/continuation jobs.
