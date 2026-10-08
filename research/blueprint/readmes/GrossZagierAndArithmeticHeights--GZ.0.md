# Gross–Zagier formulas and arithmetic heights: GZ.0–GZ.7

This part builds the normalizations, pairings and kernels needed to compare a
Rankin central derivative with an arithmetic height. The final Gross–Zagier
identities themselves belong to GZ.8. The plan begins at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

All eight layers are **planned** at target granularity. A planned layer means
each of its targets has a declaration or an exact import, and the prerequisites
end at the libraries, another roadmap, a supplier request or an explicit gap.
It does not mean its mathematics has been implemented or its proofs certified.
No layer is closed: the proof and carrier refinements listed at the end are
required. Every implementation status in the companion packet is unchecked.

The mathematical development has three strands. GZ.0 fixes the common
normalizations. GZ.1–GZ.3 produce the Poincaré pairing, admissible intersection
and rational quaternionic realization. GZ.4–GZ.5 give the toric functional and
the coherent period formula. GZ.6–GZ.7 construct the analytic and geometric
kernels, then compare their local coefficients. The classical modular-curve
calculation and the averaged Colmez calculation supply independent tests of
the factors, support conditions and intersection signs.

## Ownership and baseline

General line-bundle heights, the canonical limit, local heights, positivity
and torsion characterization are `HeightsRationalPointsAndObstructions:RP.0`.
General abelian-variety descent and Mordell–Weil are RP.1. GZ.1 specializes the
Poincaré/full-polarization normalization and coefficient/character pairings;
it does not rebuild that height machine. Mathlib's generated additive
`AddCommGroup.fg_of_descent'` already supplies the height half of descent, once
the finite-index doubling and Northcott hypotheses are available. Its source
head is the multiplicative `CommGroup.fg_of_descent'`.

Local regular/minimal models, vertical components, the fibre intersection
matrix and its kernel, projection formulas, blow-ups, semistable base change
and dual graphs belong to upstream StableReduction Layers 1, 4, 5 and 7. GZ.2
owns the arithmetic admissible measures, metrics and gluing, using that
infrastructure. Generic graph resistance/Laplacian theory is TB.3. The genus
weights and the canonical admissible measure are the arithmetic specialization
here. A non-split fibre needs the requested Galois descent; the split formula
cannot simply be declared invariant.

The Weil representation, quadratic/quaternionic norm instances, local Haar
measure comparison, theta integral, regularized Siegel–Weil identities and
see-saw projection are MetaplecticAutomorphicForms, particularly the actual
MP.6 nodes `quadratic-quaternionic-norm-instances`,
`toric-theta-pairing-interface` and `global-see-saw-and-projection`.
The ordinary theta integral is allowed in the orthogonal/symplectic setting
when the Witt index is zero or **m−r>n+1**. Equality does not suffice.
Split binary data (2,1,1) and boundary ternary data (3,1,1) require their
regularized identities. The GZ coherent specialization consumes those
interfaces with its exact torus and Petersson measures.

Local GL₂/quaternionic transfer, smooth representations, quadratic base-change
epsilon factors, global automorphic/spectral projection and the actual
Picard/Jacobian carriers retain their existing owners. The requests below
specify the needed output and the consuming declarations. An owner stage is
not evidence that the exact output has already been constructed.

## Conventions used throughout

For an elliptic curve at the pin,

\[
 \widehat h(P)=\frac12\lim_n\frac{h_x(2^nP)}{4^n},\qquad
 B_{\rm TC}(P,Q)=\frac12(\widehat h(P+Q)-\widehat h(P)-\widehat h(Q)).
\]

Thus the x-height is \(\widehat h_x=2\widehat h\), the full Poincaré/BSD
polarization is \(B_{\rm full}=2B_{\rm TC}\), and
\(\operatorname{Reg}_{\rm full}=2^r\operatorname{Reg}_{\rm TC}\).
The diagonal is \(B_{\rm TC}(P,P)=\widehat h(P)\), not twice that height.
The upstream EllipticCurves text disagrees with its pinned code at this point;
the packet records an upstream note for its maintainer.

Mathlib already has `NumberField.instAdmissibleAbsValues`. Its coordinate
height is relative: archimedean weights are local degrees and the total
weight is \([K:\mathbb Q]\). Dividing by that total weight gives the absolute
height. Field-extension comparisons require compatible places; they do not
follow merely by reading the coordinate definition.

A trace and an average are different rational points. If an orbit has size h,
its average is h⁻¹ times its trace in the rationalized point group. A quadratic
height, or a pairing of two averages, therefore changes by h⁻². The CM unit
index is u=#μ(K)/2, independently of h. For discriminants −4, −3 and −7 it is
2, 3 and 1 respectively.

The motivic elliptic centre is s=1; the unitary centre is s=1/2. Mathlib's
Γℂ(s)=2(2π)⁻ˢΓ(s), so at a central zero the completed derivative includes
√N/π. The convention without the leading 2 gives √N/(2π). In the general
quadratic base-change setting the Rankin-over-F epsilon sign is η_v(−1)
times the base-change sign. The latter is the sign used in the local toric
distinction condition.

Torus quotient measure has volume 2L(1,η); probability measure divides by
that volume. A product of two periods changes by its square. Quaternionic
Petersson Tamagawa measure has volume 2 and is a separate measure. The full
real elliptic period is c∞ times the least positive real period, with c∞=2
for positive discriminant and c∞=1 for negative discriminant. Count that
component factor once.

At an infinite place use ddᶜ=(i/π)∂∂̄ and **unsquared** hermitian norms
‖1‖=exp(−g). An admissible Green current for a divisor D satisfies
ddᶜg=deg(D)μ−δ_D. The degree factor is essential. The classical complex
local height is −2 times the degree-zero Green evaluation, so its principal
divisor law uses log|f|². At a finite place ord_v(π)=1 and q_v=#κ(v)=p^{f_v};
q_v is a cardinality, while f_v is a degree.

### Classical standing notation

For the classical kernels K=ℚ(√D), D<0 is fundamental, ε=(D/·), h=#Cl(K),
w=#O_K×=2u, and r_A(n) counts integral ideals of norm n in class A, with
r_A(0)=1/w. The weight is 2k, k≥1, N is prime to D, and the Petersson product
is linear in its first argument, with y^{2k} dx dy/y² and no concealed volume
division. Chapter IV formulas from §2 require D odd.

For the Heegner intersection calculation, D is odd, D is a square modulo 4N,
and all primes dividing N split in K. The chosen ideal 𝔫 has
O_K/𝔫≃ℤ/N. A CM point x is an actual cyclic N-isogeny diagram over the Hilbert
class field H; c=(x)−∞ and d=(x)−0. The class A corresponds to σ under the
arithmetic Frobenius convention. The finite-level statements use m≥1,
(m,N)=1, W the completed maximal unramified extension of O_{H_v}, and the
Deligne–Rapoport/Katz–Mazur coarse model. Hom is taken between actual chosen
integral diagrams, not invented as a canonical functor of arbitrary coarse
Artinian points. Marked cusp formulas require N>1; the N=1 ordinary kernel
is treated with its own boundary normalization.

The signed divisor sum σ_A(n) retains the sign of n. At D=−3, N=1, A=1,
σ_A(3)=0 but σ_A(−3)=2. The archimedean resolvent tail uses the latter.
The inert quaternion order requires **pq≡−1 mod D**; q≡−p is insufficient
for the printed α≡β congruence. For D=−7, p=3, N=2, q=23 works, while q=11
does not. The connecting-ideal identity 𝔟R=S𝔟 fixes the β coefficient
𝔟̄/𝔟; reversing that identity conjugates the factor. The norm-ideal fibre
has u²δ(n) sign orbits, not 2u²δ(n).

### Colmez standing notation

F is totally real, E/F is CM quadratic with character η, and 𝔅 is a totally
definite incoherent quaternion algebra with E_𝔸 embedded in it. B(v) is its
nearby coherent algebra. Additive characters and self-dual measures use the
published source conventions. The explicit §7.2 formulas impose more:
|Σ(𝔅)|>1, no common finite ramification of E and 𝔅, a chosen maximal order
Ô_𝔅 containing Ô_E, maximal U=Ô_𝔅×, and all five specified local Schwartz
components. The two auxiliary places split in E and are unramified over ℚ.
Their condition is vanishing at zero under **every** Weil translate.

The original integral 𝔧 lies in 𝔅; the nearby j lies in B(v). N_v is the
residue cardinality, d_v the different of F_v/ℚ_p, and D_v the discriminant
of E_v/F_v. The zero Whittaker index has its own L-ratio and discriminant
normalization. The product of incoherent local Weil indices is −1. At an
auxiliary split place the analytic correction is
−2 log(N_v)/(1+N_v+N_v²) times ψ₂; the geometric correction is
−1/(1+N_v+N_v²) times ψ₂. Both are nonzero.

## Reading the declaration catalogue

Each entry gives the exact mathematical object or result, its hypotheses,
direct dependencies, construction/proof route, API or acceptance tests, and
source passage. The packet uses the same names and statements. All named unit
tests also occur as examples in the suggested file. Where an arithmetic or
analytic carrier cannot yet be expressed at the pin, that file identifies
the omitted geometric hypotheses explicitly; its algebraic signatures do
not replace them with arbitrary propositions.

The source extraction ledger at the end routes 232 required items exactly
once. A planned item may share a declaration with its proof or repeated
announcement. An imported/requested item stays with its owner. An item outside
this part is assigned to GZ.8, rather than silently dropped.

### Exact shared hypotheses

- F is totally real, E/F is CM quadratic with character η; additive characters and self-dual measures follow the source
- For the classical Heegner local statements: D is odd, D≡square mod4N, every p|N splits in K; x is the CM cyclic N-isogeny diagram over the Hilbert class field H, c=(x)−∞, d=(x)−0; σ corresponds to A under the stated Artin convention.
- For §7.2 computations: |Σ(𝔅)|>1; no finite place is ramified in both E and 𝔅; U=Ô𝔅× for a chosen maximal order Ô𝔅⊃ÔE
- K=ℚ(√D), D<0 a fundamental discriminant; ε=(D/·), h=#Cl(K), w=#O_K×=2u; A an ideal class; r_A(n) counts integral ideals of norm n and r_A(0)=1/w.
- N_v is residue cardinality, d_v the different of F_v/ℚ_p, D_v the relative discriminant of E_v/F_v; arithmetic degrees are relative to F
- N≥1 is prime to D; f is a weight-2k newform, k≥1, with a(1)=1 where eigenform normalization is used. Petersson pairing is linear in the first argument, with y^(2k)dxdy/y² and no implicit volume division.
- Off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.
- When quaternionic data occur, 𝔅 is totally definite incoherent with an embedding E𝔸→𝔅; B(v) is its nearby coherent algebra
- m≥1 with gcd(m,N)=1. At a finite place v|p, ord_v(π)=1, q_v=#κ(v); W is the completed maximal unramified extension of O_Hv. Actual chosen integral diagrams, not a canonical Hom functor of arbitrary coarse Artinian points, are used.
- φ has all five §7.2 local components; S² has two E-split, ℚ-unramified places; original 𝔧 belongs to 𝔅, nearby j to B(v)

These apply to the classical or Colmez declarations that use the corresponding data; additional hypotheses are stated in each entry.

### Classical source notation blocks

**C1.** Standing notation of Chapter I: N ≥ 1 an integer (N > 1 is assumed in the proof, §9; N = 1 is treated in [18]); X = X₀(N) over ℚ, J = Jac(X); K = ℚ(√D) imaginary quadratic with discriminant D, (D, N) = 1, and D odd (hence D ≡ 1 mod 4 and squarefree, so (D, 2N) = 1; D = −3 is allowed, D = −4 is excluded); O = O_K; h = #Pic(O); u = #(O^×/{±1}) (u = 1 unless D = −3, then u = 3); ε = (D/·) the quadratic character of K/ℚ; H = K(j(E)) the Hilbert class field; the Heegner hypothesis D ≡ β² (mod 4N) for some β ∈ ℤ (equivalently, every prime p | N splits in K); x a Heegner point of discriminant D on X; c = class of (x) − (∞) in J(H); σ ∈ Gal(H/K) corresponds to the ideal class 𝒜 ∈ Cl_K under the Artin isomorphism; ⟨ , ⟩ the global (Néron–Tate) height pairing over H extended Hermitian to J(H) ⊗ ℂ; ( , ) the Petersson product (5.1).

**C2.** Standing notation (Chap. I §3, restated p. 233): K imaginary quadratic, discriminant D, 𝒪 = 𝒪_K, (D, N) = 1, D odd (hence squarefree, D ≡ 1 mod 4), D ≡ square (mod 4N) (all p | N split in K); H = Hilbert class field, Cl_K ≅ Gal(H/K); u = #𝒪^×/2; t = number of prime factors of D; s = number of prime factors of N; Γ = Γ₀(N) ⊂ PSL₂(ℤ); 𝔥 = upper half-plane; R_N = (ℤ ℤ; Nℤ ℤ); m ≥ 1 with (m, N) = 1; √D = i√|D|.

**C3.** Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν.

**C4.** Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}.

**C5.** Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3).

**C6.** Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1.

**C7.** Standing notation of Chap. V §1 (= Chaps. II–III): as in Chap. IV and moreover every prime p | N splits in K; H = Hilbert class field of K; x ∈ X₀(N)(H) a Heegner point of discriminant D (one of the 2^s·h such points, permuted simply transitively by W × Gal(H/K), W = Atkin–Lehner group); J = J₀(N) = Jac X₀(N); c = class of (x) − (∞), d = class of (x) − (0) in J(H); σ ∈ G = Gal(H/K) corresponds to 𝒜 under the Artin map; <,> = global Néron–Tate height pairing on J(H) (heights over H), extended to J(H)⊗ℂ as a hermitian pairing; 𝕋 = ℚ-subalgebra of End_ℚ(J)⊗ℚ generated by the Hecke operators T_m.


## GZ.0 — Normalization interfaces

Fix every power of two, degree, orbit size, Euler factor and measure before forming a height identity. The tests compare the pinned code with source conventions, and distinguish full periods from identity-component periods.

Coverage: **planned**. RP.0 compatible-place and full Poincaré/field normalization proof interfaces; source Euler/differential comparison refinements.

Atlas planets: x-height canonical height; BSD height pairing; BSD regulator; Canonical height on E(K) ⊗ ℚ.

<a id="x-height-canonical-height"></a>

### The x-height canonical height ĥ_x

**GZ.0/x-height-canonical-height** · definition · `WeierstrassCurve.Affine.Point.xCanonicalHeight`

For an elliptic curve given by a Weierstrass equation W over a field K with admissible absolute values, the x-height canonical height is ĥ_x(P) = lim_{n→∞} h(x(2ⁿP))/4ⁿ, where h is Tau Ceti's naïve height of the x-coordinate (Point.naiveHeight). It equals 2 · Point.canonicalHeight P, where Tau Ceti's canonicalHeight carries the factor 1/2 and is the height attached to the divisor (O) (Silverman's normalisation). ĥ_x is the height attached to 2(O), and it is the normalisation of Cremona–Prickett–Siksek, Müller–Stoll and the LMFDB, in which the BSD regulator is computed.

Hypotheses: W elliptic ([W.toAffine.IsElliptic]); K with Height.AdmissibleAbsValues..

Direct prerequisites: `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight`, `tauceti:WeierstrassCurve.Affine.Point.naiveHeight`, `tauceti:WeierstrassCurve.Affine.Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_nsmul`, `mathlib:Filter.Tendsto`.

Construction/proof: 1. Tau Ceti's Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow: h(2ⁿP)/(2·4ⁿ) tends to canonicalHeight P, so h(2ⁿP)/4ⁿ tends to 2·canonicalHeight P. Hence ĥ_x is a limit, not a junk limUnder value. 2. Consequences: ĥ_x(nP) = n²ĥ_x(P) (Point.canonicalHeight_nsmul), ĥ_x ≥ 0, and ĥ_x(P) = 0 iff P is torsion.

Uses: GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing — Its associated bilinear form is the BSD pairing.; GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator — The BSD regulator is its Gram determinant.; RankZeroOneBSD:BSD.3 — The rank-one BSD formula reads L′(E,1)/Ω = ĥ_x(P)·#Ш·∏c_p/#E(ℚ)²_tors.; GrossZagierAndArithmeticHeights:GZ.1 — The Poincaré-biextension height of GZ.1 is compared with it..

| Declaration | Required API |
|---|---|
| `WeierstrassCurve.Affine.Point.xCanonicalHeight` | Point.xCanonicalHeight P := 2 * P.canonicalHeight. |
| `WeierstrassCurve.Affine.Point.tendsto_naiveHeight_div_four_pow` | Tendsto (fun n ↦ ((2^n) • P).naiveHeight / 4^n) atTop (𝓝 P.xCanonicalHeight). |
| `WeierstrassCurve.Affine.Point.xCanonicalHeight_eq_two_mul` | P.xCanonicalHeight = 2 * P.canonicalHeight (the comparison with Tau Ceti's normalisation). |
| `WeierstrassCurve.Affine.Point.xCanonicalHeight_nsmul` | (n • P).xCanonicalHeight = n^2 * P.xCanonicalHeight. |
| `WeierstrassCurve.Affine.Point.xCanonicalHeight_eq_zero_iff` | P.xCanonicalHeight = 0 ↔ IsOfFinAddOrder P, under Northcott finiteness as for canonicalHeight. |

| Test | Kind | Exact expectation |
|---|---|---|
| `WeierstrassCurve.Affine.Point.xCanonicalHeight_zero` | degenerate | (0 : W.Point).xCanonicalHeight = 0. |
| `WeierstrassCurve.Affine.Point.xCanonicalHeight_ne_canonicalHeight` | non-example | For a point of infinite order, xCanonicalHeight P ≠ canonicalHeight P: the two normalisations differ by the factor 2. |
| `WeierstrassCurve.Affine.Point.xCanonicalHeight_two_nsmul` | value | ((2 : ℕ) • P).xCanonicalHeight = 4 * P.xCanonicalHeight. |
| `WeierstrassCurve.Affine.Point.xCanonicalHeight_eq_neronTatePairing` | comparison | P.xCanonicalHeight = 2 * neronTatePairing W P P: Tau Ceti's pairing on the diagonal is half of ĥ_x. |

Acceptance: For 37.a1 (y² + y = x³ − x) and P = (0, 0): ĥ_x(P) = 0.0511114082… (LMFDB), so canonicalHeight P = 0.0255557041…..

Sources: `muller-stoll-2016`, §3, p. 3 (arXiv v2); `muller-stoll-2016`, Remark 3.1, p. 4 (arXiv v2); `lmfdb-2026`, Knowl ec.canonical_height (accessed 2026-09-28).

<a id="bsd-height-pairing"></a>

### The BSD height pairing

**GZ.0/bsd-height-pairing** · definition · `WeierstrassCurve.Affine.bsdHeightPairing`

The BSD height pairing is ⟨P, Q⟩_BSD = ĥ(P + Q) − ĥ(P) − ĥ(Q) with ĥ = Tau Ceti's canonicalHeight, the polar form of the (O)-normalised height. Equivalently it is the halved polar form of ĥ_x, and ⟨P, Q⟩_BSD = 2 · neronTatePairing W P Q, where Tau Ceti's neronTatePairing is QuadraticMap.associated', the halved polar form of ĥ. On the diagonal ⟨P, P⟩_BSD = ĥ_x(P) = 2ĥ(P). This is the pairing whose Gram determinant is the regulator in the Birch–Swinnerton-Dyer formula.

Hypotheses: W elliptic..

Direct prerequisites: [GZ.0/x-height-canonical-height](#x-height-canonical-height), `tauceti:WeierstrassCurve.Affine.canonicalHeightQuadratic`, `tauceti:WeierstrassCurve.Affine.neronTatePairing`, `tauceti:WeierstrassCurve.Affine.neronTatePairing_apply`, `tauceti:WeierstrassCurve.Affine.neronTatePairing_self`, `mathlib:QuadraticMap.polar`, `mathlib:QuadraticMap.polarBilin`, `mathlib:QuadraticMap.associated`, `RankZeroOneBSD:BSD.5`.

Construction/proof: 1. ⟨,⟩_BSD = QuadraticMap.polar of canonicalHeightQuadratic, which is bilinear because ĥ satisfies the parallelogram law exactly. 2. neronTatePairing_apply gives neronTatePairing W P Q = (ĥ(P + Q) − ĥ(P) − ĥ(Q))/2, so ⟨,⟩_BSD = 2 • neronTatePairing W. 3. On the diagonal: polar(ĥ)(P, P) = ĥ(2P) − 2ĥ(P) = 2ĥ(P) = ĥ_x(P).

Uses: GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator — Its Gram determinant is the BSD regulator.; GrossZagierAndArithmeticHeights:GZ.1 — The pairing induced by the Poincaré biextension and the principal polarisation is compared with it.; RankZeroOneBSD:BSD.3 — The BSD consumers state their regulators against it..

| Declaration | Required API |
|---|---|
| `WeierstrassCurve.Affine.bsdHeightPairing` | bsdHeightPairing W : LinearMap.BilinMap ℤ W.Point ℝ := QuadraticMap.polarBilin (canonicalHeightQuadratic W). |
| `WeierstrassCurve.Affine.bsdHeightPairing_apply` | bsdHeightPairing W P Q = (P + Q).canonicalHeight − P.canonicalHeight − Q.canonicalHeight. |
| `WeierstrassCurve.Affine.bsdHeightPairing_eq_two_smul` | bsdHeightPairing W = 2 • neronTatePairing W. |
| `WeierstrassCurve.Affine.bsdHeightPairing_self` | bsdHeightPairing W P P = P.xCanonicalHeight. |
| `WeierstrassCurve.Affine.bsdHeightPairing_comm` | bsdHeightPairing W P Q = bsdHeightPairing W Q P. |
| `WeierstrassCurve.Affine.bsdHeightPairing_eq_zero_of_isOfFinAddOrder_left` | The pairing kills torsion. |

| Test | Kind | Exact expectation |
|---|---|---|
| `WeierstrassCurve.Affine.bsdHeightPairing_self_zero` | degenerate | bsdHeightPairing W 0 0 = 0. |
| `WeierstrassCurve.Affine.bsdHeightPairing_ne_neronTatePairing` | non-example | For P of infinite order, bsdHeightPairing W P P ≠ neronTatePairing W P P. |
| `WeierstrassCurve.Affine.bsdHeightPairing_two_nsmul` | value | bsdHeightPairing W (2 • P) P = 2 * P.xCanonicalHeight. |
| `WeierstrassCurve.Affine.bsdHeightPairing_self_eq_two_mul` | comparison | bsdHeightPairing W P P = 2 * P.canonicalHeight. |

Acceptance: For 37.a1: ⟨(0,0), (0,0)⟩_BSD = 0.0511114082…, the LMFDB regulator, while neronTatePairing W (0,0) (0,0) = 0.0255557041…..

Sources: `muller-stoll-2016`, §1, p. 1 (arXiv v2); `lmfdb-2026`, Elliptic curve 37.a1, BSD invariants (accessed 2026-09-28); `muller-stoll-2016`, Remark 3.1, p. 4 (arXiv v2).

<a id="bsd-regulator"></a>

### The BSD regulator, and Tau Ceti's regulator

**GZ.0/bsd-regulator** · definition · `WeierstrassCurve.Affine.bsdRegulator`

For W elliptic with E(K)/tors finitely generated of rank r, the BSD regulator is Reg_BSD = |det Gram(⟨,⟩_BSD)| on any ℤ-basis of E(K)/tors, and it equals 2^r · regulator W, where Tau Ceti's regulator is the Gram determinant of the halved pairing neronTatePairing. The Birch–Swinnerton-Dyer quotient is stated with Reg_BSD. Tau Ceti's regulator agrees with it only in rank 0.

Hypotheses: W elliptic; [Module.Finite ℤ (PointModTorsion W)]; r = finrank ℤ (PointModTorsion W)..

Direct prerequisites: [GZ.0/bsd-height-pairing](#bsd-height-pairing), `mathlib:Matrix.det_smul`, `tauceti:WeierstrassCurve.Affine.regulator`, `tauceti:WeierstrassCurve.Affine.regulator_eq_abs_det_neronTateGramMatrix`, `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`, `tauceti:WeierstrassCurve.Affine.neronTateGramMatrix`, `tauceti:WeierstrassCurve.Affine.PointModTorsion`, `mathlib:Module.finrank`.

Construction/proof: 1. ⟨,⟩_BSD = 2 • neronTatePairing (GZ.0/bsd-height-pairing), so on any basis Gram(⟨,⟩_BSD) = 2 • neronTateGramMatrix. 2. Apply Mathlib Matrix.det_smul to the Gram matrix; take absolute values and use regulator_eq_abs_det_neronTateGramMatrix. Basis independence is inherited from the pinned regulator theorem.

Uses: RankZeroOneBSD:BSD.3 — The BSD quotient for rank one uses Reg_BSD.; tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4 — The arithmetic BSD quotient of Layer 7 must use Reg_BSD, not regulator (request below).; GrossZagierAndArithmeticHeights:GZ.8 — Explicit Gross–Zagier specialisations compare ĥ with L′ through this regulator..

| Declaration | Required API |
|---|---|
| `WeierstrassCurve.Affine.bsdRegulator` | bsdRegulator W := \|det (2 • neronTateGramMatrix W (Module.finBasis ℤ (PointModTorsion W)))\|, the Gram determinant of the BSD pairing descended to E(K)/tors. |
| `WeierstrassCurve.Affine.bsdRegulator_eq_two_pow_mul_regulator` | bsdRegulator W = 2 ^ finrank ℤ (PointModTorsion W) * regulator W. |
| `WeierstrassCurve.Affine.bsdRegulator_eq_abs_det` | Any ℤ-basis of PointModTorsion W computes bsdRegulator W. |
| `WeierstrassCurve.Affine.bsdRegulator_of_finrank_eq_zero` | bsdRegulator W = 1 in rank 0. |
| `WeierstrassCurve.Affine.bsdRegulator_of_finrank_eq_one` | In rank 1 with generator P of E(K)/tors, bsdRegulator W = P.xCanonicalHeight. |

| Test | Kind | Exact expectation |
|---|---|---|
| `WeierstrassCurve.Affine.bsdRegulator_rank_zero` | degenerate | In rank 0, bsdRegulator W = regulator W = 1. |
| `WeierstrassCurve.Affine.bsdRegulator_rank_one` | value | In rank 1, bsdRegulator W = 2 * regulator W. |
| `WeierstrassCurve.Affine.bsdRegulator_ne_regulator` | non-example | In positive rank, bsdRegulator W ≠ regulator W: the two differ by 2^r. |
| `WeierstrassCurve.Affine.bsdRegulator_eq_xCanonicalHeight` | comparison | In rank 1, bsdRegulator W equals ĥ_x of a generator, the LMFDB value 0.0511114082… for 37.a1. |

Acceptance: 37.a1 (rank 1): Reg_BSD = 0.0511114082… and Ω = 5.9869172924…, so Ω·Reg_BSD = 0.3059997738… = L′(E, 1), with Ш, c_p and torsion all 1 (LMFDB). Tau Ceti's regulator is 0.0255557041… there, and Ω·regulator = L′(E,1)/2.; Rank 0: Reg_BSD = regulator = 1 (regulator_eq_one_of_finrank_eq_zero)..

Sources: `lmfdb-2026`, Elliptic curve 37.a1, BSD invariants (accessed 2026-09-28); `muller-stoll-2016`, §1, p. 1 (arXiv v2); `muller-stoll-2016`, Remark 3.1, p. 4 (arXiv v2).

<a id="height-convention-dictionary"></a>

### The dictionary of height conventions

**GZ.0/height-convention-dictionary** · comparison · `TauCeti.GrossZagier.heightConventions`

At Tau Ceti f790474, canonicalHeight is one half of the doubling limit of the logarithmic x-height, hence the height for (O). Its neronTatePairing is the halved polarization, with diagonal canonicalHeight. The full polarization used by YZZ has diagonal twice canonicalHeight and its rank-r regulator is 2^r times the Tau Ceti regulator. Mathlib supplies NumberField.instAdmissibleAbsValues: the coordinate logHeight₁ is relative, weighted by local degrees, and its total weight is [K:ℚ]. Dividing by this total weight gives the absolute normalization; heights relative to F are [F:ℚ] times absolute heights. Field-extension comparisons require the explicit compatible-place theorem imported from RP.0.

Direct prerequisites: [GZ.0/x-height-canonical-height](#x-height-canonical-height), [GZ.0/bsd-height-pairing](#bsd-height-pairing), [GZ.0/bsd-regulator](#bsd-regulator), `tauceti:WeierstrassCurve.Affine.Point.naiveHeight`, `mathlib:NumberField.instAdmissibleAbsValues`, `mathlib:NumberField.totalWeight_eq_finrank`, `HeightsRationalPointsAndObstructions:RP.0`.

Construction/proof: 1. Read the pinned canonicalHeight half-limit, neronTatePairing half-polarization and regulator Gram determinant; compare the source full polarization. 2. Use the existing Mathlib NumberField admissible absolute values and totalWeight=[K:ℚ], then request the general RP.0 compatible-extension theorem. 3. Check the real-component period and rank-one regulator convention against the source normalization example.

Acceptance: No consumer infers a factor of 2 from the name 'Néron–Tate': every formula states which of canonicalHeight, xCanonicalHeight, neronTatePairing or bsdHeightPairing it uses.; A BSD consumer that uses Tau Ceti's regulator W directly is off by 2^r; in rank 1 this is a factor of 2 in the 2-part of Ш..

Sources: `muller-stoll-2016`, Remark 3.1, p. 4 (arXiv v2); `muller-stoll-2016`, §3, p. 3 (arXiv v2); `lmfdb-2026`, Elliptic curve 37.a1, BSD invariants (accessed 2026-09-28); `lmfdb-2026`, Knowl ec.canonical_height (accessed 2026-09-28).

<a id="canonical-height-rational"></a>

### The canonical height on E(K) ⊗ ℚ

**GZ.0/canonical-height-rational** · construction · `WeierstrassCurve.Affine.canonicalHeightRat`

The canonical height extends uniquely to a quadratic form ĥ_ℚ on the ℚ-vector space E(K) ⊗_ℤ ℚ with ĥ_ℚ(P ⊗ q) = q²·ĥ(P); torsion goes to zero. The same holds for ĥ_x and the two pairings. Averages of points, such as a normalised average of a Galois orbit, live here.

Hypotheses: W elliptic..

Direct prerequisites: `tauceti:WeierstrassCurve.Affine.canonicalHeightQuadratic`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_nsmul`, `mathlib:QuadraticMap`, `mathlib:TensorProduct`, `mathlib:QuadraticMap.map_smul`, `HeightsRationalPointsAndObstructions:RP.0`.

Construction/proof: 1. ĥ is a ℤ-quadratic map W.Point → ℝ (canonicalHeightQuadratic) and ℝ is a ℚ-vector space; a ℤ-quadratic map into a ℚ-vector space extends uniquely along M → M ⊗ ℚ, because M ⊗ ℚ is the localisation of M at the nonzero integers and ĥ(nP) = n²ĥ(P) forces the value on P ⊗ (1/n). 2. Torsion maps to zero in M ⊗ ℚ, consistently with ĥ vanishing on torsion.

Uses: GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average — Heights of averages of Galois orbits are computed in E(K) ⊗ ℚ.; GrossZagierAndArithmeticHeights:GZ.8 — Gross–Zagier formulas are identities of pairings on A(K)_ℚ ⊗ A∨(K)_ℚ.; HeegnerPointEulerSystems:HE.1 — Normalised Heegner points with denominators u are points of E(K) ⊗ ℚ..

| Declaration | Required API |
|---|---|
| `WeierstrassCurve.Affine.canonicalHeightRat` | canonicalHeightRat W : QuadraticMap ℚ (W.Point ⊗[ℤ] ℚ) ℝ. |
| `WeierstrassCurve.Affine.canonicalHeightRat_tmul` | canonicalHeightRat W (P ⊗ₜ q) = q^2 * P.canonicalHeight. |
| `WeierstrassCurve.Affine.canonicalHeightRat_unique` | It is the unique ℚ-quadratic map agreeing with canonicalHeight on P ⊗ₜ 1. |
| `WeierstrassCurve.Affine.canonicalHeightRat_nonneg` | canonicalHeightRat W x ≥ 0. |

| Test | Kind | Exact expectation |
|---|---|---|
| `WeierstrassCurve.Affine.canonicalHeightRat_inv_nat` | value | canonicalHeightRat W (P ⊗ₜ (1/m : ℚ)) = P.canonicalHeight / m^2. |
| `WeierstrassCurve.Affine.canonicalHeightRat_torsion` | degenerate | For torsion P, canonicalHeightRat W (P ⊗ₜ 1) = 0. |
| `WeierstrassCurve.Affine.canonicalHeightRat_one` | comparison | canonicalHeightRat W (P ⊗ₜ 1) = P.canonicalHeight. |
| `WeierstrassCurve.Affine.canonicalHeightRat_not_linear` | non-example | canonicalHeightRat W (P ⊗ₜ 2) ≠ 2 * P.canonicalHeight for P of infinite order: the extension is quadratic, not linear. |

Acceptance: ĥ_ℚ(P ⊗ (1/m)) = ĥ(P)/m²..

Sources: `cai-shu-tian-2014`, §1, after Theorem 1.1, p. 2 (arXiv v2).

<a id="trace-versus-average"></a>

### Trace versus normalised average of a Galois orbit

**GZ.0/trace-versus-average** · lemma · `WeierstrassCurve.Affine.canonicalHeightRat_average`

Let H/K be a finite Galois extension of degree h and P ∈ E(H). The trace Tr(P) = Σ_{σ ∈ Gal(H/K)} σP lies in E(K), and the normalised average Av(P) = (1/h)·Tr(P) lies in E(K) ⊗ ℚ. Then ĥ_ℚ(Av(P)) = ĥ(Tr P)/h², and the same factor relates any pairing of averages to the pairing of traces. A formula written with averages and one written with traces differ by h² in every height.

Hypotheses: H/K Galois of degree h; the heights over H and over K are compared by the same normalisation..

Direct prerequisites: [GZ.0/canonical-height-rational](#canonical-height-rational), `mathlib:IsGalois`.

Construction/proof: 1. Av(P) = Tr(P) ⊗ (1/h), and GZ.0/canonical-height-rational gives the factor (1/h)².

Acceptance: Cai–Shu–Tian take the trace P_K(f) = Tr_{H_K/K} f(P) ∈ E(K); an average-based statement of the same formula carries h_K² in its constant..

Sources: `cai-shu-tian-2014`, §1, after Theorem 1.1, p. 2 (arXiv v2).

<a id="unitary-and-motivic-centres"></a>

### The motivic centre s = 1 and the unitary centre s = 1/2

**GZ.0/unitary-and-motivic-centres** · lemma · `TauCeti.GrossZagier.deriv_completed_at_one_of_eq_zero`

Let L(E, s) be the motivic L-function of an elliptic curve over ℚ of conductor N (centre s = 1), L(s, π_E) := L(E, s + 1/2) its unitary normalisation (centre s = 1/2), and Λ(E, s) := N^{s/2}·Γ_ℂ(s)·L(E, s) the completed function with Mathlib's Γ_ℂ(s) = 2(2π)^{−s}Γ(s). If L(E, ·) is differentiable at 1 and L(E, 1) = 0, then (d/ds)L(s, π_E) at s = 1/2 equals L′(E, 1), and Λ′(E, 1) = N^{1/2}·π^{−1}·L′(E, 1). With the other common convention Λ = N^{s/2}(2π)^{−s}Γ(s)L, the factor is N^{1/2}(2π)^{−1}.

Hypotheses: L(E, ·) differentiable at 1 with L(E, 1) = 0 (the case of odd analytic rank)..

Direct prerequisites: `mathlib:Complex.Gammaℂ`, `mathlib:Complex.Gammaℂ_def`, `mathlib:Complex.Gamma_one`, `mathlib:deriv_mul`, `mathlib:HasDerivAt.mul`.

Construction/proof: 1. The shift s ↦ s + 1/2 has derivative 1. 2. Product rule (deriv_mul) at a zero of L: (G·L)′(1) = G(1)·L′(1) + G′(1)·L(1) = G(1)·L′(1). 3. G(1) = N^{1/2}·Γ_ℂ(1) = N^{1/2}·2(2π)^{−1}Γ(1) = N^{1/2}/π (Complex.Gammaℂ_def, Complex.Gamma_one).

Acceptance: The factor 2 between Γ_ℂ and (2π)^{−s}Γ(s) is a convention and must be written, not absorbed.; Cai–Shu–Tian write L_v(s, A, M) = L(s − 1/2, π_v) at finite places, and the complete L(s, π_A) includes the archimedean factors..

Sources: `cai-shu-tian-2014`, §1.2, p. 4 (arXiv v2).

<a id="heegner-unit-index"></a>

### The unit index u

**GZ.0/heegner-unit-index** · definition · `TauCeti.GrossZagier.unitIndex`

For an imaginary quadratic field K, u(K) = [O_K^× : ℤ^×] = #μ(K)/2, the number that appears squared in the Gross–Zagier constant. In Mathlib terms, u(K) = NumberField.Units.torsionOrder K / 2. So u(K) = 1 except u(ℚ(√−1)) = 2 and u(ℚ(√−3)) = 3.

Hypotheses: K imaginary quadratic..

Direct prerequisites: `mathlib:NumberField.Units.torsionOrder`.

Construction/proof: 1. O_K^× is finite for K imaginary quadratic, so it equals its torsion μ(K), and ℤ^× = {±1} has index #μ(K)/2.

Uses: GrossZagierAndArithmeticHeights:GZ.8 — The explicit Gross–Zagier constant has u² in the denominator.; HeegnerPointEulerSystems:HE.1 — Heegner points over K are normalised by 1/u..

| Declaration | Required API |
|---|---|
| `TauCeti.GrossZagier.unitIndex` | unitIndex K := NumberField.Units.torsionOrder K / 2 for K imaginary quadratic. |
| `TauCeti.GrossZagier.two_mul_unitIndex` | 2 * unitIndex K = torsionOrder K. |
| `TauCeti.GrossZagier.unitIndex_eq_one_iff` | unitIndex K = 1 ↔ K ≠ ℚ(√−1), ℚ(√−3). |

| Test | Kind | Exact expectation |
|---|---|---|
| `TauCeti.GrossZagier.unitIndex_gaussian` | value | unitIndex ℚ(√−1) = 2. |
| `TauCeti.GrossZagier.unitIndex_eisenstein` | value | unitIndex ℚ(√−3) = 3. |
| `TauCeti.GrossZagier.unitIndex_sqrt_neg_seven` | degenerate | unitIndex ℚ(√−7) = 1. |
| `TauCeti.GrossZagier.unitIndex_ne_torsionOrder` | non-example | For every imaginary quadratic K, unitIndex K≠torsionOrder K; compare Conrad’s inconsistent p.69 and p.119 uses explicitly. |

Acceptance: Conrad's §1 defines u_x as #μ(K) itself, but his §9 uses u_x ∈ {1, 2, 3}; the Gross–Zagier constant needs #μ(K)/2 (GrossZagierAndArithmeticHeights/E1)..

Sources: `cai-shu-tian-2014`, §1, Theorem 1.1, p. 2 (arXiv v2); `conrad-2004`, §1, 'Some conventions', p. 69; corrected in GrossZagierAndArithmeticHeights/E1; `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §3, p. 227; §6, p. 230.

<a id="artin-map-convention"></a>

### The Artin-map convention and the Galois action on Heegner points

**GZ.0/artin-map-convention** · comparison · `TauCeti.GrossZagier.artinConvention`

The Gross–Zagier and Conrad convention sends uniformisers to arithmetic Frobenius elements. The opposite (geometric) convention is its composite with inversion on Gal(H/K). Under the arithmetic convention [a] ∈ Cl_K acts on the Heegner point ([b], n) by ([b][a]⁻¹, n). Every formula indexed by class-group characters χ changes χ to χ⁻¹ when the convention changes; a Gross–Zagier formula pairs χ with χ⁻¹ and is therefore stated together with its convention.

Hypotheses: K imaginary quadratic with Hilbert class field H..

Direct prerequisites: `mathlib:IsGalois`.

Construction/proof: 1. The two reciprocity maps Cl_K → Gal(H/K) differ by inversion, by definition. 2. The action on Heegner points is Conrad's statement, p. 69, which he derives from the analytic description C/b → C/n⁻¹b.

Acceptance: A reciprocity law stated without its convention is not accepted..

Sources: `conrad-2004`, §1, 'Some conventions', p. 69; `conrad-2004`, §1, 'Some conventions', p. 69.

<a id="real-period-components"></a>

### Full real period, identity-component period and c∞

**GZ.0/real-period-components** · comparison · `TauCeti.GrossZagier.realPeriod_eq_card_components_mul`

For E/ℚ with a minimal Weierstrass equation and Néron differential ω, let Ω⁰ be the least positive real period (∫ of |ω| over the identity component E(ℝ)⁰) and c∞ = #π₀(E(ℝ)), which is 2 if Δ > 0 and 1 if Δ < 0. The BSD real period is Ω = c∞·Ω⁰ = ∫_{E(ℝ)}|ω|, and it is what EllipticCurves Layer 7's integral 2∫_{D_W > 0} dx/√D_W computes. A formula stated with Ω⁰ must carry c∞ separately, and a formula stated with Ω must not multiply by c∞ again.

Hypotheses: E/ℚ; minimal model; Δ ≠ 0..

Direct prerequisites: `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.b₂`, `mathlib:Real.sqrt`, `mathlib:MeasureTheory.lintegral`.

Construction/proof: 1. E(ℝ) has two components exactly when the cubic 4x³ + b₂x² + 2b₄x + b₆ has three real roots, i.e. Δ > 0. 2. The integral over E(ℝ) is the sum over its components, which have equal ∫|ω| because translation by a point of the non-identity component preserves |ω|.

Acceptance: 37.a1 has Δ = 37 > 0, so c∞ = 2, and the LMFDB real period 5.9869172924… is the full period Ω = 2Ω⁰..

Sources: `lmfdb-2026`, Knowl ec.q.real_period (accessed 2026-09-28).

<a id="root-number-and-measure-normalisation-corrections"></a>

### Base-change signs and measure comparison

**GZ.0/root-number-and-measure-normalisation-corrections** · comparison · `rootNumber_measure_comparison`

For K/F CM quadratic with character η and ωπχ|A_F×=1, let εBC,v be the root number of L(s,πK,v⊗χv). The Rankin-over-F root number is ηv(−1)εBC,v. Thus the toric distinction sign is εBC,v=χv(−1)ε(Bv). Fix the torus quotient measure of total volume 2L(1,η), its probability normalization by division by that volume, and the quaternionic Petersson Tamagawa measure of volume 2. Products of two probability toric periods are (2L(1,η))⁻² times products computed with the torus quotient measure.

Hypotheses: F is totally real; K/F is CM quadratic; fixed additive characters and self-dual measures; The product torus measure is the specified quotient measure, not an asserted Tamagawa measure.

Direct prerequisites: `AutomorphicLFunctionsAndLocalFactors:AL.3`, `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`.

Construction/proof: 1. Compare the two definitions of local epsilon factors using erratum item 5. 2. Divide each period by the quotient volume; the two period factors account for 4L(1,η)². 3. Keep the independent Petersson volume in every local-to-global pairing.

Acceptance: A place with ηv(−1)=−1 changes the Rankin sign but not the corrected base-change criterion.; Probability and quotient period products differ by exactly 4L(1,η)²..

Sources: `yzz-gross-zagier-erratum`, items 4, 5, 10, 13, 15.

<a id="identity-rescaling"></a>

### Rescaling height and period identities

**GZ.0/identity-rescaling** · theorem · `identity_rescaling`

For a bilinear identity H(P,Q)=C·L·α(f₁,f₂), replacing H by aH, torus measure dt by bdt, invariant local forms by cv( , )v with ∏cv=c, and the global form compatibly, multiplies the corresponding sides by their actual linear factors: heights by a, each toric period by b, their product by b², local αv by bv cv, and a rank-r regulator by a^r for a>0. Rescaling a differential by d multiplies its absolute period by |d| and its Petersson squared norm by |d|². Coefficient embeddings commute with these algebraic rescalings when they preserve the chosen rational structures.

Hypotheses: All measures positive; all nonzero differential/pairing scalars; finitely many nonunit local rescalings; The same periods and pairings are used on both sides; embeddings fixed.

Direct prerequisites: [GZ.0/root-number-and-measure-normalisation-corrections](#root-number-and-measure-normalisation-corrections), `mathlib:Matrix.det_smul`, [GZ.0/bsd-height-pairing](#bsd-height-pairing).

Construction/proof: 1. Use linearity of integration and each pairing. 2. Apply Matrix.det_smul to the Gram matrix, retaining |a|^r if a is not assumed positive. 3. Separate period rescaling from the quadratic height rescaling.

Acceptance: Scaling a torus measure by 3 multiplies a period product by 9.; Scaling a positive pairing by 2 multiplies a rank-two regulator by 4.; The zero-period case still obeys the cross-multiplied identity..

Sources: `cai-shu-tian-2014`, §1, normalizations; §2, local toric integrals.

<a id="classical-rankin-normalization"></a>

### Classical Rankin normalization

**GZ.0/classical-rankin-normalization** · comparison · `gz86_rankin_normalization`

(5.4) For f a Hecke eigenform in the new space of weight 2 on Γ₀(N), normalized by a₁ = 1, and χ a complex character of Cl_K: L(f, χ, s) = Σ_{𝒜 ∈ Cl_K} χ(𝒜) L_𝒜(f, s).

Direct prerequisites: [GZ.6/classical-partial-rankin-series](#classical-partial-rankin-series), `AutomorphicLFunctionsAndLocalFactors:AL.3`, [GZ.0/unitary-and-motivic-centres](#unitary-and-motivic-centres).

Construction/proof: 1. Sum the partial series against χ. 2. Match the theta lift and Rankin local zeta integrals, including the removed level factors; shift the arithmetic centre k to the unitary centre 1/2.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §5, (5.4), p. 229.

<a id="classical-relative-field-heights"></a>

### Relative-field height comparison

**GZ.0/classical-relative-field-heights** · theorem · `gz86_relative_field_heights`

(6.4) ⟨a, b⟩_H = h ⟨a, b⟩_K = 2h ⟨a, b⟩_ℚ, the global heights on J over H, K and ℚ ([H:K] = h, [K:ℚ] = 2); the constants of (6.2), (6.3) differ from those of the announcement [17] because [17] used the height over ℚ.

Direct prerequisites: [GZ.0/height-convention-dictionary](#height-convention-dictionary), `HeightsRationalPointsAndObstructions:RP.0`.

Construction/proof: 1. Apply the compatible-place local-degree comparison to the same canonical height. 2. Sum the local degrees to obtain the field-degree ratio; retain the squared complex norm convention.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §6, (6.4), p. 230.

<a id="classical-cm-action-conventions"></a>

### CM action convention comparison

**GZ.0/classical-cm-action-conventions** · theorem · `gz86_cm_action_conventions`

In the parametrisation of the referenced classical source result 59: (a) complex conjugation acts by (𝒜, 𝔫) ↦ (𝒜̄, 𝔫̄) = (𝒜⁻¹, N𝔫⁻¹); (b) Gal(H/K) ≅ Cl_K acts on 𝒜 and trivially on 𝔫: with σ = σ_𝒜 the Artin image of 𝒜 (arithmetic Frobenius convention), σ_𝒜 : (𝒜₁, 𝔫) ↦ (𝒜₁𝒜⁻¹, 𝔫) (p. 243); (c) for d ‖ N, w_d maps (𝒜, 𝔫) to (𝒜[𝔡]⁻¹, 𝔫𝔡⁻¹𝔡̄), 𝔡 = (d, 𝔫) (i.e. the opposite prime is chosen above every p_i | d); in particular w_N : (𝒜, 𝔫) ↦ (𝒜[𝔫]⁻¹, 𝔫̄) = (𝒜[𝔫̄], 𝔫̄) [corrected; printed 𝒜[𝔡] on p. 235 and (𝒜[𝔫], 𝔫̄) on p. 236, see PAPER-GROSS-ZAGIER-86/E2; p. 243 prints the correct rule]; (d) Gal(H/K) × W (W ≅ (ℤ/2ℤ)^s) acts freely and transitively on the Heegner points of discriminant D.

Direct prerequisites: `HeegnerPointEulerSystems:HE.0`, [GZ.0/trace-versus-average](#trace-versus-average).

Construction/proof: 1. Compute the source Artin action on the ideal-lattice description of CM points. 2. Compare inverse-character and ideal-inverse conventions before taking eigencomponents.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §1, pp. 235–236 (i), (ii); p. 243.

<a id="classical-genus-character-factorization"></a>

### Genus-character factorization

**GZ.0/classical-genus-character-factorization** · theorem · `gz86_genus_character_factorization`

Standing data of Chap. IV (p. 267): K imaginary quadratic of discriminant D, ε = ε_D = (D/·), Cl_K its class group; N ≥ 1 prime to D; f ∈ S_{2k}(Γ₀(N)) with Fourier coefficients a(n); L_𝒜(f,s) as in (0.1). For χ: Cl_K → ℂ^× put L_K(f,χ,s) = Σ_{𝒜∈Cl_K} χ(𝒜)L_𝒜(f,s) (0.3). If f is a Hecke eigenform, L(f,s) = ∏_p (1−α_p p^{−s})^{−1}(1−β_p p^{−s})^{−1} with α_p+β_p = a(p), α_pβ_p = p^{2k−1} (p∤N), 0 (p|N), and χ = χ_{D₁·D₂} is a genus character, then the convolution of L(f,s) with L_K(s,χ) equals L^{(N)}(2s−2k+1, ε)^{−1}·L(f,ε_{D₁},s)·L(f,ε_{D₂},s), where L(f,ε_{D_i},s) = Σ ε_{D_i}(n)a(n)n^{−s}; hence (0.4) L_K(f, χ_{D₁·D₂}, s) = L(f,ε_{D₁},s)·L(f,ε_{D₂},s). (The printed text writes L^{(N)}(2s+2k−1, ε) here; see the source issue.)

Direct prerequisites: `AnalyticNumberTheory:AN.4`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Construction/proof: 1. Import the quadratic genus-character factorization on ideal classes. 2. Apply class-character orthogonality to factor the genus L-series into its two quadratic Dirichlet factors.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, introduction, (0.3)–(0.4), p. 268.

<a id="classical-twist-real-period"></a>

### Quadratic-twist real-period comparison

**GZ.0/classical-twist-real-period** · theorem · `gz86_twist_real_period`

Setting of Chap. V §2: f ∈ S₂(Γ₀(N)) a newform with rational integer coefficients, E/ℚ an elliptic curve with L(E, s) = L(f, s), π: X₀(N) → E a covering over ℚ with π(∞) = 0; K = ℚ(√D) as in §1 (D odd fundamental, every p | N split in K), u_K = #O_K^×/2. With Ω the fundamental real period of ω on E and Ω′ that of ω′ on E′: ‖ω‖²/|D|^{1/2} = [E(ℝ) : E(ℝ)⁰]·Ω·Ω′. The ω′ appearing in this formula is the transported differential ω/√D for the chosen complex branch of √D, not automatically a minimal Néron differential of E^D; changing to the minimal differential contributes its explicit rational scalar.

Direct prerequisites: [GZ.0/classical-relative-field-heights](#classical-relative-field-heights), [GZ.3/classical-modular-period-degree](#classical-modular-period-degree), [GZ.3/manin-constant](#manin-constant), `HeegnerPointEulerSystems:HE.1`.

Construction/proof: 1. Transport the chosen invariant differential across the quadratic-twist complex isomorphism. 2. The invariant and anti-invariant cycles exchange; compare the period of the transported differential ω/√D. A minimal Néron differential may add a separate rational factor.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter V, §2, p. 312.

## GZ.1 — Poincaré and coefficient heights

Use the rigidified Poincaré biextension to form the full polarization, then recover the coefficient-valued pairing by trace duality and restrict it to inverse-character components. The ordinary canonical-height machine and finite generation are imports.

Coverage: **planned**. Primary full YZZ Chapter7 proof acquisition and implementation of the RP.0/A2 height/biextension carriers.

Atlas planets: Poincaré height pairing; Endomorphism-field height.

<a id="neron-tate-height-and-the-poincare-pairing"></a>

### Poincaré height pairing

**GZ.1/neron-tate-height-and-the-poincare-pairing** · construction · `poincareHeight`

For a number field F and an abelian variety A/F with dual A∨, let 𝒫 be the Poincaré bundle rigidified along both zero sections. Define h𝒫(x,y) as its canonical height on A×A∨, normalized relative to F. The biextension laws make h𝒫 bilinear in x and y, zero on torsion, and adjoint under u:A→B: h𝒫_B(ux,y)=h𝒫_A(x,u∨y). For a symmetric ample line bundle L on A and φL(y)=Ty*L⊗L⁻¹, h𝒫(x,φL y)=ĥL(x+y)−ĥL(x)−ĥL(y).

Hypotheses: A is projective, smooth and geometrically connected; dual and rigidified 𝒫 supplied by A2; Canonical heights use the compatible RP.0 relative-to-F normalization.

Direct prerequisites: `HeightsRationalPointsAndObstructions:RP.0`, `AbelianSchemesAndArithmeticModuli:A2`, [GZ.0/height-convention-dictionary](#height-convention-dictionary).

Construction/proof: 1. Import the line-bundle height machine, canonical limit and bounded-error uniqueness from RP.0. 2. Apply the rigidified biextension identities to eliminate the bounded errors in each variable. 3. Pull back 𝒫 under u×1 and 1×u∨; uniqueness proves adjunction. 4. Pull back along 1×φL and use the theorem of the square to obtain the full polarization.

Uses: YZZ Theorem 7.2 — Express a polarized height as a pairing between A and A∨.; GZ.8 general height identity — Pair the χ and χ⁻¹ points without selecting an artificial self-pairing..

| Declaration | Required API |
|---|---|
| `poincareHeight` | The canonical height of the rigidified Poincaré bundle evaluated at (x,y). |
| `poincareHeight_add_left` | h𝒫(x+x′,y)=h𝒫(x,y)+h𝒫(x′,y). |
| `poincareHeight_add_right` | h𝒫(x,y+y′)=h𝒫(x,y)+h𝒫(x,y′). |
| `poincareHeight_hom_adjoint` | h_B(ux,y)=h_A(x,u∨y), including identity and composition. |
| `poincareHeight_polarization` | h𝒫(x,φL y)=ĥL(x+y)−ĥL(x)−ĥL(y). |

| Test | Kind | Exact expectation |
|---|---|---|
| `poincareHeight_zero` | degenerate | h𝒫(0,y)=h𝒫(x,0)=0. |
| `poincareHeight_elliptic_diagonal` | compatibility | For L=(O), h𝒫(P,φL P)=2·Point.canonicalHeight P under the same field normalization. |
| `poincareHeight_integer_adjunction` | characterisation | h𝒫(nx,y)=h𝒫(x,ny)=n h𝒫(x,y) for n∈ℤ. |

Acceptance: Diagonal on a principally polarized elliptic curve is 2ĥ_(O), not ĥ_(O)..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208.

<a id="coefficient-valued-height"></a>

### Endomorphism-field height pairing

**GZ.1/coefficient-valued-height** · construction · `coefficientHeight`

Let A/F be simple of strict GL₂ type with End_F⁰(A)=M a number field, and identify End_F⁰(A∨) with M by duality m↦m∨. For x∈A(F̄)⊗ℚ and y∈A∨(F̄)⊗ℚ define the unique H_M(x,y)∈M⊗ℚℝ satisfying Tr_{M/ℚ}(m·H_M(x,y))=h𝒫(mx,y) for every m∈M. The nondegenerate trace form gives existence and uniqueness. It satisfies H_M(mx,y)=mH_M(x,y)=H_M(x,m∨y), and its trace is h𝒫(x,y).

Hypotheses: The M-action is F-rational; M is finite separable over ℚ; h𝒫 is adjoint for dual endomorphisms.

Direct prerequisites: [GZ.1/neron-tate-height-and-the-poincare-pairing](#neron-tate-height-and-the-poincare-pairing), `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`, `mathlib:TensorProduct`.

Construction/proof: 1. Represent the ℚ-linear functional m↦h𝒫(mx,y) using the trace-dual basis of M. 2. Use adjunction and trace nondegeneracy to prove M-bilinearity and independence of that basis.

Uses: YZZ §1.3 and §7.1 — Retain the End⁰(A)-valued pairing in the height identity.; GZ.8 coefficient embedding comparison — Recover scalar formulas by the specified embedding only after forming H_M..

| Declaration | Required API |
|---|---|
| `coefficientHeight` | The trace-dual coefficient H_M(x,y). |
| `coefficientHeight_trace` | Tr(m H_M(x,y))=h𝒫(mx,y) for every m∈M. |
| `coefficientHeight_smul` | H_M(mx,y)=m H_M(x,y)=H_M(x,m∨y). |
| `coefficientHeight_basis_independent` | Any two trace-dual bases construct the same coefficient. |

| Test | Kind | Exact expectation |
|---|---|---|
| `coefficientHeight_rational` | compatibility | For M=ℚ, H_M equals the scalar Poincaré pairing. |
| `coefficientHeight_zero` | degenerate | The coefficient is zero if either point is torsion. |
| `coefficientHeight_trace_not_coordinate` | non-example | If M is quadratic and H_M=1, its trace is 2, although each real embedding evaluates it to 1. |

Acceptance: No individual coefficient embedding is substituted for the trace characterization..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208.

<a id="character-height-pairing"></a>

### Character-component height pairing

**GZ.1/character-height-pairing** · construction · `characterHeight`

For a finite abelian extension H/K, a coefficient extension L/M and finite-order χ:Gal(H/K)→L×, set Vχ={x∈A(H)⊗M L : σx=χ(σ)x}. Extend H_M L-bilinearly to Vχ×V∨χ⁻¹ with values L⊗ℚℝ. Galois invariance makes distinct inverse-character components orthogonal. The χ-projector is eχ=|G|⁻¹Σσ χ(σ)⁻¹σ; its normalization distinguishes trace and average. On rational points modulo torsion the pairing is nondegenerate on paired components once the imported canonical height is positive definite on a finite-rank group.

Hypotheses: H/K finite abelian, characteristic-zero coefficients; strict GL₂ data of coefficientHeight; Finite generation is imported from RP.1 only for the finite-rank nondegeneracy formulation.

Direct prerequisites: [GZ.1/coefficient-valued-height](#coefficient-valued-height), [GZ.0/trace-versus-average](#trace-versus-average), `HeightsRationalPointsAndObstructions:RP.1`.

Construction/proof: 1. Extend the bilinear map along M→L and apply the finite character idempotents. 2. Use σ-invariance to force χχ′=1 for a nonzero pairing. 3. Apply the RP positivity result to the real finite-rank realization and scalar extension.

Uses: YZZ main formula — The two Heegner points lie in inverse-character components.; GZ.8 ring-class specializations — Control the normalizing class number and coefficient field..

| Declaration | Required API |
|---|---|
| `characterHeight` | The restriction of scalar-extended H_M to Vχ×V∨χ⁻¹. |
| `characterHeight_projector` | H_L(eχx,y)=H_L(x,eχ⁻¹y). |
| `characterHeight_smul` | H_L(ax,by)=ab H_L(x,y). |
| `characterHeight_galois` | H_L(σx,σy)=H_L(x,y). |

| Test | Kind | Exact expectation |
|---|---|---|
| `characterHeight_trivial` | compatibility | For χ=1 the pairing is the H_M pairing on G-invariants after scalar extension. |
| `characterHeight_wrong_character` | non-example | If χχ′≠1, H_L(Vχ,V∨χ′)=0. |
| `characterHeight_average_square` | computation | Replacing both trace inputs by their \|G\|⁻¹ averages divides the pairing by \|G\|². |

Acceptance: A nontrivial χ is paired with χ⁻¹, rather than with χ again..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208; `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §3, p. 228; §6, p. 230; `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter V, §1, p. 308; Chapter I, §6, p. 230.

<a id="elliptic-poincare-comparison"></a>

### Elliptic Poincaré comparison

**GZ.1/elliptic-poincare-comparison** · comparison · `elliptic_poincare_comparison`

For a Weierstrass elliptic curve E/K and its principal polarization P↦[P]−[O], the RP canonical height for (O), relative to K using NumberField.instAdmissibleAbsValues, equals the pinned Point.canonicalHeight. Therefore h𝒫(P,φ_(O) Q)=2·neronTatePairing(P,Q), and the full-polarization regulator is 2^r times the pinned regulator. The equality requires the line-bundle-to-coordinate Weil-height comparison; a change to absolute heights divides both pairings by [K:ℚ].

Hypotheses: K a number field; compatible RP and Mathlib absolute values; E nonsingular.

Direct prerequisites: [GZ.1/neron-tate-height-and-the-poincare-pairing](#neron-tate-height-and-the-poincare-pairing), [GZ.0/bsd-height-pairing](#bsd-height-pairing), [GZ.0/bsd-regulator](#bsd-regulator), `HeightsRationalPointsAndObstructions:RP.0`.

Construction/proof: 1. Compare the (O) Weil height with one half of the coordinate x-height up to a bounded error. 2. Apply uniqueness of quadratic refinements to identify the doubling limits. 3. Take the full polar form, then apply the determinant scaling baseline.

Acceptance: Test a non-torsion diagonal and rank-two basis; rank zero cannot detect the factor..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208; `gross-zagier-1986`, I §4 (4.3), p.228.

## GZ.2 — Admissible arithmetic intersections

Construct degree-weighted archimedean metrics and genus-weighted graph measures, normalize Green kernels, then glue finite and infinite intersections. The Faltings–Hriljac comparison applies to componentwise degree-zero classes. The genus-one existence proof must avoid division by 2g−2.

Coverage: **planned**. Genus-one admissible existence proof without division by 2g−2; non-split Galois graph descent; full Faltings–Hriljac proof-source and carrier realization.

Atlas planets: Arithmetic intersection pairing; Admissible arithmetic extension; Faltings–Hriljac theorem; Arakelov probability form; Arakelov Green function; Admissible graph measure.

<a id="arithmetic-intersection-gluing"></a>

### Global arithmetic intersection on curves

**GZ.2/arithmetic-intersection-gluing** · construction · `arithmeticIntersection`

For a smooth proper geometrically connected curve X/F and a regular model 𝒳/𝒪_L after finite L/F, an arithmetic divisor is (D,(gσ)σ) with ddᶜgσ+δDσ smooth and complex conjugation compatible. Its intersection for generically disjoint D₁,D₂ is the sum of finite intersection lengths times log Nv, plus the archimedean Green evaluation and curvature integral; complex embeddings count twice real ones. Divide by [L:F]. Model pullbacks and finite-extension projection formulas identify the total intersection, and compatible arithmetic classes glue in the directed system of models; horizontal and vertical summands separately depend on the model.

Hypotheses: 𝒳 regular with imported local intersections; finite extension chosen semistable where needed; Green singularities and logarithm conventions fixed; generically disjoint representatives.

Direct prerequisites: `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`, `ArakelovGeometryAndAbelianHeights:R35.1`.

Construction/proof: 1. Import regular models and the finite length pairing from StableReduction. 2. Combine the finite local lengths with conjugation-invariant archimedean Green data. 3. Use local projection formulas and the product formula to descend the normalized total through models and extensions.

Uses: YZZ §7.1.3–7.1.7 — Glue local height contributions over a number field.; GZ.7 local-to-global identity — Keep the finite and archimedean normalizations synchronized..

| Declaration | Required API |
|---|---|
| `arithmeticIntersection` | The normalized finite-plus-infinite intersection on compatible arithmetic divisor classes. |
| `arithmeticIntersection_add` | The pairing is additive in each variable and symmetric. |
| `arithmeticIntersection_projection` | For a finite map f, (f*D,E)=(D,f*E), with proper push-forward multiplicities. |
| `arithmeticIntersection_baseChange` | Unnormalized intersection multiplies by [L′:L]; normalized intersection is unchanged. |

| Test | Kind | Exact expectation |
|---|---|---|
| `arithmeticIntersection_fibre_kernel` | degenerate | An entire fibre has zero finite intersection with a degree-zero divisor. |
| `arithmeticIntersection_principal` | characterisation | A principal arithmetic divisor with Green −log\|f\| has global intersection zero by the product formula. |
| `arithmeticIntersection_complex_weight` | non-example | A complex embedding contributes weight two; counting it once changes the pairing over an imaginary quadratic field. |

Acceptance: The entire fibre is in the vertical intersection kernel; no ordinary matrix inverse is used..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 7, Sec. 7.1.4, printed pp. 211-212; `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §4, (4.2), p. 228.

<a id="admissible-arithmetic-extension"></a>

### Admissible arithmetic extension

**GZ.2/admissible-arithmetic-extension** · construction · `admissibleExtension`

Fix a compatible arithmetic class ξ̂ of degree one on each geometric connected component of X. For D, its ξ̂-admissible extension D̄ is characterized by: D̄−deg(D)ξ̂ has zero curvature and is orthogonal to every finite vertical component; ∫g_D c₁(ξ̂)=0 at each infinite place; and the vertical correction V_D has (V_D·ξ̂)v=0. The singular fibre matrix is solved on the quotient by the total fibre; the last condition fixes that remaining fibre ambiguity. The construction is unique in the compatible model system and extends by rational linearity.

Hypotheses: Semistable regular model after base change; degree taken componentwise; ξ̂ fixed with compatible admissible Green data.

Direct prerequisites: [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing), `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`, [GZ.2/normalized-arakelov-green](#normalized-arakelov-green), [GZ.2/graph-admissible-measure](#graph-admissible-measure).

Construction/proof: 1. Solve the vertical linear equations modulo the fibre kernel using the imported matrix result. 2. Solve the archimedean Green equation and fix its additive constant by the mean-zero condition. 3. Normalize the vertical fibre multiple against ξ̂ and verify uniqueness.

Uses: YZZ §7.1.5 — Define local height symbols of degree-one CM divisors.; GZ.7 Hodge and diagonal terms — Keep their ξ̂-dependence explicit..

| Declaration | Required API |
|---|---|
| `admissibleExtension` | The unique ξ̂-admissible extension of D. |
| `admissibleExtension_characterization` | The three normalization conditions characterize the extension. |
| `admissibleExtension_add` | Extension is rational-linear in divisors. |
| `admissibleExtension_pullback` | Pullback preserves admissibility when ξ̂ and its measure are pulled back compatibly. |
| `admissibleExtension_degreeZero` | For componentwise degree zero the extension is flat. |

| Test | Kind | Exact expectation |
|---|---|---|
| `admissibleExtension_zero` | degenerate | The extension of zero is zero. |
| `admissibleExtension_xi` | characterisation | The fixed normalized representative of ξ extends to ξ̂. |
| `admissibleExtension_disconnected` | non-example | A divisor of total degree zero with nonzero degrees on two components is not flat. |

Acceptance: Positive-degree extensions depend on ξ̂ and do not descend through arbitrary rational equivalence..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 7, Sec. 7.1.5, printed p. 212.

<a id="hodge-index-theorem-and-admissible-arithmetic-extensions"></a>

### Faltings–Hriljac comparison

**GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions** · theorem · `faltingsHriljac`

For componentwise degree-zero divisors D,E on a smooth proper curve X/F, choose disjoint representatives over L and flat admissible extensions on a regular semistable model. Then −[L:F]⁻¹(D̄·Ē)=h𝒫_J([D],φΘ[E]), the full-polarization canonical Jacobian pairing relative to F. It is independent of representatives and model. For disconnected curves the summands are orthogonal. Only degree-zero divisors descend to Pic⁰; the ξ̂-admissible positive-degree pairing is not asserted to factor through Pic.

Hypotheses: X has positive genus on the Jacobian components; canonical principal polarization imported; Flat extensions, compatible local weights and generically disjoint representatives.

Direct prerequisites: [GZ.2/admissible-arithmetic-extension](#admissible-arithmetic-extension), [GZ.1/neron-tate-height-and-the-poincare-pairing](#neron-tate-height-and-the-poincare-pairing), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, `AbelianSchemesAndArithmeticModuli:A2`.

Construction/proof: 1. Identify the intersection height with a Weil height for the Jacobian theta divisor. 2. Apply the canonical-height limit and the Hodge index theorem, with the minus sign. 3. Use projection formulas and the product formula to remove choices.

Acceptance: For an elliptic curve the diagonal is twice the pinned canonicalHeight.; A positive-degree principal-equivalence change is not incorrectly declared invisible..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 7, Thm. 7.4, printed p. 212; `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §4, (4.3), p. 228 (quoted, Lang [24]).

<a id="arakelov-probability-form"></a>

### Arakelov probability form

**GZ.2/arakelov-probability-form** · construction · `arakelovMeasure`

On C let (α,β)=(i/2)∫C α∧β̄ on H⁰(C,ωC), and choose an orthonormal basis α₁,…,αg. Set μAr=(i/(2g))Σj αj∧ᾱj. It is a smooth positive probability form, independent of the orthonormal basis. This is a genus-normalized form: the unscaled Bergman sum has mass g.

Hypotheses: C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

Direct prerequisites: `ArakelovGeometryAndAbelianHeights:R35.1`, `AutomorphicSpectralTheory:AS.4`.

Construction/proof: 1. Import holomorphic one-forms, integration and the positive definite hermitian pairing. 2. A unitary change of basis preserves the sum; integrate each diagonal term to obtain total mass one.

Uses: Yuan Appendix A.1 — Fix the curvature normalization for every admissible metric.; GZ.2 Green normalization — Take the mean-zero condition against a probability measure..

| Declaration | Required API |
|---|---|
| `arakelovMeasure` | The form (i/(2g))Σαj∧ᾱj. |
| `arakelovMeasure_basis_independent` | The measure agrees for any two orthonormal bases. |
| `arakelovMeasure_mass` | ∫C μAr=1. |
| `arakelovMeasure_isometry` | A biholomorphism pulls the target Arakelov form back to the source form. |

| Test | Kind | Exact expectation |
|---|---|---|
| `arakelovMeasure_genus_two` | computation | For g=2 each orthonormal summand contributes 1/2 to the mass. |
| `arakelovMeasure_genus_one` | compatibility | For C=ℂ/Λ with area A, μAr is Euclidean area divided by A. |
| `arakelovMeasure_wrong_mass` | non-example | For g=2 the unscaled Bergman form has mass 2 and is not μAr. |

Acceptance: Do not omit the factor 1/g..

Sources: `yuan-bigness-2026`, 21 August 2024 author manuscript, §A.1, p.102.

<a id="archimedean-admissible-metric"></a>

### Archimedean admissible metric

**GZ.2/archimedean-admissible-metric** · definition · `admissibleMetric`

A smooth hermitian metric on a holomorphic line bundle L/C is admissible when c₁(L,‖·‖)=deg(L)μAr. A smooth metric on L/C² is admissible when its restrictions to {x}×C and C×{x} are admissible for every x∈C. Multiplication of a norm by a positive constant preserves admissibility; degrees need not be one or positive.

Hypotheses: C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

Direct prerequisites: [GZ.2/arakelov-probability-form](#arakelov-probability-form), `ArakelovGeometryAndAbelianHeights:R35.1`.

Construction/proof: 1. Use the imported Chern current of a smooth hermitian metric. 2. Define the two fibrewise restrictions on C² and impose the same degree-weighted equation.

Uses: Yuan Theorem A.1 — Normalize diagonal and dualizing metrics.; GZ.2 positive-degree extensions — Retain the degree factor in the archimedean local condition..

| Declaration | Required API |
|---|---|
| `admissibleMetric` | c₁(L)=deg(L)μAr, and the analogous two-fibre condition on C². |
| `admissibleMetric_tensor` | Tensor products and duals add and negate degrees and Chern forms. |
| `admissibleMetric_rescale` | Multiplication of the norm by a positive constant preserves admissibility. |
| `admissibleMetric_fibre` | Either fibre restriction of an admissible metric on C² is admissible. |

| Test | Kind | Exact expectation |
|---|---|---|
| `admissibleMetric_degree_zero` | degenerate | An admissible metric on a degree-zero bundle is flat. |
| `admissibleMetric_degree_two` | computation | For degree two the curvature mass is 2. |
| `admissibleMetric_wrong_curvature` | non-example | Curvature μAr is inadmissible for a bundle of degree two. |

Acceptance: A degree-zero bundle has zero Chern form..

Sources: `yuan-bigness-2026`, 21 August 2024 author manuscript, §A.1, p.102.

<a id="admissible-green-function"></a>

### Degree-weighted admissible Green function

**GZ.2/admissible-green-function** · definition · `admissibleGreen`

For a Cartier divisor D on C a Green function is a smooth real gD off |D| such that gD+log|f| extends smoothly whenever div(f)=D locally. It is admissible if the metric ‖1‖=exp(−gD) on O(D) is admissible, equivalently ddᶜgD=deg(D)μAr−δD as currents. The printed equation with μAr−δD is valid only for degree one.

Hypotheses: C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

Direct prerequisites: [GZ.2/archimedean-admissible-metric](#archimedean-admissible-metric), `ArakelovGeometryAndAbelianHeights:R35.1`.

Construction/proof: 1. Apply the Poincaré–Lelong formula with the selected unsquared norm. 2. Insert c₁(O(D))=deg(D)μAr; both sides of the current equation then have total mass zero.

Uses: Yuan Appendix A.1 — Pass between divisor Green functions and hermitian line bundles.; GZ.2 arithmetic intersection — Evaluate local archimedean symbols for divisors of arbitrary degree..

| Declaration | Required API |
|---|---|
| `admissibleGreen` | The singularity and degree-weighted current equation characterize admissibility. |
| `admissibleGreen_add` | gD+gE is admissible for D+E. |
| `admissibleGreen_constant` | Adding a real constant preserves admissibility. |
| `admissibleGreen_metric` | exp(−gD) defines the admissible metric on O(D). |

| Test | Kind | Exact expectation |
|---|---|---|
| `admissibleGreen_zero` | degenerate | A constant is an admissible Green function for D=0. |
| `admissibleGreen_degree_two` | computation | The smooth term for D=x+y is 2μAr. |
| `admissibleGreen_missing_degree` | non-example | For D=0 the printed equation ddᶜg=μAr has incompatible total masses 0 and 1. |

Acceptance: Integrate the current equation for D=0 and for a divisor of degree two..

Sources: `yuan-bigness-2026`, 21 August 2024 author manuscript, §A.1, p.102.

<a id="admissible-metric-existence"></a>

### Complex admissible metric existence

**GZ.2/admissible-metric-existence** · theorem · `admissibleMetric_exists_unique`

Every holomorphic line bundle on C, and every holomorphic line bundle on C² with the two-fibre criterion, has a smooth admissible hermitian metric. It is unique up to multiplication of its norm by one positive constant on the connected base. Equivalently two admissible Green metrics differ by an additive constant.

Hypotheses: C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

Direct prerequisites: [GZ.2/archimedean-admissible-metric](#archimedean-admissible-metric), `AutomorphicSpectralTheory:AS.4`, `ArakelovGeometryAndAbelianHeights:R35.1`.

Construction/proof: 1. On C solve the zero-mass curvature difference by the imported elliptic Green operator. 2. For C² use the fibrewise construction and the line-bundle decomposition, including the Jacobian/Poincaré component. 3. The ratio of two solutions is pluriharmonic in each fibre; compactness makes it constant.

Acceptance: Admissibility alone does not select an absolute multiplicative constant..

Sources: `yuan-bigness-2026`, 21 August 2024 author manuscript, §A.1, p.102.

<a id="normalized-arakelov-green"></a>

### Normalized Arakelov Green function

**GZ.2/normalized-arakelov-green** · construction · `arakelovGreen`

There is a unique symmetric smooth Green function gAr on C²∖Δ with singularity −log|local diagonal equation|, ddᶜ_y gAr(x,y)=μAr(y)−δx and ∫C gAr(x,y)μAr(y)=0. It defines a fibrewise admissible metric exp(−gAr) on O(Δ). Symmetry follows from the self-adjoint Green operator; the mean-zero condition removes the constant ambiguity.

Hypotheses: C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

Direct prerequisites: [GZ.2/admissible-green-function](#admissible-green-function), [GZ.2/admissible-metric-existence](#admissible-metric-existence), `AutomorphicSpectralTheory:AS.4`.

Construction/proof: 1. Solve the current equation for each x, subtract its μAr mean. 2. Use elliptic regularity away from Δ and the symmetric Green operator to glue the kernel. 3. Convert the logarithmic singularity to the diagonal line-bundle metric.

Uses: Yuan Appendix A.1 — Define the canonical diagonal and dualizing metrics.; GZ.2 admissible arithmetic extension — Fix the infinite-place Green constant..

| Declaration | Required API |
|---|---|
| `arakelovGreen` | The normalized symmetric Green kernel on C²∖Δ. |
| `arakelovGreen_symm` | gAr(x,y)=gAr(y,x). |
| `arakelovGreen_mean` | ∫gAr(x,y)μAr(y)=0. |
| `arakelovGreen_diagonal_metric` | exp(−gAr) extends to the admissible metric on O(Δ). |

| Test | Kind | Exact expectation |
|---|---|---|
| `arakelovGreen_constant_shift` | non-example | For a nonzero real c, gAr+c fails the mean-zero condition. |
| `arakelovGreen_degree_zero` | compatibility | For D=x−y, gAr(x,·)−gAr(y,·) has smooth curvature zero. |
| `arakelovGreen_local_singularity` | characterisation | gAr+log\|z−w\| is smooth near a diagonal coordinate chart. |

Acceptance: Use the unsquared metric convention in both the Green function and diagonal metric..

Sources: `yuan-bigness-2026`, 21 August 2024 author manuscript, §A.1, p.103.

<a id="arakelov-dualizing-metric"></a>

### Arakelov dualizing metric

**GZ.2/arakelov-dualizing-metric** · construction · `arakelovDualizingMetric`

For each x∈C the residue map (ωC⊗O(x))|x→ℂ is an isometry when O(x) has the normalized Green metric and ℂ has its ordinary absolute value. These conditions determine the smooth Arakelov metric on ωC. Its curvature is (2g−2)μAr; in genus one the metric is flat.

Hypotheses: C is a compact connected Riemann surface of genus g>0; ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2).

Direct prerequisites: [GZ.2/normalized-arakelov-green](#normalized-arakelov-green), `ArakelovGeometryAndAbelianHeights:R35.1`.

Construction/proof: 1. Use adjunction O(Δ)|Δ≃ωC⁻¹ and the smooth diagonal metric. 2. Dualize its diagonal restriction so that the residue trivialization has norm one. 3. Apply the curvature formula for the canonical Bergman measure.

Uses: Yuan Theorem A.1 — Fix dualizing/diagonal compatibility.; GZ.7 arithmetic adjunction — Measure the self-intersection by the tangent/residue line..

| Declaration | Required API |
|---|---|
| `arakelovDualizingMetric` | The residue-normalized smooth metric on ωC. |
| `arakelovDualizingMetric_residue` | All the residue maps are isometries. |
| `arakelovDualizingMetric_curvature` | c₁(ωC)=(2g−2)μAr. |
| `arakelovDualizingMetric_diagonal` | It is the dual of O(Δ)\|Δ with its diagonal metric. |

| Test | Kind | Exact expectation |
|---|---|---|
| `arakelovDualizingMetric_genus_one` | degenerate | For genus one its Chern form is zero. |
| `arakelovDualizingMetric_genus_two` | computation | For genus two its curvature mass is 2. |
| `arakelovDualizingMetric_rescale` | non-example | Multiplying only the dualizing norm by c≠1 destroys the residue isometry. |

Acceptance: Do not replace the ordinary ℂ norm by its square..

Sources: `yuan-bigness-2026`, 21 August 2024 author manuscript, §A.1, p.103.

<a id="graph-admissible-measure"></a>

### Admissible reduction-graph measure

**GZ.2/graph-admissible-measure** · construction · `graphAdmissibleMeasure`

Let Kv=2g_v−2+val(v) be the canonical divisor KΓ on Γ. There is a unique probability measure μ of the edge-uniform and vertex-atomic class such that its normalized symmetric continuous Green kernel satisfies Δ_y gμ(x,y)=δx−μ, ∫Γgμ(x,y)dμ(y)=0, and c+gμ(KΓ,x)+gμ(x,x)=0 for a constant c independent of x. Push μ forward by the skeleton inclusion i to obtain the canonical admissible measure on Cᵃⁿ. The genus weights g_v are indispensable.

Hypotheses: K is complete discretely valued; C/K is smooth projective geometrically integral of genus g>0 with C(K) nonempty and split semistable reduction; Γ is the graph of the minimal regular model, with unit edge lengths; eK=|uniformizer|⁻¹.

Direct prerequisites: `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`, `TropicalAndBerkovichArithmetic:TB.3`, `TropicalAndBerkovichArithmetic:TB.2`.

Construction/proof: 1. Import the reduction graph, skeleton inclusion/retraction, graph Laplacian and resistance Green kernel. 2. Use Zhang’s canonical-divisor condition to select μ among probability measures. 3. Normalize the Green kernel by its μ mean, and push the measure to Cᵃⁿ.

Uses: Yuan Theorem A.1 and Proposition A.5 — Normalize nonarchimedean dualizing and diagonal metrics.; GZ.2 vertical correction — Compare the graph correction with the arithmetic model correction..

| Declaration | Required API |
|---|---|
| `graphAdmissibleMeasure` | The canonical-divisor probability measure μ. |
| `graphAdmissibleMeasure_mass` | μ(Γ)=1. |
| `graphAdmissibleGreen_laplacian` | Δ_y gμ(x,y)=δx−μ and its μ mean is zero. |
| `graphAdmissibleGreen_canonical` | gμ(KΓ,x)+gμ(x,x) is constant. |
| `graphAdmissibleMeasure_pushforward` | i*μ is the admissible measure on the analytic curve. |

| Test | Kind | Exact expectation |
|---|---|---|
| `graphAdmissibleMeasure_good_reduction` | computation | For one vertex of genus g and no edges, μ is that vertex’s Dirac mass and gμ=0. |
| `graphAdmissibleMeasure_tate_cycle` | compatibility | For a split multiplicative genus-one cycle μ is normalized length measure. |
| `graphAdmissibleMeasure_genus_weight` | non-example | For a single genus-two vertex, omitting its genus weight produces mass zero rather than one. |

Acceptance: State the selected graph-Laplacian sign in the supplier request..

Sources: `yuan-bigness-2026`, 21 August 2024 author manuscript, §A.5, pp.115–116.

<a id="explicit-skeleton-measure"></a>

### Explicit admissible skeleton measure

**GZ.2/explicit-skeleton-measure** · theorem · `graphAdmissibleMeasure_resistance_formula`

With the graph data above, let r_e be the effective resistance between the endpoints of e in Γ∖e°, δ_e unit-mass length measure on e and δ_v a Dirac mass. Then i*μ=(1/g)i*(Σv g_vδ_v+Σe (r_e+1)⁻¹δ_e). A bridge has r_e=∞ and contributes zero; a loop has r_e=0. This agrees with the measure characterized by KΓ. The source’s canonical-bundle proof for g>1 does not by itself prove the genus-one case.

Hypotheses: K is complete discretely valued; C/K is smooth projective geometrically integral of genus g>0 with C(K) nonempty and split semistable reduction; Γ is the graph of the minimal regular model, with unit edge lengths; eK=|uniformizer|⁻¹.

Direct prerequisites: [GZ.2/graph-admissible-measure](#graph-admissible-measure), `TropicalAndBerkovichArithmetic:TB.3`, `TropicalAndBerkovichArithmetic:TB.6`.

Construction/proof: 1. Compute the Chern measure of the model dualizing line as i*δKΓ. 2. Use the model-function/Laplacian comparison to get c₁(ωa)=(2g−2)i*μ. 3. For g>1 compare with the admissible Chern measure and Zhang’s resistance formula. 4. Supply a separate genus-one argument using a degree-one line bundle or the good/Tate reduction cases; this proof refinement is recorded as a gap.

Acceptance: A unit single loop has uniform mass one; a bridge contributes none..

Sources: `yuan-bigness-2026`, 21 August 2024 author manuscript, Proposition A.5, pp.117–118.

<a id="real-admissible-descent"></a>

### Admissible metrics at real places

**GZ.2/real-admissible-descent** · construction · `realAdmissibleMetric`

For a smooth projective geometrically integral curve over ℝ of positive genus, its canonical complex Arakelov probability, diagonal and dualizing metrics are invariant under complex conjugation with the line-bundle real structure. They descend to Cᵃⁿ=C(ℂ)/Gal(ℂ/ℝ). The residue and diagonal compatibility of Theorem A.1 remain isometries. For complex places use the complex metrics directly.

Hypotheses: The real line-bundle structure is included; the quotient keeps the conjugation action.

Direct prerequisites: [GZ.2/arakelov-probability-form](#arakelov-probability-form), [GZ.2/normalized-arakelov-green](#normalized-arakelov-green), [GZ.2/arakelov-dualizing-metric](#arakelov-dualizing-metric), `ArakelovGeometryAndAbelianHeights:R35.1`.

Construction/proof: 1. Conjugation preserves the positive hermitian pairing and normalized Green equations. 2. Apply uniqueness to establish invariant metrics. 3. Descend the invariant norms, preserving the canonical residue isomorphisms.

Uses: Yuan Appendix A.6 — Use the canonical metrics at real places.; GZ.2 global gluing — Assemble conjugation-compatible archimedean data..

| Declaration | Required API |
|---|---|
| `realAdmissibleMetric` | The conjugation-descended canonical metric. |
| `realAdmissibleMetric_pullback` | Pullback to C(ℂ) is the complex Arakelov metric. |
| `realAdmissibleMetric_unique` | The real metric is determined by this pullback. |
| `realAdmissibleMetric_residue` | The descended residue/diagonal isomorphisms are isometries. |

| Test | Kind | Exact expectation |
|---|---|---|
| `realAdmissibleMetric_conjugate_points` | characterisation | A point and its conjugate have equal induced norms. |
| `realAdmissibleMetric_real_point` | compatibility | At a real point the residue norm is ordinary absolute value. |
| `realAdmissibleMetric_wrong_involution` | non-example | A metric with unequal conjugate-point norms cannot descend. |

Acceptance: The quotient does not identify real and complex place weights in global arithmetic sums..

Sources: `yuan-bigness-2026`, 21 August 2024 author manuscript, §A.6, p.119.

<a id="colmez-residue-line"></a>

### Residue-normalized adjunction line

**GZ.2/colmez-residue-line** · construction · `residueAdjunctionLine`

Over H, the Hilbert class field of E, let Pbar be the admissible arithmetic CM divisor, e its generic elliptic ramification index, and Mbar=LU,OH⊗O(Pbar/e). Residue gives a canonical generic trivialization M|P≃H; its integral image is a fractional ideal N with induced metric.

Direct prerequisites: [GZ.2/admissible-arithmetic-extension](#admissible-arithmetic-extension), `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`.

Construction/proof: 1. Use the orbifold Hodge bundle identity to identify its tensor with O(P/e) at P with (ω⊗O(P))|P. 2. Use the residue coordinate to trivialize the generic fibre and take the image of the integral lattice with its metric.

Uses: Yuan–Zhang 2018 §9.2, pp. 629–630 — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `residueAdjunctionLine_constructor` | The residue image fractional ideal N of (L_U⊗O(P/e))\|P, with induced metric. |
| `residueAdjunctionLine_residue_coordinate` | The generic residue trivialization is independent of the local coordinate. |
| `residueAdjunctionLine_finite_lattice` | At w, N_w is the image integral lattice in H_w. |
| `residueAdjunctionLine_degree` | The arithmetic degree equals the sum of residue-lattice lengths and negative log norms. |

| Test | Kind | Exact expectation |
|---|---|---|
| `residueAdjunctionLine_coordinate_unit` | characterisation | Replacing local coordinate z by az+O(z²), a≠0, preserves the residue trivialization. |
| `residueAdjunctionLine_ramification_one` | computation | For e=1 the bundle is L_U⊗O(P). |
| `residueAdjunctionLine_unscaled_divisor` | non-example | For e>1, replacing O(P/e) by O(P) gives the wrong orbifold adjunction line. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §9.2, pp. 629–630.

<a id="classical-complex-height-symbol"></a>

### Squared-norm complex height symbol

**GZ.2/classical-complex-height-symbol** · construction · `classicalComplexHeight`

For disjoint degree-zero a,b, −2Σ_i,j n_i m_j g_Ar(x_i,y_j), using the unsquared-norm normalized Arakelov Green function. Its principal-divisor law is log|f|², and it is symmetric and biadditive.

Direct prerequisites: [GZ.2/normalized-arakelov-green](#normalized-arakelov-green), `HeightsRationalPointsAndObstructions:RP.0`.

Construction/proof: 1. Use the normalized unsquared-norm Arakelov kernel and multiply its divisor contraction by −2. 2. The Green principal-divisor identity gives log|f|²; degree zero eliminates the additive constant and gives uniqueness.

Uses: Gross–Zagier 1986 Chapter II, §2, (2.1), pp. 236–237 (recalling Chap. I §4) — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.2 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `classicalComplexHeight` | For disjoint degree-zero a,b, −2Σ_i,j n_i m_j g_Ar(x_i,y_j), using the unsquared-norm normalized Arakelov Green function. |
| `classicalComplexHeight_principal` | For b=div(f), the value is Σ_i n_i log\|f(x_i)\|². |
| `classicalComplexHeight_add` | Additive and symmetric on disjoint degree-zero divisors. |
| `classicalComplexHeight_unique` | Any continuous biadditive symbol with the principal-divisor law equals it. |

| Test | Kind | Exact expectation |
|---|---|---|
| `classicalComplexHeight_zero` | degenerate | Zero divisor has symbol zero. |
| `classicalComplexHeight_scale_function` | compatibility | Replacing f by cf has the same symbol because deg a=0. |
| `classicalComplexHeight_square_factor` | non-example | Using −Σ g_Ar rather than −2Σ g_Ar gives log\|f\| instead of log\|f\|². |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, (2.1), pp. 236–237 (recalling Chap. I §4).

<a id="classical-archimedean-height-sum"></a>

### Archimedean CM height sum

**GZ.2/classical-archimedean-height-sum** · definition · `cmArchimedeanHeightSum`

Under classical notation C3: Assume r_A(m) = 0, so that c and T_m d^σ have disjoint support. Define ⟨c, T_m d^σ⟩_∞ := Σ_{v|∞} ⟨c, T_m d^σ⟩_v, the sum over the h complex places of H of Néron's archimedean local symbols. Since Gal(H/K) ≅ Cl_K permutes these places simply transitively, ⟨c, T_m d^σ⟩_∞ = Σ_{A₁, A₂ ∈ Cl_K, A₁A₂⁻¹ = A} ⟨(τ_{A₁,𝔫}) − (∞), T_m((τ_{A₂,𝔫}) − (0))⟩_ℂ, where τ_{A,𝔫} ∈ 𝔥 are the points of Chap. II §1 (roots of aτ² + bτ + c = 0 of discriminant D with N | a) attached to the class A and the ideal 𝔫.

Direct prerequisites: [GZ.2/classical-complex-height-symbol](#classical-complex-height-symbol), [GZ.0/trace-versus-average](#trace-versus-average), `HeegnerPointEulerSystems:HE.0`.

Construction/proof: 1. Sum over the h complex places of the Hilbert class field. 2. Identify each embedding with the corresponding ideal class under reciprocity; the local symbol already uses |·|².

Uses: Gross–Zagier 1986 Chapter II, §4, first two displays, p. 248 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.2 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `cmArchimedeanHeightSum` | Σ_{v\|∞} of the classical complex local symbols, one squared-norm symbol for each complex place. |
| `cmArchimedeanHeightSum_orbit` | Equals the class-pair sum with A₁A₂⁻¹=A. |
| `cmArchimedeanHeightSum_add` | Biadditive on admissible inputs. |
| `cmArchimedeanHeightSum_class_count` | H has h complex places; no extra factor two is applied to their squared-norm symbols. |

| Test | Kind | Exact expectation |
|---|---|---|
| `cmArchimedeanHeightSum_h_one` | computation | For h=1 the sum is one complex-place symbol. |
| `cmArchimedeanHeightSum_double_weight` | non-example | Counting every embedding and also using \|·\|² doubles the complex-place total. |
| `cmArchimedeanHeightSum_disjoint` | characterisation | r_A(m)=0 is exactly the off-diagonal input condition when N>1. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §4, first two displays, p. 248.

<a id="classical-local-intersection-height"></a>

### Local intersection height comparison

**GZ.2/classical-local-intersection-height** · theorem · `gz86_local_intersection_height`

Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Let 𝒳 be a regular model of the curve X over A_v, a, b relatively prime divisors of degree 0 on X over H_v, and A, B divisors on 𝒳 restricting to a, b on the general fibre. If A has zero intersection with every fibre component of 𝒳, then ⟨a, b⟩_v = −(A · B) log q.

Direct prerequisites: `HeightsRationalPointsAndObstructions:RP.0`, [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing).

Construction/proof: 1. Use the regular-model local intersection/local-height comparison with valuation ord_v and residue size q_v. 2. Separate disjoint and tangent-regularized self terms; the local height is minus the intersection times log q_v.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, introduction, (0.1), p. 252.

<a id="classical-p-height-sum"></a>

### Rational-prime CM height sum

**GZ.2/classical-p-height-sum** · definition · `cmPrimeHeightSum`

Standing notation (Ch. III): N > 1 (GZ's standing assumption; for N = 1 the cusps ∞ and 0 coincide and c, T_m d^σ always share them); K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). For a rational prime p: ⟨c, T_m d^σ⟩_p := Σ_{v | p} ⟨c, T_m d^σ⟩_v, the sum over the places v of H above p, with local symbols as in (0.2) and (8.1).

Direct prerequisites: [GZ.7/classical-tangent-symbol](#classical-tangent-symbol), [GZ.7/classical-finite-intersection-height](#classical-finite-intersection-height), [GZ.7/classical-tangent-product-formula](#classical-tangent-product-formula), [GZ.0/height-convention-dictionary](#height-convention-dictionary).

Construction/proof: 1. Sum the local symbols over places v|p. 2. Use q_v=p^(f_v) and the reciprocal place count supplied by the Artin class; the sum has finite support.

Uses: Gross–Zagier 1986 Chapter III, §9, (9.1), p. 264 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.2 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `cmPrimeHeightSum` | The finite sum of tangent-normalized local CM symbols over v\|p. |
| `cmPrimeHeightSum_log_norm` | Each summand uses log q_v=f_vlog p. |
| `cmPrimeHeightSum_galois` | Reindexing the places by Gal(H/K) does not change the sum. |
| `cmPrimeHeightSum_global` | The total finite contribution is Σ_p cmPrimeHeightSum, with finite support. |

| Test | Kind | Exact expectation |
|---|---|---|
| `cmPrimeHeightSum_inert` | computation | For inert p, each q_v=p² and there are h places of H above p. |
| `cmPrimeHeightSum_ramified` | computation | If [𝔭] has order f, there are h/f places and each log q_v=f log p. |
| `cmPrimeHeightSum_wrong_cardinality` | non-example | p^f is the residue cardinality, not the residue degree f. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §9, (9.1), p. 264.

## GZ.3 — Rational realizations and periods

Normalize Hodge classes on every geometric component and use Hom(J,A)⊗ℚ and its genuine level colimit. Keep the inverse Jacobian polarization in the composition pairing. Manin integrality and p-unitness are asserted for the correct optimal parametrization; isogeny transfer retains the prime-to-degree hypothesis.

Coverage: **planned**. Full YZZ Chapter3 rational realization/volume proof-source; exact Manin divisibility/p-unit proof adapters and integral isogeny/twist differential comparisons.

Atlas planets: Normalized Hodge class; Rational automorphic realization; Strict GL₂ realization; Composition pairing; Manin constant.

<a id="normalised-hodge-class-and-xi-parametrised-realisation"></a>

### Normalized Hodge class

**GZ.3/normalised-hodge-class-and-xi-parametrised-realisation** · construction · `normalizedHodgeClass`

On each geometric component of a finite-level quaternionic Shimura curve X_U, let ℒ_U be the imported rational arithmetic Hodge line, with orbifold canonical generic class in the compact case and the specified logarithmic cusp class in the modular case. Define ξ_U=c₁(ℒ_U)/deg(ℒ_U) on that component. It has degree one, is Galois invariant and rational. For a finite level map p:X_V→X_U, p*ξ_U=deg(p)ξ_V and p*ξ_V=ξ_U, with degrees taken on each mapped component. Thus ξ-normalization is compatible with level maps; on a compact curve no rational cusp is chosen.

Hypotheses: The Hodge degree on each component is positive; coarse stack stabilizer and cusp corrections retained; Finite levels, including the exceptional modular case, are treated individually.

Direct prerequisites: `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`, `ModularCurvesPartII:R14.6`.

Construction/proof: 1. Use the imported Hodge pullback isomorphism and its orbifold/cusp generic-fibre formula. 2. Divide by the component degree and use the finite-map degree formula. 3. Descend the rational class by Galois equivariance.

Uses: YZZ §3.1 — Fix the origin of maps from the curve to A.; GZ.6 CM degree-zero classes — Subtract ξ on the CM point’s component..

| Declaration | Required API |
|---|---|
| `normalizedHodgeClass` | c₁(ℒ_U)/deg(ℒ_U), component by component. |
| `normalizedHodgeClass_degree` | Each geometric component has degree one. |
| `normalizedHodgeClass_pullback` | p*ξ_U=deg(p)ξ_V, with identity and composite level maps. |
| `normalizedHodgeClass_pushforward` | p*ξ_V=ξ_U. |

| Test | Kind | Exact expectation |
|---|---|---|
| `normalizedHodgeClass_degree_one` | computation | A component with Hodge degree d has normalized degree d/d=1. |
| `normalizedHodgeClass_compact` | non-example | Normalization does not require a rational cusp or a chosen rational point. |
| `normalizedHodgeClass_double_cover` | characterisation | For a connected degree-two level cover, pullback is 2ξ_V and push-forward of ξ_V is ξ_U. |

Acceptance: A compact Shimura curve without rational cusp still has a degree-one rational ξ class..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.2.1, printed pp. 2-3.

<a id="rational-xi-realization"></a>

### Rational ξ-normalized realization

**GZ.3/rational-xi-realization** · construction · `rationalXiRealization`

For a simple A/F that is a quotient of some Jacobian J_U, define π_A^U=Hom_F⁰(J_U,A), equivalently rational maps from X_U to A modulo constants whose rational extension to zero-cycles kills ξ_U. Take π_A=colim_U π_A^U under level pullback. The Hecke/right B_f× action and End_F⁰(A) action commute. A genuine integral map is ξ-normalized only when its value on ξ vanishes in A⊗ℚ; rational maps are not asserted to be ordinary morphisms divided by a denominator.

Hypotheses: A is geometrically parametrized by the given Shimura tower; Hom⁰=Hom⊗ℚ; no modularity statement for arbitrary A.

Direct prerequisites: [GZ.3/normalised-hodge-class-and-xi-parametrised-realisation](#normalised-hodge-class-and-xi-parametrised-realisation), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`.

Construction/proof: 1. Use the Abel–Jacobi universal property to identify Hom(J_U,A) with maps modulo constants. 2. Use ξ to choose the rational constant and form the filtered colimit. 3. Check commuting actions by the functoriality of correspondences.

Uses: YZZ §3.2 rational automorphic realization — Realize the automorphic representation attached to a parametrized A.; GZ.8 test vectors — Use rational maps as geometric inputs to the height identity..

| Declaration | Required API |
|---|---|
| `rationalXiRealization` | The colimit of Hom_F(J_U,A)⊗ℚ. |
| `rationalXiRealization_level` | The canonical map from a finite-level Hom⁰ space. |
| `rationalXiRealization_ext` | Two representatives agree iff they agree after pullback to a common finer level. |
| `rationalXiRealization_actions` | The Hecke and endomorphism actions commute. |
| `rationalXiRealization_xi` | The representative rational map sends ξ to zero. |

| Test | Kind | Exact expectation |
|---|---|---|
| `rationalXiRealization_constant` | degenerate | A constant map represents zero. |
| `rationalXiRealization_identity` | characterisation | For A=J_U the Abel–Jacobi map normalized by ξ represents the identity homomorphism. |
| `rationalXiRealization_finer_level` | compatibility | A map and its level pullback have the same colimit class. |

Acceptance: Changing a map by a constant does not change its Hom⁰ realization..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.2.1, printed pp. 2-3.

<a id="strict-gl2-realization"></a>

### Strict GL₂ realization and transfer

**GZ.3/strict-gl2-realization** · theorem · `strictGL2_realization`

For a simple F-abelian quotient A of the quaternionic Shimura tower in characteristic zero, the Hecke isotypic summand gives a number field M=End_F⁰(A) with [M:ℚ]=dim A. The rational realization π_A is irreducible over M, its scalar extension to each fixed coefficient embedding is the specified automorphic quaternionic constituent, and it matches the GL₂ Jacquet–Langlands transfer. The rational endomorphism and Galois-field statements concern this parametrized A and its chosen rational Hecke summand.

Hypotheses: The relevant weight-two cohomological constituent occurs in the Jacobian; simple quotient and rational field of definition fixed; The scalar realization/transfer and multiplicity-one inputs are supplied externally.

Direct prerequisites: [GZ.3/rational-xi-realization](#rational-xi-realization), `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

Construction/proof: 1. Decompose finite-level Jacobians by the rational Hecke algebra. 2. Compare the Hom⁰ multiplicity spaces with weight-two cohomology using the imported realization theorem. 3. Apply transfer and its rational-model comparison, then take the tower colimit.

Acceptance: The theorem contains no assertion that every abelian variety is modular..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.2.1, printed pp. 2-3.

<a id="composition-pairing"></a>

### Volume-normalized composition pairing

**GZ.3/composition-pairing** · construction · `compositionPairing`

For f₁∈Hom⁰(J_U,A) and f₂∈Hom⁰(J_U,A∨), define (f₁,f₂)_U=(f₁∘λ_J⁻¹∘f₂∨)/vol(X_U), as an element of End⁰(A)=M using the canonical principal polarization λ_J. The quotient volume is the fixed YZZ geometric volume, scaling by degree under level covers. The projection formula makes the pairing level independent, M-bilinear with the dual action, and perfect on the paired realizations. In dimension one, using the principal polarization of E, (f,f) is deg(f)/vol(X_U).

Hypotheses: A and A∨ satisfy the parametrized strict GL₂ hypotheses; The composition includes λ_J⁻¹; f₂∨:A→J_U∨ is not silently identified with a map to J_U.

Direct prerequisites: [GZ.3/rational-xi-realization](#rational-xi-realization), [GZ.3/strict-gl2-realization](#strict-gl2-realization), `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A6/degree-formulas-for-polarized-isogenies`.

Construction/proof: 1. Compose the two Hom⁰ maps through the Jacobian principal polarization. 2. Use push-pull=[degree] for a finite level map and divide by its geometric volume. 3. Compare the induced polarization to prove perfectness; specialize the pull-push composition to [deg f] for E.

Uses: YZZ §3.2 and main height formula — Normalize modular degrees and pair the two rational realizations.; GZ.5 Petersson factorization — Fix the rational global invariant form..

| Declaration | Required API |
|---|---|
| `compositionPairing` | The End⁰(A) composition divided by curve volume. |
| `compositionPairing_level` | Pullback of both maps preserves the volume-normalized pairing. |
| `compositionPairing_endomorphism` | The M action on the first map is adjoint to the dual action on the second. |
| `compositionPairing_elliptic` | The polarized elliptic self-composition is deg(f)/vol(X_U). |

| Test | Kind | Exact expectation |
|---|---|---|
| `compositionPairing_zero` | degenerate | The pairing is zero when either map is zero. |
| `compositionPairing_cover` | computation | A degree-d cover multiplies both the unnormalized composition and the volume by d. |
| `compositionPairing_isogeny` | characterisation | Postcomposition by a polarized elliptic isogeny of degree m multiplies the self-composition by m. |

Acceptance: Both composition order and dualization are type-correct before taking the scalar coefficient..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.2.2, printed pp. 3-4.

<a id="petersson-composition-comparison"></a>

### Petersson and modular-degree comparison

**GZ.3/petersson-composition-comparison** · comparison · `petersson_composition_comparison`

Under the fixed complex embedding of M, the composition form on π_A×π_A∨ agrees with the automorphic Petersson invariant form after the stated YZZ volume normalization. Fix local invariant forms whose restricted tensor product is this global form. For f∈S₂(Γ₀(N)) with ω_f=2πif(z)dz and unnormalized Petersson (f,f)=∫|f(z)|²dxdy, i∫ω_f∧overline(ω_f)=8π²(f,f); for φ:X₀(N)→E, φ*ω_E=cφω_f implies i∫φ*ω_E∧overline(φ*ω_E)=|cφ|²8π²(f,f)=deg(φ) i∫_Eω_E∧overline(ω_E).

Hypotheses: Pairings use the same coefficient embedding and differential; modular parametrization is nonconstant; The geometric-to-automorphic invariant-form comparison is a theorem, not equality by arbitrary renormalization.

Direct prerequisites: [GZ.3/composition-pairing](#composition-pairing), [GZ.3/manin-constant](#manin-constant), `AutomorphicFormsOnReductiveGroups:AF.3`.

Construction/proof: 1. Use weight-two Hodge/cohomology duality and the polarizations to compare the invariant forms. 2. Fix the tensor factorization with unramified unit normalizations. 3. Compute ω_f∧overline(ω_f) and apply finite-map integration to obtain the modular-degree formula.

Acceptance: An isogeny changing both degree and differential respects the equality..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.2.2, printed pp. 3-4; `gross-zagier-1986`, I §6, p.230.

<a id="manin-constant"></a>

### Manin constant

**GZ.3/manin-constant** · definition · `maninConstant`

For a normalized rational newform f of weight two and conductor N, a nonconstant parametrization φ:X₀(N)_ℚ→E and a chosen minimal Néron differential ω_E, define cφ∈ℚ× by φ*ω_E=cφ·ω_f with ω_f=f(q)dq/q=2πif(z)dz. Its sign changes with ω_E, but its p-adic valuation does not. For an isogeny ψ:E→E′ with ψ*ω_E′=aψω_E, c_{ψ∘φ}=aψcφ. Multiplication by n changes c by n and degree by n².

Hypotheses: f has a₁=1 and matches E; φ pulls back nontrivially; invariant differential is the minimal one.

Direct prerequisites: `ModularCurvesPartII:R14.6`, [GZ.3/rational-xi-realization](#rational-xi-realization), `NeronModelsAndSemistableAbelianVarieties:R11.1`.

Construction/proof: 1. Use multiplicity one to identify the pullback differential line. 2. Take the coefficient against ω_f and retain its nonzero rational value. 3. Compose differential pullbacks to prove the isogeny law.

Uses: JSW Remark 7.3.3 and BSD.6/6a — Compare the Néron period with the modular-form period at p.; BSD.7a and ModularIwasawaMainConjectures:L3 — Retain the differential factor in canonical-period comparisons..

| Declaration | Required API |
|---|---|
| `maninConstant` | The nonzero rational coefficient of ω_f in φ*ω_E. |
| `maninConstant_pullback` | φ*ω_E=cφω_f. |
| `maninConstant_isogeny` | c_{ψ∘φ}=aψ cφ, including identity/composition of isogenies. |
| `maninConstant_sign` | Changing ω_E to −ω_E changes cφ to −cφ. |

| Test | Kind | Exact expectation |
|---|---|---|
| `maninConstant_multiplication` | computation | For [n]∘φ, c becomes n cφ and the degree becomes n²deg φ. |
| `maninConstant_sign_valuation` | compatibility | The p-adic valuation is invariant under ω_E↦−ω_E. |
| `maninConstant_11a3` | non-example | For the minimal X₀(11)→11a3 isogeny, cφ=deg φ=5 after a sign choice, so nonoptimal constants are not universally 1. |

Acceptance: The definition does not assume that cφ=1..

Sources: `cesnavicius-neururer-saha-2022`, Introduction, p.2; `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter V, §2, p. 310.

<a id="manin-integrality-and-p-unit"></a>

### Integral Manin constant and p-unit range

**GZ.3/manin-integrality-and-p-unit** · theorem · `maninConstant_integral_p_unit`

For any modular parametrization φ:X₀(N)_ℚ→E the Manin constant cφ is an integer up to sign. If φ is X₀(N)-optimal and p>2 is a semistable prime for E, then p∤cφ. In particular p∤2N suffices, hence p∤2ND supplies the p-unit statement used by JSW for E and, on choosing its own optimal parametrization, E^D. The sharper semistable statement including p=2 is available by Česnavičius; it does not make a nonoptimal parametrization p-optimal automatically.

Hypotheses: Optimal means the Jacobian quotient has connected kernel, equivalently minimal parametrization within the relevant isogeny class; The JSW consumer also needs its stated residual/isogeny hypotheses for transfer to its chosen E.

Direct prerequisites: [GZ.3/manin-constant](#manin-constant), `ModularCurvesPartII:R14.6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

Construction/proof: 1. Prove integrality by reduction to Γ₁(N) and q-expansion lattices (CNS Lemma 6.5). 2. Apply Mazur’s exactness theorem for Néron differentials at an odd semistable prime, with Raynaud’s finite-flat uniqueness. 3. Use the exact local differential-transfer theorem for the actual parametrization; do not drop its denominator factor.

Acceptance: At p∤2ND both optimal constants are p-units.; The 11a3 nonoptimal parametrization with c=5 prevents a universal isogeny-class p-unit claim..

Sources: `cesnavicius-neururer-saha-2022`, Introduction p.2; Lemma6.5; `jetchev-2008`, §1, p.812.

<a id="manin-isogeny-twist-transfer"></a>

### Manin isogeny and twist transfer

**GZ.3/manin-isogeny-twist-transfer** · theorem · `maninConstant_isogeny_twist_transfer`

For optimal φ₀:X₀(N)→E₀ and ψ:E₀→E, write ψ*ω_E=aψω_E₀. Then v_p(c_{ψφ₀})=v_p(aψ)+v_p(cφ₀); the dual isogeny gives aψ aψ∨=deg ψ up to the fixed differential signs. If p∤deg ψ, both valuations of aψ are zero and p-unitness transfers. For a squarefree quadratic twist D and p∤2ND, choose local minimal differentials and the twist isomorphism over ℚ_p(√D); its differential factor is a p-unit, and the optimal twist’s Manin constant is a p-unit. A chosen nonoptimal twist parametrization still requires the same p-prime-to-isogeny condition.

Hypotheses: Differentials are minimal at p; twist isomorphism and optimal parametrizations are specified; Isogeny degree is prime to p whenever p-unit transfer is asserted.

Direct prerequisites: [GZ.3/manin-integrality-and-p-unit](#manin-integrality-and-p-unit), [GZ.3/manin-constant](#manin-constant), `NeronModelsAndSemistableAbelianVarieties:R11.1`.

Construction/proof: 1. Compose the pullback differential equations. 2. Use ψ∨ψ=[deg ψ] on differential lattices to control the two integral factors. 3. At p∤2D the quadratic twist is unramified and its minimal differential scaling is a local unit; apply the optimal p-unit theorem to the twist.

Acceptance: A degree-p isogeny is not allowed to transfer p-unitness without computing its differential factor..

Sources: `cesnavicius-neururer-saha-2022`, Introduction pp.2–3.

<a id="manin-degree-divisibility"></a>

### Manin constant and modular degree

**GZ.3/manin-degree-divisibility** · theorem · `maninConstant_dvd_modularDegree`

For Γ₁(N)⊆Γ⊆Γ₀(N) and any surjection φ:X_Γ,ℚ→E, cφ divides 6deg φ; if 8∤N and 27∤N, cφ divides deg φ. More precisely v_p(cφ)≤v_p(deg φ)+δp, where δ₂=1 only if v₂(N)≥3 and no prime p′|N has p′≡3 mod4, δ₃=1 only if v₃(N)≥3 and no p′|N has p′≡2 mod3, and δp=0 otherwise. For Γ=Γ₁(N) the stronger cφ|deg φ always holds.

Hypotheses: Néron differential and normalized newform fixed; all constants taken up to sign.

Direct prerequisites: [GZ.3/manin-constant](#manin-constant), `ModularCurvesPartII:R14.6`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Construction/proof: 1. Use CNS integral dualizing differential theorem and the local Whittaker denominator bounds. 2. Combine with the finite-map trace on differential lattices to bound cφ by the modular degree. 3. Track the exceptional 2/3 denominators exactly as Theorem1.2.

Acceptance: For X₀(11)→11a3, c=deg=5 satisfies the bound while c=1 would be false..

Sources: `cesnavicius-neururer-saha-2022`, Theorems1.1–1.2, p.3.

<a id="classical-eigendifferential-period"></a>

### Eigendifferential period comparison

**GZ.3/classical-eigendifferential-period** · theorem · `gz86_eigendifferential_period`

For ω_f = 2πi f(z) dz the eigendifferential of f on X(ℂ): ‖ω_f‖² = ∬_{X(ℂ)} ω_f ∧ i \bar{ω_f} = 8π²(f, f).

Direct prerequisites: [GZ.3/petersson-composition-comparison](#petersson-composition-comparison), [GZ.3/manin-constant](#manin-constant).

Construction/proof: 1. Pull the Néron differential back along the modular parametrization. 2. Compare the integral over the curve with degree(π) times the elliptic integral; the pullback factor contributes c_π².

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §6, p. 230.

<a id="classical-modular-period-degree"></a>

### Modular period-degree comparison

**GZ.3/classical-modular-period-degree** · theorem · `gz86_modular_period_degree`

Setting of Chap. V §2: f ∈ S₂(Γ₀(N)) a newform with rational integer coefficients, E/ℚ an elliptic curve with L(E, s) = L(f, s), π: X₀(N) → E a covering over ℚ with π(∞) = 0; K = ℚ(√D) as in §1 (D odd fundamental, every p | N split in K), u_K = #O_K^×/2. With ‖ω‖² := ∬_{E(ℂ)} |ω ∧ ω̄| and ‖ω_f‖² = ∬_{X₀(N)(ℂ)} |ω_f ∧ ω̄_f| = 8π²(f, f): ‖ω‖² = c²‖ω_f‖²/deg(π).

Direct prerequisites: [GZ.3/classical-eigendifferential-period](#classical-eigendifferential-period), [GZ.3/manin-constant](#manin-constant), `ModularCurvesPartII:R14.2`.

Construction/proof: 1. Integrate the squared pullback differential over X₀(N). 2. The analytic degree formula and ω∧ω̄ expression give the source real-period/Petersson constant with c_π².

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter V, §2, p. 310.

## GZ.4 — Local toric distinction and vectors

Use continuous/smooth equivariant Hom in the correct local category, the base-change epsilon convention, absolutely convergent normalized matrix-coefficient integrals, and the conductor-oriented admissible order. The bilinear form exists even when the ratio by an invariant pairing does not.

Coverage: **planned**. Every local test-vector conductor case and real/complex Hom topology must be realized by the named GL₂/epsilon suppliers.

Atlas planets: Toric functional space; Saito–Tunnell dichotomy; Normalized toric form; Toric test vectors.

<a id="toric-hom-space"></a>

### Local toric functional space

**GZ.4/toric-hom-space** · definition · `toricHom`

For a local field Fv of characteristic zero, a quadratic étale algebra Kv embedded in Bv, an irreducible admissible representation πv of Bv× (generic if split), and χv with χv|Fv×·ωπv=1, define P(πv,χv)=Hom_Kv×(πv,χv⁻¹). Its elements are continuous linear functionals ℓ with ℓ(πv(t)f)=χv(t)⁻¹ℓ(f). At real places use the smooth Casselman–Wallach representation and continuous Hom; at nonarchimedean places use the smooth category.

Hypotheses: Quadratic étale includes Fv×Fv; coefficient field and continuity category fixed.

Direct prerequisites: `SmoothRepresentationsOfLocalGroups:SR.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.1`.

Construction/proof: 1. Restrict the existing representation to the embedded torus. 2. Form the equivariant Hom space using the matching-centre condition.

Uses: Saito–Tunnell theorem — State distinction as dimension one versus zero.; GZ.5 and GZ.8 zero cases — Explain vanishing when a local toric Hom is zero..

| Declaration | Required API |
|---|---|
| `toricHom` | The torus-equivariant continuous Hom space. |
| `toricHom_equivariance` | ℓ(π(t)f)=χ(t)⁻¹ℓ(f). |
| `toricHom_transport` | An intertwining isomorphism induces an isomorphism of toric Hom spaces. |
| `toricHom_center` | If the centre does not match, every toric functional is zero. |

| Test | Kind | Exact expectation |
|---|---|---|
| `toricHom_wrong_center` | non-example | If χ(z)ωπ(z)≠1 for some central z, the Hom space is zero. |
| `toricHom_zero_vector` | degenerate | Every functional evaluates the zero vector to zero. |
| `toricHom_character_inverse` | characterisation | A vector with torus character χ⁻¹ can pair with the functional; one with a different torus character is killed. |

Acceptance: The central-character condition is necessary for a nonzero functional..

Sources: `cai-shu-tian-2014`, §3.1, p.21.

<a id="saito-tunnell-dichotomy-and-the-local-toric-functional"></a>

### Saito–Tunnell dichotomy

**GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional** · theorem · `saitoTunnell`

For the data of toricHom, dim P(πv,χv)≤1 and equals one precisely when εBC(1/2,πv,Kv⊗χv)=χv(−1)ε(Bv). For a nonsplit quadratic field and a discrete-series GL₂ representation, exactly one of the split algebra and its division inner form is distinguished. For split Kv the distinguished algebra is split. Include the real discrete-series/compact-quaternion alternative using the actual torus weights; nonarchimedean characteristic-zero local fields include dyadic and wildly ramified cases.

Hypotheses: πv generic in the split case; division case is compared with its discrete-series transfer; Use base-change epsilon convention, or translate the Rankin convention by ηv(−1).

Direct prerequisites: [GZ.4/toric-hom-space](#toric-hom-space), [GZ.0/root-number-and-measure-normalisation-corrections](#root-number-and-measure-normalisation-corrections), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Construction/proof: 1. Import the genuine local correspondence and epsilon factors. 2. Prove multiplicity one and the epsilon criterion by the Tunnell/Saito local character argument. 3. Treat split tori and real discrete-series weights separately; translate CST’s Rankin sign using GZ.0.

Acceptance: A wrong local Hasse invariant forces zero Hom, including at a dyadic place..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Thm. 1.3, printed p. 10; `cai-shu-tian-2014`, §3.1, theorem preceding Lemma3.1.

<a id="normalized-toric-integral"></a>

### Normalized local toric form

**GZ.4/normalized-toric-integral** · construction · `normalizedToricForm`

For an essentially unitary local pair (πv,χv) with fixed invariant pairing b_v, define αv(f₁,f₂)=L(1,ηv)L(1,πv,ad)/(ζv(2)L(1/2,πv,Kv⊗χv))·∫_{Kv×/Fv×} b_v(πv(t)f₁,f₂)χv(t)dtv. Use the matching nonzero local factors and the quotient measure of GZ.0. The integral is absolutely convergent for these local data and generates P(πv,χv)⊗P(π̃v,χv⁻¹) when distinguished; it is zero otherwise. Define βv=αv/b_v only for pairs with b_v≠0; αv itself is defined for all pairs.

Hypotheses: Invariant pairing and quotient Haar measure fixed; essentially unitary; generic in split case; Algebraic rationality is asserted only at finite places with the supplied rational structures.

Direct prerequisites: [GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional](#saito-tunnell-dichotomy-and-the-local-toric-functional), `AutomorphicLFunctionsAndLocalFactors:AL.3`, [GZ.0/identity-rescaling](#identity-rescaling).

Construction/proof: 1. Apply the local matrix-coefficient decay/convergence theorem. 2. Use equivariance of Haar integration and multiplicity one to identify the generated tensor functional. 3. Evaluate spherical data and compare rational structures at nonarchimedean places.

Uses: YZZ Theorems1.2 and1.4 — The local factors form the global invariant bilinear tensor.; CST Theorems1.6 and1.9 — Compare finitely altered test vectors..

| Declaration | Required API |
|---|---|
| `normalizedToricForm` | The L-normalized torus integral αv on πv×π̃v. |
| `normalizedToricForm_bilinear` | αv is bilinear in its two vectors. |
| `normalizedToricForm_rescale` | Scaling dtv by b and b_v by c scales αv by bc. |
| `normalizedToricForm_twist` | Replacing (π,χ) by (π⊗μ,χ⊗μ_K⁻¹) preserves the form with compatible pairings. |
| `normalizedToricForm_zeroHom` | αv=0 if the toric Hom space is zero. |

| Test | Kind | Exact expectation |
|---|---|---|
| `normalizedToricForm_spherical` | computation | For unramified π,χ,K/F and unit-volume compact quotient, αv(f₁,f₂)=b_v(f₁,f₂) on spherical vectors. |
| `normalizedToricForm_zero` | degenerate | αv(0,f₂)=0 even when βv would be undefined. |
| `normalizedToricForm_measure_two` | non-example | Doubling dtv doubles αv; it does not halve it. |

Acceptance: No denominator b_v is used in the bilinear αv formula..

Sources: `cai-shu-tian-2014`, §3.1, pp.21–22.

<a id="unramified-toric-value"></a>

### Unramified toric value and finite product

**GZ.4/unramified-toric-value** · theorem · `normalizedToricForm_unramified`

For spherical unramified πv and χv on a split Bv, an unramified quadratic field Kv/Fv and dtv with compact quotient volume one, βv(f₁,v,f₂,v)=1. Thus α=⊗vαv is defined on restricted pure tensors with standard vectors and local invariant forms at almost all v; only finitely many normalized factors differ from one. Split unramified tori are evaluated separately with the multiplicative Haar normalization, including both GL₂ Whittaker directions.

Hypotheses: The local invariant vector pairing is nonzero when β is used; All unramified normalizations are compatible with the global factorization.

Direct prerequisites: [GZ.4/normalized-toric-integral](#normalized-toric-integral), `GL2AutomorphicRepresentationsAndTransfer:R16.2/spherical-whittaker-values`.

Construction/proof: 1. Evaluate the toric matrix coefficient using the spherical Whittaker/Satake expansion. 2. Cancel the local L-factors and quotient volume. 3. Use the restricted tensor product and bilinearity to define the global form, including zero pairs.

Acceptance: An unramified newvector with ramified χ is not covered by this theorem..

Sources: `cai-shu-tian-2014`, §3.1, spherical-value paragraph.

<a id="admissible-toric-order"></a>

### Admissible toric order

**GZ.4/admissible-toric-order** · definition · `admissibleToricOrder`

Let n be the conductor of πv^JL, c the conductor of χv, and c₁=0 when Kv is nonsplit and c<n, c₁=c otherwise. An admissible order Rv⊂Bv has discriminant p^n and Rv∩Kv=𝒪_{c₁}. When 0<c₁ and n>0 in the split algebra, require Rv=R′∩R″ with R′∩Kv=𝒪_c and R″∩Kv=𝒪_{max(c−n,0)}. If Kv is split and 0<c<n, there are two Kv×-conjugacy choices; choose the one whose χ_i(a)=χ(a,1) or χ_i(a)=χ(1,a) has conductor c. This is CST’s order, not every order with the same discriminant.

Hypotheses: The Saito–Tunnell matching condition; local characteristic zero; At conductor mismatch where c₁<n, the nonsplit field part uses the torus-character eigenspace rather than claiming all R× invariants work.

Direct prerequisites: [GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional](#saito-tunnell-dichotomy-and-the-local-toric-functional), `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`.

Construction/proof: 1. Classify torus-conjugacy classes of Eichler orders by their two lattices. 2. Apply CST Definition1.3’s conductor orientation to select an order. 3. For division B use the unique compatible maximal/suborder data and torus eigencondition.

Uses: CST Propositions3.7–3.8 — Construct the one-dimensional nonzero test-vector line.; GZ.5 explicit formula — Retain conductor and removed-Euler-factor corrections..

| Declaration | Required API |
|---|---|
| `admissibleToricOrder` | The order together with its embedded torus and conductor orientation. |
| `admissibleToricOrder_intersection` | Rv∩Kv=𝒪_{c₁}. |
| `admissibleToricOrder_discriminant` | disc Rv=p^n. |
| `admissibleToricOrder_conjugate` | Kv×-conjugation preserves admissibility with transported vectors. |

| Test | Kind | Exact expectation |
|---|---|---|
| `admissibleToricOrder_unramified` | computation | For n=c=0 take the maximal order with full 𝒪_K intersection. |
| `admissibleToricOrder_mismatch` | non-example | For nonsplit K and c<n, the required intersection is 𝒪_K, not 𝒪_c. |
| `admissibleToricOrder_split_orientation` | characterisation | For 0<c<n in split K, the chosen lattice orientation corresponds to the conductor-c character factor. |

Acceptance: The two split mismatch orders are not interchanged without also changing the character direction..

Sources: `cai-shu-tian-2014`, Definition1.3 and preceding conditions, pp.5–6.

<a id="toric-test-vectors"></a>

### Nonzero toric test vectors

**GZ.4/toric-test-vectors** · theorem · `toricTestVector_nonzero`

For a distinguished local pair, a nonzero toric functional has a nonzero test vector. In the nonarchimedean CST conductor setting the line V(πv,χv) is the central-character eigenspace for the specified admissible-order/newvector subgroup and, when nonsplit c<n, the χv⁻¹ torus eigenspace; CST Proposition3.7 gives dimension one and nonzero toric evaluation. In the split conductor-mismatch case the correct translate/orientation is required. At real places use the matching discrete-series/compact-quaternion weight. The general distinguished characteristic-zero theorem includes dyadic data; the explicit order formulas carry their individual hypotheses.

Hypotheses: The exact admissible order and conductor choices from admissibleToricOrder; For a particular explicit local value, use the relevant CST case rather than a universal spherical assertion.

Direct prerequisites: [GZ.4/admissible-toric-order](#admissible-toric-order), [GZ.4/normalized-toric-integral](#normalized-toric-integral), `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`.

Construction/proof: 1. Apply local multiplicity one and construct the CST invariant/eigenline. 2. Compute its toric integral using the local order and newvector translates. 3. Use the archimedean weight decomposition for the real case.

Acceptance: Ramified χ can kill the untranslated spherical vector; a nonzero translate is required..

Sources: `cai-shu-tian-2014`, Definition1.4; Proposition3.7; §3.3.

## GZ.5 — Coherent theta and period formulas

Specialize the imported Siegel–Weil and see-saw identities with their actual convergence regimes. State Waldspurger as a bilinear identity for all vector pairs; take ratios only after proving denominators nonzero. The Maass half-weight value identity retains both signs of the fundamental discriminant and the r/2 gamma parameters.

Coverage: **planned**. Full coherent theta/Waldspurger proof source at the requested MP.6 interfaces; definite coefficient scalar comparison; Baruch–Mao Maass S6 normalization gate.

Atlas planets: Quaternionic theta specialization; Waldspurger formula; Toric period nonvanishing.

<a id="coherent-quaternionic-specialization"></a>

### Coherent quaternionic theta specialization

**Declaration:** `coherentQuaternionicTheta`; theorem; node `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization`.

For coherent quaternionic B/F and an embedded nontrivial quadratic field K/F, specialize the imported extended Weil representation and unit-quotiented theta kernel to q=Nrd_B and its binary norm subspaces K and Kj. Each binary norm is anisotropic even when B is split: with probability Haar, E(0,g,Φ)=2∫θ(g,h,Φ)dh. In YZZ’s toric convention, where the quotient has volume2L(1,η), the double toric theta integral is L(1,η)I(0,g,χ,Φ). For division B the anisotropic ternary trace-zero identity gives the Shimizu/Petersson contraction used in the factorization. For split B the generic ternary second-term identity remains an identity modulo the residual image; the exact split Shimizu comparison is a separate required input, not a consequence asserted here.

**Hypotheses.**

- Adelic additive character, self-dual measures, torus quotient and probability measures compared by GZ.0
- Convergence/regularization regime is matched to binary/ternary Witt index, not assumed
- For O(V_m)×Sp_(2n), ordinary convergence requires r=0 or m−r>n+1. Here n=1; a quadratic-field norm has (m,r)=(2,0), division trace-zero data have (3,0), and split trace-zero data have (3,1), outside the ordinary range. The generic split binary (2,1) is an additional MP supplier case, not the norm of this K/F. YZZ’s 2011 draft Proposition2.2.1 proves the nonsplit case by Siegel–Weil and refers its split case to a different Waldspurger argument.

**Construction or proof.**

1. Import the exact binary norm and ternary trace-zero exports from MP.6.
2. Compare their Haar and Weil splittings to the toric conventions.
3. For division B use the anisotropic ternary Siegel–Weil identity and the source’s cuspidal unfolding. For split B first supply the separately normalized Shimizu factorization from Waldspurger’s original argument, or a fully sourced comparison from GQT’s residual-image identity to that pairing; no elimination of the residual terms is assumed.

**Direct prerequisites.** `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`, `MetaplecticAutomorphicForms:MP.6/toric-theta-pairing-interface`, `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`, `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`.

**Proposed library location.** `TauCeti/NumberTheory/GrossZagier/Stage5`, namespace `TauCeti.GrossZagier`.

**Acceptance checks.**

- The binary norm identity alone is insufficient: the ternary identity is a separate prerequisite.
- The generic split binary supplier uses A₁=B₀; it is not the quadratic-field norm used here. Neither that exceptional formula nor the split ternary quotient identity alone proves the split Shimizu contraction.

**Sources.**

- [Xinyi Yuan; Shou-Wu Zhang; Wei Zhang, The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.4.2, printed pp. 11-12. Fixes the measure used in the Petersson pairing, distinct from the toric measure. Reviewed decomposition supplies this locator/excerpt; the full book proof was not independently acquired in this run.
  Recorded source verification: **unverifiable**. The exact 2013 published text and pagination were not independently reacquired. The 6 November 2011 public author preprint is a distinct version; inherited transliterations/ellipses are not certified as literal publication excerpts.
- [W. T. Gan, Y. Qiu and S. Takeda, The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula](https://arxiv.org/pdf/1207.4709v3), arXiv:1207.4709v3 §1.7, pp.3–4. The strict criterion prevents using the divergent split binary or boundary ternary ordinary integral. The orthogonal/symplectic specialization has ε₀=1.
  Recorded source verification: **verified**. Checked this public source/version at the stated locator and the surrounding hypotheses. This is source support, not an assertion that the proposed Lean carrier is implemented.
- [Xinyi Yuan; Shou-Wu Zhang; Wei Zhang, The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §2.1.5 Theorem2.1.1 pp.43–44; §2.2.1 Proposition2.2.1 proof p.48; §2.4 p.54. Confirms the quadratic-field/nonsplit hypotheses, probability and toric measures, and the explicit separate split proof route. It does not certify the inherited 2013 published excerpt or pagination.

**Atlas planet:** Quaternionic theta specialization.

**Implementation status:** `unchecked`.


<a id="waldspurger-period-formula-and-its-siegel-weil-proof"></a>

### Waldspurger period formula

**GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof** · theorem · `waldspurger`

Let π be a cuspidal quaternionic automorphic representation, K/F quadratic with ωπχ|A_F×=1, and χ unitary. Define Pχ using probability measure on K×A_F×\A_K×, the global invariant form using quaternionic Tamagawa volume2, and α as the restricted tensor product of GZ.4’s local bilinear forms. For all f₁∈π and f₂∈π̃, Pχ(f₁)Pχ⁻¹(f₂)=ζ_F(2)L(1/2,π_K⊗χ)/(8L(1,η)²L(1,π,ad))·α(f₁,f₂). This is an identity of bilinear forms, including zero global/local pairings. With quotient-volume2L(1,η) periods, the constant becomes ζ_F(2)L(1/2)/(2L(1,π,ad)).

Hypotheses: π is cuspidal; relevant local L-factors and adjoint value are nonzero/finite; The toric and Petersson measures are the distinct normalizations above.

Direct prerequisites: [GZ.5/coherent-quaternionic-specialization](#coherent-quaternionic-specialization), [GZ.4/unramified-toric-value](#unramified-toric-value), [GZ.3/petersson-composition-comparison](#petersson-composition-comparison), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Construction/proof: 1. Apply the coherent binary/ternary Siegel–Weil specialization and toric see-saw. 2. Unfold the global pairing to local Whittaker/toric integrals. 3. Evaluate the unramified factors and compare the adjoint Petersson normalization. 4. Translate quotient periods to probability periods and extend by bilinearity without division.

Acceptance: Zero toric Hom at any place forces the global form to vanish.; Scaling torus Haar measures respects the squared period factor..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Thm. 1.4, printed p. 11; `cai-shu-tian-2014`, §2 equation(2.1), pp.12–13; `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §5, p. 292 (‘in accordance with Waldspurger's theorem, they are all squares’).

<a id="toric-period-nonvanishing"></a>

### Toric period nonvanishing criterion

**GZ.5/toric-period-nonvanishing** · theorem · `toricPeriod_nonzero_iff`

A cuspidal quaternionic π has a nonzero χ toric period precisely when every local Hom P(πv,χv) is nonzero and L(1/2,π_K⊗χ)≠0. In the matching case, choose local vectors with αv≠0 at the finitely many ramified places and spherical vectors elsewhere; their global period product is nonzero by Waldspurger. If either condition fails every period vanishes. This criterion does not assert the existence of a nonvanishing quadratic twist without a separate analytic nonvanishing input.

Hypotheses: The invariant dual pairings and L-function hypotheses of waldspurger.

Direct prerequisites: [GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof](#waldspurger-period-formula-and-its-siegel-weil-proof), [GZ.4/toric-test-vectors](#toric-test-vectors).

Construction/proof: 1. Use local distinction for necessity of the Hom conditions. 2. Use the bilinear identity for the central-value condition and construct a pure tensor with nonzero local form for sufficiency.

Acceptance: A local sign mismatch yields zero even when the central L-value is nonzero..

Sources: `cai-shu-tian-2014`, §3.1 and Theorem1.8.

<a id="finite-vector-variation"></a>

### Finite test-vector variation

**GZ.5/finite-vector-variation** · theorem · `waldspurger_vector_variation`

For pure tensors fᵢ and fᵢ′ agreeing outside a finite set S, the cross-multiplied Waldspurger identities compare the two period products by the corresponding αv products at S. Where all pairings and toric factors are nonzero, the ratio form is ∏_{v∈S}βv(f₁,v′,f₂,v′)/βv(f₁,v,f₂,v), together with the changed Petersson pairing. This specializes to split, ramified and definite quaternionic admissible-order lines without dropping conductor, unit-index, removed-Euler or archimedean factors.

Hypotheses: Ratio notation used only when each stated denominator is nonzero; Explicit CST local factors apply only in their stated conductor cases.

Direct prerequisites: [GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof](#waldspurger-period-formula-and-its-siegel-weil-proof), [GZ.4/toric-test-vectors](#toric-test-vectors), [GZ.0/identity-rescaling](#identity-rescaling).

Construction/proof: 1. Apply the bilinear formula twice and cancel equal unramified factors. 2. Translate the trace/class-group sum period to the quotient integral using its class number and volume. 3. For explicit cases insert CST §3’s local toric values.

Acceptance: The formula remains cross-multiplied if a test-vector pairing is zero..

Sources: `cai-shu-tian-2014`, Theorem1.9, pp.11–12.

<a id="classical-weight-two-central-value"></a>

### Weight-two central-value formula

**GZ.5/classical-weight-two-central-value** · theorem · `gz86_weight_two_central_value`

Under classical notation C5: Suppose ε(N) = −1 and k = 1. For m ≥ 0 define b_{m,A} = r_A(m|D|)·h/u + Σ_{0<n≤m|D|/N} δ(n) R_{A𝔫}(n) r_A(m|D| − nN), with δ(n), R_{A𝔫}(n) as in (4.6). Then Σ_{m≥0} b_{m,A}q^m is a modular form of weight 2 and level N, and L_A(f,1) = (8π²/√|D|)·(f, Σ_m b_{m,A}q^m) for every f in the space spanned by newforms of weight 2 and level N. (At k = 1 the printed constant (2π)^{2k}2^{2k−1}(k−1)!/((2k−2)!|D|^{k−1/2}) equals 8π²/√|D|, so E43 does not affect this case, and no holomorphic projection is needed because Φ̃ of (4.4) is holomorphic.) The case k ≥ 2 is the referenced classical source result 335.

Direct prerequisites: [GZ.6/classical-central-value-kernel](#classical-central-value-kernel), [GZ.6/classical-rankin-kernel-pairing](#classical-rankin-kernel-pairing), [GZ.6/classical-genus-sigma-identity](#classical-genus-sigma-identity).

Construction/proof: 1. Use the weight-two holomorphic central kernel, which needs no regularized projection. 2. Pair with the newform and simplify the constant to 8π²/√|D|; retain ε(N)=−1.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §5, (5.6) Theorem, p. 291.

<a id="classical-central-value-endpoints"></a>

### Central-value endpoint normalization

**GZ.5/classical-central-value-endpoints** · theorem · `gz86_central_value_endpoints`

Under classical notation C5: In Theorem (5.6) one may drop the term r_A(m|D|)h/u and extend the sum to 0 ≤ n ≤ m|D|/N, because δ(0) = 2^t (t = number of prime factors of D) and R_{A𝔫}(0) = h/(2^t u) (each genus contains h/2^{t−1} classes and r_B(0) = 1/(2u) for each class B), while P_{k−1}(1) = 1.

Direct prerequisites: [GZ.5/classical-weight-two-central-value](#classical-weight-two-central-value), [GZ.6/classical-genus-sigma-identity](#classical-genus-sigma-identity).

Construction/proof: 1. Keep the l=0 and n=0 endpoints of the finite central kernel sum. 2. Use r_A(0)=1/w and the class number formula to check the constant coefficient.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §5, p. 291 (paragraph after Theorem (5.6)).

<a id="classical-genus-sum-filter"></a>

### Central-value genus-sum filter

**GZ.5/classical-genus-sum-filter** · theorem · `gz86_genus_sum_filter`

Under classical notation C5: For n, l ∈ ℕ: Σ_A R_{A𝔫}(n) r_A(l) = Σ_{genera G} R_{G𝔫}(n) R_G(l), which equals R(n)R(l) if the genus of an ideal of norm nl (if any) is {𝔫}, and 0 otherwise; here R(n) = Σ_{d|n} ε(d). If ε(N) = −1 (so N(𝔫) ≡ −N mod D) and l = m|D| − nN > 0, the genus conditions at the primes p | D with p ∤ n are automatic (l ≡ N(𝔫)n mod p), and δ(n) Σ_A R_{A𝔫}(n) r_A(m|D| − nN) = R(n) R(m|D| − nN) ∏_{p|(n,D)} (1 + ε̂_p((nN − m|D|)/(nN))), where ε̂_p : ℚ^× → {±1} is the homomorphism with ε̂_p(q) = (q/p) for primes q ≠ p, ε̂_p(−1) = (−1/p), and ε̂_p(p) = ((|D|/p)/p). [Printed: ‘the values of genus characters associated to the primes p dividing N’ — read D; issue PAPER-GROSS-ZAGIER-86/E44.]

Direct prerequisites: [GZ.5/classical-weight-two-central-value](#classical-weight-two-central-value), [GZ.6/classical-genus-sigma-identity](#classical-genus-sigma-identity), `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. Sum the ideal-class central value over its genus characters. 2. Apply orthogonality to isolate the stated class/genus contribution and its 2^t factor.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §5, p. 292 (first half).

<a id="classical-definite-period-announcement"></a>

### Definite period specialization

**GZ.5/classical-definite-period-announcement** · theorem · `gz86_definite_period_announcement`

In the definite ε(N)=−1, weight-two specialization, identify the CM class vector in the rational quaternionic eigenspace with the probability-normalized toric period. Under the local/global pairing and measure conventions of the normalized Waldspurger period formula, its χ,eigencomponent norm computes L(f,χ,1) with that formula’s exact product of local factors. This is a specialization of the coherent formula, not a theorem with an unspecified proportionality constant.

Direct prerequisites: [GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof](#waldspurger-period-formula-and-its-siegel-weil-proof), [GZ.5/classical-weight-two-central-value](#classical-weight-two-central-value), `HeegnerPointEulerSystems:HE.0`.

Construction/proof: 1. Interpret the definite CM class vector as a toric period in the coherent quaternionic realization. 2. Apply the normalized Waldspurger formula already planned here; the historical announcement alone does not supply its unspecified scalar.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter V, §3, p. 314.

<a id="classical-definite-square-class"></a>

### Definite central-value square class

**GZ.5/classical-definite-square-class** · theorem · `gz86_definite_square_class`

Fix a nonzero rational generator e of the one-dimensional M_f quaternionic eigenspace and its bilinear form. If the trivial-character CM projection is x_(1,f)=a_K e with a_K∈M_f, its norm is a_K²(e,e). The coherent normalized central-value identity then gives L(f,1_K,1)/C_K=a_K²(e,e), with C_K its specified discriminant, measure, Petersson and local factors; the square class after this normalization is independent of K. Zero projections are allowed.

Direct prerequisites: [GZ.5/classical-definite-period-announcement](#classical-definite-period-announcement), [GZ.3/strict-gl2-realization](#strict-gl2-realization).

Construction/proof: 1. Use the one-dimensional rational coefficient-field eigenspace and its fixed bilinear pairing. 2. Writing x_(1,f)=a·e makes its norm a² times the fixed norm of e; the completed-period normalization must remain fixed when K varies.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter V, §3, p. 314.

<a id="half-weight-waldspurger-value"></a>

### Half-weight Waldspurger value

**GZ.5/half-weight-waldspurger-value** · theorem · `halfWeight_waldspurger`

Let φ(z)=2√y Σ_(n≠0) a(n)K_(ir)(2π|n|y)e(nx) be a nonzero even level-one Hecke–Maass eigenform, a(1)=1. Choose the associated weight-1/2 Kohnen-plus eigenline at parameter r/2 and its vector F(z)=Σ b(n)W_(sgn(n)/4,ir/2)(4π|n|y)e(nx), normalized by (F,F)=1 under the DIT Petersson convention. For a nonzero fundamental discriminant d, 12π|d||b(d)|²=(φ,φ)⁻¹Γ(1/2+ir/2−sgn(d)/4)Γ(1/2−ir/2−sgn(d)/4)L(1/2,φ⊗χ_d). The phase of F is free and both sides are phase-invariant. The twisted L-function is the finite Dirichlet-series L-function; the two displayed gamma factors are not already included in it.

Hypotheses: r is real; φ is even and normalized by a(1)=1, rather than unit Petersson norm; The half-weight form has the specified Whittaker and Petersson normalization, including the plus condition at 2.

Direct prerequisites: `MetaplecticAutomorphicForms:MP.7`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicSpectralTheory:AS.1`.

Construction/proof: 1. Import the Hecke-equivariant Kohnen-plus/GL₂ eigenline correspondence, including the operator at 2 and the eigenvalue parameter r/2. 2. Apply the local/global Baruch–Mao central-value identity. 3. Compare its Whittaker coefficient and Petersson conventions with DIT Theorem4 and (5.17), retaining 12π and both signed gamma factors. 4. Pass to the unit half-weight vector; its arbitrary phase disappears in |b(d)|².

Acceptance: d>0 uses gamma real part 1/4; d<0 uses 3/4.; Multiplying F by e^(iθ) leaves the identity unchanged.; Rescaling φ without a(1)=1 would change its Dirichlet coefficients and is not allowed without an explicit adapter..

Sources: `duke-imamoglu-toth-2016`, published Annals 184 (2016), §5 Theorem4 pp.965–966 and (5.17) p.966.

## GZ.6 — Global analytic and Picard kernels

Build the actual mixed theta–Eisenstein derivative, proper-cycle Picard series and arithmetic height kernel. The classical strand supplies unfolding, signed coefficient formulas, cusp estimates, ordinary and regularized holomorphic projection, and the projected central-derivative cusp form.

Coverage: **planned**. Full YZZ Picard modularity/trace scalar proof source and actual automorphic/Picard carriers; realize the classical regularized projection estimates and exact theta transforms.

Atlas planets: Special correspondence cycle; Picard-valued generating series; Arithmetic height kernel; Incoherent central derivative; Projected kernel identity.

<a id="special-correspondence-cycle"></a>

### Special correspondence cycle

**GZ.6/special-correspondence-cycle** · construction · `specialCorrespondenceCycle`

For x∈B_f× and U_x=U∩xUx⁻¹, define Z(x)_U as the proper cycle push-forward of [X_{U_x}] under (p,p∘T_x):X_{U_x}→X_U×X_U. Multiplicities are generic residue degrees, including a noninjective level map; Z(x)_U is not its reduced image. Its action on Pic⁰ is the actual Hecke correspondence push-pull. Level composition obeys the double-coset convolution with multiplicities.

Hypotheses: Finite levels and proper maps; coarse/stack multiplicities specified by the imported cycle formalism.

Direct prerequisites: `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R14.2`.

Construction/proof: 1. Construct the two finite level maps from the imported Hecke tower. 2. Apply proper push-forward to the fundamental cycle, with residue degrees. 3. Use base change and composition of proper push-forward to identify its Pic⁰ action.

Uses: YZZ Chapter4 — Coefficients of the Picard-valued generating series.; GZ.7 intersection calculations — Retain multiplicities in the height kernel..

| Declaration | Required API |
|---|---|
| `specialCorrespondenceCycle` | The proper push-forward cycle Z(x)_U. |
| `specialCorrespondenceCycle_action` | Its Pic⁰ action is the Hecke push-pull map. |
| `specialCorrespondenceCycle_level` | Level pullback/push-forward matches the corrected multiplicities. |
| `specialCorrespondenceCycle_convolution` | Composition is double-coset convolution with its counting coefficients. |

| Test | Kind | Exact expectation |
|---|---|---|
| `specialCorrespondenceCycle_identity` | computation | At x=1 the cycle is the diagonal with its proper multiplicity. |
| `specialCorrespondenceCycle_degree_two` | non-example | A generically degree-two parametrization produces twice the reduced image. |
| `specialCorrespondenceCycle_zero_action` | degenerate | The induced correspondence sends the zero Pic⁰ class to zero. |

Acceptance: A degree-d map onto its image contributes d times that image..

Sources: `yzz-gross-zagier-erratum`, item30 and §2; `yuan-zhang-2018`, published Annals 187 (2018), §8.1 pp605–607.

<a id="cm-degree-zero-class"></a>

### ξ-normalized CM divisor

**GZ.6/cm-degree-zero-class** · definition · `cmDegreeZeroClass`

For an imported CM point [h] on X_U and its geometric component c(h), define [h]⁰=[h]−ξ_{U,c(h)} in Pic⁰(X_U)⊗ℚ, then in the Jacobian via the Abel–Jacobi identification. Subtraction is componentwise: a Hodge class on a different component does not give a degree-zero divisor. The finite-character sum uses the same trace/average and reciprocity convention as GZ.0.

Hypotheses: CM points and their reciprocity are supplied by HE.1; rational Hodge class fixed.

Direct prerequisites: [GZ.3/normalised-hodge-class-and-xi-parametrised-realisation](#normalised-hodge-class-and-xi-parametrised-realisation), `HeegnerPointEulerSystems:HE.1`, [GZ.0/artin-map-convention](#artin-map-convention), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`.

Construction/proof: 1. Subtract the degree-one class on the point’s component. 2. Pass to the imported Pic⁰/Jacobian and check Galois/Hecke equivariance.

Uses: YZZ height series — Define the two actual Jacobian inputs.; GZ.8 Heegner point — Transport the same normalized divisor through the rational realization..

| Declaration | Required API |
|---|---|
| `cmDegreeZeroClass` | The class [h]−ξ on the CM component. |
| `cmDegreeZeroClass_degree` | It has degree zero on every component. |
| `cmDegreeZeroClass_galois` | Galois transport sends the point and its component Hodge class together. |
| `cmDegreeZeroClass_character` | Character sums use the selected inverse-character projector. |

| Test | Kind | Exact expectation |
|---|---|---|
| `cmDegreeZeroClass_degree_zero` | computation | 1−1=0 on the point’s component and zero on all others. |
| `cmDegreeZeroClass_wrong_component` | non-example | Subtracting ξ on a different component leaves degrees 1 and −1, so is not componentwise Pic⁰. |
| `cmDegreeZeroClass_hodge_average` | degenerate | A divisor equal to the chosen ξ has normalized class zero. |

Acceptance: An unnormalized degree-one CM divisor cannot be used directly in a Jacobian height..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.5.5-1.5.6, printed pp. 15-16; `yuan-zhang-2018`, published Annals 187 (2018), §8.1 pp605–607.

<a id="picard-generating-series"></a>

### Picard-valued generating series

**GZ.6/picard-generating-series** · construction · `picardGeneratingSeries`

For U-biinvariant extended Schwartz Φ, let ϕ be its archimedean average. Define Z(g,Φ)_U=Z₀(ϕ)_U+w_U Σ_{a∈F×}Σ_{x∈U\B_f×/U} r(g)ϕ(x,a/q(x)) Z(x)_U in Pic(X_U×X_U)⊗ℂ, with the fixed Hodge/constant term and unit stabilizer w_U. The series converges coefficientwise in the stated Picard realization and defines a weight-two automorphic form. Its appropriately volume-rescaled level classes are compatible. The modularity assertion is a theorem about these actual cycle coefficients.

Hypotheses: Standard Gaussian archimedean data and allowed finite support; proper-cycle coefficients; Compact case or separately corrected cuspidal finite-level case.

Direct prerequisites: [GZ.6/special-correspondence-cycle](#special-correspondence-cycle), `MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil`, [GZ.3/normalised-hodge-class-and-xi-parametrised-realisation](#normalised-hodge-class-and-xi-parametrised-realisation), `ModularCurvesPartII:R14.4`.

Construction/proof: 1. Form the corrected cycle coefficients and Hodge term with ϕ, not unaveraged Φ. 2. Use the imported Weil action/product formula and the source’s curve-cycle theta calculation to prove modularity. 3. Check coefficientwise convergence and level push-pull with volumes.

Uses: YZZ §4.2 — Build the actual arithmetic theta correspondence.; GZ.6 height kernel — Evaluate this Picard-valued series on two normalized CM classes..

| Declaration | Required API |
|---|---|
| `picardGeneratingSeries` | The explicit Hodge-plus-Hecke series with Picard coefficients. |
| `picardGeneratingSeries_coefficient` | The nonzero Fourier coefficients are the weighted proper special cycles. |
| `picardGeneratingSeries_level` | The specified volume-rescaled classes are level compatible. |
| `picardGeneratingSeries_modular` | The series transforms by the weight-two Weil automorphy law. |

| Test | Kind | Exact expectation |
|---|---|---|
| `picardGeneratingSeries_zero` | degenerate | Zero Schwartz input gives the zero series. |
| `picardGeneratingSeries_diagonal` | characterisation | The identity double coset contributes the actual diagonal cycle. |
| `picardGeneratingSeries_rational_factor` | non-example | For F=ℚ the corrected whole factor is 1/2; substituting 2 changes coefficients by four. |

Acceptance: The modular X₀(N) example recovers the Hecke generating series with the corrected normalization..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.5.4, printed p. 15; `yzz-gross-zagier-erratum`, items8,30,31; `yuan-zhang-2018`, published Annals 187 (2018), §8.1 pp605–607.

<a id="arithmetic-height-kernel"></a>

### Arithmetic height kernel

**GZ.6/arithmetic-height-kernel** · construction · `arithmeticHeightKernel`

Evaluate the level-compatible Picard correspondence Z̃(g,Φ) on [h₁]⁰ and pair its resulting Jacobian class with [h₂]⁰ by the GZ.1 Poincaré height. Define Z̃(g,(h₁,h₂),Φ) this way, and its χ-geometric kernel by the prescribed regularized torus integral. For finite-character/compact CM-orbit data this is the normalized finite sum; in general the regularization subtracts its stated constant/Hodge terms before the limiting integral. The construction preserves the actual proper cycle action and χ/χ⁻¹ inputs.

Hypotheses: Both CM classes have componentwise degree zero; Regularized integral defined by its source truncation, not assigned a value by a formal symbol.

Direct prerequisites: [GZ.6/picard-generating-series](#picard-generating-series), [GZ.6/cm-degree-zero-class](#cm-degree-zero-class), [GZ.1/character-height-pairing](#character-height-pairing), [GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions](#hodge-index-theorem-and-admissible-arithmetic-extensions).

Construction/proof: 1. Apply the correspondence to the actual Pic⁰ class. 2. Use the full Poincaré height and finite-extension normalization. 3. Subtract the explicit divergent Hodge/constant contribution and take the source’s regularized torus limit.

Uses: YZZ Theorem3.21 — The geometric side of the projected derivative identity.; Colmez §8 — Separate horizontal, vertical and extended diagonal contributions..

| Declaration | Required API |
|---|---|
| `arithmeticHeightKernel` | The regularized χ toric integral of the correspondence height. |
| `arithmeticHeightKernel_bilinear` | The kernel is bilinear in the two normalized Pic⁰ inputs and linear in Φ. |
| `arithmeticHeightKernel_level` | Compatible finer-level representatives give the same kernel. |
| `arithmeticHeightKernel_local` | On disjoint divisors it is the normalized finite-plus-infinite intersection height. |

| Test | Kind | Exact expectation |
|---|---|---|
| `arithmeticHeightKernel_zero` | degenerate | A zero normalized CM class gives zero kernel. |
| `arithmeticHeightKernel_average` | computation | Averaging both trace inputs divides the height kernel by h². |
| `arithmeticHeightKernel_cycle_multiplicity` | non-example | Replacing a degree-two push-forward by its reduced image halves that cycle’s height contribution. |

Acceptance: A finite class-group average differs from the trace height by the square of its cardinality..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.5.5-1.5.6, printed pp. 15-16; `yuan-zhang-2018`, published Annals 187 (2018), §8.1 pp605–607.

<a id="incoherent-central-derivative"></a>

### Incoherent central derivative

**GZ.6/incoherent-central-derivative** · theorem · `incoherentKernel_derivative`

For the source’s incoherent quaternionic extended Weil data, form the actual mixed theta–Eisenstein kernel I(s,g,χ,Φ), initially in its convergence half-plane, then meromorphically continue it. Its sign at the centre forces I(0,g,χ,Φ)=0, and I′(0,g,χ,Φ) is its analytic derivative. After the stated growth estimates, differentiation commutes with the local/global expansions on compact g-sets. The zero-frequency Whittaker term has its separate normalized formula; it is not a limit of the nonzero-frequency formula.

Hypotheses: Incoherent Hasse signs and χ central condition; fixed holomorphic section in s; Convergence, pole subtraction and projection hypotheses checked before exchanging sums or integrals.

Direct prerequisites: [GZ.6/mixed-theta-eisenstein](#mixed-theta-eisenstein), `MetaplecticAutomorphicForms:MP.6/coherent-incoherent-sections`, `AutomorphicSpectralTheory:AS.3`.

Construction/proof: 1. Use the imported incoherent section and functional equation to obtain central vanishing. 2. Establish locally uniform derivative bounds after subtracting singular terms. 3. Differentiate the factorized Fourier expansion and keep the constant term separate.

Acceptance: At a Fourier index with exactly one bad nonsplit place the derivative occurs at that place..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.5.6, printed p. 16; `yuan-zhang-2018`, §7.1 and §7.3.

<a id="arithmetic-theta-lifting"></a>

### Arithmetic theta lifting comparison

**GZ.6/arithmetic-theta-lifting** · theorem · `arithmeticThetaLift_comparison`

For Φ in the extended Schwartz space and φ in the specified weight-two constituent σ, the correspondence-valued arithmetic theta lift, defined by Petersson projection of Z̃(g,Φ), equals L(1,π,ad)/(2ζ_F(2)) times the homomorphism associated with the coherent theta lift θ(Φ⊗φ). This is an equality of actual Jacobian homomorphisms, using Pic(X_U×X_U)→Hom(J_U,J_U∨) before rational scalar extension.

Hypotheses: Rational realizations and dualities fixed; finite level for the trace computation; Compact case and modular cusp boundary terms are treated separately.

Direct prerequisites: [GZ.6/picard-generating-series](#picard-generating-series), [GZ.5/coherent-quaternionic-specialization](#coherent-quaternionic-specialization), [GZ.3/composition-pairing](#composition-pairing), `AutomorphicSpectralTheory:AS.4`.

Construction/proof: 1. Use multiplicity one to compare the two lifts up to scalar. 2. Compute traces on H⁰,¹ by Lefschetz intersection of the corrected correspondence with the diagonal. 3. Evaluate the Hodge/cusp/CM contributions to obtain the stated adjoint/zeta constant.

Acceptance: The scalar is L(1,ad)/(2ζ_F(2)), not an unspecified proportionality..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.5.6-1.5.7, printed pp. 16-17; `yzz-gross-zagier-erratum`, items18,19,30.

<a id="generating-series-arithmetic-theta-lifting-and-the-kernel-identity"></a>

### Projected arithmetic kernel identity

**GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity** · theorem · `arithmeticKernel_projected_identity`

For the fixed quaternionic constituent σ and admissible factorizable Φ, (I′(0,·,χ,Φ),φ)_Pet=2(Z̃(·,χ,Φ),φ)_Pet for every φ∈σ. Equivalently the σ-cuspidal projections agree with factor2. The equality is not pointwise in g: constant, Eisenstein, old and nearby-coherent terms are removed by their separately proved projection/orthogonality statements. Extend from the degenerate test data to all permitted data by local toric multiplicity one and the existence of a nonzero distinguished test pair.

Hypotheses: All derivative, geometric regularization and projection hypotheses of the preceding constructors; Degenerate-case comparison and nonzero local test-pair reduction are proved.

Direct prerequisites: [GZ.6/incoherent-central-derivative](#incoherent-central-derivative), [GZ.6/arithmetic-height-kernel](#arithmetic-height-kernel), [GZ.6/arithmetic-theta-lifting](#arithmetic-theta-lifting), [GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation](#degenerate-schwartz-functions-local-decomposition-and-approximation), [GZ.4/toric-test-vectors](#toric-test-vectors), `AutomorphicSpectralTheory:AS.4`.

Construction/proof: 1. Decompose both kernels place by place under the degenerate hypotheses. 2. Apply the local identities and nearby-coherent approximation theorem of GZ.7. 3. Project away the explicitly identified nonzero error; extend by the one-dimensional toric tensor functional.

Acceptance: The right-hand coherent error may be nonzero before projection.; A vanishing global invariant pairing causes no division by zero..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.5.6, printed p. 16.

<a id="colmez-pseudo-theta"></a>

### Pseudo-theta datum

**GZ.6/colmez-pseudo-theta** · construction · `pseudoTheta`

Let V be a positive definite quadratic space over F and V0 ⊂ V1 ⊂ V subspaces over F with the induced forms, all even-dimensional; V0 may also be ∅. Let S be a finite set of nonarchimedean places, φ^S ∈ S̄(V(A^S)×A^{S,×}) with standard archimedean components, and for v ∈ S let φ′_v : GL2(F_v)×(V1−V0)(F_v)×F_v^× → ℂ be locally constant, invariant under right translation of g by some open compact K_v ⊂ GL2(F_v), and, for each g, of bounded support in (x,u); let µ ⊂ O_F^× have finite index with φ^S and φ′_S = ∏_{v∈S}φ′_v invariant under (x,u) ↦ (αx, α^{−2}u), α ∈ µ. The pseudo-theta series is A^{(S)}_{φ′}(g) = Σ_{u∈µ²\F^×} Σ_{x∈V1−V0} φ′_S(g,x,u) r_V(g)φ^S(x,u), with the Weil representation of V (not V1). It is nondegenerate if V1 = V, nontruncated if V0 = ∅, and nonsingular if each φ′_v(1,·,·) extends to a Schwartz function on V1(F_v)×F_v^×; then its outer theta series is θ_{A,1}(g) = Σ_u Σ_{x∈V1} r_{V1}(g)φ′_S(1,x,u) r_{V1}(g)φ^S(x,u) and its inner theta series θ_{A,0} is the same with V0 in place of V1 (θ_{A,0} = 0 if V0 = ∅).

Direct prerequisites: `MetaplecticAutomorphicForms:MP.5`.

Construction/proof: 1. Use the imported Weil representation on V and the stated unit invariance to form the quotient sum. 2. Bounded bad-place support and positive definite Gaussian decay give local finiteness/convergence; restrict the nonsingular data to construct the two usual theta series.

Uses: Yuan–Zhang 2018 §6.2, pp. 579–580 — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `pseudoTheta_constructor` | The locally finite unit-quotient sum in the stated ambient Weil representation. |
| `pseudoTheta_outer` | The nonsingular outer theta uses the V₁ Weil representation. |
| `pseudoTheta_inner` | The inner theta uses V₀; it is zero for the empty truncation. |
| `pseudoTheta_unit_invariant` | The summand is invariant under (x,u)↦(αx,α⁻²u). |

| Test | Kind | Exact expectation |
|---|---|---|
| `pseudoTheta_empty_truncation` | degenerate | For V₀=∅ the inner theta is zero; for V₀={0} it is the zero-vector theta term. |
| `pseudoTheta_full_space` | compatibility | For V₁=V and genuine Weil translates at bad places, the nontruncated series is the usual theta series. |
| `pseudoTheta_wrong_ambient_weight` | non-example | Using rV₁ in place of rV loses the positive-codimension (ρ∞δ) power in the comparison. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §6.2, pp. 579–580.

<a id="colmez-pseudo-comparison"></a>

### Pseudo-theta comparison on a small bad-place compact

**GZ.6/colmez-pseudo-comparison** · theorem · `colmez_pseudo_comparison`

Let A = A^{(S)}_{φ′} be a nonsingular pseudo-theta series on V0 ⊂ V1 ⊂ V (d = dim V, d_i = dim V_i; θ_{A,0} := 0 if V0 = ∅), with φ^S standard at the archimedean places. Let S′ ⊇ S be a finite set of nonarchimedean places outside of which φ_v is standard, compatible with the orthogonal splittings V = V1 ⊕ V1^⊥ = V0 ⊕ V0^⊥, and the discriminant characters χ_{V1^⊥}, χ_{V0^⊥} are unramified. Then there is an open compact K_{S′} ⊂ GL2(F_{S′}) such that for all g ∈ K_{S′}GL2(A^{S′}): A(g) = χ_{V1^⊥}(a(g)) ρ∞(g)^{(d−d1)/2} δ(g)^{(d−d1)/2} θ_{A,1}(g) − χ_{V0^⊥}(a(g)) ρ∞(g)^{(d−d0)/2} δ(g)^{(d−d0)/2} θ_{A,0}(g). Here δ(g) = ∏_{all v} δ_v(g_v) with δ_v([[a,b],[0,d]]k) = |a/d|_v^{1/2}; ρ∞(g) = ∏_{v|∞} e^{iθ_v} for g_v = [[a,b],[0,d]]k_{θ_v}, a > 0; and χ_W(a(g)) := ∏_{w∉S′ finite} χ_{W,w}(a_w), where a_w is the upper-left Iwasawa entry of g_w and χ_W is the quadratic character of the discriminant of W. The characters are trivial when the complement has square discriminant, e.g. for quaternionic complements. As printed (without the characters), the identity holds only where every χ_{W,w}(a_w) = 1.

Direct prerequisites: [GZ.6/colmez-pseudo-theta](#colmez-pseudo-theta), `MetaplecticAutomorphicForms:MP.5`, `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Factor the archimedean Gaussian/weight terms and retain the full adelic δ. At finite places outside S′, splitting V = V_i ⊕ V_i^⊥ contributes χ_{V_i^⊥}(a(g)) as well as δ^{(d−d_i)/2}. Choose a common stabilizer K_{S′} at the exceptional places. Compare the V1 theta series and the truncated V0 term on K_{S′}GL2(A^{S′}); omit a discriminant character only where it is actually trivial.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §6.2, equation (6.2.1), p. 581.

<a id="colmez-pseudo-automorphic"></a>

### Automorphic sum reduces to nondegenerate outer theta

**GZ.6/colmez-pseudo-automorphic** · theorem · `colmez_pseudo_automorphic`

Let {A_ℓ^{(S_ℓ)}}_ℓ be a finite set of nonsingular pseudo-theta series, A_ℓ sitting on V_{ℓ,0} ⊂ V_{ℓ,1} ⊂ V_ℓ. The positive definite even-dimensional F-quadratic spaces V_ℓ, the sets S_ℓ and the unit groups µ_ℓ may depend on ℓ. If Σ_ℓ A_ℓ(g) is automorphic on GL2(A), then Σ_ℓ A_ℓ = Σ_{ℓ∈L_{0,1}} θ_{A_ℓ,1}, where L_{0,1} = {ℓ : V_{ℓ,1} = V_ℓ}. Proof: Vandermonde in the values (1+iN)^{−[F:Q]} for distinct POSITIVE sufficiently divisible N (E12).

Direct prerequisites: [GZ.6/colmez-pseudo-comparison](#colmez-pseudo-comparison), `mathlib:Matrix.det_vandermonde`, `AutomorphicFormsOnReductiveGroups:AF.1`.

Construction/proof: 1. Separate codimension powers using weak approximation and a Vandermonde system; choose distinct positive integral lower-unipotent parameters, not arbitrary distinct integers.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Lemma6.1(1) pp582–583.

<a id="colmez-pseudo-weight-cancel"></a>

### Positive-codimension theta cancellation

**GZ.6/colmez-pseudo-weight-cancel** · theorem · `colmez_pseudo_weight_cancel`

Under the hypotheses of Lemma 6.1, suppose that for each k > 0 the orthogonal complements V_ℓ ⊖ V_{ℓ,1} (ℓ ∈ L_{k,1}) and V_ℓ ⊖ V_{ℓ,0} (ℓ ∈ L_{k,0}) all have the same quadratic discriminant character. Then Σ_{ℓ∈L_{k,1}} θ_{A_ℓ,1} − Σ_{ℓ∈L_{k,0}} θ_{A_ℓ,0} = 0, where L_{k,1} = {ℓ : dim V_ℓ − dim V_{ℓ,1} = k} and L_{k,0} = {ℓ : dim V_ℓ − dim V_{ℓ,0} = k}. Without the hypothesis the proof gives only the character-twisted identity on GL2(A_f^S).

Hypotheses: Within each positive codimension all complements have the same discriminant character..

Direct prerequisites: [GZ.6/colmez-pseudo-automorphic](#colmez-pseudo-automorphic).

Construction/proof: 1. Apply pseudo-comparison including its discriminant characters. Choose distinct positive sufficiently divisible N so |(1+iN)^{−[F:Q]}| are distinct; the Vandermonde argument isolates the character-twisted coefficient in each codimension. The common quadratic character hypothesis in that codimension permits cancellation of that nonzero factor to give the stated untwisted theta identity. Without it keep only the twisted identity. The §9 application has common character η in codimension two and trivial character in codimension four.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Lemma6.1(2) pp582–583.

<a id="mixed-theta-eisenstein"></a>

### Mixed theta–Eisenstein kernel

**GZ.6/mixed-theta-eisenstein** · construction · `mixedThetaEisenstein`

Let B be a totally definite incoherent quaternion algebra over A = A_F with E_A → B, and φ ∈ S̄(B×A^×) invariant under U×U. Then I(s,g,φ)_U = Σ_{u∈µ_U²\F^×} Σ_{γ∈P^1(F)\SL2(F)} δ(γg)^s Σ_{x1∈E} r(γg)φ(x1,u). For φ = φ1⊗φ2 with respect to B = E_A ⊕ E_A j, I(s,g,φ)_U = Σ_u θ(g,u,φ1)E(s,g,u,φ2), where θ(g,u,φ1) = Σ_{x1∈E} r(g)φ1(x1,u) and E(s,g,u,φ2) = Σ_γ δ(γg)^s r(γg)φ2(0,u). By incoherence I(0,g,φ) = 0.

Direct prerequisites: `MetaplecticAutomorphicForms:MP.5`, `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Use the E⊕E𝔧 orthogonal decomposition and the imported theta/Eisenstein families. 2. Continue the absolutely convergent initial series meromorphically; apply incoherence for its central zero.

Uses: Yuan–Zhang 2018 §7.1, pp. 583–584 (from [YZZ13, §5.1.1]); vanishing I(0,g,φ) = 0 stated in §1.3, p. 540 — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `mixedThetaEisenstein_constructor` | The unit-quotient sum over P¹(F)∖SL₂(F) and x₁∈E. |
| `mixedThetaEisenstein_tensor_factorization` | For φ=φ₁⊗φ₂ the kernel is Σu θ(g,u,φ₁)E(s,g,u,φ₂). |
| `mixedThetaEisenstein_linear` | The kernel and its meromorphic continuation are linear in φ. |
| `mixedThetaEisenstein_central_zero` | I(0,g,φ)=0 for incoherent data. |

| Test | Kind | Exact expectation |
|---|---|---|
| `mixedThetaEisenstein_zero_schwartz` | degenerate | For φ=0 the meromorphic family is zero. |
| `mixedThetaEisenstein_tensor_components` | characterisation | For a pure tensor the theta factor uses E and the Eisenstein factor its orthogonal line. |
| `mixedThetaEisenstein_incoherent_central_value` | compatibility | The central family value is zero, while its derivative need not be zero. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.1, pp. 583–584 (from [YZZ13, §5.1.1]); vanishing I(0,g,φ) = 0 stated in §1.3, p. 540.

<a id="colmez-whittaker"></a>

### Normalized local Whittaker terms

**GZ.6/colmez-whittaker** · construction · `normalizedWhittaker`

For a place v, a ∈ F_v, u ∈ F_v^× and φ_{2,v} ∈ S̄(E_v𝔧_v×F_v^×), put W_{a,v}(s,g,u,φ_{2,v}) = ∫_{F_v} δ(wn(b)g)^s r(wn(b)g)φ_{2,v}(0,u) ψ_v(−ab) db. For a ∈ F_v^×, W°_{a,v} = γ_{u,v}^{−1}W_{a,v}, where γ_{u,v} is the Weil index of (E_v𝔧_v, uq). For a = 0, W°_{0,v}(s,g,u,φ_{2,v}) = γ_{u,v}^{−1}·(L(s+1,η_v)/L(s,η_v))·|D_v|^{−1/2}|d_v|^{−1/2}·W_{0,v}(s,g,u,φ_{2,v}), with D_v the relative discriminant of E_v/F_v and d_v the local different of F_v. Then W°_{0,v}(0,g,u) = r(g)φ_{2,v}(0,u) for all v, and W°_{0,v}(s,g,u) = δ_v(g)^{−s}r(g)φ_{2,v}(0,u) for almost all v and for every archimedean v. Globally W_0(s,g,u) = −(L(s,η)/L(0,η))/(L(s+1,η)/L(1,η))·∏_v W°_{0,v}(s,g,u), since ∏_vγ_{u,v} = −1 for incoherent B.

Direct prerequisites: `AutomorphicSpectralTheory:AS.2`, `AutomorphicLFunctionsAndLocalFactors:AL.1`.

Construction/proof: 1. Take the Fourier integral with the source’s self-dual measure. 2. Apply the local intertwiner and Weil-index normalization separately to nonzero and zero Fourier indices; use its value at s=0 and the incoherent product sign.

Uses: Yuan–Zhang 2018 §7.1 pp584–586; §7.3 pp599–600 — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `normalizedWhittaker_constructor` | Normalize the Fourier integral separately at a≠0 and a=0. |
| `normalizedWhittaker_zero_value` | W°₀,v(0,g,u)=r(g)φ₂,v(0,u). |
| `normalizedWhittaker_nonzero_index` | For a≠0 only the inverse Weil index changes the raw integral. |
| `normalizedWhittaker_zero_index` | At a=0 include L(s+1,ηv)/L(s,ηv), \|Dv\|⁻¹/² and \|dv\|⁻¹/². |

| Test | Kind | Exact expectation |
|---|---|---|
| `normalizedWhittaker_standard_zero` | computation | At standard almost-all-place data W°₀,v(s,g,u)=δv(g)⁻s r(g)φ₂,v(0,u). |
| `normalizedWhittaker_zero_branch` | non-example | Omitting the zero-index L-factor fails W°₀,v(0,g,u)=r(g)φ₂,v(0,u). |
| `normalizedWhittaker_incoherent_product_sign` | characterisation | The product of local Weil indices is −1, hence the global zero coefficient carries the minus sign. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.1 pp584–586; §7.3 pp599–600.

<a id="colmez-torus-average"></a>

### Finite CM orbit average

**GZ.6/colmez-torus-average** · construction · `cmOrbitAverage`

CU=E*\Ef*/(Ef*∩U); integrate a function on CU using |CU|^−1Σ, not its unnormalized trace. The factor e=[OE*:OF*] is separate.

Direct prerequisites: `HilbertModularVarietiesAndShimuraCurves:R18.5`, [GZ.0/trace-versus-average](#trace-versus-average).

Construction/proof: 1. Use the finite CM class quotient and its counting probability measure. 2. Check quotient invariance and compare its cardinality with the unnormalized sum, keeping the independent elliptic unit index.

Uses: Yuan–Zhang 2018 §7.1 p585;§8.1 pp606–609 — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `cmOrbitAverage_constructor` | Average a function over the finite quotient C_U. |
| `cmOrbitAverage_constant` | The average of a constant c is c. |
| `cmOrbitAverage_representative_independent` | A quotient-invariant function has representative-independent average. |
| `cmOrbitAverage_trace` | Unnormalized orbit sum equals \|C_U\| times the average. |

| Test | Kind | Exact expectation |
|---|---|---|
| `cmOrbitAverage_constant_one` | computation | The average of 1 is 1 even when \|C_U\|>1. |
| `cmOrbitAverage_singleton` | degenerate | On a singleton quotient averaging is evaluation. |
| `cmOrbitAverage_unit_index_separate` | non-example | The elliptic index e=[O_E×:O_F×] is not the orbit cardinality and cannot replace \|C_U\|. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.1 p585;§8.1 pp606–609.

<a id="colmez-local-k-c"></a>

### Local derivative and zero-term corrections

**GZ.6/colmez-local-k-c** · construction · `localDerivativeCorrection`

At nonsplit v define kφv from L(1,ηv)/vol(Ev¹) times φ1,v and the derivative of W° at a=u q(y2), with y∈B(v)−E. Define cφv from the normalized zero Whittaker derivative plus logδ(g)φ; extend general φ by fiberwise integration/linearity.

Direct prerequisites: [GZ.6/colmez-whittaker](#colmez-whittaker), [GZ.7/colmez-norm-shells](#colmez-norm-shells).

Construction/proof: 1. Differentiate the separately normalized local Whittaker integrals and extend from pure tensors by linearity. 2. Use the shell expressions for coherent integral formulas and the local P-action for covariance.

Uses: Yuan–Zhang 2018 §7.1, pp. 585–586 (k p. 585, c p. 586); coherent formulas valid for all φ_v in §7.3, pp. 594 and 600 — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `localDerivativeCorrection_constructor` | The nearby nonzero-index derivative k and the zero-index correction c. |
| `localDerivativeCorrection_pure_tensor` | k=L(1,ηv)/vol(Ev¹) times φ₁,v and W°′ at uq(y₂). |
| `localDerivativeCorrection_linear` | Both corrections extend linearly from pure tensors. |
| `localDerivativeCorrection_zero_correction` | c contains W°′₀,v plus logδv times r(g)φv. |

| Test | Kind | Exact expectation |
|---|---|---|
| `localDerivativeCorrection_zero_function` | degenerate | Both corrections vanish for the zero Schwartz function. |
| `localDerivativeCorrection_arch_zero` | compatibility | For the standard archimedean Gaussian, c=0. |
| `localDerivativeCorrection_different_index` | non-example | Substituting the a≠0 normalization at a=0 omits its L-ratio and gives the wrong correction. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.1, pp. 585–586 (k p. 585, c p. 586); coherent formulas valid for all φ_v in §7.3, pp. 594 and 600.

<a id="colmez-projected-derivative"></a>

### Projected derivative decomposition

**GZ.6/colmez-projected-derivative** · theorem · `colmez_projected_derivative`

Let F be totally real, E/F a totally imaginary quadratic extension with character η, B a totally definite incoherent quaternion algebra over A_F with E_A → B, U ⊂ B_f^× open compact, and φ ∈ S̄(B×A^×) invariant under U×U, standard at every archimedean place, satisfying Assumption 7.1. Then Pr I′(0,g,φ)_U = −Σ_{v|∞} I′(0,g,φ)(v) − Σ_{v∤∞ nonsplit in E} I′(0,g,φ)(v) − c1·Ω_φ(g) − Σ_{v∤∞} Σ_{u∈µ_U²\F^×} Σ_{y∈E^×} c_{φ_v}(g,y,u) r(g)φ^v(y,u) + Σ_{u∈µ_U²\F^×} Σ_{y∈E^×} (2 log δ_f(g_f) + log|uq(y)|_f) r(g)φ(y,u). Here Ω_φ(g) = Σ_{u∈µ_U²\F^×}Σ_{y∈E^×} r(g)φ(y,u), and I′(0,g,φ)(v) = 2⨍_{C_U} K^{(v)}_φ(g,(t,t))dt is the normalized average over C_U = E^×\E^×(A_f)/(E^×(A_f)∩U). For v|∞, K^{(v)}_φ(g,(t1,t2)) = w_U Σ_{a∈F^×} lim_{s→0} Σ_{y∈µ_U\(B(v)^×_+ − E^×)} r(g,(t1,t2))φ(y)_a k_{v,s}(y), with k_{v,s}(y) = Γ(s+1)/(2(4π)^s)·∫_1^∞ dt/(t(1−λ(y)t)^{s+1}) and λ(y) = q(y2)/q(y) ∈ F_v. For finite nonsplit v, K^{(v)}_φ(g,(t1,t2)) = Σ_u Σ_{y∈B(v)−E} k_{r(t1,t2)φ_v}(g,y,u) r(g,(t1,t2))φ^v(y,u), with k_{φ_v}(g,y,u) = (L(1,η_v)/vol(E_v^1))·r(g)φ_{1,v}(y1,u)·W°′_{uq(y2),v}(0,g,u,φ_{2,v}) (y2 ≠ 0) for φ_v = φ_{1,v}⊗φ_{2,v}, extended linearly. c1 = 2L′_f(0,η)/L_f(0,η) + log|d_E/d_F|, with L_f the finite part and d_E, d_F absolute discriminants. c_{φ_v}(g,y,u) = r_E(g)φ_{1,v}(y,u)W°′_{0,v}(0,g,u,φ_{2,v}) + log δ(g_v)r(g)φ_v(y,u) for pure tensors, extended linearly.

Direct prerequisites: [GZ.6/mixed-theta-eisenstein](#mixed-theta-eisenstein), [GZ.6/colmez-local-k-c](#colmez-local-k-c), `AutomorphicSpectralTheory:AS.4`, [GZ.7/colmez-s2-assumption](#colmez-s2-assumption).

Construction/proof: 1. Differentiate the incoherent Fourier expansion, use YZZ holomorphic projection and the archimedean logarithmic integral, removing exactly the global gamma derivative. E10 fixes the intermediate c2 bookkeeping.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.1, Theorem 7.2, p. 588; proof pp. 589–590.

<a id="colmez-series-automorphy"></a>

### Automorphy and cuspidality of the height series

**GZ.6/colmez-series-automorphy** · theorem · `colmez_series_automorphy`

For φ ∈ S(𝔹×A^×) invariant under U×U (|Σ| > 1), the series Z(g,φ)_U is absolutely convergent and is an automorphic form in g ∈ GL2(A) with coefficients in Pic(X_U×X_U)_C (Theorem 8.1 = [YZZ13, Th. 3.17]). Consequently, for t1,t2 ∈ E^×(A_f), the height series Z(g,(t1,t2),φ)_U = ⟨Z(g,φ)_U t1°, t2°⟩_NT is an automorphic form, and it is a cusp form by [YZZ13, Lemma 3.19].

Direct prerequisites: [GZ.6/picard-generating-series](#picard-generating-series), [GZ.6/arithmetic-height-kernel](#arithmetic-height-kernel).

Construction/proof: 1. Import the genuine Picard-valued modularity theorem, then apply the degree-zero height functional; original YZZ proof leaves remain open.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §8.1, Theorem 8.1, p. 606 (= [YZZ13, Theorem 3.17]); cuspidality of the height series: §8.1, p. 607 (= [YZZ13, Lemma 3.19]).

<a id="colmez-rev-derivative-of-the-mixed-theta"></a>

### Derivative of the mixed theta–Eisenstein series before projection

**GZ.6/colmez-rev-derivative-of-the-mixed-theta** · theorem · `colmez_rev_derivative_of_the_mixed_theta`

For φ ∈ S̄(B×A^×) invariant under U×U (B incoherent): W_0(s,g,u) = −(L(s,η)/L(0,η))/(L(s+1,η)/L(1,η))·∏_v W°_{0,v}(s,g,u), with L(s,η) completed. This gives the analytic continuation of the constant term. Moreover I′(0,g,φ) = −Σ_{v nonsplit} I′(0,g,φ)(v) − c0 Σ_{u∈µ_U²\F^×}Σ_{y∈E} r(g)φ(y,u) − Σ_v Σ_u Σ_{y∈E} c_{φ_v}(g,y,u) r(g)φ^v(y,u) + 2 log δ(g) Σ_u Σ_{y∈E} r(g)φ(y,u), where c0 = d/ds|_{s=0} log(L(s,η)/L(s+1,η)) = 2L′(0,η)/L(0,η) + log|d_E/d_F|, by L(1−s,η) = |d_E/d_F|^{s−1/2}L(s,η). Only finitely many v contribute.

Direct prerequisites: [GZ.6/mixed-theta-eisenstein](#mixed-theta-eisenstein), [GZ.6/colmez-whittaker](#colmez-whittaker), [GZ.6/colmez-local-k-c](#colmez-local-k-c), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Construction/proof: 1. Differentiate the completed global zero coefficient product and the nonzero Fourier terms separately. 2. Use the quadratic functional equation for c₀ and the finite bad-place support of normalized local corrections.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.1, 'Decomposition of the constant term', pp. 585–586 (from [YZZ13, §6.1.2, Prop. 6.7]).

<a id="colmez-rev-archimedean-holomorphic-projection-of-log"></a>

### Archimedean holomorphic projection of log δ∞·W^(2)

**GZ.6/colmez-rev-archimedean-holomorphic-projection-of-log** · theorem · `colmez_rev_archimedean_holomorphic_projection_of_log`

Let W^(2)(g_∞) = ∏_{v|∞} W_v^(2), with W_v^(2)(diag(y,1)) = y e^{−2πy}1_{y>0}. Under the holomorphic-projection formula of [YZZ13, Prop. 6.12], whose per-place factor is 4π lim_{s→0}∫_0^∞ y^s W(y) W^(2)(y) dy/y² (so that W^(2) projects to itself), log δ_v(g_v)·W^(2)(g_∞) projects to −(1/2)(γ+log 4π)·W^(2)(g_∞). Hence log δ∞(g)W^(2)(g_∞) projects to c2·W^(2)(g_∞) with c2 = −([F:Q]/2)(γ+log 4π). Consequently c1 = c0 − 2c2 = 2L′(0,η)/L(0,η) + log|d_E/d_F| + [F:Q](γ+log 4π) = 2L′_f(0,η)/L_f(0,η) + log|d_E/d_F|, using L_∞(s,η) = Γ_ℝ(s+1)^{[F:Q]} and L′_∞/L_∞(0,η) = −([F:Q]/2)(γ+log 4π).

Direct prerequisites: `AutomorphicSpectralTheory:AS.4`, [GZ.6/colmez-rev-derivative-of-the-mixed-theta](#colmez-rev-derivative-of-the-mixed-theta).

Construction/proof: 1. Apply the regularized weight-two Whittaker projection at each real place. 2. Evaluate 2π∫₀∞e^(−4πy)log y dy=−(γ+log4π)/2 and add the real places. 3. Remove the completed gamma logarithmic derivative to obtain the finite-part L constant.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.1, proof of Theorem 7.2, pp. 589–590.

<a id="colmez-rev-local-whittaker-series-for-incoherent"></a>

### Local Whittaker series for incoherent sections

**GZ.6/colmez-rev-local-whittaker-series-for-incoherent** · theorem · `colmez_rev_local_whittaker_series_for_incoherent`

Let v be finite, u ∈ O_{F_v}^× and φ_{2,v} ∈ S̄(E_v𝔧_v×F_v^×). For a ∈ F_v^×: W°_{a,v}(s,1,u,φ_{2,v}) = |d_v|^{1/2}(1−N_v^{−s}) Σ_{n≥0} N_v^{−ns+n} ∫_{D_n(a)} φ_{2,v}(x2,u)dx2. For a = 0: W_{0,v}(s,1,u,φ_{2,v}) = γ_{u,v}|d_v|^{1/2}(1−N_v^{−s}) Σ_{n≥0} N_v^{−ns+n} ∫_{D_n} φ_{2,v}(x2,u)d_ux2. Here dx2 is the self-dual measure for (E_v𝔧_v, uq), with vol(O_{E_v}𝔧_v) = |D_v|^{1/2}|d_v u q(𝔧_v)|; YZZ13 Prop. 6.10(1) as stated is correct only for a ≠ 0. Hence, for every φ_v and extending linearly: k_{φ_v}(1,y,u) = (L(1,η_v)/vol(E_v^1))·d/ds|_{s=0}[|d_v|^{1/2}(1−N_v^{−s})Σ_n N_v^{−ns+n}∫_{D_n(a)} φ_v(y1+x2,u)dx2] with a = uq(y2); and c_{φ_v}(1,y,u) = d/ds|_{s=0}[|D_v|^{−1/2}(L(s+1,η_v)/L(s,η_v))(1−N_v^{−s})Σ_n N_v^{−ns+n}∫_{D_n} φ_v(y+x2,u)d_ux2].

Direct prerequisites: [GZ.6/colmez-whittaker](#colmez-whittaker), [GZ.7/colmez-norm-shells](#colmez-norm-shells), `AutomorphicLFunctionsAndLocalFactors:AL.1`.

Construction/proof: 1. Expand the Whittaker integral by additive-character conductor shells. 2. For a≠0 use finite opposite-norm support; for a=0 retain the additional local L-ratio before differentiating.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.3, pp. 593–594 (a ≠ 0) and pp. 599–600 (a = 0, correcting [YZZ13, Prop. 6.10(1)]).

<a id="colmez-rev-hodge-class-terms-vanish-and"></a>

### Hodge-class terms vanish and the height series splits into horizontal and vertical parts

**GZ.6/colmez-rev-hodge-class-terms-vanish-and** · theorem · `colmez_rev_hodge_class_terms_vanish_and`

Let (B,E,U) be as in §7.2 with |Σ| > 1, and let φ be U×U-invariant and satisfy Assumption 7.1. For each fixed coefficient/intersection calculation, first fix the finite collection of CM points and supports entering Z_*(g)t1 and t2 (and any finite C_U averages used). Choose a finite extension H/F defining these points and supports, unramified above Σ(𝔹_f), by taking a finite compositum of their permitted fields of definition. This is a coefficientwise choice, not one field defining all of the varying-conductor set CM_U. A single field may be chosen for the finite orbit C_U. The model X_{U,O_H} is Q-factorial by Corollary 4.6; use ξ̂-admissible arithmetic extensions on it ([YZZ13, §7.1.6]). For any further permitted finite extension H′/H, arithmetic degrees/intersection pairings scale by [H′:H]; hence their values divided by [H:F] are independent of the chosen H and agree after passing to a common permitted compositum. Assemble the height series coefficientwise using these normalized pairings. For t1,t2 ∈ C_U, Z(g,(t1,t2))_U = ⟨Z_*(g)t1,t2⟩ − ⟨Z_*(g)t1,ξ_{t2}⟩ − ⟨Z_*(g)ξ_{t1},t2⟩ + ⟨Z_*(g)ξ_{t1},ξ_{t2}⟩; the last three terms vanish by Assumption 7.1, so Z = ⟨Z_*t1,t2⟩ = −i(Z_*t1,t2) − j(Z_*t1,t2). Here i comprises finite horizontal intersections and archimedean Green values, and j is the vertical part. In the paper’s F-relative normalization j = Σ_v j_v log N_v, with log N_v = 1 at real v, and j_v = ∫_{C_U} j̄_v(Z_*(g)tt1,tt2)dt; likewise i_v = ∫_{C_U} ī_v. The C_U integrals are normalized finite-orbit averages. Local base-change scaling includes ramification and residue-degree weights; it is the total weighted pairing divided by [H:F] that is invariant.

Direct prerequisites: `HilbertModularVarietiesAndShimuraCurves:R18.5`, [GZ.7/colmez-s2-assumption](#colmez-s2-assumption), [GZ.6/arithmetic-height-kernel](#arithmetic-height-kernel), [GZ.2/admissible-arithmetic-extension](#admissible-arithmetic-extension).

Construction/proof: 1. For each finite support use the pointwise field-of-definition statement rev-cm-points-on-x-u and its finite compositum, preserving unramifiedness above the division places. Use qfactorial and the ξ̂-admissible extension construction. 2. Compare two choices of H over a common permitted compositum. Pullback of the arithmetic pairing multiplies its arithmetic degree by the extension degree, with local ramification/residue-degree weights and archimedean multiplicities. Divide by the degree over F; this proves coefficientwise independence and permits assembly without a common field for CM_U. 3. Apply the two S2 vanishing conditions to the three Hodge-class cross terms; decompose the remaining admissible pairing into horizontal and vertical terms. Take the normalized average over the finite C_U orbit and keep log N_v = 1 at real v.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §8.1, pp. 607–608 ([YZZ13, Prop. 7.5]).

<a id="classical-partial-rankin-series"></a>

### Ideal-class Rankin series

**GZ.6/classical-partial-rankin-series** · definition · `partialRankin`

(5.3) For f = Σ a_n qⁿ in the new space and 𝒜 ∈ Cl_K: L_𝒜(f, s) = Σ_{n≥1, (n, DN)=1} ε(n) n^{1−2s} · Σ_{n≥1} a_n r_𝒜(n) n^{−s}. The first factor is L(2s − 1, ε) with the Euler factors at all p | N removed (not removed in the announcement [17], which is in error; there it was denoted L_σ(f, s)). For weight 2k (§9, Chapter IV (0.1)): n^{1−2s} is replaced by n^{2k−1−2s}.

Direct prerequisites: `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AnalyticNumberTheory:AN.4`, `MetaplecticAutomorphicForms:MP.7`.

Construction/proof: 1. Form the ideal-class norm coefficients and multiply their Dirichlet series by the quadratic L-factor with the p|N factors removed. 2. Use the finite character orthogonality relations to compare with character-indexed series; the local bad-factor identification is a separate AL.3 input.

Uses: Gross–Zagier 1986 Chapter I, §5, (5.3), p. 229; §9, p. 233; Chapter IV, (0.1), p. 267 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.6 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `partialRankin` | L_A(f,s)=L^(N)(2s−2k+1,ε) Σ a(n)r_A(n)n^(−s). |
| `partialRankin_character_sum` | Σ_A χ(A)L_A(f,s)=L(f,χ,s), with the bad Euler factors of the normalization comparison. |
| `partialRankin_fourier_inverse` | L_A=h⁻¹Σ_χ χ(A)⁻¹L(f,χ,s). |
| `partialRankin_removed_factors` | L^(N)(t,ε)=L(t,ε)Π_{p\|N}(1−ε(p)p^(−t)). |

| Test | Kind | Exact expectation |
|---|---|---|
| `partialRankin_trivial_character` | compatibility | Σ_A L_A=L(f,1_K,s). |
| `partialRankin_bad_prime` | non-example | At p\|N the factor 1−ε(p)p^(1−2s) is present in weight two; restoring its inverse changes the series. |
| `partialRankin_basis_indicator` | characterisation | The inverse finite character transform selects A and no other class. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §5, (5.3), p. 229; §9, p. 233; Chapter IV, (0.1), p. 267.

<a id="classical-absolute-convergence"></a>

### Rankin absolute convergence

**GZ.6/classical-absolute-convergence** · theorem · `gz86_absolute_convergence`

The series defining L_𝒜(f, s) and the Euler product of L(f, χ, s) converge absolutely in the half-plane Re(s) > 3/2.

Direct prerequisites: [GZ.6/classical-partial-rankin-series](#classical-partial-rankin-series), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Construction/proof: 1. Use absolute convergence of the ideal-class theta coefficients and cusp-form coefficient bounds to justify multiplying the two Dirichlet series. 2. The half-plane is Re(s)>k+1/2; no rearrangement at the central point is used.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §5, p. 229 ('It is not difficult to show'; no proof given).

<a id="classical-entire-functional-equation"></a>

### Completed Rankin functional equation

**GZ.6/classical-entire-functional-equation** · theorem · `gz86_entire_functional_equation`

Under the standing hypotheses (in particular D ≡ □ mod 4N, so ε(N) = 1), for f in the new space of weight 2 on Γ₀(N) (normalized eigenform for L(f, χ, s)), the functions L_𝒜(f, s) and L(f, χ, s) have analytic continuations to the entire s-plane, satisfy functional equations under s ↦ 2 − s, and vanish at s = 1. Precisely (Chapter IV (0.2) with k = 1): L*_𝒜(f, s) := (2π)^{−2s} N^s |D|^s Γ(s)² L_𝒜(f, s) = −ε(N) L*_𝒜(f, 2 − s), and −ε(N) = −1.

Direct prerequisites: [GZ.0/classical-rankin-normalization](#classical-rankin-normalization), [GZ.6/classical-l-functional-equation](#classical-l-functional-equation).

Construction/proof: 1. Pair the continued kernel with newforms and use its coefficient functional equation. 2. The completed factor is (2π)^(-2s)(N|D|)^sΓ(s)^2; reflection s↦2k−s has sign −ε(N).

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §5, (5.5) Proposition, p. 229; proved in Chapter IV: continuation via Rankin's method (§1, Proposition (1.2)), functional equation (0.2) proved in §4, pp. 282–283 ('This completes the proof of the functional equation').

<a id="classical-height-series-cuspidality"></a>

### Hecke height-series cuspidality

**GZ.6/classical-height-series-cuspidality** · theorem · `gz86_height_series_cuspidality`

Under classical notation C1: Then the series g_𝒜(z) = Σ_{m≥1} ⟨c, T_m c^σ⟩ e^{2πimz} is a cusp form of weight 2 on Γ₀(N).

Direct prerequisites: `HeightsRationalPointsAndObstructions:RP.0`, `ModularCurvesPartII:R14.2`, `ModularCurvesPartII:R14.5`.

Construction/proof: 1. Apply the imported Hecke-equivariant Jacobian/local-height pairing to the finite-dimensional Hecke module. 2. Use the perfect Fourier-coefficient pairing of the Hecke algebra and weight-two cusp forms to produce the series with coefficient ⟨a,T_m b⟩. This imports Mordell–Weil and the Jacobian instead of defining either again.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §6, (6.1) Theorem, p. 230; proved in Chapter V, §1, p. 306 (formal argument: for any ℚ-linear α: 𝕋 → ℂ, Σ α(T_m) qᵐ ∈ S₂(Γ₀(N)), via the perfect pairing 𝕋 × S₂(Γ₀(N), ℚ) → ℚ, (T, f) ↦ a₁(Tf); here α(T) = ⟨c, T c^σ⟩); `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter V, §1, p. 306 (proof of the first assertion of Theorem (6.1) of Chap. I).

<a id="classical-disjointness"></a>

### CM Hecke disjointness criterion

**GZ.6/classical-disjointness** · theorem · `gz86_disjointness`

Under classical notation C1: Let m ≥ 1 with (m, N) = 1. The divisors c = (x) − (∞) and T_m d^σ = T_m(x^σ) − T_m(0) are relatively prime if and only if N > 1 and r_𝒜(m) = 0.

Direct prerequisites: [GZ.6/cm-degree-zero-class](#cm-degree-zero-class), `HeegnerPointEulerSystems:HE.0`.

Construction/proof: 1. Identify a common CM point in the determinant-m Hecke orbit with an integral O_K-ideal of norm m in the corresponding Artin class. 2. Count the automorphisms modulo ±1; for N>1 the two cusp subtractions are distinct and cause no additional CM intersection.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §9, (9.1) Proposition, p. 232 ('it is easy to show'); refined in Chapter III, (4.3) Proposition, p. 258 (the multiplicity of x in T_m x^σ is r_𝒜(m), m prime to N) and Chapter II §5, p. 249.

<a id="classical-rankin-unfolding"></a>

### Classical Rankin unfolding

**GZ.6/classical-rankin-unfolding** · theorem · `gz86_rankin_unfolding`

Under classical notation C4: Let f = Σ a(n)qⁿ ∈ S_{2k}(Γ₀(N)) (any cusp form) and M = N|D|. For Re(s) large, Γ(s+2k−1)(4π)^{−s−2k+1} L_𝒜(f, s+2k−1) = ∬_𝓕 f(z) \overline{θ_𝒜(z) E_s̄(z)} y^{2k} dxdy/y² = (f, θ_𝒜 E_s̄)_{Γ₀(M)}, with E_s as in the referenced classical source result 179 and 𝓕 a fundamental domain for Γ₀(M). Proof as printed: Γ(s+2k−1)(4π)^{−s−2k+1} Σ a(n)r_𝒜(n)n^{−s−2k+1} = ∬_{Γ_∞\ℌ} f \overline{θ_𝒜} y^{s+2k} dxdy/y². Then write Γ_∞\ℌ = ∪_{γ ∈ Γ_∞\Γ₀(M)} γ𝓕, use the transformation laws of f and θ_𝒜 under Γ₀(M), and interchange sum and integral.

Direct prerequisites: [GZ.6/classical-partial-rankin-series](#classical-partial-rankin-series), `AutomorphicSpectralTheory:AS.2`, `MetaplecticAutomorphicForms:MP.7`.

Construction/proof: 1. Unfold against the level-N Eisenstein family in its absolute-convergence region. 2. Integrate each Fourier exponential to obtain the Γ(s+2k−1)/(4π)^(s+2k−1) factor; keep the kernel and L-series parameters distinct.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §1, pp. 270–271.

<a id="classical-trace-adjunction"></a>

### Classical trace adjunction

**GZ.6/classical-trace-adjunction** · theorem · `gz86_trace_adjunction`

For N | M, f ∈ S_{2k}(Γ₀(N)) and g ∈ M̃_{2k}(Γ₀(M)): (f, g)_{Γ₀(M)} = (f, Tr^M_N g)_{Γ₀(N)}. Consequently (4π)^{−s−2k+1}Γ(s+2k−1)L_𝒜(f, s+2k−1) = (f, Tr^M_N(θ_𝒜 E_s̄))_{Γ₀(N)} for Re(s) large, with M = N|D|.

Direct prerequisites: `ModularCurvesPartII:R14.2`, `ModularCurvesPartII:R14.5`.

Construction/proof: 1. Use the trace coset decomposition and change variables in the Petersson integral. 2. Compare the index-normalized trace with the source unnormalized trace before applying adjunction.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §1, p. 271.

<a id="classical-mobius-level-decomposition"></a>

### Möbius level decomposition

**GZ.6/classical-mobius-level-decomposition** · theorem · `gz86_mobius_level_decomposition`

Under classical notation C4: With M = N|D| and E^{(1)}_s as in the referenced classical source result 185: E_s(z) = ½ Σ_{e|N} μ(e) Σ_{c,d∈ℤ, M|c, e|d} ε(d)(cz+d)^{−(2k−1)} y^s|cz+d|^{−2s} = Σ_{e|N} μ(e)ε(e) e^{−(2s+2k−1)} (N/e)^{−s} E^{(1)}_s(Nz/e). Only e squarefree and prime to D contribute. For e > 1 the term Tr^M_N(θ_𝒜(z)E^{(1)}_s(Nz/e)) has level N/e < N: any system of representatives of Γ₀(M)\Γ₀(N) is one of Γ₀(M/e)\Γ₀(N/e), because (e, D) = 1. Hence, for f ∈ S^new_{2k}(Γ₀(N)), those terms are orthogonal to f. For non-holomorphic terms this uses §5: the product of f with a non-holomorphic form equals its product with a holomorphic form of the same level.

Direct prerequisites: [GZ.6/classical-trace-adjunction](#classical-trace-adjunction), `ModularCurvesPartII:R14.5`.

Construction/proof: 1. Separate the level divisors by inclusion–exclusion. 2. Apply trace adjunction to the resulting oldform/newform terms, retaining the Möbius factor.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §1, pp. 271–272.

<a id="classical-rankin-kernel"></a>

### Classical Rankin kernel

**GZ.6/classical-rankin-kernel** · construction · `classicalRankinKernel`

Under classical notation C4: Φ̃_s(z) = Φ̃_{s,𝒜}(z) = Tr^{ND}_N(θ_𝒜(z) E^{(1)}_s(Nz)) ∈ M̃_{2k}(Γ₀(N)), where Tr^{ND}_N means Tr^{N|D|}_N (the referenced classical source result 182). Its Fourier expansion in x is Φ̃_s(z) = Σ_{m∈ℤ} A_m(s, y) e(mx) (1.3).

Direct prerequisites: `AutomorphicSpectralTheory:AS.2`, `MetaplecticAutomorphicForms:MP.7`, [GZ.6/classical-trace-adjunction](#classical-trace-adjunction), `AutomorphicFormsOnReductiveGroups:AF.1`.

Construction/proof: 1. Multiply the class theta series by the character-compatible Eisenstein family and trace from N|D| to N. 2. Check weight and cusp growth; the Fourier convolution has Nn+l=m|D|.

Uses: Gross–Zagier 1986 Chapter IV, (1.2) Proposition and (1.3), p. 272 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.6 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `classicalRankinKernel` | Tr_N^(N\|D\|)(θ_A(z)E_s^(1)(Nz)). |
| `classicalRankinKernel_trace` | The result has level N, weight 2k and polynomial cusp growth in its initial convergence region. |
| `classicalRankinKernel_fourier` | Its Fourier coefficient is the convolution with Nn+l=m\|D\|. |
| `classicalRankinKernel_class_dependence` | The construction is linear in the ideal-class theta series. |

| Test | Kind | Exact expectation |
|---|---|---|
| `classicalRankinKernel_level_one` | computation | For N=1 the trace still runs from level \|D\| to 1. |
| `classicalRankinKernel_negative_D` | non-example | The positive level is N\|D\|; ND<0 is shorthand, not a congruence subgroup level. |
| `classicalRankinKernel_zero_theta` | degenerate | Replacing θ_A by zero gives the zero kernel. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, (1.2) Proposition and (1.3), p. 272.

<a id="classical-rankin-kernel-pairing"></a>

### Rankin kernel pairing

**GZ.6/classical-rankin-kernel-pairing** · theorem · `gz86_rankin_kernel_pairing`

Under classical notation C4: Let D be a fundamental discriminant, N ≥ 1 prime to D, and define Φ̃_s = Φ̃_{s,𝒜} ∈ M̃_{2k}(Γ₀(N)) by Φ̃_s(z) = Tr^{ND}_N(θ_𝒜(z) E^{(1)}_s(Nz)), where θ_𝒜 is the theta series (1.1) and E^{(1)}_s(z) = ½ Σ_{c,d∈ℤ, D|c} ε(d)(cz+d)^{−(2k−1)} y^s|cz+d|^{−2s}. Then for every f ∈ S^new_{2k}(Γ₀(N)): (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_𝒜(f, s+2k−1) = (f, Φ̃_s̄), first for Re(s) large, with the Petersson product (f, g) = ∬_{Γ₀(N)\ℌ} f ḡ y^{2k} dxdy/y².

Direct prerequisites: [GZ.6/classical-rankin-unfolding](#classical-rankin-unfolding), [GZ.6/classical-mobius-level-decomposition](#classical-mobius-level-decomposition), [GZ.6/classical-rankin-kernel](#classical-rankin-kernel).

Construction/proof: 1. Combine the unfolded integral, trace adjunction and Möbius level decomposition. 2. For the newform subspace obtain the exact Rankin-kernel pairing with the stated gamma and level factors.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §1, (1.2) Proposition, p. 272.

<a id="classical-prime-to-level-detection"></a>

### Prime-to-level newform detection

**GZ.6/classical-prime-to-level-detection** · theorem · `gz86_prime_to_level_detection`

Under classical notation C4: Write Φ̃_s(z) = Σ_{m∈ℤ} A_m(s, y)e(mx) (1.3). The proof of (1.2) used only the orthogonality of f with forms of level strictly dividing N. f ∈ S^new_{2k}(Γ₀(N)) is also orthogonal to g(dz) for d > 1 and g of level dividing N/d, so in (1.2) only the A_m(s, y) with (m, N) = 1 are relevant. If Φ̃, Φ̃′ ∈ M̃_{2k}(Γ₀(N)) (with the growth of §5) have A_m = A′_m for all m prime to N, then (f, Φ̃) = (f, Φ̃′). In particular, the functional equation (0.2) and the formulas for L_𝒜(f, k) and L′_𝒜(f, k) reduce to identities for A_m(s, y), (m, N) = 1.

Direct prerequisites: `ModularCurvesPartII:R14.5`.

Construction/proof: 1. Use the Hecke algebra/Fourier-coefficient perfect pairing on the newform subspace. 2. Prime-to-N Hecke operators determine each newform component; do not extend the assertion to arbitrary oldforms.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §1, Remark after (1.2) and (1.3), p. 272.

<a id="classical-eisenstein-transformation"></a>

### Classical Eisenstein transformation

**GZ.6/classical-eisenstein-transformation** · theorem · `gz86_eisenstein_transformation`

Under classical notation C4: From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For γ = (a b; c d) ∈ SL₂(ℤ) with (c, D) = |D₂|, D₁D₂ = D, and c* an inverse of c (mod D₁) with c* ≡ 0 (mod D₂): (E^{(1)}_s|_{2k−1}γ)(z) = ε_{D₁}(c) ε_{D₂}(dδ₁) δ₁^{−s−2k+1} E^{(D₁)}_s((z + c*d)/δ₁), where (F|_{2k−1}γ)(z) = (cz+d)^{−(2k−1)}F(γz).

Direct prerequisites: `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Apply the Eisenstein transformation law with each ordered factorization D=D₁D₂. 2. Retain the κ(D₁) phase, especially κ= i for a negative discriminant.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §2, (2.2), pp. 273–274.

<a id="classical-trace-coset-classification"></a>

### Trace coset classification

**GZ.6/classical-trace-coset-classification** · theorem · `gz86_trace_coset_classification`

Under classical notation C4: From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. [Γ₀(N) : Γ₀(N|D|)] = Σ_{δ₁|δ} δ₁. The cosets Γ₀(N|D|)γ, γ = (a b; c d) ∈ Γ₀(N), are classified by δ₂ = (c, D) together with the residue class of c*d modulo δ₁ = δ/δ₂. So Tr^{ND}_N F = Σ_{D=D₁D₂} Σ_{j mod δ₁} F|_{2k}γ_{D₁,j}, where γ_{D₁,j} is any representative with (c, D) = δ₂ and c*d ≡ j (mod δ₁).

Direct prerequisites: `ModularCurvesPartII:R14.2`, [GZ.6/classical-trace-adjunction](#classical-trace-adjunction).

Construction/proof: 1. Classify the trace cosets by the denominator gcd and the source ramified divisor. 2. Use this finite decomposition to reorganize the level N|D| trace.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §2, p. 276.

<a id="classical-ramified-theta-reindexing"></a>

### Ramified theta reindexing

**GZ.6/classical-ramified-theta-reindexing** · theorem · `gz86_ramified_theta_reindexing`

Under classical notation C4: From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For every 1-periodic function f on ℌ: (f(z)θ_{𝒜𝒟₁}(z))|U_{δ₁} = (f(δ₂z)θ_{𝒜𝒟₁}(δ₂z))|U_δ = (f(δ₂z)θ_𝒜(z))|U_δ. The reason is that θ_{𝒜𝒟₁}(δ₂z) and θ_𝒜(z) have the same n-th Fourier coefficient for every n divisible by δ₂: r_{𝒜𝒟₁}(n/δ₂) = r_𝒜(n). This holds because 𝒜𝒟₁ = 𝒜𝒟₂ and every integral ideal of norm n (δ₂ | n) is 𝔡₂ times an integral ideal of norm n/δ₂.

Direct prerequisites: `MetaplecticAutomorphicForms:MP.7`, `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. Transform the theta series under the ramified ideal and cusp coset. 2. Reindex by multiplication with the different and use the genus character for the resulting class change.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §2, p. 276.

<a id="classical-eisenstein-combination"></a>

### Genus Eisenstein combination

**GZ.6/classical-eisenstein-combination** · construction · `genusEisensteinCombination`

Under classical notation C4: From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. ℰ_s(z) = Σ_{D=D₁·D₂} ε_{D₁}(N) χ_{D₁·D₂}(𝒜) / (κ(D₁)|D₁|^{s+2k−3/2}) · E^{(D₁)}_s(|D₂|z), the sum over all ordered decompositions (D₁, D₂) of D as a product of two fundamental discriminants (D_i = 1 allowed; (D₁, D₂) and (D₂, D₁) are different terms, so there are 2^t terms, t the number of prime factors of D). ℰ_s depends on N (in fact only on N mod D) and on 𝒜 (in fact only on the genus of 𝒜); the paper suppresses this in the notation.

Direct prerequisites: [GZ.0/classical-genus-character-factorization](#classical-genus-character-factorization), [GZ.6/classical-eisenstein-transformation](#classical-eisenstein-transformation), [GZ.6/classical-ramified-theta-reindexing](#classical-ramified-theta-reindexing), `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Sum over all ordered discriminant factorizations with their κ and genus factors. 2. The transformation formulas prove genus and residue-class dependence; ordered pairs must not be identified.

Uses: Gross–Zagier 1986 Chapter IV, §2, (2.4) Proposition and the note after it, pp. 276–277 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.6 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `genusEisensteinCombination` | The 2^t ordered D=D₁D₂ terms, with ε_D₁(N)χ_D₁D₂(A)/(κ(D₁)\|D₁\|^(s+2k−3/2)) factors. |
| `genusEisensteinCombination_genus` | Depends on A only through its genus. |
| `genusEisensteinCombination_level_residue` | Depends on N only modulo D. |
| `genusEisensteinCombination_prime` | For k=1,D=−p,ε(N)=1 it is E_s^(1)(pz)−i p^(−s−1/2)E_s^(D)(z). |

| Test | Kind | Exact expectation |
|---|---|---|
| `genusEisensteinCombination_prime_terms` | computation | A prime discriminant gives two ordered terms. |
| `genusEisensteinCombination_ordered` | non-example | Identifying (D₁,D₂) and (D₂,D₁) loses half the terms. |
| `genusEisensteinCombination_i_factor` | characterisation | Negative D₁ has κ(D₁)=i; replacing it by 1 changes the Fourier coefficients. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §2, (2.4) Proposition and the note after it, pp. 276–277.

<a id="classical-kernel-u-formula"></a>

### Rankin kernel U formula

**GZ.6/classical-kernel-u-formula** · theorem · `gz86_kernel_u_formula`

Under classical notation C4: From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. Assume (D, 2N) = 1. Then Φ̃_s(z) = Tr^{ND}_N(E^{(1)}_s(Nz)θ_𝒜(z)) from Proposition (1.2) equals (ℰ_s(Nz)θ_𝒜(z))|U_{|D|}, where ℰ_s(z) = Σ_{D=D₁·D₂} ε_{D₁}(N)χ_{D₁·D₂}(𝒜)/(κ(D₁)|D₁|^{s+2k−3/2}) E^{(D₁)}_s(|D₂|z), summed over all ordered decompositions (D₁, D₂) of D as a product of two fundamental discriminants (D_i = 1 allowed). χ_{D₁·D₂} is the corresponding genus character, κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0, and E^{(D₁)}_s is the Eisenstein series (2.1).

Direct prerequisites: [GZ.6/classical-rankin-kernel](#classical-rankin-kernel), [GZ.6/classical-trace-coset-classification](#classical-trace-coset-classification), [GZ.6/classical-ramified-theta-reindexing](#classical-ramified-theta-reindexing), [GZ.6/classical-eisenstein-combination](#classical-eisenstein-combination).

Construction/proof: 1. Apply the trace coset classification to the theta–Eisenstein product. 2. Use the ramified theta reindexing to obtain the U_|D| formula.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §2, (2.4) Proposition, p. 276.

<a id="classical-prime-eisenstein-combination"></a>

### Prime-discriminant Eisenstein formula

**GZ.6/classical-prime-eisenstein-combination** · theorem · `gz86_prime_eisenstein_combination`

Under classical notation C4: If k = 1, |D| = p is prime (so D = −p, p ≡ 3 mod 4) and ε(N) = 1, then ℰ_s(z) = E^{(1)}_s(pz) − i p^{−s−1/2} E^{(D)}_s(z) (printed with superscript (p); see PAPER-GROSS-ZAGIER-86/E33).

Direct prerequisites: [GZ.6/classical-eisenstein-combination](#classical-eisenstein-combination).

Construction/proof: 1. For a prime discriminant enumerate the two ordered factorization terms. 2. Insert ε(N)=1 and κ(D)=i to obtain the explicit difference.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §2, note after (2.4), p. 277.

<a id="classical-kernel-fourier-expansion"></a>

### Rankin kernel Fourier expansion

**GZ.6/classical-kernel-fourier-expansion** · theorem · `gz86_kernel_fourier_expansion`

Under classical notation C4: From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. Write ℰ_s(z) = Σ_{n∈ℤ} e_s(n, y) e(nx) (z = x+iy ∈ ℌ). Then Φ̃_{s,𝒜}(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_𝒜(l) e^{−2πly/δ} e((Nn+l)x/δ), with δ = |D|.

Direct prerequisites: [GZ.6/classical-kernel-u-formula](#classical-kernel-u-formula), [GZ.6/classical-genus-sign-function](#classical-genus-sign-function), [GZ.6/classical-eisenstein-zero-coefficient](#classical-eisenstein-zero-coefficient), [GZ.6/classical-eisenstein-nonzero-coefficient](#classical-eisenstein-nonzero-coefficient).

Construction/proof: 1. Expand the transformed Eisenstein combination and the ideal-class theta series. 2. Convolve the coefficients subject to Nn+l=m|D|, including the l=0 term r_A(0)=1/w.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §3, (3.1), p. 277.

<a id="classical-genus-sign-function"></a>

### Rankin genus-sign function

**GZ.6/classical-genus-sign-function** · definition · `rankinGenusSign`

Under classical notation C4: From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For n ∈ ℤ ∖ {0} and d a positive divisor of n: ε(n, d) = ε_𝒜(n, d) = 0 if (d, n/d, D) ≠ 1, and ε(n, d) = ε_{D₁}(d) ε_{D₂}(−N n/d) χ_{D₁·D₂}(𝒜) if (d, n/d, D) = 1, where D = D₁D₂ is the decomposition with (d, D) = |D₂|.

Direct prerequisites: `AnalyticNumberTheory:AN.4`, [GZ.0/classical-genus-character-factorization](#classical-genus-character-factorization).

Construction/proof: 1. Choose D₂ by |D₂|=gcd(d,D) and set zero on common ramification. 2. Evaluate the two primitive quadratic characters and the genus character with signed n/d.

Uses: Gross–Zagier 1986 Chapter IV, (3.2) Proposition, p. 277 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.6 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `rankinGenusSign` | The piecewise genus-character value ε_A(n,d), zero when gcd(d,n/d,D)>1. |
| `rankinGenusSign_values` | The values are 0,1,−1. |
| `rankinGenusSign_complement` | For the source norm congruence, ε_A(n,\|n\|/d)=−ε(N)sgn(n)ε_A(n,d). |
| `rankinGenusSign_multiplicative` | Multiplicative in coprime divisors d of fixed n. |

| Test | Kind | Exact expectation |
|---|---|---|
| `rankinGenusSign_common_ramification` | degenerate | If l\|D divides both d and n/d, the sign is zero. |
| `rankinGenusSign_positive_cancellation` | computation | For ε(N)=1,n>0 satisfying Nn+l≡0 with l a norm from A, Σ_d ε_A(n,d)=0. |
| `rankinGenusSign_negative_index` | non-example | At D=−3,N=1,A=1,n=±1,d=1 the values are respectively +1 and +1, but ramified d contributes the sign of ε_D₂(−1); a uniform n↦\|n\| replacement is invalid. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, (3.2) Proposition, p. 277.

<a id="classical-eisenstein-zero-coefficient"></a>

### Eisenstein zero coefficient

**GZ.6/classical-eisenstein-zero-coefficient** · theorem · `gz86_eisenstein_zero_coefficient`

Under classical notation C4: From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. The 0-th Fourier coefficient of ℰ_s(z) (The Eisenstein combination ℰ_s) is e_s(0, y) = L(2s+2k−1, ε)(δy)^s + (ε(N)/(i√δ)) V_s(0) L(2s+2k−2, ε) (δy)^{−s−2k+2}.

Direct prerequisites: [GZ.6/classical-eisenstein-combination](#classical-eisenstein-combination), [GZ.6/classical-eisenstein-transformation](#classical-eisenstein-transformation), `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Compute the zero Fourier integral separately from nonzero indices. 2. Retain both quadratic L-factors and the gamma factors; it is not the n→0 limit of the nonzero formula.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §3, (3.2) Proposition (first formula), p. 277; proof pp. 278–279.

<a id="classical-eisenstein-nonzero-coefficient"></a>

### Eisenstein nonzero coefficient

**GZ.6/classical-eisenstein-nonzero-coefficient** · theorem · `gz86_eisenstein_nonzero_coefficient`

Under classical notation C4: From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For n ≠ 0, the n-th Fourier coefficient of ℰ_s(z) is e_s(n, y) = (ε(N)/(i√δ)) (δy)^{−s−2k+2} V_s(ny) Σ_{d|n, d>0} ε_𝒜(n, d) d^{−(2s+2k−2)}, with ε_𝒜(n, d) as in The sign function ε_𝒜(n, d).

Direct prerequisites: [GZ.6/classical-eisenstein-combination](#classical-eisenstein-combination), [GZ.6/classical-genus-sign-function](#classical-genus-sign-function), `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Poisson-sum the nonzero Eisenstein coefficient and evaluate its integral V_s. 2. The divisor sum has the signed genus factors; keep both signs of the Fourier index.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §3, (3.2) Proposition (second formula), p. 277; proof p. 279.

<a id="classical-kernel-meromorphic-continuation"></a>

### Rankin kernel meromorphic continuation

**GZ.6/classical-kernel-meromorphic-continuation** · theorem · `gz86_kernel_meromorphic_continuation`

For each decomposition D = D₁·D₂ and each z ∈ ℌ, s ↦ E^{(D₁)}_s(z), defined by (2.1) for Re(s) > 3/2 − k, extends to a meromorphic function of s ∈ ℂ, given by the Fourier expansion of the referenced classical source result 209: the terms n ≠ 0 are entire in s (V_s(t) is entire for t ≠ 0, (3.3b)) and the series converges locally uniformly in (s, z) by the estimate V_s(t) = |t|^{O(1)}e^{−2π|t|}; the only possible poles come from the constant term V_s(0)L(2s+2k−2, ε)y^{−s−2k+2}. The continued function keeps the transformation law of the referenced classical source result 192. Consequently ℰ_s and Φ̃_s = (ℰ_s(Nz)θ_𝒜(z))|U_{|D|} continue meromorphically, Φ̃_s keeps its Γ₀(N) transformation law, and the expansions (3.1) and (3.2) hold for all s. This is what gives meaning to Φ̃_{−r} in Corollary (3.4) and to the values and derivatives at s = 0 and s = 1 − k used in §4.

Direct prerequisites: [GZ.6/classical-kernel-fourier-expansion](#classical-kernel-fourier-expansion), `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Use the continued zero and nonzero Eisenstein coefficient formulas. 2. The locally uniform Fourier bounds continue the kernel, with the source specified poles; those bounds are imported from AS.2.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §3, implicit in Corollary (3.4) ('Φ̃_{−r}(z)', p. 281) and in §4 (p. 282); the paper states continuation only for V_s(t) (pp. 280–281).

<a id="classical-integral-kernel-values"></a>

### Integral Rankin kernel values

**GZ.6/classical-integral-kernel-values** · theorem · `gz86_integral_kernel_values`

Under classical notation C4: From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For r ∈ ℤ, 0 ≤ r ≤ k−1 (Φ̃ continued in s through its Fourier coefficients): Φ̃_{−r}(z) = Σ_{m=0}^{∞} ( Σ_{0≤n≤mδ/N} e_{n,r}(y) r_𝒜(mδ − nN) ) e^{2πimz}, where e_{n,r}(y) := e_{−r}(n, Ny/δ) e^{2πNny/δ} is given by e_{0,r}(y) = L(2k−2r−1, ε)(Ny)^{−r} if r < k−1, and e_{0,k−1}(y) = [L(1, ε) − ε(N)(π/√δ) L(0, ε)] (Ny)^{1−k}; e_{n,r}(y) = (−1)^{k−r} ε(N) (2π/√δ) (Ny)^{r−2k+2} p_{k,r}(4πNny/δ) Σ_{d|n, d>0} ε_𝒜(n, d) d^{2r−2k+2} for n > 0, with p_{k,r} as in (3.3d) and ε_𝒜(n, d) as in (3.2). The coefficients are polynomials in 1/y of degree r.

Direct prerequisites: [GZ.6/classical-eisenstein-zero-coefficient](#classical-eisenstein-zero-coefficient), [GZ.6/classical-eisenstein-nonzero-coefficient](#classical-eisenstein-nonzero-coefficient), [GZ.6/classical-kernel-meromorphic-continuation](#classical-kernel-meromorphic-continuation), `AutomorphicLFunctionsAndLocalFactors:AL.0`.

Construction/proof: 1. At integral s evaluate the gamma-normalized V_s and its derivative. 2. Separate polynomial positive-index terms from the decaying q_(k−1) negative-index integral.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §3, (3.4) Corollary, pp. 281–282.

<a id="classical-central-kernel-holomorphy"></a>

### Central kernel holomorphy

**GZ.6/classical-central-kernel-holomorphy** · theorem · `gz86_central_kernel_holomorphy`

Under classical notation C4: From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. At s = 0, Φ̃_{0,𝒜} ∈ M_{2k}(Γ₀(N)) (holomorphic, not in general cuspidal). This is the case r = 0 of (3.4); a priori it holds because ℰ_s(z) is holomorphic in z at s = 0.

Direct prerequisites: [GZ.6/classical-integral-kernel-values](#classical-integral-kernel-values), [GZ.6/classical-kernel-fourier-expansion](#classical-kernel-fourier-expansion).

Construction/proof: 1. Evaluate the Fourier expansion at the central kernel parameter. 2. The negative-index terms vanish and the remaining series has the exact holomorphic weight 2k transformation law.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §3, after (3.4), p. 282.

<a id="classical-coefficient-functional-equation"></a>

### Kernel coefficient functional equation

**GZ.6/classical-coefficient-functional-equation** · theorem · `gz86_coefficient_functional_equation`

Under classical notation C5: Let n ∈ ℤ satisfy (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A, and y > 0. Put e*_s(n,y) := π^{−s} δ^s Γ(s+2k−1) e_s(n,y). Then e*_s(n,y) = −ε(N) e*_{2−2k−s}(n,y) for all s. Explicitly: e*_s(0,y) = (s+k)(s+k+1)⋯(s+2k−2)[π^{−s}δ^sΓ(s+k)L(2s+2k−1,ε)](δy)^s − ε(N)(2−k−s)(3−k−s)⋯(−s)[π^{1/2−s}δ^{s−1/2}Γ(s+k−1/2)L(2s+2k−2,ε)](δy)^{2−2k−s}, the two brackets being interchanged by s ↦ 2−2k−s by the functional equation of L(s,ε); and for n ≠ 0, e*_s(n,y) = −iε(N)|n|^k π^{2k−1} δ^{−2k+3/2} y V*_s(ny) Σ_{d|n, d>0} ε_A(n,d)(|n|/d²)^{s+k−1}, so that (4.1) for n ≠ 0 follows from V*_s(t) = sgn(t)V*_{2−2k−s}(t) (Prop. 3.3c) and (4.3).

Direct prerequisites: [GZ.6/classical-eisenstein-zero-coefficient](#classical-eisenstein-zero-coefficient), [GZ.6/classical-eisenstein-nonzero-coefficient](#classical-eisenstein-nonzero-coefficient), [GZ.6/classical-kernel-meromorphic-continuation](#classical-kernel-meromorphic-continuation).

Construction/proof: 1. Apply the gamma reflection and integral continuation to the coefficient formula. 2. Compare s with 1−2k−s; the signed divisor complement yields the source sign.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §4, (4.1)–(4.2) and the two displays after (4.2), p. 282.

<a id="classical-genus-sign-reversal"></a>

### Genus-sign reversal

**GZ.6/classical-genus-sign-reversal** · theorem · `gz86_genus_sign_reversal`

Under classical notation C5: Let n ≠ 0 satisfy (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A and let d be a positive divisor of n. Then ε_A(n, |n|/d) = −ε(N)·sgn(n)·ε_A(n, d). (Both sides vanish unless (d, n/d, D) = 1. If (d, n/d, D) = 1 write D = D₀D′D″ with D₀, D′, D″ discriminants, |D′| = (d, D), |D″| = (n/d, D), D₀ prime to n; then the product ε_A(n,d)ε_A(n,|n|/d) equals ε_{D₀}(|n|) ε_{D′D″}(−N sgn n) χ_{D₀·D′D″}(A), and (4.2) gives χ_{D₀·D′D″}(A) = ε_{D₀}(l) = ε_{D₀}(−Nn), whence the product is ε_D(−N sgn n) = −ε(N)sgn(n).) In particular, if ε(N) = +1 and n > 0 satisfies (4.2), then Σ_{d|n, d>0} ε_A(n,d) = 0.

Direct prerequisites: [GZ.6/classical-genus-sign-function](#classical-genus-sign-function), `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. Replace d by |n|/d and evaluate the two primitive character signs. 2. The claimed reversal uses the norm congruence and ε(N); it is not a universal unsigned-divisor identity.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §4, (4.3) and its proof, pp. 282–283.

<a id="classical-l-functional-equation"></a>

### Classical L functional equation

**GZ.6/classical-l-functional-equation** · theorem · `gz86_l_functional_equation`

Under classical notation C5: L_A(f,s) extends to an entire function of s and L*_A(f,s) := (2π)^{−2s} N^s |D|^s Γ(s)² L_A(f,s) satisfies L*_A(f,s) = −ε(N) L*_A(f, 2k−s). In particular, if ε(N) = +1 then L_A(f,k) = 0. (§4 deduces this from Prop. (1.2), Eq. (3.1) and (4.1), which applies to every coefficient because the n occurring in (3.1) satisfy (4.2).)

Direct prerequisites: [GZ.6/classical-rankin-kernel-pairing](#classical-rankin-kernel-pairing), [GZ.6/classical-coefficient-functional-equation](#classical-coefficient-functional-equation).

Construction/proof: 1. Pair the kernel functional equation with the newform. 2. Cancel the exact unfolding gamma and level factors to obtain Λ(s)=−ε(N)Λ(2k−s).

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, (0.2), p. 267; proof: §4, pp. 282–283 (‘This completes the proof of the functional equation’).

<a id="classical-signed-divisor-sums"></a>

### Signed divisor sums

**GZ.6/classical-signed-divisor-sums** · definition · `signedDivisorSums`

Under classical notation C5: For an integer n ≠ 0: σ_A(n) := Σ_{d|n, d>0} ε_A(n,d). For n > 0: σ′_A(n) := Σ_{d|n, d>0} ε_A(n,d) log(n/d²). p_{k−1}(t) := Σ_{j=0}^{k−1} C(k−1, j)(−t)^j/j! (= p_{k,k−1}(t) of Prop. (3.3d)). Note that ε_A(n,d), hence σ_A(n), depends on the sign of n: ε_A(−n,d) = ε_{D₂}(−1)ε_A(n,d), D₂ as in the definition of ε_A. The polynomial p_(k−1) is imported as the generic terminating hypergeometric/Laguerre polynomial, not separately redefined in GZ; its exact formula is a supplier request.

Direct prerequisites: [GZ.6/classical-genus-sign-function](#classical-genus-sign-function), `AnalyticNumberTheory:AN.4`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

Construction/proof: 1. Define the signed divisor sum and its log(n/d²) companion on their different domains. 2. Expand log(n/d²)=log n−2log d; retain signed n in σ, including the archimedean negative tail.

Uses: Gross–Zagier 1986 Chapter IV, §4, Proposition (4.4) (σ_A, p_{k−1}), p. 283; Proposition (4.5) (σ′_A), p. 284 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.6 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `signedDivisorSums` | The pair (σ_A(n),σ′_A(n)), with σ defined for n≠0 and σ′ for n>0. |
| `signedDivisorSums_log` | σ′=log n·σ−2Σ_d ε_A(n,d)log d. |
| `signedDivisorSums_prime_support` | Under the norm congruence, σ′ is a sum over primes with ε(p)≠1. |
| `signedDivisorSums_negative` | σ_A(−n) retains the discriminant-dependent sign, as required in the resolvent tail. |

| Test | Kind | Exact expectation |
|---|---|---|
| `signedDivisorSums_one` | computation | σ′_A(1)=0 because log1=0. |
| `signedDivisorSums_split` | degenerate | A split prime contributes zero to the logarithmic prime decomposition under its hypotheses. |
| `signedDivisorSums_negative_tail` | non-example | For D=−3,N=1,A=1,n=3, σ_A(3)=0 and σ_A(−3)=2; substituting σ_A(3) deletes the analytic tail. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §4, Proposition (4.4) (σ_A, p_{k−1}), p. 283; Proposition (4.5) (σ′_A), p. 284.

<a id="classical-central-value-kernel"></a>

### Classical central-value kernel

**GZ.6/classical-central-value-kernel** · theorem · `gz86_central_value_kernel`

Under classical notation C5: Suppose ε(N) = −1. Then L_A(f,k) = 2^{2k+1} π^{k+1} / ((k−1)! √δ) · (f, Φ̃), where Φ̃ ∈ M̃_2k(Γ₀(N)) has the Fourier expansion Φ̃(z) = Σ_{m=0}^∞ ( Σ_{0<n≤mδ/N} σ_A(n) r_A(mδ − Nn) p_{k−1}(4πNny/δ) + (h/u) r_A(m) ) y^{1−k} e^{2πimz}. The coefficients of Φ̃ are polynomials in y^{−1} of degree ≤ k−1; for k = 1, Φ̃ is a holomorphic modular form (not a cusp form). (Φ̃ = (N^{k−1}√δ/2π)·Φ̃_{1−k}; the proof is Prop. (1.2) and Cor. (3.4) with r = k−1.)

Direct prerequisites: [GZ.6/classical-integral-kernel-values](#classical-integral-kernel-values), [GZ.6/classical-kernel-fourier-expansion](#classical-kernel-fourier-expansion), [GZ.6/classical-signed-divisor-sums](#classical-signed-divisor-sums).

Construction/proof: 1. Evaluate the holomorphic central kernel and express its finite coefficients with σ. 2. Apply the norm congruence/genus relation; preserve the endpoint r_A(0)=1/w.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §4, (4.4) Proposition, p. 283.

<a id="classical-different-reindexing"></a>

### Different ideal reindexing

**GZ.6/classical-different-reindexing** · theorem · `gz86_different_reindexing`

With the standing notation (D odd, so D squarefree), for every m ≥ 0 and every class A: r_A(m|D|) = r_A(m). (The different 𝔡 = (√D) is principal and every integral ideal of norm m|D| is divisible by every ramified prime, hence equals 𝔡·𝔟 with N(𝔟) = m; for m = 0 both sides are 1/w.)

Direct prerequisites: `MetaplecticAutomorphicForms:MP.7`, `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. Multiply ideals by the different and track the ideal class and norm |D| factor. 2. This is a theta coefficient reindexing, not an equality of individual ideal representatives.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §4, used in (4.4) and (4.5) (the n = 0 term of Cor. (3.4), r_A(mδ − 0·N), is printed as r_A(m)), pp. 283–284; Theorems (5.6), (5.8) use both forms.

<a id="classical-central-derivative-kernel"></a>

### Classical central-derivative kernel

**GZ.6/classical-central-derivative-kernel** · theorem · `gz86_central_derivative_kernel`

Under classical notation C5: Suppose ε(N) = +1. Then L′_A(f,k) = 2^{2k+1} π^{k+1} / ((k−1)! √δ) · (f, Φ̃), where Φ̃ = (N^{k−1}√δ/2π)·∂Φ̃_s/∂s|_{s=1−k} ∈ M̃_2k(Γ₀(N)) has the Fourier expansion Φ̃(z) = Σ_{m=−∞}^{∞} [ −Σ_{0<n≤mδ/N} σ′_A(n) r_A(mδ − Nn) p_{k−1}(4πnNy/δ) + (h/u) r_A(m)(log y + Γ′/Γ(k) + log Nδ − log π + 2L′/L(1, ε)) − Σ_{n=1}^∞ σ_A(−n) r_A(mδ + Nn) q_{k−1}(4πnNy/δ) ] y^{1−k} e^{2πimz} (the first two terms are absent if m < 0; in the third term n has been replaced by −n). CORRECTED: the paper prints σ_A(n) in the third term; it must be σ_A(−n) (= δ(n)R_{A𝔫}(n) by Prop. (4.6a)), see issue PAPER-GROSS-ZAGIER-86/E38. Ingredients (p. 283–284): ∂e_s(0,y)/∂s|_{1−k} = 2L(1,ε)(δy)^{1−k}[Γ′/Γ(k) + log(δ²y/π) + 2L′/L(1,ε)]; for n > 0, ∂e_s(n,y)/∂s|_{1−k} = 2iδ^{1/2−k}y^{1−k}V_{1−k}(ny)Σ_{d|n}ε_A(n,d) log d; for n < 0, ∂e_s(n,y)/∂s|_{1−k} = −iδ^{1/2−k}y^{1−k}·∂V_s(ny)/∂s|_{1−k}·Σ_{d|n}ε_A(n,d), with V_{1−k}, ∂V_s/∂s|_{1−k} from Prop. (3.3d,e).

Direct prerequisites: [GZ.6/classical-integral-kernel-values](#classical-integral-kernel-values), [GZ.6/classical-kernel-fourier-expansion](#classical-kernel-fourier-expansion), [GZ.6/classical-signed-divisor-sums](#classical-signed-divisor-sums), [GZ.6/classical-different-reindexing](#classical-different-reindexing).

Construction/proof: 1. Differentiate each continued Fourier branch at the central parameter. 2. The positive-index term uses σ′, the negative-index term uses σ(−n) and q_(k−1); the zero coefficient is differentiated separately.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §4, pp. 283–284: the three derivative displays and (4.5) Proposition.

<a id="classical-sign-multiplicativity"></a>

### Genus-sign multiplicativity

**GZ.6/classical-sign-multiplicativity** · theorem · `gz86_sign_multiplicativity`

Under classical notation C5: For fixed n ≠ 0 and coprime positive divisors d′, d″ of n with d′d″ | n: ε_A(n, d′d″) = ε_A(n, d′) ε_A(n, d″). Consequently Σ_{d|n} ε_A(n,d) d^{−s} has an Euler product, and, writing n = p₁^{ν₁}⋯p_s^{ν_s}n₀ with p_i | D and (n₀, D) = 1, σ_A(n) = ∏_{i=1}^{s}(1 + ε_A(n, p_i^{ν_i}))·Σ_{d₀|n₀} ε(d₀) (only d = p₁^{μ₁}⋯p_s^{μ_s}d₀ with μ_i ∈ {0, ν_i} contribute).

Direct prerequisites: [GZ.6/classical-genus-sign-function](#classical-genus-sign-function).

Construction/proof: 1. Factor the primitive characters on coprime divisors of fixed n. 2. Check the common-ramification zero branch before using multiplicativity.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §4, proof of (4.6a), p. 286 (also used in (4.6b), p. 287, and the remark on p. 288).

<a id="classical-genus-sigma-identity"></a>

### Genus sigma identity

**GZ.6/classical-genus-sigma-identity** · theorem · `gz86_genus_sigma_identity`

Under classical notation C5: Genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_{A𝔫}(n) = number of integral ideals of norm n in the genus {A𝔫} (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Let n be an integer satisfying (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A and ε(N)n < 0. Then σ_A(n) = δ(n)·R_{A𝔫}(|n|). (For n prime to D: σ_A(n) = Σ_{d|n} ε(d) = R(n), the total number of ideals of norm n, and by (4.2) all of them lie in {A𝔫}.)

Direct prerequisites: [GZ.6/classical-genus-sign-reversal](#classical-genus-sign-reversal), [GZ.6/classical-signed-divisor-sums](#classical-signed-divisor-sums), `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. Use the complement sign under the explicit norm congruence Nn+l≡0 mod D, l a norm from A. 2. Apply genus orthogonality to obtain δ(n)R_(A𝔫)(n); without the norm congruence the printed shortcut is false.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §4, (4.6) Proposition a), p. 285; proof pp. 285–287.

<a id="classical-logarithmic-prime-decomposition"></a>

### Logarithmic prime decomposition

**GZ.6/classical-logarithmic-prime-decomposition** · theorem · `gz86_logarithmic_prime_decomposition`

Under classical notation C5: Genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_{A𝔫}(n) = number of integral ideals of norm n in the genus {A𝔫} (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Suppose ε(N) = +1 and n > 0 satisfies (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A [the hypothesis (4.2) is omitted in the printed statement of b); it is needed, see issue PAPER-GROSS-ZAGIER-86/E37]. Then σ′_A(n) = Σ_{p|n} a_p(n) log p with a_p(n) = 0 if ε(p) = 1; a_p(n) = (ord_p(n) + 1)·δ(n)·R_{A𝔫𝔠}(n/p) if ε(p) = −1; a_p(n) = ord_p(n)·δ(n)·R_{A𝔫𝔠}(n/p) if ε(p) = 0, where in the last two cases {𝔠} is the genus of any integral ideal with N(𝔠) ≡ −p (mod D) (Remark 1). (Proof: a_p(n) = −2Σ_{d|n} ε_A(n,d) ord_p(d); multiplicativity reduces to the p-part; ε(p) = −1 and ν odd use ε_A(n,d₁) = ε_{A𝔠}(−n₁,d₁) and part a); p | D uses ε_A(n,d) = −ε_A(n,n/d) and ε_A(n,d₁) = ε_{A𝔠𝔭^{ν−1}}(−n₁,d₁).)

Direct prerequisites: [GZ.6/classical-signed-divisor-sums](#classical-signed-divisor-sums), [GZ.6/classical-sign-multiplicativity](#classical-sign-multiplicativity), [GZ.6/classical-genus-sigma-identity](#classical-genus-sigma-identity), `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. Expand σ′=log n·σ−2Σ ε_A(n,d)log d and separate prime powers. 2. Use multiplicativity and the norm congruence to cancel split primes and evaluate inert/ramified contributions.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §4, (4.6) Proposition b), p. 285; proof p. 287.

<a id="classical-prime-coefficient-parity"></a>

### Logarithmic coefficient parity

**GZ.6/classical-prime-coefficient-parity** · theorem · `gz86_prime_coefficient_parity`

Under classical notation C5: Under the hypotheses of (4.6b) (ε(N) = +1, n > 0, n satisfying (4.2)): Σ_{d|n} ε_A(n,d) = 0 (from (4.3)), hence σ′_A(n) = −2 Σ_{d|n} ε_A(n,d) log d; and every a_p(n) is even, since δ(n) is even if n is divisible by a ramified prime and ord_p(n) + 1 is even if n is divisible by an inert prime p with R(n/p) ≠ 0.

Direct prerequisites: [GZ.6/classical-logarithmic-prime-decomposition](#classical-logarithmic-prime-decomposition).

Construction/proof: 1. Pair complementary divisors at the given prime power. 2. The quadratic sign forces the stated parity restriction on the surviving logarithmic coefficient.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §4, Remark 2 after (4.6), p. 285.

<a id="classical-single-prime-logarithm"></a>

### Single-prime logarithm criterion

**GZ.6/classical-single-prime-logarithm** · theorem · `gz86_single_prime_logarithm`

Under classical notation C5: Genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_{A𝔫}(n) = number of integral ideals of norm n in the genus {A𝔫} (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Under the hypotheses of (4.6b): σ′_A(n) = 0 if n is divisible to an odd power by more than one prime inert in K; if there is exactly one such prime p, σ′_A(n) = (ord_p(n) + 1)·δ(n)·R_{A𝔫𝔠}(n/p)·log p (CORRECTED; printed ‘R_{A𝔫}(p)’, issue PAPER-GROSS-ZAGIER-86/E40); if there is none, n is a norm, and letting q be the norm of an ideal prime to D in the genus of (an ideal of norm n)·{A𝔫}, (−q/p) = −1 for an odd number of primes p | D, and σ′_A(n) = δ(n) ord_p(n) R(n) log p if there is exactly one such p, 0 if there are several. A priori reason: Σ_{d|n} ε_A(n,d)d^{−s} vanishes at s = 0 with derivative ½σ′_A(n) and has an Euler product, so σ′_A(n) ≠ 0 only if exactly one Euler factor vanishes at s = 0.

Direct prerequisites: [GZ.6/classical-logarithmic-prime-decomposition](#classical-logarithmic-prime-decomposition).

Construction/proof: 1. Apply the prime decomposition and the parity restriction. 2. The source genus condition leaves one nonsplit prime; preserve the ramified alternative instead of claiming the same valuation coefficient.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §4, remark following the proof of (4.6), p. 288.

<a id="classical-holomorphic-projection"></a>

### Logarithmic weight-two projection

**GZ.6/classical-holomorphic-projection** · theorem · `gz86_holomorphic_projection`

Let Φ̃(z) = Σ_{m∈ℤ} a_m(y)e^{2πimx} ∈ M̃₂(Γ₀(N)) satisfy the growth condition (6.1) at all cusps ξ, and suppose A_ξ = A(N₁), B_ξ = B(N₁) depend only on N₁ = gcd(N, denominator of ξ). Let {α(M), β(M) : M | N} be the solution of the non-singular linear system (6.3) Σ_{M|N} ((M,N₁)²/M²) α(M) = A(N₁) (N₁ | N), (6.4) Σ_{M|N} ((M,N₁)²/M²) {β(M) + α(M) log((M,N₁)²/M)} = B(N₁) (N₁ | N). Then there is a holomorphic cusp form Φ = Σ_{m≥1} a_m e^{2πimz} ∈ S₂(Γ₀(N)) with (Φ, f) = (Φ̃, f) for all f ∈ S₂(Γ₀(N)) and, for (m, N) = 1, (6.5) a_m = lim_{s→0} [4πm ∫₀^∞ a_m(y) e^{−4πmy} y^s dy + 24α(1)σ₁(m)s^{−1}] + 24β(1)σ₁(m) + 48α(1)[σ′₁(m) − σ₁(m)(log 2m + 1/2 + ζ′/ζ(2))], where σ₁(m) = Σ_{d|m} d, σ′₁(m) = Σ_{d|m} d log d. (Proof: subtract Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)}, which is orthogonal to cusp forms and has expansion A(N₁) log y + B(N₁) + O(y^{−1} log y) at ξ, then apply the case A = B = 0.)

Direct prerequisites: `AutomorphicSpectralTheory:AS.4`, [GZ.6/classical-eisenstein-mellin-asymptotics](#classical-eisenstein-mellin-asymptotics), [GZ.6/classical-boundary-eisenstein-cusps](#classical-boundary-eisenstein-cusps), [GZ.6/classical-cusp-matrix-inverse](#classical-cusp-matrix-inverse), [GZ.6/classical-projection-boundary-coefficients](#classical-projection-boundary-coefficients), [GZ.6/classical-boundary-eisenstein-orthogonality](#classical-boundary-eisenstein-orthogonality).

Construction/proof: 1. Solve the two cusp-constant systems, using the invertible C_N matrix. 2. Subtract Σ_M(α(M)F(Mz)+β(M)E(Mz)), which is cusp-orthogonal. 3. Apply the supplier projection to the decaying remainder and evaluate the regularized Fourier Mellin integral; restore the exact α(1),β(1) correction.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §6, (6.2) Proposition, pp. 295-300.

<a id="classical-eisenstein-mellin-asymptotics"></a>

### Eisenstein Mellin asymptotics

**GZ.6/classical-eisenstein-mellin-asymptotics** · theorem · `gz86_eisenstein_mellin_asymptotics`

Write E(z) = Σ_m e(m,y)e^{2πimz}, F(z) = Σ_m f(m,y)e^{2πimz}. For m > 0: e(m,y) = −24σ₁(m), and as s → 0 (Re s > 0): ∫₀^∞ e(m,y)e^{−4πmy}y^s dy = −(6/(πm))σ₁(m) + o(1); ∫₀^∞ f(m,y)e^{−4πmy}y^s dy = ∂/∂t[−2π^{3/2+t}m^{−1/2−t}Γ(s+t+1)Γ(s−t)σ_{1+2t}(m)/((4πm)^{s+1/2}Γ(2+t)Γ(s)ζ(2+2t))]_{t=0} = −24 Γ(s+1)/(4πm)^{s+1} · [2σ′₁(m) + σ₁(m)(log(π/m) + γ − 1 − 2ζ′/ζ(2) + 1/s)] = −(6/(πm))σ₁(m)s^{−1} − (12/(πm))σ′₁(m) + (12/(πm))σ₁(m)(log 2m + ½ + ζ′/ζ(2)) + o(1), γ = Euler's constant. For (m, N) = 1 the m-th coefficient of Φ̃* = Φ̃ − Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} is a*_m(y) = a_m(y) − α(1)f(m,y) − β(1)e(m,y); these give (6.5).

Direct prerequisites: `QSeriesPartitionsAndMockModularForms:QM.3/nonholomorphic-eisenstein-series-e2-star`, `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Use E₂*=E₂−3/(πy) and its Eisenstein derivative family. 2. Evaluate the Mellin transforms, keeping the Laurent pole and constant before differentiating at zero.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), pp. 298-299.

<a id="classical-boundary-eisenstein-cusps"></a>

### Boundary Eisenstein cusp constants

**GZ.6/classical-boundary-eisenstein-cusps** · theorem · `gz86_boundary_eisenstein_cusps`

Let M | N and ξ = a/c with (a,c) = 1, (c, N) = N₁; α = (a b; c d) ∈ SL₂(ℤ). Put a′ = (M/(M,N₁))a, c′ = c/(M,N₁) ((a′,c′) = 1), complete to α′ = (a′ b′; c′ d′) ∈ SL₂(ℤ), and relate z, z′ by c′z′ + d′ = ((M,N₁)/M)(cz+d); then (a′z′+b′)/(c′z′+d′) = M(az+b)/(cz+d), y′ = ((M,N₁)²/M)y, and E_{2,s}(Mz)|₂α = ((M,N₁)^{2+2s}/M^{2+s}) y^s + O(y^{−1−s}); hence E(Mz)|₂α = (M,N₁)²/M² + O(1/y), F(Mz)|₂α = ((M,N₁)²/M²)(log y + log((M,N₁)²/M)) + O(y^{−1} log y). Therefore Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} has expansion A(N₁) log y + B(N₁) + O(y^{−1} log y) at ξ iff (6.3), (6.4) hold.

Direct prerequisites: `QSeriesPartitionsAndMockModularForms:QM.3/nonholomorphic-eisenstein-series-e2-star`, [GZ.6/classical-eisenstein-mellin-asymptotics](#classical-eisenstein-mellin-asymptotics), `ModularCurvesPartII:R14.2`.

Construction/proof: 1. Transform E₂* and the derivative to each finite-level cusp. 2. The leading log y and constant terms depend only on gcd(N,denominator); keep the y^(-1)log y remainder.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), pp. 297-298.

<a id="classical-boundary-eisenstein-orthogonality"></a>

### Boundary Eisenstein orthogonality

**GZ.6/classical-boundary-eisenstein-orthogonality** · theorem · `gz86_boundary_eisenstein_orthogonality`

Let N ≥ 1 and M | N, and let E(z) = E_{2,s}(z)|_{s=0}, F(z) = ∂_sE_{2,s}(z)|_{s=0} as in the proof of (6.2) (the referenced classical source result 264). Then z ↦ E(Mz) and z ↦ F(Mz) lie in M̃₂(Γ₀(N)) and (f, E(M·)) = (f, F(M·)) = 0 for every f ∈ S₂(Γ₀(N)). Consequently Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} has the same Petersson products with cusp forms as 0, and Φ̃ and Φ̃* = Φ̃ − Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} have the same holomorphic projection.

Direct prerequisites: [GZ.6/classical-boundary-eisenstein-cusps](#classical-boundary-eisenstein-cusps), `ModularCurvesPartII:R14.5`.

Construction/proof: 1. Pair the boundary Eisenstein families with cusp forms in their convergence region. 2. Continue the pairing and differentiate; cusp decay kills the boundary terms, giving zero for both E and F.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), p. 298 ('the function Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)}, which is orthogonal to cusp forms').

<a id="classical-cusp-matrix-inverse"></a>

### Cusp constant matrix inverse

**GZ.6/classical-cusp-matrix-inverse** · theorem · `gz86_cusp_matrix_inverse`

Let C_N = (C_N(N₁, M))_{N₁, M | N}, C_N(N₁, M) = (M, N₁)²/M² (a σ₀(N) × σ₀(N) matrix). The entries are multiplicative, C_{∏p^{ν_p}}(∏p^{λ_p}, ∏p^{μ_p}) = ∏ C_{p^{ν_p}}(p^{λ_p}, p^{μ_p}), so C_N is the Kronecker product of the C_{p^ν} (N = ∏ p^ν). For N = p^ν, C_{p^ν}(p^λ, p^μ) = p^{2 min(λ,μ) − 2μ} (rows λ = 0..ν: (1, p^{−2}, …, p^{−2ν}), (1, 1, p^{−2}, …, p^{−2ν+2}), …, (1, …, 1)), and (6.6) C_{p^ν}^{−1} = (p² − 1)^{−1} × the tridiagonal matrix with diagonal (p², p²+1, …, p²+1, p²), superdiagonal −1, subdiagonal −p². In particular C_N is invertible and (6.3)-(6.4) have a unique solution. The displayed tridiagonal inverse is for ν≥1; for ν=0 use the 1×1 matrix (1).

Direct prerequisites: `mathlib:Matrix.mul_apply`.

Construction/proof: 1. Factor C_N as the tensor product of its prime-power matrices. 2. Multiply the prime-power matrix by the displayed tridiagonal inverse; both corner rows must be checked. The ν=0 matrix is (1), handled separately.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §6, pp. 299-300, (6.6).

<a id="classical-projection-boundary-coefficients"></a>

### Projection boundary coefficients

**GZ.6/classical-projection-boundary-coefficients** · theorem · `gz86_projection_boundary_coefficients`

In the setting of (6.2): α(1) = ρ^{−1} Σ_{N₁|N} (μ(N₁)/N₁²) A(N₁), β(1) = ρ^{−1} Σ_{N₁|N} (μ(N₁)/N₁²)(B(N₁) − 2A(N₁) log N₁) − 2α(1) Σ_{p|N} log p/(p² − 1), where μ is the Möbius function and ρ = ∏_{p|N}(1 − p^{−2}) = Σ_{N₁|N} μ(N₁)/N₁². (Proof: C_N^{−1}(1, N₁) = ρ^{−1}μ(N₁)/N₁², and Σ_{N₁|N} (μ(N₁)/N₁²) s_p(N₁) = −2 Σ_{N₁|N} (μ(N₁)/N₁²) A(N₁)(v_p(N₁) + 1/(p²−1)) with s_p(N₁) = Σ_{M|N} C_N(N₁,M)α(M)(v_p(M) − 2 min{v_p(N₁), v_p(M)}).)

Direct prerequisites: [GZ.6/classical-cusp-matrix-inverse](#classical-cusp-matrix-inverse), [GZ.6/classical-boundary-eisenstein-cusps](#classical-boundary-eisenstein-cusps).

Construction/proof: 1. Use C_N^(-1) first for α and then for β after removing the α logarithmic term. 2. Extract the M=1 entries and verify the prime-power tensor factorization.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §6, (6.7) Proposition, pp. 300-301.

<a id="classical-rankin-cusp-constants"></a>

### Rankin cusp constants

**GZ.6/classical-rankin-cusp-constants** · theorem · `gz86_rankin_cusp_constants`

Under classical notation C6: Let Φ̃ be the function of Prop. (4.5) for k = 1, i.e. Φ̃ = (√δ/2π)·∂/∂s Φ̃_s|_{s=0} with Φ̃_s = Tr^{ND}_N(θ_𝒜(z)E_s^{(1)}(Nz)) (Prop. (1.2)). Then Φ̃ satisfies the hypotheses of (6.2) with A(N₁) = (h/(2u²)) ε(N₁)N₁/N, B(N₁) = A(N₁)(log(N₁²δ/(Nπ)) − γ + 2(L′/L)(1, ε)) (N₁ | N), γ = Euler's constant. (Proof: at a cusp with invariant N₁, (Φ̃_s|₂α)(z) = (1/(2u))(ε(N₁)/N₂)[L(2s+1,ε)(N₁y/N₂)^s − (iV_s(0)/|D|^{1/2}) L(2s,ε)(N₁y/N₂)^{−s}] + … with N₂ = N/N₁, V_s(0) = −π^{1/2}Γ(s+½)i/Γ(s+1), using Lemma (2.3) and (2.2) of Chap. IV and the count of cosets of Γ₀(ND)\Γ₀(N)α with D | c (one) and (c, D) = 1 (|D| of them).)

Direct prerequisites: [GZ.6/classical-central-derivative-kernel](#classical-central-derivative-kernel), `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Compute the central derivative kernel at each cusp via its theta/Eisenstein transform. 2. The A(N₁)log y and B(N₁) terms retain the quadratic L logarithmic derivative and level factors.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §6, (6.8) Proposition and proof, pp. 301-303.

<a id="classical-rankin-boundary-coefficients"></a>

### Rankin boundary coefficients

**GZ.6/classical-rankin-boundary-coefficients** · theorem · `gz86_rankin_boundary_coefficients`

Under classical notation C6: For Φ̃ as in (6.8): α(1) = (h/(2u²)) N^{−1} ρ^{−1} Σ_{N₁|N} μ(N₁)ε(N₁)/N₁ = (h/(2u²)) N^{−1} ∏_{p|N}(1 + ε(p)/p)^{−1}, β(1) = α(1)(log(δ/(Nπ)) − γ + 2(L′/L)(1, ε) − 2 Σ_{p|N} log p/(p² − 1)).

Direct prerequisites: [GZ.6/classical-cusp-matrix-inverse](#classical-cusp-matrix-inverse), [GZ.6/classical-rankin-cusp-constants](#classical-rankin-cusp-constants).

Construction/proof: 1. Insert these Rankin cusp constants into the two linear systems. 2. Use the matrix inverse to obtain α(1),β(1), keeping the product Π_(p|N)(1+ε(p)/p)^(-1).

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §6, display after (6.8), p. 303.

<a id="classical-rankin-mellin-regularization"></a>

### Rankin Mellin regularization

**GZ.6/classical-rankin-mellin-regularization** · theorem · `gz86_rankin_mellin_regularization`

Under classical notation C6: For m > 0, a_m(y) = A_m log y + B_m + Σ_{n≥1} C_{mn} q₀(4πnNy/δ) (from Prop. (4.5); q₀(t) = ∫₁^∞ e^{−tx}dx/x), with A_m = (h/u)r_𝒜(m), B_m = A_m(log(Nδ/π) − γ + 2(L′/L)(1,ε)) − Σ_{1≤n≤mδ/N} σ′_𝒜(n) r_𝒜(mδ − Nn), C_{mn} = −σ_𝒜(−n) r_𝒜(mδ + Nn) (σ_𝒜, σ′_𝒜 as in Prop. (4.6)). Then ∫₀^∞ a_m(y)e^{−4πmy}y^s dy = Γ(s+1)(4πm)^{−s−1}(A_m (Γ′/Γ)(s+1) − A_m log 4πm + B_m) + Σ_n C_{mn} ∫₀^∞ q₀(4πnNy/δ)e^{−4πmy}y^s dy, and ∫₀^∞ q₀(4πnNy/δ)e^{−4πmy}y^s dy = 2Γ(2s+2)/((4πm)^{s+1}Γ(s+2)) · Q_s(1 + 2nN/(mδ)) + ε_n(s), ε_n(s) = O(n^{−s−2}) (uniformly near s = 0), ε_n(0) = 0, using Q₀(1+2t) = ½ log(1 + 1/t) and Q_s(1+2t) = (Γ(s+1)²/(2Γ(2s+2)))[t^{−s−1} + O(t^{−s−2})] (t → ∞). Since C_{mn} = O(n^c) for all c > 0, 4πm ∫₀^∞ a_m(y)e^{−4πmy}y^s dy = B_m − A_m(γ + log 4πm) + (2Γ(2s+2)/((4πm)^sΓ(s+2))) Σ_n C_{mn} Q_s(1 + 2nN/(mδ)) + o(1) (s → 0).

Direct prerequisites: [GZ.6/classical-central-derivative-kernel](#classical-central-derivative-kernel), `AutomorphicSpectralTheory:AS.2`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

Construction/proof: 1. Apply the continued Fourier integral to the differentiated positive, negative and zero branches. 2. Evaluate the logarithmic exponential integral and Legendre tail; only after this continuation extract the constant at s=0.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, §6, pp. 303-304.

<a id="classical-projected-derivative-cuspform"></a>

### Projected Rankin derivative cusp form

**GZ.6/classical-projected-derivative-cuspform** · theorem · `gz86_projected_derivative_cuspform`

Under classical notation C6: There exists a holomorphic cusp form Φ_𝒜(z) = Σ_{m≥1} a_{m,𝒜} e^{2πimz} of weight 2 and level N such that L_𝒜(f, 1) = 0 and L′_𝒜(f, 1) = (8π²/√δ)(f, Φ_𝒜) for every cusp form f in the space spanned by newforms of weight 2 and level N. (δ = |D|; the constant equals 8π²/√|D|, consistent with Chap. I (6.2).)

Direct prerequisites: [GZ.6/classical-holomorphic-projection](#classical-holomorphic-projection), [GZ.6/classical-central-derivative-kernel](#classical-central-derivative-kernel), [GZ.6/classical-rankin-cusp-constants](#classical-rankin-cusp-constants), [GZ.6/classical-rankin-boundary-coefficients](#classical-rankin-boundary-coefficients), [GZ.6/classical-rankin-mellin-regularization](#classical-rankin-mellin-regularization).

Construction/proof: 1. Check the logarithmic growth condition at every cusp. 2. Apply the boundary-corrected weight-two projection; pairing with a cusp form is unchanged.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, (6.9) Theorem (i), p. 305; `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §9, (9.2) with k = 1, p. 233; proved in Chapter IV, Theorem (6.9), p. 305 (via Rankin's method §§1–3, the functional equation §4 and holomorphic projection with Hecke's trick §6).

<a id="classical-projected-derivative-coefficients"></a>

### Projected Rankin derivative coefficients

**GZ.6/classical-projected-derivative-coefficients** · theorem · `gz86_projected_derivative_coefficients`

Under classical notation C6: For m prime to N, a_{m,𝒜} = − Σ_{1≤n≤m|D|/N} σ′_𝒜(n) r_𝒜(m|D| − nN) + (h/u) r_𝒜(m)[log(N|D|/(4π²m)) − 2γ + 2(L′/L)(1, ε)] + lim_{s→0}[−2 Σ_{n≥1} σ_𝒜(−n) r_𝒜(m|D| + nN) Q_s(1 + 2nN/(m|D|)) − (hκ/u²) σ₁(m) s^{−1}] + (hκ/u²)[σ₁(m)(log(N/|D|) + 2 Σ_{p|N} log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_{d|m} d log(m/d²)], where σ₁(m) = Σ_{d|m} d, κ = −12/(N ∏_{p|N}(1 + ε(p)/p)), σ_𝒜, σ′_𝒜 as in Prop. (4.6), Q_s = Legendre function of the second kind, γ = Euler's constant.

Direct prerequisites: [GZ.6/classical-projected-derivative-cuspform](#classical-projected-derivative-cuspform), [GZ.6/classical-rankin-mellin-regularization](#classical-rankin-mellin-regularization), [GZ.6/classical-signed-divisor-sums](#classical-signed-divisor-sums).

Construction/proof: 1. Insert the explicit Mellin constants and α(1),β(1) into the projection formula. 2. Combine the divisor logs using σ₁(m)log m−2σ′₁(m); the archimedean tail carries σ_A(−n).

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter IV, (6.9) Theorem (ii), p. 305.

## GZ.7 — Local derivative and intersection comparisons

Read every local branch separately. The finite CM calculation uses actual integral diagrams, half Hom counts, new maps and correctly oriented quaternion lattices. The archimedean calculation uses PSL₂ resolvents, marked cusp cancellation, tangents and Laurent finite parts. The Colmez comparison keeps the vertical, Hodge, self-intersection and auxiliary split corrections.

Coverage: **planned**. Full YZZ degenerate data and bad-place approximation proof source; equivariant Colmez vertical lift; elliptic/level tensor corrections and local wild refinements.

Atlas planets: Degenerate Schwartz functions; Local arithmetic identity; Nearby quaternionic approximation; Modular cusp correction.

<a id="degenerate-schwartz-classes"></a>

### Degenerate Schwartz classes

**GZ.7/degenerate-schwartz-classes** · definition · `degenerateSchwartz`

For a nonarchimedean v, write Bv=Kv⊕Kvjv and x=x₁+x₂. Let S¹ be the subspace of extended Schwartz Φv vanishing whenever v(uq(x))≥−v(dv) or v(uq(x₂))≥−v(dv). Let S² be the subspace with r(g)Φv(0,u)=0 for every g∈GL₂(Fv), u∈Fv×. These are distinct conditions. The reviewed book introduction prints S¹ at all ramified nonsplit places and at at least two split finite places; the precise Chapter5 reduction, including which split condition is actually required, must be checked before claiming that reduction closed. Colmez’s auxiliary split functions satisfy the explicit S² orbit-zero condition.

Hypotheses: v finite; fixed different, orthogonal decomposition and imported extended Weil action.

Direct prerequisites: `MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil`, [GZ.4/toric-test-vectors](#toric-test-vectors).

Construction/proof: 1. Take the linear subspace cut out by the stated support vanishing. 2. Separately intersect kernels of all zero-evaluation Weil translates for S². 3. Use the source’s chosen local functions to produce a nonzero toric pair satisfying the applicable degeneracy conditions.

Uses: YZZ Chapter5 — Remove self, singular, constant and Hodge terms in the kernel comparison.; Colmez Assumption7.1 — Use two explicit auxiliary split test functions to remove the constant term..

| Declaration | Required API |
|---|---|
| `degenerateSchwartzOne` | The support-vanishing subspace S¹. |
| `degenerateSchwartzTwo` | The orbit-zero subspace S². |
| `degenerateSchwartzOne_support` | Either of the two valuation inequalities forces Φv(x,u)=0. |
| `degenerateSchwartzTwo_translate` | Every Weil translate evaluates to zero at (0,u). |

| Test | Kind | Exact expectation |
|---|---|---|
| `degenerateSchwartz_zero` | degenerate | The zero function belongs to both subspaces. |
| `degenerateSchwartzOne_boundary` | computation | Equality v(uq(x₂))=−v(dv) already forces zero. |
| `degenerateSchwartzTwo_identity_only` | non-example | Vanishing of Φv(0,u) alone is insufficient: every r(g) translate must vanish there. |

Acceptance: Do not silently change the book’s printed S¹ into S²; record the unresolved Chapter5 check..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.5.8, printed p. 17.

<a id="good-local-arithmetic-identity"></a>

### Good-place arithmetic identity

**GZ.7/good-local-arithmetic-identity** · theorem · `goodLocal_arithmetic_identity`

Under the source’s degeneracy assumptions and standard good local data, the derivative local Whittaker component equals twice the arithmetic local height component. At finite nonsplit good places prove this from the actual CM deformation lengths, separating inert and ramified ordinary/supersingular cases; at division places use the nearby coherent algebra and Drinfeld uniformization. Archimedean local Green kernels agree with the holomorphically projected derivative after the same normalization. The general bad/wild case is handled by approximation, not by an unsupported explicit good-place formula.

Hypotheses: Good local level/conductor and degeneracy conditions as specified in the source; Finite deformation theory and archimedean spectral convergence imported.

Direct prerequisites: [GZ.7/degenerate-schwartz-classes](#degenerate-schwartz-classes), [GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions](#hodge-index-theorem-and-admissible-arithmetic-extensions), [GZ.6/incoherent-central-derivative](#incoherent-central-derivative), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `AutomorphicSpectralTheory:AS.4`.

Construction/proof: 1. Compute lengths of the CM lifting loci and translate them to proper-cycle intersections. 2. Match these lengths with the derivative representation-density/Whittaker coefficients. 3. At infinity integrate the Green/resolvent expansion and prove the normalized identity.

Acceptance: Ordinary split vanishing, supersingular inert and superspecial division cases have distinct formulas..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.5.9, printed pp. 18-19.

<a id="nearby-coherent-orthogonality"></a>

### Nearby coherent kernel orthogonality

**GZ.7/nearby-coherent-orthogonality** · theorem · `nearbyCoherent_orthogonal`

For an incoherent quaternionic collection 𝔅, switching its Hasse invariant at a nonsplit place v gives a coherent algebra B(v). A coherent toric theta kernel attached to B(v) is perpendicular to the target quaternionic constituent σ when its local ramification set disagrees with the corrected distinction set Σ(π,χ). The function need not vanish: its σ-Petersson pairing vanishes by the local zero-Hom theorem.

Hypotheses: B(v) is coherent and K embeds as required; the local sign mismatch is at a specified place.

Direct prerequisites: [GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional](#saito-tunnell-dichotomy-and-the-local-toric-functional), [GZ.5/coherent-quaternionic-specialization](#coherent-quaternionic-specialization), `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`.

Construction/proof: 1. Compare the switched local Hasse invariant with the toric epsilon sign. 2. Factor the coherent toric pairing and apply the vanishing local Hom. 3. Use global see-saw/projection to conclude perpendicularity.

Acceptance: A nonzero coherent kernel with wrong local sign is allowed; only its σ-component is zero..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.5.10, printed p. 19.

<a id="degenerate-schwartz-functions-local-decomposition-and-approximation"></a>

### Nearby quaternionic approximation

**GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation** · theorem · `nearbyQuaternionic_approximation`

For the source’s degenerate global Schwartz data, decompose Pr I′ and Z̃ into finitely supported nonsplit local terms. At the bad places their analytic–arithmetic difference is approximated by coherent kernels from B(v), meaning equality on 1^SGL₂(A^S) for a specified finite S. Once the total difference and coherent sum are automorphic with the requisite continuous/K-finite transformation law, the source’s approximation/density argument upgrades the comparison to Pr I′−2Z̃=Σ_v I(0,·,χ,Φ(v)). This sum is generally nonzero, but its σ-projection vanishes by nearby-coherent orthogonality.

Hypotheses: The source’s exact degeneracy and local approximation hypotheses; Density is invoked only in the automorphic category, not to infer a local bad-prime equality.

Direct prerequisites: [GZ.7/degenerate-schwartz-classes](#degenerate-schwartz-classes), [GZ.7/good-local-arithmetic-identity](#good-local-arithmetic-identity), [GZ.7/nearby-coherent-orthogonality](#nearby-coherent-orthogonality), [GZ.6/arithmetic-height-kernel](#arithmetic-height-kernel), [GZ.6/incoherent-central-derivative](#incoherent-central-derivative), `AutomorphicFormsOnReductiveGroups:AF.1`.

Construction/proof: 1. Kill self, logarithmic singular, constant and Hodge contributions under the precise source conditions. 2. Compute good-place identities and construct nearby coherent approximants at each bad place. 3. Use automorphy and the source density argument for the global difference. 4. Apply the separate toric orthogonality theorem; do not identify the error with zero.

Acceptance: The argument removes mild-ramification hypotheses without claiming universal explicit wild coefficients..

Sources: `yzz-gross-zagier-shimura-curves-2013`, Chapter 1, Sec. 1.5.10, printed p. 19.

<a id="boundary-cusp-correction"></a>

### Modular cusp and boundary correction

**GZ.7/boundary-cusp-correction** · theorem · `modularBoundary_correction`

For the noncompact split modular curve X₀(N), form the finite-level compactification and regularized Green/Hecke kernels. Their cusp expansions, finite-part constants, tangent-normalized diagonal values and Eisenstein contributions give the boundary corrections in the classical height kernel. The corrected height/Petersson identity holds after removing the explicitly proved old/Eisenstein components. It is not obtained by applying the compact quaternionic formula unchanged, nor by treating the exceptional infinite modular tower as locally noetherian.

Hypotheses: Classical Heegner hypotheses N, D coprime, D negative fundamental and the ChapterII–IV source hypotheses; Use finite-level compactified curves and the source’s normalized cusp/tangent data.

Direct prerequisites: [GZ.7/classical-resolvent-kernel](#classical-resolvent-kernel), [GZ.7/classical-cusp-expansion](#classical-cusp-expansion), [GZ.7/classical-tangent-symbol](#classical-tangent-symbol), [GZ.6/classical-holomorphic-projection](#classical-holomorphic-projection), `ModularCurvesPartII:R14.4`.

Construction/proof: 1. Compute the resolvent cusp expansion and subtract its pole/constant. 2. Extend the diagonal by the normalized tangent and retain the eta/different self terms. 3. Assemble the finite and infinite corrections and show the remaining difference is old before newform projection.

Acceptance: A height with r_A(m)≠0 still requires the tangent/self corrections..

Sources: `gross-zagier-1986`, II §§2,5; IV §6; V §1.

<a id="colmez-test-function"></a>

### Special test function and integral j

**GZ.7/colmez-test-function** · construction · `colmezTestFunction`

Consume quaternion-datum: choose a maximal order Ô_𝔹 ⊇ Ô_E in the finite incoherent quaternion algebra, and put U = Ô_𝔹^×, U_v = O_{𝔹_v}^×. Retain compactness |Σ(𝔹)| ≥ 2 and no common finite ramification of E and 𝔹. Every O_{B_v} below denotes this same chosen local order O_{𝔹_v}. Order containment is an explicit hypothesis, not an inference from Ô_E^× ⊂ U (E28). Take φ = ⊗φ_v with: (1) v|∞: the standard Gaussian; (2) v finite, nonsplit in E, split in B: 1_{O_{B_v}×O_{F_v}^×}; (3) v nonsplit in B: 1_{O_{B_v}^××O_{F_v}^×}; (4) v ∈ S2, a set of two finite places split in E and unramified over ℚ: 1_{O_{B_v}^××O_{F_v}^×} − (1+N_v+N_v²)^{−1}·1_{ϖ_v^{−1}(O_{B_v})_2×O_{F_v}^×}, where (O_{B_v})_2 = {x ∈ O_{B_v} : v(q(x)) = 2}; (5) v split in E, v ∉ S2: 1_{O_{B_v}×O_{F_v}^×}. For each finite v, fix 𝔧_v ∈ O_{B_v} orthogonal to E_v with v(q(𝔧_v)) ∈ {0,1}, equal to 1 iff B_v is nonsplit (then E_v/F_v is inert). In the split-B case, 𝔧_v acts as Galois conjugation on O_{E_v} ≅ M = O_{F_v}², transported by t ↦ t·m0 with m0 an O_{E_v}-module generator of M, and q(𝔧_v) = −1.

Direct prerequisites: [GZ.7/colmez-s2-assumption](#colmez-s2-assumption), `HilbertModularVarietiesAndShimuraCurves:R18.5`, `MetaplecticAutomorphicForms:MP.5`.

Construction/proof: 1. Use the containing maximal order and primitive O_E-module generator for the integral conjugation element. 2. Form the stated five types of local characteristic functions. 3. At S² apply the Hecke difference with degree N_v²+N_v+1 to prove full Weil-orbit zero evaluation.

Uses: Yuan–Zhang 2018 §7.2 pp590–592 — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `colmezTestFunction_constructor` | The five-place restricted tensor product with the stated original integral 𝔧. |
| `colmezTestFunction_biinvariant` | φ is invariant under the left and right U actions. |
| `colmezTestFunction_auxiliary_degenerate` | For v∈S², r(g)φv(0,u)=0 for all g,u. |
| `colmezTestFunction_order_containment` | The chosen maximal order explicitly contains O_E,v. |

| Test | Kind | Exact expectation |
|---|---|---|
| `colmezTestFunction_auxiliary_q_two` | computation | For N_v=2, the second auxiliary term has coefficient −1/7. |
| `colmezTestFunction_division_units` | non-example | At a division place φv is supported on order units, not the whole order. |
| `colmezTestFunction_primitive_generator` | characterisation | The split-B identification uses an O_E-module generator; a nonprimitive nonzero vector need not give an integral isomorphism. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.2 pp590–592.

<a id="colmez-order-sandwich"></a>

### Integral order sandwich

**GZ.7/colmez-order-sandwich** · theorem · `colmez_order_sandwich`

Use the chosen O_{B_v} ⊇ O_{E_v} and original integral 𝔧_v of test-function, with no common finite ramification. If D_v is the relative discriminant ideal of E_v/F_v, then D_v O_{B_v} ⊂ O_{E_v} + O_{E_v}𝔧_v ⊂ O_{B_v}, with equality on the right iff E_v/F_v is unramified (including split E_v).

Direct prerequisites: [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. When B_v is split, identify the chosen maximal order with End_{O_F}(O_E) using a primitive O_E-generator. Compare the trace-form discriminants of the maximal order and O_E + O_E𝔧_v and compute the dual lattice to obtain D_v O_{B_v} ⊂ O_E + O_E𝔧_v. The index is trivial precisely for unramified E_v/F_v. 2. When B_v is division, E_v/F_v is unramified by the no-common-ramification hypothesis, and O_{B_v} = O_{E_v} + O_{E_v}𝔧_v directly. Do not apply the split maximal-order discriminant-one calculation to this branch.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Lemma7.3 p592.

<a id="colmez-norm-shells"></a>

### Norm congruence shells and ramified correction

**GZ.7/colmez-norm-shells** · construction · `normShell`

For v finite and nonsplit in E, u ∈ O_{F_v}^× and a ∈ uq(E_v^×j_v) (the nearby line), put D_n(a) = {x2 ∈ E_v𝔧_v : uq(x2) − a ∈ p_v^n d_v^{−1}} and D_n = {x2 ∈ E_v𝔧_v : uq(x2) ∈ p_v^n d_v^{−1}}, with dx2 self-dual for (E_v𝔧_v, uq). Put α_v(y,u) = (log N_v/|D_v|^{1/2})·1_{D_v^{−1}O_{E_v}−O_{E_v}}(y)·Σ_{n=0}^{v(d_v)−1} N_v^n ∫_{D_n} φ_v(y+x2,u)dx2.

Direct prerequisites: `AutomorphicLFunctionsAndLocalFactors:AL.1`, `HeightsRationalPointsAndObstructions:RP.2`, [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Define norm-congruence sets in the original quadratic line with its self-dual measure. 2. Use the local different for the additive-character threshold; define α by the finite shell sum on D⁻¹O_E∖O_E.

Uses: Yuan–Zhang 2018 §7.3, pp. 593–594 (D_n(a) and α_v p. 593, D_n p. 594) — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `normShell_constructor` | D_n(a)={x₂:uq(x₂)−a∈pⁿd⁻¹} and D_n with a=0. |
| `normShell_measure` | Use the self-dual measure of the original quadratic line (E𝔧,uq). |
| `normShell_ramified_correction` | α uses the finite n<v(d) shell sum off O_E inside D⁻¹O_E. |
| `normShell_inert_cutoff` | In the inert opposite norm class D_n(a) is empty above v(ad). |

| Test | Kind | Exact expectation |
|---|---|---|
| `normShell_inert_last_shell` | computation | For v(ad)=0 the only possible nonnegative shell is n=0. |
| `normShell_unramified_different` | degenerate | If v(d)=0 the finite sum defining α is empty. |
| `normShell_different_vs_discriminant` | non-example | Replacing v(d) by v(D) changes the shell bound and is not the same definition. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.3, pp. 593–594 (D_n(a) and α_v p. 593, D_n p. 594).

<a id="colmez-shell-inert"></a>

### Inert norm-shell cutoff

**GZ.7/colmez-shell-inert** · theorem · `colmez_shell_inert`

If Ev/Fv is unramified quadratic and a lies in the opposite nearby norm class, Dn(a)=Dn for n≤v(a dv), and Dn(a)=∅ for n>v(a dv).

Direct prerequisites: [GZ.7/colmez-norm-shells](#colmez-norm-shells), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Use opposite parity of the valuations of represented norms.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.3, Lemma 7.5(1), p. 594; proof p. 595.

<a id="colmez-shell-ramified"></a>

### Ramified norm-shell volume

**GZ.7/colmez-shell-ramified** · theorem · `colmez_shell_ramified`

For ramified Ev/Fv, Dn(a)=Dn for n≤v(a dv), is empty for n>v(a dv)+v(Dv)−1, and for v(a dv)<n≤v(a dv)+v(Dv)−1 has volume |Dv|^1/2 |dv| |a| q^(v(a dv)−n).

Direct prerequisites: [GZ.7/colmez-norm-shells](#colmez-norm-shells), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Use the conductor of the local quadratic norm subgroup and index-two unit cosets, including wild/dyadic conductor.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.3, Lemma 7.5(2), p. 594; proof p. 595.

<a id="colmez-k-inert"></a>

### Inert logarithmic singularity and diagonal extension

**GZ.7/colmez-k-inert** · theorem · `colmez_k_inert`

For inert v with §7.2 data, kφv(1,y,u)−(1/2)φv(y1,u)1OEj(y2)(v(q(y2)/q(jv))+1)log q extends to a Schwartz function; its restriction to E is φv(y,u)(|dv qjv|−1)log q/((1+q^−1)(1−q)). The jv in the singular term is the original test-function j, not the nearby j.

Direct prerequisites: [GZ.7/colmez-shell-inert](#colmez-shell-inert), [GZ.7/colmez-order-sandwich](#colmez-order-sandwich), [GZ.6/colmez-local-k-c](#colmez-local-k-c), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Insert shell cutoff into normalized Whittaker derivative and evaluate finite geometric sums; verify source's nearby-line convention when implementing.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.3, Lemma 7.4(1), pp. 592–593; proof pp. 596–597.

<a id="colmez-k-ramified"></a>

### Ramified logarithmic singularity and diagonal extension

**GZ.7/colmez-k-ramified** · theorem · `colmez_k_ramified`

For ramified v with §7.2 data, subtract (1/2)φv(y1,u)1OEj(y2)(v(qy2)+1)log q from kφv(1,y,u). It extends to Schwartz; on E its value is φv(y,u)[(|dv|−1)/(2(1−q))+(v(Dv)−1)/2]log q+αv(y,u)/2.

Direct prerequisites: [GZ.7/colmez-shell-ramified](#colmez-shell-ramified), [GZ.6/colmez-local-k-c](#colmez-local-k-c), [GZ.7/colmez-order-sandwich](#colmez-order-sandwich), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Split the shell series into n<v(dv), n≤v(a dv), and the conductor tail; keep α on Dv^−1OE−OE.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.3, Lemma 7.4(2), p. 593; proof pp. 597–598.

<a id="colmez-c-arch"></a>

### Archimedean zero-term correction

**GZ.7/colmez-c-arch** · theorem · `colmez_c_arch`

For standard archimedean φ and all g,y,u, cφv(g,y,u)=0.

Direct prerequisites: [GZ.6/colmez-local-k-c](#colmez-local-k-c), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Evaluate normalized W0(s) as δ(g)^−s r(g)φ(0,u); derivative cancels the logδ term.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.3, Lemma 7.6(1), p. 599 (via [YZZ13, Prop. 2.11]).

<a id="colmez-c-finite"></a>

### Finite zero-term correction

**GZ.7/colmez-c-finite** · theorem · `colmez_c_finite`

For v non-archimedean, (y,u) ∈ E_v×F_v^× and φ as in §7.2. If v ∉ S2: c_{φ_v}(1,y,u) = φ_v(y,u)·log|d_vq(𝔧_v)| plus φ_v(y,u)·2(|d_vq(𝔧_v)|−1)log N_v/((1+N_v^{−1})(1−N_v)) if E_v/F_v is inert; plus φ_v(y,u)·(|d_vq(𝔧_v)|−1)log N_v/(1−N_v) + α_v(y,u) if ramified; plus 0 if split. If v ∈ S2: c_{φ_v}(1,y,u) = −(2 log N_v/(1+N_v+N_v²))·1_{ϖ_v^{−1}(O_{B_v})_2}(y)·1_{O_{F_v}^×}(u), i.e. 2 log N_v·(φ_v(y,u) − 1_{O_{B_v}^××O_{F_v}^×}(y,u)); on E_v the set ϖ_v^{−1}(O_{B_v})_2 is {y ∈ ϖ_v^{−1}O_{E_v} : q(y) ∈ O_{F_v}^×}. Here α_v is as in Lemma 7.4.

Direct prerequisites: [GZ.6/colmez-whittaker](#colmez-whittaker), [GZ.7/colmez-norm-shells](#colmez-norm-shells), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Use the corrected a=0 Whittaker normalization; compute inert/ramified geometric series and the split norm-product volumes; verify both S2 summands separately.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.3, Lemma 7.6(2), p. 599; proof pp. 599–604.

<a id="colmez-omega-self"></a>

### Diagonal coefficient and modified self-intersection

**GZ.7/colmez-omega-self** · construction · `modifiedSelfIntersection`

Set Ωφ=Σu∈μU²\F* Σy∈E* r(g,(t1,t2))φ(y,u). The coefficient of t2 in Z*t1 is Ωφ/e, e=[E*∩U:μU]=[OE*:OF*] at maximal level. Define i0(t,t)=i(t,t)−Σv iv(t,t)logNv, where iv is the extended local diagonal pairing, not the actual global self-intersection.

Direct prerequisites: [GZ.6/special-correspondence-cycle](#special-correspondence-cycle), [GZ.6/colmez-torus-average](#colmez-torus-average), [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing), [GZ.7/colmez-finite-multiplicity](#colmez-finite-multiplicity), [GZ.7/colmez-arch-green](#colmez-arch-green), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Count the double cosets contributing the CM point t₂ and divide by [E×∩U:μU]. 2. Subtract that diagonal coefficient to isolate proper intersection; use the extended local symbols for their own finite-part sum.

Uses: Yuan–Zhang 2018 §8.1, pp. 608–609 (the coefficient of [t2]_U in Z_*(g)t1 and Ω_φ); Theorem 8.6(1)–(2), p. 616 (i_0 and i_v(t2,t2) = ∫_{C_U} ī_v(tt2,tt2)dt) — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `modifiedSelfIntersection_constructor` | Ωφ and i₀=i−Σv i_v logN_v, with extended local diagonals. |
| `modifiedSelfIntersection_coefficient` | The coefficient of t₂ in Z*t₁ is Ωφ/e. |
| `modifiedSelfIntersection_proper_subtraction` | Subtract Ωφt₂/e before taking the proper horizontal intersection. |
| `modifiedSelfIntersection_average` | i_v is the normalized C_U average of the extended local pairing. |

| Test | Kind | Exact expectation |
|---|---|---|
| `modifiedSelfIntersection_split_extended_zero` | degenerate | At an E-split finite place the extended local diagonal is zero. |
| `modifiedSelfIntersection_elliptic_index_two` | computation | For e=2 the diagonal coefficient is Ωφ/2. |
| `modifiedSelfIntersection_self_not_extension` | non-example | The actual global arithmetic self-intersection i is not replaced by the sum of formal extended local diagonals. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §8.1, pp. 608–609 (the coefficient of [t2]_U in Z_*(g)t1 and Ω_φ); Theorem 8.6(1)–(2), p. 616 (i_0 and i_v(t2,t2) = ∫_{C_U} ī_v(tt2,tt2)dt).

<a id="colmez-arch-green"></a>

### Regularized archimedean multiplicity

**GZ.7/colmez-arch-green** · construction · `regularizedCmGreen`

For distinct CM lifts use ms(γ)=Qs(1−2λγ), with Qs(t)=∫0∞(t+sqrt(t²−1)cosh u)^−1−s du. Define extended diagonal Green sums by excluding E* and taking the constant Laurent coefficient at s=0.

Direct prerequisites: `AutomorphicSpectralTheory:AS.2`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Import Q_s and the Green/resolvent meromorphic continuation from AS.2. 2. Form the nearby-quaternion sum excluding E× and take its Laurent constant; compare to ordinary distinct-point heights.

Uses: Yuan–Zhang 2018 §8.2, pp. 609–610 — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `regularizedCmGreen_constructor` | Take the Laurent constant at s=0 of the E×-omitted nearby-quaternion Green sum. |
| `regularizedCmGreen_distinct_points` | For distinct points this agrees with the ordinary archimedean local height. |
| `regularizedCmGreen_diagonal_exclusion` | The extended diagonal omits E× multipliers. |
| `regularizedCmGreen_constant_term` | The finite part discards the simple-pole term, not the whole Laurent germ. |

| Test | Kind | Exact expectation |
|---|---|---|
| `regularizedCmGreen_Q_zero` | computation | At s=0, Q₀(t)=½log((t+1)/(t−1)) for t>1. |
| `regularizedCmGreen_ordinary_domain` | non-example | Including an E× multiplier on the diagonal introduces the undefined singular term. |
| `regularizedCmGreen_pole_subtraction` | characterisation | For a/s+b+O(s), the regularized value is b. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §8.2, pp. 609–610.

<a id="colmez-arch-proper"></a>

### Archimedean proper-height expression

**GZ.7/colmez-arch-proper** · theorem · `colmez_arch_proper`

At a real place, ivbar(Z*t1,t2)proper=Mφ^(v)(g,(t1,t2))−ivbar(t2,t2)Ωφ/e, where M is the regularized ms-weighted nearby-quaternion sum.

Direct prerequisites: [GZ.7/colmez-arch-green](#colmez-arch-green), [GZ.7/colmez-omega-self](#colmez-omega-self), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Subtract the explicit diagonal multiplicity and apply the off-diagonal Green expansion; justify meromorphic continuation separately.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §8.2, Proposition 8.2, p. 610.

<a id="colmez-finite-multiplicity"></a>

### Finite local multiplicities and diagonal omission

**GZ.7/colmez-finite-multiplicity** · construction · `cmLocalMultiplicity`

(i) Let v be finite and nonsplit in E, and B = B(v). The multiplicity function m is defined on 𝔥_{U_v} = B_v^× ×_{E_v^×} 𝔹_v^×/U_v away from the image of (1,1), with m(b^{-1},β^{-1}) = m(b,β). For distinct [β1]_U ∈ CM_U and [t2]_U ∈ C_U, ī_v(β1,t2) = Σ_{γ∈μ_U\B^×} m(γt_{2v}, β_{1v}^{-1}) 1_{U^v}((β_1^v)^{-1}γt_2^v) ([YZZ13, Lemma 8.2]). For all pairs, ī_v is defined by the same sum over γ ∈ μ_U\(B^× − E^×∩β1Ut2^{-1}), equivalently over (B^×−E^×) ∪ (E^× − β1U_vt2^{-1}). For (y,u) ∈ (B_v−E_v)×F_v^×, m_{φ_v}(y,u) = Σ_{x∈𝔹_v^×/U_v} m(y,x^{-1}) φ_v(x, uq(y)/q(x)). For (y,u) ∈ E_v^××F_v^×, n_{φ_v}(y,u) = Σ_{x∈(𝔹_v^×−yU_v)/U_v} m(y,x^{-1}) φ_v(x, uq(y)/q(x)). (ii) Let v be split in E, with ν1, ν2 above v and E_v diagonal in 𝔹_v ≅ M2(F_v). The function m_ν̄1 on GL2(F_v)/U_v is supported on N(F_v)U_v/U_v. For U_v = (1+p_v^rO_{𝔹_v})^×, m_ν̄1(n(b)) = 1/(N_v^{r−v(b)−1}(N_v−1)) when v(b) ≤ r−1. The function m_ν̄2 is the same with lower unipotents N^t, and m_v̄ = ½(m_ν̄1+m_ν̄2). The extended pairing is ī_ν(β1,t2) = Σ_{γ∈μ_U\(E^×−β1U_vt2^{-1})} m_ν̄(t2^{-1}γ^{-1}β1) 1_{U^v}(β1^{-1}γt2), and ī_v(t,t) = 0. Finally n_{φ_v}(y,u) = ½Σ_{x∈(N(F_v)U_v−U_v)/U_v} φ_v(yx,u) m_ν̄1(x) + ½Σ_{x∈(N^t(F_v)U_v−U_v)/U_v} φ_v(yx,u) m_ν̄2(x).

Direct prerequisites: `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing), `HeegnerPointEulerSystems:HE.2`, [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Import CM deformation and ordinary/superspecial uniformization multiplicities. 2. Omit exactly the undefined diagonal orbit before forming the extended sum. 3. Change Hecke coset variables to form mφ and nφ; average the two split-prime ordinary functions.

Uses: Yuan–Zhang 2018 §8.2 pp611–616 — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `cmLocalMultiplicity_constructor` | The geometric multiplicity m away from the diagonal orbit and its mφ,nφ sums. |
| `cmLocalMultiplicity_diagonal_omission` | For an extended pairing omit precisely the undefined E×∩β₁Ut₂⁻¹ summands. |
| `cmLocalMultiplicity_inverse_symmetry` | m(b⁻¹,β⁻¹)=m(b,β). |
| `cmLocalMultiplicity_ordinary_average` | At an E-split place use ½(mν₁+mν₂), upper and lower unipotents. |

| Test | Kind | Exact expectation |
|---|---|---|
| `cmLocalMultiplicity_ordinary_r_one` | computation | For r=1,v(b)=0 the upper-unipotent multiplicity is 1/(N_v−1). |
| `cmLocalMultiplicity_split_diagonal` | degenerate | The extended ordinary diagonal is zero. |
| `cmLocalMultiplicity_wrong_half_sum` | non-example | Repeating mν₂ twice misses an upper-unipotent contribution; the two prime contributions must be averaged. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §8.2 pp611–616.

<a id="colmez-nonsplit-proper"></a>

### Nonsplit proper-height expression

**GZ.7/colmez-nonsplit-proper** · theorem · `colmez_nonsplit_proper`

For nonsplit finite v, ivbar(Z*t1,t2)proper=Mφ^(v)+Nφ^(v)−ivbar(t2,t2)Ωφ/e, with M from mφ and N from nφ, and the distinct torus-translation conventions of Proposition8.3.

Direct prerequisites: [GZ.7/colmez-finite-multiplicity](#colmez-finite-multiplicity), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Separate B(v)*−E* terms from E* off-diagonal terms in the multiplicity sum and regroup through Hecke cosets.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Proposition8.3 pp611–612.

<a id="colmez-ordinary-pairing"></a>

### Ordinary multiplicity and local pairing

**GZ.7/colmez-ordinary-pairing** · theorem · `colmez_ordinary_pairing`

Let v be split in E, with 𝔹_v ≅ M2(F_v), E_v the diagonal torus, and ν1 corresponding to the upper-left idempotent. For every open compact U and distinct CM points [β1]_U ∈ CM_U, [t2]_U ∈ C_U: ī_ν1(β1,t2) = Σ_{γ∈μ_U\E^×} m_ν̄1(t2^{-1}γ^{-1}β1) 1_{U^v}(β1^{-1}γt2). Here m_ν̄1: GL2(F_v)/U_v → Q is Zhang's ordinary multiplicity, supported on N(F_v)U_v/U_v. For U_v = (1+p_v^rO_{𝔹_v})^×, m_ν̄1(n(b)) = 1/(N_v^{r−v(b)−1}(N_v−1)) when v(b) ≤ r−1 ([Zha01, Lemma 5.5.1]). The same holds for ν2 with lower-triangular unipotents. Extended to all pairs by summing over γ ∈ μ_U\(E^×−β1U_vt2^{-1}), the formula gives ī_ν1(t2,t2) = 0 for every [t2]_U ∈ C_U.

Direct prerequisites: [GZ.7/colmez-finite-multiplicity](#colmez-finite-multiplicity), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. At small level the only contributing global γ is unique modulo μ; pass to general level using projection and the factor [μU:μU'].

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §8.2, Lemma 8.4, pp. 613–614; ν2 version and m_v̄, i_v̄, pp. 614–615.

<a id="colmez-split-proper"></a>

### Split proper height and zero extended diagonal

**GZ.7/colmez-split-proper** · theorem · `colmez_split_proper`

For E-split v, ivbar(t,t)=0 and ivbar(Z*t1,t2)proper=Nφ^(v), the half-sum of the two ordinary unipotent multiplicities.

Direct prerequisites: [GZ.7/colmez-ordinary-pairing](#colmez-ordinary-pairing), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Use commutativity for the diagonal and change Hecke coset variables for the proper terms.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Proposition8.5 pp615–616.

<a id="colmez-height-decomposition-series"></a>

### Full local decomposition of the height series

**GZ.7/colmez-height-decomposition-series** · theorem · `colmez_height_decomposition_series`

Let (B,E,U) be as in §7.2 with |Σ| > 1, and let φ ∈ S(𝔹×A^×) be U×U-invariant and satisfy Assumption 7.1. Then for all t1,t2 ∈ C_U and g ∈ GL2(A): Z(g,(t1,t2),φ)_U = −Σ_{v nonsplit in E}(log N_v)∫_{C_U} M^{(v)}_φ(g,(tt1,tt2))dt − Σ_{v∤∞} N^{(v)}_φ(g,(t1,t2)) log N_v − Σ_{v∤∞} j_v(Z_*(g,φ)t1,t2) log N_v − i_0(t2,t2)Ω_φ(g,(t1,t2))/[E^×∩U:μ_U]. Here log N_v = 1 for real v. i_0(t2,t2) = i(t2,t2) − Σ_v i_v(t2,t2) log N_v, with i_v(t2,t2) = ∫_{C_U} ī_v(tt2,tt2)dt the extended local pairing. M^{(v)} is given by Proposition 8.2 for v|∞ and Proposition 8.3 for finite v. N^{(v)} is given by Proposition 8.3 for nonsplit v and Proposition 8.5 for split v. N^{(v)}(g,(tt1,tt2)) = N^{(v)}(g,(t1,t2)) because only y ∈ E^× occurs.

Direct prerequisites: [GZ.7/colmez-arch-proper](#colmez-arch-proper), [GZ.7/colmez-nonsplit-proper](#colmez-nonsplit-proper), [GZ.7/colmez-split-proper](#colmez-split-proper), [GZ.7/colmez-omega-self](#colmez-omega-self), [GZ.7/colmez-s2-assumption](#colmez-s2-assumption), [GZ.6/colmez-rev-hodge-class-terms-vanish-and](#colmez-rev-hodge-class-terms-vanish-and), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Use rev-hodge-class-terms-vanish-and coefficientwise over finite permitted fields, with pairings normalized by [H:F]. Its two S2 places kill the Hodge cross terms. Decompose proper horizontal and vertical intersections, isolate the self-term, and use C_U-invariance of N; retain normalized C_U averages and log N_v = 1 at real v.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Theorem8.6 pp616–617.

<a id="colmez-local-m-inert"></a>

### Supersingular inert local intersection

**GZ.7/colmez-local-m-inert** · theorem · `colmez_local_m_inert`

For E-inert and B-split v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·(v(qy2)+1)/2.

Direct prerequisites: [GZ.7/colmez-finite-multiplicity](#colmez-finite-multiplicity), [GZ.7/colmez-test-function](#colmez-test-function), `ComplexMultiplicationAndExplicitReciprocity:CM.5`, [GZ.7/colmez-rev-corrected-cm-multiplicity-at-split](#colmez-rev-corrected-cm-multiplicity-at-split).

Construction/proof: 1. Use YZZ local deformation multiplicity with its inert norm classes; the nearby j belongs to the switched algebra.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Lemma8.7(1), first case pp617–618.

<a id="colmez-local-m-ramified"></a>

### Wild-inclusive ramified local intersection

**GZ.7/colmez-local-m-ramified** · theorem · `colmez_local_m_ramified`

For E-ramified and B-split v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·(v(qy2)+v(Dv))/2, including wild ramification.

Direct prerequisites: [GZ.7/colmez-finite-multiplicity](#colmez-finite-multiplicity), [GZ.7/colmez-test-function](#colmez-test-function), `ComplexMultiplicationAndExplicitReciprocity:CM.5`, [GZ.7/colmez-rev-corrected-cm-multiplicity-at-split](#colmez-rev-corrected-cm-multiplicity-at-split).

Construction/proof: 1. Use the corrected c=0 multiplicity (1/2)v(Dv λ), not the erroneous tame-only formula inherited from Zha01/YZZ; original Gross lifting proof remains a gate.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Lemma8.7(1), second case pp617–618.

<a id="colmez-local-m-division"></a>

### Superspecial local intersection

**GZ.7/colmez-local-m-division** · theorem · `colmez_local_m_division`

For B-division (hence E-inert) v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·v(qy2)/2.

Direct prerequisites: [GZ.7/colmez-superspecial-m](#colmez-superspecial-m), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Use the integral upper-half-plane multiplicity of Lemma8.8 and Bv*/Uv≃Z.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Lemma8.7(1), third case pp617–619.

<a id="colmez-local-n"></a>

### Diagonal-correction local coefficient

**GZ.7/colmez-local-n** · theorem · `colmez_local_n`

Let (U,φ) be as in §7.2. For every finite place v ∉ S2 and (y,u) ∈ E_v^××F_v^×, n_{φ_v}(y,u) = φ_v(y,u)·½v(q(y)). For 𝔹_v nonsplit this is identically 0, since v(q(y)) = 0 on supp φ_v; for v nonsplit in E and 𝔹_v split it is the c ≥ 1 sum Σ_c m(y^{-1},h_c)vol(E_v^×h_cGL2(O)∩M2(O)_n); for v split it is ½(v(a)+v(d)) for y = diag(a,d). For v ∈ S2: n_{φ_v}(y,u) = −(1+N_v+N_v²)^{-1}·1_{ϖ_v^{-1}(O_{𝔹_v})_2}(y)·1_{O_{F_v}^×}(u). The ψ1 part vanishes, and the ψ2 part equals ½((1+v(a))+(1+v(d))) = 1 on its support. With the corrected Lemma 7.6(2) at S2, c_{φ_v}(1,y,u) = −(2log N_v/(1+N_v+N_v²))ψ2(y,u), so d_{φ_v}(1,y,u) = 0 still holds there.

Direct prerequisites: [GZ.7/colmez-ordinary-pairing](#colmez-ordinary-pairing), [GZ.7/colmez-finite-multiplicity](#colmez-finite-multiplicity), [GZ.7/colmez-test-function](#colmez-test-function), [GZ.7/colmez-c-finite](#colmez-c-finite).

Construction/proof: 1. Use the chosen order and original 𝔧_v of test-function. Outside S2, omit conductor c = 0 in the nonsplit-E/split-B sum; at division B the norm valuation vanishes on support; in the split case the shell counts give ½(v(a)+v(d)). 2. At S2 compute each summand separately: n_{ψ1} = 0, while n_{ψ2} = ½((1+v(a))+(1+v(d))) = 1 on ψ2 support because v(a)+v(d) = 0. Thus n_φ = −ψ2/(1+N_v+N_v²), not zero. Use c_φ = −2ψ2 log N_v/(1+N_v+N_v²) = 2n_φ log N_v, and log|u q(y)| = 0 there, to obtain d_φ = 0.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Lemma8.7(2) pp617–619.

<a id="colmez-superspecial-m"></a>

### Superspecial multiplicity by uniformization

**GZ.7/colmez-superspecial-m** · theorem · `colmez_superspecial_m`

For B-division and E-inert v, m(γ,β) vanishes unless qγ qβ is a unit and γ∈Ev*(1+OE,v πv jv); in that support m(γ,β)=v(λγ)/2.

Direct prerequisites: `HilbertModularVarietiesAndShimuraCurves:R18.5`, [GZ.7/colmez-test-function](#colmez-test-function), `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`.

Construction/proof: 1. Use Čerednik–Drinfeld formal uniformization, reduce to two sections of P¹ over OEv with nonrational reductions, and compute largest congruence exponent for γ=a+bj.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Lemma8.8 pp619–621.

<a id="colmez-vertical-pseudo"></a>

### Vertical correction is nonsingular pseudo-theta

**GZ.7/colmez-vertical-pseudo** · theorem · `colmez_vertical_pseudo`

Let v be finite, nonsplit in 𝔹 and inert in E, with (U,φ) as in §7.2 (U_v = O_{𝔹_v}^×, φ_v = 1_{O_{𝔹_v}^×}⊗1_{O_{F_v}^×}), and B = B(v), so B_v ≅ M2(F_v). Fix a lift Ṽ = Σ_i a_iW̃_i to Ω̂⊗O_{F_v^ur} of the vertical divisor V_1. For t1,t2 ∈ C_U: j̄_v(Z_*(g,φ)t1,t2) = Σ_{u∈μ_U²\F^×} Σ_{γ∈B^×} r(g,(t1,t2))φ^v(γ,u) l^{(t1,t2)}_{r(g)φ_v}(γ,u), where l^{(t1,t2)}_{φ_v}(γ,u) = Σ_{x∈𝔹_v^×/U_v} φ_v(x, uq(t1^{-1}γt2)/q(x)) 1_{O^×}(q(x)/q(t1^{-1}γt2)) (γ^{-1}z0·Ṽ) = (γ^{-1}z0·Ṽ)·1_{O^×}(q(γ)q(t2)/q(t1))·1_{O^×}(u), and γ^{-1}z0·Ṽ = Σ_i a_i1_{α_iF_v^×GL2(O_{F_v})}(γ^{-1}). This kernel is supported on finitely many cosets of GL2(O_{F_v}) in B_v^× and on u ∈ O^×. It therefore extends by zero to a Schwartz function on B_v×F_v^×, so j̄_v and j_v = ∫_{C_U} j̄_v(Z_*(g)tt1,tt2)dt are finite sums of nonsingular pseudo-theta series on the full space B(v). Remark 8.10: the same holds for any U_v-invariant φ_v with φ_v(0,u) = 0.

Direct prerequisites: [GZ.7/colmez-superspecial-m](#colmez-superspecial-m), [GZ.6/colmez-pseudo-theta](#colmez-pseudo-theta), [GZ.2/admissible-arithmetic-extension](#admissible-arithmetic-extension), `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Use the direct kernel in the second displayed formula on p. 623 with the fixed lift Ṽ. Its dependence on t1,t2 enters through q(t2)/q(t1); on φ_v = 1_{O_{𝔹_v}^×}⊗1_{O_F^×} the x-sum reduces to the unit-norm indicator times (γ^{-1}z0·Ṽ). No assertion that t2 fixes every component, and no equivariant-lift argument, is needed. 2. Index the finitely many components of Ṽ by α_i F_v^×GL2(O_F). Their indicators give the direct component pairing on p. 624. Combined with the fixed norm valuation, each such support is a finite union of GL2(O_F)-cosets, hence compact and open away from singular matrices. Extend by zero to a Schwartz function and apply the finite C_U average. This is the accepted amended E17 repair.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Lemma8.9,Remark8.10 pp622–624.

<a id="colmez-vertical-split-zero"></a>

### Vertical correction vanishes at B-split places

**GZ.7/colmez-vertical-split-zero** · theorem · `colmez_vertical_split_zero`

At a finite B-split place in the maximal-level setup, jv(Z*t1,t2)=0.

Direct prerequisites: `HilbertModularVarietiesAndShimuraCurves:R18.5`, [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Use a smooth auxiliary-level cover with disjoint irreducible fiber components and descend their underlying component decomposition to the quotient.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §8.3 p621.

<a id="colmez-kernel-schwartz"></a>

### Analytic–arithmetic difference is a finite pseudo-theta sum

**GZ.7/colmez-kernel-schwartz** · theorem · `colmez_kernel_schwartz`

For §7.2 data, archimedean K−M=0; at finite nonsplit v, k−m logq extends to Schwartz; dφ=2nφ logq−cφ+(2logδ+log|uqy|)rφ extends to Schwartz on E. All but finitely many local differences vanish identically.

Direct prerequisites: [GZ.7/colmez-k-inert](#colmez-k-inert), [GZ.7/colmez-k-ramified](#colmez-k-ramified), [GZ.7/colmez-c-finite](#colmez-c-finite), [GZ.7/colmez-local-n](#colmez-local-n), [GZ.7/colmez-vertical-pseudo](#colmez-vertical-pseudo), [GZ.6/colmez-projected-derivative](#colmez-projected-derivative), [GZ.7/colmez-height-decomposition-series](#colmez-height-decomposition-series), [GZ.7/colmez-arch-proper](#colmez-arch-proper), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Use Lemmas7.4/7.6/8.7 and unramified Iwasawa covariance; combine with the vertical nonsingular series.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §9.1 pp625–627.

<a id="colmez-local-cancel-nonsplit"></a>

### Nonsplit diagonal cancellation

**GZ.7/colmez-local-cancel-nonsplit** · theorem · `colmez_local_cancel_nonsplit`

Let v be finite and nonsplit in E, with (U,φ,𝗃_v,j_v) as in §7.2. For (y,u) ∈ E_v×F_v^×: 2k_{φ_v}(1,y,u) − 2m_{φ_v}(y,u)log N_v + d_{φ_v}(1,y,u) = −log|d_vq(𝗃_v)|_v·φ_v(y,u). Here k_{φ_v}(1,·) − m_{φ_v}·log N_v is the Schwartz extension from B(v)_v−E_v to B(v)_v×F_v^× of Lemmas 7.4 and 8.7, evaluated on E_v, and d_{φ_v}(1,y,u) = 2n_{φ_v}(y,u)log N_v − c_{φ_v}(1,y,u) + log|uq(y)|_vφ_v(y,u).

Direct prerequisites: [GZ.7/colmez-kernel-schwartz](#colmez-kernel-schwartz), [GZ.7/colmez-local-m-ramified](#colmez-local-m-ramified), [GZ.7/colmez-local-m-inert](#colmez-local-m-inert), [GZ.7/colmez-local-m-division](#colmez-local-m-division), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Insert inert or ramified singularity-subtracted restrictions. In the ramified case α cancels and the remaining v(Dv) term cancels the geometric multiplicity correction.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §9.1, Proposition 9.2(1), pp. 627–628.

<a id="colmez-local-cancel-split"></a>

### Split diagonal cancellation

**GZ.7/colmez-local-cancel-split** · theorem · `colmez_local_cancel_split`

For split finite v, with the chosen order and original 𝔧_v of test-function, d_φ(1,y,u) = −log|d_v q(𝔧_v)| φ_v(y,u). At v ∉ S2 use the usual local-n and c-finite formulas. At v ∈ S2 one has c_φ = 2n_φ log N_v, log|u q(y)| = 0 on support, q(𝔧_v) = −1 and |d_v| = 1, so both sides are zero.

Direct prerequisites: [GZ.7/colmez-local-n](#colmez-local-n), [GZ.7/colmez-c-finite](#colmez-c-finite), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. For v ∉ S2, n_φ = ½v(q(y))φ_v, c_φ = φ_v log|d_v q(𝔧_v)|, and u is a unit on support. Substitute in d_φ = 2n_φ log N_v − c_φ + log|u q(y)|φ_v (p. 626). Since log|q(y)| = −v(q(y))log N_v, the valuation terms cancel, leaving −c_φ. 2. At S2 use the separate corrected formulas n_φ = −ψ2/(1+N_v+N_v²), c_φ = 2n_φ log N_v and log|u q(y)| = 0. With the same d_φ convention as Proposition 9.2, the two correction contributions cancel, giving d_φ = 0. The different is a unit since F_v/Q_p is unramified, and the original 𝔧_v has norm −1. Never replace the S2 computation by the usual valuation formula.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Proposition9.2(2) p628.

<a id="colmez-nonzero-theta"></a>

### Nonzero associated weight-one theta

**GZ.7/colmez-nonzero-theta** · theorem · `colmez_nonzero_theta`

Let (F,E,𝔹,U,φ) be as in §7.2. The weight-one theta series θ_{Ω,1}(g) = Σ_{u∈μ_U²\F^×} Σ_{y∈E} r_E(g)φ(y,u), which is the outer theta series of Ω_φ, is not identically zero. Take g_v = [[0,1],[−1,0]] at v ∈ Σ_f ∪ S2 and g_v = 1 elsewhere. Every term r_E(g)φ(0,u) is ε times a nonnegative number, with ε = Π_{v∈Σ_f}λ(E_v/F_v,ψ_v) ∈ {±1}, and |r_E(g)φ(0,1)| > 0. At v ∈ S2, ∫_{E_v}φ_v(y,1)dy = (1−N_v^{-1})²(1 − 3/(1+N_v+N_v²)) > 0. So the finite sum over u ∈ O_F^{×,+}/μ_U² is nonzero.

Direct prerequisites: [GZ.7/colmez-test-function](#colmez-test-function), `MetaplecticAutomorphicForms:MP.5`.

Construction/proof: 1. Use the Weil action of E itself, rather than the ambient quaternion algebra, at the specified g. Inert division places contribute their Weil index λ(E_v/F_v,ψ_v), which is independent of u on the allowed support. Their product is the common sign ε. 2. Every constant-term summand is ε times a nonnegative quantity. At S2 the integral is (1−N_v^{-1})²(1−3/(1+N_v+N_v²)) > 0, and the remaining factors at u = 1 have nonzero absolute value. Therefore |r_E(g)φ(0,1)| > 0; the finite sum over O_F^{×,+}/μ_U² has sign ε and cannot vanish. Positivity of the signed constant term is not required.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §9.1, p. 628.

<a id="colmez-adjunction-arch"></a>

### Archimedean adjunction constant

**GZ.7/colmez-adjunction-arch** · theorem · `colmez_adjunction_arch`

With Petersson norm ||dz||=2 Im z and Q0(t)=(1/2)log((t+1)/(t−1)), the limit of m0(z0,z1)−log(2 Im z1/|z1−z0|) as z1→z0 is 0, so −log||1||w=iw(P,P)/e.

Direct prerequisites: [GZ.7/colmez-arch-green](#colmez-arch-green), [GZ.2/colmez-residue-line](#colmez-residue-line), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Algebraically rewrite as (1/2)log(1+|z1−z0|²/(4Imz0 Imz1))−(1/2)log(Imz1/Imz0); both limits vanish.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §9.2 pp631–632.

<a id="colmez-small-level-diagonal"></a>

### Extended local diagonal vanishes at small away-v level

**GZ.7/colmez-small-level-diagonal** · theorem · `colmez_small_level_diagonal`

For nonsplit finite v, with U'v sufficiently small and U'v normal in Uv away from v as in §9.2, ivbar([1]U',[1]U')=0. For split v it is zero without shrinking.

Direct prerequisites: [GZ.7/colmez-finite-multiplicity](#colmez-finite-multiplicity), `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Bound support in a compact local subgroup; in a totally definite nearby algebra global units modulo central μ are finite; shrink the away-v level to exclude the noncentral cosets.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §9.2, Lemma 9.5, p. 634 (split case, p. 635).

<a id="colmez-modified-projection"></a>

### Geometric realization of extended self-intersection

**GZ.7/colmez-modified-projection** · theorem · `colmez_modified_projection`

Let (B,E,U) be as in §7.2 with |Σ| > 1, P = [1]_U ∈ X_U(H) (H the Hilbert class field of E), w a finite place of H over v, and R = O_{H_w^ur}. Let U′ = U_vU′^v, where U′^v ⊂ U^v is open, normal and small enough that X_{U′,R} is regular, E^× ∩ U′μ_U = μ_U, and Lemma 9.5 holds. Let π: X_{U′,R} → X_{U,R} be the projection. Then every irreducible component 𝒫′ of the divisor π^*𝒫_R is the image of a section Spec R → X_{U′,R} and occurs in π^*𝒫_R with multiplicity e = [O_E^×:O_F^×]. Moreover i_w(P,P) = ī_v(P,P) = ⟨π^*𝒫_R − e𝒫′, 𝒫′⟩, a proper intersection on the special fibre of X_{U′,R}. If v is split in E, both sides are 0.

Direct prerequisites: [GZ.7/colmez-small-level-diagonal](#colmez-small-level-diagonal), [GZ.7/colmez-omega-self](#colmez-omega-self), `HilbertModularVarietiesAndShimuraCurves:R18.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Choose U′ away from v so the model is regular and E^× ∩ U′μ_U = μ_U. Since U′_v = U_v contains O_{E_v}^×, the class fields defining the CM lifts and their U-translates are unramified at w over the Hilbert class field H. Thus the lifts are H_w^ur-rational; properness extends them to sections over R. 2. The stabilizer condition gives ramification multiplicity e in π^*𝒫_R. Use small-level diagonal vanishing, Lemma 9.5 and the U/U′ projection sum, dividing by [μ_U:μ_{U′}], to obtain the proper intersection. The coarse projection need not be étale (E18).

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Lemma9.4 pp632–635, with E18 caveat.

<a id="colmez-adjunction-finite"></a>

### Finite adjunction lattice identity

**GZ.7/colmez-adjunction-finite** · theorem · `colmez_adjunction_finite`

For the residue image N at a finite place w, Nw contains OHw and length(Nw/OHw)=iw(P,P)/e.

Direct prerequisites: [GZ.7/colmez-modified-projection](#colmez-modified-projection), [GZ.2/colmez-residue-line](#colmez-residue-line), [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Pull to the small-level regular model; compare π*O(P/e)|P' with O(P')|P', take the ideal of π*P/e−P', and apply the proper intersection formula.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §9.2 pp633–634.

<a id="colmez-arithmetic-adjunction"></a>

### Arithmetic adjunction for the CM point

**GZ.7/colmez-arithmetic-adjunction** · theorem · `colmez_arithmetic_adjunction`

For compact §7.2 data, i0(P,P)/[OE*:OF*]=−h_LU(P).

Direct prerequisites: [GZ.7/colmez-adjunction-arch](#colmez-adjunction-arch), [GZ.7/colmez-adjunction-finite](#colmez-adjunction-finite), [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Sum finite residue-lattice lengths and archimedean norms; the arithmetic degree of the residue-normalized line gives the identity.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Theorem9.3 pp629–635.

<a id="colmez-s2-assumption"></a>

### Two auxiliary split places

**GZ.7/colmez-s2-assumption** · definition · `twoSplitDegeneracy`

A set S2 of two non-archimedean places of F, split in E and unramified over Q, such that for v ∈ S2 the group U_v is maximal and r(g)φ_v(0,u)=0 for all g ∈ GL2(F_v) and u ∈ F_v^×.

Direct prerequisites: `MetaplecticAutomorphicForms:MP.5`.

Construction/proof: 1. Define the two-place condition inside the imported Schwartz/Weil data. 2. Verify that the special Hecke-difference functions satisfy it; this is the source’s projection growth assumption.

Uses: Yuan–Zhang 2018 Assumption 7.1 p587 — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `twoSplitDegeneracy_constructor` | Two distinct finite E-split, ℚ-unramified maximal-level places with full Weil-orbit zero evaluation. |
| `twoSplitDegeneracy_place_projection` | Each auxiliary place is E-split and its F_v/ℚ_p extension is unramified. |
| `twoSplitDegeneracy_weil_zero` | r(g)φv(0,u)=0 for every g∈GL₂(F_v),u∈F_v×. |
| `twoSplitDegeneracy_linear` | The local vanishing subspace is closed under addition and scalar multiplication. |

| Test | Kind | Exact expectation |
|---|---|---|
| `twoSplitDegeneracy_zero_schwartz` | degenerate | The zero local function satisfies full Weil-orbit vanishing. |
| `twoSplitDegeneracy_single_place` | non-example | One split place does not satisfy the two-place assumption. |
| `twoSplitDegeneracy_zero_at_identity_only` | non-example | φv(0,u)=0 alone is insufficient: its Fourier/Weil transform can be nonzero at zero. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), Assumption 7.1 p587.

<a id="colmez-rev-archimedean-derivative-kernel"></a>

### Archimedean derivative kernel

**GZ.7/colmez-rev-archimedean-derivative-kernel** · definition · `archDerivativeKernel`

For a real place v, let B(v) be the nearby quaternion algebra (split at v), with y = y1 + y2 ∈ B(v)_v = E_v + E_v j and λ(y) = q(y2)/q(y) ∈ F_v (λ(y) < 0 on B(v)^×_+ − E^×). Put k_{v,s}(y) = Γ(s+1)/(2(4π)^s)·∫_1^∞ dt/(t(1−λ(y)t)^{s+1}) and K^{(v)}_φ(g,(t1,t2)) = w_U Σ_{a∈F^×} lim_{s→0} Σ_{y∈µ_U\(B(v)^×_+ − E^×)} r(g,(t1,t2))φ(y)_a k_{v,s}(y), where φ(y)_a is YZZ13's a-th Whittaker coefficient notation. Then I′(0,g,φ)(v) = 2⨍_{C_U}K^{(v)}_φ(g,(t,t))dt is the holomorphic projection of the v-part [YZZ13, Prop. 6.15].

Direct prerequisites: `AutomorphicSpectralTheory:AS.2`, [GZ.6/colmez-torus-average](#colmez-torus-average), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Use the archimedean Whittaker projection and the Γ-normalized integral for λ<0. 2. Sum with the stated positive-norm/off-E restriction, take the source finite part, and apply the normalized CM orbit average.

Uses: Yuan–Zhang 2018 §7.1, Theorem 7.2(1), p. 588 — Supply the specified analytic/arithmetic local term with the source’s normalization.; GZ.6–GZ.7 kernel comparison — Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections..

| Declaration | Required API |
|---|---|
| `archDerivativeKernel_constructor` | The Γ-normalized integral k_v,s for λ<0 and its nearby-quaternion sum. |
| `archDerivativeKernel_lambda_domain` | λ(y)<0 for the positive-norm off-E inputs. |
| `archDerivativeKernel_torus_average` | The projected v-derivative is twice the normalized C_U diagonal average. |
| `archDerivativeKernel_zero_parameter` | For λ<0, k_v,0=½log((1−λ)/(−λ)). |

| Test | Kind | Exact expectation |
|---|---|---|
| `archDerivativeKernel_lambda_minus_one` | computation | For λ=−1, k_v,0=½log2. |
| `archDerivativeKernel_diagonal_limit` | non-example | As λ→0⁻ the value diverges, so λ=0 is not an ordinary kernel input. |
| `archDerivativeKernel_normalization_half` | characterisation | Omitting the prefactor 1/2 doubles k_v,0. |

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §7.1, Theorem 7.2(1), p. 588.

<a id="colmez-rev-corrected-cm-multiplicity-at-split"></a>

### Corrected CM multiplicity at 𝔹-split, E-nonsplit places

**GZ.7/colmez-rev-corrected-cm-multiplicity-at-split** · theorem · `colmez_rev_corrected_cm_multiplicity_at_split`

Let v be a finite place of F nonsplit in E and split in 𝔹, and B = B(v), so B_v is the division algebra. Let U_v = GL2(O_{F_v}). For c ≥ 0 write E_v^×h_cGL2(O_{F_v}) for the elements β whose lattice has multiplier ring O_{F_v} + ϖ_v^cO_{E_v}. The multiplicity function m on B_v^× ×_{E_v^×} GL2(F_v)/GL2(O_{F_v}), defined away from the image of (1,1), satisfies m(b,β) ≠ 0 only if q(b)q(β) ∈ O_{F_v}^×. In that case, for β ∈ E_v^×h_cGL2(O_{F_v}) and λ(b) = q(b2)/q(b) (b = b1 + b2, b1 ∈ E_v, b2 ⊥ E_v): m(b,β) = ½(v(λ(b))+1) if c = 0 and E_v/F_v is unramified; m(b,β) = ½v(D_vλ(b)) if c = 0 and E_v/F_v is ramified (tame or wild); m(b,β) = N_v^{1−c}(N_v+1)^{-1} if c > 0 and E_v/F_v is unramified; m(b,β) = ½N_v^{−c} if c > 0 and E_v/F_v is ramified. Proof of the c = 0 ramified case: by Gross's theorem, End of the canonical lifting mod π_E^m is O_E + π_E^{m−1}O_{B_v}, so 2m(b,β) = 1 + max_{a∈O_E}v(N(b1−a) + q(b2)). The quotient −q(b2)/N(t) is a non-norm, and 1+p^{v(D_v)} ⊂ N(E_v^×) while 1+p^{v(D_v)−1} is not, so the maximum is v(λ(b)) + v(D_v) − 1.

Direct prerequisites: `ComplexMultiplicationAndExplicitReciprocity:CM.5`, [GZ.7/colmez-finite-multiplicity](#colmez-finite-multiplicity), [GZ.7/colmez-test-function](#colmez-test-function).

Construction/proof: 1. Import Gross’s lifting endomorphism filtration and the conductor-vs-norm coset classification. 2. At conductor zero maximize the lifting length; the ramified norm conductor gives v(λ)+v(D)−1, including wild ramification. 3. For positive conductor evaluate the local coset-volume factors; keep the unit-norm support and omitted diagonal.

Acceptance: Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid..

Sources: `yuan-zhang-2018`, published Annals 187 (2018), §8.3, proof of Lemma 8.7, p. 618 (correcting [YZZ13, Lemma 8.6] and [Zha01, Lemma 5.5.2]).

<a id="classical-height-green-characterization"></a>

### Marked Green height characterization

**GZ.7/classical-height-green-characterization** · theorem · `gz86_height_green_characterization`

Fix x₀ ≠ y₀ in S and put G(x, y) = ⟨(x) − (x₀), (y) − (y₀)⟩ (x ≠ y₀, y ≠ x₀, x ≠ y). Then ⟨a, b⟩ = Σ_{i,j} n_i m_j G(x_i, y_j) for a = Σ n_i(x_i), b = Σ m_j(y_j) (at least if y₀ ∉ |a|, x₀ ∉ |b|). Conversely any G such that for fixed x the function y ↦ G(x, y) is continuous and harmonic on S ∖ {x, x₀} with logarithmic singularities of residue +1 at y = x and −1 at y = x₀ (g − C log|ρ|² continuous near the point, ρ a local parameter), and symmetrically in x, defines by (2.2) a symbol satisfying (2.1); G is determined up to an additive constant, fixed e.g. by G(x₀, y) = 0 for one y. For S = X₀(N)(ℂ), N > 1, x₀ = ∞, y₀ = 0 this means a function G on 𝔥 × 𝔥 with (2.3a) G(γz, γ′z′) = G(z, z′) for γ, γ′ ∈ Γ₀(N); (b) G continuous and harmonic for z ∉ Γ₀(N)z′; (c) G = e_z log|z − z′|² + O(1) as z′ → z, e_z the order of the stabilizer of z in Γ₀(N); (d) G = 4πy′ + O(1) as z′ = x′ + iy′ → ∞ and O(1) as z′ → any other cusp; G = 4πy/(N|z|²) + O(1) as z → 0 and O(1) as z → any other cusp (local parameters (z′ − z)^{e_z}(1 + O(z′ − z)), e^{2πiz}, e^{−2πi/Nz}).

Hypotheses: N>1 where the marked cusps 0 and ∞ must be distinct..

Direct prerequisites: [GZ.2/classical-complex-height-symbol](#classical-complex-height-symbol), `ModularCurvesPartII:R14.2`.

Construction/proof: 1. Apply the principal-divisor law to c=(z)−∞ and d=(z′)−0. 2. The difference of two candidate kernels is a smooth harmonic function on the compact curve, hence constant; the marked cusp normalization fixes it.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, (2.2), (2.3), p. 237.

<a id="classical-resolvent-kernel"></a>

### Classical resolvent kernel

**GZ.7/classical-resolvent-kernel** · definition · `classicalResolvent`

For z, z′ ∈ 𝔥, z′ ∉ Γ₀(N)z: G_{N,s}(z, z′) = Σ_{γ ∈ Γ₀(N)} g_s(z, γz′) (2.10). It converges absolutely (locally uniformly for Re s > 1, holomorphic in s), Δ_z G_{N,s} = Δ_{z′} G_{N,s} = s(s−1) G_{N,s} (2.11), and G_{N,s}(γz, γ′z′) = G_{N,s}(z, z′) for γ, γ′ ∈ Γ₀(N) (2.12). It is the resolvent kernel of Γ₀(N) (Hejhal [20, Chaps. 6–7].

Direct prerequisites: `AutomorphicSpectralTheory:AS.2`, `AutomorphicSpectralTheory:AS.4`.

Construction/proof: 1. Import the Legendre kernel and its Laplacian identity from AS.2. 2. Sum over PSL₂ representatives; off the orbit diagonal, the Re(s)>1 estimates give locally uniform convergence and allow differentiating.

Uses: Gross–Zagier 1986 Chapter II, §2, (2.10)–(2.12), p. 239 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `classicalResolvent` | Σ_{γ∈Γ₀(N)⊂PSL₂(ℤ)} −2Q_{s−1}(1+\|z−γz′\|²/(2 Im z Im γz′)); z′ off the orbit of z, Re s>1. |
| `classicalResolvent_invariant` | Separately Γ₀(N)-invariant in z,z′. |
| `classicalResolvent_laplacian` | Δ_zG=Δ_z′G=s(s−1)G. |
| `classicalResolvent_converges` | The series converges locally uniformly off the orbit diagonal in Re s>1. |

| Test | Kind | Exact expectation |
|---|---|---|
| `classicalResolvent_orbit_diagonal` | non-example | z′=γz is outside the unregularized kernel domain. |
| `classicalResolvent_sl2_double_count` | non-example | Summing over SL₂ representatives without quotienting ±1 doubles G and its residue. |
| `classicalResolvent_residue_sign` | computation | For N=2, κ_N=−4, using [SL₂(ℤ):Γ₀(2)]=3. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, (2.10)–(2.12), p. 239.

<a id="classical-resolvent-residue"></a>

### Resolvent residue

**GZ.7/classical-resolvent-residue** · theorem · `gz86_resolvent_residue`

(Quoted from Hejhal [20].) G_{N,s}(z, z′) extends meromorphically in s to a neighbourhood of s = 1 with a simple pole at s = 1 of residue κ_N = −12/[SL₂(ℤ) : Γ₀(N)] = −12 N⁻¹ ∏_{p|N} (1 + 1/p)⁻¹, independent of z, z′. Consequently lim_{s→1}[G_{N,s} − κ_N/(s−1)] is not harmonic: its Laplacian is κ_N ≠ 0.

Direct prerequisites: [GZ.7/classical-resolvent-kernel](#classical-resolvent-kernel), `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Use the spectral constant-eigenfunction term of the resolvent continuation. 2. Its residue is κ_N=−12/[SL₂(ℤ):Γ₀(N)] and ΔG_N^0=κ_N.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, (2.13), p. 239.

<a id="classical-cusp-expansion"></a>

### Resolvent cusp expansion

**GZ.7/classical-cusp-expansion** · theorem · `gz86_cusp_expansion`

(Quoted from Hejhal [20], (6.5); Fourier development in z.) G_{N,s}(z, z′) = −(4π/(2s − 1)) E_N(z′, s) y^{1−s} + O(e^{−y}) as y = Im z → ∞; at any other cusp G_{N,s}(z, z′) = α(s) Y^{1−s} + O(e^{−Y}), Y = Im(γz) for γ ∈ SL₂(ℝ) carrying the cusp to ∞.

Direct prerequisites: [GZ.7/classical-resolvent-kernel](#classical-resolvent-kernel), [GZ.7/classical-resolvent-residue](#classical-resolvent-residue), `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Insert the Fourier expansion of the cusp Eisenstein series into the resolvent. 2. Separate the identity/stabilizer term; continue the remainder and its constant term to s=1.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, (2.19), p. 240.

<a id="classical-marked-green-kernel"></a>

### Marked modular Green kernel

**GZ.7/classical-marked-green-kernel** · construction · `markedModularGreen`

Let N > 1. G(z, z′) = lim_{s→1}[G_{N,s}(z, z′) + 4πE_N(w_N z, s) + 4πE_N(z′, s) + κ_N/(s − 1)] + C with C = 2κ_N − λ_N (λ_N as in The constant λ_N (2.21)). It satisfies (2.3a)–(2.3d) (Green's-function description of the height symbol (2.2), (2.3)), tends to 0 as z → ∞, and G(z, z′) = G(w_N z′, w_N z) (2.20); the pole cancels since the residues are κ_N − κ_N − κ_N + κ_N.

Hypotheses: N>1 where the marked cusps 0 and ∞ must be distinct..

Direct prerequisites: [GZ.7/classical-height-green-characterization](#classical-height-green-characterization), [GZ.7/classical-resolvent-kernel](#classical-resolvent-kernel), [GZ.7/classical-resolvent-residue](#classical-resolvent-residue), [GZ.7/classical-cusp-expansion](#classical-cusp-expansion).

Construction/proof: 1. Cancel the four residues κ−κ−κ+κ. 2. Check the marked squared-log singularities and harmonicity; choose C=2κ_N−λ_N to obtain the zero limit at ∞.

Uses: Gross–Zagier 1986 Chapter II, §2, (2.15), (2.20), pp. 239–241 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `markedModularGreen` | The constant Laurent coefficient of G_N,s+4πE_N(w_Nz,s)+4πE_N(z′,s)+κ_N/(s−1), plus 2κ_N−λ_N. |
| `markedModularGreen_cusp_zero` | The value tends to zero as z→∞ with z′ fixed. |
| `markedModularGreen_singularities` | Harmonic away from marked points and diagonal, with the stated squared-log singularities. |
| `markedModularGreen_fricke` | G(z,z′)=G(w_Nz′,w_Nz). |

| Test | Kind | Exact expectation |
|---|---|---|
| `markedModularGreen_four_residues` | computation | The four residues sum κ−κ−κ+κ=0. |
| `markedModularGreen_plain_finite_part` | non-example | Subtracting only κ/(s−1) leaves Laplacian κ rather than zero. |
| `markedModularGreen_level_one` | non-example | N=1 makes 0 and ∞ coincide and does not satisfy the two-marked-point construction. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, (2.15), (2.20), pp. 239–241.

<a id="classical-green-constant"></a>

### Modular Green constant

**GZ.7/classical-green-constant** · theorem · `gz86_green_constant`

For N > 1: lim_{s→1}[4πE_N(w_N z, s) + κ_N/(s−1)] = κ_N log y + λ_N + O(e^{−y}) (y = Im z → ∞), with λ_N = lim_{s→1}[4πN^{−s}φ(s) ∏_{p|N} (1 − p^{−2s+1})/(1 − p^{−2s}) + κ_N/(s−1)] = κ_N[log N + 2 log 2 − 2γ + 2(ζ′/ζ)(2) − 2Σ_{p|N} p log p/(p² − 1)], γ Euler's constant; also lim_{s→1}[4πE_N(z′, s)(1 − y^{1−s}/(2s−1))] = −κ_N(log y + 2).

Direct prerequisites: [GZ.7/classical-marked-green-kernel](#classical-marked-green-kernel), `AutomorphicSpectralTheory:AS.2`.

Construction/proof: 1. Extract the constant term of the cusp Eisenstein series. 2. Its Γ and quadratic Euler-factor logarithmic derivatives give the stated λ_N and fix the additive Green constant.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, (2.21), p. 241.

<a id="classical-archimedean-height"></a>

### Archimedean modular height formula

**GZ.7/classical-archimedean-height** · theorem · `gz86_archimedean_height`

Let N > 1 and x, x′ distinct non-cuspidal points of X₀(N)(ℂ), represented by z, z′ ∈ 𝔥. Then ⟨(x) − (∞), (x′) − (0)⟩_ℂ = lim_{s→1}[G_{N,s}(z, z′) + 4πE_N(w_N z, s) + 4πE_N(z′, s) + κ_N/(s − 1)] − λ_N + 2κ_N, with G_{N,s}, E_N, κ_N, λ_N as in (2.10), (2.14), (2.13), (2.21).

Hypotheses: N>1 where the marked cusps 0 and ∞ must be distinct..

Direct prerequisites: [GZ.2/classical-complex-height-symbol](#classical-complex-height-symbol), [GZ.7/classical-marked-green-kernel](#classical-marked-green-kernel), [GZ.7/classical-green-constant](#classical-green-constant).

Construction/proof: 1. Contract the marked Green kernel with the disjoint degree-zero divisors. 2. The Eisenstein and scalar terms disappear by degree zero; compare with the squared-norm local symbol.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, (2.22) Proposition, p. 241.

<a id="classical-hecke-kernel-action"></a>

### Hecke kernel action

**GZ.7/classical-hecke-kernel-action** · theorem · `gz86_hecke_kernel_action`

For m ≥ 1, (m, N) = 1: T_m acts on constants by σ₁(m) = #{γ ∈ Γ\R_N : det γ = m}, on E_N(z′, s) by m^s σ_{1−2s}(m) = m^s Σ_{d|m} d^{1−2s}, and G_{N,s}(z, z′)|_{z′} T_m = Σ_{γ ∈ R_N/{±1}, det γ = m} g_s(z, γz′). Since T_m((0)) = σ₁(m)(0), T_m((x′) − (0)) = Σ_{γ ∈ Γ\R_N, det γ = m} ((γx′) − (0)), hence ⟨(x) − (∞), T_m((x′) − (0))⟩_ℂ = Σ_{γ ∈ Γ\R_N, det γ = m} G(z, γz′). [Corrected: the paper justifies this by 'T_m maps each cusp to itself' (p. 241), which is false for general N; only T_m((0)) = σ₁(m)(0) and T_m((∞)) = σ₁(m)(∞) are needed and true.]

Direct prerequisites: [GZ.7/classical-resolvent-kernel](#classical-resolvent-kernel), `ModularCurvesPartII:R14.5`.

Construction/proof: 1. Reindex determinant-m matrices as the usual prime-to-N Hecke cosets. 2. Use invariance of the resolvent and the Eisenstein Hecke eigenvalue σ₁(m).

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, pp. 241–242.

<a id="classical-hecke-green-kernel"></a>

### Hecke Green kernel

**GZ.7/classical-hecke-green-kernel** · definition · `heckeGreen`

For m ≥ 1, (m, N) = 1: G^m_{N,s}(z, z′) = ½ Σ_{a,b,c,d ∈ ℤ, N | c, ad − bc = m} g_s(z, (az′ + b)/(cz′ + d)) (= G_{N,s}(z, z′)|_{z′}T_m); G¹_{N,s} = G_{N,s}.

Direct prerequisites: [GZ.7/classical-resolvent-kernel](#classical-resolvent-kernel), [GZ.7/classical-hecke-kernel-action](#classical-hecke-kernel-action).

Construction/proof: 1. Apply the prime-to-N correspondence to the second argument of the resolvent. 2. Pass from SL₂ matrices to their ±1 quotient, retaining the 1/2 convention.

Uses: Gross–Zagier 1986 Chapter II, §2, (2.24), p. 242 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `heckeGreen` | The determinant-m resolvent sum modulo ±1 for (m,N)=1. |
| `heckeGreen_one` | G¹_N,s=G_N,s. |
| `heckeGreen_hecke` | G^m_N,s=G_N,s\|_{z′}T_m. |
| `heckeGreen_fricke` | Simultaneous Atkin–Lehner invariance. |

| Test | Kind | Exact expectation |
|---|---|---|
| `heckeGreen_m_one` | compatibility | The identity correspondence returns the original kernel. |
| `heckeGreen_sign_quotient` | non-example | The factor 1/2 in the matrix sum is indispensable. |
| `heckeGreen_cusp_degree` | computation | For prime ℓ∤N the constant Hecke eigenvalue is ℓ+1, rather than 1. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, (2.24), p. 242.

<a id="classical-hecke-archimedean-height"></a>

### Hecke archimedean height formula

**GZ.7/classical-hecke-archimedean-height** · theorem · `gz86_hecke_archimedean_height`

Let N > 1, m ≥ 1, (m, N) = 1, x, x′ ∈ X₀(N)(ℂ) non-cuspidal with x ∉ T_m x′, represented by z, z′. Then ⟨(x) − (∞), T_m((x′) − (0))⟩_ℂ = lim_{s→1}[G^m_{N,s}(z, z′) + 4πσ₁(m)E_N(w_N z, s) + 4πm^s σ_{1−2s}(m)E_N(z′, s) + σ₁(m)κ_N/(s − 1)] − σ₁(m)λ_N + 2σ₁(m)κ_N, σ_ν(m) = Σ_{d|m} d^ν.

Hypotheses: N>1 where the marked cusps 0 and ∞ must be distinct..

Direct prerequisites: [GZ.7/classical-archimedean-height](#classical-archimedean-height), [GZ.7/classical-hecke-green-kernel](#classical-hecke-green-kernel), [GZ.6/classical-disjointness](#classical-disjointness).

Construction/proof: 1. Use the disjointness criterion and the Hecke kernel action. 2. Contract with c and T_m d^σ, retaining the σ₁(m) cusp terms.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, (2.23) Proposition, p. 242.

<a id="classical-atkin-lehner-invariance"></a>

### Atkin–Lehner kernel invariance

**GZ.7/classical-atkin-lehner-invariance** · theorem · `gz86_atkin_lehner_invariance`

For every d ‖ N: G^m_{N,s}(w_d z, w_d z′) = G^m_{N,s}(z, z′) (in particular for m = 1), because g_s(γz, γz′) = g_s(z, z′) for γ ∈ SL₂(ℝ) and w_d normalises {γ ∈ R_N : det γ = m}; compatible with the invariance of the height pairing under automorphisms.

Direct prerequisites: [GZ.7/classical-hecke-green-kernel](#classical-hecke-green-kernel), `ModularCurvesPartII:R14.2`.

Construction/proof: 1. Conjugate the determinant-m matrix set by the chosen Atkin–Lehner involution. 2. The reindexing preserves the kernel and both CM inputs.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §2, (2.25), p. 242.

<a id="classical-cm-kernel-invariants"></a>

### CM kernel invariants

**GZ.7/classical-cm-kernel-invariants** · definition · `cmKernelInvariant`

Under classical notation C2: For m ≥ 1, (m, N) = 1, 𝒜 ∈ Cl_K with r_𝒜(m) = 0 (r_𝒜(k) = number of integral ideals of norm k in 𝒜), and τ_{𝒜ᵢ,𝔫} as in the referenced classical source result 61: the values G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) with 𝒜₁𝒜₂⁻¹ = 𝒜 (3.1); γ^m_{N,s}(𝒜; 𝔅) = Σ_{𝒜₁,𝒜₂ ∈ Cl_K, 𝒜₁𝒜₂⁻¹ = 𝒜, 𝒜₁𝒜₂[𝔫]⁻¹ = 𝔅} G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) (3.2); γ^m_{N,s}(𝒜) = Σ_{𝒜₁𝒜₂⁻¹ = 𝒜} G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) = Σ_{𝔅 ∈ Cl_K} γ^m_{N,s}(𝒜; 𝔅) (3.3). Because σ_𝒜 maps τ_{𝒜₁,𝔫} to τ_{𝒜₁𝒜⁻¹,𝔫} and Gal(H/K) permutes the archimedean places of H simply transitively, (3.3) with Proposition (2.23) computes Σ_{v|∞} ⟨c, T_m d^σ⟩_v (c = (x) − (∞), d = (x) − (0)); r_𝒜(m) = 0 is needed for (3.1) to be defined (x ∉ T_m x^σ).

Direct prerequisites: [GZ.7/classical-hecke-green-kernel](#classical-hecke-green-kernel), [GZ.6/classical-disjointness](#classical-disjointness), `HeegnerPointEulerSystems:HE.0`.

Construction/proof: 1. Form the finite class-pair sums of the off-diagonal Hecke kernel. 2. Apply ideal change and Atkin–Lehner reindexing to prove that the choice of norm-N ideal does not affect them.

Uses: Gross–Zagier 1986 Chapter II, §3, (3.1)–(3.3), pp. 242–243 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `cmKernelInvariant` | The class-pair sums γ^m_N,s(A;B) and their B-sum γ^m_N,s(A), with r_A(m)=0. |
| `cmKernelInvariant_sum_genus` | Σ_B γ(A;B)=γ(A). |
| `cmKernelInvariant_ideal_independent` | Changing the primitive norm-N ideal leaves γ(A;B) unchanged. |
| `cmKernelInvariant_empty` | γ(A;B)=0 unless {A}={B𝔫}. |

| Test | Kind | Exact expectation |
|---|---|---|
| `cmKernelInvariant_prime_D` | computation | For prime \|D\| each nonempty refined sum has one class pair. |
| `cmKernelInvariant_wrong_genus` | degenerate | A wrong genus has an empty sum. |
| `cmKernelInvariant_diagonal` | non-example | If r_A(m)>0, use the diagonal finite-part kernel instead of this off-diagonal definition. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §3, (3.1)–(3.3), pp. 242–243.

<a id="classical-cm-genus-orbits"></a>

### CM genus-orbit count

**GZ.7/classical-cm-genus-orbits** · theorem · `gz86_cm_genus_orbits`

(3.1) depends on 𝔫, but γ^m_{N,s}(𝒜; 𝔅) does not: w_d (d ‖ N) replaces (𝒜₁, 𝒜₂, 𝔫) by (𝒜₁[𝔡]⁻¹, 𝒜₂[𝔡]⁻¹, 𝔫𝔡⁻¹𝔡̄) (Actions of c, Gal(H/K) and W on Heegner points), leaving 𝒜₁𝒜₂⁻¹ and 𝒜₁𝒜₂[𝔫]⁻¹ unchanged, and G^m_{N,s} is w_d-invariant (2.25). The sum (3.2) has 2^{t−1} terms if {𝒜} = {𝔅𝔫} and is empty otherwise ({𝒜} = genus = class of 𝒜 in Cl_K/Cl_K² ≅ (ℤ/2ℤ)^{t−1}); all 𝔫 of norm N lie in one genus; if D is prime (|Cl_K| odd) the sum has one term.

Direct prerequisites: [GZ.7/classical-cm-kernel-invariants](#classical-cm-kernel-invariants), `AnalyticNumberTheory:AN.4`, `HeegnerPointEulerSystems:HE.0`.

Construction/proof: 1. Use the genus quotient of the ideal-class group to classify admissible pairs. 2. Count a nonempty genus fibre as h/2^(t−1); the explicit prime-discriminant case fixes this power of two.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §3, p. 243.

<a id="classical-hyperbolic-norm-parameter"></a>

### Hyperbolic norm parameter

**GZ.7/classical-hyperbolic-norm-parameter** · theorem · `gz86_hyperbolic_norm_parameter`

Let τ₁, τ₂ be Heegner points with the same 𝔫, roots of A_iτ_i² + B_iτ_i + C_i = 0 as in (1.4) with the same β. For γ = (a b; c d) ∈ R_N with det γ = m > 0: g_s(γτ₁, τ₂) = −2Q_{s−1}(1 + |γτ₁ − τ₂|²/(2 Im(γτ₁) Im τ₂)) = −2Q_{s−1}(1 + 2nN/(|D| det γ)) with n = (A₁A₂/N)|cτ₁τ₂ + dτ₂ − aτ₁ − b|² (3.4), and n = (1/N)[c²C₁C₂ + ad(D − B₁B₂)/2 − bc(D + B₁B₂)/2 + a²C₁A₂ + d²A₁C₂ − cdB₁C₂ + acC₁B₂ + b²A₁A₂ + bdA₁B₂ − abB₁A₂] ∈ ℤ (3.5, corrected; see PAPER-GROSS-ZAGIER-86/E4). Hence G^m_{N,s}(τ₁, τ₂) = −2 Σ_{n≥1} ρ^m(n) Q_{s−1}(1 + 2nN/(m|D|)), ρ^m(n) = #{γ ∈ R_N/{±1} : det γ = m, n(γ) = n} (n ≥ 1 when r_{𝒜₁𝒜₂⁻¹}(m) = 0). Example N = 1, D = −4, τ₁ = τ₂ = i: n = a² + b² + c² + d² − 2(ad − bc), (a − d)² + (b + c)² = n, (a + d)² + (b − c)² = n + 4m.

Direct prerequisites: [GZ.7/classical-cm-kernel-invariants](#classical-cm-kernel-invariants), `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`.

Construction/proof: 1. Express the hyperbolic distance invariant by the norm of the corresponding quadratic pair. 2. Check both positive norm contributions and the determinant relation before substituting in Q_(s−1).

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §3, (3.4), (3.5), p. 244.

<a id="classical-pair-count"></a>

### Quadratic-pair representation count

**GZ.7/classical-pair-count** · theorem · `gz86_pair_count`

Let 𝒜₁, 𝒜₂ ∈ Cl_K, 𝔫 primitive of norm N, 𝔞ᵢ ∈ 𝒜ᵢ integral with 𝔫 | 𝔞ᵢ, N(𝔞ᵢ) = Aᵢ, and — corrected hypothesis, see PAPER-GROSS-ZAGIER-86/E5 — 𝔞₁, 𝔞₂ prime to D; τ_{𝒜ᵢ,𝔫} the roots attached to 𝔞ᵢ by (1.4)–(1.5). Then for m ∈ ℕ (with (m, N) = 1) and r_{𝒜₁𝒜₂⁻¹}(m) = 0: G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) = −2 Σ_{n≥1} ρ^m(n) Q_{s−1}(1 + 2nN/(m|D|)), ρ^m(n) = ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = #{(α, β) ∈ (𝔞₁⁻¹𝔞̄₂⁻¹ × 𝔞₁⁻¹𝔞₂⁻¹𝔫)/{±1} : N(α) = (Nn + m|D|)/(A₁A₂), N(β) = Nn/(A₁A₂), A₁A₂α ≡ A₁A₂β (mod 𝔡)}, 𝔡 = (√D) the different. The bijection is γ ↦ (α, β), α = cτ₁τ̄₂ + dτ̄₂ − aτ₁ − b, β = cτ₁τ₂ + dτ₂ − aτ₁ − b (3.6), with α ∈ 𝔞₁⁻¹𝔞̄₂⁻¹, β ∈ 𝔞₁⁻¹𝔞₂⁻¹𝔫 (3.7), l = A₁A₂N(α), n = N⁻¹A₁A₂N(β) ∈ ℤ (3.8), l − Nn = |D| det γ (3.9), A₁A₂α ≡ A₁A₂β (mod 𝔡) (3.10); the inverse is cτ₁ + d = (A₂/√D)(β − α), aτ₁ + b = (A₂/√D)(τ̄₂β − τ₂α). (r_{𝒜₁𝒜₂⁻¹}(m) = 0 ensures n > 0.)

Direct prerequisites: [GZ.7/classical-hyperbolic-norm-parameter](#classical-hyperbolic-norm-parameter), `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. Pass from lattice pairs to integral ideal pairs and their generators. 2. Separate the unit orbits from the ramified congruence choices.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §3, (3.6)–(3.11) Proposition, pp. 244–245.

<a id="classical-ramified-congruence-count"></a>

### Ramified-congruence pair count

**GZ.7/classical-ramified-congruence-count** · theorem · `gz86_ramified_congruence_count`

If n ≡ 0 (mod D) (hypotheses of Proposition (3.11): ρ^m as a count of pairs (α, β)): ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = ½ #{α ∈ 𝔞₁⁻¹𝔞̄₂⁻¹ : N(α) = l/(A₁A₂)} · #{β ∈ 𝔞₁⁻¹𝔞₂⁻¹𝔫 : N(β) = Nn/(A₁A₂)} = 2u² r_{𝒜₁𝒜₂⁻¹}(l) r_{𝒜₁𝒜₂[𝔫]⁻¹}(n), l = Nn + m|D|, u = ½#𝒪^×.

Direct prerequisites: [GZ.7/classical-pair-count](#classical-pair-count), `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. At each l|D compare the two congruence classes of generators. 2. A factor 2 occurs exactly when l divides the relevant norm index; multiply the independent local counts.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §3, (3.12), p. 246.

<a id="classical-prime-discriminant-count"></a>

### Prime-discriminant pair count

**GZ.7/classical-prime-discriminant-count** · theorem · `gz86_prime_discriminant_count`

If |D| is prime (hypotheses of Proposition (3.11): ρ^m as a count of pairs (α, β)): ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = u² r_{𝒜₁𝒜₂⁻¹}(nN + m|D|) r_{𝒜₁𝒜₂[𝔫]⁻¹}(n) × (1 if D ∤ n, 2 if D | n); for D ∤ n exactly one of (α, β), (α, −β) satisfies the congruence (a quadratic residue mod D has exactly two square roots).

Direct prerequisites: [GZ.7/classical-ramified-congruence-count](#classical-ramified-congruence-count).

Construction/proof: 1. Specialize the ramified-congruence count to a prime discriminant. 2. Use the single genus and retain the exceptional u=3 unit factor.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §3, (3.13), p. 246.

<a id="classical-genus-pair-count"></a>

### Genus pair count

**GZ.7/classical-genus-pair-count** · theorem · `gz86_genus_pair_count`

D arbitrary (standing hypotheses), 𝒜, 𝔅 ∈ Cl_K, r_𝒜(m) = 0: Σ_{𝒜₁,𝒜₂ ∈ Cl_K, 𝒜₁𝒜₂⁻¹ = 𝒜, 𝒜₁𝒜₂[𝔫]⁻¹ = 𝔅} ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = u² δ(n) r_𝒜(nN + m|D|) r_𝔅(n) if {𝒜} = {𝔅𝔫}, and 0 otherwise, where δ(n) = ∏_{p|(n,D)} 2 (3.15) and {𝒜}, {𝔅𝔫} are the genera of 𝒜 and 𝔅[𝔫]. Proof: the other terms come from 𝔞ᵢ ↦ 𝔞ᵢ𝔠 with 𝔠² = (γ₀), (α, β) ↦ (α/N(𝔠), β/γ₀); the 2^{t−1} classes [𝔠] ∈ Cl_K[2] correspond to ±r (mod D) with r² ≡ 1 (mod D).

Direct prerequisites: [GZ.7/classical-ramified-congruence-count](#classical-ramified-congruence-count), `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. Apply the genus norm criterion to the ideal pair. 2. Combine the local congruence factors with the unit count; wrong-genus pairs contribute zero.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §3, (3.14), (3.15), pp. 246–247.

<a id="classical-genus-kernel-evaluation"></a>

### Genus kernel evaluation

**GZ.7/classical-genus-kernel-evaluation** · theorem · `gz86_genus_kernel_evaluation`

Under classical notation C2: For m ≥ 1, (m, N) = 1, r_𝒜(m) = 0, s > 1: γ^m_{N,s}(𝒜; 𝔅) = −2u² Σ_{n≥1} δ(n) r_𝒜(nN + m|D|) r_𝔅(n) Q_{s−1}(1 + 2nN/(m|D|)) if {𝒜} = {𝔅𝔫}, and γ^m_{N,s}(𝒜; 𝔅) = 0 otherwise (δ(n) as in (3.15)).

Direct prerequisites: [GZ.7/classical-cm-kernel-invariants](#classical-cm-kernel-invariants), [GZ.7/classical-genus-pair-count](#classical-genus-pair-count).

Construction/proof: 1. Insert the quadratic-pair count in the locally uniformly convergent resolvent sum. 2. Regroup by the positive norm index and apply the source Legendre kernel argument.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §3, (3.16) Proposition, p. 247.

<a id="classical-orbit-kernel-evaluation"></a>

### CM orbit kernel evaluation

**GZ.7/classical-orbit-kernel-evaluation** · theorem · `gz86_orbit_kernel_evaluation`

Under classical notation C2: For m ≥ 1, (m, N) = 1, r_𝒜(m) = 0, s > 1: γ^m_{N,s}(𝒜) = −2u² Σ_{n≥1} δ(n) R_{{𝒜𝔫}}(n) r_𝒜(nN + m|D|) Q_{s−1}(1 + 2nN/(m|D|)), where R_{{𝒜𝔫}}(n) is the number of integral ideals of norm n in the genus {𝒜𝔫}.

Direct prerequisites: [GZ.7/classical-cm-genus-orbits](#classical-cm-genus-orbits), [GZ.7/classical-genus-kernel-evaluation](#classical-genus-kernel-evaluation).

Construction/proof: 1. Sum the refined genus formula over B. 2. Use the genus fibre count and finite class-group orthogonality.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §3, (3.17) Corollary, p. 247.

<a id="classical-genus-character-filter"></a>

### Genus-character filter

**GZ.7/classical-genus-character-filter** · theorem · `gz86_genus_character_filter`

R_{{𝒜𝔫}}(n) is either R(n) or 0, where R(n) = Σ_{𝒜 ∈ Cl_K} r_𝒜(n) = Σ_{d|n} (D/d) is the number of integral ideals of norm n. If (n, D) = 1 then R_{{𝒜𝔫}}(n) may be replaced by R(n) in (3.17) (r_𝒜(nN + m|D|) ≠ 0 ⇒ (A(nN + m|D|)/p) = 1 ∀p | D ⇒ (AN·n/p) = 1 ∀p | D ⇒ R_{{𝒜𝔫}}(n) = R(n), A any integer prime to D that is a norm from the genus {𝒜}); in general δ(n)R_{{𝒜𝔫}}(n)r_𝒜(nN + m|D|) may be replaced by ∏_{p|(n,D)} (1 + ε̂_p((nN + m|D|)/(nN))) · R(n) r_𝒜(nN + m|D|), where ε̂_p is the character of the group of norms of fractional ideals with ε̂_p(N𝔞) = 1 for 𝔞 principal and ε̂_p(n) = (n/p) for n ∈ ℤ, p ∤ n.

Direct prerequisites: [GZ.7/classical-genus-kernel-evaluation](#classical-genus-kernel-evaluation), `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. Multiply by the genus character and sum over A. 2. Use quadratic character orthogonality and the class-independent term to obtain the displayed filter.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §3, p. 247.

<a id="classical-cm-eisenstein-sum"></a>

### CM Eisenstein sum

**GZ.7/classical-cm-eisenstein-sum** · theorem · `gz86_cm_eisenstein_sum`

Under classical notation C3: Let E(z, s) = Σ_{γ ∈ Γ_∞\SL₂(ℤ)} Im(γz)^s be the weight-0 Eisenstein series of SL₂(ℤ) (Γ_∞ = ±(1 *; 0 1); this normalization is the one forced by κ_N in (2.13) and by the identity 2^s ζ(2s) E(τ_A, s) = u|D|^{s/2} ζ_K(A, s) used on pp. 248, 252), E_N(z, s) the Eisenstein series (2.14) of Γ₀(N) at ∞, w_N z = −1/(Nz), Re s > 1. Then Σ_{A∈Cl_K} E_N(w_N τ_{A,𝔫}, s) = Σ_{A∈Cl_K} E_N(τ_{A,𝔫}, s) = N^{−s} Π_{p|N}(1 − p^{−2s})^{−1} Σ_{d|N} (μ(d)/d^s) Σ_{A∈Cl_K} E((N/d) τ_{A,𝔫}, s). For each d | N the points (N/d)τ_{A,𝔫} again satisfy quadratic equations over ℤ of discriminant D, and the inner sum is independent of d and equals Σ_{A} E(τ_A, s), where τ_A ∈ 𝔥 is any root of a primitive form of discriminant D in the class A. Hence Σ_A E_N(τ_{A,𝔫}, s) = N^{−s} Π_{p|N}(1 + p^{−s})^{−1} Σ_A E(τ_A, s) (the combination used in the display at the top of p. 249).

Direct prerequisites: `AutomorphicSpectralTheory:AS.2`, `HeegnerPointEulerSystems:HE.0`.

Construction/proof: 1. Unfold the CM point evaluation of the Eisenstein series. 2. Regroup primitive lattice vectors by integral ideals and extract the quadratic zeta and gamma factors.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §4, (4.1) and the paragraph after it, p. 248.

<a id="classical-disjoint-archimedean-sum"></a>

### Disjoint archimedean CM formula

**GZ.7/classical-disjoint-archimedean-sum** · theorem · `gz86_disjoint_archimedean_sum`

Under classical notation C3: Let x ∈ X₀(N) be a Heegner point for the full ring of integers of K, c = (x) − (∞), d = (x) − (0), σ ∈ Gal(H/K), m ∈ ℕ prime to N, and A ∈ Cl_K the ideal class corresponding to σ under the Artin isomorphism. Suppose m is not the norm of an integral ideal in A. Then ⟨c, T_m d^σ⟩_∞ = lim_{s→1} [γ^m_{N,s}(A) − h σ₁(m) κ_N/(s − 1)] + h κ_N [σ₁(m)(log(N/|D|) + 2 Σ_{p|N} log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_{d|m} d log(m/d²)], where γ^m_{N,s}(A) is the invariant (3.3) (evaluated in Corollary (3.17)), κ_N = −12/[SL₂(ℤ) : Γ₀(N)] = −12 N^{−1} Π_{p|N}(1 + 1/p)^{−1} (2.13), and L(s, ε) is the L-function of K.

Hypotheses: N>1 where the marked cusps 0 and ∞ must be distinct..

Direct prerequisites: [GZ.7/classical-hecke-archimedean-height](#classical-hecke-archimedean-height), [GZ.7/classical-orbit-kernel-evaluation](#classical-orbit-kernel-evaluation), [GZ.2/classical-archimedean-height-sum](#classical-archimedean-height-sum), [GZ.7/classical-cm-eisenstein-sum](#classical-cm-eisenstein-sum).

Construction/proof: 1. Insert the genus/orbit kernel formula and CM Eisenstein evaluation into the disjoint height formula. 2. Take the Laurent constant at s=1, retaining the cancelled pole and logarithmic derivative.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, (4.2) Proposition, p. 249 (derivation pp. 248–249).

<a id="classical-tangent-symbol"></a>

### Tangent-normalized CM height symbol

**GZ.7/classical-tangent-symbol** · construction · `cmTangentHeight`

Let X be a curve over the number field H, v a place of H, and a, b divisors of degree 0 on X whose supports meet exactly in the point x. Let g be a uniformizing parameter at x (a function on X with ord_x(g) = 1). Define ⟨a, b⟩_v := lim_{y→x} {⟨a_y, b⟩_v − ord_x(a) ord_x(b) log|g(y)|_v}, where a_y is the divisor obtained from a by replacing every occurrence of x by a nearby point y not in the support of b, and ⟨·,·⟩_v on the right is Néron's local symbol of relatively prime divisors. The limit exists by the standard properties of local heights ([14] = Gross, 'Local heights on curves'). This node is the CM specialization of RP.0’s reusable tangent-symbol construction; it introduces no second general local-height machine.

Direct prerequisites: `HeightsRationalPointsAndObstructions:RP.0`, [GZ.6/classical-disjointness](#classical-disjointness).

Construction/proof: 1. Specialize the reusable tangent-local-symbol construction to the common CM point and its multiplicity r_A(m). 2. Subtract that multiplicity times log|g|_v; changing g modifies only the displayed scalar term.

Uses: Gross–Zagier 1986 Chapter II, §5, (5.1), pp. 249–250 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `cmTangentHeight` | Specialize the imported tangent local symbol to c=(x)−∞ and T_m d^σ using the eta-normalized tangent; subtraction coefficient r_A(m). |
| `cmTangentHeight_disjoint` | For r_A(m)=0 it is the ordinary Néron symbol. |
| `cmTangentHeight_change` | Replacing g by g′ adds r_A(m)log\|(g/g′)(x)\|_v. |
| `cmTangentHeight_global` | Its sum over v equals the global class pairing for one global tangent choice. |

| Test | Kind | Exact expectation |
|---|---|---|
| `cmTangentHeight_multiplicity` | characterisation | If x occurs twice in T_mx^σ subtract 2log\|g\|, not log\|g\|. |
| `cmTangentHeight_root_unity` | compatibility | Multiplication of the tangent by μ₆ changes no local value. |
| `cmTangentHeight_scaling_product` | non-example | A scalar α with \|α\|_v≠1 changes the individual place, although the global sum is unchanged. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §5, (5.1), pp. 249–250; `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter I, §9, p. 232; constructed in Chapter II, §5, pp. 249–252 and Chapter III, §8, pp. 262–264; `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §5, (5.3), p. 250.

<a id="classical-tangent-product-formula"></a>

### Tangent product formula

**GZ.7/classical-tangent-product-formula** · theorem · `gz86_tangent_product_formula`

In the setting of (5.1) Local symbol for divisors with a common point (tangent-vector symbol): if g′ is another uniformizing parameter at x and g/g′ has the value α at x, then ⟨a, b⟩′_v = ⟨a, b⟩_v + ord_x(a) ord_x(b) log|α|_v. Consequently ⟨a, b⟩_v depends only on the non-zero tangent vector ∂/∂t at x determined by ∂g/∂t = 1, is unchanged if ∂/∂t is multiplied by a root of unity (|α|_v = 1 for all v), and — g being a single global function — Σ_v ⟨a, b⟩_v is independent of g and (product formula) equals the global height pairing of the classes of a and b [14].

Direct prerequisites: [GZ.7/classical-tangent-symbol](#classical-tangent-symbol), `HeightsRationalPointsAndObstructions:RP.0`.

Construction/proof: 1. Sum the tangent change at all places of H. 2. Apply the product formula to the single global scalar; do not assert that its individual local logs vanish.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §5, (5.2) and the following paragraph, p. 250.

<a id="classical-eta-tangent"></a>

### Eta-normalized CM tangent

**GZ.7/classical-eta-tangent** · construction · `etaCMTangent`

ω := η⁴(z) dq/q = 2πi η⁴(z) dz (5.4). It is well defined on X₀(N) only up to a 6th root of unity (η⁴ has a multiplier of order 6), which by (5.2) Change of uniformizer; the sum of local symbols is the global pairing does not affect the local symbols. If x is not an elliptic point of X₀(N) (u = 1), ω is non-zero at x, the tangent vector ∂/∂t is taken dual to ω, and the uniformizing parameter g satisfies ω = (g + a₂g² + a₃g³ + …) dg/g near x. In general ω has order 1/u − 1 at x and g is normalized so that ω = (1/u)(g^{1/u} + higher degree terms) dg/g near x, i.e. ω = d(g^{1/u})·(1 + …) [corrected; the printed display omits the factor 1/u — see issue PAPER-GROSS-ZAGIER-86/E12].

Direct prerequisites: `ModularCurvesPartII:R14.2`, [GZ.2/classical-complex-height-symbol](#classical-complex-height-symbol).

Construction/proof: 1. Use Δ(dq/q)^⊗6, rather than assert that η⁴dq/q descends as a differential on the coarse curve. 2. In the orbifold parameter g=c^u(w−z)^u(1+o(1)), differentiate to obtain the necessary factor 1/u; sixth powers remove the branch ambiguity.

Uses: Gross–Zagier 1986 Chapter II, §5, (5.4) and the two paragraphs after it, p. 250 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `etaCMTangent` | The CM tangent class obtained from Δ(q)(dq/q)^⊗6, with g=(2πiη⁴(z)(w−z))^u(1+o(1)). |
| `etaCMTangent_orbifold` | ω=(1/u)(g^(1/u)+higher terms)dg/g. |
| `etaCMTangent_unit_index_one` | For u=1 the tangent is dual to ω. |
| `etaCMTangent_ambiguity` | The only branch ambiguity is multiplication by μ₆, invisible to local heights. |

| Test | Kind | Exact expectation |
|---|---|---|
| `etaCMTangent_ordinary` | computation | For u=1, dg at x equals ω. |
| `etaCMTangent_cubic_stabilizer` | non-example | For D=−3, u=3, omission of 1/3 in the orbifold formula introduces a spurious 3log\|3\|_v. |
| `etaCMTangent_global_tensor` | characterisation | The sixth tensor power is defined over the ground field even when a branch of η⁴ is not. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §5, (5.4) and the two paragraphs after it, p. 250.

<a id="classical-complex-tangent-asymptotic"></a>

### Complex tangent asymptotic

**GZ.7/classical-complex-tangent-asymptotic** · theorem · `gz86_complex_tangent_asymptotic`

Let v be a complex place of H (|·|_v = |·|² on ℂ), g as in (5.4) The differential ω = η⁴ dq/q and the normalized tangent vector at x (corrected normalization). Then log|g(y)|_v − u log|2πi η⁴(z)(w − z)|_v → 0 as y → x, where z, w ∈ 𝔥 map to x, y on X₀(N)(ℂ).

Direct prerequisites: [GZ.7/classical-tangent-symbol](#classical-tangent-symbol), [GZ.7/classical-eta-tangent](#classical-eta-tangent), [GZ.2/classical-complex-height-symbol](#classical-complex-height-symbol).

Construction/proof: 1. Expand the source local symbol in the uniformizer at the common CM point. 2. Compare its leading term with g=(2πiη⁴(z)(w−z))^u; retain the stabilizer multiplicity u.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §5, (5.5), p. 251.

<a id="classical-diagonal-archimedean-height"></a>

### Diagonal archimedean CM formula

**GZ.7/classical-diagonal-archimedean-height** · theorem · `gz86_diagonal_archimedean_height`

Under classical notation C3: Let v be a complex place of H and z, z′ ∈ 𝔥 points mapping to x, x^σ. With R_N = {(a b; c d) ∈ M₂(ℤ) : N | c}, g_s(z, z′) = −2Q_{s−1}(1 + |z − z′|²/(2 Im z Im z′)) (2.9), κ_N, λ_N as in (2.13), (2.21): ⟨c, T_m d^σ⟩_v = lim_{s→1} [Σ_{γ ∈ R_N/±1, det γ = m, γz′ ≠ z} g_s(z, γz′) + 4πσ₁(m) E_N(w_N z, s) + u r_A(m) lim_{w→z} {g_s(z, w) − log|2πi η⁴(z)(w − z)|_v} + 4π m^s σ_{1−2s}(m) E_N(z′, s) + σ₁(m)κ_N/(s − 1)] − σ₁(m)(λ_N − 2κ_N) [printed '−σ₁(m)(λ_N + 2κ_N)'; see PAPER-GROSS-ZAGIER-86/E10]. The number of γ ∈ R_N/±1 of determinant m with γz′ = z is u r_A(m).

Hypotheses: N>1 where the marked cusps 0 and ∞ must be distinct..

Direct prerequisites: [GZ.7/classical-complex-tangent-asymptotic](#classical-complex-tangent-asymptotic), [GZ.7/classical-archimedean-height](#classical-archimedean-height), [GZ.7/classical-hecke-green-kernel](#classical-hecke-green-kernel).

Construction/proof: 1. Apply the preceding local asymptotic to each occurrence of x in T_mx^σ. 2. Combine the disjoint terms with r_A(m) copies of the tangent finite part.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §5, (5.6), p. 251.

<a id="classical-diagonal-green-kernel"></a>

### Diagonal Green finite part

**GZ.7/classical-diagonal-green-kernel** · definition · `diagonalHeckeGreen`

For all z, z′ ∈ 𝔥 (previously defined only for z ∉ T_m z′): G^m_{N,s}(z, z′) := Σ_{γ ∈ R_N/±1, det γ = m, γz′ ≠ z} g_s(z, γz′) + Σ_{γ ∈ R_N/±1, det γ = m, γz′ = z} lim_{w→z} (g_s(z, w) − log|2πi η(z)⁴ (z − w)|²). With this definition (5.6) is literally the formula of Proposition (2.23); the second sum equals a·g_s(z), a = #{γ ∈ R_N/±1 : det γ = m, γz′ = z} (= u r_A(m) for z, z′ over x, x^σ), g_s(z) the renormalized value Renormalized self-value g_s(z).

Direct prerequisites: [GZ.7/classical-hecke-green-kernel](#classical-hecke-green-kernel), [GZ.7/classical-eta-tangent](#classical-eta-tangent).

Construction/proof: 1. Use the ordinary resolvent off T_m and define the diagonal term by its eta-normalized local finite part. 2. Count the determinant-m diagonal matrices modulo ±1 as u r_A(m).

Uses: Gross–Zagier 1986 Chapter II, §5, (5.7) and the paragraph after it, p. 251 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `diagonalHeckeGreen` | Use g_s off the determinant-m diagonal and its eta-normalized finite part on that diagonal. |
| `diagonalHeckeGreen_off_diagonal` | Agrees with G^m_N,s off T_m. |
| `diagonalHeckeGreen_diagonal_count` | For CM inputs the diagonal coefficient is u r_A(m). |
| `diagonalHeckeGreen_laurent` | The extended kernel has the Laurent pole and tangent-height comparison of the disjoint case. |

| Test | Kind | Exact expectation |
|---|---|---|
| `diagonalHeckeGreen_no_hit` | compatibility | If r_A(m)=0 no finite-part term occurs. |
| `diagonalHeckeGreen_hit_u` | computation | For D=−3, m=1 and σ=1, there are three stabilizer terms modulo ±1. |
| `diagonalHeckeGreen_omit_self` | non-example | Deleting all diagonal terms loses u r_A(m)g_s(z), even though the remaining sum converges for Re s>1. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §5, (5.7) and the paragraph after it, p. 251.

<a id="classical-renormalized-self-value"></a>

### Renormalized resolvent self-value

**GZ.7/classical-renormalized-self-value** · theorem · `gz86_renormalized_self_value`

g_s(z) := lim_{w→z} (g_s(z, w) − log|2πi η(z)⁴ (z − w)|²) = −log|2π (z − z̄) η(z)⁴|² + 2 Γ′/Γ(s) − 2 Γ′/Γ(1).

Direct prerequisites: [GZ.7/classical-diagonal-green-kernel](#classical-diagonal-green-kernel), [GZ.7/classical-resolvent-residue](#classical-resolvent-residue), [GZ.7/classical-cusp-expansion](#classical-cusp-expansion), [GZ.7/classical-eta-tangent](#classical-eta-tangent).

Construction/proof: 1. Subtract the universal diagonal singularity and use the cusp continuation to define the self value. 2. Extract its Laurent residue and eta constant; the unsubtracted diagonal sum is undefined.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §5, p. 251.

<a id="classical-self-value-orbit-sum"></a>

### Self-value CM orbit sum

**GZ.7/classical-self-value-orbit-sum** · theorem · `gz86_self_value_orbit_sum`

Σ_{A∈Cl_K} g_s(τ_A) = 2h[Γ′/Γ(s) + Γ′/Γ(1) − log 2π] + lim_{σ→1} [(2u/π)|D|^{σ/2} ζ_K(σ) − 2h/(σ − 1)] = 2h[Γ′/Γ(s) − log 2π + (L′/L)(1, ε) + ½ log|D|].

Direct prerequisites: [GZ.7/classical-renormalized-self-value](#classical-renormalized-self-value), [GZ.7/classical-genus-kernel-evaluation](#classical-genus-kernel-evaluation), [GZ.7/classical-cm-eisenstein-sum](#classical-cm-eisenstein-sum).

Construction/proof: 1. Sum the renormalized self values over the CM orbit. 2. Use the ideal-pair calculation and CM Eisenstein evaluation on the diagonal contribution.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, §5, first display, p. 252.

<a id="classical-total-archimedean-formula"></a>

### Total archimedean CM formula

**GZ.7/classical-total-archimedean-formula** · theorem · `gz86_total_archimedean_formula`

Under classical notation C3: Proposition (4.2) (Proposition (4.2): archimedean contribution when r_A(m) = 0) remains true when m is the norm of an ideal in A, provided that the local symbols ⟨c, T_m d^σ⟩_v (v | ∞) in the definition of ⟨c, T_m d^σ⟩_∞ are defined by (5.3) with the normalized uniformizer g of (5.4) The differential ω = η⁴ dq/q and the normalized tangent vector at x, and γ^m_{N,s}(A) is defined by (3.3) with G^m_{N,s} as in (5.7). This invariant is then γ^m_{N,s}(A) = (expression in Corollary (3.17)) + 2h u r_A(m) (Γ′/Γ(s) − log 2π + (L′/L)(1, ε) + ½ log|D|).

Hypotheses: N>1 where the marked cusps 0 and ∞ must be distinct..

Direct prerequisites: [GZ.7/classical-disjoint-archimedean-sum](#classical-disjoint-archimedean-sum), [GZ.7/classical-diagonal-archimedean-height](#classical-diagonal-archimedean-height), [GZ.7/classical-self-value-orbit-sum](#classical-self-value-orbit-sum), [GZ.7/classical-tangent-product-formula](#classical-tangent-product-formula).

Construction/proof: 1. Add the disjoint and diagonal formulas with their tangent asymptotics. 2. Use the global tangent product formula to eliminate dependence on the one global branch choice.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter II, (5.8) Proposition, p. 252.

<a id="classical-degree-one-intersection"></a>

### Degree-one CM intersection count

**GZ.7/classical-degree-one-intersection** · theorem · `gz86_degree_one_intersection`

Under classical notation C3: Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Let m = 1, v | p with p ∤ ND, and r_A(1) = 0 (σ ≠ 1, so x ≠ x^σ over H). Then ⟨(x) − (∞), (x^σ) − (0)⟩_v = ⟨c, d^σ⟩_v = −½ Σ_{n≥1} Card(Isom_{W/π^n}(x^σ, x)) log q_v. The sum is zero unless x and x^σ meet mod π; by Deuring's theory it is zero if p splits in K; otherwise p is inert (as p ∤ D) and log q_v = 2 log p.

Direct prerequisites: [GZ.2/classical-local-intersection-height](#classical-local-intersection-height), `HeegnerPointEulerSystems:HE.2`, [GZ.7/classical-half-hom-count](#classical-half-hom-count).

Construction/proof: 1. At good reduction identify degree-one diagram Hom pairs with isomorphisms. 2. Use the source deformation-length formula, quotienting precisely by ±1 and retaining larger stabilizers.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, introduction, (0.4) and following paragraph, p. 253.

<a id="classical-supersingular-eichler-order"></a>

### Supersingular Eichler realization

**GZ.7/classical-supersingular-eichler-order** · theorem · `gz86_supersingular_eichler_order`

Under classical notation C3: Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Let p be inert in K and p ∤ N (in the paper's illustration p ∤ ND, m = 1). The endomorphism ring R = End_{W/π}(x mod π) of the (supersingular) reduction of the Heegner diagram is an Eichler order of index (level) N in the definite quaternion algebra B over ℚ of discriminant p (ramified exactly at p and ∞), and Hom_{W/π}(x^σ, x) is isomorphic to the left R-module R𝔞 (𝔞 an ideal in the class A). The points x and x^σ meet mod π if and only if R𝔞 is principal; then Card(Isom_{W/π}(x^σ, x)) is the number of generators of R𝔞.

Direct prerequisites: `HeegnerPointEulerSystems:HE.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.1`.

Construction/proof: 1. Apply the supersingular reduction theorem for a chosen cyclic-isogeny diagram. 2. Its endomorphism order has level N in the definite quaternion algebra ramified at p and ∞.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, introduction, p. 253.

<a id="classical-inert-order-model"></a>

### Inert quaternionic order model

**GZ.7/classical-inert-order-model** · construction · `inertOrderModel`

Under classical notation C3: Let p be inert in K (p ∤ ND) and q a prime with pq ≡ −1 (mod D), i.e. −pq ≡ 1 (mod D) (printed: 'q ≡ −p (mod D)', which makes the lattice below an order only when p² ≡ 1 modulo every prime l | D; see the new issue on (0.5) reported with this review; either condition gives (q/l) = (−p/l) for all l | D); then (q) = 𝔮𝔮̄ splits in K and B = K + Kj with jα = ᾱj (α ∈ K) and j² = −pq is the definite quaternion algebra of discriminant p. For some place v | p the order R = End_{W/π}(x mod π) is R = {α + βj ∈ B : α ∈ 𝔡⁻¹, β ∈ 𝔡⁻¹𝔮⁻¹𝔫, α − β integral at all primes dividing 𝔡}, 𝔡 = (√D) the different of K and 𝔫 the primitive ideal of norm N attached to x. For 𝔞 an ideal in the class A: Hom_{W/π}(x^σ, x) ≅ R𝔞 = {α + βj : α ∈ 𝔡⁻¹𝔞, β ∈ 𝔡⁻¹𝔮⁻¹𝔫𝔞̄, α − β integral at 𝔡}. (With the printed q ≡ −p (mod D) the same statements hold after replacing the congruence 'α − β integral at 𝔡' by 'α − pβ integral at 𝔡'.)

Direct prerequisites: [GZ.7/classical-supersingular-eichler-order](#classical-supersingular-eichler-order), `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

Construction/proof: 1. Choose q with pq≡−1 modulo D so that the ramified congruence lattice has integral reduced norms. 2. Identify the lattice and its local completions with the CM reduction order; multiplication on the right conjugates the β coefficient.

Uses: Gross–Zagier 1986 Chapter III, introduction, (0.5), p. 253 (general version (9.2)–(9.3), p. 265) — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `inertOrderModel` | The integral congruence lattice in (D,−pq), with pq≡−1 mod D, identified with the CM reduction order at a specified place. |
| `inertOrderModel_norm` | N(α+βj)=Nα+pqNβ is integral on the lattice. |
| `inertOrderModel_discriminant` | Reduced discriminant Np; locally Eichler away from p and maximal at p. |
| `inertOrderModel_hom_ideal` | Right multiplication by 𝔞 conjugates the β coefficient by 𝔞̄. |

| Test | Kind | Exact expectation |
|---|---|---|
| `inertOrderModel_correct_q` | computation | D=−7,p=3,N=2 permits q=23, since −69≡1 mod7. |
| `inertOrderModel_wrong_q` | non-example | q=11 satisfies q≡−p mod7 but gives nonintegral norms in the printed α≡β lattice; use pq≡−1. |
| `inertOrderModel_conjugate_ideal` | characterisation | Multiplication (α+βj)𝔞 yields α𝔞+β𝔞̄j, not β𝔞j. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, introduction, (0.5), p. 253 (general version (9.2)–(9.3), p. 265).

<a id="classical-norm-one-generators"></a>

### Norm-one generator count

**GZ.7/classical-norm-one-generators** · theorem · `gz86_norm_one_generators`

Under classical notation C3: In the setting of (0.5) Explicit model of B and of the order R, and R𝔞, R𝔞 is principal iff it contains b = α + βj with reduced norm Nb = Nα + pqNβ = N𝔞. If b is a generator, the ideals 𝔠 = (α)𝔡𝔞⁻¹ and 𝔠′ = (β)𝔡𝔮𝔫⁻¹𝔞̄⁻¹ are integral (0.6) and satisfy N𝔠 + pN·N𝔠′ = |D| (0.7). Putting n = pN𝔠′ and l = N𝔠 gives a solution of l + nN = |D| with n ≡ 0 (mod p) and r_A(l) ≠ 0; conversely such solutions yield generators of R𝔞 and contribute to the height in (0.4).

Direct prerequisites: [GZ.7/classical-inert-order-model](#classical-inert-order-model).

Construction/proof: 1. Count the norm-one elements by their α and β coordinates. 2. The exceptional unit classes are counted with u=#O_K×/2, not #O_K×.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, introduction, (0.6)–(0.7), p. 254.

<a id="classical-level-reduction-component"></a>

### CM level reduction component

**GZ.7/classical-level-reduction-component** · theorem · `gz86_level_reduction_component`

Under classical notation C3: Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Suppose p | N (so p = 𝔭𝔭̄ splits and v divides exactly one of 𝔫, 𝔫̄, where O/𝔫 ≅ ℤ/Nℤ is the annihilator of ker φ). Then the sections x and x^σ reduce to ordinary points in the component 𝓕_{0,n} if v | 𝔫̄, and 𝓕_{n,0} if v | 𝔫 (n = ord_p N).

Hypotheses: N>1 where the marked cusps 0 and ∞ must be distinct..

Direct prerequisites: `ModularCurvesPartII:R14.2`, `HeegnerPointEulerSystems:HE.2`.

Construction/proof: 1. Use the Deligne–Rapoport reduction and the ordinary CM level isogeny to identify the fibre component. 2. Compare the two cusp sections and the Hecke action on the same component.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, (3.1) Proposition, p. 256.

<a id="classical-component-orthogonality"></a>

### CM component orthogonality

**GZ.7/classical-component-orthogonality** · theorem · `gz86_component_orthogonality`

Under classical notation C3: Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. One of the divisors c = (x) − (∞) and d^σ = (x^σ) − (0) (printed 'd = (x^σ) − (0)') has zero intersection with every fibral component 𝓕_{a,b} of X ⊗ A_v: when p | N (so v divides exactly one of 𝔫, 𝔫̄), c does if v | 𝔫 and d^σ does if v | 𝔫̄; when p ∤ N the special fibre is irreducible and both do.

Hypotheses: N>1 where the marked cusps 0 and ∞ must be distinct..

Direct prerequisites: [GZ.7/classical-level-reduction-component](#classical-level-reduction-component), [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing).

Construction/proof: 1. Use the component intersection matrix and its fibre kernel. 2. The corrected divisor has zero pairing with the components; this is an intersection statement and does not require each CM section to be fixed by a torus action.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, (3.2) Corollary and proof, pp. 256–257.

<a id="classical-finite-intersection-height"></a>

### Finite CM intersection height

**GZ.7/classical-finite-intersection-height** · theorem · `gz86_finite_intersection_height`

Under classical notation C3: Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Assume m ≥ 1 is prime to N and r_A(m) = 0. Then ⟨c, T_m d^σ⟩_v = −(x · T_m x^σ) log q.

Hypotheses: N>1 where the marked cusps 0 and ∞ must be distinct..

Direct prerequisites: [GZ.2/classical-local-intersection-height](#classical-local-intersection-height), [GZ.7/classical-component-orthogonality](#classical-component-orthogonality), `HeegnerPointEulerSystems:HE.0`.

Construction/proof: 1. Apply the regular-model local-height theorem to c and T_m d^σ. 2. The CM component orthogonality removes the vertical correction and gives the explicit horizontal intersection formula.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, (3.3) Proposition, p. 257 (announced as (0.2), p. 252).

<a id="classical-hom-intersection-count"></a>

### CM Hom intersection count

**GZ.7/classical-hom-intersection-count** · theorem · `gz86_hom_intersection_count`

Under classical notation C3: Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Assume m is prime to N and r_A(m) = 0. Then (x · T_m x^σ) = ½ Σ_{n≥1} Card(Hom_{W/πⁿ}(x^σ, x)_{deg m}).

Direct prerequisites: [GZ.7/classical-half-hom-count](#classical-half-hom-count), [GZ.7/classical-isomorphism-intersection-count](#classical-isomorphism-intersection-count), `HeegnerPointEulerSystems:HE.2`.

Construction/proof: 1. Use the imported Hecke deformation/isomorphism formula over W/π^n. 2. Regroup degree-m maps by ±1 and sum the lifting lengths.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, (4.4) Proposition, p. 258 (announced as (0.3), p. 252; proved in §§5–6).

<a id="classical-half-hom-count"></a>

### Half Hom count

**GZ.7/classical-half-hom-count** · definition · `halfHomCount`

For sections y, x over W as in (2.1) Hom_S(y, x) between Γ₀(N)-diagrams, its degree: h_n(y, x)_{deg m} := ½ Card Hom_{W/πⁿ}(y, x)_{deg m}.

Direct prerequisites: `AbelianSchemesAndArithmeticModuli:A6`, `HeegnerPointEulerSystems:HE.2`.

Construction/proof: 1. Fix actual integral cyclic-isogeny diagrams before taking Hom. 2. The sign involution on nonzero degree-m maps is free; its orbits define the half count.

Uses: Gross–Zagier 1986 Chapter III, §4, last sentence before §5, p. 258 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `halfHomCount` | h_n(y,x)_m=(1/2)#Hom_{W/πⁿ}(y,x)_m for chosen integral cyclic-isogeny diagrams. |
| `halfHomCount_sign_orbits` | For m>0 it counts the free ±1 orbits. |
| `halfHomCount_degree_one` | Degree-one elements are diagram isomorphisms. |
| `halfHomCount_reduction` | Reduction n+1→n injects the degree-m Hom sets; h_{n+1}≤h_n. |

| Test | Kind | Exact expectation |
|---|---|---|
| `halfHomCount_empty` | degenerate | An empty Hom degree fibre gives zero. |
| `halfHomCount_two_isomorphisms` | computation | If the only degree-one maps are ±f then h_n=1. |
| `halfHomCount_stabilizer` | non-example | With six isomorphisms the half count is 3; quotienting by all automorphisms instead gives 1 and changes the coarse intersection weight. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §4, last sentence before §5, p. 258.

<a id="classical-new-hom-set"></a>

### New CM homomorphisms

**GZ.7/classical-new-hom-set** · definition · `newCMHom`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). For non-cuspidal W-sections y, x of X and n ≥ 1, reduction Hom_W(y, x) → Hom_{W/πⁿ}(y, x) is injective (4.5); set Hom^{new}_{W/πⁿ}(y, x) := Hom_{W/πⁿ}(y, x) ∖ (image of Hom_W(y, x)) and Aut^{new}_{W/πⁿ}(x) := Aut_{W/πⁿ}(x) ∖ Aut_W(x). For the Heegner points x, x^σ and p non-split in K, under the identification Hom_{W/πⁿ}(x^σ, x) ≅ End_{W/πⁿ}(x)·𝔞 ⊂ B of (7.3)(2), whose image of Hom_W(x^σ, x) ≅ 𝔞 lies in K, an element b is new exactly when b ∉ K, i.e. b₋ ≠ 0.

Direct prerequisites: `AbelianSchemesAndArithmeticModuli:A6`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

Construction/proof: 1. Embed the characteristic-zero Hom set into every Artinian reduction by rigidity. 2. Take its complement; at a nonsplit CM place new maps are exactly those with nonzero quaternionic anti-linear part.

Uses: Gross–Zagier 1986 Chapter III, §8, Lemma (8.2), p. 263 (Aut^{new}) and (8.4) with the following paragraph, p. 264 (Hom^{new}, and the reading b₋ ≠ 0); uses (4.5), p. 258 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `newCMHom` | The complement of the injective image Hom_W in Hom_{W/πⁿ}, and analogously for Aut. |
| `newCMHom_partition` | The full degree-m set is the disjoint union of liftable and new maps. |
| `newCMHom_quaternion` | At a non-split CM place a map is new iff b₋≠0. |
| `newCMHom_ordinary` | The new set is empty for canonical ordinary CM lifts. |

| Test | Kind | Exact expectation |
|---|---|---|
| `newCMHom_ordinary_empty` | degenerate | A split prime contributes no new CM maps. |
| `newCMHom_cm_scalar` | non-example | An element of K is liftable and is excluded from every valuation sum. |
| `newCMHom_nonzero_negative_part` | characterisation | b₋≠0 permits the norm valuation; b₋=0 has no finite lifting-length valuation. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §8, Lemma (8.2), p. 263 (Aut^{new}) and (8.4) with the following paragraph, p. 264 (Hom^{new}, and the reading b₋ ≠ 0); uses (4.5), p. 258.

<a id="classical-prime-to-p-hom-count"></a>

### Prime-to-p Hom decomposition

**GZ.7/classical-prime-to-p-hom-count** · theorem · `gz86_prime_to_p_hom_count`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume p ∤ m. Every point y of the divisor T_m x^σ is a Heegner point over H̄ in the sense of Gross [13] (defined over the ring class field of its conductor, not in general over H), with End_{H̄}(y) = O_y an order in K of conductor dividing m. Each y is rational over W ⊗ ℚ_p and is the canonical lifting of its reduction. For every n ≥ 1, h_n(x^σ,x)_{deg m} = Σ_{y ∈ T_m x^σ} h_n(y,x)_{deg 1}. Reason: a degree-m isogeny f: x^σ → x over W/π^n is determined by its kernel, which lifts uniquely to an étale subgroup C of order m of x^σ over W, and f induces an isomorphism x^σ_C ≅ x over W/π^n.

Direct prerequisites: [GZ.7/classical-half-hom-count](#classical-half-hom-count), [GZ.7/classical-new-hom-set](#classical-new-hom-set), `AbelianSchemesAndArithmeticModuli:A6`.

Construction/proof: 1. Separate the maps already lifting to W from the new maps. 2. For m prime to p, use the étale kernel to identify the prime-to-p degree fibres and their stabilizer count.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §5, (5.1), p. 258.

<a id="classical-isomorphism-intersection-count"></a>

### Diagram isomorphism intersection count

**GZ.7/classical-isomorphism-intersection-count** · theorem · `gz86_isomorphism_intersection_count`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Let x and y be W-sections of X which intersect properly (no common component) and reduce to regular, non-cuspidal points of the special fibre. Then (y·x) = Σ_{n≥1} h_n(y,x)_{deg 1} = Σ_{n≥1} ½·#Hom_{W/π^n}(y,x)_{deg 1}. This is a general fact, independent of y and x being Heegner points.

Direct prerequisites: [GZ.7/classical-half-hom-count](#classical-half-hom-count), `HeegnerPointEulerSystems:HE.2`.

Construction/proof: 1. Apply the local deformation length of a diagram isomorphism and sum over isomorphisms. 2. Divide by the correct sign/stabilizer factors; do not assert coarse Artinian Hom is independent of diagram choices.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §6, (6.1) Proposition, p. 259 (proof pp. 259–260, including (6.2)).

<a id="classical-split-vanishing"></a>

### Split CM intersection vanishing

**GZ.7/classical-split-vanishing** · theorem · `gz86_split_vanishing`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p splits in K and r_𝒜(m) = 0, then (x·T_m x^σ) = 0 at every place v | p (v ∤ N or v | N alike). Proof: Hom_{W/π^n}(x^σ,x) = Hom_W(x^σ,x) for all n ≥ 1, and this group has no element of degree m since r_𝒜(m) = 0.

Direct prerequisites: [GZ.7/classical-new-hom-set](#classical-new-hom-set), `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

Construction/proof: 1. Use canonical ordinary CM lifting to show every reduced CM map lifts. 2. Thus the new-map part vanishes at split p; any tangent correction is dealt with separately.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §7, (7.1) Proposition, p. 261.

<a id="classical-endomorphism-congruence-order"></a>

### CM endomorphism congruence order

**GZ.7/classical-endomorphism-congruence-order** · theorem · `gz86_endomorphism_congruence_order`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume p has a unique prime factor 𝔭 in K, and let R = End_{W/π}(x) ⊂ B = K + Kj as in (7.2). Then for all n ≥ 1: End_{W/π^n}(x) = {b ∈ R : D·N(b₋) ≡ 0 mod p·(N𝔭)^{n−1}}.

Direct prerequisites: `ComplexMultiplicationAndExplicitReciprocity:CM.5`, [GZ.7/classical-supersingular-eichler-order](#classical-supersingular-eichler-order).

Construction/proof: 1. Import the CM deformation theorem giving the endomorphism congruence filtration. 2. Intersect its quaternionic filtration with the chosen reduction order to obtain End_(W/π^n)(x).

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §7, (7.3) Proposition part 1), p. 262.

<a id="classical-hom-quaternion-realization"></a>

### CM Hom quaternion realization

**GZ.7/classical-hom-quaternion-realization** · theorem · `gz86_hom_quaternion_realization`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume p non-split. For any ideal 𝔞 in the class 𝒜 there is an isomorphism Hom_{W/π^n}(x^σ,x) ≅ End_{W/π^n}(x)·𝔞 ⊂ B, compatible in n. If the isogeny ϕ: x^σ → x corresponds to b ∈ B, then deg ϕ = N(b)/N(𝔞). It rests on Serre's construction x^σ ≅ Hom_O(𝔞, x).

Direct prerequisites: [GZ.7/classical-endomorphism-congruence-order](#classical-endomorphism-congruence-order), [GZ.7/classical-inert-order-model](#classical-inert-order-model), `AbelianSchemesAndArithmeticModuli:A6`.

Construction/proof: 1. Use the right ideal realizing Hom between the two CM reductions. 2. Intersect it with the endomorphism congruence filtration and check the norm/degree ratio N(b)/N(𝔞).

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §7, (7.3) Proposition part 2), p. 262 (with (4.2), p. 257).

<a id="classical-inert-disjoint-intersection"></a>

### Inert disjoint intersection formula

**GZ.7/classical-inert-disjoint-intersection** · theorem · `gz86_inert_disjoint_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume r_𝒜(m) = 0, p inert in K, v | p (so v ∤ N), and 𝔞 ∈ 𝒜 prime to p (implicit; see PAPER-GROSS-ZAGIER-86/E21). Then q_v = p² and (x·T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞)} ½(1 + ord_p N(b₋)), with R = End_{W/π}(x). For p ∤ D, ord_p N(b₋) is always odd.

Direct prerequisites: [GZ.7/classical-hom-intersection-count](#classical-hom-intersection-count), [GZ.7/classical-hom-quaternion-realization](#classical-hom-quaternion-realization), `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

Construction/proof: 1. Use the Hom realization and inert lifting length (ord_p N(b₋)+1)/2. 2. Sum only b₋≠0 and then divide by the ±1 action.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §7, (7.4) Corollary part 1), p. 262.

<a id="classical-ramified-disjoint-intersection"></a>

### Ramified disjoint intersection formula

**GZ.7/classical-ramified-disjoint-intersection** · theorem · `gz86_ramified_disjoint_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume r_𝒜(m) = 0, p ramified in K with prime 𝔭, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit; PAPER-GROSS-ZAGIER-86/E21). Then q_v = p^k with k the order of [𝔭] in Cl_K, and (x·T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞)} ord_p(D·N(b₋)).

Direct prerequisites: [GZ.7/classical-hom-intersection-count](#classical-hom-intersection-count), [GZ.7/classical-hom-quaternion-realization](#classical-hom-quaternion-realization), `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

Construction/proof: 1. Use the ramified lifting length ord_p N(b₋) in the source valuation convention. 2. Sum the new maps and retain the residue degree and ramified local correction.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §7, (7.4) Corollary part 2), p. 262.

<a id="classical-self-intersection-tangent"></a>

### Tangent self-intersection number

**GZ.7/classical-self-intersection-tangent** · definition · `cmSelfIntersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Suppose r_𝒜(m) ≠ 0, so c and T_m d^σ share the point x and ⟨c, T_m d^σ⟩_v is defined by Ch. II (5.1)/(5.3) using the tangent vector ∂/∂t at x. Here ∂/∂t is dual to ω = η⁴(q)dq/q when u = 1, is defined in general through the normalisation of the uniformiser g in Ch. II §5, read as ω = (1/u)(g^{1/u} + …)dg/g (printed without the factor 1/u; PAPER-GROSS-ZAGIER-86/E12), and is defined up to a 6th root of unity. Define (x·x) := ord_v(α), where α ∈ H_v^× is given (corrected reading) by ∂/∂t = α·(a basis of the free W-module T_x X). Printed: 'where α∂/∂t is a basis'; see PAPER-GROSS-ZAGIER-86/E16. With this convention the intersection formula (0.2), ⟨c, T_m d^σ⟩_v = −(x·T_m x^σ) log q_v, continues to hold.

Direct prerequisites: [GZ.7/classical-tangent-symbol](#classical-tangent-symbol), [GZ.7/classical-eta-tangent](#classical-eta-tangent), [GZ.2/classical-local-intersection-height](#classical-local-intersection-height).

Construction/proof: 1. Write ∂/∂t=αe with e an integral tangent basis. 2. The principal-divisor tangent law gives (x·x)=ord_v α and hence the negative local-height sign.

Uses: Gross–Zagier 1986 Chapter III, §8, (8.1), p. 263 (with Ch. II §5, (5.1)–(5.4), pp. 249–250) — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `cmSelfIntersection` | ord_v(α) for tangent ∂/∂t=αe, e an integral tangent basis. |
| `cmSelfIntersection_basis` | Replacing e by a unit multiple leaves ord_v(α) unchanged. |
| `cmSelfIntersection_scale` | Scaling the tangent by a multiplies α by a and adds ord_v(a). |
| `cmSelfIntersection_height` | The diagonal local height is minus this number times log q_v. |

| Test | Kind | Exact expectation |
|---|---|---|
| `cmSelfIntersection_integral_basis` | computation | A tangent basis has self-intersection zero. |
| `cmSelfIntersection_uniformizer` | computation | The tangent πe has self-intersection 1. |
| `cmSelfIntersection_reciprocal` | non-example | Defining α∂/∂t=e gives −1 for πe and reverses the local height sign. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §8, (8.1), p. 263 (with Ch. II §5, (5.1)–(5.4), pp. 249–250).

<a id="classical-new-automorphism-length"></a>

### New automorphism length

**GZ.7/classical-new-automorphism-length** · theorem · `gz86_new_automorphism_length`

For a chosen integral Γ₀(N)-diagram x in the smooth coarse locus, assume v∤N and u_x=#Aut_F(x)/2=1 (a non-elliptic point). With the eta-normalized cotangent of the tangent-symbol construction and α as in Chapter III (8.1), ord_v(α)=1/2 Σ_(n≥1)(#Aut_(W/π^n)(x)−#Aut_W(x))=1/2 Σ_(n≥1)#Aut^new_(W/π^n)(x). The sum is finite. Its value is zero exactly when the eta tangent is integral primitive, equivalently no new automorphisms occur at any level. Elliptic points and level primes use cmTensor_stabilizer_height with its nonzero tensor correction; this specialization makes no blanket assertion for them.

Hypotheses: W is the complete characteristic-zero DVR with uniformizer π and normalized ord_v; x is an actual chosen integral cyclic N-isogeny diagram, with smooth section in the coarse model.; v∤N and the effective stabilizer u_x equals one; the differential is the specified eta-normalized branch..

Direct prerequisites: [GZ.7/classical-self-intersection-tangent](#classical-self-intersection-tangent), [GZ.7/classical-new-hom-set](#classical-new-hom-set), `ComplexMultiplicationAndExplicitReciprocity:CM.5`, `HeegnerPointEulerSystems:HE.2`, [GZ.7/cm-tensor-stabilizer-height](#cm-tensor-stabilizer-height).

Construction/proof: 1. Apply cmTensor_stabilizer_height with θ=Δ and k=6. 2. In the non-elliptic, prime-to-N case specialize the tensor correction to zero; for elliptic and level places compute and retain it before the global product-formula cancellation.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §8, (8.2) Lemma, p. 263.

<a id="classical-j-tangent-values"></a>

### Special j tangent values

**GZ.7/classical-j-tangent-values** · theorem · `gz86_j_tangent_values`

Let N = 1, so X = Y = X₀(1) and X′ = Y′. For a point x as in (8.2), modulo μ₆ (printed 'mod μ₀', PAPER-GROSS-ZAGIER-86/E17): α ≡ j(x)^{2/3}(j(x) − 1728)^{1/2} if j(x) ≠ 0, 1728; α ≡ 2⁶·3⁴ if j(x) = 1728; α ≡ 2⁹·3^{3/2} if j(x) = 0.

Direct prerequisites: [GZ.7/classical-eta-tangent](#classical-eta-tangent), [GZ.7/classical-self-intersection-tangent](#classical-self-intersection-tangent), `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

Construction/proof: 1. Compute the leading modular discriminant/j coordinate at j=0 and j=1728. 2. Apply the corrected cotangent/tangent comparison, keeping the valuations at 2 and 3.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §8, (8.3), p. 263.

<a id="classical-new-hom-intersection"></a>

### New Hom intersection formula

**GZ.7/classical-new-hom-intersection** · theorem · `gz86_new_hom_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Allow r_𝒜(m) ≠ 0, with (x·x) defined by (8.1). If v ∤ mN, then (x·T_m x^σ) = ½ Σ_{n≥1} #Hom^{new}_{W/π^n}(x^σ,x)_{deg m}. Consequently the quaternionic formulas (7.4) remain true when p is non-split, provided the sum runs only over b ∈ R𝔞 with b ∉ K, i.e. b₋ ≠ 0; this is needed for the terms ord_p(Nb₋) to make sense.

Direct prerequisites: [GZ.7/classical-hom-intersection-count](#classical-hom-intersection-count), [GZ.7/classical-new-hom-set](#classical-new-hom-set), [GZ.7/classical-new-automorphism-length](#classical-new-automorphism-length), [GZ.7/classical-j-tangent-values](#classical-j-tangent-values).

Construction/proof: 1. Split the total Hecke intersection into the lifted diagonal and new Hom part. 2. Combine the self-tangent value and new automorphism length; retain all exceptional j terms.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §8, (8.4), p. 264.

<a id="classical-inert-total-intersection"></a>

### Inert total intersection formula

**GZ.7/classical-inert-total-intersection** · theorem · `gz86_inert_total_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v ∤ N, p inert in K, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit; PAPER-GROSS-ZAGIER-86/E21). Then (x·T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞), b₋ ≠ 0} ½(1 + ord_p N(b₋)) + ½·u·r_𝒜(m)·ord_p(m).

Direct prerequisites: [GZ.7/classical-new-hom-intersection](#classical-new-hom-intersection), [GZ.7/classical-inert-disjoint-intersection](#classical-inert-disjoint-intersection).

Construction/proof: 1. Insert the inert lifting-length formula in the new Hom intersection. 2. Add the tangent/diagonal terms with the source u and 1/2 factors.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 1), p. 264.

<a id="classical-ramified-total-intersection"></a>

### Ramified total intersection formula

**GZ.7/classical-ramified-total-intersection** · theorem · `gz86_ramified_total_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v ∤ N, p ramified in K, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit; PAPER-GROSS-ZAGIER-86/E21). Then (x·T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞), b₋ ≠ 0} ord_p(D·N(b₋)) + u·r_𝒜(m)·ord_p(m).

Direct prerequisites: [GZ.7/classical-new-hom-intersection](#classical-new-hom-intersection), [GZ.7/classical-ramified-disjoint-intersection](#classical-ramified-disjoint-intersection).

Construction/proof: 1. Insert the ramified lifting length in the new Hom intersection. 2. Add the tangent/diagonal term and the ramified different contribution.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 2), p. 264.

<a id="classical-split-total-intersection"></a>

### Split total intersection formula

**GZ.7/classical-split-total-intersection** · theorem · `gz86_split_total_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v ∤ N, p = 𝔭𝔭̄ split in K, v | 𝔭. Then (x·T_m x^σ) = u·r_𝒜(m)·k_𝔭, where k_𝔭 ≥ 0 and k_𝔭 + k_𝔭̄ = ord_𝔭(m) (printed with subscript 𝔭; equal to ord_p(m) since p splits). The k_𝔭 need not be integers: by Conrad (10.8), p. 49, u·r_𝒜(m)·k_𝔭 = u·κ_𝔭 with κ_𝔭 = Σ_𝔟 ord_𝔭(𝔟) over the integral ideals 𝔟 of norm m in 𝒜^{−1}, which 'in general is not divisible by r_𝒜(m)'. Conrad's form: (x·T_m x^σ)_v = u·κ_𝔭 with κ_𝔭, κ_𝔭̄ ∈ ℤ≥0 intrinsic to 𝔭, 𝔭̄ and κ_𝔭 + κ_𝔭̄ = r_𝒜(m)·ord_p(m).

Direct prerequisites: [GZ.7/classical-split-vanishing](#classical-split-vanishing), [GZ.7/classical-j-tangent-values](#classical-j-tangent-values), [GZ.7/classical-new-hom-intersection](#classical-new-hom-intersection).

Construction/proof: 1. Use the empty ordinary new Hom set. 2. The remaining contribution is the tangent/self term; it need not vanish before the global place sum.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 3), p. 264.

<a id="classical-level-intersection"></a>

### Level intersection formula

**GZ.7/classical-level-intersection** · theorem · `gz86_level_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v | N (so p | N, p splits in K, p ∤ m). Then (x·T_m x^σ) = 0 if v | 𝔫, and (x·T_m x^σ) = −u·r_𝒜(m)·ord_p(N) if v | 𝔫̄. The ingredients: Lemma (8.2) remains true when x reduces to the component of the cusp ∞, which happens when v | 𝔫. When v | 𝔫̄ (x on the component of 0), ∂/∂t spans N^{−u}·T_x X (printed '(N)^u T_x X'; see PAPER-GROSS-ZAGIER-86/E18).

Direct prerequisites: [GZ.7/classical-inert-total-intersection](#classical-inert-total-intersection), [GZ.7/classical-ramified-total-intersection](#classical-ramified-total-intersection), [GZ.7/classical-split-total-intersection](#classical-split-total-intersection), [GZ.7/classical-level-reduction-component](#classical-level-reduction-component).

Construction/proof: 1. Compare the source level model and Hecke intersections with the prime-to-level formulas. 2. Use the explicitly computed level component and the tangent regularization to retain the bad-level terms.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §8, (8.6) Proposition, p. 264.

<a id="classical-split-height-sum"></a>

### Split-prime height sum

**GZ.7/classical-split-height-sum** · theorem · `gz86_split_height_sum`

Standing notation (Ch. III): N > 1 (GZ's standing assumption; for N = 1 the cusps ∞ and 0 coincide and c, T_m d^σ always share them); K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p splits in K, then ⟨c, T_m d^σ⟩_p = −u·r_𝒜(m)·h·ord_p(m/N)·log p. Proof: by (8.5) and (8.6), ⟨c, T_m d^σ⟩_v = −u·r_𝒜(m)·j_𝔭·log q_v with j_𝔭 + j_𝔭̄ = ord_p(m/N), and Σ_{v|𝔭} log q_v = h·log p.

Direct prerequisites: [GZ.2/classical-p-height-sum](#classical-p-height-sum), [GZ.7/classical-split-total-intersection](#classical-split-total-intersection), [GZ.7/classical-level-intersection](#classical-level-intersection).

Construction/proof: 1. Combine the split total intersection and level terms. 2. The global tangent normalization cancels the residual split-prime self correction, giving the claimed p-height.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §9, (9.2) Proposition, p. 265.

<a id="classical-inert-hom-lattice"></a>

### Inert CM Hom lattice

**GZ.7/classical-inert-hom-lattice** · construction · `inertCMHomLattice`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). p inert, v | p, 𝔟 as in Eichler-order model S and Eichler's connecting-ideal theorem (quoted, Eichler [10, p. 118]), 𝔞 ∈ 𝒜 (prime to p and to 𝔡). Then R𝔞 = {α + βj : α ∈ 𝔡^{−1}𝔞, β ∈ 𝔡^{−1}𝔮^{−1}𝔫𝔟̄𝔟^{−1}𝔞̄, α ≡ (−1)^{ord_𝔣(𝔟)}β mod O_𝔣 for 𝔣 | 𝔡}. As printed this holds for 𝔟R = S𝔟; with R𝔟 = 𝔟S replace 𝔟̄𝔟^{−1} by 𝔟𝔟̄^{−1} (PAPER-GROSS-ZAGIER-86/E20).

Direct prerequisites: [GZ.7/classical-inert-order-model](#classical-inert-order-model), `GL2AutomorphicRepresentationsAndTransfer:R16.1`.

Construction/proof: 1. Choose the connecting ideal with identity 𝔟R=S𝔟. 2. Transport the explicit reduction lattice; its anti-linear coefficient transforms by 𝔟̄/𝔟. Reversing the identity requires reversing that ratio.

Uses: Gross–Zagier 1986 Chapter III, §9, (9.3), p. 265 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `inertCMHomLattice` | The fractional R𝔞 congruence lattice with connecting ideal chosen by 𝔟R=S𝔟. |
| `inertCMHomLattice_beta` | Its β ideal is 𝔡⁻¹𝔮⁻¹𝔫𝔟̄𝔟⁻¹𝔞̄. |
| `inertCMHomLattice_connecting_convention` | Using R𝔟=𝔟S instead replaces 𝔟 by 𝔟̄ in the formula. |
| `inertCMHomLattice_degree` | A lattice element has isogeny degree N(b)/N𝔞. |

| Test | Kind | Exact expectation |
|---|---|---|
| `inertCMHomLattice_b_one` | computation | 𝔟=O recovers the simpler inert-order lattice. |
| `inertCMHomLattice_orientation` | non-example | For non-ambiguous [𝔟], reversing the connecting identity while leaving 𝔟̄/𝔟 fixed changes the lattice. |
| `inertCMHomLattice_sign` | compatibility | The lattice and the degree fibre are preserved under b↦−b. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §9, (9.3), p. 265.

<a id="classical-inert-norm-ideal-map"></a>

### Inert norm-ideal map

**GZ.7/classical-inert-norm-ideal-map** · construction · `inertNormIdeals`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). p inert. For b = α + βj ∈ R𝔞 with (9.4) N(b) = N(α) + pq·N(β) = m·N(𝔞) and N(b₋) = pq·N(β) ≠ 0, define, with 𝔟 normalised as in the printed (9.3), i.e. 𝔟R = S𝔟 (with R𝔟 = 𝔟S replace 𝔟 by 𝔟̄ throughout, see PAPER-GROSS-ZAGIER-86/E20), the integral ideals (9.5) 𝔠 = (α)𝔡𝔞^{−1} and 𝔠′ = (β)𝔡𝔮𝔫^{−1}𝔟̄^{−1}𝔟𝔞̄^{−1}. Then 𝔠 ∈ 𝒜^{−1} and 𝔠′ ∈ 𝒜𝔅²[𝔮𝔫^{−1}], and (9.6) N𝔠 + N·p·N𝔠′ = m|D|. The integer n = p·N𝔠′ is non-zero and ord_p(n) = ord_p(N b₋) (using p ∤ N𝔞). δ(n) = Π_{l | (n,D)} 2 as in Ch. II (3.15).

Direct prerequisites: [GZ.7/classical-inert-hom-lattice](#classical-inert-hom-lattice), `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`.

Construction/proof: 1. Multiply α and β by the indicated different and fractional ideals to obtain integral ideals 𝔠 and 𝔠′. 2. Take ideal norms and classes: N𝔠+NpN𝔠′=m|D|; prime-to-p N𝔞 gives the valuation equality.

Uses: Gross–Zagier 1986 Chapter III, §9, (9.4)–(9.6), p. 265 — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `inertNormIdeals` | From b=α+βj with N(b)=mN𝔞 and b₋≠0 form the two integral ideals 𝔠,𝔠′ of (9.5). |
| `inertNormIdeals_classes` | [𝔠]=A⁻¹ and [𝔠′]=AB²[𝔮𝔫⁻¹] in the printed connecting convention. |
| `inertNormIdeals_norm` | N𝔠+NpN𝔠′=m\|D\|. |
| `inertNormIdeals_valuation` | For p∤N𝔞, ord_p(pN𝔠′)=ord_p N(b₋). |

| Test | Kind | Exact expectation |
|---|---|---|
| `inertNormIdeals_nonzero` | characterisation | b₋≠0 implies N𝔠′>0, so the finite sum excludes n=0. |
| `inertNormIdeals_sign` | extensionality | b and −b produce the same ideal pair. |
| `inertNormIdeals_bad_a` | non-example | If p\|N𝔞 the valuation equality requires the extra ord_p(N𝔞), so the prime-to-p hypothesis cannot be dropped. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §9, (9.4)–(9.6), p. 265.

<a id="classical-inert-height-sum"></a>

### Inert-prime height sum

**GZ.7/classical-inert-height-sum** · theorem · `gz86_inert_height_sum`

Standing notation (Ch. III): N > 1 (GZ's standing assumption; for N = 1 the cusps ∞ and 0 coincide and c, T_m d^σ always share them); K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p is inert in K (r_𝒜(m) arbitrary), then ⟨c, T_m d^σ⟩_p = −r_𝒜(m)·h·u·ord_p(m)·log p − u²·log p·Σ_{0 < n < m|D|/N, n ≡ 0 (mod p)} ord_p(pn)·r_𝒜(m|D| − nN)·δ(n)·R_{{𝒜𝔮𝔫}}(n/p). Here δ(n) = 2^{#{primes l | (n,D)}}, R_{{𝒞}}(k) is the number of integral ideals of norm k in the genus of 𝒞 (Ch. II (3.17)), and 𝔮 | q is the auxiliary prime of the referenced classical source result 165. The value does not depend on the choice of q, of 𝔮 | q, or of 𝔫 versus 𝔫̄.

Direct prerequisites: [GZ.2/classical-p-height-sum](#classical-p-height-sum), [GZ.7/classical-inert-total-intersection](#classical-inert-total-intersection), [GZ.7/classical-level-intersection](#classical-level-intersection), [GZ.7/classical-inert-norm-ideal-map](#classical-inert-norm-ideal-map), [GZ.7/classical-inert-unit-count](#classical-inert-unit-count), `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. Use the corrected u²δ(n) count of preimages of each norm-ideal pair. 2. Multiply by the inert half-valuation length, reindex n=pN𝔠′>0 and sum the residue-weighted places.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §9, (9.7) Proposition, p. 266; `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, introduction, p. 253 (proved as the r_A(m) = 0 case of Proposition (9.7), p. 266).

<a id="classical-inert-unit-count"></a>

### Inert unit-orbit count

**GZ.7/classical-inert-unit-count** · theorem · `gz86_inert_unit_count`

Standing notation (Ch. III) with N > 1, p inert in K, the auxiliary prime q chosen with −pq ≡ 1 (mod D) (PAPER-GROSS-ZAGIER-86/E19) and 𝔞 ∈ 𝒜 prime to pD (PAPER-GROSS-ZAGIER-86/E21). Let 𝔠 ∈ 𝒜^{−1} and 𝔠′ be integral ideals with 𝔠′ in the class 𝒜[𝔮𝔫^{−1}]𝔅² for some 𝔅 ∈ Cl_K, with N𝔠 + N·p·N𝔠′ = m|D| and n = p·N𝔠′ > 0. Reversing (9.5) determines α, β up to units of O; integrality of N(α) + pqN(β) = m·N𝔞 forces α ≡ ±β mod O_𝔣 for every prime 𝔣 | 𝔡, and the resulting b = α + βj lie in R_{v′}𝔞 for places v′ | p in one Gal(H/K)-orbit. Each such pair contributes exactly u²·δ(n) elements b ∈ ⊔_{v|p} R_v𝔞/±1 (printed '2·u²·δ(n)', PAPER-GROSS-ZAGIER-86/E22), each of weight ½(1 + ord_p N(b₋)) = ½·ord_p(pn) in Σ_{v|p}(x·T_m x^σ)_v; summing over pairs and over 𝔅 gives the second term of (9.7).

Direct prerequisites: [GZ.7/classical-inert-norm-ideal-map](#classical-inert-norm-ideal-map), `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. For each norm-ideal pair count the unit generators and ramified congruence choices. 2. Quotient once by the simultaneous sign; this yields u²δ(n), not the printed doubled coefficient.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §9, proof of Proposition (9.7), p. 266.

<a id="classical-ramified-order-model"></a>

### Ramified quaternionic order model

**GZ.7/classical-ramified-order-model** · construction · `ramifiedOrderModel`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). p ramified in K with prime 𝔭; f = order of [𝔭] in Cl_K. There are h/f places v | 𝔭 in H, each with q_v = p^f (printed 'residual degree p^f', PAPER-GROSS-ZAGIER-86/E23). Choose a prime q with (q/p′) = (−1/p′) for all primes p′ ≠ p dividing D and (−q/p) = −1; for the order model one must also impose −q ≡ 1 (mod D/p) (PAPER-GROSS-ZAGIER-86/E19). Then q = 𝔮𝔮̄ splits in K, B has Hilbert symbol (D, −q), and B = K + Kj with j² = −q. With 𝔟 normalised by 𝔟R = S𝔟 as in the printed (9.3) (with R𝔟 = 𝔟S replace 𝔟 by 𝔟̄ throughout; PAPER-GROSS-ZAGIER-86/E20): (9.8) R𝔞 = {α + βj : α ∈ 𝔭𝔡^{−1}𝔞, β ∈ 𝔭𝔡^{−1}𝔮^{−1}𝔫𝔟̄𝔟^{−1}𝔞̄, α ≡ (−1)^{ord_𝔣(𝔟)}β mod O_𝔣 for 𝔣 | 𝔡} (β missing in print, PAPER-GROSS-ZAGIER-86/E24). The class of 𝔟 is well defined in Cl_K/[𝔭] by v. For b = α + βj ∈ R𝔞 with N(b) = m·N(𝔞) and N(b₋) ≠ 0, (9.9) 𝔠 = (α)𝔡𝔞^{−1} ∈ 𝒜^{−1} and 𝔠′ = (β)𝔡𝔮𝔫^{−1}𝔟̄^{−1}𝔟𝔞̄^{−1} ∈ 𝒜[𝔮𝔫^{−1}]𝔅² are integral and both divisible by 𝔭, and (9.10) N𝔠 + N·N𝔠′ = m|D|. The integer n = N𝔠′ is non-zero, with ord_p(n) = ord_p(D·N(b₋)).

Direct prerequisites: [GZ.7/classical-inert-order-model](#classical-inert-order-model), `ComplexMultiplicationAndExplicitReciprocity:CM.5`, `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`.

Construction/proof: 1. Choose the ramified model q with −q≡1 modulo D/p and the prescribed nonsquare residue at p. 2. Transport the connecting ideal as in the inert case and form the two norm ideals, each divisible by 𝔭.

Uses: Gross–Zagier 1986 Chapter III, §9, pp. 266 ((9.8)–(9.10)) — Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.; GZ.7 specialization — Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here..

| Declaration | Required API |
|---|---|
| `ramifiedOrderModel` | The CM reduction lattice in (D,−q), with −q≡1 mod D/p and (−q/p)=−1, together with its norm-ideal map. |
| `ramifiedOrderModel_norm` | N(α+βj)=Nα+qNβ. |
| `ramifiedOrderModel_ideals` | Both integral ideals 𝔠,𝔠′ are divisible by 𝔭 and N𝔠+NN𝔠′=m\|D\|. |
| `ramifiedOrderModel_places` | h/f places, residue size p^f, f=order[𝔭]. |

| Test | Kind | Exact expectation |
|---|---|---|
| `ramifiedOrderModel_beta_congruence` | non-example | The congruence has α≡(−1)^ord𝔣(𝔟)β; omission of β does not define the claimed lattice. |
| `ramifiedOrderModel_p_divides_n` | characterisation | n=N𝔠′ is positive and divisible by p. |
| `ramifiedOrderModel_residue_weight` | computation | For f=2 the weight is 2log p at each of h/2 places. |

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §9, pp. 266 ((9.8)–(9.10)).

<a id="classical-ramified-height-sum"></a>

### Ramified-prime height sum

**GZ.7/classical-ramified-height-sum** · theorem · `gz86_ramified_height_sum`

Standing notation (Ch. III): N > 1 (GZ's standing assumption; for N = 1 the cusps ∞ and 0 coincide and c, T_m d^σ always share them); K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p is ramified in K with prime 𝔭 (r_𝒜(m) arbitrary), then ⟨c, T_m d^σ⟩_p = −r_𝒜(m)·h·u·ord_p(m)·log p − u²·log p·Σ_{0 < n < m|D|/N, n ≡ 0 (mod p)} ord_p(n)·r_𝒜(m|D| − nN)·δ(n)·R_{{𝒜𝔮𝔭𝔫}}(n/p), with δ and R as in (9.7) Inert primes: explicit ⟨c, T_m d^σ⟩_p and 𝔮 the auxiliary prime of (9.8)–(9.10) Ramified-case model: q, B = (D, −q), R𝔞 and the ideals 𝔠, 𝔠′.

Direct prerequisites: [GZ.2/classical-p-height-sum](#classical-p-height-sum), [GZ.7/classical-ramified-total-intersection](#classical-ramified-total-intersection), [GZ.7/classical-level-intersection](#classical-level-intersection), [GZ.7/classical-ramified-order-model](#classical-ramified-order-model), `AnalyticNumberTheory:AN.4`.

Construction/proof: 1. Apply the ramified norm-ideal count and lifting valuation to n=N𝔠′>0. 2. There are h/f places with q_v=p^f; their aggregate log weight is h log p.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter III, §9, (9.11) Proposition, p. 267.

<a id="classical-global-local-archimedean-sum"></a>

### Global-local archimedean comparison

**GZ.7/classical-global-local-archimedean-sum** · theorem · `gz86_global_local_archimedean_sum`

Under classical notation C7: For (m, N) = 1, <c, T_m d^σ> = Σ_v <c, T_m d^σ>_v over places v of H (Néron local symbols; when |c| ∩ |T_m d^σ| ≠ ∅, i.e. r_𝒜(m) ≠ 0, defined as in Chap. II §5). By Chap. II Props. (4.2), (5.8) and Chap. IV Prop. (4.6)(a): Σ_{v|∞} <c, T_m d^σ>_v = lim_{s→1}[−2u² Σ_{n≥1} σ_𝒜(−n) r_𝒜(m|D| + nN) Q_{s−1}(1 + 2nN/(m|D|)) − hκσ₁(m)/(s − 1)] + hκ[σ₁(m)(log(N/|D|) + 2Σ_{p|N} log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_{d|m} d log(m/d²)] + hu r_𝒜(m)[2(L′/L)(1, ε) − 2γ − 2 log 2π + log|D|], with σ_𝒜(n) = Σ_{d|n} ε_𝒜(n, d) (ε_𝒜(n,d) ∈ {0, 1, −1} as in Chap. IV Prop. (3.2)), κ = κ_N = −12/(N ∏_{p|N}(1 + 1/p)), σ₁(m) = Σ_{d|m} d.

Direct prerequisites: [GZ.7/classical-total-archimedean-formula](#classical-total-archimedean-formula), [GZ.0/height-convention-dictionary](#height-convention-dictionary).

Construction/proof: 1. Translate the local modular height sum into the field-relative canonical pairing. 2. Separate the complex norm, unit index and degree-of-field factors before comparing coefficients.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter V, §1, pp. 306-307 (first display on p. 307).

<a id="classical-finite-height-sum"></a>

### Total finite CM height formula

**GZ.7/classical-finite-height-sum** · theorem · `gz86_finite_height_sum`

Under classical notation C7: Combining Chap. III Props. (9.2), (9.7), (9.11) over all p and Chap. IV Prop. (4.6)(b): for (m, N) = 1, <c, T_m d^σ>_finite = −u² Σ_{0<n≤m|D|/N} σ′_𝒜(n) r_𝒜(m|D| − nN) + hu r_𝒜(m) log(N/m), where σ′_𝒜(n) = Σ_{d|n} ε_𝒜(n, d) log(n/d²).

Direct prerequisites: [GZ.7/classical-split-height-sum](#classical-split-height-sum), [GZ.7/classical-inert-height-sum](#classical-inert-height-sum), [GZ.7/classical-ramified-height-sum](#classical-ramified-height-sum), [GZ.2/classical-p-height-sum](#classical-p-height-sum).

Construction/proof: 1. Add the split-zero, inert and ramified prime height sums with finite support. 2. Use the single-prime logarithm coefficient identity to express their total by the source σ′ sum.

Acceptance: Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims..

Sources: `gross-zagier-1986`, published Invent. Math. 84 (1986), Chapter V, §1, p. 307 (second display).

<a id="cm-tensor-stabilizer-height"></a>

### CM tensor stabilizer height

**GZ.7/cm-tensor-stabilizer-height** · theorem · `cmTensor_stabilizer_height`

Let x be a chosen integral Γ₀(N)-diagram over the complete characteristic-zero DVR W whose section is in the smooth locus of the coarse model. Let ω_x be a nonzero rational cotangent vector, u_x=#Aut_F(x)/2, and θ a nonzero global differential tensor of weight k with order r_x at x; assume r_x+k≠0. Define C_x by the leading expansion θ=(C_x t_x^(r_x)+…) (dt_x)^⊗k for dt_x=ω_x, and ord_(v,x)(θ) using the integral universal deformation coordinate. Then (x·x)_(v,ω_x)= 1/2 Σ_(n≥0)(#Aut_(W/π^(n+1))(x)−#Aut_W(x)) + [ord_v(C_x u_x^k)−ord_(v,x)(θ)]/(r_x+k). The sum is finite. For θ=Δ, k=6, u_x=1 and v∤N the tensor-corrected eta intersection equals the new-automorphism sum; at elliptic points and v|N retain the displayed correction.

Hypotheses: Chosen actual integral diagram and formally smooth one-dimensional deformation ring R₀=W[[T₀]]; Finite effective stabilizer G=Aut_k(x)/±1 acts faithfully; invariant ring is the coarse completed local ring; x is smooth there.

Direct prerequisites: `ModularCurvesPartII:R14.2`, `AbelianSchemesAndArithmeticModuli:A6`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`, [GZ.7/classical-self-intersection-tangent](#classical-self-intersection-tangent), [GZ.7/classical-new-hom-set](#classical-new-hom-set).

Construction/proof: 1. Form the invariant coordinate T_x=Norm_G(T₀)=Π_g[g](T₀). 2. A g lifts to W/π^(n+1) precisely when the constant term of [g](T₀) is divisible by π^(n+1); the finite automorphism sum is ord_v(b_x) for T_x=b_xT₀^(u_x)+…. 3. Compare the leading coefficient of θ after substitution: ord_(v,x)(θ)=ord_v(C_x u_x^k)+(r_x+k)ord_v(b_x). 4. Use the cotangent intersection parameter-change law; for Δ apply the extra integral leading coefficient instead of deleting it at small residue characteristics.

Acceptance: At u_x=1,v∤N the eta correction recovers the historical half automorphism sum.; At u_x>1 the u_x^k and tensor order terms must be retained.; Scaling ω by c changes the self-intersection by −ord_v(c)..

Sources: `conrad-author-2004`, author final copy §9 Theorem9.2, (9.5)–(9.10), pp.38–40 (published pp.105–107).

## Supplier requests

These are precise outputs needed from the existing owners. They are prerequisites, not additional GZ implementations.

1. **AutomorphicLFunctionsAndLocalFactors:AL.3**: For GL₂ and a quadratic torus character with matching centre, construct the local base-change epsilon factors and prove the Rankin-over-F comparison by ηv(−1), with fixed ψv and self-dual measures. Existing GL_n×GL_{n−1} factors are not this quadratic base-change interface.

   Consumers: [GZ.0/root-number-and-measure-normalisation-corrections](#root-number-and-measure-normalisation-corrections), [GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional](#saito-tunnell-dichotomy-and-the-local-toric-functional).

2. **HeightsRationalPointsAndObstructions:RP.0**: General line-bundle Weil heights on projective abelian varieties; bounded-error tensor and pullback laws; the canonical quadratic limit for symmetric L; its uniqueness, positivity for ample L and torsion zero locus using Northcott; compatible relative/absolute normalization and finite-extension local-degree formula. Supply rational scalar extension of the quadratic form. Existing height-class nodes do not yet provide this machine.

   Consumers: [GZ.1/neron-tate-height-and-the-poincare-pairing](#neron-tate-height-and-the-poincare-pairing), [GZ.0/height-convention-dictionary](#height-convention-dictionary), [GZ.0/canonical-height-rational](#canonical-height-rational).

3. **AbelianSchemesAndArithmeticModuli:A2**: The dual abelian variety and its rigidified Poincaré biextension, tensor laws, pullback under homomorphisms and theorem-of-the-square identity for a symmetric polarization. The completed Poincaré sheaf in Part II is not the algebraic biextension interface.

   Consumers: [GZ.1/neron-tate-height-and-the-poincare-pairing](#neron-tate-height-and-the-poincare-pairing).

4. **HeightsRationalPointsAndObstructions:RP.1**: General Mordell–Weil finite generation for A over a number field from weak descent and the Northcott height argument; reduce the descent height step to Mathlib AddCommGroup.fg_of_descent'.

   Consumers: [GZ.1/character-height-pairing](#character-height-pairing).

5. **ArakelovGeometryAndAbelianHeights:R35.1**: Hermitian rational line bundles, Green arithmetic divisors, finite/infinite arithmetic degrees and the product formula with conjugation-compatible metrics; GZ.2 specializes this infrastructure to curve intersections.

   Consumers: [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing).

6. **AbelianSchemesAndArithmeticModuli:A2**: Canonical principal polarization of the Jacobian and comparison of its theta bundle with the rigidified Poincaré bundle; the full polarization is one half of that for Θ+[-1]*Θ.

   Consumers: [GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions](#hodge-index-theorem-and-admissible-arithmetic-extensions).

7. **ModularCurvesPartII:R14.6**: For modular X₀(N), logarithmic Hodge divisor, cusp and elliptic-stabilizer weights, finite-level pullback/push-forward and differential q-expansion comparison, compatible with the imported quaternionic Hodge line.

   Consumers: [GZ.3/normalised-hodge-class-and-xi-parametrised-realisation](#normalised-hodge-class-and-xi-parametrised-realisation), [GZ.3/manin-constant](#manin-constant).

8. **GL2AutomorphicRepresentationsAndTransfer:R17.3**: Weight-two Shimura-Jacobian constituent comparison: rational Hecke summands and Hom⁰(J_U,A), their multiplicity one, coefficient field degree equal to dim A, End_F⁰(A) and compatibility with the rational Jacquet–Langlands model. The existing rational-model node supplies transfer descent but not this geometric realization.

   Consumers: [GZ.3/strict-gl2-realization](#strict-gl2-realization).

9. **AutomorphicFormsOnReductiveGroups:AF.3**: Weight-two Hodge realization of the quaternionic automorphic constituent with Petersson/Tamagawa pairing and restricted tensor factorization, compatible with the rational Hecke realization and geometric curve volume.

   Consumers: [GZ.3/petersson-composition-comparison](#petersson-composition-comparison).

10. **NeronModelsAndSemistableAbelianVarieties:R11.1**: The minimal invariant differential lattice of an elliptic Néron model, pullback under isogenies and its local valuation; needed to compare Manin constants across an isogeny class.

   Consumers: [GZ.3/manin-constant](#manin-constant), [GZ.3/manin-isogeny-twist-transfer](#manin-isogeny-twist-transfer).

11. **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4**: Raynaud uniqueness/exactness input for finite flat group schemes over a mixed-characteristic DVR of absolute ramification e<p−1, sufficient for Mazur’s optimal modular-parametrization Néron differential theorem.

   Consumers: [GZ.3/manin-integrality-and-p-unit](#manin-integrality-and-p-unit).

12. **ModularCurvesPartII:R14.1**: Proper cycle push-forward with generic residue-degree multiplicities, base-change/push-pull and the passage from divisor correspondences on X×X to Hom(J,J∨). Use existing algebraic cycles, rather than replacing a cycle by its reduced image.

   Consumers: [GZ.6/special-correspondence-cycle](#special-correspondence-cycle).

13. **ModularCurvesPartII:R14.2**: Hecke double-coset correspondences on finite-level modular/Shimura curves, their convolution with multiplicities and action on Pic⁰, with level compatibilities.

   Consumers: [GZ.6/special-correspondence-cycle](#special-correspondence-cycle).

14. **HeegnerPointEulerSystems:HE.1**: CM points on the finite-level quaternionic tower, their connected-component labels, ring-class field of definition, reciprocity and Hecke/level transport, with the chosen Artin convention.

   Consumers: [GZ.6/cm-degree-zero-class](#cm-degree-zero-class).

15. **ModularCurvesPartII:R14.4**: Curve-level Chow/Picard operations, diagonal restriction, Hecke q-series/cohomology comparison and cusp boundary terms sufficient to prove modularity of the actual Picard-valued Hecke series; not an abstract modular-height-series hypothesis.

   Consumers: [GZ.6/picard-generating-series](#picard-generating-series).

16. **AutomorphicSpectralTheory:AS.3**: Meromorphic continuation of the mixed incoherent Eisenstein kernel, compact-parameter derivative bounds, regularized torus integration and its constant-term subtraction, including justification of all derivative/integral exchanges.

   Consumers: [GZ.6/incoherent-central-derivative](#incoherent-central-derivative).

17. **AutomorphicSpectralTheory:AS.4**: Holomorphic/cuspidal constituent projection with Petersson adjunction, annihilation of constants/Eisenstein/old components in the new constituent, and compatibility with the relevant theta/correspondence kernels.

   Consumers: [GZ.6/arithmetic-theta-lifting](#arithmetic-theta-lifting), [GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity](#generating-series-arithmetic-theta-lifting-and-the-kernel-identity).

18. **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5**: CM elliptic/formal-group deformation and lifting-length calculations, ordinary Serre–Tate comparison and the characteristic-zero dyadic/wild ranges needed for toric arithmetic intersections; exact local models and residue weights.

   Consumers: [GZ.7/good-local-arithmetic-identity](#good-local-arithmetic-identity).

19. **AutomorphicFormsOnReductiveGroups:AF.1**: The approximation/density principle used by YZZ §1.5.10: precise conditions on S, centre, topology and automorphic transformation law that promote equality on 1^SGL₂(A^S) to a global equality. Verify the source’s GL₂ density claim with its central-character quotient rather than invoking unrestricted strong approximation for the determinant.

   Consumers: [GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation](#degenerate-schwartz-functions-local-decomposition-and-approximation).

20. **TropicalAndBerkovichArithmetic:TB.3**: Connected compact metric-graph Laplacian Δf=−f″dx−Σ outgoing slopes δv; existence and symmetry of the normalized Green kernel for a probability measure; effective resistance, bridge infinity and edge-subdivision compatibility. GZ.2 supplies the genus-weighted canonical-divisor admissibility condition, not this generic graph theory.

   Consumers: [GZ.2/graph-admissible-measure](#graph-admissible-measure), [GZ.2/explicit-skeleton-measure](#explicit-skeleton-measure).

21. **TropicalAndBerkovichArithmetic:TB.2**: Skeleton inclusion and retraction for split semistable curves over a complete discretely valued field not assumed algebraically closed, with finite-Galois descent and unit edge normalization. The existing TB.2 skeleton nodes assume an algebraically closed base and are insufficient as stated.

   Consumers: [GZ.2/graph-admissible-measure](#graph-admissible-measure).

22. **TropicalAndBerkovichArithmetic:TB.6**: Model metric and Chambert-Loir Chern measure comparison c₁(O(f))=−i*(Δf) for norm ‖1‖=eK^(−f∘r), including finite-extension normalization and approximation of graph functions.

   Consumers: [GZ.2/explicit-skeleton-measure](#explicit-skeleton-measure).

23. **AutomorphicSpectralTheory:AS.4**: The compact Riemann-surface Green operator with logarithmic singularity, zero-mean inverse of ddᶜ on zero-mass currents, self-adjointness and smooth off-diagonal regularity; holomorphic one-form hermitian pairing.

   Consumers: [GZ.2/arakelov-probability-form](#arakelov-probability-form), [GZ.2/admissible-metric-existence](#admissible-metric-existence), [GZ.2/normalized-arakelov-green](#normalized-arakelov-green).

24. **AutomorphicSpectralTheory:AS.4**: Petersson projection onto parallel-weight-two cuspidal forms in each central-character component, its pairing characterization, the regularized Whittaker integral formula and growth hypotheses used by YZZ Proposition6.12. Apply under the two-split-place assumption; do not assume the derivative is square integrable without that growth argument.

   Consumers: [GZ.6/colmez-projected-derivative](#colmez-projected-derivative), [GZ.6/colmez-rev-archimedean-holomorphic-projection-of-log](#colmez-rev-archimedean-holomorphic-projection-of-log).

25. **AutomorphicSpectralTheory:AS.2**: GL₂ local/adelic Iwasawa functions δ_v([[a,b],[0,d]]k)=|a/d|_v^(1/2), ρ_v=e^(iθ) with a>0 at real places; δ=Πδ_v and ρ∞=Πρ_v. Include well-definedness and (ρ∞δ∞)([[1,0],[N,1]])=(1+iN)^(−[F:ℚ]).

   Consumers: [GZ.6/colmez-pseudo-comparison](#colmez-pseudo-comparison), [GZ.6/mixed-theta-eisenstein](#mixed-theta-eisenstein).

26. **MetaplecticAutomorphicForms:MP.5**: Extended Weil action r(g,(t₁,t₂)) on S̄(V×A×), its Gaussian real factors, orthogonal-direct-sum factorization, complement discriminant characters, Fourier/Hecke action and theta convergence for the unit-quotient positive-definite and incoherent quaternionic data.

   Consumers: [GZ.6/colmez-pseudo-theta](#colmez-pseudo-theta), [GZ.6/colmez-pseudo-comparison](#colmez-pseudo-comparison), [GZ.6/mixed-theta-eisenstein](#mixed-theta-eisenstein), [GZ.7/colmez-test-function](#colmez-test-function), [GZ.7/colmez-nonzero-theta](#colmez-nonzero-theta).

27. **AutomorphicSpectralTheory:AS.2**: Meromorphic Eisenstein/Green-resolvent families and Legendre Q_s(t)=∫₀∞(t+√(t²−1)cosh u)^(−1−s)du, t>1; the CM Green sum initially convergent for Re s>0 with simple-pole continuation at zero. Include zero/nonzero Whittaker branch intertwiner continuation.

   Consumers: [GZ.6/mixed-theta-eisenstein](#mixed-theta-eisenstein), [GZ.6/colmez-whittaker](#colmez-whittaker), [GZ.7/colmez-arch-green](#colmez-arch-green), [GZ.7/colmez-rev-archimedean-derivative-kernel](#colmez-rev-archimedean-derivative-kernel).

28. **AutomorphicLFunctionsAndLocalFactors:AL.1**: Local additive-character different and self-dual measures, Weil-index/L-factor normalizations, quadratic norm cosets including wild ramification and representation-density Whittaker shell formula.

   Consumers: [GZ.6/colmez-whittaker](#colmez-whittaker), [GZ.7/colmez-norm-shells](#colmez-norm-shells), [GZ.6/colmez-rev-local-whittaker-series-for-incoherent](#colmez-rev-local-whittaker-series-for-incoherent).

29. **ComplexMultiplicationAndExplicitReciprocity:CM.5**: Gross canonical/quasicanonical lifting with endomorphism filtration O_E+π_E^(m−1)O_B, and wild norm conductor v(D); derive the corrected half-valuation ramified CM multiplicity. Distinguish this reusable deformation input from GZ’s weighted height series.

   Consumers: [GZ.7/colmez-rev-corrected-cm-multiplicity-at-split](#colmez-rev-corrected-cm-multiplicity-at-split), [GZ.7/colmez-local-m-inert](#colmez-local-m-inert), [GZ.7/colmez-local-m-ramified](#colmez-local-m-ramified).

30. **HeegnerPointEulerSystems:HE.2**: CM-point reduction and ordinary intersection multiplicities on quaternionic Shimura curves: Zhang’s upper/lower-unipotent formula, plus compatibility with finite-level projection and residue-prime weights.

   Consumers: [GZ.7/colmez-finite-multiplicity](#colmez-finite-multiplicity).

31. **HilbertModularVarietiesAndShimuraCurves:R18.5**: Finite-level CM class quotient, field-of-definition reciprocity and unramifiedness above division places; compact coarse Q-factorial integral models after permitted unramified base change; chosen maximal order containing O_E; regular small-away-v covers with U′v=Uv and stabilizer multiplicity e; split-fibre component decomposition.

   Consumers: [GZ.6/colmez-torus-average](#colmez-torus-average), [GZ.7/colmez-test-function](#colmez-test-function), [GZ.7/colmez-vertical-split-zero](#colmez-vertical-split-zero), [GZ.7/colmez-modified-projection](#colmez-modified-projection), [GZ.6/colmez-rev-hodge-class-terms-vanish-and](#colmez-rev-hodge-class-terms-vanish-and).

32. **HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation**: Čerednik–Drinfeld formal/integral upper-half-plane uniformization at division places, components GL₂(Fv)/Fv×GL₂(Ov), their local intersections and CM fixed sections; conventions for nearby B(v).

   Consumers: [GZ.7/colmez-arch-green](#colmez-arch-green), [GZ.7/colmez-finite-multiplicity](#colmez-finite-multiplicity), [GZ.7/colmez-superspecial-m](#colmez-superspecial-m), [GZ.7/colmez-vertical-pseudo](#colmez-vertical-pseudo), [GZ.7/colmez-small-level-diagonal](#colmez-small-level-diagonal).

33. **AutomorphicFormsOnReductiveGroups:AF.1**: Automorphic density principle in the GL₂ central-character category used in the pseudo-theta Vandermonde argument, with the corrected fixed complement characters along rational unipotent translates.

   Consumers: [GZ.6/colmez-pseudo-automorphic](#colmez-pseudo-automorphic).

34. **HeightsRationalPointsAndObstructions:RP.0**: Canonical Jacobian height for 2Θ, positivity modulo torsion and complex Hermitian extension; specialize the general ample canonical-height machine, without redefining it in GZ.

   Consumers: [GZ.6/classical-height-series-cuspidality](#classical-height-series-cuspidality), [GZ.0/classical-relative-field-heights](#classical-relative-field-heights), [GZ.2/classical-complex-height-symbol](#classical-complex-height-symbol), [GZ.7/classical-tangent-symbol](#classical-tangent-symbol), [GZ.7/classical-tangent-product-formula](#classical-tangent-product-formula), [GZ.2/classical-local-intersection-height](#classical-local-intersection-height).

35. **HeegnerPointEulerSystems:HE.0**: Ideal-class CM points and Hecke correspondences on X₀(N), field-of-definition and Artin reciprocity with the source ideal-inverse convention.

   Consumers: [GZ.6/classical-disjointness](#classical-disjointness), [GZ.0/classical-cm-action-conventions](#classical-cm-action-conventions), [GZ.7/classical-cm-kernel-invariants](#classical-cm-kernel-invariants), [GZ.7/classical-cm-genus-orbits](#classical-cm-genus-orbits), [GZ.2/classical-archimedean-height-sum](#classical-archimedean-height-sum), [GZ.7/classical-cm-eisenstein-sum](#classical-cm-eisenstein-sum), [GZ.7/classical-finite-intersection-height](#classical-finite-intersection-height), [GZ.5/classical-definite-period-announcement](#classical-definite-period-announcement).

36. **RankZeroOneBSD:BSD.5**: The BSD rank-one prediction over K and its exact index, regulator, torsion and Tamagawa convention; this is a consumer conjecture, not an arithmetic-height theorem proved here.

   Consumers: [GZ.0/bsd-height-pairing](#bsd-height-pairing).

37. **AbelianSchemesAndArithmeticModuli:A6**: Hom/End of chosen cyclic N-isogeny diagrams over complete local and Artinian bases; degree equality, finite positive-degree fibres, free sign action and faithful stabilizer action. Do not assert choice-independent Hom for arbitrary coarse Artinian points with extra automorphisms.

   Consumers: [GZ.7/classical-half-hom-count](#classical-half-hom-count), [GZ.7/classical-new-hom-set](#classical-new-hom-set), [GZ.7/classical-prime-to-p-hom-count](#classical-prime-to-p-hom-count), [GZ.7/classical-hom-quaternion-realization](#classical-hom-quaternion-realization).

38. **HeegnerPointEulerSystems:HE.2**: Quasicanonical CM lifting/isogeny intersection calculation over W, including the prime-to-p degree decomposition and the valuation normalization used in the classical Hom sum.

   Consumers: [GZ.7/classical-degree-one-intersection](#classical-degree-one-intersection), [GZ.7/classical-supersingular-eichler-order](#classical-supersingular-eichler-order), [GZ.7/classical-level-reduction-component](#classical-level-reduction-component), [GZ.7/classical-hom-intersection-count](#classical-hom-intersection-count), [GZ.7/classical-half-hom-count](#classical-half-hom-count), [GZ.7/classical-isomorphism-intersection-count](#classical-isomorphism-intersection-count), [GZ.7/classical-new-automorphism-length](#classical-new-automorphism-length).

39. **ComplexMultiplicationAndExplicitReciprocity:CM.5**: Exact negative-norm coset/congruence lifting count in the quaternionic CM deformation order, including ramified and dyadic ranges.

   Consumers: [GZ.7/classical-inert-order-model](#classical-inert-order-model), [GZ.7/classical-new-hom-set](#classical-new-hom-set), [GZ.7/classical-split-vanishing](#classical-split-vanishing), [GZ.7/classical-endomorphism-congruence-order](#classical-endomorphism-congruence-order), [GZ.7/classical-inert-disjoint-intersection](#classical-inert-disjoint-intersection), [GZ.7/classical-ramified-disjoint-intersection](#classical-ramified-disjoint-intersection), [GZ.7/classical-new-automorphism-length](#classical-new-automorphism-length), [GZ.7/classical-j-tangent-values](#classical-j-tangent-values), [GZ.7/classical-ramified-order-model](#classical-ramified-order-model).

40. **ComplexMultiplicationAndExplicitReciprocity:CM.5**: Canonical ordinary CM lifting and fullness of reduction on CM Hom/End; prove the classical new-Hom vanishing at split places.

   Consumers: [GZ.7/classical-inert-order-model](#classical-inert-order-model), [GZ.7/classical-new-hom-set](#classical-new-hom-set), [GZ.7/classical-split-vanishing](#classical-split-vanishing), [GZ.7/classical-endomorphism-congruence-order](#classical-endomorphism-congruence-order), [GZ.7/classical-inert-disjoint-intersection](#classical-inert-disjoint-intersection), [GZ.7/classical-ramified-disjoint-intersection](#classical-ramified-disjoint-intersection), [GZ.7/classical-new-automorphism-length](#classical-new-automorphism-length), [GZ.7/classical-j-tangent-values](#classical-j-tangent-values), [GZ.7/classical-ramified-order-model](#classical-ramified-order-model).

41. **MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances**: Quaternionic norm-positive/anti-linear decomposition compatible with the embedded K and reduced norm, including norm/degree ratio for connecting Hom ideals.

   Consumers: [GZ.7/classical-hyperbolic-norm-parameter](#classical-hyperbolic-norm-parameter), [GZ.7/classical-inert-order-model](#classical-inert-order-model), [GZ.7/classical-inert-norm-ideal-map](#classical-inert-norm-ideal-map), [GZ.7/classical-ramified-order-model](#classical-ramified-order-model).

42. **ComplexMultiplicationAndExplicitReciprocity:CM.5**: Gross canonical-lift endomorphism filtration over W/π^n, in the source uniformizer convention; distinguish inert and ramified lengths and state the dyadic exceptions.

   Consumers: [GZ.7/classical-inert-order-model](#classical-inert-order-model), [GZ.7/classical-new-hom-set](#classical-new-hom-set), [GZ.7/classical-split-vanishing](#classical-split-vanishing), [GZ.7/classical-endomorphism-congruence-order](#classical-endomorphism-congruence-order), [GZ.7/classical-inert-disjoint-intersection](#classical-inert-disjoint-intersection), [GZ.7/classical-ramified-disjoint-intersection](#classical-ramified-disjoint-intersection), [GZ.7/classical-new-automorphism-length](#classical-new-automorphism-length), [GZ.7/classical-j-tangent-values](#classical-j-tangent-values), [GZ.7/classical-ramified-order-model](#classical-ramified-order-model).

43. **GL2AutomorphicRepresentationsAndTransfer:R16.1**: Connecting ideals between optimal CM Eichler orders and their orientation identity; provide both 𝔟R=S𝔟 and R𝔟=𝔟S conventions and the induced anti-linear coefficient ratio.

   Consumers: [GZ.7/classical-supersingular-eichler-order](#classical-supersingular-eichler-order), [GZ.7/classical-inert-hom-lattice](#classical-inert-hom-lattice).

44. **AutomorphicFormsOnReductiveGroups:AF.1**: Scalar modular forms of weight 2k and polynomial growth at every cusp, trace of levels and Petersson integrability against cusp forms; import their actual classical realization.

   Consumers: [GZ.6/classical-rankin-kernel](#classical-rankin-kernel).

45. **AnalyticNumberTheory:AN.4**: Genus characters of the ideal class group, ordered fundamental discriminant factorizations, quadratic character evaluations and theta transformation under ramified ideals.

   Consumers: [GZ.6/classical-partial-rankin-series](#classical-partial-rankin-series), [GZ.7/classical-cm-genus-orbits](#classical-cm-genus-orbits), [GZ.7/classical-pair-count](#classical-pair-count), [GZ.7/classical-ramified-congruence-count](#classical-ramified-congruence-count), [GZ.7/classical-genus-pair-count](#classical-genus-pair-count), [GZ.7/classical-genus-character-filter](#classical-genus-character-filter), [GZ.7/classical-inert-height-sum](#classical-inert-height-sum), [GZ.7/classical-inert-unit-count](#classical-inert-unit-count), [GZ.7/classical-ramified-height-sum](#classical-ramified-height-sum), [GZ.0/classical-genus-character-factorization](#classical-genus-character-factorization), [GZ.6/classical-ramified-theta-reindexing](#classical-ramified-theta-reindexing), [GZ.6/classical-genus-sign-function](#classical-genus-sign-function), [GZ.6/classical-genus-sign-reversal](#classical-genus-sign-reversal), [GZ.6/classical-signed-divisor-sums](#classical-signed-divisor-sums), [GZ.6/classical-different-reindexing](#classical-different-reindexing), [GZ.6/classical-genus-sigma-identity](#classical-genus-sigma-identity), [GZ.6/classical-logarithmic-prime-decomposition](#classical-logarithmic-prime-decomposition), [GZ.5/classical-genus-sum-filter](#classical-genus-sum-filter).

46. **AnalyticNumberTheory:AN.4**: The norm representation and genus criterion with Nn+l≡0 mod D and l a norm from the specified class. This hypothesis is necessary for the divisor complement identities.

   Consumers: [GZ.6/classical-partial-rankin-series](#classical-partial-rankin-series), [GZ.7/classical-cm-genus-orbits](#classical-cm-genus-orbits), [GZ.7/classical-pair-count](#classical-pair-count), [GZ.7/classical-ramified-congruence-count](#classical-ramified-congruence-count), [GZ.7/classical-genus-pair-count](#classical-genus-pair-count), [GZ.7/classical-genus-character-filter](#classical-genus-character-filter), [GZ.7/classical-inert-height-sum](#classical-inert-height-sum), [GZ.7/classical-inert-unit-count](#classical-inert-unit-count), [GZ.7/classical-ramified-height-sum](#classical-ramified-height-sum), [GZ.0/classical-genus-character-factorization](#classical-genus-character-factorization), [GZ.6/classical-ramified-theta-reindexing](#classical-ramified-theta-reindexing), [GZ.6/classical-genus-sign-function](#classical-genus-sign-function), [GZ.6/classical-genus-sign-reversal](#classical-genus-sign-reversal), [GZ.6/classical-signed-divisor-sums](#classical-signed-divisor-sums), [GZ.6/classical-different-reindexing](#classical-different-reindexing), [GZ.6/classical-genus-sigma-identity](#classical-genus-sigma-identity), [GZ.6/classical-logarithmic-prime-decomposition](#classical-logarithmic-prime-decomposition), [GZ.5/classical-genus-sum-filter](#classical-genus-sum-filter).

47. **AutomorphicSpectralTheory:AS.4**: Regularized Petersson holomorphic projection in weight two with logarithmic cusp growth, Fourier Mellin finite parts, continuation bounds and orthogonality of boundary Eisenstein families.

   Consumers: [GZ.7/classical-resolvent-kernel](#classical-resolvent-kernel), [GZ.6/classical-holomorphic-projection](#classical-holomorphic-projection).

48. **HeegnerPointEulerSystems:HE.1**: The field-of-definition and complex conjugation of classical Heegner points and their modular images, in the source Artin/Fricke convention.

   Consumers: [GZ.0/classical-twist-real-period](#classical-twist-real-period).

49. **AutomorphicLFunctionsAndLocalFactors:AL.3**: Identify the arithmetic ideal-class character sum with the GL₂/K base-change Rankin L-function, including every p|N Euler factor and the arithmetic weight-2k shift s↦s−k+1/2. Supply its analytic continuation and exact completed gamma factors.

   Consumers: [GZ.0/classical-rankin-normalization](#classical-rankin-normalization), [GZ.6/classical-partial-rankin-series](#classical-partial-rankin-series), [GZ.6/classical-absolute-convergence](#classical-absolute-convergence).

50. **AnalyticNumberTheory:AN.4**: Integral ideal counts by class/norm, finite Fourier inversion, ordered discriminant genus characters, norm/genus congruence criterion and the corrected prime-log decomposition. The genus/sign inputs are general arithmetic; GZ owns only the coefficient/kernel formulas consuming them.

   Consumers: [GZ.6/classical-partial-rankin-series](#classical-partial-rankin-series), [GZ.6/classical-genus-sign-function](#classical-genus-sign-function), [GZ.6/classical-genus-sigma-identity](#classical-genus-sigma-identity), [GZ.6/classical-logarithmic-prime-decomposition](#classical-logarithmic-prime-decomposition), [GZ.7/classical-genus-pair-count](#classical-genus-pair-count), [GZ.7/classical-inert-unit-count](#classical-inert-unit-count).

51. **AutomorphicSpectralTheory:AS.2**: Scalar level-N weight-one-character Eisenstein families and their zero/nonzero Fourier coefficients; hyperbolic Legendre resolvent with eigenvalue s(s−1), residue −12/[SL₂(ℤ):Γ₀(N)], cusp continuation and CM evaluation. Keep PSL₂ quotient, cusp widths, phases and squared-log normalization explicit.

   Consumers: [GZ.7/classical-resolvent-kernel](#classical-resolvent-kernel), [GZ.7/classical-resolvent-residue](#classical-resolvent-residue), [GZ.7/classical-cusp-expansion](#classical-cusp-expansion), [GZ.7/classical-cm-eisenstein-sum](#classical-cm-eisenstein-sum), [GZ.6/classical-eisenstein-zero-coefficient](#classical-eisenstein-zero-coefficient), [GZ.6/classical-eisenstein-nonzero-coefficient](#classical-eisenstein-nonzero-coefficient).

52. **MetaplecticAutomorphicForms:MP.7**: Classical ideal-class theta series of weight one and character ε, constant r_A(0)=1/w, their ramified cusp transforms and the half-integral-weight/GL₂ theta correspondence used by the arithmetic Rankin kernel.

   Consumers: [GZ.6/classical-partial-rankin-series](#classical-partial-rankin-series), [GZ.6/classical-rankin-unfolding](#classical-rankin-unfolding), [GZ.6/classical-rankin-kernel](#classical-rankin-kernel), [GZ.6/classical-ramified-theta-reindexing](#classical-ramified-theta-reindexing), [GZ.6/classical-different-reindexing](#classical-different-reindexing).

53. **ModularCurvesPartII:R14.5**: Hecke algebra/Fourier coefficient perfect pairing for weight-two cuspidal forms and the Jacobian, trace adjunction, newform orthogonal projection and prime-to-level detection on the newform subspace.

   Consumers: [GZ.6/classical-height-series-cuspidality](#classical-height-series-cuspidality), [GZ.6/classical-trace-adjunction](#classical-trace-adjunction), [GZ.6/classical-prime-to-level-detection](#classical-prime-to-level-detection), [GZ.6/classical-boundary-eisenstein-orthogonality](#classical-boundary-eisenstein-orthogonality).

54. **ModularCurvesPartII:R14.2**: Finite-level compactified X₀(N), both marked cusps and their widths, cyclic-isogeny diagrams, integral Deligne–Rapoport level model and stabilizer-aware orbifold differential/discriminant tensor.

   Consumers: [GZ.7/classical-height-green-characterization](#classical-height-green-characterization), [GZ.7/classical-eta-tangent](#classical-eta-tangent), [GZ.7/classical-level-reduction-component](#classical-level-reduction-component), [GZ.6/classical-trace-coset-classification](#classical-trace-coset-classification).

55. **HeightsRationalPointsAndObstructions:RP.0**: Local Néron symbols for degree-zero divisors, with principal-divisor law, tangent extension at common support and its parameter-change law; regular-model comparison with −intersection·log(q_v); relative field-height comparison.

   Consumers: [GZ.7/classical-tangent-symbol](#classical-tangent-symbol), [GZ.7/classical-tangent-product-formula](#classical-tangent-product-formula), [GZ.2/classical-local-intersection-height](#classical-local-intersection-height), [GZ.0/classical-relative-field-heights](#classical-relative-field-heights).

56. **AutomorphicLFunctionsAndLocalFactors:AL.0**: Generic special-function realization of the terminating polynomial p_(k−1)(t)=Σ_(r=0)^(k−1) binom(k−1,r)(−t)^r/r! and the decaying q_(k−1)(t)=∫₁∞(x−1)^(k−1)x^(−k)e^(−xt)dx, with gamma/Mellin/Legendre continuation identities and permitted differentiation. Confirm the polynomial source normalization before choosing a pinned polynomial API.

   Consumers: [GZ.6/classical-integral-kernel-values](#classical-integral-kernel-values), [GZ.6/classical-signed-divisor-sums](#classical-signed-divisor-sums), [GZ.6/classical-rankin-mellin-regularization](#classical-rankin-mellin-regularization).

57. **MetaplecticAutomorphicForms:MP.7**: Baruch–Mao 2010 Theorems1.2,1.4, the Kohnen-plus Maass eigenline correspondence including its Hecke operator at 2, and the local real/2-adic Whittaker-normalization comparison. DIT’s unit half-weight vector uses coefficient b(d) and factor 12π; the corresponding GL₂ parameter is r and the half-weight parameter r/2.

   Consumers: [GZ.5/half-weight-waldspurger-value](#half-weight-waldspurger-value).

58. **AutomorphicLFunctionsAndLocalFactors:AL.3**: Finite Maass twist L(s,φ⊗χ_d), its ramified Euler factors and both signed real gamma factors; distinguish its finite Dirichlet series from the completed automorphic L-function.

   Consumers: [GZ.5/half-weight-waldspurger-value](#half-weight-waldspurger-value).

59. **AutomorphicSpectralTheory:AS.1**: Even level-one Hecke–Maass cusp forms, K_(ir) Fourier expansion, Petersson norm and its normalized a(1)=1 eigenline.

   Consumers: [GZ.5/half-weight-waldspurger-value](#half-weight-waldspurger-value).

60. **tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs**: Dual graph of a semistable fibre, vertex component genera and residue-field/Galois action; incidence valences and bridge/loop convention compatible with the metrized graph.

   Consumers: [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing), [GZ.2/graph-admissible-measure](#graph-admissible-measure).

61. **tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces**: Finite arithmetic-surface intersection of horizontal and vertical Cartier divisors, projection formula, vertical intersection matrix with kernel the total fibre; admissible vertical correction modulo that fibre.

   Consumers: [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing), [GZ.2/admissible-arithmetic-extension](#admissible-arithmetic-extension), [GZ.7/colmez-modified-projection](#colmez-modified-projection).

62. **tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models**: Regular/minimal proper curve models over complete and number-field DVRs, finite-level model changes, blow-up invariance of the corrected degree-zero pairing.

   Consumers: [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing).

63. **tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction**: Semistable reduction and base change of component/intersection data, including non-split Galois descent and edge-length change by ramification.

   Consumers: [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing), [GZ.2/admissible-arithmetic-extension](#admissible-arithmetic-extension), [GZ.2/graph-admissible-measure](#graph-admissible-measure).

64. **tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property**: Jacobian Pic⁰ and Abel–Jacobi map over the actual ground field, descent for rational degree-one divisor classes, normalized Hodge class ξ and compatibility with Hecke correspondences.

   Consumers: [GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions](#hodge-index-theorem-and-admissible-arithmetic-extensions), [GZ.3/rational-xi-realization](#rational-xi-realization), [GZ.6/cm-degree-zero-class](#cm-degree-zero-class).

65. **SmoothRepresentationsOfLocalGroups:SR.2**: χ-equivariant continuous/smooth toric Hom functor on an admissible local representation and contragredient, with invariants and scalar extension; real/complex topological conditions are separate.

   Consumers: [GZ.4/toric-hom-space](#toric-hom-space).

66. **GL2AutomorphicRepresentationsAndTransfer:R16.1**: Local GL₂/quaternionic Jacquet–Langlands representations and toric restriction, including real discrete series, coefficient realization and connecting Eichler ideals.

   Consumers: [GZ.4/toric-hom-space](#toric-hom-space), [GZ.7/classical-supersingular-eichler-order](#classical-supersingular-eichler-order), [GZ.7/classical-inert-hom-lattice](#classical-inert-hom-lattice).

67. **EndoscopicTransferAndUnitaryTraceComparison:ET.6**: Local Tunnell–Saito distinction theorem in both GL₂ and division forms, with epsilon factor ψ and the corrected base-change root-number sign.

   Consumers: [GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional](#saito-tunnell-dichotomy-and-the-local-toric-functional).

68. **HeightsRationalPointsAndObstructions:RP.2**: Quadratic norm-congruence representation densities with the local different, Haar shell measures, wild norm conductor and finite-support estimates used in the local Whittaker derivative.

   Consumers: [GZ.7/colmez-norm-shells](#colmez-norm-shells).

## Proof and carrier gaps

### Full YZZ proof-source acquisition

The public author erratum and reviewed decomposition supply exact introductory and Chapter7 locators. A full public book/preprint proof was not acquired: Chapter3 realization/volume comparison, Chapter4 Picard modularity and trace scalar, Chapter5 nonzero degenerate test data and split S¹/S² condition, and Chapters6–8 bad-place approximants need primary proof inspection. The corresponding targets are specified, not certified closed.

Affected declarations: [GZ.1/neron-tate-height-and-the-poincare-pairing](#neron-tate-height-and-the-poincare-pairing), [GZ.3/strict-gl2-realization](#strict-gl2-realization), [GZ.3/petersson-composition-comparison](#petersson-composition-comparison), [GZ.6/picard-generating-series](#picard-generating-series), [GZ.6/arithmetic-theta-lifting](#arithmetic-theta-lifting), [GZ.7/degenerate-schwartz-classes](#degenerate-schwartz-classes), [GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation](#degenerate-schwartz-functions-local-decomposition-and-approximation).

### Arithmetic carriers absent from the pinned baseline

General algebraic line bundles with point-height machine, dual/Poincaré biextension, arithmetic Green divisors and the actual quaternionic/toric automorphic carriers are not all available as pinned Lean interfaces. Suggested signatures omit conditions that cannot yet be stated; the mathematical packet retains their full hypotheses. Supplier requests must be realized before those arithmetic signatures and their tests can elaborate.

Affected declarations: [GZ.1/neron-tate-height-and-the-poincare-pairing](#neron-tate-height-and-the-poincare-pairing), [GZ.1/coefficient-valued-height](#coefficient-valued-height), [GZ.1/character-height-pairing](#character-height-pairing), [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing), [GZ.2/admissible-arithmetic-extension](#admissible-arithmetic-extension), [GZ.3/normalised-hodge-class-and-xi-parametrised-realisation](#normalised-hodge-class-and-xi-parametrised-realisation), [GZ.3/rational-xi-realization](#rational-xi-realization), [GZ.3/composition-pairing](#composition-pairing), [GZ.3/manin-constant](#manin-constant), [GZ.4/toric-hom-space](#toric-hom-space), [GZ.4/normalized-toric-integral](#normalized-toric-integral), [GZ.4/admissible-toric-order](#admissible-toric-order), [GZ.6/special-correspondence-cycle](#special-correspondence-cycle), [GZ.6/cm-degree-zero-class](#cm-degree-zero-class), [GZ.6/picard-generating-series](#picard-generating-series), [GZ.6/arithmetic-height-kernel](#arithmetic-height-kernel), [GZ.7/degenerate-schwartz-classes](#degenerate-schwartz-classes).

### Genus-one resistance-measure proof

Yuan’s author manuscript Proposition A.5 proves c₁(ωa)=(2g−2)i*μ; comparing this with (2g−2)μa gives the stated formula only for g>1. A separate proof from an admissible degree-one bundle or the good/Tate genus-one models is required. The formula is planned for g>0, with this missing argument explicit.

Affected declarations: [GZ.2/explicit-skeleton-measure](#explicit-skeleton-measure).

### Elliptic and level tensor comparison refinement

The primary Conrad Theorem9.2 stabilizer-norm proof is read and planned as cmTensor_stabilizer_height. The blanket historical omission is replaced by this valid tensor identity. Specializing every exceptional j and v|N term to the exact eta/coarse-coordinate formula remains a refinement: retain ord(C_x u_x^k) and ord_(v,x)(Δ), rather than assert the automorphism sum equals every self-intersection.

Affected declarations: [GZ.7/classical-new-automorphism-length](#classical-new-automorphism-length), [GZ.7/classical-j-tangent-values](#classical-j-tangent-values), [GZ.7/classical-new-hom-intersection](#classical-new-hom-intersection).

### Historical definite central-value announcement

Gross–Zagier V §3 only announces proportionality. Nodes use the already specified normalized coherent Waldspurger identity instead; matching its exact scalar and rational eigenspace with the historical b_m,A vector needs the definite theta-coefficient comparison from the toric/theta suppliers.

Affected declarations: [GZ.5/classical-definite-period-announcement](#classical-definite-period-announcement), [GZ.5/classical-definite-square-class](#classical-definite-square-class).

### Half-weight Waldspurger proof normalization

DIT (5.17) is read in the version of record. Its cited Baruch–Mao 2010 local proof and complete 2-adic plus-space dictionary have not been acquired in this run; S6 of the reviewed extraction remains a precise source-proof gate. The supplier request must establish the 12π comparison, both signs of d and unit half-weight norm; the explicit target is planned, not certified by quotation alone.

Affected declarations: [GZ.5/half-weight-waldspurger-value](#half-weight-waldspurger-value).

### Equivariance of the Colmez vertical correction

Published Yuan–Zhang §8.3 Lemma8.9 uses invariance of a lifted vertical correction that does not follow from fixed CM support alone (inherited source issue PAPER-YUAN-ZHANG-18/E17). Supply an equivariant/invariant vertical lift or an intersection descent proof and retain the t₂ action. The pseudo-kernel node’s corrected target is conditional on this geometric input.

Affected declarations: [GZ.7/colmez-vertical-pseudo](#colmez-vertical-pseudo).

## Structure and upstream notes

GZ.1’s general line-bundle heights and Mordell–Weil overlap RP.0/RP.1; BSD.1 currently routes general Mordell–Weil through GZ.1. GZ.1 keeps the YZZ Poincaré/full-polarization convention, coefficient-valued χ-pairings and elliptic comparison. Import general canonical/local heights and Northcott from RP.0, general Mordell–Weil from RP.1, and reroute BSD.1’s general Mordell–Weil input to RP.1. Northcott alone suffices for the torsion zero-locus argument.

The proposed GZ.2 regular-model and finite intersection infrastructure duplicates upstream StableReduction. GZ.2 imports Layers 1, 4, 5 and 7 for dual graphs, regular/minimal models, vertical intersection matrices and their fibre kernel, projection formulas and semistable base change. It keeps admissible archimedean metrics, arithmetic graph measures, global admissible gluing and Faltings–Hriljac.

The Layer 6 text around line 1179 describes the full x-height limit, while CanonicalHeight at f790474 uses one half of that limit and the associated halved polar form. The code fixes this packet’s convention: the YZZ full polarization is twice neronTatePairing, with regulator factor 2^r. Pass this text/code discrepancy to the upstream maintainer; this job does not edit the upstream roadmap.

## Source versions and corrections

Sources were read on 7 October 2026. A public author/preprint copy is not treated as the version of record. The full YZZ book and the 2026 published Yuan paper were not acquired. The extraction findings below retain their origin and prior review provenance; this worker does not assert a new independent review verdict.

| Version read | Kind | SHA-256 |
|---|---|---|
| [https://arxiv.org/abs/1509.08748v2](https://arxiv.org/abs/1509.08748v2) | preprint | `10576e85c77e8e7c590671840586bc4680e638d03daf7802e230a4897ac3384c` |
| [https://arxiv.org/abs/1408.1733v2](https://arxiv.org/abs/1408.1733v2) | preprint | `8d908543404abfbd9c1708ad9af696c4fb71595701bd67cb5bff11b3a8d6ac43` |
| [Conrad, Gross–Zagier revisited, MSRI Publications 49 (2004)](https://library.slmath.org/books/Book49/files/05conrad.pdf) | published | `31396cc7f513d6237155b6afa923c6ef76d2f37101db598d58bea25f0aa677ca` |
| [Explicit Gross–Zagier and Waldspurger formulae; arXiv:1408.1733v2](https://arxiv.org/pdf/1408.1733v2) | preprint | `8d908543404abfbd9c1708ad9af696c4fb71595701bd67cb5bff11b3a8d6ac43` |
| [Heegner points and derivatives of L-series; Invent. Math. 84 (1986), 225–320](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) | published | `a9a52cb8662e03f19ace81dcfbf24bf873bf9c46ba89a8c890727b9541abdbf5` |
| [Gross–Zagier formula for GL(2); CRM lecture notes](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf) | preprint | `1f46be497752b0795dbef8b06b423ef7bea5203096d3480c6da2642c333e73f0` |
| [Erratum to The Gross–Zagier Formula on Shimura Curves; 28 June 2026](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf) | author copy | `e4c4eaeb197ceaf18b02955d90a56e52e4776eca1f31c88c16074adaf19d8d1e` |
| [Global divisibility of Heegner points and Tamagawa numbers; Compositio Math. 144 (2008)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/475417137355BE27B3888862CADB0286/S0010437X08003497a.pdf/global_divisibility_of_heegner_points_and_tamagawa_numbers.pdf) | published | `f887790bbbf0a1831685f697cfe20b403ca515be4c4176705efa24e3077307ed` |
| [The Manin constant and the modular degree; arXiv:1911.09446, 3 November 2022](https://arxiv.org/pdf/1911.09446) | preprint | `4d76a0daf4ffa103a4a96f6fafe6de22c44e194cd2c47489c75be8967f1d5448` |
| [Geometric invariants for real quadratic fields; Ann. Math. 184 (2016), 949–990](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf) | published | `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61` |
| [On the averaged Colmez conjecture; Ann. Math. 187 (2018), 533–638](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | published | `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507` |
| [The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula; arXiv:1207.4709v3](https://arxiv.org/pdf/1207.4709v3) | preprint | `cde6b7ad22b974d4159f8cedd1e14a00bf4b05ec977ab750b54fdceb067adac5` |
| [Arithmetic bigness and a uniform Bogomolov-type result; author manuscript 21 August 2024; Ann. Math. 203 (2026), 15–119 has not been acquired](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf) | preprint | `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e` |
| [Conrad, Gross–Zagier revisited, author final copy; §§8–9](https://math.stanford.edu/~conrad/papers/gzfinal.pdf) | author copy | `7eac62b943ebd035de37f40df6054e1300ba4a0f02356cca919635eef994fdbe` |
| [Erratum to On the averaged Colmez conjecture; 11 January 2022 author version; published Annals 198 (2023) text not acquired](https://web.math.princeton.edu/~shouwu/publications/Erratum.pdf) | author copy | `6e89ac290a087287ae314fb52ef82cf95125b6c224084a9a094e2ff774ce58f2` |
| [Erratum to On the averaged Colmez conjecture; 18 December 2022 author version; published Annals 198 (2023) text not acquired](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf) | author copy | `18b46acd0f6be352d4bc5b4d7797650be3e228712e13de94bbb45ec25b576c91` |

The companion packet records each source discrepancy with its exact quote, correction, reason, correction search and version provenance. This index makes the normalization-sensitive findings visible without repeating the published passages.

| Finding | Origin | Kind | Correction |
|---|---|---|---|
| `GrossZagierAndArithmeticHeights/E1` | `this packet / retained checkpoint` | misprint | u_x is half that cardinality (u_x = 1 unless K = Q(√−1), Q(√−3), where it is 2, 3), as p. 119 uses it and as in Gross–Zagier's u = #O_K^×/2. |
| `GrossZagierAndArithmeticHeights/E2` | `PAPER-GROSS-ZAGIER-86/E1` | error | m/n ↦ (n/d)·m (mod f_d) (equivalently m⁻¹(n/d)⁻¹); the printed map is Γ₀(N)-invariant only when (ℤ/f_dℤ)^× has exponent ≤ 2, i.e. f_d \| 24. |
| `GrossZagierAndArithmeticHeights/E3` | `PAPER-GROSS-ZAGIER-86/E2` | error | 𝒜 is replaced by 𝒜[𝔡]⁻¹ (= 𝒜[𝔡̄]); (i) w_N : (𝒜, 𝔫) → (𝒜[𝔫]⁻¹, 𝔫̄) = (𝒜[𝔫̄], 𝔫̄). This is the rule the paper itself uses on p. 243: τ_{𝒜,𝔫} ↦ τ_{𝒜[𝔡]⁻¹, 𝔫𝔡⁻¹𝔡̄}. |
| `GrossZagierAndArithmeticHeights/E4` | `PAPER-GROSS-ZAGIER-86/E3` | misprint | With √D = i√\|D\| (the branch §3 uses: "τ_i∈A_i⁻¹𝔞̄_i=𝔞_i⁻¹" in (3.7) and "cτ₁+d=(β−α)/(τ₂−τ̄₂)=(A₂/√D)(β−α)" on p. 245) the root τ ∈ 𝔥 represents (ℂ/𝔞̄ → ℂ/𝔞̄𝔫̄⁻¹) = c(x), i.e. the pair (𝒜⁻¹, 𝔫̄); x itself is −τ̄ = (B+√D)/(2A). Consistent fixes: read (β+√D)/2, (B+√D)/2 as (−β+√D)/2, (−B+√D)/2 in (1.3), (1.5) (then (3.7) reads τ_i ∈ 𝔞̄_i⁻¹), or keep (1.3)–(1.5) and read τ_{𝒜,𝔫} in §3 as the Heegner point (𝒜⁻¹, 𝔫̄), on which σ_𝒜 acts by 𝒜₁ ↦ 𝒜₁𝒜. |
| `GrossZagierAndArithmeticHeights/E5` | `PAPER-GROSS-ZAGIER-86/E4` | misprint | n = (1/N)[c²C₁C₂ + ad(D−B₁B₂)/2 − bc(D+B₁B₂)/2 + a²C₁A₂ + d²A₁C₂ − cdB₁C₂ + acC₁B₂ + b²A₁A₂ + bdA₁B₂ − baB₁A₂] (i.e. the printed expression minus bcB₁B₂/N). |
| `GrossZagierAndArithmeticHeights/E6` | `PAPER-GROSS-ZAGIER-86/E5` | error | Add the hypothesis that 𝔞₁, 𝔞₂ are prime to D (possible in every class, keeping 𝔫 \| 𝔞_i), or replace (3.10) by the exact conditions (A₂/√D)(β − α) ∈ 𝔫𝔞₁⁻¹ and (A₂/√D)(τ̄₂β − τ₂α) ∈ 𝔞₁⁻¹. |
| `GrossZagierAndArithmeticHeights/E7` | `PAPER-GROSS-ZAGIER-86/E6` | misprint | "−4πE_N(w_N z, s) and −4πE_N(z′, s)", as in (2.15); the unsubscripted E is the SL₂(ℤ) series E₁ of (2.16). |
| `GrossZagierAndArithmeticHeights/E8` | `PAPER-GROSS-ZAGIER-86/E7` | misprint | Σ_{v\|∞}⟨c, T_m d^σ⟩_v (the quantity named in the first line of §3 and computed in §4, p. 248). |
| `GrossZagierAndArithmeticHeights/E9` | `PAPER-GROSS-ZAGIER-86/E8` | misprint | ρ^m_{𝒜₁,𝒜₂,𝔫}(n) (the superscript m of (3.11)–(3.13) is dropped; the right side depends on m). |
| `GrossZagierAndArithmeticHeights/E10` | `PAPER-GROSS-ZAGIER-86/E9` | misprint | L′/L ≃ ℤ/Nℤ (as on p. 234: "Then L′/L≃ℤ/Nℤ"). |
| `GrossZagierAndArithmeticHeights/E11` | `PAPER-GROSS-ZAGIER-86/E10` | misprint | −σ₁(m)(λ_N − 2κ_N), i.e. −σ₁(m)λ_N + 2σ₁(m)κ_N |
| `GrossZagierAndArithmeticHeights/E12` | `PAPER-GROSS-ZAGIER-86/E11` | misprint | … + o(1)   (t ↘ 1) |
| `GrossZagierAndArithmeticHeights/E13` | `PAPER-GROSS-ZAGIER-86/E12` | misprint | ω = (1/u)(g^{1/u} + higher degree terms) dg/g, i.e. ω = d(g^{1/u})·(1 + …); equivalently, keep the printed display with g replaced by u^u·g. |
| `GrossZagierAndArithmeticHeights/E14` | `PAPER-GROSS-ZAGIER-86/E13` | error | 'A = ker φ is isomorphic to μ_d × dℤ/Nℤ' holds only when gcd(d, N/d) = 1. In general, at the cuspidal points of Cusp(d) the kernel A is a cyclic group scheme of order N that is an extension of dℤ/Nℤ ≅ ℤ/(N/d)ℤ by μ_d, and it is non-split when f = gcd(d, N/d) > 1 (on a Néron polygon, e.g. ⟨(ζ_N, 1)⟩ ⊂ G_m × ℤ/(N/d)ℤ). The coarse moduli scheme X of (1.1)–(1.2) is still the Deligne–Rapoport and Katz–Mazur model of X₀(N) (Česnavičius 2017, §1.1), so the model itself needs no change; but for N not squarefree the stack 𝓜_{Γ₀(N)} of (1.1)–(1.2) differs from the Deligne–Rapoport stack at these cusps, and Česnavičius' refined Γ₀(N)-structures give the correct moduli description there. |
| `GrossZagierAndArithmeticHeights/E15` | `PAPER-GROSS-ZAGIER-86/E14` | error | True for S = W (a complete DVR of characteristic 0 with algebraically closed residue field: two W-diagrams inducing the same W-point are isomorphic, Conrad Theorem 2.6) and hence for the reductions to W/πⁿ of fixed W-diagrams, which is the only way §§4–9 use it; false for general complete local S (e.g. artinian S) at points with Aut_k ≠ ⟨±1⟩, where Hom_S must be defined for chosen diagrams. |
| `GrossZagierAndArithmeticHeights/E16` | `PAPER-GROSS-ZAGIER-86/E15` | misprint | Σ_{n≥1} h_n(z^{σ𝔭}, x)_{deg 1} + t h_1(z^{σ𝔭}, x)_{deg 1} |
| `GrossZagierAndArithmeticHeights/E17` | `PAPER-GROSS-ZAGIER-86/E16` | error | (x · x) = ord_v(α), where ∂/∂t = α·(a basis of T_x X); equivalently α^{-1}∂/∂t is a basis of T_x X, or αω_x is a basis of the cotangent line when ω_x is the covector dual to ∂/∂t. This is Conrad's α_x. |
| `GrossZagierAndArithmeticHeights/E18` | `PAPER-GROSS-ZAGIER-86/E17` | misprint | α ≡ j(x)^{2/3}(j(x) − 1728)^{1/2} mod μ_6 (sixth roots of unity) |
| `GrossZagierAndArithmeticHeights/E19` | `PAPER-GROSS-ZAGIER-86/E18` | error | ∂/∂t spans (N)^{−u} T_x X when v\|n̄, i.e. ∂/∂t = N^{−u}·(generator). Equivalently ω_x is N^u times a generator of the cotangent line. With the corrected (8.1) (see PAPER-GROSS-ZAGIER-86/E16) this gives (x·x) = −u·ord_v(N), and hence Proposition (8.6) as printed. |
| `GrossZagierAndArithmeticHeights/E20` | `PAPER-GROSS-ZAGIER-86/E19` | error | For S (with the congruence α ≡ β) to be an order one needs −pq ≡ 1 (mod l) for every prime l\|D, i.e. −pq ≡ 1 (mod D); in the ramified case one needs −q ≡ 1 (mod D/p). Both can be imposed alongside GZ's conditions and still met by Dirichlet's theorem. Alternatively use the congruence α ≡ Xβ with N(X) ≡ −pq (mod D) (Mann's S_X, (A.5)/(A.6)). The sign bookkeeping α ≡ ±β in (9.3), (9.8) and in the proof of (9.7) then applies verbatim. |
| `GrossZagierAndArithmeticHeights/E21` | `PAPER-GROSS-ZAGIER-86/E20` | misprint | From R𝔟 = 𝔟S we get R = 𝔟S𝔟^{-1}. Since jb = b̄j, this puts β in 𝔡^{-1}𝔮^{-1}𝔫𝔟𝔟̄^{-1}𝔞̄, not 𝔡^{-1}𝔮^{-1}𝔫𝔟̄𝔟^{-1}𝔞̄. The printed (9.3) (and the class 𝒜𝔅²[𝔮𝔫^{-1}] of 𝔠′ in (9.5)) holds if 'R𝔟 = 𝔟S' is read as '𝔟R = S𝔟', or equivalently if 𝔟 is replaced by 𝔟̄. |
| `GrossZagierAndArithmeticHeights/E22` | `PAPER-GROSS-ZAGIER-86/E21` | error | In (7.4), (8.5) and §9 the representative 𝔞 ∈ 𝒜 must be prime to p. For the congruences in (9.3) and (9.8) it must also be prime to 𝔡, or those congruences must be read modulo 𝔞O_𝔣. (7.3)(2) itself is fine for any 𝔞. |
| `GrossZagierAndArithmeticHeights/E23` | `PAPER-GROSS-ZAGIER-86/E22` | error | The number is u²·δ(n): elements b ∈ ⊔_{v\|p} R_v𝔞/±1, taken over the 2^{t−1} places v attached to the pair (𝔠, 𝔠′). |
| `GrossZagierAndArithmeticHeights/E24` | `PAPER-GROSS-ZAGIER-86/E23` | misprint | each of residual degree f, i.e. with residue field of order q_v = p^f |
| `GrossZagierAndArithmeticHeights/E25` | `PAPER-GROSS-ZAGIER-86/E24` | misprint | α ≡ (−1)^{ord_𝔣(𝔟)} β mod O_𝔣 (for the primes 𝔣 ≠ 𝔭 dividing 𝔡) |
| `GrossZagierAndArithmeticHeights/E26` | `PAPER-GROSS-ZAGIER-86/E25` | gap | Lemma (8.2) at places v \| 6 (v ∤ N) needs a proof. Conrad 2004 §9 (Theorem 9.2, (9.9), Definition 9.5, Remark 9.3) gives a deformation-theoretic proof valid in all residue characteristics for non-elliptic x. At elliptic points, and when v \| N, his local terms differ from GZ's and only the global sums agree. |
| `GrossZagierAndArithmeticHeights/E27` | `PAPER-GROSS-ZAGIER-86/E26` | misprint | Summing over all z ∈ T_r x^σ ... |
| `GrossZagierAndArithmeticHeights/E28` | `PAPER-GROSS-ZAGIER-86/E27` | misprint | L^{(N)}(2s−2k+1, ε) in both places, as in (0.1) itself on p. 267 ('L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ a(n)r_𝒜(n)n^{−s}'). |
| `GrossZagierAndArithmeticHeights/E29` | `PAPER-GROSS-ZAGIER-86/E28` | misprint | L^{(N)}(2s−2k+1, ε) |
| `GrossZagierAndArithmeticHeights/E30` | `PAPER-GROSS-ZAGIER-86/E29` | misprint | the line continues the chain of equalities and should begin with '='. |
| `GrossZagierAndArithmeticHeights/E31` | `PAPER-GROSS-ZAGIER-86/E30` | misprint | γ = (a b; c d) ∈ SL₂(ℤ) |
| `GrossZagierAndArithmeticHeights/E32` | `PAPER-GROSS-ZAGIER-86/E31` | misprint | e_{δ₂}(−R* N(λ₀ν)) (the integer δ₂, not the ideal 𝔡₂, in the subscript) |
| `GrossZagierAndArithmeticHeights/E33` | `PAPER-GROSS-ZAGIER-86/E32` | misprint | From (2.2) and (2.3) we find … |
| `GrossZagierAndArithmeticHeights/E34` | `PAPER-GROSS-ZAGIER-86/E33` | misprint | E_s^{(1)}(pz) − i p^{−s−1/2} E_s^{(−p)}(z), i.e. E_s^{(D)}(z) with D = −p |
| `GrossZagierAndArithmeticHeights/E35` | `PAPER-GROSS-ZAGIER-86/E34` | misprint | small values of k |
| `GrossZagierAndArithmeticHeights/E36` | `PAPER-GROSS-ZAGIER-86/E35` | misprint | ∫_{1−i∞}^{1+i∞} z^{−s} e^{uz} dz |
| `GrossZagierAndArithmeticHeights/E37` | `PAPER-GROSS-ZAGIER-86/E36` | misprint | \|_{s=1−k} |
| `GrossZagierAndArithmeticHeights/E38` | `PAPER-GROSS-ZAGIER-86/E37` | error | b) Suppose n > 0 satisfies (4.2) and ε(N) = 1. Then σ′_𝒜(n) = Σ_{p\|n} a_p(n) log p with a_p(n) as printed. |
| `GrossZagierAndArithmeticHeights/E39` | `PAPER-GROSS-ZAGIER-86/E38` | error | σ_𝒜(−n) in all three places, i.e. −Σ_{n≥1} σ_𝒜(−n) r_𝒜(mδ + Nn) q_{k−1}(4πnNy/δ) and −2 Σ_{n≥1} σ_𝒜(−n) r_𝒜(m\|D\| + nN) Q_{k−1}(1 + 2nN/(m\|D\|)); by (4.6a) σ_𝒜(−n) = δ(n) R_{{𝒜𝔫}}(n). The same correction applies on pp. 303, 305 and 307, and on p. 315: γ^m_{N,s}(𝒜) = −2u² Σ_{n≥1} σ_𝒜(−n) r_𝒜(nN + m\|D\|) Q_{s−1}(1 + 2nN/(m\|D\|)) + 2hu r_𝒜(m)(Γ′/Γ(s) − log 2π + ½ log\|D\| + L′/L(1, ε)), which is Chap. II Corollary (3.17) with δ(n)R_{{𝒜𝔫}}(n) = σ_𝒜(−n). |
| `GrossZagierAndArithmeticHeights/E40` | `PAPER-GROSS-ZAGIER-86/E39` | misprint | … then −p is prime to D and determines a genus … |
| `GrossZagierAndArithmeticHeights/E41` | `PAPER-GROSS-ZAGIER-86/E40` | misprint | … equals (ord_p(n) + 1) δ(n) R_{{𝒜𝔫𝔠}}(n/p) log p if there is a unique such prime p (𝔠 as in (4.6b)). |
| `GrossZagierAndArithmeticHeights/E42` | `PAPER-GROSS-ZAGIER-86/E41` | misprint | (Φ̃, P_m) = ∫_{Γ_∞\𝔥} \overline{e^{2πimz}} Φ̃(z) y^{2k−2} dx dy = ∫_0^∞ e^{−4πmy} a_m(y) y^{2k−2} dy   (p. 289); (Φ̃, P_{m,s̄}) = ∫_{Γ_∞\𝔥} e^{−2πim z̄} Φ̃(z) y^s dx dy = ∫_0^∞ e^{−4πmy} a_m(y) y^s dy   (p. 296) |
| `GrossZagierAndArithmeticHeights/E43` | `PAPER-GROSS-ZAGIER-86/E47` | misprint | 1/(cz+d)^2 · y^s/\|cz+d\|^{2s} = 2i/(s+1) · ∂/∂z ( y^{s+1}/\|cz+d\|^{2s+2} ) |
| `GrossZagierAndArithmeticHeights/E44` | `PAPER-GROSS-ZAGIER-86/E48` | misprint | the inner sum is over N_2 \| N: α(M) = Σ_{N_2\|N} C_N^{-1}(M,N_2) A(N_2) by (6.3) |
| `GrossZagierAndArithmeticHeights/E45` | `PAPER-GROSS-ZAGIER-86/E49` | misprint | Then there exists a holomorphic cusp form Φ_𝒜(z) = … |
| `GrossZagierAndArithmeticHeights/E46` | `PAPER-GROSS-ZAGIER-86/E50` | misprint | by the Manin-Drinfeld theorem ([41], Cor. 3.6) |
| `GrossZagierAndArithmeticHeights/E47` | `PAPER-GROSS-ZAGIER-86/E51` | misprint | absolutely convergent for Re(s) > 0 |
| `GrossZagierAndArithmeticHeights/E48` | `PAPER-GROSS-ZAGIER-86/E60` | error | Since T_m((∞)) = σ₁(m)(∞) and T_m((0)) = σ₁(m)(0) for (m, N) = 1, we have … (the displayed identity is unchanged). T_m does not fix the other cusps in general: it fixes every cusp for all m prime to N if and only if every f_d = (d, N/d) is at most 2, i.e. if and only if N is divisible neither by 9, nor by 16, nor by p² for a prime p ≥ 5. |
| `GrossZagierAndArithmeticHeights/E49` | `PAPER-GROSS-ZAGIER-86/E61` | misprint | where 𝔫 is any primitive integral ideal of K of norm N (𝒪/𝔫 ≅ ℤ/Nℤ), as in §1 (p. 235) and §3 (p. 243). |
| `GrossZagierAndArithmeticHeights/E50` | `PAPER-GROSS-ZAGIER-86/E62` | error | X is regular except at the points x of characteristic p \| N with Aut_k(x) ≠ ⟨±1⟩ that are supersingular or lie on a component 𝓕_{a,b} with a ≥ 1 and b ≥ 1; all those points are singular. The resolution X^reg in (3.3) must also resolve the ordinary ones (points with j = 1728 or j = 0 on 𝓕_{a,b}, a, b ≥ 1, possible when p² \| N). |
| `GrossZagierAndArithmeticHeights/E51` | `PAPER-GROSS-ZAGIER-86/E63` | error | Choose q with pq ≡ −1 (mod D), i.e. −pq ≡ 1 (mod D) (this still gives (q/l) = (−p/l) for l \| D, so q splits and B = (D, −pq) is ramified exactly at p and ∞); then the displayed set is an Eichler order of level N and (0.5) holds as printed. Equivalently, keep q ≡ −p (mod D) and replace 'α − β integral at 𝔡' by 'α − pβ integral at 𝔡' in R and in (0.5). |
| `GrossZagierAndArithmeticHeights/E52` | `PAPER-GROSS-ZAGIER-86/E64` | misprint | ord_v(α) = ½ Σ_{n≥1} (Card(Aut_{W/π^n}(x)) − Card(Aut_W(x))) |
| `GrossZagierAndArithmeticHeights/E53` | `PAPER-GROSS-ZAGIER-86/E65` | misprint | d^σ = (x^σ) − (0) (and T_m d^σ in the proof of (3.3)); d = (x) − (0) in the paper's notation (Ch. I). |
| `GrossZagierAndArithmeticHeights/E54` | `PAPER-GROSS-ZAGIER-86/E66` | misprint | Σ_𝒜 R_{{𝒜𝔫}}(n) r_𝒜(l) = Σ_{{𝒜}} R_{{𝒜𝔫}}(n) R_{{𝒜}}(l) = R(n)R(l) or 0 (the argument (n) of R_{{𝒜𝔫}} is missing in the middle term) |
| `GrossZagierAndArithmeticHeights/E55` | `PAPER-GROSS-ZAGIER-86/E67` | misprint | ω′ = ω/√D, with ω transported to E′ by the K-isomorphism E′ ≅ E, (x, y) ↦ (x, √D·y), and √D = ±i√\|D\|. |
| `GrossZagierAndArithmeticHeights/E56` | `PAPER-GROSS-ZAGIER-86/E73` | misprint | … ∂/∂s V_s(ny)\|_{s=1−k} · Σ_{d\|n} ε(n, d) |
| `GrossZagierAndArithmeticHeights/E57` | `PAPER-GROSS-ZAGIER-86/E76` | misprint | (θ_𝒜\|₁γ)(z) = ε_{D₁}(c/δ₂) ε_{D₂}(d) κ(D₁)^{−1} δ₁^{−½} χ_{D₁·D₂}(𝒜) θ_{𝒜𝒟₁}((z + c*d)/δ₁), |
| `GrossZagierAndArithmeticHeights/E58` | `PAPER-YUAN-ZHANG-18/E10` | misprint | With c2 already the global projection constant, write c1=c0−2c2. |
| `GrossZagierAndArithmeticHeights/E59` | `PAPER-YUAN-ZHANG-18/E11` | error | Choose an OE-module generator of the free rank-one OE lattice M, not an arbitrary nonzero vector. |
| `GrossZagierAndArithmeticHeights/E60` | `PAPER-YUAN-ZHANG-18/E12` | misprint | Choose distinct positive sufficiently divisible integers N; their absolute values then make the displayed powers distinct. |
| `GrossZagierAndArithmeticHeights/E61` | `PAPER-YUAN-ZHANG-18/E13` | error | Use the separately normalized zero-index Whittaker coefficient derived here; the cited formula applies to a≠0. |
| `GrossZagierAndArithmeticHeights/E62` | `PAPER-YUAN-ZHANG-18/E14` | misprint | Replace ψ1 by ψ2 in the three conclusions of the ψ2 computation. |
| `GrossZagierAndArithmeticHeights/E63` | `PAPER-YUAN-ZHANG-18/E15` | error | Use m(b,β)=½v(Dv λ(b)) on the stated unit-norm support, including wild ramification. |
| `GrossZagierAndArithmeticHeights/E64` | `PAPER-YUAN-ZHANG-18/E16` | misprint | Use ½(m_ν̄1+m_ν̄2); label the lower-unipotent formula m_ν̄2 and its following extension i_ν̄2. |
| `GrossZagierAndArithmeticHeights/E65` | `PAPER-YUAN-ZHANG-18/E17` | error | Supply an invariant/equivariant vertical-divisor lift or a quotient/descent argument establishing the needed intersection invariance. |
| `GrossZagierAndArithmeticHeights/E66` | `PAPER-YUAN-ZHANG-18/E18` | error | π ramifies at P' with index e. The section property holds because U'_v = U_v: the CM point P' is then defined over a class field of E that is unramified at w over H, so P' is H_w^ur-rational. Its closure in the proper R-scheme X_{U',R} is therefore the image of a section Spec R → X_{U',R}. |
| `GrossZagierAndArithmeticHeights/E67` | `PAPER-YUAN-ZHANG-18/E21` | misprint | Take the quadratic space over F, positive definite at every real place; its local real fibers are over R. |
| `GrossZagierAndArithmeticHeights/E68` | `PAPER-YUAN-ZHANG-18/E22` | misprint | Insert 'not': the negative-valuation range does not affect the near-diagonal restriction being computed. |
| `GrossZagierAndArithmeticHeights/E69` | `PAPER-YUAN-ZHANG-18/E28` | gap | In Theorems 1.6 and 1.7 (and §§1.2–1.3), take U = Ô_𝔹^× for a maximal order Ô_𝔹 of 𝔹_f containing Ô_E. This follows from 'U maximal ⊇ Ô_E^×' unless some place v \| 2 of F with residue field F_2 splits in E. Theorem 1.1 is unaffected, since such a U can always be chosen. |
| `GrossZagierAndArithmeticHeights/E70` | `PAPER-YUAN-ZHANG-18/E43` | error | For v ∈ S2, u ∈ O_{F_v}^×: c_{ψ1}(1,y,u) = 0, but c_{ψ2}(1,y,u) = 2 log N_v when y ∈ ϖ_v^{−1}O_{E_v} and q(y) ∈ O_{F_v}^× (0 otherwise). Hence c_{φ_v}(1,y,u) = −(2 log N_v/(1+N_v+N_v²))·1_{ϖ_v^{−1}(O_{B_v})_2}(y)·1_{O_{F_v}^×}(u), not 0, and Lemma 7.6(2)'s 'split: 0' fails at S2. Theorems 9.1 and 1.7 still hold. Prop. 9.2(2) at S2 needs only d_{φ_v} = 2n_{φ_v}log N_v − c_{φ_v} + log\|uq(y)\|φ_v = 0, and Lemma 8.7(2) at S2 is off by the compensating amount (next issue). |
| `GrossZagierAndArithmeticHeights/E71` | `PAPER-YUAN-ZHANG-18/E44` | error | Insert the unramified quadratic characters of the complements. At finite w ∉ S′, r_V(g)φ_w = χ_{V1^⊥,w}(a_w)δ_w(g)^{(d−d1)/2}r_{V1}(g)φ_w, and (6.2.1) becomes A(g) = χ_{V1^⊥}(a(g))(ρ∞δ)^{(d−d1)/2}θ_{A,1} − χ_{V0^⊥}(a(g))(ρ∞δ)^{(d−d0)/2}θ_{A,0}, with χ_W(a(g)) = ∏_{w∉S′}χ_{W,w}(a_w). In the proof of Lemma 6.1 these characters are constant along g ∈ Γ (gg0 ∈ g0GL2(Ô)). So (1) holds (V_{ℓ,1}^⊥ = 0), while (2) follows only when, in each codimension, all the complements have the same discriminant character. §9 meets this: codimension 2 complements E·j with character η; codimension 4 quaternionic complements with trivial character. The main results are unaffected. |
| `GrossZagierAndArithmeticHeights/E72` | `PAPER-YUAN-ZHANG-18/E45` | misprint | Use a separate symbol, e.g. d_F = [F:ℚ]. The equation is Σ_{k=0}^{n}(1+iN)^{−d_F k}δ_f(g0)^k f_k(g0) = 0, with n the top power from (6.3.1), and one needs n + 1 admissible N giving distinct (1+iN)^{−d_F}. |
| `GrossZagierAndArithmeticHeights/E73` | `PAPER-YUAN-ZHANG-18/E46` | misprint | … an open compact subgroup of GL2(A_f). |
| `GrossZagierAndArithmeticHeights/E74` | `PAPER-YUAN-ZHANG-18/E47` | misprint | µ_U² in place of µ_K². |
| `GrossZagierAndArithmeticHeights/E75` | `PAPER-YUAN-ZHANG-18/E48` | misprint | Either use the normalized functions, −Σ_vΣ_a W°_{a,v}′(0,g,u)W°^v_a(0,g,u), or keep the unnormalized ones with a + sign. |
| `GrossZagierAndArithmeticHeights/E76` | `PAPER-YUAN-ZHANG-18/E49` | misprint | vol(D_n(a)) (equivalently vol(D_n(a)∩O_{E_v}𝔧_v)). |
| `GrossZagierAndArithmeticHeights/E77` | `PAPER-YUAN-ZHANG-18/E50` | misprint | The single (n = 0) term equals vol{(z1,z2) : z1z2 ∈ O_{F_v}^×} = (1−N_v^{−1})². |
| `GrossZagierAndArithmeticHeights/E78` | `PAPER-YUAN-ZHANG-18/E51` | error | For v ∈ S2, write φ_v = ψ1 − (1+N_v+N_v²)^{-1}ψ2 with ψ1 = 1_{O_{𝔹_v}^×}⊗1_{O^×} and ψ2 = 1_{ϖ_v^{-1}(O_{𝔹_v})_2}⊗1_{O^×}. Then n_{φ_v}(y,u) = −(1+N_v+N_v²)^{-1}ψ2(y,u) on E_v^××F_v^×, which is not 0; for example n_{φ_v}(1,1) = −1/(1+N_v+N_v²). The printed value is φ_v(1,1)·0 = 0. The lemma is correct for v ∉ S2. Prop. 9.2(2) and Theorem 9.1 still hold, because Lemma 7.6(2) fails at S2 by exactly the compensating amount: c_{φ_v}(1,y,u) = −(2log N_v/(1+N_v+N_v²))ψ2(y,u). Hence d_{φ_v}(1,y,u) = 2n_{φ_v}log N_v − c_{φ_v} + log\|uq(y)\|_vφ_v = 0 = −log\|d_vq(𝗃_v)\|_vφ_v(y,u). The proof of Prop. 9.2(2) at S2 must use both corrected values. |
| `GrossZagierAndArithmeticHeights/E79` | `PAPER-YUAN-ZHANG-18/E52` | error | At v ∈ Σ_f (E_v/F_v inert, g_v = w), r_E(w)φ_v(0,u) = λ(E_v/F_v,ψ_v)·vol(O_{E_v}^×)·1_{O^×}(u), with Weil index λ = η_v(d_v) = (−1)^{v(d_v)}. So every u-term has the common sign ε = Π_{v∈Σ_f}(−1)^{v(d_v)}, and \|r_E(g)φ(0,1)\| > 0. The constant term is ε times a positive number: nonzero, as needed, but not always positive. |
| `GrossZagierAndArithmeticHeights/E80` | `PAPER-YUAN-ZHANG-18/E53` | misprint | t_2 ∈ E^×(𝔸_f), a representative of a point of C_U. The context is [t2]_U ∈ C_U and later t2 ∈ F_v^×GL2(O_{F_v}) at v. |
| `GrossZagierAndArithmeticHeights/E81` | `PAPER-YUAN-ZHANG-18/E54` | misprint | Read 'the component W̃_i of Ṽ = Σ_i a_iW̃_i' (components of Ω̂, not of X_U) and 'l_{φ_v}(γ,u)'. |
| `GrossZagierAndArithmeticHeights/E82` | `PAPER-YUAN-ZHANG-18/E55` | misprint | Read ⟨e^{-1}π^*𝒫 − 𝒫′, 𝒫′⟩, the intersection number on 𝒳_{U′,R}, equivalently the degree of O(e^{-1}π^*𝒫 − 𝒫′)\|_{𝒫′}. |
| `GrossZagierAndArithmeticHeights/E83` | `PAPER-YUAN-26/E24` | misprint | (i/pi) ddbar g_D = deg(D) dmu_Ar - delta_D |
| `GrossZagierAndArithmeticHeights/E84` | `PAPER-YUAN-26/E28` | gap | two steps need g > 1 and are unproved at g = 1 |
| `GrossZagierAndArithmeticHeights/E85` | `PAPER-YUAN-26/E29` | misprint | up to additive constants |

## Required extraction coverage

Every required item has one disposition. “Planned” means the cited declaration includes its corrected statement and proof/construction route. “Requested” means its proper owner is asked for the exact specialization. “Outside scope” points to the final identity layer GZ.8.

| Source item | Disposition | Routing | Reason |
|---|---|---|---|
| `PAPER-YUAN-26/190` | planned | [GZ.2/arakelov-probability-form](#arakelov-probability-form) | The complex/graph admissibility normalization is owned by GZ.2; the primary author manuscript passage was inspected. |
| `PAPER-YUAN-26/191` | planned | [GZ.2/archimedean-admissible-metric](#archimedean-admissible-metric) | The complex/graph admissibility normalization is owned by GZ.2; the primary author manuscript passage was inspected. |
| `PAPER-YUAN-26/192` | planned | [GZ.2/admissible-green-function](#admissible-green-function) | The complex/graph admissibility normalization is owned by GZ.2; the primary author manuscript passage was inspected. |
| `PAPER-YUAN-26/193` | planned | [GZ.2/admissible-metric-existence](#admissible-metric-existence) | The complex/graph admissibility normalization is owned by GZ.2; the primary author manuscript passage was inspected. |
| `PAPER-YUAN-26/194` | planned | [GZ.2/normalized-arakelov-green](#normalized-arakelov-green) | The complex/graph admissibility normalization is owned by GZ.2; the primary author manuscript passage was inspected. |
| `PAPER-YUAN-26/195` | planned | [GZ.2/arakelov-dualizing-metric](#arakelov-dualizing-metric) | The complex/graph admissibility normalization is owned by GZ.2; the primary author manuscript passage was inspected. |
| `PAPER-YUAN-26/222` | planned | [GZ.2/graph-admissible-measure](#graph-admissible-measure) | The complex/graph admissibility normalization is owned by GZ.2; the primary author manuscript passage was inspected. |
| `PAPER-YUAN-26/229` | planned | [GZ.2/explicit-skeleton-measure](#explicit-skeleton-measure) | The complex/graph admissibility normalization is owned by GZ.2; the primary author manuscript passage was inspected. |
| `PAPER-YUAN-26/231` | planned | [GZ.2/real-admissible-descent](#real-admissible-descent) | The complex/graph admissibility normalization is owned by GZ.2; the primary author manuscript passage was inspected. |
| `PAPER-YUAN-ZHANG-18/pseudo-theta` | planned | [GZ.6/colmez-pseudo-theta](#colmez-pseudo-theta) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/pseudo-comparison` | planned | [GZ.6/colmez-pseudo-comparison](#colmez-pseudo-comparison) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/pseudo-automorphic` | planned | [GZ.6/colmez-pseudo-automorphic](#colmez-pseudo-automorphic) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/pseudo-weight-cancel` | planned | [GZ.6/colmez-pseudo-weight-cancel](#colmez-pseudo-weight-cancel) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/mixed-kernel` | planned | [GZ.6/mixed-theta-eisenstein](#mixed-theta-eisenstein) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/whittaker` | planned | [GZ.6/colmez-whittaker](#colmez-whittaker) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/torus-average` | planned | [GZ.6/colmez-torus-average](#colmez-torus-average) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/local-k-c` | planned | [GZ.6/colmez-local-k-c](#colmez-local-k-c) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/holomorphic-projection` | requested | `AutomorphicSpectralTheory:AS.4` | Reusable Petersson projection/Iwasawa spectral-family infrastructure is imported from its existing owner; the exact required formula is in requests. |
| `PAPER-YUAN-ZHANG-18/projected-derivative` | planned | [GZ.6/colmez-projected-derivative](#colmez-projected-derivative) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/test-function` | planned | [GZ.7/colmez-test-function](#colmez-test-function) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/order-sandwich` | planned | [GZ.7/colmez-order-sandwich](#colmez-order-sandwich) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/norm-shells` | planned | [GZ.7/colmez-norm-shells](#colmez-norm-shells) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/shell-inert` | planned | [GZ.7/colmez-shell-inert](#colmez-shell-inert) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/shell-ramified` | planned | [GZ.7/colmez-shell-ramified](#colmez-shell-ramified) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/k-inert` | planned | [GZ.7/colmez-k-inert](#colmez-k-inert) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/k-ramified` | planned | [GZ.7/colmez-k-ramified](#colmez-k-ramified) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/c-arch` | planned | [GZ.7/colmez-c-arch](#colmez-c-arch) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/c-finite` | planned | [GZ.7/colmez-c-finite](#colmez-c-finite) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/hecke-height-series` | planned | [GZ.6/special-correspondence-cycle](#special-correspondence-cycle), [GZ.6/cm-degree-zero-class](#cm-degree-zero-class), [GZ.6/picard-generating-series](#picard-generating-series), [GZ.6/arithmetic-height-kernel](#arithmetic-height-kernel) | Split into the existing proper-cycle, componentwise ξ, Picard-series and height-kernel declarations; proper push-forward multiplicity follows the current YZZ erratum. |
| `PAPER-YUAN-ZHANG-18/series-automorphy` | planned | [GZ.6/colmez-series-automorphy](#colmez-series-automorphy) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/omega-self` | planned | [GZ.7/colmez-omega-self](#colmez-omega-self) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/arch-green` | planned | [GZ.7/colmez-arch-green](#colmez-arch-green) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/arch-proper` | planned | [GZ.7/colmez-arch-proper](#colmez-arch-proper) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/finite-multiplicity` | planned | [GZ.7/colmez-finite-multiplicity](#colmez-finite-multiplicity) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/nonsplit-proper` | planned | [GZ.7/colmez-nonsplit-proper](#colmez-nonsplit-proper) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/ordinary-pairing` | planned | [GZ.7/colmez-ordinary-pairing](#colmez-ordinary-pairing) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/split-proper` | planned | [GZ.7/colmez-split-proper](#colmez-split-proper) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/height-decomposition-series` | planned | [GZ.7/colmez-height-decomposition-series](#colmez-height-decomposition-series) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/local-m-inert` | planned | [GZ.7/colmez-local-m-inert](#colmez-local-m-inert) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/local-m-ramified` | planned | [GZ.7/colmez-local-m-ramified](#colmez-local-m-ramified) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/local-m-division` | planned | [GZ.7/colmez-local-m-division](#colmez-local-m-division) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/local-n` | planned | [GZ.7/colmez-local-n](#colmez-local-n) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/superspecial-m` | planned | [GZ.7/colmez-superspecial-m](#colmez-superspecial-m) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/vertical-pseudo` | planned | [GZ.7/colmez-vertical-pseudo](#colmez-vertical-pseudo) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/vertical-split-zero` | planned | [GZ.7/colmez-vertical-split-zero](#colmez-vertical-split-zero) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/kernel-schwartz` | planned | [GZ.7/colmez-kernel-schwartz](#colmez-kernel-schwartz) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/local-cancel-nonsplit` | planned | [GZ.7/colmez-local-cancel-nonsplit](#colmez-local-cancel-nonsplit) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/local-cancel-split` | planned | [GZ.7/colmez-local-cancel-split](#colmez-local-cancel-split) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/nonzero-theta` | planned | [GZ.7/colmez-nonzero-theta](#colmez-nonzero-theta) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/residue-line` | planned | [GZ.2/colmez-residue-line](#colmez-residue-line) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/adjunction-arch` | planned | [GZ.7/colmez-adjunction-arch](#colmez-adjunction-arch) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/small-level-diagonal` | planned | [GZ.7/colmez-small-level-diagonal](#colmez-small-level-diagonal) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/modified-projection` | planned | [GZ.7/colmez-modified-projection](#colmez-modified-projection) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/adjunction-finite` | planned | [GZ.7/colmez-adjunction-finite](#colmez-adjunction-finite) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/arithmetic-adjunction` | planned | [GZ.7/colmez-arithmetic-adjunction](#colmez-arithmetic-adjunction) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/s2-assumption` | planned | [GZ.7/colmez-s2-assumption](#colmez-s2-assumption) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/rev-iwasawa-invariants-and-on-gl2` | requested | `AutomorphicSpectralTheory:AS.2` | Reusable Petersson projection/Iwasawa spectral-family infrastructure is imported from its existing owner; the exact required formula is in requests. |
| `PAPER-YUAN-ZHANG-18/rev-derivative-of-the-mixed-theta` | planned | [GZ.6/colmez-rev-derivative-of-the-mixed-theta](#colmez-rev-derivative-of-the-mixed-theta) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/rev-archimedean-holomorphic-projection-of-log` | planned | [GZ.6/colmez-rev-archimedean-holomorphic-projection-of-log](#colmez-rev-archimedean-holomorphic-projection-of-log) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/rev-local-whittaker-series-for-incoherent` | planned | [GZ.6/colmez-rev-local-whittaker-series-for-incoherent](#colmez-rev-local-whittaker-series-for-incoherent) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/rev-archimedean-derivative-kernel` | planned | [GZ.7/colmez-rev-archimedean-derivative-kernel](#colmez-rev-archimedean-derivative-kernel) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/rev-corrected-cm-multiplicity-at-split` | planned | [GZ.7/colmez-rev-corrected-cm-multiplicity-at-split](#colmez-rev-corrected-cm-multiplicity-at-split) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-YUAN-ZHANG-18/rev-hodge-class-terms-vanish-and` | planned | [GZ.6/colmez-rev-hodge-class-terms-vanish-and](#colmez-rev-hodge-class-terms-vanish-and) | The specialized Colmez local/kernel/adjunction declaration is owned here, with primary published passage and reviewed corrections reconciled. |
| `PAPER-GROSS-ZAGIER-86/20` | planned | [GZ.6/classical-partial-rankin-series](#classical-partial-rankin-series) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/21` | planned | [GZ.0/classical-rankin-normalization](#classical-rankin-normalization) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/23` | planned | [GZ.6/classical-absolute-convergence](#classical-absolute-convergence) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/24` | planned | [GZ.6/classical-entire-functional-equation](#classical-entire-functional-equation) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/25` | planned | [GZ.6/classical-height-series-cuspidality](#classical-height-series-cuspidality) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/29` | planned | [GZ.0/classical-relative-field-heights](#classical-relative-field-heights) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/30` | planned | [GZ.3/classical-eigendifferential-period](#classical-eigendifferential-period) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/47` | planned | [GZ.6/classical-disjointness](#classical-disjointness) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/60` | planned | [GZ.0/classical-cm-action-conventions](#classical-cm-action-conventions) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/62` | planned | [GZ.2/classical-complex-height-symbol](#classical-complex-height-symbol) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/63` | planned | [GZ.7/classical-height-green-characterization](#classical-height-green-characterization) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/67` | planned | [GZ.7/classical-resolvent-kernel](#classical-resolvent-kernel) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/68` | planned | [GZ.7/classical-resolvent-residue](#classical-resolvent-residue) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/72` | planned | [GZ.7/classical-cusp-expansion](#classical-cusp-expansion) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/73` | planned | [GZ.7/classical-marked-green-kernel](#classical-marked-green-kernel) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/74` | planned | [GZ.7/classical-green-constant](#classical-green-constant) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/76` | planned | [GZ.7/classical-archimedean-height](#classical-archimedean-height) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/77` | planned | [GZ.7/classical-hecke-kernel-action](#classical-hecke-kernel-action) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/78` | planned | [GZ.7/classical-hecke-green-kernel](#classical-hecke-green-kernel) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/79` | planned | [GZ.7/classical-hecke-archimedean-height](#classical-hecke-archimedean-height) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/80` | planned | [GZ.7/classical-atkin-lehner-invariance](#classical-atkin-lehner-invariance) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/81` | planned | [GZ.7/classical-cm-kernel-invariants](#classical-cm-kernel-invariants) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/82` | planned | [GZ.7/classical-cm-genus-orbits](#classical-cm-genus-orbits) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/84` | planned | [GZ.7/classical-hyperbolic-norm-parameter](#classical-hyperbolic-norm-parameter) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/85` | planned | [GZ.7/classical-pair-count](#classical-pair-count) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/86` | planned | [GZ.7/classical-ramified-congruence-count](#classical-ramified-congruence-count) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/87` | planned | [GZ.7/classical-prime-discriminant-count](#classical-prime-discriminant-count) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/88` | planned | [GZ.7/classical-genus-pair-count](#classical-genus-pair-count) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/89` | planned | [GZ.7/classical-genus-kernel-evaluation](#classical-genus-kernel-evaluation) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/90` | planned | [GZ.7/classical-orbit-kernel-evaluation](#classical-orbit-kernel-evaluation) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/91` | planned | [GZ.7/classical-genus-character-filter](#classical-genus-character-filter) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/93` | planned | [GZ.2/classical-archimedean-height-sum](#classical-archimedean-height-sum) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/94` | planned | [GZ.7/classical-cm-eisenstein-sum](#classical-cm-eisenstein-sum) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/99` | planned | [GZ.7/classical-disjoint-archimedean-sum](#classical-disjoint-archimedean-sum) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/100` | planned | [GZ.7/classical-tangent-symbol](#classical-tangent-symbol) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/101` | planned | [GZ.7/classical-tangent-product-formula](#classical-tangent-product-formula) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/103` | planned | [GZ.7/classical-eta-tangent](#classical-eta-tangent) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/105` | planned | [GZ.7/classical-complex-tangent-asymptotic](#classical-complex-tangent-asymptotic) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/106` | planned | [GZ.7/classical-diagonal-archimedean-height](#classical-diagonal-archimedean-height) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/107` | planned | [GZ.7/classical-diagonal-green-kernel](#classical-diagonal-green-kernel) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/109` | planned | [GZ.7/classical-renormalized-self-value](#classical-renormalized-self-value) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/111` | planned | [GZ.7/classical-self-value-orbit-sum](#classical-self-value-orbit-sum) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/112` | planned | [GZ.7/classical-total-archimedean-formula](#classical-total-archimedean-formula) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/113` | planned | [GZ.2/classical-local-intersection-height](#classical-local-intersection-height) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/115` | planned | [GZ.7/classical-degree-one-intersection](#classical-degree-one-intersection) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/116` | planned | [GZ.7/classical-supersingular-eichler-order](#classical-supersingular-eichler-order) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/117` | planned | [GZ.7/classical-inert-order-model](#classical-inert-order-model) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/118` | planned | [GZ.7/classical-norm-one-generators](#classical-norm-one-generators) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/130` | planned | [GZ.7/classical-level-reduction-component](#classical-level-reduction-component) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/131` | planned | [GZ.7/classical-component-orthogonality](#classical-component-orthogonality) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/132` | planned | [GZ.7/classical-finite-intersection-height](#classical-finite-intersection-height) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/135` | planned | [GZ.7/classical-hom-intersection-count](#classical-hom-intersection-count) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/137` | planned | [GZ.7/classical-half-hom-count](#classical-half-hom-count) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/138` | planned | [GZ.7/classical-new-hom-set](#classical-new-hom-set) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/139` | planned | [GZ.7/classical-prime-to-p-hom-count](#classical-prime-to-p-hom-count) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/143` | planned | [GZ.7/classical-isomorphism-intersection-count](#classical-isomorphism-intersection-count) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/146` | planned | [GZ.7/classical-split-vanishing](#classical-split-vanishing) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/151` | planned | [GZ.7/classical-endomorphism-congruence-order](#classical-endomorphism-congruence-order) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/152` | planned | [GZ.7/classical-hom-quaternion-realization](#classical-hom-quaternion-realization) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/153` | planned | [GZ.7/classical-inert-disjoint-intersection](#classical-inert-disjoint-intersection) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/154` | planned | [GZ.7/classical-ramified-disjoint-intersection](#classical-ramified-disjoint-intersection) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/155` | planned | [GZ.7/classical-self-intersection-tangent](#classical-self-intersection-tangent) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/156` | planned | [GZ.7/classical-new-automorphism-length](#classical-new-automorphism-length) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/157` | planned | [GZ.7/classical-j-tangent-values](#classical-j-tangent-values) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/158` | planned | [GZ.7/classical-new-hom-intersection](#classical-new-hom-intersection) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/159` | planned | [GZ.7/classical-inert-total-intersection](#classical-inert-total-intersection) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/160` | planned | [GZ.7/classical-ramified-total-intersection](#classical-ramified-total-intersection) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/161` | planned | [GZ.7/classical-split-total-intersection](#classical-split-total-intersection) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/162` | planned | [GZ.7/classical-level-intersection](#classical-level-intersection) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/163` | planned | [GZ.2/classical-p-height-sum](#classical-p-height-sum) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/164` | planned | [GZ.7/classical-split-height-sum](#classical-split-height-sum) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/167` | planned | [GZ.7/classical-inert-hom-lattice](#classical-inert-hom-lattice) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/168` | planned | [GZ.7/classical-inert-norm-ideal-map](#classical-inert-norm-ideal-map) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/169` | planned | [GZ.7/classical-inert-height-sum](#classical-inert-height-sum) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/327` | planned | [GZ.7/classical-inert-unit-count](#classical-inert-unit-count) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/170` | planned | [GZ.7/classical-ramified-order-model](#classical-ramified-order-model) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/171` | planned | [GZ.7/classical-ramified-height-sum](#classical-ramified-height-sum) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/173` | planned | [GZ.0/classical-genus-character-factorization](#classical-genus-character-factorization) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/181` | planned | [GZ.6/classical-rankin-unfolding](#classical-rankin-unfolding) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/183` | planned | [GZ.6/classical-trace-adjunction](#classical-trace-adjunction) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/184` | planned | [GZ.6/classical-mobius-level-decomposition](#classical-mobius-level-decomposition) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/186` | planned | [GZ.6/classical-rankin-kernel](#classical-rankin-kernel) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/187` | planned | [GZ.6/classical-rankin-kernel-pairing](#classical-rankin-kernel-pairing) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/188` | planned | [GZ.6/classical-prime-to-level-detection](#classical-prime-to-level-detection) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/193` | planned | [GZ.6/classical-eisenstein-transformation](#classical-eisenstein-transformation) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/199` | planned | [GZ.6/classical-trace-coset-classification](#classical-trace-coset-classification) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/201` | planned | [GZ.6/classical-ramified-theta-reindexing](#classical-ramified-theta-reindexing) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/202` | planned | [GZ.6/classical-eisenstein-combination](#classical-eisenstein-combination) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/203` | planned | [GZ.6/classical-kernel-u-formula](#classical-kernel-u-formula) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/204` | planned | [GZ.6/classical-prime-eisenstein-combination](#classical-prime-eisenstein-combination) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/205` | planned | [GZ.6/classical-kernel-fourier-expansion](#classical-kernel-fourier-expansion) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/206` | planned | [GZ.6/classical-genus-sign-function](#classical-genus-sign-function) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/210` | planned | [GZ.6/classical-eisenstein-zero-coefficient](#classical-eisenstein-zero-coefficient) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/211` | planned | [GZ.6/classical-eisenstein-nonzero-coefficient](#classical-eisenstein-nonzero-coefficient) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/330` | planned | [GZ.6/classical-kernel-meromorphic-continuation](#classical-kernel-meromorphic-continuation) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/221` | planned | [GZ.6/classical-integral-kernel-values](#classical-integral-kernel-values) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/222` | planned | [GZ.6/classical-central-kernel-holomorphy](#classical-central-kernel-holomorphy) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/223` | planned | [GZ.6/classical-coefficient-functional-equation](#classical-coefficient-functional-equation) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/224` | planned | [GZ.6/classical-genus-sign-reversal](#classical-genus-sign-reversal) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/225` | planned | [GZ.6/classical-l-functional-equation](#classical-l-functional-equation) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/227` | planned | [GZ.6/classical-signed-divisor-sums](#classical-signed-divisor-sums) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/228` | planned | [GZ.6/classical-central-value-kernel](#classical-central-value-kernel) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/230` | planned | [GZ.6/classical-different-reindexing](#classical-different-reindexing) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/231` | planned | [GZ.6/classical-central-derivative-kernel](#classical-central-derivative-kernel) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/234` | planned | [GZ.6/classical-sign-multiplicativity](#classical-sign-multiplicativity) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/235` | planned | [GZ.6/classical-genus-sigma-identity](#classical-genus-sigma-identity) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/236` | planned | [GZ.6/classical-logarithmic-prime-decomposition](#classical-logarithmic-prime-decomposition) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/237` | planned | [GZ.6/classical-prime-coefficient-parity](#classical-prime-coefficient-parity) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/238` | planned | [GZ.6/classical-single-prime-logarithm](#classical-single-prime-logarithm) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/251` | planned | [GZ.5/classical-weight-two-central-value](#classical-weight-two-central-value) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/252` | planned | [GZ.5/classical-central-value-endpoints](#classical-central-value-endpoints) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/255` | planned | [GZ.5/classical-genus-sum-filter](#classical-genus-sum-filter) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/263` | planned | [GZ.6/classical-holomorphic-projection](#classical-holomorphic-projection) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/267` | planned | [GZ.6/classical-eisenstein-mellin-asymptotics](#classical-eisenstein-mellin-asymptotics) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/268` | planned | [GZ.6/classical-boundary-eisenstein-cusps](#classical-boundary-eisenstein-cusps) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/331` | planned | [GZ.6/classical-boundary-eisenstein-orthogonality](#classical-boundary-eisenstein-orthogonality) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/269` | planned | [GZ.6/classical-cusp-matrix-inverse](#classical-cusp-matrix-inverse) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/270` | planned | [GZ.6/classical-projection-boundary-coefficients](#classical-projection-boundary-coefficients) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/271` | planned | [GZ.6/classical-rankin-cusp-constants](#classical-rankin-cusp-constants) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/272` | planned | [GZ.6/classical-rankin-boundary-coefficients](#classical-rankin-boundary-coefficients) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/273` | planned | [GZ.6/classical-rankin-mellin-regularization](#classical-rankin-mellin-regularization) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/274` | planned | [GZ.6/classical-projected-derivative-cuspform](#classical-projected-derivative-cuspform) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/275` | planned | [GZ.6/classical-projected-derivative-coefficients](#classical-projected-derivative-coefficients) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/280` | planned | [GZ.7/classical-global-local-archimedean-sum](#classical-global-local-archimedean-sum) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/281` | planned | [GZ.7/classical-finite-height-sum](#classical-finite-height-sum) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/294` | planned | [GZ.3/classical-modular-period-degree](#classical-modular-period-degree) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/302` | planned | [GZ.0/classical-twist-real-period](#classical-twist-real-period) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/309` | planned | [GZ.5/classical-definite-period-announcement](#classical-definite-period-announcement) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/310` | planned | [GZ.5/classical-definite-square-class](#classical-definite-square-class) | Owned classical specialization, with exact statement, direct mathematical inputs, primary locator and proof outline. |
| `PAPER-GROSS-ZAGIER-86/13` | requested | `HeightsRationalPointsAndObstructions:RP.0` | Canonical Jacobian height for 2Θ, positivity modulo torsion and complex Hermitian extension; specialize the general ample canonical-height machine, without redefining it in GZ. |
| `PAPER-GROSS-ZAGIER-86/18` | requested | `HeegnerPointEulerSystems:HE.0` | Ideal-class CM points and Hecke correspondences on X₀(N), field-of-definition and Artin reciprocity with the source ideal-inverse convention. |
| `PAPER-GROSS-ZAGIER-86/33` | requested | `RankZeroOneBSD:BSD.5` | The BSD rank-one prediction over K and its exact index, regulator, torsion and Tamagawa convention; this is a consumer conjecture, not an arithmetic-height theorem proved here. |
| `PAPER-GROSS-ZAGIER-86/127` | requested | `AbelianSchemesAndArithmeticModuli:A6` | Hom/End of chosen cyclic N-isogeny diagrams over complete local and Artinian bases; degree equality, finite positive-degree fibres, free sign action and faithful stabilizer action. Do not assert choice-independent Hom for arbitrary coarse Artinian points with extra automorphisms. |
| `PAPER-GROSS-ZAGIER-86/140` | requested | `HeegnerPointEulerSystems:HE.2` | Quasicanonical CM lifting/isogeny intersection calculation over W, including the prime-to-p degree decomposition and the valuation normalization used in the classical Hom sum. |
| `PAPER-GROSS-ZAGIER-86/142` | requested | `ComplexMultiplicationAndExplicitReciprocity:CM.5` | Exact negative-norm coset/congruence lifting count in the quaternionic CM deformation order, including ramified and dyadic ranges. |
| `PAPER-GROSS-ZAGIER-86/145` | requested | `ComplexMultiplicationAndExplicitReciprocity:CM.5` | Canonical ordinary CM lifting and fullness of reduction on CM Hom/End; prove the classical new-Hom vanishing at split places. |
| `PAPER-GROSS-ZAGIER-86/148` | imported | `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances` | Quaternionic norm-positive/anti-linear decomposition compatible with the embedded K and reduced norm, including norm/degree ratio for connecting Hom ideals. |
| `PAPER-GROSS-ZAGIER-86/149` | requested | `ComplexMultiplicationAndExplicitReciprocity:CM.5` | Gross canonical-lift endomorphism filtration over W/π^n, in the source uniformizer convention; distinguish inert and ramified lengths and state the dyadic exceptions. |
| `PAPER-GROSS-ZAGIER-86/166` | requested | `GL2AutomorphicRepresentationsAndTransfer:R16.1` | Connecting ideals between optimal CM Eichler orders and their orientation identity; provide both 𝔟R=S𝔟 and R𝔟=𝔟S conventions and the induced anti-linear coefficient ratio. |
| `PAPER-GROSS-ZAGIER-86/175` | requested | `AutomorphicFormsOnReductiveGroups:AF.1` | Scalar modular forms of weight 2k and polynomial growth at every cusp, trace of levels and Petersson integrability against cusp forms; import their actual classical realization. |
| `PAPER-GROSS-ZAGIER-86/191` | requested | `AnalyticNumberTheory:AN.4` | Genus characters of the ideal class group, ordered fundamental discriminant factorizations, quadratic character evaluations and theta transformation under ramified ideals. |
| `PAPER-GROSS-ZAGIER-86/232` | requested | `AnalyticNumberTheory:AN.4` | The norm representation and genus criterion with Nn+l≡0 mod D and l a norm from the specified class. This hypothesis is necessary for the divisor complement identities. |
| `PAPER-GROSS-ZAGIER-86/260` | requested | `AutomorphicSpectralTheory:AS.4` | Regularized Petersson holomorphic projection in weight two with logarithmic cusp growth, Fourier Mellin finite parts, continuation bounds and orthogonality of boundary Eisenstein families. |
| `PAPER-GROSS-ZAGIER-86/293` | requested | `HeegnerPointEulerSystems:HE.1` | The field-of-definition and complex conjugation of classical Heegner points and their modular images, in the source Artin/Fricke convention. |
| `PAPER-GROSS-ZAGIER-86/7` | planned | [GZ.0/heegner-unit-index](#heegner-unit-index) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/14` | planned | [GZ.2/arithmetic-intersection-gluing](#arithmetic-intersection-gluing) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/15` | planned | [GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions](#hodge-index-theorem-and-admissible-arithmetic-extensions) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/27` | planned | [GZ.1/character-height-pairing](#character-height-pairing) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/284` | planned | [GZ.1/character-height-pairing](#character-height-pairing) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/48` | planned | [GZ.7/classical-tangent-symbol](#classical-tangent-symbol) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/104` | planned | [GZ.7/classical-tangent-symbol](#classical-tangent-symbol) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/49` | planned | [GZ.6/classical-projected-derivative-cuspform](#classical-projected-derivative-cuspform) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/278` | planned | [GZ.6/classical-height-series-cuspidality](#classical-height-series-cuspidality) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/292` | planned | [GZ.3/manin-constant](#manin-constant) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/114` | planned | [GZ.7/classical-inert-height-sum](#classical-inert-height-sum) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/254` | planned | [GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof](#waldspurger-period-formula-and-its-siegel-weil-proof) | Same normalized construction/comparison as the existing node; this announcement or application does not create a duplicate owner. |
| `PAPER-GROSS-ZAGIER-86/26` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-GROSS-ZAGIER-86/28` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-GROSS-ZAGIER-86/31` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-GROSS-ZAGIER-86/35` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-GROSS-ZAGIER-86/52` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-GROSS-ZAGIER-86/282` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-GROSS-ZAGIER-86/285` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-GROSS-ZAGIER-86/286` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-GROSS-ZAGIER-86/287` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-GROSS-ZAGIER-86/295` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-GROSS-ZAGIER-86/304` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-GROSS-ZAGIER-86/307` | out-of-scope | `GZ.8` | The final global Gross–Zagier identity or its rank/nonvanishing corollary is owned by GZ.8; this part supplies its GZ.0–GZ.7 inputs and does not replan the final theorem. |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/131` | planned | [GZ.5/half-weight-waldspurger-value](#half-weight-waldspurger-value) | Explicit GZ.5 central-value identity with the Maass/theta inputs requested from their existing owners and source gate S6 retained. |

## Validation and implementation status

The packet checker reports 0 errors and 0 warnings. Its source-issue section passes the errata checker in a scratch wrapper with the required errata protocol. The owned dependency graph is acyclic. The suggested file and catalogue names are checked together.

The full suggested file was not compiled: the shared build lacks the pinned Tau Ceti canonical-height compiled module. No library builds, updates or cache downloads were run. Mathlib-only signatures are checked separately where the shared pinned build permits it; the handoff records the exact checked extent. Those elaborations check signatures and normalization examples with admitted proofs, and claim no formalization.
