# Roadmap: Arakelov geometry and heights of abelian varieties

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Supply the arithmetic intersection and height theory needed for Faltings' finiteness proof. General projective heights and Northcott are necessary but do not construct the stable Faltings height or prove its comparison with an arithmetic moduli height.

## Existing material and ownership

ArithmeticHeights #287 is the proposed owner of general absolute/Arakelov heights and Northcott; inspect its exact declarations before assigning overlap. JacobianChallenge/R10 supply polarised abelian varieties, moduli and Hodge bundles; R11 supplies semistable/Néron models. This roadmap owns the additional abelian-specific metric, degeneration and height-comparison theory. The global boundedness and finiteness conclusions are R28, not hypotheses here.

## Conventions

State the number field, integral model, archimedean metric and normalisation of arithmetic degree. Distinguish the model-dependent height from the stable Faltings height after semistable base change. Prove independence and scaling rather than absorbing them into a definition. Height comparisons include constants and fixed dimension/polarisation parameters.


<a id="r35-1"></a>

## R35.1. Hermitian bundles and arithmetic degree

**Milestone:** `R35.1`

Construct the hermitian line/vector bundles over arithmetic curves used in the proof, their determinant, tensor and dual operations, and arithmetic degree. Compare with the general height owner's normalisation. Prove the product formula and base-change/degree formulas including archimedean factors. Supply the arithmetic intersection statements invoked by the moduli-height comparison.

**Dependencies:** [AbelianSchemesAndArithmeticModuli A2](../AbelianSchemesAndArithmeticModuli/README.md#a2); [AlgebraicModuliForArithmeticGeometry R09.3](../AlgebraicModuliForArithmeticGeometry/README.md#r09-3).

<a id="r35-2"></a>

## R35.2. The Hodge bundle and Faltings metric

**Milestone:** `R35.2`

Construct the determinant of invariant differentials of an abelian scheme or semistable model and equip it with the metric defined by integration at complex places. Prove positivity, invariance under change of basis and functoriality. Establish the normalisation under products and duals and compare with the elliptic period convention. The archimedean metric is data with a construction, not an arbitrary norm chosen to satisfy a height theorem.

**Dependencies:** [AbelianSchemesAndArithmeticModuli A5](../AbelianSchemesAndArithmeticModuli/README.md#a5); [ArakelovGeometryAndAbelianHeights R35.1](README.md#r35-1); [PELModuli M2](../PELModuli/README.md#m2); [NeronModelsAndSemistableAbelianVarieties R11.1](../NeronModelsAndSemistableAbelianVarieties/README.md#r11-1) for the global differential lattice over the Dedekind base.

<a id="r35-3"></a>

## R35.3. Stable Faltings height

**Milestone:** `R35.3`

Define the height from the hermitian Hodge line and prove its behaviour under finite extension. Use semistable reduction to define the stable height and prove independence of the extension and model. Separate correction terms at bad places from the stable value. Include the precise relationship to polarised and unpolarised objects needed in R28.

**Dependencies:** [ArakelovGeometryAndAbelianHeights R35.2](README.md#r35-2); [NeronModelsAndSemistableAbelianVarieties R11.3](../NeronModelsAndSemistableAbelianVarieties/README.md#r11-3).

<a id="r35-4"></a>

## R35.4. Isogeny variation

**Milestone:** `R35.4`

Prove the isogeny formula comparing heights through the degree and the integral cokernel of the map on invariant differentials, with the archimedean normalisation fixed. Treat primes dividing the isogeny degree using finite-flat/p-divisible-group theory, not a prime-to-degree argument. Supply the inequalities and local terms that R28 uses to prove boundedness in an isogeny class.

**Dependencies:** R35.3 (preceding layer).

<a id="r35-5"></a>

## R35.5. Moduli and theta-height comparison

**Milestone:** `R35.5`

Construct the relevant projective/modular height on a fine-level polarised moduli scheme, relate its line bundle to the Hodge bundle, and prove the comparison with the Faltings height. Include the behaviour near the boundary and the compactification/degeneration estimates actually used. A quasi-projective embedding alone does not imply a two-sided height comparison.

Import the actual universal family/Hodge line from PELModuli M2/M6 and its extended line and projective compactification from ShimuraCompactifications C4–C5. This stage proves the metric growth and arithmetic inequalities on those objects; it does not rebuild the compactification. Work first over the good-prime integral base of the chosen polarized datum. For a fixed dimension and polarization type, remove its finite exceptional primes only with explicitly proved local correction bounds; use semistable extension and polarization/Zarhin comparisons for the Faltings application. No all-prime PEL smoothness is inferred from C5.

**Dependencies:** R35.4; PELModuli M2; PELModuli M6; ShimuraCompactifications C4; ShimuraCompactifications C5.

<a id="r35-6"></a>

## R35.6. Inputs to finiteness

**Milestone:** `R35.6`

Export the bounded-height comparison and product/polarisation identities needed for the use of Northcott and Zarhin's trick in R28. Keep the arithmetic bound for all abelian varieties in a given isogeny class as a theorem proved in R28 from these estimates. Prove every constant-dependence statement required to turn height bounds into a finite set of moduli points.

**Dependencies:** R35.5 (preceding layer).

## Required examples and checks

Compute the behaviour under finite field extension, product and multiplication-by-n, and compare an elliptic example with its period lattice. Check the stable/nonstable distinction for bad reduction.



## References

FALTINGS83, FALTINGS_CHAI, ARAKELOV, ZARHIN. The bibliography records what was inspected and what remains to be transcribed.

## Source anchors and prototype coverage

- ArakelovGeometryAndAbelianHeights source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `R35.2` | Construct the Hodge metric by integration and prove determinant-basis scaling against the product formula; record real/complex place weights explicitly. |
| `R35.4` | Identify the finite cokernel of differential pullback under an isogeny, with its local lengths at degree-dividing primes, before deriving a height inequality. |
| `R35.5` | Prove metric growth near the compactification boundary and the arithmetic comparison constants at fixed dimension/polarization type; control exceptional primes by a named local estimate. |

**Producer–consumer handoff.** Faltings finiteness uses R35.6 plus Northcott with bounded degree and explicit constants. GrossZagier imports hermitian lines, but point heights remain its distinct construction.

**Acceptance.** Check multiplication-by-n, semistable base extension and a bad-reduction elliptic example. A quasi-projective embedding alone cannot satisfy the comparison.

**Source-readiness boundary.** Faltings–Chai boundary/metric estimates and isogeny local lengths need primary proof decomposition.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
