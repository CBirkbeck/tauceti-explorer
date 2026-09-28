# Integral Hecke actions, determinants and interpolation — blueprint

This blueprint covers stages IHG.0–IHG.6. The first two checkpoints plan **IHG.0** (polynomial laws, determinants,
kernels and continuity) and begin **IHG.1** (Cayley–Hamilton algebras), from Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and
pseudorepresentations over arbitrary rings* (arXiv:0809.0415v2; LMS Lecture Notes 414 (2014)), §1 and Lemma 2.2.
Stages IHG.1–IHG.6 are not yet read.

## Purpose

A Galois determinant is the right coefficient-free substitute for a Galois representation when the coefficient ring
is not a field of characteristic 0 or > d. Pseudocharacters (traces) lose information in characteristic p ≤ d.
IHG.0 supplies:
- the objects: homogeneous and multiplicative polynomial laws, determinants, their characteristic polynomials and
  traces, and pseudocharacters;
- their basic operations: matrix determinants, direct sums, restriction and scalar extension;
- the comparison with pseudocharacters, in exactly the range where it holds.

RS-12 assigns generic Cayley–Hamilton reconstruction to IHG.1 and polynomial-law interpolation through finite
quotients to IHG.4, both of which build on these nodes. ArithmeticGaloisRepresentations R01.5 and AutomorphicCongruences
L0 import the laws and pseudorepresentations from here.

## What the libraries supply

AUDIT-33 was read before planning.
- **Mathlib has:**
  - `PolynomialLaw` (`M →ₚₗ[A] N`, natural in commutative coefficient algebras in the universe of A), with `ground`,
    `comp` and `id`;
  - the divided-power algebra `DividedPowerAlgebra` with `dp`, `lift` and `map`;
  - matrix determinants, traces and characteristic polynomials.
- **Absent from both libraries:** homogeneous laws, multiplicative laws, determinant laws, pseudocharacters, the
  grading Γ^n with its representability, and every statement below.

## Conventions

- A = commutative ring; R, B = associative unital A-algebras (not necessarily commutative); S = commutative
  A-algebras in the universe of A.
- A determinant of dimension d is a structure: a law R →ₚₗ[A] A, homogeneous of degree d and multiplicative.
- The characteristic polynomial is χ(x, t) := D_{A[t]}(t − x) = Σ (−1)^i Λ_i(x) t^{d−i}, and Tr := Λ_1.

## Milestones

Library module: `TauCeti/RingTheory/PolynomialLaw/Determinant`, namespace `TauCeti`.

### Milestone 1: laws

**Definition: homogeneous polynomial laws** (`PolynomialLaw.IsHomogeneousOfDegree`; node `homogeneous-polynomial-law`).
f_S(s x) = s^n f_S(x) for all S, s and x (Chenevier §1.1).

*API.* `isHomogeneousOfDegree_zero`, `IsHomogeneousOfDegree.add`, `IsHomogeneousOfDegree.comp` (degrees multiply), and
`isHomogeneousOfDegree_one_iff` (degree one is the base change of a linear map; Example 1.2(i)).

*Unit tests.*
- The identity has degree 1.
- The zero law has every degree.
- Over 𝔽_p, XY^p − X^pY has degree p + 1 and vanishes on 𝔽_p-points without being zero (Example 1.2(iii)).

**Definition: multiplicative polynomial laws** (`PolynomialLaw.IsMultiplicative`; node `multiplicative-polynomial-law`).
f_S(1) = 1 and f_S(xy) = f_S(x)f_S(y) for every S.

*API.* `isMultiplicative_id` and `IsMultiplicative.comp`. Degree-one multiplicative laws are algebra maps.

*Unit tests.*
- The identity.
- The matrix determinant.
- 2 • id is not multiplicative.

### Milestone 2: determinants

**Definition: determinants** (`Determinant A R d`; node `determinant`; planet "Determinants"). A multiplicative A-polynomial
law R → A, homogeneous of degree d (Chenevier §1.5).

*API.* `eval`, `eval_mul`, `eval_one`, `eval_smul` (D(ax) = a^d D(x)) and `isUnit_eval`.

*Unit tests.*
- `ofMatrix id` evaluates to det.
- A determinant of dimension 0 is constant 1.
- Over (ℤ/p)[X], two different p-dimensional determinants have the same trace.

**Construction: characteristic polynomial and trace** (`charpoly`, `trace`, `traceLinear`; node `characteristic-polynomial`;
Chenevier §1.10).
- χ(x, t) = D_{A[t]}(t − x) is monic of degree d, with constant term (−1)^d D(x).
- Tr = Λ_1 is A-linear, and Tr(1) = d.
- The Newton relations (1.3) hold.

*Unit tests.* χ(1, t) = (t − 1)^d; and for det ∘ ρ, the matrix characteristic polynomial and trace.

**Lemma: D(1 + rr′) = D(1 + r′r)** (`eval_one_add_mul_comm`; node `determinant-one-add-mul-comm`; Lemma 1.12(i)).
*Proof.* Directly when r is invertible. In general, pass to R[t]/(t^{d+1}), where 1 + tu is invertible, and use that
both sides have degree ≤ d in t.

**Construction: the determinant of a matrix representation** (`ofMatrix`; node `determinant-of-matrix-representation`).
det ∘ ρ for ρ : R → M_d(A).

*API.* `eval_ofMatrix`, `trace_ofMatrix`, `charpoly_ofMatrix` and `ofMatrix_conj`.

**Construction: direct sums** (`Determinant.mul`; node `determinant-direct-sum`). D_1·D_2 has dimension d_1 + d_2, and
traces and characteristic polynomials multiply accordingly. This is the product law of Chenevier's proof of Lemma 2.2,
pulled back along the diagonal.

**Construction: restriction** (`comap`; node `determinant-restriction`). Pull back along A-algebra maps; restriction to a
subgroup is the case A[H] → A[G].

*API.* `eval_comap`, `comap_id` and `comap_comp`.

**Construction: scalar extension** (`baseChange`; node `determinant-base-change`). This realises
M^d_A(R, S) ≅ M^d_S(R ⊗_A S, S) (Remark 1.4).

*API.* `eval_baseChange_tmul`, `charpoly_baseChange_tmul` and `trace_baseChange_tmul`.

**Comparison: dimension one** (`dimOneEquiv`; node `determinant-dimension-one`). One-dimensional determinants are A-algebra
maps R → A.

**Comparison: dimension two on a group** (`dimTwoEquiv`; node `determinant-dimension-two`; Lemma 1.9). They correspond to
pairs (T, D) with:
- D : G → A^× a homomorphism;
- T(1) = 2 and T(gh) = T(hg);
- D(g)T(g^{-1}h) − T(g)T(h) + T(gh) = 0.

### Milestone 3: pseudocharacters and the comparison

**Definition: pseudocharacters** (`IsPseudocharacter`; node `pseudocharacter`; planet "Pseudocharacters"). A central A-linear
T with T(1) = d and Σ_{σ ∈ S_{d+1}} sgn(σ)T^σ = 0, where T^σ is the product over the cycles of σ of T applied to the
cycle products (`cycleProduct`, `cycleTerm`).

*Unit tests.*
- The matrix trace is a d-dimensional pseudocharacter.
- The trace of M_2(ℚ) is not one-dimensional.
- The identity of ℚ is one-dimensional.

**Lemma: Amitsur's formula** (node `amitsur-formula`; (1.4)–(1.5)).
Λ_i(Σ t_j r_j) = Σ_{ℓ(w)=i} ε(w)Λ(w) over words, using Lyndon factorisations. The Lyndon factorisation theorem is a
recorded gap.

**Lemma: the trace is a pseudocharacter** (`Determinant.isPseudocharacter_trace`; node `trace-pseudocharacter`;
Lemma 1.12(iii)). This is the multilinear part of Amitsur's formula with i = n = d + 1.

**Lemma: injectivity of D ↦ Tr when d! is invertible** (`Determinant.injective_trace`; node `determinant-trace-injective`).
This follows from the Newton relations. **Chenevier's Proposition 1.27 states injectivity without this hypothesis.**
That is false in characteristic p ≤ d (source issue E1; the unit test above is the counterexample).

**Theorem: over ℚ-algebras determinants are pseudocharacters** (`Determinant.exists_unique_trace_eq`; node
`determinant-trace-bijective-rational`; planet "Determinants versus pseudocharacters"; Proposition 1.27). The proof uses
Procesi's theorem, which is a recorded gap.

**Theorem: the same when (2d)! is invertible, or d = 2 and 2 is invertible** (`Determinant.exists_unique_trace_eq_of_isUnit`;
node `determinant-trace-bijective-small`; Proposition 1.29). Whether d! ∈ A^× suffices is open (Remark 1.28).

### Milestone 4: kernels, the Cayley–Hamilton identity and continuity (second checkpoint)

**Construction: the law of a linear map** (`PolynomialLaw.ofLinearMap`; node `law-of-linear-map`). ℓ gives the degree-one
law S ⊗ ℓ.

**Definition: the kernel of a polynomial law** (`PolynomialLaw.ker`, `IsFaithful`; node `polynomial-law-kernel`; Chenevier
§1.17). x ∈ Ker(P) iff P_S(b ⊗ x + m) = P_S(m) for all S, b and m; P is faithful if Ker(P) = 0.

*API.* `exists_factor_iff_le_ker`.

*Unit tests.*
- The identity law is faithful.
- The zero law has kernel everything.
- On upper-triangular 2 × 2 matrices the determinant is Cayley–Hamilton but not faithful (Example 1.20(ii)).

**Lemmas on the kernel** (Chenevier, Lemma 1.18):
- `polynomial-law-factors-through-kernel`: P factors through M/K iff K ≤ Ker(P).
- `kernel-quotient-faithful`: the induced law on M/Ker(P) is faithful. Chenevier prints R/ker(P) → S (source issue E2).
- `kernel-base-change`: Ker(P) ⊗ B maps into Ker(P ⊗ B).

**Lemma: the kernel of a determinant** (`mem_ker_iff`, `mem_ker_iff'`; node `determinant-kernel-characterisation`;
Lemma 1.19(i)). r ∈ Ker(D) iff D_S(1 + r r′) = 1 for all S and r′, iff the same with r′ r.

**Construction: the kernel ideal** (`kerTwoSided`; node `determinant-kernel-ideal`; Lemma 1.19(ii)). Ker(D) is:
- a two-sided ideal;
- proper for d > 0 and R ≠ 0;
- the largest ideal through which D factors.

**Construction: the law χ and its coefficients** (`charpolyLaw`, `chiCoeff`; node `characteristic-polynomial-law`; §1.10).
χ(r) = r^d − Λ_1(r) r^{d−1} + ⋯. The coefficient χ_α is the coefficient of t^α in χ(Σ t_i r_i); it is extracted through
the monomial basis, since R may be noncommutative.

**Lemma: the Cayley–Hamilton identity** (`eval_one_add_chiCoeff_mul`; node `cayley-hamilton-identity`; Lemma 1.12(iv)).
D(1 + χ_α(r_1, …, r_n) r) = 1. The proof goes through Vaccarino's theorem (Theorem 1.15), which is a recorded gap.

**Lemma: descent to the coefficient subring** (`exists_restrict_coefficients`; node `determinant-coefficient-subring`;
Corollary 1.14). By Amitsur's formula, a determinant on a monoid takes values in the subring generated by the
coefficients of the χ(g, t).

**Definition: continuous determinants** (`Determinant.IsContinuous`; node `continuous-determinant`; §2.30). Every coefficient
g ↦ Λ_i(g) is continuous; by Amitsur's formula this is equivalent to Chenevier's condition on the D^{[α]}.

*API.* `eq_of_eqOn_dense` (Example 2.31: determined on a dense subgroup, for Hausdorff A) and
`isContinuous_iff_exists_openNormal` (Lemma 2.33: for profinite G and discrete A, continuity is openness of the kernel;
nodes `continuous-determinant-dense` and `continuous-iff-open-kernel`).

### IHG.1: Cayley–Hamilton algebras (started)

Library module: `TauCeti/RingTheory/PolynomialLaw/CayleyHamilton`.

**Construction: the Cayley–Hamilton ideal** (`chIdeal`; node `cayley-hamilton-ideal`; §1.17). CH(D) is the two-sided ideal
generated by all χ_α(r_1, …, r_n).

**Definition: Cayley–Hamilton algebras** (`IsCayleyHamilton`; node `cayley-hamilton`; planet "Cayley–Hamilton algebras").
The condition is CH(D) = 0, equivalently χ = 0 (`isCayleyHamilton_iff`).

*Unit tests.*
- (M_d(A), det) is Cayley–Hamilton and faithful.
- Upper-triangular matrices are Cayley–Hamilton but not faithful.

**Lemmas.**
- `cayley-hamilton-base-change`: stable under base change.
- `cayley-hamilton-subalgebra`: stable under restriction to subalgebras (Example 1.20(ii)). Faithfulness is not.
- `kernel-contains-cayley-hamilton`: CH(D) ⊆ Ker(D) (Lemma 1.21).
- `faithful-cayley-hamilton`: faithful determinants, and hence faithful quotients, are Cayley–Hamilton.

## Mistakes in the source

**E1 (error, a stated result).** Proposition 1.27 asserts that D ↦ Tr is injective for every A.
- The proof needs d! ∈ A^×.
- Counterexample: over 𝔽_p[X], the representations Y ↦ I_p and Y ↦ X·I_p of 𝔽_p[X][Y] have the same trace 0 but
  determinants 1 and X^p.
- The only later use (§3) is over ℚ_p-algebras, where the corrected statement applies.

**E2 (misprint).** Lemma 1.18(ii) prints "P̃ : R/ker(P) → S is faithful". The lemma is about a law P : M → N, so it
should read M/ker(P) → N.

## Remaining work

- **IHG.0:**
  - representability by Γ^d_A(R)^ab (the grading of Mathlib's DividedPowerAlgebra, representability and base change);
  - duality and the reduced norm of Azumaya algebras;
  - products of algebras (Lemma 2.2(iii));
  - finite projective rank-d representations;
  - the gaps: Lyndon factorisation, Procesi's theorem and Vaccarino's theorem.
- **IHG.1:**
  - Cayley–Hamilton representations and the universal algebra R(G, d) (Proposition 1.23);
  - generalized matrix algebras;
  - reconstruction over algebraically closed fields and henselian local rings (Theorems 2.12, 2.16 and 2.22);
  - reducibility ideals and extension modules.
- **IHG.2–IHG.6:** not yet read.

## Sources

G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary
rings*:
- arXiv:0809.0415v2, whose TeX source was read;
- the 2013 Durham symposium preprint, for page numbers;
- published in LMS Lecture Notes 414 (2014), 221–285; the published version was not accessed.
