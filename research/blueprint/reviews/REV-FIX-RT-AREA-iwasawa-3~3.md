# Independent review: third Iwasawa area-fix round

Refs #5869. Codex (GPT-6), session `codex-dM5x45`, 11 October 2026.
Claim confirmed for [comment 6106645781](https://github.com/CBirkbeck/tauceti-explorer/issues/5869#issuecomment-6106645781).
Input revision: `94ef4d10337ec4e58f86ed4804996b862b039b10`.
Branch: `codex-dM5x45-review-5869`. No second job was claimed.

**Motives verdict: `needs_changes`. The permitted supplier review is complete;
the dispatched job is blocked by the live issue/queue scope mismatch.**
This review checks the eight confirmed findings, their verifier and the
third-round fix report. I did none of the fixes being reviewed. It follows
the preceding Iwasawa checkpoints and the intervening algebraic-geometry
review; that complete preceding top-level record is appended unchanged to
`reviewHistory`. Earlier exhaustive blueprint and reconstruction audits
remain attributed to their authors, rather than recertified here.

Two additional errors in the permitted Motives contracts are corrected:
the good-pair product contract now carries the packet's established degree
sign on both inverse Künneth maps, and the complex period map is described
as an evaluation rather than an embedding. The separately recorded Beck
adapter and reconstruction prototype defects remain revision obligations.

## Findings and source checks

All source statements below are restated in my own words. Public versions
and fresh download hashes are recorded below. The arithmetic-owner packets
were inspected read-only; their existing accepted reviews are earlier
reviewers' verdicts, not this job's independent review.

| Finding | Verdict and reason |
| --- | --- |
| RT-AREA-iwasawa-3/1 — CM product model | **Partly corrected; one consumer hypothesis remains wrong.** BDP §2.2, p.1060 defines the CM product over a field containing the CM defining field. Section 3.2, p.1067 separately requires finite unramified F/Q_p and smooth proper models of C and X_m. Conrad's appendix, pp.1139–1140 supplies the Kuga–Sato factor over the level base. GH.0/cm-product-good-model correctly supplies both factor models and retains positive and bad-twist examples. GH.1/p-adic-abel-jacobi-map still attaches p∤cNd_K to good reduction without limiting it to the chosen canonical conductor application. It must separate the two hypotheses as described below. |
| /2 — symmetric-power twist | **The selected correction is adequate in the owner packet.** Kato §8.4, pp.182–183 identifies the Tate module with cohomology twisted by 1. Its (k−2)th symmetric power therefore has twist k−2. Combining this with 2−r gives k−r. The current node and its weight-four test give 3 at k=4,r=1, whereas the original reversal gave −1. |
| /3 — Euler factors | **Operators corrected, supplier scalar still wrong.** Proposition 8.7(2), p.184 and Theorem 9.5, p.188 retain the linear multipliers ℓ^(−r), p^(−r), quadratic exponent k−1−2r, and the stated prime-divisibility branches. Lemma 8.8(1), p.185 uses the independent moment parameter r′ in the Hecke scalar n^(r′−1). The current Hecke-equivariance node still writes r−1. A fresh page-image check confirms the prime; the transport calculation below shows why it matters. |
| /4 — de Rham target | **The selected correction is adequate in the owner packet.** Kato (9.2.2), p.187 and §9.4, p.188 use filtration steps with vanishing beginning at i=k. For k=4 the steps F¹,F²,F³ agree with the modular-form step, so gr¹ and gr² vanish. The current contract and examples preserve this distinction and the endpoint. |
| /5 — interpolation order | **The selected correction is adequate in the owner packet.** Kato Theorem 12.5(1), p.221 first twists the Iwasawa class by k−r, then specializes and applies the local dual exponential. The current contract preserves this order, the distinguished cyclotomic action, f*, the omitted p factor and the sign (−1)^(k−r−1)χ(−1). A finite-level root alone does not identify the two local representations. |
| /6 — duality and limits | **The selected correction is adequate in the owner packet.** Kato Lemma 8.5, pp.183–184 describes the cokernel by inertia-cohomology invariants, identifies it with the Pontryagin dual of residue-field cohomology of dual-twisted inertia invariants, and uses direct restriction after dualizing inverse corestriction. The current proof contract retains those types and directions. For T=μ_p away from p, eventual restriction is multiplication by p and kills the direct system of Z/p groups; corestriction is an isomorphism and leaves a nonzero undualized inverse limit. |
| /7 — theta divisor | **The selected correction is adequate in the owner packet.** In Kato §1.10, p.124, multiplication pushforward preserves D=c²[0]−E[c], because it fixes the zero section and permutes E[c] when (a,c)=1. This is the operation controlling the divisor of the norm. For c=5,a=2 the pullback is 25E[2]−E[10]; nonzero 2-torsion has coefficient 24 rather than 0. The current node and non-example use the correct operation. |
| /8 — effective/full periods | **The localization supplier correction is adequate after the Motives repairs below; independent reconstruction gaps remain.** HMS Definition 2.8, p.10, Remark 2.9/Theorem 2.10, p.11 and Corollary 3.4/Remark 3.5, p.13 distinguish effective periods from their Tate localization. The full localized algebra is the tensor-isomorphism torsor ring. The typed comparison and rank-one Tate nonvanishing conditions are retained. MC.5/MC.6 own the Nori localization/presentation/torsor; PS.2 owns integration and its normalization of the Tate period. |

The third-round fix appropriately handed /1–/7 to their owners; a correct
handoff does not certify later owner revisions. The source-specific
arithmetic corrections remain necessary to finish this dispatched review.

## Corrections made in Motives

### Shared degree signs in the typed product contract

MC.5/nori-tensor-category already fixes the HMS Definition B.14 convention
(pp.20–21): with the usual exterior/cross products, the inverse Künneth
map for degrees i,j includes s=(−1)^(ij). Its recorded E29 explains the
opposite placement in the proof of Theorem 1.6, p.5; that source issue and
the separate missing boundary-product/excision supplier remain unchanged.

The previous `PairDiagram.ProductCompatible` used unsigned inverse
Künneth products, silently changing the convention between MC.5 and MC.6.
The corrected `wedge` clause includes s on the de Rham product, and the
`cross` clause includes the same s on the evaluation of the singular
product. Both representations use the same product of pairs. In the
comparison coefficient the two factors contribute s²=1, so the ordinary
formal-period product and the unital multiplicative comparison contract
remain unchanged. This is a prototype discrepancy with the packet's
existing convention, not an additional allegation about the source.

The formal-period comparison node and the period-point hypothesis now
state the signs explicitly. The comparison proof sketch records their
cancellation. The suggested file adds two proved checks:

- `PairDiagram.ProductCompatible.signs_cancel`: for every parity a and
  rational coefficient factors u,v, their two shared signs cancel.
- An odd-degree example: each inverse map has sign −1; factors 2 and 3
  give (−2)(−3)=6. Signing only one side instead gives −6. The first
  identity also rejects an unsigned inverse product in odd degrees.

These are algebraic contract checks. They do not implement the geometric
Künneth maps or establish the outstanding boundary-product supplier.

### Evaluation and source instructions

MC.6/period-point called the complex map a coefficient embedding, although
its own acceptance criterion correctly treated injectivity as conjectural.
It now calls it a complex evaluation map and explicitly preserves the
period conjecture. HMS's discussion after Definition 0.1, p.2 and the
evaluation preceding Corollary 2.12, p.11 support this distinction.

The unresolved Murre/Bloch–Beilinson source-action gap also instructed a
later worker to add conditions verbatim. That instruction now asks for
exact conditions in the worker's own words with theorem/page locators,
as required by the standing source rule. Its mathematical gap remains.
No source passage or excerpt field was added.

## Preserved suppliers and ownership

I checked the statements, hypotheses, source locators, prerequisite lists,
API and examples of six affected nodes: MC.5/diagram-localisation,
MC.5/nori-tensor-category, MC.6/formal-periods,
MC.6/formal-periods-equal-comparison-algebra, MC.6/period-torsor and
MC.6/period-point, together with their suggested forms.

The canonical coefficient-map repair from the preceding checkpoint remains
correctly constrained. `extend_restrictIso` supplies the degree-zero
identification; `finiteEndRestrict` restricts endomorphism families with an
explicit conjugation equation. Dual restriction specifies the coefficient
colimit map on every finite coefficient. The extended product and
multiplicative structure are induced from the effective ones. The ring-map
promotion and localization theorem use that same map, with explicit
unitality; they take neither an arbitrary map nor a localization hypothesis.
HMS B.18–B.22, pp.24–26 supplies this construction and computes the colimit
transitions as multiplication by χ.

Its finite-coefficient, inverse and already-unit tests remain proved from
the named supplier contracts. Their proofs do not discharge the supplier's
admitted construction. The proved polynomial-to-Laurent counterexample
also remains: evaluation at t=1 sends t to a unit while killing t−1, so
unit image alone cannot characterize localization at t over Q[t].

The formal presentation still imposes linearity, functoriality and the
triple/connecting-map relations, gives the exterior/cross product, then
inverts the Tate class. The localized comparison preserves the canonical
maps and Tate inverse. The typed `PeriodComparison` is natural for both
edge types, unital and multiplicative; doubling violates its unit clause.
At the Tate pair the rank-one homology calculation and nonzero supplied
classes justify nonvanishing. Nonzero vectors alone in higher-dimensional
spaces would not. Neither a rational torsor point nor injectivity of its
complex evaluation is promised.

The surviving independent geomlanglands verdict is retained: the relative
Beck preservation adapter is not established under the printed target
hypotheses; reconstruction carriers, fifteen construction API signatures
and four theorem signatures remain unstated as typed targets. This bounded
Iwasawa review does not repair or re-prove those independent obligations.
All 182 node ids and prerequisite lists, 23 gaps, 16 requests, source issues,
coverage and implementation statuses are preserved. Apart from the two
identified nodes, all node objects are unchanged. The only gap edit replaces
the obsolete source-copying instruction. No stage or proof is closed.

## Arithmetic corrections awaiting authorized scope

In Kato's L1/hecke-and-diamond-equivariance-of-the-moment-map, replace the
Hecke exponent r−1 by r′−1 in the statement and acceptance item 0. Keep
the central-diamond exponent k−2−2r. Lemma 8.8, p.185 gives the transport
exponents: inverse Hecke contributes −(r′−1), and inverse first-diamond
contributes r′−1−r. Their sum is −r. The extra ℓ from the K₂ norm relation
and the central-diamond factor give ℓ^(k−1−2r).

At k=4,r=1,r′=2,ℓ=2 the correct linear multiplier is 1/2; substituting the
wrong Hecke exponent gives 1. `chernHeckeDiamond` currently takes a generic
scalar. A source-specific scalar regression must accompany the packet
correction, rather than treating that generic signature as evidence for
the printed exponent. The proposed integer-exponent identity and the two rational numerical cases were independently elaborated in scratch with `lean-check`, exit 0 and no warnings. This checks the scalar calculation, not the geometric equivariance lemma. Preserve prior audit objects in review history.

In GH.1/p-adic-abel-jacobi-map, hypothesis 0 must require finite unramified
F/Q_p and supplied smooth proper models of C and X_m independently.
Record p∤cNd_K separately as the canonical conductor application condition;
it alone gives no good model for an arbitrary CM curve or ramified twist.
Retain the existing positive product-model and bad-twist checks and
Conrad's attribution for W_m, rather than giving his appendix the CM factor.

## Libraries, upstream and verification

The reviewed library audit `data/library-coverage.json`, AUDIT-27/REV-AUDIT-27
for PS.2, records no formal-period/Nori torsor construction and flags its
MC.6 ownership. Freshly read pinned Mathlib statements include
`IsLocalization.Away.invSelf`, `mul_invSelf`, `lift`,
`IsLocalization.algEquivOfAlgEquiv`, `of_le_isUnit` and `bijective`.
The index and shared Mathlib build use
`082e2d37e8b0463410cdb532e111cd43d5a66174`; the pinned Tau Ceti source tree is
`f790474821cf4256814db967cb154e7af3d0c369`.

The current upstream checkout at `070dc2becd74419e76303ede84b465ed4a69461f`
was inspected read-only: ReductiveGroups and Completed/HodgeStructures
READMEs in full, their relevant Suggested forms, and the current Tau Ceti
Tannaka equivalence statement. The known-Hopf tensor-automorphism equivalence
is existing infrastructure; the completed Hodge roadmap supplies abstract
Hodge structures and Tate twists, not the geometric pair comparison or
arbitrary-neutral reconstruction. No upstream file was changed or built.

- Packet checker with the pinned declaration index: **0 errors, 0 warnings**.
  It reports 182 nodes, 462 counted definition/construction API items,
  259 tests, 47 planets, 111 baseline declarations, 23 gaps and 16 requests;
  eight stages in scope and none closed.
- `lean-check research/blueprint/suggested/MotivesAndAlgebraicCycles.lean`:
  **exit 0**, 816 warnings, all admitted-proof warnings; no other diagnostics.
  Final file SHA-256:
  `525a8746e61517959e489c459326ed40e4ea4256e1485f45dc522306c5520827`.
  The new sign checks have actual proofs. The file imports Mathlib modules;
  this does not claim proof closure or a fresh Tau Ceti implementation.
- Parsed preservation checks verify the preceding review and every earlier
  history entry unchanged, all nodes/prerequisites retained, and only the
  named mathematical edits. There are no source `excerpt` or `quote` fields.
- Whitespace and submission-file checks are recorded in the handoff.
  No link map or restructuring proposal is a deliverable here.

## Fresh source receipts

| Public source | Selected reads | PDF SHA-256 |
| --- | --- | --- |
| [Huber–Müller-Stach, arXiv v5](https://arxiv.org/pdf/1105.0865v5) | pp.2,5,10–13,20–26: Defs.0.1,2.8,B.14,B.18; Thms.0.2,1.6,2.6,2.10,3.3; Cor.3.4/Rem.3.5; B.20–B.22 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10 p.124; §8.4–8.8 pp.182–185; §9.2–9.5 pp.187–188; Thm.12.5(1) p.221. Page images freshly checked at pp.184,185,188,221. | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [Bertolini–Darmon–Prasanna, published Duke version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | §2.2 pp.1060–1061; §3.2 pp.1067–1068; Conrad appendix pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

## Dispatch obstruction

The live issue names only the review report and Motives packet/Lean pair.
The queue also requires GH.0 and Kato packet/Lean pairs, and
`issues.py:deliverables_complete` requires this job's verdict in every
queue-listed packet. A negative mathematical verdict is a valid finished
review; missing authorized review paths are the present dispatch blocker.

[WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue names,
plus your own scratch space.” A four-file scope extension was requested;
no authorization has been received. The arithmetic corrections were
prepared in scratch, but the owner files and their review markers remain
unchanged. The maintainer must authorize those paths or align dispatch
with the intended Motives-only review. Do not replace owner review markers
without performing their independent review or remove queue outputs to
manufacture completion. The reader refresh is likewise outside this issue;
its exact remaining synchronization work is listed in the handoff.
