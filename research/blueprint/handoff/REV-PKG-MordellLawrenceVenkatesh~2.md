# REV-PKG-MordellLawrenceVenkatesh~2 — completed

Issue #7939; independent reviewer Codex, session `codex-NgYz6n`; 2026-10-14.
Verdict: accepted after fixes. No package defect remains to resume. The full
review, source sample, ten signature comparisons and 165-target adversarial
audit are in `research/blueprint/reviews/REV-PKG-MordellLawrenceVenkatesh~2.md`.
Neither package-author job was done by this reviewer. The packet was not edited.

## Changes and ownership

Restored integral Weil-polynomial finiteness and the finite Frobenius test set
as LV.1.1–1.2; the resulting finiteness lemma is LV.1.3. Removed the old local
rank-one algebraicity target. Old LV.1.1–1.8 therefore become LV.1.3–1.10;
old LV.1.9 is supplied by PadicHodgeTheory R06.2; old LV.1.10–1.16 become
LV.1.11–1.17. The final numbering in the README is authoritative.

Removed or narrowed duplicate developments, with their exact replacements:

- Semisimple trace rigidity: ArithmeticGaloisRepresentations §1.8. Its stable
  lattice input is §1.6. No local replacement trace theorem is proposed.
- Local rank-one de Rham algebraicity: PadicHodgeTheory R06.2; the boundary
  states the filtration-jump sign and the unit Artin-map normalization.
- Basic affine group carrier, order and Frobenius-group structure: current
  `GroupTheory/SpecificGroups/Affine/`. LV.0.7 keeps the faithful permutation
  image; LV.0.8–0.10 keep the prime-field cycle, normalizer and counting inputs.
- Symplectic connectedness and root generation: current
  `TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra`
  and `TauCeti.GLSymplecticFin.eq_top_of_root_subgroups`, transported by a
  symplectic basis. The unused LefschetzPencilsAndVanishingCycles Lie-generation
  supplier was removed. LV.0.17 retains geometric normal-subgroup/centre scope.
- Basic subgroup closure and image construction: ArithmeticGaloisRepresentations
  §7.6; LV.0.15 retains finite-index, normality and connected-generation properties.
- Boundary collars: current Brown collaring and GeometricTopology Layer 1;
  LV.5.7 retains annular neighbourhoods and cutting with descent compatibility.
- Strassmann: EffectiveDiophantineMethods ED.4, solely a supplier boundary.

Retained variants are explicitly distinguished from current symmetric finite
pairings, real Lagrangian criteria, existence of an unprescribed symplectic
basis, smooth-surface duality and local induction. The report records the
current-roadmap/library comparison, including all nine post-snapshot roadmaps
and the four named Completed roadmaps.

Other mathematical fixes include locally closed geometric orbits; spanning and
nonabelian simplicity hypotheses in symplectic/Goursat arguments; finite
splitting-extension dimension descent; low-degree pointed-set homotopy;
surface asphericity and Hamstrom attribution; smooth-base, constant-dimension
scaled-idempotent kernel/Prym construction; disconnected primitive homology;
and positive coprime multiplier representatives for the short-orbit bound.

## Port order and downstream routing

MordellLawrenceVenkatesh is outside the 94-roadmap Caraiani–Newton order.
Port only after its consumed supplier portions are upstream. In particular,
the Faltings dependency is **R28.1 bounded-degree, bounded-ramification Hermite
finiteness**, not R28.4. The directed stage order is R28.1 → LV.1 → R28.4.
Current Completed/EffectiveBounds supplies bounded-discriminant Hermite
finiteness and does not replace this bounded-ramification contract by itself.

The Faltings roadmap's owner should route its semisimple trace reference to
ArithmeticGaloisRepresentations §1.8 and its Weil-polynomial/test-set references
to LV.1.1–1.2. Its later isogeny stages must not be imported back into LV.1.
No other roadmap's files were edited in this review. The shared S-unit and
Mordell end declarations retain their stated owners; this package supplies
independent Lawrence–Venkatesh proofs.

## Validation and next step

The compact Suggested.lean has 785 lines, 45 theorems and 23 examples; its
closing inventory explains omitted heavy carriers and partial selected
consequences. Final `lean-check` exited 0 with 70 declaration-uses-`sorry`
warnings and no other warnings or errors. Data definitions have real bodies.
The unchanged 146-node packet passed `scripts/check_blueprint.py` with zero
errors and warnings. All changed deliverables and this handoff passed file
intake with zero problems. Metadata remains exactly `topic = "math.NT"`.

Current comparison commits: TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`; Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Mathlib elaboration pin:
`082e2d37`. Source checks used public copies, recorded by printed page numbers
in the report; no source passage or source file is retained in the repository.

Next step is the maintainer's upstream draft PR using the package and accepted
review. Follow the 2026-10-12 compact Lean shape; the earlier review's demand
for exhaustive heavy-carrier signatures and the old 200 KB ceiling are
superseded. There is no unfinished worker checkpoint and no scratch dependency.
