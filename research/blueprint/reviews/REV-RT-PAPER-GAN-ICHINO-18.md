# Verification of RT-PAPER-GAN-ICHINO-18

Job `REV-RT-PAPER-GAN-ICHINO-18`, issue #4107. Codex, session
`codex-J6LwjP`, 30 September 2026. Reviewed repository base `41a10fa`.

**All twelve findings are confirmed**, with corrections to several proposed
fixes. Findings 1–6 have medium severity; 7–12 have low severity. The individual
verdicts and actionable qualifications are in
[RT-PAPER-GAN-ICHINO-18.review.json](../redteam/RT-PAPER-GAN-ICHINO-18.review.json).
This verifies the twelve findings, not the entire extraction afresh.

The extraction was written by `cc-d67081`, its review by `cc-39fac3`, and the
red-team report by `cc-f805bf`. I did none of those jobs. This session previously
verified the same red-teamer's Dor extraction findings, including a related
metaplectic scope question; no verdict here relies on that review.

**Evidence and method.** I read all twelve findings and their report, the prior
extraction review, the named extraction items and all six routes, including the
full Part II brief. Searches over all 104 item statements and the 48
prerequisites checked the omission claims. The current item counts are one
library item, 21 planned items and 82 missing items. A citation in a prerequisite
list or an explanatory note does not supply the missing statement and route.

I read MP.2–MP.6, AL.2–AL.4, SR.2–SR.3, ET.6 and ML.4, and the relevant coverage
entries in the MP.0, AL and ML packets. MP.3–MP.6, AL.2–AL.4 and ML.4 remain
`not_read` there. The reviewed library audit entries for MP.3 and AL.2–AL.4
were consulted. These findings do not challenge a pinned Lean declaration;
this verification makes no new claim that a declaration exists or is absent at
Mathlib `082e2d3` or Tau Ceti `f790474`, and does not turn an assigned source
route into a completed construction.

I compared the exact named items, routes and accepted review verdicts in
`PAPER-GAN-SAVIN-23`, `PAPER-GAN-SAVIN-23-B`,
`PAPER-CAI-FRIEDBERG-KAPLAN-24`, `PAPER-EISCHEN-HARRIS-LI-ETAL-20`,
`PAPER-ICHINO-PRASANNA-23` and `PAPER-JIANG-ZHANG-20`. The current world loaded
by `check_links.load_world()` contains 2,028 stages and 221 roadmaps. Searches
for exterior/symmetric squares, Shahidi, Yamana, Jacquet–Shalika,
Bump–Ginzburg, Satake exponents, Fell topology and weak containment produced
no stage supplying the omitted analytic square-factor or metaplectic-bound
statements. Unrelated algebraic exterior-square matches were excluded.

Public sources were fetched independently. The passages used were:

| Source | Passages checked |
| --- | --- |
| [Gan–Ichino, published Annals paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v188-n3-p05-s.pdf) | pp. 967, 978, 980, 982–983, 988–989, 993, 997–998 and 1002–1005 |
| [Gan–Ichino, arXiv v3](https://arxiv.org/pdf/1705.10106v3) | p. 31, compared with the published p. 1004 citation and test-function choices |
| [Ishimoto, arXiv v2](https://arxiv.org/pdf/2301.12143v2) | pp. 21–22, Theorems 3.11–3.14; p. 51, conclusion of the proof of 3.12 |
| [Ban–Jantzen, author copy](https://faculty.siu.edu/_common/documents/faculty/math/personnel-docs/ban/glasnik.pdf) | introduction, Theorem 1.1, Definition 2.1, Remarks 4.2 and 4.5 |
| [Prasad–Schulze-Pillot, IAS copy](https://repository.ias.ac.in/36293/1/36293.pdf) | p. 14, the averaging map and Lemma 4.4 |
| [Gan–Savin, published G₂ paper](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf) | pp. 28–30, globalization; p. 33, Definition 11.5, Proposition 11.6 and Corollary 11.7 |
| [Gan–Qiu–Takeda, arXiv v3](https://arxiv.org/pdf/1207.4709v3) | pp. 3–4, first-term/boundary conventions; pp. 6–7, Theorems 1.3–1.4; pp. 52–53, first occurrence and doubling |
| [Takeda–Trias, author preprint](https://jtrias.xyz/mvw_involution.pdf) | pp. 1–2, Theorem A and the metaplectic MVW scope |

The Ishimoto verification is explicitly against arXiv v2. The attempted
Prasad author-hosted published download failed certificate verification; the
IAS copy is the version actually read. The original MVW book and Yamana's
complete paper were not reread. Their full proof decompositions remain tasks
for the relevant construction jobs, not accomplishments of this verification.

**Verdicts and fix boundaries.** The suffixes below refer to finding IDs
`RT-PAPER-GAN-ICHINO-18/1` through `/12`.

| Finding | Verdict | What must be corrected |
| --- | --- | --- |
| 1 | Confirmed | Give MP.3 the local cover-induction prerequisites; separate later packet labels and global character choices. |
| 2 | Confirmed | State the functional equation, local epsilon compatibility and complete L-function inputs, with the existing owners distinguished from new adapters. |
| 3 | Confirmed | Route the unplanned square-factor theory and the metaplectic convergence/nonvanishing input instead of leaving the compound items wholly planned. |
| 4 | Confirmed | Add the almost-everywhere unitarity lemma; include the unramified quadratic-twist case. |
| 5 | Confirmed | Give the shared weak-containment API and Poincaré construction single owners, preserving consumer-specific hypotheses. |
| 6 | Confirmed | Share the p-adic quotient theorem through SR.3; preserve the characteristic-zero restriction and the separate intertwining/archimedean inputs. |
| 7 | Confirmed | State the actual source-qualified inner-product identity and regularization input. |
| 8 | Confirmed | Retain AL.3 as owner of isobaric strong multiplicity one and correct downstream design imports. |
| 9 | Confirmed | Share the local MVW and stable-range nonvanishing inputs; preserve the additional similitude and unitarity adapters. |
| 10 | Confirmed | Replace the open decomposition check with Ishimoto's proved input, retaining the packet-label comparison. |
| 11 | Confirmed | Record the narrow citation gap and the nonzero Whittaker-projection construction at the auxiliary principal-series places. |
| 12 | Confirmed | Add structured source-version provenance; E7 triggers the checker requirement. |

For **1**, the demonstrated cycle is at the level of assigned constructions:
the parent consumes objects assigned to its extension. I did not identify a
cycle in an already assembled atlas graph. Local preimages and induction must
be available before the Jacquet and local theta statements. Adelic induction,
packet labelling and the application to the global theorem remain separate.

For **2–4**, the generic Euler-product operation and its analytic inputs must
remain distinct. In particular, AL.4 does not supply a bound merely by taking
one as a hypothesis. The new bound cannot be deduced from the classification
whose proof needs it. A completed L-function at the central point requires
continuation and local comparison, not convergence of its defining product
there. The unitarity proof must also include the quadratic unramified character
case already mentioned in the original review. The Tadić source route assigns
work to ET.6; it does not certify that work as done.

For **5**, the shared result should use Fell closure and isolation relative to
the family in question. There is an elementary reason not to copy the literal
increasing-index subsequence wording into a general API: take distinct isolated
irreducibles `sigma` and `tau`, with `pi_1 = sigma` and `pi_i = tau` for `i > 1`.
Then `sigma` is contained in the direct sum, but no infinite increasing-index
subsequence converges to it. Closure, or a sequence allowing repetition, gives
the valid conclusion needed here. The same ownership correction must not
generalize the other, group-specific isolation results. The Poincaré construction
must retain the conditions on test functions, periods, support and cuspidality;
the two consumers have different adapters. This qualification is to the proposed
fix, not a new red-team job on the Gan–Savin extraction.

For **6**, the Ban–Jantzen quotient theorem does not automatically supply CFK's
real-group classification or the realization of a quotient as an intertwining
integral. Splitting that compound item avoids losing those tasks when its
shared p-adic part is rerouted.

For **7**, the missing formula should be supplied with its precise range,
first-occurrence/cuspidality conditions, measures and normalized factors.
GQT's first-term discussion treats the boundary central value separately;
its Theorem 1.3 has a strict second-term inequality. The proposed schematic
formula is therefore not, by itself, a sufficient replacement statement.
The common doubling theory should be imported from its owner.

For **8–9**, these are coordination corrections between accepted source
routes. GI's AL.3 route itself stays correct. The MVW input should cover the
specific groups and categories needed, with a separate proof of EHLS's
similitude twist; the phrase “all type-I groups” is too broad to adopt without
qualification. Stable-range nonvanishing is only one part of the GI item:
Li's unitarity and rank bijection remain additional work.

For **10**, the old open question about the range of the decomposition is
settled by the theorem actually stated on Ishimoto v2 p. 22 and proved on
p. 51. This does not erase the obligation to identify packet labellings or
justify a broader claim about all Arthur multiplicity formulas.

For **11**, the correction concerns which argument proves the existence of
the auxiliary test functions. It neither withdraws Proposition A.2 nor
re-verifies the older E7 counterexample. The current extraction already
recognizes the missing distinction in a note. The formal plan should make
the Bernstein-component nonzero-projection lemma explicit. I checked the
[Annals article page](https://annals.math.princeton.edu/2018/188-3/p05),
[arXiv version listing](https://arxiv.org/abs/1705.10106), the v3 passage, and
targeted searches for an erratum and this citation; no correction was located
in those checks. The future source-issue entry should retain that limited
search provenance.

For **12**, `versions_checked(data, data["sourceIssues"])` from
`scripts/check_errata.py` reproduces the missing-`sourceVersions` diagnostic.
It is E7's `affects: "a stated result"` that triggers it. I independently
reproduced these file hashes:

| Version | SHA-256 |
| --- | --- |
| Published Gan–Ichino | `be54266f6155d2a0724f1c675bebbbcf2d44950dce4c0bd03a337d14f87d68c0` |
| Gan–Ichino arXiv v3 | `5d1408c5f8bc15a5ceec04a465ceb80cb7265da218138d5a746418ee8b4b291d` |
| [Gan–Ichino arXiv v1](https://arxiv.org/pdf/1705.10106v1) | `55e6c4eda2ba74c5812f0de5480fcb915a5698b3d21474f5a0b6ca2c256d7b01` |
| Ishimoto arXiv v2 | `76cbb46c32bfa836536717ac22a7caf336474e49cca4dd295796d198fe99aa58` |

The v1 file was downloaded and hashed only. Historical reading dates in the
extraction should be preserved as historical evidence, not presented as this
review's reading dates. A passing paper checker does not replace the separate
source-version rule.

**Validation.** `check_redteam.py` on the review, `intake.py check-files` on
both deliverables, and `git diff --check` pass. A read-only run of
`check_paper.py` on the existing extraction also passes. Only this review JSON
and report are submitted. No Lean file was changed or compiled; there is no
Lean deliverable in this job.
