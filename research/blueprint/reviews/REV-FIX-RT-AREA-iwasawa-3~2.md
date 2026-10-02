# Independent review: REV-FIX-RT-AREA-iwasawa-3~2

Refs #5139. Codex — codex-a71f92, 2 October 2026.

Verdict: **needs_changes** for `MotivesAndAlgebraicCycles.json`. The Tate-localization mathematics and the authorized owner handoffs are sound. A conditional inverse-evaluation signature is corrected below, but the period-point prototype still needs its advertised tensor-compatible comparison, and the reader is stale. Neither a successful structural checker nor this conditional lemma supplies those missing contracts.

## Scope and independence

I did none of FIX-RT-AREA-iwasawa-3~2. The claim was confirmed before work. Input main revision: `d95b25cd4d37c15c968f995672b7815bc8c36dac`.

Read all eight original findings, their independent verifier's refinements, the round-1 exact-edit ledger, the complete round-2 fix report, and issues #5138 and #5139. Reviewed all six supplier node records named by the fix, the corresponding suggested signatures/examples, and the reader's current status and fix supplement. The current packet has 182 nodes; the fix report's 173-node count describes its earlier input, before the separate geomlanglands additions. This is not a new independent review of those additions or of all inherited source issues.

The fix issue explicitly assigns /1 to BP-GeneralizedHeegnerCycles--GH.0, /2–/7 to BP-KatoEulerSystems, and the PS.2 application of /8 to BP-PeriodsAndSpecialValues--PS.0 and BP-PeriodsAndSpecialValues--PS.8. Those reports are handoffs, not applied repairs to other owners' blueprints or to the reviewed atlas base. The review issue allows only this report, the Motives packet and suggested file; its reader is not an authorized output.

## Finding-by-finding decisions

### /1 — CM product good models

**Accept the authorized handoff; not resolved in the GH owner here.** BDP §2.2 defines the product over a field defining the CM elliptic curve. Its appendix constructs the Kuga–Sato factor, not an integral model for an arbitrary CM factor. The technical §3.2 comparison assumes a finite unramified extension of Q_p and smooth proper models of C and X_r over its integers. The handoff keeps these assumptions and separately supplies a good model of A before forming the product.

The application condition p∤cNd_K for the chosen A does not certify arbitrary ramified CM twists. For example, the 13-twist of y²=x³−x over Q(i) remains CM but has bad reduction at 13; taking N=5 gives a prime away from N and d_K. For r≥1 the CM factor contributes H¹ to the product. The negative twist and positive product-model tests therefore discriminate the missing hypothesis. The round-1 edit list, including source/review and GH.1 consumer occurrences, remains the owner job's obligation. No blanket necessity claim about unramifiedness for every Bloch–Kato theorem is endorsed.

### /2 — Moment-map twist

**Accept the authorized handoff; not resolved in the Kato owner here.** Kato §8.4 gives T_pE=H_p(1). In the direction used by the composite, its symmetric power has twist k−2, not 2−k. Thus (2−r)+(k−2)=k−r. At k=2,r=1 both the old and correct expression give 1; at k=4,r=1 the correct twist is 3 and the reversed twist gives −1. The handoff demands both tests and corrects statement, hypothesis, proof and annotation copies, rather than relying on weight two.

### /3 — Euler factors and normalization

**Accept the authorized handoff, including the verifier's refinements; not resolved in the Kato owner here.** Printed Proposition 8.7 and Theorem 9.5 retain the linear factors ell^(−r) and p^(−r). Lemma 8.8(1) uses n^(r′−1), not n^(r−1). Combining its equivariance with Proposition 2.4 gives the linear exponent
−(r′−1)+(r′−1−r)=−r and quadratic exponent
1+(r′−1)+(k−r′−1)−2r=k−1−2r.

The handoff correctly includes the normalization repair, both nontrivial prime-divisibility cases, the trivial factor for p∣M, the printed third reciprocity case (p,N)=1, and the source/link/review copies. It does not silently redefine the Hecke operator.

### /4 — Dual-exponential target

**Accept the authorized handoff; not resolved in the Kato owner here.** Sections 9.2 and 9.4 use a filtration step: F⁰D_dR(V(i))=F^iD_dR(V). The filtration is the whole module for i≤0, the modular-form subspace for 1≤i≤k−1, and zero for i≥k. At k=4,i=2, F² is that nonzero subspace while gr²=F²/F³=0. The handoff therefore distinguishes filtration from associated graded and retains the exact upper endpoint, with interior and endpoint tests.

### /5 — Twisting before specialization

**Accept the authorized handoff; not resolved in the Kato owner here.** Theorem 12.5 first twists the Iwasawa class by the compatible roots to exponent k−r, then specializes and localizes before exp*. This is a cyclotomic-semilinear change of the Iwasawa action, not multiplication by a root at a fixed level after restriction. For k=2,r=1 the target is V_f(1) with its one-dimensional filtration target, rather than V_f(−1) with the whole two-dimensional target. The handoff preserves f*, the p-imprimitive value, rational gamma and the sign convention.

### /6 — Local duality and limit variance

**Accept the authorized handoff; not resolved in the Kato owner here.** Lemma 8.5's cokernel is the inertia-cohomology invariants
H⁰(Gal(K_v^ur/K_v),H¹(K_v^ur,T)). Local duality identifies it with the Pontryagin dual of residue-field H¹ with coefficients H⁰(K_v^ur,T^∨(1)). The argument factors through the dual of a direct limit under restriction, paired with corestriction on the original inverse system; the residue-field union has p-cohomological dimension zero.

For T=mu_p and v∤p, residue-field H¹ with Z/p coefficients is Z/p. Corestriction is the identity under the Frobenius identification, so the corresponding inverse limit need not vanish. Restriction across sufficiently late degree-p steps is multiplication by p, giving zero direct limit. This is the required regression against dropping the dual or reversing the limit. The theorem statement stays unchanged.

### /7 — Divisor pushforward

**Accept the authorized handoff; not resolved in the Kato owner here.** Section 1.10 uses divisor pushforward. Multiplication by a fixes the zero section and permutes E[c] when (a,c)=1, so [a]_*D=D for D=c²[0]−E[c], compatibly with div(N_a f)=[a]_*div(f).

For c=5,a=2, pullback instead gives 25E[2]−E[10]. A nonzero 2-torsion point has coefficient 24, versus zero in D. The handoff correctly rejects that divisor identity without incorrectly rejecting the separate fact that pullback on Pic⁰ also corresponds to multiplication by a.

### /8 — Effective versus localized formal periods

**Supplier localization accepted mathematically; deliverable still needs changes.** The six existing supplier nodes correctly retain:

- MC.5/diagram-localisation: the localized diagram, rank-one Lefschetz object and canonical coefficient localization under HMS B.18–B.22, with projectivity and multiplicative hypotheses.
- MC.5/nori-tensor-category: effective and localized Nori categories and the invertible Lefschetz object, subject to the inherited coboundary-product and universal-property gaps.
- MC.6/formal-periods: the single presentation P_eff=P⁺, Tate symbol L, canonical map to P=P_eff[L⁻¹], and explicit two-sided inverse.
- MC.6/formal-periods-equal-comparison-algebra: effective comparison first, on the appropriate good-pair diagram, then localization on both sides carrying L to chi. The inherited all-pair/good-pair qualification is not erased.
- MC.6/period-torsor: the full tensor-isomorphism torsor uses localized P and MM_Nori, not merely the effective algebra.
- MC.6/period-point: a unital multiplicative comparison compatible with all diagram edges gives the complex point. PS.2 owns identification with integration, normalization and extension of effective evaluation.

The rank-one Q[t] versus Q[t,t⁻¹] tests concern the prescribed invertible Tate coordinate; they do not compute the entire Nori Tate subcategory. Neither injectivity of evaluation nor a claim that 1/pi is not an effective numerical period follows.

The owning PS.2 jobs must import this one presentation and supplier category/torsor, descend effective integration through its relations, prove ev(L)=2πi≠0 and extend by localization. The round-2 report's forbidden-atlas-extract correction is a maintainer action, not an edit performed here. No duplicate category or period algebra is planned.

## Corrections and remaining action

1. The newly added `periodPoint_tate_inverse` and its example now take an explicit ring homomorphism `per : P →+* C` and the normalization `per(ofEff(L))=2πi`. Their packet API/test entries say the same. Applying a ring homomorphism to L·L⁻¹=1 proves the inverse formula without injectivity. The lemma does not manufacture `per`.
2. Shortened the formal-periods source excerpt to 109 characters, retaining the source's explicit localization sentence and its Definition 2.8 locator. The complete mathematical statement and three relation families are unchanged.
3. Replaced the top-level review with this independent needs_changes decision and archived the immediately preceding algebraicgeometry review verbatim. All previous review history is preserved. Added an explicit uncompiled review note to the suggested file.

The previous independent reviewer already exposed the underlying defect: `PeriodData` encodes only complex-linear comparison and pullback naturality, not unit, product or connecting-map compatibility. Scaling a genuine comparison by 2 satisfies its current comparison equations but sends the normalized unit period to 2 and gives product scaling 2 instead of 4. Consequently the old unconditional `periodPoint`, generator formula and `periodPoint.formal` signatures cannot be justified by arbitrary `PeriodData`. The new explicit-per lemma avoids using that defective constructor; it does not repair it. Encode and thread a genuine graded multiplicative comparison through those dependent APIs before accepting the artifact.

The reader still advertises 96 nodes and all eight layers as source_decomposed, while the current packet has 182 nodes and six partial layers. Its supplements retain historical counts and the earlier inverse signature. Reconcile the reader with the current packet, its open gaps and the explicit-per contract. This review cannot edit that file. Preserve the separately pending geomlanglands~2 review obligation; this report does not accept its new abstract reconstruction inventory.

## Evidence and validation

Public primary sources freshly downloaded and read on **2026-10-02**, selected passages only:

| Source | Extent read | PDF SHA-256 |
|---|---|---|
| [Huber–Mueller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | PDF pp.2,4–5,10–13,24–26: definitions, good-pair/effective comparison, torsor and localization statements/proofs | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | Printed pp.124,126,182–185,187–188,221, checked on rendered page images | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [Bertolini–Darmon–Prasanna, published Duke article](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | Printed pp.1040,1053–1054,1060,1067,1139–1140; the §3.2 assumptions also checked on the rendered page | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

No full fresh read of these papers or blanket re-verification of the 47 inherited sourceIssues is claimed.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, personally read the actual statements and surrounding hypotheses of all six new citations: `IsLocalization.Away.invSelf`, `mul_invSelf`, `lift` in Away/Basic; `IsLocalization.algEquivOfAlgEquiv` in Localization/Basic; `Polynomial.not_isUnit_X` in Degree/Operations; and `LaurentPolynomial.T_add` in Laurent. In particular the equivalence requires the submonoid image equation; for powers of L its image is powers of e(L). These are reused infrastructure, not six new general localization theorems.

Also read `TauCeti.Tannaka.fgPointTensorIsoEquiv` at `f790474821cf4256814db967cb154e7af3d0c369`: it starts with a known commutative Hopf algebra over a field and does not construct arbitrary Nori motives or the period comparison. Reviewed AUDIT-27/PS.2 and the full upstream HodgeStructures and ReductiveGroups roadmap documents. There is no reviewed MC.5/MC.6 coverage-register entry to invent.

Ran the actual repository `scripts/check_blueprint.py` logic, loading its source and world read-only at the audit revision, with the pinned declarations index: **0 errors, 0 warnings**; 182 nodes, 446 counted definition/construction API items, 252 unit tests, 47 planets, 108 baseline declarations, 23 gaps, 16 requests, eight stages in scope and none closed. No link-map or restructuring proposal is under review, so their checkers do not apply.

Parsed preservation checks confirm identical node IDs and prerequisites, with 180 full node records unchanged. Outside those two records, only review and reviewHistory change: coverage, gaps, requests, baseline, sources, sourceVersions, sourceIssues, fixes/fixHistory and planet names are preserved. The original packet blob matches `db02e576f8699088e0a1e49044b7b3dc3dc65d74`. The prerequisite graph is unchanged and the actual checker passes its cycle check. Read the inverse-test signatures against the packet; verified the localization and Laurent identities from the pinned statements. No live supplier edge, stage ID, generated data or foreign owner file is edited. The actual intake file checks pass for all three outputs, and whitespace checks pass. Before publication main advanced to `ec5b70b613220ccb218c57f0b36f12a9c922e226`; all three Motives input blobs were unchanged, the updated WORKERS priority order was read, and the checker/intake checks passed again against that revision.

New signatures were **not compiled**: no existing built project at both pins is available. No Lake setup, update, cache, build or language server was started. All implementationStatus values remain unchecked. This is a completed independent review with a needs_changes verdict, not a claim of proof closure or promotion.
