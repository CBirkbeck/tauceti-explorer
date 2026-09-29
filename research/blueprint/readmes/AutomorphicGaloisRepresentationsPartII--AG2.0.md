# Automorphic Galois Representations, Part II: stages AG2.0–AG2.5

## Purpose

This document plans part AG2.0 of the roadmap `AutomorphicGaloisRepresentationsPartII`: the Galois representations attached to regular algebraic automorphic representations of GL_n over CM and totally real fields, from the normalisation dictionary (AG2.0) through the polarized and non-self-dual constructions (AG2.1–AG2.4) to local–global compatibility away from the coefficient prime (AG2.5). Stages AG2.6–AG2.7 are the second part (job BP-AutomorphicGaloisRepresentationsPartII--AG2.6).

It is the first checkpoint. It builds on the reviewed decomposition (Harris–Lan–Taylor–Thorne, Chenevier–Harris, Varma, Caraiani, ACC+) and plans AG2.0 at declaration level from:

- Barnet-Lamb–Gee–Geraghty–Taylor, *Potential automorphy and change of weight* (arXiv v4), §2.1 and Appendix A.2;
- Allen et al. (ACC+), *Potential automorphy over CM fields* (Annals 197), §§1, 2.2.5, 2.3 and 7.1;
- Patrikis, *On the sign of regular algebraic polarizable automorphic representations* (arXiv v2), §2.

## Scope and boundaries

- RS-12 (the restructure of this family) is not accepted; the current structure is used.
- Automorphic representations, infinitesimal characters, algebraic weights Ξ_a, the C/L-algebraic distinction and Clozel's rationality theorem are AutomorphicFormsOnReductiveGroups AF.1/AF.4.
- The unitary Satake normalisation is IntegralHeckeAndGaloisDeterminants IHG.3.
- The local Langlands correspondence rec is EndoscopicTransferAndUnitaryTraceComparison ET.6. Arthur–Clozel base change is exported by ET.7.
- Hecke characters, infinity types and global reciprocity are Tau Ceti's GlobalNumberFields (layers 9–10) and ClassFieldTheory (layer 11).
- The group 𝒢_n is GlobalGaloisDeformations G7.
- AG2.0 uses no local Langlands correspondence. Its Frobenius dictionary is a polynomial identity at unramified places, and the agreement with rec(π_v ⊗ |det|^{(1−n)/2}) is AG2.5 material.

## Conventions

As in BLGGT and ACC+:

- Art_K sends uniformisers to geometric Frobenius elements, and Frob_v is a geometric Frobenius.
- rec is Harris–Taylor's correspondence.
- HT_τ(ε_l) = {−1}, so r_{l,ι}(‖·‖) = ε_l.
- A regular algebraic π has weight a if π_∞ has the infinitesimal character of Ξ_a^∨.
- The Hecke polynomial P_v(X) = Σ(−1)^i q_v^{i(i−1)/2} T_{v,i} X^{n−i} is the characteristic polynomial of r_{l,ι}(π)(Frob_v) for geometric Frobenius.

IntegralHeckeAndGaloisDeterminants IHG.3 and the R19 roadmap read the same polynomial on arithmetic Frobenius. The two conventions exchange r and r^∨, so for a classical newform f, r_{l,ι}(π_f ⊗ ‖det‖^{1−k/2}) ≅ ρ_f^∨.

For a polarized pair (π, χ) of weight a ∈ (ℤⁿ)_w over an imaginary CM field, the totally odd normalisation is χ_v(−1) = (−1)^{n+w}. BLGGT print (−1)^n (sourceIssues E1, E2).

## AG2.0 Algebraic weights, fields of rationality and normalization

### Objects

#### Definition. Dominant weights (ℤⁿ)^{Hom(F,Ω),+}, the subsets (ℤⁿ)_w for CM fields, base change of weights and the representations Ξ_a

*Module* `TauCeti/AutomorphicGalois/Weights.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`.

Let F be a number field, n ≥ 1 and Ω an algebraically closed field of characteristic 0. (ℤⁿ)^{Hom(F,Ω),+} is the set of a = (a_{τ,i}) with τ ∈ Hom(F, Ω), 1 ≤ i ≤ n and a_{τ,1} ≥ ⋯ ≥ a_{τ,n}. If F is totally real or CM, with complex conjugation c, and w ∈ ℤ, then (ℤⁿ)^{Hom(F,Ω)}_w is the set of a with a_{τ,i} + a_{τ∘c,n+1−i} = w for all τ and i (for Ω = ℂ this is the same as a_{τ,i} + a_{c∘τ,n+1−i} = w). For a finite extension F′/F, a_{F′} is given by (a_{F′})_{τ,i} = a_{τ|_F,i}. The weight a is extremely regular if for some τ, any two subsets H, H′ of {a_{τ,i} + n − i} of the same cardinality with equal sums are equal. For a ∈ (ℤⁿ)^{Hom(F,ℂ),+}, Ξ_a is the irreducible algebraic representation of GL_n^{Hom(F,ℂ)} that is the tensor product over τ of the irreducible representations of GL_n with highest weight a_τ.

*Hypotheses.*

- Dominance is the ordering a_{τ,1} ≥ ⋯ ≥ a_{τ,n}, with repetitions allowed; regularity of the attached Hodge–Tate numbers comes from the shift by n − i (node expected-hodge-tate-multiset), not from strictness of a.
- The condition defining (ℤⁿ)_w pairs τ with τ∘c and i with n + 1 − i. It is empty unless F is totally real or CM.
- Ξ_a is a representation of the complex group GL_n^{Hom(F,ℂ)} = (Res_{F/ℚ} GL_n)_ℂ. Its highest-weight theory is supplied by AutomorphicFormsOnReductiveGroups AF.4 (algebraic highest weights).

*API.*

- `DominantWeight` (*data*) — DominantWeight n ι := ι → {a : Fin n → ℤ // Antitone a}, indexed by the embeddings ι.
- `DominantWeight.IsInW` (*data*) — a.IsInW c w :⇔ ∀ τ i, a τ i + a (c τ) (rev i) = w, for an involution c of ι.
- `DominantWeight.baseChange` (*constructor*) — (a.baseChange f) τ′ = a (f τ′) for the restriction f: Hom(F′, Ω) → Hom(F, Ω).
- `DominantWeight.IsExtremelyRegular` (*data*) — Some τ has no two distinct equal-size subsets of {a τ i + n − 1 − i} with equal sums.
- `DominantWeight.xi` (*constructor*) — Ξ_a = ⊗_τ (irreducible algebraic representation of GL_n with highest weight a_τ), from AF.4.
- `DominantWeight.isInW_baseChange` (*compatibility*) — a ∈ (ℤⁿ)_w implies a_{F′} ∈ (ℤⁿ)_w when F′ ⊇ F is CM or totally real.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight` — the weight a of a regular algebraic π, through Ξ_a^∨
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset` — HT_τ = {a_{ιτ,i} + n − i}
- `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier` — the integer w with a ∈ (ℤⁿ)_w decides the parity condition on χ

*Unit tests.* A wrong definition fails one of these.

- `DominantWeight.isInW_classical` (value) — For F = ℚ, n = 2 and a = (k − 2, 0): a is dominant and lies in (ℤ²)_{k−2}.
- `DominantWeight.isInW_rank_one` (degenerate) — For n = 1 every a ∈ ℤ^{Hom(F,ℂ)} is dominant, and a ∈ (ℤ¹)_w iff a_τ + a_{cτ} = w for all τ.
- `DominantWeight.not_isInW_unpaired` (non-example) — For F imaginary quadratic, n = 2, a_τ = (1, 0) and a_{cτ} = (0, 0): a_{τ,1} + a_{cτ,2} = 1 but a_{τ,2} + a_{cτ,1} = 0, so a lies in no (ℤ²)_w.
- `DominantWeight.not_dominant` (non-example) — (0, 1) is not dominant: a definition with a_{τ,1} ≤ ⋯ ≤ a_{τ,n} would accept it.

*Construction.*

1. Well-definedness: dominance and membership in (ℤⁿ)_w are finitely many linear conditions on the integers a_{τ,i}.
2. The two forms of the (ℤⁿ)_w condition agree for Ω = ℂ because, for F totally real or CM, τ∘c = c∘τ for every τ: F → ℂ (Mathlib's NumberField.IsCMField.complexEmbedding_complexConj).
3. a_{F′} is dominant, and lies in (ℤⁿ)_w for the same w when F′ is again totally real or CM and a ∈ (ℤⁿ)_w, since complex conjugation on F′ restricts to that of F.

*Acceptance.*

- The classical weight-k form gives a = (k − 2, 0) at the single embedding of ℚ, which lies in (ℤ²)_{k−2}.
- For F imaginary quadratic and n = 1, a = (a_τ, a_{cτ}) lies in (ℤ¹)_w with w = a_τ + a_{cτ}; w can be odd, e.g. (1, 0), the weight of the Hecke character of a CM elliptic curve.

*Uses.* `mathlib:NumberField.IsCMField.complexEmbedding_complexConj`, `AutomorphicFormsOnReductiveGroups:AF.4`.

*Sources.*

- Potential automorphy and change of weight, §2.1, p. 32: “If Ω is an algebraically closed field of characteristic 0 we will write (Zn)Hom (F,Ω),+ for the set of a = (aτ,i) ∈(Zn)Hom (F,Ω) satisfying aτ,1 ≥· · · ≥aτ,n.” Dominant weights, verbatim from the text layer (superscripts flattened).
- Potential automorphy and change of weight, §2.1, p. 32: “We will call a extremely regular if for some τ the aτ,i have the following property:” Extremely regular weights; the definition continues on the same page.

#### Definition. Regular algebraic automorphic representations of GL_n(𝔸_F) and their weight

*Module* `TauCeti/AutomorphicGalois/RegularAlgebraic.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`.

Let F be a number field and π an automorphic representation of GL_n(𝔸_F). π is regular algebraic if π_∞ has the same infinitesimal character as an irreducible algebraic representation of Res_{F/ℚ} GL_n. It has weight a ∈ (ℤⁿ)^{Hom(F,ℂ),+} if π_∞ has the same infinitesimal character as Ξ_a^∨. A regular algebraic π has a unique weight. Twisting: if ψ is an algebraic Hecke character of F with ψ|_{(F_∞^×)⁰}(x) = ∏_τ τ(x)^{−b_τ}, then π ⊗ (ψ∘det) has weight (a_{τ,i} + b_τ). In particular π ⊗ ‖det‖^t (t ∈ ℤ) has weight (a_{τ,i} − t).

*Hypotheses.*

- The infinitesimal character is compared with that of Ξ_a^∨, not Ξ_a; this is the convention of both BLGGT and ACC+.
- Regular algebraic is Clozel's C-algebraic for GL_n. It differs from L-algebraic by the twist ‖det‖^{(n−1)/2} when n is even. The C/L distinction is owned by AutomorphicFormsOnReductiveGroups AF.4 and is not re-planned here.
- No cuspidality, self-duality or unitarity is part of the definition.

*API.*

- `IsRegularAlgebraic` (*data*) — π.IsRegularAlgebraic :⇔ ∃ a, π.HasWeight a.
- `HasWeight` (*data*) — π.HasWeight a :⇔ infChar π_∞ = infChar (Ξ_a)^∨.
- `HasWeight.unique` (*characterisation*) — π.HasWeight a → π.HasWeight b → a = b.
- `HasWeight.twist` (*compatibility*) — π.HasWeight a → (π ⊗ ψ∘det).HasWeight (a + b) for ψ algebraic of exponents (b_τ).
- `HasWeight.twist_norm` (*simp*) — (π ⊗ ‖det‖^t).HasWeight (a − t) ↔ π.HasWeight a.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation` — a polarized pair is regular algebraic of some weight a ∈ (ℤⁿ)_w
- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places` — the class of π to which Galois representations are attached
- `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality` — rationality is proved for regular algebraic cuspidal π

*Unit tests.* A wrong definition fails one of these.

- `hasWeight_heckeCharacter` (value) — n = 1: ψ with ψ_∞(x) = ∏ τ(x)^{−a_τ} on (F_∞^×)⁰ has weight (a_τ).
- `hasWeight_classical` (value) — π_f ⊗ ‖det‖^{1−k/2} has weight (k − 2, 0) for a weight-k newform f.
- `not_isRegularAlgebraic_odd_weight_unitary` (non-example) — π_f with f of odd weight k is not regular algebraic: its infinitesimal character (±(k − 1)/2) is not a shifted integral weight.
- `hasWeight_trivial` (degenerate) — The trivial representation of GL_1(𝔸_F) has weight 0.

*Construction.*

1. Well-definedness of the weight: the infinitesimal character of Ξ_a^∨ is the W-orbit of −w₀a + ρ at each τ, and these orbits determine a (AF.4's Harish-Chandra parametrisation).
2. Twisting: the infinitesimal character of π_∞ ⊗ (ψ_∞∘det) is that of π_∞ shifted by the exponents of ψ_∞, and Ξ_a^∨ ⊗ ∏_τ τ(det)^{−b_τ} = Ξ_{a+b}^∨. For ψ = ‖·‖^t, the identity-component exponents are b_τ = −t, since ‖x‖ = ∏_τ |τ(x)| on (F_∞^×)⁰.

*Acceptance.*

- n = 1: an algebraic Hecke character ψ with ψ|_{(F_∞^×)⁰}(x) = ∏ τ(x)^{−a_τ} is regular algebraic of weight (a_τ).
- n = 2, F = ℚ: for a newform f of weight k, the automorphic representation π_f (unitary normalisation) is not regular algebraic when k is odd, but π_f ⊗ ‖det‖^{1−k/2} is, of weight (k − 2, 0).

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`, `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicFormsOnReductiveGroups:AF.4`.

*Planet:* Regular algebraic automorphic representation.

*Sources.*

- Potential automorphy and change of weight, §2.1, p. 32: “If F is a number field and π is an automorphic representation of GLn(AF ) we will call π regular algebraic if π∞has the same infinitesimal character as an irreducible algebraic representation of the restriction of scalars from F to Q of GLn.” The definition of regular algebraic.
- Potential automorphy over CM fields, §1, Notation, p. 908: “we say that π is regular algebraic of weight ξ if the infinitesimal character of π∞is the same as that of V ∨ ξ” ACC+ use the same Ξ^∨ convention for the weight.

#### Definition. Conjugate self-dual, essentially conjugate self-dual and polarized automorphic representations, with the multiplier character

*Module* `TauCeti/AutomorphicGalois/Polarized.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`.

Let F be totally real or CM with maximal totally real subfield F⁺ and complex conjugation c, and π an automorphic representation of GL_n(𝔸_F). (i) π is conjugate self-dual if π^c ≅ π^∨. (ii) π is essentially conjugate self-dual with multiplier χ if χ: 𝔸_{F⁺}^×/(F⁺)^× → ℂ^× is continuous and π^c ≅ π^∨ ⊗ (χ ∘ N_{F/F⁺} ∘ det). (iii) (π, χ) is a polarized automorphic representation if moreover χ_v(−1) is independent of v | ∞. (iv) π is polarizable if some (π, χ) is polarized. (v) A regular algebraic polarized (π, χ) of weight a ∈ (ℤⁿ)_w with F imaginary is totally odd if χ_v(−1) = (−1)^{n+w} for all v | ∞. Here π^c = π ∘ c on GL_n(𝔸_F), and π^c = π when F is totally real.

*Hypotheses.*

- The multiplier χ is part of the data. It is determined by π only up to δ_{F/F⁺}, since δ_{F/F⁺} ∘ N_{F/F⁺} = 1.
- BLGGT impose instead χ_v(−1) = (−1)^n for F imaginary (printed with µ in place of χ). That is the correct normalisation only when w is even; with odd w it makes the Galois multiplier even (sourceIssue AutomorphicGaloisRepresentationsPartII/E2; node sign-of-the-polarization-multiplier). Condition (v) is the corrected form, and like BLGGT's it can always be achieved by replacing χ by χδ_{F/F⁺}.
- For regular algebraic (π, χ) of weight a ∈ (ℤⁿ)_w, χ is algebraic with |χ| = ‖·‖^{−w}. Conjugate self-duality is the case χ = 1, possible only when w = 0.
- For F totally real, polarized means essentially self-dual with χ_v(−1) independent of v. Patrikis shows the independence is automatic for regular algebraic cuspidal π; this packet does not use that.

*API.*

- `IsConjSelfDual` (*data*) — π.IsConjSelfDual :⇔ π^c ≅ π^∨.
- `IsEssConjSelfDual` (*data*) — π.IsEssConjSelfDual χ :⇔ π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det).
- `PolarizedAutRep` (*structure*) — A pair (π, χ) with IsEssConjSelfDual and v ↦ χ_v(−1) constant on the real places.
- `PolarizedAutRep.twistDelta` (*constructor*) — (π, χ) ↦ (π, χ δ_{F/F⁺}), again polarized.
- `PolarizedAutRep.IsTotallyOdd` (*data*) — For regular algebraic (π, χ) of weight in (ℤⁿ)_w: χ_v(−1) = (−1)^{n+w} for v | ∞.
- `PolarizedAutRep.exists_totallyOdd` (*characterisation*) — Exactly one of (π, χ), (π, χδ_{F/F⁺}) is totally odd when F is imaginary.
- `PolarizedAutRep.weight_mem_W` (*relation*) — A regular algebraic polarized pair has weight in (ℤⁿ)_w with |χ| = ‖·‖^{−w}.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier` — the parity of χ_v(−1) against n + w
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation` — (r_{l,ι}(π), ε^{1−n} r_{l,ι}(χ)) is the expected polarized Galois pair
- `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris` — the input class of the polarized construction

*Unit tests.* A wrong definition fails one of these.

- `polarized_heckeCharacter_cm` (value) — n = 1, ψ of weight (1, 0) over an imaginary quadratic field: (ψ, ψ|_{𝔸_ℚ}δ) is totally odd; (ψ, ψ|_{𝔸_ℚ}) is not.
- `isConjSelfDual_iff_multiplier_one` (degenerate) — π.IsConjSelfDual ↔ π.IsEssConjSelfDual 1.
- `polarized_totallyReal` (compatibility) — For F totally real, π^c = π and polarized means essentially self-dual with χ_v(−1) independent of v.
- `not_totallyOdd_blggt_sign_odd_w` (non-example) — A pair satisfying BLGGT's printed χ_v(−1) = (−1)^n with w odd (the CM elliptic curve character) is not totally odd: its Galois multiplier takes c_v to +1.

*Construction.*

1. Well-definedness: π^c and π^∨ ⊗ (χ ∘ N ∘ det) are automorphic representations, so the condition is an isomorphism class condition; χ_v(−1) makes sense since −1 ∈ (F⁺_v)^× at every real place v.
2. Weight constraint: comparing the infinitesimal characters of π^c (weight (a_{τc,i})) and π^∨ ⊗ (χ∘N∘det) (weight (−a_{τ,n+1−i} + b)), where χ has parallel exponent b, gives a_{τc,i} + a_{τ,n+1−i} = b. So a ∈ (ℤⁿ)_b and w = b, and |χ| = ‖·‖^{−w}.
3. Normalisation: χ and χδ_{F/F⁺} give the same condition (ii), and δ_{F/F⁺,v}(−1) = −1 at every real place v when F is imaginary. So exactly one of them satisfies (v).

*Acceptance.*

- n = 1, F imaginary quadratic, ψ the Hecke character of a CM elliptic curve (weight (1, 0), w = 1): ψψ^c = ψ|_{𝔸_{F⁺}} ∘ N, and (ψ, ψ|_{𝔸_ℚ}) satisfies BLGGT's printed condition while (ψ, ψ|_{𝔸_ℚ} δ) is totally odd.
- Base change of a weight-k newform to an imaginary quadratic field: π^c ≅ π and π^∨ ≅ π ⊗ ω_π^{−1}, so π is essentially conjugate self-dual with multiplier the central character of the form (twisted as needed), and w = k − 2.

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`.

*Planet:* Polarized automorphic representation.

*Sources.*

- Potential automorphy and change of weight, §2.1, p. 32: “By a polarized automorphic representation of GLn(AF ) we mean a pair (π, χ) where” The three conditions of a polarized pair follow on the same page.
- Potential automorphy and change of weight, §2.1, p. 32: “In the case that F is imaginary we further suppose that µv(−1) = (−1)n for all v|∞.” BLGGT's sign normalisation, with µ printed for χ (sourceIssue E1); corrected in (v) (E2).
- Construction of automorphic Galois representations, II, Hypotheses 4.1(ii), p. 13: “(Polarization) There is a Hecke character χ : A× F /F × →C× with χv(−1) independent of the prime v | ∞” Chenevier–Harris's polarization over a totally real field, with the same independence condition.

#### Definition. Polarized, totally odd and regular algebraic l-adic representations (r, µ)

*Module* `TauCeti/AutomorphicGalois/PolarizedRep.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`.

Let F be CM or totally real, l a prime and ι: Q̄_l ≅ ℂ. A polarized l-adic representation of G_F is a pair (r, µ) of continuous homomorphisms r: G_F → GL_n(Q̄_l) and µ: G_{F⁺} → Q̄_l^× such that for some infinite place v of F⁺ there are ε_v ∈ {±1} and a non-degenerate pairing ⟨ , ⟩_v on Q̄_lⁿ with ⟨x, y⟩_v = ε_v⟨y, x⟩_v and ⟨r(σ)x, r(c_v σ c_v)y⟩_v = µ(σ)⟨x, y⟩_v for all σ ∈ G_F; if F is imaginary one requires ε_v = −µ(c_v). (r, µ) is totally odd if ε_v = 1 for all v | ∞, equivalently µ(c_v) = −1 for all v | ∞ when F is imaginary. (r, µ) is algebraic if r is unramified at almost all primes and de Rham above l, and regular algebraic if moreover HT_τ(r) has n distinct elements for every τ: F → Q̄_l. The same definitions apply mod l.

*Hypotheses.*

- The condition at one infinite place implies it at all of them, with ε_{v′} = µ(c_v c_{v′})ε_v and ⟨x, y⟩_{v′} = ⟨x, r(c_v c_{v′}) y⟩_v.
- For F imaginary, (r, µ) is polarized if and only if r extends to r̃: G_{F⁺} → 𝒢_n(Q̄_l) with multiplier µ, where 𝒢_n is the group of Clozel–Harris–Taylor (GlobalGaloisDeformations:G7/polarized-deformation-problem).
- For F totally real, (r, µ) is polarized if and only if r factors through GSp_n (µ(c_v) = −ε_v) or GO_n (µ(c_v) = ε_v) with multiplier µ.
- Hodge–Tate numbers use BLGGT's convention HT_τ(ε_l) = {−1}.

*API.*

- `PolarizedRep` (*structure*) — (r, µ) with a pairing ⟨ , ⟩_v at one real place satisfying the BLGGT identity.
- `PolarizedRep.sign` (*projection*) — ε_v ∈ {±1}, and ε_{v′} = µ(c_v c_{v′}) ε_v.
- `PolarizedRep.IsTotallyOdd` (*data*) — ε_v = 1 for all v | ∞.
- `PolarizedRep.isTotallyOdd_iff` (*characterisation*) — For F imaginary: IsTotallyOdd ↔ ∀ v | ∞, µ(c_v) = −1.
- `PolarizedRep.equivGn` (*equivalence*) — For F imaginary: polarized pairs ≃ 𝒢_n(Q̄_l)-valued extensions of r to G_{F⁺} with multiplier µ.
- `PolarizedRep.IsRegularAlgebraic` (*data*) — Unramified almost everywhere, de Rham above l, and |HT_τ(r)| = n for all τ.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier` — totally odd means µ(c_v) = −1
- `AutomorphicGaloisRepresentationsPartII:AG2.2` — the polarized branch's Galois output (BLGGT Theorem 2.1.1(1))
- `GlobalGaloisDeformations:G7/polarized-deformation-problem` — lifts of r̄ to 𝒢_n with multiplier µ

*Unit tests.* A wrong definition fails one of these.

- `polarizedRep_rank_one` (value) — n = 1, F imaginary: (r, µ) polarized ⇒ µ(c_v) = −1 (a pairing on a line is symmetric).
- `polarizedRep_restriction_odd` (compatibility) — For ρ: G_ℚ → GL_2 odd and F imaginary quadratic, (ρ|_{G_F}, det ρ) is totally odd.
- `not_polarized_even_multiplier_rank_one` (non-example) — n = 1, F imaginary: (r, µ) with µ(c) = +1 is not polarized, although r^c = r^{−1}µ|_{G_F}.
- `polarizedRep_totallyReal` (degenerate) — F totally real, n = 2: (ρ, det ρ) is polarized (symplectic) for any ρ, since det(x, y) is alternating.

*Construction.*

1. Well-definedness: the pairing condition is a closed condition on (r, µ), and the change of place v ↦ v′ is the computation quoted in the hypotheses.
2. Equivalence with 𝒢_n-valued extensions (F imaginary), BLGGT's second remark in §2.1: r̃(c_v) = (A, a)·j, where A is determined by the Gram matrix of ⟨ , ⟩_v and ν(r̃(c_v)) = −a = µ(c_v), so a = ε_v. Conversely, a pairing is read off from r̃(c_v). (For n = 1, r̃(c)² = 1 forces a = 1, i.e. µ(c) = −1.)

*Acceptance.*

- n = 1, F imaginary: a character r with r^c = r^{−1}µ|_{G_F} is polarized with multiplier µ if and only if µ(c_v) = −1, since a non-degenerate pairing on a line is symmetric (ε_v = 1).
- n = 2, F imaginary quadratic, r = ρ|_{G_F} for an odd ρ: G_ℚ → GL_2(Q̄_l): (r, det ρ) is totally odd, via the pairing ⟨x, y⟩ = det(x, ρ(c)y).

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`, `GlobalGaloisDeformations:G7/polarized-deformation-problem`, `ArithmeticGaloisRepresentations:R01.1`.

*Planet:* Polarized Galois representation.

*Sources.*

- Potential automorphy and change of weight, §2.1, p. 31: “In the case that F is imaginary we further require that εv = −µ(cv).” The sign convention linking ε_v and µ(c_v).
- Potential automorphy and change of weight, §2.1, p. 31: “We will call (r, µ) (resp. (r, µ)) totally odd if εv = 1 for all v|∞.” Totally odd.

#### Construction. The l-adic character r_{l,ι}(χ) of an algebraic Hecke character, its Hodge–Tate numbers and its weight

*Module* `TauCeti/AutomorphicGalois/HeckeCharacter.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.

Let F be a number field, l a prime and ι: Q̄_l ≅ ℂ, with Art_F normalised to send uniformisers to geometric Frobenius elements. Let χ: 𝔸_F^×/F^× → ℂ^× be algebraic: χ|_{(F_∞^×)⁰}(x) = ∏_{τ ∈ Hom(F,ℂ)} τ(x)^{−a_τ} with a_τ ∈ ℤ. There is a unique continuous character r_{l,ι}(χ): G_F → Q̄_l^× with ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v for all v ∤ l; explicitly ι((r_{l,ι}(χ) ∘ Art_F)(x) ∏_τ (ι^{−1}τ)(x_l)^{a_τ}) = χ(x) ∏_τ (τ x_∞)^{a_τ}. It is de Rham above l with HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}. The weight wt(χ) is the integer with |χ| = ‖·‖^{−wt(χ)/2}. Then a_τ + a_{τ′} = wt(χ) whenever τ|_{F₀} = τ′|_{F₀} ∘ c (F₀ the maximal CM subfield), wt(χ) is even when F₀ is totally real, wt(‖·‖_F) = −2, r_{l,ι}(‖·‖) = ε_l, and r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2} at every real place v when F is totally real.

*Hypotheses.*

- The normalisation of Art_F (uniformisers ↦ geometric Frobenius) fixes r_{l,ι}(‖·‖) = ε_l. With the arithmetic normalisation it would be ε_l^{−1}.
- HT_τ(ε_l) = {−1} in this convention, consistent with HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}} and a = −1 for ‖·‖ over ℚ.
- The value at complex conjugation is computed at real places only: at a complex place there is no c_v in G_F.

*API.*

- `AlgHeckeChar.galoisChar` (*constructor*) — r_{l,ι}(χ): G_F → Q̄_l^× for an algebraic Hecke character χ.
- `AlgHeckeChar.galoisChar_local` (*characterisation*) — ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v for v ∤ l.
- `AlgHeckeChar.hodgeTate_galoisChar` (*characterisation*) — HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}.
- `AlgHeckeChar.wt` (*data*) — wt(χ) ∈ ℤ with |χ| = ‖·‖^{−wt(χ)/2}.
- `AlgHeckeChar.galoisChar_mul` (*simp*) — r_{l,ι}(χ₁χ₂) = r_{l,ι}(χ₁) r_{l,ι}(χ₂).
- `AlgHeckeChar.galoisChar_norm` (*simp*) — r_{l,ι}(‖·‖_F) = ε_l.
- `AlgHeckeChar.galoisChar_complexConj` (*relation*) — For F totally real: r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2}.
- `AlgHeckeChar.galoisChar_restrict` (*functoriality*) — r_{l,ι}(χ|_{𝔸_{F⁺}^×}) = r_{l,ι}(χ) ∘ V, V: G_{F⁺}^{ab} → G_F^{ab} the transfer.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier` — the value of r_{l,ι}(χ) at complex conjugation
- `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions` — the n = 1 case of the Frobenius dictionary
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation` — the multiplier ε_l^{1−n} r_{l,ι}(χ)

*Unit tests.* A wrong definition fails one of these.

- `galoisChar_norm_rat` (value) — F = ℚ: r_{l,ι}(‖·‖) = ε_l, with HT {−1} and wt −2.
- `galoisChar_trivial` (degenerate) — r_{l,ι}(1) = 1, with a = 0 and wt 0.
- `galoisChar_finite_order` (compatibility) — For ω of finite order unramified at p ∤ l: r_{l,ι}(ω)(Frob_p^{geom}) = ω_p(p), and r_{l,ι}(ω)(Frob_p^{arith}) = ω_p(p)^{−1}.
- `galoisChar_restrict_complexConj` (non-example) — For F imaginary and ψ algebraic on F, r_{l,ι}(ψ|_{𝔸_{F⁺}})(c_v) = +1 because the transfer sends c_v to c_v² = 1, whatever ψ_v(−1) is: the Galois sign is not χ_v(−1) unless wt/2 is even.

*Construction.*

1. The displayed formula defines a continuous character of 𝔸_F^×/F^×(F_∞^×)⁰ with values in Q̄_l^× (the correction factor at l cancels χ_∞ on F^×). Global Artin reciprocity (Tau Ceti ClassFieldTheory, layer 11) turns it into r_{l,ι}(χ).
2. Local compatibility at v ∤ l is immediate from the formula. Uniqueness follows from Čebotarev density of the unramified Frobenius elements.
3. Hodge–Tate numbers: on an open subgroup of O_{F_v}^× (v | l), r ∘ Art is ∏_τ τ^{−a_τ}, a Lubin–Tate character product, whose τ-Hodge–Tate number is a_{ι∘τ} (Serre, Abelian l-adic representations).
4. Weight: |χ| = ‖·‖^{−wt/2} and the unit theorem give a_τ + a_{τ′} = wt for conjugate pairs; for F₀ totally real all a_τ are equal, so wt = 2a is even.
5. Value at c_v for F totally real: χ = χ₀‖·‖^{−wt/2} with χ₀ of finite order. Then r(χ) = r(χ₀)ε_l^{−wt/2}, r(χ₀)(c_v) = χ_{0,v}(−1) = χ_v(−1) because Art_ℝ(−1) = c, and ε_l(c_v) = −1.

*Acceptance.*

- F = ℚ, χ = ‖·‖: r = ε_l and HT = {−1}, i.e. a = −1 and wt = −2.
- F = ℚ, ω of finite order and unramified at p ∤ l: r_{l,ι}(ω)(Frob_p) = ω_p(p) for the geometric Frobenius, so the arithmetic Frobenius goes to ω_p(p)^{−1}. Which of χ(p)^{±1} this is for a Dirichlet character χ depends on how χ is made idelic, and must be fixed once (GlobalNumberFields layer 9's Dirichlet dictionary).
- The Hecke character ψ of a CM elliptic curve E over its CM field K (weight (1, 0)): r_{l,ι}(ψ) ⊕ r_{l,ι}(ψ^c) is the restriction to G_K of the dual of V_l(E), in this convention.

*Uses.* `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

*Sources.*

- Potential automorphy and change of weight, §A.2, p. 87: “Moreover rl,ı(χ) is de Rham at all primes above l and, if τ : F֒ →Ql then HTτ(rl,ı(χ)) = {aı◦τ}.” The Hodge–Tate numbers of r_{l,ι}(χ).
- Potential automorphy and change of weight, §A.2, p. 87: “(6) if F0 is totally real then wt(χ) is even;” Parity of the weight over a totally real field.
- Potential automorphy and change of weight, Notation, p. 8: “We will write Art K : K× ∼ →W ab K for the Artin map normalized to send uniformizers to geomet- ric Frobenius elements.” The Artin normalisation fixing r_{l,ι}(‖·‖) = ε_l.

#### Definition. The Hodge–Tate multiset attached to a weight: HT_τ = {a_{ιτ,1} + n − 1, …, a_{ιτ,n}}

*Module* `TauCeti/AutomorphicGalois/HodgeTate.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`.

For a ∈ (ℤⁿ)^{Hom(F,ℂ),+}, ι: Q̄_l ≅ ℂ and τ: F → Q̄_l, put HT_τ(a) = {a_{ι∘τ,i} + n − i : 1 ≤ i ≤ n}, a multiset of n integers, in BLGGT's convention HT_τ(ε_l) = {−1}. The elements are distinct, so a Galois representation with these Hodge–Tate numbers is regular. If F is CM and a ∈ (ℤⁿ)_w, then HT_{τ∘c}(a) = {w + n − 1 − h : h ∈ HT_τ(a)}. Twisting a by −t (π ↦ π ⊗ ‖det‖^t) subtracts t from every element, matching ⊗ ε_l^t. In the opposite convention (HT(ε_l) = +1) every element is negated.

*Hypotheses.*

- This is the target that AG2.6 proves for r_{l,ι}(π) (BLGGT Theorem 2.1.1(3), ACC+ Theorem 2.3.3(b)); here it is only the dictionary from a to a multiset.
- The integer w + n − 1 is BLGGT's w in Theorem 2.1.1(3). The two integers must not be confused.

*API.*

- `expectedHodgeTate` (*constructor*) — expectedHodgeTate a = multiset of a i + (n − 1 − i), i : Fin n (0-indexed).
- `expectedHodgeTate_strictAnti` (*characterisation*) — i ↦ a i + (n − 1 − i) is strictly antitone when a is antitone.
- `expectedHodgeTate_conj` (*relation*) — a ∈ (ℤⁿ)_w ⇒ HT at τc is {w + n − 1 − h : h ∈ HT at τ}.
- `expectedHodgeTate_twist` (*simp*) — expectedHodgeTate (a − t) = (expectedHodgeTate a).map (· − t).

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.6` — the labelled Hodge–Tate multiset of the constructed representations
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation` — regular algebraic means |HT_τ| = n

*Unit tests.* A wrong definition fails one of these.

- `expectedHodgeTate_classical` (value) — n = 2, a = (k − 2, 0) ↦ {k − 1, 0}; for k = 12, {11, 0}.
- `expectedHodgeTate_zero` (degenerate) — a = 0 ↦ {n − 1, …, 1, 0}: parallel weight 0 gives the Hodge–Tate numbers of Symⁿ⁻¹ of the dual Tate module of an elliptic curve.
- `expectedHodgeTate_regular` (compatibility) — The elements are pairwise distinct, so the multiset is regular in BLGGT's sense (|HT_τ| = n).
- `not_expectedHodgeTate_unshifted` (non-example) — The unshifted multiset {a_{τ,i}} fails regularity for a = 0 and n ≥ 2, so the shift n − i is part of the definition.

*Construction.*

1. Distinctness: a dominant gives a_{τ,i} + n − i > a_{τ,j} + n − j for i < j.
2. Polarity: a_{τc,i} = w − a_{τ,n+1−i}, so a_{τc,i} + n − i = (w + n − 1) − (a_{τ,n+1−i} + n − (n + 1 − i)).
3. Twist: (a − t)_{τ,i} + n − i = (a_{τ,i} + n − i) − t, and HT(ε_l^t) = {−t}.

*Acceptance.*

- n = 2, a = (k − 2, 0): HT = {k − 1, 0}, the Hodge–Tate numbers of ρ_f^∨ in BLGGT's convention, and of ρ_f in the R19 convention HT(χ_ℓ) = +1 after negation.
- n = 2, a = (0, 0), w = 0: HT = {1, 0} at τ and τc, as for the dual of the Tate module of an elliptic curve in BLGGT's convention (V_l(E) itself has {0, −1}). ACC+ attach Sym^m r_{E,l}^∨ to a π of weight 0.

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`.

*Sources.*

- Potential automorphy and change of weight, Theorem 2.1.1(3), p. 33: “HTτ(rl,ı(π)) = {aıτ,1 + n −1, aıτ,2 + n −2, . . . , aıτ,n}.” The multiset, and after it the polarity HT_{τ∘c} = {w − h}, with BLGGT's w equal to w + n − 1 here.
- Potential automorphy and change of weight, Notation, p. 8: “Thus for example HTτ(ǫl) = {−1}.” The sign convention for Hodge–Tate numbers.
- Potential automorphy over CM fields, Corollary 7.2.4, p. 1100: “there is a regular algebraic, cuspidal, polarizable automorphic representation π of GLm+1(AF ′) of weight (0)τ,i such that” Weight 0 corresponds to Sym^m of the dual Tate module (the test expectedHodgeTate_zero).

#### Construction. The Hecke polynomial P_v(X), its Satake factorisation, and the dictionary of Frobenius conventions and twists

*Module* `TauCeti/AutomorphicGalois/HeckePolynomial.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`.

Let v be a finite place of F with q_v = #k(v), π_v an unramified irreducible representation of GL_n(F_v), and t_{v,i} the eigenvalue on π_v^{GL_n(O_{F_v})} of T_{v,i} = [GL_n(O_{F_v}) diag(ϖ_v, …, ϖ_v, 1, …, 1) GL_n(O_{F_v})] (ϖ_v repeated i times). Define P_v(π_v; X) = Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}. If α₁, …, α_n are the Satake parameters of π_v, with t_{v,i} = q_v^{i(n−i)/2} e_i(α), then P_v(π_v; X) = ∏_j (X − q_v^{(n−1)/2} α_j). Conventions: a Galois representation r corresponds to π at v in the geometric convention (BLGGT, ACC+, HLTT: Frob_v geometric, Art uniformisers ↦ geometric Frobenius) if ι det(X − r(Frob_v)) = P_v(π_v; X). It corresponds in the arithmetic convention (IntegralHeckeAndGaloisDeterminants IHG.3, and R19) if the arithmetic Frobenius has characteristic polynomial P_v(π_v; X). r corresponds in one convention if and only if r^∨ corresponds in the other. Twists: P_v(π_v ⊗ ‖det‖^t; X) = q_v^{−tn} P_v(π_v; q_v^t X), matching r ↦ r ⊗ ε_l^t. The contragredient has roots q_v^{n−1}/β_j, where β_j are the roots for π_v, matching r ↦ r^∨ ⊗ ε_l^{1−n}.

*Hypotheses.*

- The factorisation uses the unitary normalisation of the Satake transform: t_{v,i} = q_v^{i(n−i)/2} e_i(α). With IHG.3's normalised Satake transform this is the input identity (request).
- No local Langlands correspondence is used. For unramified π_v, 'r corresponds at v' is defined by the polynomial identity, which is what AG2.0 requires. Agreement with rec(π_v ⊗ |det|^{(1−n)/2}) for unramified π_v is an AG2.5 comparison.
- ACC+ say P_v corresponds to Frobenius on rec^T(π_v), their arithmetic normalisation of local Langlands (Clozel–Thorne §2.1), with Frob_v geometric in their notation. That is the geometric convention here.

*API.*

- `heckePolynomial` (*constructor*) — P_v(π_v; X) = Σ (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}.
- `heckePolynomial_eq_prod` (*characterisation*) — P_v = ∏ (X − q^{(n−1)/2} α_j) when t_{v,i} = q^{i(n−i)/2} e_i(α).
- `CorrespondsAtGeom` (*data*) — ι det(X − r(Frob_v^{geom})) = P_v(π_v; X).
- `correspondsAtGeom_iff_dual` (*equivalence*) — CorrespondsAtGeom r π_v ↔ CorrespondsAtArith r^∨ π_v.
- `heckePolynomial_twist` (*compatibility*) — P_v(π ⊗ ‖det‖^t; X) = q^{−tn} P_v(π; q^t X), matching ⊗ ε_l^t.
- `heckePolynomial_contragredient` (*compatibility*) — The roots of P_v(π^∨) are q^{n−1}/β_j, matching r^∨ ⊗ ε_l^{1−n}.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places` — the defining identity at good places
- `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources` — the geometric/arithmetic conversion between sources
- `AutomorphicGaloisRepresentationsPartII:AG2.5` — agreement with rec(π_v ⊗ |det|^{(1−n)/2}) at unramified v

*Unit tests.* A wrong definition fails one of these.

- `heckePolynomial_rank_one` (degenerate) — n = 1: P_v = X − t_{v,1} = X − χ_v(ϖ_v).
- `heckePolynomial_delta` (value) — Δ at p = 2 (π = π_Δ ⊗ ‖det‖^{−5}): P = X² + 24X + 2^{11}.
- `heckePolynomial_eq_prod_two` (compatibility) — n = 2: X² − s(α+β)X + q·αβ = (X − sα)(X − sβ) when s² = q.
- `not_heckePolynomial_unnormalized` (non-example) — ∏(X − α_j) (no q^{(n−1)/2}) differs from P_v for n = 2: its X-coefficient is −(α + β), not −q^{1/2}(α + β).
- `heckePolynomial_arith_vs_geom` (non-example) — For Δ, ρ_Δ itself has geometric-Frobenius polynomial X² + 24·2^{−11}X + 2^{−11} ≠ P_2, so ρ_Δ corresponds to π_Δ ⊗ ‖det‖^{−5} only in the arithmetic convention.

*Construction.*

1. Factorisation: e_i(q^{(n−1)/2}α) = q^{i(n−1)/2} e_i(α) = q^{i(n−1)/2 − i(n−i)/2} t_{v,i} = q^{i(i−1)/2} t_{v,i}, and Vieta.
2. Convention switch: r^∨(Frob_arith) = r(Frob_arith^{−1})^T = r(Frob_geom)^T has the same characteristic polynomial as r(Frob_geom).
3. Twist: the Satake parameters of π_v ⊗ ‖det‖^t are α_j q^{−t} (‖ϖ_v‖ = q_v^{−1}), so the roots are β_j q^{−t}. And ε_l(Frob_geom) = q_v^{−1}, so r ⊗ ε_l^t has geometric-Frobenius roots β_j q_v^{−t}.
4. Contragredient: π_v^∨ has Satake parameters α_j^{−1}, so roots q^{(n−1)/2}α_j^{−1} = q^{n−1}/β_j. And r^∨ ⊗ ε_l^{1−n} has geometric-Frobenius roots β_j^{−1} q^{n−1}.

*Acceptance.*

- n = 1: P_v(X) = X − χ_v(ϖ_v), and r_{l,ι}(χ)(Frob_v) = ι^{−1}χ_v(ϖ_v) in the geometric convention (galois-character-of-an-algebraic-hecke-character).
- n = 2, F = ℚ, π = π_f ⊗ ‖det‖^{1−k/2}, normalised so that T_{p,1} acts by a_p and T_{p,2} by ψ(p)p^{k−2}: P_p(X) = X² − a_pX + ψ(p)p^{k−1}. This is the R19 polynomial of ρ_f for arithmetic Frobenius, so the geometric convention gives r_{l,ι}(π) ≅ ρ_f^∨. For Δ at p = 2: X² + 24X + 2^{11}.
- n = 3: P_v(X) = X³ − t₁X² + q t₂X − q³ t₃ = ∏(X − qα_j) when t₁ = q e₁, t₂ = q e₂ and t₃ = e₃.

*Uses.* `IntegralHeckeAndGaloisDeterminants:IHG.3`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `mathlib:Multiset.prod_X_sub_C_coeff`.

*Planet:* Hecke polynomial normalization.

*Sources.*

- Potential automorphy over CM fields, §2.2.5, (2.2.6), p. 922: “It corresponds to the characteristic polynomial of a Frobenius element on recT Fv(πv), where πv is an unramified representation of GLn(Fv).” The Hecke polynomial P_v(X) and its Galois meaning.
- Potential automorphy over CM fields, Theorem 2.3.2, p. 935: “the characteristic polynomial of rι(π)(Frobv) is equal to the image of Pv(X) in Qp[X] under the homomorphism Tv →Qp associated to ι−1πv.” The geometric convention in the construction HLTT–ACC+ use (Frob_v geometric).
- Potential automorphy over CM fields, Notation, p. 906: “We write recT K for the arithmetic normalization of the local Langlands correspondence, as defined in, e.g., [CT14, §2.1];” rec^T, in which P_v is read.

#### Definition. A Galois representation attached to π at the good places, and its functoriality under twist, dual, conjugation and base change

*Module* `TauCeti/AutomorphicGalois/Attached.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`.

Let π be a regular algebraic automorphic representation of GL_n(𝔸_F), l a prime and ι: Q̄_l ≅ ℂ. A continuous semisimple r: G_F → GL_n(Q̄_l) is attached to π (with respect to ι) at the good places if there is a finite set S of places, containing those above l and those where π is ramified, such that for v ∉ S, r is unramified at v and ι det(X − r(Frob_v)) = P_v(π_v; X) (geometric Frobenius). Such r is unique up to isomorphism. If r is attached to π, then: r ⊗ r_{l,ι}(ψ) is attached to π ⊗ (ψ∘det) for ψ algebraic; r^∨ ⊗ ε_l^{1−n} is attached to π^∨; r^c is attached to π^c; and r|_{G_{F′}} is attached to BC_{F′/F}(π) for F′/F finite soluble.

*Hypotheses.*

- This is the property HLTT prove for every regular algebraic cuspidal π over a CM field (ACC+ Theorem 2.3.2). It is the interface that AG2.1–AG2.4 produce and AG2.5 strengthens. Nothing at the places in S, or above l, is asserted.
- Uniqueness needs semisimplicity. It uses Čebotarev and Brauer–Nesbitt (ArithmeticGaloisRepresentations R01.1/R01.5).
- The base-change clause needs the Satake parameters of BC(π)_w to be the q-power restrictions of those of π_v (the unramified base-change identity), requested from EndoscopicTransferAndUnitaryTraceComparison ET.7, which exports the Arthur–Clozel base-change steps to this roadmap.

*API.*

- `IsAttached` (*data*) — r.IsAttached ι π :⇔ ∃ S finite, ∀ v ∉ S, r unramified at v ∧ ι det(X − r(Frob_v)) = P_v(π_v).
- `IsAttached.unique` (*extensionality*) — r, r′ semisimple and both attached to π ⇒ r ≅ r′.
- `IsAttached.twist` (*functoriality*) — r.IsAttached π → (r ⊗ r_{l,ι}(ψ)).IsAttached (π ⊗ ψ∘det).
- `IsAttached.dual` (*functoriality*) — r.IsAttached π → (r^∨ ⊗ ε_l^{1−n}).IsAttached π^∨.
- `IsAttached.conj` (*functoriality*) — r.IsAttached π → r^c.IsAttached π^c.
- `IsAttached.baseChange` (*functoriality*) — r.IsAttached π → (r|_{G_{F′}}).IsAttached (BC_{F′/F} π) for F′/F soluble.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems` — HLTT Theorem A produces an attached r_{p,ι}(π)
- `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris` — the polarized construction's good-place property
- `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality` — P_v(π_v) has coefficients in M_π, so an attached r has traces in ι^{-1}(M_π) at good places

*Unit tests.* A wrong definition fails one of these.

- `isAttached_heckeCharacter` (degenerate) — n = 1: r_{l,ι}(ψ).IsAttached ι ψ.
- `isAttached_classical` (value) — ρ_f^∨ is attached to π_f ⊗ ‖det‖^{1−k/2}; for Δ the polynomial at 2 is X² + 24X + 2^{11}.
- `not_isAttached_classical_rho` (non-example) — ρ_f is not attached to π_f ⊗ ‖det‖^{1−k/2} (for Δ its geometric polynomial at 2 is X² + 24·2^{−11}X + 2^{−11}).
- `isAttached_dual_twist` (compatibility) — The two rules compose consistently: (r^∨ε^{1−n})^∨ε^{1−n} = r, matching π^∨∨ = π.

*Construction.*

1. Uniqueness: two semisimple representations with equal characteristic polynomials on a dense set of Frobenius elements are isomorphic (R01.5 recognition).
2. Twist and contragredient: frobenius-polynomial-and-conventions, with ψ ↦ r_{l,ι}(ψ) from galois-character-of-an-algebraic-hecke-character.
3. Conjugation: (π^c)_v = π_{cv} ∘ c, and r^c(Frob_v) = r(c Frob_v c) = r(Frob_{cv}).
4. Base change: Frob_w = Frob_v^{f(w|v)} and the Satake parameters of BC(π)_w are α_j^{f(w|v)}.

*Acceptance.*

- n = 1: r_{l,ι}(ψ) is attached to ψ.
- n = 2, F = ℚ: ρ_f^∨ (R19 convention for ρ_f, i.e. the cohomological realisation M_{f,λ}) is attached to π_f ⊗ ‖det‖^{1−k/2}; ρ_f is attached to (π_f ⊗ ‖det‖^{1−k/2})^∨ ⊗ ‖det‖ (dual rule, then twist rule with r_{l,ι}(‖·‖) = ε_l); for Δ at 2 both have geometric-Frobenius roots 1/β_j, where β_j are the roots of X² + 24X + 2^{11}.
- Dual check at n = 2: ρ_f^∨ is attached to π ⇒ ρ_f ⊗ ε_l^{−1} is attached to π^∨. Indeed ρ_f ⊗ ε_l^{−1} = (ρ_f^∨)^∨ ⊗ ε_l^{1−2}.

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`, `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`.

*Sources.*

- Potential automorphy over CM fields, Theorem 2.3.2, p. 935: “for each prime l̸ = p above that both F and π are unramified, and for each place v|l of F , rι(π)|GFv is unramified” The good-place property that defines attachment.
- Potential automorphy over CM fields, §2.3, after Definition 2.3.6, p. 938: “We observe that if m ⊂TS is of Galois type, then so is m∨, and in fact ρm∨∼= ρ∨ m ⊗ϵ1−n.” The contragredient rule r ↦ r^∨ ⊗ ε^{1−n}, as ACC+ state it for Hecke maximal ideals.

#### Definition. The field of rationality M_π and its separation from a field of realisation

*Module* `TauCeti/AutomorphicGalois/Rationality.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`.

For an automorphic representation π of GL_n(𝔸_F), M_π ⊂ ℂ is the fixed field of {σ ∈ Aut(ℂ) : σπ^∞ ≅ π^∞}. For π regular algebraic cuspidal (F CM, or F totally real), M_π is a number field (Clozel's rationality theorem, owned by AutomorphicFormsOnReductiveGroups AF.4). For every v at which π is unramified, P_v(π_v; X) ∈ M_π[X], where the q_v^{i(i−1)/2} and the t_{v,i} are both σ-equivariant. If r is attached to π, the traces of r at good Frobenius elements lie in ι^{−1}(M_π). Realisability of r over a finite extension of ι^{−1}(M_π)_λ, or over (M_π)_λ itself, is a separate descent statement and is not asserted.

*Hypotheses.*

- The definition uses π^∞ only. σπ^∞ is π^∞ with scalars extended along σ.
- M_π controls traces, not realisations. The field over which r can be written may be strictly larger, by a Schur-index obstruction, and AG2.7 states the realisation only after proving a finite coefficient field.
- Clozel's theorem is used with its exact hypotheses: π regular algebraic (cohomological) and cuspidal. It is not claimed for non-cuspidal or non-algebraic π.

*API.*

- `fieldOfRationality` (*constructor*) — M_π := fixed field of {σ ∈ Aut(ℂ) : σπ^∞ ≅ π^∞}.
- `fieldOfRationality_finite` (*characterisation*) — π regular algebraic cuspidal ⇒ [M_π : ℚ] < ∞ (AF.4).
- `heckePolynomial_mem` (*relation*) — P_v(π_v) ∈ M_π[X] at unramified v.
- `fieldOfRationality_conj` (*functoriality*) — M_{σπ} = σ(M_π).
- `fieldOfRationality_twist_le` (*relation*) — M_{π⊗ψ∘det} ⊆ M_π M_ψ.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.7` — invariant lattices only after a finite coefficient field of realisation is proved
- `PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n` — the coefficient field of the compatible system of π

*Unit tests.* A wrong definition fails one of these.

- `fieldOfRationality_heckeCharacter` (degenerate) — n = 1: M_ψ = ℚ(ψ(x) : x ∈ 𝔸_F^{∞,×}).
- `fieldOfRationality_classical` (value) — n = 2, f of level 23 and weight 2 with K_f = ℚ(√5): M_π = ℚ(√5).
- `fieldOfRationality_delta` (value) — π_Δ ⊗ ‖det‖^{−5}: M = ℚ (all τ(n) ∈ ℤ).
- `not_realizable_over_rationality_field` (non-example) — Q₈'s 2-dimensional representation: trace field ℚ, no model over ℚ₂. A definition identifying M_π with a field of realisation fails here.

*Construction.*

1. Well-definedness: {σ : σπ^∞ ≅ π^∞} is a subgroup of Aut(ℂ), and its fixed field is a subfield of ℂ.
2. Rationality (request to AF.4): the cuspidal cohomology of the arithmetic quotients of GL_n with coefficients in Ξ_a^∨ has a ℚ(a)-structure preserved by the Hecke algebra. π^∞ occurs in it with multiplicity one, so its Aut(ℂ)-orbit is finite and M_π is a number field.
3. P_v ∈ M_π[X]: σ acts on the spherical vector's Hecke eigenvalues, t_{v,i}(σπ) = σ(t_{v,i}(π)), and q_v^{i(i−1)/2} ∈ ℤ.

*Acceptance.*

- n = 1: M_ψ is the field generated by the values of ψ on 𝔸_F^{∞,×}, a number field for algebraic ψ.
- n = 2: for π = π_f ⊗ ‖det‖^{1−k/2}, M_π = ℚ(a_p, ψ(p) : p ∤ N) = K_f, the Hecke field, and ρ_{f,λ} is realised over K_{f,λ} (Deligne–Serre footnote (2): complex conjugation has distinct rational eigenvalues).
- Realisation is a separate question: the two-dimensional representation of the quaternion group Q₈ has rational character but is not realisable over ℚ₂, since the quaternion algebra (−1, −1)_ℚ ramifies at 2. So an Artin representation of G_ℚ through a Q₈-extension has trace field ℚ but no model over ℚ₂.

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`, `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`, `AutomorphicFormsOnReductiveGroups:AF.4`.

*Planet:* Field of rationality.

*Sources.*

- Potential automorphy over CM fields, §7.1, p. 1093: “Mπ ⊂C is the fixed field of {σ ∈Aut(C) : σπ∞∼= π∞};” The field of rationality, in the coefficient field of the compatible system ACC+ attach to π.

### Theorems

#### Comparison. The normalizations actually used by the sources: rec(pi_v tensor |det|^{(1-n)/2}) in three of them, the geometric normalization in Caraiani, and the choice of embeddings

*Node* `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`.

The sources do not all use the same normalization. Data: a rational prime p and an isomorphism iota: Qbar_p -> C (Chenevier-Harris: a pair of embeddings iota = (iota_p: Qbar -> Qbar_p, iota_infinity: Qbar -> C)). HLTT (Theorem A) and Varma: for pi a cuspidal automorphic representation of GL_n(A_E) with pi_infinity having the same infinitesimal character as an irreducible algebraic representation rho_pi of Res_{E/Q} GL_n (the definition of REGULAR ALGEBRAIC used), the attached r_{p,iota}(pi): G_E -> GL_n(Qbar_p) satisfies, at places v above a rational prime q != p above which pi is unramified (Varma: at v not dividing p where pi and F are unramified), r_{p,iota}(pi)|^{ss}_{W_{E_v}} = iota^{-1} rec_{E_v}(pi_v |det|_v^{(1-n)/2}); Varma says rec is 'normalized as in [10]' = Harris-Taylor. Chenevier-Harris state their comparison as (rho|Gamma_v)^{F-ss} < L(Pi_v tensor |.|_v^{(1-n)/2}) with 'L the local Langlands correspondence' and the PARTIAL ORDER < of [Ch] section 3.1, not with equality. Caraiani states her theorems with the GEOMETRIC normalization L_{n,L_y} of the local Langlands correspondence. The relation between these normalizations (the reason for the twist, and how L_{n,L_y} relates to rec) is not stated in the passages read. Placement note (reviewer): the atlas stage AG2.0 is to construct the normalization dictionary WITHOUT an established local Langlands correspondence and to prove agreement with rec(pi_v tensor |det|^{(1-n)/2}) only in AG2.5; this node records rec-normalizations and so is AG2.5-side material.

*Hypotheses.*

- the pair of embeddings must be fixed before the statement makes sense; the representation depends on iota
- 'regular algebraic' means pi_infinity has the same infinitesimal character as an irreducible algebraic representation of Res_{E/Q} GL_n; no self-duality is assumed in the HLTT source
- two distinct normalizations appear in the sources read: rec twisted by |det|^{(1-n)/2} (HLTT, Varma; Chenevier-Harris with L) and Caraiani's geometric normalization L_{n,L_y}; the passages read do not relate them, so they are not interchangeable without a separate comparison
- Chenevier-Harris state (a) with the partial order rather than isomorphism, so their result is weaker than an equality of Weil-Deligne representations
- The conventions under which these normalisations are stated are fixed in BLGGT and ACC+: Art_K sends uniformisers to geometric Frobenius elements, Frob_v is geometric, and rec is Harris–Taylor's. ACC+'s rec^T is the arithmetic normalisation of Clozel–Thorne §2.1. The AG2.0 dictionary proper, which uses no local Langlands correspondence, is frobenius-polynomial-and-conventions.

*Proof outline.*

1. Each source states its normalization once and uses it throughout; the node records the four statements side by side.
2. The partial order in Chenevier-Harris is defined in a reference of theirs ([Ch] section 3.1), which was NOT read here.
3. At a place where π is unramified, the twisted rec(π_v ⊗ |det|_v^{(1−n)/2}) has geometric-Frobenius characteristic polynomial P_v(π_v; X) (AG2.0/frobenius-polynomial-and-conventions). That is the comparison AG2.5 has to prove for the rec normalisations recorded here.

*Acceptance.*

- Check the n = 1 case: an algebraic Hecke character and the twist |det|^{(1-n)/2} = 1, so the dictionary must reduce to class field theory in the chosen normalization
- Check the n = 2 case against the R19 convention (characteristic polynomial X^2 - a_l X + eps(l) l^{k-1} at good arithmetic Frobenius) and record the twist relating the two

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`.

*Sources.*

- On the rigid cohomology of certain Shimura varieties, Theorem A, p. 1: “then rp,ı (π) is unramified at v and rp,ı (π)|ss WEv = ı −1 recEv (πv | det |v (1−n)/2 ).” The normalization verbatim, with the |det|^{(1-n)/2} twist and the semisimplification.
- Construction of automorphic Galois representations, II, Theorem (quoted as Theorem 3.2.3), part (a), p. 1: “(ρι,Π |Γv )F −ss ≺ L(Πv ⊗ | • |v 1−n 2 ), ... and the relation ≺ is the partial ordering on the associated Weil-Deligne representations defined in [Ch] §3.1;” The Chenevier-Harris statement is a PARTIAL ORDER, not an isomorphism; the stage's demand to 'distinguish equality of semisimplifications, Frobenius-semisimplified Weil-Deligne equality retaining N, and a bound on monodromy' is exactly this distinction.
- Local-global compatibility and the action of monodromy on nearby cycles, After Theorem 1.1, p. 1: “Here Ln,Ly (Πy ) is the image of Πy under the local Langlands correspondence, where the geometric normalization is used.” A different normalization convention in a source that strengthens the same comparison; mixing the two would shift the answer by a twist.
- Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p, 1 Introduction, p. 1: “Here recFv as normalized in [10] denotes the local Langlands correspondence for Fv” Varma fixes rec by reference to Harris-Taylor [10]. Added by the reviewer.

#### Lemma. The parity of the Galois multiplier of a polarized pair: µ(c_v) = (−1)^{n−1+w} χ_v(−1)

*Node* `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier`.

Let F be imaginary CM and (π, χ) a regular algebraic polarized automorphic representation of GL_n(𝔸_F) of weight a ∈ (ℤⁿ)_w. Put µ = ε_l^{1−n} r_{l,ι}(χ): G_{F⁺} → Q̄_l^×. Then µ(c_v) = (−1)^{n−1+w} χ_v(−1) for every v | ∞. Hence µ is totally odd if and only if χ_v(−1) = (−1)^{n+w}, i.e. (π, χ) is totally odd in the sense of polarized-automorphic-representation (v). Under BLGGT's printed normalisation χ_v(−1) = (−1)^n, µ(c_v) = (−1)^{w+1}: it is −1 exactly when w is even.

*Hypotheses.*

- The integer w is the one with a ∈ (ℤⁿ)_w. Theorem 2.1.1 of BLGGT uses a different integer, the purity weight w + n − 1 of r_{l,ι}(π).
- Only the multiplier's value at complex conjugation is computed. No Galois representation r_{l,ι}(π) is needed for the statement.

*Proof outline.*

1. By polarized-automorphic-representation, χ is algebraic with parallel exponent b = w on 𝔸_{F⁺}, so wt(χ) = 2w.
2. By galois-character-of-an-algebraic-hecke-character, r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^w.
3. ε_l(c_v) = −1, so ε_l^{1−n}(c_v) = (−1)^{n−1}, and µ(c_v) = (−1)^{n−1+w} χ_v(−1).
4. Consequence for BLGGT Theorem 2.1.1(1): the pair (r_{l,ι}(π), ε_l^{1−n} r_{l,ι}(χ)) is totally odd only for the multiplier χ satisfying (v). With χ_v(−1) = (−1)^n and w odd, µ(c_v) = +1, and (r_{l,ι}(π), µ) is not even polarized for n = 1 (a pairing on a line is symmetric).
5. Independent check against Patrikis, who records the sign of the pairing preserved by these representations as ω_ι(c_v) = (−1)^w ω_v(−1) in his normalisation.

*Acceptance.*

- n = 1, F = K imaginary quadratic, ψ the Hecke character of a CM elliptic curve (weight (1, 0), w = 1): ψψ^c = ψ|_{𝔸_ℚ} ∘ N. χ = ψ|_{𝔸_ℚ} has χ_∞(−1) = (−1)^1 = −1, BLGGT's sign. But r_{l,ι}(ψ|_{𝔸_ℚ})(c) = 1 (transfer), whereas χ = ψ|_{𝔸_ℚ}δ_K, with χ_∞(−1) = +1 = (−1)^{n+w}, gives µ(c) = −1.
- n = 2, the base change to K of a newform of weight k with k odd (w = k − 2 odd): BLGGT's sign gives µ(c) = +1. The invariant pairing on r = ρ_f^∨|_{G_K} is symmetric (det(x, ρ(c)y)), so the totally odd multiplier is the other one, the extension of det r with value −1 at c.
- w even (for instance n = 1 and ψ with ψψ^c = 1): the corrected and printed normalisations agree.

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`.

*Sources.*

- Potential automorphy and change of weight, Theorem 2.1.1(1), p. 33: “(rl,ı(π), ǫ1−n l rl,ı(χ)) is a totally odd, polarized l-adic representation.” The assertion that fails for odd w under the printed normalisation (sourceIssue E2).
- Potential automorphy and change of weight, Proof of Theorem 2.1.1, p. 34: “When F is CM, note that by definition ǫ1−n l rl,ı(χ) takes every complex conjugation to −1.” The step that holds only when w is even.
- On the sign of regular algebraic polarizable automorphic representations, §2, proof of Theorem 2.1 and the construction after it, p. 8: “ρi,ι preserves a pairing of sign ωι(cv) = (−1)wωv(−1)” An independent source relating the Galois sign to the automorphic sign through (−1)^w.

### What is missing

- The acceptance example 'a unitary similitude coefficient with nontrivial central character' is not planned; it needs the coefficient systems of HLTT's G_n (their §§2–3), not read.
- Clozel's rationality theorem is requested from AutomorphicFormsOnReductiveGroups AF.4, not re-proved; its source (Clozel, Motifs et formes automorphes) is not public and was not read.
- The unitary Satake normalisation t_{v,i} = q^{i(n−i)/2} e_i(α) is requested from IHG.3, whose packet has no IHG.3 nodes yet.
- The C-algebraic/L-algebraic distinction is left to AF.4 and is only referenced.
- Placement: the carried node the-normalization-dictionary-fixed-by-the-sources compares rec-normalisations and is AG2.5-side material (reviewer note); it now points to the AG2.0 dictionary node that avoids local Langlands.

## AG2.1 Characteristic-zero geometric Galois realization

No nodes yet.

### What is missing

- This stage is the aggregate of AG2.1a and AG2.1b and has no independent content; no node was written for it. It should be marked complete only when both components are.

## AG2.1a Raw cohomology before local Langlands

### Theorems

#### Theorem. What the polarized geometric construction supplies, and the regularity condition that splits its cases

*Node* `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`.

For Pi a cuspidal automorphic representation of GL_n over a CM field which is CONJUGATE SELF-DUAL (Pi^dual = Pi composed with c) and COHOMOLOGICAL for an irreducible algebraic representation Xi (Chenevier-Harris: in the sense of their Hypotheses 1.1, with K/F a totally imaginary quadratic extension of a totally real F), a semisimple continuous Galois representation R_l(Pi): Gal(Kbar/K) -> GL_n(Qbar_l) is attached by [Sh3, CH] (Shin; Chenevier-Harris). Chenevier-Harris Theorem 3.2.3: (a) at finite primes v of residue characteristic prime to p, (rho_{iota,Pi}|Gamma_v)^{F-ss} < L(Pi_v tensor |.|_v^{(1-n)/2}) for the partial order of [Ch] section 3.1, which implies equality of the underlying Weil-group representations and that N lies in the Zariski closure of the conjugacy class of N' (CH, before Theorem 2.3); (b) at finite primes v of residue characteristic p, rho_{iota,Pi}|Gamma_v is DE RHAM in Fontaine's sense, its Hodge-Tate numbers have multiplicity at most one (Hodge-Tate regular) and are determined by Pi_infinity by an explicit recipe; (c) if v divides p and Pi_v has a nonzero vector fixed by a maximal compact subgroup of GL(n, K_v), then rho_v is CRYSTALLINE and det(T - phi | D_cris(rho_v)) = det(T - L(Pi_v tensor |.|_v^{(1-n)/2})(Frob_v)) for phi the smallest linear power of the crystalline Frobenius; they also show semistability at places above p where Pi_v has a nonzero Iwahori-fixed vector. Caraiani records that her Theorems 1.1 (full Weil-Deligne compatibility away from l) and 1.2 (temperedness) were already known when n is ODD or n is even and Pi is SLIGHTLY REGULAR (Shin), or when Pi is square-integrable at a finite place (Harris-Taylor, Taylor-Yoshida), and that in the case n even and Pi_infinity not slightly regular Chenevier-Harris constructed R_l(Pi) with local-global compatibility up to semisimplification. Placement note (reviewer): these are statements AFTER local Langlands (partial order, de Rham, crystalline), i.e. the outputs of AG2.2/AG2.5/AG2.6, whereas the atlas stage AG2.1a is 'raw cohomology before local Langlands'.

*Hypotheses.*

- conjugate self-duality and cohomologicality are both hypotheses; no statement is made for arbitrary GL_n representations
- part (c) requires Pi_v to have a nonzero vector fixed by a maximal compact subgroup of GL(n, K_v)
- the Hodge-Tate regularity in (b) is a CONCLUSION under these hypotheses, derived from Pi_infinity by an explicit recipe
- the case division recorded by Caraiani (n odd, or n even and slightly regular: Shin; square-integrable at a finite place: Harris-Taylor, Taylor-Yoshida; n even and not slightly regular: Chenevier-Harris up to semisimplification) concerns which results were available before her Theorems 1.1-1.2; the passages read do not say which construction is used for the existence of R_l(Pi) in each case beyond the citation [Sh3, CH]

*Proof outline.*

1. Chenevier-Harris state the theorem in their introduction with a pointer to their Theorem 3.2.3; the proof was NOT read here.
2. Caraiani's two papers record which cases were already available and which she supplies; Caraiani describes the Chenevier-Harris comparison as 'up to semisimplification', while Chenevier-Harris state it with the dominance order.

*Acceptance.*

- Check part (c) on an unramified place and confirm that the crystalline Frobenius polynomial matches the Satake parameters under the chosen normalization
- Check that the partial-order statement of (a) does not determine N, by exhibiting two Weil-Deligne representations comparable in that order with different monodromy

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`, `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`, `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`.

*Planet:* Polarized construction (Shin, Chenevier–Harris).

*Sources.*

- Construction of automorphic Galois representations, II, Theorem (3.2.3), parts (b) and (c), p. 1: “(b) For all finite primes v of K of residue characteristic p, ρι,Π |Γv is de Rham (in Fontaine’s sense), and its Hodge-Tate numbers have multiplicity at most one (i.e., ρι,Π is Hodge-Tate regular) and are determined by the archimedean component Π∞ of Π in accordance with an explicit recipe.” The de Rham and Hodge-Tate regularity conclusions at places above p, with the recipe from Pi_infinity.
- Local-global compatibility and the action of monodromy on nearby cycles, 1 Introduction, p. 2: “The above theorems are already known when n is odd or when n is even and Π is slightly regular, by work of Shin [Sh3]. They are also known if Π is square integrable at a finite place, by the work of Harris-Taylor [HT] and Taylor-Yoshida [TY].” The case division for Caraiani's Theorems 1.1-1.2 (not for the existence of R_l(Pi)), which the stage's 'retain the parity and Shin-regularity restrictions' requires to be tracked.
- Construction of automorphic Galois representations, II, Paragraph before Theorem 2.3: “we refer to [Ch] §3.1 for the precise definition of the dominance relation rho < rho'. Let us simply say here that it implies that s = s' and that N is in the Zariski-closure of the conjugacy class of N'.” What the partial order in (a) implies, as far as the source states it. Added by the reviewer.

### What is missing

- Only the statements of what the polarized construction supplies were read. The finite-level etale cohomology with the algebraic local system, the Kuga-Sato powers, the algebraic correspondences and projectors, the Schur functor, Tate twist, parity and degree, and the raw fixed-point/nearby-cycle trace identities were NOT read.
- Shin's papers, which supply the n odd and slightly regular cases, were not read; Shin_GaloisCompact.pdf and Shin_StableIgusa.pdf are in the library and were not opened.
- Chenevier-Harris's own Sections 1-3 were not read; only their introduction.
- Placement: the node polarized-construction-inputs-shin-and-chenevier-harris states results after local Langlands (Chenevier-Harris Theorem 3.2.3), which the atlas assigns to AG2.2/AG2.5/AG2.6, not to AG2.1a (raw cohomology before local Langlands).

## AG2.1b Automorphic constituents after local comparison

No nodes yet.

### What is missing

- No node written. The virtual-character comparison with the geometric trace formula, the separation of actual representations from alternating classes, the Igusa-variety route and the purity/weight-separation/multiplicity/cancellation arguments were not read. Next source action: read Shin, 'Galois representations arising from some compact Shimura varieties' (references/papers/Shin_GaloisCompact.pdf, in the library with extracted text) and Chenevier-Harris Section 3.

## AG2.2 Polarized cuspidal and discrete automorphic systems

No nodes yet.

### What is missing

- No node written. Stable unitary base change, the endoscopic character identities, the rank and multiplicity formulas, and the descent for essentially conjugate self-dual forms were not read. Next source action: read Chenevier-Harris Section 2 and the trace-formula sources assigned to EndoscopicTransferAndUnitaryTraceComparison (EXT-11).
- HLTT apply the polarized construction to discrete (not necessarily cuspidal) representations of GL_2n; Chenevier-Harris Theorem 3.2.3 as read concerns cuspidal Pi, so the discrete case is an unread AG2.2 input of AG2.4.

## AG2.3 Removing auxiliary geometric hypotheses

No nodes yet.

### What is missing

- No node written. Definite-unitary eigenvarieties, the Fredholm/slope machinery, classicality regions, density of strongly regular classical points and the determinant interpolation were not read. Next source action: read Chenevier's eigenvariety papers - references/text/R02_KI_BuzzardEigenvarieties.txt is in the library and is a related source that was not opened.

## AG2.4 Nonselfdual systems by rigid cohomology and approximation

### Theorems

#### Theorem. The HLTT construction: a non-self-dual GL_n system as a p-adic limit inside a GL_{2n} unitary similitude setting

*Node* `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`.

Theorem A of the source: let p be a rational prime and iota: Qbar_p -> C; let E be a CM or totally real field and pi a cuspidal automorphic representation of GL_n(A_E) with pi_infinity of the same infinitesimal character as an irreducible algebraic representation rho_pi of Res_{E/Q} GL_n. Then there is a UNIQUE continuous semisimple r_{p,iota}(pi): G_E -> GL_n(Qbar_p) such that for a rational prime q different from p above which pi is unramified and v | q a prime of E, r_{p,iota}(pi) is unramified at v with r_{p,iota}(pi)|^{ss}_{W_{E_v}} = iota^{-1} rec_{E_v}(pi_v |det|_v^{(1-n)/2}). NO self-duality hypothesis is imposed. The construction: reduce to an imaginary CM F containing an imaginary quadratic field in which p splits; work on the quasi-split unitary similitude group G_n attached to F^{2n}, whose maximal parabolic P^+_{n,(n)} has Levi L_{n,(n)} = GL_1 x Res_{F/Q} GL_n; set Pi(N) = the induction from P^+_{n,(n)}(A^{infinity,p}) to G_n(A^{infinity,p}) of (1 x iota^{-1}(pi ||det||^N)^{infinity,p}); realize Pi(N), for N sufficiently large, in a space of overconvergent p-adic cusp forms for G_n of finite slope; use an argument of Katz to find congruences modulo arbitrarily high powers of p to CLASSICAL holomorphic cusp forms on G_n of other weights; attach Galois representations to those by lifting them through the trace formula to polarizable regular algebraic discrete automorphic representations of GL_{2n}(A_F) and applying the polarized construction; this gives a 2n-dimensional R_p(iota^{-1}(pi||det||^N)^{infinity}) whose unramified Weil-group semisimplification is the sum, for good primes v, iota^{-1} rec_{F_v}(pi_v |det|_v^{N+(1-n)/2}) + iota^{-1} rec_{F_v}(pi_v |det|_v^{N+(1-n)/2})^{dual, c} eps_p^{1-2n} with eps_p the p-adic cyclotomic character (page image of p. 2; the text layer prints eps_p as p), from which r_{p,iota}(pi) is recovered by elementary algebra. The geometry used: the Shimura variety X_{n,U}/Q attached to a neat U, a moduli space for abelian n[F:Q]-folds with an isogeny action of F, NOT proper; its canonical normal compactification X^min_{n,U}; a smooth compactification X_{n,U,Delta} with simple normal crossings boundary; a locally free sheaf E_{U,rho} with canonical extension E_{U,Delta,rho} and subcanonical E^sub_{U,Delta,rho} (the product with the boundary ideal sheaf) whose global sections are automorphic and cusp forms respectively; and the associated dagger spaces with their ordinary loci, on which an overconvergent cusp form of weight rho and level U is a section of E^sub over the ordinary locus. The abstract states local-global compatibility away from l and a finite number of rational primes above which the CM field or the automorphic representation ramify.

*Hypotheses.*

- no self-duality is assumed on pi; the source stresses that in the non-polarizable case r_{p,iota}(pi) will never occur in the Betti or etale cohomology of a Shimura variety, according to unpublished computations of Harris and Clozel
- the reduction to an imaginary CM F containing an imaginary quadratic field in which p SPLITS is part of the construction
- N must be sufficiently large and the realization is in overconvergent p-adic cusp forms of finite slope (HLTT); Varma's summary adds that the weight is non-classical
- the spaces of global sections of E_{U,Delta,rho} and E^sub_{U,Delta,rho}, and the notion of an overconvergent cusp form, are independent of the auxiliary choice Delta - the source says so explicitly
- the Galois representations for the classical forms are obtained by the trace formula lift to GL_{2n} plus the polarized construction; the whole argument therefore consumes the polarized case

*Proof outline.*

1. The source sketches the argument in its introduction as recorded above and refers to its Corollary 7.14 for the theorem.
2. The source records that the idea of realizing Pi(N) in overconvergent forms of finite slope is due to Skinner, and that the key problem was how to achieve such a realization.
3. It notes as an alternative that one could presumably construct an eigenvariety in this setting but that this was not carried out.

*Acceptance.*

- Check that the 2n-dimensional representation really decomposes as stated, and that the elementary algebra recovering the n-dimensional one is unambiguous
- Check that the subcanonical sheaf, not the canonical one, is what carries cusp forms, and that the ordinary locus is an admissible open sub-dagger space

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`.

*Planet:* HLTT non-self-dual construction.

*Sources.*

- On the rigid cohomology of certain Shimura varieties, Abstract and Theorem A, p. 1: “The main innovation is that we impose no self-duality hypothesis on the automorphic representation.” The scope of the construction: it is exactly the non-polarized case that the polarized sources do not reach.
- On the rigid cohomology of certain Shimura varieties, Introduction, p. 2: “according to unpublished computations of one of us (M.H.) and of Laurent Clozel, in the non-polarizable case the representation rp,ı (π) will never occur in the Betti or etale cohomology of a Shimura variety. Rather we construct it as a p-adic limit of representations which do occur in such cohomology groups.” Records that the construction is essentially a p-adic limit and not a direct geometric realization - which is why the stage puts it in a separate branch from AG2.1.
- On the rigid cohomology of certain Shimura varieties, Introduction, sketch, p. 2: “Then our strategy is to realize Π(N ), for sufficiently large N , in a space of overconvergent p-adic cusp forms for Gn of finite slope. Once we have done this, we can use an argument of Katz (see [Katz1]) to find congruences modulo arbitrarily high powers of p to classical (holomorphic) cusp forms on Gn (of other weights).” The weight-changing congruences modulo arbitrarily high powers of p that the stage text names, attributed to Katz.
- On the rigid cohomology of certain Shimura varieties, Introduction, p. 1: “It may be possible to extend the local-global compatibility to other primes v. Ila Varma is considering this question.” The source's own statement that its local-global compatibility is only at good places; the stage's separate treatment of AG2.5 is source-correct.
- Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p, 1 Introduction, p. 2: “The authors of [9] prove that Pi(M) is a subrepresentation of the space of overconvergent p-adic automorphic form on G of some non-classical weight and finite slope.” The non-classical-weight clause, which is in Varma's summary of [9] = HLTT rather than in HLTT's introduction. Added by the reviewer.

### What is missing

- Only the introduction of the non-self-dual source was read. Its Sections 1-7, containing the construction of the dagger spaces, the overconvergent logarithmic de Rham complex, the finite-slope theory, the boundary/Levi inclusion and the Katz congruence argument, were not read; Corollary 7.14, which is Theorem A, was not opened.
- The toroidal and minimal compactifications and the canonical/subcanonical extensions were read only as named objects; Lan's compactification book (references/papers/R02_Lan_PELCompactifications.pdf, in the library) was not opened.

## AG2.5 Good-prime and ramified local–global comparison

### Theorems

#### Theorem. Varma's extension to all places away from p: equality of semisimplifications and a bound, not an equality, of monodromy

*Node* `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound`.

Let F be an imaginary CM or totally real field and pi a regular algebraic cuspidal automorphic representation of GL_n(A_F), with r_{p,iota}(pi) the representation constructed in [9, 16] (= HLTT and Scholze, On torsion in the cohomology of locally symmetric varieties). Theorem (1^ss): for EVERY prime v not dividing p of F, WD(r_{p,iota}(pi)|G_{F_v})^{ss} = iota^{-1} rec_{F_v}(pi_v tensor |det|_v^{(1-n)/2})^{ss}. Theorem (1): moreover WD(r_{p,iota}(pi)|G_{F_v})^{Frob-ss} < iota^{-1} rec_{F_v}(pi_v |det|_v^{(1-n)/2}) for the partial order, i.e. the monodromy of the Galois side is 'MORE NILPOTENT' than that of rec(pi_v). This is a semisimplified comparison together with a monodromy BOUND; it is not asserted to be an equality of Weil-Deligne representations. Strategy: follow the construction; at all primes v not dividing p of F which split over F^+ (equivalently at all primes away from p where G splits), the Bernstein centres of a finite union of Bernstein components containing Pi(M)_v map to the Hecke algebras acting on p-adic and classical cusp forms on G of arbitrary integral, not necessarily classical, weight; for each sigma in W_{F_v} the image contains Hecke operators whose eigenvalue on a p-adic cusp form Pi' equals tr rec_{F_v}(Pi'_v tensor |det|_v^{(1-2n)/2})(sigma); for classical Pi' local-global compatibility is already known, so the eigenvalue is also tr WD(r_p(Pi')|G_{F_v})^{ss}(sigma); congruences modulo p^k, for every k, between Hecke eigenvalues of linear combinations of classical cusp forms and those of Pi(M) give a continuous pseudorepresentation T with T(sigma_v) = tr rec_{F_v}(Pi(M)_v tensor |det|_v^{(1-2n)/2})(sigma_v) at split v not above p, hence a 2n-dimensional r_{p,iota}(Pi(M)) with the semisimplified comparison there.

*Hypotheses.*

- the comparison is at places v not dividing p; places above p are a different problem
- the Bernstein-centre argument is run at primes that SPLIT over the maximal totally real subfield, i.e. where the unitary similitude group splits
- the Hecke eigenvalue identity involves the twist |det|^{(1-2n)/2} for the 2n-dimensional object, not |det|^{(1-n)/2}
- the conclusion of Theorem (1) is a partial-order statement; advertising it as full monodromy equality would overstate it - the stage text warns against exactly this

*Proof outline.*

1. The source states the two theorems and summarizes the argument as recorded; the details were not read here.
2. The identity of traces is obtained on classical points, where local-global compatibility is already known, and transferred to Pi(M) through congruences modulo arbitrarily high powers of p and a continuous pseudorepresentation (not through a continuity argument on the Bernstein centre); how primes not split over F^+ are handled was not read.

*Acceptance.*

- Check on a Steinberg place that the bound is strict, i.e. that the Galois monodromy can be smaller than rec's
- Check that the argument genuinely needs the split hypothesis at v, by identifying where the Bernstein centre of the unitary group is used

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`.

*Planet:* Varma's local–global compatibility.

*Sources.*

- Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p, Abstract, p. 1: “Furthermore, we can show that the monodromy of the associated Weil-Deligne representation of rp (π)|GalF is ‘more nilpotent’ than the monodromy of rec(πv ).” The monodromy statement is a bound in one direction; the stage's requirement that 'its semisimplified comparison plus monodromy bound is not advertised as full monodromy equality' is confirmed by the source's own wording.
- Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p, 1 Introduction, Theorem (1), p. 2: “WD( rp,ı (π)|GF )Frob −ss ≺ ı−1 recFv (πv | det |(1−n)/2 v ), v where ‘Frob-ss’ denotes Frobenius semisimplification.” The literal statement with the partial order.
- Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p, 1 Introduction, strategy, p. 2: “at all primes v ∤ p of F which split over F + (equivalently, at all primes away from p where G splits), the Bernstein centers associated to a finite union of Bernstein components containing Π(M )v map to the Hecke algebras acting on spaces of p-adic and classical cusp forms on G of arbitrary integral (not necessarily classical) weight.” The split hypothesis and the Bernstein-centre mechanism, both of which must be recorded as hypotheses of the interpolation.

#### Theorem. Caraiani's upgrade to full Weil-Deligne equality away from p, via purity, and the Ramanujan-Petersson input

*Node* `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`.

Theorem 1.1 of the source: let n >= 2, L a CM field with complex conjugation c, l a prime and iota_l: Qbar_l -> C. Let Pi be a cuspidal automorphic representation of GL_n(A_L) with Pi^dual = Pi composed with c and Pi cohomological for an irreducible algebraic Xi. Let R_l(Pi) be the Galois representation attached to Pi by the polarized construction, p different from l, and y a place of L above p. Then WD(R_l(Pi)|Gal(Lbar_y/L_y))^{F-ss} is isomorphic to iota_l^{-1} L_{n,L_y}(Pi_y), with the GEOMETRIC normalization of local Langlands. Theorem 1.2: under the same hypotheses Pi is TEMPERED at every finite place of L, i.e. the Ramanujan-Petersson conjecture holds for such Pi. Strategy: both Weil-Deligne representations are shown to be PURE; Theorem 1.2 gives purity of iota_l^{-1} L_{n,L_y}(Pi_y); for the Galois side one realizes R_l(Pi)^{tensor 2} in the cohomology of a system of Shimura varieties X_U for a unitary group which at infinity looks like U(1, n-1) x U(1, n-1) x U(0, n)^{d-2}, and follows the Taylor-Yoshida structure of argument, computing the action of the monodromy operator N on that cohomology explicitly, using Theorem 1.2 at a crucial point; purity of the tensor square then forces purity of WD(R_l(Pi)|...)^{F-ss}. A technical input developed for this is the action of N on the complex of nearby cycles on a scheme locally etale over a product of semistable schemes, and a generalization of the weight-spectral sequence in that situation. The companion paper proves the analogous statement at l = p, by identifying the monodromy operator on the global side and deriving a generalization of Mokrane's weight spectral sequence for LOG CRYSTALLINE cohomology; there the case of Shin-regular weight was already known from Barnet-Lamb-Gee-Geraghty-Taylor, and only up to semisimplification otherwise.

*Hypotheses.*

- Pi must be conjugate self-dual and cohomological; the upgrade is NOT available in the non-polarized HLTT setting
- the geometric normalization of local Langlands is used, different from the |det|^{(1-n)/2}-twisted arithmetic normalization of the other sources
- the argument passes through R_l(Pi)^{tensor 2} realized in the cohomology of a specific unitary Shimura system with the displayed signature at infinity; it is not a statement about R_l(Pi) directly
- the technical generalization of the weight spectral sequence is for a scheme LOCALLY ETALE OVER A PRODUCT of semistable schemes, not for a semistable scheme
- at l = p the corresponding statement needs a generalization of Mokrane's weight spectral sequence for log crystalline cohomology, and the previously known cases required Shin-regular weight

*Proof outline.*

1. Prove temperedness (Theorem 1.2) first, which makes the automorphic side pure.
2. Realize the tensor square in Shimura cohomology, compute N by the nearby-cycle analysis and the generalized weight spectral sequence, and deduce purity of the Galois side.
3. Two Frobenius-semisimple Weil-Deligne representations with the same semisimplification that are both pure are isomorphic: the l = p paper cites Taylor-Yoshida Lemma 1.4(4) - given a semisimple Weil-group representation there is at most one monodromy operator making it pure. This upgrades the comparison up to semisimplification (Caraiani's description of Chenevier-Harris) to an isomorphism.

*Acceptance.*

- Check that purity on both sides is what forces equality, and that the semisimplified statement alone does not
- Check the signature U(1, n-1) x U(1, n-1) x U(0, n)^{d-2} against the Shimura-variety roadmap's data, since it is a specific auxiliary choice

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`.

*Planet:* Caraiani's local–global compatibility.

*Sources.*

- Local-global compatibility and the action of monodromy on nearby cycles, Theorem 1.1, p. 1: “W D(Rl (Π)|Gal(L̄y /Ly ) )F −ss ≃ ι−1 l Ln,Ly (Πy ).” The full Weil-Deligne isomorphism away from p, upgrading the partial order of the construction papers.
- Local-global compatibility and the action of monodromy on nearby cycles, 1 Introduction, strategy, p. 2: “we find the Galois representation Rl (Π)⊗2 in the cohomology of a system of Shimura varieties XU associated to a unitary group which looks like U (1, n − 1) × U (1, n − 1) × U (0, n)d−2 at infinity.” The auxiliary geometric input, with its exact signature; the upgrade is not an abstract purity argument.
- Monodromy and local-global compatibility for l = p, Abstract and Theorem 1.1, p. 1: “We extend the compatibility to Frobenius semisimplification in all cases by identifying the monodromy operator on the global side. To achieve this, we derive a generalization of Mokrane’s weight spectral sequence for log crystalline cohomology.” The l = p case and the log-crystalline weight spectral sequence that the stage names as a reusable p-adic Hodge target.
- Monodromy and local-global compatibility for l = p, 1 Introduction, p. 1: “By Lemma 1.4 (4) of [TY], given a semisimple representation of the Weil group of some l-adic field, there is at most one way to choose the monodromy operator such that the resulting Weil-Deligne representation is pure.” The uniqueness principle behind the purity upgrade, imported from Taylor-Yoshida (not in the library). Added by the reviewer.

### What is missing

- Varma's Sections 2 onwards, containing the Bernstein-centre interpolation and the nilpotent-orbit bounds, were not read; only the introduction.
- Caraiani's nearby-cycle analysis and generalized weight spectral sequence were not read; only the abstracts and introductions of her two papers.
- Taylor-Yoshida, whose structure of argument both papers follow, was not read and is not in the supplied library under that name (checked CATALOGUE.json).
- Chenevier's [Ch] (Une application des varietes de Hecke des groupes unitaires), where the dominance order is defined, is not in the supplied library; Chenevier-Harris only state that rho < rho' implies s = s' and N in the Zariski closure of the conjugacy class of N'.

## Required examples and checks

- n = 1: algebraic Hecke characters and r_{l,ι}(χ), including the Hecke character of a CM elliptic curve (weight (1, 0), w = 1), which separates the corrected sign χ_v(−1) = (−1)^{n+w} from BLGGT's printed (−1)^n.
- n = 2: π_f ⊗ ‖det‖^{1−k/2} of weight (k − 2, 0), P_p(X) = X² − a_pX + ψ(p)p^{k−1}, Hodge–Tate numbers {k − 1, 0}, and r_{l,ι} = ρ_f^∨ (for Δ at 2: X² + 24X + 2^{11}); base change of an odd-weight form as the second odd-w example.
- Weight 0: HT {n − 1, …, 0}, the Hodge–Tate numbers of Sym^{n−1} of the dual Tate module of an elliptic curve (ACC+ Corollary 7.2.4).
- Field of rationality: ℚ(√5) for the level-23 weight-2 form; ℚ for Δ. The quaternion group Q₈ separates a character field from a field of realisation.
- Not yet: a unitary similitude coefficient with nontrivial central character (see AG2.0, What is missing).

## Requests

- **AutomorphicFormsOnReductiveGroups:AF.4** — Algebraic highest weights of Res_{F/ℚ}GL_n and the irreducible algebraic representations Ξ_a; the Harish-Chandra parametrisation of infinitesimal characters, so that the weight of a regular algebraic π is unique; the C-algebraic/L-algebraic distinction and half-root twist; and Clozel's rationality theorem: for a regular algebraic cuspidal π of GL_n(𝔸_F), M_π is a number field and π^∞ has a model over it. Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.0/dominant-weights-and-the-weight-w`, `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`, `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`.
- **AutomorphicFormsOnReductiveGroups:AF.1** — (g, K)-modules of GL_n(ℝ) and GL_n(ℂ) with the centre of U(g_ℂ) acting through an infinitesimal character, for the definition of regular algebraic. Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`.
- **IntegralHeckeAndGaloisDeterminants:IHG.3** — The unitary normalisation of the Satake transform for GL_n: T_{v,i} acts on an unramified π_v with Satake parameters α by q_v^{i(n−i)/2} e_i(α). The stage fixes P_v(X) with arithmetic Frobenius; the sources of this roadmap (BLGGT, ACC+, HLTT) read the same P_v on geometric Frobenius, and this packet records the conversion r ↔ r^∨. Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`.
- **ArithmeticGaloisRepresentations:R01.1** — Continuous representations of G_F on finite-dimensional Q̄_l-spaces, semisimplification and continuity of twists, as the carrier of polarized pairs (r, µ). Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`.
- **EndoscopicTransferAndUnitaryTraceComparison:ET.7** — Arthur–Clozel cyclic base change for GL_n with the unramified identity: the Satake parameters of BC(π)_w are α_j^{f(w|v)} at unramified places. Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity** — Global Artin reciprocity Art_F: 𝔸_F^×/F^×(F_∞^×)⁰ ≅ G_F^{ab}, normalised to send uniformisers to geometric Frobenius elements, with its compatibility with restriction (the transfer G_{F⁺}^{ab} → G_F^{ab} corresponds to the inclusion of idele class groups). Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic** — Algebraic Hecke characters (Weil's type A₀) with their algebraic infinity types (n_σ), and the weight |χ| = ‖·‖^{−wt/2}, which BLGGT A.2 uses for r_{l,ι}(χ). Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters** — Hecke characters as continuous characters of the idele class group, their local components χ_v and χ_v(−1) at real places, and the conductor- and parity-compatible dictionary with Dirichlet characters over ℚ. Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.

## Coverage

- **AutomorphicGaloisRepresentationsPartII:AG2.0** (partial). Checkpoint 1 plans AG2.0 from BLGGT §2.1 and A.2, ACC+ §§1, 2.2.5, 2.3 and 7.1, and Patrikis: dominant weights and (ℤⁿ)_w; regular algebraic of weight a; conjugate self-dual, essentially conjugate self-dual and polarized pairs with the multiplier χ; polarized Galois pairs (r, µ); the l-adic character of an algebraic Hecke character; the sign of the multiplier (with the corrected normalisation, E2); the Hodge–Tate multiset of a weight; the Hecke polynomial with the Satake factorisation and the geometric/arithmetic and twist dictionary; attachment at good places; and the field of rationality M_π, kept separate from a field of realisation.
  - Remaining: The acceptance example 'a unitary similitude coefficient with nontrivial central character' is not planned; it needs the coefficient systems of HLTT's G_n (their §§2–3), not read.
  - Remaining: Clozel's rationality theorem is requested from AutomorphicFormsOnReductiveGroups AF.4, not re-proved; its source (Clozel, Motifs et formes automorphes) is not public and was not read.
  - Remaining: The unitary Satake normalisation t_{v,i} = q^{i(n−i)/2} e_i(α) is requested from IHG.3, whose packet has no IHG.3 nodes yet.
  - Remaining: The C-algebraic/L-algebraic distinction is left to AF.4 and is only referenced.
  - Remaining: Placement: the carried node the-normalization-dictionary-fixed-by-the-sources compares rec-normalisations and is AG2.5-side material (reviewer note); it now points to the AG2.0 dictionary node that avoids local Langlands.
- **AutomorphicGaloisRepresentationsPartII:AG2.1** (not_read).
  - Remaining: This stage is the aggregate of AG2.1a and AG2.1b and has no independent content; no node was written for it. It should be marked complete only when both components are.
- **AutomorphicGaloisRepresentationsPartII:AG2.1a** (partial).
  - Remaining: Only the statements of what the polarized construction supplies were read. The finite-level etale cohomology with the algebraic local system, the Kuga-Sato powers, the algebraic correspondences and projectors, the Schur functor, Tate twist, parity and degree, and the raw fixed-point/nearby-cycle trace identities were NOT read.
  - Remaining: Shin's papers, which supply the n odd and slightly regular cases, were not read; Shin_GaloisCompact.pdf and Shin_StableIgusa.pdf are in the library and were not opened.
  - Remaining: Chenevier-Harris's own Sections 1-3 were not read; only their introduction.
  - Remaining: Placement: the node polarized-construction-inputs-shin-and-chenevier-harris states results after local Langlands (Chenevier-Harris Theorem 3.2.3), which the atlas assigns to AG2.2/AG2.5/AG2.6, not to AG2.1a (raw cohomology before local Langlands).
- **AutomorphicGaloisRepresentationsPartII:AG2.1b** (not_read).
  - Remaining: No node written. The virtual-character comparison with the geometric trace formula, the separation of actual representations from alternating classes, the Igusa-variety route and the purity/weight-separation/multiplicity/cancellation arguments were not read. Next source action: read Shin, 'Galois representations arising from some compact Shimura varieties' (references/papers/Shin_GaloisCompact.pdf, in the library with extracted text) and Chenevier-Harris Section 3.
- **AutomorphicGaloisRepresentationsPartII:AG2.2** (not_read).
  - Remaining: No node written. Stable unitary base change, the endoscopic character identities, the rank and multiplicity formulas, and the descent for essentially conjugate self-dual forms were not read. Next source action: read Chenevier-Harris Section 2 and the trace-formula sources assigned to EndoscopicTransferAndUnitaryTraceComparison (EXT-11).
  - Remaining: HLTT apply the polarized construction to discrete (not necessarily cuspidal) representations of GL_2n; Chenevier-Harris Theorem 3.2.3 as read concerns cuspidal Pi, so the discrete case is an unread AG2.2 input of AG2.4.
- **AutomorphicGaloisRepresentationsPartII:AG2.3** (not_read).
  - Remaining: No node written. Definite-unitary eigenvarieties, the Fredholm/slope machinery, classicality regions, density of strongly regular classical points and the determinant interpolation were not read. Next source action: read Chenevier's eigenvariety papers - references/text/R02_KI_BuzzardEigenvarieties.txt is in the library and is a related source that was not opened.
- **AutomorphicGaloisRepresentationsPartII:AG2.4** (partial).
  - Remaining: Only the introduction of the non-self-dual source was read. Its Sections 1-7, containing the construction of the dagger spaces, the overconvergent logarithmic de Rham complex, the finite-slope theory, the boundary/Levi inclusion and the Katz congruence argument, were not read; Corollary 7.14, which is Theorem A, was not opened.
  - Remaining: The toroidal and minimal compactifications and the canonical/subcanonical extensions were read only as named objects; Lan's compactification book (references/papers/R02_Lan_PELCompactifications.pdf, in the library) was not opened.
- **AutomorphicGaloisRepresentationsPartII:AG2.5** (partial).
  - Remaining: Varma's Sections 2 onwards, containing the Bernstein-centre interpolation and the nilpotent-orbit bounds, were not read; only the introduction.
  - Remaining: Caraiani's nearby-cycle analysis and generalized weight spectral sequence were not read; only the abstracts and introductions of her two papers.
  - Remaining: Taylor-Yoshida, whose structure of argument both papers follow, was not read and is not in the supplied library under that name (checked CATALOGUE.json).
  - Remaining: Chenevier's [Ch] (Une application des varietes de Hecke des groupes unitaires), where the dominance order is defined, is not in the supplied library; Chenevier-Harris only state that rho < rho' implies s = s' and N in the Zariski closure of the conjugacy class of N'.

## Gaps

- **Only introductions were read for all five construction and comparison sources** (needed by `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`, `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound`, `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`). Verified: the main theorems of all five sources, their hypotheses, their normalizations, the case divisions between them, and the strategy sketches the authors give. NOT verified: any proof. All five files ARE in the supplied library with usable extracted text (references/text/SS_HLTT.txt, SS_ChenevierHarris.txt, SS_VarmaLocalGlobal.txt, SS_CaraianiMonodromyAway.txt, SS_CaraianiMonodromyAtP.txt), so these are reading gaps, not availability gaps. Next source action, in order of leverage: the non-self-dual source's Sections 5-7 (the overconvergent complex and the congruence argument), Varma's Section 2 (the Bernstein-centre interpolation), and Caraiani's Sections 2-4 (the nearby-cycle monodromy computation).
- **The partial order on Weil-Deligne representations is used but not defined in any source read** (needed by `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound`). Verified: two sources state their main comparison using a partial order '<' on Weil-Deligne representations, and one of them attributes its definition to 'the partial ordering ... defined in [Ch] section 3.1'. NOT verified: that definition. The stage AG2.5 explicitly requires implementing 'the partial order on nilpotent monodromy types', so this is a stated obligation with no source read. Searched the supplied library: the reference [Ch] is Chenevier's own earlier paper, and the Chenevier item present is references/papers/chenevier-determinants.pdf, which is the determinants paper and does NOT contain a section 3.1 on Weil-Deligne partial orders (checked its section headings). Next source action: obtain Chenevier, 'On the infinite fern of Galois representations of unitary type' (or whichever paper is [Ch]) and read its section 3.1; alternatively read the definition through the nilpotent orbit closure order as used in Varma. Reviewer update: Chenevier-Harris's bibliography identifies [Ch] as Chenevier, 'Une application des varietes de Hecke des groupes unitaires' (in the Paris book project on the stabilization of the trace formula), not the determinants paper and not the infinite-fern paper; it is not in the supplied library. Chenevier-Harris state before their Theorem 2.3 that rho < rho' 'implies that s = s' and that N is in the Zariski-closure of the conjugacy class of N''. That is an implication, not the definition.
- **Taylor-Yoshida, whose argument structure both upgrade papers follow, is absent** (needed by `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`). Verified: both Caraiani papers state that they follow the strategy of Taylor-Yoshida, and that Taylor-Yoshida assumed Pi square-integrable at a finite place. NOT verified: the Taylor-Yoshida argument. Searched the supplied library: CATALOGUE.json has no record for Taylor-Yoshida, 'Compatibility of local and global Langlands correspondences', J. Amer. Math. Soc. 20 (2007); Harris-Taylor, 'The Geometry and Cohomology of Some Simple Shimura Varieties', appears as a catalogue entry with NO resolved file. Next source action: obtain Taylor-Yoshida and Harris-Taylor; without them the purity argument's structure cannot be checked.
- **AG2.1b, AG2.2 and AG2.3 have no nodes at all** (needed by `AutomorphicGaloisRepresentationsPartII:AG2.1b`, `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.3`, `AutomorphicGaloisRepresentationsPartII:AG2.1`). Verified: nothing for these three stages. They concern, respectively, the separation of automorphic constituents from the geometric trace formula, stable base change and endoscopic character identities, and definite-unitary eigenvarieties. None of the sources read covers them: the construction papers cite the trace-formula results rather than proving them, and the eigenvariety construction is explicitly NOT carried out in the non-self-dual source ('Alternatively it is presumably possible to construct an eigenvariety in this setting, but we have not carried this out'). Next source action: Shin_GaloisCompact.pdf and Shin_StableIgusa.pdf are in the library for AG2.1b; the endoscopy sources belong to EndoscopicTransferAndUnitaryTraceComparison, owned by EXT-11, and this job should coordinate rather than duplicate.
- **Stage placement of the normalization and polarized-construction nodes** (needed by `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.0`, `AutomorphicGaloisRepresentationsPartII:AG2.1a`). Verified by reading the atlas descriptions: AG2.0 is to build a normalization dictionary that 'does not use an established local Langlands correspondence', with agreement with rec(pi_v tensor |det|^{(1-n)/2}) proved in AG2.5; AG2.1a is 'raw cohomology before local Langlands'. The two nodes filed there record rec-normalized comparisons, de Rham and crystalline conclusions - AG2.2/AG2.5/AG2.6 material. The links from them (to the HLTT and Caraiani nodes) are consistent with the atlas order only transitively. Orchestrator decision: re-home the two nodes (node ids would change) or amend their parentStageIds before integration.
- **Cuspidal versus discrete input to the HLTT construction** (needed by `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`, `AutomorphicGaloisRepresentationsPartII:AG2.2`). Verified: HLTT's introduction attaches Galois representations to classical cusp forms on G_n by lifting them to polarizable regular algebraic DISCRETE automorphic representations of GL_2n(A_F) ([Sh2]) and applying [Sh1] and [CH]; Varma's summary says these are isobaric sums of conjugate self-dual cuspidal representations. Chenevier-Harris Theorem 3.2.3 as read is for cuspidal Pi. Not verified: the statement for discrete/isobaric parameters that HLTT actually consume. Next source action: read Shin's cohomological base change appendix [Sh2] and HLTT section 7 where the classical forms are treated.

## Source issues

- **AutomorphicGaloisRepresentationsPartII/E1** (misprint; Potential automorphy and change of weight, §2.1, definition of a polarized automorphic representation, p. 32; affects nothing; known: new: present in arXiv v4 (9 December 2013, the last version) and in R. Taylor's copy pa3.pdf; the Annals text was not obtained). Printed: “In the case that F is imaginary we further suppose that µv(−1) = (−1)n for all v|∞. (This last condition can always be achieved by replacing µ by µδF/F +.)” Correction: χ_v(−1) … replacing χ by χδ_{F/F⁺}: the character of a polarized automorphic pair (π, χ) is χ; µ is the Galois multiplier of the Galois-side definition on p. 31, from which the sentence was carried over. Reason: The definition introduces only π and χ; no µ is in scope, and the next paragraph speaks of a character µ with (π, µ) polarized, again meaning χ.
- **AutomorphicGaloisRepresentationsPartII/E2** (error; Potential automorphy and change of weight, §2.1, p. 32 (sign normalisation) and Theorem 2.1.1(1) with its proof, pp. 33–34; affects a stated result; known: new as a correction of BLGGT; the relation with (−1)^w is implicit in Patrikis 2015, who does not comment on BLGGT's CM normalisation). Printed: “(p. 32) In the case that F is imaginary we further suppose that µv(−1) = (−1)n for all v|∞. (p. 33) (rl,ı(π), ǫ1−n l rl,ı(χ)) is a totally odd, polarized l-adic representation. (p. 34) When F is CM, note that by definition ǫ1−n l rl,ı(χ) takes every complex conjugation to −1.” Correction: For F imaginary and (π, χ) regular algebraic of weight a ∈ (ℤⁿ)_w, the normalisation making (r_{l,ι}(π), ε_l^{1−n} r_{l,ι}(χ)) totally odd is χ_v(−1) = (−1)^{n+w}. Equivalently, ε_l^{1−n} r_{l,ι}(χ)(c_v) = (−1)^{n−1+w} χ_v(−1), so the printed (−1)^n is right exactly when w is even. The stated result affected is Theorem 2.1.1(1) for odd w; the theorem holds for every polarizable π after replacing χ by χδ_{F/F⁺}, so no result about polarizable π is lost. Reason: χ is algebraic on the totally real F⁺ with wt(χ) = 2w (compare infinitesimal characters in π^c ≅ π^∨ ⊗ χ∘N∘det). By BLGGT A.2, r_{l,ι}(χ) = r_{l,ι}(χ₀) ε_l^{−w} with χ₀ of finite order, so r_{l,ι}(χ)(c_v) = (−1)^w χ_v(−1), and µ(c_v) = (−1)^{n−1+w} χ_v(−1). Counterexample for w odd: n = 1, F imaginary quadratic, ψ the Hecke character of a CM elliptic curve (weight (1, 0)). (ψ, ψ|_{𝔸_ℚ}) satisfies the printed conditions, since ψ|_{𝔸_ℚ} has sign (−1)^1 at ∞. But r_{l,ι}(ψ|_{𝔸_ℚ}) = r_{l,ι}(ψ)∘V (V the transfer) takes c to r_{l,ι}(ψ)(c²) = 1, so µ(c) = +1. A pairing on a line is symmetric, so (r_{l,ι}(ψ), µ) is not polarized, let alone totally odd. The same happens for the base change of a newform of odd weight k (w = k − 2). Patrikis (Math. Ann. 362, p. 8 of arXiv v2) gives the general sign as ω_ι(c_v) = (−1)^w ω_v(−1), consistent with this correction.

## Sources

- **Potential automorphy and change of weight**, Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor. arXiv:1010.2561v4, 9 December 2013, the last arXiv version (published Annals of Math. 179 (2014), 501–609). Printed page = PDF page. R. Taylor's copy pa3.pdf has the same text in §2.1 https://arxiv.org/pdf/1010.2561v4 (SHA-256 c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24). Read: Introduction: Theorems A–D, pp. 1–6; Notation: Artin normalisation, rec, HT_τ(ε_l) = {−1}, algebraic characters, pp. 8–10; §2.1 Terminology: polarized l-adic and mod l representations, totally odd, algebraic, polarized automorphic representations, (ℤⁿ)_w, extremely regular, Ξ_a, weight, ι-ordinary, Theorem 2.1.1 with its proof and remarks, pp. 31–34; §5.1 remark on the weights of r_{l,ι}(χ), p. 65; Theorem 5.5.1's proof and the remark before Theorem 5.5.2, p. 81; Appendix A.2: algebraic characters and their weights (1)–(8), Lemmas A.2.1–A.2.5, pp. 87–90.
- **Potential automorphy over CM fields**, Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne. Annals of Mathematics 197 (2023), 897–1113; the authors' copy Ramanujan.pdf, which carries the journal pagination (printed page = PDF page + 896) https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf (SHA-256 c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02). Read: Earlier decomposition: 4.3 Definition 4.3.1 and Lemma 4.3.2 (pp. 972–973); 6.2.28–6.2.31 (pp. 1044–1045); cc-fb70e5, 2026-09-29 (part AG2.0, checkpoint 1): §1 notation (Artin and rec normalisations, rec^T, algebraic characters, regular algebraic of weight ξ, totally odd), pp. 906–909; §2.2.5 with (2.2.6)–(2.2.7), pp. 921–922; Theorems 2.3.2–2.3.3, pp. 935–936; Definition 2.3.6 and the contragredient remark after it, p. 938; §7.1 up to Lemma 7.1.9, p. 1093; Corollary 7.2.4, p. 1100.
- **On the sign of regular algebraic polarizable automorphic representations**, Stefan Patrikis. arXiv:1306.1242v2, 8 July 2014 (published Math. Ann. 362 (2015), 147–171). Printed page = PDF page https://arxiv.org/pdf/1306.1242v2 (SHA-256 2bfa2a6a00a94465725cd7b0e48d64eef1fed4113a6be4b246a015e7927259f8). Read: §1 and §2: Theorem 2.1 and the construction of ρ_{Π,ι} after it, pp. 1–8; the remark on polarizable representations over CM fields, p. 9.
- **On the rigid cohomology of certain Shimura varieties**, Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne. Author's copy rigcoh.pdf (published in Res. Math. Sci. 3 (2016)); read from the supplied extracted text references/text/SS_HLTT.txt. Locators give the article's own page numbers and result numbers https://www.kwlan.org/articles/rigcoh.pdf (SHA-256 abecfd049d617654dd0bb60e4945bf6967d3953ed20f2126de0624f2bd0bdbc7). Read: Abstract and Introduction: Theorem A (quoted there as Corollary 7.14), the remark on extending local-global compatibility, the sketch of the argument including the group G_n, its maximal parabolic and Levi, the induced representation Pi(N), the realization in overconvergent p-adic cusp forms of finite slope, Katz's congruence argument, and the dagger-space set-up with the ordinary loci and the subcanonical sheaf, pp. 1-3; Reviewer (REVIEW-EXT-10-EXT-07): abstract and introduction pp. 1-3 (the displayed 2n-dimensional decomposition checked on the page image of p. 2), bibliography entries [CH], [Sh1], [Sh2].
- **Construction of automorphic Galois representations, II**, Gaetan Chenevier and Michael Harris. Author's copy ConstructionII.pdf (published in Camb. J. Math. 1 (2013), 53-73); read from the supplied extracted text references/text/SS_ChenevierHarris.txt. Locators give the article's own page and result numbers https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf (SHA-256 9b5e76798f75273f53d1d4160f35815b1a3b656f04c965ad47fd4fa454840529). Read: Introduction: the setting (F totally real, K/F totally imaginary quadratic, G = Res_{K/Q} GL(n)), and the main theorem quoted there as Theorem 3.2.3 with its parts (a), (b), (c), p. 1; Reviewer (REVIEW-EXT-10-EXT-07): introduction pp. 1-2 and the paragraph before Theorem 2.3 describing the dominance relation (it implies s = s' and N in the Zariski closure of the conjugacy class of N'), bibliography entry [Ch] = Chenevier, Une application des varietes de Hecke des groupes unitaires; cc-fb70e5, 2026-09-29: §4, General Hypotheses 4.1 and Theorem 4.2 (totally real fields), p. 13.
- **Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p**, Ila Varma. arXiv:1411.2520v1, 10 November 2014; read from the supplied extracted text references/text/SS_VarmaLocalGlobal.txt. Locators give the arXiv version's own page numbers https://arxiv.org/pdf/1411.2520 (SHA-256 24076dfcc6ca9b9e3168efb0150e75d5200f66e64085625b3e52895cfd1e56ef). Read: Abstract, p. 1; 1 Introduction: the setting, the known unramified compatibility, Theorem (1^ss), Theorem (1) with the partial order, and the summary of the proof strategy through the Bernstein centre, pp. 1-2; Reviewer (REVIEW-EXT-10-EXT-07): abstract and introduction pp. 1-3 including the construction of the pseudorepresentation T, bibliography entries [9] = HLTT, [10] = Harris-Taylor, [16] = Scholze.
- **Local-global compatibility and the action of monodromy on nearby cycles**, Ana Caraiani. arXiv:1010.2188v1, 11 October 2010 (published Duke Math. J. 161 (2012)); read from references/text/SS_CaraianiMonodromyAway.txt. Locators give the arXiv version's page numbers https://arxiv.org/pdf/1010.2188 (SHA-256 769e68e2384b42caf16861d9011b35afe48018eba006074ce0d6c4111451f3b3). Read: Abstract and 1 Introduction: Theorem 1.1, Theorem 1.2 (Ramanujan-Petersson), the statement of what was already known, and the strategy (realizing R_l(Pi)^{tensor 2} in the cohomology of a unitary Shimura system and proving purity by computing the monodromy operator), pp. 1-2; Reviewer (REVIEW-EXT-10-EXT-07): abstract and introduction pp. 1-3.
- **Monodromy and local-global compatibility for l = p**, Ana Caraiani. arXiv:1202.4683v1, 21 February 2012 (published Algebra Number Theory 8 (2014)); read from references/text/SS_CaraianiMonodromyAtP.txt. Locators give the arXiv version's page numbers https://arxiv.org/pdf/1202.4683 (SHA-256 6ec698414d5d3ad03f3d1c98de178b39d69722699f4a08a059e8d14027df885e). Read: Abstract and 1 Introduction: Theorem 1.1, the statement of what was known from Barnet-Lamb-Gee-Geraghty-Taylor and what is new, and the announcement of a generalization of Mokrane's weight spectral sequence for log crystalline cohomology, p. 1; Reviewer (REVIEW-EXT-10-EXT-07): abstract and introduction pp. 1-2, including the use of Theorem 1.2 of [C] and of Lemma 1.4(4) of Taylor-Yoshida.
