# Selmer groups, continuous integral cohomology and Iwasawa cohomology — blueprint

This blueprint covers stages L0–L4, within the boundaries RS-08 accepted. Four checkpoints so far
plan:
- **L0:** the p-adic Kummer identification, with its completions and inverse-limit bookkeeping;
- **L1:** the parametric pairing lemmas (orthogonal complements, and the compatibility of the local
  pairings for T, V, W and W_M);
- **L2:** the generic Selmer-kernel API with its standard local conditions. The second checkpoint adds
  the dual Selmer structure, local duality for the finite conditions with the bad-prime comparison
  terms, and Poitou–Tate for Selmer groups.

It follows these sources:
- Rubin, *Euler systems*: Chapter I §§2–7, and Appendix B §2.
- Mazur–Rubin, *Controlling Selmer groups in the higher core rank case*: §§1–3.
- Rodrigues Jacinto–Williams (RJW), *An introduction to p-adic L-functions*: §10.5 and §13.5.
- Burungale–Tian, *A rank zero p-converse*, as the maintainer asked.

- **L3** (third checkpoint): Iwasawa cohomology, from Nekovář's *Selmer complexes*, Chapter 8, and Rubin's
  Appendix B §§3–5.
- **L4** (fourth checkpoint): Greenberg Selmer groups of Tate twists, criticality, the Iwasawa–Greenberg conjecture
  and its even-twist case, and the Bloch–Kato condition, from RJW §§10.5, 13.5.

L4 is not yet read.

## Purpose

Selmer groups are kernels of global-to-local maps on Galois cohomology. They carry the arithmetic of
the main conjectures (class groups, Selmer groups of elliptic curves, Iwasawa modules). This
roadmap supplies:
- the integral Kummer identification that turns units into cohomology classes (L0);
- the local-condition calculus shared by Euler systems, Kolyvagin systems, deformation theory and
  Iwasawa theory (L2);
- the Iwasawa-cohomology and control statements built on them (L3);
- the arithmetic examples (L4).

## Ownership (RS-08)

**Imported from other owners.**
- ArithmeticGaloisDuality R02.1 owns compact-coefficient cohomology, derived limits and the lim¹
  sequence.
- R02.3 owns G_{F,S} and global finiteness; R02.4 owns Poitou–Tate duality and reciprocity; D7 owns
  compact support and derived duality.
- Tau Ceti ProfiniteCohomology owns discrete cohomology: Layer 5 exact sequences, Layer 6
  corestriction and Layer 9 finite-level Kummer theory and Hilbert 90.

**Kept here.**
- **L0:** the tower-compatible identification H¹(F, ℤ_p(1)) ≅ lim F^×/(F^×)^{p^m} with its
  hypotheses, and the completion-versus-tensor comparisons.
- **L1:** annihilator, saturation and pairing comparisons for the stated coefficient modules. RS-08
  asks for the parametric pairing lemmas before L2 instantiates named conditions. Since L2 depends on
  L1 in the stage graph, the annihilators of the named conditions are planned in L2, where those
  conditions are defined.
- **L2:** the generic Selmer kernel, local conditions and mapping fibre, and the duality of Selmer
  structures.

## What the libraries supply

**Mathlib supplies:**
- `AdicCompletion`, with `ofTensorProduct_bijective_of_finite_of_isNoetherian` (the completion of a
  finite module over a Noetherian ring is the tensor product);
- Dirichlet's unit theorem (`NumberField.Units.exist_unique_eq_mul_prod`);
- `IsIntegral.of_pow`;
- roots of unity, and `card_rootsOfUnity`;
- Mittag-Leffler systems (`isMittagLeffler_of_exists_finite_range`);
- `PontryaginDual`;
- submodule images and preimages, and their Galois connection.

**Tau Ceti supplies:**
- the Kummer map with its kernel (`TauCeti.kummerMap`, `kummerClassMap_injective`);
- the Kummer short exact sequence;
- naturality of δ⁰ under maps of short exact sequences (`explicitDelta0_coeffMap`).

## Conventions

- The p-adic completion of an abelian group A is Â = lim_m A/p^mA, Mathlib's `AdicCompletion`
  for (p) ⊆ ℤ. It is Rubin's K^× ⊗̂ ℤ_p.
- The algebraic tensor product A ⊗ ℤ_p agrees with it only for finitely generated A.
- A local condition is a submodule of local H¹.
- Conditions propagate forwards by image along quotients (T ↠ T/IT, V → W) and backwards by
  inverse image along submodules (T[I] ↪ T, T → V).
- Pontryagin duals carry the contragredient action (g·f)(x) = f(g⁻¹x).

## L0. Integral and rational continuous cohomology

Module `TauCeti/NumberTheory/Selmer/Completion`, namespace `TauCeti.Selmer`.

**Construction: the p-adic completion** (`pCompletion`; node `padic-completion`; planet).

*API.*
- `toPCompletion`.
- `ker_toPCompletion`: the kernel is ⋂p^mA.
- `pCompletionMap`.
- `adicCompletion_int_equiv_padicInt`: ℤ̂ = ℤ_p.
- `pCompletion_bijective_of_finite`: ℤ_p ⊗ A ≅ Â for finitely generated A.

*Unit tests.*
- A finite group of order prime to p has completion 0.
- ℤ̂ = ℤ_p.
- ℚ̂ = 0.
- Non-example: for ℤ^(ℕ), ℤ_p ⊗ A → Â is not surjective.
- Non-example: the completion of ℤ_ℓ is 0 although ℤ_p ⊗ ℤ_ℓ ≠ 0.

**Lemma: global units** (`units_pCompletion_injective`; node `units-completion`). ℤ_p ⊗ E_F ≅ Ê_F,
and Ê_F ↪ (F^×)^, because p^m-th roots of units are units.

**Lemma: S-units** (node `s-units-completion`). The same for 𝓞_{F,S}^×.

**Lemma: local multiplicative groups** (node `local-completion`). For K/ℚ_ℓ finite:
- (K^×)^ ≅ ℤ_p × (𝓞_K^×)^;
- (𝓞_K^×)^ = U¹_K if ℓ = p, and μ_{p^∞}(K) if ℓ ≠ p;
- K^× ⊗ ℤ_p → (K^×)^ is surjective but not injective.

**Lemma: local power classes are finite** (node `local-power-class-finite`).

**Lemma: Kummer maps along the tower** (node `kummer-level-compatibility`). The p-th power map
μ_{p^{m+1}} → μ_{p^m} sends κ_{m+1}(a) to κ_m(a). This is the naturality of δ⁰.

**Construction: the limit Kummer map** (node `kummer-limit-map`). κ_∞ : (K^×)^ → lim_m
H¹(G_K, μ_{p^m}) is injective, and bijective given Hilbert 90.

*API.* `kummerLimit_injective`, `_bijective`, `_res`, `_cor` and `_zp_linear`.

*Unit tests.*
- A separably closed field gives 0.
- ℝ with p = 2 gives ℤ/2.
- 𝔽_q gives the p-part of 𝔽_q^×.
- ℚ is a non-example to replacing the completion by the tensor product.

**Lemma: Mittag-Leffler for roots of unity** (node `roots-of-unity-mittag-leffler`). The groups
μ_{p^m}(K) are finite, so lim¹ = 0.

**Theorem: the p-adic Kummer identification** (node `padic-kummer-identification`; planet).
H¹(G_K, ℤ_p(1)) ≅ lim_m K^×/(K^×)^{p^m} for every field K in which p is invertible.
- It is an algebraic isomorphism in general, and a homeomorphism when the power classes are finite.
- It is compatible with restriction, and with corestriction against the norm.

**Theorem: S-units** (node `s-unit-kummer-identification`; planet). H¹(G_{F,S}, ℤ_p(1)) ≅
ℤ_p ⊗ 𝓞_{F,S}^×, because T_p Pic(𝓞_{F,S}) = 0. This is the finite-level form of Burungale–Tian's
units-kummer item.

**Lemma: which inverse-limit hypotheses hold** (node `inverse-limit-hypotheses`).
- For every field K, lim¹ μ_{p^m}(K) = 0.
- For local K, the H¹ system is finite, so H² commutes with the limit.
- For G_{F,S}, the H¹ system is finite.
- For the full G_F of a number field, H¹(G_F, μ_{p^m}) is infinite and no shortcut is available.

## L1. Local and global duality

Module `TauCeti/NumberTheory/Selmer/Duality`, namespace `TauCeti.Selmer`. These are the parametric
lemmas; the named conditions are instantiated in L2.

**Construction: orthogonal complements** (`orthogonal`; node `orthogonal-complement`; planet
"Orthogonal local conditions"). For a pairing b : X × X′ → Y of O-modules, F^⊥. Applied to the local
Tate pairings of Rubin's Theorem 4.1, this is Mazur–Rubin's dual local condition F^*.

*API.*
- `orthogonal_antitone`.
- `orthogonal_top` and `orthogonal_bot`: relaxed and strict are swapped.
- `orthogonal_orthogonal`: F^⊥⊥ = F for perfect pairings of finite modules, of Φ-spaces, and of
  finitely generated against cofinitely generated modules.
- `orthogonal_map_eq_comap` and `orthogonal_comap_eq_map`: the image and preimage rules for adjoint
  maps.
- `card_mul_card_orthogonal`: #F · #F^⊥ = #X.
- `quotientPairing_perfect`: (X/F) × F^⊥ is perfect.

*Unit tests.*
- X^⊥ = 0 and 0^⊥ = X′.
- The standard pairing on (ℤ/p)².
- Over ℚ_ℓ with ℓ ≢ 1 mod p, H¹(ℚ_ℓ, ℤ/p) is all unramified, and its complement H¹_ur(ℚ_ℓ, μ_p) is 0.
- Non-example: the zero pairing.

**Lemma: compatibility of the local pairings** (node `lattice-pairing-compatibility`).
⟨φ(c), d⟩ = ⟨c, φ^*(d)⟩ along T → V and V^* → W^*, and the same along T ↠ W_M and W^*_M ↪ W^*. The
perfectness of the local pairings is imported from ArithmeticGaloisDuality R02.4.

## L2. Selmer structures and duals

Module `TauCeti/NumberTheory/Selmer/Basic`.

**Construction: Selmer data** (`SelmerData`; node `selmer-data`). The data are:
- a global module H;
- local modules H_v;
- localisation maps res_v;
- local conditions L_v.

The same API serves discrete, compact and rational coefficients.

*API.* `withCond`, `relax`, `strict` and `selmer_strict_le_le_relax`.

**Construction: the Selmer module** (`SelmerData.selmer`; node `selmer-kernel`; planet "Selmer
group"). Sel = {c : res_v c ∈ L_v for all v} = ker(H → ∏ H_v/L_v).

*API.* `mem_selmer`, `selmer_eq_ker` and `selmer_mono`.

*Unit tests.*
- Relaxed everywhere gives H.
- Strict everywhere gives ⋂ ker res_v.
- No places gives H.

**Lemma: change of conditions** (`exact_change_of_conditions`; node `change-of-conditions`).
0 → Sel_L → Sel_{L'} → ∏ L'_v/L_v; this is Mazur–Rubin (2.4).

**Lemma: functoriality** (`map_selmer_le`; node `selmer-functoriality`).

**Construction: propagation** (`propagateImage`, `propagatePreimage`; node `condition-propagation`).
Propagation is by image and by inverse image, and the two form a Galois connection.

**Lemma: from V to T and W** (`saturated_preimage`; node `lattice-passage`). Rubin's H¹_f(K_v, T)
and H¹_f(K_v, W) are the inverse image and the image of H¹_f(K_v, V).
- The condition on T is saturated.
- The condition on W is divisible.

**Construction: the unramified condition** (`unramified`; node `unramified-condition`).
ker(H¹(G_v) → H¹(I_v)). It is the image of inflation, and ≅ B^I/(Fr − 1)B^I.

**Construction: Greenberg's condition** (`greenberg`; node `greenberg-condition`; planet).
ker(H¹(G_v, M) → H¹(I_v, M/F⁺M)), where F⁺ need only be stable under the decomposition group.
- `greenberg_zero`: with F⁺ = 0 it is the unramified condition.
- `greenberg_top`: with F⁺ = M it is relaxed.
- `unramified_le_greenberg`.

**Construction: Galois Selmer groups** (node `galois-selmer-group`; planet). The Selmer module of
H¹(G_{K,Σ}, M) with its localisation maps. By Rubin's Lemma I.5.3 it equals the classes of
H¹(K, M) that are unramified outside Σ and satisfy the conditions at Σ.

**Construction: Pontryagin duals** (`contragredient`; node `pontryagin-dual`). The dual carries the
contragredient action. As a ℤ_p[[Γ]]-module it is twisted by the involution γ ↦ γ⁻¹.

**Construction: coranks** (`corank`; node `corank`). dim_{ℚ_p}(M^∨ ⊗ ℚ_p).
- `corank_finite`: finite modules have corank 0.
- `corank_add`: additive in short exact sequences.
- `corank_pi_padicInt`: ℤ_p^r has corank r.

**Comparison: Sel_{p^∞}(E/F)** (node `elliptic-selmer-instance`). This is the Galois Selmer group
of E[p^∞] with the Kummer images as local conditions. It sits in 0 → E(F) ⊗ ℚ_p/ℤ_p → Sel →
Ш[p^∞] → 0.

### Duality of Selmer structures (second checkpoint)

Module `TauCeti/NumberTheory/Selmer/Duality`.

**Construction: dual Selmer structures** (`SelmerStructure.dual`; node `dual-selmer-structure`;
planet). Mazur–Rubin Definitions 2.1 and 2.5: Σ(F^*) = Σ(F), and H¹_{F^*}(K_q, T^*) =
H¹_F(K_q, T)^⊥.

*API.*
- `dual_dual`.
- `dual_modify`: strict and relaxed modifications swap.
- `dual_induced`: the dual of the structure on T/IT is the structure on T^*[I].
- `rubin_dual`: Rubin's S^Σ(K, W_M) and S_Σ(K, W^*_M) are dual.

*Unit tests.*
- Relaxed at Σ is dual to strict at Σ, whose Selmer module is Ш¹_Σ.
- The finite condition at q ∤ p is self-dual for unramified T.
- Archimedean conditions vanish for p odd.
- Non-example: enlarging Σ(F^*) with relaxed conditions.

**Lemma: unramified dimensions** (node `unramified-dimension-count`). For ℓ ≠ p, dim H¹_ur(K, V) =
dim V^{G_K} and dim H¹/H¹_ur = dim H²(K, V) (Rubin Corollary 3.3).

**Lemma: bad-prime comparison terms** (node `finite-unramified-comparison`). For ℓ ≠ p and
𝒲 = W^I/(W^I)_div:
- H¹_f(W) = H¹_ur(W)_div;
- H¹_ur(W)/H¹_f(W) ≅ 𝒲/(Fr − 1)𝒲 and H¹_f(T)/H¹_ur(T) ≅ 𝒲^{Fr=1};
- the two agree when T is unramified;
- H¹_f(W_M) is the image of H¹_f(T).

At an archimedean place the conditions are 0, everything and W^G/MW^G (Rubin Lemmas 3.5 and 3.8,
Remark 3.7).

**Theorem: duality for the finite condition on V** (node `finite-condition-rational-duality`).
Rubin Proposition 4.2.

**Theorem: duality for the finite conditions on T and W_M** (node
`finite-condition-lattice-duality`; planet). H¹_f(K, T) and H¹_f(K, W^*) are exact orthogonal
complements, and so are H¹_f(K, W_M) and H¹_f(K, W^*_M). At ℓ = p this needs the chosen orthogonal
pair (Rubin Proposition 4.3; Mazur–Rubin Proposition 1.7(i)).

**Lemma: Selmer groups as limits** (node `selmer-limits`). S^Σ(K, T) = lim S^Σ(K, W_M) and S^Σ(K, W)
= colim S^Σ(K, W_M), with the finiteness statements. S^Σ(K, W_M) ↠ S^Σ(K, W)[M], and this fails for
S_Σ (Rubin Proposition 5.6, Lemmas 5.4 and 5.7, Remark 5.5).

**Theorem: Poitou–Tate for Selmer groups** (node `selmer-structure-poitou-tate`; planet). For
Σ_0 ⊆ Σ:
- the images of S^Σ(K, W_M) in ⊕ H¹_s and of S_{Σ_0}(K, W^*_M) in ⊕ H¹_f are exact orthogonal
  complements;
- |S_{Σ_0}(K, W^*_M)| = |coker loc^s| when S_Σ(K, W^*_M) = 0 (Rubin Theorem 7.3, Remark 7.4).

The proof uses ArithmeticGaloisDuality R02.4's Poitou–Tate, not only the local pairings.

**Theorem: the limit form** (node `selmer-poitou-tate-limit`). S(K, W^*)/S_{Σ_p}(K, W^*) ≅
Hom_O(coker(loc^s_{Σ_p}), D), with the lim¹ bookkeeping explicit (Rubin Corollary 7.5).

## L3. Iwasawa cohomology and control

Module `TauCeti/NumberTheory/Selmer/Iwasawa`, namespace `TauCeti.Selmer`. RS-08 keeps here:
- the actual inverse-corestriction Iwasawa complexes;
- completed group coefficients with the inverse action;
- finite generation;
- specialisation and control with their Tor and H⁰ error terms.

Torsion is a separate conclusion.

**Construction: Iwasawa cohomology** (node `iwasawa-cohomology`). RΓ_Iw(G, H; M) = lim_U C^•_cont(G, M_U)
(Nekovář 8.3.4–8.3.5).
- *API:*
  - under (F), H^j_Iw = lim_{U,cor} H^j(U, M);
  - H⁰_Iw = 0 when p^∞ | #Γ (Rubin B.3.2);
  - the H¹ limit through T/p^n (Rubin B.3.1).
- *Unit tests:*
  - Γ = 1;
  - H⁰ vanishing along the cyclotomic tower;
  - agreement with Kato's étale definition as quoted by Burungale–Tian;
  - non-example: restriction transitions give a different limit.

**Theorem: Shapiro's lemma over Λ** (node `iwasawa-shapiro`; planet). 𝓕_Γ(M) ≅ (M ⊗_R R̄)⟨−1⟩, with the inverse
tautological action, is finitely generated over R̄, and RΓ_cont(G, 𝓕_Γ(M)) ≅ RΓ_Iw(G, H; M) (Nekovář 8.4.4.1–8.4.4.2).

**Theorem: descent and control** (node `iwasawa-descent`; planet).
- RΓ_Iw ⊗^L_{R̄} R ≅ RΓ_cont(G, T), with its homological spectral sequence.
- For Γ ≅ ℤ_p, the short exact sequences 0 → (H^j_Iw)_Γ → H^j(G, T) → (H^{j+1}_Iw)^Γ → 0.
- The relative version for Γ′ ⊆ Γ (Nekovář 8.4.8.1–8.4.8.4).

**Theorem: the torsion criterion** (node `iwasawa-torsion-criterion`). If RΓ(G, T)_𝔭 = 0 then RΓ(G, 𝓕_Γ(T))_𝔭̄ = 0
(Nekovář 8.4.8.5). Torsion is always deduced this way, never assumed.

**Theorem: universal norms are unramified** (node `universal-norms-unramified`; planet). Rubin B.3.3–B.3.5, including
lim H¹(F, T) = lim H¹(K_S/F, T).

**Theorem: semilocal cohomology** (node `semilocal-cohomology`). H^i(F, Ind_D T′) ≅ ⊕_{Q|q} H^i(F_Q, T′_Q), with
descent of local classes (Rubin B.5.1–B.5.3). Infinite-level local conditions are limits of these.

**Theorem: the cyclotomic twist** (node `iwasawa-twist`). Cup product with (ζ_{p^n}^{⊗k}) gives an isomorphism
H^q_Iw(T) ≅ H^q_Iw(T(k)) that is Tw_k-semilinear, with Tw_k(σ) = κ(σ)^{−k}σ. This is Burungale–Tian's (3.2).

## L4. Arithmetic examples and conjectures (fourth checkpoint)

Source: RJW §10.5 and §13.5 (arXiv v2 pp. 52–53 and 69–72). The published version was compared at the two findings.
Library module: `TauCeti/NumberTheory/Selmer/Greenberg`.

**Lemma: local units in Iwasawa cohomology** (`L4/local-units-iwasawa-cohomology`).
- lim K̂_n^× ≅ H¹_Iw(ℚ_p, ℤ_p(1)), which is (10.8) with the completion of E1.
- κ : U_∞ → H¹_Iw.
- The Kummer classes z_m of the cyclotomic units, with cores(z_{mℓ}) = (1 − Frob_ℓ^{−1})z_m for ℓ ∤ m.
- Their localisation at p in H¹_Iw.

It cites EulerSystemsCyclotomicMainConjecture L0 for the classes. The norm relation printed as (1 − ℓ^{−1})c_m is
corrected (E4).

**Theorem: Greenberg Selmer groups of Tate twists** (`L4/tate-twist-greenberg-selmer`; planet).
- With Fil^iℚ_p(n) = ℚ_p(n) for i ≤ n, the condition at p is everything for n ≥ 1 and unramified for n ≤ 0.
- H¹_{L^Gr}(F, W_n) = Hom(X_∞^{c=(−1)^n}, W_n) for n ≥ 1, and Hom(Y_∞^{c=(−1)^n}, W_n) for n ≤ 0.
- For even n > 0 this is Hom(X_∞^+, W_n), whose Pontryagin dual is X_∞^+(−n).

X_∞ and Y_∞ are requested from IntegralIwasawaTheory L1.

**Definition: criticality** (`IsGreenbergCritical`; node `L4/criticality`). r_V is the order of the pole of
L_∞(V, s) at s = 1; V is critical when r_V = r_{V^∨} = 0.
- *API:*
  - the Gamma factor as data;
  - r_V;
  - the Tate dual;
  - the Tate-twist formula;
  - the parity characterisation.
- *Unit tests:*
  - ℚ_p(2) is critical;
  - ℚ_p(0) and ℚ_p(1) are not (non-examples);
  - ℚ_p(−1) is critical;
  - the parity table for −6 ≤ n ≤ 6 (checked in the suggested file).

**Definition: the Iwasawa–Greenberg main conjecture** (node `L4/greenberg-main-conjecture`; planet). RJW
Conjecture 13.21 (i)–(ii), stated as propositions with the p-adic L-function as data.
- *API:* the p-adic L-function datum, (i), (ii), and their conjunction.
- *Unit tests:*
  - the even twists;
  - V = ℚ_p is not covered;
  - it is not a theorem in general;
  - lattice independence.

**Theorem: the even-twist case** (`L4/greenberg-conjecture-tate-twists`; Example 13.22, Remark 13.23). For n even
and positive, Conjecture 13.21 for ℚ_p(n) is the twist of Theorem 13.8, which EulerSystemsCyclotomicMainConjecture
L3 proves, so it holds. n = 0 is excluded.

**Construction: the Bloch–Kato condition** (`L4/bloch-kato-condition`; Definition 13.19(2)). The image of H¹_f in
H¹(F_v, W), propagated with L2's condition-propagation. H¹_f is requested from PadicHodgeRegulators L1, and no
comparison with Greenberg's condition is asserted (Remark 13.20).

## Source findings

- **E1.** RJW (10.7)/(10.8) state F^× ⊗ ℤ_p ≅ H¹(F, ℤ_p(1)). With an algebraic tensor product
  this fails:
  - for number fields the map is not surjective;
  - for p-adic fields it is not injective.

  The target must be the completion, and the passage to the limit needs lim¹ μ_{p^m} = 0.
- **E2.** RJW Definition 13.19 asks for a G_ℚ-invariant ordinary filtration. Greenberg's filtration
  is stable only under G_{ℚ_p}; V_pE of an ordinary non-CM curve has no G_ℚ-stable line.
- **E3** (misprint, new). Rubin, proof of Theorem 7.3, p. 19: the map in the snake-lemma sequence is
  printed (loc^f_{Σ,Σ})^∨; it is (loc^f_{Σ,Σ_0})^∨.
- **E4** (error, new). RJW §10.5, p. 52 (published p. 171): N(c_{mℓ}) = (1 − ℓ^{−1})c_m for ℓ ∤ m. It should be
  c_m^{1 − Frob_ℓ^{−1}}; the factor is the Frobenius operator, not a scalar.
- **E5** (misprint, new). RJW §13.5.2, step (3), p. 71 (published p. 197): "for n ≥ 0" should read n ≤ 0. The group
  written over F_∞ is the one over F_∞^+.

## Requests

- `ArithmeticGaloisDuality:R02.1`: compact coefficients, the Milnor sequence, H¹(T) → H¹(V) →
  H¹(W).
- `ArithmeticGaloisDuality:R02.3`: G_{F,S}, localisations, finiteness of H¹ and the S-unit Kummer
  sequence. It is served by `restricted-ramification-group`, `localisation-maps`, `h1-finite` and
  `s-unit-kummer-sequence`.
- `ArithmeticGaloisDuality:R02.4`: local Tate duality for V, W_M and T × W^* (Rubin Theorem 4.1); its
  `poitou-tate` and `restricted-product-cohomology` nodes are cited directly.
- `ArithmeticGaloisDuality:R02.2`: Hochschild–Serre for the inertia and unramified quotients.
- Tau Ceti ProfiniteCohomology Layers 11 and 12: cohomological dimension 1, and cup-product
  naturality.
- Tau Ceti LocalFieldsRamification Layer 4: the tame quotient of inertia.
- Tau Ceti ProfiniteCohomology Layer 9: Hilbert 90, the Kummer isomorphism and its squares.
- Tau Ceti ProfiniteCohomology Layer 5: inflation–restriction.
- Tau Ceti LocalFieldsRamification Layer 1: the structure of K^×.
- Tau Ceti GlobalNumberFields: Dirichlet's S-unit theorem.
- Tau Ceti EllipticCurves Layer 7: finite-level Selmer and Ш.
- `IntegralIwasawaTheory:L1`: X_∞, Y_∞ and their c-eigenspaces (L4).
- `PadicHodgeRegulators:L1`: the Bloch–Kato condition H¹_f (L4).

## Acceptance

- The identification H¹(G_K, ℤ_p(1)) ≅ lim K^×/(K^×)^{p^m} with the lim¹ term shown to vanish.
- The tensor comparison, proved for units and S-units and refuted for local fields and F^×.
- The Selmer-kernel API with strict, relaxed, unramified and Greenberg conditions.
- The change-of-conditions sequence.
- Propagation and saturation.
- The corank of Sel_{p^∞}.
- Dual local conditions defined for the named local Tate pairing, with F^⊥⊥ = F.
- Poitou–Tate for Selmer groups proved from global duality, with the lim¹ terms explicit in the limit
  form.

## Remaining work

- **L0:** compatibility of the identification with cup products and with Shapiro's lemma.
- **L1:**
  - the Selmer-complex duality map from D7, which is not yet planned there;
  - the annihilators of the Greenberg conditions (Nekovář, *Selmer complexes*, §6.7). The transverse
    condition and the finite–singular comparison belong to EulerSystemsAndKolyvaginSystems ES.1.
- **L2:**
  - the Selmer complex as a mapping fibre (Nekovář, Selmer complexes) with its H⁰ conditions;
  - primitive/imprimitive sequences and lattice-change formulas.
- **L3 (partial):**
  - duality for Iwasawa cohomology;
  - determinant lines with PadicMeasuresIwasawaAlgebras L5;
  - finite-slope and exceptional-zero correction complexes;
  - Selmer control theorems;
  - Burungale–Tian's lattice-independence item (Kato §12.2).
- **L4 (partial):**
  - the Gamma factor from Hodge data;
  - the Bloch–Kato–Greenberg comparison with exceptional factors;
  - lattice and local-condition changes with control;
  - the comparison with IntegralIwasawaTheory's exact sequence;
  - determinants (PadicMeasuresIwasawaAlgebras L5);
  - Burungale–Tian's bk-selmer and elliptic-bk items.

## Sources

- K. Rubin, *Euler systems*, author draft of Annals of Mathematics Studies 147.
- B. Mazur and K. Rubin, *Controlling Selmer groups in the higher core rank case*, arXiv:1312.4052v1.
- J. Nekovář, *Selmer complexes*, Astérisque 310 (2006), Numdam. Read Chapter 8, §§8.3–8.4 (pp. 202–216).
- J. Rodrigues Jacinto and C. Williams, *An introduction to p-adic L-functions*, arXiv:2309.15692v2.
- A. Burungale and Y. Tian, *A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and
  Rubin*, arXiv:2506.03465v2.
