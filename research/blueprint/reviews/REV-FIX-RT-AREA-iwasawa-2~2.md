# Independent correction review: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-7I2eky`, 11 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219).
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6107628852).
Input commit: `ac2c5de6a52455c01121d8261db3cbece54382db`.
This session authored none of the fixes and claimed one issue.

## Disposition and scope

**Blocked checkpoint: the live issue and the queue assign different files.**
The mathematical correction review is complete at its bounded scope. The
issue-named L3 packet is accepted for finding /1; PMIA remains `needs_changes`
for current-library duplication. Their preceding verdicts and complete
histories are preserved in `reviewHistory`. No mathematical or Lean field
changed.

The live issue permits two packets. The queue requires four, additionally
`DirichletPadicLFunctions--L3-2.json` and `PadicHodgeRegulators--D.1.json`.
Their top verdicts still belong to their earlier layer reviews. The stock
`issues.deliverables_complete` predicate returns false. An in-memory overlay
of just the two prepared review-metadata changes returns true. PMIA's negative
verdict counts as a finished review and does not cause this mismatch.

[WORKERS.md](../WORKERS.md), Doing the work, says “Edit only the files the issue
names, plus your own scratch space.” Expanded scope for these two paths was
requested in the worker conversation and has not been granted. Neither
candidate is installed. The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-2~2.md)
contains their exact verdicts, byte guards and installation code. Reconcile the
issue with the queue, or authorize those paths, before redispatching this job.
Another review under the same file restriction cannot resolve the mismatch.

## Findings

I read all six original findings, the verifier's decisions and the round-two
fix report. This review checks the correction contracts, their hypotheses,
prerequisites, APIs and distinguishing examples. The original exhaustive
79-node L3-2 and 72-node D.1 reviews remain attributed to their authors; this
session does not claim to have repeated those whole-layer audits. The
[input report](https://github.com/CBirkbeck/tauceti-explorer/blob/ac2c5de6a52455c01121d8261db3cbece54382db/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
retains the preceding evidence and its attribution.

| Finding | Verdict | Reason and boundary |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | Accept the L3 correction | The signed finite product, dyadic exception, unit/nonunit recurrence, negative Gauss sum and normalized root are explicit. Original Gross–Koblitz excludes p=2 and the zero exponent; separate requests/gaps remain. |
| /2 Ferrero–Greenberg | Accept the L3-2 correction; metadata prepared | The Gamma sum has direct character weights and the conductor correction. The exceptional specialization requires chi(p)=1; nonvanishing and convergence retain their own inputs. |
| /3 Classical log-syntomic comparison | Accept the D.1 correction; metadata prepared | Divided/undivided complexes and maps are distinguished; exact small-weight comparison is separated from bounded integral error and rational exponential comparison. Shared producers remain requests. |
| /4 Character orders, Fitting ideals and transpose | PMIA needs changes | The arithmetic corrections are sound. Five generic targets still plan current Tau Ceti implementations and need a coordinated reuse revision. |
| /5 Finite slope for complexes | Retain the LAD correction | The raw Fredholm product depends on a representative; spectral support comes from cohomology. The Stein and solid interfaces retain the source's stronger conditions and supplier requests. |
| /6 Main-conjecture proof routes | Retain the verifier's rejection | Accepted RS-16 explicitly preserves independent Mazur–Wiles/Wiles Hecke proofs and the separate cyclotomic Euler-system method. |

No mathematical correction was needed in the issue-named packets. Changes
consist of this bounded review, refreshed verdict metadata and the handoff.
LAD and RS-16 are read-only context.

## Primary-source verification

Nine public PDFs were freshly retrieved on 11 October 2026; every SHA-256
matches the preceding handoff's receipt. No book was used. Scanned Morita and
Gross–Koblitz pages were inspected visually. All descriptions below are
mathematical contracts written in my own words.

**/1.** [Morita, A p-adic analogue of the Gamma-function](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
section 1, Lemma 1/Theorem 1 and recurrence, pp.255–256, distinguishes the
unsigned product from its signed continuous extension. The exponent-two
exception at p=2 must survive the congruence argument. The packet uses a
precision buffer and keeps both recurrence branches. Its finite examples give
G3(4)=2 and G3(5)=−8; G2(1) and G2(5) are respectively 3 and 1 modulo 4.
[Gross–Koblitz, Gauss sums and the p-adic Gamma-function](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
section 1, equations (1.2), (1.5), (1.6) and Theorem 1.7, pp.570–571, fixes a
negative Gauss sum, pi^(p−1)=−p and pi congruent to zeta−1 modulo (zeta−1)^2.
Its prime does not divide 2N and its exponent is nonzero. These conventions
are retained, with the separate dyadic and exponent-zero obligations.

**/2.** [Zhao, Sum expressions for Kubota–Leopoldt p-adic L-functions](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
section 1.2 p.461, section 4 equations (4.1)–(4.6)/Theorem 4.1 pp.471–473 and
Appendix B p.474, supplies the primitive odd tame character and even
chi-omega branch. The derivative is the directly weighted Gamma-log sum plus
(1−chi(p))*B1,chi*log_p(N). The extra term disappears only in the exceptional
case. The packet preserves the E37 strict-endpoint repair, the uniform
convergence input and the independent arithmetic nonvanishing request. Finite
permutation and strict-filtration checks pass for (p,N,B)=(5,3,25), (2,3,4),
(2,3,16) and (3,1,9). These checks do not prove the limit theorem.

**/3.** [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2), sections 2.1–2.2,
pp.4–8, Theorems 2.2–2.3, distinguishes the fiber of p^r−phi on J^[r] from
the fiber of 1−phi_r on the lifted divisible ideal. Omega has legs (p^r,id),
tau has (id,p^r), both composites are p^r, and only omega generally preserves
products. The divided exact range is i≤r≤p−2. General undivided comparison
has bounded torsion error and the factorial-modified twist.
[Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16 p.37 and
Theorem 5.4 p.54, gives the rational exponential isomorphism for i<r and
injection for i=r under quasi-compact formal semistable hypotheses, and the
integral bounded-error theorem under its distinct semistable/base-change
hypotheses. [Nekovář–Niziol v5](https://arxiv.org/pdf/1309.7620v5), Remark 2.14
p.14 and Proposition 4.13 pp.53–54, fixes the boundary sign and Bloch–Kato
comparison. The three D.2 contracts retain these distinctions; CS.0–CS.3
remain requested suppliers, and a rational inverse is not an integral inverse.

**/4.** [Dasgupta–Kakde v3](https://arxiv.org/pdf/2010.00657v3), sections 2.2–2.3
pp.15–18, Lemma 3.9 pp.25–26, section 6.1/Lemma 6.1 p.40 and Appendix B.2
equation (171) p.93, uses an evaluation image order, square presentations,
nonzerodivisor and finite-cardinality assumptions, and sharp transport to the
inverse-character coefficient ring. The rectangular compound-map repair
provides the actual preimage i_J(adj_r(A_J)x), using the right-sided identity.
For rows (1,2,0,3), (0,3,1,2), (0,0,3,1), with r=2 and the first-three-column
minor 9, the preimage (7,−9,0,3,0,0) maps to 9(2,−1,3). The generic reuse
objection below remains separate from this sound arithmetic correction.

**/5.** [BCGP21 v3](https://arxiv.org/pdf/1812.09269v3), section 6.1.1 p.139,
uses a bounded projective Banach representative with degreewise compact maps;
the raw nonalternating product of its Fredholm series is auxiliary. LAD
explicitly gives the acyclic two-term complex counterexample and uses
cohomological support for the invariant.
[BCGP25](https://arxiv.org/pdf/2502.20645), Definition 2.2.17 p.21 and
section 4.6.46/Remark 4.6.47 pp.93–94, requires countable affinoid exhaustions,
dense restrictions and relative compactness for Stein spaces. Its solid
finite-slope functor is f_*f^*, stronger than monoid inversion. LAD retains the
geometric comparison request and restricts its classical/solid comparison to
the stated finite windows.

**/6.** RS-16.result.json, IntegralIwasawaTheory:I.5, explicitly retains the
independent Hecke/congruence proof routes. This supports the verifier's
rejection of the alleged unintended duplication; neither proof is deleted.

## Library checks and remaining PMIA revision

The reviewed coverage audit was read for L3, D.2, L6 and LAD L4. Programme pins
are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. I read the pinned statements of
`ContinuousMap.unitsOfForallIsUnit`, `gaussSum`, Tau Ceti's local-field
`teichmuller` and `TauCeti.AuslanderReitenTranspose`. The continuous-map lift
requires continuity and pointwise unit proofs; it does not establish Gamma
continuity. Mathlib's Gauss sum is positive. Transpose is an opposite-linear
dual cokernel, constructed without a minimality assumption.

Separately, current read-only TauCetiRoadmap is
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec` and current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read ProfiniteArithmetic and
StableReduction's introductions and Suggested interfaces as upstream models,
and the current Fitting and stable-transpose statements. These declarations
are not attributed to the older programme pin.

| PMIA L6 target | Existing supplier and required boundary |
| --- | --- |
| higher-fitting-ideal | `TauCeti.fittingIdeal` for finite modules over a commutative ring, FittingIdeal/Basic.lean:343. |
| higher-fitting-independence | `Submodule.minorsIdeal_ker_eq_of_surjective`, Basic.lean:304, and `fittingIdeal_eq_minorsIdeal_ker`, Basic.lean:349. |
| relation-minors-add-generator | Independence covers finite generating families; arbitrary families still require a span/image adapter. |
| higher-fitting-base-change | `fittingIdeal_baseChange`, FittingIdeal/BaseChange.lean:134, without a flatness assumption. |
| transpose-stable-equivalence | `AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`, StableTranspose.lean:91, for exact surjective projective presentations over any ring, without finiteness. |

The PMIA revision must reuse these APIs, preserve the arithmetic image orders,
inverse-character sharp transport, nonflat examples and arbitrary-family
adapters, and retain opposite-ring dual factors P0×Q1 and P1×Q0. This requires
coordinated packet, reader, Suggested and consumer edits; the reader and
consumers are outside #6219's live scope. Scheme-level StableReduction targets
are not supplied merely by ring-module Fitting ideals.

## Checks and limitations

All four actual packets pass the pinned-index blueprint checker with zero
errors. L3 has 26 inherited short-API warnings; the other three have none.
All non-review fields and all Suggested bytes equal the input. Complete prior
verdicts/history are retained; no packet contains an `excerpt` field.

Fresh sequential shared-build `lean-check` results:

| File | Result |
| --- | --- |
| L3 | Exit 1: unresolved `research` module prefix before body elaboration. |
| L3-2 | Exit 0: 111 `sorry` warnings, no other diagnostics. |
| D.1 | Exit 0: 307 `sorry` warnings, no other diagnostics. |
| PMIA | Exit 0: 1,075 `sorry` warnings, no other diagnostics. |

Available memory exceeded 20 GB before compilation. No language server,
build or dependency update ran. Finite Gamma, FG filtration and compound-map
checks pass; these distinguish examples rather than proving the admitted
statements. Intake file checks and `git diff --check` pass. The completion
predicate remains false under the issue's permitted scope and true under the
exact two-candidate overlay. The source receipts and guarded continuation
procedure are preserved in the handoff.
