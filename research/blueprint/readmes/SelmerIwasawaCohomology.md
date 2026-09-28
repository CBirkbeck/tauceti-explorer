# Selmer groups, continuous integral cohomology and Iwasawa cohomology — blueprint

This blueprint covers stages L0–L4, within the boundaries RS-08 accepted. This first checkpoint plans:
- **L0:** the p-adic Kummer identification, with its completions and inverse-limit bookkeeping;
- **L2:** the generic Selmer-kernel API, with its standard local conditions.

It follows these sources:
- Rubin, *Euler systems*: Chapter I §§2, 3, 5 and 6, and Appendix B §2.
- Mazur–Rubin, *Controlling Selmer groups in the higher core rank case*: §§1–3.
- Rodrigues Jacinto–Williams (RJW), *An introduction to p-adic L-functions*: §10.5 and §13.5.
- Burungale–Tian, *A rank zero p-converse*, as the maintainer asked.

L1, L3 and L4 are not yet read.

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
- R02.3 owns G_{F,S} and global finiteness; D7 owns compact support and derived duality.
- Tau Ceti ProfiniteCohomology owns discrete cohomology: Layer 5 exact sequences, Layer 6
  corestriction and Layer 9 finite-level Kummer theory and Hilbert 90.

**Kept here.**
- **L0:** the tower-compatible identification H¹(F, ℤ_p(1)) ≅ lim F^×/(F^×)^{p^m} with its
  hypotheses, and the completion-versus-tensor comparisons.
- **L2:** the generic Selmer kernel, local conditions and mapping fibre.

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

## Source findings

- **E1.** RJW (10.7)/(10.8) state F^× ⊗ ℤ_p ≅ H¹(F, ℤ_p(1)). With an algebraic tensor product
  this fails:
  - for number fields the map is not surjective;
  - for p-adic fields it is not injective.

  The target must be the completion, and the passage to the limit needs lim¹ μ_{p^m} = 0.
- **E2.** RJW Definition 13.19 asks for a G_ℚ-invariant ordinary filtration. Greenberg's filtration
  is stable only under G_{ℚ_p}; V_pE of an ordinary non-CM curve has no G_ℚ-stable line.

## Requests

- `ArithmeticGaloisDuality:R02.1`: compact coefficients, the Milnor sequence, H¹(T) → H¹(V) →
  H¹(W).
- `ArithmeticGaloisDuality:R02.3`: G_{F,S}, localisations and the S-unit Kummer sequence.
- Tau Ceti ProfiniteCohomology Layer 9: Hilbert 90, the Kummer isomorphism and its squares.
- Tau Ceti ProfiniteCohomology Layer 5: inflation–restriction.
- Tau Ceti LocalFieldsRamification Layer 1: the structure of K^×.
- Tau Ceti GlobalNumberFields: Dirichlet's S-unit theorem.
- Tau Ceti EllipticCurves Layer 7: finite-level Selmer and Ш.

## Acceptance

- The identification H¹(G_K, ℤ_p(1)) ≅ lim K^×/(K^×)^{p^m} with the lim¹ term shown to vanish.
- The tensor comparison, proved for units and S-units and refuted for local fields and F^×.
- The Selmer-kernel API with strict, relaxed, unramified and Greenberg conditions.
- The change-of-conditions sequence.
- Propagation and saturation.
- The corank of Sel_{p^∞}.

## Remaining work

- **L0:** compatibility of the identification with cup products and with Shapiro's lemma.
- **L1:** annihilators and saturation of the L2 conditions under local duality (Mazur–Rubin
  Proposition 1.7, Rubin I §§4, 7), and the Selmer-complex duality map from D7.
- **L2:**
  - the Selmer complex as a mapping fibre (Nekovář, Selmer complexes) with its H⁰ conditions;
  - primitive/imprimitive sequences and lattice-change formulas.
- **L3:** Iwasawa cohomology and control, including Burungale–Tian's etale-iwasawa,
  lattice-independence, strict-selmer and tower units-kummer items.
- **L4:**
  - RJW §13.5.2 and Conjecture 13.21;
  - Bloch–Kato conditions;
  - Burungale–Tian's bk-selmer and elliptic-bk-comparison items.

## Sources

- K. Rubin, *Euler systems*, author draft of Annals of Mathematics Studies 147.
- B. Mazur and K. Rubin, *Controlling Selmer groups in the higher core rank case*, arXiv:1312.4052v1.
- J. Rodrigues Jacinto and C. Williams, *An introduction to p-adic L-functions*, arXiv:2309.15692v2.
- A. Burungale and Y. Tian, *A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and
  Rubin*, arXiv:2506.03465v2.
