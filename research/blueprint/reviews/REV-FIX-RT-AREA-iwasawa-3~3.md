# Independent review of the third Iwasawa area-fix round

Refs #5869. Codex (GPT-6), session `codex-nnFZhT`, 10 October 2026.
Input revision: `fb99cf051cb90cec265ac63529c9541642546aee`.

**Verdict: accepted, for the assigned fixes and their ownership handoffs.**
The Motives packet remains `partial`; this verdict does not certify proof
closure, implementation, or the separate geomlanglands reconstruction work.

I did none of the red team, verification, fix rounds, preceding reviews or
original blueprint. I read all eight confirmed findings, the verification,
the three fix reports and [the preceding review](REV-FIX-RT-AREA-iwasawa-3~2.md).
This report follows that review's two objections: an insufficient comparison
contract and an obsolete reader. The input also contains the later
algebraic-geometry review's explicit rank-one Tate correction; I checked it
as part of the period-point contract.

The only packet edits in this review are the verdict and preservation of the
preceding top-level review in `reviewHistory`. No mathematical statement,
prerequisite, API, test, source issue, coverage status or gap changes. The
suggested file and reader are unchanged. The reader is outside this job's
editable deliverables.

## Disposition of the eight findings

For /1–/7, the issue-authorized disposition was to hand the correction to the
blueprint that owns it. It did not authorize this reviewer to edit those
owners or the atlas's generated copies. I checked the mathematical substance
against the primary sources and inspected the present owner contracts. Both
owner packets now have accepted independent reviews. I found one subsequent
Kato source-match discrepancy, recorded below; those reviews are not a
substitute for fresh checking, and this report does not re-certify them.

| Finding | Verdict and reason |
| --- | --- |
| /1, CM product models | Accept the handoff to GH.0. BDP §2.2, p.1060 defines the product with the CM factor over its field of definition. Section 3.2, p.1067 requires a finite unramified local field and smooth proper models of the curve and product. The appendix, pp.1139–1140, supplies the universal Kuga–Sato factor, not a model of every CM product. The present `GH.0/cm-product-good-model` requires both models and distinguishes the canonical conductor application from arbitrary twists; its bad-twist and positive-model acceptance examples test both sides. The fix report's description of GH.0 as pending has been superseded by `REV-GeneralizedHeegnerCycles--GH.0~2`. No extra construction belongs in Motives. |
| /2, symmetric-power twist | Accept the Kato handoff. Section 8.4, p.182 has `T_p E ≃ H_p(1)`. Moving the Tate-module symmetric power to the left gives twist `k−2` on the cohomology side. The moment-map composite therefore has twist `2−r+(k−2)=k−r`; `k=4,r=1` gives 3, exposing the former sign error. The current L1 moment-map node states this orientation. |
| /3, Euler operators | Accept the Kato handoff, including the verifier's normalization correction. Proposition 8.7(2), p.184 and Theorem 9.5, p.188 give the linear coefficients `ell^(−r)` and `p^(−r)` in both nontrivial cases, with quadratic exponent `k−1−2r`. Lemma 8.8(1), p.185 uses `n^(r′−1)`. The current norm and reciprocity nodes retain the linear scalars and prime-divisibility cases. The source's last condition is `(p,N)=1`; writing `(p,MN)=1` under its `prime(M) ⊆ prime(N)` hypothesis is equivalent. The current owner's later review, however, restores `n^(r−1)` in its L1 Hecke-equivariance node and attributes that scalar to the printed lemma. This disagrees with the displayed source and the verified handoff. The owner must justify its mathematical normalization and record a source correction if intended, or restore the source-faithful statement. That follow-up is outside this review's editable packet; I do not certify it as applied. |
| /4, filtration target | Accept the Kato handoff. Sections 9.2–9.4, pp.187–188 identify filtration steps, with zero at `i≥k`. Consecutive interior steps coincide, so their associated graded quotient vanishes. The current dual-exponential node explicitly makes this distinction and uses `F⁰D_dR(V(i)) ≃ F^iD_dR(V)`. |
| /5, interpolation twist | Accept the Kato handoff. Theorem 12.5(1), p.221 twists the Iwasawa class by `k−r` before finite-level specialization, localization and the dual exponential. The current interpolation node follows that order and records the twisted Iwasawa action. A root at one finite level cannot replace the representation twist. |
| /6, local duality and limits | Accept the Kato handoff. Lemma 8.5, p.184 identifies the cokernel with invariants of inertia cohomology and then with the Pontryagin dual of residue-field cohomology. The original corestriction inverse system is handled using the dual of a restriction direct limit. The fix preserves this variance and the theorem statement; the `mu_p` countercheck distinguishes a potentially nonzero inverse limit from the vanishing restriction direct limit. This owner is now reviewed by `REV-KatoEulerSystems~2`. |
| /7, theta divisors | Accept the Kato handoff. Section 1.10, p.124 uses divisor pushforward under multiplication by `a`, consistently with the norm of a function. For `c=5,a=2`, pullback produces `25 E[2]−E[10]`, with coefficient 24 at a nonzero 2-torsion point, rather than the original divisor. Pushforward fixes the divisor because multiplication permutes `E[5]`. The separate compatibility on `Pic⁰` does not rescue the false pullback identity. The present L0 theta contract uses the norm/pushforward route. |
| /8, Tate localization | Accept the six existing Motives supplier nodes and the PS.2 application handoff. Effective periods, their localization, the full Nori category and the full tensor-isomorphism torsor are now distinguished explicitly. The comparison contract supplies the missing unit, product and connecting-map laws. The inverse-evaluation contract is supported by a rank-one nonvanishing argument. The detailed checks below explain why the preceding review's objections are resolved. |

## The six supplier nodes and their Lean contracts

I checked `MC.5/diagram-localisation`, `MC.5/nori-tensor-category`,
`MC.6/formal-periods`, `MC.6/formal-periods-equal-comparison-algebra`,
`MC.6/period-torsor` and `MC.6/period-point`, including their hypotheses,
prerequisites, source locators, API and examples.

HMS Definition B.18, Assumption B.20 and Proposition B.22, pp.24–25, require
a rank-one object for the diagram localization and identify the coefficient
algebra localization at its distinguished class. The existing MC.5 nodes
export this construction; they do not identify it with the Chow localization
of MC.1 or the geometric-motive stabilization of MC.4. Theorem 1.6, pp.4–5,
provides the Nori application at the Lefschetz object. The packet continues
to record the unresolved coboundary-product and sign/interface work.

HMS Definition 2.8, p.10 separates effective periods `P_eff` from
`P=P_eff[L⁻¹]`, where `L` is the logarithmic differential/unit-circle symbol
of `(G_m,{1})`. Theorem 2.10, p.11 first identifies the effective objects and
then localizes. Corollary 3.4 and Remark 3.5, p.13 concern the resulting full
torsor. These are the identifications stated by the six nodes. The rank-one
examples `Q[t]` and `Q[t,t⁻¹]` correctly test the missing inverse; they do
not compute the entire Nori Tate subcategory. Neither this argument nor the
packet asserts that evaluation is injective, or that `1/pi` cannot be an
effective numerical period.

The preceding prototype allowed a linear comparison family natural only for
pullbacks. Doubling such a family preserves those properties but sends the
unit period to 2 and makes product periods double while products of periods
quadruple. That family cannot induce the promised unital algebra map.

The replacement `PairDiagram.PeriodComparison`, at suggested lines
7968–7996, has separate fields for the isomorphism, pullback naturality,
connecting maps, unit and exterior/cross-product pairing. Naturality on pure
tensors extends by complex linearity. The pairing laws are therefore the
relations needed for a ring map from the effective presentation. The
`PeriodComparison.doubled_not_comparison` example checks the unit obstruction;
unit and product examples exercise the additional fields.

`PairDiagram.ProductCompatible`, at lines 8195–8212, also ties the abstract
good-pair multiplication to the actual product of pairs. Its wedge and cross
conditions relate the two multiplicative representation structures to the
products used in formal periods. Finite-dimensional duality makes the
cross-pairing condition determine the required comparison. Arbitrary
unrelated multiplicative structures no longer qualify.

`PeriodComparison.toTensorIsoOver` consumes that compatibility.
`periodPoint` is defined using the inverse representing equivalence, rather
than being an unstructured promised point. Its generator, heap and action
statements take the same comparison and compatibility. The ring map
`periodPoint.formal` consumes the typed comparison on all effective pairs;
its relation, generator and inverse APIs state its descent and localization.
Those construction proofs are still admitted, as a suggested file permits.

For nonvanishing, `PairHomology.gm_finrank` at line 6331 supplies
`dim_Q H_1(C*,{1};Q)=1`; `PeriodData` supplies nonzero logarithmic and circle
classes. After scalar extension the comparison sends the logarithmic class
to a nonzero functional on a one-dimensional space. It cannot vanish on the
nonzero circle class. This proves the mathematical implication in
`period_tate_ne_zero`; nonzero vectors alone in higher dimension would not.
The later algebraic-geometry correction explicitly supplies the missing
rank-one witness in both Lean and the packet. The universal property then
extends the map across `L⁻¹`.

Normalization remains a separate input: without analytic normalization the
inverse maps to `per(L)⁻¹`. With `per(L)=2*pi*i`, it maps to `(2*pi*i)⁻¹`.
The source's integration map immediately before Corollary 2.12, p.11 supports
this normalized value. PS.2 owns integration and its identification with the
supplied point; it imports the single MC.6 presentation. The C5 request for
the unital multiplicative comparison of arbitrary pairs remains open.

## Baseline and ownership checks

I read the actual statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` of the six localization/model APIs
added by the earlier fix: `IsLocalization.Away.invSelf`, `mul_invSelf`,
`lift`, `IsLocalization.algEquivOfAlgEquiv`, `Polynomial.not_isUnit_X` and
`LaurentPolynomial.T_add`. The lift requires that the image be a unit; in
`C` nonvanishing supplies that. The algebra-equivalence API requires the
source submonoid to map to the target submonoid, satisfied by transporting
the distinguished generator. The polynomial counterexample requires a
nontrivial coefficient semiring, satisfied by `Q`; `T_add` and `T_zero`
give both Laurent inverse identities.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` I also read
`fgPointTensorIsoEquiv`, `tensorAutFunctor` and
`pointsFunctorIsoTensorAutFunctor`. The reconstruction equivalence starts
with a commutative Hopf algebra over a field. It does not construct Nori
motives, relative comparison, formal periods or an arbitrary category's
representing Hopf algebra.

The reviewed library audit has no Motives entry; its PS.2 entry records the
absent formal-period and comparison objects and the MC.6 ownership overlap.
The current upstream ReductiveGroups README and Suggested file already own
the affine-group/Hopf and representation/comodule dictionary; the completed
HodgeStructures documents and current Tau Ceti library supply abstract
Hodge structures. Neither is a substitute for the requested geometric
comparison of arbitrary pairs. I checked these existing contracts and the
current library for the period/Nori names; no upstream files were edited or
new upstream targets planned.

The nine abstract reconstruction nodes and 39 API/test names listed as not
yet stated in Lean remain a separate obligation for
[REV-FIX-RT-AREA-geomlanglands~2 (#5161)](https://github.com/CBirkbeck/tauceti-explorer/issues/5161).
This acceptance does not discharge that job, the Artin/Tate computation,
the Basic Lemma, cellular realization, universal-property or geometric
product gaps. All 22 gaps, 16 requests and partial coverage records remain.

## Reader and verification receipts

The reader now contains all 182 node headings and the corrected typed
comparison, effective/localized presentation and inverse contracts. Its
period-point proof explicitly uses one-dimensionality and nonzero classes;
the packet's later additions name the typed witness for that existing
argument. The previous 96-node reader defect is resolved.

I did not assume byte-for-byte synchronization after subsequent independent
reviews: a fresh string comparison finds eight node strings absent, including
the two later explicit rank-one annotations, plus differences in source-issue text and
review metadata. Coverage, gaps and the principal six-node mathematics agree.
The displayed review metadata is still the older verdict. The handoff asks
the next authorized reader editor to refresh it; this job cannot edit that
file. These later annotations do not reintroduce either mathematical defect
the assigned fix round was required to repair.

Fresh checks on the input, repeated for the final packet:

- `scripts/check_blueprint.py`: 0 errors, 0 warnings; 182 nodes, 451 counted
  API items, 254 counted tests, 47 planets, 108 baseline declarations,
  22 gaps, 16 requests, eight stages and no closed stage.
- Full-file `lean-check` at the pinned Mathlib: exit 0, 805 warnings, all
  `declaration uses sorry`; no errors or other Lean warnings. Suggested-file
  SHA-256: `f3874f8f0eb1355d40433cbef95f0cff7bd9d1165822483985bd9529fbfcb51f`.
  The file imports Mathlib only. This checks elaboration of the admitted
  statements, not their proofs or the 39 comment-only names.
- Parsed preservation check: only `review` and `reviewHistory` differ in the
  packet. No standalone link map or restructuring result is under review.
- `git diff --check` and submission file-scope checks pass.

The source reads are fresh public downloads on 10 October 2026. Receipts
below identify the exact files and selected mathematical locators checked;
they do not claim full rereads of all source material in this 182-node packet.

| Public source | Fresh locators | SHA-256 |
| --- | --- | --- |
| [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Definition 0.1/Theorem 0.2 p.2; Theorem 1.6 pp.4–5; Definition 2.8 p.10; Theorem 2.10/evaluation p.11; Section 3 pp.12–13; B.18–B.22 pp.24–26 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10 p.124; §8.4 p.182; Lemma 8.5/Proposition 8.7 p.184; Lemma 8.8 p.185; §§9.2–9.4/Theorem 9.5 pp.187–188; Theorem 12.5 p.221 | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [Bertolini–Darmon–Prasanna, published version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | Introduction p.1040; §§1.4–1.5 pp.1053–1054; §2.2 p.1060; §3.2 p.1067; Conrad appendix opening pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

Kato's displayed twists, Euler coefficients, limit arrows, filtration
endpoint and interpolation order were also checked on rendered page images.
All source discussion here is in my own words. The earlier 108-baseline and
47-source-issue audits are inherited except for the explicitly named fresh
checks; this report does not replace them.
