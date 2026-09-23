# REV-PAPER-MOK-PILA-TSIMERMAN-19 — review of the Mok–Pila–Tsimerman extraction

Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The extraction was done by Claude Code, session `cc-7b31c4`. This session had no part in it, and none in any other work on this paper.

**Verdict: accept.** Routes 1 and 2 are accepted. Route 3 is new and accepted. The original ShimuraData D4 route is rejected, and its item is moved into route 1.

## Source

- **Version.** arXiv 1711.02189v3 (20 September 2018), downloaded fresh. Its SHA-256 matches the recorded `b3de4f10…0167`.
- **How it was read.** All 29 pages were read in the text layer. Pages 12, 17, 20, 21 and 24 were checked as page images.
- **Not collated.** The published Annals text (189 (2019), no. 3) is paywalled and was not collated.
- **Existing corrections.** arXiv lists v3 as the latest version, and Crossref registers no update.

## Items

The statements of Theorems 1.1–1.4, 9.1 and 12.3 match the paper, as do the lemmas behind them and the Schwarzian construction. The following were corrected in place.

- **Item 2 (weakly special subvarieties).**
  - The paper does not define weakly special subvarieties; it takes them from Klingler–Ullmo–Yafaev.
  - It asserts that they are bi-algebraic (p. 2). The extraction's "exactly the bi-algebraic subvarieties" also asserts the converse, a theorem of Ullmo–Yafaev that is not used here.
  - The statement now also records the property the proofs actually use: weakly special subvarieties come in countably many families, defined over Q̄ and stable under Galois (§12.1; also Lemma 4.3).
- **Item 36.** Only closed analytic subspaces (C0) and Chow's theorem (C4) are planned. The classical Remmert–Stein theorem and the dimension theory of analytic sets are not planned by any layer. The paper does not use them; it uses only the definable Remmert–Stein theorem, which is item 9. The citation of C2 (coherent GAGA) was also wrong.
- **Item 38.** Siegel sets and their finite covering of the quotient are planned in AdelicAlgebraicGroups AA.3, not ArithmeticLocallySymmetricSpaces ALS.0. ShimuraVarieties V0 consumes them.
- **Item 7.** A note records that the o-minimality of R_an,exp falls under LD.6's "selected o-minimal structures" without being named.
- **Added items:**
  - **40.** Semicontinuity of fibre dimension and Remmert's proper mapping theorem. These are used for the closed analytic loci A(k) in §3.1 and §9.2, and explicitly in the proof of Lemma 9.2.
  - **41.** The weighted-projective compactification BJ^r_kY of jet spaces (§9.1), needed for the Hilbert schemes of §9.2.
  - **42.** Theorem 12.5, the product version.
  - **43.** The deduction of Theorem 9.1 from Theorem 12.3 (§12.4).
  - **44.** The remark after Corollary 9.3: second-order partial derivatives of q generate all of them.

**Statuses.** All eight planned items were checked against their layers' descriptions. D2/D3 (Hermitian domains, compact dual, Borel embedding), V0–V3, LD.0 and LD.6, and R09.1/R09.2 plan what is claimed, after the two corrections above. A search of the atlas stage descriptions found no owner for any item left missing.

## Routes

1. **Part II of LogicAndDefinabilityInNumberTheory — accepted, amended.** Nothing in the atlas plans this mathematics, and LD.6's source route explicitly asks for Ax–Lindemann and Ax–Schanuel inputs. The amendments:
   - **Items.** Item 2 moves here, and items 41–44 are added.
   - **Imports.** They are corrected to AA.3 for Siegel sets and to ComplexComparisonPartII C0 and C4.
   - **Design constraint.** Import only LD.6's o-minimality, cell-decomposition and Pila–Wilkie content. LD.6's unlikely-intersection applications consume this Part II, so a whole-layer import would close a stage cycle; if a partial import is not possible, LD.6 should be narrowed.
   - **Coordination.** PAPER-TSIMERMAN-18 routes "special and weakly special subvarieties" to LD.6. There should be one owner, and this Part II, which imports ShimuraData and ShimuraVarieties, is the natural one.
2. **Source for LD.6 (definable Remmert–Stein, definable Chow) — accepted.** It is compatible with PAPER-BAKKER-KLINGLER-TSIMERMAN-20's o-minimal source route.
3. **Source for ComplexComparisonPartII C0 and C4 (item 40) — added and accepted.** It is consistent with BKT20's routing of its proper-image theorem to the same layers.

**The old D4 route is rejected.** D4 comes before the construction of X = Γ\Ω, since ShimuraVarieties V0 depends on D5, which depends on D4. A D4 source could therefore define special points of the domain, which it already does, but not subvarieties of X.

## Mistakes in the paper

- **E1 (o ∈ X for o ∈ Ω): confirmed, with the reason corrected.** Example 7.1.1's o = 0 lies in Ω̂ = P¹ and is the centre of the disc model, but it is not a point of the upper half-plane.
- **E2 (Ochai): confirmed.**
- **E3 (T_x(X) for T_x(S)): confirmed and extended.** The VMRT sentence after Theorem B repeats the slip twice (ℙT_x(X), "x ∈ X").
- **E4 (Theorem 7.3 for Corollary 7.3): confirmed.**
- **E5 (rank(k)): confirmed.**
- **Added, each confirmed on the page image:**
  - **E6, p. 12.** Example 7.1.1 prints the t³ coefficient c/(6a) − b²/(4a²) as the fourth jet coordinate. That coordinate is six times the coefficient, c/a − 3b²/(2a²), which is exactly the classical Schwarzian.
  - **E7, p. 12.** "B = K_ℂN⁺" in the proof of Lemma 7.1 should be K_ℂN⁻, since 𝔟 = 𝔫⁻ ⊕ 𝔨_ℂ.
  - **E8, p. 17.** "G(ℂ) acts algebraically on X" should read "on Ω̂".
  - **E9, p. 20.** "by Lemma 3.3" in §10 should cite Lemma 9.4.
  - **E10, p. 21.** "u = q(gv)" should be "u = q(gw)".
  - **E11, p. 24.** The rank matrix (D_i s) is indexed 1 ≤ i ≤ n with n = dim X, but it should run over the d derivations.

  All of these are misprints that reach nothing. The `known` field of every finding is now the canonical "new".

## Checked and not recorded

- **Dimension bookkeeping.** The extraction's checks pass: (∗) ⟺ (∗∗), the extreme case W = Ω₁ × X₁, and the PSL₂ transcendence degree 3.
- **Lemmas 4.2 and 10.2.** The dimension inequalities were followed and are consistent.
- **Example 7.1.1's computation.** The expansion t + (c/(6a) − b²/(4a²))t³ was verified by hand; only the final coordinate is misprinted (E6).

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json` reports `ok`.
