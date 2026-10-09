# PKG-SmallRamificationAndAbelianVarietyBaseCases~2

Issue #7913. Agent: Codex, session `codex-X0inIL`. Date: 2026-10-09.
Branch: `codex-X0inIL-7913-small-ramification`.

## Result

The revision is complete and ready for independent package review. All five
weaker target signatures and all six unidentified examples from
`REV-PKG-SmallRamificationAndAbelianVarietyBaseCases` are addressed below.
The full Suggested file elaborates against the specified pins with zero
errors and only `sorry` warnings. This is a completed package revision,
not a checkpoint, and elaboration is not proof completion.

The accepted plan, the older reader and suggested inputs, and the failed
package review were left unchanged. In particular, `review.json` remains
available for the next independent reviewer to replace. Metadata remains
exactly `topic = "math.NT"` followed by a newline. The reader retains all
59 targets, 45 API entries and 34 test names, with the six-layer organization,
source locators and supplier boundaries of the accepted plan.

## Repairs to the five target signatures

1. `exists_upperTriangular_of_wildInertia_ne_bot` now states the full Borel
   form: diagonal characters, their common kernel on inertia, elementary
   abelian wild inertia identified by its upper-right entry, the cyclic tame
   quotient whose order divides `p - 1`, and conjugation by the diagonal
   ratio. It retains the characteristic-two equality `I = P`.
2. `dihedral_or_SL2_of_irreducible_char_two` now identifies a finite subfield
   of the algebraic closure of cardinality `2^j` and an actual conjugating
   matrix. Membership in the image is equivalent to membership in its
   embedded special linear group, using Mathlib's `SpecialLinearGroup.toGL`
   and `GeneralLinearGroup.map`. The order formula and lower bound sixty
   accompany this identification.
3. The reusable `fieldCriterion_two_three` is accompanied by
   `fieldCriterion_two_three_eq_auxiliaryField`, concluding equality with
   the concrete subfield `schoofFieldTwoThree = ℚ(ζ₃, ∛2)` and absolute
   degree six.
4. `fieldCriterion_three_two_degree` gives the precise possibilities four
   or eight over the concrete `schoofFieldThreeTwo = ℚ(ζ₁₂)`.
5. `fieldCriterion_five_two_degree` gives four, eight or sixteen over the
   concrete `schoofFieldFiveTwo = ℚ(i, √5)`.

Each field companion assumes a finite Galois `L ⊆ ℚ̄`, containment of the
specified M, relative unramifiedness of `L/M` away from p, and the strict
normalized p-adic discriminant bound. Relative unramifiedness is stated
using the intersection of absolute inertia with M's fixing subgroup; it
does not remove M's existing ramification at ℓ. The original three field
criterion declarations remain available to the final base-case conjunction.

## Repairs to the six examples

| Test | Object-specific formulation |
| --- | --- |
| `not_isLevelOneResidual_one_add_omega` | `oneAddCyclotomic 3 F` has the explicit diagonal matrix and inverse from the trivial and native mod-three cyclotomic characters. The test states oddness, unramifiedness away from three, failure of absolute irreducibility and failure of level one. |
| `not_isLevelOneResidual_X0_eleven_two_torsion` | `x0Eleven` is the actual equation `y² + y = x³ - x² - 10x - 20`. Its geometric two-torsion is `AddSubgroup.torsionBy` of Mathlib's nonsingular point group. `Point.map` supplies the coordinate Galois action; `GeneralLinearGroup.toLin'` writes it in any basis. A basis-existence theorem is included, and the test concerns this representation in every basis. |
| `not_isAbsolutelyIrreducible_cyclic_cubic_mod_two` | `realCubicModTwo` uses the native mod-nine cyclotomic character modulo ±1. The three cosets map to `1`, the explicit matrix `(0 1; 1 1)`, and its square. The test identifies the kernel field with the real cyclotomic subfield, its degree with three, and the matrix cube with one, before checking irreducibility and failure of absolute irreducibility. |
| `not_mem_semistableCategory_quadratic_twist` | Exact header specification of the finite étale descent of `(𝔽₃, χ₋₇)` over `ℤ[1/7]`. Missing interface: R07.1's finite Galois-module descent and equivariant geometric-point identification. |
| `X0_eleven_two_torsion_mem` | Exact header specification of the multiplication-by-two kernel of the abelian-scheme model of the actual `J₀(11)` over `ℤ[1/11]`. Missing interfaces: R11.1's integral model and A3/R07.1's finite flat kernel and generic-fibre comparison. The separate point representation does not construct that integral scheme. |
| `isGL2Type_J0_23` | Exact header specification of the actual dimension-two modular Jacobian and the embedding `ℚ(√5) → End⁰ℚ(J₀(23))` supplied by its Hecke action. Missing interfaces: the compactified modular curve, its Jacobian as an abelian variety and the geometric Hecke action with this coefficient-field identification. |

The last three anonymous existence examples were removed. Their exact
mathematical tests remain in the README and in the single main Lean header,
as explicitly allowed by the package review and PROTOCOL §13 when an
object's supplier interface is unavailable. No arbitrary proposition field
or `def _ : Prop := sorry` substitutes for a construction or condition.
The universal GL₂-type dimension tests remain in code.

The previous review's repairs are retained: continuous cyclotomic twists,
distinct primes for Cartier duality and category examples, the correct
characteristic-three involution explanation, and the full base-case row
hypotheses. No other target was weakened to obtain elaboration.

## Library and upstream boundaries

WORKERS, both protocols and UPSTREAM_GUIDE were read. The accepted plan's
statements, APIs, tests, proof routes and 31 requests were compared with
the reader and prototype; the reviewed R25.1–R25.6 library audit was read.
The full current upstream Completed/Multiquadratic, Completed/EffectiveBounds
and JacobianChallenge READMEs supplied examples of scope and density.
Relevant current LocalFieldsRamification, LocalGaloisGroups, EllipticCurves,
ModularCurves and JacobianChallenge interfaces and the native Tau Ceti library
were checked for overlap.

General local invariants and estimates are already native in the current
Tau Ceti library: `TauCeti.differentExponent`, `TauCeti.ramificationIndex`,
`TauCeti.LocalFieldsRamification.lowerRamificationGroup` and
`TauCeti.differentExponent_le_ramificationIndex_sub_one_add_natCastValuation`
(modules `NumberTheory/LocalField/Different/Basic`, `Different/Wild`,
`RamificationIndex` and `RamificationGroup`). Their compatible local-field
valuation hypotheses are essential. These interfaces are absent from the
pinned source tree used to elaborate this prototype. The existing local-data
stand-ins are labelled as pin-specific, supplier-owned data; a baseline
advance should replace them with imports, never re-plan their mathematics.
The representation-specific sharp bounds remain this roadmap's targets.

For the modular-Jacobian test, the actual upstream split matters:
ModularCurves Layer 10 supplies compactified curves, JacobianChallenge
Layer E supplies Jacobians, and ModularCurves' “Mazur interface” assigns
the Hecke algebra acting on `J₀(N)` to a downstream Eisenstein-ideal supplier
using ModularForms' Hecke theory. ModularCurves and JacobianChallenge alone
do not supply that action. The accepted plan's `J₀(23)` test does not have
a corresponding explicit geometric Hecke supplier request. This precise
interface is recorded in the omitted test rather than attributed to the
wrong roadmap. No supplier packet or upstream roadmap was edited; a future
owner assignment must preserve this boundary. This affects expression of
that test, not the GL₂-type definition or the terminal theorem signatures.

## Source and elaboration receipts

The revision's source checks used the same public versions and digests as
the accepted plan:

- Moon–Taguchi, arXiv:0710.1319v1, §2, (2.1) and Lemmas 1–3, pp. 2–5:
  the triangular form, diagonal-ratio action and inertia quotient.
- Schoof, author-hosted published PDF, §2.1–2.2, p. 849, and §6, the
  `(ℓ,p) = (2,3), (3,2), (5,2)` cases, pp. 855–857: the category examples,
  explicit auxiliary fields, residue units and the exact degree exclusions.
- Ghitza–Yamauchi, arXiv:2509.00635v2, §3, Propositions 3.2–3.3, p. 7:
  small-characteristic finite-image/discriminant context.

No source text or source file is submitted, and no restricted book was
needed. The earlier package and independent review contain the receipts
for the unchanged remaining source versions. All additions are in the
worker's own words, with mathematical formulas and locators.

The existing shared build has Mathlib HEAD
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti source tree has no
Git directory, so exact-pin provenance was checked by comparing all 5,477
tracked Lean source files to the Git blobs at
`f790474821cf4256814db967cb154e7af3d0c369` in an existing source checkout:
zero missing files and zero differing blobs. The previously missing
positive-definite compiled import is now available. No dependency build,
cache retrieval, project setup, library update or language server was used.

Final command:

```text
lean-check research/blueprint/packages/SmallRamificationAndAbelianVarietyBaseCases/Suggested.lean
```

Result: **exit 0; zero errors; 137 warnings, all `declaration uses sorry`**.
Checked Suggested.lean SHA-256:
`0ad28983a783d87fa03c4547468d4d82dd8f95146cb9298e1bb5e084c48b8fd0`.
The matrix determinant for the explicit order-three matrix is proved by
`decide`; the new arithmetic constructions otherwise leave proof obligations
as `sorry`. Their data are explicit, so those proofs cannot choose unrelated
examples. The file is a signature prototype, not a verified implementation.

## Submission validation and continuation

- `scripts/check_blueprint.py` on the unchanged accepted plan:
  **zero errors and zero warnings**, 59 targets, 45 APIs, 34 tests,
  80 baseline entries, 31 requests, zero gaps and six closed layers.
- All accepted target slugs and API/test names occur in the README; all
  API/test names occur in Suggested.lean, including the exact header
  omissions. The reader has no packet/job/checkpoint/review-status prose
  and remains below 200 KB.
- Metadata parses as TOML and has the required exact one-line content.
- `intake.py check-files` and `git diff --check` pass. Changes are confined
  to this job's README, Suggested file and handoff. Metadata, review.json
  and every packet remain unchanged.
- Available memory exceeded 20 GB before every serial `lean-check`.
  Scratch stayed below 1 GB, and no compilation was left running.

No revision work remains. The next independent reviewer should compare the
five strengthened targets, inspect the explicit arithmetic constructions
and the three honest supplier omissions, and repeat the pinned `lean-check`.
All information needed for that review is in the package, its accepted
inputs and this note; no deleted scratch artifact is needed.
