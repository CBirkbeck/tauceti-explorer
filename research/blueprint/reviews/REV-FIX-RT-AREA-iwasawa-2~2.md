# Independent correction review: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-rTvrry`, 11 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219);
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6106537487).
Input commit: `20f5269874fb14bdf618f0c984e5b448e682acb0`.
This session authored none of the fixes under review and claimed one job.

## Status and exact blocker

**Scope-blocked checkpoint.** The bounded correction review is ready, but two
required review records remain uninstalled. The live issue names L3 and PMIA;
`queue.json` additionally requires L3-2 and D.1. Those two packets still name
their preceding layer reviews, so the actual, unmodified
`issues.deliverables_complete` predicate returns false. Substituting only the
two exact candidate texts in memory makes it return true. PMIA's negative
verdict counts as a completed review and is not this blocker.

[WORKERS.md](../WORKERS.md), Doing the work, says:
“Edit only the files the issue names, plus your own scratch space.”
After preparing and validating concrete metadata-only changes, I requested
explicit authorization through the worker conversation for
`research/blueprint/packets/DirichletPadicLFunctions--L3-2.json` and
`research/blueprint/packets/PadicHodgeRegulators--D.1.json`. No answer has arrived.
The live issue's comments contain no scope authorization. The queue's broader
output list does not override the issue-file restriction.

This continuation changes only this report and the handoff. Every packet,
review history and Suggested file stays byte-identical. Existing L3 and PMIA
records already identify this correction-review job; I did not rotate their
metadata or add another identical history entry. The handoff preserves the
exact two candidates, their attribution, input/output guards and resume steps.
Authorize those paths or reconcile the live issue before redispatching.
This checkpoint is blocked on scope, not elapsed time.

## Six finding decisions

Read the six claims in `RT-AREA-iwasawa-2.result.json`, their verifier records
in `RT-AREA-iwasawa-2.review.json`, the round-two fix report, the relevant
correction contracts in the four packets and the attributed preceding reviews.
Fresh bounded source and native-library checks support these dispositions.

| Finding | Verdict | Reason and remaining obligation |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | Retain L3's bounded acceptance | Signed natural values, continuous units, both recurrences, dyadic congruence control, negative Gauss sum and root normalization are explicit. RD.6 coefficient and splitting inputs remain requests. |
| /2 Ferrero–Greenberg | Accept L3-2's bounded correction; record prepared | Direct character weights and the conductor correction agree with the source. Simplification requires χ(p)=1; nonvanishing and analytic convergence remain separate. |
| /3 Classical log-syntomic comparison | Accept D.1's bounded correction; record prepared | Divided and undivided complexes, directed maps, product behavior, factorial twist, exact integral range, rational scaling and boundary sign are distinguished. CS.0–CS.3 remain external requests. |
| /4 Character orders, Fitting ideals and transpose | Retain PMIA's `needs_changes` | Arithmetic order and adjugate repairs are supported. Five generic plans duplicate current native declarations; packet, reader, Suggested and consumers need coordinated revision. |
| /5 Finite slope for complexes | Retain the LAD correction | Degreewise Fredholm products depend on the representative; cohomological spectral support is invariant. Stein and derived solid localization retain their additional hypotheses and gaps. |
| /6 Main-conjecture proof routes | Retain the verifier's rejection | Accepted RS-16 I.5 intentionally retains independent Hecke/congruence and Euler-system routes. Replacing the former would discard a planned method. |

LAD and RS-16 are read-only context. This is a correction review, not a new
exhaustive audit of all packet nodes. The earlier 79-node and 72-node ledgers
keep their original authorship. The exact candidate records retain
`codex-jIGDIK`'s attribution and dates.
The [full six-finding audit](https://github.com/CBirkbeck/tauceti-explorer/blob/303b02c8bda26170394f9f96f6c691391a2f8611/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md),
[historical compiler evidence](https://github.com/CBirkbeck/tauceti-explorer/blob/2790a6eabe10c8b46527cb1a6333eee4d577e572/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
and [input review](https://github.com/CBirkbeck/tauceti-explorer/blob/20f5269874fb14bdf618f0c984e5b448e682acb0/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
remain immutable evidence. Replacing the nested checkpoint prose here does not
alter their records or any packet history.

## Fresh source checks

Fetched all nine public PDFs in the handoff on 11 October 2026 and reproduced
every SHA-256 receipt. No book was used. Source texts and images stayed in
disposable scratch. The following are correction statements in my own words.

For /1, [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
§1 Lemma 1/Theorem 1, pp.255–256, supports the signed continuous unit-valued
extension and separate unit/nonunit recurrences, with the dyadic congruence
exception retained. [Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
§1 equations (1.2), (1.5), (1.6) and Theorem 1.7, pp.570–571, fixes the
negative Gauss sum and normalized root of −p. Its original setup assumes odd
p; the dyadic calculation remains separate. I inspected these scanned pages
visually. L3 retains sixteen gaps and thirteen requests.

For /2, [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
§1.2 p.461, §4 equations (4.1)–(4.6)/Theorem 4.1 pp.471–473 and Appendices A–B
pp.473–474, supports primitive odd tame χ, compatible embeddings, the even χω
branch including conductor four at p=2, and a common logarithm. The Gamma sum
uses χ(a), with correction (1−χ(p))B₁,χ log_p(N). Removing that correction
requires χ(p)=1. The preceding review's strict-endpoint repair remains explicit;
Appendix B's original endpoint formula is not adopted without that repair.
Five gaps and eight requests remain, including analytic convergence and
nonvanishing obligations.

For /3, [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2
pp.4–8/Theorems 2.2–2.3 pp.7–8, distinguishes U and D and the lifted divisible
ideal. The maps U→D and D→U have legs (p^r,id) and (id,p^r); both composites
multiply by p^r. Only U→D preserves products in general. The modified twist
includes the factorial. Exact divided comparison requires 0≤i≤r≤p−2 and the
stated fine, saturated, log-smooth hypotheses; undivided comparison has bounded
torsion error. [Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4),
Corollary 3.16 p.37 and Theorem 5.4 p.54, gives rational exponential
isomorphism for i<r and injectivity for i=r, separately from the integral
error bound. [Nekovář–Niziol v5](https://arxiv.org/pdf/1309.7620v5),
Remark 2.14 p.14 and Proposition 4.13 pp.53–54, fixes the Bloch–Kato boundary
sign. Inverse comparison and p^−r scaling are rational. Nine gaps and twenty
requests remain; no integral inverse or completed CS.0–CS.3 producer is claimed.

For /4, [Dasgupta–Kakde v3](https://arxiv.org/pdf/2010.00657v3), §§2.2–2.3
pp.15–18, Lemma 3.9 pp.25–26 and §6.1/Lemma 6.1 p.40, supports the character
image order, sharp transport to inverse characters, finite cardinality with
nonzerodivisor hypotheses and the right-sided higher-adjugate image. The
transpose remains over the opposite ring. Eighteen gaps and three requests
remain. These repairs do not resolve the ownership defect below.

For /5, [BCGP21 v3](https://arxiv.org/pdf/1812.09269v3), §6.1.1 p.139, uses
a bounded projective Banach representative and its degreewise Fredholm product.
Cohomological support supplies the invariant construction. LAD's acyclic
two-term test retains products (1−aT)² and 1 for different models.
[BCGP25](https://arxiv.org/pdf/2502.20645), Definition 2.2.17 p.21 and
§4.6.46–Remark 4.6.47 pp.93–94, requires dense restrictions in a countable
affinoid exhaustion and relative compactness for Stein spaces. Its derived
solid finite-slope functor pulls to the character space and pushes back;
monoid inversion alone does not supply that functor.

## Native-library and ownership checks

Read the four relevant library-coverage records and actual native statements
at programme pins Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:
`ContinuousMap.unitsOfForallIsUnit`, positive `gaussSum`, `TauCeti.teichmuller`
and the opposite-ring cokernel definition of Auslander–Reiten transpose.
The continuous-unit lift requires a continuous ring-valued function whose
values are units; the Gauss-sum application requires the explicit sign change.

Separately read the following current Tau Ceti statements and the five PMIA
node contracts at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. They are not
attributed to the old pin.

| PMIA L6 node | Native declaration and boundary |
| --- | --- |
| `higher-fitting-ideal` | `TauCeti.fittingIdeal`, finite modules over commutative rings |
| `higher-fitting-independence` | `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, finite-free surjections |
| `relation-minors-add-generator` | `Submodule.minorsIdeal_ker_eq_of_surjective`; arbitrary-family span/image comparison remains an adapter |
| `higher-fitting-base-change` | `TauCeti.fittingIdeal_baseChange`, arbitrary commutative-algebra base change, without flatness |
| `transpose-stable-equivalence` | `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`, exact surjective projective presentations over arbitrary rings, without finiteness |

The last result is in `TauCeti/Algebra/Module/AuslanderReiten/StableTranspose.lean`.
Its dual factors are P₀×Q₁ and P₁×Q₀ on the respective sides over the opposite
ring. A coordinated revision must preserve arbitrary-family and nonflat tests,
arithmetic order/index calculations and contragredient conventions. Merely
relabelling five packet nodes would leave duplicated definitions and proofs in
the reader and Suggested file. That revision is a separate job.

Current TauCetiRoadmap is read-only at
`070dc2becd74419e76303ede84b465ed4a69461f`. I consulted its SemisimpleAlgebras
and ProfiniteArithmetic README contracts as upstream models. No upstream
roadmap or generic carrier is planned again here.

## Validation and limits

All four actual packets pass `check_blueprint.py` with the programme-pinned
declaration index: zero errors. L3 retains 26 inherited short-API warnings;
the other packets have none. Both exact candidates also pass at their intended
packet paths using a read-only text overlay; the checker, queue and completion
predicate are unchanged. Both pass `intake.file_problems`. Every non-review
field and complete earlier review is preserved, including both node ledgers.
No packet or candidate contains an `excerpt` field. All eight actual
packet/Suggested hashes match the handoff. Actual completion remains false.
`git diff --check` passes, and intake's changed-file check reports two files
with zero problems. Only the report and handoff are in the diff.

No Lean file changed and no compiler ran this session. The preceding
`codex-k2zZva` checkpoint records four sequential `lean-check` outcomes: L3
failed before body elaboration on the unresolved `research` module prefix;
L3-2, D.1 and PMIA succeeded with 111, 307 and 1,075 `sorry` warnings and no
other diagnostics. These are historical results, not fresh compilation.
L3 still imports four modules under `research.blueprint.suggested`.

Resume by obtaining authorization for the two omitted paths, installing the
exact guarded review records and requiring actual completion. Disposable
scratch is unnecessary to resume: the handoff contains the records, guards,
receipts and preservation checks.
