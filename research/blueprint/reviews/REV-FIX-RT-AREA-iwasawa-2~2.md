# Independent fix review: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-0rbyYu`, 11 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6104041487).
Input commit: `48928d01b026577b63ef377edce9d5b2a34a7493`.
I did none of fixer `claude-6ZAIEy`'s work.

## Result

The bounded six-finding correction review is finished. Its outstanding task is
installing two accepted review records. L3 already carries this job's accepted
record; PMIA already carries its justified `needs_changes` record. That negative
verdict completes the PMIA review: accepting its duplicate generic plans would
be incorrect.

The live issue names only L3 and PMIA, while the queue and unchanged
`issues.deliverables_complete` also require L3-2 and D.1. Actual completion is
False. Read-only substitution of the exact two prepared records makes it True.
[WORKERS.md](../WORKERS.md) says, "Edit only the files the issue names, plus
your own scratch space." I requested explicit authorization for changing only
`review` and `reviewHistory` in the two omitted packets. No answer or live-issue
scope repair has arrived. Neither record is installed; this submission is a
blocked checkpoint. The report and handoff are the only repository changes.

## Review evidence and attribution

The [immutable six-finding report](https://github.com/CBirkbeck/tauceti-explorer/blob/303b02c8bda26170394f9f96f6c691391a2f8611/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
records `codex-jIGDIK`'s correction review, primary-source locators, pinned
library checks and earlier node audits. The
[input continuation](https://github.com/CBirkbeck/tauceti-explorer/blob/48928d01b026577b63ef377edce9d5b2a34a7493/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
preserves `codex-YXQsbh`'s subsequent source readings and four Lean checks,
and `codex-kPnLrK`'s receipt preflight. Those exhaustive node audits, earlier
source readings and elaborations retain their original attribution.

This continuation checked the verified findings and fix report against those
reviews, independently reread the bounded /2 and /3 source contracts below,
reread the five current native /4 declarations, and verified exact receipt
preservation and current validation. It claims no new exhaustive node audit.

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

## Bounded source verification in this continuation

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
are in the handoff. Equations (4.5) and the Ertl–Niziol product conventions
were also checked visually. No book was used and no source passage was copied
into the repository. The /1, /4 arithmetic and /5 source audits remain credited
to the linked predecessor reports.

## Current native results in /4

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

## Preservation, validation and resumption

All four actual packets pass `scripts/check_blueprint.py` with the existing
pinned declaration index: zero errors. L3 has 1,663 nodes and 26 inherited
short-API warnings; L3-2 has 79 nodes, D.1 has 72 and PMIA has 487,
each with zero warnings. Recursive checks find no excerpt fields.

The exact L3-2 and D.1 candidates pass the same checker with zero errors and
zero warnings when substituted at their canonical paths in a read-only packet
context. Each candidate differs only in `review` and `reviewHistory`; its
history equals the old history plus the entire previous review, preserving
all 79 or 72 checked node verdicts and their original attribution. Every
other parsed field is equal. Input and candidate byte hashes match the
predecessor's guards reproduced in the handoff. All four actual packets and
all four suggested files remain byte-identical to input.

No Lean file changed and no new Lean run was needed. `codex-YXQsbh` previously
ran all four files through `lean-check`: L3 failed before body elaboration on
an unknown `research` import; L3-2, D.1 and PMIA elaborated with respectively
111, 307 and 1,075 expected proof-placeholder warnings only. Those are that
session's results. Do not weaken sibling interfaces to bypass unavailable
compiled prototype artifacts.

Resume after explicit authorization for the two omitted packet paths or a
live-issue scope repair. Install the two exact records, preserve the complete
older reviews, and require actual `deliverables_complete` to return True.
The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-2~2.md) provides the records,
hashes and final checks. No queue, completion predicate, issue body, label
or upstream file was changed. Repeating the source review cannot resolve the
remaining scope mismatch.

Final submission checks: `git diff --check` passes; `intake.py check-files`
reports two files and zero problems. Actual completion remains False, and the
read-only candidate completion remains True.
