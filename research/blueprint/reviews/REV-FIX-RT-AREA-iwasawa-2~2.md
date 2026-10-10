# Independent fix review: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-fL1Mmj`, 10 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6103240035).
I did none of fixer `claude-6ZAIEy`’s work. This continuation checks the
prepared correction receipts and preserves the predecessor’s completed
bounded review, rather than attributing its exhaustive audits to this run.
The [immutable input report](https://github.com/CBirkbeck/tauceti-explorer/blob/303b02c8bda26170394f9f96f6c691391a2f8611/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
records `codex-jIGDIK`’s six-finding review, primary-source locators, pinned
library checks and the earlier audit chain. Its installed L3 and PMIA
receipts remain unchanged.

## Verdicts carried forward

| Finding | Verdict | Reason and remaining boundary |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | L3 accepted for the correction | Native units, continuous extension, signed recurrence and Gauss-sum normalization are corrected. Exact RD.6 coefficient and splitting statements remain supplier requests. Whole-file Lean elaboration stops at imports. |
| /2 Ferrero–Greenberg | L3-2 accepted receipt prepared | The derivative uses the even character branch, direct character weights, conductor correction and strict endpoint. Convergence and arithmetic nonvanishing remain separate inputs. Installation awaits file-scope authorization. |
| /3 Classical log-syntomic comparisons | D.1 accepted receipt prepared | Divided and undivided complexes, comparison legs, integral range and rational exponential normalization are distinguished. Proposed CS.0–CS.3 producers remain requests. Installation awaits file-scope authorization. |
| /4 Character orders, Fitting ideals and transpose | PMIA needs_changes | Arithmetic corrections are retained, but five generic plans must import current native results. Their reader, suggested file and consumers need coordinated revision. |
| /5 Finite slope for complexes | Retain accepted LAD correction | Degreewise compact representatives and cohomological spectral support are distinguished. Stronger homotopy, Stein and analytic solid comparisons remain gaps. |
| /6 Main-conjecture proof routes | Retain verifier’s rejection | Accepted RS-16 deliberately preserves independent Hecke/congruence and Euler-system proof methods. The alleged duplication does not justify replacing them. |

No mathematical statement, prerequisite, API, test, supplier obligation,
suggested Lean file or packet review record changes in this continuation.
The negative PMIA verdict completes that portion of the review; it is not a
reason to defer recording the remaining accepted verdicts.

## Fresh verification of the prepared receipts

For /2, checked [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
§1.2, p.461, and §4, equations (4.1)–(4.6), Theorem 4.1, pp.471–473,
against the L3-2 contract. A primitive odd tame character χ of conductor N>1
gives the even χω branch. The derivative’s Gamma sum uses χ(a), with
correction (1−χ(p))B₁,χ log_p(N), equivalently
−(1−χ(p))L(χ,0)log_p(N). Only χ(p)=1 removes the correction;
arithmetic nonvanishing remains independent. The prepared record preserves
five gaps, eight requests and the predecessor’s strict-endpoint repair.
This is a bounded verification, not a new 79-node audit.

For /3, checked [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2),
§§2.1–2.2, pp.4–8, including Theorem 2.2, p.7. Write U for the
p^r−φ fibre and D for the 1−φ_r fibre. The divisible ideal uses a lifted
level before reduction. U→D has legs (p^r,id), D→U has legs (id,p^r),
and their composites multiply by p^r. Only the former is asserted
multiplicative. The modified twist retains its factorial, and exact divided
comparison has 0≤i≤r≤p−2.

[Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16,
p.37, gives the rational exponential isomorphism for i<r and injection at i=r;
Theorem 5.4, p.54, supplies the bounded undivided comparison with the stated
root-of-unity/field-dependent alternatives.
[Nekovar–Niziol v5](https://arxiv.org/pdf/1309.7620v5), Remark 2.14,
p.14, and Proposition 4.13, pp.53–54, fix the boundary normalization.
D.1 retains rational inverse transport, the p^−r quotient-coordinate scale
and Bloch–Kato sign without asserting an integral inverse. Nine gaps,
twenty requests and the earlier 72-node audit remain intact.

These four public PDFs were fetched in this run. Their SHA-256 hashes equal
the values in the immutable input report. No book or source passage was
copied into the repository. Other source readings in that report are credited
to the predecessor; this continuation does not claim to have repeated them.

## Current native duplication in /4

Read current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:
`TauCeti/RingTheory/FittingIdeal/Basic.lean`, lines 278–365;
`TauCeti/RingTheory/FittingIdeal/BaseChange.lean`, lines 103–143; and
`TauCeti/Algebra/Module/AuslanderReiten/StableTranspose.lean`, lines 72–98.
The following replacement obligations remain:

| PMIA L6 node | Current native result and boundary |
| --- | --- |
| `higher-fitting-ideal` | `TauCeti.fittingIdeal`; finite modules over commutative rings |
| `higher-fitting-independence` | `TauCeti.fittingIdeal_eq_minorsIdeal_ker`; finite-free surjections |
| `relation-minors-add-generator` | `Submodule.minorsIdeal_ker_eq_of_surjective`; generating families, retaining the span/image adapter for arbitrary families |
| `higher-fitting-base-change` | `TauCeti.fittingIdeal_baseChange`; arbitrary commutative-algebra base change, without flatness |
| `transpose-stable-equivalence` | `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`; exact surjective projective presentations, opposite scalars and the stated dual factors |

The stable-transpose theorem uses arbitrary rings and assumes no finiteness.
The dual factors are P₀×Q₁ on the first side and P₁×Q₀ on the second.
All three native files are absent at programme pin f790474, verified with git
object checks; current reuse must not be misattributed to that pin. The
programme-pin transpose quotient and opposite/base scalar actions were also
read. The current read-only ArithmeticDirichletSeries, QuiverRepresentations
and StableReduction interfaces were consulted. No upstream file was edited
and no Lake command was run there.

A few node-kind changes would leave incompatible reader and consumer plans.
The revision must preserve deficient-relation, arbitrary-family and nonflat
controls, arithmetic order/index calculations and contragredient conventions.
The reader is outside this review’s scope. Retain `needs_changes`.

## Validation and precise completion blocker

Fresh `scripts/check_blueprint.py` runs pass for all four actual packets:
L3 has 1,663 nodes and 26 inherited short-API warnings; L3-2 has 79 nodes,
D.1 has 72 and PMIA has 487, each with zero warnings. All have zero errors.
Recursive checks find no excerpt fields. The two prepared records in the
handoff retain their original `codex-jIGDIK` attribution.

Fresh `lean-check` of L3 exits 1 at line 1 with unknown module prefix
`research`, before body elaboration. Available memory exceeded 20 GB.
Its sibling prototypes lack compiled artifacts in the shared search path;
their interfaces were preserved. The three unchanged other files retain the
predecessor’s successful sequential checks at the pinned build: L3-2 111,
D.1 307 and PMIA 1,075 `sorry` warnings only. Those are predecessor results,
not new runs. No Lean process remains running.

The live issue names only L3 and PMIA packet paths, whereas the queue and
unchanged `issues.deliverables_complete` require all four packets’ top
reviews to name this job. The actual predicate is False. Read-only
substitution of the prepared L3-2 and D.1 records makes it True. That
substitution changes only `review` and `reviewHistory`, preserves every
mathematical field and older history entry, and archives each complete prior
review, including its checked arrays. It does not install either record.

[WORKERS.md](../WORKERS.md) says: “Edit only the files the issue names, plus
your own scratch space.” Explicit authorization for the two omitted paths
was requested and is pending. The report and handoff are the only edits in
this checkpoint. No queue, completion predicate, issue body or label was
changed. Resume only after the live issue names the two paths or the
maintainer explicitly authorizes those review-only edits. Repeating the
bounded mathematical review will not resolve this scope mismatch.
