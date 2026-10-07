# ASM-HabiroNahmSeries — completed assembly

Issue: [#6420](https://github.com/CBirkbeck/tauceti-explorer/issues/6420). Worker: **Codex — codex-QHVL6b**. Branch: `codex-QHVL6b-asm-habiro-nahm`. Date: 6 October 2026.

The bot confirmed this session's claim before any work. This run assembles one roadmap and submits one job. This is a completed assembly, not a checkpoint or an implementation. The mathematical stages remain planned with the reviewed obligations below.

## What is delivered

The [definitive reader](../readmes/HabiroNahmSeries.md) opens with purpose, scope, neighboring ownership, conventions, source editions, baseline and a layer overview. It presents HB.3, HB.4, HB.5a, HB.5, HB.8, HB.9 and HB.10 in order: 183 declaration plans, 248 API items and 176 named tests. The six finer parts supply 74 of the declarations. Older assertions are interpreted through the explicit finer contracts rather than quoted as unconditional facts. All mathematical gaps, coefficient-ring restrictions and nonvanishing hypotheses are retained.

The [assembled suggested file](../suggested/HabiroNahmSeries.lean) has one standard note, one import block and scoped sections. It preserves the base namespaces `HabiroNahmSeries.HB34`, `.HB5`, `.HB8`, `.HB910` and the part namespaces `TauCeti.Nahm`, `TauCeti.Nahm.Radial`, `TauCeti.Nahm.HB5`, `HabiroNahmSeries.HB8Refinement`, `TauCeti.HabiroNahmHB9`, `HabiroNahmExamples`. In the refinement, `.Imported` functions now delegate to actual base signatures where those exist, including the constant-one Nahm solution after scalar extension. These are adapters, not duplicate mathematical ownership. Fully qualified API names in the HB.8 packet correspond to the short declarations inside its namespace. Nested `ModularFunction` names are interpreted the same way.

Unavailable Gaussian completions, Bloch/K₃, regulator, indexed-module and cohomology carriers remain named omissions or explicit parametric interfaces. The prototype does not replace missing conditions by arbitrary `Prop` fields. The import block retains the canonical pinned `Mathlib.Basic.Complex.Basic` path; the deprecated compatibility path `Mathlib.Data.Complex.Basic` is not used.

## Cross-part reconciliation

The prerequisites were checked over the union of all seven packets. Every internal node target exists and the graph is acyclic. Stage-only HB.8 prerequisites in the two HB.9 consuming contracts were replaced with exact normalization, shifts, regularity, identification and corrected level-m nodes. The existing consuming gaps continue to state that these imports are conditional.

| Consumer | Controlling supplier nodes and restriction |
| --- | --- |
| HB.4 analytic/Kummer targets | HB.3 positive-coherent-root-lift: preserve the actual rational-power field and its embeddings. |
| HB.5 expansion-at-one | HB.4 radial-analytic-remainder-comparison, specialized at m=1. |
| HB.5 constant-term lift and bounded powers | HB.4 cgz-normalization-and-field-comparison, coefficientwise-kummer-descent-interface, nonzero-unit-series-descent-comparison. Preserve the fixed E, D divisible by 24 and the actual Dedekind multiplier. The HB.4 arithmetic comparison remains open. |
| HB.5 rationalized endpoint | HB.3 regulator-field-and-normalization-comparison, including the exact owner regulators and integral root-field lift. |
| HB.9 regularization and first coefficient | HB.8 refinement-gaussian-normalization; the local correction does not prove the global carrier. |
| HB.9 Frobenius and product gluing | HB.8 refinement-gaussian-shifts, refinement-gaussian-regularity, refinement-gaussian-identification and refinement-corrected-level-admissibility. Preserve G1/G2/G3 and all full coefficient-algebra requirements. |
| HB.10 residues and descendants | HB.8 refinement-gaussian-identification; HB.9 followup-integral-gluing-contract and followup-descendant-pullback-contract. Constant specialization does not give q-dependent transport. |
| HB.10 quartic coefficient line | HB.9 followup-etale-module-contract and HB.3 signed-exterior-boundary-obstruction, with the exact finite étale algebra and specified K₃ lift. |

The link-screen directory was searched for incident Nahm edges and ownership overlaps. Its roadmap occurrences are catalogue-screen entries, not incident accepted links. No new link-map or atlas-data file was changed. The concrete neighboring boundaries come from reviewed node imports and the proposals collected below.

## Review flags and exact changes

No review object, verdict, coverage status or implementation status was changed. Packet mathematical statements and proof outlines were preserved. All packet edits except one are prerequisite references and planet metadata.

**One reviewed mathematical test was corrected and needs re-review:** in base `HabiroNahmSeries:HB.8/fgi-collection`, test `lambda_determinant`, the rank-one denominator is `z^(-3)(1-z)`, without the previous minus sign. From Λ=−A−diag(z/(1−z)) and δ=z^(−3)(3−2z), one has det(−Λ)=(3−2z)/(1−z)=δ/[z^(−3)(1−z)]. The former test had the opposite sign. This is a local blueprint test correction, not an additional published-source erratum. Schedule re-review of this node/test with the assembly.

Two legacy Lean signatures now state hypotheses already required by their reviewed domains: `formalGaussian_sq` carries symmetry of its matrix, and `kummerSum_invariant` carries symmetry and nonzero coordinates with θ_i^m≠1. These hypotheses prevent the combined prototype from suggesting a theorem outside its source domain. Review these signatures as part of the assembly. The latter is only a constant-term naming target and supplies no proof of the missing all-order descent.

The reader replaces broader historical formulations by the corresponding **already reviewed** controlling refinements. The affected target IDs and controlling nodes are listed below. In particular, it no longer presents a signed unmultiplied integral class, a smaller rational coefficient field, Gaussian all-order regularity, powered-product integrality or numerical quartic 60-torsion as established. The accepted packet statements remain historical targets; their original review verdicts are not rewritten.


| Historical target | Controlling refined contract |
| --- | --- |
| [HabiroNahmSeries:HB.3/general-nondegenerate-class](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-general-nondegenerate-class) | [HabiroNahmSeries:HB.3/signed-exterior-boundary-obstruction](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-signed-exterior-boundary-obstruction) |
| [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-embeddings-and-regulator-evaluations) | [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-regulator-field-and-normalization-comparison) |
| [HabiroNahmSeries:HB.4/kummer-invariance-of-the-expansion](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-kummer-invariance-of-the-expansion) | [HabiroNahmSeries:HB.4/coefficientwise-kummer-descent-interface](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-coefficientwise-kummer-descent-interface) |
| [HabiroNahmSeries:HB.4/radial-asymptotic-expansion](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-radial-asymptotic-expansion) | [HabiroNahmSeries:HB.4/radial-analytic-remainder-comparison](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-radial-analytic-remainder-comparison) |
| [HabiroNahmSeries:HB.4/galois-equivariance-of-the-expansion](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-galois-equivariance-of-the-expansion) | [HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-cgz-normalization-and-field-comparison) |
| [HabiroNahmSeries:HB.4/simplified-form-and-the-unit](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-simplified-form-and-the-unit) | [HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-cgz-normalization-and-field-comparison) |
| [HabiroNahmSeries:HB.4/unit-corollary-and-nonvanishing](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-unit-corollary-and-nonvanishing) | [HabiroNahmSeries:HB.4/nonzero-unit-series-descent-comparison](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-nonzero-unit-series-descent-comparison) |
| [HabiroNahmSeries:HB.5/comparison-of-expansions](../readmes/HabiroNahmSeries.md#habironahmseries-hb-5-comparison-of-expansions) | [HabiroNahmSeries:HB.5/bounded-powers-with-the-actual-multiplier](../readmes/HabiroNahmSeries.md#habironahmseries-hb-5-bounded-powers-with-the-actual-multiplier) |
| [HabiroNahmSeries:HB.5/excluded-primes-and-hypotheses](../readmes/HabiroNahmSeries.md#habironahmseries-hb-5-excluded-primes-and-hypotheses) | [HabiroNahmSeries:HB.5/fixed-extension-constant-term-lift](../readmes/HabiroNahmSeries.md#habironahmseries-hb-5-fixed-extension-constant-term-lift) |
| [HabiroNahmSeries:HB.5/modularity-implies-torsion](../readmes/HabiroNahmSeries.md#habironahmseries-hb-5-modularity-implies-torsion) | [HabiroNahmSeries:HB.5/rational-bloch-arithmetic-bridge](../readmes/HabiroNahmSeries.md#habironahmseries-hb-5-rational-bloch-arithmetic-bridge) |
| [HabiroNahmSeries:HB.5/valuation-bound-at-every-cusp](../readmes/HabiroNahmSeries.md#habironahmseries-hb-5-valuation-bound-at-every-cusp) | [HabiroNahmSeries:HB.5/unrestricted-cusp-valuation-bound](../readmes/HabiroNahmSeries.md#habironahmseries-hb-5-unrestricted-cusp-valuation-bound) |
| [HabiroNahmSeries:HB.8/fgi-collection](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-fgi-collection) | [HabiroNahmSeries:HB.8/refinement-gaussian-normalization](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-refinement-gaussian-normalization) |
| [HabiroNahmSeries:HB.8/periodicity-of-the-gaussian-integrals](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-periodicity-of-the-gaussian-integrals) | [HabiroNahmSeries:HB.8/refinement-gaussian-shifts](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-refinement-gaussian-shifts) |
| [HabiroNahmSeries:HB.8/q-difference-for-the-gaussian-collection](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-q-difference-for-the-gaussian-collection) | [HabiroNahmSeries:HB.8/refinement-gaussian-shifts](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-refinement-gaussian-shifts) |
| [HabiroNahmSeries:HB.8/gaussian-pieces-are-power-series-in-t](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-gaussian-pieces-are-power-series-in-t) | [HabiroNahmSeries:HB.8/refinement-gaussian-regularity](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-refinement-gaussian-regularity) |
| [HabiroNahmSeries:HB.8/identification-theorem](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-identification-theorem) | [HabiroNahmSeries:HB.8/refinement-gaussian-identification](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-refinement-gaussian-identification) |
| [HabiroNahmSeries:HB.8/potential-pole-lemma](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-potential-pole-lemma) | [HabiroNahmSeries:HB.8/refinement-all-root-residue](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-refinement-all-root-residue) |
| [HabiroNahmSeries:HB.8/finite-support-theorem](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-finite-support-theorem) | [HabiroNahmSeries:HB.8/refinement-finite-support](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-refinement-finite-support) |
| [HabiroNahmSeries:HB.8/residues-of-congruence-sums](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-residues-of-congruence-sums) | [HabiroNahmSeries:HB.8/refinement-level-residues](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-refinement-level-residues) |
| [HabiroNahmSeries:HB.8/congruence-sums-are-level-m-admissible](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-congruence-sums-are-level-m-admissible) | [HabiroNahmSeries:HB.8/refinement-corrected-level-admissibility](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-refinement-corrected-level-admissibility) |
| [HabiroNahmSeries:HB.8/equality-of-invariants](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-equality-of-invariants) | [HabiroNahmSeries:HB.8/refinement-gaussian-identification](../readmes/HabiroNahmSeries.md#habironahmseries-hb-8-refinement-gaussian-identification) |
| [HabiroNahmSeries:HB.9/frobenius-on-the-coefficient-ring](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-frobenius-on-the-coefficient-ring) | [HabiroNahmSeries:HB.9/followup-branch-loss](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-branch-loss) |
| [HabiroNahmSeries:HB.9/frobenius-congruence](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-frobenius-congruence) | [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-integral-gluing-contract) |
| [HabiroNahmSeries:HB.9/gluing-by-uniqueness-of-q-difference-solutions](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-gluing-by-uniqueness-of-q-difference-solutions) | [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-integral-gluing-contract) |
| [HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-potential-and-the-p-adic-dilogarithm) | [HabiroNahmSeries:HB.9/followup-regulator-specialisation](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-regulator-specialisation) |
| [HabiroNahmSeries:HB.9/module-membership](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-module-membership) | [HabiroNahmSeries:HB.9/followup-etale-module-contract](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-etale-module-contract) |
| [HabiroNahmSeries:HB.9/descendants-by-specialisation](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-descendants-by-specialisation) | [HabiroNahmSeries:HB.9/followup-descendant-pullback-contract](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-descendant-pullback-contract) |
| [HabiroNahmSeries:HB.10/nonabelian-quartic-example](../readmes/HabiroNahmSeries.md#habironahmseries-hb-10-nonabelian-quartic-example) | [HabiroNahmSeries:HB.10/quartic-module-export](../readmes/HabiroNahmSeries.md#habironahmseries-hb-10-quartic-module-export) |
| [HabiroNahmSeries:HB.10/export-interfaces-and-non-consequences](../readmes/HabiroNahmSeries.md#habironahmseries-hb-10-export-interfaces-and-non-consequences) | [HabiroNahmSeries:HB.10/etale-nahm-cohomology-export](../readmes/HabiroNahmSeries.md#habironahmseries-hb-10-etale-nahm-cohomology-export) |

The combined HB.8 stage had twelve planet entries. Its six refined planet entries are retained; the six base display entries were removed without removing any declarations, API or tests. This meets the combined six-per-layer limit. The selection is Cyclotomic orbit equations, Nahm potential, Restricted Adams coefficients, Level-m admissibility, Residue lemma and Finite support theorem. Counts for HB.3/HB.4/HB.5a/HB.5/HB.8/HB.9/HB.10 are 5/6/2/4/6/5/6. No layer split has been applied.

## Supplier requests, collected without a second ownership plan

There are 24 request records across the seven packets. Their exact needs and consumers are retained below. Repeated Rogers, Borel, unique-divisibility and regulator requests refine one owner interface rather than creating distinct definitions. The broad inherited Coleman request is now consumed through the HB.9 named L2 imports; it is not a new request to re-plan Coleman integration. The inherited Andrews–Gordon request is likewise supplied by the existing QM.0 owner node identified in HB.4/andrews-gordon-owner-and-acceptance-comparison. Its remaining Rogers/trigonometric input stays with P.1. The QT.5 request is contextual for knot interpretation, not a premise of the formal matrix data.

The HB.5 request to HB.4 and the HB.9 request to HB.8 remain local proof obligations. Their finer node prerequisites have been added; the suppliers' recorded gaps remain open. HB.7's finite étale scalar-change/global-line request is not discharged by an existing number-field pullback. QM.0's q-Lucas/jet request, N.6's certified tame kernel and HQ.6's geometric comparison remain distinct exact extension requests.

### Requests from the base

**Base request 1: `ArithmeticQuantumTopology:QT.5`.**

Ideal triangulations and gluing equations as geometric context for the knot-derived formal matrix examples. QT.6 owns the full Neumann-Zagier datum and proves the topological interpretation of A_Nahm = I - B^{-1}A. HB.10 records the conditional algebraic recipe with B^{-1}A integral and does not require that interpretation.

**neededBy:** [HabiroNahmSeries:HB.10/knot-matrices-and-the-topological-boundary](../readmes/HabiroNahmSeries.md#habironahmseries-hb-10-knot-matrices-and-the-topological-boundary).

**Base request 2: `BorelRegulators:R.4`.**

For a number field F, the Borel regulator K_3(F) -> R^{r_2} is injective modulo torsion (its image is a full lattice; with R.3's rank r_2).

**neededBy:** [HabiroNahmSeries:HB.3/torsion-criterion-by-regulators](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-torsion-criterion-by-regulators).

**Base request 3: `ColemanIntegration:L2`.**

Coleman's Li_2 and log on the p-adic completion with their Frobenius relations, for the specialisation of the potential V(t) at t = 1.

**neededBy:** [HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-potential-and-the-p-adic-dilogarithm).

**Base request 4: `K3BlochGroups:V.4`.**

Suslin's theorem: for an algebraically closed field F of characteristic 0, the Bloch group B(F) is uniquely divisible (CGZ cite Suslin, 'K_3 of a field and the Bloch group', Theorem 6.3; no V.3-V.6 node states it).

**neededBy:** [HabiroNahmSeries:HB.3/torsion-in-the-algebraic-closure](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-torsion-in-the-algebraic-closure).

**Base request 5: `PadicHodgeRegulators:D.1`.**

Coleman's D_p(x) = Li_2(x) + ½ log x log(1 − x) with the Iwasawa branch, and its Frobenius behaviour on residue discs of units, in the normalisation of GSWZ (174) and (22).

**neededBy:** [HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-potential-and-the-p-adic-dilogarithm).

**Base request 6: `PadicHodgeRegulators:D.3`.**

GSWZ Lemma 3.1, Propositions 3.2-3.3 and Theorem 9 (p > 3 unramified).

**neededBy:** [HabiroNahmSeries:HB.9/p-adic-regulator-input](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-p-adic-regulator-input), [HabiroNahmSeries:HB.10/p-adic-computations-example](../readmes/HabiroNahmSeries.md#habironahmseries-hb-10-p-adic-computations-example).

**Base request 7: `PadicHodgeRegulators:D.4`.**

The localisation K_3(K) → K_3(K_p; Z_p), D_p on it in GSWZ's normalisation, and D_p(φ_pξ) = φ_pD_p(ξ).

**neededBy:** [HabiroNahmSeries:HB.9/potential-and-the-p-adic-dilogarithm](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-potential-and-the-p-adic-dilogarithm), [HabiroNahmSeries:HB.9/p-adic-regulator-input](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-p-adic-regulator-input).

**Base request 8: `Polylogarithms:P.1`.**

The real Rogers dilogarithm L : P^1(R) -> R/(pi^2/2)Z in CGZ's normalisation (42) (pi^2/6 minus the standard one: L(0) = pi^2/6, L(1) = 0, L(infinity) = -pi^2/6), its vanishing on the five-term elements C(R) of CGZ Definition 1.1, and the dilogarithm identity of Zagier's survey II.2C behind CGZ (47), L(xi_{A_n}) = (n - 3) pi^2/(6n). The other P.1 inputs (classical-polylogarithm, classical-distribution, bloch-wigner-dilogarithm, bloch-wigner-five-term) are cited by node id.

**neededBy:** [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-embeddings-and-regulator-evaluations), [HabiroNahmSeries:HB.4/andrews-gordon-radial-constant](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-andrews-gordon-radial-constant).

**Base request 9: `QSeriesPartitionsAndMockModularForms:QM.0`.**

A node for the Andrews-Gordon identity sum_{n_1..n_r >= 0} q^{N_1^2 + ... + N_r^2}/((q)_{n_1}...(q)_{n_r}) = prod_{k > 0, k != 0, +-(r+1) mod 2r+3} 1/(1 - q^k), N_i = n_i + ... + n_r (Andrews, Memoirs AMS 152), of which QM.0 plans only r = 1 (QM.0/rogers-ramanujan-first). The q-Pochhammer symbols and q-factorials are cited by node id (QM.0/q-pochhammer, QM.0/q-factorial).

**neededBy:** [HabiroNahmSeries:HB.4/andrews-gordon-radial-constant](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-andrews-gordon-radial-constant).

### Requests from HB.3

**HB.3 request 1: `Polylogarithms:P.1`.**

The real Rogers dilogarithm in CGZ (42): L_CGZ=π²/6−Li₂−½ log(x)log(1−x) on (0,1), with the specified x>1 and x<0 continuations, extended to P¹(R) with values in R/(π²/2)Z and values π²/6,0,−π²/6 at 0,1,∞. Its linear extension must kill the CGZ projective five-term relations and descend to the corrected integral B_CGZ(R); include the standard-normalization comparison and the three rank-one values.

**neededBy:** [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-regulator-field-and-normalization-comparison), [HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-embeddings-and-regulator-evaluations).

**HB.3 request 2: `BorelRegulators:R.4`.**

For each number field F, the degree-three Borel regulator on K₃(F)⊗Q is injective, with kernel before rationalization exactly torsion. Through the existing rational Suslin/Bloch comparison and Polylogarithms:P.2/borel-comparison, this detects the zero of ξ in B_CGZ(F)⊗Q by all complex-place Bloch–Wigner evaluations. Only the nonzero rational comparison scalar is needed.

**neededBy:** [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-regulator-field-and-normalization-comparison), [HabiroNahmSeries:HB.3/torsion-criterion-by-regulators](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-torsion-criterion-by-regulators).

**HB.3 request 3: `K3BlochGroups:V.4`.**

For an algebraically closed field of characteristic zero, in particular Qbar and C, B in the exact V.3 convention is uniquely divisible (Suslin, Theorem 6.3 cited by CGZ §1.3). Transport this to the corrected CGZ convention through the V.3 comparison, explaining why torsion maps to zero and rationalization does not change the algebraically closed group.

**neededBy:** [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-regulator-field-and-normalization-comparison), [HabiroNahmSeries:HB.3/torsion-in-the-algebraic-closure](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-torsion-in-the-algebraic-closure).

**HB.3 request 4: `K3BlochGroups:V.3`.**

Specify the integral Bloch/K₃ convention for GSWZ §1.7 (41)–(42): a signed symmetric integral solution has exterior boundary sum_i M_ii z_i wedge (−1), generally only certified 2-torsion. Give the correct integral target or an explicit lift and its relation to the V.3 antisymmetric and corrected CGZ conventions; explain what identifies the unmultiplied ξ used by the Habiro module. The local doubled CGZ class is insufficient for an assertion about its integral torsion order.

**neededBy:** [HabiroNahmSeries:HB.3/regulator-field-and-normalization-comparison](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-regulator-field-and-normalization-comparison), [HabiroNahmSeries:HB.3/general-nondegenerate-class](../readmes/HabiroNahmSeries.md#habironahmseries-hb-3-general-nondegenerate-class).

### Requests from HB.4

**HB.4 request 1: `Polylogarithms:P.1`.**

Supply L_std on P¹(R) modulo (π²/2)Z, the comparison L_CGZ=π²/6−L_std, its five-term/CGZ integral-relation descent and the trigonometric identity for X_j=1−[sin(π/n)/sin(πj/n)]² giving ∑_{j=2}^{(n−1)/2}L_CGZ(X_j)=(n−3)π²/(6n). The classical Li and distribution nodes already exist and are imported. This retains the exact parent/HB.3 owner request, rather than defining a second Rogers regulator.

**neededBy:** [HabiroNahmSeries:HB.4/andrews-gordon-owner-and-acceptance-comparison](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-andrews-gordon-owner-and-acceptance-comparison).

### Requests from HB.5

**HB.5 request 1: `HabiroNahmSeries:HB.4`.**

Complete the coefficient-descent proof for the already-owned corrected simplified-form-and-the-unit: at a nonzero constant term, over the fixed E=F(X_i^(1/D),ζ_D), prove u^n∈E_n, identify its image as inverse P_ζ(∑[X_i]) (D_ζ(1) trivial at good orders), and prove its χ^{-1} eigenspace. Give the reindexing/root-change cancellation including rational B and the Gauss factor; merely conjugating the formula to ζ^c does not prove this eigenspace statement. Only the constant term is consumed here. Take D divisible by 24. Specify the normalization: GZ (17) uses ν_a=e(r(n−1)(n−2)a/(24n)); with μ_a=e(r s(a,n)/2), the series is Φ_Ded=(ν_a/μ_a)Φ_GZ. Its displayed Gauss/product/S expression is rescaled by this ratio. Verify the descent and eigenspace claims in this convention; the ratio belongs to E_n and its n-th power changes no Kummer class.

**neededBy:** [HabiroNahmSeries:HB.5/fixed-extension-constant-term-lift](../readmes/HabiroNahmSeries.md#habironahmseries-hb-5-fixed-extension-constant-term-lift), [HabiroNahmSeries:HB.5/bounded-powers-with-the-actual-multiplier](../readmes/HabiroNahmSeries.md#habironahmseries-hb-5-bounded-powers-with-the-actual-multiplier), [HabiroNahmSeries:HB.5/rational-bloch-arithmetic-bridge](../readmes/HabiroNahmSeries.md#habironahmseries-hb-5-rational-bloch-arithmetic-bridge).

**existingNodes:** [HabiroNahmSeries:HB.4/kummer-invariance-of-the-expansion](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-kummer-invariance-of-the-expansion), [HabiroNahmSeries:HB.4/galois-equivariance-of-the-expansion](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-galois-equivariance-of-the-expansion), [HabiroNahmSeries:HB.4/simplified-form-and-the-unit](../readmes/HabiroNahmSeries.md#habironahmseries-hb-4-simplified-form-and-the-unit).

**relation:** Import and strengthen the proof of existing owned nodes; do not re-plan HB.4 in HB.5..

### Requests from HB.9

**HB.9 request 1: `HabiroNahmSeries:HB.8`.**

The corrected level-m admissibility theorem in the accepted ring R_m, the general-rank identification theorem, and the all-order corrected Gaussian normalization (E64/E65) with periodicity/q-difference API. HB.9 uses m′=1, p∤m. This is an extension of the existing HB.8 owners, not another admissibility or Gaussian definition.

**neededBy:** [HabiroNahmSeries:HB.9/frobenius-congruence](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-frobenius-congruence), [HabiroNahmSeries:HB.9/followup-refined-linear-integrality](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-refined-linear-integrality), [HabiroNahmSeries:HB.9/followup-integral-gluing-contract](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-integral-gluing-contract).

**HB.9 request 2: `HabiroNumberFields:HB.2`.**

A signed comparison of the fixed exported ε_m=c_ζ² with the full U_m(1) expression on the universal Kummer algebra, including inverse cyclic prefactors and all monomial/k-sum factors. Supply torsor restriction to every unramified local factor and root-coordinate compatibility, not a comparison up to an unspecified unit exponent.

**neededBy:** [HabiroNahmSeries:HB.9/followup-kummer-orientation-contract](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-kummer-orientation-contract), [HabiroNahmSeries:HB.9/module-membership](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-module-membership).

**HB.9 request 3: `HabiroNumberFields:HB.7`.**

Indexed Habiro modules/local spans and actual effective global descent for B=R[T]/(δT²−1), a full finite quadratic étale algebra that may split. Extend coefficient Frobenius, K₃ restriction, finite-Chern torsors, product gluing and Kummer descent over B[ζ_m,w]/(w_j^m−z_j), on all factors with a common Δ. Field pullback from the accepted HB.7 follow-up alone does not give the split-algebra result.

**neededBy:** [HabiroNahmSeries:HB.9/followup-etale-module-contract](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-etale-module-contract), [HabiroNahmSeries:HB.9/module-membership](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-module-membership).

**HB.9 request 4: `PadicHodgeRegulators:D.1`.**

Iwasawa D_p=Li₂+(1/2)log z log(1−z), log(root of unity)=0, and identification of the Bloch-symbol sum with the K₃ regulator. Coleman function identities are imported from their existing L2 nodes.

**neededBy:** [HabiroNahmSeries:HB.9/followup-regulator-specialisation](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-regulator-specialisation).

**HB.9 request 5: `PadicHodgeRegulators:D.3`.**

For p>3 on every unramified local field factor, the completed K₃ regulator isomorphism to p²O and the valid integral presentations used by HB.7 local sections; retain full finite products.

**neededBy:** [HabiroNahmSeries:HB.9/p-adic-regulator-input](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-p-adic-regulator-input), [HabiroNahmSeries:HB.9/followup-etale-module-contract](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-etale-module-contract).

**HB.9 request 6: `PadicHodgeRegulators:D.4`.**

Global K₃ localization to the full product of p-adic factors and compatibility with coefficient restriction/Frobenius, giving D_p(φ_pξ)=φ_pD_p(ξ) with the D.1 normalization.

**neededBy:** [HabiroNahmSeries:HB.9/followup-regulator-specialisation](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-followup-regulator-specialisation), [HabiroNahmSeries:HB.9/p-adic-regulator-input](../readmes/HabiroNahmSeries.md#habironahmseries-hb-9-p-adic-regulator-input).

### Requests from HB.10

**HB.10 request 1: `QSeriesPartitionsAndMockModularForms:QM.0`.**

Supply the q-Lucas root evaluation [ma+b choose mc+d]_{zeta_m}=binom(a,c)[b choose d]_{zeta_m} for positive m, 0<=b,d<m, with the Gaussian polynomial conventions already owned by QM.0; use the finite q-binomial theorem to prove it. For the small-prime repair also expose the finite cyclotomic Taylor-jet expansion that reduces the scalar A=3 coefficients to polynomial-in-h weighted binom(3h+a,h). Do not define Gaussian polynomials again in HB.10.

**neededBy:** [HabiroNahmSeries:HB.10/cubic-root-constant](../readmes/HabiroNahmSeries.md#habironahmseries-hb-10-cubic-root-constant), [HabiroNahmSeries:HB.10/cubic-small-prime-criterion](../readmes/HabiroNahmSeries.md#habironahmseries-hb-10-cubic-small-prime-criterion).

**HB.10 request 2: `ArithmeticKTheory:N.6`.**

For the D4 quartic F=Q(u), u^4+u^3+3u^2-3u-1=0 and O_F with basis (1,u,u^2,(u^3-u^2+2)/5), supply a certified order and prime factorization of K2(O_F), including its 2-primary part. This specializes N.6 tame-kernel order computations; finiteness alone does not determine the excluded prime set.

**neededBy:** [HabiroNahmSeries:HB.10/quartic-module-export](../readmes/HabiroNahmSeries.md#habironahmseries-hb-10-quartic-module-export).

**HB.10 request 3: `HabiroCohomologyFoundations:HQ.6`.**

Supply the geometric comparison, under explicit smoothness, good-prime and convergence assumptions, from the GW Frobenius-glued de Rham module H_naive^n(X/B) to the algebraic Habiro cohomology object of HQ.5, commuting with cyclotomic Taylor maps, coefficient changes, Frobenius and de Rham realization. HQ.8 realizations remain separate. This is an extension in the cohomology roadmap direction, recorded in restructure; no existing blueprint node states this map.

**neededBy:** [HabiroNahmSeries:HB.10/higher-cohomology-export-obligation](../readmes/HabiroNahmSeries.md#habironahmseries-hb-10-higher-cohomology-export-obligation).

## Restructuring proposals, collected for the orchestrator

The base has thirteen records; HB.10 has three. No restructuring, source register, campaign content, atlas edge or owner packet was changed. The wording below retains each proposal, including historical rationale. Two qualifications govern use of that rationale:

- The inherited HB.8 split proposed an ordered formal/Gaussian/admissibility chain because the base used the Gaussian proof of finite support. The HB.8 refinement now supplies the elementary all-rank finite-support chain independently. If the split is implemented, let the elementary branch precede the Gaussian/congruence branch; do not reintroduce the resolved Gaussian dependency for Theorem 6. The Gaussian identification and corrected level-m branch still require G1/G2/G3.
- The inherited “no comparison map” export note is superseded in relative dimension zero by the actual HR.5–HR.6/HQ.5 composite in HB.10. The higher geometric comparison remains the HQ.6 Part II request. Exports point to consumers; the general Nahm stages do not acquire reverse HQ/QT prerequisites.

The repeated HB.10 rational-example rescope is one inherited decision. The proposed QT.6 inputs remain HB.4/HB.8→QT.6, with no QT.6→HB.10 edge. The HQ.6 extension belongs to Habiro cohomology foundations and imports concrete Nahm applications.

### Base proposal 1: The detailed source behind HB.4 is not in the family's plan document

**kind:** note-external-source

**action:** rescope

**roadmaps:** HabiroNahmSeries

**title:** The detailed source behind HB.4 is not in the family's plan document

**detail:** HB.4's stage text says that the all-orders radial expansion is to be formalised using the detailed proof of Garoufalidis-Zagier. That paper is Asymptotics of Nahm sums at roots of unity, arXiv:1812.07690v1, and it is not listed among the references of research/blueprint/plans/HABIRO.md, which records CGZ and Hutchinson but not it. It is the only source that proves the expansion: CGZ quote it in simplified form and prove nothing about it. The hashes are those of the arXiv v1 PDF and of its e-print archive. Revised by REV-HabiroNahmSeries.

**proposal:** add it to the family's source register with the PDF hash c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66 and the e-print hash 1a76d25bc5f75e16b1a11a411fb6d09e71b4f367d66e05ab0f7fc0539cc73785, and record that Sections 2 to 4 of it are HB.4's primary source.

### Base proposal 2: The acceptance cases of this roadmap are now concrete and should be recorded as such

**kind:** note-acceptance

**action:** rescope

**roadmaps:** HabiroNahmSeries

**title:** The acceptance cases of this roadmap are now concrete and should be recorded as such

**detail:** The roadmap's acceptance line asks to prove finite i-support for each nonzero multi-index, to check a nonabelian number-field example, and to retain only the established modularity-implies-torsion implication. All three are now nodes: HB.8/finite-support-theorem, HB.10/nonabelian-quartic-example (the 60-torsion quartic example with its Delta-integrality data and its non-example second orbit), and HB.5/modularity-implies-torsion with HB.5/boundaries-of-the-implication. Revised by REV-HabiroNahmSeries.

**proposal:** record in the roadmap document which node discharges each acceptance item, so that a reviewer can check them without reading the whole packet.

### Base proposal 3: HB.5a's text should name the two facts the libraries do not have

**kind:** narrow-layer-text

**action:** rescope

**roadmaps:** HabiroNahmSeries

**title:** HB.5a's text should name the two facts the libraries do not have

**detail:** The reviewed audit records HB.5a as partly built and lists what the pinned libraries carry: arithmetic subgroups with the equivalence to finite index, the cusps as the rational projective line, scaling matrices, the finiteness of the cusp orbits, the width at infinity in Mathlib and the width at every cusp in Tau Ceti, the local parameter with its norm identity, and the orders of meromorphic germs. Only two things are missing: weight-zero meromorphic modular functions with Laurent expansions of finite principal part at every cusp, and the radial growth theorem with its rational exponential rate. As written the stage text asks for all of it, which makes the layer look larger than it is and invites a worker to re-plan what the libraries already have. Amended by REV-HabiroNahmSeries (checker B): The packet's proposal says only two facts are missing (meromorphic modular functions and the radial growth theorem). The proof of CGZ Theorem 7.5 also needs (i) the growth statement uniformly in Re(tau) at the cusp 0, because the comparison is made at the complex point epsilon = d h/(1 - i c h-bar), and (ii) the fact that an invariant Nahm sum has moderate growth at every cusp, since CGZ's 'modular' means invariance only. (ii) is Nahm-specific and belongs in HB.5.

**proposal:** Narrow HB.5a to: weight-zero modular functions with order and leading coefficient at every cusp (importing or owning the QM.3 notions, per the duplicate entry), and the growth theorem in its uniform (atImInfty) and radial forms with the exact rate -2 pi n_0/(h d^2) and phase; state in HB.5 the lemma that invariant Nahm sums are modular functions.

### Base proposal 4: HB.4's cyclic-dilogarithm target belongs to HB.2 and should say so

**kind:** note-duplicate-boundary

**action:** rescope

**roadmaps:** HabiroNahmSeries, HabiroNumberFields

**title:** HB.4's cyclic-dilogarithm target belongs to HB.2 and should say so

**detail:** HB.4's stage text asks for the field of definition of the expansion coefficients AND their cyclic-dilogarithm transformation law. The reviewed audit records the cyclic quantum dilogarithm, its change under an n-th-root choice, its five-term and distribution identities and its comparison with the finite Chern class as HB.2's targets,. This packet imports it by node id (HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm) and keeps only the identities the expansion uses. Revised by REV-HabiroNahmSeries.

**proposal:** rewrite HB.4's sentence to say that the cyclic dilogarithm and its transformation law are imported from HabiroNumberFields HB.2 and that HB.4 owns the field of definition of the coefficients, which is the statement S^m in F_m[[epsilon]] of the source.

### Base proposal 5: HabiroNahmSeries HB.4's atlas requires lists only HB.3, but its nodes use P.1, QM.0, QM.1 and HabiroNumberFields HB.2

**kind:** add-link

**action:** rescope

**roadmaps:** HabiroNahmSeries, HabiroNumberFields, QSeriesPartitionsAndMockModularForms, Polylogarithms

**title:** HabiroNahmSeries HB.4's atlas requires lists only HB.3, but its nodes use P.1, QM.0, QM.1 and HabiroNumberFields HB.2

**detail:** The packet's HB.4 nodes cite HabiroNumberFields HB.1/HB.2 (stage ids), QM.1 and HC.1, while data/atlas.json gives HabiroNahmSeries:HB.4 the single requirement HabiroNahmSeries:HB.3. After the corrections the analytic core of HB.4 (GZ Theorem 3.1) needs Polylogarithms P.1, QSeriesPartitionsAndMockModularForms QM.0 and QM.1, and only the polynomial D_zeta from HabiroNumberFields HB.2; the CGZ unit statements (Theorem 7.1's P_zeta clause, Corollary 7.2, Theorem 7.4) need HabiroNumberFields HB.2's P_zeta, R_zeta and eta_zeta nodes. No cycle arises as long as HabiroNumberFields HB.2 never requires HabiroNahmSeries HB.4: The reviewed HabiroNumberFields packet keeps Hutchinson's refinement R_zeta = c_zeta^2, which needs CGZ Theorem 7.4, in the node HabiroNumberFields:HB.2/hutchinson-refinement with a gap, and proposes a stage HB.2b after HabiroNahmSeries HB.4 for it; that is compatible. Added by REV-HabiroNahmSeries.

**proposal:** Add atlas links Polylogarithms:P.1 -> HabiroNahmSeries:HB.4, QSeriesPartitionsAndMockModularForms:QM.0 -> HabiroNahmSeries:HB.4, QSeriesPartitionsAndMockModularForms:QM.1 -> HabiroNahmSeries:HB.4 and HabiroNumberFields:HB.2 -> HabiroNahmSeries:HB.4; keep HabiroNahmSeries:HB.4 out of the requires-closure of HabiroNumberFields:HB.2 (accept #2904's HB.2b). Alternative with no new HabiroNumberFields edge: move HB.4/simplified-form-and-the-unit's unit clauses, HB.4/unit-corollary-and-nonvanishing and HB.4/acceptance-andrews-gordon to HabiroNahmSeries HB.5 (which already requires HabiroNumberFields:HB.2), keeping only HB.4/andrews-gordon-radial-constant in HB.4; then HabiroNumberFields HB.2b would require HabiroNahmSeries HB.5 instead of HB.4, and #2904's references to HabiroNahmSeries:HB.4/acceptance-andrews-gordon must be renamed.

### Base proposal 6: R3. GSWZ §2.1 is HabiroNumberFields HB.7's; conflict with RS-10 on root-of-unity Pochhammer asymptotics

**kind:** ownership

**action:** rescope

**roadmaps:** HabiroNahmSeries, HabiroNumberFields

**title:** R3. GSWZ §2.1 is HabiroNumberFields HB.7's; conflict with RS-10 on root-of-unity Pochhammer asymptotics

**detail:** HabiroNahmSeries' HB.9 node on p-adic polylogarithm integrality (deleted by this review) duplicated HabiroNumberFields:HB.7/pochhammer-dwork-difference (Lemma 2.1, Proposition 2.2). RS-10 (not accepted) keeps 'root-Pochhammer asymptotics' in HabiroNumberFields HB.2, while HabiroNahmSeries plans them in HB.4 and requested them from HB.2. This packet conflicts with RS-10 here. Checker A reached the same owner for the Pochhammer asymptotics (GZ Lemma 2.1). Added by REV-HabiroNahmSeries.

**proposal:** Owners: HabiroNumberFields HB.7 for GSWZ Lemma 2.1 and Proposition 2.2 (HabiroNahmSeries deletes its node); HabiroNahmSeries HB.4 for the root-of-unity asymptotics of (x; q)_∞ (GZ Lemma 2.1, GSWZ (59)); RS-10's HC.1 → HB.2 and P.1 → HB.2 links for these are retargeted to HabiroNahmSeries HB.4.

### Base proposal 7: The q-Pochhammer symbols are QM.0's, not HB.4's and not HC.1's

**kind:** note-ownership

**action:** rescope

**roadmaps:** HabiroNahmSeries, QSeriesPartitionsAndMockModularForms

**title:** The q-Pochhammer symbols are QM.0's, not HB.4's and not HC.1's

**detail:** HB.4/q-pochhammer-symbols defined qPochhammer, qFactorial and qPochhammerInf, names and objects already planned by QSeriesPartitionsAndMockModularForms:QM.0/q-pochhammer and QM.0/q-factorial, and requested them from HabiroCyclotomicCompletions HC.1, whose packet plans only the factorial polynomials (q;q)_N. Added by REV-HabiroNahmSeries.

**proposal:** HB.4/q-pochhammer-symbols becomes a comparison node importing QM.0; the HC.1 request is withdrawn in favour of QM.0 node ids.

### Base proposal 8: Weight-zero weakly holomorphic modular functions and Laurent expansions at cusps are planned twice

**kind:** duplicate

**action:** merge

**roadmaps:** HabiroNahmSeries, QSeriesPartitionsAndMockModularForms

**title:** Weight-zero weakly holomorphic modular functions and Laurent expansions at cusps are planned twice

**detail:** QSeriesPartitionsAndMockModularForms plans, for every arithmetic subgroup, exponential growth at cusps (QM.3/exponential-growth-at-cusps), weakly holomorphic modular forms M^!_k(Gamma) (QM.3/weakly-holomorphic-modular-form), their Laurent expansion at a cusp (QM.3/weakly-holomorphic-laurent-expansion) and Laurent q-expansions (QM.6/laurent-q-expansion). HabiroNahmSeries HB.5a/modular-function-of-finite-index and HB.5a/local-parameter-and-laurent-expansion plan the weight-zero case again (with poles allowed in H). All the QM nodes named depend only on Mathlib at node level, so an import creates no cycle (the stage closure of QM.3 contains no HabiroNahmSeries stage). The library audit AUDIT-14 lists only Tau Ceti ModularForms Layer 1 as a duplicate of HB.5a and misses QM.3. Added by REV-HabiroNahmSeries.

**proposal:** Plan the general notion once. Either (preferred, since HB.5a is the more foundational layer and its stage text makes it the unique supplier) move QM.3/exponential-growth-at-cusps, QM.3/weakly-holomorphic-modular-form and QM.3/weakly-holomorphic-laurent-expansion to HB.5a in weight k and let QM.3 and QM.6 import them, keeping in HB.5a the meromorphic weight-zero extension; or let HB.5a import the three QM.3 nodes at k = 0 and keep only the order/leading-coefficient definition, the growth theorem and the Nahm interface.

### Base proposal 9: HB.8's atlas requires lists only P.1, but its nodes need HB.4, QM.0 and HabiroNumberFields HB.2

**kind:** stage-requires

**action:** rescope

**roadmaps:** HabiroNahmSeries, HabiroNumberFields, QSeriesPartitionsAndMockModularForms

**title:** HB.8's atlas requires lists only P.1, but its nodes need HB.4, QM.0 and HabiroNumberFields HB.2

**detail:** fgi-collection and its successors use HB.4/formal-gaussian-integration (and through the formal datum HB.3); the formal Pochhammer symbol and the q-binomial theorem come from QM.0 nodes; the cyclic quantum dilogarithm definition comes from HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm. No cycle results (transitive closures checked). Added by REV-HabiroNahmSeries.

**proposal:** Set HabiroNahmSeries:HB.8 requires = [Polylogarithms:P.1, HabiroNahmSeries:HB.4, QSeriesPartitionsAndMockModularForms:QM.0, HabiroNumberFields:HB.2]. If the depth increase through HB.2 (to about 25) is unwanted, move the Mathlib-only definition of the cyclic quantum dilogarithm to a lower stage.

### Base proposal 10: HB.8 should be split in three ordered parts, not two independent halves

**kind:** split-layer

**action:** split

**roadmaps:** HabiroNahmSeries

**title:** HB.8 should be split in three ordered parts, not two independent halves

**detail:** HB.8 as written covers the whole of GSWZ Section 2, which this packet decomposes into seventeen nodes. Its two halves are independent. The first is combinatorial and arithmetic: admissible series, the product expansion with the Donaldson-Thomas exponents, the level m variants, and Theorems 6 and 7; it needs only the q-analogue toolkit of HabiroCyclotomicCompletions HC.1. The second is analytic and algebraic: formal Gaussian integration, the t-deformed equations and the ring S, the identification Theorem 8 and the WKB route; it needs HB.2's cyclic dilogarithm and the ring theory of the t-deformed equations. They meet only at the identification theorem. Revised by REV-HabiroNahmSeries (checker C): The packet says the combinatorial half (admissible series, Theorems 6 and 7) needs only HC.1 and meets the Gaussian half only at the identification theorem. But Theorem 6 needs Lemma 2.6, which GSWZ prove only through Theorem 8 and the explicit Gaussian pieces; Theorem 7 likewise needs Lemma 2.9. HC.1 is not used at all.

**proposal:** If HB.8 is split, order the parts: HB.8:formal (admissible series, product expansion, F_A, congruence sums, t-deformed equations, ring S), HB.8:gaussian (FGI collection, Lemmas 2.12, 2.15, Theorem 8, Lemmas 2.6/2.9), HB.8:admissibility (Theorems 6 and 7, (167), Corollary 2.18), each requiring the previous.

### Base proposal 11: R1. HB.10's 'one rational example' has no Nahm instance in GSWZ

**kind:** stage-text

**action:** rescope

**roadmaps:** HabiroNahmSeries

**title:** R1. HB.10's 'one rational example' has no Nahm instance in GSWZ

**detail:** GSWZ's only examples over Q are without Nahm data (Example 4.4 over Z[1/2]; §5.3). Every Nahm example is over a number field: Q(√−3) (figure-eight, abelian), the cubic field of discriminant −23 (A = (3), 5_2; Galois closure S3), the D4 quartic (A = (8 5; 5 4)). The packet had labelled the cubic example 'rational'. Added by REV-HabiroNahmSeries.

**proposal:** Reword HB.10: 'Work out one abelian and one genuine nonabelian number-field example from GSWZ (the figure-eight datum over Q(√−3) and the 60-torsion quartic datum), and the rank-one datum A = (3) over the cubic field of discriminant −23, with …'. Realised by HB.10/figure-eight-example, HB.10/nonabelian-quartic-example and HB.10/cubic-example.

### Base proposal 12: R2. Support HabiroNumberFields' HB.2b; the KMS identity has a source proof through HabiroNahmSeries HB.4

**kind:** note-cross-packet

**action:** rescope

**roadmaps:** HabiroNumberFields, HabiroNahmSeries

**title:** R2. Support HabiroNumberFields' HB.2b; the KMS identity has a source proof through HabiroNahmSeries HB.4

**detail:** GZ Appendix A (arXiv 1812.07690v1, pp. 14-16) proves the Kashaev–Mangazeev–Stroganov identity from GZ Lemma 2.1, which HabiroNahmSeries plans in HB.4/pochhammer-radial-asymptotics, together with Ramanujan's 1ψ1 formula and the η-transformation. That closes HabiroNumberFields' gap 'The Kashaev–Mangazeev–Stroganov identity is quoted, not proved', but only after HabiroNahmSeries HB.4, exactly like CGZ Theorem 7.4. Added by REV-HabiroNahmSeries.

**proposal:** HabiroNahmSeries' HB.4 nodes cite HabiroNumberFields:HB.2 node ids, not the stage. HB.2b (after HabiroNahmSeries HB.4) holds hutchinson-refinement and, if proved from GZ Appendix A, the KMS identity; HB.2 keeps the statement of KMS with its gap. HabiroNahmSeries HB.9 cites HB.2b's nodes.

### Base proposal 13: R4. Exports are links from HabiroNahmSeries, not prerequisites of it

**kind:** link-direction

**action:** rescope

**roadmaps:** HabiroNahmSeries, HabiroRings, HabiroCohomologyFoundations, ArithmeticQuantumTopology

**title:** R4. Exports are links from HabiroNahmSeries, not prerequisites of it

**detail:** The packet listed HabiroRings HR.2 and HR.6, HabiroCohomologyFoundations HQ.5 and HQ.8, and ArithmeticQuantumTopology QT.7 as prerequisites and requests, although the HB.10 text makes them consumers. QT.7 requires QT.6, which requires HabiroNahmSeries HB.9, so the edge HB.10 ← QT.7 is inverted. Added by REV-HabiroNahmSeries.

**proposal:** Remove those prerequisites and requests. Links: HabiroNahmSeries:HB.9 → ArithmeticQuantumTopology:QT.6 (exists); HabiroNahmSeries:HB.9 → HabiroRings:HR.5 for the relative Habiro ring of Z[t] → S, once a source exists (gap). ArithmeticQuantumTopology cites HabiroNahmSeries:HB.9/module-membership by node id.

### HB.10 proposal 1

**id:** HB10-R1

**proposal:** Retain the accepted parent R1 rescope: the rational example is the Z[1/2] Gauss family, an abelian Nahm example is over Q(sqrt(-3)), and the cubic and D4 quartic fields are separate explicit examples.

**reason:** GSWZ supplies no rational Nahm solution as the stage wording originally suggested. The finite Gauss family is the literal rational coefficient-ring example.

### HB.10 proposal 2

**id:** HB10-R2

**proposal:** Apply RT-AREA-topology/11: keep HB.10 knot-derived matrices as formal Nahm data. QT.6 owns every identification with knot invariants, Neumann–Zagier topological data, triangulation independence and state-integral comparison. QT.6 must import HB.4 estimates and HB.8 formal Gaussian integration.

**links:** {'source': 'HabiroNahmSeries:HB.4', 'target': 'ArithmeticQuantumTopology:QT.6'}, {'source': 'HabiroNahmSeries:HB.8', 'target': 'ArithmeticQuantumTopology:QT.6'}

**reason:** This packet states no topological identification, so it adds no QT.6-to-HB.10 dependency. All edits to QT.6 stay with that owner; this issue cannot edit its packet.

### HB.10 proposal 3

**id:** HB10-R3

**proposal:** Extend Habiro cohomology foundations in its own direction as Habiro cohomology foundations, Part II: explicit cycle realizations. It should own the GW Frobenius-glued de Rham carrier, analytic push-forward and its comparison with the HQ.5 algebraic theory; HR.6 continues to own coefficient-ring and complete-module interfaces.

**extends:** HabiroCohomologyFoundations

**reason:** GW Definition 1.2 and Theorem 1.18 provide a separate naive theory and a map into it. HB.10 supplies concrete series and an exact comparison request, without defining a second cohomology theory.

## Source access, findings and remaining mathematical work

The exact gap ledger is in the assembled reader; the seven source-version records remain in their packets. The following inherited source-access tasks have later supplied inputs: Zagier's chapter (HB.3/HB.5), Vlasenko–Zwegers and the published comparison (HB.4), the Gaussian affine/Fubini sources and KS/Efimov screen (HB.8), and Wagner's relative étale comparison (HB.10). Obtaining those sources did not close their stronger all-order or comparison obligations.

Finding identifiers are packet-local. HB.8 `HabiroNahmSeries/EHB8-1` and HB.9 `HabiroNahmSeries/E64` both address GSWZ (114)'s wrong regularization, and HB.9 `E65` adds the missing Euler factor. HB.10 `E64` concerns GW (182)'s missing algebraic factors, while HB.10 `E65` concerns its harmless theorem cross-reference. These are not merged by their textual IDs and no source verdict was changed. The old powered-family repair E47 is a valid recurrence family, but the refined unpowered family has the cancellation needed for product gluing; this distinction is explicit in the reader and prototype.

The next mathematical work belongs to the following existing owners. It is not unfinished assembly work:

| Layer | Resume at these exact obligations |
| --- | --- |
| HB.3 | Four owner contracts: CGZ Rogers extension, Borel regulator injectivity, unique divisibility over algebraic closures, signed integral Bloch/K₃ convention. |
| HB.4 | Coefficientwise actual-automorphism identity; rational Gauss/radical field and constant-class/eigenspace comparison; Rogers/trigonometric acceptance input. |
| HB.5 | The constant-term version of that HB.4 contract over one fixed E with D divisible by 24. Every-root growth and all-cusp valuation have a complete local route. |
| HB.8 | G1 global prefactors/affine identities; G2 all-loop t-regularity and completion change; G3 corrected level-m cancellation and integral ζ_m evaluations. Elementary finite support is independent of these gaps. |
| HB.9 | Faithful integral coefficient transfer; corrected HB.8 construction; signed finite-Chern orientation; all-order full-product gluing/indexed-module descent; q-dependent descendant transport. Preserve D.1/D.3/D.4 and HB.2/HB.7 supplier conditions. |
| HB.10 | All-component cubic integrality/gluing at 2 and 3, including independent shifts; exact quartic 60-torsion and K₃-lift certificate; certified tame kernel; inherited global coefficient-line interfaces and extension of restricted sections; geometric naive-to-algebraic comparison on an actual family and form. |

## Validation and submission

- `python3 scripts/check_blueprint.py` passes each of the seven packets with **0 errors and 0 warnings**.
- `lean-check research/blueprint/suggested/HabiroNahmSeries.lean` completed successfully against pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its only warnings are declaration uses `sorry`. It imports Mathlib modules; unavailable Tau Ceti/supplier interfaces are named omissions rather than claimed compiled implementations.
- Traceability checks cover all 183 IDs, 248 API names and 176 test names in the reader; namespace-aware name checks cover the typed/omitted prototype API and test names. The union dependency graph has no missing internal node reference or cycle. Every layer has at most six planets.
- Relative document links and local anchors resolve. A semantic packet diff confirms that review objects, coverage, statuses, source records and mathematical statements/proof outlines are unchanged; node edits are prerequisites/display metadata plus the one explicitly flagged determinant test.
- Only the issue-authorized reader, assembled suggested file, four listed packets and this handoff are changed. No campaign, atlas, owner, part-reader or review-verdict files are changed.

The assembly is ready for its independent review, including the determinant test and two clarified prototype domains identified above. Further work should resume from the exact owner contracts and gap consumers in the reader, not from the superseded base source-access descriptions. No scratch artifact is required by the next worker.

