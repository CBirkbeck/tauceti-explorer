# BP-AlgebraicModuliForArithmeticGeometry--R09.1 handoff

## Submission

Codex session `codex-SoH7Cg`, issue #6333, one-job branch `codex-SoH7Cg-r09-1`. The bot confirmed the claim on 9 October 2026: [claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6333#issuecomment-6082183232). No second job was claimed and this session does not review its own work.

This is a complete target-level planning pass for exactly `AlgebraicModuliForArithmeticGeometry:R09.1`, with coverage **planned**, not closed. It is not a partial checkpoint and does not claim formalisation. All targets in the predecessor's R09.1 coverage and the RS-27 narrowing are addressed. The two mathematical source gaps and the one upstream registry gap are recorded explicitly.

Deliverables:

- [Packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.1.json): 31 nodes — 11 constructions, 14 theorems, 3 comparisons, 2 definitions, 1 application; 47 API items, 41 unit tests, 6 planets, 23 baseline declarations, 3 gaps and 6 supplier requests. Every node retains `implementationStatus: unchecked`.
- [Reader](../readmes/AlgebraicModuliForArithmeticGeometry--R09.1.md): mathematical statements, hypotheses, proof routes, every API/test, source locators, ownership, prototype omissions and source corrections.
- [Suggested file](../suggested/AlgebraicModuliForArithmeticGeometry--R09.1.lean): native mathematical carriers, all definition/API/test names and 18 named theorem/comparison/application interfaces. Unavailable hypotheses are explicitly omitted, never replaced by unspecified propositions. Its chart tests use actual determinants and the explicit semilinear graph equation.

## Validation

The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Cited declarations and their hypotheses were read at the pin. Relevant Tau Ceti source files in the shared build were checked byte-for-byte against that commit. Current read-only TauCetiRoadmap and Tau Ceti sources were also inspected to avoid replanning work newer than the atlas snapshot.

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.1.json --index <pinned declarations.tsv> --json`: zero errors and zero warnings; one stage planned, zero stages closed.
- `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.1.lean`: final run on 9 October 2026 exited 0; no errors; all warnings are declaration-uses-sorry warnings. Memory was checked before compilation, and no language server, Lake build/update/cache operation or separate build environment was started. No compile remains running.
- Namespace-aware audit: every one of the 47 API declarations, 41 labelled examples and 18 named target interfaces exists in the suggested file; the reader reproduces the mathematical statement, hypotheses and proof route of all 31 nodes.
- The source-issue and source-version validators pass. `git diff --check` passes. Only this job's four permitted deliverables are changed.

All source passages are described in our own words with theorem/section/page references. Public PDF and original-scan hashes are in the packet. No source file or source passage is committed. The cleared-library index was inspected; none of its cleared nonpublic books was needed, and no uncleared book copy was used. Scratch downloads and compile logs are removed after opening the pull request; the durable evidence is the locator/hash ledger and validation summary here.

## Ownership and routing

Apply the confirmed [RS-27 narrowing](../restructure/RS-27.result.json) and [RT-AREA-algebraicgeometry/12](../redteam/RT-AREA-algebraicgeometry.result.json): import 0G's finite locally free quotient Grassmannian/projectivity and O-linear invariant loci; import StableReduction Layer 2 relative Proj, projectivity and relative ampleness. R09.1 gives coherent quotient extensions, rank-one comparisons, twists and cohomology, smoothness/Plücker geometry, relative partial flags, relative very ampleness, Hilbert/regularity/boundedness and the distinct semilinear equations.

The current upstream AlgebraicVectorBundles L0B/L0C supply sheaf rank, symmetric/exterior powers, determinants and pullback comparisons. They are existing work, but their identifiers are missing from the atlas registry. They are recorded as an import gap rather than forged library declarations or a duplicate construction.

SF.5 already owns its finite locally free projective bundle, complete flag object/splitting principle, absolute projective-field very ampleness, componentwise big-line definition, first Chern operators and proper degree. This packet imports those targets and asks for the proper Euler-polynomial/mixed-intersection extension in that same direction. R09.1 constructs broader relative objects and their comparisons. SF.5's older relative-Proj edge to SF.0 is stale under RS-27 and must be repaired to StableReduction by its own worker; this job does not edit SF.5.

The six requests name ModularCurves 0G, StableReduction Layer 2 (arbitrary-quasicoherent Proj extension), JacobianChallenge B/C (all-dimensional cohomology and base-change exports), and SF.4/SF.5 (cotangent/geometric-reducedness and Euler/intersection inputs). Each request gives an exact mathematical contract and consuming node ids. They remain open, so coverage cannot be marked closed.

There is no upward dependency on tier-5 ComplexComparisonPartII; it imports the algebraic results here. ReductiveGroupsPartII is tier 1: its RG2.0a affine Weil restriction belongs to ModularCurves 0F under RS-27, not R09.1. Its broad preliminary arithmetic-moduli citation must point to lower foundations rather than the entire tier-4 package. This pass moves no target from a higher owner, and changes no other roadmap.

The independent R09.3 worker must apply the rest of RT-AREA-algebraicgeometry/12: import StableReduction's polarized étale descent and 0E's polarized projective-curve fpqc descent. Chow lemma/proper modifications, Hilbert/Quot/Hom/Isom representability and flat universal Hilbert families are R09.2. Charles's Brauer obstruction on p.504 belongs to the later Picard/descent application, not this stage. Chow support here is not silently upgraded to an arbitrary-base cycle functor.

## Exact remaining inputs

1. Register the current upstream AlgebraicVectorBundles L0B/L0C ids, then replace the packet's administrative import gap by those exact endpoints. Do not create a second sheaf-operation library.
2. Obtain and read the corrected **algebraic** numerical very-ampleness proof with dimension `d≥1`, `v=L^d>0` and `w=K_X·L^(d−1)` fixed. The intended original is Kollár–Matsusaka, *Riemann–Roch type inequalities*, AJM 105 (1983), 229–252, together with **T. Matsusaka**, *A Note and a Correction to Riemann–Roch Type Inequalities*, AJM 106 (1984), no.6, 1265–1268. JSTOR refused the original and there is no cleared local copy. Charles Lemma 3.5, pp.507–508, establishes the K-trivial application; Siu Theorem 0.1, pp.1387–1388, confirms the numerical statement but its analytic proof is not imported. This gap affects numerical-very-ampleness and smooth-polarized-boundedness.
3. Supply a read proof of Grothendieck exposé 221 Lemma 2.4, exposé p.7/collected p.255, for arbitrary-characteristic relative reduced equidimensional geometric-fibre degree bounds. The packet gives a characteristic-zero Chow-support/generic-flatness/geometric-reducedness spreading proof. The original lemma supplies no proof of the relative positive-characteristic coefficient-descent step; that extension remains an explicit gap. Do not claim that fixed degree bounds arbitrary embedded structures, or replace the reduced support by a flat universal Chow subscheme.

The independent review should check the exact supplier scope and these unresolved inputs, the proper multivariable Euler-polynomial import, the determinant-dual convention, the scheme-level Plücker/chart comparison, the absolute-versus-coefficient Frobenius distinction, and the prototype limitation table. The suggested file intentionally cannot yet express higher-direct-image, cycle-degree and rational-map supplier interfaces; their full mathematics is stated in the reader and packet.

## Source findings and design compatibility

Four source issues are recorded with version searches:

- E1: Grothendieck Theorem 2.1, exposé p.6/collected p.254, needs the necessary-and-sufficient boundedness statement. The author's published 1962 erratum p.302 already supplies the correction.
- E2: Alper 19 August 2024 draft, Theorem 1.3.8 proof p.58, has the wrong sign in the H¹ bound; subtract the subsheaf polynomial. The 5 January 2026 version corrects the sign.
- E3: Alper 5 January 2026 draft, Theorem 2.3.8 proof pp.57–58, omits 1 in the auxiliary regularity index. The final bound includes it. The quadratic ideal O_P¹(-2) with m₁=0 is a concrete counterexample to the auxiliary vanishing as printed. No later correction was found in the author's version index; this is recorded as new, for independent confirmation.
- E4: Stacks Commutative Algebra §57, Lemma 57.7/tag 00JT, p.134, reverses containment of a prime and its homogeneous-part ideal. The example `(x−1)⊂k[x]` has homogeneous-part ideal zero. Martin Orr already reported this in section comment #11304 on 17 March 2026; reply #11474 declines the correction and the text remains unchanged. This is independently justified, previously reported, and not claimed as a new discovery.

The open [Mathlib scheme Grassmannian PR #14686](https://github.com/leanprover-community/mathlib4/pull/14686), inspected at head `3e73c005f289200515e1694d484e89c53539be08`, follows quotient rank and affine graph charts. The public [Zulip discussion](https://leanprover-community.github.io/archive/stream/116395-maths/topic/Grassmannians.html), 25 June 2025, confirms the scheme/manifold convention distinction. The packet uses that shape and the pinned native module Grassmannian. The PR is not a baseline implementation or a blocker, no source was copied, and no private AIM24 thread was accessed. Open-PR title searches for projective bundle, Hilbert polynomial, coherent cohomology, Plucker and flag variety found no matches; that limited search is not an exhaustive absence claim.

Next step: independent review of this complete single-stage pass; resolve/import the listed endpoints before any package claims closure. No self-review or second job is authorised for this session.
