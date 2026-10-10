# Independent review: third Iwasawa area-fix round

Refs #5869. Codex, session `codex-Ra2LGa`, 10 October 2026.
Input: `c89c1befebb94f0ba04db968477e129bf29449b7`; integrated
`445094c5f69ea083343ad64fa4166857dfe016b8` before writing this review.

**Bounded Motives fixes: accepted. File verdict: needs_changes. Queue job:
checkpoint, blocked by the live issue's narrower edit scope.**

I did none of the original blueprint, red team, verification, fixes or earlier
reviews. I read all eight findings and verifier decisions, the three fix
reports, [round-two review](REV-FIX-RT-AREA-iwasawa-3~2.md), and the preceding
Motives-only checkpoint. I also read the intervening codex-fwRLjE review
continuation, which changes only Motives review metadata. The live issue
lists only the Motives packet and
suggested file under review. GH.0 and Kato were inspected read-only; no verdict
in either owner packet is replaced by this report.

The preceding checkpoint already repaired `period_torsor`'s missing comparison
and product arguments and the formal-period locators. I confirmed those
repairs; this session makes no new mathematical or Lean change to Motives.
Its preceding top-level verdict is archived unchanged in `reviewHistory`.
The current verdict preserves the independent reconstruction block and every
existing gap, request and partial-coverage record.

## Disposition of the eight confirmed findings

The authorized fix for /1–/7 was a handoff to the owning blueprint, rather
than duplicated arithmetic in Motives. Acceptance of that routing does not
certify that a later owner edit remains correct. The checks below distinguish
the handoff from the current owner, particularly for /3.

| Finding | Independent disposition |
| --- | --- |
| /1: CM product models | Handoff to GH.0 is correct. BDP §2.2, p.1060 forms the product over the CM curve's field of definition; §3.2, p.1067 assumes an unramified local field and good models. Conrad's appendix, pp.1139–1140, supplies the universal Kuga–Sato factor, not every CM product. Current `GH.0/cm-product-good-model` requires both factor models and separates the canonical conductor application from arbitrary twists. Its positive model and bad-twist examples discriminate the false universal claim. A residual parenthetical in `GH.1/p-adic-abel-jacobi-map` still needs clarification, recorded below. |
| /2: symmetric-power twist | Handoff and current L1 moment-map orientation agree with Kato §8.4, p.182. Replacing the Tate-module symmetric power by cohomology contributes twist `k−2`, so the composite has twist `2−r+(k−2)=k−r`. At `k=4,r=1`, it is 3, exposing the former opposite-sign result. |
| /3: Euler operators | The verified handoff is correct; the current Kato owner needs repair. Proposition 8.7, p.184 and Theorem 9.5, p.188 retain linear factors `ell^(−r)` and `p^(−r)`, quadratic exponent `k−1−2r`, and the distinct prime-support cases. Those target nodes remain correct. However, the current L1 Hecke-equivariance node substitutes `n^(r−1)` for Lemma 8.8's `n^(r′−1)`, p.185. The calculation below shows that this substitution breaks the claimed derivation, not merely the citation. |
| /4: filtration target | Handoff and current owner agree with Kato §§9.2–9.4, pp.187–188: the comparison uses filtration steps, with upper zero boundary `i≥k`. Interior consecutive steps coincide, so the associated graded is zero there. The twist identifies `F⁰D_dR(V(i))` with `F^iD_dR(V)`; it does not identify an interior graded quotient with cusp forms. |
| /5: interpolation twist | Handoff and current interpolation node retain Kato Theorem 12.5(1), p.221: twist the compatible Iwasawa class by `k−r`, then specialize, localize and apply the dual exponential. The Iwasawa action and sign conventions are retained. A finite-level root of unity cannot stand in for the representation twist. |
| /6: local duality and limits | Handoff and current integral-limit node preserve Lemma 8.5, p.184. The cokernel is related to inertia cohomology invariants and dual residue-field cohomology. The original inverse system has corestriction, whereas its dual uses a direct restriction limit. The `mu_p` example separates eventual zero restriction from a potentially nonzero corestriction inverse limit. |
| /7: theta divisors | Handoff and current theta node use divisor pushforward, as Kato §1.10, p.124 requires for a function norm. For `c=5,a=2`, pullback of `c²[0]−E[c]` gives `25E[2]−E[10]`, with coefficient 24 at a nonzero 2-torsion point. Pushforward preserves the original divisor because multiplication permutes the 5-torsion. An identity only in `Pic⁰` does not establish the false divisor equality. |
| /8: Tate localization | The six Motives suppliers carry the verified effective/full distinction and compatible comparison contracts. HMS Definition 2.8, p.10 has effective periods and their localization at the Tate symbol; Theorem 2.10, p.11 first compares effective objects, then localizes. Corollary 3.4 and Remark 3.5, p.13 concern the full torsor. No evaluation-injectivity claim follows. PS.2 remains the consumer owning integration and analytic normalization. |

## Exact out-of-scope repairs

Let `Ch` denote the moment map, `T` the dual Hecke operator, and `D(a,b)`
the diamond operator. Kato Lemma 8.8 supplies Hecke scalar `ell^(r′−1)`
and diamond scalar `a^(r′−1)b^(k−r′−1)(ab)^(−r)`. Source and target
operators must be distinguished when rearranging these identities.

The linear term in Proposition 2.4, p.126 is `T D(ell^−1,1)`. Inverse
diamonds mean inverse units in the relevant residue groups. Transporting
through `Ch` contributes

```
Hecke:                  ell^(-(r′−1))
inverse first diamond:  ell^(r′−1−r)
product:                ell^(-r).
```

For the quadratic term, transporting `D(ell^−1,ell^−1)` contributes
`ell^(k−2−2r)`; multiplying by Proposition 2.4's coefficient `ell` gives
`ell^(k−1−2r)`. These are Proposition 8.7's coefficients, and the
auxiliary moment index `r′` cancels from the linear term.

Using the current node's Hecke exponent `r−1` instead yields
`ell^(-(r−1)) ell^(r′−1−r) = ell^(r′−2r)`. At the permitted indices
`k=4,r=1,r′=2`, its coefficient is 1 instead of `ell^−1`. This tests the
scalar derivation; it does not assume a nonzero arithmetic zeta class.
The node states the source/target dual operators of the lemma and specifies
no renormalization that could account for the change.

An authorized editor should restore `n^(r′−1)` in both the statement and
acceptance item 0 of
`KatoEulerSystems:L1/hecke-and-diamond-equivariance-of-the-moment-map`, and
add this transport calculation as a discriminating acceptance test. The
generic Lean intertwining contract takes supplied scalars; inspect its
instantiation rather than changing an unrelated operator. Preserve the
previous owner review in history and explain why its scalar assertion is
superseded. The central-diamond exponent `n^(k−2−2r)` remains correct.

The GH.1 `p-adic-abel-jacobi-map` statement requires supplied smooth proper
models, but hypothesis 0 still follows good reduction with the parenthetical
`p ∤ cNd_K`. This could be read as sufficient for an arbitrary CM twist,
contrary to /1. Keep the models as independent inputs and restrict that
conductor condition to BDP's chosen canonical application. Retain the
bad-twist example. This is a wording repair, not a counterexample to the
now-conditional theorem. Neither repair is applied outside the issue scope.

## Fresh Motives contract check

I inspected the complete records and suggested signatures for
`MC.5/diagram-localisation`, `MC.5/nori-tensor-category`,
`MC.6/formal-periods`, `MC.6/formal-periods-equal-comparison-algebra`,
`MC.6/period-torsor` and `MC.6/period-point`: statements, hypotheses,
prerequisites, locators, 32 API names and 18 acceptance examples. Each named
API/example occurs in the suggested file, and its contract was read.

HMS Definition B.18 and Assumption B.20, p.24, and Proposition B.22,
pp.25–26 require the rank-one localization object. Theorem 1.6, pp.4–5
applies it to Nori motives. MC.5 exports twists and the coefficient-algebra
construction; its Lean diagram prototype works over a field. Existing
product/interface gaps remain. It does not re-plan the separate Chow or
geometric-motive localizations.

MC.6 imposes bilinearity, pullback and connecting-map relations, forms the
effective algebra, then inverts `L=(G_m,{1},dlog,S¹)`. Its comparison follows
that order. The `Q[t]`/`Q[t,t⁻¹]` tests distinguish a polynomial generator
from an invertible one; they do not compute all periods or prove the period
conjecture. The new Definition 2.8/Remark 2.9 page locators are accurate.

`PairDiagram.PeriodComparison` requires a complex-linear isomorphism
family, both diagram naturalities, unit and product laws. Doubling preserves
a natural linear isomorphism but sends the unit to 2 and violates the
product law; the negative example rejects that formerly insufficient
contract. `ProductCompatible` ties good-pair tensor structures to geometric
wedge/cross products. The tensor comparison and period-point generator,
action and heap contracts consume the same witnesses.

`PairHomology.gm_finrank` supplies rank one, and `PeriodData` gives nonzero
logarithmic and circle classes. The comparison sends the logarithmic class
to a nonzero functional; in dimension one it cannot vanish at the nonzero
circle class. This supports `period_tate_ne_zero`, unlike nonzero vectors
alone in higher dimension. Evaluation extends over `L⁻¹`, whose image is
the inverse of the supplied value. Identifying it with `(2πi)⁻¹` requires
PS.2's separate analytic normalization.

The repaired `period_torsor` takes the product structures, their compatibility
and the typed comparison. The complex comparison provides a point after
the faithfully flat extension `Q → C`; together with the torsor identities
this supports the nonemptiness/faithful-flatness claim in HMS §3, pp.12–13.
These construction proofs remain admitted. Their added inputs do not supply
the missing geometric comparison or reconstruction interfaces.

## Baseline, ownership and preserved obligations

I read the actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` for
`IsLocalization.Away.invSelf`, `mul_invSelf`, `lift`,
`IsLocalization.algEquivOfAlgEquiv`, `Polynomial.not_isUnit_X` and
`LaurentPolynomial.T_add` (with `T_zero`). The lift requires a unit image,
supplied by nonzero complex evaluation. The algebra equivalence transports
powers of the distinguished generator to powers of its image. Polynomial
noninvertibility needs nontrivial coefficients, satisfied by `Q`; the
Laurent product law gives the inverse identities.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, I read
`fgPointTensorIsoEquiv`, `tensorAutFunctor` and
`pointsFunctorIsoTensorAutFunctor`. These start with an existing bialgebra
or Hopf algebra. The field/Hopf equivalence does not construct an arbitrary
category's representing algebra, Nori motives or geometric comparison.
The reviewed library audit has no Motives entry; its PS.2 entry records the
missing formal-period objects and MC.6 ownership.

I checked the current upstream ReductiveGroups README and Suggested file,
relevant completed HodgeStructures contracts, and current Tau Ceti library.
Their affine-group/Hopf, representation/comodule and abstract Hodge objects
are existing work. They do not supply the requested relative geometric
comparison. Neither read-only checkout was modified or built, and no new
target is assigned to those roadmaps.

The [geomlanglands review](REV-FIX-RT-AREA-geomlanglands~2.md) still
requires a relative Beck preservation adapter and typed reconstruction
interfaces. That verdict, both intervening algebraic-geometry verdicts and
the preceding Motives checkpoint remain in history. All 23 gaps, 16 requests,
coverage entries, source issues, prerequisites, planets and implementation
statuses are unchanged. This bounded acceptance does not clear the
reconstruction nodes, Basic Lemma, realization, geometric-product or C5
comparison obligations.

The reader contains all six statements and the main effective/full
distinction. It lacks the exact later period-torsor witnesses/proof/acceptance,
period-point rank-one annotation, updated locator and current reconstruction
verdict. A reader refresh remains outside the issue's edit scope.

## Verification and source receipts

- Packet checker with the pinned declaration index: 0 errors, 0 warnings;
  182 nodes, 451 counted APIs, 255 counted tests, 47 planets and 109 baseline
  declarations. Coverage remains partial, with no stage closed.
- Full unchanged suggested file through `lean-check`: exit 0; 806 warnings,
  all `declaration uses sorry`, and no other diagnostics. Mathlib is pinned
  to `082e2d37e8b0463410cdb532e111cd43d5a66174`. Suggested-file SHA-256:
  `99299f01dccfb3946d18ebf7f4497f104b49a216a6727151bd839eb5a0954150`.
  This checks elaboration of admitted contracts, not their proofs.
- Parsed preservation confirms that only review metadata changes in the
  packet. All earlier history entries and the previous top-level review
  are retained exactly. Submission-scope and whitespace checks are recorded
  in the handoff.

The sources below were downloaded afresh on 10 October 2026. These are
selected reads for the findings, not a full source re-audit of 182 nodes.
Kato's operator displays, filtration, limit arrows and interpolation order,
and BDP's local-model assumptions were also checked in rendered page images.
All mathematical discussion is in my own words; no source passage is copied
into these deliverables. Other baseline/source audits are inherited.

| Public source | Locators checked | SHA-256 |
| --- | --- | --- |
| [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Definitions 0.1/2.8, pp.2/10; Theorem 1.6, pp.4–5; Theorem 2.10 and Remark 2.9, p.11; §3, pp.12–13; B.18–B.22, pp.24–26 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10, p.124; Proposition 2.4, p.126; §8.4, p.182; Lemma 8.5/Proposition 8.7, p.184; Lemma 8.8, p.185; §§9.2–9.4/Theorem 9.5, pp.187–188; Theorem 12.5, p.221 | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [Bertolini–Darmon–Prasanna, published version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | Introduction, p.1040; §§1.4–1.5, pp.1053–1054; §2.2, p.1060; §3.2, p.1067; Conrad appendix, pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

## Dispatch blocker

The live issue's deliverables and embedded instructions exclude GH.0 and
Kato. The queue lists both additional packets and suggested files.
`issues.py:deliverables_complete` requires this job's review marker in every
queue-listed packet. Their markers name their separate owner reviews, so
completion remains false.

[WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue names,
plus your own scratch space.” I requested authority to include both owner
pairs while continuing all permitted work. No answer arrived before
submission. Changing their markers or trimming queue outputs would evade
that rule. This is a blocked checkpoint with an exact resumption note.
Reconcile the scope before another worker repeats this review.
