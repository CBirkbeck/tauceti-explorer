# Independent fix review: REV-FIX-RT-AREA-iwasawa-2~2

## Blocked checkpoint: codex-dcA0Fs, 11 October 2026

Codex (GPT-6), session `codex-dcA0Fs`. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6104967696).
Input commit: `bc4260a13e69365200d657c1ddf2fe7a5ffe877c`.
This session did none of the fixes under review.

The bounded review of all six findings is complete in the attributed evidence
below. L3 carries this job's accepted verdict and PMIA its justified
`needs_changes` verdict. Completion requires installing the two exact L3-2
and D.1 review records preserved in the handoff. Their mathematical content,
prior node reviews and open supplier obligations are unchanged.

The live issue omits both packet paths. The queue and the unchanged
`issues.deliverables_complete` require them. [WORKERS.md](../WORKERS.md)
says, "Edit only the files the issue names, plus your own scratch space."
Explicit authorization to change only `review` and `reviewHistory` in the two
omitted packets was requested through the asynchronous worker-conversation
question, after reconstructing and checking both exact candidate records. No
approval has arrived; neither packet has been edited. The permitted report and
handoff record the concrete, checked changes ready for installation.

## Checks performed by this session

Read the live issue after claim confirmation, original six findings, verifier
decisions, fix report, preceding review and handoff, and completion rule.
Reproduced both candidates from the exact handoff records. Their input and
candidate SHA-256 hashes match the predecessor's guards. Each candidate appends
the entire prior top review to `reviewHistory`, preserving all 79 L3-2 and
72 D.1 checked-node verdicts with their original attribution. Every parsed field
other than `review` and `reviewHistory` is identical.

All four actual packets pass `check_blueprint.py` with the existing declaration
index at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: zero errors. L3 has 26 inherited
short-API warnings; the other three have zero warnings. The two prepared
candidates pass at their canonical paths in a read-only checker context with
zero errors and warnings. Actual completion is False; substitution of only
the exact two prepared records makes it True. This is a diagnostic check,
not a change to the completion rule or a claim that the records are installed.

Current read-only TauCetiRoadmap and Tau Ceti retain the commits cited below.
No source rereading or Lean elaboration was repeated for these metadata-only
changes. Earlier source and Lean checks remain credited to their original
sessions. All four actual packets and all four suggested files are unchanged.
No process remains running, and no upstream file, issue body, label, queue or
completion rule was edited.

## Review evidence and attribution

The [immutable six-finding report](https://github.com/CBirkbeck/tauceti-explorer/blob/303b02c8bda26170394f9f96f6c691391a2f8611/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
records `codex-jIGDIK`'s correction review, primary-source locators, pinned
library checks and earlier node audits. The
[input continuation](https://github.com/CBirkbeck/tauceti-explorer/blob/48928d01b026577b63ef377edce9d5b2a34a7493/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
preserves `codex-YXQsbh`'s subsequent source readings and four Lean checks,
and `codex-kPnLrK`'s receipt preflight. Those exhaustive node audits, earlier
source readings and elaborations retain their original attribution.

The preceding `codex-0rbyYu` and `codex-lR9937` continuations checked the verified findings and
fix report against those reviews, reread the bounded /2 and /3 source contracts
and the five current native /4 declarations, and verified exact receipt
preservation. These predecessor source readings remain their evidence; this session
reproduced only the metadata preservation and completion checks. No new
exhaustive node audit is claimed.

| Finding | Verdict | Reason and remaining boundary |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | Retain L3's bounded acceptance | Native-unit values, signed unit/nonunit recurrence, dyadic modulus-four congruence and negative Gauss-sum normalization are corrected. Precise RD.6 coefficient bounds and splitting remain supplier requests. Whole-file Lean elaboration previously stopped at imports. |
| /2 Ferrero–Greenberg | Accept L3-2's bounded correction; record prepared | The even character branch, direct character weights, conductor correction and strict endpoint are explicit. Convergence and arithmetic nonvanishing remain separate inputs. |
| /3 Classical log-syntomic comparisons | Accept D.1's bounded correction; record prepared | Divided and undivided complexes, comparison legs, factorial twist, exact integral range and rational exponential normalization are distinguished. CS.0–CS.3 remain producer requests. |
| /4 Character orders, Fitting ideals and transpose | Retain PMIA's `needs_changes` | Arithmetic corrections are sound; five generic plans duplicate current native results. Reader, suggested-file and consumer plans need coordinated revision. |
| /5 Finite slope for complexes | Retain the accepted LAD correction | Compactness belongs to degreewise representatives; spectral support is cohomological. Stronger homotopy, Stein and analytic-solid comparisons remain gaps. |
| /6 Main-conjecture proof routes | Retain the verifier's rejection | Accepted RS-16 preserves independent Hecke/congruence and Euler-system methods. The alleged duplication does not justify replacing them. |

LAD, the restructure and the reader/consumer revision are outside this job's
file scope. No mathematical statement, prerequisite, API, test, source,
supplier obligation, gap, node verdict or suggested Lean file changes here.

## Preserved source verification: codex-KJ9aP3

For /2, read [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
§1.2, p.461, and §4, Theorem 4.1 and equations (4.3)–(4.6), pp.471–473.
Equation (4.5), printed p.472, gives the derivative on the even χω branch for
a primitive odd tame character χ of conductor N>1. Its Gamma sum uses χ(a),
and its conductor correction is −(1−χ(p))L(χ,0)log_p(N), equivalently
(1−χ(p))B₁,χ log_p(N). The general-prime setup does not exclude p=2;
the packet explicitly uses dyadic Teichmüller conductor four. Removing the
correction requires χ(p)=1. This identity alone asserts no nonvanishing.
The packet retains its five gaps, eight requests and strict-endpoint repair.

For /3, read [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2),
§§2.1–2.2, pp.4–7. The divisible ideal is formed at a lifted level before
reduction. For undivided U and divided D, U→D has legs (p^r,id), D→U has
legs (id,p^r), and both composites multiply by p^r. Product compatibility is
asserted for the first map. The modified twist includes its factorial;
Theorem 2.2, p.7, gives the exact divided comparison for 0≤i≤r≤p−2
under the fine, saturated, log-smooth hypotheses.

[Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16,
p.37, gives a rational exponential isomorphism for i<r and injection at i=r.
[Nekovar–Niziol v5](https://arxiv.org/pdf/1309.7620v5), Proposition 4.13,
pp.53–54, identifies the resulting map to Galois H¹ through the syntomic
spectral sequence with the Bloch–Kato exponential. D.1 keeps rational inverse
transport and the p^−r coordinate scale; it asserts no integral inverse or
endpoint surjectivity. Its nine gaps and twenty requests remain explicit.
These checks support the prepared bounded record, rather than a new 72-node
audit or proof of the proposed suppliers.

All four PDFs are public versions fetched on 11 October 2026. Their hashes
are in the handoff. The predecessor checked equation (4.5) and the
Ertl–Niziol product conventions visually and read their PDF text layers. This
continuation performed no new source reading. No book was used and no source
passage was copied into the repository. The /1, /4 arithmetic and /5 source
audits remain credited to the linked predecessor reports.

## Preserved native verification in /4: codex-KJ9aP3

At current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`,
read the statements in `TauCeti/RingTheory/FittingIdeal/Basic.lean`,
lines 278–365; `TauCeti/RingTheory/FittingIdeal/BaseChange.lean`,
lines 103–143; and
`TauCeti/Algebra/Module/AuslanderReiten/StableTranspose.lean`, lines 72–98.

| PMIA L6 node | Native replacement and hypotheses |
| --- | --- |
| `higher-fitting-ideal` | `TauCeti.fittingIdeal`: finite modules over commutative rings |
| `higher-fitting-independence` | `TauCeti.fittingIdeal_eq_minorsIdeal_ker`: finite-free surjections |
| `relation-minors-add-generator` | `Submodule.minorsIdeal_ker_eq_of_surjective`: retain the span/image adapter for arbitrary generating families |
| `higher-fitting-base-change` | `TauCeti.fittingIdeal_baseChange`: arbitrary commutative-algebra base change; no flatness assumption |
| `transpose-stable-equivalence` | `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`: exact surjective projective presentations over arbitrary rings |

The transpose theorem assumes no finiteness. Over the opposite ring its dual
factors are P₀×Q₁ and P₁×Q₀, on the first and second sides respectively.
All three native files are absent at programme pin `f790474`, verified by
Git object checks. Cite their current commit, rather than attributing them to
the programme pin. Relevant ArithmeticDirichletSeries and StableReduction
interfaces were consulted in current TauCetiRoadmap at
`070dc2becd74419e76303ede84b465ed4a69461f`.

A coordinated revision must preserve deficient-relation, arbitrary-family and
nonflat controls, arithmetic order/index calculations and contragredient
conventions. Relabelling a few packet nodes alone would leave incompatible
reader and consumer plans. Retain `needs_changes`. The upstream checkouts were
read only; no Lake command ran there.

## Installation and remaining work

The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-2~2.md) preserves the exact
records, input/candidate hashes and installation assertions. Explicit scope
authorization or a repair of the live issue's deliverable list is required.
After installation, require the actual completion rule to return True and run
packet, intake and whitespace checks. Keep L3, PMIA and all suggested files
byte-identical. A finished review retains PMIA's `needs_changes` verdict;
coordinated reader, suggested-file and consumer revisions remain work for the
owning revision job. No new exhaustive mathematical review is needed.

This checkpoint changes only the report and handoff. It does not install the
prepared records or satisfy actual completion. The scope request is pending;
its lack of an answer is not authorization. No second issue was claimed.

Final submission checks: `git diff --check` passes and
`intake.py check-files` reports two files and zero problems.
