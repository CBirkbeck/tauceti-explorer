# REV-AdelicAlgebraicGroups~2 — independent review of revision round 2

**Verdict: accepted.** This is the review of issue [#6985](https://github.com/CBirkbeck/tauceti-explorer/issues/6985) by Claude, session `claude-lIANgp`, dated 2026-10-08. The input is revision round 2, BP-AdelicAlgebraicGroups~2 ([PR #7414](https://github.com/CBirkbeck/tauceti-explorer/pull/7414), Codex `codex-x2g9X8`). That round revised the plan after REV-AdelicAlgebraicGroups (Codex `codex-vV40Ys`) returned needs_changes. This session did none of BP-AdelicAlgebraicGroups (Claude `claude-NwZ48p`) or BP-AdelicAlgebraicGroups~2. The packet, suggested file and reader document were corrected in place, and every change is recorded below and in the packet's `review.checked`. No mathematics is claimed formalised; every node keeps `implementationStatus: unchecked`.

## Summary

Round 2 fixed what round 1 asked for. The three reduction-theory cycles are gone: the proof order now follows Borel 1963 §§2–5 and Borel–Harish-Chandra §§1, 3, 5. The other repairs also hold: right-Haar quotient integration through Riesz–Markov–Kakutani; the convergent Tamagawa product; basis-sensitive restriction-of-scalars Jacobians; proper algebraic heights; fixed-K real Siegel theory with the BKT erratum; and algebraic neatness with a stable lattice. So do level-map stabilizers, deck groups and Hecke maps; integral lifts for abelianization; and the GL₁, GL₂ and quaternion conventions. All 262 input nodes were reviewed again, with these results:

- **Boilerplate.** Of the 58 nodes added in round 2, 54 had the vacuous acceptance check "The conclusion uses the stated canonical maps and the stated hypotheses" as their only acceptance item. 55 had the vacuous hypothesis "All objects, actions and measures have the hypotheses in the statement" as their only hypothesis, and three more nodes carried it beside real ones. Each now has its real hypotheses and a hand-checked concrete case or counterexample.
- **Eight medium-severity corrections.** These include the strong-approximation proof, rerouted as RT-AREA-automorphic-1/7 prescribes, and a false step in the real Siegel covering. Mixed left/right conventions in the closed-orbit estimates and Orr's omitted reduction to a ℚ-split torus were also fixed.
- **Many low-severity corrections.** Wrong source locators, missing prerequisites, tests that could not tell a right definition from a wrong one, and Lean signatures that did not express their nodes.
- **Lean.** The suggested file had never been compiled against Tau Ceti. With the pinned Tau Ceti sources inlined it had 8 errors, now fixed, and it now elaborates with `sorry` as its only warning.

After these corrections every node is verified, corrected or added, every baseline citation is confirmed at the pins, and no contradiction remains. The open inputs are honestly recorded as gaps and supplier requests. The packet is therefore accepted as a complete planning pass, with all six stages planned.

## Method and counts

Five reviewers each took a share of the stages, and the lead reviewer checked each finding at its evidence before applying it: AA.0–AA.1; AA.2; the adelic half of AA.3; the real-Siegel half of AA.3 with AA.5; and AA.4. A sixth, adversarial pass then tried to break the substantive rewrites.

For every node, the reviewers:
- read the statement, hypotheses, proof steps and prerequisites, and tested the statement on small cases;
- checked every source citation at its locator in the hashed text;
- read every cited declaration at the pins;
- checked the API, uses, tests and planets;
- matched the node against its Lean signature or §13 catalogue entry.

All 19 public sources were downloaded, and their SHA-256 hashes match the packet. The Borel–Harish-Chandra scan has no text layer, so it was read from page images (journal p. = PDF p. + 483). The edits were applied by scripts from the input packet, so the packet, the reader and the Lean catalogue are rebuilt together.

| Stage | Nodes | Verified | Corrected | Added | Unverifiable | Planets | Coverage |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| AA.0 | 25 | 15 | 10 | 0 | 0 | 1 | planned |
| AA.1 | 32 | 22 | 10 | 0 | 0 | 3 | planned |
| AA.2 | 49 | 22 | 27 | 0 | 0 | 6 | planned |
| AA.3 | 74 | 23 | 51 | 0 | 0 | 6 | planned |
| AA.4 | 69 | 28 | 39 | 2 | 0 | 5 | planned |
| AA.5 | 15 | 9 | 6 | 0 | 0 | 4 | planned |

The final packet has:
- 264 nodes (input 262): 119 verified, 143 corrected and 2 added by this review, 0 unverifiable;
- 231 API items, 148 unit tests and 25 planets;
- 116 baseline declarations (input 110);
- 20 supplier requests, 18 gaps and 12 source issues.

137 nodes changed; the ledger at the end lists every changed node and field. The packet's `review.checked` gives every node's verdict with its evidence. Validation:
- `TAUCETI_BASELINE=… python3 scripts/check_blueprint.py research/blueprint/packets/AdelicAlgebraicGroups.json` reports 0 errors and 0 warnings.
- `lean-check` was run on the suggested file with the pinned Tau Ceti closure inlined (103 modules); see the Lean section.

## The corrections REV-AdelicAlgebraicGroups asked for

Each item was checked in the revised packet. "Done" means the node, its prerequisites and its Lean entry now say the right thing; remaining analytic inputs are recorded gaps.

| Round-1 request | Status in round 2 (after this review) |
| --- | --- |
| Compact neighbourhoods at exceptional indices; exceptional indices in the modular product | Done (restricted-haar-is-haar, restricted-unimodular). |
| Tamagawa products: good-place volumes need not tend to 1 | Done: summable-log-product, convergent-haar-product, convergent-product-independence. This review fixed one test that could not see a missing C_S, and added the independence signature. |
| Right Haar for fibre averaging on H\G; no normal-extension shortcut | Done: closed-homogeneous-space through quotient-tonelli, via Riesz–Markov–Kakutani. This review added the Haar-uniqueness input to quotient-measure and the unimodularity hypothesis to discrete-quotient-fundamental-domain. |
| Pushforward under right translation scales by \|det Ad(g)\| | Done (local-form-measure, modular-function-parabolic). This review recorded the opposite sign in Arthur p. 25 as source issue E12. |
| Central characters: continuous, measurable section, completeness, extension and twist | Done: central-associated-line through central-character-extension-twist, with the analytic inputs in a gap. This review removed the quotient-topology item from that gap, since pinned Mathlib proves it. |
| Artin factors omitted only for zero geometric character lattice; Rosengarten is function-field only | Done (convergence-factors, tamagawa-measure); E10 confirmed. |
| Basis and determinant-line conventions for restriction of scalars | Done (restriction-finite-, -infinite-, -global-jacobian). Checked on ℚ(√5), with j_∞ = 5^{-1/2}, and on ℚ(i) with β = (1, 2i), where j_2 j_∞ = 1/2 = \|d_E\|^{-1/2}. |
| Reduction-theory cycles | Gone. The independent chain is: GL_n class number one, real GL_n reduction and overlap, simultaneous self-adjointness, closed-orbit realization, weight bound and lattice finiteness, bounded denominators, GL_n adelic covering, self-adjoint reduction, then class-number finiteness. |
| Iwasawa Jacobian and quasi-invariant P\G integration | Done. This review corrected the invariance direction (right translation) and added unimodularity. |
| Proper algebraic heights with duals; counting needs geometry of numbers | Done. The counting input is a gap; three source locators were corrected to Arthur §13, p. 70. |
| Relative chamber is a kernel; P = G is improper | Done. |
| Fixed K in every real Siegel comparison; rational-preimage correction (E9) | Done. This review replaced a false step in real-siegel-finite-cover and added Orr's §4.1 reduction to the containment nodes. |
| Rapinchuk 2.7 over ℚ_p only; native-field and several-place cases | Done. The sufficiency proof is now one place at a time with Kneser–Tits, plus weak approximation at the anisotropic places (see below). |
| Neat levels via a stable lattice and the normal core | Done. This review added the rational choice of lattice. |
| Finite stabilizers under compact-modulo-A_G; no full deck group claim; full versus effective masses | Done. Verified on G_m/ℚ at levels 3 and 15 (deck group S₄ against level group C₄) and on SL₂ at i (orders 4 and 2). |
| Hecke translation at finite places; U′L = U for Cartesian squares | Done. |
| Integral lifts for abelianization; residual compactness argued separately | Done (abelianization-integral-lifts, cover-integral-image, idele-class-square-compact). |
| GL₁, GL₂ and quaternion conventions | Done: dimension r₁+r₂−1, raw versus folded action, (ℤ/N)^× versus (ℤ/N)^×/{±1}, Eichler index 4. |
| A faithful suggested file using the pinned Tau Ceti points | Done in round 2 as native signatures plus an honest §13 catalogue. Round 2 did not compile it against Tau Ceti; this review did and fixed it. |
| Reader document synchronized | Done; regenerated from the corrected packet. |

## Corrections made by this review

### Medium severity (eight findings, seven items)

1. **AA.4/strong-approximation-sufficiency.**
   - **Problem:** RT-AREA-automorphic-1/7 asks for a proof from the Kneser–Tits input plus weak approximation. Round 2 instead went through a several-place Lie-algebra closure and an anisotropic finite-index elimination, which carried two avoidable gaps.
   - **New route:** let H be the closure of G(F)G_S, a closed subgroup because G_S is a direct factor. For each finite v ∉ S at which G is isotropic, H contains G(F_v) (added `isotropic-place-closure`). Almost every place is isotropic (added `isotropic-almost-everywhere`), so H contains G_S times the restricted product over those places. Weak approximation at the finitely many anisotropic places then gives H = G(𝔸_F).
   - **Inputs:** the per-place lemma is Rapinchuk's single-prime argument from §2.6, pp. 16–17, applied at one native place. Its native-field openness input stays in arithmetic-native-lie-closure and its recorded gap.
   - **Second pass:** simple connectedness is used twice, once through Kneser–Tits and once through weak approximation, and the proof text now says so. Weak approximation for simply connected groups (Kneser, Harder–Chernousov; recorded gap) does not depend on strong approximation.
   - **Nodes left off the path:** strong-approximation-finite-places, arithmetic-finite-product-openness and arithmetic-finite-index-elimination are true but no longer on the sufficiency path. They are kept, and the first two are corrected: arithmetic-finite-product-openness now works one rational prime at a time, with the pro-p splitting across distinct primes.
2. **AA.3/real-siegel-finite-cover.** The proof moved Siegel sets for different maximal compacts to one K by "enlarging U_i, W_i". The BKT erratum §1.6.1 shows this is impossible. The proof now takes a covering for one common K′ = gKg⁻¹ and right-translates it by the single element g.
3. **AA.3/orr-schnell-containment and containment-parabolic-torus.**
   - Orr's construction (§4.2 onwards) needs the subgroup torus S_H to be ℚ-split, so that Z_G(S_H) is a ℚ-group. The packet omitted his §4.1 reduction: conjugate by u ∈ R_u(P_H)(ℝ), then translate back on the right.
   - The step is added, the hypothesis is stated, the torus node's source text (which said the opposite) is corrected, and "§4.4" is corrected to Lemma 4.4.
4. **AA.3/rational-siegel-pullback.** BGST Proposition 28.1 is applied to reductive, possibly disconnected groups, but the covering and overlap nodes are stated for connected semisimple G. That extension is now a recorded gap, and two unlisted prerequisites are added.
5. **AA.3/closed-orbit-weight-bound.** The node copied Borel–Harish-Chandra's right-action form, while the packet's Siegel domains are in left-quotient form. Read with the packet's Σ, the claim is false: every integral form (m²+1, m; m, 1) lies in w·Σ. It is restated in the packet's convention, and closed-orbit-lattice-finite and self-adjoint-reduction are aligned with it.
6. **AA.3/reduced-form-scalar-invariance.** The cited "BKT §3, Definition 3.3 and Proposition 3.4" do not exist. The right place is Definition 4.11, §4.5, pp. 17–18.
7. **AA.2/quotient-measure.** The uniqueness clause had lost its Haar-uniqueness input, and it needs surjectivity of fibre averaging (bruhat-section). Both are now prerequisites, and the Lean test `borel_no_invariant` gained the instances it needs.

### Low severity, by kind

- **Hypotheses and statements:**
  - horospherical decomposition: M_P must be intersected with G;
  - deep-distinct-parabolics: P₁ and P₂ may need exchanging (SL₃);
  - gram-offdiagonal-transfer: the quantifier "for all a, b";
  - containment-finite-root-cones: t′ ≤ 1;
  - finite-volume-criterion: the measure must be nonzero;
  - level-map-fibre-mass: the compact-modulo-A_G hypothesis;
  - homogeneous-measure-pushforward: second countability;
  - discrete-quotient-fundamental-domain: unimodularity;
  - quotient-measure-transitivity: explicit modular conditions;
  - neat-element: one embedding τ is weaker than restriction of scalars, since √2 ∈ G_m(ℚ(√2)) is neat;
  - parabolic-double-cosets-finite: reductive G, with adelic Iwasawa replacing compactness of (G/P)(𝔸);
  - iwasawa-integration-compact: right invariance plus unimodularity;
  - parabolic-haar-jacobian: Mathlib's pushforward convention;
  - modular-character-trivial-compact-centre: no continuity of Δ is needed;
  - compactness-isotropic: repaired Mahler step;
  - s-arithmetic-lattice: class-number finiteness for the converse.
- **Missing prerequisites:** hopf-spreading's morphism clause (adelic-map), real-siegel-translation, siegel-convention-comparison, cartan-subgroup-criterion, simultaneous-self-adjointness, unimodular-reductive, the Dedekind zeta Euler product (Tau Ceti), restricted-unimodular, and RG2.0/RG2.1 for compact-open-product and weyl-orbit-product-central.
- **Source locators:**
  - nodes citing Arthur §1, pp. 7–8 (the Selberg kernel) for facts it does not contain now cite Milne §3 / Proposition 3.5, p. 34, and Lemma 5.21, p. 61;
  - Arthur §2, p. 15 → §13, p. 70 (heights);
  - Borel 1963 Theorem 7.3: p. 26 → p. 25;
  - Borel §2.2: pp. 11–12;
  - Milne Example 3.4: p. 34;
  - Arthur's Iwasawa factorization: pp. 23–24;
  - Rosengarten §3: p. 20;
  - Rapinchuk on weak approximation → Harpaz–Wittenberg §1, p. 6.

  Several `match` texts claimed more than the source states; they now say what the page has.
- **Tests that could not discriminate**, replaced or strengthened:
  - measurableSet_not_box_infinite;
  - levelMeasure_needs_normalization;
  - adeleHaar_not_selfdual, replaced by the covolume |d_K|^{1/2};
  - IntegralModel.trivial, replaced by a rescaled-generator G_a test;
  - isNeatLevel_U3, now over all conjugates;
  - the arithmetic-subgroup trivial-group test;
  - hecke-correspondence non-example, which is false when K∞ ⊇ ℝ_{>0};
  - strong-approximation SL₂ test, which needs class number one;
  - adelic Siegel set when P₀ = G;
  - siegel-finiteness and real-siegel-finite-overlap element lists (ten elements for SL₂(ℤ)).
- **Uses:** the ShimuraData:D5 entries of neat-element and neat-level now say that D5 *should* import neatness. Its packet still plans its own neatness nodes; see the questions below.
- **Planets:** the AA.5 names "GL1 check: …" and "GL2 check: …" named checks. They are now "Idele class group as GL₁ quotient", "GL₁ level quotients as tori" and "Upper half-plane as GL₂ component" (PROTOCOL §14).

### Second pass

An adversarial pass tried to break the eight medium-severity corrections, the new gap and E12. None broke. It found five further slips, all fixed:
- the strong-approximation proof said Kneser–Tits is the only use of simple connectedness;
- in `isotropic-place-closure`, W must be a compact open *subgroup*;
- the Hensel step of `isotropic-almost-everywhere` needs smoothness of the scheme of Borel subgroups, now part of the RG2.3 request;
- `closed-orbit-lattice-finite` still had right-action notation in its first sentence;
- a proof step of `self-adjoint-reduction` also used right-action notation.

It also confirmed E12 under Arthur's own definitions of H_P and ρ_P.

## Nodes, gaps and requests added or changed

**Added nodes** (`addedBy: REV-AdelicAlgebraicGroups~2`):
- `AA.4/isotropic-place-closure`: for G simply connected and absolutely almost simple, with G_S noncompact and v ∉ S isotropic, the S∪{v}-arithmetic group is dense in G(F_v). Hence the closure of G(F)G_S contains G(F_v). Source: Rapinchuk §2.6, pp. 16–17, and Remark 1, p. 12.
- `AA.4/isotropic-almost-everywhere`: a connected semisimple group is quasi-split, hence isotropic, at almost all places. Source: Arthur §16, p. 89.

**Added gap:** "Real reduction theory for reductive and disconnected groups". It is needed by rational-siegel-pullback and orbit-map-siegel-preimage: Borel 1969, 13.1 and 15.4–15.5, extended from connected semisimple groups.

**Changed gaps:**
- "Central measurable sections and character extension" no longer lists the topological identification X/(X∩Γ) ≅ XΓ/Γ, which pinned Mathlib proves (`MonoidHom.isOpenMap_of_sigmaCompact`).
- "Cartan's closed-subgroup theorem" now also lists arithmetic-native-lie-closure and arithmetic-finite-product-openness among its consumers.

**Requests:**
- **Removed:** the request to AutomorphicFormsOnReductiveGroups:AF.1. No node consumes it, and AF.1 lies downstream of AA (AA → AF.0 → AF.1), so it would close a stage cycle. The archimedean height comparison is planned here in AA.3/local-height-polynomial.
- **Extended request texts:**
  - RG2.0: neighbourhood bases of compact open subgroups in G(F_v).
  - RG2.1: the relative Weyl group's fixed space; the parabolic G_Ψ of a non-maximal split torus (Borel–Tits 4.15); simple transitivity on minimal parabolics (5.9); rational Weyl representatives (5.3).
  - RG2.3: quasi-split good models with a smooth scheme of Borel subgroups.
- **neededBy:** every request's list is now exactly the set of nodes that cite the supplier stage. Ten lists were out of step.

**Coverage:** all six stages stay `planned`. Every target in the atlas stage descriptions is realised; each prerequisite chain ends in the libraries, a supplier request or a recorded gap. The AA.2 remaining list no longer names the quotient topology, which is now pinned Mathlib, or the closedness of XG(F), which is central-product-closed. Packet status `complete` is right: one finished pass under the node budget.

**Cycles:** none. The node-level graph over all packets is acyclic. No supplier stage of AA is reachable from AA in the atlas stage graph plus the packet links, now that the AF.1 request is removed. The proposed AA.4 sub-layers assign all 67 original AA.4 nodes once, in the acyclic order approximation, neat-levels, level-maps, residual. The two added AA.4 nodes belong to the approximation sub-layer.

## Baseline citations

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read in the source trees at those commits.

**Declarations added in round 2.** All 16 exist and provide what their citing nodes need:
- `RealRMK.integral_rieszMeasure` and `Measure.ext_of_integral_eq_on_compactlySupported`. The latter needs regular measures; Haar measures on the second countable groups in question are regular.
- `NumberField.Units.instZLattice_unitLattice`, the full-rank lattice condition.
- `TauCeti.geometricallyReducedCommHopfAlgProperty` and `TauCeti.geometricallyConnectedCommHopfAlgProperty`.
- `Ideal.Cotangent`, `Bialgebra.counitAlgHom`, `exteriorPower.ιMulti`, `exteriorPower.map`, `Module.evalEquiv` and `TensorProduct.lid`.
- `Set.integer`, the S-integers.
- `TauCeti.GeneralLinear.determinantGroupLike`, `determinantCoordinateMap` and `pointsMulEquiv_determinantPoints`.
- `Derivation.adjointAction`, which assumes the cotangent module is finite projective, as its `provides` text says.

The 93 declarations confirmed by round 1 were not re-audited one by one. Each reviewer read the ones its nodes cite.

**Citations removed from nodes.** No declaration was found missing. Some citations could not give the step that cited them:

- `AA.4/open-finite-covolume-finite-index`: `mathlib:MeasureTheory.Subgroup.index_mul_measure`
- `AA.4/finite-support-product-index`: `mathlib:MeasureTheory.Subgroup.index_mul_measure`

`MeasureTheory.Subgroup.index_mul_measure` assumes finite index from the start, so it cannot prove finite index (open-finite-covolume-finite-index). It plays no role in an index computation (finite-support-product-index), where `Subgroup.index_prod` is the right lemma.

**Declarations added by this review**, each read at the pin:

- `tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean`): For Re s > 1, the Dedekind zeta function of a number field is the convergent product over the height-one primes of (1 − N(𝔭)^{−s})^{−1}.
- `mathlib:Subgroup.index_prod` (`Mathlib/GroupTheory/Index.lean`): The index of a product subgroup H × K in G × G′ is the product of the indices of H and K.
- `tauceti:TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue` (`TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/Basic.lean`): The identification of G_m-points with units is natural in the value algebra: along an algebra map φ it intertwines mapValue φ with Units.map φ.
- `mathlib:MeasureTheory.Measure.map_right_mul_eq_modularCharacterFun_smul` (`Mathlib/MeasureTheory/Group/ModularCharacter.lean`): For an inner regular Haar measure μ on a locally compact group, the pushforward of μ under right multiplication by g is modularCharacterFun g • μ.
- `mathlib:isOpenMap_quotient_mk'_mul` (`Mathlib/Topology/Algebra/ConstMulAction.lean`): For a group acting by continuous maps (ContinuousConstSMul), the quotient map onto the orbit space is open.
- `mathlib:MonoidHom.isOpenMap_of_sigmaCompact` (`Mathlib/Topology/Algebra/Group/OpenMapping.lean`): A continuous surjective homomorphism from a σ-compact topological group onto a Hausdorff Baire topological group (for instance a locally compact one) is an open map.

The Mathlib instance `t2Space_of_properlyDiscontinuousSMul_of_t2Space` (`Mathlib/Topology/Algebra/ConstMulAction.lean`) proves level-quotient-hausdorff's Hausdorffness. It is named in that node's proof text but not listed as a baseline reference, because the checker's declaration index lacks it. The indexed `ProperlyDiscontinuousSMul` and `isOpenMap_quotient_mk'_mul` are cited instead.

3 declarations stay listed in `baseline.declarations` although no node now cites them: `TopologicalGroup.IsSES.inducedMeasure`, `TopologicalGroup.IsSES.integral_inducedMeasure`, `TauCeti.GeneralLinear.coordinateHopfAlgebra`. They document what the suggested file uses and what round 1 replaced. This is harmless.

## Mistakes in the sources

Every entry of `sourceIssues` was rechecked at its locator in the hashed text. Each now carries a verdict `by: REV-AdelicAlgebraicGroups~2` with its own reason; the round-1 verdicts all agree.

| Issue | Source | Kind | Verdict |
| --- | --- | --- | --- |
| E1 | bkt-2020 | error | confirmed |
| E2 | bkt-2020 | error | confirmed |
| E3 | bkt-2020 | misprint | confirmed |
| E4 | bkt-2020 | misprint | confirmed |
| E5 | khayutin-2019 | error | confirmed |
| E6 | khayutin-2019 | error | confirmed |
| E7 | khayutin-2019 | misprint | confirmed |
| E8 | calegari-geraghty-2018 | error | confirmed |
| E9 | bkt-2020 | error | confirmed |
| E10 | rosengarten-tamagawa | misprint | confirmed |
| E11 | bhv-property-t | gap | confirmed |
| E12 | arthur-trace-intro | misprint | confirmed |

- **E1–E4 and E9 (BKT and its erratum).**
  - E1: the family diag(1, t) defeats any fixed ordering constant.
  - E2: with Siegel sets for different maximal compacts, even the finite-overlap claim of Proposition 2.7(2) fails.
  - E3: the horospherical rule is left multiplication.
  - E4: the γ in Proposition 2.7(3) is unbound.
  - E9: the erratum §1.5 replaces the Borel–Harish-Chandra citation by BGST Proposition 28.1.
- **E5–E7 (Khayutin).**
  - E5: −1 ∈ ℚ^× makes the reduced-norm map bijective onto the square classes.
  - E6: both groups map onto the infinite discrete ⊕_p ℤ/2, so neither is compact.
  - E7: the torus is anisotropic.
- **E8 (Calegari–Geraghty §8.2).** For F = ℚ(√−5), Q = ∅ and p = 3 the component group keeps Cl(F) = ℤ/2.
- **E10 (Rosengarten v3 p. 25).** Read from the page image. With the printed factor, G_m gives ζ_k(s)^{-1}, which has a zero at s = 1 rather than the pole the text needs.
- **E11 (Bekka–de la Harpe–Valette, Lemma E.1.3).** Equal weights break the local oscillation bound; a partition of unity subordinate to the cover repairs it.
- **E12 (added).** Arthur, §5, p. 25 gives left Haar measure on P(𝔸) as e^{2ρ_P(H_P(p))} times right Haar measure. The factor should be e^{−2ρ_P(H_P(p))}. On the upper triangular group of GL₂, left Haar is |a|^{-1}da* db* du (Arthur's own p. 21) and right Haar is |b|^{-1}da* db* du, so their ratio is |b/a| = e^{−2ρ(H(p))}. A search found no erratum. The packet's modular-function-parabolic already uses the right sign.

E11's `known` field records a MathOverflow discussion, not a correction in print. Under `scripts/errata.py` it will nevertheless be listed as corrected in print. This is an atlas-wide problem with the `known` field (question 3 below), so the field was not changed packet by packet.

## Red-team findings handed to this plan

| Finding | Outcome |
| --- | --- |
| RT-AREA-automorphic-1/7 (AA.4) | **Now met in full.** Round 2 kept both hypotheses and an exact Kneser–Tits request to RG2.4. It did not prove sufficiency from that input plus weak approximation, as the finding asks; this review rerouted the proof that way (see above). The reader's AA.4 introduction now describes this route. |
| RT-AREA-automorphic-1/28 (AA.4) | **Met on the AA.4 side.** AA.4 owns neat elements through faithful algebraic representations: independence of the representation, stability, torsion-freeness, and Borel's existence theorem through a rational stable lattice. ALS.0 and ShimuraVarieties:V0 import these nodes. ShimuraData:D5 does not yet: its packet still plans `D5/neat`, `D5/neat-representation-independence`, `D5/neat-level` and `D5/adelic-neat`. The packet's uses and the reader now say so. |
| RT-AREA-geomlanglands/12 (AA.0) | **Met.** AA.0 is field-generic: a countable index set, second countable locally compact groups, and open subgroups compact for all but finitely many indices. The exceptional noncompact factors are handled correctly, and the number-field cases are separate consumer nodes. |

## Suggested Lean file

**Compilation.** The round-2 handoff said the Tau Ceti-dependent part had not been compiled, because the shared build lacks those Tau Ceti object files. This review compiled the whole file with `lean-check` at Mathlib 082e2d3. Into a scratch copy it inlined the import closure of the file's Tau Ceti modules from the pinned f790474 tree: 103 modules, about 25,000 lines, each wrapped in its own section, with the Mathlib imports hoisted. Nothing was built, downloaded or committed.

The input file had **8 errors** in its own part:
- the value-algebra map is `TauCeti.AlgHom.mapValue`, not `AlgHom.mapValue` (6 places);
- `Subgroup.map` was written as a field of `MonoidHom`;
- `exists` is a keyword, so the declaration is now `IntegralModel.«exists»`.

After these fixes and the review's own additions, the suggested part elaborates with **0 errors** and no warnings other than 193 "declaration uses `sorry`". The inlined Tau Ceti part shows 9 errors inside Tau Ceti's own proofs (`GeneralLinear.Determinant`, `HopfIdeal.Quotient.Basic`, `Comodule.PointsAction`, `Tangent.Cotangent`). These are artefacts of merging 103 modules under one import set, not errors of the suggested file; their declarations remain available to it.

**Changes to the file:**
- **Signatures restored.** Native signatures were restored where the catalogue's reason for omitting them ("needs the RG2.0 adelic topology") did not apply: `QuotientMeasure.integral_eq_of_integrable`, `exists_measurableSet_unique_orbit_rep` and `inversionHomeomorph`, and the catalogue entry of `tamagawa-convergence-gln`, whose native lemmas already existed.
- **Signatures added:** `map_changeSubgroups_haarProduct`, `map_changeSubgroups_convergentHaarProduct`, `IntegralModel.exists_spread_hom`, `NumberField.normalizedLocalHaar_unique_and_scaling` (using Tau Ceti's `normalizedAbsoluteValue`) and the `sl2_tail` example.
- **Corrected:**
  - `splitFinite_mono` now uses S ⊆ S′;
  - `single_rescale` can now detect a missing C_S;
  - `ga_eq_adeles` now tests the canonical identification, not `Nonempty (≃*)`;
  - `borel_no_invariant` now has the instances it needs.
- **Replaced tests:** the four tests replaced in the packet were replaced in the file under their new names.
- **Catalogue resynchronised.** The §13 catalogue entries are generated from the packet: all 262 matched it exactly before this review. Their titles, hypotheses, contracts, API and test lines were regenerated from the corrected packet, with entries for the two added nodes. The vacuous boilerplate no longer appears in the file.

Every packet definition, API item and test name occurs in the file, either as a native declaration or example or in the catalogue with its contract and the supplier it waits for. The catalogue keeps the round-2 policy: a statement that needs the RG2.0 point topology, the RG2.1 parabolic structure or another missing supplier is stated as a contract, not as a signature with an arbitrary topology or homomorphism. That policy follows PROTOCOL §13 and is accepted here.

## Reader document

The reader's node sections and its tail sections are generated from the packet. Regenerating them from the input packet reproduces the input reader exactly, apart from two artefacts: a doubled full stop after 40 hypothesis lists, and a trailing blank line. So the corrected reader was regenerated from the corrected packet, which keeps it in agreement with the packet by construction. The tail sections are supplier contracts, remaining inputs, completion obligations, sub-layers, source corrections, baseline and source register. The source corrections now show each verdict.

The hand-written parts were edited where the corrections contradict them:
- the ownership paragraph: D5 is not yet importing neatness;
- the AA.3 introduction: Orr's ℚ-split reduction and the new reductive/disconnected gap;
- the AA.4 introduction: the one-place strong-approximation route;
- the layer inventory, now computed from the packet.

## Questions for the orchestrator

1. **ShimuraData:D5 duplicates AA.4.** The D5 packet still plans its own `D5/neat`, `D5/neat-representation-independence`, `D5/neat-level` and `D5/adelic-neat`, which AA.4 owns under RT-AREA-automorphic-1/28. That finding's fix requires D5 to narrow to the Shimura-specific effective action and import the rest. This review could not edit D5, and D5 needs its own fix or revision job.
2. **Three AA.4 lemmas are now off the strong-approximation path:** strong-approximation-finite-places, arithmetic-finite-product-openness and arithmetic-finite-index-elimination. They are true (the second is corrected here) and were kept, because removing nodes from a widely consumed packet is a larger change than this review should make. A later revision may drop them.
3. **The `known` field.** E11's `known` field describes an informal MathOverflow report. `scripts/errata.py` will file it as "corrected in print". This is the atlas-wide misuse of `known` and should be fixed centrally.
4. **Prelude artefacts.** The checker's declaration index lacks some pinned instances, such as `t2Space_of_properlyDiscontinuousSMul_of_t2Space`. Inlining Tau Ceti for `lean-check` gives about 9 merge artefacts. A shared build containing the pinned Tau Ceti algebraic-group modules would make these checks exact.

## Change ledger

Every node whose packet entry changed, with the fields that changed. The packet's `review.checked` gives the reason for each.

| Node (roadmap prefix omitted) | Fields changed | Verdict |
| --- | --- | --- |
| `AA.0/borel-structure` | tests | corrected |
| `AA.0/level-measure` | prerequisites, tests | corrected |
| `AA.0/adele-haar` | tests | corrected |
| `AA.0/idele-haar` | tests | corrected |
| `AA.1/integral-model` | tests | corrected |
| `AA.1/adelic-map` | prerequisites, proofSteps | corrected |
| `AA.1/local-unimodular-reductive` | proofSteps | corrected |
| `AA.1/compact-open-product` | prerequisites, proofSteps | corrected |
| `AA.2/log-height-rational` | sources | corrected |
| `AA.2/modular-function-parabolic` | prerequisites, proofSteps | corrected |
| `AA.2/quotient-measure` | prerequisites, proofSteps | corrected |
| `AA.2/quotient-measure-transitivity` | acceptance, hypotheses | corrected |
| `AA.2/discrete-quotient-fundamental-domain` | hypotheses, proofSteps | corrected |
| `AA.2/weil-volume-formula` | sources | corrected |
| `AA.2/convergence-factors` | prerequisites, proofSteps | corrected |
| `AA.2/tamagawa-number` | acceptance | corrected |
| `AA.2/tamagawa-restriction-scalars` | sources | corrected |
| `AA.3/minimal-parabolic-data` | sources | corrected |
| `AA.3/H-P` | tests | corrected |
| `AA.3/adelic-siegel-set` | acceptance, tests | corrected |
| `AA.3/siegel-covering-adelic` | prerequisites, proofSteps | corrected |
| `AA.3/siegel-finiteness-adelic` | acceptance | corrected |
| `AA.3/class-number-finite` | acceptance, prerequisites, proofSteps | corrected |
| `AA.3/arithmetic-subgroup-of-level` | tests | corrected |
| `AA.3/finite-volume-criterion` | statement | corrected |
| `AA.3/compactness-anisotropic` | proofSteps | corrected |
| `AA.3/compactness-isotropic` | proofSteps | corrected |
| `AA.3/s-arithmetic-lattice` | prerequisites, proofSteps | corrected |
| `AA.3/horospherical-decomposition` | statement | corrected |
| `AA.3/finitely-many-cusps` | sources | corrected |
| `AA.3/real-siegel-finite-cover` | proofSteps | corrected |
| `AA.3/real-siegel-finite-overlap` | acceptance | corrected |
| `AA.3/cusp-separation` | prerequisites | corrected |
| `AA.3/deep-distinct-parabolics` | proofSteps | corrected |
| `AA.3/siegel-convention-comparison` | sources | corrected |
| `AA.3/orr-schnell-containment` | proofSteps, sources | corrected |
| `AA.3/cartan-subgroup-criterion` | prerequisites, sources | corrected |
| `AA.3/rational-siegel-pullback` | prerequisites | corrected |
| `AA.3/incompatible-morphism-obstruction` | prerequisites | corrected |
| `AA.3/orbit-map-siegel-preimage` | prerequisites, sources | corrected |
| `AA.3/orbit-map-siegel-image` | acceptance, prerequisites | corrected |
| `AA.3/gram-offdiagonal-transfer` | statement | corrected |
| `AA.3/basis-change-reducedness` | proofSteps | corrected |
| `AA.4/weak-approximation-property` | sources | corrected |
| `AA.4/group-torsor` | acceptance | corrected |
| `AA.4/strong-approximation-property` | sources, tests | corrected |
| `AA.4/open-finite-covolume-finite-index` | prerequisites, proofSteps | corrected |
| `AA.4/strong-approximation-sufficiency` | prerequisites, proofSteps | corrected |
| `AA.4/neat-element` | hypotheses, uses | corrected |
| `AA.4/neat-level` | tests, uses | corrected |
| `AA.4/neat-level-exists` | proofSteps | corrected |
| `AA.4/finite-support-product-index` | prerequisites | corrected |
| `AA.4/level-quotient` | tests | corrected |
| `AA.4/level-map-fibre-mass` | hypotheses | corrected |
| `AA.4/level-quotient-groupoid` | acceptance, tests | corrected |
| `AA.4/hecke-correspondence` | tests | corrected |
| `AA.4/residual-quotient` | tests | corrected |
| `AA.4/reduced-norm-components` | sources | corrected |
| `AA.4/torus-image-residual` | proofSteps | corrected |
| `AA.4/residual-joint-limit` | hypotheses | corrected |
| `AA.5/gl1-adelic-quotient` | planet, prerequisites, proofSteps | corrected |
| `AA.5/gl1-XQ-components` | planet | corrected |
| `AA.5/gl2-upper-half-plane-component` | planet | corrected |
| `AA.5/definite-quaternion-compact` | sources | corrected |
| `AA.1/modular-character-trivial-compact-centre` | prerequisites, proofSteps, statement | corrected |
| `AA.1/weyl-orbit-product-central` | prerequisites | corrected |
| `AA.2/bruhat-section` | sources | corrected |
| `AA.3/gln-adelic-covering` | sources, statement | corrected |
| `AA.3/self-adjoint-reduction` | acceptance, proofSteps, statement | corrected |
| `AA.3/closed-orbit-finiteness` | acceptance, hypotheses | corrected |
| `AA.3/siegel-set-finite-measure` | sources | corrected |
| `AA.3/parabolic-double-cosets-finite` | hypotheses, prerequisites, proofSteps, sources | corrected |
| `AA.4/homogeneous-measure-pushforward` | hypotheses | corrected |
| `AA.4/chabauty-limit-kernels` | sources | corrected |
| `AA.3/division-algebra-no-unipotent` | sources | corrected |
| `AA.4/level-quotient-hausdorff` | prerequisites, proofSteps | corrected |
| `AA.4/hecke-degree-double-coset` | statement | corrected |
| `AA.0/summable-log-product` | hypotheses | corrected |
| `AA.0/convergent-haar-product` | hypotheses | corrected |
| `AA.0/convergent-product-independence` | acceptance, hypotheses | corrected |
| `AA.1/hopf-spreading` | hypotheses | corrected |
| `AA.1/restricted-product-topology` | acceptance, hypotheses | corrected |
| `AA.1/weil-restriction-naturality` | acceptance, hypotheses | corrected |
| `AA.2/closed-homogeneous-space` | acceptance, hypotheses | corrected |
| `AA.2/fibre-average-continuous` | acceptance, hypotheses | corrected |
| `AA.2/compact-quotient-cutoff` | acceptance, hypotheses | corrected |
| `AA.2/right-haar-exchange` | hypotheses | corrected |
| `AA.2/quotient-tonelli` | acceptance, hypotheses | corrected |
| `AA.2/central-associated-line` | acceptance, hypotheses, prerequisites, proofSteps, sources | corrected |
| `AA.2/central-measurable-section` | acceptance, hypotheses | corrected |
| `AA.2/central-l2-completeness` | acceptance, hypotheses | corrected |
| `AA.2/central-character-extension-twist` | acceptance, hypotheses | corrected |
| `AA.2/restriction-finite-jacobian` | acceptance, hypotheses | corrected |
| `AA.2/restriction-infinite-jacobian` | acceptance, hypotheses | corrected |
| `AA.2/restriction-global-jacobian` | acceptance, hypotheses | corrected |
| `AA.3/adelic-iwasawa-factorization` | acceptance, hypotheses, sources | corrected |
| `AA.3/parabolic-haar-jacobian` | acceptance, hypotheses, prerequisites, sources, statement | corrected |
| `AA.3/iwasawa-integration-compact` | acceptance, hypotheses, prerequisites, proofSteps, statement | corrected |
| `AA.3/gln-finite-class-number-one` | acceptance, hypotheses, sources | corrected |
| `AA.3/simultaneous-self-adjointness` | acceptance, hypotheses | corrected |
| `AA.3/closed-orbit-realization` | acceptance, hypotheses | corrected |
| `AA.3/closed-orbit-weight-bound` | acceptance, hypotheses, statement | corrected |
| `AA.3/closed-orbit-lattice-finite` | acceptance, hypotheses, proofSteps, statement | corrected |
| `AA.3/finite-part-denominator-bound` | acceptance, hypotheses | corrected |
| `AA.3/gln-real-overlap` | acceptance, hypotheses, sources | corrected |
| `AA.3/local-height-polynomial` | acceptance, hypotheses, sources | corrected |
| `AA.3/adelic-height-proper` | acceptance, hypotheses, sources | corrected |
| `AA.3/rational-coordinate-height-count` | acceptance, hypotheses, sources | corrected |
| `AA.3/positive-root-cone-integral` | acceptance, hypotheses, sources | corrected |
| `AA.3/reduced-form-scalar-invariance` | acceptance, hypotheses, sources | corrected |
| `AA.3/containment-parabolic-torus` | acceptance, hypotheses, sources, statement | corrected |
| `AA.3/containment-finite-root-cones` | acceptance, hypotheses, sources, statement | corrected |
| `AA.3/containment-weyl-representatives` | acceptance, hypotheses, sources | corrected |
| `AA.3/containment-compact-factors` | acceptance, hypotheses | corrected |
| `AA.4/projection-finite-covolume` | acceptance, hypotheses | corrected |
| `AA.4/arithmetic-native-lie-closure` | acceptance, hypotheses, statement | corrected |
| `AA.4/arithmetic-finite-product-openness` | acceptance, hypotheses, prerequisites, proofSteps, statement | corrected |
| `AA.4/arithmetic-finite-index-elimination` | acceptance, hypotheses | corrected |
| `AA.4/algebraic-tensor-eigenvalues` | acceptance, hypotheses, sources | corrected |
| `AA.4/compact-stable-padic-lattice` | acceptance, hypotheses, sources | corrected |
| `AA.4/padic-root-unity-distance` | acceptance, hypotheses, sources | corrected |
| `AA.4/congruence-matrix-eigenvalue-bound` | acceptance, hypotheses, sources | corrected |
| `AA.4/compact-kernel-split-centre` | acceptance, hypotheses | corrected |
| `AA.4/rational-stabilizer-finite` | acceptance, hypotheses | corrected |
| `AA.4/rational-action-proper` | acceptance, hypotheses | corrected |
| `AA.4/level-full-stabilizer-mass` | acceptance, hypotheses, sources | corrected |
| `AA.4/abelianization-integral-lifts` | acceptance, hypotheses, sources | corrected |
| `AA.4/abelianization-adelic-surjective` | acceptance, hypotheses, sources | corrected |
| `AA.4/cover-integral-image` | acceptance, hypotheses, sources | corrected |
| `AA.4/idele-class-square-compact` | acceptance, hypotheses, sources | corrected |
| `AA.4/quadratic-kernel-fourier` | acceptance, hypotheses, sources | corrected |
| `AA.4/diagonal-coset-limit` | acceptance, hypotheses, sources | corrected |
| `AA.4/isotropic-place-closure` | added | Arithmetic closure at one isotropic place |
| `AA.4/isotropic-almost-everywhere` | added | Almost all local factors are isotropic |
| `AA.5/gl1-logarithmic-torus` | acceptance, hypotheses | corrected |
| `AA.5/gl2-orthogonal-level-components` | acceptance, hypotheses | corrected |
| `AA.2/central-product-closed` | acceptance, hypotheses | corrected |
