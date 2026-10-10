# Independent package review: GL₂-type abelian varieties

**Verdict: accepted after correcting the current-library inputs.** This is the
completed independent review for #7927, by Codex, session `codex-dYBRKy`, dated
10 October 2026. The package author was a different worker, `codex-IapPSQ`.

The review compares the package with the accepted
`EllipticCurveModularityPartIIGL2TypeAbelianVarieties.json` plan, including its
item-level suggested-signature coverage. No target, hypothesis, API requirement
or definition test was removed. The correction replaces already-implemented
cohomology supplier interfaces with current Tau Ceti declarations; it does not
change the mathematics or move its ownership.

## Correction applied

The package treated the canonical degree-two continuous-cohomology comparison,
its naturality and rational-coefficient vanishing as interfaces supplied by
ProfiniteCohomology Layer 10. Current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already implements these inputs:

- `TauCeti.ContCohomology.explicitH2IsoContinuousCohomology`,
  `CohomologyComparison.lean`, line 414;
- `TauCeti.ContCohomology.explicitIso_coeffMap2`,
  `ComparisonDegreeTwo.lean`, line 90;
- `TauCeti.ContCohomology.explicitIso_infl2`,
  `Inflation/Comparison.lean`, line 148;
- `TauCeti.ContinuousCohomology.subsingleton_continuousCohomology_of_module_rat`,
  `Torsion.lean`, line 124.

Read the statements and surrounding hypotheses. The comparison is on the
**discrete explicit H² carrier**, for a compact topological group and a discrete
abelian coefficient group with continuous action. Inflation compatibility
includes the dictionary morphism on invariant coefficients. Rational vanishing
requires a discrete representation whose underlying group is a ℚ-module and
applies in positive degrees. The trivial actions in GT.5 satisfy the action
requirements; the uniquely divisible quotient ℚ̄ˣ/μ_∞ supplies the rational
module needed in the vanishing argument.

Updated the README interface table, library inventory and the prerequisites of
the cocycle and Tate-vanishing targets. Updated the Lean interface comments to
distinguish the older compilation pin from these existing current exports. No
Lean declaration or import changed, and no existing theorem is planned again.
The actual geometric cocycle still requires the stated A1/A6 interfaces.

## Six package criteria

| Criterion | Result and evidence |
| --- | --- |
| Upstream form | Pass. The introduction, boundaries, conventions, existing inputs and six ordered layers provide an implementable mathematical specification. Read AlgebraicVectorBundles and DifferentialGeometry in full for comparison, and the relevant ClassFieldTheory conventions. Final README size is 121,102 bytes, below 200 KB. |
| Accepted-plan fidelity | Pass. All 44 target headings occur in order. All 39 API items and 24 definition tests remain, with the statements, hypotheses, construction/proof routes and source locators. Each of the six definition/construction targets has at least three mathematical tests in the README. Supplier interfaces agree with the plan, except for the explicit substitutions of current library results above and the previously recorded native tangent-dimension result. |
| Own words and sources | Pass. The document specifies targets rather than reproducing passages or walking through sources section by section. Checked the cited passages in the five public sources against the downloaded editions and their recorded hashes. The locators retain manuscript pagination and Carayol's printed pagination. |
| No programme process | Pass. No packet names, job identifiers, review history, checkpoints or coverage statuses occur in the roadmap README. The Lean file's mathematical interface notes identify native prerequisites without describing the queue. |
| Suggested Lean | Pass under the honest-omission rule of PROTOCOL §13 and the upstream prototyping guidance. The available native declarations agree with the corresponding parts of the README. Owner-dependent conditions and signatures remain explicitly specified in prose, as in the accepted plan. Final `lean-check` exited 0 with no errors and 35 warnings, all `declaration uses sorry`. The limitations are detailed below. |
| Metadata | Pass. The file is exactly `topic = "math.NT"` followed by one newline. Number theory is the appropriate category. |

## Mathematical fidelity, by layer

**GT.1 (six targets).** The rational endomorphism algebra is the tensor product
of the actual native endomorphism ring. Powers use the regular field action;
primitivity is relative to that action and agrees with ℚ-simplicity under the
degree/dimension hypothesis. Ribet's Theorem 2.1 retains the centralizer and
matrix-algebra conclusions. The canonical endomorphism field uses compatible
ring operations, and its totally real/CM alternative includes the Rosati
restriction. The modular-Jacobian decomposition retains oldform multiplicities.
The J₀(23), J₁(13) and product examples test materially different endomorphism
algebras; they are not asserted to be implemented geometry.

**GT.2 (eleven targets).** The common positive-dimensional ℚ-simple hypothesis
is explicit. The integral model carries an actual isogeny and integral action.
Good-prime Frobenius compatibility precedes all-place compatibility. The finite
determinant character, oddness, absolute irreducibility, coefficient conjugation,
trace generation and squared-trace field conclusions retain their hypotheses.
The conductor estimate uses restriction of scalars and the local-degree factor;
residue degree one alone is never identified with E_λ = ℚ_ℓ. The good-reduction
crystalline and finite-flat statements exclude the required primes.

**GT.3 (ten targets).** Modularity requires a positive-level surjective Jacobian
homomorphism. Low-level zero Jacobians, Γ₀ versus Γ₁ and nonminimal levels are
distinguished. Residual comparisons take place in a common algebraic closure.
The fixed-newform step uses bounded levels and finite coefficient generators;
the infinite congruence step identifies coefficient fields before rational Tate
comparison and Faltings. Powers obtain enough oldform copies at a larger level.
The single-component characterization uses characteristic-zero trace recognition,
not an unsupported infinite-residual-congruence argument. A pointed
parametrization has image generating the target, and need not be a surjective
curve map to an abelian variety of dimension greater than one.

**GT.4 (five targets).** The exact conductor N_f^dim(A) and least-level N_f
claims assume ℚ-simplicity. Carayol supplies the away-from-coefficient-prime
local comparison; the coefficient-prime assertion is explicitly supplied by
R19.3. Strict compatibility permits a finite coefficient extension. The analytic
product includes bad local factors and the completed functional equation. The
parent comparison chooses the same quotient and Abel–Jacobi map, rather than
asserting uniqueness of arbitrary parametrizations.

**GT.5 (eight targets).** ℚ-curves use geometric conjugate isogenies. The rational
cocycle requires non-CM scalar endomorphisms, rational inverses and trivial
discrete coefficients. Enlarging the field of definition is explicit, including
for twists and the splitting map. The Weil-restriction comparison specifies the
twisted group algebra, both actions and the inverse-index conjugated component
maps. The projector image has the claimed degree/dimension. The quadratic
square/split and nonsquare/field alternatives remain distinct, as does the
positive sign forced by an imaginary quadratic base field.

**GT.6 (four targets).** The twisting lemma carries open normal subgroup,
continuity and absolute-irreducibility conditions. Non-CM geometric Tate
comparison supplies the restriction irreducibility needed by solvable base
change. One finite algebraic character is transported coherently across
auxiliary primes before deducing all finite local factors. The final quadratic
statement includes Caraiani–Newton's separate CM alternative; it does not
require a cuspidal representation when the CM field is contained in the base.

## Sources and existing work

| Edition read | Locators checked | SHA-256 |
| --- | --- | --- |
| Khare–Wintenberger, author's `results.pdf`, 31 May 2009 | §§1, 5, 10, pp. 1–3, 7–9, 19–21; especially Corollary 10.2 | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| Ribet, author's `korea.pdf`, 6 September 2003 | §§1–7, pp. 1–17; Theorems 2.1, 4.4, 6.1, 6.3; Lemma 6.4; Proposition 6.5; Corollary 6.6; Lemma 7.1 and Proposition 7.2; §8, pp. 17–18, for the component-map convention | `4c491a5294d1f4ec1b62855560aaea95cb64802d8fdd80fdd51ae2d2432f66ed` |
| Carayol, published scan | §0, pp. 409–411; §0.6, Théorème (A) and Corollaire (0.8) | `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8` |
| Freitas–Le Hung–Siksek, arXiv:1310.7088v4 | §1, pp. 2–3; §§11–12, pp. 17–18 | `aea71f7698edac25fedaf03627b7703c0ed6138e4e9c012b06b41822819d0403` |
| Caraiani–Newton, arXiv:2301.10509v3 | §1, pp. 2–7; Corollaries 7.2.5 and 7.3.4, pp. 97–98 | `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3` |

Read the reviewed library audit and the statements of the 31 accepted baseline
declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. In particular, the fixed-level
strong-multiplicity-one theorem supplies no cross-level assertion; the native
character-space internal direct sum supplies no newform-finiteness theorem;
the entire Dirichlet-series extension supplies no bad Euler factors or Fricke
comparison. The package keeps the additional interfaces with their owners.

Checked current TauCetiRoadmap at
`37769f03c170a7bc3e1082df70522a0ad59c5ffd`, including the roadmaps absent from
the atlas snapshot, and the current Tau Ceti library. Existing tangent-dimension
and native Hom/End base-change results are already cited; the cohomology
correction above removes the additional existing-work duplication found here.
No change to an upstream roadmap or another packet was made.

## Lean scope and validation

The file contains actual native endomorphism, tangent, product, primitivity,
integral-model and Weierstrass ℚ-curve signatures, scalar extraction, canonical
H² vanishing and the matrix twisting lemma. The concrete discriminant checks
and the two mod-7 point counts are proved; the other prototype proofs remain
`sorry`.

The successful elaboration does **not** check declarations for every full
mathematical target. `IsModular`, the geometric cocycle and many Tate,
Jacobian, Rosati, Weil-restriction and automorphic interfaces are prose at the
older pin. The endomorphism-field and integral-model examples cover only the
native subsets of their README tests. The scalar helper is not the cocycle,
and H² vanishing alone is not a typed construction of its splitting map.
These limitations are explicitly preserved by the accepted plan's
`suggestedCoverage` and the package's interface notes. They follow the §13
instruction to omit a condition that cannot yet be stated, rather than replace
it with an unconstrained object or an empty proposition. All corresponding
mathematical requirements, names and discriminating tests remain in the
definitive README. Acceptance makes no claim of formalization or executable
coverage of those comments.

Final validation:

- `lean-check research/blueprint/packages/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/Suggested.lean`:
  exit 0, no errors, 35 `sorry` warnings and no other warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityPartIIGL2TypeAbelianVarieties.json`:
  0 errors, 0 warnings.
- Structural comparison: 44 ordered targets, 39 API names, 24 test names and
  every source locator present; metadata, size and process checks passed.
- JSON and whitespace checks passed. Only this job's deliverables and handoff
  are changed.

The complete independent review is accepted; there is no checkpoint or
outstanding package correction.
