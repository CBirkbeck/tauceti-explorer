# PKG-EllipticCurveModularityImaginaryQuadratic

Completed by Codex (GPT-6), session `codex-SnFf0f`, on 8 October 2026.
Issue: [#7470](https://github.com/CBirkbeck/tauceti-explorer/issues/7470).
The bot confirmed the claim on
[comment 6068602330](https://github.com/CBirkbeck/tauceti-explorer/issues/7470#issuecomment-6068602330).
Branch: `codex-SnFf0f-package-7470`.

## Delivered

This is a complete packaging submission under PROTOCOL §20. It turns the
accepted plan into the three-file roadmap directory; it does not implement
the roadmap or close the accepted plan's foundational and arithmetic gaps.

- [README](../packages/EllipticCurveModularityImaginaryQuadratic/README.md):
  117,838 bytes, with motivation, precise boundaries, conventions, shared
  lifting contracts, existing library vocabulary, eight ordered layers and
  references. All 68 targets, 69 API items and 69 named checks are retained.
  Related targets share mathematical subsections rather than reproducing the
  original node ledger. Every target has prerequisites and source locators.
- [Suggested.lean](../packages/EllipticCurveModularityImaginaryQuadratic/Suggested.lean):
  115,216 bytes, with one header, one import block and one namespace. The
  original executable coordinate declarations are preserved. Full mathematical
  contracts, including the additional geometric assertions of partial
  signatures, are organized in comments in the same layer order as the README.
- [metadata.toml](../packages/EllipticCurveModularityImaginaryQuadratic/metadata.toml):
  exactly `topic = "math.NT"` followed by a newline.
- This handoff note. No packet, original reader document, original suggested
  file, roadmap definition, upstream roadmap or atlas data is changed.

Inputs were the accepted `EllipticCurveModularityImaginaryQuadratic` packet,
its reader and suggested file. WORKERS, both protocols and UPSTREAM_GUIDE were
read. The upstream JacobianChallenge and Multiquadratic READMEs were read in
full. There were no link-map entries for this roadmap. Its accepted baseline
audit lists 15 Mathlib declarations; their statements were inspected at the
Mathlib pin and the package uses those carriers.

## Lean validation and its exact extent

Ran:

```text
lean-check research/blueprint/packages/EllipticCurveModularityImaginaryQuadratic/Suggested.lean
```

The final file returned exit code 0: **0 errors and 109 warnings, all
`declaration uses sorry`**. Available memory was 111 GB before the check.
No build, cache download, update or language server was started.

The executable portion has 18 definitions, 52 API lemmas, three ellipticity
instances and 54 `example`s. It imports five individual Mathlib modules.
It is a signature prototype: the proofs and examples use `sorry`, so successful
elaboration does not verify their mathematical conclusions.

Five definitions/constructions have no executable signature:
`Modular`, `symplecticTwist`, `shortEquationFamily`, `cartanCurve` and
`quarticTorsionClasses`. Their 15 API items and 15 named examples remain
explicitly specified in comments. Two additional geometric API items,
`genusOneSpecialPoints_on_curve` and `quarticImaginaryPoints_j`, are also
comment contracts. The 43 theorem targets and two comparison targets require
supplier carriers or arithmetic certificates and remain named mathematical
contracts, not executable theorems. Several executable coordinate APIs express
only the algebraic part of the full interface; the README and comments retain
the model comparison, geometric degree, group or base-change assertions.
This preserves the accepted input's honest omissions under PROTOCOL §13;
no arbitrary proposition parameters, phantom carriers, axioms or Prop-valued
`sorry` definitions have been added to manufacture signatures.

The shared checker used Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, exactly the accepted pin.
Its enclosing Tau Ceti checkout was
`cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the specified
`f790474821cf4256814db967cb154e7af3d0c369`. No available shared checkout
inspected had the latter HEAD. Since this suggested file imports only Mathlib,
its executable declarations do not depend on Tau Ceti modules. The result is
validation against the pinned Mathlib, **not validation of any Tau Ceti
supplier interface or a joint build at both pins**. No shared checkout was
modified to obtain a different environment.

Final suggested-file SHA-256:
`85da16d0011ffa50c4f6925e3b2cb1ecd3e9a266ea0afae2afa8a5cd6bf35641`.

## Other checks and source treatment

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityImaginaryQuadratic.json`
reported 0 errors and 0 warnings. Its unchanged result is 68 nodes, 69 API
items, 69 tests, 31 planets, 15 baseline declarations, 16 gaps, 36 supplier
requests and eight planned layers; none of the layers is marked closed.

A scratch-only package audit checked every target/API/test name, uniqueness,
eight-layer order, all own prerequisites preceding their targets, source page
locators, metadata, the 200 KB README bound, import/namespace consistency and
absence of process language, private paths and placeholder axioms. It passed.
The nonsplit-Cartan conic is placed after the genus-zero models it consumes.
The final README SHA-256 is
`190a1baf39101ae5d1aaf8e472c90e53b08179a1138c02fc8cbe1fd696ab9e9b`.

Checked the relevant CN §§6–7 results, its introductory endpoint and qualified
lifting statement; AKT's independent lifting statements and §9 seed/selection
inputs; FLHS v4 Lemmas 15.3–15.4 on p.29; Bruin–Flynn §2; Box Proposition 3.1
and the weaker inclusion used here; and Zywina's coefficient family and
Proposition 5.2. All five pinned accompanying Magma files were read in full,
not executed. The six PDFs and five scripts matched the accepted source
SHA-256 values. Sources were used for mathematical statements and locators;
no source passages, book material or downloaded files are in the deliverables.
The Gaussian record is used as the accepted equation/data reference, never as
an independent modularity proof object.

Locators made more explicit include Zywina Proposition 5.2 on author-PDF p.6
(proof §5.4, p.9); AKT Proposition 9.12 on p.79, Lemma 9.11 on pp.78–79 and
**Corollary** 9.4 on p.73; CN Theorem 5.2 across pp.73–74; and Box Proposition
3.1 across pp.8–9. BF references explicitly use PDF page positions because
the author file has no printed page numbers. The printed-page convention of
each fixed source is stated in the bibliography.

## Accepted limitations preserved

The following work belongs to the imported interfaces or the future
implementation, not to an additional claim by this worker. The existing
packet's G1–G16 remain unchanged.

| Input gap | Required interface or certificate retained in the package |
|---|---|
| G1 | Genuine CM, number-field GL₂ automorphic, weight-zero and attached-representation carriers; compatible coefficient fields and dual Tate normalization. |
| G2 | Pure elliptic local–global comparison retaining monodromy and the CM Steinberg ordinarity criterion. |
| G3 | CM soluble globalization with local open conditions, avoidance and an all-place generic witness; CM potentially good reduction and the nonintegral-j Tate witness. |
| G4 | Independent AKT Theorems 7.1/8.1 from the CM extension of R21.4, plus R12.4 discriminant coupling/descent. Their hypotheses are written explicitly in the shared-interface section. |
| G5 | The exact qualified CL.9 lifting supplier, preserving the projective-field exception and the cyclotomic-degree-three/A₄ qualification. |
| G6 | Number-field quantitative image estimate, coefficient-lattice denominator asymptotic and the distinct residual genericity lemmas. |
| G7 | Shared Cartan/mixed coarse compactification and normalized genus-zero coordinate comparisons, without a coarse universal elliptic curve. |
| G8 | Quotient-model inverse maps and an exact rank/torsion/saturation certificate for B. |
| G9 | Level-fifteen coordinate/j/cusp comparisons, quadratic torsion enumeration, all eight Gaussian j-orbits and a complete Faltings–Serre certificate. |
| G10 | The separate GL₂-type/Q-curve endpoint and separately routed FLHS real-quadratic endpoint. No invented stage ID is assigned to the unwritten Q-curve supplier. |
| G11 | Genus-one Jacobian transformation, rank bound, rational divisors, complete linear systems, Brauer–Severi descent and local obstruction. |
| G12 | Genus-two normalization/j/Fricke maps, two-descent and the exhaustive twenty-class Jacobian table. |
| G13 | Full exceptional mod-5 normalizer image, cyclotomic irreducibility, point matching and the conjugate 8100.2/8100.3 conductor-label comparison. |
| G14 | Quartic smoothness, canonical/model/quotient/j maps, automorphism comparison and exact elliptic-factor ranks. |
| G15 | Quartic torsion witnesses, finite Jacobian reductions, divisor lists, differential checks and empty lifted bad-coset intersections. |
| G16 | Algebraic rank-zero certificates for the four indicated E15 twists and quadratic rank decomposition. |

The two inherited upstream notes remain relevant: JacobianChallenge needs the
rational-divisor/Brauer–Severi descent interface without a rational basepoint;
EllipticCurves needs the geometric-CM potentially-good-reduction theorem in
its local layer. Neither upstream roadmap was changed or replanned.

## Input/source details for the independent package review

The accepted CN source corrections are preserved mathematically without
reproducing its errata ledger in the README: reduction is over the extended
local field; Es35 has only real quadratic torsion growth; the second quartic
index uses G2; mixed levels use their respective primes; the switching lemma
uses 5/3 in the corresponding order; the genus-one Riemann–Roch numerators
are additive; and rational genus-two points at infinity use rational j rather
than the false Galois/Fricke equality. The latter equality is restricted to
nonrational affine points of exact degree two with rational x.

Two cosmetic slips in the original plan are normalized only in the package:
`quartic1Coordinates` contains a stray explanation about the second quartic's
scalar 25, and its preservation API writes multiplication by 1 without a
separator. The package states the first transformation's own identity and
uses `quartic1(v)`. The original executable signature already has the correct
multiplication, and neither input file was edited. The differing √−11
conductor labels remain a comparison-certificate requirement, not an asserted
source error.

No remaining packaging work or new job is being handed off. The independent
review should recheck the package against the accepted input and rerun Lean,
while preserving the distinction between elaborated coordinate signatures and
the complete mathematical contracts.
