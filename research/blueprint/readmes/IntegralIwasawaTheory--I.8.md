# Arithmetic Iwasawa theory and the main conjecture, part I.8 — blueprint

This part covers stages I.8, I.9 and L0–L4. This first checkpoint plans **L0**, the global
cyclotomic arithmetic that RS-16 assigns here: the cyclotomic tower, real subfields, cyclotomic
units, and the index formula. It follows Rodrigues Jacinto–Williams (RJW), *An introduction to
p-adic L-functions*: §10.2, §11 and §12.3.

The other stages are not yet read.

## Purpose

L0 supplies:
- the cyclotomic fields ℚ(μ_m) as one tower with compatible roots, Galois groups and norms;
- the global cyclotomic units D_n ⊆ 𝓞^×_{ℚ(μ_{p^n})};
- the classical link between these units and class numbers, h_n^+ = [V_n^+ : D_n^+].

**Consumers.**
- EulerSystemsCyclotomicMainConjecture:L0 builds its Euler system on this tower and requested it.
- ColemanPowerSeries:L4 takes the p-adic closures.
- L1 and L3 use the units in the main-conjecture sequences.

## What the libraries supply

AUDIT records L0 as partly built.

**Mathlib supplies:**
- cyclotomic extensions, with their Galois groups (`IsCyclotomicExtension.autEquivPow`);
- the CM structure of ℚ(μ_m): `IsCyclotomicExtension.Rat.isCMField`, complex conjugation, and
  Hasse's unit index `IsCMField.indexRealUnits`, which is 1 or 2, with its criterion;
- norms, with transitivity;
- the geometric-sum units (`IsPrimitiveRoot.geom_sum_isUnit`) and the associates ζ^a − 1 ~ ζ − 1;
- Dirichlet's unit theorem and the regulator;
- L(1, χ) ≠ 0;
- the residue of the Dedekind zeta function.

**Missing:** the tower, the unit groups D_n and D_n^+, their generators, the index formula, and
the analytic regulator computation.

## Conventions

- ζ_m = exp(2πi/m).
- ℚ(μ_m) = ℚ(ζ_m) ⊆ ℂ, and ℚ(μ_m)^+ = ℚ(ζ_m + ζ_m⁻¹).
- p is odd, as throughout RJW Part II.
- ζ^{1/2} denotes the square root of ζ in μ_{p^n}.

## L0. Global cyclotomic arithmetic and the index formula

Module `TauCeti/NumberTheory/Cyclotomic/Tower`, namespace `TauCeti.CyclotomicTower`.

**Construction: the cyclotomic tower** (`zeta`, `Qmu`, `relNorm`; node
`compatible-cyclotomic-tower`; planet).

*API.*
- `isPrimitiveRoot_zeta`.
- `zeta_mul_pow`: ζ_{mn}^n = ζ_m.
- `Qmu_mono`.
- `isCyclotomicExtension_Qmu`.
- `relNorm`.

*Unit tests.*
- ℚ(μ_1) = ℚ.
- [ℚ(μ_4) : ℚ] = 2.
- ℚ(μ_3) = ℚ(μ_6).
- Non-example: ℚ(μ_6) ⊆ ℚ(μ_3) although 6 ∤ 3.

**Lemma: Galois groups and norms** (`relNorm_relNorm`, `autEquivPow_restrict`; node
`tower-galois-compatibility`).
- Relative norms are transitive.
- Restriction of Galois groups is reduction (ℤ/n)^× → (ℤ/m)^×.

**Construction: real subfields** (`QmuPlus`; node `real-subfield`). ℚ(μ_m)^+ is the fixed field of
complex conjugation, of index 2 for m > 2.

*Unit tests.*
- ℚ(μ_5)^+ = ℚ(√5).
- ℚ(μ_3)^+ = ℚ.
- Non-example: ζ_5 ∉ ℚ(μ_5)^+.

**Construction: cyclotomic units** (`cyclotomicUnits`, `realCyclotomicUnits`; node
`cyclotomic-unit-group`; planet). D_n = 𝓞^× ∩ ⟨±ζ_{p^n}, ζ_{p^n}^a − 1⟩ and D_n^+ = D_n ∩ ℚ(μ_{p^n})^+
(RJW Definition 11.6).

*API.*
- `cyclotomicUnits_le`: D_n ⊆ 𝓞^×.
- `cyclotomicUnits_galois`: Galois stability.

*Unit tests.*
- D_1^+ = {±1} for p = 3.
- For p = 5, D_1^+ = ⟨−1, ε⟩.
- Non-example: ζ − 1 ∉ D_n.

**Construction: c_n(a) and γ_{n,a}** (`cUnit`, `gamma_real`; node `smoothed-cyclotomic-unit`).
- c_n(a) = ∑_{i<a} ζ^i is a unit.
- γ_{n,a} = ζ^{(1−a)/2}c_n(a) is real.
- σ_b(γ_{n,a}) = γ_{n,ab}/γ_{n,b}.

*Unit tests.*
- c_1(2) = −ζ_3² for p = 3.
- γ_{1,2} = −(1 + √5)/2 for p = 5.
- γ_{n,−1} = −1.

**Lemma: reduction to exponents prime to p** (`pow_sub_one_eq_prod`; node `prime-to-p-reduction`).

**Lemma: exponent sums vanish** (`associated_pow_sub_one`; node `valuation-balance`).

**Lemma: generators** (`cyclotomicUnits_eq_sup`; node `cyclotomic-unit-generators`). This is RJW
Lemma 12.18:
- D_n^+ = ⟨−1, γ_{n,a}⟩;
- D_n = ⟨ζ⟩·D_n^+.

**Lemma: cyclicity** (node `cyclic-generation`). For a primitive root a, D_n^+ = ℤ[Γ_n^+]·γ_{n,a}
(RJW Corollary 12.19), with −1 = γ_{n,−1}.

**Lemma: full and real indices** (`index_eq_index_real`, `indexRealUnits_eq_one`; node
`unit-index-real-full`). [V_n : D_n] = [V_n^+ : D_n^+], because Hasse's unit index is 1.

**Theorem: the index formula** (node `index-formula`; planet). h_n^+ = [V_n^+ : D_n^+] = [V_n : D_n]
(RJW Theorem 11.7). The analytic steps are recorded as a gap:
- the L(1, χ) formula for even χ;
- ζ_{ℚ(μ_m)^+} = ∏ L(s, χ);
- the group determinant;
- the discriminant.

## Source finding

**E81.** In the proof of RJW Corollary 12.19, the displayed chain writes γ_{n,b} where c_n(b) is
meant. The conclusion is unaffected; this is a new finding.

## Remaining work

- **L0:**
  - the analytic regulator computation (source: Washington, Theorem 8.2, not accessed);
  - general abelian fields (Sinnott);
  - p = 2.
- **L1:** the ℚ(μ_{p^∞})^+ specialisation of I.2 and the sequence 0 → E^+/C^+ → U^+/C^+ → X^+ → Y^+
  → 0.
- **L2:** control and class-number growth.
- **L3:** Vandiver.
- **L4:** abelian Leopoldt and Ferrero–Washington.
- **I.8:** the compactly supported Iwasawa complex.
- **I.9:** the all-prime determinant main conjecture.

## Sources

J. Rodrigues Jacinto and C. Williams, *An introduction to p-adic L-functions*, arXiv:2309.15692v2.
