# Errata: Shende–Tsimerman, *Equidistribution in Bun₂(P¹)*

Vivek Shende and Jacob Tsimerman, *Equidistribution in Bun₂(P¹)*, [Duke Math. J. 166 (2017), no. 18, 3461–3504](https://doi.org/10.1215/00127094-2017-0025); arXiv [1307.8237](https://arxiv.org/abs/1307.8237).

Errata job `ERRATA-PAPER-SHENDE-TSIMERMAN-17` (issue #1856), by Claude Code, session `cc-39fac3`, 23 September 2026. The machine-readable list is [PAPER-SHENDE-TSIMERMAN-17.json](PAPER-SHENDE-TSIMERMAN-17.json): **28 findings**, 13 errors, 9 misprints and 6 gaps.

## What was read and where corrections were looked for

**The text read is arXiv v1.** The published article (44 pages) could not be read: Project Euclid served a bot check. The only arXiv version is v1 (31 July 2013, 40 pages), and it is what the authors link. Every locator below is therefore a v1 page, and every quotation was checked on a v1 page image.

**No existing correction was found:**

- Crossref records no update or erratum.
- arXiv has no later version.
- Sawin's later paper (arXiv 1907.04850v2, with an appendix by Tsimerman) proves Conjecture 1.4 in characteristic p and revisits the proof of Theorem 1.5, but acknowledges none of these points.

So every finding is `new`.

**Where the findings came from.** All 24 findings of the paper's extraction (PAPER-SHENDE-TSIMERMAN-17) were confirmed, some reclassified or narrowed. Four more were added:

- Theorem 1.3 fails for one parity;
- Theorem 1.5 is proved only in a restricted range;
- the inequality chain in Lemma 3.7 fails;
- Proposition 2.16's 'singular iff special'.

**One earlier claim is withdrawn:** that the constant 960 of Theorem 3.11 weakens to 3840. With the corrected factors in Lemma 3.22 and Proposition 3.23, the printed bounds still hold (checked exactly for g ≤ 25). Every finding was re-derived, and every counterexample was checked.

## What this does to the main results

**Theorems 1.1 and 4.2 (equidistribution for a fixed q).** They are unaffected in substance. The first proof needs the class-number asymptotic #J(F_q) = q^{g+o(g)}, which is used but not proved (E22). It also assumes a rational point where a degree-one divisor class suffices (E21). The hypothesis q > 4 comes from the introduction's sketch, which in fact gives q > 16 (E1). With the class-number estimate supplied, both theorems hold for every q.

**Theorem 1.3** is false as printed when r ≢ a + b (mod 2), and holds with that parity condition (E2).

**Theorem 1.5** is proved only for the line bundles covered by Theorem 3.11 (E3).
- The septuple formula of Corollary 2.18, used in the proof of Theorem 3.11, is wrong (E10).
- Massey's bound is quoted with the wrong sign convention (E15).
- The multiplicity estimates of Lemma 3.22 and Proposition 3.23 have factor slips, but their stated bounds survive (E18, E19).
- Sawin's Theorem 1.6 later covers every L. His Lemma 5.5 repeats the Lemma 3.22 slip, so by his own estimate his constant 28^g/16 becomes 32^g/16.

**§2 in characteristic p.**
- Proposition 2.3 and Corollary 2.4 fail when a weight is divisible by p. The counterexample is y² = x⁵ − x in characteristic 5 (E4, E5).
- Through Corollary 2.20 (E12), this leaves Theorem 3.9 and Case 2 of Theorem 4.4 unproved when p ≤ 2g − 2, which happens eventually for fixed q.
- The proof of Theorem 3.9 also has a boundary slip in its duality step (E14).

**Theorem 4.4.**
- Case 1 needs a positive-characteristic ergodic argument, uniform in a split place of growing degree, which is not supplied (E26). Sawin's Theorem 1.7 inherits this gap.
- Case 2 is affected as above.

## The findings

### E1 (error; affects nothing)

**Where:** §1, Introduction, sketch of the geometric proof of Theorem 1.1, p. 4 (arXiv v1).

**The paper says:** Bounding the total dimension of these by N^g establishes the result for all q > N; in this case we may take N = 4.

**Why it is wrong or incomplete:** The lower cohomology contributes O(N^g q^{g/2}) to a point count whose main term has size about q^g, so the error tends to 0 only when N/√q < 1, that is, q > N². The paper's own version of the argument (second proof of Theorem 4.2, p. 32) accordingly ends 'as soon as q > 16'; the hypothesis q > 4 of Theorem 4.2 appears to come from this sketch. Theorem 1.1 is not affected, because the first proof of Theorem 4.2 needs no condition on q (see the entry for pp. 30–31).

**Correction:** Bounding the total dimension of these by N^g establishes the result for all q > N²; with N = 4 this gives q > 16.

### E2 (error; affects a stated result)

**Where:** §1, Theorem 1.3, p. 5 (arXiv v1).

**The paper says:** Fix L ∈ J^{2g−a−b} and r > a + b. L ∉ Θ_r, we have H^i(Θ_{g−a} ∩ L − Θ_{g−b}, Q̄_ℓ) ≅ H^{i+2a+2b}(J, Q̄_ℓ)(a + b) for i > 2g − 2a − 2b − (r − a − b)/2

**Why it is wrong or incomplete:** Under the identification J^d ≅ J^{d+2} by κ, Θ_r only meets degrees ≡ r (mod 2), so for r ≢ a + b the hypothesis L ∉ Θ_r holds for every L, and the statement fails. For a = b ≥ 1, L = (g − a)κ and r = 2a + 1: every D of degree g − a satisfies (g − a)κ − D ~ τD, so Θ_{g−a} ∩ L − Θ_{g−b} = Θ_{g−a}, whose top cohomology H^{2g−2a} is nonzero, while i = 2g − 2a lies in the stated range and H^{2g+2a}(J) = 0. With the parity condition, L ∉ Θ_r gives e(L) ≤ g − (a + b + r)/2 − 1, and the statement follows from Theorem 3.9, even with the boundary correction to Theorem 3.9 recorded below. Theorem 4.4 uses Theorem 3.9 directly and is not affected.

**Correction:** Fix L ∈ J^{2g−a−b} and r > a + b with r ≡ a + b (mod 2). If L ∉ Θ_r, then H^i(Θ_{g−a} ∩ L − Θ_{g−b}, Q̄_ℓ) ≅ H^{i+2a+2b}(J, Q̄_ℓ)(a + b) for i > 2g − 2a − 2b − (r − a − b)/2. Equivalently, replace 'L ∉ Θ_r' by 'e(L) < (2g − a − b − r)/2'.

### E3 (gap; affects a stated result)

**Where:** §1, Theorem 1.5, p. 6, with §3, Theorem 3.11, p. 17 (arXiv v1).

**The paper says:** Theorem 1.5. Conjecture 1.4 holds in characteristic zero. … Theorem 3.11. Let C → P¹ be a hyperelliptic curve of genus g over ℂ. Then for L ∈ J^{2g−a−b} such that e(L) ≤ g − a − b, we have dim H^*(Θ_{g−a} ∩ L − Θ_{g−b}, Q) ≪_ε (960 + ε)^g.

**Why it is wrong or incomplete:** Conjecture 1.4 places no condition on L, but Theorem 3.11, the only proof offered for Theorem 1.5, assumes e(L) ≤ g − a − b and uses it throughout (expected dimension, Lemma 3.5, Corollary 3.6, and the restriction to J̃^{2g−a−b} in §3.2). On p. 32 the authors say only that they believe the statement without this assumption. Theorem 4.4 needs only the restricted form (Conjecture 4.3) and is not affected; Sawin (arXiv 1907.04850v2, Theorem 1.6) later states an exponential bound for every L in characteristic ≠ 2, without remarking on the restriction.

**Correction:** Theorem 1.5 should be restricted to the line bundles covered by Theorem 3.11: with a = 1 + 2c, b = 1 + 2d and L twisted by a power of κ to degree 2g − a − b, the bound of Conjecture 1.4 holds in characteristic zero for L with e(L) ≤ g − a − b (the form of Conjecture 4.3).

### E4 (error; affects a stated result)

**Where:** §2, Proposition 2.3, p. 7 (arXiv v1).

**The paper says:** Let p_1, …, p_n be distinct points such that dim H^0(C, O(Σ p_i)) = 1. Let d_1, …, d_n be any positive integers. Then any nontrivial deformation of (p_1, …, p_n) induces a nontrivial deformation of the line bundle O(Σ d_i p_i).

**Why it is wrong or incomplete:** The proof multiplies the tangent line at p_i by d_i; if char k = p divides d_i, multiplication by d_i on J has zero differential, so moving p_i alone gives a first-order trivial deformation of the line bundle. The failure is not only infinitesimal: the characteristic-5 family recorded under Corollary 2.4 moves (P, Q) nontrivially while O(5P + Q) stays constant and h^0(O(P + Q)) = 1. The paper applies §2 over F_q in §§3–4, so this matters, through Corollaries 2.4 and 2.20, for Theorems 3.9 and 4.4 (see those entries); Theorem 3.11 is over ℂ and is not affected.

**Correction:** Let d_1, …, d_n be positive integers that are nonzero in the ground field k (automatic in characteristic 0). Then the differential of (p_1, …, p_n) ↦ O(Σ d_i p_i) is injective; in general its rank is the number of i with d_i ≠ 0 in k.

### E5 (error; affects a stated result)

**Where:** §2, Corollary 2.4, p. 7 (arXiv v1).

**The paper says:** Let D_1, …, D_n be any divisors such that dim H^0(C, ⋃D_i) = 1, and let L be any line bundle. Then only finitely many points of |L| are of the form Σ n_i D_i.

**Why it is wrong or incomplete:** On C: y² = x⁵ − x over F̄_5 (genus 2), take P = (a, b) with b ≠ 0 and a²⁵ ≠ a, Q = (a²⁵, −b²⁵), t = x − a and G = b⁵y − (b⁶ + 2b⁴t + 3b²t² + 4t³). Then (b⁵y − H)(b⁵y + H) = t⁵(a²⁵ − a − t) on C, and G has a pole of order 6 at ∞, a zero of order 5 at P and a simple zero at Q, so div G = 5P + Q − 6∞; the identities were checked symbolically, and the zero set {P, Q} by enumeration over F_125 for all 120 admissible P. Since x(P) ≠ x(Q), h^0(O(P + Q)) = 1, yet the pairwise distinct divisors 5P + Q form a one-dimensional family in |6∞|. Corollary 2.4 is used only in Corollary 2.20; for the consequences for Theorems 3.9 and 4.4 see that entry.

**Correction:** The finiteness holds when every total weight (the coefficient of each point in Σ n_i D_i, with coincident points collected) is nonzero in the ground field, in particular in characteristic 0. In characteristic p it is false in general.

### E6 (misprint; affects nothing)

**Where:** §2, Corollary 2.9, p. 8 (arXiv v1).

**The paper says:** the Veronese embedding P¹ → PH^0(P¹, O_{P¹}(g))^∨ = P^{g−1}

**Why it is wrong or incomplete:** The canonical bundle is (g − 1)κ = π^*O(g − 1) (Lemma 2.7), and H^0(P¹, O(g)) has dimension g + 1, so its projectivized dual is P^g, not P^{g−1}. The rest of the statement, and its use in Lemma 2.11 (the rational normal curve in PT_0J = P^{g−1}), agree with O(g − 1). No theorem is affected.

**Correction:** the Veronese embedding P¹ → PH^0(P¹, O_{P¹}(g − 1))^∨ = P^{g−1}

### E7 (error; affects a stated result)

**Where:** §2, Proposition 2.15, p. 10 (arXiv v1).

**The paper says:** Proposition 2.15. C^{(d)} is the Nash blowup of Θ_d.

**Why it is wrong or incomplete:** The proof uses Lemma 2.11, which holds only for d < g, and the statement fails for d ≥ g ≥ 2. For d = g, Θ_g is the whole Jacobian, which is smooth and so is its own Nash blowup, while C^{(g)} → J contracts the fibres |D| ≅ P¹ over Θ_{g−2} + κ; for d > g, C^{(d)} has dimension d > g = dim Θ_d. The paper says the proposition is not used, so none of the main theorems is affected.

**Correction:** Proposition 2.15. For d < g, C^{(d)} is the Nash blowup of Θ_d.

### E8 (error; affects nothing)

**Where:** §2, Proposition 2.16, first sentence, p. 11 (arXiv v1).

**The paper says:** Then (D_1, D_2) is a singular point of the fibre containing it iff D_1 ∪ D_2 is special.

**Why it is wrong or incomplete:** A fibre of excess dimension can be smooth at a critical point. For a = b ≥ 1 and L = (g − a)κ, the fibre A̲^{−1}(L) contains {(D, τD)} ≅ C^{(g−a)}, of dimension g − a > g − 2a. At a general such point, D + τD is special and dA̲ has rank g − a by Lemma 2.1, so the tangent space of the fibre has dimension g − a and the fibre is smooth there. The later uses (Corollary 2.20, Lemma 3.7, Proposition 3.8) need only the statement about critical points, and use it where fibres have the expected dimension, so no theorem is affected.

**Correction:** Then (D_1, D_2) is a critical point of A̲ (dA̲ is not surjective there) iff D_1 ∪ D_2 is special; at points where the fibre has the expected dimension g − a − b, this is the same as being a singular point of the fibre.

### E9 (misprint; affects nothing)

**Where:** §2, proof of Proposition 2.16, p. 11 (arXiv v1).

**The paper says:** either the tangent map is surjective, or D_1 ∩ D_2 is special

**Why it is wrong or incomplete:** The proposition, and the equality just derived from Lemma 2.1 and Corollary 2.2, concern the union D_1 ∪ D_2; the intersection plays no role. No theorem is affected.

**Correction:** either the tangent map is surjective, or D_1 ∪ D_2 is special

### E10 (error; affects a stated result)

**Where:** §2, Corollary 2.18, p. 12 (arXiv v1).

**The paper says:** The dimension of the image of dA̲ at (D_1, D_2) can be expressed in terms of the canonical decomposition as min(g, (deg H_∩ + deg H_1 + deg H_2)/2 + deg S + deg R_∩ + deg R_1 + deg R_2)

**Why it is wrong or incomplete:** Let p be a Weierstrass point, D_1 = p and D_2 = 2p (g ≥ 2). Then H_2 = 2p, R_1 = p and all other pieces vanish, so the formula gives 2, but D_1 ∪ D_2 = 2p has h^0 = 2 and the rank is 2 + 1 − 2 = 1 by Lemma 2.1; D_1 = p, D_2 = p + τp with p not Weierstrass behaves the same way. The corollary is used in the proof of Lemma 3.17 to get deg H_1 + deg H_∩ + deg S ≤ 2(g − 1 − r), which can fail at critical points: for g = 3, D_1 = τp + q + τq, D_2 = p + τp + τq, the union is special but the left side is 2 and the right side 0 (checked by enumeration). So that step, and with it the proof of Theorem 3.11 as written, needs another argument; the statement of Theorem 1.5 is also covered by Sawin's later Theorem 1.6, whose proof does not use this corollary, and Theorems 1.1, 3.9, 4.2 and 4.4 do not use it.

**Correction:** The dimension is min(g, deg(D_1 ∪ D_2)^h/2 + deg(D_1 ∪ D_2)^r), as in Proposition 2.16. The septuple expression is not equal to it: it counts twice a point of D_1^r that lies in D_2^h (or of D_2^r in D_1^h).

### E11 (misprint; affects nothing)

**Where:** §2, remark after Definition 2.19, p. 12 (arXiv v1).

**The paper says:** In J^{2g−a−b}, we have e(L) ≥ (2g−a−b−1)/2.

**Why it is wrong or incomplete:** By Riemann–Roch h^0(κ^{−m}L) > 0 as soon as deg L − 2m ≥ g, and for a general L it vanishes once deg L − 2m < g, so a general L of degree 2g − a − b has e(L) = ⌊(g − a − b)/2⌋; for instance a general class of degree g has e(L) = 0, whereas the printed bound is positive for g ≥ 2. As printed, the inequality would also make the standing hypothesis e(L) ≤ g − a − b of §3 impossible whenever a + b ≥ 2, so 2g is a slip for g. The inequality is not used later, and no theorem is affected.

**Correction:** In J^{2g−a−b}, we have e(L) ≥ (g−a−b−1)/2 (indeed e(L) ≥ ⌊(g − a − b)/2⌋ by Riemann–Roch, and trivially e(L) ≤ ⌊(2g − a − b)/2⌋).

### E12 (gap; affects a stated result)

**Where:** §2, proof of Corollary 2.20, p. 12 (arXiv v1).

**The paper says:** On the other hand we have O(R_1 + R_2 + 2R_∩) = κ^{−m}L for some m ≤ e(L). By Corollary 2.4, only finitely many choices of the R· are possible.

**Why it is wrong or incomplete:** R_1, R_2 and R_∩ may be non-reduced (for instance D_1^r = 2p with p and τp not in D_2 gives R_1 ⊇ 2p), so the weights of R_1 + R_2 + 2R_∩ at its points can be any integers up to 2(g − 1), and Corollary 2.4 fails when such a weight is divisible by the characteristic (see the entry on Corollary 2.4). Since R_1 + R_2 + R_∩ has degree at most g − 1, all weights are at most 2g − 2, so the argument is valid for p > 2g − 2. Corollary 2.20 underlies Lemmas 3.5 and 3.7, Proposition 3.8 and Theorem 3.9 (hence Theorem 1.3); in Case 2 of Theorem 4.4 the field F_q is fixed while g → ∞, so p ≤ 2g − 2 eventually and that case is not proved as written, whereas Theorem 3.11 (over ℂ) and Theorems 1.1 and 4.2 are unaffected.

**Correction:** The finiteness follows from the corrected Corollary 2.4 when every point of R_1 + R_2 + R_∩ has multiplicity in R_1 + R_2 + 2R_∩ nonzero in k, in particular in characteristic 0 or in characteristic p > 2g − 2. In characteristic p ≤ 2g − 2 another argument is needed; until one is given, Corollary 2.20 is proved only in those characteristics.

### E13 (error; affects the proof)

**Where:** §3, proof of Lemma 3.7, pp. 15–16 (arXiv v1).

**The paper says:** e(L − (r + s)κ) = e(L) − l − r ≤ g − a − 2l − b − 2r ⟺ e(L) ≤ g − a − b − l − r … On the other hand, if the inequality fails to hold, then e(L) > g − a − b − l − r ≥ ((g − 2a − 2l) + (g − 2b − 2r))/2 ≥ min(dim Θ_{g−2a−2l}, dim Θ_{g−2b−2r}) ≥ dim Θ_{g−2a−2l} ∩ L − Θ_{g−2b−2r}

**Why it is wrong or incomplete:** The strata of the lemma are Θ_{g−a−2l} ∩ L − Θ_{g−b−2r}, not Θ_{g−2a−2l} ∩ L − Θ_{g−2b−2r}. With the correct indices the second inequality would read g − a − b − l − r ≥ g − (a + b)/2 − l − r, which is false whenever a + b > 0, so the displayed chain does not bound the dimension of the strata. The lemma itself holds by the argument above, subject to Corollary 2.20 and its characteristic restriction, so Proposition 3.8 and Theorem 3.9 are affected no further.

**Correction:** Read e(L − (l + r)κ) = e(L) − l − r. If e(L) > g − a − b − l − r, the stratum in question is Θ_{g−a−2l} ∩ L′ − Θ_{g−b−2r} with L′ = L − (l + r)κ and e(L′) > g − (a + 2l) − (b + 2r); Corollary 2.20 applied to (a + 2l, b + 2r, L′) bounds the fibre over L′, and hence this stratum, by dimension e(L′) = e(L) − l − r < e(L) when l + r ≥ 1.

### E14 (gap; affects a stated result)

**Where:** §3, proof of Theorem 3.9, pp. 16–17 (arXiv v1).

**The paper says:** H^{i−(g−a−b)}(Θ_{g−a} ∩ L − Θ_{g−b}, Q̄_ℓ) ≅ IH^i(Θ_{g−a} ∩ L − Θ_{g−b}) for i ∉ [−e − 1, e]. Corollary 3.6 identifies H^{<g−a−b}(Θ_{g−a} ∩ L − Θ_{g−b}, Q̄_ℓ) with the corresponding cohomology groups of J. Poincaré duality of the intersection cohomology gives the desired result.

**Why it is wrong or incomplete:** Put n = g − a − b and X = Θ_{g−a} ∩ L − Θ_{g−b}. The kernel F of Q̄_ℓ[n] → IC_X has hypercohomology in degrees [−e, e], so H^{k+n}(X) ≅ IH^k(X) exactly for k ∉ [−e − 1, e]. For k = e + 1, IH^{e+1} is dual to IH^{−e−1}, which only contains H^{n−e−1}(X), with cokernel inside H^{−e}(X, F), a group that need not vanish. Theorem 1.3 (with r ≡ a + b mod 2) still follows, since there e(L) ≤ g − (a + b + r)/2 − 1, and in Case 2 of Theorem 4.4 the extra degree changes the error term only by a factor √q, which does not affect the limit.

**Correction:** Read H^{i+(g−a−b)}(Θ_{g−a} ∩ L − Θ_{g−b}, Q̄_ℓ) ≅ IH^i(Θ_{g−a} ∩ L − Θ_{g−b}) for i ∉ [−e − 1, e]. Duality then needs both i and −i outside [−e − 1, e], so the argument proves Theorem 3.9 for i > g − a − b + e(L) + 1; the degree i = g − a − b + e(L) + 1 needs a separate argument.

### E15 (error; affects a stated result)

**Where:** §3, Theorem 3.12 (Massey), p. 18 (arXiv v1).

**The paper says:** Expand the stalk Euler characteristics in the basis of Euler obstructions, that is, determine the varieties V_α and coefficients n_α so that for all p ∈ Y the following holds: χ(K_p) = Σ_α n_α Eu_{V_α}(p). Then for all p ∈ Y, dim H^{−i}(K_p, Q) ≤ Σ_α n_α γ^i_{V_α}(p)

**Why it is wrong or incomplete:** For K = Q_C[1] on a smooth complex curve C, χ(K_p) = −1 for all p, so the expansion is n = −1 with V = C, and γ^1_C(p) = mult_p C = 1; the printed inequality reads 1 ≤ −1, and the same happens for Q_Y[d] on any smooth Y of odd dimension d. By the index formula n_α is (−1)^{dim V_α} times the characteristic-cycle multiplicity, which is nonnegative for perverse K, and Massey's bound is in terms of the latter. The proof of Theorem 3.11 only uses bounds on |n_α|, so Theorems 3.11 and 1.5 are not affected.

**Correction:** Then for all p ∈ Y, dim H^{−i}(K_p, Q) ≤ Σ_α (−1)^{dim V_α} n_α γ^i_{V_α}(p), where the numbers (−1)^{dim V_α} n_α ≥ 0 are the multiplicities of the characteristic cycle of K; in particular the bound holds with |n_α| in place of n_α.

### E16 (misprint; affects nothing)

**Where:** §3.2, motivic decomposition and its inversion before (3), p. 19 (arXiv v1).

**The paper says:** [A̲^{a,b}] = Σ_{l,r≥0} L^{r+s}[Σ^{a−2l,b−2r}] … A̲^{a,b}_* Q = Σ_{l,r≥0} Σ^{a−2l,b−2r}_* Q[−2r − 2s](−r − s) … [Σ^{a,b}] = [A̲^{a,b}] − L[A̲^{a+2,b}] − [A̲^{a,b+2}] + L²[A̲^{a+2,b+2}]

**Why it is wrong or incomplete:** The Abel map C^{(g−a)} → Θ_{g−a} has fibre P^l over the open stratum of Θ_{g−a−2l} = Θ_{g−(a+2l)}, so the upper index increases, and [P^l] = 1 + L + … + L^l gives [C^{(g−a)}] = Σ_l L^l[Θ_{g−a−2l}]. Inverting the product of the two geometric series gives the corrected formula, which is the one consistent with the indices a + 2, b + 2 already used in the printed inversion (checked symbolically). The identity (3) for constructible functions, obtained by setting L = 1, is correct as printed, so nothing downstream is affected.

**Correction:** [A̲^{a,b}] = Σ_{l,r≥0} L^{l+r}[Σ^{a+2l,b+2r}], A̲^{a,b}_* Q = ⊕_{l,r≥0} Σ^{a+2l,b+2r}_* Q[−2l − 2r](−l − r), and [Σ^{a,b}] = [A̲^{a,b}] − L[A̲^{a+2,b}] − L[A̲^{a,b+2}] + L²[A̲^{a+2,b+2}].

### E17 (misprint; affects nothing)

**Where:** §3.5, Lemma 3.21, p. 26 (arXiv v1).

**The paper says:** For L ⊂ B, we have P′_L V_{r,s} ⊂ P_L V_{r,s}, and moreover for generic L we have equality.

**Why it is wrong or incomplete:** B lies in (C/τ)^{(g−1)} ≅ PT_0J^∨, where the annihilator L^∨ lives, not in T_0J, which contains L. The proof explicitly treats the case 'L^∨ ⊄ B', using that σ^{−1}(L^∨ ∖ B) is dense in σ^{−1}(L^∨). Nothing downstream is affected.

**Correction:** For L^∨ ⊄ B, we have P′_L V_{r,s} ⊂ P_L V_{r,s}, and moreover for generic L we have equality.

### E18 (error; affects a stated result)

**Where:** §3.5, Lemma 3.22 and its proof, p. 27 (arXiv v1).

**The paper says:** (π_{r,s})_*([C^{(t)}] ⊠ [C^{(u)}]) = Σ_*(A_*[C^{(t)}] ⊠ 2A_*[C^{(u)}]) = 2^u Σ_*([Θ_t] ⊠ [Θ_u]) = 2^u binom(t+u, u)[Θ_{t+u}] … c_{k,r,s} = Σ_{a+b=k−(g−1−r−s), a≤r, b≤s} 2^{a+b} (k; a, b, g−1−r−s) 2^{s−b} binom(r+s−a−b, r−a) ≤ g²24^g

**Why it is wrong or incomplete:** Multiplication by 2 acts on H_1(J) by 2, hence on the class of a u-dimensional cycle by 4^u, and it is generically injective on Θ_u for u < g, so [2Θ_u] = 4^u[Θ_u]; for r = 0, s = 1, k = g − 2 the polar locus is the curve 2C, of class 4[C], while the printed formula gives 2. Writing c_{k,r,s} = 2^m binom(k, c_0) 4^{s−m} [x^r](1 + 4x)^m(1 + x)^{g−1−k}, with m = a + b and c_0 = g − 1 − r − s, and evaluating at x = 1 gives c_{k,r,s} ≤ 2^{g−1}·4^s·(5/2)^m ≤ 20^{g−1} (checked exactly for g ≤ 25). So only the displayed formula is wrong: Proposition 3.23 and the constant 960 of Theorem 3.11 (hence Theorem 1.5) are not affected, but Sawin's Lemma 5.5 (arXiv 1907.04850v2, p. 20) quotes this lemma with the same factor 2^{w_2−d}, and the same estimate then turns his 28^g/16 into 32^g/16.

**Correction:** (π_{r,s})_*([C^{(t)}] ⊠ [C^{(u)}]) = 4^u binom(t+u, u)[Θ_{t+u}], so c_{k,r,s} = Σ 2^{a+b} (k; a, b, g−1−r−s) 4^{s−b} binom(r+s−a−b, r−a). The bound c_{k,r,s} ≤ g²24^g remains true; in fact c_{k,r,s} ≤ 20^{g−1}.

### E19 (error; affects the proof)

**Where:** §3.5, proof of Proposition 3.23, pp. 27–28 (arXiv v1).

**The paper says:** mult_E(V_{r,s}) ≤ [E − L + ½Θ_{g−r−s}] ∩ [P′_L V_{r,s}] ≤ 2^g[Θ_{k+1}] ∩ c_{dim L,r,s}[Θ_{g−1−k}] ≤ g²96^g.

**Why it is wrong or incomplete:** ½Θ_{k+1} = [2]^{−1}(Θ_{k+1}) has class [2]^*[Θ_{k+1}], and [2]^* multiplies H^{2c}(J) by 4^c, where c = g − k − 1 is the codimension of Θ_{k+1}; so the factor is 4^{g−k−1}, which exceeds 2^g when k < g/2 − 1. The subscript g − r − s and the multiplicity of V_{r,s} are slips for k + 1 and for the polar variety. With the corrected factors, the estimate of Lemma 3.22 gives 4^{g−k−1} c_{k,r,s} binom(g, k+1) ≤ 2^{2g−1}·4^{g−1−k}·(5/2)^m·4^s ≤ 64^g/32 (checked exactly for g ≤ 25). So the stated bound, and with it the constant 960 of Theorem 3.11 and Theorem 1.5, survive.

**Correction:** mult_E(P_L V_{r,s}) ≤ [E − L + ½Θ_{k+1}] ∩ [P′_L V_{r,s}] = 4^{g−k−1}[Θ_{k+1}] ∩ c_{k,r,s}[Θ_{g−1−k}] = 4^{g−k−1} c_{k,r,s} binom(g, k+1) ≤ 64^g/32 ≤ g²96^g, with c_{k,r,s} as corrected in Lemma 3.22; likewise Q should be a general point of Θ_{k+1}.

### E20 (gap; affects the proof)

**Where:** §3.5, proof of Proposition 3.23, p. 28 (arXiv v1).

**The paper says:** we have a proper surjective map (½C)^{g−t−u} → ½Θ_{g−t−u} ⊃ X and so may lift φ to (f_1, …, f_{g−t−u}): X̃ → (½C)^{g−t−u}. Similarly we may lift φ to (g_1, …, g_t; h_1, …, h_u): X̃ → C^t × C^u.

**Why it is wrong or incomplete:** A proper surjective map need not have a section over a given curve, so the lifts need not exist on X̃ itself. After a finite base change they do, relations (4) and (5) hold on the cover, and since the work is over ℂ a nonconstant f_1 still has df_1 ≠ 0 on a dense open set, so the rest of the argument is unchanged. Proposition 3.23 and Theorem 3.11 are not affected.

**Correction:** Replace X̃ by a finite cover over which the lifts exist, namely the normalization of a component, dominating X̃, of the fibre products of X̃ with (½C)^{g−t−u} → ½Θ_{g−t−u} and with C^t × C^u → V_{t,u}, and run the argument there.

### E21 (error; affects the proof)

**Where:** §4, proof of Theorem 4.2, p. 30 (arXiv v1).

**The paper says:** For d = 1 this is just the statement that 1/2 = μ_i(1 + 2N) = μ(J^{g−2}(C)), which holds because C has a point over F_q.

**Why it is wrong or incomplete:** Curves over F_q need not have rational points: for q = 5 and m not divisible by 5, y² = 2((x⁵ − x)^{2m} + 1) is a smooth hyperelliptic curve of genus 5m − 1 without F_5-points, since the right side equals the non-square 2 at every x ∈ F_5 and has non-square leading coefficient and even degree (checked by computer for m = 1, 2, 3; m = 1 gives genus 4). These curves form a sequence of the kind allowed in Theorem 4.2, with q = 5 > 4. The conclusion μ_i(1 + 2N) = 1/2 is nevertheless true, so Theorems 1.1 and 4.2 are not affected.

**Correction:** …, which holds because C has a divisor class of degree one over F_q (F. K. Schmidt; equivalently, Pic^1_C has a rational point by Lang's theorem), so Pic(C)/π^*Pic(P¹) has equally many classes of each parity.

### E22 (gap; affects the proof)

**Where:** §4, Theorem 4.2 and its first proof, pp. 30–31 (arXiv v1); cf. Theorem 1.1, p. 3.

**The paper says:** Theorem 4.2. Assume q > 4; we work over F_q. … = #J(F_q) · (q^{n−g}(1 − q^{−2}) + o(q^{−g/2+ε·g}))

**Why it is wrong or incomplete:** The contour integral gives an absolute error O_ε(q^{n/2+εg}); dividing by #J(F_q) = q^g P_C(q^{−1}) needs a lower bound for P_C(q^{−1}), which the proof does not give (the cited estimate is on the circle |t| = q^{−1/2}, not at t = q^{−1}), and Weil's bound #J(F_q) ≥ (√q − 1)^{2g} alone only suffices for q ≥ 7. Theorem 1.1 is stated for every q, while Theorem 4.2, its proof, assumes q > 4, a threshold that neither proof produces (the second needs q > 16). Once the class-number estimate is supplied, Theorems 1.1 and 4.2 hold for every q; Theorem 4.4 is not affected.

**Correction:** The last step needs #J(F_q) = q^{g+o(g)} as g → ∞, which should be stated and proved: from log P_C(q^{−1}) = Σ_{k≥1} (#C(F_{q^k}) − q^k − 1)/(k q^k), the bound #C(F_{q^k}) ≤ 2(q^k + 1) for small k and Weil's bound for large k give log P_C(q^{−1}) = O(log g). With this the first proof works for every q, so the hypothesis q > 4 can be dropped from Theorem 4.2, in agreement with Theorem 1.1.

### E23 (misprint; affects nothing)

**Where:** §4, first proof of Theorem 4.2, display after (7), p. 31 (arXiv v1).

**The paper says:** = O_ε(q^{(n/2+ε)·g}) + q^n(1 + q^{−1})(1 − q^{−1})P(q^{−1})

**Why it is wrong or incomplete:** On |t| = q^{−1/2} the factor t^{−n−1} has size q^{(n+1)/2}, and the rest of the integrand is O_ε(q^{εg}), so the integral is O_ε(q^{n/2+εg}); the printed q^{(n/2+ε)g} would swamp the main term and could not give the next line. The next line agrees with the corrected exponent, given the class-number estimate of the previous entry, so nothing else is affected.

**Correction:** = O_ε(q^{n/2+ε·g}) + q^n(1 + q^{−1})(1 − q^{−1})P(q^{−1})

### E24 (misprint; affects nothing)

**Where:** §4, remark after Conjecture 4.3, p. 32 (arXiv v1).

**The paper says:** Note that in Theorem 3.11, we established this statement for hyperelliptic curves over C, with N = 960.

**Why it is wrong or incomplete:** Theorem 3.11 gives dim H^* ≪_ε (960 + ε)^g, which yields dim H^* < N^g for large g whenever N > 960, but not for N = 960 itself. Theorem 4.4 only needs some N (and then q > N^4), so nothing is affected; the constant 960 is not changed by the corrections to Lemma 3.22 and Proposition 3.23 above.

**Correction:** Note that in Theorem 3.11, we established this statement for hyperelliptic curves over ℂ, with any N > 960.

### E25 (misprint; affects nothing)

**Where:** §4, proof of Theorem 4.4, p. 33 (arXiv v1).

**The paper says:** μ_i((a + 1 + 2N) × (b + 1 + 2N)) = #(Θ_{g−a} ∩ M_i − Θ_{g−b})(F_q)

**Why it is wrong or incomplete:** μ_i is the uniform probability measure on Pic(C_i)/π_i^*Pic(P¹), which has 2·#J(F_q) elements, whereas the right side is a point count of order q^{g−a−b}. The normalization used later in Case 2 (dividing by #J(F_q) after conditioning on a parity class of mass 1/2) is the correct one, so nothing downstream is affected.

**Correction:** μ_i((a + 1 + 2N) × (b + 1 + 2N)) = #(Θ_{g−a} ∩ M_i − Θ_{g−b})(F_q) / (2·#J(F_q)), with M_i twisted by a power of κ to degree 2g − a − b.

### E26 (gap; affects a stated result)

**Where:** §4, proof of Theorem 4.4, Case 1, pp. 33–34 (arXiv v1).

**The paper says:** The desired statement, including the claim about the measures μ_D, is the exact analogue in the function field case of the Corollary in [[EMiV], §10.3] and the ensuing remark, and the proof carries over. … since the Weil conjectures guarantee that some point v ∈ P¹ of degree at most 2 log(g_i) splits in C_i, and this suffices for the proof [Lin].

**Why it is wrong or incomplete:** In [EMiV] the split prime is fixed (hence the condition d ≡ ±1 mod 5), whereas here the place v changes with i and has degree up to about 2 log g_i, and the only justification offered for this change is a private communication ([Lin], Lindenstrauss). The analytic route sketched in the Remark is said by the authors to need a Waldspurger formula that is not available in sufficient generality. Case 1 covers every sequence with M_i ∈ Θ_{εg}, including the bounded-ratio sequences behind the μ_D alternative, so this part of Theorem 4.4 rests on it, and Sawin's Theorem 1.7 (arXiv 1907.04850v2), which invokes Theorem 4.4, inherits the gap; Theorems 1.1, 3.9, 3.11 and 4.2 are not affected.

**Correction:** Case 1 (M_i ∈ Θ_{εg(C_i)}) needs a proof: a positive-characteristic version of the Ellenberg–Michel–Venkatesh ergodic argument, uniform in a split place v whose degree grows with g_i. Until one is given, Theorem 4.4 is proved only for sequences with M_i ∉ Θ_{εg(C_i)} (Case 2), and the μ_D alternative is unproved.

### E27 (error; affects nothing)

**Where:** Appendix A.2, p. 37 (arXiv v1); also §1, p. 3.

**The paper says:** Since T is a torus there is a unique maximal compact subgroup T(O) < T(A_k). … Pic(D)/π^*Pic(C) = X_T/T(O) → X_{PGL_2}/PGL_2(O) = Bun_{PGL_2}(C). That is, we want g^{−1}T(O)g ⊂ PGL_2(O). The γ constructed above is such an element. [p. 3:] and g is chosen such that gG(O)g^{−1} ∩ H is a maximal compact in H.

**Why it is wrong or incomplete:** If l_v = k_v(√π) is ramified, T(k_v) = l_v^×/k_v^× is compact and contains the class of √π, whose matrix [[0, π], [1, 0]] in the basis (1, √π) has determinant of odd valuation; conjugation preserves the determinant and scaling changes its valuation by an even number, so this class lies in no conjugate of PGL_2(O_v). Moreover l_v^×/(k_v^× O_{l,v}^×) ≅ Z/2, so X_T/T(O) is the quotient of Pic(D)/π^*Pic(C) by the classes of the ramification points (a ramification point of odd degree even merges the two parity classes), and a hyperelliptic cover always ramifies. The theorems are stated and proved directly for Pic(C)/π^*Pic(P¹), so Theorems 1.1, 4.2 and 4.4 are unaffected; only the adelic reformulation, and the adelic language invoked in Case 1 of Theorem 4.4, must use U.

**Correction:** Replace the maximal compact subgroup by the image U of Π_v O_{l,v}^× in T(A_k): Pic(D)/π^*Pic(C) = X_T/U and γ^{−1}Uγ ⊂ PGL_2(O). At each place v ramified in l, U_v has index 2 in the compact group T(k_v), and no conjugate of T(k_v) lies in PGL_2(O_v). Correspondingly, on p. 3, gG(O)g^{−1} ∩ H should be the unit subgroup U, not a maximal compact subgroup.

### E28 (misprint; affects nothing)

**Where:** Appendix A.3, pp. 37–38 (arXiv v1).

**The paper says:** the “pushforward” map ρ_γ : X_T ↪ X_{GL_2} induced by γ. … the space X_T parameterizes isomorphism classes of: a line bundle L on D, together with, for each place of k, a framing of the completed stalk O_{l,v} → L|_{π^{−1}(v)}.

**Why it is wrong or incomplete:** A.2 defines T = (Res_{l/k} G_m)/G_m, which has no canonical homomorphism to GL_2, and the space of line bundles on D framed at every place is l^×\A_l^×, not T(k)\T(A_k). Passing to the quotient by the central G_m recovers the PGL_2 statement of A.2, so nothing is affected.

**Correction:** Throughout A.3, X_T should be X_{T′} with T′ = Res_{l/k} G_m, so X_{T′} = l^×\A_l^×: framed line bundles on D form X_{T′}, and T′ → GL_2 induces ρ_γ : X_{T′} → X_{GL_2}. The torus T = T′/G_m of A.2 maps only to PGL_2.
