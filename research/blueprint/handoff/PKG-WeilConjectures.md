# PKG-WeilConjectures — complete package

Issue: [#7500](https://github.com/CBirkbeck/tauceti-explorer/issues/7500). Worker: **Codex**, session **codex-WYMGfS**, 9 October 2026. Branch: `codex-WYMGfS-weil-conjectures-package`. The claim was confirmed by the bot after the worker's claim comment. This is a complete package submission, not a checkpoint; the next step is its independent package review. No second job was claimed.

## Deliverables

* `research/blueprint/packages/WeilConjectures/README.md` is an upstream-style roadmap, approximately 108 KB, covering every one of the 74 accepted targets. It contains the purpose, supplier boundaries, coefficient and Frobenius conventions, existing library interfaces, WC.0–WC.7, the numerical and independent surface branches of WC.5, definition APIs and checks, exact hypotheses, and primary-source theorem/section/page locators. It contains no programme process language or source excerpts.
* `research/blueprint/packages/WeilConjectures/Suggested.lean` joins the accepted assembled prototype under one standard header and one import block. Names and active signatures are unchanged. Only the header and explanatory comments were edited. The active code, compared after removing comments and whitespace, is identical to `research/blueprint/suggested/WeilConjectures.lean`.
* `research/blueprint/packages/WeilConjectures/metadata.toml` contains exactly `topic = "math.AG"`.
* This handoff records validation, source-reading scope, inherited supplier limitations and corrections that must be made in another job. No packet, assembly deliverable, atlas data or upstream file was edited.

The two upstream roadmaps read in full for form and density were the local **JacobianChallenge** and **HodgeStructures** READMEs. The **RepresentationTheory** index was also read in full for the existing representation-ring interface. The source of truth for target coverage was the two accepted packets `WeilConjectures--WC.0.json` and `WeilConjectures--WC.6.json`, together with the assembled reader, suggested file and ASM handoff. Both packet reviews are accepted, dated 6 October 2026. The three WeilConjectures-related link/overlap entries in `research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json` and `research/blueprint/links/tauceti_TauCetiRoadmap_AlgebraicCurves.json` were read and the independent elliptic Hasse theorem and coherent-genus/étale-Betti distinction retained.

## Validation

* `lean-check research/blueprint/packages/WeilConjectures/Suggested.lean` **exited 0** against the shared exact pinned Mathlib build. There were **97 warnings, all `declaration uses sorry`**, and no errors or other warnings. More than 100 GB of memory was available before starting; a single check ran and finished. No build, update, cache download or language server was started.
* The compiled file's SHA-256 is `cb604c2cc9e019369d92482e5456274efe247171c93ef3d6bdf5ca3de419531c`. Its final bytes have not changed since this elaboration.
* `python3 scripts/check_blueprint.py research/blueprint/packets/WeilConjectures--WC.0.json research/blueprint/packets/WeilConjectures--WC.6.json`: **0 errors and 0 warnings** on each unchanged packet.
* Scripted target/API/test comparison: **74/74** target declaration names in the README; **3/3** definitions, **19/19** named API signatures and **14/14** named definition examples in the suggested file. All 19 API names also occur in the README. There are **48 active named declarations** (3 definitions, 19 API theorems, 16 numerical theorems and 10 algebraic theorem forms), **52 examples**, and **97 `sorry` proofs**. The 29 active target signatures and 45 geometric target omissions are distinguished below.
* Direct finite-field enumeration independently verified the elliptic example's affine counts `1,1,2,2,1` over 𝔽₅ and the Artin–Schreier counts `3,5,9,33` over 𝔽₂, 𝔽₄, 𝔽₈ and 𝔽₁₆. The latter were checked both by enumerating equation solutions and by the trace-zero criterion in explicitly represented finite fields. These checks verify the numerical inputs, not a formal scheme-model construction.
* README byte size, paired inline-code/display-equation delimiters and absence of packet/job/review/checkpoint language were checked. Every target's locator and prerequisites were also checked manually against the accepted statements.
* Final `intake.py check-files` and `git diff --check` results are recorded after the coverage tables below.

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library coverage for WC.0–WC.7 and both WC.5 branches was read before writing. The union of the packets' **65 distinct baseline declarations** was inventoried and its statements read at the pins. The prototype imports individual Mathlib modules only; it has no Tau Ceti dependency. Existing Tau Ceti finite-field extension, representation-ring and elliptic-count declarations are cited as inputs in the README, not reprototyped here.

## Lean boundary

The package is a roadmap; nothing is claimed as implemented. All theorem and example proofs remain `sorry`. Elaboration checks their signatures. The three definition bodies are the accepted concrete definitions on existing carriers, with their complete APIs and definition checks.

Exactly **45 geometric target signatures** remain omitted from active Lean, as in the accepted assembly: 25 from WC.0–WC.5 and 20 from WC.6–WC.7. Their actual rational cohomology with compact support and geometric Frobenius, stack point groupoids, family transport, dualizing-object and cycle maps, and numerical Picard carrier APIs do not exist at the pins. PROTOCOL §13 requires such conditions to be left out instead of replacing them with arbitrary proposition fields. Their full mathematical statements are in the README; their exact proposed declaration names are in the target table. Matrix and rational-function examples in the last namespace test conventions, and are not represented as constructions of those schemes or stacks.

The 10 active algebraic forms isolate descent, Fatou integrality, Möbius inversion, signed determinant assembly, parity, constant-multiplier descent, extension signs, weight separation, the triangle-inequality point bound and recurrences on existing carriers. They do not remove the corresponding geometric comparison requirements. The all-extension bound's active signature, for example, receives the interior eigenvalue data; the README's geometric theorem additionally requires the genuine realization and endpoint comparisons.

## Plan corrections and supplier work retained for the next maintainer

The package follows the accepted mathematics and applies the ASM handoff's reader reconciliation. The following are packet/atlas edits or supplier work, outside this job's four deliverables.

1. **Fine prerequisites for WC.6.** Smooth proper factor extraction needs WC.1's normalized integral presentation and determinant comparison, and WC.3's **generic** extraction. The reviewed generic node now exists, so the WC.6 proof step saying only projective extraction is available is stale. The smooth proper functional equation should cite WC.2's signed assembly and multiplier descent. The package uses those exact interfaces and treats WC.6 as their application.
2. **Homology manifolds.** The smooth proper WC.2 statement alone does not cover them. EDC.1 biduality must export the perfect Frobenius-equivariant graded pairing from the actual isomorphism `a^! Q_ell ≃ Q_ell(d)[2d]`; WC.2's algebraic determinant assembly then applies. This owner extension remains required. The package states this contract explicitly, rather than inferring smoothness or introducing an RH/purity assumption field.
3. **All-power counts and overlaps.** Projective spaces and products use the WC.1 trace comparison and WC.5 recurrence. The multiplicative-group, cycle-count and rational-surface criterion use the all-power trace theorem without RH. The finite-étale, curve and WC.6 signed targets reuse the earlier orbit, curve numerator and signed APIs and add the canonical-factor comparisons. The packet's broad stage edges can be replaced by those node edges; the target statements and names were not changed here.
4. **Equivariant layer order.** The accepted equivariant-count node is assigned to WC.4 and its duality node to WC.2, although they consume WC.5's all-Spec-ℤ Tate theorem. The README presents these applications after that theorem in WC.5. Their original identifiers and proposed declaration names are retained in this handoff. The ASM proposal to reassign the nodes (and handle the six-planet limit) still needs a structural job. No new atlas identifiers were invented.
5. **Unregistered geometric owners.** The stack Part II and the three Schröer routes have no stage definitions in this snapshot. Stack applications explicitly require actual point/coarse/cohomology/trace/duality/comparison and, for arithmetic Tate statements, local p-adic exports. NumericalPicardAndContractionDescent must supply base-defined divisor descent up to rationalization, the proper-surface numerical-divisor/H²(1) comparison and the rational-surface free Picard lattice with finite-order action. EnriquesSurfacesAndIntegralNonexistence and GenusOneFibrationsAndRationalEllipticSurfaces must supply the actual surface types and `b_1=0`, `b_2=rho=10` in the precise characteristics and hypotheses used. A projective Hodge-index result is not automatically a theorem for all proper surfaces.
6. **Other inherited gaps.** A genuine smooth proper nonprojective example from DWP.10 still needs its construction and comparison; matrix examples do not meet that acceptance condition. The Artin–Schreier proper-model/cohomology bridge remains with AlgebraicCurves/FA.3. RD.7 and DWP.7 retain their original proof and coefficient obligations. The private WeilConjectures snapshot audit was not performed: its code was unavailable and no declaration was guessed. These are inherited implementation/supplier limitations, not unsubmitted package sections.
7. **Source metadata and locators.** WC.0's van den Bogaart–Edixhoven source title is wrong; the title used here is *Algebraic stacks whose number of points over finite fields is a polynomial*. WC.4's Milne §25.1 reference is a trace theorem, not the Artin-comparison locator. The README instead gives Theorem 20.5, p. 129, and Theorem 21.1, p. 130, together with §27.14(e), p. 159. The published BFP page range ends at 1365, and Schröer's title is *There is no Enriques surface over the integers*. These bibliographic corrections do not change target statements.
8. **Source misprints and qualifications.** The accepted source issues are respected in original prose: inclusive local integrality; all positive powers for the converse; √q in the curve bound; the explicitly labelled graph/diagonal intersections; exponent s throughout the BFP local-cutoff proof; finite-order effective descent for twists; exact prime-power rather than prime-only counts; rational Schur data for rational irreducibles; and 𝔽_q, including nonprime q, in the surface count. No legacy source excerpt has been copied into the package or this handoff.

The PR196 carrier specifications remain referenced through SF.2, at upstream commit `4bd72379658126cbe9be935656396f0c9dac4de0`, until the maintainer gives their layers atlas IDs. WC.1 normalized integral zeta and WC.3 generic factor extraction supply the numerical/arithmetic exports requested by DWP.7 and RD.7. The elliptic-regulator consumer still needs its separate Eichler–Shimura trace identification from the modular-curve owner; a curve point bound does not supply that map.

## Source reading and receipts

All sources used here are freely readable primary texts. No private-library book was needed or read. Downloads and extracted texts were kept only in scratch and are deleted after submission; no PDF, source passage or source transcript is a deliverable. The table below records which mathematical portions were read, rather than claiming a full rereading of the heavy imported proofs.

| Source | Portions read for this package |
| --- | --- |
| Deligne I | §§1.4–1.7, pp. 274–277, including the extraction proof; §1.15, p. 279; §§2.2–2.6, pp. 280–282; base-extension paragraph before §7.3 and Theorem 8.1 with proof, pp. 301–302. Projective purity's heavy proof is imported from DWP.4. |
| Deligne II | §§3.3.2–3.3.11, pp. 204–207, including the mixed, smooth proper and homology-manifold conclusions. The original weight-theory construction remains imported from DWP.7. |
| SGA 4½, Rapport | Coefficient extension discussion §2.11, p. 85; §§3.1–3.4 and 3.6, pp. 86–88, including the logarithmic-derivative proof and the cyclic determinant identity. The actual trace formula remains the supplier's theorem. |
| Milne v2.21 | §27.5–§27.15, pp. 155–160; Theorem 20.5, p. 129; Theorem 21.1, p. 130; Theorem 25.1, p. 147, to distinguish the trace and comparison locators. |
| Mustață | §3.3, pp. 21–23, including the all-power generating argument, Hodge-index computation, reciprocal-pairing step and elliptic example. |
| van den Bogaart–Edixhoven v3 | pp. 1–10: Theorem 2.1, the stack comparisons in §3, Lemma 4.1 and the theorem's proof in §4, including Lemma 4.2. |
| Bergström–Faber–Payne, published text | §1 weighted counts and Proposition 1.3, pp. 1324–1325; Proposition 3.1 and proof, p. 1330; the statement and relevant purity use of Proposition 4.2, p. 1331; §7 sieve/configuration arguments, pp. 1336–1339; §§9.1–9.2, pp. 1351–1352, including Proposition 9.3 and Remark 9.4. The specific moduli-space enumeration elsewhere is outside this roadmap's target scope. |
| Yu v5 | Appendix C, pp. 79–81, including Theorem C.1, its reduction, and the unnumbered p-adic finite-spectrum lemma. This package uses the numerical mechanism and supplies its explicit weighted Vandermonde extension. |
| Schröer v3 | §7, pp. 19–21, including the Tate/cycle discussion and proofs of Proposition 7.1 and Corollaries 7.2–7.3. Other surface constructions remain supplier inputs. |
| Kedlaya, Notes on isocrystals v6 | §§8.1–8.8 and 9.1–9.7, pp. 20–22; §§10.1–10.3, p. 27. These support the imported rigid/crystalline carrier/trace/weight interface. |
| Kedlaya, published Fourier transforms and p-adic Weil II | §5.3, Proposition 5.3.1, Theorem 5.3.2 with proof and consequences (a)–(c), pp. 1445–1446. The RD.7 comparison remains the owner theorem. |
| CohomologicalPointCounting specifications at 4bd7237 | FrobeniusGeometry Layers 4–7; EllAdicRealization Layers 7–10; TraceFormula Layers 7–8 and 11–15; EtaleBaseChange Layers 7–9; ComplexComparison Layers 10–12, read for the actual point, Frobenius, trace and transport contracts. |
| AlgebraicCurves, local upstream README | Layer 10 Artin–Schreier/model hypotheses and Layer 12 dictionary interfaces, with Layer 7 Hurwitz as the existing source contract; no source book was accessed. |

The source files' receipt hashes and complete target mapping follow. Download URLs for primary texts are given in the README bibliography; versioned arXiv receipts refer to the stated versions.

### Source receipt hashes

| Text | SHA-256 of bytes read |
| --- | --- |
| deligne-i | `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5` |
| deligne-ii | `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71` |
| bfp | `9843c296d6f775472ca718be1520c2152d13f5a37dd6928e8e454c2b2d134bd3` |
| vdbe | `46559f0499ac0c96192bcee9ec11f1d4933bff2285c6d29e97e008f8a8442b3b` |
| schroer | `ae6481f25627867473ba40db3b08e5f4b861de8aa103204eefc5ad1123a46d61` |
| milne | `ac4f122f371d38a44c58c296b7dbf88081d89d2de2334070bff3606771c01077` |
| mustata | `d83d5617b180d490de60286ca61f07d349c2dadba6d0b61eac1af2f628253b45` |
| yu | `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c` |
| sga | `fb2939521f4c0ea0cdd55a90bec2e618e32fb433c78b194e705c6d989f4e42a6` |
| isocrystals | `7fa7ab3126dcb5b25a77b97b5d7930983e2305fbfebc71b2e5f92697e6cab886` |
| kedlaya-published | `482b4e20d0b950a67444ef835ef11971645cf5e9ea62bdf081a2449e71a34529` |
| FrobeniusGeometry | `f48a69c8fb5de2ce19f7a57e257823001c842aced2ab4fdd8d945507b5432031` |
| EllAdicRealization | `9f327acf78145850c0fd8bf2818352d68ff1d647edd6b18644ebda81d2ab872b` |
| TraceFormula | `1ab2e7b8462e70f1609d09a7207ff1ad03027023ebe5f3644af59b7a14ac970f` |
| EtaleBaseChange | `eda733c1afd4e66f7565bbf20d5103f83c421902a4b7ea2996b769595fba2845` |
| ComplexComparison | `1c58d7db30b9acbe8656b29345d1c92cd334ef5b14cb35d644967b7adb96477c` |

### Target-to-package mapping

`active` means an actual signature on the pinned carriers. `supplier carriers required` means the README states the theorem in full while the active Lean signature remains omitted under PROTOCOL §13. Active geometric algebra forms still require the README’s geometric comparisons for their application. Node identifiers in this table retain the accepted packets’ assignments.

| Accepted target | README section | Proposed Lean name and status |
| --- | --- | --- |
| `WC.0/closed-point-degree-comparison` | [§ Closed points as Frobenius orbits](../packages/WeilConjectures/README.md#closed-points-as-frobenius-orbits) | `TauCeti.PointCounting.closed_point_degree_comparison` — supplier carriers required |
| `WC.0/finite-extension-point-tower-comparison` | [§ Rational points in an extension tower](../packages/WeilConjectures/README.md#rational-points-in-an-extension-tower) | `TauCeti.PointCounting.finite_extension_point_tower_comparison` — supplier carriers required |
| `WC.0/geometric-frobenius-realization-comparison` | [§ The rational geometric-Frobenius realization](../packages/WeilConjectures/README.md#the-rational-geometric-frobenius-realization) | `TauCeti.PointCounting.geometric_frobenius_realization_comparison` — supplier carriers required |
| `WC.1/closed-point-counts-mobius-inversion` | [§ Closed-point Möbius inversion](../packages/WeilConjectures/README.md#closed-point-möbius-inversion) | `TauCeti.PointCounting.closed_point_counts_mobius` — active |
| `WC.1/cohomological-formula-from-the-trace-formula` | [§ The cohomological determinant comparison](../packages/WeilConjectures/README.md#the-cohomological-determinant-comparison) | `TauCeti.PointCounting.cohomological_zeta_comparison` — supplier carriers required |
| `WC.1/curve-zeta-numerator-without-rh` | [§ A curve numerator before root bounds](../packages/WeilConjectures/README.md#a-curve-numerator-before-root-bounds) | `TauCeti.PointCounting.curve_zeta_numerator_without_rh` — supplier carriers required |
| `WC.1/equivariant-count-character-lattice` | [§ The integral character lattice](../packages/WeilConjectures/README.md#the-integral-character-lattice) | `TauCeti.PointCounting.equivariant_count_character_lattice` — supplier carriers required |
| `WC.1/finite-groupoid-mass` | [§ Finite groupoid mass](../packages/WeilConjectures/README.md#finite-groupoid-mass) | `TauCeti.PointCounting.groupoidMass` — active |
| `WC.1/hasse-weil-sieve-for-curve-families` | [§ The Hasse–Weil sieve](../packages/WeilConjectures/README.md#the-hasseweil-sieve) | `TauCeti.PointCounting.hasse_weil_sieve` — supplier carriers required |
| `WC.1/inverse-zeta-configuration-formula` | [§ Inverse zeta and configuration coefficients](../packages/WeilConjectures/README.md#inverse-zeta-and-configuration-coefficients) | `TauCeti.PointCounting.inverse_zeta_configuration_formula` — supplier carriers required |
| `WC.1/inverse-zeta-even-cohomology-termination` | [§ Termination for proper even cohomology](../packages/WeilConjectures/README.md#termination-for-proper-even-cohomology) | `TauCeti.PointCounting.inverse_zeta_even_termination` — supplier carriers required |
| `WC.1/local-fatou-normalization` | [§ Local Fatou normalization](../packages/WeilConjectures/README.md#local-fatou-normalization) | `TauCeti.PointCounting.local_fatou_normalization` — active |
| `WC.1/normalized-integral-zeta-presentation` | [§ The normalized integral rational presentation](../packages/WeilConjectures/README.md#the-normalized-integral-rational-presentation) | `TauCeti.PointCounting.normalized_integral_zeta_presentation` — supplier carriers required |
| `WC.1/rationality-over-q-via-hankel-determinants` | [§ Rational-series descent](../packages/WeilConjectures/README.md#rational-series-descent) | `TauCeti.PointCounting.rational_series_descent` — active |
| `WC.1/signed-frobenius-configuration-coefficient` | [§ Signed Frobenius configurations](../packages/WeilConjectures/README.md#signed-frobenius-configurations) | `TauCeti.PointCounting.signedConfigurationCoefficient` — active |
| `WC.1/stack-count-comparison` | [§ Stack mass, quotients and traces](../packages/WeilConjectures/README.md#stack-mass-quotients-and-traces) | `TauCeti.PointCounting.stack_count_comparison` — supplier carriers required |
| `WC.1/twisted-frobenius-point-comparison` | [§ Twists and Frobenius](../packages/WeilConjectures/README.md#twists-and-frobenius) | `TauCeti.PointCounting.twisted_frobenius_point_comparison` — supplier carriers required |
| `WC.1/zeta-function-euler-product-and-point-counts` | [§ Euler product and point-count series](../packages/WeilConjectures/README.md#euler-product-and-point-count-series) | `TauCeti.PointCounting.zeta_euler_comparison` — supplier carriers required |
| `WC.2/equivariant-polynomial-duality` | [§ Equivariant palindromicity](../packages/WeilConjectures/README.md#equivariant-palindromicity) | `TauCeti.PointCounting.equivariant_polynomial_duality` — supplier carriers required |
| `WC.2/functional-equation-base-extension` | [§ Finite extension and the sign](../packages/WeilConjectures/README.md#finite-extension-and-the-sign) | `TauCeti.PointCounting.functional_equation_base_extension` — active |
| `WC.2/functional-equation-multiplier-descent` | [§ Rational descent and the exact sign](../packages/WeilConjectures/README.md#rational-descent-and-the-exact-sign) | `TauCeti.PointCounting.functional_equation_multiplier_descent` — active |
| `WC.2/middle-degree-parity` | [§ The integral half exponent](../packages/WeilConjectures/README.md#the-integral-half-exponent) | `TauCeti.PointCounting.middle_degree_parity` — active |
| `WC.2/signed-zeta-functional-equation` | [§ The determinant multiplier](../packages/WeilConjectures/README.md#the-determinant-multiplier) | `TauCeti.PointCounting.signed_zeta_functional_equation` — active |
| `WC.3/degreewise-pure-factor-extraction` | [§ Generic degreewise extraction](../packages/WeilConjectures/README.md#generic-degreewise-extraction) | `TauCeti.PointCounting.degreewise_pure_factor_extraction` — active |
| `WC.3/integral-factors-and-ell-independence-from-purity` | [§ The projective Weil factors](../packages/WeilConjectures/README.md#the-projective-weil-factors) | `TauCeti.PointCounting.integral_projective_weil_factors` — supplier carriers required |
| `WC.4/betti-comparison-in-a-supplied-family` | [§ Transport to a complex fibre](../packages/WeilConjectures/README.md#transport-to-a-complex-fibre) | `TauCeti.PointCounting.betti_comparison_supplied_family` — supplier carriers required |
| `WC.4/equivariant-polynomial-point-counts` | [§ Equivariant polynomial counts](../packages/WeilConjectures/README.md#equivariant-polynomial-counts) | `TauCeti.PointCounting.equivariant_polynomial_point_counts` — supplier carriers required |
| `WC.5/all-extension-point-count-bound` | [§ The all-extension Weil estimate](../packages/WeilConjectures/README.md#the-all-extension-weil-estimate) | `TauCeti.PointCounting.all_extension_point_count_bound` — active |
| `WC.5/approximate-counts-and-tate-semisimplification` | [§ Approximate counts and Tate semisimplification](../packages/WeilConjectures/README.md#approximate-counts-and-tate-semisimplification) | `TauCeti.PointCounting.approximate_counts_tate_semisimplification` — supplier carriers required |
| `WC.5/complete-intersection-point-count` | [§ Complete intersections](../packages/WeilConjectures/README.md#complete-intersections) | `TauCeti.PointCounting.complete_intersection_point_count` — supplier carriers required |
| `WC.5/components-and-dimension-zero` | [§ Components and dimension zero](../packages/WeilConjectures/README.md#components-and-dimension-zero) | `TauCeti.PointCounting.component_and_dimension_zero_counts` — supplier carriers required |
| `WC.5/curve-and-elliptic-bound-comparison` | [§ Compatibility with curve and elliptic bounds](../packages/WeilConjectures/README.md#compatibility-with-curve-and-elliptic-bounds) | `TauCeti.PointCounting.curve_elliptic_bound_comparison` — supplier carriers required |
| `WC.5/extension-count-recurrence` | [§ Recurrences and Newton recovery](../packages/WeilConjectures/README.md#recurrences-and-newton-recovery) | `TauCeti.PointCounting.extension_count_recurrence` — active |
| `WC.5/local-polynomial-count-cutoff` | [§ A local cutoff for approximate polynomial counts](../packages/WeilConjectures/README.md#a-local-cutoff-for-approximate-polynomial-counts) | `TauCeti.PointCounting.local_polynomial_count_cutoff` — supplier carriers required |
| `WC.5/polynomial-counts-over-z-and-tate-cohomology` | [§ Polynomial counts over all Spec ℤ](../packages/WeilConjectures/README.md#polynomial-counts-over-all-spec-ℤ) | `TauCeti.PointCounting.polynomial_counts_over_z_tate_cohomology` — supplier carriers required |
| `WC.5/polynomial-point-count` | [§ Exact polynomial point count](../packages/WeilConjectures/README.md#exact-polynomial-point-count) | `TauCeti.PointCounting.HasPolynomialPointCount` — active |
| `WC.5:power-sum-converse/consecutive-moment-bound` | [§ A quantitative moment-window bound](../packages/WeilConjectures/README.md#a-quantitative-moment-window-bound) | `TauCeti.FiniteSpectrum.consecutive_moment_bound` — active |
| `WC.5:power-sum-converse/distinct-spectrum-bound` | [§ Visible distinct roots](../packages/WeilConjectures/README.md#visible-distinct-roots) | `TauCeti.FiniteSpectrum.norm_le_of_distinct_moment_bound` — active |
| `WC.5:power-sum-converse/formal-power-sum-product` | [§ The formal polynomial identity](../packages/WeilConjectures/README.md#the-formal-polynomial-identity) | `TauCeti.FiniteSpectrum.formal_power_sum_product` — active |
| `WC.5:power-sum-converse/formal-rational-comparison` | [§ Comparison in Laurent series](../packages/WeilConjectures/README.md#comparison-in-laurent-series) | `TauCeti.FiniteSpectrum.formal_power_sum_eq_ratFunc` — active |
| `WC.5:power-sum-converse/generating-numerator-denominator` | [§ A common numerator and denominator](../packages/WeilConjectures/README.md#a-common-numerator-and-denominator) | `TauCeti.FiniteSpectrum.generating_common_denominator` — active |
| `WC.5:power-sum-converse/graded-polynomial-approximation-lemma` | [§ Polynomial approximation of graded moments](../packages/WeilConjectures/README.md#polynomial-approximation-of-graded-moments) | `TauCeti.FiniteSpectrum.graded_polynomial_approximation` — active |
| `WC.5:power-sum-converse/grouped-spectrum-bound` | [§ Grouping coincident roots](../packages/WeilConjectures/README.md#grouping-coincident-roots) | `TauCeti.FiniteSpectrum.norm_le_of_grouped_moment_bound` — active |
| `WC.5:power-sum-converse/little-o-visible-root-vanishing` | [§ A strict bound from little-o moments](../packages/WeilConjectures/README.md#a-strict-bound-from-little-o-moments) | `TauCeti.FiniteSpectrum.norm_lt_of_moments_little_o` — active |
| `WC.5:power-sum-converse/no-pole-in-bounded-disc` | [§ No poles in the bounded disc](../packages/WeilConjectures/README.md#no-poles-in-the-bounded-disc) | `TauCeti.FiniteSpectrum.no_pole_of_power_sum_bound` — active |
| `WC.5:power-sum-converse/pole-cancellation-criterion` | [§ The exact pole-cancellation criterion](../packages/WeilConjectures/README.md#the-exact-pole-cancellation-criterion) | `TauCeti.FiniteSpectrum.generating_pole_cancellation_iff` — active |
| `WC.5:power-sum-converse/power-sum-bound-iff` | [§ Equivalence with bounds for all positive powers](../packages/WeilConjectures/README.md#equivalence-with-bounds-for-all-positive-powers) | `TauCeti.FiniteSpectrum.power_sum_bound_iff` — active |
| `WC.5:power-sum-converse/power-sum-converse` | [§ The unweighted power-sum converse](../packages/WeilConjectures/README.md#the-unweighted-power-sum-converse) | `TauCeti.FiniteSpectrum.norm_le_of_power_sum_bound` — active |
| `WC.5:power-sum-converse/power-sum-generating-series` | [§ The convergent generating expression](../packages/WeilConjectures/README.md#the-convergent-generating-expression) | `TauCeti.FiniteSpectrum.hasSum_power_sum_generating` — active |
| `WC.5:power-sum-converse/reciprocal-moments-escape-unit-ball` | [§ Reciprocal moments escaping the unit ball](../packages/WeilConjectures/README.md#reciprocal-moments-escaping-the-unit-ball) | `TauCeti.FiniteSpectrum.reciprocal_moments_escape` — active |
| `WC.5:power-sum-converse/reciprocal-pairing-forces-equality` | [§ Reciprocal pairing upgrades the bound to equality](../packages/WeilConjectures/README.md#reciprocal-pairing-upgrades-the-bound-to-equality) | `TauCeti.FiniteSpectrum.norm_eq_of_reciprocal_pairing` — active |
| `WC.5:power-sum-converse/recover-consecutive-moments` | [§ Finite spectra: recovering a root from a window of moments](../packages/WeilConjectures/README.md#finite-spectra-recovering-a-root-from-a-window-of-moments) | `TauCeti.FiniteSpectrum.recover_consecutive_moments` — active |
| `WC.5:surface-alternative/curve-rh-from-surface-bound` | [§ Curve RH from the surface bound](../packages/WeilConjectures/README.md#curve-rh-from-the-surface-bound) | `TauCeti.PointCounting.curve_rh_from_surface_bound` — supplier carriers required |
| `WC.5:surface-alternative/surface-all-extension-bound-comparison` | [§ The independent surface route to curve bounds](../packages/WeilConjectures/README.md#the-independent-surface-route-to-curve-bounds) | `TauCeti.PointCounting.surface_all_extension_bound_comparison` — supplier carriers required |
| `WC.6/homology-manifold-weil-assembly` | [§ Proper rational homology manifolds](../packages/WeilConjectures/README.md#proper-rational-homology-manifolds) | `TauCeti.AlgebraicGeometry.WeilZeta.weil_factors_of_dualizing_constant` — supplier carriers required |
| `WC.6/mixed-l-function-divisor-weights` | [§ Reciprocal zeros and poles of mixed L-functions](../packages/WeilConjectures/README.md#reciprocal-zeros-and-poles-of-mixed-l-functions) | `TauCeti.AlgebraicGeometry.WeilZeta.reciprocal_divisor_weight_le` — supplier carriers required |
| `WC.6/purity-for-proper-smooth-varieties` | [§ Integral factors for smooth proper schemes](../packages/WeilConjectures/README.md#integral-factors-for-smooth-proper-schemes) | `TauCeti.AlgebraicGeometry.WeilZeta.exists_unique_integral_degree_factors_of_smooth_proper` — supplier carriers required |
| `WC.6/purity-for-smooth-proper-dm-stacks` | [§ Smooth proper DM stack purity](../packages/WeilConjectures/README.md#smooth-proper-dm-stack-purity) | `TauCeti.AlgebraicGeometry.WeilZeta.pure_cohomology_of_smooth_proper_dm_stack` — supplier carriers required |
| `WC.6/smooth-proper-functional-equation` | [§ The smooth proper signed equation](../packages/WeilConjectures/README.md#the-smooth-proper-signed-equation) | `TauCeti.AlgebraicGeometry.WeilZeta.functional_equation_of_smooth_proper` — supplier carriers required |
| `WC.7/all-extension-counts-from-cycles` | [§ Counts over every extension from cycles](../packages/WeilConjectures/README.md#counts-over-every-extension-from-cycles) | `TauCeti.AlgebraicGeometry.WeilZeta.count_extension_of_surjective_base_cycles` — supplier carriers required |
| `WC.7/curve-zeta-jacobian-agreement` | [§ Curves and their Jacobians](../packages/WeilConjectures/README.md#curves-and-their-jacobians) | `TauCeti.AlgebraicGeometry.WeilZeta.degree_one_factor_curve` — supplier carriers required |
| `WC.7/elliptic-curve-over-f5` | [§ An elliptic curve over 𝔽₅](../packages/WeilConjectures/README.md#an-elliptic-curve-over-𝔽₅) | `TauCeti.AlgebraicGeometry.WeilZeta.zeta_weierstrass_five` — supplier carriers required |
| `WC.7/finite-etale-permutation-factors` | [§ Finite étale schemes](../packages/WeilConjectures/README.md#finite-étale-schemes) | `TauCeti.AlgebraicGeometry.WeilZeta.degree_factor_finite_etale_orbits` — supplier carriers required |
| `WC.7/genus-two-negative-euler-example` | [§ A genus-two curve with negative Euler characteristic](../packages/WeilConjectures/README.md#a-genus-two-curve-with-negative-euler-characteristic) | `TauCeti.AlgebraicGeometry.WeilZeta.zeta_artin_schreier_genus_two` — supplier carriers required |
| `WC.7/geometric-weil-assembly` | [§ The smooth proper endpoint](../packages/WeilConjectures/README.md#the-smooth-proper-endpoint) | `TauCeti.AlgebraicGeometry.WeilZeta.weil_conclusions_of_smooth_proper` — supplier carriers required |
| `WC.7/kunneth-product-agreement` | [§ Products and Künneth](../packages/WeilConjectures/README.md#products-and-künneth) | `TauCeti.AlgebraicGeometry.WeilZeta.degree_factors_product_of_smooth_proper` — supplier carriers required |
| `WC.7/multiplicative-group-compact-support-agreement` | [§ The multiplicative group and compact support](../packages/WeilConjectures/README.md#the-multiplicative-group-and-compact-support) | `TauCeti.AlgebraicGeometry.WeilZeta.l_function_multiplicative_group` — supplier carriers required |
| `WC.7/projective-plane-functional-equation-sign` | [§ The sign for the projective plane](../packages/WeilConjectures/README.md#the-sign-for-the-projective-plane) | `TauCeti.AlgebraicGeometry.WeilZeta.functional_equation_projective_plane` — supplier carriers required |
| `WC.7/projective-space-degree-factors` | [§ Projective spaces](../packages/WeilConjectures/README.md#projective-spaces) | `TauCeti.AlgebraicGeometry.WeilZeta.degree_factors_projective_space` — supplier carriers required |
| `WC.7/rational-surface-picard-count-criterion` | [§ A maximal-count criterion for rational surfaces](../packages/WeilConjectures/README.md#a-maximal-count-criterion-for-rational-surfaces) | `TauCeti.AlgebraicGeometry.WeilZeta.constant_picard_iff_maximal_count_rational_surface` — supplier carriers required |
| `WC.7/scalar-frobenius-from-base-field-cycles` | [§ Frobenius from base-field algebraic cycles](../packages/WeilConjectures/README.md#frobenius-from-base-field-algebraic-cycles) | `TauCeti.AlgebraicGeometry.WeilZeta.frobenius_scalar_of_surjective_base_cycle_map` — supplier carriers required |
| `WC.7/surface-count-constant-numerical-picard` | [§ Surfaces with constant numerical Picard group](../packages/WeilConjectures/README.md#surfaces-with-constant-numerical-picard-group) | `TauCeti.AlgebraicGeometry.WeilZeta.count_surface_of_constant_num` — supplier carriers required |
| `WC.7/twenty-five-point-surfaces` | [§ Twenty-five points over 𝔽₂](../packages/WeilConjectures/README.md#twenty-five-points-over-𝔽₂) | `TauCeti.AlgebraicGeometry.WeilZeta.count_enriques_or_rational_genus_one` — supplier carriers required |
| `WC.7/zeta-from-base-field-algebraic-cycles` | [§ Zeta factors from algebraic cycles](../packages/WeilConjectures/README.md#zeta-factors-from-algebraic-cycles) | `TauCeti.AlgebraicGeometry.WeilZeta.zeta_of_surjective_base_cycles` — supplier carriers required |

### Definition API and test mapping

Each API item below is an active named theorem and appears in its definition’s README table. Each test is a Lean `example` preceded by the accepted test name; the README states its mathematical check.

**`TauCeti.PointCounting.groupoidMass`**: [README section](../packages/WeilConjectures/README.md#finite-groupoid-mass).

API: `groupoidMass_aut_card_iso`, `groupoidMass_equivalence`, `groupoidMass_discrete`, `groupoidMass_singleObj`, `groupoidMass_product`, `groupoidMass_sum`, `groupoidMass_actionCategory`.

Tests: `groupoidMass_empty`, `groupoidMass_three`, `groupoidMass_cyclic_two`, `groupoidMass_cyclic_two_not_one`, `groupoidMass_regular_action`.

**`TauCeti.PointCounting.signedConfigurationCoefficient`**: [README section](../packages/WeilConjectures/README.md#signed-frobenius-configurations).

API: `signedConfigurationCoefficient_zero`, `signedConfigurationCoefficient_one`, `signedConfigurationCoefficient_conjugate`, `signedConfigurationCoefficient_above_card`, `signedConfigurationCoefficient_sumCongr`, `signedConfigurationCoefficient_generating`.

Tests: `signedConfigurationCoefficient_empty`, `signedConfigurationCoefficient_fixed_two`, `signedConfigurationCoefficient_two_cycle`, `signedConfigurationCoefficient_two_cycle_sign`.

**`TauCeti.PointCounting.HasPolynomialPointCount`**: [README section](../packages/WeilConjectures/README.md#exact-polynomial-point-count).

API: `HasPolynomialPointCount_eval`, `HasPolynomialPointCount_unique`, `HasPolynomialPointCount_zero`, `HasPolynomialPointCount_add`, `HasPolynomialPointCount_mul`, `HasPolynomialPointCount_congr`.

Tests: `polynomialPointCount_projective_line`, `polynomialPointCount_empty`, `polynomialPointCount_multiplicative_group`, `polynomialPointCount_prime_fields_insufficient`, `polynomialPointCount_one_field_insufficient`.

## Final submission checks

`python3 research/blueprint/intake.py check-files` on the four permitted deliverables reports **4 files, 0 problems**. The final staged diff passes `git diff --cached --check`. The diff contains only the four files named by issue #7500. No source file, packet or atlas change is included.

The suggested file's active code is unchanged after its successful elaboration. Its 97 `sorry` warnings are the expected proof placeholders, not proof completion. Source downloads and scratch notes are removed after the PR is opened; all reproducible locators, receipt hashes and target/API/test mappings needed by the independent reviewer are recorded above.
