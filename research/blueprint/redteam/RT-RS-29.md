# RT-RS-29

Red team against the accepted restructuring proposal `RS-29`, which makes the proposed
roadmap **Inverse Galois theory and arithmetic fundamental groups** a Part II of the Tau
Ceti roadmap **Belyi maps, dessins d'enfants, and three-point covers**: it narrows five of
the seven IG layers, keeps two, and records 25 owner reassignments and 30 supplier links.

**No finding.** The proposal survived every check the job names, and the one surface that
looked like a finding turned out to be a documented, deliberate choice. What follows is
what was attacked, so that the clean result means something.

## Structure

**The Part II title obeys section 15.** The parent's atlas title is "Belyi maps, dessins
d'enfants, and three-point covers"; the proposed title is exactly that, followed by
", Part II: inverse Galois theory and arithmetic fundamental groups". An exact prefix
extension, not a paraphrase.

**The choice of parent is supported, not arbitrary.** Anchoring a general inverse-Galois
roadmap on the three-point special case is the proposal's largest decision, so it was
tested against the proposal's own reassignments: 15 of the 25 move targets to BelyiMaps
layers. BelyiMaps is the dominant supplier.

**Every endpoint resolves.** All 25 owner entries, all 26 `suppliedBy` entries and all 30
links point at real atlas stage ids. The one exception is the sentinel
`UPSTREAM:Mathlib-Galois-category-classification`, which is house practice — `UPSTREAM:`
sentinels appear in nine accepted restructure result files, and this one in four.

**Nothing is dropped.** All seven IG stage descriptions were read in full, and each
Construction and Acceptance clause was matched against that layer's `keeps` text plus the
owner entries whose `formerly` names it. Every target is kept, moved or supplied — the
acceptance tests explicitly included: IG.1 keeps the finite-field Frobenius and
punctured-curve instances and the wild-inertia kernel with nontrivial examples; IG.3 keeps
the dessin/triple comparison, the branch-cycle check and the passport that does not
determine the pair; IG.6 keeps the theorem-indexed solved-family list and marks the
unrestricted inverse Galois problem over ℚ and generic-polynomial universality as frontier
statements rather than proved inputs.

**No consumer loses a prerequisite.** The seven IG stages have exactly nine recorded
consumer edges — the number RS-29.md claims to preserve. The one outside consumer that
narrowing could have stranded, `ArithmeticDynamics:DY.5` (a consumer of IG.0), is given
its own direct supplier edge from `ModularCurves 0d` rather than left to a narrowed IG.0;
`AnabelianGeometryAndNonabelianChabauty:NC.0`, the outside consumer of IG.1, receives
edges from IG.0 and from BelyiMaps layer 12.

**No cycle.** None among the 30 links, and none in the combined graph of the atlas's 3458
existing stage edges together with the 29 non-sentinel links; the existing graph was
acyclic too, so none is introduced. The new `NC.0 → IG.6` edge is safe in particular:
NC.0 depends on IG.1, and IG.6 is downstream of IG.1 through IG.2–IG.5.

**No Tau Ceti roadmap changes.** The `layers` dictionary contains only the seven IG stage
ids. Targets assigned to Tau Ceti layers are ones those layers already contain — which is
the next check — so this is import, not re-planning.

## Ownership, checked in the owners' own words

All 24 non-sentinel owner entries were matched term by term against the owner stage's
title and description; the six weakest or most load-bearing were read by hand, and all
hold:

- BelyiMaps layer 1 does carry the normalizer formulation, at its subsection 1.3, so
  "Ordered passports and normalizer-orbit interpretation" is genuinely owned.
- BelyiMaps layer 6 classifies connected numbered covers by connected triples.
- PolynomialGaloisGroups layer 9 promises "for every `n ≥ 1` there is an explicit monic
  `f : ℤ[X]` of degree `n`, irreducible over `ℚ`, whose Galois action on the roots is the
  full symmetric group" — the explicit Sₙ realization it is given.
- LocalFieldsRamification layer 2 proves `Gal(K^{ur}/K) ≅ Ẑ` with `Ẑ ≅ lim ℤ/n`, which is
  the "Frobenius inverse-limit computation" assigned to it.

The proposal also cites four subsections of BelyiMaps layer 12 **by number**, and all four
are right: 12.5 is "The geometric fundamental group", defining `π₁ᵍᵉᵒ = Gal(Ω/ℚ̄(t))`; 12.6
is "The comparison isomorphism", `π₁ᵍᵉᵒ ≃ profiniteCompletion (FreeGroup (Fin 2))`; 12.8 is
"The arithmetic extension and the outer action", with
`1 → π₁ᵍᵉᵒ → Gal(Ω/ℚ(t)) → Gal(ℚ̄/ℚ) → 1`; 12.9 is "Peripheral inertia, and the orientation
of the comparison".

## The one library claim

The proposal's IG.0 reason names "`PreGaloisCategory.functorToContAction` and its
`IsEquivalence` instance under `GaloisCategory C` and `FiberFunctor F`". At the pinned
commit, `Mathlib/CategoryTheory/Galois/Equivalence.lean` declares `functorToContAction` at
line 40 and `instance : (functorToContAction F).IsEquivalence` at line 90, both governed by
the variable block `[GaloisCategory C] [FiberFunctor F]` at line 33. Exact, hypotheses
included.

## Duplication left standing

A restructuring proposal that misses duplication has failed at its own job, so the two
layers it does **not** narrow were checked against the whole atlas. Hilbert irreducibility
(IG.2) occurs in no other roadmap. Hurwitz moduli (IG.5) occurs in no other roadmap, and
`AlgebraicModuliForArithmeticGeometry:R09.4`, which IG.5 depends on, is general
algebraic-stack theory with no Hurwitz content. IG.4's retained Shafarevich solvable
realization theorem is not duplicated by `ProfiniteProPGroups` layer 5 either: that layer's
only Shafarevich is the Golod–Shafarevich inequality, and it contains no realization
statement at all — exactly what the proposal's reason asserts.

## What looked like a finding, and why it is not reported as one

BelyiMaps layers 7 to 14 each open with

> **Owner:** successor roadmap `BelyiAnalyticCovers` [or `BelyiAlgebraicAndDescent`, or
> `BelyiArithmeticActions`]. Retained here as a dependency specification; no milestone of
> this layer is a declaration or a completion claim …

and **ten of the 25 owner entries and twelve of the 30 links land on those disclaimed
layers**. On its face that is "an owner that does not own what it is said to".

Three things clear it. None of the three successors exists as an atlas roadmap or stage, so
there is no id to point at. RS-29.md states the situation and the choice outright — "These
are ownership contracts in that document. They are not substituted with invented atlas
stage IDs: the JSON uses the existing `tauceti:TauCetiRoadmap/BelyiMaps#layer-…` IDs that
retain those contracts", and "Their absence as separate atlas stages is recorded here, not
repaired by creating phantom IDs". And the `owners` schema — `target`, `owner`, `formerly`
— has no field in which a successor contract could be recorded, so carrying it in the JSON
would need a schema change that is not this proposal's to make.

The dependency risk is real: IG.3 and IG.6 are made to depend on layers that nothing is
currently committed to building. But it is pre-existing rather than introduced here —
IG.3's own stage text already said to consume those successors — and the proposal records
it rather than hiding it. A verifier who disagrees with that judgement has the evidence
above to act on.

## The proposal's own self-validation

A proposal that miscounts its own checks is worth doubting, so its claims were recounted.
The family evidence file lists exactly 15 evidence pairs, and every one is represented by a
supplier link or a `suppliedBy` entry. The nine consumer edges it claims to preserve are
exactly the nine the atlas records for the seven IG stages.

## What I did not do

No Lean was compiled and nothing here is formalised; a restructuring proposal is a
statement about ownership and edges, not a blueprint packet. The one declaration the
proposal cites was read at the pinned commit. I did not re-derive the mathematics of the
Belyi or SGA layers themselves — only that the owner stages say what they are said to say,
and that the targets survive the restructure.
