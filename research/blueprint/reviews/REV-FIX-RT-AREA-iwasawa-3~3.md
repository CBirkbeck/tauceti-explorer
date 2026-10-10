# Independent review: third Iwasawa area-fix round

Refs #5869. Codex (GPT-6), session `codex-xVALZ8`, 10 October 2026.
The bot confirmed claim comment 6103080946. Initial checkout:
`2c95d0676ff2064366ce7f1120da575b7417c608`.
Rebased before submission onto `2f72a720f` and retained the intervening
algebraic-geometry review (codex-f0fT1p) unchanged in history.
Its update changed no mathematical fields or Lean signatures.

**Motives verdict: needs_changes. The canonical coefficient-map prototype
is repaired; the separate reconstruction obligations remain.** This is a
bounded independent review of the eight verified findings and their third
fix round, following the prior Iwasawa checkpoints and the newer
algebraic-geometry review. I did none of those jobs. Earlier comprehensive
packet audits remain attributed to their authors; this report does not
claim a fresh audit of every Motives or arithmetic-owner node.

The live issue permits this report and the Motives packet/Lean pair. Its
queue entry additionally requires GH.0 and Kato packet/Lean pairs. I asked
for authorization to include those four files, while completing the
permitted mathematical repair. Without that authorization, the two owner
pairs remain read-only and this is a blocked checkpoint. Their exact
remaining repairs are below. Their existing review markers are not a verdict
from this job.

## Eight finding dispositions

The original fix's handoffs for /1–/7 respect its ownership boundary. A
handoff does not certify every subsequent supplier revision.

| Finding | Disposition after selected fresh source reads |
| --- | --- |
| /1 — CM product model | The GH.0 product-model supplier correctly takes good models of both factors. BDP §2.2, p.1060 forms X_m=W_m×A^m over a field containing the CM defining field; §3.2, p.1067 requires finite unramified F/Q_p and smooth proper models. Conrad's appendix, pp.1139–1140 supplies W_m over the level base, not a good model of every CM twist. The GH.1 consumer still needs the conductor-parenthetical repair below. |
| /2 — symmetric-power twist | The current Kato moment-map contract agrees with §8.4, pp.182–183: T_pE=H_p(1) gives symmetric-power twist k−2; adding 2−r gives k−r. Weight four, r=1 yields 3 and detects the former reversal; weight two alone does not. |
| /3 — Euler factors | Proposition 8.7, p.184 and Theorem 9.5, p.188 support the current linear exponent −r, quadratic exponent k−1−2r and divisibility branches. The Hecke-equivariance supplier still has r−1 instead of Lemma 8.8's r′−1, p.185. The rendered display and transport calculation below independently confirm the defect. |
| /4 — de Rham target | Kato (9.2.2), p.187 and §9.4, p.188 use filtration steps, zero for i≥k, and F⁰D(V(i))=F^iD(V). At k=4 consecutive interior steps agree, so their graded quotient is zero. The current contract preserves this distinction. |
| /5 — interpolation order | The current supplier follows Theorem 12.5(1), p.221: twist the Iwasawa class by k−r before specialization, localization and exp*. It retains the cyclotomic action, dual form, omitted p factor and sign. A finite-level root alone cannot change the representation. |
| /6 — duality and limits | The current integral-limit supplier retains Lemma 8.5, pp.183–184: inertia-cohomology invariants describe the cokernel; their Pontryagin dual is residue-field cohomology of dual-twisted inertia invariants. Inverse corestriction becomes direct restriction after dualizing. Vanishing in the restriction system is not an undualized inverse-limit argument. |
| /7 — theta divisor | The current supplier uses multiplication pushforward, as required for the divisor of the norm in §1.10, p.124. At c=5,a=2 the pullback is 25E[2]−E[10], with coefficient 24 at nonzero 2-torsion, whereas the original divisor has coefficient zero there. Pushforward preserves the original divisor. |
| /8 — effective/full periods | The six Motives suppliers retain the effective presentation, inversion of the Tate symbol, and comparison with the full tensor-isomorphism torsor. HMS Definition 2.8, p.10, Remark 2.9/Theorem 2.10, p.11 and Corollary 3.4/Remark 3.5, p.13 support those contracts. This review supplies the missing canonical coefficient-map signature rather than accepting an arbitrary homomorphism. PS.2 still owns integration and ev(L)=2πi. |

## Canonical coefficient-map repair

HMS B.18–B.22, pp.24–26 constructs the localized diagram and its product
from the effective diagram. The extension uses a rank-one fibre, with
negative tensor powers formed from its dual. Proposition B.22(2) compares
the coefficient algebras through the effective-diagram inclusion. Its proof
computes colimit transitions as multiplication by χ. The preceding review
correctly retired a prototype that claimed localization for an arbitrary
ring homomorphism, and recorded the missing canonical interface.

The revised suggested file now supplies that interface:

- `Rep.extend_restrictIso` identifies the specified extension on the
  degree-zero copy with T, naturally on diagram edges.
- `localise.finiteEndRestrict` restricts endomorphism families to a finite
  effective diagram. Its component equation fixes this as conjugation by
  the specified unit-tensor identification.
- `localise.coefficientMapLinear` is the induced map on the finite
  endomorphism-dual colimit. Its colimit equation prescribes the image of
  every finite coefficient, not merely the image of χ.
- `localise.product` and `localise.multiplicative` are induced from the
  effective product and representation, with the vertex-product equation
  and unital-extension statement.
- `localise.coefficientMap` promotes that same linear map to a ring map
  under explicit unitality. `localise.coalgebra` uses its algebra structure
  and states localization at χ. Neither a freely chosen map nor a
  localization hypothesis is passed into that theorem.

These are actual typed signatures at the pinned baseline. Their
construction and compatibility proofs remain admitted, as appropriate for
this suggested file. The finite-coefficient, inverse and already-unit
examples have proofs using the named contracts and existing Mathlib
localization API. They check the map chosen by the signatures; they do not
prove the admitted supplier itself.

The previously proved polynomial example remains: evaluation at t=1 into
Q[t,t⁻¹] kills the nonzero t−1 while mapping t to a unit. Localization at t
in the domain Q[t] is injective, so unit image alone cannot justify that
map. The rank-two negative example and unit-vertex example also remain.
Only the precise missing-signature gap is removed. No localization proof,
reconstruction gap or geometric realization is declared finished.

## Other Motives contracts and ownership

I checked the statements, hypotheses, proof steps, prerequisites, locators,
API and named examples of the following six affected suppliers, together
with their suggested forms. Counts include the added canonical interface.

| Supplier | API records | Named examples |
| --- | ---: | ---: |
| MC.5/diagram-localisation | 18 | 8 |
| MC.5/nori-tensor-category | 0 | 0 |
| MC.6/formal-periods | 12 | 7 |
| MC.6/formal-periods-equal-comparison-algebra | 2 | 0 |
| MC.6/period-torsor | 0 | 0 |
| MC.6/period-point | 11 | 7 |

The effective formal-period carrier has pullback and connecting-map
relations and wedge/cross-product multiplication. The full carrier
localizes at the Tate symbol L. The effective comparison is transported to
those localizations with a commuting-square contract. The polynomial and
Laurent examples distinguish an effective nonunit from its full inverse;
they do not compute the entire period algebra.

`PairDiagram.PeriodComparison` supplies complex-linear isomorphisms with
pullback, boundary, unit and product laws. `ProductCompatible` ties the
chosen multiplicative representations to geometric good-pair products.
The tensor-comparison and torsor contracts consume these witnesses.
Doubling a comparison still gives linear isomorphisms but sends the unit
pairing to 2 and makes the product pairing scale by 2 while the product of
pairings scales by 4. The retained negative example rejects that weaker
interface.

Tate nonvanishing needs both the nonzero logarithmic class and the rank-one
homology fibre with nonzero circle class. A nonzero functional on a
rank-one space cannot vanish on its nonzero circle. Higher-dimensional
nonzero vectors alone would not suffice. This permits evaluation through
the localization, conditional on the supplied comparison. The value of
the inverse is reciprocal to that supplied period; the analytic value
(2πi)⁻¹ requires PS.2's normalization.

I read the current upstream ReductiveGroups README and the completed
HodgeStructures README in full, plus their relevant suggested forms, and
checked the current Tau Ceti library. Known-Hopf reconstruction and abstract
Hodge/Tate structures already have owners. They do not supply the geometric
pair comparison or arbitrary-neutral-category reconstruction needed here.
The reviewed library audit's PS.2 entry retains that missing formal-period
supplier. Both upstream checkouts remained read-only and were not built.

At the pinned Tau Ceti commit I read `fgPointTensorIsoEquiv`,
`tensorAutFunctor` and `pointsFunctorIsoTensorAutFunctor`. They start with a
bialgebra or a commutative Hopf algebra over a field. They do not construct
the representing algebra from an arbitrary diagram category. I also read
the actual pinned Mathlib localization statements used by the repair and
examples, including `Away.invSelf`, `Away.mul_invSelf`, `Away.lift`,
`algEquivOfAlgEquiv`, `of_le_isUnit`, `bijective` and the prior
`injective_iff_isRegular` model inference. The last two newly cited
contracts are added to the baseline declarations.

The preceding algebraic-geometry review is archived unchanged. The separate
[geomlanglands review](REV-FIX-RT-AREA-geomlanglands~2.md) still records the
relative Beck preservation adapter, typed reconstruction carriers and
fifteen API/four theorem prototype objections. Those require real supplier
work; a successful localization signature check does not discharge them.
The overall Motives verdict therefore remains `needs_changes`.

All other nodes, all 23 earlier gaps, all 16 requests, source issues,
coverage and implementation statuses are preserved. The reader's later
period-torsor witnesses, period-point rank-one annotation, locator and
reconstruction verdict still need an authorized reader refresh. This review
does not change its ownership or scope.

## Repairs in the read-only arithmetic owners

In Kato's `L1/hecke-and-diamond-equivariance-of-the-moment-map`, restore
Hecke exponent r′−1 in both statement and acceptance item 0. Keep the
central-diamond exponent k−2−2r, which concerns a different operator.

Transporting the source linear operator in Proposition 2.4, p.126 through
Lemma 8.8, p.185 contributes inverse-Hecke scalar ell^(−(r′−1)) and
inverse-first-diamond scalar ell^(r′−1−r). Their product is ell^(−r),
independent of r′. The source quadratic coefficient ell and the central
inverse-diamond scalar give ell^(k−1−2r). Using r−1 for the Hecke exponent
instead gives ell^(r′−2r). At k=4,r=1,r′=2 that is 1 instead of ell⁻¹.
A scalar test at ell=2 distinguishes 1 from 1/2 without assuming any
arithmetic zeta class is nonzero. The existing `chernHeckeDiamond` Lean
contract takes a generic scalar and does not instantiate this source
exponent; add its source-specific scalar test when authorized.

In GH.0's `GH.1/p-adic-abel-jacobi-map`, hypothesis 0 still appends
p∤cNd_K to good reduction. Make the smooth proper models separate inputs
and restrict the conductor criterion to BDP's canonical application. The
product-model supplier and Lean comment already distinguish these inputs;
retain their positive and bad-twist checks. Read-only inspection of these
specific corrections is not a completed independent review of both owner
packets, and neither marker is changed here.

## Source and check receipts

Selected public sources were downloaded afresh on 10 October 2026. The
Kato p.185 display was also inspected as a rendered page, because text
extraction loses its prime. All mathematical statements here use original
wording and locators. Earlier broad audits remain attributed.

| Source | Selected locators checked | SHA-256 |
| --- | --- | --- |
| [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Definition 2.8, p.10; Remark 2.9/Theorem 2.10, p.11; §3, pp.12–14; B.18–B.22, pp.24–26 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10, p.124; Proposition 2.4, p.126; §8.4/Lemma 8.5, pp.182–184; Proposition 8.7/Lemma 8.8, pp.184–185; §§9.2–9.4/Theorem 9.5, pp.187–188; Theorem 12.5(1), p.221 | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [Bertolini–Darmon–Prasanna, published version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | §2.2, p.1060; §3.2, p.1067; Conrad appendix, pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

The pinned packet check and full Lean elaboration receipts, preservation,
whitespace and dispatch result are recorded in the
[handoff](../handoff/REV-FIX-RT-AREA-iwasawa-3~3.md).

## Dispatch obstruction

The live issue names only this report and the Motives packet/Lean pair.
The queue also names GH.0 and Kato pairs, and
`research/blueprint/issues.py:deliverables_complete` requires this job's
review marker in every queue-listed packet. Its predicate stays false
without their reviewed verdicts, even though a `needs_changes` verdict
itself is a valid finished review.

[WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue names,
plus your own scratch space.” The manager must authorize the four extra
files or align the queue with the intended Motives-only review. Neither
writing unearned owner verdicts nor dropping queue outputs is a legitimate
repair. The permitted canonical-map work is complete at the prototype
level; the scope mismatch blocks completion of the dispatched job.
