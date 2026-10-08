# REV-GrossZagierAndArithmeticHeights--GZ.8~2 — independent review of revision round 2

**Verdict: accepted.** This is the review of issue [#7054](https://github.com/CBirkbeck/tauceti-explorer/issues/7054) by Claude, session `claude-oI96gE`, dated 2026-10-08 to 2026-10-09. The input is revision round 2, BP-GrossZagierAndArithmeticHeights--GZ.8~2 ([PR #7442](https://github.com/CBirkbeck/tauceti-explorer/pull/7442), Codex `codex-m2R91G`). That round revised the plan after REV-GrossZagierAndArithmeticHeights--GZ.8 (Codex `codex-mGNHO0`, [PR #6651](https://github.com/CBirkbeck/tauceti-explorer/pull/6651)) returned needs_changes. The original plan, BP-GrossZagierAndArithmeticHeights--GZ.8, was written by Claude session `claude-MJcHy7` ([PR #6642](https://github.com/CBirkbeck/tauceti-explorer/pull/6642)). This session did none of that work.

The packet, suggested file and reader document were corrected in place. Every change is recorded below and in the packet's `review.checked`. No mathematics is claimed formalised; every node keeps `implementationStatus: unchecked`.

## Summary

Round 2 made the corrections the first review asked for. It separated the L-valued probability Heegner point from the volume-scaled complex integral, extended the M-valued height to L with the trace degree [L:M], stated CST's full admissibility with the split-orientation rule, built the bounded CM root before interpolation, imported the GL₂ square root from L3h, removed the false general p = 5 valuation claim, and moved Mordell–Weil, Hermitian positivity, the abelian logarithm and the other uncertain inputs into precise requests and gaps.

All 36 nodes were reviewed again from the sources. The review found further errors, some introduced in round 2 and some inherited from the sources, and corrected them in place:

- **The YZZ↔CST dictionary.** Round 2 stated it as "point ×2L(1,η), height ×2, curve volume ×2, finite L(1,η)". Two parts were wrong:
  - the curve volume runs the other way, since CST measure the upper half-plane with dxdy/(4πy²) and YZZ with dxdy/(2πy²);
  - CST's Lemma 2.3 forces the completed L(1,η): at K = ℚ(i) it gives 1/4, not the finite value π/4.
  As written, the dictionary turned YZZ's constant 1/(4L(1,η)²) into 1/(16L(1,η)²) and shifted it by a power of π. The packet now states the three conversions in the only direction that reproduces YZZ's constant, with completed L-values (toric-integral-versus-finite-sum, general-quaternionic-gross-zagier-identity, chi-heegner-point).
- **χ versus χ⁻¹.**
  - Under GZ.0's arithmetic Artin convention, the adelic finite sum P⁰_χ(f) equals Σ f(P_a)χ([a])⁻¹ over the classical points, so the χ-Heegner acceptance test had the inverse character.
  - BDP index the CM point of [a] by a ⋆ (C/O_c) = C/a⁻¹ (BDP (1.4.7)–(1.4.8), p.1054; §5.1, p.1127). With HE.1's points C/a, the weight-two BDP formula as displayed was the formula for χ⁻¹ (bdp-weight-two-heegner-formula).
  - None of the eight tests on the χ-isotypic space and the Heegner point could detect either error, because every test character had order at most two. Order-three tests now do.
- **CST Theorem 1.6.** It normalises by #Pic(O_{c₁}), while its own proof (arXiv p.20; published p.2553) and Theorem 1.5 use #Pic_{K/F}(O_{c₁}). The packet copied the misprint, so its S = ∅ case disagreed with Theorem 1.5 by (h_F/#κ_{c₁})² over fields with h_F > #κ_{c₁} (new source finding E90).
- **The Castella–Hsieh auxiliary character.** It must have p-power conductor. The packet asked for a conductor prime to pN; with any nontrivial such conductor, ψ₀φ is never a character of Γ (bdp-square-root-comparison).
- **A remaining circularity.** For N⁻ = 1 the interpolation property of the BDP function was deferred to bdp-square-root-comparison, whose proof used that property. The normalization unit is now computed in the constructor.
- **Medium-severity corrections.** These include:
  - JSW's p-optimality condition is "image not in 𝔭T_pA_f" (the node had p);
  - the factorisation φ∘ε_f = φ that round 2 added is false for Skinner's M_f-coefficient projector when [M_f:ℚ] > 1;
  - Brooks's α(f, f_GL2) is the same ratio as JSW's α(f, f_B), not its inverse;
  - the multiplicative-prime Euler factor is evaluated at φ(𝔭), not φ(p);
  - the semistable Abel–Jacobi step needs Bloch–Kato's Example 3.10.1, not the good-reduction node;
  - JSW's claim that (gen-H) forces root number −1 is false (11a1 over ℚ(√−11) has +1; new finding E89);
  - the trace point over a totally real field is (h_F/#κ₁)·P⁰_1(f), and its ω_A must be trivial;
  - CST's special case needs ω_A unramified;
  - the order-zero step of the derivative corollaries is moot under their hypothesis, which forces root number −1;
  - the classical node lacked its CST prerequisites.
- **Supplier citations.** Several requests are now supplied by nodes of other blueprints, and the packet cites those nodes:
  - BDP Theorem 5.13 is GeneralizedHeegnerCycles GH.4/bdp-special-value-formula, not the GH.1 decomposition node, which states only BDP's simplified theorem and misprints its Euler factor;
  - the abelian p-adic logarithm and the Coleman comparison are EffectiveDiophantineMethods ED.4;
  - the Bloch–Kato comparison is PadicHodgeRegulators L1/abelian-variety-logarithm;
  - the Shimura curves are R18.1/canonical-quaternionic-curve;
  - the twist choice is RankZeroOneBSD BSD.2/bfh-nonvanishing;
  - the GZ.3 period and degree nodes and the GZ.4 order and test-vector nodes, which two GZ.8 nodes had restated.
- **Lean.** Round 2 said the full suggested file did not compile. It does: with the pinned Tau Ceti sources of its two imports inlined, it elaborated at Mathlib 082e2d3. It contained:
  - a false signature hidden by `sorry`: `coeffPairing_torsion_left` without characteristic zero, where over ZMod p every vector has finite order;
  - a lemma whose hypothesis was its own conclusion.
  Both are fixed, five discriminating tests were added, and the file now elaborates with `sorry` as its only warning.

After these corrections every node is verified or corrected, and every baseline citation is confirmed at the pins. Every remaining open point is recorded as one of seven gaps or 21 requests:

- the YZZ book proof;
- Hermitian positivity for arbitrary characters;
- the integral normalization unit and the tame-branch transport;
- the uncertified supplier contracts;
- the missing arithmetic Lean signatures;
- complete-DVR uniqueness;
- Castella's A′ extension.

The packet is therefore accepted as a complete planning pass, with both stages planned.

## Method and counts

Five reviewers each took a share of the packet, under a shared brief:
- the general GZ.8 nodes;
- the explicit and classical GZ.8 nodes;
- the GZ.9 constructions;
- the GZ.9 formulas;
- baseline, suppliers, ownership and planets.

The lead reviewer checked each high-severity finding at its evidence before accepting it: CST pp.6, 9, 17–18 and 20; Zhang 2010 p.580; BDP pp.1054 and 1127; the rendered Gross–Zagier p.309; JSW §4.1 and Remark 5.1.1(b); Skinner p.343. The accepted findings were applied by edit modules run in order on the input packet. Two second-pass reviewers then tried to break the corrected GZ.8 and GZ.9 nodes, and the lead reviewer checked the consistency of the packet, Lean file and reader. They found 1 high, 5 medium and 15 low problems in the corrections, and all were applied:

- before folding, the quaternionic CM measure must be twisted by the local component of the type-two character; without the twist it interpolates at n ≡ 1 mod (p − 1) instead of n ≡ 0;
- the eigenlogarithm statement must fix the eigen-embedding σ = ι_p, since for the other embeddings log_ω kills P_K(f) (checked with ℚ(√5));
- the χ⁻¹ convention had to be carried into the classical and elliptic nodes;
- CST's conductor was restated for ramified ω_A;
- positivity of the Petersson norm needs nonnegativity and realness as well as definiteness;
- one draft source finding, against CST p.17, came from a text-extraction error and was withdrawn.

The second pass also re-derived the YZZ↔CST constant and the h_F/#κ factors, confirmed the GH.4, ED.4 and PHR L1 citations, and checked the new Lean tests by hand. Its first attempt was stopped by the session usage limit, and it was rerun after the limit reset.

All seventeen public sources were downloaded, and their SHA-256 hashes match the packet's records. The CST published version (Algebra & Number Theory 8 (2014)) was also collated for Theorem 1.6. The YZZ book has no public or cleared copy, so its proof-level claims remain the recorded gap.

| Stage | Nodes | Verified | Corrected | Added | Unverifiable | Planets | Coverage |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| GZ.8 | 19 | 0 | 19 | 0 | 0 | 6 | planned |
| GZ.9 | 17 | 1 | 16 | 0 | 0 | 4 | planned |

The final packet:
- 36 nodes (unchanged): 1 verified, 35 corrected, 0 added, 0 unverifiable;
- 57 API items and 33 unit tests (28 → 33: five tests added to catch the χ/χ⁻¹ convention, the bilinear-versus-Hermitian extension and the probability normalisation);
- 10 planets, two of them renamed;
- 39 baseline declarations (24 → 39: sixteen added, one unused removed, three descriptions corrected);
- 21 requests (22 → 21) and 7 gaps (6 → 7);
- 14 source findings: E2–E7 re-checked, and E87–E94 new. They are numbered after the E1–E86 of the sibling packet for GZ.0–GZ.7, so that no new id is shared with it. A ninth draft finding was withdrawn by the second pass (see below).

## Node-by-node review

Identifiers are the suffixes of `GrossZagierAndArithmeticHeights:GZ.8/` and `:GZ.9/`. The packet's `review.checked` has the full note for each node.

| Stage / node | Verdict | Main check and correction |
| --- | --- | --- |
| GZ.8 / `chi-isotypic-mordell-weil-space` | corrected | Definition, projector and descent right. Added an order-three test (order-two characters cannot detect the χ⁻¹ exponent); recorded that Zhang’s and GZ.1’s χ-labels are A(χ⁻¹) here. |
| GZ.8 / `l-linear-neron-tate-pairing` | corrected | Trace law [L:M], orthogonality and factor two right. Added a ℚ(i) test separating bilinear from Hermitian extension; torsion API needs characteristic zero; CST page p.6. |
| GZ.8 / `chi-heegner-point` | corrected | Classical acceptance had χ for χ⁻¹ under GZ.0’s convention (carried into the classical and elliptic nodes by the second pass); toric volume uses the completed L(1,η); Zhang’s inverse weighting recorded; cubic and averaging tests added. |
| GZ.8 / `toric-integral-versus-finite-sum` | corrected | Curve-volume conversion reversed (CST dxdy/(4πy²) is half of YZZ’s dxdy/(2πy²)); L(1,η) is the completed value (checked on four fields); Lemma 2.3 proof step made explicit. |
| GZ.8 / `heegner-functional-equivariance` | corrected | Equivariance verified; the classical acceptance now applies σ_a rather than multiplying lattices. |
| GZ.8 / `general-quaternionic-gross-zagier-identity` | corrected | Constant and hypotheses checked against CST (2.4), Skinner p.341 and Zhang Thm 4.2.1; the CST comparison step had the volume factor backwards (a factor-4 error) and used finite L-values; erratum items 28–31, 47, 57, 62 cited. |
| GZ.8 / `vacuous-case` | corrected | Argument and inert-q example verified; the Heegner hypothesis is one sufficient condition, not the only one. |
| GZ.8 / `essential-case-root-number` | corrected | Sign computation verified; the (gen-H) example was false (11a1 over ℚ(√−11) has ε = +1, E89); unused YZZ prerequisite removed. |
| GZ.8 / `nonvanishing-criterion` | corrected | χ = 1 positivity argument and ord L(A/K, s) = dim A verified; the admissible-level hypothesis is not needed; locators and Skinner’s hypotheses fixed. |
| GZ.8 / `petersson-norm-and-parametrisation-degree` | corrected | Identities recomputed; the node restated GZ.3’s period and degree nodes, so it now imports them and keeps only the identification with Tau Ceti’s Petersson products and their positivity. |
| GZ.8 / `classical-gross-zagier-formula` | corrected | Specialisation of CST Thm 1.5 recomputed (Σ = ∅); added the CST explicit-formula and admissible-order prerequisites the general-c step uses; ĥ_K is the 2Θ height. |
| GZ.8 / `elliptic-curve-heegner-height-formula` | corrected | ĥ_K = 2·canonicalHeight over K confirmed; the claim that Mathlib has no number-field height instance was false; dual-map step and Manin-constant notation fixed. |
| GZ.8 / `admissible-order-test-vector` | corrected | Matched CST Defs 1.3–1.4; the extension of ω to U^{(N₂)} defined; CST’s conductor restated for ramified ω_A; false "newline is not the test line" acceptance replaced; local definition imported from GZ.4; inverse-convention test added; planet renamed. |
| GZ.8 / `explicit-gross-zagier-formula` | corrected | Every factor of CST Thm 1.5 checked; the special case lacked ω_A unramified, the nearby algebra, U, u and P; proof step points to CST Prop 2.5 and Lemmas 3.13–3.14. |
| GZ.8 / `explicit-formula-variation` | corrected | X₀(36) constant 9 recomputed; CST Thm 1.6’s #Pic(O_{c₁}) replaced by #Pic_{K/F}(O_{c₁}) (E90). |
| GZ.8 / `rational-shimura-curve-heegner-formula` | corrected | Every factor matches Skinner p.341; restored the embedding ι and the totally real positivity step; Case II completed; YZZ Thm 3.13 and its L-value normalisation scoped as unverified. |
| GZ.8 / `totally-real-trace-point-nontorsion` | corrected | Parity, positivity and the order statement verified; ω_A must be trivial, the full local root-number condition is stated, and the trace point is (h_F/#κ₁)·P⁰_1(f). |
| GZ.9 / `petersson-norm-ratio` | corrected | Definition and tests right; Brooks’s α(f, f_GL2) is the same ratio as JSW’s α(f, f_B), not its inverse; integrality hypothesis as Brooks prints it. |
| GZ.9 / `bdp-p-adic-l-function` | corrected | Euler factor, C(f, ψ), Ω_p^{4n} and uniqueness right; the normalization unit is now computed in the constructor (removing the hidden cycle); j = n − 1 (E87); W(f, ψ) located; the comparison fixing the unit is described once; period change restricted to ℤ_p^×. |
| GZ.9 / `bdp-square-root-comparison` | corrected | CH Prop 3.8 formula and μ/λ parity right; ψ₀ must have p-power conductor; (Heeg′) read correctly; circular first step replaced by the constructor identity. |
| GZ.9 / `quaternionic-bdp-construction` | corrected | Brooks Props 8.5–8.10 and Burungale (5.8) right; the depleted local measure lives on ℤ_p^×, is twisted by the local component of the type-two character (a one-step shift of the moment index, which the second pass found missing) and folded onto Γ; χ_j defined; Burungale’s setting recorded. |
| GZ.9 / `quaternionic-cm-waldspurger-formula` | corrected | C(f, χ), the α direction and the unit-modulus W(f, χ) right; the CM sum is of f_B; Brooks’s standing hypotheses and BDP §4’s odd-discriminant assumption recorded. |
| GZ.9 / `euler-factor-at-bdp-point` | verified | Verified: point counts, splitting, the Hasse valuation dichotomy at p ≥ 7 and p = 5, and the χN twist. |
| GZ.9 / `weight-two-abel-jacobi-is-logarithm` | corrected | Fil¹ statement and tests right; BDP’s curve is X₁(N) and Brooks’s ℍ/Γ_{1,N⁺}; ED.4 supplies the Coleman–logarithm comparison; Brooks’s projector misprint is E92. |
| GZ.9 / `bdp-weight-two-heegner-formula` | corrected | BDP’s a ⋆ indexing restored (the displayed formula was BDP’s for χ⁻¹); Assumption 5.12 condition (4) labelled; X₁(N) → X₀(N) step added; imports GH.4/bdp-special-value-formula. |
| GZ.9 / `quaternionic-weight-two-formula` | corrected | Formula and prefactor right; Δ′_χ is defined over H, not K (E93); the ε_f x_K relation and JSW’s sign (E94); p odd; isogeny prerequisite. |
| GZ.9 / `p-optimal-quotient-formula` | corrected | JSW’s condition is "image not in 𝔭T_pA_f" (the node had p, which breaks the cotangent argument); y_K and z_K separated; log_A from ED.4, BLR from R11.1. |
| GZ.9 / `logarithm-detects-heegner-point` | corrected | Verified in substance; part (b) is covered by the widened eigenlogarithm node; the logarithm is cited from ED.4. |
| GZ.9 / `bloch-kato-logarithm-of-heegner-class` | corrected | V, V*(1), Lie and cotangent conventions consistent; Frobenius weight −1; the differential lives on A_f; PHR L1 nodes cited. |
| GZ.9 / `isogeny-and-differential-compatibility` | corrected | Parts (a)–(d) and the c_π⁻² direction right; c_ψ direction and the projection map clarified; ED.4 and GZ.3 cited. |
| GZ.9 / `multiplicative-prime-formula` | corrected | Euler factor at φ(𝔭), not φ(p); Castella’s irreducibility hypothesis stated; Abel–Jacobi = log for semistable J₀(N) via Bloch–Kato Ex. 3.10.1, not the good-reduction node. |
| GZ.8 / `coefficient-identity` | corrected | Verified against GZ I (6.1)–(6.2), IV (6.9), V §1; cuspidality step made explicit; two unused YZZ kernel prerequisites removed; Tau Ceti old/new declarations cited. |
| GZ.8 / `derivative-corollaries` | corrected | (c) restated: its auxiliary-K hypothesis forces root number −1, so order zero is handled separately and the conjugate twists’ nonvanishing is supplied; GZ’s "≥ 3" line for root number +1 is E91; strict Petersson positivity (nonnegative, real, definite) cited. |
| GZ.9 / `bdp-measure-integrality` | corrected | Skinner’s O^ur⟦Γ⟧ statement faithful; Euler-factor sign ε⁻¹; (L-lrg) added; the non-membership in O⟦Γ⟧ softened to "not known". |
| GZ.9 / `imprimitive-function-dictionary` | corrected | Character substitution and C(f, K) right; Skinner’s printed e_∞ identity cannot hold (E88); why his first-power e_p matches BDP’s square explained; sources merged. |
| GZ.9 / `eigenlogarithm-nonvanishing` | corrected | The added factorisation φ∘ε_f = φ is false for [M_f:ℚ] > 1 (checked with ℚ(√5)); replaced by P_K(f) = e_f·y and log_ω∘e_f = log_ω, which holds only for the eigen-embedding σ = ι_p, now in the statement; (a) widened to BSW Thm 1.1; BSW §2.3 set-up stated. |

## Baseline at the pinned commits

All 24 input declarations exist under the cited names, kinds and modules at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, and their statements were read.

The height conventions are as the packet says:
- Tau Ceti's `canonicalHeight` is lim h(x(2ⁿP))/(2·4ⁿ), the (O)-normalised height;
- `neronTatePairing` is half the polar form;
- with Mathlib's `NumberField.instAdmissibleAbsValues` the height is relative to the base field.

So the BSD pairing over K is twice `canonicalHeight` over K.

Corrections to the baseline:
- **Added (sixteen):**
  - `NumberField.instAdmissibleAbsValues`, whose absence a hypothesis wrongly asserted;
  - the Dedekind-zeta residue theorem, which gives the finite residue, with (2π)^{r₂};
  - Tau Ceti's level-Γ Petersson product `CuspForm.peterssonInnerCosets`, with nonnegativity (`_self_re_nonneg`), realness (`_self_im`), definiteness (`_self_eq_zero`) and its comparison with `peterssonInner`; the derivative corollaries and their BSD consumers need strict positivity;
  - `completedRiemannZeta`, for the completed ζ(2) of the YZZ constant over ℚ;
  - Mathlib's Amice transform, its injectivity over complete ultrametric coefficient rings, and its ℤ_p equivalence;
  - Tau Ceti's old/new decomposition, newforms and strong multiplicity one.
- **Removed:** `UpperHalfPlane.peterssonInner_self_re_nonneg`, which no node cites any more.
- **Descriptions corrected:**
  - `NumberField.IsCMField`: Mathlib's class is "totally complex and quadratic over its maximal real subfield";
  - `PowerSeries.eval₂`: polynomial evaluation extended by continuity, with the ring map `eval₂Hom` under completeness and linear-topology hypotheses;
  - `NumberField.Units.torsionOrder`: its half is the unit index only for c = 1.

## Cross-roadmap suppliers and requests

All other-roadmap node prerequisites resolve, and each was compared with what its consumer uses. Neither the node graph (a depth-first search over all packets and decompositions) nor the stage graph induced by the corrected prerequisites, added to `research/blueprint/atlas/stage-edges.json`, has a cycle.

| Request (input) | Outcome |
| --- | --- |
| GeneralizedHeegnerCycles GH.1 (BDP Thm 5.13) | Removed. GZ.9 cites GH.4/bdp-special-value-formula (Theorem 5.13 under all five clauses of Assumption 5.12) and GH.1/generalized-heegner-cycle. The GH.1 decomposition node states only BDP's simplified Main Theorem and prints χ̄(p̄) for χ⁻¹(p̄). |
| AutomorphicPadicLFunctions L3h, L0, L3 | Kept. The L3h consumers list is completed. |
| PadicMeasuresIwasawaAlgebras L1 | Narrowed to pushforward, twisted sums, convolution and R⟦Γ⟧ ≅ R⟦T⟧ over Ô^ur. Amice surjectivity is now a request to L2, and Weierstrass preparation over a DVR with infinite residue field a request to L4. |
| PadicHodgeRegulators L1 | Good-reduction Bloch–Kato comparison cited by node (L1/abelian-variety-logarithm, L1/bloch-kato-logarithm, L0/hodge-tate-and-twist-conventions). The request is narrowed to the semistable case (Bloch–Kato Example 3.10.1 for J₀(N) at p ∥ N). |
| AbelianSchemesAndArithmeticModuli A4 | Removed. The abelian p-adic logarithm is ED.4/abelian-logarithm. The BLR cotangent saturation is requested from NeronModelsAndSemistableAbelianVarieties R11.1. The proposed "Abelian schemes, Part II" both duplicated ED.4 and collided with the existing accepted AbelianSchemesAndArithmeticModuliPartII. |
| ColemanIntegration L1 | Narrowed to the semistable Part II. The good-reduction Coleman–Jacobian comparison is ED.4/coleman-abelian-comparison, as the accepted Coleman packet assigns it. |
| HilbertModularVarietiesAndShimuraCurves R18.1 | Removed. Cites R18.1/canonical-quaternionic-curve and R18.1/quaternionic-effective-stabilizers. |
| R18.2 | Integral models cited by node (carayol-split-model, hecke-integral-extension). The request is narrowed to the ordinary CM deformation and Serre–Tate coordinates. |
| GL2AutomorphicRepresentationsAndTransfer R17.3 | Rational Jacquet–Langlands cited by node (global-jl, local-factors, rational-models). The request is narrowed to the integral-lattice Part II. |
| AutomorphicLFunctionsAndLocalFactors AL.3 | Continuation and centre shift cited by node (rs-global-functional-equation, motivic-unitary-shift). The request now also asks for the completed Hecke L(s, η) of K/F. Critical-value algebraicity is cited from ModularSymbolsPadicLFunctions L1/critical-value-algebraicity. |
| GZ.1, GZ.4, GZ.5 | Narrowed. GZ.4's order and test-vector nodes and GZ.3's period, degree and Manin-constant nodes are cited by id. Brooks's CM Waldspurger formula is this packet's own node, so it is no longer requested from GZ.5. |
| RankZeroOneBSD BSD.2 | Removed. Cites BSD.2/bfh-nonvanishing. BSD.2 is not downstream of GZ.8. |
| Tau Ceti ModularForms layer 5 | Removed. Strong multiplicity one is a pinned declaration. Layer 3 is kept for the Atkin–Lehner main lemma at Γ₀(N); layer 8g is kept. |
| R19.1, Tau Ceti EllipticCurves layer 3, DT.3 | Kept. |
| HeegnerPointEulerSystems HE.1 (new) | HE.1/cm-cyclic-isogeny-pair excludes D_K = −3, −4, which three consumers allow. |

RT-AREA-iwasawa-1/11 is handled as follows:
- L3h owns the GL₂ square-root measure, and GZ.9 imports its F = ℚ, n⁻ = 1 case.
- BDP Theorem 5.13 has one owner, GH.4, which the GH blueprint proposes as well.
- GZ.9 keeps Brooks's quaternionic construction (Brooks Proposition 8.13 = JSW Proposition 5.1.6), the JSW comparisons, the Kummer/Bloch–Kato comparison and the multiplicative branch.
- The ModularSymbolsPadicLFunctions L2 → GZ.9 edge is proposed for removal.

The proposed edges into GZ.8 and GZ.9 are listed in the packet's `restructure`, and all are acyclic. The first fix round's report had chosen the reverse direction for Theorem 5.13 (GZ.9 owns, GH.1 imports); the red-team finding allowed either direction, and the GH.4 choice is the one both blueprints now make.

## Mistakes in the sources

| Finding | Source and locator | Verdict |
| --- | --- | --- |
| E2 (misprint; affects nothing) | Brooks 2015, §8.6, Propositions 8.12 and 8.13, p. 4239 (published IMRN version) | confirmed |
| E3 (misprint; affects nothing) | Jetchev–Skinner–Wan 2017, §5.1, list after (5.1.a), published Cambridge J. Math. 5 (2017), p. 409; also arXiv:1512.06894v1 p. 32 | confirmed |
| E4 (misprint; affects nothing) | Brooks 2015, §8.5, the remark closing the proof of Theorem 8.11, p. 4239 (published IMRN version) | confirmed |
| E5 (misprint; affects nothing) | Castella 2018, §3, proof of Theorem 3.1, published Cambridge J. Math. 6 (2018), p. 13; also arXiv:1704.06608v2 p. 9 | confirmed |
| E6 (misprint; affects nothing) | Brooks 2015, §8.4, Proposition 8.7, published IMRN 2015 p.4236 | confirmed |
| E7 (misprint; affects nothing) | Burungale–Skinner–Wan 2026, arXiv:2603.20886v2 (10 May 2026), §1.1, equation (1.1), p.1; preprint only | confirmed |
| E87 (misprint; affects nothing) | Jetchev–Skinner–Wan 2017, §5.1, Remark 5.1.1(b), arXiv:1512.06894v1 p. 32; published Cambridge J. Math. 5 (2017) p. 409 | confirmed |
| E88 (error; affects nothing) | Skinner 2020, §2.6, paragraph after the interpolation formula, published Ann. of Math. 191 (2020) p. 343; same wording in the arXiv preprint p. 14 | confirmed |
| E89 (error; affects a stated result) | Jetchev–Skinner–Wan 2017, §4.1, the sentence introducing (sign −1) after (gen-H); arXiv:1512.06894v1 p. 25; published Cambridge J. Math. 5 (2017) p. 400 | confirmed |
| E90 (misprint; affects a stated result) | Cai–Shu–Tian 2014, Theorem 1.6, definition of P⁰_χ(f1'), arXiv:1408.1733v2 p. 8; same in the published version, Algebra & Number Theory 8 (2014), p. 2535 | confirmed |
| E91 (gap; affects a stated result) | Gross–Zagier 1986, Chapter V §1, Corollary (1.3) and the paragraph proving it, p. 309 (Inventiones 84, published version, author scan) | confirmed |
| E92 (misprint; affects nothing) | Brooks 2015, §6.4 (the case of weight two), the display defining the projector ε_f, p.4224 (published IMRN version) | confirmed |
| E93 (error; affects a stated result) | Brooks 2015, §8.6, the sentence before Proposition 8.13 and the statement of Proposition 8.13, p.4239 (published IMRN version) | confirmed |
| E94 (misprint; affects nothing) | Jetchev–Skinner–Wan 2017, §5.1.5, the relation between x_K^{N⁺,N⁻} and Brooks's point after Proposition 5.1.6, arXiv:1512.06894v1 p.34; published Cambridge J. Math. 5 (2017) p.411 | confirmed |

E2–E7 were re-checked at their locators; the first review had confirmed them, and its verdicts stand. One slip in the earlier record: E2's reason cites JSW Proposition 5.1.6 on published p.412, but it is on p.411. E87–E94 are new. Each records what was searched, and each is scoped to the version that was read.

The ids E8–E86 are taken by the sibling packet GrossZagierAndArithmeticHeights--GZ.0, so the new findings start at E87. The ids E2–E7 were already shared with that packet before this review. They are kept, because the register records them by file, but the orchestrator may want to renumber them.

A draft finding against CST's proof of Lemma 2.3 (p.17) was withdrawn by the second pass. Its claim was that the local unit index is printed inverted, but the PDF word boxes show a superscript −1 after the bracket. That superscript was lost in the text extraction, and the printed identity [Ô_K^×:Ô_b^×]^{-1} = L_b(1,η)|b| is correct.

## Suggested Lean file

The reviser could not compile the file's two Tau Ceti imports (`TauCeti.NumberTheory.ModularForms.Petersson.Basic` and `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight`), because the shared build lacks their compiled modules. This review inlined the pinned f790474 sources of their import closure (17 modules, about 4,300 lines) into a scratch copy, in dependency order, each module in its own section. It then ran `lean-check` at Mathlib 082e2d3.

- **The input file** elaborated with 0 errors and 117 `sorry` warnings.
- **The corrected file** elaborates with 0 errors and 128 `sorry` warnings, and no other warning. All diagnostics lie past the inlined prelude.

Changes to the file:
- `coeffPairing_torsion_left` now assumes `[CharZero M]`. Without it the signature is false: over `ZMod p` every vector has finite additive order, so the lemma would make the extended pairing vanish identically.
- `log_pullback` assumed its own conclusion. It is replaced by a pending note: it needs ED.4's abelian logarithm.
- New tests, each also an `example` on concrete data:
  - `chiIsotypic_cubic` and `heegnerFinite_cubic`, with a `CubicTests` block over 𝔽₇, where 2 is a primitive cube root of unity, acting by the cyclic shift;
  - `heegnerAverage_sign`;
  - `coeffPairing_bilinear_qi`, with an example over ℂ;
  - `testVectorLine_inverse_convention`.
- The docstring of `newline_not_testVector` now describes a true non-example: the spherical vector at v ∤ N when χ_v is ramified.
- The BDP comment now names GH.4, and the header states the compile status.

The file declares 51 of the 57 API names and all 33 test names, with 44 examples. The six pending API names are unchanged and listed in the file.

## Reader document

The reader's node, request, gap, source and correction sections are generated from the corrected packet, so they say exactly what it says; a generator reproduced the input reader byte for byte. The hand-written sections were rewritten:
- the normalization paragraph, for the corrected dictionary, the completed L(1,η) and the χ⁻¹ convention;
- the ownership paragraph, for GH.4, BDP's a ⋆ indexing, the Teichmüller folding, the constructor-computed unit, the semistable Bloch–Kato step, ED.4 and R11.1;
- the Lean paragraph, for the compile result and the new tests;
- the source-correction preface.

## Questions for the orchestrator

1. **GH.1 decomposition node.** The integrated node GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images prints the Euler factor of BDP's Main Theorem with χ̄(p̄) where BDP p.1038 has χ⁻¹(p̄). It is outside this job; its owner should correct it.
2. **GH.8 duplication.** GeneralizedHeegnerCycles--GH.8 is accepted and duplicates GZ.9's weight-two Abel–Jacobi/logarithm and differential comparisons (GH.8/weight-zero-cycle, GH.8/differential-evaluation). Since GZ.9 → HE.8 → GH.8, GH.8 should import them in a revision.
3. **JSW's (gen-H) sign claim (E89).** Consumers that cite JSW for root number −1 under (gen-H) with a ramified prime of N⁺ need an extra local condition, such as Skinner's (ram). RankZeroOneBSD's packets should be checked for this.
4. **Incoming requests.**
   - BSD.0 asks GZ.9 for Kobayashi's supersingular p-adic Gross–Zagier formula. That is a p-adic height formula, which the GZ.9 stage text excludes.
   - EffectiveDiophantineMethods asks GZ.8 for rank and Ш, which need HE.7 after GZ.8's non-torsion theorem.
   - Castella's A′ extension, requested by BSD.6/BSD.6a, is now a gap.
   Restructure entries propose the redirections.
5. **Part II proposals.** Three remain: Coleman integration (semistable), GL₂ transfer (integral lattices; HilbertModularVarieties R18.4 may already be the right home) and Diophantine approximation (abelian p-adic analytic subgroups).
6. **YZZ book.** A cleared copy would let the projector reduction and the book's L-value conventions be verified, which would close one gap.
7. **Exceptional zero.** Castella's exceptional-zero derivative formula (Theorem 3.11) has no consumer. Both blueprints now decline it unless one appears.

## Validation

- `TAUCETI_BASELINE=… python3 scripts/check_blueprint.py research/blueprint/packets/GrossZagierAndArithmeticHeights--GZ.8.json`: 0 errors, 0 warnings.
- **Cycles.** The node graph has no cycle (depth-first search over every packet and decomposition). The stage graph has no cycle once the stage edges induced by the corrected prerequisites are added to the atlas edges.
- **Source register.** `errata.collect()` reads all fourteen findings of the packet; each shows its verdict once this review job is marked done. `errata.py` was not run, because it rewrites the register.
- **Lean.** `lean-check` at the pins, with the Tau Ceti prelude inlined: 0 errors, `sorry` warnings only. Available memory was checked first, and no build, cache fetch or language server was started.
- **Reader.** It is regenerated from the corrected packet and the hand sections. Every packet test name is declared in the Lean file.
- **Whitespace.** `git diff --check` is clean. Only the four deliverables and this review's handoff note changed.
