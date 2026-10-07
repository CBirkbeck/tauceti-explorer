# Genus-two similitudes, Jacobi forms and genuine Eisenstein series

This document specifies `MetaplecticAutomorphicForms:MP.8`. Its endpoint is the genus-two analytic input used by `RankZeroOneBSD:BSD.2`: an Eisenstein family attached to an elliptic newform, its two cusp expansions, its local Euler factors and its two-variable polar formula. The final twist residue, positivity, noncancellation, simultaneous local conditions and infinitude of fundamental twists belong to BSD.2.

The stage has six landmarks: **Genus-two symplectic similitudes**, **Genus-two metaplectic double cover**, **Genus-two theta series**, **Jacobi Eisenstein series**, **Novodvorsky transform**, and **Two-variable polar formula**. The catalogue below gives the definitive mathematical statements. The associated Lean file suggests native signatures and names; its explicit signature boundaries distinguish full statements from coordinate consequences and missing supplier interfaces.

## Conventions and inputs

Write e(t)=exp(2πit), W=R⁴ and J=[[0,−I₂],[I₂,0]]. Use the native symplectic group with this sign convention and the native positive-definite matrix predicate. The Siegel domain H₂ consists of complex symmetric matrices Z=X+iY with Y>0. Positivity is strict. The positive similitude group has gᵀJg=μ(g)J, μ(g)>0, and acts by gZ=(AZ+B)(CZ+D)⁻¹. Positive scalar matrices fix every point of H₂, so its full stabilizer contains a positive real scalar factor.

The arithmetic datum consists of a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; an integer N>0 with 8M|N; and m>0 with N|m and 4m|N². Put a=m/N. The example M=1,N=8,m=16,a=2 tests the integral conventions. The auxiliary function f̂(τ)=τ⁻ᵏf(−1/(Nτ)) uses N. The Fricke equation and completed L-function of the original newform use M. The weight-12 level-one discriminant form at auxiliary level eight distinguishes these conventions.

The compact group is K=Sp₄(R)∩O₄(R)≅U(2). Fix an actual continuous finite-dimensional representation σ, a vector v of the BFH left SO(2) weight k with trivial central action of −I₄, and a continuous linear functional T. Scalar local coefficients have the form φ(κ)=T(vσ(κ)). Continued values, nonzero residues and Fourier-invariance conclusions are properties to prove from these inputs.

For Iwasawa coordinates choose Q upper triangular with positive diagonal and Y=QQᵀ. Then g=n(X)diag(Q,Q⁻ᵀ)=[[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]]. BFH places a transpose symbol before the matrix being transposed: the transposed factor follows Q in the expression for Y. The symmetric bottom-row condition is CDᵀ=DCᵀ. These placements determine the unfolded kernel and integral symplectic completion.

## Shared owners and native baseline

General Jacobi theory belongs to `MetaplecticAutomorphicForms:MP.6` before MP.7: the Heisenberg group, its symplectic semidirect product and unitary analogue, the Schrödinger–Weil action, Jacobi weight/index/multiplier spaces, Fourier–Jacobi extraction and theta decomposition. MP.8 constructs the BFH rank-two arithmetic realization and its similitude compatibility. `QSeriesPartitionsAndMockModularForms:QM.1` consumes MP.6 for its rank-one q-series and theta applications. The confirmed unitary consumer is `AutomorphicCongruences:L2s`, which requests a separately source-qualified unitary Jacobi instance. The existing MP.6 adelic contracts do not establish a general unitary Jacobi theorem. An L2 dependency does not follow from its embedded L2s paragraph; a separate Fouquet–Wan use requires its own evidence. MP.6 has no prerequisite in these consumers. This follows the independently verified RT-AREA-automorphic-1/20 ownership finding and its round-3 fix review.

MP.1 supplies the intrinsic rank-two metaplectic extension; MP.2 supplies Weil generator operators and phases; MP.4 supplies the local-to-adelic restricted product and rational splitting. The positive genus-two square-root cover and its comparison to those inputs are MP.8 targets. Neither a rank-one cover nor the quaternion kernel of SO(3) supplies this comparison.

The classical newform, its Hecke recurrence, its transformed cusp coefficients and its continued L-function are imported from upstream ModularForms layers 2, 4, 6 and 7. `AutomorphicFormsOnReductiveGroups:AF.5` supplies the classical-to-automorphic GL₂/Q dictionary. AF.1 supplies smooth globalization and compact convolution; `GL2AutomorphicRepresentationsAndTransfer:R16.2` supplies conductor/newvector normalization, including dyadic places. `AutomorphicLFunctionsAndLocalFactors:AL.3` supplies the local/global L-factor interface and symmetric-square denominator conditions. The scalar Gaussian integral and its positive-parameter integrability are already in Mathlib. Combine them with pinned Cholesky coordinates and Fubini for the theta pairing. Upstream CompactGroups layer 5 supplies Peter–Weyl density. These imported inputs determine the shared theories used here.

The baseline pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Native integral quadratic forms represent half-integral symmetric Fourier matrices: diagonal coefficients are integers and mixed polynomial coefficients are twice the matrix entry. The full form, including its mixed term, is retained. Native Möbius and PID basis APIs support matrix Möbius inversion. The pinned Cholesky equivalence supplies unique positive triangular Gram factors after reversing the basis indices. Native one-variable meromorphy supplies scalar slices. Joint meromorphy on C² uses local holomorphic numerator/denominator charts; separate slice statements do not supply it.

## The mathematical route

Start with the determinant cocycle d(g,Z)=det(CZ+D)/μ(g). A positive-cover element is a matrix with a continuous square-root function h(Z)²=d(g,Z); multiply roots by h(g′Z)h′(Z). The identity has exactly two lifts. Positive scalars split with root one. The Fourier-generator lift uses i√(−detZ), whereas the theta Fourier formula uses √(−detZ) with its compensating Weil phase. The branch is positive at Z=iY. Extending the positive real cover across diag(I₂,−I₂) is a chosen real semidirect extension; agreement with a prescribed adelic extension requires the arithmetic comparison.

A similitude acts on Heisenberg coordinates by (w,t)↦(gw,μ(g)t). A fixed central character e(mt) is preserved by the symplectic subgroup; positive similitudes transport its index. The BFH slash action is restricted to the symplectic factor unless that transport is included. Its two elliptic translation lattices and their central phase remain distinct.

The genus-two theta series sums over a residue vector modulo 2a with exponent Z[R]/(4a)+RᵀW. On compact subsets of H₂×C², a positive lower bound for the least eigenvalue of Im Z produces Gaussian majorants. The torus pairing has norm √detY/(2a), with measure detY dλ dρ in W=Zλ+ρ. Component projection and its Fourier coefficient are separate constructions. The integer shift invariant is the entire quadratic form 4aQ−c(R·−)² together with the vector residue. An arbitrary integral symmetric discriminant matrix need not have a representable half-integral Fourier index.

Build the seed from the newform and finite K-type, then I_s(g)=det(Y)^(s/2)I(g), then the sum over (P∩Γ_N)\Γ_N and the Heisenberg lattice. Native G/H has classes gH; the required H\G has classes Hg. Inversion converts the former to the latter. Convergence and representative independence are theorem obligations. Theta decomposition gives a genuine half-weight vector. Multiplying its component by h(iI₂) gives central sign −1. On the Siegel Levi, the root magnitude contributes |detQ|⁻¹/². Subtracting the half-modulus exponent 3/2 from the resulting exponent s−1/2 gives the normalized parameter s−2 and Weyl reflection 4−s.

The Whittaker integral has nondegenerate signs +1,−1 and a separate degenerate sign zero. Initial absolute convergence is Re s>2; continuation reaches Re s>3/2. The auxiliary Jacquet V-family and gamma-normalized W-family have distinct holomorphy assertions. The raw Jacquet integral is used only for Re r>1/2 and Re(s−r)>3/2; its larger continuation cones refer to continued functions. For a torus character n, the corrected gamma arguments are A₊=(s−r+n)/2, B₊=(s+r+n+1)/2 and A₋=(s−r−n−1)/2, B₋=(s+r−n)/2. Equations (3.26)–(3.27) on printed p.565 have inverse Γ(A₊) and inverse Γ(A₋), respectively, leaving Γ(B₊) or Γ(B₋) after normalization. A projected torus coefficient need not retain the original SO(2) weight k. The two-variable reflection uses continued values, since its original convergence chambers have no open overlap. Nondegenerate functions decay in both positive variables; W⁰ has a different scaling and only the specified decay in the second variable.

The test algebra consists of actual compact-group matrix coefficients. Its global weight-zero coefficients φ₁,φ₂,φ₃ control contour shifts and divisibility. Use |Im x₁|≤ε<1 for the bounded holomorphic strip. The coefficient φ₁(q)=det(Im q) on U(2) is signed; the κ(X) chart gives its positive restriction. With Δ_z=√(1+z²), its value on the actual right product is φ₁(κ(X)κ_z)=(1+zx₁)φ₁(κ(X))/Δ_z. At X=diag(0,−2), z=1 this is −1/√10, while the substituted positive chart value is +1/√10. Divisibility is required globally on K. The residual compact transition and a z-uniform integrable majorant for the full (3.38) prefactor are still proof obligations. The Novodvorsky transform is an iterated integral. Its continuation does not establish joint absolute convergence of the expanded five-variable kernel. Three separate existential tests provide nonzero nondegenerate transforms with vanishing rank zero, nonzero rank zero, and nonzero degenerate Mellin residue. The two signs may require different positive y₂ values. For the rank-zero τ test, a nonzero z-restriction is insufficient: odd integrable contributions vanish under the map z↦√(1+z²). Construct a coefficient satisfying the weight and global-divisor constraints whose weighted even pushforward is nonzero before invoking Laplace injectivity (Proposition 3.13, p.574).

Matrix Möbius inversion removes primitive-pair restrictions from the exponential sums. Its congruence-restricted version uses N-adapted upper Hermite divisor representatives that are diagonal modulo N. First-cusp unfolding uses C₁₂≡0 mod N; opposite-cusp unfolding uses C≡0 mod N and retains rank-two, rank-one and rank-zero contributions. Cuspidality kills the rank-one term after Whittaker extraction. The first-cusp Dirichlet series uses a(n) of the original newform f; the opposite-cusp P-series uses its separately transformed cusp data. Fourier coefficients C_j(s) vary with s. The mixed root congruence uses p^min(a,d). At p=3,m=16,N=8,r=1,n₁=0,a=b=2,d=1 there are six solutions, agreeing with the unchanged Lemma 7.3 table; the printed modulus gives two. The primitive sum S_p(a,b,d) retains three exponents. Its beta-difference is S_p(a,a,d)−S_p(a,a−1,d), keeping the first exponent fixed. These counts determine the unramified factors and squarefactor polynomial bounds. Opposite-cusp ramified zero-discriminant regularity must be established independently when used to prove full Eisenstein regularity.

The spectral comparison supplies genuine constant terms, intertwining continuation, functional equations and pole control before Fourier coefficients commute with residues or derivatives. In the polar formula every local transform is evaluated at N⁻¹y₂, including F^± in both (8.1) and (8.3); their printed unscaled arguments conflict with the evaluated boundary terms on p.603. Near (u,s)=(1/2,2), subtracting the three specified boundary fractions leaves a jointly holomorphic function. BSD.2 consumes that formula and the local tests and owns the final arithmetic argument.

## Planning status and order

This is a complete planning pass, with MP.8 still **planned** and every node **unchecked**. It contains 85 nodes: 16 definitions, 18 constructions, 6 lemmas, 41 theorems and 4 comparisons; 107 API items and 104 proposed tests support the objects. There are six planets, 28 baseline declarations, 15 supplier requests and nine gaps. No mathematical implementation or closure is asserted.

Build the geometry, cover and Jacobi arithmetic first. The theta objects then give the genuine components used by the seed and both cusp extractions. The Whittaker continuation and local tests require the compact-rotation and even-pushforward repairs below. Primitive arithmetic supplies the Euler factors; establish ramified P-regularity by its independent arithmetic route before using it for full Eisenstein regularity. Finally compare normalized genuine induction and its intertwiners, prove uniform denominator-cleared Fourier/tail estimates, and assemble the jointly meromorphic polar formula. Source and supplier gaps remain prerequisites of the corresponding declarations.

## Integral Fourier-index arithmetic

### Integral genus-two Fourier-index shift

Declaration: `TauCeti.Jacobi.GenusTwo.fourierShift` (construction). Node: `MetaplecticAutomorphicForms:MP.8/fourier-shift`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`.

Hypotheses: V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.

For ℓ∈V and p=(Q,R), S_{a,c,ℓ}(p)=(Q′,R′), where R′=R−2aℓ and Q′(x)=Q(x)+c(a(ℓ·x)²−(R·x)(ℓ·x)). This is a pair of a native integral quadratic form and an integral vector, for all integers a,c. Construct the new form using products of the native linear functionals x↦ℓ·x and x↦R·x, addition and integer scalar multiplication.

Construction or proof:

1. Use dotProductBilin to obtain the two linear forms. Use QuadraticMap.linMulLin twice to obtain their square and product; combine them with Q using the existing Z-module operations on quadratic maps.
2. Pair that quadratic form with R−2aℓ. No half-integer division occurs in the native type. The BFH matrix expression follows by evaluating the associated polynomial: its symmetric cross term has coefficient −c/2.

Direct dependencies: `mathlib:QuadraticForm`, `mathlib:QuadraticMap.linMulLin`, `mathlib:dotProductBilin`.

Uses:

- BFH Proposition 2.2, (2.9)–(2.10): Express the elliptic-translation orbit of the Fourier index in integral coordinates.
- BFH (2.5)–(2.6), pp.552–554: Move an integral vector R to a prescribed lift ν of its residue class when defining C_j(g;U,ν). The analytic equality of coefficients is a separate obligation.
- RankZeroOneBSD:BSD.2, through MetaplecticAutomorphicForms:MP.8: Supply the indexing arithmetic used before actual genus-two Fourier coefficients enter the twist-series comparison; no nonvanishing is deduced from it.

API:

- `TauCeti.Jacobi.GenusTwo.fourierShift_fst_apply` (compatibility): For x∈V, the first projection evaluates to Q(x)+c(a(ℓ·x)²−(R·x)(ℓ·x)); this is an equality in Z with the native quadratic-map evaluation.
- `TauCeti.Jacobi.GenusTwo.fourierShift_snd` (projection): The vector projection is R−2aℓ.
- `TauCeti.Jacobi.GenusTwo.fourierShift_zero` (simp): S_{a,c,0}(p)=p.
- `TauCeti.Jacobi.GenusTwo.fourierShift_add` (functoriality): S_{a,c,ℓ+k}(p)=S_{a,c,k}(S_{a,c,ℓ}(p)) for all ℓ,k,p.
- `TauCeti.Jacobi.GenusTwo.fourierShift_neg` (relation): S_{a,c,−ℓ}(S_{a,c,ℓ}(p))=p, including a=0 and c=0.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.fourierShift_zero_data` (computation): For a=1,c=8, p=(0,0) and ℓ=e₀, the output is (8x₀²,−2e₀), with x₀² the native coordinate quadratic form.
- `TauCeti.Jacobi.GenusTwo.fourierShift_other_cusp` (compatibility): For a=1,c=1 and the same zero data and shift, the output is (x₀²,−2e₀). This detects using c=N at both cusps.
- `TauCeti.Jacobi.GenusTwo.fourierShift_mixed_term` (computation): For a=c=1, Q=x₀x₁, R=e₀ and ℓ=e₁, the output is (x₁²,e₀−2e₁). Here Q has symmetric matrix off-diagonal entries 1/2, not 1.

Acceptance:

- The output remains integral for odd mixed coefficients and arbitrary c.
- Changing from j=0 to j=1 changes c from N to 1; it does not change the modulus 2a.
- For c=0 the quadratic part is fixed, but the vector still changes by −2aℓ.

Source: BFH90, (2.9), printed p.552; lattice parameter in the proof on p.553. Evidence relationship: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Discriminant quadratic form of a Fourier index

Declaration: `TauCeti.Jacobi.GenusTwo.fourierDiscriminant` (construction). Node: `MetaplecticAutomorphicForms:MP.8/fourier-discriminant`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`.

Hypotheses: V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.

Define Δ_{a,c}(Q,R)=4aQ−c(R·−)² as a native integral quadratic form on V. The invariant is the entire quadratic form, not its determinant. Under BFH a=m/N, c=N^(1−j), its symmetric matrix is 4aT−cRRᵀ; multiplying that matrix by N gives exactly U=4mT−N^(2−j)RRᵀ in (2.10).

Construction or proof:

1. Construct (R·−) with dotProductBilin and its square with QuadraticMap.linMulLin; combine with Q by the native quadratic-map module operations.
2. The BFH relation U=N·matrix(Δ) is an algebraic substitution. Native integral quadratic forms are represented by half-integral symmetric matrices, by the ordered-basis expansion; the particular Δ matrix has integral entries.

Direct dependencies: `mathlib:QuadraticForm`, `mathlib:QuadraticMap.linMulLin`, `mathlib:dotProductBilin`, `mathlib:QuadraticMap.sum_repr_sq_add_sum_repr_mul_polar`.

Uses:

- BFH (2.10), printed p.553: Classify exactly the integral translation orbits together with the vector residue class.
- BFH Proposition 2.2, (2.5)–(2.6): Index theta-expansion coefficients by U and ν without losing the level factor N.
- BFH Corollary 2.8 and RankZeroOneBSD:BSD.2: Provide the matrix-valued indexing convention before specialized scalar discriminants and twist coefficients are extracted.

API:

- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_apply` (compatibility): Δ_{a,c}(Q,R)(x)=4aQ(x)−c(R·x)² as an equality in Z under native quadratic-map evaluation.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_zero` (simp): Δ_{a,c}(0,0)=0 for all integers a,c.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_zero_vector` (compatibility): Δ_{a,c}(Q,0)=4a·Q in the native Z-module of quadratic forms.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_mixed` (computation): For a=c=1,Q=x₀x₁,R=0 and x=e₀+e₁, Δ(Q,R)(x)=4.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_negative` (non-example): For a=1,c=8,Q=0,R=e₀, Δ(Q,R)(e₀)=−8; positive definiteness is not part of the index type.
- `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_zero_index` (degenerate): At a=0,c=1, Δ(x₀²,0)=Δ(0,0); this boundary case is excluded from orbit classification by a≠0.

Acceptance:

- The factor is 4a, not 2a; it retains mixed coefficients of a half-integral symmetric index.
- Δ is allowed to be zero, degenerate or negative on nonzero vectors.
- For N≠0, equality of the BFH matrices U is equivalent to equality of the corresponding Δ forms, by cancellation and quadratic-form extensionality.

Source: BFH90, (2.6), p.552, and (2.10), p.553. Evidence relationship: The source uses the integral symmetric matrix U. The native quadratic-form invariant is U/N, with the level factor kept explicit; the definitions are identified through the polynomial Q(x)=xᵀTx.

### Discriminant invariance under an integral shift

Declaration: `TauCeti.Jacobi.GenusTwo.fourierDiscriminant_shift` (lemma). Node: `MetaplecticAutomorphicForms:MP.8/discriminant-shift`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`.

Hypotheses: V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.

For every a,c∈Z, ℓ∈V and p, Δ_{a,c}(S_{a,c,ℓ}(p))=Δ_{a,c}(p).

Construction or proof:

1. Unfold the two constructions and evaluate on x using native product-linear-form evaluation. Set r=R·x and t=ℓ·x.
2. Expand 4a[Q(x)+c(at²−rt)]−c(r−2at)². The cross and square terms cancel, leaving 4aQ(x)−cr². Use QuadraticMap.ext to conclude.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `MetaplecticAutomorphicForms:MP.8/fourier-discriminant`, `mathlib:QuadraticMap.linMulLin_apply`, `mathlib:QuadraticMap.ext`.

Acceptance:

- The identity holds at a=0, c=0 and negative a,c; no cancellation by a is used.
- For p=(0,0),a=1,c=8,ℓ=e₀ the shifted data (8x₀²,−2e₀) still have zero discriminant.
- Changing only the sign of the cross term in the shift destroys the cancellation.

Source: BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Evidence relationship: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Residue invariance of the vector index

Declaration: `TauCeti.Jacobi.GenusTwo.fourierShift_modEq` (lemma). Node: `MetaplecticAutomorphicForms:MP.8/residue-shift`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`.

Hypotheses: V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q.

For all a,c∈Z, p, ℓ and i∈{0,1}, the vector coordinate of S_{a,c,ℓ}(p) is congruent to R_i modulo 2a.

Construction or proof:

1. Unfold the vector projection. The difference R_i−(R_i−2aℓ_i)=2aℓ_i is divisible by 2a.
2. Apply Int.modEq_iff_dvd. This argument also works at a=0, when congruence modulo zero means equality.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `mathlib:Int.ModEq`, `mathlib:Int.modEq_iff_dvd`.

Acceptance:

- At a=2, shifting R by any ℓ changes each coordinate by a multiple of 4.
- At a=0 every vector index stays unchanged.
- The modulus is 2m/N at both cusps, rather than 2m.

Source: BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Evidence relationship: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Recovery from a discriminant and fixed vector

Declaration: `TauCeti.Jacobi.GenusTwo.eq_of_fourierDiscriminant_eq` (lemma). Node: `MetaplecticAutomorphicForms:MP.8/recover-quadratic`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`.

Hypotheses: V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q. a≠0.

Assume a≠0. If p=(Q,R) and q=(Q′,R′) satisfy R=R′ and Δ_{a,c}(p)=Δ_{a,c}(q), then p=q.

Construction or proof:

1. Evaluate the discriminant equality at arbitrary x with QuadraticMap.congr_fun and substitute R=R′. Cancel the identical square term by integer addition.
2. This leaves 4aQ(x)=4aQ′(x). Since 4a≠0 in Z, apply mul_left_cancel₀.
3. Use QuadraticMap.ext and equality of the vector components to conclude equality of pairs.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-discriminant`, `mathlib:QuadraticMap.congr_fun`, `mathlib:QuadraticMap.ext`, `mathlib:mul_left_cancel₀`.

Acceptance:

- At a=0, p=(0,0) and q=(x₀²,0) have equal discriminants and vectors but are different pairs.
- No condition on c is needed, including c=0.
- Equality of determinants of Δ is not enough: when R=0,a=1, Q=x₀² and Q′=x₁² have equal zero determinants but are different forms.

Source: BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Evidence relationship: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Uniqueness of the integral shift parameter

Declaration: `TauCeti.Jacobi.GenusTwo.fourierShift_injective` (lemma). Node: `MetaplecticAutomorphicForms:MP.8/shift-parameter-injective`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`.

Hypotheses: V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q. a≠0.

Assume a≠0. For a fixed p, the map ℓ↦S_{a,c,ℓ}(p) is injective.

Construction or proof:

1. Equality of shifted pairs implies equality of vector projections. Cancel R coordinatewise to obtain 2aℓ_i=2ak_i.
2. Since 2a≠0, use mul_left_cancel₀ in each coordinate and function extensionality. The quadratic component is not needed.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `mathlib:mul_left_cancel₀`.

Acceptance:

- For p=(0,0),a=0 all shifts give p, showing why nonzero a is required.
- The result includes c=0, when only the vector part detects the shift.
- For a=1, vector −2e₀ can be reached from 0 only by ℓ=e₀.

Source: BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Evidence relationship: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Classification of genus-two Fourier-index orbits

Declaration: `TauCeti.Jacobi.GenusTwo.exists_fourierShift_iff` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/orbit-classification`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`.

Hypotheses: V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q. a≠0.

Assume a≠0. For p=(Q,R) and q=(Q′,R′), there exists ℓ∈V with S_{a,c,ℓ}(p)=q if and only if Δ_{a,c}(p)=Δ_{a,c}(q) and R_i≡R′_i modulo 2a for both coordinates.

Construction or proof:

1. Forward: discriminant-shift and residue-shift give the two invariants, after replacing the shifted pair by q and reversing equalities/congruences as needed.
2. Reverse: use Int.modEq_iff_dvd to choose t_i with R′_i−R_i=2at_i and put ℓ_i=−t_i. Then the shifted pair p₁ has vector R′.
3. Discriminant-shift and the assumed equality give Δ(p₁)=Δ(q). Apply recover-quadratic to p₁ and q. No analytic Fourier expansion, division in Z, or representative selection beyond the two divisibility witnesses is needed.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `MetaplecticAutomorphicForms:MP.8/fourier-discriminant`, `MetaplecticAutomorphicForms:MP.8/discriminant-shift`, `MetaplecticAutomorphicForms:MP.8/residue-shift`, `MetaplecticAutomorphicForms:MP.8/recover-quadratic`, `mathlib:Int.modEq_iff_dvd`.

Acceptance:

- Equal residues alone fail for p=(0,0),q=(x₀²,0),a=c=1.
- Equal discriminants alone fail for p=(0,e₀),q=(0,−e₀),a=2,c=1: their vector residues modulo 4 differ.
- At a=0,c=1, the distinct pairs (0,0) and (x₀²,0) satisfy both invariant conditions but are not shift-equivalent.
- Substituting the two BFH cusp scalings gives exactly (2.10) with U=N·matrix(Δ).

Source: BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Evidence relationship: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Unique Fourier index with a prescribed residue lift

Declaration: `TauCeti.Jacobi.GenusTwo.existsUnique_fourierRepresentative` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/unique-residue-lift`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`.

Hypotheses: V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q. a≠0.

Assume a≠0. Given p=(Q,R) and ν∈V with ν_i≡R_i modulo 2a, there exists exactly one integral quadratic form Q_ν such that Δ_{a,c}(Q_ν,ν)=Δ_{a,c}(p).

Construction or proof:

1. Use Int.modEq_iff_dvd to choose ℓ with R−2aℓ=ν. Take Q_ν to be the quadratic component of S_{a,c,ℓ}(p).
2. Discriminant-shift proves the required equality. For two candidates, recover-quadratic applies because both vector components equal ν; their quadratic components are equal.
3. The theorem prescribes an arbitrary lift ν. It neither selects a canonical residue representative nor asserts that every arbitrary pair (Δ,ν) is represented by an integral Fourier index.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `MetaplecticAutomorphicForms:MP.8/fourier-discriminant`, `MetaplecticAutomorphicForms:MP.8/discriminant-shift`, `MetaplecticAutomorphicForms:MP.8/recover-quadratic`, `mathlib:Int.modEq_iff_dvd`.

Acceptance:

- For p=(0,0),a=1,c=8 and ν=−2e₀, the unique form is 8x₀².
- For ν=R the unique form is Q.
- At a=0 the pair p=(0,0),ν=0 admits every integral quadratic form and uniqueness fails.

Source: BFH90, Proposition 2.2 proof, (2.9)–(2.10), printed pp.552–553. Evidence relationship: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

### Coefficient equality from shift invariance

Declaration: `TauCeti.Jacobi.GenusTwo.coefficient_eq_of_fourierInvariants` (lemma). Node: `MetaplecticAutomorphicForms:MP.8/coefficient-invariants`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/FourierIndex`.

Hypotheses: V=Z² with its ordered coordinate basis and ordinary dot product; data are native pairs p=(Q,R), Q a Z-valued quadratic form on V and R∈V. The integers a and c are arbitrary unless nonzero a is explicitly assumed. For BFH, a=m/N>0 and c=N for j=0 or c=1 for j=1. No positivity or nondegeneracy is imposed on Q. a≠0.

Assume a≠0. Let A be any type and B a function from the native Fourier data pairs to A. Assume explicitly B(S_{a,c,ℓ}(p))=B(p) for every ℓ,p. If p and q have equal discriminant forms and coordinatewise congruent vector indices modulo 2a, then B(p)=B(q).

Construction or proof:

1. Use orbit-classification to choose ℓ with S_{a,c,ℓ}(p)=q.
2. Substitute that equality into the assumed shift-invariance identity. Symmetry gives B(p)=B(q). The codomain needs no linear, topological or analytic structure.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `MetaplecticAutomorphicForms:MP.8/fourier-discriminant`, `MetaplecticAutomorphicForms:MP.8/orbit-classification`.

Acceptance:

- A constant function satisfies the premise for every codomain with a chosen value.
- Taking B(p)=R₀ violates shift invariance at a≠0 and cannot be used as an actual invariant coefficient.
- This lemma does not establish BFH (2.9) for the analytic coefficient B_j: that premise requires its holomorphy and contour-translation argument.

Source: BFH90, Proposition 2.2 proof, (2.9)–(2.10) and the paragraph defining C_j, pp.552–553. Evidence relationship: Separates an elementary algebraic step in the source orbit calculation. Substitute λ=N^(−j)ℓ, a=m/N and c=N^(1−j); Q(x)=xᵀTx. The statement extends the polynomial calculation to integral a,c and uses native quadratic forms.

## Siegel geometry and the similitude cover

### Siegel upper half-space of degree two

Declaration: `TauCeti.Jacobi.GenusTwo.SiegelSpace` (definition). Node: `MetaplecticAutomorphicForms:MP.8/siegel-space`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Geometry`.

H₂ is the subtype of complex symmetric 2×2 matrices Z with native positive-definite real matrix Im Z. It has the induced topology and the complex-manifold structure on the three independent symmetric coordinates. The positivity condition is strict.

Construction or proof:

1. Use the symmetric subspace of M₂(C), with coordinates (Z₂₂,Z₁₂,Z₁₁). Strict positive definiteness cuts out an open convex domain.
2. Use native Matrix.PosDef; identify real quadratic positivity with its finite-dimensional dot-product criterion.

Direct dependencies: `mathlib:Matrix.PosDef`.

Uses:

- BFH §1, pp.545–546, unnumbered GSp⁺ definition and fractional-linear action: Uses siegel upper half-space of degree two in positive genus-two symplectic similitudes: GSp₄⁺(R) consists of pairs (g,μ), g∈GL₄(R), μ∈Rˣ positive, satisfying gᵀJg=μJ for native J=[[0,−I],[I,0]]. Multiplication multiplies both components. μ is uniquely determined by g. On H₂, gZ=(AZ+B)(CZ+D)⁻¹; CZ+D is invertible and Im(gZ)=μ(C conjugate(Z)+D)⁻ᵀ Im(Z)(CZ+D)⁻¹.
- BFH §2, p.551, (2.1): Uses siegel upper half-space of degree two in bfh genus-two theta series: For positive integer a and ν∈Z², specialize the MP.6 theta kernel to θᵃ_ν(Z,W)=Σ_{R∈Z², R≡ν mod 2a} e(Z[R]/(4a)+RᵀW). The series is normally convergent on H₂×C². Its finite residue set is (Z/(2a)Z)², of size (2a)². No rank-one Jacobi-form definition is introduced here.
- BFH §2, pp.551–553, definition of θ and Proposition 2.1: Control the least eigenvalue of Im Z on compact subsets, giving uniform Gaussian majorants for the theta series and its coordinate derivatives.

API:

- `TauCeti.Jacobi.GenusTwo.siegelSpace_mem` (characterisation): Membership is Zᵀ=Z and (Im Z).PosDef.
- `TauCeti.Jacobi.GenusTwo.siegelSpace_im_pos` (projection): For Z∈H₂, (Im Z).PosDef.
- `TauCeti.Jacobi.GenusTwo.siegelSpace_base` (constructor): iI₂ is in H₂.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.siegelSpace_diagonal` (computation): diag(i,2i) belongs to H₂.
- `TauCeti.Jacobi.GenusTwo.siegelSpace_real` (non-example): I₂ is not in H₂.
- `TauCeti.Jacobi.GenusTwo.siegelSpace_asymmetric` (non-example): [[i,1],[0,i]] is not in H₂.

Acceptance:

- iI₂ belongs; zero imaginary part does not.
- A positive imaginary part cannot excuse an asymmetric complex matrix.

Source: BFH90, §1, p.546, definition of H₂. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Positive genus-two symplectic similitudes

Declaration: `TauCeti.Jacobi.GenusTwo.positiveSimilitudes` (construction). Node: `MetaplecticAutomorphicForms:MP.8/positive-similitudes`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Geometry`.

Planet: **Genus-two symplectic similitudes**.

GSp₄⁺(R) consists of pairs (g,μ), g∈GL₄(R), μ∈Rˣ positive, satisfying gᵀJg=μJ for native J=[[0,−I],[I,0]]. Multiplication multiplies both components. μ is uniquely determined by g. On H₂, gZ=(AZ+B)(CZ+D)⁻¹; CZ+D is invertible and Im(gZ)=μ(C conjugate(Z)+D)⁻ᵀ Im(Z)(CZ+D)⁻¹.

Construction or proof:

1. The relation defines a subgroup of GL₄(R)×Rˣ; positivity is multiplicative and inverse-stable.
2. Use symplectic block equations after μ⁻¹/² normalization to prove denominator invertibility, symmetry and the imaginary-part formula.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/siegel-space`, `mathlib:Matrix.symplecticGroup`.

Uses:

- BFH §1, p.546, unnumbered fractional-linear action; §2, p.552, (2.7): Uses positive genus-two symplectic similitudes in positive similitude action on siegel space: Define the continuous left action of GSp₄⁺(R) on H₂ by the fractional formula. The factor d(g,Z)=det(CZ+D)/μ(g) is nonzero, holomorphic in Z, satisfies d(gh,Z)=d(g,hZ)d(h,Z), and equals 1 for positive scalar matrices.
- BFH §1, pp.546–549, (1.4)–(1.9): Track the Heisenberg center under t↦μ(g)t and the resulting central-character transport; pull the action back along the rank-two cover projection.

API:

- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_mem` (characterisation): (g,μ) is a member exactly when μ>0 and gᵀJg=μJ.
- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_multiplier_mul` (functoriality): The multiplier of gh is μ(g)μ(h).
- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_symplectic` (compatibility): The μ=1 matrix relation agrees with SymplecticGroup.mem_iff'.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_scalar` (computation): 2I₄ satisfies the relation with μ=4.
- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_reflection` (non-example): diag(I₂,−I₂) has μ=−1 and is excluded.
- `TauCeti.Jacobi.GenusTwo.positiveSimilitudes_base_action` (compatibility): fractional(2I₄,iI₂)=iI₂.

Acceptance:

- μ=1 recovers the native symplectic group.
- Positive scalar tI₄ has μ=t² and fixes every Z.

Source: BFH90, §1, pp.545–546, unnumbered GSp⁺ definition and fractional-linear action. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Positive similitude action on Siegel space

Declaration: `TauCeti.Jacobi.GenusTwo.siegelAction` (construction). Node: `MetaplecticAutomorphicForms:MP.8/siegel-action`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Geometry`.

Define the continuous left action of GSp₄⁺(R) on H₂ by the fractional formula. The factor d(g,Z)=det(CZ+D)/μ(g) is nonzero, holomorphic in Z, satisfies d(gh,Z)=d(g,hZ)d(h,Z), and equals 1 for positive scalar matrices.

Construction or proof:

1. Use the positive-similitude imaginary-part formula to construct an H₂-valued map.
2. Multiply block matrices to prove the action and determinant cocycle laws; divide by the multiplicative positive multiplier.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/positive-similitudes`.

Uses:

- BFH §2, pp.552–554, (2.7)–(2.14); §8, p.601: Use the Siegel action in the square-root cocycle h(g′Z)h′(Z) and compare the μ=1 restriction with the intrinsic metaplectic cover.
- BFH §1, pp.548–549, (1.12)–(1.17): Uses positive similitude action on siegel space in compact stabilizer and positive scalar factor: Let K=Sp₄(R)∩O₄(R). The stabilizer of iI₂ in Sp₄(R) is K, K≅U(2) by A+iB↦[[A,B],[−B,A]], and the stabilizer in GSp₄⁺(R) is R_{>0}·K. The Iwasawa representation g=t n(X)diag(Q,Q⁻ᵀ)κ with t>0, Q upper triangular with positive diagonal, κ∈K is unique.
- BFH §1, p.547, (1.1): Evaluate the transformed Siegel coordinate and CZ+D factor in the BFH realization of the imported symplectic Jacobi action.

API:

- `TauCeti.Jacobi.GenusTwo.siegelAction_one` (simp): 1 acts identically.
- `TauCeti.Jacobi.GenusTwo.siegelAction_mul` (functoriality): (gh)Z=g(hZ).
- `TauCeti.Jacobi.GenusTwo.siegelFactor_cocycle` (relation): d(gh,Z)=d(g,hZ)d(h,Z).
- `TauCeti.Jacobi.GenusTwo.siegelAction_apply` (projection): The underlying matrix of the native Siegel-space action is (AZ+B)(CZ+D)⁻¹, matching the raw block formula.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.siegelAction_scalar` (compatibility): 2I₄ fixes iI₂.
- `TauCeti.Jacobi.GenusTwo.siegelAction_translation` (computation): n(I₂) sends iI₂ to (1+i)I₂.
- `TauCeti.Jacobi.GenusTwo.siegelAction_fourier` (computation): J sends iI₂ to iI₂ (JZ=−Z⁻¹).

Acceptance:

- Normalization removes the positive scalar action on automorphy factors.
- No pointwise choice of square root is asserted to be multiplicative.

Source: BFH90, §1, p.546, unnumbered fractional-linear action; §2, p.552, (2.7). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Genus-two square-root double cover

Declaration: `TauCeti.Jacobi.GenusTwo.similitudeCover` (construction). Node: `MetaplecticAutomorphicForms:MP.8/similitude-cover`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Cover`.

Planet: **Genus-two metaplectic double cover**.

The positive real cover consists of (g,h), g∈GSp₄⁺(R), h:H₂→C continuous with h(Z)²=d(g,Z). Multiplication is (g,h)(g',h')=(gg',Z↦h(g'Z)h'(Z)). Its projection is a continuous surjective homomorphism with kernel {(1,1),(1,−1)}. On μ=1 compare it with MP.1's intrinsic metaplectic double cover, preserving the central sign; positive scalars split by h=1.

Construction or proof:

1. Nonzero determinant factors have continuous square roots on the simply connected H₂; the cocycle makes multiplication well defined.
2. A continuous square root of 1 is constant because H₂ is connected, giving exactly two lifts. Compare generator lifts with MP.1, rather than identify two covers just because both have degree two.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/siegel-action`, `MetaplecticAutomorphicForms:MP.1`.

Uses:

- BFH §3, pp.557–559, (3.1)–(3.8): Use the BFH section and its chosen cover branch in the archimedean Whittaker integral, with the prescribed finite K-type.
- BFH §1, pp.546–549, (1.4)–(1.9): Track the Heisenberg center under t↦μ(g)t and the resulting central-character transport; pull the action back along the rank-two cover projection.
- BFH §1, pp.545–546, definition of GSp⁺(4,R): Uses genus-two square-root double cover in full real similitude extension: Let r=diag(I₂,−I₂) with μ(r)=−1. Every negative similitude is uniquely g₊r. On H₂ put c(Z)=−conjugate Z. Conjugation by r acts on the positive cover by (g,ρ(Z))↦(rgr,conjugate(ρ(c(Z)))); this is an involution because d(rgr,Z)=conjugate d(g,c(Z)). Define the split extension G̃Sp₄(R)=G̃Sp₄⁺(R)⋊C₂ using this involution. I
- RankZeroOneBSD:BSD.2: Consumes the exact BFH coefficient/polar-formula data after the comparisons stated in this packet.

API:

- `TauCeti.Jacobi.GenusTwo.similitudeCover_square` (projection): h(Z)²=d(g,Z).
- `TauCeti.Jacobi.GenusTwo.similitudeCover_mul_root` (relation): The root of the product at Z is h(g'Z)h'(Z).
- `TauCeti.Jacobi.GenusTwo.similitudeCover_kernel` (characterisation): For g=1, the root is identically 1 or identically −1.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.similitudeCover_two_lifts` (non-example): The constant roots 1 and −1 are distinct lifts of the identity.
- `TauCeti.Jacobi.GenusTwo.similitudeCover_base_branch` (computation): √(−det(iI₂))=1.
- `TauCeti.Jacobi.GenusTwo.similitudeCover_scaled_branch` (computation): √(−det(2iI₂))=2, detecting the determinant rather than entrywise square root.

Acceptance:

- Central −1 acts as −1 on theta component vectors.
- Fourier lift has root i√(−det Z), with √(−det Z) positive at Z=iY; the theta S-matrix includes the compensating Weil phase; normalized positive scalars have the canonical lift 1.

Source: BFH90, §2, pp.552–554, (2.7)–(2.14); §8, p.601. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Compact stabilizer and positive scalar factor

Declaration: `TauCeti.Jacobi.GenusTwo.compact_stabilizer` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/compact-stabilizer`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Geometry`.

Let K=Sp₄(R)∩O₄(R). The stabilizer of iI₂ in Sp₄(R) is K, K≅U(2) by A+iB↦[[A,B],[−B,A]], and the stabilizer in GSp₄⁺(R) is R_{>0}·K. The Iwasawa representation g=t n(X)diag(Q,Q⁻ᵀ)κ with t>0, Q upper triangular with positive diagonal, κ∈K is unique.

Construction or proof:

1. Solve the stabilizer block equations after dividing g by √μ; the equations are exactly unitarity of A+iB.
2. Use real positive-definite Cholesky coordinates for Im(g·iI₂), then solve the residual compact factor. The source stabilizer sentence is corrected as E-MP8-2.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/siegel-action`, `tauceti:TauCeti.choleskyEquiv`, `mathlib:Matrix.unitaryGroup`.

Acceptance:

- 2I₄ fixes iI₂ and is outside K.
- K-type decomposition uses K, not its noncompact positive-scalar enlargement.

Suggested signature boundary: The native compact_stabilizer sketch only types the Sp₄ stabilizer equations. The U(2) equivalence, full GSp⁺ scalar stabilizer and unique Iwasawa factorization are target statements in this packet, with signatures awaiting the supplier geometry/Cholesky interfaces.

Source: BFH90, §1, pp.548–549, (1.12)–(1.17). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

## Arithmetic Jacobi actions

### BFH arithmetic subgroup

Declaration: `TauCeti.Jacobi.GenusTwo.arithmeticGamma` (definition). Node: `MetaplecticAutomorphicForms:MP.8/arithmetic-subgroup`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/JacobiAction`.

For N>0, Γ_N is the subgroup of Sp₄(Z) with C≡0 mod N, A₂₁≡D₁₂≡0 mod N. Conjugate by J to obtain the second cusp group. The elliptic lattices are (λ,ρ)∈Z²×N⁻¹Z² at cusp zero and N⁻¹Z²×Z² at cusp one; the center is fixed by ψ_m(t)=e(mt).

Construction or proof:

1. Take the inverse image of the corresponding block subgroup over Z/NZ under reduction of the native integral symplectic group.
2. Conjugation by J swaps the two translation lattices. Check the central phase with N|m before identifying the arithmetic Jacobi subgroup.

Direct dependencies: `mathlib:Matrix.symplecticGroup`, `MetaplecticAutomorphicForms:MP.6`.

Uses:

- BFH §1, p.547, (1.6)–(1.9): Uses bfh arithmetic subgroup in bfh jacobi coordinate space: Specialize the MP.6 Jacobi space to the BFH lattice and cusp j. Its coordinate functions Φ_j:GSp₄⁺(R)×C²→C are smooth in the real group variables, holomorphic in W, invariant under Γ_N at cusp zero or J⁻¹Γ_NJ at cusp one, and invariant under ||[N^(−j)ℓ;N^(j−1)r] for ℓ,r∈Z². For vector values take each continuous linear
- BFH §1, p.549, definition of E_s: Uses bfh arithmetic subgroup in genus-two jacobi eisenstein series: For the genuine elliptic-newform seed, define E_s(g,W)=Σ_{γ∈(P∩Γ_N)\Γ_N} Σ_{λ∈Z²} (I_s||[λ;0])|γ(g,W), where P consists of n(X)diag(Q,Q⁻ᵀ) with detQ>0. The sum is initially defined in a right half-plane of s. For finite-dimensional vector values use the original seed, not a scalar replacement; continuous linear functio
- BFH §1, pp.545–549; §2, p.553, (2.6): Uses bfh arithmetic subgroup in arithmetic and adelic cover compatibility: Use the MP.4 restricted product of normalized local rank-two metaplectic covers, the rational splitting on Sp₄(Q), and the Schrödinger–Weil lattice model. Construct the map from the BFH real arithmetic lift of Γ_N into the quotient by the rational splitting with the finite vector fixed by its specified compact-open sub

API:

- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_mem` (characterisation): Membership has exactly the three printed block congruences.
- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_one` (simp): Identity is a member for every N.
- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_upper` (characterisation): n(X) is a member for each integral symmetric X.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_upper_example` (computation): n([[0,1],[1,0]])∈Γ₈.
- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_lower_example` (non-example): [[I,0],[I,I]] is not in Γ₈.
- `TauCeti.Jacobi.GenusTwo.arithmeticGamma_level_one` (compatibility): Γ₁ equals the native Sp₄(Z).

Acceptance:

- The off-diagonal restrictions are A₂₁ and D₁₂, not both positions in each block.
- The two translation lattices are different.

Source: BFH90, §1, p.547, (1.6)–(1.9). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### BFH symplectic Jacobi slash operator

Declaration: `TauCeti.Jacobi.GenusTwo.bfhSlash` (construction). Node: `MetaplecticAutomorphicForms:MP.8/bfh-slash`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/JacobiAction`.

For m∈Z and γ∈Sp₄(R), on functions Φ(g,W) define (Φ|γ)(g,W)=e(−m Wᵀ(CZ_g+D)⁻¹CW) Φ(γg,(CZ_g+D)⁻ᵀW). This is the coordinate realization of the imported MP.6 Jacobi action with central character ψ_m. The operator is restricted to the symplectic factor; extending it to similitudes requires scaling the central character.

Construction or proof:

1. Specialize the imported Jacobi action to W=R⁴ with its standard polarization, then read its Schrödinger multiplier in BFH coordinates.
2. Prove the right slash composition identity using the determinant-free quadratic cocycle and the transformed W.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/siegel-action`, `MetaplecticAutomorphicForms:MP.6`.

Uses:

- BFH §1, p.547, (1.2)–(1.5): Check the central phase when combining a symplectic slash with elliptic translations; the BFH lattice kills the phase under N|m.
- BFH §2, pp.551–553, (2.2)–(2.3): Use the slash covariance to identify the normalized two-cusp Fourier coefficient, retaining both its level factors and the exponential in the Siegel coordinate.
- BFH Proposition 2.2, p.552, (2.7)–(2.8): Uses bfh symplectic jacobi slash operator in fourier law for bfh theta components: For Φ₁=Φ₀|J and a=m/N, E₁(g;ν)=√(−det Z_g)/(2m) Σμ e(−Nνᵀμ/(2m))E₀(Jg;μ), and E₀(g;ν)=√(−det Z_g)/(2m) Σμ e(+Nνᵀμ/(2m))E₁(Jg;μ). Both sums are over (Z/(2a)Z)². The missing N in the prefactor relative to theta S is due to rescaling Z by N⁻¹.

API:

- `TauCeti.Jacobi.GenusTwo.bfhSlash_one` (simp): Φ|1=Φ on positive-similitude arguments.
- `TauCeti.Jacobi.GenusTwo.bfhSlash_mul` (functoriality): (Φ|γ)|γ'=Φ|(γγ').
- `TauCeti.Jacobi.GenusTwo.bfhSlash_fourier` (compatibility): Φ|J=e(−m Z_g⁻¹[W])Φ(Jg,Z_g⁻¹W).

Unit tests:

- `TauCeti.Jacobi.GenusTwo.bfhSlash_zero` (degenerate): The slash of the zero function is zero.
- `TauCeti.Jacobi.GenusTwo.bfhSlash_unipotent` (computation): At γ=n(B), symmetric B, there is no quadratic multiplier and W is unchanged.
- `TauCeti.Jacobi.GenusTwo.bfhSlash_fourier_at_base` (computation): At g=I and γ=J, the W argument is −iW and the multiplier is e(mi WᵀW).

Acceptance:

- The inverse transpose on W is essential.
- Slash by a positive scalar outside Sp is not silently part of this operator.

Source: BFH90, §1, p.547, (1.1). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### BFH elliptic translation operator

Declaration: `TauCeti.Jacobi.GenusTwo.bfhTranslate` (construction). Node: `MetaplecticAutomorphicForms:MP.8/bfh-translation`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/JacobiAction`.

Define (Φ||[λ;ρ])(g,W)=e(m Z_g[λ]+2m Wᵀλ) Φ(g,W+Z_gλ+ρ), for real λ,ρ. For the order (Φ||[λ;ρ])||[κ;ν], the operator at [λ+κ;ρ+ν] is multiplied by e(2mνᵀλ). The lattice used by BFH kills this scalar because N|m. This is an explicit specialization of the MP.6 Heisenberg central character, not a commutative translation action over arbitrary reals.

Construction or proof:

1. Substitute twice and expand the quadratic polynomial to obtain the central phase.
2. Compare with the chosen MP.0/MP.6 polarization and use the congruence N|m for the two arithmetic lattices.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/bfh-slash`, `MetaplecticAutomorphicForms:MP.6`.

Uses:

- BFH §2, pp.551–553, (2.2)–(2.3): Uses bfh elliptic translation operator in bfh fourier coefficient extraction: For j=0 or 1, define B_j(g;T,R)=N^(−3j)∫_{[0,N^j)^3}∫_{[0,1)^2} Φ_j(n(X)g,W)e(−N^(−j)tr(T(Z_g+X))−N^(1−j)RᵀW)dW dX. X=[[x₄,x₃],[x₃,x₁]], T is the half-integral matrix of Q, R∈Z², and both measures are coordinate Lebesgue measures. The coefficient excludes the exponential in Z_g; it is not the unnormalized torus Fourier
- BFH §2, pp.552–553, (2.9): Uses bfh elliptic translation operator in holomorphic contour shift for fourier coefficients: If Φ_j is continuous, smooth in g, holomorphic in W, and invariant under the BFH elliptic lattice at cusp j, its Fourier extraction obeys B_j(g;T,R)=B_j(g;T−(N/2)(Rλᵀ+λRᵀ)+mN^jλλᵀ,R−2mN^(j−1)λ), λ∈N^(−j)Z². Hence the retained coefficient-invariants theorem applies with a=m/N and c=N^(1−j).
- BFH §1, p.547, (1.6)–(1.9): Uses bfh elliptic translation operator in bfh jacobi coordinate space: Specialize the MP.6 Jacobi space to the BFH lattice and cusp j. Its coordinate functions Φ_j:GSp₄⁺(R)×C²→C are smooth in the real group variables, holomorphic in W, invariant under Γ_N at cusp zero or J⁻¹Γ_NJ at cusp one, and invariant under ||[N^(−j)ℓ;N^(j−1)r] for ℓ,r∈Z². For vector values take each continuous linear

API:

- `TauCeti.Jacobi.GenusTwo.bfhTranslate_zero` (simp): Translation by [0;0] is identity.
- `TauCeti.Jacobi.GenusTwo.bfhTranslate_comp` (relation): The order (Φ||[λ;ρ])||[κ;ν] has central phase e(2mνᵀλ).
- `TauCeti.Jacobi.GenusTwo.bfhTranslate_linear` (functoriality): Translation preserves pointwise addition.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.bfhTranslate_integer_phase` (computation): At m=8, ν=e₀/8, λ=e₀ the phase is e(2)=1.
- `TauCeti.Jacobi.GenusTwo.bfhTranslate_real_phase` (non-example): At m=1, ν=e₀/4, λ=e₀ the phase is −1.
- `TauCeti.Jacobi.GenusTwo.bfhTranslate_constant_at_base` (computation): At m=1, λ=e₀, ρ=0, g=I, W=0, translation of constant 1 is exp(−2π).

Acceptance:

- Nonintegral central phase remains in real translation composition.
- Cusp-one translation invariance follows by J covariance, not by reusing the cusp-zero lattice.
- With the composition order (Φ||[λ;ρ])||[κ;ν], the central phase is e(2m ν·λ).

Source: BFH90, §1, p.547, (1.2)–(1.5). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

## Theta objects and Fourier components

### BFH genus-two theta series

Declaration: `TauCeti.Jacobi.GenusTwo.genusTwoTheta` (construction). Node: `MetaplecticAutomorphicForms:MP.8/genus-two-theta`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Basic`.

Planet: **Genus-two theta series**.

For positive integer a and ν∈Z², specialize the MP.6 theta kernel to θᵃ_ν(Z,W)=Σ_{R∈Z², R≡ν mod 2a} e(Z[R]/(4a)+RᵀW). The series is normally convergent on H₂×C². Its finite residue set is (Z/(2a)Z)², of size (2a)². No rank-one Jacobi-form definition is introduced here.

Construction or proof:

1. Use the general theta convergence theorem at the positive-definite rank-two lattice; alternatively the least eigenvalue supplies a locally uniform Gaussian majorant.
2. Identify the coset sum with the imported theta convention and prove residue representative independence. In diagonal coordinates factor the sum into the existing two-variable classical theta functions.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/siegel-space`, `MetaplecticAutomorphicForms:MP.6`, `mathlib:jacobiTheta₂`.

Uses:

- BFH Proposition 2.1, p.551: Uses bfh genus-two theta series in gaussian orthogonality of genus-two theta series: For a>0, Z=X+iY∈H₂ and μ,ν∈Z², the Lebesgue integral over C²/(Z Z²+Z²) of θᵃ_μ(Z,W) conjugate(θᵃ_ν(Z,W)) exp(−4πa Y⁻¹[Im W]) is √det(Y)/(2a) if μ≡ν mod 2a, and zero otherwise. In W=Zλ+ρ coordinates the measure is det(Y)dλdρ on [0,1)^4.
- BFH §2, p.554, (2.12)–(2.13): Uses bfh genus-two theta series in genus-two theta fourier transform: For a>0 and Z∈H₂, θᵃ_ν(−Z⁻¹,Z⁻¹W)=e(aZ⁻¹[W]) √(−det Z)/(2a) Σ_{μ mod2a} e(−νᵀμ/(2a))θᵃ_μ(Z,W). The holomorphic branch √(−det Z) is positive when Z=iY. The finite Fourier matrix has square equal to residue negation after normalization by 1/(2a).
- BFH Proposition 2.2, pp.552–554, (2.4)–(2.6): Uses bfh genus-two theta series in bfh theta component projection: For a=m/N>0, define E_j(g;ν) by the orthogonal projection of the coordinate function onto θᵃ_ν at Z′=N^(1−2j)Z_g, W′=N^(1−j)W, divided by its norm √det(Im Z′)/(2a). Integrate in W′ on its period torus. For a BFH Jacobi function this equals the component in Proposition 2.2. Define the projection before its decomposition

API:

- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_residue` (relation): θᵃ_{ν+2aℓ}=θᵃ_ν.
- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_elliptic` (compatibility): θ(Z,W)=e(aZ[λ]+2aWᵀλ)θ(Z,W+Zλ+ρ) for integral λ,ρ.
- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_diagonal` (compatibility): At ν=0 and diagonal Z, θ=∏i jacobiTheta₂(2aW_i,2aZ_ii).

Unit tests:

- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_negation` (compatibility): θᵃ_{−ν}(Z,−W)=θᵃ_ν(Z,W).
- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_period` (computation): θ¹_(2,0)=θ¹_(0,0).
- `TauCeti.Jacobi.GenusTwo.genusTwoTheta_product` (compatibility): θ¹_0(iI₂,0)=jacobiTheta₂(0,2i)².

Acceptance:

- The denominator is 4a and the vector period is 2a.
- Normal convergence includes all derivatives on compact subsets.

Source: BFH90, §2, p.551, (2.1). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Half-integral matrix dictionary

Declaration: `TauCeti.Jacobi.GenusTwo.quadraticMatrix` (construction). Node: `MetaplecticAutomorphicForms:MP.8/quadratic-matrix`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Basic`.

For native Q:QuadraticForm Z Z², put A=Q(e₀), C=Q(e₁), B=Q(e₀+e₁)−A−C. Define T(Q)=[[A,B/2],[B/2,C]] in M₂(Q). This identifies native integral quadratic forms with symmetric rational matrices having integral diagonal and twice-integral off-diagonal. Q(x)=xᵀT(Q)x for integral x.

Construction or proof:

1. Expand Q in the ordered coordinate basis by the native basis expansion, valid without inverting 2 over Z.
2. Only after embedding coefficients into Q divide the mixed term by two. The reverse construction uses native products of coordinate linear forms.

Direct dependencies: `mathlib:QuadraticForm`, `mathlib:QuadraticMap.sum_repr_sq_add_sum_repr_mul_polar`, `mathlib:QuadraticMap.toQuadraticMap_toBilin`.

Uses:

- BFH §2, pp.551–553, (2.2)–(2.3): Uses half-integral matrix dictionary in bfh fourier coefficient extraction: For j=0 or 1, define B_j(g;T,R)=N^(−3j)∫_{[0,N^j)^3}∫_{[0,1)^2} Φ_j(n(X)g,W)e(−N^(−j)tr(T(Z_g+X))−N^(1−j)RᵀW)dW dX. X=[[x₄,x₃],[x₃,x₁]], T is the half-integral matrix of Q, R∈Z², and both measures are coordinate Lebesgue measures. The coefficient excludes the exponential in Z_g; it is not the unnormalized torus Fourier
- BFH §2, pp.552–553, before Proposition 2.2: Uses half-integral matrix dictionary in theta-component fourier coefficients: C_j(g;U,ν) is the Fourier coefficient B_j(g;T,ν) with T=(U+N^(2−j)ννᵀ)/(4m); set it to zero if this is not an integral quadratic form, equivalently a half-integral symmetric matrix. This computational construction is defined before imposing Jacobi invariance. For the actual BFH family, the shift theorem makes the resid
- BFH §5, p.580, definition of H before Proposition 5.1: Uses half-integral matrix dictionary in genus-two fourier unfolding kernel: For Y=QQᵀ positive definite, Z=X+iY, detC≠0, define H(Q,s;C,T,R)=(2mN³)^−1∫_{R³}√(−detZ)(detY/|detZ|²)^(s/2) I([[0,−C⁻ᵀ],[C,0]][[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]]) e(Z[R]/(4m)−N⁻¹tr(TZ))dX. The positive-base power is exp((s/2)log(detY/|detZ|²)). Its quadratic shift identity is H(Q,s;C,N^(1−j)T,N^(1−j)R)=H(Q,s;C,N^(1−j)U/(4m),0) when T=

API:

- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_symmetric` (projection): T(Q) is symmetric.
- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_eval` (compatibility): For integral x, xᵀT(Q)x=Q(x).
- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_injective` (characterisation): The matrix dictionary is injective.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_mixed` (computation): T(x₀x₁)=[[0,1/2],[1/2,0]].
- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_square` (computation): T(x₀²)=diag(1,0).
- `TauCeti.Jacobi.GenusTwo.quadraticMatrix_negative` (non-example): T(−x₀²)=diag(−1,0); no positivity condition is included.

Acceptance:

- Q=x₀x₁ maps to off-diagonal 1/2.
- U=4mT−N^(2−j)RRᵀ equals N times the rational matrix of the retained discriminant form with a=m/N,c=N^(1−j).

Source: BFH90, §2, pp.551–553, (2.2),(2.9). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### BFH Fourier coefficient extraction

Declaration: `TauCeti.Jacobi.GenusTwo.fourierCoefficient` (definition). Node: `MetaplecticAutomorphicForms:MP.8/fourier-coefficient`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/FourierExtraction`.

For j=0 or 1, define B_j(g;T,R)=N^(−3j)∫_{[0,N^j)^3}∫_{[0,1)^2} Φ_j(n(X)g,W)e(−N^(−j)tr(T(Z_g+X))−N^(1−j)RᵀW)dW dX. X=[[x₄,x₃],[x₃,x₁]], T is the half-integral matrix of Q, R∈Z², and both measures are coordinate Lebesgue measures. The coefficient excludes the exponential in Z_g; it is not the unnormalized torus Fourier integral.

Construction or proof:

1. Transport coordinate Lebesgue measures from R³ and R²; integrate over half-open fundamental boxes.
2. The three X periods contribute N^(3j), explaining the normalization. Exponentials use the full trace, hence the mixed entry appears twice.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/quadratic-matrix`, `MetaplecticAutomorphicForms:MP.8/bfh-slash`, `MetaplecticAutomorphicForms:MP.8/bfh-translation`.

Uses:

- BFH §2, pp.552–553, (2.9): Uses bfh fourier coefficient extraction in holomorphic contour shift for fourier coefficients: If Φ_j is continuous, smooth in g, holomorphic in W, and invariant under the BFH elliptic lattice at cusp j, its Fourier extraction obeys B_j(g;T,R)=B_j(g;T−(N/2)(Rλᵀ+λRᵀ)+mN^jλλᵀ,R−2mN^(j−1)λ), λ∈N^(−j)Z². Hence the retained coefficient-invariants theorem applies with a=m/N and c=N^(1−j).
- BFH §2, pp.552–553, before Proposition 2.2: Specialize B_j to T=(U+N^(2−j)ννᵀ)/(4m), setting the coefficient to zero for a nonintegral quadratic index; invoke the shift theorem for residue independence.
- BFH §2, pp.556–557, Proposition 2.7, Corollary 2.8: Uses bfh fourier coefficient extraction in fourier coefficient levi covariance: For y∈Γ⁰(N) at cusp j=1 and y∈Γ₀(N) at j=0, B_j(m(y)g;T,R)=B_j(g;yᵀTy,yᵀR) and C_j(m(y)g;U,R)=C_j(g;yᵀUy,yᵀR), with the corresponding residue reduction. Corollary 2.8 specializes ν=(0,r) and the diagonal U₁(−ND),U₀(−D) to the invariances required for §6–8 Fourier extraction.

API:

- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_zero` (simp): The zero function has every coefficient zero.
- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_add` (functoriality): Extraction is additive for integrable summands on the boxes.
- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_scalar` (functoriality): Extraction commutes with complex scalar multiplication.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_constant` (degenerate): For constant 1, the coefficient at Q=0,R=0 is 1 at both cusps.
- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_vector_mode` (computation): For Φ(g,W)=e(N^(1−j)RᵀW), Q=0 and matching R, the coefficient is 1.
- `TauCeti.Jacobi.GenusTwo.fourierCoefficient_wrong_vector` (non-example): For constant 1 and nonzero R, the coefficient at Q=0 is 0 (N>0).

Acceptance:

- For a single Fourier mode with a matching index, coefficient extraction returns its amplitude.
- At cusp one the X period is N, not 1.

Source: BFH90, §2, pp.551–553, (2.2)–(2.3). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Gaussian orthogonality of genus-two theta series

Declaration: `TauCeti.Jacobi.GenusTwo.theta_pairing` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/theta-pairing`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Pairing`.

For a>0, Z=X+iY∈H₂ and μ,ν∈Z², the Lebesgue integral over C²/(Z Z²+Z²) of θᵃ_μ(Z,W) conjugate(θᵃ_ν(Z,W)) exp(−4πa Y⁻¹[Im W]) is √det(Y)/(2a) if μ≡ν mod 2a, and zero otherwise. In W=Zλ+ρ coordinates the measure is det(Y)dλdρ on [0,1)^4.

Construction or proof:

1. Integrate in ρ first; character orthogonality kills different residues and forces equal summation vectors.
2. Unfold the λ sum to R². The real Gaussian integral is det(Y)⁻¹/²/(2a); multiply by the fundamental-domain Jacobian det(Y). BFH omits the proof, but this argument specifies the needed multivariate Gaussian input. Use the pinned Cholesky equivalence, its determinant Jacobian, Fubini and the existing root-namespace integral_gaussian/integrable_exp_neg_mul_sq; GN.0 contains lattices/covolume, not this Gaussian integral.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/genus-two-theta`, `MetaplecticAutomorphicForms:MP.8/theta-normal-convergence`, `mathlib:integral_gaussian`, `mathlib:integrable_exp_neg_mul_sq`, `tauceti:TauCeti.choleskyEquiv`.

Acceptance:

- At Y=4I₂ the norm square is 2/a, not 8/a.
- The orthogonality proves linear independence of theta components.

Source: BFH90, Proposition 2.1, p.551. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Holomorphic contour shift for Fourier coefficients

Declaration: `TauCeti.Jacobi.GenusTwo.coefficient_shift_analytic` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/coefficient-shift-analytic`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/FourierExtraction`.

If Φ_j is continuous, smooth in g, holomorphic in W, and invariant under the BFH elliptic lattice at cusp j, its Fourier extraction obeys B_j(g;T,R)=B_j(g;T−(N/2)(Rλᵀ+λRᵀ)+mN^jλλᵀ,R−2mN^(j−1)λ), λ∈N^(−j)Z². Hence the retained coefficient-invariants theorem applies with a=m/N and c=N^(1−j).

Construction or proof:

1. Substitute the lattice translation law in the coefficient integral.
2. Move the W contour by −(Z_g+X)λ using holomorphy and cancellation on opposite periodic faces. Expand the quadratic exponent, then use the native matrix dictionary.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-coefficient`, `MetaplecticAutomorphicForms:MP.8/bfh-translation`, `MetaplecticAutomorphicForms:MP.8/fourier-shift`, `MetaplecticAutomorphicForms:MP.8/coefficient-invariants`, `MetaplecticAutomorphicForms:MP.8/bfh-jacobi-specialization`.

Acceptance:

- The analytic invariance premise of the nine-node component is proved here.
- Each contour face cancellation is justified before changing integration paths.

Source: BFH90, §2, pp.552–553, (2.9). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### BFH two-cusp theta decomposition

Declaration: `TauCeti.Jacobi.GenusTwo.theta_decomposition` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/theta-decomposition`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Decomposition`.

Under the Jacobi regularity and lattice hypotheses above, there are unique components E_j(g;ν), ν mod 2a, satisfying Φ_j(g,W)=Σν E_j(g;ν) θᵃ_ν(N^(1−2j)Z_g,N^(1−j)W). Put C_j(g;U,ν)=B_j(g;T,ν) if T=(U+N^(2−j)ννᵀ)/(4m) is half-integral, and 0 otherwise. Then E_j(g;ν)=Σ_{U integral symmetric} C_j(g;U,ν)e(tr(UZ_g)/(4mN^j)), with the convergence inherited from the Fourier expansion.

Construction or proof:

1. Apply coefficient shift and the orbit classification to regroup the absolutely locally convergent Fourier series by ν and U.
2. If an orbit exists, the prescribed residue lift produces a unique half-integral T; no arbitrary U is assumed representable. Gaussian orthogonality proves uniqueness.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/theta-pairing`, `MetaplecticAutomorphicForms:MP.8/coefficient-shift-analytic`, `MetaplecticAutomorphicForms:MP.8/orbit-classification`, `MetaplecticAutomorphicForms:MP.8/unique-residue-lift`, `MetaplecticAutomorphicForms:MP.6`, `MetaplecticAutomorphicForms:MP.8/theta-components`, `MetaplecticAutomorphicForms:MP.8/theta-coefficient`, `MetaplecticAutomorphicForms:MP.8/bfh-jacobi-specialization`, `MetaplecticAutomorphicForms:MP.8/theta-normal-convergence`.

Acceptance:

- Vanishing at non-half-integral recovered T is part of C_j.
- The components depend on g, including its K-coordinate, rather than just Z_g.

Source: BFH90, Proposition 2.2, pp.552–554, (2.4)–(2.6). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Genus-two theta Fourier transform

Declaration: `TauCeti.Jacobi.GenusTwo.theta_fourier_transform` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/theta-fourier-transform`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Decomposition`.

For a>0 and Z∈H₂, θᵃ_ν(−Z⁻¹,Z⁻¹W)=e(aZ⁻¹[W]) √(−det Z)/(2a) Σ_{μ mod2a} e(−νᵀμ/(2a))θᵃ_μ(Z,W). The holomorphic branch √(−det Z) is positive when Z=iY. The finite Fourier matrix has square equal to residue negation after normalization by 1/(2a).

Construction or proof:

1. Use the rank-two Poisson theorem supplied by MP.6, with the complex Gaussian Fourier transform and self-dual coordinate measures.
2. Split the dual lattice by residues. Compare the branch with the Fourier-generator Weil phase from MP.2 and the lift i√(−det Z) in the actual cover.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/genus-two-theta`, `MetaplecticAutomorphicForms:MP.2`, `MetaplecticAutomorphicForms:MP.6`.

Acceptance:

- The prefactor is 1/(2a), not 1/√(2a).
- At Z=iI₂ the indicated branch is 1.

Source: BFH90, §2, p.554, (2.12)–(2.13). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Fourier law for BFH theta components

Declaration: `TauCeti.Jacobi.GenusTwo.theta_component_fourier_law` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/theta-component-fourier-law`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Decomposition`.

For Φ₁=Φ₀|J and a=m/N, E₁(g;ν)=√(−det Z_g)/(2m) Σμ e(−Nνᵀμ/(2m))E₀(Jg;μ), and E₀(g;ν)=√(−det Z_g)/(2m) Σμ e(+Nνᵀμ/(2m))E₁(Jg;μ). Both sums are over (Z/(2a)Z)². The missing N in the prefactor relative to theta S is due to rescaling Z by N⁻¹.

Construction or proof:

1. Insert theta decomposition into Φ₁=Φ₀|J and apply the rank-two theta Fourier formula at N⁻¹Z_g.
2. Compare independent theta components by Gaussian orthogonality, keeping the positive-real scaling in the square root.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/theta-decomposition`, `MetaplecticAutomorphicForms:MP.8/theta-fourier-transform`, `MetaplecticAutomorphicForms:MP.8/bfh-slash`, `MetaplecticAutomorphicForms:MP.8/theta-components`, `MetaplecticAutomorphicForms:MP.8/bfh-jacobi-specialization`.

Acceptance:

- Use opposite signs for the two finite Fourier kernels.
- Normalized theta vectors yield a genuine cover representation, not a representation of the linear Sp group.

Source: BFH90, Proposition 2.2, p.552, (2.7)–(2.8). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### BFH Jacobi coordinate space

Declaration: `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions` (construction). Node: `MetaplecticAutomorphicForms:MP.8/bfh-jacobi-specialization`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/JacobiAction`.

Specialize the MP.6 Jacobi space to the BFH lattice and cusp j. Its coordinate functions Φ_j:GSp₄⁺(R)×C²→C are smooth in the real group variables, holomorphic in W, invariant under Γ_N at cusp zero or J⁻¹Γ_NJ at cusp one, and invariant under ||[N^(−j)ℓ;N^(j−1)r] for ℓ,r∈Z². For vector values take each continuous linear functional on the finite-dimensional K-type space. Weight and multiplier are inherited from MP.6; these conditions alone do not assert a new weight.

Construction or proof:

1. Evaluate the imported Jacobi form on BFH group coordinates and compare the Heisenberg central character and the two translation lattices.
2. Construct the coordinate space as a native subspace of functions with the stated analytic and covariance properties; establish the J transport using slash covariance.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/arithmetic-subgroup`, `MetaplecticAutomorphicForms:MP.8/bfh-slash`, `MetaplecticAutomorphicForms:MP.8/bfh-translation`, `MetaplecticAutomorphicForms:MP.6`.

Uses:

- BFH §2, pp.552–553, (2.9): Uses bfh jacobi coordinate space in holomorphic contour shift for fourier coefficients: If Φ_j is continuous, smooth in g, holomorphic in W, and invariant under the BFH elliptic lattice at cusp j, its Fourier extraction obeys B_j(g;T,R)=B_j(g;T−(N/2)(Rλᵀ+λRᵀ)+mN^jλλᵀ,R−2mN^(j−1)λ), λ∈N^(−j)Z². Hence the retained coefficient-invariants theorem applies with a=m/N and c=N^(1−j).
- BFH Proposition 2.2, pp.552–554, (2.4)–(2.6): Uses bfh jacobi coordinate space in bfh theta component projection: For a=m/N>0, define E_j(g;ν) by the orthogonal projection of the coordinate function onto θᵃ_ν at Z′=N^(1−2j)Z_g, W′=N^(1−j)W, divided by its norm √det(Im Z′)/(2a). Integrate in W′ on its period torus. For a BFH Jacobi function this equals the component in Proposition 2.2. Define the projection before its decomposition
- BFH Proposition 2.2, p.552, (2.7)–(2.8): Uses bfh jacobi coordinate space in fourier law for bfh theta components: For Φ₁=Φ₀|J and a=m/N, E₁(g;ν)=√(−det Z_g)/(2m) Σμ e(−Nνᵀμ/(2m))E₀(Jg;μ), and E₀(g;ν)=√(−det Z_g)/(2m) Σμ e(+Nνᵀμ/(2m))E₁(Jg;μ). Both sums are over (Z/(2a)Z)². The missing N in the prefactor relative to theta S is due to rescaling Z by N⁻¹.

API:

- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_zero` (constructor): The zero coordinate function belongs.
- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_translation` (projection): Every member satisfies its scaled elliptic lattice law.
- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_fourier_cusp` (compatibility): Slash by J transports cusp zero to cusp one.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_zero_test` (degenerate): Zero belongs for N=8,m=16 at each cusp.
- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_constant_zero_index` (degenerate): Constant 1 belongs at index m=0.
- `TauCeti.Jacobi.GenusTwo.bfhJacobiFunctions_constant_positive_index` (non-example): Constant 1 is excluded at N=8,m=16.

Acceptance:

- The specialization imports, rather than owns, general Jacobi forms and theta decomposition.
- At positive m the constant function 1 fails the elliptic law.

Source: BFH90, §1, p.547, (1.6)–(1.9). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### BFH theta component projection

Declaration: `TauCeti.Jacobi.GenusTwo.thetaComponent` (construction). Node: `MetaplecticAutomorphicForms:MP.8/theta-components`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Components`.

For a=m/N>0, define E_j(g;ν) by the orthogonal projection of the coordinate function onto θᵃ_ν at Z′=N^(1−2j)Z_g, W′=N^(1−j)W, divided by its norm √det(Im Z′)/(2a). Integrate in W′ on its period torus. For a BFH Jacobi function this equals the component in Proposition 2.2. Define the projection before its decomposition theorem.

Construction or proof:

1. Integrate against the conjugate theta kernel and its Gaussian torus density in the specified W′ coordinates.
2. Gaussian orthogonality fixes the norm and proves that a basis theta function projects to its Kronecker coordinate.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/theta-pairing`, `MetaplecticAutomorphicForms:MP.8/genus-two-theta`.

Uses:

- BFH Proposition 2.2, pp.552–554, (2.4)–(2.6): Uses bfh theta component projection in bfh theta component projection: For a=m/N>0, define E_j(g;ν) by the orthogonal projection of the coordinate function onto θᵃ_ν at Z′=N^(1−2j)Z_g, W′=N^(1−j)W, divided by its norm √det(Im Z′)/(2a). Integrate in W′ on its period torus. For a BFH Jacobi function this equals the component in Proposition 2.2. Define the projection before its decomposition
- BFH Proposition 2.2, p.552, (2.7)–(2.8): Uses bfh theta component projection in fourier law for bfh theta components: For Φ₁=Φ₀|J and a=m/N, E₁(g;ν)=√(−det Z_g)/(2m) Σμ e(−Nνᵀμ/(2m))E₀(Jg;μ), and E₀(g;ν)=√(−det Z_g)/(2m) Σμ e(+Nνᵀμ/(2m))E₁(Jg;μ). Both sums are over (Z/(2a)Z)². The missing N in the prefactor relative to theta S is due to rescaling Z by N⁻¹.
- BFH §6, pp.583,585–586, definitions before Propositions 6.1–6.2: Extract the finite theta/Fourier coefficients at the two cusps before the normalized x₂ Whittaker integral, preserving the opposite-cusp finite Fourier sum.

API:

- `TauCeti.Jacobi.GenusTwo.thetaComponent_zero` (simp): Zero function has component zero.
- `TauCeti.Jacobi.GenusTwo.thetaComponent_residue` (relation): Components only depend on ν mod 2a.
- `TauCeti.Jacobi.GenusTwo.thetaComponent_scalar` (functoriality): Scaling the Jacobi coordinate function scales its Gaussian component projection.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.thetaComponent_basis` (characterisation): Projecting θᵃ_μ yields 1 at congruent ν and 0 otherwise.
- `TauCeti.Jacobi.GenusTwo.thetaComponent_zero_test` (degenerate): The component of the zero coordinate function is zero.
- `TauCeti.Jacobi.GenusTwo.thetaComponent_period` (computation): At N=8,a=2,j=1, the residue vectors (0,5) and (0,1) give the same component.

Acceptance:

- A single theta basis vector projects to its Kronecker coordinate.
- Residue vectors differing by 2a have identical projection kernels.

Source: BFH90, Proposition 2.2, pp.552–554, (2.4)–(2.6). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Theta-component Fourier coefficients

Declaration: `TauCeti.Jacobi.GenusTwo.thetaCoefficient` (construction). Node: `MetaplecticAutomorphicForms:MP.8/theta-coefficient`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Components`.

C_j(g;U,ν) is the Fourier coefficient B_j(g;T,ν) with T=(U+N^(2−j)ννᵀ)/(4m); set it to zero if this is not an integral quadratic form, equivalently a half-integral symmetric matrix. This computational construction is defined before imposing Jacobi invariance. For the actual BFH family, the shift theorem makes the residue choice independent.

Construction or proof:

1. Use the native quadratic-form/matrix equivalence, not entrywise integrality.
2. Extract B at the unique quadratic form representing the candidate T, or use zero if it fails the diagonal/mixed parity test.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/quadratic-matrix`, `MetaplecticAutomorphicForms:MP.8/fourier-coefficient`, `MetaplecticAutomorphicForms:MP.8/coefficient-shift-analytic`.

Uses:

- BFH Proposition 2.2, pp.552–554, (2.4)–(2.6): Uses theta-component fourier coefficients in bfh theta component projection: For a=m/N>0, define E_j(g;ν) by the orthogonal projection of the coordinate function onto θᵃ_ν at Z′=N^(1−2j)Z_g, W′=N^(1−j)W, divided by its norm √det(Im Z′)/(2a). Integrate in W′ on its period torus. For a BFH Jacobi function this equals the component in Proposition 2.2. Define the projection before its decomposition
- BFH §2, pp.556–557, Proposition 2.7, Corollary 2.8: Uses theta-component fourier coefficients in fourier coefficient levi covariance: For y∈Γ⁰(N) at cusp j=1 and y∈Γ₀(N) at j=0, B_j(m(y)g;T,R)=B_j(g;yᵀTy,yᵀR) and C_j(m(y)g;U,R)=C_j(g;yᵀUy,yᵀR), with the corresponding residue reduction. Corollary 2.8 specializes ν=(0,r) and the diagonal U₁(−ND),U₀(−D) to the invariances required for §6–8 Fourier extraction.
- BFH §6, pp.583,585–586, definitions before Propositions 6.1–6.2: Extract the finite theta/Fourier coefficients at the two cusps before the normalized x₂ Whittaker integral, preserving the opposite-cusp finite Fourier sum.

API:

- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_recovered` (compatibility): If U=4mT−N^(2−j)ννᵀ, recover B_j(g;T,ν).
- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_zero` (simp): The zero coordinate function has zero C_j.
- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_scalar` (functoriality): C_j(cΦ)=cC_j(Φ).

Unit tests:

- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_zero_test` (degenerate): All theta Fourier coefficients of zero vanish.
- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_parity` (non-example): For N=8,m=16,j=1,U=I,ν=0 the coefficient is zero for any coordinate function.
- `TauCeti.Jacobi.GenusTwo.thetaCoefficient_integral_index` (computation): At N=8,m=16,j=1,U=diag(0,56),ν=(0,1), the recovered index is T=diag(0,1).

Acceptance:

- At N=8,m=16,j=1,U=I,ν=0 the candidate diagonal 1/64 is not half-integral, so C=0.
- A change of residue is accompanied by the BFH index shift; this invariance requires the actual Jacobi function.

Source: BFH90, §2, pp.552–553, before Proposition 2.2. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

## Newform seeds and Jacobi Eisenstein series

### Elliptic-newform section on genus-two similitudes

Declaration: `TauCeti.Jacobi.GenusTwo.bfhSeed` (construction). Node: `MetaplecticAutomorphicForms:MP.8/bfh-seed`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Seed`.

Let f be the normalized even-weight k≥2 newform of level M with trivial character, N divisible by 8M, and f̂(τ)=τ^(−k)f(−1/(Nτ)). Set F(Q)=f̂(Qi)(ci+d)^(−k)det(Q)^(k/2). For a continuous finite-dimensional right K-representation σ trivial on −I and v with vσ(κ)=ρ_k(κ)v on the embedded SO(2), construct the unique I(t n(X)diag(Q,Q⁻ᵀ)κ)=F(Q)vσ(κ). Positive central scalars act trivially. The original f has level M in its Fricke and completed L-function equations.

Construction or proof:

1. Construct I on the unique positive triangular Iwasawa coordinates; independence under the larger GL₂⁺ coordinate description follows from F's SO(2) weight law.
2. Check left Γ₀(N) invariance and right K equivariance. Use f̂ at auxiliary N while keeping the original f's level M as recorded in E-MP8-3.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/compact-stabilizer`, `AutomorphicFormsOnReductiveGroups:AF.5`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

Uses:

- BFH §1, p.549, (1.17): Uses elliptic-newform section on genus-two similitudes in bfh normalized section family: For the seed I, set I_s(g)=det(Im Z_g)^(s/2) I(g), using the positive-real logarithm, g∈GSp₄⁺(R). This is the precise BFH parameter s; no shift to a generic spectral parameter is implicit. The Levi exponent and positive-scalar behavior determine the comparison with normalized induced spaces.
- BFH §3, pp.557–559, (3.1)–(3.8): Use the BFH section and its chosen cover branch in the archimedean Whittaker integral, with the prescribed finite K-type.
- BFH §3, p.559, Proposition 3.2: Uses elliptic-newform section on genus-two similitudes in whittaker integral convergence: For k≥2 even, a continuous finite-dimensional BFH K-type σ, weight-k v, T linear, φ(κ)=T(vσ(κ)), ε∈{−1,0,1}, y₁,y₂>0, the integral defining W^ε is absolutely convergent for Re s>2, locally uniformly with derivatives in s on compact subsets of that half-plane.

API:

- `TauCeti.Jacobi.GenusTwo.bfhSeed_identity` (projection): I(I₄)=F(I₂)v.
- `TauCeti.Jacobi.GenusTwo.bfhSeed_zero` (simp): F=0 gives I=0.
- `TauCeti.Jacobi.GenusTwo.bfhSeed_scalar` (functoriality): Scaling F scales I.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.bfhSeed_base` (computation): F(I₂)=1 implies I(I₄)=v.
- `TauCeti.Jacobi.GenusTwo.bfhSeed_zero_vector` (degenerate): v=0 gives I=0.
- `TauCeti.Jacobi.GenusTwo.bfhSeed_central` (compatibility): I(2I₄)=I(I₄).

Acceptance:

- The representation need not be one dimensional.
- At I₄ the seed is F(I₂)v; the zero elliptic datum produces zero seed.

Source: BFH90, §1, pp.547–550, (1.11)–(1.16). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### BFH normalized section family

Declaration: `TauCeti.Jacobi.GenusTwo.inducedSeedFamily` (definition). Node: `MetaplecticAutomorphicForms:MP.8/induced-seed-family`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Seed`.

For the seed I, set I_s(g)=det(Im Z_g)^(s/2) I(g), using the positive-real logarithm, g∈GSp₄⁺(R). This is the precise BFH parameter s; no shift to a generic spectral parameter is implicit. The Levi exponent and positive-scalar behavior determine the comparison with normalized induced spaces.

Construction or proof:

1. Use strict positive definiteness to take the real logarithm of det(Im Z_g).
2. Compute the Levi and center covariance directly, and differentiate the scalar factor in s.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/bfh-seed`, `MetaplecticAutomorphicForms:MP.8/siegel-action`.

Uses:

- BFH §1, p.549, definition of E_s: Uses bfh normalized section family in genus-two jacobi eisenstein series: For the genuine elliptic-newform seed, define E_s(g,W)=Σ_{γ∈(P∩Γ_N)\Γ_N} Σ_{λ∈Z²} (I_s||[λ;0])|γ(g,W), where P consists of n(X)diag(Q,Q⁻ᵀ) with detQ>0. The sum is initially defined in a right half-plane of s. For finite-dimensional vector values use the original seed, not a scalar replacement; continuous linear functio

API:

- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_zero` (simp): I₀=I.
- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_add` (relation): I_(s+t)=det(Y)^(t/2) I_s.
- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_holomorphic` (structure): For each positive g the section is entire in s.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_identity` (computation): At g=I₄ the section is I(I₄) for every s.
- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_levi` (computation): At diag(2I₂,(1/2)I₂) the scalar is 4^s.
- `TauCeti.Jacobi.GenusTwo.inducedSeedFamily_zero_seed` (degenerate): A zero seed yields the zero family.

Acceptance:

- At s=0 the family recovers I.
- At g=diag(2I₂,(1/2)I₂), detY=16 and the factor is 4^s, not 16^s.

Source: BFH90, §1, p.549, (1.17). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Genus-two Jacobi Eisenstein series

Declaration: `TauCeti.Jacobi.GenusTwo.jacobiEisenstein` (construction). Node: `MetaplecticAutomorphicForms:MP.8/jacobi-eisenstein`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Basic`.

Planet: **Genus-two Jacobi Eisenstein series**.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For the genuine elliptic-newform seed, define E_s(g,W)=Σ_{γ∈(P∩Γ_N)\Γ_N} Σ_{λ∈Z²} (I_s||[λ;0])|γ(g,W), where P consists of n(X)diag(Q,Q⁻ᵀ) with detQ>0. The sum is initially defined in a right half-plane of s. For finite-dimensional vector values use the original seed, not a scalar replacement; continuous linear functionals commute with convergent sums. Its theta components are genuine half-integral-weight automorphic forms on the double cover.

Construction or proof:

1. Prove invariance of the summand under the specified parabolic stabilizer using seed covariance and the elliptic central character.
2. Form the native quotient and the lattice sum. Convergence is a separate theorem, and genuineness belongs to the theta-component comparison. Native G/H has representatives gH; the BFH H\G has representatives Hg. Inversion converts the former into the latter, and cosetMatrix chooses that inverse representative.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/induced-seed-family`, `MetaplecticAutomorphicForms:MP.8/arithmetic-subgroup`, `MetaplecticAutomorphicForms:MP.8/bfh-slash`, `MetaplecticAutomorphicForms:MP.8/bfh-translation`, `MetaplecticAutomorphicForms:MP.6`.

Uses:

- BFH §5, pp.580–582, Proposition 5.1: Uses genus-two jacobi eisenstein series in cusp-one full-rank fourier unfolding: For Re s sufficiently large and g=[[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]], B₁(g;T,R)=Σ_{C nonsingular,C₁₂≡0N / left Γ⁰(N)} S₁(C;T,R)|det C|^−s H(Q,s;C,T,R). It is C₁₂≡0N, not C≡0N. Since D≡0N and the bottom pair is primitive, all C in this cusp have full rank.
- BFH §1, p.549, I_s; §2, pp.553–554; §8, p.601: Lift the actual theta-component family by h(iI₂), verify its genuine central sign, and compare its Levi exponent with normalized induction at ν=s−2.
- RankZeroOneBSD:BSD.2: Consumes the exact BFH coefficient/polar-formula data after the comparisons stated in this packet.

API:

- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_zero` (simp): Zero seed gives zero series.
- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_scalar` (functoriality): Scaling the seed scales the series.
- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_summand` (projection): The identity coset,λ=0 summand is I_s(g).

Unit tests:

- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_zero_test` (degenerate): Every coefficient of the zero-seed E_s is zero.
- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_identity_term` (computation): At g=I,W=0 the identity-coset,λ=0 summand is I(I).
- `TauCeti.Jacobi.GenusTwo.jacobiEisenstein_nonzero_translation` (computation): At g=I,W=0,m=1,λ=e₀ the identity-coset summand is exp(−2π)I(I).

Acceptance:

- The detQ>0 restriction avoids identifying an extra component.
- No summability or continuation is a field of the definition.

Source: BFH90, §1, p.549, definition of E_s. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

## Whittaker integrals and local analytic tests

### Genus-two archimedean Whittaker functions

Declaration: `TauCeti.Jacobi.GenusTwo.whittakerFunction` (definition). Node: `MetaplecticAutomorphicForms:MP.8/whittaker-functions`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`.

For k≥2 even and φ(κ)=T(vσ(κ)) with the BFH SO(2) weight k, define W^ε(y₁,y₂;s)=(y₁y₂)^(4−s)y₂^(k/2)∫_{R³} √(−det(X+iI))/|det(X+iI)|^s e(εy₁x₁)e(y₂(x₂'+iy₂'))(y₂')^(k/2)φ(κ(X))dX. Here ε=+1,−1 or 0, X=[[x₄,x₃],[x₃,x₁]], x₂'=−x₃(x₁+x₄)/(1+x₁²+x₃²), y₂'=√(1+x₁²+2x₃²+x₄²+(x₁x₄−x₃²)²)/(1+x₁²+x₃²)>0. κ(X) is uniquely specified by (3.2) with Q' positive triangular and the root is 1 at X=0. ε=0 is the degenerate W⁰.

Construction or proof:

1. Use the unique Iwasawa factors of diag(w,−w)n(X), w=[[0,−1],[1,0]], to define κ(X).
2. Insert the explicit real coordinates and positive square-root branch. Define the Bochner integral without placing its convergence or continuation in the data.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/compact-stabilizer`, `MetaplecticAutomorphicForms:MP.8/bfh-seed`, `MetaplecticAutomorphicForms:MP.8/similitude-cover`.

Uses:

- BFH §3, p.559, Proposition 3.1: Uses genus-two archimedean whittaker functions in three-variable whittaker majorant: Put D(X)=1+x₁²+2x₃²+x₄²+(x₁x₄−x₃²)². The positive function D(X)^−α(1+x₁²+x₃²)^−β(1+x₁²)^−γ is integrable on R³ if α>1/2, 2α+β>3/2 and α+β+γ>1. These are sufficient conditions; no necessity assertion is made.
- BFH §3, pp.559–561, (3.10)–(3.15): Relate the initial Whittaker integral to the two-parameter Jacquet integral in its absolute-convergence chamber, then continue it using the reflected identities.
- BFH §3, pp.567–569, Propositions 3.7–3.8: Choose actual finite U(2) matrix coefficients of the prescribed SO(2) weight and use the global signed divisor to control the local analytic tests.

API:

- `TauCeti.Jacobi.GenusTwo.whittakerFunction_zero` (simp): φ=0 implies W=0.
- `TauCeti.Jacobi.GenusTwo.whittakerFunction_scalar` (functoriality): Scaling φ scales W.
- `TauCeti.Jacobi.GenusTwo.whittakerFunction_degenerate_scale` (relation): W⁰(y₁,y₂;s)=y₁^(4−s)W⁰(1,y₂;s).

Unit tests:

- `TauCeti.Jacobi.GenusTwo.whittakerFunction_zero_test` (degenerate): W^+ of the zero matrix coefficient is zero.
- `TauCeti.Jacobi.GenusTwo.whittakerKernel_base` (computation): At X=0 and φ=1 the kernel is exp(−2πy₂) for every sign.
- `TauCeti.Jacobi.GenusTwo.whittakerFunction_degenerate_test` (compatibility): W⁰(2,y₂;s)=2^(4−s)W⁰(1,y₂;s).

Acceptance:

- W⁰ omits e(εy₁x₁), retaining all other factors.
- At X=0, x₂'=0,y₂'=1 and the kernel root is 1.

Source: BFH90, §3, pp.557–559, (3.1)–(3.8). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Three-variable Whittaker majorant

Declaration: `TauCeti.Jacobi.GenusTwo.whittaker_majorant` (lemma). Node: `MetaplecticAutomorphicForms:MP.8/whittaker-majorant`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`.

Put D(X)=1+x₁²+2x₃²+x₄²+(x₁x₄−x₃²)². The positive function D(X)^−α(1+x₁²+x₃²)^−β(1+x₁²)^−γ is integrable on R³ if α>1/2, 2α+β>3/2 and α+β+γ>1. These are sufficient conditions; no necessity assertion is made.

Construction or proof:

1. Complete the square in x₄, substitute x₄ scaled by 1+x₁², and integrate the one-variable beta majorant (requires α>1/2).
2. Scale x₃ by √(1+x₁²); the remaining integrals converge under 2α+β>3/2 and α+β+γ>1. Keep Tonelli for this positive integrand.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/whittaker-functions`.

Acceptance:

- α=1,β=0,γ=1 satisfies all inequalities.
- Equality α=1/2 is excluded from the theorem.

Source: BFH90, §3, p.559, Proposition 3.1. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Whittaker integral convergence

Declaration: `TauCeti.Jacobi.GenusTwo.whittaker_initial_convergence` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/whittaker-initial-convergence`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`.

For k≥2 even, a continuous finite-dimensional BFH K-type σ, weight-k v, T linear, φ(κ)=T(vσ(κ)), ε∈{−1,0,1}, y₁,y₂>0, the integral defining W^ε is absolutely convergent for Re s>2, locally uniformly with derivatives in s on compact subsets of that half-plane.

Construction or proof:

1. Finite-dimensional compact K-coefficients are bounded. Absorb exp(−2πy₂y₂') times (y₂')^(k/2) by a power majorant.
2. Apply Proposition 3.1 with a strict margin. Logarithmic factors from s-derivatives are absorbed by reducing the margin; dominated differentiation gives local holomorphy.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/whittaker-majorant`, `MetaplecticAutomorphicForms:MP.8/bfh-seed`.

Acceptance:

- No initial-convergence claim is made at Re s=2.
- The degenerate sign ε=0 has the same initial half-plane.

Source: BFH90, §3, p.559, Proposition 3.2. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Two-parameter Jacquet integral

Declaration: `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter` (definition). Node: `MetaplecticAutomorphicForms:MP.8/jacquet-two-parameter`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`.

For the BFH K-type, let F_v(n(E(x₂))m(Y)κ)=|det Y|^s y₂^r vσ(κ), Y=√y₁ diag(y₂,1). Define V^ε(y₁,y₂;s,r)= (−1)^(k/2)y₁^(4−s)y₂^(5−r−s)∫_{R×R³} F_v(Jm(E(x₂))n(X))√(−det(X+iI))e(εy₁x₁)e(y₂x₂)dX dx₂. Set W^ε(s,r)=π^−r Γ(r+k/2)V^ε(s,r). The section is homogeneous exactly as (3.10); both integrals are initially interpreted in their absolute-convergence chamber.

Construction or proof:

1. Use the same unique Iwasawa factors as the seed to define F_v and the four-dimensional Bochner integral.
2. Apply the one-variable confluent-hypergeometric integral before extending parameters; do not exchange a conditionally convergent integral.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/whittaker-functions`, `MetaplecticAutomorphicForms:MP.8/bfh-seed`.

Uses:

- BFH §3, pp.560–561, Proposition 3.3: Uses two-parameter jacquet integral in jacquet reflection in the auxiliary parameter: The V-family continues analytically to Re(s+r)>5/2 and Re(s−r)>3/2. Its gamma-normalized W-family satisfies W^ε(s,r)=W^ε(s,1−r). At r=k/2 and Re s>(3+k)/2 this is the original Whittaker function. This uses the classical identity W_{κ,μ}=W_{κ,−μ} and its specialization W_{k/2,(1−k)/2}(y)=y^(k/2)e^−y/2.
- BFH §3, pp.574–576, Proposition 3.14, (3.46)–(3.47): Uses two-parameter jacquet integral in degenerate whittaker continuation and decay: W⁰ continues holomorphically to Re s>3/2. For each fixed y₁>0 and compact parameter sets it decreases rapidly as y₂→∞, with polynomial control at y₂→0; W⁰(y₁,y₂;s)=y₁^(4−s)W⁰(1,y₂;s). No rapid decay in y₁ follows, because its x₁ character is trivial.

API:

- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_linear` (functoriality): Scaling v or T scales V and W; additive linearity is asserted in a common convergence chamber and then by analytic continuation.
- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_normalization` (projection): W(s,r)=π^−r Γ(r+k/2)V(s,r).
- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_specialize` (compatibility): For Re s>(3+k)/2 and r=k/2, W(s,r)=W(s).

Unit tests:

- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_zero` (degenerate): v=0 gives V=W=0.
- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_weight_two` (computation): At k=2,r=1 the normalizing factor is π^−1 Γ(2)=π^−1.
- `TauCeti.Jacobi.GenusTwo.jacquetTwoParameter_specialization_test` (compatibility): The special-function factor becomes y^(k/2)e^−y/2 at r=k/2, retaining the k/2 exponent.

Acceptance:

- At r=k/2 the W-family specializes to (3.1) in Re s>(3+k)/2.
- The normalization includes Γ(r+k/2), not Γ(r).

Source: BFH90, §3, pp.559–561, (3.10)–(3.15). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Jacquet reflection in the auxiliary parameter

Declaration: `TauCeti.Jacobi.GenusTwo.jacquet_r_reflection` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/jacquet-r-reflection`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`.

The V-family continues analytically to Re(s+r)>5/2 and Re(s−r)>3/2. Its gamma-normalized W-family satisfies W^ε(s,r)=W^ε(s,1−r). At r=k/2 and Re s>(3+k)/2 this is the original Whittaker function. This uses the classical identity W_{κ,μ}=W_{κ,−μ} and its specialization W_{k/2,(1−k)/2}(y)=y^(k/2)e^−y/2.

Construction or proof:

1. Integrate the x₂ variable using GR 3.384.9 and obtain the confluent Whittaker function in (3.14).
2. Use its symmetry in μ=r−1/2 and the majorant for the asserted cone; analytic uniqueness proves the reflection. The precise classical special-function inputs remain a recorded gap.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/jacquet-two-parameter`.

Acceptance:

- Both inequalities constrain s and r; this is not yet Re s>3/2.

Suggested signature boundary: The raw integral agrees with its continuation only in the initial chamber Re r>1/2 and Re(s−r)>3/2. The continuation is holomorphic on the larger cone stated in the packet; reflection uses the intersection of that cone with its reflected cone. Exact GR special-function identities remain a recorded gap.

Open proof inputs:

- Confluent Whittaker integral identities: BFH pp.560–565 uses Gradshteyn–Ryzhik 3.384.9 and 9.237 for the confluent Whittaker integral, its symmetry and gamma normalization. Those source entries have not been read. Establish their exact convergence domains, branch and continuation identity; retain the distinction between V holomorphy and gamma-normalized W meromorphy.

Source: BFH90, §3, pp.560–561, Proposition 3.3. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Gamma-normalized Jacquet Weyl relation

Declaration: `TauCeti.Jacobi.GenusTwo.jacquet_weyl_reflection` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/jacquet-weyl-reflection`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`.

For a finite K-matrix coefficient of torus weight n, φ(θ_tκ)=exp(−int)φ(κ), set V̂^ε=2^−s π^−s Γ(A_ε(s,r,n))Γ(B_ε(s,r,n))V^ε, where A_ε=(s−r+εn+(ε−1)/2)/2 and B_ε=(s+r+εn+(ε+1)/2)/2. Thus for ε=+1 the arguments are (s−r+n)/2,(s+r+n+1)/2; for ε=−1 they are (s−r−n−1)/2,(s+r−n)/2. This corrects the p.562 normalizer using the explicit integral evaluations (3.26)–(3.27) and the subsequent V̂ displays on p.565 (E-MP8-6). It satisfies V̂^ε(s,r)=V̂^ε(r+3/2,s−3/2). The unnormalized family continues analytically to Re r>1/2, Re s>2. Interpret the identity meromorphically at gamma poles. Torus components need not retain the original SO(2) weight k.

Construction or proof:

1. Project the original finite K-representation to the torus characters, retaining arbitrary projected vectors rather than imposing the original SO(2) weight on each component.
2. Cancel the inverse gamma factors in (3.26)–(3.27) using Aε,Bε above. The remaining gamma argument and powers depend on s+r; the confluent Whittaker parameter changes sign under (s,r)↦(r+3/2,s−3/2).
3. Glue through the convergence-cone overlap. The exact special-function integral and joint meromorphic topology remain explicitly recorded gaps.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/jacquet-r-reflection`.

Acceptance:

- The parameter map is an involution.
- The root and torus character determine the two gamma shifts.

Suggested signature boundary: The prototype gives native meromorphic slices and the identity away from explicit gamma poles. Joint meromorphic topology and torus-weight comparison to the supplier representation remain untyped. The native input now permits arbitrary finite K-matrix coefficients; the torus projection no longer incorrectly retains the original SO(2)-weight condition.

Open proof inputs:

- Confluent Whittaker integral identities: BFH pp.560–565 uses Gradshteyn–Ryzhik 3.384.9 and 9.237 for the confluent Whittaker integral, its symmetry and gamma normalization. Those source entries have not been read. Establish their exact convergence domains, branch and continuation identity; retain the distinction between V holomorphy and gamma-normalized W meromorphy.

Source: BFH90, §3, p.562, Proposition 3.4, (3.18)–(3.19); pp.563–565, (3.26)–(3.27) and explicit V̂ displays. Evidence relationship: The p.562 printed normalizer needs correction E-MP8-6; the p.565 evaluated formulas determine the corrected two signs.

### Whittaker holomorphy beyond convergence

Declaration: `TauCeti.Jacobi.GenusTwo.whittaker_continuation` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/whittaker-continuation`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`.

For the BFH weight-k matrix coefficients and either ε=±1, W^ε(y₁,y₂;s) has a holomorphic continuation to Re s>3/2. Its initial integral need not be absolutely convergent throughout this domain. At s=2 the apparent gamma singularities from the two-parameter reflections cancel.

Construction or proof:

1. Apply the two reflections to move (s,k/2) to the overlapping cones. Cover the asserted half-plane with these overlaps.
2. Track gamma poles at s=2 weight by weight and use the opposite reflection to remove each apparent pole; glue by uniqueness.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/whittaker-initial-convergence`, `MetaplecticAutomorphicForms:MP.8/jacquet-r-reflection`, `MetaplecticAutomorphicForms:MP.8/jacquet-weyl-reflection`.

Acceptance:

- Holomorphic, not merely meromorphic, at s=2.

Open proof inputs:

- Confluent Whittaker integral identities: BFH pp.560–565 uses Gradshteyn–Ryzhik 3.384.9 and 9.237 for the confluent Whittaker integral, its symmetry and gamma normalization. Those source entries have not been read. Establish their exact convergence domains, branch and continuation identity; retain the distinction between V holomorphy and gamma-normalized W meromorphy.

Source: BFH90, §3, pp.565–566, Proposition 3.5. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Whittaker decay in both positive variables

Declaration: `TauCeti.Jacobi.GenusTwo.whittaker_rapid_decay` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/whittaker-rapid-decay`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Bounds`.

On compact parameter sets in Re s>3/2, for ε=±1 there are C and a Schwartz function ξ on R² with ||W^ε(y₁,y₂;s)||≤(y₁y₂)^−C ξ(y₁,y₂), y₁,y₂>0; the corresponding differentiated estimates hold where the convolution argument applies. The degenerate W⁰ does not have this two-variable decay conclusion.

Construction or proof:

1. First derive polynomial bounds away from Re s=2 using the two-parameter integrals and uniform gamma estimates.
2. Represent the smooth vector by convolution with a compactly supported smooth function. The nondegenerate unipotent character supplies a Schwartz Fourier factor in both variables (JPSS 8.3.3).
3. Extend over s=2 by holomorphy and compact-parameter bounds; record the unavailable exact convolution theorem rather than silently assuming it.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/whittaker-continuation`, `AutomorphicSpectralTheory:AS.1`, `AutomorphicFormsOnReductiveGroups:AF.1`.

Acceptance:

- Bounds justify sums and Mellin integrals later; scalar boundedness is insufficient.

Open proof inputs:

- Compact convolution growth estimates: BFH Propositions 3.5–3.6 invoke Jacquet–Piatetski-Shapiro–Shalika section 8.3.3 for compact-convolution nondegenerate rapid decay and the degenerate polynomial bound. That passage has not been inspected. Supply its representation, differentiation, uniform parameter and Sobolev hypotheses, including why W⁰ has only the asserted y₂ decay.

Source: BFH90, §3, pp.566–567, Proposition 3.6. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Degenerate Whittaker continuation and decay

Declaration: `TauCeti.Jacobi.GenusTwo.degenerate_whittaker_continuation` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/degenerate-whittaker-continuation`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Basic`.

W⁰ continues holomorphically to Re s>3/2. For each fixed y₁>0 and compact parameter sets it decreases rapidly as y₂→∞, with polynomial control at y₂→0; W⁰(y₁,y₂;s)=y₁^(4−s)W⁰(1,y₂;s). No rapid decay in y₁ follows, because its x₁ character is trivial.

Construction or proof:

1. Set the first character to zero in the Jacquet integral, integrate the elementary beta factors, and continue the remaining Bessel integrals. BFH omits this calculation and refers to its distinct Annals paper §5; this exact input remains a gap.
2. Use smooth convolution with the character nondegenerate only in x₂; this proves only y₂ decay.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/whittaker-initial-convergence`, `MetaplecticAutomorphicForms:MP.8/jacquet-two-parameter`.

Acceptance:

- Homogeneity rules out claiming Schwartz decay in y₁.

Source: BFH90, §3, pp.574–576, Proposition 3.14, (3.46)–(3.47). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Whittaker test coefficient algebra

Declaration: `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra` (construction). Node: `MetaplecticAutomorphicForms:MP.8/test-coefficient-algebra`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/TestCoefficients`.

Let R_k be the algebraic span of actual finite-dimensional U(2) matrix coefficients with the prescribed SO(2) weight k and trivial action of −I₄; its closure is taken in the uniform topology. In the κ(X) chart the three weight-zero polynomial coefficients are φ₁=det B=|det(X+iI)|^−1, φ₂=(det(X)²−1)x₁/|det(X+iI)|⁴ and φ₃=x₃(1−det X)/|det(X+iI)|². Multiplication by each preserves R_k. They are global compact-group matrix coefficients, not arbitrary functions invented on R³. Globally in the native U(2) model, φ₁(q)=det(Im q); it may change sign under right rotation. Divisibility φ=φ₁ψ means equality on all of K, including the chart boundary.

Construction or proof:

1. Import Peter–Weyl density and tensor products of finite-dimensional compact representations. Weight conditions are preserved under multiplication by R₀.
2. Express φ₁,φ₂,φ₃ as polynomials in the A,B blocks of κ; then verify the chart formulas (3.29). Their global polynomial realization is necessary at chart boundaries.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/whittaker-functions`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`.

Uses:

- BFH §3, p.568, Proposition 3.9; p.571, (3.41): Extend finite compact matrix coefficients to |Im x₁|≤ε<1 uniformly in the other real coordinates and compact right translates, as needed for the upward contour shift.
- BFH §3, p.576, (3.48)–(3.49): Uses whittaker test coefficient algebra in degenerate boundary mellin coefficients: Define M(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(κ_z)√(1+iz)dz and M̃(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(wκ_zJ)√(1+iz)dz. Both use exponent 2s−8 in (3.48)–(3.49), and converge for Re s>3/2 by Proposition 3.14. They are the two zero-discriminant boundary terms in Proposition 8.1.
- BFH §3, pp.573–574, Proposition 3.12: Choose a weight-compatible coefficient with the global divisor required for nonzero continued nondegenerate transforms and identically vanishing rank-zero transform.

API:

- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_mul` (structure): R₀R_k⊆R_k via tensor product of K-types.
- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_dense` (structure): R_k is dense in continuous weight-k compact-group functions.
- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_chart` (characterisation): The three global coefficients have the displayed chart formulas.
- `TauCeti.Jacobi.GenusTwo.globalTestPhi1_chart` (compatibility): The global polynomial det(Im q) restricts to the positive testPhi1(X) on κ(X).
- `TauCeti.Jacobi.GenusTwo.globalTestPhi1_rotated` (compatibility): The right-rotated global value is (1+zx₁)φ₁(X)/Δ_z, retaining its sign on both branches.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_base` (computation): The chart values at zero are (1,0,0).
- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_nonzero_phi2` (computation): At (x₁,x₃,x₄)=(1,0,0), φ₂=−1/4.
- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_nonzero_phi3` (computation): At (0,1,0), φ₃=1/2.
- `TauCeti.Jacobi.GenusTwo.testCoefficientAlgebra_negative_branch` (non-example): For X=diag(0,−2),z=1, the global coefficient at κ(X)κ_z is −1/√10, whereas the positive chart coefficient at X(z)=diag(0,3) is +1/√10. They cannot be identified without the compact transition.

Acceptance:

- At X=0, (φ₁,φ₂,φ₃)=(1,0,0).
- At x₁=1,x₃=x₄=0, (φ₁,φ₂,φ₃)=(1/√2,−1/4,0).

Source: BFH90, §3, pp.567–569, Propositions 3.7–3.8. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Bounded holomorphic strip for test coefficients

Declaration: `TauCeti.Jacobi.GenusTwo.test_coefficient_strip` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/test-coefficient-strip`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/TestCoefficients`.

Every finite matrix coefficient h, including its right translate by κ₀∈K, admits a bounded holomorphic extension in x₁ on |Im x₁|≤ε, uniformly for real x₃,x₄ and κ₀, for each 0<ε<1. This includes polynomials in φ₁,φ₂,φ₃ and suffices for the upward contour shift in (3.41). The printed one-sided region includes the singularity −i and is false.

Construction or proof:

1. Factor det(X+iI) and its conjugate real polynomial as functions of complex x₁. Their zeros lie outside the strict strip |Im x₁|<1.
2. Choose the branch extending the real positive square root. Bound the inverse factors uniformly on each smaller closed strip. Extend polynomial products and use the upward strip for the later contour shift.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/test-coefficient-algebra`.

Acceptance:

- Exclude −i explicitly; do not preserve the false one-sided region.

Source: BFH90, §3, p.568, Proposition 3.9; p.571, (3.41). Evidence relationship: Proposition 3.9 is used with the corrected bounded strip from E-MP8-4; the source contour shift uses only the upward portion of that strip.

### Rotated Whittaker scalar estimate

Declaration: `TauCeti.Jacobi.GenusTwo.rotated_whittaker_bound` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/rotated-whittaker-bound`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/RotatedBounds`.

Let κ_z correspond in U(2) to diag(1,(1−iz)/Δ_z), Δ_z=√(1+z²). For φ∈R_k globally divisible by φ₁, use the actual compact product φ(κ(X)κ_z) in the scalar W integral (3.38), including its (y₁y₂)^(4−s)y₂^(k/2) prefactor. Proposition 3.10 targets absolute convergence for Re s>3/2 and, for y₂>C,y₁>0,z∈R, the bound C′y₁^(4−Re s), uniform on compact s-sets. At 1+zx₁=0 the global divisor vanishes. Away from this boundary φ₁(κ(X)κ_z)=(1+zx₁)φ₁(X)/Δ_z, while φ₁(X(z))=|1+zx₁|φ₁(X)/Δ_z. General coefficients require the missing compact transition; the blanket chart equality (3.31) cannot be used (E-MP8-7). The repaired global uniform-bound proof is a recorded gap.

Construction or proof:

1. Work first with the genuine compact product in (3.38). Check the three rational coordinate transforms and the determinant identity, distinguishing its signed global coefficient from the positive chart value.
2. Compute the residual compact factor on both signs of 1+zx₁ and show how it acts on the coefficient vector. At the boundary use global divisibility to deduce zero; do not extend arbitrary coefficients by zero.
3. After that comparison, justify the absolute majorant uniformly in z and compact s-sets, then the large-y₂ bound. This proof repair is not established here and remains an explicit gap.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/test-coefficient-strip`, `MetaplecticAutomorphicForms:MP.8/whittaker-continuation`.

Acceptance:

- The zero-extension statement is false without φ₁ divisibility.

Suggested signature boundary: The native kernel now evaluates the actual global compact product and includes the scalar W prefactor; global divisibility is typed. The transition and uniform majorant needed to prove Proposition 3.10 remain unestablished, not additional defining input fields.

Open proof inputs:

- Compact convolution growth estimates: BFH Propositions 3.5–3.6 invoke Jacquet–Piatetski-Shapiro–Shalika section 8.3.3 for compact-convolution nondegenerate rapid decay and the degenerate polynomial bound. That passage has not been inspected. Supply its representation, differentiation, uniform parameter and Sobolev hypotheses, including why W⁰ has only the asserted y₂ decay.
- Global compact rotation and uniform majorant: Repair the false published (3.31) global-to-chart equality: compute the residual compact transition on both signs of 1+zx₁, retain φ₁(q)=det(Im q) globally and show divisibility at the boundary. Prove a z-uniform integrable majorant for the actual kernel (3.38), including its prefactor, for compact s-sets in Re s>3/2. The rational coordinate map and signed determinant calculation alone do not prove the stated rotated bound or its subsequent continuation consequences.

Source: BFH90, §3, pp.569–571, Proposition 3.10, (3.31)–(3.39). Evidence relationship: The source states Proposition 3.10, but its global chart substitution needs E-MP8-7. The revised target retains the actual compact product; its uniform majorant remains a gap.

### Novodvorsky Mellin transform

Declaration: `TauCeti.Jacobi.GenusTwo.novodvorskyTransform` (definition). Node: `MetaplecticAutomorphicForms:MP.8/novodvorsky-transform`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Novodvorsky`.

Planet: **Novodvorsky transform**.

For ε=±1 define F^ε(u,s;y₂)=∫_{y₁>0}∫_{z∈R} T(W^ε(Δ_z^−2 y₁,Δ_z y₂;s)σ(κ_z)) e(−ε y₁z/(1+z²)) y₁^(u−3/2)√(1+iz) dz dy₁/y₁, with the continuous root equal to 1 at z=0. This is an iterated integral in that order; substituting the R³ kernel does not give a jointly absolutely convergent integral.

Construction or proof:

1. Keep the z integral inner and the positive Mellin measure outer. The continuation construction uses the φ₁ divisibility and strip shift.
2. Only apply Fubini after proving a separate majorant. BFH explicitly warns that the expanded integral is not absolutely convergent.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/rotated-whittaker-bound`.

Uses:

- BFH §3, pp.571–574, Propositions 3.11–3.12: Uses novodvorsky mellin transform in novodvorsky analytic continuation: For φ divisible by φ₁, the Novodvorsky transforms continue holomorphically for Re s>3/2 and Re(u−s+5/2)>0, initially agreeing with the iterated integral for Re u large. The large-y₁ tail uses nondegenerate rapid decay and the small-y₁ tail uses Proposition 3.10. This assertion is not joint absolute convergence of the e
- BFH §3, p.571, (3.39)–(3.41): Uses novodvorsky mellin transform in rank-zero laplace coefficient: Define τ(s,y₂;v,σ)=∫_R Δ_z^(−s+k/2)e^(−2πy₂Δ_z)√(1+iz)vσ(ηw^−1κ_z wJ)dz, where η,w,J are exactly the compact matrices in §1 and (3.40). It is the rank-zero boundary contribution, distinct from the degenerate W⁰ term. Apply T only after forming the vector-valued integral.
- BFH §3, p.576, (3.48)–(3.49): Uses novodvorsky mellin transform in degenerate boundary mellin coefficients: Define M(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(κ_z)√(1+iz)dz and M̃(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(wκ_zJ)√(1+iz)dz. Both use exponent 2s−8 in (3.48)–(3.49), and converge for Re s>3/2 by Proposition 3.14. They are the two zero-discriminant boundary terms in Proposition 8.1.

API:

- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_zero` (simp): The transform of the zero coefficient is zero.
- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_scalar` (functoriality): F is linear in the matrix coefficient.
- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_sign` (projection): The + Whittaker function uses e(−y₁z/(1+z²)); the − one uses its inverse.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_zero_test` (degenerate): F of zero vanishes for both signs.
- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_root` (computation): At z=0 the extra square-root factor is 1.
- `TauCeti.Jacobi.GenusTwo.novodvorskyTransform_sign_test` (computation): At y₁=z=1, the two oscillatory factors both equal −1.

Acceptance:

- The exponent is u−3/2 with dy₁/y₁.
- The oscillatory sign is opposite to the W sign.

Source: BFH90, §3, p.570, (3.37); pp.571–574, Propositions 3.11–3.12. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Novodvorsky analytic continuation

Declaration: `TauCeti.Jacobi.GenusTwo.novodvorsky_continuation` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/novodvorsky-continuation`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Novodvorsky`.

For φ divisible by φ₁, the Novodvorsky transforms continue holomorphically for Re s>3/2 and Re(u−s+5/2)>0, initially agreeing with the iterated integral for Re u large. The large-y₁ tail uses nondegenerate rapid decay and the small-y₁ tail uses Proposition 3.10. This assertion is not joint absolute convergence of the expanded R³×R×R₊ kernel.

Construction or proof:

1. For the continued scalar W, integrate its bounded compact-parameter kernel; Proposition 3.10 gives y₁^(u−s+5/2) at zero.
2. Use the rapid-decay bound at infinity. Apply the bounded holomorphic strip to shift the x₁ contour as (3.41), controlling the rectangular boundary tails.
3. Glue with the initial iterated-integral region by uniqueness.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/novodvorsky-transform`, `MetaplecticAutomorphicForms:MP.8/rotated-whittaker-bound`, `MetaplecticAutomorphicForms:MP.8/whittaker-rapid-decay`.

Acceptance:

- The Mellin domain includes (u,s)=(1/2,2).

Open proof inputs:

- Global compact rotation and uniform majorant: Repair the false published (3.31) global-to-chart equality: compute the residual compact transition on both signs of 1+zx₁, retain φ₁(q)=det(Im q) globally and show divisibility at the boundary. Prove a z-uniform integrable majorant for the actual kernel (3.38), including its prefactor, for compact s-sets in Re s>3/2. The rational coordinate map and signed determinant calculation alone do not prove the stated rotated bound or its subsequent continuation consequences.

Source: BFH90, §3, pp.571–574, Propositions 3.11–3.12. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Rank-zero Laplace coefficient

Declaration: `TauCeti.Jacobi.GenusTwo.tauTransform` (definition). Node: `MetaplecticAutomorphicForms:MP.8/tau-transform`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Boundary`.

Define τ(s,y₂;v,σ)=∫_R Δ_z^(−s+k/2)e^(−2πy₂Δ_z)√(1+iz)vσ(ηw^−1κ_z wJ)dz, where η,w,J are exactly the compact matrices in §1 and (3.40). It is the rank-zero boundary contribution, distinct from the degenerate W⁰ term. Apply T only after forming the vector-valued integral.

Construction or proof:

1. Insert the BFH fixed compact matrices and use the exponential in Δ_z to obtain absolute convergence for y₂>0.
2. Differentiate in s under a compact-parameter majorant.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/bfh-seed`, `MetaplecticAutomorphicForms:MP.8/novodvorsky-transform`.

Uses:

- BFH §3, pp.573–574, Proposition 3.12: Choose a weight-compatible coefficient with the global divisor required for nonzero continued nondegenerate transforms and identically vanishing rank-zero transform.
- BFH §3, p.574, Proposition 3.13: Uses rank-zero laplace coefficient in nonzero rank-zero test: For each Re s>3/2 there exist actual finite-dimensional σ, weight-k v, T and y₂>0 with Tτ(s,y₂)≠0, while both TF^± have the continuation domain of Proposition 3.12. Choose φ divisible by φ₁ and nonzero on the rank-zero chart. No simultaneous F-nonvanishing is asserted in this proposition.
- BFH §3, p.577, Proposition 3.15: Uses rank-zero laplace coefficient in nonzero degenerate residue test: There exist finite-dimensional σ, weight-k v, T and y₂>0 such that TF^± have the Novodvorsky continuation, TM(2,y₂)≠0 and Tτ is identically zero. BFH Proposition 3.15 omits its proof; an explicit Bessel transform and nonzero test construction remain required, not an assumption of the Eisenstein definition.
- RankZeroOneBSD:BSD.2: Consumes the exact BFH coefficient/polar-formula data after the comparisons stated in this packet.

API:

- `TauCeti.Jacobi.GenusTwo.tauTransform_zero` (simp): Zero v gives τ=0.
- `TauCeti.Jacobi.GenusTwo.tauTransform_scalar` (functoriality): Scaling v or T scales the Laplace coefficient.
- `TauCeti.Jacobi.GenusTwo.tauTransform_holomorphic` (structure): For y₂>0 the coefficient is entire in s.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.tauTransform_zero_test` (degenerate): τ of the zero coefficient is zero.
- `TauCeti.Jacobi.GenusTwo.tauTransform_base_factor` (computation): The scalar integrand factor at z=0 is e^−2πy₂.
- `TauCeti.Jacobi.GenusTwo.tauTransform_weight_two` (computation): For k=2,s=1 the Δ_z power is zero.

Acceptance:

- φ divisible by φ₂ makes Tτ identically zero through (3.41).

Source: BFH90, §3, p.571, (3.39)–(3.41). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Degenerate boundary Mellin coefficients

Declaration: `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients` (construction). Node: `MetaplecticAutomorphicForms:MP.8/degenerate-mellin-coefficients`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Boundary`.

Define M(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(κ_z)√(1+iz)dz and M̃(s,y₂)=∫_R Δ_z^(2s−8)W⁰(1,Δ_z y₂;s)σ(wκ_zJ)√(1+iz)dz. Both use exponent 2s−8 in (3.48)–(3.49), and converge for Re s>3/2 by Proposition 3.14. They are the two zero-discriminant boundary terms in Proposition 8.1.

Construction or proof:

1. Use the continued W⁰, not its out-of-chamber totalized integral. Rapid decay in Δ_z y₂ gives an integrable z-majorant.
2. Keep the wκ_zJ order in M̃; derive parameter holomorphy on compact subsets.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/degenerate-whittaker-continuation`, `MetaplecticAutomorphicForms:MP.8/novodvorsky-transform`, `MetaplecticAutomorphicForms:MP.8/test-coefficient-algebra`.

Uses:

- BFH §3, p.577, Proposition 3.15: Uses degenerate boundary mellin coefficients in nonzero degenerate residue test: There exist finite-dimensional σ, weight-k v, T and y₂>0 such that TF^± have the Novodvorsky continuation, TM(2,y₂)≠0 and Tτ is identically zero. BFH Proposition 3.15 omits its proof; an explicit Bessel transform and nonzero test construction remain required, not an assumption of the Eisenstein definition.
- BFH §8, pp.601–614, Proposition 8.1: Supply the degenerate Mellin coefficients in the three boundary fractions, with transforms evaluated at N⁻¹y₂ and their stated parameter powers.
- RankZeroOneBSD:BSD.2: Consumes the exact BFH coefficient/polar-formula data after the comparisons stated in this packet.

API:

- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_linear` (functoriality): M and M̃ are linear in v and T.
- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_holomorphic` (structure): Both are holomorphic for Re s>3/2 at fixed y₂>0.
- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_kernel` (projection): The multiplier is Δ_z^(2s−8)√(1+iz).

Unit tests:

- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_zero` (degenerate): Zero v gives M=M̃=0.
- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_s_two` (computation): At s=2 the Δ_z multiplier is (1+z²)^−2.
- `TauCeti.Jacobi.GenusTwo.degenerateMellinCoefficients_z_zero` (computation): At z=0 the additional multiplier is 1.

Acceptance:

- At s=2 the extra factor is Δ_z^−4.
- No y₁ Mellin integral occurs here.

Open proof inputs:

- Degenerate Bessel formula and residue test: BFH Inventiones Proposition 3.14 (pp.575–576) directs its omitted Bessel calculation to section 5 of the distinct BFH Annals 131 (1990), 53–127 paper, DOI 10.2307/1971508. Only that paper’s publisher metadata has been inspected. Read its formula, reconcile k,s,y₂ and measures with W⁰, and give the explicit finite K-type construction proving Proposition 3.15, whose proof Inventiones also omits.

Source: BFH90, §3, p.576, (3.48)–(3.49). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Nonzero Novodvorsky tests with vanishing rank zero

Declaration: `TauCeti.Jacobi.GenusTwo.local_test_nonzero_f` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-f`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Boundary`.

For every even k≥2 and (u,s) with Re s>3/2, Re(u−s+5/2)>0, there exist an actual finite-dimensional σ, weight-k v, T and y₂>0 such that both continued TF⁺ and TF⁻ are analytic in the asserted domain, each is nonzero at the given point (with suitable y₂), and Tτ is identically zero. One may take the coefficient divisible by φ₁φ₂. The two nonzero assertions do not require the same y₂ unless separately proved.

Construction or proof:

1. Use φ₁φ₂ times high powers of weight-zero polynomial coefficients to preserve convergence and kill τ via its chart restriction.
2. If every test vanished, Peter–Weyl density would force the transformed integral (3.45) to vanish on all compact-group test vectors.
3. Concentrate its Laplace mass at the unique minimum shown on p.574; the remaining nonzero integrand contradicts universal vanishing. Keep the sign separately.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/novodvorsky-continuation`, `MetaplecticAutomorphicForms:MP.8/tau-transform`, `MetaplecticAutomorphicForms:MP.8/test-coefficient-algebra`.

Acceptance:

- The output is an existential finite K-type, not an axiom named nonzero.

Open proof inputs:

- Global compact rotation and uniform majorant: Repair the false published (3.31) global-to-chart equality: compute the residual compact transition on both signs of 1+zx₁, retain φ₁(q)=det(Im q) globally and show divisibility at the boundary. Prove a z-uniform integrable majorant for the actual kernel (3.38), including its prefactor, for compact s-sets in Re s>3/2. The rational coordinate map and signed determinant calculation alone do not prove the stated rotated bound or its subsequent continuation consequences.

Source: BFH90, §3, pp.573–574, Proposition 3.12. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Nonzero rank-zero test

Declaration: `TauCeti.Jacobi.GenusTwo.local_test_nonzero_tau` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-tau`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Boundary`.

For each Re s>3/2 there exist actual finite-dimensional σ, weight-k v, T and y₂>0 with Tτ(s,y₂)≠0, while both TF^± have the continuation domain of Proposition 3.12. Choose φ divisible by φ₁ and nonzero on the rank-zero chart. No simultaneous F-nonvanishing is asserted in this proposition.

Construction or proof:

1. Use Peter–Weyl density after projection to the prescribed SO(2) weight and multiplication by the global divisor. Choose a phase-aligned localized coefficient whose even pushforward under z↦Δ_z is nonzero.
2. Laplace injectivity applies to that pushforward, not merely to a nonzero function of z: an odd integrable function has zero transform for every y₂. Establish the compatible localized finite-K-type construction and integrability; this is an explicit gap.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/novodvorsky-continuation`, `MetaplecticAutomorphicForms:MP.8/tau-transform`, `MetaplecticAutomorphicForms:MP.8/test-coefficient-algebra`.

Acceptance:

- Keep this test separate from the τ-killing test.

Open proof inputs:

- Global compact rotation and uniform majorant: Repair the false published (3.31) global-to-chart equality: compute the residual compact transition on both signs of 1+zx₁, retain φ₁(q)=det(Im q) globally and show divisibility at the boundary. Prove a z-uniform integrable majorant for the actual kernel (3.38), including its prefactor, for compact s-sets in Re s>3/2. The rational coordinate map and signed determinant calculation alone do not prove the stated rotated bound or its subsequent continuation consequences.
- Nonzero even Laplace pushforward: For the rank-zero τ test, construct an actual finite K-coefficient with the prescribed SO(2) weight and global divisor whose even pushforward under z↦√(1+z²), including the branch/amplitude factors, is nonzero. Establish its weighted integrability before applying Laplace injectivity. A nonzero restriction in z is insufficient because odd contributions cancel. Peter–Weyl localization must respect both weight and divisor.

Source: BFH90, §3, p.574, Proposition 3.13. Evidence relationship: The source states Proposition 3.13. Its nonzero-restriction argument does not establish a nonzero even Laplace pushforward; the revised proof requires the explicitly recorded weight/divisor-compatible construction.

### Nonzero degenerate residue test

Declaration: `TauCeti.Jacobi.GenusTwo.local_test_nonzero_m` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-m`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Whittaker/Boundary`.

There exist finite-dimensional σ, weight-k v, T and y₂>0 such that TF^± have the Novodvorsky continuation, TM(2,y₂)≠0 and Tτ is identically zero. BFH Proposition 3.15 omits its proof; an explicit Bessel transform and nonzero test construction remain required, not an assumption of the Eisenstein definition.

Construction or proof:

1. Carry out the degenerate Bessel formula from the recorded Proposition 3.14 source gap.
2. Choose a φ₁φ₂-divisible finite K-type and show its scalar M-transform is nonzero by the explicit Bessel/Laplace calculation. BFH only states this input, so the construction is an exact gap pending verification.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/degenerate-mellin-coefficients`, `MetaplecticAutomorphicForms:MP.8/novodvorsky-continuation`, `MetaplecticAutomorphicForms:MP.8/tau-transform`, `MetaplecticAutomorphicForms:MP.8/test-coefficient-algebra`.

Acceptance:

- The nonzero value is at s=2.

Open proof inputs:

- Degenerate Bessel formula and residue test: BFH Inventiones Proposition 3.14 (pp.575–576) directs its omitted Bessel calculation to section 5 of the distinct BFH Annals 131 (1990), 53–127 paper, DOI 10.2307/1971508. Only that paper’s publisher metadata has been inspected. Read its formula, reconcile k,s,y₂ and measures with W⁰, and give the explicit finite K-type construction proving Proposition 3.15, whose proof Inventiones also omits.

Source: BFH90, §3, p.577, Proposition 3.15. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

## Similitude comparisons and theta covariance

### Similitude action on the Jacobi group

Declaration: `TauCeti.Jacobi.GenusTwo.similitude_heisenberg_comparison` (comparison). Node: `MetaplecticAutomorphicForms:MP.8/similitude-heisenberg-comparison`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/JacobiAction`.

For the MP.6 Heisenberg group H(W)=W×R with law (w,t)(w',t')=(w+w',t+t'+ω(w,w')/2), every g∈GSp₄(R) acts by (w,t)↦(gw,μ(g)t). Pulling this action back along the double-cover projection gives the native semidirect product H(W)⋊G̃Sp₄. A fixed central character e(mt) is preserved only by μ=1; general positive similitudes transport index m to μm. The two BFH slash lattices are specializations of the MP.6 Jacobi action, with their actual central phases and genus-two index m/N.

Construction or proof:

1. Import the general Heisenberg group, Schrödinger–Weil action and Jacobi forms from MP.6, following confirmed RT-AREA-automorphic-1/20.
2. Check ω(gw,gw')=μω(w,w'), hence multiplication and inverse compatibility; then use native SemidirectProduct.
3. Compute the central character after transport and specialize the (λ,ρ) coordinates. Do not claim a fixed-index representation of all similitudes.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/positive-similitudes`, `MetaplecticAutomorphicForms:MP.8/similitude-cover`, `MetaplecticAutomorphicForms:MP.8/bfh-slash`, `MetaplecticAutomorphicForms:MP.8/bfh-translation`, `MetaplecticAutomorphicForms:MP.6`, `mathlib:SemidirectProduct`.

Acceptance:

- g=2I₄ scales the Heisenberg center by 4.
- For μ=1 the fixed-index Schrödinger representation is recovered.

Suggested signature boundary: The native signature checks the actual coordinate action and group law. Its equivalence with the MP.6 native Jacobi group, central-character transport and arithmetic slash comparison require the requested supplier types.

Open proof inputs:

- Rank-two adelic and similitude comparison: The exact MP.4 rational/finite-place splitting and its extension to Qˣ similitudes have not been established here. Specify the finite theta lattice vector and dyadic compact-open lift at 8M|N, compare its real square-root multiplier including the J phase, and identify it with the MP.6 native Jacobi model. The real reflection extension is a chosen explicit extension, not evidence that an adelic GSp cover is canonically split.

Source: BFH90, §1, pp.546–549, (1.4)–(1.9). Evidence relationship: BFH gives the slash law and its central multiplier. The general Heisenberg statement is the required comparison with the MP.6 supplier, derived from the similitude identity, not a claimed new BFH definition.

### Full real similitude extension

Declaration: `TauCeti.Jacobi.GenusTwo.fullRealCover` (construction). Node: `MetaplecticAutomorphicForms:MP.8/full-real-cover`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Cover`.

Let r=diag(I₂,−I₂) with μ(r)=−1. Every negative similitude is uniquely g₊r. On H₂ put c(Z)=−conjugate Z. Conjugation by r acts on the positive cover by (g,ρ(Z))↦(rgr,conjugate(ρ(c(Z)))); this is an involution because d(rgr,Z)=conjugate d(g,c(Z)). Define the split extension G̃Sp₄(R)=G̃Sp₄⁺(R)⋊C₂ using this involution. Its projection onto GSp₄(R) has kernel {±1}; r has a chosen order-two lift. BFH only uses the positive component: comparison with a prescribed adelic extension is an additional input, not proved by this construction.

Construction or proof:

1. Separate by the sign of μ and verify c(gZ)=rgr·c(Z).
2. Conjugate the continuous square-root function to construct the actual automorphism of the positive cover, and check its square is identity.
3. Use the native semidirect product for this chosen real extension. Record the local/adelic normalization comparison as a gap.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/similitude-cover`, `mathlib:SemidirectProduct`, `MetaplecticAutomorphicForms:MP.4`.

Uses:

- BFH §1, pp.545–549; §2, p.553, (2.6): Compare the real arithmetic cover lift with the MP.4 restricted product and rational splitting, including the prescribed finite theta vector and dyadic compact-open lift.

API:

- `TauCeti.Jacobi.GenusTwo.fullRealCover_positive` (constructor): The positive cover embeds as the identity-component subgroup.
- `TauCeti.Jacobi.GenusTwo.fullRealCover_kernel` (characterisation): The projection kernel is exactly {±1}.
- `TauCeti.Jacobi.GenusTwo.fullRealCover_reflection` (relation): The chosen lift of r has square 1 and conjugates by the stated involution.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.fullRealCover_reflection_test` (computation): μ(r)=−1 and r²=I₄.
- `TauCeti.Jacobi.GenusTwo.fullRealCover_base` (computation): c(iI₂)=iI₂.
- `TauCeti.Jacobi.GenusTwo.fullRealCover_central` (compatibility): The involution fixes both kernel elements.

Acceptance:

- The reflection is excluded from GSp⁺ but included in the extension.
- The chosen reflection lift squares to 1, a convention that must be matched at finite places.

Source: BFH90, §1, pp.545–546, definition of GSp⁺(4,R). Evidence relationship: This is an explicitly derived real extension of BFH's positive component. BFH does not assert its finite-place compatibility; that boundary remains a supplier request.

### Arithmetic and adelic cover compatibility

Declaration: `TauCeti.Jacobi.GenusTwo.arithmetic_adelic_comparison` (comparison). Node: `MetaplecticAutomorphicForms:MP.8/arithmetic-adelic-comparison`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/AdelicComparison`.

Use the MP.4 restricted product of normalized local rank-two metaplectic covers, the rational splitting on Sp₄(Q), and the Schrödinger–Weil lattice model. Construct the map from the BFH real arithmetic lift of Γ_N into the quotient by the rational splitting with the finite vector fixed by its specified compact-open subgroup. Prove that its archimedean theta multiplier equals the θ-S law and that the two cusp splittings differ by the prescribed J lift. The finite multiplier, dyadic splitting at N divisible by 8M, and extension to Qˣ similitudes must be specified explicitly before this comparison is usable.

Construction or proof:

1. Import the local cocycle, genuine oscillator representation and restricted-product construction, never reconstruct them in MP.8.
2. Compare on the unipotent generators, integral Levi generators and J, using the Fourier transform of the same self-dual measure.
3. Check the product formula and the finite lattice stabilizer, especially at 2; compare the chosen full-real reflection convention separately. Exact finite similitude cocycle and splitting data are recorded as an open input.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/full-real-cover`, `MetaplecticAutomorphicForms:MP.8/arithmetic-subgroup`, `MetaplecticAutomorphicForms:MP.8/theta-fourier-transform`, `MetaplecticAutomorphicForms:MP.1`, `MetaplecticAutomorphicForms:MP.2`, `MetaplecticAutomorphicForms:MP.4`.

Acceptance:

- Agreement on Sp₄ is insufficient to assert agreement on all GSp₄ similitudes.
- An unramified odd-prime vector cannot justify the dyadic arithmetic splitting.

Suggested signature boundary: No native comparison signature: MP.4 restricted product, rational splitting, dyadic finite lattice vector and rational-similitude extension are absent. The full mathematical target stays in the packet and exact gap.

Open proof inputs:

- Rank-two adelic and similitude comparison: The exact MP.4 rational/finite-place splitting and its extension to Qˣ similitudes have not been established here. Specify the finite theta lattice vector and dyadic compact-open lift at 8M|N, compare its real square-root multiplier including the J phase, and identify it with the MP.6 native Jacobi model. The real reflection extension is a chosen explicit extension, not evidence that an adelic GSp cover is canonically split.

Source: BFH90, §1, pp.545–549; §2, p.553, (2.6). Evidence relationship: BFH supplies the concrete classical family and asserts its continuation. The stated intrinsic cover/adelic reformulation and the AS adaptation are target-level plans, with explicit source/interface gaps; this citation does not claim BFH proves that reformulation.

### Theta component Levi transformations

Declaration: `TauCeti.Jacobi.GenusTwo.theta_levi_transform` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/theta-levi-transform`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Covariance`.

Let E(n)=[[1,n],[0,1]], N|n. Then E₁(m(E(n))g;ν)=E₁(g;E(n)ᵀν), and E₀(m(E(n)ᵀ)g;μ)=E₀(g;E(n)μ). For ν=(0,r), the first component and the finite Fourier combination Σμ e(−Nν·μ/(2m))E₀(g;μ) are invariant under the relevant E(n) action. This is Proposition 2.3 and its Corollary 2.4, with the transpose on the correct cusp.

Construction or proof:

1. Change the theta summation vector by the integral unimodular Levi matrix.
2. Compare coefficients of the independent theta basis. Reindex the finite Fourier sum for ν=(0,r).

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/theta-decomposition`, `MetaplecticAutomorphicForms:MP.8/theta-component-fourier-law`.

Acceptance:

- The cusp-0 and cusp-1 Levi matrices are transposes.

Source: BFH90, §2, pp.554–555, Proposition 2.3, Corollary 2.4. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Theta component unipotent transformations

Declaration: `TauCeti.Jacobi.GenusTwo.theta_unipotent_transforms` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/theta-unipotent-transforms`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Covariance`.

For ν=(0,r), E₁(n(V)g;ν)=E₁(g;ν) if V is integral symmetric, N|V₁₁,V₁₂ and 4m|V₂₂. E₀(n(V)g;μ)=E₀(g;μ) for every integral symmetric V and every μ. For N|n the lower-unipotent laws are √det(I+U₁(n)Z_g)E₁(lower(U₁(n))g;ν)=E₁(g;ν) and √det(I+U₀(n)Z_g)Σμ e(−Nν·μ/(2m))E₀(lower(U₀(n))g;μ)=Σμ e(−Nν·μ/(2m))E₀(g;μ), U₁(n)=diag(0,n), U₀(n)=diag(n,0). Roots are the cover lifts continued from n=0.

Construction or proof:

1. For upper unipotents compute the exponential on each residue class; the displayed divisibilities make it 1.
2. Conjugate by J, apply the finite theta Fourier transform twice, and track the root and phase to obtain the lower laws.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/theta-levi-transform`, `MetaplecticAutomorphicForms:MP.8/theta-component-fourier-law`.

Acceptance:

- The 4m divisibility on V₂₂ cannot be weakened to N alone.
- The lower law contains the determinant root, unlike the upper law.

Suggested signature boundary: The native signature is the upper-unipotent specialization. Lower-unipotent lifts and continued determinant-root law must be added with the MP.1/MP.6 comparison interface.

Source: BFH90, §2, pp.555–556, Propositions 2.5–2.6. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Fourier coefficient Levi covariance

Declaration: `TauCeti.Jacobi.GenusTwo.coefficient_levi_transform` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/coefficient-levi-transform`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Covariance`.

For y∈Γ⁰(N) at cusp j=1 and y∈Γ₀(N) at j=0, B_j(m(y)g;T,R)=B_j(g;yᵀTy,yᵀR) and C_j(m(y)g;U,R)=C_j(g;yᵀUy,yᵀR), with the corresponding residue reduction. Corollary 2.8 specializes ν=(0,r) and the diagonal U₁(−ND),U₀(−D) to the invariances required for §6–8 Fourier extraction.

Construction or proof:

1. Change variables on the X,W quotient tori; unimodularity preserves Haar volume and the respective congruence subgroup preserves the period lattice.
2. Transport the native quadratic form by y, then recover its discriminant form and residue. Specialize the triangular generators for Corollary 2.8.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-coefficient`, `MetaplecticAutomorphicForms:MP.8/theta-decomposition`, `MetaplecticAutomorphicForms:MP.8/theta-levi-transform`, `MetaplecticAutomorphicForms:MP.8/theta-coefficient`, `mathlib:Matrix.toLin'`.

Acceptance:

- The coefficient index is the full conjugated matrix, not only its scalar determinant.

Suggested signature boundary: The native signature records the quadratic-form congruence dictionary. The B_j/C_j covariance additionally needs the exact cusp subgroup, transform on g and residue reduction, stated in the packet.

Source: BFH90, §2, pp.556–557, Proposition 2.7, Corollary 2.8. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

## Primitive arithmetic and matrix Möbius inversion

### Matrix Möbius function

Declaration: `TauCeti.Jacobi.GenusTwo.matrixMobius` (definition). Node: `MetaplecticAutomorphicForms:MP.8/matrix-mobius`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/MatrixMobius`.

For a nonsingular integral 2×2 matrix H, choose positive Smith invariants a|b with UHV=diag(a,b), U,V∈GL₂(Z), and define μ₂(H)=gcd(a,b)μ(a)μ(b), using the native integer Möbius function. The value is independent of the Smith presentation and invariant under left and right unimodular multiplication. Matrix divisors H|C mean H⁻¹C integral, modulo right multiplication of H by GL₂(Z). Set μ₂(H)=0 for singular H; the divisor theorems only use nonsingular C and full-rank divisors.

Construction or proof:

1. Use native Submodule.exists_smith_normal_form_of_le for the image lattice in Z²; normalize its two nonzero integer coefficients by units. Prove presentation independence by the gcd/product invariants argument on p.578, without re-planning Smith normal form.
2. Evaluate native ArithmeticFunction.moebius on the two positive invariants. Right-unimodular invariance of divisor representatives is separate from left/right invariance of μ₂.

Direct dependencies: `mathlib:ArithmeticFunction.moebius`, `mathlib:Submodule.exists_smith_normal_form_of_le`.

Uses:

- BFH §4, pp.577–578, paragraph before Proposition 4.1 and Proposition 4.2: Remove primitive-pair constraints by the matrix Möbius inversion, using full row rank and CDᵀ=DCᵀ and the required integral completion.
- BFH §4, p.578, Proposition 4.1: Uses matrix möbius function in matrix möbius divisor identity: For nonsingular C∈M₂(Z), the finite sum Σ_{H|C / right GL₂(Z)} μ₂(H) is 1 if C is unimodular and 0 otherwise.

API:

- `TauCeti.Jacobi.GenusTwo.matrixMobius_unimodular` (simp): A unimodular H has μ₂(H)=1.
- `TauCeti.Jacobi.GenusTwo.matrixMobius_smith` (characterisation): On Smith diagonal a|b, μ₂=gcd(a,b)μ(a)μ(b).
- `TauCeti.Jacobi.GenusTwo.matrixMobius_equiv` (functoriality): μ₂(UHV)=μ₂(H) for U,V unimodular.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.matrixMobius_identity` (computation): μ₂(I₂)=1.
- `TauCeti.Jacobi.GenusTwo.matrixMobius_scalar_prime` (computation): μ₂(pI₂)=p for a prime p.
- `TauCeti.Jacobi.GenusTwo.matrixMobius_square_prime` (computation): μ₂(diag(p²,1))=0.

Acceptance:

- μ₂(I₂)=1, μ₂(pI₂)=p for prime p, μ₂(diag(p²,1))=0.

Source: BFH90, §4, pp.577–578, definition before Proposition 4.1. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Primitive symmetric pairs and symplectic completion

Declaration: `TauCeti.Jacobi.GenusTwo.primitive_symplectic_pairs` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/primitive-symplectic-pairs`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/MatrixMobius`.

For an integral pair (C,D) of full row rank two satisfying CDᵀ=DCᵀ, call it primitive if every rational G with GC,GD integral is integral. It is primitive exactly when it occurs as the bottom row of a matrix in Sp₄(Z). Every such full-rank symmetric pair factors (C,D)=H(C₀,D₀) with H nonsingular integral and (C₀,D₀) primitive; a matrix H₁ divides both C,D iff it divides H, and H is unimodular iff the pair is primitive.

Construction or proof:

1. The superscript t in BFH is prefixed to D: the condition is CDᵀ symmetric, not CᵀD symmetric.
2. Use Smith normal form of the full-row-rank 2×4 matrix (C,D) to extract the image lattice and its content H. Full row rank is essential to nonsingularity.
3. Complete a primitive isotropic rank-two lattice to an integral symplectic basis; BFH cites Maass §11. Record that exact completion theorem as a gap.

Direct dependencies: `mathlib:Matrix.symplecticGroup`, `MetaplecticAutomorphicForms:MP.8/matrix-mobius`.

Acceptance:

- The zero pair is excluded by full row rank.
- The bottom pair (0,I₂) is primitive and completes to the identity.

Open proof inputs:

- Primitive pair completion and rank-one normal form: BFH p.577 cites Maass section 11 for completion of an integral primitive symmetric pair, and p.587 cites Maass p.160 for rank-one normal form. These passages are unread. The target includes full row rank and CDᵀ=DCᵀ, not CᵀD symmetry. Prove the integral completion and the exact congruence/coset reductions or verify those sources.

Source: BFH90, §4, pp.577–578, paragraph before Proposition 4.1 and Proposition 4.2. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Matrix Möbius divisor identity

Declaration: `TauCeti.Jacobi.GenusTwo.matrix_mobius_divisor_identity` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/matrix-mobius-divisor-identity`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/MatrixMobius`.

For nonsingular C∈M₂(Z), the finite sum Σ_{H|C / right GL₂(Z)} μ₂(H) is 1 if C is unimodular and 0 otherwise.

Construction or proof:

1. Unimodular left and right changes reduce C to positive Smith diagonal diag(a,b).
2. Use representatives H=[[r,s],[0,t]], r,t>0, 0≤s<r. The divisor conditions are r|a,t|b,rt|sb.
3. Separate relatively prime elementary factors and check prime-power cases, where only r=1,p give nonzero contributions.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/matrix-mobius`.

Acceptance:

- At C=pI₂ the divisor sum vanishes although μ₂(C)=p.

Source: BFH90, §4, p.578, Proposition 4.1. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Primitive matrix Möbius inversion

Declaration: `TauCeti.Jacobi.GenusTwo.matrix_mobius_inversion` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/matrix-mobius-inversion`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/MatrixMobius`.

For a function h on rational symmetric matrices periodic under integral symmetric translations, define S_h(C)=Σ_{D mod C,CDᵀ=DCᵀ}h(C⁻¹D) and S_h# by restricting to primitive pairs. For nonsingular C, S_h#(C)=Σ_{H|C}μ₂(H)S_h(H⁻¹C). If C≡0 mod N, restrict S_h,N to gcd(det D,N)=1 and D₁₂≡0 mod N; the primitive restricted sum equals Σ_{H|C,gcd(det H,N)=1}μ₂(H)S_h,N(H⁻¹C). The restricted formula uses the common content factor; the congruence must be tracked after division. In the N-restricted formula choose N-adapted upper Hermite representatives H=[[r,s],[0,t]] with gcd(rt,N)=1 and s≡0 mod N: choose the representative of the ordinary s mod r in N·Z (possible uniquely modulo Nr). Then H is diagonal modulo N and H⁻¹ preserves D₁₂≡0 mod N. An arbitrary equivalent matrix divisor representative is insufficient.

Construction or proof:

1. Insert the divisor identity for the common content H of each pair. Finite reindexing proves unrestricted inversion.
2. For the congruence-restricted sum, primitive C≡0N forces detD coprime to N; only content factors prime to N survive. Preserve D₁₂ congruence when transporting the representatives. Use these N-adapted representatives before dividing; do not infer congruence preservation from the unrestricted GL₂-invariance of μ₂.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/primitive-symplectic-pairs`, `MetaplecticAutomorphicForms:MP.8/matrix-mobius-divisor-identity`.

Acceptance:

- N=1 reduces to the unrestricted formula.

Suggested signature boundary: The unrestricted native inversion is typed; the N-restricted congruence/content version is specified in the packet and needs its quotient comparison.

Source: BFH90, §4, p.579, Propositions 4.3–4.4. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

## Cusp unfolding and coefficient series

### Genus-two finite exponential sums

Declaration: `TauCeti.Jacobi.GenusTwo.finiteExponentialSums` (definition). Node: `MetaplecticAutomorphicForms:MP.8/finite-exponential-sums`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/ExponentialSums`.

For det C≠0, T half integral symmetric and R∈Z², define S₁(C;T,R)=Σ_{D mod NC,CDᵀ=DCᵀ, primitive(C,D),D≡0 mod N} Σ_{λ∈Z²/CᵀZ²} e(−RᵀC⁻¹Dλ+m(C⁻¹D)[λ]+N⁻¹tr(TC⁻¹D)). Define S₀ by D mod C, D₁₂≡0N and the phase −NRᵀC⁻¹Dλ+m(C⁻¹D)[λ]+tr(TC⁻¹D), requiring C≡0N. Here D mod LC means D'=D+LC S for an integral symmetric S. The quotient is taken inside the symmetric pairs; the second quotient is the image lattice CᵀZ². Phases must descend before summing.

Construction or proof:

1. Use exact native quotient sets for the D translation relation and for the λ lattice relation; prove finiteness from detC≠0.
2. Prove phase independence under both choices using T half integral, m divisible by N and primitive symmetric-pair congruences.
3. Sum the actual additive characters over finite quotients, not a table assigned as data.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/primitive-symplectic-pairs`, `MetaplecticAutomorphicForms:MP.8/arithmetic-subgroup`, `MetaplecticAutomorphicForms:MP.8/matrix-mobius-inversion`.

Uses:

- BFH §5, p.580, definition of H before Proposition 5.1: Uses genus-two finite exponential sums in genus-two fourier unfolding kernel: For Y=QQᵀ positive definite, Z=X+iY, detC≠0, define H(Q,s;C,T,R)=(2mN³)^−1∫_{R³}√(−detZ)(detY/|detZ|²)^(s/2) I([[0,−C⁻ᵀ],[C,0]][[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]]) e(Z[R]/(4m)−N⁻¹tr(TZ))dX. The positive-base power is exp((s/2)log(detY/|detZ|²)). Its quadratic shift identity is H(Q,s;C,N^(1−j)T,N^(1−j)R)=H(Q,s;C,N^(1−j)U/(4m),0) when T=
- BFH §5, pp.580–582, Proposition 5.1: Uses genus-two finite exponential sums in cusp-one full-rank fourier unfolding: For Re s sufficiently large and g=[[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]], B₁(g;T,R)=Σ_{C nonsingular,C₁₂≡0N / left Γ⁰(N)} S₁(C;T,R)|det C|^−s H(Q,s;C,T,R). It is C₁₂≡0N, not C≡0N. Since D≡0N and the bottom pair is primitive, all C in this cusp have full rank.
- BFH §6, pp.583–584; §7, p.589, (7.1): Uses genus-two finite exponential sums in bfh first-cusp dirichlet series: For the preceding parameters and the original normalized newform f with Fourier coefficients a(n), set L(s,D,n₂)=Σ_{α,δ>0; β mod Nδ;N|β;α|Nn₂δ} S₁([[α,β],[0,δ]];U₁(n₁),ν)(αδ)^−s(α/δ)^(k/2)a(Nn₂δ/α)e(n₂β/α). Put L(s,D)=L(s,D,N⁻¹). Positive real powers use the real logarithm. The congruence and divisibility constraints a

API:

- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_well_defined` (characterisation): Changing either representative leaves the character and sum unchanged under the stated conditions.
- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_identity` (simp): S₁(I₂;T,R)=1.
- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_bad_determinant` (simp): If gcd(det C,N)>1 then S₁(C;T,R)=0.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_identity_test` (computation): S₁(I₂;0,0)=1.
- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_bad_prime` (non-example): For p|N, S₁(pI₂;T,R)=0.
- `TauCeti.Jacobi.GenusTwo.finiteExponentialSums_gauss` (computation): For N=1,m=1,C=diag(1,3),T=R=0, S₁=0: the two primitive D₂₂ classes yield opposite quadratic Gauss phases.

Acceptance:

- S₁ vanishes unless gcd(det C,N)=1.
- At C=I₂ there is one admissible D class and one λ class, so S₁=1.

Source: BFH90, §5, p.580, (5.2); p.582, (5.4). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Genus-two Fourier unfolding kernel

Declaration: `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel` (definition). Node: `MetaplecticAutomorphicForms:MP.8/fourier-unfolding-kernel`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/Unfolding`.

For Y=QQᵀ positive definite, Z=X+iY, detC≠0, define H(Q,s;C,T,R)=(2mN³)^−1∫_{R³}√(−detZ)(detY/|detZ|²)^(s/2) I([[0,−C⁻ᵀ],[C,0]][[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]]) e(Z[R]/(4m)−N⁻¹tr(TZ))dX. The positive-base power is exp((s/2)log(detY/|detZ|²)). Its quadratic shift identity is H(Q,s;C,N^(1−j)T,N^(1−j)R)=H(Q,s;C,N^(1−j)U/(4m),0) when T=(U+N^(2−j)RRᵀ)/(4m).

Construction or proof:

1. Define the vector-valued Bochner integral with the same determinant-root branch as W.
2. Combine its two exponential quadratic terms algebraically to obtain the U identity; convergence and unfolding are separate claims.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/bfh-seed`, `MetaplecticAutomorphicForms:MP.8/finite-exponential-sums`, `MetaplecticAutomorphicForms:MP.8/quadratic-matrix`.

Uses:

- BFH §5, pp.580–582, Proposition 5.1: Uses genus-two fourier unfolding kernel in cusp-one full-rank fourier unfolding: For Re s sufficiently large and g=[[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]], B₁(g;T,R)=Σ_{C nonsingular,C₁₂≡0N / left Γ⁰(N)} S₁(C;T,R)|det C|^−s H(Q,s;C,T,R). It is C₁₂≡0N, not C≡0N. Since D≡0N and the bottom pair is primitive, all C in this cusp have full rank.

API:

- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_zero` (simp): A zero seed gives H=0.
- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_linear` (functoriality): H is linear in the seed and commutes with continuous linear functionals in its convergence chamber.
- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_discriminant` (compatibility): Substituting T=(U+N^(2−j)RRᵀ)/(4m) gives the stated R=0 kernel.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_zero_test` (degenerate): H of zero is zero.
- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_base_root` (computation): At X=0,Y=I₂ the root factor is 1.
- `TauCeti.Jacobi.GenusTwo.fourierUnfoldingKernel_shift_test` (computation): N=8,m=16,j=1,R=(0,1),U=0 gives T=diag(0,1/8); its two exponent terms cancel.

Acceptance:

- The prefactor is 1/(2mN³), and the real power uses s/2.

Source: BFH90, §5, p.580, definition of H before Proposition 5.1. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Cusp-one full-rank Fourier unfolding

Declaration: `TauCeti.Jacobi.GenusTwo.cusp_one_unfolding` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/cusp-one-unfolding`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/Unfolding`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For Re s sufficiently large and g=[[Q,XQ⁻ᵀ],[0,Q⁻ᵀ]], B₁(g;T,R)=Σ_{C nonsingular,C₁₂≡0N / left Γ⁰(N)} S₁(C;T,R)|det C|^−s H(Q,s;C,T,R). It is C₁₂≡0N, not C≡0N. Since D≡0N and the bottom pair is primitive, all C in this cusp have full rank.

Construction or proof:

1. Classify the P∩Γ left cosets by primitive bottom pairs (C,D), modulo left Γ⁰(N).
2. Unravel the X torus using D↦D+NC S, then unravel the W integral using λ↦λ+Cᵀλ₀. Prove absolute convergence before these changes.
3. Shift X by C⁻¹D and evaluate the Gaussian W integral; its determinant and 2m factors give H.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/fourier-coefficient`, `MetaplecticAutomorphicForms:MP.8/finite-exponential-sums`, `MetaplecticAutomorphicForms:MP.8/fourier-unfolding-kernel`, `MetaplecticAutomorphicForms:MP.8/jacobi-eisenstein`.

Acceptance:

- The W Gaussian produces √(−detZ)/(2m), not detZ/(2m).

Suggested signature boundary: The typed raw seed argument omits the upstream normalized newform and BFH seed covariance, because the supplier native interfaces are absent. It is not an unconditional theorem for arbitrary functions.

Open proof inputs:

- Primitive pair completion and rank-one normal form: BFH p.577 cites Maass section 11 for completion of an integral primitive symmetric pair, and p.587 cites Maass p.160 for rank-one normal form. These passages are unread. The target includes full row rank and CDᵀ=DCᵀ, not CᵀD symmetry. Prove the integral completion and the exact congruence/coset reductions or verify those sources.

Source: BFH90, §5, pp.580–582, Proposition 5.1. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Cusp-zero Fourier rank expansion

Declaration: `TauCeti.Jacobi.GenusTwo.cusp_zero_rank_expansion` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/cusp-zero-rank-expansion`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/Unfolding`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For Re s sufficiently large, B₀ is the full-rank sum Σ_{C nonsingular,C≡0N / left Γ₀(N)}S₀(C;T,R)|detC|^−s N³H(Q,s;C,NT,NR), plus the rank-one coset contribution, plus δ_{NR/(2m)∈Z²}detY^(s/2)∫_{X mod integral symmetric} [I(g)+I(m(η)g)]e(N²Z[R]/(4m)−tr(TZ))dX. The rank-one term is the original coset sum with rank C=1, before its cuspidal Whittaker cancellation.

Construction or proof:

1. Separate cosets by rank C=0,1,2. For rank zero the W integral is the lattice delta and leaves the two η-related Levi terms.
2. For full rank repeat the proven unfolding with the cusp-zero periods, giving N³H with NT,NR.
3. Keep the rank-one contribution explicitly until §6 integrates the elliptic cusp character.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/cusp-one-unfolding`, `MetaplecticAutomorphicForms:MP.8/primitive-symplectic-pairs`.

Acceptance:

- The rank-zero lattice condition is NR/(2m) integral.
- A rank-one term is not zero as a Jacobi coefficient before the further Whittaker extraction.

Suggested signature boundary: The upstream newform/BFH seed covariance is omitted; rank-one and rank-zero computational helpers represent the exact specified source sums, not fields asserting the expansion.

Open proof inputs:

- Primitive pair completion and rank-one normal form: BFH p.577 cites Maass section 11 for completion of an integral primitive symmetric pair, and p.587 cites Maass p.160 for rank-one normal form. These passages are unread. The target includes full row rank and CDᵀ=DCᵀ, not CᵀD symmetry. Prove the integral completion and the exact congruence/coset reductions or verify those sources.

Source: BFH90, §5, pp.582–583, Proposition 5.2. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Genus-two Whittaker coefficient extraction

Declaration: `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction` (definition). Node: `MetaplecticAutomorphicForms:MP.8/whittaker-coefficient-extraction`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/WhittakerCoefficient`.

For ν=(0,r), D∈Z, n₂=q/N>0 and n₁=N(r²−D)/(4m) integral, define C₁(s;D,n₂,r;y₁,y₂)=N⁻¹∫₀ᴺ C₁(m(E(x₂))m(√y₁diag(y₂,1));U₁(−ND),ν)e(−n₂x₂)dx₂. Define C₀ by the finite Fourier sum Σμ e(−Nν·μ/(2m)) of C₀ at m(E(−x₂)ᵀ)m(√y₁diag(y₂,1)), index U₀(−D), and the same normalized x₂ integral. The latter vanishes unless 4m|D; both are well defined by the coefficient covariance and periods. At cusp zero extend the extracted function by zero outside 4m|D before using its parity API.

Construction or proof:

1. Use the proven x₂ period, not an unproved torus quotient. Construct the normalized interval integral and finite residue Fourier sum.
2. Translate the half-integral index condition via the native quadratic-form dictionary; it yields n₁ integral at cusp one and 4m|D at cusp zero.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/coefficient-levi-transform`, `MetaplecticAutomorphicForms:MP.8/theta-unipotent-transforms`, `MetaplecticAutomorphicForms:MP.8/theta-components`, `MetaplecticAutomorphicForms:MP.8/theta-coefficient`.

Uses:

- BFH §6, pp.583–584; §7, p.589, (7.1): Use the first-cusp Whittaker extraction to identify its arithmetic coefficient with the Dirichlet series of the original newform, preserving congruence and divisibility restrictions.

API:

- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_linear` (functoriality): Extraction is linear in the theta-component family.
- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_period` (characterisation): The value is independent of the interval representative of length N under the proven period law.
- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_parity` (simp): The cusp-zero coefficient is zero if 4m does not divide D.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_zero` (degenerate): The zero component has zero extraction.
- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_frequency` (computation): A component e(qx₂/N)c extracts c at frequency q/N.
- `TauCeti.Jacobi.GenusTwo.whittakerCoefficientExtraction_wrong_frequency` (non-example): A component e(qx₂/N)c extracts zero at a distinct integral frequency q'/N.

Acceptance:

- Cusp-zero extraction includes every μ, not just ν.

Source: BFH90, §6, pp.583,585–586, definitions before Propositions 6.1–6.2. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### BFH first-cusp Dirichlet series

Declaration: `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries` (definition). Node: `MetaplecticAutomorphicForms:MP.8/bfh-l-dirichlet-series`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/WhittakerCoefficient`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For the preceding parameters and the original normalized newform f with Fourier coefficients a(n), set L(s,D,n₂)=Σ_{α,δ>0; β mod Nδ;N|β;α|Nn₂δ} S₁([[α,β],[0,δ]];U₁(n₁),ν)(αδ)^−s(α/δ)^(k/2)a(Nn₂δ/α)e(n₂β/α). Put L(s,D)=L(s,D,N⁻¹). Positive real powers use the real logarithm. The congruence and divisibility constraints are part of the actual summation set.

Construction or proof:

1. Read a(n) as the original f coefficients from p.547. The auxiliary Fricke transform in the induced seed is turned back into f by the cusp-one unfolding on p.585; transformed cusp coefficients remain separately in P.
2. Use positive integer α,δ and a finite β residue set, with the divisor constraint making the coefficient index integral.
3. Prove β-representative independence from S₁ and the additive character. Initial convergence is inherited only after the actual unfolding estimate.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/finite-exponential-sums`, `MetaplecticAutomorphicForms:MP.8/whittaker-coefficient-extraction`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

Uses:

- BFH §6, pp.585–586, definition of P: Uses bfh first-cusp dirichlet series in bfh opposite-cusp dirichlet series: For 4m|D, set P(s,D,n₂,r)=Σ_{μ mod 2m/N}e(−Nν·μ/(2m))Σ_{γ∈Γ₀(N)\SL₂(Z)}Σ_{αδ>0;β mod δ;α|Nn₂δ} S₀(Nγ⁻ᵀCw;T,μ)(N²αδ)^−s(α/δ)^(k/2)a_γ(Nn₂δ/α)e(n₂β/α), C=[[α,β],[0,δ]], T=(U₀(−D)+N²μμᵀ)/(4m), and omit a term when T is not half integral. The a_γ are the Fourier coefficients of the actual transformed elliptic seed at the i
- BFH §6, pp.584–585, Proposition 6.1: Uses bfh first-cusp dirichlet series in first-cusp whittaker expansion: In the common initial convergence chamber, for D≠0 the extracted coefficient is (n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m)) L(s,D,n₂) W^{sgn D}(|D|y₁/(4m),n₂y₂;s). For D=0 it is n₂^(s−4−k/2)L(s,0,n₂)W⁰(y₁,n₂y₂;s). These are vector identities, and applying T preserves them under convergence.
- BFH §7, pp.590–594, Lemma 7.2, (7.9),(7.12)–(7.16): Uses bfh first-cusp dirichlet series in local primitive exponential factors: For upper triangular C=[[p^a,p^b],[0,p^d]], d≥1, define S_p by μ₂-inversion of the unrestricted local S. If a=0 or b=0, S_p=S(a,b,d)−pS(a,b,d−1). If a,b≥1, S_p=S(a,b,d)−p²S(a−1,b−1,d)−pS(a,b,d−1)+p³S(a−1,b−1,d−1). The S terms are p^(2a+d)N₁, p^(a+2d)N₂ or p^(a+b+d)N₃ according to Σ₁,Σ₂,Σ₃; absent divisors contribute ze

API:

- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_scalar` (functoriality): Scaling a scales L.
- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_identity_term` (projection): The α=δ=1,β=0 term is a(q) when n₂=q/N.
- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_specialize` (compatibility): L(s,D)=L(s,D,N⁻¹).

Unit tests:

- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_zero` (degenerate): a=0 gives L=0.
- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_normalized_term` (computation): For q=1 and a(1)=1 the identity term is 1.
- `TauCeti.Jacobi.GenusTwo.bfhLDirichletSeries_divisibility` (non-example): For q=1,α=2,δ=1 there is no summand.

Acceptance:

- At n₂=N⁻¹ the α constraint is α|δ.
- The identity α=δ=1,β=0 term is a(Nn₂).

Source: BFH90, §6, pp.583–584; §7, p.589, (7.1). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### BFH opposite-cusp Dirichlet series

Declaration: `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries` (definition). Node: `MetaplecticAutomorphicForms:MP.8/bfh-p-dirichlet-series`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/WhittakerCoefficient`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For 4m|D, set P(s,D,n₂,r)=Σ_{μ mod 2m/N}e(−Nν·μ/(2m))Σ_{γ∈Γ₀(N)\SL₂(Z)}Σ_{αδ>0;β mod δ;α|Nn₂δ} S₀(Nγ⁻ᵀCw;T,μ)(N²αδ)^−s(α/δ)^(k/2)a_γ(Nn₂δ/α)e(n₂β/α), C=[[α,β],[0,δ]], T=(U₀(−D)+N²μμᵀ)/(4m), and omit a term when T is not half integral. The a_γ are the Fourier coefficients of the actual transformed elliptic seed at the indicated cusp; w=[[0,−1],[1,0]]. Put P(s,D,r)=P(s,D,N⁻¹,r). Extend P by zero outside its allowed condition 4m|D; this convention makes the non-integral-index tests unambiguous.

Construction or proof:

1. Import arbitrary-cusp/Fricke coefficients from upstream ModularForms layer 6; the classical-to-automorphic comparison is supplied by AF.5, not MP.7.
2. Take the finite μ and cusp quotient sums, retaining the half-integral index test and the (N²αδ)^−s factor. The dependence on r is in the finite Fourier character.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/finite-exponential-sums`, `MetaplecticAutomorphicForms:MP.8/bfh-l-dirichlet-series`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`.

Uses:

- BFH §6, pp.586–588, Proposition 6.2: Uses bfh opposite-cusp dirichlet series in opposite-cusp whittaker rank expansion: For D≠0, C₀=N³(n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m))P(s,D,n₂,r)W^{sgn D}(|D|y₁/(4m),n₂y₂;s)σ(w). For D=0, C₀=N³n₂^(s−k/2−4)P(s,0,n₂,r)W⁰(y₁,n₂y₂;s)σ(w)+(y₁y₂)^s y₂^(k/2)a(Nn₂)e(in₂y₂)vσ(η). The rank-one contribution to this extracted Whittaker coefficient is zero by cuspidality.
- BFH §7, p.589, Remark following Proposition 7.1: Compute the actual ramified cusp factors and prove their denominators nonzero near s=2 before using P-regularity in full Eisenstein regularity.

API:

- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_scalar` (functoriality): P is linear in all the transformed cusp coefficient sequences.
- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_residue` (relation): P is periodic in r modulo 2m/N.
- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_parity` (simp): Non-half-integral T contributes zero.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_zero` (degenerate): Zero coefficients at every cusp give P=0.
- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_residue_test` (compatibility): Replacing r by r+2m/N leaves P unchanged.
- `TauCeti.Jacobi.GenusTwo.bfhPDirichletSeries_nonintegral` (non-example): N=8,m=16,D=0,μ=(1,0) gives T=diag(1,0), hence is admitted; μ=(1,1) gives off-diagonal 1, also admitted. At D=1,μ=0 the index is not half integral and is omitted.

Acceptance:

- Replacing all a_γ by a silently loses the cusp data.
- Terms with non-half-integral T are zero.

Source: BFH90, §6, pp.585–586, definition of P. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### First-cusp Whittaker expansion

Declaration: `TauCeti.Jacobi.GenusTwo.first_cusp_whittaker_expansion` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/first-cusp-whittaker-expansion`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/WhittakerCoefficient`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

In the common initial convergence chamber, for D≠0 the extracted coefficient is (n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m)) L(s,D,n₂) W^{sgn D}(|D|y₁/(4m),n₂y₂;s). For D=0 it is n₂^(s−4−k/2)L(s,0,n₂)W⁰(y₁,n₂y₂;s). These are vector identities, and applying T preserves them under convergence.

Construction or proof:

1. Reduce C by left Γ⁰(N) to positive upper-triangular Hermite representatives α,β,δ.
2. Use the elliptic Fourier expansion to perform the x₂ integral; its period produces α|Nn₂δ, its coefficient a(Nn₂δ/α), and the phase e(n₂β/α).
3. Apply the scaled Whittaker integral (3.52)–(3.54) and track every n₂,|D|,4m power.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/cusp-one-unfolding`, `MetaplecticAutomorphicForms:MP.8/bfh-l-dirichlet-series`, `MetaplecticAutomorphicForms:MP.8/whittaker-functions`.

Acceptance:

- The D=0 formula is separate; substituting D=0 into the nonzero formula is invalid.

Suggested signature boundary: The raw C and coefficient arguments must be the actual first-cusp Eisenstein theta family at the spectral parameter s and the original normalized newform f. The nonzero-D signature is typed; the D=0 formula is definitive in the packet.

Source: BFH90, §6, pp.584–585, Proposition 6.1. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Opposite-cusp Whittaker rank expansion

Declaration: `TauCeti.Jacobi.GenusTwo.opposite_cusp_whittaker_expansion` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/opposite-cusp-whittaker-expansion`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/WhittakerCoefficient`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For D≠0, C₀=N³(n₂|D|/(4m))^(s−4)n₂^−k/2 e(iy₁D/(4m))P(s,D,n₂,r)W^{sgn D}(|D|y₁/(4m),n₂y₂;s)σ(w). For D=0, C₀=N³n₂^(s−k/2−4)P(s,0,n₂,r)W⁰(y₁,n₂y₂;s)σ(w)+(y₁y₂)^s y₂^(k/2)a(Nn₂)e(in₂y₂)vσ(η). The rank-one contribution to this extracted Whittaker coefficient is zero by cuspidality.

Construction or proof:

1. Treat full-rank and rank-zero terms separately; apply the finite Fourier μ sum before the parabolic reduction.
2. For rank one import the integral rank-one normal form cited from Maass p.160, unfold its remaining x₃ period and use the elliptic constant coefficient a(0)=0.
3. The rank-zero term survives only at D=0 and supplies the additional η-vector. Never absorb it into P or W⁰.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/cusp-zero-rank-expansion`, `MetaplecticAutomorphicForms:MP.8/bfh-p-dirichlet-series`, `MetaplecticAutomorphicForms:MP.8/first-cusp-whittaker-expansion`.

Acceptance:

- The factor N³ and the extra rank-zero term are required.

Suggested signature boundary: The raw C and coefficient arguments must be the actual opposite-cusp Eisenstein family and Fricke seed, with phiW the w-rotated functional. The nonzero-D signature is typed; the D=0 rank-zero formula is definitive in the packet. C is now explicitly a family in s, and the extraction is applied to C(s).

Source: BFH90, §6, pp.586–588, Proposition 6.2. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

## Prime-power arithmetic and Euler factors

### Prime-power congruence counts

Declaration: `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts` (definition). Node: `MetaplecticAutomorphicForms:MP.8/local-prime-root-counts`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/RootCounts`.

For p prime, p∤2mN, put b≥0 and a,d≥0. In cases Σ₁:a≤d,a≤b and Σ₂:a>d,a≤b, N₁₂ is the number of (λ₁ mod p^a,λ₂ mod p^d) satisfying mλ₁²≡0 mod p^a, 2mλ₁λ₂−rλ₁≡0 mod p^min(a,d), mλ₂²−rλ₂+n₁/N≡0 mod p^d. For Σ₃:a>b, N₃ counts (λ₁ mod p^b,λ₂ mod p^(a+d−b)) satisfying mλ₁²+rλ₁+n₁/N≡0 mod p^b, 2mλ₁λ₂+rλ₂−rp^(a−b)λ₁−2p^(a−b)n₁/N≡0 mod p^b, mλ₂²−rp^(a−b)λ₂+p^(2(a−b))n₁/N≡0 mod p^(a+d−b). Interpret N⁻¹ in these finite rings, since p∤N.

Construction or proof:

1. Use native ZMod finite rings and the canonical inverse of N, never rational division in an integer congruence.
2. Count the actual solution subtype with Nat.card. The x₀ residue modulus α₁β₃δ₂ in the p.591 parametrization gives p^min(a,d) after the p.590–592 character sum. The printed p^min(a,b) in (7.10) is E-MP8-8; keep the independently checked table of Lemma 7.3 unchanged.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/finite-exponential-sums`.

Uses:

- BFH §7, pp.595–597, Lemma 7.3: Uses prime-power congruence counts in prime-power root-count evaluation: Write D=D'p^(2h), p²∤D', χ=χ_{D'}(p), ε(t)=t mod2, p∤2mN. For i=1,2 and a≤d+1, the count N_i is: p^((a−ε(a)+d−ε(d))/2) if d≤2h; for d≥2h+1 and χ=1, N₁=2p^(h+min((a−ε(a))/2,h)), N₂=2p^(2h+1); for d=2h+1 and χ=0, N₁=p^(h+(a−ε(a))/2), N₂=p^(2h+1); otherwise 0. Here i=1 uses a≤d and i=2 uses a>d, so the two identical defin

API:

- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_zero_exponents` (simp): N₁₂(p,0,b,0)=1.
- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_finite` (structure): The counts are cardinalities of finite congruence solution sets.
- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_quadratic` (compatibility): At a=0, N₁₂ counts the quadratic roots mλ₂²−rλ₂+n₁/N modulo p^d.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_base` (computation): N₁₂(3,0,0,0;1,1,0,0)=1.
- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_split` (computation): For p=3,m=N=1,r=0,n₁=−1,a=0,d=1 there are two roots λ₂=±1, so the count is 2.
- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_nonsplit` (non-example): For p=3,m=N=1,r=0,n₁=1,a=0,d=1 the count is 0.
- `TauCeti.Jacobi.GenusTwo.localPrimeRootCounts_mixed_modulus` (computation): For p=3,m=16,N=8,r=1,n₁=0,a=b=2,d=1 there are six solutions: λ₁∈{0,3,6},λ₂∈{0,1}. The printed min(a,b) modulus leaves only two.

Acceptance:

- At a=d=0, N₁₂=1.
- p=2 and p|m are excluded from the unramified calculation.

Source: BFH90, §7, pp.592–593, (7.10)–(7.11). Evidence relationship: Correct the mixed modulus in published (7.10) as E-MP8-8, using the preceding matrix parametrization and direct finite cardinalities.

### Prime-power root-count evaluation

Declaration: `TauCeti.Jacobi.GenusTwo.local_root_count_table` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/local-root-count-table`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/RootCounts`.

Write D=D'p^(2h), p²∤D', χ=χ_{D'}(p), ε(t)=t mod2, p∤2mN. For i=1,2 and a≤d+1, the count N_i is: p^((a−ε(a)+d−ε(d))/2) if d≤2h; for d≥2h+1 and χ=1, N₁=2p^(h+min((a−ε(a))/2,h)), N₂=2p^(2h+1); for d=2h+1 and χ=0, N₁=p^(h+(a−ε(a))/2), N₂=p^(2h+1); otherwise 0. Here i=1 uses a≤d and i=2 uses a>d, so the two identical defining congruence systems have different permitted a,d ranges. For N₃ at a=b+1,b≤d−1,d≥1: p^((d+ε(d)+b−ε(b))/2) if d≤2h+1,b≤2h; 2p^(h+1+(b−ε(b))/2) if χ=1,d≥2h+2,b≤2h; p^(h+1+(b−ε(b))/2) if χ=0,d=2h+2,b≤2h; 4p^(2h+1) if χ=1,d≥2h+2,b=2h+1; 2p^(2h+1) if χ=1,d≥2h+2,b≥2h+2; p^(2h+1) if χ=0,d=2h+2,b=2h+1; otherwise 0.

Construction or proof:

1. For d≤2h factor λ₂ by p^ceil(d/2); count λ₁ via the first quadratic congruence.
2. For d>2h substitute λ₂=p^h λ₂' and distinguish split, ramified and nonsplit roots of the remaining discriminant. Impose the mixed congruence to count λ₁.
3. For Σ₃ force λ₂=pλ₂', reduce the modulus by one and analyze the coupled roots. At the double-root threshold the two signs must be opposite, producing 2p^(2h+1), as p.597.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/local-prime-root-counts`.

Acceptance:

- At h=0,a=0,d=1 the split count is 2 and nonsplit count is 0.
- The parity indicators change the exponents for odd a or d.

Suggested signature boundary: The suggested local_root_count_table signature only types the h=0,a=0 nonramified-discriminant row. All N₁,N₂,N₃ rows with h>0, χ=0 and their boundary cases are definitive in the packet; their signatures await the finite-character/discriminant interface. Direct enumeration checks 2,016 small cases, not a proof of all rows.

Source: BFH90, §7, pp.595–597, Lemma 7.3. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Local primitive exponential factors

Declaration: `TauCeti.Jacobi.GenusTwo.local_mobius_factors` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/local-mobius-factors`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/RootCounts`.

For upper triangular C=[[p^a,p^b],[0,p^d]], d≥1, define S_p by μ₂-inversion of the unrestricted local S. If a=0 or b=0, S_p=S(a,b,d)−pS(a,b,d−1). If a,b≥1, S_p=S(a,b,d)−p²S(a−1,b−1,d)−pS(a,b,d−1)+p³S(a−1,b−1,d−1). The S terms are p^(2a+d)N₁, p^(a+2d)N₂ or p^(a+b+d)N₃ according to Σ₁,Σ₂,Σ₃; absent divisors contribute zero. For coprime determinant factors S is multiplicative, and S₁(C)=∏_{p|δ}S_p(C_p) in the α|δ series.

Construction or proof:

1. Construct the explicit unimodular diagonalization of Lemma 7.2 using the displayed CRT congruences. Summing D imposes the three root equations.
2. Use CRT and β-unit independence to factor S. The only μ₂-nonzero local divisors are I,diag(p,1) with upper residues,diag(1,p),pI.
3. Insert their weights 1,−1,−1,p and count the upper residues; this gives the four-term formula. Lemma 7.4 is its arithmetic substitution table, not a new definition assigned those values.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/matrix-mobius-inversion`, `MetaplecticAutomorphicForms:MP.8/local-root-count-table`, `MetaplecticAutomorphicForms:MP.8/bfh-l-dirichlet-series`.

Acceptance:

- The p³ correction comes from the pI divisor and its residue multiplicity.
- At h=0, χ≠0: S_p([[1,p],[0,p]])=χp and S_p([[p,p],[0,p]])=p³−p².

Source: BFH90, §7, pp.590–594, Lemma 7.2, (7.9),(7.12)–(7.16). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Unramified genus-two Euler factors

Declaration: `TauCeti.Jacobi.GenusTwo.unramified_euler_factors` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/unramified-euler-factors`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/EulerFactors`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For n₂=N⁻¹ and p∤N, the factor is L_p(s,D)=1+Σ_{d≥1,0≤a≤d}p^(d−a)[S_p([[p^a,p^a],[0,p^d]],D)−S_p([[p^a,p^(a−1)],[0,p^d]],D)]p^(−(a+d)s−(d−a)k/2)a(p^(d−a)), with the second S_p term absent when a=0. At fundamental D₀, let a(p)=σ_p+σ_p' and σ_pσ_p'=p^(k−1). Then L_p=(1−σ_p²p^(4−k−2s))(1−σ_p'²p^(4−k−2s))(1−p^(3−2s))/[(1−χ_{D₀}(p)σ_pp^(2−k/2−s))(1−χ_{D₀}(p)σ_p'p^(2−k/2−s))]. At D=0 it is [(1−σ_p²p^(4−k−2s))(1−σ_p'²p^(4−k−2s))(1−p^(3−2s))]/[(1−σ_p²p^(5−k−2s))(1−σ_p'²p^(5−k−2s))(1−p^(4−2s))]. These are meromorphic identities, first proved in absolute convergence.

Construction or proof:

1. Use β sums (7.17)–(7.18), which are p^(d−a), −p^(d−a−1), or 0, to obtain (7.20).
2. Substitute the local root counts into the μ₂ formula. For fundamental D only the explicit finite list on p.598 survives.
3. Apply the elliptic Hecke recurrence, then factor its polynomial using Satake roots. For D=0 sum the geometric series displayed on p.599. Global L-function naming is an AL.3 comparison, not a reverse BSD.2 import.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/local-mobius-factors`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

Acceptance:

- The symmetric-square factors are in the numerator of the local ratio.
- At D=0 the denominator shifts by one compared with the numerator.

Suggested signature boundary: Sp(a,b,d) is the actual primitive exponential sum for [[p^a,p^b],[0,p^d]], p is unramified and chi is the character of a fundamental discriminant. These unavailable source-interface conditions are omitted; the native Hecke recurrence is present. The β-difference keeps the first exponent a fixed and changes only b from a to a−1. a(j) in the signature means the original newform coefficient at p^j. D=0 and meromorphic extensions remain in the packet.

Source: BFH90, §7, pp.594–599, (7.20),(7.33)–(7.34), and the unnumbered D=0 formulas on p.599. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Square-discriminant local polynomial and growth

Declaration: `TauCeti.Jacobi.GenusTwo.squarefactor_polynomial_bound` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/squarefactor-polynomial-bound`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Arithmetic/EulerFactors`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For D=D₀D₁², D₀ fundamental, L(s,D)=L(s,D₀)b(s,D₁), with b a finite Dirichlet polynomial supported on p|D₁, obtained by summing the same explicit (7.20) local counts. Equivalently factor out the unramified L_p for p∤ND₁, leaving the polynomial d(s,D₁) of (7.35). For real s≥2 its coefficients have |b(s,D₁)|≪_{f,N,ε}D₁^(1/2+ε), using the weak normalized bound p^(−j(k−1)/2)|a(p^j)|≤p^(j/4+ε). Thus Σ_{D₁≥1}L(s,D₀D₁²)D₁^−2u converges for Re u>3/4; if L(2,D₀)=0 the analogous series of s-derivatives at 2 has the same convergence.

Construction or proof:

1. Carry out the finite prime-power sum with h=v_p(D₁); keep every parity and ramified-root case from Lemma 7.3.
2. Use the Hecke recurrence and the stated weak coefficient bound to bound each local polynomial; absorb divisor-count factors in D₁^ε.
3. Differentiate the finite factors, absorbing their logarithms. If L(2,D₀)=0 only the derivative of the fundamental factor survives.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/unramified-euler-factors`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

Acceptance:

- No bound for the opposite-cusp P is supplied by this unramified calculation.

Suggested signature boundary: The raw b is the finite local polynomial of (7.35) from the fixed normalized newform with its weak coefficient bound, not an arbitrary function; those supplier conditions are omitted.

Source: BFH90, §7, pp.588–589, Proposition 7.1; pp.599–600, (7.35). Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

## Theta convergence and genuine spectral comparison

### Genus-two theta normal convergence

Declaration: `TauCeti.Jacobi.GenusTwo.theta_normal_convergence` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/theta-normal-convergence`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Theta/Basic`.

For a>0, on every compact subset of H₂×C² the θ_{a,ν} series and all coordinate derivatives converge absolutely and uniformly. Hence θ is jointly holomorphic and termwise differentiation, residue-class regrouping and compact-torus integration are valid. The bound uses the least eigenvalue of Im Z uniformly bounded below and bounded Im W.

Construction or proof:

1. Complete the square in −2π(Im Z)[R]/(4a)−2π Im W·R. Compact positivity gives exp(−c||R||²+C||R||).
2. Coordinate derivatives add polynomial factors, still dominated by a Gaussian lattice sum. Use the MP.2 Poisson/Fourier analytic machinery rather than duplicate it.
3. Apply locally uniform holomorphic convergence and dominated integration; this closes the otherwise implicit infinite regrouping in Proposition 2.2.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/genus-two-theta`, `MetaplecticAutomorphicForms:MP.8/siegel-space`, `MetaplecticAutomorphicForms:MP.2`.

Acceptance:

- Positivity of Im Z is essential; normal convergence is not claimed at the boundary.

Suggested signature boundary: The native prototype gives the compact uniform summable Gaussian bound. The full coordinate-derivative bounds and joint holomorphy are definitive packet obligations.

Source: BFH90, §2, pp.551–553, definition of θ and Proposition 2.1. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Genuine normalized induced-section comparison

Declaration: `TauCeti.Jacobi.GenusTwo.genuine_induced_comparison` (comparison). Node: `MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/InductionComparison`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For the actual BFH theta-component vector E_j, lift to the double cover by ℰ_j(g,h)=h(iI₂)E_j(g). The kernel −1 acts by −1. On the positive Siegel Levi Q, the determinant-root magnitude is |detQ|^−1/2. Thus the section derived from I_s has unnormalized real exponent |detQ|^(s−1/2), while δ_P^(1/2)=|detQ|^(3/2); its normalized parameter is ν=s−2. The genuine unitary Levi datum is the elliptic cuspidal π_f tensor the phase of the Weil determinant character. Prove an equivariant identification with normalized induction Ind_{P̃}^{G̃}(π̃_f⊗|det|^(s−2)), including finite arithmetic vectors and Haar measures.

Construction or proof:

1. Compute the root on diag(Q,Q⁻ᵀ), choose its unitary phase and multiply the component by that root. Derive the exponent shift rather than reuse a linear-group parameter s.
2. Check equivariance on the actual lifted parabolic, all Heisenberg and arithmetic generators, and the −1 kernel. Match the finite vector and self-dual/Haar measures.
3. Compute δ_P by its three-dimensional symmetric-matrix unipotent action. Exact cocycle/Weil phase and finite splitting verification are a recorded refinement gap; no black-box AS applicability is asserted.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/jacobi-eisenstein`, `MetaplecticAutomorphicForms:MP.8/theta-decomposition`, `MetaplecticAutomorphicForms:MP.8/similitude-cover`, `MetaplecticAutomorphicForms:MP.8/arithmetic-adelic-comparison`, `AutomorphicSpectralTheory:AS.1`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

Acceptance:

- At Q=2I₂ the root magnitude is 1/2; the exponent shift is detectable.
- The centered normalized parameter is s−2, consistent with the BFH critical point s=2.

Suggested signature boundary: The native signature proves the central-sign property of h(iI)E. The actual normalized adelic induced-space equivalence and measure/covariance interface are absent and explicitly omitted.

Open proof inputs:

- Rank-two adelic and similitude comparison: The exact MP.4 rational/finite-place splitting and its extension to Qˣ similitudes have not been established here. Specify the finite theta lattice vector and dyadic compact-open lift at 8M|N, compare its real square-root multiplier including the J phase, and identify it with the MP.6 native Jacobi model. The real reflection extension is a chosen explicit extension, not evidence that an adelic GSp cover is canonically split.
- Cover-specific spectral adaptation and joint meromorphy: BFH pp.601–602 invokes Selberg–Langlands continuation without giving a genuine-cover reduction. Prove the normalized inducing exponent ν=s−2, topology and measure comparison, absolute convergence chamber, long-Weyl intertwiner/reflection 4−s, rank-one cuspidal cancellation and constant-term pole control. Supply locally uniform denominator-cleared estimates for compact Fourier integrals and tail sums and a genuine two-variable meromorphic topology. Native one-variable MeromorphicOn and separate holomorphy do not replace that last input.

Source: BFH90, §1, p.549, I_s; §2, pp.553–554; §8, pp.601–602. Evidence relationship: BFH supplies I_s and its half-weight theta factor. The exponent s−2 is derived here from that factor and the Siegel modulus. The cover/adelic equivariant identification is a target requiring the precise recorded comparison gap, not a theorem proved by this source.

### Genuine Eisenstein initial convergence and growth

Declaration: `TauCeti.Jacobi.GenusTwo.genuine_eisenstein_initial_convergence` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-initial-convergence`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Convergence`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For the specified finite-dimensional BFH K-type, normalized newform, arithmetic finite vector and compatible cover measures, there exists S₀∈R such that E_s and its theta-component Eisenstein sums converge absolutely and locally uniformly with all required g,W,s derivatives for Re s>S₀. In that chamber, absolute-value and Sobolev majorants are bounded by the corresponding AS.1 linear Siegel induced-section estimates after ν=s−2 and the Gaussian λ summation. The actual finite-cover comparison, not the existence of a double cover alone, must establish this bound.

Construction or proof:

1. Use the explicit Weil phase of modulus one and the finite arithmetic comparison to transfer majorants for the lifted section.
2. Bound the Jacobi λ sum by the uniform Gaussian lattice estimate on compact W sets, retaining any cusp-height powers.
3. Apply AS.1 at the resulting positive chamber and prove local uniform derivative bounds. The numerical chamber and height losses must be derived from the supplier estimate, not invented.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison`, `MetaplecticAutomorphicForms:MP.8/theta-normal-convergence`, `AutomorphicSpectralTheory:AS.1`.

Acceptance:

- An existential S₀ is the source claim; no unsupported sharp half-plane is assigned.
- All §5–7 initial unfoldings use a common strict chamber.

Suggested signature boundary: The raw I must be the actual BFH newform section with the cover/finite arithmetic comparison and AS.1 majorants; these supplier conditions are omitted. The signature records pointwise summability, while uniform differentiated bounds remain definitive in the packet.

Open proof inputs:

- Cover-specific spectral adaptation and joint meromorphy: BFH pp.601–602 invokes Selberg–Langlands continuation without giving a genuine-cover reduction. Prove the normalized inducing exponent ν=s−2, topology and measure comparison, absolute convergence chamber, long-Weyl intertwiner/reflection 4−s, rank-one cuspidal cancellation and constant-term pole control. Supply locally uniform denominator-cleared estimates for compact Fourier integrals and tail sums and a genuine two-variable meromorphic topology. Native one-variable MeromorphicOn and separate holomorphy do not replace that last input.

Source: BFH90, §1, p.549, definition of E_s; §5, p.580, Proposition 5.1. Evidence relationship: BFH supplies the concrete classical family and asserts its continuation. The stated intrinsic cover/adelic reformulation and the AS adaptation are target-level plans, with explicit source/interface gaps; this citation does not claim BFH proves that reformulation.

### Genuine Siegel intertwining operators

Declaration: `TauCeti.Jacobi.GenusTwo.genuineIntertwiner` (construction). Node: `MetaplecticAutomorphicForms:MP.8/genuine-intertwining-operators`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Intertwining`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For the long Siegel Weyl element w and the induced spaces above, define M(w,s)F(g)=∫_{N_w(A)}F(w⁻¹ng)dn in its actual convergence chamber, with chosen lift of w and self-dual root-group measures. Its target is Ind(π̃_f∨⊗|det|^(2−s)); the target BFH parameter is 4−s. Continue M meromorphically as an operator between these fixed smooth genuine spaces. Record scalar normalizing factors and pole divisors at every ramified place; the cocycle makes this a genuine-cover integral, not the AS.2 linear operator.

Construction or proof:

1. Define the integral on the actual lifted unipotent subgroup and compute its parabolic covariance.
2. Compare each rank-one lifted integral with the AS.2 operator plus the explicit Weil phase. Track root ordering, Haar factors and genuine local K-types.
3. Use those comparisons for meromorphic continuation, and verify composition M(w,4−s)M(w,s)=id in compatible normalizations. Ramified scalar factors are a named open input.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison`, `MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-initial-convergence`, `AutomorphicSpectralTheory:AS.2`.

Uses:

- BFH §8, p.601; pp.611–614, (8.10)–(8.16): Identify the long-Weyl contribution with the genuine intertwiner and prove that elliptic cuspidality removes the intermediate rank-one term.

API:

- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_equivariant` (structure): M is G̃-equivariant between the stated induced spaces.
- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_integral` (characterisation): In the convergence chamber M is exactly the root-group integral with the chosen Weyl lift.
- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_composition` (relation): The compatibly normalized operators compose to identity meromorphically away from their pole divisors.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_zero` (degenerate): Zero section maps to zero.
- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_central_sign` (compatibility): The output remains genuine under the cover kernel.
- `TauCeti.Jacobi.GenusTwo.genuineIntertwiner_reflection` (computation): The parameter map 4−s is an involution and fixes s=2.

Acceptance:

- The parameter reflection is s↦4−s after the half-root shift.
- The target cusp datum is contragredient; a self-dual identification needs its own Fricke normalization.

Suggested signature boundary: Archimedean integral and right-translation compatibility are native. Composition omits membership in the actual normalized genuine induced space, dual cusp identification and avoidance of operator poles. It is a signature sketch, not an unconditional identity on all functions.

Open proof inputs:

- Cover-specific spectral adaptation and joint meromorphy: BFH pp.601–602 invokes Selberg–Langlands continuation without giving a genuine-cover reduction. Prove the normalized inducing exponent ν=s−2, topology and measure comparison, absolute convergence chamber, long-Weyl intertwiner/reflection 4−s, rank-one cuspidal cancellation and constant-term pole control. Supply locally uniform denominator-cleared estimates for compact Fourier integrals and tail sums and a genuine two-variable meromorphic topology. Native one-variable MeromorphicOn and separate holomorphy do not replace that last input.

Source: BFH90, §8, pp.601–602, continuation and constant-term discussion. Evidence relationship: BFH supplies the concrete classical family and asserts its continuation. The stated intrinsic cover/adelic reformulation and the AS adaptation are target-level plans, with explicit source/interface gaps; this citation does not claim BFH proves that reformulation.

### Genuine Eisenstein constant-term formula

Declaration: `TauCeti.Jacobi.GenusTwo.genuine_constant_term` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/genuine-constant-term`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/ConstantTerm`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

Along the Siegel unipotent radical, the genuine Eisenstein constant term is the identity section plus M(w,s) applied to the inducing section, initially in the common convergence chamber and then meromorphically. The intermediate rank-one Bruhat contribution vanishes by elliptic cuspidality. The theta/Fourier specialization recovers exactly the three boundary contributions L(s,0)M, P(s,0,r)M̃ and τ in Proposition 8.1, with their specified N and y₂ factors.

Construction or proof:

1. Unfold the constant term on the actual cover, using its unipotent splitting and the finite arithmetic comparison.
2. Classify the three relative Bruhat ranks and eliminate the intermediate rank by the elliptic constant-coefficient integral, as in Proposition 6.2.
3. Identify the surviving transformed sections and then their degenerate Whittaker transforms. Prove each scalar normalization by the earlier cusp expansions.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/genuine-intertwining-operators`, `MetaplecticAutomorphicForms:MP.8/cusp-zero-rank-expansion`, `MetaplecticAutomorphicForms:MP.8/opposite-cusp-whittaker-expansion`.

Acceptance:

- No extra pole is permitted solely because a linear-group result has one.

Suggested signature boundary: The native Euclidean torus integral specializes an adelic constant term only after its quotient, measures and rational periodicity are compared. E must be the actual genuine Eisenstein sum of F in the convergence chamber; those supplier conditions are omitted.

Open proof inputs:

- Cover-specific spectral adaptation and joint meromorphy: BFH pp.601–602 invokes Selberg–Langlands continuation without giving a genuine-cover reduction. Prove the normalized inducing exponent ν=s−2, topology and measure comparison, absolute convergence chamber, long-Weyl intertwiner/reflection 4−s, rank-one cuspidal cancellation and constant-term pole control. Supply locally uniform denominator-cleared estimates for compact Fourier integrals and tail sums and a genuine two-variable meromorphic topology. Native one-variable MeromorphicOn and separate holomorphy do not replace that last input.

Source: BFH90, §8, pp.601–602; pp.611–614, (8.10)–(8.16). Evidence relationship: BFH supplies the concrete classical family and asserts its continuation. The stated intrinsic cover/adelic reformulation and the AS adaptation are target-level plans, with explicit source/interface gaps; this citation does not claim BFH proves that reformulation.

### Genuine Eisenstein continuation and Weyl equation

Declaration: `TauCeti.Jacobi.GenusTwo.genuine_eisenstein_continuation` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-continuation`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Continuation`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

The actual BFH genuine Eisenstein family continues meromorphically in s, satisfies E(s,F)=E(4−s,M(w,s)F) after the contragredient cusp identification, and has poles only from the proven genuine constant terms. Near s=2 the chosen BFH family is regular exactly when those constant-term coefficients are regular; its residues are automorphic genuine forms obtained from residues of the intertwining operators. This target requires the cover-specific AS.2 adaptation and the correct Fricke level M, rather than an unqualified appeal to linear Selberg–Langlands theory.

Construction or proof:

1. Apply the AS.2 truncation/continuation proof after the explicit genuine intertwiner comparison; finite-cover descent must preserve the required growth and compactness assumptions.
2. Compare the constant terms of the two Weyl-related families, apply the uniqueness argument and continue from a nonempty overlap.
3. Evaluate poles and residues in the actual finite K-type topology. At s=2 use the symmetric-square denominator nonvanishing supplied by AL.3 and the opposite-cusp input below.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/genuine-constant-term`, `AutomorphicSpectralTheory:AS.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `MetaplecticAutomorphicForms:MP.8/opposite-cusp-zero-regularity`, `mathlib:MeromorphicOn`.

Acceptance:

- The paper states E_s is analytic near s=2; a proof must justify regularity of its exact constant terms.

Suggested signature boundary: The raw E is the actual BFH genuine induced Eisenstein family; covariance, arithmetic vectors, contragredient identification and operator topology are omitted. Native signatures record scalar meromorphic coordinates, while full automorphic pole/residue control stays in the packet.

Open proof inputs:

- Ramified opposite-cusp regularity: The argument asserted and omitted at BFH p.589 must establish P(s,0,r) regular near 2 and polynomial coefficient growth for the actual ramified cusp data. Choose the independent arithmetic route: compute factors at p|N and show their denominators do not vanish at 2. Do not first derive P-regularity from E-regularity and then use P-regularity to prove E-regularity.
- Cover-specific spectral adaptation and joint meromorphy: BFH pp.601–602 invokes Selberg–Langlands continuation without giving a genuine-cover reduction. Prove the normalized inducing exponent ν=s−2, topology and measure comparison, absolute convergence chamber, long-Weyl intertwiner/reflection 4−s, rank-one cuspidal cancellation and constant-term pole control. Supply locally uniform denominator-cleared estimates for compact Fourier integrals and tail sums and a genuine two-variable meromorphic topology. Native one-variable MeromorphicOn and separate holomorphy do not replace that last input.

Source: BFH90, §8, pp.601–602, continuation and pole discussion; §1, pp.550–551, newform L-functions. Evidence relationship: BFH supplies the concrete classical family and asserts its continuation. The stated intrinsic cover/adelic reformulation and the AS adaptation are target-level plans, with explicit source/interface gaps; this citation does not claim BFH proves that reformulation.

### Opposite-cusp zero coefficient regularity

Declaration: `TauCeti.Jacobi.GenusTwo.opposite_cusp_zero_regularity` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/opposite-cusp-zero-regularity`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/RamifiedRegularity`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

For the fixed BFH arithmetic data and r, P(s,0,r) is holomorphic in a neighborhood of s=2, and P(s,D,r) grows at most polynomially in D uniformly on compact parameter sets avoiding its poles. One route evaluates the ramified cusp factors to express P(s,0,r) as L(s,0) times a rational function in p^−s for p|N with denominators nonzero at 2. The alternative in BFH p.589 derives regularity of this coefficient from the already established full Eisenstein regularity; those two routes must not be used circularly.

Construction or proof:

1. Compute the finite ramified cusp sums using the restricted matrix Möbius inversion, and list their denominators at s=2. BFH omits this calculation; it remains an exact proof gap.
2. For the growth bound use the actual automorphic Whittaker coefficient estimates after cover comparison, not the unramified L-series polynomial.
3. Choose this arithmetic route before deducing E regularity, or establish E regularity independently by intertwiner normalization before using the coefficient route. The packet selects the arithmetic route to keep the graph acyclic.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/bfh-p-dirichlet-series`, `MetaplecticAutomorphicForms:MP.8/matrix-mobius-inversion`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicSpectralTheory:AS.1`.

Acceptance:

- No dependency on genuine-eisenstein-continuation is used here.

Suggested signature boundary: The aCusp argument must be the actual Fricke/cusp expansion of the normalized conductor-M newform with the fixed BFH datum. These supplier conditions are omitted, and polynomial growth is a packet obligation.

Open proof inputs:

- Ramified opposite-cusp regularity: The argument asserted and omitted at BFH p.589 must establish P(s,0,r) regular near 2 and polynomial coefficient growth for the actual ramified cusp data. Choose the independent arithmetic route: compute factors at p|N and show their denominators do not vanish at 2. Do not first derive P-regularity from E-regularity and then use P-regularity to prove E-regularity.

Source: BFH90, §7, p.589, Remark following Proposition 7.1. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Fourier and residue interchange for genuine families

Declaration: `TauCeti.Jacobi.GenusTwo.fourier_residue_interchanges` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/fourier-residue-interchanges`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Residues`.

Let the continued genuine family have locally finite pole divisor in its parameter domain. After multiplying by a local holomorphic denominator, its Fourier integrals on the specified compact quotient tori, the finite theta transform and the absolutely convergent nonzero-discriminant Whittaker/Mellin tails are locally uniformly holomorphic; coefficient extraction commutes with s-residues and derivatives. Infinite theta or D sums may commute with these operations only under the proven Gaussian or rapid-decay majorants. The expanded Novodvorsky kernel is excluded from an unproved joint Fubini interchange.

Construction or proof:

1. Choose a common local pole-clearing denominator in the finite K-type space. Compact-torus Bochner integration is continuous, so differentiated Cauchy integrals commute with it.
2. Use the compact-parameter Gaussian and polynomial-times-Schwartz bounds for the infinite theta and nonzero D sums.
3. Keep the positive Mellin zero-mode integral separate; its explicit primitive produces the displayed polar denominators. Prove each contour shift and use of dominated convergence in its own domain.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-continuation`, `MetaplecticAutomorphicForms:MP.8/theta-normal-convergence`, `MetaplecticAutomorphicForms:MP.8/whittaker-rapid-decay`, `MetaplecticAutomorphicForms:MP.8/novodvorsky-continuation`, `MetaplecticAutomorphicForms:MP.8/opposite-cusp-zero-regularity`.

Acceptance:

- Residues are coefficientwise only after a common denominator and uniform majorant are provided.

Suggested signature boundary: The native prototype gives the locally dominated holomorphic integral after clearing denominators. Meromorphic residues in the automorphic topology and infinite-sum interchange require AS.2/MP.4 interfaces; these are omitted, not encoded as stored conclusions.

Open proof inputs:

- Cover-specific spectral adaptation and joint meromorphy: BFH pp.601–602 invokes Selberg–Langlands continuation without giving a genuine-cover reduction. Prove the normalized inducing exponent ν=s−2, topology and measure comparison, absolute convergence chamber, long-Weyl intertwiner/reflection 4−s, rank-one cuspidal cancellation and constant-term pole control. Supply locally uniform denominator-cleared estimates for compact Fourier integrals and tail sums and a genuine two-variable meromorphic topology. Native one-variable MeromorphicOn and separate holomorphy do not replace that last input.

Source: BFH90, §8, pp.601–614, proof of Proposition 8.1. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

## Twist series and the polar export

### BFH two-variable twist series

Declaration: `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries` (definition). Node: `MetaplecticAutomorphicForms:MP.8/two-variable-twist-series`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/TwistSeries`.

Define Z^±(u,s;r)=Σ_{D∈Z,±D>0,D≡r² mod 4m/N} L(s,D)|D|^(s−u−5/2), initially for Re u sufficiently large and Re s in the L-series convergence chamber. The integer modulus 4m/N uses N|m and 4m|N². The coefficient L includes the actual first-cusp exponential sums and the original normalized newform f, not an arbitrary list of central L-values.

Construction or proof:

1. Use native integer congruence and positive-base complex powers. Split the two sign sets before summing.
2. Prove a common initial chamber from coefficient growth. Meromorphic continuation is the polar-combination theorem, not part of the definition.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/bfh-l-dirichlet-series`, `MetaplecticAutomorphicForms:MP.8/squarefactor-polynomial-bound`.

Uses:

- BFH §8, pp.601–614, Proposition 8.1: Uses bfh two-variable twist series in bfh two-variable polar combination: Put A=(4m)^(−s+u+5/2)N^(−s+4+k/2)[Z⁺ TF⁺(u,s;N⁻¹y₂)+Z⁻ TF⁻(u,s;N⁻¹y₂)]. It continues meromorphically to Re s>3/2, Re u>0 and Re u>Re s−5/2. Near (u,s)=(1/2,2), A minus the following sum is jointly holomorphic: −N^(−s+4+k/2)L(s,0)TM(s,N⁻¹y₂)/(u−s+5/2) + N^(7−s−k/2)P(s,0,r)y₂^(2s−5)TM̃(s,N⁻¹y₂)/(u+s−5/2) + N^−s y₂^(3−s+k
- RankZeroOneBSD:BSD.2: Consumes the exact BFH coefficient/polar-formula data after the comparisons stated in this packet.

API:

- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_scalar` (functoriality): Scaling the elliptic seed scales both Z series.
- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_congruence` (characterisation): Only D≡r² modulo 4m/N occurs.
- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_sign` (characterisation): The plus and minus supports are disjoint and exclude D=0.

Unit tests:

- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_zero` (degenerate): The zero coefficient family gives Z⁺=Z⁻=0.
- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_modulus` (computation): N=8,m=16,r=1 permits D≡1 mod8; D=1 and −7 occur in opposite signs.
- `TauCeti.Jacobi.GenusTwo.twoVariableTwistSeries_excluded` (non-example): For that datum D=0,2,−1 are all excluded.

Acceptance:

- D=0 is excluded and must appear separately in the boundary formula.

Source: BFH90, §8, p.601, definition before Proposition 8.1. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### BFH two-variable polar combination

Declaration: `TauCeti.Jacobi.GenusTwo.two_variable_polar_combination` (theorem). Node: `MetaplecticAutomorphicForms:MP.8/two-variable-polar-combination`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/PolarFormula`.

Planet: **BFH two-variable polar formula**.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

Put A=(4m)^(−s+u+5/2)N^(−s+4+k/2)[Z⁺ TF⁺(u,s;N⁻¹y₂)+Z⁻ TF⁻(u,s;N⁻¹y₂)]. It continues meromorphically to Re s>3/2, Re u>0 and Re u>Re s−5/2. Near (u,s)=(1/2,2), A minus the following sum is jointly holomorphic: −N^(−s+4+k/2)L(s,0)TM(s,N⁻¹y₂)/(u−s+5/2) + N^(7−s−k/2)P(s,0,r)y₂^(2s−5)TM̃(s,N⁻¹y₂)/(u+s−5/2) + N^−s y₂^(3−s+k/2)Tτ(s,N⁻¹y₂)/(u−s+3/2). Every term uses the continued scalar transforms and fixed BFH test vector. This is joint holomorphy in two complex variables, not a collection of separate one-variable statements.

Construction or proof:

1. Rewrite the Novodvorsky transform of the genuine Fourier–Jacobi components with exact x₁,x₃,x₄ periods, using Propositions 2.5–2.7. Prove the Fourier inversion identities (8.5),(8.7),(8.9) with their finite theta phases.
2. Split the positive y₁ integral at 1. The nonzero-D large tail is jointly holomorphic by polynomial coefficient bounds and Whittaker rapid decay.
3. Use the lower-unipotent/Fourier transformation for the small tail. Its three zero modes integrate to the three displayed linear polar denominators; the remaining terms are normally convergent.
4. Clear the local s pole denominator before every continuation interchange, then use the proven E regularity and coefficient regularity near 2.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/two-variable-twist-series`, `MetaplecticAutomorphicForms:MP.8/first-cusp-whittaker-expansion`, `MetaplecticAutomorphicForms:MP.8/opposite-cusp-whittaker-expansion`, `MetaplecticAutomorphicForms:MP.8/degenerate-mellin-coefficients`, `MetaplecticAutomorphicForms:MP.8/tau-transform`, `MetaplecticAutomorphicForms:MP.8/fourier-residue-interchanges`, `MetaplecticAutomorphicForms:MP.8/opposite-cusp-zero-regularity`.

Acceptance:

- The three denominators are distinct functions of (u,s).
- The second and third polar divisors meet at (1/2,2); cancellation must be tested by the consuming BSD.2 argument, not asserted here.

Suggested signature boundary: The native signature uses local holomorphic numerator/denominator charts on C². All raw coefficient and transform arguments must be the actual continued BFH family with a single finite K-type and proven tail bounds; these absent supplier conditions are omitted.

Open proof inputs:

- Cover-specific spectral adaptation and joint meromorphy: BFH pp.601–602 invokes Selberg–Langlands continuation without giving a genuine-cover reduction. Prove the normalized inducing exponent ν=s−2, topology and measure comparison, absolute convergence chamber, long-Weyl intertwiner/reflection 4−s, rank-one cuspidal cancellation and constant-term pole control. Supply locally uniform denominator-cleared estimates for compact Fourier integrals and tail sums and a genuine two-variable meromorphic topology. Native one-variable MeromorphicOn and separate holomorphy do not replace that last input.

Source: BFH90, §8, pp.601–614, Proposition 8.1. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

### Genus-two coefficient and local-test export

Declaration: `TauCeti.Jacobi.GenusTwo.bsd2_export` (comparison). Node: `MetaplecticAutomorphicForms:MP.8/bsd2-export`. Suggested module: `TauCeti/NumberTheory/Jacobi/GenusTwo/Eisenstein/Export`.

Hypotheses: The arithmetic BFH datum has a normalized elliptic newform f of even weight k≥2, trivial character and conductor M; 8M|N, N|m, 4m|N², with N,m>0. The auxiliary Fricke transform uses N; the original newform completion uses M. The seed is built from the specified finite-dimensional continuous K=U(2) representation σ, its SO(2) weight-k vector v, and the stated cusp covariance. Scalar formulas apply a continuous linear functional T to that vector family.

Export the exact first-cusp coefficients, unramified local factor ratio, squarefactor bound, jointly meromorphic polar combination, allowed derivative/residue interchanges and the three existential finite K-type tests. With AL.3 identify L(s,D₀)=L_N(s+k/2−2,f⊗χ_{D₀})/L_N(2s+k−4,Sym²f) for fundamental D₀, and L(s,0)=L_N(2s+k−5,Sym²f)/L_N(2s+k−4,Sym²f). At the permitted datum m=N rad(N),r=1, this is the analytic genus-two input to RankZeroOneBSD:BSD.2. The final twist residues, positivity, noncancellation, simultaneous local conditions and infinitude of fundamental twists belong to BSD.2.

Construction or proof:

1. Identify the incomplete Euler products with the AL.3 native analytic L-function interface, retaining omitted primes p|N and the exact shifted arguments.
2. Bundle the already stated theorems as an import contract to BSD.2; do not assume its nonvanishing conclusion or add a reverse dependency.
3. Check N|m and 4m|N² for the actual §9 choice before specializing the congruence support.

Direct dependencies: `MetaplecticAutomorphicForms:MP.8/unramified-euler-factors`, `MetaplecticAutomorphicForms:MP.8/squarefactor-polynomial-bound`, `MetaplecticAutomorphicForms:MP.8/two-variable-polar-combination`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-f`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-tau`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-m`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Acceptance:

- At s=2 the first numerator is the central value L_N(k/2,fχ).
- The s-derivative brings the precise quotient derivative, not only the derivative of its numerator.

Suggested signature boundary: The native numerical signature checks ν=s−2 and Weyl reflection 4−s. The full export uses continued newform/twist/symmetric-square functions and the consumer interfaces that are absent at the baseline; the actual coefficient-ratio formulas remain definitive in the packet.

Source: BFH90, §7, pp.588–589, Proposition 7.1; §9, pp.614–617. Evidence relationship: The inspected passage supplies this genus-two specialization; hypotheses and normalization are retained. Minor algebra stays in the proof outline.

## Supplier contracts

These are imports from their owners. The requests specify the exact interfaces MP.8 needs; they do not re-plan those theories here.

### `MetaplecticAutomorphicForms:MP.1`

Intrinsic rank-two real metaplectic extension, kernel sign, generator lifts and continuous central-extension topology, to compare with the actual square-root cover of GSp₄⁺.

Needed by: `MetaplecticAutomorphicForms:MP.8/similitude-cover`, `MetaplecticAutomorphicForms:MP.8/arithmetic-adelic-comparison`.

### `MetaplecticAutomorphicForms:MP.2`

Schrödinger–Weil operators for a rank-two symplectic real space with the specified e(t), self-dual measures and Fourier phase. Supply the generator relations used to compare the finite theta S-matrix.

Needed by: `MetaplecticAutomorphicForms:MP.8/theta-fourier-transform`, `MetaplecticAutomorphicForms:MP.8/arithmetic-adelic-comparison`, `MetaplecticAutomorphicForms:MP.8/theta-normal-convergence`.

### `MetaplecticAutomorphicForms:MP.4`

Rank-two adelic restricted product, rational splitting on Sp₄(Q), self-dual local measures and finite lattice-vector stabilizers, including the dyadic compact-open splitting at level 8M|N. MP.8 uses these existing local/global metaplectic inputs to construct and verify the additional rational-similitude extension and BFH arithmetic comparison.

Needed by: `MetaplecticAutomorphicForms:MP.8/full-real-cover`, `MetaplecticAutomorphicForms:MP.8/arithmetic-adelic-comparison`.

### `MetaplecticAutomorphicForms:MP.6`

Under confirmed RT-AREA-automorphic-1/20, supply general H(W)⋊Sp(W), the Schrödinger–Weil action, Jacobi weight/index/multiplier spaces, Fourier–Jacobi extraction and theta decomposition before MP.7. MP.8 imports these and proves only the BFH genus-two arithmetic and similitude specializations; positive similitudes transport the central index.

Needed by: `MetaplecticAutomorphicForms:MP.8/arithmetic-subgroup`, `MetaplecticAutomorphicForms:MP.8/bfh-slash`, `MetaplecticAutomorphicForms:MP.8/bfh-translation`, `MetaplecticAutomorphicForms:MP.8/genus-two-theta`, `MetaplecticAutomorphicForms:MP.8/theta-decomposition`, `MetaplecticAutomorphicForms:MP.8/theta-fourier-transform`, `MetaplecticAutomorphicForms:MP.8/bfh-jacobi-specialization`, `MetaplecticAutomorphicForms:MP.8/jacobi-eisenstein`, `MetaplecticAutomorphicForms:MP.8/similitude-heisenberg-comparison`.

### `AutomorphicFormsOnReductiveGroups:AF.5`

Classical-to-automorphic GL₂/Q dictionary for a normalized holomorphic newform, preserving weight k, trivial central character, conductor M, Hecke eigenvalues and auxiliary Fricke/cusp transforms at N. Import AF.1 for real globalization and GL₂ R16.2 for the finite conductor vector; MP.8 does the genuine-cover comparison.

Needed by: `MetaplecticAutomorphicForms:MP.8/bfh-seed`.

### `AutomorphicLFunctionsAndLocalFactors:AL.3`

GL₂ Hecke/Satake factors, twisted L-functions and the symmetric-square factor extracted from Rankin–Selberg, including their completed/partial conventions and nonvanishing of the precise symmetric-square denominator near s=2. Supply the hypotheses for translating BFH local products into global ratios; MP.8 does the BFH comparison.

Needed by: `MetaplecticAutomorphicForms:MP.8/unramified-euler-factors`, `MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-continuation`, `MetaplecticAutomorphicForms:MP.8/opposite-cusp-zero-regularity`, `MetaplecticAutomorphicForms:MP.8/bsd2-export`.

### `AutomorphicSpectralTheory:AS.1`

Normalized induced spaces, Haar measures, a quantified convergence chamber and compact-uniform differentiated Sobolev estimates for linear Siegel Eisenstein families. MP.8 proves the finite-cover genuine-section reduction with ν=s−2 and the Gaussian lattice majorant before invoking these bounds.

Needed by: `MetaplecticAutomorphicForms:MP.8/whittaker-rapid-decay`, `MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison`, `MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-initial-convergence`, `MetaplecticAutomorphicForms:MP.8/opposite-cusp-zero-regularity`.

### `AutomorphicSpectralTheory:AS.2`

Source/target induced topologies, meromorphic standard intertwiners, normalization, singular hyperplanes, constant-term uniqueness and residue estimates. MP.8 proves their adaptation to its genuine GSp₄ double cover, contragredient cusp datum and Fourier/residue interchanges.

Needed by: `MetaplecticAutomorphicForms:MP.8/genuine-intertwining-operators`, `MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-continuation`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`

Uniform matrix-coefficient density on U(2), finite-dimensional tensor-product closure and projection to the prescribed left SO(2) weight. These are imported inputs to the BFH test-coefficient ring, not new Peter–Weyl nodes.

Needed by: `MetaplecticAutomorphicForms:MP.8/test-coefficient-algebra`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`

Good-prime Hecke recurrence a(p^{j+1})=a(p)a(p^j)−p^(k−1)a(p^{j−1}) for trivial character and coprime multiplicativity. The coefficient-growth bound belongs to upstream ModularForms layer 7.

Needed by: `MetaplecticAutomorphicForms:MP.8/bfh-l-dirichlet-series`, `MetaplecticAutomorphicForms:MP.8/unramified-euler-factors`, `MetaplecticAutomorphicForms:MP.8/squarefactor-polynomial-bound`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`

Native normalized Newform at conductor M, actual cusp function, a(1)=1, eigenform/newness and all-n Fourier coefficients. No opaque record of supplied L-values or vanishing Fourier invariants.

Needed by: `MetaplecticAutomorphicForms:MP.8/bfh-seed`, `MetaplecticAutomorphicForms:MP.8/bfh-l-dirichlet-series`, `MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`

Fricke and arbitrary-cusp transforms of the original weight-k newform, their coefficient functions and exact slash normalization. Original completion/Fricke involution uses M; f̂(τ)=τ^(−k)f(−1/(Nτ)) uses auxiliary N.

Needed by: `MetaplecticAutomorphicForms:MP.8/bfh-seed`, `MetaplecticAutomorphicForms:MP.8/bfh-p-dirichlet-series`, `MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`

Convergent native Dirichlet series, the distinct continued newform/twist L-function, Euler products, completed Mellin transform and conductor-M functional equation. The raw totalized sum is not its continuation outside convergence. Also supply the normalized coefficient bound a(p^j)≪p^{j(k/2−1/5)} used at BFH p.600, or a stronger applicable bound, with its hypotheses and constants for the fixed newform.

Needed by: `MetaplecticAutomorphicForms:MP.8/unramified-euler-factors`, `MetaplecticAutomorphicForms:MP.8/squarefactor-polynomial-bound`.

### `AutomorphicFormsOnReductiveGroups:AF.1`

Smooth globalization of finite K-types and compact-convolution smoothing with differentiation/Sobolev control. This is the real representation input to the JPSS §8.3.3 Whittaker decay comparison, whose exact cited passage remains a gap; AS.1 supplies the separate Eisenstein estimates.

Needed by: `MetaplecticAutomorphicForms:MP.8/whittaker-rapid-decay`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.2`

GL₂ conductor/newvector theorem for the finite representation associated through AF.5 to the conductor-M normalized newform, including congruence-invariant vector normalization at ramified and dyadic places. MP.8 must compare that vector with the auxiliary BFH level N.

Needed by: `MetaplecticAutomorphicForms:MP.8/bfh-seed`, `MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison`.

## Proof repairs and unresolved inputs

Each item below is an open obligation. Completing the roadmap mathematically requires its construction or proof, with the specified source and signature comparisons. An omitted source proof, a finite computation or an elaborated suggested signature supplies no substitute.

### Rank-two adelic and similitude comparison

The exact MP.4 rational/finite-place splitting and its extension to Qˣ similitudes have not been established here. Specify the finite theta lattice vector and dyadic compact-open lift at 8M|N, compare its real square-root multiplier including the J phase, and identify it with the MP.6 native Jacobi model. The real reflection extension is a chosen explicit extension, not evidence that an adelic GSp cover is canonically split.

Needed by: `MetaplecticAutomorphicForms:MP.8/arithmetic-adelic-comparison`, `MetaplecticAutomorphicForms:MP.8/similitude-heisenberg-comparison`, `MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison`.

### Confluent Whittaker integral identities

BFH pp.560–565 uses Gradshteyn–Ryzhik 3.384.9 and 9.237 for the confluent Whittaker integral, its symmetry and gamma normalization. Those source entries have not been read. Establish their exact convergence domains, branch and continuation identity; retain the distinction between V holomorphy and gamma-normalized W meromorphy.

Needed by: `MetaplecticAutomorphicForms:MP.8/jacquet-r-reflection`, `MetaplecticAutomorphicForms:MP.8/jacquet-weyl-reflection`, `MetaplecticAutomorphicForms:MP.8/whittaker-continuation`.

### Compact convolution growth estimates

BFH Propositions 3.5–3.6 invoke Jacquet–Piatetski-Shapiro–Shalika section 8.3.3 for compact-convolution nondegenerate rapid decay and the degenerate polynomial bound. That passage has not been inspected. Supply its representation, differentiation, uniform parameter and Sobolev hypotheses, including why W⁰ has only the asserted y₂ decay.

Needed by: `MetaplecticAutomorphicForms:MP.8/whittaker-rapid-decay`, `MetaplecticAutomorphicForms:MP.8/rotated-whittaker-bound`.

### Primitive pair completion and rank-one normal form

BFH p.577 cites Maass section 11 for completion of an integral primitive symmetric pair, and p.587 cites Maass p.160 for rank-one normal form. These passages are unread. The target includes full row rank and CDᵀ=DCᵀ, not CᵀD symmetry. Prove the integral completion and the exact congruence/coset reductions or verify those sources.

Needed by: `MetaplecticAutomorphicForms:MP.8/primitive-symplectic-pairs`, `MetaplecticAutomorphicForms:MP.8/cusp-one-unfolding`, `MetaplecticAutomorphicForms:MP.8/cusp-zero-rank-expansion`.

### Degenerate Bessel formula and residue test

BFH Inventiones Proposition 3.14 (pp.575–576) directs its omitted Bessel calculation to section 5 of the distinct BFH Annals 131 (1990), 53–127 paper, DOI 10.2307/1971508. Only that paper’s publisher metadata has been inspected. Read its formula, reconcile k,s,y₂ and measures with W⁰, and give the explicit finite K-type construction proving Proposition 3.15, whose proof Inventiones also omits.

Needed by: `MetaplecticAutomorphicForms:MP.8/degenerate-mellin-coefficients`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-m`.

### Ramified opposite-cusp regularity

The argument asserted and omitted at BFH p.589 must establish P(s,0,r) regular near 2 and polynomial coefficient growth for the actual ramified cusp data. Choose the independent arithmetic route: compute factors at p|N and show their denominators do not vanish at 2. Do not first derive P-regularity from E-regularity and then use P-regularity to prove E-regularity.

Needed by: `MetaplecticAutomorphicForms:MP.8/opposite-cusp-zero-regularity`, `MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-continuation`.

### Cover-specific spectral adaptation and joint meromorphy

BFH pp.601–602 invokes Selberg–Langlands continuation without giving a genuine-cover reduction. Prove the normalized inducing exponent ν=s−2, topology and measure comparison, absolute convergence chamber, long-Weyl intertwiner/reflection 4−s, rank-one cuspidal cancellation and constant-term pole control. Supply locally uniform denominator-cleared estimates for compact Fourier integrals and tail sums and a genuine two-variable meromorphic topology. Native one-variable MeromorphicOn and separate holomorphy do not replace that last input.

Needed by: `MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison`, `MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-initial-convergence`, `MetaplecticAutomorphicForms:MP.8/genuine-intertwining-operators`, `MetaplecticAutomorphicForms:MP.8/genuine-constant-term`, `MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-continuation`, `MetaplecticAutomorphicForms:MP.8/fourier-residue-interchanges`, `MetaplecticAutomorphicForms:MP.8/two-variable-polar-combination`.

### Global compact rotation and uniform majorant

Repair the false published (3.31) global-to-chart equality: compute the residual compact transition on both signs of 1+zx₁, retain φ₁(q)=det(Im q) globally and show divisibility at the boundary. Prove a z-uniform integrable majorant for the actual kernel (3.38), including its prefactor, for compact s-sets in Re s>3/2. The rational coordinate map and signed determinant calculation alone do not prove the stated rotated bound or its subsequent continuation consequences.

Needed by: `MetaplecticAutomorphicForms:MP.8/rotated-whittaker-bound`, `MetaplecticAutomorphicForms:MP.8/novodvorsky-continuation`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-f`, `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-tau`.

### Nonzero even Laplace pushforward

For the rank-zero τ test, construct an actual finite K-coefficient with the prescribed SO(2) weight and global divisor whose even pushforward under z↦√(1+z²), including the branch/amplitude factors, is nonzero. Establish its weighted integrability before applying Laplace injectivity. A nonzero restriction in z is insufficient because odd contributions cancel. Peter–Weyl localization must respect both weight and divisor.

Needed by: `MetaplecticAutomorphicForms:MP.8/local-test-nonzero-tau`.

## Adjudicated source issues

The following descriptions are in our own words. Their confirmed verdicts are retained from the independent review. They concern the cited local statements and proof steps, and make no claim against the paper’s final nonvanishing theorem. The packet retains the dated searches for existing corrections; no priority or exhaustive-absence claim is made.

### `MetaplecticAutomorphicForms/E-MP8-2` — error

Locator: Published Invent. Math.102(1990), §1, p.548, paragraph defining K.

Authored problem summary: The p.548 stabilizer description omits the positive scalar factor when the acting group is GSp₄⁺.

Correction: K=GSp⁺(4,R)∩O(4) is the stabilizer in Sp(4,R). In GSp⁺(4,R), the stabilizer is R_{>0}·K, with the positive scalar matrices included.

Reason: Take g=2I₄. Then gᵀJg=4J, so g∈GSp⁺, and (2iE)(2E)⁻¹=iE; but gᵀg=4I₄, so g is not in O(4) or K. For the full corrected description, normalize a positive-similitude stabilizer by μ(g)^(−1/2) and use its symplectic stabilizer equations. Equation (1.14) already treats central scalars separately.

Affects: a stated result. Review: **confirmed**, `REV-MetaplecticAutomorphicForms--MP.8`.

### `MetaplecticAutomorphicForms/E-MP8-3` — misprint

Locator: Published Invent. Math.102(1990), §1, p.550, (1.21) and the completion immediately before (1.22).

Authored problem summary: The original conductor-M newform is given an auxiliary-N Fricke and completion normalization on p.550.

Correction: For the original normalized newform f of level M, replace N by M in its Fricke equation and its completed L-function. Keep the level N in the separately defined transform f̂(τ)=τ^(−k)f(−1/(Nτ)) on p.547.

Reason: The introduction p.543 uses M, and the twisted completion (1.24) on p.551 uses D²M. If one sets Λ_N=(N/M)^(s/2)Λ_M, the functional equation gains the factor (N/M)^(s−k/2). As a direct Fricke check, the weight12 level1 discriminant form at N=8 satisfies Δ(−1/(8τ))=(8τ)^12Δ(8τ); the printed formula would instead require 8^6τ^12Δ(τ), contradicted by the leading powers of q as Im(τ)→∞. This is a normalization slip, not a counterexample to the paper’s main nonvanishing theorem.

Affects: the proof. Review: **confirmed**, `REV-MetaplecticAutomorphicForms--MP.8`.

### `MetaplecticAutomorphicForms/E-MP8-4` — error

Locator: §3, p.568, Proposition 3.9.

Authored problem summary: Proposition 3.9 uses a one-sided imaginary-part condition whose region contains the branch singularity −i.

Correction: Use the bounded strip |Im x₁|≤ε with 0<ε<1, or the upward closed half-strip 0≤Im x₁≤ε sufficient for the later contour shift.

Reason: With x₃=x₄=0, the explicit coefficient φ₁ from (3.29) is (1+x₁²)^(−1/2), singular at x₁=−i. That point lies in the printed one-sided region for every ε>0. Both factors stay away from zero on the corrected bounded strip; the complexified matrix-coefficient proof must retain that branch domain.

Affects: a stated result. Review: **confirmed**, `REV-MetaplecticAutomorphicForms--MP.8`.

### `MetaplecticAutomorphicForms/E-MP8-5` — misprint

Locator: §8, p.602, Proposition 8.1, displayed definition of A.

Authored problem summary: The nondegenerate transforms in (8.1) and (8.3) have an unscaled second argument although the unfolding and evaluated terms require N⁻¹y₂.

Correction: The transform argument in A is N⁻¹y₂: TF^±(u,s,N⁻¹y₂), matching the scaled M, M̃ and τ boundary terms.

Reason: At n₂=N⁻¹, Proposition 6.1 has Whittaker second argument N⁻¹y₂. Its substitution into the Novodvorsky integral and the (8.4) variable change give TF(u,s,N⁻¹y₂), with N^(−s+4+k/2) outside. Both the displayed A in (8.1) and the printed left side of (8.3) omit N⁻¹, whereas the evaluated boundary terms on p.603 carry it. This is an argument-normalization discrepancy, not a refutation of the nonvanishing theorem.

Affects: a stated result. Review: **confirmed**, `REV-MetaplecticAutomorphicForms--MP.8`.

### `MetaplecticAutomorphicForms/E-MP8-6` — error

Locator: Published Invent. Math.102(1990), §3, p.562, normalizer immediately before Proposition 3.4; compare p.565 (3.26)–(3.27).

Authored problem summary: The sign-dependent p.562 gamma product does not cancel the inverse factors in the evaluated integrals on p.565.

Correction: For + use Γ((s−r+n)/2)Γ((s+r+n+1)/2); for − use Γ((s−r−n−1)/2)Γ((s+r−n)/2).

Reason: The evaluated positive-sign integral in (3.26) has inverse Γ((s−r+n)/2); the negative-sign integral in (3.27) has inverse Γ((s−r−n−1)/2). Multiplication by the corrected pair cancels that inverse factor, leaving Γ((s+r+n+1)/2) or Γ((s+r−n)/2), exactly the remaining factors in the two V̂ displays on p.565. The p.562 printed normalizer does not yield those displays. This verifies the corrected pair; the confluent-function continuation and reflection proof remains subject to the recorded source gap.

Affects: a stated result. Review: **confirmed**, `REV-MetaplecticAutomorphicForms--MP.8`.

### `MetaplecticAutomorphicForms/E-MP8-7` — error

Locator: Published Invent. Math.102(1990), §3, p.569, (3.31),(3.35); p.570 (3.38).

Authored problem summary: The compact product is identified globally with its positive chart substitution, and boundary vanishing is asserted without the necessary divisor condition.

Correction: Evaluate the actual global compact product; introduce its residual compact transition in the chart. The global divisor has signed factor (1+zx₁)/Δ_z, whereas its chart value has |1+zx₁|/Δ_z.

Reason: A constant compact coefficient equals 1 at the chart boundary, contradicting the claimed zero for arbitrary coefficients. More decisively, the allowed global weight-zero coefficient φ₁=det(Im q) at X=diag(0,−2),z=1 equals −1/√10 after right rotation, while its positive chart formula at X(z)=diag(0,3) equals +1/√10. Thus the chart substitution also fails away from the boundary. Global divisibility gives boundary vanishing but does not remove the missing transition on the negative branch.

Affects: the proof. Review: **confirmed**, `REV-MetaplecticAutomorphicForms--MP.8`.

### `MetaplecticAutomorphicForms/E-MP8-8` — misprint

Locator: Published Invent. Math.102(1990), §7, p.592, (7.10), mixed congruence modulus.

Authored problem summary: The mixed congruence in (7.10) uses exponents a,b instead of a,d from the preceding matrix parametrization.

Correction: Use p^min(a,d), leaving Lemma 7.3’s table unchanged.

Reason: The preceding p.591 matrix parametrization takes x₀ modulo α₁β₃δ₂; its finite character sum yields the mixed modulus min(a,d). At p=3,m=16,N=8,r=1,n₁=0,a=b=2,d=1 there are six solutions (λ₁∈{0,3,6},λ₂∈{0,1}); the printed modulus gives two, contradicting the table’s N₂=2p. Direct enumeration with the corrected modulus matches all 2,016 small cases tested against the unchanged table. This finite check supplements the matrix derivation.

Affects: a stated result. Review: **confirmed**, `REV-MetaplecticAutomorphicForms--MP.8`.

### `MetaplecticAutomorphicForms/E-MP8-9` — misprint

Locator: Published Invent. Math.102(1990), §5, p.582, displayed definition of S₀.

Authored problem summary: The S₀ summation identifies D only modulo NC instead of the C-period required by its unfolding.

Correction: Use D mod C, with the same primitive and congruence restrictions.

Reason: The three period-one symmetric X-coordinate integrations identify C⁻¹D modulo integral symmetric translations, hence D modulo CS. The phases are invariant under those shifts. Since C≡0 mod N, D₁₂ mod N and the determinant condition are also preserved. Quotienting only by NCS repeats every class N³ times and disagrees with the unfolding normalization; the packet already uses the corrected modulus.

Affects: a stated result. Review: **confirmed**, `REV-MetaplecticAutomorphicForms--MP.8`.

## Native baseline and source record

Pinned statements, read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

- `mathlib:QuadraticMap` (structure, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): Native quadratic maps with degree-two scaling and a bilinear companion.

- `mathlib:QuadraticForm` (abbrev, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): Native scalar-valued quadratic maps; over Z on Z² these encode integral binary quadratic polynomials, hence half-integral symmetric matrices.

- `mathlib:QuadraticMap.ext` (theorem, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): Quadratic forms are equal if their values are equal on every vector.

- `mathlib:QuadraticMap.congr_fun` (theorem, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): Equality of quadratic maps implies equality at every input.

- `mathlib:QuadraticMap.map_smul` (theorem, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): A quadratic map sends a·x to a² times its value at x.

- `mathlib:QuadraticMap.linMulLin` (def, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): The product of two linear forms is a native quadratic map.

- `mathlib:QuadraticMap.linMulLin_apply` (theorem, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): The product quadratic map evaluates to the product of the two linear-form values.

- `mathlib:QuadraticMap.proj` (def, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): The native coordinate quadratic form x↦x_i x_j, used in mixed-term tests.

- `mathlib:QuadraticMap.proj_apply` (theorem, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): Coordinate quadratic-form evaluation is x_i x_j.

- `mathlib:QuadraticMap.sum_repr_sq_add_sum_repr_mul_polar` (theorem, `Mathlib/LinearAlgebra/QuadraticForm/Basis.lean`): A quadratic map expands in diagonal basis values and unordered off-diagonal polar terms, without assuming that 2 is invertible.

- `mathlib:QuadraticMap.toBilin` (def, `Mathlib/LinearAlgebra/QuadraticForm/Basis.lean`): An ordered basis gives an upper-triangular bilinear representative over Z; symmetry and division by 2 are not required.

- `mathlib:QuadraticMap.toQuadraticMap_toBilin` (theorem, `Mathlib/LinearAlgebra/QuadraticForm/Basis.lean`): The quadratic map of the ordered-basis bilinear representative is the original map.

- `mathlib:dotProductBilin` (def, `Mathlib/LinearAlgebra/Matrix/ToLin.lean`): The coordinate dot product packaged as a bilinear map; fixing R∈Z² gives the linear functional x↦R·x. This declaration is in the root namespace.

- `mathlib:Int.ModEq` (def, `Mathlib/Data/Int/ModEq.lean`): Congruence of integers modulo an integer, including negative and zero moduli.

- `mathlib:Int.modEq_iff_dvd` (theorem, `Mathlib/Data/Int/ModEq.lean`): R_i≡R′_i modulo 2a iff 2a divides R′_i−R_i, giving the integral shift parameter.

- `mathlib:mul_left_cancel₀` (theorem, `Mathlib/Algebra/GroupWithZero/Defs.lean`): Cancel a nonzero left factor; applied in Z to 4a and 2a.

- `mathlib:Matrix.symplecticGroup` (def, `Mathlib/LinearAlgebra/SymplecticGroup.lean`): Boundary only: matrices satisfying AJAᵀ=J, as a submonoid. This is neither a similitude group nor its double cover.

- `mathlib:SemidirectProduct` (structure, `Mathlib/GroupTheory/SemidirectProduct.lean`): Boundary only: the native group semidirect product from a specified homomorphism into automorphisms; it does not construct the Heisenberg group or its similitude action.

- `mathlib:Matrix.PosDef` (def, `Mathlib/LinearAlgebra/Matrix/PosDef.lean`): Hermitian matrix with strictly positive finitely supported quadratic evaluation; over finite real indices this gives positive dot-product evaluation on every nonzero vector.

- `mathlib:Matrix.unitaryGroup` (abbrev, `Mathlib/LinearAlgebra/UnitaryGroup.lean`): Native unitary matrices as a submonoid with a group structure; specializes to U(2) without re-planning compact-group structure.

- `mathlib:jacobiTheta₂` (def, `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean`): The native two-variable classical theta sum Σ_n exp(2πinz+πin²τ); the genus-two diagonal test reduces to two such sums.

- `mathlib:ArithmeticFunction.moebius` (def, `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`): Integer-valued scalar Möbius function: (−1)^cardFactors for squarefree n, otherwise zero; μ₂ uses it on positive Smith coefficients.

- `mathlib:Submodule.exists_smith_normal_form_of_le` (theorem, `Mathlib/LinearAlgebra/FreeModule/PID.lean`): For submodules N≤O of a finite free module over a PID, obtains bases with each N-basis vector a_i times an O-basis vector. The statement does not itself impose a_i|a_j; the binary content/product argument fixes the needed ordered invariants.

- `tauceti:TauCeti.choleskyEquiv` (def, `TauCeti/LinearAlgebra/Matrix/Cholesky/Equiv.lean`): Equivalence of real positive-definite matrices with lower triangular matrices of positive diagonal, with LLᵀ as Gram map and uniqueness. Reverse the two coordinate indices to obtain the BFH upper-triangular Q with Y=QQᵀ.

- `mathlib:Matrix.toLin'` (def, `Mathlib/LinearAlgebra/Matrix/ToLin.lean`): Native linear equivalence from a finite matrix to its coordinate linear map, evaluating as multiplication of the matrix by a column vector.

- `mathlib:MeromorphicOn` (def, `Mathlib/Analysis/Meromorphic/Basic.lean`): Pointwise meromorphic-at predicate on a set in a nontrivially normed field. It supplies scalar one-complex-variable slices, not a two-complex-variable meromorphic API.

- `mathlib:integral_gaussian` (theorem, `Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean`): Root-namespace real Gaussian integral ∫ exp(−b x²)=√(π/b); positive b gives the analytic formula used after Cholesky/Fubini.

- `mathlib:integrable_exp_neg_mul_sq` (theorem, `Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean`): Root-namespace integrability of exp(−b x²) for b>0, needed before Gaussian Fubini and change of variables.

BFH90: Daniel Bump, Solomon Friedberg and Jeffrey Hoffstein, *Nonvanishing theorems for L-functions of modular forms and their derivatives*, Inventiones mathematicae 102 (1990), 543–618; published scan, DOI 10.1007/BF01233440. [Public published scan](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf). SHA-256: `d50ad2f11c992591de90f2cea59489ac436cce455e140e6eebf5053f49819f2c`. The mathematical catalogue gives theorem/equation and printed-page locators. The source record distinguishes the preceding full-paper reads from the selective 2026-10-07 formula rechecks. The Annals paper cited for the omitted degenerate Bessel calculation is a distinct source whose text has not been inspected here.

## Coverage and next mathematical work

`MetaplecticAutomorphicForms:MP.8` remains **planned**. All 85 nodes remain **unchecked**. The planning pass is complete; the supplier requests, signature boundaries and nine proof/source gaps above define the remaining work. Complete the arithmetic and compact-analytic repairs before the spectral comparison and joint polar formula; BSD.2 then supplies the final nonvanishing argument.
