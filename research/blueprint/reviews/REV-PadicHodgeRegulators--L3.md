# Independent review: p-adic regulators, L3–L4

**Verdict: accepted at target level, with the recorded gaps.** Job `REV-PadicHodgeRegulators--L3`, issue #464; reviewer Codex, session `codex-KKTL98`, 6 October 2026. The input was written by Codex session `codex-whMoP6` for issue #967; this reviewer did none of that planning. The acceptance applies to the packet and suggested file specified by this review issue. It does not certify arithmetic implementations or close either stage.

## Counts and coverage

All 59 nodes were checked: **10 verified, 49 corrected, none added, none unverifiable**. Most corrections concern source anchors and missing test classifications; the substantive construction correction is the de Rham conductor contract. There are 10 definitions, 14 constructions, 9 lemmas, 23 theorems and 3 comparisons; 78 API items; **73 tests** (one added); 12 planets, six per layer; 12 confirmed baseline declarations; 10 gaps and 16 precise supplier requests. Every implementation status remains `unchecked`.

The pass is `complete`; L3 and L4 are `planned`, and neither is `closed`. Their target chains end in baseline declarations, exact supplier nodes, requested stages or named gaps. This is the protocol's target-level completion criterion, not gap-free closure. The internal 59-node dependency graph is acyclic. The reviewed AUDIT-26 entries mark the relevant arithmetic constructions missing; no audited implementation is replanned here. The accepted RS-26 boundaries are respected: PG owns cohomology, Wach and differential-module machinery, PHT owns periods and annuli, PMIA owns bounded measures, and LAD owns analytic distributions. The source-based planets select central constructions and named theorems, rather than every helper lemma.

The upstream ConformalMapping and Multiquadratic documents were read for their definition/API density, along with the regulator roadmap, companion reader, planner handoff, reviewed audit, accepted RS-26 and the confirmed red-team finding named in the issue.

## Source and baseline checks

Fresh public downloads of all seven registered source editions matched the packet's SHA-256 values: the LLZ2011 published paper, LLZ arXiv:1006.5163v2, the LLZ Wach author manuscript, Berger2003, LZ arXiv:1108.5954v3, Rodrigues Jacinto2018 published paper and Rubin's public *Euler Systems* draft. The packet retains their exact URLs and version records. Each node's locators, literal excerpts, hypotheses, formulas and proof dependencies were compared with those passages. The arXiv version record, author publication page and bounded title searches supplied the correction search; the publisher's XHTML index did not render, but its published PDF was acquired. No exhaustive or new-error claim is made.

No baseline citation was removed or replaced. All twelve statements were confirmed at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with their actual hypotheses and conventions:

| Declaration | What was confirmed |
| --- | --- |
| `IsLocalRing.isUnit_one_sub_self_of_mem_nonunits` | A nonunit in a local ring has unit complement; used after maximal-ideal membership. |
| `IsLocalRing.maximalIdeal` | The existing ideal of nonunits; no new local-ring ideal is required. |
| `Module.Basis` | Native coordinates use the basis representation equivalence. |
| `Module.Basis.extend` | A linearly independent subset of a vector space extends to a basis. |
| `Module.Basis.constr_apply_fintype` | Finite coordinate expansion, with the scalar compatibility required by the map. |
| `Lagrange.interpolate` | The finite polynomial interpolation construction. |
| `Lagrange.eval_interpolate_at_node` | Evaluation at a member of the finite set under injectivity on that set. |
| `Matrix.det_mul` | Determinant multiplicativity for finite matrices over a commutative ring. |
| `Matrix.vecMulBilin` | Row-vector bilinear multiplication, with compatible scalars. |
| `TensorProduct.map` | Tensoring the two semilinear maps; pure tensors map to their image tensors. |
| `TensorProduct.rid` | Right unitor sends h tensor r to r times h. |
| `LinearMap.ker` | Submodule kernel is the preimage of the zero submodule. |

The baseline records Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, but no Tau Ceti declaration is among these citations or imported by the suggested file. The shared build's different Tau Ceti checkout is not claimed as pinned Tau Ceti verification.

All six exact external node contracts were read. PG's `psi-one-to-zero` provides the genuine linear boundary subject to psi/phi compatibility, not its arithmetic surjectivity. ColemanPowerSeries' raw map, its negative normalization, principal exact sequence and coefficient-extended finite-flat sequence agree with the Tate comparison; the cokernel uses the first moment rather than mass. PMIA's unit-measure Amice kernel equivalence is integral and bounded, and does not supply analytic Mellin or convolution as ordinary multiplication. ColemanPowerSeries is accepted; the current PMIA packet is `needs_changes`, and PG has no acceptance. These contracts remain plans whose construction obligations are requested, rather than silently treated as baseline implementations. All sixteen requested stage descriptions were also read; the modular geometric comparison is requested from AutomorphicGaloisRepresentations R19.5, not a similarly numbered Neron-model layer.

## Corrections to the reviewed files

1. **Fix the de Rham conductor, not an auxiliary level.** RJ equation (3), Theorem I.15 and Lemma I.17 use a primitive finite character eta of conductor exactly p^m with m above the module threshold. The old statement called m merely “sufficiently large,” and its proof/API asserted invariance under changing that level. The packet and suggested arithmetic contract now keep phi^(-m), the residue modulus p^m and G(eta) at that same conductor. A larger coefficient field embeds the fixed expression; it does not replace m. The gluing proof uses residue representatives and overlapping admitted charts. The new `derham_conductor_level` test distinguishes a primitive sum at 5 from the vanishing imprimitive sum at 25: for the quadratic character eta mod 5, the first is nonzero G(eta), the second is zero. Reduction by the exact cyclotomic polynomials verifies the normalized values 1 and 0. This is a Gauss-sum model regression, not a construction of the arithmetic regulator.
2. **Distinguish sufficient big-exponential hypotheses.** Berger Definition II.12 uses the vanishing top Frobenius eigenspace. Remark II.14 more generally permits no E(h) subrepresentation, after Theorem II.13 identifies the residual lift ambiguity with invariants. The two conditions are now stated separately in the packet and suggested comment. The invariant quotient and obstruction exactness gap remain.
3. **Repair source locators and version attribution.** Coleman coordinates are the displayed construction in Section 3A, Remark 3.1 and Lemma 3.3, not “Definition 3.1.” Logarithmic factors are introduced in Section 1C2, not 1C3. RJ character-domain/convergence references now identify 0E3, IA and IC4–IC5 with I.15/I.17. The integral shear and index references distinguish published Proposition 5.11/basis-change Remark 5.12 from the maximal-ideal choice in preprint Remark 5.12. The Tate comparison points to LZ's literal “6.4.2. Coleman series.”
4. **Make excerpts auditable.** Weak one-symbol, translated or nonliteral excerpts were replaced with literal local anchors. The complete excerpt set was checked against the fresh texts after whitespace normalization. These anchors support locators; mathematical verification used the surrounding statements and proofs rather than only substring matches.
5. **Classify all unit tests.** The inherited 72 tests lacked their required `kind`; each now has an appropriate computation, degenerate, compatibility, characterisation or non-example classification. The additional conductor test is a non-example. All 24 definitions/constructions have at least three discriminating tests. No API item was missing from the 78-item outline, and none was added.
6. **Record independent findings and verdicts.** All five source issues now have reasoned independent-review verdicts. The packet records this review's source, baseline and supplier checks without overwriting the planner's historical provenance.

The following table records each edited node and the changed fields. These field corrections do not represent additional mathematical nodes; the full individual verdict and proof-sensitive reason for every node, including the ten unchanged ones, is in `review.checked`.

| Node (within PadicHodgeRegulators) | Fields corrected |
| --- | --- |
| `L3/quadratic-frobenius-inverse` | tests, sources |
| `L3/quadratic-frobenius-inverse-spec` | sources |
| `L3/quadratic-euler-inverse` | tests, sources |
| `L3/quadratic-euler-inverse-spec` | sources |
| `L3/quadratic-euler-product` | sources |
| `L4/evaluation-constraints` | tests, sources |
| `L4/scalar-multiple-zeros` | sources |
| `L4/single-constraint-basis` | sources |
| `L4/unused-point-invertibility` | sources |
| `L4/transported-specialization` | tests, sources |
| `L4/transport-dimension` | sources |
| `L4/constraint-basis` | tests, sources |
| `L4/constraint-determinant` | sources |
| `L4/projection-generator` | tests, sources |
| `L4/projection-witness` | tests, sources |
| `L4/coordinate-image` | sources |
| `L4/coleman-coordinates` | tests, sources |
| `L4/coleman-reconstruction` | sources |
| `L4/logarithmic-matrix` | tests, sources |
| `L4/matrix-expansion` | sources |
| `L4/regulator-coordinate-decomposition` | sources |
| `L4/constant-basis-covariance` | sources |
| `L4/shear-matrix` | tests, sources |
| `L4/shear-specialization-lines` | sources |
| `L4/integral-shear-choice` | sources |
| `L4/sheared-coordinate-surjectivity` | sources |
| `L3/gamma-leading-factor` | tests |
| `L3/logarithmic-factors` | sources, tests |
| `L3/crystalline-regulator` | tests |
| `L3/big-exponential-obstruction` | tests |
| `L3/big-exponential` | statement, tests |
| `L3/auxiliary-h-comparison` | sources |
| `L3/meromorphic-twist-extension` | tests |
| `L3/naturality-and-lattice` | sources |
| `L3/regulator-determinant` | sources |
| `L3/scalar-projection` | sources, tests |
| `L3/tate-coleman-comparison` | sources |
| `L3/rubin-coleman-map` | sources, tests |
| `L4/noncritical-refinement` | tests |
| `L4/logarithmic-elementary-divisors` | sources |
| `L4/specialization-subspaces` | sources, tests |
| `L4/regulator-elementary-divisors` | sources |
| `L4/integral-image-index` | sources |
| `L4/signed-local-condition` | tests |
| `L4/derham-character-domain` | sources, tests |
| `L4/analytic-differential-powers` | sources, tests |
| `L4/derham-regulator` | statement, hypotheses, proofSteps, acceptance, sources, api, tests |
| `L4/derham-interpolation-growth` | sources |
| `L4/crystalline-derham-comparison` | sources |

## Independent source-issue verdicts

| Finding | Verdict and check |
| --- | --- |
| E301 | Confirmed: published Proposition 5.11's nonzero determinant is insufficient over O_E. At p=5, e1=1,e2=-4 gives determinant 5. Preprint Remark 5.12 already supplies the maximal-ideal repair. |
| E302 | Confirmed misprint: an extra evaluation condition gives S contained in S-prime. The strict example is (X(X-5)) contained in (X). |
| E303 | Confirmed misprint: the ordered pair in Proposition 5.9 requires rho(g,h)=(p-1)g(0)-(2-a_p)h(0), with values in E. At p=5,a_p=0, (1,2) lies on the preceding image line; corrected rho is 0 and printed rho is -6. |
| E304 | Confirmed scalar-carrier misprint: Corollary 4.13's bounded Wach sequence is over Lambda_E, while an H_E sequence must extend both arithmetic modules, as in 2.11 versus 2.12. |
| E305 | Confirmed as a fixed-coordinate correction: L=Col M nu forces W=V M(x_i)^(-1). The Coleman line span(1,2) maps to period line span(-2,5) in the modular example. This does not accuse the source of forgetting an abstract identification. |

The conductor error corrected in this review was in the worker's contract, not in RJ's paper, and is not added as a source issue. No further source error was established.

## Open mathematical obligations and orchestrator questions

The ten precise gaps remain: bounded evaluation/division and image descent; authentic arithmetic carrier signatures; derivative-obstruction exactness; determinant normalization; cyclotomic growth estimate; integral lower inclusion; N_rig/Nakamura exponential comparison; the crystalline/de Rham normalization square and general extension reduction; Rubin's original ordinary/multiplicative construction; and the unrestricted crystalline codomain. In particular, equal H_E determinant ideals do not prove an arbitrary bounded image equality, the Wach author's rational one-coordinate Proposition 4.11 does not by itself establish the broader integral inclusion, and an eigenbasis is stronger than eigenvalues lying in a finite extension. Missing original proofs are still gaps, not assertions that they were independently read.

The orchestrator should resolve three boundaries:

- **Reader synchronization needs an authorized deliverable.** This issue permits the packet, suggested file, report and handoff, but not the reader. The reader's de Rham construction at lines 664–674 retains the incorrect freely enlargeable m/descent wording; replace it with the fixed-conductor statement and add the new Gauss regression when that file is authorized. Its source-correction section also retains the planner's “unreviewed” state and its test count is 72 rather than 73. The corrected packet and suggested file are authoritative for this review. No unauthorized reader edit was made.
- **Resolve the public L3 codomain qualification.** The roadmap's unqualified all-crystalline H_E target contrasts with LZ 4.4's arbitrary-weight fractional construction. The packet records the target, exact gap and scope proposal; the orchestrator must apply a justified weight qualification or obtain cancellation, rather than consider that target proved.
- **Route the confirmed Habiro finding to its owning scope.** RT-AREA-ktheory-2/15 concerns HB.7 and D.1–D.4, outside L3/L4. The reader explicitly defers it to the planner handoff, which correctly preserves D.1 → D.2 and K3BlochGroups:V.4 → D.2 (or proved direct D.1 → HB.7), GSWZ Theorem 9's four-step route, E39's completed-map/p²-integrality input, E38's ord(zeta)[zeta] with zeta=1 excluded, and E56's corrected 5-adic Example 4.3. Those obligations have not been implemented by this review. Do not treat this acceptance as verification of an edited D/Habiro graph.

## Validation

- Official blueprint checker: **0 errors, 0 warnings**, 59 nodes, 78 API items, 73 tests, 12 planets, two planned stages and no closed stages.
- Standalone source-issue validation: an ephemeral `errata-v1` envelope containing the same five issues and seven source versions passes `scripts/check_errata.py`. The blueprint itself remains `blueprint-v1`.
- `lean-check` completed successfully twice at the pinned Mathlib build. The final log contains 100 warnings, all `declaration uses sorry`, and no errors. The file has 65 native definition/lemma/theorem signatures and 46 native example signatures. Unavailable arithmetic carriers and their contracts remain explicit comments, as the public roadmap's suggested-file convention allows; their formulas have not been typechecked as arithmetic Lean declarations.
- **61 exact arithmetic assertions passed**, using rational matrices, polynomial arithmetic and cyclotomic reductions. They cover quadratic inverses/Euler product with guarded denominators, row and basis covariance, specialization transport, integral-unit and interpolation counterexamples, Gamma coefficients, singular Euler relations, split/nonsplit multipliers, strict domain boundary and the new conductor Gauss sums. These finite computations do not certify analytic constructions.
- Every packet declaration, all 78 API names and all 73 test names occur in the suggested file; all definition/construction test minima hold; every node has an individual review verdict; the internal dependency graph is acyclic; every final literal source excerpt matches its recorded edition.

Submission-file validation and whitespace checks also pass. Only the authorized packet, suggested file, review report and this review's handoff are changed. No promotion, manual merge, issue closure or second job is performed by this worker.
