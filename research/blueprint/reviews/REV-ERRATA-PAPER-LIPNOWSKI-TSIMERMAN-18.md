# Independent errata review: Lipnowski–Tsimerman

Job `REV-ERRATA-PAPER-LIPNOWSKI-TSIMERMAN-18`; issue #1854. Reviewer: Codex, session `codex-hjdg0j`, 23 September 2026. Original errata: Claude Code, session `cc-39fac3`. This session did not write the extraction or errata.

The review is complete for the identified arXiv-v1 findings: **21 of the 22 inherited findings confirmed, E21 rejected; four findings added (E23–E26)**. There are 25 confirmations in total. Confirmation certifies the precise passage in the version read, not the unread journal text or every theorem of the paper. E2–E5 and E9–E11 now name later corrected computations instead of being advertised as new. Several reaches have been narrowed from a stated result to its proof. E16 has a concrete repair from the paper’s own estimates. The unrestricted quaternion polarization bound in E19 remains an identified mathematical gap.

## Versions, access and correction search

The primary text is the 38-page [arXiv v1](https://arxiv.org/pdf/1511.02212v1), dated 6 November 2015. Its formulas, theorem hypotheses and surrounding arguments were read; critical displayed formulas on pp. 5, 7, 10–11, 14, 17, 19, 27, 29–30, 33–34 and 36 were also inspected as page images. The paper was published in Duke Mathematical Journal 167 (2018), 3403–3453, [DOI](https://doi.org/10.1215/00127094-2018-0029). Project Euclid’s download, PDF and full-text routes returned HTML challenges. **The 51-page published version has not been collated.** No claim below that is labelled v1 should be read as a claim that the journal retained it.

[Lee v3](https://arxiv.org/pdf/2002.04420v3), §§3.1–3.3, explicitly corrects the published LT upper-bound argument. Its §3.1 identifies the doubled discriminant exponents and retains the fixed-prime powers of 2; its §3.3 displays the correct quadratic filtration factor and residue-degree count, citing the later published LT proof. This establishes that several recorded corrections are already in the literature and gives evidence that v1 differs materially from the journal. Lee’s work is published in IMRN 2022, 4290–4317, [DOI](https://doi.org/10.1093/imrn/rnaa153); the accessible v3, not the IMRN typeset file, was read.

The author pages, arXiv history, Crossref DOI record and targeted title/author searches were also checked. No additional correction was found. `known: new` means only that this bounded search found none for the specified v1 passage. It does not establish novelty or persistence in print.

Supporting primary sources read were [Yun v2](https://arxiv.org/pdf/1303.2420v2), §§4.9–4.13, and [Cheong–Huang’s published PDF](https://yifeng-huang-math.github.io/files/paper_cohen_lenstra.pdf), Theorem 2.10 and its context, Illinois Journal of Mathematics 65 (2021), 385–415, [DOI](https://doi.org/10.1215/00192082-8939615).

All fetched files stayed in scratch. Access date for the following SHA-256 hashes is 2026-09-23:

| Source | SHA-256 |
| --- | --- |
| arxiv-v1.pdf | `5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a` |
| lee-v3.pdf | `2521898dfcd96c22950c026058b0b4e68e147aa89989964649eb317718fbbd3b` |
| yun-v2.pdf | `a9f560f9c7ed334ff4895cde2676476cd430e0efa7c14e3d6d508df5326bc347` |
| cheong-huang.pdf | `9e1bf4f633406460c2dc818eaa91d866f5491a7c432bac318ee391841968384e` |

## Independent calculations and repairs

For E1, smooth curves with generalized Weierstrass coefficients `(a1,a2,a3,a4,a6)` over F₂ realizing traces −2,−1,0,1,2 are respectively `(0,0,1,1,0)`, `(1,0,0,0,1)`, `(0,0,1,0,0)`, `(1,0,1,0,1)`, `(0,0,1,1,1)`. Direct enumeration verifies smoothness by the discriminant and counts affine points plus infinity. Distinct traces imply distinct isogeny classes. The six integer quadratic polynomials in E1 therefore disprove the literal lemma, and the five traces separately disprove the literal corollary. Newton sums have 2g terms; counting integer values in their intervals gives the replacement bound, while the sign of the constant term distinguishes reciprocal from anti-reciprocal polynomials.

For E2–E4, it is essential to count **centralizer orbits**. A raw lattice count of ℓ^{4nδ} is false even for a discrete valuation ring, where there is just one orbit. For n=17 and residue field F₃, the exact Gaussian-binomial sum is 89478415088556766546699920236339712, with base-3 logarithm 73.25542079. The claimed upper bound in the paper is only 3⁶⁸. After correcting the filtration exponent, the coefficient-ring argument and stars-and-bars, the orbit representative bound is

`ℓ^{n(n−1)δ/2} · ℓ^{nδ} · 2^{2nδ+n} ≤ ℓ^{4n²δ}`

for δ≥1; δ=0 gives one. The first factor counts successive shear classes. Ideals of Z_ℓ-colength j have no representatives unless the residue degree s divides j; Yun’s power-series formula over W(F_{ℓ^s}) bounds the number by ℓ^j 2^j. Finally `C(nδ+n,n)≤2^{nδ+n}`. Since `n(n−1)/2+4n≤4n²`, the displayed bound holds even at ℓ=2. E23 supplies the correct gluing among distinct isotypic factors. Thus the coarse quadratic-exponent strategy is repairable; the literal linear-exponent chains are not certified.

For E5/E9/E10/E11, Lee’s combined corrected bound is

`B(p,g) ≤ 2^{34g²} p^{(69/4)g²(1+o(1))}`.

His later refinement gives exponent 45/4 without that leading power of 2. These are replacement upper bounds, not counterexamples to the old exponent 17/2. The independent discriminant counterexamples concern the actual false intermediate formulas: 19⁴>400 in E5 and 8>2√2 in E9.

For E6, the example now lies in the prime-field setting: `y²=x³+2x` over F₁₃ has ten points and Frobenius polynomial `x²−4x+13`. At ℓ=3 its order is Z₃[3i]. The representatives ±1 of the same orbit point induce different maps on i modulo that order, proving failure of well-definedness. A map from the **group** followed by a surjection to its orbit yields the original bound. For E7, the subgroup congruent to 1 modulo f′(θ)O_F fixes M in both directions, and its index is at most ℓ^{δn²}; no doubtful product of Haar indices is needed.

For E8/E24, splitting a quaternion algebra over Q(√p) produces GL_{2d} over that quadratic field. Its rational reduced norms are totally positive, so strong approximation gives a **narrow** class group. At p=3, ordinary class number one follows from the Minkowski bound, while the negative Pell equation has no solution modulo 3, proving narrow class number two. This only changes the fixed-p constant. It cannot be fixed by an isomorphism with GL_{4d} over Q, whose dimension is twice as large.

For E12–E15/E25, the normalizations must be kept consistent. The graph pullback of the Poincaré bundle has NS class 2[L]. With `Φ_f=½f⁻¹φ`, the rational inverse is `a↦D_f(a,1)` on selfadjoint elements, and `Φ_f(L₀)=1/2`. This explains both the missing rationalization and the factor two needed in the sum-of-squares proof. On a principally polarized elliptic curve, a=1/3 is a direct counterexample to the literal integral version of Proposition 4.9. The reduced trace correction and the relative discriminant correction follow by evaluating at the identity and by the quadratic discriminant formula, respectively.

For E16, write κ_F=Res ζ_F. The paper’s own equations (22)–(23), together with h_F≥1, give `κ_F≥1/(500√|D_F|)`. For F=Q use κ_Q=1. The discriminant bounds give `log |D_F|=O_p(d²)` for F=K,L, while (24) gives an upper bound `log κ_F≤O_p(d log(2d))`. Consequently `|log(κ_L/κ_K)|=O_p(d²)`, sufficient for (50). The original `O(d log d)` inference is still unsupported. This repair does not require conjectural lower bounds for L-values.

For E17, summing `log Γ(j)` yields `½n²log n−¾n²+O(n log n)`. Numerical ratios to n²log n at n=100,1000,10000 are 0.3391,0.3916,0.4186, consistent with the analytic coefficient 1/2; the analytic summation is the proof. The CM bad-locus estimate can use threshold 0.495 because `½(0.99²+0.01²)=0.4901<0.495<0.5`. This repairs that separation argument. It does not supply the omitted quaternion estimate in E19. Likewise, the repaired zero-spacing bound in E20 is a limiting consequence only, still conditional on resolving that omission.

For E22, explicit arithmetic in F₄=F₂[u]/(u²+u+1) gives `(2,8)` and `(4,8)` for the two curves over F₂ and F₄. Their discriminants are −557 and −433. At p≥5 the Hasse interval forces the p-group over F_p to have order p; then the F_{p²} order is p(p+2). At p=3 the only p-power orders in the first interval are 1 and 3, giving F₉ orders 7 and 15. Thus the lemma is valid for odd primes and false at 2. A failure of this lemma at 2 does not alone disprove Corollary 5.20.

## E21: why the probability distribution exists

The inherited entry asserted that Definition 5.16 and Conjecture 5.18 were not well posed, and proposed replacing the limit by a liminf. That replacement need not have total mass one and is withdrawn. The following argument supplies the missing explanation of the definition.

Fix the positive integers n₁,…,n_k and a prime ℓ. Let S be the finite set of distinct monic irreducible factors of the reduction modulo ℓ of `∏_j(1−t^{n_j})`. For a matrix F, decompose its reduction into its S-primary part and its complementary part. Cheong–Huang Theorem 2.10 gives joint convergence of the finitely many primary module types to the product of their normalized Cohen–Lenstra laws. These limits sum to one. Pointwise convergence on this countable set to a probability law therefore implies total-variation convergence, so there is no escape of mass in the relevant block dimensions.

For completeness, the lift from finite-field types to integral matrices is independent of the ambient dimension. Fix a representative `diag(B₀,C₀)` of a reduced matrix with disjoint characteristic-polynomial factors, and work modulo ℓ^a. Every lift has unique invariant summands lifting these two reduced summands: lift the corresponding coprime-factor idempotents, or solve the off-diagonal Sylvester equations inductively. At each lifting step the maps `X↦B₀X−XC₀` and `Y↦C₀Y−YB₀` are invertible over F_ℓ, because the spectra are disjoint. Thus a lift is parameterized by an invariant splitting lifting the standard one and two block lifts. The number of splittings is independent of the block entries. Uniform lifts consequently give independent uniform block lifts. Passing through a→∞ gives Haar lifts of B₀ and C₀. Changing the reduced representative by conjugacy does not change the cokernels. In particular, conditional on the S-primary type, the law of its lifted block depends only on that finite type, not on the complementary dimension.

Every `1−C^{n_j}` is invertible on the complementary block, since it already is modulo ℓ. All the cokernels thus come from the finite S-primary block B. For each fixed block dimension and congruence class, `det(1−B^{n_j})` is a nonzero polynomial on the ℓ-adic matrix space and its zero set has Haar measure zero. Indeed a nonzero polynomial over Q_ℓ cannot vanish on an open congruence class; the measure-zero assertion follows by induction on the number of variables. Almost surely all k cokernels are therefore finite. This defines a probability kernel from reduced primary types to tuples of finite abelian ℓ-groups. Applying one fixed probability kernel cannot increase total-variation distance. The converging primary-type laws hence give a limiting law of total mass one for the whole tuple in Definition 5.16.

This argument requires no squarefreeness of the polynomials `1−t^{n_j}`: all repeated and shared factors are kept together in the S-primary block, so it also covers ℓ dividing some n_j. Cheong–Huang’s theorem is invoked only for the distinct irreducible primary factors over the finite field, not misapplied as an integral polynomial-cokernel theorem.

For the event actually used in Example 5.17, no lifting is needed. At odd ℓ the condition is absence of the two primary components t−1 and t+1, so Theorem 2.10 gives `∏_{i≥1}(1−ℓ^{−i})²`. At ℓ=2 there is one such component and the limit is `∏_{i≥1}(1−2^{−i})`. Both are positive. The paper’s union-bound lower estimate is correct. E21 is therefore rejected, rather than converted into a spurious source erratum.

## Verdicts by finding

### E1 — confirmed

**§2, Lemma 2.1 (statement and proof) and Corollary 2.2, p. 5 (arXiv v1)**. Confirmed from the PDF image of p. 5 and independent enumeration of smooth generalized Weierstrass equations over F₂. Traces −2,−1,0,1,2 all occur. Newton identities and the reciprocal/anti-reciprocal alternatives give the recorded replacement. Only the finite explicit bound, not its leading g² exponent, fails.

Correction: s_k is a sum of 2g numbers of absolute value q^{k/2}, so it lies in [−2g q^{k/2}, 2g q^{k/2}], which contains at most 4g q^{k/2} + 1 integers. For polynomials with q^g f(x) = x^{2g} f(q/x) (this includes every Frobenius characteristic polynomial) the bound is (4g+1)^g q^{g(g+1)/4}. For the lemma as literally stated, where f(0) = −q^g can occur (e.g. x² − q), the bound is 2(4g+1)^g q^{g(g+1)/4}. Corollary 2.2 holds with (4g+1)^g q^{g(g+1)/4}.

Reach: **a stated result**. Existing correction: new.

### E2 — confirmed

**§3.1.5, display (11) and the sentence after it, together with (13), p. 10 (arXiv v1)**. Confirmed as an error in the v1 lattice count. Independently counted 89478415088556766546699920236339712 subspaces of F₃¹⁷, greater than 3⁷³. The elliptic curve y²=x³+x+3 over F₇ has trace 2. The replacement concerns orbits, not all lattices. The corrected filtration exponent also appears in Lee §3.3, p. 7.

Correction: As a count of lattices, (11) and (13) are false. What §3.1.6 needs is a bound on the number of GL_n(F)-orbits. Apply §3.1.4 along the flag V_{≤1} ⊂ ⋯ ⊂ V_{≤n}. At step i the pairs of unequal eigenvalues between V_{≤i−1} ≅ F^{i−1} and V_{≤i}/V_{≤i−1} ≅ F bound the shear classes by ℓ^{(i−1)δ}. The induction therefore gives ℓ^{n(n−1)δ/2} per graded type, not ℓ^{nδ}. Each isotypic block then has ℓ^{O(n²δ)} orbits (for instance at most ℓ^{4n²δ}), not the linear ℓ^{4nδ}. Explicitly, the corrected ideal bound and stars-and-bars give at most ℓ^{n(n−1)δ/2} ℓ^{nδ}2^{2nδ+n} ≤ ℓ^{4n²δ} orbit representatives for δ≥1; δ=0 gives one orbit. This is not a replacement bound of ℓ^{4nδ} for raw lattices.

Reach: **the proof**. Existing correction: Corrected orbit-count computation in Lee, arXiv:2002.04420v3, §3.3, pp. 6–7 (IMRN 2022, doi:10.1093/imrn/rnaa153), using ℓ^{n(n−1)δ/2}; Lee cites the later published LT argument. The v1-to-journal changes themselves were not collated..

### E3 — confirmed

**§3.1.5, sentence before (12), p. 10 (arXiv v1)**. Confirmed. The curve y²=x³+x²+2 over F₃ has trace 1 and gives the stated unramified quadratic ring at ℓ=2. Read Yun v2 §§4.9–4.13: he first reduces the residue field, then applies the power-series formula. Lee §3.3 retains the residue degree in the same count.

Correction: R is local with residue field k_R = F_{ℓ^s}, and it is a quotient of Z_ℓ[[x]] only when s = 1. In general R is a quotient of O₀[[T]], where O₀ = W(k_R) ⊂ R is the unramified coefficient ring and T ↦ θ − ω with ω ∈ O₀ lifting the residue of θ. Count ideals of O₀[[T]], whose residue field has ℓ^s elements, as Yun does after reducing to the residue field. This still gives #Hilb^j_R ≤ ℓ^j·2^j.

Reach: **the proof**. Existing correction: Residue-degree-aware corrected count in Lee, arXiv:2002.04420v3, §3.3, pp. 6–7; Yun, arXiv:1303.2420v2, §4.10 and Proposition 4.13, explains the required base-field reduction. Whether LT made this change in its journal version is unverified..

### E4 — confirmed

**§3.1.5, (13), second to fifth lines, p. 10 (arXiv v1)**. Confirmed as two false intermediate inequalities. For n=δ=1 the stars-and-bars count is 2, not at most 1. The displayed replacement retaining ℓ^{nδ} is only a diagnosis; combine it with E2 to obtain the valid orbit bound ℓ^{4n²δ}. Lee uses the correct quadratic filtration factor and a 2^{3δn} combinatorial factor.

Correction: The number of (a₁, …, a_n) ∈ Z_{≥0}^n with Σ a_i ≤ nδ is C(nδ + n, n) ≤ 2^{nδ+n}. The chain then gives ℓ^{2nδ}2^{2nδ+n}. For δ ≥ 1 this is at most ℓ^{2nδ}8^{nδ}, which is ≤ ℓ^{4nδ} for ℓ ≥ 3 but only ≤ 2^{5nδ} for ℓ = 2. For δ = 0 the count is 1.

Reach: **the proof**. Existing correction: Corrected combinatorial bound in Lee, arXiv:2002.04420v3, §3.3, p. 7: f(ℓ,n,δ,1) ≤ ℓ^{n(n+1)δ/2}2^{3δn}, citing published LT Corollary 3.16; exact v1/journal collation unavailable..

### E5 — confirmed

**§3.1.6, display and (14), p. 11 (arXiv v1)**. Confirmed from p. 11, the discriminant identity, and 19⁴>400; y²=x³+3x+2 over F₅ has trace 1. The counterexample is to the numerical chain, not to the actual orbit count. Reclassified its reach to the proof and marked Lee’s explicit correction as known.

Correction: δ_i = val_ℓ disc(f_i) counts each unordered pair of roots of f_i twice, so the middle inequality needs the pairs (λ, μ) to be ordered. Then ∏_{λ≠μ} |λ − μ| has up to 2g(2g − 1) factors, and (14) should end with (2p^{1/2})^{8·C(2g,2)}.

Reach: **the proof**. Existing correction: Already corrected by Jungin Lee, arXiv:2002.04420v3, §3.1, p. 5 (IMRN 2022, 4290–4317, doi:10.1093/imrn/rnaa153), item (1)(c), and item (2)/equation (7) for the stabilizer bound..

### E6 — confirmed

**§3.2.1, first bullet, displayed map, p. 12 (arXiv v1)**. Confirmed, including the repaired surjection from the image of Ψ to the orbit. Replaced the illustrative polynomial x²+9 by x²−4x+13 so the example comes from a prime-field elliptic curve: y²=x³+2x over F₁₃ has trace 4 and R=Z₃[2+3i]=Z₃[3i].

Correction: The formula defines a map on GL_n(R), not on the orbit: put Ψ(g) = (m ↦ g(m) mod R^n). If Ψ(g) = Ψ(h), then gM ⊆ hM + R^n = hM, because R^n = hR^n ⊆ hM, and by symmetry gM = hM. So gM is a function of Ψ(g), and #(GL_n(R)·M) ≤ #Hom_R(M, (R^∨/R)^{⊕n}), which is all that is used.

Reach: **the proof**. Existing correction: new.

### E7 — confirmed

**§3.2.1, second bullet, step to (19), p. 13 (arXiv v1)**. Confirmed by multiplying the displayed exponents. The direct congruence argument is valid: both g and g⁻¹ are 1 modulo f′(θ)O_F, so both inclusions hold and gM=M. It avoids the residue-field assumption in the surrounding index calculation as well. The stated bound (19) survives.

Correction: (17) and the index bound give ℓ^{3δn²}·ℓ^{(1+δ)n²} = ℓ^{(1+4δ)n²}. The bound (19) is nevertheless true, even in the stronger form ℓ^{δn²}. Every g ∈ GL_n(O_F) with g ≡ 1 mod f′(θ)O_F fixes M, since (g − 1)M ⊂ f′(θ)O_F^n ⊂ R^n ⊂ M, using O_F ⊂ R^∨ = f′(θ)^{−1}R. This congruence subgroup has index at most #(O_F/f′(θ)O_F)^{n²} = ℓ^{δn²}.

Reach: **the proof**. Existing correction: new.

### E8 — confirmed

**§3.2.2, (21), case d > 1, p. 14; also the constant C₀ after (28), p. 16 (arXiv v1)**. Confirmed after replacing the ill-typed compact subgroup as in new E24. At p=3, the Minkowski bound √12/2<2 gives ordinary class number 1, while x²−3y²=−1 is impossible modulo 3, giving narrow class number 2. Only the p-dependent constant changes.

Correction: For d > 1 the target should be Cl⁺(O_{Q(√p)}) × ∏_{i=1}^m Cl(O_{K_i}), where Cl⁺ is the narrow class group of Q(√p). Correspondingly, C₀ := max{#Cl(U_{0,1}), #Cl⁺(O_{Q(√p)})}.

Reach: **the proof**. Existing correction: new.

### E9 — confirmed

**§3.2.2, (26), p. 15 (arXiv v1)**. Confirmed: the explicit Weil number √−2 has field discriminant −8 and violates the printed bound. Lee expressly corrects the corresponding journal equation (31).

Correction: |D_K| ≤ |disc(w)| = ∏_{i<j} |w_i − w_j|² ≤ (2√p)^{d(d−1)}.

Reach: **a stated result**. Existing correction: Already corrected by Jungin Lee, arXiv:2002.04420v3, §3.1, p. 5 (IMRN 2022, 4290–4317, doi:10.1093/imrn/rnaa153), correction of LT equation (31), before Lee equation (8)..

### E10 — confirmed

**§3.2.2, (27), second and third lines, p. 15 (arXiv v1)**. Confirmed as an error in the derivation of the class-number estimate; Σd_i≤2g is the relevant dimension bound. The corrected discriminant estimate gives exponent 2g² in base 2√p, as in Lee equation (8). No lower bound on actual class numbers disproving the old upper bound is asserted; reach narrowed to the proof.

Correction: The degrees d = [K:Q] of the fields in the product sum to at most 2g, so ∏ (2√p)^{(1/2)C(d,2)} ≤ (2√p)^{(1/2)C(2g,2)} = (2√p)^{g² − g/2}. So (27) should read (2√p)^{g²(1+o(1))}, and (2√p)^{2g²(1+o(1))} once (26) is corrected.

Reach: **the proof**. Existing correction: Already corrected by Jungin Lee, arXiv:2002.04420v3, §3.1, p. 5 (IMRN 2022, 4290–4317, doi:10.1093/imrn/rnaa153), equation (8), correcting LT equation (32)..

### E11 — confirmed

**§3.2.3, (28), last step, p. 16 (arXiv v1)**. Confirmed: for fixed p, log_p(2) is a positive constant. The old argument cannot absorb a factor 2^{c g²} into p^{o(g²)}. Lee equations (9)–(10) retain it and supply the combined corrected bound. This does not prove Theorem 0.1 false; reach narrowed to the proof.

Correction: Since 8·C(2g,2) = 16g² − 8g, the product equals (2√p)^{(33/2)g²(1+o(1))} = 2^{(33/2)g²(1+o(1))} p^{(33/4)g²(1+o(1))}. With Corollary 2.2 this gives B(p,g) ≤ (2^{33/2} p^{17/2})^{g²(1+o(1))}. That is Theorem 0.1 with exponent 17/2 + (33/2)·log_p 2 + ε in place of 17/2 + ε. After also correcting E5, E9 and E10, the bound obtained by this method is B(p,g) ≤ 2^{34g²}p^{(69/4)g²(1+o(1))}, as Lee states. Lee subsequently improves it to p^{(45/4)g²(1+o(1))}; neither statement is a counterexample to the original stronger bound.

Reach: **the proof**. Existing correction: Already corrected by Jungin Lee, arXiv:2002.04420v3, §3.1, p. 5 (IMRN 2022, 4290–4317, doi:10.1093/imrn/rnaa153), equations (9)–(10) and Theorem 1.1..

### E12 — confirmed

**§4.1, paragraph before Remark 4.2 (Mumford's construction), p. 16 (arXiv v1)**. Confirmed by pulling the Poincaré bundle back along the diagonal and applying the cube identity. Equalities of line bundles use the usual rigidification at the origin; the unambiguous Néron–Severi identity is 2[L]. Ampleness and the later half-normalization remain valid.

Correction: (1 × φ_L)^*P_A ≅ m^*L ⊗ π₁^*L^{−1} ⊗ π₂^*L^{−1}, hence (1, φ_L)^*P_A ≅ [2]^*L ⊗ L^{−2} ≅ L ⊗ [−1]^*L. This is ≅ L^{⊗2} when L is symmetric, and its class in NS(A) is 2[L].

Reach: **nothing**. Existing correction: new.

### E13 — confirmed

**§4.2, definitions of Φ_f (p. 17) and D_f, and Lemma 4.6, p. 18 (arXiv v1)**. Confirmed as a missing rationalization and domain restriction. Applying (30) gives Φ_f(D_f(a,1))=(a+a′)/2, hence the inverse only on S⁰(A). The literal integral version is false. The related missing rational class and half factor in Proposition 4.9 are now recorded separately as E25.

Correction: Replace NS(A) by NS(A) ⊗ Q, extending D_f from End(A) by bilinearity, and restrict a ↦ D_f(a, 1) to S⁰(A). Then Φ_f : NS(A) ⊗ Q → S⁰(A) and D_f(·, 1) : S⁰(A) → NS(A) ⊗ Q are inverse isomorphisms of Q-vector spaces.

Reach: **nothing**. Existing correction: new.

### E14 — confirmed

**§4.3, Remark 4.8, p. 18 (arXiv v1)**. Confirmed using a generic elliptic curve with End(E)=Z: t(1)=2 whereas Trd(1)=1. More generally a representation trace on a central simple algebra is a scalar multiple of its reduced trace, with the stated scalar fixed by the value at 1. The finite-field application has scalar 1.

Correction: t = (2g/(e·[Z:Q]))·Trd_{D/Q}, where Z is the centre of D and [D:Z] = e². Over a finite field 2g = e·[Z:Q] (Tate), so t = Trd_{D/Q} there.

Reach: **nothing**. Existing correction: new.

### E15 — confirmed

**§5.4.1, first sentence and sentence before (41), p. 27, and (41), p. 28 (arXiv v1)**. Confirmed from the polynomial x²−(w+w̄)x+p. Also corrected the preceding sentence: L=Q(w) is the CM field and K=Q(w+w̄) its real subfield, not K=Q(w). Since D_L=D_K² N(D_{L/K}), the estimate used in (40) remains available.

Correction: The discriminant is (w − w̄)² = −4p sin²θ₀, and (41) should end with 4^{[K:Q]} p^{[K:Q]} ∏ sin²θ_j. In the first sentence of §5.4.1, replace K=Q(w) by L=Q(w), K=Q(w+w̄). The inequality |D_K|≤|disc(Z[w])| used in (40) still holds.

Reach: **nothing**. Existing correction: new.

### E16 — confirmed

**§5.4.2, (49), p. 29 (arXiv v1)**. Confirmed as a faulty inference, but the inherited report overstated the missing input. Equations (22)–(23), h_F≥1 and discriminant bounds already give κ_F=Res ζ_F≥1/(500√|D_F|), including F=Q separately. Combined with (24), this gives the weaker two-sided estimate |log L(1,χ)|=O_p(d²), sufficient downstream. No external unproved L-value estimate is needed.

Correction: Put d=[K:Q]. Replace the unsupported O(d log d) equality by the sufficient estimate |log L(1,χ_{L/K})|=O_p(d²). For F=K,L, the class-number formula (22), h_F≥1 and (23) give κ_F≥1/(500√|D_F|). Equations (40)–(42), with E15 corrected, give log|D_K|, log|D_L|=O_p(d²); (24) gives log κ_F≤O_p(d log(2d)). Thus both logarithms have absolute value O_p(d²). The two-sided estimate needed in (50) follows together with the finite-group product bounds; the stronger claim in (49) is not established here.

Reach: **the proof**. Existing correction: new.

### E17 — confirmed

**§5.4.3, (51), p. 30; also (53)–(55), p. 31, and Lemma 5.11 with (56), p. 33 (arXiv v1)**. Confirmed directly from the factorial product in (39): Σ_{j=1}^n log Γ(j)=½n²log n−¾n²+O(n log n). Halving the asymptotic coefficients and count thresholds preserves the separation argument within its CM scope. The independent quaternion omission E19 remains; this correction does not certify the full conditional theorem.

Correction: By (39) the main term is (1/2)[K:Q]n² log n. So (51), (53) and (54) should read (1/2)[K:Q]n² log n + O(n²[K:Q]²), and (55) should read (1/2)Σ[K_i:Q]n_i² log n_i + O(g²). Lemma 5.11 and (56) should read exp((1/2)g² log g + O(g²)).

Reach: **a stated result**. Existing correction: new.

### E18 — confirmed

**§5.5, proof of Lemma 5.9, p. 32 (arXiv v1)**. Confirmed. For 1/2<ε<1 and k≥2, the vertices have one coordinate εg, one (1−ε)g, and all others zero: k(k−1) choices. The stated norm and the lemma’s conclusion are unchanged.

Correction: The maximum must occur at one of the k(k − 1) extreme points of the polytope [0, εg]^k ∩ {x : Σ x_i = g}.

Reach: **nothing**. Existing correction: new.

### E19 — confirmed

**§5.5, proof of Corollary 5.13 (= Theorem 0.2), p. 33 (arXiv v1)**. Confirmed as a proof gap, not a disproof of the theorem. Read Conjecture 5.2 across pp. 24–25: its endomorphism algebra is a product of matrix algebras over CM fields. The real-quadratic quaternion factor introduced on p. 14 is outside those hypotheses. Reclassified reach to the proof; a quaternion polarization estimate remains missing.

Correction: The bound is justified only for bad A with no isogeny factor B₀, the simple abelian surface whose Frobenius field is Q(√p). Bad A containing B₀^d need a separate estimate, for example an extension of Conjecture 5.2 and Proposition 5.10 to factors with End⁰(B₀^d) = M_d(D₀). Otherwise Corollary 5.13 must be stated with that restriction. Any restriction must apply to the population being counted, not just to an individual intermediate bound. The inherited proof does not justify the unrestricted conditional theorem. The corrected numerical thresholds are those in E17.

Reach: **the proof**. Existing correction: new.

### E20 — confirmed

**§5.6, proof of Corollary 5.14, p. 34 (arXiv v1)**. Confirmed that the displayed zero-spacing mass and finite-g deduction are invalid. With exceptional proportion η_g, the guaranteed mass is at least (1−η_g)(0.99−1/g). A missing lower bound does not show that the actual finite-g discrepancy is less than 0.99. Narrowed reach to the proof and removed that overclaim.

Correction: An eigenvalue of multiplicity h produces h − 1 zero spacings, not h. So z and z̄ give mass at least (2h − 2)/(2g) = α − 1/g at 0 with the 2g eigenangles, or (h − 1)/(g − 1) with g angles in [0, π]. This holds for a proportion 1 − o(1) of A, not for all. The argument yields lim inf_{g→∞} discrep(μ_g, μ_GUE) ≥ 0.99, not ≥ 0.99 for each g.

Reach: **the proof**. Existing correction: new.

### E21 — rejected

**§5.7.2, Definition 5.16 (p. 35) and Example 5.17, pp. 35–36 (arXiv v1)**. Rejected after independent reconstruction. The limit in the used (1,2),(0,0) case is ∏_{i≥1}(1−ℓ^{−i})² for odd ℓ and one such product for ℓ=2, by Cheong–Huang Theorem 2.10. More generally, use the finitely many irreducible factors of ∏(1−t^{n_j}) modulo ℓ: their primary-module distributions converge with total mass one, and the conditional Haar-lift distribution of the relevant blocks is independent of ambient dimension. Each polynomial determinant is nonzero almost surely in a fixed block, so these lifts yield a probability kernel on finite group tuples. Total-variation convergence survives that kernel. The report gives the lifting argument, which also handles repeated/shared factors and ℓ dividing n_j. Thus omission of this standard reduction does not make Definition 5.16 ill posed. Replacing limit by liminf would not define a probability distribution.

Correction: Retain Definition 5.16. Add the primary-decomposition/Haar-lifting justification given in the independent review if an explicit proof is wanted. For Example 5.17 the odd-prime limit is (∏_{i≥1}(1−ℓ^{−i}))², so the printed uniform positive lower bound is valid. Do not replace a probability law by coordinatewise liminf.

Reach: **nothing**. Existing correction: No source error confirmed. Primary-module limit: Cheong–Huang, doi:10.1215/00192082-8939615, Theorem 2.10; independent extension to the polynomial tuple by Haar lifting in this review..

### E22 — confirmed

**§5.7.3, Lemma 5.19 and its proof, p. 36 (arXiv v1)**. Confirmed by direct point enumeration over F₂ and F₄, not only by the trace recurrence. The two displayed smooth curves have point counts (2,8) and (4,8), with integral discriminants −557 and −433. For p≥5 and p=3, the corrected Hasse-interval arguments prove the lemma. Corollary 5.20 remains unproved at p=2, rather than disproved by this example.

Correction: The lemma holds exactly for odd p. For p ≥ 5 the Hasse interval forces #E(F_p) = p, so a = 1; then b = a² − 2p = 1 − 2p and #E(F_{p²}) = p(p + 2), which is not a power of p. For p = 3, a ∈ {1, 3} gives #E(F₉) ∈ {15, 7}. For p = 2 the lemma is false.

Reach: **a stated result**. Existing correction: new.

### E23 — confirmed

**§3.1.1, p. 7 (arXiv v1)**. Added and independently verified in this review. For y²=x³+x over F₇ the trace is 0 and f=x²+7 splits over Q₂, with roots ±a, a a unit and v₂(2a)=1. Fix intersections Z₂e₁ and Z₂e₂. Every stable lattice lies between D=Z₂² and (1/2)D, and its quotient by D meets neither coordinate axis. The only possibilities in F₂² are zero and span(1,1): exactly 2 lattices, whereas the printed ordered resultant sum gives δ′=2 and 4 lattices. Yun’s actual Lemma 4.9 fixes graded lattices and sums unordered pairs; its regular-semisimple hypothesis is replaced here by the direct Sylvester determinant calculation with n_i n_j multiplicities. This repairs the reduction used in E2/E5 without proving the false literal equality.

Correction: Use a flag V_{≤i} and fixed associated graded lattices, as in Yun Lemma 4.9, not simultaneous intersections with all V_i. The gluing exponent is Σ_{i<j} n_i n_j val_ℓ Res(f_i,f_j), with unordered pairs and multiplicities. The Sylvester operator on Hom(V_j,V_i) gives this exponent. It yields the requisite bound on centralizer orbits after choosing graded orbit representatives.

Reach: **the proof**. Existing correction: new.

### E24 — confirmed

**§3.2.2, definition of U_{0,d}, p. 14 (arXiv v1)**. Added and independently verified in this review. D₀ is quaternion over the quadratic field K, not a degree-four central simple algebra over Q. The Q-dimension of GL_d(D₀) is 8d², while that of GL_{4d} is 16d²; the proposed isomorphism cannot exist. The corrected compact open has reduced norm Ô_K× and supplies the intended subsequent calculation.

Correction: With K=Q(√p), choose D₀⊗_K A_{K,f}≅M₂(A_{K,f}) and take U_{0,d} to be the inverse image of GL_{2d}(Ô_K). As a Q-group, the finite local split form is Res_{K/Q}GL_{2d}. Then apply E8 for its reduced-norm class set.

Reach: **the proof**. Existing correction: new.

### E25 — confirmed

**§4.3.1, Proposition 4.9(1) and (3)⇒(1), p. 19 (arXiv v1)**. Added and independently verified in this review. For an elliptic curve with End⁰(E)=Q and principal L₀, Φ_f maps a degree-r line bundle to r/2. The positive rational a=1/3 satisfies (2) and (3) (it is a sum of three squares (1/3)²) but cannot be Φ_f(L) for a line bundle. Even a_i=1 gives Φ_f(L₀)=1/2 rather than 1. The ample rational cone and its applications are restored by the stated repair.

Correction: Use an ample rational Néron–Severi class in (1). With the paper’s Φ_f=½f⁻¹φ, one has Φ_f(a_i^*[L₀])=½a_i² for selfadjoint a_i. For a=Σa_i² use the ample rational class 2Σa_i^*[L₀]. If a_i=b_i/m_i, its rational pullback means m_i⁻²[b_i^*L₀]; no nonexistent rational morphism is used.

Reach: **a stated result**. Existing correction: new.

### E26 — confirmed

**§1, equations (3)–(4), p. 3 (arXiv v1)**. Added and independently verified in this review. Already V=A¹ has H_c⁰=0 and H_c²=Q_ℓ(−1), so the printed equality for arbitrary i and the ordinary top-cohomology notation are wrong. For multiple geometric components Frobenius also permutes their fundamental classes. Under the geometrically connected smooth hypotheses used in (5), the corrected formulas give exactly the intended leading term p^{dim V}.

Correction: In (3) the index is i=2 dim V, with compact supports and V smooth of pure dimension. In (4) retain compact supports, use p^{dim V} over F_p, and require geometric connectedness (or include the Frobenius permutation of geometric components). These are the hypotheses used for the following leading term.

Reach: **nothing**. Existing correction: new.

## Validation and limits

The scratch diagnostic independently checks finite-field point counts and discriminants, exact Gaussian-binomial counts, the mixed-lattice example, stars-and-bars inequalities, the quadratic orbit exponent, the corrected separation threshold, and the factorial asymptotic numerically. The mathematical arguments above, not those finite tests, justify the general repairs.

Validation commands: `python3 scripts/check_errata.py research/blueprint/errata/PAPER-LIPNOWSKI-TSIMERMAN-18.json`; `python3 research/blueprint/intake.py check-files` on the four deliverables; `git diff --check`. Lean: not applicable to this errata-only job; no Lean file was changed or compiled. No library declaration or formalization claim is made.

The review does not alter the extraction, atlas, register or another worker’s handoff. The source-version limitation remains explicit in every finding’s search record. Journal collation and the unresolved quaternion estimate are not silently certified by completing this review.
