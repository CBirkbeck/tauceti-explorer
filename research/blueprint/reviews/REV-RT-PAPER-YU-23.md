# REV-RT-PAPER-YU-23 — independent verification

Verifier: Codex, session **codex-J6LwjP**, 2 October 2026. Refs [#4061](https://github.com/CBirkbeck/tauceti-explorer/issues/4061).

All **41 findings are confirmed with the qualifications in the companion JSON**: 5 high, 19 medium and 17 low. Confirmation identifies a correction I would require; it does not endorse every sentence or every alternative in the submitted fix. In particular, findings 1, 4, 12, 15 and 40 need the corrected instructions below. The review changes only the two issue deliverables and supplies no source-errata verdict on the uncollated journal text.

I wrote, reviewed and red-teamed none of PAPER-YU-23, REV-PAPER-YU-23 or RT-PAPER-YU-23. The extraction includes a Codex checkpoint from a different session followed by Claude completion and review; the red team is Claude cc-c2c06b. Neither the session's own-deliverable registry nor its earlier work contains those jobs. I read the full findings, the affected extraction records, routes and review, the report's current and historical summaries, the relevant shared extractions and current owner contracts. The report has stale historical text; the accepted JSON is the object verified here.

## Sources and limits

The primary text is [Yu, arXiv:1807.04659v5](https://arxiv.org/pdf/1807.04659v5), 18 July 2022, 85 pages, SHA-256 `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c`, matching the extraction's receipt. Locators below are its printed pages, not journal pages. I checked the [Annals bibliographic record](https://annals.math.princeton.edu/2023/197-2/p01); I did not obtain and collate the published 109-page text. An issue in v5 is not evidence that the published version has the same issue, or that no correction exists elsewhere.

This was a targeted verification, not a new whole-paper extraction. I read the source passages covering the introductory targets and notation (pp2–12), geometric cutoff and Higgs comparison (§3.2–3.3, pp16–20), Arthur families (§4.2, pp23–30), spectral definitions and normalization (§5.2–5.3, pp32–44), the selector and eigenvalue formulas (pp47,50), the cuspidal-pair enumeration (p60), the recurrence and Jacobian specialization (pp64–65), the end of §7.3/Appendix A opening (pp74–75), and Appendix C (pp79–81). I searched the full §7.2–7.3 text for the claimed top-weight argument; I do not claim to have independently reproved the entire recurrence or every cited analytic prerequisite.

Additional primary receipts, all fetched for this verification:

| Source | URL and version | Pages read and purpose | SHA-256 |
| --- | --- | --- | --- |
| Mellit | [arXiv:1707.04214v1](https://arxiv.org/pdf/1707.04214v1), 19 pages | pp1–2, Thm1.1, degree independence, Weyl invariance and genus range | `300492e260092efd696f2e2d046603ab36ae0981c0f504709762b7e3cf6f9f6a` |
| Schiffmann | [arXiv:1406.3839v2](https://arxiv.org/pdf/1406.3839v2), 38 pages | opening theorem, pp2–5,7–8: Higgs/counting/cohomological contracts, Krull–Schmidt and descent | `7e5cbf6e3bb9caf4c48959493987c4543c2244cccdf17fa0fa426593a8639bb2` |
| Chaudouard | [author manuscript](https://webusers.imj-prg.fr/~pierre-henri.chaudouard/contrib-Laumon.pdf), 51 pages | pp18–19,24–25,29–30: shifted-HN splitting, Γ quasi-polynomiality and Lie-algebra trace kernel | `2ae48bde8a176d908e8af2cbb0df1cd9923d8ae758cdd108f384299d43601345` |
| Arthur 1981 | [author archive PDF 10](https://www.math.utoronto.ca/arthur/pdf/10.pdf), 74 pages | pp37–39, Lem6.2 and Cor6.5, including formulas checked as page images | `6bdf32990eb33b6d02a7bd858ace66fc85cebe2e97dca1a4be082afd958d3a43` |
| Arthur 1982 | [author archive PDF 14](https://www.math.utoronto.ca/arthur/pdf/14.pdf), 48 pages | printed pp1318–1320, Lem7.1 and root-basis/volume identity; formula images checked | `ee04f67ba0406eb4000b969d9885c7bb8b52e8486b9e1d3e7cfbe4a194294380` |

The preliminary Schiffmann v2 numbering differs from the published numbering quoted in the accepted extraction, and its degree-independence assertion is still a conjecture. I use Mellit's theorem for that assertion, not the preliminary conjecture. I verified Yu's explicit citations to Lafforgue, Moeglin–Waldspurger, Deligne–Flicker, Raynaud and the Appendix C suppliers; I did not freshly read all their original proofs. Finding 20 requires those missing source contracts to be tracked, not a claim that this review closes them.

## Ownership and ordering

I read the reviewed library coverage for the affected AS, AL, FA, GS, EDC and DWP stages and their current atlas descriptions/requirements, together with the relevant GS packet request. Plans and accepted extractions are not completed Lean proofs. AS.1 supplies cuspidal induction; AS.6's corpus explicitly does not supply a function-field trace formula. AL.3 includes local nonarchimedean theory that can be imported, but its global/archimedean contract does not cover all Yu's function-field L-functions. FA.6 supplies the cusp-form foundation; the GS packet requests multiplicity one from it. Ordinary multiplicity one and strong multiplicity one must be distinguished in that request.

The assembled atlas at this branch's base, commit `0f33df6`, has **2,956 stages and 8,563 distinct stage edges** after combining explicit stageEdges and requires (supplier to consumer, restricted to actual stages). Kahn sorting visits all 2,956. Thus it is acyclic now. The findings identify omitted extraction dependencies and cycles that would result from the design instructions, not cycles already installed in that stage graph. Examples checked directly:

- SF.3 → SF.4 → GS.0: duality cannot consume the full GS.0 bundle package.
- FA.6 → GS.0 and FA.6 → GS.6: cusp multiplicity one cannot be supplied by a later GS theorem to FA.6.
- EDC.2 → DWP.1 and EDC.2 → DWP.5: assigning the basic Weil group to DWP.5 does not by itself make it an admissible prerequisite of EDC.2.

The correct shared Weil reference is `PAPER-DELIGNE-80/s1a-1.1.10-weil-group-of-scheme`, not the abbreviated ID in the proposed fix. Separate intrinsic duality from its later Weil-equivariance adapter, or arrange an earlier shared Weil prefix. Do not insert DWP.5 into the early duality contract while retaining DWP.5's existing EDC.2 prerequisite.

The extraction has 392 recorded item-dependency edges. All 25 review-added items **155–179 have null dependencies and uses**, and none is listed as a dependency by an older item. Item154 already has three dependencies; it should not be described as wholly isolated in that same sense. The omissions are real even though the recorded graph sorts successfully. Populate both sides only after separating carriers/dictionaries from conclusions. Combining the submitted remedies literally would create 025↔157 and 033↔156. The generic lattice Γ lemma must precede the trace quasi-polynomial conclusion; the bundle–adele dictionary must precede the cutoff/counting comparison.

Reuse the accepted `CountingBundlesAndHallAlgebrasOfCurves` direction for bundle/Higgs/indecomposable mathematics, and the LPV Part II for the shared density/monodromy direction. The latter still needs the exact tricanonical curve-moduli adapter; a hyperelliptic-family monodromy contract is not the full result. Coordinate the function-field spectral extension with `PAPER-YUN-ZHANG-17/45`, whose PGL₂ theorem supplies an overlapping direction but not every GL_n statement in Yu.

`make_queue.paper_designs` groups Part II routes by parent and generates the parent's `PartII` (or `PartIII`) ID. It does not create Yu's bespoke counting ID. The current registry has 13 candidate routes under the GS parent, versus the finding's older nine-proposal snapshot; this count does not assert that every candidate is accepted. The generated-ID inconsistency and deferral risk remain. Finding12's assertion that Yu is independent of every other proposal is false: its spectral theory overlaps Yun–Zhang. A coordinated design or maintainer-reviewed split must preserve that shared owner, and every cross-paper reference must use the resolved ID. This review does not change the queue generator.

## Mathematical repairs that need explicit adapters

Mellit's all-degree result counts **absolutely indecomposable** bundles for g≥1. Yu's P_n^e counts all **isocline** bundles, which can be decomposable. For example, two degree-zero line bundles give a decomposable isocline rank-two bundle. The missing bridge in finding18 uses Galois descent of indecomposables and Krull–Schmidt's multiset Euler product at reduced slope e'/n'. Coefficientwise finiteness must be recorded. Once the A-polynomials are independent of degree, this product depends on n and n'=n/gcd(n,e), giving the asserted order dependence. Genus zero needs its separate splitting argument; importing Mellit does not silently extend the source's hypothesis.

For finding19, write the reflected factor as c(z)=f(u/z)/f(u). Its derivative at 1 is −uf'(u)/f(u). A root basis has m elements, giving (−1)^m, and the e=−1 cone contributes the same sign. The cancellation explains why (5.3.8) is correct even though a literal use of the unreflected corollary is insufficient. The new planning lemma must retain the meromorphic closed-disc domain, absence of boundary zeros/poles and probability Haar normalization.

The normalized rank-one shell computation used for findings34–35 is

`1 + (1 − q_v⁻¹) ∑_{m≥1} t^m = (1 − q_v⁻¹t)/(1 − t)`.

Here t includes the ordered character quotient and unramified parameter, and the initial convergence region precedes rational continuation. With ρ=δ^(1/2), the membership condition ρ_R⁻¹φ∈π requires the spherical basis ρ_Rφ_π. Record those conventions and the integrated-root label explicitly; they settle the local mismatch without proving every global analytic input in S2. In Arthur1982 the root-basis coefficients include `vol(a_M^G/Z(F∨))`; prove the type-A lattice cancellation before dropping them.

For finding40 the full Galois group of the specially chosen ordinary curve acts through every pair permutation/swap. An integer evaluation is Galois-fixed, including evaluations on constant-field powers. Export that full group in 121 and restore the paper's one-indexing-per-curve hypothesis in 122; multiplicative independence alone does not provide the indexing argument.

## Pinned library checks

I verified checkout HEADs against the full pins and read the following statements in their files. Public references:

- [TauCeti Krull–Schmidt](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/KrullSchmidt): `exists_indecomposable_decomposition`, `isLocalRing_end_of_isIndecomposable`, `exists_equiv_linearEquiv_of_isLocalRing_end`, `exists_equiv_linearEquiv_of_directSum_of_isLocalRing_end`.
- [TauCeti categorical indecomposability](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Preadditive/Indecomposable.lean): `indecomposable_of_injective_of_isLocalRing` and `indecomposable_iff_idempotent_eq_zero_or_id`, with the stated biproduct/idempotent-completeness assumptions.
- [TauCeti contour/divisor argument principle](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Contour/Argument/Divisor.lean): **`TauCeti.Contour.argumentPrinciple_divisor`**, with positive radius, closed-ball meromorphicity and zero sphere order.
- [Mathlib meromorphic divisor API](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Meromorphic/Divisor.lean): `MeromorphicOn.divisor`, `divisor_ball_support_finite`, `divisor_mul`, `divisor_inv`, `divisor_const_smul`.

These are partial suppliers. Bundles are not automatically finite-length modules. Transfer through finite-dimensional endomorphism algebras and the bundle category is still required. Likewise the divisor sends infinite order to zero; multiplication needs finite-order/nonzero-germ hypotheses before it supplies the advertised zero/pole additivity. The finite-sum/open-disc and scaled-variable wrappers in 172 remain missing.

## Record corrections and verdict ledger

The current extraction counts are **179 items: 11 library,25 planned,143 missing**, and **56 active sourceIssues**. The report opening and route lists lag behind them. The live E28 central-character typo is distinct from the withdrawn floor misreading with the same historical identifier; disambiguate that archive without reviving a false erratum. E7/E37's effects must match their explanations. E1's two locators need separately faithful printed excerpts. Add the zero coefficient convention on p5; preserve the corrected full statements, exact titles/IDs, Weyl invariance and precise locators.

The companion JSON contains a separate reason and corrected fix for every entry. All are confirmed; the concise ledger below records what each confirmation requires.

| Finding | Severity | Verdict | Required correction |
| --- | --- | --- | --- |
| RT-PAPER-YU-23/1 | high | confirmed | Early shared interfaces; DWP.5/EDC ordering |
| RT-PAPER-YU-23/2 | high | confirmed | Cusp/Whittaker owner and multiplicity one |
| RT-PAPER-YU-23/3 | high | confirmed | Split duality from slope inequalities |
| RT-PAPER-YU-23/4 | high | confirmed | One function-field spectral owner |
| RT-PAPER-YU-23/5 | high | confirmed | Shared Schiffmann bundle/Higgs imports |
| RT-PAPER-YU-23/6 | medium | confirmed | Shared density and curve-monodromy adapter |
| RT-PAPER-YU-23/7 | medium | confirmed | Partial ET carrier and missing stability |
| RT-PAPER-YU-23/8 | medium | confirmed | Built algebraic Krull–Schmidt suppliers |
| RT-PAPER-YU-23/9 | medium | confirmed | Discrete induction and family ordering |
| RT-PAPER-YU-23/10 | medium | confirmed | Split duality, purity and Euler contracts |
| RT-PAPER-YU-23/11 | medium | confirmed | Shared invariant-ring prefix |
| RT-PAPER-YU-23/12 | medium | confirmed | Resolve generated owner; preserve Yun–Zhang overlap |
| RT-PAPER-YU-23/13 | medium | confirmed | Exact final targets and quantifiers |
| RT-PAPER-YU-23/14 | medium | confirmed | Exact import titles/IDs and mirror-symmetry owner |
| RT-PAPER-YU-23/15 | medium | confirmed | Populate 155–179 edges without two-cycles |
| RT-PAPER-YU-23/16 | medium | confirmed | Drinfeld provenance/rank-two acceptance test |
| RT-PAPER-YU-23/17 | medium | confirmed | Separate Jacobian determinant/class-number input |
| RT-PAPER-YU-23/18 | medium | confirmed | Mellit-to-isocline descent/Euler-product bridge |
| RT-PAPER-YU-23/19 | medium | confirmed | Reflected-family sign cancellation |
| RT-PAPER-YU-23/20 | medium | confirmed | Track precise unmet prerequisite contracts |
| RT-PAPER-YU-23/21 | medium | confirmed | Arthur smooth/product inputs and normalization |
| RT-PAPER-YU-23/22 | medium | confirmed | Separate local GK and global Euler-product inputs |
| RT-PAPER-YU-23/23 | medium | confirmed | General-pair Ramanujan/purity input |
| RT-PAPER-YU-23/24 | medium | confirmed | Coefficient Euler characteristic and functional equation |
| RT-PAPER-YU-23/25 | low | confirmed | Current report counts and disambiguated E28 archive |
| RT-PAPER-YU-23/26 | low | confirmed | Corrections reach source-route consumers |
| RT-PAPER-YU-23/27 | low | confirmed | Import shared groupoid mass |
| RT-PAPER-YU-23/28 | low | confirmed | Replace planned algebraic uniqueness claims |
| RT-PAPER-YU-23/29 | low | confirmed | Include constant coefficient convention |
| RT-PAPER-YU-23/30 | low | confirmed | Faithful separately labelled E1 excerpts |
| RT-PAPER-YU-23/31 | low | confirmed | Export Weyl invariance |
| RT-PAPER-YU-23/32 | low | confirmed | Reuse pinned contour argument principle |
| RT-PAPER-YU-23/33 | low | confirmed | Align E7/E37 effect fields |
| RT-PAPER-YU-23/34 | low | confirmed | Settled local induction dictionary; narrowed S2 |
| RT-PAPER-YU-23/35 | low | confirmed | Explicit integrated-root/ordered-pair label |
| RT-PAPER-YU-23/36 | low | confirmed | Six bounded local indexing/type slips |
| RT-PAPER-YU-23/37 | low | confirmed | Split compound family/cone imports |
| RT-PAPER-YU-23/38 | low | confirmed | Partial divisor API with finite-order conditions |
| RT-PAPER-YU-23/39 | low | confirmed | Precise pp42/47/50 locators |
| RT-PAPER-YU-23/40 | low | confirmed | Full Galois action removes excess indexing hypothesis |
| RT-PAPER-YU-23/41 | low | confirmed | Top-weight proof source and dependency |

## Validation and handoff

`check_redteam.py` and the two-file intake check passed. A separate assertion checked all 41 target IDs occur exactly once, the 5/19/17 severity tally, and the 41 confirmed verdicts. JSON parsing, public-path scan and `git diff --check` passed. No Lean file is required or changed; no Lean compilation was attempted. No existing atlas, sourceIssue, extraction, queue or blueprint file was changed. The next fixer must apply the review JSON's qualifications before repairing dependencies, then recheck the resulting item and stage graphs and regenerate the reader report.
