# Handoff — BP-EtaleDualityAndPerverseSheaves--EDC.5

Worker: Claude (session claude-4vCUBq), 2026-10-13. Issue #9409.

## What is done

Stage `EtaleDualityAndPerverseSheaves:EDC.5` (the early perverse category and intermediate extension) is planned at
target level in `research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.5.json`: 29 nodes (16 theorems,
7 constructions, 6 definitions), 117 API items, 64 unit tests, 6 planets, 19 pinned Mathlib declarations (each read in
its source file at 082e2d3). The packet status is `complete` and the stage coverage is `planned`.
`python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings (with the pinned declaration index).

- EDC.5a (abstract): abelian heart through Mathlib's `AbelianSubcategory.abelian`, t-cohomology, t-exact functors,
  recollement, gluing (BBD 1.4.10–1.4.19 and the converse 1.4.12), abstract j_!* with the simple objects (1.4.22–1.4.26),
  tilting along a torsion theory (Juteau 1.3.6). No other roadmap, Tau Ceti or TauCetiRoadmap plans these.
- EDC.5b: dimension of a point (dimension, not codimension), the middle perverse t-structure for any field k and any
  noetherian Λ killed by an invertible n (reduction to k^perf by topological invariance), perverse sheaves as a stack,
  shifted local systems, open–closed recollement, ℓ-adic O/E perverse t-structures, nonconstructible stalk/costalk
  conditions with their continuity (for the IG.4/LPV.6 requests).
- EDC.5c: quasi-finite/finite/étale exactness, fibre-dimension amplitude, smooth pullback with its shift and full
  faithfulness, perverse Artin vanishing, affine open complements (BBD 4.1.10–4.1.12), t-exactness of ⊠.
- EDC.5d: j_!* (strict bounds, transitivity), Deligne's truncation formula under its local-constancy hypothesis,
  low-degree cohomology of j_!* across a boundary of codimension ≥ c (this serves the H.5 request), IC_X(L) with
  independence of the smooth open, finite length and simple objects.
- EDC.5e: Verdier self-duality for self-injective and rational coefficients with D IC_X(L) ≅ IC_X(L^∨(d)); integral
  p and p⁺ exchanged by duality.
- EDC.5f: semismall pushforward (stratum by stratum, support by compact-support bounds, cosupport by duality) and
  small maps to IC.

## Relation to the earlier draft inside the EDC.4 packet

`EtaleDualityAndPerverseSheaves--EDC.4.json` (scope EDC.4–EDC.8, review needs_changes after three rounds) holds 48
draft nodes with ids `EtaleDualityAndPerverseSheaves:EDC.5/...`. The validator forbids two packets of one roadmap from
sharing ids, so this packet uses new ids; its field `supersededDraftNodes` maps every draft id to its replacement.
Needed follow-ups for the maintainer or the next EDC.4 round:

1. Drop the EDC.5 draft nodes (and EDC.5 from the scope) of the EDC.4 packet, keeping its E11–E15 source issues.
2. Point the accepted consumers at the new ids:
   - GeometricSatakeAndFusion--GS0: `intersection-complex` → `intersection-complex-of-local-system`,
     `perverse-recollement` → `open-closed-perverse-recollement`, `perverse-t-structure` → `middle-perverse-t-structure`,
     `affine-perverse-artin-vanishing` → `perverse-artin-vanishing`, `semismall-pushforward-perverse` →
     `semismall-pushforward-perversity`.
   - IgusaVarietiesAndTorsionConcentration: `t-exact-functor` → `t-exact-functors`, `perverse-t-structure` →
     `middle-perverse-t-structure`, `affine-perverse-artin-vanishing` → `perverse-artin-vanishing`.
   - SchemeAndStackFoundations--SF.0: `perverse-t-structure` → `middle-perverse-t-structure`.
3. The draft's EDC.5 nodes cited `EDC.6/classical-and-proetale-adic-categories`, although EDC.6 is downstream of EDC.5
   in the atlas. Here the ℓ-adic formalism is requested from SchemeAndStackFoundations:SF.2 instead.
4. The draft's open target (general semismall pushforward, gap added by REV-…EDC.4~3) is closed here: the hypothesis is
   that K and D_X K have locally constant cohomology on the source strata; support comes from compact-support bounds on
   the fibre pieces and cosupport from duality; no product charts or local triviality are needed. The integral (ℤ_ℓ)
   version is not asserted.

## Confirmed red-team findings handed to this job

- RT-AREA-etale/3 (stacks): EDC.5 stays scheme-only. The gap "Perverse sheaves and IC on algebraic stacks" names the
  consumers; the restructure entry endorses EDC.0's stacks Part II and names the EDC.5 nodes its layer (3) starts from
  (perverse t-structure, smooth-pullback exactness for smooth descent, j_!*, IC).
- RT-AREA-etale/16 (perfect schemes, equivariant, hyperbolic localization): same treatment for EDC.0's perfect-schemes
  Part II; the finite-type nodes it transports are listed in the restructure entry, and topological invariance (requested
  from SF.2) is the bridge for perfections.

## Requests (all to SchemeAndStackFoundations:SF.2)

Artin's affine theorem (SGA 4 XIV 3.1–3.2); topological invariance of the étale site (Stacks 04DY); π₁ surjectivity for
open subschemes of unibranch schemes (Stacks 0BQI); the ℓ-adic constructible formalism with duality (Weil II 1.1.2–1.1.3,
BBD 2.2.14–2.2.18); proper/smooth base change, finiteness and Künneth in the forms used (overlapping EDC.0's requests).
The node `SchemeAndStackFoundations:SF.2/cohomology-filtered-colimits` (SF.2 packet, not yet accepted) is cited directly.

## Gaps

Trait-relative perverse t-structure (LPV.0 request; needs the unowned absolute purity recorded by EDC.0); O_C/p-model
pushforward comparisons (IG request, part (ii); part (i) is supplied); relative perverse t-structure/ULA over a curve
(GlobalShtukas GS.1); compactifications and boundary strata (GlobalShtukas GS.6); stacks; perfect schemes.

## Stage edges

New prerequisite edges: SF.2 → EDC.5 (no cycle; checked on data/atlas.json requires + stageEdges) and the same-roadmap
EDC.3 → EDC.5 (smooth-pair purity), which promotion does not draw; flag it as a declared edge.

## Source issues

New: EtaleDualityAndPerverseSheaves/E16 (BBD 4.1.3's proof cites 4.1.7 for 4.1.1) and /E17 (BBD 4.3.3–4.3.4 cite
"1.4.2.5" for 1.4.25), both checked on page images, both misprints affecting nothing. Inherited, not re-recorded:
E11 (BBD 2.2.12 inequalities), E12 (4.3.1 coefficient label), E13 (Zhu IC normalisation), confirmed by
REV-EtaleDualityAndPerverseSheaves--EDC.4~3 and listed in `inheritedSourceIssues`.

## Suggested Lean file

`research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.5.lean` (781 lines, Mathlib-only imports) was
compiled with `lean-check` at Mathlib 082e2d3: no errors, the only warnings are the 48 "declaration uses sorry".
`scripts/check_sorry_data.py` passes (no data definition has a `sorry` body; the glued and tilted t-structures have
real aisles and only their proof fields open). It types 56 packet names (t-exactness, heart abelian structure,
t-cohomology, heart functors, recollement, glued t-structure, abstract j_!* and simple classification, tilt, point
dimension, the upper perverse stalk condition on Mathlib's étale derived category); the other 153 names need carriers
absent at the pins (i^!, Rf_!, constructibility, ℓ-adic categories) and are listed in the file's closing comment.

## Sources

Read: BBD (Numdam, sha256 b1e10440…) §§1.3–1.4, 2.1–2.2, 3.3, 4.0–4.3; de Cataldo–Migliorini arXiv:0712.0349v2 §4.2;
Juteau's thesis arXiv:0901.3671v1 §§1.1–1.3; Stacks tags 04DY, 0BQI. Not used: Kiehl–Weissauer and Achar (not freely
available); Zhu (arXiv:1407.8519) and Yun–Zhang were cited by the draft but not re-read, so they are not cited here.

## What remains

Replace the five SF.2 requests by accepted supplier nodes when they exist; lemma-level splitting when the roadmap
nears the front of the line; the gaps above belong to other owners or to the Part IIs.
