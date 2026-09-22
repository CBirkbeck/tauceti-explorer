# Mistakes in Caro–Pasten, *A Chabauty–Coleman bound for surfaces*

Job ERRATA-PAPER-CARO-PASTEN-23. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-CARO-PASTEN-23.json` beside this file.

**Paper and version read.** J. Caro and H. Pasten, Inventiones mathematicae 234 (2023), 1197–1250, DOI 10.1007/s00222-023-01217-1.
- **Read:** arXiv 2102.01055v2 of 10 February 2021 (39 pages, SHA-256 `d7398c4b…67f7`), the latest arXiv version and the one the extraction used. Every passage below was re-read there.
- **Not available:** the published article, 54 pages and evidently substantially revised, sat behind a publisher challenge and was not seen.

**These findings are about v2.** Some may already be corrected in print. One clearly seems to be: see E1.

**Earlier work.** The extraction PAPER-CARO-PASTEN-23 (partial) found all of these except that its repair of §7 differs from E7's. E7's diagnosis and repair are checked here by exact computation. Two of its minor points were not relocated and are not recorded:
- a factorial denominator in the exponential;
- the m = 0 adapted-parameter case.

**Existing corrections.** None was found:
- Crossref registers no erratum;
- v2 is the latest arXiv version;
- the authors' pages have no copy or erratum.

Balakrishnan–Caro (arXiv 2501.03483v2) quote the published Corollary 1.15 with p + 4√p + 5 in place of v2's p + 4√p + 3, which is consistent with a correction of E1.

**Effect.** E1 changes the explicit constant in the main theorems of v2. The other findings are local:
- errors in a lemma (E5), a corollary (E13) and the formal-group construction (E7), each with a repair that leaves the main line intact;
- misprints.

## E1. Lemma 3.15 is false (error)

Lemma 3.15 bounds the number of geometric branches of a curve D over its k-rational points by (q + 1)r + 2q^{1/2} Σ g_g(C_j).

**Counterexample.** Over F₃, the nodal cubic y² = x²(x − 1) has five rational points and normalization P¹. Its node has tangent cone y² + x² = 0, and since −1 is not a square in F₃, the two branches at the node are defined only over F₉. The branch count is 6, but the bound is q + 1 = 4.

**Where the proof fails.** The product formula of Lemma 3.17 is right, but it cannot locate the individual zeros and poles of Z*_{D,k}. Here Z*_{D,k}(T) = (1 + T)/((1 − T)²(1 − qT)), and the factor (1 + T)/(1 − T) cancels under T ↦ −T.

**A correct bound.** For a geometrically integral curve, the count is at most q + 1 + 2g q^{1/2} + 2(p_a − g). This follows from Weil's bound for the normalization and b_x ≤ δ_x + 1 ≤ 2δ_x at singular points, and it is sharp in the example.

**Consequences.** (9.8) uses Lemma 3.15 to obtain the constant q + 4q^{1/2} + 3 in Theorem 9.1. The same constant appears in Theorems 1.5, 1.7, 10.1 and Corollaries 1.11, 1.14, 1.15, so it is not established in v2. The published version appears to have p + 4p^{1/2} + 5.

## E2. The jet in Remark 4.7 (misprint)

The sharpness example maps s₁ ↦ z, s₂ ↦ 0. Both forms ds₁ + s₁²ds₂ and ds₁ + s₂²ds₂ then pull back to dz ≠ 0, so the jet is not integral. With s₁ ↦ 0, s₂ ↦ z they pull back to 0 and z²dz = 0, and m = 2 is attained.

## E3. Dimension of an intersection (misprint)

On p.16, cycles of dimensions r₁, r₂ on an n-dimensional abelian variety are said to meet in dimension 2n − r₁ − r₂. The correct dimension is r₁ + r₂ − n.

## E4. A sign in the proof of Lemma 5.4 (misprint)

The proof uses "tr(α) = −2(γ₁ + … + γ_n)". By the paper's own definition of the trace and (5.1), tr α = 2Σγ_i = 2 deg(C.H), which is what the mean inequality needs.

## E5. The threshold in Lemma 5.5(i) (error)

With n = 3 and H = X, condition (5.4) becomes p > 2c₁²(X)²/9, not the printed 2c₁²(X)/3. So the lemma's hypothesis p > c₁²(X) does not suffice once c₁² ≥ 5: for example c₁² = 6, p = 7. The lemma should also assume p > 2c₁²(X)²/9. This is implied by the hypothesis p > (128/9)c₁²(X)² of the main theorem, the only place the lemma is used.

## E6. λ may be 0 in Lemma 6.2 (misprint)

The proof says 0 < λ < 1, but M = 1 is allowed and gives λ = 0. The argument is unchanged.

## E7. Multiplication by m is not a finite difference (error)

§7 defines Ψ^{[m]} as the expansion of multiplication by m. It then cites Bourbaki for "no terms of degree < m" (Lemma 7.4) and builds Log = Σ ((−1)^m/m)Ψ^{[m]} and Exp = Σ (1/m!)(degree-m part of Ψ^{[m]}).

**Why this fails.**
- [2](t) = 2t + ⋯, so Lemma 7.4 fails.
- The Log series diverges in its linear term.
- The Exp series is wrong from degree 3. For the formal group with logarithm t + at² + bt³, its cubic coefficient is 6a² − 4b instead of 2a² − b.

**Repair.** Bourbaki's series are the m-th finite differences Σᵢ (−1)^{m−i} C(m,i)[i]. With these, and with the sign (−1)^{m−1}/m in Log, everything is right: exact computation recovers the logarithm and exponential. The estimates of Lemmas 7.5–7.7 then hold as written, so the main argument is unaffected.

## E8. H^n, not H³, in Lemma 9.3 (misprint)

In the case of an n-dimensional A, the equality of top self-intersections should read deg((H′)^n) = deg(H^n).

## E9. The proof of Lemma 9.7 assumes saturation (gap)

The proof picks primitive, K-independent v₁, v₂ in ker f ∩ R^n and argues that their reductions are independent. That argument assumes Rv₁ + Rv₂ is saturated. The vectors e₁ and e₁ + ϖe₂ are primitive and K-independent, yet have the same reduction. The fix is to take two members of a basis of the saturated lattice ker f ∩ R^n, a direct summand of rank n − 1.

## E10–E12. Three slips in §9 (misprints)

- **E10:** "Γ ∪ U_e ⊆ im(γ)" should be Γ ∩ U_e, as in Lemma 9.6.
- **E11:** Lemma 9.15's conclusion drops the leading 1 and the factor (1 − e/(p−1))^{−1} of Proposition 9.14.
- **E12:** (9.5) writes equalities where the residue-disk bounds give only ≤.

## E13. Corollary 10.5 fails for hyperelliptic genus 3 (error)

The corollary asserts that C^{(2)} has ample canonical divisor for every C of genus g ≥ 3, because "θ is ample".

**Why it fails.** For hyperelliptic C, j contracts the g¹₂-curve E ≅ P¹, so θ.E = 0. For g = 3, K ≡ θ, so K is not ample.

**What survives.** General type still holds, since θ is nef and big. Ampleness holds for C not hyperelliptic, which is the only case used, in Corollary 1.15.
