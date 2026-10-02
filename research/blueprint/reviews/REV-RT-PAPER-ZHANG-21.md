# Verification of RT-PAPER-ZHANG-21

Reviewer: Codex, session `codex-J6LwjP`, 2 October 2026. Issue #4074.

**56 findings confirmed; finding /55 rejected.** All nine high and twenty-five medium findings are confirmed, with the qualifications and corrected fixes in the accompanying JSON. Twenty-two low findings are confirmed. Confirmation applies to the specific defect, not automatically to every alternative repair or broader assertion in a finding.

I did none of `PAPER-ZHANG-21`, `REV-PAPER-ZHANG-21` or `RT-PAPER-ZHANG-21`. The extraction credits `codex-a71f92` and `cc-442dc5`, its accepted review `cc-39fac3`, and the red team `cc-c2c06b`. I checked those records against this session's own deliverable register. Cross-paper inputs below are inspected as supplier evidence; this is not a new review of their complete extractions.

## Evidence and limits

I read all 57 finding objects, the extraction's eleven routes, sixteen prerequisites and seven gates, its relevant statement/note/test fields and sourceIssues, the current report and relevant historical routing sections, and the complete accepted independent-review report. I then checked the cited primary passages, the actual queue grouping code, assembled stage descriptions and relevant reviewed library audits. The freshly assembled graph at repository base `d95b25c` has 2,956 stages and 8,639 stage edges. In particular, AA.4 is not an ancestor of AF.0, AF.2 or AF.3.

Primary source checking was selective at the findings' locators, including definitions and reductions in §§1–5, the integral and complex model/cycle passages in §§6–10, the analytic construction in §§11–12, the global induction in §§13–15, and Appendices A–B. This was not a new full sequential reading of all 116 pages. Page images were inspected for the lost overlines in the coefficient-field assertion and the group/space matching notation. Printed journal pages are used throughout the verdicts.

Public sources used:

- [Wei Zhang, published Annals PDF](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf), 116 PDF pages, printed pp.863–978, DOI [10.4007/annals.2021.193.3.5](https://annals.math.princeton.edu/2021/193-3/p05). SHA-256 `6f8ac537b4f95cf26ba907dc1d25c1b9d9157a3a4006a311b114a522177d3b45`, matching the extraction. The earlier [78-page author preprint](https://math.mit.edu/~wz2113/math/online/AFL2019.pdf) was downloaded but is not used to claim the journal wording correct or to resolve its gaps.
- [Mihatsch–Zhang, JEMS public PDF](https://ems.press/content/serial-article-files/31452), 71 pages, DOI 10.4171/JEMS/1375. Read §7.2, Proposition 7.4 and footnote 5, PDF p.48, for the corrected Gaussian/Green convention. SHA-256 `67c39ae1e0109162aba0e25aff25e6dfa4aa944eb68ca3ada7109a16583ca76e`.
- [Bruinier–Howard–Kudla–Rapoport–Yang, arXiv:1702.07812](https://arxiv.org/pdf/1702.07812), 118 pages in the fetched public PDF. Read the introduction/range restrictions, Theorem B, §1.5, §2.5 and Corollary 3.7.3. SHA-256 `c2e5861730ee8fa744bb36567b1412f65e044ee8f78d9619e6e26265d89791a6`.
- [Liu, arXiv:2102.11518v1](https://arxiv.org/pdf/2102.11518v1), 88 pages. Read the good-inert frame and Definition 5.21/Proposition 5.22 on p.49. SHA-256 `323871b60ba122096f66690ed9f255949842114af29ea1ebf0202fe56156e6ce`. I did not verify every other version; /49's reason deliberately limits the version claim.
- [Li–Zhang, arXiv:1908.01701](https://arxiv.org/pdf/1908.01701), 92-page fetched PDF. Read Theorem 5.3.2 and Corollary 5.3.3, pp.25–26, for Tate-cycle spanning and numerical intersection factorization. SHA-256 `7db1843f90c3e79741f8d58d92b6bb42b0a3b7ae001c8f9419f43b08c2119d49`.
- [Beuzart-Plessis, arXiv:1901.02653](https://arxiv.org/pdf/1901.02653), nine-page v3 text, especially introduction and Theorem 1, pp.1–3. SHA-256 `27fc28404ef150760f7b85da367aaffb367851d851b791e279d10d3ab47d3ce6`.
- [Yun, published Duke PDF](https://math.mit.edu/~zyun/FLJR_published.pdf), 62 pages. Read §2.6, Proposition 2.6.1 and proof, printed pp.184–185. SHA-256 `0ac3554b8aec20b1509183722f2fb6b43e068e86d7daa954f90297f6c6d184ec`.

The exact pinned source trees were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I read the statements of:

- `HasStrictFDerivAt.map_nhds_eq_of_surj`, Mathlib `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:87`;
- `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, Mathlib `Analysis/Calculus/ParametricIntegral.lean:288`;
- `NumberField.prod_abs_eq_one`, Mathlib `NumberTheory/NumberField/ProductFormula.lean:98`;
- `SL2.transvection_induction`, Mathlib `LinearAlgebra/Matrix/SpecialLinearGroup.lean:788`;
- `TauCeti.SL2Borel.mem_doubleCoset_modularGroup_S_of_notMem` and `closure_insert_modularGroup_S_eq_top`, Tau Ceti `LinearAlgebra/Matrix/SpecialLinearGroup/Borel.lean:300` and `:366`.

These provide only the correctly scoped analytic/algebraic inputs described in /23, /30, /36 and /37. They do not implement relative trace distributions, the valuation-restricted generation statement, Koszul resolutions, arithmetic Chow theory or AFL. Relevant audits and accepted restructuring scopes were read for R35.1, GN.2, AL.0–1, MP.2–3 and S.7; formal geometry and R03.3 descriptions were checked directly. No new Lake project, library download/build or Lean language server was used. These deliverables contain no Lean implementation to elaborate.

## Repairs that must be applied together

Findings /2 and /4 are a compatibility failure in the existing repairs, not simply a request to change a displayed bound. Use group dimension **N** and semi-Lie dimension **m** consistently. The supplied simultaneous unit-denominator reduction proves the group-N consequence only beyond `q=N`; the semi-Lie dimension `N−1` step at `p≥N` can remain available after fixing the auxiliary-place argument. An auxiliary prime equal to m cannot be put into B and handled by group-m AFL when that is exactly the unresolved boundary.

For that step, enlarge S away from v0 so every remaining relevant group-m input has `q≥m+1`. One coherent choice also excludes auxiliary inert primes at most `m+1`, securing the strict maximal-order bound elsewhere. If the distinguished prime equals `m+1`, treat it by the norm-unit case through already proved group-m AFL, even if its order is maximal. Check the analytic semi-Lie FL rank separately. S must never exclude the distinguished target by accident. The original group boundary `p=N` still needs a separately established proof.

The proposed geometric repair in /21 is valid without a residue-cardinality bound. In the inverse chart, write

```
x = (1 + g)/(1 - g),
u_tilde = 2 sqrt(ε) (1 - g)^(-1) u,
S = 1 + e + u_tilde* (1 + x)^(-1) u_tilde.
```

Using `x*=-x` and `bar(sqrt(ε))=-sqrt(ε)` gives `(S+bar S)/2=1−ε<u,u>`. For integral invariants that real part is integral. The imaginary coordinate e can be chosen to make S a unit, then varied in that open set to avoid the finite non-srs exceptions. Only `det(1−g)≠0` is needed, attainable by a norm-one scalar outside finitely many exclusions. Thus `1−d=2/S` is a unit. This uses no integral orbital comparison and does not repair /2's separate obstruction. Delete the false q-bound in E38 instead of perpetuating it across two briefs.

The cited modularity and divisor-flatness repairs also interact. BHKRY's arithmetic-modularity theorem assumes `n≥3` and its model/lattice/discriminant conditions; its text specifically does not settle the compact rank-two case. Its stated flatness corollary has `n>2` and an exceptional-locus qualification. Liu's v1 result concerns a good-inert frame. These citations do not directly close every instance asserted in Zhang's induction or integral divisor theorem. Record the precise missing ranges and require a replacement theorem or checked independent base. This is not a verdict that those desired statements are false.

## Geometry, ownership and analytic inputs

The raw cofactor check in /5 is exact: the first column is the final basis vector, so the determinant has sign `(−1)^(n+1)`. The 2×2 example `[[1,3],[2,4]]` gives −3 versus the unsigned 3. Twenty independent integer computations across dimensions 2–6 recover that cofactor identity. These are checks of the algebraic statement, not tests or proofs of AFL. The sign disappears under the specified unramified character, so the character-valued transfer conclusion survives.

For /6, properness over the arithmetic base and finiteness of a different morphism to M must remain separate. The paper explicitly allows positive-dimensional bad special fibres of the fat CM cycle. For /7, local finiteness of divisors does not imply local finiteness of their Green-function tails; use a genuine convergence and smoothness theorem, with zero-vector terms handled separately. For /9, the regular pure-dimensional counterexample `Spec Z_p[x]` with support `V(px−1)=Spec Q_p` shows why the dimension formula must be an explicit premise of the filtration correspondence. For /25, Tate-cycle spanning yields the required numerical intersection identities, not general Chow spanning.

The generic arithmetic-divisor group and localized proper-cycle pairing need one higher-dimensional supplier extending R35.1. I recommend the proposed Arakelov Part II, with SF.5 and R35.1 imports; unitary and GSpin applications import its interface. The red team's alternatives would assign incompatible owners if applied together. Other extractions' generic formal K-theory obligations likewise need explicit forwarding to one FormalSupportedIntersections supplier. Record cross-file coordination for the maintainer within the fix's authorized scope.

For /18 the atlas is not devoid of Cohen–Macaulay algebra: R03.3 already owns it. Import its dimension-cut criterion, explicitly assign the general Koszul-resolution extension there and coordinate its IHG.6/derived-completion consumers. Formal Tor-vanishing is an application. Formal geometry should import AdicSpacesPartII:F0/SF.4. Generic manifold Schwartz theory similarly imports the existing spectral Schwartz proposal rather than becoming another private unitary construction. Landherr belongs to GN.2; fixed adelic identifications belong to the applications. Generic PEL/CM reuse requires actual comparisons of polarizations, levels and integral bases.

The missing cited analytic inputs in /19 and /27–34 must be extracted with actual statements and dependencies. Beuzart-Plessis's theorem is Lie-algebra FL; add the integral Lie-to-group bridge and any required semi-Lie bridge instead of attributing every version at every q to that theorem. The nonsplit-zero half is indispensable. Rank-one alternating-valuation checks give that zero half in the elementary case, but do not prove its higher-rank sign. Nilpotent cancellation, Fourier-transfer compatibility and the split restriction-of-scalars Weil comparison need their own supplier contracts. A paper saying an external proof applies verbatim is not a completed formal proof.

## Editorial and execution qualifications

For /35, retain descriptive candidate labels but map them explicitly to the queue's merged design jobs. The code allows subsequent restructuring; the finding's contrary instruction should not be followed. Replacing every candidate by a merged job ID can conceal a self-import. Name the actual supplier layers and their forward order within a merged roadmap.

For /38, update the current counts and repair status while preserving the report's explicitly marked checkpoint history. For /44, the source says Qbar: the overline was lost in text extraction. For /48, retain the paper's standing small-level scheme assumption; a stack extension is not required by this use. For /53, the nonarchimedean sentence of Lemma 12.13 starts on **p.950**, not p.951. The other confirmed low findings require explicit sign, chart, nearby-space, refined-invariant or sourceIssue corrections as detailed in the JSON.

Finding /55 is rejected because named theorems, corollaries and equation numbers already are explicit, unique source locators. The protocol does not require a printed page in every locator. Adding pages remains useful optional editing, but the accepted review's statement that many pages were added does not create a rule that every item must have them.

## Validation and handoff

Only the two issue-authorized review files were changed. The extraction, sourceIssues, routes, queue and atlas are inputs to this verification. The future fixer should implement the qualified corrections above and in each JSON reason, preserving one-owner boundaries and recording unresolved primary-proof obligations honestly.

Validation: `scripts/check_redteam.py` accepts the review; `intake.py check-files` checks both deliverables; `git diff --check` checks whitespace. The finding IDs were additionally compared for exact, unique coverage of all 57 input findings. No library implementation or source theorem has been claimed formalized.
