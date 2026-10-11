# REV-DrinfeldModulesAndTModules--DM.8

**Verdict: `needs_changes`.** The independent review is finished. The packet and suggested file have been corrected within issue #515's authorized paths. All nodes and baseline citations are justified, with the three existing gaps stated honestly. The remaining contradiction is in the definitive companion reader, which this review is not authorized to edit. It must agree with the corrected packet before acceptance and promotion under PROTOCOL §§8 and 13.

Reviewer: Codex, session `codex-H2yAfU`, 2026-10-11. The reviewed work was written by other sessions, including `codex-hjdg0j` and `codex-hNQyYt`; this reviewer took no part in it. No promotion, restructuring, or other roadmap edit is included.

## Counts and scope

| Item | Before | After |
|---|---:|---:|
| Nodes | 48 | 48: 29 verified, 19 corrected |
| Definitions/constructions | 11 | 11 |
| API items | 43 | 43 |
| Named definition tests | 33 | 33 |
| Planets | 6 | 6 |
| Baseline declarations | 54 | 56, all confirmed |
| Supplier requests | 8 | 9 |
| Gaps | 3 | 3 |
| Source issues | 6 | 8, all independently confirmed |
| Source entries | 6 | 7 |

No node was added, removed, or weakened. The inherited nine-node fixed-vector component remains at its original granularity; the rest is a target-level plan. Each definition/construction has three meaningful tests and an API covering its particular operations. The tests distinguish exact constants, matrix invertibility, inverse-Frobenius conventions, coefficient fields, determinant inverses, and boundary cases. All 43 API names and 33 test names occur in the suggested file. The six planets retain the central constructions and named theorems, without promoting smaller proof steps to planets.

The packet remains `complete`, meaning a completed planning pass. DM.8 remains `planned`, with concrete work in `coverage.remaining`; no theorem is claimed to be implemented. This review does not return the packet merely because those gaps remain open.

## Sources checked independently

Sources were read directly, rather than inferred from the preceding worker's extraction. All source records and findings use our own words.

| Text | Reading used for this review |
|---|---|
| [PAP-v2](https://arxiv.org/pdf/math/0506078v2) | Entire preprint, printed pp.1–39; all node locators and proof chains. Rendered pp.21, 30, and 38 checked for coefficient-field notation, kernel block dimensions, and the division hypothesis. |
| [ABP-v1](https://arxiv.org/pdf/math/0207168v1) | §§2.1–2.5, pp.6–7; §3, pp.7–16, including the full lifting proof and Proposition 3.1.3; Proposition 4.3.2, p.21. |
| [Published ABP](https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p06.pdf) | §§2–3, printed pp.244–256, including the full lifting proof; Proposition 4.3.2, pp.262–263. The hypotheses used here agree with the preprint. |
| [Ngo Dac, HAL](https://hal.science/hal-03298790/document) | §§4.1–4.3, printed pp.16–18; §5.2, pp.20–21. These multizeta applications consume the shared theory. |
| [CCM-v2](https://arxiv.org/pdf/2205.09929v2) | §4.1, p.13; Lemma 5.1.1 and proof, pp.22–24. |
| [IKLNP-v2](https://arxiv.org/pdf/2205.07165v2) | §2.1, Theorem 2.2, p.26; §2.2.1, p.27; uniqueness and denominator use, p.33. |
| [CPY-v2](https://arxiv.org/pdf/1411.0124v2) | Proposition 2.2.1 and complete proof, p.6; rendered matrix-domain notation and adjacent period convention. |

The published Papanikolas and CPY article metadata were checked, but their full published texts were not obtained. Findings against these papers are scoped to the recorded preprints. The packet records URLs, dates, hashes for the texts read, and publication-access limitations. Fresh arXiv, publisher, and author-page correction searches are recorded as searches that located no relevant correction, not as proof that no correction exists.

The inverse coefficient Frobenius fixes `t`; the analytic exact constants and its higher powers have the correct coefficient fields. The ABP entire ring keeps both algebraic coefficients and the finite coefficient-field condition; it is narrower than a general entire-series ring. Integral trivialization keeps the determinant condition, and the ABP lifting statement keeps its polynomial matrix, entire vector, and specialization hypotheses. The logarithm extension is verified as a dual Anderson object through `C ⊗ X`, not through polynomial freeness alone. The chosen Carlitz-period sign follows PAP/ABP; alternative normalizations in consumer papers need the DM.2 adapter rather than an unproved identification of chosen periods.

## Corrections made

The packet's per-node `review.checked` list records every verdict. These groups account for all 19 corrected nodes:

| Nodes | Change |
|---|---|
| `coefficient-twist`, `entire-series`, `abp-estimates`, `abp-lifting`, `logarithm-motive-membership` | Added independently collated published ABP locators. |
| `tate-analytic-interface` | Named the existing current univariate restricted-series norm and its coefficient/Gauss-norm API, alongside multivariate completeness. These postdate the pin. |
| `neutral-category`, `tannakian-identification`, `carlitz-group` | Imported the already planned arbitrary-field MC.6 reconstruction and relevant finiteness recognition. Narrowed requests to the remaining category-generation, group-map criteria, and graded-category computation. Retained the base field `F_q(t)`. |
| `solution-ring` | Replaced a blanket SF.1 dependency with pinned native `Spec` and the surjective-ring-map closed-immersion theorem. |
| `solution-ring-simple`, `difference-torsor` | Cited the exact SF.1 affine descent and torsor nodes. The simplicity proof precedes, and does not circularly use, solution-ring ideal descent. |
| `relative-algebraic-closure` | Cited existing SF.3 degree bounds; requested only the additional curve/divisor Frobenius transport. |
| `difference-smooth-dimension`, `difference-invariants` | Assigned dimension and dense algebraically closed points to their exact SF.0 nodes, and descent to SF.1. Smoothness uses the finite-type group criterion. |
| `entire-from-equation` | Removed an irrelevant SF.1 dependency; made the remaining Lang base-extension requirement precise. |
| `period-transcendence` | Assigned dimension to SF.0 and added a separate bounded-generator filtration-growth request there. Dimension alone does not prove the needed growth comparison. |
| `logarithm-group-linear` | Imported SF.1 torsor diagrams and narrowed its remaining request to splitting vector-group torsors over arbitrary fields, after this particular kernel is proved vectorial. |
| `constant-denominator` | Linked the rational matrix domain to the independently confirmed existing CPY correction. |

The suggested file's supplier comments now track these contracts. Its typed declarations were unchanged.

Current MC.6, SF.0, SF.1, SF.3, and FA.0 supplier statements were read. Existing neutral reconstruction applies over arbitrary fields, including imperfect `F_q(t)`; a characteristic-zero connectedness result is not substituted. Supplier packets with `needs_changes` are contracts, not accepted or compiled implementations. The current Lang points signature uses the algebraic closure of a finite field. Matrices here can have entries in the larger field `bar(k)`, so the request explicitly includes surjectivity of the Lang morphism after base extension and inverse-Frobenius normalization there.

The reviewed DM.8 library audit was checked. Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and TauCetiRoadmap `070dc2becd74419e76303ede84b465ed4a69461f` were inspected read-only. The JacobianChallenge and GrothendieckEulerForms readers were read in full, and relevant AdicSpaces preparation and ReductiveGroupsPartII Lang statements/signatures were checked. Existing norm, Riemann–Roch, preparation, Lang, and reconstruction work is imported from its owner.

## Baseline and source findings

All 54 inherited declarations were opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, and their hypotheses were checked against their uses. None was removed. Two native citations were added and confirmed: `AlgebraicGeometry.Spec`, in `Mathlib/AlgebraicGeometry/Scheme.lean`, and `AlgebraicGeometry.IsClosedImmersion.spec_of_surjective`, in `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean`.

Critical distinctions remain explicit: `Algebra.IsSeparable` is an algebraic-extension class; the general analytic extension uses geometric reducedness and the requested field-theoretic criterion. Tau Ceti's smoothness theorem concerns finite-type commutative Hopf algebras, not arbitrary geometrically reduced schemes. Its Hopf-comodule Tannaka isomorphism begins with a supplied Hopf algebra and cannot alone construct the group of an arbitrary neutral category. The native basis-map injectivity theorem requires independence of the prescribed images, which the fixed-vector argument establishes.

Every source issue now has this review's `confirmed` verdict and reason:

| Issue | Independent finding |
|---|---|
| E-DM8-1 | PAP Proposition 3.3.14, p.16: independently ranked tensor factors require different matrix sizes. |
| E-DM8-2 | PAP §3.4.1, p.17, and Proposition 3.4.7, p.19: the representing matrix is square. |
| E-DM8-3 | PAP Theorem 3.5.4, p.21: the graded category's coefficient field is `F_q(t)`, as its endomorphism field requires. |
| E-DM8-4 | PAP Lemma 4.5.7, p.30: the kernel matrix is the vertical block `[-C; I]`, of size `s × (s−m)`. |
| E-DM8-5 | PAP Theorem 5.2.2, p.33: the geometric quotient is undefined at rank one; the finite sum gives `d+1`. |
| E-DM8-6 | PAP Proposition 6.1.3, p.34: the basis column must include `m_0`. |
| E-DM8-7, added | PAP Theorem 6.4.2, p.38, invokes the nonzero-exponential Lemma 6.4.1 for a theorem allowing zero exponentials. A nonzero period is the simplest missing case. The packet already handles it separately through the Carlitz kernel theorem, without weakening the independence statement. |
| E-DM8-8, added as reuse | CPY Proposition 2.2.1, p.6: rationalized-motive homomorphisms have rational matrices. Multiplication by `1/t` on a trivial rank-one motive checks the slip. This is the known `PAPER-NGODAC-21/E10`, not a new discovery. |

## Remaining work and orchestrator question

The three honest gaps remain: the specific logarithm-group projection's separability verification; compiled motive/category interfaces; and matching analytic, arithmetic, Lang-transport, and filtered-growth exports. A smooth group surjection alone is insufficient to settle the first. No general unipotent-torsor splitting claim is made over an imperfect field.

The sole condition for the next acceptance review is reader reconciliation. In `research/blueprint/readmes/DrinfeldModulesAndTModules--DM.8.md`, revise:

1. The introduction's eight requests and 54 baselines to nine and 56, and the source audit's six unreviewed findings to eight confirmed findings.
2. The MC.6 request at line 951 and omission note at line 996: reconstruction is already planned; only the narrower remaining exports are requested.
3. The SF.1 request at line 969: reuse its existing descent/torsor nodes, retain only vector-torsor splitting, and put dimension and filtered growth in SF.0.
4. Each affected node's direct inputs and proof route using the 19 corrections above, plus the new native Spec citations, published ABP reading, and precise Lang transport requirement.
5. The source-issue table and source-version records, preserving the preprint/publication limitations and the three honest gaps.

Question for the orchestrator: which revision job will authorize this companion-reader reconciliation? No new mathematical scope or additional roadmap layer is requested. Issue #515 does not authorize that reader path, so this completed review leaves it unchanged.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/DrinfeldModulesAndTModules--DM.8.json`: **0 errors, 0 warnings**. Source-issue and source-version validation passed. The suggested file elaborated with `lean-check` at the pinned build, exit 0, with only the intended `sorry` warnings. All definition/API/test names were cross-checked; `git diff --check` passed. Elaboration validates signatures and does not prove the proposed results.
