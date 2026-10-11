# Independent correction review: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-AHzUBV`, 11 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219).
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6107884272).
Input: `517d1829d0fc041f39f5b88fd54e5ba8459ba55c`. I authored none of the fixes.

## Disposition

**Scope-blocked checkpoint.** The six correction decisions have been reviewed.
L3 is accepted for finding /1; PMIA needs a coordinated reuse revision for
finding /4. The issue-named packets carry this session's verdicts and preserve
their entire preceding review objects and histories. All mathematical fields
and all four Suggested files retain their input content.

Completion requires two more review records: the queue lists
`DirichletPadicLFunctions--L3-2.json` and `PadicHodgeRegulators--D.1.json`,
whereas the live issue's deliverable list and full instructions both omit
them. The stock `issues.deliverables_complete` predicate requires this review's
name in all four packets; it returns false for the permitted edits and true
with just the two prepared metadata updates. PMIA's `needs_changes` verdict
qualifies as a finished review and does not prevent completion.

[WORKERS.md](../WORKERS.md), Doing the work, requires “Edit only the files the
issue names, plus your own scratch space.” I requested authorization for the
two omitted packet paths in the worker conversation. No answer has arrived,
so those files remain untouched. The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-2~2.md)
contains the exact independently checked candidates and guarded installation
procedure. The issue's scope must be reconciled before another dispatch can
finish this job; repeating the mathematical review cannot fix that mismatch.

## Correction decisions

I read the original six findings, their verification and the round-two fix
report, then checked the affected mathematical contracts, hypotheses,
prerequisites, API and distinguishing tests. This is a bounded correction
review. The complete earlier L3-2 and D.1 layer audits retain their authorship;
I do not claim to have repeated their 79-node and 72-node reviews.
The [input review](https://github.com/CBirkbeck/tauceti-explorer/blob/517d1829d0fc041f39f5b88fd54e5ba8459ba55c/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
records the preceding session's evidence.

| Finding | Decision | Scope and remaining boundary |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | Accept L3 correction | Correct signs, recurrence branches, dyadic precision exception and normalized root; extensions beyond the original odd-prime/nonzero-exponent theorem remain separate obligations. |
| /2 Ferrero–Greenberg | Accept bounded L3-2 correction; record prepared | Direct character weights and the conductor correction are retained. Only the exceptional hypothesis removes that correction. Convergence and nonvanishing remain separate inputs. |
| /3 Classical log-syntomic comparison | Accept bounded D.1 correction; record prepared | Divided and undivided complexes have different maps and twists; exact small weights, integral bounded error and rational exponentials are kept distinct. CS.0–CS.3 remain shared producer requests. |
| /4 Character orders, Fitting ideals and transpose | PMIA needs changes | Arithmetic corrections are sound, but five generic L6 targets overlap current Tau Ceti implementations. Their replacement requires a coordinated reuse revision. |
| /5 Finite slope for complexes | Retain correction in read-only LAD context | The raw Fredholm product belongs to a representative. Cohomological support supplies the invariant, and Stein/solid comparisons retain their stronger hypotheses and supplier requests. |
| /6 Main-conjecture proof routes | Retain verifier's rejection | RS-16 expressly preserves independent Hecke/congruence proofs and the separate cyclotomic Euler-system method. |

No mathematical change was needed within the live issue's file scope. The
changes are review metadata, this report and the continuation handoff.

## Evidence from primary sources

Nine public PDFs were freshly obtained on 11 October 2026. Their hashes match
the previous handoff; receipts are retained in this handoff. I read the cited
locations, inspecting Morita and Gross–Koblitz's scanned pages visually. No
book was used. The following evidence describes the contracts in my own words.

For **/1**, [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
§1, Lemma 1/Theorem 1 and the recurrence, published pp.255–256, extends the
signed finite product continuously and treats the unit and nonunit recurrence
separately. Its congruence argument excludes precision exponent two when p=2.
The packet keeps this exception and uses a precision buffer. Direct finite
checks give G3(4)=2 and G3(5)=−8; at p=2, G2(1)=3 and G2(5)=1 modulo 4,
showing why the excluded period cannot be asserted.
[Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
§1, equations (1.2), (1.5), (1.6) and Theorem 1.7, published pp.570–571,
uses a negative Gauss sum and chooses pi by pi^(p−1)=−p together with its
congruence modulo (zeta−1)^2. The theorem's initial setup excludes p=2 and
the zero exponent. The packet distinguishes these restrictions from its
separately requested extensions and Dwork comparison inputs.

For **/2**, [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
§1.2 p.461, §4 equations (4.1)–(4.6)/Theorem 4.1 pp.471–473 and Appendix B
p.474, gives the derivative for the even chi-omega branch of a primitive odd
character with tame conductor N>1. The character values directly weight the
Gamma logarithms. The additional term is
(1−chi(p))*B1,chi*log_p(N), equivalently
−(1−chi(p))*L(chi,0)*log_p(N); it vanishes under chi(p)=1. The packet retains
the E37 strict-endpoint repair, uniform convergence and independent arithmetic
nonvanishing request. Finite checks verify the positive-residue permutation,
its congruence and strict filtration at (p,N,B)=(5,3,25), (2,3,4), (2,3,16)
and (3,1,9). They check the finite contracts, not the limiting theorem.

For **/3**, [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2,
PDF pp.4–8, Theorems 2.2–2.3, distinguishes the divided fiber
D=Fib(1−phi_r,J<r>) from U=Fib(p^r−phi,J^[r]). The map omega:U→D has
legs (p^r,id), while tau:D→U has (id,p^r); both composites multiply by p^r.
Omega respects products, whereas tau need not. The exact divided range is
0≤i≤r≤p−2; the undivided comparison has bounded torsion error and a
factorial-modified Tate twist.
[Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16 PDF
p.37 and Theorem 5.4 PDF p.54, supplies distinct rational-exponential and
integral bounded-error comparisons under their stated semistable hypotheses.
The rational exponential is an isomorphism for i<r and injective at i=r.
[Nekovář–Niziol v5](https://arxiv.org/pdf/1309.7620v5), Remark 2.14 PDF p.14
and Proposition 4.13 PDF pp.53–54, supplies the boundary sign and Bloch–Kato
comparison. The packet preserves the scaling of the undivided boundary and
does not treat a rational inverse as an integral inverse.

For **/4**, [Dasgupta–Kakde v3](https://arxiv.org/pdf/2010.00657v3),
§§2.2–2.3 PDF pp.15–18, Lemma 3.9 PDF pp.25–26, §6.1/Lemma 6.1 PDF p.40
and Appendix B.2 equation (171) PDF p.93, works with the image of character
evaluation, rather than the whole product of valuation rings. The cardinality
argument requires the square presentation, nonzerodivisor and finiteness
assumptions; arbitrary character quotients need not be Gorenstein. Sharp maps
to the inverse-character ring, and it becomes an endomorphism only under the
appropriate inverse stability. The packet's rectangular compound correction
uses the right-sided adjugate identity to exhibit a preimage. For the rows
(1,2,0,3), (0,3,1,2), (0,0,3,1), r=2 and the first-three-column determinant
9, the preimage (7,−9,0,3,0,0) maps to (18,−9,27)=9(2,−1,3). This repair is
sound; the newer library overlap below is a separate problem.

For **/5**, [BCGP21 v3](https://arxiv.org/pdf/1812.09269v3), §6.1.1 PDF
p.139, constructs cohomological spectral support from a chosen bounded
projective Banach representative. Its nonalternating product of degree
Fredholm series is auxiliary. LAD's contractible A→A test distinguishes the
raw product (1−aT)^2 from the zero model's product 1.
[BCGP25](https://arxiv.org/pdf/2502.20645), Definition 2.2.17 PDF p.21 and
§4.6.46/Remark 4.6.47 PDF pp.93–94, requires countable affinoid exhaustions
with dense restrictions, adding relative compactness for Stein spaces. Its
solid finite-slope functor f_*f^* is stronger than algebraic monoid inversion.
LAD's restricted comparison and shared geometric/functional-analysis requests
preserve these distinctions.

For **/6**, the accepted `RS-16.result.json` entry
`IntegralIwasawaTheory:I.5` deliberately keeps Mazur–Wiles and odd-prime
totally-real Wiles Hecke/congruence methods alongside the cyclotomic
Euler-system method. The asserted unintended proof duplication is absent.

## Library reuse and remaining PMIA revision

I read the reviewed library audit for L3, D.2, PMIA L6 and LAD L4. Programme
pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. At those pins,
`ContinuousMap.unitsOfForallIsUnit` lifts an already continuous map with unit
values; it cannot supply Gamma continuity. `gaussSum` has the positive sign.
Tau Ceti's local-field `teichmuller` supplies the residue-unit lift, not the
analytic character branch. `TauCeti.AuslanderReitenTranspose` uses an
opposite-linear dual cokernel without a minimal presentation hypothesis.
The shared build's four relevant source files exactly match the pin checkout.

Current read-only TauCetiRoadmap is
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read the ProfiniteArithmetic
and StableReduction introductions and Suggested interfaces, and current
Fitting and stable-transpose statements. These newer implementations must
be cited as current-library suppliers, not attributed to the older pin.

| PMIA L6 target | Existing declaration and boundary |
| --- | --- |
| higher-fitting-ideal | `TauCeti.fittingIdeal`, FittingIdeal/Basic.lean:343, for finitely generated modules over commutative rings. |
| higher-fitting-independence | `Submodule.minorsIdeal_ker_eq_of_surjective`, Basic.lean:304, and `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, Basic.lean:349. |
| relation-minors-add-generator | Generating-family independence is available; the target's arbitrary families still need a span/image adapter. |
| higher-fitting-base-change | `TauCeti.fittingIdeal_baseChange`, FittingIdeal/BaseChange.lean:134, for arbitrary commutative algebra base change, without flatness. |
| transpose-stable-equivalence | `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`, StableTranspose.lean:91, for exact surjective projective presentations over any ring, without finiteness. |

Revise the PMIA packet, reader, Suggested file and affected consumers together
to reuse these declarations. Retain the arithmetic image-order and sharp
transport adapters, arbitrary-family distinction, nonflat examples and
opposite-ring dual factors P0×Q1 and P1×Q0. Reader and consumer changes are
outside the live issue's scope. Ring-module Fitting ideals alone do not finish
StableReduction's scheme-level targets.

## Validation

The pinned-index blueprint checker reports zero errors for all four actual
packets and the two exact prepared candidates. L3 retains 26 inherited
short-API warnings; the other packets have none. Non-review fields and all
four Suggested files equal the input. Each installed/candidate history is the
original history followed by the entire preceding review object; no prior
ledger is discarded. No packet has an `excerpt` field.

Fresh sequential shared-build checks, with more than 20 GB available before
each run:

| Suggested file | Result |
| --- | --- |
| L3 | Exit 1: unknown `research` module prefix before body elaboration. |
| L3-2 | Exit 0: 111 `sorry` warnings; no other diagnostics. |
| D.1 | Exit 0: 307 `sorry` warnings; no other diagnostics. |
| PMIA | Exit 0: 1,075 `sorry` warnings; no other diagnostics. |

No language server, dependency build or update ran. The Gamma, finite FG and
compound-map probes passed. Intake file validation and `git diff --check`
passed. The stock completion predicate is false on the permitted tree and
true with the exact two-candidate read-only overlay. Authorization remains
the only obstacle to recording the completed correction review.
