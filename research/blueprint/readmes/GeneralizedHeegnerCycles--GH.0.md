# Generalized Heegner cycles and their Iwasawa variation: stages GH.0–GH.7

## Purpose

This document plans part GH.0 of `GeneralizedHeegnerCycles`. The part runs from the geometry that carries generalized Heegner cycles, the variety X_r = W_r × A^r with its projectors (GH.0), through the cycles, their Abel–Jacobi images and local conditions (GH.1–GH.4), to Kolyvagin systems, Selmer consequences and Hida-family variation (GH.5–GH.7).

Checkpoint 1 plans GH.0 from Bertolini–Darmon–Prasanna (BDP) §§1.4 and 2.1–2.2. Checkpoint 2 plans the core of GH.1 from BDP §§2.3 and 3.1–3.4: the cycles Δ_φ, their field of definition and homological triviality, and the étale and p-adic Abel–Jacobi maps.

## Scope and boundaries

The RS-06 owner table (accepted) assigns the finite-level modular universal-family cohomological carrier (the Kuga–Sato variety W_r, its projector ε_W and the symmetric-power local systems) to ModularCurvesPartII R14.3, which formerly sat under GH.0. GH.0 imports W_r and ε_W from there and keeps the CM factor A^r, the combined projector ε_X, and the identification of ε_X H^{2r+1}(X_r).

GH.1 imports the following:
- the CM descent, from HeegnerPointEulerSystems HE.1;
- cycle classes and the Gysin sequence, from EtaleDualityAndPerverseSheaves EDC.3;
- Galois cohomology, from SelmerIwasawaCohomology L0;
- Faltings' crystalline comparison, D_cris and Nekovář's H¹_f theorem, from PadicHodgeTheory R06.2, R06.5 and R06.6.

The GeneralizedHeegnerCycles family is not in an accepted restructure. RS-04 mentions it and has no accepted review, so the current structure is used.

## Conventions

- K is imaginary quadratic with Hilbert class field H. A/H has End_H(A) = O_K, with [α]^*ω = αω on differentials.
- C = X₁(N) with N > 4. W_r is the canonical desingularization of the r-fold fibre product of the universal generalized elliptic curve. X_r = W_r × A^r, of dimension 2r + 1.
- ε_A = (1/(2^r r!)) Σ_{ξ∈Ξ_r} j(ξ)ξ and ε_X = ε_W ε_A, with denominators inverted in ℤ[1/(2N·r!)].
- Δ_φ = ε_X Υ_φ, with Υ_φ = Graph(φ)^r.
- AJ^et takes values in H¹(F, ε_X H^{2r+1}(X̄_r, ℚ_p)(r + 1)), and AJ_F in (S_{r+2} ⊗ Sym^r H¹_dR(A))^∨.

## GH.0 Kuga–Sato geometry and coefficient projectors

### Objects

#### Definition. The CM elliptic curve A and the algebraic splitting of H¹_dR(A)

*Module* `TauCeti/GeneralizedHeegner/CMCurve.lean`. *Node* `GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting`.

Let K be an imaginary quadratic field with ring of integers O_K and Hilbert class field H, and A an elliptic curve over H with End_H(A) ≅ O_K, normalized so that [α] acts on Ω¹_A by multiplication by α. For every field F ⊇ H, H¹_dR(A/F) = H^{1,0} ⊕ H^{0,1} canonically and functorially: H^{1,0} = Ω¹_{A/F}, and H^{0,1} is the line on which [α]^* acts by ᾱ. A choice of nonzero ω_A ∈ Ω¹_{A/F} determines the generator η_A of H^{0,1} with ⟨ω_A, η_A⟩ = 1 for the algebraic cup-product pairing. Over ℂ the splitting is the Hodge decomposition, and over a p-adic field with A ordinary it is the unit-root decomposition.

*Hypotheses.*

- The normalization of the O_K-action is on differentials: [α]^*ω = αω. The opposite normalization swaps H^{1,0} and H^{0,1}.
- Existence of A over H with End_H(A) = O_K, and its descent, are HeegnerPointEulerSystems HE.1's and ComplexMultiplicationAndExplicitReciprocity CM.1's.

*API.*

- `CMCurve` (*structure*) — CMCurve K H : an elliptic curve A over H with an isomorphism O_K ≃ End_H(A) acting on Ω¹ by the identity character.
- `CMCurve.h10` (*constructor*) — h10 A F = Ω¹_{A/F} ⊆ H¹_dR(A/F).
- `CMCurve.h01` (*constructor*) — h01 A F, the ᾱ-eigenline of O_K on H¹_dR(A/F).
- `CMCurve.hodgeSplitting` (*equivalence*) — H¹_dR(A/F) = h10 A F ⊕ h01 A F.
- `CMCurve.etaOfOmega` (*constructor*) — etaOfOmega ω ∈ h01 with ⟨ω, etaOfOmega ω⟩ = 1.

*Used by.*

- `GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power` — the eigenbasis ω^jη^{r−j} of Sym^r H¹(A)
- `GeneralizedHeegnerCycles:GH.0/cm-character-decomposition` — the characters of O_K on Sym^r H¹(A)
- `GeneralizedHeegnerCycles:GH.1` — the CM point P_A and the isogeny graphs Graph(φ) ⊂ A × A′

*Unit tests.* A wrong definition fails one of these.

- `cmCurve_i_action` (value) — For A = ℂ/O_K with K = ℚ(i): [i] acts by i on Ω¹ and by −i on H^{0,1}.
- `hodgeSplitting_eigen` (characterisation) — The splitting is the O_K-eigenspace decomposition: any O_K-stable line in H¹_dR(A/F) is h10 or h01.
- `not_split_without_cm` (non-example) — For an elliptic curve without CM there is no canonical algebraic complement of Ω¹ in H¹_dR over ℚ̄: the Hodge complement is transcendental in general.
- `hodgeSplitting_baseChange` (degenerate) — The splitting commutes with extension of F.

*Construction.*

1. O_K acts on H¹_dR(A/F) through the two characters α and ᾱ, which are distinct since K is imaginary quadratic. The two eigenlines split the space, and the α-eigenline is Ω¹, because [α]^* acts on differentials by α.
2. Functoriality: morphisms commuting with O_K preserve the eigenlines.
3. Over ℂ, H^{0,1} = conj(Ω¹) is the ᾱ-eigenline, and over ℂ_p for ordinary A the unit-root line is O_K-stable and different from Ω¹.

*Acceptance.*

- A = ℂ/O_K for K = ℚ(i): [i]^* dz = i dz on Ω¹, and [i]^* dz̄ = −i dz̄ on H^{0,1}.

*Uses.* `HeegnerPointEulerSystems:HE.1`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §1.4, p. 1051: “Let A be a ﬁxed elliptic curve” A over H with End_H(A) ≅ O_K.
- Generalized Heegner cycles and p-adic Rankin L-series, §1.4, (1.4.1), p. 1051: “admits a canonical, functorial algebraic splitting” The algebraic splitting of H¹_dR(A/F).
- Generalized Heegner cycles and p-adic Rankin L-series, §1.4, (1.4.2), p. 1052: “denotes the algebraic cup product pairing on de Rham cohomology” ⟨ω_A, η_A⟩ = 1.

#### Construction. The projector ε_A on A^r and Lemma 1.8

*Module* `TauCeti/GeneralizedHeegner/Projectors.lean`. *Node* `GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power`.

Let Ξ_r = μ_2^r ⋊ S_r act on A^r, with μ_2 acting through [±1] on each factor and S_r permuting factors. Let j : Ξ_r → μ_2 be the identity on each μ_2 and the sign on S_r, and ε_A = (1/(2^r r!)) Σ_{ξ ∈ Ξ_r} j(ξ)ξ ∈ ℚ[Aut(A^r)]. Then ε_A is an idempotent with ε_A H^j_dR(A^r/F) = 0 for j ≠ r and ε_A H^r_dR(A^r/F) = Sym^r H¹_dR(A/F) inside H¹_dR(A)^{⊗r}. The same holds for étale and Betti cohomology.

*Hypotheses.*

- The denominator 2^r r! must be inverted. ε_A is not in ℤ[Aut(A^r)], so an integral projector needs 2 and r! invertible.
- The sign twist on S_r is essential. By the Koszul rule, geometric permutations act on H¹^{⊗r} with the sign, so the twisted sum is the symmetrization. Without the twist the sum projects to ∧^r H¹, which vanishes for r ≥ 3.
- Only μ_2 ⊂ O_K^× is used. For K = ℚ(i) or ℚ(√−3) the larger unit group gives further characters, which the node cm-character-decomposition records.

*API.*

- `epsA` (*constructor*) — epsA A r : Correspondence (A^r) (A^r) ⊗ ℚ, the idempotent (1/(2^r r!)) Σ j(ξ)ξ.
- `epsA_idem` (*simp*) — epsA A r * epsA A r = epsA A r.
- `epsA_image` (*characterisation*) — (epsA A r).action (H^j_dR(A^r)) = if j = r then Sym^r H¹_dR(A) else 0.
- `epsA_denominator` (*characterisation*) — (2^r * r!) • epsA A r ∈ the integral group ring ℤ[Aut A^r].

*Used by.*

- `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector` — ε_X = ε_W ε_A
- `GeneralizedHeegnerCycles:GH.0/cm-character-decomposition` — the image Sym^r H¹(A)
- `GeneralizedHeegnerCycles:GH.1` — projecting the cycles Υ_φ to Δ_φ = ε_X Υ_φ

*Unit tests.* A wrong definition fails one of these.

- `epsA_r_one` (value) — r = 1: ε_A = (1 − [−1])/2 projects H^*(A) onto H¹(A).
- `epsA_r_zero` (degenerate) — r = 0: ε_A = 1 on A⁰ = Spec F.
- `untwisted_average_kills_H1` (non-example) — The untwisted average (1/(2^r r!)) Σ ξ over μ_2^r ⋊ S_r kills H¹^{⊗r} for r ≥ 1 (the μ_2 part averages ±1 to 0), so it is not the right projector.
- `epsA_dim` (value) — dim ε_A H^r_dR(A^r) = r + 1.

*Construction.*

1. Idempotence: j is a character of Ξ_r, so ε_A = (1/|Ξ_r|) Σ j(ξ)ξ is the idempotent of the character j in ℚ[Ξ_r].
2. Künneth: H^*(A^r) = ⊕ H^{i_1} ⊗ … ⊗ H^{i_r}, and [−1] acts on H^i by (−1)^i. So the μ_2^r-part of ε_A kills every summand with some i_k ≠ 1, leaving H¹^{⊗r}.
3. On H¹^{⊗r}, the geometric action of σ ∈ S_r is sgn(σ) times the permutation of tensor factors (odd classes anticommute). The j-twisted average is therefore the symmetrizer, with image Sym^r H¹.
4. Correspondences: ε_A is an element of the ring of correspondences on A^r with ℚ-coefficients, acting on every cohomology theory by functoriality (MotivicEtaleKTheory M.4).

*Acceptance.*

- r = 2: ε_A H²(A²) = Sym² H¹(A), of dimension 3, while H²(A²) has dimension 6.

*Uses.* `GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting`, `MotivicEtaleKTheory:M.4`.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §1.4, (1.4.4), p. 1052: “denote the associated idempotent in the rational group ring of” ε_A = (1/2^r r!) Σ j(ξ)ξ.
- Generalized Heegner cycles and p-adic Rankin L-series, §1.4, Lemma 1.8, p. 1052: “The image of the projector” ε_A H^*(A^r) = Sym^r H¹(A), in degree r.
- Generalized Heegner cycles and p-adic Rankin L-series, §1.4, p. 1052: “classes which are ﬁxed by this action” Sym^r as the S_r-fixed tensors.

#### Construction. The variety X_r = W_r × A^r and the projector ε_X = ε_W ε_A

*Module* `TauCeti/GeneralizedHeegner/KugaSato.lean`. *Node* `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`.

Let N > 4, C = X₁(N) over F ⊇ H, and W_r the canonical desingularization of the r-fold fibre product of the universal generalized elliptic curve over C, with its projector ε_W = ε_W^{(2)} ε_W^{(1)} (imported from ModularCurvesPartII R14.3). Set X_r = W_r × A^r. It is smooth and proper of dimension 2r + 1 over F, with a proper map π_r : X_r → C whose fibres over the non-cuspidal locus C⁰ are E^r × A^r. The idempotents ε_W and ε_A commute and preserve the fibres of π_r, and ε_X := ε_W ε_A is an idempotent in the ring of correspondences on X_r with coefficients in ℤ[1/(2N·r!)]. Transposition of correspondences fixes ε_X.

*Hypotheses.*

- The denominators are those of ε_W^{(1)} (N^r), ε_W^{(2)} (2^r r!) and ε_A (2^r r!), so ε_X is integral after 2N·r! is inverted. The atlas asks for this record before an integral projector is asserted.
- Characteristic 0 only: the desingularization and smoothness of W_r are used over F ⊇ H of characteristic 0, as imported. The integral model over ℤ[1/N] (Conrad's appendix) is not used here.
- N > 4 makes the universal generalized elliptic curve over X₁(N) exist as a scheme.

*API.*

- `X` (*constructor*) — X r : smooth proper variety over F, X r = W r ×_F A^r.
- `X.proj` (*constructor*) — X.proj r : X r ⟶ C, with fibres E^r × A^r over C⁰.
- `epsX` (*constructor*) — epsX r = epsW r * epsA A r : Correspondence (X r) (X r) ⊗ ℤ[1/(2N·r!)].
- `epsX_idem` (*simp*) — epsX r * epsX r = epsX r.
- `epsX_transpose` (*simp*) — (epsX r).transpose = epsX r.
- `epsW_epsA_comm` (*compatibility*) — epsW r * epsA A r = epsA A r * epsW r.

*Used by.*

- `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety` — the image of ε_X on cohomology
- `GeneralizedHeegnerCycles:GH.1` — the generalized Heegner cycles Δ_φ = ε_X Υ_φ on X_r
- `GeneralizedHeegnerCycles:GH.4` — the p-adic Abel–Jacobi map on ε_X H^{2r+1}

*Unit tests.* A wrong definition fails one of these.

- `X_dim` (value) — dim X r = 2r + 1; X 1 is a threefold.
- `X_zero` (degenerate) — X 0 = C and epsX 0 = 1.
- `epsX_not_integral` (non-example) — For r ≥ 1, epsX r is not integral: 2N·r! must be inverted (already epsA A 1 = (1 − [−1])/2 has denominator 2).
- `epsX_fibre` (characterisation) — Over a non-cuspidal point P of C, X r has fibre E_P^r × A^r and epsX restricts to epsW(E_P^r) × epsA.

*Construction.*

1. X_r is a product of smooth proper F-varieties, so it is smooth and proper of dimension (r + 1) + r.
2. π_r = (W_r → C) ∘ pr_1, whose fibres are those of W_r times A^r.
3. ε_W acts on the first factor and ε_A on the second, so they commute, and both preserve the fibres of π_r.
4. Transpose: the transpose of Σ c_g·g is Σ c_g·g⁻¹, and the coefficient functions of ε_W^{(1)}, ε_W^{(2)} and ε_A are invariant under g ↦ g⁻¹ (j(ξ⁻¹) = j(ξ)), so ε_X^t = ε_X.

*Acceptance.*

- r = 0: X_0 = W_0 = C, and ε_X = 1.
- r = 1: X_1 = E × A, of dimension 3, a threefold fibred over X₁(N).

*Uses.* `GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power`, `ModularCurvesPartII:R14.3`, `MotivicEtaleKTheory:M.4`.

*Planet:* Generalized Kuga–Sato variety.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §2.2, p. 1060: “Like the Kuga–Sato variety” X_r = W_r × A^r, fibred over C.
- Generalized Heegner cycles and p-adic Rankin L-series, §2.2, (2.2.1), p. 1061: “give rise to commuting idempotents in the ring of correspondences on” ε_X = ε_W ε_A with commuting factors.
- Generalized Heegner cycles and p-adic Rankin L-series, §2.1, (2.1.2), p. 1057: “deﬁnes a projector in the ring of rational correspondences on Wr” The projector ε_W.

### Theorems

#### Theorem. The eigenbasis ω_A^jη_A^{r−j} of Sym^r H¹_dR(A) and its O_K-characters

*Module* `TauCeti/GeneralizedHeegner/Projectors.lean`. *Node* `GeneralizedHeegnerCycles:GH.0/cm-character-decomposition`.

For 0 ≤ j ≤ r, the classes ω_A^jη_A^{r−j} := ε_A(p_1^*ω_A ∧ … ∧ p_j^*ω_A ∧ p_{j+1}^*η_A ∧ … ∧ p_r^*η_A) form a basis of ε_A H^r_dR(A^r/F) = Sym^r H¹_dR(A/F). The diagonal action of α ∈ O_K on A^r acts on ω_A^jη_A^{r−j} by α^jᾱ^{r−j}. Moreover ω_A^jη_A^{r−j} = (j!(r − j)!/r!) Σ_{|I| = j} p_1^*ϖ_{1,I} ∧ … ∧ p_r^*ϖ_{r,I}, where ϖ_{i,I} = ω_A for i ∈ I and η_A otherwise.

*Hypotheses.*

- The Hodge type of ω^jη^{r−j} is (j, r − j), and Fil^r Sym^r H¹ is spanned by ω^r.
- Rescaling ω_A by λ multiplies ω^jη^{r−j} by λ^{2j−r}, because η_A scales by λ⁻¹. Formulas of GH.4 depend on this normalization.

*Proof.*

1. ε_A applied to a pure tensor of ω's and η's averages over S_r, with the sign twist compensating the Koszul sign. Each subset I with |I| = j arises from j!(r − j)! permutations.
2. The (r + 1) classes are linearly independent, since they have distinct bidegrees (j, r − j) for the O_K-action (for α ∉ ℤ, the characters α^jᾱ^{r−j} are distinct), and dim Sym^r H¹ = r + 1.
3. The O_K-action on p_i^*ω is by α and on p_i^*η by ᾱ (node cm-elliptic-curve-and-its-hodge-splitting).

*Acceptance.*

- r = 2: the basis is ω², ωη, η², with characters α², |α|², ᾱ².

*Uses.* `GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power`, `GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting`.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §1.4, (1.4.6), p. 1053: “form a basis of the vector space” ω^jη^{r−j} form a basis of Sym^r H¹_dR(A).

#### Theorem. BDP Propositions 2.4–2.5: the image of ε_X on the cohomology of X_r

*Module* `TauCeti/GeneralizedHeegner/KugaSato/Cohomology.lean`. *Node* `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`.

Assume r ≥ 1. Then ε_X H^*_dR(X_r) = ε_X H^{2r+1}_dR(X_r) = H¹_par(C, L_r, ∇) ⊗ Sym^r H¹_dR(A). Its Hodge filtration has Fil^{r+1} = H⁰(C, ω^r ⊗ Ω¹_C) ⊗ Sym^r H¹_dR(A), and f ⊗ α ↦ ω_f ∧ α identifies S_{r+2}(Γ₁(N), F) ⊗ Sym^r H¹_dR(A/F) with Fil^{r+1} ε_X H^{2r+1}_dR(X_r/F). The same holds for p-adic étale cohomology: ε_X H^{2r+1}_et(X_{r,F̄}, ℚ_p) ≅ H¹_par(C_{F̄}, 𝕃_r) ⊗ Sym^r H¹_et(A_{F̄}, ℚ_p), Galois-equivariantly, and ε_X kills all other degrees. In particular ε_X H^{2r+2}(X_r) = 0.

*Hypotheses.*

- The ε_W part is Scholl's theorem, ε_W H^*(W_r) = H¹_par(C, L_r) in degree r + 1 (BDP Lemma 2.2), imported from ModularCurvesPartII R14.3 as RS-06's owner of the universal-family carrier.
- The vanishing of ε_X H^{2r+2} is what makes the generalized Heegner cycles homologically trivial (GH.1).

*Proof.*

1. Künneth for X_r = W_r × A^r (SchemeAndStackFoundations SF.2): ε_X H^n(X_r) = ⊕_{a+b=n} ε_W H^a(W_r) ⊗ ε_A H^b(A^r).
2. ε_A H^b = 0 unless b = r, where it is Sym^r H¹(A) (node cm-projector-and-symmetric-power). ε_W H^a = 0 unless a = r + 1, where it is H¹_par(C, L_r) (ModularCurvesPartII R14.3, BDP Lemma 2.2).
3. Hodge filtration: Fil^{r+1} ε_W H^{r+1}(W_r) = H⁰(C, ω^r ⊗ Ω¹_C) = S_{r+2} (BDP Lemma 2.2(3), Corollary 2.3), and Fil^0 Sym^r H¹(A) is everything, so the tensor-product filtration gives Fil^{r+1} as stated.
4. Étale: the same Künneth argument, with the Galois-equivariant comparisons of the imported carrier.

*Acceptance.*

- r = 1: ε_X H³(E × A) = H¹_par(C, L_1) ⊗ H¹(A), of dimension 4·dim S_3(Γ₁(N)), since dim H¹_par(C, L_r) = 2·dim S_{r+2}(Γ₁(N)).

*Uses.* `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`, `GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power`, `ModularCurvesPartII:R14.3`, `SchemeAndStackFoundations:SF.2`.

*Planet:* Cohomology of ε_X X_r.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §2.2, Proposition 2.4, p. 1061: “The image of the projector” ε_X H^*_dR(X_r) = H¹_par(C, L_r, ∇) ⊗ Sym^r H¹_dR(A).
- Generalized Heegner cycles and p-adic Rankin L-series, §2.2, proof of Proposition 2.4, p. 1062: “This follows directly from Lemmas 1.8 and 2.2 in light of the Künneth decomposition” Proof via Künneth.
- Generalized Heegner cycles and p-adic Rankin L-series, §2.2, Proposition 2.5, p. 1062: “induces an identiﬁcation” S_{r+2} ⊗ Sym^r H¹(A) = Fil^{r+1}.

#### Theorem. Self-duality of ε_X H^{2r+1}(X_r)(r + 1)

*Module* `TauCeti/GeneralizedHeegner/KugaSato/Cohomology.lean`. *Node* `GeneralizedHeegnerCycles:GH.0/self-duality-of-the-projected-cohomology`.

Poincaré duality on the smooth proper (2r + 1)-dimensional X_r restricts to a perfect pairing ε_X H^{2r+1}(X_r) × ε_X H^{2r+1}(X_r) → H^{4r+2}(X_r) ≅ ℚ_p(−2r − 1) in étale cohomology (and into F in de Rham). So V := ε_X H^{2r+1}_et(X_{r,F̄}, ℚ_p)(r + 1) is self-dual up to ℚ_p(1): V ≅ V^∨(1). The pairing is the one induced by (2.2.3) on L_{r,r} = L_r ⊗ Sym^r H¹(A). V is the coefficient representation of the generalized Heegner classes, and its f-isotypic part is V_f ⊗ Sym^r H¹(A)(r + 1).

*Hypotheses.*

- ε_X^t = ε_X (node generalized-kuga-sato-variety-and-its-projector) is what makes the pairing restrict to the image.
- The twist (r + 1) is the self-dual twist of a weight 2r + 1 representation: V is pure of weight −1 at good primes.
- The f-isotypic identification uses the Hecke action on H¹_par(C, 𝕃_r) and the newform f's Galois representation V_f, imported from ModularCurvesPartII R14.3.

*Proof.*

1. Poincaré duality on X_r pairs H^{2r+1} with itself into H^{4r+2} = ℚ_p(−2r − 1) (EtaleDualityAndPerverseSheaves EDC.2).
2. For correspondences, ⟨εx, y⟩ = ⟨x, ε^t y⟩, and ε_X^t = ε_X. So ε_X H^{2r+1} is orthogonal to (1 − ε_X)H^{2r+1}, and the pairing restricts to a perfect pairing on ε_X H^{2r+1}.
3. Twisting by (r + 1) turns the target ℚ_p(−2r − 1) into ℚ_p(1).
4. Under node cohomology-of-the-generalized-kuga-sato-variety, the pairing is the tensor product of the pairing on H¹_par(C, L_r) and the one on Sym^r H¹(A), which is (2.2.3).

*Acceptance.*

- r = 0: V = H¹_par(C)(1) = V_p J₁(N), which is self-dual through the Weil pairing.

*Uses.* `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`, `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`, `EtaleDualityAndPerverseSheaves:EDC.2`, `ModularCurvesPartII:R14.3`.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §2.2, (2.2.3), p. 1061: “is equipped with the self-duality” The self-duality of L_{r,r} from Poincaré duality on the fibres.
- Generalized Heegner cycles and p-adic Rankin L-series, §2.3, Proposition 2.7, p. 1063: “is homologically trivial on” Homological triviality from ε_X H^{2r+2} = 0.

### What is missing

- Hecke correspondences on X_r (acting through W_r) and the f-isotypic Hecke idempotent are used through the imported ModularCurvesPartII R14.3 carrier. An explicit node for the Hecke idempotent on ε_X H^{2r+1}, with its denominators, is still to be added.

## GH.1 Algebraic cycles and Abel–Jacobi realizations

### Objects

#### Definition. The sets Isog_c^N(A) of CM isogenies of conductor c with kernel prime to A[N]

*Module* `TauCeti/GeneralizedHeegner/Cycles/Isogenies.lean`. *Node* `GeneralizedHeegnerCycles:GH.1/isogenies-of-conductor-c-prime-to-n`.

Assume the Heegner hypothesis: there is an ideal 𝔑 ⊂ O_K with O_K/𝔑 ≅ ℤ/Nℤ. Fix A with End(A) = O_K and a Γ₁(N)-level structure t_A ∈ A[𝔑] over the field H̃ ⊇ H over which A[𝔑] becomes constant. Isog(A) is the set of isomorphism classes of pairs (φ, A′) with φ : A → A′ an isogeny over K̄. (φ, A′) has conductor c if End(A′) = O_c = ℤ + cO_K. Isog^N(A) consists of the pairs with ker φ ∩ A[N] = 0, and Isog_c^N(A) = Isog_c(A) ∩ Isog^N(A). For (φ, A′) ∈ Isog^N(A), (A′, φ(t_A)) is a Γ₁(N)-structure and determines a point P_{A′} of C = X₁(N). The semigroup P(O_c) of invertible O_c-ideals prime to cN acts on Isog_c^N(A) by 𝔞 ⋆ (φ, A′) = (φ_𝔞φ, A′/A′[𝔞]).

*Hypotheses.*

- The kernel condition ker φ ∩ A[N] = 0 makes φ(t_A) a point of exact order N.
- The conductor c is determined by End(A′), an order of K.

*API.*

- `IsogPair` (*structure*) — IsogPair A : a pair (A′, φ : A ⟶ A′) up to isomorphism under A.
- `IsogPair.conductor` (*constructor*) — conductor : IsogPair A → ℕ, with End A′ ≅ ℤ + conductor · O_K.
- `IsogPair.IsPrimeToN` (*data*) — IsPrimeToN N p : ker p.φ ⊓ A[N] = ⊥.
- `IsogPair.point` (*constructor*) — point (p : IsogPair A) (h : p.IsPrimeToN N) : X₁(N)(K̄), the point (A′, φ(t_A)).
- `IsogPair.idealAction` (*constructor*) — 𝔞 ⋆ p for 𝔞 an invertible O_c-ideal prime to cN.

*Used by.*

- `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle` — the cycles Δ_φ are indexed by Isog_c^N(A)
- `GeneralizedHeegnerCycles:GH.1/field-of-definition-of-generalized-heegner-cycles` — the Galois action on Isog_c^N(A)
- `GeneralizedHeegnerCycles:GH.2` — ring-class traces over P(O_c)-orbits

*Unit tests.* A wrong definition fails one of these.

- `identity_conductor_one` (degenerate) — The identity pair (id, A) has conductor 1 and is prime to N.
- `conductor_of_quotient` (value) — For A = ℂ/O_K, the isogeny z ↦ cz : ℂ/O_K → ℂ/O_c has conductor c, and it is prime to N when (c, N) = 1.
- `not_primeToN_kernel_meets` (non-example) — The isogeny A → A/A[𝔑] is not in Isog^N(A): its kernel is A[𝔑] ⊂ A[N].
- `heegner_hypothesis_i` (value) — For K = ℚ(i) and N = 5, 𝔑 = (2 + i) satisfies O_K/𝔑 ≅ ℤ/5ℤ.

*Construction.*

1. The endomorphism ring of an isogenous curve is an order of K, hence O_c for a unique c ≥ 1.
2. φ is injective on A[N] and t_A has order N, so φ(t_A) has order N.
3. The action: 𝔞 prime to cN gives φ_𝔞 : A′ → A′/A′[𝔞], with kernel prime to N, and conductor c is preserved (the descent and CM facts are HeegnerPointEulerSystems HE.1's).

*Acceptance.*

- K = ℚ(i), N = 5 = (2 + i)(2 − i): 𝔑 = (2 + i), with O_K/𝔑 ≅ ℤ/5ℤ.
- For A = ℂ/O_K, z ↦ cz defines an isogeny ℂ/O_K → ℂ/O_c with cyclic kernel c⁻¹O_c/O_K ≅ ℤ/cℤ, and End(ℂ/O_c) = O_c: a pair of conductor c.

*Uses.* `GeneralizedHeegnerCycles:GH.0/cm-elliptic-curve-and-its-hodge-splitting`, `HeegnerPointEulerSystems:HE.1`.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §1.4, Assumption 1.9, p. 1053: “There is an ideal N of OK of norm N such that” The Heegner hypothesis.
- Generalized Heegner cycles and p-adic Rankin L-series, §1.4, p. 1053: “is said to be of conductor c if” Conductor of a pair (φ, A′).
- Generalized Heegner cycles and p-adic Rankin L-series, §1.4, p. 1054: “is an isogeny whose kernel intersects” Isog^N(A): kernel meets A[N] trivially.

#### Construction. The generalized Heegner cycle Δ_φ = ε_X Υ_φ

*Module* `TauCeti/GeneralizedHeegner/Cycles/Basic.lean`. *Node* `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle`.

For (φ, A′) ∈ Isog^N(A), the pair (A′, φ(t_A)) gives an embedding ι_{A′} : (A′)^r → W_r onto the fibre of W_r over P_{A′}. Let Υ_φ be the image of Graph(φ)^r ⊂ (A × A′)^r ≅ (A′)^r × A^r in X_r = W_r × A^r under ι_{A′} × id. It is a codimension-(r + 1) cycle. The generalized Heegner cycle is Δ_φ := ε_X Υ_φ ∈ CH^{r+1}(X_r)_ℚ, supported on the fibre π_r^{−1}(P_{A′}) ≅ (A′)^r × A^r. For r = 0, Δ_φ is the CM point P_{A′} of C, and it is replaced by P_{A′} − ∞ for a cusp ∞.

*Hypotheses.*

- ε_X has denominators 2N·r! (GH.0), so Δ_φ is a class with ℚ-coefficients. It becomes integral after multiplying by (2N·r!)^2, which an integral theory must track.
- Graph(φ)^r has dimension r in the 2r-dimensional fibre, so it has codimension r + 1 in X_r (dimension 2r + 1).

*API.*

- `upsilon` (*constructor*) — upsilon (p : IsogPair A) (h : p.IsPrimeToN N) : AlgebraicCycle (X r) (r + 1).
- `gHC` (*constructor*) — gHC p h := (epsX r).act (upsilon p h) : CH^{r+1}(X r) ⊗ ℚ.
- `gHC_support` (*characterisation*) — the support of gHC p h lies in (X.proj r)⁻¹(p.point h).
- `gHC_idealAction` (*compatibility*) — gHC (𝔞 ⋆ p) is the image of gHC p under the correspondence induced by φ_𝔞.

*Used by.*

- `GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles` — cl(Δ_φ) = 0
- `GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map` — AJ^et(Δ_φ)
- `GeneralizedHeegnerCycles:GH.2` — ring-class traces of Δ_φ
- `GeneralizedHeegnerCycles:GH.4` — the p-adic Abel–Jacobi formula for Δ_φ

*Unit tests.* A wrong definition fails one of these.

- `gHC_r_zero` (degenerate) — r = 0: Δ_φ = P_{A′}, replaced by P_{A′} − ∞ to make it null-homologous.
- `upsilon_codim` (value) — Υ_φ has codimension r + 1 in X r (dimension 2r + 1).
- `gHC_not_integral` (non-example) — Δ_φ is a ℚ-cycle: for r ≥ 1 the projector ε_X has denominator 2, so Δ_φ need not be the class of an integral cycle.
- `gHC_support_fibre` (value) — For the identity pair, Δ_1 is supported on the fibre A^r × A^r over P_A.

*Construction.*

1. ι_{A′} identifies (A′)^r with the fibre of the fibre-power E^r over P_{A′}, which lies in the smooth locus of W_r since P_{A′} is not a cusp.
2. Graph(φ) ⊂ A × A′ is a curve. Its r-th power is an r-dimensional subvariety of (A × A′)^r, reordered as (A′)^r × A^r.
3. Apply the correspondence ε_X (GH.0) on Chow groups with ℚ-coefficients (MotivicEtaleKTheory M.4). ε_X preserves the fibres of π_r, so the support stays in π_r^{−1}(P_{A′}).

*Acceptance.*

- r = 1: Υ_φ = Graph(φ) ⊂ A′ × A = the fibre of E × A over P_{A′}, a curve in the threefold X_1.

*Uses.* `GeneralizedHeegnerCycles:GH.1/isogenies-of-conductor-c-prime-to-n`, `GeneralizedHeegnerCycles:GH.0/generalized-kuga-sato-variety-and-its-projector`, `MotivicEtaleKTheory:M.4`.

*Planet:* Generalized Heegner cycle.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §2.3, p. 1062: “We associate to any” The cycle Υ_φ = Graph(φ)^r.
- Generalized Heegner cycles and p-adic Rankin L-series, §2.3, p. 1063: “is supported on the ﬁber” Δ_φ = ε_X Υ_φ is supported on the fibre over P_{A′}, in CH^{r+1}(X_r)_ℚ.

#### Construction. BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre

*Module* `TauCeti/GeneralizedHeegner/AbelJacobi/Etale.lean`. *Node* `GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map`.

Let F ⊇ H be a field of characteristic 0, P ∈ C(F) a non-cuspidal point, X_P = π_r^{−1}(P) and X_r^♮ = X_r − X_P. For r ≥ 1, the Gysin sequence projected by ε_X gives an exact sequence of G_F-representations 0 → ε_X H^{2r+1}(X̄_r, ℚ_p)(r + 1) → ε_X H^{2r+1}(X̄_r^♮, ℚ_p)(r + 1) → ε_X H^{2r}(X̄_P, ℚ_p)(r) → 0. For a null-homologous Δ = ε_X Δ supported on X_P, the pullback of this sequence along ℚ_p → ε_X H^{2r}(X̄_P)(r), 1 ↦ cl_P(Δ), is an extension V_Δ, and AJ^et_F(Δ) ∈ Ext(ℚ_p, ε_X H^{2r+1}(X̄_r)(r + 1)) = H¹(F, ε_X H^{2r+1}(X̄_r, ℚ_p)(r + 1)) is its class. This agrees, after applying ε_X, with the general étale Abel–Jacobi map defined through the support of Δ (BDP Remark 3.2, following Nekovář).

*Hypotheses.*

- The exactness uses r ≥ 1: ε_X H^{2r−1}(X_P)(r) = 0, and ε_X H^{2r}(X_P)(r)^0 = ε_X H^{2r}(X_P)(r) because ε_X H^{2r+2}(X_r) = 0.
- The target is the rational Galois cohomology of the ε_X-part. An integral version needs a G_F-stable lattice and control of the denominators of ε_X; that is GH.1 work still to be planned.

*API.*

- `ajEt` (*constructor*) — ajEt F : CH^{r+1}(X r)_{0,ℚ}(F) →ₗ[ℚ] H¹(G_F, epsX H^{2r+1}_et(X̄ r, ℚ_p)(r+1)).
- `ajEt_fibre` (*characterisation*) — for Δ supported on X_P, ajEt F Δ is the class of the pullback of the Gysin extension along cl_P(Δ).
- `ajEt_galois` (*compatibility*) — ajEt (σ Δ) = σ_* (ajEt Δ) for σ ∈ Aut(F/F₀).
- `ajEt_restrict` (*compatibility*) — ajEt F′ (Δ ⊗ F′) = res_{F′/F} (ajEt F Δ).

*Used by.*

- `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map` — AJ_F = J ∘ comp ∘ AJ^et
- `GeneralizedHeegnerCycles:GH.2` — the global classes and their local conditions
- `GeneralizedHeegnerCycles:GH.5` — classes feeding the Kolyvagin system

*Unit tests.* A wrong definition fails one of these.

- `ajEt_zero` (degenerate) — ajEt F 0 = 0: the split extension.
- `ajEt_r_zero_kummer` (value) — For r = 0, ajEt (P − ∞) is the Kummer class of the image of P − ∞ in J₁(N)(F) ⊗ ℚ_p.
- `not_ajEt_non_null_homologous` (non-example) — The construction needs cl(Δ) = 0 in H^{2r+2}(X̄_r): for a cycle with nonzero class, the pullback does not land in ε_X H^{2r}(X̄_P)(r)^0 and no extension of ℚ_p is defined.
- `ajEt_restrict_test` (characterisation) — Restriction to a finite extension F′/F commutes with ajEt.

*Construction.*

1. Gysin sequence for the smooth divisor X_P ⊂ X_r with complement X_r^♮, twisted by (r + 1) (EDC.3).
2. Apply ε_X, which preserves X_P and X_r^♮ because it preserves the fibres of π_r. Then ε_X H^{2r−1}(X_P) = 0 (the ε_W part of the cohomology of a single fibre lives in degree r), and ε_X H^{2r+2}(X_r) = 0, giving the short exact sequence.
3. cl_P(Δ) ∈ ε_X H^{2r}(X̄_P)(r). Pull back along the map sending 1 to it; the class in Ext¹ = H¹ of Galois cohomology (SelmerIwasawaCohomology L0) is AJ^et_F(Δ).
4. Compatibility with the general definition: Nekovář's argument, Proposition II.2.4 of his work, as BDP Remark 3.2 says.

*Acceptance.*

- r = 0 analogue: for P − ∞ on a curve, AJ^et is the Kummer class of the point of the Jacobian.

*Uses.* `GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles`, `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`, `EtaleDualityAndPerverseSheaves:EDC.3`, `SelmerIwasawaCohomology:L0`.

*Planet:* Étale Abel–Jacobi map.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §3.1, p. 1065: “Consider the following Gysin sequence in p-adic étale cohomology” The Gysin sequence (3.1.1).
- Generalized Heegner cycles and p-adic Rankin L-series, §3.1, Definition 3.1, p. 1066: “sends the class of the null-homologous codimension-.r C 1/ cycle” AJ^et_F as the class of the pulled-back extension.
- Generalized Heegner cycles and p-adic Rankin L-series, §3.1, Remark 3.2, p. 1067: “It can be checked, following the argument that is explained in” Compatibility with the general definition.

#### Construction. The p-adic Abel–Jacobi map AJ_F : CH^{r+1}(X_r)_{0,ℚ}(F) → (S_{r+2}(Γ, F) ⊗ Sym^r H¹_dR(A/F))^∨

*Module* `TauCeti/GeneralizedHeegner/AbelJacobi/PAdic.lean`. *Node* `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map`.

Let F be a finite unramified extension of ℚ_p over which C and X_r have smooth proper models (for (φ, A′) ∈ Isog_c^N(A) with p ∤ cNd_K, the completion of H̃·H_c at a place above p). By Nekovář and Nizioł, AJ^et_F takes values in H¹_f = Ext_cris(ℚ_p, ε_X H^{2r+1}_et(X̄_r)(r + 1)). Faltings' crystalline comparison identifies this with Ext_ffm(F, ε_X H^{2r+1}_dR(X_r/F)(r + 1)), and Proposition 3.5 (weight −1) with ε_X H^{2r+1}_dR(r + 1)/Fil⁰ = (Fil^{r+1} ε_X H^{2r+1}_dR(X_r/F))^∨, by Poincaré duality. By GH.0 the latter is (S_{r+2}(Γ, F) ⊗ Sym^r H¹_dR(A/F))^∨. AJ_F is the composite.

*Hypotheses.*

- F unramified over ℚ_p with good reduction of C and X_r (p ∤ cNd_K). The comparison and Nekovář's theorem are imported from PadicHodgeTheory R06.5–R06.6.
- H = ε_X H^{2r+1}_dR(r + 1) has weight −1 < 0, as Proposition 3.5 requires.

*API.*

- `ajP` (*constructor*) — ajP F : CH^{r+1}(X r)_{0,ℚ}(F) →ₗ[ℚ] Module.Dual F (S_{r+2}(Γ, F) ⊗ Sym^r H¹_dR(A/F)).
- `ajP_eq` (*characterisation*) — ajP F = J ∘ comp ∘ ajEt F.
- `ajP_eval` (*characterisation*) — ajP F Δ (ω_f ⊗ α) = ⟨η^hol − η^frob, ω_f ∧ α⟩ for the filtered Frobenius extension of Δ.
- `ajEt_mem_H1f` (*characterisation*) — ajEt F Δ ∈ H¹_f(F, epsX H^{2r+1}(r+1)).

*Used by.*

- `GeneralizedHeegnerCycles:GH.4` — the p-adic Abel–Jacobi formula AJ_F(Δ_φ)(ω_f ∧ ω^jη^{r−j})
- `GeneralizedHeegnerCycles:GH.2` — local conditions at p

*Unit tests.* A wrong definition fails one of these.

- `ajP_zero` (degenerate) — ajP F 0 = 0.
- `ajP_r_zero_coleman` (value) — For r = 0, ajP F (P − ∞) (ω_f) is the Coleman integral ∫_∞^P ω_f.
- `not_ajP_ramified` (non-example) — For F ramified over ℚ_p, or X_r with bad reduction, the crystalline comparison does not apply, and the construction must be replaced by the semistable one (as in Iovita–Spieß).
- `ajP_target_dim` (characterisation) — The target has dimension (r + 1)·dim S_{r+2}(Γ, F).

*Construction.*

1. AJ^et_F(CH^{r+1}_0) ⊆ H¹_f (Nekovář, Theorem 3.1.1; Nizioł), requested from PadicHodgeTheory R06.6.
2. Faltings: ε_X H^{2r+1}_et(X̄_r)(r + 1) is crystalline with D_cris equal to ε_X H^{2r+1}_dR(X_r/F)(r + 1) (R06.5). D_cris is fully faithful, and surjectivity onto Ext_ffm comes from the Bloch–Kato exponential (BDP Corollary 3.4; R06.2).
3. Proposition 3.5 with H = ε_X H^{2r+1}_dR(r + 1) of weight −1.
4. Poincaré duality makes Fil¹ε_X H^{2r+1}(r) and Fil⁰ε_X H^{2r+1}(r + 1) exact annihilators, so H/Fil⁰H = (Fil^{r+1} ε_X H^{2r+1}_dR)^∨ (GH.0/self-duality-of-the-projected-cohomology).
5. Fil^{r+1} ε_X H^{2r+1}_dR = S_{r+2}(Γ, F) ⊗ Sym^r H¹_dR(A) (GH.0/cohomology-of-the-generalized-kuga-sato-variety).

*Acceptance.*

- r = 0: AJ_F(P − ∞)(ω_f) = ∫_∞^P ω_f, the Coleman integral, which BDP §3.6 recovers.

*Uses.* `GeneralizedHeegnerCycles:GH.1/etale-abel-jacobi-map`, `GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules`, `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`, `GeneralizedHeegnerCycles:GH.0/self-duality-of-the-projected-cohomology`, `PadicHodgeTheory:R06.5`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.6`.

*Planet:* p-adic Abel–Jacobi map.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §3.2, p. 1067: “The extension F is a ﬁnite unramiﬁed extension of Qp.” Hypotheses on F.
- Generalized Heegner cycles and p-adic Rankin L-series, §3.2, Theorem 3.3, p. 1068: “is crystalline, and there is a canon-” Faltings' crystalline comparison.
- Generalized Heegner cycles and p-adic Rankin L-series, §3.4, p. 1069: “whose elements correspond to crystalline exten-” AJ^et lands in H¹_f = Ext_cris.
- Generalized Heegner cycles and p-adic Rankin L-series, §3.4, p. 1070: “The p-adic Abel–Jacobi map, denoted AJF , is the diagonal map in the diagram” Definition of AJ_F.

### Theorems

#### Theorem. BDP Remark 2.6: the field of definition of Δ_φ

*Module* `TauCeti/GeneralizedHeegner/Cycles/Basic.lean`. *Node* `GeneralizedHeegnerCycles:GH.1/field-of-definition-of-generalized-heegner-cycles`.

If (φ, A′) ∈ Isog_c^N(A), then Δ_φ is defined over the compositum H̃·H_c of the abelian extension H̃/K over which (A, t_A) is defined with the ring class field H_c of conductor c. So the Δ_φ are defined over abelian extensions of K.

*Hypotheses.*

- The descent of the pair (φ, A′) to H_c, compatibly with the level structure, is the main theorem of complex multiplication, imported from HeegnerPointEulerSystems HE.1.

*Proof.*

1. The CM main theorem makes (A′, φ(t_A)) and φ defined over H̃·H_c for (φ, A′) of conductor c (HE.1).
2. W_r, A and ε_X are defined over H (GH.0), so ι_{A′}, Υ_φ and Δ_φ are defined over H̃·H_c.

*Acceptance.*

- c = 1: Δ_φ is defined over H̃, the field of definition of A[𝔑].

*Uses.* `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle`, `HeegnerPointEulerSystems:HE.1`.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §2.3, Remark 2.6, p. 1063: “deﬁned over abelian extensions of K” Δ_φ is defined over H̃·H_c.

#### Theorem. BDP Proposition 2.7: Δ_φ is homologically trivial

*Module* `TauCeti/GeneralizedHeegner/Cycles/Basic.lean`. *Node* `GeneralizedHeegnerCycles:GH.1/homological-triviality-of-generalized-heegner-cycles`.

For r ≥ 1, the cycle class of Δ_φ in ε_X H^{2r+2}(X_r) vanishes in every cohomology theory (de Rham, étale, Betti), so Δ_φ ∈ CH^{r+1}(X_r)_{0,ℚ}. For r = 0, P_{A′} − ∞ is homologically trivial.

*Hypotheses.*

- The vanishing of ε_X H^{2r+2}(X_r) is the only input for r ≥ 1.
- The cycle class map commutes with correspondences (EtaleDualityAndPerverseSheaves EDC.3).

*Proof.*

1. cl(Δ_φ) = cl(ε_X Υ_φ) = ε_X cl(Υ_φ) ∈ ε_X H^{2r+2}(X_r) (EDC.3).
2. ε_X H^{2r+2}(X_r) = 0 for r ≥ 1 (GH.0/cohomology-of-the-generalized-kuga-sato-variety).
3. r = 0: a degree-zero divisor on a curve is homologically trivial.

*Acceptance.*

- r = 1: cl(Δ_φ) ∈ ε_X H⁴(E × A) = 0.

*Uses.* `GeneralizedHeegnerCycles:GH.1/generalized-heegner-cycle`, `GeneralizedHeegnerCycles:GH.0/cohomology-of-the-generalized-kuga-sato-variety`, `EtaleDualityAndPerverseSheaves:EDC.3`.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §2.3, Proposition 2.7, p. 1063: “is homologically trivial on” Δ_φ is homologically trivial.

#### Lemma. BDP Proposition 3.5: Ext of the unit by a filtered Frobenius module of negative weight

*Module* `TauCeti/GeneralizedHeegner/AbelJacobi/FilteredFrobenius.lean`. *Node* `GeneralizedHeegnerCycles:GH.1/extensions-of-filtered-frobenius-modules`.

Let F be a finite unramified extension of ℚ_p, and H a filtered Frobenius module over F of strictly negative weight, so that H^{Φ=1} = 0. Then Ext¹_ffm(F, H) ≅ H/Fil⁰H, by E ↦ η_E^hol − η_E^frob, where η_E^hol ∈ Fil⁰E and η_E^frob ∈ E^{Φ=1} both lift 1 ∈ F.

*Hypotheses.*

- The weight hypothesis is used to make E^{Φ=1} → F an isomorphism, and to make the class independent of the lift η^frob.

*Proof.*

1. Since H^{Φ=1} = 0, the map E^{Φ=1} → F^{Φ=1} = F is injective, and it is surjective because the extension of φ-modules splits (Φ − 1 is bijective on H by the weight hypothesis). This gives a φ-module splitting E = H ⊕ F with η^frob = (0, 1).
2. The filtration on E is determined by Fil⁰E = Fil⁰H + F·η^hol, with η^hol = (h, 1). Two choices give the same filtration iff h − h′ ∈ Fil⁰H.
3. Hence the class of h in H/Fil⁰H classifies the extension.

*Acceptance.*

- H = F(1), the Tate twist of weight −2 (Fil⁰H = 0): Ext¹_ffm(F, F(1)) ≅ F.

*Sources.*

- Generalized Heegner cycles and p-adic Rankin L-series, §3.3, p. 1068: “Let H be a ﬁltered Frobenius module of strictly negative weight” The setting of Proposition 3.5.
- Generalized Heegner cycles and p-adic Rankin L-series, §3.3, Proposition 3.5, p. 1069: “yields an isomorphism” Ext_ffm(F, H) = H/Fil⁰H.

### What is missing

- The integral version: a G_F-stable lattice in ε_X H^{2r+1}(r + 1), the comparison with the chosen lattice in V_f(r) ⊗ χ, and bounds on the denominators 2N·r! of ε_X, as the atlas asks.
- The de Rham and syntomic realization beyond the p-adic Abel–Jacobi map (BDP §3.5 onwards: the Coleman primitive, §§3.6–3.8), which feeds GH.4.
- BDP §2.4, the relation with classical Heegner cycles on W_{2r} through the correspondence Π. BDP leave this calculation to the reader, so it would need its own source.

## GH.2 Ring-class trace, congruence and local conditions

No nodes yet.

### What is missing

- Not planned in checkpoint 1; the integrated decomposition has a GH.2 node on the local condition at p (Castella–Hsieh corrections).

## GH.3 Ordinary stabilization and universal norms

No nodes yet.

### What is missing

- Not planned in checkpoint 1: ordinary stabilization and universal norms.

## GH.4 Explicit reciprocity and p-adic Abel–Jacobi formulas

No nodes yet.

### What is missing

- Not planned in checkpoint 1; the integrated decomposition has a GH.4 node (Castella–Hsieh Theorem 4.9).

## GH.5 Higher-weight Kolyvagin system and arithmetic hypotheses

No nodes yet.

### What is missing

- Not planned in checkpoint 1; the integrated decomposition has a GH.5 node (Longo–Vigni).

## GH.6 Nonvanishing and source-qualified Selmer consequences

No nodes yet.

### What is missing

- Not planned in checkpoint 1; the integrated decomposition has a GH.6 node (Selmer consequences with the corrected dimension formula).

## GH.7 Hida-family classes and specialization

No nodes yet.

### What is missing

- Not planned in checkpoint 1: Hida-family classes and specialization.

## Requests to other roadmaps

- `ModularCurvesPartII:R14.3` — The higher-weight universal-family carrier that RS-06's owner table assigns to R14.3: the canonical desingularization W_r of the r-fold fibre product of the universal generalized elliptic curve over X₁(N) (N > 4), its projector ε_W = ε_W^{(2)}ε_W^{(1)} with denominators N^r and 2^r r!, Scholl's theorem ε_W H^*(W_r) = H¹_par(C, L_r) in degree r + 1 (de Rham, étale and Betti), its Hodge filtration (Fil^{r+1} = S_{r+2}), the Hecke action, and the newform summand V_f. Needed by `generalized-kuga-sato-variety-and-its-projector`, `cohomology-of-the-generalized-kuga-sato-variety`, `self-duality-of-the-projected-cohomology`.
- `HeegnerPointEulerSystems:HE.1` — An elliptic curve A over the Hilbert class field H of K with End_H(A) = O_K, and its descent by the main theorem of complex multiplication. The descent of CM isogeny pairs (φ, A′) of conductor c with Γ₁(N)-structure to H̃·H_c (main theorem of complex multiplication), and the action of invertible O_c-ideals. Needed by `cm-elliptic-curve-and-its-hodge-splitting`, `field-of-definition-of-generalized-heegner-cycles`, `isogenies-of-conductor-c-prime-to-n`.
- `ComplexMultiplicationAndExplicitReciprocity:CM.1` — Elliptic CM: the O_K-action on an elliptic curve with CM by O_K, normalized on invariant differentials, with automorphism factors for j = 0 and 1728. Needed by `cm-elliptic-curve-and-its-hodge-splitting`.
- `MotivicEtaleKTheory:M.4` — Chow groups with rational coefficients, the ring of correspondences CH^{dim X}(X × X)_ℚ and its action on cohomology by functoriality, with transposition. The action of correspondences on CH^{r+1}(X_r)_ℚ, used to project cycles. Needed by `cm-projector-and-symmetric-power`, `generalized-kuga-sato-variety-and-its-projector`, `generalized-heegner-cycle`.
- `SchemeAndStackFoundations:SF.2` — The Künneth decomposition for de Rham and étale cohomology of products of smooth proper varieties over a field of characteristic 0, compatible with correspondences acting on each factor. Needed by `cohomology-of-the-generalized-kuga-sato-variety`.
- `EtaleDualityAndPerverseSheaves:EDC.2` — Poincaré duality for smooth proper varieties, H^i × H^{2d−i} → ℚ_p(−d), Galois-equivariantly, with ⟨εx, y⟩ = ⟨x, ε^t y⟩ for correspondences. Needed by `self-duality-of-the-projected-cohomology`.
- `EtaleDualityAndPerverseSheaves:EDC.3` — Étale cycle classes, their compatibility with correspondences, and the Gysin sequence for a smooth divisor in a smooth proper variety. Needed by `homological-triviality-of-generalized-heegner-cycles`, `etale-abel-jacobi-map`.
- `SelmerIwasawaCohomology:L0` — Continuous Galois cohomology H¹(F, V) of p-adic representations and its identification with Ext¹(ℚ_p, V) in the category of continuous representations. Needed by `etale-abel-jacobi-map`.
- `PadicHodgeTheory:R06.5` — Faltings' crystalline comparison theorem for smooth proper varieties with good reduction over a finite unramified extension F of ℚ_p: H^i_et(X̄, ℚ_p) is crystalline and D_cris(H^i_et(X̄, ℚ_p)) ≅ H^i_dR(X/F) as filtered Frobenius modules, functorially in correspondences. Needed by `p-adic-abel-jacobi-map`.
- `PadicHodgeTheory:R06.2` — D_cris, full faithfulness on crystalline representations, and the identification Ext_cris(ℚ_p, V) ≅ Ext_ffm(F, D_cris(V)) through the Bloch–Kato exponential. Needed by `p-adic-abel-jacobi-map`.
- `PadicHodgeTheory:R06.6` — Nekovář's and Nizioł's theorem: the étale Abel–Jacobi image of a null-homologous cycle on a smooth proper variety with good reduction lies in H¹_f. Needed by `p-adic-abel-jacobi-map`.

## Sources

- Massimo Bertolini, Henri Darmon and Kartik Prasanna (with an appendix by Brian Conrad), *Generalized Heegner cycles and p-adic Rankin L-series*. Duke Math. J. 162 (2013), no. 6, 1033–1148, published version from H. Darmon's page (116 pages; printed page = PDF page + 1032). https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf (SHA-256 `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc`). Read: cc-fb70e5, 2026-09-29 (part GH.0, checkpoint 1): §1.4, pp. 1051–1053; §2.1–§2.3, pp. 1055–1063, in full; cc-fb70e5, 2026-09-29 (part GH.0, checkpoint 2): §1.4 Isogenies, pp. 1053–1054; §2.3–§2.4, pp. 1062–1064; §3.1–§3.4, pp. 1064–1070.

## Non-goals

- The Kuga–Sato variety W_r, its projector ε_W and Scholl's theorem: these are ModularCurvesPartII R14.3's.
- Integral models over ℤ[1/N] (Conrad's appendix): GH.0 works over fields of characteristic 0.
- p-adic Hodge theory itself (PadicHodgeTheory): GH.1 uses the comparison theorems as stated.
