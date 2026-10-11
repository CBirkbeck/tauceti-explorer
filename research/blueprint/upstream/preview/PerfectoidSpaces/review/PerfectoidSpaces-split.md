# PerfectoidSpaces / PerfectoidTowers gate report

## Scope and preservation

Only the two authorized roadmap directories were edited. PerfectoidSpaces contains P0–P7;
PerfectoidTowers contains P8–P9, with their original layer numbers, every target, example,
Check and subsection label. The new metadata has `topic = "math.AG"`. No git command or push
was run. AdicSpacesPartII–IV, AdicEtaleGeometry and DiamondsAndVStacks sources were not edited.
The authorized import build writes Lake build artifacts for suppliers.

The source baseline is saved in `PerfectoidSpaces-original/` beside this report.
`PerfectoidSpaces-intervals.json` gives the original line intervals assigned to Towers.
The isolated `example := @Perfectoid.TorsorDescent.ProetaleGaloisTower.torsorIso`
in the otherwise P0–P7 `ConcreteComparisons` appendix also belongs to Towers.
The late quotient/projective-line examples (original lines 31626–31715) belong to P8.
The remaining almost-algebra, tilting, geometric-site and P0–P7 appendices remain in Spaces.

## Counts

Bold targets count line-leading bold titles excluding `Check.` and `Checks.`. The initial
424 figure counted those headings too; the separate “All bold leads” column records that
original metric. Declarations count `def`, `abbrev`, `theorem`, `lemma`, `structure`, `class`,
`instance`, `axiom`, `opaque` and `inductive` commands, including attributed declarations.
Generated structure projections are not separately counted. Labels count `(*label*)`
occurrences, including repeated supplier citations. Checks count `-- Check:` lines; lines
containing multiple Check names are one marker. Examples are counted independently.

| Folder/state | Bold targets | All bold leads | Declarations | Labels | Examples | Check markers |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Before: PerfectoidSpaces | 241 | 424 | 2685 | 485 | 1948 | 1761 |
| After: PerfectoidSpaces | 203 | 363 | 2435 | 409 | 1690 | 1518 |
| After: PerfectoidTowers | 38 | 61 | 250 | 76 | 258 | 243 |
| After: combined | 241 | 424 | 2685 | 485 | 1948 | 1761 |

The multisets of Lean subsection-label lines and Check-marker lines are preserved exactly.
Every original supplier-contract row key occurs in at least one of the two front matters;
shared supplier rows occur in both. Every original README target label is preserved.
The numeric/label references crossing the ownership boundary are linked below. The layer
prose is retained except for those references and the adaptations to the supplied diamond and analytic APIs.

## Import graph

Arrows mean “imports”. The roadmap-module graph is acyclic:

```text
PerfectoidTowers -> PerfectoidSpaces
PerfectoidTowers -> DiamondsAndVStacks -> PerfectoidSpaces
PerfectoidSpaces -> AdicEtaleGeometry -> AdicSpacesPartIII -> AdicSpacesPartII
PerfectoidSpaces -> AdicSpacesPartIV -> AdicSpacesPartIII
AdicSpacesPartIV -> AdicEtaleGeometry
AdicSpacesPartIII -> ModularCurves
```

PerfectoidTowers also imports
`TauCeti.RepresentationTheory.Homological.ContCohomology.Functoriality`, the P9-only
import previously in PerfectoidSpaces. Both modules retain their required Mathlib/Tau Ceti
suppliers through direct or transitive imports. PerfectoidSpaces does not import Towers
or DiamondsAndVStacks. DiamondsAndVStacks does not import Towers.

Read-only grep of `AdicEtaleGeometry/Suggested.lean` for P8/P9, PerfectoidTowers,
`Perfectoid.TorsorDescent`, invariant-pair declarations, `GoodTower`,
`IsAnalyticallySeparated`, `IsZariskiClosedEmbedding` and `VQuotient.SpatialPresentation`
found no matches. Its only roadmap import is `TauCetiRoadmap.AdicSpacesPartIII.Suggested`.

## Deleted re-definitions and supplied replacements

All supplier names in the following table are in `TauCetiRoadmap.DiamondsAndVStacks`.

| Original P8 declaration/material | Replacement | Consumers |
| --- | --- | --- |
| The field-by-field `PerfectoidSpaces.PerfectoidSpace.VQuotient.SpatialPresentation` structure | `Perf.Diamond.Presentation` together with `Perf.Diamond.IsSpatial`; Towers' `SpatialPresentation` is only an abbreviation for a supplied presentation with this proof | `perfectoid_of_perfectoid_components` and all three `SpatialPresentation_*` Checks |
| The structure's private point carrier and evaluation | `Geometry.realized`, `Perf.Diamond.spaceι` | The component action, component image condition, affinoid/empty/noncompact Checks |
| P8 consumers of `PerfectoidSpaces.PerfectoidSpace.VQuotient.adicVFunctor` | `CategoryTheory.ULiftHom.up ⋙ PreAdic.geometricDiamond p` | `invariant_quotient_presentation`, `quotient_diamond_comparison`, `quotient_finiteEtale_iff_free`, `GoodTower.quotient`, its trivial-group Check and the component theorem |
| P8 consumers of the untilt `VQuotient.vTopology` carrier | `Geometry.vTopology` and `Geometry.VSheaf`, with `Geometry.Perf`, `Geometry.space` and `Geometry.proet` | The same quotient and spatial-component signatures |

The presentation's atlas/relation/source/target data are now supplied by
`Perf.Diamond.Presentation.X`, `.R`, `.s`, `.t` and `.relation`; its atlas and quotient
comparison use `.atlas`, `.atlas_isColimit` and `Perf.Diamond.relation_eq`.
Its point-space, quotient and evaluation interfaces use `Perf.Diamond.space`,
`.presentationSpace`, `.space_eq_quotient`, `.spaceι` and `.space_of_perfectoid_ι`.
Spatiality and spectrality come from `Perf.Diamond.IsSpatial` and
`Perf.Diamond.IsSpatial.spectralSpace`. The supplier table also cites
`PreAdic.diamond_perfectoid`, `PreAdic.diamond_fibreProduct`, `Geometry.O_isSheaf_v`
and `Geometry.Oplus_isSheaf_v`.

The deleted structure projections are accounted for as follows (all supplier prefixes are
`Perf.Diamond` unless shown otherwise):

| Deleted projections | Supplied interface |
| --- | --- |
| `atlas`, `relation`, `source`, `target` | `Presentation.X`, `.R`, `.s`, `.t` |
| `source_proetale`, `target_proetale` | `Presentation.relation` (`IsProEtaleEquivRel`) |
| `cover`, `cover_epi`, `effective` | `Presentation.atlas`, `.atlas_isColimit`, `relation_eq` |
| `points`, `spectral` | `Geometry.realized`, `IsSpatial.spectralSpace` |
| `quotient`, `quotient_map`, `fibers` | `pointSetoid`, `presentationSpace`, `presentationSpace_isColimit`, `space_eq_quotient` |
| `atlas_compact`, `relation_compact`, `spectral_quotient` | The supplied `IsSpatial` predicate carries the qcqs spatiality condition; component consumers use intrinsic spatiality, without storing a separate compact presentation and quotient-space witness |
| `evaluation`, `naturality`, `evaluation_cover` | `spaceι`, `spaceι_restrict`, `spaceMap_ι`, `space_of_perfectoid_ι` |

### Existing P0–P7 ownership in this checkout

The task's examples of additional P8/P9 re-definitions do not match this baseline:
`completion_cardinality_bound` is P6 (original Lean line 17858), and
`CategoryTheory.Pro.hasCofilteredLimits` is P6 (line 17852), proved by Mathlib's instances.
DiamondsAndVStacks supplies neither same-named declaration; its README explicitly assigns
these inputs to PerfectoidSpaces. They remain in Spaces under the requested P0–P7 retention rule.

Likewise the untilt-site `vPrecoverage`, `vTopology`, `vTopology_eq`, `adicVFunctor` and
`adicVFunctor_perfectoid` are in P7 (original lines 23722–23942), and P7's represented-limit
and uniformized-colimit comparisons use them. These declarations and their P7 Checks
remain in Spaces, with no dependency on DiamondsAndVStacks. P8 consumes DiamondsAndVStacks'
actual diamondification instead. No P8/P9 v-topology, diamond functor, completion bound or
pro-category instance is re-declared in Towers. This distinction was raised during the task;
the stated P0–P7 retention rule governs the implementation.

## Cross-references fixed

Moved Lean namespaces uniformly change `TauCetiRoadmap.PerfectoidSpaces` to
`TauCetiRoadmap.PerfectoidTowers`. Each reopened namespace explicitly opens the needed
P0–P7 namespaces; `TowerGeometry` also opens the original P7 `TowerGeometry` namespace.
Fresh analytic supplier artifacts also require replacing the former
`AdicSpacesPartIV.Perfectoid.IsPerfectoidTateRing` reference in P1's comparison theorem
and three Checks by `AdicEtaleGeometry.PerfectoidInput.IsPerfectoidTateRing`.
The declaration's fields are unchanged; the P1 supplier table and target text name the
current supplier and file. No theorem or Check is removed.
P4's `isAdicClosedImmersion_iff_adicCharts` also uses the current
`AdicSpacesPartII.AdicSpace.Chart` and `AdicSpace.Affinoid.map` in place of the
removed AdicEtaleGeometry chart wrapper. Its commuting equation, image equality,
open quotient condition and integral-closure plus-ring clause are preserved; the
P4 target text names these suppliers.
P8/P9 likewise refer directly to PartII's `AdicSpace.Smooth`, `.Chart`,
`.LocallyOfFiniteType` and `.IsFinite`, rather than the removed AdicEtaleGeometry
wrappers. Chart consumers use `C.affinoid.ring` and `C.ι` in place of the old
`C.pair.A` and `C.map`. The Towers supplier table records these current declarations.
The continuous-differential interface retains the local noetherian hypotheses
previously bundled by the old smoothness wrapper as explicit source/target proofs.
Its three Checks and first-direct-image comparison pass those proofs separately
from PartII smoothness; the discrete field base has the required local noetherian property.
P8/P9 local supplier-file references name `PerfectoidTowers/Suggested.lean`.
The new PerfectoidSpaces supplier table names actual P0–P7 declarations, and the
DiamondsAndVStacks table names the actual replacements listed above.

The title, scope/ownership, layer overview, conventions, supplier sections, reading guide,
downstream consumers and bibliographies are restricted to their owning layers. The original
P8/P9 auxiliary-example table is in Towers. The bibliography entries in each README are
exactly those whose short keys are cited there.

The P7 attribution of its untilt-site carriers to P8.15 is corrected to P7.11.
The P7 root-torus examples explicitly link to Towers' `Perfectoid.TorsorDescent.rootTorusTower_exists`.
P8.11 and P8.20 now name the supplied diamond functor; P8.15 explicitly identifies the
untilt-site helper Checks as PerfectoidSpaces P7 and the quotient signatures as using
DiamondsAndVStacks. P8.17 names the supplied presentation, spatiality, realization and evaluation.

The following is the complete list of cross-roadmap README links, including each occurrence
and its current line number (relative to the corresponding roadmap folder):

| README | Line | Reference | Destination |
| --- | ---: | --- | --- |
| PerfectoidSpaces | 47 | PerfectoidTowers | `../PerfectoidTowers/README.md` |
| PerfectoidSpaces | 6643 | P8 | `../PerfectoidTowers/README.md#layer-p8-finite-quotients-and-closed-perfectoid-loci-in-towers` |
| PerfectoidSpaces | 6654 | P8 | `../PerfectoidTowers/README.md#layer-p8-finite-quotients-and-closed-perfectoid-loci-in-towers` |
| PerfectoidSpaces | 7058 | P8 | `../PerfectoidTowers/README.md#layer-p8-finite-quotients-and-closed-perfectoid-loci-in-towers` |
| PerfectoidSpaces | 9335 | P8 | `../PerfectoidTowers/README.md#layer-p8-finite-quotients-and-closed-perfectoid-loci-in-towers` |
| PerfectoidSpaces | 9850 | P8 | `../PerfectoidTowers/README.md#layer-p8-finite-quotients-and-closed-perfectoid-loci-in-towers` |
| PerfectoidSpaces | 11926 | P8 | `../PerfectoidTowers/README.md#layer-p8-finite-quotients-and-closed-perfectoid-loci-in-towers` |
| PerfectoidSpaces | 12268 | `PerfectoidTowers.Perfectoid.TorsorDescent.rootTorusTower_exists` | `../PerfectoidTowers/README.md#layer-p9-continuous-torsor-descent-with-coefficients` |
| PerfectoidSpaces | 12407 | `PerfectoidTowers.Perfectoid.TorsorDescent.rootTorusTower_exists` | `../PerfectoidTowers/README.md#layer-p9-continuous-torsor-descent-with-coefficients` |
| PerfectoidSpaces | 13281 | P8 | `../PerfectoidTowers/README.md#layer-p8-finite-quotients-and-closed-perfectoid-loci-in-towers` |
| PerfectoidSpaces | 13546 | P8.21 | `../PerfectoidTowers/README.md#layer-p8-finite-quotients-and-closed-perfectoid-loci-in-towers` |
| PerfectoidSpaces | 14076 | P8 | `../PerfectoidTowers/README.md#layer-p8-finite-quotients-and-closed-perfectoid-loci-in-towers` |
| PerfectoidSpaces | 14098 | P9.4 | `../PerfectoidTowers/README.md#layer-p9-continuous-torsor-descent-with-coefficients` |
| PerfectoidSpaces | 14118 | P8.21 | `../PerfectoidTowers/README.md#layer-p8-finite-quotients-and-closed-perfectoid-loci-in-towers` |
| PerfectoidSpaces | 14118 | P9.4 | `../PerfectoidTowers/README.md#layer-p9-continuous-torsor-descent-with-coefficients` |
| PerfectoidTowers | 6 | PerfectoidSpaces | `../PerfectoidSpaces/README.md` |
| PerfectoidTowers | 50 | PerfectoidSpaces P0.25 | `../PerfectoidSpaces/README.md#layer-p0-almost-mathematics-over-a-basic-setup` |
| PerfectoidTowers | 52 | PerfectoidSpaces P0.26 | `../PerfectoidSpaces/README.md#layer-p0-almost-mathematics-over-a-basic-setup` |
| PerfectoidTowers | 199 | PerfectoidSpaces P4 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 361 | P1.1 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 376 | P1.1 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 376 | P1.4 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 386 | P1.2 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 451 | P2.3 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 451 | P1.27 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 589 | P2.16 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 616 | P2.8 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 616 | P2.16 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 707 | P2 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 707 | P3 | `../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site` |
| PerfectoidTowers | 796 | P4.15 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 809 | P4.15 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 809 | P2.16 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 829 | P2 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 830 | P4 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 848 | P2.17 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 858 | P2.16 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 858 | P2.17 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 858 | P4.10 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 858 | P4.19 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 899 | P2 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 914 | PerfectoidSpaces P7 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 973 | P5.3 | `../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent` |
| PerfectoidTowers | 989 | P1.24 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 1011 | P1.24 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 1011 | *perfectoid-tate-ring-from-integral-perfectoid* | `../PerfectoidSpaces/README.md` |
| PerfectoidTowers | 1012 | P4.15 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 1012 | P5.3 | `../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent` |
| PerfectoidTowers | 1078 | P7.11 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1078 | P5.3 | `../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent` |
| PerfectoidTowers | 1095 | P1.1 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 1120 | P7 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1211 | P7 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1236 | P7.1 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1236 | P7.2 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1247 | P4.15 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 1247 | P7.1 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1247 | P7.2 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1255 | P4 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 1295 | P1 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 1295 | P1.1 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 1295 | P1.4 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 1295 | P1.24 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 1295 | P1.27 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 1295 | P2 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 1296 | P2.3 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 1296 | P2.8 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 1296 | P2.16 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 1296 | P2.17 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 1296 | P3 | `../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site` |
| PerfectoidTowers | 1296 | P4 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 1296 | P4.10 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 1296 | P4.15 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 1296 | P4.19 | `../PerfectoidSpaces/README.md#layer-p4-injections-immersions-and-separatedness` |
| PerfectoidTowers | 1296 | P5 | `../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent` |
| PerfectoidTowers | 1296 | P5.3 | `../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent` |
| PerfectoidTowers | 1296 | P7 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1297 | P7.2 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1297 | P7.11 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1325 | P6.14 | `../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms` |
| PerfectoidTowers | 1325 | *scholze-2013-affinoid-perfectoid-comparison* | `../PerfectoidSpaces/README.md` |
| PerfectoidTowers | 1328 | P7.2 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1341 | P6.14 | `../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms` |
| PerfectoidTowers | 1341 | P7.1 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1341 | P7.2 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1341 | P5.1 | `../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent` |
| PerfectoidTowers | 1368 | P1 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 1398 | P3.21 | `../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site` |
| PerfectoidTowers | 1402 | P0.2 | `../PerfectoidSpaces/README.md#layer-p0-almost-mathematics-over-a-basic-setup` |
| PerfectoidTowers | 1407 | P6 | `../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms` |
| PerfectoidTowers | 1407 | P3 | `../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site` |
| PerfectoidTowers | 1416 | P2.8 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 1416 | P2.7 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 1416 | P6.14 | `../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms` |
| PerfectoidTowers | 1536 | P1.31 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 1600 | P6 | `../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms` |
| PerfectoidTowers | 1601 | P7.2 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 1601 | *tilde-limit-etale-base-change* | `../PerfectoidSpaces/README.md` |
| PerfectoidTowers | 1650 | P1 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 1764 | P0.5 | `../PerfectoidSpaces/README.md#layer-p0-almost-mathematics-over-a-basic-setup` |
| PerfectoidTowers | 1778 | P2.17 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 1804 | P2.17 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 2136 | P5.3 | `../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent` |
| PerfectoidTowers | 2414 | P0 | `../PerfectoidSpaces/README.md#layer-p0-almost-mathematics-over-a-basic-setup` |
| PerfectoidTowers | 2414 | P0.5 | `../PerfectoidSpaces/README.md#layer-p0-almost-mathematics-over-a-basic-setup` |
| PerfectoidTowers | 2414 | P1 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 2414 | P1.31 | `../PerfectoidSpaces/README.md#layer-p1-perfectoid-tate-rings-tilts-and-untilts` |
| PerfectoidTowers | 2414 | P2 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 2414 | P2.7 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 2414 | P2.8 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 2414 | P2.17 | `../PerfectoidSpaces/README.md#layer-p2-rational-localisation-the-sheaf-theorem-and-perfectoid-spaces` |
| PerfectoidTowers | 2414 | P3 | `../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site` |
| PerfectoidTowers | 2414 | P3.21 | `../PerfectoidSpaces/README.md#layer-p3-almost-purity-and-the-étale-site` |
| PerfectoidTowers | 2414 | P5 | `../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent` |
| PerfectoidTowers | 2414 | P5.1 | `../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent` |
| PerfectoidTowers | 2415 | P5.3 | `../PerfectoidSpaces/README.md#layer-p5-cofiltered-limits-and-finite-stage-étale-descent` |
| PerfectoidTowers | 2415 | P6 | `../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms` |
| PerfectoidTowers | 2415 | P6.14 | `../PerfectoidSpaces/README.md#layer-p6-κ-small-perfectoid-spaces-and-pro-étale-morphisms` |
| PerfectoidTowers | 2415 | P7 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 2415 | P7.1 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |
| PerfectoidTowers | 2415 | P7.2 | `../PerfectoidSpaces/README.md#layer-p7-tilde-limits-and-frobenius-controlled-towers` |

## DiamondsAndVStacks README changes needed — not applied

The following exact line replacements change its P9 supplier to PerfectoidTowers.
There are no P8 supplier references in the current DiamondsAndVStacks README.
These are documentary supplier edges; its Lean file imports only PerfectoidSpaces
and has no references to the declarations assigned to Towers.

| Line | Current text | Needed text |
| ---: | --- | --- |
| 111 | its layer P9 owns function descent over a seminormal rigid base, which 6 uses. | PerfectoidTowers layer P9 owns function descent over a seminormal rigid base, which 6 uses. |
| 192 | - function descent `O_Y = (h_* O_{X_∞})^G` over a seminormal rigid base — PerfectoidSpaces layer P9 | - function descent `O_Y = (h_* O_{X_∞})^G` over a seminormal rigid base — PerfectoidTowers layer P9 |
| 564 | ### From TauCetiRoadmap.PerfectoidSpaces | ### From TauCetiRoadmap.PerfectoidSpaces and TauCetiRoadmap.PerfectoidTowers |
| 620 | with Check `prodProfinite_Zp_sections`). Layer P9: function descent over a seminormal rigid base | with Check `prodProfinite_Zp_sections`). PerfectoidTowers layer P9: function descent over a seminormal rigid base |
| 4633 | is PerfectoidSpaces layer P9 (*descent-of-finite-locally-free-modules*). The statement does not | is PerfectoidTowers layer P9 (*descent-of-finite-locally-free-modules*). The statement does not |
| 4646 | layer A1 (the étale site and the pro-étale site); PerfectoidSpaces layer P9 | layer A1 (the étale site and the pro-étale site); PerfectoidTowers layer P9 |
| 4683 | uses PerfectoidSpaces P9 as specified above. | uses PerfectoidTowers P9 as specified above. |
| 4732 | perfectoid spaces) and layer P9 (descent of finite locally free modules along a pro-étale tower); | perfectoid spaces) and PerfectoidTowers layer P9 (descent of finite locally free modules along a pro-étale tower); |
| 8981 | pro-étale `G`-tower with perfectoid limit, which is PerfectoidSpaces layer P9 | pro-étale `G`-tower with perfectoid limit, which is PerfectoidTowers layer P9 |
| 8990 | faithfulness, p. 15). *Needs:* 6.4; 6.5; 2.9; PerfectoidSpaces layer P9 | faithfulness, p. 15). *Needs:* 6.4; 6.5; 2.9; PerfectoidTowers layer P9 |
| 9249 | (cofiltered limits of affinoid perfectoid spaces) and layer P9 (function descent over a seminormal | (cofiltered limits of affinoid perfectoid spaces) and PerfectoidTowers layer P9 (function descent over a seminormal |

## References in concurrently owned READMEs — not applied

Read-only inspection also found the following P8/P9 references in files that the task
explicitly forbids editing. Their owners should attribute P8/P9 to PerfectoidTowers,
retain P0–P7 attribution to PerfectoidSpaces, and retarget the PartII P8.21 link to
`../PerfectoidTowers/README.md#p821-zariski-closed-loci-in-perfectoid-towers`.
The table records the current source line numbers, which may change during concurrent edits.

| README | Line | Current text |
| --- | ---: | --- |
| AdicSpacesPartII | 4432 | PerfectoidSpaces layer P8 takes "`A` finite over `A^G`" to produce the affinoid structure on `A` |
| AdicSpacesPartII | 7519 | `I_Y·O_{X^ad}`, the input that PerfectoidSpaces layer P8 consumes. *Needs:* |
| AdicSpacesPartII | 9110 | dagger–rigid comparison); PerfectoidSpaces layer P8 consumes the closed adic subspaces of |
| AdicSpacesPartII | 9178 | smooth charts, relative polydiscs and tori. PerfectoidSpaces P0–P4, P7 and P9 use affinoid |
| AdicSpacesPartII | 9180 | over a field. [PerfectoidSpaces P8.21](../PerfectoidSpaces/README.md#p821-zariski-closed-loci-in-perfectoid-towers) |
| AdicSpacesPartIV | 5462 | PerfectoidSpaces P7 and P9 use the sites, sousperfectoid and stable-basis results of R4 |
| AdicEtaleGeometry | 34 | A1, AdicSpacesPartII R0, PerfectoidSpaces P1–P3, P5–P6, P9  → A4 → DiamondsAndVStacks D6 |
| AdicEtaleGeometry | 99 | (*affinoid-etale-finite-stage-assembly*) records from its side. PerfectoidSpaces layers P0–P9, |
| AdicEtaleGeometry | 1521 | PerfectoidSpaces layers P8/P9 use) belong to AdicSpacesPartII layer R0's completed tensors, as its |
| AdicEtaleGeometry | 3872 | - `nuSections_perfectoid_consumer` — PerfectoidSpaces layer P9 uses |
| AdicEtaleGeometry | 3952 | - `galoisCover_perfectoid_consumer` — PerfectoidSpaces layer P9: `F(U) = F(U_∞)^G` for `F` pulled |
| AdicEtaleGeometry | 5451 | geometric points, slices, pro-étale functoriality) and R5, PerfectoidSpaces layers P3–P4 and P9, |
| AdicEtaleGeometry | 9229 | PerfectoidSpaces layer P9's *finite-galois-descent-of-modules*); the packaging of the |
| AdicEtaleGeometry | 9791 | coverings on a stable basis. PerfectoidSpaces layers P3, P5, P6, P8 and P9 cite the named targets |

## Lean outcomes

- `lake env lean TauCetiRoadmap/PerfectoidSpaces/Suggested.lean`: exit 1; initial partition: late P8/P9 examples still in Spaces; corrected. Log: [PerfectoidSpaces-lean.log](PerfectoidSpaces-lean.log).
- `lake env lean TauCetiRoadmap/PerfectoidTowers/Suggested.lean`: exit 1; initial attempt: stale supplier object files hid DiamondsAndVStacks.Geometry and other current APIs; triggered the permitted import build. Log: [PerfectoidTowers-lean-initial.log](PerfectoidTowers-lean-initial.log).
- `lake env lean TauCetiRoadmap/PerfectoidSpaces/Suggested.lean -o .lake/build/lib/lean/TauCetiRoadmap/PerfectoidSpaces/Suggested.olean`: exit 1; intermediate attempt: isolated P9 torsorIso example still in Spaces; corrected. Log: [PerfectoidSpaces-lean-final.log](PerfectoidSpaces-lean-final.log).
- `lake env lean TauCetiRoadmap/PerfectoidSpaces/Suggested.lean`: exit 1; during supplier rebuild: AdicSpacesPartIII.Suggested.olean temporarily absent. Log: [PerfectoidSpaces-lean-verified.log](PerfectoidSpaces-lean-verified.log).
- `lake build TauCetiRoadmap.PerfectoidSpaces.Suggested TauCetiRoadmap.DiamondsAndVStacks.Suggested`: exit 1; PartIII:23055 missing Algebra instance on the thickening stalk/residue field; PartIII source was subsequently corrected by its owner; same authorized command retried. Log: [PerfectoidSpaces-import-build.log](PerfectoidSpaces-import-build.log).
- `lake build TauCetiRoadmap.PerfectoidSpaces.Suggested TauCetiRoadmap.DiamondsAndVStacks.Suggested`: exit 1; analytic suppliers rebuilt successfully; PerfectoidSpaces exposed the renamed PerfectoidInput predicate and removed adic Chart wrapper, both adapted to the current supplier declarations. Log: [PerfectoidSpaces-import-build-retry.log](PerfectoidSpaces-import-build-retry.log).
- `lake env lean TauCetiRoadmap/PerfectoidSpaces/Suggested.lean`: exit 1; 9 diagnostics caused by the supplier predicate/chart changes described above; corrected. Log: [PerfectoidSpaces-lean-accepted.log](PerfectoidSpaces-lean-accepted.log).
- `lake env lean TauCetiRoadmap/PerfectoidSpaces/Suggested.lean`: exit 0; 3330 warnings, all exactly declaration uses `sorry`; zero errors and zero other warnings. Log: [PerfectoidSpaces-lean-success.log](PerfectoidSpaces-lean-success.log).
- `lake build TauCetiRoadmap.PerfectoidSpaces.Suggested TauCetiRoadmap.DiamondsAndVStacks.Suggested`: exit 0; Build completed successfully (9230 jobs). Log: [PerfectoidSpaces-import-build-final.log](PerfectoidSpaces-import-build-final.log).
- `lake env lean TauCetiRoadmap/PerfectoidTowers/Suggested.lean`: exit 1; current diamond APIs elaborated, but the removed analytic morphism/chart wrappers required direct PartII supplier references; corrected. Log: [PerfectoidTowers-lean-fresh.log](PerfectoidTowers-lean-fresh.log).
- `lake env lean TauCetiRoadmap/PerfectoidTowers/Suggested.lean`: exit 1; four continuous-differential errors identified local noetherian proofs previously bundled in the old smoothness wrapper; made explicit without changing the target or Checks. Log: [PerfectoidTowers-lean-success.log](PerfectoidTowers-lean-success.log).
- `lake env lean TauCetiRoadmap/PerfectoidTowers/Suggested.lean`: exit 0; 433 warnings, all exactly declaration uses `sorry`; zero errors and zero other warnings. Log: [PerfectoidTowers-lean-verified.log](PerfectoidTowers-lean-verified.log).
