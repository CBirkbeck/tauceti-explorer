# Independent review: AInfCohomology AI.0–AI.5

**Job:** REV-AInfCohomology--AI.0 · **Issue:** #338 · **Reviewer:** Codex, session codex-LLwfv5 · **Date:** 2026-10-07

**Verdict: needs_changes.** This is a finished independent review, not a checkpoint. The packet now corrects the identified mathematics and explicitly requests missing supplier refinements. Acceptance is blocked by absent named theorem signatures, three APIs that do not state their promised assertions, and contradictions in the reader document. That document is not an allowed deliverable of this issue, so it was checked and left for revision.

The `complete` pass status and all eight `planned` stage statuses remain appropriate at target level: all scoped targets have nodes, and open proof interiors/supplier extensions are recorded. No stage is declared closed. Neither the `sorry` prototypes nor the review claim mathematical implementation.

## Counts and scope

| Item | Before | After |
| --- | ---: | ---: |
| Nodes | 131 | 131 |
| Definitions and constructions | 28 | 28 |
| API items | 115 | 118 |
| Unit tests | 84 | 85 |
| Planets | 31 | 31 |
| Baseline declarations | 27 | 29 |
| Owner requests | 14 | 16 |
| Explicit gaps | 6 | 12 |

Per-node verdicts: 10 corrected, 78 unverifiable, 43 verified. All 131 node IDs occur exactly once in `review.checked`. There are no added nodes; 27 existing node plans were corrected. Two missing named signatures were restored. Three API items and one negative-control test were added. No baseline entry was removed.

## Sources and independent method

Read the upstream AdicSpaces and DGAInfinity documents in full, the accepted RS-01 ownership/conservation contract, the blueprint and expansion protocols, upstream guide, reviewed library audit and AInf audit supplement. Reviewed all scoped nodes stage by stage: statement, hypotheses, locator, proof outline, direct prerequisites, API, tests and planet choice. Checked 58 distinct external prerequisite references against their actual supplier nodes and reconciled all 16 owner requests. A supplier request is a future refinement, not a theorem already supplied.

Primary texts read include BMS1 arXiv v3 and the journal article, BMS2, Scholze’s 2013 author copy and corrigendum, Scholze–Weinstein’s Berkeley author copy, Zavyalov v3, Anschütz–Le Bras v4 and its erratum, and BLM’s December 2019 author copy. Exact public URLs, reading dates and SHA-256 hashes are in `sources`/`sourceVersions`. All 133 node excerpts match downloaded primary text after Unicode/whitespace normalization. This mechanical check establishes quotation identity only; mathematical scope and locators were checked separately and corrected below. The Stacks references 077J and 091N were also checked.

The ALB erratum concerns the nilpotence argument in published Proposition 5.23, not the §4.3.5 minuscule dictionary used here. Scholze’s corrected covers, deleted point claims and integral completed sheaves were checked; none of the deleted splitting assertions is used. The BLM publisher sample omits the relevant interior, so E2–E5 are deliberately confined to the downloaded author copy.

## Corrections made

| Node (short ID) | Correction |
| --- | --- |
| `theta-witt-family` | Corrected the false p-lift in Verschiebung (Lemma 3.4) and added a characteristic-zero negative control. |
| `witt-kernel-generators` | Made the general-perfectoid nonzerodivisor input of Lemma 3.12 explicit. |
| `witt-base-change` | Removed the O_C-only period-regularity prerequisite from the theorem for general integral perfectoid rings. |
| `strongly-k-flat-replacements` | Corrected the false claim that a Cartier inclusion is locally split; flat tensor preserves its injectivity. |
| `punctured-vector-bundle-criterion` | Lemma 4.10 uses localization at the prime (p), not an x-local p-completed chart. |
| `continuous-cochains-koszul` | Restored the exact inverse-limit hypotheses and the comparison with the discrete dense subgroup Z^d (Lemma 7.3). |
| `koszul-products-and-cohomology` | Replaced unspecified eligible cases by the twisted DGA relations and the precise homotopy/divisibility hypotheses of Lemmas 7.5 and 7.10. |
| `perfectoid-period-sections` | Removed rational B_dR acyclicity from integral AI.3, resolving the residual RT-AREA-padic-2/10 ownership error. |
| `fv-precomplex` | Added the missing connectivity of D/xi from §11.1; mere connectivity of D does not ensure H^0(D) is xi-torsion-free. Corrected the false arbitrary-one0 identity: the affine coefficient prototype is now a unital ring map with lambda(1)=1. Its universal relative Witt map still needs the stated supplier structure. |
| `fv-improved-complex` | Retained the source connectivity assumptions of the preceding precomplex. |
| `bounded-pd-coefficients` | Replaced the incorrect bounded-subring locator 12.2–12.4 by 12.8 and stated its actual regularity/topology/intersection estimates. |
| `pd-toric-eta-comparison` | Added the actual bounded coefficient exchange and canonical factorization of Lemma 12.8(iv–v). |
| `pd-logarithmic-coordinate` | Cited the actual unit calculation in Lemma 12.2(iii), transported to bounded subrings by 12.8(i). |
| `fargues-full-faithfulness` | Corrected the source locator from a purported proof of Theorem 4.28 to Remark 4.29, and supplied the omitted intersection prerequisite. |
| `bkf-etale-realization` | Made the integral Frobenius descent supplier refinement explicit and restored the mu-inverted lattice equality of Lemma 4.26. |
| `mu-inverted-etale` | Removed the unjustified identification with actual etale cohomology for nonproper X: Theorem 14.1(iv) gives Rnu_* A_inf,X, and Theorem 5.7 is a separate proper input. |
| `global-etale` | Distinguished the requested primitive comparison/etale finiteness from the existing local rational period-sheaf supplier. |
| `rational-crystalline-frobenius` | Replaced the unsupported claim that the existing Noetherian-base Frobenius isogeny supplies Proposition 13.21 by the precise residue-section bridge, an owner request and a gap. |
| `ideal-decalage-complex` | Corrected the overlap test to use u^(-i) in every integer degree; the old comment incorrectly said the factor was u^-1 at degree -1. |
| `decalage-cohomology` | Restored the missing promised theorem name for the affine normalized cohomology quotient, explicitly omitting only ringed-topos descent and line factors. |
| `bockstein-reduction` | Restored the promised affine derived-reduction/Bockstein theorem name with ring and term regularity; the two-term flat quotient resolution suffices, without K-flatness of C. |
| `bkf-module` | Added the explicit Frobenius factor API/test and restored the unit test of etale realization and de Rham lattice instead of testing only underlying freeness. |
| `lattice-pair` | Corrected the shifted-lattice Lean test, whose xi argument was previously unused; it now fixes the actual xi^-1 lattice and rejects the standard lattice. |
| `fargues-essential-surjectivity` | Corrected the SW-only locator (12.4.6 is a Proposition; 4.28 belongs to BMS), fixed the leg to phi^-1(x_C), expanded the exact analytic supplier request, and strengthened reconstruct_pair to preserve the lattice in both directions. |
| `finite-witt-specialization` | Separated the early finite coefficient comparison from the later de Rham–Witt cohomology theorem, which consumes it; the previous proof silently used its own downstream consumer. |
| `relative-witt-comparison` | Displayed the exact negative Breuil–Kisin twist of Theorem 11.1 instead of leaving the normalization implicit; retained the early finite reduction as a prerequisite. |
| `torsion-and-lattice-export` | Replaced the unnecessary full Fargues equivalence by early full faithfulness. Proper lattice recovery from an existing finite free cohomological BKF module does not require analytic essential surjectivity. |

In particular, full faithfulness is the early BMS Remark 4.29 argument, while essential surjectivity requests SW Propositions 12.3.4, 12.3.5, 12.4.6 and the precise analytic extension/annulus inputs. The leg is φ⁻¹(x_C). Generic RF4 or VB2 names do not silently supply that package. AI.5 needs early full faithfulness of an already constructed finite-free module, not the analytic inverse equivalence.

The primitive proper comparison and étale finiteness remain an explicit P8 early-child request. The current local rational-period supplier does not prove them. The integral W(C^flat)/Z_p Frobenius descent is a separate VB owner refinement, not a consequence of rational isocrystal classification. The section-dependent non-Noetherian A_crys bridge is an explicit CR.3 request; the existing Noetherian-base Frobenius isogeny does not supply BMS Proposition 13.21. Its free rational crystalline module and chosen residue-field section are stated precisely.

## Pinned baseline audit

Every original entry was opened and its statement read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66175`. All 29 final entries carry independent audit notes. The only incorrect module citation was `PreTilt`: it is in `Mathlib/RingTheory/Perfection.lean`, not the nonexistent `Mathlib/RingTheory/Perfectoid/Tilt.lean`. Added `WittVector.fontaineTheta_teichmuller` and the **root-namespace** `surjective_fontaineTheta` with its extra surjectivity-of-Frobenius hypothesis. No declaration was removed.

| Declaration | Pinned module |
| --- | --- |
| `ModuleCat` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean` |
| `ModuleCat.of` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean` |
| `ModuleCat.ofHom` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean` |
| `ModuleCat.Hom.hom` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean` |
| `CochainComplex` | `Mathlib/Algebra/Homology/HomologicalComplex.lean` |
| `CochainComplex.of` | `Mathlib/Algebra/Homology/HomologicalComplex.lean` |
| `CochainComplex.ofHom` | `Mathlib/Algebra/Homology/HomologicalComplex.lean` |
| `HomologicalComplex.d_comp_d` | `Mathlib/Algebra/Homology/HomologicalComplex.lean` |
| `DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` |
| `DerivedCategory.Q` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` |
| `Finsupp` | `Mathlib/Data/Finsupp/Defs.lean` |
| `PowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean` |
| `PowerSeries.coeff` | `Mathlib/RingTheory/PowerSeries/Basic.lean` |
| `WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` |
| `WittVector.teichmuller` | `Mathlib/RingTheory/WittVector/Teichmuller.lean` |
| `WittVector.frobeniusEquiv` | `Mathlib/RingTheory/WittVector/Frobenius.lean` |
| `WittVector.map` | `Mathlib/RingTheory/WittVector/Basic.lean` |
| `WittVector.isAdicCompleteIdealSpanP` | `Mathlib/RingTheory/WittVector/Complete.lean` |
| `TruncatedWittVector` | `Mathlib/RingTheory/WittVector/Truncated.lean` |
| `PreTilt` | `Mathlib/RingTheory/Perfection.lean` |
| `WittVector.fontaineTheta` | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` |
| `BDeRhamPlus` | `Mathlib/RingTheory/Perfectoid/BDeRham.lean` |
| `BDeRham` | `Mathlib/RingTheory/Perfectoid/BDeRham.lean` |
| `continuousCohomology` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` |
| `LocalizedModule` | `Mathlib/Algebra/Module/LocalizedModule/Basic.lean` |
| `HomologicalComplex.homology` | `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean` |
| `KaehlerDifferential` | `Mathlib/RingTheory/Kaehler/Basic.lean` |
| `WittVector.fontaineTheta_teichmuller` | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` |
| `surjective_fontaineTheta` | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` |

`ModuleCat`, complexes, ordinary derived categories, Witt/perfection/θ, localization and existing B_dR carriers are reused. Their existence does not establish perfectoid principal kernels, rational topologies/DVR structure, strongly K-flat enhanced sheaf operations, full cotangent complexes or derived completion. `KaehlerDifferential` is the ordinary carrier. `continuousCohomology` is indexed by ℕ in `TopModuleCat`; its bridge to the completed ℤ-indexed ordinary complexes remains explicit. The θ map requires prime p, p-adic completeness and p nonunit; its surjectivity also needs surjective Frobenius modulo p.

The suggested file imports only Mathlib modules and was checked with the shared pinned Mathlib build. The shared Tau Ceti checkout is not at `f790475`, so no compilation against that Tau Ceti pin is claimed. No Tau Ceti declaration occurs among this packet’s baseline entries.

## Closure, ownership, granularity and planets

The corrected internal dependency graph is acyclic under the packet checker. The finite-Witt specialization no longer invokes its downstream relative-Witt consumer. Cross-roadmap statements were compared with the exact requested scope; the three substantive missing bridges above are now gaps instead of assertions of supplier coverage. CP.0 and the generic CP.5 algebra are ownership aliases under RS-01; CP.5 retains its geometric comparison applications. AI.2 classification stays separate from AI.5 proper-cohomology/torsion algebra.

At the assigned target level, the 131-node pass is below the node budget. No unnecessary lemma-level expansion was added. There are 31 planets, with at most six per stage, naming central objects, constructions and named theorems. Each of the 28 definitions/constructions has at least three concrete tests. The strengthened negative controls use V(1) versus p in characteristic zero, the actual tilde-ξ⁻¹ Frobenius coefficient, the actual ξ⁻¹ lattice, and all-integer-degree line transitions. Compiler success alone does not prove these mathematical assertions.

## Blocking file-agreement findings

### Missing signatures

All 118 API names and 85 test names appear in the suggested file. The node-name audit nevertheless finds the following 75 promised declaration signatures absent, including central named theorems such as full faithfulness and global comparisons. Two straightforward affine signatures (`decalage_cohomology`, `bockstein_reduction`) were restored. The table is the exact remaining worklist, not a claim that the underlying theorems are false.

| Node ID | Missing declaration |
| --- | --- |
| `AInfCohomology:AI.1/decalage-filtered-colimits` | `TauCeti.AInfPlan.decalage_filtered_colimits` |
| `AInfCohomology:AI.1/decalage-truncations` | `TauCeti.AInfPlan.decalage_truncations` |
| `AInfCohomology:AI.1/preservation-derived-completeness` | `TauCeti.AInfPlan.preservation_derived_completeness` |
| `AInfCohomology:AI.1/completion-at-decalage-ideal` | `TauCeti.AInfPlan.completion_at_decalage_ideal` |
| `AInfCohomology:AI.1/completion-limit-model` | `TauCeti.AInfPlan.completion_limit_model` |
| `AInfCohomology:AI.1/restricted-sequence-completion` | `TauCeti.AInfPlan.restricted_sequence_completion` |
| `AInfCohomology:AI.1/unrelated-completion-counterexample` | `TauCeti.AInfPlan.unrelated_completion_counterexample` |
| `AInfCohomology:AI.0/witt-limit-and-mu-kernel` | `TauCeti.AInfPlan.witt_limit_and_mu_kernel` |
| `AInfCohomology:AI.0/period-regularity` | `TauCeti.AInfPlan.period_regularity` |
| `AInfCohomology:AI.0/witt-base-change` | `TauCeti.AInfPlan.witt_base_change` |
| `AInfCohomology:AI.0/witt-finite-presentation-devissage` | `TauCeti.AInfPlan.witt_finite_presentation_devissage` |
| `AInfCohomology:AI.0/no-almost-zero-witt-sections` | `TauCeti.AInfPlan.no_almost_zero_witt_sections` |
| `AInfCohomology:AI.0/witt-polynomial-calculation` | `TauCeti.AInfPlan.witt_polynomial_calculation` |
| `AInfCohomology:AI.0/witt-almost-ideal` | `TauCeti.AInfPlan.witt_almost_ideal` |
| `AInfCohomology:AI.0/witt-etale-base-change` | `TauCeti.AInfPlan.witt_etale_base_change` |
| `AInfCohomology:AI.0:integral/completed-cotangent-twist` | `TauCeti.AInfPlan.completed_cotangent_twist` |
| `AInfCohomology:AI.0:integral/integral-crystalline-ring-interface` | `TauCeti.AInfPlan.integral_crystalline_ring_interface` |
| `AInfCohomology:AI.1/strongly-k-flat-replacements` | `TauCeti.AInfPlan.strongly_k_flat_replacements` |
| `AInfCohomology:AI.1/valuation-monoidality` | `TauCeti.AInfPlan.valuation_monoidality` |
| `AInfCohomology:AI.1/truncation-comparison-maps` | `TauCeti.AInfPlan.truncation_comparison_maps` |
| `AInfCohomology:AI.1/connective-comparison` | `TauCeti.AInfPlan.connective_comparison` |
| `AInfCohomology:AI.1/decalage-composition` | `TauCeti.AInfPlan.decalage_composition` |
| `AInfCohomology:AI.1/bockstein-map-injectivity` | `TauCeti.AInfPlan.bockstein_map_injectivity` |
| `AInfCohomology:AI.1/bockstein-map-surjectivity` | `TauCeti.AInfPlan.bockstein_map_surjectivity` |
| `AInfCohomology:AI.1/flat-and-nonflat-base-change` | `TauCeti.AInfPlan.flat_and_nonflat_base_change` |
| `AInfCohomology:AI.1/completed-sum-cohomology` | `TauCeti.AInfPlan.completed_sum_cohomology` |
| `AInfCohomology:AI.1/koszul-products-and-cohomology` | `TauCeti.AInfPlan.koszul_products_and_cohomology` |
| `AInfCohomology:AI.1/continuous-cochains-koszul` | `TauCeti.AInfPlan.continuous_cochains_koszul` |
| `AInfCohomology:AI.1/dieudonne-consumer-contract` | `TauCeti.AInfPlan.dieudonne_consumer_contract` |
| `AInfCohomology:AI.2/valuation-special-fiber-bound` | `TauCeti.AInfPlan.valuation_special_fiber_bound` |
| `AInfCohomology:AI.2/valuation-lattice-criterion` | `TauCeti.AInfPlan.valuation_lattice_criterion` |
| `AInfCohomology:AI.2/ainf-module-perfectness` | `TauCeti.AInfPlan.ainf_module_perfectness` |
| `AInfCohomology:AI.2/ainf-bounded-torsion` | `TauCeti.AInfPlan.ainf_bounded_torsion` |
| `AInfCohomology:AI.2/ainf-tor-bounds` | `TauCeti.AInfPlan.ainf_tor_bounds` |
| `AInfCohomology:AI.2/punctured-vector-bundle-criterion` | `TauCeti.AInfPlan.punctured_vector_bundle_criterion` |
| `AInfCohomology:AI.2/bkf-valid-operations` | `TauCeti.AInfPlan.bkf_valid_operations` |
| `AInfCohomology:AI.2/fargues-full-faithfulness` | `TauCeti.AInfPlan.fargues_full_faithfulness` |
| `AInfCohomology:AI.2/bkf-galois-descent` | `TauCeti.AInfPlan.bkf_galois_descent` |
| `AInfCohomology:AI.2/minuscule-prismatic-dictionary` | `TauCeti.AInfPlan.minuscule_prismatic_dictionary` |
| `AInfCohomology:AI.3/perfectoid-period-sections` | `TauCeti.AInfPlan.perfectoid_period_sections` |
| `AInfCohomology:AI.3/toric-cohomology` | `TauCeti.AInfPlan.toric_cohomology` |
| `AInfCohomology:AI.3/witt-toric-cohomology` | `TauCeti.AInfPlan.witt_toric_cohomology` |
| `AInfCohomology:AI.3/almost-to-honest` | `TauCeti.AInfPlan.almost_to_honest` |
| `AInfCohomology:AI.3/ainf-almost-criterion` | `TauCeti.AInfPlan.ainf_almost_criterion` |
| `AInfCohomology:AI.3/toric-almost-purity-comparison` | `TauCeti.AInfPlan.toric_almost_purity_comparison` |
| `AInfCohomology:AI.3/framing-independence-and-descent` | `TauCeti.AInfPlan.framing_independence_and_descent` |
| `AInfCohomology:AI.3/aomega-frobenius` | `TauCeti.AInfPlan.aomega_frobenius` |
| `AInfCohomology:AI.3/enhanced-noncommutative-regression` | `TauCeti.AInfPlan.enhanced_noncommutative_regression` |
| `AInfCohomology:AI.4/hodge-tate-cotangent` | `TauCeti.AInfPlan.hodge_tate_cotangent` |
| `AInfCohomology:AI.4/eta-factorization-criterion` | `TauCeti.AInfPlan.eta_factorization_criterion` |
| `AInfCohomology:AI.4/hodge-tate-lifting-obstruction` | `TauCeti.AInfPlan.hodge_tate_lifting_obstruction` |
| `AInfCohomology:AI.4/local-kunneth` | `TauCeti.AInfPlan.local_kunneth` |
| `AInfCohomology:AI.4/finite-witt-specialization` | `TauCeti.AInfPlan.finite_witt_specialization` |
| `AInfCohomology:AI.4/torus-witt-realization` | `TauCeti.AInfPlan.torus_witt_realization` |
| `AInfCohomology:AI.4/bounded-pd-coefficients` | `TauCeti.AInfPlan.bounded_pd_coefficients` |
| `AInfCohomology:AI.4/pd-toric-eta-comparison` | `TauCeti.AInfPlan.pd_toric_eta_comparison` |
| `AInfCohomology:AI.4/pd-logarithmic-coordinate` | `TauCeti.AInfPlan.pd_logarithmic_coordinate` |
| `AInfCohomology:AI.4/crystalline-witt-special-fiber` | `TauCeti.AInfPlan.crystalline_witt_special_fiber` |
| `AInfCohomology:AI.4/blm-crystalline-route` | `TauCeti.AInfPlan.blm_crystalline_route` |
| `AInfCohomology:AI.5/global-de-rham` | `TauCeti.AInfPlan.global_de_rham` |
| `AInfCohomology:AI.5/global-acrys` | `TauCeti.AInfPlan.global_acrys` |
| `AInfCohomology:AI.5/global-witt` | `TauCeti.AInfPlan.global_witt` |
| `AInfCohomology:AI.5/global-etale` | `TauCeti.AInfPlan.global_etale` |
| `AInfCohomology:AI.5/rational-crystalline-frobenius` | `TauCeti.AInfPlan.rational_crystalline_frobenius` |
| `AInfCohomology:AI.5/finite-level-length-bound` | `TauCeti.AInfPlan.finite_level_length_bound` |
| `AInfCohomology:AI.5/specialization-rank-and-length` | `TauCeti.AInfPlan.specialization_rank_and_length` |
| `AInfCohomology:AI.5/derived-witt-cohomology-injection` | `TauCeti.AInfPlan.derived_witt_cohomology_injection` |
| `AInfCohomology:AI.5/de-rham-crystalline-torsion-equivalence` | `TauCeti.AInfPlan.de_rham_crystalline_torsion_equivalence` |
| `AInfCohomology:AI.5/p-local-freeness-from-periods` | `TauCeti.AInfPlan.p_local_freeness_from_periods` |
| `AInfCohomology:AI.5/cohomology-finiteness-from-periods` | `TauCeti.AInfPlan.cohomology_finiteness_from_periods` |
| `AInfCohomology:AI.5/torsion-and-lattice-export` | `TauCeti.AInfPlan.torsion_and_lattice_export` |
| `AInfCohomology:AI.0/coherent-quotient` | `TauCeti.AInfPlan.coherent_quotient` |
| `AInfCohomology:AI.0/coherent-square-zero-extension` | `TauCeti.AInfPlan.coherent_square_zero_extension` |
| `AInfCohomology:AI.0/coherence-artin-rees` | `TauCeti.AInfPlan.coherence_artin_rees` |
| `AInfCohomology:AI.0/artin-rees-bounded-isogeny` | `TauCeti.AInfPlan.artin_rees_bounded_isogeny` |

### Three API mismatches

- `fv-precomplex`: wittPre_lambda now preserves the actual unit, but does not state the packet universal relative Witt-complex map or its Teichmuller/F-V compatibility. The supplied ring structure only models the omitted H^0 multiplication.
- `fv-improved-complex`: wittImproved_universal_map only extends an arbitrary degree-zero chain map; it omits uniqueness and F,V,R/lambda compatibility. An arbitrary lambda0 need not extend to a chain map. The CR.4 relative Witt structure is missing, so this statement cannot certify the packet universal property.
- `fargues-essential-surjectivity`: reconstruct_modification states only underlying module freeness, already a field of the reconstructed finite-free object, and never mentions the analytic modification or Xi. The corrected reconstruct_pair is stronger, but this separate API and the reconstruction shift example still need an actual Frobenius/lattice check.

These omissions are more than the permitted omission of an unavailable geometric hypothesis: the promised universal property or compatibility conclusion is missing. The revision should use the owner’s actual relative Witt/analytic carriers where available, give a mathematically faithful affine signature otherwise, and state precise omissions. Do not add opaque `Prop` certificates merely to obtain names.

### Reader contradictions outside the allowed files

Refresh `research/blueprint/readmes/AInfCohomology--AI.0.md` in the revision. Useful anchors in the current reader:

- The θ/Witt family around line 202 uses p in the Verschiebung formula instead of a lift of V(1).
- The punctured vector-bundle criterion uses the wrong local chart; the proof needs the DVR A_inf,(p).
- Integral AI.3 around lines 1833–1837 still includes rational B_dR acyclicity.
- The precomplex around lines 2173–2175 omits connectivity of D/ξ.
- Bounded PD coefficients still cite Lemmas 12.2–12.4 instead of the actual Lemma 12.8 estimates.
- The local μ-inverted comparison around lines 2380–2382 identifies actual étale cohomology without the separate proper primitive comparison.
- Proper comparison around lines 2496–2502 treats the existing P8 local rational supplier as primitive integral comparison.
- Rational crystalline Frobenius around lines 2512–2518 treats the CR.3 Noetherian-base isogeny as the A_crys bridge and leaves its section/freeness imprecise.

The opening reader summaries also need updating, especially the assertion that CR.3 already supplies the rational crystalline input. The exact final packet is the source for the refresh.

## Assigned confirmed red-team findings

| Finding | Review outcome |
| --- | --- |
| RT-AREA-padic-1/19 | Full faithfulness kept early; exact analytic inverse suppliers requested. AI.5 now imports only full faithfulness. No analytic construction is duplicated. |
| RT-AREA-padic-2/1 | Corrected SW Proposition locator and leg; expanded the exact integral/analytic supplier package, retained explicit gap. |
| RT-AREA-padic-2/3 | Corrected local versus proper étale statements and requested the actual primitive proper/finite-coefficient input. Reader still needs repair. |
| RT-AREA-padic-2/9 | Corrected-site integral/tilted completed sections and almost acyclicity checked; derived p-completed A_inf sheaf retained. No everywhere-discrete global assertion. |
| RT-AREA-padic-2/10 | Removed rational B_dR acyclicity from integral AI.3; residual reader claim is blocking. |
| RT-AREA-padic-2/11 | Precise residue-section/A_crys bridge requested from CR.3 and recorded as missing; reader still incorrectly claims it is supplied. |
| RT-AREA-padic-2/15 | Generic scalar Koszul substrate remains DD.1’s responsibility; AI.1 retains source-specific products/continuous/cohomology/η applications with exact hypotheses. |
| RT-AREA-padic-2/17 | Pinned Witt/Frobenius/PreTilt/θ/B_dR carriers independently confirmed; fixed PreTilt module and added θ lemmas without assuming principal-kernel or DVR proofs. |

Findings about other roadmaps/upstream files were not edited under this issue. Their scoped consequences are captured in the owner requests and report.

## Source mistakes

All five sourceIssues received independent `confirmed` verdicts. E1 is present in the published BMS article as well as v3: an entire term quotient is incorrectly identified with torsion cohomology; the corrected boundary argument proves the theorem. E2 fixes the boundary index in BLM Lemma 7.1.18. E3 fixes the completion source in Proposition 7.2.4 (the printed version fails for M=0,N=Z_p). E4 fixes the filtration colimit direction in Remark 8.4.3. E5 fixes the decreasing-filtration quotient and graded-piece truncation in Example 8.4.7. E2–E5 concern the December 2019 author copy, without asserting that they persist in the published interior. No duplicate of the already recorded PAPER-BHATT-MORROW-SCHOLZE-18 mistakes was added.

## Validation and next action

Final validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AInfCohomology--AI.0.json`: zero errors, zero warnings.
- `python3 scripts/check_errata.py` on a scratch errata-v1 projection of this packet: passed all five reviewed findings.
- Source audit: 133/133 normalized excerpts matched; all ten downloaded PDFs match the recorded SHA-256 hashes.
- Signature audit: all 28 definition/construction names, 118 API names and 85 test labels present; 75 other promised declaration signatures absent, listed above.
- `lean-check research/blueprint/suggested/AInfCohomology--AI.0.lean`: exit 0, 286 warnings, all `declaration uses sorry`, no other warnings or errors. Available memory was 106 GB before the final run; no build/cache/update or language server was started.

Every implementationStatus remains `unchecked`; `sorry` is intentional. Elaboration checks the existing affine signatures, not the absent theorems or the missing geometric structures.

The orchestrator should schedule a revision with access to the reader document, use the 75-name table and three API findings as its concrete worklist, and then request another independent review. No acceptance or promotion is requested. Existing owner requests should be routed to their owners without duplicating their general constructions.
