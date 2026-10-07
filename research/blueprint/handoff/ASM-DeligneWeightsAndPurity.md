# ASM-DeligneWeightsAndPurity — completed assembly

Issue: [#223](https://github.com/CBirkbeck/tauceti-explorer/issues/223). Agent: Codex, session `codex-wy45z2`.

This submission completes the assembly job. It adds the [full reader](../readmes/DeligneWeightsAndPurity.md) and [combined suggested Lean file](../suggested/DeligneWeightsAndPurity.lean), and refines cross-part references in [DWP.7's packet](../packets/DeligneWeightsAndPurity--DWP.7.json). DWP.0's packet is unchanged. No reviewed mathematical statement, hypothesis, API, test, proof step, source record or review object changes. All declarations remain unchecked; this is a plan, not formalization.

The full reader follows the corrected packets rather than perpetuating the superseded statements in the original part readers. Its purpose, scope, ownership boundaries, conventions, eight source versions and eleven-layer overview precede the 135 declaration sections. It includes all 177 API entries, 94 tests, proof steps, direct prerequisites, acceptance cases and 41 landmarks. Notation reconciles geometric Frobenius, Tate and half twists, fixed-ι versus all-conjugates weights, multiplicity, cohomological shifts, normality and arithmetic-model witnesses. The original part readers and suggested files are outside this job's edit paths and remain unchanged.

The combined Lean file has one standard note, one deduplicated block of 33 individual Mathlib imports, both original signature bodies and both coverage ledgers. Missing scheme, sheaf, cohomology and analytic carriers remain named omissions. Documentary statements in those ledgers are not typed signatures; no arbitrary proposition substitutes for a missing object.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/DeligneWeightsAndPurity--DWP.0.json`: 0 errors, 0 warnings; 83 nodes, 81 API entries, 44 tests, 27 landmarks, 28 requests and 2 gaps.
- `python3 scripts/check_blueprint.py research/blueprint/packets/DeligneWeightsAndPurity--DWP.7.json`: 0 errors, 0 warnings; 52 nodes, 96 API entries, 50 tests, 14 landmarks and 17 requests.
- `lean-check research/blueprint/suggested/DeligneWeightsAndPurity.lean`: elaborates successfully at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with 122 warnings, all exactly “declaration uses `sorry`”; no errors or other warnings. Memory was above the worker threshold. The assembled file imports only Mathlib; its Tau Ceti baseline input is recorded as a proof supplier, not claimed as an imported implementation.
- Structural checks: every packet statement, API/test name and mathematical assertion appears in the reader; all 135 node anchors are unique and all local links resolve; all internal prerequisites name existing nodes; the combined node graph is acyclic. The suggested file retains every API/test label from both parts. Changes are confined to this job's four deliverables, and `git diff --check` passes.
- The reviewed library coverage for all DWP layers and the statements of all 41 distinct cited declarations were inspected at the exact Mathlib/Tau Ceti pins. Tau Ceti source inspection uses `f790474821cf4256814db967cb154e7af3d0c369`. The supplied reviews remain the independent full source audits. For the refined interfaces, the public Weil II scan (matching the packet's SHA-256) was checked at printed pp. 175–178, 204–206 and 210: local monodromy/boundary weights, sharp curve purity, the relative-curve dévissage and specialization-to-semisimplicity.

## Review state and where to resume

Review objects are unchanged. DWP.0 remains `needs_changes`; DWP.7 remains `accepted`. This assembly neither accepts the former nor performs a new independent review. The DWP.0 report requires its original part reader to agree with the corrected packet, especially the half-unit induction, the norm exponent's negative weight sign, the corrected local/Clifford hypotheses and the additional exterior/determinant nodes. DWP.7's accepted report also asks for its original reader to reflect its corrections. Those part-reader revisions need their own authorized paths and subsequent review/integration; the orchestrator must not treat this assembly as changing either verdict.

The full reader supplies a current coherent document immediately, but promotion still follows those verdicts. To resume the original reader synchronization, start with [REV-DWP.0](../reviews/REV-DeligneWeightsAndPurity--DWP.0.md) and [REV-DWP.7](../reviews/REV-DeligneWeightsAndPurity--DWP.7.md), then their packets. No further assembly work or mathematical re-review is requested for changed statements, because no statement changes here. An independent assembly check can inspect the prerequisite refinements below and packet-to-reader agreement.

## Cross-part prerequisite refinements

Twelve coarse DWP.5/DWP.6 edges in ten consumers are replaced by exact suppliers. The existing exact DWP.10→DWP.7/DWP.8 edges are retained. There is no unresolved same-roadmap stage reference. The two internal requests to DWP.5 and DWP.6 are discharged as planning references by these nodes; their external owner-interface obligations remain in the supplier packet and are not claimed implemented.

| Consumer | Former supplier | Exact supplying nodes |
| --- | --- | --- |
| `DWP.7/weights-mixed-sheaves-definitions` | `DWP.5` | `DWP.5/punctual-purity-and-mixedness`, `DWP.5/weil-sheaf`, `DWP.0/twisting-by-rank-one-characters` |
| `DWP.7/purity-of-the-relative-curve-case` | `DWP.6` | `DWP.6/sharp-curve-purity` |
| `DWP.7/purity-of-the-relative-curve-case` | `DWP.5` | `DWP.5/local-monodromy-purity`, `DWP.5/local-weight-corollaries` |
| `DWP.7/fundamental-direct-image-theorem-3-3-1` | `DWP.5` | `DWP.5/weil-sheaf` |
| `DWP.7/iota-mixed-direct-image-3-3-10` | `DWP.5` | `DWP.5/punctual-purity-and-mixedness`, `DWP.5/local-weight-corollaries` |
| `DWP.7/iota-mixed-direct-image-3-3-10` | `DWP.6` | `DWP.6/sharp-curve-purity` |
| `DWP.7/deligne-integrality-theorem-sga7-xxi` | `DWP.5` | `DWP.5/weil-sheaf` |
| `DWP.8/nearby-cycles-preserve-mixedness-6-1-13` | `DWP.5` | `DWP.5/local-weight-corollaries` |
| `DWP.8/intermediate-direct-image-purity-6-2-5cd` | `DWP.5` | `DWP.5/local-monodromy-purity`, `DWP.5/local-weight-corollaries` |
| `DWP.8/weight-decomposition-modulo-z-3-4-1-i` | `DWP.5` | `DWP.5/local-weight-corollaries` |
| `DWP.8/punctual-weight-filtration-3-4-1-ii` | `DWP.5` | `DWP.5/local-weight-corollaries` |
| `DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12` | `DWP.5` | `DWP.5/specialization-of-monodromy` |

## Remaining gaps and refinements

### DWP.0: Prescribed-base compatibility of the complex isomorphism

The pinned equivOfTranscendenceBasis returns a ring equivalence, without a theorem that it extends a prescribed σ:k→ℂ. Its polynomial/base-algebra-compatible construction must be traced through the algebraic-closure equivalence, or supplied as an explicit AlgEquiv extension theorem. The cardinal classification alone is insufficient. The target is stated fully and this proof obligation remains visible.

Consumers: `DeligneWeightsAndPurity:DWP.0/embeddings-into-the-complex-numbers`.

### DWP.0: Unavailable geometric and analytic interfaces in suggested signatures

The pinned libraries lack the actual constructible ℓ-adic/Weil coefficient categories, closed-stalk descent, compact-support cohomology, vanishing-cycle objects and algebraic-by-discrete Weil-monodromy realization interfaces used by the geometric and representation-Euler-family statements. Their precise theorem/API/test specifications are in the corrected packet; the review requests synchronization of the reader; suggested-file entries that require these carriers are explicitly omitted with names and supplier blockers, as PROTOCOL §13 requires. They are not replaced by opaque proposition parameters or fabricated cohomology fields. The file elaborates numerical definitions and genuine subgroup, stalk-family and valuation cores; instantiation as schemes/sheaves or the compact Weil representation category is an owner-interface obligation. Standalone positivity, multiset and error-removal lemmas elaborate without those interfaces.

Consumers: `DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves`, `DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense`, `DeligneWeightsAndPurity:DWP.2/symplectic-coinvariants-of-even-tensor-powers`, `DeligneWeightsAndPurity:DWP.2/compact-cohomology-of-even-tensor-powers`, `DeligneWeightsAndPurity:DWP.2/positivity-of-even-tensor-power-traces`, `DeligneWeightsAndPurity:DWP.2/positive-local-factors`, `DeligneWeightsAndPurity:DWP.2/radius-of-convergence-of-positive-products`, `DeligneWeightsAndPurity:DWP.2/poles-of-positive-products`, `DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2`, `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-compact-cohomology`, `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-cohomology-of-the-projective-line`, `DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field`, `DeligneWeightsAndPurity:DWP.1/rosati-of-the-frobenius-endomorphism`, `DeligneWeightsAndPurity:DWP.1/absolute-values-from-the-rosati-involution`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`, `DeligneWeightsAndPurity:DWP.1/compatibility-with-the-hasse-bound`, `DeligneWeightsAndPurity:DWP.1/the-frobenius-and-points-over-extensions`, `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`, `DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves`, `DeligneWeightsAndPurity:DWP.3/zeta-of-the-fibres-and-the-pencil-factorization`, `DeligneWeightsAndPurity:DWP.3/powers-of-a-family-determine-the-family`, `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group`, `DeligneWeightsAndPurity:DWP.3/haar-null-exceptional-eigenvalue-locus`, `DeligneWeightsAndPurity:DWP.3/exceptional-frobenius-set-has-density-zero`, `DeligneWeightsAndPurity:DWP.3/denominators-away-from-the-exceptional-set`, `DeligneWeightsAndPurity:DWP.3/divisibility-criterion`, `DeligneWeightsAndPurity:DWP.3/rationality-of-pencil-local-factors`, `DeligneWeightsAndPurity:DWP.3/coarse-bound-for-the-pencil`, `DeligneWeightsAndPurity:DWP.4/middle-cohomology-half-unit-bound`, `DeligneWeightsAndPurity:DWP.4/middle-cohomology-purity`, `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`, `DeligneWeightsAndPurity:DWP.5/weil-group`, `DeligneWeightsAndPurity:DWP.5/weil-sheaf`, `DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness`, `DeligneWeightsAndPurity:DWP.5/real-sheaves`, `DeligneWeightsAndPurity:DWP.5/rank-one-normalization`, `DeligneWeightsAndPurity:DWP.5/determinantal-weights`, `DeligneWeightsAndPurity:DWP.5/geometric-monodromy-and-central-degree`, `DeligneWeightsAndPurity:DWP.5/generalized-majoration`, `DeligneWeightsAndPurity:DWP.5/initial-curve-and-boundary-bounds`, `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`, `DeligneWeightsAndPurity:DWP.5/local-weight-corollaries`, `DeligneWeightsAndPurity:DWP.5/stalk-newton-polygon`, `DeligneWeightsAndPurity:DWP.5/nonarchimedean-boundary-bounds`, `DeligneWeightsAndPurity:DWP.5/specialization-of-monodromy`, `DeligneWeightsAndPurity:DWP.5/hadamard-de-la-vallee-poussin`, `DeligneWeightsAndPurity:DWP.5/compact-weil-form`, `DeligneWeightsAndPurity:DWP.5/strict-initial-h1-bound`, `DeligneWeightsAndPurity:DWP.5/abstract-degree-equidistribution`, `DeligneWeightsAndPurity:DWP.6/coefficient-specific-vanishing-cycles`, `DeligneWeightsAndPurity:DWP.6/real-cohomological-factors`, `DeligneWeightsAndPurity:DWP.6/square-improvement`, `DeligneWeightsAndPurity:DWP.6/sharp-curve-purity`, `DeligneWeightsAndPurity:DWP.6/compact-support-curve-bound`, `DeligneWeightsAndPurity:DWP.10/weight-transport-to-stable-subquotients`, `DeligneWeightsAndPurity:DWP.10/compatible-realization-export`, `DeligneWeightsAndPurity:DWP.10/finite-residue-semistable-curve-weights`, `DeligneWeightsAndPurity:DWP.10/mixed-nearby-and-newton-exports`, `DeligneWeightsAndPurity:DWP.10/frobenius-equidistribution`, `DeligneWeightsAndPurity:DWP.10/finite-field-sato-tate`, `DeligneWeightsAndPurity:DWP.10/weight-acceptance-suite`, `DeligneWeightsAndPurity:DWP.5/determinantal-weight-functoriality`.

- `DeligneWeightsAndPurity:DWP.7`: Refinement: the commutation of j_* and of the local monodromy filtration with base change for a lisse sheaf tamely ramified along a relative divisor is requested from EDC.0; when EDC.0 is planned, cite its node in DWP.7/purity-of-the-relative-curve-case.

- `DeligneWeightsAndPurity:DWP.8`: Refinement: the derived-category steps of Weil II (6.1.8)–(6.1.9) are justified at finite level (ℤ/ℓ^n systems); when EDC.0's adic formalism is planned, cite its node in DWP.8/generic-mixedness-of-direct-images-6-1-3.

- `DeligneWeightsAndPurity:DWP.8`: Refinement: the stacky form of the weight spectral sequence rests on SF.1's étale cohomology of Deligne–Mumford stacks (requested).

- `DeligneWeightsAndPurity:DWP.9`: Refinement: 4.1.3 and the support-bound steps of 6.2.13 are imported from LPV.7:invariant-cycles (requested); when LPV.7 is planned, replace the stage prerequisite by its 6.2.11 and 6.2.12 node ids.

These explicit obligations are carried forward, not replaced by assumptions that the full libraries exist. Integrality is no longer a source-access gap.

## External supplier requests

All 45 remaining request records follow, preserving their contracts and consuming node ids. Repeated supplier ids are intentional: the two parts need different interfaces. They are grouped by input part rather than collapsed into a weaker generic request.

### From DWP.0

**DWP.0/R1 — `EtaleDualityAndPerverseSheaves:EDC.0`**

The coefficient conventions: ℚ_ℓ(1) as the Tate twist on which the geometric Frobenius of 𝔽_q acts by q⁻¹, compared with the inverse arithmetic Galois action on ℓ-power roots of unity, and extension of coefficients from finite extensions of ℚ_ℓ to ℚ̄_ℓ. Include the actual constructible adic/rational coefficient categories obtained from compatible finite lattices, their finite coefficient extension, and Weil descent. The existing coefficient-change node supplies derived scalar change, not by itself those categories.

Needed by: `DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters`, `DeligneWeightsAndPurity:DWP.5/local-weight-corollaries`, `DeligneWeightsAndPurity:DWP.5/weil-sheaf`, `DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness`.

**DWP.0/R2 — `SchemeAndStackFoundations:SF.2`**

The Grothendieck–Lefschetz trace formula for lisse (and constructible) ℚ_ℓ-sheaves on a curve over 𝔽_q in the form of Weil I (1.14.3), Z(U₀, F₀, t) = ∏_i det(1 − F^*t, H^i_c(U, F))^{(−1)^{i+1}}, with finiteness of H^i_c. This is the CohomologicalPointCounting trace formula (TraceFormula Layer 14) that RS-17 names as DWP.2's supplier. The fixed-point formula for a curve and its Jacobian, #Fix(α) = (Γ_α · Δ) = 1 − Tr(α′ | T_ℓJ) + deg α (Milne, Abelian Varieties, III.11.2; RS-17 names it the curve and Jacobian trace comparison of TraceFormula Layer 8). Proper base change for the pencil f : X̃ → D (the stalk of R^i f_*ℚ_ℓ at a geometric point over x is H^i(X_x̄)), and the trace formula (1.5.4) for the fibres. Frobenius-equivariant finite-dimensional ℓ-adic Künneth and Leray with an actual finite filtration of the abutment; finite-extension descent of smooth embeddings, pencils and singular-value/sign data. Finite surjective curve-cover pullback and rational trace splitting for compact-support cohomology, including ramified finite covers; Leray/Künneth and finite-field descent in the surface pencil. Closed geometric stalks, pullback and finite pushforward/descent interfaces in the actual étale coefficient categories, with local conjugacy invariance and finite-model compatibility.

Needed by: `DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves`, `DeligneWeightsAndPurity:DWP.2/compact-cohomology-of-even-tensor-powers`, `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-compact-cohomology`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves`, `DeligneWeightsAndPurity:DWP.3/zeta-of-the-fibres-and-the-pencil-factorization`, `DeligneWeightsAndPurity:DWP.4/middle-cohomology-half-unit-bound`, `DeligneWeightsAndPurity:DWP.4/middle-cohomology-purity`, `DeligneWeightsAndPurity:DWP.5/weil-sheaf`, `DeligneWeightsAndPurity:DWP.5/initial-curve-and-boundary-bounds`, `DeligneWeightsAndPurity:DWP.5/local-weight-corollaries`, `DeligneWeightsAndPurity:DWP.5/specialization-of-monodromy`, `DeligneWeightsAndPurity:DWP.5/strict-initial-h1-bound`, `DeligneWeightsAndPurity:DWP.6/real-cohomological-factors`, `DeligneWeightsAndPurity:DWP.6/square-improvement`, `DeligneWeightsAndPurity:DWP.10/frobenius-equidistribution`.

**DWP.0/R3 — `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra`**

The first fundamental theorem for the complex symplectic group: the Sp(V)-invariant multilinear forms on V^{2k} are spanned by the pair contractions ψ_P (Brauer algebra), with the dimension of the invariants.

Needed by: `DeligneWeightsAndPurity:DWP.2/symplectic-coinvariants-of-even-tensor-powers`.

**DWP.0/R4 — `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`**

Zariski closure of a subgroup of the ℚ_ℓ-points of a linear algebraic group as an algebraic subgroup, and connectedness of Sp_{2g}.

Needed by: `DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense`.

**DWP.0/R5 — `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`**

The Lie algebra of an algebraic subgroup over ℚ_ℓ, and the fact that an algebraic subgroup whose ℚ_ℓ-points contain an ℓ-adically open subgroup of G(ℚ_ℓ) has full dimension. Its ℓ-adic analytic open-subgroup dimension comparison is requested in ReductiveGroups, Part II, together with the actual analytic local charts; the algebraic Lie API alone is not asserted to prove it.

Needed by: `DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense`.

**DWP.0/R6 — `AbelianSchemesAndArithmeticModuli:A2`**

A polarization of an abelian variety over 𝔽_q defined over 𝔽_q (A is projective over 𝔽_q), with its dual map π^∨ compatible with the Frobenius.

Needed by: `DeligneWeightsAndPurity:DWP.1/rosati-of-the-frobenius-endomorphism`.

**DWP.0/R7 — `ArithmeticGaloisRepresentations:R01.6`**

The Tate module T_ℓA of an abelian variety over 𝔽_q with its Galois action, the Frobenius endomorphism acting as the arithmetic Frobenius, and H¹(A_{𝔽̄_q}, ℚ_ℓ) ≅ (V_ℓA)^∨. Finite E/ℚ_ℓ model and integral lattice for ℓ-adic representations, compact profinite image and étale descent after scalar normalization, uniformly across finite coefficient extension.

Needed by: `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`, `DeligneWeightsAndPurity:DWP.5/weil-sheaf`, `DeligneWeightsAndPurity:DWP.5/geometric-monodromy-and-central-degree`, `DeligneWeightsAndPurity:DWP.5/specialization-of-monodromy`.

**DWP.0/R8 — `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`**

The pointed Abel–Jacobi map and Albanese universal property from JacobianChallenge Layer F. Beyond the inspected pointed v1 scope, request JacobianChallenge, Part II: base-point-free Pic⁰/Jacobian descent over finite fields, the étale H¹(J)≅H¹(C) comparison, and triviality of translation on H¹, all compatible with Frobenius and finite coefficient/base extension. A geometric base point changes π_J∘f_P=f_P∘π_C by translation; exact equality requires P rational. No rational point on the original curve is assumed.

Needed by: `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`.

**DWP.0/R9 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`**

The trace of Frobenius a = q + 1 − #E(𝔽_q) and the Hasse bound |a| ≤ 2√q, with which the abelian-variety estimate is compared (not reproved).

Needed by: `DeligneWeightsAndPurity:DWP.1/compatibility-with-the-hasse-bound`.

**DWP.0/R10 — `LefschetzPencilsAndVanishingCycles:LPV.3`**

A Lefschetz pencil of hyperplane sections of a smooth projective variety over 𝔽_q defined over 𝔽_q (after a Veronese embedding and a finite extension if necessary), with its axis, parameter line, blow-up f : X̃ → D and singular set S. Weil II §3.1 general-position pencil on a smooth projective surface with a strict normal-crossings boundary: ordinary node, simple boundary tangency, and transverse crossing, one exceptional point per fibre; in arbitrary characteristic as required in (3.2.14). This is an extension of the already planned constant-coefficient pencil theorem, not its re-planning.

Needed by: `DeligneWeightsAndPurity:DWP.6/coefficient-specific-vanishing-cycles`, `DeligneWeightsAndPurity:DWP.6/square-improvement`.

**DWP.0/R11 — `LefschetzPencilsAndVanishingCycles:LPV.4`**

The lisse sheaf R^n f_*ℚ_ℓ on U = D − S, the vanishing part ℰ as a π₁(U₀)-stable subsheaf defined over 𝔽_q, the cup-product pairing into ℚ_ℓ(−n), and geometric constancy of R^i f_*ℚ_ℓ (i ≠ n), R^n/ℰ and ℰ ∩ ℰ^⊥ (Weil I §5).

Needed by: `DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves`, `DeligneWeightsAndPurity:DWP.6/coefficient-specific-vanishing-cycles`.

**DWP.0/R12 — `FunctionFieldArithmetic:FA.5`**

The function-field Chebotarev density theorem for finite Galois covers of a curve over 𝔽_q, with the constant-field degree congruences, and its per-degree form: the Frobenius elements of the degree-n points equidistribute in the fibre over n, with error tending to 0. Connected finite étale double-cover zeta comparison with the simple pole at q⁻¹, used solely to exclude the quadratic exception. Its finite-cover curve estimate uses the initial curve Weil bound, not the general DWP.10 equidistribution theorem; retain this direction to avoid a proof cycle.

Needed by: `DeligneWeightsAndPurity:DWP.3/exceptional-frobenius-set-has-density-zero`, `DeligneWeightsAndPurity:DWP.5/hadamard-de-la-vallee-poussin`.

**DWP.0/R13 — `WeilConjectures:WC.1`**

Rationality over ℚ of the zeta function Z(V, t) of a variety over a finite field, from the integral point-count series (Weil I §1, the Hankel-determinant and Fatou argument).

Needed by: `DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves`, `DeligneWeightsAndPurity:DWP.3/zeta-of-the-fibres-and-the-pencil-factorization`, `DeligneWeightsAndPurity:DWP.10/weight-acceptance-suite`.

**DWP.0/R14 — `EtaleDualityAndPerverseSheaves:EDC.4`**

Weak Lefschetz and its Gysin transpose; blowup pullback injectivity and codimension-two blowup decomposition, all Frobenius-equivariant without hard Lefschetz.

Needed by: `DeligneWeightsAndPurity:DWP.4/middle-cohomology-half-unit-bound`, `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`, `DeligneWeightsAndPurity:DWP.6/coefficient-specific-vanishing-cycles`, `DeligneWeightsAndPurity:DWP.6/square-improvement`.

**DWP.0/R15 — `InverseGaloisAndArithmeticFundamentalGroups:IG.1`**

Arithmetic/geometric exact sequence, geometric Frobenius degree convention, tame specialization of curve fundamental groups, and connected finite étale cover classification. For dominant morphisms of normal connected finite-type schemes, provide finite-index image of π₁ and invariance of the connected geometric monodromy group, with component and constant-field degree comparisons; used in Weil II (1.3.13)(i).

Needed by: `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`, `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group`, `DeligneWeightsAndPurity:DWP.5/weil-group`, `DeligneWeightsAndPurity:DWP.5/rank-one-normalization`, `DeligneWeightsAndPurity:DWP.5/specialization-of-monodromy`, `DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves`, `DeligneWeightsAndPurity:DWP.5/determinantal-weight-functoriality`.

**DWP.0/R16 — `FunctionFieldArithmetic:FA.4`**

Finite-field curve geometric abelianized Weil group as finite prime-to-p by pro-p, from idèle class theory, local units and finite Picard group; no number-field replacement.

Needed by: `DeligneWeightsAndPurity:DWP.5/rank-one-normalization`.

**DWP.0/R17 — `LefschetzPencilsAndVanishingCycles:LPV.1`**

Quasi-unipotent inertia, N:V→V(−1), centered monodromy filtration, primitive/SL₂ string description, Clebsch–Gordan tensor compatibility, duality and uniqueness/existence criteria for relative monodromy filtration; preserve geometric-Frobenius signs.

Needed by: `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`, `DeligneWeightsAndPurity:DWP.5/local-weight-corollaries`.

**DWP.0/R18 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`**

Only the finite 3,4,1 trigonometric nonnegative coefficient combination and the exact-abscissa positivity input needed in Weil II §2; the generalized character/pole-order argument is owned here.

Needed by: `DeligneWeightsAndPurity:DWP.5/hadamard-de-la-vallee-poussin`.

**DWP.0/R19 — `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`**

Uniform density of representative matrix coefficients and the square-character approximation used in the abstract positive pole-order argument.

Needed by: `DeligneWeightsAndPurity:DWP.5/hadamard-de-la-vallee-poussin`.

**DWP.0/R20 — `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`**

Normalized Haar probability, character orthogonality and density among continuous class functions; conjugacy separation, and the SU(2) engine with chamber density (2/π)sin²θ. Haar disintegration over a compact quotient and continuity of conditional fibre mass for clopen finite-quotient sets; Dini’s theorem gives uniform decay from pointwise null fibres. Proper algebraic subsets of fixed ℓ-adic analytic symplectic cosets are null; if absent, extend CompactGroups, Part II for this analytic-measure input.

Needed by: `DeligneWeightsAndPurity:DWP.5/hadamard-de-la-vallee-poussin`, `DeligneWeightsAndPurity:DWP.5/compact-weil-form`, `DeligneWeightsAndPurity:DWP.5/abstract-degree-equidistribution`, `DeligneWeightsAndPurity:DWP.10/finite-field-sato-tate`, `DeligneWeightsAndPurity:DWP.3/exceptional-frobenius-set-has-density-zero`.

**DWP.0/R21 — `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`**

Semisimple complex groups: maximal compact subgroup and complexification, finite outer automorphism and compact-normalizer/central-degree criteria of Weil II (1.3.10)–(1.3.15), beyond any currently stated compact-group supplier theorem.

Needed by: `DeligneWeightsAndPurity:DWP.5/geometric-monodromy-and-central-degree`, `DeligneWeightsAndPurity:DWP.5/compact-weil-form`.

**DWP.0/R22 — `LefschetzPencilsAndVanishingCycles:LPV.2`**

The actual vanishing-cycle triangle, five-term specialization sequence, normalization resolution and nodal branch sign line; coefficient-specific weight computations remain in DWP.6.

Needed by: `DeligneWeightsAndPurity:DWP.6/coefficient-specific-vanishing-cycles`.

**DWP.0/R23 — `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`**

Weil II (3.5.5) full SL₂ geometric monodromy for a smooth elliptic family with nonconstant j: prime-to-p level n≥3, finite-index image into the universal level curve, and finite-index ℓ-adic SL₂ image. If the roadmap does not supply the exact universal family theorem, add ModularCurves, Part II; no new pencil open-image proof substitutes for it.

Needed by: `DeligneWeightsAndPurity:DWP.10/finite-field-sato-tate`.

**DWP.0/R24 — `EtaleDualityAndPerverseSheaves:EDC.3`**

Frobenius-equivariant projective-space and multiplicative-group cohomology with compact support and duality, agreeing with the WC.7 examples.

Needed by: `DeligneWeightsAndPurity:DWP.10/weight-acceptance-suite`.

**DWP.0/R25 — `WeilConjectures:WC.7`**

Only the explicit ℙᴺ and 𝔾_m cohomology examples and their factor conventions used as weight acceptance checks; no independent zeta/point-count proof here.

Needed by: `DeligneWeightsAndPurity:DWP.10/weight-acceptance-suite`.

**DWP.0/R26 — `LefschetzPencilsAndVanishingCycles:LPV.0`**

The local trait, Weil representation, tame character and branch sign-line conventions used by Weil II §1.8; no second local monodromy definition here.

Needed by: `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`.

**DWP.0/R27 — `SchemeAndStackFoundations:SF.0`**

Absolute p-Frobenius of characteristic-p schemes, its q=p^a iterate as an 𝔽_q-morphism, base change and naturality; the DWP.1 adapter identifies its geometric-point action and induced abelian-variety endomorphism. Include compatibility with products and the finite locally free degree q^g theorem for q-Frobenius on smooth pure g-dimensional schemes over 𝔽_q, via étale local coordinates, independent of point counts or weights.

Needed by: `DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field`.

**DWP.0/R28 — `LefschetzPencilsAndVanishingCycles:LPV.5`**

LPV, Part II: the existing projective-pencil incidence-complement Bertini theorem is insufficient here. For a normal geometrically connected finite-type X over a finite field and a fixed finite ℓ-adic model/lattice, choose a dense smooth quasiprojective open and a relative smooth curve whose geometric generic restriction has the same monodromy image (or surjective geometric π₁); spread and specialize with uniform lattice monodromy. Include reduction of the rank-one abelian quotient to curves. This is the general normal-scheme curve-reduction contract of Weil II (1.3.1), (1.3.4) and (1.11.4), pp. 156–158, 185–186, independent of purity.

Needed by: `DeligneWeightsAndPurity:DWP.5/rank-one-normalization`, `DeligneWeightsAndPurity:DWP.5/generalized-majoration`.

### From DWP.7

**DWP.7/R1 — `EtaleDualityAndPerverseSheaves:EDC.0`**

The bounded derived category D^b_c(X, ℚ̄_ℓ) of constructible ℚ̄_ℓ-sheaves (and of ℚ̄_ℓ-Weil sheaves over 𝔽_q), on schemes of finite type over 𝔽_q and over ℤ[1/ℓ], with cohomology sheaves ℋ^i; Rf_* and Rf_! for separated finite-type f (through a compactification), f*, ⊗ and RHom, with their long exact sequences, the Leray spectral sequences R^pg_!R^qh_! ⇒ R^{p+q}(gh)_! and R^pf_!ℋ^qK ⇒ ℋ^{p+q}Rf_!K, and stalkwise Künneth with field coefficients; ordinary lisse sheaves on a normal connected scheme as continuous representations of π₁ with a stable lattice over the integers of a finite extension of ℚ_ℓ, and lisse Weil sheaves as Weil-group representations with a stable lattice on the profinite geometric subgroup (not necessarily stable under Frobenius), local ℰxt of lisse sheaves vanishing in positive degree; generic constructibility and generic base change (SGA 4½ [Th. finitude] 1.9, 2.16), and the commutation with base change of j_* (and of the local monodromy filtration) for a lisse sheaf tamely ramified along a divisor finite étale over the base. For SGA 7 XXI 5.2.1–5.2.2: cohomological dimension H^i_c(X,ℱ)=0 for i>2 dim X, finite evaluation detecting H⁰, constructible coefficient descent to a finite ℓ-adic coefficient field, localisation triangles, and Frobenius-equivariant spectral sequences with finite filtrations.

Needed by: `DeligneWeightsAndPurity:DWP.7/weights-mixed-sheaves-definitions`, `DeligneWeightsAndPurity:DWP.7/devissage-in-the-sheaf-and-the-source`, `DeligneWeightsAndPurity:DWP.7/devissage-in-the-target`, `DeligneWeightsAndPurity:DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`, `DeligneWeightsAndPurity:DWP.7/purity-of-the-relative-curve-case`, `DeligneWeightsAndPurity:DWP.7/deligne-integrality-theorem-sga7-xxi`, `DeligneWeightsAndPurity:DWP.8/mixed-complexes`, `DeligneWeightsAndPurity:DWP.8/generic-mixedness-of-direct-images-6-1-3`, `DeligneWeightsAndPurity:DWP.8/direct-image-preserves-mixedness-6-1-2`, `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`, `DeligneWeightsAndPurity:DWP.8/compact-support-direct-image-upper-weights-6-2-3`, `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`, `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity`, `DeligneWeightsAndPurity:DWP.8/ext-one-of-lisse-sheaves-3-4-2`, `DeligneWeightsAndPurity:DWP.8/weight-decomposition-modulo-z-3-4-1-i`, `DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii`, `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`, `DeligneWeightsAndPurity:DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`, `DeligneWeightsAndPurity:DWP.9/lefschetz-operator`, `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`.

**DWP.7/R2 — `EtaleDualityAndPerverseSheaves:EDC.1`**

f^! right adjoint to Rf_! for separated finite-type morphisms of schemes of finite type over 𝔽_q, over an algebraically closed field, and over the regular one-dimensional base ℤ[1/ℓ] (SGA 4½ [Th. finitude] 4.3 for biduality there); K_X = Ra^!ℚ̄_ℓ and D = RHom(−, K_X) with biduality D² ≅ id on D^b_c, the exchange isomorphisms D Rf_! ≅ Rf_* D and D f* ≅ Rf^! D, the formula D(K ⊗ L) ≅ RHom(K, DL), and Verdier duality RΓ(X, DK) ≅ RHom(RΓ_c(X, K), ℚ̄_ℓ) with its perfect pairings over an algebraically closed field; and, through the identification of i_*i^! with local cohomology, i^!ℚ_ℓ ≅ ℚ_ℓ(−1)[−2] for a closed point i of Spec ℤ[1/ℓ] (local cohomology of a henselian discrete valuation ring with ℓ invertible, by Kummer theory).

Needed by: `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `DeligneWeightsAndPurity:DWP.8/pure-complexes`, `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`, `DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`, `DeligneWeightsAndPurity:DWP.8/intermediate-direct-image-purity-6-2-5cd`, `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`, `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`, `DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7`, `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`.

**DWP.7/R3 — `EtaleDualityAndPerverseSheaves:EDC.2`**

Poincaré duality on a smooth X of pure dimension N over 𝔽_q or over an algebraically closed field: a^!ℚ_ℓ ≅ ℚ_ℓ(N)[2N] and the Frobenius-equivariant perfect pairing H^i(X, ℱ) × H^{2N−i}_c(X, ℱ^∨(N)) → ℚ̄_ℓ for lisse ℱ; the relative trace R^{2N}f_!ℚ_ℓ(N) → ℚ_ℓ for smooth f of relative dimension N, compatible with base change, giving for smooth proper f the fibrewise cup-product pairings R^jf_*ℚ_ℓ ⊗ R^{2N−j}f_*ℚ_ℓ → ℚ_ℓ(−N) as morphisms of lisse sheaves. Smooth relative purity for any smooth morphism f of relative dimension e over the stated bases: Rf^!L ≅ f*L(e)[2e] for constructible complexes L, including when the target is singular. Together with directional lower bounds and twist/shift cancellation this shows smooth incidence pullback preserves purity.

Needed by: `DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6`, `DeligneWeightsAndPurity:DWP.7/valuation-triangles-3-3-8`, `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `DeligneWeightsAndPurity:DWP.8/pure-complexes`, `DeligneWeightsAndPurity:DWP.8/generic-mixedness-of-direct-images-6-1-3`, `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`, `DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`, `DeligneWeightsAndPurity:DWP.8/intermediate-direct-image-purity-6-2-5cd`, `DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7`, `DeligneWeightsAndPurity:DWP.9/lefschetz-operator`, `DeligneWeightsAndPurity:DWP.9/hyperplane-factorisation-4-1-2`, `DeligneWeightsAndPurity:DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`, `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1`, `DeligneWeightsAndPurity:DWP.9/primitive-decomposition-and-lefschetz-pairings`, `DeligneWeightsAndPurity:DWP.9/odd-betti-numbers-are-even-4-1-5`, `DeligneWeightsAndPurity:DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9`, `DeligneWeightsAndPurity:DWP.7/deligne-integrality-theorem-sga7-xxi`, `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`.

**DWP.7/R4 — `EtaleDualityAndPerverseSheaves:EDC.3`**

The first Chern class c₁ : Pic(X) → H²(X, ℚ_ℓ(1)), additive, compatible with pullback and with base change in smooth projective families; the cycle class cl(Y) = c₁(𝒪(Y)) of a smooth divisor; the Gysin map i_* of a smooth hyperplane section i : Y → X with the projection formula i_*(i*x) = cl(Y) ∪ x and Tr_X(i_*y ∪ x) = Tr_Y(y ∪ i*x); and Tr_X(c₁(L)^n) = deg_L(X).

Needed by: `DeligneWeightsAndPurity:DWP.9/lefschetz-operator`, `DeligneWeightsAndPurity:DWP.9/hyperplane-factorisation-4-1-2`, `DeligneWeightsAndPurity:DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`.

**DWP.7/R5 — `EtaleDualityAndPerverseSheaves:EDC.4`**

Weak Lefschetz for a smooth hyperplane section Y of a smooth projective X of pure dimension n over an algebraically closed field with ℓ invertible: i* : H^j(X, ℚ_ℓ) → H^j(Y, ℚ_ℓ) is an isomorphism for j < n − 1 and injective for j = n − 1, and the dual statement for the Gysin map.

Needed by: `DeligneWeightsAndPurity:DWP.9/hyperplane-factorisation-4-1-2`, `DeligneWeightsAndPurity:DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3`.

**DWP.7/R6 — `SchemeAndStackFoundations:SF.2`**

Proper base change for Rf_!; smooth and proper base change (R^jf_*ℚ_ℓ lisse with formation commuting with base change, for f proper smooth); topological invariance of the étale site under universal homeomorphisms; the excision sequence 0 → j_!j* → id → i_*i* → 0; the Grothendieck–Lefschetz trace formula Z(X₀, t) = ∏ det(1 − Ft, H^i_c)^{(−1)^{i+1}} with Z independent of ℓ. For the integrality proof, the Euler product and Grothendieck–Lefschetz trace formula with arbitrary constructible coefficient sheaf ℱ, not only constant coefficients, and the dense-open fibration of a positive-dimensional affine variety over a curve with fibres of dimension ≤ dim X−1.

Needed by: `DeligneWeightsAndPurity:DWP.7/devissage-in-the-sheaf-and-the-source`, `DeligneWeightsAndPurity:DWP.7/devissage-in-the-target`, `DeligneWeightsAndPurity:DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`, `DeligneWeightsAndPurity:DWP.7/spreading-out-to-a-tame-relative-curve`, `DeligneWeightsAndPurity:DWP.7/purity-of-the-relative-curve-case`, `DeligneWeightsAndPurity:DWP.7/deligne-integrality-theorem-sga7-xxi`, `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `DeligneWeightsAndPurity:DWP.8/generic-mixedness-of-direct-images-6-1-3`, `DeligneWeightsAndPurity:DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11`, `DeligneWeightsAndPurity:DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13`, `DeligneWeightsAndPurity:DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`, `DeligneWeightsAndPurity:DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`.

**DWP.7/R7 — `AdicCoefficientsAndComparisons:L2`**

Noetherian approximation: descent of schemes of finite type, closed embeddings into ℙ^N, morphisms, smoothness, properness, flatness, pure relative dimension, normality of fibres, finite-presentation and finite-coefficient data from an algebraically closed field (or a function field) to a finitely generated ℤ[1/ℓ]-algebra; refinement of an already supplied arithmetic ℓ-adic sheaf/complex model (no assertion that every constructible ℓ-adic sheaf has such a model), after shrinking; dense regular locus of an integral scheme of finite type over ℤ[1/ℓ].

Needed by: `DeligneWeightsAndPurity:DWP.7/spreading-out-to-a-tame-relative-curve`, `DeligneWeightsAndPurity:DWP.8/potentially-property-p-3-4-10`, `DeligneWeightsAndPurity:DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11`, `DeligneWeightsAndPurity:DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12`, `DeligneWeightsAndPurity:DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`.

**DWP.7/R8 — `ArithmeticGaloisDuality:R02.2`**

The continuous ℓ-adic Hochschild–Serre sequence for a closed normal subgroup with quotient ℤ̂, and its Weil-group variant with discrete quotient ℤ, for finite-dimensional continuous ℚ̄_ℓ-representations, with H¹(ℤ, N) = N_F, H²(ℤ, N) = 0; the five-term exact sequence 0 → H¹(ℤ, M^{π₁(X)}) → H¹(W, M) → H¹(π₁(X), M)^F.

Needed by: `DeligneWeightsAndPurity:DWP.8/ext-one-of-lisse-sheaves-3-4-2`.

**DWP.7/R9 — `WeilConjectures:WC.3`**

The algebraic factor lemma of Weil I (proof of (1.7) ⇒ (1.6)) for an arbitrary degreewise pure realisation: if Z(X₀, t) ∈ ℚ(t) has integral power-series expansion and equals ∏_i det(1 − Ft, H^i)^{(−1)^{i+1}} with H^i pure of weight i, then each det(1 − Ft, H^i) has integer coefficients determined by Z(X₀, t), hence independent of ℓ; stated for smooth proper (not only projective) X₀ over 𝔽_q.

Needed by: `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`.

**DWP.7/R10 — `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`**

Weil II 6.2.8–6.2.12 over any algebraically closed field k with ℓ invertible, for potentially pure complexes with an explicit arithmetic model (DWP.8/potentially-property-p-3-4-10): the local invariant cycle theorem 6.2.9; the support-bound weak Lefschetz theorem 6.2.11 (i) for K and for DK; for a general hyperplane section Y, D(K|Y) = (DK)|Y(−1)[−2] and K|Y satisfies the support hypothesis with n − 1; 6.2.11 (ii); and the global invariant cycle theorem 6.2.12, including its constant-coefficient case K = ℚ̄_ℓ on a smooth projective X (Weil II 4.1.3). The direct proof of 4.1.3 in Weil II §4.3 ((4.3.2)–(4.3.8), relative cohomology and the injectivity (4.3.6)) is the argument 6.2.11 (ii) refers to and belongs with it. The direct constant-coefficient fixed-part theorem (4.3.2)–(4.3.8) is required for every Lefschetz pencil satisfying 4.3.1, not just a sufficiently general line in the dual projective space.

Needed by: `DeligneWeightsAndPurity:DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3`, `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`, `DeligneWeightsAndPurity:DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9`.

**DWP.7/R11 — `LefschetzPencilsAndVanishingCycles:LPV.1`**

Quasi-unipotence of the inertia action on nearby cycles and on ℓ-adic sheaves over a henselian trait (SGA 7 I), the tame character, the nilpotent logarithm N and the monodromy filtration constructions of Weil II (1.6.1), (1.6.14). Also the tame/wild inertia construction for boundary henselian traits of curves over any field with ℓ invertible: wild inertia is pro-p in residue characteristic p > 0 and trivial in characteristic zero; a continuous homomorphism from a pro-p group to a pro-ℓ group is trivial for p ≠ ℓ. This geometric-trait scope is required here; the finite-residue-field scope of tauceti LocalFieldsRamification alone does not supply it. Quasi-unipotence here is in the geometric/arithmetic setting of SGA 7 and Weil II 6.1.12, at closed points of smooth curves over finite fields or spread models in 6.1.1 b); it is not an assertion for arbitrary representations of an arbitrary inertia group.

Needed by: `DeligneWeightsAndPurity:DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre`, `DeligneWeightsAndPurity:DWP.8/nearby-cycles-preserve-mixedness-6-1-13`, `DeligneWeightsAndPurity:DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`.

**DWP.7/R12 — `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`**

Spreading out of a polarised projective relative curve over a finitely presented base, together with sections, divisors and finite étale covers, as finite-presentation models over a dense open of the base.

Needed by: `DeligneWeightsAndPurity:DWP.7/spreading-out-to-a-tame-relative-curve`.

**DWP.7/R13 — `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`**

The smooth projective model of a smooth curve over a perfect field (its normal compactification), with the finite reduced set of points at infinity, which is étale over the perfect base field.

Needed by: `DeligneWeightsAndPurity:DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`.

**DWP.7/R14 — `InverseGaloisAndArithmeticFundamentalGroups:IG.0`**

For X normal connected and U ⊂ X a dense open, π₁(U, ū) → π₁(X, ū) is surjective (SGA 1 V 8.2); lisse sheaves as continuous representations of π₁.

Needed by: `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity`, `DeligneWeightsAndPurity:DWP.8/ext-one-of-lisse-sheaves-3-4-2`, `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`.

**DWP.7/R15 — `InverseGaloisAndArithmeticFundamentalGroups:IG.1`**

The exact sequence 1 → π₁(X, x̄) → π₁(X₀, x̄) → Gal(𝔽̄_q/𝔽_q) → 1 for X₀ geometrically connected of finite type over 𝔽_q, and the Weil group W(X₀, x̄) as the preimage of F^ℤ.

Needed by: `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity`, `DeligneWeightsAndPurity:DWP.8/ext-one-of-lisse-sheaves-3-4-2`.

**DWP.7/R16 — `SchemeAndStackFoundations:SF.1`**

Étale cohomology of Deligne–Mumford stacks of finite type over 𝔽_q, with the resolution of j_!ℚ_ℓ by normalised strata of a normal crossings divisor, for the stacky weight spectral sequence.

Needed by: `DeligneWeightsAndPurity:DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`.

**DWP.7/R17 — `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`**

For a finite-dimensional faithful representation of an affine algebraic group H over an algebraically closed characteristic-zero field, the module is semisimple iff H has reductive identity component; finite component groups are handled by averaging. Apply to the Zariski closure of the geometric monodromy image. Invariant subspaces for the image and its closure coincide. This is the characteristic-zero linear-reductivity interface of layer 6, not a new algebraic-group theorem here.

Needed by: `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity`.

## Restructuring proposals

All six proposals are collected below without applying them. The atlas, accepted route files, other roadmaps and upstream documents remain with their respective owners.

### DWP.0/S1 — rescope

Roadmaps: `DeligneWeightsAndPurity`, `UniversalHypersurfaceMonodromy`, `PadicDifferentialEquationsAndRigidCohomology`.

Implement the confirmed ownership findings RT-AREA-etale/1 and /9 without editing the atlas, other packets or accepted route files. DWP.10 currently hosts the newly planned equidistribution declarations; DWP.0 supplies only shared numeric predicates.

Proposal: Create DeligneWeightsAndPurity:DWP.8:equidistribution, importing DWP.5, DWP.7 and the necessary DWP.8 geometric semisimplicity; move the DWP.10 Frobenius-equidistribution and finite-field-Sato–Tate nodes there on acceptance. Extend UniversalHypersurfaceMonodromy (LPV, Part II) with Katz–Sarnak 10.1.16/10.2.2 and the Schiffmann density application, retaining the accepted explicit-family route and its characteristic hypotheses. Correct PAPER-SCHIFFMANN-16/36’s analytic supplier to DWP.8:equidistribution; the full density theorem stays with the accepted LPV Part II owner. Add the stage edge DeligneWeightsAndPurity:DWP.0 → PadicDifferentialEquationsAndRigidCohomology:RD.6, and add RD.6 to the RS-17 DWP.0 owner’s formerly list. RD.6 imports IsWeilNumber and iotaWeight and defines only pointwise F-isocrystal purity/mixedness.

### DWP.0/S2 — split

Roadmaps: `DeligneWeightsAndPurity`.

DWP.5 has separate coefficient definitions, local monodromy estimates and analytic compact-group preparation. Six planets cannot describe every construction.

Proposal: Expose sublayers DWP.5:coefficients (Weil group, Weil sheaf, punctual purity/mixedness and determinantal weights), DWP.5:local (majoration, local monodromy purity and nonarchimedean bounds) and DWP.5:analytic (Hadamard–de la Vallée-Poussin, compact Weil form and abstract degree equidistribution), preserving the internal prerequisite order. Keep this packet on the eight current scope ids until review. The coefficient-definition prefix precedes the DWP.2 curve adapter; DWP.2 feeds only the local/analytic proof suffix. Do not turn these node-level dependencies into a coarse DWP.5→DWP.2→DWP.5 stage cycle.

### DWP.0/S3 — rescope

Roadmaps: `tauceti:TauCetiRoadmap/ReductiveGroups`, `tauceti:TauCetiRoadmap/ModularCurves`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups`, `tauceti:TauCetiRoadmap/JacobianChallenge`.

The inspected upstream layers supply algebraic semisimple groups and fine fixed-pairing level curves, but do not assert the exact maximal-compact comparison or universal-family full-monodromy theorem used in Weil II §2.2 and §3.5.5.

Proposal: Request ReductiveGroups, Part II for complex maximal compact/complexification, compact normalizers and finite outer automorphisms, importing CompactGroups and the existing reductive structure; request ModularCurves, Part II for universal elliptic-family SL₂ monodromy and the nonconstant-j finite-index passage. Do not replan their existing algebraic-group or fine-moduli constructions. Extend CompactGroups, Part II for nullity of proper algebraic zero sets in ℓ-adic analytic cosets and continuous conditional Haar disintegration/Dini uniformity over the degree quotient; this input is not asserted by the inspected complex compact-character layer. Extend JacobianChallenge, Part II for base-point-free finite-field Jacobian descent and the Frobenius-equivariant étale H¹ comparison, importing its pointed Abel–Jacobi construction and the existing étale coefficient/cohomology suppliers. Include the ℓ-adic open-subgroup dimension comparison in the requested ReductiveGroups, Part II.

### DWP.7/S1 — rescope

Roadmaps: `DeligneWeightsAndPurity`, `WeilConjectures`.

Accepted RS-17 gives DWP.7 the integral, ℓ-independent factor statement of Weil II 3.3.9 (importing WC.3's algebraic lemma), and this packet plans it in DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (ii). The accepted node WeilConjectures:WC.6/purity-for-proper-smooth-varieties derives the same integral factors again from DWP.7's purity and WC.3.

Proposal: Narrow WC.6/purity-for-proper-smooth-varieties to an adapter that imports DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (ii) for the integral ℓ-independent factors and keeps only its zeta-facing assembly (degree-zero and empty-scheme conventions, uniqueness of P_i, charpolyRev normalisation).

### DWP.7/S2 — rescope

Roadmaps: `DeligneWeightsAndPurity`, `LefschetzPencilsAndVanishingCycles`.

The extraction of Weil II routes §4.3 ((4.3.2)–(4.3.8), the relative-cohomology proof that Ev(Y)^⊥ is the image of Hⁿ(X), i.e. 4.1.3) to DWP.9. Accepted RS-17 makes LPV.7:invariant-cycles the owner of 6.2.8–6.2.12, and the proof of 6.2.11 (ii) applies exactly (4.3.7)–(4.3.8). Planning §4.3 in DWP.9 would duplicate it.

Proposal: LPV.7:invariant-cycles owns Weil II (4.3.2)–(4.3.8) together with 6.2.11–6.2.12, including the constant-coefficient case 4.1.3; DWP.9 imports 4.1.3 from it (DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3) and keeps the hard-Lefschetz corollaries (4.3.9)–(4.3.10) (DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9).

### DWP.7/S3 — rescope

Roadmaps: `DeligneWeightsAndPurity`.

The integrated decomposition's node DWP.7/weights-mixed-sheaves-definitions is DWP.5 material by accepted RS-17 ('its source scope must survive relocation'), but WeilConjectures:WC.6 cites its id. This packet keeps the id as a comparison node that pins the scope (schemes of finite type over ℤ[1/ℓ]) and imports the definitions from DWP.5.

Proposal: The DWP.5 blueprint (part DWP.0) plans the predicates (1.2.2)–(1.2.7) with the stabilities (1.2.5) on schemes of finite type over ℤ[1/ℓ]; once its nodes exist, DWP.7/weights-mixed-sheaves-definitions cites them, and WC.6 may cite them directly.

DWP.7/S3’s requested internal citation step is now performed: its stable comparison id imports DWP.5’s exact nodes. The comparison remains for existing consumers. DWP.0/S2’s coefficient-prefix/local-suffix dependency order is enforced at node level; merging those nodes into a whole-layer edge would reintroduce the spurious cycle. All other route/stage changes still require the maintainer.

## Source identifiers and upstream observations

The two packets reuse `DeligneWeightsAndPurity/E2`–`E6` for different source issues. This assembly does not rename reviewed records: qualify them by part when citing them. All 13 source issues, exact versions and original review metadata remain in their packets. The full reader uses the corrected conventions and distinguishes unread published versions from inspected preprints. No new erratum or independent erratum confirmation is claimed here.

- DWP.0: `tauceti:TauCetiRoadmap/ModularCurves`: The current 5B explicitly does not assert connectedness of determinant fibres. Weil II §3.5.5 needs the exact full monodromy result, not merely fixed-pairing fine representability. The requested Part II carries this extension; no edits to upstream roadmaps are proposed by this job.

- DWP.0: `tauceti:TauCetiRoadmap/JacobianChallenge`: Layer F supplies a pointed universal property and base change, but does not state the étale H¹ comparison and its translation invariance. DWP.1 requires this exact comparison and base-point-free finite-field descent; the Part II contract records both, without altering or reviewing the upstream roadmap.

No scratch artifact is required by the next worker. The exact remaining contracts, gaps and proposals are in this handoff and the two packets; the assembled files are the reviewable result.
