# Euler systems and the unconditional cyclotomic main conjecture — blueprint

This blueprint covers stages L0–L4. The first checkpoint decomposes **L0**, the Euler system of
cyclotomic units and its χ-twist. The second plans **L1**'s finite-level class-group bound, the third plans **L2**'s
Iwasawa-theoretic divisibility, the fourth plans **L3**, the main conjecture for odd p, the fifth starts **L4**
(Greither, all p), and the sixth plans Greither's class-group theorems (§4). It follows:
- Rubin, *Euler systems*, Chapter III §2.1–2.4, with the Chapter I–II definitions they use;
- Rodrigues Jacinto–Williams (RJW), *An introduction to p-adic L-functions*, §10.2 and §10.5.

L1, L3 and L4 are partial, and L2 is source-decomposed.

## Purpose

The route to the main conjecture is Kolyvagin–Rubin:
1. cyclotomic units give an Euler system for ℤ_p(1);
2. its χ-twists bound χ-parts of class groups by χ-parts of unit indices (L1);
3. the Iwasawa version gives characteristic-ideal divisibility (L2);
4. the class number formula upgrades divisibility to equality (L3);
5. Greither extends everything to abelian fields and to p = 2 (L4).

L0 supplies the arithmetic input: the units, their norm relations, the Kummer classes, the Euler
system itself, and the unit c_ℚ = ξ_{L,χ}^{1 − χ⁻¹(p)} that L1 feeds into Rubin's Theorem II.2.2.

## What the libraries supply

AUDIT records all five layers as not built.

**Mathlib supplies:**
- `IsCyclotomicExtension`, with degree `IsCyclotomicExtension.finrank` and Galois group
  `IsCyclotomicExtension.autEquivPow`;
- norms via `Algebra.norm`, with transitivity `Algebra.norm_norm` and the Galois product
  `Algebra.norm_eq_prod_automorphisms`;
- `IsPrimitiveRoot.sub_one_norm_eq_eval_cyclotomic` (the norm of ζ − 1 over ℚ);
- `IsPrimitiveRoot.geom_sum_isUnit` (the smoothed units ∑_{i<a} ζ^i are units);
- `sub_one_dvd_natCast_of_pow_eq_one`;
- the prime (ζ − 1) above p in ℚ(μ_{p^k});
- invariants and averaging maps of representations.

**Tau Ceti supplies** the finite-level Kummer map `TauCeti.kummerMap : Kˣ → H¹(G_K, μ_n)` with its
kernel (`TauCeti.kummerMap_eq_one_iff`).

**Missing:** everything below.

## Conventions

- ζ_m is a compatible system: ζ_{mn}^n = ζ_m.
- Fr_ℓ is the arithmetic Frobenius, ζ_m ↦ ζ_m^ℓ, and Euler factors use Fr_ℓ⁻¹, as in both Rubin and
  RJW Definition 10.16.
- The cyclotomic numbers are **1 − ζ**, not Rubin's ζ − 1. The two differ by
  (−1)^{[ℚ(μ_{mℓ}):ℚ(μ_m)]}.
  - With 1 − ζ the distribution relation holds for every prime ℓ with no sign.
  - Rubin's display (III.2) is wrong at ℓ = 2 (sourceIssues E1): N_{ℚ(i)/ℚ}(i − 1) = 2 ≠ ζ₂ − 1.
  - For odd p the sign is invisible in H¹(F, ℤ_p(1)).
- χ is even, nontrivial and of order prime to p, with conductor f, fixed field L and Δ = Gal(L/ℚ).
  It is also a Dirichlet character modulo f with χ(q) = 0 for q ∣ f.

## Milestones

Library module `TauCeti/NumberTheory/EulerSystem/Cyclotomic`, namespace
`TauCeti.CyclotomicEulerSystem`.

### Milestone 1: the distribution relation

Setting: K = ℚ(μ_m) ⊆ L = ℚ(μ_{mℓ}), as `IsCyclotomicExtension {m}` and `{mℓ}` over ℚ; ζ ∈ L is
primitive of order mℓ, and η = ζ^ℓ.

**Lemma: minimal polynomial, ℓ ∣ m** (`minpoly_eq_X_pow_sub_of_dvd`; node `minpoly-step-of-dvd`).
minpoly_K(ζ) = X^ℓ − η.

**Lemma: minimal polynomial, ℓ ∤ m** (`minpoly_mul_X_sub_eq_of_not_dvd`; node
`minpoly-step-of-not-dvd`). With ℓℓ' ≡ 1 (mod m), minpoly_K(ζ)·(X − η^{ℓ'}) = X^ℓ − η.

**Lemma: distribution relation, ℓ ∣ m** (`norm_one_sub_of_dvd`; node `distribution-relation-of-dvd`).
N(1 − ζ_{mℓ}) = 1 − ζ_m.

**Theorem: distribution relation, ℓ ∤ m** (`norm_one_sub_mul_of_not_dvd`; node
`distribution-relation-of-not-dvd`; planet "Distribution relation"). N(1 − ζ_{mℓ})·(1 − ζ_m^{ℓ'}) =
1 − ζ_m, that is N(1 − ζ_{mℓ}) = (1 − ζ_m)^{1 − Fr_ℓ⁻¹} for m > 1.

**Lemma: the Frobenius form** (`norm_one_sub_mul_frobenius`; node `distribution-relation-frobenius`).
The same relation with Fr_ℓ⁻¹ given by Mathlib's `autEquivPow`.

**Comparison: Rubin's convention** (`norm_sub_one_eq_neg_one_pow_mul`; node
`distribution-relation-rubin-convention`). N(ζ − 1) = (−1)^{[L:K]}N(1 − ζ). This yields the
corrected form of Rubin's (2).

**Lemma: conductor one** (`norm_one_sub_of_prime`; node `distribution-relation-conductor-one`).
N_{ℚ(μ_ℓ)/ℚ}(1 − ζ_ℓ) = ℓ for every prime ℓ, including ℓ = 2.

### Milestone 2: the cyclotomic numbers

**Construction: c̃_m** (`pCycNumber`; node `p-extended-cyclotomic-number`; planet "Cyclotomic units
c̃_m"). c̃_m = N_{ℚ(μ_{mp})/ℚ(μ_m)}(1 − ζ_{mp}), Rubin's c̃_{m∞}. The extra norm from level mp makes
the family compatible in the p-direction.

*API.*
- `pCycNumber_of_dvd`: c̃_m = 1 − ζ_m if p ∣ m.
- `pCycNumber_one`: c̃_1 = p.
- `pCycNumber_ne_zero`.
- `relNorm_zeta_sub_one_eq`: Rubin's element is (−1)^{[ℚ(μ_{mp}):ℚ(μ_m)]}c̃_m.

*Unit tests.*
- For p = 3, c̃_1 = 3.
- For p = 5, c̃_3 = −ζ_3, so an individual c̃_m can be torsion.
- For p = 5, c̃_5 = 1 − ζ_5.
- RJW's (ζ⁻¹ − 1)/(ζ − 1) = −ζ⁻¹ is torsion.

**Lemma: tower relation** (`relNorm_pCycNumber_mul_p`; node `p-extended-tower-relation`).
N_{ℚ(μ_{mp})/ℚ(μ_m)}(c̃_{mp}) = c̃_m.

**Lemma: auxiliary-prime relation** (`relNorm_pCycNumber_mul_prime`; node
`p-extended-auxiliary-relation`). For ℓ ≠ p, N(c̃_{mℓ}) = c̃_m^{1 − Fr_ℓ⁻¹} if ℓ ∤ m, and c̃_m if
ℓ ∣ m. This includes m = 1, since c̃ is a norm from level mp > 1.
- *Proof:* transitivity of norms in the square of levels m, mp, mℓ, mℓp, then the distribution
  relation at level mp.
- The relation was checked numerically in 812 cases, including p = 2 and ℓ = 2.

**Lemma: not torsion** (`not_isOfFinOrder_pCycNumber_pow`; node `p-extended-nontorsion`). c̃_1 = p,
and N_{ℚ(μ_{p^k})/ℚ}(c̃_{p^k}) = p.

**Construction: the real numbers c̃_m^+** (`pCycNumberReal`; node `real-p-extended-number`).
c̃_m^+ = N_{ℚ(μ_m)/ℚ(μ_m)^+}(c̃_m), Rubin's c̃_m, attached to the ray class field modulo m.

*API.*
- `pCycNumberReal_eq_mul_conj`: c̃_m^+ = c̃_m·c̄̃_m for m > 2.
- `pCycNumberReal_of_le_two`.
- `pCycNumberReal_ne_zero`.

*Unit tests.*
- For p = 3, c̃_3^+ = 3.
- c̃_1^+ = p.
- For p = 5, c̃_5^+ = (5 − √5)/2, which is not c̃_5.

**Lemma: relations for c̃^+** (`relNorm_pCycNumberReal_mul_p`; node `real-relations`). The tower and
auxiliary relations hold for c̃^+.

**Comparison: smoothed units** (`one_sub_pow_div_one_sub_eq_geom_sum`; node
`smoothed-unit-comparison`). For m ≥ 2 and (a, m) = 1:
- c_m(a) = (1 − ζ_m^a)/(1 − ζ_m) = ∑_{i<a} ζ_m^i, a unit, equal to c̃_m^{σ_a − 1} when p ∣ m;
- for m = p^n this is RJW's c_n(a);
- σ_a − 1 is the image of the smoothing divisor θ_a = δ_a − δ_1 of
  `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure` under the finite projection of
  `PadicMeasuresIwasawaAlgebras:L1`.

### Milestone 3: the Euler system

**Lemma: the hypotheses on ℚ^ab** (node `qab-euler-hypotheses`). (ℚ^ab, N = p) satisfies Rubin's
Definition II.1.1:
- ℚ(q) ⊆ ℚ(μ_q);
- the cyclotomic ℤ_p-extension has no finite prime splitting completely;
- the fields of Remark II.1.3 are ℚ(μ_m) and ℚ(μ_m)^+.

**Construction: Kummer classes** (node `cyclotomic-kummer-classes`). κ_N(c̃_m) ∈ H¹(G_{ℚ(μ_m)},
μ_{p^N}) by `TauCeti.kummerMap`, and their limit κ(c̃_m) ∈ H¹(ℚ(μ_m), ℤ_p(1)).

*API.*
- `pCycKummerClass_eq_zero_iff`: zero exactly on p^N-th powers.
- `pCycKummerClass_neg`: for p odd, −1 is invisible.
- `pCycKummerClass_cor`: Cor ∘ κ = κ ∘ N.
- `pCycKummerClass_galois`.
- `pCycKummerClass_compatible`: compatibility in N.

*Unit tests.*
- κ_1(c̃_1) = κ_1(p) ≠ 0.
- κ_N(x^{p^N}) = 0.
- For p = 5, κ_N(c̃_3) = 0: a torsion element of order prime to p is invisible.

**Theorem: the Euler system of cyclotomic units** (node `cyclotomic-euler-system`; planet). The classes
κ(c̃_m) and κ(c̃_m^+) form an Euler system for (ℤ_p(1), ℚ^ab, p). The Euler factor is
P(Fr_q⁻¹ | ℤ_p(1)^*; Fr_q⁻¹) = 1 − Fr_q⁻¹, the same in Rubin's and RJW's conventions.

### Milestone 4: χ-components and the χ-cyclotomic units

**Construction: χ-components** (`chiComponent`; node `chi-component`; planet). M^χ = {x : δx =
χ(δ)x}, Rubin's Definition I.6.2.

*API.*
- `mem_chiComponent`.
- `mem_chiComponent_iff_twist`: Rubin's (B̂ ⊗ O_{χ⁻¹})^Δ, that is Mathlib's invariants of the twist.
- `chiComponent_map`.
- `chiComponent_map_eq`: exactness when |Δ| ∈ O^×.

*Unit tests.*
- χ = 1 gives the invariants.
- Trivial action with χ ≠ 1 gives 0.
- O[Δ]^χ has rank one.
- For Δ = ℤ/p over 𝔽_p there is no decomposition.

**Construction: twisted sums** (`chiSum`; node `chi-sum`). chiSum_χ(x) = ∑_δ χ(δ)⁻¹δx, the
additive form of ∏(δx)^{χ⁻¹(δ)}.

*API.*
- `chiSum_mem`.
- `chiSum_add`.
- `chiSum_of_mem`: multiplication by |Δ| on M^χ.
- `chiSum_chiSum`.

*Unit tests.*
- The trivial character on a trivial module gives |Δ|x.
- The trivial group gives the identity.
- chiSum(u − u) = 0.

**Lemma: the Frobenius factor** (`chiSum_sub_frobenius`; node `chi-sum-frobenius`).
chiSum(u − φ⁻¹u) = (1 − χ(φ)⁻¹)chiSum(u).

**Lemma: units from roots of unity** (`isUnit_one_sub_of_pow_eq_one`; node
`one-sub-root-of-unity-unit`). If ω^n = 1, ω ≠ 1 and n ∈ O^×, then 1 − ω ∈ O^×.

**Construction: ξ_{n,χ}** (`xiChi`; node `chi-cyclotomic-generator`). ξ_{n,χ} = chiSum_χ(1 ⊗ u_n),
where u_n is the norm of 1 − ζ_{fp^{n+1}} (resp. 1 − ζ_f) to L_n.
- It equals Rubin's product over Gal(ℚ(μ_f)/ℚ).
- Taking the norm to L first avoids a descent step when p divides [ℚ(μ_f) : L].

*API.*
- `xiChi_mem`.
- `xiChi_neg`: the sign convention does not matter for χ ≠ 1.
- `xiChi_eq_prod`.
- `xiChi_smul`.

*Unit tests.*
- For χ quadratic of conductor 5 and p = 3, ξ_{L,χ} = ε⁻² with ε = (1 + √5)/2.
- The sign convention leaves ξ unchanged.
- The trivial character is excluded.

**Lemma: ξ is a unit** (`xiChi_mem_units`; node `chi-cyclotomic-generator-unit`). For χ ≠ 1,
ξ_{n,χ} ∈ E_n^χ. For prime-power conductor, the Δ-invariant prime above ℓ is killed by ∑χ⁻¹(δ) = 0.

**Construction: C_{n,χ}** (`chiCyclotomicUnits`; node `chi-cyclotomic-units`; planet). The
O[Gal(L_n/ℚ)]-span of ξ_{n,χ}; for n = 0 it is O·ξ_{L,χ}.

*API.*
- `chiCyclotomicUnits_le`.
- `chiCyclotomicUnits_stable`.
- `chiCyclotomicUnits_eq_span`.
- `chiCyclotomicUnits_index_finite`.

*Unit tests.*
- For conductor 5, p = 3: index 1, matching h(ℚ(√5)) = 1.
- The same with p = 5.
- RJW's torsion choice would give 0.

**Theorem: the twisted class** (node `twisted-class-formula`). This is Rubin's (4). Under
H¹(ℚ, T^*) ≅ (L^×)^χ, the twist c_ℚ corresponds to ∏_{δ∈Gal(ℚ(μ_{fp})/ℚ)} (1 − ζ_{fp}^δ)^{χ⁻¹(δ)}.

**Theorem: c_ℚ = ξ_{L,χ}^{1 − χ⁻¹(p)}** (`cQUnit_eq`, `cQUnit_eq_of_dvd`; node
`twisted-class-eq-xi-power`; planet "Twisted cyclotomic class"). This is Rubin's (6).
- *Proof:* the distribution relation at ℓ = p and the Frobenius factor.
- If χ(p) = 1 then c_ℚ = 0, which is the origin of Rubin's hypothesis χ(p) ≠ 1.

**Lemma: generation** (`span_cQUnit`; node `twisted-class-generates`). If χ(p) ≠ 1, c_ℚ generates
C_{L,χ}.

## Layer L1: the class-group bound (partial)

Checkpoint 2 plans Rubin's Theorem III.2.3 and its proof. Throughout, p > 2 and χ is even, nontrivial, of order prime to
p, with χ(p) ≠ 1. Rubin's Theorem II.2.2, the error-tolerant Euler-system bound, is imported from
EulerSystemsAndKolyvaginSystems ES.4.

**Lemma: hypotheses and error terms** (node `cyclotomic-hypotheses-and-error-terms`).
- T* = O_{χ^{−1}}(1) has rank one, so Hyp(ℚ, T*) holds with τ = 1.
- Ω = L(μ_{p^∞}).
- Both error terms vanish by Lemma III.1.1: χ ≠ 1, and the even χ is not congruent to the odd cyclotomic character.

**Lemma: rank-one units and the index** (node `chi-units-rank-one-and-index`).
- E_L^χ is free of rank one over O (the Galois-module unit theorem; requested).
- Since L^×/E_L is torsion-free, ind_O(c) = ℓ_O(E_L^χ/C_{L,χ}).

**Lemma: the Selmer group** (node `selmer-is-class-group`). H¹_f(ℚ_p, W) = 0 because χ(p) ≠ 1. By Proposition I.6.1,
S_{Σ_p}(ℚ, W) = S(ℚ, W) ≅ Hom_O(A_L^χ, D).

**Theorem: Kolyvagin's bound** (node `kolyvagin-class-group-divisibility`; planet; Rubin III.2.3). |A_L^χ| divides
[E_L^χ : C_{L,χ}].

**Theorem: the equality** (node `mazur-wiles-chi-equality`; Corollary III.2.4). Rubin cites [Ru3] Theorem 4.2. The
class-number-formula argument needs the bound for every even ψ ≠ 1 of Δ, and ψ(p) = 1 is covered only through the main
conjecture (Remark 2.5). This is recorded as a gap.

## Layer L2: Iwasawa divisibility (source-decomposed)

Checkpoint 3 plans Rubin's Theorem III.2.7 for odd p and even χ ≠ 1 of order prime to p, with no hypothesis on χ(p).
Rubin's Theorem II.3.3 and Proposition II.3.7 are imported from EulerSystemsAndKolyvaginSystems ES.8.

**Lemma: the hypotheses over ℚ_∞** (node `iwasawa-hypotheses-cyclotomic`). Hyp(ℚ_∞, T*) holds with τ = 1, and
Hyp(ℚ_∞/ℚ) holds over ℚ. No finite prime splits completely in ℚ_∞. So char(X_∞) divides ind_Λ(c).

**Theorem: the limit unit diagram** (node `limit-unit-diagram`; Proposition III.2.6).
- C_{∞,χ} ⊂ (E′_∞)^χ ⊂ Y_∞^χ ↠ Y_∞^χ/U_∞^χ matches the cohomological chain.
- Y_∞^χ/U_∞^χ ≅ ℤ_p[Δ/Δ_p]^χ, which is 0 or O according as χ(p) ≠ 1 or χ(p) = 1.
- (E′_∞)^χ/E_∞^χ ↪ O.

**Lemma: the Λ-index** (node `lambda-index-of-cyclotomic-units`). Y_∞^χ is torsion-free of rank one (Iwasawa;
requested). So ind_Λ(c) = char((E′_∞)^χ/C_{∞,χ}), which divides J·char(E_∞^χ/C_{∞,χ}).

**Theorem: the divisibility** (node `cyclotomic-iwasawa-divisibility`; planet). char(A_∞^χ) divides
char(E_∞^χ/C_{∞,χ}).
- The Euler-system bound gives the divisibility up to J².
- The J² is removed because J ∤ char(A_∞^χ). Leopoldt's conjecture for the real abelian L leaves no ℤ_p²-extension.
- When χ(p) = 1, these are the augmentation corrections the roadmap asks for.

## Layer L3: equality and the main conjecture (partial)

Checkpoint 4 plans RJW's Theorem 13.8 for every odd p, with Rubin's III.2.8–2.10. RJW's Propositions 13.13–13.14
are read with the corrections already in the register (PadicMeasuresIwasawaAlgebras/E5–E7).

**Lemma: the four-term sequence** (node `galois-unit-four-term-sequence`). The sequence
0 → E⁺/C⁺ → U⁺/C⁺ → X_∞⁺ → Y_∞⁺ → 0 is exact.
- Gal(M_∞⁺/L_∞⁺) ≅ U/E ≅ (U/C)/(E/C); RJW print E/U (E5).
- The inverse-limit step is justified by compactness, not by finite generation (E6).

**Lemma: the trivial component** (node `trivial-character-component`).
- e₁X_∞⁺ = e₁Y_∞⁺ = 0, because ℚ has a unique ℤ_p-extension.
- ([a] − [1])ζ_p takes the unit value −(1 − p⁻¹)·log_p(a) at the trivial character, so e₁(I(Γ⁺)ζ_p) is the unit ideal.

**Theorem: componentwise equality** (node `componentwise-iwasawa-equality`; Rubin III.2.8). The equality comes from the
componentwise divisibilities of L2, the class number formula at each layer, and control. Rubin cites the stabilisation
of the finite-layer errors to [MW] and Lang's appendix, which are not read. This is recorded as a gap.

**Theorem: the main conjecture** (node `cyclotomic-main-conjecture`; planet). X_∞⁺ is finitely generated and torsion,
and char(X_∞⁺) = I(Γ⁺)ζ_p for every odd p. In χ-parts this is char(Z_∞^χ) = L_χΛ (Rubin III.2.10).
- The local-unit theorem (RJW 12.23) is requested from ColemanPowerSeries L4.
- The Vandiver isomorphism (RJW 13.11) is not asserted.

## Layer L4: all abelian fields and p = 2 (partial)

Checkpoint 5 plans Greither, *Class groups of abelian fields, and the main conjecture* (Ann. Inst. Fourier 42 (1992)),
§§1–3.

**Definition: χ-parts for all p** (node `greither-chi-parts`). M_χ = M ⊗_{ℤ_p[Δ]} ℤ_p(χ) is only right exact when
p | |Δ|. Property (g) handles minus modules at p = 2.

**Theorem: semilocal units** (node `greither-semilocal-units`; Theorem 2.13, Corollary 2.14).
- (U_∞/C_∞)_ρ has the characteristic ideal of Λ/(G_p(T, ρ))*(1) after ⊗ℚ_p.
- The two are isomorphic when χ(p) ≠ 1.
- The Coleman theory is requested from ColemanPowerSeries L4.

**Theorem: the real main conjecture** (node `greither-real-main-conjecture`; Theorem 3.1). char(X_ρ) divides
char((E_∞/C_∞)_ρ) for every even ρ ≠ 1, including at p = 2.
- At p = 2 Greither modifies Rubin's Chebotarev step (Theorem 3.7), losing only a factor 2^{c+2}.
- μ = 0 and Leopoldt remove the accumulated factors.

**Lemma: Kummer duality** (node `greither-kummer-duality`; Lemma 3.3, Proposition 3.4).

**Theorem: the main conjecture for all p** (node `greither-main-conjecture-all-p`; planet; Theorem 3.2). For every odd
χ ≠ ω, char(X_χ) = (½G_p(T, χ̌)). The ½ matters only at p = 2.

Checkpoint 6 plans §4, the consequences for class groups. Greither's |x|_p = p^{v(x)} measures orders, so
|x|_p^{d(χ)} is the order of ℤ_p(χ)/x.

**Theorem B at p = 2** (node `greither-relative-class-group-bound`; Theorem 4.1). For F imaginary abelian,
unramified at 2, with Δ_2 cyclic, |A_2(F)_χ| is divisible by |½B_{1,χ^{−1}}|_2^{d(χ)} for every odd χ. The proof
splits on χ(2):
- χ(2) ≠ 1: Washington's inertia module and the coinvariant lemma.
- χ(2) = 1, the trivial zero, in four nodes:
  - `greither-split-prime-divisor-classes` (Lemma 4.2, Corollary 4.3): the classes of the primes above 2 give
    D_∞/D_∞^+ ≅ ℤ_2Δ/(1 + j), with characteristic ideal (T).
  - `greither-trivial-zero-reduction` (Lemma 4.4, Proposition 4.5, (***)): |A(F)_χ| is bounded below by
    |½G′_2(0, χ̌)|^{d(χ)} times a correction by Z/Z^+ and D_0/D_0^+.
  - `greither-split-units-quotient` (Proposition 4.7): Z/Z^+ is a quotient N(F) of 2-adic semilocal units.
  - `greither-gauss-sum-vectors` (construction; (G1), (G2), Lemma 4.8) and `greither-trivial-zero-formula`
    (Lemmas 4.9–4.10, Theorem 4.6): the valuation and logarithm vectors of a Gauss sum turn the correction into
    |½B_{1,χ^{−1}}|^{d(χ)}.

The Gauss sum lies in the decomposition field D of 2 in ℚ(μ_m), not in F as Greither says (source issue E5). For
m = 217 the fixed field F of an odd sextic character with χ(2) = 1 is strictly smaller than D, and σ_120 fixes F but
moves g. The node uses the norm N_{D/F}(g); Greither's sums over all b prime to m are the ones for this norm, so
Theorem 4.6 is unaffected. The Gross–Koblitz and Ferrero–Greenberg inputs, and Gross's non-vanishing, are a gap.

**Theorem A** (node `greither-iwasawa-leopoldt-two`; planet). |A_2(F)^−_χ| = |½B_{1,χ^{−1}}|_2^{d(χ)} for every
odd χ not of 2-power order. The divisibilities of Theorem B and the analytic class number formula give it. For the
2-power-order character the order is 2·|½B_{1,χ_2^{−1}}|_2^{d(χ_2)}·k_L with k_L = 1. The printed Remark b) omits the
exponent (E4); ℚ(ζ_5) shows it is needed.

**Real fields.**
- `greither-ray-class-real-fields` (Theorem 4.11): the χ_0-parts of the p-adic ray class group A′(F) have order
  ∏|½L_p(1, χ)|_p^{d(χ)}. This uses the main conjecture, Kummer duality, the p-adic class number formula and Leopoldt.
- `greither-ray-class-transfer` (Lemma 4.13): norm and inclusion maps with βα = N_C.
- `greither-real-iwasawa-leopoldt` (planet; Theorem C = 4.12): |A′(F)_χ| = |½L_p(1, χ)|_p^{d(χ)} for χ|Δ_0 ≠ ε
  and χ faithful on Δ_p. Theorem 4.12 as printed drops χ|Δ_0 ≠ ε (E9).
- `greither-gras-conjecture` (planet; Theorem 4.14, Corollary 4.15): |(E/C)_{χ′}| = |A(F)_{χ′}|·
  |((ℤ_p/2)[Δ])_{χ′}|·|(R : U)_{χ′}|. For |Δ| prime to p, [E/C̄] = [A(F)] in K_0(ℤ_p[Δ]), which is Gras's
  conjecture. The printed factor 2^{d(χ′)|Δ_p|} is right only for p = 2 (E10).

**Source issues E4–E11** (Greither; none was previously corrected):
- E4: Remark b), the missing exponent d(χ_2).
- E5 (error, affects the proof): g ∈ F fails; use N_{D/F}(g).
- E6: (G1) has an extra factor m and drops b.
- E7: L′_2 for L_2 in the formula L_2(s, χ̌) = G_2(u^s − 1, χ̌).
- E8: ζ_2(b/s) for ζ_2(b, s) in Lemma 4.8.
- E9: Theorem 4.12's missing hypothesis.
- E10: Theorem 4.14's factor for odd p.
- E11 (error, affects nothing): "no p-power roots of unity in F" is false at p = 2, but the step survives since
  N ≥ 2.

## Dependencies

**Inside this roadmap.** L0 feeds L1: Theorem III.2.3 takes c_ℚ, C_{L,χ} and the Kummer classes.

**Requested from other roadmaps.**
- `IntegralIwasawaTheory:L0` (RS-16 routes the global cyclotomic-unit definitions there):
  - the cyclotomic tower with its Galois groups, real subfields and relative norms;
  - units of subfields;
  - the index formula.
- `IntegralIwasawaTheory:I.1`: ℚ_∞, the layers L_n and decomposition groups.
- `EulerSystemsAndKolyvaginSystems:ES.2`:
  - the Euler-system carrier with Rubin's hypotheses;
  - the conductor presentation;
  - twisting and Lemma II.4.3.
- `SelmerIwasawaCohomology:L0`:
  - H¹(F, ℤ_p(1)) as a limit, with the Kummer identification;
  - the restriction isomorphism (3).
- Tau Ceti ProfiniteCohomology Layer 9: the Kummer norm square `kummerIso_norm`.
- Tau Ceti ClassFieldTheory Layer 12: the ray class fields of ℚ, and the idèlic correspondence of Proposition 4.7.
- `IntegralIwasawaTheory:L1`, `L2` and `L4` (checkpoint 6):
  - the class field theory of Greither §4;
  - the coinvariant lemma and Washington's pp. 277–278;
  - Leopoldt for abelian fields.
- `DirichletPadicLFunctions:L3` (checkpoint 6): L_p(s, χ) = G_p(u^s − 1, χ) and the p-adic class number formula.

**Imported nodes.**
- `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure` (θ_a).
- `PadicMeasuresIwasawaAlgebras:L1/finite-projection-algebra-map`, `dirac-hom` and `unit-reduction`.
- `FiniteFieldsAndCharacterSums:FF.1/stickelberger-relation` (Stickelberger's theorem, for (G1)).

## Acceptance

- The distribution relation for every prime ℓ, with the sign dictionary to Rubin's form.
- The tower and auxiliary relations for c̃ and c̃^+, including p = 2 and ℓ = 2.
- Non-torsion of the family.
- The Euler-system theorem, with (ℚ^ab, p) verified against Definition II.1.1 rather than assumed.
- The identity (6) with both cases, p ∤ f and p ∣ f.
- The worked example: conductor 5 with p = 3.

## Remaining work

- **L1 (partial, checkpoint 2):** Theorem III.2.3 and its proof are planned. Remaining:
  - the explicit derivative classes of the cyclotomic Euler system and their local conditions (Rubin IV–V applied
    to c);
  - Corollary III.2.4, which depends on [Ru3] or on L3 for the ψ(p) = 1 components (gap).
- **L2 is source-decomposed** (checkpoint 3). It depends on the ES.8, SelmerIwasawaCohomology L3 and IntegralIwasawaTheory
  requests (Iwasawa's rank-one theorem for Y_∞^χ, Leopoldt for real abelian fields).
- **L3 (partial, checkpoint 4):** the main conjecture is planned. Remaining: the finite-layer stabilisation of Corollary
  III.2.8 (gap), and the odd-character/class-group and Greenberg Selmer formulations (RJW §13.5).
- **L4 (partial, checkpoints 5–6):** Greither §§1–4 are planned. Remaining:
  - §2's lemmas and Coleman theory in detail;
  - §3's Lemmas 3.11–3.13;
  - the Gross–Koblitz gap in (G2);
  - Theorem 4.1 for odd p, which Greither cites to Mazur–Wiles and Solomon.

## Sources

- K. Rubin, *Euler systems*, author draft of Annals of Mathematics Studies 147 (2000), from the 1999
  Arizona Winter School notes.
- J. Rodrigues Jacinto and C. Williams, *An introduction to p-adic L-functions*, arXiv:2309.15692v2.
- C. Greither, *Class groups of abelian fields, and the main conjecture*, Ann. Inst. Fourier 42 (1992), 449–499
  (Numdam scan).
