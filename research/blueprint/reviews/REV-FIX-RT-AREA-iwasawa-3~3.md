# Independent review of the third Iwasawa fix round

Refs #5869. Codex (GPT-6), session `codex-BIjxwP`, 11 October 2026.
Input revision `df91fe32260d17ef3558ec5fd610ca2a56f047cb`;
branch `codex-BIjxwP-review-5869`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5869#issuecomment-6108456249)
was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/5869#issuecomment-6108457119).
This worker did none of the fixes being reviewed.

The bounded Motives review is finished with `needs_changes`: effective
comparison and evaluation are distinguished correctly from the full torsor,
but the full localized Nori adapter is still missing. One remaining
hypothesis error was corrected in this review. This submission is a
**checkpoint because the live issue excludes four paths required by intake**.
A negative mathematical verdict itself is a completed review outcome.

The original eight findings, their verification and the third-round fix
report were read. All three owner packets and the relevant proposed Lean
signatures were inspected; only the live issue's Motives packet was edited.
This is a review of the assigned corrections, not an exhaustive new audit of
all 182 Motives nodes or either arithmetic roadmap.

## Findings

| Finding | Verdict | Source check and discriminating evidence |
|---|---|---|
| /1 CM product model | Factor-model correction present; consumer hypothesis still conflates assumptions | GH.0/cm-product-good-model requires supplied smooth proper models of both factors. Its attribution to Conrad is limited to the universal-family Kuga–Sato factor. The positive product-model and negative ramified-CM-twist tests retain this distinction. GH.1/p-adic-abel-jacobi-map still places `p∤cNd_K` parenthetically after good reduction. BDP §3.2, pp.1067–1068 separately assumes a finite unramified F/Q_p and smooth proper models of C and X_r over O_F; its selected-CM application must be distinguished from that general assumption. Conrad's appendix, pp.1139–1140 addresses compactifications of universal generalized-elliptic-curve fibre powers, not an arbitrary CM factor. |
| /2 Moment twist | Corrected | Kato §8.4, (8.4.1)–(8.4.3), pp.182–183 uses T_pE=H_p(1). The packet's moment node therefore adds k−2 to the Chern/root twist 2−r and lands in twist k−r. At k=4,r=1 the result is 3; reversing the identification would give −1. |
| /3 Euler factors | Displayed norm factors corrected; upstream Hecke normalization still wrong | The norm and reciprocity nodes carry linear coefficients ℓ^(−r) and p^(−r), quadratic exponent k−1−2r, and the trivial p-factor in the p-divides-M case. These agree with Kato Proposition 8.7, p.184 and Theorem 9.5, p.188. But L1/hecke-and-diamond-equivariance-of-the-moment-map's statement and acceptance item 0 still say n^(r−1). Lemma 8.8(1), p.185 has n^(r′−1), checked directly on the page image. Combining inverse Hecke with the first-diamond scalar gives ℓ^(1−r′)ℓ^(r′−1−r)=ℓ^(−r). For r=1,r′=2,ℓ=2 this is 1/2; the current wrong Hecke exponent gives 1. The generic scalar argument of `chernHeckeDiamond` does not encode the source normalization. |
| /4 Filtration target | Corrected | The dual-exponential node uses filtration steps F^i, not their associated graded pieces. Kato (9.2.2), p.187 gives the entire de Rham module at i≤0, the modular-form subspace for 1≤i≤k−1, and zero for i≥k. At weight four the interior steps coincide while their interior successive quotients vanish. This distinguishes the two targets. |
| /5 Interpolation twist | Corrected | The interpolation node twists Iwasawa cohomology by k−r before specialization/localization and exp*. Its semilinear action convention has the inverse cyclotomic factor κ(σ)^(−j); it retains the dual form f*, p-imprimitive L-value and stated sign. Kato Theorem 12.5(1), p.221 explicitly places the twist before the finite-level map. At k=2,r=1 the required twist is +1. |
| /6 Local-duality limit | Corrected | The proof retains H⁰ of residue-field Galois acting on inertia H¹, its identification by local duality with the Pontryagin dual of residue-field H¹, and then the dual of a direct limit under restriction. Kato Lemma 8.5, pp.183–184 uses this sequence. Original corestriction becomes restriction after duality; an undualized inverse-limit vanishing is not asserted. |
| /7 Theta divisor | Corrected | The normalized theta node uses divisor pushforward for the isogeny norm, as Kato §1.10, p.124 requires. For c=5,a=2, pullback of the divisor has coefficient 24 at a nonzero 2-torsion point, where the original coefficient is zero. Pushforward instead fixes the 5-torsion divisor because multiplication by two permutes its support. |
| /8 Formal-period localization | Effective contracts corrected; hypothesis repaired here; full torsor adapter absent | Effective periods, the Tate symbol L, P=P_eff[L⁻¹], its inverse and evaluation extension through a nonzero Tate period are explicit. Both diagram-edge laws, the unit and product pairing laws, rank-one nonvanishing and shared Künneth signs appear in the proposed signatures. The all-pairs comparison must first be restricted to good pairs before being called a graded multiplicative representation; hypothesis 0 now says so. HMS Definition 2.8, p.10 and Theorem 2.10, p.11 support the effective comparison. Lemma 3.2, p.12 requires neutral Tannakian fibre functors; Theorem 1.14, p.8 supplies rigidity for the full Nori category. The prototype does not yet connect the localized effective algebra to the full comparison algebra and its extended fibre functors, heap and actions. |

## Correction and remaining mathematical gap

MC.6/period-point hypothesis 0 previously called comparison on the diagram of
all pairs an isomorphism of unital graded multiplicative representations.
HMS Definition 1.1, p.4 distinguishes all pairs from good pairs; Theorem 1.6
and its proof, pp.4–5 place the multiplicative tensor construction on the
good-pair diagram. Definition B.14, pp.20–21 requires a single-degree
Künneth isomorphism, a stronger condition than compatible product pairings
on arbitrary pairs.

The hypothesis now describes natural comparison on all effective pairs,
including connecting maps, unit and product pairings. It asserts graded
multiplicativity after restriction to good pairs with the supplied
`PairDiagram.ProductCompatible` structures. Added those exact source
locators. This matches `PairDiagram.PeriodComparison` and
`PeriodComparison.toTensorIsoOver`; their typed signatures need no change.
The earlier direct localization, rigidity and fibre-functor prerequisites
are preserved. Existing tests for a doubled comparison, common signs and
Tate-inverse identities still apply.

`FormalPeriods.localizeComparison` produces an equivalence to
`Localization.Away (e(L))` for an effective algebra equivalence e. It does
not identify that target with the comparison algebra of the full localized
Nori diagram. `periodPoint_heap` and `periodPoint_action` still take a
separately supplied effective `Diagram.Rep.TannakianPair`. Those conditional
signatures do not establish that the effective Nori category is rigid.
HMS Lemma B.21/Proposition B.22, pp.25–26 and Theorem 1.14, p.8 are the
localization and full-neutrality inputs needed for the intended application;
Theorem 3.3/Corollary 3.4, p.13 then supply its torsor and heap interpretation.

The packet already records the missing full localized comparison and
period-point adapter as a gap. Retain `needs_changes` until that actual
adapter is typed; no additional effective-rigidity assumption repairs it.
The separate relative Beck and abstract reconstruction gaps are also
preserved. PS.2 owns integration, its 2πi normalization and the comparison
with this supplier evaluation. No PS.2 construction is duplicated here.

The preceding codex-R4MNK8 review object is archived exactly at the end of
`reviewHistory`, preserving all older entries. Its full report remains
available at the
[input revision](https://github.com/CBirkbeck/tauceti-explorer/blob/df91fe32260d17ef3558ec5fd610ca2a56f047cb/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-3~3.md).
Among mathematical node fields, only period-point hypothesis 0 and one added
source annotation changed. Coverage, status, gaps, requests, API, tests,
implementation statuses, baseline data and every other node are unchanged.
No suggested file or arithmetic owner packet was edited. Synchronizing the
reader's matching hypothesis requires separately allowed reader-file scope.

## Pinned libraries and current upstream

The reviewed PS.2 library-audit entry does not claim the formal-period
presentation, Nori torsor or evaluation as existing library results. MC.5
and MC.6 supply those contracts; PS.2 imports them for its application.

The actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` were read: `Away.invSelf`,
`Away.mul_invSelf`, `Away.lift`, `Away.liftAlgHom` and
`IsLocalization.algEquivOfAlgEquiv`. The lift needs a unit image for the
inverted element; transport of an algebra equivalence also needs compatible
localization submonoids and algebra towers. These existing APIs should be
used, but supply no Nori comparison-algebra identification themselves.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, the
[Tannaka equivalence](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean)
`fgPointTensorIsoEquiv` starts with a known commutative Hopf algebra and
identifies its algebra points with tensor automorphisms of a scalar-extension
functor on finitely generated comodules. It does not construct the full
Nori fibre functors or the missing adapter.

Current upstream was inspected read-only at roadmap revision
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec` and Tau Ceti library revision
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The relevant ReductiveGroups
known-Hopf/comodule scope and Completed/HodgeStructures Tate conventions do
not discharge the Nori application. Existing results are cited rather than
replanned. No upstream file was changed or built.

## Public sources and fresh checks

These public sources were read on 11 October 2026. The contents needed for
this bounded review were read directly, including the new good-pair source
locators. No protected book was needed, and no source excerpt was added.

| Source version | Locators checked | PDF SHA-256 |
|---|---|---|
| [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Definition 0.1/Theorem 0.2, p.2; Definition 1.1/Theorem 1.6, pp.4–5; Theorem 1.14, p.8; Definition 2.8/Theorem 2.10, pp.10–11; Lemmas 3.1–3.2, p.12; Theorem 3.3/Corollary 3.4, p.13; Definition B.14, pp.20–21; Lemma B.21/Proposition B.22, pp.25–26 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10, p.124; §8.4, pp.182–183; Lemma 8.5/Proposition 8.7/Lemma 8.8, pp.183–185; §§9.2–9.4/Theorem 9.5, pp.187–188; Theorem 12.5(1), p.221. Printed pp.184,185,187,221 also checked as page images. | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [BDP, published Duke version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | §3.2, pp.1067–1068; Conrad appendix, pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

Fresh `scripts/check_blueprint.py` runs on Motives, Kato and GH.0 report zero
errors and warnings. Motives retains 182 nodes, 463 API items, 261 tests,
47 planets, 113 baseline declarations, 24 gaps and 16 requests. The final
prose correction is checked again on the changed packet. There are no link
maps or restructuring proposals in this job's live outputs.

A fresh full `lean-check` of the unchanged Motives suggested file exited 0,
with 817 warnings, all `declaration uses sorry`, and no errors or other
warnings. It ran sequentially at the pinned Mathlib after a memory check.
Kato and GH.0 were not freshly elaborated in this session; their earlier
receipts are in the preceding report. Elaborating admitted statements does
not prove the geometric constructions or resolve the missing adapter. No
new test was needed for a prose correction that matches existing signatures.
No language server or library build/update/cache command was started.

Parsed preservation, whitespace and intake-file checks pass. Suggested-file
and arithmetic-packet hashes are recorded in the handoff so that a scope
resolution can resume from unchanged owners.

## Dispatch blocker

The bot-confirmed live issue names this report and the Motives
packet/suggested pair. WORKERS.md says to edit only files the issue names.
The queue additionally requires the GH.0 and Kato packet/suggested pairs.
The stock `issues.py:deliverables_complete` predicate accepts a finished
negative verdict but requires this review's genuine marker in every packet
listed in those outputs.

The predicate remains false with the actual seven queue outputs, and is true
when tested in memory against just the three live-issue outputs. All seven
files exist. The arithmetic owner markers remain their previous independent
blueprint reviews; they were not changed to manufacture completion.

A scope extension for the four queue-listed arithmetic paths was requested
while the permitted review continued. No extension has been received. This
checkpoint records the concrete Motives correction and completed bounded
verdict. Before another continuation, authorize those four paths or align
dispatch with the live Motives-only issue. The handoff identifies the exact
Hecke-normalization and good-model corrections to make once authorized.
