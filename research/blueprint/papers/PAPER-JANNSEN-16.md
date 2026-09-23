# PAPER-JANNSEN-16: Hasse principles for higher-dimensional fields

Uwe Jannsen, [Annals of Mathematics 183 (2016), 1–71](https://annals.math.princeton.edu/2016/183-1/p01), DOI 10.4007/annals.2016.183.1.1.

Original extraction: Claude Code, cc-39fac3, issue #1172. Independent revision: Codex — codex-a71f92, issue #1173, 23 September 2026. Status: **partial**, review **revise**. This replaces the earlier complete claim, not the original author's provenance.

The [result JSON](PAPER-JANNSEN-16.result.json) contains 84 items: 4 library, 9 planned, 71 missing; 9 routes; 18 prerequisite entries; 23 reviewed source findings; 12 explicit closure gaps. Every currently listed missing item is assigned once. That routing invariant is not a claim that every proof dependency has been extracted.

## Source and version control

The [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf) is authoritative for numbering and statements. Independent review read all 71 pages, including references. Its SHA-256 is `26dde9260f6475e4f6acbfbe651e18fac0d443a5f318fbf3974efc9f809f7d71`.

The original extractor reports reading all of [arXiv v2](https://arxiv.org/pdf/0910.2803v2) from TeX. The reviewer checked selected corresponding passages, not the entire v2 a second time. The v2 PDF has 70 pages and SHA-256 `99ccd6b5ea5c2aef30d98c3b60e060c1169dd77e32d45542b513d4a6ca90f6f4`; its [source archive](https://arxiv.org/src/0910.2803v2) has SHA-256 `de9543f0a71a986166a683154981c67e95b113abfbcc3313ceed34028586812e`.

The original version comparison is retained:

| arXiv v2 | Published |
| --- | --- |
| Theorems 0.1, 0.2 | Theorems 0.4, 0.6 |
| Corollaries 0.3, 0.4 | Corollaries 0.7, 0.8 |
| Theorems 0.5, 0.6, 0.7 | Theorems 0.9, 0.10, 0.11 |

Published §§4–5 retain resolution hypotheses for the complex/finite-field conclusions. The v2 alteration argument and hyperenvelope appendix (§§6–7) were removed; they cannot silently strengthen the published theorem. The published text adds the Chow-correspondence check, Lemma 5.20, and the naive/extended homology comparison. In contrast, the field injectivity theorem for coefficients invertible in the global field remains unconditional.

## What can be used mathematically

For a primary function field F of transcendence degree d over a global field K and n invertible in K, Theorem 0.4 proves injectivity of the degree d+2, twist d+1 global-to-local cohomology map. Theorem 0.6 is its divisible-coefficient counterpart. Corollary 0.8 is the mod-2 case; Corollary 0.7 gives p(F)≤2^(d+1) for finitely generated characteristic-zero F with d=trdeg_Q F≥2.

Theorems 0.9–0.11 concern Kato-complex homology, with their respective number-field, invertibility, connectedness and resolution hypotheses. The unrestricted Kato conjectures are now explicitly labelled conjectural propositions in /3, /9 and /11. The common proof uses Hochschild–Serre, weights, torus cohomology, alterations, residue/Gersten comparison, and weight homology.

The main new source finding does not refute these Hasse theorems: Proposition 5.4, an intermediate arbitrary-divisor statement, omits nonemptiness on curve strata. Taking two disjoint fibres in P¹×P¹ gives the weight complex 0→A²→A and H_1=A. Requiring the new divisor to meet every curve-stratum component fixes the proof's missing surjection; the later ample-hyperplane choices satisfy this. An independent affine-complement hypothesis remains necessary for Proposition 5.7.

## Library and atlas boundaries

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Reviewed library audits were read for the cited arithmetic, étale, weight and alteration suppliers. Where a newly restructured layer has no keyed audit entry, this is not treated as an affirmative audit.

The four added library records reuse, with statements opened at those pins:

| Item | Existing declaration | What it does not provide |
| --- | --- | --- |
| /75 | `continuousCohomology` | arithmetic duality or geometric comparisons |
| /76 | `TauCeti.KummerCoeff` | all twists or wild logarithmic coefficients |
| /77 | `CategoryTheory.SpectralSequence` | a geometric weight/niveau sequence or convergence |
| /78 | `CategoryTheory.PreOneHypercover` | all-degree proper motivic hyperenvelopes |

All-degree cohomological transfer and coefficient colimits are imported from the upstream ProfiniteCohomology Layer 10 (/79), not rebuilt inside an alteration roadmap. A separate coinvariant transfer (/80) has a different direction and its own proof.

DWP.7, not just its export layer, proves smooth proper purity. R34.1 handles representation conventions. R09.7d's quasi-projective compactification interface does not alone supply every arbitrary-proper resolution or motive adapter. MC.0–MC.1 begin with projective correspondences; Jannsen's smooth proper generators need a checked comparison. CR.4 ordinary de Rham–Witt, CR.5 log structures, and logarithmic étale Hodge–Witt purity are not interchangeable.

## Routing verdicts

| Route | Destination | Independent verdict |
| --- | --- | --- |
| 1 | HigherLocalFieldsAndHigherClassFieldTheory | reject |
| 2 | HigherLocalFieldsAndHigherClassFieldTheory | accept |
| 3 | ArithmeticGaloisDuality | accept |
| 4 | SchemeAndStackFoundations | reject |
| 5 | DeligneWeightsAndPurity | accept |
| 6 | CrystallineCohomology | reject |
| 7 | PrimeToDegreeAlterations | accept |
| 8 | QuadraticFormsRealFunctionFields | accept |
| 9 | MotivesPartIIWeightHomology | reject |

Routes 2, 3 and 5 are useful source directions after the stated corrections. Routes 7 and 8 join existing candidate identifiers, not competing roadmaps. The real-function-field brief now correctly imports only the parent's low-degree Pfister/Witt API; general Pfister and ordering/function-field inputs remain in the shared Part II.

Routes 1, 4, 6 and 9 remain held for atomic decomposition or a missing provider/ownership comparison. In particular E2/L5 hypercovers do not automatically provide GS96 motivic-envelope descent, and Theorem 5.13 assumes only homology factors through motives, not the chain-valued functor itself.

The overall **revise** verdict prevents queue application of all routes at this point, including the five individually supported directions. See the [review JSON](PAPER-JANNSEN-16.review.json) for exact reasons.

## Source mistakes and remaining work

All original E1–E9 were checked. E9 was narrowed: its claim that citing Lemma 5.17 for the comparison consequence is itself wrong was withdrawn; four concrete bad cross-references remain. E8's disconnected counterexample affects the isolated stated result, not merely typography.

E10–E23 record the missing Proposition 5.4 hypothesis; p-degree exponent; characteristic-p weak-approximation counterexample; filtration/twist slips; the torsion restriction on finite-field H¹; transfer-composition order; homology-only versus chain-level motivic factorization; variance, dimension, spectral-page and complex-typing slips. Each has an independent verdict and reason in JSON.

The journal page, arXiv history, Crossref relations and institutional record were checked for existing corrections. None was located. Author-homepage access failed; this limitation is recorded rather than interpreted as proof that no correction exists.

G1–G12 name the outstanding work, its consumer item ids, and precise scope. These include wild specialization, universal Gersten exactness, primary/purely inseparable models, proper/projective motives, finite-field Bertini and equivariant correspondence descent. No unresolved concern is promoted to a confirmed source mistake.

## Verification

The paper checker, paper/queue/source-issue unit tests, and scratch integrity/counterexample regressions are run for this revision; exact results are recorded in the independent review and handoff. This is an extraction review. No Lean deliverable was requested, no Lean was compiled, and no formalization is claimed.
