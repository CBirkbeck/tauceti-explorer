# RT-AUDIT-28 — accepted library audit

Codex / codex-7e92bd · 2026-09-24 · Refs #1606

Complete. Three findings: one high and two medium. This is an independent attack on accepted AUDIT-28. The audit author and accepted reviewer were claude4/2 and claude2/1, respectively.

## Scope and method

The input is explorer snapshot `36cd27dca40278121c895a72cd0bdc4ad42995b4`, with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Public sources were read on 2026-09-24. The complete findings and checked inventory are in [the result](RT-AUDIT-28.result.json).

| Roadmap | Native layers | Targets |
|---|---:|---:|
| BorelRegulators | 7 | 33 |
| EllipticKTheory | 8 | 34 |
| EllipticRegulators | 8 | 39 |
| GeneralAlgebraicKTheory | 10 | 42 |
| HabiroNumberFields | 4 | 19 |
| Total | 37 | 167 |

All 223 citation occurrences were read at declaration level with their variable context: 196 distinct declarations in 136 files, all matching their pinned Git blobs. Missing targets and missing parts of partial targets were searched first in the declaration index and then in both Lean source trees. Searches included concept aliases and nearby infrastructure; a name match was not treated as proof. The accepted counts are 101 absent, 57 partial, six Tau Ceti, two both libraries and one Mathlib.

All 66 overlap claims were compared with the full descriptions of their 54 distinct endpoints. Native stage coverage and the reviewed library-coverage projection agree with the audit. Later `KU-*` readiness checkpoints are outside the assigned batch. The GeneralAlgebraicKTheory decomposition remains explicitly partial: its 24 statements and eight gaps supply context, not evidence that Lean contains higher K-theory.

## Findings

### RT-AUDIT-28/1 — high

**Where:** research/blueprint/audit/AUDIT-28.result.json: EllipticKTheory:E.2, targets 3 and 4 (degree splitting and Pic⁰(E)); associated summary and upstream-overlap note.

The two targets are marked tauceti, with more-general/exact evidence, although the cited declarations concern abstract or function-field divisor classes. E.2 needs Picard classes of line bundles on the projective scheme over the base field. The missing comparison is not supplied by either cited theorem, so these are partial inputs to the roadmap targets, not completed targets.

https://github.com/CBirkbeck/tauceti-explorer/blob/36cd27dca40278121c895a72cd0bdc4ad42995b4/content/campaign/EllipticKTheory/README.md#L26-L41 places the Picard statements between the scheme rank–determinant computation and its tensor-product multiplication. The explicit contract in data/atlas.json, stage KTheoryLowDegrees:Z.5, is on line-bundle classes over the base field. At the pinned Tau Ceti commit, https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/WeilDivisor/Degree/Splitting.lean#L227 has codomain picZero w h × ℤ for an OrderSystem and a weight-one point. https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/DivisorClass.lean#L79 has type W.Point ≃+ (Divisor.degreeClass W.isFunctionField).ker, assuming a Dedekind coordinate ring; it does not mention a scheme or LineBundleClass. The relevant scheme comparison https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/LineBundle.lean#L108 is a map from scheme divisor classes to LineBundleClass, proved injective at line 140. Its opening documentation explicitly leaves surjectivity open. https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/TensorProduct.lean#L405-L429 proves addition/tensor compatibility and bundles an additive homomorphism, not an equivalence. The audit itself acknowledges in E.1 that the Weierstrass projective scheme and function-field comparison are missing, and in E.2 target 2 that line-bundle degree is missing. These missing bridges prevent substituting the cited divisor-class equivalences into E.2.

**Fix:** Change both E.2 targets to partial and describe the existing abstract splitting and elliptic function-field dictionary precisely. Retain those declarations as reusable components, with related evidence relative to the full line-bundle targets; add the existing injective divisor-to-line-bundle comparison and tensor compatibility as further partial evidence. Leave the projective scheme/function-field/divisor dictionary, surjectivity onto line-bundle classes, degree compatibility and elliptic specialization explicitly outstanding. Reuse the existing ModularCurves/JacobianChallenge direction for the general bridges and E.2 for its specialization; do not rebuild the proved function-field result. Recompute the E.2 layer verdict under the audit convention (its two fully built targets have become partial), and qualify the summary and upstream EllipticCurves Layer 0 overlap note. Keep the already-correct absent K₀ conclusions unchanged.

### RT-AUDIT-28/2 — medium

**Where:** research/blueprint/audit/AUDIT-28.result.json: HabiroNumberFields:HB.1, target 2, note on continuous Galois cohomology and its long exact sequence.

The note presents the long exact sequence as built on Mathlib’s canonical ContinuousCohomology. The pinned sequence is instead in TauCeti.ContCohomology’s explicit discrete-coefficient model in degrees zero through two. The canonical comparison is proved only in degree zero; the cited all-degree restriction map does not supply this comparison or an all-degree exact sequence.

https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean#L195 defines kummerShortExact as a DiscreteShortExact in the explicit coefficient framework. https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LongExact.lean#L13-L31 displays 0 → H⁰(A) → H⁰(B) → H⁰(C) → H¹(A) → H¹(B) → H¹(C) → H²(A) → H²(B); its final theorem explicitLongExact_H2B at line 546 is an equality of range and kernel for explicitCoeff2. https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/ContinuousCohomologyIso.lean#L141 constructs explicitH0IsoContinuousCohomology only, into continuousCohomology 0 (ofDiscreteModule ℤ G M). Lines 55–68 explain the missing positive-degree passage between iterated continuous-map cochains and functions on powers of G. The audit’s other citation, https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Functoriality.lean#L127, is res for canonical cohomology, not an exactness theorem. Whole-index and whole-source searches found only the degree-zero canonical bridge. GroupCohomologyIso.lean does prove H¹/H² comparisons, but to abstract groupCohomology under a discrete-group hypothesis, not the canonical continuous carrier for general profinite G.

**Fix:** Keep target 2 partial. Replace the note with separate statements: canonical continuous cohomology and restriction exist; the explicit discrete-module H⁰/H¹/H² model has the displayed low-degree exact sequence and the Kummer short exact sequence; the canonical comparison is currently degree zero only. Cite LongExact.lean and explicitH0IsoContinuousCohomology for those limits. Record higher-degree exactness and the positive-degree canonical comparison as remaining work when the consumer requires them, using the existing ProfiniteCohomology owner. Preserve the already-built explicit Kummer map/injectivity in HB.2; do not replan it.

### RT-AUDIT-28/3 — medium

**Where:** research/blueprint/audit/AUDIT-28.result.json: GeneralAlgebraicKTheory:K.2 and GeneralAlgebraicKTheory:K.2:low-degree-comparisons, duplicate entries pointing to K3BlochGroups:V.4.

Both overlap notes identify Suslin’s V.4 exact sequence with the explicit K₃ comparison requested for rings. V.4 treats the indecomposable quotient for infinite fields. The actual general-ring comparison K₃(A) ≅ H₃(St(A),ℤ) is owned by V.1, which is missing from these duplicate lists. Thus following the audit sends the general target to the wrong supplier.

https://github.com/CBirkbeck/tauceti-explorer/blob/36cd27dca40278121c895a72cd0bdc4ad42995b4/content/campaign/GeneralAlgebraicKTheory/README.md, K.2 and K.2:low-degree-comparisons, requests the explicit K₁, K₂ and K₃ comparisons and separately identifies Matsumoto as field-specific. In the same snapshot, data/atlas.json stage K3BlochGroups:V.1 (source content/campaign/K3BlochGroups/README.md lines 16–25) explicitly constructs K₃(A) ≅ H₃(St(A),ℤ), bar cycles and naturality for ring maps. V.4 (lines 49–61) instead has 0 → enhanced Tor(μ(F),μ(F)) → K₃^ind(F) → B_Sus(F) → 0 for infinite fields, with a comparison back to V.1. This is a quotient comparison, not a presentation of full K₃ for general rings. Weibel, K-book IV §1 after Corollary 1.7.1 and Exercise 1.9, https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf#page=6 and #page=15, supplies the general-ring homological comparison. The integrated GeneralAlgebraicKTheory decomposition also leaves the explicit low-degree comparisons as an import gap; it does not turn V.4 into the generic supplier.

**Fix:** Replace the V.4 duplicate entry in both stages with K3BlochGroups:V.1 and describe its homological K₃ comparison. V.4 may remain a separately qualified downstream reference for the infinite-field indecomposable quotient, but not as the supplier of the generic target. Correct the inherited atlas prerequisite V.4 → K.2:low-degree-comparisons to V.1 for that generic comparison through the maintainer/integration route. Retain the absent library statuses and the existing K₁/K₂ suppliers; no new K₃ roadmap or duplicate construction is needed.

## Checks without additional findings

The result’s `checked` entries record the five roadmap investigations. In particular, the accepted review correctly preserves existing exact structures and categorical K₀, finite-projective complements, projective-resolution K₀, function-field isogenies and principal torsion divisors, unit regulators, cyclotomic characters, S-unit/Selmer bookkeeping and topological power-series evaluation. These do not supply the absent higher K-theory, regulator, scheme-Picard or Habiro assemblies.

Several plausible search hits have different meanings: Quillen model structures; the presheaf plus construction; Coxeter Matsumoto; quaternion Steinberg bases; numerical Picard groups; function-field norm-residue evaluation; and abstract group-cohomology comparisons for discrete groups. The report does not mistake these for the requested objects. The broad motivic-tower/coniveau supplier was not made a finding without a sufficiently precise contradictory interface; the scheme coniveau owner S.4 is already recorded.

This audit attack does not certify every primary proof of the five roadmaps. It verifies the accepted library classifications and overlap assertions to the scope above. No Lean build was available at the pins, and no compilation or new formalization is claimed.

## Validation

**PASS:** red-team checker; scope and reviewed-coverage consistency; exact two-file intake with zero problems. All 21 captured input blobs and both absent-output guards matched fresh main `1ba3304ed9e2a49a934653dad040f92e92dd2b4a`. The full issue and bot-confirmed claim (comment 5807598432, confirmation 5807600687) were unchanged before publication. No Lean compilation was run.
