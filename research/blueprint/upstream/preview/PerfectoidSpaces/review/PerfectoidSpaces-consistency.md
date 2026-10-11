# PerfectoidSpaces consistency

## Declarations and Lean lines changed

All locators refer to the final `TauCetiRoadmap/PerfectoidSpaces/Suggested.lean`.

| Lines | Change |
|---|---|
| 3733–3736 | The docstring of `Perfectoid.isPerfectoidTateRing_iff_sibling` identifies `AdicEtaleGeometry.PerfectoidInput.IsPerfectoidTateRing` as the shared supplier used for Part IV's sousperfectoid frames. Its signature and proof are unchanged. |
| 9195–9202 | The acyclicity supplier comment names Part II charts. An anonymous example applies `TauCetiRoadmap.AdicSpacesPartIII.AdicSpace.sheafy_structure_acyclic` to `c : TauCetiRoadmap.AdicSpacesPartII.AdicSpace.Chart X`, with `[Huber.IsTateRing c.affinoid.ring]` and `0 < i`. |
| 12614–12619 | The commented vector-bundle reference becomes an elaborated anonymous example applying `TauCetiRoadmap.AdicSpacesPartIII.AdicSpace.vectorBundleEquivalence` to a Part II chart with `[Huber.IsTateRing c.affinoid.ring]`. |

No named declaration, target, or existing Check was removed. No new named declaration was introduced. Both explicit supplier applications elaborate without `sorry` in their bodies.

## README lines changed

All locators refer to the final `TauCetiRoadmap/PerfectoidSpaces/README.md`.

| Lines | Change |
|---|---|
| 551 | The ordinary/Čech acyclicity supplier row specifies Part II `AdicSpace.Chart`, `c.affinoid.ring`, and `c.affinoid.spa`. |
| 567 | The vector-bundle supplier row specifies the same Part II chart carrier and the Tate hypothesis on its coefficient ring. |
| 3106–3112 | P1.1 names AdicEtaleGeometry as the supplier of the shared perfectoid input; the forward and reverse Checks identify that input explicitly. |
| 5749–5750 | P2's acyclicity application specifies the Part II chart fields. |
| 8587–8588 | P3's rational gluing application specifies the Part II chart and Tate coefficient ring. |
| 12419–12422 | P7 cites Part IV's exact intrinsic tilde-limit supplier names and their source file. |

## Requested ownership checks

- The theorem `Perfectoid.isPerfectoidTateRing_iff_sibling` and its three Checks already used `TauCetiRoadmap.AdicEtaleGeometry.PerfectoidInput.IsPerfectoidTateRing` on entry. The owning structure was confirmed in `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean:148`, including the fields used by the existing proof. The README supplier row at line 543 and the P1.1 equivalence at lines 3101–3102 already named that owner; these correct references were retained.
- No `AdicSpacesPartII R3` reference, including the `layer R3` spelling, remains in this folder. There was no stale relative-differentials reference to edit on entry. The owner is `TauCetiRoadmap.AdicSpacesPartIII.AdicSpace.relativeDifferentials` (`TauCetiRoadmap/AdicSpacesPartIII/Suggested.lean:14139`), with `.affinoidIso` at line 14164.
- No reference remains to the deleted `TauCetiRoadmap.AdicEtaleGeometry.AdicSpace.Chart`, `IsAdic`, `IsFinite`, `Etale`, `LocallyOfFiniteType`, or `Smooth`. There were no such references on entry. The existing `PerfectoidSpace.isAdicClosedImmersion_iff_adicCharts` already uses Part II `AdicSpace.Chart`, `.affinoid`, `.ι`, and `AdicSpace.Affinoid.map`. Unqualified chart and predicate occurrences were also inspected; local perfectoid charts and unrelated algebraic notions were retained.
- P7 consumes these existing declarations from `TauCetiRoadmap/AdicSpacesPartIV/Suggested.lean`, verified in their definitions/signatures:
  - `TauCetiRoadmap.AdicSpacesPartIV.AdicSpace.IsTildeLimit` (3372).
  - `TauCetiRoadmap.AdicSpacesPartIV.AdicSpace.IsTildeLimit.affinoid` (3401).
  - `TauCetiRoadmap.AdicSpacesPartIV.AdicSpace.IsTildeLimit.completedAffinoid` (3419).
  - `TauCetiRoadmap.AdicSpacesPartIV.AdicSpace.IsTildeLimit.baseChange` (3460).
  The existing supplier row at README line 590 and the analytic Yoneda comparison retain this dependency direction.

## Exact elaboration outcome

Working directory: ``.

```text
lake env lean TauCetiRoadmap/PerfectoidSpaces/Suggested.lean
exit code: 0
warnings: 3341
warning kind: declaration uses `sorry` (all warnings)
other warnings: 0
errors: 0
other output: none
```

Full output: `PerfectoidSpaces-consistency-lean.log` in this directory.
The readthrough helper reported no README/Lean residue or dangling internal links.
The only repository files edited were this folder's `README.md` and `Suggested.lean`.
No `lake build`, git command, or push was run.
