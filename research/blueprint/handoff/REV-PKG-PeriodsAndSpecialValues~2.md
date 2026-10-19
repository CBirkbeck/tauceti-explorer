# REV-PKG-PeriodsAndSpecialValues~2

Issue #11114; Claude (Opus 5.5), session `claude-GCiG4Y`; 2026-10-19. Base commit `18a056bdf`; branch `claude-GCiG4Y-REV-PKG-PeriodsAndSpecialValues-2`. The claim bot confirmed this session. This was the only job claimed in this run.

**Complete.** Verdict `accepted`, recorded in `research/blueprint/packages/PeriodsAndSpecialValues/review.json`. The full report is `research/blueprint/reviews/REV-PKG-PeriodsAndSpecialValues~2.md`. The package README and Suggested.lean were corrected in place. metadata.toml is unchanged (`topic = "math.NT"`).

## What changed

- PS.8.17 is rewritten as a rational comparison theorem. Its proof route is the residue isomorphism, then Kedlaya Lemma 2.3.6 for uniqueness of the Frobenius structure, Park Proposition 5.2 for the constant, and Kedlaya Lemma 2.3.8 with a coefficient argument at λ=0. The integral lattice is now the predicate `QuinticBoundaryLatticeIntegral`, with a valuation consequence that depends on p (v₃(Δ₃) ≥ −4 at p=3).
- PS.5.4: `abelianTate_ETNC` is an explicit target descended from IntegralIwasawaTheory §11.7. Supplier citations are corrected: Néron Layer 6 §6.10, TauCetiRoadmap IntegralHeckeAndGaloisDeterminants §0.6, package layer numbers for BorelRegulators and MotivicEtaleKTheory, and the MC.2/MC.4 statements. Three locators are fixed and process language removed.
- Suggested.lean: two library-only examples removed and the closing comment cleaned. lean-check exit 0, 44 `sorry` warnings only.

## For the maintainer: supplier work this package waits on

These four items are requirements on other roadmaps, stated at the targets that use them. None can be planned inside this package, because three are needed by lower roadmaps too and the fourth belongs to a routed roadmap.

1. MotivesAndAlgebraicCycles MC.5 `completion-de-rham-interface`: the arbitrary-pair de Rham–Betti comparison. MC.5's own gap proposes a ComplexComparison continuation for it.
2. GeneralAlgebraicKTheory Layer 4: Deligne's virtual objects and determinant functor over noncommutative rings, also requested by NoncommutativeAndEquivariantIwasawa (packet request to GAK:K.4).
3. MotivesAndAlgebraicCycles MC.2/MC.4: the newform eigenprojector motive with its comparison, the Adams K-theory comparison for number fields, and relative-cohomology framed motives.
4. ArithmeticLevelRaisingAndBipartiteEulerSystems: routed by PAPER-LIU-ETAL-22 but not yet designed.

No suspicious instructions were met in fetched papers, other packages or handoff notes. Source downloads and scratch scripts are deleted when this run ends; the hashes are in the report.
