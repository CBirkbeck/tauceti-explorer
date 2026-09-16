# Review of AUDIT-02

**Reviewer:** REV-AUDIT-02 · **Date:** 2026-09-16 · **Verdict:** accepted · **Corrections:** 3 (all additions to the duplicate lists)

Batch: `research/blueprint/audit/AUDIT-02.json` — 5 roadmaps, 37 layers, 254 targets, 519 cited
declarations, 94 duplicates. Baseline: tauceti `f790474`, mathlib `082e2d3`.

## What was checked

**Citations (all 519).** Every cited declaration exists in the pinned baseline at exactly the claimed
library, file and line — no wrong name, file or line anywhere. No cited file contains the token
`sorry`, and nothing cited is an axiom (191 `def`, 180 `theorem`, 46 `structure`, 36 `abbrev`,
31 `lemma`, 18 `class`, 17 `instance`).

**Statements (about sixty presence claims, read in the Lean source).** All four `built` layers and
the ten `partly built` ones, including `HodgeStructureOn` and `isInternal_piece`, the three
strictness theorems, the fine conjugation relation `map_latticeConj_deligneSplitting_sup_below`,
`finsum_hodgeNumber_eq_finrank`, the weight-one eigenspace comparison and its converse,
Mathlib's two Minkowski convex-body theorems and Blichfeldt, `covolume_eq_det` and the number-field
covolumes, `finrank_pic` and `natCard_torsion`, `AbelianVariety` with its isogeny file,
`LineBundleClass`, `CartierDivisor`, and the Tau Ceti scheme-cohomology files. Hypotheses and
generality match the target text in every case; the notes are unusually precise about the fine
print (the `[Nontrivial E]` in the non-strict Minkowski theorem, the `coheight ≤ 1` hypothesis of
`equivCartierDivisor`, `LineBundleClass` being only a `CommMonoid` because duals are not built,
`AbelianVariety.dim` being the topological Krull dimension with nothing computing it).

Two index-order traps were checked and the audit is on the right side of both: `deligneSplittingBelow
p q` is `⨆_{r<p, s<q} I^{r,s}`, so the claimed relation `conj I^{p,q} ≡ I^{q,p} mod ⨆_{r<q, s<p}`
is the statement actually proved; and `Pic(T) → Coker(A)` is injective with surjectivity iff every
weight is 1, as claimed.

**Absences (all 199 absent/partial targets re-searched independently)** by concept and by Mathlib
naming convention, against `declarations.tsv` and both Lean trees. Every absence holds, including
all the ones with standard names: no successive minima or Minkowski II; no Witt or Grothendieck–Witt
ring, Hilbert symbol, Hasse or Clifford invariant, genus or spinor genus; no mass formula,
representation density or theta series of a lattice; no LLL or short-vector API; no equidistribution,
Ratner, Howe–Moore, Mahler compactness, Siegel mean value, packing density or Hermite constant; no
hermitian K-theory. On the geometry side: no syntomic or lci morphisms, no nodal morphisms, no dual
graph, no coherent sheaves, dualizing sheaf, ampleness, effective Cartier divisors, relative Proj,
scheme blowup, intersection numbers, regular or minimal models, prestable/stable curves, clutching
or stable maps. On the Galois side: no Hochschild–Serre, `lim¹`, cohomological dimension, local
invariant map, Poitou–Tate or Galois-cohomological Selmer group.

**Verdicts.** The four `built` layers (Hodge L0, L1, L3 and GN.0) and the ten `partly built` ones
agree with their layer descriptions. No verdict changed. The conservative calls (Hodge L2
`partly built` because the abelian structure on mixed Hodge structures is missing though the
milestone is proved; R02.4 `not built` although one target is present as an upstream generic
construction) are each argued in the entry itself and are defensible.

**Duplicates.** All 94 resolve to real atlas stages, none of them in the retired
`FoundationsAndLibraryIntegration`, and each claimed overlap is borne out by the cited stage's own
description.

## Corrections

Three duplicates were missing; all three are added to `AUDIT-02.result.json`.

1. **StableReduction layer 7** → `NeronModelsAndSemistableAbelianVarieties:R11.3`. R11.3 proves
   semistable reduction for abelian varieties after a finite extension with the monodromy criterion
   on the Tate module. Layer 7's last target is the equivalence between semistable reduction of the
   curve and of its Jacobian, so the two layers state the same theorem from opposite sides.
2. **StableReduction layer 6** (which had no duplicates at all) →
   `NeronModelsAndSemistableAbelianVarieties:R11.4`, which constructs the degree-zero Picard group of
   semistable curves, the toric character group from the dual graph and the component group —
   overlapping targets [10] and [11].
3. **JacobianChallenge layer D**, target "General Picard scheme … via Hilbert/Quot schemes" →
   `AlgebraicModuliForArithmeticGeometry:R09.2`, the atlas owner of the Hilbert and Quot functors.

Two further candidates were considered and rejected as consumers rather than duplicates:
`SelmerIwasawaCohomology:L1` imports Poitou–Tate from R02 and says explicitly it is "not a second
proof owner", and `ShimuraData:D1` names the HodgeStructures API as a dependency.

## Notes

- The audit's remark that the Hodge `STATUS.md` of 2026-09-01 is out of date is correct: that file
  records the coarse conjugation relation modulo `W_{p+q−2}` and "internal Hom untouched", while at
  the pinned commit both the fine relation and `internalHom` are proved. The audit tracked the pin,
  not the status note.
- Outside the audit's scope: the GN.0, GN.1, GN.5 and GN.6 layer descriptions still list
  `FoundationsAndLibraryIntegration:LI.1`–`LI.4` among their inputs, and that roadmap was retired on
  2026-09-16.
