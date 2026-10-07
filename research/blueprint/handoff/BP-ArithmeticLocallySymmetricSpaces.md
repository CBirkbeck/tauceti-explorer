# Handoff: BP-ArithmeticLocallySymmetricSpaces

Issue #679. Agent: Claude (session `claude-Ix7O34`), 7 October 2026.

## What was done

A complete target-level pass of the roadmap *Arithmetic locally symmetric spaces and their cohomology*, all eight stages in scope, following the accepted restructuring RS-09 (REV-RS-09~2).

- Packet `research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json`: status `complete`; 66 nodes (4 definitions, 18 constructions, 44 theorems); 129 API items; 88 unit tests; 31 planets (at most 6 per layer); 36 baseline declarations, each checked in the declaration index and its source file at Mathlib 082e2d3 / Tau Ceti f790474; 18 requests; no gaps. `python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings.
- Document `research/blueprint/readmes/ArithmeticLocallySymmetricSpaces.md`, generated from the packet plus handwritten purpose, scope and boundaries (RS-09), conventions, sources, layer introductions, dependencies, restructuring and acceptance tests; it agrees with the packet node by node.
- Suggested file `research/blueprint/suggested/ArithmeticLocallySymmetricSpaces.lean`: every definition, API item and unit test of the packet appears under its packet name, plus named theorems (component decomposition, proper discontinuity, covering at neat level, compactness of X̄_K, boundary triangle, descent for invertible index, group-cohomology comparison).

## Coverage

Every stage is `planned` (prerequisite chains end in the libraries, in nodes of other blueprints, or in requested stages). Remaining refinements, recorded in the coverage records: lemma-level splitting of Cartan-involution existence (ALS.0), of equivariant descent (ALS.1) and of the Borel–Serre corner charts read against the original paper (ALS.2); an integral Kostant–van Est formula is deliberately not planned (ALS.4, RT-AREA-automorphic-1/6); the ALS.5 sub-layer split (below).

## Confirmed red-team findings handed to this job

- **RT-AREA-automorphic-1/6** (Nomizu–van Est and Kostant): `ALS.4/nomizu-van-est` plans the Nomizu–van Est comparison H^*(Γ_N, V) ≅ H^*(𝔫, V), Levi-equivariant, explicitly characteristic 0; `ALS.4/boundary-stratum-cohomology-formula` gives the stratum formula ⊕_{w∈W^P} H^{q−ℓ(w)}(X^M, V^M_{w·λ}) and records that it is characteristic 0 only. Kostant's theorem is requested from AutomorphicFormsOnReductiveGroups:AF.1 (request entry; edge AF.1 → ALS.4, acyclic). The integral boundary statements use the integral Leray–Hochschild–Serre sequence (`ALS.4/levi-hochschild-serre`), never Kostant.
- **RT-AREA-automorphic-1/27** (missing SR prerequisites): `ALS.4/parabolic-hecke-maps` and `boundary-stratum-hecke-comparison` take SmoothRepresentationsOfLocalGroups:SR.2 (unnormalized induction, modulus character) and SR.4 (Satake) as prerequisites with request entries; the Hecke comparison uses the integral unnormalized map S = r_M ∘ r_P, S([UmU]) = |δ_P(m)|⁻¹[U_MmU_M], and records the δ_P^{1/2} (q-half) twist to SR.4's normalized transform separately. ReductiveGroupsPartII:RG2.4 supplies the Iwahori decomposition.
- **RT-AREA-combinatorics/13** (nilmanifolds owned twice): ALS.2 does not plan nilmanifolds; `ALS.2/stratum-nilmanifold-fibration` imports the carrier from AdditiveCombinatorics:AC.3 (request entry: compact nilmanifolds Γ\N with rational structure) and keeps only the Borel–Serre-specific fibration statements.

## Paper routes covered

- ACC+ (Annals 2023): §2.1 (Lemmas 2.1.4, 2.1.7, (2.1.3), (2.1.5)–(2.1.6), r_P, r_M, S, monoid Hecke algebras) in ALS.1–ALS.4 and ALS.6; §2.2.20 twisting (items 62–64) in `ALS.3/character-twist` and `twisting-isomorphism`, and the duality Proposition 2.2.21/Corollary 2.2.22 in ALS.5:finite-level-duality; §2.4 Theorem 2.4.2 in `ALS.4/siegel-stratum-localization`; Theorems 2.4.10 and 2.4.11 (items 84, 85, 87) in `ALS.5/non-eisenstein-degree-range` and `unitary-middle-degree` (with PAPER-ALLEN-ETAL-23/E21–E23 applied); Lemma 6.5.2 (item 255) in `ALS.0/neatness-iwahori-criterion`.
- Calegari–Geraghty 2018: levels Γ_0, Γ_1, Γ_p, K_Q ⊃ L_Q, Iwahori in `ALS.0/standard-level-subgroups`; Definition 5.5 in `ALS.4/eisenstein-maximal-ideal`; Lemma 5.9(3) in `ALS.4/gln-boundary-eisenstein` (variant b); Lemma 9.6 in `ALS.3/degeneracy-old-forms` (E188, E191, E229 applied).
- Calegari–Geraghty 2020 appendix: Y(K) with Iwahori level and Y_1(Q) → Y_0(Q) in ALS.0; boundary vanishing with the absolute-irreducibility hypothesis (E140) in `ALS.4/gln-boundary-eisenstein` (variant a); the lowest-degree descent with the p-group subcover (E142) in `ALS.6/lowest-degree-descent`.
- Caraiani–Newton 2023 §2.1: Proposition 2.1.3, Lemmas 2.1.4, 2.1.5 in `ALS.3/discrete-topological-comparison`. Completed cohomology at S and Lemmas 2.1.7–2.1.9 (projection formulas) belong to CompletedCohomologyPartII CC.2/CC.4 under RS-09 (ALS.6 imports nothing from CC); they are not planned here and should be handed to that blueprint.
- Scholze 2015, Corollary 5.4.2 (Clozel; item 127): `ALS.5/clozel-cohomological-gln`.

## Requests made

AlgebraicTopology stages 2, 4, 5, 6 (Tau Ceti; generic chains, cellular comparison, transfer/Cartan–Leray, cochains/orientation/duality), LieGroups layer 9 (Cartan decomposition), GeometricTopology layer 11 (smooth triangulation of manifolds with corners), SmoothRepresentationsOfLocalGroups SR.0, SR.1, SR.2, SR.4, ReductiveGroupsPartII RG2.3, RG2.4, AdditiveCombinatorics AC.3, AutomorphicFormsOnReductiveGroups AF.1 (Kostant) and AF.4, AutomorphicSpectralTheory AS.5 (Franke), AutomorphicGaloisRepresentationsPartII AG2.4 (HLTT Galois representations), EnhancedDerivedSheaves E1. Exact statements are in the packet's `requests`. Other blueprints' nodes used directly: AdelicAlgebraicGroups AA.1–AA.4, AF.1a (invariant forms, relative Lie cochains), DeformationAndDerivedPatchingAlgebra P7/perfect-object, IntegralHeckeAndGaloisDeterminants IHG.2/derived-hecke-image and derived-idempotent-splitting, ArithmeticGaloisDuality R02.2, SchemeAndStackFoundations key/equivariant-sheaf-cohomology. The stage ancestors of IHG.2, SR.*, AF.1, AC.3, AG2.4 and R02.2 contain no ALS stage beyond ALS.0 (checked on `research/blueprint/atlas/stage-edges.json`), so the new edges are acyclic, except for AF.4 below.

## Restructuring proposed

AutomorphicFormsOnReductiveGroups AF.4/clozel-rationality uses ALS.5's automorphic comparison, while ALS.5's applications (Clozel, ACC+ 2.4.10, 2.4.11) use AF.4: a stage cycle ALS.5 ⇄ AF.4. The packet proposes a sub-layer `ALS.5:automorphic-applications` for the three application nodes (no node changes). Until applied, the AF.4 request edge would close the cycle; the maintainer should apply the split or route the edge to the sub-layer.

## Mistakes found in sources (new)

- **ALS/E1** (error): Newton–Thorne, Forum Math. Sigma 4 (2016), §3.1 p. 41 and Lemma 3.2(1): neat arithmetic groups need not preserve orientation. Counterexample: PGL_{2,ℚ} at the neat level K(5)K(13), containing the class of (57, 455; 455, 3632) (det −1); X_K has a nonorientable component, and Proposition 3.7(1) needs the orientation sheaf. Harmless for the paper's applications (G(F⊗ℝ) connected).
- **ALS/E2** (misprint): the boundary triangle on p. 55 ends in RΓ_c[−1]; it should be [1].

## Suggested Lean file

Elaborated with `lean-check` in the shared build at the pins (Mathlib 082e2d37e8): no errors, `sorry` the only warning. The shared build lacks Tau Ceti's `NumberTheory/HeckeRing` and `AlgebraicTopology` oleans, so the file imports Mathlib only, writes out Tau Ceti's `LocalCoefficientSystem` abbreviation, and supplies the Hecke ring structure by a marked stand-in instance (`heckeRingStandIn`) to be deleted once `TauCeti.NumberTheory.HeckeRing.Associativity` is importable. Thirty-seven declarations are name-only placeholders whose Lean statement is `True` (the document states them in full); giving them real signatures is the first follow-up refinement: RΓ.isoSheafCohomology, RΓ_point, RΓ.pullback_eq_sheafPullback, bordification_anisotropic, stratum_closure, stratum_components, stratum_SL2_cusps, stratum_anisotropic_empty, stratum_not_disjoint_union_topologically, stratSS_empty, stratSS_rank_one_collapse, stratSS_E1_not_complex, heckeAction_H0, heckeAction_modularCurve_Tp, heckeAction_not_on_cochains, RΓ.pullback_trace, RΓ.trace_eq_coveringTransfer, trace_self, trace_eq_transfer, derivedHeckeAlgebra.limit, derivedHeckeAlgebra.maximalIdeals_finite, derivedHeckeAlgebra_GL1, derivedHeckeAlgebra_surj_cohomology, derivedHeckeAlgebra_ne_cohomologyAlgebra, twistHecke_not_identity_on_maximalIdeals, satake_compat_normalized, parabolicInduction_invariants, satake_compat_SR4, heckeLocalize_module, heckeLocalize_not_tensor, eisenstein_iff_CG_PGL2, nonEisenstein_not_vanishing, pairing_compact_case, pairing_pullback_trace, pairing_needs_orientation, cuspidal_torus, cuspidal_ne_interior. Several other tests are numerical shadows of the packet's statement rather than the statement itself (for example the dimension checks); the packet and document are definitive.

## Sources read and missing

Read (URLs and SHA-256 in the packet): ACC+ (author copy of the Annals version), Newton–Thorne (published Forum Math. Sigma version and arXiv v1), Ji–MacPherson (Numdam), Calegari–Geraghty 2018 (arXiv v2), the Calegari–Geraghty–Harris appendix (arXiv 1907.08694), Caraiani–Newton (arXiv v3), Scholze (arXiv), Milne's *Introduction to Shimura varieties*, Sella (arXiv), Harder–Raghuram (arXiv), Franke (Numdam). Missing: Borel–Serre, *Corners and arithmetic groups* (e-periodica returned a verification page), used through the statements quoted by ACC+, NT16 and Ji–MacPherson; a reviewer with access should confirm the ALS.2 locators against it. Clozel's *Motifs et formes automorphes* was not read (cited through Scholze).
