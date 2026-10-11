# Independent correction review: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-k2zZva`, 11 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219);
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6106025819).
Review base: `5cbcf764a67eb29027a3af3f4518b483c8f950ea`.
This session authored none of the fixes under review and claimed no other job.

## Status and file-scope blocker

**Blocked checkpoint: the mathematical correction decisions are ready, but two
required review records cannot be installed within the live issue's scope.**
The issue names L3 and PMIA. Its queue also requires L3-2 and D.1, whose
current review objects name their earlier layer-review jobs. I reconstructed
and validated the exact two metadata-only candidates in the handoff, preserving
the complete earlier reviews, including their 79-node and 72-node ledgers.
All non-review fields are unchanged. L3 and PMIA already carry this review
job's decisions; adding identical history entries would add no evidence.

[WORKERS.md](../WORKERS.md), Doing the work, says:
“Edit only the files the issue names, plus your own scratch space.”
After preparing the concrete changes I requested explicit authorization for
`research/blueprint/packets/DirichletPadicLFunctions--L3-2.json` and
`research/blueprint/packets/PadicHodgeRegulators--D.1.json` through the worker
conversation. No answer has arrived. Neither candidate is installed. The
unmodified completion predicate is false on the actual checkout and true
under a read-only substitution of exactly these two candidates. Queue ownership
and validation do not remove the live issue's explicit file restriction.
Authorize those paths or repair the issue before redispatching this job.

This continuation changes only this report and the handoff. PMIA's negative
verdict completes its part of the review; its coordinated revision belongs to
a separate job. It is not the dispatch blocker.

## Six finding decisions

Read the six claims in `RT-AREA-iwasawa-2.result.json`, their verified decisions
in `RT-AREA-iwasawa-2.review.json`, the round-two fix report, the four packets,
and the earlier attributed reviews. Fresh checks of the bounded corrections
support the following decisions.

| Finding | Decision | Evidence and remaining obligation |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | Retain L3's bounded acceptance | Signed natural values, unit-valued continuity, both recurrences, dyadic modulus-four control, negative Gauss-sum convention and the chosen root normalization are explicit. Exact RD.6 coefficient and splitting inputs remain requests. |
| /2 Ferrero–Greenberg | Accept L3-2's bounded correction; record prepared | The even branch uses direct character weights and the conductor correction. Removing the correction requires χ(p)=1. Nonvanishing and analytic convergence remain separate obligations. |
| /3 Classical log-syntomic comparison | Accept D.1's bounded correction; record prepared | Divided and undivided complexes, directed maps, product behavior, factorial twist, exact integral range, rational scaling and boundary sign are distinguished. CS.0–CS.3 remain external producer requests. |
| /4 Character orders, Fitting ideals and transpose | Retain PMIA's `needs_changes` | Arithmetic order, inverse-character and adjugate repairs are supported. Five generic plans duplicate current native declarations. Packet, reader, Suggested and consumers need coordinated revision. |
| /5 Finite slope for complexes | Retain the LAD correction | The representative's degreewise product is auxiliary; cohomological spectral support is invariant. Stein and derived solid localization contracts retain their extra hypotheses and comparison gaps. |
| /6 Main-conjecture proof routes | Retain the verifier's rejection | Accepted RS-16 I.5 deliberately retains independent Hecke/congruence and Euler-system routes. Replacing the former by the latter would discard a planned method. |

LAD and RS-16 are read-only context. The earlier exhaustive node audits keep
their original authorship. The
[full six-finding audit](https://github.com/CBirkbeck/tauceti-explorer/blob/303b02c8bda26170394f9f96f6c691391a2f8611/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
and the
[input report](https://github.com/CBirkbeck/tauceti-explorer/blob/5cbcf764a67eb29027a3af3f4518b483c8f950ea/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
remain immutable evidence. The prepared records retain `codex-jIGDIK`'s
attribution and dates, rather than claiming those exhaustive audits as mine.

## Fresh source checks

Fetched the nine public PDFs in the handoff; every SHA-256 matches its previous
receipt. No book was used. Source passages stayed in disposable scratch.
The following statements are correction checks in my own words.

For /1, [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
§1 Lemma 1/Theorem 1, pp.255–256, gives the signed continuous unit-valued
extension and distinguishes the unit and nonunit recurrence. The dyadic
congruence needs its modulus-four exception.
[Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
§1 equations (1.2), (1.5), (1.6) and Theorem 1.7, pp.570–571, fixes the negative
Gauss sum and normalized root of −p. Its original setup assumes odd p; the
dyadic calculation remains separate. I inspected these scanned pages visually.
L3 keeps sixteen gaps and thirteen requests, including RD.6.

For /2, [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
§1.2 p.461, §4 equations (4.1)–(4.6)/Theorem 4.1 pp.471–473 and Appendix A
p.473, supports primitive odd tame χ, the even χω branch, compatible embeddings
and the common logarithm. The Gamma sum uses χ(a), with correction
(1−χ(p))B₁,χ log_p(N). The setup permits any prime, with the dyadic ω convention
kept explicit. The strict endpoint repair agrees with Appendix A. Five gaps
and eight requests remain; this formula alone does not supply nonvanishing.

For /3, [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2
pp.4–8/Theorems 2.2–2.3 pp.7–8, distinguishes the complexes U and D and the
lifted divisible ideal. The maps U→D and D→U have legs (p^r,id) and (id,p^r);
both composites multiply by p^r, while only U→D preserves products in general.
The modified twist includes the factorial. Exact divided comparison requires
0≤i≤r≤p−2 and the stated fine, saturated, log-smooth hypotheses; the undivided
comparison has bounded torsion error.
[Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16 p.37 and
Theorem 5.4 p.54, supports rational exponential isomorphism below i=r and
injectivity at i=r, separately from the integral error bound.
[Nekovář–Niziol v5](https://arxiv.org/pdf/1309.7620v5), Remark 2.14 p.14 and
Proposition 4.13 pp.53–54, fixes the Bloch–Kato boundary convention. Inverse
comparison and p^−r scaling are rational. Nine gaps and twenty requests remain;
no integral inverse or completed CS.0–CS.3 producer is claimed.

For /4, [Dasgupta–Kakde v3](https://arxiv.org/pdf/2010.00657v3), §§2.2–2.3
pp.15–18, Lemma 3.9 pp.25–26 and §6.1/Lemma 6.1 p.40, supports the character
image order, sharp transport to inverse characters, finite cardinality with
nonzerodivisor hypotheses, and the right-sided higher-adjugate image. The
transpose remains over the opposite ring. Eighteen gaps and three requests
remain. These repairs do not resolve the ownership defect below.

For /5, [BCGP21 v3](https://arxiv.org/pdf/1812.09269v3), §6.1.1 p.139, works
with a bounded projective Banach representative and its degreewise Fredholm
product. The cohomological support carries the invariant construction. The
LAD acyclic two-term test retains products (1−aT)² and 1 for different models.
[BCGP25](https://arxiv.org/pdf/2502.20645), Definition 2.2.17 p.21 and
§4.6.46–Remark 4.6.47 pp.93–94, requires dense restrictions in a countable
affinoid exhaustion and relative compactness for Stein spaces. Its derived
solid finite-slope functor pulls to the character space and pushes back;
monoid inversion alone does not supply that functor.

## Native-library and ownership checks

Read the actual statements at programme pins Mathlib `082e2d3` and Tau Ceti
`f790474`: `ContinuousMap.unitsOfForallIsUnit`, positive `gaussSum`,
`TauCeti.teichmuller`, and the opposite-ring cokernel definition of
Auslander–Reiten transpose. The continuous-unit lift requires a continuous
ring-valued function whose values are units; native `gaussSum` needs the
packet's explicit sign conversion.

Separately read the following current Tau Ceti declarations at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including their hypotheses and the
corresponding five PMIA node contracts. They are not attributed to the old pin.

| PMIA L6 node | Native result and boundary |
| --- | --- |
| `higher-fitting-ideal` | `TauCeti.fittingIdeal`, finite modules over commutative rings |
| `higher-fitting-independence` | `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, finite-free surjections |
| `relation-minors-add-generator` | `Submodule.minorsIdeal_ker_eq_of_surjective`; the arbitrary-family span/image comparison remains an adapter |
| `higher-fitting-base-change` | `TauCeti.fittingIdeal_baseChange`, arbitrary commutative-algebra base change, with no flatness assumption |
| `transpose-stable-equivalence` | `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`, exact surjective projective presentations over arbitrary rings, without finiteness |

The stable-transpose dual factors are P₀×Q₁ and P₁×Q₀ on the respective sides,
over the opposite ring. Preserve arbitrary-family and nonflat tests, arithmetic
order/index calculations and contragredient conventions when revising the
packet, reader, Suggested and consumers. Relabelling five nodes alone would
leave duplicated definitions and proofs in those other artifacts.

Read the four relevant library-coverage records, RS-16 I.5, and current
ArithmeticDirichletSeries and StableReduction owner interfaces. TauCetiRoadmap
is read-only at `070dc2becd74419e76303ede84b465ed4a69461f`. Existing upstream
contracts are suppliers; no new roadmap or generic carrier is planned here.

## Validation

All four actual packets and both exact candidates pass `check_blueprint.py`
with the existing pinned declaration index: zero errors. L3 has 26 inherited
short-API warnings in its Kubert material; the other five checks have none.
Both candidates pass intake file rules. None of the packets or candidates has
an `excerpt` field. Full earlier histories and node ledgers are preserved.
Actual completion is false; the diagnostic two-candidate substitution is true,
with the queue and predicate unchanged.

Ran four sequential `lean-check` commands in the existing pinned build, with
sufficient available memory. L3 exits 1 at line 1 because the build cannot
resolve its `research` module prefix; its body is not elaborated. L3-2, D.1 and
PMIA exit 0 with 111, 307 and 1,075 `sorry` warnings respectively and no other
Lean diagnostics. No Lean code changed and no compilation remains running.
All eight packet/Suggested hashes match the handoff. `git diff --check` and
intake checks pass for this report and handoff.

Resume by obtaining scope authorization, installing exactly the two guarded
records, and checking actual completion. The handoff contains everything
needed after disposable scratch is removed.
