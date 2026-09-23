# REV-ERRATA-PAPER-BRESCIANI-24

**Verdict: confirmed with corrections, in the versions explicitly specified.**

Reviewer: Codex, session `codex-7e92bd`, 23 September 2026. Original errata author: Claude Code, session `cc-fb70e5`. I did not write the original errata or this paper’s extraction.

## Evidence and scope

I downloaded and compared [arXiv 2108.13397v3](https://arxiv.org/pdf/2108.13397v3) with the [published Inventiones PDF](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf), volume 235 (2024), 129–150. Both contain the six main-paper findings. This removes the original errata’s limitation that it had not itself fetched the final article. I read the affected passages, definitions and proof dependencies, including published pp.129, 133, 135, 138, 140–146 and 148. The first E1 preprint citation is on p.4, the second on p.5.

I independently read the actual supplier statements: Bresciani’s published Propositions A.18 and A.23; Schmidt’s Theorem A; Stix’s cuspidal Theorem 17 and Remark 18; and Stix’s density Theorem B. Their links and the mathematical checks are in the revised errata. I also read the statement and full proof of Lemma 5.8 in [Essential dimension and pro-finite group schemes, arXiv v2](https://arxiv.org/pdf/1904.00789v2). That dependency’s published PDF led to a subscription page and its institutional accepted PDF returned HTTP 403. E7 is therefore certified only for the directly read preprint.

The JSON records source hashes, exact version scope and per-finding correction searches. I checked the arXiv histories, publisher pages, Crossref metadata for the main article, the author’s institutional publication page and title/erratum searches on 23 September 2026. No correction was located. A bounded search of Pop’s 2026 follow-up, with its introductory Bresciani references read, found no correction of these passages; the former unqualified claim that it makes no comments on Bresciani has been removed. These searches do not prove that no correction exists.

## Individual verdicts

| Finding | Verdict and independent check |
| --- | --- |
| E1 | **Confirmed.** Read the two main-paper references in both versions, then the cited published appendix. A.18 requires an algebraic separable extension; A.23 supplies the arbitrary characteristic-zero extension needed here. The smooth finite-type curves satisfy its hypotheses. Corrected the first v3 page number. |
| E2 | **Confirmed; reach corrected.** On P¹ over Q minus the degree-two point T²−2, the point 0 gives a geometric section but there is no rational boundary point and thus no cuspidal section. This section is also t-b.l., so inserting that adjective would not repair the sentence. Schmidt’s existence/splitting result does not imply the printed cuspidality assertion. Changed affects to a stated result for the false unnumbered universal claim. Traced the missing reduction through Lemma 16, the paragraph after Definition 18 and the start of Theorem A. The example does not disprove Theorem A; a complete repair of the remaining parabolic case is not supplied here. |
| E3 | **Confirmed.** The lemma assumes geometric or cuspidal images, whereas the proof asserts all images are cuspidal. Verified the cofinal repair: first identify the unique associated point, then use only opens omitting it. Added the missed citation-part correction: Stix 17(1) gives cusp uniqueness and 17(3) separates cuspidal from geometric sections; 17(2) is packet injectivity. Checked the finite-generation hypothesis behind point injectivity. |
| E4 | **Confirmed, with narrow scope.** The choice-free comparison is with the generalized Albanese torsor’s gerbe. The supplied object γ(*) neutralizes it, so the Tate-module proof can continue. The paper already mentions the preferred object in its next sentence; the finding records the missing torsor/choice argument, not a failure of Lemma 8 or a need to assume a rational point of X. |
| E5 | **Confirmed.** The lift uT²+T over Q[u]_(u) produces R×Q(u), not a finite local algebra. A monic same-degree lift is finite free with unit discriminant, and its field special fiber makes it local and hence a DVR. This evident repair justifies retaining misprint/affects nothing. Clarified the image point f(p) in the residue-field notation. |
| E6 | **Confirmed.** Read Stix’s density-one integrality alternative in Theorem B of the local-conditions paper. The final article already cites that supplier correctly in Lemma 16; the opening of §6 points to the 2013 book instead. This is a citation slip, not a repair of E2. |
| E7 | **Confirmed for arXiv v2 only.** The inverse limit of the A[n]-bands is TA, agreeing with the lemma statement. Added the adjacent action target error: an action on the torsor A₁ lands in A₁, as the displayed trivialization itself requires. Both are clear misprints; publication comparison remains unverified. |

## Changes and remaining mathematical limitation

All three original identifiers are preserved and now have independent verdicts. Four omissions from the later extraction are added as E4–E7, with independent checks and verdicts. E3 and E7 incorporate adjacent slips discovered during source reading. The explanation and JSON agree on classifications, repairs and version scope. The extraction and generated central register are outside this issue’s deliverables and were not edited.

E2 remains an explicit mathematical gap in the printed route to the full theorem. Recording a correct counterexample to the auxiliary claim and identifying the missing step completes this errata review; it does not make that missing argument proved. The other repairs are justified in the findings.

## Verification

Checked the E2 rational-point/boundary example directly and the E5 comaximal-factor identity, nonfiniteness and corrected étale-local construction algebraically. No numerical experiment is used as a substitute for these general arguments.

Repository checks passed:

- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-BRESCIANI-24.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/reviews/REV-ERRATA-PAPER-BRESCIANI-24.md research/blueprint/errata/PAPER-BRESCIANI-24.json research/blueprint/errata/PAPER-BRESCIANI-24.md`
- `git diff --check`

No Lean file is required or compiled. Only the three named deliverables are changed. Public source downloads and provenance remain in the worker’s scratch space.
