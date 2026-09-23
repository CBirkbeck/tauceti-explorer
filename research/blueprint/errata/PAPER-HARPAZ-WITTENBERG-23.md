# Mistakes in Harpaz–Wittenberg, *The Massey vanishing conjecture for number fields*

Job ERRATA-PAPER-HARPAZ-WITTENBERG-23. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-HARPAZ-WITTENBERG-23.json` beside this file. Reviewed by `REV-ERRATA-PAPER-HARPAZ-WITTENBERG-23` (issue #1716), Claude Code session `cc-7b31c4`, 23 September 2026: **all sixteen confirmed**, none rejected, amended or added; every quotation was matched in the LaTeX source of arXiv v2, which the errata records as identical to the version read. The review is written up in [REV-ERRATA-PAPER-HARPAZ-WITTENBERG-23.md](../reviews/REV-ERRATA-PAPER-HARPAZ-WITTENBERG-23.md).

**Paper and version read.** Yonatan Harpaz and Olivier Wittenberg, Duke Mathematical Journal 172 (2023), 1–41, DOI 10.1215/00127094-2022-0004. The version read is the author final version from Wittenberg's page (33 pages, revised 9 December 2021, SHA-256 `d95100eb…546f`), which is identical to arXiv 1904.06512v2 ("final version"). Every passage below was re-read there. The published Duke version could not be loaded, so it was not compared.

**Earlier work.**
- The extraction PAPER-HARPAZ-WITTENBERG-23, by Codex, corrected most of these in passing without recording them as mistakes.
- Its independent review REV-PAPER-HARPAZ-WITTENBERG-23 (PR #1762), by this session, confirmed them and found E2 and E7.

**Existing corrections.** None was found:
- arXiv has v1 (2019) and v2 (2022);
- Wittenberg's publications page lists errata for other papers but none for this one;
- a web search found nothing.

All sixteen findings are new, subject to the Duke text.

**Effect on the main results.** Theorem 1.3 (Massey vanishing for number fields, all n ≥ 3, all p), Theorem 7.4 and the Z/8 counterexample all stand.
- One gap in the main proof, E9, concerns archimedean places and has a short repair.
- Three stated lemmas are false as literally stated (E3, E10, E12), but only in cases the paper does not use.
- The rest are misprints.

---

## E1. V(k) ≠ 0 (misprint)

Proposition 2.5 says the Massey product contains 0 "if and only if V(k) ≠ 0". V(k) is a set of points, so this should read V(k) ≠ ∅.

## E2. The compactification of V^c (misprint)

The unramified Brauer group is defined on p. 6 as the image of Br(V^c), "where V^c is any choice of a smooth compactification of V^c". It should read "a smooth compactification of V".

## E3. The outer exponent of U¹ at p = 2 (error; affects a stated result, not the main theorems)

Lemma 4.7 says that for 2 ≤ n ≤ 6 the outer exponent of U¹ "is equal to p", and its proof begins "the outer exponent … is divisible by p".

Definition 3.2 defines the outer exponent as the *least* divisor e of the exponent such that the powering action of (Z/d)^× on conjugacy classes factors through (Z/e)^×. For p = 2 the proof shows that this action is trivial: by Lemma 4.6 for n ≤ 3, and because M^{−1} is conjugate to M for 4 ≤ n ≤ 6. Since (Z/2)^× = (Z/1)^×, the least such divisor is 1, not 2. The divisibility argument works only for odd p.

What the proof establishes, and what the paper uses, is that the action factors through (Z/p)^×. That is used only to make the cyclotomic character χ : G → (Z/e)^× trivial when μ_p ⊂ k, and to choose L ⊇ μ_e. Both are unchanged for e = 1, since μ₂ ⊂ k.

## E4. "Divisible by 9" (misprint)

In the case p = 3, n = 6 of the same proof, "By Lemma 4.6, the exponent of U¹ is divisible by 9" should read "divides 9". Lemma 4.6 gives exactly that, and the next sentence, "it suffices to show that M⁴ is conjugate to M", uses exactly that.

## E5. A missing exponent in the proof of Lemma 4.13 (misprint)

The product Q = e_{n−2,n}^{b_{n−2}} ⋯ e_{0,2}^{b_0} e_{0,3} should end in e_{0,3}^{a₂}, since Q is defined on p. 16 with Q_{0,3} = a₂. The conjugation identity that follows does not involve that entry.

## E6. "The lemma … lifts to Z" (misprint)

In the easy case of the proof of Proposition 5.3 (H²(K, F_p) = 0), the text says "the lemma trivially holds: any homomorphism Γ_K → U/Z lifts to Z". It should say that the proposition holds and that the homomorphism lifts to U. The obstruction to lifting through U → U/Z lies in H²(K, Z).

## E7. ρ_{v,u} for ρ_{u,v} (misprint)

On p. 21, "ρ_{v,u} is Γ_K-equivariant" and "an extension of ρ_{v,u}" should both read ρ_{u,v}, the map defined in (5.5) by ρ_{u,v}(Q) = u(Q − I)v and used in the same paragraph.

## E8. Br₀(V) in the wrong place in diagram (5.7) (misprint)

The top right entry of (5.7) is printed as Br_{1,nr}(W)/Br₀(V). Br₀(V) is not a subgroup of Br(W), so it should be Br_{1,nr}(W)/Br₀(W). The next sentence concludes that the pull-back becomes constant in Br(W).

## E9. The archimedean places (gap; affects the proof)

The proof of Theorem 5.1 reduces to showing that W(k_v) ≠ ∅ for every place v, "which is exactly what Proposition 5.3 provides". The proof of Theorem 7.4 does the same. But Proposition 5.3 is stated for local fields in the paper's sense, "a complete discretely valued field with finite residue field" (p. 19), which excludes R and C. The missing cases are short:
- **v complex.** Γ_{k_v} is trivial.
- **v real, p odd.** U/P^{r,s} is a p-group, so any homomorphism from Γ_{k_v} ≅ C₂ to it is trivial.
- **v real, p = 2.** The proof of Proposition 5.3 goes through. The equivariantly split case is group theory. In the non-split case the pairing H¹(R, Hom(P/Z, μ₂)) × H¹(R, P/Z) → H²(R, μ₂) is perfect by Tate duality over R, so cup product with [γ] is onto.

## E10. Lemma 5.5 needs C finitely generated (error; affects a stated result, not its use)

Lemma 5.5 is stated for any short exact sequence 0 → A → B → C → 0 of discrete Γ-modules that splits as abelian groups, and attaches to it a class [γ] in continuous H¹(Γ, Hom(C, A)). For infinitely generated C the cocycle γ(g) = g s g⁻¹ − s need not be continuous into the discrete module Hom(C, A).

Take Γ = ∏ C₂, A = ⊕ F₂a_i and C = ⊕ F₂c_i with trivial action, and B = A ⊕ C with g·c_i = c_i + g_i a_i. B is discrete and the sequence splits as groups. But γ(g)(c_i) = g_i a_i, and the kernel of γ is {1}, which is not open.

The lemma holds for C finitely generated. That covers the only application, C = P^{r,s}/Z, which is finite.

## E11. 4 × 4 for 5 × 5 (misprint)

In the proof of Proposition 6.1, P_4 (spanned by the e_{i,j} with j ≤ 4) is called "a copy of the group of unitriangular 4 × 4-matrices whose first non-principal diagonal vanishes". The indices run from 0 to 4, so these are 5 × 5 matrices. This is the group U¹ for n = 4, which is how the argument uses it.

## E12. The bijection of Proposition 7.3 (error; affects a stated result, not its use)

Proposition 7.3 asserts a bijection between defining systems for a twisted Massey product and lifts α_Λ of a homomorphism α, where α is built from a *choice* of cocycles representing the α_i. For nontrivial actions this fails: a defining system whose adjacent cochains a_{i,i+1} are other representatives lifts no α built from the chosen ones.

Take Γ = C₂, R = F₃, N₀ the sign character, N₁ = N₂ = N₃ trivial, and all α_i = 0. Then a_{01}(σ) = σ·1 − 1, with all other cochains zero, is a defining system that lifts no α built from zero cocycles.

The bijection holds for defining systems whose adjacent cochains are the chosen cocycles. The existence statements used later are unaffected, since changing representatives conjugates α, as the parenthetical on p. 26 notes.

## E13. Theorem 7.4 omits "k a number field" (misprint)

Theorem 7.4 is stated without any hypothesis on k. The introduction announces it "over number fields" (p. 4), and its proof runs the number-field method of Theorem 5.1.

## E14. An index in the proof of Theorem 7.4 (misprint)

The eigenspaces of A on U^m/U^{m+1} are "the cyclic subgroups Hom_R(N_{i+m}, N_i)". Since U^m/U^{m+1} is spanned by the entries with j − i = m + 1, they should be Hom_R(N_{i+m+1}, N_i).

## E15. An external sum that counts the corner twice (misprint)

On p. 28, P^{r,s} is written as ⊕_{i=0}^{r} Hom_R(N_n, N_i) ⊕ ⊕_{j=n−s}^{n} Hom_R(N_j, N_0). The summands i = 0 and j = n are both the centre Z = Hom_R(N_n, N_0). The sum should be internal, as in Definition 5.2 where P^{r,s} is the subgroup generated, or j should run only to n − 1.

## E16. Minor slips (misprints)

- **p. 3:** "genericity assumptions on the classes α₁,…,α_n" should read α₀,…,α_{n−1}.
- **p. 7 (Theorem 2.6):** "Let V a homogeneous space" should read "Let V be a homogeneous space", and "orthogonal Br_nr(V)" should read "orthogonal to Br_nr(V)".
- **p. 10 (Corollary 3.5):** Ĥ^ab_v should read Ĥ^ab_v̄.
- **p. 18 (Remark 4.17):** the text promises a complete determination "also in the cases n = 4, 5, 6 (see §6)", but §6 treats n = 4, 5 and states the n = 6 facts without details (p. 24).
- **p. 20:** β̂ : Γ_k → P^{r,s} should read Γ_K.
- **p. 22:** Γ_{k_v} ⊆ Γ should read Γ_k.
- **p. 29 (the Z/8 example):** L ⊂ k̄ should read L ⊂ Q̄, and "identity" should read "identify".

## Not recorded

- Remark 3.4 and the n = 6 claims are stated without proof, but the paper says so openly.
- The order and sign of the cup product in Lemma 5.5 depend on conventions the paper does not fix, so they are not a mistake.
- The extraction's remark that formula (4.2) treats entries at distance ≥ 4 as zero in B describes correct behaviour: those entries lie in U³.
- A suspected indexing slip in Michailov's paper, which the extraction cites, belongs to that paper and was not verified here.
