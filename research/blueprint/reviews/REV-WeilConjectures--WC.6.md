# Independent review: Weil conjectures, WC.6–WC.7

Job `REV-WeilConjectures--WC.6`, issue #504. Reviewer: Codex (GPT-6), session `codex-yMO78A`, 6 October 2026. This session did not write the input planning pass.

**Verdict: accepted as a completed target-level planning pass.** Every node is mathematically justified with its stated imports, requests and gaps. There is no unresolved contradiction. This accepts the plan, not a formalization or closure of its suppliers. The packet remains `complete`; WC.6 and WC.7 remain `planned`, neither `closed`. PROTOCOL section 0 permits those coverage states with precise remaining work.

The machine-readable review contains a separate assessment of every node: **16 verified, four corrected, zero added, zero unverifiable**. All seven source-issue records have an independent `confirmed` verdict scoped to the versions actually read.

## Counts and scope

| Item | Reviewed result |
| --- | --- |
| Nodes | 20: 14 theorems, two comparisons, four applications |
| New definitions/constructions | Zero; all geometric objects come from their owners |
| Definition API items / definition unit tests | Zero / zero; no newly owned definition to test |
| Theorem/application acceptance assertions | 64 |
| Suggested Lean examples | 18; all elaborate, with only `sorry` warnings |
| Baseline declarations | Nine, all retained and independently confirmed |
| Explicit imports / stage requests / recorded gaps | Four / 15 / four |
| Public sources | 11, including one added immutable upstream receipt |
| Planets | 11: five in WC.6, six in WC.7 |
| Scope and coverage | Both in-scope stages planned, zero closed |

Accepted RS-17 explicitly retains WC.7's zeta-facing comparisons. Its process classification does not remove those mathematical targets. PR196 owns generic trace/cohomology/example constructions; DWP owns weight theory and the nonprojective/Jordan/Tate realizations; RD.7 owns rigid/crystalline/Frobenius comparison. The packet consumes them and does not duplicate them. The reviewed library audit was checked for both WC stages. No baseline construction is newly planned here.

## Corrections made in place

1. **Surface hypothesis.** In `WC.7/rational-surface-picard-count-criterion`, made “surface (dimension two)” explicit in the leading hypothesis. The previous title and final qualification already intended rational surfaces, and the reader correctly says surface. The primary statement now says so without requiring that inference. Higher-dimensional projective space demonstrates why the dimension matters to the count formula.
2. **Artin–Schreier supplier.** The FA.3 request previously attributed the reduced local Artin–Schreier invariant to AlgebraicCurves Layer 7. The merged upstream roadmap puts that calculus in **Layer 10**, while Layer 7 supplies the different and Hurwitz formula. Corrected the request to name both. Added the immutable AlgebraicCurves source and a citation on the genus-two node, including Layer 12's actual model/places/genus comparison. The suggested file's existing genus-two example now documents this route. No upstream file was edited.
3. **Künneth locator.** The product node's PR196 citation now includes Layer 11's general products/Künneth compatibility, alongside the Layer 12 compact-support calculation and Layer 13 determinant formula. The old affine-space test alone was a less precise locator for general smooth proper products. The statement and prerequisites were already correct.
4. **Coarse comparison locator.** Tightened vdBE v3 Lemma 3.2 to printed p.5, with the characteristic-zero qualification. The finite-field stack gap was already explicit and remains necessary.
5. **Independent evidence and versions.** Added fresh read receipts for the ten existing public sources, the new immutable upstream receipt, per-node review records and all seven source-issue verdicts. Updated the current Cambridge PDF hash and retained its historical hash in `sourceVersions`; see below. No mathematical node or baseline citation was removed. No node was added.

The reader document was read but is outside this review issue's edit paths. Its rational-surface statement already agrees with correction 1, and its FA.3/AlgebraicCurves Layer 12 model contract remains compatible with correction 2. No reader contradiction requiring a separate edit was found.

## Mathematical checks

**Weights and integral factors.** Read Weil II 3.3.2–3.3.11, including the rendered valuation diagram on printed p.206, and Weil I's proof that 1.7 implies 1.6. Smooth proper purity needs no projectivity, connectedness or semisimplicity. The current integrated WC.3 node is projective-only, so the packet correctly requests the reusable algebraic extraction instead of pretending that node already supplies the general theorem. Root multiplicities, normalization at zero and empty degree factors are preserved.

The mixed theorem concerns the reduced divisor of the L-function. Compact-support degree bounds give integer weights at most `n+2d` on surviving reciprocal roots; canceled roots disappear from that divisor. All-conjugates algebraicity is retained. Tate twists do not preserve algebraic integrality, and the packet makes no contrary claim.

**Duality and signs.** Read Weil I 2.3–2.6 and the determinant trace derivation in SGA 4½ Rapport 3.1–3.7. Equivariant duality pairs an eigenvalue with `q^d/alpha`. With the packet's determinant convention, reversing the alternating factors gives the multiplier `(-1)^chi Delta T^chi` and `Delta^2=q^(d chi)`. For projective plane this is `-q^3 T^3`. For the genus-two example it is `(1/2) T^(-2)`. Integer Euler powers and nonzero rational Delta are necessary and correctly retained. The homology-manifold extension uses the actual equivariant dualizing-object identification, not a hypothesis already asserting purity.

**Actual examples.** PR196 TraceFormula Layers 7, 8, 11–15 supply the relevant permutation, Jacobian, projective, localization and tensor contracts. The packet compares their actual realizations with canonical degree factors. It does not construct replacement cohomology or multiply zeta functions to express a product.

Independent exhaustive arithmetic checks gave:

| Equation | Base-field sizes | Affine counts | Counts including the separately supplied point at infinity |
| --- | --- | --- | --- |
| `y²=x³−x` | 5, 25 | 7, 31 | 8, 32 |
| `y²+y=x⁵` | 2, 4, 8, 16 | 2, 4, 8, 32 | 3, 5, 9, 33 |

For reproducibility, enumerate every pair in polynomial-basis finite fields. For F_25 use `u²−3`; for F_4, F_8 and F_16 use `u²+u+1`, `u³+u+1` and `u⁴+u+1`. Before counting, check that every nonzero element raised to `p^d−1` is one; this also certifies these small quotients are fields. Count pairs satisfying the displayed equation, then add the single infinity point furnished by the geometric supplier. The elliptic trace is -2 and its squared trace is -6. For the genus-two curve, the odd reduced pole five, different exponent six and Hurwitz contract give genus two; the first two traces and reciprocity force `1+4T⁴`. The arithmetic enumeration does not prove that model/genus/infinity-point contract.

**Cycles and surfaces.** Read all of Schroer v3 section 7 and its proofs. Surjectivity of the **base-field** cycle map fixes the entire twisted Frobenius endomorphism, not just its eigenvalues. Taking powers supplies the derived all-extension count, although the printed proposition states the base count. For surfaces, divisor descent, Num/H² comparison, projective Hodge-index scope and surface-class invariants remain explicit owner obligations. No general numerical/homological equivalence theorem is assumed. The rational-surface converse uses a finite-order action on a free Picard lattice: finite order gives characteristic-zero semisimplicity, maximal trace gives identity, and faithful tensoring returns identity on the lattice. Purity alone would not justify that step.

**Stacks.** BFP v2 Proposition 3.1 and Proposition 4.2 consume stack purity. The read vdBE Lemma 3.2 is characteristic zero. Neither supplies the missing written finite-field coarse/dualizing/algebraic-space exports merely by citation. The packet correctly records those exact contracts as a gap. Rational coefficient invariants remain exact even when ell divides the stabilizer order; that algebra does not by itself construct stack cohomology.

## Baseline, closure and suggested file

Read the actual declarations at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**, rather than inferring their meaning from names. The packet's Tau Ceti baseline remains **f790474821cf4256814db967cb154e7af3d0c369**; all nine cited baseline declarations are Mathlib declarations.

| Declaration | Confirmed scope |
| --- | --- |
| `Matrix.charpolyRev` | Finite square matrices over a commutative ring; determinant of `1-XM` |
| `Matrix.eval_charpolyRev` | Evaluation at zero is one, including the empty matrix |
| `Matrix.coeff_charpolyRev_eq_neg_trace` | Linear coefficient is minus the matrix trace |
| `RatFunc` | Existing fraction-ring rational-function carrier and polynomial inclusion |
| `AlgebraicGeometry.Scheme.ellAdicSheaf` | Existing prime-ell continuous integral pro-etale sheaf |
| `AlgebraicGeometry.Scheme.EllAdicCohomology` | Existing integral additive cohomology carrier, including empty subsingleton; no rational finite-dimensional Frobenius API inferred |
| `WeierstrassCurve` | Existing five-coefficient equation carrier |
| `WeierstrassCurve.Δ` | Existing commutative-ring discriminant formula |
| `WeierstrassCurve.Affine.Equation` | Existing affine equation membership predicate |

The declaration modules and exact hypotheses are retained in the packet. **No citation removed or replaced.** The available integral cohomology is a real carrier to compare with, but does not supply rational compact supports or Frobenius merely by its existence.

Checked all local prerequisite chains, the three exact RD.7 comparison endpoints, the DWP.7 purity/duality endpoint, relevant EDC/SF/FA/WC supplier statements, all 15 requests and target coverage. RD retains its original-proof/coefficient limitations at its owner. The four gaps honestly cover missing actual carriers, finite-field stacks/algebraic spaces, numerical Picard/surface realizations, and supplier proof/example closure. No invented future stage ID substitutes for the unrouted exports.

At target level the existing statements and proof sketches have appropriate granularity. Their 64 acceptance assertions distinguish common sign, coefficient, geometric/base-cycle and all-power mistakes. No new definition/construction API or three-test obligation arises. Planet names denote the main mathematical objects/results, with five and six per stage, within the limit.

All **20 geometric signatures are explicitly omitted** from the suggested file until their actual supplier carriers exist. This is the honest omission allowed by PROTOCOL section 13, not a set of typed geometric theorems. The 18 examples use existing matrix, rational-function and equation carriers. They introduce no private realization and no proposition-valued conclusion fields. Every node remains `implementationStatus: unchecked`.

## Source receipts and source issues

The packet contains URLs, SHA-256 receipts and precise read extents. Freshly checked sources were [Weil I](https://numdam.org/item/PMIHES_1974__43__273_0.pdf), [Weil II](https://numdam.org/item/PMIHES_1980__52__137_0.pdf), [SGA 4½](https://publications.ias.edu/sites/default/files/Number32.pdf), [Notes on isocrystals v6](https://arxiv.org/pdf/1606.01321v6), [Kedlaya preprint v3](https://arxiv.org/pdf/math/0210149v3), the packet-linked Cambridge version of record, [BFP v2](https://arxiv.org/pdf/2206.07759v2), [Schroer v3](https://arxiv.org/pdf/2004.07025v3), [vdBE v3](https://arxiv.org/pdf/math/0505178v3), [PR196 TraceFormula](https://raw.githubusercontent.com/TauCetiProject/TauCetiRoadmap/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/TraceFormula/README.md) and [merged AlgebraicCurves](https://raw.githubusercontent.com/TauCetiProject/TauCetiRoadmap/fa4d0309ae1d68d274091a647f7cd7fe80608205/TauCetiRoadmap/AlgebraicCurves/README.md). Upstream roadmaps specify suppliers; they are not library proofs.

The fresh Cambridge PDF has SHA-256 `482b4e20d0b950a67444ef835ef11971645cf5e9ea62bdf081a2449e71a34529`, while the historical receipt is `5fb0b647f89a06156fadfdeb353048ff5c8f0f9170d9181b4b65c7dc5bf2cc46`. Both receipts are preserved. The inspected printed 5.3 passages have the recorded errors; no explanation for the byte difference is inferred.

| Existing source issue | Independent finding |
| --- | --- |
| EWC6-1 | Confirmed wrong Weil II 3.3.5 cross-reference; upper weights, not an integrality refinement, are needed |
| EWC6-2 | Confirmed missing `q^-n` reciprocal scaling in both Kedlaya versions; projective line refutes the printed formula |
| EWC6-3 | Confirmed missing integrality/descent argument; trace/finiteness alone does not identify integral degree factors |
| EWC6-4 | Confirmed preprint coefficient misprint, and its correction to E in the published proof |
| EWC6-S10 | Confirmed false universal integrality after positive Tate twist in Schroer v3 |
| EWC6-S11 | Confirmed F_p/F_q misprint in Schroer v3 Corollary 7.2 |
| EWC6-S35 | Confirmed repeated b_1 where the proof needs b_3 from duality |

No new source mistake is asserted. These are existing extraction findings, not discovery claims. The published BFP and Schroer Annals full texts were not collated; their version-persistence status remains unestablished. The [Kedlaya papers page](https://kskedlaya.org/papers/) was checked for the relevant entry; it describes the publication's abbreviation and has no erratum link on that entry. Heavy Fourier/weight-theory and Ogus original proofs remain the suppliers' recorded obligations. Each node's relevant locator and excerpt was checked against its stated public source, without treating a supplier specification as a published proof.

## Validation and orchestrator follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/WeilConjectures--WC.6.json`: **zero errors, zero warnings**.
- `lean-check research/blueprint/suggested/WeilConjectures--WC.6.lean`: **exit 0**, exactly 18 declaration-uses-`sorry` warnings, no other warnings or errors. The build used the exact pinned Mathlib. The file imports no Tau Ceti module, so this is not a Tau Ceti compilation claim. Checks ran sequentially with more than 20 GB available.
- Independent exhaustive finite-field equation counts as above, with field checks.
- JSON review coverage: all 20 distinct nodes checked, seven source issues confirmed, every node still unchecked, no added definition or construction.
- `git diff --check`: passed. Only the issue's packet, suggested file, review report and this review's handoff are changed.

**No blocking question for the orchestrator.** Preserve the four gaps and precise remaining lists when accepting this planning pass. Follow-up jobs must provide exact stack and numerical-Picard/surface owner IDs and exports, replace the generic requests by actual nodes, close owner-recorded original-proof obligations, type the 20 omitted signatures and run the geometric acceptance assertions on constructed objects. Do not mark either stage closed from the algebraic Lean examples.
