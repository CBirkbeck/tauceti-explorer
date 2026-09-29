# Generalized Heegner cycles and their Iwasawa variation: stages GH.0–GH.7

## Purpose

This document plans part GH.0 of `GeneralizedHeegnerCycles`. The part runs from the geometry that carries generalized Heegner cycles, the variety X_r = W_r × A^r with its projectors (GH.0), through the cycles, their Abel–Jacobi images and local conditions (GH.1–GH.4), to Kolyvagin systems, Selmer consequences and Hida-family variation (GH.5–GH.7).

This first checkpoint plans GH.0 from Bertolini–Darmon–Prasanna §§1.4 and 2.1–2.2: the CM elliptic curve and its Hodge splitting, the projectors ε_A and ε_X, the cohomology of X_r cut out by ε_X, and its self-duality.

## Scope and boundaries

The RS-06 owner table (accepted) assigns the finite-level modular universal-family cohomological carrier (the Kuga–Sato variety W_r, its projector ε_W and the symmetric-power local systems) to ModularCurvesPartII R14.3, which formerly sat under GH.0. GH.0 imports W_r and ε_W from there and keeps the CM factor A^r, the combined projector ε_X, and the identification of ε_X H^{2r+1}(X_r).

- CM curves come from HeegnerPointEulerSystems HE.1 and ComplexMultiplicationAndExplicitReciprocity CM.1.
- Correspondences come from MotivicEtaleKTheory M.4.
- Künneth comes from SchemeAndStackFoundations SF.2, and Poincaré duality from EtaleDualityAndPerverseSheaves EDC.2.
- The GeneralizedHeegnerCycles family is not in an accepted restructure. RS-04 mentions it and has no accepted review, so the current structure is used.

## Conventions

- K is imaginary quadratic with Hilbert class field H. A/H has End_H(A) = O_K, with [α]^*ω = αω on differentials.
- C = X₁(N) with N > 4. W_r is the canonical desingularization of the r-fold fibre product of the universal generalized elliptic curve. X_r = W_r × A^r, of dimension 2r + 1.
- ε_A = (1/(2^r r!)) Σ_{ξ∈Ξ_r} j(ξ)ξ, ε_X = ε_W ε_A, with denominators inverted in ℤ[1/(2N·r!)].

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

No nodes yet.

### What is missing

- Not planned in checkpoint 1. The integrated decomposition's node GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images is to be refined, starting from BDP §2.3 (Δ_φ = ε_X Υ_φ, Remark 2.6, Proposition 2.7) and §3 (Abel–Jacobi maps).

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
- `HeegnerPointEulerSystems:HE.1` — An elliptic curve A over the Hilbert class field H of K with End_H(A) = O_K, and its descent by the main theorem of complex multiplication. Needed by `cm-elliptic-curve-and-its-hodge-splitting`.
- `ComplexMultiplicationAndExplicitReciprocity:CM.1` — Elliptic CM: the O_K-action on an elliptic curve with CM by O_K, normalized on invariant differentials, with automorphism factors for j = 0 and 1728. Needed by `cm-elliptic-curve-and-its-hodge-splitting`.
- `MotivicEtaleKTheory:M.4` — Chow groups with rational coefficients, the ring of correspondences CH^{dim X}(X × X)_ℚ and its action on cohomology by functoriality, with transposition. Needed by `cm-projector-and-symmetric-power`, `generalized-kuga-sato-variety-and-its-projector`.
- `SchemeAndStackFoundations:SF.2` — The Künneth decomposition for de Rham and étale cohomology of products of smooth proper varieties over a field of characteristic 0, compatible with correspondences acting on each factor. Needed by `cohomology-of-the-generalized-kuga-sato-variety`.
- `EtaleDualityAndPerverseSheaves:EDC.2` — Poincaré duality for smooth proper varieties, H^i × H^{2d−i} → ℚ_p(−d), Galois-equivariantly, with ⟨εx, y⟩ = ⟨x, ε^t y⟩ for correspondences. Needed by `self-duality-of-the-projected-cohomology`.

## Sources

- Massimo Bertolini, Henri Darmon and Kartik Prasanna (with an appendix by Brian Conrad), *Generalized Heegner cycles and p-adic Rankin L-series*. Duke Math. J. 162 (2013), no. 6, 1033–1148, published version from H. Darmon's page (116 pages; printed page = PDF page + 1032). https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf (SHA-256 `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc`). Read: cc-fb70e5, 2026-09-29 (part GH.0, checkpoint 1): §1.4, pp. 1051–1053; §2.1–§2.3, pp. 1055–1063, in full.

## Non-goals

- The Kuga–Sato variety W_r, its projector ε_W and Scholl's theorem: these are ModularCurvesPartII R14.3's.
- Integral models over ℤ[1/N] (Conrad's appendix): GH.0 works over fields of characteristic 0.
