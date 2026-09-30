# Independent review of the Elliptic Curves link-map fixes

Refs #5170. **Codex — codex-5ebb6f**, 30 September 2026. Reviewed explorer revision `b95ea03376e4377aec924de5d6adb5a4a07fd762`. The claim bot confirmed this session before work began.

**Verdict: accepted.** Both confirmed findings are repaired. No mathematical correction was necessary. This review follows `independent-review-REV-LINK-tauceti_TauCetiRoadmap_EllipticCurves`, dated 21 September 2026, whose complete object is preserved in `reviewHistory`. The fixer was Claude Code, session `cc-39fac3`, issue #3991; this reviewer did none of that fix work. The shared repository account is not claimed as evidence of independence: the author and reviewer sessions identify the different workers.

The inputs were the red-team result, both verifier verdicts, the fix report, the current link map and the affected roadmap texts. This is a review of the fixes, not a new catalogue-wide screen or a proof-interior audit of every inherited dependency. Under PROTOCOL sections 10 and 17, the eleven historical links between two Tau Ceti roadmaps remain unchanged and outside the mathematical review scope.

## Findings

| Finding | Verdict | Reason |
| --- | --- | --- |
| RT-LINK-tauceti_TauCetiRoadmap_EllipticCurves/1 | Fixed | The eleventh overlap names Elliptic Curves Layer 4 and TB.7, recommends `keep`, distinguishes equation/field-valued points from the analytic quotient, and requires the precise common-scope comparison. The Tropical screening note now records the actual TB.7 construction and the existing TB.6 measure-example input. |
| RT-LINK-tauceti_TauCetiRoadmap_EllipticCurves/2 | Fixed | The EffectiveDiophantineMethods, FiniteFlatGroupsAndIntegralPadicHodgeTheory and RankZeroOneBSD notes now describe the accepted imports. They preserve the limited elliptic acceptance case, generic-fibre versus finite-flat distinction, and source-qualified BSD.6a branches. BSD.7a gains no inferred edge. |

### /1: Tate uniformization

[Elliptic Curves Layer 4](https://github.com/CBirkbeck/tauceti-explorer/blob/b95ea03376e4377aec924de5d6adb5a4a07fd762/content/tau-ceti/EllipticCurves/README.md#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv) was read with both its discrete and analytic strands. The analytic strand assumes a complete rank-one valued field and a unit q with |q| < 1, allowing nondiscrete valuations. It constructs the integral q-series model before evaluation and the compatible, Galois-equivariant point isomorphism for finite extensions L/K. The overlap retains these hypotheses; “unit” means a nonzero element of the field, not a unit of its valuation ring. It does not broaden the result to all points of a noncomplete separable closure or assert a rigid quotient in the anchor.

The full [Tropical and Berkovich roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/b95ea03376e4377aec924de5d6adb5a4a07fd762/content/campaign/TropicalAndBerkovichArithmetic/README.md) was read. TB.7 constructs uniformization rather than merely testing a Tate example. Its totally degenerate range, Schottky/Mumford generalization, descent, period lattice and integration distinctions remain its own obligations. The added overlap requires comparison of the curve and q-parameter, the induced finite-extension point map, kernel q^ℤ and Galois action. This supplies the missing reconciliation without replacing analytic geometry by a point-set group isomorphism. It adds no dependency edge before the supplier contract is settled. The TB.6 measure edge is preserved.

### /2: the final screening decisions

Read [ED.3](https://github.com/CBirkbeck/tauceti-explorer/blob/b95ea03376e4377aec924de5d6adb5a4a07fd762/content/campaign/EffectiveDiophantineMethods/README.md#ed-3), [R07.5](https://github.com/CBirkbeck/tauceti-explorer/blob/b95ea03376e4377aec924de5d6adb5a4a07fd762/content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07-5), and the complete [BSD.6a and BSD.7a contracts](https://github.com/CBirkbeck/tauceti-explorer/blob/b95ea03376e4377aec924de5d6adb5a4a07fd762/content/campaign/RankZeroOneBSD/README.md#stage-BSD.6a), together with the linked Layer 2/4/4.5a/5/6/7 supplier passages.

ED.3 still proves its local-image, index and saturation certificates. Its elliptic acceptance case uses the Layer 7 descent sequence and Layer 6 point-group/rank-bound theory; the note no longer denies that use. R07.5 imports generic-fibre torsion/Galois carriers and good ordinary/supersingular predicates, while its inertia calculation and integral finite-flat extension criteria remain additional work. The finite-residue-field and minimal-equation qualifications in Layer 4 are not removed.

The BSD note accurately records the quadratic-twist and global-semistability imports for BSD.6a. The consumer retains the BSTW twist discriminant/support restrictions and the separate a₃ condition; no general supersingular theorem is inferred. The absence of a separate BSD.7a edge is described as the recorded decision, not used to invent one. The inherited screening read-scope and reviewNote provenance are retained.

## Baseline, preservation and checks

Relevant accepted AUDIT-11 entries were read in `data/library-coverage.json`: Layers 2, 4, 5, 6 and 7. In particular, the Tate uniformization and cohomological descent sequence are supplier targets, not asserted existing Lean declarations.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, the actual [fg_point_of_numberField statement](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean#L118) and [quadraticTwistPointEquiv and its character-equivariance statement](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean#L797) were inspected. Their source contents equal the pinned Git blobs. Finite generation does not supply a certified rank algorithm, and the twist equivalence does not prove the arithmetic BSD branch. The Mathlib source tree is at the required `082e2d37e8b0463410cdb532e111cd43d5a66174`; this fix introduces no new Mathlib declaration claim.

- Compared with the promoted predecessor: all 82 link payloads and all ten earlier overlaps are identical. The only mathematical addition is the eleventh overlap. The four corrected screening entries match their six ED.3/R07.5/BSD.6a links and the TB.6 link.
- Mechanically checked the 189 literal evidence quotations on the 71 eligible links against the named stage or containing roadmap. This checks quotation integrity, not a new proof audit. Historical Tau Ceti-to-Tau Ceti pairs were preserved without reevaluating them.
- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json`: **0 errors, 0 warnings**, 82 links, 11 overlaps, 218 examined entries.
- Read-only accepted-atlas assembly and an independent topological check: **2919 vertices, 8297 edges, acyclic**. The fix introduces no new graph edge.
- Intake `check-files` on both deliverables and `git diff --check`: **0 problems**.

Only review metadata and this report change. The previous review is archived verbatim; its original `added` and `removed` arrays are also retained in the current object so existing reviewNote pointers remain meaningful, explicitly identified as inherited provenance. No new node, definition API or Lean file is introduced, so there is no new suggested-file compilation. No libraries were built and no implementation or proof-closure certification is made. No fix remains outstanding for these two findings; the ordinary downstream TB.7 blueprint must implement the recorded comparison.
