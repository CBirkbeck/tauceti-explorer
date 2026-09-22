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
