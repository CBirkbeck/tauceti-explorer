# Independent review of FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-NP5JM2`, 11 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219).
Input commit: `772d9e5f9c5bc35afa5aba5078d7ac113ea52b12`.
[Claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6108107972).
I did none of the fixes under review.

## Status

The six correction decisions are settled. The issue-named L3 packet is accepted
for finding /1; PMIA needs changes because current Tau Ceti implements several
of its generic targets. This review does not certify either whole roadmap as
closed. The previous review objects and histories are preserved in full.

**Submission remains a scope-blocked checkpoint.** The live issue names L3 and
PMIA only, including in its full instructions. Its queue entry additionally
requires review records in L3-2 and D.1. The stock completion predicate checks
all four packets. Both omitted records are prepared and checked; installing
only those metadata updates would finish the review, including PMIA's negative
verdict. [WORKERS.md](../WORKERS.md), Doing the work, says “Edit only the files
the issue names, plus your own scratch space.” Authorization was requested in
the worker conversation; no authorization has arrived. Neither omitted packet
has been edited. The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-2~2.md)
contains the guarded records and the exact resumption gate.

This is a bounded correction review. I read the six original findings, the
verification, the round-two fix report, the affected nodes and the preceding
reviews. The earlier complete 79-node L3-2 and 72-node D.1 audits retain their
attribution; I checked the corrections relevant to /2 and /3. The
[preceding review](https://github.com/CBirkbeck/tauceti-explorer/blob/772d9e5f9c5bc35afa5aba5078d7ac113ea52b12/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
is the input record, not evidence of a completed submission.

## Decisions and source checks

| Finding | Verdict | Remaining boundary |
| --- | --- | --- |
| /1 Morita Gamma/Gross–Koblitz | Accept bounded L3 correction | Original odd-prime/nonzero-exponent GK scope and analytic suppliers remain explicit. |
| /2 Ferrero–Greenberg | Accept bounded correction; record prepared | Convergence, arithmetic nonvanishing and the whole-layer frontier remain distinct. |
| /3 Log-syntomic comparison | Accept bounded correction; record prepared | Shared CS.0–CS.3 producers are requested rather than silently supplied. |
| /4 Character orders/Fitting/transpose | PMIA needs changes | Replace generic targets by current-library reuse through a coordinated revision. |
| /5 Derived finite slope | Retain the correction in LAD context | Raw determinant product depends on the representative; stronger Stein/solid comparisons keep their hypotheses. |
| /6 Alleged proof duplication | Retain the verifier's rejection | RS-16 deliberately preserves independent main-conjecture proof routes. |

All mathematical descriptions below are in my own words. Nine public PDFs were
freshly retrieved; their SHA-256 receipts agree with the input handoff. I read
the cited locations, using page images for the scanned Morita and Gross–Koblitz
articles. No book or restricted source was used.

**/1.** [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
§1, Lemma 1 and Theorem 1, published pp.255–256, interpolates the finite product
with its parity sign. The recurrence depends on whether the argument is a
unit. The congruence proof excludes precision exponent two at p=2; L3's buffer
preserves this exception. Finite checks give G3(4)=2, G3(5)=−8 and, modulo four,
G2(1)=3 versus G2(5)=1. The latter distinguishes the false dyadic period.
[Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
§1, equations (1.2), (1.5), (1.6) and Theorem 1.7, published pp.570–571,
uses the negative Gauss sum. The root satisfies pi^(p−1)=−p and the specified
congruence modulo (zeta−1)^2. The initial setup excludes p=2 and exponent zero.
The nodes retain those original restrictions and distinguish separately
requested extensions. The pinned Mathlib Gauss sum has the opposite sign.

**/2.** [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
§1.2 p.461, §4 equations (4.1)–(4.6) and Theorem 4.1 pp.471–473, and Appendix B
p.474, supports the primitive odd tame-character hypotheses and the even
chi-omega branch. The Gamma-log terms have direct chi(a) weights. The conductor
term is (1−chi(p))*B1,chi*log_p(N), or equivalently
−(1−chi(p))*L(chi,0)*log_p(N). Only the exceptional hypothesis chi(p)=1
eliminates it. L3-2 retains the dyadic character convention, E37's strict
endpoint repair, convergence input and independent nonvanishing request.
Finite checks of the positive-residue permutation, its N*iota(m) congruence
and strict filtration pass at (p,N,B)=(5,3,25), (2,3,4), (2,3,16), (3,1,9).
The N=1 auxiliary control is an identity permutation, not an extension of the
primitive N>1 derivative theorem. These probes do not prove the limit theorem.

**/3.** [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2,
PDF pp.4–8 and Theorems 2.2–2.3, distinguishes the divided complex
D=Fib(1−phi_r) from the undivided complex U=Fib(p^r−phi), with their different
divided-power ideals. Omega:U→D uses (p^r,id); tau:D→U uses (id,p^r).
Both composites multiply by p^r. Omega respects products, whereas tau does
not generally do so. The exact divided comparison has 0≤i≤r≤p−2; the
undivided comparison has bounded torsion error and the modified Tate lattice.
[Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16 PDF p.37
and Theorem 5.4 PDF p.54, provides separate rational exponential and integral
bounded-error statements. The exponential range is i<r for an isomorphism,
i=r for injectivity. [Nekovář–Niziol v5](https://arxiv.org/pdf/1309.7620v5),
Remark 2.14 PDF p.14 and Proposition 4.13 PDF pp.53–54, fixes the boundary sign
and Bloch–Kato comparison. D.1's D.2 adapters retain these distinctions, the
p^r scaling and external CS.0–CS.3 producer requests. They never assert an
integral inverse from the rational comparison.

**/4.** [Dasgupta–Kakde v3](https://arxiv.org/pdf/2010.00657v3), §§2.2–2.3
PDF pp.15–18, Lemma 3.9 PDF pp.25–26, §6.1/Lemma 6.1 PDF p.40, and Appendix
B.2 equation (171) PDF p.93, supports the arithmetic repairs. The character
ring is the evaluation image, not automatically the full product of valuation
rings. Square presentation, nonzerodivisor and finite quotient hypotheses are
needed for the cardinality argument. Arbitrary character quotients need not be
Gorenstein. Sharp changes to the inverse-character ring, unless the character
set is inverse-stable. The compound-map repair uses the right-sided adjugate
identity to construct a preimage. For rows (1,2,0,3), (0,3,1,2), (0,0,3,1),
the r=2 compound matrix sends (7,−9,0,3,0,0) to (18,−9,27), which equals
9(2,−1,3); nine is the first-three-column determinant. This arithmetic check
passes. The generic-library overlap described below still requires revision.

**/5.** [BCGP21 v3](https://arxiv.org/pdf/1812.09269v3), §6.1.1 PDF p.139,
uses a chosen complex's degreewise Fredholm product to construct cohomological
spectral support. The raw nonalternating product is representative-dependent.
A contractible A→A complex with scalar a has raw product (1−aT)^2, whereas the
zero model has product one. LAD keeps cohomological support as the invariant
and the corrected slope endpoint. [BCGP25](https://arxiv.org/pdf/2502.20645),
Definition 2.2.17 PDF p.21 and §4.6.46/Remark 4.6.47 PDF pp.93–94, requires
countable affinoid exhaustions and dense restriction maps, with relative
compactness for Stein spaces. The solid functor f_*f^* is stronger than
algebraic monoid inversion. LAD's restricted comparison retains these
conditions and its supplier requests. LAD is read-only context in this review.

**/6.** The accepted `RS-16.result.json` entry for
`IntegralIwasawaTheory:I.5` explicitly preserves Mazur–Wiles and the odd-prime
totally-real Wiles Hecke/congruence route, as well as the cyclotomic
Euler-system method. There is no accidental ownership merger to correct.

## PMIA revision required

I read the reviewed library audit for L3, D.2, PMIA L6 and LAD L4. Programme
pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The shared build's relevant Units,
GaussSum, Teichmuller and Transpose sources match those commits exactly.
`ContinuousMap.unitsOfForallIsUnit` assumes continuity; `teichmuller` supplies
a residue-unit lift, not an analytic branch. The native transpose uses the
opposite-linear dual cokernel and does not require a minimal presentation.

I also read current TauCetiRoadmap at
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`, including ProfiniteArithmetic and
StableReduction introductions and Suggested interfaces, and current Tau Ceti
at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following implementations
are newer than the programme pin:

| L6 target | Current supplier and exact boundary |
| --- | --- |
| higher-fitting-ideal | `TauCeti.fittingIdeal`, RingTheory/FittingIdeal/Basic.lean:343, over commutative rings for finitely generated modules. |
| higher-fitting-independence | `Submodule.minorsIdeal_ker_eq_of_surjective`, Basic.lean:304, and `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, Basic.lean:349, for finite free surjections. |
| relation-minors-add-generator | Generating-family independence is supplied; arbitrary families still require a span/image adapter. |
| higher-fitting-base-change | `TauCeti.fittingIdeal_baseChange`, FittingIdeal/BaseChange.lean:134; arbitrary commutative algebra base change, with no flatness hypothesis. |
| transpose-stable-equivalence | `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`, StableTranspose.lean:91; exact surjective projective presentations over any ring, without finiteness. |

The packet, reader, Suggested file and consumers must be revised together.
Retain image-order mathematics, inverse-character scalar transport,
arbitrary-family adapters, nonflat examples and opposite-ring dual factors
P0×Q1 versus P1×Q0. Removing these distinctions would create a new error.
Reader and consumer edits exceed the live issue's scope. Ring-module Fitting
ideals do not finish StableReduction's scheme-level targets.

## Validation and changes

Only the issue-named review records, this report and the handoff changed.
Non-review packet fields and all four Suggested files equal the input.
Each new history contains the entire preceding review after the unchanged
prior history. The two omitted candidates preserve their full `checked`
ledgers in the same manner. No packet or candidate has an `excerpt` field.

All four actual packets and both prepared candidates pass
`python3 scripts/check_blueprint.py` with zero errors. L3 retains 26 inherited
short-API warnings; all others have none. Sequential `lean-check` runs, with
more than 20 GB available before each, give:

| File | Fresh result |
| --- | --- |
| L3 | Exit 1, unknown `research` module prefix before body elaboration. |
| L3-2 | Exit 0, 111 `sorry` warnings and no other diagnostics. |
| D.1 | Exit 0, 307 `sorry` warnings and no other diagnostics. |
| PMIA | Exit 0, 1,075 `sorry` warnings and no other diagnostics. |

No language server, dependency build or update ran. The finite Gamma, FG and
compound-map probes pass. Intake file checks and `git diff --check` pass.
The stock `issues.deliverables_complete` result is false on the permitted tree;
a read-only two-candidate overlay yields true. The blocker is the file-scope
mismatch, not the mathematical review or PMIA's negative verdict.
