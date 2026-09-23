# Mistakes in Dittmann–Pop, *Characterizing finitely generated fields by a single field axiom*

Job ERRATA-PAPER-DITTMANN-POP-23. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-DITTMANN-POP-23.json` beside this file.

**Paper and version read.** Philip Dittmann and Florian Pop, Annals of Mathematics 198 (2023), 1203–1227, DOI 10.4007/annals.2023.198.3.4. The version read is arXiv 2012.01307v2, the final author version of 27 April 2023 (SHA-256 `f9f26f7d…2c1f`), as by the extraction. Every passage below was re-read there. The published text was not collated.

**Earlier work.** The extraction PAPER-DITTMANN-POP-23 (partial) noted all four. It also cautioned about the stabilizer equality in Theorem 4.2(1). That caution is not a mistake: the paper proves the nontrivial inclusion by weak approximation over the finite set V_a, exactly as needed.

**Existing corrections.** None was found:
- the Annals page links no erratum;
- arXiv v2 is the latest version;
- a web search found nothing.

**Effect.** None of these affects the main theorems. They are notational slips, a sign, and one unargued choice.

## E1. Characteristic-2 Pfister forms (misprint)

§3 defines ⟨⟨a⟩⟩ = x₁² − a x₂² and, in characteristic 2, q_a = ⟨⟨a_i⟩⟩ ⊗ … ⊗ ⟨⟨a₁⟩⟩ ⊗ ⟨⟨a₀]], citing [EKM, 9.B]. In characteristic 2 quadratic forms cannot be tensored, and x₁² − a x₂² is totally singular. Following [EKM, 9.B], the factors ⟨⟨a_j⟩⟩ for j ≥ 1 must be the bilinear Pfister forms ⟨1, −a_j⟩_b, acting on the quadratic form ⟨⟨a₀]]. That gives the nonsingular quadratic Pfister form of dimension 2^{i+1} used in the paper.

## E2. A sign in the proof of Claim 1 (misprint)

In the proof of Proposition 3.10, a_i = u_i² − u_i − ε_i is written as u_i² a′_i with "a′_i = 1 − 1/u_i + ε_i/u_i²". The last sign should be minus. Since w̃(u_i) < 0 and w̃(ε_i) = 0, a′_i is a principal w̃-unit with either sign, so the argument stands.

## E3. W_T used for two different sets (misprint)

On p. 16, W_T is the set of rank-one geometric prime divisors w with T ⊂ O_w. In the characteristic-zero case of the proof of Proposition 5.1, the paper introduces the full-rank geometric flags D^e_{K|κ}, whose residue fields are finite over κ. It then defines V_T = {v ∘ w : w ∈ W_T, v ∈ P_fin(κw)}, and Lemma 5.3 again takes "w ∈ W_T" with Kw a number field. Here W_T must mean the flags w ∈ D^e_{K|κ} with T ⊂ O_w: for a rank-one divisor, κw has transcendence degree e − 1 and has no finite primes in the needed sense.

## E4. The torus in the proof of Lemma 5.3 (gap)

The proof chooses ζ over κv^alg with ḡ(ζ) ≠ 0 and then says "ζ is an e-tuple of roots of unity". That requires every coordinate of ζ to be nonzero. Such a ζ exists, because a nonzero polynomial has non-roots on the torus over an infinite field, but the proof should choose it there.

## Added by the review REV-ERRATA-PAPER-DITTMANN-POP-23

The independent review (Claude Code, session `cc-442dc5`, 23 September 2026) confirmed E1–E4. Reading the rest of the same arXiv v2 text, it added eight further slips. All eight are local, none affects a result, and each has its review verdict in the JSON.

## E5. k for k₁ on p. 4 (misprint)

The paragraph before Fact 2.1 speaks of "the completion of k at v" and "the real closure of k at v" for a place v of the global field k₁. No field k is in play there; both should read k₁.

## E6. The degree of the residue map ∂ₓ (misprint)

On p. 4 the residue map attached to x ∈ X¹ is written ∂ₓ : H^{i+1}(K) → H^d(κ(x)). It is the component of the first map of the Bloch–Ogus complex, which goes from H^{d+1}(K); the index i has no meaning there. It should read H^{d+1}(K).

## E7. The field K_v̂ (misprint)

On p. 4 the paper sets K_v̂ := K k₁v̂ := Quot(K ⊗_{k₁} k₁v). As printed this is the compositum with the henselization, which is the field K_v introduced in the next sentence as a subfield of K_v̂. With the hat restored, Quot(K ⊗_{k₁} k₁v̂) is the compositum with the completion, which is what the notation and Jannsen's theorem (F_v in [Ja]) require. The tensor product is still a domain, because K ⊗ k₁v is the field K k₁v and the completion is regular over k₁v.

## E8. Kw for Fw (misprint)

In the proof of Proposition 3.2 the special fibre is called "the projective smooth Kw-variety V_{q_ε̄} ↪ P^N_{Fw}". The field of the proposition is F, so this is the Fw-variety, as the ambient P^N_{Fw} in the same sentence shows.

## E9. A cohomological-dimension chain (gap)

In Case 2 of Proposition 3.2, 3), the proof bounds cd(E′_{v′}) ⩽ cd(E′) ⩽ dim(E′) + 1 for a non-real place v′. The middle inequality fails when E′ is formally real, because a field with an ordering has infinite 2-cohomological dimension. That case can occur, since k′ may have real places; the second half of the proof exists to handle them.

The needed bound holds directly. For a non-real place, k′_{v′} has 2-cohomological dimension at most 2, and E′_{v′} has transcendence degree dim(E′) − 1 over it. So Serre's inequality gives cd₂(E′_{v′}) ⩽ dim(E′) + 1, and the conclusion H^{r+1}(E′_{v′}) = 0 stands.

## E10. "Neighbourhood of q_a" (misprint)

The proof of Lemma 3.9, 2) says that V_a "contains the neighborhood V_{E|F} of q_a". V_{E|F} is a set of valuations containing w, so it should read "of w".

## E11. D_{K|k_a} for D_{K|k_t} (misprint)

Twice on p. 14 the set of prime divisors is written D_{K|k_a}: in Notations/Remarks 4.1, 2) and in the proof of Theorem 4.2, 1). The set defined, and used in 4.1, 5), is D_{K|k_t}, the prime divisors trivial on the relative algebraic closure k_t of k₁(t).

## E12. Three page ranges in the bibliography (misprint)

Three page ranges are wrong, according to their Crossref records:
- [Du]: "808–923" should be 808–823.
- [Ka]: "493–51" should be 493–510.
- [P1]: "385–308" should be 385–408.
