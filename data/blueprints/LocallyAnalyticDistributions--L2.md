# Locally analytic distributions, Layer 2: admissible growth and uniqueness (follow-up part)

This document plans layer L2 of the roadmap *Locally analytic distributions, growth, and character spaces* to the
level of its key theorems. It continues the accepted whole-roadmap plan (`research/blueprint/packets/LocallyAnalyticDistributions.json`,
reviewed by REV-LocallyAnalyticDistributions). That plan stated L2's targets in sixteen declarations and left three
items open, and this part closes all three:

- the wavelet and density theory of Colmez's spaces C^r, and the moment bounds behind the multidegree uniqueness
  theorem, connected to typed box indicators, their refinement partition and the realization of the completed
  tensor as functions (§§2.A, 2.C, 2.E, 2.F);
- continuity of chart changes for higher vector orders, and finite Fourier inversion over a field containing the
  needed roots of unity (§§2.A, 2.B, 2.D, 2.F);
- the check of Loeffler's Definition 2.12 against every freely readable version. arXiv v1 and v2 fail in the same
  way as v3 (E11). The published chapter is not freely readable.

The sixteen declarations of the predecessor plan are not repeated here. They are cited as `L2/<name>` (predecessor
packet), and the new declarations refine them as recorded in the packet's `continuation` field. Together they cover
every target the stage states:

| Stage target | Declarations |
| --- | --- |
| order-h admissibility by norm estimates on small balls against locally polynomial test functions | 2.C.1 `admissible-algebraic-distributions`; `L2/order-r-distributions` |
| equivalences with coefficient-growth descriptions | `L2/order-r-distributions`, 2.A.10 `cr-mahler-criterion`, 2.C.5 `order-r-valuations` |
| extension and uniqueness under the Amice–Vélu–Vishik degree bound | `L2/amice-velu-vishik`, 2.C.2–2.C.4, 2.A.9 `cr-wavelet-basis` |
| order zero is bounded measures, in the setting of modular L-functions (ℤ_p and ℤ_p^×) | `L2/order-zero-measures`, 2.B.1 `order-on-one-dimensional-groups` |
| no strict uniqueness at critical slope | 2.C.7 `critical-kernel`, `L2/critical-vector-counterexample` |
| several variables with a vector of radii and growth bounds | `L2/anisotropic-tensor-wavelets` … `L2/rayclass-growth-adapter`, §§2.E–2.G |
| uniqueness from precisely the available locally algebraic characters | 2.D.3 `unit-character-determination`, `L2/locally-algebraic-determination` |

## Conventions

L ⊆ ℂ_p is a closed subfield, a finite extension of ℚ_p in applications, and K is a finite extension of ℚ_p in
several variables; v_p(p) = 1. For n ∈ ℕ, ℓ(n) is the number of base-p digits of n (ℓ(0) = 0), and n^− is n with its
leading digit removed, n mod p^{ℓ(n)−1}. [r] is the integer part of r ≥ 0. A ball is a + p^hℤ_p, the fibre of
reduction modulo p^h, and a box is B(a, m) = {x ∈ ℤ_p^g : v_p(x_j − a_j) ≥ m_j}, for a radius tuple m ∈ ℕ^g.
LP^{[0,N]}_h is the space of functions that are polynomial of degree ≤ N on every ball of radius p^{−h}, and LC = LP^{[0,0]}.

C^r(ℤ_p, L) is Colmez's space. φ has Taylor data φ^{(j)}, j ≤ [r], and the remainder
ε_{φ,r}(x, y) = φ(x + y) − Σ_{j≤[r]} φ^{(j)}(x)y^j/j! satisfies inf_{x, y∈p^hℤ_p} v_p(ε) − rh → +∞. The two valuations are
v′_{C^r} (from the definition) and the Mahler valuation v_{C^r}(φ) = inf_n(v_p(a_n(φ)) − rℓ(n)); they are equivalent
(2.A.10). D_r = C^r′ is the space of distributions of order r. The derivative of a distribution is the transpose
(dμ)(f) = μ(f′), with Amice multiplier +log(1 + T), as in `L1/amice-derivative`. Colmez's wavelets are
e_{i,k,r} = p^{[ℓ(i)r]}1_{i+p^{ℓ(i)}ℤ_p}((x − i)/p^{ℓ(i)})^k. In several variables, V_r = ⊗̂_{π,j}C^{r_j}(ℤ_p, K) is the
vector-order space of the predecessor plan, S(n) = ∏_j(n_j + p^{ℓ(n_j)}ℤ_p), and c_n(f) is the multivariable van der Put
coefficient (2.E.2). When explicit constants C_1 occur for tensor moments, use the projective norm induced by
the Mahler norms and its dual; the predecessor's c₀ coefficient norm is equivalent, with a conversion constant.

Native c₀ spaces are Mathlib's `ZeroAtInftyContinuousMap` on a discrete index set. Order-zero duals identify algebraically with Mathlib's
`AbstractMeasure X L L` (`D(X, L)`); this roadmap uses the dual operator norm, rather than identifying it with
the type synonym's chosen topology. Balls and boxes are fibres of `PadicInt.toZModPow`. The baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Neither library,
nor any roadmap of TauCetiRoadmap, has C^r spaces, wavelets or order-r distributions; the libraries supply Mahler's
theorem, the Amice transform of bounded measures, locally constant functions, and orthogonality of additive and
Dirichlet characters.

## How to read this part

Each declaration has its packet id, kind and exact statement. It then gives any hypotheses beyond the conventions, a
proof outline, the API and unit tests for definitions and constructions, its uses, its acceptance properties, its
direct prerequisites (*Needs*) and its source locator. Locators are printed page numbers of the versions recorded in
the packet; statements are in this roadmap's own words. Where a source is wrong, the corrected statement is used and
the correction is listed at the end. The suggested Lean file `research/blueprint/suggested/LocallyAnalyticDistributions--L2.lean`
contains real-bodied light predicates and functions over carriers present at the pins, selected end theorem
signatures, and a few examples. The normed C^r carriers, their duals, basis-coordinate constructions and completed
tensors are README targets; the file does not introduce placeholder data or proxy normed spaces.

## 2.A. Functions of class C^r in one variable

Colmez's §I.5 builds C^r(ℤ_p, L) from Taylor expansions with a uniform o(|y|^r) remainder. The predecessor packet states the space and its Mahler and wavelet descriptions as one definition (`L2/c-r-functions`). The targets below split that statement into the key steps of its proof: the Taylor data are the derivatives, locally analytic functions are C^r with explicit constants, the wavelets have bounded norms and bounded coefficients, Taylor truncations converge, and the wavelets form a Banach basis. Two further targets record differentiation (surjective, with locally polynomial kernel) and the algebra and composition structure used by every chart change below. Composition needs a hypothesis that the sources omit (E8, E9).

### 2.A.1 Locally polynomial functions of bounded degree

`LocallyAnalyticDistributions:L2/locally-polynomial-functions` · Definition.

For h ∈ ℕ and N ∈ ℕ, LP^{[0,N]}_h(ℤ_p, L) is the L-vector space of functions φ : ℤ_p → L such that, for every a ∈ ℤ_p, the restriction of φ to the ball a + p^hℤ_p agrees with a polynomial in x of degree at most N (the polynomial is unique, since balls are infinite). LP^{[0,N]}(ℤ_p, L) is the increasing union of the LP^{[0,N]}_h over h. For real s ≥ 0, LP^{[0,s]} means LP^{[0,[s]]}; LC_h = LP^{[0,0]}_h and LC = LP^{[0,0]} is the space of locally constant functions. For 0 ≤ i ≤ p^h − 1 and 0 ≤ k ≤ N the local monomials 1_{i+p^{ℓ(i)}ℤ_p}(x)·((x − i)/p^{ℓ(i)})^k form a basis of LP^{[0,N]}_h, so dim_L LP^{[0,N]}_h = p^h(N + 1); with i ranging over ℕ they form a basis of LP^{[0,N]}. For N = 0 this is the van der Put basis 1_{i+p^{ℓ(i)}ℤ_p} of LC.

*Proof outline.*
1. The local monomials 1_{a+p^hℤ_p}((x − a)/p^h)^k, a ∈ {0,…,p^h − 1}, k ≤ N, are a basis of LP^{[0,N]}_h: on each ball a polynomial of degree ≤ N is a unique combination of the powers of (x − a)/p^h.
2. For i ≤ p^h − 1, 1_{i+p^{ℓ(i)}ℤ_p} is the sum of the indicators 1_{i+jp^{ℓ(i)}+p^hℤ_p}, 0 ≤ j < p^{h−ℓ(i)}; the transition matrix from the 1_{i+p^{ℓ(i)}ℤ_p} to the 1_{i+p^hℤ_p} is unitriangular with integer entries (Colmez, proof of Proposition I.3.2). Expanding ((x − i)/p^{ℓ(i)})^k on the sub-balls by the binomial theorem keeps the matrix triangular in (i, k) (Proposition I.5.8, which adapts I.3.2).
3. A locally constant function on the compact space ℤ_p has finitely many clopen fibres, each a finite union of balls, so it lies in some LC_h; the same holds for LP^{[0,N]} by definition.

*API.*
- `TauCeti.LocallyAnalytic.LP` (constructor): LP N h : the L-subspace of functions ℤ_p → L that are polynomial of degree ≤ N on every ball a + p^hℤ_p; LPAll N is the union over h.
- `TauCeti.LocallyAnalytic.LP_mono` (relation): LP N h ≤ LP N' h' whenever N ≤ N' and h ≤ h'.
- `TauCeti.LocallyAnalytic.mem_LP_iff` (characterisation): φ ∈ LP N h iff for every a ∈ {0, …, p^h − 1} some polynomial P_a of degree ≤ N agrees with φ on a + p^hℤ_p.
- `TauCeti.LocallyAnalytic.LP_zero_eq_locallyConstant` (compatibility): LPAll 0 is the image of Mathlib's LocallyConstant ℤ_p L under the coercion to functions.
- `TauCeti.LocallyAnalytic.LP_basis` (characterisation): finrank_L (LP N h) = p^h(N + 1); a basis is given by the local monomials 1_{i+p^{ℓ(i)}ℤ_p}((x − i)/p^{ℓ(i)})^k, i < p^h, k ≤ N (colmezWavelet_basis).
- `TauCeti.LocallyAnalytic.LP_mul` (structure): The product of an element of LP N h and an element of LP M h lies in LP (N + M) h.
- `TauCeti.LocallyAnalytic.LP_comp_affine` (functoriality): For b ∈ ℤ_p and n ∈ ℕ, φ ↦ (x ↦ φ(b + p^n x)) maps LP N (h + n) into LP N h.

*Unit tests.*
- `LocallyAnalyticTests.LP_finrank_two` (computation): For p = 2, dim_L LP^{[0,1]}_1(ℤ_2, L) = 4: two balls, degree ≤ 1 on each.
- `LocallyAnalyticTests.LP_level_zero` (degenerate): LP^{[0,N]}_0 is the space of restrictions to ℤ_p of polynomials of degree ≤ N, of dimension N + 1.
- `LocallyAnalyticTests.LP_zero_locallyConstant` (compatibility): LP^{[0,0]}(ℤ_p, L) coincides with Mathlib's LocallyConstant ℤ_p L as a set of functions.
- `LocallyAnalyticTests.LP_square_not_linear` (non-example): x ↦ x² lies in no LP^{[0,1]}_h: on every ball it is a polynomial of degree exactly 2.

*Uses.* `Colmez, Theorem II.3.2`: algebraic distributions of degree ≤ N are the linear forms on LP^{[0,N]}; `Colmez, Proposition I.5.13`: the Taylor truncations φ_h of a C^r function lie in LP^{[0,r]}_h; 2.C.1 `admissible-algebraic-distributions`: its domain; 2.D.3 `unit-character-determination`: the functions χ(x)x^j 1_{ℤ_p^×} span LP^{[0,N]} on ℤ_p^× level by level; `ModularSymbolsPadicLFunctions:L2/interpolation-and-uniqueness`: the values of L_p on z^j·1_{a+p^nℤ_p} are values on LP^{[0,k]}.

*Acceptance.* x ↦ x lies in LP^{[0,1]}_0 and not in LC. 1_{pℤ_p} lies in LC_1 and not in LC_0. The function equal to x on pℤ_p and to 0 elsewhere lies in LP^{[0,1]}_1.

*Needs:* Mathlib `LocallyConstant`; Mathlib `PadicInt.toZModPow`; Mathlib `PadicInt.ker_toZModPow`.

*Source:* Colmez (author PDF), §I.3.1, Proposition I.3.2 and its proof, printed pp. 9–10; §I.5.4, definition of LP^I_h and Proposition I.5.8, printed p. 21: I.3.2 gives the van der Put basis of LC_h and LC with its unitriangular change of basis; §I.5.4 defines the locally polynomial spaces with degrees in a set I and Proposition I.5.8 gives the local monomial bases of LP^{[0,r]}_h and LP^{[0,r]}.

### 2.A.2 Colmez's wavelets e_{i,k,r}

`LocallyAnalyticDistributions:L2/colmez-wavelets` · Construction.

For r ≥ 0, i ∈ ℕ and k ∈ ℕ let e_{i,k,r}(x) = p^{[ℓ(i)r]}·1_{i+p^{ℓ(i)}ℤ_p}(x)·((x − i)/p^{ℓ(i)})^k. Then e_{i,k,r} ∈ LP^{[0,k]}_{ℓ(i)}(ℤ_p, ℚ_p), its sup norm is p^{−[ℓ(i)r]}, and for every h the e_{i,k,r} with 0 ≤ i ≤ p^h − 1 and 0 ≤ k ≤ [r] form a basis of LP^{[0,r]}_h(ℤ_p, L); with i ranging over ℕ they form a basis of LP^{[0,r]}(ℤ_p, L). The coordinates of φ ∈ LP^{[0,r]} in this basis are its amplitude coefficients b_{i,k}(φ). For j ≤ k and j ≤ r, (d/dx)^j e_{i,k,r} = k(k − 1)⋯(k − j + 1)·e_{i,k−j,r−j}.

*Proof outline.*
1. The basis statements follow from the local monomial bases of locally-polynomial-functions, since e_{i,k,r} is a nonzero scalar multiple of the local monomial (Colmez Lemma I.5.9).
2. Differentiate ((x − i)/p^{ℓ(i)})^k j times and use [ℓ(i)(r − j)] = [ℓ(i)r] − jℓ(i), as jℓ(i) is an integer (proof of Colmez Proposition I.5.16).
3. On the ball the factor ((x − i)/p^{ℓ(i)})^k has valuation ≥ 0, with a unit value at x = i + p^{ℓ(i)}, so the sup norm is |p^{[ℓ(i)r]}|.

*API.*
- `TauCeti.LocallyAnalytic.colmezWavelet` (constructor): colmezWavelet r i k : ℤ_p → L, the function e_{i,k,r}.
- `TauCeti.LocallyAnalytic.colmezWavelet_apply` (simp): colmezWavelet r i k x = p^{[ℓ(i)r]}·((x − i)/p^{ℓ(i)})^k if x ∈ i + p^{ℓ(i)}ℤ_p, and 0 otherwise.
- `TauCeti.LocallyAnalytic.colmezWavelet_mem_LP` (data): colmezWavelet r i k ∈ LP k ℓ(i).
- `TauCeti.LocallyAnalytic.colmezWavelet_basis` (characterisation): For each h, the e_{i,k,r} with i < p^h and k ≤ [r] form a basis of LP [r] h.
- `TauCeti.LocallyAnalytic.amplitudeCoeff` (projection): For 0 ≤ k ≤ [r], amplitudeCoeff r i k : LPAll [r] →ₗ L is the coordinate b_{i,k}; for k′ ≤ [r], amplitudeCoeff r i k (e_{i′,k′,r}) is 1 if (i, k) = (i′, k′) and 0 otherwise.
- `TauCeti.LocallyAnalytic.deriv_colmezWavelet` (relation): (d/dx)^j e_{i,k,r} = k!/(k − j)!·e_{i,k−j,r−j} for j ≤ k and j ≤ r.
- `TauCeti.LocallyAnalytic.colmezWavelet_zero` (simp): colmezWavelet r 0 k x = x^k, since ℓ(0) = 0.

*Unit tests.*
- `LocallyAnalyticTests.colmezWavelet_value` (computation): For p = 3, r = 1/2, i = 4 (ℓ(4) = 2, [ℓ(4)/2] = 1) and k = 0: e_{4,0,1/2} = 3·1_{4+9ℤ_3}, with value 3 at x = 13 and 0 at x = 1.
- `LocallyAnalyticTests.colmezWavelet_level_zero` (degenerate): e_{0,k,r}(x) = x^k on ℤ_p for every r.
- `LocallyAnalyticTests.colmezWavelet_r_zero` (compatibility): e_{i,0,0} equals Mathlib's LocallyConstant.charFn of the clopen ball i + p^{ℓ(i)}ℤ_p.
- `LocallyAnalyticTests.colmezWavelet_count` (computation): For p = 2, h = 2 and r = 1 there are 8 wavelets e_{i,k,1} with i < 4 and k ≤ 1, the dimension of LP^{[0,1]}_2(ℤ_2, L).
- `LocallyAnalyticTests.colmezWavelet_scaling_needed` (non-example): The unscaled indicators 1_{i+p^{ℓ(i)}ℤ_p} are not bounded in C^{1/2}: v′_{C^{1/2}}(1_{p^mℤ_p}) = −(m − 1)/2 → −∞, so the factor p^{[ℓ(i)r]} cannot be dropped.

*Uses.* `Colmez, Theorem I.5.14`: the e_{i,k,r} form a Banach basis of C^r; `Colmez, proof of Theorem II.3.2(ii)`: the values μ(e_{i,k,r}) of an admissible algebraic distribution are bounded; `Colmez, Proposition I.5.16`: the derivative formula proves surjectivity of d/dx on C^r; 2.F.1 `tensor-function-realization`: products of wavelets in each coordinate are the tensor wavelets.

*Acceptance.* e_{0,0,r} = 1 for every r. e_{i,0,0} = 1_{i+p^{ℓ(i)}ℤ_p}, the van der Put basis vector.

*Needs:* 2.A.1 `locally-polynomial-functions`.

*Source:* Colmez (author PDF), §I.5.4, definition of e_{i,k,r} before Lemma I.5.9 and Lemma I.5.9, printed p. 21; proof of Proposition I.5.16, printed p. 24: Defines the scaled local monomials e_{i,k,r} and states that for k ≤ r they are bases of LP^{[0,r]}_h and LP^{[0,r]}; the proof of I.5.16 records the derivative formula.

### 2.A.3 Coefficients of a polynomial are bounded by its values on a ball

`LocallyAnalyticDistributions:L2/taylor-coefficient-bounds` · Lemma.

Let N ∈ ℕ, C(N) = Σ_{n=1}^{N} v_p(n!), and a_0, …, a_N ∈ L. For every h ∈ ℤ, min_{0≤k≤N}(v_p(a_k) + kh) ≥ inf_{x ∈ p^hℤ_p} v_p(Σ_{k=0}^{N} a_k x^k/k!) − C(N).

*Proof outline.*
1. The top coefficient is the N-th forward difference with step p^h: a_N = p^{−Nh} Σ_{j=0}^{N} (−1)^{N−j} binom(N, j) P(x + jp^h), with P(x) = Σ a_k x^k/k!; taking x ∈ p^hℤ_p gives v_p(a_N) + Nh ≥ inf_{p^hℤ_p} v_p(P).
2. Subtract the top term: Q = P − a_N x^N/N! has inf_{p^hℤ_p} v_p(Q) ≥ inf_{p^hℤ_p} v_p(P) − v_p(N!); conclude by induction on N.

*Acceptance.* N = 0: v_p(a_0) ≥ inf v_p(a_0), with C(0) = 0. For P = x^N/N! and h = 0 the bound reads 0 ≥ −v_p(N!) − C(N).

*Needs:* Mathlib `fwdDiff_iter_eq_sum_shift`.

*Source:* Colmez (author PDF), Lemma I.5.3 and its proof, printed p. 19: States and proves this coefficient bound by the forward-difference formula and induction on N.

### 2.A.4 Taylor coefficients of a C^r function are its derivatives

`LocallyAnalyticDistributions:L2/cr-derivatives` · Theorem.

Let r ≥ 0 and φ ∈ C^r(ℤ_p, L) with Taylor data φ^{(j)}, 0 ≤ j ≤ [r]. Then the φ^{(j)} are uniquely determined by φ. If r ≥ 1, φ is differentiable at every point with φ′ = φ^{(1)} ∈ C^{r−1}(ℤ_p, L), and there is C_0(r) with v′_{C^{r−1}}(φ′) ≥ v′_{C^r}(φ) − C_0(r). More precisely, for 0 ≤ j ≤ [r], φ^{(j)} is the j-th derivative of φ, φ^{(j)} ∈ C^{r−j}(ℤ_p, L) with Taylor data (φ^{(j)})^{(k)} = φ^{(j+k)}, v′_{C^{r−j}}(φ^{(j)}) ≥ v′_{C^r}(φ) − C([r]) and C_{φ^{(j)}, r−j}(h) ≥ C_{φ,r}(h) − C([r]) for all h.

*Hypotheses.* C^r(ℤ_p, L), its remainder ε_{φ,r}(x, y) = φ(x + y) − Σ_{j≤[r]} φ^{(j)}(x)y^j/j!, the function C_{φ,r}(h) = inf_{x, y∈p^hℤ_p} v_p(ε_{φ,r}(x, y)) − rh and the valuation v′_{C^r} are those of LocallyAnalyticDistributions:L2/c-r-functions.

*Proof outline.*
1. Expanding ε(x, y + z) − ε(x + y, z) gives, for v_p(y), v_p(z) ≥ h, a polynomial identity in z whose coefficients are φ^{(j)}(x + y) − Σ_{k≤[r]−j} φ^{(j+k)}(x)y^k/k!, of valuation ≥ rh + C_{φ,r}(h).
2. taylor-coefficient-bounds turns this into v_p(φ^{(j)}(x + y) − Σ_k φ^{(j+k)}(x)y^k/k!) ≥ (r − j)h + C_{φ,r}(h) − C([r]), which gives membership of φ^{(j)} in C^{r−j}, the norm bound and the identity (φ^{(j)})^{(k)} = φ^{(j+k)}.
3. Uniqueness and the identification with derivatives follow: (φ(x + y) − φ(x))/y → φ^{(1)}(x), and induction on j.

*Acceptance.* For φ(x) = x², φ^{(1)} = 2x and φ^{(2)} = 2 for r = 2. The digit-doubling function of c-r-functions has derivative 0 everywhere but is not C²; the theorem only applies to functions already known to be C^r.

*Needs:* 2.A.3 `taylor-coefficient-bounds`; `L2/c-r-functions` (predecessor packet: Functions of class C^r).

*Source:* Colmez (author PDF), Proposition I.5.4 and Remark I.5.5, printed pp. 19–20: Proves that the Taylor data of a C^r function are its successive derivatives, lie in C^{r−j}, and records the bounds on v′_{C^{r−j}} and C_{φ^{(j)},r−j}.

### 2.A.5 Locally analytic functions are C^r with explicit bounds

`LocallyAnalyticDistributions:L2/cr-locally-analytic-bound` · Lemma.

For h ∈ ℕ and r ≥ 0, LA_h(ℤ_p, L) ⊆ C^r(ℤ_p, L), with v′_{C^r}(φ) ≥ v_{LA_h}(φ) − rh. For the Mahler valuation v_{C^r}(φ) = inf_n(v_p(a_n(φ)) − rℓ(n)) there is a constant C_1(r), independent of h, with v_{C^r}(φ) ≥ v_{LA_h}(φ) − rh − C_1(r) for every φ ∈ LA_h. In particular the normalised local monomial φ_{a,n,k} = 1_{a+p^nℤ_p}((x − a)/p^n)^k has v_{LA_n}(φ_{a,n,k}) = 0 and v_{C^r}(φ_{a,n,k}) ≥ −rn − C_1(r).

*Hypotheses.* LA_h(ℤ_p, L) and v_{LA_h} are those of LocallyAnalyticDistributions:L0/locally-analytic-radius.

*Proof outline.*
1. For φ ∈ LA_h, v_p(φ^{(j)}(x)/j!) ≥ v_{LA_h}(φ) − hj; the remainder is the analytic tail for v_p(y) ≥ h and a difference of values otherwise, which gives v′_{C^r}(φ) ≥ v_{LA_h}(φ) − rh (Colmez Proposition I.5.7).
2. For the Mahler valuation use Amice's orthonormal basis [n/p^h]!·binom(x, n) of LA_h and ℓ(k) ≤ log_p(k + 1) + 1. Put F_r(a) = a/(p − 1) − (1 + r)log_p(a + 1) − r. This function is bounded below on a ≥ 0, so C_1(r) = max(0, −inf_{a≥0}F_r(a)) gives the claimed lower bound. The final constant in the proof of Proposition I.5.19 has the opposite sign as printed (E13).

*Acceptance.* Polynomials have v′_{C^r} ≥ v_{LA_0} for every r. For r = 0 the bound is v_{C^0}(φ) ≥ v_{LA_h}(φ) − C_1(0). For φ = 1 and h = 0 both valuations are 0, so any usable C_1(r) must be nonnegative; the printed choice in I.5.19 fails for r > 0.

*Needs:* `L0/locally-analytic-radius` (predecessor packet: Locally analytic functions of fixed radius); `L0/amice-mahler-basis` (predecessor packet: Amice's theorem on Mahler coefficients); `L2/c-r-functions` (predecessor packet: Functions of class C^r).

*Source:* Colmez (author PDF), Proposition I.5.7, printed p. 20; Proposition I.5.19 and its proof, printed pp. 24–25: I.5.7 proves LA_h ⊂ C^r with the v′ bound; I.5.19 proves the Mahler-valuation bound with the explicit constant C_1(r). The theorem is retained with the repaired constant in its proof (E13).

### 2.A.6 Norms of Colmez's wavelets

`LocallyAnalyticDistributions:L2/wavelet-norm-bound` · Lemma.

For r ≥ 0 and k ≤ r: v′_{C^r}(e_{0,k,r}) = 0 and, for i ≥ 1, v′_{C^r}(e_{i,k,r}) ≥ [ℓ(i)r] − rℓ(i) + r − k ≥ −1. Consequently, for every bounded family (b_{i,k}) tending to 0, Σ_{i,k} b_{i,k}e_{i,k,r} converges in C^r(ℤ_p, L) and v′_{C^r}(Σ b_{i,k}e_{i,k,r}) ≥ inf_{i,k} v_p(b_{i,k}) − 1: the map c₀(ℕ × {0, …, [r]}, L) → C^r is continuous.

*Proof outline.*
1. For j ≤ r, v_p(e_{i,k,r}^{(j)}(x)/j!) ≥ [ℓ(i)r] − jℓ(i) ≥ [ℓ(i)r] − rℓ(i) + r − k.
2. The remainder ε(x, y) vanishes unless v_p(y) ≤ ℓ(i) − 1 and x or x + y lies in i + p^{ℓ(i)}ℤ_p; in the two remaining cases bound its valuation minus r·v_p(y) directly from the formula (Colmez's case analysis).
3. The final bound uses k ≤ r and [ℓ(i)r] − rℓ(i) > −1.

*Acceptance.* For r = 0, e_{i,0,0} = 1_{i+p^{ℓ(i)}ℤ_p} has v′_{C^0} = 0.

*Needs:* 2.A.2 `colmez-wavelets`; `L2/c-r-functions` (predecessor packet: Functions of class C^r).

*Source:* Colmez (author PDF), Lemma I.5.10 and its proof, printed pp. 21–22; first sentence of the proof of Theorem I.5.14, printed p. 23: Gives the lower bound for v′_{C^r}(e_{i,k,r}) and deduces continuity of the wavelet synthesis map on bounded null families.

### 2.A.7 Amplitude coefficients are bounded by the C^r valuation

`LocallyAnalyticDistributions:L2/amplitude-coefficient-bound` · Lemma.

For r ≥ 0 there is a constant C′_0(r) such that every φ ∈ LP^{[0,r]}(ℤ_p, L) with amplitude coefficients b_{i,k}(φ) satisfies inf_{i,k} v_p(b_{i,k}(φ)) ≥ v′_{C^r}(φ) − C′_0(r). For locally constant φ = Σ_{i≤p^h−1} b_i e_{i,0,r}: inf_i v_p(b_i) ≥ v′_{C^r}(φ) − r.

*Proof outline.*
1. For a locally constant function of level h, its top-level coordinates at ℓ(i) = h are b_i = p^{−[hr]}(φ(i) − φ(i⁻)), where i⁻ removes the leading digit. The step i − i⁻ has valuation h − 1 and the higher Taylor data of φ are zero, hence v_p(b_i) ≥ v′_{C^r}(φ) + r(h − 1) − [hr] ≥ v′_{C^r}(φ) − r. Subtract these top-level wavelets: wavelet-norm-bound gives v′_{C^r}(e_{i,0,r}) ≥ [hr] − hr + r, so the remaining level h − 1 function has valuation at least v′_{C^r}(φ). Induction, starting with the constant level h = 0, proves the bound without using the out-of-range indices printed in Lemma I.5.11 (E12).
2. General case by induction on [r]: differentiate (cr-derivatives bounds v′_{C^{r−1}}(φ′)) to control the b_{i,k} with k ≥ 1 through deriv_colmezWavelet, then apply the locally constant case to φ − Σ_{k≥1} b_{i,k}e_{i,k,r}, using wavelet-norm-bound (Proposition I.5.12).

*Acceptance.* For r = 0 the bound is the isometry of the van der Put expansion: inf v_p(b_i) = v_{C^0}(φ).

*Needs:* 2.A.2 `colmez-wavelets`; 2.A.4 `cr-derivatives`; 2.A.6 `wavelet-norm-bound`.

*Source:* Colmez (author PDF), Lemma I.5.11 and Proposition I.5.12 with their proofs, printed p. 22: Bounds the amplitude coefficients of a locally polynomial function below by its C^r valuation, first for locally constant functions and then by induction on [r]. The top-level coefficient argument corrects the printed index range (E12).

### 2.A.8 Taylor truncations converge in C^r

`LocallyAnalyticDistributions:L2/taylor-truncation-density` · Theorem.

Let r ≥ 0 and φ ∈ C^r(ℤ_p, L). For h ∈ ℕ let φ_h = Σ_{i=0}^{p^h−1} 1_{i+p^hℤ_p}(x)·Σ_{k=0}^{[r]} φ^{(k)}(i)(x − i)^k/k! ∈ LP^{[0,r]}_h. Then v_{LA_{h+1}}(φ_{h+1} − φ_h) ≥ rh + C_{φ,r}(h) − C([r]) and φ_h → φ in C^r(ℤ_p, L). Hence LP^{[0,[r]]}(ℤ_p, L), and a fortiori LP^{[0,N]} for every N ≥ [r] and LA(ℤ_p, L), are dense in C^r(ℤ_p, L).

*Proof outline.*
1. On a + p^{h+1}ℤ_p with a = i + bp^h, rewrite φ_{h+1} − φ_h as Σ_{j≤[r]} p^{j(h+1)}/j!·(φ^{(j)}(a) − Σ_{l≤[r]−j} φ^{(j+l)}(i)(bp^h)^l/l!)·((x − a)/p^{h+1})^j.
2. cr-derivatives (Remark I.5.5(ii)) bounds each bracket by C_{φ,r}(h) − C([r]) + (r − j)h, which gives the LA_{h+1} bound; cr-locally-analytic-bound converts it into convergence in C^r.
3. The limit agrees with φ on ℕ, since φ_h(i) = φ(i) for i < p^h, hence everywhere by continuity.

*Acceptance.* r = 0: φ_h = Σ φ(i)1_{i+p^hℤ_p} and the statement is uniform continuity of φ (Colmez Lemma I.3.1). For φ a polynomial of degree ≤ [r], φ_h = φ for every h.

*Needs:* 2.A.4 `cr-derivatives`; 2.A.5 `cr-locally-analytic-bound`; 2.A.1 `locally-polynomial-functions`.

*Source:* Colmez (author PDF), Proposition I.5.13 and its proof, printed p. 23: Defines the Taylor truncations φ_h, bounds their successive differences in LA_{h+1}, and proves convergence to φ in C^r, hence density of LP^{[0,r]}.

### 2.A.9 The wavelet basis of C^r(ℤ_p, L)

`LocallyAnalyticDistributions:L2/cr-wavelet-basis` · Theorem.

For r ≥ 0 the family e_{i,k,r} (i ∈ ℕ, 0 ≤ k ≤ [r]) is a Banach basis of C^r(ℤ_p, L): the synthesis map c₀(ℕ × {0, …, [r]}, L) → C^r(ℤ_p, L), (b_{i,k}) ↦ Σ b_{i,k}e_{i,k,r}, is an isomorphism of L-Banach spaces, with inf v_p(b_{i,k}) − 1 ≤ v′_{C^r}(Σ b_{i,k}e_{i,k,r}) and v′_{C^r}(φ) − C′_0(r) ≤ inf v_p(b_{i,k}(φ)). The amplitude coefficients b_{i,k} extend to continuous linear forms on C^r. Dually, μ ↦ (μ(e_{i,k,r}))_{i,k} identifies D_r(ℤ_p, L) = C^r(ℤ_p, L)′ with the bounded families ℓ^∞(ℕ × {0, …, [r]}, L).

*Proof outline.*
1. wavelet-norm-bound gives continuity of the synthesis map on c₀.
2. amplitude-coefficient-bound shows that on LP^{[0,r]} the coefficient map is continuous for v′_{C^r}, so the synthesis map is an isomorphism of c₀ onto the closure of LP^{[0,r]}.
3. taylor-truncation-density says this closure is all of C^r.
4. The dual of c₀(I, L) is ℓ^∞(I, L) for the ultrametric norm: a bounded family defines Σ b_ic_i, which converges because c_i → 0.

*Acceptance.* r = 0: the van der Put basis 1_{i+p^{ℓ(i)}ℤ_p} is an orthonormal basis of C(ℤ_p, L) (Colmez Proposition I.3.2(iii)). Every order-r distribution is determined by its values on the e_{i,k,r}.

*Needs:* 2.A.6 `wavelet-norm-bound`; 2.A.7 `amplitude-coefficient-bound`; 2.A.8 `taylor-truncation-density`; Mathlib `ZeroAtInftyContinuousMap`.

*Source:* Colmez (author PDF), Theorem I.5.14 with its proof and Definition I.5.15, printed pp. 23–24: The e_{i,k,r} form a Banach basis of C^r; the coordinates are the amplitude coefficients.

### 2.A.10 The Mahler criterion for C^r

`LocallyAnalyticDistributions:L2/cr-mahler-criterion` · Theorem.

Let r ≥ 0 and φ ∈ C(ℤ_p, L) with Mahler coefficients a_n(φ). Then φ ∈ C^r(ℤ_p, L) if and only if v_p(a_n(φ)) − rℓ(n) → +∞, and the Mahler valuation v_{C^r}(φ) = inf_n(v_p(a_n(φ)) − rℓ(n)) is equivalent to v′_{C^r}; the functions p^{[rℓ(n)]}binom(x, n), n ∈ ℕ, form a Banach basis of C^r(ℤ_p, L). Moreover, for a locally constant φ with van der Put coefficients b_i(φ): v_p(b_i(φ)) ≥ rℓ(i) + v_{C^r}(φ) if r < 1 and v_p(b_i(φ)) ≥ rℓ(i) + v_{C^r}(φ) − 1 if r ≥ 1.

*Hypotheses.* Mahler's theorem (the binom(x, n) are an orthonormal basis of C(ℤ_p, L), with a_n(φ) the n-th forward difference at 0) is Mathlib's PadicInt.mahlerEquiv.

*Proof outline.*
1. One inequality: v_{C^r}(e_{i,k,r}) ≥ −1 − C_1(r) by cr-locally-analytic-bound, since v_{LA_{ℓ(i)}}(e_{i,k,r}) = [rℓ(i)], and the wavelets form a Banach basis (Colmez Corollary I.5.20).
2. Other inequality: bound van der Put coefficients by Mahler coefficients (Colmez Propositions I.3.7–I.3.8, I.5.21 and Corollary I.5.22), then induct on [r] using the derivative as in Lemma I.5.23.
3. The two inequalities make (a_n) ↦ Σ a_n binom(x, n) an isomorphism of the weighted null sequences onto a closed subspace of C^r containing LA, which is dense by taylor-truncation-density.

*Acceptance.* r = 0 is Mahler's theorem. At p = 3, r = 1 the function with a_{3^k} = 3^k and other coefficients 0 is continuous but not C¹: v_3(a_{3^k}) − ℓ(3^k) = −1 for every k.

*Needs:* 2.A.9 `cr-wavelet-basis`; 2.A.5 `cr-locally-analytic-bound`; `L0/amice-mahler-basis` (predecessor packet: Amice's theorem on Mahler coefficients); Mathlib `PadicInt.mahlerEquiv`.

*Source:* Colmez (author PDF), Theorem I.5.17, Corollary I.5.18, Proposition I.5.19, Corollary I.5.20, Proposition I.5.21, Corollary I.5.22, Lemma I.5.23 and the end of the proof of I.5.17, printed pp. 24–27: Characterises C^r by the growth of Mahler coefficients and proves the two valuations equivalent.

### 2.A.11 Differentiation is surjective on C^r with locally polynomial kernel

`LocallyAnalyticDistributions:L2/cr-derivative-surjection` · Theorem.

Let j ≥ 1 and r ≥ j. Then (d/dx)^j : C^r(ℤ_p, L) → C^{r−j}(ℤ_p, L) is a continuous surjection whose kernel is the closure of LP^{[0,j−1]}(ℤ_p, L) in C^r(ℤ_p, L); it induces an isomorphism of Banach spaces C^r/closure(LP^{[0,j−1]}) ≅ C^{r−j}. For j = 1: d/dx : C^r → C^{r−1} is surjective with kernel the closure of the locally constant functions, so a primitive is unique only up to that closure.

*Proof outline.*
1. In wavelet coordinates (d/dx)^j e_{i,k,r} = k!/(k − j)!·e_{i,k−j,r−j}, which vanishes for k < j; by cr-wavelet-basis both spaces are c₀ spaces, and the map is surjective because each basis vector e_{i,k−j,r−j} of C^{r−j} is the image of e_{i,k,r}/(k!/(k − j)!), with only finitely many factors k!/(k − j)!, k ≤ [r], all nonzero.
2. The kernel is the closed span of the e_{i,k,r} with k ≤ j − 1, which is the closure of LP^{[0,j−1]}.
3. The induced map on the quotient is a continuous bijection of Banach spaces, hence an isomorphism by the open mapping theorem.

*Acceptance.* The function 1_{pℤ_p} is locally constant, has derivative 0 and is not constant: d/dx is not injective on C^1, and its kernel is not the constants. For r = j = 1, x ↦ x has the primitive x²/2.

*Needs:* 2.A.9 `cr-wavelet-basis`; 2.A.2 `colmez-wavelets`; 2.A.4 `cr-derivatives`; Mathlib `ContinuousLinearEquiv.ofBijective`.

*Source:* Colmez (author PDF), Proposition I.5.16 and its proof, printed p. 24: (d/dx)^j : C^r → C^{r−j} is surjective with kernel the closure of LP^{[0,j−1]}, by the derivative formula on wavelets.

### 2.A.12 C^r(ℤ_p, L) is a Banach algebra

`LocallyAnalyticDistributions:L2/cr-banach-algebra` · Lemma.

For r ≥ 0, C^r(ℤ_p, L) is an L-Banach algebra under pointwise multiplication: for φ, ψ ∈ C^r the product is in C^r with Taylor data (φψ)^{(k)} = Σ_{i+j=k} binom(k, i)φ^{(i)}ψ^{(j)} and v′_{C^r}(φψ) ≥ v′_{C^r}(φ) + v′_{C^r}(ψ). In particular, multiplication by a locally analytic function (for example x, z^x with v_p(z − 1) > 0, or the indicator 1_U of a compact open U ⊆ ℤ_p) is a continuous endomorphism of C^r(ℤ_p, L).

*Hypotheses.* De Ieso works on O_F with the norm sup(sup_{j,x}|φ^{(j)}(x)/j!|, sup_{x,y}|ε(x, y)|/|y|^r); for F = ℚ_p this is p^{−v′_{C^r}} and his Definition 2.1 is Colmez's definition of C^r.

*Proof outline.*
1. Expand the product of the two Taylor expansions; the remainder of φψ is a sum of terms each containing a remainder of φ or of ψ or a monomial of degree > [r] in y, which gives the norm inequality (De Ieso, proof of Lemma 2.9).
2. Locally analytic functions lie in C^r (cr-locally-analytic-bound).

*Acceptance.* 1_{pℤ_p}·1_{1+pℤ_p} = 0 and 1_{pℤ_p}² = 1_{pℤ_p}. For r = 0 this is the Banach algebra C(ℤ_p, L) with the sup norm.

*Needs:* 2.A.4 `cr-derivatives`; 2.A.5 `cr-locally-analytic-bound`; `L2/c-r-functions` (predecessor packet: Functions of class C^r).

*Source:* De Ieso, Lemma 2.9 and its proof, printed pp. 10–12; Definition 2.1, printed p. 5: Proves that the space of C^r functions on O_F is a Banach algebra; with F = ℚ_p the definition is Colmez's. Colmez (author PDF), §II.4.2, printed p. 34: Notes that an order-r distribution can be multiplied by a C^r function, which uses this algebra structure.

### 2.A.13 Composition with charts preserves C^r

`LocallyAnalyticDistributions:L2/cr-composition` · Theorem.

Let r ≥ 0 and φ_1 : ℤ_p → ℤ_p. Assume one of: (a) r = 0 and φ_1 is continuous; (b) 0 < r < 1 and φ_1 is Lipschitz, that is v_p(φ_1(x) − φ_1(y)) ≥ v_p(x − y) − c for some constant c (for example φ_1 locally analytic or of class C^1); (c) r ≥ 1 and φ_1 ∈ C^r(ℤ_p, L). Then φ_2 ↦ φ_2∘φ_1 is a continuous L-linear endomorphism of C^r(ℤ_p, L), and for r ≥ 1 the Taylor data of φ_2∘φ_1 are obtained by composing the two Taylor expansions. Without the Lipschitz hypothesis (b) fails: for r = 1/2 the digit map d(x) = Σ_n a_n(x)p^{⌊2n/3⌋} (x = Σ a_n(x)p^n, 0 ≤ a_n(x) < p) is of class C^{1/2} with values in ℤ_p, but d∘d is not of class C^{1/2}.

*Proof outline.*
1. (a) Composition of continuous maps.
2. (b) For φ_2 ∈ C^r with 0 < r < 1, v_p(φ_2(u) − φ_2(w)) − r·v_p(u − w) is bounded below and tends to +∞ as v_p(u − w) → ∞; substitute u − w = φ_1(x + y) − φ_1(x), of valuation ≥ v_p(y) − c.
3. (c) Follow De Ieso's proof of Proposition 2.12 with F = ℚ_p: insert φ_2(φ_1(x) + Σ_{i≥1}φ_1^{(i)}(x)y^i/i!), bound the first difference by the Lipschitz constant of φ_2 ∈ C^1 times the remainder of φ_1, and expand φ_2's Taylor polynomial at φ_1(x) (cr-derivatives, cr-banach-algebra for the products). Here the Lipschitz constant comes from the full C^1 norm, including its remainder bound; the derivative supremum alone used in De Ieso (2.25) is insufficient (E14).
4. Continuity: convergence in C^r implies uniform convergence, so the graph of φ_2 ↦ φ_2∘φ_1 is closed and the closed graph theorem applies.
5. Counterexample: for v_p(y) ≥ h the digits of x and x + y agree below h, so v_p(d(x + y) − d(x)) ≥ ⌊2h/3⌋ ≥ h/2 + h/6 − 1, and d is C^{1/2}; but d(d(p^m)) − d(d(0)) = p^{⌊2⌊2m/3⌋/3⌋}, of valuation at most 4m/9, so C_{d∘d,1/2}(m) ≤ −m/18 → −∞.

*Acceptance.* Affine maps x ↦ b + ux (u ∈ ℤ_p) and x ↦ px satisfy every hypothesis, for every r. The counterexample d shows that Colmez's Proposition I.5.6 needs a hypothesis on φ_1 when 0 < r < 1 (sourceIssues E8, E9).

*Needs:* 2.A.4 `cr-derivatives`; 2.A.12 `cr-banach-algebra`; Mathlib `LinearMap.continuous_of_isClosed_graph`; `L2/c-r-functions` (predecessor packet: Functions of class C^r).

*Source:* Colmez (author PDF), Proposition I.5.6, printed p. 20 (page image checked): States that a composite of C^r maps is C^r for every r ≥ 0, with the proof referred to the archimedean case; the statement is false for 0 < r < 1 (E8) and is used here with the hypotheses above. De Ieso, Definition 2.10, Lemma 2.11, Proposition 2.12 and its proof, printed pp. 12–14 (pages 12–13 checked as images): The Taylor-composition argument gives the result for [r] ≥ 1 after replacing the derivative-only estimate (2.25) by a full C^1 Lipschitz bound (E14); the case [r] = 0 left to the reader fails for 0 < r < 1 (E9).

## 2.B. Order on one-dimensional groups

The consumers apply order-h distributions on ℤ_p^× and on the cyclotomic group, not on ℤ_p. Loeffler (§2.1) transports the definitions through an open subgroup isomorphic to ℤ_p. Here the transition between two charts is an affine map, so `cr-composition` applies with no extra hypothesis, and order 0 is identified with Mathlib's `AbstractMeasure`.

### 2.B.1 C^r functions and order-r distributions on a one-dimensional group

`LocallyAnalyticDistributions:L2/order-on-one-dimensional-groups` · Definition.

Let G be a compact abelian p-adic Lie group of dimension 1 and κ : ℤ_p → H a topological group isomorphism onto an open subgroup H ⊆ G (a chart; for example G = ℤ_p with κ = id, G = ℤ_p^× with H = 1 + pℤ_p and κ(x) = (1 + p)^x for p odd, or H = 1 + 4ℤ_2 and κ(x) = 5^x for p = 2). C^r(G, L) is the space of f : G → L such that x ↦ f(aκ(x)) lies in C^r(ℤ_p, L) for every a ∈ G, normed by the minimum of the finitely many coset valuations; D_r(G, L) = C^r(G, L)′. Its topology does not depend on (H, κ) (the norm does). For a compact open U ⊆ ℤ_p, C^r(U, L) is the space of restrictions of C^r(ℤ_p, L), and D_r(U, L) is the space of order-r distributions on ℤ_p supported in U, that is 1_U·D_r(ℤ_p, L). For r = 0, C^0(G, L) = C(G, L) and D_0(G, L) identifies algebraically with the space of bounded measures, Mathlib's AbstractMeasure G L L. Use the continuous-dual operator norm on D_0; the type synonym AbstractMeasure has a separately chosen topology, so this identification does not assert agreement with that topology. LA(G, L) is dense in C^r(G, L), so D_r(G, L) ⊆ D(G, L), and D_r ⊆ D_s for r ≤ s.

*Proof outline.*
1. Two charts differ, on a common open subgroup p^mH, by a continuous isomorphism between open subgroups of ℤ_p, which is multiplication by some c ∈ ℚ_p^×, followed by translations between cosets; these affine maps preserve C^r continuously by cr-composition, with non-isometric constants (Loeffler, footnote 2).
2. Restriction to a compact open U and extension by zero are continuous because 1_U ∈ LA ⊆ C^r and C^r is a Banach algebra (cr-banach-algebra).
3. r = 0: C^0 = continuous functions (Colmez Remark I.5.1) and Mathlib's AbstractMeasure G L L is by definition the space of continuous linear forms on C(G, L). This is an algebraic identification of continuous linear forms; transfer the operator norm to the measure carrier when a Banach-space identification is wanted.
4. Density of LA by taylor-truncation-density in each chart; D_r ⊆ D_s for r ≤ s by the Amice characterisation of LocallyAnalyticDistributions:L2/order-r-distributions.

*API.*
- `TauCeti.LocallyAnalytic.CrOn` (constructor): CrOn κ r : the L-subspace of functions G → L that are C^r on every coset in the chart κ; its norm, the minimum of the coset valuations, is a README target.
- `TauCeti.LocallyAnalytic.CrOn_chart_independent` (characterisation): For two charts κ, κ′ onto open subgroups of a compact G, CrOn κ r = CrOn κ′ r; the two norms are equivalent (README).
- `TauCeti.LocallyAnalytic.CrOn_zero_eq_continuous` (compatibility): For a chart onto an open subgroup of a compact G, f ∈ CrOn κ 0 iff f is continuous; the norm is equivalent to the sup norm (README).
- `TauCeti.LocallyAnalytic.DistOrderOn` (constructor): DistOrderOn κ r = (CrOn κ r)′, the order-r distributions on G.
- `TauCeti.LocallyAnalytic.DistOrderOn_zero_equiv_abstractMeasure` (compatibility): For r = 0, DistOrderOn κ 0 ≃ₗ[L] AbstractMeasure G L L as spaces of continuous linear forms; the Banach topology here is the dual operator norm, not an assertion about the type synonym's chosen topology.
- `TauCeti.LocallyAnalytic.DistOrderOn_restrict` (functoriality): For compact open U ⊆ ℤ_p and r ≥ 0, the continuous dual of C^r(U, L) is continuously linearly equivalent to {μ ∈ D_r(ℤ_p, L) | μ = 1_U·μ}, by restriction and extension by zero. The κ parameter of DistOrderOn is reserved for group charts.
- `TauCeti.LocallyAnalytic.DistOrderOn_translate` (functoriality): Translation by g ∈ G maps DistOrderOn κ r to itself continuously.
- `TauCeti.LocallyAnalytic.DistOrderOn_mono` (relation): DistOrderOn κ r ⊆ DistOrderOn κ s inside D(G, L) for 0 ≤ r ≤ s.
- `TauCeti.LocallyAnalytic.DistOrderOn_extLP` (extensionality): For μ, ν ∈ D_r(G, L), equality on all degree-≤[r] locally polynomial tests in every group chart implies μ = ν, by density. For U ⊆ ℤ_p compact open, use their extensions by zero.

*Unit tests.*
- `LocallyAnalyticTests.dirac_one_order_zero_units` (computation): δ_1 ∈ D_0(ℤ_p^×, L), while dδ_1 ∈ D_1(ℤ_p^×, L) and dδ_1 ∉ D_r(ℤ_p^×, L) for r < 1.
- `LocallyAnalyticTests.CrOn_identity_chart` (degenerate): For G = ℤ_p and κ = id, CrOn κ r = C^r(ℤ_p, L) and DistOrderOn κ r = D_r(ℤ_p, L).
- `LocallyAnalyticTests.DistOrderOn_zero_units` (compatibility): D_0(ℤ_p^×, L) is Mathlib's AbstractMeasure ℤ_[p]ˣ L L. This identifies the linear spaces of forms; the order-zero norm is the operator norm.
- `LocallyAnalyticTests.chart_scaling_not_isometric` (characterisation): For p odd, r = 1/2 and the charts κ(x) = (1 + p)^x onto 1 + pℤ_p and κ′(x) = (1 + p)^{px} onto 1 + p²ℤ_p, the function 1_{1+p³ℤ_p} on ℤ_p^× transports to 1_{p²ℤ_p} and to 1_{pℤ_p}, with C^{1/2} valuations −1/2 and 0: the topology is chart-independent, the norm is not.
- `LocallyAnalyticTests.digit_chart_rejected` (non-example): Pulling back along the digit map d of cr-composition does not preserve C^{1/2}; d is not a chart (it is not a group homomorphism and not Lipschitz).

*Uses.* `ModularSymbolsPadicLFunctions:L2/eigensymbol-admissibility`: values of slope-h eigensymbols are h-admissible distributions on ℤ_p and ℤ_p^×; `PadicHodgeRegulators:L3/growth`: projections of the regulator are distributions of order h on the cyclotomic group; `RJW, Theorem B.1`: the analytic p-adic L-function is a distribution of order v_p(α_p) on ℤ_p^×; 2.D.3 `unit-character-determination`: its domain on ℤ_p^×.

*Acceptance.* G = ℤ_p, κ = id recovers C^r(ℤ_p, L) and D_r(ℤ_p, L). On ℤ_p^×, the Dirac mass δ_1 has order 0, and dδ_1 (f ↦ f′(1)) has order 1 and no smaller order.

*Needs:* 2.A.13 `cr-composition`; 2.A.12 `cr-banach-algebra`; 2.A.8 `taylor-truncation-density`; `L2/order-r-distributions` (predecessor packet: Distributions of order r (admissible distributions)); Mathlib `AbstractMeasure`.

*Source:* Loeffler v3, §2.1, paragraph before Definition 2.1 extending the definitions to abelian groups of dimension 1, printed p. 2; §2.2, footnote 2, printed p. 3: Extends C^r and D_r to abelian p-adic analytic groups of dimension 1 through an open subgroup isomorphic to ℤ_p, and notes that pullback along multiplication by p is continuous but not isometric. Rodrigues Jacinto–Williams, Appendix B.2.1, Theorem B.1, printed pp. 79–80: Uses distributions on ℤ_p^× with growth of order v_p(α_p), which are the order-v_p(α_p) distributions on G = ℤ_p^×.

## 2.C. Admissible distributions and the Amice–Vélu–Vishik theorem

The stage asks for order-h admissibility defined by norm estimates on small balls against locally polynomial test functions. This is `admissible-algebraic-distributions`. The predecessor's `L2/amice-velu-vishik` states the extension and uniqueness theorem; the targets below are its two halves (`moment-bound-necessity`, then `wavelet-value-bound` with `higher-degree-vanishing`), the equivalence of the valuations used in the literature (`order-r-valuations`), the operations that preserve order, and the exact failure at and beyond the critical order (`critical-kernel`).

### 2.C.1 Admissible locally polynomial distributions

`LocallyAnalyticDistributions:L2/admissible-algebraic-distributions` · Definition.

For N ∈ ℕ ∪ {∞}, D^{[0,N]}_alg(ℤ_p, L) is the space of L-linear forms on LP^{[0,N]}(ℤ_p, L) (for N = ∞, on all locally polynomial functions). Equivalently, such a form is a family of values ∫_{a+p^nℤ_p} x^i μ (a ∈ ℤ_p, n ∈ ℕ, i ≤ N) depending on a only modulo p^n and additive under subdivision: ∫_{a+p^nℤ_p} x^i μ = Σ_{c=0}^{p−1} ∫_{a+cp^n+p^{n+1}ℤ_p} x^i μ. For every r ≥ 0 put v_{D_r,N}(μ) = inf_{a∈ℤ_p, k≤N, n∈ℕ}(v_p(∫_{a+p^nℤ_p}((x − a)/p^n)^k μ) + rn) ∈ ℝ ∪ {±∞}. The r-admissible (order-r) algebraic distributions of degree ≤ N are D^{[0,N]}_r(ℤ_p, L) = {μ : v_{D_r,N}(μ) > −∞}, an L-Banach space for v_{D_r,N}. Restriction gives ι : D(ℤ_p, L) → D^{[0,N]}_alg(ℤ_p, L). When N is finite, v_{D_r,N} is equivalent on D^{[0,N]}_alg to the top-degree valuation v′_{D_r,N}(μ) = inf_{a,n}(v_p(∫_{a+p^nℤ_p}((x − a)/p^n)^N μ) + rn). The restriction N ≥ [r] is needed for the Amice–Vélu–Vishik isomorphism, not for defining admissibility; in particular the degree-0 Haar example at r = 1 is allowed.

*Hypotheses.* Pollack–Stevens' h-admissibility (‖μ‖ on balls of radius s is O(s^{−h})) is order h in this sense; see LocallyAnalyticDistributions:L2/order-r-distributions.

*Proof outline.*
1. Linear forms on LP^{[0,N]} correspond to compatible ball moments through the local monomial basis of locally-polynomial-functions.
2. v_{D_r,N} is an ultrametric valuation (inf of valuations of linear forms shifted by rn); completeness of D^{[0,N]}_r follows as for ℓ^∞.
3. Top degree: for k ≤ N there are rationals α_{k,i} with x^k = Σ_{i=0}^{N} α_{k,i}(x − i)^N, so ((x − a)/p^n)^k = Σ_i α_{k,i}((x − (a + ip^n))/p^n)^N, and a + ip^n + p^nℤ_p = a + p^nℤ_p; hence v_{D_r,N} ≥ v′_{D_r,N} + min v_p(α_{k,i}), while v′_{D_r,N} ≥ v_{D_r,N} trivially (Colmez, proof of Proposition II.3.3(iii)).

*API.*
- `TauCeti.LocallyAnalytic.AlgDist` (constructor): AlgDist N = (LPAll N →ₗ[L] L), the algebraic distributions of degree ≤ N.
- `TauCeti.LocallyAnalytic.AlgDist.ofBallMoments` (constructor): Builds an algebraic distribution from raw moments m(a, n, i) = μ(1_{a+p^nℤ_p}x^i), i ≤ N, depending on a mod p^n and additive under subdivision. Normalised moments require the corresponding binomial change of centre, rather than this raw additivity rule.
- `TauCeti.LocallyAnalytic.localMonomial` (data): localMonomial a n k = 1_{a+p^nℤ_p}·((x − a)/p^n)^k ∈ LPAll k.
- `TauCeti.LocallyAnalytic.admissibleNorm` (data): admissibleNorm r N μ = sup_{a,n,k≤N} |μ(localMonomial a n k)|·p^{−rn} = p^{−v_{D_r,N}(μ)}, the admissibility norm in multiplicative form. On arbitrary AlgDist N this supremum is interpreted in ℝ≥0∞; its finite real value is the norm on AdmissibleAlgDist r N.
- `TauCeti.LocallyAnalytic.IsAdmissible` (characterisation): IsAdmissible r N μ ↔ ∃ C, ∀ a n k, k ≤ N → ‖μ(localMonomial a n k)‖ ≤ C·p^{rn}, i.e. v_{D_r,N}(μ) > −∞.
- `TauCeti.LocallyAnalytic.AdmissibleAlgDist` (constructor): The L-subspace D^{[0,N]}_r of AlgDist N cut out by IsAdmissible r N, normed by admissibleNorm.
- `TauCeti.LocallyAnalytic.isAdmissible_mono` (relation): IsAdmissible r N μ → IsAdmissible s N μ for r ≤ s.
- `TauCeti.LocallyAnalytic.isAdmissible_iff_topDegree` (characterisation): For every finite N and r ≥ 0, IsAdmissible r N μ holds iff the bound holds for k = N alone.
- `TauCeti.LocallyAnalytic.restrictAlg` (projection): ι : D(ℤ_p, L) → AlgDist N, restriction to locally polynomial functions; ι maps D_r into AdmissibleAlgDist r N.
- `TauCeti.LocallyAnalytic.AlgDist.ext_ballMoments` (extensionality): Two elements of AlgDist N are equal if their raw moments μ(1_{a+p^nℤ_p}x^i) agree for every a, n and i ≤ N; this follows from the local monomial basis.

*Unit tests.*
- `LocallyAnalyticTests.admissible_dirac` (computation): For a ∈ ℤ_p, ι(δ_a) has v_{D_0,N}(ι δ_a) = 0: every normalised moment of δ_a is 0 or ((a − b)/p^n)^k with v_p ≥ 0, and the moment of 1_{ℤ_p} is 1.
- `LocallyAnalyticTests.admissible_haar` (computation): The degree-0 functional μ(1_{a+p^nℤ_p}) = p^{−n} is additive and has v_{D_1,0}(μ) = 0, but v_{D_r,0}(μ) = −∞ for r < 1.
- `LocallyAnalyticTests.admissible_zero` (degenerate): The zero functional has v_{D_r,N}(0) = +∞ and lies in every D^{[0,N]}_r.
- `LocallyAnalyticTests.admissible_restrict_compat` (compatibility): For μ ∈ D(ℤ_p, L), v_{D_r,∞}(ι μ) = inf_n(v_{LA_n}(μ) + rn), Colmez's v_{D_r}(μ) (Proposition II.3.3(i)).
- `LocallyAnalyticTests.admissible_critical_restriction_zero` (non-example): ι(dδ_0) = 0 on LP^{[0,0]} although dδ_0 ≠ 0: restriction to LC is not injective on D_1, so values on LC cannot determine an order-1 distribution.

*Uses.* `Colmez, Theorem II.3.2`: source and target of the Amice–Vélu–Vishik extension; `L2/amice-velu-vishik` (predecessor packet: The Amice–Vélu–Vishik extension and uniqueness theorem): the hypothesis of the extension theorem is that μ ∈ D^{[0,N]}_r; `ModularSymbolsPadicLFunctions:L2/eigensymbol-admissibility`: the values of a slope-h eigensymbol are h-admissible in this sense; `RJW, Theorem B.1`: growth of order v_p(α_p) of the analytic p-adic L-function.

*Acceptance.* The Dirac mass δ_a lies in D^{[0,N]}_0 for every N. The normalised Haar functional on LC lies in D^{[0,0]}_1 and in no D^{[0,0]}_r with r < 1.

*Needs:* 2.A.1 `locally-polynomial-functions`.

*Source:* Colmez (author PDF), §II.3.3, definition of D^I_alg and the compatibility relations before Theorem II.3.2, printed p. 32; definition of D^{[0,N]}_r and v_{D_r,N} in the proof of Theorem II.3.2(ii), printed p. 33; Proposition II.3.3(iii) and its proof, printed pp. 33–34: Defines algebraic distributions as linear forms on LP^I, their ball-moment description, the admissibility valuation v_{D_r,N}, the subspace D^{[0,N]}_r, and the equivalent top-degree valuation.

### 2.C.2 Order-r distributions satisfy the ball-moment bound

`LocallyAnalyticDistributions:L2/moment-bound-necessity` · Theorem.

If μ ∈ D_r(ℤ_p, L), then for all a ∈ ℤ_p, k ∈ ℕ and n ∈ ℕ, v_p(∫_{a+p^nℤ_p}((x − a)/p^n)^k μ) ≥ v′_{D_r}(μ) − C_1(r) − rn. Hence ι(μ) ∈ D^{[0,∞]}_r with v_{D_r,∞}(ι μ) ≥ v′_{D_r}(μ) − C_1(r); in particular ι(μ) ∈ D^{[0,N]}_r for every N.

*Hypotheses.* v′_{D_r} is the dual valuation of the Mahler valuation v_{C^r}, as in LocallyAnalyticDistributions:L2/order-r-distributions.

*Proof outline.*
1. The test function φ_{a,n,k} lies in LA_n with v_{LA_n}(φ_{a,n,k}) = 0, so v_{C^r}(φ_{a,n,k}) ≥ −rn − C_1(r) by cr-locally-analytic-bound.
2. Then v_p(μ(φ_{a,n,k})) ≥ v′_{D_r}(μ) + v_{C^r}(φ_{a,n,k}).

*Acceptance.* δ_a: all normalised moments have valuation ≥ 0. dδ_0 has order 1: ∫_{p^nℤ_p}(x/p^n)·dδ_0 = p^{−n}, of valuation −n = −rn for r = 1.

*Needs:* 2.A.5 `cr-locally-analytic-bound`; 2.C.1 `admissible-algebraic-distributions`; `L2/order-r-distributions` (predecessor packet: Distributions of order r (admissible distributions)).

*Source:* Colmez (author PDF), Theorem II.3.2(i) and its proof, printed p. 32: Proves the ball-moment bound for order-r distributions with C = v′_{D_r}(μ) − C_1(r).

### 2.C.3 Bounded wavelet values of an admissible distribution

`LocallyAnalyticDistributions:L2/wavelet-value-bound` · Lemma.

Let N ∈ ℕ ∪ {∞} with N ≥ [r] and μ ∈ D^{[0,N]}_r(ℤ_p, L). For i ∈ ℕ and 0 ≤ k ≤ [r] put b_{i,k} = μ(e_{i,k,r}) = p^{[rℓ(i)]}·∫_{i+p^{ℓ(i)}ℤ_p}((x − i)/p^{ℓ(i)})^k μ. Then v_p(b_{i,k}) ≥ v_{D_r,N}(μ) − 1 for all i, k, and there is a unique μ̃ ∈ D_r(ℤ_p, L) with μ̃(e_{i,k,r}) = b_{i,k} for all i and k ≤ [r]; its norm is bounded below by v_{D_r,N}(μ) minus a constant depending only on r. The integrand is ((x − i)/p^{ℓ(i)})^k, not the ((x − a)/p^n)^k printed in the source (sourceIssues E7).

*Proof outline.*
1. v_p(b_{i,k}) ≥ [rℓ(i)] + v_{D_r,N}(μ) − rℓ(i) > v_{D_r,N}(μ) − 1, using the ball i + p^{ℓ(i)}ℤ_p and k ≤ [r] ≤ N.
2. By cr-wavelet-basis, D_r(ℤ_p, L) is the space of bounded families on the wavelets, so the bounded family (b_{i,k}) defines a unique μ̃; its norm bound combines the bound above with amplitude-coefficient-bound.

*Acceptance.* r = 0, N = 0: b_i = μ(1_{i+p^{ℓ(i)}ℤ_p}) is bounded, and μ̃ is the bounded measure with these masses.

*Needs:* 2.C.1 `admissible-algebraic-distributions`; 2.A.2 `colmez-wavelets`; 2.A.9 `cr-wavelet-basis`.

*Source:* Colmez (author PDF), Proof of Theorem II.3.2(ii), printed p. 33 (page image checked): Defines b_{i,k} as the value on e_{i,k,r}, bounds it by v_{D_r,N}(μ) − 1 and constructs μ̃ from the wavelet basis; the displayed integrand carries the wrong ball variables (E7).

### 2.C.4 An admissible distribution vanishing in low degree vanishes

`LocallyAnalyticDistributions:L2/higher-degree-vanishing` · Lemma.

Let N ∈ ℕ ∪ {∞} with N ≥ [r] and λ ∈ D^{[0,N]}_r(ℤ_p, L). If λ vanishes on LP^{[0,[r]]}(ℤ_p, L), then λ = 0 on LP^{[0,N]}(ℤ_p, L).

*Proof outline.*
1. Fix k ≤ N, a ∈ ℤ_p and n. For m ∈ ℕ decompose a + p^nℤ_p into the balls b_i + p^{n+m}ℤ_p, b_i = a + ip^n (0 ≤ i < p^m), and expand x^k = Σ_j binom(k, j)b_i^{k−j}(x − b_i)^j.
2. Terms with j ≤ [r] vanish by hypothesis. A term with j > r is p^{j(n+m)} times a normalised moment, so its valuation is at least (j − r)(n + m) + v_{D_r,N}(λ).
3. Letting m → ∞ gives ∫_{a+p^nℤ_p} x^k λ = 0 for all a, n, k ≤ N.

*Acceptance.* For r < 1 and N = ∞: an admissible functional vanishing on LC vanishes on all locally polynomial functions.

*Needs:* 2.C.1 `admissible-algebraic-distributions`; 2.A.1 `locally-polynomial-functions`.

*Source:* Colmez (author PDF), Proof of Theorem II.3.2(ii), last paragraph, printed p. 33: Shows that λ = ι(μ̃) − μ, which vanishes on LP^{[0,r]} and has finite v_{D_r,N}, vanishes on LP^{[0,N]} by subdividing balls.

### 2.C.5 Equivalent valuations on distributions of order r

`LocallyAnalyticDistributions:L2/order-r-valuations` · Theorem.

On D_r(ℤ_p, L): (i) v_{D_r}(μ) = inf_n(v_{LA_n}(μ) + rn) = inf_{a,k,n}(v_p(∫_{a+p^nℤ_p}((x − a)/p^n)^k μ) + rn) is a valuation equivalent to v′_{D_r}; (ii) for N ∈ ℕ with N ≥ [r], v_{D_r,N}∘ι is equivalent to v_{D_r}; (iii) the top-degree valuation v′_{D_r,N}∘ι is equivalent to v_{D_r,N}∘ι. Moreover ι : D_r(ℤ_p, L) → D^{[0,N]}_r(ℤ_p, L) is an isomorphism of Banach spaces for every N ∈ ℕ ∪ {∞} with N ≥ [r]. For an arbitrary μ ∈ D(ℤ_p, L), μ ∈ D_r is equivalent to ‖μ‖_{LA_n} = O(p^{rn}), or to a uniform O(p^{rn}) bound on the normalised ball moments in all degrees k ≥ 0. The finite-degree valuations in (ii)–(iii) are equivalent on the already known space D_r; a degree-≤N bound on the restriction of an arbitrary analytic distribution does not certify its order.

*Hypotheses.* v_{LA_n}(μ) is the dual valuation of LA_n; the LA_n-orthonormal basis of locally-analytic-radius makes it the infimum of the normalised moments on balls of radius p^{−n}.

*Proof outline.*
1. By moment-bound-necessity, wavelet-value-bound, higher-degree-vanishing and density of LP^{[0,N]} (taylor-truncation-density), ι is a continuous bijection D_r → D^{[0,N]}_r: this is the Amice–Vélu–Vishik theorem of LocallyAnalyticDistributions:L2/amice-velu-vishik.
2. Both spaces are Banach, so the open mapping theorem makes ι an isomorphism. Applying this also at N = ∞ gives (i), and finite N gives (ii). The all-degree bound for an arbitrary analytic distribution supplies the order-r extension of its locally polynomial restriction; density in each LA_n identifies that extension with the original distribution.
3. (iii) by the change of basis to top-degree monomials recorded in admissible-algebraic-distributions.

*Acceptance.* Pollack–Stevens' h-admissibility ‖μ‖_s = O(s^{−h}) is v_{D_h}(μ) > −∞ with s = p^{−n}. For r = 0 and a bounded measure μ, v_{D_0}(μ) = inf_{a,n} v_p(μ(1_{a+p^nℤ_p})), the measure norm: the moments with k ≥ 1 integrate functions of sup norm ≤ 1. For any finite N, μ = d^{N+1}δ_0 is nonzero of exact order N + 1 and kills every degree-≤N locally polynomial test. Thus even zero finite-degree moments do not imply μ ∈ D_r when r < N + 1.

*Needs:* 2.C.2 `moment-bound-necessity`; 2.C.3 `wavelet-value-bound`; 2.C.4 `higher-degree-vanishing`; 2.A.8 `taylor-truncation-density`; `L2/amice-velu-vishik` (predecessor packet: The Amice–Vélu–Vishik extension and uniqueness theorem); `L0/locally-analytic-radius` (predecessor packet: Locally analytic functions of fixed radius); Mathlib `ContinuousLinearEquiv.ofBijective`; 2.C.1 `admissible-algebraic-distributions`.

*Source:* Colmez (author PDF), Proposition II.3.3 and its proof, printed pp. 33–34; Theorem II.3.2, printed pp. 32–33: Defines v_{D_r}, v_{D_r,N}, v′_{D_r,N} and proves them equivalent to v′_{D_r} by Theorem II.3.2 and the open mapping theorem.

### 2.C.6 Operations preserving the order of a distribution

`LocallyAnalyticDistributions:L2/order-r-operations` · Theorem.

Let r, s ≥ 0 and μ ∈ D_r(ℤ_p, L). (a) For f ∈ C^r(ℤ_p, L) — in particular f locally analytic, f = x, f = z^x with v_p(z − 1) > 0, or f = 1_U for U ⊆ ℤ_p compact open — the distribution fμ : φ ↦ μ(fφ) lies in D_r; so does Res_U(μ) = 1_U·μ. (b) Translation by b ∈ ℤ_p, σ_a for a ∈ ℤ_p^×, φ and ψ map D_r(ℤ_p, L) continuously into itself. (c) The derivative d : D_r → D_{r+1}, (dμ)(φ) = μ(φ′), is continuous. (d) If λ ∈ D_r and μ ∈ D_s then λ ∗ μ ∈ D_{r+s}. (e) D_r ⊆ D_s for r ≤ s.

*Hypotheses.* The operations on D(ℤ_p, L) and their Amice transforms are those of LocallyAnalyticDistributions:L1/distribution-operations; the transpose convention (dμ)(f) = μ(f′) is that of LocallyAnalyticDistributions:L1/amice-derivative.

*Proof outline.*
1. (a) Multiplication by f is a continuous endomorphism of C^r (cr-banach-algebra); transpose it.
2. (b) Translation, σ_a and φ are pullbacks along x ↦ x + b, ax, px, continuous on C^r by cr-composition; ψ(μ)(φ) = μ(1_{pℤ_p}·φ(x/p)), and φ ↦ 1_{pℤ_p}φ(x/p) is continuous on C^r (the affine chart x ↦ x/p on pℤ_p, extended by zero).
3. (c) φ ↦ φ′ is continuous C^{r+1} → C^r by cr-derivatives.
4. (d) Amice transforms multiply under convolution, and orders add under products in R⁺ (Colmez Corollary II.1.2, Proposition II.4.3), with the Amice characterisation of LocallyAnalyticDistributions:L2/order-r-distributions.
5. (e) The Amice characterisation: v_p(b_n) + rℓ(n) bounded below implies the same with s ≥ r.

*Acceptance.* dδ_0 ∈ D_1 and dδ_0 ∉ D_r for r < 1 (LocallyAnalyticDistributions:L2/positive-order-nonmeasure): d raises the order by exactly 1 on δ_0. Res_{ℤ_p^×}(μ) = (1 − φψ)(μ) belongs to D_r whenever μ does. Minimal order may drop: δ_0 restricts to zero on ℤ_p^×.

*Needs:* 2.A.12 `cr-banach-algebra`; 2.A.13 `cr-composition`; 2.A.4 `cr-derivatives`; `L2/order-r-distributions` (predecessor packet: Distributions of order r (admissible distributions)); `L1/distribution-operations` (predecessor packet: Operations on distributions); `L1/amice-derivative` (predecessor packet: The transpose derivative and logarithm).

*Source:* Colmez (author PDF), §II.4.2, printed p. 34 (multiplying an order-r distribution by a C^r function); Corollary II.1.2, printed p. 29; Proposition II.4.3, printed p. 37: Multiplication by C^r functions preserves order r; orders add under products of Amice transforms and under convolution. De Ieso, Lemma 2.9 and Proposition 2.12, printed pp. 10–14: Banach algebra structure and continuity of composition on C^r, transposed here (composition for r ≥ 1 or Lipschitz charts, see cr-composition).

### 2.C.7 The kernel of restriction at and beyond the critical order

`LocallyAnalyticDistributions:L2/critical-kernel` · Theorem.

Let N ∈ ℕ and r ≥ N + 1. An order-r distribution μ ∈ D_r(ℤ_p, L) vanishes on LP^{[0,N]}(ℤ_p, L) if and only if μ = d^{N+1}ν for some ν ∈ D_{r−N−1}(ℤ_p, L), and ν is then unique. Thus the kernel of ι : D_r → D^{[0,N]}_alg is d^{N+1}(D_{r−N−1}(ℤ_p, L)); at the critical order r = N + 1 it is d^{N+1} of the bounded measures, an infinite-dimensional space, so values on locally polynomial functions of degree ≤ N determine an order-(N + 1) distribution only modulo d^{N+1}D_0. For r < N + 1 the kernel is zero (LocallyAnalyticDistributions:L2/amice-velu-vishik). An order-r distribution supported at a point a is a linear combination of the d^iδ_a with i ≤ r.

*Hypotheses.* d is the transpose derivative (dμ)(f) = μ(f′) of LocallyAnalyticDistributions:L1/amice-derivative; d^{N+1}ν has Amice transform log(1 + T)^{N+1}A_ν.

*Proof outline.*
1. If μ vanishes on LP^{[0,N]} it vanishes on its closure in C^r, which is the kernel of (d/dx)^{N+1} : C^r → C^{r−N−1} (cr-derivative-surjection).
2. (d/dx)^{N+1} induces an isomorphism C^r/closure(LP^{[0,N]}) ≅ C^{r−N−1} (open mapping), so μ = ν∘(d/dx)^{N+1} for a unique continuous ν on C^{r−N−1}; with the transpose convention ν∘(d/dx)^{N+1} = d^{N+1}ν.
3. Conversely d^{N+1}ν kills LP^{[0,N]} because (N + 1)-st derivatives of polynomials of degree ≤ N vanish, and d^{N+1}ν ∈ D_r by order-r-operations (c).
4. Point support: subtract Σ_{i≤[r]}(∫x^iμ/i!)d^iδ_0 after translating a to 0; the remainder kills LP^{[0,r]} and is zero by density (Colmez Proposition II.4.5).

*Acceptance.* N = 0, r = 1: dν kills LC for every bounded measure ν; this is Loeffler's statement that an extension from LC is unique only modulo ℓ_0·D_{r−1}, ℓ_0 = dδ_0. N = k, r = k + 1: the critical-slope non-uniqueness of ModularSymbolsPadicLFunctions:L3/critical-slope-non-uniqueness is an instance.

*Needs:* 2.A.11 `cr-derivative-surjection`; 2.C.6 `order-r-operations`; `L2/amice-velu-vishik` (predecessor packet: The Amice–Vélu–Vishik extension and uniqueness theorem); `L1/amice-derivative` (predecessor packet: The transpose derivative and logarithm); Mathlib `ContinuousLinearEquiv.ofBijective`; Mathlib `Polynomial.iterate_derivative_eq_zero`.

*Source:* Colmez (author PDF), Proposition I.5.16(ii), printed p. 24; Proposition II.4.5 and its proof, printed p. 37: The kernel of (d/dx)^j on C^r is the closure of LP^{[0,j−1]}; order-r distributions supported at a point are combinations of derivatives of the Dirac mass. The description of the kernel of ι is derived from these, not printed. Loeffler v3, Remark 2.4, printed p. 3: For r ≥ 1 an extension of a locally constant distribution of growth r is unique only modulo ℓ_0·D_{r−1}(G, E), the case N = 0.

## 2.D. Characters and uniqueness on ℤ_p^×

The stage asks for uniqueness 'with precisely the available locally algebraic characters'. Over a field containing the relevant roots of unity, finite Fourier inversion (Mathlib's additive and Dirichlet character orthogonality) turns the values at χ(x)x^j into the values on locally polynomial functions. Coefficient extension removes the roots-of-unity hypothesis, and the Amice–Vélu–Vishik uniqueness concludes. Both hypotheses are sharp.

### 2.D.1 Finite Fourier inversion for p-adic balls

`LocallyAnalyticDistributions:L2/finite-fourier-inversion` · Lemma.

(a) Let m ∈ ℕ, g ≥ 1 and L′ a field of characteristic 0 containing a primitive p^m-th root of unity ζ. For b ∈ (ℤ/p^mℤ)^g let χ_b(x) = ζ^{b_1x_1 + ⋯ + b_gx_g}, a locally constant character of ℤ_p^g with values in L′. For a ∈ ℤ_p^g, 1_{B(a,(m,…,m))}(x) = p^{−mg} Σ_{b∈(ℤ/p^m)^g} χ_b(a)^{−1}χ_b(x); hence the χ_b form a basis of LC_m(ℤ_p^g, L′), and for a radius tuple m, 1_{B(a,m)} = ∏_j (p^{−m_j} Σ_{b_j mod p^{m_j}} ζ_{m_j}^{b_j(x_j − a_j)}) with ζ_{m_j} primitive p^{m_j}-th roots of unity. (b) Let n ≥ 1 and L′ a field of characteristic 0 containing a primitive e-th root of unity, e the exponent of (ℤ/p^nℤ)^×. For a ∈ ℤ_p^× and x ∈ ℤ_p, 1_{a+p^nℤ_p}(x) = φ(p^n)^{−1} Σ_χ χ(a)^{−1}χ(x), the sum over the Dirichlet characters χ modulo p^n with values in L′, viewed as functions on ℤ_p through reduction modulo p^n (χ(x) = 0 for x ∈ pℤ_p).

*Hypotheses.* Reduction ℤ_p → ℤ/p^nℤ is Mathlib's PadicInt.toZModPow, whose kernel is p^nℤ_p; the ball a + p^nℤ_p is its fibre over the residue of a.

*Proof outline.*
1. (a) For ψ = AddChar.zmodChar(p^m, ζ), which is primitive because ζ is a primitive p^m-th root of unity, Σ_{t∈ℤ/p^m} ψ(t·u) is p^m if u = 0 and 0 otherwise (AddChar.sum_mulShift). Apply this in each coordinate to u = x_j − a_j modulo p^{m_j} and multiply.
2. Counting: there are p^{mg} characters χ_b and dim LC_m(ℤ_p^g, L′) = p^{mg}; they span by the inversion formula (Colmez Proposition I.3.4 for g = 1).
3. (b) L′ has enough roots of unity for (ℤ/p^n)^×: the e-th roots of unity form a cyclic group of order e (HasEnoughRootsOfUnity.of_card_le with IsPrimitiveRoot.card_rootsOfUnity); then DirichletCharacter.sum_char_inv_mul_char_eq gives Σ_χ χ(a)^{−1}χ(x) = φ(p^n) if x ≡ a mod p^n and 0 otherwise.
4. A suitable L′ exists as a finite extension of L, for example the cyclotomic extension L(μ_{p^m}) (IsCyclotomicExtension.zeta_spec).

*Acceptance.* g = 1, m = 1, p = 2, ζ = −1: 1_{2ℤ_2}(x) = (1 + (−1)^x)/2. Without roots of unity the formula is unavailable: over ℚ_p with p odd the only p-th root of unity is 1, so the characters χ_b are not defined there.

*Needs:* Mathlib `AddChar.zmodChar`; Mathlib `AddChar.zmodChar_primitive_of_primitive_root`; Mathlib `AddChar.sum_mulShift`; Mathlib `DirichletCharacter.sum_char_inv_mul_char_eq`; Mathlib `HasEnoughRootsOfUnity.of_card_le`; Mathlib `IsPrimitiveRoot.card_rootsOfUnity`; Mathlib `IsCyclotomicExtension.zeta_spec`; Mathlib `PadicInt.toZModPow`; Mathlib `PadicInt.ker_toZModPow`.

*Source:* Colmez (author PDF), §I.3.2, Proposition I.3.4 and its proof, printed pp. 10–11; §II.4.3, printed p. 35: If L contains μ_{p^h}, the characters ζ^x form a basis of LC_h, with 1_{a+p^hℤ_p} = p^{−h}Σ_ζ ζ^{x−a}; restriction to a ball is written with the same roots-of-unity average. Loeffler v3, §2.3, Definition 2.14, printed p. 5: Growth on rectangular cosets a + (p^{m_1}H_1) × ⋯ × (p^{m_g}H_g), whose indicators the product formula (a) expands into characters.

### 2.D.2 Finite extension of coefficients

`LocallyAnalyticDistributions:L2/coefficient-extension` · Lemma.

Let L′/L be a finite extension of closed subfields of ℂ_p. (i) LP^{[0,N]}_h(ℤ_p^g, L′) = L′ ⊗_L LP^{[0,N]}_h(ℤ_p^g, L), and C^r(ℤ_p, L′) = L′ ⊗_L C^r(ℤ_p, L) with equivalent norms (both have bases defined over ℚ_p: local monomials and wavelets). (ii) Every L-linear form μ on LP^{[0,N]}(ℤ_p^g, L) has a unique L′-linear extension μ_{L′} to LP^{[0,N]}(ℤ_p^g, L′), given by μ_{L′}(Σ c_jφ_j) = Σ c_jμ(φ_j) for c_j ∈ L′ and L-valued φ_j; μ = 0 if and only if μ_{L′} = 0. (iii) For g = 1, v_{D_r,N}(μ_{L′}) is finite if and only if v_{D_r,N}(μ) is, and an L-linear μ on C^r(ℤ_p, L) is continuous if and only if μ_{L′} is; so μ ∈ D_r(ℤ_p, L) iff μ_{L′} ∈ D_r(ℤ_p, L′). The same holds for the multidegree moment bounds and the vector-order duals in g variables.

*Proof outline.*
1. Choose an L-basis ω_1 = 1, …, ω_d of L′. Every L′-valued function decomposes uniquely as Σ ω_jφ_j with L-valued φ_j; the bases of locally-polynomial-functions and cr-wavelet-basis are ℚ_p-valued, so the decomposition respects LP and C^r.
2. All norms on the finite-dimensional L-space L′ are equivalent (L is complete), so the coordinate maps are bounded; this gives the equivalence of norms and of the moment bounds.
3. Faithfulness: the restriction of μ_{L′} to L-valued functions is μ.

*Acceptance.* L′ = L: the extension is the identity. For L′ = L(μ_{p^n}) this is the coefficient extension in which the finite Fourier inversion of finite-fourier-inversion is applied.

*Needs:* 2.A.1 `locally-polynomial-functions`; 2.C.1 `admissible-algebraic-distributions`; 2.A.9 `cr-wavelet-basis`.

*Source:* Colmez (author PDF), Proposition I.3.4, printed p. 10 (hypothesis that L contains μ_{p^h}); Theorem I.5.14, printed p. 23 (a basis defined over ℚ_p): The character expansions need roots of unity in the coefficient field, and the wavelet basis is defined over ℚ_p, so coefficients can be extended; the extension statements are derived here. Loeffler v3, §2, opening paragraph, printed p. 2: The coefficient field E is any complete discretely valued subfield of ℂ_p, so finite extensions are allowed.

### 2.D.3 Determination by locally algebraic characters on ℤ_p^×

`LocallyAnalyticDistributions:L2/unit-character-determination` · Theorem.

Let N ∈ ℕ, 0 ≤ r < N + 1 and μ ∈ D_r(ℤ_p^×, L). For a finite-order character χ : ℤ_p^× → ℂ_p^× (equivalently a Dirichlet character of conductor p^n, n ≥ 0) and 0 ≤ j ≤ N, let μ(χx^j) = μ_{L(χ)}(χ(x)x^j·1_{ℤ_p^×}), computed after extending coefficients to the finite extension L(χ) generated by the values of χ. If μ(χx^j) = 0 for all such χ and j, then μ = 0. More precisely, for each n ≥ 1 the values μ(χx^j) with χ of conductor dividing p^n determine all ∫_{a+p^nℤ_p}x^jμ with a ∈ ℤ_p^×, j ≤ N. The hypotheses are sharp: (1) at r = N + 1, d^{N+1}ν is nonzero, of order N + 1, and vanishes at every χx^j with j ≤ N, for every nonzero bounded measure ν on ℤ_p^×; (2) for fixed n, the measure Σ_{i=0}^{N+1} c_iδ_{a+ip^{n+1}}, with (c_i) a nonzero solution of Σ_i c_i(a + ip^{n+1})^j = 0 for j ≤ N, is nonzero and vanishes at every χx^j with χ of conductor dividing p^n and j ≤ N.

*Hypotheses.* μ ∈ D_r(ℤ_p^×, L) is an order-r distribution on ℤ_p supported in ℤ_p^× (order-on-one-dimensional-groups).

*Proof outline.*
1. For each n ≥ 1 choose a finite extension L_n/L containing a primitive e_n-th root of unity, where e_n is the exponent of (ℤ/p^n)^×. Characters of conductor dividing p^n are exactly the Dirichlet characters modulo p^n. This extension may depend on n; no single finite field containing all p-power roots is assumed.
2. By finite-fourier-inversion (b), for a ∈ ℤ_p^× and j ≤ N, μ_{L_n}(1_{a+p^nℤ_p}x^j) = φ(p^n)^{−1}Σ_χ χ(a)^{−1}μ(χx^j) = 0. Each summand is mapped from L(χ) into L_n. The raw ball moment on the left is the image of an element of L, so injectivity of L → L_n gives μ(1_{a+p^nℤ_p}x^j) = 0 in L.
3. Do this for every n. Since μ is supported in ℤ_p^×, it also kills tests supported in pℤ_p. Thus all raw ball moments of degree ≤ N vanish at every level over L; by the local monomial basis μ vanishes on LP^{[0,N]}(ℤ_p, L).
4. Apply Amice–Vélu–Vishik uniqueness over L, with r < N + 1, to obtain μ = 0. No passage from a fixed conductor level to all polynomial levels is made.
5. Sharpness (1) is critical-kernel; (2) is a Vandermonde count: N + 2 distinct points in one ball modulo p^n give N + 1 linear conditions on N + 2 unknowns, and every character of conductor dividing p^n is constant on that ball.

*Acceptance.* RJW Theorem B.1: for v_p(α_p) < k + 1 the analytic p-adic L-function of f is the unique order-v_p(α_p) distribution on ℤ_p^× with the prescribed values at χ(x)x^j, 0 ≤ j ≤ k. At v_p(α_p) = k + 1 the values at χx^j, j ≤ k, do not determine the distribution (sharpness (1)).

*Needs:* 2.D.1 `finite-fourier-inversion`; 2.D.2 `coefficient-extension`; 2.B.1 `order-on-one-dimensional-groups`; 2.C.7 `critical-kernel`; `L2/amice-velu-vishik` (predecessor packet: The Amice–Vélu–Vishik extension and uniqueness theorem); Mathlib `DirichletCharacter.sum_char_inv_mul_char_eq`.

*Source:* Rodrigues Jacinto–Williams, Appendix B.2.1, Theorem B.1 and the paragraph after it, printed pp. 79–80: Existence and uniqueness of the order-v_p(α_p) distribution on ℤ_p^× interpolating L(f, χ, j + 1) for all Dirichlet characters of p-power conductor and 0 ≤ j ≤ k, when v_p(α_p) < k + 1; the critical case is excluded. Colmez (author PDF), Proposition I.3.4, printed p. 10; Theorem II.3.2(ii), printed pp. 32–33: Characters span locally constant functions after adjoining roots of unity; distributions of order r < N + 1 are determined by their values on LP^{[0,N]}. Loeffler v3, §2.1, Theorem 2.3, printed pp. 2–3: Amice–Vélu–Vishik on one-dimensional groups such as ℤ_p^×.

## 2.E. Several variables: boxes, van der Put coefficients and separate degree

Several-variable growth is a bound on masses of rectangular boxes. The targets below type the boxes and their refinement partition through Mathlib's reduction maps, give the multivariable van der Put basis with its coefficients as explicit mixed differences, and define locally polynomial functions of separate degree.

### 2.E.1 Box indicators and the refinement partition

`LocallyAnalyticDistributions:L2/box-indicators` · Construction.

For a ∈ ℤ_p^g and a radius tuple m ∈ ℕ^g, the box B(a, m) is the fibre over the residues of a of the reduction map ℤ_p^g → ∏_j ℤ/p^{m_j}ℤ, x ↦ (x_j mod p^{m_j})_j; it is clopen, and its indicator 1_{B(a,m)} is a locally constant function ℤ_p^g → K. B(a, m) depends only on a modulo p^m; two boxes are disjoint or meet in a box, B(a, m) ∩ B(a′, m′) = B(a″, max(m, m′)) when nonempty. Refinement: for a coordinate t, B(a, m) = ⊔_{c=0}^{p−1} B(a + cp^{m_t}e_t, m + e_t), so 1_{B(a,m)} = Σ_c 1_{B(a+cp^{m_t}e_t, m+e_t)}; more generally, for m ≤ m′ componentwise, B(a, m) is the disjoint union of the ∏_j p^{m′_j − m_j} boxes of radius m′ it contains. Every locally constant function on ℤ_p^g is a finite combination of the indicators of the boxes of one equal radius (h, …, h), so LC(ℤ_p^g, K) = ∪_h LC_h(ℤ_p^g, K) with LC_h ≅ Maps((ℤ/p^hℤ)^g, K). A linear form on LC(ℤ_p^g, K) is the same as a function on boxes that is additive under refinement.

*Proof outline.*
1. Membership in B(a, m) is a congruence in each coordinate; the fibre of PadicInt.toZModPow over a residue is the coset a_j + p^{m_j}ℤ_p (its kernel is p^{m_j}ℤ_p), so B(a, m) is a finite intersection of preimages of clopen sets.
2. Refinement: x_t ∈ a_t + p^{m_t}ℤ_p lies in exactly one a_t + cp^{m_t} + p^{m_t+1}ℤ_p, 0 ≤ c < p.
3. A locally constant function on the compact space ℤ_p^g has clopen fibres, each a finite union of boxes; by compactness one equal radius h serves for all of them (Colmez §I.3.1 for g = 1).

*API.*
- `TauCeti.AnalyticDistributions.padicBox` (constructor): padicBox a m : Set (Fin g → ℤ_p), the box B(a, m).
- `TauCeti.AnalyticDistributions.padicBox_isClopen` (data): padicBox a m is clopen.
- `TauCeti.AnalyticDistributions.boxIndicator` (constructor): boxIndicator a m : LocallyConstant (Fin g → ℤ_p) K, the indicator of padicBox a m (Mathlib's LocallyConstant.charFn).
- `TauCeti.AnalyticDistributions.mem_padicBox_iff` (characterisation): x ∈ padicBox a m ↔ ∀ j, toZModPow (m j) (x j) = toZModPow (m j) (a j).
- `TauCeti.AnalyticDistributions.boxIndicator_refine` (relation): boxIndicator a m = Σ_{c<p} boxIndicator (a + c·p^{m_t}e_t) (m + e_t) for each coordinate t.
- `TauCeti.AnalyticDistributions.boxIndicator_mul` (simp): boxIndicator a m·boxIndicator a′ m′ is 0 when the boxes are disjoint, and boxIndicator a″ (m ⊔ m′) for some a″ when they meet.
- `TauCeti.AnalyticDistributions.locallyConstant_mem_span_boxIndicator` (characterisation): Every f ∈ LocallyConstant (Fin g → ℤ_p) K lies in the span of the boxIndicator a (fun _ ↦ h) for some h.
- `TauCeti.AnalyticDistributions.boxIndicator_translate` (functoriality): Translation by b sends boxIndicator a m to boxIndicator (a + b) m.

*Unit tests.*
- `AnalyticDistributionTests.boxIndicator_zero_radius` (degenerate): boxIndicator a 0 = 1.
- `AnalyticDistributionTests.boxIndicator_refine_count` (computation): For p = 2, g = 2, B(0, (0, 0)) is the disjoint union of the 2·4 = 8 boxes of radius (1, 2).
- `AnalyticDistributionTests.boxIndicator_eq_charFn` (compatibility): boxIndicator a m = LocallyConstant.charFn K (padicBox_isClopen a m); for g = 1 it is the indicator of a + p^mℤ_p.
- `AnalyticDistributionTests.boxIndicator_radii_not_symmetric` (non-example): For g = 2, boxIndicator 0 (1, 0) ≠ boxIndicator 0 (0, 1): they differ at (0, 1).

*Uses.* `L2/rectangular-growth` (predecessor packet: Rectangular growth for a locally constant functional): the growth bound is a bound on μ(boxIndicator a m); `L2/rectangular-extension` (predecessor packet: Extension of rectangular distributions): the extension is determined by box masses and their refinement relations; 2.D.1 `finite-fourier-inversion`: box indicators expand into products of additive characters; `Loeffler, Theorem 2.15`: growth bounded by (r_1, …, r_g) is a bound on rectangular coset masses.

*Acceptance.* m = 0: B(a, 0) = ℤ_p^g and 1_{B(a,0)} = 1. For g = 1, 1_{B(a,m)} = 1_{a+p^mℤ_p}.

*Needs:* Mathlib `PadicInt.toZModPow`; Mathlib `PadicInt.ker_toZModPow`; Mathlib `LocallyConstant.charFn`; Mathlib `LocallyConstant`; `PadicMeasuresIwasawaAlgebras:L2/residue-fiber-clopen`.

*Source:* Loeffler v3, §2.2, Definition 2.8, printed p. 4; §2.3, Definition 2.14, printed p. 5: Growth conditions are bounds on the values of a locally constant distribution on the indicators of cosets a + p^mH and a + (p^{m_1}H_1) × ⋯ × (p^{m_g}H_g). Colmez (author PDF), §I.3.1, definition of LC_h and the paragraph before Lemma I.3.1, printed p. 9: Locally constant functions on the compact ℤ_p form the increasing union of the LC_h.

### 2.E.2 The multivariable van der Put basis and mixed differences

`LocallyAnalyticDistributions:L2/multivariable-van-der-put` · Lemma.

For n ∈ ℕ^g let S(n) = B(n, (ℓ(n_1), …, ℓ(n_g))) = ∏_j (n_j + p^{ℓ(n_j)}ℤ_p). (i) For each radius tuple h, the indicators 1_{S(n)} with n_j < p^{h_j} form a basis of the functions constant on the boxes of radius h, related to the box indicators 1_{B(a,h)} by a unitriangular integer matrix; the 1_{S(n)}, n ∈ ℕ^g, form a basis of LC(ℤ_p^g, K). (ii) The coefficients of f = Σ_n c_n(f)1_{S(n)} are the mixed van der Put differences c_n(f) = Σ_{T⊆J(n)} (−1)^{|T|} f(n^T), where J(n) = {j : n_j ≥ 1}, n_j^− = n_j mod p^{ℓ(n_j)−1} is n_j without its leading base-p digit, and n^T replaces n_j by n_j^− for j ∈ T. (iii) Each c_n extends to a continuous linear form on C(ℤ_p^g, K) with |c_n(f)| ≤ ‖f‖_∞, and (1_{S(n)})_n is an orthonormal basis of C(ℤ_p^g, K): ‖f‖_∞ = max_n |c_n(f)| and f = Σ_n c_n(f)1_{S(n)} uniformly.

*Proof outline.*
1. (i) For g = 1 this is Colmez Proposition I.3.2; for g ≥ 1 the functions constant on boxes of radius h are the tensor product of the one-variable spaces LC_{h_j}, and products of bases are bases.
2. (ii) For x ∈ ℕ^g with x_j < p^{h_j}, f(x) = Σ c_n over the n with each n_j a truncation of x_j (x_j, x_j^−, x_j^{−−}, …, 0); Möbius inversion on this product of chains gives the alternating sum.
3. (iii) An alternating sum of 2^{|J(n)|} values has absolute value ≤ ‖f‖_∞ by the ultrametric inequality, and ‖Σ c_n1_{S(n)}‖_∞ ≤ max|c_n|; on LC this gives equality, and LC is dense in C(ℤ_p^g, K) by uniform continuity.

*Acceptance.* p = 2, g = 1: f = 1_{1+2ℤ_2} has c_0 = 0, c_1 = 1 and all other coefficients 0. f(x_1, x_2) = 1_{pℤ_p}(x_2) has c_{(0,0)} = 1, c_{(0,a)} = −1 for 1 ≤ a ≤ p − 1, and all other coefficients 0.

*Needs:* 2.E.1 `box-indicators`; 2.A.1 `locally-polynomial-functions`.

*Source:* Colmez (author PDF), §I.3.1, Proposition I.3.2 and its proof, Definition I.3.3, printed pp. 9–10: The indicators 1_{i+p^{ℓ(i)}ℤ_p} are a basis of LC_h and LC and an orthonormal basis of C(ℤ_p, L), by a unitriangular change of basis. Loeffler v3, Proof of Theorem 2.9, printed p. 4: Uses the indicators of S(i_1, …, i_d) = (i_1 + p^{ℓ(i_1)}ℤ_p) × ⋯ × (i_d + p^{ℓ(i_d)}ℤ_p) as a wavelet basis of locally constant functions on ℤ_p^d.

### 2.E.3 Locally polynomial functions of separate degree

`LocallyAnalyticDistributions:L2/separate-degree-polynomials` · Definition.

For N ∈ ℕ^g and h ∈ ℕ, LP^N_h(ℤ_p^g, K) is the space of functions f : ℤ_p^g → K whose restriction to every box of radius (h, …, h) agrees with a polynomial of degree ≤ N_j in x_j for each j; LP^N = ∪_h LP^N_h. It is the image of the algebraic tensor product ⊗_j LP^{[0,N_j]}(ℤ_p, K) under (φ_j) ↦ ∏_j φ_j(x_j), and this map is injective. For r ∈ ℝ_{≥0}^g, the tensor wavelets e_{n,k,r}(x) = ∏_j e_{n_j,k_j,r_j}(x_j), n ∈ ℕ^g, k_j ≤ [r_j], form a basis of LP^{[r]}(ℤ_p^g, K), where [r] = ([r_1], …, [r_g]). Separate degree is not total degree: x_1x_2 has separate degree (1, 1).

*Proof outline.*
1. Products of the one-variable local monomial bases are a basis of the functions polynomial of separate degree ≤ N on the boxes of radius (h, …, h); this is the tensor product of the one-variable spaces.
2. The tensor wavelets are nonzero multiples of products of local monomials on the boxes S(n); colmez-wavelets gives the one-variable basis.

*API.*
- `TauCeti.AnalyticDistributions.LPmulti` (constructor): LPmulti N h : the K-subspace of functions ℤ_p^g → K polynomial of separate degree ≤ N on each box of radius (h, …, h); LPmultiAll N is the union.
- `TauCeti.AnalyticDistributions.LPmulti_eq_tensor` (characterisation): The product map ⊗_j LPAll (N j) → LPmultiAll N is a linear isomorphism.
- `TauCeti.AnalyticDistributions.tensorWavelet` (constructor): tensorWavelet r n k x = ∏_j colmezWavelet (r j) (n j) (k j) (x j).
- `TauCeti.AnalyticDistributions.tensorWavelet_basis` (characterisation): For each h, the tensorWavelet r n k with n_j < p^h and k_j ≤ [r_j] are linearly independent and span LPmulti [r] h; with n ranging over ℕ^g they form a basis of LPmultiAll [r].
- `TauCeti.AnalyticDistributions.LPmulti_mono` (relation): LPmulti N h ≤ LPmulti N′ h′ for N ≤ N′, h ≤ h′.
- `TauCeti.AnalyticDistributions.LPmulti_zero_eq_locallyConstant` (compatibility): LPmultiAll 0 is the image of LocallyConstant (Fin g → ℤ_p) K.
- `TauCeti.AnalyticDistributions.LPmulti_mul` (structure): LPmulti N h·LPmulti M h ⊆ LPmulti (N + M) h.

*Unit tests.*
- `AnalyticDistributionTests.LPmulti_finrank` (computation): For p = 2, g = 2, N = (1, 0) and h = 1, dim_K LPmulti N h = 4·2 = 8.
- `AnalyticDistributionTests.LPmulti_one_variable` (degenerate): For g = 1, LPmulti (N) h = LP N h.
- `AnalyticDistributionTests.LPmulti_zero_locallyConstant` (compatibility): LPmultiAll 0 coincides with LocallyConstant (Fin g → ℤ_p) K as a set of functions.
- `AnalyticDistributionTests.LPmulti_separate_not_total` (non-example): x_1x_2 ∈ LPmulti (1, 1) 0 but x_1x_2 ∉ LPmulti (2, 0) h for every h: separate degree differs from total degree.

*Uses.* `L2/tensor-multidegree-extension` (predecessor packet: Multidegree admissibility and uniqueness): the domain of the functionals extended to the vector-order dual; `L2/locally-algebraic-determination` (predecessor packet: Determination by finite characters and polynomial moments): the test functions χ(x)∏x_j^{k_j} span the separate-degree spaces level by level; 2.F.5 `tensor-higher-degree-vanishing`: the subdivision induction runs over separate degrees.

*Acceptance.* N = 0: LP^0 = LC(ℤ_p^g, K). g = 1: LP^{(N)} = LP^{[0,N]}(ℤ_p, K).

*Needs:* 2.A.1 `locally-polynomial-functions`; 2.A.2 `colmez-wavelets`; 2.E.1 `box-indicators`.

*Source:* Loeffler v3, §2.2, Remark 2.10, printed p. 4: Refers to locally polynomial distributions of degree k in several variables (De Ieso) and their growth. Colmez (author PDF), Proposition I.5.8 and Lemma I.5.9, printed p. 21: One-variable bases of locally polynomial functions, whose products give the separate-degree bases.

## 2.F. Vector order

The predecessor defines vector order as the completed projective tensor of the one-variable C^{r_i} spaces (`L2/anisotropic-tensor-wavelets`) and proves the rectangular extension theorem for r_i < 1. The targets below realise that space as functions and characterise it by mixed van der Put differences, which is the corrected form of Loeffler's Definition 2.12 (E3, E11). They also give the two halves of the multidegree extension theorem `L2/tensor-multidegree-extension`, and the chart changes needed for higher vector orders.

### 2.F.1 The vector-order space as a space of functions

`LocallyAnalyticDistributions:L2/tensor-function-realization` · Theorem.

Let r ∈ ℝ_{≥0}^g and V_r = ⊗̂_{π,j} C^{r_j}(ℤ_p, K), the vector-order space of LocallyAnalyticDistributions:L2/anisotropic-tensor-wavelets. (i) The tensor wavelets e_{n,k,r} (n ∈ ℕ^g, k_j ≤ [r_j]) form a Banach basis of V_r: synthesis c₀(ℕ^g × ∏_j{0, …, [r_j]}, K) → V_r is an isomorphism. (ii) The realization R : V_r → C(ℤ_p^g, K), Σ b_{n,k}e_{n,k,r} ↦ (x ↦ Σ b_{n,k}∏_j e_{n_j,k_j,r_j}(x_j)), is well defined, continuous, injective, and sends ⊗_jφ_j to x ↦ ∏_jφ_j(x_j). (iii) R(V_r) contains LP^N(ℤ_p^g, K) for every N ∈ ℕ^g and the locally analytic functions LA(ℤ_p^g, K); LP^{[r]} is dense in V_r, hence so are LP^N for N ≥ [r] and LA. (iv) For r = 0, R is an isometric isomorphism V_0 ≅ C(ℤ_p^g, K). Through R, a continuous linear form on V_r is determined by its values on LP^{[r]}, and the coordinate forms of (i) are the tensor amplitude coefficients. Norm convention: V_r may use the predecessor's c₀ coefficient norm or the equivalent projective norm v_π induced by the one-variable Mahler valuations. Explicit constants involving C_1(r_j) below use v_π and its dual v_π*, rather than silently identifying these equivalent norms.

*Proof outline.*
1. (i) Each factor has the Banach basis of cr-wavelet-basis; LocallyAnalyticDistributions:L0/product-analytic-tensor identifies the completed projective tensor of c₀ spaces with c₀ of the product index set.
2. (ii) |e_{n_j,k_j,r_j}| ≤ 1 pointwise, so the series converges uniformly. Injectivity by induction on g: if R(F) = 0, fix x_2, …, x_g; the function of x_1 is the C^{r_1} function with wavelet coefficients Σ_{n′,k′} b_{(n_1,n′),(k_1,k′)}∏_{j≥2}e(x_j), which must all vanish by uniqueness of the one-variable expansion, and each such coefficient family is the realization in g − 1 variables of a null family. Cofinite nullity of the full coefficient family bounds each tail uniformly in the fixed other coordinates, so the aggregated coefficients tend to zero in the first index; for a fixed first index the remaining coefficient family is again null. This justifies both uses of one-variable uniqueness and the induction.
3. (iii) A one-variable local polynomial lies in LA ⊆ C^{r_j} (cr-locally-analytic-bound), so LP^N consists of finite sums of pure tensors; a locally analytic function of radius h is a sum of local monomials on the boxes of radius (h, …, h) with coefficients tending to 0, and these monomials have V_r-norms bounded by p^{Σ_j(r_jh + C_1(r_j))}. Finite sums of tensor wavelets are dense in c₀.
4. (iv) For r = 0 the tensor wavelets are the 1_{S(n)}, an orthonormal basis of C(ℤ_p^g, K) by multivariable-van-der-put.

*Acceptance.* g = 1: R is the identity of C^{r_1}(ℤ_p, K). For r = (1/2, 0), 1 ⊗ 1_{pℤ_p} realizes to f(x_1, x_2) = 1_{pℤ_p}(x_2), an element of R(V_r) (contrast sourceIssues E3).

*Needs:* 2.A.9 `cr-wavelet-basis`; 2.E.3 `separate-degree-polynomials`; 2.E.2 `multivariable-van-der-put`; 2.A.5 `cr-locally-analytic-bound`; `L2/anisotropic-tensor-wavelets` (predecessor packet: Tensor wavelets and vector order); `L0/product-analytic-tensor` (predecessor packet: Products and completed analytic tensors).

*Source:* Loeffler v3, Remark 2.13 and the proof of Theorem 2.15, printed p. 5: The completed tensor product of the one-variable spaces gives an explicit Banach basis of the vector-order space; its realization as functions and the injectivity are derived here. This uses the intended tensor construction, not the false first-difference definition (E3). Colmez (author PDF), Theorem I.5.14, printed p. 23; Proposition I.1.8, printed p. 6: One-variable wavelet basis used in each factor. I.1.8 identifies completed c₀ tensors with c₀ of the product index set.

### 2.F.2 Vector order by mixed van der Put differences

`LocallyAnalyticDistributions:L2/vector-order-mixed-differences` · Comparison.

Let 0 ≤ r_j < 1 for every j and let f : ℤ_p^g → K be continuous, with multivariable van der Put coefficients c_n(f). Then f ∈ R(V_r) if and only if v_p(c_n(f)) − Σ_j r_jℓ(n_j) → +∞ along the cofinite filter of ℕ^g, and the norm of V_r is equivalent to w_r(f) = inf_n(v_p(c_n(f)) − Σ_j r_jℓ(n_j)): the c₀ valuation v of f in the scaled tensor-wavelet basis satisfies w_r(f) ≤ v(f) < w_r(f) + g for f ≠ 0; for f = 0 both valuations are +∞. Each c_n(f) is a mixed difference Δ_{y_{j_1}}⋯Δ_{y_{j_s}}f of f at a lattice point, with steps y_j of valuation ℓ(n_j) − 1 in the coordinates j ∈ J(n). This replaces the single-difference condition of Loeffler's Definition 2.12: the function 1_{pℤ_p}(x_2) has finitely many nonzero c_n, so it lies in R(V_r) for every r, whereas the printed condition excludes it for r = (1/2, 0) (sourceIssues E3).

*Proof outline.*
1. For r_j < 1 only k = 0 occurs, so V_r has the Banach basis e_{n,0,r} = p^{Σ_j⌊r_jℓ(n_j)⌋}1_{S(n)} (tensor-function-realization (i)).
2. By injectivity of R and uniqueness of the van der Put expansion of a continuous function (multivariable-van-der-put (iii)), the coefficient of f on e_{n,0,r} is c_n(f)p^{−Σ_j⌊r_jℓ(n_j)⌋}; the c₀ condition is the stated limit, and Σ_j(r_jℓ(n_j) − ⌊r_jℓ(n_j)⌋) ∈ [0, g) gives w_r ≤ v ≤ w_r + g. For nonzero f the weighted-null condition makes the minimum defining w_r attained at some nonzero coefficient, where the floor loss is strictly less than g; hence v < w_r + g. The zero function has both valuations +∞.
3. Möbius inversion in multivariable-van-der-put (ii) writes c_n(f) as an iterated difference in the coordinates of J(n).

*Acceptance.* r = 0: the condition is c_n(f) → 0, which holds for every continuous f. For g = 1 and r < 1 the condition is v_p(b_i(φ)) − rℓ(i) → ∞, Colmez's wavelet description of C^r (cr-mahler-criterion). f = 0 satisfies the coefficient criterion and both valuations are +∞; no strict inequality involving +∞ is asserted.

*Needs:* 2.F.1 `tensor-function-realization`; 2.E.2 `multivariable-van-der-put`.

*Source:* Loeffler v3, Definition 2.12 and Remark 2.13, printed pp. 4–5 (page images checked by the parent review): Defines vector order by simultaneous first differences with a cofinite filter and identifies it with the completed tensor; the identification fails as printed (E3) and is replaced by this characterisation. Colmez (author PDF), Proposition I.3.2, printed pp. 9–10; Theorem I.5.14, printed p. 23: One-variable van der Put basis and wavelet basis of C^r for r < 1.

### 2.F.3 Multidegree moment bounds for the vector-order dual

`LocallyAnalyticDistributions:L2/tensor-moment-necessity` · Lemma.

Let r ∈ ℝ_{≥0}^g and μ a continuous linear form on V_r. There is C such that for every a ∈ ℤ_p^g, radius tuple m and k ∈ ℕ^g: v_p(μ(1_{B(a,m)}·∏_j((x_j − a_j)/p^{m_j})^{k_j})) ≥ C − Σ_j r_jm_j, with C = v_π*(μ) − Σ_j C_1(r_j), where v_π is induced by the one-variable Mahler valuations and v_π* is its dual operator valuation. For the equivalent c₀ coefficient norm the existence of C is unchanged, but its conversion constant must also be included.

*Proof outline.*
1. The test function is the realization of the pure tensor ⊗_jφ_{a_j,m_j,k_j}.
2. The projective tensor norm induced by the Mahler norms is a cross norm, so its valuation is at least Σ_j v_{C^{r_j}}(φ_{a_j,m_j,k_j}) ≥ −Σ_j(r_jm_j + C_1(r_j)) by cr-locally-analytic-bound. Applying μ contributes v_π*(μ).

*Acceptance.* g = 1: Colmez Theorem II.3.2(i). r = 0 and k = 0: bounded measures on ℤ_p^g have bounded box masses.

*Needs:* 2.F.1 `tensor-function-realization`; 2.A.5 `cr-locally-analytic-bound`; `L0/product-analytic-tensor` (predecessor packet: Products and completed analytic tensors).

*Source:* Colmez (author PDF), Theorem II.3.2(i) and its proof, printed p. 32: One-variable moment bound for order-r distributions, applied here in each tensor factor. Loeffler v3, Remark 2.13, printed p. 5: Identifies the vector-order space with the completed tensor product, whose cross norm gives the bound. Use the corrected tensor interpretation of this remark (E3).

### 2.F.4 Bounded tensor wavelet values from multidegree moment bounds

`LocallyAnalyticDistributions:L2/tensor-wavelet-value-bound` · Lemma.

Let r ∈ ℝ_{≥0}^g, N ∈ ℕ^g with N_j ≥ [r_j], and μ a K-linear form on LP^N(ℤ_p^g, K) such that v_p(μ(1_{B(a,m)}·∏_j((x_j − a_j)/p^{m_j})^{k_j})) ≥ C − Σ_j r_jm_j for all a, m and k ≤ N. Then v_p(μ(e_{n,k,r})) ≥ C − g for all n and k_j ≤ [r_j], and there is a unique continuous linear form μ̃ on V_r with μ̃(e_{n,k,r}) = μ(e_{n,k,r}).

*Proof outline.*
1. e_{n,k,r} = p^{Σ_j⌊r_jℓ(n_j)⌋}·1_{S(n)}∏_j((x_j − n_j)/p^{ℓ(n_j)})^{k_j} and S(n) = B(n, ℓ(n)); apply the bound with m_j = ℓ(n_j) and use Σ_j(⌊r_jℓ(n_j)⌋ − r_jℓ(n_j)) > −g.
2. V_r has the Banach basis (e_{n,k,r}) (tensor-function-realization (i)), so a bounded family defines a unique continuous form.

*Acceptance.* r_j < 1 for all j and N = 0: this is the existence part of LocallyAnalyticDistributions:L2/rectangular-extension.

*Needs:* 2.F.1 `tensor-function-realization`; 2.E.3 `separate-degree-polynomials`.

*Source:* Colmez (author PDF), Proof of Theorem II.3.2(ii), printed p. 33: One-variable bound v_p(b_{i,k}) ≥ v_{D_r,N}(μ) − 1, extended here factor by factor.

### 2.F.5 Vanishing in higher separate degree by coordinatewise subdivision

`LocallyAnalyticDistributions:L2/tensor-higher-degree-vanishing` · Lemma.

Let r ∈ ℝ_{≥0}^g, N ∈ ℕ^g with N_j ≥ [r_j], and λ a K-linear form on LP^N(ℤ_p^g, K) satisfying the multidegree moment bound of tensor-wavelet-value-bound. If λ vanishes on LP^{[r]}(ℤ_p^g, K), then λ = 0.

*Proof outline.*
1. For 0 ≤ t ≤ g let T_t be the span of the tests 1_{B(a,m)}∏_jx_j^{k_j} with k_j ≤ [r_j] for j ≤ t and k_j ≤ N_j for j > t; T_g = LP^{[r]} lies in the kernel and T_0 = LP^N.
2. Assume T_t ⊆ ker λ and take a test in T_{t−1} with exponent k_t ≤ N_t in coordinate t. Subdivide B(a, m) in coordinate t only, into the p^s boxes of radius m + se_t, and expand x_t^{k_t} binomially around their centres b: the terms with j ≤ [r_t] lie in T_t; a term with j > r_t is p^{j(m_t+s)} times a normalised moment, of valuation ≥ (j − r_t)(m_t + s) + C′ with C′ independent of s. More explicitly, rewrite every fixed other-coordinate raw power x_j^{k_j} as a finite sum of normalised powers ((x_j − a_j)/p^{m_j})^{u_j}, u_j ≤ k_j. Their binomial coefficients and p^{m_j u_j} factors depend only on the original test. The centre coefficients in coordinate t have valuation ≥ 0. The moment bound therefore yields a single C′ independent of the refinement s and its centres. The ultrametric bound on the finite subdivision sum has the same C′.
3. Let s → ∞. Subdividing in all coordinates at once would fail, since coordinates with exponent below r_j contribute negative multiples of their radii; the induction refines one coordinate at a time.

*Acceptance.* g = 1: Colmez's subdivision argument (higher-degree-vanishing). N = [r]: nothing to prove.

*Needs:* 2.E.3 `separate-degree-polynomials`; 2.E.1 `box-indicators`; 2.F.4 `tensor-wavelet-value-bound`.

*Source:* Colmez (author PDF), Proof of Theorem II.3.2(ii), last paragraph, printed p. 33: One-variable subdivision of balls; the coordinatewise induction for several variables is derived here.

### 2.F.6 Chart changes on vector-order spaces

`LocallyAnalyticDistributions:L2/tensor-chart-pullback` · Lemma.

(i) If σ_1, …, σ_g : ℤ_p → ℤ_p are maps for which pullback is continuous on C^{r_j}(ℤ_p, K) (by cr-composition: affine maps for every r_j, Lipschitz maps for r_j < 1, maps of class C^{r_j} for r_j ≥ 1), then f ↦ f∘(σ_1 × ⋯ × σ_g) is a continuous endomorphism of V_r, compatible with the realization R. (ii) Translation by b ∈ ℤ_p^g, multiplication by box indicators and by functions of one variable lying in C^{r_j}, and the affine transport x ↦ a + (p^{m_1}x_1, …, p^{m_g}x_g) from B(a, m) to ℤ_p^g are continuous, with norm constants depending on m and r. (iii) Let G be a compact abelian p-adic Lie group with a quasi-factorization into one-dimensional summands and two choices of compatible subgroups and coordinates preserving the summands. On a common open subgroup the transition is a product of scalings x_j ↦ c_jx_j, c_j ∈ ℚ_p^×, followed by translations between cosets; hence the vector-order spaces, their duals and the growth conditions agree, with equivalent norms. This supplies the higher-order input of LocallyAnalyticDistributions:L2/quasifactor-chart-invariance.

*Proof outline.*
1. (i) The completed projective tensor product of continuous operators is continuous and agrees with the pullback on pure tensors, hence everywhere by density and continuity of R.
2. (ii) Translations and affine transports are products of one-variable affine maps; multiplication by a one-variable function is the tensor product of a multiplication operator (cr-banach-algebra) with identities.
3. (iii) A closed subgroup with one-dimensional Lie algebra is commensurable with any other such; a continuous isomorphism between open subgroups of ℤ_p is multiplication by an element of ℚ_p^×.

*Acceptance.* A swap of two coordinates with r_1 ≠ r_2 does not preserve V_r unless r is swapped too. For r = 0 every homeomorphism of ℤ_p^g acts isometrically on C(ℤ_p^g, K).

*Needs:* 2.A.13 `cr-composition`; 2.A.12 `cr-banach-algebra`; 2.F.1 `tensor-function-realization`; 2.E.1 `box-indicators`; `L0/product-analytic-tensor` (predecessor packet: Products and completed analytic tensors).

*Source:* Loeffler v3, §2.2, footnote 2, printed p. 3; Remark 2.13, printed p. 5: Pullback along scaling is continuous but not isometric; the vector-order spaces are invariant under automorphisms preserving the quasi-factorization. De Ieso, Proposition 2.12, printed pp. 12–14: Continuity of composition on C^r for [r] ≥ 1, applied in each factor.

## 2.G. Isotropic order and block vector order

Loeffler's quasi-factorizations allow summands of any dimension, and the ray class groups of number fields need them: each prime above p contributes a summand of dimension [K_𝔭 : ℚ_p]. The isotropic spaces of Loeffler's Definition 2.5 are the factors. The targets below prove their wavelet basis and extension theorem (Loeffler's Theorem 2.9, whose proof the source only sketches), and build the block vector order with its extension theorem (Theorem 2.15 in its stated generality).

### 2.G.1 Isotropic functions of order r < 1 in several variables

`LocallyAnalyticDistributions:L2/isotropic-order-functions` · Definition.

Let d ≥ 1 and 0 ≤ r < 1. For a continuous f : ℤ_p^d → K and m ∈ ℕ put ε_m(f) = inf_{x∈ℤ_p^d, y∈p^mℤ_p^d} v_p(f(x + y) − f(x)). Then f is of (isotropic) order r if ε_m(f) − rm → +∞; these f form C^r_iso(ℤ_p^d, K), a K-Banach space for v_r(f) = min(inf_x v_p(f(x)), inf_m(ε_m(f) − rm)); D^r_iso(ℤ_p^d, K) is its dual. The definition uses only the subgroups p^mℤ_p^d, so every affine map x ↦ a + Ax with A ∈ GL_d(ℤ_p) acts isometrically; for a compact abelian p-adic Lie group G with an open subgroup H ≅ ℤ_p^d, C^r_iso(G, K) is defined on the cosets of H and its topology does not depend on H. For d = 1 it is Colmez's C^r(ℤ_p, K) with v′_{C^r}.

*Proof outline.*
1. v_r is an ultrametric valuation and C^r_iso is complete (a uniform limit with uniform remainder bounds keeps the bounds).
2. A bicontinuous additive automorphism A of ℤ_p^d maps p^mℤ_p^d onto itself, so ε_m(f∘A) = ε_m(f); two open subgroups H, H′ ≅ ℤ_p^d are commensurable, which shifts m by a bounded amount.
3. For d = 1 and r < 1, [r] = 0 and the definitions agree (Loeffler Remark 2.6).

*API.*
- `TauCeti.AnalyticDistributions.IsIsotropicCr` (characterisation): IsIsotropicCr r f ↔ ∀ ε > 0, ∃ m₀, ∀ m ≥ m₀, ∀ x y, (∀ j, ‖y_j‖ ≤ p^{−m}) → ‖f(x + y) − f(x)‖ ≤ ε·p^{−rm}.
- `TauCeti.AnalyticDistributions.isoCr` (constructor): isoCr r : the K-subspace C^r_iso(ℤ_p^d, K) of continuous f with IsIsotropicCr r f; its valuation v_r is a README target.
- `TauCeti.AnalyticDistributions.isoCr_one_dim` (compatibility): For d = 1 and 0 ≤ r < 1, f ∈ isoCr r iff f is of class C^r in Colmez's sense; moreover v_r = v′_{C^r} (README).
- `TauCeti.AnalyticDistributions.isoCr_aut_invariant` (functoriality): f ↦ f∘A preserves isoCr r for every bicontinuous additive automorphism A of ℤ_p^d, isometrically for v_r (README).
- `TauCeti.AnalyticDistributions.isoCr_locallyConstant_dense` (characterisation): For 0 ≤ r < 1, every f ∈ isoCr r is approximated by locally constant φ: for each ε > 0 some φ has ‖f − φ‖_∞ ≤ ε and increments of f − φ bounded by ε·p^{−rm} on p^mℤ_p^d. This follows from the weighted-null wavelet expansion in isotropic-wavelet-basis, rather than being assumed in its proof.
- `TauCeti.AnalyticDistributions.isoCr_mono` (relation): isoCr s ⊆ isoCr r for 0 ≤ r ≤ s < 1 (continuously, README).
- `TauCeti.AnalyticDistributions.isoCr_mul` (structure): isoCr r is closed under products, by ε_m(fg) ≥ min(ε_m(f) + inf v_p(g), inf v_p(f) + ε_m(g)); it is a Banach algebra for v_r.

*Unit tests.*
- `AnalyticDistributionTests.isoCr_box_value` (computation): v_r(1_{p²ℤ_p × ℤ_p}) = −r: ε_0 = ε_1 = 0 and ε_m = +∞ for m ≥ 2.
- `AnalyticDistributionTests.isoCr_one_dim_compat` (compatibility): For d = 1, IsIsotropicCr r f ↔ f is of class C^r in Colmez's sense, for 0 ≤ r < 1.
- `AnalyticDistributionTests.isoCr_order_zero` (degenerate): For r = 0, isoCr 0 = C(ℤ_p^d, K) with the sup valuation.
- `AnalyticDistributionTests.isoCr_quarter_digit` (non-example): f(x_1, x_2) = Σ_n a_n(x_1)p^{⌊n/4⌋} has ε_m(f) = ⌊m/4⌋, so f is of isotropic order r exactly for r < 1/4.

*Uses.* `Loeffler, Theorem 2.9`: the extension theorem for locally constant distributions of growth r < 1 on abelian p-adic groups; `L2/rayclass-growth-adapter` (predecessor packet: From conductor bounds to analytic ray-class distributions): the equal-radius case applies the isotropic extension theorem; 2.G.4 `block-vector-order`: the factor spaces of a quasi-factorization with summands of dimension > 1.

*Acceptance.* Locally constant functions have ε_m = +∞ for large m, so LC ⊆ C^r_iso for every r < 1. d = 0 (G finite): every function, Loeffler Remark 2.7.

*Needs:* 2.E.1 `box-indicators`; `L2/c-r-functions` (predecessor packet: Functions of class C^r).

*Source:* Loeffler v3, §2.2, Definition 2.5, Remarks 2.6–2.7 and the paragraph on extension to groups, printed p. 3: Defines order r < 1 on ℤ_p^d by first differences on p^mG, notes that it recovers Colmez's v′_{C^r} for d = 1, that locally constant functions are dense, and that the construction extends to abelian groups with an open subgroup ≅ ℤ_p^d.

### 2.G.2 The wavelet basis of the isotropic spaces

`LocallyAnalyticDistributions:L2/isotropic-wavelet-basis` · Theorem.

For 0 ≤ r < 1 the functions e^{iso}_{n,r} = p^{⌊r·max_jℓ(n_j)⌋}1_{S(n)}, n ∈ ℕ^d, form a Banach basis of C^r_iso(ℤ_p^d, K): v_r(Σ b_ne^{iso}_{n,r}) ≥ inf_n v_p(b_n) − 1 for null families (b_n), and every f ∈ C^r_iso has van der Put coefficients with v_p(c_n(f)) ≥ v_r(f) + r(max_jℓ(n_j) − 1) for n ≠ 0, while c_0(f) = f(0) has v_p(c_0(f)) ≥ v_r(f), so its coordinates b_n = c_n(f)p^{−⌊r·max_jℓ(n_j)⌋} satisfy inf v_p(b_n) ≥ v_r(f) − 1. Equivalently, a continuous f lies in C^r_iso iff v_p(c_n(f)) − r·max_jℓ(n_j) → +∞ along the cofinite filter of ℕ^d.

*Proof outline.*
1. For n = 0, S(0) is the whole space, e^{iso}_{0,r} = 1, v_r(e^{iso}_{0,r}) = 0, and c_0(f) = f(0). For n ≠ 0 put M = max_jℓ(n_j) ≥ 1. The indicator 1_{S(n)} is invariant under p^Mℤ_p^d; hence v_r(1_{S(n)}) ≥ −r(M − 1) and v_r(e^{iso}_{n,r}) ≥ ⌊rM⌋ − rM + r > −1.
2. For n ≠ 0, multivariable-van-der-put writes c_n(f) as an alternating sum of differences in a coordinate of length M, with step valuation M − 1; thus v_p(c_n(f)) ≥ ε_{M−1}(f) ≥ v_r(f) + r(M − 1). Also ε_{M−1}(f) − r(M − 1) → +∞. As only finitely many indices have bounded M, this proves weighted cofinite nullity of b_n = c_n(f)p^{−⌊rM⌋}.
3. The uniform wavelet valuation bound makes synthesis of a null family converge in the complete C^r_iso space. For f ∈ C^r_iso its weighted-null coefficients synthesize a function with the same ordinary van der Put coefficients; uniqueness of that expansion identifies it with f. Conversely synthesis gives an isotropic function for every weighted-null family. These bounds prove the Banach-basis isomorphism directly; its finite sums are locally constant, so density of LC follows without circularity.

*Acceptance.* d = 1: the basis is Colmez's e_{i,0,r} for r < 1. For d = 2, r = 1/2 and n = (p^m, p^m) the weight is p^{⌊(m+1)/2⌋}, not the p^{2⌊(m+1)/2⌋} of vector order (1/2, 1/2). The zero multi-index contributes the constant basis vector 1 with valuation 0 and coefficient f(0); no ε_{−1} is used.

*Needs:* 2.G.1 `isotropic-order-functions`; 2.E.2 `multivariable-van-der-put`.

*Source:* Loeffler v3, Proof of Theorem 2.9, printed p. 4: Asserts that p^{sup_j⌊rℓ(i_j)⌋}1_{S(i_1,…,i_d)} is a Banach basis of C^r(ℤ_p^d, E), with the verification left to the reader; the argument above supplies it. Colmez (author PDF), Lemma I.5.11 and Theorem I.5.14, printed pp. 22–23: One-variable model: bounds on wavelet coefficients by differences at the top level.

### 2.G.3 Extension of locally constant distributions of growth r < 1

`LocallyAnalyticDistributions:L2/isotropic-extension` · Theorem.

Let G be a compact abelian p-adic Lie group, 0 ≤ r < 1, and μ a K-linear form on LC(G, K) with growth bounded by r: there are C ∈ ℝ and an open subgroup H ≅ ℤ_p^d with v_p(μ(1_{a+p^mH})) ≥ C − rm for all a ∈ G and m ≥ 0. Then μ extends uniquely to μ̃ ∈ D^r_iso(G, K). Conversely, the restriction to LC of every element of D^r_iso(G, K) has growth bounded by r, and whether μ has growth bounded by r does not depend on H (the constant does).

*Proof outline.*
1. Reduce to G = H = ℤ_p^d using the finitely many cosets of H.
2. S(n) is a disjoint union of cosets of p^MH, M = max_jℓ(n_j) (box-indicators, refinement), so v_p(μ(1_{S(n)})) ≥ C − rM and v_p(μ(e^{iso}_{n,r})) ≥ C + ⌊rM⌋ − rM > C − 1.
3. A bounded family on the Banach basis of isotropic-wavelet-basis defines a unique continuous form; uniqueness of the extension is density of LC.
4. Converse: 1_{a+p^mH} is invariant under p^mH, so v_r(1_{a+p^mH}) ≥ −rm.

*Acceptance.* d = 1: Loeffler's Theorem 2.3(ii) (Amice–Vélu–Vishik for r < 1). Bounded measures: r = 0.

*Needs:* 2.G.2 `isotropic-wavelet-basis`; 2.E.1 `box-indicators`.

*Source:* Loeffler v3, §2.2, Definition 2.8, Theorem 2.9 and its proof, printed p. 4: States the extension theorem for locally constant distributions with growth bounded by r < 1 on abelian p-adic analytic groups, with a proof sketch through the wavelet basis.

### 2.G.4 Vector order for quasi-factorizations with higher-dimensional summands

`LocallyAnalyticDistributions:L2/block-vector-order` · Construction.

Let G be a compact abelian p-adic Lie group with a quasi-factorization Lie G = ⊕_{i=1}^{g} h_i, dim h_i = d_i ≥ 1, compatible closed subgroups H_i ≅ ℤ_p^{d_i} with ∏_iH_i open in G, and r = (r_1, …, r_g) with 0 ≤ r_i < 1. The block vector-order space is C^{(r)}(G, K) = {f ∈ C(G, K) : on every coset of ∏H_i the transported function lies in V^{blk}_r}, where V^{blk}_r = ⊗̂_{π,i}C^{r_i}_iso(ℤ_p^{d_i}, K); D^{(r)}(G, K) is its dual. For n ∈ ℕ^{d_1+⋯+d_g}, grouped into blocks n^{(i)} ∈ ℕ^{d_i}, the functions p^{Σ_i⌊r_i·max_jℓ(n^{(i)}_j)⌋}1_{S(n)} form a Banach basis, and a continuous f lies in V^{blk}_r iff v_p(c_n(f)) − Σ_i r_i·max_jℓ(n^{(i)}_j) → +∞. With all d_i = 1 this is the vector order of LocallyAnalyticDistributions:L2/anisotropic-tensor-wavelets (for r_i < 1); with g = 1 it is the isotropic space. The space does not depend on the compatible subgroups or on coordinates of the H_i.

*Proof outline.*
1. Banach basis: the tensor product of the isotropic bases (isotropic-wavelet-basis) under the c₀ identification of LocallyAnalyticDistributions:L0/product-analytic-tensor.
2. Van der Put description: as in vector-order-mixed-differences, using injectivity of the realization (tensor-function-realization, whose induction applies to isotropic factors) and uniqueness of van der Put expansions.
3. Independence: within a block, isotropic spaces are invariant under GL_{d_i}(ℤ_p) and commensurable subgroups (isotropic-order-functions); across blocks use tensor-chart-pullback.

*API.*
- `TauCeti.AnalyticDistributions.blockVectorOrderSpace` (constructor): blockVectorOrderSpace b r : the continuous functions on ℤ_p^D with ‖c_n(f)‖·p^{Σ_i r_i·max_{j∈ block i}ℓ(n_j)} → 0 cofinitely, blocks given by b : Fin D → Fin g; for r_i < 1 this is the realization of ⊗̂_iC^{r_i}_iso(ℤ_p^{d_i}, K), normed by blockNorm.
- `TauCeti.AnalyticDistributions.blockVectorOrderSpace_basis` (characterisation): The scaled indicators p^{Σ_i⌊r_i·max_jℓ(n^{(i)}_j)⌋}1_{S(n)} form a Banach basis.
- `TauCeti.AnalyticDistributions.mem_blockVectorOrderSpace_iff` (characterisation): f ∈ blockVectorOrderSpace b r ↔ f is continuous and v_p(c_n(f)) − Σ_i r_i·max_jℓ(n^{(i)}_j) → +∞ cofinitely.
- `TauCeti.AnalyticDistributions.blockVectorOrderSpace_one_dim_blocks` (compatibility): For one-dimensional blocks (b = id), blockVectorOrderSpace b r is the vector-order space V_r of anisotropic-tensor-wavelets (vectorOrderSpace).
- `TauCeti.AnalyticDistributions.blockVectorOrderSpace_single_block` (compatibility): For a single block and r < 1, blockVectorOrderSpace b r = isoCr r.
- `TauCeti.AnalyticDistributions.blockVectorOrderSpace_chart_independent` (functoriality): Translations and arbitrary GL_{d_i}(ℤ_p) changes within each block preserve blockVectorOrderSpace b r. Passing to commensurable compatible lattices in the same Lie summands gives the same space with an equivalent norm (README).

*Unit tests.*
- `AnalyticDistributionTests.blockVectorOrder_weight` (computation): For d = (2, 1), r = (1/2, 1/4) and n = (p², 1, p⁵): the block maxima are ℓ = 3 and 6, so the scaling is p^{⌊3/2⌋+⌊6/4⌋} = p².
- `AnalyticDistributionTests.blockVectorOrder_order_zero` (degenerate): For r = 0, blockVectorOrderSpace d 0 = C(∏_iℤ_p^{d_i}, K).
- `AnalyticDistributionTests.blockVectorOrder_one_dim_compat` (compatibility): For d = (1, 1) and r = (1/2, 0) the space contains 1_{pℤ_p}(x_2) and agrees with the realization of C^{1/2} ⊗̂ C⁰.
- `AnalyticDistributionTests.blockVectorOrder_blocks_matter` (non-example): On ℤ_p² let f = Σ_{m≥0} p^m·1_{S(p^m,p^m)}. The series converges uniformly and its only nonzero van der Put coefficients are c_{(p^m,p^m)} = p^m. For a single isotropic block of order 1/2 the adjusted valuations m − (m + 1)/2 tend to +∞; for split blocks of orders (1/2, 1/2) they equal −1. Thus f belongs to the single-block space and not the split-block space.

*Uses.* `Loeffler, Theorem 2.15`: extension of locally constant distributions with growth bounded by (r_1, …, r_g) for general quasi-factorizations; `Loeffler, §3.1, Definition 3.1 and Theorem 3.3`: ray class groups of number fields, whose quasi-factorizations by primes above p have summands of dimension [K_𝔭 : ℚ_p]; `L2/rayclass-growth-adapter` (predecessor packet: From conductor bounds to analytic ray-class distributions): conductor growth bounds on compatible p-adic Lie factors; 2.G.5 `block-rectangular-extension`: its target space.

*Acceptance.* d = (1, …, 1): the parent vector-order space. g = 1: C^{r_1}_iso(G, K).

*Needs:* 2.G.2 `isotropic-wavelet-basis`; 2.F.1 `tensor-function-realization`; 2.F.6 `tensor-chart-pullback`; 2.F.2 `vector-order-mixed-differences`; `L2/anisotropic-tensor-wavelets` (predecessor packet: Tensor wavelets and vector order); `L0/product-analytic-tensor` (predecessor packet: Products and completed analytic tensors).

*Source:* Loeffler v3, §2.3, Definitions 2.11–2.12 and Remark 2.13, printed pp. 4–5; §2.2, Definition 2.5, printed p. 3: Quasi-factorizations allow summands of any dimension, and the vector-order space is meant to be the completed tensor of the factor spaces; the factor spaces are those of Definition 2.5. Definition 2.12 is replaced by the tensor construction (E3).

### 2.G.5 Extension of distributions with growth bounded by a vector of orders

`LocallyAnalyticDistributions:L2/block-rectangular-extension` · Theorem.

Let G, (H_i) and r be as in block-vector-order. A K-linear form μ on LC(G, K) has growth bounded by (r_1, …, r_g) if there is C with v_p(μ(1_{a+(p^{m_1}H_1)×⋯×(p^{m_g}H_g)})) ≥ C − Σ_i r_im_i for all a ∈ G and m ∈ ℕ^g. Such μ extend uniquely to D^{(r)}(G, K); conversely restrictions to LC of elements of D^{(r)}(G, K) have bounded growth. The condition does not depend on the compatible subgroups (the constant does). The sum Σ_i r_i may exceed 1.

*Proof outline.*
1. Reduce to G = ∏_iH_i = ∏_iℤ_p^{d_i} on each coset (tensor-chart-pullback).
2. With M_i = max_jℓ(n^{(i)}_j), S(n) is a disjoint union of cosets of ∏_ip^{M_i}H_i, so v_p(μ(1_{S(n)})) ≥ C − Σ_ir_iM_i and the basis values satisfy v_p ≥ C + Σ_i(⌊r_iM_i⌋ − r_iM_i) > C − g.
3. Extend by the Banach basis of block-vector-order; uniqueness by density of LC; the converse from the cross-norm bound v(1_{a+∏p^{m_i}H_i}) ≥ −Σ_ir_im_i.

*Acceptance.* G = ℤ_p² with its natural quasi-factorization: Kim's case (Loeffler Remark 2.16). One block: isotropic-extension. All blocks one-dimensional: LocallyAnalyticDistributions:L2/rectangular-extension.

*Needs:* 2.G.4 `block-vector-order`; 2.E.1 `box-indicators`; 2.F.6 `tensor-chart-pullback`.

*Source:* Loeffler v3, §2.3, Definition 2.14, Theorem 2.15 and its proof, Remark 2.16, printed p. 5: Defines growth bounded by (r_1, …, r_g) and states the unique extension to the dual of the vector-order space through the completed tensor basis.

## Dependencies

Inside this roadmap: L0 (`L0/locally-analytic-radius`, `L0/amice-mahler-basis`, `L0/product-analytic-tensor`), L1
(`L1/distribution-operations`, `L1/amice-derivative`) and the predecessor's L2 nodes (`L2/c-r-functions`,
`L2/order-r-distributions`, `L2/amice-velu-vishik`, `L2/anisotropic-tensor-wavelets`). On other roadmaps:
PadicMeasuresIwasawaAlgebras `L2/residue-fiber-clopen` (clopen residue fibres), the only cross-roadmap prerequisite
added here. PadicMeasuresIwasawaAlgebras is a lower tier, now TauCetiRoadmap pull request #780. On the libraries:
Mathlib's Mahler basis, `AbstractMeasure`, `LocallyConstant.charFn`, `PadicInt.toZModPow`, `AddChar.sum_mulShift`,
`DirichletCharacter.sum_char_inv_mul_char_eq`, `HasEnoughRootsOfUnity`, the closed graph and open mapping theorems, and
`ZeroAtInftyContinuousMap`. No notion is moved down from a higher tier. Downstream, ModularSymbolsPadicLFunctions L2
uses 2.B.1, 2.C.1, 2.C.5 and 2.D.3 (h-admissibility on ℤ_p^× and interpolation uniqueness), PadicHodgeRegulators L3
uses 2.B.1 (order h on the cyclotomic group), and L3 of this roadmap uses the vector-order spaces of §§2.F–2.G for ray
class groups.

## Acceptance tests for the layer

- Zero moments through finite degree N do not certify the order of an arbitrary analytic distribution:
  d^{N+1}δ_0 has those moments zero and exact order N + 1 (2.C.5).
- δ_a has order 0; dδ_0 has order exactly 1 and is not a measure; dδ_0 restricts to 0 on LC (2.C.1).
- At p = 3, the wavelet e_{4,0,1/2} is 3·1_{4+9ℤ_3} (2.A.2).
- The digit map d(x) = Σa_n(x)p^{⌊2n/3⌋} is C^{1/2}, but d∘d is not (2.A.13): composition needs a Lipschitz chart.
- On ℤ_p^×, for p odd, the charts (1 + p)^x and (1 + p)^{px} give C^{1/2} valuations −1/2 and 0 to 1_{1+p³ℤ_p}: the
  topology does not depend on the chart, the norm does (2.B.1).
- For r ≥ N + 1, the kernel of restriction to LP^{[0,N]} is d^{N+1}D_{r−N−1}, so at critical slope the interpolation
  values do not determine the distribution (2.C.7, 2.D.3).
- N + 2 Dirac masses in one ball modulo p^n can kill every χx^j with conductor dividing p^n and j ≤ N (2.D.3): all
  conductors are needed.
- 1_{pℤ_p}(x_2) has finitely many van der Put coefficients, so it lies in every vector-order space, while Loeffler's
  printed condition excludes it for r = (1/2, 0) (2.F.2, E3, E11).
- The continuous function Σ_{m≥0}p^m1_{S(p^m,p^m)} lies in isotropic order 1/2 on ℤ_p² and fails vector
  order (1/2, 1/2), by its adjusted coefficient valuations (2.G.4).
- A locally constant function on two disjoint balls, such as 1_{pℤ_p}, has derivative zero without being constant
  (2.A.11).

## Source corrections

All eight entries were independently confirmed. Author-PDF page numbers for Colmez are used throughout the targets;
the published locators below refer to the freely readable Numdam version and must be kept distinct. These descriptions
and counterexamples state the findings in our own words.

- **E7** (misprint; Proof of Theorem II.3.2(ii), the display defining b_{i,k}, printed p. 33 of the author PDF (page image checked); same passage in Astérisque 330, printed p. 44 (published page image checked)). The integrand is p^{[rℓ(i)]}((x − i)/p^{ℓ(i)})^k, that is b_{i,k} = ∫ e_{i,k,r} μ. At this point of the proof a and n are not bound. The first equality in the same display is b_{i,k} = ∫e_{i,k,r}μ, and e_{i,k,r} is p^{[ℓ(i)r]}1_{i+p^{ℓ(i)}ℤ_p}((x − i)/p^{ℓ(i)})^k by its definition on p. 21; the bound v_p(b_{i,k}) ≥ v_{D_r,N}(μ) − 1 that follows uses exactly this ball and variable. Recorded in LocallyAnalyticDistributions:L2/wavelet-value-bound.
- **E8** (error; Proposition I.5.6 and its one-line proof, printed p. 20 of the author PDF (page image checked); same passage in Astérisque 330, printed p. 31 (published page image checked)). The statement holds for r = 0 and for r ≥ 1 (the Taylor-composition proof of De Ieso's Proposition 2.12 with F = ℚ_p, after repairing (2.25) as in E14), and for 0 < r < 1 when φ_1 is Lipschitz (v_p(φ_1(x) − φ_1(y)) ≥ v_p(x − y) − c), for example locally analytic or of class C^1. For 0 < r < 1 and φ_1 merely of class C^r it is false. LocallyAnalyticDistributions:L2/cr-composition states the corrected version. Take r = 1/2 and d(x) = Σ_n a_n(x)p^{⌊2n/3⌋} for x = Σ_n a_n(x)p^n with digits 0 ≤ a_n(x) < p. If v_p(y) ≥ h the digits of x and x + y agree below h, so v_p(d(x + y) − d(x)) ≥ ⌊2h/3⌋, and ⌊2h/3⌋ − h/2 → ∞: d is of class C^{1/2} (with d^{(0)} = d), with values in ℤ_p. But d(p^m) = p^{⌊2m/3⌋} and d(d(p^m)) − d(d(0)) = p^{⌊2⌊2m/3⌋/3⌋}, of valuation at most 4m/9, so inf_{x, y∈p^mℤ_p} v_p(d∘d(x + y) − d∘d(x)) − m/2 ≤ −m/18 → −∞ and d∘d is not of class C^{1/2}. The archimedean analogue fails in the same way: Hölder exponents multiply under composition.
- **E9** (error; Proposition 2.12 (composition of functions), printed p. 12, and the first sentence of its proof, printed p. 13 (page images checked)). Restrict the case [r] = 0 to r = 0, or to 0 < r < 1 with h Lipschitz. For [r] ≥ 1 the statement holds after replacing the derivative-only estimate (2.25) by a full C^1 Lipschitz constant (E14). For F = ℚ_p (O_F = ℤ_p) and r = 1/2, the digit map d of LocallyAnalyticDistributions/E8 is of class C^{1/2,id} (its first differences on p^kℤ_p have valuation ≥ ⌊2k/3⌋, so the quantity C_{h,r}(k) of Definition 2.10 tends to 0), and f = d is of class C^{1/2}, but f∘h = d∘d is not.
- **E10** (misprint; Definition 2.10, the display defining ε_{h,[r]}, printed p. 12 (page image checked)). The remainder is h(x + y) − Σ_{i≤[r]} h^{(i)}(x)y^i/i!. Definition 2.10 defines a property of h alone; f is the unrelated function of the preceding paragraph, and Lemma 2.11 and the norm ‖h‖_{C^{r,id}} on the same page use the remainder of h.
- **E11** (error; arXiv:1304.4042v2, Definition 12 and Remark 13, printed p. 6; arXiv:1304.4042v1, Definition 2.12 and Remark 2.13, printed pp. 4–5). As for LocallyAnalyticDistributions/E3: use the completed projective tensor of the one-variable spaces, characterised by mixed van der Put differences (LocallyAnalyticDistributions:L2/vector-order-mixed-differences). In v2 the counterexample of E3 applies verbatim: for r = (1/2, 0), f(x_1, x_2) = 1_{pℤ_p}(x_2) has first-difference quantity 0 at every (m_1, 0), so the condition fails, though f = 1 ⊗ 1_{pℤ_p}. In v1, the cofinite reading fails the same way; under the reading in which every m_i tends to infinity the limit condition holds for f (the quantity is +∞ once m_2 ≥ 1), but the stated valuation includes the tuples (m_1, 0) and equals −∞, so the space is not normed by it. Either reading fails Remark 2.13. E11 records the same known defect as predecessor E3. The published Springer chapter was not read; its accepted manuscript was not publicly accessible in the recorded check.
- **E12** (misprint; Lemma I.5.11 proof, author PDF p. 22 and published p. 33; both page images checked). The second branch ends at i < p^h − p^{h−1}, as the next infimum display already does. Alternatively use b_i = p^{−[hr]}(φ(i) − φ(i⁻)) for all top-level indices ℓ(i) = h. The coefficients were defined only for indices at most p^h − 1. The printed upper range asks for indices beyond that bound; for p = 2, h = 1 it asks for b_2 from a family b_0, b_1. The repaired predecessor formula proves the same bound in amplitude-coefficient-bound.
- **E13** (error; Final sentence of proof of Proposition I.5.19, author PDF p. 25 and published p. 36; both page images checked). Choose C_1(r) = max(0, −inf_{a≥0}F_r(a)), or any larger constant; the theorem statement is unchanged. Since F_r(0) = −r, the printed choice is at most −r. For r > 0, φ = 1 at h = 0 has both valuations zero, so the claimed inequality would give 0 ≥ −C_1(r) > 0. The coefficient estimate instead yields the added term inf F_r, hence the minus sign in the corrected choice.
- **E14** (error; Proof of Proposition 2.12, equation (2.25), arXiv:1203.6766v1, printed p. 13). Use a global Lipschitz constant of f supplied by the full C^1 norm, including the remainder bound. The composition result for r ≥ 1 is unchanged. For F = ℚ_p let q(x) = Σ_{n≥0} a_n(x)p^{2n} for the base-p digits of x. Equal digits below m imply v_p(q(x + y) − q(x)) ≥ 2m when v_p(y) ≥ m, uniformly in x; q is C^1 with derivative zero and takes values in ℤ_p. Put f = h = q and x = 0, y = p^m. The inner remainder is p^{2m}, and the left side of (2.25) is |q(p^{2m}) − q(0)| = |p^{4m}| > 0, while its derivative-only right side is zero, for every m. The full Lipschitz bound repairs the Taylor-composition argument in cr-composition.

## References

- P. Colmez, *Fonctions d'une variable p-adique*, Astérisque 330 (2010); author PDF
  https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf, §§I.1, I.3, I.5, II.1–II.4. Published version:
  https://www.numdam.org/article/AST_2010__330__13_0.pdf, printed pp. 13–59; relevant proof passages checked as listed above.
- D. Loeffler, *P-adic integration on ray class groups and non-ordinary p-adic L-functions*, in Iwasawa 2012
  (Springer, 2014), 357–378; arXiv:1304.4042 v1, v2 and v3, §2.
- M. De Ieso, *Espaces de fonctions de classe C^r sur O_F*, arXiv:1203.6766v1, §§1–2.
- J. Rodrigues Jacinto and C. Williams, *An introduction to p-adic L-functions*, arXiv:2309.15692v2, Appendix B.2.1.
