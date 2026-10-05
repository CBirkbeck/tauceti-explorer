# Analytic number theory independent review — checkpoint

Latest continuation: Codex `codex-ws2Gd5`; see the continuation checkpoint section below. Earlier sections are preserved historical evidence. No final verdict has been issued.


Job `REV-AnalyticNumberTheory--AN.0`, issue [#527](https://github.com/CBirkbeck/tauceti-explorer/issues/527). Codex — `codex-7e92bd`, 2026-10-05.

**Partial review; no acceptance verdict.** The maintainer requested that this session submit its current work and stop for the transition to one process per job. The packet intentionally has no top-level `review` object. Its inherited `status: complete` describes the blueprint author's planning pass, not completion of this review. The intake's `deliverables_complete` must return false for this checkpoint.

The input is commit `5132943b05181dfb33bfc0a3ba618f200f1cc7fe`. After fetching main, the job's files were unchanged upstream; the branch was rebased before editing. The blueprint authors recorded in its provenance and prior submissions are `cc-39fac3`, `codex-a71f92` ([PR #3142](https://github.com/CBirkbeck/tauceti-explorer/pull/3142)) and `codex-rtOQ9t` ([PR #6149](https://github.com/CBirkbeck/tauceti-explorer/pull/6149)). This session did not write that blueprint. Its earlier authorship of the accepted Lipnowski–Tsimerman paper extraction does not constitute an independent re-review of that extraction here; its existing review must remain the authority for that input.

## Counts and concrete changes

The packet retains 224 nodes: 22 definitions, 80 lemmas, 112 theorems and 10 comparisons; 89 API items, 75 unit tests, 26 planets, 54 baseline declarations, 24 requests and 43 gaps. No node, API item, test or planet was added or removed. Source issues increase from 15 to 16.

1. The baseline description for `DirichletCharacter.LFunction_ne_zero_of_one_le_re` now includes `χ ≠ 1 ∨ s ≠ 1`, as required by `Nonvanishing.lean:400`. Its consuming Hecke node already distinguishes the principal pole.
2. `AN.4/ray-character-log-coefficients` now cites Kedlaya Theorem 3.7 and (3.3.1), rather than Definition 3.9. It records the Euler-logarithm coefficient `Σχ χ(h^k)/k`, the positive-integer range, and the trivial-group coefficient test at k=2. Its locator and excerpt were checked in the primary text; the ray-class supplier contracts remain to be checked.
3. `AN.4/quadratic-landau-contradiction` now cites Theorem 3.11, printed pp.19–20, rather than the nonreal-character Theorem 3.10. This correction does not certify the separate endpoint/supplier obligation.
4. `AN.4/hecke-primitive-functional-equation` distinguishes conductor-completed Λ from Mathlib's completion without the conductor power. The acceptance check gives the pinned equation and its transformation, including the inverse character and orientation of the root number. The general number-field comparison remains to be audited.
5. `AN.2/prime-power-interval-margin` now specifies a common complex coefficient sequence bounded by 1 on the same interval in both sums. The triangle inequality proves the transfer once the numerical mass bound is supplied. The numerical bound itself remains an original-source obligation.
6. `AN.2/explicit-weighted-prime-sum` now explicitly quantifies one E before every x, so interval subtraction uses the same constant. The original Rosser–Schoenfeld proof is still unread in this review.
7. New `AnalyticNumberTheory/E18` records the missing divisor n in Kedlaya (3.3.1). Both text and page image show the omission; at level 1, the local second coefficient must be 1/2. The positive divisor preserves the intended proof. The bounded correction search and version hash are in the finding. Its local confirmed verdict does not count as a completed independent review until this job finishes.
8. The suggested file's two affected mathematical comments are synchronized, and its header now reports successful elaboration. Executable declarations were unchanged. Historical author provenance saying their file was not compiled is retained as history; the separate review-checkpoint record gives the current result.

## What was actually read

All 54 baseline defining/theorem statements were freshly read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including surrounding field/number-field parameters for Tau Ceti. Every name exists in its cited module. This is not a claim that all 224 consumers satisfy those statements' hypotheses: the consumer audit is partial. The declaration-index SHA256 was `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`.

The AN.0–AN.7 reviewed library-audit target descriptions, evidence names and overlap records were read. The audit's AN.7 expZeta equality misses a z factor already restored in the packet. Its Hecke layer number is stale; the packet points to GlobalNumberFields layer 9, whose actual current contract still needs reading.

The complete payloads of input nodes 0–50 inclusive and two later nodes were read, 53 total. Reading a payload is not a verified node verdict. The first 210 lines of the incoming suggested file were manually read; subsequent executable lines have compiled but have not all received the mathematical signature review. The blueprint handoff was read; the entire reader document has not yet been independently checked.

Fresh primary-source reading is limited to the following:

| Source | Passages read in this session | SHA256 of acquired text |
| --- | --- | --- |
| [Tao, The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/) | Entire main post as browser text; excludes reader comments | `fa8e842cdb21d5db6a12d7486698a0e4f3260469a9d14c35dd4a75e8e7104840` |
| [Kedlaya, December 2025 notes](https://kskedlaya.org/papers/ant-ptx.pdf) | Printed pp.19–22, 43–63, 127–130 as text; printed pp.19 and 51 additionally inspected as page images | `7a934fce8272cedd36ad609f79bbe79af0056320bb1e0bc690c87af990f305be` |
| [Bennett–Siksek, published 2020 article](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) | Printed pp.362, 365, 369–370, 372–379, 382–388 as text | `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf` |
| [Tsimerman, published 2018 article](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) | Printed pp.381–384 as text | `43259ca3cfedfb574bf1fe2f80e1023cb736ea299a76588536fd816340722abc` |

Tao's current HTML differs from the historical packet hash because the page is dynamic; no byte identity with the earlier acquisition is claimed. None of the downloaded but unread sources counts as verification. In particular, Tate's scan, the Lerch papers, Yun–Zhang, Duke–Imamoğlu–Tóth, the remaining routed papers and Schoenfeld's 1976 original were not freshly read in this checkpoint. Rosser–Schoenfeld's publisher URL returned an anti-bot HTML page. The Thorner–Zaman supplement for the quadratic Hecke route was not acquired. The 14 accepted extraction payloads were recovered from commit `30e57b9090cc4c5e6d91a92848a4837206a921f8`; they do not replace primary-source reading.

All 15 inherited source-issue records were read. Fresh Kedlaya text supports the concerns E2–E13 and E16, but a completed item-by-item adjudication was not written. E1's Bennett–Siksek passage was read, without yet independently certifying its numerical counterexample; E17's Lerch source was not read. The inherited `sourceVersions` dates are the authors' records, not a claim that this reviewer read those entire works.

A possible gamma-duplication error suggested by PDF text extraction was rejected after inspecting printed p.51: the denominator is correctly `2^(2z−1)`. Do not add this as an erratum. Remark 10.8's χ/χ² denominator on printed p.62 still needs an image check; no finding is asserted here.

## Compilation and checks

The final full suggested file was elaborated using an existing build with clean Mathlib source at the exact pin, Lean 4.34.0-rc2, and the command shape:

```text
lake env lean -j1 -M8192 <checkout>/research/blueprint/suggested/AnalyticNumberTheory--AN.0.lean
```

The command ran from the existing outer project's directory so sibling package dependencies were on the search path. An earlier attempt from its nested Mathlib directory stopped at a missing Aesop search path; no source or dependency build was needed to resolve that invocation issue. No Lake project was created, cache downloaded, library built, or language server started. A single Lean process was used; 91 GiB was available before the final run, which finished in 2.587 seconds.

Final suggested-file SHA256: `7c837cb342c8c439d16ed1e1e41d601375f13aa15f4e4e672365f982dc3c8645`. Result: exit 0, 158 warnings, every one `declaration uses sorry`, no errors or other output. The raw local compiler-output SHA256 was `c4f207263de5c6beb5e175f5f39fa52077d1704d7b14d280bfaeef4e0f5618b9`; that raw log contains machine paths and is not retained. Reproduction uses the public suggested file and the pins above. Only Mathlib modules are imported; Tau Ceti declarations were inspected as source, not compiled by this file. No transitive cache-provenance audit is claimed.

The six carrier definitions listed in `provenance.currentPass.nativeSignatures.omittedCarrierDefinitions` remain mathematical comments, not executable signatures. Successful elaboration does not resolve that gap or establish the propositions proved with `sorry`.

The packet checker with the pinned declaration index reports **0 errors and 0 warnings**. The source-issue schema/version checks, submission file checks, and checkpoint-classification assertion are also run before submission. Their results are summarized in the pull request. The [handoff](../handoff/REV-AnalyticNumberTheory--AN.0.md) gives the remaining review work. No promotion or manual merge is requested.

## Read payload inventory

Zero-based input positions; all identifiers below have prefix `AnalyticNumberTheory:`. No inventory entry means that the node is accepted.

- 0: `AN.5/prime-power-log-bound`
- 1: `AN.5/large-prime-power-bound`
- 2: `AN.5/divisor-bound-from-local-bounds`
- 3: `AN.5/explicit-divisor-subpower-bound`
- 4: `AN.5/uniform-divisor-subpower-bound`
- 5: `AN.5/absorb-divisor-bound-constant`
- 6: `AN.5/eventual-divisor-subpower-bound`
- 7: `AN.2/classical-zero-free-region`
- 8: `AN.3/von-mangoldt-explicit-formula-and-pnt-error`
- 9: `AN.4/hecke-L-function-euler-product-comparison`
- 10: `AN.4/artin-induction-versus-artin-holomorphy`
- 11: `AN.4/landau-nonnegative-logarithm`
- 12: `AN.4/ray-class-product-nonvanishing`
- 13: `AN.4/hecke-nonvanishing-on-line-one`
- 14: `AN.4/dedekind-zeta-continuation-and-residue`
- 15: `AN.4/hecke-primitive-functional-equation`
- 16: `AN.4/mth-root-gluing`
- 17: `AN.2/exceptional-real-zero`
- 18: `AN.2/theta-ap`
- 19: `AN.2/exceptional-conductor-repulsion`
- 20: `AN.5/quadratic-conductor-largest-prime`
- 21: `AN.2/schoenfeld-theta-upper`
- 22: `AN.2/mod-eight-interval-mass`
- 23: `AN.2/prime-power-interval-margin`
- 24: `AN.2/two-real-zero-separation`
- 25: `AN.2/exceptional-zero-unique`
- 26: `AN.2/character-weighted-pnt`
- 27: `AN.2/rosser-schoenfeld-pi`
- 28: `AN.2/explicit-prime-reciprocal`
- 29: `AN.2/landau-page-bounded-height`
- 30: `AN.3/selberg-zero-density`
- 31: `AN.2/quadratic-effective-zero-gap`
- 32: `AN.2/explicit-weighted-prime-sum`
- 33: `AN.2/explicit-plus-euler-product`
- 34: `AN.2/weighted-prime-interval`
- 35: `AN.4/bounded-degree-brauer-siegel`
- 36: `AN.5/bounded-norm-ideal-count`
- 37: `AN.4/artin-conductor-bound`
- 38: `AN.4/artin-log-functional-equation`
- 39: `AN.4/artin-value-one-subpower`
- 40: `AN.4/artin-log-derivative-one`
- 41: `AN.4/quadratic-zeta-factorization`
- 42: `AN.4/bounded-degree-residue-bounds`
- 43: `AN.4/quadratic-hecke-value-one`
- 44: `AN.4/primitive-hecke-convexity`
- 45: `AN.4/quadratic-hecke-cauchy-derivative`
- 46: `AN.4/quadratic-hecke-log-derivative-one`
- 47: `AN.4/quadratic-hecke-log-functional-equation`
- 48: `AN.5/ideal-coefficient-divisor-majorant`
- 49: `AN.5/fixed-order-divisor-subpower`
- 50: `AN.4/quadratic-residue-quotient`
- 166: `AN.4/ray-character-log-coefficients`
- 170: `AN.4/quadratic-landau-contradiction`

## Continuation checkpoint — Codex `codex-ws2Gd5`, 2026-10-05

This section is the latest receipt. The earlier sections remain the historical `codex-7e92bd` checkpoint and are not attributed to this reviewer. Input commit: `8270021f197b68362ac29ddae9755b434d27059f`. Issue [#527](https://github.com/CBirkbeck/tauceti-explorer/issues/527) confirmed this session's claim in [bot comment 5992531573](https://github.com/CBirkbeck/tauceti-explorer/issues/527#issuecomment-5992531573). This is a substantial continuation checkpoint, **not an acceptance or a completed independent review**. The packet still has no top-level `review` object. Its inherited `status: complete` describes the author's submitted plan, not this review's completion.

### Scope and source evidence

The fresh scoped payload audit covers input indices 35–65: the fixed-degree arithmetic/CM chain and DIT partial-zeta/genus-period chain. Statements and dependencies were read throughout this range, with additional complete payload reads for the partial-zeta and period block. This is not a final node-verdict inventory, and none of the previous 53 payload receipts is silently promoted to current verification. The entire executable portion of the suggested file was manually read, through the closing namespace. Its later mathematical comments were read selectively; the whole reader document, all planets and all source issues still need independent review.

| Fresh primary acquisition | Selected passages actually read | PDF SHA256 |
| --- | --- | --- |
| [Duke–Imamoğlu–Tóth, published article](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf) | Introduction and selected arithmetic preliminaries, pp.949–952; §5 pp.961–964; §6 pp.967–969; §7 pp.970–972, including the Hecke displays, genus factorization and Stokes argument. Printed pp.970–971 additionally checked as images. | `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61` |
| [Thorner–Zaman, published article](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf) | §§2A–2C, pp.1140–1142, through Lemma2.4; pp.1140 and 1142 checked as images. Convexity is **Lemma2.3**, an unnumbered display; (2-8) is the Hadamard product, not that estimate. | `504512d24db46f933d52f277d2ad3a14da5ed66e0efcda0407c8aceadd008d4c` |
| [Tsimerman, published article](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) | pp.381–384, including Corollary3.3 and its proof. No whole-paper reread is claimed. | `43259ca3cfedfb574bf1fe2f80e1023cb736ea299a76588536fd816340722abc` |

All were acquired on 2026-10-05. Kedlaya's PDF was also reacquired with the inherited matching hash, but this continuation does not claim new substantive reading of it. The published Thorner–Zaman bound and DIT's cited Hecke/Siegel statements establish exact targets; their original external proofs were not read. The Rademacher and bounded-degree Brauer–Siegel proof gaps remain. The packet adds primary-source records instead of treating accepted extraction records as independent proof checks.

Actual supplier contracts checked for this cluster: ArithmeticDirichletSeries norm fibres, Euler products, ideal-count convergence and the Landau endpoint distinction; Chebotarev's qualitative/effective scope; GlobalNumberFields layers2,9,10; ClassFieldTheory layers11 and13; AL.1's completed Hecke function and functional equation; AS.1/AS.2; and GN.3. The accepted DIT extraction's GN route and proposed FuchsianOrbifolds Part II route were compared against the current atlas. No FuchsianOrbifoldsPartII atlas stage was found; a proposal is not an available theorem export.

At the exact pinned source snapshots, the scoped declaration reading included `NumberField.dedekindZeta`, its residue and one-sided residue limit, `Complex.Gammaℝ`/`Gammaℂ`, and Tau Ceti's narrow genus-character file, including the coprime-ideal evaluation and singleton/product helpers. This is a scoped consumer audit; it does not replace the previous baseline reading or finish every baseline consumer. The genus helper has prime-discriminant/subset, squarefree and quadratic-generator hypotheses. Converting arbitrary fundamental factors into that exact input remains an explicit gap. No new library theorem or genus-character construction is planned.

### Corrections saved

Thirteen mathematical node statements changed. Their corresponding suggested-file specifications were synchronized, with one additional mathematical comment for the residue quotient. No nodes were added or deleted.

- **CM chain (43,45–47).** State E CM, F its maximal totally real subfield, degrees 2g/g, the canonical nontrivial primitive quadratic character, and Q=D_F N(f_η)=D_E/D_F. The completion is Q^(s/2)Γ_R(s+1)^g L_f(s,η), because every real local character is odd. Differentiating its functional equation at 0 gives the asserted sum of logarithmic derivatives: Γ_R'/Γ_R(1)+Γ_R'/Γ_R(2)=−γ−log(2π). The root number is constant and contributes no derivative. Both endpoints are finite and nonzero after the positive residue quotient and the odd functional equation. The packet now requires the global Artin, infinity-type, conductor–discriminant and Hecke-continuation interfaces rather than inferring parity from a generic quadratic extension.
- **A counterexample and a positive normalization check (47).** For E=ℚ(√2), the even primitive χ_8 has a zero at 0, as the a(χ)=1, δ(χ)=0 case of TZ (2-7) confirms; its logarithmic quotient at 0 is undefined. It is outside the CM statement. For E=ℚ(i), the character χ_−4 has Q=4, L(0)=1/2 and L(1)=π/4; the sum becomes γ+log(π/2). These are mathematical acceptance checks, not newly executable CM signatures.
- **Primitive convexity (44).** The printed TZ Lemma2.3 permits 0<r≤1/2 and the strip −r≤σ≤1+r. Keep the degree-dependent powers and the absolute implied constant. Exclude the trivial character at s=1, and define its pole factor by cases so the nontrivial-character value at 1 does not depend on an ambiguous zero exponent or totalized division. The source is a target check; Rademacher's proof is still a gap.
- **Derivative and residue dependencies (45,50).** The Cauchy circle only needs holomorphy, not a zero-free disk. For the nontrivial finite-order CM character, AL.1 supplies the planned entire-continuation interface. The residue quotient uses holomorphy at 1 and the two simple zeta poles, so its prerequisite was changed from general line-one nonvanishing to AL.1's Hecke functional equation. The quotient is still a comparison to canonical continued functions, not a deduction from Mathlib's one-sided real limit alone.
- **Positive norm indices and constants (36).** Require g≥1, integer n≥1, X≥1 and constants uniform in E after g,ε are fixed. The elementary coefficient/divisor arguments at 48–49 were checked as mathematics, but the exact arithmetic supplier and native d_n interface remain to be resolved; no field-dependent bound was substituted.
- **Partial ideal series (51).** The existing ℚ test was outside the previous quadratic-only definition. The coefficient definition now uses any number field with a chosen ordinary/narrow class group; period applications retain their quadratic specialization. Restrict to nonzero ideals and set a_A(0)=0. Mathlib's Dedekind coefficient at zero may count the zero ideal, but `LSeries` ignores zero; class-sum series agreement must not be reported as equality of all coefficients. ADS layer1 supplies finite norm fibres/regrouping, while layer5 supplies convergence by domination. The finite class partition belongs to the existing class-group owner.
- **Period normalizations (53,54,58,59).** Specify E as the primitive half-sum, E*=π^(−s)Γ(s)ζ(2s)E, and ω_D=|O_K^×|/2. In particular ω_−4=2 and ω_−3=3. For real periods require D>1, define A,J and the norm-one quotient, and retain its length 2log ε_D and the different arc-length/oriented-differential measures. DIT's already-correct core formula is retained: continue the compact boundary identity before Stokes on the critical line; the raw Re s>1 core integral diverges.

The Weyl-bound hypotheses now identify all three branches of DIT (5.12), including its positive-factor **boundary** integral. Comparing that boundary to C_A requires the geometric dictionary; it is not silently replaced in the definition. Genus factorization, Stirling/gamma estimates, the inverse-zeta line-one estimate, Siegel's theorem and regulator conventions still require their precise proof/supplier work before a final verdict.

The previous request made AS.1 construct quadratic geodesics, CM points and core surfaces. Its actual contract only supplies initial Eisenstein convergence and constant terms. The revised requests separate AS.1 normalization, AS.2 continuation and differentiated cusp estimates, and GN.3's quadratic arithmetic quotient dictionary. The existing accepted extraction proposes a FuchsianOrbifolds Part II for Nielsen cores F_A, finite area, boundaries and multiplicity-preserving projections. That ownership proposal and its unresolved closure are recorded explicitly; no nonexistent stage ID was inserted. There are now 44 gaps, 30 requests and six ownership proposals. The existing period gap remains open with a corrected reading receipt and supplier scope.

The exceptional-real-zero definition is now explicitly parameterized by any positive c and specialized to the source's c_star. A conditional positive example was added to both packet and Lean: supplied primitive/nonprincipal/quadratic, real-zero and strict-cutoff hypotheses imply the predicate. It makes no zero-existence assertion. There are now 76 planned tests; the API count remains 89.

### Validation and handoff limits

The final suggested file was checked with `lean-check` in the shared existing build. Immediately beforehand, available memory was 97 GiB. It returned exit0, **159 warnings, all declaration-uses-`sorry` warnings, and zero errors**. File SHA256: `4786c2f981857c59b59f1f2dd50eae532efba9506ba1155909f90a0d7f441ada`. Mathlib source was verified at `082e2d37e8b0463410cdb532e111cd43d5a66174`; the file imports Mathlib only. Tau Ceti source reading was at `f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti module compilation is claimed. No project, cache, library build or Lean language server was created, and no compile remains running.

The packet checker with the pinned declaration index reports **0 errors and 0 warnings**. Submission checks and absence of a final review verdict are checked before opening the PR. These checks do not prove source faithfulness or complete the independent review. The six missing canonical-carrier signatures remain comments.

The reader file is **not among issue #527's deliverable paths**. It was not edited and now needs authorized synchronization of these corrections: CM hypotheses/conductor, pole handling, partial-series generality and zero slot, period units and measures, supplier scopes, and the additional exceptional-zero test. Record and repair that divergence before eventual acceptance; this checkpoint makes no claim that the reader is synchronized.

Resume with the [latest handoff](../handoff/REV-AnalyticNumberTheory--AN.0.md), preserving both sessions' corrections. The remaining numerical original sources, Artin endpoints, source issues, red-team routes, all remaining node payloads and reader/planet/native review prevent a final verdict. At this boundary the evidence is sufficient for the saved local corrections, but continuing across the remaining source families would require new proof reading at the same depth. Submit this checkpoint and stop after this one job.
