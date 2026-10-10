# Independent fix review: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-jIGDIK`, 10 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6102949426).
I did none of fixer `claude-6ZAIEy`'s work. This checks the six correction
contracts, following `codex-ZyjVh0` and the earlier reviewers attributed in the
[input report](https://github.com/CBirkbeck/tauceti-explorer/blob/49b97fab382ad500ae19cc722171dd6050f79bda/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md).
The review is bounded to these correction contracts. Each new receipt
archives the whole previous review, including its checked arrays and original
attribution, in `reviewHistory`; no exhaustive node audit is attributed to this run.

## Verdicts

| Finding | Verdict | Boundary |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | L3 accepted for this correction | Exact RD.6 coefficient and splitting statements remain requests; whole-file Lean elaboration stops at import resolution. |
| /2 Ferrero–Greenberg | Accepted L3-2 record prepared | Convergence and arithmetic nonvanishing remain separate inputs; installation needs scope authorization. |
| /3 Classical log-syntomic comparisons | Accepted D.1 record prepared | CS.0–CS.3 remain proposed external producers; installation needs scope authorization. |
| /4 Character orders, Fitting ideals and transpose | PMIA needs_changes | Five generic plans must reuse current native results, with adapters and coordinated consumer revisions. |
| /5 Finite slope for complexes | Retain accepted LAD correction | Stronger homotopy, Stein and analytic solid comparisons remain explicit gaps. |
| /6 Main-conjecture proof routes | Retain the verifier's rejection | Accepted RS-16 deliberately keeps independent Hecke/congruence and Euler-system methods. |

Fresh L3 and PMIA records are installed, appending each predecessor whole to
its history. L3-2 and D.1 remain byte-identical to input; their prepared records
are in the handoff. No mathematical/planning field or suggested Lean file changes.

## /1: Gamma and Gauss-sum normalization

Checked Morita §1, Lemma 1 and Theorem 1, printed pp.255–256, as images.
The signed product gives Gamma_p(0)=1 and Gamma_p(1)=−1. The continuous
native unit lift and dense-natural uniqueness use the necessary complete-ring
and Hausdorff hypotheses. Translation has factor −x on units and −1 on
nonunits. Finite congruence excludes p=2 at exponent two; the buffered
precision suffices for continuity at every prime.

Gross–Koblitz §1, equations (1.2), (1.5), (1.6) and Theorem 1.7,
pp.570–571, fixes the negative Gauss sum, inverse Teichmüller character and
compatible root. The second-order congruence at ζ−1 is in the integer ring;
unrestricted field divisibility would lose the normalization. Robert §4,
pp.164–168, Theorem 4, supports 0≤a<q−1,
including the negative trivial Gauss sum equal to one. The packet separates
this from the original odd-prime range. RD.6's precise coefficient bound
and trace/splitting equality remain requests, with its inverse-series sign
converted explicitly. This acceptance does not assert built suppliers.

The predecessor report retains its finite congruence controls and their
attribution. This run checked the correction against the source statements;
those finite diagnostics are not reported as new proofs or new computations.

## /2: The derivative and strict endpoint

Read Zhao §1.2, p.461; §4, equations (4.1)–(4.6) and Theorem 4.1,
pp.471–473; and Appendix A, p.473. The retained Appendix B endpoint correction was
checked against the packet and predecessor report. L3-2 requires a primitive odd
χ of tame conductor N>1, compatible embeddings and log_p(p)=0. The derivative
is on the even χω branch; dyadic ω has conductor four. The Gamma sum uses
direct χ weights. The correction is (1−χ(p))B_(1,χ)log_p(N). Only χ(p)=1
removes it; a simple-zero assertion still needs arithmetic nonvanishing.

The positive-residue permutation uses representatives in {1,…,N}, with
zero residue represented by N. Its strict-filtration endpoint is a/N. The
predecessor report retains the attributed finite permutation diagnostics.

The strict interval tends to a/N and gives log Gamma_p(a/N). The existing
E37 repair to Appendix B.2's shifted endpoint is retained. Differentiation
uses coefficient convergence and a uniform logarithmic Taylor majorant,
with distinct odd-prime and dyadic radii. Five gaps and eight requests remain.
This accepts the correction contract while preserving the prior full
79-node audit's attribution.

## /3: Integral maps and rational exponential

Read Ertl–Niziol v2 §§2.1–2.2, pp.4–8, including Theorem 2.2, p.7;
Colmez–Niziol v4 Corollary 3.16, p.37, and Theorem 5.4, p.54;
and Nekovar–Niziol v5 Remark 2.14, p.14, and Proposition 4.13, pp.53–54.
The p^r−φ fibre U and the 1−φ_r fibre D are distinct. The Frobenius-divisible
ideal is imposed at a sufficiently high lifted level before reduction.
Agreement of domain ideals through r=p−1 does not equate the differentials.

U→D has legs (p^r,id); D→U has legs (id,p^r). Both composites multiply
by p^r, and only the first map is asserted multiplicative. The modified
Tate twist retains its factorial factor. Exact integral comparison uses D
and 0≤i≤r≤p−2. U keeps a bounded torsion comparison, distinguishing the
constants for enough roots of unity from the general field-dependent bound.

The rational exponential is an isomorphism for i<r and injective at i=r.
Its transport uses the rational inverse comparison, p^−r quotient-coordinate
normalization and Bloch–Kato boundary sign. No integral inverse follows from
the p^r composites. D.1 imports proposed CS.0–CS.3 contracts: CP.4's proper
rational comparison does not supply the integral open theory. Nine gaps,
twenty requests and seventeen source issues remain. This accepts the correction
while archiving the prior full 72-node audit with its original reviewer.

## /4: Correct arithmetic repairs, outstanding native duplication

Read Dasgupta–Kakde v3 §§2.2–2.3, pp.15–18; Lemma 3.9's proof,
pp.25–26; §6.1 and Lemma 6.1, p.40. The character ring is the evaluation image of O[G],
with the source's finite abelian and coefficient-root hypotheses. It may be
a proper suborder of the product and need not be Gorenstein. Sharp transports
it to the inverse-character order. Cardinality arguments retain regular
determinants and finite quotients. The right higher-adjugate identity supplies
an embedded preimage, repairing the source proof's insufficient left
multiplication. Transpose remains presentation-dependent before projective
correction; coefficient transport and higher-Fitting rank excess remain.

Five generic plans still duplicate current Tau Ceti:

| L6 node | Native replacement and boundary |
| --- | --- |
| `higher-fitting-ideal` | `TauCeti.fittingIdeal`, for finite modules over commutative rings |
| `higher-fitting-independence` | `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, requiring a finite-free surjection |
| `relation-minors-add-generator` | `Submodule.minorsIdeal_ker_eq_of_surjective` for generating families; retain an adapter for families that do not generate the ambient module |
| `higher-fitting-base-change` | `TauCeti.fittingIdeal_baseChange`, for arbitrary commutative-algebra base change without flatness |
| `transpose-stable-equivalence` | `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`, respecting opposite scalars and ordered dual factors in exact surjective projective presentations |

Read the statements at current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: FittingIdeal/Basic.lean,
lines 301–357; FittingIdeal/BaseChange.lean, lines 110–140; and
AuslanderReiten/StableTranspose.lean, lines 72–98. The stable result applies
over any ring without finiteness. Git object checks show all three files
absent at programme pin f790474; they must not be attributed to that pin.

Changing a few node labels would leave inconsistent interfaces. Revise the
reader, suggested file, L4, consumers and both StableReduction requests
together. Preserve the arbitrary-family, deficient-relation and nonflat
controls, arithmetic order/index calculations and contragredient conventions.
The reader is outside this review's named files. `needs_changes` is the
finished verdict on this packet, not a reason to postpone the review.

## /5 and /6: Supplier and independent-proof boundaries

Read BCGP21 v3 §6.1.1, p.139;
BCGP25 v1 Definition 2.2.17, p.21, and §4.6.46/Remark 4.6.47, p.94.
The accepted LAD correction separates degreewise compact representatives
from invariant cohomological spectral support. Its nonalternating determinant
product is auxiliary: an acyclic two-term summand can change it. Finite slope
windows provide the finite-projective perfect model.

LAD records the stronger homotopy-category comparison as a gap, distinguishes
dense restrictions from compact restrictions in a Stein exhaustion, and
requests the full analytic solid f_*f^* localization with analytic-ring
coefficients and inverse limits. Monoid inversion alone does not supply it.
LAD was not changed; its accepted full audit remains attributed to its reviewer.

For /6, reread accepted RS-16's I.5 decision. It preserves the Mazur–Wiles
and odd-prime totally-real Wiles Hecke/congruence methods, their lattice and
both-divisibility inputs, and the separate cyclotomic Euler-system method.
The rejected finding does not justify an L4→I.5 supplier edge or replacing
those independent proof plans.

## Baseline and validation

Read the L3, L6, D.2 and LAD coverage records in AUDIT-24/25/26. At Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, read p-adic unit/norm criteria,
`PadicInt.denseRange_natCast`, `ContinuousMap.unitsOfForallIsUnit` and
`DenseRange.equalizer`, including their complete normed-ring and Hausdorff
assumptions. Read the programme-pin transpose quotient, its quotient map and
opposite/base scalar actions. Current native reuse is distinguished above.
The read-only upstream roadmap checkout at inspection was
`070dc2becd74419e76303ede84b465ed4a69461f`; relevant ArithmeticDirichletSeries,
StableReduction and QuiverRepresentations boundaries and suggested interfaces
were checked. No upstream file was edited.

All four prepared packet records pass `scripts/check_blueprint.py` with zero
errors. L3 has 26 inherited short-API warnings; the other three have none.
Preservation checks compare every mathematical/planning field, every older
history entry and each entire archived top review. No excerpt fields are
introduced. The two omitted actual packets remain byte-identical to input.

Fresh `lean-check` runs were sequential, using the existing pinned build.
Recorded memory checks showed at least 100 GB available; the wrapper also enforces
the 20 GB threshold for every invocation:

| Suggested file | Result |
| --- | --- |
| L3 | Exit 1, line 1: unknown module prefix `research`; body not elaborated |
| L3-2 | Exit 0, 111 `sorry` warnings only |
| D.1 | Exit 0, 307 `sorry` warnings only |
| PMIA | Exit 0, 1,075 `sorry` warnings only |

L3's actual sibling prototypes lack compiled artifacts in the shared search
path. Their ownership is preserved; this review makes no whole-file
elaboration claim. No build, update, cache fetch or language server was started,
and no Lean process remains running.

## Remaining file-scope blocker

The queue requires this reviewer's verdict on four packets, but the live issue
names only L3 and PMIA. The unchanged `deliverables_complete` returns False
on actual files and True with read-only substitution of the prepared L3-2
and D.1 records. WORKERS.md restricts edits to the issue's named files.
Explicit authorization for these two review-only edits was requested in the
current session and remains pending. Both
records have been prepared and validated; only their installation depends on
that authorization. The report and handoff make the concrete remaining edits
reviewable. No queue, predicate or label was changed.

The six-finding mathematical review is finished, including PMIA's negative
verdict. Scope authorization has not arrived at submission, so this is a
blocked checkpoint. The handoff provides the exact two records and verification
procedure. Resume after scope repair; repeating the source audit will not
resolve this mismatch.

## Public sources

All ten public PDFs were fetched afresh on 10 October 2026 and their SHA-256
values are recorded below. Fresh readings are bounded
above; earlier exhaustive audits retain their original attribution. No book
or copied source passage was used in these changes.

[Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
[Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
[Robert](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf),
[Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
[Ertl–Niziol](https://arxiv.org/pdf/1603.01705v2),
[Colmez–Niziol](https://arxiv.org/pdf/1505.06471v4),
[Nekovar–Niziol](https://arxiv.org/pdf/1309.7620v5),
[Dasgupta–Kakde](https://arxiv.org/pdf/2010.00657v3),
[BCGP21](https://arxiv.org/pdf/1812.09269v3),
[BCGP25](https://arxiv.org/pdf/2502.20645v1).

| Public source | SHA-256 of inspected PDF |
| --- | --- |
| Morita | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| GrossKoblitz | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| Robert | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| Zhao | `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661` |
| EN | `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14` |
| CN | `3ab4456e31b5a6c7f21349b34fe020f619f4233a92a2f0105a1ffe2c3e1733ec` |
| NN | `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0` |
| DK | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| BCGP21 | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| BCGP25 | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
