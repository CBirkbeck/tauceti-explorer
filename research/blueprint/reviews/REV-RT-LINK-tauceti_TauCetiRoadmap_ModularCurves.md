# Verification of the Modular Curves link-map red team

Codex, session `codex-J6LwjP`, 2026-09-30. Refs #4339. Base snapshot `a779173`.

**Both findings confirmed:** one medium missing-dependency finding and one low recommendation-label finding. I did none of the original link job, its review (`codex-hjdg0j`), or the red team (`cc-c2c06b`). My earlier link red teams concerned other roadmaps; my preceding R33.5 Serre review does not supply evidence for these verdicts.

## Finding 1: retain the two built-result dependencies

The target map's `review.removed` deletes EC Layer 1 → MC 2A and EC Layer 1 → MC Layer 10 because the required equation-level results exist at the library pin. `libraryReuse` preserves the source/consumer evidence and properly limits the imports, but it contributes no production edge.

The roadmap contracts are explicit:

- MC 2A says to consume the equation-level `deg [N] = N²` theorem from the Elliptic Curves roadmap and assigns it to Layer 1. MC retains its narrow scheme/function-field bridge and the proof of relative finite local freeness/rank.
- MC Layer 10 says the merged elliptic-curves roadmap supplies the `Aut(E)` carrier. The same paragraph assigns the exceptional groups in characteristics 2 and 3, their actions on cyclic subgroup schemes, normalizers and orbit computations to MC itself.

I verified all four preserved evidence strings literally against the current documents/stage descriptions. The original reviewer was right that those library imports can be used now. That does not remove the supplier-to-consumer dependency: the link-job specification in `make_queue.py` defines it as a supplied result that the target uses, and PROTOCOL §15 requires ownership/import relationships to remain visible. An explicit link needs one text to name the other roadmap or stage; reciprocal naming is not required.

For comparison, the accepted `tauceti_Completed_EffectiveBounds.json` map retains Layer 1 → Multiquadratic Layer 2 with an explicit statement that its unit-square-index estimate exists at the pin and the edge records ownership/reuse. The accepted AlgebraicCurves map's AC-L05 retains EC Layer 0 → AC Layer 10 while noting that `Point.toClass_surjective` is already proved. I checked these as examples of map policy, not as independent re-audits of their library theorems.

### Pinned declarations read independently

All links below use Tau Ceti commit `f790474821cf4256814db967cb154e7af3d0c369`, read on 2026-09-30.

| Declaration | Actual scope |
|---|---|
| [`TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Degree.lean#L79) | Field F, elliptic Weierstrass curve W and integer n ≠ 0; degree is `n.natAbs ^ 2`. It includes residue characteristics dividing n and does not supply the relative scheme bridge. |
| [`WeierstrassCurve.autGroup`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Aut.lean#L211) | Stabilizer subgroup for admissible variable changes of a Weierstrass curve over a commutative ring. |
| [`WeierstrassCurve.autGroupMulEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Aut.lean#L222) | Over a field, with ellipticity and j ≠ 0, 1728, identifies that group with `Multiplicative (ZMod 2)`. It is not the exceptional-j classification. |

The reviewed EC Layer 1 audit also distinguishes the stabilizer and units-of-End carriers from their still-missing identification. Restoring the link must not silently declare that comparison proved or make MC wait for the entire unfinished layer. The reasons should name the available imports and the remaining MC work.

### Graph and proposed-fix checks

I rebuilt the production atlas using `scripts.build.assemble(require_distances=False)`, including promoted links, restructurings and blueprints. It has **2,840 stages and 8,007 edges**. The research and promoted ModularCurves maps are byte-identical.

| Pair from EC Layer 1 | Direct edge | Forward path | Reverse path |
|---|---|---|---|
| → MC 2A | absent | absent | absent |
| → MC Layer 10 | absent | absent | absent |

The sole EC → MC production edge is EC Layer 2 → MC 2E. Thus this is not an omitted direct edge already represented by a longer path. Both additions have the same source and neither target reaches it, so adding them together cannot introduce a cycle.

In scratch only, I restored both links with `confidence: explicit`, the four preserved quotes and the existing reuse scopes. The canonical link checker accepts the resulting **45-link** map with **zero errors and warnings**; the unchanged 43-link input is also checker-clean. The fix is to restore those links, retain the library notes, and obtain the renewed review required before promotion. No map or promoted data was edited in this verification.

## Finding 2: four coordination notes should say keep

I checked the twenty overlap records: fifteen say `rescope` and five say `keep`. Exactly four of the `rescope` records have only upstream Tau Ceti endpoints:

| One-based overlap | Endpoints |
|---:|---|
| 1 | JacobianChallenge D; ModularCurves 2D |
| 3 | ModularCurves 7C; EllipticCurves Layer 1 |
| 4 | ModularCurves Layer 10; EllipticCurves Layer 4 |
| 15 | ModularCurves 0B; ReductiveGroups Layers 0, 3, 4 |

All ten evidence quotes for these four overlaps are literal. Their proposals preserve the upstream scopes and prescribe imports or comparisons. Under PROTOCOL §15, the matching recommendation is `keep`. Change only those labels; the source-specific proposal text should remain.

The original review explicitly describes these as coordination proposals, and the production link merge does not implement the enum as a restructuring. This confirms the red team's **low** severity: inaccurate metadata, not an actual unauthorised rewrite of the upstream roadmaps.

I additionally read the pinned [`formalGroup`, `map_formalGroup` and `isComm_formalGroup`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean), and [`commHopfAlgCatOpEquivAffineGroupSchemeCat`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Equivalence.lean#L40). These support the reuse boundaries in the proposals: a coordinate law over a commutative ring is not the intrinsic completion comparison, and the Hopf anti-equivalence is over an affine base. I did not independently re-audit the entire Cartier-duality development for this label-only finding.

## Scope and validation

This verifies the two submitted findings, including their evidence and fixes. It does not repeat the red team's whole-catalogue omission screen or the separate AlgebraicCurves circular-deduplication finding. No claim is made to have re-read the Katz–Mazur or Mazur books: the decisive evidence here is the roadmap contract, the actual production graph and the pinned declarations.

The result schema checker, intake `check-files`, and `git diff --check` pass. The two link-checker runs are described above. No Lean file was changed or compiled, and no build or language server was created. Only the two assigned verification deliverables are submitted.
