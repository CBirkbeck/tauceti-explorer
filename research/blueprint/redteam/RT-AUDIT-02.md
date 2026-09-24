# RT-AUDIT-02

Red team against the accepted library audit `AUDIT-02`, **Hodge structures (pure, mixed,
and polarized)**, which covers five roadmaps — `HodgeStructures`, `JacobianChallenge`,
`StableReduction`, `ArithmeticGaloisDuality` and `GeometryOfNumbersAndQuadraticArithmetic`
— in 37 layer entries, with 254 targets and 519 declaration citations against Mathlib
`082e2d3` and Tau Ceti `f790474`.

One finding, low severity. The audit is otherwise accurate, including where it makes its
strongest claims.

## Finding

**RT-AUDIT-02/1 — error, low.** Two citations name a Mathlib declaration by an unqualified
name that resolves to nothing at the pin.

`GN.1`'s target "Unit application: Dirichlet's unit theorem via convex bodies" cites
`finrank_modTorsion` at `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:457`
and `exist_unique_eq_mul_prod` at the same file, line 506, both with fit `exact`. Both
declarations are real and are at exactly those lines — but their names are
`NumberField.Units.finrank_modTorsion` and `NumberField.Units.exist_unique_eq_mul_prod`,
and the audit drops the namespace. Look either bare name up in the declarations index and
nothing comes back, while the other 517 citations resolve.

The mathematics is not in question: Mathlib does have Dirichlet's unit theorem, and both
citations are exact fits for the target. What fails is the `name` field, which is the key a
consumer of `data/library-coverage.json` resolves. The audit's other Mathlib citations in
the same layer carry their full namespaces, for instance
`NumberField.mixedEmbedding.volume_fundamentalDomain_stdBasis` and `ZLattice.covolume_eq_det`.

This is worth distinguishing from a failure mode that looks identical and is *not* a defect:
sometimes the declarations index itself drops a namespace and the audit's name is the
correct one. Here it is the other way round — the index has the full name and the audit has
the short one.

The fix is two `name` fields, with file, line, library and fit left alone.

## What held

**Stage coverage** — the check that caught a gap in a sister audit. The audit's layer
entries are exactly the stages of its five roadmaps: 4, 6, 12, 8 and 7. Nothing unaudited,
nothing audited that is not a stage.

**Every citation.** All 519 were checked against the pinned index: no wrong library tag, no
wrong file, none more than twelve lines from where the index puts it. Two names do not
resolve, which is the finding.

**Nothing cited is unusable.** None of the 519 is private, and no cited declaration has a
`sorry` in its body. Every cited file was opened.

**Internal consistency.** No target's `library` field contradicts the libraries of its
citations; no `absent` target carries an `exact` fit; no `built` layer contains an absent or
partial target.

**The one apparent verdict inconsistency is not one.** `ArithmeticGaloisDuality:R02.4` is
graded `not built` although one target is marked `tauceti` and another `partial`. Its own
note explains the grade, and I accept it: the built target is the generic dual `M →+ N` with
its equivariant evaluation pairing — an upstream ProfiniteCohomology construction, not one
of this layer's duality statements — and the note says outright "since none of this layer's
duality statements (local invariants, global duality, the nine-term sequence, lattice
versions) exists, the layer is recorded as not built". The grading is consistent with the
rest of the audit, where six other `not built` layers carry `partial` targets.

**The four `built` verdicts survive reading the statements**, not just the names:
`conj_piece` reads `(hs.piece p).map ω.toEquiv.toLinearMap = hs.piece (n - p)`, the target's
Hodge symmetry; `isInternal_piece` reads `DirectSum.IsInternal hs.piece`, the target
verbatim; `hodgeNumber_symm` reads `hs.hodgeNumber p = hs.hodgeNumber (n - p)`; and
`Polarization.hodgeForm_self_pos` reads `0 < P.hodgeForm x x` for `x ≠ 0`, the
positive-definiteness claimed.

**The one target of a `built` layer with no exact fit is correctly classified.** "Symmetry
group Aut(V, Qint) of integral automorphisms preserving the form" rests on
`TauCeti.BilinForm.isometryGroup` at fit `more general`, and reading it settles the matter:
it is the subgroup of linear equivalences preserving an arbitrary bilinear form over a
commutative ring, and its own docstring says "For a finite free `ℤ`-module `V` carrying an
integral form `Q` this is the arithmetic group `Aut(V, Q)`."

**Nothing marked absent is in the libraries.** The 157 absent targets are deep algebraic
geometry, and the pinned index has nothing for the theorem of the cube, the dual abelian
variety, the Picard functor or scheme, Abel–Jacobi maps, symmetric powers of a curve as
schemes, Čech cohomology, dualizing sheaves and complexes, higher direct images, or
cohomology and base change.

**The duplication record is thorough.** 97 entries across 37 layers, each naming a specific
other layer. I swept the whole atlas for the six concepts most likely to be planned twice
here — stable curves and maps, the Picard functor, abelian varieties, dualizing sheaves,
Hodge structures, the geometry of numbers — and found nothing missed. The nearest
candidates were the three roadmaps outside the audit that mention Hodge structures where it
records only `AbelianSchemesAndArithmeticModuli:A5`, and all three consume rather than
duplicate: `ShimuraData:D1` names "the HodgeStructures linear-algebraic API" among its
dependencies, `PELModuli:M0` relates its positivity condition "to the associated Hodge
structure", and `ShimuraCompactifications:C1` takes the mixed Hodge structure it needs at a
boundary.

## What I did not do

No Lean was compiled and nothing here is formalised. Declarations were read at the pinned
commits — through the index for the bulk checks, and in the source where a `built` verdict
turned on what a statement actually says. I did not re-derive the mathematics of the layers
whose targets the audit simply locates in the library.
