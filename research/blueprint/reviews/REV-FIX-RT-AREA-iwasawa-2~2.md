# Independent review of FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-MuEjW2`, 13 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219).
Input commit: `ff0f8208385bcd1c86322de5ab38810faa4a8e54`.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6154977202).
I did none of the fixes under review.

## Verdict and scope

The correction in the issue-named L3 packet is accepted. PMIA needs changes:
its arithmetic corrections preserve the necessary hypotheses, but current Tau
Ceti implements generic Fitting-ideal and stable-transpose targets it still
plans. A negative packet verdict is a finished review decision; it does not
prevent the queue from recognizing a completed review.

**This submission is a scope-blocked checkpoint.** The live issue and its full
instructions authorize only L3 and PMIA packet edits. The current queue also
requires L3-2 and LocallyAnalyticDistributions review records. Its stock
completion predicate returns false on the permitted tree and true with exactly
two prepared metadata updates. Authorization for these concrete updates was
requested in the worker conversation and has not arrived. The omitted packets
remain untouched. [WORKERS.md](../WORKERS.md), Doing the work, says “Edit only
the files the issue names, plus your own scratch space.” The
[handoff](../handoff/REV-FIX-RT-AREA-iwasawa-2~2.md) records the guarded updates
and resumption steps. The preceding handoff's D.1 completion requirement is
stale: the current queue requires LAD instead.

This is a review of the six correction contracts, rather than a new audit of
all 1,663 L3 nodes, 487 PMIA nodes, 79 L3-2 nodes or 303 LAD nodes. I read the
original findings, verification, round-two fix report, affected contracts and
preceding review. Prior full packet reviews, including their checked ledgers,
are preserved in history. Inherited gaps and supplier requests remain; no
whole-roadmap closure or formalisation is certified. The
[previous report](https://github.com/CBirkbeck/tauceti-explorer/blob/ff0f8208385bcd1c86322de5ab38810faa4a8e54/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
retains the earlier audit's provenance.

## Finding decisions

| Finding | Decision | Boundary retained |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | Accept the L3 correction | Natural interpolation, dyadic precision exception, negative Gauss sum and normalized root; original odd-prime and nonzero-exponent source scope. |
| /2 Ferrero–Greenberg derivative | Accept the bounded L3-2 correction; metadata prepared | Primitive odd tame character, even chi-omega branch, conductor correction and separate convergence/nonvanishing obligations. |
| /3 Classical log-syntomic comparison | Retain the corrected D.1 application contract as read-only context | Divided and undivided complexes, integral versus rational ranges, boundary sign and explicit external CS.0–CS.3 producers. |
| /4 Character orders, Fitting ideals and transpose | PMIA needs changes | Arithmetic repairs are sound; generic current-library results must be reused. |
| /5 Derived finite slopes | Accept the bounded LAD correction; metadata prepared | Representative-dependent raw product, invariant cohomological support, inclusive slope endpoint and restricted solid comparison. |
| /6 Alleged main-conjecture duplication | Retain the verifier's rejection | RS-16 intentionally keeps independent proof methods. |

All descriptions below are in my own words. I freshly retrieved nine public
PDFs and read the listed locations. Morita and Gross–Koblitz were checked in
page images because their scans have no useful text layer. I also read the
maintainer-cleared Pilloni author manuscript at the cited pages, without
copying the file or its passages into scratch or the repository.

**/1.** [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
§1, Lemma 1 and Theorem 1, published pp.255–256, extends the signed finite
product continuously and distinguishes unit and nonunit recurrence steps.
The precision-two dyadic congruence is excluded. L3's buffered precision keeps
that exception. Direct integer checks give G3(0)=1, G3(1)=−1, G3(4)=2 and
G3(5)=−8; modulo four, G2(1)=3 and G2(5)=1 rule out the false dyadic period.
The continuous Gamma carrier is units-valued, not an additive character.
[Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
§1 equations (1.2), (1.5), (1.6) and Theorem 1.7, published pp.570–571, uses
the negative of Mathlib's Gauss sum. Its pi satisfies pi^(p−1)=−p and
pi congruent to zeta−1 modulo (zeta−1)^2. The original setup excludes p=2 and
exponent zero. These restrictions are distinct from separately planned
extensions and analytic supplier obligations.

**/2.** [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
§1.2 p.461, §4 equations (4.1)–(4.6) and Theorem 4.1 pp.470–473, and
Appendices A–B pp.473–474, supplies the primitive odd character of conductor
N>1 prime to p. The derivative is for the even chi-omega branch. Gamma-log
terms carry chi(a), and the extra term is
−(1−chi(p))*L(chi,0)*log_p(N). Only chi(p)=1 removes it. L3-2 keeps the
conductor-four dyadic omega convention and separate arithmetic nonvanishing
request. The positive-residue permutation, its N*iota(m) congruence and strict
filtration endpoint pass fresh finite checks at (p,N,B)=(5,3,25), (2,3,4),
(2,3,16), (3,1,9). The N=1 case tests the auxiliary permutation, not the N>1
primitive-character derivative. These checks do not prove convergence.

**/3.** [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2
pp.4–8, especially Theorems 2.2–2.3, separates the divided fibre of
1−phi_r from the undivided fibre of p^r−phi. Their divided-power ideals differ.
The comparison maps use (p^r,id) and (id,p^r), and their composites multiply
by p^r. Products must not be assigned indiscriminately to both maps. The
exact divided comparison has 0≤i≤r≤p−2; the general undivided comparison has
bounded torsion error and the modified Tate lattice.
[Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16 p.37
and Theorem 5.4 p.54, separates rational exponential and integral bounded-error
comparisons. The former is an isomorphism for i<r and injective for i=r.
[Nekovář–Niziol v5](https://arxiv.org/pdf/1309.7620v5), Remark 2.14 p.14
and Proposition 4.13 pp.53–54, fixes the boundary sign and Bloch–Kato
exponential comparison. D.1's D.2 adapters retain these ranges, p^r scaling
and shared-producer requests; they do not invent an integral inverse. D.1
is neither a live-issue deliverable nor a current-queue completion output.

**/4.** [Dasgupta–Kakde v3](https://arxiv.org/pdf/2010.00657v3), §§2.2–2.3
pp.15–18, Lemma 3.9 pp.25–26, §6.1/Lemma 6.1 p.40 and Appendix B.2
equation (171) p.93, supports the corrected arithmetic interfaces. Character
rings are evaluation images, not automatically full products; arbitrary
character quotients need not be Gorenstein. The cardinality formula retains
square presentations, nonzerodivisors and finite quotients. Sharp transports
to the inverse-character ring unless the set of characters is inverse-stable.
A transpose depends on the projective presentation up to projective summands.
The exterior-cokernel proof needs the right-sided higher-adjugate identity:
a left multiplication after the compound map does not establish membership
in its image. A fresh r=2 compound-map computation for rows (1,2,0,3),
(0,3,1,2), (0,0,3,1) sends (7,−9,0,3,0,0) to 9(2,−1,3); nine is the
chosen square submatrix's determinant. Generic-library duplication still
prevents acceptance of PMIA.

**/5.** [Pilloni](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf),
§§13.1.1–13.1.3, author pp.84–85, and
[BCGP21 v3](https://arxiv.org/pdf/1812.09269v3), §6.1.1 p.139, distinguish
a compact representative's degreewise determinant product from the invariant
cohomological spectral support. A contractible K→K complex with identity
differential and scalar a has raw product (1−aT)^2, while its zero model has
product one. LAD makes compactness of a homotopy class existential and retains
this counterexample. The corrected complement tests slopes ≤h, including the
endpoint; it does not silently inherit the source's faulty endpoint wording.
[BCGP25](https://arxiv.org/pdf/2502.20645), Definition 2.2.17 p.21 and
§4.6.46/Remarks 4.6.47–4.6.49 pp.93–95, distinguishes quasi-Stein dense
restrictions from Stein relative compactness. Full solid f_*f^* and its
inverse-limit reconstruction are stronger than algebraic monoid inversion.
LAD retains the restricted compact Banach comparison and shared supplier
requests, rather than claiming the stronger foundation has been supplied.

**/6.** The accepted `RS-16.result.json` entry for `IntegralIwasawaTheory:I.5`
explicitly retains Mazur–Wiles, the odd-prime totally-real Wiles
Hecke/congruence method and the cyclotomic Euler-system method. The verifier
correctly rejected the alleged accidental ownership merger. No correction
is made to these independent routes.

## Current-library reuse still needed in PMIA

I read the reviewed library-audit entries for L3, PMIA L6, D.2 and LAD L4.
Programme pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Four relevant shared
build files were byte-compared to their raw GitHub contents at those pins:
ContinuousMap/Units, GaussSum, LocalField/Teichmuller and
AuslanderReiten/Transpose. Their actual declarations were read.
`ContinuousMap.unitsOfForallIsUnit` requires an already continuous function;
`gaussSum` has the positive sum convention; `teichmuller` is the residue-unit
lift for a nonarchimedean local field; the native transpose is an
opposite-linear dual cokernel and does not require minimality to be formed.
This bounded check does not re-certify every inherited baseline entry.

I read current TauCetiRoadmap at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the StableReduction
and ProfiniteArithmetic scopes, and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These implementations postdate
the programme pin:

| PMIA L6 target | Current supplier and hypotheses |
| --- | --- |
| higher-fitting-ideal | `TauCeti.fittingIdeal`, RingTheory/FittingIdeal/Basic.lean:343, for finitely generated modules over a commutative ring. |
| higher-fitting-independence | `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, Basic.lean:349, for any finite free surjection. |
| kernel-generator computation | `Submodule.minorsIdeal_span`, Generators.lean:75; `TauCeti.minorsIdealOfSet_eq_of_span_eq`, :99; `TauCeti.fittingIdeal_eq_minorsIdealOfSet`, :109. Arbitrary generating sets of the kernel are supported without finite relations. |
| higher-fitting-base-change | `TauCeti.fittingIdeal_baseChange`, BaseChange.lean:134, for arbitrary commutative algebra base change; no flatness assumption. |
| transpose-stable-equivalence | `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`, StableTranspose.lean:91, for exact surjective projective presentations over any ring, without finiteness. |

Replace generic planned constructors and theorems by these suppliers. Keep
coordinate-minor and arbitrary-family image adapters where genuinely needed.
A non-generating family's span must not be identified with its ambient module:
the family ((2,0)) in Z² has degree-one relation-minors ideal Z, but
Fitt¹(Z²)=0. Preserve nonflat base-change examples and opposite-ring dual
factors P0×Q1 versus P1×Q0; inverse-character transport is still arithmetic
work. Generic ring-module Fitting ideals do not finish StableReduction's
scheme-level targets. The packet, reader, Suggested file and consumers need a
coordinated revision; reader and consumer edits exceed this issue's scope.

## Changes and validation

Changed only the two issue-named top-level review records, their full review
histories, this report and the handoff. All non-review packet fields and all
Suggested files are unchanged. Neither edited packet contains an `excerpt`
field. The two omitted candidates likewise change only review metadata and
append their entire previous review to history.

All four actual queue packets and both prepared candidates pass the blueprint
checker with the pinned declaration index: zero errors. L3 has 26 inherited
short-API warnings; the other packets have none. Candidates were checked
through a read-only overlay at their canonical paths, retaining cross-packet
ownership checks. No link map or restructuring proposal is under review.
Fresh sequential `lean-check` runs, with over 20 GB available before each:

| Suggested file | Result |
| --- | --- |
| L3 | Exit 1: unavailable `research` imports, before body elaboration. |
| PMIA | Exit 0: 1,075 `sorry` warnings only. |
| L3-2, read-only context | Exit 0: 111 `sorry` warnings only. |
| LAD, read-only context | Exit 0: 489 `sorry` warnings only. |

The inherited blueprint files are not certified as final roadmap packages:
L3 has 25,364 lines and PMIA 6,513, exceeding the compact package shape.
No dependency build, update or language server ran. Gamma, permutation and
compound-map probes pass. Intake file validation and `git diff --check` pass.
The stock completion predicate is false on the permitted tree and true under
the two-candidate metadata overlay. No negative verdict was altered to make
that counterfactual pass.
