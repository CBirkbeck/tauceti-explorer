# Independent review of the third Iwasawa fix round

Refs #5869. Codex (GPT-6), session `codex-R4MNK8`, 11 October 2026.
Input commit `0311207a4c7eb718bd7adaac0013c0c4a832e5a1`;
branch `codex-R4MNK8-review-5869`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5869#issuecomment-6108084687)
was confirmed by the bot for this session. This worker did none of
FIX-RT-AREA-iwasawa-3~3.

The bounded mathematical review is finished. The Motives verdict remains
`needs_changes`: the effective evaluation and Tate localization contracts
are sound, but the suggested file still lacks the adapter to the full Nori
comparison algebra and its torsor structures. This submission is a
**checkpoint because the live issue and queue disagree about editable files**,
not because a negative verdict cannot finish a review.

## Findings and verdicts

These verdicts concern the eight confirmed findings and their fixes, not a
new exhaustive audit of the 182-node Motives packet. The original findings,
verification and third-round fix report were read alongside the current
packets and suggested signatures.

| Finding | Verdict on the current correction | Evidence and remaining work |
|---|---|---|
| /1 CM product model | Product correction present; consumer hypothesis still needs separation | GH.0/cm-product-good-model requires both factor models and attributes only the Kuga–Sato factor to Conrad. Its positive good-model and negative ramified-CM-twist tests distinguish the contracts. GH.1/p-adic-abel-jacobi-map nevertheless retains `p∤cNd_K` in parentheses after good reduction. BDP §3.2, pp.1067–1068 separately assumes finite unramified F/Q_p and smooth proper models of C and X_m over O_F. The conductor criterion belongs to the selected CM application. Conrad's appendix, pp.1139–1140 constructs the universal elliptic-curve fibre-power compactification, not an arbitrary CM-product model. |
| /2 Kato moment twist | Corrected | L1/etale-chern-moment-map-into-modular-local-system has Sym^(k−2)(T_pE) = Sym^(k−2)(H_p)(k−2), so the composite twist is 2−r+(k−2)=k−r. Kato §8.4, equations (8.4.1)–(8.4.3), pp.182–183. Weight four/r=1 gives 3; the reversed convention gives −1. |
| /3 Euler factors | Displayed factors corrected; supplier normalization still wrong | L2 norm relations and L3 reciprocity retain the linear factors ℓ^(−r) and p^(−r), quadratic exponent k−1−2r, and identity when p divides M. Kato Proposition 8.7, p.184 and Theorem 9.5, p.188 agree. However L1/hecke-and-diamond-equivariance-of-the-moment-map's statement and acceptance item 0 still use n^(r−1); Lemma 8.8(1), p.185 uses n^(r′−1). With r=1,r′=2,ℓ=2, the inverse Hecke and first-diamond contributions give 1/2; the wrong exponent gives 1. The generic scalar in `chernHeckeDiamond` does not distinguish them. Correct the two packet occurrences and add a source-normalized proposed signature/regression when the owner paths are authorized. |
| /4 Filtration target | Corrected | The dual-exponential node uses F^i, with vanishing at i≥k. Kato (9.2.2), p.187 and §9.4, p.188 identify filtration steps, not associated graded pieces. For k=4, F¹=F²=F³ can equal the nonzero modular-form space while gr¹ and gr² vanish. |
| /5 Interpolation twist | Corrected | The interpolation node first twists Iwasawa cohomology by k−r, then specializes and localizes before exp*. Its action convention retains κ(σ)^(−j), the dual form f*, the p-imprimitive value and the stated sign. Kato Theorem 12.5(1), p.221. For k=2,r=1 the required target twist is +1. |
| /6 Local-duality limit | Corrected | The integrality proof retains inertia-cohomology invariants, local duality, and the dual of the direct limit of residue-field H¹ under restriction. Corestriction in the original inverse system corresponds to restriction after duality. Kato Lemma 8.5, proof, pp.183–184. There is no asserted vanishing of an undualized inverse limit. |
| /7 Theta divisor | Corrected | L0/theta-function-c-normalised uses divisor pushforward and its compatibility with the isogeny norm. Kato §1.10, p.124. For c=5,a=2 the pullback has coefficient 24 at a nonzero 2-torsion point, whereas the original divisor has coefficient zero there; its pushforward is fixed. |
| /8 Formal-period localization | Effective contract corrected; full torsor adapter missing | P_eff, the Tate symbol L, P=P_eff[L⁻¹], inverse identities and extension of evaluation through a nonzero Tate period are explicit. The typed comparison includes both edge laws, unit and product laws; ProductCompatible ties the two inverse Künneth maps to the geometric products with matching signs. HMS Definition 2.8, p.10, Theorem 2.10 and evaluation, p.11 support these contracts. HMS Lemma 3.2, p.12 requires a neutral Tannakian category; Theorem 1.14, p.8 supplies this for full Nori motives. `localizeComparison` only reaches a localization of the effective comparison algebra. The identification with the full comparison algebra, the localized fibre functors, and transported heap/actions are not typed. Conditional effective statements do not supply that application. |

## Correction made in this review

MC.6/period-point's corrected proof sketch already uses three results without
listing them as direct prerequisites. Added MC.5/diagram-localisation,
MC.5/nori-rigidity and MC.6/fibre-functor-extension, with HMS Lemma B.21 and
Proposition B.22, pp.25–26 and Theorem 1.14, p.8 locators. The added source
annotation describes their distinct roles in the worker's own words.

The previous codex-EozIdh review is archived unchanged in `reviewHistory`.
Only period-point's prerequisites and one added source locator change among
mathematical node fields; every other node and all statements, proof steps,
API/tests, coverage, gaps, requests, baseline, implementation statuses and
older histories are preserved. The preceding report is available at the
[input revision](https://github.com/CBirkbeck/tauceti-explorer/blob/0311207a4c7eb718bd7adaac0013c0c4a832e5a1/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-3~3.md).
No Lean file or arithmetic owner packet was edited.

Preserve the existing full-localized-adapter gap, the separate relative Beck
adapter and abstract reconstruction obligations. This review neither accepts
those obligations nor treats elaboration of admitted signatures as their
implementation. PS.2 continues to own integration, the 2πi normalization and
its comparison with the supplier period point. Reader synchronization is
outside this issue's live deliverables.

## Baseline and existing upstream work

The reviewed PS.2 library audit records the presentation, Nori torsor and
evaluation as absent; MC.5–MC.6 remain the shared category/torsor supplier.
The baseline declarations relevant to this correction were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`: Away.invSelf,
Away.mul_invSelf, Away.lift/liftAlgHom and
IsLocalization.algEquivOfAlgEquiv. A localization lift requires the image of
the inverted element to be a unit; transporting an algebra equivalence
requires the corresponding localization submonoids and algebra towers.
These APIs do not identify the full Nori comparison algebra by themselves.

The actual
[Tau Ceti Tannaka equivalence at f790474](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean)
was read: `fgPointTensorIsoEquiv` assumes a known commutative Hopf algebra and
identifies its algebra points with tensor automorphisms of the scalar-extension
functor on finite generated comodules. It does not construct a full Nori
fibre functor or the missing comparison adapter.

Current upstream was inspected read-only at roadmap commit
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec` and library commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including ReductiveGroups' known-Hopf
representation/comodule scope and Completed/HodgeStructures' Tate conventions.
No existing upstream target is replanned and no upstream file was changed.

## Public sources and fresh validation

Sources were read on 11 October 2026. No protected book was needed and no
source passage is included in this submission.

| Public version | Locators checked | SHA-256 of PDF |
|---|---|---|
| [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Definition 0.1/Theorem 0.2, p.2; Theorem 1.14, p.8; Definition 2.8/Theorem 2.10, pp.10–11; Lemmas 3.1–3.2, p.12; Theorem 3.3/Corollary 3.4, p.13; Lemma B.21/Proposition B.22, pp.25–26 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10, p.124; §8.4, pp.182–183; Lemma 8.5/Proposition 8.7/Lemma 8.8, pp.183–185; §§9.2–9.4/Theorem 9.5, pp.187–188; Theorem 12.5(1), p.221. Printed pp.124,184–185,187–188,221 also inspected as page images. | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [BDP, published Duke version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | §3.2, pp.1067–1068, p.1067 also inspected as a page image; Conrad appendix, pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

All three packets pass `scripts/check_blueprint.py` with zero errors and
warnings. Final Motives counts: 182 nodes, 463 API items, 261 tests, 47 planets,
113 baseline declarations, 24 gaps and 16 requests; no source-excerpt field.
There are no link maps or restructuring proposals among the live outputs.

Fresh full `lean-check` runs exit 0: Motives 817 warnings, Kato 135 and GH.0
242, every warning an admitted-proof warning. Ten fresh proved scratch
examples elaborate without diagnostics. They discriminate the weight-four
moment orientation, r′ versus r Hecke exponent, inverse-Hecke/diamond
cancellation, central diamond versus Hecke scalar, theta pullback coefficient
and doubled comparison's unit/product failures. These numerical tests do not
certify the geometric constructions. Existing proved Motives sign and
localization models were included in the full-file check.

Lean checks ran sequentially through the shared pinned-Mathlib wrapper after
checking memory. No language server or library build/update/cache command was
started. Parsed preservation, whitespace and submission-file checks pass.

## Dispatch blocker and resumption

The live issue names this report and the Motives packet/suggested pair only.
WORKERS.md requires editing only the issue's named files. The queue additionally
lists the Kato and GH.0 packet/suggested pairs. Its
`issues.py:deliverables_complete` requires this review's genuine marker in all
three packets, including a finished negative verdict. It still returns false:
the two owner packets retain their independent blueprint-review markers.

An explicit scope clarification was requested while the permitted work
continued. No scope extension has been received. No omitted path or queue entry
was edited. Before dispatching another continuation, authorize the four owner
paths or align the queue with the live Motives-only review. The handoff gives
the exact owner corrections and receipts. Once scope is resolved, record
bounded owner verdicts after the corrections and rerun completion; do not
change markers merely to satisfy dispatch. A future revision should supply
the full Motives adapter before that packet is accepted.
