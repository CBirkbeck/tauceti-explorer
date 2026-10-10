# PKG-EllipticCurveModularityImaginaryQuadratic~2

**Checkpoint: blocked on genuine supplier interfaces; revision not complete.**
Codex, session `codex-rUQX6J`, 10 October 2026.
Issue [#7898](https://github.com/CBirkbeck/tauceti-explorer/issues/7898),
claim confirmed in [comment 6091424146](https://github.com/CBirkbeck/tauceti-explorer/issues/7898#issuecomment-6091424146).
Branch: `codex-rUQX6J-pkg-imaginary-quadratic`.

The manager's forty priority issues had no eligible `state:available` job.
This available package revision was selected under WORKERS' fallback order.
No second job was claimed, and this worker did not review its own work.

## Changes that can be resumed directly

The accepted packet and the independent package review remain unchanged.
The README still contains all 68 targets, 69 APIs and 69 named tests, their
hypotheses, prerequisites and source locators. Metadata remains exactly
`topic = "math.NT"`. Only the package README, Suggested.lean and this handoff
are changed. No supplier, original reader/suggested file, packet or
`review.json` was edited.

Added meaningful signatures against existing Mathlib carriers:

- `shortEquationFamily.height_count` uses the canonical map
  `(a,b) ↦ 1 ⊗ (a,b)` into `TensorProduct ℤ ℝ (𝒪F × 𝒪F)` with a real
  vector-space norm. It asserts finiteness of the bounded nonsingular
  coefficient set and equality of its unweighted count with the bounded
  family subtype's cardinality. Three additional examples check zero count
  at nonpositive bounds, at least one equation when `(0,1)` is included,
  and at least two when `(0,64)` is also included. Isomorphic equations
  remain distinct coefficient pairs.
- Five `_functionFieldDegree` signatures compute
  `[RatFunc ℚ : IntermediateField.adjoin ℚ {r}] = 4,6,3,10,6` for the five
  j-functions. They supplement, rather than misinterpret, `intDegree`.
  Transport to the actual proper modular curves is still missing.
- `B_mordell_weil` returns a point whose integer multiples biject with
  `B.toAffine.Point`. This expresses rank one, trivial torsion and
  saturation. An additional example excludes doubling a generator as a
  surjective parametrization of the group.
- `quadratic_level_fifteen_torsion` uses actual point groups and the canonical
  `Affine.Point.map` base-change homomorphisms. It characterizes the two
  quadratic torsion-growth exceptions for E15, the one for Es35, gives
  eight rational points for each, and gives eight **new** Gaussian torsion
  points. It does not assume rank zero over every quadratic field.
- `small_imaginary_quadratic_level_fifteen_finite` states finiteness of the
  E15 point group for square roots of `−d`, `d ∈ {1,2,3,5}`. This is only
  the arithmetic input, not the missing modularity conclusion.
- `sqrt_minus_ten_infinite_level_fifteen` constructs the actual point
  `(-1,6s)`, asserts infinite order, nonrational y-coordinate and infinitude
  of the E15 point group. An additional example rejects `(-1,6)`. Its
  comparison with geometric X₀(15) still needs `level_fifteen_models`.

Two local ellipticity instances unfold base change and reuse Mathlib's
existing map instance; they are proved by `infer_instance`. Classical
decidable equality supplies the point-group construction. No new arithmetic
or geometric carrier, axiom, arbitrary proposition argument or phantom
type was introduced. All planned theorem/example proofs remain `sorry`.

## Validation

Final command:

```text
lean-check research/blueprint/packages/EllipticCurveModularityImaginaryQuadratic/Suggested.lean
```

**Exit 0; zero errors; 130 warnings, all `declaration uses sorry`.**
There were 103 GB available before this final check. No language server,
build, update or cache download was started; no check remains running.
Earlier instance-resolution errors were corrected before this result.

The Mathlib checkout used by the checker was verified at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, exactly the packet pin.
The installed wrapper describes its shared build as Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; that extracted project is not
itself a Git checkout, so no independent Tau Ceti HEAD verification is
claimed. This file imports only Mathlib modules. Elaboration validates its
types, not its `sorry` conclusions or the absent Tau Ceti suppliers.

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityImaginaryQuadratic.json`
reported zero errors and zero warnings. Its accepted 16 gaps and 36 supplier
requests are unchanged. After stripping nested block comments and line
comments, the executable inventory is **19 definitions, 65 theorems,
five instances and 62 examples**. This includes ten new theorems and five
new examples; three named theorem targets now have point-group signatures.

The declaration-name audit leaves **four missing objects, thirteen missing
APIs, twelve original tests without executable examples, and forty-two
theorem/comparison targets without declarations**. Fifty-six API names have
declarations, several still expressing only the coordinate part of their
full contracts. Presence of a name is not full mathematical coverage.

Scratch-only checks verified all README target/API/test names, exact metadata,
the 200 KB size bound, absence of axioms, and whitespace. Exact rational
polynomial arithmetic checked coprimality and maximum numerator/denominator
degrees of all five fractions, and checked the signed square-root point
equation. These computations are not Lean proofs or model-isomorphism
certificates.

Final files:

| File | Bytes | SHA-256 |
|---|---:|---|
| README.md | 119744 | `2d42cce12ed71944f294b5bce1ef489b6d0d03db58a7659071c6212545f294fe` |
| Suggested.lean | 125584 | `25b20fd58583c6da56a94dbcc5e8e946ad36b0dd618d68b47d451ed02eb090bd` |

## Why this remains blocked

The [independent review](../reviews/REV-PKG-EllipticCurveModularityImaginaryQuadratic.md)
requires real supplier carriers and says: “Where a supplier is still
unavailable, the unresolved signature must remain explicit and the package
cannot yet receive acceptance under item 5.” Missing carriers cannot be
replaced with proposition parameters or a local reconstruction of another
roadmap's objects under PROTOCOL §§13, 15 and 20.

The current upstream roadmaps and library were inspected read-only as well
as the pinned Mathlib environment. At the final audit their respective
revisions were `cb8dda51b498dc00183d100031b631dfb58ea5e1` and
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No complete number-field GL₂
automorphic representation with the weight-zero/attached-representation
interface, coarse Cartan/mixed modular-curve compactification, or global
curve Jacobian with its rational divisor-class API was found. Current
Tau Ceti does have elliptic Tate-module/Galois/Weil-pairing modules,
abelian varieties, Weil divisors and a rigidified Picard-point functor;
their presence does not supply the missing interfaces. Mathlib's
Weierstrass `Jacobian` coordinates are not a Jacobian variety.

Read the upstream JacobianChallenge README and the atlas's upstream
Multiquadratic README in full, and inspected the current ModularCurves
suggested interfaces. JacobianChallenge's suggested contracts remain
comments, and ModularCurves' shape does not furnish the required implemented
Cartan/mixed compactification. Recent upstream additions were checked;
none is replanned here.

| Missing object/API | Required supplier input already recorded in the accepted plan |
|---|---|
| `Modular`, `.of_cm`, `.non_cm_iff`, `.isogeny_iff` | G1: genuine geometric CM, GL₂ automorphic, weight-zero and attached dual-Tate representation interfaces from EllipticCurves, R16.4/R16.6, AG2.7 and R01.6. This blocks the modularity endpoint signatures. |
| `symplecticTwist`, `.points`, `.baseChange`, `.rational` | Imported full-level moduli/twist carriers, the fixed pairing and rigidification for p=3; G3/G4/G7 retain the required extension and comparison contracts. |
| `cartanCurve`, `.j`, `.mixed`, `.points` | G7: affine coarse quotients from upstream ModularCurves followed by the shared Cartan/mixed compactification extension owned by ModularCurvesPartII. |
| `quarticTorsionClasses`, `_divisors`, `_orders`, `_independent` | Genuine JacobianChallenge divisor/Jacobian interfaces and the source-specific curves/quotient maps; G14/G15 retain the comparison and certificate obligations. |
| `quarticImaginaryPoints_j` | G14: certified map on C2 and transport of its modular j-function. The read Magma file computes j on its canonical-model coordinates but does not export an inverse coordinate map to the displayed quartic. Evaluating a guessed rational function would be an unsupported signature. |

The forty-two undeclared milestone contracts remain explicitly named in the
suggested file and README. In particular `cm_modularity`,
`quadratic_modularity`, `finite_level_fifteen_modularity`,
`small_imaginary_quadratic_modularity`, `modularity_transport` and
`nonsplit_cartan_conic` are unresolved. Coordinate triples still need points
on the smooth proper models; quartic coordinate substitutions still need
actual involutions/quotients. Proof certificates are future obligations,
not a reason to omit a signature when its mathematical type already exists.

## Sources and continuation

For the new signatures read CN arXiv:2301.10509v3 §1 p.2,
Corollary 7.1.2 and proof p.93, Proposition 7.1.3 p.94 and the saturated
generator requirement in Proposition 7.4.4 p.100; Zywina §1.1 pp.1–2;
and the fixed-commit `ns3ns5.m` and `s3ns5.m` scripts. Both PDFs and both
scripts matched the accepted SHA-256 values. Sources were not executed.
No private book was needed. No source passage, download, local path or
scratch log is in the package.

Resume by checking whether the genuine suppliers above have appeared at a
permitted baseline. Then replace the outstanding comment contracts with
faithful signatures, restore the missing twelve original examples, and
strengthen the partial coordinate statements to their geometric contracts.
Audit declarations after comment stripping and rerun `lean-check` and the
packet checker. Keep `review.json` in place for the independent reviewer.

This checkpoint must not be interpreted as acceptance or completion of the
revision. `issues.deliverables_complete` currently uses output existence
for package jobs, so the presence of this fourth output alone does not
establish signature coverage. The maintainer should retain the unresolved
review verdict and route the missing supplier interfaces before treating
the revision as complete. Scratch was removed after opening the PR; this
note contains the information needed to resume.
