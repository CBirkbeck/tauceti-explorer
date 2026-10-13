# Modular curves, following Katz–Mazur, Part II: R13.4

R13.4 joins the algebraic coarse construction of R13.4a to the later generic-fibre and correspondence comparison of R13.4b. Its role is to expose their combined interface. The two stages own the mathematical objects and results; R13.4 introduces no additional curve, definition, theorem, API or planet.

The [reviewed library audit](../../../data/library-coverage.json) classifies R13.4 as a process layer. The [accepted RS-06 decision](../restructure/RS-06.result.json) retains its stable identifier for this interface and keeps it out of the prerequisites of R12.3. The [accepted R13.3 packet](../packets/ModularCurvesPartII--R13.3.json) already closes its process coverage while leaving both mathematical suppliers planned. This document specifies how those existing targets are consumed. It does not discharge their supplier contracts. The [R13.4 packet](../packets/ModularCurvesPartII--R13.4.json) records the imports without copying their nodes.

## Owners and construction order

First construct the coarse curve algebraically in R13.4a from the actual compactified level stack of R13.2 and the formal boundary input of R13.3. Then R12.3 compares that algebraic curve with its analytic uniformization. R12.6 supplies the analytic Hecke action, and R13.4b compares components, boundary maps and Hecke normalizations using this earlier work. Requiring all of R13.4 before R12.3 would reverse this order and introduce a cycle. The dependency on the algebraic input is specifically R13.4a.

The following are exact node references in the accepted R13.3 packet. All have implementation status `unchecked`. The complete statements, hypotheses, proofs, APIs, specification tests and supplier requests remain with that packet. The suffixes below are appended to the indicated stage ID.

| Owner | Imported node suffix | Interface role |
|---|---|---|
| `ModularCurvesPartII:R13.4a` | `integral-coarse-curves` | Algebraic compactified coarse object and j-map |
| `ModularCurvesPartII:R13.4a` | `coarse-normalization-comparisons` | Identification of affine opens and the existing compactification |
| `ModularCurvesPartII:R13.4a` | `legal-coarse-base-change` | Permitted change of base |
| `ModularCurvesPartII:R13.4a` | `coarse-cusp-regularity` | Integral Γ₀ boundary regularity |
| `ModularCurvesPartII:R13.4a` | `modular-polynomial` | Cyclic polynomial realization, with its own degree convention |
| `ModularCurvesPartII:R13.4a` | `projective-scalar-coarse-quotient` | Scalar-framed quotient and determinant-square-class convention |
| `ModularCurvesPartII:R13.4a` | `split-cartan-quotient` | Generic-fibre Fricke/normalizer comparison |
| `ModularCurvesPartII:R13.4b` | `generic-component-comparison` | Generic components and cusp fields |
| `ModularCurvesPartII:R13.4b` | `compactified-map-comparison` | Degeneracy maps and boundary differential comparison |
| `ModularCurvesPartII:R13.4b` | `hecke-normalization-comparison` | Agreement of the geometric and analytic actions |

The last three R13.4a applications retain their original ownership and source restrictions. In particular, a generic-fibre quotient comparison supplies no integral comparison at the level-dividing prime. Their definitions and tests are imported rather than repeated as R13.4 declarations. The construction and final Hecke-comparison nodes already carry the accepted packet's aggregate coverage credit; their actual parents remain R13.4a and R13.4b.

## Existing upstream boundary

[ModularCurves Layer 9D](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/ModularCurves/README.md#9d-coarse-moduli-schemes-and-finite-quotients) owns the affine coarse-moduli construction. Its Layer 10 compactification concerns prime N≥5, diamond subgroups of (ℤ/Nℤ)×/{±1}, and base ℤ[1/N]. R13.4a identifies its construction with those curves on exactly that range. Full-level, fixed-pairing, composite-level and bad-level compactifications remain the Part II extension. The [reviewed links](../links/tauceti_TauCetiRoadmap_ModularCurves.json) already assign both comparisons to R13.4a.

Layer 10's suggested Lean uses Mathlib's relative-normalization carrier and universal property for a qcqs scheme morphism. Those generic declarations supply neither modular finiteness nor smoothness. To recognize a compactification, the candidate must also be finite over the projective j-line, normal, and contain the common affine level curve as a schematically dense open, meeting every component. These are obligations of `coarse-normalization-comparisons`. For example, adjoining a disjoint projective component mapping to j=∞ produces a proper normal candidate with the same chosen affine open, but that open fails to meet the extra component. Properness and an agreement on the chosen open cannot suffice.

## Checks on the combined interface

These are checks on imported contracts, not new specification tests for an R13.4 definition.

**Level problem and components.** Fix an open H≤GL₂(Ẑ) containing Γ(n). At level one take H=GL₂(Ẑ), giving the projective j-line. Honest full level 5 over ℂ has four determinant components, whereas fixing a primitive Weil-pairing value selects one. The algebraic construction must retain the entire generic level algebra appropriate to its moduli problem, and the comparison must use those same components. The supplier's `integralCoarseCurve_levelOne`, `integralCoarseCurve_fullFive` and `integralCoarseCurve_noUniversalFamily` controls distinguish the level-one object, the full-level component count and coarse existence from descent of a universal elliptic curve. The underlying integral coarse geometry is supported by Česnavičius §6.1, p.62, Lemma 6.2 and Proposition 6.3, p.63.

**Change of base.** For Γ(n)⊂H, the coarse curve is smooth over ℤ[1/n], and formation of its coarse space commutes with arbitrary base change over ℤ[1/gcd(6,n)]. Thus n=5 allows arbitrary ℤ-bases, including residue characteristics 2 and 3, whereas the general n=4 statement inverts 2. The proof at a level-prime-free 2 or 3 uses the additional normal-fibre and rigidification argument; tame invariants alone do not explain that range. Γ₁(4) in characteristic 2 obstructs an unrestricted claim. These are the distinct statements of Česnavičius Proposition 6.4, pp.63–64 and Remark 6.6, p.64, consumed through `legal-coarse-base-change`.

Coarse formation and relative normalization have separate change-of-base theorems. For instance, the normalization of Spec k[t] in D(t) is Spec k[t]. Base changing that normalization to t=0 gives Spec k. Base changing D(t) first gives the empty scheme, whose relative normalization over Spec k is empty. An arbitrary normalization base-change claim would identify different schemes. Smooth-base-change infrastructure in Mathlib does not remove this obstruction.

**Boundary and stack data.** Česnavičius Theorem 6.7, pp.64–65 implies regularity of every integral Γ₀(N) cusp, including those in characteristics 2 and 3. It leaves the closed bad-prime points with j=0 or 1728 outside its regular open. This does not imply smoothness of an entire level-dividing fibre. Proposition 6.9, p.65 identifies the naive and refined Γ₀ coarse curves, but the refined stack remains part of the construction and boundary-map contracts. The equality of coarse curves does not identify the stacks or descend their universal families.

At the prime-level upstream boundary, retain the scheme-theoretic fibre over j=∞. For X₀(N) with prime N≥5 over ℤ[1/N], its divisor is [∞]+N[0], of total rank N+1; its reduced support consists of two sections. Replacing that divisor by its reduced support would destroy the widths used in the completed-ring map comparison. This control is inherited from current upstream Layer 10.

**Maps and trace.** The late comparison must compare the two algebraic degeneracy maps on completed cusp rings and on the invariant differential. Conrad Theorem 4.4.3, pp.43–46 constructs finite flat stack maps and the extended isogeny map on invariant differentials. Passing to categorical coarse maps alone supplies no finite-flat descent theorem. `compactified-map-comparison` retains its exact finite-correspondence and stabilizer-descent suppliers in AlgebraicModuliForArithmeticGeometry R09.5; R14.1 supplies the geometric correspondence. No new general descent theorem belongs here.

The coherent pullback, isogeny differential and trace compose to pTₚ, as in Conrad equation (4.5.1), p.46. The local divisibility theorem is Theorem 4.5.1, pp.46–47. For weight 2 and p∤N, Example 4.5.3, p.48 gives the normalized coefficient aₙₚ(f)+p·aₙ/ₚ(⟨p⟩f), with the second term zero when p∤n. The unnormalized trace has an additional factor p. The Picard and étale actions retain the integral push–pull convention of their existing owner nodes; division by the degree is not inferred from the coherent normalization. `hecke-normalization-comparison` imports R14.1's analytic comparison, coherent trace and separate full/cyclic correspondence contracts.

## Coverage and sources

Only the process interface R13.4 has closed coverage here. R13.4a remains planned with finite-inertia/completion, refined-stack and componentwise normalization obligations. R13.4b remains planned with generic component/cusp-field conventions, compactified-map descent and integral realization comparisons. The accepted R13.3 packet remains the authoritative location for their requests, remaining lists and recorded gaps. Neither their mathematical closure nor a formal implementation follows from the aggregate's process status.

The [suggested Lean file](../suggested/ModularCurvesPartII--R13.4.lean) introduces no declarations. It imports the normalization infrastructure without restating it. R13.4 has zero new definitions, API items, definition tests and planets; the imported targets keep their own APIs and tests.

The checks above use Kęstutis Česnavičius, *A modular description of X₀(n)*, [arXiv:1511.07475v2](https://arxiv.org/pdf/1511.07475v2), §6.1–6.9, pp.62–65, and Brian Conrad, *Arithmetic moduli of generalized elliptic curves*, [author PDF](https://math.stanford.edu/~conrad/papers/kmpaper.pdf), Theorem 4.4.3 and §4.5, pp.43–48. Conrad locators use the 18 July 2006 author version, not the published journal pagination. The packet records both files' hashes and inspection locators. The accepted supplier review's corrections to other source passages remain with that review; no uninspected source is claimed as a new authority here.
