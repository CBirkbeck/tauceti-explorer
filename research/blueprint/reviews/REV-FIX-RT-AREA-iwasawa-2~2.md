# Independent correction review: FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-XJjsb1`, 13 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219).
Input: `0f6f96ae507a07513e2c69aa57e471673ee741bd`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6156204408).
I did none of the fixes being reviewed.

## Decisions

L3's Gamma/Gross–Koblitz correction is accepted. PMIA needs changes because
current Tau Ceti supplies generic higher Fitting and stable-transpose results
that its L6 still plans. Its arithmetic repairs are sound. L3-2's derivative
correction and LAD's derived-slope correction are acceptable at their stated
boundaries. A negative PMIA verdict completes the mathematical review; it is
not a reason to accept duplicate library work.

This submission is presently a **scope-blocked checkpoint**. The live issue
names L3 and PMIA packet edits, but the queue requires review identities on
L3-2 and LAD too. [WORKERS.md](../WORKERS.md), Doing the work, says “Edit only
the files the issue names, plus your own scratch space.” Two concrete metadata
updates were prepared and validated; authorization was requested in the
worker conversation and has not arrived. Neither omitted packet was edited.
The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-2~2.md) preserves the exact
candidates. D.1 is read-only context, not a queue output.

This is a fresh review of six correction contracts. It does not replace the
preceding whole-packet audits of 1,663 L3 nodes, 487 PMIA nodes, 79 L3-2 nodes
and 303 LAD nodes. I read the original findings, verification, round-two fixes,
affected contracts, APIs/tests and prior checkpoint. Earlier review records
and checked ledgers remain attributed to their reviewers. The
[preceding report](https://github.com/CBirkbeck/tauceti-explorer/blob/0f6f96ae507a07513e2c69aa57e471673ee741bd/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
records that review's provenance.

| Finding | Verdict on the correction | Remaining boundary |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | Accepted in L3 | Continuous unit-valued interpolation; dyadic congruence exception; source sign/root and original odd-prime range. |
| /2 Ferrero–Greenberg | Accepted; L3-2 metadata prepared | Primitive odd tame character, even branch, conductor term; convergence and nonvanishing require separate inputs. |
| /3 Classical log-syntomic comparison | Retain the D.1 application contract | Exact integral range, bounded-error and rational comparisons remain distinct; CS.0–CS.3 are requested producers. |
| /4 Character orders, minors and transpose | PMIA needs changes | Arithmetic fixes accepted; generic results already implemented must be reused. |
| /5 Derived finite slopes | Accepted; LAD metadata prepared | Raw product depends on the representative; invariant support, inclusive rational slopes and restricted solid comparison. |
| /6 Main-conjecture ownership allegation | Retain the verifier's rejection | The separate Hecke/congruence and Euler-system methods are intentional. |

## Source and contract checks

Nine public PDFs were retrieved afresh. Their fingerprints agree with the
preceding checkpoint, and the locations below were read. Morita and
Gross–Koblitz were inspected as page images. Pilloni's maintainer-cleared
author manuscript was read directly. No restricted file or source passage was
copied into scratch or the repository. The following statements are in my own
words.

**/1.** [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
§1, Lemma 1/Theorem 1, printed pp.255–256, gives continuous interpolation
of the signed finite product, with separate unit/nonunit recurrence steps.
The exceptional dyadic precision-two congruence is not available. L3's
buffered precision respects this. Fresh integer probes give
G3(0)=1, G3(1)=−1, G3(4)=2, G3(5)=−8; G2(1)=3 and G2(5)=1 modulo four
exhibit the exception. Eight hundred valid finite-period congruences and the
corresponding recurrences pass. Gamma takes values in units; continuity does
not make it an additive character or establish all analytic claims.
[Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
§1 equations (1.2), (1.5), (1.6)/Theorem 1.7, printed pp.570–571, uses a
negative Gauss sum, pi^(p−1)=−p and pi congruent to zeta−1 modulo
(zeta−1)^2. Its original setup excludes p=2 and exponent zero. The corrected
contract distinguishes those hypotheses from proposed extensions and
explicit analytic/splitting inputs.

**/2.** [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
§1.2 p.461, §4 equations (4.1)–(4.6)/Theorem 4.1 pp.470–473 and
Appendices A–B pp.473–474, supports the derivative for the even chi-omega
branch attached to a primitive odd character of conductor N>1 prime to p.
The Gamma-log sum has direct chi(a) weights and the conductor correction
−(1−chi(p))*L(chi,0)*log_p(N). Only chi(p)=1 eliminates that term. L3-2
retains the conductor-four dyadic omega and a separate nonvanishing request.
The positive-residue permutation passes range, bijection, congruence and all
strict cutoff tests at (p,N,B)=(5,3,25), (2,3,4), (2,3,16), (3,1,9),
including cutoffs zero and N. The N=1 probe concerns the auxiliary
permutation, not the N>1 derivative theorem. Neither finite probes nor the
formal quartic-character test establish convergence or nonvanishing.

**/3.** [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2
pp.4–8, Theorems 2.2–2.3, distinguishes divided and undivided fibres and
their different divided-power ideals. The maps have legs (p^r,id) and
(id,p^r); both composites multiply by p^r, but only the former is compatible
with products. Exact divided comparison requires 0≤i≤r≤p−2. The general
semistable undivided comparison has bounded torsion error and a modified Tate
lattice. D.1 keeps this boundary, including the factorial difference between
source lattice conventions.
[Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16 p.37
and Theorem 5.4 p.54, separates rational exponential comparison (isomorphism
for i<r, injection for i=r) from integral bounded-error comparison.
[Nekovář–Niziol v5](https://arxiv.org/pdf/1309.7620v5), Remark 2.14 p.14
and Proposition 4.13 pp.53–54, fixes the boundary sign and its relation to
the Bloch–Kato exponential. D.1's regulator adapters retain these ranges and
scalings and request shared CS.0–CS.3 producers; they supply no integral
inverse or general log-syntomic foundation.

**/4.** [Dasgupta–Kakde v3](https://arxiv.org/pdf/2010.00657v3), §§2.2–2.3
pp.15–18, Lemma 3.9 pp.25–26, §6.1/Lemma 6.1 p.40 and Appendix B.2
(171) p.93, supports the repaired arithmetic interfaces. Character rings
are evaluation images, potentially proper orders; arbitrary such quotients
are not automatically Gorenstein. Cardinality statements retain square
presentations, nonzerodivisors and finite quotients. Sharp transports to the
inverse-character ring unless the character set is inverse-stable. Transpose
is attached to a presentation, with stable equivalence after adding
projective duals. The repaired exterior-cokernel argument uses the
higher adjugate on the right of the compound matrix to produce an explicit
preimage. A fresh r=2 probe with rows (1,2,0,3), (0,3,1,2), (0,0,3,1)
sends (7,−9,0,3,0,0) to 9(2,−1,3). Both higher-adjugate identities pass;
nine is the selected square minor's determinant. The remaining issue is
current-library reuse, detailed below.

**/5.** Pilloni, §§13.1.1–13.1.3, author pp.84–85, read from the cleared
`pilloni-2020-duke-author.pdf`, and
[BCGP21 v3](https://arxiv.org/pdf/1812.09269v3), §6.1.1 p.139, support
compactness through a bounded projective Banach representative. Banach
projectivity is not algebraic finite projectivity. Its degreewise determinant
product is auxiliary: the contractible K→K identity complex with scalar one
has product (1−T)^2, but the zero model has product one. LAD instead uses
cohomological support for invariance and restricts finite-window homotopy
claims to the supplied equivariance hypotheses. Rational slope bounds use
an inclusive ≤h endpoint, with the reciprocal-root convention checked.
[BCGP25](https://arxiv.org/pdf/2502.20645), Definition 2.2.17 p.21 and
§4.6.46/Remarks 4.6.47–4.6.49 pp.93–95, distinguishes dense quasi-Stein
restrictions from the relatively compact Stein criterion. Full solid f_*f^*
and its completed inverse limit require more than algebraically inverting a
monoid; the Laurent-series counterexample discriminates them. LAD keeps
geometric and functional-analysis supplier requests and supplies only the
restricted classical finite-window comparison. Derived base change is not
silently converted to underived cohomology base change.

**/6.** `RS-16.result.json`, `IntegralIwasawaTheory:I.5`, explicitly keeps
Mazur–Wiles and the odd-prime totally-real Wiles Hecke/congruence route, with
the cyclotomic Euler-system proof as a separate method. The verifier's
rejection of an accidental ownership merger remains justified; no fix is
needed.

## PMIA revision required

I read the reviewed library-audit entries for L3, PMIA L6, D.2 and LAD L4.
Programme pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Four shared-build
source files were byte-matched to raw GitHub at those pins and their relevant
statements read: ContinuousMap/Units, GaussSum, LocalField/Teichmuller and
AuslanderReiten/Transpose. The continuous-unit lift needs an already
continuous map; Mathlib's Gauss sum has positive sign; Teichmuller lifts
residue units; native transpose is an opposite-linear dual cokernel without
minimality hypotheses. This is a bounded baseline check.

Current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` was read
in the nearby StableReduction and ProfiniteArithmetic documents, especially
their scope, carrier and supplier boundaries. Current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following implementations
were read; they postdate the programme pin and cannot be listed as pinned
baseline declarations.

| Planned L6 result | Current declaration and hypotheses |
| --- | --- |
| Generic higher Fitting ideal | `TauCeti.fittingIdeal`, RingTheory/FittingIdeal/Basic.lean:343; finitely generated module over a commutative ring. |
| Finite-free presentation independence | `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, Basic.lean:349; any finite-free surjection. |
| Computation from kernel generators | `Submodule.minorsIdeal_span`, Generators.lean:75; `TauCeti.minorsIdealOfSet_eq_of_span_eq`, :99; `TauCeti.fittingIdeal_eq_minorsIdealOfSet`, :109. Arbitrary generating sets are allowed. |
| Base change | `TauCeti.fittingIdeal_baseChange`, BaseChange.lean:134; arbitrary commutative algebra base change, without flatness. |
| Stable transpose | `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`, StableTranspose.lean:91; exact surjective projective presentations over any ring, without finiteness. |

Replace duplicate generic constructors/proofs with those suppliers. Retain
needed coordinate-minor and arbitrary-family span/image adapters. For
example, the family ((2,0)) in Z² has unit degree-one relation-minors ideal,
whereas Fitt¹(Z²)=0: a family that fails to generate cannot represent the
ambient module. Keep the nonflat base-change tests and opposite-ring dual
factors P0×Q1 versus P1×Q0. The character-order and sharp-transport work is
still arithmetic work. Generic ring-module Fitting ideals do not complete
StableReduction's scheme-level Fitting targets. Reconciling PMIA's reader,
Suggested file and consumers requires a coordinated revision beyond this
review's edit scope; `needs_changes` is therefore retained.

## Changes and validation

Only the issue-named L3 and PMIA review records/history, this report and the
handoff changed. Each full preceding review was appended unchanged; all
non-review packet fields and all Suggested files are unchanged. No source
excerpt was added.

The blueprint checker with the pinned declaration index reports zero errors
on all four queue packets. L3 retains 26 inherited API warnings; the other
three have none. Both prepared candidates were checked at their canonical
paths through a read-only overlay, preserving cross-packet ownership checks.
The stock completion predicate returns false on the permitted tree and true
with precisely those two metadata updates, preserving PMIA's negative
verdict. Intake file validation and whitespace checks pass.

Fresh sequential `lean-check` results:

| File | Result |
| --- | --- |
| L3 | Exit 1; unavailable `research` imports, before body elaboration. |
| PMIA | Exit 0; 1,075 placeholder warnings only. |
| L3-2, read-only | Exit 0; 111 placeholder warnings only. |
| LAD, read-only | Exit 0; 489 placeholder warnings only. |

The suggested research files are not certified as final compact roadmap
packages. L3 and PMIA exceed the present 5,000-line package limit. No library
build/update, cache download or language server ran. Finite probes validate
specific signs, endpoints and matrix identities; they prove no analytic
supplier theorem or whole-roadmap closure.
