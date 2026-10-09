# Handoff: BP-AlgebraicModuliForArithmeticGeometry--R09.7

Issue #6339; worker Codex, session codex-vcPvn2; 2026-10-09.

The target-level pass is **complete**, and **AlgebraicModuliForArithmeticGeometry:R09.7 is planned**. The packet covers all four R09.7a–d target groups. It has 40 nodes (12 definitions, 10 constructions, 18 theorems), 66 planned API items, 66 planned unit tests, six planets, 15 verified baseline declarations, no mathematical gaps and five exact supplier requests. It is not closed: the requests and native prototype refinements remain. Every implementation status is unchecked. Independent review is the next pipeline step.

The deliverables are the [packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json), [reader](../readmes/AlgebraicModuliForArithmeticGeometry--R09.7.md) and [suggested Lean file](../suggested/AlgebraicModuliForArithmeticGeometry--R09.7.lean). No other roadmap, atlas data or application file was edited.

## What the plan establishes

The dependency graph runs from regular coordinates, local orders and strict-SNC boundaries through marked ideals, their three test policies, maximal contact and coefficient/residual presentations. The general-codimension branch retains supported formal division, all five Samuel-certificate conditions, finite-degree monotone-diagram stabilization, determinantal jet ideals and their equimultiple comparison. Common regular semicoherent presentations then produce the history-sensitive invariant, maximum centres and termination. The outputs are embedded and abstract resolution, separate cleanup preserving resolved points, and projective SNC compactification preserving a chosen smooth open. The complex chart deduction and unrestricted Cartier separation adapter have their own exact contracts.

Numerical Hilbert–Samuel functions and the invariant are evaluated on **closed points**, following BM1997 p.213. Intrinsic local functions on all scheme points would make the asserted semicontinuity false even on a smooth affine line. Common regular equations and Jacobson density transfer the centre and closed bad-locus assertions to whole schemes.

Embedded resolution and principalization begin with **empty boundary**. An arbitrary initial SNC boundary can be tangent to a smooth subvariety, so preserving its regular locus alone is insufficient. The smooth-pair theorem has the distinct-germ and noncontainment hypotheses and preserves its resolved locus. Compactification uses a chosen projective closure and projectivity of blowup compositions; properness alone does not establish projectivity. Functoriality is for local isomorphisms, as in Theorem 13.2, with no arbitrary smooth-morphism assertion.

The invariant retains its entire Hilbert–Samuel first entry, positive residual fractions, first-attainment boundary blocks, codimension normalization and terminal zero/infinity distinction. The low-residual monomial guard is essential. Equal-word monomial steps decrease an auxiliary fixed-denominator mass; the bare word need not decrease at each such step. All incomparable maximal first entries are retained when selecting a global centre.

## Supplier interfaces and ownership

1. **StableReduction, Layer 4:** reuse its ordinary Rees/relative-Proj blowup, universal property, charts, exceptional ideal, strict transforms, projectivity, complement isomorphism and flat base change. Its arithmetic-surface resolution does not supply the general characteristic-zero theorem. For two regular generators, a pivot chart is the subalgebra R[I/x_j] of R[1/x_j]; original regular elements stay regular there. This argument does not assume that a blowup is flat.
2. **SchemeAndStackFoundations:SF.0:** coherent ideal localization, completed quotient and residue-field coordinates, regular étale Taylor calculus, local embeddings, gluing, and Jacobson closed-point density.
3. **SchemeAndStackFoundations:SF.3:** effective Cartier ideals and their divisor/product dictionary, plus pullback when equations remain regular. Keep arbitrary schemes for the separation adapter.
4. **AlgebraicModuliForArithmeticGeometry:R09.1:** chosen reduced projective closure with the specified dense open, and projectivity of compositions. Its checked projective-bundle and cohomology nodes do not supply the exact closure construction.
5. **AlgebraicModuliForArithmeticGeometry:A0-extension:** smooth complex analytification carriers, open restrictions and the étale analytic-coordinate/Jacobian bridge. This is a same-bundle interface. No upper-tier GAGA, algebraization or Borel-extension theorem is imported.

The existing A0 attachment `PAPER-BOXER-PILLONI-26/blow-up-separating-two-cartier-divisors` can point to `R09.7/cartier-separation`. The general SNC polydisc deduction is owned here; higher ComplexComparisonPartII consumers should import it from here. This pass records the downward ownership without editing those consumers.

Current TauCetiRoadmap main and current Tau Ceti were checked in addition to the pinned baseline. The newer upstream geometry roadmaps supply no general resolution algorithm. AlgebraicVectorBundles leaves general analytification to a successor, and ModularCurves has special analytic carriers rather than the requested general bridge. Current Tau Ceti has `Ideal.affineBlowup`, `reesAlgebra.awayEquivAffineBlowup` and scheme affine-chart morphisms: packaging must reuse these. Its existing toric analytic boundary membership and normal-form theorems give regression examples for the analytic adapter. Four upstream notes in the packet record the reuse and ownership boundaries.

## Native prototype refinements

The suggested file uses actual scheme morphisms, ideal sheaves, stalk rings, formal power series, finite matrices, native projective Proj schemes and analytic partial homeomorphisms. Cartier and ordinary-blowup predicates are explicit specification adapters for the supplier APIs, rather than another plan for their construction. Every API and test name in the packet occurs as a declaration or labelled example.

The file's final ledger specifies the following omitted conditions, which must be completed before packaging:

- The coefficient-field/completion and regular Taylor-to-germ identification at possibly non-rational closed points.
- Actual geometric test chains and their transform laws, including the restricted exceptional blocks. The equivalence signatures currently type equality of numerical observations at supplied indices. The rescaling example does not type its realization by every geometric chain.
- Full test-class maximal contact and coefficient equivalence; regular residual-stratum equality and full restricted-chain invariance. The residual signatures type the formal guard inequalities and invariance under unit choices.
- The regular-germ application of the full formal Samuel identity and all transformed-certificate/stratum conditions. The formal identity itself and the closed-point common regular stratum are typed.
- Infinitesimal equivalence and all admissible-tower compatibility for the common regular semicoherent family.
- Identification of the computed-entry constructor with the canonical Samuel/contact/coefficient/history recursion, codimension padding and denominator derivation. Its API currently gives first-entry identification, equality from numerical entries, and the hypersurface first-entry formula. The three recursive tests compute actual coefficient orders; they do not claim a completed canonical algorithm.
- Coherent maximum-centre ideals, the invariant certificate, permissible whole-tower selection and the termination comparison. The set/order prototypes alone do not assert these geometric conclusions.
- Finite ordinary-blowup towers, their specified strict transforms and every surviving/born exceptional label for the global outputs. The smooth-pair output does not yet identify its boundary with transforms of the input boundary. Whole-tower comparison over open isomorphisms must be attached.
- Identification of the native analytic chart with the algebraic SNC family through the requested analytification bridge.

These are explicit target-level refinements in coverage.remaining. They are not new mathematical gaps and no unavailable condition is replaced by an unconstrained proposition field. The definitive statements, hypotheses, API and tests are in the reader and packet. A follow-up should begin with the five owner interfaces, then complete the above native contracts and proofs without re-planning ordinary blowups or importing higher-tier comparison results.

## Sources and corrections

The full published BM1997 article, *Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant*, Inventiones mathematicae 128 (1997), pp.207–302, was read including the proof sections and invoked inputs. The short Chapter-I arXiv extract does not suffice. Printed-page locators were audited against the full paper. BM1989, *Uniformization of analytic spaces*, Theorem 5.2.1 and its proof, pp.820–821, supplies descending Hilbert–Samuel stabilization. Boxer–Pilloni, *Higher Hida theory for Siegel modular forms*, author PDF dated 5 November 2025, §4.1.10 and Proposition-construction 4.1.11, p.42, supplies Cartier separation, with the use in 4.1.13, pp.42–43 checked. The packet records public URLs, access date and available PDF hashes. No source remains unread for the stated proof route and no restricted book was needed.

Two source slips were verified in the published PDF page images and recorded as sourceIssues, in our own words:

- **E1901**, Example 2.1, p.226: the year-one parenthesized monomial must involve x₂ rather than x₃ to agree with its chart substitution. The intended subsequent calculation already uses the correct variable.
- **E1902**, end of the proof of Theorem 9.6, p.282: the derivative bound must be strict. Differentiating a coefficient t² marked 2 through order 2 adds a unit and erases the intended stratum; Definition 7.9, p.265, uses the strict bound.

No published correction was found in the recorded public searches. Independent review must check both findings. The displayed parenthesized count in Remarks 9.15(2), p.282, was also checked against the image: its parentheses are correct despite their loss in text extraction, so it is not an additional source issue.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.7.json` passed with **zero errors and zero warnings**, using the real pinned declaration index. All 15 cited declarations were found; their actual statements were read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

`lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.7.lean` elaborated successfully at those pinned commits, with **only declaration-uses-sorry warnings**. The API/test-name and planet checks agree with the packet. Compilation validates native signatures; it proves none of the unfinished results or planned tests.

Submit this complete planned pass for independent review. After acceptance, discharge its requests and explicit native conditions before roadmap packaging. The worker claims no second issue.
