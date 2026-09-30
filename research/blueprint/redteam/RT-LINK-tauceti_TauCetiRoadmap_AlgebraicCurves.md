# Red team: the AlgebraicCurves link map

Claude Code, session `cc-c2c06b`, 30 September 2026, at repository revision `2bfd3bd2`.
Target: `LINK-tauceti_TauCetiRoadmap_AlgebraicCurves`, accepted by
`REV-LINK-tauceti_TauCetiRoadmap_AlgebraicCurves`. Issue #4342. I did not write or
review the target.

**Result: two findings, one medium and one low.** The map is careful work. All 46 links
and 11 overlaps have literal quotes on existing endpoints, and the directions and review
boundaries survive attack. The medium finding is not an error in either map read on its
own. It is a hole between two maps whose reviews merged seven seconds apart.

## Finding 1 (medium): four supplier edges lost to circular deduplication

ModularCurves Layer 10 needs a Hurwitz/different package, and it names its supplier
precisely. The Algebraic Curves roadmap:

> owns the different divisor, Dedekind's different theorem, and the Hurwitz genus formula
> (its Layer 7), the lower-numbering ramification groups … with **Hilbert's different
> formula** … (its Layer 8 …), and the Kähler-differential comparison (its Layer 9); its
> Layer 12 dictionary carries those function-field statements to the smooth proper fibres
> used here

The layer itself calls this "a named dependency package, not a footnote".

Both link maps saw these four edges, and each review handed them to the other:

| Map | What its accepted review did with Layers 7, 8, 9, 12 → MC Layer 10 | Merged |
| --- | --- | --- |
| AlgebraicCurves (this target) | moved to `alreadyRecorded`, `recordedIn` the ModularCurves map ("deduplicate against the ModularCurves packet") | `c9da9073`, 23 Sep 16:28:55 UTC |
| ModularCurves | `review.removed`: "Already in AlgebraicCurves packet." | `12bb58b6`, 23 Sep 16:29:02 UTC |

Neither the research copies nor the promoted copies in `data/links` carry them. I ran the
production assembler at `2bfd3bd2`. It gives 2840 stages and 8007 edges, and **no edge from
any AlgebraicCurves layer into ModularCurves**. Adding the four pairs in memory gives 8011
edges and no cycle.

**Fix:** record them once, in this map, since the ModularCurves review deliberately removed
them there. Move AC-L28–L31 into `links` with their existing evidence, with confidence
`inferred`: the consumer names the supplier's layers, but the AlgebraicCurves document never
names ModularCurves. Keep AC-L31's caveat that relative χ-constancy is not supplied. Then the
corrected map needs a renewed review before it is promoted.

This is the same failure mode as the OrthogonalL2Bases verification's observation, where an
edge was left only in `alreadyRecorded`. An `alreadyRecorded` entry should be accepted only
when the named file carries the edge *and* that file has been promoted.

## Finding 2 (low): two examined notes contradict accepted restructurings

- **InverseGalois:** the map's examined note says "No AlgebraicCurves output". Accepted RS-29
  makes Layer 8 the owner of finite function-field decomposition and inertia groups (formerly
  IG.1), and links Layer 8 → IG.1.
- **KTheoryLowDegrees:** the map's examined note says "no AlgebraicCurves output". Accepted
  RS-18 lists Layer 12 among Z.5's suppliers and links Layer 12 → Z.5 and → Z.6.

All three edges are live through `data/restructure`, so only the record is wrong. RS-18 was
promoted before this map's review (21 September). RS-29 was promoted after it (23 September,
20:22 UTC).

## What held up

**Mechanics.** `check_links.py` reports 0 errors and 0 warnings. Every quote is a substring
of its stage text or roadmap document. For MordellLawrenceVenkatesh I read the stage text
from `research/blueprint/roadmaps/`. 45 of the 46 links are live. Link 43, to LV.8, is
correctly held in `deferredLinks` until LV is promoted.

**Reverse links (4–8, 44).** Each consumer really uses what the supplier states:

- EllipticCurves' `toClass_surjective` closes Layer 10's `E(k) ≅ Cl⁰` triangle.
- The invariant differential is Layer 9's genus-1 test.
- The isogeny type is 12C's acceptance instance.
- JacobianChallenge A/B are 12E's named prerequisites.
- LocalFieldsRamification Layer 3 supplies Layer 8's finite-residue upper numbering.

**A library claim.** Link 4's review boundary says `Point.toClass_surjective` "is already
proved at the pin, with no ellipticity assumption". That is true, but in Tau Ceti:
`TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/ToClass.lean:655`, with only
`[DecidableEq F]`. Mathlib has `Point.toClass`, but not the surjectivity.

**Negative decisions I tried to overturn:**

- **ComplexComparisonPartII C4** builds smooth completions of affine curves from "the existing
  curve normalization theory". 12C proves essential surjectivity only for projective models,
  and no layer states the open embedding of an affine curve, so there is no exact match.
- **JacobianChallenge Layer E.** The AlgebraicCurves document says Layer E's `dim Jac = g`
  "consumes this roadmap's genus". But JacobianChallenge defines `g := dim H¹(X, 𝒪_X)` itself
  in Layer B, and uses that. The map was right to follow the consumer's text.
- **SchemeKTheoryOperations S.7** is general GRR. **KU-geometry** points to a pseudo-supplier
  for vector bundles, which no layer here provides. **EllipticKTheory E.7** has an ambiguous
  supplier, as the map records.

**Catalogue screen.** I searched every stage not already joined to AlgebraicCurves for the
roadmap's vocabulary: Riemann–Roch and Riemann–Hurwitz, differentials, codes, model classes,
Weierstrass points, constant fields, Artin–Schreier and Kummer covers, Tsen, Carlitz,
Drinfeld, and rational function fields. I read every hit in context. None is a missed direct
consumer:

- analytic or topological Riemann–Hurwitz (BelyiMaps, ModularForms, FuchsianOrbifolds);
- Tate's adelic Riemann–Roch (AN.4);
- coherent H¹-vanishing on modular curves (AlgebraicModularForms R15.2, whose natural owner
  is JacobianChallenge Layer B; it records no `requires` at all, but that is outside this
  map);
- Clifford algebras and Drinfeld level structures;
- curves arriving through FunctionFieldArithmetic or SF.3;
- example-only uses, such as FunctionFieldArithmetic FA.7's hyperelliptic acceptance case.

Layer 11 (automorphisms, the 84(g−1) bound) has no consumer anywhere in the atlas.

**Overlaps.** The Tau Ceti–Tau Ceti overlaps are `keep`, as §15 requires. The
FunctionFieldArithmetic rescopes (overlaps 5–7) agree with the owners table of the
(unaccepted) RS-04, which proposes FunctionFieldArithmetic as a Part II of AlgebraicCurves.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_AlgebraicCurves.result.json`:
  ok.
- No Lean was compiled. None belongs to this job.
