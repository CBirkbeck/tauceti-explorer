# REV-PKG-ArithmeticStatisticsPartVIII~adv: independent package review with the adversarial pass

Reviewer: Claude (session claude-VoV5d9), issue #10281, 2026-10-17. I did not write any of the files reviewed. The package is
`research/blueprint/packages/ArithmeticStatisticsPartVIII/` (Layer 5 §§5.12–5.22 of the arithmetic-statistics roadmap: function-field
distributions and geometric statistics), produced by the split in FIX-PKG-ArithmeticStatistics~adv2 (#10251).

**Verdict: accepted with fixes.** All fixes are applied in place. The remaining open items are supplier gaps, now stated
explicitly as *Required in addition* contracts or as the unowned input (HS). None of them is a defect of this package's mathematics.

## What was checked

- **Shape.** The README sections were checked against `PACKAGE_REVIEW.md` and two upstream models (GlobalNumberFields, ProfiniteArithmetic).
  The README is 176 KB, under the 350 KB limit. Every target has its hypotheses in the statement, a source locator, a *Needs* line and Checks.
  Every definition has an API list and at least three Checks.
- **Part boundaries.** I compared the original accepted README at 270eb2332^ with the part by script, normalizing cross-part URLs and the three
  lead-ins the split rewrote. All 810 nonblank lines of the original §§5.12–5.22 are present, and nothing was lost.
  - The split had turned each "Throughout this assertion, …" line into a bare hypothesis fragment. Of these 72 lines, 65 repeated hypotheses
    already in the statement and were deleted. The other 7 carried content and were folded into a sentence.
  - The original Layer 5 supporting block came over whole. Two pieces belong to Part VII, and Part VII states their content in full:
    the de Jong three-Selmer paragraph (Part VII `function-field-3-selmer-average-bound`), and the general-global-field family conventions
    (Part VII `refinement-squarefree-selmer-conjecture`, `refinement-odd-degree-jacobian-conjecture`,
    `refinement-even-genus-two-selmer-conjecture` and `refinement-global-image-splitting-conjecture`, on main after the Part VII review).
    Both pieces were removed from this part.
- **Suppliers.**
  - Within the bundle, the only cross-part links are to Parts I, IV, V and VII; all point earlier, and all 395 links resolve against current main.
  - No target uses AnalyticNumberTheory directly. Nothing in this part feeds AnalyticNumberTheory, an earlier part or
    ModularityAndLanglandsExtensions, which remains downstream only.
  - The only atlas consumers of a target here are the ClassicalGroupsPartII and LocalGaloisDeformationRings plans, which take the similitude carrier.
  - Every lower-tier supplier citation was checked against that supplier's current upstream README: IG #850 at 57a651c, AS #849 at 8c67a7e,
    GN #851 at da48e5f, EDC #1040 at 244af3e, DWP #929 at 5f713c4, SchemeAndStackFoundations on main at 350e970, and EllipticCurves and
    JacobianChallenge in the snapshot. Two Sonnet passes did the matching; I read every quoted line used.
- **Duplication.** Every target was swept against upstream IG, the roadmap closest to this part, and the current Tau Ceti library (a91d3aaf)
  was searched by object. Only one target was stated upstream (coprime complements, IG §IG.4.5). The library adds a symplectic
  root-subgroup generation theorem. Neither Mathlib nor Tau Ceti has a Kolmogorov distance or GSp cosets.
- **Sources.**
  - A scripted sweep tested every `[[n]]` locator (about 110 label/page pairs) against page-marked texts of all eight cited sources.
    Its misses were all "proof of X, p.N" pages after the statement page, plus EVW's "8.9. Lemma." label style.
  - I then read the decisive pages: EVW pp. 769, 774–782; Wood pp. 18–25 and 33–34; Lipnowski–Tsimerman pp. 31–37;
    Browning–Le Boudec–Sawin pp. 52–59; Achter–Pries pp. 7, 11–14; Vasiu p. 2; LWZB pp. 3–4. Every locator checked is correct.
- **Lean.** `lean-check` on the final `Suggested.lean` exits 0 with 24 warnings, all "declaration uses `sorry`", and no errors.
  `scripts/check_sorry_data.py` passes. `#print axioms` on a scratch copy shows the data definitions use only propext, Classical.choice and
  Quot.sound. In the same scratch copy a deliberately false `decide` example fails, so the checked examples are real.
- **Form.** `intake.py check-files` reports 0 problems. A markdown-it render shows no spurious italics after the fixes; the escapes are
  reversible. No verbatim source passages are present.

## Fixes made

1. **Front matter rewritten for this part.** The Scope, Conventions and Exact supplier contracts were the common text of all eight parts, so
   most of it concerned other parts (binary forms, heights over Q, the AN cubic suppliers, OperatorTheory, Selmer suppliers, among others).
   - Scope now lists the five groups of targets this part owns and the boundaries it relies on.
   - Conventions now give this part's Frobenius, symplectic-matrix and limit-order conventions. Three copies of the Frobenius convention
     sentence were merged into one.
   - The contracts are now one entry per supplier, split into *Uses*, with the upstream section, and *Required in addition*.
2. **Wrong supplier attributions corrected.**
   - The Grothendieck–Lefschetz formula was cited to SF.2. SchemeAndStackFoundations line 146 says trace formulas are downstream of it;
     the formula is IG §IG.0.T4.
   - Poincaré duality was cited to EDC.2. It is EDC Layer 0, §§0.5–0.6.
   - The monodromy reductions were cited to IG.0 and IG.1. They are IG §IG.5.7.
   - The admissible-cover boundary was cited to IG.1. It is §IG.5.4.
   - "JacobianChallenge Layer D" gives Jacobians only over a field. The relative Jacobian over Conf_n is now a *Required in addition* item from AS.
3. **Supplier gaps made explicit.**
   - (IG-a) EVW's Hurwitz scheme branched at ∞. IG §IG.5.3 has the unramified-∞ and Conf_n(P¹) versions.
   - (IG-b) Wood's Theorem 4.5(2)–(3) for tangential infinity types: Frobenius-fixed components counted by |H₂(F,c)[q−1]|. IG's
     fixed-fibre formulas cover the unramified-∞ marking only.
   - (GN-a to GN-c) BLS Lemma 3.9 and the minor gcd, the Lipnowski–Tsimerman model ring, and its corrected orbit bound (55). All three are
     planned in GN's accepted atlas plan (GN.0 *Two-congruence determinant*, GN.2 *Model rings with positive involution*, GN.3 *Positive
     unit orbit counts on model rings*) but are absent from the upstream README of #851.
   - (GN-d) The quaternionic orbit bound. No roadmap states it.
   - (HS) EVW Proposition 7.8, the uniform Betti bound, has no owner: the atlas routes it to an unplanned Inverse Galois Part II on
     homological stability, and IG states that it asserts none. The moment estimate, the large-q Cohen–Lenstra theorem and its
     positive-proportion corollary now say they are conditional on (HS).
4. **Duplicate target narrowed.** The coprime-complements target restated IG §IG.4.5 (existence and H-conjugacy). It now states only the
   count [H : H^Γ] of sections. It keeps its anchor, gains a proof of the stabiliser computation, and gains a trivial-action control.
5. **Mathematics.**
   - The proof of the uniform moment estimate was a sketch ("prove the uniform cohomological bound … these assertions are supporting targets
     here"). It is replaced by EVW's argument with an explicit constant B(A) = max(3C² + 1, 2 dim(A/ℓA) + 1, 5). Every inequality was checked.
   - The transitivity proof for surjections Z_ℓ^g → A never built the adapted basis. The normalization step (f(y_i) = x_i, f(y_j) = 0) is now
     written out.
   - The Lipnowski–Tsimerman Lemma 5.19 step was justified by a dangling "(Part II, corrected Lemma 5.19)" pointer. The printed proof does not
     work ("a = 1 and b = 1"), and the lemma fails at p = 2. The step now has its own proof for odd p: p^i + p^j = 2(p + 1) is impossible.
   - The primary-decomposition Check was ambiguous about V_±; it is now stated in an explicit symplectic basis.
   - The A = 0 orbit Check and the EVW-fibre Check were reworded.
6. **Garbled and dangling references fixed.** These were "the marked-cover comparisonST.0 for A(G, G′), /16",
   "comparisonInverseGalois…:IG.3", "comparisonuse the reduced-cover…", "EVW items /132" and "item /133". Also fixed: "Layer 0" and
   "Layer 3" pointers to other parts (now links to Part I or Part V targets) and "(Part II)" pointers (BLS Proposition 5.2, now located
   at arXiv v1, pp. 52 and 57–59). `Jac(C)[ℓ^m](K̄)` rendered as a link and was rewritten.
7. **Presentation.**
   - 22 duplicated Checks removed; one was merged into its pair.
   - "For the proof, X" became "*Proof.* X".
   - The duplicate headings of §5.16 and §5.19 were renamed.
   - The Kolmogorov API namespace was aligned with the Lean file (`GeometricStatistics`), and `MeasureTheory.Measure.eq_of_cdf` added.
     The handoff's `ext_of_cdf` does not exist at the pin.
   - 13 lines with spurious italics (`}_{` underscores) were escaped.
   - Dependencies and Downstream consumers were rewritten for this part.
8. **Lean.** The file grew from 61 to 227 lines. It now has light real-bodied definitions over Mathlib carriers: `similitudeCoset`/`similitudeSet` on
   `Matrix.J`, `upperOddDensity`/`lowerOddDensity`, `allowedPrimePowers` and `EventualDegreeLargeQLimit`, and `parityMultidegreeCount` on
   `Finset.Nat.antidiagonalTuple`. It adds the milestones `sum_sq_le_of_le_mul`, `similitudeCoset_one`, `similitudeCoset_mul_mem`,
   `multiplier_unique`, `allowedPrimePowers_neBot`/`_zero`, `EventualDegreeLargeQLimit.unique`, `lowerOddDensity_le_upperOddDensity` and
   `parityMultidegreeCount_eq`.
   - Negative controls: diag(1, 3) over Z is not a similitude; along A_0 every target is a limit; the alternating odd-degree sequence has
     distinct densities.
   - Examples with real proofs: three `decide` counts, `ring`, `norm_num` and `simp`.
   - The README targets now name these declarations.

## Adversarial pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Local density first moment and its range | n = 0 (N = 1); n = 1, d = 1, r = 1; d ≥ 2, n ≥ 1; r = 0 | Formula 1 − 1/p and 0 confirmed; range [1 − 2p^{−(n+1)}, 1]; r = 0 correctly excluded | None |
| Two-point incidence count | r = 1 independent (p^{N−2} − 1); proportional pair (v = r) | Matches the one-point count | None |
| Veronese minor valuation | x = (1,0), y = (1,p), d = 2; dependent pair | Both gcds p; capped value p^r for dependent pair | None |
| Pair gcd sum, second moment, variance | r = 1 count (p^{n+1} − 1)(p − 1); n = 2 series ≤ 2p^{1−n}; numerator x² + 2w + 2y − 2xy − z ≤ 3.1w; 1 − z ≥ 7/8 | Constant 3.1·8/7 ≈ 3.54 < 4; d = 1 variance p^{−2n} | Dangling "(Part II)" consumer note replaced by the BLS Proposition 5.2 pages |
| Gradient strata, high stratum count | d = 1; X₀X₁ mod 9 in R^{(0)} and R^{(2)}; exponent 2p^{rN−e} | Strata overlap, bound verified | Duplicate Checks removed |
| Fixed-valuation Hensel lifting, density lower bound | δ = 0; F = t², p odd, δ = 1, m = 2: p − 1 solutions, then none; e = r; r ≤ 2e + 1; r ≥ 2e + 2 | Counterexample confirms m ≥ 2δ + 1; all exponents check | None |
| Convex and weighted concentration | g ≤ 0; k = 2 extremal; ε = 0.99 gives 0.9802; Case A 0.4901, Case B 0.25005; C = 0 gives g₀ = 2 | Correct | Lean milestone with `ring`/`norm_num` examples |
| ppav concentration, spacing discrepancy | g = 1 (no bad class); B₀^m as block (1, 2m); a_E² ≠ 4p so the two roots are distinct and non-real; B₀^m roots ±√p of multiplicity 2m | Conditional on H1, H2 and items GN-c, GN-d | Suppliers relabelled; Layer 0 pointers became Part I links |
| Kolmogorov distance and atom bound | μ = μ; δ₀ vs δ₁ = 1; ½(δ₀ + δ₁) vs δ₀ = ½; δ₀ vs uniform[0,1] = 1 | Correct; Lean signature matches the README generality | `eq_of_cdf` added; duplicate Check removed |
| Spacing measure, zero-gap mass | {1,1,1,1} gives ¾δ₀ + ¼δ₄; {0, π} gives δ₁; {0,0,π,π} atom ½; x² + 5 angles π/2, 3π/2; N = 2h two values: 1 − 1/g | Correct | Duplicates merged |
| Enhanced Cohen–Lenstra fails | p = 2: y² + xy = x³ + x² + 1 has #E(F₂) = 2, #E(F₄) = 8; p = 3: S = {2, 5, 7, 11, 13}; #B₀(F_p) = (p − 1)² | LT's printed proof of Lemma 5.19 is invalid and the lemma fails at p = 2; it holds for odd p | Two-line proof for odd p added |
| Generalized dihedral datum | A = 0; Z/2; Z/3 ≅ S₃; Z/5 | (iv) needs odd order too, not only A ≠ 0 | Hypothesis sentence corrected |
| Class-group pairs and the factor two | A = 0 (m_A = 1); free sign action for odd A ≠ 0; S_n = 2(q^n − q^{n−1}) (EVW (8.7.5)) | Correct | None |
| Involution quotient | ℓ = 2 (1 + σ not invertible on Ẑ₂); snake lemma | Correct | None |
| Odd-degree densities | constant; (−1)^{(n−1)/2}; values at even n | Upper 1, lower −1; even n ignored | Lean definitions and examples |
| Top-degree trace, uniform trace estimate | A^n; two conjugate copies of A^n (trace 0); C = 1, q = 16 gives 1/3; q = 1 excluded; n = 1, q = 9, t = (1, 3) gives 2/9 ≤ ½; n = 0 | EVW use dim H^i ≤ C(A)^i with C(A) = C(G,c)²; the package's C^{i+1} variant with remainder C²/(√q − C) is valid | Suppliers corrected (IG.0.T4, EDC §§0.5–0.6, DWP 7.12) |
| Integral lift at (g, ℓ) = (1, 3) | subgroup of SL₂(Z/9) generated by [[0,1],[8,0]] and [[1,7],[6,7]] | Computed: order 24, bijective onto SL₂(F₃), index 27 in SL₂(Z/9) (order 648) | None |
| Overlapping symplectic subgroups | V₂ = 0 | Proper subgroup Sp(V₁) × Sp(V₃) | None |
| Similitude cosets | diag(1, −1) has multiplier −1; diag(1, 3) over Z has non-unit multiplier 3; Mathlib's J = fromBlocks 0 (−1) 1 0 | Correct in the h J hᵀ convention | Lean definitions; `similitudeSet` and `multiplier_unique` added to the API |
| Primary decomposition and killed Lagrangian | h = 1 on e_i, q on f_j; q = 1 | Check was ambiguous about V_± | Check rewritten |
| Transitivity on lattice surjections | A = 0; g < dim A/ℓA | Proof omitted the adapted basis | Proof rewritten |
| Unique similitude-stable orbit | q = 1, g = 2, f₀ = (x₁, x₂), f₁ = (x₁, y₁) | Control is correct | None |
| Uniform moment estimate and large-q theorem | A = 0; constants of the new proof | The sketched proof hid input (HS), which has no owner | Explicit proof with B(A); both theorems marked conditional on (HS) |
| Eventual-degree large-q limit | m = 0 (bottom filter); n/(n + q) | Correct | Lean filter, predicate and controls |
| Wood unit moments | #IQ = q^{2n−1} − q^{2n−2} (monic f, Wood's ∞ type) against EVW's S_n = 2(q^n − q^{n−1}); ratio 1 + O_n(q^{−1/2}) | Consistent with Wood p. 24 and Part I's slice | Suppliers relabelled (IG.4.6, IG.5.5, IG-b) |
| Bad types and profiles | printed lim against the proved liminf; oscillating c(q); N = 1; profile with boundary only | Correct | Garbled citations fixed |
| Parity multidegree count | N = 1; (N, N₀, d, ε) = (2, 0, 4, (0,0)) gives 3; (1, 0, 4, (1)) gives 0; (2, 1, 4, (1,1)) gives 2 | Stars-and-bars formula matches | Lean definition, theorem and `decide` examples |
| Semidirect surjections, coprime sections | H = 1, Γ = 1; Z/3 with inversion (3 sections) against trivial action (1) | Correct | Target narrowed to the count; trivial-action control added |
| LWZB and Cohen–Lenstra–Martinet moments | Γ = Z/2, H = Z/3 gives 1/3; even H | The printed lim_q is correctly weakened to limsup/liminf | Suppliers relabelled |

## Remaining for the maintainer

- Add items IG-a and IG-b to InverseGaloisAndArithmeticFundamentalGroups (#850), and the relative hyperelliptic Jacobian to
  AbelianSchemesAndArithmeticModuli (#849).
- Port GN.0 *Two-congruence determinant*, GN.2 *Model rings with positive involution* and GN.3 *Positive unit orbit counts on model rings*
  from GN's atlas plan into its upstream README (#851). Add the quaternionic orbit bound (GN-d).
- Give EVW's homological stability and Proposition 7.8 (input (HS)) an owner. Until then §5.19 is conditional.
