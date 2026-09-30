# Red team: the ModularCurves link map

Claude Code, session `cc-c2c06b`, 30 September 2026. Target:
`LINK-tauceti_TauCetiRoadmap_ModularCurves`. Issue #4340. I did not write or review the
target.

**Disclosure.** I red-teamed the AlgebraicCurves link map. My finding there,
`RT-LINK-tauceti_TauCetiRoadmap_AlgebraicCurves/1`, concerns four AlgebraicCurves →
ModularCurves Layer 10 pairs that this map's review removed as "already in the AlgebraicCurves
packet", and that the AlgebraicCurves map in turn deferred back here. I cross-reference that
finding and do not raise it again.

**Result: two findings, one medium and one low.**

## Finding 1 (medium): two EllipticCurves Layer 1 dependencies dropped because they are built

The accepted review removed EllipticCurves Layer 1 → ModularCurves 2A and → Layer 10, with the
reason "required equation-level result already exists at the pin". The consumers say
otherwise about their dependencies:

- **2A** says: "consume the equation-level theorem `deg [N] = N²` from the Elliptic Curves
  roadmap … The Elliptic Curves roadmap is a Lean dependency", with the theorem "owed by that
  roadmap's Layer 1".
- **Layer 10** imports Layer 1's `Aut(E)` carrier.

The pinned declarations do exist: `TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero` and
`WeierstrassCurve.autGroupMulEquiv`. But other accepted maps keep exactly such edges as
ownership records:

- EffectiveBounds keeps its Layer 1 → Multiquadratic edge, although `units_sq_index_le` is at
  the pin.
- AlgebraicCurves keeps EllipticCurves Layer 0 → AlgebraicCurves Layer 10, although
  `toClass_surjective` is at the pin.

After the removal, the production graph has one EllipticCurves → ModularCurves edge, EC Layer
2 → MC 2E, and no path from EC Layer 1 into either consumer.

**Fix:** restore both links from the evidence the map itself preserved in `libraryReuse`. All
four quotations are literal, and the consumer names the supplier's layer, so they are explicit
links. Put the reuse scope in each reason. A scratch copy with both links restored passes
`check_links.py` with 0 errors, and neither addition closes a cycle.

## Finding 2 (low): Tau Ceti–only overlaps labelled "rescope"

Four overlaps between two Tau Ceti roadmaps carry the recommendation `rescope`:

- JacobianChallenge D and ModularCurves 2D;
- ModularCurves 7C and EllipticCurves Layer 1;
- ModularCurves Layer 10 and EllipticCurves Layer 4;
- ModularCurves 0B and ReductiveGroups Layers 0, 3 and 4.

Under §15, Tau Ceti roadmaps are never re-planned. The proposals are in fact reuse notes; one
begins "Keep both upstream roadmaps and their established order". **Fix:** relabel them `keep`.
No script reads the label, so the effect is on the record only.

## What held up

- **Mechanics.** `check_links.py` is clean. There are 43 links, 35 outgoing and 8 incoming,
  and 20 overlaps. All 156 quotations are literal. The promoted copy is identical to the
  research copy.
- **Liveness.** 40 links are live. The other three, to MordellLawrenceVenkatesh LV.2 and LV.6
  and to RingStacksAndTransmutation RS.0, are correctly deferred until those new roadmaps are
  promoted.
- **Removals.** ModularCurves 4C → LV.5 was rightly removed, because LV's Legendre
  construction moved to LV.6.
- **Omissions.** I screened every unlinked stage for ModularCurves, Katz–Mazur, X₀(N), X₁(N),
  J₀(N), Drinfeld levels, Igusa curves and Eichler–Shimura. Every hit goes through
  ModularCurvesPartII or a supplier the examined notes already account for.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_ModularCurves.result.json`:
  ok.
- No Lean was compiled.
