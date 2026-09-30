# RT-PAPER-SKINNER-20

Issue #4322 · Codex · session `codex-J6LwjP` · 2026-09-30 · complete.

Independent red team of `PAPER-SKINNER-20`, accepted after
`REV-PAPER-SKINNER-20`. I did neither earlier job. The inspected repository
base is `287c773`. This submission changes only the two red-team deliverables.

There are **six findings: one high, four medium and one low**. The main result
is that the extraction's unresolved logarithm gap has an explicit later
repair. The historical omission should remain documented, but it should not
lead the design job to impose new hypotheses on Skinner's Theorems A and E.
The JSON gives the precise locations, evidence and fixes for independent
verification.

## Findings

| ID | Severity | Required correction |
| --- | --- | --- |
| /1 | High | Record the Burungale–Skinner–Wan repair of the logarithm argument; import its proof and restore the published conclusions. |
| /2 | Medium | Replace editing instructions in items 5, 10, 19 and 59 with full mathematical statements. |
| /3 | Medium | Replace the definite quaternionic supplier for item 68's indefinite Shimura-curve realization. |
| /4 | Medium | Extract and assign the shared Cassels–Tate prerequisite used by item 74. |
| /5 | Medium | Assign the deduction of A-prime to the converse roadmap; modularity alone does not plan it. |
| /6 | Low | Correct Serre's page range and reconcile Wan notation and strict/relaxed terminology. |

### /1: A historical omission with a public repair

[Burungale–Skinner–Wan, arXiv:2603.20886v2](https://arxiv.org/pdf/2603.20886v2)
explicitly discusses Skinner's Lemma 2.2.2 in §1.2. Its Theorem 1.1 supplies
the eigendifferential logarithm nonvanishing for non-torsion algebraic points
on the relevant real-multiplication abelian varieties. The proof uses the
p-adic analytic subgroup theorem, with an endomorphism-stable variant in
Theorem 3.2. This is a missing proof input that the design must construct;
it is not already in the pinned libraries.

In the application, `M_f` is totally real and has degree `dim A_f`. Choose a
non-torsion rational Mordell–Weil generator when that module has rank one
over `M_f`. Its nonzero local lambda component, together with the rational
Kummer isomorphism under finite p-primary Sha, proves the injectivity needed
in Lemma 2.2.2. For Corollary 2.6.2, the point in the f-eigenspace comes from
the epsilon projector on the rational divisor point; verify the projector
and differential comparison rather than applying the logarithm theorem to
an arbitrary tensor without explanation.

Accordingly, retain E5/E6 as historical proof omissions with a known repair.
Update all downstream statements, notes and the Part II brief consistently.
Add the reusable transcendence theorem to the DT.3 source requests and its
RM/Heegner application to GZ.9, then import them into `RankOneConverse`.
Theorem B's stated Selmer injectivity assumption remains part of its contract.
The later theorem also does not justify nonvanishing for an arbitrary
nonzero cohomology class or settle the higher-rank logarithmic independence
questions discussed separately in the later paper.

### /2: Statement fields lost their mathematics

The replacement text in four JSON fields is an instruction to an editor.
It is not a theorem or definition. This defect is independent of whether a
particular editorial warning is mathematically sound. Restore the complete
Theorems A/E, the Selmer/Kummer definitions and exact sequence, and the
deduction of A. Preserve the stable item IDs and put commentary in `note`.

For item 19 in particular, the title promises an object and its comparison,
but the field no longer defines `W`, `Sel`, or `Sha`, or gives the exact
sequence relating them. The finite-S and local-vanishing qualifications
should supplement those definitions, not replace them.

### /3 and /5: Suppliers versus applications

`HilbertModularVarietiesAndShimuraCurves:R18.3` explicitly constructs definite
quaternionic forms on a finite set. Skinner's Case II uses a curve from an
algebra split at the real place. The appropriate geometry is in R18.1/R18.4,
with transfer from R17.3 and rational realization and differential comparison
from GZ.3. The exact Brooks normalization must remain visible.

Similarly, R29.6 proves elliptic modularity and analytic continuation through
comparison of local factors. The theorem in item 64 also consumes the new
p-converse and isogeny invariance of rank and Sha finiteness. Keep the
modularity import, but route that assembly exactly once to the existing
`RankOneConverse` candidate. This preserves the maintainer's routing and
does not introduce a second converse roadmap.

### /4: The Cassels–Tate input needs an owner

Item 74 gives a useful proof sketch but leaves its structural pairing theorem
inside a parenthetical explanation. Its own note acknowledges the missing
input. The same input appears as a gap in the ArithmeticStatistics packet.
It needs a shared supplier, with the local/global duality imported and the
elliptic alternating pairing and maximal-divisible kernel proved.

[Poonen–Stoll, corrected author version, §1](https://math.mit.edu/~poonen/papers/sha.pdf)
provides a public statement and the original references. The elliptic
alternating case is sufficient here. Do not silently generalize that
assertion to arbitrary principally polarized abelian varieties. In the
application, finite cyclic Selmer is the case being excluded; finiteness of
Sha is not available at the start of the argument.

## Scope and checks that did not become findings

I reread the entire published Skinner article, pp. 329–354 including the
bibliography, and all 78 extraction items, eleven source issues, six routes
and thirteen prerequisite records. The published PDF agrees with the
extraction's recorded hash. I also compared the relevant passages of arXiv
v1, checked the journal and arXiv metadata, and searched for later corrections.
Only selected sections of the later sources were read; this report does not
certify all their proofs or all monographs in Skinner's bibliography.

The 50 missing items each occur in exactly one route. All 42 distinct
planned-stage IDs resolve. I read their contracts, the additional source
route contracts, and the relevant alternative suppliers. The reviewed
library coverage has 39 of those entries; R29.5, R29.6 and R20.2 have no
entry under those exact IDs. An absent audit entry was not treated as
evidence that the library lacks a theorem.

The paper's main implication chain survives these checks: Selmer dimension
and parity supply the sign; the split-prime linear algebra gives the strict
Selmer vanishing; the Iwasawa divisibility and control give a nonzero p-adic
L-value; the logarithm identity gives a nonzero Heegner point; the height
formula and Kolyvagin input give the stated consequences. The logarithm
repair is relevant to the reverse logarithm implication and the
rank/Sha-to-injectivity step, not a reason to replace Theorem B's hypotheses.

The extraction correctly distinguishes the two auxiliary-twist branches:
nonzero central value for the deduction of A, nonzero first derivative for
E. E11's observation that a root number alone is insufficient remains valid.
The published unramified coefficient extension also remains essential. I
found no reason to undo E1's coefficient-ring correction or the elementary
misprint corrections after reading the corresponding passages.

I investigated item 41's specialization assertion. A pseudo-null module can
acquire a characteristic factor after specialization, but this does not
disprove the one-sided containment used here. For a finitely presented
module, the Fitting ideal base-changes; the characteristic ideal is the
divisorial closure in the normal-domain setting. Containment in a principal
ideal therefore gives the needed direction. The identification of the
specialized arithmetic Selmer dual is a separate control assertion. I read
the relevant argument in the
[Skinner–Urban author preprint](https://www.math.columbia.edu/~urban/eurp/MC.pdf),
§3.1.6 and Proposition 3.2.8/Corollary 3.2.9. Those are **the preprint's
numbers**; I do not present them as the published numbering or claim to
have checked the whole 226-page preprint.

The existing HE.1 and GZ.3 contracts already cover quaternionic CM points
and Hodge-normalized parametrizations. The Part II may compare Skinner's
specific epsilon normalization, but it must import those constructions.
Likewise the generic strict/relaxed Selmer conditions and Iwasawa control
remain imports from SelmerIwasawaCohomology. I did not label every
paper-specific instance of these imports a duplicate construction.

## Pinned library evidence

Both existing source checkouts were checked at their exact prescribed
commits. No checkout, dependency cache or Lean build was created for this job.

| Library | Declaration read | What it does and does not supply |
| --- | --- | --- |
| Tau Ceti `f790474` | [`WeierstrassCurve.Affine.selmerGroup₂`](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean#L104) | The explicit 2-descent group; not Skinner's odd-p cohomological group. |
| Mathlib `082e2d3` | [`PontryaginDual`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/PontryaginDual.lean#L37) | Continuous characters into the circle; not the full arithmetic Iwasawa dual/control package. |
| Mathlib `082e2d3` | [Power-series Noetherian and UFD instances](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Ideal.lean#L196) | Reusable commutative algebra. The UFD instance assumes a principal coefficient domain, so do not iterate it merely from a UFD hypothesis. |
| Tau Ceti `f790474` | [`Newform.eq_of_forall_notMem_eigenvalue_eq`](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean#L87) | Fixed level/weight and common nebentypus; item 73 needs the cross-level statement. |

The absence of a complete item in the library is compatible with these
reusable parts. It is not permission to re-plan the existing parts.

## Public source record

All following sources were accessed on 2026-09-30. Page extraction was
supplemented by a page-image check for the algebraic closures in the later
logarithm theorem.

| Source | Version and scope | SHA256 |
| --- | --- | --- |
| [Skinner](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf) | Published article, all 26 pages | `cfdfab6e62ac507be40d1f0bc8d9cb8371d95b42c5ae259fde054c70fb20c214` |
| [Skinner preprint](https://arxiv.org/pdf/1405.7294v1) | v1; selected version comparisons | `9e4650618c83394c400a10e990759f9fba42113eedc79fe2fcbe029d6c8381ff` |
| [Burungale–Skinner–Wan](https://arxiv.org/pdf/2603.20886v2) | v2; logarithm theorem and relevant proof | `f2b4a020bf5dbcd33df3a4b30cbf27230dc0d0775312f5e543b03b2486f6a994` |
| [Poonen–Stoll](https://math.mit.edu/~poonen/papers/sha.pdf) | Author version with 2014 correction; abstract and §1 | `3b9a619423358bc877fd2123b73a759157a728ec11e0f7b0aa48bd0333d7149a` |
| [Skinner–Urban](https://www.math.columbia.edu/~urban/eurp/MC.pdf) | Author preprint; selected algebra/control sections | `f9faa40aa5e30eba705da88e3d68c8aa43069b5be01c1cc6ece212dd57879748` |

## Validation

The red-team schema checker, swarm intake file check, JSON parsing and
`git diff --cached --check` passed. There is no blueprint packet
or suggested Lean file in this job, so the packet elaboration check is not
applicable and no Lean compilation was attempted. These structural checks
are separate from the mathematical review recorded above.
