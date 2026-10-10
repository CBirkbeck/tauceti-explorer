# Gross–Zagier formulas and arithmetic heights: GZ.0–GZ.7

This part builds the normalizations, pairings and kernels needed to compare a
Rankin central derivative with an arithmetic height. The final Gross–Zagier
identities themselves belong to GZ.8. The plan begins at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

All eight layers are **planned** at target granularity. A planned layer means
each of its targets has an exact mathematical node or import, and the prerequisites
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
The packet records the older upstream text/code discrepancy. Current Tau Ceti
`a91d3aa` instead defines the full x-height limit and its matching polar form.
This dictionary is tied to the pin; migration must import that current implementation
and translate the factors rather than introduce another height machine.

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

## Revision and ownership

The independent revision review accepts the corrected target pass: 243 nodes,
50 confirmed baseline citations and 78 precise supplier requests. The packet
retains all earlier review decisions as history. Proofs and geometric carriers
remain unfinished at the stated gates.

- **Arithmetic Hodge line.** R12.5 gives differential/q-expansion input, R13.3 the cusp/stabilizer geometry and R13.4a the coarse generic model. R18.2 remains the exact arithmetic-Hodge-line request. GZ.3 owns the normalized arithmetic Hodge comparison. R14.6 is the owner of the requested bad-prime differential-patching extension; its present good-prime packet does not establish that extension or the Hodge line.
- **Petersson composition.** AF.2/AF.3 supply classical/adelic forms and their Petersson tensor interfaces; R14.3/weight-two-shimura-isomorphism and R14.3/cup-product-petersson supply the actual differential/cup-product normalization. GZ.3 owns the quaternionic realization and volume comparison.
- **Picard modularity.** R14.2/jacobian-and-functoriality and R14.2/hecke-operators-on-the-jacobian supply the geometric operations. GZ.6 proves the Picard-generating-series modularity. R14.4 is not a supplier of that theorem.
- **CM lifting lengths.** R07.2 owns the requested nilpotent p-divisible deformation extension; its current finer packet supplies perfect-field classification, so deformation and endomorphism lifting remain requested. CM.5/HE.2 own the CM endomorphism and level filtrations. GZ.7 owns the specialized length calculation.
- **Adelic density.** The pinned mixed-place weakApproximation_denseRange supplies entrywise matrix density on a finite set of completions, followed by the open determinant-nonzero restriction and adjustment outside that set. No AF.1 density request remains and no strong approximation claim for GL₂ is used.
- **Iwasawa carriers.** R16.1/iwasawa-cartan supplies local BK/Cartan and real O(2)/U(2) data with δ_B=|a/d|. GZ.6 computes the Weil half-density and phase; AS.2 remains only the genuine analytic spectral/Green supplier.
- **Connecting ideals.** CM.5/supersingular-curve-versus-level-pair distinguishes the maximal endomorphism order of a supersingular curve from the Eichler order of the level pair. GZ.7 owns the connecting-Hom-ideal orientation and its norm identities.
- **Growth bounds.** AF.5/gl2-classical-to-adelic and AF.2/adelic-classical-bijection supply passage for forms. GZ.6 proves the needed theta/Eisenstein coefficient and growth estimates. Cuspidality is not a moderate-growth theorem for those kernels.
- **Integral level models.** R12.3, R13.3, R13.4a and R13.4b supply compactification, Tate charts, integral/coarse models and their comparison. GZ.7 owns the eta/stabilizer tensor comparison, sourced to Conrad. The generic Jacobian carrier is insufficient.
- **Transfer versus arithmetic orders.** R16.2/local-classification and R17.1/local-quaternionic-comparison/real-quaternionic-comparison supply representation transfer. CM.5 supplies arithmetic orders. No mixed request treats one as the other.
- **Tunnell–Saito.** GZ.4 owns the multiplicity-one/epsilon-criterion proof, with primary Saito dyadic support. AL.3 supplies epsilon factors and R16/R17 transfer. The ET.6 request is removed; split and real cases retain their own hypotheses.
- **Polarization normalization.** A2/normalized-poincare-comparison, A2/mumford-map-and-biextension and A2/polarization-representatives-and-graph supply the algebraic biextension and φ_M=2λ comparison. RP.0 supplies canonical heights. GZ.1 owns the resulting full-polarization height comparison.

## Reading the target catalogue

Each entry records the mathematical statement, exact hypotheses, construction or proof route, direct inputs and source passages. Definition and construction entries also give uses, every API item and at least three mathematical tests. Shared hypotheses are displayed once below and referenced by stable labels. The packet retains the full hypotheses on each node.

The suggested file has 6 typed target signatures, 75 algebraic fragments and
162 omitted target signatures. Its 274 API items comprise 23 typed signatures,
205 fragments and 46 omissions. Its 202 mathematical tests comprise 20 typed
examples, 166 fragment examples and 16 omissions. The ledger records the actual
status of every name. The fragments exercise separate operations in
`TauCeti.GrossZagier.AlgebraicFragments`; they do not instantiate the geometric
tests. Elaboration with admitted proofs is recorded separately in the review.

### Exact shared hypotheses

- **H1:** K=ℚ(√D), D<0 a fundamental discriminant; ε=(D/·), h=#Cl(K), w=#O_K×=2u; A an ideal class; r_A(n) counts integral ideals of norm n and r_A(0)=1/w.
- **H2:** N≥1 is prime to D; f is a weight-2k newform, k≥1, with a(1)=1 where eigenform normalization is used. Petersson pairing is linear in the first argument, with y^(2k)dxdy/y² and no implicit volume division.
- **H3:** For the classical Heegner local statements: D is odd, D≡square mod4N, every p|N splits in K; x is the CM cyclic N-isogeny diagram over the Hilbert class field H, c=(x)−∞, d=(x)−0; σ corresponds to A under the stated Artin convention.
- **H4:** m≥1 with gcd(m,N)=1. At a finite place v|p, ord_v(π)=1, q_v=#κ(v); W is the completed maximal unramified extension of O_Hv. Actual chosen integral diagrams, not a canonical Hom functor of arbitrary coarse Artinian points, are used.
- **H5:** F is totally real, E/F is CM quadratic with character η; additive characters and self-dual measures follow the source
- **H6:** When quaternionic data occur, 𝔅 is totally definite incoherent with an embedding E𝔸→𝔅; B(v) is its nearby coherent algebra
- **H7:** For §7.2 computations: |Σ(𝔅)|>1; no finite place is ramified in both E and 𝔅; U=Ô𝔅× for a chosen maximal order Ô𝔅⊃ÔE
- **H8:** N_v is residue cardinality, d_v the different of F_v/ℚ_p, D_v the relative discriminant of E_v/F_v; arithmetic degrees are relative to F
- **H9:** φ has all five §7.2 local components; S² has two E-split, ℚ-unramified places; original 𝔧 belongs to 𝔅, nearby j to B(v)
- **H10:** Off-diagonal resolvent sums are formed initially for Re(s)>1; use Laurent continuation, rather than an unregularized sum at s=1.
- **H11:** N>1 where the marked cusps 0 and ∞ must be distinct.
- **H12:** C is a compact connected Riemann surface of genus g>0
- **H13:** ddᶜ=(i/π)∂∂̄ and metrics use ‖1‖=exp(−g), rather than exp(−g/2)

These labels apply only where an entry lists them. Local restrictions in that entry apply in addition.

### Shared mathematical notation

**C1.** Standing notation of Chapter I: N ≥ 1 an integer (N > 1 is assumed in the proof, §9; N = 1 is treated in [18]); X = X₀(N) over ℚ, J = Jac(X); K = ℚ(√D) imaginary quadratic with discriminant D, (D, N) = 1, and D odd (hence D ≡ 1 mod 4 and squarefree, so (D, 2N) = 1; D = −3 is allowed, D = −4 is excluded); O = O_K; h = #Pic(O); u = #(O^×/{±1}) (u = 1 unless D = −3, then u = 3); ε = (D/·) the quadratic character of K/ℚ; H = K(j(E)) the Hilbert class field; the Heegner hypothesis D ≡ β² (mod 4N) for some β ∈ ℤ (equivalently, every prime p | N splits in K); x a Heegner point of discriminant D on X; c = class of (x) − (∞) in J(H); σ ∈ Gal(H/K) corresponds to the ideal class 𝒜 ∈ Cl_K under the Artin isomorphism; ⟨ , ⟩ the global (Néron–Tate) height pairing over H extended Hermitian to J(H) ⊗ ℂ; ( , ) the Petersson product (5.1).

**C2.** Standing notation (Chap. I §3, restated p. 233): K imaginary quadratic, discriminant D, 𝒪 = 𝒪_K, (D, N) = 1, D odd (hence squarefree, D ≡ 1 mod 4), D ≡ square (mod 4N) (all p | N split in K); H = Hilbert class field, Cl_K ≅ Gal(H/K); u = #𝒪^×/2; t = number of prime factors of D; s = number of prime factors of N; Γ = Γ₀(N) ⊂ PSL₂(ℤ); 𝔥 = upper half-plane; R_N = (ℤ ℤ; Nℤ ℤ); m ≥ 1 with (m, N) = 1; √D = i√|D|.

**C3.** Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν.

**C4.** Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0).

**C5.** Standing notation (Ch. III): N > 1 (GZ's standing assumption; for N = 1 the cusps ∞ and 0 coincide and c, T_m d^σ always share them); K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0).

**C6.** Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}.

**C7.** Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3).

**C8.** Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1.

**C9.** Standing notation of Chap. V §1 (= Chaps. II–III): as in Chap. IV and moreover every prime p | N splits in K; H = Hilbert class field of K; x ∈ X₀(N)(H) a Heegner point of discriminant D (one of the 2^s·h such points, permuted simply transitively by W × Gal(H/K), W = Atkin–Lehner group); J = J₀(N) = Jac X₀(N); c = class of (x) − (∞), d = class of (x) − (0) in J(H); σ ∈ G = Gal(H/K) corresponds to 𝒜 under the Artin map; <,> = global Néron–Tate height pairing on J(H) (heights over H), extended to J(H)⊗ℂ as a hermitian pairing; 𝕋 = ℚ-subalgebra of End_ℚ(J)⊗ℚ generated by the Hecke operators T_m.

The modified finite intersection is I_v^GZ. For a diagonal term, the local
symbol of a chosen cotangent may differ by Conrad's tensor correction. For the
weight-six discriminant tensor define

\[
 J_v=I_v^{GZ}-\frac{r_A(m)}{r_x+6}\operatorname{ord}_{(v,x)}(\Delta),
 \qquad r_x+6=6/u.
\]

The finite p-height contributions here sum −J_v log q_v. The corresponding
complex terms use the eta-normalized limit; their global sum follows from the
tensor comparison and product formula. This prevents an exceptional stabilizer
from being treated as a harmless local change of coordinate. The ordinary
local symbol is recovered directly on disjoint supports.

The arithmetic height kernel uses the starred torus integral of the public
2011 draft: compact central probability averaging followed by integration on
[T] with the quotient measure. Its normalized regularized average divides by
vol([T])=2L(1,η). For suitable finite-level CM data that average is a finite-orbit
average. This central operation is separate from the later spectral projection.

## GZ.0: Height and normalization dictionary

Layer status: **planned**, implementation unchecked.

### The x-height canonical height ĥ_x

`GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height` · definition · `WeierstrassCurve.Affine.Point.xCanonicalHeight`

For an elliptic curve given by a Weierstrass equation W over a field K with admissible absolute values, the x-height canonical height is ĥ_x(P) = lim_{n→∞} h(x(2ⁿP))/4ⁿ, where h is Tau Ceti's naïve height of the x-coordinate (Point.naiveHeight). It equals 2 · Point.canonicalHeight P, where Tau Ceti's canonicalHeight carries the factor 1/2 and is the height attached to the divisor (O) (Silverman's normalisation). ĥ_x is the height attached to 2(O), and uses the x-height rather than the (O)-height convention. Over a number field K with NumberField.instAdmissibleAbsValues, this height is relative: it is [K:ℚ] times the absolute x-canonical height of Müller–Stoll. Over ℚ it agrees with the LMFDB convention used for the BSD regulator.

**Hypotheses.**

- W elliptic ([W.toAffine.IsElliptic]); K with Height.AdmissibleAbsValues.

**Inputs.** `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight`, `tauceti:WeierstrassCurve.Affine.Point.naiveHeight`, `tauceti:WeierstrassCurve.Affine.Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_nsmul`, `mathlib:Filter.Tendsto`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_nonneg`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder`.

**Construction or proof.**

1. Tau Ceti's Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow: h(2ⁿP)/(2·4ⁿ) tends to canonicalHeight P, so h(2ⁿP)/4ⁿ tends to 2·canonicalHeight P. Hence ĥ_x is a limit, not a junk limUnder value.
2. Consequences: ĥ_x(nP) = n²ĥ_x(P) (Point.canonicalHeight_nsmul), and ĥ_x ≥ 0 (Point.canonicalHeight_nonneg). Under Northcott finiteness for Point.canonicalHeight, and only with this additional hypothesis, ĥ_x(P) = 0 iff P is torsion.

**Uses.**

- `GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing`: Its associated bilinear form is the BSD pairing.
- `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`: The BSD regulator is its Gram determinant.
- `RankZeroOneBSD:BSD.3`: The rank-one BSD formula reads L′(E,1)/Ω = ĥ_x(P)·#Ш·∏c_p/#E(ℚ)²_tors.
- `GrossZagierAndArithmeticHeights:GZ.1`: The Poincaré-biextension height of GZ.1 is compared with it.

**Planning API.**

- `WeierstrassCurve.Affine.Point.xCanonicalHeight` (constructor; typed-signature): Point.xCanonicalHeight P := 2 * P.canonicalHeight.
- `WeierstrassCurve.Affine.Point.tendsto_naiveHeight_div_four_pow` (characterisation; typed-signature): Tendsto (fun n ↦ ((2^n) • P).naiveHeight / 4^n) atTop (𝓝 P.xCanonicalHeight).
- `WeierstrassCurve.Affine.Point.xCanonicalHeight_eq_two_mul` (compatibility; typed-signature): P.xCanonicalHeight = 2 * P.canonicalHeight (the comparison with Tau Ceti's normalisation).
- `WeierstrassCurve.Affine.Point.xCanonicalHeight_nsmul` (simp; typed-signature): (n • P).xCanonicalHeight = n^2 * P.xCanonicalHeight.
- `WeierstrassCurve.Affine.Point.xCanonicalHeight_eq_zero_iff` (characterisation; typed-signature): P.xCanonicalHeight = 0 ↔ IsOfFinAddOrder P, under Northcott finiteness as for canonicalHeight.

**Mathematical unit tests.**

- `WeierstrassCurve.Affine.Point.xCanonicalHeight_zero` (degenerate; typed-example): (0 : W.Point).xCanonicalHeight = 0.
- `WeierstrassCurve.Affine.Point.xCanonicalHeight_ne_canonicalHeight` (non-example; typed-example): Under Northcott finiteness for Point.canonicalHeight, a point of infinite order has xCanonicalHeight P ≠ canonicalHeight P: the positive height changes by the factor 2.
- `WeierstrassCurve.Affine.Point.xCanonicalHeight_two_nsmul` (computation; typed-example): ((2 : ℕ) • P).xCanonicalHeight = 4 * P.xCanonicalHeight.
- `WeierstrassCurve.Affine.Point.xCanonicalHeight_eq_neronTatePairing` (compatibility; typed-example): P.xCanonicalHeight = 2 * neronTatePairing W P P: Tau Ceti's pairing on the diagonal is half of ĥ_x.

**Acceptance.**

- For 37.a1 (y² + y = x³ − x) and P = (0, 0): ĥ_x(P) = 0.0511114082… (LMFDB), so canonicalHeight P = 0.0255557041….

**Lean correspondence.** All carriers of the written target and its listed API/tests are supplied by the pinned elliptic-height, number-field or analytic function interfaces. Proofs remain admitted.

`WeierstrassCurve.Affine.Point.xCanonicalHeight` — typed-signature.

**Sources.**

- [Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2), §3, p. 3 (arXiv v2).
- [Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2), Remark 3.1, p. 4 (arXiv v2).
- [The L-functions and modular forms database](https://www.lmfdb.org/EllipticCurve/Q/37a1/), 37.a1 curve page, Mordell–Weil generators and BSD invariants/computation conventions (accessed2026-10-10).

### The BSD height pairing

`GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing` · definition · `WeierstrassCurve.Affine.bsdHeightPairing`

The BSD height pairing is ⟨P, Q⟩_BSD = ĥ(P + Q) − ĥ(P) − ĥ(Q) with ĥ = Tau Ceti's canonicalHeight, the polar form of the (O)-normalised height. Equivalently it is the halved polar form of ĥ_x, and ⟨P, Q⟩_BSD = 2 · neronTatePairing W P Q, where Tau Ceti's neronTatePairing is QuadraticMap.associated', the halved polar form of ĥ. On the diagonal ⟨P, P⟩_BSD = ĥ_x(P) = 2ĥ(P). This is the pairing whose Gram determinant is the regulator in the Birch–Swinnerton-Dyer formula.

**Hypotheses.**

- W elliptic.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height`, `tauceti:WeierstrassCurve.Affine.canonicalHeightQuadratic`, `tauceti:WeierstrassCurve.Affine.neronTatePairing`, `tauceti:WeierstrassCurve.Affine.neronTatePairing_apply`, `tauceti:WeierstrassCurve.Affine.neronTatePairing_self`, `mathlib:QuadraticMap.polar`, `mathlib:QuadraticMap.polarBilin`, `mathlib:QuadraticMap.associated`.

**Construction or proof.**

1. ⟨,⟩_BSD = QuadraticMap.polar of canonicalHeightQuadratic, which is bilinear because ĥ satisfies the parallelogram law exactly.
2. neronTatePairing_apply gives neronTatePairing W P Q = (ĥ(P + Q) − ĥ(P) − ĥ(Q))/2, so ⟨,⟩_BSD = 2 • neronTatePairing W.
3. On the diagonal: polar(ĥ)(P, P) = ĥ(2P) − 2ĥ(P) = 2ĥ(P) = ĥ_x(P).

**Uses.**

- `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`: Its Gram determinant is the BSD regulator.
- `GrossZagierAndArithmeticHeights:GZ.1`: The pairing induced by the Poincaré biextension and the principal polarisation is compared with it.
- `RankZeroOneBSD:BSD.3`: The BSD consumers state their regulators against it.

**Planning API.**

- `WeierstrassCurve.Affine.bsdHeightPairing` (constructor; typed-signature): bsdHeightPairing W : LinearMap.BilinMap ℤ W.Point ℝ := QuadraticMap.polarBilin (canonicalHeightQuadratic W).
- `WeierstrassCurve.Affine.bsdHeightPairing_apply` (characterisation; typed-signature): bsdHeightPairing W P Q = (P + Q).canonicalHeight − P.canonicalHeight − Q.canonicalHeight.
- `WeierstrassCurve.Affine.bsdHeightPairing_eq_two_smul` (compatibility; typed-signature): bsdHeightPairing W = 2 • neronTatePairing W.
- `WeierstrassCurve.Affine.bsdHeightPairing_self` (simp; typed-signature): bsdHeightPairing W P P = P.xCanonicalHeight.
- `WeierstrassCurve.Affine.bsdHeightPairing_comm` (relation; typed-signature): bsdHeightPairing W P Q = bsdHeightPairing W Q P.
- `WeierstrassCurve.Affine.bsdHeightPairing_eq_zero_of_isOfFinAddOrder_left` (other; typed-signature): The pairing kills torsion.

**Mathematical unit tests.**

- `WeierstrassCurve.Affine.bsdHeightPairing_self_zero` (degenerate; typed-example): bsdHeightPairing W 0 0 = 0.
- `WeierstrassCurve.Affine.bsdHeightPairing_ne_neronTatePairing` (non-example; typed-example): Under Northcott finiteness for canonicalHeight, an infinite-order P has bsdHeightPairing W P P ≠ neronTatePairing W P P.
- `WeierstrassCurve.Affine.bsdHeightPairing_two_nsmul` (computation; typed-example): bsdHeightPairing W (2 • P) P = 2 * P.xCanonicalHeight.
- `WeierstrassCurve.Affine.bsdHeightPairing_self_eq_two_mul` (compatibility; typed-example): bsdHeightPairing W P P = 2 * P.canonicalHeight.

**Acceptance.**

- For 37.a1: ⟨(0,0), (0,0)⟩_BSD = 0.0511114082…, the LMFDB regulator, while neronTatePairing W (0,0) (0,0) = 0.0255557041….

**Lean correspondence.** All carriers of the written target and its listed API/tests are supplied by the pinned elliptic-height, number-field or analytic function interfaces. Proofs remain admitted.

`WeierstrassCurve.Affine.bsdHeightPairing` — typed-signature.

**Sources.**

- [Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2), §1, p. 1 (arXiv v2).
- [The L-functions and modular forms database](https://www.lmfdb.org/EllipticCurve/Q/37a1/), Elliptic curve 37.a1, BSD invariants (accessed 2026-09-28).
- [Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2), Remark 3.1, p. 4 (arXiv v2).

### The BSD regulator, and Tau Ceti's regulator

`GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator` · definition · `WeierstrassCurve.Affine.bsdRegulator`

For W elliptic with E(K)/tors finitely generated of rank r, the BSD regulator is Reg_BSD = |det Gram(⟨,⟩_BSD)| on any ℤ-basis of E(K)/tors, and it equals 2^r · regulator W, where Tau Ceti's regulator is the Gram determinant of the halved pairing neronTatePairing. The Birch–Swinnerton-Dyer quotient is stated with Reg_BSD. In rank zero both regulators are one. In positive rank they differ if the pinned regulator is nonzero; Northcott positivity is sufficient for this extra condition.

**Hypotheses.**

- W elliptic; [Module.Finite ℤ (PointModTorsion W)]; r = finrank ℤ (PointModTorsion W).

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing`, `mathlib:Matrix.det_smul`, `tauceti:WeierstrassCurve.Affine.regulator`, `tauceti:WeierstrassCurve.Affine.regulator_eq_abs_det_neronTateGramMatrix`, `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`, `tauceti:WeierstrassCurve.Affine.neronTateGramMatrix`, `tauceti:WeierstrassCurve.Affine.PointModTorsion`, `mathlib:Module.finrank`.

**Construction or proof.**

1. ⟨,⟩_BSD = 2 • neronTatePairing (GZ.0/bsd-height-pairing), so on any basis Gram(⟨,⟩_BSD) = 2 • neronTateGramMatrix.
2. Apply Mathlib Matrix.det_smul to the Gram matrix; take absolute values and use regulator_eq_abs_det_neronTateGramMatrix. Basis independence is inherited from the pinned regulator theorem.

**Uses.**

- `RankZeroOneBSD:BSD.3`: The BSD quotient for rank one uses Reg_BSD.
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`: The arithmetic BSD quotient of Layer 7 must use Reg_BSD, not regulator (request below).
- `GrossZagierAndArithmeticHeights:GZ.8`: Explicit Gross–Zagier specialisations compare ĥ with L′ through this regulator.

**Planning API.**

- `WeierstrassCurve.Affine.bsdRegulator` (constructor; typed-signature): bsdRegulator W := |det (2 • neronTateGramMatrix W (Module.finBasis ℤ (PointModTorsion W)))|, the Gram determinant of the BSD pairing descended to E(K)/tors.
- `WeierstrassCurve.Affine.bsdRegulator_eq_two_pow_mul_regulator` (compatibility; typed-signature): bsdRegulator W = 2 ^ finrank ℤ (PointModTorsion W) * regulator W.
- `WeierstrassCurve.Affine.bsdRegulator_eq_abs_det` (characterisation; typed-signature): Any ℤ-basis of PointModTorsion W computes bsdRegulator W.
- `WeierstrassCurve.Affine.bsdRegulator_of_finrank_eq_zero` (simp; typed-signature): bsdRegulator W = 1 in rank 0.
- `WeierstrassCurve.Affine.bsdRegulator_of_finrank_eq_one` (characterisation; typed-signature): In rank 1 with generator P of E(K)/tors, bsdRegulator W = P.xCanonicalHeight.

**Mathematical unit tests.**

- `WeierstrassCurve.Affine.bsdRegulator_rank_zero` (degenerate; typed-example): In rank 0, bsdRegulator W = regulator W = 1.
- `WeierstrassCurve.Affine.bsdRegulator_rank_one` (computation; typed-example): In rank 1, bsdRegulator W = 2 * regulator W.
- `WeierstrassCurve.Affine.bsdRegulator_ne_regulator` (non-example; typed-example): In positive rank and with regulator W ≠ 0 (for example under Northcott positivity), bsdRegulator W ≠ regulator W.
- `WeierstrassCurve.Affine.bsdRegulator_eq_xCanonicalHeight` (compatibility; typed-example): In rank 1, bsdRegulator W equals ĥ_x of a generator, the LMFDB value 0.0511114082… for 37.a1.

**Acceptance.**

- 37.a1 (rank 1): Reg_BSD = 0.0511114082… and Ω = 5.9869172924…, so Ω·Reg_BSD = 0.3059997738… = L′(E, 1), with Ш, c_p and torsion all 1 (LMFDB). Tau Ceti's regulator is 0.0255557041… there, and Ω·regulator = L′(E,1)/2.
- Rank 0: Reg_BSD = regulator = 1 (regulator_eq_one_of_finrank_eq_zero).

**Lean correspondence.** All carriers of the written target and its listed API/tests are supplied by the pinned elliptic-height, number-field or analytic function interfaces. Proofs remain admitted.

`WeierstrassCurve.Affine.bsdRegulator` — typed-signature.

**Sources.**

- [The L-functions and modular forms database](https://www.lmfdb.org/EllipticCurve/Q/37a1/), Elliptic curve 37.a1, BSD invariants (accessed 2026-09-28).
- [Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2), §1, p. 1 (arXiv v2).
- [Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2), Remark 3.1, p. 4 (arXiv v2).

### The dictionary of height conventions

`GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary` · comparison · `TauCeti.GrossZagier.heightConventions`

At Tau Ceti f790474, canonicalHeight is one half of the doubling limit of the logarithmic x-height, hence the height for (O). Its neronTatePairing is the halved polarization, with diagonal canonicalHeight. The full polarization used by YZZ has diagonal twice canonicalHeight and its rank-r regulator is 2^r times the Tau Ceti regulator. Mathlib supplies NumberField.instAdmissibleAbsValues: the coordinate logHeight₁ is relative, weighted by local degrees, and its total weight is [K:ℚ]. Dividing by this total weight gives the absolute normalization; heights relative to F are [F:ℚ] times absolute heights. Field-extension comparisons require the explicit compatible-place theorem imported from RP.0.

**Hypotheses.**

- None.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.0/x-height-canonical-height`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `tauceti:WeierstrassCurve.Affine.Point.naiveHeight`, `mathlib:NumberField.instAdmissibleAbsValues`, `mathlib:NumberField.totalWeight_eq_finrank`, `HeightsRationalPointsAndObstructions:RP.0`.

**Construction or proof.**

1. Read the pinned canonicalHeight half-limit, neronTatePairing half-polarization and regulator Gram determinant; compare the source full polarization.
2. Use the existing Mathlib NumberField admissible absolute values and totalWeight=[K:ℚ], then request the general RP.0 compatible-extension theorem.
3. Check the real-component period and rank-one regulator convention against the source normalization example.

**Acceptance.**

- No consumer infers a factor of 2 from the name 'Néron–Tate': every formula states which of canonicalHeight, xCanonicalHeight, neronTatePairing or bsdHeightPairing it uses.
- A BSD consumer that uses Tau Ceti's regulator W directly is off by 2^r; in rank 1 this is a factor of 2 in the 2-part of Ш.

**Lean correspondence.** The written heightConventions theorem supplies the three elliptic factor-of-two comparisons. The relative/absolute number-field dictionary and compatible finite-extension comparison stated by this target remain unwritten; RP.0 is the precise supplier for the latter.

`TauCeti.GrossZagier.heightConventions` — algebraic-fragment.

**Sources.**

- [Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2), Remark 3.1, p. 4 (arXiv v2).
- [Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2), §3, p. 3 (arXiv v2).
- [The L-functions and modular forms database](https://www.lmfdb.org/EllipticCurve/Q/37a1/), Elliptic curve 37.a1, BSD invariants (accessed 2026-09-28).
- [The L-functions and modular forms database](https://www.lmfdb.org/EllipticCurve/Q/37a1/), 37.a1 curve page, Mordell–Weil generators and BSD invariants/computation conventions (accessed2026-10-10).

### The canonical height on E(K) ⊗ ℚ

`GrossZagierAndArithmeticHeights:GZ.0/canonical-height-rational` · construction · `WeierstrassCurve.Affine.canonicalHeightRat`

The canonical height extends uniquely to a quadratic form ĥ_ℚ on the ℚ-vector space E(K) ⊗_ℤ ℚ with ĥ_ℚ(P ⊗ q) = q²·ĥ(P); torsion goes to zero. The same holds for ĥ_x and the two pairings. Averages of points, such as a normalised average of a Galois orbit, live here.

**Hypotheses.**

- W elliptic.

**Inputs.** `tauceti:WeierstrassCurve.Affine.canonicalHeightQuadratic`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_nsmul`, `mathlib:QuadraticMap`, `mathlib:TensorProduct`, `mathlib:QuadraticMap.map_smul`, `HeightsRationalPointsAndObstructions:RP.0`.

**Construction or proof.**

1. ĥ is a ℤ-quadratic map W.Point → ℝ (canonicalHeightQuadratic) and ℝ is a ℚ-vector space; a ℤ-quadratic map into a ℚ-vector space extends uniquely along M → M ⊗ ℚ, because M ⊗ ℚ is the localisation of M at the nonzero integers and ĥ(nP) = n²ĥ(P) forces the value on P ⊗ (1/n).
2. Torsion maps to zero in M ⊗ ℚ, consistently with ĥ vanishing on torsion.

**Uses.**

- `GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average`: Heights of averages of Galois orbits are computed in E(K) ⊗ ℚ.
- `GrossZagierAndArithmeticHeights:GZ.8`: Gross–Zagier formulas are identities of pairings on A(K)_ℚ ⊗ A∨(K)_ℚ.
- `HeegnerPointEulerSystems:HE.1`: Normalised Heegner points with denominators u are points of E(K) ⊗ ℚ.

**Planning API.**

- `WeierstrassCurve.Affine.canonicalHeightRat` (constructor; typed-signature): canonicalHeightRat W : QuadraticMap ℚ (W.Point ⊗[ℤ] ℚ) ℝ.
- `WeierstrassCurve.Affine.canonicalHeightRat_tmul` (simp; typed-signature): canonicalHeightRat W (P ⊗ₜ q) = q^2 * P.canonicalHeight.
- `WeierstrassCurve.Affine.canonicalHeightRat_unique` (universal-property; typed-signature): It is the unique ℚ-quadratic map agreeing with canonicalHeight on P ⊗ₜ 1.
- `WeierstrassCurve.Affine.canonicalHeightRat_nonneg` (other; typed-signature): canonicalHeightRat W x ≥ 0.

**Mathematical unit tests.**

- `WeierstrassCurve.Affine.canonicalHeightRat_inv_nat` (computation; typed-example): canonicalHeightRat W (P ⊗ₜ (1/m : ℚ)) = P.canonicalHeight / m^2.
- `WeierstrassCurve.Affine.canonicalHeightRat_torsion` (degenerate; typed-example): For torsion P, canonicalHeightRat W (P ⊗ₜ 1) = 0.
- `WeierstrassCurve.Affine.canonicalHeightRat_one` (compatibility; typed-example): canonicalHeightRat W (P ⊗ₜ 1) = P.canonicalHeight.
- `WeierstrassCurve.Affine.canonicalHeightRat_not_linear` (non-example; typed-example): Under Northcott finiteness, canonicalHeightRat W (P ⊗ₜ 2) ≠ 2 * P.canonicalHeight for infinite-order P: the positive height is quadratic.

**Acceptance.**

- ĥ_ℚ(P ⊗ (1/m)) = ĥ(P)/m².

**Lean correspondence.** All carriers of the written target and its listed API/tests are supplied by the pinned elliptic-height, number-field or analytic function interfaces. Proofs remain admitted.

`WeierstrassCurve.Affine.canonicalHeightRat` — typed-signature.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), §1, after Theorem 1.1, p. 2 (arXiv v2).

### Trace versus normalised average of a Galois orbit

`GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average` · lemma · `WeierstrassCurve.Affine.canonicalHeightRat_average`

Let H/K be a finite Galois extension of degree h and P ∈ E(H). The trace Tr(P) = Σ_{σ ∈ Gal(H/K)} σP lies in E(K), and the normalised average Av(P) = (1/h)·Tr(P) lies in E(K) ⊗ ℚ. Then ĥ_ℚ(Av(P)) = ĥ(Tr P)/h², and the same factor relates any pairing of averages to the pairing of traces. A formula written with averages and one written with traces differ by h² in every height.

**Hypotheses.**

- H/K Galois of degree h; the heights over H and over K are compared by the same normalisation.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.0/canonical-height-rational`, `mathlib:IsGalois`.

**Construction or proof.**

1. Av(P) = Tr(P) ⊗ (1/h), and GZ.0/canonical-height-rational gives the factor (1/h)².

**Acceptance.**

- Cai–Shu–Tian take the trace P_K(f) = Tr_{H_K/K} f(P) ∈ E(K); an average-based statement of the same formula carries h_K² in its constant.

**Lean correspondence.** A finite Galois extension, its action on the elliptic point group, the trace landing in E(K), and compatible relative-height normalization. The retained rational-height average is only the quadratic scaling step.

`WeierstrassCurve.Affine.canonicalHeightRat_average` — algebraic-fragment.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), §1, after Theorem 1.1, p. 2 (arXiv v2).

### The motivic centre s = 1 and the unitary centre s = 1/2

`GrossZagierAndArithmeticHeights:GZ.0/unitary-and-motivic-centres` · lemma · `TauCeti.GrossZagier.deriv_completed_at_one_of_eq_zero`

Let L(E, s) be the motivic L-function of an elliptic curve over ℚ of conductor N (centre s = 1), L(s, π_E) := L(E, s + 1/2) its unitary normalisation (centre s = 1/2), and Λ(E, s) := N^{s/2}·Γ_ℂ(s)·L(E, s) the completed function with Mathlib's Γ_ℂ(s) = 2(2π)^{−s}Γ(s). If L(E, ·) is differentiable at 1 and L(E, 1) = 0, then (d/ds)L(s, π_E) at s = 1/2 equals L′(E, 1), and Λ′(E, 1) = N^{1/2}·π^{−1}·L′(E, 1). With the other common convention Λ = N^{s/2}(2π)^{−s}Γ(s)L, the factor is N^{1/2}(2π)^{−1}.

**Hypotheses.**

- L(E, ·) differentiable at 1 with L(E, 1) = 0 (the case of odd analytic rank).

**Inputs.** `mathlib:Complex.Gammaℂ`, `mathlib:Complex.Gammaℂ_def`, `mathlib:Complex.Gamma_one`, `mathlib:deriv_mul`, `mathlib:HasDerivAt.mul`.

**Construction or proof.**

1. The shift s ↦ s + 1/2 has derivative 1.
2. Product rule (deriv_mul) at a zero of L: (G·L)′(1) = G(1)·L′(1) + G′(1)·L(1) = G(1)·L′(1).
3. G(1) = N^{1/2}·Γ_ℂ(1) = N^{1/2}·2(2π)^{−1}Γ(1) = N^{1/2}/π (Complex.Gammaℂ_def, Complex.Gamma_one).

**Acceptance.**

- The factor 2 between Γ_ℂ and (2π)^{−s}Γ(s) is a convention and must be written, not absorbed.
- Cai–Shu–Tian write L_v(s, A, M) = L(s − 1/2, π_v) at finite places, and the complete L(s, π_A) includes the archimedean factors.

**Lean correspondence.** All carriers of the written target and its listed API/tests are supplied by the pinned elliptic-height, number-field or analytic function interfaces. Proofs remain admitted.

`TauCeti.GrossZagier.deriv_completed_at_one_of_eq_zero` — typed-signature.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), §1.2, p. 4 (arXiv v2).

### The unit index u

`GrossZagierAndArithmeticHeights:GZ.0/heegner-unit-index` · definition · `TauCeti.GrossZagier.unitIndex`

For an imaginary quadratic field K, u(K) = [O_K^× : ℤ^×] = #μ(K)/2, the number that appears squared in the Gross–Zagier constant. In Mathlib terms, u(K) = NumberField.Units.torsionOrder K / 2. So u(K) = 1 except u(ℚ(√−1)) = 2 and u(ℚ(√−3)) = 3.

**Hypotheses.**

- K imaginary quadratic.

**Inputs.** `mathlib:NumberField.Units.torsionOrder`, `mathlib:NumberField.Units.sum_mult_mul_log`, `mathlib:NumberField.Units.mem_torsion`, `mathlib:NumberField.Units.even_torsionOrder`, `mathlib:IsPrimitiveRoot.lcm_totient_le_finrank`, `mathlib:Polynomial.cyclotomic.irreducible_rat`.

**Construction or proof.**

1. An imaginary quadratic field has one complex infinite place. The unit product formula forces every integer unit to have absolute value 1; mem_torsion therefore identifies its entire unit group with the finite cyclic torsion subgroup.
2. Choose a generator of order w=torsionOrder K. Cyclotomic irreducibility and lcm_totient_le_finrank with the second root 1 imply φ(w)≤2. Evenness of w leaves w=2,4,6.
3. A primitive fourth root generates ℚ(√−1); a primitive sixth root generates ℚ(√−3). Conversely their explicit roots realize orders 4 and 6. Every other imaginary quadratic field has w=2.
4. The subgroup {±1} has order 2, so its index is w/2. Apply the classification to the Gaussian, Eisenstein and discriminant −7 tests.

**Uses.**

- `GrossZagierAndArithmeticHeights:GZ.8`: The explicit Gross–Zagier constant has u² in the denominator.
- `HeegnerPointEulerSystems:HE.1`: Heegner points over K are normalised by 1/u.

**Planning API.**

- `TauCeti.GrossZagier.unitIndex` (constructor; typed-signature): unitIndex K := NumberField.Units.torsionOrder K / 2 for K imaginary quadratic.
- `TauCeti.GrossZagier.two_mul_unitIndex` (characterisation; typed-signature): 2 * unitIndex K = torsionOrder K.
- `TauCeti.GrossZagier.unitIndex_eq_one_iff` (characterisation; typed-signature): unitIndex K = 1 ↔ K ≠ ℚ(√−1), ℚ(√−3).

**Mathematical unit tests.**

- `TauCeti.GrossZagier.unitIndex_gaussian` (computation; typed-example): unitIndex ℚ(√−1) = 2.
- `TauCeti.GrossZagier.unitIndex_eisenstein` (computation; typed-example): unitIndex ℚ(√−3) = 3.
- `TauCeti.GrossZagier.unitIndex_sqrt_neg_seven` (degenerate; typed-example): unitIndex ℚ(√−7) = 1.
- `TauCeti.GrossZagier.unitIndex_ne_torsionOrder` (non-example; typed-example): For every imaginary quadratic K, unitIndex K≠torsionOrder K; compare Conrad’s inconsistent p.69 and p.119 uses explicitly.

**Acceptance.**

- Conrad's §1 defines u_x as #μ(K) itself, but his §9 uses u_x ∈ {1, 2, 3}; the Gross–Zagier constant needs #μ(K)/2 (GrossZagierAndArithmeticHeights/E1).

**Lean correspondence.** All carriers of the written target and its listed API/tests are supplied by the pinned elliptic-height, number-field or analytic function interfaces. Proofs remain admitted.

`TauCeti.GrossZagier.unitIndex` — typed-signature.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), §1, Theorem 1.1, p. 2 (arXiv v2).
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), §1, 'Some conventions', p. 69; corrected in GrossZagierAndArithmeticHeights/E1.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Published Invent. Math. 84 (1986), Chapter I, §6, p.230.

### The Artin-map convention and the Galois action on Heegner points

`GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention` · comparison · `TauCeti.GrossZagier.artinConvention`

The Gross–Zagier and Conrad convention sends uniformisers to arithmetic Frobenius elements. The opposite (geometric) convention is its composite with inversion on Gal(H/K). Under the arithmetic convention [a] ∈ Cl_K acts on the Heegner point ([b], n) by ([b][a]⁻¹, n). Every formula indexed by class-group characters χ changes χ to χ⁻¹ when the convention changes; a Gross–Zagier formula pairs χ with χ⁻¹ and is therefore stated together with its convention.

**Hypotheses.**

- K imaginary quadratic with Hilbert class field H.

**Inputs.** `mathlib:IsGalois`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Construction or proof.**

1. The two reciprocity maps Cl_K → Gal(H/K) differ by inversion, by definition.
2. The action on Heegner points is Conrad's statement, p. 69, which he derives from the analytic description C/b → C/n⁻¹b.

**Acceptance.**

- A reciprocity law stated without its convention is not accepted.

**Lean correspondence.** The arithmetic reciprocity map, CM class-group action and its Heegner-point realization. The retained group-character identity is only inversion compatibility.

`TauCeti.GrossZagier.artinConvention` — algebraic-fragment.

**Sources.**

- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), §1, 'Some conventions', p. 69.
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), §1, 'Some conventions', p. 69.

### Full real period, identity-component period and c∞

`GrossZagierAndArithmeticHeights:GZ.0/real-period-components` · comparison · `TauCeti.GrossZagier.realPeriod_eq_card_components_mul`

For E/ℚ with a minimal Weierstrass equation and Néron differential ω, let Ω⁰ be the least positive real period (∫ of |ω| over the identity component E(ℝ)⁰) and c∞ = #π₀(E(ℝ)), which is 2 if Δ > 0 and 1 if Δ < 0. The BSD real period is Ω = c∞·Ω⁰ = ∫_{E(ℝ)}|ω|, and it is what EllipticCurves Layer 7's integral 2∫_{D_W > 0} dx/√D_W computes. A formula stated with Ω⁰ must carry c∞ separately, and a formula stated with Ω must not multiply by c∞ again.

**Hypotheses.**

- E/ℚ; minimal model; Δ ≠ 0.

**Inputs.** `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.b₂`, `mathlib:Real.sqrt`, `mathlib:MeasureTheory.lintegral`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Construction or proof.**

1. E(ℝ) has two components exactly when the cubic 4x³ + b₂x² + 2b₄x + b₆ has three real roots, i.e. Δ > 0.
2. The integral over E(ℝ) is the sum over its components, which have equal ∫|ω| because translation by a point of the non-identity component preserves |ω|.

**Acceptance.**

- 37.a1 has Δ = 37 > 0, so c∞ = 2, and the LMFDB real period 5.9869172924… is the full period Ω = 2Ω⁰.

**Lean correspondence.** EllipticCurves Layer7 supplies the full-period integral on the reduced minimal equation over ℚ, with finiteness and the differential from its Layer1. GZ.0 owns the comparison with the identity-component period and c∞. The current upstream layer does not yet supply the manifold comparison or an identity-component-period carrier.

`TauCeti.GrossZagier.realPeriod_eq_card_components_mul` — omitted; actual source carrier not written.

**Sources.**

- [The L-functions and modular forms database](https://www.lmfdb.org/EllipticCurve/Q/37a1/), 37.a1 curve page, Mordell–Weil generators and BSD invariants/computation conventions (accessed2026-10-10).

### Base-change signs and measure comparison

`GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections` · comparison · `rootNumber_measure_comparison`

For K/F CM quadratic with character η and ωπχ|A_F×=1, let εBC,v be the root number of L(s,πK,v⊗χv). The Rankin-over-F root number is ηv(−1)εBC,v. Thus the toric distinction sign is εBC,v=χv(−1)ε(Bv). Fix the torus quotient measure of total volume 2L(1,η), its probability normalization by division by that volume, and the quaternionic Petersson Tamagawa measure of volume 2. Products of two probability toric periods are (2L(1,η))⁻² times products computed with the torus quotient measure.

**Hypotheses.**

- F is totally real; K/F is CM quadratic; fixed additive characters and self-dual measures
- The product torus measure is the specified quotient measure, not an asserted Tamagawa measure

**Inputs.** `AutomorphicLFunctionsAndLocalFactors:AL.3`, `MetaplecticAutomorphicForms:MP.6/theta-measure-normalizations`.

**Construction or proof.**

1. Compare the two definitions of local epsilon factors using erratum item 5.
2. Divide each period by the quotient volume; the two period factors account for 4L(1,η)².
3. Keep the independent Petersson volume in every local-to-global pairing.

**Acceptance.**

- A place with ηv(−1)=−1 changes the Rankin sign but not the corrected base-change criterion.
- Probability and quotient period products differ by exactly 4L(1,η)².

**Lean correspondence.** The actual compatible-place height, CM reciprocity, toric measure or L-function interface named by this target; the retained algebraic identity omits those specialization hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.rootNumber_measure_comparison` — algebraic-fragment.

**Sources.**

- [Erratum to The Gross–Zagier Formula on Shimura Curves](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf), items 4, 5, 10, 13, 15.

### Rescaling height and period identities

`GrossZagierAndArithmeticHeights:GZ.0/identity-rescaling` · theorem · `identity_rescaling`

For a bilinear identity H(P,Q)=C·L·α(f₁,f₂), replacing H by aH, torus measure dt by bdt, invariant local forms by cv( , )v with ∏cv=c, and the global form compatibly, multiplies the corresponding sides by their actual linear factors: heights by a, each toric period by b, their product by b², local αv by bv cv, and a rank-r regulator by a^r for a>0. Rescaling a differential by d multiplies its absolute period by |d| and its Petersson squared norm by |d|². Coefficient embeddings commute with these algebraic rescalings when they preserve the chosen rational structures.

**Hypotheses.**

- All measures positive; all nonzero differential/pairing scalars; finitely many nonunit local rescalings
- The same periods and pairings are used on both sides; embeddings fixed

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`, `mathlib:Matrix.det_smul`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing`.

**Construction or proof.**

1. Use linearity of integration and each pairing.
2. Apply Matrix.det_smul to the Gram matrix, retaining |a|^r if a is not assumed positive.
3. Separate period rescaling from the quadratic height rescaling.

**Acceptance.**

- Scaling a torus measure by 3 multiplies a period product by 9.
- Scaling a positive pairing by 2 multiplies a rank-two regulator by 4.
- The zero-period case still obeys the cross-multiplied identity.

**Lean correspondence.** The actual compatible-place height, CM reciprocity, toric measure or L-function interface named by this target; the retained algebraic identity omits those specialization hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.identity_rescaling` — algebraic-fragment.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), §1, normalizations; §2, local toric integrals.

### Classical Rankin normalization

`GrossZagierAndArithmeticHeights:GZ.0/classical-rankin-normalization` · comparison · `gz86_rankin_normalization`

(5.4) For f a Hecke eigenform in the new space of weight 2 on Γ₀(N), normalized by a₁ = 1, and χ a complex character of Cl_K: L(f, χ, s) = Σ_{𝒜 ∈ Cl_K} χ(𝒜) L_𝒜(f, s).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `GrossZagierAndArithmeticHeights:GZ.0/unitary-and-motivic-centres`.

**Construction or proof.**

1. Sum the partial series against χ.
2. Match the theta lift and Rankin local zeta integrals, including the removed level factors; shift the arithmetic centre k to the unitary centre 1/2.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual classical CM/modular objects, compatible number-field places, newform/Néron differentials or periods named in this target; its class-field/model and modular-form suppliers must connect those carriers.

`gz86_rankin_normalization` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §5, (5.4), p. 229.

### Relative-field height comparison

`GrossZagierAndArithmeticHeights:GZ.0/classical-relative-field-heights` · theorem · `gz86_relative_field_heights`

(6.4) ⟨a, b⟩_H = h ⟨a, b⟩_K = 2h ⟨a, b⟩_ℚ, the global heights on J over H, K and ℚ ([H:K] = h, [K:ℚ] = 2); the constants of (6.2), (6.3) differ from those of the announcement [17] because [17] used the height over ℚ.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`, `HeightsRationalPointsAndObstructions:RP.0`.

**Construction or proof.**

1. Apply the compatible-place local-degree comparison to the same canonical height.
2. Sum the local degrees to obtain the field-degree ratio; retain the squared complex norm convention.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual classical CM/modular objects, compatible number-field places, newform/Néron differentials or periods named in this target; its class-field/model and modular-form suppliers must connect those carriers.

`gz86_relative_field_heights` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §6, (6.4), p. 230.

### CM action convention comparison

`GrossZagierAndArithmeticHeights:GZ.0/classical-cm-action-conventions` · theorem · `gz86_cm_action_conventions`

In the parametrisation of the referenced classical source result 59: (a) complex conjugation acts by (𝒜, 𝔫) ↦ (𝒜̄, 𝔫̄) = (𝒜⁻¹, N𝔫⁻¹); (b) Gal(H/K) ≅ Cl_K acts on 𝒜 and trivially on 𝔫: with σ = σ_𝒜 the Artin image of 𝒜 (arithmetic Frobenius convention), σ_𝒜 : (𝒜₁, 𝔫) ↦ (𝒜₁𝒜⁻¹, 𝔫) (p. 243); (c) for d ‖ N, w_d maps (𝒜, 𝔫) to (𝒜[𝔡]⁻¹, 𝔫𝔡⁻¹𝔡̄), 𝔡 = (d, 𝔫) (i.e. the opposite prime is chosen above every p_i | d); in particular w_N : (𝒜, 𝔫) ↦ (𝒜[𝔫]⁻¹, 𝔫̄) = (𝒜[𝔫̄], 𝔫̄) [corrected; printed 𝒜[𝔡] on p. 235 and (𝒜[𝔫], 𝔫̄) on p. 236, see PAPER-GROSS-ZAGIER-86/E2; p. 243 prints the correct rule]; (d) Gal(H/K) × W (W ≅ (ℤ/2ℤ)^s) acts freely and transitively on the Heegner points of discriminant D.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `HeegnerPointEulerSystems:HE.0`, `GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average`, `HeegnerPointEulerSystems:HE.1`.

**Construction or proof.**

1. Compute the source Artin action on the ideal-lattice description of CM points.
2. Compare inverse-character and ideal-inverse conventions before taking eigencomponents.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual classical CM/modular objects, compatible number-field places, newform/Néron differentials or periods named in this target; its class-field/model and modular-form suppliers must connect those carriers.

`gz86_cm_action_conventions` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §1, pp. 235–236 (i), (ii); p. 243.

### Genus-character factorization

`GrossZagierAndArithmeticHeights:GZ.0/classical-genus-character-factorization` · theorem · `gz86_genus_character_factorization`

Standing data of Chap. IV (p. 267): K imaginary quadratic of discriminant D, ε = ε_D = (D/·), Cl_K its class group; N ≥ 1 prime to D; f ∈ S_{2k}(Γ₀(N)) with Fourier coefficients a(n); L_𝒜(f,s) as in (0.1). For χ: Cl_K → ℂ^× put L_K(f,χ,s) = Σ_{𝒜∈Cl_K} χ(𝒜)L_𝒜(f,s) (0.3). If f is a Hecke eigenform, L(f,s) = ∏_p (1−α_p p^{−s})^{−1}(1−β_p p^{−s})^{−1} with α_p+β_p = a(p), α_pβ_p = p^{2k−1} (p∤N), 0 (p|N), and χ = χ_{D₁·D₂} is a genus character, then the convolution of L(f,s) with L_K(s,χ) equals L^{(N)}(2s−2k+1, ε)^{−1}·L(f,ε_{D₁},s)·L(f,ε_{D₂},s), where L(f,ε_{D_i},s) = Σ ε_{D_i}(n)a(n)n^{−s}; hence (0.4) L_K(f, χ_{D₁·D₂}, s) = L(f,ε_{D₁},s)·L(f,ε_{D₂},s). (The printed text writes L^{(N)}(2s+2k−1, ε) here; see the source issue.)

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `AnalyticNumberTheory:AN.4`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Construction or proof.**

1. Import the quadratic genus-character factorization on ideal classes.
2. Apply class-character orthogonality to factor the genus L-series into its two quadratic Dirichlet factors.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual classical CM/modular objects, compatible number-field places, newform/Néron differentials or periods named in this target; its class-field/model and modular-form suppliers must connect those carriers.

`gz86_genus_character_factorization` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, introduction, (0.3)–(0.4), p. 268.

### Quadratic-twist real-period comparison

`GrossZagierAndArithmeticHeights:GZ.0/classical-twist-real-period` · theorem · `gz86_twist_real_period`

Setting of Chap. V §2: f ∈ S₂(Γ₀(N)) a newform with rational integer coefficients, E/ℚ an elliptic curve with L(E, s) = L(f, s), π: X₀(N) → E a covering over ℚ with π(∞) = 0; K = ℚ(√D) as in §1 (D odd fundamental, every p | N split in K), u_K = #O_K^×/2. With Ω⁰ the fundamental period over E(ℝ)⁰ and (Ω′)⁰ the analogous period of the transported ω′ on E′: ‖ω‖²/|D|^{1/2} = [E(ℝ) : E(ℝ)⁰]·Ω⁰·(Ω′)⁰. These are identity-component periods; Ω in real-period-components denotes the full real period. The ω′ appearing in this formula is the transported differential ω/√D for the chosen complex branch of √D, not automatically a minimal Néron differential of E^D; changing to the minimal differential contributes its explicit rational scalar.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.0/classical-relative-field-heights`, `GrossZagierAndArithmeticHeights:GZ.3/classical-modular-period-degree`, `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `HeegnerPointEulerSystems:HE.1`.

**Construction or proof.**

1. Transport the chosen invariant differential across the quadratic-twist complex isomorphism.
2. The invariant and anti-invariant cycles exchange; compare the period of the transported differential ω/√D. A minimal Néron differential may add a separate rational factor.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual classical CM/modular objects, compatible number-field places, newform/Néron differentials or periods named in this target; its class-field/model and modular-form suppliers must connect those carriers.

`gz86_twist_real_period` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter V, §2, p. 312.

## GZ.1: Poincaré and character heights

Layer status: **planned**, implementation unchecked.

### Poincaré height pairing

`GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing` · construction · `poincareHeight`

For a number field F and an abelian variety A/F with dual A∨, let 𝒫 be the Poincaré bundle rigidified along both zero sections. Define h𝒫(x,y) as its canonical height on A×A∨, normalized relative to F. The biextension laws make h𝒫 bilinear in x and y, zero on torsion, and adjoint under u:A→B: h𝒫_B(ux,y)=h𝒫_A(x,u∨y). For a symmetric ample line bundle L on A and φL(y)=Ty*L⊗L⁻¹, h𝒫(x,φL y)=ĥL(x+y)−ĥL(x)−ĥL(y).

**Hypotheses.**

- A is projective, smooth and geometrically connected; dual and rigidified 𝒫 supplied by A2
- Canonical heights use the compatible RP.0 relative-to-F normalization

**Inputs.** `HeightsRationalPointsAndObstructions:RP.0`, `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`, `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`, `AbelianSchemesAndArithmeticModuli:A2/mumford-map-and-biextension`, `AbelianSchemesAndArithmeticModuli:A2/polarization-representatives-and-graph`.

**Construction or proof.**

1. Import the line-bundle height machine, canonical limit and bounded-error uniqueness from RP.0.
2. Apply the rigidified biextension identities to eliminate the bounded errors in each variable.
3. Pull back 𝒫 under u×1 and 1×u∨; uniqueness proves adjunction.
4. Pull back along 1×φL and use the theorem of the square to obtain the full polarization.

**Uses.**

- `YZZ Theorem 7.2`: Express a polarized height as a pairing between A and A∨.
- `GZ.8 general height identity`: Pair the χ and χ⁻¹ points without selecting an artificial self-pairing.

**Planning API.**

- `poincareHeight` (constructor; algebraic-fragment): The canonical height of the rigidified Poincaré bundle evaluated at (x,y).
- `poincareHeight_add_left` (relation; algebraic-fragment): h𝒫(x+x′,y)=h𝒫(x,y)+h𝒫(x′,y).
- `poincareHeight_add_right` (relation; algebraic-fragment): h𝒫(x,y+y′)=h𝒫(x,y)+h𝒫(x,y′).
- `poincareHeight_hom_adjoint` (functoriality; algebraic-fragment): h_B(ux,y)=h_A(x,u∨y), including identity and composition.
- `poincareHeight_polarization` (compatibility; algebraic-fragment): h𝒫(x,φL y)=ĥL(x+y)−ĥL(x)−ĥL(y).

**Mathematical unit tests.**

- `poincareHeight_zero` (degenerate; fragment-example): h𝒫(0,y)=h𝒫(x,0)=0.
- `poincareHeight_elliptic_diagonal` (compatibility; fragment-example): For L=(O), h𝒫(P,φL P)=2·Point.canonicalHeight P under the same field normalization.
- `poincareHeight_integer_adjunction` (characterisation; fragment-example): h𝒫(nx,y)=h𝒫(x,ny)=n h𝒫(x,y) for n∈ℤ.

**Acceptance.**

- Diagonal on a principally polarized elliptic curve is 2ĥ_(O), not ĥ_(O).

**Lean correspondence.** A, its dual, the rigidified Poincaré biextension and canonical line-bundle height from RP.0 and A2, including the polarization pullback. An arbitrary quadratic map on two groups lacks those identifications.

`TauCeti.GrossZagier.AlgebraicFragments.poincareHeight` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §7.1.1, Theorems 7.1.1–7.1.2 and Proposition 7.1.3, pp. 217–219.

### Endomorphism-field height pairing

`GrossZagierAndArithmeticHeights:GZ.1/coefficient-valued-height` · construction · `coefficientHeight`

Let A/F be simple of strict GL₂ type with End_F⁰(A)=M a number field, and identify End_F⁰(A∨) with M by duality m↦m∨. For x∈A(F̄)⊗ℚ and y∈A∨(F̄)⊗ℚ define the unique H_M(x,y)∈M⊗ℚℝ satisfying Tr_{M/ℚ}(m·H_M(x,y))=h𝒫(mx,y) for every m∈M. The nondegenerate trace form gives existence and uniqueness. It satisfies H_M(mx,y)=mH_M(x,y)=H_M(x,m∨y), and its trace is h𝒫(x,y).

**Hypotheses.**

- The M-action is F-rational; M is finite separable over ℚ; h𝒫 is adjoint for dual endomorphisms

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`, `mathlib:TensorProduct`.

**Construction or proof.**

1. Represent the ℚ-linear functional m↦h𝒫(mx,y) using the trace-dual basis of M.
2. Use adjunction and trace nondegeneracy to prove M-bilinearity and independence of that basis.

**Uses.**

- `YZZ §1.3 and §7.1`: Retain the End⁰(A)-valued pairing in the height identity.
- `GZ.8 coefficient embedding comparison`: Recover scalar formulas by the specified embedding only after forming H_M.

**Planning API.**

- `coefficientHeight` (constructor; algebraic-fragment): The trace-dual coefficient H_M(x,y).
- `coefficientHeight_trace` (characterisation; algebraic-fragment): Tr(m H_M(x,y))=h𝒫(mx,y) for every m∈M.
- `coefficientHeight_smul` (relation; algebraic-fragment): H_M(mx,y)=m H_M(x,y)=H_M(x,m∨y).
- `coefficientHeight_basis_independent` (extensionality; algebraic-fragment): Any two trace-dual bases construct the same coefficient.
- `coefficientHeight_add` (structure; algebraic-fragment): The coefficient-valued pairing is additive in each variable: H(x+x′,y)=H(x,y)+H(x′,y) and H(x,y+y′)=H(x,y)+H(x,y′). Nondegeneracy of the coefficient-field trace pairing identifies these values uniquely.

**Mathematical unit tests.**

- `coefficientHeight_rational` (compatibility; fragment-example): For M=ℚ, H_M equals the scalar Poincaré pairing.
- `coefficientHeight_zero` (degenerate; fragment-example): The coefficient is zero if either point is torsion.
- `coefficientHeight_trace_not_coordinate` (non-example; fragment-example): If M is quadratic and H_M=1, its trace is 2, although each real embedding evaluates it to 1.

**Acceptance.**

- No individual coefficient embedding is substituted for the trace characterization.

**Lean correspondence.** The strict GL₂-type abelian variety, its coefficient field scalar extension, dual endomorphism action and the canonical Poincaré height. A trace-dual scalar algebra and bilinear map only encode the algebraic extraction step.

`TauCeti.GrossZagier.AlgebraicFragments.coefficientHeight` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §1.2.4, printed p.15; §7.1.1 Proposition7.1.3, printed p.219.

### Character-component height pairing

`GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing` · construction · `characterHeight`

For a finite abelian extension H/K, a coefficient extension L/M and finite-order χ:Gal(H/K)→L×, set Vχ={x∈A(H)⊗M L : σx=χ(σ)x}. Extend H_M L-bilinearly to Vχ×V∨χ⁻¹ with values L⊗ℚℝ. Galois invariance makes distinct inverse-character components orthogonal. The χ-projector is eχ=|G|⁻¹Σσ χ(σ)⁻¹σ; its normalization distinguishes trace and average. On rational points modulo torsion the pairing is nondegenerate on paired components once the imported canonical height is positive definite on a finite-rank group.

**Hypotheses.**

- H/K finite abelian, characteristic-zero coefficients; strict GL₂ data of coefficientHeight
- Finite generation is imported from RP.1 only for the finite-rank nondegeneracy formulation

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.1/coefficient-valued-height`, `GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average`, `HeightsRationalPointsAndObstructions:RP.1`.

**Construction or proof.**

1. Extend the bilinear map along M→L and apply the finite character idempotents.
2. Use σ-invariance to force χχ′=1 for a nonzero pairing.
3. Apply the RP positivity result to the real finite-rank realization and scalar extension.

**Uses.**

- `YZZ main formula`: The two Heegner points lie in inverse-character components.
- `GZ.8 ring-class specializations`: Control the normalizing class number and coefficient field.

**Planning API.**

- `characterHeight` (constructor; algebraic-fragment): The restriction of scalar-extended H_M to Vχ×V∨χ⁻¹.
- `characterHeight_projector` (compatibility; algebraic-fragment): H_L(eχx,y)=H_L(x,eχ⁻¹y).
- `characterHeight_smul` (relation; algebraic-fragment): H_L(ax,by)=ab H_L(x,y).
- `characterHeight_galois` (relation; algebraic-fragment): H_L(σx,σy)=H_L(x,y).

**Mathematical unit tests.**

- `characterHeight_trivial` (compatibility; fragment-example): For χ=1 the pairing is the H_M pairing on G-invariants after scalar extension.
- `characterHeight_wrong_character` (non-example; fragment-example): If χχ′≠1, H_L(Vχ,V∨χ′)=0.
- `characterHeight_average_square` (computation; fragment-example): Replacing both trace inputs by their |G|⁻¹ averages divides the pairing by |G|².

**Acceptance.**

- A nontrivial χ is paired with χ⁻¹, rather than with χ again.

**Lean correspondence.** The actual Galois action on rationalized abelian points, opposite-character eigenspaces, fixed coefficient embedding and geometric height before scalar extension.

`TauCeti.GrossZagier.AlgebraicFragments.characterHeight` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208. Historical 2013-edition locator; current support is the separately cited public version.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §3, p. 228; §6, p. 230.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter V, §1, p. 308; Chapter I, §6, p. 230.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §1.3.1–§1.3.2, printed pp.16–17; §1.2.4, printed p.15.

### Elliptic Poincaré comparison

`GrossZagierAndArithmeticHeights:GZ.1/elliptic-poincare-comparison` · comparison · `elliptic_poincare_comparison`

For a Weierstrass elliptic curve E/K with translation T_P(x)=x+P and polarization φ_(O)(P)=T_P*O((O))⊗O((O))⁻¹, corresponding to [−P]−[O] in Pic⁰(E), the RP canonical height for (O), relative to K using NumberField.instAdmissibleAbsValues, equals the pinned Point.canonicalHeight. Therefore h𝒫(P,φ_(O) Q)=2·neronTatePairing(P,Q), and the full-polarization regulator is 2^r times the pinned regulator. The equality requires the line-bundle-to-coordinate Weil-height comparison; a change to absolute heights divides both pairings by [K:ℚ]. Under the Abel–Jacobi identification Q↦[Q]−[O] instead, the canonical Poincaré height is −2·neronTatePairing(P,Q). These two identifications must not be interchanged.

**Hypotheses.**

- K a number field; compatible RP and Mathlib absolute values; E nonsingular

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-height-pairing`, `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator`, `HeightsRationalPointsAndObstructions:RP.0`.

**Construction or proof.**

1. Compare the (O) Weil height with one half of the coordinate x-height up to a bounded error.
2. Apply uniqueness of quadratic refinements to identify the doubling limits.
3. Take the full polar form, then apply the determinant scaling baseline.

**Acceptance.**

- Test a non-torsion diagonal and rank-two basis; rank zero cannot detect the factor.

**Lean correspondence.** The algebraic Pic⁰/Abel–Jacobi and principal-polarization identifications for the actual elliptic curve, with the corrected translation sign, followed by the Poincaré canonical-height comparison.

`elliptic_poincare_comparison` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 7, Sec. 7.1.1 and Thm. 7.2, printed p. 208. Historical 2013-edition locator; current support is the separately cited public version.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), I §4 (4.3), p.228.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §7.1.1, Theorems 7.1.1–7.1.2 and Proposition 7.1.3, pp. 217–219.

## GZ.2: Admissible arithmetic intersection

Layer status: **planned**, implementation unchecked.

### Global arithmetic intersection on curves

`GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing` · construction · `arithmeticIntersection`

For a smooth proper geometrically connected curve X/F and a regular model 𝒳/𝒪_L after finite L/F, an arithmetic divisor is (D,(gσ)σ) with ddᶜgσ+δDσ smooth and complex conjugation compatible. Its intersection for generically disjoint D₁,D₂ is the sum of finite intersection lengths times log Nv, plus the archimedean Green evaluation and curvature integral; complex embeddings count twice real ones. Divide by [L:F]. Model pullbacks and finite-extension projection formulas identify the total intersection, and compatible arithmetic classes glue in the directed system of models; horizontal and vertical summands separately depend on the model.

**Hypotheses.**

- 𝒳 regular with imported local intersections; finite extension chosen semistable where needed
- Green singularities and logarithm conventions fixed; generically disjoint representatives

**Inputs.** `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`, `ArakelovGeometryAndAbelianHeights:R35.1`.

**Construction or proof.**

1. Import regular models and the finite length pairing from StableReduction.
2. Combine the finite local lengths with conjugation-invariant archimedean Green data.
3. Use local projection formulas and the product formula to descend the normalized total through models and extensions.

**Uses.**

- `YZZ §7.1.3–7.1.7`: Glue local height contributions over a number field.
- `GZ.7 local-to-global identity`: Keep the finite and archimedean normalizations synchronized.

**Planning API.**

- `arithmeticIntersection` (constructor; algebraic-fragment): The normalized finite-plus-infinite intersection on compatible arithmetic divisor classes.
- `arithmeticIntersection_add` (relation; algebraic-fragment): The pairing is additive in each variable and symmetric.
- `arithmeticIntersection_projection` (functoriality; algebraic-fragment): For a finite map f, (f*D,E)=(D,f*E), with proper push-forward multiplicities.
- `arithmeticIntersection_baseChange` (compatibility; algebraic-fragment): Unnormalized intersection multiplies by [L′:L]; normalized intersection is unchanged.
- `arithmeticIntersection_symm` (structure; algebraic-fragment): The global arithmetic intersection is symmetric: D-hat·E-hat=E-hat·D-hat, for the compatible regular models and Green normalizations.

**Mathematical unit tests.**

- `arithmeticIntersection_fibre_kernel` (degenerate; fragment-example): An entire fibre has zero finite intersection with a degree-zero divisor.
- `arithmeticIntersection_principal` (characterisation; fragment-example): A principal arithmetic divisor with Green −log|f| has global intersection zero by the product formula.
- `arithmeticIntersection_complex_weight` (non-example; fragment-example): A complex embedding contributes weight two; counting it once changes the pairing over an imaginary quadratic field.

**Acceptance.**

- The entire fibre is in the vertical intersection kernel; no ordinary matrix inverse is used.

**Lean correspondence.** Arithmetic divisor/Green-current carriers on regular proper models, the StableReduction local intersection and projection operations, compatible places and arithmetic degree.

`TauCeti.GrossZagier.AlgebraicFragments.arithmeticIntersection` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 7, Sec. 7.1.4, printed pp. 211-212. Historical 2013-edition locator; current support is the separately cited public version.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §4, (4.2), p. 228.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §7.1.3–§7.1.7, Theorem 7.1.4 and (7.1.1)–(7.1.2), pp. 220–224.

### Admissible arithmetic extension

`GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension` · construction · `admissibleExtension`

Fix a compatible arithmetic class ξ̂ of degree one on each geometric connected component of X. For D, its ξ̂-admissible extension D̄ is characterized by: D̄−deg(D)ξ̂ has zero curvature and is orthogonal to every finite vertical component; ∫g_D c₁(ξ̂)=0 at each infinite place; and the vertical correction V_D has (V_D·ξ̂)v=0. The singular fibre matrix is solved on the quotient by the total fibre; the last condition fixes that remaining fibre ambiguity. The construction is unique in the compatible model system and extends by rational linearity.

**Hypotheses.**

- Semistable regular model after base change; degree taken componentwise
- ξ̂ fixed with compatible admissible Green data

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`, `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green`, `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`.

**Construction or proof.**

1. Solve the vertical linear equations modulo the fibre kernel using the imported matrix result.
2. Solve the archimedean Green equation and fix its additive constant by the mean-zero condition.
3. Normalize the vertical fibre multiple against ξ̂ and verify uniqueness.

**Uses.**

- `YZZ §7.1.5`: Define local height symbols of degree-one CM divisors.
- `GZ.7 Hodge and diagonal terms`: Keep their ξ̂-dependence explicit.

**Planning API.**

- `admissibleExtension` (constructor; omitted; actual source carrier not written): The unique ξ̂-admissible extension of D.
- `admissibleExtension_characterization` (characterisation; omitted; actual source carrier not written): The three normalization conditions characterize the extension.
- `admissibleExtension_add` (relation; omitted; actual source carrier not written): Extension is rational-linear in divisors.
- `admissibleExtension_pullback` (functoriality; omitted; actual source carrier not written): Pullback preserves admissibility when ξ̂ and its measure are pulled back compatibly.
- `admissibleExtension_degreeZero` (compatibility; omitted; actual source carrier not written): For componentwise degree zero the extension is flat.

**Mathematical unit tests.**

- `admissibleExtension_zero` (degenerate; omitted; actual source carrier not written): The extension of zero is zero.
- `admissibleExtension_xi` (characterisation; omitted; actual source carrier not written): The fixed normalized representative of ξ extends to ξ̂.
- `admissibleExtension_disconnected` (non-example; omitted; actual source carrier not written): A divisor of total degree zero with nonzero degrees on two components is not flat.

**Acceptance.**

- Positive-degree extensions depend on ξ̂ and do not descend through arbitrary rational equivalence.

**Lean correspondence.** An actual degree-zero divisor, its Green current and vertical correction in the model intersection space, with admissibility at every place.

`admissibleExtension` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 7, Sec. 7.1.5, printed p. 212. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §7.1.3–§7.1.7, Theorem 7.1.4 and (7.1.1)–(7.1.2), pp. 220–224.

### Faltings–Hriljac comparison

`GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions` · theorem · `faltingsHriljac`

For componentwise degree-zero divisors D,E on a smooth proper curve X/F, choose disjoint representatives over L and flat admissible extensions on a regular semistable model. Then −[L:F]⁻¹(D̄·Ē)=h𝒫_J([D],φΘ[E]), the full-polarization canonical Jacobian pairing relative to F. It is independent of representatives and model. For disconnected curves the summands are orthogonal. Only degree-zero divisors descend to Pic⁰; the ξ̂-admissible positive-degree pairing is not asserted to factor through Pic.

**Hypotheses.**

- X has positive genus on the Jacobian components; canonical principal polarization imported
- Flat extensions, compatible local weights and generically disjoint representatives

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension`, `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, `AbelianSchemesAndArithmeticModuli:A2`.

**Construction or proof.**

1. Identify the intersection height with a Weil height for the Jacobian theta divisor.
2. Apply the canonical-height limit and the Hodge index theorem, with the minus sign.
3. Use projection formulas and the product formula to remove choices.

**Acceptance.**

- For an elliptic curve the diagonal is twice the pinned canonicalHeight.
- A positive-degree principal-equivalence change is not incorrectly declared invisible.

**Lean correspondence.** The actual Jacobian class, canonical height and admissible arithmetic intersection on a regular proper arithmetic surface.

`faltingsHriljac` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 7, Thm. 7.4, printed p. 212. Historical 2013-edition locator; current support is the separately cited public version.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §4, (4.3), p. 228 (quoted, Lang [24]).
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §7.1.3–§7.1.7, Theorem 7.1.4 and (7.1.1)–(7.1.2), pp. 220–224.

### Arakelov probability form

`GrossZagierAndArithmeticHeights:GZ.2/arakelov-probability-form` · construction · `arakelovMeasure`

On C let (α,β)=(i/2)∫C α∧β̄ on H⁰(C,ωC), and choose an orthonormal basis α₁,…,αg. Set μAr=(i/(2g))Σj αj∧ᾱj. It is a smooth positive probability form, independent of the orthonormal basis. This is a genus-normalized form: the unscaled Bergman sum has mass g.

**Hypotheses.**

- **H12**
- **H13**

**Inputs.** `ArakelovGeometryAndAbelianHeights:R35.1`, `AutomorphicSpectralTheory:AS.4`.

**Construction or proof.**

1. Import holomorphic one-forms, integration and the positive definite hermitian pairing.
2. A unitary change of basis preserves the sum; integrate each diagonal term to obtain total mass one.

**Uses.**

- `Yuan Appendix A.1`: Fix the curvature normalization for every admissible metric.
- `GZ.2 Green normalization`: Take the mean-zero condition against a probability measure.

**Planning API.**

- `arakelovMeasure` (constructor; algebraic-fragment): The form (i/(2g))Σαj∧ᾱj.
- `arakelovMeasure_basis_independent` (extensionality; algebraic-fragment): The measure agrees for any two orthonormal bases.
- `arakelovMeasure_mass` (projection; algebraic-fragment): ∫C μAr=1.
- `arakelovMeasure_isometry` (functoriality; algebraic-fragment): A biholomorphism pulls the target Arakelov form back to the source form.

**Mathematical unit tests.**

- `arakelovMeasure_genus_two` (computation; fragment-example): For g=2 each orthonormal summand contributes 1/2 to the mass.
- `arakelovMeasure_genus_one` (compatibility; fragment-example): For C=ℂ/Λ with area A, μAr is Euclidean area divided by A.
- `arakelovMeasure_wrong_mass` (non-example; fragment-example): For g=2 the unscaled Bergman form has mass 2 and is not μAr.

**Acceptance.**

- Do not omit the factor 1/g.

**Lean correspondence.** Holomorphic differentials on the compact Riemann surface, their L²-orthonormal basis, wedge/conjugation operations and integration normalization.

`TauCeti.GrossZagier.AlgebraicFragments.arakelovMeasure` — algebraic-fragment.

**Sources.**

- [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.102.

### Archimedean admissible metric

`GrossZagierAndArithmeticHeights:GZ.2/archimedean-admissible-metric` · definition · `admissibleMetric`

A smooth hermitian metric on a holomorphic line bundle L/C is admissible when c₁(L,‖·‖)=deg(L)μAr. A smooth metric on L/C² is admissible when its restrictions to {x}×C and C×{x} are admissible for every x∈C. Multiplication of a norm by a positive constant preserves admissibility; degrees need not be one or positive.

**Hypotheses.**

- **H12**
- **H13**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/arakelov-probability-form`, `ArakelovGeometryAndAbelianHeights:R35.1`.

**Construction or proof.**

1. Use the imported Chern current of a smooth hermitian metric.
2. Define the two fibrewise restrictions on C² and impose the same degree-weighted equation.

**Uses.**

- `Yuan Theorem A.1`: Normalize diagonal and dualizing metrics.
- `GZ.2 positive-degree extensions`: Retain the degree factor in the archimedean local condition.

**Planning API.**

- `admissibleMetric` (characterisation; algebraic-fragment): c₁(L)=deg(L)μAr, and the analogous two-fibre condition on C².
- `admissibleMetric_tensor` (relation; algebraic-fragment): Tensor products and duals add and negate degrees and Chern forms.
- `admissibleMetric_rescale` (relation; algebraic-fragment): Multiplication of the norm by a positive constant preserves admissibility.
- `admissibleMetric_fibre` (projection; algebraic-fragment): Either fibre restriction of an admissible metric on C² is admissible.

**Mathematical unit tests.**

- `admissibleMetric_degree_zero` (degenerate; fragment-example): An admissible metric on a degree-zero bundle is flat.
- `admissibleMetric_degree_two` (computation; fragment-example): For degree two the curvature mass is 2.
- `admissibleMetric_wrong_curvature` (non-example; fragment-example): Curvature μAr is inadmissible for a bundle of degree two.

**Acceptance.**

- A degree-zero bundle has zero Chern form.

**Lean correspondence.** Hermitian line bundles on the curve, curvature, unsquared norms and the Green-current equation with degree factor.

`TauCeti.GrossZagier.AlgebraicFragments.admissibleMetric` — algebraic-fragment.

**Sources.**

- [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.102.

### Degree-weighted admissible Green function

`GrossZagierAndArithmeticHeights:GZ.2/admissible-green-function` · definition · `admissibleGreen`

For a Cartier divisor D on C a Green function is a smooth real gD off |D| such that gD+log|f| extends smoothly whenever div(f)=D locally. It is admissible if the metric ‖1‖=exp(−gD) on O(D) is admissible, equivalently ddᶜgD=deg(D)μAr−δD as currents. The printed equation with μAr−δD is valid only for degree one.

**Hypotheses.**

- **H12**
- **H13**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/archimedean-admissible-metric`, `ArakelovGeometryAndAbelianHeights:R35.1`.

**Construction or proof.**

1. Apply the Poincaré–Lelong formula with the selected unsquared norm.
2. Insert c₁(O(D))=deg(D)μAr; both sides of the current equation then have total mass zero.

**Uses.**

- `Yuan Appendix A.1`: Pass between divisor Green functions and hermitian line bundles.
- `GZ.2 arithmetic intersection`: Evaluate local archimedean symbols for divisors of arbitrary degree.

**Planning API.**

- `admissibleGreen` (characterisation; algebraic-fragment): The singularity and degree-weighted current equation characterize admissibility.
- `admissibleGreen_add` (relation; algebraic-fragment): gD+gE is admissible for D+E.
- `admissibleGreen_constant` (relation; algebraic-fragment): Adding a real constant preserves admissibility.
- `admissibleGreen_metric` (compatibility; algebraic-fragment): exp(−gD) defines the admissible metric on O(D).

**Mathematical unit tests.**

- `admissibleGreen_zero` (degenerate; fragment-example): A constant is an admissible Green function for D=0.
- `admissibleGreen_degree_two` (computation; fragment-example): The smooth term for D=x+y is 2μAr.
- `admissibleGreen_missing_degree` (non-example; fragment-example): For D=0 the printed equation ddᶜg=μAr has incompatible total masses 0 and 1.

**Acceptance.**

- Integrate the current equation for D=0 and for a divisor of degree two.

**Lean correspondence.** The curve/divisor and analytic current carriers, delta currents, probability measure, ddᶜ and the normalized integral of the Green solution.

`TauCeti.GrossZagier.AlgebraicFragments.admissibleGreen` — algebraic-fragment.

**Sources.**

- [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.102.

### Complex admissible metric existence

`GrossZagierAndArithmeticHeights:GZ.2/admissible-metric-existence` · theorem · `admissibleMetric_exists_unique`

Every holomorphic line bundle on C, and every holomorphic line bundle on C² with the two-fibre criterion, has a smooth admissible hermitian metric. It is unique up to multiplication of its norm by one positive constant on the connected base. Equivalently two admissible Green metrics differ by an additive constant.

**Hypotheses.**

- **H12**
- **H13**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/archimedean-admissible-metric`, `AutomorphicSpectralTheory:AS.4`, `ArakelovGeometryAndAbelianHeights:R35.1`.

**Construction or proof.**

1. On C solve the zero-mass curvature difference by the imported elliptic Green operator.
2. For C² use the fibrewise construction and the line-bundle decomposition, including the Jacobian/Poincaré component.
3. The ratio of two solutions is pluriharmonic in each fibre; compactness makes it constant.

**Acceptance.**

- Admissibility alone does not select an absolute multiplicative constant.

**Lean correspondence.** The line-bundle and Green-current existence interface at real, complex and nonarchimedean places, including descent and the proper normalization.

`admissibleMetric_exists_unique` — omitted; actual source carrier not written.

**Sources.**

- [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.102.

### Normalized Arakelov Green function

`GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green` · construction · `arakelovGreen`

There is a unique symmetric smooth Green function gAr on C²∖Δ with singularity −log|local diagonal equation|, ddᶜ_y gAr(x,y)=μAr(y)−δx and ∫C gAr(x,y)μAr(y)=0. It defines a fibrewise admissible metric exp(−gAr) on O(Δ). Symmetry follows from the self-adjoint Green operator; the mean-zero condition removes the constant ambiguity.

**Hypotheses.**

- **H12**
- **H13**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/admissible-green-function`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-metric-existence`, `AutomorphicSpectralTheory:AS.4`.

**Construction or proof.**

1. Solve the current equation for each x, subtract its μAr mean.
2. Use elliptic regularity away from Δ and the symmetric Green operator to glue the kernel.
3. Convert the logarithmic singularity to the diagonal line-bundle metric.

**Uses.**

- `Yuan Appendix A.1`: Define the canonical diagonal and dualizing metrics.
- `GZ.2 admissible arithmetic extension`: Fix the infinite-place Green constant.

**Planning API.**

- `arakelovGreen` (constructor; omitted; actual source carrier not written): The normalized symmetric Green kernel on C²∖Δ.
- `arakelovGreen_symm` (relation; omitted; actual source carrier not written): gAr(x,y)=gAr(y,x).
- `arakelovGreen_mean` (characterisation; omitted; actual source carrier not written): ∫gAr(x,y)μAr(y)=0.
- `arakelovGreen_diagonal_metric` (compatibility; omitted; actual source carrier not written): exp(−gAr) extends to the admissible metric on O(Δ).

**Mathematical unit tests.**

- `arakelovGreen_constant_shift` (non-example; omitted; actual source carrier not written): For a nonzero real c, gAr+c fails the mean-zero condition.
- `arakelovGreen_degree_zero` (compatibility; omitted; actual source carrier not written): For D=x−y, gAr(x,·)−gAr(y,·) has smooth curvature zero.
- `arakelovGreen_local_singularity` (characterisation; omitted; actual source carrier not written): gAr+log|z−w| is smooth near a diagonal coordinate chart.

**Acceptance.**

- Use the unsquared metric convention in both the Green function and diagonal metric.

**Lean correspondence.** The normalized Green solution on the actual compact curve with its diagonal singularity and zero mean, rather than an arbitrary two-variable function.

`arakelovGreen` — omitted; actual source carrier not written.

**Sources.**

- [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.103.

### Arakelov dualizing metric

`GrossZagierAndArithmeticHeights:GZ.2/arakelov-dualizing-metric` · construction · `arakelovDualizingMetric`

For each x∈C the residue map (ωC⊗O(x))|x→ℂ is an isometry when O(x) has the normalized Green metric and ℂ has its ordinary absolute value. These conditions determine the smooth Arakelov metric on ωC. Its curvature is (2g−2)μAr; in genus one the metric is flat.

**Hypotheses.**

- **H12**
- **H13**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green`, `ArakelovGeometryAndAbelianHeights:R35.1`.

**Construction or proof.**

1. Use adjunction O(Δ)|Δ≃ωC⁻¹ and the smooth diagonal metric.
2. Dualize its diagonal restriction so that the residue trivialization has norm one.
3. Apply the curvature formula for the canonical Bergman measure.

**Uses.**

- `Yuan Theorem A.1`: Fix dualizing/diagonal compatibility.
- `GZ.7 arithmetic adjunction`: Measure the self-intersection by the tangent/residue line.

**Planning API.**

- `arakelovDualizingMetric` (constructor; algebraic-fragment): The residue-normalized smooth metric on ωC.
- `arakelovDualizingMetric_residue` (characterisation; algebraic-fragment): All the residue maps are isometries.
- `arakelovDualizingMetric_curvature` (projection; omitted; actual source carrier not written): c₁(ωC)=(2g−2)μAr.
- `arakelovDualizingMetric_diagonal` (compatibility; omitted; actual source carrier not written): It is the dual of O(Δ)|Δ with its diagonal metric.

**Mathematical unit tests.**

- `arakelovDualizingMetric_genus_one` (degenerate; omitted; The actual compact-curve dualizing metric and its genus-one curvature specialization are absent; the previous example was removed, leaving only an omission comment.): For genus one its Chern form is zero.
- `arakelovDualizingMetric_genus_two` (computation; omitted; The actual compact-curve dualizing metric and its genus-two curvature specialization are absent; the previous example was removed, leaving only an omission comment.): For genus two its curvature mass is 2.
- `arakelovDualizingMetric_rescale` (non-example; fragment-example): Multiplying only the dualizing norm by c≠1 destroys the residue isometry.

**Acceptance.**

- Do not replace the ordinary ℂ norm by its square.

**Lean correspondence.** The actual dualizing sheaf, diagonal/adjunction residue isometry and admissible norm on the corresponding tensor line.

`TauCeti.GrossZagier.AlgebraicFragments.arakelovDualizingMetric` — algebraic-fragment.

**Sources.**

- [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.1, p.103.

### Admissible reduction-graph measure

`GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure` · construction · `graphAdmissibleMeasure`

Let Kv=2g_v−2+val(v) be the canonical divisor KΓ on Γ. There is a unique probability measure μ of the edge-uniform and vertex-atomic class such that its normalized symmetric continuous Green kernel satisfies Δ_y gμ(x,y)=δx−μ, ∫Γgμ(x,y)dμ(y)=0, and c+gμ(KΓ,x)+gμ(x,x)=0 for a constant c independent of x. Push μ forward by the skeleton inclusion i to obtain the canonical admissible measure on Cᵃⁿ. The genus weights g_v are indispensable.

**Hypotheses.**

- K is complete discretely valued; C/K is smooth projective geometrically integral of genus g>0 with C(K) nonempty and split semistable reduction
- Γ is the graph of the minimal regular model, with unit edge lengths; eK=|uniformizer|⁻¹

**Inputs.** `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`, `TropicalAndBerkovichArithmetic:TB.3`, `TropicalAndBerkovichArithmetic:TB.2`.

**Construction or proof.**

1. Import the reduction graph, skeleton inclusion/retraction, graph Laplacian and resistance Green kernel.
2. Use Zhang’s canonical-divisor condition to select μ among probability measures.
3. Normalize the Green kernel by its μ mean, and push the measure to Cᵃⁿ.

**Uses.**

- `Yuan Theorem A.1 and Proposition A.5`: Normalize nonarchimedean dualizing and diagonal metrics.
- `GZ.2 vertical correction`: Compare the graph correction with the arithmetic model correction.

**Planning API.**

- `graphAdmissibleMeasure` (constructor; algebraic-fragment): The canonical-divisor probability measure μ.
- `graphAdmissibleMeasure_mass` (projection; algebraic-fragment): μ(Γ)=1.
- `graphAdmissibleGreen_laplacian` (characterisation; omitted; actual source carrier not written): Δ_y gμ(x,y)=δx−μ and its μ mean is zero.
- `graphAdmissibleGreen_canonical` (relation; omitted; actual source carrier not written): gμ(KΓ,x)+gμ(x,x) is constant.
- `graphAdmissibleMeasure_pushforward` (compatibility; algebraic-fragment): i*μ is the admissible measure on the analytic curve.

**Mathematical unit tests.**

- `graphAdmissibleMeasure_good_reduction` (computation; fragment-example): For one vertex of genus g and no edges, μ is that vertex’s Dirac mass and gμ=0.
- `graphAdmissibleMeasure_tate_cycle` (compatibility; fragment-example): For a split multiplicative genus-one cycle μ is normalized length measure.
- `graphAdmissibleMeasure_genus_weight` (non-example; fragment-example): For a single genus-two vertex, omitting its genus weight produces mass zero rather than one.

**Acceptance.**

- State the selected graph-Laplacian sign in the supplier request.

**Lean correspondence.** The semistable model’s metrized dual graph, vertex genera and TB.3 resistance/Laplacian operations, linked to the curve’s skeleton.

`TauCeti.GrossZagier.AlgebraicFragments.graphAdmissibleMeasure` — algebraic-fragment.

**Sources.**

- [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.5, pp.115–116.

### Explicit admissible skeleton measure

`GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure` · theorem · `graphAdmissibleMeasure_resistance_formula`

With the graph data above, let r_e be the effective resistance between the endpoints of e in Γ∖e°, δ_e unit-mass length measure on e and δ_v a Dirac mass. Then i*μ=(1/g)i*(Σv g_vδ_v+Σe (r_e+1)⁻¹δ_e). A bridge has r_e=∞ and contributes zero; a loop has r_e=0. This agrees with the measure characterized by KΓ. The source’s canonical-bundle proof for g>1 does not by itself prove the genus-one case.

**Hypotheses.**

- K is complete discretely valued; C/K is smooth projective geometrically integral of genus g>0 with C(K) nonempty and split semistable reduction
- Γ is the graph of the minimal regular model, with unit edge lengths; eK=|uniformizer|⁻¹

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`, `TropicalAndBerkovichArithmetic:TB.3`, `TropicalAndBerkovichArithmetic:TB.6`.

**Construction or proof.**

1. Compute the Chern measure of the model dualizing line as i*δKΓ.
2. Use the model-function/Laplacian comparison to get c₁(ωa)=(2g−2)i*μ.
3. For g>1 compare with the admissible Chern measure and Zhang’s resistance formula.
4. Supply a separate genus-one argument using a degree-one line bundle or the good/Tate reduction cases; this proof refinement is recorded as a gap.

**Acceptance.**

- A unit single loop has uniform mass one; a bridge contributes none.

**Lean correspondence.** The actual skeleton, resistance measure and normalized admissible metric; a separate genus-one argument is required.

`graphAdmissibleMeasure_resistance_formula` — omitted; actual source carrier not written.

**Sources.**

- [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, Proposition A.5, pp.117–118.

### Admissible metrics at real places

`GrossZagierAndArithmeticHeights:GZ.2/real-admissible-descent` · construction · `realAdmissibleMetric`

For a smooth projective geometrically integral curve over ℝ of positive genus, its canonical complex Arakelov probability, diagonal and dualizing metrics are invariant under complex conjugation with the line-bundle real structure. They descend to Cᵃⁿ=C(ℂ)/Gal(ℂ/ℝ). The residue and diagonal compatibility of Theorem A.1 remain isometries. For complex places use the complex metrics directly.

**Hypotheses.**

- The real line-bundle structure is included; the quotient keeps the conjugation action

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/arakelov-probability-form`, `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green`, `GrossZagierAndArithmeticHeights:GZ.2/arakelov-dualizing-metric`, `ArakelovGeometryAndAbelianHeights:R35.1`.

**Construction or proof.**

1. Conjugation preserves the positive hermitian pairing and normalized Green equations.
2. Apply uniqueness to establish invariant metrics.
3. Descend the invariant norms, preserving the canonical residue isomorphisms.

**Uses.**

- `Yuan Appendix A.6`: Use the canonical metrics at real places.
- `GZ.2 global gluing`: Assemble conjugation-compatible archimedean data.

**Planning API.**

- `realAdmissibleMetric` (constructor; algebraic-fragment): The conjugation-descended canonical metric.
- `realAdmissibleMetric_pullback` (compatibility; algebraic-fragment): Pullback to C(ℂ) is the complex Arakelov metric.
- `realAdmissibleMetric_unique` (extensionality; algebraic-fragment): The real metric is determined by this pullback.
- `realAdmissibleMetric_residue` (relation; algebraic-fragment): The descended residue/diagonal isomorphisms are isometries.

**Mathematical unit tests.**

- `realAdmissibleMetric_conjugate_points` (characterisation; fragment-example): A point and its conjugate have equal induced norms.
- `realAdmissibleMetric_real_point` (compatibility; fragment-example): At a real point the residue norm is ordinary absolute value.
- `realAdmissibleMetric_wrong_involution` (non-example; fragment-example): A metric with unequal conjugate-point norms cannot descend.

**Acceptance.**

- The quotient does not identify real and complex place weights in global arithmetic sums.

**Lean correspondence.** The hermitian line bundle over the real curve, its conjugation descent datum and the invariant Green/curvature construction.

`TauCeti.GrossZagier.AlgebraicFragments.realAdmissibleMetric` — algebraic-fragment.

**Sources.**

- [Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), 21 August 2024 author manuscript, §A.6, p.119.

### Residue-normalized adjunction line

`GrossZagierAndArithmeticHeights:GZ.2/colmez-residue-line` · construction · `residueAdjunctionLine`

Over H, the Hilbert class field of E, let Pbar be the admissible arithmetic CM divisor, e its generic elliptic ramification index, and Mbar=LU,OH⊗O(Pbar/e). Residue gives a canonical generic trivialization M|P≃H; its integral image is a fractional ideal N with induced metric.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension`, `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`.

**Construction or proof.**

1. Use the orbifold Hodge bundle identity to identify its tensor with O(P/e) at P with (ω⊗O(P))|P.
2. Use the residue coordinate to trivialize the generic fibre and take the image of the integral lattice with its metric.

**Uses.**

- `Yuan–Zhang 2018 §9.2, pp. 629–630`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `residueAdjunctionLine_constructor` (constructor; algebraic-fragment): The residue image fractional ideal N of (L_U⊗O(P/e))|P, with induced metric.
- `residueAdjunctionLine_residue_coordinate` (extensionality; algebraic-fragment): The generic residue trivialization is independent of the local coordinate.
- `residueAdjunctionLine_finite_lattice` (projection; algebraic-fragment): At w, N_w is the image integral lattice in H_w.
- `residueAdjunctionLine_degree` (compatibility; omitted; actual source carrier not written): The arithmetic degree equals the sum of residue-lattice lengths and negative log norms.

**Mathematical unit tests.**

- `residueAdjunctionLine_coordinate_unit` (characterisation; fragment-example): Replacing local coordinate z by az+O(z²), a≠0, preserves the residue trivialization.
- `residueAdjunctionLine_ramification_one` (computation; fragment-example): For e=1 the bundle is L_U⊗O(P).
- `residueAdjunctionLine_unscaled_divisor` (non-example; fragment-example): For e>1, replacing O(P/e) by O(P) gives the wrong orbifold adjunction line.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual arithmetic Hodge line and CM section, ramification and the adjunction residue line with its metric.

`TauCeti.GrossZagier.AlgebraicFragments.residueAdjunctionLine` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.2, pp. 629–630.

### Squared-norm complex height symbol

`GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol` · construction · `classicalComplexHeight`

For disjoint degree-zero a,b, −2Σ_i,j n_i m_j g_Ar(x_i,y_j), using the unsquared-norm normalized Arakelov Green function. Its principal-divisor law is log|f|², and it is symmetric and biadditive.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green`, `HeightsRationalPointsAndObstructions:RP.0`.

**Construction or proof.**

1. Use the normalized unsquared-norm Arakelov kernel and multiply its divisor contraction by −2.
2. The Green principal-divisor identity gives log|f|²; degree zero eliminates the additive constant and gives uniqueness.

**Uses.**

- `Gross–Zagier 1986 Chapter II, §2, (2.1), pp. 236–237 (recalling Chap. I §4)`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.2 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `classicalComplexHeight` (constructor; algebraic-fragment): For disjoint degree-zero a,b, −2Σ_i,j n_i m_j g_Ar(x_i,y_j), using the unsquared-norm normalized Arakelov Green function.
- `classicalComplexHeight_principal` (characterisation; omitted; actual source carrier not written): For b=div(f), the value is Σ_i n_i log|f(x_i)|².
- `classicalComplexHeight_add` (relation; algebraic-fragment): Additive and symmetric on disjoint degree-zero divisors.
- `classicalComplexHeight_unique` (extensionality; algebraic-fragment): Any continuous biadditive symbol with the principal-divisor law equals it.

**Mathematical unit tests.**

- `classicalComplexHeight_zero` (degenerate; fragment-example): Zero divisor has symbol zero.
- `classicalComplexHeight_scale_function` (compatibility; fragment-example): Replacing f by cf has the same symbol because deg a=0.
- `classicalComplexHeight_square_factor` (non-example; fragment-example): Using −Σ g_Ar rather than −2Σ g_Ar gives log|f| instead of log|f|².

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`TauCeti.GrossZagier.AlgebraicFragments.classicalComplexHeight` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.1), pp. 236–237 (recalling Chap. I §4).

### Archimedean CM height sum

`GrossZagierAndArithmeticHeights:GZ.2/classical-archimedean-height-sum` · definition · `cmArchimedeanHeightSum`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Assume r_A(m) = 0, so that c and T_m d^σ have disjoint support. Define ⟨c, T_m d^σ⟩_∞ := Σ_{v|∞} ⟨c, T_m d^σ⟩_v, the sum over the h complex places of H of Néron's archimedean local symbols. Since Gal(H/K) ≅ Cl_K permutes these places simply transitively, ⟨c, T_m d^σ⟩_∞ = Σ_{A₁, A₂ ∈ Cl_K, A₁A₂⁻¹ = A} ⟨(τ_{A₁,𝔫}) − (∞), T_m((τ_{A₂,𝔫}) − (0))⟩_ℂ, where τ_{A,𝔫} ∈ 𝔥 are the points of Chap. II §1 (roots of aτ² + bτ + c = 0 of discriminant D with N | a) attached to the class A and the ideal 𝔫.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol`, `GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Construction or proof.**

1. Sum over the h complex places of the Hilbert class field.
2. Identify each embedding with the corresponding ideal class under reciprocity; the local symbol already uses |·|².

**Uses.**

- `Gross–Zagier 1986 Chapter II, §4, first two displays, p. 248`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.2 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `cmArchimedeanHeightSum` (constructor; algebraic-fragment): Σ_{v|∞} of the classical complex local symbols, one squared-norm symbol for each complex place.
- `cmArchimedeanHeightSum_orbit` (compatibility; algebraic-fragment): Equals the class-pair sum with A₁A₂⁻¹=A.
- `cmArchimedeanHeightSum_add` (relation; algebraic-fragment): Biadditive on admissible inputs.
- `cmArchimedeanHeightSum_class_count` (projection; algebraic-fragment): H has h complex places; no extra factor two is applied to their squared-norm symbols.

**Mathematical unit tests.**

- `cmArchimedeanHeightSum_h_one` (computation; fragment-example): For h=1 the sum is one complex-place symbol.
- `cmArchimedeanHeightSum_double_weight` (non-example; fragment-example): Counting every embedding and also using |·|² doubles the complex-place total.
- `cmArchimedeanHeightSum_disjoint` (characterisation; fragment-example): r_A(m)=0 is exactly the off-diagonal input condition when N>1.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`TauCeti.GrossZagier.AlgebraicFragments.cmArchimedeanHeightSum` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §4, first two displays, p. 248.

### Local intersection height comparison

`GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height` · theorem · `gz86_local_intersection_height`

Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Let 𝒳 be a regular model of the curve X over A_v, a, b relatively prime divisors of degree 0 on X over H_v, and A, B divisors on 𝒳 restricting to a, b on the general fibre. If A has zero intersection with every fibre component of 𝒳, then ⟨a, b⟩_v = −(A · B) log q.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `HeightsRationalPointsAndObstructions:RP.0`, `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`.

**Construction or proof.**

1. Use the regular-model local intersection/local-height comparison with valuation ord_v and residue size q_v.
2. Separate disjoint and tangent-regularized self terms; the local height is minus the intersection times log q_v.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_local_intersection_height` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, introduction, (0.1), p. 252.

### Rational-prime CM height sum

`GrossZagierAndArithmeticHeights:GZ.2/classical-p-height-sum` · definition · `cmPrimeHeightSum`

For the classical Heegner data, define the tensor-normalized contribution at a rational prime p by ⟨c,T_m d^σ⟩_p^Δ=−Σ_(v|p)[I_v^GZ(x,T_m x^σ)−r_A(m)ord_(v,x)(Δ)/(r_x+6)]log q_v. Here r_x+6=6/u and ord_(v,x)(Δ)=6ord_v(𝔫̄). Combine this finite sum with the eta-normalized complex contribution through classical-tensor-global-decomposition. For disjoint divisors r_A(m)=0 it is the ordinary sum of local symbols; for a diagonal at an exceptional CM point it is a redistribution of cotangent local symbols, not their uncorrected sum for an arbitrary tangent.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H11**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-modified-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tensor-global-decomposition`, `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-intersection-height`, `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`.

**Construction or proof.**

1. Use the Δ specialization of the tensor global decomposition.
2. Group its finite contributions by rational p and use log q_v=f_v log p.
3. Keep the paired eta normalization at infinity; an independently chosen cotangent sum may have additional scalar terms at p.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §9, (9.1), p. 264`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.2 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `cmPrimeHeightSum` (constructor; algebraic-fragment): The finite sum of modified CM intersections minus the discriminant tensor correction, weighted by −log q_v.
- `cmPrimeHeightSum_log_norm` (projection; algebraic-fragment): Each summand uses log q_v=f_vlog p.
- `cmPrimeHeightSum_galois` (extensionality; algebraic-fragment): Reindexing the places by Gal(H/K) does not change the sum.
- `cmPrimeHeightSum_global` (compatibility; algebraic-fragment): The finite Δ-normalized contribution is Σ_p cmPrimeHeightSum, with finite support; its eta-normalized archimedean partner gives the global height.
- `cmPrimeHeightSum_disjoint` (compatibility; omitted; actual source carrier not written): If r_A(m)=0, this contribution equals Σ_(v|p)⟨c,T_m d^σ⟩_v for the ordinary local symbols.

**Mathematical unit tests.**

- `cmPrimeHeightSum_inert` (computation; fragment-example): For inert p, each q_v=p² and there are h places of H above p.
- `cmPrimeHeightSum_ramified` (computation; fragment-example): If [𝔭] has order f, there are h/f places and each log q_v=f log p.
- `cmPrimeHeightSum_wrong_cardinality` (non-example; fragment-example): p^f is the residue cardinality, not the residue degree f.
- `cmPrimeHeightSum_level_tensor` (computation; omitted; actual source carrier not written): At a place v|𝔫̄ with u=3, r_A(m)=1 and ord_v(N)=1, the tensor correction contributes +3log q_v to the height sum, not +log q_v.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`TauCeti.GrossZagier.AlgebraicFragments.cmPrimeHeightSum` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.1), p. 264.
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), (9.18), p.130; TheoremA.1 and (A.9)–(A.10), pp.139–140.

## GZ.3: Quaternionic realization and modular differentials

Layer status: **planned**, implementation unchecked.

### Normalized Hodge class

`GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation` · construction · `normalizedHodgeClass`

On each geometric component of a finite-level quaternionic Shimura curve X_U, let ℒ_U be the imported rational arithmetic Hodge line, with orbifold canonical generic class in the compact case and the specified logarithmic cusp class in the modular case. Define ξ_U=c₁(ℒ_U)/deg(ℒ_U) on that component. It has degree one, is Galois invariant and rational. For a finite level map p:X_V→X_U, p^*ξ_U=deg(p)ξ_V and p_*ξ_V=ξ_U, with degrees taken on each mapped component. Thus ξ-normalization is compatible with level maps; on a compact curve no rational cusp is chosen.

**Hypotheses.**

- The Hodge degree on each component is positive; coarse stack stabilizer and cusp corrections retained
- Finite levels, including the exceptional modular case, are treated individually

**Inputs.** `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`.

**Construction or proof.**

1. Use the imported Hodge pullback isomorphism and its orbifold/cusp generic-fibre formula.
2. Divide by the component degree and use the finite-map degree formula.
3. Descend the rational class by Galois equivariance.

**Uses.**

- `YZZ §3.1`: Fix the origin of maps from the curve to A.
- `GZ.6 CM degree-zero classes`: Subtract ξ on the CM point’s component.

**Planning API.**

- `normalizedHodgeClass` (constructor; algebraic-fragment): c₁(ℒ_U)/deg(ℒ_U), component by component.
- `normalizedHodgeClass_degree` (projection; algebraic-fragment): Each geometric component has degree one.
- `normalizedHodgeClass_pullback` (functoriality; algebraic-fragment): p^*ξ_U=deg(p)ξ_V, with identity and composite level maps.
- `normalizedHodgeClass_pushforward` (functoriality; algebraic-fragment): p_*ξ_V=ξ_U.

**Mathematical unit tests.**

- `normalizedHodgeClass_degree_one` (computation; fragment-example): A component with Hodge degree d has normalized degree d/d=1.
- `normalizedHodgeClass_compact` (non-example; fragment-example): Normalization does not require a rational cusp or a chosen rational point.
- `normalizedHodgeClass_double_cover` (characterisation; fragment-example): For a connected degree-two level cover, pullback is 2ξ_V and push-forward of ξ_V is ξ_U.

**Acceptance.**

- A compact Shimura curve without rational cusp still has a degree-one rational ξ class.

**Lean correspondence.** The stack/cusp Hodge line, its degree on each quaternionic Shimura curve, actual proper level pullback and push-forward, and arithmetic Hodge construction owned by GZ.3.

`TauCeti.GrossZagier.AlgebraicFragments.normalizedHodgeClass` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.2.1, printed pp. 2-3. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §3.1.3, Lemma 3.1.1, pp. 70–71.

### Rational ξ-normalized realization

`GrossZagierAndArithmeticHeights:GZ.3/rational-xi-realization` · construction · `rationalXiRealization`

For a simple A/F that is a quotient of some Jacobian J_U, define π_A^U=Hom_F⁰(J_U,A), equivalently rational maps from X_U to A modulo constants whose rational extension to zero-cycles kills ξ_U. Take π_A=colim_U π_A^U under level pullback. The Hecke/right B_f× action and End_F⁰(A) action commute. A genuine integral map is ξ-normalized only when its value on ξ vanishes in A⊗ℚ; rational maps are not asserted to be ordinary morphisms divided by a denominator.

**Hypotheses.**

- A is geometrically parametrized by the given Shimura tower
- Hom⁰=Hom⊗ℚ; no modularity statement for arbitrary A

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`.

**Construction or proof.**

1. Use the Abel–Jacobi universal property to identify Hom(J_U,A) with maps modulo constants.
2. Use ξ to choose the rational constant and form the filtered colimit.
3. Check commuting actions by the functoriality of correspondences.

**Uses.**

- `YZZ §3.2 rational automorphic realization`: Realize the automorphic representation attached to a parametrized A.
- `GZ.8 test vectors`: Use rational maps as geometric inputs to the height identity.

**Planning API.**

- `rationalXiRealization` (constructor; algebraic-fragment): The colimit of Hom_F(J_U,A)⊗ℚ.
- `rationalXiRealization_level` (projection; algebraic-fragment): The canonical map from a finite-level Hom⁰ space.
- `rationalXiRealization_ext` (extensionality; algebraic-fragment): Two representatives agree iff they agree after pullback to a common finer level.
- `rationalXiRealization_actions` (structure; algebraic-fragment): The Hecke and endomorphism actions commute.
- `rationalXiRealization_xi` (compatibility; algebraic-fragment): The representative rational map sends ξ to zero.

**Mathematical unit tests.**

- `rationalXiRealization_constant` (degenerate; fragment-example): A constant map represents zero.
- `rationalXiRealization_identity` (characterisation; fragment-example): For A=J_U the Abel–Jacobi map normalized by ξ represents the identity homomorphism.
- `rationalXiRealization_finer_level` (compatibility; fragment-example): A map and its level pullback have the same colimit class.

**Acceptance.**

- Changing a map by a constant does not change its Hom⁰ realization.

**Lean correspondence.** The modular Jacobians, normalized ξ, actual Hom(J_U,A) systems, transition morphisms and dual coefficient-field action.

`TauCeti.GrossZagier.AlgebraicFragments.rationalXiRealization` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.2.1, printed pp. 2-3. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §3.2.3, pp. 86–87.

### Strict GL₂ realization and transfer

`GrossZagierAndArithmeticHeights:GZ.3/strict-gl2-realization` · theorem · `strictGL2_realization`

For a simple F-abelian quotient A of the quaternionic Shimura tower in characteristic zero, the Hecke isotypic summand gives a number field M=End_F⁰(A) with [M:ℚ]=dim A. The rational realization π_A is irreducible over M, its scalar extension to each fixed coefficient embedding is the specified automorphic quaternionic constituent, and it matches the GL₂ Jacquet–Langlands transfer. The rational endomorphism and Galois-field statements concern this parametrized A and its chosen rational Hecke summand.

**Hypotheses.**

- The relevant weight-two cohomological constituent occurs in the Jacobian; simple quotient and rational field of definition fixed
- The scalar realization/transfer and multiplicity-one inputs are supplied externally

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.3/rational-xi-realization`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

**Construction or proof.**

1. Decompose finite-level Jacobians by the rational Hecke algebra.
2. Compare the Hom⁰ multiplicity spaces with weight-two cohomology using the imported realization theorem.
3. Apply transfer and its rational-model comparison, then take the tower colimit.

**Acceptance.**

- The theorem contains no assertion that every abelian variety is modular.

**Lean correspondence.** The simple GL₂-type quotient abelian variety, End⁰/Hom geometry, the actual quaternionic action and the normalized Hom colimit.

`strictGL2_realization` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.2.1, printed pp. 2-3. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, Theorem 3.2.6 and Lemma 3.2.7, pp. 87–88.

### Volume-normalized composition pairing

`GrossZagierAndArithmeticHeights:GZ.3/composition-pairing` · construction · `compositionPairing`

For f₁∈Hom⁰(J_U,A) and f₂∈Hom⁰(J_U,A∨), define (f₁,f₂)_U=(f₁∘λ_J⁻¹∘f₂∨)/vol(X_U), as an element of End⁰(A)=M using the canonical principal polarization λ_J. The quotient volume is the fixed YZZ geometric volume, scaling by degree under level covers. The projection formula makes the pairing level independent, M-bilinear with the dual action, and perfect on the paired realizations. In dimension one, using the principal polarization of E, (f,f) is deg(f)/vol(X_U).

**Hypotheses.**

- A and A∨ satisfy the parametrized strict GL₂ hypotheses
- The composition includes λ_J⁻¹; f₂∨:A→J_U∨ is not silently identified with a map to J_U

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.3/rational-xi-realization`, `GrossZagierAndArithmeticHeights:GZ.3/strict-gl2-realization`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A6/degree-formulas-for-polarized-isogenies`.

**Construction or proof.**

1. Compose the two Hom⁰ maps through the Jacobian principal polarization.
2. Use push-pull=[degree] for a finite level map and divide by its geometric volume.
3. Compare the induced polarization to prove perfectness; specialize the pull-push composition to [deg f] for E.

**Uses.**

- `YZZ §3.2 and main height formula`: Normalize modular degrees and pair the two rational realizations.
- `GZ.5 Petersson factorization`: Fix the rational global invariant form.

**Planning API.**

- `compositionPairing` (constructor; algebraic-fragment): The End⁰(A) composition divided by curve volume.
- `compositionPairing_level` (functoriality; algebraic-fragment): Pullback of both maps preserves the volume-normalized pairing.
- `compositionPairing_endomorphism` (relation; algebraic-fragment): The M action on the first map is adjoint to the dual action on the second.
- `compositionPairing_elliptic` (compatibility; algebraic-fragment): The polarized elliptic self-composition is deg(f)/vol(X_U).
- `compositionPairing_add` (structure; algebraic-fragment): For the fixed level volume, the composition pairing is additive in each Hom variable, with the dual map additive in the second variable.

**Mathematical unit tests.**

- `compositionPairing_zero` (degenerate; fragment-example): The pairing is zero when either map is zero.
- `compositionPairing_cover` (computation; fragment-example): A degree-d cover multiplies both the unnormalized composition and the volume by d.
- `compositionPairing_isogeny` (characterisation; fragment-example): Postcomposition by a polarized elliptic isogeny of degree m multiplies the self-composition by m.

**Acceptance.**

- Both composition order and dualization are type-correct before taking the scalar coefficient.

**Lean correspondence.** Actual Hom spaces of abelian varieties, the dual morphism, polarizations and normalized level volume; arbitrary linear maps only supply composition algebra.

`TauCeti.GrossZagier.AlgebraicFragments.compositionPairing` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.2.2, printed pp. 3-4. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §3.2.4, Lemma 3.2.9 and Theorem 3.2.10, pp. 89–91.

### Petersson and modular-degree comparison

`GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison` · comparison · `petersson_composition_comparison`

Under the fixed complex embedding of M, the composition form on π_A×π_A∨ agrees with the automorphic Petersson invariant form after the stated YZZ volume normalization. Fix local invariant forms whose restricted tensor product is this global form. For f∈S₂(Γ₀(N)) with ω_f=2πif(z)dz and unnormalized Petersson (f,f)=∫|f(z)|²dxdy, i∫ω_f∧overline(ω_f)=8π²(f,f); for φ:X₀(N)→E, φ*ω_E=cφω_f implies i∫φ*ω_E∧overline(φ*ω_E)=|cφ|²8π²(f,f)=deg(φ) i∫_Eω_E∧overline(ω_E).

**Hypotheses.**

- Pairings use the same coefficient embedding and differential; modular parametrization is nonconstant
- The geometric-to-automorphic invariant-form comparison is a theorem, not equality by arbitrary renormalization

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.3/composition-pairing`, `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `AutomorphicFormsOnReductiveGroups:AF.3`, `AutomorphicFormsOnReductiveGroups:AF.2`, `ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`, `ModularCurvesPartII:R14.3/cup-product-petersson`.

**Construction or proof.**

1. Use weight-two Hodge/cohomology duality and the polarizations to compare the invariant forms.
2. Fix the tensor factorization with unramified unit normalizations.
3. Compute ω_f∧overline(ω_f) and apply finite-map integration to obtain the modular-degree formula.

**Acceptance.**

- An isogeny changing both degree and differential respects the equality.

**Lean correspondence.** The actual differential/cup-product and classical/adelic Petersson forms, normalized quaternionic realization and level volumes.

`petersson_composition_comparison` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.2.2, printed pp. 3-4. Historical 2013-edition locator; current support is the separately cited public version.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), I §6, p.230.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §3.3.1 and §3.3.3, pp. 94–99; §3.6.3–§3.6.4, Theorem 3.6.2, pp. 110–113.

### Manin constant

`GrossZagierAndArithmeticHeights:GZ.3/manin-constant` · definition · `maninConstant`

For a normalized rational newform f of weight two and conductor N, a nonconstant parametrization φ:X₀(N)_ℚ→E and a chosen minimal Néron differential ω_E, define cφ∈ℚ× by φ*ω_E=cφ·ω_f with ω_f=f(q)dq/q=2πif(z)dz. Its sign changes with ω_E, but its p-adic valuation does not. For an isogeny ψ:E→E′ with ψ*ω_E′=aψω_E, c_{ψ∘φ}=aψcφ. Multiplication by n changes c by n and degree by n².

**Hypotheses.**

- f has a₁=1 and matches E; φ pulls back nontrivially; invariant differential is the minimal one

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.3/rational-xi-realization`, `NeronModelsAndSemistableAbelianVarieties:R11.1`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`.

**Construction or proof.**

1. Use multiplicity one to identify the pullback differential line.
2. Take the coefficient against ω_f and retain its nonzero rational value.
3. Compose differential pullbacks to prove the isogeny law.

**Uses.**

- `JSW Remark 7.3.3 and BSD.6/6a`: Compare the Néron period with the modular-form period at p.
- `BSD.7a and ModularIwasawaMainConjectures:L3`: Retain the differential factor in canonical-period comparisons.

**Planning API.**

- `maninConstant` (constructor; algebraic-fragment): The nonzero rational coefficient of ω_f in φ*ω_E.
- `maninConstant_pullback` (characterisation; algebraic-fragment): φ*ω_E=cφω_f.
- `maninConstant_isogeny` (functoriality; algebraic-fragment): c_{ψ∘φ}=aψ cφ, including identity/composition of isogenies.
- `maninConstant_sign` (compatibility; algebraic-fragment): Changing ω_E to −ω_E changes cφ to −cφ.

**Mathematical unit tests.**

- `maninConstant_multiplication` (computation; fragment-example): For a nonconstant modular parametrization φ and n≠0, composition with [n] multiplies the Manin constant by n and the modular degree by n². The nonzero hypothesis keeps the composite nonconstant.
- `maninConstant_sign_valuation` (compatibility; fragment-example): The p-adic valuation is invariant under ω_E↦−ω_E.
- `maninConstant_11a3` (non-example; fragment-example): For the minimal X₀(11)→11a3 isogeny, cφ=deg φ=5 after a sign choice, so nonoptimal constants are not universally 1.

**Acceptance.**

- The definition does not assume that cφ=1.

**Lean correspondence.** The nonconstant modular parametrization, rational newform differential, Néron differential and their pullback, including integral models at bad primes.

`TauCeti.GrossZagier.AlgebraicFragments.maninConstant` — algebraic-fragment.

**Sources.**

- [The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446), Introduction, p.2.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Published Invent. Math. 84 (1986), Chapter V, §2, p.310.

### Integral Manin constant and p-unit range

`GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit` · theorem · `maninConstant_integral_p_unit`

For any modular parametrization φ:X₀(N)_ℚ→E the Manin constant cφ is an integer up to sign. If φ is X₀(N)-optimal and p>2 is a semistable prime for E, then p∤cφ. In particular p∤2N suffices, hence p∤2ND supplies the p-unit statement used by JSW for E and, on choosing its own optimal parametrization, E^D. The sharper semistable statement including p=2 is available by Česnavičius; it does not make a nonoptimal parametrization p-optimal automatically.

**Hypotheses.**

- Optimal means the Jacobian quotient has connected kernel, equivalently minimal parametrization within the relevant isogeny class
- The JSW consumer also needs its stated residual/isogeny hypotheses for transfer to its chosen E

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `ModularCurvesPartII:R14.6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-uniqueness`.

**Construction or proof.**

1. Prove integrality by reduction to Γ₁(N) and q-expansion lattices (CNS Lemma 6.5).
2. Apply Mazur’s exactness theorem for Néron differentials at an odd semistable prime, with Raynaud’s finite-flat uniqueness.
3. Use the exact local differential-transfer theorem for the actual parametrization; do not drop its denominator factor.

**Acceptance.**

- At p∤2ND both optimal constants are p-units.
- The 11a3 nonoptimal parametrization with c=5 prevents a universal isogeny-class p-unit claim.

**Lean correspondence.** The integral modular and Néron models, q-expansion/differential comparison and the exact Raynaud uniqueness range.

`maninConstant_integral_p_unit` — omitted; actual source carrier not written.

**Sources.**

- [The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446), Introduction p.2; Lemma6.5.
- [Global divisibility of Heegner points and Tamagawa numbers](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/475417137355BE27B3888862CADB0286/S0010437X08003497a.pdf/global_divisibility_of_heegner_points_and_tamagawa_numbers.pdf), §1, p.812.

### Manin isogeny and twist transfer

`GrossZagierAndArithmeticHeights:GZ.3/manin-isogeny-twist-transfer` · theorem · `maninConstant_isogeny_twist_transfer`

For optimal φ₀:X₀(N)→E₀ and ψ:E₀→E, write ψ*ω_E=aψω_E₀. Then v_p(c_{ψφ₀})=v_p(aψ)+v_p(cφ₀); the dual isogeny gives aψ aψ∨=deg ψ up to the fixed differential signs. If p∤deg ψ, both valuations of aψ are zero and p-unitness transfers. For a squarefree quadratic twist D and p∤2ND, choose local minimal differentials and the twist isomorphism over ℚ_p(√D); its differential factor is a p-unit, and the optimal twist’s Manin constant is a p-unit. A chosen nonoptimal twist parametrization still requires the same p-prime-to-isogeny condition.

**Hypotheses.**

- Differentials are minimal at p; twist isomorphism and optimal parametrizations are specified
- Isogeny degree is prime to p whenever p-unit transfer is asserted

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit`, `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `NeronModelsAndSemistableAbelianVarieties:R11.1`.

**Construction or proof.**

1. Compose the pullback differential equations.
2. Use ψ∨ψ=[deg ψ] on differential lattices to control the two integral factors.
3. At p∤2D the quadratic twist is unramified and its minimal differential scaling is a local unit; apply the optimal p-unit theorem to the twist.

**Acceptance.**

- A degree-p isogeny is not allowed to transfer p-unitness without computing its differential factor.

**Lean correspondence.** Actual isogeny and twist morphisms, their minimal invariant differentials and local differential valuations.

`TauCeti.GrossZagier.AlgebraicFragments.maninConstant_isogeny_twist_transfer` — algebraic-fragment.

**Sources.**

- [The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446), Introduction pp.2–3.

### Manin constant and modular degree

`GrossZagierAndArithmeticHeights:GZ.3/manin-degree-divisibility` · theorem · `maninConstant_dvd_modularDegree`

For Γ₁(N)⊆Γ⊆Γ₀(N) and any surjection φ:X_Γ,ℚ→E, cφ divides 6deg φ; if 8∤N and 27∤N, cφ divides deg φ. More precisely v_p(cφ)≤v_p(deg φ)+δp, where δ₂=1 only if v₂(N)≥3 and no prime p′|N has p′≡3 mod4, δ₃=1 only if v₃(N)≥3 and no p′|N has p′≡2 mod3, and δp=0 otherwise. For Γ=Γ₁(N) the stronger cφ|deg φ always holds.

**Hypotheses.**

- Néron differential and normalized newform fixed; all constants taken up to sign

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `ModularCurvesPartII:R14.6`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Construction or proof.**

1. Use CNS integral dualizing differential theorem and the local Whittaker denominator bounds.
2. Combine with the finite-map trace on differential lattices to bound cφ by the modular degree.
3. Track the exceptional 2/3 denominators exactly as Theorem1.2.

**Acceptance.**

- For X₀(11)→11a3, c=deg=5 satisfies the bound while c=1 would be false.

**Lean correspondence.** The integral modular differential pullback and dualizing sheaf comparison entering the modular degree, including bad-prime patching.

`maninConstant_dvd_modularDegree` — omitted; actual source carrier not written.

**Sources.**

- [The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446), Theorems1.1–1.2, p.3.

### Eigendifferential period comparison

`GrossZagierAndArithmeticHeights:GZ.3/classical-eigendifferential-period` · theorem · `gz86_eigendifferential_period`

For ω_f = 2πi f(z) dz the eigendifferential of f on X(ℂ): ‖ω_f‖² = ∬_{X(ℂ)} ω_f ∧ i \bar{ω_f} = 8π²(f, f).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- This differential comparison is restricted to k=1: f has weight two. For k>1, f(z)dz is not a differential on X₀(N).

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison`, `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`.

**Construction or proof.**

1. At weight two, expand (2πi f dz) ∧ i conjugate(2πi f dz)=8π²|f|² dx∧dy, with the complex orientation.
2. Integrate over a fundamental domain using the unnormalized weight-two Petersson measure. The modular-degree/Manin-constant comparison is a separate consequence, not needed for this identity.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual classical CM/modular objects, compatible number-field places, newform/Néron differentials or periods named in this target; its class-field/model and modular-form suppliers must connect those carriers.

`gz86_eigendifferential_period` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §6, p. 230.

### Modular period-degree comparison

`GrossZagierAndArithmeticHeights:GZ.3/classical-modular-period-degree` · theorem · `gz86_modular_period_degree`

Setting of Chap. V §2: f ∈ S₂(Γ₀(N)) a newform with rational integer coefficients, E/ℚ an elliptic curve with L(E, s) = L(f, s), π: X₀(N) → E a covering over ℚ with π(∞) = 0; K = ℚ(√D) as in §1 (D odd fundamental, every p | N split in K), u_K = #O_K^×/2. With ‖ω‖² := ∬_{E(ℂ)} |ω ∧ ω̄| and ‖ω_f‖² = ∬_{X₀(N)(ℂ)} |ω_f ∧ ω̄_f| = 8π²(f, f): ‖ω‖² = c²‖ω_f‖²/deg(π).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.3/classical-eigendifferential-period`, `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `ModularCurvesPartII:R14.2`.

**Construction or proof.**

1. Integrate the squared pullback differential over X₀(N).
2. The analytic degree formula and ω∧ω̄ expression give the source real-period/Petersson constant with c_π².

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual classical CM/modular objects, compatible number-field places, newform/Néron differentials or periods named in this target; its class-field/model and modular-form suppliers must connect those carriers.

`gz86_modular_period_degree` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter V, §2, p. 310.

## GZ.4: Local toric functionals and test vectors

Layer status: **planned**, implementation unchecked.

### Local toric functional space

`GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space` · definition · `toricHom`

For a local field Fv of characteristic zero, a quadratic étale algebra Kv embedded in Bv, an irreducible admissible representation πv of Bv× (generic if split), and χv with χv|Fv×·ωπv=1, define P(πv,χv)=Hom_Kv×(πv,χv⁻¹). Its elements are continuous linear functionals ℓ with ℓ(πv(t)f)=χv(t)⁻¹ℓ(f). At real places use the smooth Casselman–Wallach representation and continuous Hom; at nonarchimedean places use the smooth category.

**Hypotheses.**

- Quadratic étale includes Fv×Fv; coefficient field and continuity category fixed

**Inputs.** `SmoothRepresentationsOfLocalGroups:SR.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`.

**Construction or proof.**

1. Restrict the existing representation to the embedded torus.
2. Form the equivariant Hom space using the matching-centre condition.

**Uses.**

- `Saito–Tunnell theorem`: State distinction as dimension one versus zero.
- `GZ.5 and GZ.8 zero cases`: Explain vanishing when a local toric Hom is zero.

**Planning API.**

- `toricHom` (constructor; algebraic-fragment): The torus-equivariant continuous Hom space.
- `toricHom_equivariance` (characterisation; algebraic-fragment): ℓ(π(t)f)=χ(t)⁻¹ℓ(f).
- `toricHom_transport` (functoriality; algebraic-fragment): An intertwining isomorphism induces an isomorphism of toric Hom spaces.
- `toricHom_center` (relation; algebraic-fragment): If the centre does not match, every toric functional is zero.

**Mathematical unit tests.**

- `toricHom_wrong_center` (non-example; fragment-example): If χ(z)ωπ(z)≠1 for some central z, the Hom space is zero.
- `toricHom_zero_vector` (degenerate; fragment-example): Every functional evaluates the zero vector to zero.
- `toricHom_character_inverse` (characterisation; fragment-example): A vector with torus character χ⁻¹ can pair with the functional; one with a different torus character is killed.

**Acceptance.**

- The central-character condition is necessary for a nonzero functional.

**Lean correspondence.** The genuine local quadratic torus embedding, smooth GL₂/quaternionic representation and transfer, invariant pairing, local L/epsilon factors and chosen torus/order measures; arbitrary group actions or lattices omit these representation-theoretic hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.toricHom` — algebraic-fragment.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), §3.1, p.21.

### Saito–Tunnell dichotomy

`GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional` · theorem · `saitoTunnell`

For the data of toricHom, dim P(πv,χv)≤1 and equals one precisely when εBC(1/2,πv,Kv⊗χv)=χv(−1)ε(Bv). For a nonsplit quadratic field and a discrete-series GL₂ representation, exactly one of the split algebra and its division inner form is distinguished. For split Kv the distinguished algebra is split. Include the real discrete-series/compact-quaternion alternative using the actual torus weights; nonarchimedean characteristic-zero local fields include dyadic and wildly ramified cases.

**Hypotheses.**

- πv generic in the split case; division case is compared with its discrete-series transfer
- Use base-change epsilon convention, or translate the Rankin convention by ηv(−1)

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space`, `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Construction or proof.**

1. Import the genuine local correspondence and epsilon factors.
2. Prove multiplicity one and the epsilon criterion by the Tunnell/Saito local character argument.
3. Treat split tori and real discrete-series weights separately; translate CST’s Rankin sign using GZ.0.

**Acceptance.**

- A wrong local Hasse invariant forces zero Hom, including at a dyadic place.

**Lean correspondence.** The genuine local quadratic torus embedding, smooth GL₂/quaternionic representation and transfer, invariant pairing, local L/epsilon factors and chosen torus/order measures; arbitrary group actions or lattices omit these representation-theoretic hypotheses.

`saitoTunnell` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Thm. 1.3, printed p. 10. Historical 2013-edition locator; current support is the separately cited public version.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), §3.1, theorem preceding Lemma3.1.
- [On Tunnell’s formula for characters of GL(2)](https://www.numdam.org/article/CM_1993__85_1_99_0.pdf), §1, pp.99–100; §2 proof, pp.100–108.

### Normalized local toric form

`GrossZagierAndArithmeticHeights:GZ.4/normalized-toric-integral` · construction · `normalizedToricForm`

For an essentially unitary local pair (πv,χv) with fixed invariant pairing b_v, define αv(f₁,f₂)=L(1,ηv)L(1,πv,ad)/(ζv(2)L(1/2,πv,Kv⊗χv))·∫_{Kv×/Fv×} b_v(πv(t)f₁,f₂)χv(t)dtv. Use the matching nonzero local factors and the quotient measure of GZ.0. The integral is absolutely convergent for these local data and generates P(πv,χv)⊗P(π̃v,χv⁻¹) when distinguished; it is zero otherwise. Define βv=αv/b_v only for pairs with b_v≠0; αv itself is defined for all pairs.

**Hypotheses.**

- Invariant pairing and quotient Haar measure fixed; essentially unitary; generic in split case
- Algebraic rationality is asserted only at finite places with the supplied rational structures
- Essentially unitary pair means there is a character μ=|·|^s such that π⊗μ and χ⊗μ_K^{-1} are both unitary, as in CST §3.1. It is not a condition on π alone.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `GrossZagierAndArithmeticHeights:GZ.0/identity-rescaling`.

**Construction or proof.**

1. Apply the local matrix-coefficient decay/convergence theorem.
2. Use equivariance of Haar integration and multiplicity one to identify the generated tensor functional.
3. Evaluate spherical data and compare rational structures at nonarchimedean places.

**Uses.**

- `YZZ Theorems1.2 and1.4`: The local factors form the global invariant bilinear tensor.
- `CST Theorems1.6 and1.9`: Compare finitely altered test vectors.

**Planning API.**

- `normalizedToricForm` (constructor; algebraic-fragment): The L-normalized torus integral αv on πv×π̃v.
- `normalizedToricForm_bilinear` (structure; algebraic-fragment): αv is bilinear in its two vectors.
- `normalizedToricForm_rescale` (relation; algebraic-fragment): Scaling dtv by b and b_v by c scales αv by bc.
- `normalizedToricForm_twist` (compatibility; algebraic-fragment): Replacing (π,χ) by (π⊗μ,χ⊗μ_K⁻¹) preserves the form with compatible pairings.
- `normalizedToricForm_zeroHom` (characterisation; algebraic-fragment): αv=0 if the toric Hom space is zero.

**Mathematical unit tests.**

- `normalizedToricForm_spherical` (computation; fragment-example): For unramified π,χ,K/F and unit-volume compact quotient, αv(f₁,f₂)=b_v(f₁,f₂) on spherical vectors.
- `normalizedToricForm_zero` (degenerate; fragment-example): αv(0,f₂)=0 even when βv would be undefined.
- `normalizedToricForm_measure_two` (non-example; fragment-example): Doubling dtv doubles αv; it does not halve it.

**Acceptance.**

- No denominator b_v is used in the bilinear αv formula.

**Lean correspondence.** The genuine local quadratic torus embedding, smooth GL₂/quaternionic representation and transfer, invariant pairing, local L/epsilon factors and chosen torus/order measures; arbitrary group actions or lattices omit these representation-theoretic hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.normalizedToricForm` — algebraic-fragment.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), §3.1, pp.21–22.

### Unramified toric value and finite product

`GrossZagierAndArithmeticHeights:GZ.4/unramified-toric-value` · theorem · `normalizedToricForm_unramified`

For spherical unramified πv and χv on a split Bv, an unramified quadratic field Kv/Fv and dtv with compact quotient volume one, βv(f₁,v,f₂,v)=1. Thus α=⊗vαv is defined on restricted pure tensors with standard vectors and local invariant forms at almost all v; only finitely many normalized factors differ from one. Split unramified tori are evaluated separately with the multiplicative Haar normalization, including both GL₂ Whittaker directions.

**Hypotheses.**

- The local invariant vector pairing is nonzero when β is used
- All unramified normalizations are compatible with the global factorization

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.4/normalized-toric-integral`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/spherical-whittaker-values`.

**Construction or proof.**

1. Evaluate the toric matrix coefficient using the spherical Whittaker/Satake expansion.
2. Cancel the local L-factors and quotient volume.
3. Use the restricted tensor product and bilinearity to define the global form, including zero pairs.

**Acceptance.**

- An unramified newvector with ramified χ is not covered by this theorem.

**Lean correspondence.** The genuine local quadratic torus embedding, smooth GL₂/quaternionic representation and transfer, invariant pairing, local L/epsilon factors and chosen torus/order measures; arbitrary group actions or lattices omit these representation-theoretic hypotheses.

`normalizedToricForm_unramified` — omitted; actual source carrier not written.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), §3.1, spherical-value paragraph.

### Admissible toric order

`GrossZagierAndArithmeticHeights:GZ.4/admissible-toric-order` · definition · `admissibleToricOrder`

Let n be the conductor of πv^JL, c the conductor of χv, and c₁=0 when Kv is nonsplit and c<n, c₁=c otherwise. An admissible order Rv⊂Bv has discriminant p^n and Rv∩Kv=𝒪_{c₁}. When 0<c₁ and n>0 in the split algebra, require Rv=R′∩R″ with R′∩Kv=𝒪_c and R″∩Kv=𝒪_{max(c−n,0)}. If Kv is split and 0<c<n, there are two Kv×-conjugacy choices; choose the one whose χ_i(a)=χ(a,1) or χ_i(a)=χ(1,a) has conductor c. This is CST’s order, not every order with the same discriminant.

**Hypotheses.**

- The Saito–Tunnell matching condition; local characteristic zero
- At conductor mismatch where c₁<n, the nonsplit field part uses the torus-character eigenspace rather than claiming all R× invariants work

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/casselman-newvector`.

**Construction or proof.**

1. Classify torus-conjugacy classes of Eichler orders by their two lattices.
2. Apply CST Definition1.3’s conductor orientation to select an order.
3. For division B use the unique compatible maximal/suborder data and torus eigencondition.

**Uses.**

- `CST Propositions3.7–3.8`: Construct the one-dimensional nonzero test-vector line.
- `GZ.5 explicit formula`: Retain conductor and removed-Euler-factor corrections.

**Planning API.**

- `admissibleToricOrder` (constructor; algebraic-fragment): The order together with its embedded torus and conductor orientation.
- `admissibleToricOrder_intersection` (projection; algebraic-fragment): Rv∩Kv=𝒪_{c₁}.
- `admissibleToricOrder_discriminant` (projection; algebraic-fragment): disc Rv=p^n.
- `admissibleToricOrder_conjugate` (functoriality; algebraic-fragment): Kv×-conjugation preserves admissibility with transported vectors.

**Mathematical unit tests.**

- `admissibleToricOrder_unramified` (computation; fragment-example): For n=c=0 take the maximal order with full 𝒪_K intersection.
- `admissibleToricOrder_mismatch` (non-example; fragment-example): For nonsplit K and c<n, the required intersection is 𝒪_K, not 𝒪_c.
- `admissibleToricOrder_split_orientation` (characterisation; fragment-example): For 0<c<n in split K, the chosen lattice orientation corresponds to the conductor-c character factor.

**Acceptance.**

- The two split mismatch orders are not interchanged without also changing the character direction.

**Lean correspondence.** The genuine local quadratic torus embedding, smooth GL₂/quaternionic representation and transfer, invariant pairing, local L/epsilon factors and chosen torus/order measures; arbitrary group actions or lattices omit these representation-theoretic hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.admissibleToricOrder` — algebraic-fragment.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), Definition1.3 and preceding conditions, pp.5–6.

### Nonzero toric test vectors

`GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors` · theorem · `toricTestVector_nonzero`

For a distinguished local pair, a nonzero toric functional has a nonzero test vector. In the nonarchimedean CST conductor setting the line V(πv,χv) is the central-character eigenspace for the specified admissible-order/newvector subgroup and, when nonsplit c<n, the χv⁻¹ torus eigenspace; CST Proposition3.7 gives dimension one and nonzero toric evaluation. In the split conductor-mismatch case the correct translate/orientation is required. At real places use the matching discrete-series/compact-quaternion weight. The general distinguished characteristic-zero theorem includes dyadic data; the explicit order formulas carry their individual hypotheses.

**Hypotheses.**

- The exact admissible order and conductor choices from admissibleToricOrder
- For a particular explicit local value, use the relevant CST case rather than a universal spherical assertion

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.4/admissible-toric-order`, `GrossZagierAndArithmeticHeights:GZ.4/normalized-toric-integral`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/normalized-newvector`.

**Construction or proof.**

1. Apply local multiplicity one and construct the CST invariant/eigenline.
2. Compute its toric integral using the local order and newvector translates.
3. Use the archimedean weight decomposition for the real case.

**Acceptance.**

- Ramified χ can kill the untranslated spherical vector; a nonzero translate is required.

**Lean correspondence.** The genuine local quadratic torus embedding, smooth GL₂/quaternionic representation and transfer, invariant pairing, local L/epsilon factors and chosen torus/order measures; arbitrary group actions or lattices omit these representation-theoretic hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.toricTestVector_nonzero` — algebraic-fragment.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), Definition1.4; Proposition3.7; §3.3.

## GZ.5: Coherent periods and Waldspurger comparison

Layer status: **planned**, implementation unchecked.

### Coherent quaternionic theta specialization

`GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization` · theorem · `coherentQuaternionicTheta`

For coherent quaternionic B/F and an embedded nontrivial quadratic field K/F, specialize the imported extended Weil representation and unit-quotiented theta kernel to q=Nrd_B and its binary norm subspaces K and Kj. Each binary norm is anisotropic even when B is split: with probability Haar, E(0,g,Φ)=2∫θ(g,h,Φ)dh. In YZZ’s toric convention, where the quotient has volume2L(1,η), the double toric theta integral is L(1,η)I(0,g,χ,Φ). For division B the anisotropic ternary trace-zero identity gives the Shimizu/Petersson contraction used in the factorization. For split B the generic ternary second-term identity remains an identity modulo the residual image; the exact split Shimizu comparison is a separate required input, not a consequence asserted here.

**Hypotheses.**

- Adelic additive character, self-dual measures, torus quotient and probability measures compared by GZ.0
- Convergence/regularization regime is matched to binary/ternary Witt index, not assumed
- For O(V_m)×Sp_(2n), ordinary convergence requires r=0 or m−r>n+1. Here n=1; a quadratic-field norm has (m,r)=(2,0), division trace-zero data have (3,0), and split trace-zero data have (3,1), outside the ordinary range. The generic split binary (2,1) is an additional MP supplier case, not the norm of this K/F. YZZ’s 2011 draft Proposition2.2.1 proves the nonsplit case by Siegel–Weil and refers its split case to a different Waldspurger argument.

**Inputs.** `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`, `MetaplecticAutomorphicForms:MP.6/toric-theta-pairing-interface`, `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`, `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`.

**Construction or proof.**

1. Import the exact binary norm and ternary trace-zero exports from MP.6.
2. Compare their Haar and Weil splittings to the toric conventions.
3. For division B use the anisotropic ternary Siegel–Weil identity and the source’s cuspidal unfolding. For split B first supply the separately normalized Shimizu factorization from Waldspurger’s original argument, or a fully sourced comparison from GQT’s residual-image identity to that pairing; no elimination of the residual terms is assumed.

**Acceptance.**

- The binary norm identity alone is insufficient: the ternary identity is a separate prerequisite.
- The generic split binary supplier uses A₁=B₀; it is not the quadratic-field norm used here. Neither that exceptional formula nor the split ternary quotient identity alone proves the split Shimizu contraction.

**Lean correspondence.** The actual coherent quaternionic automorphic representation and contragredient, probability toric periods, quaternionic Tamagawa form, restricted tensor product and normalized MP.6 Shimizu/see-saw interface.

`coherentQuaternionicTheta` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.4.2, printed pp. 11-12. Historical 2013-edition locator; current support is the separately cited public version.
- [The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula](https://arxiv.org/pdf/1207.4709v3), arXiv:1207.4709v3 §1.7, pp.3–4.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), Public 2011 draft, §2.2.1, Proposition 2.2.1 and proof, printed pp.47–49.
- [Sur les valeurs de certaines fonctions L automorphes en leur centre de symétrie](https://www.numdam.org/item/CM_1985__54_2_173_0.pdf), II.1, pp.182–184; II.2, Proposition3 and corollary, pp.184–187.

### Waldspurger period formula

`GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof` · theorem · `waldspurger`

Let π be a cuspidal quaternionic automorphic representation, K/F quadratic with ωπχ|A_F×=1, and χ unitary. Define Pχ using probability measure on K×A_F×\A_K×, the global invariant form using quaternionic Tamagawa volume2, and α as the restricted tensor product of GZ.4’s local bilinear forms. For all f₁∈π and f₂∈π̃, Pχ(f₁)Pχ⁻¹(f₂)=ζ_F(2)L(1/2,π_K⊗χ)/(8L(1,η)²L(1,π,ad))·α(f₁,f₂). This is an identity of bilinear forms, including zero global/local pairings. With quotient-volume2L(1,η) periods, the constant becomes ζ_F(2)L(1/2)/(2L(1,π,ad)).

**Hypotheses.**

- π is cuspidal; relevant local L-factors and adjoint value are nonzero/finite
- The toric and Petersson measures are the distinct normalizations above

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization`, `GrossZagierAndArithmeticHeights:GZ.4/unramified-toric-value`, `GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Construction or proof.**

1. Use the quadratic-field binary Siegel–Weil identity and toric see-saw, together with the normalized Shimizu factorization. Its nonsplit proof uses the ternary identity; its split proof is the separate input recorded in coherent-quaternionic-specialization, not an automatic consequence of GQT’s quotient formula.
2. Unfold the global pairing to local Whittaker/toric integrals.
3. Evaluate the unramified factors and compare the adjoint Petersson normalization.
4. Translate quotient periods to probability periods and extend by bilinearity without division.

**Acceptance.**

- Zero toric Hom at any place forces the global form to vanish.
- Scaling torus Haar measures respects the squared period factor.

**Lean correspondence.** The actual coherent quaternionic automorphic representation and contragredient, probability toric periods, quaternionic Tamagawa form, restricted tensor product and normalized MP.6 Shimizu/see-saw interface.

`waldspurger` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Thm. 1.4, printed p. 11. Historical 2013-edition locator; current support is the separately cited public version.
- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), §2 equation(2.1), pp.12–13.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math.84(1986), ChapterIV §5, p.292, discussion of the squares furnished by Waldspurger’s theorem.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §1.4.2 Theorem1.4.2 pp.20–23; §2.4 pp.53–55.
- [Sur les valeurs de certaines fonctions L automorphes en leur centre de symétrie](https://www.numdam.org/item/CM_1985__54_2_173_0.pdf), II.1, pp.182–184; II.2, Proposition3 and corollary, pp.184–187.

### Toric period nonvanishing criterion

`GrossZagierAndArithmeticHeights:GZ.5/toric-period-nonvanishing` · theorem · `toricPeriod_nonzero_iff`

A cuspidal quaternionic π has a nonzero χ toric period precisely when every local Hom P(πv,χv) is nonzero and L(1/2,π_K⊗χ)≠0. In the matching case, choose local vectors with αv≠0 at the finitely many ramified places and spherical vectors elsewhere; their global period product is nonzero by Waldspurger. If either condition fails every period vanishes. This criterion does not assert the existence of a nonvanishing quadratic twist without a separate analytic nonvanishing input.

**Hypotheses.**

- The invariant dual pairings and L-function hypotheses of waldspurger

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`, `GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors`.

**Construction or proof.**

1. Use local distinction for necessity of the Hom conditions.
2. Use the bilinear identity for the central-value condition and construct a pure tensor with nonzero local form for sufficiency.

**Acceptance.**

- A local sign mismatch yields zero even when the central L-value is nonzero.

**Lean correspondence.** The actual coherent quaternionic automorphic representation and contragredient, probability toric periods, quaternionic Tamagawa form, restricted tensor product and normalized MP.6 Shimizu/see-saw interface.

`toricPeriod_nonzero_iff` — omitted; actual source carrier not written.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), §3.1 and Theorem1.8.

### Finite test-vector variation

`GrossZagierAndArithmeticHeights:GZ.5/finite-vector-variation` · theorem · `waldspurger_vector_variation`

For pure tensors fᵢ and fᵢ′ agreeing outside a finite set S, the cross-multiplied Waldspurger identities compare the two period products by the corresponding αv products at S. Where all pairings and toric factors are nonzero, the ratio form is ∏_{v∈S}βv(f₁,v′,f₂,v′)/βv(f₁,v,f₂,v), together with the changed Petersson pairing. This specializes to split, ramified and definite quaternionic admissible-order lines without dropping conductor, unit-index, removed-Euler or archimedean factors.

**Hypotheses.**

- Ratio notation used only when each stated denominator is nonzero
- Explicit CST local factors apply only in their stated conductor cases

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`, `GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors`, `GrossZagierAndArithmeticHeights:GZ.0/identity-rescaling`.

**Construction or proof.**

1. Apply the bilinear formula twice and cancel equal unramified factors.
2. Translate the trace/class-group sum period to the quotient integral using its class number and volume.
3. For explicit cases insert CST §3’s local toric values.

**Acceptance.**

- The formula remains cross-multiplied if a test-vector pairing is zero.

**Lean correspondence.** The actual coherent quaternionic automorphic representation and contragredient, probability toric periods, quaternionic Tamagawa form, restricted tensor product and normalized MP.6 Shimizu/see-saw interface.

`TauCeti.GrossZagier.AlgebraicFragments.waldspurger_vector_variation` — algebraic-fragment.

**Sources.**

- [Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2), Theorem1.9, pp.11–12.

### Weight-two central-value formula

`GrossZagierAndArithmeticHeights:GZ.5/classical-weight-two-central-value` · theorem · `gz86_weight_two_central_value`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Suppose ε(N) = −1 and k = 1. For m ≥ 0 define b_{m,A} = r_A(m|D|)·h/u + Σ_{0<n≤m|D|/N} δ(n) R_{A𝔫}(n) r_A(m|D| − nN), with δ(n), R_{A𝔫}(n) as in (4.6). Then Σ_{m≥0} b_{m,A}q^m is a modular form of weight 2 and level N, and L_A(f,1) = (8π²/√|D|)·(f, Σ_m b_{m,A}q^m) for every f in the space spanned by newforms of weight 2 and level N. (At k = 1 the printed constant (2π)^{2k}2^{2k−1}(k−1)!/((2k−2)!|D|^{k−1/2}) equals 8π²/√|D|, so E43 does not affect this case, and no holomorphic projection is needed because Φ̃ of (4.4) is holomorphic.) The case k ≥ 2 is the referenced classical source result 335.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-central-value-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel-pairing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`.

**Construction or proof.**

1. Use the weight-two holomorphic central kernel, which needs no regularized projection.
2. Pair with the newform and simplify the constant to 8π²/√|D|; retain ε(N)=−1.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual normalized newform, theta or definite quaternionic vector, Petersson norm and period/L-function carriers, with the target’s eigencomponent and scalar comparison.

`gz86_weight_two_central_value` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §5, (5.6) Theorem, p. 291.

### Central-value endpoint normalization

`GrossZagierAndArithmeticHeights:GZ.5/classical-central-value-endpoints` · theorem · `gz86_central_value_endpoints`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). In Theorem (5.6) one may drop the term r_A(m|D|)h/u and extend the sum to 0 ≤ n ≤ m|D|/N, because δ(0) = 2^t (t = number of prime factors of D) and R_{A𝔫}(0) = h/(2^t u) (each genus contains h/2^{t−1} classes and r_B(0) = 1/(2u) for each class B), while P_{k−1}(1) = 1.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.5/classical-weight-two-central-value`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`.

**Construction or proof.**

1. Keep the l=0 and n=0 endpoints of the finite central kernel sum.
2. Use r_A(0)=1/w and the class number formula to check the constant coefficient.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual normalized newform, theta or definite quaternionic vector, Petersson norm and period/L-function carriers, with the target’s eigencomponent and scalar comparison.

`TauCeti.GrossZagier.AlgebraicFragments.gz86_central_value_endpoints` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §5, p. 291 (paragraph after Theorem (5.6)).

### Central-value genus-sum filter

`GrossZagierAndArithmeticHeights:GZ.5/classical-genus-sum-filter` · theorem · `gz86_genus_sum_filter`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). For n, l ∈ ℕ: Σ_A R_{A𝔫}(n) r_A(l) = Σ_{genera G} R_{G𝔫}(n) R_G(l), which equals R(n)R(l) if the genus of an ideal of norm nl (if any) is {𝔫}, and 0 otherwise; here R(n) = Σ_{d|n} ε(d). If ε(N) = −1 (so N(𝔫) ≡ −N mod D) and l = m|D| − nN > 0, the genus conditions at the primes p | D with p ∤ n are automatic (l ≡ N(𝔫)n mod p), and δ(n) Σ_A R_{A𝔫}(n) r_A(m|D| − nN) = R(n) R(m|D| − nN) ∏_{p|(n,D)} (1 + ε̂_p((nN − m|D|)/(nN))), where ε̂_p : ℚ^× → {±1} is the homomorphism with ε̂_p(q) = (q/p) for primes q ≠ p, ε̂_p(−1) = (−1/p), and ε̂_p(p) = ((|D|/p)/p). [The printed prime-divisor condition uses p|N where p|D is required; issue PAPER-GROSS-ZAGIER-86/E44.]

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.5/classical-weight-two-central-value`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`, `AnalyticNumberTheory:AN.4`.

**Construction or proof.**

1. Sum the ideal-class central value over its genus characters.
2. Apply orthogonality to isolate the stated class/genus contribution and its 2^t factor.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual normalized newform, theta or definite quaternionic vector, Petersson norm and period/L-function carriers, with the target’s eigencomponent and scalar comparison.

`gz86_genus_sum_filter` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §5, p. 292 (first half).

### Definite period specialization

`GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement` · theorem · `gz86_definite_period_announcement`

In the definite ε(N)=−1, weight-two specialization, identify the CM class vector in the rational quaternionic eigenspace with the probability-normalized toric period. Under the local/global pairing and measure conventions of the normalized Waldspurger period formula, its χ,eigencomponent norm computes L(f,χ,1) with that formula’s exact product of local factors. This is a specialization of the coherent formula, not a theorem with an unspecified proportionality constant.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`, `GrossZagierAndArithmeticHeights:GZ.5/classical-weight-two-central-value`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Construction or proof.**

1. Interpret the definite CM class vector as a toric period in the coherent quaternionic realization.
2. Apply the normalized Waldspurger formula already planned here; the historical announcement alone does not supply its unspecified scalar.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual normalized newform, theta or definite quaternionic vector, Petersson norm and period/L-function carriers, with the target’s eigencomponent and scalar comparison.

`gz86_definite_period_announcement` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter V, §3, p. 314.

### Definite central-value square class

`GrossZagierAndArithmeticHeights:GZ.5/classical-definite-square-class` · theorem · `gz86_definite_square_class`

Fix a nonzero rational generator e of the one-dimensional M_f quaternionic eigenspace and its bilinear form. If the trivial-character CM projection is x_(1,f)=a_K e with a_K∈M_f, its norm is a_K²(e,e). The coherent normalized central-value identity then gives L(f,1_K,1)/C_K=a_K²(e,e), with C_K its specified discriminant, measure, Petersson and local factors; the square class after this normalization is independent of K. Zero projections are allowed.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement`, `GrossZagierAndArithmeticHeights:GZ.3/strict-gl2-realization`.

**Construction or proof.**

1. Use the one-dimensional rational coefficient-field eigenspace and its fixed bilinear pairing.
2. Writing x_(1,f)=a·e makes its norm a² times the fixed norm of e; the completed-period normalization must remain fixed when K varies.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual normalized newform, theta or definite quaternionic vector, Petersson norm and period/L-function carriers, with the target’s eigencomponent and scalar comparison.

`TauCeti.GrossZagier.AlgebraicFragments.gz86_definite_square_class` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter V, §3, p. 314.

### Half-weight Waldspurger value

`GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value` · theorem · `halfWeight_waldspurger`

Let φ(z)=2√y Σ_(n≠0) a(n)K_(ir)(2π|n|y)e(nx) be a nonzero even level-one Hecke–Maass eigenform, a(1)=1. Choose the associated weight-1/2 Kohnen-plus eigenline at parameter r/2 and its vector F(z)=Σ b(n)W_(sgn(n)/4,ir/2)(4π|n|y)e(nx), normalized by (F,F)=1 under the DIT Petersson convention. For a nonzero fundamental discriminant d, 12π|d||b(d)|²=(φ,φ)⁻¹Γ(1/2+ir/2−sgn(d)/4)Γ(1/2−ir/2−sgn(d)/4)L(1/2,φ⊗χ_d). The phase of F is free and both sides are phase-invariant. The twisted L-function is the finite Dirichlet-series L-function; the two displayed gamma factors are not already included in it.

**Hypotheses.**

- r is real; φ is even and normalized by a(1)=1, rather than unit Petersson norm
- The half-weight form has the specified Whittaker and Petersson normalization, including the plus condition at 2

**Inputs.** `MetaplecticAutomorphicForms:MP.7`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicFormsOnReductiveGroups:AF.3/maass-cusp-forms`.

**Construction or proof.**

1. Import the Hecke-equivariant Kohnen-plus/GL₂ eigenline correspondence, including the operator at 2 and the eigenvalue parameter r/2.
2. Apply the local/global Baruch–Mao central-value identity.
3. Compare its Whittaker coefficient and Petersson conventions with DIT Theorem4 and (5.17), retaining 12π and both signed gamma factors.
4. Pass to the unit half-weight vector; its arbitrary phase disappears in |b(d)|².

**Acceptance.**

- d>0 uses gamma real part 1/4; d<0 uses 3/4.
- Multiplying F by e^(iθ) leaves the identity unchanged.
- Rescaling φ without a(1)=1 would change its Dirichlet coefficients and is not allowed without an explicit adapter.

**Lean correspondence.** The actual coherent quaternionic automorphic representation and contragredient, probability toric periods, quaternionic Tamagawa form, restricted tensor product and normalized MP.6 Shimizu/see-saw interface.

`halfWeight_waldspurger` — omitted; actual source carrier not written.

**Sources.**

- [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), published Annals 184 (2016), §5 Theorem4 pp.965–966 and (5.17) p.966.

## GZ.6: Analytic and arithmetic generating kernels

Layer status: **planned**, implementation unchecked.

### Special correspondence cycle

`GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle` · construction · `specialCorrespondenceCycle`

For x∈B_f× and U_x=U∩xUx⁻¹, define Z(x)_U as the proper cycle push-forward of [X_{U_x}] under (p,p∘T_x):X_{U_x}→X_U×X_U. Multiplicities are generic residue degrees, including a noninjective level map; Z(x)_U is not its reduced image. Its action on Pic⁰ is the actual Hecke correspondence push-pull. Level composition obeys the double-coset convolution with multiplicities.

**Hypotheses.**

- Finite levels and proper maps; coarse/stack multiplicities specified by the imported cycle formalism

**Inputs.** `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R14.2`.

**Construction or proof.**

1. Construct the two finite level maps from the imported Hecke tower.
2. Apply proper push-forward to the fundamental cycle, with residue degrees.
3. Use base change and composition of proper push-forward to identify its Pic⁰ action.

**Uses.**

- `YZZ Chapter4`: Coefficients of the Picard-valued generating series.
- `GZ.7 intersection calculations`: Retain multiplicities in the height kernel.

**Planning API.**

- `specialCorrespondenceCycle` (constructor; algebraic-fragment): The proper push-forward cycle Z(x)_U.
- `specialCorrespondenceCycle_action` (compatibility; algebraic-fragment): Its Pic⁰ action is the Hecke push-pull map.
- `specialCorrespondenceCycle_level` (functoriality; algebraic-fragment): Level pullback/push-forward matches the corrected multiplicities.
- `specialCorrespondenceCycle_convolution` (relation; algebraic-fragment): Composition is double-coset convolution with its counting coefficients.

**Mathematical unit tests.**

- `specialCorrespondenceCycle_identity` (computation; fragment-example): At x=1 the cycle is the diagonal with its proper multiplicity.
- `specialCorrespondenceCycle_degree_two` (non-example; fragment-example): A generically degree-two parametrization produces twice the reduced image.
- `specialCorrespondenceCycle_zero_action` (degenerate; fragment-example): The induced correspondence sends the zero Pic⁰ class to zero.

**Acceptance.**

- A degree-d map onto its image contributes d times that image.

**Lean correspondence.** The actual Shimura-curve Picard/CM cycles and Hecke push-pull, mixed theta–Eisenstein family, arithmetic height pairing and cusp projection, with the exact trace/volume normalizations.

`TauCeti.GrossZagier.AlgebraicFragments.specialCorrespondenceCycle` — algebraic-fragment.

**Sources.**

- [Erratum to The Gross–Zagier Formula on Shimura Curves](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf), item30 and §2.
- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1 pp605–607.

### ξ-normalized CM divisor

`GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class` · definition · `cmDegreeZeroClass`

For an imported CM point [h] on X_U and its geometric component c(h), define [h]⁰=[h]−ξ_{U,c(h)} in Pic⁰(X_U)⊗ℚ, then in the Jacobian via the Abel–Jacobi identification. Subtraction is componentwise: a Hodge class on a different component does not give a degree-zero divisor. The finite-character sum uses the same trace/average and reciprocity convention as GZ.0.

**Hypotheses.**

- CM points and their reciprocity are supplied by HE.1; rational Hodge class fixed

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`, `HeegnerPointEulerSystems:HE.1`, `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`.

**Construction or proof.**

1. Subtract the degree-one class on the point’s component.
2. Pass to the imported Pic⁰/Jacobian and check Galois/Hecke equivariance.

**Uses.**

- `YZZ height series`: Define the two actual Jacobian inputs.
- `GZ.8 Heegner point`: Transport the same normalized divisor through the rational realization.

**Planning API.**

- `cmDegreeZeroClass` (constructor; algebraic-fragment): The class [h]−ξ on the CM component.
- `cmDegreeZeroClass_degree` (projection; algebraic-fragment): It has degree zero on every component.
- `cmDegreeZeroClass_galois` (functoriality; algebraic-fragment): Galois transport sends the point and its component Hodge class together.
- `cmDegreeZeroClass_character` (compatibility; algebraic-fragment): Character sums use the selected inverse-character projector.

**Mathematical unit tests.**

- `cmDegreeZeroClass_degree_zero` (computation; fragment-example): 1−1=0 on the point’s component and zero on all others.
- `cmDegreeZeroClass_wrong_component` (non-example; fragment-example): Subtracting ξ on a different component leaves degrees 1 and −1, so is not componentwise Pic⁰.
- `cmDegreeZeroClass_hodge_average` (degenerate; fragment-example): A divisor equal to the chosen ξ has normalized class zero.

**Acceptance.**

- An unnormalized degree-one CM divisor cannot be used directly in a Jacobian height.

**Lean correspondence.** The actual Shimura-curve Picard/CM cycles and Hecke push-pull, mixed theta–Eisenstein family, arithmetic height pairing and cusp projection, with the exact trace/volume normalizations.

`TauCeti.GrossZagier.AlgebraicFragments.cmDegreeZeroClass` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.5.5-1.5.6, printed pp. 15-16. Historical 2013-edition locator; current support is the separately cited public version.
- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1 pp605–607.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §1.5.5, printed p.24; §3.1.3, printed pp.70–71; §5.1.2, printed p.183.

### Picard-valued generating series

`GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series` · construction · `picardGeneratingSeries`

For U-biinvariant extended Schwartz Φ, let ϕ be its archimedean average. Define Z(g,Φ)_U=Z₀(ϕ)_U+w_U Σ_{a∈F×}Σ_{x∈U\B_f×/U} r(g)ϕ(x,a/q(x)) Z(x)_U in Pic(X_U×X_U)⊗ℂ, with the fixed Hodge/constant term and unit stabilizer w_U. The series converges coefficientwise in the stated Picard realization and defines a weight-two automorphic form. Its appropriately volume-rescaled level classes are compatible. The modularity assertion is a theorem about these actual cycle coefficients.

**Hypotheses.**

- Standard Gaussian archimedean data and allowed finite support; proper-cycle coefficients
- Compact case or separately corrected cuspidal finite-level case

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle`, `MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil`, `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`, `ModularCurvesPartII:R14.2/jacobian-and-functoriality`, `ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`.

**Construction or proof.**

1. Form the corrected cycle coefficients and Hodge term with ϕ, not unaveraged Φ.
2. Use the imported Weil action/product formula and the source’s curve-cycle theta calculation to prove modularity.
3. Check coefficientwise convergence and level push-pull with volumes.

**Uses.**

- `YZZ §4.2`: Build the actual arithmetic theta correspondence.
- `GZ.6 height kernel`: Evaluate this Picard-valued series on two normalized CM classes.

**Planning API.**

- `picardGeneratingSeries` (constructor; algebraic-fragment): The explicit Hodge-plus-Hecke series with Picard coefficients.
- `picardGeneratingSeries_coefficient` (projection; algebraic-fragment): The nonzero Fourier coefficients are the weighted proper special cycles.
- `picardGeneratingSeries_level` (functoriality; algebraic-fragment): The specified volume-rescaled classes are level compatible.
- `picardGeneratingSeries_modular` (structure; algebraic-fragment): The series transforms by the weight-two Weil automorphy law.

**Mathematical unit tests.**

- `picardGeneratingSeries_zero` (degenerate; fragment-example): Zero Schwartz input gives the zero series.
- `picardGeneratingSeries_diagonal` (characterisation; fragment-example): The identity double coset contributes the actual diagonal cycle.
- `picardGeneratingSeries_rational_factor` (non-example; fragment-example): For F=ℚ the corrected whole factor is 1/2; substituting 2 changes coefficients by four.

**Acceptance.**

- The modular X₀(N) example recovers the Hecke generating series with the corrected normalization.

**Lean correspondence.** The actual Shimura-curve Picard/CM cycles and Hecke push-pull, mixed theta–Eisenstein family, arithmetic height pairing and cusp projection, with the exact trace/volume normalizations.

`TauCeti.GrossZagier.AlgebraicFragments.picardGeneratingSeries` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.5.4, printed p. 15. Historical 2013-edition locator; current support is the separately cited public version.
- [Erratum to The Gross–Zagier Formula on Shimura Curves](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf), items8,30,31.
- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1 pp605–607.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §4.2.1–§4.2.2, (4.2.1)–(4.2.2), Lemma 4.2.1, pp. 121–122.

### Arithmetic height kernel

`GrossZagierAndArithmeticHeights:GZ.6/arithmetic-height-kernel` · construction · `arithmeticHeightKernel`

Evaluate the level-compatible Picard correspondence Z̃(g,Φ) on [h₁]⁰ and pair its resulting Jacobian class with [h₂]⁰ by the GZ.1 Poincaré height. Define Z̃(g,(h₁,h₂),Φ) this way. Its χ-geometric kernel is the starred torus integral of Z̃(g,(t,1),Φ)χ(t): first probability-average over the central ideles, then integrate on [T]=T(F)\T(A)/Z(A) with the GZ.0 quotient measure. This central averaging is defined on a compact quotient for functions invariant under Z(F∞). Dividing the starred integral by vol([T]) gives the regularized average; for T(F∞)-invariant finite-level CM data that average is the finite-orbit average. Keep the factor vol([T])=2L(1,η) when converting back to the starred kernel. Preserve the proper cycle action and χ/χ⁻¹ inputs.

**Hypotheses.**

- Both CM classes have componentwise degree zero
- The toric integrand is Z(F∞)-invariant; [T] has finite volume and its centrally averaged integrand is integrable
- Finite-orbit specialization additionally assumes T(F∞)-invariance and an open compact stabilizer

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`, `GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class`, `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing`, `GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions`, `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`.

**Construction or proof.**

1. Apply the proper correspondence to the actual Pic⁰ class and use the full Poincaré height with finite-extension normalization.
2. Probability-average the integrand on the compact central idele quotient from §1.6.7; integrate the result on [T] to define the starred kernel.
3. For finite-level, T(F∞)-invariant CM data, identify the normalized regularized average with the finite-orbit average. Multiply by vol([T]) for the starred integral; separate this operation from later removal of Eisenstein/Hodge projection terms.

**Uses.**

- `YZZ Theorem3.21`: The geometric side of the projected derivative identity.
- `Colmez §8`: Separate horizontal, vertical and extended diagonal contributions.

**Planning API.**

- `arithmeticHeightKernel` (constructor; algebraic-fragment): The χ correspondence-height integral, with compact central probability averaging followed by the quotient-measure torus integration.
- `arithmeticHeightKernel_bilinear` (relation; algebraic-fragment): The kernel is bilinear in the two normalized Pic⁰ inputs and linear in Φ.
- `arithmeticHeightKernel_level` (functoriality; algebraic-fragment): Compatible finer-level representatives give the same kernel.
- `arithmeticHeightKernel_local` (compatibility; algebraic-fragment): On disjoint divisors it is the normalized finite-plus-infinite intersection height.
- `arithmeticHeightKernel_average_conversion` (compatibility; omitted; Requires the actual central idele averaging and quotient-measure torus integral; the finite bilinear fragment has no such measure carrier.): The starred kernel is vol([T]) times its normalized regularized average; on a constant toric integrand c it is 2L(1,η)c, while its average is c.

**Mathematical unit tests.**

- `arithmeticHeightKernel_zero` (degenerate; fragment-example): A zero normalized CM class gives zero kernel.
- `arithmeticHeightKernel_average` (computation; fragment-example): Averaging both trace inputs divides the height kernel by h².
- `arithmeticHeightKernel_cycle_multiplicity` (non-example; fragment-example): Replacing a degree-two push-forward by its reduced image halves that cycle’s height contribution.
- `arithmeticHeightKernel_volume` (computation; omitted; Requires the actual starred torus-integral and normalized-average carriers, absent from the finite bilinear fragment.): For a constant integrand c=1 and vol([T])=3, the starred kernel is 3 and the normalized regularized average is 1. A constructor silently returning the average fails this test.

**Acceptance.**

- A finite class-group average differs from the trace height by the square of its cardinality.

**Lean correspondence.** The actual Shimura-curve Picard/CM cycles and Hecke push-pull, mixed theta–Eisenstein family, arithmetic height pairing and cusp projection, with the exact trace/volume normalizations. Its toric integration must implement the compact central average of §1.6.7 and distinguish the starred integral from the normalized regularized average; no analytic truncation is part of that definition.

`TauCeti.GrossZagier.AlgebraicFragments.arithmeticHeightKernel` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.5.5-1.5.6, printed pp. 15-16. Historical 2013-edition locator; current support is the separately cited public version.
- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1 pp605–607.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §1.5.5, printed p.24; §5.1.2, printed pp.183–184; §1.6.7, (1.6.1)–(1.6.2), printed pp.34–35.

### Incoherent central derivative

`GrossZagierAndArithmeticHeights:GZ.6/incoherent-central-derivative` · theorem · `incoherentKernel_derivative`

For the source’s incoherent quaternionic extended Weil data, form the actual mixed theta–Eisenstein kernel I(s,g,χ,Φ), initially in its convergence half-plane, then meromorphically continue it. Its sign at the centre forces I(0,g,χ,Φ)=0, and I′(0,g,χ,Φ) is its analytic derivative. After the stated growth estimates, differentiation commutes with the local/global expansions on compact g-sets. The zero-frequency Whittaker term has its separate normalized formula; it is not a limit of the nonzero-frequency formula.

**Hypotheses.**

- Incoherent Hasse signs and χ central condition; fixed holomorphic section in s
- Convergence, pole subtraction and projection hypotheses checked before exchanging sums or integrals

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein`, `MetaplecticAutomorphicForms:MP.6/coherent-incoherent-sections`, `AutomorphicSpectralTheory:AS.3`.

**Construction or proof.**

1. Use the imported incoherent section and functional equation to obtain central vanishing.
2. Establish locally uniform derivative bounds after subtracting singular terms.
3. Differentiate the factorized Fourier expansion and keep the constant term separate.

**Acceptance.**

- At a Fourier index with exactly one bad nonsplit place the derivative occurs at that place.

**Lean correspondence.** The actual Shimura-curve Picard/CM cycles and Hecke push-pull, mixed theta–Eisenstein family, arithmetic height pairing and cusp projection, with the exact trace/volume normalizations.

`TauCeti.GrossZagier.AlgebraicFragments.incoherentKernel_derivative` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.5.6, printed p. 16. Historical 2013-edition locator; current support is the separately cited public version.
- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §7.1 and §7.3.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §1.5.6, printed pp.24–25; §3.6.1, printed pp.109–110; §5.1.1, printed pp.182–183; Chapter6, printed pp.194–216.

### Arithmetic theta lifting comparison

`GrossZagierAndArithmeticHeights:GZ.6/arithmetic-theta-lifting` · theorem · `arithmeticThetaLift_comparison`

For Φ in the extended Schwartz space and φ in the specified weight-two constituent σ, the correspondence-valued arithmetic theta lift, defined by Petersson projection of Z̃(g,Φ), equals L(1,π,ad)/(2ζ_F(2)) times the homomorphism associated with the coherent theta lift θ(Φ⊗φ). This is an equality of actual Jacobian homomorphisms, using Pic(X_U×X_U)→Hom(J_U,J_U∨) before rational scalar extension.

**Hypotheses.**

- Rational realizations and dualities fixed; finite level for the trace computation
- Compact case and modular cusp boundary terms are treated separately

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`, `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization`, `GrossZagierAndArithmeticHeights:GZ.3/composition-pairing`, `AutomorphicSpectralTheory:AS.4`.

**Construction or proof.**

1. Use multiplicity one to compare the two lifts up to scalar.
2. Compute traces on H⁰,¹ by Lefschetz intersection of the corrected correspondence with the diagonal.
3. Evaluate the Hodge/cusp/CM contributions to obtain the stated adjoint/zeta constant.

**Acceptance.**

- The scalar is L(1,ad)/(2ζ_F(2)), not an unspecified proportionality.

**Lean correspondence.** The actual Shimura-curve Picard/CM cycles and Hecke push-pull, mixed theta–Eisenstein family, arithmetic height pairing and cusp projection, with the exact trace/volume normalizations.

`arithmeticThetaLift_comparison` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.5.6-1.5.7, printed pp. 16-17. Historical 2013-edition locator; current support is the separately cited public version.
- [Erratum to The Gross–Zagier Formula on Shimura Curves](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf), items18,19,30.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, Theorem 3.6.2, pp. 110–111; §4.4.1, Propositions 4.4.1–4.4.3, pp. 134–137.

### Projected arithmetic kernel identity

`GrossZagierAndArithmeticHeights:GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity` · theorem · `arithmeticKernel_projected_identity`

For the fixed quaternionic constituent σ and admissible factorizable Φ, (I′(0,·,χ,Φ),φ)_Pet=2(Z̃(·,χ,Φ),φ)_Pet for every φ∈σ. Equivalently the σ-cuspidal projections agree with factor2. The equality is not pointwise in g: constant, Eisenstein, old and nearby-coherent terms are removed by their separately proved projection/orthogonality statements. Extend from the degenerate test data to all permitted data by local toric multiplicity one and the existence of a nonzero distinguished test pair.

**Hypotheses.**

- All derivative, geometric regularization and projection hypotheses of the preceding constructors
- Degenerate-case comparison and nonzero local test-pair reduction are proved

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/incoherent-central-derivative`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-height-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-theta-lifting`, `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation`, `GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors`, `AutomorphicSpectralTheory:AS.4`.

**Construction or proof.**

1. Decompose both kernels place by place under the degenerate hypotheses.
2. Apply the local identities and nearby-coherent approximation theorem of GZ.7.
3. Project away the explicitly identified nonzero error; extend by the one-dimensional toric tensor functional.

**Acceptance.**

- The right-hand coherent error may be nonzero before projection.
- A vanishing global invariant pairing causes no division by zero.

**Lean correspondence.** The actual Shimura-curve Picard/CM cycles and Hecke push-pull, mixed theta–Eisenstein family, arithmetic height pairing and cusp projection, with the exact trace/volume normalizations.

`arithmeticKernel_projected_identity` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.5.6, printed p. 16. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §3.6.1, Theorem3.6.1, printed pp.109–110; §5.1.3, Theorem5.1.1 and Remark11, printed p.184; §5.2.2, Theorem5.2.6 and Proposition5.2.7, printed p.187.

### Pseudo-theta datum

`GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-theta` · construction · `pseudoTheta`

Let V be a positive definite quadratic space over F and V0 ⊂ V1 ⊂ V subspaces over F with the induced forms, all even-dimensional; V0 may also be ∅. Let S be a finite set of nonarchimedean places, φ^S ∈ S̄(V(A^S)×A^{S,×}) with standard archimedean components, and for v ∈ S let φ′_v : GL2(F_v)×(V1−V0)(F_v)×F_v^× → ℂ be locally constant, invariant under right translation of g by some open compact K_v ⊂ GL2(F_v), and, for each g, of bounded support in (x,u); let µ ⊂ O_F^× have finite index with φ^S and φ′_S = ∏_{v∈S}φ′_v invariant under (x,u) ↦ (αx, α^{−2}u), α ∈ µ. The pseudo-theta series is A^{(S)}_{φ′}(g) = Σ_{u∈µ²\F^×} Σ_{x∈V1−V0} φ′_S(g,x,u) r_V(g)φ^S(x,u), with the Weil representation of V (not V1). It is nondegenerate if V1 = V, nontruncated if V0 = ∅, and nonsingular if each φ′_v(1,·,·) extends to a Schwartz function on V1(F_v)×F_v^×; then its outer theta series is θ_{A,1}(g) = Σ_u Σ_{x∈V1} r_{V1}(g)φ′_S(1,x,u) r_{V1}(g)φ^S(x,u) and its inner theta series θ_{A,0} is the same with V0 in place of V1 (θ_{A,0} = 0 if V0 = ∅).

**Hypotheses.**

- **H5**
- **H6**

**Inputs.** `MetaplecticAutomorphicForms:MP.5`.

**Construction or proof.**

1. Use the imported Weil representation on V and the stated unit invariance to form the quotient sum.
2. Bounded bad-place support and positive definite Gaussian decay give local finiteness/convergence; restrict the nonsingular data to construct the two usual theta series.

**Uses.**

- `Yuan–Zhang 2018 §6.2, pp. 579–580`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `pseudoTheta_constructor` (constructor; algebraic-fragment): The locally finite unit-quotient sum in the stated ambient Weil representation.
- `pseudoTheta_outer` (relation; algebraic-fragment): The nonsingular outer theta uses the V₁ Weil representation.
- `pseudoTheta_inner` (relation; algebraic-fragment): The inner theta uses V₀; it is zero for the empty truncation.
- `pseudoTheta_unit_invariant` (relation; algebraic-fragment): The summand is invariant under (x,u)↦(αx,α⁻²u).

**Mathematical unit tests.**

- `pseudoTheta_empty_truncation` (degenerate; fragment-example): For V₀=∅ the inner theta is zero; for V₀={0} it is the zero-vector theta term.
- `pseudoTheta_full_space` (compatibility; fragment-example): For V₁=V and genuine Weil translates at bad places, the nontruncated series is the usual theta series.
- `pseudoTheta_wrong_ambient_weight` (non-example; fragment-example): Using rV₁ in place of rV loses the positive-codimension (ρ∞δ) power in the comparison.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`TauCeti.GrossZagier.AlgebraicFragments.pseudoTheta` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §6.2, pp. 579–580.

### Pseudo-theta comparison on a small bad-place compact

`GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-comparison` · theorem · `colmez_pseudo_comparison`

Let A = A^{(S)}_{φ′} be a nonsingular pseudo-theta series on V0 ⊂ V1 ⊂ V (d = dim V, d_i = dim V_i; θ_{A,0} := 0 if V0 = ∅), with φ^S standard at the archimedean places. Let S′ ⊇ S be a finite set of nonarchimedean places outside of which φ_v is standard, compatible with the orthogonal splittings V = V1 ⊕ V1^⊥ = V0 ⊕ V0^⊥, and the discriminant characters χ_{V1^⊥}, χ_{V0^⊥} are unramified. Then there is an open compact K_{S′} ⊂ GL2(F_{S′}) such that for all g ∈ K_{S′}GL2(A^{S′}): A(g) = χ_{V1^⊥}(a(g)) ρ∞(g)^{(d−d1)/2} δ(g)^{(d−d1)/2} θ_{A,1}(g) − χ_{V0^⊥}(a(g)) ρ∞(g)^{(d−d0)/2} δ(g)^{(d−d0)/2} θ_{A,0}(g). Here δ(g) = ∏_{all v} δ_v(g_v) with δ_v([[a,b],[0,d]]k) = |a/d|_v^{1/2}; ρ∞(g) = ∏_{v|∞} e^{iθ_v} for g_v = [[a,b],[0,d]]k_{θ_v}, a > 0; and χ_W(a(g)) := ∏_{w∉S′ finite} χ_{W,w}(a_w), where a_w is the upper-left Iwasawa entry of g_w and χ_W is the quadratic character of the discriminant of W. The characters are trivial when the complement has square discriminant, e.g. for quaternionic complements. As printed (without the characters), the identity holds only where every χ_{W,w}(a_w) = 1.

**Hypotheses.**

- **H5**
- **H6**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-theta`, `MetaplecticAutomorphicForms:MP.5`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`.

**Construction or proof.**

1. Factor the archimedean Gaussian/weight terms and retain the full adelic δ. At finite places outside S′, splitting V = V_i ⊕ V_i^⊥ contributes χ_{V_i^⊥}(a(g)) as well as δ^{(d−d_i)/2}. Choose a common stabilizer K_{S′} at the exceptional places. Compare the V1 theta series and the truncated V0 term on K_{S′}GL2(A^{S′}); omit a discriminant character only where it is actually trivial.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_pseudo_comparison` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §6.2, equation (6.2.1), p. 581.

### Automorphic sum reduces to nondegenerate outer theta

`GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-automorphic` · theorem · `colmez_pseudo_automorphic`

Let {A_ℓ^{(S_ℓ)}}_ℓ be a finite set of nonsingular pseudo-theta series, A_ℓ sitting on V_{ℓ,0} ⊂ V_{ℓ,1} ⊂ V_ℓ. The positive definite even-dimensional F-quadratic spaces V_ℓ, the sets S_ℓ and the unit groups µ_ℓ may depend on ℓ. If Σ_ℓ A_ℓ(g) is automorphic on GL2(A), then Σ_ℓ A_ℓ = Σ_{ℓ∈L_{0,1}} θ_{A_ℓ,1}, where L_{0,1} = {ℓ : V_{ℓ,1} = V_ℓ}. Proof: Vandermonde in the values (1+iN)^{−[F:Q]} for distinct POSITIVE sufficiently divisible N (packet E60 and E72).

**Hypotheses.**

- **H5**
- **H6**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-comparison`, `mathlib:Matrix.det_vandermonde`, `tauceti:TauCeti.GlobalNumberFields.weakApproximation_denseRange`.

**Construction or proof.**

1. Separate codimension powers using weak approximation and a Vandermonde system; choose distinct positive integral lower-unipotent parameters, not arbitrary distinct integers.
2. Apply pinned mixed-place weak approximation independently to the four matrix entries at the finite exceptional set S. The nonzero determinant locus is open, so the approximating rational matrix can be chosen invertible. Outside S an arbitrary element of GL₂(A^S) adjusts the remaining components. Thus GL₂(F)GL₂(A^S) is dense in GL₂(A); continuity and the common left GL₂(F)-automorphic law extend equality from 1^SGL₂(A^S). This uses weak approximation, with no restriction on determinants from strong approximation.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_pseudo_automorphic` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma6.1(1) pp582–583.

### Positive-codimension theta cancellation

`GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-weight-cancel` · theorem · `colmez_pseudo_weight_cancel`

Under the hypotheses of Lemma 6.1, suppose that for each k > 0 the orthogonal complements V_ℓ ⊖ V_{ℓ,1} (ℓ ∈ L_{k,1}) and V_ℓ ⊖ V_{ℓ,0} (ℓ ∈ L_{k,0}) all have the same quadratic discriminant character. Then Σ_{ℓ∈L_{k,1}} θ_{A_ℓ,1} − Σ_{ℓ∈L_{k,0}} θ_{A_ℓ,0} = 0, where L_{k,1} = {ℓ : dim V_ℓ − dim V_{ℓ,1} = k} and L_{k,0} = {ℓ : dim V_ℓ − dim V_{ℓ,0} = k}. Without the hypothesis the proof gives only the character-twisted identity on GL2(A_f^S).

**Hypotheses.**

- **H5**
- **H6**
- Within each positive codimension all complements have the same discriminant character.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-automorphic`.

**Construction or proof.**

1. Apply pseudo-comparison including its discriminant characters. Choose distinct positive sufficiently divisible N so |(1+iN)^{−[F:Q]}| are distinct; the Vandermonde argument isolates the character-twisted coefficient in each codimension. The common quadratic character hypothesis in that codimension permits cancellation of that nonzero factor to give the stated untwisted theta identity. Without it keep only the twisted identity. The §9 application has common character η in codimension two and trivial character in codimension four.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_pseudo_weight_cancel` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma6.1(2) pp582–583.

### Mixed theta–Eisenstein kernel

`GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein` · construction · `mixedThetaEisenstein`

Let B be a totally definite incoherent quaternion algebra over A = A_F with E_A → B, and φ ∈ S̄(B×A^×) invariant under U×U. Then I(s,g,φ)_U = Σ_{u∈µ_U²\F^×} Σ_{γ∈P^1(F)\SL2(F)} δ(γg)^s Σ_{x1∈E} r(γg)φ(x1,u). For φ = φ1⊗φ2 with respect to B = E_A ⊕ E_A j, I(s,g,φ)_U = Σ_u θ(g,u,φ1)E(s,g,u,φ2), where θ(g,u,φ1) = Σ_{x1∈E} r(g)φ1(x1,u) and E(s,g,u,φ2) = Σ_γ δ(γg)^s r(γg)φ2(0,u). By incoherence I(0,g,φ) = 0.

**Hypotheses.**

- **H5**
- **H6**

**Inputs.** `MetaplecticAutomorphicForms:MP.5`, `AutomorphicSpectralTheory:AS.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`.

**Construction or proof.**

1. Use the E⊕E𝔧 orthogonal decomposition and the imported theta/Eisenstein families.
2. Continue the absolutely convergent initial series meromorphically; apply incoherence for its central zero.

**Uses.**

- `Yuan–Zhang 2018 §7.1, pp. 583–584 (from [YZZ13, §5.1.1]); vanishing I(0,g,φ) = 0 stated in §1.3, p. 540`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `mixedThetaEisenstein_constructor` (constructor; algebraic-fragment): The unit-quotient sum over P¹(F)∖SL₂(F) and x₁∈E.
- `mixedThetaEisenstein_tensor_factorization` (relation; algebraic-fragment): For φ=φ₁⊗φ₂ the kernel is Σu θ(g,u,φ₁)E(s,g,u,φ₂).
- `mixedThetaEisenstein_linear` (relation; algebraic-fragment): The kernel and its meromorphic continuation are linear in φ.
- `mixedThetaEisenstein_central_zero` (relation; algebraic-fragment): I(0,g,φ)=0 for incoherent data.

**Mathematical unit tests.**

- `mixedThetaEisenstein_zero_schwartz` (degenerate; fragment-example): For φ=0 the meromorphic family is zero.
- `mixedThetaEisenstein_tensor_components` (characterisation; fragment-example): For a pure tensor the theta factor uses E and the Eisenstein factor its orthogonal line.
- `mixedThetaEisenstein_incoherent_central_value` (compatibility; fragment-example): The central family value is zero, while its derivative need not be zero.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual Shimura-curve Picard/CM cycles and Hecke push-pull, mixed theta–Eisenstein family, arithmetic height pairing and cusp projection, with the exact trace/volume normalizations.

`TauCeti.GrossZagier.AlgebraicFragments.mixedThetaEisenstein` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, pp. 583–584 (from [YZZ13, §5.1.1]); vanishing I(0,g,φ) = 0 stated in §1.3, p. 540.

### Normalized local Whittaker terms

`GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker` · construction · `normalizedWhittaker`

For a place v, a ∈ F_v, u ∈ F_v^× and φ_{2,v} ∈ S̄(E_v𝔧_v×F_v^×), put W_{a,v}(s,g,u,φ_{2,v}) = ∫_{F_v} δ(wn(b)g)^s r(wn(b)g)φ_{2,v}(0,u) ψ_v(−ab) db. For a ∈ F_v^×, W°_{a,v} = γ_{u,v}^{−1}W_{a,v}, where γ_{u,v} is the Weil index of (E_v𝔧_v, uq). For a = 0, W°_{0,v}(s,g,u,φ_{2,v}) = γ_{u,v}^{−1}·(L(s+1,η_v)/L(s,η_v))·|D_v|^{−1/2}|d_v|^{−1/2}·W_{0,v}(s,g,u,φ_{2,v}), with D_v the relative discriminant of E_v/F_v and d_v the local different of F_v. Then W°_{0,v}(0,g,u) = r(g)φ_{2,v}(0,u) for all v, and W°_{0,v}(s,g,u) = δ_v(g)^{−s}r(g)φ_{2,v}(0,u) for almost all v; at an archimedean v this s-dependent formula uses the standard Gaussian component. Globally W_0(s,g,u) = −(L(s,η)/L(0,η))/(L(s+1,η)/L(1,η))·∏_v W°_{0,v}(s,g,u), since ∏_vγ_{u,v} = −1 for incoherent B.

**Hypotheses.**

- **H5**
- **H6**
- The archimedean s-dependent zero-index identity is asserted for the standard Gaussian, as in Yuan–Zhang §7.3 Lemma7.6; it is not an assertion for arbitrary archimedean Schwartz functions.

**Inputs.** `AutomorphicSpectralTheory:AS.2`, `AutomorphicLFunctionsAndLocalFactors:AL.1`.

**Construction or proof.**

1. Take the Fourier integral with the source’s self-dual measure.
2. Apply the local intertwiner and Weil-index normalization separately to nonzero and zero Fourier indices; use its value at s=0 and the incoherent product sign.

**Uses.**

- `Yuan–Zhang 2018 §7.1 pp584–586; §7.3 pp599–600`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `normalizedWhittaker_constructor` (constructor; algebraic-fragment): Normalize the Fourier integral separately at a≠0 and a=0.
- `normalizedWhittaker_zero_value` (simp; omitted; actual source carrier not written): W°₀,v(0,g,u)=r(g)φ₂,v(0,u).
- `normalizedWhittaker_nonzero_index` (compatibility; algebraic-fragment): For a≠0 only the inverse Weil index changes the raw integral.
- `normalizedWhittaker_zero_index` (compatibility; algebraic-fragment): At a=0 include L(s+1,ηv)/L(s,ηv), |Dv|⁻¹/² and |dv|⁻¹/².

**Mathematical unit tests.**

- `normalizedWhittaker_standard_zero` (computation; omitted; The standard local Schwartz/Gaussian Whittaker coefficient and its normalization are not instantiated; the previous example is absent.): At standard almost-all-place data W°₀,v(s,g,u)=δv(g)⁻s r(g)φ₂,v(0,u).
- `normalizedWhittaker_zero_branch` (non-example; fragment-example): Omitting the zero-index L-factor fails W°₀,v(0,g,u)=r(g)φ₂,v(0,u).
- `normalizedWhittaker_incoherent_product_sign` (characterisation; fragment-example): The product of local Weil indices is −1, hence the global zero coefficient carries the minus sign.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`TauCeti.GrossZagier.AlgebraicFragments.normalizedWhittaker` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1 pp584–586; §7.3 pp599–600.

### Finite CM orbit average

`GrossZagierAndArithmeticHeights:GZ.6/colmez-torus-average` · construction · `cmOrbitAverage`

CU=E*\Ef*/(Ef*∩U); integrate a function on CU using |CU|^−1Σ, not its unnormalized trace. The factor e=[OE*:OF*] is separate.

**Hypotheses.**

- **H5**
- **H6**

**Inputs.** `HilbertModularVarietiesAndShimuraCurves:R18.5`, `GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average`.

**Construction or proof.**

1. Use the finite CM class quotient and its counting probability measure.
2. Check quotient invariance and compare its cardinality with the unnormalized sum, keeping the independent elliptic unit index.

**Uses.**

- `Yuan–Zhang 2018 §7.1 p585;§8.1 pp606–609`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `cmOrbitAverage_constructor` (constructor; algebraic-fragment): Average a function over the finite quotient C_U.
- `cmOrbitAverage_constant` (simp; algebraic-fragment): The average of a constant c is c.
- `cmOrbitAverage_representative_independent` (extensionality; algebraic-fragment): A quotient-invariant function has representative-independent average.
- `cmOrbitAverage_trace` (compatibility; algebraic-fragment): Unnormalized orbit sum equals |C_U| times the average.

**Mathematical unit tests.**

- `cmOrbitAverage_constant_one` (computation; fragment-example): The average of 1 is 1 even when |C_U|>1.
- `cmOrbitAverage_singleton` (degenerate; fragment-example): On a singleton quotient averaging is evaluation.
- `cmOrbitAverage_unit_index_separate` (non-example; fragment-example): The elliptic index e=[O_E×:O_F×] is not the orbit cardinality and cannot replace |C_U|.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`TauCeti.GrossZagier.AlgebraicFragments.cmOrbitAverage` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1 p585;§8.1 pp606–609.

### Local derivative and zero-term corrections

`GrossZagierAndArithmeticHeights:GZ.6/colmez-local-k-c` · construction · `localDerivativeCorrection`

At nonsplit v define kφv from L(1,ηv)/vol(Ev¹) times φ1,v and the derivative of W° at a=u q(y2), with y∈B(v)−E. Define cφv from the normalized zero Whittaker derivative plus logδ(g)φ; extend general φ by fiberwise integration/linearity.

**Hypotheses.**

- **H5**
- **H6**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells`.

**Construction or proof.**

1. Differentiate the separately normalized local Whittaker integrals and extend from pure tensors by linearity.
2. Use the shell expressions for coherent integral formulas and the local P-action for covariance.

**Uses.**

- `Yuan–Zhang 2018 §7.1, pp. 585–586 (k p. 585, c p. 586); coherent formulas valid for all φ_v in §7.3, pp. 594 and 600`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `localDerivativeCorrection_constructor` (constructor; algebraic-fragment): The nearby nonzero-index derivative k and the zero-index correction c.
- `localDerivativeCorrection_pure_tensor` (characterisation; algebraic-fragment): k=L(1,ηv)/vol(Ev¹) times φ₁,v and W°′ at uq(y₂).
- `localDerivativeCorrection_linear` (relation; algebraic-fragment): Both corrections extend linearly from pure tensors.
- `localDerivativeCorrection_zero_correction` (compatibility; algebraic-fragment): c contains W°′₀,v plus logδv times r(g)φv.

**Mathematical unit tests.**

- `localDerivativeCorrection_zero_function` (degenerate; fragment-example): Both corrections vanish for the zero Schwartz function.
- `localDerivativeCorrection_arch_zero` (compatibility; fragment-example): For the standard archimedean Gaussian, c=0.
- `localDerivativeCorrection_different_index` (non-example; fragment-example): Substituting the a≠0 normalization at a=0 omits its L-ratio and gives the wrong correction.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`TauCeti.GrossZagier.AlgebraicFragments.localDerivativeCorrection` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, pp. 585–586 (k p. 585, c p. 586); coherent formulas valid for all φ_v in §7.3, pp. 594 and 600.

### Projected derivative decomposition

`GrossZagierAndArithmeticHeights:GZ.6/colmez-projected-derivative` · theorem · `colmez_projected_derivative`

Let F be totally real, E/F a totally imaginary quadratic extension with character η, B a totally definite incoherent quaternion algebra over A_F with E_A → B, U ⊂ B_f^× open compact, and φ ∈ S̄(B×A^×) invariant under U×U, standard at every archimedean place, satisfying Assumption 7.1. Then Pr I′(0,g,φ)_U = −Σ_{v|∞} I′(0,g,φ)(v) − Σ_{v∤∞ nonsplit in E} I′(0,g,φ)(v) − c1·Ω_φ(g) − Σ_{v∤∞} Σ_{u∈µ_U²\F^×} Σ_{y∈E^×} c_{φ_v}(g,y,u) r(g)φ^v(y,u) + Σ_{u∈µ_U²\F^×} Σ_{y∈E^×} (2 log δ_f(g_f) + log|uq(y)|_f) r(g)φ(y,u). Here Ω_φ(g) = Σ_{u∈µ_U²\F^×}Σ_{y∈E^×} r(g)φ(y,u), and I′(0,g,φ)(v) = 2⨍_{C_U} K^{(v)}_φ(g,(t,t))dt is the normalized average over C_U = E^×\E^×(A_f)/(E^×(A_f)∩U). For v|∞, K^{(v)}_φ(g,(t1,t2)) = w_U Σ_{a∈F^×} lim_{s→0} Σ_{y∈µ_U\(B(v)^×_+ − E^×)} r(g,(t1,t2))φ(y)_a k_{v,s}(y), with k_{v,s}(y) = Γ(s+1)/(2(4π)^s)·∫_1^∞ dt/(t(1−λ(y)t)^{s+1}) and λ(y) = q(y2)/q(y) ∈ F_v. For finite nonsplit v, K^{(v)}_φ(g,(t1,t2)) = Σ_u Σ_{y∈B(v)−E} k_{r(t1,t2)φ_v}(g,y,u) r(g,(t1,t2))φ^v(y,u), with k_{φ_v}(g,y,u) = (L(1,η_v)/vol(E_v^1))·r(g)φ_{1,v}(y1,u)·W°′_{uq(y2),v}(0,g,u,φ_{2,v}) (y2 ≠ 0) for φ_v = φ_{1,v}⊗φ_{2,v}, extended linearly. c1 = 2L′_f(0,η)/L_f(0,η) + log|d_E/d_F|, with L_f the finite part and d_E, d_F absolute discriminants. c_{φ_v}(g,y,u) = r_E(g)φ_{1,v}(y,u)W°′_{0,v}(0,g,u,φ_{2,v}) + log δ(g_v)r(g)φ_v(y,u) for pure tensors, extended linearly.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-local-k-c`, `AutomorphicSpectralTheory:AS.4`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-s2-assumption`.

**Construction or proof.**

1. Differentiate the incoherent Fourier expansion, use YZZ holomorphic projection and the archimedean logarithmic integral, removing exactly the global gamma derivative. E10 fixes the intermediate c2 bookkeeping.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_projected_derivative` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, Theorem 7.2, p. 588; proof pp. 589–590.

### Automorphy and cuspidality of the height series

`GrossZagierAndArithmeticHeights:GZ.6/colmez-series-automorphy` · theorem · `colmez_series_automorphy`

For φ ∈ S(𝔹×A^×) invariant under U×U (|Σ| > 1), the series Z(g,φ)_U is absolutely convergent and is an automorphic form in g ∈ GL2(A) with coefficients in Pic(X_U×X_U)_C (Theorem 8.1 = [YZZ13, Th. 3.17]). Consequently, for t1,t2 ∈ E^×(A_f), the height series Z(g,(t1,t2),φ)_U = ⟨Z(g,φ)_U t1°, t2°⟩_NT is an automorphic form, and it is a cusp form by [YZZ13, Lemma 3.19].

**Hypotheses.**

- **H5**
- **H6**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-height-kernel`.

**Construction or proof.**

1. Import the genuine Picard-valued modularity theorem, then apply the degree-zero height functional; original YZZ proof leaves remain open.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_series_automorphy` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1, Theorem 8.1, p. 606 (= [YZZ13, Theorem 3.17]); cuspidality of the height series: §8.1, p. 607 (= [YZZ13, Lemma 3.19]).

### Derivative of the mixed theta–Eisenstein series before projection

`GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-derivative-of-the-mixed-theta` · theorem · `colmez_rev_derivative_of_the_mixed_theta`

For φ ∈ S̄(B×A^×) invariant under U×U (B incoherent): W_0(s,g,u) = −(L(s,η)/L(0,η))/(L(s+1,η)/L(1,η))·∏_v W°_{0,v}(s,g,u), with L(s,η) completed. This gives the analytic continuation of the constant term. Moreover I′(0,g,φ) = −Σ_{v nonsplit} I′(0,g,φ)(v) − c0 Σ_{u∈µ_U²\F^×}Σ_{y∈E} r(g)φ(y,u) − Σ_v Σ_u Σ_{y∈E} c_{φ_v}(g,y,u) r(g)φ^v(y,u) + 2 log δ(g) Σ_u Σ_{y∈E} r(g)φ(y,u), where c0 = d/ds|_{s=0} log(L(s,η)/L(s+1,η)) = 2L′(0,η)/L(0,η) + log|d_E/d_F|, by L(1−s,η) = |d_E/d_F|^{s−1/2}L(s,η). Only finitely many v contribute.

**Hypotheses.**

- **H5**
- **H6**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-local-k-c`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Construction or proof.**

1. Differentiate the completed global zero coefficient product and the nonzero Fourier terms separately.
2. Use the quadratic functional equation for c₀ and the finite bad-place support of normalized local corrections.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_rev_derivative_of_the_mixed_theta` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, 'Decomposition of the constant term', pp. 585–586 (from [YZZ13, §6.1.2, Prop. 6.7]).

### Archimedean holomorphic projection of log δ∞·W^(2)

`GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-archimedean-holomorphic-projection-of-log` · theorem · `colmez_rev_archimedean_holomorphic_projection_of_log`

Let W^(2)(g_∞) = ∏_{v|∞} W_v^(2), with W_v^(2)(diag(y,1)) = y e^{−2πy}1_{y>0}. Under the holomorphic-projection formula of [YZZ13, Prop. 6.12], whose per-place factor is 4π lim_{s→0}∫_0^∞ y^s W(y) W^(2)(y) dy/y² (so that W^(2) projects to itself), log δ_v(g_v)·W^(2)(g_∞) projects to −(1/2)(γ+log 4π)·W^(2)(g_∞). Hence log δ∞(g)W^(2)(g_∞) projects to c2·W^(2)(g_∞) with c2 = −([F:Q]/2)(γ+log 4π). Consequently c1 = c0 − 2c2 = 2L′(0,η)/L(0,η) + log|d_E/d_F| + [F:Q](γ+log 4π) = 2L′_f(0,η)/L_f(0,η) + log|d_E/d_F|, using L_∞(s,η) = Γ_ℝ(s+1)^{[F:Q]} and L′_∞/L_∞(0,η) = −([F:Q]/2)(γ+log 4π).

**Hypotheses.**

- **H5**
- **H6**

**Inputs.** `AutomorphicSpectralTheory:AS.4`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-derivative-of-the-mixed-theta`.

**Construction or proof.**

1. Apply the regularized weight-two Whittaker projection at each real place.
2. Evaluate 2π∫₀∞e^(−4πy)log y dy=−(γ+log4π)/2 and add the real places.
3. Remove the completed gamma logarithmic derivative to obtain the finite-part L constant.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_rev_archimedean_holomorphic_projection_of_log` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, proof of Theorem 7.2, pp. 589–590.

### Local Whittaker series for incoherent sections

`GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-local-whittaker-series-for-incoherent` · theorem · `colmez_rev_local_whittaker_series_for_incoherent`

Let v be finite, u ∈ O_{F_v}^× and φ_{2,v} ∈ S̄(E_v𝔧_v×F_v^×). For a ∈ F_v^×: W°_{a,v}(s,1,u,φ_{2,v}) = |d_v|^{1/2}(1−N_v^{−s}) Σ_{n≥0} N_v^{−ns+n} ∫_{D_n(a)} φ_{2,v}(x2,u)dx2. For a = 0: W_{0,v}(s,1,u,φ_{2,v}) = γ_{u,v}|d_v|^{1/2}(1−N_v^{−s}) Σ_{n≥0} N_v^{−ns+n} ∫_{D_n} φ_{2,v}(x2,u)d_ux2. Here dx2 is the self-dual measure for (E_v𝔧_v, uq), with vol(O_{E_v}𝔧_v) = |D_v|^{1/2}|d_v u q(𝔧_v)|; YZZ13 Prop. 6.10(1) as stated is correct only for a ≠ 0. Hence, for every φ_v and extending linearly: k_{φ_v}(1,y,u) = (L(1,η_v)/vol(E_v^1))·d/ds|_{s=0}[|d_v|^{1/2}(1−N_v^{−s})Σ_n N_v^{−ns+n}∫_{D_n(a)} φ_v(y1+x2,u)dx2] with a = uq(y2); and c_{φ_v}(1,y,u) = d/ds|_{s=0}[|D_v|^{−1/2}(L(s+1,η_v)/L(s,η_v))(1−N_v^{−s})Σ_n N_v^{−ns+n}∫_{D_n} φ_v(y+x2,u)d_ux2].

**Hypotheses.**

- **H5**
- **H6**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells`, `AutomorphicLFunctionsAndLocalFactors:AL.1`.

**Construction or proof.**

1. Expand the Whittaker integral by additive-character conductor shells.
2. For a≠0 use finite opposite-norm support; for a=0 retain the additional local L-ratio before differentiating.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_rev_local_whittaker_series_for_incoherent` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, pp. 593–594 (a ≠ 0) and pp. 599–600 (a = 0, correcting [YZZ13, Prop. 6.10(1)]).

### Hodge-class terms vanish and the height series splits into horizontal and vertical parts

`GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-hodge-class-terms-vanish-and` · theorem · `colmez_rev_hodge_class_terms_vanish_and`

Let (B,E,U) be as in §7.2 with |Σ| > 1, and let φ be U×U-invariant and satisfy Assumption 7.1. For each fixed coefficient/intersection calculation, first fix the finite collection of CM points and supports entering Z_*(g)t1 and t2 (and any finite C_U averages used). Choose a finite extension H/F defining these points and supports, unramified above Σ(𝔹_f), by taking a finite compositum of their permitted fields of definition. This is a coefficientwise choice, not one field defining all of the varying-conductor set CM_U. A single field may be chosen for the finite orbit C_U. The model X_{U,O_H} is Q-factorial by Corollary 4.6; use ξ̂-admissible arithmetic extensions on it ([YZZ13, §7.1.6]). For any further permitted finite extension H′/H, arithmetic degrees/intersection pairings scale by [H′:H]; hence their values divided by [H:F] are independent of the chosen H and agree after passing to a common permitted compositum. Assemble the height series coefficientwise using these normalized pairings. For t1,t2 ∈ C_U, Z(g,(t1,t2))_U = ⟨Z_*(g)t1,t2⟩ − ⟨Z_*(g)t1,ξ_{t2}⟩ − ⟨Z_*(g)ξ_{t1},t2⟩ + ⟨Z_*(g)ξ_{t1},ξ_{t2}⟩; the last three terms vanish by Assumption 7.1, so Z = ⟨Z_*t1,t2⟩ = −i(Z_*t1,t2) − j(Z_*t1,t2). Here i comprises finite horizontal intersections and archimedean Green values, and j is the vertical part. In the paper’s F-relative normalization j = Σ_v j_v log N_v, with log N_v = 1 at real v, and j_v = ∫_{C_U} j̄_v(Z_*(g)tt1,tt2)dt; likewise i_v = ∫_{C_U} ī_v. The C_U integrals are normalized finite-orbit averages. Local base-change scaling includes ramification and residue-degree weights; it is the total weighted pairing divided by [H:F] that is invariant.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `HilbertModularVarietiesAndShimuraCurves:R18.5`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-s2-assumption`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-height-kernel`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension`.

**Construction or proof.**

1. For each finite support use the pointwise field-of-definition statement rev-cm-points-on-x-u and its finite compositum, preserving unramifiedness above the division places. Use qfactorial and the ξ̂-admissible extension construction.
2. Compare two choices of H over a common permitted compositum. Pullback of the arithmetic pairing multiplies its arithmetic degree by the extension degree, with local ramification/residue-degree weights and archimedean multiplicities. Divide by the degree over F; this proves coefficientwise independence and permits assembly without a common field for CM_U.
3. Apply the two S2 vanishing conditions to the three Hodge-class cross terms; decompose the remaining admissible pairing into horizontal and vertical terms. Take the normalized average over the finite C_U orbit and keep log N_v = 1 at real v.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`TauCeti.GrossZagier.AlgebraicFragments.colmez_rev_hodge_class_terms_vanish_and` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1, pp. 607–608 ([YZZ13, Prop. 7.5]).

### Ideal-class Rankin series

`GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series` · definition · `partialRankin`

(5.3) For f = Σ a_n qⁿ in the new space and 𝒜 ∈ Cl_K: L_𝒜(f, s) = Σ_{n≥1, (n, DN)=1} ε(n) n^{1−2s} · Σ_{n≥1} a_n r_𝒜(n) n^{−s}. The first factor is L(2s − 1, ε) with the Euler factors at all p | N removed (not removed in the announcement [17], which is in error; there it was denoted L_σ(f, s)). For weight 2k (§9, Chapter IV (0.1)): n^{1−2s} is replaced by n^{2k−1−2s}.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AnalyticNumberTheory:AN.4`, `MetaplecticAutomorphicForms:MP.7`.

**Construction or proof.**

1. Form the ideal-class norm coefficients and multiply their Dirichlet series by the quadratic L-factor with the p|N factors removed.
2. Use the finite character orthogonality relations to compare with character-indexed series; the local bad-factor identification is a separate AL.3 input.

**Uses.**

- `Gross–Zagier 1986 Chapter I, §5, (5.3), p. 229; §9, p. 233; Chapter IV, (0.1), p. 267`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.6 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `partialRankin` (constructor; algebraic-fragment): L_A(f,s)=L^(N)(2s−2k+1,ε) Σ a(n)r_A(n)n^(−s).
- `partialRankin_character_sum` (compatibility; algebraic-fragment): Σ_A χ(A)L_A(f,s)=L(f,χ,s), with the bad Euler factors of the normalization comparison.
- `partialRankin_fourier_inverse` (extensionality; algebraic-fragment): L_A=h⁻¹Σ_χ χ(A)⁻¹L(f,χ,s).
- `partialRankin_removed_factors` (projection; algebraic-fragment): L^(N)(t,ε)=L(t,ε)Π_{p|N}(1−ε(p)p^(−t)).

**Mathematical unit tests.**

- `partialRankin_trivial_character` (compatibility; fragment-example): Σ_A L_A=L(f,1_K,s).
- `partialRankin_bad_prime` (non-example; fragment-example): At p|N the factor 1−ε(p)p^(1−2s) is present in weight two; restoring its inverse changes the series.
- `partialRankin_basis_indicator` (characterisation; fragment-example): The inverse finite character transform selects A and no other class.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.partialRankin` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §5, (5.3), p. 229; §9, p. 233; Chapter IV, (0.1), p. 267.

### Rankin absolute convergence

`GrossZagierAndArithmeticHeights:GZ.6/classical-absolute-convergence` · theorem · `gz86_absolute_convergence`

For weight 2k, the series defining L_𝒜(f, s) and the Euler product of L(f, χ, s) converge absolutely in the half-plane Re(s) > k + 1/2. In particular, the weight-2 case k = 1 converges absolutely for Re(s) > 3/2.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Construction or proof.**

1. Import the AL.3 arithmetic-to-unitary coefficient comparison and absolute-convergence estimates, with shift s↦s−k+1/2, and the ideal-count bound r_A(n)≪_ε n^ε. For any strict margin Re(s)−k−1/2>0 choose a smaller ε to justify the product and rearrangement. Chapter I p.229 explicitly records the weight-two specialization; the weight-2k bound is a derived extension, not a quotation from p.267.
2. The half-plane is Re(s)>k+1/2; no rearrangement at the central point is used.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_absolute_convergence` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §5, p. 229 ('It is not difficult to show'; no proof given).
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, introduction, p. 267, after (0.1).

### Completed Rankin functional equation

`GrossZagierAndArithmeticHeights:GZ.6/classical-entire-functional-equation` · theorem · `gz86_entire_functional_equation`

Under the standing hypotheses (in particular D ≡ □ mod 4N, so ε(N) = 1), for f in the new space of weight 2 on Γ₀(N) (normalized eigenform for L(f, χ, s)), the functions L_𝒜(f, s) and L(f, χ, s) have analytic continuations to the entire s-plane, satisfy functional equations under s ↦ 2 − s, and vanish at s = 1. Precisely (Chapter IV (0.2) with k = 1): L*_𝒜(f, s) := (2π)^{−2s} N^s |D|^s Γ(s)² L_𝒜(f, s) = −ε(N) L*_𝒜(f, 2 − s), and −ε(N) = −1.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.0/classical-rankin-normalization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-l-functional-equation`.

**Construction or proof.**

1. Pair the continued kernel with newforms and use its coefficient functional equation.
2. The completed factor is (2π)^(-2s)(N|D|)^sΓ(s)^2; reflection s↦2k−s has sign −ε(N).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_entire_functional_equation` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §5, (5.5) Proposition, p. 229; proved in Chapter IV: continuation via Rankin's method (§1, Proposition (1.2)), functional equation (0.2) proved in §4, pp. 282–283 ('This completes the proof of the functional equation').

### Hecke height-series cuspidality

`GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality` · theorem · `gz86_height_series_cuspidality`

Standing notation of Chapter I: N ≥ 1 an integer (N > 1 is assumed in the proof, §9; N = 1 is treated in [18]); X = X₀(N) over ℚ, J = Jac(X); K = ℚ(√D) imaginary quadratic with discriminant D, (D, N) = 1, and D odd (hence D ≡ 1 mod 4 and squarefree, so (D, 2N) = 1; D = −3 is allowed, D = −4 is excluded); O = O_K; h = #Pic(O); u = #(O^×/{±1}) (u = 1 unless D = −3, then u = 3); ε = (D/·) the quadratic character of K/ℚ; H = K(j(E)) the Hilbert class field; the Heegner hypothesis D ≡ β² (mod 4N) for some β ∈ ℤ (equivalently, every prime p | N splits in K); x a Heegner point of discriminant D on X; c = class of (x) − (∞) in J(H); σ ∈ Gal(H/K) corresponds to the ideal class 𝒜 ∈ Cl_K under the Artin isomorphism; ⟨ , ⟩ the global (Néron–Tate) height pairing over H extended Hermitian to J(H) ⊗ ℂ; ( , ) the Petersson product (5.1). Then the series g_𝒜(z) = Σ_{m≥1} ⟨c, T_m c^σ⟩ e^{2πimz} is a cusp form of weight 2 on Γ₀(N).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `HeightsRationalPointsAndObstructions:RP.0`, `ModularCurvesPartII:R14.2`, `ModularCurvesPartII:R14.5`.

**Construction or proof.**

1. Apply the imported Hecke-equivariant Jacobian/local-height pairing to the finite-dimensional Hecke module.
2. Use the perfect Fourier-coefficient pairing of the Hecke algebra and weight-two cusp forms to produce the series with coefficient ⟨a,T_m b⟩. This imports Mordell–Weil and the Jacobian instead of defining either again.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_height_series_cuspidality` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §6, (6.1) Theorem, p. 230; proved in Chapter V, §1, p. 306 (formal argument: for any ℚ-linear α: 𝕋 → ℂ, Σ α(T_m) qᵐ ∈ S₂(Γ₀(N)), via the perfect pairing 𝕋 × S₂(Γ₀(N), ℚ) → ℚ, (T, f) ↦ a₁(Tf); here α(T) = ⟨c, T c^σ⟩).
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter V, §1, p. 306 (proof of the first assertion of Theorem (6.1) of Chap. I).

### CM Hecke disjointness criterion

`GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness` · theorem · `gz86_disjointness`

Standing notation of Chapter I: N ≥ 1 an integer (N > 1 is assumed in the proof, §9; N = 1 is treated in [18]); X = X₀(N) over ℚ, J = Jac(X); K = ℚ(√D) imaginary quadratic with discriminant D, (D, N) = 1, and D odd (hence D ≡ 1 mod 4 and squarefree, so (D, 2N) = 1; D = −3 is allowed, D = −4 is excluded); O = O_K; h = #Pic(O); u = #(O^×/{±1}) (u = 1 unless D = −3, then u = 3); ε = (D/·) the quadratic character of K/ℚ; H = K(j(E)) the Hilbert class field; the Heegner hypothesis D ≡ β² (mod 4N) for some β ∈ ℤ (equivalently, every prime p | N splits in K); x a Heegner point of discriminant D on X; c = class of (x) − (∞) in J(H); σ ∈ Gal(H/K) corresponds to the ideal class 𝒜 ∈ Cl_K under the Artin isomorphism; ⟨ , ⟩ the global (Néron–Tate) height pairing over H extended Hermitian to J(H) ⊗ ℂ; ( , ) the Petersson product (5.1). Let m ≥ 1 with (m, N) = 1. The divisors c = (x) − (∞) and T_m d^σ = T_m(x^σ) − T_m(0) are relatively prime if and only if N > 1 and r_𝒜(m) = 0.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Construction or proof.**

1. Identify a common CM point in the determinant-m Hecke orbit with an integral O_K-ideal of norm m in the corresponding Artin class.
2. Count the automorphisms modulo ±1; for N>1 the two cusp subtractions are distinct and cause no additional CM intersection.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_disjointness` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §9, (9.1) Proposition, p. 232 ('it is easy to show'); refined in Chapter III, (4.3) Proposition, p. 258 (the multiplicity of x in T_m x^σ is r_𝒜(m), m prime to N) and Chapter II §5, p. 249.

### Classical Rankin unfolding

`GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-unfolding` · theorem · `gz86_rankin_unfolding`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. Let f = Σ a(n)qⁿ ∈ S_{2k}(Γ₀(N)) (any cusp form) and M = N|D|. For Re(s) large, Γ(s+2k−1)(4π)^{−s−2k+1} L_𝒜(f, s+2k−1) = ∬_𝓕 f(z) \overline{θ_𝒜(z) E_s̄(z)} y^{2k} dxdy/y² = (f, θ_𝒜 E_s̄)_{Γ₀(M)}, with E_s as in the referenced classical source result 179 and 𝓕 a fundamental domain for Γ₀(M). Proof as printed: Γ(s+2k−1)(4π)^{−s−2k+1} Σ a(n)r_𝒜(n)n^{−s−2k+1} = ∬_{Γ_∞\ℌ} f \overline{θ_𝒜} y^{s+2k} dxdy/y². Then write Γ_∞\ℌ = ∪_{γ ∈ Γ_∞\Γ₀(M)} γ𝓕, use the transformation laws of f and θ_𝒜 under Γ₀(M), and interchange sum and integral.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `AutomorphicSpectralTheory:AS.2`, `MetaplecticAutomorphicForms:MP.7`.

**Construction or proof.**

1. Unfold against the level-N Eisenstein family in its absolute-convergence region.
2. Integrate each Fourier exponential to obtain the Γ(s+2k−1)/(4π)^(s+2k−1) factor; keep the kernel and L-series parameters distinct.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_rankin_unfolding` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §1, pp. 270–271.

### Classical trace adjunction

`GrossZagierAndArithmeticHeights:GZ.6/classical-trace-adjunction` · theorem · `gz86_trace_adjunction`

For N | M, f ∈ S_{2k}(Γ₀(N)) and g ∈ M̃_{2k}(Γ₀(M)): (f, g)_{Γ₀(M)} = (f, Tr^M_N g)_{Γ₀(N)}. Consequently (4π)^{−s−2k+1}Γ(s+2k−1)L_𝒜(f, s+2k−1) = (f, Tr^M_N(θ_𝒜 E_s̄))_{Γ₀(N)} for Re(s) large, with M = N|D|.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `ModularCurvesPartII:R14.2`, `ModularCurvesPartII:R14.5`.

**Construction or proof.**

1. Use the trace coset decomposition and change variables in the Petersson integral.
2. Compare the index-normalized trace with the source unnormalized trace before applying adjunction.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_trace_adjunction` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §1, p. 271.

### Möbius level decomposition

`GrossZagierAndArithmeticHeights:GZ.6/classical-mobius-level-decomposition` · theorem · `gz86_mobius_level_decomposition`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. With M = N|D| and E^{(1)}_s as in the referenced classical source result 185: E_s(z) = ½ Σ_{e|N} μ(e) Σ_{c,d∈ℤ, M|c, e|d} ε(d)(cz+d)^{−(2k−1)} y^s|cz+d|^{−2s} = Σ_{e|N} μ(e)ε(e) e^{−(2s+2k−1)} (N/e)^{−s} E^{(1)}_s(Nz/e). Only e squarefree and prime to D contribute. For e > 1 the term Tr^M_N(θ_𝒜(z)E^{(1)}_s(Nz/e)) has level N/e < N: any system of representatives of Γ₀(M)\Γ₀(N) is one of Γ₀(M/e)\Γ₀(N/e), because (e, D) = 1. Hence, for f ∈ S^new_{2k}(Γ₀(N)), those terms are orthogonal to f. For non-holomorphic terms this uses §5: the product of f with a non-holomorphic form equals its product with a holomorphic form of the same level.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-adjunction`, `ModularCurvesPartII:R14.5`.

**Construction or proof.**

1. Separate the level divisors by inclusion–exclusion.
2. Apply trace adjunction to the resulting oldform/newform terms, retaining the Möbius factor.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_mobius_level_decomposition` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §1, pp. 271–272.

### Classical Rankin kernel

`GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel` · construction · `classicalRankinKernel`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. Φ̃_s(z) = Φ̃_{s,𝒜}(z) = Tr^{ND}_N(θ_𝒜(z) E^{(1)}_s(Nz)) ∈ M̃_{2k}(Γ₀(N)), where Tr^{ND}_N means Tr^{N|D|}_N (the referenced classical source result 182). Its Fourier expansion in x is Φ̃_s(z) = Σ_{m∈ℤ} A_m(s, y) e(mx) (1.3).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `AutomorphicSpectralTheory:AS.2`, `MetaplecticAutomorphicForms:MP.7`, `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-adjunction`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic`, `AutomorphicFormsOnReductiveGroups:AF.2/adelic-classical-bijection`.

**Construction or proof.**

1. Multiply the class theta series by the character-compatible Eisenstein family and trace from N|D| to N.
2. Check weight and cusp growth; the Fourier convolution has Nn+l=m|D|.

**Uses.**

- `Gross–Zagier 1986 Chapter IV, (1.2) Proposition and (1.3), p. 272`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.6 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `classicalRankinKernel` (constructor; algebraic-fragment): Tr_N^(N|D|)(θ_A(z)E_s^(1)(Nz)).
- `classicalRankinKernel_trace` (compatibility; omitted; actual source carrier not written): The result has level N, weight 2k and polynomial cusp growth in its initial convergence region.
- `classicalRankinKernel_fourier` (projection; omitted; actual source carrier not written): Its Fourier coefficient is the convolution with Nn+l=m|D|.
- `classicalRankinKernel_class_dependence` (relation; algebraic-fragment): The construction is linear in the ideal-class theta series.

**Mathematical unit tests.**

- `classicalRankinKernel_level_one` (computation; fragment-example): For N=1 the trace still runs from level |D| to 1.
- `classicalRankinKernel_negative_D` (non-example; fragment-example): The positive level is N|D|; ND<0 is shorthand, not a congruence subgroup level.
- `classicalRankinKernel_zero_theta` (degenerate; fragment-example): Replacing θ_A by zero gives the zero kernel.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.classicalRankinKernel` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, (1.2) Proposition and (1.3), p. 272.

### Rankin kernel pairing

`GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel-pairing` · theorem · `gz86_rankin_kernel_pairing`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. Let D be a fundamental discriminant, N ≥ 1 prime to D, and define Φ̃_s = Φ̃_{s,𝒜} ∈ M̃_{2k}(Γ₀(N)) by Φ̃_s(z) = Tr^{ND}_N(θ_𝒜(z) E^{(1)}_s(Nz)), where θ_𝒜 is the theta series (1.1) and E^{(1)}_s(z) = ½ Σ_{c,d∈ℤ, D|c} ε(d)(cz+d)^{−(2k−1)} y^s|cz+d|^{−2s}. Then for every f ∈ S^new_{2k}(Γ₀(N)): (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_𝒜(f, s+2k−1) = (f, Φ̃_s̄), first for Re(s) large, with the Petersson product (f, g) = ∬_{Γ₀(N)\ℌ} f ḡ y^{2k} dxdy/y².

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-unfolding`, `GrossZagierAndArithmeticHeights:GZ.6/classical-mobius-level-decomposition`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel`.

**Construction or proof.**

1. Combine the unfolded integral, trace adjunction and Möbius level decomposition.
2. For the newform subspace obtain the exact Rankin-kernel pairing with the stated gamma and level factors.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_rankin_kernel_pairing` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §1, (1.2) Proposition, p. 272.

### Prime-to-level newform detection

`GrossZagierAndArithmeticHeights:GZ.6/classical-prime-to-level-detection` · theorem · `gz86_prime_to_level_detection`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. Write Φ̃_s(z) = Σ_{m∈ℤ} A_m(s, y)e(mx) (1.3). The proof of (1.2) used only the orthogonality of f with forms of level strictly dividing N. f ∈ S^new_{2k}(Γ₀(N)) is also orthogonal to g(dz) for d > 1 and g of level dividing N/d, so in (1.2) only the A_m(s, y) with (m, N) = 1 are relevant. If Φ̃, Φ̃′ ∈ M̃_{2k}(Γ₀(N)) (with the growth of §5) have A_m = A′_m for all m prime to N, then (f, Φ̃) = (f, Φ̃′). In particular, the functional equation (0.2) and the formulas for L_𝒜(f, k) and L′_𝒜(f, k) reduce to identities for A_m(s, y), (m, N) = 1.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `ModularCurvesPartII:R14.5`.

**Construction or proof.**

1. Use the Hecke algebra/Fourier-coefficient perfect pairing on the newform subspace.
2. Prime-to-N Hecke operators determine each newform component; do not extend the assertion to arbitrary oldforms.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_prime_to_level_detection` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §1, Remark after (1.2) and (1.3), p. 272.

### Classical Eisenstein transformation

`GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-transformation` · theorem · `gz86_eisenstein_transformation`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For γ = (a b; c d) ∈ SL₂(ℤ) with (c, D) = |D₂|, D₁D₂ = D, and c* an inverse of c (mod D₁) with c* ≡ 0 (mod D₂): (E^{(1)}_s|_{2k−1}γ)(z) = ε_{D₁}(c) ε_{D₂}(dδ₁) δ₁^{−s−2k+1} E^{(D₁)}_s((z + c*d)/δ₁), where (F|_{2k−1}γ)(z) = (cz+d)^{−(2k−1)}F(γz).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `AutomorphicSpectralTheory:AS.2`.

**Construction or proof.**

1. Apply the Eisenstein transformation law with each ordered factorization D=D₁D₂.
2. Retain the κ(D₁) phase, especially κ= i for a negative discriminant.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_eisenstein_transformation` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, (2.2), pp. 273–274.

### Trace coset classification

`GrossZagierAndArithmeticHeights:GZ.6/classical-trace-coset-classification` · theorem · `gz86_trace_coset_classification`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. [Γ₀(N) : Γ₀(N|D|)] = Σ_{δ₁|δ} δ₁. The cosets Γ₀(N|D|)γ, γ = (a b; c d) ∈ Γ₀(N), are classified by δ₂ = (c, D) together with the residue class of c*d modulo δ₁ = δ/δ₂. So Tr^{ND}_N F = Σ_{D=D₁D₂} Σ_{j mod δ₁} F|_{2k}γ_{D₁,j}, where γ_{D₁,j} is any representative with (c, D) = δ₂ and c*d ≡ j (mod δ₁).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-adjunction`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Construction or proof.**

1. Classify the trace cosets by the denominator gcd and the source ramified divisor.
2. Use this finite decomposition to reorganize the level N|D| trace.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_trace_coset_classification` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, p. 276.

### Ramified theta reindexing

`GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing` · theorem · `gz86_ramified_theta_reindexing`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For every 1-periodic function f on ℌ: (f(z)θ_{𝒜𝒟₁}(z))|U_{δ₁} = (f(δ₂z)θ_{𝒜𝒟₁}(δ₂z))|U_δ = (f(δ₂z)θ_𝒜(z))|U_δ. The reason is that θ_{𝒜𝒟₁}(δ₂z) and θ_𝒜(z) have the same n-th Fourier coefficient for every n divisible by δ₂: r_{𝒜𝒟₁}(n/δ₂) = r_𝒜(n). This holds because 𝒜𝒟₁ = 𝒜𝒟₂ and every integral ideal of norm n (δ₂ | n) is 𝔡₂ times an integral ideal of norm n/δ₂.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `MetaplecticAutomorphicForms:MP.7`, `AnalyticNumberTheory:AN.4`.

**Construction or proof.**

1. Transform the theta series under the ramified ideal and cusp coset.
2. Reindex by multiplication with the different and use the genus character for the resulting class change.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_ramified_theta_reindexing` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, p. 276.

### Genus Eisenstein combination

`GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-combination` · construction · `genusEisensteinCombination`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. ℰ_s(z) = Σ_{D=D₁·D₂} ε_{D₁}(N) χ_{D₁·D₂}(𝒜) / (κ(D₁)|D₁|^{s+2k−3/2}) · E^{(D₁)}_s(|D₂|z), the sum over all ordered decompositions (D₁, D₂) of D as a product of two fundamental discriminants (D_i = 1 allowed; (D₁, D₂) and (D₂, D₁) are different terms, so there are 2^t terms, t the number of prime factors of D). ℰ_s depends on N (in fact only on N mod D) and on 𝒜 (in fact only on the genus of 𝒜); the paper suppresses this in the notation.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.0/classical-genus-character-factorization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-transformation`, `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing`, `AutomorphicSpectralTheory:AS.2`.

**Construction or proof.**

1. Sum over all ordered discriminant factorizations with their κ and genus factors.
2. The transformation formulas prove genus and residue-class dependence; ordered pairs must not be identified.

**Uses.**

- `Gross–Zagier 1986 Chapter IV, §2, (2.4) Proposition and the note after it, pp. 276–277`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.6 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `genusEisensteinCombination` (constructor; algebraic-fragment): The 2^t ordered D=D₁D₂ terms, with ε_D₁(N)χ_D₁D₂(A)/(κ(D₁)|D₁|^(s+2k−3/2)) factors.
- `genusEisensteinCombination_genus` (extensionality; algebraic-fragment): Depends on A only through its genus.
- `genusEisensteinCombination_level_residue` (extensionality; algebraic-fragment): Depends on N only modulo D.
- `genusEisensteinCombination_prime` (simp; algebraic-fragment): For k=1,D=−p,ε(N)=1 it is E_s^(1)(pz)−i p^(−s−1/2)E_s^(D)(z).

**Mathematical unit tests.**

- `genusEisensteinCombination_prime_terms` (computation; fragment-example): A prime discriminant gives two ordered terms.
- `genusEisensteinCombination_ordered` (non-example; fragment-example): Identifying (D₁,D₂) and (D₂,D₁) loses half the terms.
- `genusEisensteinCombination_i_factor` (characterisation; fragment-example): Negative D₁ has κ(D₁)=i; replacing it by 1 changes the Fourier coefficients.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.genusEisensteinCombination` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, (2.4) Proposition and the note after it, pp. 276–277.

### Rankin kernel U formula

`GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-u-formula` · theorem · `gz86_kernel_u_formula`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. Assume (D, 2N) = 1. Then Φ̃_s(z) = Tr^{ND}_N(E^{(1)}_s(Nz)θ_𝒜(z)) from Proposition (1.2) equals (ℰ_s(Nz)θ_𝒜(z))|U_{|D|}, where ℰ_s(z) = Σ_{D=D₁·D₂} ε_{D₁}(N)χ_{D₁·D₂}(𝒜)/(κ(D₁)|D₁|^{s+2k−3/2}) E^{(D₁)}_s(|D₂|z), summed over all ordered decompositions (D₁, D₂) of D as a product of two fundamental discriminants (D_i = 1 allowed). χ_{D₁·D₂} is the corresponding genus character, κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0, and E^{(D₁)}_s is the Eisenstein series (2.1).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-coset-classification`, `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-combination`.

**Construction or proof.**

1. Apply the trace coset classification to the theta–Eisenstein product.
2. Use the ramified theta reindexing to obtain the U_|D| formula.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_kernel_u_formula` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, (2.4) Proposition, p. 276.

### Prime-discriminant Eisenstein formula

`GrossZagierAndArithmeticHeights:GZ.6/classical-prime-eisenstein-combination` · theorem · `gz86_prime_eisenstein_combination`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. If k = 1, |D| = p is prime (so D = −p, p ≡ 3 mod 4) and ε(N) = 1, then ℰ_s(z) = E^{(1)}_s(pz) − i p^{−s−1/2} E^{(D)}_s(z) (printed with superscript (p); see PAPER-GROSS-ZAGIER-86/E33).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-combination`.

**Construction or proof.**

1. For a prime discriminant enumerate the two ordered factorization terms.
2. Insert ε(N)=1 and κ(D)=i to obtain the explicit difference.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_prime_eisenstein_combination` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §2, note after (2.4), p. 277.

### Rankin kernel Fourier expansion

`GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-fourier-expansion` · theorem · `gz86_kernel_fourier_expansion`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. Write ℰ_s(z) = Σ_{n∈ℤ} e_s(n, y) e(nx) (z = x+iy ∈ ℌ). Then Φ̃_{s,𝒜}(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_𝒜(l) e^{−2πly/δ} e((Nn+l)x/δ), with δ = |D|.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-u-formula`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-zero-coefficient`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-nonzero-coefficient`.

**Construction or proof.**

1. Expand the transformed Eisenstein combination and the ideal-class theta series.
2. Convolve the coefficients subject to Nn+l=m|D|, including the l=0 term r_A(0)=1/w.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_kernel_fourier_expansion` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, (3.1), p. 277.

### Rankin genus-sign function

`GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function` · definition · `rankinGenusSign`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For n ∈ ℤ ∖ {0} and d a positive divisor of n: ε(n, d) = ε_𝒜(n, d) = 0 if (d, n/d, D) ≠ 1, and ε(n, d) = ε_{D₁}(d) ε_{D₂}(−N n/d) χ_{D₁·D₂}(𝒜) if (d, n/d, D) = 1, where D = D₁D₂ is the decomposition with (d, D) = |D₂|.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `AnalyticNumberTheory:AN.4`, `GrossZagierAndArithmeticHeights:GZ.0/classical-genus-character-factorization`.

**Construction or proof.**

1. Choose D₂ by |D₂|=gcd(d,D) and set zero on common ramification.
2. Evaluate the two primitive quadratic characters and the genus character with signed n/d.

**Uses.**

- `Gross–Zagier 1986 Chapter IV, (3.2) Proposition, p. 277`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.6 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `rankinGenusSign` (constructor; algebraic-fragment): The piecewise genus-character value ε_A(n,d), zero when gcd(d,n/d,D)>1.
- `rankinGenusSign_values` (projection; algebraic-fragment): The values are 0,1,−1.
- `rankinGenusSign_complement` (relation; omitted; actual source carrier not written): For the source norm congruence, ε_A(n,|n|/d)=−ε(N)sgn(n)ε_A(n,d).
- `rankinGenusSign_multiplicative` (relation; omitted; actual source carrier not written): Multiplicative in coprime divisors d of fixed n.

**Mathematical unit tests.**

- `rankinGenusSign_common_ramification` (degenerate; fragment-example): If l|D divides both d and n/d, the sign is zero.
- `rankinGenusSign_positive_cancellation` (computation; fragment-example): For ε(N)=1,n>0 satisfying Nn+l≡0 with l a norm from A, Σ_d ε_A(n,d)=0.
- `rankinGenusSign_negative_index` (non-example; omitted; The quadratic-character genus-sign carrier and the n=±3 computation are absent; the scalar example was removed.): For D=−3,N=1,A=1, n=3 gives ε_A(3,1)=1, ε_A(3,3)=−1, whereas n=−3 gives both values 1. Thus σ_A(3)=0 and σ_A(−3)=2; replacing n by |n| loses the sign.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.rankinGenusSign` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, (3.2) Proposition, p. 277.

### Eisenstein zero coefficient

`GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-zero-coefficient` · theorem · `gz86_eisenstein_zero_coefficient`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. The 0-th Fourier coefficient of ℰ_s(z) (The Eisenstein combination ℰ_s) is e_s(0, y) = L(2s+2k−1, ε)(δy)^s + (ε(N)/(i√δ)) V_s(0) L(2s+2k−2, ε) (δy)^{−s−2k+2}.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-combination`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-transformation`, `AutomorphicSpectralTheory:AS.2`.

**Construction or proof.**

1. Compute the zero Fourier integral separately from nonzero indices.
2. Retain both quadratic L-factors and the gamma factors; it is not the n→0 limit of the nonzero formula.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_eisenstein_zero_coefficient` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, (3.2) Proposition (first formula), p. 277; proof pp. 278–279.

### Eisenstein nonzero coefficient

`GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-nonzero-coefficient` · theorem · `gz86_eisenstein_nonzero_coefficient`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For n ≠ 0, the n-th Fourier coefficient of ℰ_s(z) is e_s(n, y) = (ε(N)/(i√δ)) (δy)^{−s−2k+2} V_s(ny) Σ_{d|n, d>0} ε_𝒜(n, d) d^{−(2s+2k−2)}, with ε_𝒜(n, d) as in The sign function ε_𝒜(n, d).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-combination`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`, `AutomorphicSpectralTheory:AS.2`.

**Construction or proof.**

1. Poisson-sum the nonzero Eisenstein coefficient and evaluate its integral V_s.
2. The divisor sum has the signed genus factors; keep both signs of the Fourier index.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_eisenstein_nonzero_coefficient` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, (3.2) Proposition (second formula), p. 277; proof p. 279.

### Rankin kernel meromorphic continuation

`GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-meromorphic-continuation` · theorem · `gz86_kernel_meromorphic_continuation`

For each decomposition D = D₁·D₂ and each z ∈ ℌ, s ↦ E^{(D₁)}_s(z), defined by (2.1) for Re(s) > 3/2 − k, extends to a meromorphic function of s ∈ ℂ, given by the Fourier expansion of the referenced classical source result 209: the terms n ≠ 0 are entire in s (V_s(t) is entire for t ≠ 0, (3.3b)) and the series converges locally uniformly in (s, z) by the estimate V_s(t) = |t|^{O(1)}e^{−2π|t|}; the only possible poles come from the constant term V_s(0)L(2s+2k−2, ε)y^{−s−2k+2}. The continued function keeps the transformation law of the referenced classical source result 192. Consequently ℰ_s and Φ̃_s = (ℰ_s(Nz)θ_𝒜(z))|U_{|D|} continue meromorphically, Φ̃_s keeps its Γ₀(N) transformation law, and the expansions (3.1) and (3.2) hold for all s. This is what gives meaning to Φ̃_{−r} in Corollary (3.4) and to the values and derivatives at s = 0 and s = 1 − k used in §4.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-fourier-expansion`, `AutomorphicSpectralTheory:AS.2`.

**Construction or proof.**

1. Use the continued zero and nonzero Eisenstein coefficient formulas.
2. The locally uniform Fourier bounds continue the kernel, with the source specified poles; those bounds are imported from AS.2.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_kernel_meromorphic_continuation` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, implicit in Corollary (3.4) ('Φ̃_{−r}(z)', p. 281) and in §4 (p. 282); the paper states continuation only for V_s(t) (pp. 280–281).

### Integral Rankin kernel values

`GrossZagierAndArithmeticHeights:GZ.6/classical-integral-kernel-values` · theorem · `gz86_integral_kernel_values`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. For r ∈ ℤ, 0 ≤ r ≤ k−1 (Φ̃ continued in s through its Fourier coefficients): Φ̃_{−r}(z) = Σ_{m=0}^{∞} ( Σ_{0≤n≤mδ/N} e_{n,r}(y) r_𝒜(mδ − nN) ) e^{2πimz}, where e_{n,r}(y) := e_{−r}(n, Ny/δ) e^{2πNny/δ} is given by e_{0,r}(y) = L(2k−2r−1, ε)(Ny)^{−r} if r < k−1, and e_{0,k−1}(y) = [L(1, ε) − ε(N)(π/√δ) L(0, ε)] (Ny)^{1−k}; e_{n,r}(y) = (−1)^{k−r} ε(N) (2π/√δ) (Ny)^{r−2k+2} p_{k,r}(4πNny/δ) Σ_{d|n, d>0} ε_𝒜(n, d) d^{2r−2k+2} for n > 0, with p_{k,r} as in (3.3d) and ε_𝒜(n, d) as in (3.2). The coefficients are polynomials in 1/y of degree r.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-zero-coefficient`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-nonzero-coefficient`, `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-meromorphic-continuation`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Construction or proof.**

1. At integral s evaluate the gamma-normalized V_s and its derivative.
2. Separate polynomial positive-index terms from the decaying q_(k−1) negative-index integral.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_integral_kernel_values` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, (3.4) Corollary, pp. 281–282.

### Central kernel holomorphy

`GrossZagierAndArithmeticHeights:GZ.6/classical-central-kernel-holomorphy` · theorem · `gz86_central_kernel_holomorphy`

Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. At s = 0, Φ̃_{0,𝒜} ∈ M_{2k}(Γ₀(N)) (holomorphic, not in general cuspidal). This is the case r = 0 of (3.4); a priori it holds because ℰ_s(z) is holomorphic in z at s = 0.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-integral-kernel-values`, `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-fourier-expansion`.

**Construction or proof.**

1. Evaluate the Fourier expansion at the central kernel parameter.
2. The negative-index terms vanish and the remaining series has the exact holomorphic weight 2k transformation law.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_central_kernel_holomorphy` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §3, after (3.4), p. 282.

### Kernel coefficient functional equation

`GrossZagierAndArithmeticHeights:GZ.6/classical-coefficient-functional-equation` · theorem · `gz86_coefficient_functional_equation`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Let n ∈ ℤ satisfy (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A, and y > 0. Put e*_s(n,y) := π^{−s} δ^s Γ(s+2k−1) e_s(n,y). Then e*_s(n,y) = −ε(N) e*_{2−2k−s}(n,y) for all s. Explicitly: e*_s(0,y) = (s+k)(s+k+1)⋯(s+2k−2)[π^{−s}δ^sΓ(s+k)L(2s+2k−1,ε)](δy)^s − ε(N)(2−k−s)(3−k−s)⋯(−s)[π^{1/2−s}δ^{s−1/2}Γ(s+k−1/2)L(2s+2k−2,ε)](δy)^{2−2k−s}, the two brackets being interchanged by s ↦ 2−2k−s by the functional equation of L(s,ε); and for n ≠ 0, e*_s(n,y) = −iε(N)|n|^k π^{2k−1} δ^{−2k+3/2} y V*_s(ny) Σ_{d|n, d>0} ε_A(n,d)(|n|/d²)^{s+k−1}, so that (4.1) for n ≠ 0 follows from V*_s(t) = sgn(t)V*_{2−2k−s}(t) (Prop. 3.3c) and (4.3).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-zero-coefficient`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-nonzero-coefficient`, `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-meromorphic-continuation`.

**Construction or proof.**

1. Apply the gamma reflection and integral continuation to the coefficient formula.
2. Compare s with 2−2k−s; the signed divisor complement yields the source sign.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_coefficient_functional_equation` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, (4.1)–(4.2) and the two displays after (4.2), p. 282.

### Genus-sign reversal

`GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-reversal` · theorem · `gz86_genus_sign_reversal`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Let n ≠ 0 satisfy (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A and let d be a positive divisor of n. Then ε_A(n, |n|/d) = −ε(N)·sgn(n)·ε_A(n, d). (Both sides vanish unless (d, n/d, D) = 1. If (d, n/d, D) = 1 write D = D₀D′D″ with D₀, D′, D″ discriminants, |D′| = (d, D), |D″| = (n/d, D), D₀ prime to n; then the product ε_A(n,d)ε_A(n,|n|/d) equals ε_{D₀}(|n|) ε_{D′D″}(−N sgn n) χ_{D₀·D′D″}(A), and (4.2) gives χ_{D₀·D′D″}(A) = ε_{D₀}(l) = ε_{D₀}(−Nn), whence the product is ε_D(−N sgn n) = −ε(N)sgn(n).) In particular, if ε(N) = +1 and n > 0 satisfies (4.2), then Σ_{d|n, d>0} ε_A(n,d) = 0.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`, `AnalyticNumberTheory:AN.4`.

**Construction or proof.**

1. Replace d by |n|/d and evaluate the two primitive character signs.
2. The claimed reversal uses the norm congruence and ε(N); it is not a universal unsigned-divisor identity.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_genus_sign_reversal` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, (4.3) and its proof, pp. 282–283.

### Classical L functional equation

`GrossZagierAndArithmeticHeights:GZ.6/classical-l-functional-equation` · theorem · `gz86_l_functional_equation`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). L_A(f,s) extends to an entire function of s and L*_A(f,s) := (2π)^{−2s} N^s |D|^s Γ(s)² L_A(f,s) satisfies L*_A(f,s) = −ε(N) L*_A(f, 2k−s). In particular, if ε(N) = +1 then L_A(f,k) = 0. (§4 deduces this from Prop. (1.2), Eq. (3.1) and (4.1), which applies to every coefficient because the n occurring in (3.1) satisfy (4.2).)

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel-pairing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-coefficient-functional-equation`.

**Construction or proof.**

1. Pair the kernel functional equation with the newform.
2. Cancel the exact unfolding gamma and level factors to obtain Λ(s)=−ε(N)Λ(2k−s).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_l_functional_equation` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math.84(1986), ChapterIV (0.2), p.267; completion of the functional-equation proof in §4, pp.282–283.

### Signed divisor sums

`GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums` · definition · `signedDivisorSums`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). For an integer n ≠ 0: σ_A(n) := Σ_{d|n, d>0} ε_A(n,d). For n > 0: σ′_A(n) := Σ_{d|n, d>0} ε_A(n,d) log(n/d²). p_{k−1}(t) := Σ_{j=0}^{k−1} C(k−1, j)(−t)^j/j! (= p_{k,k−1}(t) of Prop. (3.3d)). Note that ε_A(n,d), hence σ_A(n), depends on the sign of n: ε_A(−n,d) = ε_{D₂}(−1)ε_A(n,d), D₂ as in the definition of ε_A. The polynomial p_(k−1) is imported as the generic terminating hypergeometric/Laguerre polynomial, not separately redefined in GZ; its exact formula is a supplier request.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`, `AnalyticNumberTheory:AN.4`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Construction or proof.**

1. Define the signed divisor sum and its log(n/d²) companion on their different domains.
2. Expand log(n/d²)=log n−2log d; retain signed n in σ, including the archimedean negative tail.

**Uses.**

- `Gross–Zagier 1986 Chapter IV, §4, Proposition (4.4) (σ_A, p_{k−1}), p. 283; Proposition (4.5) (σ′_A), p. 284`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.6 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `signedDivisorSums` (constructor; algebraic-fragment): The pair (σ_A(n),σ′_A(n)), with σ defined for n≠0 and σ′ for n>0.
- `signedDivisorSums_log` (characterisation; algebraic-fragment): σ′=log n·σ−2Σ_d ε_A(n,d)log d.
- `signedDivisorSums_prime_support` (projection; omitted; actual source carrier not written): Under the norm congruence, σ′ is a sum over primes with ε(p)≠1.
- `signedDivisorSums_negative` (compatibility; algebraic-fragment): σ_A(−n) retains the discriminant-dependent sign, as required in the resolvent tail.

**Mathematical unit tests.**

- `signedDivisorSums_one` (computation; fragment-example): σ′_A(1)=0 because log1=0.
- `signedDivisorSums_split` (degenerate; fragment-example): A split prime contributes zero to the logarithmic prime decomposition under its hypotheses.
- `signedDivisorSums_negative_tail` (non-example; fragment-example): For D=−3,N=1,A=1,n=3, σ_A(3)=0 and σ_A(−3)=2; substituting σ_A(3) deletes the analytic tail.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.signedDivisorSums` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, Proposition (4.4) (σ_A, p_{k−1}), p. 283; Proposition (4.5) (σ′_A), p. 284.

### Classical central-value kernel

`GrossZagierAndArithmeticHeights:GZ.6/classical-central-value-kernel` · theorem · `gz86_central_value_kernel`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Suppose ε(N) = −1. Then L_A(f,k) = 2^{2k+1} π^{k+1} / ((k−1)! √δ) · (f, Φ̃), where Φ̃ ∈ M̃_2k(Γ₀(N)) has the Fourier expansion Φ̃(z) = Σ_{m=0}^∞ ( Σ_{0<n≤mδ/N} σ_A(n) r_A(mδ − Nn) p_{k−1}(4πNny/δ) + (h/u) r_A(m) ) y^{1−k} e^{2πimz}. The coefficients of Φ̃ are polynomials in y^{−1} of degree ≤ k−1; for k = 1, Φ̃ is a holomorphic modular form (not a cusp form). (Φ̃ = (N^{k−1}√δ/2π)·Φ̃_{1−k}; the proof is Prop. (1.2) and Cor. (3.4) with r = k−1.)

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-integral-kernel-values`, `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-fourier-expansion`, `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`.

**Construction or proof.**

1. Evaluate the holomorphic central kernel and express its finite coefficients with σ.
2. Apply the norm congruence/genus relation; preserve the endpoint r_A(0)=1/w.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_central_value_kernel` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, (4.4) Proposition, p. 283.

### Different ideal reindexing

`GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing` · theorem · `gz86_different_reindexing`

With the standing notation (D odd, so D squarefree), for every m ≥ 0 and every class A: r_A(m|D|) = r_A(m). (The different 𝔡 = (√D) is principal and every integral ideal of norm m|D| is divisible by every ramified prime, hence equals 𝔡·𝔟 with N(𝔟) = m; for m = 0 both sides are 1/w.)

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `MetaplecticAutomorphicForms:MP.7`, `AnalyticNumberTheory:AN.4`.

**Construction or proof.**

1. Multiply ideals by the different and track the ideal class and norm |D| factor.
2. This is a theta coefficient reindexing, not an equality of individual ideal representatives.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_different_reindexing` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, used in (4.4) and (4.5) (the n = 0 term of Cor. (3.4), r_A(mδ − 0·N), is printed as r_A(m)), pp. 283–284; Theorems (5.6), (5.8) use both forms.

### Classical central-derivative kernel

`GrossZagierAndArithmeticHeights:GZ.6/classical-central-derivative-kernel` · theorem · `gz86_central_derivative_kernel`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Suppose ε(N) = +1. Then L′_A(f,k) = 2^{2k+1} π^{k+1} / ((k−1)! √δ) · (f, Φ̃), where Φ̃ = (N^{k−1}√δ/2π)·∂Φ̃_s/∂s|_{s=1−k} ∈ M̃_2k(Γ₀(N)) has the Fourier expansion Φ̃(z) = Σ_{m=−∞}^{∞} [ −Σ_{0<n≤mδ/N} σ′_A(n) r_A(mδ − Nn) p_{k−1}(4πnNy/δ) + (h/u) r_A(m)(log y + Γ′/Γ(k) + log Nδ − log π + 2L′/L(1, ε)) − Σ_{n=1}^∞ σ_A(−n) r_A(mδ + Nn) q_{k−1}(4πnNy/δ) ] y^{1−k} e^{2πimz} (the first two terms are absent if m < 0; in the third term n has been replaced by −n). CORRECTED: the paper prints σ_A(n) in the third term; it must be σ_A(−n) (= δ(n)R_{A𝔫}(n) by Prop. (4.6a)), see issue PAPER-GROSS-ZAGIER-86/E38. Ingredients (p. 283–284): ∂e_s(0,y)/∂s|_{1−k} = 2L(1,ε)(δy)^{1−k}[Γ′/Γ(k) + log(δ²y/π) + 2L′/L(1,ε)]; for n > 0, ∂e_s(n,y)/∂s|_{1−k} = 2iδ^{1/2−k}y^{1−k}V_{1−k}(ny)Σ_{d|n}ε_A(n,d) log d; for n < 0, ∂e_s(n,y)/∂s|_{1−k} = −iδ^{1/2−k}y^{1−k}·∂V_s(ny)/∂s|_{1−k}·Σ_{d|n}ε_A(n,d), with V_{1−k}, ∂V_s/∂s|_{1−k} from Prop. (3.3d,e).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-integral-kernel-values`, `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-fourier-expansion`, `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`, `GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing`.

**Construction or proof.**

1. Differentiate each continued Fourier branch at the central parameter.
2. The positive-index term uses σ′, the negative-index term uses σ(−n) and q_(k−1); the zero coefficient is differentiated separately.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_central_derivative_kernel` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, pp. 283–284: the three derivative displays and (4.5) Proposition.

### Genus-sign multiplicativity

`GrossZagierAndArithmeticHeights:GZ.6/classical-sign-multiplicativity` · theorem · `gz86_sign_multiplicativity`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). For fixed n ≠ 0 and coprime positive divisors d′, d″ of n with d′d″ | n: ε_A(n, d′d″) = ε_A(n, d′) ε_A(n, d″). Consequently Σ_{d|n} ε_A(n,d) d^{−s} has an Euler product, and, writing n = p₁^{ν₁}⋯p_s^{ν_s}n₀ with p_i | D and (n₀, D) = 1, σ_A(n) = ∏_{i=1}^{s}(1 + ε_A(n, p_i^{ν_i}))·Σ_{d₀|n₀} ε(d₀) (only d = p₁^{μ₁}⋯p_s^{μ_s}d₀ with μ_i ∈ {0, ν_i} contribute).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`.

**Construction or proof.**

1. Factor the primitive characters on coprime divisors of fixed n.
2. Check the common-ramification zero branch before using multiplicativity.
3. Multiplicativity itself holds for every fixed nonzero n: for coprime d-prime,d-double-prime the discriminant factors D2-prime and D2-double-prime are coprime, their genus characters multiply, and the two cross character evaluations cancel as squares. The norm congruence (4.2) is required for the subsequent genus identification, not for this multiplicativity.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_sign_multiplicativity` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, proof of (4.6a), p. 286 (also used in (4.6b), p. 287, and the remark on p. 288).

### Genus sigma identity

`GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity` · theorem · `gz86_genus_sigma_identity`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_{A𝔫}(n) = number of integral ideals of norm n in the genus {A𝔫} (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Let n be an integer satisfying (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A and ε(N)n < 0. Then σ_A(n) = δ(n)·R_{A𝔫}(|n|). (For n prime to D: σ_A(n) = Σ_{d|n} ε(d) = R(n), the total number of ideals of norm n, and by (4.2) all of them lie in {A𝔫}.)

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-reversal`, `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`, `AnalyticNumberTheory:AN.4`.

**Construction or proof.**

1. Use the complement sign under the explicit norm congruence Nn+l≡0 mod D, l a norm from A.
2. Apply genus orthogonality to obtain δ(n)R_(A𝔫)(|n|); without the norm congruence the printed shortcut is false.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_genus_sigma_identity` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, (4.6) Proposition a), p. 285; proof pp. 285–287.

### Logarithmic prime decomposition

`GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition` · theorem · `gz86_logarithmic_prime_decomposition`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_{A𝔫}(n) = number of integral ideals of norm n in the genus {A𝔫} (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Suppose ε(N) = +1 and n > 0 satisfies (4.2): Nn + l ≡ 0 (mod D) for some l = N(𝔞), 𝔞 an integral ideal in A [the hypothesis (4.2) is omitted in the printed statement of b); it is needed, see issue PAPER-GROSS-ZAGIER-86/E37]. Then σ′_A(n) = Σ_{p|n} a_p(n) log p with a_p(n) = 0 if ε(p) = 1; a_p(n) = (ord_p(n) + 1)·δ(n)·R_{A𝔫𝔠}(n/p) if ε(p) = −1; a_p(n) = ord_p(n)·δ(n)·R_{A𝔫𝔠}(n/p) if ε(p) = 0, where in the last two cases {𝔠} is the genus of any integral ideal with N(𝔠) ≡ −p (mod D) (Remark 1). (Proof: a_p(n) = −2Σ_{d|n} ε_A(n,d) ord_p(d); multiplicativity reduces to the p-part; ε(p) = −1 and ν odd use ε_A(n,d₁) = ε_{A𝔠}(−n₁,d₁) and part a); p | D uses ε_A(n,d) = −ε_A(n,n/d) and ε_A(n,d₁) = ε_{A𝔠𝔭^{ν−1}}(−n₁,d₁).)

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`, `GrossZagierAndArithmeticHeights:GZ.6/classical-sign-multiplicativity`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`, `AnalyticNumberTheory:AN.4`.

**Construction or proof.**

1. Expand σ′=log n·σ−2Σ ε_A(n,d)log d and separate prime powers.
2. Use multiplicativity and the norm congruence to cancel split primes and evaluate inert/ramified contributions.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_logarithmic_prime_decomposition` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, (4.6) Proposition b), p. 285; proof p. 287.

### Logarithmic coefficient parity

`GrossZagierAndArithmeticHeights:GZ.6/classical-prime-coefficient-parity` · theorem · `gz86_prime_coefficient_parity`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Under the hypotheses of (4.6b) (ε(N) = +1, n > 0, n satisfying (4.2)): Σ_{d|n} ε_A(n,d) = 0 (from (4.3)), hence σ′_A(n) = −2 Σ_{d|n} ε_A(n,d) log d; and every a_p(n) is even, since δ(n) is even if n is divisible by a ramified prime and ord_p(n) + 1 is even if n is divisible by an inert prime p with R(n/p) ≠ 0.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition`.

**Construction or proof.**

1. Pair complementary divisors at the given prime power.
2. The quadratic sign forces the stated parity restriction on the surviving logarithmic coefficient.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_prime_coefficient_parity` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, Remark 2 after (4.6), p. 285.

### Single-prime logarithm criterion

`GrossZagierAndArithmeticHeights:GZ.6/classical-single-prime-logarithm` · theorem · `gz86_single_prime_logarithm`

Standing notation of Chapter IV (pp. 267–282): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, assumed odd from §2 on (so D ≡ 1 mod 4, squarefree); δ = |D|; ε(n) = (D/n), the odd primitive quadratic character mod δ; h = #Cl_K; w = 2u = #O_K^×; A ∈ Cl_K a fixed ideal class; r_A(n) = number of integral ideals of norm n in A (n ≥ 1), r_A(0) = 1/w; N ≥ 1 an integer prime to D; k ≥ 1; f = Σ a(n)qⁿ ∈ S_2k^new(Γ₀(N)); L_A(f,s) = L^(N)(2s−2k+1, ε)·Σ_{n≥1} a(n) r_A(n) n^{−s} (0.1); Petersson product (f,g) = ∫_{Γ₀(N)\𝔥} f(z) \overline{g(z)} y^{2k} dx dy/y² (linear in f, antilinear in g); Φ̃_s ∈ M̃_2k(Γ₀(N)) the Rankin kernel of Prop. (1.2), (4π)^{−s−2k+1} N^s Γ(s+2k−1) L_A(f, s+2k−1) = (f, Φ̃_s); e_s(n,y) the n-th Fourier coefficient of 𝓔_s (§3), so that Φ̃_s(z) = Σ_{n∈ℤ, l≥0, Nn+l≡0 (mod D)} e_s(n, Ny/δ) r_A(l) e^{−2πly/δ} e((Nn+l)x/δ) (3.1); for n ≠ 0 and 0 < d | n, ε_A(n,d) = 0 if (d, n/d, D) ≠ 1 and ε_A(n,d) = ε_{D₁}(d) ε_{D₂}(−Nn/d) χ_{D₁·D₂}(A) otherwise, where D = D₁D₂ with |D₂| = (d, D) and χ_{D₁·D₂} is the genus character (Prop. (3.2)); V_s(t), V*_s(t) = (π|t|)^{−s−2k+1}Γ(s+2k−1)V_s(t), p_{k,r}(t) and q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1}x^{−k}e^{−xt}dx as in Prop. (3.3). Genus notation (p. 284–285): {𝔫} is the genus of any integral ideal 𝔫 of K with N(𝔫) ≡ ε(N)N (mod D) (independent of the choice); {A𝔫} its product with the genus of A; R_{A𝔫}(n) = number of integral ideals of norm n in the genus {A𝔫} (for n = 0 the sum of r_B(0) over the classes B of that genus); δ(n) = 2^s, s = number of prime factors of (n, D) (δ(0) = 2^t, t = number of prime factors of D). Under the hypotheses of (4.6b): σ′_A(n) = 0 if n is divisible to an odd power by more than one prime inert in K; if there is exactly one such prime p, σ′_A(n) = (ord_p(n) + 1)·δ(n)·R_{A𝔫𝔠}(n/p)·log p (CORRECTED; printed ‘R_{A𝔫}(p)’, issue PAPER-GROSS-ZAGIER-86/E40); if there is none, n is a norm, and letting q be the norm of an ideal prime to D in the genus of (an ideal of norm n)·{A𝔫}, (−q/p) = −1 for an odd number of primes p | D, and σ′_A(n) = δ(n) ord_p(n) R(n) log p if there is exactly one such p, 0 if there are several. A priori reason: Σ_{d|n} ε_A(n,d)d^{−s} vanishes at s = 0 with derivative ½σ′_A(n) and has an Euler product, so σ′_A(n) ≠ 0 only if exactly one Euler factor vanishes at s = 0.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition`.

**Construction or proof.**

1. Apply the prime decomposition and the parity restriction.
2. The source genus condition leaves one nonsplit prime; preserve the ramified alternative instead of claiming the same valuation coefficient.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_single_prime_logarithm` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §4, remark following the proof of (4.6), p. 288.

### Logarithmic weight-two projection

`GrossZagierAndArithmeticHeights:GZ.6/classical-holomorphic-projection` · theorem · `gz86_holomorphic_projection`

Let Φ̃(z) = Σ_{m∈ℤ} a_m(y)e^{2πimz} ∈ M̃₂(Γ₀(N)) satisfy the growth condition (6.1) at all cusps ξ, and suppose A_ξ = A(N₁), B_ξ = B(N₁) depend only on N₁ = gcd(N, denominator of ξ). Let {α(M), β(M) : M | N} be the solution of the non-singular linear system (6.3) Σ_{M|N} ((M,N₁)²/M²) α(M) = A(N₁) (N₁ | N), (6.4) Σ_{M|N} ((M,N₁)²/M²) {β(M) + α(M) log((M,N₁)²/M)} = B(N₁) (N₁ | N). Then there is a holomorphic cusp form Φ = Σ_{m≥1} a_m e^{2πimz} ∈ S₂(Γ₀(N)) with (Φ, f) = (Φ̃, f) for all f ∈ S₂(Γ₀(N)) and, for (m, N) = 1, (6.5) a_m = lim_{s→0} [4πm ∫₀^∞ a_m(y) e^{−4πmy} y^s dy + 24α(1)σ₁(m)s^{−1}] + 24β(1)σ₁(m) + 48α(1)[σ′₁(m) − σ₁(m)(log 2m + 1/2 + ζ′/ζ(2))], where σ₁(m) = Σ_{d|m} d, σ′₁(m) = Σ_{d|m} d log d. (Proof: subtract Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)}, which is orthogonal to cusp forms and has expansion A(N₁) log y + B(N₁) + O(y^{−1} log y) at ξ, then apply the case A = B = 0.)

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `AutomorphicSpectralTheory:AS.4`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-mellin-asymptotics`, `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-cusps`, `GrossZagierAndArithmeticHeights:GZ.6/classical-cusp-matrix-inverse`, `GrossZagierAndArithmeticHeights:GZ.6/classical-projection-boundary-coefficients`, `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-orthogonality`.

**Construction or proof.**

1. Solve the two cusp-constant systems, using the invertible C_N matrix.
2. Subtract Σ_M(α(M)F(Mz)+β(M)E(Mz)), which is cusp-orthogonal.
3. Apply the supplier projection to the decaying remainder and evaluate the regularized Fourier Mellin integral; restore the exact α(1),β(1) correction.
4. Here a_m(y) is the coefficient after extracting e^{2πimz}, so the Petersson unfolding has e^{−4πmy}. With coefficients multiplying e^{2πimx} the corresponding exponential would be e^{−2πmy}.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_holomorphic_projection` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, (6.2) Proposition, pp. 295-300.

### Eisenstein Mellin asymptotics

`GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-mellin-asymptotics` · theorem · `gz86_eisenstein_mellin_asymptotics`

Write E(z) = Σ_m e(m,y)e^{2πimz}, F(z) = Σ_m f(m,y)e^{2πimz}. For m > 0: e(m,y) = −24σ₁(m), and as s → 0 (Re s > 0): ∫₀^∞ e(m,y)e^{−4πmy}y^s dy = −(6/(πm))σ₁(m) + o(1); ∫₀^∞ f(m,y)e^{−4πmy}y^s dy = ∂/∂t[−2π^{3/2+t}m^{−1/2−t}Γ(s+t+1)Γ(s−t)σ_{1+2t}(m)/((4πm)^{s+1/2}Γ(2+t)Γ(s)ζ(2+2t))]_{t=0} = −24 Γ(s+1)/(4πm)^{s+1} · [2σ′₁(m) + σ₁(m)(log(π/m) + γ − 1 − 2ζ′/ζ(2) + 1/s)] = −(6/(πm))σ₁(m)s^{−1} − (12/(πm))σ′₁(m) + (12/(πm))σ₁(m)(log 2m + ½ + ζ′/ζ(2)) + o(1), γ = Euler's constant. For (m, N) = 1 the m-th coefficient of Φ̃* = Φ̃ − Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} is a*_m(y) = a_m(y) − α(1)f(m,y) − β(1)e(m,y); these give (6.5).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `QSeriesPartitionsAndMockModularForms:QM.3/nonholomorphic-eisenstein-series-e2-star`, `AutomorphicSpectralTheory:AS.2`.

**Construction or proof.**

1. Use E₂*=E₂−3/(πy) and its Eisenstein derivative family.
2. Evaluate the Mellin transforms, keeping the Laurent pole and constant before differentiating at zero.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_eisenstein_mellin_asymptotics` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), pp. 298-299.

### Boundary Eisenstein cusp constants

`GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-cusps` · theorem · `gz86_boundary_eisenstein_cusps`

Let M | N and ξ = a/c with (a,c) = 1, (c, N) = N₁; α = (a b; c d) ∈ SL₂(ℤ). Put a′ = (M/(M,N₁))a, c′ = c/(M,N₁) ((a′,c′) = 1), complete to α′ = (a′ b′; c′ d′) ∈ SL₂(ℤ), and relate z, z′ by c′z′ + d′ = ((M,N₁)/M)(cz+d); then (a′z′+b′)/(c′z′+d′) = M(az+b)/(cz+d), y′ = ((M,N₁)²/M)y, and E_{2,s}(Mz)|₂α = ((M,N₁)^{2+2s}/M^{2+s}) y^s + O(y^{−1−s}); hence E(Mz)|₂α = (M,N₁)²/M² + O(1/y), F(Mz)|₂α = ((M,N₁)²/M²)(log y + log((M,N₁)²/M)) + O(y^{−1} log y). Therefore Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} has expansion A(N₁) log y + B(N₁) + O(y^{−1} log y) at ξ iff (6.3), (6.4) hold.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `QSeriesPartitionsAndMockModularForms:QM.3/nonholomorphic-eisenstein-series-e2-star`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-mellin-asymptotics`, `ModularCurvesPartII:R14.2`.

**Construction or proof.**

1. Transform E₂* and the derivative to each finite-level cusp.
2. The leading log y and constant terms depend only on gcd(N,denominator); keep the y^(-1)log y remainder.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_boundary_eisenstein_cusps` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), pp. 297-298.

### Boundary Eisenstein orthogonality

`GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-orthogonality` · theorem · `gz86_boundary_eisenstein_orthogonality`

Let N ≥ 1 and M | N, and let E(z) = E_{2,s}(z)|_{s=0}, F(z) = ∂_sE_{2,s}(z)|_{s=0} as in the proof of (6.2) (the referenced classical source result 264). Then z ↦ E(Mz) and z ↦ F(Mz) lie in M̃₂(Γ₀(N)) and (f, E(M·)) = (f, F(M·)) = 0 for every f ∈ S₂(Γ₀(N)). Consequently Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} has the same Petersson products with cusp forms as 0, and Φ̃ and Φ̃* = Φ̃ − Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)} have the same holomorphic projection.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-cusps`, `ModularCurvesPartII:R14.5`.

**Construction or proof.**

1. Pair the boundary Eisenstein families with cusp forms in their convergence region.
2. Continue the pairing and differentiate; cusp decay kills the boundary terms, giving zero for both E and F.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_boundary_eisenstein_orthogonality` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, proof of (6.2), p. 298 ('the function Σ_{M|N}{α(M)F(Mz) + β(M)E(Mz)}, which is orthogonal to cusp forms').

### Cusp constant matrix inverse

`GrossZagierAndArithmeticHeights:GZ.6/classical-cusp-matrix-inverse` · theorem · `gz86_cusp_matrix_inverse`

Let C_N = (C_N(N₁, M))_{N₁, M | N}, C_N(N₁, M) = (M, N₁)²/M² (a σ₀(N) × σ₀(N) matrix). The entries are multiplicative, C_{∏p^{ν_p}}(∏p^{λ_p}, ∏p^{μ_p}) = ∏ C_{p^{ν_p}}(p^{λ_p}, p^{μ_p}), so C_N is the Kronecker product of the C_{p^ν} (N = ∏ p^ν). For N = p^ν, C_{p^ν}(p^λ, p^μ) = p^{2 min(λ,μ) − 2μ} (rows λ = 0..ν: (1, p^{−2}, …, p^{−2ν}), (1, 1, p^{−2}, …, p^{−2ν+2}), …, (1, …, 1)), and (6.6) C_{p^ν}^{−1} = (p² − 1)^{−1} × the tridiagonal matrix with diagonal (p², p²+1, …, p²+1, p²), superdiagonal −1, subdiagonal −p². In particular C_N is invertible and (6.3)-(6.4) have a unique solution. The displayed tridiagonal inverse is for ν≥1; for ν=0 use the 1×1 matrix (1).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `mathlib:Matrix.mul_apply`.

**Construction or proof.**

1. Factor C_N as the tensor product of its prime-power matrices.
2. Multiply the prime-power matrix by the displayed tridiagonal inverse; both corner rows must be checked. The ν=0 matrix is (1), handled separately.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.gz86_cusp_matrix_inverse` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, pp. 299-300, (6.6).

### Projection boundary coefficients

`GrossZagierAndArithmeticHeights:GZ.6/classical-projection-boundary-coefficients` · theorem · `gz86_projection_boundary_coefficients`

In the setting of (6.2): α(1) = ρ^{−1} Σ_{N₁|N} (μ(N₁)/N₁²) A(N₁), β(1) = ρ^{−1} Σ_{N₁|N} (μ(N₁)/N₁²)(B(N₁) − 2A(N₁) log N₁) − 2α(1) Σ_{p|N} log p/(p² − 1), where μ is the Möbius function and ρ = ∏_{p|N}(1 − p^{−2}) = Σ_{N₁|N} μ(N₁)/N₁². (Proof: C_N^{−1}(1, N₁) = ρ^{−1}μ(N₁)/N₁², and Σ_{N₁|N} (μ(N₁)/N₁²) s_p(N₁) = −2 Σ_{N₁|N} (μ(N₁)/N₁²) A(N₁)(v_p(N₁) + 1/(p²−1)) with s_p(N₁) = Σ_{M|N} C_N(N₁,M)α(M)(v_p(M) − 2 min{v_p(N₁), v_p(M)}).)

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-cusp-matrix-inverse`, `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-cusps`.

**Construction or proof.**

1. Use C_N^(-1) first for α and then for β after removing the α logarithmic term.
2. Extract the M=1 entries and verify the prime-power tensor factorization.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_projection_boundary_coefficients` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, (6.7) Proposition, pp. 300-301.

### Rankin cusp constants

`GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-cusp-constants` · theorem · `gz86_rankin_cusp_constants`

Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1. Let Φ̃ be the function of Prop. (4.5) for k = 1, i.e. Φ̃ = (√δ/2π)·∂/∂s Φ̃_s|_{s=0} with Φ̃_s = Tr^{ND}_N(θ_𝒜(z)E_s^{(1)}(Nz)) (Prop. (1.2)). Then Φ̃ satisfies the hypotheses of (6.2) with A(N₁) = (h/(2u²)) ε(N₁)N₁/N, B(N₁) = A(N₁)(log(N₁²δ/(Nπ)) − γ + 2(L′/L)(1, ε)) (N₁ | N), γ = Euler's constant. (Proof: at a cusp with invariant N₁, (Φ̃_s|₂α)(z) = (1/(2u))(ε(N₁)/N₂)[L(2s+1,ε)(N₁y/N₂)^s − (iV_s(0)/|D|^{1/2}) L(2s,ε)(N₁y/N₂)^{−s}] + … with N₂ = N/N₁, V_s(0) = −π^{1/2}Γ(s+½)i/Γ(s+1), using Lemma (2.3) and (2.2) of Chap. IV and the count of cosets of Γ₀(ND)\Γ₀(N)α with D | c (one) and (c, D) = 1 (|D| of them).)

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-central-derivative-kernel`, `AutomorphicSpectralTheory:AS.2`.

**Construction or proof.**

1. Compute the central derivative kernel at each cusp via its theta/Eisenstein transform.
2. The A(N₁)log y and B(N₁) terms retain the quadratic L logarithmic derivative and level factors.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_rankin_cusp_constants` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, (6.8) Proposition and proof, pp. 301-303.

### Rankin boundary coefficients

`GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-boundary-coefficients` · theorem · `gz86_rankin_boundary_coefficients`

Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1. For Φ̃ as in (6.8): α(1) = (h/(2u²)) N^{−1} ρ^{−1} Σ_{N₁|N} μ(N₁)ε(N₁)/N₁ = (h/(2u²)) N^{−1} ∏_{p|N}(1 + ε(p)/p)^{−1}, β(1) = α(1)(log(δ/(Nπ)) − γ + 2(L′/L)(1, ε) − 2 Σ_{p|N} log p/(p² − 1)).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-cusp-matrix-inverse`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-cusp-constants`.

**Construction or proof.**

1. Insert these Rankin cusp constants into the two linear systems.
2. Use the matrix inverse to obtain α(1),β(1), keeping the product Π_(p|N)(1+ε(p)/p)^(-1).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_rankin_boundary_coefficients` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, display after (6.8), p. 303.

### Rankin Mellin regularization

`GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-mellin-regularization` · theorem · `gz86_rankin_mellin_regularization`

Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1. For m > 0, a_m(y) = A_m log y + B_m + Σ_{n≥1} C_{mn} q₀(4πnNy/δ) (from Prop. (4.5); q₀(t) = ∫₁^∞ e^{−tx}dx/x), with A_m = (h/u)r_𝒜(m), B_m = A_m(log(Nδ/π) − γ + 2(L′/L)(1,ε)) − Σ_{1≤n≤mδ/N} σ′_𝒜(n) r_𝒜(mδ − Nn), C_{mn} = −σ_𝒜(−n) r_𝒜(mδ + Nn) (σ_𝒜, σ′_𝒜 as in Prop. (4.6)). Then ∫₀^∞ a_m(y)e^{−4πmy}y^s dy = Γ(s+1)(4πm)^{−s−1}(A_m (Γ′/Γ)(s+1) − A_m log 4πm + B_m) + Σ_n C_{mn} ∫₀^∞ q₀(4πnNy/δ)e^{−4πmy}y^s dy, and ∫₀^∞ q₀(4πnNy/δ)e^{−4πmy}y^s dy = 2Γ(2s+2)/((4πm)^{s+1}Γ(s+2)) · Q_s(1 + 2nN/(mδ)) + ε_n(s), ε_n(s) = O(n^{−s−2}) (uniformly near s = 0), ε_n(0) = 0, using Q₀(1+2t) = ½ log(1 + 1/t) and Q_s(1+2t) = (Γ(s+1)²/(2Γ(2s+2)))[t^{−s−1} + O(t^{−s−2})] (t → ∞). Since C_{mn} = O(n^c) for all c > 0, 4πm ∫₀^∞ a_m(y)e^{−4πmy}y^s dy = B_m − A_m(γ + log 4πm) + (2Γ(2s+2)/((4πm)^sΓ(s+2))) Σ_n C_{mn} Q_s(1 + 2nN/(mδ)) + o(1) (s → 0).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-central-derivative-kernel`, `AutomorphicSpectralTheory:AS.2`, `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Construction or proof.**

1. Apply the continued Fourier integral to the differentiated positive, negative and zero branches.
2. Evaluate the logarithmic exponential integral and Legendre tail; only after this continuation extract the constant at s=0.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_rankin_mellin_regularization` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, §6, pp. 303-304.

### Projected Rankin derivative cusp form

`GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-cuspform` · theorem · `gz86_projected_derivative_cuspform`

Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1. There exists a holomorphic cusp form Φ_𝒜(z) = Σ_{m≥1} a_{m,𝒜} e^{2πimz} of weight 2 and level N such that L_𝒜(f, 1) = 0 and L′_𝒜(f, 1) = (8π²/√δ)(f, Φ_𝒜) for every cusp form f in the space spanned by newforms of weight 2 and level N. (δ = |D|; the constant equals 8π²/√|D|, consistent with Chap. I (6.2).)

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-holomorphic-projection`, `GrossZagierAndArithmeticHeights:GZ.6/classical-central-derivative-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-cusp-constants`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-boundary-coefficients`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-mellin-regularization`.

**Construction or proof.**

1. Check the logarithmic growth condition at every cusp.
2. Apply the boundary-corrected weight-two projection; pairing with a cusp form is unchanged.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_projected_derivative_cuspform` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, (6.9) Theorem (i), p. 305.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §9, (9.2) with k = 1, p. 233; proved in Chapter IV, Theorem (6.9), p. 305 (via Rankin's method §§1–3, the functional equation §4 and holomorphic projection with Hecke's trick §6).

### Projected Rankin derivative coefficients

`GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-coefficients` · theorem · `gz86_projected_derivative_coefficients`

Standing notation of Chap. IV: N ≥ 1; D < 0 an odd fundamental discriminant (hence squarefree, D ≡ 1 mod 4; Chap. IV §2, p. 273), (D, N) = 1, δ := |D|, K = ℚ(√D), ε = ε_D = (D/·), h = h_K, u = #O_K^×/2, 𝒜 ∈ Cl_K, r_𝒜(n) = number of integral ideals of norm n in 𝒜 (r_𝒜(0) = 1/(2u)); weight 2k with k = 1; ε(N) = 1. For m prime to N, a_{m,𝒜} = − Σ_{1≤n≤m|D|/N} σ′_𝒜(n) r_𝒜(m|D| − nN) + (h/u) r_𝒜(m)[log(N|D|/(4π²m)) − 2γ + 2(L′/L)(1, ε)] + lim_{s→0}[−2 Σ_{n≥1} σ_𝒜(−n) r_𝒜(m|D| + nN) Q_s(1 + 2nN/(m|D|)) − (hκ/u²) σ₁(m) s^{−1}] + (hκ/u²)[σ₁(m)(log(N/|D|) + 2 Σ_{p|N} log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_{d|m} d log(m/d²)], where σ₁(m) = Σ_{d|m} d, κ = −12/(N ∏_{p|N}(1 + ε(p)/p)), σ_𝒜, σ′_𝒜 as in Prop. (4.6), Q_s = Legendre function of the second kind, γ = Euler's constant.

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-cuspform`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-mellin-regularization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`.

**Construction or proof.**

1. Insert the explicit Mellin constants and α(1),β(1) into the projection formula.
2. Combine the divisor logs using σ₁(m)log m−2σ′₁(m); the archimedean tail carries σ_A(−n).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual newform/Eisenstein/theta series, slash and trace operators, Fourier coefficient and regularized holomorphic projection carriers with the stated level, growth and cusp hypotheses.

`gz86_projected_derivative_coefficients` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter IV, (6.9) Theorem (ii), p. 305.

## GZ.7: Local arithmetic/analytic comparisons

Layer status: **planned**, implementation unchecked.

### Degenerate Schwartz classes

`GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-classes` · definition · `degenerateSchwartz`

At a finite place v, fix B_v=E_v⊕E_v j_v and write x=x₁+x₂ in these orthogonal summands. Define S¹ by Φ_v(x,u)=0 whenever ord_v(uq(x))≥−ord_v(d_v) or ord_v(uq(x₂))≥−ord_v(d_v), where d_v generates the different of F_v. Define S² by (r(g)Φ_v)(0,u)=0 for every g∈GL₂(F_v) and u∈F_v×. For the YZZ reduction choose an exceptional finite set S₁ of nonsplit places containing the ramification of F, E, B, σ and χ, and two auxiliary split unramified places S₂ disjoint from S₁. Use S¹ at S₁ and S² at S₂, with standard functions at nonsplit places outside S₁ and standard archimedean data. These subspaces impose different conditions; zero-evaluation for the identity Weil translate is insufficient for S².

**Hypotheses.**

- Finite v with the specified quadratic extension, orthogonal decomposition, different and actual extended Weil representation.
- For the global reduction, S₁ contains at least two finite places and all exceptional nonsplit places; S₂ consists of two split places unramified for σ and χ. Choose principal-congruence local levels at finite places, sufficiently deep at S₁, maximal at nonsplit places outside S₁ and at S₂. Exclude −1 globally and require the quotient maps used in the comparison to be unramified.

**Inputs.** `MetaplecticAutomorphicForms:MP.5/extended-schwartz-weil`, `GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors`.

**Construction or proof.**

1. Form the support-vanishing subspace S¹ and the intersection of the zero-evaluation kernels of all Weil translates S².
2. At nonsplit places use the anisotropic complementary summand and unipotent differences to obtain a nonzero theta image in each infinite irreducible representation.
3. At each auxiliary split place apply a Hecke operator minus its degree to the standard function; its Satake eigenvalue differs from the degree for the required infinite unitary representation, while its entire Weil orbit vanishes at zero.
4. Use multiplicity one and factorization to select pure tensor data with nonzero normalized toric contraction. The zero function alone does not prove this nonvanishing.

**Uses.**

- `YZZ Chapter5`: Remove self, singular, constant and Hodge terms in the kernel comparison.
- `Colmez Assumption7.1`: Use two explicit auxiliary split test functions to remove the constant term.

**Planning API.**

- `degenerateSchwartzOne` (constructor; algebraic-fragment): The support-vanishing subspace S¹.
- `degenerateSchwartzTwo` (constructor; algebraic-fragment): The orbit-zero subspace S².
- `degenerateSchwartzOne_support` (characterisation; algebraic-fragment): Either of the two valuation inequalities forces Φv(x,u)=0.
- `degenerateSchwartzTwo_translate` (characterisation; algebraic-fragment): Every Weil translate evaluates to zero at (0,u).

**Mathematical unit tests.**

- `degenerateSchwartz_zero` (degenerate; fragment-example): The zero function belongs to both subspaces.
- `degenerateSchwartzOne_boundary` (computation; fragment-example): Equality v(uq(x₂))=−v(dv) already forces zero.
- `degenerateSchwartzTwo_identity_only` (non-example; fragment-example): Vanishing of Φv(0,u) alone is insufficient: every r(g) translate must vanish there.

**Acceptance.**

- Use S¹ at the exceptional nonsplit set and S² at the two auxiliary split places; preserve their different definitions.
- The global reduction includes nonzero toric contraction and sufficiently small level, rather than only membership in a degenerate subspace.

**Lean correspondence.** The genuine extended Schwartz/Weil space, local CM-model and arithmetic Green/intersection carriers, nearby coherent representation and test data satisfying the target’s local level and nonzero-contraction hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.degenerateSchwartz` — algebraic-fragment.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.5.8, printed p. 17. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, Assumptions 5.2.1–5.2.5 and Proposition 5.2.7, pp. 185–187; Propositions 5.3.1–5.3.2, pp. 189–191; Proposition 5.4.1 and proof, pp. 191–193.

### Good-place arithmetic identity

`GrossZagierAndArithmeticHeights:GZ.7/good-local-arithmetic-identity` · theorem · `goodLocal_arithmetic_identity`

Under the source’s degeneracy assumptions and standard good local data, the derivative local Whittaker component equals twice the arithmetic local height component. At finite nonsplit good places prove this from the actual CM deformation lengths, separating inert and ramified ordinary/supersingular cases; at division places use the nearby coherent algebra and Drinfeld uniformization. Archimedean local Green kernels agree with the holomorphically projected derivative after the same normalization. The general bad/wild case is handled by approximation, not by an unsupported explicit good-place formula.

**Hypotheses.**

- Good local level/conductor and degeneracy conditions as specified in the source
- Finite deformation theory and archimedean spectral convergence imported

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-classes`, `GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions`, `GrossZagierAndArithmeticHeights:GZ.6/incoherent-central-derivative`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `AutomorphicSpectralTheory:AS.4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Construction or proof.**

1. Compute lengths of the CM lifting loci and translate them to proper-cycle intersections.
2. Match these lengths with the derivative representation-density/Whittaker coefficients.
3. At infinity integrate the Green/resolvent expansion and prove the normalized identity.

**Acceptance.**

- Ordinary split vanishing, supersingular inert and superspecial division cases have distinct formulas.

**Lean correspondence.** The genuine extended Schwartz/Weil space, local CM-model and arithmetic Green/intersection carriers, nearby coherent representation and test data satisfying the target’s local level and nonzero-contraction hypotheses.

`goodLocal_arithmetic_identity` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.5.9, printed pp. 18-19. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, Theorem 7.4.1 and its hypotheses in §7.4.1, pp. 233–236; Proposition 8.1.1, pp. 242–243; Proposition 8.2.7, pp. 248–249.

### Nearby coherent kernel orthogonality

`GrossZagierAndArithmeticHeights:GZ.7/nearby-coherent-orthogonality` · theorem · `nearbyCoherent_orthogonal`

For an incoherent quaternionic collection 𝔅, switching its Hasse invariant at a nonsplit place v gives a coherent algebra B(v). A coherent toric theta kernel attached to B(v) is perpendicular to the target quaternionic constituent σ when its local ramification set disagrees with the corrected distinction set Σ(π,χ). The function need not vanish: its σ-Petersson pairing vanishes by the local zero-Hom theorem.

**Hypotheses.**

- B(v) is coherent and K embeds as required; the local sign mismatch is at a specified place

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`, `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization`, `MetaplecticAutomorphicForms:MP.6/global-see-saw-and-projection`.

**Construction or proof.**

1. Compare the switched local Hasse invariant with the toric epsilon sign.
2. Factor the coherent toric pairing and apply the vanishing local Hom.
3. Use global see-saw/projection to conclude perpendicularity.

**Acceptance.**

- A nonzero coherent kernel with wrong local sign is allowed; only its σ-component is zero.

**Lean correspondence.** The genuine extended Schwartz/Weil space, local CM-model and arithmetic Green/intersection carriers, nearby coherent representation and test data satisfying the target’s local level and nonzero-contraction hypotheses.

`nearbyCoherent_orthogonal` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.5.10, printed p. 19. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §7.4.3, pp. 236–237.

### Nearby quaternionic approximation

`GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation` · theorem · `nearbyQuaternionic_approximation`

For the source’s degenerate global Schwartz data, decompose Pr I′ and Z̃ into finitely supported nonsplit local terms. At the bad places their analytic–arithmetic difference is approximated by coherent kernels from B(v), meaning equality on 1^SGL₂(A^S) for a specified finite S. Once the total difference and coherent sum are automorphic with the requisite continuous/K-finite transformation law, the source’s approximation/density argument upgrades the comparison to Pr I′−2Z̃=Σ_v I(0,·,χ,Φ(v)). This sum is generally nonzero, but its σ-projection vanishes by nearby-coherent orthogonality.

**Hypotheses.**

- The S₁/S₂ support, level, unramified and nonzero toric-contraction conditions specified by degenerate-schwartz-classes; archimedean standard functions.
- Density is invoked only in the automorphic category, not to infer a local bad-prime equality

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-classes`, `GrossZagierAndArithmeticHeights:GZ.7/good-local-arithmetic-identity`, `GrossZagierAndArithmeticHeights:GZ.7/nearby-coherent-orthogonality`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-height-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/incoherent-central-derivative`, `tauceti:TauCeti.GlobalNumberFields.weakApproximation_denseRange`.

**Construction or proof.**

1. Kill self, logarithmic singular, constant and Hodge contributions under the precise source conditions.
2. Compute good-place identities and construct nearby coherent approximants at each bad place.
3. Use automorphy and the source density argument for the global difference.
4. Apply the separate toric orthogonality theorem; do not identify the error with zero.
5. Apply pinned mixed-place weak approximation independently to the four matrix entries at the finite exceptional set S. The nonzero determinant locus is open, so the approximating rational matrix can be chosen invertible. Outside S an arbitrary element of GL₂(A^S) adjusts the remaining components. Thus GL₂(F)GL₂(A^S) is dense in GL₂(A); continuity and the common left GL₂(F)-automorphic law extend equality from 1^SGL₂(A^S). This uses weak approximation, with no restriction on determinants from strong approximation.

**Acceptance.**

- The argument removes mild-ramification hypotheses without claiming universal explicit wild coefficients.

**Lean correspondence.** The genuine extended Schwartz/Weil space, local CM-model and arithmetic Green/intersection carriers, nearby coherent representation and test data satisfying the target’s local level and nonzero-contraction hypotheses.

`nearbyQuaternionic_approximation` — omitted; actual source carrier not written.

**Sources.**

- [The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html), Chapter 1, Sec. 1.5.10, printed p. 19. Historical 2013-edition locator; current support is the separately cited public version.
- [The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), 6 November 2011 draft, §7.4.2–§7.4.3, Theorem 7.4.1 and (7.4.1), pp. 235–237.

### Modular cusp and boundary correction

`GrossZagierAndArithmeticHeights:GZ.7/boundary-cusp-correction` · theorem · `modularBoundary_correction`

For the noncompact split modular curve X₀(N), form the finite-level compactification and regularized Green/Hecke kernels. Their cusp expansions, finite-part constants, tangent-normalized diagonal values and Eisenstein contributions give the boundary corrections in the classical height kernel. The corrected height/Petersson identity holds after removing the explicitly proved old/Eisenstein components. It is not obtained by applying the compact quaternionic formula unchanged, nor by treating the exceptional infinite modular tower as locally noetherian.

**Hypotheses.**

- Classical Heegner hypotheses N, D coprime, D negative fundamental and the ChapterII–IV source hypotheses
- Use finite-level compactified curves and the source’s normalized cusp/tangent data

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cusp-expansion`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol`, `GrossZagierAndArithmeticHeights:GZ.6/classical-holomorphic-projection`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`.

**Construction or proof.**

1. Compute the resolvent cusp expansion and subtract its pole/constant.
2. Extend the diagonal by the normalized tangent and retain the eta/different self terms.
3. Assemble the finite and infinite corrections and show the remaining difference is old before newform projection.

**Acceptance.**

- A height with r_A(m)≠0 still requires the tangent/self corrections.

**Lean correspondence.** The genuine extended Schwartz/Weil space, local CM-model and arithmetic Green/intersection carriers, nearby coherent representation and test data satisfying the target’s local level and nonzero-contraction hypotheses.

`TauCeti.GrossZagier.AlgebraicFragments.modularBoundary_correction` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), II §§2,5; IV §6; V §1.

### Special test function and integral j

`GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function` · construction · `colmezTestFunction`

Consume quaternion-datum: choose a maximal order Ô_𝔹 ⊇ Ô_E in the finite incoherent quaternion algebra, and put U = Ô_𝔹^×, U_v = O_{𝔹_v}^×. Retain compactness |Σ(𝔹)| ≥ 2 and no common finite ramification of E and 𝔹. Every O_{B_v} below denotes this same chosen local order O_{𝔹_v}. Order containment is an explicit hypothesis, not an inference from Ô_E^× ⊂ U (E28). Take φ = ⊗φ_v with: (1) v|∞: the standard Gaussian; (2) v finite, nonsplit in E, split in B: 1_{O_{B_v}×O_{F_v}^×}; (3) v nonsplit in B: 1_{O_{B_v}^××O_{F_v}^×}; (4) v ∈ S2, a set of two finite places split in E and unramified over ℚ: 1_{O_{B_v}^××O_{F_v}^×} − (1+N_v+N_v²)^{−1}·1_{ϖ_v^{−1}(O_{B_v})_2×O_{F_v}^×}, where (O_{B_v})_2 = {x ∈ O_{B_v} : v(q(x)) = 2}; (5) v split in E, v ∉ S2: 1_{O_{B_v}×O_{F_v}^×}. For each finite v, fix 𝔧_v ∈ O_{B_v} orthogonal to E_v with v(q(𝔧_v)) ∈ {0,1}, equal to 1 iff B_v is nonsplit (then E_v/F_v is inert). In the split-B case, 𝔧_v acts as Galois conjugation on O_{E_v} ≅ M = O_{F_v}², transported by t ↦ t·m0 with m0 an O_{E_v}-module generator of M, and q(𝔧_v) = −1.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-s2-assumption`, `HilbertModularVarietiesAndShimuraCurves:R18.5`, `MetaplecticAutomorphicForms:MP.5`.

**Construction or proof.**

1. Use the containing maximal order and primitive O_E-module generator for the integral conjugation element.
2. Form the stated five types of local characteristic functions.
3. At S² apply the Hecke difference with degree N_v²+N_v+1 to prove full Weil-orbit zero evaluation.

**Uses.**

- `Yuan–Zhang 2018 §7.2 pp590–592`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `colmezTestFunction_constructor` (constructor; algebraic-fragment): The five-place restricted tensor product with the stated original integral 𝔧.
- `colmezTestFunction_biinvariant` (relation; omitted; actual source carrier not written): φ is invariant under the left and right U actions.
- `colmezTestFunction_auxiliary_degenerate` (relation; omitted; actual source carrier not written): For v∈S², r(g)φv(0,u)=0 for all g,u.
- `colmezTestFunction_order_containment` (projection; algebraic-fragment): The chosen maximal order explicitly contains O_E,v.

**Mathematical unit tests.**

- `colmezTestFunction_auxiliary_q_two` (computation; fragment-example): For N_v=2, the second auxiliary term has coefficient −1/7.
- `colmezTestFunction_division_units` (non-example; fragment-example): At a division place φv is supported on order units, not the whole order.
- `colmezTestFunction_primitive_generator` (characterisation; fragment-example): The split-B identification uses an O_E-module generator; a nonprimitive nonzero vector need not give an integral isomorphism.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`TauCeti.GrossZagier.AlgebraicFragments.colmezTestFunction` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.2 pp590–592.

### Integral order sandwich

`GrossZagierAndArithmeticHeights:GZ.7/colmez-order-sandwich` · theorem · `colmez_order_sandwich`

Use the chosen O_{B_v} ⊇ O_{E_v} and original integral 𝔧_v of test-function, with no common finite ramification. If D_v is the relative discriminant ideal of E_v/F_v, then D_v O_{B_v} ⊂ O_{E_v} + O_{E_v}𝔧_v ⊂ O_{B_v}, with equality on the right iff E_v/F_v is unramified (including split E_v).

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. When B_v is split, identify the chosen maximal order with End_{O_F}(O_E) using a primitive O_E-generator. Compare the trace-form discriminants of the maximal order and O_E + O_E𝔧_v and compute the dual lattice to obtain D_v O_{B_v} ⊂ O_E + O_E𝔧_v. The index is trivial precisely for unramified E_v/F_v.
2. When B_v is division, E_v/F_v is unramified by the no-common-ramification hypothesis, and O_{B_v} = O_{E_v} + O_{E_v}𝔧_v directly. Do not apply the split maximal-order discriminant-one calculation to this branch.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_order_sandwich` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma7.3 p592.

### Norm congruence shells and ramified correction

`GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells` · construction · `normShell`

For v finite and nonsplit in E, u ∈ O_{F_v}^× and a ∈ uq(E_v^×j_v) (the nearby line), put D_n(a) = {x2 ∈ E_v𝔧_v : uq(x2) − a ∈ p_v^n d_v^{−1}} and D_n = {x2 ∈ E_v𝔧_v : uq(x2) ∈ p_v^n d_v^{−1}}, with dx2 self-dual for (E_v𝔧_v, uq). Put α_v(y,u) = (log N_v/|D_v|^{1/2})·1_{D_v^{−1}O_{E_v}−O_{E_v}}(y)·Σ_{n=0}^{v(d_v)−1} N_v^n ∫_{D_n} φ_v(y+x2,u)dx2.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `AutomorphicLFunctionsAndLocalFactors:AL.1`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Define norm-congruence sets in the original quadratic line with its self-dual measure.
2. Use the local different for the additive-character threshold; define α by the finite shell sum on D⁻¹O_E∖O_E.

**Uses.**

- `Yuan–Zhang 2018 §7.3, pp. 593–594 (D_n(a) and α_v p. 593, D_n p. 594)`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `normShell_constructor` (constructor; algebraic-fragment): D_n(a)={x₂:uq(x₂)−a∈pⁿd⁻¹} and D_n with a=0.
- `normShell_measure` (projection; algebraic-fragment): Use the self-dual measure of the original quadratic line (E𝔧,uq).
- `normShell_ramified_correction` (constructor; algebraic-fragment): α uses the finite n<v(d) shell sum off O_E inside D⁻¹O_E.
- `normShell_inert_cutoff` (relation; algebraic-fragment): In the inert opposite norm class D_n(a) is empty above v(ad).

**Mathematical unit tests.**

- `normShell_inert_last_shell` (computation; fragment-example): For v(ad)=0 the only possible nonnegative shell is n=0.
- `normShell_unramified_different` (degenerate; fragment-example): If v(d)=0 the finite sum defining α is empty.
- `normShell_different_vs_discriminant` (non-example; fragment-example): Replacing v(d) by v(D) changes the shell bound and is not the same definition.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`TauCeti.GrossZagier.AlgebraicFragments.normShell` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, pp. 593–594 (D_n(a) and α_v p. 593, D_n p. 594).

### Inert norm-shell cutoff

`GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-inert` · theorem · `colmez_shell_inert`

If Ev/Fv is unramified quadratic and a lies in the opposite nearby norm class, Dn(a)=Dn for n≤v(a dv), and Dn(a)=∅ for n>v(a dv).

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Use opposite parity of the valuations of represented norms.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_shell_inert` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.5(1), p. 594; proof p. 595.

### Ramified norm-shell volume

`GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-ramified` · theorem · `colmez_shell_ramified`

For ramified Ev/Fv, Dn(a)=Dn for n≤v(a dv), is empty for n>v(a dv)+v(Dv)−1, and for v(a dv)<n≤v(a dv)+v(Dv)−1 has volume |Dv|^1/2 |dv| |a| q^(v(a dv)−n).

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Use the conductor of the local quadratic norm subgroup and index-two unit cosets, including wild/dyadic conductor.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_shell_ramified` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.5(2), p. 594; proof p. 595.

### Inert logarithmic singularity and diagonal extension

`GrossZagierAndArithmeticHeights:GZ.7/colmez-k-inert` · theorem · `colmez_k_inert`

For inert v with §7.2 data, kφv(1,y,u)−(1/2)φv(y1,u)1OEj(y2)(v(q(y2)/q(jv))+1)log q extends to a Schwartz function; its restriction to E is φv(y,u)(|dv qjv|−1)log q/((1+q^−1)(1−q)). The jv in the singular term is the original test-function j, not the nearby j.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-inert`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-order-sandwich`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-local-k-c`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Insert shell cutoff into normalized Whittaker derivative and evaluate finite geometric sums; verify source's nearby-line convention when implementing.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_k_inert` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.4(1), pp. 592–593; proof pp. 596–597.

### Ramified logarithmic singularity and diagonal extension

`GrossZagierAndArithmeticHeights:GZ.7/colmez-k-ramified` · theorem · `colmez_k_ramified`

For ramified v with §7.2 data, subtract (1/2)φv(y1,u)1OEj(y2)(v(qy2)+1)log q from kφv(1,y,u). It extends to Schwartz; on E its value is φv(y,u)[(|dv|−1)/(2(1−q))+(v(Dv)−1)/2]log q+αv(y,u)/2.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-ramified`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-local-k-c`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-order-sandwich`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Split the shell series into n<v(dv), n≤v(a dv), and the conductor tail; keep α on Dv^−1OE−OE.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_k_ramified` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.4(2), p. 593; proof pp. 597–598.

### Archimedean zero-term correction

`GrossZagierAndArithmeticHeights:GZ.7/colmez-c-arch` · theorem · `colmez_c_arch`

For standard archimedean φ and all g,y,u, cφv(g,y,u)=0.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/colmez-local-k-c`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Evaluate normalized W0(s) as δ(g)^−s r(g)φ(0,u); derivative cancels the logδ term.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_c_arch` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.6(1), p. 599 (via [YZZ13, Prop. 2.11]).

### Finite zero-term correction

`GrossZagierAndArithmeticHeights:GZ.7/colmez-c-finite` · theorem · `colmez_c_finite`

For v non-archimedean, (y,u) ∈ E_v×F_v^× and φ as in §7.2. If v ∉ S2: c_{φ_v}(1,y,u) = φ_v(y,u)·log|d_vq(𝔧_v)| plus φ_v(y,u)·2(|d_vq(𝔧_v)|−1)log N_v/((1+N_v^{−1})(1−N_v)) if E_v/F_v is inert; plus φ_v(y,u)·(|d_vq(𝔧_v)|−1)log N_v/(1−N_v) + α_v(y,u) if ramified; plus 0 if split. If v ∈ S2: c_{φ_v}(1,y,u) = −(2 log N_v/(1+N_v+N_v²))·1_{ϖ_v^{−1}(O_{B_v})_2}(y)·1_{O_{F_v}^×}(u), i.e. 2 log N_v·(φ_v(y,u) − 1_{O_{B_v}^××O_{F_v}^×}(y,u)); on E_v the set ϖ_v^{−1}(O_{B_v})_2 is {y ∈ ϖ_v^{−1}O_{E_v} : q(y) ∈ O_{F_v}^×}. Here α_v is as in Lemma 7.4.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Use the corrected a=0 Whittaker normalization; compute inert/ramified geometric series and the split norm-product volumes; verify both S2 summands separately.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_c_finite` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.3, Lemma 7.6(2), p. 599; proof pp. 599–604.

### Diagonal coefficient and modified self-intersection

`GrossZagierAndArithmeticHeights:GZ.7/colmez-omega-self` · construction · `modifiedSelfIntersection`

Set Ωφ=Σu∈μU²\F* Σy∈E* r(g,(t1,t2))φ(y,u). The coefficient of t2 in Z*t1 is Ωφ/e, e=[E*∩U:μU]=[OE*:OF*] at maximal level. Define i0(t,t)=i(t,t)−Σv iv(t,t)logNv, where iv is the extended local diagonal pairing, not the actual global self-intersection.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-torus-average`, `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Count the double cosets contributing the CM point t₂ and divide by [E×∩U:μU].
2. Subtract that diagonal coefficient to isolate proper intersection; use the extended local symbols for their own finite-part sum.

**Uses.**

- `Yuan–Zhang 2018 §8.1, pp. 608–609 (the coefficient of [t2]_U in Z_*(g)t1 and Ω_φ); Theorem 8.6(1)–(2), p. 616 (i_0 and i_v(t2,t2) = ∫_{C_U} ī_v(tt2,tt2)dt)`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `modifiedSelfIntersection_constructor` (constructor; algebraic-fragment): Ωφ and i₀=i−Σv i_v logN_v, with extended local diagonals.
- `modifiedSelfIntersection_coefficient` (projection; algebraic-fragment): The coefficient of t₂ in Z*t₁ is Ωφ/e.
- `modifiedSelfIntersection_proper_subtraction` (relation; algebraic-fragment): Subtract Ωφt₂/e before taking the proper horizontal intersection.
- `modifiedSelfIntersection_average` (compatibility; algebraic-fragment): i_v is the normalized C_U average of the extended local pairing.

**Mathematical unit tests.**

- `modifiedSelfIntersection_split_extended_zero` (degenerate; fragment-example): At an E-split finite place the extended local diagonal is zero.
- `modifiedSelfIntersection_elliptic_index_two` (computation; fragment-example): For e=2 the diagonal coefficient is Ωφ/2.
- `modifiedSelfIntersection_self_not_extension` (non-example; fragment-example): The actual global arithmetic self-intersection i is not replaced by the sum of formal extended local diagonals.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`TauCeti.GrossZagier.AlgebraicFragments.modifiedSelfIntersection` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.1, pp. 608–609 (the coefficient of [t2]_U in Z_*(g)t1 and Ω_φ); Theorem 8.6(1)–(2), p. 616 (i_0 and i_v(t2,t2) = ∫_{C_U} ī_v(tt2,tt2)dt).

### Regularized archimedean multiplicity

`GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green` · construction · `regularizedCmGreen`

For distinct CM lifts use ms(γ)=Qs(1−2λγ), with Qs(t)=∫0∞(t+sqrt(t²−1)cosh u)^−1−s du. Define extended diagonal Green sums by excluding E* and taking the constant Laurent coefficient at s=0.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `AutomorphicSpectralTheory:AS.2`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Import Q_s and the Green/resolvent meromorphic continuation from AS.2.
2. Form the nearby-quaternion sum excluding E× and take its Laurent constant; compare to ordinary distinct-point heights.

**Uses.**

- `Yuan–Zhang 2018 §8.2, pp. 609–610`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `regularizedCmGreen_constructor` (constructor; algebraic-fragment): Take the Laurent constant at s=0 of the E×-omitted nearby-quaternion Green sum.
- `regularizedCmGreen_distinct_points` (compatibility; omitted; actual source carrier not written): For distinct points this agrees with the ordinary archimedean local height.
- `regularizedCmGreen_diagonal_exclusion` (projection; algebraic-fragment): The extended diagonal omits E× multipliers.
- `regularizedCmGreen_constant_term` (characterisation; algebraic-fragment): The finite part discards the simple-pole term, not the whole Laurent germ.

**Mathematical unit tests.**

- `regularizedCmGreen_Q_zero` (computation; fragment-example): At s=0, Q₀(t)=½log((t+1)/(t−1)) for t>1.
- `regularizedCmGreen_ordinary_domain` (non-example; fragment-example): Including an E× multiplier on the diagonal introduces the undefined singular term.
- `regularizedCmGreen_pole_subtraction` (characterisation; fragment-example): For a/s+b+O(s), the regularized value is b.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`TauCeti.GrossZagier.AlgebraicFragments.regularizedCmGreen` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.2, pp. 609–610.

### Archimedean proper-height expression

`GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-proper` · theorem · `colmez_arch_proper`

At a real place, ivbar(Z*t1,t2)proper=Mφ^(v)(g,(t1,t2))−ivbar(t2,t2)Ωφ/e, where M is the regularized ms-weighted nearby-quaternion sum.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-omega-self`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Subtract the explicit diagonal multiplicity and apply the off-diagonal Green expansion; justify meromorphic continuation separately.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_arch_proper` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.2, Proposition 8.2, p. 610.

### Finite local multiplicities and diagonal omission

`GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity` · construction · `cmLocalMultiplicity`

(i) Let v be finite and nonsplit in E, and B = B(v). The multiplicity function m is defined on 𝔥_{U_v} = B_v^× ×_{E_v^×} 𝔹_v^×/U_v away from the image of (1,1), with m(b^{-1},β^{-1}) = m(b,β). For distinct [β1]_U ∈ CM_U and [t2]_U ∈ C_U, ī_v(β1,t2) = Σ_{γ∈μ_U\B^×} m(γt_{2v}, β_{1v}^{-1}) 1_{U^v}((β_1^v)^{-1}γt_2^v) ([YZZ13, Lemma 8.2]). For all pairs, ī_v is defined by the same sum over γ ∈ μ_U\(B^× − E^×∩β1Ut2^{-1}), equivalently over (B^×−E^×) ∪ (E^× − β1U_vt2^{-1}). For (y,u) ∈ (B_v−E_v)×F_v^×, m_{φ_v}(y,u) = Σ_{x∈𝔹_v^×/U_v} m(y,x^{-1}) φ_v(x, uq(y)/q(x)). For (y,u) ∈ E_v^××F_v^×, n_{φ_v}(y,u) = Σ_{x∈(𝔹_v^×−yU_v)/U_v} m(y,x^{-1}) φ_v(x, uq(y)/q(x)). (ii) Let v be split in E, with ν1, ν2 above v and E_v diagonal in 𝔹_v ≅ M2(F_v). The function m_ν̄1 on GL2(F_v)/U_v is supported on N(F_v)U_v/U_v. For U_v = (1+p_v^rO_{𝔹_v})^×, m_ν̄1(n(b)) = 1/(N_v^{r−v(b)−1}(N_v−1)) when v(b) ≤ r−1. The function m_ν̄2 is the same with lower unipotents N^t, and m_v̄ = ½(m_ν̄1+m_ν̄2). The extended pairing is ī_ν(β1,t2) = Σ_{γ∈μ_U\(E^×−β1U_vt2^{-1})} m_ν̄(t2^{-1}γ^{-1}β1) 1_{U^v}(β1^{-1}γt2), and ī_v(t,t) = 0. Finally n_{φ_v}(y,u) = ½Σ_{x∈(N(F_v)U_v−U_v)/U_v} φ_v(yx,u) m_ν̄1(x) + ½Σ_{x∈(N^t(F_v)U_v−U_v)/U_v} φ_v(yx,u) m_ν̄2(x).

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `HeegnerPointEulerSystems:HE.2`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Import CM deformation and ordinary/superspecial uniformization multiplicities.
2. Omit exactly the undefined diagonal orbit before forming the extended sum.
3. Change Hecke coset variables to form mφ and nφ; average the two split-prime ordinary functions.

**Uses.**

- `Yuan–Zhang 2018 §8.2 pp611–616`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `cmLocalMultiplicity_constructor` (constructor; algebraic-fragment): The geometric multiplicity m away from the diagonal orbit and its mφ,nφ sums.
- `cmLocalMultiplicity_diagonal_omission` (projection; algebraic-fragment): For an extended pairing omit precisely the undefined E×∩β₁Ut₂⁻¹ summands.
- `cmLocalMultiplicity_inverse_symmetry` (relation; algebraic-fragment): m(b⁻¹,β⁻¹)=m(b,β).
- `cmLocalMultiplicity_ordinary_average` (compatibility; algebraic-fragment): At an E-split place use ½(mν₁+mν₂), upper and lower unipotents.

**Mathematical unit tests.**

- `cmLocalMultiplicity_ordinary_r_one` (computation; fragment-example): For r=1,v(b)=0 the upper-unipotent multiplicity is 1/(N_v−1).
- `cmLocalMultiplicity_split_diagonal` (degenerate; fragment-example): The extended ordinary diagonal is zero.
- `cmLocalMultiplicity_wrong_half_sum` (non-example; fragment-example): Repeating mν₂ twice misses an upper-unipotent contribution; the two prime contributions must be averaged.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`TauCeti.GrossZagier.AlgebraicFragments.cmLocalMultiplicity` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.2 pp611–616.

### Nonsplit proper-height expression

`GrossZagierAndArithmeticHeights:GZ.7/colmez-nonsplit-proper` · theorem · `colmez_nonsplit_proper`

For nonsplit finite v, ivbar(Z*t1,t2)proper=Mφ^(v)+Nφ^(v)−ivbar(t2,t2)Ωφ/e, with M from mφ and N from nφ, and the distinct torus-translation conventions of Proposition8.3.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Separate B(v)*−E* terms from E* off-diagonal terms in the multiplicity sum and regroup through Hecke cosets.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_nonsplit_proper` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Proposition8.3 pp611–612.

### Ordinary multiplicity and local pairing

`GrossZagierAndArithmeticHeights:GZ.7/colmez-ordinary-pairing` · theorem · `colmez_ordinary_pairing`

Let v be split in E, with 𝔹_v ≅ M2(F_v), E_v the diagonal torus, and ν1 corresponding to the upper-left idempotent. For every open compact U and distinct CM points [β1]_U ∈ CM_U, [t2]_U ∈ C_U: ī_ν1(β1,t2) = Σ_{γ∈μ_U\E^×} m_ν̄1(t2^{-1}γ^{-1}β1) 1_{U^v}(β1^{-1}γt2). Here m_ν̄1: GL2(F_v)/U_v → Q is Zhang's ordinary multiplicity, supported on N(F_v)U_v/U_v. For U_v = (1+p_v^rO_{𝔹_v})^×, m_ν̄1(n(b)) = 1/(N_v^{r−v(b)−1}(N_v−1)) when v(b) ≤ r−1 ([Zha01, Lemma 5.5.1]). The same holds for ν2 with lower-triangular unipotents. Extended to all pairs by summing over γ ∈ μ_U\(E^×−β1U_vt2^{-1}), the formula gives ī_ν1(t2,t2) = 0 for every [t2]_U ∈ C_U.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. At small level the only contributing global γ is unique modulo μ; pass to general level using projection and the factor [μU:μU'].

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_ordinary_pairing` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.2, Lemma 8.4, pp. 613–614; ν2 version and m_v̄, i_v̄, pp. 614–615.

### Split proper height and zero extended diagonal

`GrossZagierAndArithmeticHeights:GZ.7/colmez-split-proper` · theorem · `colmez_split_proper`

For E-split v, ivbar(t,t)=0 and ivbar(Z*t1,t2)proper=Nφ^(v), the half-sum of the two ordinary unipotent multiplicities.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-ordinary-pairing`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Use commutativity for the diagonal and change Hecke coset variables for the proper terms.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_split_proper` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Proposition8.5 pp615–616.

### Full local decomposition of the height series

`GrossZagierAndArithmeticHeights:GZ.7/colmez-height-decomposition-series` · theorem · `colmez_height_decomposition_series`

Let (B,E,U) be as in §7.2 with |Σ| > 1, and let φ ∈ S(𝔹×A^×) be U×U-invariant and satisfy Assumption 7.1. Then for all t1,t2 ∈ C_U and g ∈ GL2(A): Z(g,(t1,t2),φ)_U = −Σ_{v nonsplit in E}(log N_v)∫_{C_U} M^{(v)}_φ(g,(tt1,tt2))dt − Σ_{v∤∞} N^{(v)}_φ(g,(t1,t2)) log N_v − Σ_{v∤∞} j_v(Z_*(g,φ)t1,t2) log N_v − i_0(t2,t2)Ω_φ(g,(t1,t2))/[E^×∩U:μ_U]. Here log N_v = 1 for real v. i_0(t2,t2) = i(t2,t2) − Σ_v i_v(t2,t2) log N_v, with i_v(t2,t2) = ∫_{C_U} ī_v(tt2,tt2)dt the extended local pairing. M^{(v)} is given by Proposition 8.2 for v|∞ and Proposition 8.3 for finite v. N^{(v)} is given by Proposition 8.3 for nonsplit v and Proposition 8.5 for split v. N^{(v)}(g,(tt1,tt2)) = N^{(v)}(g,(t1,t2)) because only y ∈ E^× occurs.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-proper`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-nonsplit-proper`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-split-proper`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-omega-self`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-s2-assumption`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-hodge-class-terms-vanish-and`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Use rev-hodge-class-terms-vanish-and coefficientwise over finite permitted fields, with pairings normalized by [H:F]. Its two S2 places kill the Hodge cross terms. Decompose proper horizontal and vertical intersections, isolate the self-term, and use C_U-invariance of N; retain normalized C_U averages and log N_v = 1 at real v.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_height_decomposition_series` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Theorem8.6 pp616–617.

### Supersingular inert local intersection

`GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-inert` · theorem · `colmez_local_m_inert`

For E-inert and B-split v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·(v(qy2)+1)/2.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-corrected-cm-multiplicity-at-split`.

**Construction or proof.**

1. Use YZZ local deformation multiplicity with its inert norm classes; the nearby j belongs to the switched algebra.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_local_m_inert` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.7(1), first case pp617–618.

### Wild-inclusive ramified local intersection

`GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-ramified` · theorem · `colmez_local_m_ramified`

For E-ramified and B-split v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·(v(qy2)+v(Dv))/2, including wild ramification.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-corrected-cm-multiplicity-at-split`.

**Construction or proof.**

1. Use the corrected c=0 multiplicity (1/2)v(Dv λ), not the erroneous tame-only formula inherited from Zha01/YZZ; original Gross lifting proof remains a gate.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_local_m_ramified` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.7(1), second case pp617–618.

### Superspecial local intersection

`GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-division` · theorem · `colmez_local_m_division`

For B-division (hence E-inert) v, mφ(y,u)=φv(y1,u)1OEvjv(y2)·v(qy2)/2.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-superspecial-m`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Use the integral upper-half-plane multiplicity of Lemma8.8 and Bv*/Uv≃Z.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_local_m_division` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.7(1), third case pp617–619.

### Diagonal-correction local coefficient

`GrossZagierAndArithmeticHeights:GZ.7/colmez-local-n` · theorem · `colmez_local_n`

Let (U,φ) be as in §7.2. For every finite place v ∉ S2 and (y,u) ∈ E_v^××F_v^×, n_{φ_v}(y,u) = φ_v(y,u)·½v(q(y)). For 𝔹_v nonsplit this is identically 0, since v(q(y)) = 0 on supp φ_v; for v nonsplit in E and 𝔹_v split it is the c ≥ 1 sum Σ_c m(y^{-1},h_c)vol(E_v^×h_cGL2(O)∩M2(O)_n); for v split it is ½(v(a)+v(d)) for y = diag(a,d). For v ∈ S2: n_{φ_v}(y,u) = −(1+N_v+N_v²)^{-1}·1_{ϖ_v^{-1}(O_{𝔹_v})_2}(y)·1_{O_{F_v}^×}(u). The ψ1 part vanishes, and the ψ2 part equals ½((1+v(a))+(1+v(d))) = 1 on its support. With the corrected Lemma 7.6(2) at S2, c_{φ_v}(1,y,u) = −(2log N_v/(1+N_v+N_v²))ψ2(y,u), so d_{φ_v}(1,y,u) = 0 still holds there.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-ordinary-pairing`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-c-finite`.

**Construction or proof.**

1. Use the chosen order and original 𝔧_v of test-function. Outside S2, omit conductor c = 0 in the nonsplit-E/split-B sum; at division B the norm valuation vanishes on support; in the split case the shell counts give ½(v(a)+v(d)).
2. At S2 compute each summand separately: n_{ψ1} = 0, while n_{ψ2} = ½((1+v(a))+(1+v(d))) = 1 on ψ2 support because v(a)+v(d) = 0. Thus n_φ = −ψ2/(1+N_v+N_v²), not zero. Use c_φ = −2ψ2 log N_v/(1+N_v+N_v²) = 2n_φ log N_v, and log|u q(y)| = 0 there, to obtain d_φ = 0.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_local_n` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.7(2) pp617–619.

### Superspecial multiplicity by uniformization

`GrossZagierAndArithmeticHeights:GZ.7/colmez-superspecial-m` · theorem · `colmez_superspecial_m`

For B-division and E-inert v, m(γ,β) vanishes unless qγ qβ is a unit and γ∈Ev*(1+OE,v πv jv); in that support m(γ,β)=v(λγ)/2.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `HilbertModularVarietiesAndShimuraCurves:R18.5`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`.

**Construction or proof.**

1. Use Čerednik–Drinfeld formal uniformization, reduce to two sections of P¹ over OEv with nonrational reductions, and compute largest congruence exponent for γ=a+bj.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_superspecial_m` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.8 pp619–621.

### Vertical correction is nonsingular pseudo-theta

`GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-pseudo` · theorem · `colmez_vertical_pseudo`

Let v be finite, nonsplit in 𝔹 and inert in E, with (U,φ) as in §7.2 (U_v = O_{𝔹_v}^×, φ_v = 1_{O_{𝔹_v}^×}⊗1_{O_{F_v}^×}), and B = B(v), so B_v ≅ M2(F_v). Fix a lift Ṽ = Σ_i a_iW̃_i to Ω̂⊗O_{F_v^ur} of the vertical divisor V_1. For t1,t2 ∈ C_U: j̄_v(Z_*(g,φ)t1,t2) = Σ_{u∈μ_U²\F^×} Σ_{γ∈B^×} r(g,(t1,t2))φ^v(γ,u) l^{(t1,t2)}_{r(g)φ_v}(γ,u), where l^{(t1,t2)}_{φ_v}(γ,u) = Σ_{x∈𝔹_v^×/U_v} φ_v(x, uq(t1^{-1}γt2)/q(x)) 1_{O^×}(q(x)/q(t1^{-1}γt2)) (γ^{-1}z0·Ṽ) = (γ^{-1}z0·Ṽ)·1_{O^×}(q(γ)q(t2)/q(t1))·1_{O^×}(u), and γ^{-1}z0·Ṽ = Σ_i a_i1_{α_iF_v^×GL2(O_{F_v})}(γ^{-1}). This kernel is supported on finitely many cosets of GL2(O_{F_v}) in B_v^× and on u ∈ O^×. It therefore extends by zero to a Schwartz function on B_v×F_v^×, so j̄_v and j_v = ∫_{C_U} j̄_v(Z_*(g)tt1,tt2)dt are finite sums of nonsingular pseudo-theta series on the full space B(v). Remark 8.10: the same holds for any U_v-invariant φ_v with φ_v(0,u) = 0.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-superspecial-m`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-theta`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Use the direct kernel in the second displayed formula on p. 623 with the fixed lift Ṽ. Its dependence on t1,t2 enters through q(t2)/q(t1); on φ_v = 1_{O_{𝔹_v}^×}⊗1_{O_F^×} the x-sum reduces to the unit-norm indicator times (γ^{-1}z0·Ṽ). No assertion that t2 fixes every component, and no equivariant-lift argument, is needed.
2. Index the finitely many components of Ṽ by α_i F_v^×GL2(O_F). Their indicators give the direct component pairing on p. 624. Combined with the fixed norm valuation, each such support is a finite union of GL2(O_F)-cosets, hence compact and open away from singular matrices. Extend by zero to a Schwartz function and apply the finite C_U average. This is the accepted amended E17 repair.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_vertical_pseudo` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma8.9,Remark8.10 pp622–624.

### Vertical correction vanishes at B-split places

`GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-split-zero` · theorem · `colmez_vertical_split_zero`

At a finite B-split place in the maximal-level setup, jv(Z*t1,t2)=0.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `HilbertModularVarietiesAndShimuraCurves:R18.5`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Use a smooth auxiliary-level cover with disjoint irreducible fiber components and descend their underlying component decomposition to the quotient.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_vertical_split_zero` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.3 p621.

### Analytic–arithmetic difference is a finite pseudo-theta sum

`GrossZagierAndArithmeticHeights:GZ.7/colmez-kernel-schwartz` · theorem · `colmez_kernel_schwartz`

For §7.2 data, archimedean K−M=0; at finite nonsplit v, k−m logq extends to Schwartz; dφ=2nφ logq−cφ+(2logδ+log|uqy|)rφ extends to Schwartz on E. All but finitely many local differences vanish identically.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-k-inert`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-k-ramified`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-c-finite`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-n`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-pseudo`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-projected-derivative`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-height-decomposition-series`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-proper`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Use Lemmas7.4/7.6/8.7 and unramified Iwasawa covariance; combine with the vertical nonsingular series.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_kernel_schwartz` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.1 pp625–627.

### Nonsplit diagonal cancellation

`GrossZagierAndArithmeticHeights:GZ.7/colmez-local-cancel-nonsplit` · theorem · `colmez_local_cancel_nonsplit`

Let v be finite and nonsplit in E, with (U,φ,𝗃_v,j_v) as in §7.2. For (y,u) ∈ E_v×F_v^×: 2k_{φ_v}(1,y,u) − 2m_{φ_v}(y,u)log N_v + d_{φ_v}(1,y,u) = −log|d_vq(𝗃_v)|_v·φ_v(y,u). Here k_{φ_v}(1,·) − m_{φ_v}·log N_v is the Schwartz extension from B(v)_v−E_v to B(v)_v×F_v^× of Lemmas 7.4 and 8.7, evaluated on E_v, and d_{φ_v}(1,y,u) = 2n_{φ_v}(y,u)log N_v − c_{φ_v}(1,y,u) + log|uq(y)|_vφ_v(y,u).

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-kernel-schwartz`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-ramified`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-inert`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-division`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Insert inert or ramified singularity-subtracted restrictions. In the ramified case α cancels and the remaining v(Dv) term cancels the geometric multiplicity correction.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_local_cancel_nonsplit` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.1, Proposition 9.2(1), pp. 627–628.

### Split diagonal cancellation

`GrossZagierAndArithmeticHeights:GZ.7/colmez-local-cancel-split` · theorem · `colmez_local_cancel_split`

For split finite v, with the chosen order and original 𝔧_v of test-function, d_φ(1,y,u) = −log|d_v q(𝔧_v)| φ_v(y,u). At v ∉ S2 use the usual local-n and c-finite formulas. At v ∈ S2 one has c_φ = 2n_φ log N_v, log|u q(y)| = 0 on support, q(𝔧_v) = −1 and |d_v| = 1, so both sides are zero.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-n`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-c-finite`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. For v ∉ S2, n_φ = ½v(q(y))φ_v, c_φ = φ_v log|d_v q(𝔧_v)|, and u is a unit on support. Substitute in d_φ = 2n_φ log N_v − c_φ + log|u q(y)|φ_v (p. 626). Since log|q(y)| = −v(q(y))log N_v, the valuation terms cancel, leaving −c_φ.
2. At S2 use the separate corrected formulas n_φ = −ψ2/(1+N_v+N_v²), c_φ = 2n_φ log N_v and log|u q(y)| = 0. With the same d_φ convention as Proposition 9.2, the two correction contributions cancel, giving d_φ = 0. The different is a unit since F_v/Q_p is unramified, and the original 𝔧_v has norm −1. Never replace the S2 computation by the usual valuation formula.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_local_cancel_split` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Proposition9.2(2) p628.

### Nonzero associated weight-one theta

`GrossZagierAndArithmeticHeights:GZ.7/colmez-nonzero-theta` · theorem · `colmez_nonzero_theta`

Let (F,E,𝔹,U,φ) be as in §7.2. The weight-one theta series θ_{Ω,1}(g) = Σ_{u∈μ_U²\F^×} Σ_{y∈E} r_E(g)φ(y,u), which is the outer theta series of Ω_φ, is not identically zero. Take g_v = [[0,1],[−1,0]] at v ∈ Σ_f ∪ S2 and g_v = 1 elsewhere. Every term r_E(g)φ(0,u) is ε times a nonnegative number, with ε = Π_{v∈Σ_f}λ(E_v/F_v,ψ_v) ∈ {±1}, and |r_E(g)φ(0,1)| > 0. At v ∈ S2, ∫_{E_v}φ_v(y,1)dy = (1−N_v^{-1})²(1 − 3/(1+N_v+N_v²)) > 0. So the finite sum over u ∈ O_F^{×,+}/μ_U² is nonzero.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`, `MetaplecticAutomorphicForms:MP.5`.

**Construction or proof.**

1. Use the Weil action of E itself, rather than the ambient quaternion algebra, at the specified g. Inert division places contribute their Weil index λ(E_v/F_v,ψ_v), which is independent of u on the allowed support. Their product is the common sign ε.
2. Every constant-term summand is ε times a nonnegative quantity. At S2 the integral is (1−N_v^{-1})²(1−3/(1+N_v+N_v²)) > 0, and the remaining factors at u = 1 have nonzero absolute value. Therefore |r_E(g)φ(0,1)| > 0; the finite sum over O_F^{×,+}/μ_U² has sign ε and cannot vanish. Positivity of the signed constant term is not required.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_nonzero_theta` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.1, p. 628.

### Archimedean adjunction constant

`GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-arch` · theorem · `colmez_adjunction_arch`

With Petersson norm ||dz||=2 Im z and Q0(t)=(1/2)log((t+1)/(t−1)), the limit of m0(z0,z1)−log(2 Im z1/|z1−z0|) as z1→z0 is 0, so −log||1||w=iw(P,P)/e.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green`, `GrossZagierAndArithmeticHeights:GZ.2/colmez-residue-line`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Algebraically rewrite as (1/2)log(1+|z1−z0|²/(4Imz0 Imz1))−(1/2)log(Imz1/Imz0); both limits vanish.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_adjunction_arch` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.2 pp631–632.

### Extended local diagonal vanishes at small away-v level

`GrossZagierAndArithmeticHeights:GZ.7/colmez-small-level-diagonal` · theorem · `colmez_small_level_diagonal`

For nonsplit finite v, with U'v sufficiently small and U'v normal in Uv away from v as in §9.2, ivbar([1]U',[1]U')=0. For split v it is zero without shrinking.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Bound support in a compact local subgroup; in a totally definite nearby algebra global units modulo central μ are finite; shrink the away-v level to exclude the noncentral cosets.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_small_level_diagonal` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.2, Lemma 9.5, p. 634 (split case, p. 635).

### Geometric realization of extended self-intersection

`GrossZagierAndArithmeticHeights:GZ.7/colmez-modified-projection` · theorem · `colmez_modified_projection`

Let (B,E,U) be as in §7.2 with |Σ| > 1, P = [1]_U ∈ X_U(H) (H the Hilbert class field of E), w a finite place of H over v, and R = O_{H_w^ur}. Let U′ = U_vU′^v, where U′^v ⊂ U^v is open, normal and small enough that X_{U′,R} is regular, E^× ∩ U′μ_U = μ_U, and Lemma 9.5 holds. Let π: X_{U′,R} → X_{U,R} be the projection. Then every irreducible component 𝒫′ of the divisor π^*𝒫_R is the image of a section Spec R → X_{U′,R} and occurs in π^*𝒫_R with multiplicity e = [O_E^×:O_F^×]. Moreover i_w(P,P) = ī_v(P,P) = ⟨π^*𝒫_R − e𝒫′, 𝒫′⟩, a proper intersection on the special fibre of X_{U′,R}. If v is split in E, both sides are 0.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-small-level-diagonal`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-omega-self`, `HilbertModularVarietiesAndShimuraCurves:R18.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Choose U′ away from v so the model is regular and E^× ∩ U′μ_U = μ_U. Since U′_v = U_v contains O_{E_v}^×, the class fields defining the CM lifts and their U-translates are unramified at w over the Hilbert class field H. Thus the lifts are H_w^ur-rational; properness extends them to sections over R.
2. The stabilizer condition gives ramification multiplicity e in π^*𝒫_R. Use small-level diagonal vanishing, Lemma 9.5 and the U/U′ projection sum, dividing by [μ_U:μ_{U′}], to obtain the proper intersection. The coarse projection need not be étale (E18).

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`colmez_modified_projection` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Lemma9.4 pp632–635, with E18 caveat.

### Finite adjunction lattice identity

`GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-finite` · theorem · `colmez_adjunction_finite`

For the residue image N at a finite place w, Nw contains OHw and length(Nw/OHw)=iw(P,P)/e.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-modified-projection`, `GrossZagierAndArithmeticHeights:GZ.2/colmez-residue-line`, `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Pull to the small-level regular model; compare π*O(P/e)|P' with O(P')|P', take the ideal of π*P/e−P', and apply the proper intersection formula.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_adjunction_finite` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §9.2 pp633–634.

### Arithmetic adjunction for the CM point

`GrossZagierAndArithmeticHeights:GZ.7/colmez-arithmetic-adjunction` · theorem · `colmez_arithmetic_adjunction`

For compact §7.2 data, i0(P,P)/[OE*:OF*]=−h_LU(P).

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-arch`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-finite`, `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Sum finite residue-lattice lengths and archimedean norms; the arithmetic degree of the residue-normalized line gives the identity.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_arithmetic_adjunction` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Theorem9.3 pp629–635.

### Two auxiliary split places

`GrossZagierAndArithmeticHeights:GZ.7/colmez-s2-assumption` · definition · `twoSplitDegeneracy`

A set S2 of two non-archimedean places of F, split in E and unramified over Q, such that for v ∈ S2 the group U_v is maximal and r(g)φ_v(0,u)=0 for all g ∈ GL2(F_v) and u ∈ F_v^×.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `MetaplecticAutomorphicForms:MP.5`.

**Construction or proof.**

1. Define the two-place condition inside the imported Schwartz/Weil data.
2. Verify that the special Hecke-difference functions satisfy it; this is the source’s projection growth assumption.

**Uses.**

- `Yuan–Zhang 2018 Assumption 7.1 p587`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `twoSplitDegeneracy_constructor` (constructor; algebraic-fragment): Two distinct finite E-split, ℚ-unramified maximal-level places with full Weil-orbit zero evaluation.
- `twoSplitDegeneracy_place_projection` (projection; algebraic-fragment): Each auxiliary place is E-split and its F_v/ℚ_p extension is unramified.
- `twoSplitDegeneracy_weil_zero` (characterisation; algebraic-fragment): r(g)φv(0,u)=0 for every g∈GL₂(F_v),u∈F_v×.
- `twoSplitDegeneracy_linear` (relation; algebraic-fragment): The local vanishing subspace is closed under addition and scalar multiplication.

**Mathematical unit tests.**

- `twoSplitDegeneracy_zero_schwartz` (degenerate; fragment-example): The zero local function satisfies full Weil-orbit vanishing.
- `twoSplitDegeneracy_single_place` (non-example; fragment-example): One split place does not satisfy the two-place assumption.
- `twoSplitDegeneracy_zero_at_identity_only` (non-example; fragment-example): φv(0,u)=0 alone is insufficient: its Fourier/Weil transform can be nonzero at zero.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`TauCeti.GrossZagier.AlgebraicFragments.twoSplitDegeneracy` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), Assumption 7.1 p587.

### Archimedean derivative kernel

`GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-archimedean-derivative-kernel` · definition · `archDerivativeKernel`

For a real place v, let B(v) be the nearby quaternion algebra (split at v), with y = y1 + y2 ∈ B(v)_v = E_v + E_v j and λ(y) = q(y2)/q(y) ∈ F_v (λ(y) < 0 on B(v)^×_+ − E^×). Put k_{v,s}(y) = Γ(s+1)/(2(4π)^s)·∫_1^∞ dt/(t(1−λ(y)t)^{s+1}) and K^{(v)}_φ(g,(t1,t2)) = w_U Σ_{a∈F^×} lim_{s→0} Σ_{y∈µ_U\(B(v)^×_+ − E^×)} r(g,(t1,t2))φ(y)_a k_{v,s}(y), where φ(y)_a is YZZ13's a-th Whittaker coefficient notation. Then I′(0,g,φ)(v) = 2⨍_{C_U}K^{(v)}_φ(g,(t,t))dt is the holomorphic projection of the v-part [YZZ13, Prop. 6.15].

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `AutomorphicSpectralTheory:AS.2`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-torus-average`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Use the archimedean Whittaker projection and the Γ-normalized integral for λ<0.
2. Sum with the stated positive-norm/off-E restriction, take the source finite part, and apply the normalized CM orbit average.

**Uses.**

- `Yuan–Zhang 2018 §7.1, Theorem 7.2(1), p. 588`: Supply the specified analytic/arithmetic local term with the source’s normalization.
- `GZ.6–GZ.7 kernel comparison`: Retain the local coefficient, multiplicity or normalization needed to compare Pr I′ with 2Z and isolate self-intersections.

**Planning API.**

- `archDerivativeKernel_constructor` (constructor; algebraic-fragment): The Γ-normalized integral k_v,s for λ<0 and its nearby-quaternion sum.
- `archDerivativeKernel_lambda_domain` (projection; algebraic-fragment): λ(y)<0 for the positive-norm off-E inputs.
- `archDerivativeKernel_torus_average` (compatibility; omitted; actual source carrier not written): The projected v-derivative is twice the normalized C_U diagonal average.
- `archDerivativeKernel_zero_parameter` (simp; algebraic-fragment): For λ<0, k_v,0=½log((1−λ)/(−λ)).

**Mathematical unit tests.**

- `archDerivativeKernel_lambda_minus_one` (computation; fragment-example): For λ=−1, k_v,0=½log2.
- `archDerivativeKernel_diagonal_limit` (non-example; fragment-example): As λ→0⁻ the value diverges, so λ=0 is not an ordinary kernel input.
- `archDerivativeKernel_normalization_half` (characterisation; fragment-example): Omitting the prefactor 1/2 doubles k_v,0.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual extended Schwartz space and Weil action, adelic norm/character data, local Whittaker or theta family and holomorphic projection. Generic functions, germs or scalar correction terms lack those identifications.

`TauCeti.GrossZagier.AlgebraicFragments.archDerivativeKernel` — algebraic-fragment.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §7.1, Theorem 7.2(1), p. 588.

### Corrected CM multiplicity at 𝔹-split, E-nonsplit places

`GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-corrected-cm-multiplicity-at-split` · theorem · `colmez_rev_corrected_cm_multiplicity_at_split`

Let v be a finite place of F nonsplit in E and split in 𝔹, and B = B(v), so B_v is the division algebra. Let U_v = GL2(O_{F_v}). For c ≥ 0 write E_v^×h_cGL2(O_{F_v}) for the elements β whose lattice has multiplier ring O_{F_v} + ϖ_v^cO_{E_v}. The multiplicity function m on B_v^× ×_{E_v^×} GL2(F_v)/GL2(O_{F_v}), defined away from the image of (1,1), satisfies m(b,β) ≠ 0 only if q(b)q(β) ∈ O_{F_v}^×. In that case, for β ∈ E_v^×h_cGL2(O_{F_v}) and λ(b) = q(b2)/q(b) (b = b1 + b2, b1 ∈ E_v, b2 ⊥ E_v): m(b,β) = ½(v(λ(b))+1) if c = 0 and E_v/F_v is unramified; m(b,β) = ½v(D_vλ(b)) if c = 0 and E_v/F_v is ramified (tame or wild); m(b,β) = N_v^{1−c}(N_v+1)^{-1} if c > 0 and E_v/F_v is unramified; m(b,β) = ½N_v^{−c} if c > 0 and E_v/F_v is ramified. Proof of the c = 0 ramified case: by Gross's theorem, End of the canonical lifting mod π_E^m is O_E + π_E^{m−1}O_{B_v}, so 2m(b,β) = 1 + max_{a∈O_E}v(N(b1−a) + q(b2)). The quotient −q(b2)/N(t) is a non-norm, and 1+p^{v(D_v)} ⊂ N(E_v^×) while 1+p^{v(D_v)−1} is not, so the maximum is v(λ(b)) + v(D_v) − 1.

**Hypotheses.**

- **H5**
- **H6**
- **H7**
- **H9**
- **H8**

**Inputs.** `ComplexMultiplicationAndExplicitReciprocity:CM.5`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`.

**Construction or proof.**

1. Import Gross’s lifting endomorphism filtration and the conductor-vs-norm coset classification.
2. At conductor zero maximize the lifting length; the ramified norm conductor gives v(λ)+v(D)−1, including wild ramification.
3. For positive conductor evaluate the local coset-volume factors; keep the unit-norm support and omitted diagonal.

**Acceptance.**

- Use the exact place, support, different and original/nearby-j hypotheses; the untwisted, zero-index and self-intersection shortcuts are invalid.

**Lean correspondence.** The actual CM points, nearby coherent quaternion algebra, arithmetic Hodge/Green divisors and local intersection/ramification operations, related to the target’s extended Schwartz and Weil data.

`colmez_rev_corrected_cm_multiplicity_at_split` — omitted; actual source carrier not written.

**Sources.**

- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), published Annals 187 (2018), §8.3, proof of Lemma 8.7, p. 618 (correcting [YZZ13, Lemma 8.6] and [Zha01, Lemma 5.5.2]).

### Marked Green height characterization

`GrossZagierAndArithmeticHeights:GZ.7/classical-height-green-characterization` · theorem · `gz86_height_green_characterization`

Fix x₀ ≠ y₀ in S and put G(x, y) = ⟨(x) − (x₀), (y) − (y₀)⟩ (x ≠ y₀, y ≠ x₀, x ≠ y). Then ⟨a, b⟩ = Σ_{i,j} n_i m_j G(x_i, y_j) for a = Σ n_i(x_i), b = Σ m_j(y_j) (at least if y₀ ∉ |a|, x₀ ∉ |b|). Conversely any G such that for fixed x the function y ↦ G(x, y) is continuous and harmonic on S ∖ {x, x₀} with logarithmic singularities of residue +1 at y = x and −1 at y = x₀ (g − C log|ρ|² continuous near the point, ρ a local parameter), and symmetrically in x, defines by (2.2) a symbol satisfying (2.1); G is determined up to an additive constant, fixed e.g. by G(x₀, y) = 0 for one y. For S = X₀(N)(ℂ), N > 1, x₀ = ∞, y₀ = 0 this means a function G on 𝔥 × 𝔥 with (2.3a) G(γz, γ′z′) = G(z, z′) for γ, γ′ ∈ Γ₀(N); (b) G continuous and harmonic for z ∉ Γ₀(N)z′; (c) G = e_z log|z − z′|² + O(1) as z′ → z, e_z the order of the stabilizer of z in Γ₀(N); (d) G = 4πy′ + O(1) as z′ = x′ + iy′ → ∞ and O(1) as z′ → any other cusp; G = 4πy/(N|z|²) + O(1) as z → 0 and O(1) as z → any other cusp (local parameters (z′ − z)^{e_z}(1 + O(z′ − z)), e^{2πiz}, e^{−2πi/Nz}).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H11**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Construction or proof.**

1. Apply the principal-divisor law to c=(z)−∞ and d=(z′)−0.
2. The difference of two candidate kernels is a smooth harmonic function on the compact curve, hence constant; the marked cusp normalization fixes it.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_height_green_characterization` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.2), (2.3), p. 237.

### Classical resolvent kernel

`GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel` · definition · `classicalResolvent`

Let Γ be the effective image of Γ₀(N) in PSL₂(ℤ). For upper-half-plane points z,z′ in distinct Γ-orbits and Re(s)>1, define G_{N,s}(z,z′)=Σ_{γ∈Γ} −2Q_{s−1}(1+|z−γz′|²/(2 Im(z) Im(γz′))). The sum converges locally uniformly off the orbit diagonal and is holomorphic in s there. It is invariant separately in both points and satisfies Δ_z G=Δ_z′ G=s(s−1)G. Its continuation and Laurent finite part are imported from AS.2/AS.4; summing over SL₂ without removing ±1 would double the kernel.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `AutomorphicSpectralTheory:AS.2`, `AutomorphicSpectralTheory:AS.4`.

**Construction or proof.**

1. Import the Legendre kernel and its Laplacian identity from AS.2.
2. Sum over PSL₂ representatives; off the orbit diagonal, the Re(s)>1 estimates give locally uniform convergence and allow differentiating.

**Uses.**

- `Gross–Zagier 1986 Chapter II, §2, (2.10)–(2.12), p. 239`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `classicalResolvent` (constructor; algebraic-fragment): Σ_{γ∈Γ₀(N)⊂PSL₂(ℤ)} −2Q_{s−1}(1+|z−γz′|²/(2 Im z Im γz′)); z′ off the orbit of z, Re s>1.
- `classicalResolvent_invariant` (relation; omitted; actual source carrier not written): Separately Γ₀(N)-invariant in z,z′.
- `classicalResolvent_laplacian` (projection; omitted; actual source carrier not written): Δ_zG=Δ_z′G=s(s−1)G.
- `classicalResolvent_converges` (characterisation; omitted; actual source carrier not written): The series converges locally uniformly off the orbit diagonal in Re s>1.

**Mathematical unit tests.**

- `classicalResolvent_orbit_diagonal` (non-example; fragment-example): z′=γz is outside the unregularized kernel domain.
- `classicalResolvent_sl2_double_count` (non-example; fragment-example): Summing over SL₂ representatives without quotienting ±1 doubles G and its residue.
- `classicalResolvent_residue_sign` (computation; fragment-example): For N=2, κ_N=−4, using [SL₂(ℤ):Γ₀(2)]=3.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`TauCeti.GrossZagier.AlgebraicFragments.classicalResolvent` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.10)–(2.12), p. 239.

### Resolvent residue

`GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-residue` · theorem · `gz86_resolvent_residue`

(Quoted from Hejhal [20].) G_{N,s}(z, z′) extends meromorphically in s to a neighbourhood of s = 1 with a simple pole at s = 1 of residue κ_N = −12/[SL₂(ℤ) : Γ₀(N)] = −12 N⁻¹ ∏_{p|N} (1 + 1/p)⁻¹, independent of z, z′. Consequently lim_{s→1}[G_{N,s} − κ_N/(s−1)] is not harmonic: its Laplacian is κ_N ≠ 0.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel`, `AutomorphicSpectralTheory:AS.2`.

**Construction or proof.**

1. Use the spectral constant-eigenfunction term of the resolvent continuation.
2. Its residue is κ_N=−12/[SL₂(ℤ):Γ₀(N)] and ΔG_N^0=κ_N.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_resolvent_residue` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.13), p. 239.

### Resolvent cusp expansion

`GrossZagierAndArithmeticHeights:GZ.7/classical-cusp-expansion` · theorem · `gz86_cusp_expansion`

(Quoted from Hejhal [20], (6.5); Fourier development in z.) G_{N,s}(z, z′) = −(4π/(2s − 1)) E_N(z′, s) y^{1−s} + O(e^{−y}) as y = Im z → ∞; at any other cusp G_{N,s}(z, z′) = α(s) Y^{1−s} + O(e^{−Y}), Y = Im(γz) for γ ∈ SL₂(ℝ) carrying the cusp to ∞.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-residue`, `AutomorphicSpectralTheory:AS.2`.

**Construction or proof.**

1. Insert the Fourier expansion of the cusp Eisenstein series into the resolvent.
2. Separate the identity/stabilizer term; continue the remainder and its constant term to s=1.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_cusp_expansion` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.19), p. 240.

### Marked modular Green kernel

`GrossZagierAndArithmeticHeights:GZ.7/classical-marked-green-kernel` · construction · `markedModularGreen`

Let N > 1. G(z, z′) = lim_{s→1}[G_{N,s}(z, z′) + 4πE_N(w_N z, s) + 4πE_N(z′, s) + κ_N/(s − 1)] + C with C = 2κ_N − λ_N (λ_N as in The constant λ_N (2.21)). It satisfies (2.3a)–(2.3d) (Green's-function description of the height symbol (2.2), (2.3)), tends to 0 as z → ∞, and G(z, z′) = G(w_N z′, w_N z) (2.20); the pole cancels since the residues are κ_N − κ_N − κ_N + κ_N.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H11**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-height-green-characterization`, `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-residue`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cusp-expansion`.

**Construction or proof.**

1. Cancel the four residues κ−κ−κ+κ.
2. Check the marked squared-log singularities and harmonicity; choose C=2κ_N−λ_N to obtain the zero limit at ∞.

**Uses.**

- `Gross–Zagier 1986 Chapter II, §2, (2.15), (2.20), pp. 239–241`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `markedModularGreen` (constructor; algebraic-fragment): The constant Laurent coefficient of G_N,s+4πE_N(w_Nz,s)+4πE_N(z′,s)+κ_N/(s−1), plus 2κ_N−λ_N.
- `markedModularGreen_cusp_zero` (simp; omitted; actual source carrier not written): The value tends to zero as z→∞ with z′ fixed.
- `markedModularGreen_singularities` (characterisation; omitted; actual source carrier not written): Harmonic away from marked points and diagonal, with the stated squared-log singularities.
- `markedModularGreen_fricke` (relation; omitted; actual source carrier not written): G(z,z′)=G(w_Nz′,w_Nz).

**Mathematical unit tests.**

- `markedModularGreen_four_residues` (computation; fragment-example): The four residues sum κ−κ−κ+κ=0.
- `markedModularGreen_plain_finite_part` (non-example; fragment-example): Subtracting only κ/(s−1) leaves Laplacian κ rather than zero.
- `markedModularGreen_level_one` (non-example; fragment-example): N=1 makes 0 and ∞ coincide and does not satisfy the two-marked-point construction.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`TauCeti.GrossZagier.AlgebraicFragments.markedModularGreen` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.15), (2.20), pp. 239–241.

### Modular Green constant

`GrossZagierAndArithmeticHeights:GZ.7/classical-green-constant` · theorem · `gz86_green_constant`

For N > 1: lim_{s→1}[4πE_N(w_N z, s) + κ_N/(s−1)] = κ_N log y + λ_N + O(e^{−y}) (y = Im z → ∞), with λ_N = lim_{s→1}[4πN^{−s}φ(s) ∏_{p|N} (1 − p^{−2s+1})/(1 − p^{−2s}) + κ_N/(s−1)] = κ_N[log N + 2 log 2 − 2γ + 2(ζ′/ζ)(2) − 2Σ_{p|N} p log p/(p² − 1)], γ Euler's constant; also lim_{s→1}[4πE_N(z′, s)(1 − y^{1−s}/(2s−1))] = −κ_N(log y + 2).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-marked-green-kernel`, `AutomorphicSpectralTheory:AS.2`.

**Construction or proof.**

1. Extract the constant term of the cusp Eisenstein series.
2. Its Γ and quadratic Euler-factor logarithmic derivatives give the stated λ_N and fix the additive Green constant.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_green_constant` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.21), p. 241.

### Archimedean modular height formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-archimedean-height` · theorem · `gz86_archimedean_height`

Let N > 1 and x, x′ distinct non-cuspidal points of X₀(N)(ℂ), represented by z, z′ ∈ 𝔥. Then ⟨(x) − (∞), (x′) − (0)⟩_ℂ = lim_{s→1}[G_{N,s}(z, z′) + 4πE_N(w_N z, s) + 4πE_N(z′, s) + κ_N/(s − 1)] − λ_N + 2κ_N, with G_{N,s}, E_N, κ_N, λ_N as in (2.10), (2.14), (2.13), (2.21).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H11**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol`, `GrossZagierAndArithmeticHeights:GZ.7/classical-marked-green-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-green-constant`.

**Construction or proof.**

1. Contract the marked Green kernel with the disjoint degree-zero divisors.
2. The Eisenstein and scalar terms disappear by degree zero; compare with the squared-norm local symbol.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_archimedean_height` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.22) Proposition, p. 241.

### Hecke kernel action

`GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-kernel-action` · theorem · `gz86_hecke_kernel_action`

For m ≥ 1, (m, N) = 1: T_m acts on constants by σ₁(m) = #{γ ∈ Γ\R_N : det γ = m}, on E_N(z′, s) by m^s σ_{1−2s}(m) = m^s Σ_{d|m} d^{1−2s}, and G_{N,s}(z, z′)|_{z′} T_m = Σ_{γ ∈ R_N/{±1}, det γ = m} g_s(z, γz′). Since T_m((0)) = σ₁(m)(0), T_m((x′) − (0)) = Σ_{γ ∈ Γ\R_N, det γ = m} ((γx′) − (0)), hence ⟨(x) − (∞), T_m((x′) − (0))⟩_ℂ = Σ_{γ ∈ Γ\R_N, det γ = m} G(z, γz′). [Corrected: the paper justifies this by 'T_m maps each cusp to itself' (p. 241), which is false for general N; only T_m((0)) = σ₁(m)(0) and T_m((∞)) = σ₁(m)(∞) are needed and true.]

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel`, `ModularCurvesPartII:R14.5`.

**Construction or proof.**

1. Reindex determinant-m matrices as the usual prime-to-N Hecke cosets.
2. Use invariance of the resolvent and the Eisenstein Hecke eigenvalue σ₁(m).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`TauCeti.GrossZagier.AlgebraicFragments.gz86_hecke_kernel_action` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, pp. 241–242.

### Hecke Green kernel

`GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-green-kernel` · definition · `heckeGreen`

For m ≥ 1, (m, N) = 1: G^m_{N,s}(z, z′) = ½ Σ_{a,b,c,d ∈ ℤ, N | c, ad − bc = m} g_s(z, (az′ + b)/(cz′ + d)) (= G_{N,s}(z, z′)|_{z′}T_m); G¹_{N,s} = G_{N,s}.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-kernel-action`.

**Construction or proof.**

1. Apply the prime-to-N correspondence to the second argument of the resolvent.
2. Pass from SL₂ matrices to their ±1 quotient, retaining the 1/2 convention.

**Uses.**

- `Gross–Zagier 1986 Chapter II, §2, (2.24), p. 242`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `heckeGreen` (constructor; algebraic-fragment): The determinant-m resolvent sum modulo ±1 for (m,N)=1.
- `heckeGreen_one` (simp; algebraic-fragment): G¹_N,s=G_N,s.
- `heckeGreen_hecke` (compatibility; omitted; actual source carrier not written): G^m_N,s=G_N,s|_{z′}T_m.
- `heckeGreen_fricke` (relation; omitted; actual source carrier not written): Simultaneous Atkin–Lehner invariance.

**Mathematical unit tests.**

- `heckeGreen_m_one` (compatibility; fragment-example): The identity correspondence returns the original kernel.
- `heckeGreen_sign_quotient` (non-example; fragment-example): The factor 1/2 in the matrix sum is indispensable.
- `heckeGreen_cusp_degree` (computation; fragment-example): For prime ℓ∤N the constant Hecke eigenvalue is ℓ+1, rather than 1.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`TauCeti.GrossZagier.AlgebraicFragments.heckeGreen` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.24), p. 242.

### Hecke archimedean height formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-archimedean-height` · theorem · `gz86_hecke_archimedean_height`

Let N > 1, m ≥ 1, (m, N) = 1, x, x′ ∈ X₀(N)(ℂ) non-cuspidal with x ∉ T_m x′, represented by z, z′. Then ⟨(x) − (∞), T_m((x′) − (0))⟩_ℂ = lim_{s→1}[G^m_{N,s}(z, z′) + 4πσ₁(m)E_N(w_N z, s) + 4πm^s σ_{1−2s}(m)E_N(z′, s) + σ₁(m)κ_N/(s − 1)] − σ₁(m)λ_N + 2σ₁(m)κ_N, σ_ν(m) = Σ_{d|m} d^ν.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H11**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-archimedean-height`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-green-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness`.

**Construction or proof.**

1. Use the disjointness criterion and the Hecke kernel action.
2. Contract with c and T_m d^σ, retaining the σ₁(m) cusp terms.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_hecke_archimedean_height` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.23) Proposition, p. 242.

### Atkin–Lehner kernel invariance

`GrossZagierAndArithmeticHeights:GZ.7/classical-atkin-lehner-invariance` · theorem · `gz86_atkin_lehner_invariance`

For every d ‖ N: G^m_{N,s}(w_d z, w_d z′) = G^m_{N,s}(z, z′) (in particular for m = 1), because g_s(γz, γz′) = g_s(z, z′) for γ ∈ SL₂(ℝ) and w_d normalises {γ ∈ R_N : det γ = m}; compatible with the invariance of the height pairing under automorphisms.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-green-kernel`, `ModularCurvesPartII:R14.2`.

**Construction or proof.**

1. Conjugate the determinant-m matrix set by the chosen Atkin–Lehner involution.
2. The reindexing preserves the kernel and both CM inputs.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_atkin_lehner_invariance` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §2, (2.25), p. 242.

### CM kernel invariants

`GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants` · definition · `cmKernelInvariant`

Standing notation (Chap. I §3, restated p. 233): K imaginary quadratic, discriminant D, 𝒪 = 𝒪_K, (D, N) = 1, D odd (hence squarefree, D ≡ 1 mod 4), D ≡ square (mod 4N) (all p | N split in K); H = Hilbert class field, Cl_K ≅ Gal(H/K); u = #𝒪^×/2; t = number of prime factors of D; s = number of prime factors of N; Γ = Γ₀(N) ⊂ PSL₂(ℤ); 𝔥 = upper half-plane; R_N = (ℤ ℤ; Nℤ ℤ); m ≥ 1 with (m, N) = 1; √D = i√|D|. For m ≥ 1, (m, N) = 1, 𝒜 ∈ Cl_K with r_𝒜(m) = 0 (r_𝒜(k) = number of integral ideals of norm k in 𝒜), and τ_{𝒜ᵢ,𝔫} as in the referenced classical source result 61: the values G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) with 𝒜₁𝒜₂⁻¹ = 𝒜 (3.1); γ^m_{N,s}(𝒜; 𝔅) = Σ_{𝒜₁,𝒜₂ ∈ Cl_K, 𝒜₁𝒜₂⁻¹ = 𝒜, 𝒜₁𝒜₂[𝔫]⁻¹ = 𝔅} G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) (3.2); γ^m_{N,s}(𝒜) = Σ_{𝒜₁𝒜₂⁻¹ = 𝒜} G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) = Σ_{𝔅 ∈ Cl_K} γ^m_{N,s}(𝒜; 𝔅) (3.3). Because σ_𝒜 maps τ_{𝒜₁,𝔫} to τ_{𝒜₁𝒜⁻¹,𝔫} and Gal(H/K) permutes the archimedean places of H simply transitively, (3.3) with Proposition (2.23) computes Σ_{v|∞} ⟨c, T_m d^σ⟩_v (c = (x) − (∞), d = (x) − (0)); r_𝒜(m) = 0 is needed for (3.1) to be defined (x ∉ T_m x^σ).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-green-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Construction or proof.**

1. Form the finite class-pair sums of the off-diagonal Hecke kernel.
2. Apply ideal change and Atkin–Lehner reindexing to prove that the choice of norm-N ideal does not affect them.

**Uses.**

- `Gross–Zagier 1986 Chapter II, §3, (3.1)–(3.3), pp. 242–243`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `cmKernelInvariant` (constructor; algebraic-fragment): The class-pair sums γ^m_N,s(A;B) and their B-sum γ^m_N,s(A), with r_A(m)=0.
- `cmKernelInvariant_sum_genus` (projection; algebraic-fragment): Σ_B γ(A;B)=γ(A).
- `cmKernelInvariant_ideal_independent` (extensionality; algebraic-fragment): Changing the primitive norm-N ideal leaves γ(A;B) unchanged.
- `cmKernelInvariant_empty` (simp; algebraic-fragment): γ(A;B)=0 unless {A}={B𝔫}.

**Mathematical unit tests.**

- `cmKernelInvariant_prime_D` (computation; fragment-example): For prime |D| each nonempty refined sum has one class pair.
- `cmKernelInvariant_wrong_genus` (degenerate; fragment-example): A wrong genus has an empty sum.
- `cmKernelInvariant_diagonal` (non-example; fragment-example): If r_A(m)>0, use the diagonal finite-part kernel instead of this off-diagonal definition.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`TauCeti.GrossZagier.AlgebraicFragments.cmKernelInvariant` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.1)–(3.3), pp. 242–243.

### CM genus-orbit count

`GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits` · theorem · `gz86_cm_genus_orbits`

(3.1) depends on 𝔫, but γ^m_{N,s}(𝒜; 𝔅) does not: w_d (d ‖ N) replaces (𝒜₁, 𝒜₂, 𝔫) by (𝒜₁[𝔡]⁻¹, 𝒜₂[𝔡]⁻¹, 𝔫𝔡⁻¹𝔡̄) (Actions of c, Gal(H/K) and W on Heegner points), leaving 𝒜₁𝒜₂⁻¹ and 𝒜₁𝒜₂[𝔫]⁻¹ unchanged, and G^m_{N,s} is w_d-invariant (2.25). The sum (3.2) has 2^{t−1} terms if {𝒜} = {𝔅𝔫} and is empty otherwise ({𝒜} = genus = class of 𝒜 in Cl_K/Cl_K² ≅ (ℤ/2ℤ)^{t−1}); all 𝔫 of norm N lie in one genus; if D is prime (|Cl_K| odd) the sum has one term.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants`, `AnalyticNumberTheory:AN.4`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Construction or proof.**

1. Use the genus quotient of the ideal-class group to classify admissible pairs.
2. Fix A₁A₂⁻¹ = A and A₁A₂[𝔫]⁻¹ = B. Substitution gives A₂² = B[𝔫]A⁻¹. A nonempty fibre of squaring is a torsor under Cl(K)[2], of cardinality 2^(t−1); it is not a fibre of the genus quotient, whose cardinality is h/2^(t−1).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_cm_genus_orbits` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §3, p. 243.

### Hyperbolic norm parameter

`GrossZagierAndArithmeticHeights:GZ.7/classical-hyperbolic-norm-parameter` · theorem · `gz86_hyperbolic_norm_parameter`

Let τ₁, τ₂ be Heegner points with the same 𝔫, roots of A_iτ_i² + B_iτ_i + C_i = 0 as in (1.4) with the same β. For γ = (a b; c d) ∈ R_N with det γ = m > 0: g_s(γτ₁, τ₂) = −2Q_{s−1}(1 + |γτ₁ − τ₂|²/(2 Im(γτ₁) Im τ₂)) = −2Q_{s−1}(1 + 2nN/(|D| det γ)) with n = (A₁A₂/N)|cτ₁τ₂ + dτ₂ − aτ₁ − b|² (3.4), and n = (1/N)[c²C₁C₂ + ad(D − B₁B₂)/2 − bc(D + B₁B₂)/2 + a²C₁A₂ + d²A₁C₂ − cdB₁C₂ + acC₁B₂ + b²A₁A₂ + bdA₁B₂ − abB₁A₂] ∈ ℤ (3.5, corrected; see PAPER-GROSS-ZAGIER-86/E4). Hence G^m_{N,s}(τ₁, τ₂) = −2 Σ_{n≥1} ρ^m(n) Q_{s−1}(1 + 2nN/(m|D|)), ρ^m(n) = #{γ ∈ R_N/{±1} : det γ = m, n(γ) = n} (n ≥ 1 when r_{𝒜₁𝒜₂⁻¹}(m) = 0). Example N = 1, D = −4, τ₁ = τ₂ = i: n = a² + b² + c² + d² − 2(ad − bc), (a − d)² + (b + c)² = n, (a + d)² + (b − c)² = n + 4m.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants`, `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`.

**Construction or proof.**

1. Express the hyperbolic distance invariant by the norm of the corresponding quadratic pair.
2. Check both positive norm contributions and the determinant relation before substituting in Q_(s−1).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`TauCeti.GrossZagier.AlgebraicFragments.gz86_hyperbolic_norm_parameter` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.4), (3.5), p. 244.

### Quadratic-pair representation count

`GrossZagierAndArithmeticHeights:GZ.7/classical-pair-count` · theorem · `gz86_pair_count`

Let 𝒜₁, 𝒜₂ ∈ Cl_K, 𝔫 primitive of norm N, 𝔞ᵢ ∈ 𝒜ᵢ integral with 𝔫 | 𝔞ᵢ, N(𝔞ᵢ) = Aᵢ, and — corrected hypothesis, see PAPER-GROSS-ZAGIER-86/E5 — 𝔞₁, 𝔞₂ prime to D; τ_{𝒜ᵢ,𝔫} the roots attached to 𝔞ᵢ by (1.4)–(1.5). Then for m ∈ ℕ (with (m, N) = 1) and r_{𝒜₁𝒜₂⁻¹}(m) = 0: G^m_{N,s}(τ_{𝒜₁,𝔫}, τ_{𝒜₂,𝔫}) = −2 Σ_{n≥1} ρ^m(n) Q_{s−1}(1 + 2nN/(m|D|)), ρ^m(n) = ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = #{(α, β) ∈ (𝔞₁⁻¹𝔞̄₂⁻¹ × 𝔞₁⁻¹𝔞₂⁻¹𝔫)/{±1} : N(α) = (Nn + m|D|)/(A₁A₂), N(β) = Nn/(A₁A₂), A₁A₂α ≡ A₁A₂β (mod 𝔡)}, 𝔡 = (√D) the different. The bijection is γ ↦ (α, β), α = cτ₁τ̄₂ + dτ̄₂ − aτ₁ − b, β = cτ₁τ₂ + dτ₂ − aτ₁ − b (3.6), with α ∈ 𝔞₁⁻¹𝔞̄₂⁻¹, β ∈ 𝔞₁⁻¹𝔞₂⁻¹𝔫 (3.7), l = A₁A₂N(α), n = N⁻¹A₁A₂N(β) ∈ ℤ (3.8), l − Nn = |D| det γ (3.9), A₁A₂α ≡ A₁A₂β (mod 𝔡) (3.10); the inverse is cτ₁ + d = (A₂/√D)(β − α), aτ₁ + b = (A₂/√D)(τ̄₂β − τ₂α). (r_{𝒜₁𝒜₂⁻¹}(m) = 0 ensures n > 0.)

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-hyperbolic-norm-parameter`, `AnalyticNumberTheory:AN.4`.

**Construction or proof.**

1. Pass from lattice pairs to integral ideal pairs and their generators.
2. Separate the unit orbits from the ramified congruence choices.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_pair_count` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.6)–(3.11) Proposition, pp. 244–245.

### Ramified-congruence pair count

`GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-congruence-count` · theorem · `gz86_ramified_congruence_count`

If n ≡ 0 (mod D) (hypotheses of Proposition (3.11): ρ^m as a count of pairs (α, β)): ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = ½ #{α ∈ 𝔞₁⁻¹𝔞̄₂⁻¹ : N(α) = l/(A₁A₂)} · #{β ∈ 𝔞₁⁻¹𝔞₂⁻¹𝔫 : N(β) = Nn/(A₁A₂)} = 2u² r_{𝒜₁𝒜₂⁻¹}(l) r_{𝒜₁𝒜₂[𝔫]⁻¹}(n), l = Nn + m|D|, u = ½#𝒪^×.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-pair-count`, `AnalyticNumberTheory:AN.4`.

**Construction or proof.**

1. At each l|D compare the two congruence classes of generators.
2. A factor 2 occurs exactly when l divides the relevant norm index; multiply the independent local counts.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_ramified_congruence_count` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.12), p. 246.

### Prime-discriminant pair count

`GrossZagierAndArithmeticHeights:GZ.7/classical-prime-discriminant-count` · theorem · `gz86_prime_discriminant_count`

If |D| is prime (hypotheses of Proposition (3.11): ρ^m as a count of pairs (α, β)): ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = u² r_{𝒜₁𝒜₂⁻¹}(nN + m|D|) r_{𝒜₁𝒜₂[𝔫]⁻¹}(n) × (1 if D ∤ n, 2 if D | n); for D ∤ n exactly one of (α, β), (α, −β) satisfies the congruence (a quadratic residue mod D has exactly two square roots).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-congruence-count`.

**Construction or proof.**

1. Specialize the ramified-congruence count to a prime discriminant.
2. Use the single genus and retain the exceptional u=3 unit factor.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_prime_discriminant_count` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.13), p. 246.

### Genus pair count

`GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count` · theorem · `gz86_genus_pair_count`

D arbitrary (standing hypotheses), 𝒜, 𝔅 ∈ Cl_K, r_𝒜(m) = 0: Σ_{𝒜₁,𝒜₂ ∈ Cl_K, 𝒜₁𝒜₂⁻¹ = 𝒜, 𝒜₁𝒜₂[𝔫]⁻¹ = 𝔅} ρ^m_{𝒜₁,𝒜₂,𝔫}(n) = u² δ(n) r_𝒜(nN + m|D|) r_𝔅(n) if {𝒜} = {𝔅𝔫}, and 0 otherwise, where δ(n) = ∏_{p|(n,D)} 2 (3.15) and {𝒜}, {𝔅𝔫} are the genera of 𝒜 and 𝔅[𝔫]. Proof: the other terms come from 𝔞ᵢ ↦ 𝔞ᵢ𝔠 with 𝔠² = (γ₀), (α, β) ↦ (α/N(𝔠), β/γ₀); the 2^{t−1} classes [𝔠] ∈ Cl_K[2] correspond to ±r (mod D) with r² ≡ 1 (mod D).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-congruence-count`, `AnalyticNumberTheory:AN.4`.

**Construction or proof.**

1. Apply the genus norm criterion to the ideal pair.
2. Combine the local congruence factors with the unit count; wrong-genus pairs contribute zero.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_genus_pair_count` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.14), (3.15), pp. 246–247.

### Genus kernel evaluation

`GrossZagierAndArithmeticHeights:GZ.7/classical-genus-kernel-evaluation` · theorem · `gz86_genus_kernel_evaluation`

Standing notation (Chap. I §3, restated p. 233): K imaginary quadratic, discriminant D, 𝒪 = 𝒪_K, (D, N) = 1, D odd (hence squarefree, D ≡ 1 mod 4), D ≡ square (mod 4N) (all p | N split in K); H = Hilbert class field, Cl_K ≅ Gal(H/K); u = #𝒪^×/2; t = number of prime factors of D; s = number of prime factors of N; Γ = Γ₀(N) ⊂ PSL₂(ℤ); 𝔥 = upper half-plane; R_N = (ℤ ℤ; Nℤ ℤ); m ≥ 1 with (m, N) = 1; √D = i√|D|. For m ≥ 1, (m, N) = 1, r_𝒜(m) = 0, s > 1: γ^m_{N,s}(𝒜; 𝔅) = −2u² Σ_{n≥1} δ(n) r_𝒜(nN + m|D|) r_𝔅(n) Q_{s−1}(1 + 2nN/(m|D|)) if {𝒜} = {𝔅𝔫}, and γ^m_{N,s}(𝒜; 𝔅) = 0 otherwise (δ(n) as in (3.15)).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count`.

**Construction or proof.**

1. Insert the quadratic-pair count in the locally uniformly convergent resolvent sum.
2. Regroup by the positive norm index and apply the source Legendre kernel argument.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_genus_kernel_evaluation` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.16) Proposition, p. 247.

### CM orbit kernel evaluation

`GrossZagierAndArithmeticHeights:GZ.7/classical-orbit-kernel-evaluation` · theorem · `gz86_orbit_kernel_evaluation`

Standing notation (Chap. I §3, restated p. 233): K imaginary quadratic, discriminant D, 𝒪 = 𝒪_K, (D, N) = 1, D odd (hence squarefree, D ≡ 1 mod 4), D ≡ square (mod 4N) (all p | N split in K); H = Hilbert class field, Cl_K ≅ Gal(H/K); u = #𝒪^×/2; t = number of prime factors of D; s = number of prime factors of N; Γ = Γ₀(N) ⊂ PSL₂(ℤ); 𝔥 = upper half-plane; R_N = (ℤ ℤ; Nℤ ℤ); m ≥ 1 with (m, N) = 1; √D = i√|D|. For m ≥ 1, (m, N) = 1, r_𝒜(m) = 0, s > 1: γ^m_{N,s}(𝒜) = −2u² Σ_{n≥1} δ(n) R_{{𝒜𝔫}}(n) r_𝒜(nN + m|D|) Q_{s−1}(1 + 2nN/(m|D|)), where R_{{𝒜𝔫}}(n) is the number of integral ideals of norm n in the genus {𝒜𝔫}.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-kernel-evaluation`.

**Construction or proof.**

1. Sum the refined genus formula over B.
2. Use the genus fibre count and finite class-group orthogonality.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_orbit_kernel_evaluation` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §3, (3.17) Corollary, p. 247.

### Genus-character filter

`GrossZagierAndArithmeticHeights:GZ.7/classical-genus-character-filter` · theorem · `gz86_genus_character_filter`

R_{{𝒜𝔫}}(n) is either R(n) or 0, where R(n) = Σ_{𝒜 ∈ Cl_K} r_𝒜(n) = Σ_{d|n} (D/d) is the number of integral ideals of norm n. If (n, D) = 1 then R_{{𝒜𝔫}}(n) may be replaced by R(n) in (3.17) (r_𝒜(nN + m|D|) ≠ 0 ⇒ (A(nN + m|D|)/p) = 1 ∀p | D ⇒ (AN·n/p) = 1 ∀p | D ⇒ R_{{𝒜𝔫}}(n) = R(n), A any integer prime to D that is a norm from the genus {𝒜}); in general δ(n)R_{{𝒜𝔫}}(n)r_𝒜(nN + m|D|) may be replaced by ∏_{p|(n,D)} (1 + ε̂_p((nN + m|D|)/(nN))) · R(n) r_𝒜(nN + m|D|), where ε̂_p is the character of the group of norms of fractional ideals with ε̂_p(N𝔞) = 1 for 𝔞 principal and ε̂_p(n) = (n/p) for n ∈ ℤ, p ∤ n.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-kernel-evaluation`, `AnalyticNumberTheory:AN.4`.

**Construction or proof.**

1. Multiply by the genus character and sum over A.
2. Use quadratic character orthogonality and the class-independent term to obtain the displayed filter.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_genus_character_filter` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §3, p. 247.

### CM Eisenstein sum

`GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum` · theorem · `gz86_cm_eisenstein_sum`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Let E(z, s) = Σ_{γ ∈ Γ_∞\SL₂(ℤ)} Im(γz)^s be the weight-0 Eisenstein series of SL₂(ℤ) (Γ_∞ = ±(1 *; 0 1); this normalization is the one forced by κ_N in (2.13) and by the identity 2^s ζ(2s) E(τ_A, s) = u|D|^{s/2} ζ_K(A, s) used on pp. 248, 252), E_N(z, s) the Eisenstein series (2.14) of Γ₀(N) at ∞, w_N z = −1/(Nz), Re s > 1. Then Σ_{A∈Cl_K} E_N(w_N τ_{A,𝔫}, s) = Σ_{A∈Cl_K} E_N(τ_{A,𝔫}, s) = N^{−s} Π_{p|N}(1 − p^{−2s})^{−1} Σ_{d|N} (μ(d)/d^s) Σ_{A∈Cl_K} E((N/d) τ_{A,𝔫}, s). For each d | N the points (N/d)τ_{A,𝔫} again satisfy quadratic equations over ℤ of discriminant D, and the inner sum is independent of d and equals Σ_{A} E(τ_A, s), where τ_A ∈ 𝔥 is any root of a primitive form of discriminant D in the class A. Hence Σ_A E_N(τ_{A,𝔫}, s) = N^{−s} Π_{p|N}(1 + p^{−s})^{−1} Σ_A E(τ_A, s) (the combination used in the display at the top of p. 249).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `AutomorphicSpectralTheory:AS.2`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Construction or proof.**

1. Unfold the CM point evaluation of the Eisenstein series.
2. Regroup primitive lattice vectors by integral ideals and extract the quadratic zeta and gamma factors.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_cm_eisenstein_sum` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §4, (4.1) and the paragraph after it, p. 248.

### Disjoint archimedean CM formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-disjoint-archimedean-sum` · theorem · `gz86_disjoint_archimedean_sum`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Let x ∈ X₀(N) be a Heegner point for the full ring of integers of K, c = (x) − (∞), d = (x) − (0), σ ∈ Gal(H/K), m ∈ ℕ prime to N, and A ∈ Cl_K the ideal class corresponding to σ under the Artin isomorphism. Suppose m is not the norm of an integral ideal in A. Then ⟨c, T_m d^σ⟩_∞ = lim_{s→1} [γ^m_{N,s}(A) − h σ₁(m) κ_N/(s − 1)] + h κ_N [σ₁(m)(log(N/|D|) + 2 Σ_{p|N} log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_{d|m} d log(m/d²)], where γ^m_{N,s}(A) is the invariant (3.3) (evaluated in Corollary (3.17)), κ_N = −12/[SL₂(ℤ) : Γ₀(N)] = −12 N^{−1} Π_{p|N}(1 + 1/p)^{−1} (2.13), and L(s, ε) is the L-function of K.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H11**
- **H10**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-archimedean-height`, `GrossZagierAndArithmeticHeights:GZ.7/classical-orbit-kernel-evaluation`, `GrossZagierAndArithmeticHeights:GZ.2/classical-archimedean-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum`.

**Construction or proof.**

1. Insert the genus/orbit kernel formula and CM Eisenstein evaluation into the disjoint height formula.
2. Take the Laurent constant at s=1, retaining the cancelled pole and logarithmic derivative.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_disjoint_archimedean_sum` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, (4.2) Proposition, p. 249 (derivation pp. 248–249).

### Tangent-normalized CM height symbol

`GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol` · construction · `cmTangentHeight`

Let X be a curve over the number field H, v a place of H, and a, b divisors of degree 0 on X whose supports meet exactly in the point x. Let g be a uniformizing parameter at x (a function on X with ord_x(g) = 1). Define ⟨a, b⟩_v := lim_{y→x} {⟨a_y, b⟩_v − ord_x(a) ord_x(b) log|g(y)|_v}, where a_y is the divisor obtained from a by replacing every occurrence of x by a nearby point y not in the support of b, and ⟨·,·⟩_v on the right is Néron's local symbol of relatively prime divisors. The limit exists by the standard properties of local heights ([14] = Gross, 'Local heights on curves'). This node is the CM specialization of RP.0’s reusable tangent-symbol construction; it introduces no second general local-height machine.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `HeightsRationalPointsAndObstructions:RP.0`, `GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness`.

**Construction or proof.**

1. Specialize the reusable tangent-local-symbol construction to the common CM point and its multiplicity r_A(m).
2. Subtract that multiplicity times log|g|_v; changing g modifies only the displayed scalar term.

**Uses.**

- `Gross–Zagier 1986 Chapter II, §5, (5.1), pp. 249–250`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `cmTangentHeight` (constructor; algebraic-fragment): Specialize the imported tangent local symbol to c=(x)−∞ and T_m d^σ using the eta-normalized tangent; subtraction coefficient r_A(m).
- `cmTangentHeight_disjoint` (compatibility; algebraic-fragment): For r_A(m)=0 it is the ordinary Néron symbol.
- `cmTangentHeight_change` (relation; algebraic-fragment): Replacing g by g′ adds r_A(m)log|(g/g′)(x)|_v.
- `cmTangentHeight_global` (compatibility; omitted; actual source carrier not written): Its sum over v equals the global class pairing for one global tangent choice.

**Mathematical unit tests.**

- `cmTangentHeight_multiplicity` (characterisation; fragment-example): If x occurs twice in T_mx^σ subtract 2log|g|, not log|g|.
- `cmTangentHeight_root_unity` (compatibility; fragment-example): Multiplication of the tangent by μ₆ changes no local value.
- `cmTangentHeight_scaling_product` (non-example; fragment-example): A scalar α with |α|_v≠1 changes the individual place, although the global sum is unchanged.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`TauCeti.GrossZagier.AlgebraicFragments.cmTangentHeight` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.1), pp. 249–250.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter I, §9, p. 232; constructed in Chapter II, §5, pp. 249–252 and Chapter III, §8, pp. 262–264.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.3), p. 250.

### Tangent product formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-product-formula` · theorem · `gz86_tangent_product_formula`

In the setting of (5.1) Local symbol for divisors with a common point (tangent-vector symbol): if g′ is another uniformizing parameter at x and g/g′ has the value α at x, then ⟨a, b⟩′_v = ⟨a, b⟩_v + ord_x(a) ord_x(b) log|α|_v. Consequently ⟨a, b⟩_v depends only on the non-zero tangent vector ∂/∂t at x determined by ∂g/∂t = 1, is unchanged if ∂/∂t is multiplied by a root of unity (|α|_v = 1 for all v), and — g being a single global function — Σ_v ⟨a, b⟩_v is independent of g and (product formula) equals the global height pairing of the classes of a and b [14].

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol`, `HeightsRationalPointsAndObstructions:RP.0`.

**Construction or proof.**

1. Sum the tangent change at all places of H.
2. Apply the product formula to the single global scalar; do not assert that its individual local logs vanish.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`TauCeti.GrossZagier.AlgebraicFragments.gz86_tangent_product_formula` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.2) and the following paragraph, p. 250.

### Eta-normalized CM tangent

`GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent` · construction · `etaCMTangent`

ω := η⁴(z) dq/q = 2πi η⁴(z) dz (5.4). It is well defined on X₀(N) only up to a 6th root of unity (η⁴ has a multiplier of order 6), which by (5.2) Change of uniformizer; the sum of local symbols is the global pairing does not affect the local symbols. If x is not an elliptic point of X₀(N) (u = 1), ω is non-zero at x, the tangent vector ∂/∂t is taken dual to ω, and the uniformizing parameter g satisfies ω = (g + a₂g² + a₃g³ + …) dg/g near x. In general ω has order 1/u − 1 at x and g is normalized so that ω = (1/u)(g^{1/u} + higher degree terms) dg/g near x, i.e. ω = d(g^{1/u})·(1 + …) [corrected; the printed display omits the factor 1/u — see issue PAPER-GROSS-ZAGIER-86/E12].

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Construction or proof.**

1. Use Δ(dq/q)^⊗6, rather than assert that η⁴dq/q descends as a differential on the coarse curve.
2. In the orbifold parameter g=c^u(w−z)^u(1+o(1)), differentiate to obtain the necessary factor 1/u; sixth powers remove the branch ambiguity.

**Uses.**

- `Gross–Zagier 1986 Chapter II, §5, (5.4) and the two paragraphs after it, p. 250`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `etaCMTangent` (constructor; algebraic-fragment): The CM tangent class obtained from Δ(q)(dq/q)^⊗6, with g=(2πiη⁴(z)(w−z))^u(1+o(1)).
- `etaCMTangent_orbifold` (characterisation; algebraic-fragment): ω=(1/u)(g^(1/u)+higher terms)dg/g.
- `etaCMTangent_unit_index_one` (compatibility; algebraic-fragment): For u=1 the tangent is dual to ω.
- `etaCMTangent_ambiguity` (projection; algebraic-fragment): The only branch ambiguity is multiplication by μ₆, invisible to local heights.

**Mathematical unit tests.**

- `etaCMTangent_ordinary` (computation; fragment-example): For u=1, dg at x equals ω.
- `etaCMTangent_cubic_stabilizer` (non-example; fragment-example): For D=−3, u=3, omission of 1/3 in the orbifold formula introduces a spurious 3log|3|_v.
- `etaCMTangent_global_tensor` (characterisation; fragment-example): The sixth tensor power is defined over the ground field even when a branch of η⁴ is not.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`TauCeti.GrossZagier.AlgebraicFragments.etaCMTangent` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.4) and the two paragraphs after it, p. 250.

### Complex tangent asymptotic

`GrossZagierAndArithmeticHeights:GZ.7/classical-complex-tangent-asymptotic` · theorem · `gz86_complex_tangent_asymptotic`

Let v be a complex place of H (|·|_v = |·|² on ℂ), g as in (5.4) The differential ω = η⁴ dq/q and the normalized tangent vector at x (corrected normalization). Then log|g(y)|_v − u log|2πi η⁴(z)(w − z)|_v → 0 as y → x, where z, w ∈ 𝔥 map to x, y on X₀(N)(ℂ).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol`, `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`, `GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol`.

**Construction or proof.**

1. Expand the source local symbol in the uniformizer at the common CM point.
2. Compare its leading term with g=(2πiη⁴(z)(w−z))^u; retain the stabilizer multiplicity u.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_complex_tangent_asymptotic` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.5), p. 251.

### Diagonal archimedean CM formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-archimedean-height` · theorem · `gz86_diagonal_archimedean_height`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Let v be a complex place of H and z, z′ ∈ 𝔥 points mapping to x, x^σ. With R_N = {(a b; c d) ∈ M₂(ℤ) : N | c}, g_s(z, z′) = −2Q_{s−1}(1 + |z − z′|²/(2 Im z Im z′)) (2.9), κ_N, λ_N as in (2.13), (2.21): ⟨c, T_m d^σ⟩_v = lim_{s→1} [Σ_{γ ∈ R_N/±1, det γ = m, γz′ ≠ z} g_s(z, γz′) + 4πσ₁(m) E_N(w_N z, s) + u r_A(m) lim_{w→z} {g_s(z, w) − log|2πi η⁴(z)(w − z)|_v} + 4π m^s σ_{1−2s}(m) E_N(z′, s) + σ₁(m)κ_N/(s − 1)] − σ₁(m)(λ_N − 2κ_N) [printed '−σ₁(m)(λ_N + 2κ_N)'; see PAPER-GROSS-ZAGIER-86/E10]. The number of γ ∈ R_N/±1 of determinant m with γz′ = z is u r_A(m).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H11**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-complex-tangent-asymptotic`, `GrossZagierAndArithmeticHeights:GZ.7/classical-archimedean-height`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-green-kernel`.

**Construction or proof.**

1. Apply the preceding local asymptotic to each occurrence of x in T_mx^σ.
2. Combine the disjoint terms with r_A(m) copies of the tangent finite part.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_diagonal_archimedean_height` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.6), p. 251.

### Diagonal Green finite part

`GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-green-kernel` · definition · `diagonalHeckeGreen`

For all z, z′ ∈ 𝔥 (previously defined only for z ∉ T_m z′): G^m_{N,s}(z, z′) := Σ_{γ ∈ R_N/±1, det γ = m, γz′ ≠ z} g_s(z, γz′) + Σ_{γ ∈ R_N/±1, det γ = m, γz′ = z} lim_{w→z} (g_s(z, w) − log|2πi η(z)⁴ (z − w)|²). With this definition (5.6) is literally the formula of Proposition (2.23); the second sum equals a·g_s(z), a = #{γ ∈ R_N/±1 : det γ = m, γz′ = z} (= u r_A(m) for z, z′ over x, x^σ), g_s(z) the renormalized value Renormalized self-value g_s(z).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-green-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`.

**Construction or proof.**

1. Use the ordinary resolvent off T_m and define the diagonal term by its eta-normalized local finite part.
2. Count the determinant-m diagonal matrices modulo ±1 as u r_A(m).

**Uses.**

- `Gross–Zagier 1986 Chapter II, §5, (5.7) and the paragraph after it, p. 251`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `diagonalHeckeGreen` (constructor; algebraic-fragment): Use g_s off the determinant-m diagonal and its eta-normalized finite part on that diagonal.
- `diagonalHeckeGreen_off_diagonal` (compatibility; algebraic-fragment): Agrees with G^m_N,s off T_m.
- `diagonalHeckeGreen_diagonal_count` (projection; algebraic-fragment): For CM inputs the diagonal coefficient is u r_A(m).
- `diagonalHeckeGreen_laurent` (compatibility; algebraic-fragment): The extended kernel has the Laurent pole and tangent-height comparison of the disjoint case.

**Mathematical unit tests.**

- `diagonalHeckeGreen_no_hit` (compatibility; fragment-example): If r_A(m)=0 no finite-part term occurs.
- `diagonalHeckeGreen_hit_u` (computation; fragment-example): For D=−3, m=1 and σ=1, there are three stabilizer terms modulo ±1.
- `diagonalHeckeGreen_omit_self` (non-example; fragment-example): Deleting all diagonal terms loses u r_A(m)g_s(z), even though the remaining sum converges for Re s>1.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`TauCeti.GrossZagier.AlgebraicFragments.diagonalHeckeGreen` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §5, (5.7) and the paragraph after it, p. 251.

### Renormalized resolvent self-value

`GrossZagierAndArithmeticHeights:GZ.7/classical-renormalized-self-value` · theorem · `gz86_renormalized_self_value`

g_s(z) := lim_{w→z} (g_s(z, w) − log|2πi η(z)⁴ (z − w)|²) = −log|2π (z − z̄) η(z)⁴|² + 2 Γ′/Γ(s) − 2 Γ′/Γ(1).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-green-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-residue`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cusp-expansion`, `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`.

**Construction or proof.**

1. Subtract the universal diagonal singularity and use the cusp continuation to define the self value.
2. Extract its Laurent residue and eta constant; the unsubtracted diagonal sum is undefined.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_renormalized_self_value` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §5, p. 251.

### Self-value CM orbit sum

`GrossZagierAndArithmeticHeights:GZ.7/classical-self-value-orbit-sum` · theorem · `gz86_self_value_orbit_sum`

Σ_{A∈Cl_K} g_s(τ_A) = 2h[Γ′/Γ(s) + Γ′/Γ(1) − log 2π] + lim_{σ→1} [(2u/π)|D|^{σ/2} ζ_K(σ) − 2h/(σ − 1)] = 2h[Γ′/Γ(s) − log 2π + (L′/L)(1, ε) + ½ log|D|].

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-renormalized-self-value`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-kernel-evaluation`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum`.

**Construction or proof.**

1. Sum the renormalized self values over the CM orbit.
2. Use the ideal-pair calculation and CM Eisenstein evaluation on the diagonal contribution.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_self_value_orbit_sum` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, §5, first display, p. 252.

### Total archimedean CM formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-total-archimedean-formula` · theorem · `gz86_total_archimedean_formula`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Proposition (4.2) (Proposition (4.2): archimedean contribution when r_A(m) = 0) remains true when m is the norm of an ideal in A, provided that the local symbols ⟨c, T_m d^σ⟩_v (v | ∞) in the definition of ⟨c, T_m d^σ⟩_∞ are defined by (5.3) with the normalized uniformizer g of (5.4) The differential ω = η⁴ dq/q and the normalized tangent vector at x, and γ^m_{N,s}(A) is defined by (3.3) with G^m_{N,s} as in (5.7). This invariant is then γ^m_{N,s}(A) = (expression in Corollary (3.17)) + 2h u r_A(m) (Γ′/Γ(s) − log 2π + (L′/L)(1, ε) + ½ log|D|).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H11**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-disjoint-archimedean-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-archimedean-height`, `GrossZagierAndArithmeticHeights:GZ.7/classical-self-value-orbit-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-product-formula`.

**Construction or proof.**

1. Add the disjoint and diagonal formulas with their tangent asymptotics.
2. Use the global tangent product formula to eliminate dependence on the one global branch choice.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_total_archimedean_formula` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter II, (5.8) Proposition, p. 252.

### Degree-one CM intersection count

`GrossZagierAndArithmeticHeights:GZ.7/classical-degree-one-intersection` · theorem · `gz86_degree_one_intersection`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Let m = 1, v | p with p ∤ ND, and r_A(1) = 0 (σ ≠ 1, so x ≠ x^σ over H). Then ⟨(x) − (∞), (x^σ) − (0)⟩_v = ⟨c, d^σ⟩_v = −½ Σ_{n≥1} Card(Isom_{W/π^n}(x^σ, x)) log q_v. The sum is zero unless x and x^σ meet mod π; by Deuring's theory it is zero if p splits in K; otherwise p is inert (as p ∤ D) and log q_v = 2 log p.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height`, `HeegnerPointEulerSystems:HE.2`, `GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count`.

**Construction or proof.**

1. At good reduction identify degree-one diagram Hom pairs with isomorphisms.
2. Use the source deformation-length formula, quotienting precisely by ±1 and retaining larger stabilizers.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_degree_one_intersection` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, introduction, (0.4) and following paragraph, p. 253.

### Supersingular Eichler realization

`GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order` · theorem · `gz86_supersingular_eichler_order`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Let p be inert in K and p ∤ N (in the paper's illustration p ∤ ND, m = 1). The endomorphism ring R = End_{W/π}(x mod π) of the (supersingular) reduction of the Heegner diagram is an Eichler order of index (level) N in the definite quaternion algebra B over ℚ of discriminant p (ramified exactly at p and ∞), and Hom_{W/π}(x^σ, x) is isomorphic to the left R-module R𝔞 (𝔞 an ideal in the class A). The points x and x^σ meet mod π if and only if R𝔞 is principal; then Card(Isom_{W/π}(x^σ, x)) is the number of generators of R𝔞.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `HeegnerPointEulerSystems:HE.2`, `ComplexMultiplicationAndExplicitReciprocity:CM.5/supersingular-curve-versus-level-pair`.

**Construction or proof.**

1. Apply the supersingular reduction theorem for a chosen cyclic-isogeny diagram.
2. Its endomorphism order has level N in the definite quaternion algebra ramified at p and ∞.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_supersingular_eichler_order` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, introduction, p. 253.

### Inert quaternionic order model

`GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model` · construction · `inertOrderModel`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Let p be inert in K (p ∤ ND) and q a prime with pq ≡ −1 (mod D), i.e. −pq ≡ 1 (mod D) (printed: 'q ≡ −p (mod D)', which makes the lattice below an order only when p² ≡ 1 modulo every prime l | D; see the new issue on (0.5) reported with this review; either condition gives (q/l) = (−p/l) for all l | D); then (q) = 𝔮𝔮̄ splits in K and B = K + Kj with jα = ᾱj (α ∈ K) and j² = −pq is the definite quaternion algebra of discriminant p. For some place v | p the order R = End_{W/π}(x mod π) is R = {α + βj ∈ B : α ∈ 𝔡⁻¹, β ∈ 𝔡⁻¹𝔮⁻¹𝔫, α − β integral at all primes dividing 𝔡}, 𝔡 = (√D) the different of K and 𝔫 the primitive ideal of norm N attached to x. For 𝔞 an ideal in the class A: Hom_{W/π}(x^σ, x) ≅ R𝔞 = {α + βj : α ∈ 𝔡⁻¹𝔞, β ∈ 𝔡⁻¹𝔮⁻¹𝔫𝔞̄, α − β integral at 𝔡}. (With the printed q ≡ −p (mod D) the same statements hold after replacing the congruence 'α − β integral at 𝔡' by 'α − pβ integral at 𝔡'.)

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order`, `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Construction or proof.**

1. Choose q with pq≡−1 modulo D so that the ramified congruence lattice has integral reduced norms.
2. Identify the lattice and its local completions with the CM reduction order; multiplication on the right conjugates the β coefficient.

**Uses.**

- `Gross–Zagier 1986 Chapter III, introduction, (0.5), p. 253 (general version (9.2)–(9.3), p. 265)`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `inertOrderModel` (constructor; algebraic-fragment): The integral congruence lattice in (D,−pq), with pq≡−1 mod D, identified with the CM reduction order at a specified place.
- `inertOrderModel_norm` (projection; omitted; actual source carrier not written): N(α+βj)=Nα+pqNβ is integral on the lattice.
- `inertOrderModel_discriminant` (characterisation; omitted; actual source carrier not written): Reduced discriminant Np; locally Eichler away from p and maximal at p.
- `inertOrderModel_hom_ideal` (compatibility; algebraic-fragment): Right multiplication by 𝔞 conjugates the β coefficient by 𝔞̄.

**Mathematical unit tests.**

- `inertOrderModel_correct_q` (computation; fragment-example): D=−7,p=3,N=2 permits q=23, since −69≡1 mod7.
- `inertOrderModel_wrong_q` (non-example; fragment-example): q=11 satisfies q≡−p mod7 but gives nonintegral norms in the printed α≡β lattice; use pq≡−1.
- `inertOrderModel_conjugate_ideal` (characterisation; fragment-example): Multiplication (α+βj)𝔞 yields α𝔞+β𝔞̄j, not β𝔞j.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`TauCeti.GrossZagier.AlgebraicFragments.inertOrderModel` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, introduction, (0.5), p. 253 (general version (9.2)–(9.3), p. 265).

### Norm-one generator count

`GrossZagierAndArithmeticHeights:GZ.7/classical-norm-one-generators` · theorem · `gz86_norm_one_generators`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. In the setting of (0.5) Explicit model of B and of the order R, and R𝔞, R𝔞 is principal iff it contains b = α + βj with reduced norm Nb = Nα + pqNβ = N𝔞. If b is a generator, the ideals 𝔠 = (α)𝔡𝔞⁻¹ and 𝔠′ = (β)𝔡𝔮𝔫⁻¹𝔞̄⁻¹ are integral (0.6) and satisfy N𝔠 + pN·N𝔠′ = |D| (0.7). Putting n = pN𝔠′ and l = N𝔠 gives a solution of l + nN = |D| with n ≡ 0 (mod p) and r_A(l) ≠ 0; The converse requires actual generators α,β of the stated ideal pairs satisfying the defining lattice and congruence conditions of R𝔞; a numerical solution l+nN=|D| alone does not supply a generator. Count those admissible pairs to obtain their contribution to (0.4).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`.

**Construction or proof.**

1. Count actual α,β in the defining lattice of R𝔞, modulo simultaneous sign, satisfying the reduced-norm equation and the ramified congruences. The norms l,n and class conditions are necessary; retain the ideal-pair and congruence data in the converse.
2. The exceptional unit classes are counted with u=#O_K×/2, not #O_K×.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`TauCeti.GrossZagier.AlgebraicFragments.gz86_norm_one_generators` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, introduction, (0.6)–(0.7), p. 254.

### CM level reduction component

`GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component` · theorem · `gz86_level_reduction_component`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Suppose p | N (so p = 𝔭𝔭̄ splits and v divides exactly one of 𝔫, 𝔫̄, where O/𝔫 ≅ ℤ/Nℤ is the annihilator of ker φ). Then the sections x and x^σ reduce to ordinary points in the component 𝓕_{0,n} if v | 𝔫̄, and 𝓕_{n,0} if v | 𝔫 (n = ord_p N).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H11**

**Inputs.** `HeegnerPointEulerSystems:HE.2`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Construction or proof.**

1. Use the Deligne–Rapoport reduction and the ordinary CM level isogeny to identify the fibre component.
2. Compare the two cusp sections and the Hecke action on the same component.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_level_reduction_component` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, (3.1) Proposition, p. 256.

### CM component orthogonality

`GrossZagierAndArithmeticHeights:GZ.7/classical-component-orthogonality` · theorem · `gz86_component_orthogonality`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. One of the divisors c = (x) − (∞) and d^σ = (x^σ) − (0) (printed 'd = (x^σ) − (0)') has zero intersection with every fibral component 𝓕_{a,b} of X ⊗ A_v: when p | N (so v divides exactly one of 𝔫, 𝔫̄), c does if v | 𝔫 and d^σ does if v | 𝔫̄; when p ∤ N the special fibre is irreducible and both do.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H11**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component`, `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`.

**Construction or proof.**

1. Use the component intersection matrix and its fibre kernel.
2. The corrected divisor has zero pairing with the components; this is an intersection statement and does not require each CM section to be fixed by a torus action.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_component_orthogonality` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, (3.2) Corollary and proof, pp. 256–257.

### Finite CM intersection height

`GrossZagierAndArithmeticHeights:GZ.7/classical-finite-intersection-height` · theorem · `gz86_finite_intersection_height`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Assume m ≥ 1 is prime to N and r_A(m) = 0. Then ⟨c, T_m d^σ⟩_v = −(x · T_m x^σ) log q.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- **H11**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height`, `GrossZagierAndArithmeticHeights:GZ.7/classical-component-orthogonality`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`.

**Construction or proof.**

1. Apply the regular-model local-height theorem to c and T_m d^σ.
2. The CM component orthogonality removes the vertical correction and gives the explicit horizontal intersection formula.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_finite_intersection_height` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, (3.3) Proposition, p. 257 (announced as (0.2), p. 252).

### CM Hom intersection count

`GrossZagierAndArithmeticHeights:GZ.7/classical-hom-intersection-count` · theorem · `gz86_hom_intersection_count`

Standing notation (Ch. I §3, Ch. II): N > 1; K imaginary quadratic of discriminant D with D odd (hence squarefree, D ≡ 1 mod 4), (D, N) = 1 and D ≡ □ (mod 4N) (so every p | N splits in K); O = O_K, h = h_K, u = #O^×/2 (u = 1 unless D = −3, then u = 3), w = 2u; H the Hilbert class field; ε(n) = (D/n); x = (φ: E → E′) ∈ X₀(N)(H) a Heegner point of discriminant D (E, E′ with CM by O, ker φ ≅ O/𝔫 for the primitive ideal 𝔫 of norm N); c = (x) − (∞), d = (x) − (0); σ ∈ Gal(H/K) ↔ A ∈ Cl_K under the Artin isomorphism; m ≥ 1 with (m, N) = 1; T_m the m-th Hecke correspondence; r_A(m) = number of integral ideals of norm m in A; σ_ν(m) = Σ_{d|m} d^ν. Local notation (Ch. III): v a finite place of H over the prime p; A_v the ring of integers of H_v, π a uniformizer, q = q_v = p^f = #A_v/π; W the completion of the maximal unramified extension of A_v (π is prime in W), 𝔽 = W/π an algebraic closure of A_v/π; X the model of X₀(N) over ℤ of §1; x, x^σ the sections of X ⊗ A_v (or X ⊗ W) extending x, x^σ. Assume m is prime to N and r_A(m) = 0. Then (x · T_m x^σ) = ½ Σ_{n≥1} Card(Hom_{W/πⁿ}(x^σ, x)_{deg m}).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-isomorphism-intersection-count`, `HeegnerPointEulerSystems:HE.2`.

**Construction or proof.**

1. Use the imported Hecke deformation/isomorphism formula over W/π^n.
2. Regroup degree-m maps by ±1 and sum the lifting lengths.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_hom_intersection_count` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, (4.4) Proposition, p. 258 (announced as (0.3), p. 252; proved in §§5–6).

### Half Hom count

`GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count` · definition · `halfHomCount`

For sections y, x over W as in (2.1) Hom_S(y, x) between Γ₀(N)-diagrams, its degree: h_n(y, x)_{deg m} := ½ Card Hom_{W/πⁿ}(y, x)_{deg m}.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `AbelianSchemesAndArithmeticModuli:A6`, `HeegnerPointEulerSystems:HE.2`.

**Construction or proof.**

1. Fix actual integral cyclic-isogeny diagrams before taking Hom.
2. The sign involution on nonzero degree-m maps is free; its orbits define the half count.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §4, last sentence before §5, p. 258`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `halfHomCount` (constructor; algebraic-fragment): h_n(y,x)_m=(1/2)#Hom_{W/πⁿ}(y,x)_m for chosen integral cyclic-isogeny diagrams.
- `halfHomCount_sign_orbits` (characterisation; algebraic-fragment): For m>0 it counts the free ±1 orbits.
- `halfHomCount_degree_one` (compatibility; algebraic-fragment): Degree-one elements are diagram isomorphisms.
- `halfHomCount_reduction` (relation; algebraic-fragment): Reduction n+1→n injects the degree-m Hom sets; h_{n+1}≤h_n.

**Mathematical unit tests.**

- `halfHomCount_empty` (degenerate; fragment-example): An empty Hom degree fibre gives zero.
- `halfHomCount_two_isomorphisms` (computation; fragment-example): If the only degree-one maps are ±f then h_n=1.
- `halfHomCount_stabilizer` (non-example; fragment-example): With six isomorphisms the half count is 3; quotienting by all automorphisms instead gives 1 and changes the coarse intersection weight.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`TauCeti.GrossZagier.AlgebraicFragments.halfHomCount` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §4, last sentence before §5, p. 258.

### New CM homomorphisms

`GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set` · definition · `newCMHom`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). For non-cuspidal W-sections y, x of X and n ≥ 1, reduction Hom_W(y, x) → Hom_{W/πⁿ}(y, x) is injective (4.5); set Hom^{new}_{W/πⁿ}(y, x) := Hom_{W/πⁿ}(y, x) ∖ (image of Hom_W(y, x)) and Aut^{new}_{W/πⁿ}(x) := Aut_{W/πⁿ}(x) ∖ Aut_W(x). For the Heegner points x, x^σ and p non-split in K, under the identification Hom_{W/πⁿ}(x^σ, x) ≅ End_{W/πⁿ}(x)·𝔞 ⊂ B of (7.3)(2), whose image of Hom_W(x^σ, x) ≅ 𝔞 lies in K, an element b is new exactly when b ∉ K, i.e. b₋ ≠ 0.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `AbelianSchemesAndArithmeticModuli:A6`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Construction or proof.**

1. Embed the characteristic-zero Hom set into every Artinian reduction by rigidity.
2. Take its complement; at a nonsplit CM place new maps are exactly those with nonzero quaternionic anti-linear part.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §8, Lemma (8.2), p. 263 (Aut^{new}) and (8.4) with the following paragraph, p. 264 (Hom^{new}, and the reading b₋ ≠ 0); uses (4.5), p. 258`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `newCMHom` (constructor; algebraic-fragment): The complement of the injective image Hom_W in Hom_{W/πⁿ}, and analogously for Aut.
- `newCMHom_partition` (relation; algebraic-fragment): The full degree-m set is the disjoint union of liftable and new maps.
- `newCMHom_quaternion` (characterisation; algebraic-fragment): At a non-split CM place a map is new iff b₋≠0.
- `newCMHom_ordinary` (simp; algebraic-fragment): The new set is empty for canonical ordinary CM lifts.

**Mathematical unit tests.**

- `newCMHom_ordinary_empty` (degenerate; fragment-example): A split prime contributes no new CM maps.
- `newCMHom_cm_scalar` (non-example; fragment-example): An element of K is liftable and is excluded from every valuation sum.
- `newCMHom_nonzero_negative_part` (characterisation; fragment-example): b₋≠0 permits the norm valuation; b₋=0 has no finite lifting-length valuation.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`TauCeti.GrossZagier.AlgebraicFragments.newCMHom` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §8, Lemma (8.2), p. 263 (Aut^{new}) and (8.4) with the following paragraph, p. 264 (Hom^{new}, and the reading b₋ ≠ 0); uses (4.5), p. 258.

### Prime-to-p Hom decomposition

`GrossZagierAndArithmeticHeights:GZ.7/classical-prime-to-p-hom-count` · theorem · `gz86_prime_to_p_hom_count`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume p ∤ m. Every point y of the divisor T_m x^σ is a Heegner point over H̄ in the sense of Gross [13] (defined over the ring class field of its conductor, not in general over H), with End_{H̄}(y) = O_y an order in K of conductor dividing m. Each y is rational over W ⊗ ℚ_p and is the canonical lifting of its reduction. For every n ≥ 1, h_n(x^σ,x)_{deg m} = Σ_{y ∈ T_m x^σ} h_n(y,x)_{deg 1}. Reason: a degree-m isogeny f: x^σ → x over W/π^n is determined by its kernel, which lifts uniquely to an étale subgroup C of order m of x^σ over W, and f induces an isomorphism x^σ_C ≅ x over W/π^n.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `AbelianSchemesAndArithmeticModuli:A6`.

**Construction or proof.**

1. Separate the maps already lifting to W from the new maps.
2. For m prime to p, use the étale kernel to identify the prime-to-p degree fibres and their stabilizer count.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_prime_to_p_hom_count` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §5, (5.1), p. 258.

### Diagram isomorphism intersection count

`GrossZagierAndArithmeticHeights:GZ.7/classical-isomorphism-intersection-count` · theorem · `gz86_isomorphism_intersection_count`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Let x and y be W-sections of X which intersect properly (no common component) and reduce to regular, non-cuspidal points of the special fibre. Then (y·x) = Σ_{n≥1} h_n(y,x)_{deg 1} = Σ_{n≥1} ½·#Hom_{W/π^n}(y,x)_{deg 1}. This is a general fact, independent of y and x being Heegner points.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count`, `HeegnerPointEulerSystems:HE.2`.

**Construction or proof.**

1. Apply the local deformation length of a diagram isomorphism and sum over isomorphisms.
2. Divide by the correct sign/stabilizer factors; do not assert coarse Artinian Hom is independent of diagram choices.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_isomorphism_intersection_count` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §6, (6.1) Proposition, p. 259 (proof pp. 259–260, including (6.2)).

### Split CM intersection vanishing

`GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing` · theorem · `gz86_split_vanishing`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p splits in K and r_𝒜(m) = 0, then (x·T_m x^σ) = 0 at every place v | p (v ∤ N or v | N alike). Proof: Hom_{W/π^n}(x^σ,x) = Hom_W(x^σ,x) for all n ≥ 1, and this group has no element of degree m since r_𝒜(m) = 0.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Construction or proof.**

1. Use canonical ordinary CM lifting to show every reduced CM map lifts.
2. Thus the new-map part vanishes at split p; any tangent correction is dealt with separately.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_split_vanishing` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §7, (7.1) Proposition, p. 261.

### CM endomorphism congruence order

`GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order` · theorem · `gz86_endomorphism_congruence_order`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume p has a unique prime factor 𝔭 in K, and let R = End_{W/π}(x) ⊂ B = K + Kj as in (7.2). Then for all n ≥ 1: End_{W/π^n}(x) = {b ∈ R : D·N(b₋) ≡ 0 mod p·(N𝔭)^{n−1}}.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `ComplexMultiplicationAndExplicitReciprocity:CM.5`, `GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order`.

**Construction or proof.**

1. Import the CM deformation theorem giving the endomorphism congruence filtration.
2. Intersect its quaternionic filtration with the chosen reduction order to obtain End_(W/π^n)(x).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_endomorphism_congruence_order` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §7, (7.3) Proposition part 1), p. 262.

### CM Hom quaternion realization

`GrossZagierAndArithmeticHeights:GZ.7/classical-hom-quaternion-realization` · theorem · `gz86_hom_quaternion_realization`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume p non-split. For any ideal 𝔞 in the class 𝒜 there is an isomorphism Hom_{W/π^n}(x^σ,x) ≅ End_{W/π^n}(x)·𝔞 ⊂ B, compatible in n. If the isogeny ϕ: x^σ → x corresponds to b ∈ B, then deg ϕ = N(b)/N(𝔞). It rests on Serre's construction x^σ ≅ Hom_O(𝔞, x).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `AbelianSchemesAndArithmeticModuli:A6`.

**Construction or proof.**

1. Use the right ideal realizing Hom between the two CM reductions.
2. Intersect it with the endomorphism congruence filtration and check the norm/degree ratio N(b)/N(𝔞).

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_hom_quaternion_realization` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §7, (7.3) Proposition part 2), p. 262 (with (4.2), p. 257).

### Inert disjoint intersection formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection` · theorem · `gz86_inert_disjoint_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume r_𝒜(m) = 0, p inert in K, v | p (so v ∤ N), and 𝔞 ∈ 𝒜 prime to p (implicit; see PAPER-GROSS-ZAGIER-86/E21). Then q_v = p² and (x·T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞)} ½(1 + ord_p N(b₋)), with R = End_{W/π}(x). For p ∤ D, ord_p N(b₋) is always odd.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-intersection-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-quaternion-realization`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Construction or proof.**

1. Use the Hom realization and inert lifting length (ord_p N(b₋)+1)/2.
2. Sum only b₋≠0 and then divide by the ±1 action.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_inert_disjoint_intersection` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §7, (7.4) Corollary part 1), p. 262.

### Ramified disjoint intersection formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection` · theorem · `gz86_ramified_disjoint_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume r_𝒜(m) = 0, p ramified in K with prime 𝔭, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit; PAPER-GROSS-ZAGIER-86/E21). Then q_v = p^k with k the order of [𝔭] in Cl_K, and (x·T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞)} ord_p(D·N(b₋)).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-intersection-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-quaternion-realization`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Construction or proof.**

1. Use the ramified lifting length ord_p(D·N(b₋)), including the different contribution. The disjoint-support hypothesis excludes b₋=0, so this valuation is finite.
2. Sum the new maps and retain the residue degree and ramified local correction.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_ramified_disjoint_intersection` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §7, (7.4) Corollary part 2), p. 262.

### Tangent self-intersection number

`GrossZagierAndArithmeticHeights:GZ.7/classical-self-intersection-tangent` · definition · `cmSelfIntersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Suppose r_𝒜(m) ≠ 0, so c and T_m d^σ share the point x and ⟨c, T_m d^σ⟩_v is defined by Ch. II (5.1)/(5.3) using the tangent vector ∂/∂t at x. Here ∂/∂t is dual to ω = η⁴(q)dq/q when u = 1, is defined in general through the normalisation of the uniformiser g in Ch. II §5, read as ω = (1/u)(g^{1/u} + …)dg/g (printed without the factor 1/u; PAPER-GROSS-ZAGIER-86/E12), and is defined up to a 6th root of unity. Define (x·x) := ord_v(α), where α ∈ H_v^× is given (corrected reading) by ∂/∂t = α·(a basis of the free W-module T_x X). Printed: 'where α∂/∂t is a basis'; see PAPER-GROSS-ZAGIER-86/E16. With this convention the intersection formula (0.2), ⟨c, T_m d^σ⟩_v = −(x·T_m x^σ) log q_v, continues to hold.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol`, `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`, `GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height`.

**Construction or proof.**

1. Write ∂/∂t=αe with e an integral tangent basis.
2. The principal-divisor tangent law gives (x·x)=ord_v α and hence the negative local-height sign.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §8, (8.1), p. 263 (with Ch. II §5, (5.1)–(5.4), pp. 249–250)`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `cmSelfIntersection` (constructor; algebraic-fragment): ord_v(α) for tangent ∂/∂t=αe, e an integral tangent basis.
- `cmSelfIntersection_basis` (extensionality; algebraic-fragment): Replacing e by a unit multiple leaves ord_v(α) unchanged.
- `cmSelfIntersection_scale` (relation; algebraic-fragment): Scaling the tangent by a multiplies α by a and adds ord_v(a).
- `cmSelfIntersection_height` (compatibility; algebraic-fragment): The diagonal local height is minus this number times log q_v.

**Mathematical unit tests.**

- `cmSelfIntersection_integral_basis` (computation; fragment-example): A tangent basis has self-intersection zero.
- `cmSelfIntersection_uniformizer` (computation; fragment-example): The tangent πe has self-intersection 1.
- `cmSelfIntersection_reciprocal` (non-example; fragment-example): Defining α∂/∂t=e gives −1 for πe and reverses the local height sign.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`TauCeti.GrossZagier.AlgebraicFragments.cmSelfIntersection` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.1), p. 263 (with Ch. II §5, (5.1)–(5.4), pp. 249–250).

### New automorphism length

`GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length` · theorem · `gz86_new_automorphism_length`

For a chosen integral Γ₀(N)-diagram x in the smooth coarse locus, assume v∤N and u_x=#Aut_F(x)/2=1 (a non-elliptic point). With the eta-normalized cotangent of the tangent-symbol construction and α as in Chapter III (8.1), ord_v(α)=1/2 Σ_(n≥1)(#Aut_(W/π^n)(x)−#Aut_W(x))=1/2 Σ_(n≥1)#Aut^new_(W/π^n)(x). The sum is finite. Its value is zero exactly when the eta tangent is integral primitive, equivalently no new automorphisms occur at any level. Elliptic points and level primes use cmTensor_stabilizer_height with its nonzero tensor correction; this specialization makes no blanket assertion for them.

**Hypotheses.**

- W is the complete characteristic-zero DVR with uniformizer π and normalized ord_v; x is an actual chosen integral cyclic N-isogeny diagram, with smooth section in the coarse model.
- v∤N and the effective stabilizer u_x equals one; the differential is the specified eta-normalized branch.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-self-intersection-tangent`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`, `HeegnerPointEulerSystems:HE.2`, `GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height`.

**Construction or proof.**

1. Apply cmTensor_stabilizer_height with θ=Δ and k=6.
2. In the non-elliptic, prime-to-N case specialize the tensor correction to zero; for elliptic and level places compute and retain it before the global product-formula cancellation.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_new_automorphism_length` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.2) Lemma, p. 263.

### Special j tangent values

`GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values` · theorem · `gz86_j_tangent_values`

Let N = 1, so X = Y = X₀(1) and X′ = Y′. For a point x as in (8.2), modulo μ₆ (printed 'mod μ₀', PAPER-GROSS-ZAGIER-86/E17): α ≡ j(x)^{2/3}(j(x) − 1728)^{1/2} if j(x) ≠ 0, 1728; α ≡ 2⁶·3⁴ if j(x) = 1728; α ≡ 2⁹·3^{3/2} if j(x) = 0.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`, `GrossZagierAndArithmeticHeights:GZ.7/classical-self-intersection-tangent`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`.

**Construction or proof.**

1. Compute the leading modular discriminant/j coordinate at j=0 and j=1728.
2. Apply the corrected cotangent/tangent comparison, keeping the valuations at 2 and 3.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_j_tangent_values` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.3), p. 263.

### New Hom intersection formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-intersection` · theorem · `gz86_new_hom_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Allow r_𝒜(m) ≠ 0, with (x·x) defined by (8.1). Using I_v^GZ of classical-modified-intersection, for every generic stabilizer u and v ∤ mN, I_v^GZ(x,T_m x^σ) = ½ Σ_{n≥1} #Hom^{new}_{W/π^n}(x^σ,x)_{deg m}. Consequently the quaternionic formulas (7.4) remain true when p is non-split, provided the sum runs only over b ∈ R𝔞 with b ∉ K, i.e. b₋ ≠ 0; this is needed for the terms ord_p(Nb₋) to make sense. For u=1 and v∤N this also equals the eta-normalized pairing. In all other cases compare to a cotangent pairing by its explicit tensor correction.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- The displayed count uses the modified pairing I_v^GZ. Equality with the eta-normalized self-pairing is asserted only for u=1 and v∤N.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-intersection-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `GrossZagierAndArithmeticHeights:GZ.7/classical-modified-intersection`.

**Construction or proof.**

1. Separate the lifted diagonal from new homomorphisms.
2. Use the modified automorphism self-term on the diagonal and the ordinary Hom count on distinct sections; Conrad (10.3) then applies for every generic stabilizer.
3. Specialize the tensor correction only in the non-elliptic prime-to-level case.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_new_hom_intersection` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.4), p. 264.
- [Gross–Zagier revisited](https://math.stanford.edu/~conrad/papers/gzfinal.pdf), §9 (9.9)–(9.11), and §10 (10.2)–(10.3), author-copy pp.40–43.
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), §10, (10.2)–(10.3), pp.130–131.

### Inert total intersection formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-inert-total-intersection` · theorem · `gz86_inert_total_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v ∤ N, p inert in K, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit; PAPER-GROSS-ZAGIER-86/E21). Then I_v^GZ(x,T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞), b₋ ≠ 0} ½(1 + ord_p N(b₋)) + ½·u·r_𝒜(m)·ord_p(m). Every intersection in this conclusion is the modified pairing. A cotangent pairing adds the tensor correction of classical-modified-intersection.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- Use I_v^GZ rather than an uncorrected coarse tangent self-pairing when u>1.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-modified-intersection`.

**Construction or proof.**

1. Use the modified new-Hom formula and the inert lifting/Hecke calculation.
2. Retain the displayed diagonal term in I_v^GZ; convert to an actual cotangent symbol only by the tensor comparison.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_inert_total_intersection` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 1), p. 264.
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Theorem10.5(1), pp.134–139.

### Ramified total intersection formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-total-intersection` · theorem · `gz86_ramified_total_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v ∤ N, p ramified in K, v | p, and 𝔞 ∈ 𝒜 prime to p (implicit; PAPER-GROSS-ZAGIER-86/E21). Then I_v^GZ(x,T_m x^σ) = Σ_{b ∈ R𝔞/±1, N(b) = m·N(𝔞), b₋ ≠ 0} ord_p(D·N(b₋)) + u·r_𝒜(m)·ord_p(m). Every intersection in this conclusion is the modified pairing. A cotangent pairing adds the tensor correction of classical-modified-intersection.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- Use I_v^GZ rather than an uncorrected coarse tangent self-pairing when u>1.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-modified-intersection`.

**Construction or proof.**

1. Use the modified new-Hom formula and the ramified lifting/Hecke calculation.
2. Retain the displayed diagonal term in I_v^GZ; convert to an actual cotangent symbol only by the tensor comparison.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_ramified_total_intersection` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 2), p. 264.
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Theorem10.5(2), pp.134–139.

### Split total intersection formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-split-total-intersection` · theorem · `gz86_split_total_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v ∤ N, p = 𝔭𝔭̄ split in K, v | 𝔭. Then I_v^GZ(x,T_m x^σ) = u·r_𝒜(m)·k_𝔭, where k_𝔭 ≥ 0 and k_𝔭 + k_𝔭̄ = ord_𝔭(m) (printed with subscript 𝔭; equal to ord_p(m) since p splits). The k_𝔭 need not be integers: by Conrad (10.8), printed p.139, u·r_𝒜(m)·k_𝔭 = u·κ_𝔭 with κ_𝔭 = Σ_𝔟 ord_𝔭(𝔟) over the integral ideals 𝔟 of norm m in 𝒜^{−1}, so dividing the integer κ_𝔭 by r_𝒜(m) may give a noninteger. Conrad's form: I_v^GZ(x,T_m x^σ) = u·κ_𝔭 with κ_𝔭, κ_𝔭̄ ∈ ℤ≥0 intrinsic to 𝔭, 𝔭̄ and κ_𝔭 + κ_𝔭̄ = r_𝒜(m)·ord_p(m). Every intersection in this conclusion is the modified pairing. A cotangent pairing adds the tensor correction of classical-modified-intersection.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**
- Use I_v^GZ rather than an uncorrected coarse tangent self-pairing when u>1.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing`, `GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-modified-intersection`.

**Construction or proof.**

1. Use the modified new-Hom formula and the split lifting/Hecke calculation.
2. Retain the displayed diagonal term in I_v^GZ; convert to an actual cotangent symbol only by the tensor comparison.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_split_total_intersection` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.5) Proposition part 3), p. 264.
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Theorem10.5(3), pp.134–139.

### Level intersection formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-level-intersection` · theorem · `gz86_level_intersection`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). Assume v|N, so p splits in K and p∤m. Put J_v=I_v^GZ(x,T_m x^σ)−r_A(m)ord_(v,x)(Δ)/(r_x+6). Then J_v=0 for v|𝔫 and J_v=−u r_A(m)ord_p(N) for v|𝔫̄. Here r_x+6=6/u and ord_(v,x)(Δ)=6ord_v(𝔫̄). This is the finite contribution in classical-tensor-global-decomposition, rather than an equality between the modified and arbitrary cotangent pairings.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-modified-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tensor-global-decomposition`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component`.

**Construction or proof.**

1. The Serre–Tate canonical lift at a split level prime has no new automorphisms; its modified self-value vanishes.
2. Compute the connected and étale level branches using Lemma10.1, then insert the discriminant correction into J_v.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_level_intersection` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §8, (8.6) Proposition, p. 264.
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Lemma10.1 and Theorem10.4, pp.131–134.

### Split-prime height sum

`GrossZagierAndArithmeticHeights:GZ.7/classical-split-height-sum` · theorem · `gz86_split_height_sum`

Standing notation (Ch. III): N > 1 (GZ's standing assumption; for N = 1 the cusps ∞ and 0 coincide and c, T_m d^σ always share them); K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p splits in K, then ⟨c, T_m d^σ⟩_p^Δ = −u·r_𝒜(m)·h·ord_p(m/N)·log p. The value is the Δ-normalized contribution. At p∤N use κ_𝔭+κ_𝔭̄=r_A(m)ord_p(m); at p|N the discriminant correction produces the N term. The residue-weighted place sum above either split prime is h log p.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/classical-p-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-split-total-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tensor-global-decomposition`.

**Construction or proof.**

1. Combine the split total intersection and level terms.
2. The global tensor decomposition combines the modified intersection with its discriminant correction, giving the claimed p-height.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_split_height_sum` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.2) Proposition, p. 265.
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), TheoremA.1, p.139.

### Inert CM Hom lattice

`GrossZagierAndArithmeticHeights:GZ.7/classical-inert-hom-lattice` · construction · `inertCMHomLattice`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). p inert, v | p, 𝔟 as in Eichler-order model S and Eichler's connecting-ideal theorem (quoted, Eichler [10, p. 118]), 𝔞 ∈ 𝒜 (prime to p and to 𝔡). Then R𝔞 = {α + βj : α ∈ 𝔡^{−1}𝔞, β ∈ 𝔡^{−1}𝔮^{−1}𝔫𝔟̄𝔟^{−1}𝔞̄, α ≡ (−1)^{ord_𝔣(𝔟)}β mod O_𝔣 for 𝔣 | 𝔡}. As printed this holds for 𝔟R = S𝔟; with R𝔟 = 𝔟S replace 𝔟̄𝔟^{−1} by 𝔟𝔟̄^{−1} (PAPER-GROSS-ZAGIER-86/E20).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `ComplexMultiplicationAndExplicitReciprocity:CM.5/supersingular-curve-versus-level-pair`.

**Construction or proof.**

1. Choose the connecting ideal with identity 𝔟R=S𝔟.
2. Transport the explicit reduction lattice; its anti-linear coefficient transforms by 𝔟̄/𝔟. Reversing the identity requires reversing that ratio.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §9, (9.3), p. 265`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `inertCMHomLattice` (constructor; algebraic-fragment): The fractional R𝔞 congruence lattice with connecting ideal chosen by 𝔟R=S𝔟.
- `inertCMHomLattice_beta` (projection; algebraic-fragment): Its β ideal is 𝔡⁻¹𝔮⁻¹𝔫𝔟̄𝔟⁻¹𝔞̄.
- `inertCMHomLattice_connecting_convention` (compatibility; algebraic-fragment): Using R𝔟=𝔟S instead replaces 𝔟 by 𝔟̄ in the formula.
- `inertCMHomLattice_degree` (projection; algebraic-fragment): A lattice element has isogeny degree N(b)/N𝔞.

**Mathematical unit tests.**

- `inertCMHomLattice_b_one` (computation; fragment-example): 𝔟=O recovers the simpler inert-order lattice.
- `inertCMHomLattice_orientation` (non-example; fragment-example): For non-ambiguous [𝔟], reversing the connecting identity while leaving 𝔟̄/𝔟 fixed changes the lattice.
- `inertCMHomLattice_sign` (compatibility; fragment-example): The lattice and the degree fibre are preserved under b↦−b.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`TauCeti.GrossZagier.AlgebraicFragments.inertCMHomLattice` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.3), p. 265.

### Inert norm-ideal map

`GrossZagierAndArithmeticHeights:GZ.7/classical-inert-norm-ideal-map` · construction · `inertNormIdeals`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). p inert. For b = α + βj ∈ R𝔞 with (9.4) N(b) = N(α) + pq·N(β) = m·N(𝔞) and N(b₋) = pq·N(β) ≠ 0, define, with 𝔟 normalised as in the printed (9.3), i.e. 𝔟R = S𝔟 (with R𝔟 = 𝔟S replace 𝔟 by 𝔟̄ throughout, see PAPER-GROSS-ZAGIER-86/E20), the integral ideals (9.5) 𝔠 = (α)𝔡𝔞^{−1} and 𝔠′ = (β)𝔡𝔮𝔫^{−1}𝔟̄^{−1}𝔟𝔞̄^{−1}. Then 𝔠 ∈ 𝒜^{−1} and 𝔠′ ∈ 𝒜𝔅²[𝔮𝔫^{−1}], and (9.6) N𝔠 + N·p·N𝔠′ = m|D|. The integer n = p·N𝔠′ is non-zero and ord_p(n) = ord_p(N b₋) (using p ∤ N𝔞). δ(n) = Π_{l | (n,D)} 2 as in Ch. II (3.15).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-hom-lattice`, `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`.

**Construction or proof.**

1. Multiply α and β by the indicated different and fractional ideals to obtain integral ideals 𝔠 and 𝔠′.
2. Take ideal norms and classes: N𝔠+NpN𝔠′=m|D|; prime-to-p N𝔞 gives the valuation equality.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §9, (9.4)–(9.6), p. 265`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `inertNormIdeals` (constructor; algebraic-fragment): From b=α+βj with N(b)=mN𝔞 and b₋≠0 form the two integral ideals 𝔠,𝔠′ of (9.5).
- `inertNormIdeals_classes` (projection; omitted; actual source carrier not written): [𝔠]=A⁻¹ and [𝔠′]=AB²[𝔮𝔫⁻¹] in the printed connecting convention.
- `inertNormIdeals_norm` (characterisation; omitted; actual source carrier not written): N𝔠+NpN𝔠′=m|D|.
- `inertNormIdeals_valuation` (projection; omitted; actual source carrier not written): For p∤N𝔞, ord_p(pN𝔠′)=ord_p N(b₋).

**Mathematical unit tests.**

- `inertNormIdeals_nonzero` (characterisation; omitted; The actual connecting-Hom ideal map and its nonzero norm image are absent; the previous example is absent.): b₋≠0 implies N𝔠′>0, so the finite sum excludes n=0.
- `inertNormIdeals_sign` (characterisation; fragment-example): b and −b produce the same ideal pair.
- `inertNormIdeals_bad_a` (non-example; fragment-example): If p|N𝔞 the valuation equality requires the extra ord_p(N𝔞), so the prime-to-p hypothesis cannot be dropped.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`TauCeti.GrossZagier.AlgebraicFragments.inertNormIdeals` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.4)–(9.6), p. 265.

### Inert-prime height sum

`GrossZagierAndArithmeticHeights:GZ.7/classical-inert-height-sum` · theorem · `gz86_inert_height_sum`

Standing notation (Ch. III): N > 1 (GZ's standing assumption; for N = 1 the cusps ∞ and 0 coincide and c, T_m d^σ always share them); K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p is inert in K (r_𝒜(m) arbitrary), then ⟨c, T_m d^σ⟩_p^Δ = −r_𝒜(m)·h·u·ord_p(m)·log p − u²·log p·Σ_{0 < n < m|D|/N, n ≡ 0 (mod p)} ord_p(pn)·r_𝒜(m|D| − nN)·δ(n)·R_{{𝒜𝔮𝔫}}(n/p). Here δ(n) = 2^{#{primes l | (n,D)}}, R_{{𝒞}}(k) is the number of integral ideals of norm k in the genus of 𝒞 (Ch. II (3.17)), and 𝔮 | q is the auxiliary prime of the referenced classical source result 165. The value does not depend on the choice of q, of 𝔮 | q, or of 𝔫 versus 𝔫̄.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/classical-p-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-total-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-norm-ideal-map`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count`, `AnalyticNumberTheory:AN.4`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tensor-global-decomposition`.

**Construction or proof.**

1. Use the corrected u²δ(n) count of preimages of each norm-ideal pair.
2. Multiply by the inert half-valuation length, reindex n=pN𝔠′>0 and sum the residue-weighted places.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_inert_height_sum` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.7) Proposition, p. 266.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, introduction, p. 253 (proved as the r_A(m) = 0 case of Proposition (9.7), p. 266).
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), (A.9)–(A.10), p.140; Theorem A.17, pp.156–161.

### Inert unit-orbit count

`GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count` · theorem · `gz86_inert_unit_count`

Standing notation (Ch. III) with N > 1, p inert in K, the auxiliary prime q chosen with −pq ≡ 1 (mod D) (PAPER-GROSS-ZAGIER-86/E19) and 𝔞 ∈ 𝒜 prime to pD (PAPER-GROSS-ZAGIER-86/E21). Let 𝔠 ∈ 𝒜^{−1} and 𝔠′ be integral ideals with 𝔠′ in the class 𝒜[𝔮𝔫^{−1}]𝔅² for some 𝔅 ∈ Cl_K, with N𝔠 + N·p·N𝔠′ = m|D| and n = p·N𝔠′ > 0. Reversing (9.5) determines α, β up to units of O; integrality of N(α) + pqN(β) = m·N𝔞 forces α ≡ ±β mod O_𝔣 for every prime 𝔣 | 𝔡, and the resulting b = α + βj lie in R_{v′}𝔞 for places v′ | p in one Gal(H/K)-orbit. Each such pair contributes exactly u²·δ(n) elements b ∈ ⊔_{v|p} R_v𝔞/±1 (printed '2·u²·δ(n)', PAPER-GROSS-ZAGIER-86/E22), each of weight ½(1 + ord_p N(b₋)) = ½·ord_p(pn) in Σ_{v|p}(x·T_m x^σ)_v; summing over pairs and over 𝔅 gives the second term of (9.7).

**Hypotheses.**

- **H1**
- **H2**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-norm-ideal-map`, `AnalyticNumberTheory:AN.4`.

**Construction or proof.**

1. For each norm-ideal pair count the unit generators and ramified congruence choices.
2. Quotient once by the simultaneous sign; this yields u²δ(n), not the printed doubled coefficient.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_inert_unit_count` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §9, proof of Proposition (9.7), p. 266.

### Ramified quaternionic order model

`GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model` · construction · `ramifiedOrderModel`

Standing notation (Ch. III): N ≥ 1; K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). p ramified in K with prime 𝔭; f = order of [𝔭] in Cl_K. There are h/f places v | 𝔭 in H, each with q_v = p^f (printed 'residual degree p^f', PAPER-GROSS-ZAGIER-86/E23). Choose a prime q with (q/p′) = (−1/p′) for all primes p′ ≠ p dividing D and (−q/p) = −1; for the order model one must also impose −q ≡ 1 (mod D/p) (PAPER-GROSS-ZAGIER-86/E19). Then q = 𝔮𝔮̄ splits in K, B has Hilbert symbol (D, −q), and B = K + Kj with j² = −q. With 𝔟 normalised by 𝔟R = S𝔟 as in the printed (9.3) (with R𝔟 = 𝔟S replace 𝔟 by 𝔟̄ throughout; PAPER-GROSS-ZAGIER-86/E20): (9.8) R𝔞 = {α + βj : α ∈ 𝔭𝔡^{−1}𝔞, β ∈ 𝔭𝔡^{−1}𝔮^{−1}𝔫𝔟̄𝔟^{−1}𝔞̄, α ≡ (−1)^{ord_𝔣(𝔟)}β mod O_𝔣 for 𝔣 | 𝔡} (β missing in print, PAPER-GROSS-ZAGIER-86/E24). The class of 𝔟 is well defined in Cl_K/[𝔭] by v. For b = α + βj ∈ R𝔞 with N(b) = m·N(𝔞) and N(b₋) ≠ 0, (9.9) 𝔠 = (α)𝔡𝔞^{−1} ∈ 𝒜^{−1} and 𝔠′ = (β)𝔡𝔮𝔫^{−1}𝔟̄^{−1}𝔟𝔞̄^{−1} ∈ 𝒜[𝔮𝔫^{−1}]𝔅² are integral and both divisible by 𝔭, and (9.10) N𝔠 + N·N𝔠′ = m|D|. The integer n = N𝔠′ is non-zero, with ord_p(n) = ord_p(D·N(b₋)).

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`, `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`.

**Construction or proof.**

1. Choose the ramified model q with −q≡1 modulo D/p and the prescribed nonsquare residue at p.
2. Transport the connecting ideal as in the inert case and form the two norm ideals, each divisible by 𝔭.

**Uses.**

- `Gross–Zagier 1986 Chapter III, §9, pp. 266 ((9.8)–(9.10))`: Supply this normalized class, kernel or local arithmetic term to the next explicitly named comparison.
- `GZ.7 specialization`: Use its API to distinguish the zero, diagonal, sign, ramification or normalization case tested here.

**Planning API.**

- `ramifiedOrderModel` (constructor; algebraic-fragment): The CM reduction lattice in (D,−q), with −q≡1 mod D/p and (−q/p)=−1, together with its norm-ideal map.
- `ramifiedOrderModel_norm` (projection; algebraic-fragment): N(α+βj)=Nα+qNβ.
- `ramifiedOrderModel_ideals` (projection; algebraic-fragment): Both integral ideals 𝔠,𝔠′ are divisible by 𝔭 and N𝔠+NN𝔠′=m|D|.
- `ramifiedOrderModel_places` (projection; algebraic-fragment): h/f places, residue size p^f, f=order[𝔭].

**Mathematical unit tests.**

- `ramifiedOrderModel_beta_congruence` (non-example; fragment-example): The congruence has α≡(−1)^ord𝔣(𝔟)β; omission of β does not define the claimed lattice.
- `ramifiedOrderModel_p_divides_n` (characterisation; fragment-example): n=N𝔠′ is positive and divisible by p.
- `ramifiedOrderModel_residue_weight` (computation; fragment-example): For f=2 the weight is 2log p at each of h/2 places.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`TauCeti.GrossZagier.AlgebraicFragments.ramifiedOrderModel` — algebraic-fragment.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §9, pp. 266 ((9.8)–(9.10)).

### Ramified-prime height sum

`GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-height-sum` · theorem · `gz86_ramified_height_sum`

Standing notation (Ch. III): N > 1 (GZ's standing assumption; for N = 1 the cusps ∞ and 0 coincide and c, T_m d^σ always share them); K = ℚ(√D) with D < 0 an odd fundamental discriminant, D ≡ □ (mod 4N), so (D,N) = 1 and every prime dividing N splits in K; O = O_K, 𝔡 = (√D) its different, h = #Cl_K, u = #O^×/2; 𝔫 ⊂ O with O/𝔫 ≅ ℤ/N; x = (φ: E → E′) a Heegner point of discriminant D on X₀(N) (E, E′ with CM by O, ker φ killed by 𝔫), defined over the Hilbert class field H; σ ∈ Gal(H/K) corresponds to 𝒜 ∈ Cl_K under the Artin map; r_𝒜(m) = number of integral ideals of norm m in 𝒜; m ≥ 1 with (m,N) = 1; v a finite place of H over the prime p; A_v the integers of H_v, π a uniformiser, q_v = #A_v/π; W = completion of the maximal unramified extension of A_v (residue field F̄_p); X = the Deligne–Rapoport/Katz–Mazur coarse model of X₀(N) over ℤ; x, x^σ the W-sections of X ⊗ W; T_m the Hecke correspondence; Hom_S(y,x) = homomorphisms of Γ₀(N)-diagrams (§2), with degree deg(f,f′) = deg f; h_n(y,x)_{deg m} = ½·#Hom_{W/π^n}(y,x)_{deg m}; (·) = intersection pairing on X ⊗ W; c = (x) − (∞), d = (x) − (0). If p is ramified in K with prime 𝔭 (r_𝒜(m) arbitrary), then ⟨c, T_m d^σ⟩_p^Δ = −r_𝒜(m)·h·u·ord_p(m)·log p − u²·log p·Σ_{0 < n < m|D|/N, n ≡ 0 (mod p)} ord_p(n)·r_𝒜(m|D| − nN)·δ(n)·R_{{𝒜𝔮𝔭𝔫}}(n/p), with δ and R as in (9.7) Inert primes: explicit ⟨c, T_m d^σ⟩_p^Δ and 𝔮 the auxiliary prime of (9.8)–(9.10) Ramified-case model: q, B = (D, −q), R𝔞 and the ideals 𝔠, 𝔠′.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.2/classical-p-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-total-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model`, `AnalyticNumberTheory:AN.4`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tensor-global-decomposition`.

**Construction or proof.**

1. Apply the ramified norm-ideal count and lifting valuation to n=N𝔠′>0.
2. There are h/f places with q_v=p^f; their aggregate log weight is h log p.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_ramified_height_sum` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter III, §9, (9.11) Proposition, p. 267.
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), (A.9)–(A.10), p.140; Theorem A.20, p.162.

### Global-local archimedean comparison

`GrossZagierAndArithmeticHeights:GZ.7/classical-global-local-archimedean-sum` · theorem · `gz86_global_local_archimedean_sum`

Standing notation of Chap. V §1 (= Chaps. II–III): as in Chap. IV and moreover every prime p | N splits in K; H = Hilbert class field of K; x ∈ X₀(N)(H) a Heegner point of discriminant D (one of the 2^s·h such points, permuted simply transitively by W × Gal(H/K), W = Atkin–Lehner group); J = J₀(N) = Jac X₀(N); c = class of (x) − (∞), d = class of (x) − (0) in J(H); σ ∈ G = Gal(H/K) corresponds to 𝒜 under the Artin map; <,> = global Néron–Tate height pairing on J(H) (heights over H), extended to J(H)⊗ℂ as a hermitian pairing; 𝕋 = ℚ-subalgebra of End_ℚ(J)⊗ℚ generated by the Hecke operators T_m. For (m, N) = 1, <c, T_m d^σ> = Σ_v <c, T_m d^σ>_v over places v of H (Néron local symbols; when |c| ∩ |T_m d^σ| ≠ ∅, i.e. r_𝒜(m) ≠ 0, defined as in Chap. II §5). By Chap. II Props. (4.2), (5.8) and Chap. IV Prop. (4.6)(a): Σ_{v|∞} <c, T_m d^σ>_v = lim_{s→1}[−2u² Σ_{n≥1} σ_𝒜(−n) r_𝒜(m|D| + nN) Q_{s−1}(1 + 2nN/(m|D|)) − hκσ₁(m)/(s − 1)] + hκ[σ₁(m)(log(N/|D|) + 2Σ_{p|N} log p/(p² − 1) + 2 + 2(ζ′/ζ)(2) − 2(L′/L)(1, ε)) + Σ_{d|m} d log(m/d²)] + hu r_𝒜(m)[2(L′/L)(1, ε) − 2γ − 2 log 2π + log|D|], with σ_𝒜(n) = Σ_{d|n} ε_𝒜(n, d) (ε_𝒜(n,d) ∈ {0, 1, −1} as in Chap. IV Prop. (3.2)), κ = κ_N = −12/(N ∏_{p|N}(1 + 1/p)), σ₁(m) = Σ_{d|m} d. This archimedean contribution uses the Δ/eta analytic parameters of classical-tensor-global-decomposition and is paired with the finite superscript Δ contribution.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-total-archimedean-formula`, `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tensor-global-decomposition`.

**Construction or proof.**

1. Translate the local modular height sum into the field-relative canonical pairing.
2. Separate the complex norm, unit index and degree-of-field factors before comparing coefficients.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM curve/divisors, normalized hyperbolic or arithmetic Green family, marked-point domain, spectral continuation and tangent norms; the arbitrary sums/germs retained below omit these analytic/geometric identifications.

`gz86_global_local_archimedean_sum` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter V, §1, pp. 306-307 (first display on p. 307).

### Total finite CM height formula

`GrossZagierAndArithmeticHeights:GZ.7/classical-finite-height-sum` · theorem · `gz86_finite_height_sum`

Standing notation of Chap. V §1 (= Chaps. II–III): as in Chap. IV and moreover every prime p | N splits in K; H = Hilbert class field of K; x ∈ X₀(N)(H) a Heegner point of discriminant D (one of the 2^s·h such points, permuted simply transitively by W × Gal(H/K), W = Atkin–Lehner group); J = J₀(N) = Jac X₀(N); c = class of (x) − (∞), d = class of (x) − (0) in J(H); σ ∈ G = Gal(H/K) corresponds to 𝒜 under the Artin map; <,> = global Néron–Tate height pairing on J(H) (heights over H), extended to J(H)⊗ℂ as a hermitian pairing; 𝕋 = ℚ-subalgebra of End_ℚ(J)⊗ℚ generated by the Hecke operators T_m. Combining Chap. III Props. (9.2), (9.7), (9.11) over all p and Chap. IV Prop. (4.6)(b): for (m, N) = 1, <c, T_m d^σ>_finite^Δ = −u² Σ_{0<n≤m|D|/N} σ′_𝒜(n) r_𝒜(m|D| − nN) + hu r_𝒜(m) log(N/m), where σ′_𝒜(n) = Σ_{d|n} ε_𝒜(n, d) log(n/d²). The finite superscript Δ means Σ_p cmPrimeHeightSum with its discriminant correction; its archimedean partner uses the eta-normalized limit in classical-tensor-global-decomposition.

**Hypotheses.**

- **H1**
- **H2**
- **H3**
- **H4**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-split-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-height-sum`, `GrossZagierAndArithmeticHeights:GZ.2/classical-p-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tensor-global-decomposition`.

**Construction or proof.**

1. Add the split-zero, inert and ramified prime height sums with finite support.
2. Use the single-prime logarithm coefficient identity to express their total by the source σ′ sum.

**Acceptance.**

- Retain every source support, coprimality, convergence, norm-congruence, diagram-choice and tangent hypothesis. The output is a declaration plan; imported proof gates are not implementation claims.

**Lean correspondence.** The actual CM cyclic-isogeny diagrams and their integral models, quaternionic order/Hom lattices, class-group action and valuations/counting fibres occurring in this target; coarse Artinian points do not provide a canonical diagram-Hom carrier.

`gz86_finite_height_sum` — omitted; actual source carrier not written.

**Sources.**

- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), published Invent. Math. 84 (1986), Chapter V, §1, p. 307 (second display).

### CM tensor stabilizer height

`GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height` · theorem · `cmTensor_stabilizer_height`

Let x be a chosen integral Γ₀(N)-diagram over the complete characteristic-zero DVR W whose section is in the smooth locus of the coarse model. Let ω_x be a nonzero rational cotangent vector, F=Frac(W), u_x=#Aut_F(x)/2, and θ a nonzero global differential tensor of weight k with order r_x at x; assume r_x+k≠0. Define C_x by the leading expansion θ=(C_x t_x^(r_x)+…) (dt_x)^⊗k for dt_x=ω_x, and ord_(v,x)(θ) using the integral universal deformation coordinate. Then (x·x)_(v,ω_x)= 1/2 Σ_(n≥0)(#Aut_(W/π^(n+1))(x)−#Aut_W(x)) + [ord_v(C_x u_x^k)−ord_(v,x)(θ)]/(r_x+k). The sum is finite. For θ=Δ, k=6, u_x=1 and v∤N the tensor-corrected eta intersection equals the new-automorphism sum; at elliptic points and v|N retain the displayed correction.

**Hypotheses.**

- Chosen actual integral diagram and formally smooth one-dimensional deformation ring R₀=W[[T₀]]
- Finite effective stabilizer G=Aut_k(x)/±1 acts faithfully; invariant ring is the coarse completed local ring; x is smooth there

**Inputs.** `AbelianSchemesAndArithmeticModuli:A6`, `ComplexMultiplicationAndExplicitReciprocity:CM.5`, `GrossZagierAndArithmeticHeights:GZ.7/classical-self-intersection-tangent`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Construction or proof.**

1. Form the invariant coordinate T_x=Norm_G(T₀)=Π_g[g](T₀).
2. A g lifts to W/π^(n+1) precisely when the constant term of [g](T₀) is divisible by π^(n+1); the finite automorphism sum is ord_v(b_x) for T_x=b_xT₀^(u_x)+….
3. Compare the leading coefficient of θ after substitution: ord_(v,x)(θ)=ord_v(C_x u_x^k)+(r_x+k)ord_v(b_x).
4. Use the cotangent intersection parameter-change law; for Δ apply the extra integral leading coefficient instead of deleting it at small residue characteristics.

**Acceptance.**

- At u_x=1,v∤N the eta correction recovers the historical half automorphism sum.
- At u_x>1 the u_x^k and tensor order terms must be retained.
- Scaling ω by c changes the self-intersection by −ord_v(c).

**Lean correspondence.** The actual coarse CM diagram, generic elliptic stabilizer, stabilizer-norm deformation coordinate and cotangent/differential tensors; the modified pairing and its global Δ comparison are separately planned.

`cmTensor_stabilizer_height` — omitted; actual source carrier not written.

**Sources.**

- [Gross–Zagier revisited](https://math.stanford.edu/~conrad/papers/gzfinal.pdf), author final copy §9 Theorem9.2, (9.5)–(9.10), pp.38–40 (published pp.123–126).
- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Published MSRI 49 (2004), §9, Theorem 9.2, pp. 123–125; Definition 9.5, pp. 126–127.

### Modified CM intersection pairing

`GrossZagierAndArithmeticHeights:GZ.7/classical-modified-intersection` · construction · `cmModifiedIntersection`

For chosen integral Γ₀(N)-diagrams with sections in the smooth coarse locus over a complete characteristic-zero DVR W, put W_n=W/π^(n+1). Define I_v^GZ(x,x)=½Σ_(n≥0)(#Aut_(W_n)(x)−#Aut_W(x)). For distinct generic sections use their ordinary local intersection number, and extend additively to a Hecke divisor. This is a modified pairing: for a rational cotangent ω_x, a differential tensor θ of weight k, r_x=ord_x(θ)≠−k, and θ=(C_x t_x^(r_x)+…) (dt_x)^⊗k with dt_x=ω_x, I_(v,ω_x)(x,T_m x^σ)=I_v^GZ(x,T_m x^σ)+r_A(m)[ord_v(C_x u_x^k)−ord_(v,x)(θ)]/(r_x+k). Here u_x=#Aut_(Frac(W))(x)/2 is the generic stabilizer, and ord_(v,x)(θ) uses the universal deformation coordinate. The automorphism sum is finite. Its equality with an eta-normalized self-intersection requires the separate non-elliptic prime-to-level specialization.

**Hypotheses.**

- W is a complete characteristic-zero DVR with algebraically closed residue field; the diagrams are chosen over W and their sections lie in the relative smooth coarse locus.
- For the comparison, k is an integer, θ is a nonzero differential tensor with r_x+k≠0, and ω_x is a nonzero rational cotangent.
- For a Hecke divisor, use the classical Heegner hypotheses, gcd(m,N)=1 and multiplicity r_A(m) at x.

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-intersection-count`, `GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height`.

**Construction or proof.**

1. Subtract precisely the automorphisms lifting to W at each nilpotent level; rigidity and the stabilizer-norm calculation give finite support.
2. Use the ordinary intersection on each distinct section and the defined self-term on the diagonal.
3. Apply cmTensor_stabilizer_height to the diagonal multiplicity r_A(m); no correction occurs on distinct sections.

**Uses.**

- `Conrad Theorems10.4–10.5, pp.133–135`: The inert, ramified, split and level formulas use this pairing before the discriminant correction.
- `Conrad Theorem9.6 and (9.18), pp.129–130`: Recombine the modified finite contribution with normalized archimedean terms.

**Planning API.**

- `cmModifiedIntersection` (constructor; omitted; actual source carrier not written): The additive CM intersection pairing using the finite new-automorphism sum on the diagonal.
- `cmModifiedIntersection_disjoint` (compatibility; omitted; actual source carrier not written): For distinct generic sections the modified value equals the ordinary local intersection number.
- `cmModifiedIntersection_diagonal` (simp; omitted; actual source carrier not written): On (x,x) the value is one half the sum of #Aut(W_n)−#Aut(W).
- `cmModifiedIntersection_add` (structure; omitted; actual source carrier not written): The second divisor argument is additive, so its diagonal contribution is its multiplicity at x times the self-term.
- `cmModifiedIntersection_tensor` (compatibility; omitted; actual source carrier not written): The cotangent pairing differs by the displayed r_A(m) tensor correction with denominator r_x+k.

**Mathematical unit tests.**

- `cmModifiedIntersection_no_new_automorphisms` (degenerate; omitted; actual source carrier not written): If every reduction automorphism lifts to W, the modified self-value is zero.
- `cmModifiedIntersection_first_level` (computation; omitted; actual source carrier not written): If #Aut(W_0)−#Aut(W)=2 and all later differences vanish, the self-value is 1, rather than 2.
- `cmModifiedIntersection_nonzero_correction` (non-example; omitted; actual source carrier not written): For u_x=1, k=6, r_x=0, ord_v(C_x)=0 and ord_(v,x)(θ)=6, the cotangent self-value is the modified value minus 1; identifying the two pairings fails.

**Acceptance.**

- Keep the generic stabilizer distinct from the larger special-fiber automorphism group.

**Lean correspondence.** Actual chosen integral CM diagrams, their universal deformation rings and finite automorphism groups, coarse intersection multiplicities and cotangent/differential tensors. These carriers are requested from the direct owners; no arbitrary scalar pairing stands for them.

`cmModifiedIntersection` — omitted; actual source carrier not written.

**Sources.**

- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), §9, (9.9)–(9.12), printed pp.126–127.

### Tensor-normalized local-to-global CM height

`GrossZagierAndArithmeticHeights:GZ.7/classical-tensor-global-decomposition` · theorem · `cmTensor_global_height`

For the classical Heegner data over H, choose a nonzero global differential tensor θ of weight k, r_x=ord_x(θ)≠−k and u_x the generic stabilizer. At each complex place choose a lift z_v to the upper half-plane and an analytic parameter g_(z_v) for which the pulled-back θ has leading coefficient 1. Then ⟨c,T_m d^σ⟩=−Σ_(v finite)[I_v^GZ(x,T_m x^σ)−r_A(m)ord_(v,x)(θ)/(r_x+k)]log q_v+Σ_(v complex)lim_(y_v→z_v)[⟨c_(y_v),T_m d^σ⟩_v−u_x r_A(m)log|g_(z_v)(y_v)|_v]. Complex absolute values are squared. For θ=Δ and k=6, r_x+6=6/u_x, ord_(v,x)(Δ)=6ord_v(𝔫̄), and one may take g_(z_v)(z)=(2πi)η⁴(z_v)(z−z_v). Thus the finite terms use I_v^GZ−u_x r_A(m)ord_v(𝔫̄), and the archimedean terms are exactly the eta-normalized limits in Chapter II §5. Each individual finite term need not equal the local symbol for an independently chosen global cotangent.

**Hypotheses.**

- **H3**
- **H4**
- Use one global θ with r_x+k≠0 and the associated fractional ideal with valuations ord_(v,x)(θ); analytic parameters have leading coefficient 1 for its pullback.
- For the Δ specialization, 𝔫 kills the level subgroup, (N)=𝔫𝔫̄; use the connected/étale orientation of classical-level-reduction-component.
- **H11**

**Inputs.** `GrossZagierAndArithmeticHeights:GZ.7/classical-modified-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-product-formula`, `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`.

**Construction or proof.**

1. Apply the tensor correction at every finite place, and express the remaining ideal contribution as r_A(m)log Norm(a_θ)/(r_x+k).
2. Pull θ to the universal upper-half-plane family. Its order is u_x r_x+k(u_x−1); normalizing the leading coefficient changes the complex tangent logarithm by the global scalar C_x u_x^k.
3. The product formula cancels that scalar across all places; the fractional ideal leaves the displayed finite correction.
4. For Δ, its pullback is ((2πi)η⁴(z)dz)^⊗6, so its analytic order is zero and r_x+6=6/u_x.
5. Use the Kodaira–Spencer isomorphism away from level primes and on the connected level branch. On the étale branch the Serre–Tate coordinate satisfies 1+T=(1+T′)^(p^e), giving ord_(v,x)(Δ)=6ord_v(𝔫̄).

**Acceptance.**

- At u_x=3 one has r_x+6=2, not 6; at v|𝔫̄ the finite correction is u_x r_A(m)ord_v(N).
- For r_A(m)=0 the tensor correction vanishes and the ordinary disjoint local-symbol decomposition is recovered.

**Lean correspondence.** Actual chosen integral CM diagrams, their universal deformation rings and finite automorphism groups, coarse intersection multiplicities and cotangent/differential tensors. These carriers are requested from the direct owners; no arbitrary scalar pairing stands for them. The global class-field places, product formula and normalized complex Green limits are also required.

`cmTensor_global_height` — omitted; actual source carrier not written.

**Sources.**

- [Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf), Theorem9.6, (9.16)–(9.18), pp.129–130; Lemma10.1 and its proof, pp.131–133.
- [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter II §5, (5.3)–(5.5), pp.250–251.

## Confirmed pinned baseline

All 50 statements and their surrounding hypotheses were independently read at
the two pinned commits. These are library inputs, not newly planned targets.

- `mathlib:Complex.Gamma_one` (Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean): Γ(1) = 1.
- `mathlib:Complex.Gammaℂ` (Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean): Γ_ℂ(s) = 2(2π)^{−s}Γ(s).
- `mathlib:Complex.Gammaℂ_def` (Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean): The defining formula of Γ_ℂ.
- `mathlib:Filter.Tendsto` (Mathlib/Order/Filter/Defs.lean): Limits.
- `mathlib:HasDerivAt.mul` (Mathlib/Analysis/Calculus/Deriv/Mul.lean): The product rule for HasDerivAt.
- `mathlib:IsGalois` (Mathlib/FieldTheory/Galois/Basic.lean): Galois extensions H/K.
- `mathlib:LinearMap.BilinMap` (Mathlib/LinearAlgebra/BilinearMap.lean): Bilinear maps, the type of the height pairings.
- `mathlib:Matrix.det` (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): Determinants, for Gram determinants.
- `mathlib:Matrix.det_smul` (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): det (c • A) = c^n det A.
- `mathlib:Matrix.of` (Mathlib/LinearAlgebra/Matrix/Defs.lean): Matrices from functions, for Gram matrices.
- `mathlib:MeasureTheory.lintegral` (Mathlib/MeasureTheory/Integral/Lebesgue/Basic.lean): The period integral, as EllipticCurves Layer 7 states it.
- `mathlib:Module.finrank` (Mathlib/LinearAlgebra/Dimension/Finrank.lean): The rank r.
- `mathlib:NumberField.Units.torsionOrder` (Mathlib/NumberTheory/NumberField/Units/Basic.lean): #μ(K), the order of the torsion units.
- `mathlib:QuadraticMap` (Mathlib/LinearAlgebra/QuadraticForm/Basic.lean): Quadratic maps.
- `mathlib:QuadraticMap.associated` (Mathlib/LinearAlgebra/QuadraticForm/Basic.lean): The halved polar form (associated bilinear form).
- `mathlib:QuadraticMap.map_smul` (Mathlib/LinearAlgebra/QuadraticForm/Basic.lean): Q(c • x) = c²Q(x).
- `mathlib:QuadraticMap.polar` (Mathlib/LinearAlgebra/QuadraticForm/Basic.lean): The polar form Q(x + y) − Q(x) − Q(y).
- `mathlib:QuadraticMap.polarBilin` (Mathlib/LinearAlgebra/QuadraticForm/Basic.lean): The polar form as a bilinear map.
- `mathlib:Real.sqrt` (Mathlib/Analysis/Real/Sqrt.lean): Square roots in the period integral.
- `mathlib:TensorProduct` (Mathlib/LinearAlgebra/TensorProduct/Defs.lean): E(K) ⊗ ℚ.
- `mathlib:WeierstrassCurve.b₂` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean): The b-invariants in D_W(x) = 4x³ + b₂x² + 2b₄x + b₆.
- `mathlib:WeierstrassCurve.Δ` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean): The discriminant, whose sign gives c∞.
- `mathlib:deriv_mul` (Mathlib/Analysis/Calculus/Deriv/Mul.lean): The product rule.
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): Tau Ceti's canonical height, ½ lim h(x(2ⁿP))/4ⁿ (the (O)-normalised height).
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_nsmul` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): ĥ(nP) = n²ĥ(P).
- `tauceti:WeierstrassCurve.Affine.Point.naiveHeight` (TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/NaiveHeight.lean): The naïve height of the x-coordinate, a Mathlib logHeight for the supplied AdmissibleAbsValues.
- `tauceti:WeierstrassCurve.Affine.Point.tendsto_naiveHeight_two_pow_nsmul_div_four_pow` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): The defining limit of the canonical height exists.
- `tauceti:WeierstrassCurve.Affine.PointModTorsion` (TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/PointModTorsion.lean): E(K) modulo torsion.
- `tauceti:WeierstrassCurve.Affine.canonicalHeightQuadratic` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): The canonical height as a ℤ-quadratic map.
- `tauceti:WeierstrassCurve.Affine.neronTateGramMatrix` (TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/PointModTorsion.lean): The Gram matrix of neronTatePairing on a basis.
- `tauceti:WeierstrassCurve.Affine.neronTatePairing` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): Tau Ceti's pairing, QuadraticMap.associated' of ĥ (the halved polar form).
- `tauceti:WeierstrassCurve.Affine.neronTatePairing_apply` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): neronTatePairing W P Q = (ĥ(P+Q) − ĥ(P) − ĥ(Q))/2.
- `tauceti:WeierstrassCurve.Affine.neronTatePairing_self` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): neronTatePairing W P P = ĥ(P).
- `tauceti:WeierstrassCurve.Affine.regulator` (TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean): Tau Ceti's regulator, |det| of the Gram matrix of neronTatePairing.
- `tauceti:WeierstrassCurve.Affine.regulator_eq_abs_det_neronTateGramMatrix` (TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean): Any basis computes the regulator.
- `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero` (TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean): The regulator is 1 in rank 0.
- `mathlib:NumberField.instAdmissibleAbsValues` (Mathlib/NumberTheory/Height/NumberField.lean): Relative number-field admissible absolute values, with complex-place multiplicities and the product formula
- `mathlib:NumberField.totalWeight_eq_finrank` (Mathlib/NumberTheory/Height/NumberField.lean): The height instance has total weight [K:ℚ]
- `mathlib:NumberField.logHeight₁_eq` (Mathlib/NumberTheory/Height/NumberField.lean): Relative logarithmic coordinate height as the sum of archimedean local-degree weights and normalized finite places
- `mathlib:CommGroup.fg_of_descent'` (Mathlib/GroupTheory/Descent.lean): Height descent: finite-index squares, nonnegative Northcott height and a uniform approximate parallelogram bound imply finite generation. The generated additive declaration AddCommGroup.fg_of_descent′ has the identical doubling hypotheses and is confirmed by Lean; the textual index lists only the multiplicative head.
- `mathlib:Matrix.det_vandermonde` (Mathlib/LinearAlgebra/Vandermonde.lean): Over a commutative ring, det(vandermonde v)=Π_iΠ_(j>i)(v_j−v_i).
- `mathlib:Matrix.mul_apply` (Mathlib/Data/Matrix/Mul.lean): Matrix multiplication entry is the finite sum Σ_j M_ij N_jk for Fintype middle index, Mul and AddCommMonoid.
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_nonneg` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): Nonnegativity of canonicalHeight on elliptic points with admissible absolute values.
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): For an elliptic Weierstrass curve, canonicalHeight P = 0 iff P is torsion, assuming Northcott finiteness for canonicalHeight.
- `tauceti:TauCeti.GlobalNumberFields.weakApproximation_denseRange` (TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean): For a number field K and finite sets of finite and infinite places, the diagonal K is dense in the product of their actual completions. Finite-place factors are adic completions and infinite-place factors are InfinitePlace.Completion.
- `mathlib:NumberField.Units.sum_mult_mul_log` (Mathlib/NumberTheory/NumberField/Units/Basic.lean): For a number-field integer unit, the sum over infinite places of local degree times log absolute value is zero; with one complex place this forces absolute value 1.
- `mathlib:NumberField.Units.mem_torsion` (Mathlib/NumberTheory/NumberField/Units/Basic.lean): A number-field integer unit is torsion exactly when its absolute value at every infinite place is 1; the same module supplies finite cyclicity of that torsion subgroup.
- `mathlib:NumberField.Units.even_torsionOrder` (Mathlib/NumberTheory/NumberField/Units/Basic.lean): The torsion-unit cardinality is even, via the element −1 of order 2 in characteristic zero.
- `mathlib:IsPrimitiveRoot.lcm_totient_le_finrank` (Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean): In a finite-dimensional field extension, primitive roots of orders p and q and irreducibility of the lcm cyclotomic polynomial imply φ(lcm(p,q))≤finrank. With q=1 this bounds the order of a primitive unit in a quadratic number field.
- `mathlib:Polynomial.cyclotomic.irreducible_rat` (Mathlib/RingTheory/Polynomial/Cyclotomic/Roots.lean): For n>0, the n-th cyclotomic polynomial over ℚ is irreducible.

## Supplier contracts

Each contract states a requested output and its actual consuming nodes.
The named owner may need the stated extension; a stage name is not a proof.

### `AutomorphicLFunctionsAndLocalFactors:AL.3`

For GL₂ and a quadratic torus character with matching centre, construct the local base-change epsilon factors and prove the Rankin-over-F comparison by ηv(−1), with fixed ψv and self-dual measures. Existing GL_n×GL_{n−1} factors are not this quadratic base-change interface.

Needed by: `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`, `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`.

### `HeightsRationalPointsAndObstructions:RP.0`

General line-bundle Weil heights on projective abelian varieties; bounded-error tensor and pullback laws; the canonical quadratic limit for symmetric L; its uniqueness, positivity for ample L and torsion zero locus using Northcott; compatible relative/absolute normalization and finite-extension local-degree formula. Supply rational scalar extension of the quadratic form. Existing height-class nodes do not yet provide this machine.

Needed by: `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`, `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`, `GrossZagierAndArithmeticHeights:GZ.0/canonical-height-rational`.

### `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`

The actual dual and twice-rigidified Poincaré line, contravariant dual pullback and biduality. Its algebraic bilinear laws are separately supplied by A2/mumford-map-and-biextension. GZ.1 applies the general height machine to these lines.

Needed by: `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`.

### `HeightsRationalPointsAndObstructions:RP.1`

General Mordell–Weil finite generation for A over a number field from weak descent and the Northcott height argument; reduce the descent height step to Mathlib AddCommGroup.fg_of_descent'.

Needed by: `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing`.

### `ArakelovGeometryAndAbelianHeights:R35.1`

Hermitian rational line bundles, Green arithmetic divisors, finite/infinite arithmetic degrees and the product formula with conjugation-compatible metrics; GZ.2 specializes this infrastructure to curve intersections.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`.

### `AbelianSchemesAndArithmeticModuli:A2`

Canonical principal polarization of the Jacobian and comparison of its theta bundle with the rigidified Poincaré bundle; the full polarization is one half of that for Θ+[-1]*Θ.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.3`

Weight-two Shimura-Jacobian constituent comparison: rational Hecke summands and Hom⁰(J_U,A), their multiplicity one, coefficient field degree equal to dim A, End_F⁰(A) and compatibility with the rational Jacquet–Langlands model. The existing rational-model node supplies transfer descent but not this geometric realization.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/strict-gl2-realization`.

### `NeronModelsAndSemistableAbelianVarieties:R11.1`

The minimal invariant differential lattice of an elliptic Néron model, pullback under isogenies and its local valuation; needed to compare Manin constants across an isogeny class.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `GrossZagierAndArithmeticHeights:GZ.3/manin-isogeny-twist-transfer`.

### `ModularCurvesPartII:R14.1`

Proper cycle push-forward with generic residue-degree multiplicities, base-change/push-pull and the passage from divisor correspondences on X×X to Hom(J,J∨). Use existing algebraic cycles, rather than replacing a cycle by its reduced image.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle`.

### `ModularCurvesPartII:R14.2`

Hecke double-coset correspondences on finite-level modular/Shimura curves, their convolution with multiplicities and action on Pic⁰, with level compatibilities.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle`.

### `HeegnerPointEulerSystems:HE.1`

CM points on the finite-level quaternionic tower, their connected-component labels, ring-class field of definition, reciprocity and Hecke/level transport, with the chosen Artin convention.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class`.

### `AutomorphicSpectralTheory:AS.3`

Meromorphic continuation of the mixed incoherent Eisenstein kernel, compact-parameter derivative bounds, regularized torus integration and its constant-term subtraction, including justification of all derivative/integral exchanges.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/incoherent-central-derivative`.

### `AutomorphicSpectralTheory:AS.4`

Holomorphic/cuspidal constituent projection with Petersson adjunction, annihilation of constants/Eisenstein/old components in the new constituent, and compatibility with the relevant theta/correspondence kernels.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-theta-lifting`, `GrossZagierAndArithmeticHeights:GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity`.

### `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`

P-divisible groups and deformations over nilpotent thickenings as in the R07.2 stage contract, with lifting of endomorphisms. GZ.7 proves the CM-specialized lifting length and its residue/different normalization from YZZ Chapter 8; canonical/quasicanonical CM filtrations remain exact CM.5/HE.2 requests.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/good-local-arithmetic-identity`.

### `TropicalAndBerkovichArithmetic:TB.3`

Connected compact metric-graph Laplacian Δf=−f″dx−Σ outgoing slopes δv; existence and symmetry of the normalized Green kernel for a probability measure; effective resistance, bridge infinity and edge-subdivision compatibility. GZ.2 supplies the genus-weighted canonical-divisor admissibility condition, not this generic graph theory.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`, `GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure`.

### `TropicalAndBerkovichArithmetic:TB.2`

Skeleton inclusion and retraction for split semistable curves over a complete discretely valued field not assumed algebraically closed, with finite-Galois descent and unit edge normalization. The existing TB.2 skeleton nodes assume an algebraically closed base and are insufficient as stated.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`.

### `TropicalAndBerkovichArithmetic:TB.6`

Model metric and Chambert-Loir Chern measure comparison c₁(O(f))=−i*(Δf) for norm ‖1‖=eK^(−f∘r), including finite-extension normalization and approximation of graph functions.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure`.

### `AutomorphicSpectralTheory:AS.4`

The compact Riemann-surface Green operator with logarithmic singularity, zero-mean inverse of ddᶜ on zero-mass currents, self-adjointness and smooth off-diagonal regularity; holomorphic one-form hermitian pairing.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arakelov-probability-form`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-metric-existence`, `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green`.

### `AutomorphicSpectralTheory:AS.4`

Petersson projection onto parallel-weight-two cuspidal forms in each central-character component, its pairing characterization, the regularized Whittaker integral formula and growth hypotheses used by YZZ Proposition6.12. Apply under the two-split-place assumption; do not assume the derivative is square integrable without that growth argument.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/colmez-projected-derivative`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-archimedean-holomorphic-projection-of-log`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`

Existing local/adelic GL₂ Iwasawa decomposition, upper-triangular modulus δ_B(diag(a,d))=|a/d| and real positive diagonal convention. GZ.6 defines δ=δ_B^(1/2), the real phase ρ∞, and proves its lower-unipotent identity in the pseudo-theta comparison.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-comparison`, `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein`.

### `MetaplecticAutomorphicForms:MP.5`

Extended Weil action r(g,(t₁,t₂)) on S̄(V×A×), its Gaussian real factors, orthogonal-direct-sum factorization, complement discriminant characters, Fourier/Hecke action and theta convergence for the unit-quotient positive-definite and incoherent quaternionic data.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-theta`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-comparison`, `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-nonzero-theta`.

### `AutomorphicSpectralTheory:AS.2`

Meromorphic Eisenstein/Green-resolvent families and Legendre Q_s(t)=∫₀∞(t+√(t²−1)cosh u)^(−1−s)du, t>1; the CM Green sum initially convergent for Re s>0 with simple-pole continuation at zero. Include zero/nonzero Whittaker branch intertwiner continuation.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-archimedean-derivative-kernel`.

### `AutomorphicLFunctionsAndLocalFactors:AL.1`

Local additive-character different and self-dual measures, Weil-index/L-factor normalizations, quadratic norm cosets including wild ramification and representation-density Whittaker shell formula. The local norm-congruence shell counts require exact quadratic norm lattices, Haar shell volumes, wild different exponents and finite-support estimates. These are requested extensions of the local quadratic-character/density interface; RP.2 Brauer–Manin evaluation does not supply them.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-local-whittaker-series-for-incoherent`.

### `ComplexMultiplicationAndExplicitReciprocity:CM.5`

Gross canonical/quasicanonical lifting with endomorphism filtration O_E+π_E^(m−1)O_B, and wild norm conductor v(D); derive the corrected half-valuation ramified CM multiplicity. Distinguish this reusable deformation input from GZ’s weighted height series.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-corrected-cm-multiplicity-at-split`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-inert`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-ramified`.

### `HeegnerPointEulerSystems:HE.2`

CM-point reduction and ordinary intersection multiplicities on quaternionic Shimura curves: Zhang’s upper/lower-unipotent formula, plus compatibility with finite-level projection and residue-prime weights.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`.

### `HilbertModularVarietiesAndShimuraCurves:R18.5`

Finite-level CM class quotient, field-of-definition reciprocity and unramifiedness above division places; compact coarse Q-factorial integral models after permitted unramified base change; chosen maximal order containing O_E; regular small-away-v covers with U′v=Uv and stabilizer multiplicity e; split-fibre component decomposition.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/colmez-torus-average`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-split-zero`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-modified-projection`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-hodge-class-terms-vanish-and`.

### `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`

Čerednik–Drinfeld formal/integral upper-half-plane uniformization at division places, components GL₂(Fv)/Fv×GL₂(Ov), their local intersections and CM fixed sections; conventions for nearby B(v).

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-superspecial-m`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-pseudo`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-small-level-diagonal`.

### `HeightsRationalPointsAndObstructions:RP.0`

Canonical Jacobian height for 2Θ, positivity modulo torsion and complex Hermitian extension; specialize the general ample canonical-height machine, without redefining it in GZ.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality`, `GrossZagierAndArithmeticHeights:GZ.0/classical-relative-field-heights`, `GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-product-formula`, `GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height`.

### `HeegnerPointEulerSystems:HE.1`

Ideal-class CM points and Hecke correspondences on X₀(N), field-of-definition and Artin reciprocity with the source ideal-inverse convention. Extend the existing HE.1 non-exceptional classical interface to D=−3 and D=−4 where needed, retaining automorphism stabilizers rather than silently imposing u=1.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness`, `GrossZagierAndArithmeticHeights:GZ.0/classical-cm-action-conventions`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits`, `GrossZagierAndArithmeticHeights:GZ.2/classical-archimedean-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-intersection-height`, `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement`, `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`.

### `AbelianSchemesAndArithmeticModuli:A6`

Hom/End of chosen cyclic N-isogeny diagrams over complete local and Artinian bases; degree equality, finite positive-degree fibres, free sign action and faithful stabilizer action. Do not assert choice-independent Hom for arbitrary coarse Artinian points with extra automorphisms.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `GrossZagierAndArithmeticHeights:GZ.7/classical-prime-to-p-hom-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-quaternion-realization`.

### `HeegnerPointEulerSystems:HE.2`

Quasicanonical CM lifting/isogeny intersection calculation over W, including the prime-to-p degree decomposition and the valuation normalization used in the classical Hom sum.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-degree-one-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-intersection-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-isomorphism-intersection-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length`.

### `ComplexMultiplicationAndExplicitReciprocity:CM.5`

Exact negative-norm coset/congruence lifting count in the quaternionic CM deformation order, including ramified and dyadic ranges.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing`, `GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length`, `GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model`.

### `ComplexMultiplicationAndExplicitReciprocity:CM.5`

Canonical ordinary CM lifting and fullness of reduction on CM Hom/End; prove the classical new-Hom vanishing at split places.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing`, `GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length`, `GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model`.

### `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances`

Quaternionic norm-positive/anti-linear decomposition compatible with the embedded K and reduced norm, including norm/degree ratio for connecting Hom ideals.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-hyperbolic-norm-parameter`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-norm-ideal-map`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model`.

### `ComplexMultiplicationAndExplicitReciprocity:CM.5`

Gross canonical-lift endomorphism filtration over W/π^n, in the source uniformizer convention; distinguish inert and ramified lengths and state the dyadic exceptions.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing`, `GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length`, `GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model`.

### `ComplexMultiplicationAndExplicitReciprocity:CM.5/supersingular-curve-versus-level-pair`

The actual supersingular curve and cyclic-level-pair endomorphism orders, maximal versus Eichler with discriminants p versus Np, and their tracked reduced optimal CM embeddings. GZ.7 proves the connecting Hom ideal identities and orientation-sensitive coefficient ratio.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-hom-lattice`.

### `AnalyticNumberTheory:AN.4`

Genus characters of the ideal class group, ordered fundamental discriminant factorizations, quadratic character evaluations and theta transformation under ramified ideals.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits`, `GrossZagierAndArithmeticHeights:GZ.7/classical-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-congruence-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-character-filter`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-height-sum`, `GrossZagierAndArithmeticHeights:GZ.0/classical-genus-character-factorization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-reversal`, `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`, `GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`, `GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition`, `GrossZagierAndArithmeticHeights:GZ.5/classical-genus-sum-filter`.

### `AnalyticNumberTheory:AN.4`

The norm representation and genus criterion with Nn+l≡0 mod D and l a norm from the specified class. This hypothesis is necessary for the divisor complement identities.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits`, `GrossZagierAndArithmeticHeights:GZ.7/classical-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-congruence-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-character-filter`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-height-sum`, `GrossZagierAndArithmeticHeights:GZ.0/classical-genus-character-factorization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-reversal`, `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`, `GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`, `GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition`, `GrossZagierAndArithmeticHeights:GZ.5/classical-genus-sum-filter`.

### `AutomorphicSpectralTheory:AS.4`

Regularized Petersson holomorphic projection in weight two with logarithmic cusp growth, Fourier Mellin finite parts, continuation bounds and orthogonality of boundary Eisenstein families.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-holomorphic-projection`.

### `HeegnerPointEulerSystems:HE.1`

The field-of-definition and complex conjugation of classical Heegner points and their modular images, in the source Artin/Fricke convention.

Needed by: `GrossZagierAndArithmeticHeights:GZ.0/classical-twist-real-period`.

### `AutomorphicLFunctionsAndLocalFactors:AL.3`

Identify the arithmetic ideal-class character sum with the GL₂/K base-change Rankin L-function, including every p|N Euler factor and the arithmetic weight-2k shift s↦s−k+1/2. Supply its analytic continuation and exact completed gamma factors. Include the arithmetic-to-unitary coefficient normalization and absolute convergence for Re(s)>k+1/2, for both the ideal-class series and character Euler product, with the ideal-count bound r_A(n)≪_ε n^ε and a strict convergence margin.

Needed by: `GrossZagierAndArithmeticHeights:GZ.0/classical-rankin-normalization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.6/classical-absolute-convergence`.

### `AnalyticNumberTheory:AN.4`

Integral ideal counts by class/norm, finite Fourier inversion, ordered discriminant genus characters, norm/genus congruence criterion and the corrected prime-log decomposition. The genus/sign inputs are general arithmetic; GZ owns only the coefficient/kernel formulas consuming them.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`, `GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count`.

### `AutomorphicSpectralTheory:AS.2`

Scalar level-N weight-one-character Eisenstein families and their zero/nonzero Fourier coefficients; hyperbolic Legendre resolvent with eigenvalue s(s−1), residue −12/[SL₂(ℤ):Γ₀(N)], cusp continuation and CM evaluation. Keep PSL₂ quotient, cusp widths, phases and squared-log normalization explicit.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-residue`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cusp-expansion`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-zero-coefficient`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-nonzero-coefficient`.

### `MetaplecticAutomorphicForms:MP.7`

Classical ideal-class theta series of weight one and character ε, constant r_A(0)=1/w, their ramified cusp transforms and the half-integral-weight/GL₂ theta correspondence used by the arithmetic Rankin kernel.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-unfolding`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing`.

### `ModularCurvesPartII:R14.5`

Hecke algebra/Fourier coefficient perfect pairing for weight-two cuspidal forms and the Jacobian, trace adjunction, newform orthogonal projection and prime-to-level detection on the newform subspace.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality`, `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-adjunction`, `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-to-level-detection`, `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-orthogonality`.

### `HeightsRationalPointsAndObstructions:RP.0`

Local Néron symbols for degree-zero divisors, with principal-divisor law, tangent extension at common support and its parameter-change law; regular-model comparison with −intersection·log(q_v); relative field-height comparison.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-product-formula`, `GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height`, `GrossZagierAndArithmeticHeights:GZ.0/classical-relative-field-heights`.

### `AutomorphicLFunctionsAndLocalFactors:AL.0`

Generic special-function realization of the terminating polynomial p_(k−1)(t)=Σ_(r=0)^(k−1) binom(k−1,r)(−t)^r/r! and the decaying q_(k−1)(t)=∫₁∞(x−1)^(k−1)x^(−k)e^(−xt)dx, with gamma/Mellin/Legendre continuation identities and permitted differentiation. Confirm the polynomial source normalization before choosing a pinned polynomial API.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-integral-kernel-values`, `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-mellin-regularization`.

### `MetaplecticAutomorphicForms:MP.7`

Baruch–Mao 2010 Theorems1.2,1.4, the Kohnen-plus Maass eigenline correspondence including its Hecke operator at 2, and the local real/2-adic Whittaker-normalization comparison. DIT’s unit half-weight vector uses coefficient b(d) and factor 12π; the corresponding GL₂ parameter is r and the half-weight parameter r/2.

Needed by: `GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value`.

### `AutomorphicLFunctionsAndLocalFactors:AL.3`

Finite Maass twist L(s,φ⊗χ_d), its ramified Euler factors and both signed real gamma factors; distinguish its finite Dirichlet series from the completed automorphic L-function.

Needed by: `GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`

Dual graph of a semistable fibre, vertex component genera and residue-field/Galois action; incidence valences and bridge/loop convention compatible with the metrized graph.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`

Finite arithmetic-surface intersection of horizontal and vertical Cartier divisors, projection formula, vertical intersection matrix with kernel the total fibre; admissible vertical correction modulo that fibre.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-modified-projection`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`

Regular/minimal proper curve models over complete and number-field DVRs, finite-level model changes, blow-up invariance of the corrected degree-zero pairing.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`

Semistable reduction and base change of component/intersection data, including non-split Galois descent and edge-length change by ramification.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension`, `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`

Jacobian Pic⁰ and Abel–Jacobi map over the actual ground field, descent for rational degree-one divisor classes, normalized Hodge class ξ and compatibility with Hecke correspondences.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions`, `GrossZagierAndArithmeticHeights:GZ.3/rational-xi-realization`, `GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class`.

### `SmoothRepresentationsOfLocalGroups:SR.2`

χ-equivariant continuous/smooth toric Hom functor on an admissible local representation and contragredient, with invariants and scalar extension; real/complex topological conditions are separate.

Needed by: `GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space`.

### `HeegnerPointEulerSystems:HE.0`

The imaginary quadratic order, its ideal-class group and Hilbert/ring-class extension, with Artin reciprocity in the inverse-ideal convention used here. This supplies order and class-field data; the CM-point and Hecke construction is separately requested from HE.1.

Needed by: `GrossZagierAndArithmeticHeights:GZ.0/classical-cm-action-conventions`, `GrossZagierAndArithmeticHeights:GZ.2/classical-archimedean-height-sum`, `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement`, `GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants`, `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-intersection-height`, `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`.

### `ModularCurvesPartII:R12.5`

Weight-two differentials on the compactified modular curve and the differential/q-expansion comparison at the chosen cusp; GZ.3 owns the Manin-constant comparison with the Néron differential.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`, `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `GrossZagierAndArithmeticHeights:GZ.7/boundary-cusp-correction`.

### `ModularCurvesPartII:R13.3`

Tate-curve cusp charts, cusp widths, stabilizer actions and the local differential/discriminant data on the integral level model.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`, `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `GrossZagierAndArithmeticHeights:GZ.7/boundary-cusp-correction`, `GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height`.

### `ModularCurvesPartII:R13.4a`

Compactified coarse X₀(N), coarse stabilizer multiplicities and descent of the relevant generic line data.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`, `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `GrossZagierAndArithmeticHeights:GZ.7/boundary-cusp-correction`, `GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height`.

### `ModularCurvesPartII:R14.6`

Bad-prime integral differential extension and patching for the modular parametrization. Combined with the exact Raynaud uniqueness input already requested, this supplies the integral-model hypotheses used in the Manin integrality and modular-degree arguments; it does not supply a Hodge line.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit`, `GrossZagierAndArithmeticHeights:GZ.3/manin-degree-divisibility`.

### `AutomorphicFormsOnReductiveGroups:AF.2`

Adelic/classical comparison and restricted tensor factorization in the exact central-character and parallel-weight-two constituent.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison`.

### `AutomorphicFormsOnReductiveGroups:AF.3`

Petersson pairing of cuspidal weight-two forms with the specified unnormalized and Tamagawa Haar measures and rapid decay.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison`.

### `ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`

The Hecke-equivariant weight-two modular-curve Hodge/Betti comparison, with its i-orientation and integral lattice.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison`.

### `ModularCurvesPartII:R14.3/cup-product-petersson`

The existing cup-product/Petersson comparison on X₁(N), including its 4π factor and pairing orientation.

Needed by: `GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison`.

### `ModularCurvesPartII:R14.2/jacobian-and-functoriality`

The existing Pic⁰/Jacobian functoriality and dual pullback/push-forward for modular curves, including degree multiplicity.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`.

### `ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`

The existing Jacobian Hecke and diamond operations with their pullback/Albanese conventions and Néron extension.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`.

### `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic`

The existing scalar classical-to-adelic GL₂ weight/character/level passage, including moderate-growth conditions and the chosen slash action. Include nonholomorphic functions with polynomial growth at every cusp, not just cuspidal or holomorphic forms; use AS.3 for the corresponding Petersson-integrability/growth estimates.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel`.

### `AutomorphicFormsOnReductiveGroups:AF.2/adelic-classical-bijection`

The existing inverse classical/adelic function-space comparison with the exact central character and level.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel`.

### `ModularCurvesPartII:R12.3`

Compactification by generalized elliptic curves and cyclic level diagrams with their cusp extension.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-height-green-characterization`, `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component`, `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-coset-classification`, `GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height`.

### `ModularCurvesPartII:R13.3`

Tate cusp charts and stabilizer-aware local integral level models, with cusp widths and local parameters.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-height-green-characterization`, `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component`, `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-coset-classification`.

### `ModularCurvesPartII:R13.4a`

The compactified coarse integral modular curve with the stated smoothness/normality and stabilizer quotient hypotheses.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-height-green-characterization`, `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component`, `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-coset-classification`.

### `ModularCurvesPartII:R13.4b`

Comparison of the compactified coarse model with the generic modular curve and its integral local charts.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-height-green-characterization`, `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component`, `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-coset-classification`, `GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`

Actual nonarchimedean irreducible admissible GL₂ representations and their generic/essentially-square-integrable classification, including residue characteristic two.

Needed by: `GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.1/local-quaternionic-comparison`

Existing local quaternionic Jacquet–Langlands, central characters, norm twists and split/elliptic character signs.

Needed by: `GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.1/real-quaternionic-comparison`

Existing real discrete-series/quaternionic comparison including the norm twist and matching central character.

Needed by: `GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space`.

### `AbelianSchemesAndArithmeticModuli:A2/mumford-map-and-biextension`

Existing algebraic Mumford map and double-rigidified biextension with additivity in both factors and pullback law.

Needed by: `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`.

### `AbelianSchemesAndArithmeticModuli:A2/polarization-representatives-and-graph`

Existing graph pullback of Poincaré with φ_M=2λ, supplying the factor-two polarization comparison without choosing a global representative.

Needed by: `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`

Use its full real period Ω(E)=2∫_{D_W>0} dx/√D_W on the reduced minimal model over ℚ, including finiteness and the fixed equation differential. GZ.0 proves the identity-component comparison and c∞ factor; these are not claimed as existing exports of Layer7.

Needed by: `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`.

## Remaining proof, carrier and edition gates

### YZZ Picard modularity and bad-place proof comparisons

The public 2011 draft statements and normalization passages for the Picard series, arithmetic theta lift, projected kernel identity, nonzero degenerate data, nearby-coherent reduction and good local identity have been independently read at the cited locators. The full Chapter4 modularity proof, all integral trace comparisons and every bad-place approximant case remain proof-construction work in the stated prerequisite/gap plan. The 2013 publication is a separate unread edition; no source excerpt is required.

Needed by: `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-theta-lifting`, `GrossZagierAndArithmeticHeights:GZ.7/good-local-arithmetic-identity`, `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation`.

### Arithmetic carriers absent from the pinned baseline

General algebraic line bundles with point-height machine, dual/Poincaré biextension, arithmetic Green divisors and the actual quaternionic/toric automorphic carriers are not all available as pinned Lean interfaces. Suggested signatures omit conditions that cannot yet be stated; the mathematical packet retains their full hypotheses. Supplier requests must be realized before those arithmetic signatures and their tests can elaborate.

Needed by: `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`, `GrossZagierAndArithmeticHeights:GZ.1/coefficient-valued-height`, `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing`, `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension`, `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`, `GrossZagierAndArithmeticHeights:GZ.3/rational-xi-realization`, `GrossZagierAndArithmeticHeights:GZ.3/composition-pairing`, `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space`, `GrossZagierAndArithmeticHeights:GZ.4/normalized-toric-integral`, `GrossZagierAndArithmeticHeights:GZ.4/admissible-toric-order`, `GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle`, `GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class`, `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-height-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-classes`.

### Genus-one resistance-measure proof

Yuan’s author manuscript Proposition A.5 proves c₁(ωa)=(2g−2)i*μ; comparing this with (2g−2)μa gives the stated formula only for g>1. A separate proof from an admissible degree-one bundle or the good/Tate genus-one models is required. The formula is planned for g>0, with this missing argument explicit.

Needed by: `GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure`.

### Elliptic and level tensor comparison refinement

The tensor, modified-pairing and global Δ comparisons are now planned explicitly from Conrad Theorem9.2, Theorem9.6, Lemma10.1 and Theorems10.4–10.5. Remaining work is to realize their integral deformation/coarse-coordinate carriers and specialized tests in Lean. Mathematical downstream formulas use I_v^GZ and the discriminant correction; they do not identify them with arbitrary cotangent local symbols.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length`, `GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-modified-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tensor-global-decomposition`.

### Historical definite central-value announcement

Gross–Zagier V §3 only announces proportionality. Nodes use the already specified normalized coherent Waldspurger identity instead; matching its exact scalar and rational eigenspace with the historical b_m,A vector needs the definite theta-coefficient comparison from the toric/theta suppliers.

Needed by: `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement`, `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-square-class`.

### Half-weight Waldspurger proof normalization

DIT (5.17) is read in the version of record. Its cited Baruch–Mao 2010 local proof and complete 2-adic plus-space dictionary have not been acquired in this run; S6 of the reviewed extraction remains a precise source-proof gate. The supplier request must establish the 12π comparison, both signs of d and unit half-weight norm; the explicit target is planned, not certified by quotation alone.

Needed by: `GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value`.

### Nilpotent p-divisible deformation extension

R07.2 owns the exact requested nilpotent p-divisible deformation and endomorphism-lifting extension, but its current finer packet supplies classification over perfect residue fields. No deformation equivalence is inferred from that classification. GZ.7 owns the CM lifting-length calculation, and CM.5/HE.2 supply the requested CM endomorphism/level filtrations. The ownership refinements in revision.ownershipResolutions describe requests, not completed mathematics.

Needed by: `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-hom-lattice`.

### Unacquired publication editions

The 2013 YZZ book, 2026 published version of Yuan’s bigness paper, and 2023 published Colmez erratum have not been acquired by this revision. The reader identifies the actual 2011, 2024 and two 2022 author versions read; no pagination, theorem numbering or changed hypothesis is transferred between them. This is an edition-evidence gate. The original 224 clipping/version verdicts remain historical, rather than a requirement to deposit source passages contrary to the standing own-words rule.

Needed by: `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`, `GrossZagierAndArithmeticHeights:GZ.1/coefficient-valued-height`, `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing`, `GrossZagierAndArithmeticHeights:GZ.1/elliptic-poincare-comparison`, `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension`, `GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions`, `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`, `GrossZagierAndArithmeticHeights:GZ.3/rational-xi-realization`, `GrossZagierAndArithmeticHeights:GZ.3/strict-gl2-realization`, `GrossZagierAndArithmeticHeights:GZ.3/composition-pairing`, `GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison`, `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`, `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization`, `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`, `GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class`, `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-height-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/incoherent-central-derivative`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-theta-lifting`, `GrossZagierAndArithmeticHeights:GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity`, `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-classes`, `GrossZagierAndArithmeticHeights:GZ.7/good-local-arithmetic-identity`, `GrossZagierAndArithmeticHeights:GZ.7/nearby-coherent-orthogonality`, `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation`, `GrossZagierAndArithmeticHeights:GZ.2/arakelov-probability-form`, `GrossZagierAndArithmeticHeights:GZ.2/archimedean-admissible-metric`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-green-function`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-metric-existence`, `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green`, `GrossZagierAndArithmeticHeights:GZ.2/arakelov-dualizing-metric`, `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`, `GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure`, `GrossZagierAndArithmeticHeights:GZ.2/real-admissible-descent`.

### Typed geometric signature and test realization

Every target now has a signaturePlan recording its proposed declaration, every API name and every mathematical test, the actual retained signature/fragment/example where present, and the specific missing carriers with direct owner inputs. The same ledger is in the Lean file and reader. Six GZ.0 targets have typed signatures and tests at the pin. The remaining targets require the named geometric specialization; AlgebraicFragments examples check only their algebraic operations. Instantiate the mathematical tests after the real supplier carriers exist, without scalar equations or proposition-valued substitutes.

Needed by: `GrossZagierAndArithmeticHeights:GZ.0/trace-versus-average`, `GrossZagierAndArithmeticHeights:GZ.0/artin-map-convention`, `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`, `GrossZagierAndArithmeticHeights:GZ.0/root-number-and-measure-normalisation-corrections`, `GrossZagierAndArithmeticHeights:GZ.0/identity-rescaling`, `GrossZagierAndArithmeticHeights:GZ.1/neron-tate-height-and-the-poincare-pairing`, `GrossZagierAndArithmeticHeights:GZ.1/coefficient-valued-height`, `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing`, `GrossZagierAndArithmeticHeights:GZ.1/elliptic-poincare-comparison`, `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-arithmetic-extension`, `GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions`, `GrossZagierAndArithmeticHeights:GZ.3/normalised-hodge-class-and-xi-parametrised-realisation`, `GrossZagierAndArithmeticHeights:GZ.3/rational-xi-realization`, `GrossZagierAndArithmeticHeights:GZ.3/strict-gl2-realization`, `GrossZagierAndArithmeticHeights:GZ.3/composition-pairing`, `GrossZagierAndArithmeticHeights:GZ.3/petersson-composition-comparison`, `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`, `GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit`, `GrossZagierAndArithmeticHeights:GZ.3/manin-isogeny-twist-transfer`, `GrossZagierAndArithmeticHeights:GZ.3/manin-degree-divisibility`, `GrossZagierAndArithmeticHeights:GZ.4/toric-hom-space`, `GrossZagierAndArithmeticHeights:GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional`, `GrossZagierAndArithmeticHeights:GZ.4/normalized-toric-integral`, `GrossZagierAndArithmeticHeights:GZ.4/unramified-toric-value`, `GrossZagierAndArithmeticHeights:GZ.4/admissible-toric-order`, `GrossZagierAndArithmeticHeights:GZ.4/toric-test-vectors`, `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization`, `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`, `GrossZagierAndArithmeticHeights:GZ.5/toric-period-nonvanishing`, `GrossZagierAndArithmeticHeights:GZ.5/finite-vector-variation`, `GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle`, `GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class`, `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-height-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/incoherent-central-derivative`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-theta-lifting`, `GrossZagierAndArithmeticHeights:GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity`, `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-classes`, `GrossZagierAndArithmeticHeights:GZ.7/good-local-arithmetic-identity`, `GrossZagierAndArithmeticHeights:GZ.7/nearby-coherent-orthogonality`, `GrossZagierAndArithmeticHeights:GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation`, `GrossZagierAndArithmeticHeights:GZ.7/boundary-cusp-correction`, `GrossZagierAndArithmeticHeights:GZ.2/arakelov-probability-form`, `GrossZagierAndArithmeticHeights:GZ.2/archimedean-admissible-metric`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-green-function`, `GrossZagierAndArithmeticHeights:GZ.2/admissible-metric-existence`, `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green`, `GrossZagierAndArithmeticHeights:GZ.2/arakelov-dualizing-metric`, `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`, `GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure`, `GrossZagierAndArithmeticHeights:GZ.2/real-admissible-descent`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-theta`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-comparison`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-automorphic`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-weight-cancel`, `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-torus-average`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-local-k-c`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-projected-derivative`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-order-sandwich`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-inert`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-ramified`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-k-inert`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-k-ramified`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-c-arch`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-c-finite`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-series-automorphy`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-omega-self`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-proper`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-nonsplit-proper`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-ordinary-pairing`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-split-proper`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-height-decomposition-series`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-inert`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-ramified`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-division`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-n`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-superspecial-m`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-pseudo`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-split-zero`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-kernel-schwartz`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-cancel-nonsplit`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-cancel-split`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-nonzero-theta`, `GrossZagierAndArithmeticHeights:GZ.2/colmez-residue-line`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-arch`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-small-level-diagonal`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-modified-projection`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-finite`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-arithmetic-adjunction`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-s2-assumption`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-derivative-of-the-mixed-theta`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-archimedean-holomorphic-projection-of-log`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-local-whittaker-series-for-incoherent`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-archimedean-derivative-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-corrected-cm-multiplicity-at-split`, `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-hodge-class-terms-vanish-and`, `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series`, `GrossZagierAndArithmeticHeights:GZ.0/classical-rankin-normalization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-absolute-convergence`, `GrossZagierAndArithmeticHeights:GZ.6/classical-entire-functional-equation`, `GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality`, `GrossZagierAndArithmeticHeights:GZ.0/classical-relative-field-heights`, `GrossZagierAndArithmeticHeights:GZ.3/classical-eigendifferential-period`, `GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness`, `GrossZagierAndArithmeticHeights:GZ.0/classical-cm-action-conventions`, `GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol`, `GrossZagierAndArithmeticHeights:GZ.7/classical-height-green-characterization`, `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-residue`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cusp-expansion`, `GrossZagierAndArithmeticHeights:GZ.7/classical-marked-green-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-green-constant`, `GrossZagierAndArithmeticHeights:GZ.7/classical-archimedean-height`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-kernel-action`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-green-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-archimedean-height`, `GrossZagierAndArithmeticHeights:GZ.7/classical-atkin-lehner-invariance`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hyperbolic-norm-parameter`, `GrossZagierAndArithmeticHeights:GZ.7/classical-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-congruence-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-prime-discriminant-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-kernel-evaluation`, `GrossZagierAndArithmeticHeights:GZ.7/classical-orbit-kernel-evaluation`, `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-character-filter`, `GrossZagierAndArithmeticHeights:GZ.2/classical-archimedean-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-disjoint-archimedean-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-product-formula`, `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent`, `GrossZagierAndArithmeticHeights:GZ.7/classical-complex-tangent-asymptotic`, `GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-archimedean-height`, `GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-green-kernel`, `GrossZagierAndArithmeticHeights:GZ.7/classical-renormalized-self-value`, `GrossZagierAndArithmeticHeights:GZ.7/classical-self-value-orbit-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-total-archimedean-formula`, `GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height`, `GrossZagierAndArithmeticHeights:GZ.7/classical-degree-one-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/classical-norm-one-generators`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component`, `GrossZagierAndArithmeticHeights:GZ.7/classical-component-orthogonality`, `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-intersection-height`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-intersection-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set`, `GrossZagierAndArithmeticHeights:GZ.7/classical-prime-to-p-hom-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-isomorphism-intersection-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing`, `GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order`, `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-quaternion-realization`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-self-intersection-tangent`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length`, `GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values`, `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-total-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-total-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-split-total-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-level-intersection`, `GrossZagierAndArithmeticHeights:GZ.2/classical-p-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-split-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-hom-lattice`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-norm-ideal-map`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-height-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model`, `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-height-sum`, `GrossZagierAndArithmeticHeights:GZ.0/classical-genus-character-factorization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-unfolding`, `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-adjunction`, `GrossZagierAndArithmeticHeights:GZ.6/classical-mobius-level-decomposition`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel-pairing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-to-level-detection`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-transformation`, `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-coset-classification`, `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-combination`, `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-u-formula`, `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-eisenstein-combination`, `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-fourier-expansion`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-zero-coefficient`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-nonzero-coefficient`, `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-meromorphic-continuation`, `GrossZagierAndArithmeticHeights:GZ.6/classical-integral-kernel-values`, `GrossZagierAndArithmeticHeights:GZ.6/classical-central-kernel-holomorphy`, `GrossZagierAndArithmeticHeights:GZ.6/classical-coefficient-functional-equation`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-reversal`, `GrossZagierAndArithmeticHeights:GZ.6/classical-l-functional-equation`, `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums`, `GrossZagierAndArithmeticHeights:GZ.6/classical-central-value-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing`, `GrossZagierAndArithmeticHeights:GZ.6/classical-central-derivative-kernel`, `GrossZagierAndArithmeticHeights:GZ.6/classical-sign-multiplicativity`, `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`, `GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition`, `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-coefficient-parity`, `GrossZagierAndArithmeticHeights:GZ.6/classical-single-prime-logarithm`, `GrossZagierAndArithmeticHeights:GZ.5/classical-weight-two-central-value`, `GrossZagierAndArithmeticHeights:GZ.5/classical-central-value-endpoints`, `GrossZagierAndArithmeticHeights:GZ.5/classical-genus-sum-filter`, `GrossZagierAndArithmeticHeights:GZ.6/classical-holomorphic-projection`, `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-mellin-asymptotics`, `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-cusps`, `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-orthogonality`, `GrossZagierAndArithmeticHeights:GZ.6/classical-cusp-matrix-inverse`, `GrossZagierAndArithmeticHeights:GZ.6/classical-projection-boundary-coefficients`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-cusp-constants`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-boundary-coefficients`, `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-mellin-regularization`, `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-cuspform`, `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-coefficients`, `GrossZagierAndArithmeticHeights:GZ.7/classical-global-local-archimedean-sum`, `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-height-sum`, `GrossZagierAndArithmeticHeights:GZ.3/classical-modular-period-degree`, `GrossZagierAndArithmeticHeights:GZ.0/classical-twist-real-period`, `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement`, `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-square-class`, `GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value`, `GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height`, `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`, `GrossZagierAndArithmeticHeights:GZ.7/classical-modified-intersection`, `GrossZagierAndArithmeticHeights:GZ.7/classical-tensor-global-decomposition`.

### Split quaternion Shimizu comparison before the Waldspurger consumer

YZZ’s 2011 draft Proposition2.2.1, pp.47–49, separates the nonsplit Siegel–Weil proof from the split argument. Waldspurger1985 II.1–II.2, pp.182–187, has now been acquired and its Shimizu input and split Whittaker unfolding read. The remaining step is the exact normalized local/global contraction, including local factor comparisons and the source’s Shimizu input proof, translated to this packet’s toric probability and quaternionic Tamagawa forms. MP.6 supplies that analytic interface. GQT’s identity modulo the residual image alone does not remove this requirement, and GZ.5 cannot supply its own analytic prerequisite.

Needed by: `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization`, `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`.

## Source versions and inspection

The 2011 draft, 2013 publication and distinct errata files retain separate
identities. The 2013 publication and its inherited digest were not acquired in
this review. Its catalogue records are historical and are not new read claims.
Source statements here are in the planner/reviewer’s own words.

### Computing canonical heights on elliptic curves in quasi-linear time (`muller-stoll-2016`)

[Computing canonical heights on elliptic curves in quasi-linear time](https://arxiv.org/abs/1509.08748v2). J. Steffen Müller and Michael Stoll. arXiv:1509.08748v2 (22 Dec 2015); published in LMS J. Comput. Math. 19 (2016); accessed 2026-09-28

Recorded digest: `10576e85c77e8e7c590671840586bc4680e638d03daf7802e230a4897ac3384c`.

### The L-functions and modular forms database (`lmfdb-2026`)

[The L-functions and modular forms database](https://www.lmfdb.org/EllipticCurve/Q/37a1/). The LMFDB Collaboration. Web pages read 2026-09-28: elliptic curve 37.a1, and the knowls ec.canonical_height and ec.q.real_period

Current inspection 2026-10-10 (Codex — codex-57X7se): Read the accessible Cremona-label page. The LMFDB-label URL and two knowls returned CAPTCHA; no independent certification of those knowls is asserted.

**Passages checked.**

- 37.a1 curve page: generator(0,0), regulator and BSD real period with computation conventions

### Gross–Zagier revisited (`conrad-2004`)

[Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf). Brian Conrad (with an appendix by W. R. Mann). Heegner Points and Rankin L-Series, MSRI Publications 49 (2004) 67–163; SLMath library PDF; printed page = PDF page + 65; accessed 2026-09-28

Recorded digest: `31396cc7f513d6237155b6afa923c6ef76d2f37101db598d58bea25f0aa677ca`.

### Explicit Gross–Zagier and Waldspurger formulae (`cai-shu-tian-2014`)

[Explicit Gross–Zagier and Waldspurger formulae](https://arxiv.org/pdf/1408.1733v2). L. Cai, J. Shu and Y. Tian. arXiv:1408.1733v2

Recorded digest: `8d908543404abfbd9c1708ad9af696c4fb71595701bd67cb5bff11b3a8d6ac43`.

### Heegner points and derivatives of L-series (`gross-zagier-1986`)

[Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). B. H. Gross and D. B. Zagier. Invent. Math. 84 (1986), 225–320

Recorded digest: `a9a52cb8662e03f19ace81dcfbf24bf873bf9c46ba89a8c890727b9541abdbf5`.

Historical inspection 2026-10-07: Read the standing conventions, local kernels, tangent and Hom calculations, norm-ideal counts, unfolding, Fourier signs, central coefficients and logarithmic weight-two projection. OCR acquisition covers printed pp.225–320; ambiguous formula signs are reconciled with the amended source ledger and remain independent-review points.

**Passages checked.**

- I §§3–9; II §§1–5; III §§0–9; IV §§0–6; V §§1–3

Historical inspection 2026-10-07 (REV-GrossZagierAndArithmeticHeights--GZ.0): Read the primary text and inspected ambiguous formula images; checked genus signs, squaring fibres, ordinary higher derivatives and the source-error ledger independently. No inherited OCR-only excerpt certifies an ambiguous symbol.

**Passages checked.**

- Chapters I–V, printed pp.225–320; formula images at pp.229,250–251,263,284,298,300–302,312–313

### Gross–Zagier formula for GL(2) (`zhang-2010`)

[Gross–Zagier formula for GL(2)](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf). S.-W. Zhang. CRM lecture notes

Recorded digest: `1f46be497752b0795dbef8b06b423ef7bea5203096d3480c6da2642c333e73f0`.

### Erratum to The Gross–Zagier Formula on Shimura Curves (`yzz-gross-zagier-erratum`)

[Erratum to The Gross–Zagier Formula on Shimura Curves](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf). X. Yuan, S.-W. Zhang and W. Zhang. 28 June 2026

Recorded digest: `e4c4eaeb197ceaf18b02955d90a56e52e4776eca1f31c88c16074adaf19d8d1e`.

### Global divisibility of Heegner points and Tamagawa numbers (`jetchev-2008`)

[Global divisibility of Heegner points and Tamagawa numbers](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/475417137355BE27B3888862CADB0286/S0010437X08003497a.pdf/global_divisibility_of_heegner_points_and_tamagawa_numbers.pdf). D. Jetchev. Compositio Math. 144 (2008)

Recorded digest: `f887790bbbf0a1831685f697cfe20b403ca515be4c4176705efa24e3077307ed`.

### The Manin constant and the modular degree (`cesnavicius-neururer-saha-2022`)

[The Manin constant and the modular degree](https://arxiv.org/pdf/1911.09446). K. Česnavičius, M. Neururer and A. Saha. arXiv:1911.09446, 3 November 2022

Recorded digest: `4d76a0daf4ffa103a4a96f6fafe6de22c44e194cd2c47489c75be8967f1d5448`.

### Geometric invariants for real quadratic fields (`duke-imamoglu-toth-2016`)

[Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). W. Duke, Ö. İmamoğlu and Á. Tóth. Ann. Math. 184 (2016), 949–990

Recorded digest: `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61`.

Historical inspection 2026-10-07: Read the version-of-record normalization and both signs of fundamental discriminant. Baruch–Mao’s cited local proof is still a supplier/source gap.

**Passages checked.**

- §5, Theorem4, Fourier conventions and (5.17), pp.964–966

### On the averaged Colmez conjecture (`yuan-zhang-2018`)

[On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). X. Yuan and S. Zhang. Ann. Math. 187 (2018), 533–638

Recorded digest: `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507`.

Historical inspection 2026-10-07: Read the primary text, including zero/nonzero Whittaker branches, five local test functions, finite/archimedean multiplicities, pseudo-theta reduction and residue adjunction. Reconciled the amended extraction; inherited review verdicts are not presented as this worker’s independent certification.

**Passages checked.**

- §§6.2–9.2, pp.579–635

### The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula (`gan-qiu-takeda-2014`)

[The regularized Siegel–Weil formula (the second term identity) and the Rallis inner product formula](https://arxiv.org/pdf/1207.4709v3). W. T. Gan, Y. Qiu and S. Takeda. arXiv:1207.4709v3

Recorded digest: `cde6b7ad22b974d4159f8cedd1e14a00bf4b05ec977ab750b54fdceb067adac5`.

### Arithmetic bigness and a uniform Bogomolov-type result (`yuan-bigness-2026`)

[Arithmetic bigness and a uniform Bogomolov-type result](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf). X. Yuan. author manuscript 21 August 2024; Ann. Math. 203 (2026), 15–119 has not been acquired

Recorded digest: `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`.

Historical inspection 2026-10-07 (REV-GrossZagierAndArithmeticHeights--GZ.0): Checked metric/Green/residue normalizations, genus-one limitation of the canonical-bundle proof, and real descent. Any publication-version claim remains unverified.

**Passages checked.**

- Appendix A.1–A.6, pp.102–119

### The Gross-Zagier Formula on Shimura Curves (`yzz-gross-zagier-shimura-curves-2013`)

[The Gross-Zagier Formula on Shimura Curves](https://web.math.princeton.edu/~shouwu/publications.html). Xinyi Yuan; Shou-Wu Zhang; Wei Zhang. Annals of Mathematics Studies 184, Princeton University Press, 2013 (inspected 2026-09-15)

Recorded digest: `6a87b131febb325ea59259098117cc79dfeecbeae66f8ebaeac9fbd66e345337` (inherited, unverified publication).

### Gross–Zagier revisited (`conrad-author-2004`)

[Gross–Zagier revisited](https://math.stanford.edu/~conrad/papers/gzfinal.pdf). B. Conrad, with appendix by W. R. Mann. author final copy of MSRI Publications 49 (2004)

Recorded digest: `7eac62b943ebd035de37f40df6054e1300ba4a0f02356cca919635eef994fdbe`.

Historical inspection 2026-10-07: Read the cotangent normalization and its model/component hypothesis, the effective stabilizer norm argument and the non-elliptic eta tensor correction. These do not authorize deleting the elliptic/level terms.

**Passages checked.**

- §8 Theorem8.4 and Remarks8.5–8.6; §9 Theorem9.2 and full norm-coordinate proof, (9.9)–(9.11)

Historical inspection 2026-10-07 (REV-GrossZagierAndArithmeticHeights--GZ.0): Independently checked the stabilizer correction and the distinction between the modified GZ self-pairing and ordinary cotangent self-intersection; corrected the erroneous published-page parenthesis.

**Passages checked.**

- author §§8–10, especially pp.35–48; published Theorem9.2 pp.123–125 and Definition9.5 pp.126–127

### The Gross–Zagier Formula on Shimura Curves (`yzz-gross-zagier-shimura-curves-2011-draft`)

[The Gross–Zagier Formula on Shimura Curves](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail). Xinyi Yuan; Shou-Wu Zhang; Wei Zhang. Author draft dated 6 November 2011, 266 PDF pages; author-uploaded public copy. Distinct from the 2013 published book.

Recorded digest: `7a6b79df81cf5d88e8a4bfbad5a2a9502dcb7b4ac16631e3d270c69bb71a7235`.

Historical inspection 2026-10-10 (Codex — codex-XrDgP1): Inspected the stated mathematical passages in the browser, including Chapter5’s nonzero-data proof. This is not a certificate for all Chapter4 modularity or every bad-place case, and neither the inherited hash nor the 2013 edition is recertified.

**Passages checked.**

- §§2.1–2.4, pp.43–55; §§3.1–3.3, pp.70–99; §§3.6.2–3.6.4, pp.110–113; §4.2, pp.122–123; §4.4, pp.135–137; §§5.2–5.4, pp.185–193; §7.1, pp.217–224; §§7.4.2–7.4.3, pp.235–237; §8.1, pp.242–243; Proposition8.2.7, pp.248–249.

Current inspection 2026-10-10 (Codex — codex-57X7se): Read primary public browser text at exact theorem and page locations. Separate proofs remain construction gaps; no publication pagination was inferred from this draft. Browser access succeeded but direct PDF acquisition returned HTTP403, so no file digest is asserted.

**Passages checked.**

- §1.2.4–§1.6, pp.15–26; §1.6.7, pp.34–35
- §2.1.5–§2.4, pp.42–55
- §3.1.3, pp.70–71; §3.2.3–§3.3.3, pp.86–99
- §3.6, pp.109–113; §4.2, pp.121–122; §4.4, pp.134–137
- §5.1–§5.4, pp.182–193
- §7.1.1–§7.1.7, pp.217–224; §7.4, pp.233–237
- Propositions8.1.1 and8.2.7, pp.242–243 and248–249

### On Tunnell’s formula for characters of GL(2) (`saito-1993`)

[On Tunnell’s formula for characters of GL(2)](https://www.numdam.org/article/CM_1993__85_1_99_0.pdf). Hiroshi Saito. Compositio Mathematica 85 (1993), 99–108, Numdam published scan

Recorded digest: `a408e77de59464ed1a365169302c7a5518ec6628d9d2df59ac55395d90b366ea`.

Historical inspection 2026-10-10 (Codex — codex-XrDgP1): Read the stated primary passages and checked the displayed conventions. The unread normalization comparisons remain named gaps.

**Passages checked.**

- §1, pp.99–100: statement and conventions; §2, pp.100–108: local proof, including residue characteristic two.

### Sur les valeurs de certaines fonctions L automorphes en leur centre de symétrie (`waldspurger-1985`)

[Sur les valeurs de certaines fonctions L automorphes en leur centre de symétrie](https://www.numdam.org/item/CM_1985__54_2_173_0.pdf). Jean-Loup Waldspurger. Compositio Mathematica 54 (1985), 173–242, Numdam published scan

Recorded digest: `8617e704eceacf3ee5aa7c266b6f51db44b64e7d59622fc3a7de542e425a3158`.

Historical inspection 2026-10-10 (Codex — codex-XrDgP1): Read the stated primary passages and checked the displayed conventions. The unread normalization comparisons remain named gaps.

**Passages checked.**

- II.1, pp.182–184: Shimizu theorem and its input; II.2, pp.184–187: split Whittaker unfolding and Proposition3.

### Edixhoven, Minimal resolution and stable reduction of X₀(N) (`edixhoven-1990`)

[Edixhoven, Minimal resolution and stable reduction of X₀(N)](https://www.numdam.org/item/10.5802/aif.1202.pdf). Bas Edixhoven. Ann. Inst. Fourier40 (1990), pp.31–67

Current inspection 2026-10-10 (Codex — codex-57X7se): Read the primary public text confirming ordinary exceptional singularities on internal components for p>3. No small-characteristic extension is asserted.

**Passages checked.**

- §1.1.3, printed pp.34–35

## Extraction routing ledger

| Extraction item | Disposition | Node or supplier |
| --- | --- | --- |
| `PAPER-YUAN-26/190` | planned | `GrossZagierAndArithmeticHeights:GZ.2/arakelov-probability-form` |
| `PAPER-YUAN-26/191` | planned | `GrossZagierAndArithmeticHeights:GZ.2/archimedean-admissible-metric` |
| `PAPER-YUAN-26/192` | planned | `GrossZagierAndArithmeticHeights:GZ.2/admissible-green-function` |
| `PAPER-YUAN-26/193` | planned | `GrossZagierAndArithmeticHeights:GZ.2/admissible-metric-existence` |
| `PAPER-YUAN-26/194` | planned | `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green` |
| `PAPER-YUAN-26/195` | planned | `GrossZagierAndArithmeticHeights:GZ.2/arakelov-dualizing-metric` |
| `PAPER-YUAN-26/222` | planned | `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure` |
| `PAPER-YUAN-26/229` | planned | `GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure` |
| `PAPER-YUAN-26/231` | planned | `GrossZagierAndArithmeticHeights:GZ.2/real-admissible-descent` |
| `PAPER-YUAN-ZHANG-18/pseudo-theta` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-theta` |
| `PAPER-YUAN-ZHANG-18/pseudo-comparison` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-comparison` |
| `PAPER-YUAN-ZHANG-18/pseudo-automorphic` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-automorphic` |
| `PAPER-YUAN-ZHANG-18/pseudo-weight-cancel` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-pseudo-weight-cancel` |
| `PAPER-YUAN-ZHANG-18/mixed-kernel` | planned | `GrossZagierAndArithmeticHeights:GZ.6/mixed-theta-eisenstein` |
| `PAPER-YUAN-ZHANG-18/whittaker` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-whittaker` |
| `PAPER-YUAN-ZHANG-18/torus-average` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-torus-average` |
| `PAPER-YUAN-ZHANG-18/local-k-c` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-local-k-c` |
| `PAPER-YUAN-ZHANG-18/holomorphic-projection` | requested | `AutomorphicSpectralTheory:AS.4` |
| `PAPER-YUAN-ZHANG-18/projected-derivative` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-projected-derivative` |
| `PAPER-YUAN-ZHANG-18/test-function` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-test-function` |
| `PAPER-YUAN-ZHANG-18/order-sandwich` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-order-sandwich` |
| `PAPER-YUAN-ZHANG-18/norm-shells` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells` |
| `PAPER-YUAN-ZHANG-18/shell-inert` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-inert` |
| `PAPER-YUAN-ZHANG-18/shell-ramified` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-shell-ramified` |
| `PAPER-YUAN-ZHANG-18/k-inert` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-k-inert` |
| `PAPER-YUAN-ZHANG-18/k-ramified` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-k-ramified` |
| `PAPER-YUAN-ZHANG-18/c-arch` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-c-arch` |
| `PAPER-YUAN-ZHANG-18/c-finite` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-c-finite` |
| `PAPER-YUAN-ZHANG-18/hecke-height-series` | planned | `GrossZagierAndArithmeticHeights:GZ.6/special-correspondence-cycle`, `GrossZagierAndArithmeticHeights:GZ.6/cm-degree-zero-class`, `GrossZagierAndArithmeticHeights:GZ.6/picard-generating-series`, `GrossZagierAndArithmeticHeights:GZ.6/arithmetic-height-kernel` |
| `PAPER-YUAN-ZHANG-18/series-automorphy` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-series-automorphy` |
| `PAPER-YUAN-ZHANG-18/omega-self` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-omega-self` |
| `PAPER-YUAN-ZHANG-18/arch-green` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-green` |
| `PAPER-YUAN-ZHANG-18/arch-proper` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-arch-proper` |
| `PAPER-YUAN-ZHANG-18/finite-multiplicity` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-finite-multiplicity` |
| `PAPER-YUAN-ZHANG-18/nonsplit-proper` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-nonsplit-proper` |
| `PAPER-YUAN-ZHANG-18/ordinary-pairing` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-ordinary-pairing` |
| `PAPER-YUAN-ZHANG-18/split-proper` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-split-proper` |
| `PAPER-YUAN-ZHANG-18/height-decomposition-series` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-height-decomposition-series` |
| `PAPER-YUAN-ZHANG-18/local-m-inert` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-inert` |
| `PAPER-YUAN-ZHANG-18/local-m-ramified` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-ramified` |
| `PAPER-YUAN-ZHANG-18/local-m-division` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-m-division` |
| `PAPER-YUAN-ZHANG-18/local-n` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-n` |
| `PAPER-YUAN-ZHANG-18/superspecial-m` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-superspecial-m` |
| `PAPER-YUAN-ZHANG-18/vertical-pseudo` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-pseudo` |
| `PAPER-YUAN-ZHANG-18/vertical-split-zero` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-split-zero` |
| `PAPER-YUAN-ZHANG-18/kernel-schwartz` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-kernel-schwartz` |
| `PAPER-YUAN-ZHANG-18/local-cancel-nonsplit` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-cancel-nonsplit` |
| `PAPER-YUAN-ZHANG-18/local-cancel-split` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-local-cancel-split` |
| `PAPER-YUAN-ZHANG-18/nonzero-theta` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-nonzero-theta` |
| `PAPER-YUAN-ZHANG-18/residue-line` | planned | `GrossZagierAndArithmeticHeights:GZ.2/colmez-residue-line` |
| `PAPER-YUAN-ZHANG-18/adjunction-arch` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-arch` |
| `PAPER-YUAN-ZHANG-18/small-level-diagonal` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-small-level-diagonal` |
| `PAPER-YUAN-ZHANG-18/modified-projection` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-modified-projection` |
| `PAPER-YUAN-ZHANG-18/adjunction-finite` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-adjunction-finite` |
| `PAPER-YUAN-ZHANG-18/arithmetic-adjunction` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-arithmetic-adjunction` |
| `PAPER-YUAN-ZHANG-18/s2-assumption` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-s2-assumption` |
| `PAPER-YUAN-ZHANG-18/rev-iwasawa-invariants-and-on-gl2` | requested | `AutomorphicSpectralTheory:AS.2` |
| `PAPER-YUAN-ZHANG-18/rev-derivative-of-the-mixed-theta` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-derivative-of-the-mixed-theta` |
| `PAPER-YUAN-ZHANG-18/rev-archimedean-holomorphic-projection-of-log` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-archimedean-holomorphic-projection-of-log` |
| `PAPER-YUAN-ZHANG-18/rev-local-whittaker-series-for-incoherent` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-local-whittaker-series-for-incoherent` |
| `PAPER-YUAN-ZHANG-18/rev-archimedean-derivative-kernel` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-archimedean-derivative-kernel` |
| `PAPER-YUAN-ZHANG-18/rev-corrected-cm-multiplicity-at-split` | planned | `GrossZagierAndArithmeticHeights:GZ.7/colmez-rev-corrected-cm-multiplicity-at-split` |
| `PAPER-YUAN-ZHANG-18/rev-hodge-class-terms-vanish-and` | planned | `GrossZagierAndArithmeticHeights:GZ.6/colmez-rev-hodge-class-terms-vanish-and` |
| `PAPER-GROSS-ZAGIER-86/20` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-partial-rankin-series` |
| `PAPER-GROSS-ZAGIER-86/21` | planned | `GrossZagierAndArithmeticHeights:GZ.0/classical-rankin-normalization` |
| `PAPER-GROSS-ZAGIER-86/23` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-absolute-convergence` |
| `PAPER-GROSS-ZAGIER-86/24` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-entire-functional-equation` |
| `PAPER-GROSS-ZAGIER-86/25` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality` |
| `PAPER-GROSS-ZAGIER-86/29` | planned | `GrossZagierAndArithmeticHeights:GZ.0/classical-relative-field-heights` |
| `PAPER-GROSS-ZAGIER-86/30` | planned | `GrossZagierAndArithmeticHeights:GZ.3/classical-eigendifferential-period` |
| `PAPER-GROSS-ZAGIER-86/47` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness` |
| `PAPER-GROSS-ZAGIER-86/60` | planned | `GrossZagierAndArithmeticHeights:GZ.0/classical-cm-action-conventions` |
| `PAPER-GROSS-ZAGIER-86/62` | planned | `GrossZagierAndArithmeticHeights:GZ.2/classical-complex-height-symbol` |
| `PAPER-GROSS-ZAGIER-86/63` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-height-green-characterization` |
| `PAPER-GROSS-ZAGIER-86/67` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-kernel` |
| `PAPER-GROSS-ZAGIER-86/68` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-resolvent-residue` |
| `PAPER-GROSS-ZAGIER-86/72` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-cusp-expansion` |
| `PAPER-GROSS-ZAGIER-86/73` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-marked-green-kernel` |
| `PAPER-GROSS-ZAGIER-86/74` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-green-constant` |
| `PAPER-GROSS-ZAGIER-86/76` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-archimedean-height` |
| `PAPER-GROSS-ZAGIER-86/77` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-kernel-action` |
| `PAPER-GROSS-ZAGIER-86/78` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-green-kernel` |
| `PAPER-GROSS-ZAGIER-86/79` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-hecke-archimedean-height` |
| `PAPER-GROSS-ZAGIER-86/80` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-atkin-lehner-invariance` |
| `PAPER-GROSS-ZAGIER-86/81` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants` |
| `PAPER-GROSS-ZAGIER-86/82` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits` |
| `PAPER-GROSS-ZAGIER-86/84` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-hyperbolic-norm-parameter` |
| `PAPER-GROSS-ZAGIER-86/85` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-pair-count` |
| `PAPER-GROSS-ZAGIER-86/86` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-congruence-count` |
| `PAPER-GROSS-ZAGIER-86/87` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-prime-discriminant-count` |
| `PAPER-GROSS-ZAGIER-86/88` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-pair-count` |
| `PAPER-GROSS-ZAGIER-86/89` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-kernel-evaluation` |
| `PAPER-GROSS-ZAGIER-86/90` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-orbit-kernel-evaluation` |
| `PAPER-GROSS-ZAGIER-86/91` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-genus-character-filter` |
| `PAPER-GROSS-ZAGIER-86/93` | planned | `GrossZagierAndArithmeticHeights:GZ.2/classical-archimedean-height-sum` |
| `PAPER-GROSS-ZAGIER-86/94` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum` |
| `PAPER-GROSS-ZAGIER-86/99` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-disjoint-archimedean-sum` |
| `PAPER-GROSS-ZAGIER-86/100` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol` |
| `PAPER-GROSS-ZAGIER-86/101` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-product-formula` |
| `PAPER-GROSS-ZAGIER-86/103` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-eta-tangent` |
| `PAPER-GROSS-ZAGIER-86/105` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-complex-tangent-asymptotic` |
| `PAPER-GROSS-ZAGIER-86/106` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-archimedean-height` |
| `PAPER-GROSS-ZAGIER-86/107` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-diagonal-green-kernel` |
| `PAPER-GROSS-ZAGIER-86/109` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-renormalized-self-value` |
| `PAPER-GROSS-ZAGIER-86/111` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-self-value-orbit-sum` |
| `PAPER-GROSS-ZAGIER-86/112` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-total-archimedean-formula` |
| `PAPER-GROSS-ZAGIER-86/113` | planned | `GrossZagierAndArithmeticHeights:GZ.2/classical-local-intersection-height` |
| `PAPER-GROSS-ZAGIER-86/115` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-degree-one-intersection` |
| `PAPER-GROSS-ZAGIER-86/116` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-supersingular-eichler-order` |
| `PAPER-GROSS-ZAGIER-86/117` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-order-model` |
| `PAPER-GROSS-ZAGIER-86/118` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-norm-one-generators` |
| `PAPER-GROSS-ZAGIER-86/130` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-level-reduction-component` |
| `PAPER-GROSS-ZAGIER-86/131` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-component-orthogonality` |
| `PAPER-GROSS-ZAGIER-86/132` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-intersection-height` |
| `PAPER-GROSS-ZAGIER-86/135` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-intersection-count` |
| `PAPER-GROSS-ZAGIER-86/137` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-half-hom-count` |
| `PAPER-GROSS-ZAGIER-86/138` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-set` |
| `PAPER-GROSS-ZAGIER-86/139` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-prime-to-p-hom-count` |
| `PAPER-GROSS-ZAGIER-86/143` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-isomorphism-intersection-count` |
| `PAPER-GROSS-ZAGIER-86/146` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-split-vanishing` |
| `PAPER-GROSS-ZAGIER-86/151` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-endomorphism-congruence-order` |
| `PAPER-GROSS-ZAGIER-86/152` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-hom-quaternion-realization` |
| `PAPER-GROSS-ZAGIER-86/153` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-disjoint-intersection` |
| `PAPER-GROSS-ZAGIER-86/154` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-disjoint-intersection` |
| `PAPER-GROSS-ZAGIER-86/155` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-self-intersection-tangent` |
| `PAPER-GROSS-ZAGIER-86/156` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-new-automorphism-length` |
| `PAPER-GROSS-ZAGIER-86/157` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-j-tangent-values` |
| `PAPER-GROSS-ZAGIER-86/158` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-intersection` |
| `PAPER-GROSS-ZAGIER-86/159` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-total-intersection` |
| `PAPER-GROSS-ZAGIER-86/160` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-total-intersection` |
| `PAPER-GROSS-ZAGIER-86/161` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-split-total-intersection` |
| `PAPER-GROSS-ZAGIER-86/162` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-level-intersection` |
| `PAPER-GROSS-ZAGIER-86/163` | planned | `GrossZagierAndArithmeticHeights:GZ.2/classical-p-height-sum` |
| `PAPER-GROSS-ZAGIER-86/164` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-split-height-sum` |
| `PAPER-GROSS-ZAGIER-86/167` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-hom-lattice` |
| `PAPER-GROSS-ZAGIER-86/168` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-norm-ideal-map` |
| `PAPER-GROSS-ZAGIER-86/169` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-height-sum` |
| `PAPER-GROSS-ZAGIER-86/327` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-unit-count` |
| `PAPER-GROSS-ZAGIER-86/170` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-order-model` |
| `PAPER-GROSS-ZAGIER-86/171` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-ramified-height-sum` |
| `PAPER-GROSS-ZAGIER-86/173` | planned | `GrossZagierAndArithmeticHeights:GZ.0/classical-genus-character-factorization` |
| `PAPER-GROSS-ZAGIER-86/181` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-unfolding` |
| `PAPER-GROSS-ZAGIER-86/183` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-adjunction` |
| `PAPER-GROSS-ZAGIER-86/184` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-mobius-level-decomposition` |
| `PAPER-GROSS-ZAGIER-86/186` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel` |
| `PAPER-GROSS-ZAGIER-86/187` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-kernel-pairing` |
| `PAPER-GROSS-ZAGIER-86/188` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-to-level-detection` |
| `PAPER-GROSS-ZAGIER-86/193` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-transformation` |
| `PAPER-GROSS-ZAGIER-86/199` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-trace-coset-classification` |
| `PAPER-GROSS-ZAGIER-86/201` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-ramified-theta-reindexing` |
| `PAPER-GROSS-ZAGIER-86/202` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-combination` |
| `PAPER-GROSS-ZAGIER-86/203` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-u-formula` |
| `PAPER-GROSS-ZAGIER-86/204` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-eisenstein-combination` |
| `PAPER-GROSS-ZAGIER-86/205` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-fourier-expansion` |
| `PAPER-GROSS-ZAGIER-86/206` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function` |
| `PAPER-GROSS-ZAGIER-86/210` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-zero-coefficient` |
| `PAPER-GROSS-ZAGIER-86/211` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-nonzero-coefficient` |
| `PAPER-GROSS-ZAGIER-86/330` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-kernel-meromorphic-continuation` |
| `PAPER-GROSS-ZAGIER-86/221` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-integral-kernel-values` |
| `PAPER-GROSS-ZAGIER-86/222` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-central-kernel-holomorphy` |
| `PAPER-GROSS-ZAGIER-86/223` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-coefficient-functional-equation` |
| `PAPER-GROSS-ZAGIER-86/224` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-reversal` |
| `PAPER-GROSS-ZAGIER-86/225` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-l-functional-equation` |
| `PAPER-GROSS-ZAGIER-86/227` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-signed-divisor-sums` |
| `PAPER-GROSS-ZAGIER-86/228` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-central-value-kernel` |
| `PAPER-GROSS-ZAGIER-86/230` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-different-reindexing` |
| `PAPER-GROSS-ZAGIER-86/231` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-central-derivative-kernel` |
| `PAPER-GROSS-ZAGIER-86/234` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-sign-multiplicativity` |
| `PAPER-GROSS-ZAGIER-86/235` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity` |
| `PAPER-GROSS-ZAGIER-86/236` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-logarithmic-prime-decomposition` |
| `PAPER-GROSS-ZAGIER-86/237` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-prime-coefficient-parity` |
| `PAPER-GROSS-ZAGIER-86/238` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-single-prime-logarithm` |
| `PAPER-GROSS-ZAGIER-86/251` | planned | `GrossZagierAndArithmeticHeights:GZ.5/classical-weight-two-central-value` |
| `PAPER-GROSS-ZAGIER-86/252` | planned | `GrossZagierAndArithmeticHeights:GZ.5/classical-central-value-endpoints` |
| `PAPER-GROSS-ZAGIER-86/255` | planned | `GrossZagierAndArithmeticHeights:GZ.5/classical-genus-sum-filter` |
| `PAPER-GROSS-ZAGIER-86/263` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-holomorphic-projection` |
| `PAPER-GROSS-ZAGIER-86/267` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-eisenstein-mellin-asymptotics` |
| `PAPER-GROSS-ZAGIER-86/268` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-cusps` |
| `PAPER-GROSS-ZAGIER-86/331` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-boundary-eisenstein-orthogonality` |
| `PAPER-GROSS-ZAGIER-86/269` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-cusp-matrix-inverse` |
| `PAPER-GROSS-ZAGIER-86/270` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-projection-boundary-coefficients` |
| `PAPER-GROSS-ZAGIER-86/271` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-cusp-constants` |
| `PAPER-GROSS-ZAGIER-86/272` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-boundary-coefficients` |
| `PAPER-GROSS-ZAGIER-86/273` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-rankin-mellin-regularization` |
| `PAPER-GROSS-ZAGIER-86/274` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-cuspform` |
| `PAPER-GROSS-ZAGIER-86/275` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-coefficients` |
| `PAPER-GROSS-ZAGIER-86/280` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-global-local-archimedean-sum` |
| `PAPER-GROSS-ZAGIER-86/281` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-finite-height-sum` |
| `PAPER-GROSS-ZAGIER-86/294` | planned | `GrossZagierAndArithmeticHeights:GZ.3/classical-modular-period-degree` |
| `PAPER-GROSS-ZAGIER-86/302` | planned | `GrossZagierAndArithmeticHeights:GZ.0/classical-twist-real-period` |
| `PAPER-GROSS-ZAGIER-86/309` | planned | `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement` |
| `PAPER-GROSS-ZAGIER-86/310` | planned | `GrossZagierAndArithmeticHeights:GZ.5/classical-definite-square-class` |
| `PAPER-GROSS-ZAGIER-86/13` | requested | `HeightsRationalPointsAndObstructions:RP.0` |
| `PAPER-GROSS-ZAGIER-86/18` | requested | `HeegnerPointEulerSystems:HE.1` |
| `PAPER-GROSS-ZAGIER-86/33` | out-of-scope | `RankZeroOneBSD:BSD.5` |
| `PAPER-GROSS-ZAGIER-86/127` | requested | `AbelianSchemesAndArithmeticModuli:A6` |
| `PAPER-GROSS-ZAGIER-86/140` | requested | `HeegnerPointEulerSystems:HE.2` |
| `PAPER-GROSS-ZAGIER-86/142` | requested | `ComplexMultiplicationAndExplicitReciprocity:CM.5` |
| `PAPER-GROSS-ZAGIER-86/145` | requested | `ComplexMultiplicationAndExplicitReciprocity:CM.5` |
| `PAPER-GROSS-ZAGIER-86/148` | imported | `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances` |
| `PAPER-GROSS-ZAGIER-86/149` | requested | `ComplexMultiplicationAndExplicitReciprocity:CM.5` |
| `PAPER-GROSS-ZAGIER-86/166` | requested | `GL2AutomorphicRepresentationsAndTransfer:R16.1` |
| `PAPER-GROSS-ZAGIER-86/175` | requested | `AutomorphicFormsOnReductiveGroups:AF.5/gl2-classical-to-adelic` |
| `PAPER-GROSS-ZAGIER-86/191` | requested | `AnalyticNumberTheory:AN.4` |
| `PAPER-GROSS-ZAGIER-86/232` | requested | `AnalyticNumberTheory:AN.4` |
| `PAPER-GROSS-ZAGIER-86/260` | requested | `AutomorphicSpectralTheory:AS.4` |
| `PAPER-GROSS-ZAGIER-86/293` | requested | `HeegnerPointEulerSystems:HE.1` |
| `PAPER-GROSS-ZAGIER-86/7` | planned | `GrossZagierAndArithmeticHeights:GZ.0/heegner-unit-index` |
| `PAPER-GROSS-ZAGIER-86/14` | planned | `GrossZagierAndArithmeticHeights:GZ.2/arithmetic-intersection-gluing` |
| `PAPER-GROSS-ZAGIER-86/15` | planned | `GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions` |
| `PAPER-GROSS-ZAGIER-86/27` | planned | `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing` |
| `PAPER-GROSS-ZAGIER-86/284` | planned | `GrossZagierAndArithmeticHeights:GZ.1/character-height-pairing` |
| `PAPER-GROSS-ZAGIER-86/48` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol` |
| `PAPER-GROSS-ZAGIER-86/104` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-tangent-symbol` |
| `PAPER-GROSS-ZAGIER-86/49` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-projected-derivative-cuspform` |
| `PAPER-GROSS-ZAGIER-86/278` | planned | `GrossZagierAndArithmeticHeights:GZ.6/classical-height-series-cuspidality` |
| `PAPER-GROSS-ZAGIER-86/292` | planned | `GrossZagierAndArithmeticHeights:GZ.3/manin-constant` |
| `PAPER-GROSS-ZAGIER-86/114` | planned | `GrossZagierAndArithmeticHeights:GZ.7/classical-inert-height-sum` |
| `PAPER-GROSS-ZAGIER-86/254` | planned | `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof` |
| `PAPER-GROSS-ZAGIER-86/26` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-GROSS-ZAGIER-86/28` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-GROSS-ZAGIER-86/31` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-GROSS-ZAGIER-86/35` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-GROSS-ZAGIER-86/52` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-GROSS-ZAGIER-86/282` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-GROSS-ZAGIER-86/285` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-GROSS-ZAGIER-86/286` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-GROSS-ZAGIER-86/287` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-GROSS-ZAGIER-86/295` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-GROSS-ZAGIER-86/304` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-GROSS-ZAGIER-86/307` | out-of-scope | `GrossZagierAndArithmeticHeights:GZ.8` |
| `PAPER-DUKE-IMAMOGLU-TOTH-16/131` | planned | `GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value` |

## Source corrections

The companion packet records the locator, corrected mathematical statement and
independent reason for all 86 findings. This review confirms85 and rejects E47;
earlier decisions remain in history. E47’s printed sufficient convergence range
is true. E86 retains evaluation at1 and the ordinary-derivative factorial.
The published GZ corrections preserve the signed negative-index divisor sum,
pq≡−1 modD order condition, connecting-ideal orientation and fibre count.
The Colmez corrections preserve the zero Whittaker branch, nonzero S² terms,
direct two-input kernel and separate ramification in adjunction. The tensor
comparison above prevents those corrections from being imported as assertions
about an arbitrary local cotangent.
