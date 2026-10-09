# Handoff: BP-SchemeAndStackFoundations--SF.1 (checkpoint)

Worker: Claude Code, session cc-b5733b, 2026-10-09. Baseline: Tau Ceti f790474, Mathlib 082e2d3.

## Status

The plan itself is finished: the packet `research/blueprint/packets/SchemeAndStackFoundations--SF.1.json` has
57 nodes (19 definitions, 14 constructions, 24 theorems), 176 API items, 132 unit tests, 84 baseline
declarations (each read in the Lean source at the pins), 4 planets, 4 requests and 3 gaps. Stage SF.1 has
coverage `planned`. `python3 scripts/check_blueprint.py <packet> --index <pinned declarations.tsv>` reports
0 errors and 0 warnings. The packet's status is `partial` only because the suggested Lean file is not finished
(see below). The reader document `research/blueprint/readmes/SchemeAndStackFoundations--SF.1.md` is generated
from the packet and agrees with it.

## What is closed

- SF.1a Descent: the quasi-coherent pseudofunctor; fpqc descent of QCoh (planet); fpqc descent of affine
  morphisms (imports ModularCurves 0E); descent of quasi-projective schemes along finite locally free coverings
  (compared with StableReduction Layer 2); sheaves form a stack; fppf descent of separated locally quasi-finite
  morphisms; fppf descent of algebraic spaces.
- SF.1b Algebraic spaces, on top of the whole-roadmap carrier `SF.1/algebraic-space`: the category, etale
  equivalence relations, quotient sheaves, the etale-quotient theorem, presentations, points |X|, etale-local
  properties, separation and properness, fibre products and chart products, the small etale ringed site
  (R09.3 request), quasi-coherent modules, the folded line and A^1/Z examples.
- SF.1c Group spaces, actions, groupoids, stabilizers, torsors, H^1, torsor representability, contracted
  products, twisting, categorical/geometric quotients, finite group quotients, Artin's bootstrap theorem.
- SF.1d Stacks in groupoids, stackification, 2-fibre products, representable morphisms, algebraic stacks
  (planet), DM stacks, inertia, the setoid criterion, properties of morphisms (representability and properness
  kept apart), presentations, quotient stacks (planet), their algebraicity and stabilizer conditions,
  [A^1/G_m], root stacks, QCoh on stacks.
- SF.1e Moduli functor, fine and coarse moduli spaces (planet), Keel-Mori, finite-quotient coarse spaces, tame
  stacks and AOV local structure.
- SF.1f Galois-gerb inputs: semilinear automorphisms, Galois descent of affine groups, conjugator
  representability, crossed modules.

## Confirmed finding RT-AREA-algebraicgeometry/1

Applied: SF.1 is the single owner of the general theory of algebraic spaces and stacks. The packet's first
`restructure` entry proposes edges SF.1 -> R09.3, R09.4, R09.5 and lists the A0-extension nodes that become
imports (R09.3 quasicoherent-pseudofunctor, fpqc-quasicoherent-descent, space-quasicoherent-modules,
space-fpqc-quasicoherent-descent; R09.4 inertia-stack, torsor-twist-space). No SF.1 node cites the tier-4 roadmap.

## Notions moved down (tier rule)

- From DiamondsAndVStacks D0 (tier 3): stackification, 2-fibre products, groupoid quotient stacks, sheaf
  descent -> SF.1/stackification, two-fibre-product, quotient-stack, sheaf-stack (second restructure entry).
- From AlgebraicModuliForArithmeticGeometry R09.3-R09.5 (tier 4): QCoh descent and QCoh on spaces, inertia,
  torsor twisting, the definition of coarse moduli spaces and the general Keel-Mori theorem.

## What remains (exact next steps)

1. Suggested Lean file `research/blueprint/suggested/SchemeAndStackFoundations--SF.1.lean`: it elaborates
   (the swarm `lean-check` tool, `sorry` warnings only, run 2026-10-09). SF.1a-SF.1c are
   typed (comments only where Mathlib lacks a notion: quasi-projective morphisms, open subspaces, groupoid QCoh,
   Over.pullback transport of ModObj). SF.1d-SF.1f have only `StackInGroupoids`, `IsFibrewiseEquiv`,
   `StackInGroupoids.ofSheaf`, `CrossedModule` and two tests typed; all their other API/test names are listed
   in the final comment block. Type them: two-fibre products fibrewise as `CategoricalPullback`, 2-isomorphisms
   fibrewise in Cat, `IsRepresentableBySpaces` via `twoFiberProduct` + `StackEquivalent`, `IsAlgebraicStack`
   and `IsDeligneMumford` via representable smooth/etale surjective atlases, inertia, stack points,
   `IsProperStack`, quotient stacks via `stackification` of `Groupoid.toPresheafOfGroupoids`, root stacks with
   a section `SheafOfModules.unit X.ringCatSheaf ⟶ L.obj` of Tau Ceti's `InvertibleSheaf`, coarse spaces with
   a `ofSheafFibreEquiv`. Note: Tau Ceti modules LinearlyReductive, GaloisDescent.*, FaithfullyFlatDescent and
   Fppf.Quotient.* are not compiled in the shared build, so they can only be cited in comments.
2. Coverage `remaining` items (refinements, not plan gaps): routed-paper adapters (Zhu perfect site, Schroer,
   Guo-Reinecke, Bhatt-Scholze, Kisin-Pappas, van Hoften), non-tame etale-local DM charts (WC.6), pro-gerb
   compatible conjugators, gerbes owner.
3. Then set the packet status to `complete`.

## Requests

ModularCurves 0E (affine descent along one faithfully flat morphism), ModularCurves 0C (affine finite
quotients, SGA 3 V 4.1 affine), ModularCurves 9D (coarse finite quotients), StableReduction Layer 2 (polarized
etale descent comparison). SF.0 (same roadmap) is cited for QCoh pullback and relative Spec.

## Sources read (2026-10-09)

Stacks Project tag pages (chapters 7, 8, 17, 35, 37, 39, 65-67, 78, 80, 83, 94-97, 100, 101, 106), listed tag
by tag in the packet's `sources`; Poonen, Rational points on varieties
(https://math.mit.edu/~poonen/papers/Qpoints.pdf, sha256 42e92ce4...); Cadman arXiv:math/0312349v3; Conrad,
The Keel-Mori theorem via stacks (https://math.stanford.edu/~conrad/papers/coarsespace.pdf); Abramovich-Olsson-
Vistoli arXiv:math/0703310v1; Kisin, Mod p points (https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf).
Not read: SGA 1/3, Laumon-Moret-Bailly, Olsson's book, Mumford GIT (not public). One source issue recorded:
SchemeAndStackFoundations/E101, misprint ψ = φ ∘ χ for ψ = χ ∘ φ in Stacks Definition 83.4.1 (048J).
