# Mistakes in Liu–Tian–Xiao–Zhang–Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*

*Inventiones mathematicae* 228 (2022), 107–375, [doi:10.1007/s00222-021-01088-4](https://doi.org/10.1007/s00222-021-01088-4); [arXiv:1912.11942](https://arxiv.org/abs/1912.11942). Errata job `ERRATA-PAPER-LIU-ETAL-22`, Claude Code — cc-39fac3, 28 September 2026. The findings are those of the extraction [`PAPER-LIU-ETAL-22`](../papers/PAPER-LIU-ETAL-22.md) (cc-2aeb03, with its checkpoint and Codex continuations), converted here without loss; the data is [PAPER-LIU-ETAL-22.json](PAPER-LIU-ETAL-22.json).

## Summary

This file records **131 mistakes**: 80 misprints, 30 gaps and 21 errors.

- **Reach.** 17 reach a stated result, 13 reach only a proof, and 101 reach nothing downstream.
- **Origin.** E1–E126 are the extraction's findings. E127–E131 are five further misprints found while re-reading the pages.
- **No main theorem is shown false.** What the findings do show about the main theorems:
  - **Kolyvagin argument.** The argument of §§2.6 and 8 has a real gap when R_ℚ ≅ R_ℚ^𝔠 (E1, E23, E102). This includes all of Theorem 1.1.1 and the base-change cases of the others.
  - **Unpublished input.** Every unconditional main theorem with F⁺ ≠ ℚ rests on the unpublished Kisin–Shin–Zhu work [37], for every n ⩾ 2 (E30).
  - **Corollaries 8.2.3 and 8.2.5.** Their printed case n = 2, F⁺ = ℚ is not proved (E105).
- **Corrections in print.** Only one finding is already corrected in print, and only partly: E85. In a later paper, arXiv:2406.00624, three of the authors acknowledge the misprinted monodromy formula on p. 281.

## What was read

**The published article.**
- **Which copy.** It is the Springer-typeset article of record: header "Invent. math. (2022) 228:107–375", received 19 June 2020, accepted 14 October 2021, published online 21 January 2022.
- **Source.** It is the copy deposited in the NSF Public Access Repository, https://par.nsf.gov/servlets/purl/10323568: 269 pages, SHA-256 `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97`.
- **Pages.** The printed page equals the PDF page + 106.
- **How it was obtained.** On 28 September 2026 par.nsf.gov refused connections, and Springer's own copy is paywalled. The file read is a byte-identical copy of the NSF deposit, with the same hash and size, downloaded from that URL by an earlier worker on 23 September 2026.

**Every finding was re-read on the rendered page image at its locator.**
- **Quotations.** All 126 quotations are printed as recorded. The only exceptions are harmless Unicode transcriptions of formulas: ‖v‖⁻¹ in E27, 𝔯_R in E22, and T⋆ in E98.
- **Locators corrected** (the extracted locator is kept as `locatorAsExtracted`):
  - **E12:** the quotation starts on the last line of p. 354.
  - **E26:** lines 7–8 of p. 139, not 6–7.
  - **E109:** the second bullet of Theorem 8.3.2, not the first.
  - **E110:** two displays before (8.12).

**arXiv:1912.11942v3** (SHA-256 `84dc7c83…fe86`) was consulted where a locator cites it. The extraction's comparisons with v1 and v2 are carried over as recorded. Each finding's `collation` field records the pages read.

## Whether any of it is already corrected

The searches below were made on 28 September 2026. Each finding's `searched` field keeps the extraction's searches of 23 September too.

- **Publisher and Crossref.** Crossref lists no update, correction or erratum for doi:10.1007/s00222-021-01088-4, and no work that updates it. The Springer article page links none, and its modification date is the publication date.
- **arXiv.** v3 (17 August 2021) is still the latest version. Its only comment is that Appendix E became arXiv:2108.06998.
- **Authors' pages.**
  - Yifeng Liu's page lists the paper with no erratum; it links an erratum only for a different paper.
  - Wei Zhang's page lists it, linking arXiv, with no correction.
  - Liang Xiao's BICMR page does not mention it.
- **Later work.**
  - **Liu–Tian–Xiao, arXiv:2406.00624v3.** Footnote 29 on p. 85 says that "there is a typo on [LTXZZ1, Page 281], namely, the formula r♮_mix(t)v′ = xv + v′ should be r♮_mix(t)v = xv′ + v". That is the first half of E85. The matching H¹_sing formula on p. 282 is not mentioned.
  - **Other papers checked:** the authors' survey arXiv:2509.16881, Liu's arXiv:2412.18881, and Peng's arXiv:2509.18615. Peng adapts the argument of §§2.6 and 8 and uses Proposition 2.6.6 as printed. None of the three states any other correction.

So every finding except E85 remains `known: "new"`, meaning no correction was found in the searches listed.

## What this job changed

**Conversion from the extraction.**
- E1–E126 are converted from `research/blueprint/papers/PAPER-LIU-ETAL-22.result.json`, which is left unchanged.
- Every field is kept.
- The extraction reviewer's verdicts (`REV-PAPER-LIU-ETAL-22`, all "confirmed") move to `extractionReview`. A verdict counts only for the file its review job checked, and this file's own review adds `review`.

**Corrected here.** The extracted values are kept beside the new ones as `…AsExtracted`.
- **E57, Theorem 5.4.4(2).** The extraction's proposed repair does not work, and it is replaced by the correction E39 makes to the same statement in §4.
  - *The flawed step:* the repair claimed that two points of B•_{s•} with the same image differ by an automorphism of s•, trivial for neat level. That map is only a self-quasi-p-isogeny of A•.
  - *The replacement:* (2) holds as "unramified" (étale-locally a closed immersion), and as a closed immersion for sufficiently small level. The authors' own Remark 5.4.5(1) says the same.
  - *Status:* the finding stays a gap, because actual non-injectivity was not settled here.
- **E30, dependence on [37].** The correction is made precise.
  - The extracted wording says that Corollaries 8.2.3 and 8.2.5 "all assume F⁺ ≠ ℚ", but as printed their condition (c) is "F⁺ ≠ ℚ if n ⩾ 3".
  - The dependence on [37] is exactly the cases with F⁺ ≠ ℚ, for every n ⩾ 2. The case n = 2, F⁺ = ℚ is E105.
- **E35, Lemma 3.4.12(2).** It is reclassified from reaching nothing to reaching a stated result. The lemma is false as stated when 𝔭 splits, which is how E39 is classified; nothing downstream is affected.

**Notes on slips inside the extraction's reasons** go in `errataNotes`: E9, E10, E16, E24, E31, E39, E49, E51, E58, E97 and E106. None changes a verdict. For E10, the reason's aside that N = 2 "is used in the main theorems" is superseded by its own later paragraph: no written argument uses the N = 2 case.

**New findings.** E127–E131 are five new misprints, all reaching nothing and all also present in arXiv v3:
- **E127 (p. 222):** ω_{𝒜,τ∞^c} for ω_{𝒜^∨,τ∞^c}.
- **E128 (pp. 223–224):** "a disjoint of" for "a disjoint union of".
- **E129 (p. 259):** inc•₀ for inc•₁ in the even case of Theorem 5.11.5.
- **E130 (pp. 311, 319):** an undefined Σ⁺ for Σ⁺_min in (8.5) and (8.14).
- **E131 (p. 352):** an undefined N₀.

## The findings that matter for the main theorems

These are the findings that reach a stated result or a proof. The main theorems are Theorems 1.1.1, 1.1.5, 1.1.7 and 1.1.9, which are Corollary 8.2.3, Theorem 8.2.2, Corollary 8.2.5 and Theorem 8.3.2.

**The Selmer argument (§§2.3–2.7, §8).**
- **E1:** Lemma 2.6.4 is false when [F:F⁺] = 2.
- **E23:** so Proposition 2.6.6 fails.
- **E102:** the proofs in §8 choose γ without regard to the Selmer class. When R_ℚ ≅ R_ℚ^𝔠 they do not reach a contradiction. This is repairable for Theorem 1.1.1 using γ's of both signs. It is open for the base-change cases of Theorems 1.1.5, 1.1.7 and 1.1.9.
- **E2:** the first part of Proposition 2.6.7 is false. The one-sided version, which is what §8 uses, holds.
- **E21:** Lemma 2.3.5(b) is false over residue fields larger than 𝔽_ℓ.
- **E3, E4, E25:** Lemma 2.7.1 and Proposition 2.7.2.
- **E13, E101:** Lemma 8.1.7, the change of level, is asserted integrally from a rational isomorphism.
- **E106:** (8.5) and (8.14) at ℓ-adic places need integral p-adic Hodge theory.
- **E32:** under the printed Definition 3.3.2, the Chebotarev choice of primes in §8 need not give (PI3).

**The scope of the main theorems.**
- **E30:** every unconditional main theorem with F⁺ ≠ ℚ depends on the unpublished [37].
- **E105:** the printed case n = 2, F⁺ = ℚ of Corollaries 8.2.3 and 8.2.5 is not proved.

**Geometry and level raising (§§4–7, appendices).** These are false or unproved as stated, but the main theorems use only the true part or the true case:
- **E39, E57:** closed immersion versus unramified.
- **E35:** Lemma 3.4.12(2) in the split case.
- **E51:** the graph must be counted with multiplicity.
- **E65:** Theorem 5.7.8(2) for odd N.
- **E8, E68:** Lemma 5.9.3(6).
- **E74:** the ℙ¹-bundle is not trivial.
- **E9:** Lemma A.1.4(4).
- **E10:** primitive cohomology at N = 2.
- **E89:** Theorem 6.3.4(5).

**Unproved steps in proofs:** E50, E63, E87, E93, E113 and E124.

**The remaining findings are misprints and small gaps whose intended meaning is clear.** Each is listed below with its correction.

## The findings

### E1. Lemma 2.6.4: Frobenii need not fill G_{S,γ} when [F:F⁺] = 2

*Error; reaches a stated result.* **Where:** Lemma 2.6.4 and its proof, published p. 134; arXiv v3 p. 19 (Lemma 2.6.4); arXiv v1/v2 Lemma 2.5.4(2), p. 19. **Already corrected in print:** none found (new)

**What the paper says.** Lemma 2.6.4 says that, if γ has order prime to ℓ, the Frobenii Ψ_{w^{(m)}} at γ-associated places fill out θ_S^{−1}Hom(S, (R̄^{(m)})^{h_γ}). The proof asserts that some lift γ̃ of γ has an [F:F⁺]-th power restricting to any prescribed (g^{−1}Ψ)h_γ.

**Why it is wrong or incomplete.** For [F:F⁺] = 2, the Frobenius at a γ-associated place is the square of a lift of γ, and the squares of the coset σ₀N form a constrained set. Precisely, G_{S,γ} = q(N^α): the invariants of conjugation by a prime-to-ℓ lift σ₀, not of h_γ = σ₀². Counterexample: F⁺ = ℚ(√5), F = F⁺(i), ℓ = 3, R = ℤ₃(1), j = 2, S generated by the Kummer class of u = (1+√5)/2 mod 3^m, γ the image of 𝔠 (so h_γ = 1). Every lift of γ is τ𝔠 with 𝔠τ𝔠 = τ⁻¹, so its square is 1. Hence G_{S,γ} = {1}, while the right side is Gal(F_S/F^{(m)}) ≅ ℤ/3^m.

**Correction.** In general only the inclusion G_{S,γ} ⊆ θ_S^{−1}Hom(S, (R̄^{(m)})^{h_γ}) holds. Equality holds for [F:F⁺] = 1. For [F:F⁺] = 2, Prop. 2.6.6 needs a weaker statement: the O_λ-span of θ_S(G_{S,γ}) contains λ^c·Hom(S, (R̄^{(m)})^{h_γ}) with c independent of m. This holds with c = 𝔣(r_S)𝔯_{Ind R} if R_ℚ ≇ R_ℚ^𝔠. If R comes from R₊ over F⁺, it holds exactly when S lies in the 𝔠-eigenspace matching the sign by which γ acts on the line (R̄^{(m)})^{h_γ}.

**Effect on the main results.** It reaches §8 through Proposition 2.6.6, in the proofs of Theorems 8.2.2 and 8.3.2, where [F:F⁺] = 2. If R_ℚ ≇ R_ℚ^𝔠, the span version rescues the proofs with changed constants. If R_ℚ ≅ R_ℚ^𝔠, the proofs have a gap: a γ of the wrong sign kills loc(S) at every γ-associated place. This covers all of Theorem 1.1.1 and the base-change instances of Theorems 1.1.5, 1.1.7 and 1.1.9. For 1.1.1 the gap is repairable when ℓ ≫ 0 by using γ's of both signs. For 1.1.5, 1.1.7 and 1.1.9 in the base-change case, the paper supplies only one γ. No main theorem is shown false.

### E2. Prop. 2.6.7: an abundant pair need not be diagonalisable

*Error; reaches a stated result.* **Where:** Proposition 2.6.7 and its proof ('The first part is obvious from Definition 2.6.5'), published p. 135; arXiv v3 p. 20; also Proof of Theorem 8.3.2, (8.11), published pp. 317–318; arXiv v3 PDF p. 140. **Already corrected in print:** none found (new)

**What the paper says.** Proposition 2.6.7 claims that for every (S, γ)-abundant r-tuple some basis of S satisfies θ_S(Ψ_i)(s_j) = 0 for i ≠ j and exp_λ θ_S(Ψ_j)(s_j) ⩾ m − m₀ − 𝔣(r)𝔯_R. It calls this 'obvious from Definition 2.6.5'. The proof of Theorem 8.3.2 uses it for (8.11).

**Why it is wrong or incomplete.** Abundance only says that the matrix A = (θ_S(Ψ_i)(s_j)) over O_λ/λ^{m−m₀} has image containing λ^c(…)^r, where c = 𝔣(r)𝔯_R. A change of basis of S (A ↦ AC) preserves the image, and the image of a diagonal matrix is the product of its coordinate projections. A = [[λ, 1], [0, λ]] has image ⊇ λ²(…)² of index |k|², but its projections have index 1 and |k|. So A is abundant once c ⩾ 2 (r = 2, 𝔯_R ⩾ 1), yet it cannot be diagonalised. For r = 1, or when 𝔣(r)𝔯_R = 0, the statement is true.

**Correction.** Assume 𝔣(r)𝔯_R = 0. Or weaken the claim to elements s_j := Ce_j with AC = λ^c·I, or state it for a suitably chosen tuple. In (8.11), use only what abundance gives. After possibly swapping Ψ₁ and Ψ₂, exp θ_S(Ψ₁)(λ₀^{m_Σ−m_per}s) ⩾ m − m_Σ − 4𝔯_R. There is also a primitive t ∈ S with θ_S(Ψ₁)(t) = 0 and exp θ_S(Ψ₂)(t) ⩾ m − m_Σ − 4𝔯_R. Replace s₂ by t.

**Effect on the main results.** Only Theorem 8.3.2 (Theorem 1.1.9) uses r = 2. Theorem 8.2.2 and Theorems 1.1.1, 1.1.5 and 1.1.7 use r = 1, where the statement is true. The failure needs R̄ = R̄₀ ⊗ R̄₁ not absolutely irreducible, which admissibility allows. For such λ the proof of 1.1.9 cites a false statement. It has a local repair, which also presupposes a fix for E1. No main theorem is shown false.

### E3. Lemma 2.7.1: separate ℓ-powers of components leave the joint image

*Gap; reaches the proof.* **Where:** Proof of Lemma 2.7.1, published p. 136; arXiv v3 p. 21. **Already corrected in print:** none found (new)

**What the paper says.** To lift (γ₀, γ₁, ξ) modulo λ^m, the proof raises γ′₀ and γ′₁ to separately chosen powers ℓ^{d_α e_α}, keeps ξ′ unchanged, and notes that 1 is an eigenvalue of h.

**Why it is wrong or incomplete.** (GI^m) needs a single element of the image of Gal(F̄/F′) under the joint map (ρ̄₀₊^{(m)}, ρ̄₁₊^{(m)}, ε̄_ℓ^{(m)}). Powering the components by different exponents with ξ′ unchanged gives, in general, a triple that no Galois element produces. Also, (c) needs ker(h − 1) to be free of rank one over O_λ/λ^m, not merely that 1 is an eigenvalue.

**Correction.** Raise one Galois element g to a single power ℓ^k, with k divisible by d₀, d₁ and the residue degree, and large enough to kill the ℓ-parts. The reduction mod λ is unchanged, so (a), (d) and (e) persist. For (c): h has prime-to-ℓ order, so ker(h − 1) is the image of the averaging idempotent, a free direct summand lifting the rank-one residual kernel.

**Effect on the main results.** None on the main theorems. The lemma is true and the repair is routine; arXiv v1 took a common power.

### E4. Prop. 2.7.2(3) needs 𝒫 ≠ 0

*Error; reaches a stated result.* **Where:** Proposition 2.7.2(3), published p. 137; arXiv v3 pp. 21–22. **Already corrected in print:** none found (new)

**What the paper says.** Proposition 2.7.2(3) says that for any 𝒫 ∈ ℤ[T], condition (GI¹_{F′,𝒫}) holds for all sufficiently large ℓ.

**Why it is wrong or incomplete.** (GI¹) requires 𝒫(ξ) to be invertible in O_λ/λ. For 𝒫 = 0 this is impossible, so (3) fails for every ℓ. The proof breaks at 'such pair (a, b) always exists', since 𝒫(a⁻¹) ≠ 0 then has no solution.

**Correction.** Add 𝒫 ≠ 0. With the corrected proof (E25), the condition becomes 𝒫(−a^{−[F′:F⁺]}) ≠ 0, which excludes only finitely many a once ℓ is large.

**Effect on the main results.** None. The only application, Definition 8.1.1 (L5-2) with Lemma 8.1.3, uses 𝒫 = T² − 1.

### E5. Construction 3.1.8: required orderings may not exist over rings

*Gap; reaches nothing.* **Where:** Construction 3.1.8(1) and (2), published pp. 141–142; arXiv v3 p. 24; v1 p. 24. **Already corrected in print:** none found (new)

**What the paper says.** Construction 3.1.8 defines φ_α for a unitary Satake parameter in an arbitrary ring L. It chooses an ordering with α_iα_{N+1−i} = 1 in the inert case, resp. α_{1,i}α_{2,N+1−i} = 1 in the split case.

**Why it is wrong or incomplete.** Over a ring that is not a domain, such orderings may not exist. In L = 𝔽₅ × 𝔽₅, α = {(1,2), (2,1), (3,3)} is unitary, since each component polynomial is (T−1)(T−2)(T−3). But no element squares to 1, so none can be the middle entry. A split example: α₁ = {(1,2), (2,1)}, α₂ = {(1,1), (3,3)}, c = 2.

**Correction.** Either assume L is a domain, so that orderings exist. Or define φ_α from P_α alone: for N even write P_α(T) = T^{N/2}·Q(T + T⁻¹), and send the elementary symmetric functions of x_j + x_j⁻¹ to the signed coefficients of Q. For N odd, first divide by T − 1, which divides P_α. Treat the split case similarly.

**Effect on the main results.** None. The construction is used only with L = ℂ (Construction 3.1.10) or starting from an ordered tuple (Notation B.2.5).

### E6. (p+3) printed for (p³+1) in the Hecke-coefficient product

*Misprint; reaches nothing.* **Where:** Proposition 5.8.8, statement (definition of R•_{N,𝔭}) and proof (last display), published p. 229; Proposition B.3.5(2), p. 342; Lemma B.3.6, p. 343; arXiv v1/v2 Proposition 5.7.8 pp. 81–82 and pp. 157; v3 Proposition 5.8.8 pp. 82–83 and p. 157; also Proposition B.3.5(2) (definition of R°_N), published p. 342; Lemma B.3.6 (definition of R•_N), published p. 343. **Already corrected in print:** none found (new)

**What the paper says.** Proposition 5.8.8, in the definition of R•_{N,𝔭} and in the intersection multiplicity in its proof, prints the product (p+1)(p+3)⋯(p^{2(r−δ)−1}+1). Proposition B.3.5(2) (R°_N) and Lemma B.3.6 (R•_N) print the same product with q for p.

**Why it is wrong or incomplete.** The factors are p^{2i−1}+1, so the second factor is p³+1, not p+3. At p = 2 the first two factors should give 3·9, not 3·5. The same product appears correctly in #S†_{s•} in Theorem 5.7.8 and in Lemmas B.2.4 and B.3.2.

**Correction.** Read (p+1)(p³+1)⋯(p^{2(r−δ)−1}+1) = ∏_{i=1}^{r−δ}(p^{2i−1}+1), and likewise with j for δ and q for p.

**Effect on the main results.** None. The last factor p^{2(r−δ)−1}+1 fixes the intended reading.

### E7. Chern-class index c_{r−1} should be c_{r−j−1} in (5.20)

*Misprint; reaches nothing.* **Where:** Proof of Proposition 5.8.9, (5.20), published p. 231; arXiv v1/v2 proof of Proposition 5.7.9, p. 82; v3 (5.20), p. 83. **Already corrected in print:** none found (new)

**What the paper says.** (5.20), in the proof of Proposition 5.8.9, integrates c_{r−1}((σ*ℋ̄_{s•2}) ⊗ (ℋ̄^⊣_{s•1}/ℋ̄_{s•2})) · c₁((ζ•_{s•})_*Lie_{𝒜,τ∞^c}) over DL•(𝒱_{s•}) and gets d•_{r−j,p}.

**Why it is wrong or incomplete.** For s• ∈ Hk_j⁻¹(s•₁, s•₂), DL•(𝒱_{s•}) has dimension r − j, and the excess bundle has rank r − j − 1. So the integrand must have degree r − j. With c_{r−1} it has degree r, and for j ≥ 1 the integral would vanish. Proposition A.2.4(2) with r − j in place of r, and the parallel formula in the proof of Proposition 5.8.8, both use c_{r−j−1}.

**Correction.** Read c_{r−j−1} in place of c_{r−1}.

**Effect on the main results.** None. The formula is right for j = 0, and the right-hand side and the cited Proposition A.2.4(2) fix the meaning.

### E8. Galois-H¹ vanishing claimed in Lemma 5.9.3(6) is false

*Error; reaches a stated result.* **Where:** Lemma 5.9.3(6), statement p. 234 and proof p. 235; arXiv v1/v2 Lemma 5.8.3(6), pp. 85–86; v3 Lemma 5.9.3(6), pp. 86–87. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Lemma 5.9.3(6) claims that, since p² − 1 is invertible in L, H¹(Gal(𝔽̄_p/𝔽_p^Φ), F₋₁H¹(I_{ℚ_p^Φ}, H^{2r−1}_𝔗(M̄_N, RΨL(r)))) = 0. From this it deduces the short exact sequence 0 → F₋₁H¹ → H¹_sing → H^{2r−1}_𝔗(M̄•_N, L(r−1))^{Gal} → 0.

**Why it is wrong or incomplete.** The proof has just shown that Gal ≅ Ẑ acts trivially on E₂^{1,2r−2}(−1), and hence on its quotient A = F₋₁H¹ (Lemma 5.9.3(5)). For a trivial action H¹(Ẑ, A) = Hom(Ẑ, A) ≅ A, so the claimed vanishing says A = 0, and p² − 1 plays no role. But A ≠ 0 in the case of interest: Theorem 6.3.4(4) identifies A/𝔫 with O_λ[Sh(V°_N, K°_N)]/𝔫. The long exact sequence gives only 0 → A → H¹_sing → H^{2r−1}(M̄•_N, L(r−1))^G →δ A. Right exactness means δ = 0, which is not proved.

**Correction.** Delete the vanishing claim. State (6) as that exact sequence ending in →δ F₋₁H¹, or just as the injection F₋₁H¹ ↪ H¹_sing. The short exact sequence does hold when H^{2r−1}(M̄•_N, L(r−1))^G = 0, which is automatic for L of characteristic 0 by weights.

**Effect on the main results.** Lemma 5.9.3(6) as stated (right exactness for torsion L) is unproven, but the main theorems are unaffected. The later uses, T^ram_𝔪 ≠ 0 (p. 282) and the proof of Proposition 6.4.1 (p. 283), need only the injection. Theorem 6.3.4(4) gets its isomorphism from a rank count.

### E9. Lemma A.1.4(4) fails for κ-forms that are not split

*Error; reaches a stated result.* **Where:** Lemma A.1.4(4) and its proof, published p. 323 (lemma begins p. 322); also Proof of Lemma 5.6.2(3), published p. 212 (relies on Lemma A.1.4(4), p. 323). **Already corrected in print:** none found (new)

**What the paper says.** Lemma A.1.4(4) says that for any pair (𝒱, { , }) over κ ⊇ 𝔽_{p²} with dim 𝒱 = N even and 𝒱^⊣ = 0, Gal(κ̄/κ) acts trivially on H^{N−2}(DL(𝒱, { , }, N − 1)_κ̄, L((N−2)/2)). The proof calls N = 2 trivial and cites that the middle cohomology is spanned by Tate cycles over κ. Lemma 5.6.2(3) is deduced from it.

**Why it is wrong or incomplete.** The Tate classes are the classes of 𝔽_{p²}-rational linear subspaces. They are defined over κ only when the κ-form is split, i.e. descends to 𝔽_{p²} over κ. Counterexample: κ = 𝔽₉, p = 3, N = 2 and {x, y} = x₁³y₁ + t·x₂³y₂ with t ∉ 𝔽₃, which is admissible. DL is the set of lines with x₁⁴ + t·x₂⁴ = 0: four geometric points, none of them 𝔽₉-rational, because the fourth powers in 𝔽₉^× are ±1. So Frobenius permutes H⁰ = L⁴ non-trivially (e.g. L = ℚ₅). Point counts over 𝔽₄ show the same failure for N = 4. The proof of Lemma 5.6.2(3) applies (4) to the Frobenius-twisted link fibres without checking that they are split.

**Correction.** Add to (4) the hypothesis that the pair descends to 𝔽_{p²} over κ, i.e. 𝒱 = 𝒱₀ ⊗ κ with {x, y} = −{y, x}^σ on 𝒱₀. More generally, it suffices that the κ-Frobenius on ℙ(𝒱_κ̄) is a power of the 𝔽_{p²}-Frobenius. Drop “trivial if N = 2”. In Lemma 5.6.2(3), add the check that the fibres are split. Via η°_𝔭 (Construction 5.6.1), DL_{s°} ≅ Iso(Λ̄°_𝔭) ⊗ κ, and Frobenius acts as a scalar times a power of the 𝔽_{p²}-Frobenius. Scalars act trivially on ℙ(𝒱_{s°}).

**Effect on the main results.** As stated, Lemma A.1.4(4) is false. Its only use is Lemma 5.6.2(3), which is left with a gap but is very plausibly true by the split-form argument. Lemma 5.6.2(3) feeds Lemma 5.9.3(6), §6 and Lemma 7.2.5(4), so the main theorems are not believed affected, but their written proof passes through this step.

### E10. Primitive cohomology and Ω_N are wrong at N = 2

*Error; reaches a stated result.* **Where:** §C.2, definition of H^prim(Iso(Λ̄_N)_κ̄, Q̄_ℓ) and of Ω_N, published p. 352–353 ('Let N ⩾ 2 be an integer'); Proposition C.2.1(1),(2) at N = 2, p. 353–355; arXiv v3 p. 163; also Definition 5.6.3 and Proposition 5.6.4, display (5.13), published p. 213 (same root cause as E10, Appendix C.2 p. 353). **Already corrected in print:** none found (new)

**What the paper says.** §C.2 allows N ⩾ 2. It defines H^prim(Iso(Λ̄_N)) as the kernel of ∪c₁(O(1)): H^{N−2} → H^N(1), and asserts that it is a unique irreducible representation Ω_N of Ū_N(κ⁺). Definition 5.6.3 and (5.13) in Proposition 5.6.4 use the same kernel for N ⩾ 2.

**Why it is wrong or incomplete.** For N = 2, Iso(Λ̄₂) is the set of q + 1 isotropic lines, which has dimension 0. So H² = 0 and the kernel is all of H⁰. That is the (q + 1)-dimensional permutation representation 𝟏 ⊕ St of U₂(𝔽_q), which is reducible, so no irreducible Ω₂ ≅ H^prim exists. The paper's own (C.1) and C.2.1(2) single out St, of dimension q. For the same reason, at N = 2 the left side of (5.13) has an extra copy of Map_{K°_𝔭}(…, 𝟏).

**Correction.** For N = 2, define H^prim as reduced H⁰: the kernel of the degree (Gysin) map to H² of the ambient ℙ¹, which has dimension q since q + 1 is invertible. Set Ω₂ := St = PS(ε₂^TT). In Definition 5.6.3, use the kernel of the Gysin map m^{†°}_!: H^{N−2}_𝔗(M̄†) → H^N_𝔗(M̄°). This agrees with the printed definition for N ⩾ 3 when p + 1 is invertible. Alternatively, restrict these statements to N ⩾ 3.

**Effect on the main results.** The error affects stated results, but only at N = 2: the definitions and assertions of §C.2 and (5.13). No written downstream argument uses H^prim or Ω₂ at N = 2. Lemma 6.3.2 assumes N ⩾ 4, Proposition 6.3.1 leaves N = 2 to the reader, and Proposition 5.6.4(1) survives because 𝟏 and St both have Borel-fixed vectors. The main theorems are not affected.

### E11. Proposition A.1.3(3) proof: target rank should be h − d

*Misprint; reaches nothing.* **Where:** Proof of Proposition A.1.3(3), published p. 322. **Already corrected in print:** none found (new)

**What the paper says.** To reduce to d = 0, the proof sends H ∈ DL(𝒱₀, { , }₀, h) to H/𝒱₀^⊣ in DL(𝒱′₀, { , }′₀, h), where 𝒱′₀ = 𝒱₀/𝒱₀^⊣, and calls this map an isomorphism.

**Why it is wrong or incomplete.** 𝒱₀^⊣ has dimension d and 𝒱₀^⊣ ⊆ H^⊣ ⊆ H, so H/𝒱₀^⊣ has rank h − d, not h. With N′ = N − d and h′ = h − d, the hypothesis N + d < 2h ⩽ 2N becomes N′ < 2h′ ⩽ 2N′, which is exactly the d = 0 case just proved. With h′ = h it does not.

**Correction.** The target is DL(𝒱′₀, { , }′₀, h − d).

**Effect on the main results.** None.

### E12. Primitive class of ℙ(Y_N): wrong degree and wrong coefficient

*Misprint; reaches nothing.* **Where:** Proof of Proposition C.2.1(2), published pp. 354–355 (last line of p. 354 to the top of p. 355); arXiv v3 p. 165. **Already corrected in print:** none found (new)

**What the paper says.** The proof of C.2.1(2) takes the class of ℙ(Y_N) ≅ ℙ^{r−1} ⊂ Iso(Λ̄_N) and says that this class, “subtracted by c₁(O_{ℙ(Λ̄_N)_κ̄}(1))”, is a nonzero element of H^prim(r − 1).

**Why it is wrong or incomplete.** ℙ(Y_N) has codimension r − 1 in the (2r − 2)-dimensional Fermat hypersurface, which has degree q + 1. So its class lies in H^{2r−2}(r − 1), while h = c₁(O(1)) lies in H²(1): the subtraction only makes sense for r = 2. Even then ([ℙ¹] − h)·h = 1 − (q + 1) ≠ 0. Since H^{2r} is spanned by h^r, the class [ℙ(Y_N)] − c·h^{r−1} is primitive iff c = 1/(q + 1).

**Correction.** Use [ℙ(Y_N)] − (q + 1)^{−1}·h^{r−1} for r ⩾ 2. For r = 1, use [pt] − (q + 1)^{−1}·1 in reduced H⁰ (see E10).

**Effect on the main results.** None. The corrected class is nonzero: [ℙ(Y_N)]² is an integer, whereas (h^{r−1}/(q + 1))² = 1/(q + 1) is not. So Ω_N^{P^{(r)}} ≠ 0 and C.2.1(2) stand.

### E13. Lemma 8.1.7: rational isomorphism does not give integral isomorphism

*Gap; reaches the proof.* **Where:** Proof of Lemma 8.1.7, published p. 307; arXiv v3 Lemma 8.1.7, PDF p. 134; arXiv v1/v2 Lemma 8.1.4, PDF p. 133. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Lemma 8.1.7 notes that the localized cohomology at both levels K° and K• is O_λ-torsion free. It concludes that 'it suffices to show' an isomorphism (8.1) of ℚ̄_ℓ[Γ_F]-modules after ⊗ ℚ̄_ℓ.

**Why it is wrong or incomplete.** Torsion-free O_λ[Γ]-modules with isomorphic rationalizations need not be isomorphic. For example, Γ = ℤ acting on O_λ² by (1 1; 0 1) and by (1 λ; 0 1) gives two lattices in the same rational representation whose reductions mod λ differ. Localization at 𝔪₁ fixes only the residual eigensystem, so several π₁ can contribute, and no Burnside/Morita argument rescues the step.

**Correction.** Show that the integral, Γ_F- and Hecke-equivariant correspondence T^{•∘}_{n₁,𝔭} is an isomorphism. On each π₁-part, T^{∘•}T^{•∘} and T^{•∘}T^{∘•} act by the same scalar c(π₁) = p^{r₁²+r₁} ∏_{i=1}^{r₁}(α_i+p)(α_i+p⁻¹)/α_i (Proposition B.4.3(1)). Intertwining genericity mod λ makes every c(π₁) a λ-adic unit, so both composites have unit determinant on the free modules.

**Effect on the main results.** This affects the proof. The integral statement carries m_lat, fixed at hyperspecial level, to the level-raised variety at a prime 𝔭 that depends on m, in (8.7) of Theorem 8.2.2 and likewise in Theorem 8.3.2. With only a rational isomorphism, the choice m > m_per + m_lat + … would be circular. The lemma is true and the repair uses only the paper's own inputs, so Theorems 1.1.1, 1.1.5, 1.1.7 and 1.1.9 stand.

### E14. Remark 7.3.5: coefficient degree 2n should be 2n−1

*Misprint; reaches nothing.* **Where:** Remark 7.3.5, published p. 302. **Already corrected in print:** none found (new)

**What the paper says.** Remark 7.3.5 says that loc_𝔭([Sh(V_n,K_sp)]) lies in H¹_ur(F_𝔭, H^{2n}_ét((Sh(V_{n₀},K_{n₀}) ×_F Sh(V_{n₁},K_{n₁}))_{F̄_𝔭}, O_λ(n))/(𝔫₀,𝔫₁)).

**Why it is wrong or incomplete.** The class has absolute degree 2n. The Hochschild–Serre edge map therefore gives an H¹ with coefficients in geometric cohomology of degree 2n−1, the middle degree of the (2n−1)-dimensional product. (7.3) just above has exactly this degree, (2r₀−1)+2r₁ = 2n−1.

**Correction.** Read H^{2n−1}_ét(…_{F̄_𝔭}, O_λ(n))/(𝔫₀,𝔫₁) as the coefficient module.

**Effect on the main results.** None; this is a remark.

### E15. Hodge–Tate weights: [1−n, n] should be [−n, n−1]

*Misprint; reaches nothing.* **Where:** Proof of Theorem 8.3.2, second bullet of the pairing computation, published p. 319; arXiv v3 PDF p. 142; arXiv v1 proof of Theorem 8.3.2. **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Theorem 8.3.2 (the case above Σ⁺_ℓ), R_ℚ is said to be crystalline with Hodge–Tate weights in [1 − n, n].

**Why it is wrong or incomplete.** With ℚ_ℓ(1) of weight −1, R₀ ⊂ ρ_{Π₀,λ}(r₀) has weights −r₀, …, r₀ − 1 and R₁ ⊂ ρ_{Π₁,λ}(r₁) has weights −r₁, …, r₁. Since r₀ + r₁ = n, the weights of R = R₀ ⊗ R₁ lie in [−n, n − 1]. The identical sentence in the rank-zero proof (p. 311) prints [−n, n − 1].

**Correction.** Replace [1 − n, n] by [−n, n − 1].

**Effect on the main results.** None. For n ⩾ 2 both intervals have width 2n − 1 and satisfy the sign condition that Lemma 2.4.3(2) and Lemma 2.2.7 need, so the argument is unaffected.

### E16. Chebotarev step should use the lift γ̃, not γ

*Misprint; reaches nothing.* **Where:** Proof of Lemma 2.6.4, last Chebotarev sentence, published p. 134 (PDF p. 28); arXiv v3 p. 19. **Already corrected in print:** none found (new)

**What the paper says.** The last step of the proof of Lemma 2.6.4 picks a place w̃ of F̃_S whose Frobenius 'coincides with γ'.

**Why it is wrong or incomplete.** The Frobenius of a place of F̃_S lies in Gal(F̃_S/F⁺), whereas γ was declared an element of Gal(F₊^{(m)}/F⁺). The argument needs the lift γ̃ built in the preceding sentence.

**Correction.** Read 'coincides with γ̃'. Its restriction to F₊^{(m)} is γ, as the definition of γ-associated requires.

**Effect on the main results.** None by itself. The step it serves is the faulty one of E1.

### E17. Footnote 1 needs Definition 1.1.3(3), not only (2)

*Gap; reaches nothing.* **Where:** Footnote 1 to Theorem 1.1.7(a), published p. 112; arXiv v3 p. 4; arXiv v1 p. 4. **Already corrected in print:** none found (new)

**What the paper says.** Footnote 1 to Theorem 1.1.7(a) says that, by Definition 1.1.3(2) (Π∘c ≃ Π^∨), the Satake parameter of Π_{1,𝔭} at the inert prime 𝔭 must contain 1 at least once.

**Why it is wrong or incomplete.** For odd n₁, condition (2) only makes the parameter stable under α ↦ α⁻¹, so an odd-size multiset contains 1 or −1. Twisting a conjugate-orthogonal Π by a Hecke character χ with χ|_{𝔸_{F⁺}^×} = η_{F/F⁺} keeps (1) and (2), but it multiplies the parameter at an unramified inert 𝔭 by η(ϖ_𝔭) = −1. For example, {1, α, α⁻¹} becomes {−1, −α, −α⁻¹}, which need not contain 1.

**Correction.** Cite Definition 1.1.3 as a whole. Condition (3), via Remark 1.1.4 (L(s, Π₁, As⁻) regular at s = 1), makes Π₁ conjugate-orthogonal, and for such Π₁ the parameter does contain 1.

**Effect on the main results.** None. The footnote is a side remark, and the claim is true for the relevant Π₁ to which Theorem 1.1.7 applies.

### E18. q-analogue convention should read [0]_q! = 1

*Misprint; reaches nothing.* **Where:** Notation 1.3.1, published p. 119; arXiv v3 p. 9. **Already corrected in print:** none found (new)

**What the paper says.** Notation 1.3.1 sets [0]_q = 1 and [n]_q = (qⁿ − 1)/(q − 1).

**Why it is wrong or incomplete.** At n = 0 the general formula gives [0]_q = 0, contradicting the stated value. What the q-binomials with m ∈ {0, n} need is the empty product [0]_q! = 1.

**Correction.** Read '[0]_q! = 1'.

**Effect on the main results.** None.

### E19. F̄ is the algebraic closure, not the Galois closure, of F

*Misprint; reaches nothing.* **Where:** §1.3, Ground fields, published p. 119; arXiv v3 p. 9; arXiv v1 p. 10. **Already corrected in print:** none found (new)

**What the paper says.** §1.3 defines F̄ as 'the Galois closure of F in ℂ' and puts Γ_F := Gal(F̄/F).

**Why it is wrong or incomplete.** The Galois closure is a finite extension. Γ_F would then be a finite group, and Galois representations, étale cohomology and Selmer groups over F would make no sense. Everywhere else, F̄ is used as the algebraic closure (e.g. F_ρ^{ab} ⊆ F̄).

**Correction.** F̄ is the algebraic closure of F in ℂ, i.e. ℚ̄.

**Effect on the main results.** None.

### E20. Footnote 5 cites Lemma 2.2.6 for a converse it cannot give

*Gap; reaches nothing.* **Where:** Footnote 5 to Definition 2.2.4(2), published p. 125; arXiv v3 p. 13. **Already corrected in print:** none found (new)

**What the paper says.** Footnote 5 says that, by Lemma 2.2.6, when a ⩽ 0 ⩽ b and b − a ⩽ ℓ − 2, a free R is crystalline with Hodge–Tate weights in [a, b] if and only if R_ℚ is.

**Why it is wrong or incomplete.** The direction 'R_ℚ crystalline ⇒ R crystalline' is immediate from Definition 2.2.4, since each R/ℓ^m R is the quotient of the lattices ℓ^m R ⊆ R. The converse says that a lattice whose finite quotients are all torsion crystalline has crystalline R_ℚ. That is a genuine theorem (Fontaine–Laffaille, or T. Liu's limit theorem). Lemma 2.2.6 assumes that R_ℚ is crystalline, so it cannot supply it.

**Correction.** Note that the easy direction follows from the definition, and cite Fontaine–Laffaille theory or T. Liu's theorem on limits of torsion crystalline representations for the converse.

**Effect on the main results.** None. Only the easy direction is used later (e.g. Lemma 2.4.3(2)).

### E21. Lemma 2.3.5(b) false when the residue field is bigger than 𝔽_ℓ

*Error; reaches a stated result.* **Where:** Lemma 2.3.5(b) and its proof, published pp. 127–128; arXiv v3 Lemma 2.3.5, p. 15; arXiv v1/v2 Lemma 2.3.4(b), pp. 14–15. **Already corrected in print:** none found (new)

**What the paper says.** Lemma 2.3.5(b) says that Res_ρ is injective if dim R̄ ⩽ min{(ℓ+1)/2, ℓ−3}, R̄ is semisimple and Hom_{k[Γ_F]}(End R̄, R̄) = 0, where k = O_λ/λ. Its proof identifies End(R̄) ⊗_{𝔽_ℓ} k with End(R̄)^d, where d = [k : 𝔽_ℓ].

**Why it is wrong or incomplete.** As k[G]-modules, End(R̄) ⊗_{𝔽_ℓ} k ≅ ⊕_{σ ∈ Gal(k/𝔽_ℓ)} End(R̄)^{(σ)}, a sum of Frobenius twists, not End(R̄)^d. The 𝔽_ℓ-subspaces G^i/G^{i+1} ⊆ End(R̄) can map to R̄ through a twist. Counterexample: ℓ = 5, k = 𝔽₂₅, m = 2, R̄ = χ₁ ⊕ χ₂ with h ↦ (ζ⁵, ζ⁴), and G = A ⋊ H with A = {1 + 5x·e₁₂ : x ∈ 𝔽₂₅}, on which h acts by ζ. Then Hom_{k[G]}(End R̄, R̄) = 0, since the characters are ζ^{0,0,1,23} against ζ^{5,4}. But x ↦ (x⁵, 0) is an H-equivariant map A → R̄, so H¹(G, R̄) ≠ 0 and Res_ρ is not injective.

**Correction.** Replace the last hypothesis of (b) by Hom_{𝔽_ℓ[Γ_F]}(End R̄, R̄) = 0, i.e. Hom_{k[Γ_F]}(End(R̄)^{(σ)}, R̄) = 0 for every σ ∈ Gal(k/𝔽_ℓ). Then the printed proof works. As printed, (b) is correct when k = 𝔽_ℓ.

**Effect on the main results.** Theorem 1.1.1 uses (a), so it is unaffected. Theorem 1.1.7 is safe, because the Jordan-type argument of Lemma 8.1.5(2) also excludes every Frobenius twist. But (L5-1) in Definition 8.1.1 admits primes that satisfy only (b). So Theorems 1.1.5 and 1.1.9 (8.2.2, 8.3.2) are unproved for admissible λ with residue degree > 1 that satisfy only (b). They hold once (L5-1) uses the corrected (b).

### E22. Lemma 2.3.4: S should be free over O_λ/λ^{m−m′}; stray 'p'

*Misprint; reaches nothing.* **Where:** Lemma 2.3.4, published p. 127; arXiv v3 Lemma 2.3.4, p. 15; arXiv v1/v2 Lemma 2.3.6, p. 15. **Already corrected in print:** none found (new)

**What the paper says.** Lemma 2.3.4 takes S free over O_λ/λ^m 'for some positive integer m'. Its proof adapts [46] 'with ℤ/pⁿ replaced by O_λ/λ^m p'.

**Why it is wrong or incomplete.** m is already fixed by R ∈ Mod(F, O_λ/λ^m)_fr. Yet the lemma is applied (Prop. 2.6.6, §§8.2–8.3) to S free over O_λ/λ^{m−m₀}, resp. O_λ/λ^{m−m_Σ}, and the Kolyvagin argument works in that generality. The trailing 'p' is a stray.

**Correction.** Read 'free O_λ/λ^{m−m′}-module of rank r_S for some integer 0 ⩽ m′ < m' and 'with ℤ/pⁿ replaced by O_λ/λ^m'.

**Effect on the main results.** None.

### E23. Prop. 2.6.6 (abundant tuples exist) fails through Lemma 2.6.4

*Error; reaches a stated result.* **Where:** Proposition 2.6.6, published pp. 134–135; arXiv v3 p. 20; arXiv v1/v2 Proposition 2.5.5, p. 19. **Already corrected in print:** none found (new)

**What the paper says.** Proposition 2.6.6 says that an (S, γ)-abundant r_S-tuple exists under four conditions: R_ℚ is absolutely irreducible, Lemma 2.3.5(a) or (b) holds, γ has order prime to ℓ, and (R̄^{(m)})^{h_γ} is free of rank 1.

**Why it is wrong or incomplete.** Its proof deduces this from Lemma 2.6.4 (E1). In the E1 example all four hypotheses hold: rank one, −1 ∈ ε̄(Γ_F) is a nontrivial scalar, γ has order 2, and h_γ = 1. There r_S = 1 and m₀ = 0, but G_{S,γ} = {1}, so θ_S(Ψ) = 0 for every Ψ ∈ G_{S,γ} and no element is abundant. In the base-change setting the same happens when S lies in the 𝔠-eigenspace opposite to the sign of γ, and for every γ when r_S = 2 with one class in each eigenspace.

**Correction.** Add a hypothesis that the O_λ-span of θ_S(G_{S,γ}) contains λ^c·Hom(S, (R̄^{(m)})^{h_γ}) with c independent of m. This is automatic if [F:F⁺] = 1, holds with c = 𝔣(r_S)𝔯_{Ind R} if R_ℚ ≇ R_ℚ^𝔠, and holds for S in the eigenspace matching γ's sign. In §8, choose γ to suit S: in rank one, use γ's of opposite signs at the two places.

**Effect on the main results.** Same reach as E1. This is the step through which Lemma 2.6.4 enters Theorems 8.2.2 (r_S = 1) and 8.3.2 (r_S = 2). The gap is in the self-conjugate case R_ℚ ≅ R_ℚ^𝔠: all of Theorem 1.1.1, and the base-change instances of Theorems 1.1.5, 1.1.7 and 1.1.9. It is repairable for 1.1.1 when ℓ ≫ 0. No main theorem is shown false.

### E24. The canonical polarization of the Sym lattice needs ℓ ⩾ n_α

*Error; reaches nothing.* **Where:** §2.7, paragraph before Proposition 2.7.2, published pp. 136–137; arXiv v3 p. 21; arXiv v1 p. 21. **Already corrected in print:** none found (new)

**What the paper says.** §2.7 asserts that, for every odd ℓ unramified in F, R_α = (Sym^{n_α−1} H¹_ét(A_α, ℤ_ℓ))(r_α) has a canonical (1 − α)-polarization R_α^𝔠 ≅ R_α^∨(1 − α).

**Why it is wrong or incomplete.** The Weil pairing induces on Sym^k T (k = n_α − 1) a pairing with entries ±a!(k−a)!, whose dual lattice is the divided-power lattice Γ^k T. For large image these lattices are homothetic only if every binomial coefficient C(k, a) is prime to ℓ. That fails for ℓ ⩽ k ⩽ 2ℓ − 2 (e.g. ℓ = 3, n₀ = 4: C(3, 1) = 3), and then no polarization exists.

**Correction.** Require ℓ ⩾ n_α, so that all C(n_α − 1, a) are ℓ-units; e.g. 'for ℓ > n₁'.

**Effect on the main results.** None. Proposition 2.7.2 and Lemma 8.1.3 (for Theorem 1.1.1) use only sufficiently large ℓ.

### E25. Prop. 2.7.2(3) proof: three conditions on (a, b) are wrong

*Error; reaches the proof.* **Where:** Proof of Proposition 2.7.2(3), published p. 137; arXiv v3 p. 22; arXiv v1/v2 proof of Proposition 2.6.3(3), pp. 21–22. **Already corrected in print:** none found (new)

**What the paper says.** The proof picks g whose image is conjugate to (diag(a, 1), diag(ab, b⁻¹), a⁻¹), with (a, b) subject to four listed conditions. It claims that the image of g^{[F′:F⁺]}𝔠 then satisfies (a)–(e) of Lemma 2.7.1.

**Why it is wrong or incomplete.** Put t = [F′:F⁺] and y = g^t𝔠. Then ξ = ε̄_ℓ(y) = −a^{−t}. If ρ̄_{A_α}(g) is diagonal in a basis where 𝔠 acts by diag(1, −1), then h_{γ₀} has eigenvalues a^{2ti} and h_{γ₁} has eigenvalues (ab²)^{2tj}. So (a), (d), (e) read 𝒫(−a^{−t}) ≠ 0, a^{2ti} ≠ −1 and (a(ab²)^{2j})^t ≠ 1; only the second printed condition is right. For r₀ = r₁ = t = 1 and 𝒫 = T² − 1, take a of order 4 and b⁴ ∉ {±1, ±a}: all printed conditions hold, but h_{γ₀} has the eigenvalue a⁻² = −1, violating (d). The conjugacy class of ρ̄(g) alone does not fix h_γ either: if 𝔠 swaps the eigenlines, h_{γ₀} is scalar and (c) fails.

**Correction.** Choose g with ρ̄_{A_α}(g) diagonal in bases where complex conjugation is diag(1, −1). This is possible because the image is {det g₀ = det g₁}. Then impose: 𝒫(−a^{−t}) ≠ 0; (a^{2i}(ab²)^{2j})^t ≠ 1 for (i, j) ≠ (0, 0); (a^{2i})^t ≠ −1; and (a(ab²)^{2j})^t ≠ 1. Such (a, b) exist for ℓ ≫ 0 when 𝒫 ≠ 0.

**Effect on the main results.** The statement survives. So Lemma 8.1.3, and with it Theorem 1.1.1 (Cor. 8.2.3), is unaffected once the proof is repaired.

### E26. ℚ(Π′) should read ℚ(Π)′ in the proof of Lemma 3.1.2

*Misprint; reaches nothing.* **Where:** Proof of Lemma 3.1.2, published p. 139, lines 7–8; arXiv v3 p. 23. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Lemma 3.1.2 concludes 'ℚ(Π′) is contained in ℚ(Π)'.

**Why it is wrong or incomplete.** Π′ is not defined. The paragraph shows that each γ fixing ℚ(Π) fixes every ℚ(Π_w), hence fixes their composite ℚ(Π)′, which the proof defined.

**Correction.** Read 'ℚ(Π)′ is contained in ℚ(Π)'.

**Effect on the main results.** None.

### E27. Remark 3.1.6(2),(3) need ‖v‖² ≠ 1 in L

*Error; reaches nothing.* **Where:** Remark 3.1.6(2),(3), published p. 140; arXiv v3 p. 24; v1 p. 23. **Already corrected in print:** none found (new)

**What the paper says.** Remark 3.1.6 says that, for a unitary Satake parameter α over a field L, (2) 'intertwining generic' means that the pair {−‖v‖, −‖v‖⁻¹} does not occur in α. It also says that (3) 'level-raising special' means that {‖v‖, ‖v‖⁻¹} occurs exactly once.

**Why it is wrong or incomplete.** Unitarity forces the multiplicity of 1 to be ≡ N mod 2 and the multiplicity of −1 to be even. If ‖v‖ = ±1 in L (N even), then ‖v‖ is always a root of even multiplicity, so P′(‖v‖) is never invertible, although the pair can occur once (L = 𝔽₃, ‖v‖ = 7, α = {1, 1}). If ‖v‖ = −1 in L (N odd), then P(−‖v‖) = P(1) = 0 always, although the pair {1, 1} can be absent (α = {1}).

**Correction.** Add the hypothesis ‖v‖² ≠ 1 in L; for (2), ‖v‖ ≠ −1 suffices.

**Effect on the main results.** None. Wherever the remark is used, ‖v‖² ≠ 1 in L: (P2)/(PI2) impose ℓ ∤ p(p² − 1), and Prop. C.2.5 works over ℂ.

### E28. Π∘c ≃ Π^∨ alone does not make Satake parameters unitary

*Error; reaches nothing.* **Where:** Construction 3.1.10, published p. 142; arXiv v3 p. 25; v1 p. 25. **Already corrected in print:** none found (new)

**What the paper says.** Construction 3.1.10 asserts that if Π∘c ≃ Π^∨, then α(Π_v) is unitary for every v ∉ Σ⁺_Π.

**Why it is wrong or incomplete.** At an inert v one only gets α = α⁻¹ as multisets. So (−T)^N·P_α(T⁻¹) = ω_Π(ϖ_v)·P_α(T), and ω_Π|_{𝔸_{F⁺}^×} can be η_{F/F⁺}, which gives the sign −1. Example: N = 1 and Π = χ, a Hecke character extending η_{F/F⁺}. Then χ∘c = χ⁻¹, but α(χ_v) = {−1} at inert v, which is not unitary.

**Correction.** Assume also that ω_Π is trivial on 𝔸_{F⁺}^× (true for relevant Π). In general, the product of the entries at an inert v is ω_Π(ϖ_v) = ±1.

**Effect on the main results.** None. The construction is used only for relevant Π, where Definition 1.1.3(3) forces ω_Π|_{𝔸_{F⁺}^×} = 1.

### E29. Remark 3.2.6: ℚ(Π) as a strong coefficient field is unproved

*Gap; reaches nothing.* **Where:** Remark 3.2.6 (second sentence), published p. 145; arXiv v3 p. 27; v1 p. 27. **Already corrected in print:** none found (new)

**What the paper says.** Remark 3.2.6 claims that, under Hypothesis 3.2.10, ℚ(Π) itself is a strong coefficient field when Π ≃ BC(π) for a standard pair (V, π) with V standard indefinite.

**Why it is wrong or incomplete.** Hypothesis 3.2.10 says something only when ρ_{BC(π),ι_ℓ} is irreducible, which the remark does not assume. Even then, let M be the φ_Π-part of H^{N−1}_ét with ℚ(Π)_λ-coefficients. Then M ⊗ ℚ̄_ℓ ≅ (ρ^c)^{⊕d}, and ρ^c descends to ℚ(Π)_λ only if the central simple algebra End_{Γ_F}(M) splits. The remark gives no argument for this.

**Correction.** Add the hypothesis that ρ_{Π,ι_ℓ} is irreducible and give a splitting (descent) argument, or delete the sentence.

**Effect on the main results.** None. All results take a strong coefficient field E as given, and one exists by [16, Prop. 3.2.5].

### E30. Hypothesis 3.2.10 cases with F⁺ ≠ ℚ rest on unpublished [37]

*Gap; reaches a stated result.* **Where:** Proposition 3.2.11 and its proof, published p. 146; reference [37], p. 374; arXiv v3 p. 28; v1 p. 27 (Proposition 3.2.10). **Already corrected in print:** none found (new)

**What the paper says.** Proposition 3.2.11 states Hypothesis 3.2.10 for N ⩽ 3, and for N > 3 if F⁺ ≠ ℚ. Its proof says the case N ⩾ 3 with F⁺ ≠ ℚ 'will be proved in [37]'. The bibliography lists [37] as Kisin–Shin–Zhu, with a temporary title, in preparation.

**Why it is wrong or incomplete.** Nothing in the paper proves these cases, yet they are used as known: the proof of Corollary 8.2.3 says 'By Proposition 3.2.11 and (c), Hypothesis 3.2.10 is known in this case'. Since n₁ ⩾ 3 always, every use with F⁺ ≠ ℚ needs [37], even for n = 2. The Kisin–Shin–Zhu paper that did appear (arXiv:2110.05381) proves a trace formula and defers this application to a sequel.

**Correction.** State the cases N ⩾ 3 with F⁺ ≠ ℚ of Proposition 3.2.11 as conditional on [37] (or on Hypothesis 3.2.10), and carry that condition into every result that uses them.

**Effect on the main results.** As unconditional statements, Theorems 1.1.1, 1.1.5, 1.1.7 and 1.1.9 all depend on the unpublished [37]. All four assume F⁺ ≠ ℚ, and they depend on it for every n ⩾ 2, not only for n ⩾ 3, because N = n₁ ⩾ 3 always occurs. Corollaries 8.2.3 and 8.2.5 depend on [37] likewise whenever F⁺ ≠ ℚ. Their printed case n = 2, F⁺ = ℚ does not use [37], but it has its own gap (E105). Theorems 8.2.2 and 8.3.2 are fine as conditional statements, since they assume Hypothesis 3.2.10 explicitly.

### E31. Footnote 11's criterion for 'very special inert' is wrong

*Error; reaches nothing.* **Where:** Definition 3.3.4, footnote 11, published p. 147; arXiv v3 p. 28 (footnote 11). **Already corrected in print:** none found (new)

**What the paper says.** Footnote 11 says that a special inert 𝔭 splits completely in F⁺_rflx ('very special inert') if and only if every prime of F⁺ above p that is inert in F has odd degree over ℚ_p.

**Why it is wrong or incomplete.** Let M be the Galois closure of F, σ the Frobenius at 𝔭, and H the subgroup generated by the stabilizers of CM types. Then 𝔭 is very special iff σc ∈ H. The footnote's condition is equivalent to something else: that some CM type Φ ∋ τ_∞ is σ²-stable, i.e. (P3). One direction fails for F = ℚ(√(−(3+√2))) (group D₄) and p = 17. The only prime above 17 that is inert in F has degree 1, but the reflex intersection is ℚ(√7) and (7/17) = −1, so the prime is not very special. The other direction fails for an octic CM field with group W(B₄). There the primes above p that are inert in F are two, one of degree 2, and 𝔭 is still very special.

**Correction.** Delete the footnote or replace it by the criterion: 𝔭 is very special iff σc ∈ H.

**Effect on the main results.** None. No proof uses the footnote, since Lemma 8.1.4 uses the definition. But it misleads anyone checking hypothesis (a) of Theorem 1.1.7 (Cor. 8.2.5). In the cases of Remark 1.1.8, both conditions reduce to 'special inert'.

### E32. Reflexive closure too small to force (PI3) in §8

*Gap; reaches the proof.* **Where:** Definition 3.3.2, published p. 147 (and its use in Definition 8.1.1 (L5-2), p. 303, and in the choice of 𝔭 in the proofs of Theorem 8.2.2, p. 310, and Theorem 8.3.2, pp. 318–319); arXiv v3 p. 28. **Already corrected in print:** none found (new)

**What the paper says.** Definition 3.3.2 defines F_rflx as the field generated by F and ⋂_Φ F_Φ, the intersection of the reflex fields of all CM types of F. (L5-2) takes γ in the image of Gal(F̄/F⁺_rflx). The proofs of Theorems 8.2.2 and 8.3.2 then use Chebotarev to pick a γ-associated special inert 𝔭 satisfying (PI1)–(PI7), including (PI3): some CM type Φ ∋ τ∞ has ℚ_p^Φ = ℚ_{p²}, i.e. σ_𝔭² stabilizes Φ.

**Why it is wrong or incomplete.** The implicit argument is that Frob_𝔭 fixes F⁺_rflx. With the intersection, this only gives σ_𝔭 ∈ c·(Gal(M/F) ∩ H), where M is the Galois closure and H is generated by the stabilizers of CM types, and that does not imply (PI3). In the explicit W(B₄) field of E31, 𝔭 = (43, α − 11) splits in F⁺_rflx = F⁺(√197), yet no CM type has ℚ_43^Φ = ℚ_{43²}, and such Frobenius classes have positive density. Also, a γ-associated place is constrained only on F⁺^{(m)} and F_S, so its Frobenius on M is not controlled. In arXiv v1–v3, F_rflx was the composite of F and all F_Φ, which is M; then Frob_𝔭|_M = c and (PI3) holds automatically.

**Correction.** Make the Chebotarev choice deliver (PI3). Three options: (1) restore the v1–v3 composite, and correct Remarks 1.1.8 and 3.3.3 for non-Galois F; (2) set F_rflx := F·F̃_{Φ₀}, where F̃_{Φ₀} is the Galois closure of the reflex field of one fixed CM type Φ₀, so that σ_𝔭 = c·h with h stabilizing Φ₀ and hence σ_𝔭² stabilizing Φ₀ (this still gives F_rflx = F when F is Galois or contains an imaginary quadratic field); (3) keep the definition, add Frob_𝔭|_M = c to the Chebotarev conditions, and prove compatibility, e.g. M ∩ F⁺^{(m)}F_S ⊆ F_rflx. Options (1) and (2) narrow 'admissible' and 'very special inert'.

**Effect on the main results.** It reaches the main results through the proofs of Theorems 8.2.2 and 8.3.2, which make this choice of 𝔭. Those proofs, and so the proofs of Theorems 1.1.1, 1.1.5, 1.1.7, 1.1.9 / 8.2.3, 8.2.5, need the repair above. The repair may narrow the definitions of admissible primes (Definition 8.1.1) and very special inert primes. Nothing changes when F is Galois or contains an imaginary quadratic field, since then every special inert prime satisfies (PI3).

### E33. Perfectness criterion 'only if' fails over characteristic-0 bases

*Misprint; reaches nothing.* **Where:** Notation 3.4.7, published p. 150; arXiv v3 p. 30. **Already corrected in print:** none found (new)

**What the paper says.** Notation 3.4.7 says that the pairing ⟨ , ⟩_{λ,τ}: H₁^dR(A/S)_τ × H₁^dR(A/S)_{τ^c} → 𝒪_S induced by λ is perfect if and only if λ is p-principal, for any S ∈ Sch_{/ℤ_p^τ}.

**Why it is wrong or incomplete.** Sch_{/ℤ_p^τ} includes ℚ_p^τ-schemes. On these, every quasi-isogeny induces an isomorphism on H₁^dR, so the pairing is perfect even when λ is not p-principal, e.g. when ker(cλ) has p-power order. The 'if' direction, and 'only if' when p is locally nilpotent, are fine.

**Correction.** Read 'perfect if λ is p-principal, and, when p is locally nilpotent on S, only if', or restrict S to schemes on which p is locally nilpotent.

**Effect on the main results.** None. Every use in §§4–5 is in characteristic p or uses only the 'if' direction.

### E34. ker 𝙵 = im 𝚅 is ω_{(A^{(p)})^∨}, not ω_{A^{(p)}}

*Misprint; reaches nothing.* **Where:** Paragraph after Notation 3.4.9, published p. 152; arXiv v3 p. 31; v1 p. 31 (Remark 3.4.10). **Already corrected in print:** none found (new)

**What the paper says.** After Notation 3.4.9 the paper states ker 𝙵 = im 𝚅 = ω_{A^{(p)}/S} and ker 𝚅 = im 𝙵.

**Why it is wrong or incomplete.** ker 𝙵 and im 𝚅 are subbundles of H₁^dR(A^{(p)}/S), whose Hodge subbundle is ω_{(A^{(p)})^∨/S} by (3.2). ω_{A^{(p)}/S} sits in H₁^dR of the dual. Notation 3.4.10(3) uses the correct form 𝚅𝒟(A)_{στ}/p𝒟(A)_τ ≃ ω_{A^∨,τ}.

**Correction.** ker 𝙵 = im 𝚅 = ω_{A^{(p)∨}/S} (= ω_{A^∨/S}^{(p)}).

**Effect on the main results.** None. A dual sign is dropped, and a p-principal polarization identifies the two anyway.

### E35. Lemma 3.4.12(2) needs 𝔭 inert in F

*Error; reaches a stated result.* **Where:** Lemma 3.4.12 (hypotheses) and proof of (2), published pp. 153, 155; arXiv v3 p. 32; v1 p. 31 (Lemma 3.4.13). **Already corrected in print:** none found (new)

**What the paper says.** Lemma 3.4.12 assumes only that F⁺_𝔭 = ℚ_p. Part (2) asserts rank Lie_{B,τ∞} − rank Lie_{A,τ∞} = rank ker α_{*,τ∞} − rank ker α_{*,τ∞^c}. The proof writes s = dim ω_{B^∨,τ∞^c} = dim 𝚅𝒟(B)_{τ∞}/p𝒟(B)_{τ∞^c}.

**Why it is wrong or incomplete.** That step uses στ∞^c = τ∞, which holds only if 𝔭 is inert in F. If 𝔭 splits, (2) is false. Take F⁺ = ℚ, F imaginary quadratic with p = w₁w₂, ϖ = p, A = E ordinary with O_F-action, B = E/E[w₁] and βα = p. Then α_{*,τ∞} = 0 and α_{*,τ∞^c} is an isomorphism, so the right side is 1 − 0 = 1. But B[w^∞] ≅ E[w^∞] for both w, so the left side is 0. The first equality also silently needs r_{τ∞} + r_{τ∞^c} = N for B, i.e. a signature type, which (2) does not assume.

**Correction.** Assume 𝔭 inert in F, and read τ as τ̲∞. Then prove (2) directly: Lie_{B,τ∞} = 𝒟(B)_{τ∞}/𝚅𝒟(B)_{στ∞}, so s − r = ℓ(𝒟(B)_{τ∞}/𝒟(A)_{τ∞}) − ℓ(𝒟(B)_{στ∞}/𝒟(A)_{στ∞}), and στ∞ = τ∞^c. No polarization is needed.

**Effect on the main results.** It reaches a stated result, Lemma 3.4.12(2) itself, which is false as stated when 𝔭 splits in F. Nothing downstream is affected: all six uses (pp. 168, 170, 197, 202, 206, 210) have 𝔭 special inert and A, B unitary, where (2) holds. The main theorems are untouched.

### E36. Hecke morphisms should lie in U(V)(𝔸_{F⁺}^{∞,p})

*Misprint; reaches nothing.* **Where:** Definition 4.2.2, published p. 160; Definition 4.3.3, p. 166; arXiv v1 pp. 36, 40; v3 pp. 37, 40. **Already corrected in print:** none found (new)

**What the paper says.** Definitions 4.2.2 and 4.3.3 let morphisms g ∈ K^p\U(V)(𝔸_F^{∞,p})/K^{p′} of 𝔎(V)^p act by η^p ↦ η^p ∘ g.

**Why it is wrong or incomplete.** U(V) is a group over F⁺, and morphisms of 𝔎(V)^p are double cosets in U(V)(𝔸_{F⁺}^{∞,p}) (Definition 3.1.11(2)). U(V)(𝔸_F^{∞,p}) is essentially GL_N(𝔸_F^{∞,p}). Remark 4.2.5 writes it correctly.

**Correction.** g ∈ K^p\U(V)(𝔸_{F⁺}^{∞,p})/K^{p′}, in both definitions.

**Effect on the main results.** None. It is notational.

### E37. Projectivity criterion in Theorem 4.2.3 is left unproved

*Gap; reaches nothing.* **Where:** Theorem 4.2.3 (last sentence) and its proof, published p. 161; arXiv v1 p. 36 (Theorem 4.1.3), v3 p. 37. **Already corrected in print:** none found (new)

**What the paper says.** Theorem 4.2.3 ends with 'Moreover, (4.1) is projective if and only if its base change to ℚ_p^Φ is'. The proof covers only representability and quasi-projectivity, via [62, Theorem 4.4], plus smoothness and the tangent sheaf.

**Why it is wrong or incomplete.** The 'if' direction, from a proper generic fibre to a proper integral model, needs an argument, and the proof never mentions it. 'Only if' is trivial. The fact is standard and may be contained in [62, Theorem 4.4], which was not checked.

**Correction.** Add a reference or argument for 'if'. Options are the valuative criterion, via potentially good reduction of abelian schemes as in Kottwitz's or Lan's treatment of PEL moduli, or Lan's compactifications, whose boundary is flat over the base.

**Effect on the main results.** None. Lemma 4.2.4 treats the proper and non-proper cases separately, so nothing in §4 depends on the criterion.

### E38. Hodge line l_x in Remark 4.2.5 is misdefined

*Misprint; reaches nothing.* **Where:** Remark 4.2.5, published p. 163 (PDF p. 57); arXiv v1 p. 38 (Remark 4.1.5), v2 p. 38, v3 p. 38. **Already corrected in print:** none found (new)

**What the paper says.** Remark 4.2.5 sets l_x := {α ∈ Hom_F(H₁^dR(A₀/ℂ), H₁^dR(A/ℂ)) | α(ω_{A₀^∨,τ∞}) ⊆ ω_{A^∨,τ∞}} and calls it a line in V_x(ℂ) whose image η_rat(l_x) lies in V(ℂ)_−/ℂ^×.

**Why it is wrong or incomplete.** By Remark 3.4.6, ω_{A^∨,τ} has rank N − r_τ. For A₀ (rank 1, type Φ ∋ τ∞) this gives ω_{A₀^∨,τ∞} = 0, so the condition is vacuous and the set is all of Hom_F(…), not a line. Reading the condition at τ∞^c instead gives a hyperplane: maps from a rank-1 space into the rank N − 1 space ω_{A^∨,τ∞^c}. So no reading of the printed formula gives a line.

**Correction.** l_x := Hom_ℂ(H₁^dR(A₀/ℂ)_{τ∞}, ω_{A^∨,τ∞}) inside V_x ⊗_{F,τ∞} ℂ = Hom_ℂ(H₁^dR(A₀/ℂ)_{τ∞}, H₁^dR(A/ℂ)_{τ∞}). This is a line because A has signature NΦ − τ∞ + τ∞^c, so ω_{A^∨,τ∞} has rank 1. It is the (1,−1)-part, i.e. the negative line.

**Effect on the main results.** None. The remark is only for the reader's convenience, and nothing later uses the formula.

### E39. Theorem 4.3.5(2): unramified, not Zariski-locally a closed immersion

*Error; reaches a stated result.* **Where:** Theorem 4.3.5(2) and its proof, published pp. 166, 168; used in the proof of Proposition 4.5.5, p. 180; arXiv v1 p. 40 (Theorem 4.2.5(2)) and p. 50, v3 p. 41 and p. 50. **Already corrected in print:** none found (new)

**What the paper says.** Theorem 4.3.5(2) says that ι restricted to the fibre B_{s⋆} is 'locally on B_{s⋆} a closed immersion' with normal bundle ℋom(ω_{𝒜^∨,τ∞}, im α_{*,τ∞}). The proof of Proposition 4.5.5 (p. 180) reads this as 'locally for the Zariski topology on the source a closed immersion'.

**Why it is wrong or incomplete.** The proof only shows that T_{B_{s⋆}} → ι^*T_M is injective, i.e. that ι|B_{s⋆} is unramified. The Zariski reading fails whenever ι|B_{s⋆} is not injective on geometric points. B_{s⋆} is proper and irreducible, so if ι(x) = ι(x′) with x ≠ x′ and U ∋ x is open with U → ι(U) an immersion, then U is both open and closed in the irreducible W = B_{s⋆} ∩ ι⁻¹(V). Hence U = W ∋ x′, which contradicts injectivity. Non-injectivity does occur. For N = 3, each superspecial point lies on p + 1 curves ι(B_{s⋆}), indexed by lattices with a common prime-to-p component. For fixed away-from-p level, |Sh(V⋆, (iK^p)K⋆_p)| does not grow with p. So once p + 1 exceeds it, two of the p + 1 lattices are equivalent and one curve passes twice through the point.

**Correction.** State (2) as: ι|B_{s⋆} is unramified (étale-locally on B_{s⋆} a closed immersion) with that normal bundle. It is a closed immersion when it is injective on geometric points, e.g. for K^p sufficiently small (Remark 4.3.6).

**Effect on the main results.** It does not touch the main theorems. Theorem 4.3.5(2) is false in the Zariski sense the paper uses, but every later use needs only unramifiedness: the pure codimension ⌊N/2⌋, the normal bundle, the Gysin maps ι_! and transversality in Theorem 4.6.2. Proposition 4.5.5 also survives (see E45).

### E40. Definition 4.3.3's 𝔗-action should be on B_𝔭, not M_𝔭

*Misprint; reaches nothing.* **Where:** Definition 4.3.3 (last bullet), published p. 166; arXiv v1 p. 40 (Definition 4.2.3), v3 p. 40. **Already corrected in print:** none found (new)

**What the paper says.** The last bullet of Definition 4.3.3 says a morphism a of 𝔗 acts on M_𝔭(V, K^p)(S) by changing η₀^p to η₀^p ∘ a.

**Why it is wrong or incomplete.** Definition 4.3.3 defines B_𝔭(V, −). The bullet was copied from Definition 4.2.2; the preceding bullet correctly speaks of B_𝔭(V, K^p)(S).

**Correction.** '… acts on B_𝔭(V, K^p)(S) by changing η₀^p to η₀^p ∘ a'.

**Effect on the main results.** None.

### E41. Shimura-set cosets should use U(V⋆)(F⁺), not U(V⋆)(F)

*Misprint; reaches nothing.* **Where:** Construction 4.4.2, published p. 172 (twice); proof of Proposition 4.4.4, p. 173; arXiv v1 pp. 44–45 (Construction 4.3.2, Proposition 4.3.4), v3 pp. 44–45. **Already corrected in print:** none found (new)

**What the paper says.** Construction 4.4.2 and the proof of Proposition 4.4.4 write the double coset as U(V⋆)(F)g_{s⋆}(iK^p)K⋆_p, and the first occurrence writes g for g_{s⋆}.

**Why it is wrong or incomplete.** Sh(V, K) = U(V)(F⁺)\U(V)(𝔸^∞_{F⁺})/K (§3.2, p. 144). U(V⋆)(F) is not a subgroup of U(V⋆)(𝔸^∞_{F⁺}), and only g_{s⋆} has been defined.

**Correction.** U(V⋆)(F⁺)g_{s⋆}(iK^p)K⋆_p, in all three places (pp. 172–173).

**Effect on the main results.** None.

### E42. Global lattice must match Λ⋆_𝔮 at every 𝔮 | p

*Misprint; reaches nothing.* **Where:** Proof of Proposition 4.4.4 (surjectivity), published p. 173; arXiv v1 p. 44, v2 p. 45, v3 p. 45. **Already corrected in print:** none found (new)

**What the paper says.** In the surjectivity part of the proof of Proposition 4.4.4, Λ⋆ is an O_F-lattice in V⋆ with 'Λ⋆ ⊗_F F_𝔭 = Λ⋆_𝔭', and A⋆ := A₀ ⊗_{O_F} Λ⋆.

**Why it is wrong or incomplete.** First, Λ⋆ ⊗_F F_𝔭 is the vector space V⋆ ⊗_F F_𝔭, not a lattice; the completion Λ⋆ ⊗_{O_F} O_{F_𝔭} is meant. Second, prescribing only 𝔭 is not enough. If Λ⋆ is not self-dual at some 𝔮 ≠ 𝔭 above p, then λ⋆ has kernel at 𝔮, which violates Definition 4.3.1. Also g_𝔮 need not lie in K⋆_𝔮, so υ(s⋆) need not equal g.

**Correction.** Choose Λ⋆ with Λ⋆ ⊗_{O_F} O_{F_𝔮} = Λ⋆_𝔮 for every prime 𝔮 of F⁺ above p, including 𝔭. Such a global lattice exists. Then g_𝔮 ∈ K⋆_𝔮 for all 𝔮 | p and υ(s⋆) = g. The reduction to g ∈ U(V⋆)(𝔸^{∞,p}_{F⁺}) also silently uses weak approximation at the places above p.

**Effect on the main results.** None. The intended choice is clear.

### E43. Remark 4.4.8 should name Λ⋆_𝔭, not Λ_{s⋆,𝔭}

*Misprint; reaches nothing.* **Where:** Remark 4.4.8, published p. 175; arXiv v1 p. 46 (Remark 4.3.8), v2 p. 46, v3 p. 46. **Already corrected in print:** none found (new)

**What the paper says.** Remark 4.4.8 says that when N is odd, Λ_{s⋆,𝔭} is self-dual under ϖ·( , )_{V⋆}, hence ℤ[K⋆_𝔭\U(V⋆)(F⁺_𝔭)/K⋆_𝔭] ≅ 𝕋_{N,𝔭}.

**Why it is wrong or incomplete.** Λ_{s⋆,𝔭} lives in V_{s⋆} and depends on a point s⋆, but the conclusion concerns K⋆_𝔭 = Stab(Λ⋆_𝔭). For N odd, (Λ⋆_𝔭)^∨ = pΛ⋆_𝔭 (Definition 4.4.1), so the dual for ϖ( , ) is ϖ⁻¹pΛ⋆_𝔭 = Λ⋆_𝔭, since p/ϖ is a 𝔭-adic unit.

**Correction.** 'when N is odd, Λ⋆_𝔭 is a self-dual lattice under the pairing ϖ·( , )_{V⋆}'.

**Effect on the main results.** None.

### E44. Level structure on A⋆ × A₀ should be η^{p⋆} ⊕ (id_{A₀})_*

*Misprint; reaches nothing.* **Where:** Proof of Lemma 4.5.2(1), published p. 178 (twice); arXiv v1 p. 48 (Lemma 4.4.2), v2 p. 49, v3 p. 49. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Lemma 4.5.2(1) writes the level structure on A⋆ × A₀ as η^{p⋆} × η₀^p, twice.

**Why it is wrong or incomplete.** η₀^p is the level structure W₀ ⊗ 𝔸^{∞,p} → H₁^ét(A₀, 𝔸^{∞,p}) of the CM factor, with the wrong source and target. The level structure on A⋆ × A₀ is defined on V_{n+1} = V_n ⊕ F·1: it is η^{p⋆} on V_n and sends 1 ↦ (id_{A₀})_*. The statement of the lemma and Definition 4.5.1(c) write it this way.

**Correction.** η^{p⋆} ⊕ (id_{A₀})_*.

**Effect on the main results.** None.

### E45. Proposition 4.5.5 proof assumes its target is smooth

*Gap; reaches nothing.* **Where:** Proof of Proposition 4.5.5, first paragraph, published p. 180; arXiv v1 p. 50, v2 p. 50, v3 p. 50. **Already corrected in print:** none found (new)

**What the paper says.** The proof says ι_sp is Zariski-locally a closed immersion 'such that both the source and the target are smooth'. So it reduces to (1) bijectivity on κ-points and (2) bijectivity on tangent spaces.

**Why it is wrong or incomplete.** Only the source B_𝔭(V_n, −)_sp is known to be smooth, being étale over B_𝔭(V_n, −_n). The target B_𝔭(V_{n+1}, −_{n+1}) ×_{M_𝔭(V_{n+1})} M_𝔭(V_n, −_n) is an intersection of two smooth subschemes of M_𝔭(V_{n+1}). Its smoothness is a consequence of the proposition, not an input. By E39, Theorem 4.3.5 gives only unramifiedness in any case.

**Correction.** Use the reduction for an unramified f: X → Y with X smooth. If f is bijective on geometric points and on tangent spaces, then at each point Ô_Y → Ô_X is surjective. The two rings have equal embedding dimension and Ô_X is regular, so the map is an isomorphism. So f is étale and universally injective, hence an open immersion, and, being surjective, an isomorphism.

**Effect on the main results.** None. The proposition holds with the same two checks (1) and (2).

### E46. Stray tilde: 𝒟̃(A⋆) should be 𝒟(A⋆)

*Misprint; reaches nothing.* **Where:** Proof of Lemma 4.5.4, published p. 180; arXiv v1 p. 49 (Lemma 4.4.4), v3 p. 49. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Lemma 4.5.4 reads: 'p𝒟(A⋆)^∨_{τ∞^c} ⊆ H̃, hence p𝒟̃(A⋆)^∨_{τ∞} ⊆ H̃^c'.

**Why it is wrong or incomplete.** No object 𝒟̃ is defined, and the next display uses p𝒟(A⋆)^∨_{τ∞}. The inclusion holds because the image of p𝒟(A⋆)^∨_{τ∞} in H₁^dR(A⋆)_{τ∞^c} is the kernel of the reduced λ⋆-pairing, which lies in H^⊥.

**Correction.** 'hence p𝒟(A⋆)^∨_{τ∞} ⊆ H̃^c'.

**Effect on the main results.** None.

### E47. Frobenius lands in 𝒟(A⋆)_{στ}; '(1.4)' should be '(1–4)'

*Misprint; reaches nothing.* **Where:** Proof of Proposition 4.5.5, step (1–1), published p. 182; arXiv v1 p. 51 (Proposition 4.4.5), v3 p. 51. **Already corrected in print:** none found (new)

**What the paper says.** Step (1–1) of the proof of Proposition 4.5.5 says it suffices that 𝙵: 𝒟(A⋆)_τ → 𝒟(A⋆)_{τ^c} is an isomorphism for every τ ∈ Φ, and for τ = τ∞ 'this follows from (1.4)'.

**Why it is wrong or incomplete.** 𝙵 maps 𝒟(A)_τ to 𝒟(A)_{στ} (Notation 3.4.10(3)). στ = τ^c only for τ∞ and τ∞^c, the embeddings inducing the degree-one inert prime 𝔭; above an inert 𝔮 of degree f, τ^c = σ^f τ. Signature nΦ means exactly that 𝙵: 𝒟(A⋆)_τ ⥲ 𝒟(A⋆)_{στ} for τ ∈ Φ. The steps are labelled (1–1)–(1–4), so '(1.4)' means (1–4).

**Correction.** '𝙵: 𝒟(A⋆)_τ → 𝒟(A⋆)_{στ} is an isomorphism for every τ ∈ Φ … this follows from (1–4) and …'.

**Effect on the main results.** None.

### E48. Uniformization datum in Notation 4.5.7 is for V_n

*Misprint; reaches nothing.* **Where:** Notation 4.5.7, published p. 184; arXiv v1 p. 52, v3 p. 52. **Already corrected in print:** none found (new)

**What the paper says.** Notation 4.5.7 says: 'we choose a definite uniformization datum (V⋆_n, i_n, {Λ⋆_{n,𝔮}}_{𝔮|p}) for V'.

**Why it is wrong or incomplete.** §4.5 has no space V. The datum is for V_n, and the next sentence fixes one for V_{n+1}.

**Correction.** '… for V_n'.

**Effect on the main results.** None.

### E49. §4.6 should allow r₁ = 0 (the case n = 1)

*Misprint; reaches nothing.* **Where:** §4.6, opening paragraph, published p. 185; arXiv v1 p. 53, v2 p. 53, v3 p. 53. **Already corrected in print:** none found (new)

**What the paper says.** §4.6 writes n₀ = 2r₀ and n₁ = 2r₁ + 1 'for unique integers r₀, r₁ ⩾ 1', so that n = r₀ + r₁.

**Why it is wrong or incomplete.** §4.6 keeps the setup of §4.5, where V_n has rank n ⩾ 1 (p. 176). For n = 1 we get n₁ = 1 and r₁ = 0.

**Correction.** Take r₀ ⩾ 1 and r₁ ⩾ 0, with r₁ = 0 exactly when n = 1; or assume n ⩾ 2.

**Effect on the main results.** None. Nothing in §4.6 needs r₁ ⩾ 1 (Theorem 4.4.10 is stated for r ⩾ 0), and the applications have n ⩾ 2.

### E50. loc′_𝔭 needs a generic-to-special map that does not exist

*Gap; reaches the proof.* **Where:** Construction 4.6.1(1), published p. 185; used in Theorem 4.6.2 (p. 186) and Theorem 7.3.4 (p. 300); arXiv v1 p. 53 (Construction 4.5.1(1)), v3 p. 53. **Already corrected in print:** none found (new)

**What the paper says.** Construction 4.6.1(1) defines loc′_𝔭 with values in H^i_𝔗(M_{n₀} ×_{T_𝔭} M_{n₁}, L(j)), the arithmetic special fibre over 𝔽_p^Φ. It composes localization, pullback via (4.2) to the generic fibre 𝐌^η_{n₀} ×_{𝐓^η_𝔭} 𝐌^η_{n₁} over ℚ_p^Φ, and the isomorphism H^i_𝔗(M×M, RΨL(j)) ⥲ H^i_𝔗(M×M, L(j)) coming from L ≃ RΨL.

**Why it is wrong or incomplete.** The chain has no arrow from generic-fibre cohomology to H^i_𝔗(M×M, RΨL(j)), and no canonical one exists onto special-fibre cohomology. For X smooth and proper over ℤ_p^Φ, purity gives 0 → H^i(X_s, L(j)) → H^i(X_η, L(j)) → H^{i−1}(X_s, L(j−1)) → 0. So the canonical map runs from special to generic, and its cokernel is non-zero in general: for X = Spec ℤ_p^Φ and i = j = 1 it contains the Kummer class of p. Using the arithmetic nearby cycles i^*Rj_*L instead gives a map, but then 'L ≃ RΨL' is false, since i^*R¹j_*L = L(−1).

**Correction.** Define loc′_𝔭 only on classes unramified at 𝔭, i.e. the kernel of the residue map to H^{i−1}(X_s, L(j−1)). There it is the inverse of the injective map H^i(X_s, L(j)) → H^i(X_η, L(j)) (proper case; Lan–Stroh otherwise). Alternatively, fix a splitting, or work with geometric fibres. The class [ΔSh(V_n, −_nK_{n,p})] is unramified, since its closure m_Δ(M_n) is smooth over ℤ_p^Φ, so Theorem 4.6.2 is unaffected.

**Effect on the main results.** It does not change any main result. The definition feeds the proof of Theorem 4.6.2 and, through Theorem 7.3.4, the proof of Theorem 8.3.2. Both only apply loc′_𝔭 to the unramified graph class, so both proofs go through with the corrected definition.

### E51. Graph △Sh(V⋆_n, …) must be counted with multiplicity

*Error; reaches a stated result.* **Where:** Construction 4.6.1(4), published p. 186, and Theorem 4.6.2 with its proof, pp. 186–187; compare Theorem 7.3.4, p. 300; arXiv v1 pp. 53–54, v3 pp. 54–55. **Already corrected in print:** none found (new)

**What the paper says.** Construction 4.6.1(4) takes 1_{△Sh(V⋆_n,(i_n−_n)K⋆_{sp,p})} to be the characteristic function of the graph of (sh⋆↓, sh⋆↑), a subset of the product of Shimura sets. The proof of Theorem 4.6.2 then claims ((id × π_{n₁}) ∘ b_△)_![B_sp] = (π_{n₀} × id)^*(1_△).

**Why it is wrong or incomplete.** For n even, the left side is (π_{n₀} × id)^* of (sh⋆↓, sh⋆↑)_*1, which counts points with multiplicity. The map (sh⋆↓, sh⋆↑) need not be injective. A fibre of sh⋆↓ has p + 1 distinct points with a common prime-to-p component. They land in Sh(V⋆_{n+1}, …), which is hyperspecial at 𝔭 because n + 1 is odd, so its size is bounded independently of p for fixed away-from-p level. For large p two of them coincide, and there the characteristic function is 1 while the left side is ⩾ 2. Theorem 4.6.2 itself then fails: for n = 2 and L = ℤ_ℓ, taking degrees, the two sides differ by d·(|Sh(V⋆_2, K⋆_sp)| − |△|) per point of T, with d = (p² − 1)² ≠ 0. For n odd, sh⋆↓ = id and the two readings agree.

**Correction.** Let 1_△ be the pushforward (sh⋆↓, sh⋆↑)_*(1) of the constant function 1 on Sh(V⋆_n, (i_n−_n)K⋆_{sp,p}), i.e. the graph counted with multiplicity. Theorem 7.3.4 states this reading explicitly. With it, Theorem 4.6.2 and its proof are correct.

**Effect on the main results.** None for the main results. Theorem 4.6.2 is false in its literal 'subset' reading. Its only application, Theorem 7.3.4 (towards Theorem 8.3.2), already uses the pushforward reading.

### E52. Diagram arrow id × π₁ should read id × π_{n₁}

*Misprint; reaches nothing.* **Where:** Proof of Theorem 4.6.2, second commutative diagram, published p. 187; arXiv v1 p. 54, v2 p. 55, v3 p. 55. **Already corrected in print:** none found (new)

**What the paper says.** In the second commutative diagram of the proof of Theorem 4.6.2, the right vertical arrow M_{n₀} ×_{T_𝔭} B_{n₁} → M_{n₀} ×_{T_𝔭} S_{n₁} is labelled 'id × π₁'.

**Why it is wrong or incomplete.** The map is the projection π_{n₁}: B_{n₁} → S_{n₁} on the second factor. The left arrow and the identity displayed below it use id × π_{n₁}.

**Correction.** id × π_{n₁}.

**Effect on the main results.** None.

### E53. Model name, 'define', and H¹_dR for H₁^dR in §5 proofs

*Misprint; reaches nothing.* **Where:** Proof of Lemma 5.2.7, published p. 193; proofs of Theorems 5.3.4(1) and 5.5.3(2), published pp. 198, 210. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Lemma 5.2.7 speaks of 𝐌_𝔭(V, −). The proof of Theorem 5.3.4(1) says M†_𝔭 'is define by' H¹_dR(A/S)^⊥_{τ∞} ⊆ ω_{A^∨/S,τ∞^c}. The proof of Theorem 5.5.3(2) writes ω_{A^∨,τ∞} = H¹_dR(A)^⊥_{τ∞^c}.

**Why it is wrong or incomplete.** §5 works with the model 𝐌_𝔭(V°, −); the 'V' is carried over from Lemma 4.2.4. 'define' should be 'defined'. The balloon and link conditions of Definition 5.2.3 concern the radical in de Rham homology, H₁^dR(𝒜)^⊥, not in cohomology H¹_dR.

**Correction.** Read 𝐌_𝔭(V°, −), 'defined', and H₁^dR in place of H¹_dR.

**Effect on the main results.** None. These are notational slips, and the intended reading is unambiguous.

### E54. Theorem 5.3.4(2) isomorphism holds only on the link stratum

*Misprint; reaches nothing.* **Where:** Theorem 5.3.4(2), published p. 196 (proof p. 198). **Already corrected in print:** none found (new)

**What the paper says.** Theorem 5.3.4(2) asserts ℋom(ω_{𝒜^∨,τ∞}, ω^⊥_{𝒜^∨,τ∞^c}/ω_{𝒜^∨,τ∞}) ≃ (ζ°_{s°})^*𝒪_{ℙ(𝒱_{s°})}(−(p+1)). It names no base, so it reads as a statement on the whole fibre B°_{s°} ≅ ℙ(𝒱_{s°}), where the universal object lives.

**Why it is wrong or incomplete.** On B°_{s°} the pairing ⟨ , ⟩_{λ,τ∞} has 1-dimensional radicals. So the annihilator ω^⊥_{𝒜^∨,τ∞^c} has rank 1 + dim(ω_{𝒜^∨,τ∞^c} ∩ radical). Off the link it has rank 1 and equals ω_{𝒜^∨,τ∞}; on the link it has rank 2. Hence ω^⊥/ω vanishes off DL_{s°} and is not a line bundle on B°_{s°}. Accordingly, the proof's step β_{*,τ∞}ω^⊥ = (β_{*,τ∞^c}ω)^⊥ = H^⊥ holds exactly when H^⊥ ⊆ 𝕍⁻¹H^{(p)}, i.e. on DL_{s°}.

**Correction.** State (2) on B°_{s°} ∩ ι°⁻¹M†_𝔭(V°, K^{p°}) ≅ DL_{s°}, not on B°_{s°}. The first half of the proof, ω_{𝒜^∨,τ∞} ≃ ζ*𝒪(p), does hold on all of B°_{s°}.

**Effect on the main results.** None. The only use of (2) is in Corollary 5.3.5, which concerns the normal bundle of m†• and so is on M† anyway.

### E55. Undefined level group K^{p•} in Definition 5.4.1

*Misprint; reaches nothing.* **Where:** Definition 5.4.1, third bullet, published p. 199. **Already corrected in print:** none found (new)

**What the paper says.** Definition 5.4.1 takes η^{p•} to be a π₁(S, s)-invariant K^{p•}-orbit of isomorphisms.

**Why it is wrong or incomplete.** The functor is indexed by K^{p°} ∈ 𝔎(V°)^p, and no group K^{p•} is defined.

**Correction.** Read K^{p°}-orbit, as in Definitions 5.3.1 and 5.4.2(e).

**Effect on the main results.** None.

### E56. Lie_{𝒜^∨,τ∞^c} should be Lie_{𝒜,τ∞^c} in Theorem 5.4.4

*Misprint; reaches nothing.* **Where:** Theorem 5.4.4(1),(2) and its proof, published pp. 201–203 and 206 (also the diagram on p. 206). **Already corrected in print:** none found (new)

**What the paper says.** Theorem 5.4.4(1),(2) and its proof write the last term of the tangent sequence and the normal sheaf of ι•|B•_{s•} with the line bundle Lie_{𝒜^∨,τ∞^c}. The proof identifies it with H₁^dR(𝒜)_{τ∞^c}/ω_{𝒜^∨,τ∞^c}.

**Why it is wrong or incomplete.** By the Hodge sequence 0 → ω_{A^∨} → H₁^dR(A) → Lie_A → 0, that quotient is Lie_{𝒜,τ∞^c}. This is also what Theorem 5.2.5(3)–(5), which the proof invokes, and Theorem 5.4.4(5) write. Read literally, Lie_{𝒜^∨,τ∞^c} ≅ (ω_{𝒜^∨,τ∞})^∨ is a different line bundle, and it is not isomorphic to Lie_{𝒜,τ∞^c} on B•_{s•} ∩ M†.

**Correction.** Replace Lie_{𝒜^∨,τ∞^c} by Lie_{𝒜,τ∞^c} throughout Theorem 5.4.4(1),(2) and its proof.

**Effect on the main results.** None. The identification inside the proof fixes the intended meaning.

### E57. Theorem 5.4.4(2) closed-immersion claim: proof shows only unramified

*Gap; reaches nothing.* **Where:** Theorem 5.4.4(2), published p. 202 (proof pp. 203–204). **Already corrected in print:** none found (new)

**What the paper says.** Theorem 5.4.4(2) states that the restriction of ι•_κ to B•_{s•} is, locally on B•_{s•}, a closed immersion, and it gives a formula for the normal sheaf.

**Why it is wrong or incomplete.** The proof only shows that the tangent map is injective and computes its cokernel, i.e. that the map is unramified. Unramified gives a closed immersion only étale-locally, not Zariski-locally on the source: a finite étale cover of degree 2 is unramified, but no Zariski open subset of the source embeds. Injectivity on geometric points is never addressed, and it is not automatic: two points of B•_{s•} with the same image correspond to two isogenies A → A• differing by a self-quasi-p-isogeny of A•, which can move the Dieudonné lattice of A• to another admissible one. The authors' Remark 5.4.5(1) accordingly asserts a closed immersion only for sufficiently small K^{p°}.

**Correction.** State (2) as 'unramified, i.e. étale-locally on B•_{s•} a closed immersion', with the same normal sheaf, and as a closed immersion when K^{p°} is sufficiently small (Remark 5.4.5(1)) — the correction E39 makes to the same statement in §4. The extraction proposed proving injectivity on geometric points instead, arguing that two points with the same image differ by an automorphism of s•, trivial for neat K^{p°}; that does not work, because the comparison map is only a self-quasi-p-isogeny of A• (an element of a p-arithmetic group, which neatness makes torsion-free but not trivial).

**Effect on the main results.** None. Later arguments use only the normal-sheaf formula, which holds for an unramified map.

### E58. Wrong level group and dangling reference 4.3.3(d) in 5.4.4's proof

*Misprint; reaches nothing.* **Where:** Proof of Theorem 5.4.4, published p. 203 (property (e′)) and p. 206 (end of (4–1)). **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Theorem 5.4.4, (e′) speaks of the K^p-orbit of v ↦ ϖ⁻¹γ̌_*∘η^{•p}(v). Step (4–1) takes η^p to be 'the unique K^p-level structure such that Definition 4.3.3(d) is satisfied'.

**Why it is wrong or incomplete.** In §5 the level group is K^{p°}. Definition 4.3.3 has only clauses (a)–(c), and the condition actually needed is the level compatibility 5.4.2(e). The text was carried over from §4.

**Correction.** Read 'the K^{p°}-orbit of v ↦ ϖ⁻¹γ̌_*∘η^{p•}(v)' and 'the unique K^{p°}-level structure such that Definition 5.4.2(e) is satisfied'.

**Effect on the main results.** None.

### E59. Verschiebung applied to the wrong component in proof of 5.4.4(4)

*Misprint; reaches nothing.* **Where:** Proof of Theorem 5.4.4(4), bullet 'H₁ ⊆ H₂^⊣', published p. 205. **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Theorem 5.4.4(4), the bullet 'H₁ ⊆ H₂^⊣' writes H₂^{(p)} = γ_{*,τ∞}(𝕍H₁^dR(A/S)_{τ∞^c}) = 𝕍(im γ_{*,τ∞}).

**Why it is wrong or incomplete.** 𝕍 maps the τ-component to the σ⁻¹τ-component, so 𝕍H₁^dR(A)_{τ∞^c} lands in the τ∞-component. There its image is ω_{A^∨,τ∞}, which γ_{*,τ∞} kills. So the middle term is 0, and it lies in the wrong component. H₂ itself has rank ⌈N/2⌉ − 1.

**Correction.** Read H₂^{(p)} = γ_*(𝕍H₁^dR(A/S)_{τ∞}) = 𝕍(im γ_{*,τ∞}): 𝕍 is applied to the τ∞-component, whose image is ω_{A^∨,τ∞^c}, and γ carries that onto H₂.

**Effect on the main results.** None. The next equality and the conclusion H₁ ⊆ H₂^⊣ are correct.

### E60. Construction 5.6.1: wrong functor value, missing π₁-invariance

*Misprint; reaches nothing.* **Where:** Construction 5.6.1, display and second bullet, published p. 211. **Already corrected in print:** none found (new)

**What the paper says.** Construction 5.6.1 defines S°_{𝔭1}(V°, −) by K^{p°} ↦ S°_𝔭(V°, K^{p°}). It takes η°_𝔭 to be an isomorphism Λ°_𝔭 ⊗ 𝔽_p → Hom_{O_F}(A_{0s}[𝔭], A°_s[𝔭]) at one chosen geometric point s on each connected component.

**Why it is wrong or incomplete.** The functor being defined is S°_{𝔭1}, as the next line says. Without π₁(S, s)-invariance, a choice at one geometric point does not define a level structure over S. Then S°_{𝔭1} would not be a finite étale cover of S°_𝔭.

**Correction.** Read K^{p°} ↦ S°_{𝔭1}(V°, K^{p°}), and require η°_𝔭 to be a π₁(S, s)-invariant isomorphism, as in Definitions 5.2.1 and 5.3.1.

**Effect on the main results.** None. The intended meaning is standard and clear.

### E61. Lemma 5.6.2(2),(3) rest on a lemma needing p+1 invertible

*Gap; reaches nothing.* **Where:** Lemma 5.6.2(2),(3) and proof, published p. 212 (cites Lemma A.1.4(3),(4), p. 323). **Already corrected in print:** none found (new)

**What the paper says.** Lemma 5.6.2 assumes 'p + 1 invertible in L' only in part (1). It derives (2), freeness of H^i_𝔗 of M̄°_𝔭 and M̄†_𝔭, and (3), trivial Galois action for N even, from Lemma A.1.4(3),(4).

**Why it is wrong or incomplete.** Lemma A.1.4 assumes throughout that p + 1 is invertible in L, so it does not apply when ℓ | p + 1. Also, A.1.4(3) is called 'an immediate consequence of (2)', but A.1.4(2) says nothing about the middle degree N − 2, where freeness needs a torsion argument.

**Correction.** Either add 'p + 1 invertible in L' to (2),(3), or show that the Fermat hypersurface S ⊂ ℙ^{N−1} has torsion-free ℤ_ℓ-cohomology. Weak Lefschetz covers degrees below N − 2 and the Gysin map covers degrees above N − 2. In the middle degree, H^{N−2}(S, ℤ_ℓ)_tors ≅ H^{N−1}(S, ℤ_ℓ)_tors ≅ H^{N+1}(ℙ^{N−1}, ℤ_ℓ)_tors = 0. Then (2),(3) follow for every p-coprime L from the ℚ_ℓ case.

**Effect on the main results.** None. The statements are true, since smooth hypersurfaces have torsion-free ℓ-adic cohomology, and the later applications take ℓ ∤ p(p² − 1).

### E62. Missing 'of', and global F for local F_𝔭, in 5.6.4's proof

*Misprint; reaches nothing.* **Where:** Proof of Proposition 5.6.4, published p. 214. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Proposition 5.6.4 says π_𝔭 'is a constituent the normalized parabolic induction' of π^s(𝟏) ⊠ χ₁ ⊠ ⋯ ⊠ χ_{r−1}, for unramified characters χ_i of F^×.

**Why it is wrong or incomplete.** The word 'of' is missing. In §5, F is the global CM field, while the characters live on the Levi factors GL₁(F_𝔭) = F_𝔭^×. The wording comes from Appendix C, where F is local.

**Correction.** Read 'a constituent of the normalized parabolic induction …', with unramified characters of F_𝔭^×.

**Effect on the main results.** None.

### E63. '+1' rank inequality in Lemma 5.7.5's proof fails for N even

*Error; reaches the proof.* **Where:** Proof of Lemma 5.7.5 ('Third, …'), published pp. 217–218; arXiv v1/v2 proof of Lemma 5.6.5, pp. 73–74; v3 proof of Lemma 5.7.5, p. 75. **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Lemma 5.7.5, the bound j ≤ ⌊N/2⌋ − 1 is derived from three facts: rank H₂ + 1 = rank H₁; H₁^dR(A•₁/S)^⊥_{τ∞} ⊆ H₂; and rank H₂ ≥ rank im(pφ•⁻¹)_{*,τ∞^c} + 1, which is attributed to Lemma 5.7.3(3).

**Why it is wrong or incomplete.** Lemma 5.7.3(3) only says that im(pφ•⁻¹) meets the radical trivially. The '+1' needs the radical H₁^dR(A•₁)^⊥_{τ∞} ⊆ H₂ to be a line, which holds only for N odd. For N = 2r, λ•₁ is p-principal and the radical is 0. On a component with j = r − 1, which does occur, rank H₂ = r − 1 = j, so the inequality fails. The smallest case is N = 2, j = 0, where H₂ = 0.

**Correction.** For N even, argue directly. By (5.14), im(pφ•⁻¹)_{*,τ∞^c} ⊆ H₂, and rank H₂ = r − 1, so j ≤ r − 1. Equivalently, N − j ≥ rank H₁ = rank H₂ + 1 ≥ j + 1. For N odd the printed argument stands.

**Effect on the main results.** None. Lemma 5.7.5 holds as stated, and the one-line repair leaves everything downstream, including the main theorems, unchanged.

### E64. Lie_{A^∨} written for Lie_A in Theorem 5.7.7's proof

*Misprint; reaches nothing.* **Where:** Proof of Theorem 5.7.7, published pp. 220 (tangent sequence and diagram), 221 ((5.16), (5.17)), 222 (display after (5.18)); inherited from Theorem 5.4.4(1),(2) and its proof, pp. 201–203, 206; arXiv v1/v2 p. 76, v3 p. 77. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Theorem 5.7.7 writes the tangent sequence, (5.16), (5.17) and the display after (5.18) with Lie_{A^∨,τ∞^c} (resp. Lie_{𝒜^∨,τ∞^c}). It identifies this with H₁^dR(A)_{τ∞^c}/ω_{A^∨,τ∞^c}.

**Why it is wrong or incomplete.** By the Hodge sequence (3.2), 0 → ω_{A^∨} → H₁^dR(A) → Lie_A → 0, that quotient is Lie_{A,τ∞^c}. It is a line bundle, since ω_{A^∨,τ∞^c} has rank N − 1, as in Theorem 5.2.5(4),(5) and in Theorem 5.4.4(5), which the last step invokes. The slip is inherited from Theorem 5.4.4 (E56).

**Correction.** Read Lie_{A,τ∞^c} (resp. Lie_{𝒜,τ∞^c}) throughout.

**Effect on the main results.** None.

### E65. Theorem 5.7.8(2) cokernel formula is wrong for odd N

*Error; reaches a stated result.* **Where:** Theorem 5.7.8(2), published pp. 223–224; arXiv v1/v2 Theorem 5.6.8(2), p. 77; v3 Theorem 5.7.8(2), p. 78. **Already corrected in print:** none found (new)

**What the paper says.** Theorem 5.7.8(2) says that, restricted to the fibre ℙ(𝒱_{t†}), the cokernel of T_{B†_{s•1}} ⊕ T_{B†_{s•2}} → ι•*T_{M†} is ζ†*((σ*ℋ_{t†}) ⊗ 𝒪(1)). Here ℋ_{t†} is the tautological (hyperplane) bundle on ℙ(𝒱_{t†}).

**Why it is wrong or incomplete.** Count ranks. M† has dimension N − 2, each B†_{s•i} is a union of copies of ℙ^{⌊N/2⌋−1}, and ℙ(𝒱_{t†}) has dimension ⌊N/2⌋ − j − 1. So the cokernel has rank at least N − ⌊N/2⌋ − j − 1: that is r − j − 1 for N = 2r, but r − j for N = 2r + 1. Meanwhile σ*ℋ_{t†} ⊗ 𝒪(1) always has rank ⌊N/2⌋ − j − 1. The smallest case is N = 3, j = 0. There M† is a curve and B†_{s•} is a finite set of reduced points, so the cokernel is the 1-dimensional tangent line; but dim 𝒱_{t†} = 1 makes ℋ_{t†} = 0. The proof silently replaces ℋ̄_{s•2}|_ℙ by ℋ_{t†}, dropping the radical 𝒱^⊣_{s•}, which is a line exactly when N is odd.

**Correction.** Restrict (2) to N even. For N = 2r + 1, restricting Theorem 5.7.7(2) gives ζ†*((σ*(ℋ̄_{s•2}|_ℙ)) ⊗ 𝒪(1)), where ℋ̄_{s•2}|_ℙ is an extension of ℋ_{t†} by the trivial line bundle 𝒱^⊣_{s•} ⊗ 𝒪. Its top Chern class is c_{r−j−1}((σ*ℋ_{t†}) ⊗ 𝒪(1)) · c₁(𝒪(1)).

**Effect on the main results.** Theorem 5.7.8(2) is false as stated for odd N, but the main theorems are unaffected. Its only use is in the proof of Proposition 5.8.8, where N = 2r is even and the statement is correct.

### E66. 𝒱_{t†} defined over the base S instead of κ

*Misprint; reaches nothing.* **Where:** Theorem 5.7.8(1), published p. 223; arXiv v1/v2 Theorem 5.6.8(1), p. 77; v3 p. 78. **Already corrected in print:** none found (new)

**What the paper says.** Theorem 5.7.8(1) defines 𝒱_{t†} := im(ψ₁)_{*,τ∞^c}/(im(pφ•⁻¹)_{*,τ∞^c} + H₁^dR(A•₁/S)^⊥_{τ∞}).

**Why it is wrong or incomplete.** t† is a κ-point, and 𝒱_{t†} must be a κ-vector space for ℙ(𝒱_{t†}) to be a κ-scheme. No S is in play here; the S-version belongs to the assignment on B†_{s•}(S) in the line before.

**Correction.** Read H₁^dR(A•₁/κ)^⊥_{τ∞}.

**Effect on the main results.** None.

### E67. (5.19) pulls back along ι• instead of m†•

*Misprint; reaches nothing.* **Where:** Proof of Proposition 5.8.9, (5.19), published p. 230; arXiv v1/v2 (5.17), p. 82; v3 (5.19), p. 83. **Already corrected in print:** none found (new)

**What the paper says.** (5.19), in the proof of Proposition 5.8.9, reads ι•*Lie_{𝒜,τ∞^c} ≃ m†°*𝒪_{M°_𝔭(V°,K^{p°})}(1) 'of line bundles on M†_𝔭(V°, K^{p°})'.

**Why it is wrong or incomplete.** ι• is the map B•_𝔭(V°, −) → M•_𝔭(V°, −) of the basic correspondence (5.5), so ι•*Lie lives on B•_𝔭, not on M†. What is meant, and used as c₁(Lie)|_{M†} = ξ|_{M†}, is the restriction to the link stratum along m†•.

**Correction.** Read (m†•)*Lie_{𝒜,τ∞^c} ≃ (m†°)*𝒪_{M°_𝔭(V°,K^{p°})}(1).

**Effect on the main results.** None.

### E68. Invariants vanish only if #𝔽_p^Φ−1 (not p²−1) is invertible

*Error; reaches a stated result.* **Where:** Proof of Lemma 5.9.3(6), published p. 235; arXiv v1/v2 p. 86, v3 p. 87. **Already corrected in print:** none found (new)

**What the paper says.** The same proof claims E₂^{−1,2r}(−1)^{Gal(𝔽̄_p/𝔽_p^Φ)} = 0 'as p² − 1 is invertible in L'.

**Why it is wrong or incomplete.** Galois acts trivially on E₂^{−1,2r} ⊆ H^{2r−2}_𝔗(M̄†_N, L(r−1)) (Lemma 5.6.2(3)). So Frobenius of 𝔽_p^Φ acts on the (−1)-twist by the scalar q^{±1}, where q = #𝔽_p^Φ, and the invariants are the (q − 1)-torsion. §5 only assumes 𝔽_p^Φ ⊇ 𝔽_{p²}, and q − 1 = (p² − 1)(1 + p² + ⋯). For example, take p = 3, 𝔽_p^Φ = 𝔽₈₁ and L = 𝔽₅. Then p² − 1 = 8 is invertible but q − 1 = 80 is not, so all of E₂^{−1,2r} ⊗ 𝔽₅ is invariant. In that case the map H¹_sing → H^{2r−1}(M̄•_N, L(r−1))^G in (6) is not even defined on all of H¹_sing.

**Correction.** Replace the hypothesis 'p² − 1 invertible in L' by '#𝔽_p^Φ − 1 invertible in L', or assume ℚ_p^Φ = ℚ_{p²}. This does not repair E8.

**Effect on the main results.** Lemma 5.9.3(6) is unproven when 𝔽_p^Φ ≠ 𝔽_{p²}. The main theorems are unaffected: §6 onward imposes (P3) ℚ_p^Φ = ℚ_{p²} and ℓ ∤ p(p² − 1), and there the step is correct.

### E69. Lemma 5.6.2(1) cited in §5.9 without its p+1 hypothesis

*Gap; reaches nothing.* **Where:** Proof of Lemma 5.9.3(1), published p. 235; proof of Lemma 5.9.6, p. 237; arXiv v1/v2 Lemma 5.8.3(1) p. 85 and Lemma 5.8.6 p. 87; v3 p. 86 and p. 88. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Lemma 5.9.3(1) cites Lemma 5.6.2(1) for the vanishing of H^i_𝔗(M̄†_N, L) and H^i_𝔗(M̄°_N, L) in odd degrees. The proof of Lemma 5.9.6 cites Lemma 5.6.2 and Poincaré duality for the isomorphism of the lower arrow.

**Why it is wrong or incomplete.** Lemma 5.6.2(1) assumes that p + 1 is invertible in L, but §5.9 assumes only that L is p-coprime.

**Correction.** Cite weak Lefschetz for the Fermat hypersurface X ⊂ ℙ^{N−1}, which works with any p-coprime coefficients. Restriction H^i(ℙ^{N−1}) → H^i(X) is an isomorphism for i < N − 2, and the Gysin map H^i(X) → H^{i+2}(ℙ^{N−1})(1) is an isomorphism for i > N − 2. This gives the odd-degree vanishing for N even, and the lower arrow of Lemma 5.9.6 (i = 2r > N − 2).

**Effect on the main results.** None. The conclusions hold for every p-coprime L, and in §6 ℓ ∤ p(p² − 1), so p + 1 is invertible there anyway.

### E70. Wrong level group and undefined V°_♯ in Definition 5.10.3(c)

*Misprint; reaches nothing.* **Where:** Definition 5.10.3(c), published p. 241. **Already corrected in print:** none found (new)

**What the paper says.** Definition 5.10.3(c) requires that the K^p_{n+1}-orbit of v ↦ δ•_*∘(η^{p•} ⊕ (id_{A₀})_*)(v), for v ∈ V°_♯ ⊗_ℚ 𝔸^{∞,p}, coincide with η^{p•}_♮.

**Why it is wrong or incomplete.** This is copied from Definition 4.5.1(c). In §5.10 the level group is K^{p°}_{n+1} and the space is V°_{n+1} = (V°_n)_♯, while 'V°_♯' is not defined.

**Correction.** Read 'the K^{p°}_{n+1}-orbit …, for v ∈ V°_{n+1} ⊗_ℚ 𝔸^{∞,p}'.

**Effect on the main results.** None.

### E71. Maps sh•↓ and sh†↓ printed in the wrong direction

*Misprint; reaches nothing.* **Where:** Display of natural maps after Notation 5.10.13 (lines for sh•↓ and sh†↓), published p. 248; arXiv v3 p. 95; arXiv v1 p. 97. **Already corrected in print:** none found (new)

**What the paper says.** The list of natural maps after Notation 5.10.13 gives sh•↓ : Sh(V°_n, –_nK•_{n,p}) → Sh(V°_n, –_nK•_{sp,p}) and sh†↓ : Sh(V°_n, –_nK†_{n,p}) → Sh(V°_n, –_nK†_{sp,p}).

**Why it is wrong or incomplete.** K•_{sp,p} = (K•_{n,𝔭} ∩ K•_{n+1,𝔭}) × ∏_{q≠𝔭} K°_{n,q} ⊆ K•_{n,p} and K†_{sp,p} ⊆ K†_{n,p}, so the natural maps of Shimura sets go from the sp-level to the n-level. The printed direction is not a map at all when n is odd, where sh•↓ has degree p+1. The diagram of Proposition 5.10.14 draws sh•↓ × id and sh†↓ × id from the sp-level to the n-level, and every later use takes that direction: the proof of Theorem 5.11.5 (s•_n = sh•↓(s•) with s• ∈ Sh(K•_sp)), Theorem 5.11.5(1),(2) and Lemma 5.11.6.

**Correction.** sh•↓ : Sh(V°_n, –_nK•_{sp,p}) → Sh(V°_n, –_nK•_{n,p}) and sh†↓ : Sh(V°_n, –_nK†_{sp,p}) → Sh(V°_n, –_nK†_{n,p}).

**Effect on the main results.** None. The diagram and every use already take the correct direction.

### E72. Q^{†,†} is not the strict transform of P^{†,†}

*Misprint; reaches nothing.* **Where:** Notation 5.11.1(4), published p. 250; arXiv v1 and v3 same place. **Already corrected in print:** none found (new)

**What the paper says.** Notation 5.11.1(4) defines Q^{?0,?1}, for every (?0, ?1) ∈ {°, •, †}², as the strict transform of P^{?0,?1} under the blow-up σ : Q → P along P^{°,°}.

**Why it is wrong or incomplete.** P^{†,†} lies inside the centre P^{°,°}, and σ is an isomorphism away from P^{†,†}. So the strict transform of P^{†,†}, the closure of σ⁻¹(P^{†,†} ∖ P^{†,†}) = ∅, is empty. But Lemma 5.11.3 uses Q^{†,†} as the P¹-bundle σ⁻¹(P^{†,†}) that forms the diagonal edge of the reduction graph. With Fulton's literal Bl_{Z∩C}Z even Q^{°,°} would be empty, since the centre is P^{°,°} itself. The intended convention is the closure of the preimage off P^{†,†}.

**Correction.** For (?0, ?1) ≠ (†, †), let Q^{?0,?1} be the closure of σ⁻¹(P^{?0,?1} ∖ P^{†,†}). Put Q^{†,†} := σ⁻¹(P^{†,†}) = Q^{°,°} ∩ Q^{•,•}, the exceptional locus.

**Effect on the main results.** None. Lemma 5.11.3(1),(2) makes the intended meaning clear.

### E73. Wrong base ring ℤ_{p²} in Lemma 5.11.2

*Misprint; reaches nothing.* **Where:** Lemma 5.11.2, published p. 251; arXiv v1 and v3 same place. **Already corrected in print:** none found (new)

**What the paper says.** Lemma 5.11.2 states that the specialization maps H^i_{T,c}(𝐐 ⊗_{ℤ_{p²}} ℚ̄_p, L) → H^i_{T,c}(Q̄, RΨL) and H^i_T(𝐐 ⊗_{ℤ_{p²}} ℚ̄_p, L) → H^i_T(Q̄, RΨL) are isomorphisms.

**Why it is wrong or incomplete.** 𝐐 is a scheme over ℤ_p^Φ, and ℚ_p^Φ contains ℚ_{p²} but can be larger. Over ℤ_{p²}, 𝐐 ⊗ ℚ̄_p is [𝔽_p^Φ : 𝔽_{p²}] copies of 𝐐 ⊗_{ℤ_p^Φ} ℚ̄_p, while Q̄ is a single geometric special fibre.

**Correction.** Base change along ℤ_p^Φ: 𝐐 ⊗_{ℤ_p^Φ} ℚ̄_p, as in Lemma 5.2.7.

**Effect on the main results.** None. The two readings agree when 𝔽_p^Φ = 𝔽_{p²}, which holds where §7.2 applies the lemma ((PI3): ℚ_p^Φ = ℚ_{p²}).

### E74. The P¹-bundle Q^{†,†} → P^{†,†} is not trivial

*Error; reaches a stated result.* **Where:** Lemma 5.11.3(2), third bullet, and the words 'trivial P¹-fibration' in Lemma 5.11.3(5), published p. 252; arXiv v3 p. 98. **Already corrected in print:** none found (new)

**What the paper says.** Lemma 5.11.3(2) states that σ : Q^{†,†} → P^{†,†} is a trivial P¹-bundle. Lemma 5.11.3(5) takes f to be the class of an arbitrary T-orbit of sections of this 'trivial P¹-fibration'.

**Why it is wrong or incomplete.** Q^{†,†} is the exceptional divisor of Q^{°,°} = Bl_{P^{†,†}}P^{°,°}, so Q^{†,†} = P(pr₀*N₀ ⊕ pr₁*N₁) over P^{†,†} = M†_{n0} ×_{T_p} M†_{n1}. Here N_α is the normal bundle of M†_{nα} in M°_{nα}, and it restricts to O(p+1) on each Fermat fibre. Over a connected proper base, P(A ⊕ B) is trivial only if A ≅ B. Restricting to a point × a Fermat fibre of M†_{n1}, this would make O(p+1) trivial on a Fermat hypersurface of positive dimension, where it is ample. For n = 2 one gets the ruled surface P(O ⊕ O(p+1)|_C) over a Fermat curve C. It has a section of self-intersection −(p+1)², so it is not C × P¹.

**Correction.** σ : Q^{†,†} → P^{†,†} is the Zariski-locally trivial P¹-bundle P(pr₀*N₀ ⊕ pr₁*N₁). It has two disjoint sections, Q^{•,°} ∩ Q^{†,†} and Q^{°,•} ∩ Q^{†,†}, and it is not trivial over any connected component. In (5), delete 'trivial' and take f to be the class of one of these sections.

**Effect on the main results.** The third bullet of Lemma 5.11.3(2) is false as stated, but the main theorems are unaffected. The decompositions (3)–(5) are Leray–Hirsch statements that need only a P¹-bundle with a Galois-stable section. Their uses (Lemma 7.2.5, Theorem 7.2.8) never need f² = 0, or f to be independent of the section.

### E75. Wrong pullback label (π°_{n0} × π°_{n1})^* in inc^{•,†}_!

*Misprint; reaches nothing.* **Where:** Construction 5.11.4, definition of inc^{•,†}_!, first arrow label, published p. 256; arXiv v3 p. 101. **Already corrected in print:** none found (new)

**What the paper says.** In Construction 5.11.4, the first arrow of inc^{•,†}_!, H⁰_T(S̄•_{n0} ×_{T̄_p} S̄°_{n1}, L) → H⁰_T(B̄•_{n0} ×_{T̄_p} B̄°_{n1}, L), is labelled (π°_{n0} × π°_{n1})^*.

**Why it is wrong or incomplete.** The source and target involve S•_{n0} and B•_{n0}, so the first factor must be π•_{n0} : B•_{n0} → S•_{n0}. The dual map inc^*_{•,†} correctly ends with (π•_{n0} × π°_{n1})_!.

**Correction.** (π•_{n0} × π°_{n1})^*.

**Effect on the main results.** None. It is a label slip.

### E76. '(1)' should read '(2)' at the end of the odd case

*Misprint; reaches nothing.* **Where:** Proof of Theorem 5.11.5, case n = n1 odd, end of the computation for (2), published p. 260; arXiv v3 same place. **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Theorem 5.11.5 for n = n1 odd, the computation for part (2) ends with 'Thus, (1) follows from Proposition 5.8.6.'

**Why it is wrong or incomplete.** The display just before computes ∫ cl(P•_△) ∪ inc^{•,•}_!(1_{(s•_{n+1}, s′_n)}), which is part (2). Part (1) was concluded a few lines earlier, and the even case correctly says '(2)'.

**Correction.** Thus, (2) follows from Proposition 5.8.6.

**Effect on the main results.** None.

### E77. Missing congruence at 𝔭 in the proof of Lemma 6.1.9

*Gap; reaches nothing.* **Where:** Proof of Lemma 6.1.9, published p. 266. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Lemma 6.1.9 asserts that the Satake parameter α of π_𝔭 does not contain {−1, −1} (N even) or {−p, −p⁻¹} (N odd) 'by (P5)'.

**Why it is wrong or incomplete.** (P5) is a condition on α(Π_𝔭) mod λ. But π is only Π-congruent away from Σ⁺ ∪ Σ⁺_p (Definition 6.1.8), and 𝔪 contains no Hecke operator at 𝔭. So nothing so far relates α(π_𝔭) to α(Π_𝔭), and the comparison at 𝔭 has to go through Galois representations.

**Correction.** By Chebotarev and Brauer–Nesbitt, ρ_{BC(π),ι_ℓ} and ρ_{Π,λ} ⊗ ℚ̄_ℓ have the same residual semisimplification. With BC(π_𝔭) ≅ BC(π)_𝔭 (Proposition C.3.1(2)) and local–global compatibility (Proposition 3.2.4(2)), this gives α(π_𝔭) ≡ α(Π_𝔭) mod λ, and then (P5) applies. This is the argument the paper writes out in the proofs of Lemma 6.2.1 and Lemma 6.3.2.

**Effect on the main results.** None. Lemma 6.1.9 is true, and the missing step is standard.

### E78. Two implicit steps in the boundary argument of Lemma 6.1.11

*Gap; reaches nothing.* **Where:** Proof of Lemma 6.1.11, published pp. 267–268. **Already corrected in print:** none found (new)

**What the paper says.** When Sh(V′_N, …) is not proper, the proof shows H^i_ét(Z_F̄, O_λ)_𝔪 = 0 for the toroidal boundary Z 'by (the same argument of) Lemma 6.1.10'. It concludes that H_c → H is an isomorphism after localising at 𝔪.

**Why it is wrong or incomplete.** Two steps are missing. (i) The Hecke eigensystems in H*(Z) come from π′ that are subquotients of parabolic inductions, and the pairs (V′_N, π′) need not be standard pairs (Definition 3.2.7). So Lemma 6.1.10 does not literally apply. One needs that these eigensystems are Eisenstein, with Galois representations built from the cuspidal datum on the Levi, and the paper gives no reference for this. (ii) The cone of RΓ_c → RΓ is RΓ(Z, i*Rj_*O_λ), not RΓ(Z, O_λ).

**Correction.** (i) The eigensystems on H*(Z) are Eisenstein, with Galois representations assembled from the Levi datum. As in Lemma 6.1.10, they cannot match ρ_{Π,λ}, which is residually irreducible. (ii) For the smooth boundary divisor, i*Rj_*O_λ is a Hecke-equivariant extension of O_λ(−1)[−1] by O_λ. So H*(Z, O_λ)_𝔪 = 0 still kills the cone.

**Effect on the main results.** None. Both steps are standard, and the conclusion is correct.

### E79. Chebotarev gives isomorphic semisimplifications, not isomorphic reductions

*Gap; reaches nothing.* **Where:** Proof of Lemma 6.2.1, published p. 268. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Lemma 6.2.1 says that, by Chebotarev, ρ_{BC(π),ι_ℓ} and ρ_{Π,λ} ⊗_{E_λ} ℚ̄_ℓ each admit a lattice such that their reductions are isomorphic.

**Why it is wrong or incomplete.** Lemma 6.2.1 does not assume residual irreducibility (Assumption 6.1.6). Without it, equality of traces gives only isomorphic semisimplified reductions (Brauer–Nesbitt), and lattices with isomorphic non-semisimple reductions need not exist.

**Correction.** '… their reductions have isomorphic semisimplifications.'

**Effect on the main results.** None. The argument compares only Frobenius eigenvalues at 𝔭, which the semisimplification detects.

### E80. Degeneration stated for one entry rather than the spectral sequence

*Misprint; reaches nothing.* **Where:** Lemma 6.2.2(5), published p. 268. **Already corrected in print:** none found (new)

**What the paper says.** Lemma 6.2.2(5) states that 'E^{0,2r}_{s,𝔪} degenerates at the second page'.

**Why it is wrong or incomplete.** Degeneration is a property of the whole spectral sequence, not of a single entry. The proof of (3) also omits the reason. Odd rows vanish by (1) and there are only three columns, so every d_s with s ⩾ 2 is zero. Assumption 6.1.4 then kills E₂^{p,q} whenever p+q ≠ 2r.

**Correction.** (5) E^{p,q}_{s,𝔪} degenerates at the second page.

**Effect on the main results.** None.

### E81. Weak semisimplicity of a sublattice needs Lemma 2.1.4(2)

*Misprint; reaches nothing.* **Where:** Proof of Theorem 6.2.3(2), published p. 271. **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Theorem 6.2.3(2), each R^c_{BC(π′)} is shown to be weakly semisimple, and 'this implies (2) by Lemma 2.1.4(1)'.

**Why it is wrong or incomplete.** Lemma 2.1.4(1) covers finite direct sums. But E^{0,2r}_{2,𝔪} is only a Γ_F-stable submodule of ⊕_{π′}(R^c_{BC(π′)})^{⊕d(π′)} (p. 270), so passing to it needs Lemma 2.1.4(2), on subquotients.

**Correction.** '… by Lemma 2.1.4(1),(2)': (1) for the direct sum, (2) for its submodule E^{0,2r}_{2,𝔪}.

**Effect on the main results.** None.

### E82. Undefined Π_{N,𝔭} in the determinant formula

*Misprint; reaches nothing.* **Where:** Proof of Proposition 6.3.1, determinant formula, published p. 272. **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Proposition 6.3.1, {α_r, …, α_1, α_1⁻¹, …, α_r⁻¹} are called the roots of P_{α(Π_{N,𝔭})} mod λ.

**Why it is wrong or incomplete.** Π_{N,𝔭} is not defined. §6.1 writes P_{α(Π_𝔭)}, e.g. in (P4) and (P5). This is a leftover of the §7 notation Π_{n_α}.

**Correction.** P_{α(Π_𝔭)}.

**Effect on the main results.** None.

### E83. Δ⁰_𝔪 should read ∇⁰_𝔪

*Misprint; reaches nothing.* **Where:** Proof of Proposition 6.3.1(3), last sentence, published p. 273. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Proposition 6.3.1(3) ends with '… hence Δ⁰_𝔪 is surjective.'

**Why it is wrong or incomplete.** The map in Proposition 6.3.1(3) and Construction 5.9.4 is ∇⁰_𝔪, defined at the start of the same paragraph. Δ⁰ is not defined in the published text; it is a leftover of arXiv v1.

**Correction.** … hence ∇⁰_𝔪 is surjective.

**Effect on the main results.** None.

### E84. Undefined exponent μ in the similitude character of 𝒮^?

*Misprint; reaches nothing.* **Where:** §6.4, definition of 𝒮^?, published p. 280. **Already corrected in print:** none found (new)

**What the paper says.** §6.4 sets χ := ε_ℓ^{1−N}, but then defines 𝒮^? := (r̄, η^μ_{F/F⁺}ε_ℓ^{1−N}, Σ⁺_min ∪ Σ⁺_lr ∪ {𝔭} ∪ Σ⁺_ℓ, {𝒟_v}).

**Why it is wrong or incomplete.** μ is not defined in §6.4. It is [51]'s exponent μ ∈ ℤ/2ℤ, and [51, Theorem 3.6.3(3)] gives μ ≡ N mod 2, so μ = 0 here. As printed, it clashes with the positive integer μ of Theorem 6.3.4(5) and with χ = ε_ℓ^{1−N} one line earlier.

**Correction.** 𝒮^? := (r̄, χ, Σ⁺_min ∪ Σ⁺_lr ∪ {𝔭} ∪ Σ⁺_ℓ, {𝒟_v}) with χ = ε_ℓ^{1−N}. This equals η^N_{F/F⁺}ε_ℓ^{1−N}, as Definition 6.3.3 requires, because N is even.

**Effect on the main results.** None.

### E85. Monodromy formula at 𝔭 has v and v′ swapped

*Misprint; reaches nothing.* **Where:** §6.4, local model at 𝔭, published p. 281 (and the computation of H¹_sing on p. 282). **Already corrected in print:** Partly corrected by the authors: Liu–Tian–Xiao, "Iwasawa's main conjecture for Rankin–Selberg motives in the anticyclotomic case", arXiv:2406.00624v3 (25 December 2024), footnote 29 on p. 85: "there is a typo on [LTXZZ1, Page 281], namely, the formula r♮_mix(t)v′ = xv + v′ should be r♮_mix(t)v = xv′ + v". That is this finding's first correction. The matching H¹_sing formula on p. 282 (R^ram v/xv, for R^ram v′/xv′) is not mentioned there.

**What the paper says.** In §6.4, x ∈ R^mix is defined by r^♮_mix(t)v′ = xv + v′, where v and v′ are the φ_p²-eigenvectors lifting the eigenvalues p^{−2r} and p^{−2r+2}. The text then asserts x(s − p^{−2r}) = 0. On p. 282 it computes H¹_sing(ℚ_{p²}, (R^ram)^{⊕N}(r)) = R^ram v/xv ≃ R^ram/(x).

**Why it is wrong or incomplete.** φ_p is an arithmetic Frobenius with φ_p t φ_p⁻¹ = t^p. With r(t)v′ = xv + v′, conjugating by φ_p² gives x(s − p²s′) = 0. Since s′ = p^{−4r+2}s⁻¹ and s − p^{−2r+2} is a unit, this means x(s + p^{−2r+2}) = 0. That forces x = 0 (every lifting unramified) whenever ℓ ∤ p²+1, instead of giving x(s − p^{−2r}) = 0. If instead t moves v towards v′, one gets x(s′ − p²s) = 0, i.e. x(s − p^{−2r}) = 0, as stated and as in [51, proof of Proposition 3.5.2]. Likewise, the Frobenius-invariant x-torsion line in the inertia coinvariants is spanned by v′, not v.

**Correction.** Read r^♮_mix(t)v = v + xv′ and H¹_sing(ℚ_{p²}, (R^ram)^{⊕N}(r)) = R^ram v′/xv′ ≃ R^ram/(x) = R^cong. Equivalently, swap the labels of v, v′ and of s, s′ throughout. The authors have acknowledged the monodromy correction. Liu–Tian–Xiao, arXiv:2406.00624, footnote 29 (p. 85), say that 'there is a typo on [LTXZZ1, Page 281], namely, the formula r♮_mix(t)v′ = xv + v′ should be r♮_mix(t)v = xv′ + v.'

**Effect on the main results.** None. Every consequence actually used is correct: x(s − p^{−2r}) = 0, R^unr = R^mix/(x), R^ram = R^mix/(s − p^{−2r}), R^cong = R^mix/(s − p^{−2r}, x), and H¹_sing ≅ R^cong.

### E86. Hecke algebra T^{Σ⁺∩Σ⁺_p} should be T^{Σ⁺∪Σ⁺_p}

*Misprint; reaches nothing.* **Where:** §6.4, definition of T^ram, published p. 282. **Already corrected in print:** none found (new)

**What the paper says.** §6.4 defines T^ram as the image of T^{Σ⁺∩Σ⁺_p}_N in End_{O_λ}(H^{2r−1}_T(M̄_N, RΨO_λ)).

**Why it is wrong or incomplete.** By (P1), Σ⁺ ∩ Σ⁺_p = ∅. The abstract Hecke algebra T^Σ_N is defined only for Σ ⊇ Σ⁺_bad, and T^∅ would contain Hecke operators at 𝔭. But 𝔪 lives in T^{Σ⁺∪Σ⁺_p}_N (Notation 6.1.3), and footnote 27 uses T^{Σ⁺∪Σ⁺_p∪Σ⁺_ℓ}_N. The R = T theorem is applied with 𝔭 among the level-raising places, so no Hecke operator at 𝔭 may be included.

**Correction.** T^{Σ⁺∪Σ⁺_p}_N.

**Effect on the main results.** None.

### E87. Undefined R₁ and an unproved isomorphism in Theorem 6.3.4(3)

*Gap; reaches the proof.* **Where:** Proof of Theorem 6.3.4(3), published p. 285. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Theorem 6.3.4(3) says that (3) follows from (1) and (P4), because H^{2r−1}_T(M̄•_N, O_λ(r)) ≃ H ⊗_{R^ram} R₁(r) as Gal(𝔽̄_p/𝔽_{p²})-modules.

**Why it is wrong or incomplete.** R₁ appears nowhere else in the paper, the left side should be localised at 𝔪, and the isomorphism is not immediate. By Lemma 5.9.3, H^{2r−1}_T(M̄•_N)_𝔪 = E₂^{0,2r−1} is the middle graded piece Gr₀ of H^{2r−1}_T(M̄_N, RΨO_λ(r))_𝔪 ≅ H ⊗ (R^ram)^{⊕N}(r). Identifying Gr₀ needs two facts that the paper does not supply. First, the outer pieces, with Frobenius eigenvalues 1 and p², are separated mod λ from the rest. Second, the {1, p²}-block H ⊗ (R^ram v ⊕ R^ram v′)(r) contributes nothing to Gr₀.

**Correction.** Let R₁ ⊆ (R^ram)^{⊕N} be the r^♮_ram(φ_p²)-stable complement of R^ram v ⊕ R^ram v′; inertia acts trivially on it. Then H^{2r−1}_T(M̄•_N, O_λ(r))_𝔪 = Gr₀ ≅ H ⊗_{R^ram} R₁(r), for two reasons. (a) F_{−1} and H/F₀ have Frobenius eigenvalues p² and 1 (Lemma 5.6.2). By (P4) these differ mod λ from the eigenvalues on R₁(r), so H ⊗ R₁(r) ⊆ Gr₀. (b) The {1, p²}-block has zero image in Gr₀. Rationally this holds because the monodromy x is nonzero at every characteristic-zero point of R^ram; integrally, because Gr₀ is O_λ-free by (2). On R₁(r) the eigenvalues are pα_i^{±1} for i ≠ the level-raising index, and these avoid 1 and p², which gives (3).

**Effect on the main results.** The proof of Theorem 6.3.4(3) has a gap, which the argument above repairs. The statement holds, and so do its uses in (4), Lemma 7.2.5 and, through them, Theorems 8.2.2 and 8.3.2.

### E88. Missing Tate twist (−1) in the exact sequence of Theorem 6.3.4(4)

*Misprint; reaches nothing.* **Where:** Proof of Theorem 6.3.4(4), displayed short exact sequence, published p. 285. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Theorem 6.3.4(4) uses the short exact sequence 0 → F_{−1}H¹(I_{ℚ_{p²}}, H) → H¹(I_{ℚ_{p²}}, H) → H/F_{−1}H → 0, where H = H^{2r−1}_T(M̄_N, RΨO_λ(r))_𝔪. It splits this sequence using Frobenius actions and (3).

**Why it is wrong or incomplete.** H¹(I, M) ≅ M_I(−1), and inertia acts trivially on H/F_{−1}H, so the third term is (H/F_{−1}H)(−1). The splitting argument needs this twist. Without it, the Frobenius eigenvalue 1 would occur both in the subobject F_{−1}H¹ and in the quotient, through H/F₀. With it, (H/F₀)(−1) has eigenvalue p^{−2}, and (F₀/F_{−1})(−1) has eigenvalues p^{−2}·pα_i^{±1} ≠ 1. This is exactly why (3) excludes p².

**Correction.** The third term is (H^{2r−1}_T(M̄_N, RΨO_λ(r))_𝔪 / F_{−1}H^{2r−1}_T(M̄_N, RΨO_λ(r))_𝔪)(−1).

**Effect on the main results.** None.

### E89. Theorem 6.3.4(5) needs level-raising mod λ^m at Σ⁺_lr

*Error; reaches a stated result.* **Where:** Proof of Theorem 6.3.4(5), published pp. 285–286. **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Theorem 6.3.4(5), the paper says that since 𝔫 ∩ O_λ = λ^m O_λ, the structure map O_λ → R^ram induces O_λ/λ^m = R^ram/𝔫. From this it gets H^{2r−1}_ét(Sh(V′_N, …)_F̄, O_λ(r))/𝔫 ≃ (R̄^{(m)c})^{⊕μ} with μ ⩾ 1.

**Why it is wrong or incomplete.** Read O_λ-linearly, R^ram/𝔫 ≅ T^ram_𝔪/𝔫 is O_λ/λ^j for some j ⩽ m. By Chebotarev and Carayol, j = m exactly when ρ_{Π,λ,+} mod λ^m is a lifting of type 𝒮^ram. At v ∈ Σ⁺_lr this needs the local condition 𝒟^ram, i.e. P_{α(Π_v)} level-raising special mod λ^m. The hypotheses give this only mod λ (rigidity, Definition 6.3.3(2)), and (P4) holds only at 𝔭. Suppose Π_v is level-raising special only mod λ^j with j < m. Then H^{2r−1}/𝔫 ≅ H ⊗ (R^ram/𝔫)^{⊕N}(r) is nonzero and killed by λ^j, so it cannot be (R̄^{(m)c})^{⊕μ} with μ ⩾ 1. Read literally, as an ideal of the ℤ-algebra T_N, 𝔫 can also fail when E_λ is ramified over the Hecke field; that part is only a notational slip.

**Correction.** Add to Theorem 6.3.4(5) the hypothesis that P_{α(Π_v)} mod λ^m is level-raising special at v (Definition 3.1.5) for every v ∈ Σ⁺_lr; this is vacuous if Σ⁺_lr = ∅. Read 𝔫 as the kernel of O_λ ⊗ T^{Σ⁺∪Σ⁺_p}_N → O_λ/λ^m. Then ρ_{Π,λ,+} mod λ^m has type 𝒮^ram, and R^ram/𝔫 = O_λ/λ^m.

**Effect on the main results.** Theorem 6.3.4(5) is false as stated; part (4) is unaffected. The main theorems are also unaffected. (5) is used in the proof of Theorem 8.2.2 with Σ⁺_{lr,I} = ∅. It is used again in the proof of Theorem 8.3.2 with Σ⁺_{lr,I} = {𝔭₁}, where 𝔭₁ satisfies (PII4), i.e. it is level-raising special mod λ^m. That is exactly the added hypothesis.

### E90. Undefined Σ⁺ in the Hecke algebra of Notation 7.2.1

*Misprint; reaches nothing.* **Where:** Notation 7.2.1, published p. 288 (carried into Notation 7.3.1, p. 298). **Already corrected in print:** none found (new)

**What the paper says.** Notation 7.2.1 defines 𝔪_α and 𝔫_α as 𝕋^{Σ⁺_I∪Σ⁺_p}_{n_α} ∩ ker(𝕋^{Σ⁺}_{n_α} → O_E → O_E/λ or O_E/λ^m), via φ_{Π_α}. Notation 7.3.1 repeats this with Σ⁺_II.

**Why it is wrong or incomplete.** No set Σ⁺ without a subscript is defined in §7, and φ_{Π_α} is defined on 𝕋^{Σ⁺_min}_{n_α} (§7.1). The notation is copied from Notation 6.1.3.

**Correction.** Replace 𝕋^{Σ⁺}_{n_α} by 𝕋^{Σ⁺_min}_{n_α}.

**Effect on the main results.** None. Any Σ⁺ with Σ⁺_min ⊆ Σ⁺ ⊆ Σ⁺_I gives the same ideal.

### E91. K•_sp is built from the wrong local group K•_{n₀,p}

*Misprint; reaches nothing.* **Where:** §7.2, paragraph after the data list, published p. 288. **Already corrected in print:** none found (new)

**What the paper says.** §7.2 puts K•_sp := K^{p∘}_sp × K•_{n₀,p}.

**Why it is wrong or incomplete.** K•_sp should be a level for the rank-n group U(V°_n). When n is odd, n₀ = n+1 and K•_{n₀,p} ⊆ U(V°_{n+1})(F⁺_p), so the product is not an open compact subgroup of U(V°_n)(𝔸^∞_{F⁺}). The §7.3 counterpart K*_sp := (i_nK^p_sp) × K*_{n,p} is right.

**Correction.** K•_sp := K^{p∘}_sp × K•_{sp,p} (Notation 5.10.13), or at least a subgroup of U(V°_n)(F⁺_p) such as K•_{n,p}.

**Effect on the main results.** None. For n even, n₀ = n. K•_sp is not used again in §7; the proofs use K•_{sp,p} through Theorem 5.11.5.

### E92. Theorem 7.2.8(3) writes 𝐐^η_△ for the cycle 𝐐^η_sp

*Misprint; reaches nothing.* **Where:** Theorem 7.2.8(3), published p. 292; the same slip in the proof of (3), p. 295. **Already corrected in print:** none found (new)

**What the paper says.** Theorem 7.2.8(3) computes the pairing of ∇_{/(𝔫₀,𝔫₁)}(∂AJ_𝐐(𝐐^η_△)) with test functions f. The proof of (3) writes ∇(cl(Q_sp)) = ∇(cl(Q•_△)) with cl(Q•_△) ∈ H^{2n}_𝔗(Q̄^{•,•}, O_λ(n)).

**Why it is wrong or incomplete.** The cycle of §7.2 is 𝐐_sp, the strict transform of the graph 𝐏_sp of 𝐌_𝔭(V°_n, K°_sp) → 𝐏 (p. 291). 𝐏_△ and 𝐐_△ exist only for objects of 𝔎(V°_n)^p_sp, and Q•_△ is never defined. The sentence right after (3), Proposition 7.2.7 and Corollary 7.2.9 all use 𝐐^η_sp.

**Correction.** Read ∂AJ_𝐐(𝐐^η_sp) in (3). In the proof, read the Q̄^{•,•}-component of cl(Q_sp) (a 'Q•_sp', matching the cl(P•_sp) of the next display).

**Effect on the main results.** None. Theorem 7.2.8 feeds Corollary 7.2.9 and hence Theorems 8.2.2 and 8.3.2, but the intended reading is unambiguous.

### E93. Prop. 7.2.7 uses [47, Thms 2.16, 2.18] outside their hypotheses

*Gap; reaches the proof.* **Where:** Proof of Proposition 7.2.7 and footnote 29, published p. 292. **Already corrected in print:** none found (new)

**What the paper says.** Proposition 7.2.7 identifies H¹_sing(ℚ_{p²}, H^{2n−1}_𝔗(Q̄, RΨO_λ(n))_{(𝔪₀,𝔪₁)}) with coker Δ^n_{(𝔪₀,𝔪₁)}, and ∂AJ_𝐐(𝐐^η_sp) with the image of cl(Q_sp). The proof only cites [47, Theorems 2.16, 2.18] after checking (N1)–(N3). Footnote 29 says that properness of 𝐐 is not needed 'in view of Lemma 7.2.5(6)'.

**Why it is wrong or incomplete.** [47] works with Λ = ℚ_p or ℤ/p^ν and a proper strictly semistable scheme. Here Λ = O_λ and 𝐐 need not be proper, and footnote 29 only asserts that the proofs extend. The class cl(Q_sp) ∈ C^n(Q, L) (p. 291) is never constructed. For [47, Thm 2.18] it must be [47]'s e_z, the class of the flat closure. The proof of Theorem 7.2.8(3) then evaluates it geometrically on Q̄^{•,•}. That step is what [47, Prop. 2.19] provides, under a codimension condition that is neither stated nor checked. Finally, footnote 22 equates C^r(Q, L), defined with Galois coinvariants (p. 262), with [47]'s A^r(Q, L)^0, defined with invariants.

**Correction.** Reprove [47, Thms 2.16, 2.18] for Λ = O_λ (as a limit of O_λ/λ^k) and for a non-proper strictly semistable 𝐐 with nearby-cycle cohomology, using Lemmas 5.11.2, 5.11.3 and 7.2.5(6). Define cl(Q_sp) as the image of the cycle class of the flat closure Q_sp. Justify its restriction to Q^{(0)} via [47, Prop. 2.19] or by pushforward along 𝐌_𝔭(V°_n, K°_sp) → 𝐏. Correct footnote 22: invariants and coinvariants agree under (N3).

**Effect on the main results.** This affects the proof. Proposition 7.2.7 underlies Theorem 7.2.8 and Corollary 7.2.9, hence (8.9) in Theorem 8.2.2 and the first-reciprocity step of Theorem 8.3.2, so all the main theorems (1.1.1, 1.1.5, 1.1.7, 1.1.9) rest on it. Nothing is expected to fail, but the extension has to be supplied.

### E94. Wrong restriction map inc*_{∘,†} in the P̄^{•,†} display

*Misprint; reaches nothing.* **Where:** Proof of Theorem 7.2.8, (1b)/(1c), second display, published p. 294. **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Theorem 7.2.8 (1b)/(1c), the second display applies I°_{n₁,𝔭} ∘ inc*_{∘,†} + (p+1)² T°•_{n₁,𝔭} ∘ inc*_{•,•} to (γ^{•,†}_{•,•})_! H^{2(n−1)}_𝔗(P̄^{•,†}, O_λ(n−1))_{(𝔪₀,𝔪₁)}.

**Why it is wrong or incomplete.** inc*_{∘,†} is defined on H^{2n}_𝔗(P̄^{∘,•}, L(n)) (Construction 5.11.4, p. 254), but (γ^{•,†}_{•,•})_! lands in the cohomology of P̄^{•,•}. The first display, for P̄^{∘,†}, correctly pairs inc*_{∘,†} with inc*_{∘,•}.

**Correction.** Read inc*_{•,†} in place of inc*_{∘,†}.

**Effect on the main results.** None. The next display and the vanishing via Lemma 5.9.2(3) are unaffected.

### E95. Wrong degree and twist in proof of Theorem 7.2.8(2)

*Misprint; reaches nothing.* **Where:** Proof of Theorem 7.2.8(2), published p. 295. **Already corrected in print:** none found (new)

**What the paper says.** The proof of (2) places ker ⁰d^{0,2r₀}_{1,𝔪₀} ⊗ ker ¹d^{0,2r₁}_{1,𝔪₁} inside ⊕_{(?₀,?₁)∈{∘,•}²} H^{2(n−1)}_𝔗(P̄^{?₀,?₁}, O_λ(n−1))_{(𝔪₀,𝔪₁)}.

**Why it is wrong or incomplete.** The two kernels sit in H^{2r₀}(M̄^{(0)}_{n₀}, O_λ(r₀)) and H^{2r₁}(M̄^{(0)}_{n₁}, O_λ(r₁)). By Künneth their tensor product lies in degree 2r₀+2r₁ = 2n with twist n, which is where C^n(Q, O_λ) and ∇ live. The degree 2(n−1) was copied from the proof of (1).

**Correction.** Read H^{2n}_𝔗(P̄^{?₀,?₁}, O_λ(n))_{(𝔪₀,𝔪₁)}.

**Effect on the main results.** None.

### E96. Cor. 7.2.9 omits the mod-(𝔫₀,𝔫₁) comparison of singular quotients

*Gap; reaches nothing.* **Where:** Proof of Corollary 7.2.9, published pp. 296–297. **Already corrected in print:** none found (new)

**What the paper says.** Let H := H^{2n−1}_𝔗(Q̄, RΨO_λ(n)). The proof of Corollary 7.2.9 says that 'Theorem 7.2.8 implies' that the exponent of ∂AJ_𝐐(𝐐^η_sp) in H¹_sing(ℚ_{p²}, H/(𝔫₀,𝔫₁)) equals that of (p+1)φ_{Π₀}(I°_{n₀,𝔭})φ_{Π₁}(T°_{n₁,𝔭})𝟙_{Sh(V°_n,K°_sp)}.

**Why it is wrong or incomplete.** Through Proposition 7.2.7, Theorem 7.2.8 describes H¹_sing(ℚ_{p²}, H_{(𝔪₀,𝔪₁)})/(𝔫₀,𝔫₁), not H¹_sing of the reduced module H/(𝔫₀,𝔫₁). H¹_sing involves Frobenius invariants, which need not commute with reduction mod (𝔫₀,𝔫₁), so a priori exponents can drop. The analogous Theorem 6.3.4(4) (p. 285) proves explicitly that H¹_sing(ℚ_{p²}, H_𝔪)/𝔫 → H¹_sing(ℚ_{p²}, H/𝔫) is an isomorphism. Here that comparison is not mentioned.

**Correction.** Add that H¹_sing(ℚ_{p²}, H_{(𝔪₀,𝔪₁)})/(𝔫₀,𝔫₁) → H¹_sing(ℚ_{p²}, H/(𝔫₀,𝔫₁)) is injective, in fact an isomorphism. This follows from three facts: the Künneth decomposition in the proof of Theorem 7.2.8(2); the mod-𝔫₀ comparison of Theorem 6.3.4(4); and the fact that ¹E^{0,2r₁}_{2,𝔪₁} is free and weakly semisimple (Theorem 6.2.3(2)), so its invariants commute with reduction.

**Effect on the main results.** None. Corollary 7.2.9 feeds (8.9) in Theorem 8.2.2 and the rank-one argument of Theorem 8.3.2, but the missing step is proved exactly as in Theorem 6.3.4(4).

### E97. Unlocalized comparison map wrongly claimed an isomorphism (Thm 7.3.4 proof)

*Gap; reaches nothing.* **Where:** Proof of Theorem 7.3.4, published p. 301. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Theorem 7.3.4 concludes λ₀^e loc_𝔭([Sh(V_n,K_sp)]) = 0 because the map H^{2n}_ét((Sh(V_{n₀},K_{n₀}) ×_F Sh(V_{n₁},K_{n₁}))_{F_𝔭}, O_λ(n)) → H^{2n}_𝔗(M_{n₀} ×_{T_𝔭} M_{n₁}, O_λ(n)) 'is an isomorphism'.

**Why it is wrong or incomplete.** The target is absolute cohomology of the special fibre over F_{p²}. For the integral model X it differs from the generic-fibre group by the quotient H^{2n−1}(X_s, O_λ(n−1)). That quotient contains H¹(F_{p²}, H^{2n−2}(X̄_s, O_λ(n−1))), which picks up Tate classes such as powers of an ample class, so without localization the claim is false. Moreover, the natural map goes from the integral model to the generic fibre, not in the printed direction.

**Correction.** Claim the isomorphism only after localizing at (𝔪₀,𝔪₁), which suffices because everything is taken modulo (𝔫₀,𝔫₁). After localization the extra term is V(−1)^{Gal(F̄_p/F_{p²})}, with V := H^{2n−1}(X̄_s, O_λ(n))_{(𝔪₀,𝔪₁)}. This vanishes because V is O_λ-free and V(−1) ⊗ E_λ is pure of weight 1. The H¹-term vanishes because the localized H^{2n−2} is 0 by Assumption 7.3.2 and Künneth.

**Effect on the main results.** None. Theorem 7.3.4 is used for (8.12) in Theorem 8.3.2 (Theorem 1.1.9), and it is stated modulo (𝔫₀,𝔫₁), where the localized comparison holds.

### E98. Wrong degree and twist for the M×S cohomology group

*Misprint; reaches nothing.* **Where:** Proof of Theorem 7.3.4, published p. 301. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Theorem 7.3.4 states λ₀^e T⋆_{n₁,𝔭}.(id×π_{n₁})_!(id×ι_{n₁})^* loc′_𝔭([Sh(V_n,K_sp)]) = 0 in H^{2n}_𝔗(M_{n₀} ×_{T_𝔭} S_{n₁}, O_λ(n))/(𝔫₀,𝔫₁).

**Why it is wrong or incomplete.** (id×ι_{n₁})^* keeps the degree, while (id×π_{n₁})_! lowers the degree by 2r₁ and the twist by r₁. So the class lies in degree 2n−2r₁ = 2r₀ with twist r₀, as in Theorem 4.6.2 and in claims (1) and (2) just above.

**Correction.** Read H^{2r₀}_𝔗(M_{n₀} ×_{T_𝔭} S_{n₁}, O_λ(r₀))/(𝔫₀,𝔫₁).

**Effect on the main results.** None.

### E99. Künneth display in proof of Thm 7.3.4 lacks right-side localizations

*Misprint; reaches nothing.* **Where:** Proof of Theorem 7.3.4, Künneth display, published p. 301. **Already corrected in print:** none found (new)

**What the paper says.** The proof writes H^i_𝔗(M̄_{n₀} ×_{T̄_𝔭} M̄_{n₁}, O_λ)_{(𝔪₀,𝔪₁)} ≃ ⊕_{i₀+i₁=i} H^{i₀}_𝔗(M̄_{n₀}, O_λ) ⊗_{O_λ} H^{i₁}_𝔗(M̄_{n₁}, O_λ).

**Why it is wrong or incomplete.** The left side is localized, but the right side is not. As written, the right side is the Künneth decomposition of the unlocalized group. The conclusions drawn next use Assumption 7.3.2, which concerns the localized groups.

**Correction.** On the right, read H^{i₀}_𝔗(M̄_{n₀}, O_λ)_{𝔪₀} ⊗ H^{i₁}_𝔗(M̄_{n₁}, O_λ)_{𝔪₁}, as in Lemma 7.2.5(1).

**Effect on the main results.** None.

### E100. Lemma 8.1.5(1): Γ-stability of V′₁ is not justified

*Gap; reaches nothing.* **Where:** Proof of Lemma 8.1.5(1), published pp. 305–306. **Already corrected in print:** none found (new)

**What the paper says.** Suppose ρ₀(t) = 1+J_{n₀} and ρ₁(t) = 1. To show that ρ₀⊗ρ₁ is irreducible, the proof writes the t-invariants of a summand W as k·e ⊗ V′₁. It then says 'it is easy to see' that V′₁ is Γ-stable, which forces V′₁ = V₁.

**Why it is wrong or incomplete.** An element g ∈ Γ carries W^t to W^{gtg⁻¹}, not to W^t. So t-invariants alone do not show that V′₁ is Γ-stable.

**Correction.** Let H be the normal closure of t in Γ. Then ρ₁(H) = 1. By Clifford, ρ₀|_H is semisimple, and it is indecomposable because t acts by a single Jordan block, so it is irreducible. Hence every Γ-stable W ⊆ V₀⊗V₁ equals V₀ ⊗ V′₁ with V′₁ = Hom_H(V₀, W), which is Γ-stable. Irreducibility of ρ₁ then gives V′₁ = V₁.

**Effect on the main results.** None. The statement is true and the repair is short. Lemma 8.1.5 enters (L3) and (L5-1) in Lemma 8.1.4, hence Corollary 8.2.5 (Theorem 1.1.7).

### E101. Lemma 8.1.7 states a Γ_F-isomorphism but its use needs Hecke-equivariance

*Gap; reaches the proof.* **Where:** Lemma 8.1.7 (statement), published p. 306–307, as used in the proof of Theorem 8.2.2 for (8.7), p. 312. **Already corrected in print:** none found (new)

**What the paper says.** Lemma 8.1.7 gives an isomorphism H^i(Sh(V_{n₁},K_{n₁})_{F̄}, O_λ)_{𝔪₁} ≃ H^i(Sh(V_{n₁},K^𝔓_{n₁}K′_{n₁,𝔓})_{F̄}, O_λ)_{𝔪₁} 'of O_λ[Γ_F]-modules'. The proof of (8.7) uses it to transport the m_lat map to the level-raised variety. That map is defined on the quotient by 𝕋^{Σ⁺_I∪Σ⁺_p}_{n₁} ∩ ker φ_{Π₁}, via (PI8).

**Why it is wrong or incomplete.** To transport that quotient, the isomorphism must carry (𝕋^{Σ⁺_I∪Σ⁺_p}_{n₁} ∩ ker φ_{Π₁})·H onto the same submodule on the other side, that is, it must be Hecke-linear. A bare O_λ[Γ_F]-isomorphism need not do this.

**Correction.** State Lemma 8.1.7 as an isomorphism of 𝕋^{Σ⁺_min∪Σ⁺_𝔓}_{n₁}[Γ_F]-modules. The integral Hecke correspondence T^{•∘} of the E13 repair has this property.

**Effect on the main results.** This affects the proof of (8.7) in Theorem 8.2.2 and of its analogue in Theorem 8.3.2, which underlie Theorems 1.1.1, 1.1.5, 1.1.7 and 1.1.9. The effect is only formal: the intended isomorphism is Hecke-equivariant and the fix costs nothing.

### E102. No abundant element exists when γ ignores the c-sign of S

*Gap; reaches the proof.* **Where:** Proofs of Theorem 8.2.2 (published p. 310) and Theorem 8.3.2 (p. 317): choice of γ and use of Proposition 2.6.6; arXiv v3 PDF pp. 135, 140. **Already corrected in print:** none found (new)

**What the paper says.** After producing the Selmer submodule S, both proofs choose (γ₁, γ₂, ξ) satisfying Lemma 2.7.1(a)–(e). They then invoke Proposition 2.6.6 to fix an (S, γ)-abundant element Ψ in rank 0, or an abundant pair (Ψ₁, Ψ₂) in rank 1.

**Why it is wrong or incomplete.** Suppose ρ̄ extends to r̄ on Γ_{F⁺} (a base-change situation, e.g. Corollary 8.2.3) and S = O_λ·s with c·s = εs. For a Frobenius σ at a γ-associated place, the cocycle relation gives s(σ^{2g}) = ε·r̄(σ)·s(σ^{2g}), and r̄(σ) acts on the line (R̄^{(m)})^{h_γ} by a sign b(γ). If εb = −1, then θ_S(Ψ)(s) = 0 for every Ψ ∈ G_{S,γ}. In that case no abundant element exists and loc_w(s) = 0 at every γ-associated place. Nothing in (a)–(e) ties b to ε, and γ is chosen without regard to S. This is how E1 (Lemma 2.6.4) enters §8.

**Correction.** Choose γ after S so that b(γ) = ε. In the elliptic case, replace γ by γ·ρ̄₊(z), where (ρ̄_{A₀}, ρ̄_{A₁}, ε̄)(z) = (−1, 1, 1); this flips b and preserves (a)–(e). In rank 0, take S inside one c-eigenspace. In rank 1, when S meets both eigenspaces, use γ at 𝔭₁ and γz at 𝔭₂. Base-change cases whose image contains no central −1 need a further argument.

**Effect on the main results.** This affects the proofs of Theorems 8.2.2 and 8.3.2 (Theorems 1.1.5 and 1.1.9) in essentially self-dual, base-change situations. Corollary 8.2.3 (Theorem 1.1.1) is repairable as above. In the setting of Corollary 8.2.5 (Theorem 1.1.7), when the image has no central −1, the paper supplies no repair.

### E103. Indices (γ1, γ2) and ρ̄_{1+}, ρ̄_{2+} should be 0 and 1

*Misprint; reaches nothing.* **Where:** Proof of Theorem 8.2.2, published p. 310; proof of Theorem 8.3.2, p. 317. **Already corrected in print:** none found (new)

**What the paper says.** Both proofs choose '(γ1, γ2, ξ) in the image of (ρ̄^{(m)}_{1+}, ρ̄^{(m)}_{2+}, ϵ̄^{(m)}_ℓ)' satisfying (a)–(e) of Lemma 2.7.1.

**Why it is wrong or incomplete.** The two representations are indexed α = 0, 1 throughout (§2.7, Lemma 2.7.1, Remark 8.1.2). So ρ̄_{2+} is undefined, and (a)–(e) are conditions on γ₀ and γ₁.

**Correction.** Read (γ₀, γ₁, ξ) in the image of (ρ̄^{(m)}_{0+}, ρ̄^{(m)}_{1+}, ϵ̄^{(m)}_ℓ).

**Effect on the main results.** None.

### E104. Polarization gives (R̄^{(m)})^*(1), not (R̄^{(m)})^*

*Misprint; reaches nothing.* **Where:** Proof of Theorem 8.2.2, published p. 311; proof of Theorem 8.3.2, p. 319. **Already corrected in print:** none found (new)

**What the paper says.** Before computing local Tate pairings, both proofs 'identify R̄^{(m)c} with (R̄^{(m)})^* via the polarization Ξ'.

**Why it is wrong or incomplete.** Ξ: R^c ≅ R^∨(1) is a 1-polarization (§2.7), and −^* is the untwisted Pontryagin dual Hom(−, E_λ/O_λ) (Notation 2.2.1). So R̄^{(m)c} ≅ (R̄^{(m)})^*(1), which is what the pairing (2.2) of H¹(F_w, M) with H¹(F_w, M^*(1)) requires.

**Correction.** Read (R̄^{(m)})^*(1).

**Effect on the main results.** None.

### E105. Corollaries 8.2.3, 8.2.5 leave n = 2, F⁺ = ℚ unproved

*Gap; reaches a stated result.* **Where:** Corollary 8.2.3(c) and its proof, published pp. 313–314; Corollary 8.2.5(c) and its proof, p. 314; arXiv v3 PDF pp. 137–138. **Already corrected in print:** none found (new)

**What the paper says.** Corollaries 8.2.3 and 8.2.5 assume only '(c) F⁺ ≠ ℚ if n ⩾ 3'. They are proved from Theorem 8.2.2 together with Lemma 8.1.3 (resp. Lemma 8.1.4).

**Why it is wrong or incomplete.** Lemma 8.1.3 assumes F⁺ ≠ ℚ outright, and Lemma 8.1.4 has hypothesis (c) F⁺ ≠ ℚ. Both need it to get (L7) from Corollary D.1.4. Theorem 8.2.2 applies only to admissible λ, so for n = 2 and F⁺ = ℚ, which (c) allows, the proofs give nothing. arXiv v1/v2 covered n = 2 with 'weakly admissible' primes. v3 deleted that notion but kept the '(c) … if n ⩾ 3' wording, and Remark 1.1.10 only asserts that a 'slightly different argument' exists.

**Correction.** Replace (c) by 'F⁺ ≠ ℚ' in both corollaries, as in Theorems 1.1.1 and 1.1.7, or supply the separate n = 2 argument.

**Effect on the main results.** This affects stated results: Corollaries 8.2.3 and 8.2.5 are unproved when n = 2 and F⁺ = ℚ. Theorems 1.1.1 and 1.1.7 in the introduction already assume F⁺ ≠ ℚ and are unaffected.

### E106. (8.5) at ℓ-adic places needs integral p-adic Hodge theory

*Gap; reaches the proof.* **Where:** Proof of Theorem 8.2.2, justification of (8.5), published p. 313; the same for (8.14) in the proof of Theorem 8.3.2, p. 319. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Theorem 8.2.2 justifies (8.5), loc_w(c₁) ∈ H¹_ns(F_w, R̄^{(m)c}) outside Σ⁺ ∪ {𝔭}, in one sentence: Sh′_n and Sh′_{n+1} have smooth models over O_{F_w} 'for which (an analogue of) Lemma 4.2.4 holds'. (8.14) in Theorem 8.3.2 is justified the same way.

**Why it is wrong or incomplete.** (8.5) is also used at the ℓ-adic places, in the Σ⁺_ℓ bullet on p. 311. Lemma 4.2.4 is a specialization isomorphism for coefficients prime to the residue characteristic. It gives unramifiedness at w ∤ ℓ but says nothing at w | ℓ. There one needs the torsion class loc_w(c₁) to be crystalline in the sense of Definitions 2.2.4–2.2.5. Lemma 2.2.6 handles only free modules, not a torsion class obtained through Υ_i and reduction mod (𝔫₀,𝔫₁).

**Correction.** For w | ℓ, add the missing argument. F_w/ℚ_ℓ is unramified and the relative dimension is 2n−1 ⩽ ℓ−2 by (L1). For X, Z smooth proper over O_{F_w}, the Faltings/Fontaine–Messing comparison makes the torsion Abel–Jacobi extension torsion-crystalline. Such modules are closed under subquotients and sums, so the pushout along Υ_i stays in H¹_ns.

**Effect on the main results.** This affects the proof: the ℓ-adic bullet of the pairing computation in Theorems 8.2.2 and 8.3.2, and hence Theorems 1.1.1, 1.1.5, 1.1.7 and 1.1.9, needs it. The fact is standard in the Fontaine–Laffaille range and is not expected to fail.

### E107. Remark 8.2.4 cites condition (a) instead of (b)

*Misprint; reaches nothing.* **Where:** Remark 8.2.4, published p. 314. **Already corrected in print:** none found (new)

**What the paper says.** Remark 8.2.4 summarizes what is known about modularity of symmetric powers of elliptic curves, 'namely, condition (a) in Corollary 8.2.3'.

**Why it is wrong or incomplete.** In Corollary 8.2.3, condition (a) is non-isogeny, and condition (b) is the modularity of Sym^{n₀−1}A₀ and Sym^{n₁−1}A₁.

**Correction.** Read condition (b).

**Effect on the main results.** None.

### E108. Vacuous 'for every prime λ' in Conjecture 8.3.1

*Misprint; reaches nothing.* **Where:** Conjecture 8.3.1, published p. 315. **Already corrected in print:** none found (new)

**What the paper says.** Conjecture 8.3.1 asks for data 'such that for every prime λ of E' the graph △Sh(V_n,K_n) is nonzero in CH^n(Sh(V_{n₀},K_{n₀}) ×_F Sh(V_{n₁},K_{n₁}))_E/(ker φ_{Π₀}, ker φ_{Π₁}).

**Why it is wrong or incomplete.** The conclusion concerns a Chow group with E-coefficients and does not involve λ, so the quantifier is empty. The λ-adic nonvanishing (8.10) would follow only with Beilinson's injectivity conjecture.

**Correction.** Delete 'for every prime λ of E,' or state the λ-adic version: AJ^{Π₀,Π₁}_λ(△Sh(V_n,K_n)) ≠ 0 for every λ.

**Effect on the main results.** None; this concerns only the wording of a conjecture.

### E109. Theorem 8.3.2 refers to U(V°_{n₀}) instead of U(V_{n₀})

*Misprint; reaches nothing.* **Where:** Theorem 8.3.2, second bullet (the object (K_n, K_{n+1})), published p. 316; the bullet begins on p. 315. **Already corrected in print:** none found (new)

**What the paper says.** Theorem 8.3.2 requires (K_{n₀})_v to be a transferable open compact subgroup of U(V°_{n₀})(F⁺_v) for v ∈ Σ⁺_min.

**Why it is wrong or incomplete.** Theorem 8.3.2 involves only the indefinite space V_n (and V_{n₀}); no V° appears in it. The matching condition in the setup of §7.3 (p. 298) reads U(V_{n₀})(F⁺_v). The ° is carried over from §7.2 and Lemma 8.2.1.

**Correction.** Read U(V_{n₀})(F⁺_v).

**Effect on the main results.** None.

### E110. Coefficient L(n) should be O_λ(n) in proof of Theorem 8.3.2

*Misprint; reaches nothing.* **Where:** Proof of Theorem 8.3.2, the exp_λ(loc_{𝔭₁}(…)) display after 'which implies that' (two displays before (8.12)), published p. 318. **Already corrected in print:** none found (new)

**What the paper says.** The proof bounds the exponent of loc_{𝔭₁}([△Sh(V_n,K_n)]) in H^{2n}_ét((Sh(V_{n₀},K_{n₀}) ×_F Sh(V_{n₁},K_{n₁}))_{F_{𝔭₁}}, L(n))/(𝔫₀,𝔫₁).

**Why it is wrong or incomplete.** L is the p-coprime coefficient ring of Construction 4.6.1. In §8 the coefficients are O_λ, as in Theorem 7.3.4, which is applied next.

**Correction.** Read O_λ(n).

**Effect on the main results.** None.

### E111. (8.12) and the §7.2 set-up use K⋆_sp instead of K⋆_{sp,sp}

*Misprint; reaches nothing.* **Where:** Proof of Theorem 8.3.2, (8.12) on published p. 318 and the next paragraph on p. 319. **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Theorem 8.3.2, (8.12) bounds exp_λ of 𝟙_{Sh(V⋆_n, K⋆_sp)}, and the next paragraph applies §7.2 with (K°_sp, K°_{n+1}) = (K⋆_sp, K⋆_{n+1}).

**Why it is wrong or incomplete.** Theorem 7.3.4, which (8.12) invokes, is stated for 𝟙_{Sh(V⋆_n, K⋆_{sp,sp})}, where K⋆_{sp,sp} = (i_nK^p_sp) × K⋆_{sp,p} and K⋆_{sp,p} = K⋆_{n,p} ∩ K⋆_{n+1,p}. The printed K⋆_sp = (i_nK^p_sp) × K⋆_{n,p} is larger. For n even the intersection is a proper subgroup (Remark 4.5.8), and Sh(V⋆_n, K⋆_sp) does not map to Sh(V⋆_{n+1}, K⋆_{n+1}). For n odd the two groups coincide.

**Correction.** Read K⋆_{sp,sp} in both places: in (8.12), and in (K°_sp, K°_{n+1}) = (K⋆_{sp,sp}, K⋆_{n+1}).

**Effect on the main results.** None. Theorem 7.3.4 determines which group is meant, and the proof of Theorem 8.3.2 is unchanged.

### E112. Undefined H¹_f(F, R̄^{(m)}) in the proof of Theorem 8.3.2

*Misprint; reaches nothing.* **Where:** Proof of Theorem 8.3.2, published p. 319. **Already corrected in print:** none found (new)

**What the paper says.** The proof says: “Replace s₂ by its image in H¹_f(F, R̄^{(m)}).”

**Why it is wrong or incomplete.** Definition 2.4.2 defines H¹_f only for free or rational coefficients. For the torsion module R̄^{(m)} it defines only H¹_{f,R}(F, R̄^{(m)}), the image of H¹_f(F, R). So the printed H¹_f(F, R̄^{(m)}) is not defined. The parallel rank-zero sentence on p. 311 says “its image in H¹(F, R̄^{(m)})”.

**Correction.** Read “its image in H¹(F, R̄^{(m)})”, as on p. 311.

**Effect on the main results.** None.

### E113. The blow-up claim in the proof of Proposition A.2.4(2) is unjustified

*Gap; reaches the proof.* **Where:** Proof of Proposition A.2.4(2), published p. 328. **Already corrected in print:** none found (new)

**What the paper says.** To prove A.2.4(2), the paper notes that π: D̃L(𝒱) → DL(𝒱♯) is bijective away from the finitely many special points, with fibre ℙ^{r−1} over each. It concludes: “In particular, π is a blow-up along DL(𝒱♯)′”, with exceptional divisor E.

**Why it is wrong or incomplete.** Fibre data do not determine a blow-up. For example, blowing up a smooth surface along the non-reduced point (x, y²) gives a map that is an isomorphism away from the point, with reduced fibre ℙ¹ over it. But the total space is singular and the exceptional Cartier divisor is 2·ℙ¹. The later computation depends on the blow-up structure: ℒ|_E ≅ O_E(−E) = O_E(1) and c₁(O(E))|_E = −η in (A.3)–(A.4), and these fix the value of the integral.

**Correction.** Realise D̃L(𝒱) inside the ℙ^{r−1}-bundle of hyperplanes H₂ ⊂ H^⊨ over DL(𝒱♯), as the locus where the projection ℓ: H^⊨ → O·1 vanishes on H₂. Then show that ℓ, a section of a rank-r bundle on the smooth r-dimensional DL(𝒱♯), vanishes transversally, exactly at the reduced set of special points. The standard description then identifies π with the blow-up of that set, E with its exceptional divisor, and gives O_E(E) ≅ O_E(−1).

**Effect on the main results.** The gap is in the proof of Proposition A.2.4(2). Part (1) is deduced from (2), so it inherits the gap. These parts feed Propositions 5.8.6 and 5.8.9 (the intersection numbers d•_{r,p}), and through them Proposition 6.3.1 and the first reciprocity law. The value is very likely correct: r = 1 checks directly, and d•_{r,q} are exactly the numbers that make Proposition B.3.5(3) factor. So the main theorems are not believed affected, but the written argument needs the transversality check.

### E114. Notation B.2.1: a should lie in (F⁺)^×, not F^×

*Misprint; reaches nothing.* **Where:** Notation B.2.1, published p. 335. **Already corrected in print:** none found (new)

**What the paper says.** For t ∈ ℤ^N and a ∈ F^×, Notation B.2.1 takes a^t ∈ A_N(F⁺) acting on e_{−i} by a^{t_{r+1−i}}. It then forms K ϖ^t K for a uniformiser ϖ of F.

**Why it is wrong or incomplete.** A_N(F⁺) consists of the elements of U(V_N)(F⁺) that act on each e_i by a scalar in F⁺ (p. 334). For a ∈ F^× ∖ F⁺, the unitary element acting by a^{t_{r+1−i}} on e_{−i} acts by (a^c)^{−t_{r+1−i}} on e_i. These scalars are not in F⁺, so a^t ∉ A_N(F⁺).

**Correction.** Take a ∈ (F⁺)^× and ϖ a uniformiser of F⁺. It is also a uniformiser of F, since F/F⁺ is unramified.

**Effect on the main results.** None. The double cosets K ϖ^t K do not depend on the choice of uniformiser.

### E115. Proof of Lemma B.4.4: the last factor is missing “+ 1”

*Misprint; reaches nothing.* **Where:** Proof of Lemma B.4.4, first display after ‘By (B.3), (B.4) and (B.5), the lemma is equivalent to that for every integer k ⩾ 0, we have’, published p. 348. **Already corrected in print:** none found (new)

**What the paper says.** The display after “the lemma is equivalent to that for every integer k ⩾ 0, we have” contains the product (q + 1)(q³ + 1)⋯(q^{2(k−δ)−1}).

**Why it is wrong or incomplete.** The last factor should be q^{2(k−δ)−1} + 1, as in (B.5) on the same page and in the equivalent form (B.6). (B.6) as printed is correct, and was checked by computer for 0 ⩽ k ⩽ 7.

**Correction.** …(q + 1)(q³ + 1)⋯(q^{2(k−δ)−1} + 1)…

**Effect on the main results.** None.

### E116. Proof of Lemma B.4.5: the isotropy equation ignores the basis order

*Misprint; reaches nothing.* **Where:** Proof of Lemma B.4.5, published p. 350. **Already corrected in print:** none found (new)

**What the paper says.** Writing (f₁, …, f_s) = (e₁, …, e_s) + (e_{−s}, …, e_{−1}, e₀)·(A over v), the proof says Y is isotropic iff ᵗA^c + A + ᵗv^c·v = 0.

**Why it is wrong or incomplete.** In the displayed order, row k of A multiplies e_{−(s+1−k)}. So (f_i, f_j) = A_{s+1−i, j} + (A_{s+1−j, i})^c + v_i^c v_j, and the condition is J_sA + ᵗ(J_sA)^c + ᵗv^c v = 0, where J_s is the s×s antidiagonal permutation matrix.

**Correction.** Order the basis as (e_{−1}, …, e_{−s}, e₀), or replace A by J_sA in the isotropy equation.

**Effect on the main results.** None. A ↦ J_sA is a bijection, so the count q^{2s}·q^{s²} = q^{s(s+2)} and the lemma are unchanged.

### E117. Undefined P_π in the Langlands classification (§C.1)

*Misprint; reaches nothing.* **Where:** §C.1, Langlands classification, published p. 351; arXiv v3 p. 163. **Already corrected in print:** none found (new)

**What the paper says.** §C.1 recalls the Langlands classification with “a unique strictly positive (unramified) character χ of P_π(F⁺)”.

**Why it is wrong or incomplete.** The parabolic has just been named P, and P_π is never defined. The subscript π is a stray.

**Correction.** Read “χ of P(F⁺)” (or M_P(F⁺)).

**Effect on the main results.** None.

### E118. W_N has only two characters when N = 2

*Misprint; reaches nothing.* **Where:** Proof of Proposition C.2.1(2), published p. 354; arXiv v3 p. 164. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Proposition C.2.1(2) says W_N has only four characters, and that only 𝟏 and ε_N^TT give constituents with nonzero P_N^{(r)}(κ⁺)-invariants.

**Why it is wrong or incomplete.** W_N ≅ {±1}^r ⋊ 𝔖_r has abelianisation (ℤ/2)² for r ⩾ 2, hence four characters. But W₂ = {±1} has only two.

**Correction.** Read “at most four characters (four if r ⩾ 2, two if r = 1)”.

**Effect on the main results.** None. For r = 1 the two characters are exactly 𝟏 and ε₂^TT, so the uniqueness conclusion holds. N = 2 is in any case subject to E10.

### E119. Parameters α_i are unique only up to the Weyl group

*Misprint; reaches nothing.* **Where:** Lemma C.2.2(2) (published p. 355), Lemma C.2.4 (p. 360), and proofs of Lemma C.2.2(1) (p. 357), C.2.2(2) (p. 358), C.2.4 (p. 361); arXiv v3 p. 165–169. **Already corrected in print:** none found (new)

**What the paper says.** Lemma C.2.2(2) and Lemma C.2.4, and the proofs of C.2.2(1), C.2.2(2) and C.2.4, assert that the α_i with 1 ⩽ |α₂| ⩽ ⋯ ⩽ |α_r| giving BC(π) are “unique up to permutation”.

**Why it is wrong or incomplete.** If |α_i| = 1, both α_i and α_i^{−1} satisfy the normalisation. For r = 2, α₂ = i and α₂ = −i give the same irreducible unitary induction, I^{GL₄}((−i)̲ ⊠ St₂ ⊠ i̲) ≅ I^{GL₄}(i̲ ⊠ St₂ ⊠ (−i)̲), but (i) and (−i) are not permutations of each other.

**Correction.** Read “unique up to permutation and up to replacing α_i by α_i^{−1} when |α_i| = 1”, i.e. up to the Weyl group of type BC_{r−1} (BC_r in the proof of C.2.2(1)).

**Effect on the main results.** None. The uniqueness clause is never used: Proposition C.2.5 compares BC(π) and BC(π′) directly.

### E120. Undefined P₀ for the standard parabolic in §C.2

*Misprint; reaches nothing.* **Where:** Proofs of Lemma C.2.2(1) (published p. 357), Lemma C.2.2(2) (p. 359) and Lemma C.2.4 (p. 361); arXiv v3 p. 166, 168, 169. **Already corrected in print:** none found (new)

**What the paper says.** Three proofs (C.2.2(1), C.2.2(2), C.2.4) take P to be “the parabolic subgroup of G containing P₀” whose Levi quotient is G₀ × ∏ Res_{F/F⁺}GL_{r_i}.

**Why it is wrong or incomplete.** P₀ is never defined. Only P_{0min} := G₀ ∩ P_min and Q₀ := G₀ ∩ Q are. The intended P is the standard parabolic containing the fixed minimal parabolic P_min.

**Correction.** Read “containing P_min”.

**Effect on the main results.** None.

### E121. C(α) in the proof of Lemma C.2.4 uses undefined α₁

*Misprint; reaches nothing.* **Where:** Proof of Lemma C.2.4, displayed formula for C(α), published p. 362; arXiv v3 p. 169. **Already corrected in print:** none found (new)

**What the paper says.** The proof of Lemma C.2.4 gives C(α) = ∏_{i=r₀+1}^{r} ((α_i − q^{−1})/(α_i − 1) · ∏_{|α_j|<|α_i|} (α_i − q^{−2}α_j)/(α_i − α_j) · ∏_{j=1}^{i−1} (α_iα_j − q^{−2})/(α_iα_j − 1)), where α = (α₂, …, α_r).

**Why it is wrong or incomplete.** Here α₁ does not exist. Read α₁ := q, as in the proof of C.2.2(2), where α = (q, α₂, …, α_r), and restrict the middle product to j ⩾ 2. Then the formula is right, because (α_i − q^{−1})/(α_i − 1) · (qα_i − q^{−2})/(qα_i − 1) = (α_i − q^{−3})/(α_i − 1). That is the correct long-root factor for U(V′₄): its unipotent radical has F⁺-dimension 4 + 1, and the factor vanishes at q^{−3}, where 𝟏 embeds. Dropping the j = 1 term instead gives the wrong factor that arXiv v1 printed.

**Correction.** Add “where α₁ := q” and restrict the middle product to j ⩾ 2. Equivalently, the first factor is (α_i − q^{−3})/(α_i − 1) and both products run over j ⩾ 2.

**Effect on the main results.** None. Only C(α) ≠ 0 is used, and every factor is finite and nonzero for |α_i| > 1.

### E122. Corollary C.3.3: wrong cross-references to C.2.5 and Definition 3.2.3

*Misprint; reaches nothing.* **Where:** Proof of Corollary C.3.3, and its statement, published p. 364; arXiv v3 p. 171. **Already corrected in print:** none found (new)

**What the paper says.** For odd N = 2r + 1, the proof of C.3.3 gets BC(π_v) ≃ Π′_v at every place v “by Propositions C.3.1 and C.2.5”. The statement attaches “(Definition 3.2.3)” to “a discrete series representation”.

**Why it is wrong or incomplete.** Proposition C.2.5 is about the even-rank groups U_{2r} and U′_{2r}. At 𝔭, the needed input is the hypothesis BC(π_𝔭) ≃ BC(π′_𝔭) together with C.3.1(2); at τ_∞ it is C.3.1(4). Definition 3.2.3 defines automorphic base change, not discrete series.

**Correction.** Proof: read “by Proposition C.3.1 and the hypothesis BC(π_𝔭) ≃ BC(π′_𝔭)”. Statement: move “(Definition 3.2.3)” to after “BC(π′) exists”.

**Effect on the main results.** None.

### E123. The Hecke polynomial H_w is used but never defined

*Gap; reaches nothing.* **Where:** Definition D.1.2, published p. 365; arXiv v3 p. 171. **Already corrected in print:** none found (new)

**What the paper says.** Definition D.1.2 calls φ decomposed generic at w if φ(H_w) has distinct nonzero roots and no two of them have ratio ‖w‖. Here “H_w ∈ 𝕋_{N,w}[T] is the Hecke polynomial”.

**Why it is wrong or incomplete.** The paper never defines H_w. The phrase occurs only here: not in §3.1, where 𝕋_{N,v} and the Satake transform are set up, nor anywhere else. The reader must import it from Caraiani–Scholze [12, Definition 1.9].

**Correction.** For w = uu^c split in F, define H_w as the monic degree-N polynomial over 𝕋_{N,w}, built from the T_{u,i} scaled by powers of ‖w‖ as in [12], whose image under φ_α (Construction 3.1.8(2)) is ∏_i (T − α_{1,i}) up to a common scalar. The condition does not depend on the choice of u.

**Effect on the main results.** None. The source is indicated (“essentially [12, Definition 1.9]”), and the condition is insensitive to scalar normalisations.

### E124. Proof of Proposition D.1.3 needs no place above w₀ in Σ⁺

*Gap; reaches the proof.* **Where:** Proof of Proposition D.1.3, published p. 366 (definition of K_{w_0,0}); arXiv v3 p. 172. **Already corrected in print:** none found (new)

**What the paper says.** The proof lets w₀ be the rational prime below w, puts K_{w₀,0} := ∏_{v|w₀} U(Λ)(O_{F⁺_v}), and calls it hyperspecial in G(ℚ_{w₀}).

**Why it is wrong or incomplete.** The proposition only asks that w ∉ Σ⁺ ∪ Σ⁺_ℓ and that w split in F. Another place v | w₀ may lie in Σ⁺, where Λ is not given, V_v need not be split, and K_v is arbitrary. Then K_{w₀,0} is undefined and not hyperspecial. The smooth model over W(𝔽̄_{w₀}), the Igusa varieties and the Mantovan formula used next are then unavailable. The rest of the proof (Σ, and test functions φ_Σ ⊗ φ^Σ on G(𝔸^{∞,w₀}) × J_b(ℚ_{w₀})) tacitly assumes w₀ ∉ Σ.

**Correction.** Add the hypothesis that no place of F⁺ above w₀ lies in Σ⁺ (i.e. w₀ ∉ Σ), or explain how to treat such places.

**Effect on the main results.** The gap is in the proof of Proposition D.1.3. Its only use, Corollary D.1.4, produces infinitely many admissible w and can pick one with w₀ ∉ Σ. So D.1.4 and the main theorems are unaffected.

### E125. Chebotarev step in Corollary D.1.4 must also control ‖w‖ mod ℓ

*Gap; reaches nothing.* **Where:** Proof of Corollary D.1.4, published p. 368; arXiv v3 p. 173. **Already corrected in print:** none found (new)

**What the paper says.** Having one w with α_i/α_j ∉ {1, ‖w‖} mod ℓ, the proof applies Chebotarev to ρ̄_{Π,λ} to get infinitely many split places at which (D.1) is decomposed generic.

**Why it is wrong or incomplete.** Decomposed genericity at a new place w′ needs no ratio of roots equal to ‖w′‖ in F̄_ℓ. Matching ρ̄(Frob_{w′}) with ρ̄(Frob_w) fixes the ratios (they are the α_i/α_j mod λ) but not ‖w′‖ mod ℓ, because the mod-ℓ cyclotomic character is not determined by ρ̄_{Π,λ}(Frob_{w′}).

**Correction.** Apply Chebotarev to ρ̄_{Π,λ} × ε̄_ℓ (in the compositum with F(ζ_ℓ)). This gives degree-one places u with ρ̄(Frob_u) conjugate to ρ̄(Frob_w) and ‖u‖ ≡ ‖w‖ mod ℓ.

**Effect on the main results.** None. The repair is routine and the conclusion of D.1.4 is correct.

### E126. §D.2: φ_Π should be ℂ-valued, not Q̄_ℓ-valued

*Misprint; reaches nothing.* **Where:** §D.2, published p. 369 (top); arXiv v3 p. 174. **Already corrected in print:** none found (new)

**What the paper says.** §D.2 writes “φ_Π : 𝕋_N^{Σ⁺} → Q̄_ℓ given by Π” and then fixes ι_ℓ : ℂ ≅ Q̄_ℓ.

**Why it is wrong or incomplete.** Proposition D.2.3 and its proof use ι_ℓφ_Π, which only makes sense if φ_Π is ℂ-valued, as in Construction 3.1.10.

**Correction.** Read φ_Π : 𝕋_N^{Σ⁺} → ℂ (or O_{ℚ(Π)}). Then ι_ℓφ_Π is Q̄_ℓ-valued.

**Effect on the main results.** None.

### E127. ω_{𝒜,τ∞^c} printed for ω_{𝒜^∨,τ∞^c} after (5.18)

*Misprint; reaches nothing.* **Where:** Proof of Theorem 5.7.7(2), sentence after (5.18), published p. 222. **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Theorem 5.7.7(2), the paper writes 𝕍 im γ_{1*,τ∞} = (γ_{1*,τ∞^c} ω_{𝒜,τ∞^c})^{(p)}.

**Why it is wrong or incomplete.** The subbundle of H₁^dR(𝒜)_{τ∞^c} that γ_{1*,τ∞^c} can be applied to is ω_{𝒜^∨,τ∞^c}. ω_𝒜 would live in de Rham cohomology.

**Correction.** Read ω_{𝒜^∨,τ∞^c}.

**Effect on the main results.** None.

### E128. 'a disjoint of' for 'a disjoint union of' in Theorem 5.7.8

*Misprint; reaches nothing.* **Where:** Theorem 5.7.8, first sentence, published p. 223; proof, first paragraph, p. 224. **Already corrected in print:** none found (new)

**What the paper says.** Theorem 5.7.8 and its proof say S†_{s•} 'is a disjoint of' (p + 1)(p³ + 1)⋯ copies of Spec κ.

**Why it is wrong or incomplete.** The word 'union' is missing.

**Correction.** Read 'a disjoint union of'.

**Effect on the main results.** None.

### E129. inc•_0 should read inc•_1 in the even case of Theorem 5.11.5

*Misprint; reaches nothing.* **Where:** Proof of Theorem 5.11.5, case n = n0 even, second line of the displays for (1) and for (2), published p. 259; arXiv v3 same place (PDF p. 103). **Already corrected in print:** none found (new)

**What the paper says.** In the proof of Theorem 5.11.5 for n = n0 even, both computations end with ∫_{M̄•_{n+1}} inc•_0(1_{s•_{n+1}}) ∪ inc^?_1(1_{s′_{n+1}}).

**Why it is wrong or incomplete.** inc•_0 is defined on functions on Sh(V°_{n0}, K•_{n0,p}) with values in the cohomology of M̄•_{n0} = M̄•_n. But s•_{n+1} lives at level n+1 = n1, and the integral is over M̄•_{n+1}. The identity used one line up is m•_{↑!}inc•_0(1_{s•_n}) = inc•_1(1_{s•_{n+1}}).

**Correction.** Read inc•_1(1_{s•_{n+1}}) in both displays.

**Effect on the main results.** None. It is an index slip, and the substitution is displayed one line above.

### E130. Undefined Σ⁺ in (8.5) and (8.14) should be Σ⁺_min

*Misprint; reaches nothing.* **Where:** Proof of Theorem 8.2.2, (8.5), published p. 311; proof of Theorem 8.3.2, (8.14), p. 319. **Already corrected in print:** none found (new)

**What the paper says.** (8.5) and (8.14) claim that loc_w(c) is non-singular at every w not above Σ⁺ ∪ {𝔭} (resp. Σ⁺ ∪ {𝔭₁, 𝔭₂}).

**Why it is wrong or incomplete.** No unsubscripted Σ⁺ is defined in §§7–8. The pairing bullets use these statements at every place outside Σ⁺_min and the level-raising primes, including the ℓ-adic places.

**Correction.** Read Σ⁺_min in place of Σ⁺.

**Effect on the main results.** None.

### E131. Undefined N_0 in the Levi of P′ (§C.1)

*Misprint; reaches nothing.* **Where:** §C.1, local base change of a Langlands quotient, published p. 352 (PDF 246); arXiv v3 §C.1. **Already corrected in print:** none found (new)

**What the paper says.** §C.1 writes BC(π) as a Langlands quotient induced from the standard parabolic P′ with Levi GL_{r_t} × ⋯ × GL_{r_1} × GL_{N_0} × GL_{r_1} × ⋯ × GL_{r_t}.

**Why it is wrong or incomplete.** N_0 is never defined. It must be the rank of the hermitian space of the unitary factor G_0, namely N − 2(r_1 + ⋯ + r_t).

**Correction.** Add “where N_0 := N − 2(r_1 + ⋯ + r_t)”.

**Effect on the main results.** None.

## Independent review (REV-ERRATA-PAPER-LIU-ETAL-22)

Claude Code, session cc-fb70e5, 2026-09-28 (issue #2196). **All 131 findings are confirmed.** None is rejected and none is added. Each finding now carries a `review` object with the reviewer's own reason.

**What was read.**
- The published article, in the same file as the errata worker: sha256 `dd821abd…d97`, 269 pages, printed page = PDF page + 106.
- arXiv v3, downloaded afresh: sha256 `84dc7c83…fe46`.

**How each finding was checked.**
- Every quotation was located at its locator. Where the text layer garbles the formula, it was read on the rendered page image (pp. 139, 187, 273, 282, 285, 288, 294, 295, 301 and 259, among others).
- Every reason was checked independently. These were re-derived:
  - the counterexamples of E1/E23 (the golden-ratio Kummer class over ℚ(√5, i)), E2 (the matrix [[λ, 1], [0, λ]]), E5 (𝔽₅ × 𝔽₅), E9 (𝔽₉), E10 (N = 2), E21 (𝔽₂₅), E27, E28, E35 (split p) and E68 (p = 3, L = 𝔽₅);
  - the D₄ example (i) of E31;
  - the monodromy computation of E85;
  - the degree counts of E7, E14, E65, E95 and E98.
- The change of definition behind E32 was checked against arXiv v3: the composite of reflex fields there, the intersection in the published version.

**Not re-derived.** The W(B₄) octic example of E31(ii)/E32. For E30, whether later Kisin–Shin–Zhu work establishes Hypothesis 3.2.10 was not checked. arXiv 2509.18615 (on the Beilinson–Bloch–Kato conjecture for polarized motives) was not read, so any later correction there is not reflected in `known`.

No published erratum or corrigendum to the article was found (web search, 2026-09-28).
