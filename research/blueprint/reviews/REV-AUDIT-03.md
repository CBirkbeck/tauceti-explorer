# Review of AUDIT-03

**Reviewer:** REV-AUDIT-03 · **Date:** 2026-09-16 · **Verdict:** accepted · **Corrections:** 4 (all additions to the duplicate lists)

Batch: `research/blueprint/audit/AUDIT-03.json` — 5 roadmaps, 46 layers, 198 targets, 501 cited
declarations, 58 duplicates. Baseline: tauceti `f790474`, mathlib `082e2d3`.

## What was checked

**Citations (all 501).** Every cited declaration exists in the pinned baseline at exactly the claimed
library, file and line — no wrong name, file or line anywhere. Kinds: 261 `theorem`, 168 `def`,
35 `abbrev`, 11 `instance`, 10 `structure`, 7 `class`, 7 `lemma`, 2 `alias`. Nothing cited is an
axiom, and nothing is cited as a result that is only a structure field.

Exactly one cited file contains the token `sorry`: `Mathlib/GroupTheory/FiniteAbelian/Basic.lean`,
lines 42–43. Both occurrences are inside a commented-out `/- TODO … -/` sketch of `DirectSum.congr`
("the two sorries here are probably doable … but quite painful"); the declaration actually cited from
that file, `Subgroup.finiteIndex_range_powMonoidHom_of_fg` at line 204, is unaffected. Not a defect.

**Statements.** About seventy-five cited declarations were opened and read in the Lean source, and
the signature of all 282 `exact`/`more general` citations on a presence target was compared with its
target. The notes are unusually exact about the fine print, and every spot check confirmed them:

- the measure-free doubling bound really does carry finiteness of `Λ ∩ box r 2` as a hypothesis
  rather than deriving it, and the packing bound really is `(4c/ε)^(2#ι)`;
- `ncard_setOf_finiteDimensional_abs_discr_le_le` really is `(2C+1)^(D+1)·D` with `D = rankOfDiscrBdd N`
  and `C = coeffBoundOfDiscrBdd N`, and Tau Ceti's only regulator lower bounds really are the
  rank-zero consequences (the whole of `EffectiveBounds/Regulator.lean` was listed; Mathlib has none);
- the Gram-matrix nondegeneracy is a theorem with a `det G ≠ 0` hypothesis, not an instance, exactly
  as the note says;
- the Smith invariant factors, their divisibility chain, the bilinear `H⊥/H` comparison for odd
  overlattices and its orthogonal-sum form need only `[IsNondegenerate]` in this baseline, so the
  three items `IntegralLattices/STATUS.md` still lists as frontier are closed — the audit is right
  and the STATUS file is stale;
- the ADE rows pin the *values*, not the group orders: `q(ω₁) = n/(2(n+1))`, the Klein-four model for
  even `Dₙ` and `ZMod 4` for odd `Dₙ` with `q(s) = q(c) = n/8`, `E₆ = 2/3`, `E₇ = 3/4`, and
  `typeE₈IsometryD8Plus` is an actual lattice isometry sending Bourbaki's simple roots to explicit
  glue roots, not an appeal to uniqueness of determinant-one lattices;
- the Chebotarev fixed-field fibre count `frobenius_fiber_card_mul_orderOf_eq_card_centralizer` is
  stated for the primes of `L` above `𝔭`, not for the primes of `E` of residue degree one, which is
  precisely why the audit calls target 8.2 partial;
- Tate restriction and corestriction exist only in degrees `0` and `−1`, plus `negSuccCor` and
  `HNegTwoCor` through homology — the full `TauCeti/.../TateCohomology/` declaration list was read —
  so the all-degree Layer 0 target is partial, and `explicitCor2_comp_res2` really is
  `cor² ∘ res² = (G:U) • id` on continuous `H²`;
- in the Class Field Theory `Formation` namespace there is a `cohomologyRes` and a `cohomologyInfl`
  and no `cohomologyCor`, `tateRes`, `tateCor` or conjugation adapter, exactly as claimed.

**Absences (all 117 absent/partial targets re-searched independently)**, by Mathlib naming convention
against `declarations.tsv` and by concept against both Lean trees. Every absence holds. Nothing
anywhere for: Milnor K-theory, tame symbols, de Rham–Witt or Artin–Schreier–Witt, the norm-residue
(Bloch–Kato) theorem, Kato complexes, Parshin chains, higher adeles, Galois Tate twists,
cohomological dimension, the étale fundamental group. Nothing for: class formations, Tate's theorem,
fundamental classes, the abstract/local/global Artin map, the cohomological Brauer group, the local
invariant, local Tate duality, the Weil group, the Hasse norm theorem, the Hilbert symbol, Hilbert /
ray / ring class fields, general Kronecker–Weber. Nothing for: `RayClassCharacter`, ray-class ideal
counts, an unsmoothed Wiener–Ikehara theorem (Tau Ceti's four `WienerIkehara/` files are all
Fourier-smoothed), the prime ideal theorem, or the prime number theorem — Mathlib's
`Nat.primeCounting` has only `tendsto_primeCounting … atTop`. And no Dirichlet or natural density
theorem for any Frobenius fibre: Mathlib's `DirichletDensity.lean` is fourteen declarations of
carrier and `nonneg`/`le_one`/`empty` lemmas.

Two searches that could have gone the other way did not. The 165 `Steinberg` declarations are
Steinberg groups, Steinberg representations and the quaternion Steinberg relation, as the audit says —
there is no Milnor-K Steinberg ideal. And ramification filtrations exist only in lower numbering for
function-field places (`TauCeti.Place.ramificationGroup`), with Mathlib contributing only
`decompositionSubgroup`/`inertiaSubgroup`; there is no upper numbering in either library.

**Verdicts.** The ten `built` layers and the one `process` layer were confirmed against their layer
descriptions, and the `partly built`/`not built` boundary is used consistently across all 46 layers:
`partly built` exactly when some target is fully present, `not built` when every target is absent or
merely partial. `HL.7` as `process` follows the convention AUDIT-01 set for consumer/comparison
layers (`ComplexComparisonPartII:C6`, `SchemeAndStackFoundations:SF.6`). EffectiveBounds layer 0 is
`built` on its mathematical content, and the audit itself records that the README's ⚠ instruction to
reconcile the box engine with `ZLattice` was not followed — the honest reading, and it is in the
entry rather than hidden. No verdict changed.

## Corrections

Four duplicates were missing; all four are added to `AUDIT-03.result.json`.

1. **IntegralLattices layer 4** → `tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-6-construction-a-with-exact-hypotheses`.
   Layers 6 and 7 of AlgebraicCodingTheory are the only two atlas layers outside this roadmap that
   name `IntegralLattice`, and the audit caught only layer 7 (three times). Layer 6 restates three of
   layer 4's theorems in Construction A coordinates: `disc(P_m(C)) = m^#ι/(#C)²` is the
   index-squared discriminant formula, "integral `P_m(C)` is unimodular exactly when `C = C^⊥`" is
   "`L_H` is unimodular exactly when `H` is Lagrangian", and "`P_m(C)` is even exactly when `q_m`
   vanishes on `C`" is the even-overlattice correspondence. Layer 7 opens by declaring itself a
   bridge that consumes this roadmap; layer 6 makes no such declaration.

2. **IntegralLattices layer 2** → the same AlgebraicCodingTheory layer 6. It also asks for
   `P_m(C)^∨ = P_m(C^⊥)` as a literal carrier equality and for the integrality criterion
   `C ≤ C^⊥`, which are this layer's `B.dualSubmodule L` and `L ≤ L^∨ ↔ integral` read in the
   coordinate model.

3. **Chebotarev layer 10** → `FunctionFieldArithmetic:FA.5`. FA.5 plans a function-field Chebotarev
   theorem for curves over a finite field, with the degree-congruence restriction the constant field
   forces and genus/conductor error terms. The audit already flags FA.4 as the function-field
   analogue of Class Field Theory layers 6, 11 and 12; FA.5 stands in exactly that relation to this
   layer, and it is the only other atlas stage that plans a Chebotarev theorem rather than consuming
   one.

4. **Chebotarev layer 14** → `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-7-dirichlet-density`.
   The audit records ADS layer 10 here for the prime ideal theorem. ADS 7.3 separately owns the
   natural-to-Dirichlet implication through the Abel-summation interface and the named all-prime
   denominator hypothesis `AllPrimeDirichletDenominatorAsymptotic`, which is the general form of this
   layer's last agreement theorem.

Candidates checked and deliberately **not** added, because the atlas already assigns ownership in the
other direction: `ArithmeticGaloisDuality:D7` says in its own text that "local Tate duality for finite
modules remains upstream ClassFieldTheory"; `SelmerIwasawaCohomology:L1` and `QuadraticFormInvariants`
6E both name Class Field Theory as the owner and only compare against it; `LocalFieldsRamification`
layers 1 and 3 state that their exports are *consumed by* `ClassFieldTheory.conductorExponent` and
`characterConductorExp`; `PolynomialGaloisGroups` layers 5 and 6 explicitly disclaim Chebotarev;
`RootSystems` layer 5 is the supplier of the simple-root coordinates that IntegralLattices layer 5 is
allowed to consume; and `EllipticCurves` layer 7 uses Hermite–Minkowski as an input rather than
restating the effective count.

## Assessment

The audit is accurate and unusually careful. Its citations are exact to the line, its notes record
the hypotheses that make a target partial rather than present (the doubling finiteness hypothesis,
the `det ≠ 0` side condition, "primes of `L`, not of `E`", res/cor only in two degrees, the injective
but not bijective Kummer class map), and it is right where it disagrees with the project's own prose:
three items `IntegralLattices/STATUS.md` lists as open are in fact closed at this baseline, and the
volume computations EffectiveBounds layer 3 lists as missing are in Mathlib. The only weakness found
was in the duplicate lists, and only on one edge — the second AlgebraicCodingTheory layer, which is
the larger of the two overlaps with IntegralLattices and was the one missed.
