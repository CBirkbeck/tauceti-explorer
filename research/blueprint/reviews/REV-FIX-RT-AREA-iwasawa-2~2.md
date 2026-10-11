# Independent fix review: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-Ocof1q`, 11 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219).
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6105241649).
Review base: `1e39b91ecd76e1bfdf116c6502efc2f2b5fd3b7f`.
This session authored none of the fixes under review.

## Verdict and scope blocker

The bounded six-finding correction review is ready to finish, with three
accepted packet records and PMIA's justified `needs_changes`. L3 and PMIA
already name this review job. Two prepared metadata-only records would finish
its queue obligations: L3-2 and D.1. Their full earlier reviews, with 79 and
72 node decisions respectively, are archived intact in each candidate's
`reviewHistory`; every mathematical field is unchanged.

The live issue names only L3 and PMIA as files under review, while the queue
requires all four packets. [WORKERS.md](../WORKERS.md), Doing the work, says:
“Edit only the files the issue names, plus your own scratch space.” The issue
also restricts edits to its files under review. After preparing and validating
the exact two-record change, I requested explicit authorization in the worker
conversation for the two omitted packet paths. The question remains pending.
Neither candidate has been installed. Actual dispatch completeness is false;
a read-only substitution of the candidates makes it true. This is a blocked
checkpoint, not a finished review.

The complete earlier mathematical review remains available in the
[attributed six-finding report](https://github.com/CBirkbeck/tauceti-explorer/blob/303b02c8bda26170394f9f96f6c691391a2f8611/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md).
The [immediately preceding report](https://github.com/CBirkbeck/tauceti-explorer/blob/1e39b91ecd76e1bfdf116c6502efc2f2b5fd3b7f/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
preserves subsequent readings and elaborations with their original attribution.
The handoff reproduces the exact remaining records, not a fresh exhaustive
node audit. Installing them requires only scope authorization or a corrected
live issue; another mathematical audit cannot resolve that restriction.

## Finding decisions

Read all six claims, verified decisions and the round-two fix report. The
following decisions retain their earlier attribution; direct checks by this
session are identified in the following sections.

| Finding | Verdict | Reason and remaining boundary |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | Retain L3's bounded acceptance | Signed natural values, unit-valued continuity, unit/nonunit recurrence, dyadic modulus-four exception and negative Gauss-sum normalization satisfy the correction contract. The exact RD.6 coefficient and splitting inputs remain supplier requests. The source audit is the predecessor's. |
| /2 Ferrero–Greenberg | Accept L3-2's bounded correction; record prepared | Direct character weights, the even branch, conductor correction and strict endpoint are explicit. Convergence and arithmetic nonvanishing remain separate inputs. |
| /3 Classical log-syntomic comparison | Accept D.1's bounded correction; record prepared | Distinct divided/undivided complexes, directed comparison maps, factorial twist, exact integral range and rational exponential scaling are retained. CS.0–CS.3 remain producer obligations. |
| /4 Character orders, Fitting ideals and transpose | Retain PMIA's `needs_changes` | Arithmetic corrections are sound under the preceding source audit. Five generic plans duplicate current native Tau Ceti declarations, freshly verified below. Reader, Suggested and consumer plans need coordinated revision. |
| /5 Finite slope for complexes | Retain the LAD correction | The current packet distinguishes representative-wise compactness and the auxiliary nonalternating degree product from invariant cohomological spectral support. Stronger homotopy, Stein and solid comparisons retain their gaps. The source audit remains the predecessor's. |
| /6 Main-conjecture proof routes | Retain the verifier's rejection | Read the accepted RS-16 decision for I.5: it deliberately retains independent Hecke/congruence and Euler-system methods. There is no basis for replacing one by an import of the other. |

LAD and the restructuring decision are read-only context. PMIA's negative
verdict finishes its part of this review; its coordinated revision belongs
to a separate job.

## Direct source checks in this session

Fetched four public PDFs on 11 October 2026; their hashes match the preceding
receipts in the handoff. Read their text layers at the locators below and
visually checked Zhao p.472 and Ertl–Niziol p.7.

For /2, [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
§1.2 p.461, §4 Theorem 4.1/equations (4.1)–(4.6) pp.471–473 and Appendix A
p.473, supports the formula on the even χω branch for primitive odd tame χ.
The Gamma sum weights are χ(a); its correction is
−(1−χ(p))L(χ,0)log_p(N), or (1−χ(p))B₁,χ log_p(N). The general-prime setup
supports the packet's dyadic convention. Removing the correction requires
χ(p)=1; nonvanishing needs a separate argument. Five gaps and eight requests
remain unchanged.

For /3, [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2
pp.4–8/Theorem 2.2 p.7, supports the lifted divisible ideal and the directed
maps U→D with legs (p^r,id), and D→U with legs (id,p^r). Both composites
multiply by p^r; only the first map preserves products in general. The
modified twist carries the factorial, and the exact divided comparison uses
0≤i≤r≤p−2 with fine, saturated, log-smooth hypotheses.
[Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16 p.37
and Theorem 5.4 p.54, distinguishes the rational exponential range from the
bounded-error integral comparison.
[Nekovář–Niziol v5](https://arxiv.org/pdf/1309.7620v5), Remark 2.14 p.14
and Proposition 4.13 pp.53–54, fixes the Bloch–Kato boundary sign.
The packet's inverse comparison and p^−r coordinate scaling are rational;
endpoint injectivity asserts no surjectivity. Nine gaps and twenty requests
remain unchanged. These are checks of the bounded corrections, not a claim
that their proposed suppliers are implemented.

## Direct native-library checks in /4

Read the five statements at current Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Their modules are
`TauCeti/RingTheory/FittingIdeal/Basic.lean`,
`TauCeti/RingTheory/FittingIdeal/BaseChange.lean` and
`TauCeti/Algebra/Module/AuslanderReiten/StableTranspose.lean`.

| PMIA L6 node | Native replacement and hypotheses |
| --- | --- |
| `higher-fitting-ideal` | `TauCeti.fittingIdeal`: finite modules over commutative rings |
| `higher-fitting-independence` | `TauCeti.fittingIdeal_eq_minorsIdeal_ker`: finite-free surjections |
| `relation-minors-add-generator` | `Submodule.minorsIdeal_ker_eq_of_surjective`: the arbitrary-family span/image adapter still needs its own comparison |
| `higher-fitting-base-change` | `TauCeti.fittingIdeal_baseChange`: arbitrary commutative-algebra base change, without flatness |
| `transpose-stable-equivalence` | `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`: exact surjective projective presentations over arbitrary rings, without finiteness |

The last comparison is over the opposite ring, with dual factors P₀×Q₁
and P₁×Q₀ on the first and second sides. Read the corresponding PMIA node
statements and hypotheses: the library is at least as general for these
contracts. Coordinate packet, reader, Suggested and consumer revision while
preserving arbitrary-family and nonflat controls, arithmetic order/index
calculations and contragredient conventions. Relabelling packet nodes alone
would not complete that correction.

Read the reviewed library-coverage records and consulted current
ArithmeticDirichletSeries and StableReduction README/Suggested interfaces
at TauCetiRoadmap `070dc2becd74419e76303ede84b465ed4a69461f`.
These are existing owners; their current material must not be replanned from
the older atlas snapshot. The current native declarations above are not
attributed to programme pin `f790474`.

## Validation and continuation

All four actual packets pass `scripts/check_blueprint.py` with the existing
Mathlib `082e2d3`/Tau Ceti `f790474` declaration index: zero errors. L3 retains
26 inherited short-API warnings in its Kubert development; the other three
have none. Both exact candidates also pass with zero errors and warnings.
All four packets contain no `excerpt` field. Entire existing reviews and
histories, node ledgers, sources, gaps and requests are preserved in each
candidate. All four actual packets and Suggested files remain byte-identical
to the review base. The two additional paths are queue-owned and pass intake
content checks. Actual `deliverables_complete` is false; the read-only
candidate diagnostic is true, with the predicate and queue unchanged.

No Lean file changed, so the preceding elaborations were not repeated.
`codex-YXQsbh`'s checks remain its evidence: L3 stops at the `research` import;
L3-2, D.1 and PMIA elaborate with 111, 307 and 1,075 admission warnings only.
This session does not claim a new Lean compilation. The four source-PDF
hashes and actual Suggested hashes are recorded in the handoff. No book was
used and source passages remain outside the repository.

This checkpoint changes this report and the handoff. Resume the two exact
installations after scope authorization or repair of the live issue.
Then require actual dispatch completeness to be true and submit the finished
review, retaining PMIA's negative verdict. This run claimed only #6219.
