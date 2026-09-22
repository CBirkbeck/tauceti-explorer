# Mistakes in Wood, *Nonabelian Cohen–Lenstra moments*

Job ERRATA-PAPER-WOOD-19. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-WOOD-19.json` beside this file.

**Paper and version read.** Melanie Matchett Wood, with an appendix joint with Philip Matchett Wood, Duke Mathematical Journal 168 (2019), 377–427, DOI 10.1215/00127094-2018-0037. The version read is arXiv 1702.04644v2 of 13 July 2018 (PDF SHA-256 `2eacf07f…e1bd`), as by the extraction. Its source file is named `Duke_Final_Revision.tex`, and every passage below was re-read there and in the PDF. The published text was not collated. Page numbers are those of v2.

**Earlier work.** The extraction PAPER-WOOD-19 (partial) found E1–E3 and E6–E8. E4 and E5 are misprints in the same proofs, found while checking them. The extraction also recorded two points about Wood (2021), *An algebraic lifting invariant*, a different source, so they are not recorded here:
- an omitted step (item 253);
- a missing inverse (item 254).

**Existing corrections.** None was found:
- Crossref registers no erratum for the DOI;
- the author's page links errata for other papers but not this one;
- v2 is the latest arXiv version;
- a web search and two later papers building on this one (Liu; Liu–Willyard) turned up nothing.

**Effect.** The good cases of the function-field Theorem 1.2 are unaffected. The other findings reach as follows:
- **E1:** weakens the bad-type limit to a liminf.
- **E7:** the refined Conjecture 5.1 is false as printed and needs u to be a generator.
- **The rest:** misprints and missing hypotheses, which the paper's uses satisfy.

## E1. Bad types: a liminf, not a limit (gap)

For G′ not good, Theorems 1.2 and 4.8 assert lim_{q→∞} Ẽ^±_{F_q(t),q^{2n}}(G,G′)/|H_2(G′,c)[q−1]| ≥ w_G n^{N_{G′}−1}.

**What the proof does.** It fixes q and keeps only the multidegrees in a set 𝒞, where all n_i are large and have prescribed parities. On these, Theorem 4.5(3) and Proposition 4.1 give exactly |H_2(G′,c)[q−1]| Frobenius-fixed components. All other components are discarded as nonnegative. The result is a lower bound for every large q, that is, for the liminf.

**What is missing.** Existence of the limit is not addressed. The discarded components, with small n_i, and how many of them Frobenius fixes, may depend on q.

**Correction.** Read liminf in the bad case. The passage from Ẽ to E in Theorem 1.2 divides by the constants |Aut_{G′}(G)| and A(G,G′) of §2.1, so the lower bound transfers.

## E2. The tame fundamental group is not pro-prime-to-p (error)

Definition 3.12, quoting EVW, says the tame quotient Γ of G_{F̄_p(t)} unramified outside S "is free pro-prime-to-p" on inertia generators δ_i.
- **Why it is false.** In characteristic p the tame fundamental group of P¹ ∖ S has finite quotients of order divisible by p. For p ≥ 5, the modular covers X(ℓ) → X(1) are tamely ramified over three points, with group PSL₂(F_ℓ), which has order divisible by p for suitable ℓ ≠ p.
- **What is true.** The maximal prime-to-p quotient of Γ is free pro-prime-to-p; this is what Grothendieck's comparison, which the paper cites, gives.
- **Effect.** None. Definition 3.12 and the proof of Theorem 3.13 only use maps to F and F̃_c, whose orders are prime to p.

## E3. Proposition 4.4 needs admissibility (error)

Proposition 4.4 states its bijection between surjections ρ of type G′ and marked (G′,c)-extensions for any subgroup G′ ⊆ G ≀ S_2. The inverse map takes the projection of Gal(M/K) ⊆ G × G to the first factor. That projection is surjective only when ker(G′ → S_2) projects onto G, which is part of the paper's definition of admissible.

Counterexample: G = C_3, G′ = ⟨(1,σ)⟩, Q = ℚ. The imaginary field ℚ(√−3) gives a marked (G′,c)-extension with ramified infinity type, but no C_3-extension has type G′, a group of order 2.

The paper applies the proposition only to admissible G′, so nothing it proves is affected.

## E4. q^n for q^{2n} in the proof of Theorem 1.2 (misprint)

On p.23 the limit over q with |H_2(G′,c)[q−1]| = d is written for Ẽ^±_{F_q(t),q^n}. The discriminant slice throughout is q^{2n}.

## E5. G for G′ and q^n for q^{2n−1} in the bad imaginary case (misprint)

On p.24 the Hurwitz schemes are written CHur_{G,n} and the multiplier H_2(G,c)[q−1], but both belong to G′. The point counts are written q^n + O_n(q^{n−1/2}), where n is the dimension from Theorem 4.7; here that dimension is Σn_i = 2n − 1. The following display correctly uses q^{2n−1} and O_n(q^{2n−3/2}).

## E6. The real case's discriminant degree (misprint)

On p.25, for real quadratic fields (trivial infinity type), the proof says Nm Disc(M) = q^{(Σn_i+1)|G′|/2} and gives the quadratic discriminant norm as q^{Σn_i+1}. Infinity is unramified here, so the "+1" is wrong: the norms are q^{(Σn_i)|G′|/2} and q^{Σn_i}. This matches the paper's own convention Σn_i = 2n − ε and the count over RQ_{=q^{2n}} that follows. The sentence was copied from the imaginary case, where the "+1" is right.

## E7. Conjecture 5.1 with u = 1 (error)

Conjecture 5.1 fixes h ∈ H_2(G′,c)[|μ_Q|] (printed with braces) and **any** root of unity u ∈ μ_L, L = Q(μ_{4|G̃′_c|}). It predicts that, for good G′, the tame rigid count with I(ρ,u) = h has average 1.

**Why it fails.** By Lemma 3.11, I(φ,u^λ) = I(φ,u)^λ, so I(ρ,1) = 1 for every ρ. For u = 1 and h ≠ 1 the count is identically zero.

**Where this happens.** Whenever H_2(G′,c)[|μ_Q|] ≠ 1. The paper's own table (§8.2) shows this over ℚ for the good pairs G = A_4, G′ = ((C_2⁴)⋊C_3)⋊C_2 and G = A_5, G′ = A_5 ≀ C_2, both with H_2(G′,c) = C_2.

**Correction.** Take u a generator of μ_L. This is the analogue of u_q ∈ Ẑ(1)^× in Theorem 4.8. Evaluation at a generator identifies the homomorphism-valued invariant with H_2(G′,c)[|μ_Q|], so each h is then predicted to have average 1.

## E8. The order of the trivial semidirect product (misprint)

In Appendix A (p.36), the trivial action of C_3 on C_2 × C_2 is said to give "Gal(L/K) ≃ C_3 × C_3 × C_2", twice. The group is C_2 × C_2 × C_3, of order 12; the printed group has order 18. The argument is unaffected.
