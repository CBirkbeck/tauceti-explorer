# FIX-RT-AREA-iwasawa-3~3

Refs #5868. Claude, session `claude-kEZwtq`, 7 October 2026. Input revision `d5d17b08ef42c3c39feec4777313896efda3dd8d`. The bot confirmed my claim (comment 6028157135).

This round makes the corrections that [REV-FIX-RT-AREA-iwasawa-3~2](../reviews/REV-FIX-RT-AREA-iwasawa-3~2.md) asked for in the finished MotivesAndAlgebraicCycles blueprint, and accounts for every confirmed finding. The [findings](RT-AREA-iwasawa-3.result.json), [verification](RT-AREA-iwasawa-3.review.json), [round-one report](RT-AREA-iwasawa-3.fixes.md) and [round-two report](RT-AREA-iwasawa-3.fixes-2.md) remain the record.

**Independence.** I did none of the following:

- the red team (`codex-hjdg0j`) or its verification (`cc-38267a`);
- fix round one (`cc-39fac3`) or round two (`codex-5ebb6f`);
- the round-two review (`codex-a71f92`), the algebraic-geometry area fix or its review (`codex-J6LwjP`);
- the geomlanglands~2 fix (`codex-rtOQ9t`);
- the MotivesAndAlgebraicCycles blueprint or its review.

**Changed:** the three Motives deliverables and this report.

- **Packet:** two nodes edited in place, one gap and its MC.6 remaining item removed as resolved, the C5 request, the summary and the fix record. No node, stage, planet, source or prerequisite was added or removed.
- **Suggested Lean file:** the comparison contract and the period-point section.
- **Reader:** regenerated from the current packet.

## The corrections the round-two review asked for

The review kept the packet at `needs_changes` for two reasons.

1. The suggested period point rested on `PairDiagram.PeriodData`, whose comparison family was only complex-linear and natural for pullbacks.
2. The reader described an older packet.

It also asked that the separate geomlanglands~2 obligation be preserved.

### 1. A typed comparison, threaded through the period point

**The defect.** The review's counterexample: double a genuine comparison. The family is still a family of linear isomorphisms and still natural for pullbacks. But the unit period becomes 2, and product periods no longer multiply. The old `periodPoint`, `periodPoint_gen` and `periodPoint.formal` nevertheless promised algebra maps.

**The new contract.** In the suggested file the comparison is no longer a field of `PeriodData`, which now holds only SF.2's data. It is the separate structure `PairDiagram.PeriodComparison dR`, the contract requested from ComplexComparisonPartII:C5:

- `toFun`: the comparison isomorphisms `φ_v : H^i_dR(X, Y) ⊗ ℂ ≅ H^i(X(ℂ), Y(ℂ); ℚ) ⊗ ℂ` for every effective pair;
- `natural`: naturality for maps of pairs (the old `comparison_natural`);
- `delta`: compatibility with the connecting maps of triples, so the family is an isomorphism of representations of `D^eff`, both kinds of edge included;
- `one`: the period of `(Spec ℚ, ∅, 1, [pt])` is 1;
- `mul`: the period of `(X × X', D × X' ∪ X × D', ω ∧ ω', γ × γ')` is the product of the periods.

`PeriodData` gains `dlog_ne_zero` and `circle_ne_zero`. These are facts about the supplier's classes: `dX/X` and `[S¹]` span the one-dimensional groups of `(𝔾_m, {1})`.

**Tying the multiplicative structures to the products.** `PairDiagram.ProductCompatible P M₁ M₂` makes the graded multiplicative structures of the good pairs those of the products:

- the product of good pairs is the product of pairs;
- `τ⁻¹(ω ⊗ ω') = ω ∧ ω'` in de Rham cohomology;
- `τ⁻¹(x ⊗ y)` takes the value `x(γ) y(γ')` on `γ × γ'`.

Before this round, `M₁` and `M₂` were arbitrary parameters, unrelated to the products that define the multiplication of `P⁺`. So the signatures could not say that a comparison is a tensor isomorphism for them. `formalPeriods_eq_comparison` (MC.6/formal-periods-equal-comparison-algebra) now takes this hypothesis as well. Without it the algebra isomorphism `P⁺ ≅ A_{1,2}` it asserts need not hold.

This implements the corrections of the packet's own findings E36 and E37:

- E36: HMS Section 3 takes `φ` to be a bare isomorphism, but the torsor statements need it to be compatible with the multiplicative structures.
- E37: the algebra structure is taken through the good pairs.

**What now takes the contract:**

- `PeriodComparison.toTensorIsoOver φ hM`: on good pairs, the comparison is a `Diagram.Rep.TensorIsoOver` for `M₁`, `M₂` over `ℂ`.
- `periodPoint φ hM`: now defined as `(TensorIsoScheme.represents M₁ M₂ ℂ).symm (φ.toTensorIsoOver hM)`, the complex point of `X_{1,2}` attached to that tensor isomorphism. Before, it had no body.
- `periodPoint_gen`: the value on `(p, ω, γ)` is the period `φ.period p ω γ`.
- `periodPoint_heap` and `periodPoint_action`: they take the same arguments.
- `periodPoint.formal φ`: on `P`, the period on generators.
  - It respects relations (2) and (3) by `PeriodComparison.period_pullback` and `period_boundary`, and the unit and product by `one` and `mul`.
  - It extends from `P⁺` to `P = P⁺[L⁻¹]` through `IsLocalization.Away.lift`, because `PeriodComparison.period_tate_ne_zero` holds.
- New statements:
  - `periodPoint.formal_gen`;
  - `periodPoint.formal_eq_periodPoint` (agreement with `periodPoint` on the generators of a good pair);
  - `periodPoint.formal_tateInverse` (`L⁻¹ ↦` the inverse of the period of `L`, with no normalisation).

**Unchanged from the review's corrected version.** `periodPoint_tate_inverse` keeps its explicitly supplied `per` and the normalisation `per(L) = 2πi`, which PS.2 owns. Its docstring now says that `periodPoint.formal Hs dR φ` is such a map once PS.2 normalises the period of `L`.

**Tests.**

- Rewritten for the typed comparison: `periodPoint_unit`, `periodPoint_mul`, `periodPoint_twist_not_rational`, `periodPoint_heap_test`.
- Two added:
  - `periodPoint.formal_tateInverse_test`: with the period of `L` equal to `2πi`, `L⁻¹ ↦ (2πi)⁻¹` and `L · L⁻¹ ↦ 1`.
  - `PeriodComparison.doubled_not_comparison`: no typed comparison is twice another. This is the review's counterexample turned into a non-example test; the old contract accepted it.

**Packet.** MC.6/period-point now says the same:

- **Statement:** the comparison is unital, and `L⁻¹` goes to the inverse of the nonzero period of `L`.
- **Hypotheses:** the unital graded multiplicative comparison compatible with both kinds of edge (finding E36), and the good-pair product structures (finding E37). Each names its typed form.
- **Proof steps:** the tensor isomorphism on good pairs, the complex point, the composite on `P⁺`, the nonvanishing of the period of `L` and the extension through the localisation.
- **Acceptance:** two items added, the doubling counterexample and the normalisation-free value on `L⁻¹`.
- **API:** the six existing items restated for the typed comparison, and five items added (`PairDiagram.PeriodComparison.toTensorIsoOver`, `periodPoint.formal_gen`, `periodPoint.formal_eq_periodPoint`, `periodPoint.formal_tateInverse`, `PairDiagram.PeriodComparison.period_tate_ne_zero`).
- **Tests:** the two added tests above.

MC.6/formal-periods-equal-comparison-algebra's third hypothesis now names the good-pair structures of the exterior and cross products.

The gap "The suggested period comparison does not yet encode its tensor compatibility" and its MC.6 remaining item are removed: the contract they asked for is now encoded and threaded through. The MC.6 coverage note says so. The remaining item that requests the comparison itself for arbitrary pairs from C5 stays, and so does the C5 request. Its need now says "unital" and names the typed contract.

**Source check.** I fetched HMS, [arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5), on 7 October 2026; its SHA-256 `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` is the packet's. I read:

- **Printed p.5**, proof of Theorem 1.6: the multiplicative structure of `H^*` depends on a choice of sign convention for the boundary map. `ProductCompatible` is satisfiable when the supplier's cross and exterior products follow that convention. It is the convention under which the relation `mul_gen` of `P⁺` holds without a sign.
- **Printed p.11:** the evaluation `ev : P → ℂ` is a ring homomorphism sending `(𝔾_m, {1}, dX/X, S¹)` to `2πi`. Its construction by integration stays with PS.2.
- **Printed p.12**, Section 3: the setting, Lemmas 3.1–3.2 and Theorem 3.3. `φ` is given only as an isomorphism `T₁ ⊗ K → T₂ ⊗ K`, which is what E36 corrects.

No new sourceIssue is recorded.

### 2. The reader

The previous reader described the 96-node first pass, with supplements appended by subsequent rounds. A scripted comparison found that 4,079 of the packet's 7,745 text strings were missing from it. These include node statements, hypotheses, acceptance items, API rows, tests, gaps, requests, source issues and coverage notes.

This round regenerates the reader from the current packet in the original blueprint's format, so that it agrees with the packet as PROTOCOL section 8 requires:

- all 182 nodes, under their layers, with every field;
- coverage with each layer's `remaining` list;
- all 22 gaps, 16 requests with the nodes that need them, 47 source issues with their review verdicts, the three structural proposals, 14 source versions and 108 pinned declarations;
- the current review and its history, and the fix record.

The hand-written introductions to MC.0–MC.5 and MC.7 are kept. Each is preceded by the packet's current coverage statement, not the old "source_decomposed" claims, and two sentences of the MC.4 introduction that referred to the first pass's remaining list are reworded.

MC.6 had no such introduction. It gets three short paragraphs, describing:

- the layer, from its nodes;
- the typed-comparison requirement;
- the abstract reconstruction nodes and the proposed split.

The same verbatim check now finds all 7,745 strings in the reader. The reader states the packet's real status: partial, MC.1 and MC.3 `source_decomposed`, the other six layers partial.

### 3. The geomlanglands~2 obligation

The nine abstract reconstruction nodes of FIX-RT-AREA-geomlanglands~2, their gap, the proposed `MC.6:abstract` split and the packet's `review` and `reviewHistory` are unchanged. The `review` object is still REV-FIX-RT-AREA-iwasawa-3~2's `needs_changes` record, for REV-FIX-RT-AREA-iwasawa-3~3 to replace. The packet's previous `fixes` record (FIX-RT-AREA-iwasawa-3~2) moved to `fixHistory` verbatim.

The suggested file still lists 39 API and test names of those nine nodes in comments as "not stated in Lean yet". They are the only packet names absent from the file, both before and after this round. That inventory awaits REV-FIX-RT-AREA-geomlanglands~2 (#5161), and I did not change it.

## Disposition of each confirmed finding

| Finding | This round |
|---|---|
| /1 CM product model | Handed to BP-GeneralizedHeegnerCycles--GH.0 (pending), as the issue requires; no packet written here. The partial GH.0 packet (13 nodes, no review) already states the p-adic Abel–Jacobi map over a finite unramified F with smooth proper models of C and X_r. Its hypothesis still writes good reduction with p∤cNd_K in parentheses. So the owner job must still separate the application condition from good reduction, construct the product model after base change and add the negative CM-twist and positive product-model tests, as round two specified. |
| /2–/7 Kato | Handed to BP-KatoEulerSystems, as the issue requires. That job is done: KatoEulerSystems.json is `complete`, under `needs_changes` from REV-KatoEulerSystems. Its nodes already carry each correction (next table). Its review, not this round, certifies them. |
| /8 Tate localization | The finished-supplier part was applied in round two. This round makes the two corrections REV-FIX-RT-AREA-iwasawa-3~2 asked for (above). The PS.2 integration/evaluation application stays handed to BP-PeriodsAndSpecialValues--PS.0 and --PS.8 (both pending). |

How KatoEulerSystems.json carries /2–/7:

| Finding | Node | What it says now |
|---|---|---|
| /2 | `L1/etale-chern-moment-map-into-modular-local-system` | `Sym^{k-2}(T_pE) = Sym^{k-2}(H_p)(k-2)`, with the `2−r+(k−2)` check. |
| /3 | `L2/p-adic-zeta-elements-and-their-norm-relations` and `L3/generalised-explicit-reciprocity-law-for-zeta-elements` | The linear terms carry `ell^(−r)` and `p^(−r)`, with the quadratic exponent `k−1−2r` and the trivial factor when `p` divides `M`. |
| /4 | `L3/dual-exponential-map-on-the-modular-local-system` | Filtration steps `F^i`, `F^iD = 0` for `i ≥ k`. |
| /5 | `L3/zeta-class-interpolation-of-complex-L-values` | Twist by `k−r` first, then specialise. |
| /6 | `L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology` | The Pontryagin dual and the direct limit under restriction. |
| /7 | `L0/theta-function-c-normalised` | Divisor pushforward, and the `c=5, a=2` pullback non-example. |

**For the maintainer (/8).** `research/blueprint/atlas/roadmaps/PeriodsAndSpecialValues.json` is outside the swarm's output paths. It still needs the exact correction given in the round-two report:

- PS.2 names `P_eff`, `L = (G_m, {1}, dX/X, S¹)` and `P = P_eff[L⁻¹]`;
- `ev : P → ℂ` is the extension of effective integration with `ev(L) = 2πi ≠ 0`;
- the localized `P` is compared with the full Nori torsor;
- the acceptance tests `L·L⁻¹ = 1`, the evaluation of `L⁻¹`, and the rank-one model `ℚ[t] → ℚ[t, t⁻¹]`.

One addition from this round: PS.2's identification of integration with the MC.6 period point should consume the typed comparison (`periodPoint.formal` takes a `PeriodComparison`), not a bare family of linear isomorphisms.

**Overlap.** Two open jobs have these same files among their deliverables:

- **FIX-RT-AREA-algebraicgeometry~2 (#5701, available).** Its input review, REV-FIX-RT-AREA-algebraicgeometry, asked for the same two Motives corrections: the typed comparison and the reader. This round makes both, so that job should check them rather than redo them.
- **REV-FIX-RT-AREA-geomlanglands~2 (#5161, available).** It writes the same packet's `review` object.

## Checks

- **`scripts/check_blueprint.py`** with the pinned declaration index reports 0 errors and 0 warnings: 182 nodes, 451 counted API items, 254 counted unit tests, 47 planets, 108 baseline declarations, 22 gaps, 16 requests, 8 stages in scope, none closed.
- **Preservation**, parsed comparison with the input packet:
  - node ids and order identical, every node's prerequisites identical;
  - only MC.6/period-point and MC.6/formal-periods-equal-comparison-algebra changed among the nodes;
  - among top-level fields, only `summary`, `nodes`, `coverage` (MC.6), `gaps` (one removed), `requests` (C5), `fixes` and `fixHistory` changed;
  - `review`, `reviewHistory`, sources, source versions, source issues, baseline, planets and restructure are identical.
- **Lean.** The whole suggested file was elaborated with `lake env lean` (through `lean-check`) at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, before and after the change. Both runs give only "declaration uses `sorry`" warnings, with no errors or other messages; the new file took 42 seconds. It imports Mathlib only, so Tau Ceti was not needed. No language server, `lake build`, `lake update` or cache fetch was started.
- **Name coverage.** A namespace-aware scan finds every API item and unit test of the packet in the suggested file, except the 39 geomlanglands~2 names above, the same set as before this round.
- **Reader.** All 7,745 packet strings appear verbatim (4,079 were missing before). No code fence, local path or `sorry` token.
- **Intake.** `research/blueprint/intake.py check-files` on the four changed files reports no problems, and `git diff --check` is clean.

`implementationStatus` stays `unchecked` throughout. This round accepts nothing itself: REV-FIX-RT-AREA-iwasawa-3~3 reviews it.
